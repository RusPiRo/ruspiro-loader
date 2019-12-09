/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache 2.0
 **********************************************************************************************************************/
#![no_std]
#![no_main]
#![feature(asm, lang_items)]

//! # Rust entry point
//! This part is called immediately after the bootstrap has done its minimal preparatio work to
//! allow branching into rust code line
//!

mod loader;
pub mod mmu;
mod panic;

use ruspiro_interrupt::IRQ_MANAGER;
use ruspiro_timer as timer;
use ruspiro_uart::Uart1;
use ruspiro_gpio::debug;

/// Entry point that is called by the bootstrapping code.
///
#[export_name = "__rust_entry"]
pub fn __rust_entry(core: u32) -> ! {
    // use the unsafe direct GPIO access to lit LED 20 to indicate we have reached at least this point
    //unsafe { debug::lit_debug_led(20); }

    // very first thing is to setup the MMU which allows us to
    // use atomic operations in the upcomming initialization
    mmu::initialize_mmu(core);
    // special additional setup might be done on the main core only
    if core == 0 {
        // first thing we would like to do is to let the outside world know that we are booting
        // so if this is core 0 we initialze the uart1 interface with default settings and print some
        // string
        let mut uart = Uart1::new();
        let _ = uart.initialize(250_000_000, 115_200);
        uart.send_string("########## RusPiRo ---------- Bootloader v1.0 ---------- ##########\r\n");
        // spend some time doing nothing as the followup entry point may want to re-initialize the
        // uart and this would interfere the current data transfer of the welcome string that might
        // not yet be finished...(from the device point of view)
        timer::sleep(100_000);
        // now initialize the interrupt manager
        IRQ_MANAGER.take_for(|irq_mgr| irq_mgr.initialize());
    }

    // now follows the configuration that is needed to be done by all cores

    // now that the initialization was done we can jump into the "application"
    // specific initialization

    // after the one time setup of the "application" enter the processing loop
    loader::run();
}
