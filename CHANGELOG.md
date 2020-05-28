# Changelog
## :pizza: v0.1.1
- ### :wrench: Maintenance
    - Use the ``ruspiro-mmu`` crate for the MMU functions to streamline the MMU config implementations and do not use a
    different one in the bootloader.
    - Update the exception vector table to ensure better stability. 
    - Use ``cargo-make`` to build/compile the crate.

## :pizza: v0.1.0
- ### :bulb: Features
    This is the initial release of the boot loader