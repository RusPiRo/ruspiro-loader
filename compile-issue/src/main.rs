/*********************************************************************************************************************** 
 * Copyright (c) 2019 by the authors
 * 
 * Author: André Borrmann 
 * License: ???
 **********************************************************************************************************************/
#![no_std]
#![no_main]
#![feature(lang_items, start)]

//! # Title goes here
//! 

use core::panic::PanicInfo;
use ruspiro_mailbox::*;
use ruspiro_console::*;

/*
#[start]
fn start(_: isize, _: *const *const u8) -> isize {
    if let Ok(core_rate) = MAILBOX.take_for(|mb| mb.get_clockrate(ArmClockId::Core)) {
        println!("Core rate: {}", core_rate);
    }

    0
}
*/

#[no_mangle]
pub extern fn __boot() -> ! {
    if let Ok(core_rate) = MAILBOX.take_for(|mb| mb.get_clockrate(ArmClockId::Core)) {
        println!("Core rate: {}", core_rate);
    }

    loop { }
}


#[panic_handler]
fn panic(_: &PanicInfo) -> ! {
    
    // Panicing is undefined behaviour so we are unable to recover from one into a valid state.
    // Halt the panicing core and safely do nothing!
    loop { }
}

#[lang = "eh_personality"]
fn eh_personality() {
    // for the time beeing - nothing to be done as the usecase is a bit unclear
}

#[no_mangle]
fn __aeabi_unwind_cpp_pr0() {

}

#[no_mangle]
fn __aeabi_unwind_cpp_pr1() {
    
}

#[no_mangle]
#[allow(non_snake_case)]
fn _Unwind_Resume() {

}
