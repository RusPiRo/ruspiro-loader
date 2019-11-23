/***********************************************************************************************************************
 * Raspberry Pi3 MMU related functions
 *
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **********************************************************************************************************************/

/**********************************************************
 * setup the TTLB table at 0x1000
 **********************************************************/
__setup_ttlb:
	//stp		x0, x30, [sp, #-16]!
	// set the start address of the translation table to be at 0x40000
	mov		x0, 0x1000

	// set the level 0 entries.
	// this is just two entry which is a table entry pointing to the next translation level
	// this is required when using 4kB granule translation mapping
	// one entry contains the address to the next level table bits [47:12]
	// and covers 1GB virtual address space 0x0000_0000 - 0x3FFF_FFFF
	// as we need to address some device memory up to 0x4000_2000 we have 2 entries here
	// spanning theoretically 2GB
	mov     x3, #1
	lsl     x3, x3, #63

	ldr     x1, =0x2000 // the base address of the next level
	orr     x2, x1, #0b11 // set the bits to mark this a table entry
	orr     x2, x2, x3    // set bit 63 (NSTable)
	str     x2, [x0], #8      // store this entry at 0x40000

	ldr     x1, =0x3000    // the base address of the next level
	orr     x2, x1, #0b11 // set the bits to mark this a table entry
	orr     x2, x2, x3    // set bit 63 (NSTable)
	str     x2, [x0], #8    // store this entry at 0x40008

	str     xzr, [x0], #8    // store invalid entry at 0x40010
	
	// set the level 1 entries.
	// each of those entries cover 2MB virtual address space for the 1GB block defined by it's
	// level 0 entry. This would lead to 512 entries on level 1 that for the time beeing define
	// the 1:1 memory mapping as block entries with their specific attributes
	ldr		x0, =0x2000
	mov     x1, #0x0 // the physical address to be stored in the mapping table bits for 1:1 mapping
	mov     x9, #504 // map this many first entries (0x0000_0000 - 0x3E00_0000)

.lvl2_loop1:
	orr     x2, x1, #0b01  // set the bits to mark this a block entry
	mov		x3, #0x710
	orr     x2, x2, x3 	   // set the memory block attributes AF=1, SH=inner shareable, normal Mem
	                       // AF= 1 << 10
						   // SH= 3 << 8
						   // memAttr= 4 << 2 (index to MAIR)					   
	str		x2, [x0], #8   // store this entry in the table and increase the pointer
	add     x1, x1, #0x200000 // increase physical address this block points to by 2MB
	sub     x9, x9, #1
	cbnz    x9, .lvl2_loop1

	// after the first 504 entries we start to map the device memory (0x3F00_0000-0x4000_0000)
	mov		x9, #8

.lvl2_loop2:
	orr     x2, x1, #0b01  // set the bits to mark this a block entry
	orr     x2, x2, #0x400 // set the memory block attributes AF=1, SH=0, device Mem
	                       // AF= 1 << 10
						   // SH= 0 << 8
						   // memAttr= 0 << 2 (index to MAIR)					   
	str		x2, [x0], #8   // store this entry in the table and increase the pointer
	add     x1, x1, #0x200000 // increase physical address this block points to by 2MB
	sub     x9, x9, #1
	cbnz    x9, .lvl2_loop2


	// after the first 512 level 1 entries we need another one at 0x42000
	// this one is for the core mailboxes and therefore specific device memory
	ldr		x0, =0x3000
	movz    x1, #0x4000, lsl 16

	// after the first 512 entries we start to map the memory from 0x4000_0000 - 0x4020_0000
	mov 	x9, #2	
.lvl2_loop3:
	orr     x2, x1, #0b01 // this is a block entry
	mov     x3, #0x400
	orr     x2, x2, x3  // set the memory block attributes AF=1, SH=0, device Memory
	                      // AF= 1 << 10
						  // SH= 0 << 8
						  // memAttr= 0 << 2 (index to MAIR)
	str		x2, [x0], #8  // store this entry in the table
	add     x1, x1, #0x200000 // increase physical address this block points to by 2MB
	sub     x9, x9, #1
	cbnz    x9, .lvl2_loop3

	//ldp		x0, x30, [sp], #16
	ret	

