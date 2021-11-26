/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **********************************************************************************************************************/
#![no_std]
#![no_main]

extern crate alloc;
#[macro_use]
extern crate ruspiro_boot;
extern crate ruspiro_allocator;

use ruspiro_gpio::debug::{lit_debug_led, clr_debug_led};
use ruspiro_interrupt::{self as irq, *};
use ruspiro_mmio_register::*;

come_alive_with!(init);
run_with!(run);

pub fn init(core: u32) {
    // lit the core specific LED once we are alive...
    match core {
        0 => unsafe { lit_debug_led(25); },
        1 => unsafe { lit_debug_led(18); },
        2 => unsafe { lit_debug_led(20); },
        3 => unsafe { lit_debug_led(21); },
        _ => (),
    }

    /*println!(
        "########## RusPiRo ---- Kernel initialization: core {} ---- ##########",
        core
    );*/
}

pub fn run(core: u32) -> ! {
    /*println!(
        "########## RusPiRo ------- Kernel mainloop: core {} ------- ##########",
        core
    );*/

    if core == 0 {
        // setup the system timer to let a LED blink based on timer interrupts
        TIMERLOAD::Register.set(0x30_000); // timer re-load value to be counted down
        TIMERCTRL::Register.write_value(
            TIMERCTRL::WIDTH::_32Bit
                | TIMERCTRL::IRQ::ENABLED
                | TIMERCTRL::TIMER::ENABLED
                | TIMERCTRL::FREERUN::ENABLED,
        );
        // as we have an interrupt handler defined we need to enable interrupt handling globally as well
        // as the specific interrupt we have a handler implemented for
        irq::activate(Interrupt::ArmTimer, None);

        irq::enable_interrupts();
    }

    loop {}
}

#[IrqHandler(ArmTimer)]
fn timer_handler() {
    // first thing - acknowladge the timer interrupt
    TIMERACKN::Register.set(0x1);
    //print!("timer...");
    // using blocking [take_for] is safe here inside the IRQ handler as this is the only code line
    // accessing the GPIO in this test kernel
    /*GPIO.take_for(|gpio| {
        gpio.get_pin(18).unwrap().to_output().toggle();
        // free the pin for the next usage when the handler is called
        // this does not change the device state of the pin
        gpio.free_pin(18);
    });*/
}

define_mmio_register! [
    TIMERLOAD<ReadWrite<u32>@(0x3F00_B400)>,
    TIMERCTRL<ReadWrite<u32>@(0x3F00_B408)> {
        WIDTH OFFSET(1) [
            _16Bit = 0,
            _32Bit = 1
        ],
        IRQ OFFSET(5) [
            ENABLED = 1,
            DISABLED = 0
        ],
        TIMER OFFSET(7) [
            ENABLED = 1,
            DISABLED = 0
        ],
        FREERUN OFFSET(9) [
            ENABLED = 1,
            DISABLED = 0
        ]
    },
    TIMERACKN<WriteOnly<u32>@(0x3F00_B40C)>
];
