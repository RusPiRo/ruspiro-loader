#!/bin/sh

set +ev

if [ $# -eq 0 ] 
    then 
        echo "not enough parameter given"
        exit 1
fi

# chekc which aarch version to build
if [ $1 = "64" ]
    then
        # aarch64
        export CFLAGS='-march=armv8-a -Wall -O3 -nostdlib -nostartfiles -ffreestanding -mtune=cortex-a53'
        export RUSTFLAGS='-C linker=aarch64-elf-gcc -C target-cpu=cortex-a53 -C target-feature=+strict-align,+a53,+fp-armv8,+neon -C link-arg=-nostartfiles -C link-arg=-T./link64.ld -C opt-level=3 -C debuginfo=0'
        if [ -z "$3" ]
            then
                export CC='aarch64-elf-gcc'
                export AR='aarch64-elf-ar'
        fi
        cargo xbuild --target aarch64-unknown-linux-gnu --release --all
        cargo objcopy -- -O binary ./target/aarch64-unknown-linux-gnu/release/kernel ./target/kernel8.img
        # after build deploy to device using serial port
        if [ "$2" = "deploy" ]
            then
                ../dev-host/target/release/ruspiro-push -k ./target/kernel8.img -p COM5
        fi
elif [ $1 = "32" ]
    then
        # aarch32
        export CFLAGS='-mfpu=neon-fp-armv8 -mfloat-abi=hard -march=armv8-a -Wall -O3 -nostdlib -nostartfiles -ffreestanding -mtune=cortex-a53'
        export RUSTFLAGS='-C linker=arm-eabi-gcc.exe -C target-cpu=cortex-a53 -C target-feature=+strict-align,+a53,+fp-armv8,+v8,+vfp3,+d16,+thumb2,+neon -C link-arg=-nostartfiles -C link-arg=-T./link32.ld -C opt-level=3 -C debuginfo=0'
        if [ -z "$3" ]
            then
                export CC='arm-eabi-gcc'
                export AR='arm-eabi-ar'
        fi
        cargo xbuild --target armv7-unknown-linux-gnueabihf --release --bin kernel --target-dir ./target/
        cargo objcopy -- -O binary ./target/armv7-unknown-linux-gnueabihf/release/kernel ./target/kernel7.img
        # after build deploy to device using serial port
        if [ "$2" = "deploy" ]
            then
                ../dev-host/target/release/ruspiro-push -k ./target/kernel7.img -p COM5
        fi
else
    echo 'provide the archtitecture to be build. Use either "build.sh 32" or "build.sh 64" followed by "deploy" if you like to deploy to the device'
fi
