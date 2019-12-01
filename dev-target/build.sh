#!/bin/bash
#*****************************************************************
# shell script to build the RusPiRo bootloader kernel
#
# Copyright (c) 2019 by the authors
# 
# Author: André Borrmann 
# License: Apache License 2.0
#******************************************************************

set -ev

export CFLAGS='-march=armv8-a -Wall -O3 -nostdlib -nostartfiles -ffreestanding -mtune=cortex-a53'
export RUSTFLAGS='-C linker=aarch64-elf-gcc -C target-cpu=cortex-a53 -C target-feature=+strict-align,+a53,+fp-armv8,+neon -C link-arg=-nostartfiles -C opt-level=3 -C debuginfo=0 -C link-arg=-T./link.ld'
export CC='aarch64-elf-gcc'
export AR='aarch64-elf-ar'

cargo xbuild --target aarch64-unknown-linux-gnu --release --target-dir ./target/
cargo objcopy -- -O binary ./target/aarch64-unknown-linux-gnu/release/kernel ./target/kernel8.img
