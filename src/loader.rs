/*********************************************************************************************************************** 
 * Copyright (c) 2019 by the authors
 * 
 * Author: André Borrmann 
 * License: ???
 **********************************************************************************************************************/
#![doc(html_root_url = "https://docs.rs/ruspiro-loader/0.0.1")]
#![no_std]
#![no_main]

//! # Raspberry Pi boot loader
//! 
//! This crate creates a small kernel that could be deployed to the Raspberry Pi and run there. It will listen to the
//! Uart interface to retrieve a new kernel version. If this happens it will replace itself and restart the Raspberry Pi
//! executing the new kernel just recieved. This reduces the SD-card-dance during development cycles.
//! 

extern crate alloc;

#[macro_use]
extern crate ruspiro_boot;
extern crate ruspiro_allocator;

use ruspiro_singleton::Singleton;
use ruspiro_mailbox::*;
use ruspiro_uart::*;
use ruspiro_gpio::GPIO;
use ruspiro_timer as timer;
use ruspiro_console::*;

// Create the tokens to be contained in the binary as text 'DEADBEEF' and 'BEEFDEAD'
// as their u32/u32 representations to ensure those strings will not appear randomly in the compiled binary
// the binary to be loaded from the bootloader is in the UART bytestream between
// DEADBEEF and BEEFDEAD text marker. Therefore the binary byte size does always need to be a multiple of 8
const START_TOKEN: (u32, u32) = (
    ('D' as u32) << 24 | ('E' as u32) << 16 | ('A' as u32) << 8 | ('D' as u32),
    ('B' as u32) << 24 | ('E' as u32) << 16 | ('E' as u32) << 8 | ('F' as u32)
);

const END_TOKEN: (u32, u32) = (
    ('D' as u32) << 24 | ('E' as u32) << 16 | ('A' as u32) << 8 | ('D' as u32),
    ('B' as u32) << 24 | ('E' as u32) << 16 | ('E' as u32) << 8 | ('F' as u32)
);

static UART: Singleton<Uart0> = Singleton::new(Uart0::new());


come_alive_with!(alive);
run_with!(wait_new_kernel);

fn alive(core: u32) {
    if core == 0 {
        let pin = GPIO.take_for(|gpio| gpio.get_pin(17).unwrap().to_output());
        // init uart on core 0 with the current core rate        
        pin.high();        
        // GPIO pin workaround for the UART to work properly -> works only if
        // just recieving the pin, but not set it to low/high or so... strange!
        //let _ = GPIO.take_for(|gpio| gpio.get_pin(18).unwrap().to_output());//.high());      
        //let _ =  UART.take_for(|uart| uart.initialize(250_000_000, 115_200)).expect("uart error");
        let mut uart = Uart0::new();
        uart.initialize(250_000_000, 115_200).expect("uart error");
        // for a currently unknown reason we need to do a second
        // UART.take_for and print something to UART here
        // to ensure the UART is properly working...
        // also a GPIO.take_for before the first UART.take_for
        // seem to be a valid workaround...
        //UART.take_for(|uart| uart.send_string("Uart ready...\r\n"));

        CONSOLE.take_for(|cons| cons.replace(uart));
        info!("using console...");
        

        let core_rate = MAILBOX.take_for(|mb| mb.get_clockrate(ArmClockId::Core)).expect("mailbox error");
        info!("clock rate {}", core_rate);
        pin.low();
    } else {
        //UART.take_for(|uart| uart.send_string(alloc::format!("core {} kicked\r\n", core).as_str()));
    }
}

fn wait_new_kernel(core: u32) -> ! {
    /*if core == 0 {
        // wait only on core 0 for a new kernel file to arrive
        UART.take_for(|uart| {
            uart.send_string("Boot loader ready\r\n");
            uart.send_string("waiting of the transfer to begin ...\r\n");
        });
        
        let ready_pin = GPIO.take_for(|gpio| gpio.get_pin(17).unwrap().to_output());
        ready_pin.high();


        let mut magic = 0;
        let mut count = 0;

        UART.take_for(|uart| {
            loop {
                if magic < 2 {
                    let received = uart.try_receive_data(8)
                        .and_then(|data| {
                            count += 8;
                            match magic {
                                0 => {
                                    let data_cc = make_4cc(&data[..8]);
                                    if data_cc.0 == START_TOKEN.0 && data_cc.1 == START_TOKEN.1 {
                                        magic = 1;                                
                                    }
                                },
                                1 => {
                                    let data_cc = make_4cc(&data[..8]);
                                    if data_cc.0 == END_TOKEN.0 && data_cc.1 == END_TOKEN.1 {
                                        magic = 2;
                                        uart.send_string("kernel end token found\r\n");
                                        uart.send_string(alloc::format!("received kernel size: {} bytes\r\n", count - 16).as_str());
                                        uart.send_string("prepare restart...\t\n");
                                    }
                                }
                                _ => ()
                            }
                        Ok(())
                    });
                } else {
                    break;
                }
            }
        });

        unsafe { __boot(); }
        loop { }
    } else {
        // hang all other cores
        loop { }
    }*/

    loop { }
}

const fn make_4cc(chars: &[u8]) -> (u32, u32) {
    (
        (chars[0] as u32) << 24 | (chars[1] as u32) << 16 | (chars[2] as u32) << 8 | (chars[3] as u32),
        (chars[4] as u32) << 24 | (chars[5] as u32) << 16 | (chars[6] as u32) << 8 | (chars[7] as u32),
    )    
}

extern "C" {
    fn __boot() -> !;
}