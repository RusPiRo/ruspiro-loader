//! # miniUART
//!
//! Bare bone miniUART implementation for the bootloader
//!

use ruspiro_arch_aarch64::{RegisterField, RegisterFieldValue};
use ruspiro_mmio_register::define_mmio_register;
use ruspiro_timer as timer;

#[cfg(feature = "pi3")]
const PERIPHERAL_BASE: usize = 0x0_3F00_0000;
#[cfg(feature = "pi4_low")]
const PERIPHERAL_BASE: usize = 0x0_FE00_0000;
#[cfg(feature = "pi4_high")]
const PERIPHERAL_BASE: usize = 0x4_7E00_0000;

/// Base address for GPIO MMIO registers
const GPIO_BASE: usize = PERIPHERAL_BASE + 0x0020_0000;

// AUX MMIO base address
const AUX_BASE: usize = PERIPHERAL_BASE + 0x0021_5000;

pub fn init(clock_rate: u32, baud_rate: u32) {
  // use GPIO 14 and 15 for the miniUART
  // set AltF5 for both pins
  GPFSEL1::Register.modify(RegisterField::<u32>::new(0x7, 12), 0b010);
  GPFSEL1::Register.modify(RegisterField::<u32>::new(0x7, 15), 0b010);

  #[cfg(feature = "pi3")]
  {
    GPPUD::Register.modify(GPPUD::PUD, 0b0);
    // 2. wait 150 cycles
    for _ in 0..150 {
      unsafe { asm!("NOP") }
    }
    // 3. write the pin to upate into the PUDCLCK register
    GPPUDCLK0::Register.set(1 << 14);
    // 4. wait 150 cycles to settle the new settings
    for _ in 0..150 {
      unsafe { asm!("NOP") }
    }
    // 5. clear the pud control value in the PUD control register
    
    GPPUD::Register.set(0x0);
    // 6. write the pin to the PUDCLCK register again to finish the update cycle
    GPPUDCLK0::Register.set(1 << 14);

    GPPUD::Register.modify(GPPUD::PUD, 0b0);
    // 2. wait 150 cycles
    for _ in 0..150 {
      unsafe { asm!("NOP") }
    }
    // 3. write the pin to upate into the PUDCLCK register
    GPPUDCLK0::Register.set(1 << 15);
    // 4. wait 150 cycles to settle the new settings
    for _ in 0..150 {
      unsafe { asm!("NOP") }
    }
    // 5. clear the pud control value in the PUD control register
    GPPUD::Register.set(0x0);
    // 6. write the pin to the PUDCLCK register again to finish the update cycle
    GPPUDCLK0::Register.set(1 << 15);
  }
  #[cfg(feature = "pi4")]
  {
    let mut pupd = GPPUP_PDN_CTRL0::Register.get();
    pupd &= !(0b11 << 30); //pupd = none pin 15
    pupd &= !(0b11 << 28); // pupd = none pin 14
    GPPUP_PDN_CTRL0::Register.set(pupd);
  }

  // configure miniUART
  AUX_ENABLES::Register.write(AUX_ENABLES::MINIUART_ENABLE, 0x1); // enable mini UART
  AUX_MU_IER_REG::Register.set(0x0); // disable interrupts
  AUX_MU_CNTL_REG::Register.set(0x0); // disable transmitter and receiver (to set new baud rate)
  AUX_MU_LCR_REG::Register.write(AUX_MU_LCR_REG::DATASIZE, 0x3); // set 8bit data transfer mode
  AUX_MU_MCR_REG::Register.set(0x0); // set UART_RTS line to high (ready to send)
  AUX_MU_IIR_REG::Register //.set(0xC6);
    .write_value(
      RegisterFieldValue::<u32>::new(AUX_MU_IIR_REG::IRQID_FIFOCLR, 0b11)
        | RegisterFieldValue::<u32>::new(AUX_MU_IIR_REG::FIFO_ENABLES, 0b11),
    ); // clear recieve/transmit FIFO, set FIFO as always enabled
  AUX_MU_BAUD_REG::Register.set(clock_rate / (8 * baud_rate) - 1); // set the baud rate based on the core clock rate

  AUX_MU_CNTL_REG::Register //.set(0x3);
    .write_value(
      RegisterFieldValue::<u32>::new(AUX_MU_CNTL_REG::RCV_ENABLE, 0x1)
        | RegisterFieldValue::<u32>::new(AUX_MU_CNTL_REG::TRANS_ENABLE, 0x1),
    ); // enable receiver and transmitter

  AUX_MU_IER_REG::Register.write_value(
    RegisterFieldValue::<u32>::new(AUX_MU_IER_REG::RCV_IRQ, 0b11)
      | RegisterFieldValue::<u32>::new(AUX_MU_IER_REG::RX_ENABLE, 0x1),
  ); // enable receiver interrupts
}

pub fn send_string(s: &str) {
  send_data(s.as_bytes());
}

