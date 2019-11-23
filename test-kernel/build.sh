#!/bin/sh

set +ev

# chekc which aarch version to build
if [ $1 = "64" ]
    then
        # aarch64
        export CFLAGS='-march=armv8-a -Wall -O3 -nostdlib -nostartfiles -ffreestanding -mtune=cortex-a53'
        export RUSTFLAGS='-C linker=aarch64-elf-gcc -C target-cpu=cortex-a53 -C target-feature=+a53,+fp-armv8,+neon -C link-arg=-nostartfiles -C link-arg=-T./link64.ld -C opt-level=3 -C debuginfo=0'
        export CC='aarch64-elf-gcc'
        export AR='aarch64-elf-ar'

        cargo xbuild --target aarch64-unknown-linux-gnu --release --all
        cargo objcopy -- -O binary ./target/aarch64-unknown-linux-gnu/release/kernel ./target/kernel8.img
        ../dev-host/target/release/ruspiro-push -k ./target/kernel8.img -p COM5
elif [ $1 = "32" ]
    then
        # aarch32
        export CFLAGS='-mfpu=neon-fp-armv8 -mfloat-abi=hard -march=armv8-a -Wall -O3 -nostdlib -nostartfiles -ffreestanding -mtune=cortex-a53'
        export RUSTFLAGS='-C linker=arm-eabi-gcc.exe -C target-cpu=cortex-a53 -C target-feature=+a53,+fp-armv8,+v8,+vfp3,+d16,+thumb2,+neon -C link-arg=-nostartfiles -C link-arg=-T./link32.ld -C opt-level=3 -C debuginfo=0'
        export CC='arm-eabi-gcc.exe'
        export AR='arm-eabi-ar.exe'

        cargo xbuild --target armv7-unknown-linux-gnueabihf --release --bin kernel --target-dir ./target/
        cargo objcopy -- -O binary ./target/armv7-unknown-linux-gnueabihf/release/kernel ./target/kernel7.img
        ../dev-host/target/release/ruspiro-push -k ./target/kernel7.img -p COM5
else
    echo 'provide the archtitecture to be build. Use either "build.sh 32" or "build.sh 64"'
fi
