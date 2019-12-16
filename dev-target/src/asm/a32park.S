/****************************************************************************
 * aarch32 core park code that will be pre-compiled into binary code and than
 * put into the bootloader aarch64 code as hex constants
 ****************************************************************************/
__32:
    // get current CPUid to pass it to the entry function
	mrc		p15, 0, r0, c0, c0, 5		/* read MPIDR */
	and     r0, r0, #3

	lsl     r1, r0, #3
    mov     r4, #0
	mov     r5, #0
	mov     r3, #0xd8
    strd    r4, r5, [r3, r1]

    ldr     r1, =0x400000CC // core 0 mailbox 3 set

.park32:
    wfe
    ldr     r2, [r1, r0, lsl #4] // read core specific mailbox
    cmp     r2, #0
    beq     .park32
	str     r2, [r1, r0, lsl #4] // clear mailbox by writing to it
    bx      r2