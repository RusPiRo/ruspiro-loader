# RusPiRo Bootloader

The RusPiRo bootloader intents to increase development cycle performance when testing code on the 
real Raspberry Pi without the usual microSD card "dance".

> **HINT:** The current version of this loader is tested on Raspberry Pi 3 (B+) only.

The bootloader will be compiled to run as a bare metal kernel on the Raspberry Pi. It will be stored
on the microSD card. Once the Pi is powered up it will listen to the UART interface to receive a new
kernel binary to be run. To try out a new kernel just reboot the Raspberry Pi and the boot loader
will listen again. The loader supports running 32Bit and 64Bit kernels.

### Pre-requisits
To cross compile the bootloader the respective arm toolchain should be downloaded from
[here](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads).
Based on your hosting machine (Windows/Linux) choose the `aarch64-elf bare-metal target` one.
In addition, when you are on Windows OS you should also install `mingw-make` to be able to run the 
makefiles provided with the source code of this crate. The bootloader is always compiled to an Aarch64
build target architecture.

Once the compiler toolchain is installed Rust need to be installed as well. As some of the features
used in the kernel are not yet stabelized the `nightly` version of Rust is needed. First download
and install Rustup from [here](https://www.rust-lang.org/tools/install). Once `rustup` is ready 
(the build tool `cargo` will be automatically installed as well) the rust nightly toolchain, the 
build target for raspberry Pi, the cross build tool `cargo-xbuild` and the sources for the rust core
`rust-src` need to be added like so:
```
$> rustup toolchain install nightly-gnu
$> rustup default nightly-gnu
$> rustup target add aarch64-unknown-linux-gnu
$> rustup component add rust-src
$> cargo install cargo-xbuild
```

As final step also install the custom cargo subcommand to transfer new kernel image files to the
Raspberry Pi this bootloader is waiting for:
```
$> cargo install cargo-ruspiro-push
```

### Building
To build the bootloader kernel just execute `make all` or the `build.sh` script from the `root folder`
of this project. If the build succeeds the final binary `kernel8.img` could be found in the folder 
`./target/`. Copy this file to an empty microSD card that is formatted as FAT32. In addition put the
`bootcode.bin` and `start.elf` files available on the official Raspberry Pi [firmware page](https://github.com/raspberrypi/firmware/tree/master/boot)
on this card.

To verify that the booloader is working as expected you need to do the following:
1. connect the miniUART GPIO pins to through a UART/USB dongle to the host machine
2. start a terminal program on the machine to connect to the serial port the Raspberry Pi is connected and set the speed to `115200`.
3. Put the microSD card containing the recently build `kernel8.img`, `bootcode.bin` and `start.elf` files into your Raspberry Pi and power the same on.

As a result the console should print (the version number may differ) at least:
```
########## RusPiRo --------- Bootloader v1.0 --------- ##########
```

## Test
To verify the bootloader parts are working as expected there is a `test-kernel` provided. Put the
bootloader part on the Raspberry Pi's SD card, connect the Pi via UART to the development machine
and power the Pi. Now you could build the test kernel as aarch32 or aarch64 and deploy it to the
Raspberry Pi like so:

Host \ Target arch | Aarch32 | Aarch64
-------------------|---------|---------
Windows|<pre>$> make deploy32</pre>|<pre>$> make deploy64</pre>
Linux|<pre>$> ./build.sh 32 deploy</pre>|<pre>$> ./build.sh 64 deploy</pre>

This should build the test kernel and push it using the COM5 serial port to the Raspberry Pi. Please adjust the respective serial port in the makefile if it differs on your machine.

The test kernel will blink a LED connected to GPIO 17 of the Raspberry Pi when successfully deployed and run.

## License
This crate is licensed under MIT license ([LICENSE](LICENSE) or http://opensource.org/licenses/MIT)