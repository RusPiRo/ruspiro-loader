/*********************************************************************************************************************** 
 * Copyright (c) 2019 by the authors
 * 
 * Author: André Borrmann 
 * License: ???
 **********************************************************************************************************************/
//! # Title goes here
//! 

use std::env;

fn main() {
    println!("cargo:rustc-link-arg=-T{:?}", env::var("DEP_RUSPIRO_BOOT_LINKERSCRIPT").unwrap());
}