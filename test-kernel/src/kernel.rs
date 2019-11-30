/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: ???
 **********************************************************************************************************************/

use ruspiro_gpio::*;
use ruspiro_timer as timer;

pub fn init(_core: u32) {
    // as a simple test just lit the LED on pin 17 once we are alive...
    GPIO.take_for(|gpio| gpio.get_pin(17).unwrap().to_output().high());
}

pub fn run(_core: u32) -> ! {
    // to indicate we are running blink LED on pin 18
    let pin = GPIO.take_for(|gpio| gpio.get_pin(18).unwrap().to_output());

    loop {
        timer::sleep(300_000);
        pin.high();
        timer::sleep(300_000);
        pin.low();
    }
}