.balign 4
.ltorg


// define some MMU config values (the multiline trick only works with gcc pre-processing the assembly file using ".S" [capital S] extension)
.equ MAIR_EL2_VAL, ( (0x0LL << 0) |  /* Device NGNRNE */ \
                     (0x04LL << 8) | /* Device NGNRE */ \
					 (0x0CLL << 16) |/* Device GRE */ \
					 (0x44LL << 24) |/* Normal NC */ \
					 (0xFFLL << 32) ) /* Normal */

.equ TCR_EL2_VAL, ( (0b1LL   << 31) | 		/* RES1 */ \
					(0b1LL   << 23) |		/* RES1*/ \
					(0b1LL   << 20) |       /* TBI -> top byte ignored for translation */ \
					(0b000LL << 16) |		/* PS -> physical address size 000 = 32 Bits, 001 = 36 Bits, 010 = 40 Bits */ \
					(0b00LL  << 14) |		/* TG0 -> 00 = 4kB, 10 = 64kB */ \
					(0b11LL  << 12) |		/* SH0 -> 11 = inner shareable */ \
					(0b01LL  << 10) |		/* ORGN0 -> 01 = Normal Memory, Outer WriteBack, Write-Allocate, Cacheable */ \
					(0b01LL  << 8) |		/* IRGN0 -> 01 = Normal Memory, Inner WriteBack, Write-Allocate, Caheable */ \
					(25LL    << 0) )		/* T0SZ - 25 -> 512G, Regionsize 2^(64-T0SZ) */

.equ SCTRL_EL2_VAL, ( (1 << 12) |	/* I - instruction cache */ \
					  (1 << 3)  |	/* SA, stack alignment check */ \
					  (1 << 2)	|	/* C, data cache */ \
					  (1 << 1)	|	/* A, alignment check */ \
					  (1 << 0) )	/* M, MMU enable */

.global __setup_mmu
__setup_mmu:
/******************************************************
 * setup the MMU
 * input: w0  CPU-ID
 ******************************************************/
	stp		x0, x30, [sp, #-16]!

	mrs 	x0, mpidr_el1   // get CPI id
    and 	x0, x0, #3
	cbnz	x0, .ttlb_ready	// all cores other than 0 just do the MMU setup. translation tables are prepared only on core 0
	
	bl		__setup_ttlb
	dsb		ishst
	
	/*isb
	tlbi    alle2 // invalidate all stage 1 translations in EL2
	isb*/
	
.ttlb_ready:

	// configure MAIR_EL2
	ldr		x1, =MAIR_EL2_VAL
	msr		mair_el2, x1

	// store the translation table address in TTBR0 register
	ldr		x1, =0x1000
	msr     ttbr0_el2, x1
	isb

	// set the TCR_EL2
	ldr		x1, =TCR_EL2_VAL
	msr     tcr_el2, x1
	isb


	// set HCR_EL2 to disable stage 2 table walk in EL2
	// in EL2 stage 1 would return intermediate physicla address which is translated into a physical
	// address in stage 2. The stage 1 translation already should be treated as PA in this scenario
	mrs		x1, hcr_el2
	ldr     x2, =(1 << 12 | 1 << 0)
	bic     x1, x1, x2	// clear bit DC and VM to disable stage 2 walks
	msr     hcr_el2, x1

/*
	// enable SMPEN bit to ensure cache coherency between cores - seem to hang RPi
	mrs 	x0, s3_1_c15_c2_1
	orr 	x0, x0, #(0x1 << 6) // The SMPEn bit.
	msr 	s3_1_c15_c2_1, x0
*/	
	// finally set the system control register to activate the MMU
	mrs		x1, sctlr_el2
	ldr		x2, =SCTRL_EL2_VAL
	orr     x1, x1, x2
	msr     sctlr_el2, x1
	isb

	ldp		x0, x30, [sp], #16
	ret

.global __disable_mmu
__disable_mmu:
	// set the system control register to deactivate MMU
	mrs		x1, sctlr_el2
	ldr		x2, =SCTRL_EL2_VAL
	bic     x1, x2, x1
	msr     sctlr_el2, x1
	isb

	ret
.balign 4
.ltorg
