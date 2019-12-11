/***************************************************************************************************
 * Raspberry Pi bootstrap code.
 * This is the minimal preparation to brach into the "Rust" code line for further initialization
 * and setup for the current kernel to be run at the Raspberry Pi.
 * 
 * This is the Aarch64 version of the bootstrapping. It assumes:
 * 1. There is actually only the main core entering this code
 * 2. The bootcode.bin/start.elf have parked the other cores of the CPU
 * 3. The current core is entering this code in EL2
 * 4. The start address of the entry point is 0x8_0000 which has to be ensured by the linker script
 * 5. The linker script also provides at least the following symbols:
 *
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
    ldr		x0,=__stack_top_EL2__
    mov     sp, x0

    // once done we clear the BSS section which contains any static field defined
    // in the Rust code line. This need to be properly initialized as it is expected
    // to be 0 when first accessed
    // as we might want to kickof other cores at a later point to also run the initial
    // bootstrap we check for the current core. As all cores share the same memory the
    // bss section need to and shall be cleared only once...
	mrs     x3, mpidr_el1       // read CoreId from register
	and     x3, x3, #3          // mask coreId value
	cbnz	x3, .bss_done	    // only continue with bss clear on core 0

	ldr		x0, =__bss_start__  // linker file ensures alignment to 16Bit's for start and end
	ldr		x2, =__bss_end__ 
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
    //movz    x1, #0x800, lsl #16 // route also TGE (1 << 27)
    //orr     x0, x0, x1
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
 **************************************************************************************************/
.section .text
__boot_64:
    //adr     x0, TestKernelAarch64
    // TODO: switch to EL1 need to be implemented, for the time beeing just call the new kernel
    br      x0
    b       __hang


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
    msr     hcr_el2, x10
    mov     x1, #(1 << 4) // M[4] bit = 1 -> EL3 came from aarch32
    mov     x2, #0b0011 // M[3:0] -> EL2 came from SVC (supervisor)
    orr     x1, x1, x2
    msr     spsr_el2, x1

    eret    // return to EL1 - we should never come back here   


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

/*******************************************************************************
 *
 *******************************************************************************/
.section .rodata
.global TestKernelAarch32
.balign 0x4000
TestKernelAarch32:
.incbin "../test-kernel/target/kernel7.img"
.global TestKernelAarch32_end
TestKernelAarch32_end:
.byte 0

/*******************************************************************************
 *
 *******************************************************************************/
.section .rodata
.global TestKernelAarch64
.balign 0x4000
TestKernelAarch64:
.incbin "../test-kernel/target/kernel8.img"
.global TestKernelAarch64_end
TestKernelAarch64_end:
.byte 0
