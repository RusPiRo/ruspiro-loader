/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **********************************************************************************************************************/
//! Build script to pre-compile the assembly files containing the majority of the boot up and initial configuration
//! code
//!

extern crate cc;
use std::{env, fs};

fn main() {
  // compile the assemply files as pre-compilation step.
  if let Some(target_arch) = env::var_os("CARGO_CFG_TARGET_ARCH") {
    if (
        env::var_os("CARGO_FEATURE_PI3").is_some() || 
        env::var_os("CARGO_FEATURE_PI4_LOWPERI").is_some() ||
        env::var_os("CARGO_FEATURE_PI4_HIGHPERI").is_some()
      ) && target_arch == "aarch64" {
      cc::Build::new()
        .file("src/asm/bootstrap.S")
        .flag("-march=armv8-a")
        .compile("bootstrap");
      cc::Build::new()
        .file("src/asm/exceptionvector.S")
        .flag("-march=armv8-a")
        .compile("excvector");
    }

    //  create the proper config.txt file to be used on the SD card along with this bootloader kernel
    if env::var_os("CARGO_FEATURE_PI3").is_some() && target_arch == "aarch64" {
      let _ = fs::write(
        "./target/config.txt",
        r#"#######################################################
# RPi3 configuration settings for baremetal bootloader
#######################################################
# fix the core frequency driving the miniUART to get a stable BAUD
core_freq=250
core_freq_min=250
# activate extended firmware version - including camera module
start_x=1
# disable the device tree
device_tree=
# enable additional debugging info during boot up
uart_2ndstage=1
# configure GPU memory in MB
#gpu_mem=64
# disable L2 cache
disable_l2cache=1
        "#
      );
    }

    if env::var_os("CARGO_FEATURE_PI4_LOWPERI").is_some() && target_arch == "aarch64" {
      let _ = fs::write(
        "./target/config.txt",
        r#"#######################################################
# RPi4 configuration settings for baremetal bootloader
#######################################################
arm_64bit=1
# define peripheral address start at 0xFE00_0000
arm_peri_high=0
# fix the core frequency driving the miniUART to get a stable BAUD
core_freq=500
core_freq_min=500
# custom boot stub to do the EL3 preparation stuff and kick of the kernel8.img in EL2
armstub=armstub8.bin
# activate extended firmware version - including camera module
start_x=1
# disable the new GIC-400 interrupt controller
enable_gic=0
# disable the device tree
device_tree=
# enable additional debugging info during boot up
uart_2ndstage=1
#gpu_mem=64
        "#
      );
    };

    if env::var_os("CARGO_FEATURE_PI4_HIGHPERI").is_some() && target_arch == "aarch64" {
      let _ = fs::write(
        "./target/config.txt",
        r#"#######################################################
# RPi4 configuration settings for baremetal bootloader
#######################################################
arm_64bit=1
# define peripheral address start at 0xFE00_0000
arm_peri_high=1
# fix the core frequency driving the miniUART to get a stable BAUD
core_freq=500
core_freq_min=500
# custom boot stub to do the EL3 preparation stuff and kick of the kernel8.img in EL2
armstub=armstub8.bin
# activate extended firmware version - including camera module
start_x=1
# disable the new GIC-400 interrupt controller
enable_gic=0
# disable the device tree
device_tree=
# enable additional debugging info during boot up
uart_2ndstage=1
#gpu_mem=64
        "#
      );
    }
  }

  println!("cargo:rerun-if-changed=linkbl.ld");
  println!("cargo:rerun-if-changed=src/asm/bootstrap.S");
  println!("cargo:rerun-if-changed=src/asm/exceptionvector.S");
}
