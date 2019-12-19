# Changelog
## :carrot: v0.3.0
- ### :bulb: Features
    This is the initial release coming with 3 parts:
    1. `dev-host`: Application for the development host machine that sends a new kernel to the Raspberry Pi using a serial port assuming the Raspberry runs the receiving part.
    2. `dev-target`: Bare metal kernel to be put on the SD card for the Raspberry Pi and waiting for new kernel binaries sent from the `dev-host`.
    3. `test-kernel`: Simple lightweight bare metal that can be used te verify the `dev-host` and `dev-target` parts are working properly and as expected.
    
