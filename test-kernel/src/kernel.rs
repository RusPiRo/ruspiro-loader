/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **********************************************************************************************************************/
#![no_std]
#![no_main]

extern crate alloc;
extern crate ruspiro_allocator;
extern crate ruspiro_boot;

use ruspiro_boot::*;
use ruspiro_gpio::*;
use ruspiro_interrupt::*;
use ruspiro_register::define_mmio_register;
use ruspiro_singleton::*;
use ruspiro_uart::Uart1;

use ruspiro_gpio::debug::lit_debug_led;

static UART1: Singleton<Uart1> = Singleton::new(Uart1::new());

come_alive_with!(init);
run_with!(run);

pub fn init(core: u32) {
    // lit the core specific LED once we are alive...
    match core {
        0 => GPIO.take_for(|gpio| gpio.get_pin(17).unwrap().to_output().high()),
        1 => GPIO.take_for(|gpio| gpio.get_pin(18).unwrap().to_output().high()),
        2 => GPIO.take_for(|gpio| gpio.get_pin(20).unwrap().to_output().high()),
        3 => GPIO.take_for(|gpio| gpio.get_pin(21).unwrap().to_output().high()),
        _ => (),
    }

    if core == 0 {
        // initialize the UART only on core 0
        UART1.take_for(|uart| {
            let _ = uart.initialize(250_000_000, 115_200);
        });
    }

    UART1.take_for(|uart| {
        uart.send_string(
            alloc::format!(
                "########## RusPiRo ---- Kernel initialization: core {} ---- ##########\r\n",
                core
            )
            .as_str(),
        );
    });
}

pub fn run(core: u32) -> ! {
    UART1.take_for(|uart| {
        uart.send_string(
            alloc::format!(
                "########## RusPiRo ------- Kernel mainloop: core {} ------- ##########\r\n",
                core
            )
            .as_str(),
        )
    });

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
        IRQ_MANAGER.take_for(|irq_mgr| {
            irq_mgr.activate(Interrupt::ArmTimer);
        });

        enable_interrupts();
    }

    loop {}
}

#[IrqHandler(ArmTimer)]
fn timer_handler() {
    // first thing - acknowladge the timer interrupt
    TIMERACKN::Register.set(0x1);
    UART1.use_for(|uart| uart.send_string("timer..."));
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
            _16Bit: 0,
            _32Bit: 1
        ],
        IRQ OFFSET(5) [
            ENABLED: 1,
            DISABLED: 0
        ],
        TIMER OFFSET(7) [
            ENABLED: 1,
            DISABLED: 0
        ],
        FREERUN OFFSET(9) [
            ENABLED: 1,
            DISABLED: 0
        ]
    },
    TIMERACKN<WriteOnly<u32>@(0x3F00_B40C)>
];
