/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: ???
 **********************************************************************************************************************/
#![no_std]
#![no_main]
#![feature(lang_items)]
#![feature(asm)]

//! # Raspberry Pi 64Bit Bootloader
//!

extern crate alloc;
extern crate ruspiro_allocator;

// use the required panic handler and allocation error stubs
mod panic;
mod stubs;

use alloc::vec::Vec;
use ruspiro_gpio::GPIO;
use ruspiro_interrupt::*;
use ruspiro_lock::{DataLock, Semaphore};
use ruspiro_singleton::Singleton;
use ruspiro_timer as timer;
use ruspiro_uart::{InterruptType, Uart1};

static UART: Singleton<Uart1> = Singleton::new(Uart1::new());
static BOOTHINT: Semaphore = Semaphore::new(0);
static BOOTCFG: DataLock<BootConfig> = DataLock::new(BootConfig::new());

struct BootConfig {
    addr: u64,
    mode: u32,
}

impl BootConfig {
    const fn new() -> Self {
        BootConfig { addr: 0, mode: 0 }
    }
}

extern "C" {
    fn __re_boot(boot_address: u64, boot_mode: u32);
}
/// # Safety
///
/// This is the rust entry point called from the boot assembly.
#[export_name = "__rust_entry"]
pub unsafe fn entry() -> ! {
    let pin = GPIO.take_for(|gpio| gpio.get_pin(17)).unwrap().to_output();
    pin.high();

    // initialize the UART1 for logging and data retrival
    UART.take_for(|uart| {
        if uart.initialize(250_000_000, 115_200).is_ok() {
            uart.send_string(
                "########## RusPiRo --------- Bootloader v1.0 --------- ##########\r\n",
            );
            uart.enable_interrupts(InterruptType::Receive);
        } else {
            pin.low(); // indicate UARt issue be clearing the led
        }
    });

    // if UART is ready enable interrupts to be routed for Aux/Uart
    IRQ_MANAGER.take_for(|irq_mgr| {
        irq_mgr.initialize();
        irq_mgr.activate(Interrupt::Aux);
    });
    enable_interrupts();

    //UART.use_for(|uart| uart.send_string("waiting for data to arrive...\r\n"));
    // the boot loader now just waits for the Uart receiving interrupt to be received
    // loads the new kernel in the interrupt handler and restarts the Pi
    loop {
        asm!("wfe"); // ensure the CPU goes to sleep until an interrupt is raised
        BOOTHINT.down(); // if loading a new kernel was successfull this semaphore could be used

        if let Some(boot_cfg) = BOOTCFG.try_lock() {
            // now kick off the new kernel...
            pin.low();
            timer::sleep(1_000_000);
            __re_boot(boot_cfg.addr, boot_cfg.mode);
        }
    }
}

/// # Safety
///
/// Interrupt handler safety could not being guarantied?
#[IrqHandler(Aux, Uart1)]
fn uart1_handler() {
    // use a led to indicate we are receiving data now
    let pin = GPIO.take_for(|gpio| gpio.get_pin(20)).unwrap().to_output();
    pin.high();

    UART.take_for(|uart| {
        // now check for the right token to be passed by the sender
        let mut token: [u8; 8] = [0; 8];
        if let Ok(rx_size) = uart.try_receive_data(&mut token) {
            if rx_size == 8 && &token == b"DEADBEEF" {
                // let the sender know that we are ready to get the data
                uart.send_string("ACK");

                // retrieve the size and aarch type of data we will receive
                let mut buffer: [u8; 5] = [0; 5];
                if uart.receive_data(&mut buffer).is_ok() {
                    let size = (buffer[0] as u32) << 24
                        | (buffer[1] as u32) << 16
                        | (buffer[2] as u32) << 8
                        | (buffer[3] as u32);
                    // prepare the buffer to recieve the kernel
                    let mut kernel = Vec::<u8>::with_capacity(size as usize);
                    // ensure the vec has allocated the required memory
                    kernel.resize(size as usize, 0);
                    // let the sender know we got the size and have prepared
                    // the receiving buffer
                    uart.send_string("ACK");
                    if let Ok(_) = uart.receive_data(&mut kernel) {
                        // when we get here the whole kernel is stored in the byte buffer
                        // so we need to copy this buffer to the original load address based on the
                        // aarch mode. 64 -> 0x80000, 32 -> 0x8000
                        let kernel_bin = kernel.as_ptr();
                        core::ptr::copy(kernel_bin, 0x80000 as *mut u8, size as usize);
                        pin.low();
                        // set the config data for the new kernel
                        let mut boot_cfg = BOOTCFG.try_lock().unwrap();
                        (*boot_cfg).addr = match buffer[4] {
                            32 => 0x8000,
                            64 => 0x80000,
                            _ => 0x0,
                        };
                        (*boot_cfg).mode = buffer[4] as u32; // aarch mode

                        // once we have copied the kernel to the proper address location
                        // start executing there, but we need to leave the IRQ handler first
                        // so signaling this to the "main" processing with a spinlock...
                        BOOTHINT.up();
                    } else {
                        GPIO.take_for(|gpio| gpio.get_pin(21))
                            .unwrap()
                            .to_output()
                            .high();
                    }
                }
            }
        } else {
            uart.send_string(alloc::format!("wrong data: {:?}\r\n", token).as_str());
            // wrong data, clear receive LED
            pin.low();
        }
    });

    GPIO.take_for(|gpio| gpio.free_pin(20));
    GPIO.take_for(|gpio| gpio.free_pin(21));
}

#[no_mangle]
extern "C" fn lit_led(num: u32) {
    //let num: u32 = 17;
    // fsel_num = pin / 10          17 / 10 => 1
    // fsel_shift = (pin % 10)*3    (17 % 10)*3 => 21
    // GPIO_BASE = 0x3F20_0000
    // FSEL1 = 0x3F20_0004
    // SET0 = 0x3F20_001C
    let fsel_num = num / 10;
    let fsel_shift = (num % 10)*3;
    let fsel_addr = 0x3f20_0000 + 4*fsel_num;
    let set_addr = 0x3f20_001c + num/32;
    let mut fsel: u32 = unsafe { core::ptr::read_volatile(fsel_addr as *const u32) };
    fsel &= !(7 << fsel_shift);
    fsel |= 1 << fsel_shift;
    unsafe { core::ptr::write_volatile(fsel_addr as *mut u32, fsel) };

    let set: u32 = 1 << (num & 0x1F);
    unsafe { core::ptr::write_volatile(set_addr as *mut u32, set) };
}

// DEADBEEF
// 0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789
