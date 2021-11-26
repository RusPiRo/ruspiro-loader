/***************************************************************************************************
 * Raspberry Pi bootstrap code for the bootloader
 *
 * The bootstrapping for the bootloader is build for AArch64. It will be loaded to address 0x8_0000
 * on the Raspberry PI as usual. However, as the booloader is responsible to wait for incomming new
 * kernel files to execute them as they would be loaded from the SD card, this bootstrapper relocates
 * itself to a lower address and continues there. This ensures new kernels of any size could be received
 * and executed.
 * Following assumtions has to be upheld:
 * 1. The Linker script provides the following symbols:
 *  __bootloader_start
 *  __bootloader_end
 *  Those symbols identify the size of the bootloader which requires to be a multiple of 16
 *
 * 2. The linker script assumes the bootloader is running from address 0x1_0000 already
 *
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **************************************************************************************************/

// global entry point
.global __boot
// entry point when an aarch64 kernel has been loaded and need to be run
.global __boot_64
// entry point when an aarch32 kernel has been loaded and need to be run from aarch64 mode
.global __boot_32 
// helper to savely "hang" a core with nothing else to do
.global __hang

/***************************************************************************************************
 * main entry point using specific section that is ensured to be linked against the entrypoint
 * address 0x8_0000
 **************************************************************************************************/
.section .text.boot
__boot:
    // the very first thing to do is to setup the stack pointer.
    // as it is gowing downwards in memory when used we use the address the bootloader
    // will store the arriving kernel as upper bound
    mov     sp, #0x80000

    // as the bootloader is loaded by the PI at address 0x8_0000 we will copy it
    // to a lower address as the original kernel to be loaded by the bootloader 
    // will be stored at this very position
    // for the best copy performance and reliability the bootloader start and end
    // addresses (and thus it's size) should be 16 BIT aligned
    adr    x0, __bootloader_end // provided by the linker script
    adr    x1, __bootloader_start // provided by the linker script
    sub    x0, x0, x1 // gives the size of the bootloader to copy

    mov    x2, #0x10000 // the static address the bootloader will be relocated to
    mov    x1, #0x80000 // the static address the bootloader will be relocated from

    // now copy the whole bootloader to the fixed address
__copy:
    ldp    x3, x4, [x1], #16
    stp    x3, x4, [x2], #16
    sub    x0, x0, #16
    cbnz   x0, __copy

    // calculate the address we'd like to continue code execution
    adr    x0, __boot_continue
    adr    x1, __bootloader_start
    sub    x0, x0, x1
    add    x0, x0, #0x10000
    // jump to the calculated address, the bootloader continues there ;)
    br     x0

__boot_continue:
    // once done we clear the BSS section which contains any static field defined
    // in the Rust code line. This need to be properly initialized as it is expected
    // to be 0 when first accessed
    // as we might want to kickof other cores at a later point to also run the initial
    // bootstrap we check for the current core. As all cores share the same memory the
    // bss section need to and shall be cleared only once...
	mrs     x3, mpidr_el1       // read CoreId from register
	and     x3, x3, #3          // mask coreId value
	cbnz	x3, .bss_done	    // only continue with bss clear on core 0

	adr		x0, __bss_start__  // linker file ensures alignment to 16Bit's for start and end
	adr		x2, __bss_end__ 
    sub     x2, x2, x0
    lsr     x2, x2, #4
    cbz     x2, .bss_done       // if bss section size is 0 -> skip initialization
.bss_zero_loop:
    
	stp     xzr, xzr, [x0], #16
    sub     x2, x2, #1
    cbnz    x2, .bss_zero_loop

.bss_done:

    // next we setup the exception vector table that will act as a trampoline for
    // all exceptions into the handler written in Rust code
    adr     x0, __ExceptionVectorTable
    msr     vbar_el2, x0
    // after maintaining the exception vector table ensure exceptions are routed to EL2
    // as they usually are routet to EL1, but we keep running in EL2
    mrs     x0, hcr_el2
    orr     x0, x0, #(1 << 3 | 1 << 4 | 1 << 5) // route Abort, IRQ and FIQ to EL2
    msr     hcr_el2, x0

    // now call rust code entry point.
    mrs     x0, mpidr_el1       // read CoreId from register
	and     x0, x0, #3          // mask coreId value
    b   __rust_entry

    // usually this will never return. However to be an the save side, when ever we got back
    // safely hang this core
    b   __hang

/***************************************************************************************************
 * run an aarch64 kernel image from within aarch64 mode.
 * There is usually nothing special to be done, but to be in a compareable state as with the aarch32
 * mode we switch from EL2 -> EL1 to execute the just loaded kernel
 * x0 -> address the kernel is loaded to
 * x1 -> core number that executes this switch
 **************************************************************************************************/
