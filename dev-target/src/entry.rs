/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **********************************************************************************************************************/
#![no_std]
#![no_main]
#![feature(asm, lang_items)]

//! # Rust entry point
//! This part is called immediately after the bootstrap has done its minimal preparation work to
//! allow branching into rust code line
//!

mod loader;
pub mod mmu;
mod panic;

use ruspiro_interrupt::IRQ_MANAGER;
use ruspiro_timer as timer;
use ruspiro_uart::Uart1;

/// Entry point that is called by the bootstrapping code.
///
#[export_name = "__rust_entry"]
pub fn __rust_entry(core: u32) -> ! {
    // ensure that only core 0 is running the bootloader code
    if core != 0 {
        loop {}
    };

    // very first thing is to setup the MMU which allows us to
    // use atomic operations in the upcomming initialization
    mmu::initialize_mmu(core);

    // once MMU is setup we would like to let the outside world know that we are booting
    // so we initialze the uart1 interface with default settings and print some message
    let mut uart = Uart1::new();
    let _ = uart.initialize(250_000_000, 115_200);
    uart.send_string("\r\n########## RusPiRo ---------- Bootloader v1.0 ---------- ##########\r\n");

    // now initialize the interrupt manager
    IRQ_MANAGER.take_for(|irq_mgr| irq_mgr.initialize());

    // spend some time doing nothing as the followup entry point may want to re-initialize the
    // uart and this would interfere the current data transfer of the welcome string that might
    // not yet be finished...(from the device point of view)
    timer::sleep(200_000);
    drop(uart); // release uart recources before calling the boot loader

    // now start the bootloader code
    loader::run();
}
