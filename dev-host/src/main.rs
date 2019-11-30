/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache 2.0
 **********************************************************************************************************************/

//! # RusPiRo Bootloader - Development Host Part
//!
//! The crate is pushing a given RusPiRo kernel file to the Raspberry Pi connected via a serial port.
//!

extern crate serial;

use clap::{App, Arg, ArgMatches};

//use std::env;
use std::io;
use std::time::Duration;

//use std::io::prelude::*;
use serial::prelude::*;

fn main() {
    // define a command line parse matcher that defines this app and generates a
    // help list out of the box
    let cmd_arguments = App::new("Push Kernel to RPi")
        .version("0.0.1")
        .author("André Borrmann <pspwizard@gmx.de>")
        .about("Send kernel files to raspberry Pi running RusPiRo Bootloader")
        .arg(
            Arg::with_name("port")
                .short("p")
                .long("port")
                .required(true)
                .value_name("PORT_NAME")
                .help("Serial Port Name to use for communication (e.g. 'COM5' on Windows machine)"),
        )
        .arg(
            Arg::with_name("kernel")
                .short("k")
                .long("kernel")
                .required(true)
                .value_name("FILENAME")
                .help("Kernel filename (+path) to be uploaded to RPi"),
        )
        .arg(
            Arg::with_name("architecture")
                .short("a")
                .long("aarch")
                .takes_value(true)
                .value_name("32 | 64")
                .help("Kernel architecture mode 32 for aarch32 or 64 for aarch64"),
        )
        .get_matches();

    match push_kernel_to_uart(&cmd_arguments) {
        Err(e) => println!("{}", e),
        _ => (),
    };
}

fn push_kernel_to_uart(arguments: &ArgMatches) -> Result<(), &'static str> {
    // get the kernel file from the arguments
    let kernel_file = arguments.value_of("kernel").unwrap();
    // get the port name from the arguments
    let com_port = arguments.value_of("port").unwrap();
    // get the architecture from the arguments
    let aarch = if arguments.is_present("architecture") {
        get_aarch_from_commandline(&arguments)?
    } else {
        // if no architecture is given we try to determine the same from
        // the kernel name given
        get_aarch_from_filename(&kernel_file)?
    };

    // let the user know what we are about to do...
    println!(
        "Kernel file to send: {} with mode aarch{}",
        kernel_file, aarch
    );
    println!("Send to port: {}", com_port);

    let kernel_content =
        std::fs::read(kernel_file).map_err(|_| "unable to open the file specified")?;
    let mut port = serial::open(&com_port).map_err(|_| "unable to open serial port specified")?;
    send_kernel(&mut port, kernel_content, aarch)
        .map_err(|_| "unable to push kernel to the target hardware")?;
    Ok(())
}

fn get_aarch_from_filename(filename: &str) -> Result<u8, &'static str> {
    if filename.contains("kernel7.img") {
        return Ok(32);
    }
    if filename.contains("kernel8.img") {
        return Ok(64);
    }
    return Err("unable to deterimine architecture from kernel file. Please provide -a parameter.");
}

fn get_aarch_from_commandline(matcher: &ArgMatches) -> Result<u8, &'static str> {
    match matcher.value_of("architecture") {
        Some("32") => Ok(32),
        Some("64") => Ok(64),
        _ => Err("unknown architecture specified. Use -a 32 | 64"),
    }
}

fn send_kernel(port: &mut dyn SerialPort, data: Vec<u8>, aarch: u8) -> io::Result<()> {
    port.reconfigure(&|settings| {
        settings.set_baud_rate(serial::Baud115200)?;
        settings.set_char_size(serial::Bits8);
        settings.set_parity(serial::ParityNone);
        settings.set_stop_bits(serial::Stop1);
        settings.set_flow_control(serial::FlowNone);
        Ok(())
    })?;

    // set timeout to 0 to ensure we block until we have received the
    // data we are waiting for
    port.set_timeout(Duration::from_millis(0))?;

    println!("Send kernel to device. Initiate with token...");
    let buf: Vec<u8> = b"DEADBEEF".to_vec();
    port.write(&buf)?; // send head token

    // wait for the device to acknowledge the token....
    let mut ack: [u8; 3] = [0; 3];
    port.read(&mut ack)?;
    if &ack == b"ACK" {
        println!("Device acknowledged. Send kernel size {}", data.len());
        let len = data.len();
        let len_buffer = [
                (len & 0xFF) as u8,
                ((len >> 8) & 0xFF) as u8,
                ((len >> 16) & 0xFF) as u8,
                ((len >> 24) & 0xFF) as u8
            ];//data.len().to_be_bytes();
        let type_buffer = [aarch];

        port.write(&len_buffer)?;
        port.write(&type_buffer)?;
        // wait again for the acknowledge
        port.read(&mut ack)?;
        if &ack == b"ACK" {
            println!("Device acknowledged. Send kernel...");
            port.write(&data)?; // send kernel binary
            // wait again for the acknowledge
            port.read(&mut ack)?;
            if &ack == b"ACK" {
                println!("Kernel successfully sent");
            }
        }
    }

    Ok(())
}
