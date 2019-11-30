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

 .global __boot // global entry point
 .global __hang // helper to savely "hang" a core with nothing else to do

/***************************************************************************************************
 * main entry point using specific section that is ensured to be linked against the entrypoint
 * address 0x8_0000
 **************************************************************************************************/
.section .text.boot
__boot:
    // for the sake of 100% safety trap all cores except 0 into an endless loop for the time beeing
    // this makes this binary a truely single-core kernel
    mrs 	x0, mpidr_el1   // get CPU id
    and 	x0, x0, #3
    cbnz    x0, __hang
    
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
 * savely hang the core
 * use the WFE instruction to save power while waiting for any event
 * wfe is triggered by any exception/interrupt raised, but as long as there is no event
 * the core sleeps....
 **************************************************************************************************/
 .section .text
 __hang:
    wfe
    b   __hang