/***********************************************************************************************************************
 * core boot code once the raspberry pi has powered.
 * The bootcode.bin ensures that all cores except core 0 is parked and the core 0 will be kicked off
 * executiung code at start adress 0x80000 (in aarch64 mode)
 * Thus the entrypoint "__boot" need to link at adress 0x80000 when the RusPiRo-Bootloader is build and linked into the
 * kernel8.img file
 *
 * The main purpose of the bootloader is to provide an environment to except executable code via the UART1 inbound
 * channel to improve development experience and remove the "SD-card-dance" during bare-metal development for the
 * Raspberry Pi.
 * 
 * The bootloader itself will always execute in 64Bit mode where the bare-metal kernel loaded by the same might be
 * either 64Bit or 32Bit
 *
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **********************************************************************************************************************/

.global __boot
.global __hang
.global __re_boot

.section .text.boot 
__boot:
/******************************************************
 * This is the entry point for any core so do all
 * required initial stuff here before we can hand over
 * to rust environment of our bootloader
 ******************************************************/
    // for the sake of 100% safety trap all cores except 0 into an endless loop
    mrs 	x0, mpidr_el1   // get CPU id
    and 	x0, x0, #3
    cbnz    x0, __hang

    // usually the core is kicked off in EL2(Aarch64) mode by the RPi boot stub triggered to be
    // executed from the GPU, as any loaded kernel therefor expects to meet the same situation
    // we keep the core executing in EL2
    
    // set the stack pointer
    ldr		x0,=__stack_top_EL2__
    mov     sp, x0

/****************************************************
 * setup the interrupt/exception handler table
 ****************************************************/
    adr    x0, VectorTable
    msr    vbar_el2, x0
    
    // configure IRQ routing to EL2, otherwise no interrupt is triggered in EL2 mode
    mrs    x0, hcr_el2
    orr    x0, x0, #(1 << 3 | 1 << 4 | 1 <<5) // route Abort, IRQ and FIQ to EL2
    msr    hcr_el2, x0

    // as we can't set a vector table for EL3 here and we have seen the first entry is expected to
    // be at 0x400 we configure this entry to call the function that switches by copying the 
    // jump call to this address
    adr     x0, __switch_aarch32_trampoline
    // EL3 exception vector table starts at 0x0
    // the vector entry we need to set is "LOWER_EL_A64_SPx_SYNC"
    // this entry is 8*0x80 away from the vector table start address
    mov     x1, #0x400      // EL3 exception vector table entry
    ldp     x2, x3, [x0]        // lower 32 bit contains the jump instruction
    lsr     x5, x2, #32
    lsl     x5, x5, #32
    and     w2, w2, #(0xFF00 << 16)
    adr     x4, __boot_aarch32 // get the address of the jump address
    sub     x4, x4, x1 // get the delta from the exception table jumping address
    lsr     x4, x4, #2     // shift the delta right by 2 to get the delta address stored in the
    orr     w2, w2, w4
    orr     x2, x5, x2
    stp     x2, x3, [x1]

    mov x0, #17
    bl lit_led

/**********************************************************
 * Setup the MMU as this need to be configured and enabled
 * for the atomic operations used in rust code.
 * it uses a simple 1:1 mapping
 **********************************************************/
    bl      __setup_mmu

/******************************************************
 * disable alignment checks (this only works if the MMU
 * is enabled). It's necessary as the rust compiler might
 * generate optimized code that does not care for proper
 * alignment for memory access.
 ******************************************************/
    mrs		x1, sctlr_el2
    mov     x2, #(1 << 3 | 1 << 1) 
	bic     x1, x1, x2  // clear SA and A bits
	msr     sctlr_el2, x1
	isb

/******************************************************
 * clear the BSS section
 ******************************************************/
.bss_init:
// get current CPUid
	mrs     x3, mpidr_el1
	and     x3, x3, #3
	cbnz	x3, .bss_done					// bss section clear only need to be done on core0

	/* Zero out the bss section right before switching into Rust code to ensure all static initializations are done */
	ldr		x0, =__bss_start__
	ldr		x2, =__bss_end__
    sub     x2, x2, x0
    lsr     x2, x2, #3

.bss_zero_loop:
    cbz     x2, .bss_done
	str     xzr, [x0], #8
    sub     x2, x2, #1
    cbnz    x2, .bss_zero_loop

.bss_done:
    // enable all interrupts
    msr daifclr, #15

    mov x0, #18
    bl lit_led
/*
    // copy some data from the kernel7 binary to 0x8000
    ldr    x0, =0x8000
    adr    x1, TestKernelAarch32
    adr    x4, TestKernelAarch32_end
    sub    x4, x4, x1
    lsr    x4, x4, #4

.copy_kernel:
    ldp    x2, x3, [x1], #16
    stp    x2, x3, [x0], #16
    sub    x4, x4, #1
    cbnz   x4, .copy_kernel
.copy_done:
*/
    mov x0, #21
    bl lit_led

    // test aarch32 eret
    //smc     #0x8000

    b		__rust_entry
/******************************************************
 * usually __rust_entry never returns, but in case it does
 * savely hang the CPU here
 ******************************************************/
    b       __hang

.section .text
// hang any core. Save power with a "wait for event".
__hang:
    wfe
    b __hang

.align 4
__switch_aarch32_trampoline:
    b       __boot_aarch32
    nop
    nop
    nop

.align 4
__boot_aarch32:
    // as this is the first time we are in EL3 setup a stack pointer!
    ldr x0, =__stack_top_EL3__
    mov sp, x0

    sub sp, sp, #16
    stp x0, x30, [sp]

    mov x0, #20
    bl lit_led
    
    bl __disable_mmu

    ldp x0, x30, [sp]
    add sp, sp, #16

    // if we get here this is a call to EL3 to switch to aarch32
	mrs     x0, esr_el3
	and     x0, x0, #0xFFFF
	// load the boot address into the return address
	msr     elr_el3, x0
	// configure the return mode to be aarch32
    mrs     x2, scr_el3
	mov		x1, #(1 << 10)
	bic     x1, x2, x1
	msr     scr_el3, x1
    // configure return state to be aarch32 HYP
    mov     x0, #0b11010
    msr     spsr_el3, x0
	eret	// return to el2/hyp in aarch32 mode

/*******************************************************
 * "re-boot" the pi by executing from the address given
 *******************************************************/
.align 8
__re_boot:
    // before calling the freshly loaded kernel
    // disable all interrupts
    msr daifset, #15

    // clean instruction cache
    ic      iallu
    // based on the call mode provided as X1 we can either stay in aarch64
    // or need to switch to aarch32
    cmp     x1, #64
    beq     re_boot_64

    cmp     x1, #32
    beq     re_boot_32

    // if neither aarch32 not aarch64 was requested hang here....
    b       __hang

re_boot_32:
    // TODO: switch to aarch32 mode. This would require to call into EL3
    // (SecureMonitorCall) as aarch64 and return into EL2 (HYP) in aarch32
    // when calling SMC the exception handler will be called and need to handle
    // the return into aarch32
    smc     #0x8000
    b       __hang  // in case something went wrong hang here savely

re_boot_64:
    // just start execution at the given address
    // TODO: how about the other cores ?
    br      x0
    b       __hang // hang here safely

/*
.section .rodata
.global TestKernelAarch32
.balign 16
TestKernelAarch32:
.incbin "../test-kernel/target/kernel7.img"
.global TestKernelAarch32_end
TestKernelAarch32_end:
.byte 0
*/