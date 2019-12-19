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
    if let Some(target_arch) = env::var_os("CARGO_CFG_TARGET_ARCH") {
        if env::var_os("CARGO_FEATURE_RUSPIRO_PI3").is_some() && target_arch == "aarch64" {
            cc::Build::new()
                .file("src/asm/bootstrap.S")
                .flag("-march=armv8-a")
                .compile("bootstrap");
            cc::Build::new()
                .file("src/asm/exceptionvector.S")
                .flag("-march=armv8-a")
                .compile("excvector");
        }
    }
}
