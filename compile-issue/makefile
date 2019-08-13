#*****************************************************************
# Makefile to build the RusPiRo kernel
# setting the necessary environment for cross compiling
#
# Copyright (c) 2019 by the authors
# 
# Author: André Borrmann 
# License: Apache License 2.0
#******************************************************************
CARGO_BIN = "$(USER_ROOT)\\.cargo\\bin"
ARM_GCC_BIN = "$(USER_ROOT)\\arm-gcc\\gcc-arm-eabi\\bin"
ARM_GCC_LIB = "$(USER_ROOT)\\arm-gcc\\gcc-arm-eabi\\lib\\gcc\\arm-eabi\\8.3.0"
LINKERSCRIPT = ./link.ld

TARGET = armv7-unknown-linux-gnueabihf
TARGETDIR = target\\armv7-unknown-linux-gnueabihf\\release

# environment variables needed by cargo xbuild
export PATH +=  "$(PROJECT_ROOT);$(ARM_GCC_BIN);$(ARM_GCC_LIB);$(CARGO_BIN)"
export CC = arm-eabi-gcc.exe
export AR = arm-eabi-ar.exe
export CFLAGS = -mfpu=neon-fp-armv8 -mfloat-abi=hard -march=armv8-a -Wall -O3 -nostdlib -nostartfiles -ffreestanding -mtune=cortex-a53
export RUSTFLAGS = -C linker=arm-eabi-gcc.exe -C target-cpu=cortex-a53 -C target-feature=+a53,+fp-armv8,+v8,+vfp3,+d16,+thumb2,+neon -C link-arg=-nostartfiles -C link-arg=-T./link.ld -C opt-level=3 -C debuginfo=0

# specific build step to concatenate the binarry into a file that contains marker the custom bootloader running an 
# my raspberry Pi is looking for to deploy new build version without via UART without the need to toggle the SD card each
# time.
# build the kernel7.img file
all: compile-issue	
	cargo objcopy -- -O binary $(TARGETDIR)\\$< $(TARGETDIR)\\kernel7.img

# cross compile using cargo xbuild
compile-issue: 
# update dependend crates to their latest version
	cargo update
# cross compile the kernel
	cargo xbuild --target $(TARGET) --release --all

clean:
	cargo clean