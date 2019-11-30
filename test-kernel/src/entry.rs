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

mod kernel;
mod mmu;
mod panic;

use ruspiro_interrupt::IRQ_MANAGER;
use ruspiro_uart::Uart1;

/// Entry point that is called by the bootstrapping code.
///
#[export_name = "__rust_entry"]
pub fn __rust_entry(core: u32) -> ! {
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
        uart.send_string("########## RusPiRo ---------- loading ---------- ##########\r\n");

        // now initialize the interrupt manager
        IRQ_MANAGER.take_for(|irq_mgr| irq_mgr.initialize());
    }

    // now follows the configuration that is needed to be done by all cores

    // now that the initialization was done we can jump into the "application"
    // specific initialization
    kernel::init(core);

    // after the one time setup of the "application" enter the processing loop
    kernel::run(core);
}
/*
fn lit_led(num: u32) {
    let fsel_num = num / 10;
    let fsel_shift = (num % 10) * 3;
    let fsel_addr = 0x3f20_0000 + 4 * fsel_num;
    let set_addr = 0x3f20_001c + num / 32;
    let mut fsel: u32 = unsafe { core::ptr::read_volatile(fsel_addr as *const u32) };
    fsel &= !(7 << fsel_shift);
    fsel |= 1 << fsel_shift;
    unsafe { core::ptr::write_volatile(fsel_addr as *mut u32, fsel) };

    let set: u32 = 1 << (num & 0x1F);
    unsafe { core::ptr::write_volatile(set_addr as *mut u32, set) };
}

fn dump_hex(uart: &Uart1, value: u64) {
    const HEXCHAR: &[u8] = "0123456789ABCDEF".as_bytes();
    let mut tmp = value;
    let mut hex: [u8; 16] = [0; 16];
    let mut idx = 0;
    while (tmp != 0) {
        //UART.send_char(HEXCHAR[(tmp & 0xF) as usize] as char);
        hex[idx] = HEXCHAR[(tmp & 0xF) as usize];
        tmp = tmp >> 4;
        idx = idx + 1;
    }

    uart.send_string("\r\n0x");
    for i in 0..16 {
        if hex[15 - i] != 0 {
            uart.send_char(hex[15 - i] as char);
        }
    }
}

fn test_register(uart: &Uart1) {
    let fv1 = mair_el2::MAIR0::NGNRE;
    let fv2 = mair_el2::MAIR1::GRE;
    let v = fv1 | fv2;
    unsafe {
        dump_hex(uart, fv1.value());
        dump_hex(uart, fv2.value());
        dump_hex(uart, v.value());
    };

    dump_hex(uart, mair_el2::read());
    mair_el2::write(fv2);
    dump_hex(uart, mair_el2::read());
    mair_el2::write(fv1);
    dump_hex(uart, mair_el2::read());
    dump_hex(uart, sctlr_el2::read());
}
*/
