/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: ???
 **********************************************************************************************************************/

//! # Bootloader
//!

extern crate alloc;
use alloc::vec::Vec;
use core::convert::TryInto;

use ruspiro_interrupt::*;
use ruspiro_lock::*;
use ruspiro_register::system::*;
use ruspiro_singleton::Singleton;
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
    boot_address: u64,
    boot_mode: u32,
    binary: Vec<u8>,
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

/// Run the loader until a new kernel binary has been received and
/// begin executing the new kernel
pub fn run() -> ! {
    // Initialize the Uart1
    UART.take_for(|uart| {
        let _ = uart.initialize(250_000_000, 115_200);
        uart.send_string("prepare boot loader\r\n");
        uart.enable_interrupts(InterruptType::Receive);
    });
    // enable the interrupt for the Uart1
    IRQ_MANAGER.take_for(|irq_mgr| irq_mgr.activate(Interrupt::Aux));
    enable_interrupts();

    UART.use_for(|uart| {
        uart.send_string("waiting for a new kernel...\r\n");
    });

    loop {
        // to safe power sleep the core until an event eg. interrupt arrises
        wfe();
        // wait until the interrupt has signaled that the data has arrived
        KERNEL_LOADED.down();
        disable_interrupts();
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
                    let size = u32::from_be_bytes(metadata[0..4].try_into().unwrap()) as usize;
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
