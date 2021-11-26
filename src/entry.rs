/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **********************************************************************************************************************/
#![no_std]
#![no_main]
#![feature(asm, lang_items, linkage)]

//! # Rust entry point
//! This part is called immediately after the bootstrap has done its minimal preparation work to
//! allow branching into rust code line
//!

#[cfg(not(any(feature = "pi3", feature = "pi4_low", feature = "pi4_high")))]
compile_error!("Either feature \"pi3\", \"pi4_low\" or \"pi4_high\" must be enabled for this crate");


extern crate alloc;
extern crate rlibc;
extern crate ruspiro_allocator;

mod exception;
mod panic;
mod stubs;
mod uart;

//use alloc::vec::Vec;
use ruspiro_arch_aarch64::instructions::{sev, wfe};
use ruspiro_interrupt::{self as irq, AuxDevice, IrqHandler};

static mut KERNEL_MODE: u8 = 0x0;

#[export_name = "__rust_entry"]
pub fn __rust_entry(core: u32) {
  // do one-time initialization here
  // ensure that only core 0 is running the bootloader code
  if core != 0 {
    loop {}
  };

  #[cfg(feature = "pi3")]
  uart::init(250_000_000, 115_200);
  #[cfg(any(feature = "pi4_low", feature = "pi4_high"))]
  uart::init(500_000_000, 115_200);
  uart::send_string("\r\n########## RusPiRo ---------- Bootloader v1.0 ---------- ##########\r\n");
  
  // enable the interrupt for the Uart1
  irq::activate_aux(AuxDevice::Uart1, None);
  uart::send_string("waiting for a new kernel...\r\n");
  irq::enable_interrupts();

  loop {
    wfe();
    // wait for the new kernel to arrive
    unsafe {
      while core::ptr::read_volatile(&KERNEL_MODE as *const u8) == 0 {
        ruspiro_timer::sleep(core::time::Duration::from_millis(100));
        wfe();
      }
      irq::disable_interrupts();
    };
    uart::send_string("new kernel received...\r\n");

    uart::send_string("initiate re-boot...\r\n");
    // based on the kernel mode we could either "re-boot" immidiately or
    // we need to switch to aarch32 mode
    unsafe {
      match KERNEL_MODE {
        64 => __boot_64(0x8_0000),
        32 => __boot_32(0x0_8000),
        _ => {
          // well, whatever is requested we cannot handle this here...
          unimplemented!();
        }
      }
    }
  }
}

/// Interrupt handler for the UART1 being triggered once new data was received
///
/// # Safety
///
/// The interrupt handler is treated as "unsafe". It should never call any atomic blocking
/// operation that my deadlock the main processing flow
#[IrqHandler(Aux, Uart1)]
unsafe fn uart_handler() {
  // when the interrupt is triggered we clearly have data received
  // check if this is the token the host need to send to initiate the transfer
  // but do not block in case there is to less data received
  let mut token: [u8; 8] = [0; 8];
  if let Ok(size) = uart::try_receive_data(&mut token) {
    if size == 8 && &token == b"DEADBEEF" {
      // we got the token, so let the host know that we are ready
      uart::send_string("ACK");
      // as the transfer has been started we can now wait for the next
      // data package containing the size of the kernel to be expected
      // as well as the kernel architecture (aarch32/64). This could be
      // a blocking receive call as this is the only thing to expect next
      let mut metadata: [u8; 5] = [0; 5];
      if uart::receive_data(&mut metadata).is_ok() {
        // extract the kernel size from the buffer
        //let tmp: [u8;4] = metadata[0..4];
        //let size = u32::from_be_bytes(metadata[0..4].try_into().unwrap()) as usize;
        let size = metadata[0] as usize
          | (metadata[1] as usize) << 8
          | (metadata[2] as usize) << 16
          | (metadata[3] as usize) << 24;
        // extract the kernel architecture type from the metadata buffer
        let aarch = metadata[4];
        // before receiving the binary create the buffer big enough to store the data
        // Vec requires HEAP allocation and thus the allocator to be running which inturn uses atomic
        // oprations that are not available without the MMU up and running -> need an alternative: fixed size slices
        // to be filled? but where to store? => Relocate the bootloader at the beginning and copy the recieved
        // kernel right to the expected position!
        // where to relocate the bootloader to? How big is it allowed to become?
        let mut binary = [0_u8; 16];
        
        // now inform the host that we are ready to receive the data as the heavylifting
        // preparation is done
        uart::send_string("ACK");
        let kernel_start = match aarch {
            32 => 0x0_8000,
            64 => 0x8_0000,
            _ => unimplemented!(),
          };
        let mut offset = 0;
        while let Ok(size) = uart::try_receive_data(&mut binary) {
          core::ptr::copy_nonoverlapping(
            binary.as_ptr(),
            (kernel_start as *mut u8).offset(offset),
            size,
          );
          offset += size as isize;
        }
        if offset == size as isize {
          core::ptr::write_volatile(&mut KERNEL_MODE as *mut u8, aarch);
          sev();
        }
      }
    }
  }
}

/// the external functions called for the "re-boot" in either aarch32 or aarch64 mode
/// depending on the kernel received
extern "C" {
  fn __boot_64(addr: u64) -> !;
  fn __boot_32(addr: u64) -> !;
}
