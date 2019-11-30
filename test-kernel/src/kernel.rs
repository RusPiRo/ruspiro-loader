/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: ???
 **********************************************************************************************************************/
#![no_std]
#![no_main]
//! # Title goes here
//!
extern crate ruspiro_boot;
extern crate ruspiro_allocator;
use ruspiro_boot::*;
//extern crate ruspiro_sdk;
//use ruspiro_sdk::*;

come_alive_with!(alive);
run_with!(run);

fn alive(_core: u32) {
    // as a simple test just lit the LED on pin 17 once we are alive...
    //GPIO.take_for(|gpio| gpio.get_pin(17).unwrap().to_output().high());
}

fn run(_core: u32) -> ! {
    // to indicate we are running blink LED on pin 18
    //let pin = GPIO.take_for(|gpio| gpio.get_pin(18).unwrap().to_output());

    loop {
        //timer::sleep(300_000);
        //pin.high();
        //timer::sleep(300_000);
        //pin.low();
    }
}

