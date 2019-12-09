/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: ???
 **********************************************************************************************************************/
#![no_std]
#![no_main]
 
extern crate ruspiro_boot;
use ruspiro_boot::*;
use ruspiro_gpio::*;
use ruspiro_timer as timer;
use ruspiro_uart::Uart1;
use ruspiro_singleton::*;

static UART1: Singleton<Uart1> = Singleton::new(Uart1::new());

come_alive_with!(init);
run_with!(run);

pub fn init(core: u32) {
    // lit the LED on pin 21 once we are alive...
    GPIO.take_for(|gpio| gpio.get_pin(21).unwrap().to_output().high());

    if core == 0 {
        // initialize the UART only on core 0
        UART1.take_for(|uart| {
            let _ = uart.initialize(250_000_000, 115_200);
        });    
    }

    UART1.take_for(|uart| {
        uart.send_string("########## RusPiRo -------- Kernel initialization -------- ##########\r\n");
    });
}

pub fn run(core: u32) -> ! {
    // to indicate we are running blink LED on a pin based on core number
    let pin = match core {
        0 => GPIO.take_for(|gpio| gpio.get_pin(17).unwrap().to_output()),
        1 => GPIO.take_for(|gpio| gpio.get_pin(18).unwrap().to_output()),
        2 => GPIO.take_for(|gpio| gpio.get_pin(20).unwrap().to_output()),
        3 => GPIO.take_for(|gpio| gpio.get_pin(21).unwrap().to_output()),
        _ => unimplemented!(),
    };

    UART1.take_for(|uart| uart.send_string(
        "########## RusPiRo ----------- Kernel mainloop ----------- ##########\r\n"
    ));

    loop {
        timer::sleep(300_000);
        pin.high();
        timer::sleep(300_000);
        pin.low();
    }
}

