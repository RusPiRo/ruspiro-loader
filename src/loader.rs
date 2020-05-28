/***************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **************************************************************************************************/

//! # Bootloader
//!

extern crate alloc;
extern crate ruspiro_allocator;
use alloc::vec::Vec;

use crate::mmu;
use ruspiro_cache as cache;
use ruspiro_interrupt::*;
use ruspiro_lock::*;
use ruspiro_register::system::*;
use ruspiro_singleton::Singleton;
use ruspiro_timer as timer;
use ruspiro_uart::{InterruptType, Uart1};

/// Define singleton Uart1 accessor to ensure safe access from main processing as well as
/// from interrupt handler
static UART: Singleton<Uart1> = Singleton::new(Uart1::new());
/// Semaphore that indicates whether the kernel has been loaded inside the
/// receive interrupt handler
static KERNEL_LOADED: Semaphore = Semaphore::new(0);
static mut KERNEL: Option<Kernel> = None;

/// Storing kernel metadata
#[derive(Debug)]
struct Kernel {
    pub boot_address: u64,
    pub boot_mode: u32,
    pub binary: Vec<u8>,
}

impl Kernel {
    pub const fn new(addr: u64, mode: u32, data: Vec<u8>) -> Self {
        Kernel {
            boot_address: addr,
            boot_mode: mode,
            binary: data,
        }
    }
}

/// the external functions called for the "re-boot" in either aarch32 or aarch64 mode
/// depending on the kernel received
extern "C" {
    fn __boot_64(addr: u64) -> !;
    fn __boot_32(addr: u64) -> !;
}

/// Run the loader until a new kernel binary has been received and
/// begin executing the new kernel
pub fn run() -> ! {
    // Initialize the Uart1
    UART.take_for(|uart| {
        let _ = uart.initialize(250_000_000, 115_200);
        uart.send_string("prepare boot loader...\r\n");
        uart.enable_interrupts(InterruptType::Receive);
    });

    // enable the interrupt for the Uart1
    IRQ_MANAGER.take_for(|irq_mgr| irq_mgr.activate(Interrupt::Aux));
    enable_interrupts();

    UART.use_for(|uart| {
        uart.send_string("waiting ...\r\n");
        uart.send_string(alloc::format!("Sema at {:#x?}\r\n", &KERNEL_LOADED as *const Semaphore).as_str());
        uart.send_string("waiting for a new kernel...\r\n");
    });
    

    loop {
        // wait until the interrupt has signaled that the data has arrived
        KERNEL_LOADED.down();
        disable_interrupts();

        UART.use_for(|uart| {
            uart.send_string("new kernel received, preparing re-boot...\r\n");
        });
        // when getting here the kernel binary has been fully received and the data prepared
        // in KERNEL. It's safe to access this here as the interrupt will no longer concurrently
        // access the same
        let kernel = unsafe { KERNEL.take().unwrap() };
        // copy the retrieved binary to the address it shall be executed from
        UART.use_for(|uart| {
            uart.send_string(
                alloc::format!("copy kernel from {:#x?} to {:#x?}\r\n",
                    kernel.binary.as_ptr(),
                    kernel.boot_address as *mut u8,
                ).as_str()
            );
        });
        unsafe {
            core::ptr::copy_nonoverlapping(
                kernel.binary.as_ptr(),
                kernel.boot_address as *mut u8,
                kernel.binary.len(),
            );
        }
        
        // after we copied the new kernel to the right memory address clean and invalidate the
        // caches to ensure the core sees the latest version of memory and instructions
        cache::cleaninvalidate();

        UART.use_for(|uart| {
            uart.send_string("re-boot in progress ...\r\n");
        });

        // do some arbitrary sleeping before the real re-boot...
        // and print some "progressing points" to enable the host machine to
        // start a terminal program and connect via uart after the data has been transmitted
        for _ in 0..100 {
            UART.use_for(|uart| uart.send_string("."));
            timer::sleep(timer::Useconds(15_000));
        }

        // restore as many stuff into the boot reset state as possible
        // as this deactivates MMU no atomic operations from here
        clean_up_for_reboot(kernel.boot_mode);

        // based on the kernel mode we could either "re-boot" immidiately or
        // we need to switch to aarch32 mode
        match kernel.boot_mode {
            64 => unsafe { __boot_64(kernel.boot_address) },
            32 => unsafe { __boot_32(kernel.boot_address) },
            _ => {
                // well, whatever is requested we cannot handle this here...
                unimplemented!();
            }
        }
    }
}

/// Do some clean up to reset as many as known used registers to their reset values which will make
/// the re-boot from the bootloader compared to a usual cold boot on the device more predictable
fn clean_up_for_reboot(boot_mode: u32) {
    // typically the Pi boots with MMU disabled, so disabled it here before re-booting
    // however, disabling MMU in EL2 when switching to aarch32 has shown that the re-boot
    // process will hang for an unknown reason, so keep it active in aarch32 target boot as this
    // seem to work as expected...
    if boot_mode != 32 {
        mmu::disable_mmu();
    }
}

/// Interrupt handler for the UART1 being triggered once new data was received
///
/// # Safety
///
/// The interrupt handler is treated as "unsafe". It should never call any atomic blocking
/// operation that my deadlock the main processing flow
#[IrqHandler(Aux, Uart1)]
fn uart_handler() {
    UART.use_for(|uart| {
        // when the interrupt is triggered we clearly have data received
        // check if this is the token the host need to send to initiate the transfer
        // but do not block in case there is to less data received
        let mut token: [u8; 8] = [0; 8];
        if let Ok(size) = uart.try_receive_data(&mut token) {
            if size == 8 && &token == b"DEADBEEF" {
                // we got the token, so let the host know that we are ready
                uart.send_string("ACK");
                // as the transfer has been started we can now wait for the next
                // data package containing the size of the kernel to be expected
                // as well as the kernel architecture (aarch32/64). This could be
                // a blocking receive call as this is the only thing to expect next
                let mut metadata: [u8; 5] = [0; 5];
                if uart.receive_data(&mut metadata).is_ok() {
                    // extract the kernel size from the buffer
                    //let tmp: [u8;4] = metadata[0..4];
                    //let size = u32::from_be_bytes(metadata[0..4].try_into().unwrap()) as usize;
                    let size = metadata[0] as usize
                        | (metadata[1] as usize) << 8
                        | (metadata[2] as usize) << 16
                        | (metadata[3] as usize) << 24;
                    // extract the kernel architecture type from the metadata buffer
                    let aarch = metadata[4];
                    // before receiving the binary create the buffer big enough to store the data
                    let mut binary_vec = Vec::<u8>::with_capacity(size);
                    // as the vector creation does not actually allocate memory call resize which
                    // esnures the memory is allocated
                    binary_vec.resize(size, 0);

                    // now inform the host that we are ready to receive the data as the heavylifting
                    // preparation is done
                    uart.send_string("ACK");
                    if uart.receive_data(&mut binary_vec).is_ok() {
                        // let the host know that we have received the whole kernel
                        uart.send_string("ACK");
                        // the whole binary is loaded now so we could leave the interrupt handler
                        // and let the main processing now that it can continue with preparing the
                        // execution of this kernel
                        let kernel = Kernel::new(
                            match aarch {
                                32 => 0x8000,
                                64 => 0x80000,
                                _ => 0x0,
                            },
                            aarch.into(),
                            binary_vec,
                        );
                        KERNEL.replace(kernel);
                        KERNEL_LOADED.up();
                    }
                }
            }
        }
    });
}
