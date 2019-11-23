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
use std::env;

fn main() {
    match env::var_os("CARGO_CFG_TARGET_ARCH") {
        Some(target_arch) => {
            if env::var_os("CARGO_FEATURE_RUSPIRO_PI3").is_some() {
                if target_arch == "aarch64" {
                    cc::Build::new()
                        .file("src/asm/boot.S")
                        .flag("-march=armv8-a")
                        .compile("boot");

                    cc::Build::new()
                        .file("src/asm/mmu.S")
                        .flag("-march=armv8-a")
                        .compile("mmu");

                    cc::Build::new()
                        .file("src/asm/irqtrampoline.S")
                        .flag("-march=armv8-a")
                        .compile("irqtrampoline");
                }
            }
        }
        _ => (),
    }
}
