/***********************************************************************************************************************
 * Initial setup for the Interrupt trampoline functions that will branch into rust environment
 * in case the corresponding Exception/Interrupt is raised
 *
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **********************************************************************************************************************/
.global VectorTable
.global __exception_handler_Default
.global __interrupt_handler_Default

/**********************************************************************
 * save current core state before running any IRQ handler
 **********************************************************************/
.macro save_state
	sub		sp, sp, #256 // make place at the stack to store all register values
	
	stp		x0, x1, [sp, #16 * 0]
	stp     x2, x3, [sp, #16 * 1]
	stp		x4, x5, [sp, #16 * 2]
	stp		x6, x7, [sp, #16 * 3]
	stp		x8, x9, [sp, #16 * 4]
	stp		x10, x11, [sp, #16 * 5]
	stp		x12, x13, [sp, #16 * 6]
	stp		x14, x15, [sp, #16 * 7]
	stp		x16, x17, [sp, #16 * 8]
	stp		x18, x19, [sp, #16 * 9]
	stp		x20, x21, [sp, #16 * 10]
	stp		x22, x23, [sp, #16 * 11]
	stp		x24, x25, [sp, #16 * 12]
	stp		x26, x27, [sp, #16 * 13]
	stp		x28, x29, [sp, #16 * 14]
	str     x30, [sp, #16 * 15]

	/*	// stack SPSR_EL1 and ELR_EL1
	mrs		x0, spsr_el1
	mrs		x1, elr_el1
	stp     x0, x1, [sp, #16 * 16]
*/
.endm

/**********************************************************************
 * restore last core state after running any IRQ handler
 **********************************************************************/
.macro restore_state
	ldp		x0, x1, [sp, #16 * 0]
	ldp     x2, x3, [sp, #16 * 1]
	ldp		x4, x5, [sp, #16 * 2]
	ldp		x6, x7, [sp, #16 * 3]
	ldp		x8, x9, [sp, #16 * 4]
	ldp		x10, x11, [sp, #16 * 5]
	ldp		x12, x13, [sp, #16 * 6]
	ldp		x14, x15, [sp, #16 * 7]
	ldp		x16, x17, [sp, #16 * 8]
	ldp		x18, x19, [sp, #16 * 9]
	ldp		x20, x21, [sp, #16 * 10]
	ldp		x22, x23, [sp, #16 * 11]
	ldp		x24, x25, [sp, #16 * 12]
	ldp		x26, x27, [sp, #16 * 13]
	ldp		x28, x29, [sp, #16 * 14]
	ldr     x30, [sp, #16 * 15]

	/*
	// restore SPSR_EL1 and ELR_EL1
	ldp		x0, x1, [sp, #16 * 16]
	msr     elr_el1, x1
	msr     spsr_el1, x0
*/
	add		sp, sp, #256 // free the stack as it is no longer needed
.endm


.macro call_irq_dump esr spsr far elr
	mrs x1, \esr
	mrs x2, \spsr
	mrs x3, \far
	mrs x4, \elr
    //bl  __irq_dump
	eret
.endm


/**********************************************************************
 * implementation of the trampolines
 **********************************************************************/
__irq_trampoline:
	// stack the current state (before exception handling)
	save_state
	// call the generic interrupt handler that dispatches the calls
	bl __interrupt_h
	// restore the state from before eyception handling
	restore_state
	
    eret	// return from exception handling to normal processing

.weak __exception_handler_Default
__exception_handler_Default:
	eret

.weak __interrupt_handler_Default
__interrupt_handler_Default:
	eret

/********************************************************************
 * The vector table for aarch64 exceptions
 * The table need to start at a 2kB aligned address and store the 
 * different entries each aligned to 128Byte containing at most 32
 * instructions. Usually each exception level does have it's own table
 * but we will re-use the same for all levels
 ********************************************************************/
.balign 0x800
VectorTable:
// Current EL with SP0
EXC_CURREL_SP0_Sync: 
	mov		x0, #1
	call_irq_dump esr_el2 spsr_el2 far_el2 elr_el2

.balign 0x80
EXC_CURREL_SP0_Irq:
	b	__irq_trampoline

.balign 0x80
EXC2_CURREL_SP0_FIq:
	b	__irq_trampoline

.balign 0x80
EXC_CURREL_SP0_SErr:
	mov	x0, #4
	call_irq_dump esr_el2 spsr_el2 far_el2 elr_el2

// Current EL with SPx
.balign 0x80
EXC_CURREL_SPX_Sync:
	mov	x0, #5
	call_irq_dump esr_el2 spsr_el2 far_el2 elr_el2

.balign 0x80
EXC_CURREL_SPX_Irq:
	b	__irq_trampoline

.balign 0x80
EXC_CURREL_SPX_FIq:
	b	__irq_trampoline

.balign 0x80
EXC_CURREL_SPX_SErr:
	mov	x0, #8
	call_irq_dump esr_el2 spsr_el2 far_el2 elr_el2

// Lower EL using AARCH64
.balign 0x80
EXC_LOWER64_SPX_Sync:
	mov	x0, #9
	call_irq_dump esr_el2 spsr_el2 far_el2 elr_el2

.balign 0x80
EXC_LOWER64_SPX_Irq:
	mov	x0, #10
	call_irq_dump esr_el2 spsr_el2 far_el2 elr_el2

.balign 0x80
EXC_LOWER64_SPX_FIq:
	mov	x0, #11
	call_irq_dump esr_el2 spsr_el2 far_el2 elr_el2

.balign 0x80
EXC_LOWER64_SPX_SErr:
	mov	x0, #12
	call_irq_dump esr_el2 spsr_el2 far_el2 elr_el2

// Lower EL using AARCH32
.balign 0x80
EXC_LOWER32_SPX_Sync:
	mov	x0, #13
	call_irq_dump esr_el2 spsr_el2 far_el2 elr_el2

.balign 0x80
EXC_LOWER32_SPX_Irq:
	mov	x0, #14
	b	__irq_trampoline

.balign 0x80
EXC2_LOWER32_SPX_FIq:
	mov	x0, #15
	b	__irq_trampoline

.balign 0x80
EXC2_LOWER32_SPX_SErr:
	mov	x0, #16
	call_irq_dump esr_el2 spsr_el2 far_el2 elr_el2

.balign 0x80
VectorTableEnd:
	nop
