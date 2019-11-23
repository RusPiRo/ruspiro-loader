# RusPiRo Loader

The RusPiRo loader intents to increase development cycle performance when testing code on the real hardware of the Raspberry Pi without the usual microSD card dance.

> **HINT:** The current version of this loader is tested on Raspberry Pi 3 (B+) only.

The loader comes with two parts:

## dev-target
This part will be compiled to run as kernel on the actual Raspberry Pi hardware. It will be the kernel stored on the microSD card. Once the Pi is powered up it will listen to the UART interface to receive a new kernel binary to be run. To try out a new kernel just reboot the Raspberry Pi and the boot loader will listen again. The loader supports running 32Bit and 64Bit kernels.

### Pre-requisits
To cross compile the part for the Raspberry Pi the respective arm toolchain should be downloaded from here: https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads. Based on the hosting machine choose the `aarch64-elf bare-metal target` one.
In addition, when using the makefile to build the kernel also `mingw-make` is required on a windows machine.

Once the toolchain is installed definately Rust need to be installed as well. As some of the features used in the kernel are not yet stabelized the nightly version of Rust is needed. First download and install Rustup from [here](https://www.rust-lang.org/tools/install). Once `rustup` is ready (the build tool `cargo` will be automatically installed as well) the rust nightly toolchain, build target for raspberry Pi, the cross build tool `cargo-xbuild` and the sources for the rust core `rust-src` need to be added like so:
```
$> rustup toolchain install nightly-gnu
$> rustup default nightly-gnu
$> rustup target add aarch64-unknown-linux-gnu
$> rustup component add rust-src
$> cargo install cargo-xbuild
```

In case the current nightly contains issues check the current build state [here](https://rust-lang-nursery.github.io/rust-toolstate/). Also checkout the history [there](https://rust-lang.github.io/rustup-components-history/) for the last nightly build containing all required components and install them like so (assuming the build from 2019-11-17 was the requested earlier version):
```
$> rustup toolchain install nightly-2019-11-17-gnu
```
### Building
To build the bootload kernel just execute `make all` or the `build.sh` script from the `dev-target` folder. If the build succeds the final binary `kernel8.img`could be found in the folder `./dev-target/target/`. Copy this file to an empty microSD card that is formatted as FAT32. In addition put the `bootcode.bin` and `start.elf` files available on the official Raspberry Pi [firmware page](https://github.com/raspberrypi/firmware/tree/master/boot) on this card.

To verify that the booloader is working as expected you need to do the following:
1. connect a LED with a resistor to GPIO pin 17
2. connect the miniUART GPIO pins to through a UART/USB dongle to the host machine
3. start a terminal program on the machine to connect to the serial port the Raspberry Pi is connected and set the speed to `115200`.
4. Put the microSD card containing the recently build `kernel8.img`, `bootcode.bin` and `start.elf` files into your Raspberry Pi and power the same on.

As a result the LED should be lit and the console should print (the version number may differ):
```
########## RusPiRo --------- Bootloader v1.0 --------- ##########
```


## dev-host
This part will be compiled to run on the development/host machine where new versions of your own baremetal Raspberry Pi kernels are beeing developed. The resulting binary could be used within the build pipeline to conviniently deploy new versions to the real hardware.

### Pre-requisites
The build will target the actual host machine. This means a corresponding GCC - dependend on the host architectur need to be installed. When installing Rust the first time on this machine the tool usually informs you and proposes a GCC toolchain to be used on your machine. On Windows this could be either the Visual Studio C++ compiler or any GNU compiler.

You may want to verify that proper toolchain and build target is available using the following command:
```
$> rustup toolchain list
stable-x86_64-pc-windows-gnu
nightly-x86_64-pc-windows-gnu (default)
```
As I'm on a windows machine, those toolchains are fine for me. To build the host part the nightly build is not required so you could switch to use the stable build for this activity like so:
```
$> rustup default stable-gnu
```
But don't forgett to set this back to nightly before cross compiling a new kernel for Raspberry Pi.

### Build
To build the host program you only need to run the following command inside the `dev-host` subfolder:
```
$> cargo build --release
```

This will create the `ruspiro-push` binary in the folder `./dev-host/target/release`.

### Use
To push an actual kernel file to the Raspberry Pi, it has to be conneted first via UART on RPi side and a serial Port (TTL->USB dongle).

If this is done you could use the command line to push a kernel like so:
```
$> ruspiro-push -k ./path-to-file/kernel8.img -p COM5
```
The logical name of the serial port may differ especialy if you are running it on a Mac. A full list of options and some documentation is available through:
```
$> ruspiro-push --help
```

## Test
To verify the bootloader parts are working as expected there is a `test-kernel` provided. Put the bootloader part on the Raspberry Pi's SD card, connect the Pi via UART to the development machine and power the Pi. Then build the `dev-host` crate which will create the `ruspiro-push` binary.

No you could build the test kernel as aarch32 or aarch64 and deploy it to the Raspberry Pi by either executing make or run the build script like follows.

Build and deplay in aarch32 mode:

```
$> make deploy32
```

Build and deplay in aarch64 mode:

```
$> make deploy64
```

This should build the test kernel and push it using the COM5 serial port to the Raspberry Pi. Please adjust the respective serial port in the makefile if it differs on your machine.

The test kernel will lit a LED connected to GPIO 17 and will blink a LED connected to GPIO 18 of the Raspberry Pi.