pub fn try_receive_data(buffer: &mut [u8]) -> Result<usize, ()> {
  if buffer.is_empty() {
    Err(())
  } else {
    for c in 0..buffer.len() {
      buffer[c] = receive_byte(1000)?;
    }
    Ok(buffer.len())
  }
}

pub fn receive_data(buffer: &mut [u8]) -> Result<usize, ()> {
  if buffer.is_empty() {
    Err(())
  } else {
    for c in 0..buffer.len() {
      buffer[c] = receive_byte(0)?;
    }
    Ok(buffer.len())
  }
}

fn receive_byte(timeout: i32) -> Result<u8, ()> {
  let mut count = 0;
  while AUX_MU_LSR_REG::Register.read(AUX_MU_LSR_REG::DATAREADY) == 0
    && (timeout == 0 || count < timeout)
  {
    timer::sleepcycles(1000);
    count += 1;
  }
  if timeout != 0 && count >= timeout {
    Err(())
  } else {
    Ok((AUX_MU_IO_REG::Register.get() & 0xFF) as u8)
  }
}

pub fn send_data(data: &[u8]) {
  for byte in data {
    // wait for the transmitter to be empty
    while AUX_MU_LSR_REG::Register.read(AUX_MU_LSR_REG::TRANSEMPTY) == 0 {
      timer::sleepcycles(10);
    }
    AUX_MU_IO_REG::Register.set(*byte as u32);
  }
}

// specify the AUX registers
define_mmio_register! [
    AUX_IRQ<ReadOnly<u32>@(AUX_BASE + 0x00)>,
    AUX_ENABLES<ReadWrite<u32>@(AUX_BASE + 0x04)> {
        MINIUART_ENABLE OFFSET(0),
        SPI1_ENABLE OFFSET(1),
        SPI2_ENABLE OFFSET(2)
    },
    AUX_MU_IO_REG<ReadWrite<u32>@(AUX_BASE + 0x40)>,
    AUX_MU_IER_REG<ReadWrite<u32>@(AUX_BASE + 0x44)> {
        RX_ENABLE OFFSET(0),
        TX_ENABLE OFFSET(1),
        RCV_IRQ   OFFSET(2) BITS(2) // set always 0b11 if interrupts shall be received
    },
    AUX_MU_IIR_REG<ReadWrite<u32>@(AUX_BASE + 0x48)> {
        IRQPENDING OFFSET(0),
        IRQID_FIFOCLR OFFSET(1) BITS(2),
        FIFO_ENABLES OFFSET(6) BITS(2)
    },
    AUX_MU_LCR_REG<ReadWrite<u32>@(AUX_BASE + 0x4C)> {
        DATASIZE OFFSET(0) BITS(2),
        BREAK OFFSET(6),
        DLAB OFFSET(7)
    },
    AUX_MU_MCR_REG<ReadWrite<u32>@(AUX_BASE + 0x50)>,
    AUX_MU_LSR_REG<ReadOnly<u32>@(AUX_BASE + 0x54)> {
        DATAREADY  OFFSET(0),
        RCVOVERRUN OFFSET(1),
        TRANSEMPTY OFFSET(5),
        TRANSIDLE  OFFSET(6)
    },
    AUX_MU_MSR_REG<ReadWrite<u32>@(AUX_BASE + 0x58)>,
    AUX_MU_CNTL_REG<ReadWrite<u32>@(AUX_BASE + 0x60)> {
        RCV_ENABLE OFFSET(0),
        TRANS_ENABLE OFFSET(1),
        AUTO_FLOW_RTS OFFSET(2),
        AUTO_FLOW_CTS OFFSET(3),
        AUTO_RTS_LEVEL OFFSET(4) BITS(2),
        RTS_ASSERT OFFSET(6),
        CTS_ASSERT OFFSET(7)

    },
    AUX_MU_STAT_REG<ReadWrite<u32>@(AUX_BASE + 0x64)>,
    AUX_MU_BAUD_REG<ReadWrite<u32>@(AUX_BASE + 0x68)>
];

// Define the registers of the GPIO that are used to access the pin's
define_mmio_register! [
    /// Alt-Function select register for pin 10..19
    pub(crate) GPFSEL1<ReadWrite<u32>@(GPIO_BASE + 0x04)>,
    /// Alt-Function select register for pin 30..39
    pub(crate) GPFSEL3<ReadWrite<u32>@(GPIO_BASE + 0x0C)>,
    /// Pull-Up/Down configuration register
    pub(crate) GPPUD<ReadWrite<u32>@(GPIO_BASE + 0x94)> {
        PUD OFFSET(0) BITS(2)
    },
    /// Pull-Up/Down clock register for pin 0..31
    GPPUDCLK0<ReadWrite<u32>@(GPIO_BASE + 0x98)>,
    /// Pull-Up/Down clock register for pin 32..53
    GPPUDCLK1<ReadWrite<u32>@(GPIO_BASE + 0x9C)>
];

#[cfg(feature = "pi4")]
define_mmio_register! [
    GPPUP_PDN_CTRL0<ReadWrite<u32>@(GPIO_BASE + 0xe4)>
];