.section .text
__boot_64:
    msr     elr_el2, x0 // store the address we'd like to return to with a EL2->EL1 switch
    msr     sctlr_el1, xzr  // initialize SCTRL_EL1 register before switching to EL1
     // enable AArch64 when switching to EL1 (otherwise EL1 would be executed in aarch32)
    mov     x2, #(1 << 31)      // AArch64
    orr     x2, x2, #(1 << 1)   // SWIO hardwired on Pi3
    msr     hcr_el2, x2
    mrs     x2, hcr_el2

	mrs     x2, cnthctl_el2 // enable CNTP for EL1
    orr     x2, x2, #3
    msr     cnthctl_el2, x2
    msr     cntvoff_el2, xzr

    // set the SPSR_EL2 to a valid value before returning to EL1
    // this would have been usually set when capturing an exception from EL1 to EL2
    // as we would like to return we set the values as we would like to find them
    // configured once we are in EL1
    mov     x2, #(0b0101 << 0 | /* M[3:0] exception taken from El1h  */ \
                  0 << 4 | /* exception taken from aarch64 */ \
                  1 << 6 | /* mask FIQ */ \
                  1 << 7 | /* Mask IRQ */ \
                  1 << 8 | /* Mask Abort */ \
                  1 << 9)  /* Mask Debug */
    msr     spsr_el2, x2
    //msr     elr_el2, x0

    // before we can actually lift this core to EL1 to execute the just loaded kernel
    // we need to ensure that the other cores are also in a state this kernel expects
    // so we need to kick them off, perform the exception level switch and park them again
    mrs     x1, mpidr_el1
    and     x1, x1, #3
    //cbnz    x1, .return64 // all cores != 0 can return in EL1 to the given address
    b .return64
    
    // store the address the cores should be kicked off with in the respective
    // memory locations
    adr     x23, __switch_and_park_secondary_cores_64
    // base spin address (see [https://github.com/raspberrypi/tools/blob/master/armstubs/armstub8.S])
    mov     x22, #0xd8      
    str     x23, [x22, #8]  // core 1 (0xE0)
    str     x23, [x22, #16] // core 2 (0xE8)
    str     x23, [x22, #24] // core 3 (0xF0)
//    bl      __cleaninvalidate_dcache // ensure the other cores get the memory update
                                     // by clearing/invalidating the cache
    sev     // now wake up all the other cores
    // the secondary cores will clear their jump address and park after they have been switched to
    // EL1, so wait here until all other cores are parked
.wait_secondary_el1_64:
//    bl      __cleaninvalidate_dcache // ensure we are not reading the old value from the cache
    ldr     x0, [x22, #8] // check core 1
    cbnz    x0, .wait_secondary_el1_64
    ldr     x0, [x22, #16] // check core 2
    cbnz    x0, .wait_secondary_el1_64
    ldr     x0, [x22, #24] // check core 3
    cbnz    x0, .wait_secondary_el1_64

    // all secondary cores should now be parked in EL1, continue to return to EL1 on
    // the main core as well
.return64:
    eret    // return from EL2 -> EL1 and never come back

/***************************************************************************************************
 * Switch any secondary core from EL2 to EL1 and park them in the same way they are parked
 * after a fresh re-start of the raspberry Pi
 **************************************************************************************************/
__switch_and_park_secondary_cores_64:
    // now switch EL2 -> 1 for this core and come back to the .prepare_park_el1
    // function to park the core again
    adr     x0, .prepare_park_el1_64
    b       __boot_64

.prepare_park_el1_64:
    // now we are in EL1 and should park the core 
    // get the core id that is currently running
    mrs     x2, mpidr_el1
    and     x2, x2, #3
    // clear the storage address that kicked this core
    // this indicates also to the main core that this one is properly prepared
    mov     x3, #0xd8
    str     xzr, [x3, x2, lsl 3]

.park64:
    // now wait
    wfe
    // read the storage address that should kick this core
    mov     x3, #0xd8
    ldr     x0, [x3, x2, lsl 3]
    cbz     x0, .park64 // as long as no jump address is provided, keep parked
    br      x0

/***************************************************************************************************
 * run an aarch32 kernel image from within aarch64 mode.
 * This requires an architecture change that is only possible with an exception level switch:
 * 1. From aarch64 EL2 -> aarch64 EL3
 * 2. Return from aarch64 EL3 into aarch32 HYP
 **************************************************************************************************/
.section .text
__boot_32:
    // to boot into aarch32 return from EL2 into EL1 to switch the architecture mode
    msr     elr_el2, x0 // eret return address is the 32Bit kernel image given to this function
    // configure spsr_el2 and hcr_el2 to ensure we are returning to EL1(SYS)/aarch32
    mrs     x10, hcr_el2
    bic     x10, x10, #(1 << 31) // especially bit 31 = 0 -> lower level = aarch32
    //bic     x10, x10, #(1 << 0)  // bit 0 - deactivate MMU in EL0/1 stage 2 translations
    msr     hcr_el2, x10
    //mov     x1, #(1 << 4) // M[4] bit = 1 -> EL2 came from aarch32
    //mov     x2, #0b0011 // M[3:0] -> EL2 came from SVC (supervisor)
    //orr     x1, x1, x2
    mov     x2, #(0b0011 << 0 | /* M[3:0] exception taken from SVC  */ \
                  1 << 4 | /* M[4] exception taken from aarch32 */ \
                  1 << 6 | /* mask FIQ */ \
                  1 << 7 | /* Mask IRQ */ \
                  1 << 8)  /* Mask Abort */
    msr     spsr_el2, x2

    // before returning to EL1 also ensure that interrupts are no longer routet to EL2
    mrs     x0, hcr_el2
    bic     x0, x0, #(1 << 3 | 1 << 4 | 1 << 5) // don't route Abort, IRQ and FIQ to EL2
    msr     hcr_el2, x0

    // before we can actually lift this core to aarch32(SVC) to execute the just loaded kernel
    // we need to ensure that the other cores are also in a state this kernel expects
    // so we need to kick them off, perform the exception level switch and park them again
    mrs     x1, mpidr_el1
    and     x1, x1, #3
    cbnz    x1, .return32 // all cores != 0 can return directly to aarch32 to the given address
    
    // store the address the cores should be kicked off with in the respective
    // memory locations
    adr     x23, __switch_and_park_secondary_cores_32
    // base spin address (see [https://github.com/raspberrypi/tools/blob/master/armstubs/armstub8.S])
    mov     x22, #0xd8      
    str     x23, [x22, #8]  // core 1 (0xE0)
    str     x23, [x22, #16] // core 2 (0xE8)
    str     x23, [x22, #24] // core 3 (0xF0)
//    bl      __cleaninvalidate_dcache // ensure the other cores get the memory update
                                     // by clearing/invalidating the cache
    sev     // now wake up all the other cores
    // the secondary cores will clear their jump address and park after they have been switched to
    // EL1, so wait here until all other cores are parked
.wait_secondary_el1_32:
//    bl      __cleaninvalidate_dcache // ensure we are not reading the old value from the cache
    ldr     x0, [x22, #8] // check core 1
    cbnz    x0, .wait_secondary_el1_32
    ldr     x0, [x22, #16] // check core 2
    cbnz    x0, .wait_secondary_el1_32
    ldr     x0, [x22, #24] // check core 3
    cbnz    x0, .wait_secondary_el1_32

    // all secondary cores should now be parked in aarch32(SVC), continue to return to this on
    // the main core as well
.return32:    
    eret    // return to EL1 - we should never come back here   



/***************************************************************************************************
 * Switch any secondary core from EL2 to aarch32(SVC) and park them in the same way they are parked
 * after a fresh re-start of the raspberry Pi
 **************************************************************************************************/
__switch_and_park_secondary_cores_32:
    // now switch EL2 -> 1 for this core and come back to the .prepare_park_el1
    // function to park the core again    
    adr     x0, .prepare_park_el1_32
    b       __boot_32

.prepare_park_el1_32:
    // reaching this point we are in aarch32 mode so we need to include
    // the aarch32 assembly to properly park the core and clear the original
    // jump address
    .word 0xee100fb0 	//mrc	15, 0, r0, cr0, cr0, {5}
    .word 0xe2000003 	//and	r0, r0, #3
    .word 0xe1a01180 	//lsl	r1, r0, #3
    .word 0xe3a04000 	//mov	r4, #0
    .word 0xe3a05000 	//mov	r5, #0
    .word 0xe3a030d8 	//mov	r3, #216	; 0xd8
    .word 0xe18340f1 	//strd	r4, [r3, r1]
    .word 0xe59f1014 	//ldr	r1, [pc, #20]	; 8550 <.park32+0x18>
.park32:
    .word 0xe320f002 	//wfe
    .word 0xe7912200 	//ldr	r2, [r1, r0, lsl #4]
    .word 0xe3520000 	//cmp	r2, #0
    .word 0x0afffffb 	//beq	8538 <.park32>
    .word 0xe7812200 	//str	r2, [r1, r0, lsl #4]
    .word 0xe12fff12 	//bx	r2
    .word 0x400000cc 	//.word	0x400000cc - core 0 mailbox 3 read

/***************************************************************************************************
 * savely hang the core
 * use the WFE instruction to save power while waiting for any event
 * wfe is triggered by any exception/interrupt raised, but as long as there is no event
 * the core sleeps....
 **************************************************************************************************/
 .section .text
 __hang:
    wfe
    b   __hang
