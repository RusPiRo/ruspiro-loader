
target/aarch64-unknown-linux-gnu/release/kernel:     file format elf64-littleaarch64


Disassembly of section .text.boot:

0000000000080000 <__boot>:
   80000:	580002c0 	ldr	x0, 80058 <.bss_done+0x24>
   80004:	9100001f 	mov	sp, x0
   80008:	d53800a3 	mrs	x3, mpidr_el1
   8000c:	92400463 	and	x3, x3, #0x3
   80010:	b5000123 	cbnz	x3, 80034 <.bss_done>
   80014:	58000260 	ldr	x0, 80060 <.bss_done+0x2c>
   80018:	58000282 	ldr	x2, 80068 <.bss_done+0x34>
   8001c:	cb000042 	sub	x2, x2, x0
   80020:	d344fc42 	lsr	x2, x2, #4
   80024:	b4000082 	cbz	x2, 80034 <.bss_done>

0000000000080028 <.bss_zero_loop>:
   80028:	a8817c1f 	stp	xzr, xzr, [x0], #16
   8002c:	d1000442 	sub	x2, x2, #0x1
   80030:	b5ffffc2 	cbnz	x2, 80028 <.bss_zero_loop>

0000000000080034 <.bss_done>:
   80034:	1040be60 	adr	x0, 101800 <__ExceptionVectorTable>
   80038:	d51cc000 	msr	vbar_el2, x0
   8003c:	d53c1100 	mrs	x0, hcr_el2
   80040:	b27d0800 	orr	x0, x0, #0x38
   80044:	d51c1100 	msr	hcr_el2, x0
   80048:	d53800a0 	mrs	x0, mpidr_el1
   8004c:	92400400 	and	x0, x0, #0x3
   80050:	1402038a 	b	100e78 <__rust_entry>
   80054:	140203cc 	b	100f84 <__hang>
   80058:	00123140 	.word	0x00123140
   8005c:	00000000 	.word	0x00000000
   80060:	0011d000 	.word	0x0011d000
   80064:	00000000 	.word	0x00000000
   80068:	00121110 	.word	0x00121110
   8006c:	00000000 	.word	0x00000000

Disassembly of section .text:

0000000000100800 <_ZN6kernel6loader3run17h3f04d84ab75d9d32E>:
  100800:	a9be53f5 	stp	x21, x20, [sp, #-32]!
  100804:	b00000f4 	adrp	x20, 11d000 <_ZN6kernel6loader4UART17h8c554e49c44e8f76E.llvm.9953909209510477161>
  100808:	a9017bf3 	stp	x19, x30, [sp, #16]
  10080c:	91000294 	add	x20, x20, #0x0
  100810:	aa1403e0 	mov	x0, x20
  100814:	94000a81 	bl	103218 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E>
  100818:	91004293 	add	x19, x20, #0x10
  10081c:	52965001 	mov	w1, #0xb280                	// #45696
  100820:	52984002 	mov	w2, #0xc200                	// #49664
  100824:	72a1dcc1 	movk	w1, #0xee6, lsl #16
  100828:	72a00022 	movk	w2, #0x1, lsl #16
  10082c:	aa1303e0 	mov	x0, x19
  100830:	940005d8 	bl	101f90 <_ZN12ruspiro_uart5uart15Uart110initialize17hbe153646f8718a65E>
  100834:	90000021 	adrp	x1, 104000 <anon.7555cfe889f8a2a45f8cc89546acc814.0.llvm.9953909209510477161>
  100838:	528002a2 	mov	w2, #0x15                  	// #21
  10083c:	91044021 	add	x1, x1, #0x110
  100840:	aa1303e0 	mov	x0, x19
  100844:	94000611 	bl	102088 <_ZN12ruspiro_uart5uart15Uart111send_string17h9fa54bd75baa7ec7E>
  100848:	aa1303e0 	mov	x0, x19
  10084c:	2a1f03e1 	mov	w1, wzr
  100850:	940006a6 	bl	1022e8 <_ZN12ruspiro_uart5uart15Uart117enable_interrupts17h62cc85fc6133574dE>
  100854:	aa1403e0 	mov	x0, x20
  100858:	94000a7e 	bl	103250 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hcb55c707bd8b2049E>
  10085c:	900000f4 	adrp	x20, 11c000 <TestKernelAarch64+0xc000>
  100860:	f944ee94 	ldr	x20, [x20, #2520]
  100864:	aa1403e0 	mov	x0, x20
  100868:	94000a6c 	bl	103218 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E>
  10086c:	528003b5 	mov	w21, #0x1d                  	// #29
  100870:	91004280 	add	x0, x20, #0x10
  100874:	2a1503e1 	mov	w1, w21
  100878:	94000916 	bl	102cd0 <_ZN17ruspiro_interrupt16InterruptManager8activate17h9ee44817054f03e5E>
  10087c:	aa1403e0 	mov	x0, x20
  100880:	94000a74 	bl	103250 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hcb55c707bd8b2049E>
  100884:	94000a7f 	bl	103280 <_ZN22ruspiro_interrupt_core17enable_interrupts17h83bc49305ea1bfedE>
  100888:	90000021 	adrp	x1, 104000 <anon.7555cfe889f8a2a45f8cc89546acc814.0.llvm.9953909209510477161>
  10088c:	aa1303e0 	mov	x0, x19
  100890:	91049421 	add	x1, x1, #0x125
  100894:	aa1503e2 	mov	x2, x21
  100898:	940005fc 	bl	102088 <_ZN12ruspiro_uart5uart15Uart111send_string17h9fa54bd75baa7ec7E>
  10089c:	b00000e0 	adrp	x0, 11d000 <_ZN6kernel6loader4UART17h8c554e49c44e8f76E.llvm.9953909209510477161>
  1008a0:	d503205f 	wfe
  1008a4:	91008000 	add	x0, x0, #0x20
  1008a8:	940009dc 	bl	103018 <_ZN12ruspiro_lock9semaphore9Semaphore4down17h7dd706fc35386af7E>
  1008ac:	94000a7b 	bl	103298 <_ZN22ruspiro_interrupt_core18disable_interrupts17h4262f3ae0843d19fE>
  1008b0:	90000021 	adrp	x1, 104000 <anon.7555cfe889f8a2a45f8cc89546acc814.0.llvm.9953909209510477161>
  1008b4:	52800562 	mov	w2, #0x2b                  	// #43
  1008b8:	91050821 	add	x1, x1, #0x142
  1008bc:	aa1303e0 	mov	x0, x19
  1008c0:	940005f2 	bl	102088 <_ZN12ruspiro_uart5uart15Uart111send_string17h9fa54bd75baa7ec7E>
  1008c4:	b00000e8 	adrp	x8, 11d000 <_ZN6kernel6loader4UART17h8c554e49c44e8f76E.llvm.9953909209510477161>
  1008c8:	6f00e402 	movi	v2.2d, #0x0
  1008cc:	91010108 	add	x8, x8, #0x40
  1008d0:	ad400500 	ldp	q0, q1, [x8]
  1008d4:	f9401115 	ldr	x21, [x8, #32]
  1008d8:	ad000902 	stp	q2, q2, [x8]
  1008dc:	4e183c01 	mov	x1, v0.d[1]
  1008e0:	f900111f 	str	xzr, [x8, #32]
  1008e4:	b5000101 	cbnz	x1, 100904 <_ZN6kernel6loader3run17h3f04d84ab75d9d32E+0x104>
  1008e8:	90000020 	adrp	x0, 104000 <anon.7555cfe889f8a2a45f8cc89546acc814.0.llvm.9953909209510477161>
  1008ec:	900000e2 	adrp	x2, 11c000 <TestKernelAarch64+0xc000>
  1008f0:	91000000 	add	x0, x0, #0x0
  1008f4:	52800561 	mov	w1, #0x2b                  	// #43
  1008f8:	911e6042 	add	x2, x2, #0x798
  1008fc:	94000ca4 	bl	103b8c <_ZN4core9panicking5panic17hc6f3025301472b62E>
  100900:	d4200020 	brk	#0x1
  100904:	4e183c34 	mov	x20, v1.d[1]
  100908:	9e660013 	fmov	x19, d0
  10090c:	aa1403e2 	mov	x2, x20
  100910:	aa1303e0 	mov	x0, x19
  100914:	94000cc5 	bl	103c28 <memcpy>
  100918:	52800220 	mov	w0, #0x11                  	// #17
  10091c:	94000705 	bl	102530 <lit_debug_led>
  100920:	8b130281 	add	x1, x20, x19
  100924:	aa1303e0 	mov	x0, x19
  100928:	94000a84 	bl	103338 <_ZN13ruspiro_cache18flush_icache_range17h87fcd92ec21dca2aE>
  10092c:	94000a81 	bl	103330 <_ZN13ruspiro_cache15cleaninvalidate17h6a4fb3cd22e38882E>
  100930:	b00000e0 	adrp	x0, 11d000 <_ZN6kernel6loader4UART17h8c554e49c44e8f76E.llvm.9953909209510477161>
  100934:	90000021 	adrp	x1, 104000 <anon.7555cfe889f8a2a45f8cc89546acc814.0.llvm.9953909209510477161>
  100938:	91004000 	add	x0, x0, #0x10
  10093c:	52800322 	mov	w2, #0x19                  	// #25
  100940:	9105b421 	add	x1, x1, #0x16d
  100944:	940005d1 	bl	102088 <_ZN12ruspiro_uart5uart15Uart111send_string17h9fa54bd75baa7ec7E>
  100948:	52800240 	mov	w0, #0x12                  	// #18
  10094c:	940006f9 	bl	102530 <lit_debug_led>
  100950:	5284e200 	mov	w0, #0x2710                	// #10000
  100954:	940008ad 	bl	102c08 <_ZN13ruspiro_timer5sleep17h279cbcdbb8f764c0E>
  100958:	710082bf 	cmp	w21, #0x20
  10095c:	54000100 	b.eq	10097c <_ZN6kernel6loader3run17h3f04d84ab75d9d32E+0x17c>  // b.none
  100960:	710102bf 	cmp	w21, #0x40
  100964:	54000121 	b.ne	100988 <_ZN6kernel6loader3run17h3f04d84ab75d9d32E+0x188>  // b.any
  100968:	52800280 	mov	w0, #0x14                  	// #20
  10096c:	940006f1 	bl	102530 <lit_debug_led>
  100970:	aa1303e0 	mov	x0, x19
  100974:	9400016f 	bl	100f30 <__boot_64>
  100978:	d4200020 	brk	#0x1
  10097c:	aa1303e0 	mov	x0, x19
  100980:	94000178 	bl	100f60 <__boot_32>
  100984:	d4200020 	brk	#0x1
  100988:	90000020 	adrp	x0, 104000 <anon.7555cfe889f8a2a45f8cc89546acc814.0.llvm.9953909209510477161>
  10098c:	900000e2 	adrp	x2, 11c000 <TestKernelAarch64+0xc000>
  100990:	91026c00 	add	x0, x0, #0x9b
  100994:	52800261 	mov	w1, #0x13                  	// #19
  100998:	911ec042 	add	x2, x2, #0x7b0
  10099c:	94000c7c 	bl	103b8c <_ZN4core9panicking5panic17hc6f3025301472b62E>
  1009a0:	d4200020 	brk	#0x1
  1009a4:	00000000 	.inst	0x00000000 ; undefined

00000000001009a8 <__irq_handler__Aux_Uart1>:
  1009a8:	b00000e0 	adrp	x0, 11d000 <_ZN6kernel6loader4UART17h8c554e49c44e8f76E.llvm.9953909209510477161>
  1009ac:	91000000 	add	x0, x0, #0x0
  1009b0:	1400005e 	b	100b28 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h51fe4a1257ae1042E>
  1009b4:	00000000 	.inst	0x00000000 ; undefined

00000000001009b8 <_ZN6kernel3mmu14initialize_mmu17hf042fb7cdabab631E>:
  1009b8:	d100c3ff 	sub	sp, sp, #0x30
  1009bc:	f90013fe 	str	x30, [sp, #32]
  1009c0:	350005e0 	cbnz	w0, 100a7c <_ZN6kernel3mmu14initialize_mmu17hf042fb7cdabab631E+0xc4>
  1009c4:	d00000e8 	adrp	x8, 11e000 <_ZN6kernel3mmu7MMU_CFG17hd53bdf16880b5907E.llvm.2321029414710693881>
  1009c8:	5280e22b 	mov	w11, #0x711                 	// #1809
  1009cc:	91000108 	add	x8, x8, #0x0
  1009d0:	91400509 	add	x9, x8, #0x1, lsl #12
  1009d4:	9140090a 	add	x10, x8, #0x2, lsl #12
  1009d8:	b2410929 	orr	x9, x9, #0x8000000000000003
  1009dc:	b241094a 	orr	x10, x10, #0x8000000000000003
  1009e0:	4e080d60 	dup	v0.2d, x11
  1009e4:	5280008b 	mov	w11, #0x4                   	// #4
  1009e8:	9e670124 	fmov	d4, x9
  1009ec:	5280e229 	mov	w9, #0x711                 	// #1809
  1009f0:	72a00809 	movk	w9, #0x40, lsl #16
  1009f4:	4e080d62 	dup	v2.2d, x11
  1009f8:	4e080d21 	dup	v1.2d, x9
  1009fc:	90000029 	adrp	x9, 104000 <anon.7555cfe889f8a2a45f8cc89546acc814.0.llvm.9953909209510477161>
  100a00:	4e181d44 	mov	v4.d[1], x10
  100a04:	3dc03123 	ldr	q3, [x9, #192]
  100a08:	aa1f03e9 	mov	x9, xzr
  100a0c:	3d800104 	str	q4, [x8]
  100a10:	4f555464 	shl	v4.2d, v3.2d, #21
  100a14:	8b09010a 	add	x10, x8, x9
  100a18:	4ee28463 	add	v3.2d, v3.2d, v2.2d
  100a1c:	91008129 	add	x9, x9, #0x20
  100a20:	f13f013f 	cmp	x9, #0xfc0
  100a24:	4ea01c85 	orr	v5.16b, v4.16b, v0.16b
  100a28:	4ee18484 	add	v4.2d, v4.2d, v1.2d
  100a2c:	3d840145 	str	q5, [x10, #4096]
  100a30:	3d840544 	str	q4, [x10, #4112]
  100a34:	54fffee1 	b.ne	100a10 <_ZN6kernel3mmu14initialize_mmu17hf042fb7cdabab631E+0x58>  // b.any
  100a38:	90000028 	adrp	x8, 104000 <anon.7555cfe889f8a2a45f8cc89546acc814.0.llvm.9953909209510477161>
  100a3c:	90000029 	adrp	x9, 104000 <anon.7555cfe889f8a2a45f8cc89546acc814.0.llvm.9953909209510477161>
  100a40:	9000002a 	adrp	x10, 104000 <anon.7555cfe889f8a2a45f8cc89546acc814.0.llvm.9953909209510477161>
  100a44:	3dc03500 	ldr	q0, [x8, #208]
  100a48:	90000028 	adrp	x8, 104000 <anon.7555cfe889f8a2a45f8cc89546acc814.0.llvm.9953909209510477161>
  100a4c:	3dc03921 	ldr	q1, [x9, #224]
  100a50:	f00000e9 	adrp	x9, 11f000 <_ZN6kernel3mmu7MMU_CFG17hd53bdf16880b5907E.llvm.2321029414710693881+0x1000>
  100a54:	3dc03d42 	ldr	q2, [x10, #240]
  100a58:	913f0129 	add	x9, x9, #0xfc0
  100a5c:	3dc04103 	ldr	q3, [x8, #256]
  100a60:	52808028 	mov	w8, #0x401                 	// #1025
  100a64:	72a80008 	movk	w8, #0x4000, lsl #16
  100a68:	ad000520 	stp	q0, q1, [x9]
  100a6c:	ad010d22 	stp	q2, q3, [x9, #32]
  100a70:	f9002128 	str	x8, [x9, #64]
  100a74:	d5033a9f 	dsb	ishst
  100a78:	d50c831f 	tlbi	alle2is
  100a7c:	d2808008 	mov	x8, #0x400                 	// #1024
  100a80:	d53ca209 	mrs	x9, mair_el2
  100a84:	f2a88188 	movk	x8, #0x440c, lsl #16
  100a88:	d00000e0 	adrp	x0, 11e000 <_ZN6kernel3mmu7MMU_CFG17hd53bdf16880b5907E.llvm.2321029414710693881>
  100a8c:	f2c01fe8 	movk	x8, #0xff, lsl #32
  100a90:	91000000 	add	x0, x0, #0x0
  100a94:	b3409d09 	bfxil	x9, x8, #0, #40
  100a98:	910023e8 	add	x8, sp, #0x8
  100a9c:	d51ca209 	msr	mair_el2, x9
  100aa0:	94000942 	bl	102fa8 <_ZN16ruspiro_register6system7aarch649ttbr0_el25baddr10with_value17he00bdda0e676fbddE>
  100aa4:	f94007e8 	ldr	x8, [sp, #8]
  100aa8:	52800320 	mov	w0, #0x19                  	// #25
  100aac:	f9400fe9 	ldr	x9, [sp, #24]
  100ab0:	d53c200a 	mrs	x10, ttbr0_el2
  100ab4:	8a280148 	bic	x8, x10, x8
  100ab8:	aa090108 	orr	x8, x8, x9
  100abc:	d51c2008 	msr	ttbr0_el2, x8
  100ac0:	910023e8 	add	x8, sp, #0x8
  100ac4:	94000933 	bl	102f90 <_ZN16ruspiro_register6system7aarch647tcr_el24T0SZ10with_value17h877a925dccf94987E>
  100ac8:	b9400be8 	ldr	w8, [sp, #8]
  100acc:	b94013e9 	ldr	w9, [sp, #16]
  100ad0:	d53c204a 	mrs	x10, tcr_el2
  100ad4:	0a280148 	bic	w8, w10, w8
  100ad8:	5286a00a 	mov	w10, #0x3500                	// #13568
  100adc:	120d5508 	and	w8, w8, #0xfff801ff
  100ae0:	72a0020a 	movk	w10, #0x10, lsl #16
  100ae4:	2a080128 	orr	w8, w9, w8
  100ae8:	92820029 	mov	x9, #0xffffffffffffeffe    	// #-4098
  100aec:	2a0a0108 	orr	w8, w8, w10
  100af0:	d51c2048 	msr	tcr_el2, x8
  100af4:	d53c1108 	mrs	x8, hcr_el2
  100af8:	8a090108 	and	x8, x8, x9
  100afc:	d51c1108 	msr	hcr_el2, x8
  100b00:	d53c1008 	mrs	x8, sctlr_el2
  100b04:	528200a9 	mov	w9, #0x1005                	// #4101
  100b08:	927cf108 	and	x8, x8, #0xfffffffffffffff1
  100b0c:	aa090108 	orr	x8, x8, x9
  100b10:	d51c1008 	msr	sctlr_el2, x8
  100b14:	d503201f 	nop
  100b18:	d503201f 	nop
  100b1c:	f94013fe 	ldr	x30, [sp, #32]
  100b20:	9100c3ff 	add	sp, sp, #0x30
  100b24:	d65f03c0 	ret

0000000000100b28 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h51fe4a1257ae1042E>:
  100b28:	d10243ff 	sub	sp, sp, #0x90
  100b2c:	a9087bf3 	stp	x19, x30, [sp, #128]
  100b30:	91004013 	add	x19, x0, #0x10
  100b34:	910083e8 	add	x8, sp, #0x20
  100b38:	910063e1 	add	x1, sp, #0x18
  100b3c:	aa1303e0 	mov	x0, x19
  100b40:	52800102 	mov	w2, #0x8                   	// #8
  100b44:	a90753f5 	stp	x21, x20, [sp, #112]
  100b48:	f9000fff 	str	xzr, [sp, #24]
  100b4c:	94000573 	bl	102118 <_ZN12ruspiro_uart5uart15Uart116try_receive_data17hae1e14c8f50fd4a7E>
  100b50:	f94013e8 	ldr	x8, [sp, #32]
  100b54:	b40000a8 	cbz	x8, 100b68 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h51fe4a1257ae1042E+0x40>
  100b58:	a9487bf3 	ldp	x19, x30, [sp, #128]
  100b5c:	a94753f5 	ldp	x21, x20, [sp, #112]
  100b60:	910243ff 	add	sp, sp, #0x90
  100b64:	d65f03c0 	ret
  100b68:	f94017e8 	ldr	x8, [sp, #40]
  100b6c:	f100211f 	cmp	x8, #0x8
  100b70:	54ffff41 	b.ne	100b58 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h51fe4a1257ae1042E+0x30>  // b.any
  100b74:	f9400fe8 	ldr	x8, [sp, #24]
  100b78:	d288a889 	mov	x9, #0x4544                	// #17732
  100b7c:	f2a88829 	movk	x9, #0x4441, lsl #16
  100b80:	f2c8a849 	movk	x9, #0x4542, lsl #32
  100b84:	f2e8c8a9 	movk	x9, #0x4645, lsl #48
  100b88:	eb09011f 	cmp	x8, x9
  100b8c:	54fffe61 	b.ne	100b58 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h51fe4a1257ae1042E+0x30>  // b.any
  100b90:	90000021 	adrp	x1, 104000 <anon.7555cfe889f8a2a45f8cc89546acc814.0.llvm.9953909209510477161>
  100b94:	aa1303e0 	mov	x0, x19
  100b98:	91061821 	add	x1, x1, #0x186
  100b9c:	52800062 	mov	w2, #0x3                   	// #3
  100ba0:	9400053a 	bl	102088 <_ZN12ruspiro_uart5uart15Uart111send_string17h9fa54bd75baa7ec7E>
  100ba4:	528000a2 	mov	w2, #0x5                   	// #5
  100ba8:	910163e8 	add	x8, sp, #0x58
  100bac:	9100e3e1 	add	x1, sp, #0x38
  100bb0:	aa1303e0 	mov	x0, x19
  100bb4:	3900f3ff 	strb	wzr, [sp, #60]
  100bb8:	b9003bff 	str	wzr, [sp, #56]
  100bbc:	94000597 	bl	102218 <_ZN12ruspiro_uart5uart15Uart112receive_data17h8890cb7e53c5e603E>
  100bc0:	f9402fe8 	ldr	x8, [sp, #88]
  100bc4:	f100051f 	cmp	x8, #0x1
  100bc8:	54fffc80 	b.eq	100b58 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h51fe4a1257ae1042E+0x30>  // b.none
  100bcc:	3940e3f4 	ldrb	w20, [sp, #56]
  100bd0:	3940e7e8 	ldrb	w8, [sp, #57]
  100bd4:	3940ebe9 	ldrb	w9, [sp, #58]
  100bd8:	3940efea 	ldrb	w10, [sp, #59]
  100bdc:	3940f3f5 	ldrb	w21, [sp, #60]
  100be0:	b3781d14 	bfi	x20, x8, #8, #8
  100be4:	b3701d34 	bfi	x20, x9, #16, #8
  100be8:	b3681d54 	bfi	x20, x10, #24, #8
  100bec:	b4000134 	cbz	x20, 100c10 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h51fe4a1257ae1042E+0xe8>
  100bf0:	aa1403e0 	mov	x0, x20
  100bf4:	52800021 	mov	w1, #0x1                   	// #1
  100bf8:	940000c2 	bl	100f00 <__rust_alloc>
  100bfc:	b50000c0 	cbnz	x0, 100c14 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h51fe4a1257ae1042E+0xec>
  100c00:	aa1403e0 	mov	x0, x20
  100c04:	52800021 	mov	w1, #0x1                   	// #1
  100c08:	94000a4f 	bl	103544 <_ZN5alloc5alloc18handle_alloc_error17hae0fd03f65528f41E>
  100c0c:	d4200020 	brk	#0x1
  100c10:	52800020 	mov	w0, #0x1                   	// #1
  100c14:	a90453e0 	stp	x0, x20, [sp, #64]
  100c18:	910103e0 	add	x0, sp, #0x40
  100c1c:	aa1403e1 	mov	x1, x20
  100c20:	2a1f03e2 	mov	w2, wzr
  100c24:	f9002bff 	str	xzr, [sp, #80]
  100c28:	9400003e 	bl	100d20 <_ZN5alloc3vec12Vec$LT$T$GT$6resize17h71f74f1700370a71E>
  100c2c:	90000021 	adrp	x1, 104000 <anon.7555cfe889f8a2a45f8cc89546acc814.0.llvm.9953909209510477161>
  100c30:	aa1303e0 	mov	x0, x19
  100c34:	91061821 	add	x1, x1, #0x186
  100c38:	52800062 	mov	w2, #0x3                   	// #3
  100c3c:	94000513 	bl	102088 <_ZN12ruspiro_uart5uart15Uart111send_string17h9fa54bd75baa7ec7E>
  100c40:	f9402be2 	ldr	x2, [sp, #80]
  100c44:	910163e8 	add	x8, sp, #0x58
  100c48:	f94023e1 	ldr	x1, [sp, #64]
  100c4c:	aa1303e0 	mov	x0, x19
  100c50:	94000572 	bl	102218 <_ZN12ruspiro_uart5uart15Uart112receive_data17h8890cb7e53c5e603E>
  100c54:	f9402fe8 	ldr	x8, [sp, #88]
  100c58:	f100051f 	cmp	x8, #0x1
  100c5c:	54000141 	b.ne	100c84 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h51fe4a1257ae1042E+0x15c>  // b.any
  100c60:	f94027e1 	ldr	x1, [sp, #72]
  100c64:	b4fff7a1 	cbz	x1, 100b58 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h51fe4a1257ae1042E+0x30>
  100c68:	f94023e0 	ldr	x0, [sp, #64]
  100c6c:	52800022 	mov	w2, #0x1                   	// #1
  100c70:	940000a8 	bl	100f10 <__rust_dealloc>
  100c74:	a9487bf3 	ldp	x19, x30, [sp, #128]
  100c78:	a94753f5 	ldp	x21, x20, [sp, #112]
  100c7c:	910243ff 	add	sp, sp, #0x90
  100c80:	d65f03c0 	ret
  100c84:	90000021 	adrp	x1, 104000 <anon.7555cfe889f8a2a45f8cc89546acc814.0.llvm.9953909209510477161>
  100c88:	aa1303e0 	mov	x0, x19
  100c8c:	91061821 	add	x1, x1, #0x186
  100c90:	52800062 	mov	w2, #0x3                   	// #3
  100c94:	710102bf 	cmp	w21, #0x40
  100c98:	1a9f17f4 	cset	w20, eq  // eq = none
  100c9c:	940004fb 	bl	102088 <_ZN12ruspiro_uart5uart15Uart111send_string17h9fa54bd75baa7ec7E>
  100ca0:	f94023e8 	ldr	x8, [sp, #64]
  100ca4:	b00000ea 	adrp	x10, 11d000 <_ZN6kernel6loader4UART17h8c554e49c44e8f76E.llvm.9953909209510477161>
  100ca8:	fd402be2 	ldr	d2, [sp, #80]
  100cac:	9101014a 	add	x10, x10, #0x40
  100cb0:	710082bf 	cmp	w21, #0x20
  100cb4:	52900009 	mov	w9, #0x8000                	// #32768
  100cb8:	f90003e8 	str	x8, [sp]
  100cbc:	f94027e8 	ldr	x8, [sp, #72]
  100cc0:	f90007e8 	str	x8, [sp, #8]
  100cc4:	d36db288 	lsl	x8, x20, #19
  100cc8:	3dc003e0 	ldr	q0, [sp]
  100ccc:	9a880128 	csel	x8, x9, x8, eq  // eq = none
  100cd0:	f9001155 	str	x21, [x10, #32]
  100cd4:	4e080401 	dup	v1.2d, v0.d[0]
  100cd8:	6e024002 	ext	v2.16b, v0.16b, v2.16b, #8
  100cdc:	ad400143 	ldp	q3, q0, [x10]
  100ce0:	4e081d01 	mov	v1.d[0], x8
  100ce4:	4e183c60 	mov	x0, v3.d[1]
  100ce8:	ad000941 	stp	q1, q2, [x10]
  100cec:	b40000a0 	cbz	x0, 100d00 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h51fe4a1257ae1042E+0x1d8>
  100cf0:	9e660001 	fmov	x1, d0
  100cf4:	b4000061 	cbz	x1, 100d00 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h51fe4a1257ae1042E+0x1d8>
  100cf8:	52800022 	mov	w2, #0x1                   	// #1
  100cfc:	94000085 	bl	100f10 <__rust_dealloc>
  100d00:	b00000e0 	adrp	x0, 11d000 <_ZN6kernel6loader4UART17h8c554e49c44e8f76E.llvm.9953909209510477161>
  100d04:	91008000 	add	x0, x0, #0x20
  100d08:	940008b2 	bl	102fd0 <_ZN12ruspiro_lock9semaphore9Semaphore2up17h86ca159eb2867e89E>
  100d0c:	a9487bf3 	ldp	x19, x30, [sp, #128]
  100d10:	a94753f5 	ldp	x21, x20, [sp, #112]
  100d14:	910243ff 	add	sp, sp, #0x90
  100d18:	d65f03c0 	ret
  100d1c:	00000000 	.inst	0x00000000 ; undefined

0000000000100d20 <_ZN5alloc3vec12Vec$LT$T$GT$6resize17h71f74f1700370a71E>:
  100d20:	a9bc63f9 	stp	x25, x24, [sp, #-64]!
  100d24:	a9015bf7 	stp	x23, x22, [sp, #16]
  100d28:	a90253f5 	stp	x21, x20, [sp, #32]
  100d2c:	aa0103f5 	mov	x21, x1
  100d30:	a9037bf3 	stp	x19, x30, [sp, #48]
  100d34:	aa0003f3 	mov	x19, x0
  100d38:	f9400818 	ldr	x24, [x0, #16]
  100d3c:	eb01031f 	cmp	x24, x1
  100d40:	54000322 	b.cs	100da4 <_ZN5alloc3vec12Vec$LT$T$GT$6resize17h71f74f1700370a71E+0x84>  // b.hs, b.nlast
  100d44:	f9400661 	ldr	x1, [x19, #8]
  100d48:	2a0203f4 	mov	w20, w2
  100d4c:	cb1802b7 	sub	x23, x21, x24
  100d50:	cb180028 	sub	x8, x1, x24
  100d54:	eb17011f 	cmp	x8, x23
  100d58:	540002a2 	b.cs	100dac <_ZN5alloc3vec12Vec$LT$T$GT$6resize17h71f74f1700370a71E+0x8c>  // b.hs, b.nlast
  100d5c:	ab170308 	adds	x8, x24, x23
  100d60:	54000842 	b.cs	100e68 <_ZN5alloc3vec12Vec$LT$T$GT$6resize17h71f74f1700370a71E+0x148>  // b.hs, b.nlast
  100d64:	d37ff829 	lsl	x9, x1, #1
  100d68:	eb08013f 	cmp	x9, x8
  100d6c:	9a888136 	csel	x22, x9, x8, hi  // hi = pmore
  100d70:	b40006c1 	cbz	x1, 100e48 <_ZN5alloc3vec12Vec$LT$T$GT$6resize17h71f74f1700370a71E+0x128>
  100d74:	f9400260 	ldr	x0, [x19]
  100d78:	52800022 	mov	w2, #0x1                   	// #1
  100d7c:	aa1603e3 	mov	x3, x22
  100d80:	94000068 	bl	100f20 <__rust_realloc>
  100d84:	b40006a0 	cbz	x0, 100e58 <_ZN5alloc3vec12Vec$LT$T$GT$6resize17h71f74f1700370a71E+0x138>
  100d88:	f9400a68 	ldr	x8, [x19, #16]
  100d8c:	a9005a60 	stp	x0, x22, [x19]
  100d90:	8b080016 	add	x22, x0, x8
  100d94:	f1000aff 	cmp	x23, #0x2
  100d98:	54000142 	b.cs	100dc0 <_ZN5alloc3vec12Vec$LT$T$GT$6resize17h71f74f1700370a71E+0xa0>  // b.hs, b.nlast
  100d9c:	b5000477 	cbnz	x23, 100e28 <_ZN5alloc3vec12Vec$LT$T$GT$6resize17h71f74f1700370a71E+0x108>
  100da0:	14000024 	b	100e30 <_ZN5alloc3vec12Vec$LT$T$GT$6resize17h71f74f1700370a71E+0x110>
  100da4:	aa1503e8 	mov	x8, x21
  100da8:	14000022 	b	100e30 <_ZN5alloc3vec12Vec$LT$T$GT$6resize17h71f74f1700370a71E+0x110>
  100dac:	f9400260 	ldr	x0, [x19]
  100db0:	aa1803e8 	mov	x8, x24
  100db4:	8b080016 	add	x22, x0, x8
  100db8:	f1000aff 	cmp	x23, #0x2
  100dbc:	54ffff03 	b.cc	100d9c <_ZN5alloc3vec12Vec$LT$T$GT$6resize17h71f74f1700370a71E+0x7c>  // b.lo, b.ul, b.last
  100dc0:	aa3803e9 	mvn	x9, x24
  100dc4:	aa1603e0 	mov	x0, x22
  100dc8:	8b150137 	add	x23, x9, x21
  100dcc:	2a1403e1 	mov	w1, w20
  100dd0:	aa1703e2 	mov	x2, x23
  100dd4:	8b150119 	add	x25, x8, x21
  100dd8:	94000bb3 	bl	103ca4 <memset>
  100ddc:	f1000aff 	cmp	x23, #0x2
  100de0:	54000062 	b.cs	100dec <_ZN5alloc3vec12Vec$LT$T$GT$6resize17h71f74f1700370a71E+0xcc>  // b.hs, b.nlast
  100de4:	52800028 	mov	w8, #0x1                   	// #1
  100de8:	14000009 	b	100e0c <_ZN5alloc3vec12Vec$LT$T$GT$6resize17h71f74f1700370a71E+0xec>
  100dec:	927ffae9 	and	x9, x23, #0xfffffffffffffffe
  100df0:	b24002e8 	orr	x8, x23, #0x1
  100df4:	8b0902d6 	add	x22, x22, x9
  100df8:	aa0903ea 	mov	x10, x9
  100dfc:	f100094a 	subs	x10, x10, #0x2
  100e00:	54ffffe1 	b.ne	100dfc <_ZN5alloc3vec12Vec$LT$T$GT$6resize17h71f74f1700370a71E+0xdc>  // b.any
  100e04:	eb0902ff 	cmp	x23, x9
  100e08:	540000c0 	b.eq	100e20 <_ZN5alloc3vec12Vec$LT$T$GT$6resize17h71f74f1700370a71E+0x100>  // b.none
  100e0c:	8b180108 	add	x8, x8, x24
  100e10:	cb150108 	sub	x8, x8, x21
  100e14:	910006d6 	add	x22, x22, #0x1
  100e18:	b1000508 	adds	x8, x8, #0x1
  100e1c:	54ffffc3 	b.cc	100e14 <_ZN5alloc3vec12Vec$LT$T$GT$6resize17h71f74f1700370a71E+0xf4>  // b.lo, b.ul, b.last
  100e20:	aa3803e8 	mvn	x8, x24
  100e24:	8b080328 	add	x8, x25, x8
  100e28:	91000508 	add	x8, x8, #0x1
  100e2c:	390002d4 	strb	w20, [x22]
  100e30:	f9000a68 	str	x8, [x19, #16]
  100e34:	a9437bf3 	ldp	x19, x30, [sp, #48]
  100e38:	a94253f5 	ldp	x21, x20, [sp, #32]
  100e3c:	a9415bf7 	ldp	x23, x22, [sp, #16]
  100e40:	a8c463f9 	ldp	x25, x24, [sp], #64
  100e44:	d65f03c0 	ret
  100e48:	aa1603e0 	mov	x0, x22
  100e4c:	52800021 	mov	w1, #0x1                   	// #1
  100e50:	9400002c 	bl	100f00 <__rust_alloc>
  100e54:	b5fff9a0 	cbnz	x0, 100d88 <_ZN5alloc3vec12Vec$LT$T$GT$6resize17h71f74f1700370a71E+0x68>
  100e58:	aa1603e0 	mov	x0, x22
  100e5c:	52800021 	mov	w1, #0x1                   	// #1
  100e60:	940009b9 	bl	103544 <_ZN5alloc5alloc18handle_alloc_error17hae0fd03f65528f41E>
  100e64:	d4200020 	brk	#0x1
  100e68:	940009b0 	bl	103528 <_ZN5alloc7raw_vec17capacity_overflow17h9436d70fa899b450E>
  100e6c:	d4200020 	brk	#0x1

0000000000100e70 <rust_begin_unwind>:
  100e70:	14000000 	b	100e70 <rust_begin_unwind>
  100e74:	00000000 	.inst	0x00000000 ; undefined

0000000000100e78 <__rust_entry>:
  100e78:	d10083ff 	sub	sp, sp, #0x20
  100e7c:	a9017bf3 	stp	x19, x30, [sp, #16]
  100e80:	2a0003f3 	mov	w19, w0
  100e84:	97fffecd 	bl	1009b8 <_ZN6kernel3mmu14initialize_mmu17hf042fb7cdabab631E>
  100e88:	35000373 	cbnz	w19, 100ef4 <__rust_entry+0x7c>
  100e8c:	9400043f 	bl	101f88 <_ZN12ruspiro_uart5uart15Uart13new17h560b58a1875eb6cdE>
  100e90:	52965001 	mov	w1, #0xb280                	// #45696
  100e94:	52984002 	mov	w2, #0xc200                	// #49664
  100e98:	390033e0 	strb	w0, [sp, #12]
  100e9c:	72a1dcc1 	movk	w1, #0xee6, lsl #16
  100ea0:	72a00022 	movk	w2, #0x1, lsl #16
  100ea4:	910033e0 	add	x0, sp, #0xc
  100ea8:	9400043a 	bl	101f90 <_ZN12ruspiro_uart5uart15Uart110initialize17hbe153646f8718a65E>
  100eac:	90000021 	adrp	x1, 104000 <anon.7555cfe889f8a2a45f8cc89546acc814.0.llvm.9953909209510477161>
  100eb0:	528008a2 	mov	w2, #0x45                  	// #69
  100eb4:	91062421 	add	x1, x1, #0x189
  100eb8:	910033e0 	add	x0, sp, #0xc
  100ebc:	94000473 	bl	102088 <_ZN12ruspiro_uart5uart15Uart111send_string17h9fa54bd75baa7ec7E>
  100ec0:	5290d400 	mov	w0, #0x86a0                	// #34464
  100ec4:	72a00020 	movk	w0, #0x1, lsl #16
  100ec8:	94000750 	bl	102c08 <_ZN13ruspiro_timer5sleep17h279cbcdbb8f764c0E>
  100ecc:	900000f3 	adrp	x19, 11c000 <TestKernelAarch64+0xc000>
  100ed0:	f944ee73 	ldr	x19, [x19, #2520]
  100ed4:	aa1303e0 	mov	x0, x19
  100ed8:	940008d0 	bl	103218 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E>
  100edc:	91004260 	add	x0, x19, #0x10
  100ee0:	94000760 	bl	102c60 <_ZN17ruspiro_interrupt16InterruptManager10initialize17hd6db96f165282328E>
  100ee4:	aa1303e0 	mov	x0, x19
  100ee8:	940008da 	bl	103250 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hcb55c707bd8b2049E>
  100eec:	910033e0 	add	x0, sp, #0xc
  100ef0:	94000506 	bl	102308 <_ZN68_$LT$ruspiro_uart..uart1..Uart1$u20$as$u20$core..ops..drop..Drop$GT$4drop17h8c59e9373ebb853bE>
  100ef4:	97fffe43 	bl	100800 <_ZN6kernel6loader3run17h3f04d84ab75d9d32E>
  100ef8:	d4200020 	brk	#0x1
  100efc:	00000000 	.inst	0x00000000 ; undefined

0000000000100f00 <__rust_alloc>:
  100f00:	f81f0ffe 	str	x30, [sp, #-16]!
  100f04:	9400060f 	bl	102740 <__rg_alloc>
  100f08:	f84107fe 	ldr	x30, [sp], #16
  100f0c:	d65f03c0 	ret

0000000000100f10 <__rust_dealloc>:
  100f10:	f81f0ffe 	str	x30, [sp, #-16]!
  100f14:	9400061d 	bl	102788 <__rg_dealloc>
  100f18:	f84107fe 	ldr	x30, [sp], #16
  100f1c:	d65f03c0 	ret

0000000000100f20 <__rust_realloc>:
  100f20:	f81f0ffe 	str	x30, [sp, #-16]!
  100f24:	94000627 	bl	1027c0 <__rg_realloc>
  100f28:	f84107fe 	ldr	x30, [sp], #16
  100f2c:	d65f03c0 	ret

0000000000100f30 <__boot_64>:
  100f30:	d2800280 	mov	x0, #0x14                  	// #20
  100f34:	9400057f 	bl	102530 <lit_debug_led>
  100f38:	58400000 	ldr	x0, 180f38 <__heap_start+0x5af38>
  100f3c:	10078621 	adr	x1, 110000 <TestKernelAarch64>
  100f40:	100d8a02 	adr	x2, 11c080 <TestKernelAarch64_end>
  100f44:	cb010042 	sub	x2, x2, x1
  100f48:	94000b38 	bl	103c28 <memcpy>
  100f4c:	9400092e 	bl	103404 <__cleaninvalidate_dcache>
  100f50:	d2800280 	mov	x0, #0x14                  	// #20
  100f54:	94000577 	bl	102530 <lit_debug_led>
  100f58:	58400000 	ldr	x0, 180f58 <__heap_start+0x5af58>
  100f5c:	d61f0000 	br	x0

0000000000100f60 <__boot_32>:
  100f60:	d51c4020 	msr	elr_el2, x0
  100f64:	d53c110a 	mrs	x10, hcr_el2
  100f68:	9260f94a 	and	x10, x10, #0xffffffff7fffffff
  100f6c:	d51c110a 	msr	hcr_el2, x10
  100f70:	d2800201 	mov	x1, #0x10                  	// #16
  100f74:	d2800062 	mov	x2, #0x3                   	// #3
  100f78:	aa020021 	orr	x1, x1, x2
  100f7c:	d51c4001 	msr	spsr_el2, x1
  100f80:	d69f03e0 	eret

0000000000100f84 <__hang>:
  100f84:	d503205f 	wfe
  100f88:	17ffffff 	b	100f84 <__hang>
	...
  101000:	d503201f 	nop
  101004:	d65f03c0 	ret

0000000000101008 <__exception_trampoline>:
  101008:	d10403ff 	sub	sp, sp, #0x100
  10100c:	a90007e0 	stp	x0, x1, [sp]
  101010:	a9010fe2 	stp	x2, x3, [sp, #16]
  101014:	a90217e4 	stp	x4, x5, [sp, #32]
  101018:	a9031fe6 	stp	x6, x7, [sp, #48]
  10101c:	a90427e8 	stp	x8, x9, [sp, #64]
  101020:	a9052fea 	stp	x10, x11, [sp, #80]
  101024:	a90637ec 	stp	x12, x13, [sp, #96]
  101028:	a9073fee 	stp	x14, x15, [sp, #112]
  10102c:	a90847f0 	stp	x16, x17, [sp, #128]
  101030:	a9094ff2 	stp	x18, x19, [sp, #144]
  101034:	a90a57f4 	stp	x20, x21, [sp, #160]
  101038:	a90b5ff6 	stp	x22, x23, [sp, #176]
  10103c:	a90c67f8 	stp	x24, x25, [sp, #192]
  101040:	a90d6ffa 	stp	x26, x27, [sp, #208]
  101044:	a90e77fc 	stp	x28, x29, [sp, #224]
  101048:	f9007bfe 	str	x30, [sp, #240]
  10104c:	d53c400a 	mrs	x10, spsr_el2
  101050:	d53c402b 	mrs	x11, elr_el2
  101054:	a9102fea 	stp	x10, x11, [sp, #256]
  101058:	d53c5201 	mrs	x1, esr_el2
  10105c:	d53c4002 	mrs	x2, spsr_el2
  101060:	d53c6003 	mrs	x3, far_el2
  101064:	d53c4024 	mrs	x4, elr_el2
  101068:	9400073c 	bl	102d58 <__exception_handler_default>
  10106c:	a94007e0 	ldp	x0, x1, [sp]
  101070:	a9410fe2 	ldp	x2, x3, [sp, #16]
  101074:	a94217e4 	ldp	x4, x5, [sp, #32]
  101078:	a9431fe6 	ldp	x6, x7, [sp, #48]
  10107c:	a94427e8 	ldp	x8, x9, [sp, #64]
  101080:	a9452fea 	ldp	x10, x11, [sp, #80]
  101084:	a94637ec 	ldp	x12, x13, [sp, #96]
  101088:	a9473fee 	ldp	x14, x15, [sp, #112]
  10108c:	a94847f0 	ldp	x16, x17, [sp, #128]
  101090:	a9494ff2 	ldp	x18, x19, [sp, #144]
  101094:	a94a57f4 	ldp	x20, x21, [sp, #160]
  101098:	a94b5ff6 	ldp	x22, x23, [sp, #176]
  10109c:	a94c67f8 	ldp	x24, x25, [sp, #192]
  1010a0:	a94d6ffa 	ldp	x26, x27, [sp, #208]
  1010a4:	a94e77fc 	ldp	x28, x29, [sp, #224]
  1010a8:	f9407bfe 	ldr	x30, [sp, #240]
  1010ac:	a9502fea 	ldp	x10, x11, [sp, #256]
  1010b0:	d51c402b 	msr	elr_el2, x11
  1010b4:	d51c400a 	msr	spsr_el2, x10
  1010b8:	910403ff 	add	sp, sp, #0x100
  1010bc:	d69f03e0 	eret
  1010c0:	d503201f 	nop
  1010c4:	d503201f 	nop
  1010c8:	d503201f 	nop
  1010cc:	d503201f 	nop
  1010d0:	d503201f 	nop
  1010d4:	d503201f 	nop
  1010d8:	d503201f 	nop
  1010dc:	d503201f 	nop
  1010e0:	d503201f 	nop
  1010e4:	d503201f 	nop
  1010e8:	d503201f 	nop
  1010ec:	d503201f 	nop
  1010f0:	d503201f 	nop
  1010f4:	d503201f 	nop
  1010f8:	d503201f 	nop
  1010fc:	d503201f 	nop
  101100:	d503201f 	nop
  101104:	d503201f 	nop
  101108:	d503201f 	nop
  10110c:	d503201f 	nop
  101110:	d503201f 	nop
  101114:	d503201f 	nop
  101118:	d503201f 	nop
  10111c:	d503201f 	nop
  101120:	d503201f 	nop
  101124:	d503201f 	nop
  101128:	d503201f 	nop
  10112c:	d503201f 	nop
  101130:	d503201f 	nop
  101134:	d503201f 	nop
  101138:	d503201f 	nop
  10113c:	d503201f 	nop
  101140:	d503201f 	nop
  101144:	d503201f 	nop
  101148:	d503201f 	nop
  10114c:	d503201f 	nop
  101150:	d503201f 	nop
  101154:	d503201f 	nop
  101158:	d503201f 	nop
  10115c:	d503201f 	nop
  101160:	d503201f 	nop
  101164:	d503201f 	nop
  101168:	d503201f 	nop
  10116c:	d503201f 	nop
  101170:	d503201f 	nop
  101174:	d503201f 	nop
  101178:	d503201f 	nop
  10117c:	d503201f 	nop
  101180:	d503201f 	nop
  101184:	d503201f 	nop
  101188:	d503201f 	nop
  10118c:	d503201f 	nop
  101190:	d503201f 	nop
  101194:	d503201f 	nop
  101198:	d503201f 	nop
  10119c:	d503201f 	nop
  1011a0:	d503201f 	nop
  1011a4:	d503201f 	nop
  1011a8:	d503201f 	nop
  1011ac:	d503201f 	nop
  1011b0:	d503201f 	nop
  1011b4:	d503201f 	nop
  1011b8:	d503201f 	nop
  1011bc:	d503201f 	nop
  1011c0:	d503201f 	nop
  1011c4:	d503201f 	nop
  1011c8:	d503201f 	nop
  1011cc:	d503201f 	nop
  1011d0:	d503201f 	nop
  1011d4:	d503201f 	nop
  1011d8:	d503201f 	nop
  1011dc:	d503201f 	nop
  1011e0:	d503201f 	nop
  1011e4:	d503201f 	nop
  1011e8:	d503201f 	nop
  1011ec:	d503201f 	nop
  1011f0:	d503201f 	nop
  1011f4:	d503201f 	nop
  1011f8:	d503201f 	nop
  1011fc:	d503201f 	nop
  101200:	d503201f 	nop
  101204:	d503201f 	nop
  101208:	d503201f 	nop
  10120c:	d503201f 	nop
  101210:	d503201f 	nop
  101214:	d503201f 	nop
  101218:	d503201f 	nop
  10121c:	d503201f 	nop
  101220:	d503201f 	nop
  101224:	d503201f 	nop
  101228:	d503201f 	nop
  10122c:	d503201f 	nop
  101230:	d503201f 	nop
  101234:	d503201f 	nop
  101238:	d503201f 	nop
  10123c:	d503201f 	nop
  101240:	d503201f 	nop
  101244:	d503201f 	nop
  101248:	d503201f 	nop
  10124c:	d503201f 	nop
  101250:	d503201f 	nop
  101254:	d503201f 	nop
  101258:	d503201f 	nop
  10125c:	d503201f 	nop
  101260:	d503201f 	nop
  101264:	d503201f 	nop
  101268:	d503201f 	nop
  10126c:	d503201f 	nop
  101270:	d503201f 	nop
  101274:	d503201f 	nop
  101278:	d503201f 	nop
  10127c:	d503201f 	nop
  101280:	d503201f 	nop
  101284:	d503201f 	nop
  101288:	d503201f 	nop
  10128c:	d503201f 	nop
  101290:	d503201f 	nop
  101294:	d503201f 	nop
  101298:	d503201f 	nop
  10129c:	d503201f 	nop
  1012a0:	d503201f 	nop
  1012a4:	d503201f 	nop
  1012a8:	d503201f 	nop
  1012ac:	d503201f 	nop
  1012b0:	d503201f 	nop
  1012b4:	d503201f 	nop
  1012b8:	d503201f 	nop
  1012bc:	d503201f 	nop
  1012c0:	d503201f 	nop
  1012c4:	d503201f 	nop
  1012c8:	d503201f 	nop
  1012cc:	d503201f 	nop
  1012d0:	d503201f 	nop
  1012d4:	d503201f 	nop
  1012d8:	d503201f 	nop
  1012dc:	d503201f 	nop
  1012e0:	d503201f 	nop
  1012e4:	d503201f 	nop
  1012e8:	d503201f 	nop
  1012ec:	d503201f 	nop
  1012f0:	d503201f 	nop
  1012f4:	d503201f 	nop
  1012f8:	d503201f 	nop
  1012fc:	d503201f 	nop
  101300:	d503201f 	nop
  101304:	d503201f 	nop
  101308:	d503201f 	nop
  10130c:	d503201f 	nop
  101310:	d503201f 	nop
  101314:	d503201f 	nop
  101318:	d503201f 	nop
  10131c:	d503201f 	nop
  101320:	d503201f 	nop
  101324:	d503201f 	nop
  101328:	d503201f 	nop
  10132c:	d503201f 	nop
  101330:	d503201f 	nop
  101334:	d503201f 	nop
  101338:	d503201f 	nop
  10133c:	d503201f 	nop
  101340:	d503201f 	nop
  101344:	d503201f 	nop
  101348:	d503201f 	nop
  10134c:	d503201f 	nop
  101350:	d503201f 	nop
  101354:	d503201f 	nop
  101358:	d503201f 	nop
  10135c:	d503201f 	nop
  101360:	d503201f 	nop
  101364:	d503201f 	nop
  101368:	d503201f 	nop
  10136c:	d503201f 	nop
  101370:	d503201f 	nop
  101374:	d503201f 	nop
  101378:	d503201f 	nop
  10137c:	d503201f 	nop
  101380:	d503201f 	nop
  101384:	d503201f 	nop
  101388:	d503201f 	nop
  10138c:	d503201f 	nop
  101390:	d503201f 	nop
  101394:	d503201f 	nop
  101398:	d503201f 	nop
  10139c:	d503201f 	nop
  1013a0:	d503201f 	nop
  1013a4:	d503201f 	nop
  1013a8:	d503201f 	nop
  1013ac:	d503201f 	nop
  1013b0:	d503201f 	nop
  1013b4:	d503201f 	nop
  1013b8:	d503201f 	nop
  1013bc:	d503201f 	nop
  1013c0:	d503201f 	nop
  1013c4:	d503201f 	nop
  1013c8:	d503201f 	nop
  1013cc:	d503201f 	nop
  1013d0:	d503201f 	nop
  1013d4:	d503201f 	nop
  1013d8:	d503201f 	nop
  1013dc:	d503201f 	nop
  1013e0:	d503201f 	nop
  1013e4:	d503201f 	nop
  1013e8:	d503201f 	nop
  1013ec:	d503201f 	nop
  1013f0:	d503201f 	nop
  1013f4:	d503201f 	nop
  1013f8:	d503201f 	nop
  1013fc:	d503201f 	nop
  101400:	d503201f 	nop
  101404:	d503201f 	nop
  101408:	d503201f 	nop
  10140c:	d503201f 	nop
  101410:	d503201f 	nop
  101414:	d503201f 	nop
  101418:	d503201f 	nop
  10141c:	d503201f 	nop
  101420:	d503201f 	nop
  101424:	d503201f 	nop
  101428:	d503201f 	nop
  10142c:	d503201f 	nop
  101430:	d503201f 	nop
  101434:	d503201f 	nop
  101438:	d503201f 	nop
  10143c:	d503201f 	nop
  101440:	d503201f 	nop
  101444:	d503201f 	nop
  101448:	d503201f 	nop
  10144c:	d503201f 	nop
  101450:	d503201f 	nop
  101454:	d503201f 	nop
  101458:	d503201f 	nop
  10145c:	d503201f 	nop
  101460:	d503201f 	nop
  101464:	d503201f 	nop
  101468:	d503201f 	nop
  10146c:	d503201f 	nop
  101470:	d503201f 	nop
  101474:	d503201f 	nop
  101478:	d503201f 	nop
  10147c:	d503201f 	nop
  101480:	d503201f 	nop
  101484:	d503201f 	nop
  101488:	d503201f 	nop
  10148c:	d503201f 	nop
  101490:	d503201f 	nop
  101494:	d503201f 	nop
  101498:	d503201f 	nop
  10149c:	d503201f 	nop
  1014a0:	d503201f 	nop
  1014a4:	d503201f 	nop
  1014a8:	d503201f 	nop
  1014ac:	d503201f 	nop
  1014b0:	d503201f 	nop
  1014b4:	d503201f 	nop
  1014b8:	d503201f 	nop
  1014bc:	d503201f 	nop
  1014c0:	d503201f 	nop
  1014c4:	d503201f 	nop
  1014c8:	d503201f 	nop
  1014cc:	d503201f 	nop
  1014d0:	d503201f 	nop
  1014d4:	d503201f 	nop
  1014d8:	d503201f 	nop
  1014dc:	d503201f 	nop
  1014e0:	d503201f 	nop
  1014e4:	d503201f 	nop
  1014e8:	d503201f 	nop
  1014ec:	d503201f 	nop
  1014f0:	d503201f 	nop
  1014f4:	d503201f 	nop
  1014f8:	d503201f 	nop
  1014fc:	d503201f 	nop
  101500:	d503201f 	nop
  101504:	d503201f 	nop
  101508:	d503201f 	nop
  10150c:	d503201f 	nop
  101510:	d503201f 	nop
  101514:	d503201f 	nop
  101518:	d503201f 	nop
  10151c:	d503201f 	nop
  101520:	d503201f 	nop
  101524:	d503201f 	nop
  101528:	d503201f 	nop
  10152c:	d503201f 	nop
  101530:	d503201f 	nop
  101534:	d503201f 	nop
  101538:	d503201f 	nop
  10153c:	d503201f 	nop
  101540:	d503201f 	nop
  101544:	d503201f 	nop
  101548:	d503201f 	nop
  10154c:	d503201f 	nop
  101550:	d503201f 	nop
  101554:	d503201f 	nop
  101558:	d503201f 	nop
  10155c:	d503201f 	nop
  101560:	d503201f 	nop
  101564:	d503201f 	nop
  101568:	d503201f 	nop
  10156c:	d503201f 	nop
  101570:	d503201f 	nop
  101574:	d503201f 	nop
  101578:	d503201f 	nop
  10157c:	d503201f 	nop
  101580:	d503201f 	nop
  101584:	d503201f 	nop
  101588:	d503201f 	nop
  10158c:	d503201f 	nop
  101590:	d503201f 	nop
  101594:	d503201f 	nop
  101598:	d503201f 	nop
  10159c:	d503201f 	nop
  1015a0:	d503201f 	nop
  1015a4:	d503201f 	nop
  1015a8:	d503201f 	nop
  1015ac:	d503201f 	nop
  1015b0:	d503201f 	nop
  1015b4:	d503201f 	nop
  1015b8:	d503201f 	nop
  1015bc:	d503201f 	nop
  1015c0:	d503201f 	nop
  1015c4:	d503201f 	nop
  1015c8:	d503201f 	nop
  1015cc:	d503201f 	nop
  1015d0:	d503201f 	nop
  1015d4:	d503201f 	nop
  1015d8:	d503201f 	nop
  1015dc:	d503201f 	nop
  1015e0:	d503201f 	nop
  1015e4:	d503201f 	nop
  1015e8:	d503201f 	nop
  1015ec:	d503201f 	nop
  1015f0:	d503201f 	nop
  1015f4:	d503201f 	nop
  1015f8:	d503201f 	nop
  1015fc:	d503201f 	nop
  101600:	d503201f 	nop
  101604:	d503201f 	nop
  101608:	d503201f 	nop
  10160c:	d503201f 	nop
  101610:	d503201f 	nop
  101614:	d503201f 	nop
  101618:	d503201f 	nop
  10161c:	d503201f 	nop
  101620:	d503201f 	nop
  101624:	d503201f 	nop
  101628:	d503201f 	nop
  10162c:	d503201f 	nop
  101630:	d503201f 	nop
  101634:	d503201f 	nop
  101638:	d503201f 	nop
  10163c:	d503201f 	nop
  101640:	d503201f 	nop
  101644:	d503201f 	nop
  101648:	d503201f 	nop
  10164c:	d503201f 	nop
  101650:	d503201f 	nop
  101654:	d503201f 	nop
  101658:	d503201f 	nop
  10165c:	d503201f 	nop
  101660:	d503201f 	nop
  101664:	d503201f 	nop
  101668:	d503201f 	nop
  10166c:	d503201f 	nop
  101670:	d503201f 	nop
  101674:	d503201f 	nop
  101678:	d503201f 	nop
  10167c:	d503201f 	nop
  101680:	d503201f 	nop
  101684:	d503201f 	nop
  101688:	d503201f 	nop
  10168c:	d503201f 	nop
  101690:	d503201f 	nop
  101694:	d503201f 	nop
  101698:	d503201f 	nop
  10169c:	d503201f 	nop
  1016a0:	d503201f 	nop
  1016a4:	d503201f 	nop
  1016a8:	d503201f 	nop
  1016ac:	d503201f 	nop
  1016b0:	d503201f 	nop
  1016b4:	d503201f 	nop
  1016b8:	d503201f 	nop
  1016bc:	d503201f 	nop
  1016c0:	d503201f 	nop
  1016c4:	d503201f 	nop
  1016c8:	d503201f 	nop
  1016cc:	d503201f 	nop
  1016d0:	d503201f 	nop
  1016d4:	d503201f 	nop
  1016d8:	d503201f 	nop
  1016dc:	d503201f 	nop
  1016e0:	d503201f 	nop
  1016e4:	d503201f 	nop
  1016e8:	d503201f 	nop
  1016ec:	d503201f 	nop
  1016f0:	d503201f 	nop
  1016f4:	d503201f 	nop
  1016f8:	d503201f 	nop
  1016fc:	d503201f 	nop
  101700:	d503201f 	nop
  101704:	d503201f 	nop
  101708:	d503201f 	nop
  10170c:	d503201f 	nop
  101710:	d503201f 	nop
  101714:	d503201f 	nop
  101718:	d503201f 	nop
  10171c:	d503201f 	nop
  101720:	d503201f 	nop
  101724:	d503201f 	nop
  101728:	d503201f 	nop
  10172c:	d503201f 	nop
  101730:	d503201f 	nop
  101734:	d503201f 	nop
  101738:	d503201f 	nop
  10173c:	d503201f 	nop
  101740:	d503201f 	nop
  101744:	d503201f 	nop
  101748:	d503201f 	nop
  10174c:	d503201f 	nop
  101750:	d503201f 	nop
  101754:	d503201f 	nop
  101758:	d503201f 	nop
  10175c:	d503201f 	nop
  101760:	d503201f 	nop
  101764:	d503201f 	nop
  101768:	d503201f 	nop
  10176c:	d503201f 	nop
  101770:	d503201f 	nop
  101774:	d503201f 	nop
  101778:	d503201f 	nop
  10177c:	d503201f 	nop
  101780:	d503201f 	nop
  101784:	d503201f 	nop
  101788:	d503201f 	nop
  10178c:	d503201f 	nop
  101790:	d503201f 	nop
  101794:	d503201f 	nop
  101798:	d503201f 	nop
  10179c:	d503201f 	nop
  1017a0:	d503201f 	nop
  1017a4:	d503201f 	nop
  1017a8:	d503201f 	nop
  1017ac:	d503201f 	nop
  1017b0:	d503201f 	nop
  1017b4:	d503201f 	nop
  1017b8:	d503201f 	nop
  1017bc:	d503201f 	nop
  1017c0:	d503201f 	nop
  1017c4:	d503201f 	nop
  1017c8:	d503201f 	nop
  1017cc:	d503201f 	nop
  1017d0:	d503201f 	nop
  1017d4:	d503201f 	nop
  1017d8:	d503201f 	nop
  1017dc:	d503201f 	nop
  1017e0:	d503201f 	nop
  1017e4:	d503201f 	nop
  1017e8:	d503201f 	nop
  1017ec:	d503201f 	nop
  1017f0:	d503201f 	nop
  1017f4:	d503201f 	nop
  1017f8:	d503201f 	nop
  1017fc:	d503201f 	nop

0000000000101800 <__ExceptionVectorTable>:
  101800:	d2800020 	mov	x0, #0x1                   	// #1
  101804:	17fffe01 	b	101008 <__exception_trampoline>
  101808:	d503201f 	nop
  10180c:	d503201f 	nop
  101810:	d503201f 	nop
  101814:	d503201f 	nop
  101818:	d503201f 	nop
  10181c:	d503201f 	nop
  101820:	d503201f 	nop
  101824:	d503201f 	nop
  101828:	d503201f 	nop
  10182c:	d503201f 	nop
  101830:	d503201f 	nop
  101834:	d503201f 	nop
  101838:	d503201f 	nop
  10183c:	d503201f 	nop
  101840:	d503201f 	nop
  101844:	d503201f 	nop
  101848:	d503201f 	nop
  10184c:	d503201f 	nop
  101850:	d503201f 	nop
  101854:	d503201f 	nop
  101858:	d503201f 	nop
  10185c:	d503201f 	nop
  101860:	d503201f 	nop
  101864:	d503201f 	nop
  101868:	d503201f 	nop
  10186c:	d503201f 	nop
  101870:	d503201f 	nop
  101874:	d503201f 	nop
  101878:	d503201f 	nop
  10187c:	d503201f 	nop

0000000000101880 <.EXC_CURREL_SP0_Irq>:
  101880:	d2800040 	mov	x0, #0x2                   	// #2
  101884:	17fffde1 	b	101008 <__exception_trampoline>
  101888:	d503201f 	nop
  10188c:	d503201f 	nop
  101890:	d503201f 	nop
  101894:	d503201f 	nop
  101898:	d503201f 	nop
  10189c:	d503201f 	nop
  1018a0:	d503201f 	nop
  1018a4:	d503201f 	nop
  1018a8:	d503201f 	nop
  1018ac:	d503201f 	nop
  1018b0:	d503201f 	nop
  1018b4:	d503201f 	nop
  1018b8:	d503201f 	nop
  1018bc:	d503201f 	nop
  1018c0:	d503201f 	nop
  1018c4:	d503201f 	nop
  1018c8:	d503201f 	nop
  1018cc:	d503201f 	nop
  1018d0:	d503201f 	nop
  1018d4:	d503201f 	nop
  1018d8:	d503201f 	nop
  1018dc:	d503201f 	nop
  1018e0:	d503201f 	nop
  1018e4:	d503201f 	nop
  1018e8:	d503201f 	nop
  1018ec:	d503201f 	nop
  1018f0:	d503201f 	nop
  1018f4:	d503201f 	nop
  1018f8:	d503201f 	nop
  1018fc:	d503201f 	nop

0000000000101900 <.EXC_CURREL_SP0_Fiq>:
  101900:	d2800060 	mov	x0, #0x3                   	// #3
  101904:	17fffdc1 	b	101008 <__exception_trampoline>
  101908:	d503201f 	nop
  10190c:	d503201f 	nop
  101910:	d503201f 	nop
  101914:	d503201f 	nop
  101918:	d503201f 	nop
  10191c:	d503201f 	nop
  101920:	d503201f 	nop
  101924:	d503201f 	nop
  101928:	d503201f 	nop
  10192c:	d503201f 	nop
  101930:	d503201f 	nop
  101934:	d503201f 	nop
  101938:	d503201f 	nop
  10193c:	d503201f 	nop
  101940:	d503201f 	nop
  101944:	d503201f 	nop
  101948:	d503201f 	nop
  10194c:	d503201f 	nop
  101950:	d503201f 	nop
  101954:	d503201f 	nop
  101958:	d503201f 	nop
  10195c:	d503201f 	nop
  101960:	d503201f 	nop
  101964:	d503201f 	nop
  101968:	d503201f 	nop
  10196c:	d503201f 	nop
  101970:	d503201f 	nop
  101974:	d503201f 	nop
  101978:	d503201f 	nop
  10197c:	d503201f 	nop

0000000000101980 <.EXC_CURREL_SP0_SErr>:
  101980:	d2800080 	mov	x0, #0x4                   	// #4
  101984:	17fffda1 	b	101008 <__exception_trampoline>
  101988:	d503201f 	nop
  10198c:	d503201f 	nop
  101990:	d503201f 	nop
  101994:	d503201f 	nop
  101998:	d503201f 	nop
  10199c:	d503201f 	nop
  1019a0:	d503201f 	nop
  1019a4:	d503201f 	nop
  1019a8:	d503201f 	nop
  1019ac:	d503201f 	nop
  1019b0:	d503201f 	nop
  1019b4:	d503201f 	nop
  1019b8:	d503201f 	nop
  1019bc:	d503201f 	nop
  1019c0:	d503201f 	nop
  1019c4:	d503201f 	nop
  1019c8:	d503201f 	nop
  1019cc:	d503201f 	nop
  1019d0:	d503201f 	nop
  1019d4:	d503201f 	nop
  1019d8:	d503201f 	nop
  1019dc:	d503201f 	nop
  1019e0:	d503201f 	nop
  1019e4:	d503201f 	nop
  1019e8:	d503201f 	nop
  1019ec:	d503201f 	nop
  1019f0:	d503201f 	nop
  1019f4:	d503201f 	nop
  1019f8:	d503201f 	nop
  1019fc:	d503201f 	nop

0000000000101a00 <.EXC_CURREL_SPX_Sync>:
  101a00:	d2800220 	mov	x0, #0x11                  	// #17
  101a04:	17fffd81 	b	101008 <__exception_trampoline>
  101a08:	d503201f 	nop
  101a0c:	d503201f 	nop
  101a10:	d503201f 	nop
  101a14:	d503201f 	nop
  101a18:	d503201f 	nop
  101a1c:	d503201f 	nop
  101a20:	d503201f 	nop
  101a24:	d503201f 	nop
  101a28:	d503201f 	nop
  101a2c:	d503201f 	nop
  101a30:	d503201f 	nop
  101a34:	d503201f 	nop
  101a38:	d503201f 	nop
  101a3c:	d503201f 	nop
  101a40:	d503201f 	nop
  101a44:	d503201f 	nop
  101a48:	d503201f 	nop
  101a4c:	d503201f 	nop
  101a50:	d503201f 	nop
  101a54:	d503201f 	nop
  101a58:	d503201f 	nop
  101a5c:	d503201f 	nop
  101a60:	d503201f 	nop
  101a64:	d503201f 	nop
  101a68:	d503201f 	nop
  101a6c:	d503201f 	nop
  101a70:	d503201f 	nop
  101a74:	d503201f 	nop
  101a78:	d503201f 	nop
  101a7c:	d503201f 	nop

0000000000101a80 <.EXC_CURREL_SPX_Irq>:
  101a80:	d2800240 	mov	x0, #0x12                  	// #18
  101a84:	17fffd61 	b	101008 <__exception_trampoline>
  101a88:	d503201f 	nop
  101a8c:	d503201f 	nop
  101a90:	d503201f 	nop
  101a94:	d503201f 	nop
  101a98:	d503201f 	nop
  101a9c:	d503201f 	nop
  101aa0:	d503201f 	nop
  101aa4:	d503201f 	nop
  101aa8:	d503201f 	nop
  101aac:	d503201f 	nop
  101ab0:	d503201f 	nop
  101ab4:	d503201f 	nop
  101ab8:	d503201f 	nop
  101abc:	d503201f 	nop
  101ac0:	d503201f 	nop
  101ac4:	d503201f 	nop
  101ac8:	d503201f 	nop
  101acc:	d503201f 	nop
  101ad0:	d503201f 	nop
  101ad4:	d503201f 	nop
  101ad8:	d503201f 	nop
  101adc:	d503201f 	nop
  101ae0:	d503201f 	nop
  101ae4:	d503201f 	nop
  101ae8:	d503201f 	nop
  101aec:	d503201f 	nop
  101af0:	d503201f 	nop
  101af4:	d503201f 	nop
  101af8:	d503201f 	nop
  101afc:	d503201f 	nop

0000000000101b00 <.EXC_CURREL_SPX_Fiq>:
  101b00:	d2800260 	mov	x0, #0x13                  	// #19
  101b04:	17fffd41 	b	101008 <__exception_trampoline>
  101b08:	d503201f 	nop
  101b0c:	d503201f 	nop
  101b10:	d503201f 	nop
  101b14:	d503201f 	nop
  101b18:	d503201f 	nop
  101b1c:	d503201f 	nop
  101b20:	d503201f 	nop
  101b24:	d503201f 	nop
  101b28:	d503201f 	nop
  101b2c:	d503201f 	nop
  101b30:	d503201f 	nop
  101b34:	d503201f 	nop
  101b38:	d503201f 	nop
  101b3c:	d503201f 	nop
  101b40:	d503201f 	nop
  101b44:	d503201f 	nop
  101b48:	d503201f 	nop
  101b4c:	d503201f 	nop
  101b50:	d503201f 	nop
  101b54:	d503201f 	nop
  101b58:	d503201f 	nop
  101b5c:	d503201f 	nop
  101b60:	d503201f 	nop
  101b64:	d503201f 	nop
  101b68:	d503201f 	nop
  101b6c:	d503201f 	nop
  101b70:	d503201f 	nop
  101b74:	d503201f 	nop
  101b78:	d503201f 	nop
  101b7c:	d503201f 	nop

0000000000101b80 <.EXC_CURREL_SPX_SErr>:
  101b80:	d2800280 	mov	x0, #0x14                  	// #20
  101b84:	17fffd21 	b	101008 <__exception_trampoline>
  101b88:	d503201f 	nop
  101b8c:	d503201f 	nop
  101b90:	d503201f 	nop
  101b94:	d503201f 	nop
  101b98:	d503201f 	nop
  101b9c:	d503201f 	nop
  101ba0:	d503201f 	nop
  101ba4:	d503201f 	nop
  101ba8:	d503201f 	nop
  101bac:	d503201f 	nop
  101bb0:	d503201f 	nop
  101bb4:	d503201f 	nop
  101bb8:	d503201f 	nop
  101bbc:	d503201f 	nop
  101bc0:	d503201f 	nop
  101bc4:	d503201f 	nop
  101bc8:	d503201f 	nop
  101bcc:	d503201f 	nop
  101bd0:	d503201f 	nop
  101bd4:	d503201f 	nop
  101bd8:	d503201f 	nop
  101bdc:	d503201f 	nop
  101be0:	d503201f 	nop
  101be4:	d503201f 	nop
  101be8:	d503201f 	nop
  101bec:	d503201f 	nop
  101bf0:	d503201f 	nop
  101bf4:	d503201f 	nop
  101bf8:	d503201f 	nop
  101bfc:	d503201f 	nop

0000000000101c00 <.EXC_LOWEREL64_SPX_Sync>:
  101c00:	d2800420 	mov	x0, #0x21                  	// #33
  101c04:	17fffd01 	b	101008 <__exception_trampoline>
  101c08:	d503201f 	nop
  101c0c:	d503201f 	nop
  101c10:	d503201f 	nop
  101c14:	d503201f 	nop
  101c18:	d503201f 	nop
  101c1c:	d503201f 	nop
  101c20:	d503201f 	nop
  101c24:	d503201f 	nop
  101c28:	d503201f 	nop
  101c2c:	d503201f 	nop
  101c30:	d503201f 	nop
  101c34:	d503201f 	nop
  101c38:	d503201f 	nop
  101c3c:	d503201f 	nop
  101c40:	d503201f 	nop
  101c44:	d503201f 	nop
  101c48:	d503201f 	nop
  101c4c:	d503201f 	nop
  101c50:	d503201f 	nop
  101c54:	d503201f 	nop
  101c58:	d503201f 	nop
  101c5c:	d503201f 	nop
  101c60:	d503201f 	nop
  101c64:	d503201f 	nop
  101c68:	d503201f 	nop
  101c6c:	d503201f 	nop
  101c70:	d503201f 	nop
  101c74:	d503201f 	nop
  101c78:	d503201f 	nop
  101c7c:	d503201f 	nop

0000000000101c80 <.EXC_LOWEREL64_SPX_Irq>:
  101c80:	d2800440 	mov	x0, #0x22                  	// #34
  101c84:	17fffce1 	b	101008 <__exception_trampoline>
  101c88:	d503201f 	nop
  101c8c:	d503201f 	nop
  101c90:	d503201f 	nop
  101c94:	d503201f 	nop
  101c98:	d503201f 	nop
  101c9c:	d503201f 	nop
  101ca0:	d503201f 	nop
  101ca4:	d503201f 	nop
  101ca8:	d503201f 	nop
  101cac:	d503201f 	nop
  101cb0:	d503201f 	nop
  101cb4:	d503201f 	nop
  101cb8:	d503201f 	nop
  101cbc:	d503201f 	nop
  101cc0:	d503201f 	nop
  101cc4:	d503201f 	nop
  101cc8:	d503201f 	nop
  101ccc:	d503201f 	nop
  101cd0:	d503201f 	nop
  101cd4:	d503201f 	nop
  101cd8:	d503201f 	nop
  101cdc:	d503201f 	nop
  101ce0:	d503201f 	nop
  101ce4:	d503201f 	nop
  101ce8:	d503201f 	nop
  101cec:	d503201f 	nop
  101cf0:	d503201f 	nop
  101cf4:	d503201f 	nop
  101cf8:	d503201f 	nop
  101cfc:	d503201f 	nop

0000000000101d00 <.EXC_LOWEREL64_SPX_Fiq>:
  101d00:	d2800460 	mov	x0, #0x23                  	// #35
  101d04:	17fffcc1 	b	101008 <__exception_trampoline>
  101d08:	d503201f 	nop
  101d0c:	d503201f 	nop
  101d10:	d503201f 	nop
  101d14:	d503201f 	nop
  101d18:	d503201f 	nop
  101d1c:	d503201f 	nop
  101d20:	d503201f 	nop
  101d24:	d503201f 	nop
  101d28:	d503201f 	nop
  101d2c:	d503201f 	nop
  101d30:	d503201f 	nop
  101d34:	d503201f 	nop
  101d38:	d503201f 	nop
  101d3c:	d503201f 	nop
  101d40:	d503201f 	nop
  101d44:	d503201f 	nop
  101d48:	d503201f 	nop
  101d4c:	d503201f 	nop
  101d50:	d503201f 	nop
  101d54:	d503201f 	nop
  101d58:	d503201f 	nop
  101d5c:	d503201f 	nop
  101d60:	d503201f 	nop
  101d64:	d503201f 	nop
  101d68:	d503201f 	nop
  101d6c:	d503201f 	nop
  101d70:	d503201f 	nop
  101d74:	d503201f 	nop
  101d78:	d503201f 	nop
  101d7c:	d503201f 	nop

0000000000101d80 <.EXC_LOWEREL64_SPX_SErr>:
  101d80:	d2800480 	mov	x0, #0x24                  	// #36
  101d84:	17fffca1 	b	101008 <__exception_trampoline>
  101d88:	d503201f 	nop
  101d8c:	d503201f 	nop
  101d90:	d503201f 	nop
  101d94:	d503201f 	nop
  101d98:	d503201f 	nop
  101d9c:	d503201f 	nop
  101da0:	d503201f 	nop
  101da4:	d503201f 	nop
  101da8:	d503201f 	nop
  101dac:	d503201f 	nop
  101db0:	d503201f 	nop
  101db4:	d503201f 	nop
  101db8:	d503201f 	nop
  101dbc:	d503201f 	nop
  101dc0:	d503201f 	nop
  101dc4:	d503201f 	nop
  101dc8:	d503201f 	nop
  101dcc:	d503201f 	nop
  101dd0:	d503201f 	nop
  101dd4:	d503201f 	nop
  101dd8:	d503201f 	nop
  101ddc:	d503201f 	nop
  101de0:	d503201f 	nop
  101de4:	d503201f 	nop
  101de8:	d503201f 	nop
  101dec:	d503201f 	nop
  101df0:	d503201f 	nop
  101df4:	d503201f 	nop
  101df8:	d503201f 	nop
  101dfc:	d503201f 	nop

0000000000101e00 <.EXC_LOWEREL32_SPX_Sync>:
  101e00:	d2800620 	mov	x0, #0x31                  	// #49
  101e04:	17fffc81 	b	101008 <__exception_trampoline>
  101e08:	d503201f 	nop
  101e0c:	d503201f 	nop
  101e10:	d503201f 	nop
  101e14:	d503201f 	nop
  101e18:	d503201f 	nop
  101e1c:	d503201f 	nop
  101e20:	d503201f 	nop
  101e24:	d503201f 	nop
  101e28:	d503201f 	nop
  101e2c:	d503201f 	nop
  101e30:	d503201f 	nop
  101e34:	d503201f 	nop
  101e38:	d503201f 	nop
  101e3c:	d503201f 	nop
  101e40:	d503201f 	nop
  101e44:	d503201f 	nop
  101e48:	d503201f 	nop
  101e4c:	d503201f 	nop
  101e50:	d503201f 	nop
  101e54:	d503201f 	nop
  101e58:	d503201f 	nop
  101e5c:	d503201f 	nop
  101e60:	d503201f 	nop
  101e64:	d503201f 	nop
  101e68:	d503201f 	nop
  101e6c:	d503201f 	nop
  101e70:	d503201f 	nop
  101e74:	d503201f 	nop
  101e78:	d503201f 	nop
  101e7c:	d503201f 	nop

0000000000101e80 <.EXC_LOWEREL32_SPX_Irq>:
  101e80:	d2800640 	mov	x0, #0x32                  	// #50
  101e84:	17fffc61 	b	101008 <__exception_trampoline>
  101e88:	d503201f 	nop
  101e8c:	d503201f 	nop
  101e90:	d503201f 	nop
  101e94:	d503201f 	nop
  101e98:	d503201f 	nop
  101e9c:	d503201f 	nop
  101ea0:	d503201f 	nop
  101ea4:	d503201f 	nop
  101ea8:	d503201f 	nop
  101eac:	d503201f 	nop
  101eb0:	d503201f 	nop
  101eb4:	d503201f 	nop
  101eb8:	d503201f 	nop
  101ebc:	d503201f 	nop
  101ec0:	d503201f 	nop
  101ec4:	d503201f 	nop
  101ec8:	d503201f 	nop
  101ecc:	d503201f 	nop
  101ed0:	d503201f 	nop
  101ed4:	d503201f 	nop
  101ed8:	d503201f 	nop
  101edc:	d503201f 	nop
  101ee0:	d503201f 	nop
  101ee4:	d503201f 	nop
  101ee8:	d503201f 	nop
  101eec:	d503201f 	nop
  101ef0:	d503201f 	nop
  101ef4:	d503201f 	nop
  101ef8:	d503201f 	nop
  101efc:	d503201f 	nop

0000000000101f00 <.EXC_LOWEREL32_SPX_Fiq>:
  101f00:	d2800660 	mov	x0, #0x33                  	// #51
  101f04:	17fffc41 	b	101008 <__exception_trampoline>
  101f08:	d503201f 	nop
  101f0c:	d503201f 	nop
  101f10:	d503201f 	nop
  101f14:	d503201f 	nop
  101f18:	d503201f 	nop
  101f1c:	d503201f 	nop
  101f20:	d503201f 	nop
  101f24:	d503201f 	nop
  101f28:	d503201f 	nop
  101f2c:	d503201f 	nop
  101f30:	d503201f 	nop
  101f34:	d503201f 	nop
  101f38:	d503201f 	nop
  101f3c:	d503201f 	nop
  101f40:	d503201f 	nop
  101f44:	d503201f 	nop
  101f48:	d503201f 	nop
  101f4c:	d503201f 	nop
  101f50:	d503201f 	nop
  101f54:	d503201f 	nop
  101f58:	d503201f 	nop
  101f5c:	d503201f 	nop
  101f60:	d503201f 	nop
  101f64:	d503201f 	nop
  101f68:	d503201f 	nop
  101f6c:	d503201f 	nop
  101f70:	d503201f 	nop
  101f74:	d503201f 	nop
  101f78:	d503201f 	nop
  101f7c:	d503201f 	nop

0000000000101f80 <.EXC_LOWEREL32_SPX_SErr>:
  101f80:	d2800680 	mov	x0, #0x34                  	// #52
  101f84:	17fffc21 	b	101008 <__exception_trampoline>

0000000000101f88 <_ZN12ruspiro_uart5uart15Uart13new17h560b58a1875eb6cdE>:
  101f88:	2a1f03e0 	mov	w0, wzr
  101f8c:	d65f03c0 	ret

0000000000101f90 <_ZN12ruspiro_uart5uart15Uart110initialize17hbe153646f8718a65E>:
  101f90:	d10183ff 	sub	sp, sp, #0x60
  101f94:	a9057bf3 	stp	x19, x30, [sp, #80]
  101f98:	aa0003f3 	mov	x19, x0
  101f9c:	f00000c0 	adrp	x0, 11c000 <TestKernelAarch64+0xc000>
  101fa0:	a90453f5 	stp	x21, x20, [sp, #64]
  101fa4:	910003e8 	mov	x8, sp
  101fa8:	2a0203f5 	mov	w21, w2
  101fac:	2a0103f4 	mov	w20, w1
  101fb0:	f944f800 	ldr	x0, [x0, #2544]
  101fb4:	940000e7 	bl	102350 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h0c21f3947b337405E>
  101fb8:	f94003e8 	ldr	x8, [sp]
  101fbc:	f100051f 	cmp	x8, #0x1
  101fc0:	540000c1 	b.ne	101fd8 <_ZN12ruspiro_uart5uart15Uart110initialize17hbe153646f8718a65E+0x48>  // b.any
  101fc4:	a94087e0 	ldp	x0, x1, [sp, #8]
  101fc8:	a9457bf3 	ldp	x19, x30, [sp, #80]
  101fcc:	a94453f5 	ldp	x21, x20, [sp, #64]
  101fd0:	910183ff 	add	sp, sp, #0x60
  101fd4:	d65f03c0 	ret
  101fd8:	f00000c8 	adrp	x8, 11c000 <TestKernelAarch64+0xc000>
  101fdc:	f00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  101fe0:	f00000ca 	adrp	x10, 11c000 <TestKernelAarch64+0xc000>
  101fe4:	f00000cb 	adrp	x11, 11c000 <TestKernelAarch64+0xc000>
  101fe8:	f00000cd 	adrp	x13, 11c000 <TestKernelAarch64+0xc000>
  101fec:	f00000cf 	adrp	x15, 11c000 <TestKernelAarch64+0xc000>
  101ff0:	f940610c 	ldr	x12, [x8, #192]
  101ff4:	52800028 	mov	w8, #0x1                   	// #1
  101ff8:	f940652e 	ldr	x14, [x9, #200]
  101ffc:	f9406949 	ldr	x9, [x10, #208]
  102000:	5280006a 	mov	w10, #0x3                   	// #3
  102004:	f9406d6b 	ldr	x11, [x11, #216]
  102008:	f94071ad 	ldr	x13, [x13, #224]
  10200c:	b9000188 	str	w8, [x12]
  102010:	b90001df 	str	wzr, [x14]
  102014:	b900013f 	str	wzr, [x9]
  102018:	f94075ec 	ldr	x12, [x15, #232]
  10201c:	528018cf 	mov	w15, #0xc6                  	// #198
  102020:	b900016a 	str	w10, [x11]
  102024:	531d72ab 	lsl	w11, w21, #3
  102028:	b90001bf 	str	wzr, [x13]
  10202c:	b90001df 	str	wzr, [x14]
  102030:	b900018f 	str	w15, [x12]
  102034:	340001cb 	cbz	w11, 10206c <_ZN12ruspiro_uart5uart15Uart110initialize17hbe153646f8718a65E+0xdc>
  102038:	d00000cc 	adrp	x12, 11c000 <TestKernelAarch64+0xc000>
  10203c:	1acb0a8b 	udiv	w11, w20, w11
  102040:	aa1f03e0 	mov	x0, xzr
  102044:	aa1f03e1 	mov	x1, xzr
  102048:	5100056b 	sub	w11, w11, #0x1
  10204c:	f940798c 	ldr	x12, [x12, #240]
  102050:	b900018b 	str	w11, [x12]
  102054:	b900012a 	str	w10, [x9]
  102058:	39000268 	strb	w8, [x19]
  10205c:	a9457bf3 	ldp	x19, x30, [sp, #80]
  102060:	a94453f5 	ldp	x21, x20, [sp, #64]
  102064:	910183ff 	add	sp, sp, #0x60
  102068:	d65f03c0 	ret
  10206c:	d00000c0 	adrp	x0, 11c000 <TestKernelAarch64+0xc000>
  102070:	d00000c2 	adrp	x2, 11c000 <TestKernelAarch64+0xc000>
  102074:	91054000 	add	x0, x0, #0x150
  102078:	52800321 	mov	w1, #0x19                  	// #25
  10207c:	911f2042 	add	x2, x2, #0x7c8
  102080:	940006c3 	bl	103b8c <_ZN4core9panicking5panic17hc6f3025301472b62E>
  102084:	d4200020 	brk	#0x1

0000000000102088 <_ZN12ruspiro_uart5uart15Uart111send_string17h9fa54bd75baa7ec7E>:
  102088:	f81c0ff8 	str	x24, [sp, #-64]!
  10208c:	39400008 	ldrb	w8, [x0]
  102090:	a9015bf7 	stp	x23, x22, [sp, #16]
  102094:	a90253f5 	stp	x21, x20, [sp, #32]
  102098:	a9037bf3 	stp	x19, x30, [sp, #48]
  10209c:	7100011f 	cmp	w8, #0x0
  1020a0:	fa401844 	ccmp	x2, #0x0, #0x4, ne  // ne = any
  1020a4:	54000300 	b.eq	102104 <_ZN12ruspiro_uart5uart15Uart111send_string17h9fa54bd75baa7ec7E+0x7c>  // b.none
  1020a8:	d00000c8 	adrp	x8, 11c000 <TestKernelAarch64+0xc000>
  1020ac:	d00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  1020b0:	aa0103f3 	mov	x19, x1
  1020b4:	8b020037 	add	x23, x1, x2
  1020b8:	52800154 	mov	w20, #0xa                   	// #10
  1020bc:	f9407d15 	ldr	x21, [x8, #248]
  1020c0:	f9408136 	ldr	x22, [x9, #256]
  1020c4:	b94002a8 	ldr	w8, [x21]
  1020c8:	91000678 	add	x24, x19, #0x1
  1020cc:	36280128 	tbz	w8, #5, 1020f0 <_ZN12ruspiro_uart5uart15Uart111send_string17h9fa54bd75baa7ec7E+0x68>
  1020d0:	39400268 	ldrb	w8, [x19]
  1020d4:	aa1803f3 	mov	x19, x24
  1020d8:	eb17031f 	cmp	x24, x23
  1020dc:	b90002c8 	str	w8, [x22]
  1020e0:	54000120 	b.eq	102104 <_ZN12ruspiro_uart5uart15Uart111send_string17h9fa54bd75baa7ec7E+0x7c>  // b.none
  1020e4:	b94002a8 	ldr	w8, [x21]
  1020e8:	91000678 	add	x24, x19, #0x1
  1020ec:	372fff28 	tbnz	w8, #5, 1020d0 <_ZN12ruspiro_uart5uart15Uart111send_string17h9fa54bd75baa7ec7E+0x48>
  1020f0:	2a1403e0 	mov	w0, w20
  1020f4:	940002d5 	bl	102c48 <_ZN13ruspiro_timer11sleepcycles17hcaf8521ef438039dE>
  1020f8:	b94002a8 	ldr	w8, [x21]
  1020fc:	362fffa8 	tbz	w8, #5, 1020f0 <_ZN12ruspiro_uart5uart15Uart111send_string17h9fa54bd75baa7ec7E+0x68>
  102100:	17fffff4 	b	1020d0 <_ZN12ruspiro_uart5uart15Uart111send_string17h9fa54bd75baa7ec7E+0x48>
  102104:	a9437bf3 	ldp	x19, x30, [sp, #48]
  102108:	a94253f5 	ldp	x21, x20, [sp, #32]
  10210c:	a9415bf7 	ldp	x23, x22, [sp, #16]
  102110:	f84407f8 	ldr	x24, [sp], #64
  102114:	d65f03c0 	ret

0000000000102118 <_ZN12ruspiro_uart5uart15Uart116try_receive_data17hae1e14c8f50fd4a7E>:
  102118:	f81b0ffa 	str	x26, [sp, #-80]!
  10211c:	39400009 	ldrb	w9, [x0]
  102120:	a9047bf3 	stp	x19, x30, [sp, #64]
  102124:	aa0803f3 	mov	x19, x8
  102128:	a90163f9 	stp	x25, x24, [sp, #16]
  10212c:	a9025bf7 	stp	x23, x22, [sp, #32]
  102130:	a90353f5 	stp	x21, x20, [sp, #48]
  102134:	34000429 	cbz	w9, 1021b8 <_ZN12ruspiro_uart5uart15Uart116try_receive_data17hae1e14c8f50fd4a7E+0xa0>
  102138:	aa0203f4 	mov	x20, x2
  10213c:	b40004c2 	cbz	x2, 1021d4 <_ZN12ruspiro_uart5uart15Uart116try_receive_data17hae1e14c8f50fd4a7E+0xbc>
  102140:	d00000c8 	adrp	x8, 11c000 <TestKernelAarch64+0xc000>
  102144:	d00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  102148:	aa0103f5 	mov	x21, x1
  10214c:	aa1f03f7 	mov	x23, xzr
  102150:	52807d16 	mov	w22, #0x3e8                 	// #1000
  102154:	f9407d18 	ldr	x24, [x8, #248]
  102158:	f9408139 	ldr	x25, [x9, #256]
  10215c:	b9400308 	ldr	w8, [x24]
  102160:	37000088 	tbnz	w8, #0, 102170 <_ZN12ruspiro_uart5uart15Uart116try_receive_data17hae1e14c8f50fd4a7E+0x58>
  102164:	1400000b 	b	102190 <_ZN12ruspiro_uart5uart15Uart116try_receive_data17hae1e14c8f50fd4a7E+0x78>
  102168:	710f9b5f 	cmp	w26, #0x3e6
  10216c:	540003c8 	b.hi	1021e4 <_ZN12ruspiro_uart5uart15Uart116try_receive_data17hae1e14c8f50fd4a7E+0xcc>  // b.pmore
  102170:	b9400328 	ldr	w8, [x25]
  102174:	910006e9 	add	x9, x23, #0x1
  102178:	eb14013f 	cmp	x9, x20
  10217c:	38376aa8 	strb	w8, [x21, x23]
  102180:	aa0903f7 	mov	x23, x9
  102184:	54000220 	b.eq	1021c8 <_ZN12ruspiro_uart5uart15Uart116try_receive_data17hae1e14c8f50fd4a7E+0xb0>  // b.none
  102188:	b9400308 	ldr	w8, [x24]
  10218c:	3707ff28 	tbnz	w8, #0, 102170 <_ZN12ruspiro_uart5uart15Uart116try_receive_data17hae1e14c8f50fd4a7E+0x58>
  102190:	2a1f03e9 	mov	w9, wzr
  102194:	2a1603e0 	mov	w0, w22
  102198:	2a0903fa 	mov	w26, w9
  10219c:	940002ab 	bl	102c48 <_ZN13ruspiro_timer11sleepcycles17hcaf8521ef438039dE>
  1021a0:	b9400308 	ldr	w8, [x24]
  1021a4:	710f9b5f 	cmp	w26, #0x3e6
  1021a8:	54fffe08 	b.hi	102168 <_ZN12ruspiro_uart5uart15Uart116try_receive_data17hae1e14c8f50fd4a7E+0x50>  // b.pmore
  1021ac:	11000749 	add	w9, w26, #0x1
  1021b0:	3607ff28 	tbz	w8, #0, 102194 <_ZN12ruspiro_uart5uart15Uart116try_receive_data17hae1e14c8f50fd4a7E+0x7c>
  1021b4:	17ffffed 	b	102168 <_ZN12ruspiro_uart5uart15Uart116try_receive_data17hae1e14c8f50fd4a7E+0x50>
  1021b8:	d00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  1021bc:	5280028a 	mov	w10, #0x14                  	// #20
  1021c0:	91029929 	add	x9, x9, #0xa6
  1021c4:	1400000b 	b	1021f0 <_ZN12ruspiro_uart5uart15Uart116try_receive_data17hae1e14c8f50fd4a7E+0xd8>
  1021c8:	aa1f03e8 	mov	x8, xzr
  1021cc:	f9000674 	str	x20, [x19, #8]
  1021d0:	1400000a 	b	1021f8 <_ZN12ruspiro_uart5uart15Uart116try_receive_data17hae1e14c8f50fd4a7E+0xe0>
  1021d4:	d00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  1021d8:	528004aa 	mov	w10, #0x25                  	// #37
  1021dc:	91020529 	add	x9, x9, #0x81
  1021e0:	14000004 	b	1021f0 <_ZN12ruspiro_uart5uart15Uart116try_receive_data17hae1e14c8f50fd4a7E+0xd8>
  1021e4:	d00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  1021e8:	528000ea 	mov	w10, #0x7                   	// #7
  1021ec:	9105a529 	add	x9, x9, #0x169
  1021f0:	52800028 	mov	w8, #0x1                   	// #1
  1021f4:	a900aa69 	stp	x9, x10, [x19, #8]
  1021f8:	f9000268 	str	x8, [x19]
  1021fc:	a9447bf3 	ldp	x19, x30, [sp, #64]
  102200:	a94353f5 	ldp	x21, x20, [sp, #48]
  102204:	a9425bf7 	ldp	x23, x22, [sp, #32]
  102208:	a94163f9 	ldp	x25, x24, [sp, #16]
  10220c:	f84507fa 	ldr	x26, [sp], #80
  102210:	d65f03c0 	ret
  102214:	00000000 	.inst	0x00000000 ; undefined

0000000000102218 <_ZN12ruspiro_uart5uart15Uart112receive_data17h8890cb7e53c5e603E>:
  102218:	f81b0ffa 	str	x26, [sp, #-80]!
  10221c:	39400009 	ldrb	w9, [x0]
  102220:	a9047bf3 	stp	x19, x30, [sp, #64]
  102224:	aa0803f3 	mov	x19, x8
  102228:	a90163f9 	stp	x25, x24, [sp, #16]
  10222c:	a9025bf7 	stp	x23, x22, [sp, #32]
  102230:	a90353f5 	stp	x21, x20, [sp, #48]
  102234:	340003a9 	cbz	w9, 1022a8 <_ZN12ruspiro_uart5uart15Uart112receive_data17h8890cb7e53c5e603E+0x90>
  102238:	aa0203f4 	mov	x20, x2
  10223c:	b40003e2 	cbz	x2, 1022b8 <_ZN12ruspiro_uart5uart15Uart112receive_data17h8890cb7e53c5e603E+0xa0>
  102240:	d00000c8 	adrp	x8, 11c000 <TestKernelAarch64+0xc000>
  102244:	d00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  102248:	aa0103f5 	mov	x21, x1
  10224c:	aa1f03f7 	mov	x23, xzr
  102250:	52807d16 	mov	w22, #0x3e8                 	// #1000
  102254:	f9407d18 	ldr	x24, [x8, #248]
  102258:	f9408139 	ldr	x25, [x9, #256]
  10225c:	b9400308 	ldr	w8, [x24]
  102260:	910006fa 	add	x26, x23, #0x1
  102264:	36000128 	tbz	w8, #0, 102288 <_ZN12ruspiro_uart5uart15Uart112receive_data17h8890cb7e53c5e603E+0x70>
  102268:	b9400328 	ldr	w8, [x25]
  10226c:	eb14035f 	cmp	x26, x20
  102270:	38376aa8 	strb	w8, [x21, x23]
  102274:	aa1a03f7 	mov	x23, x26
  102278:	54000120 	b.eq	10229c <_ZN12ruspiro_uart5uart15Uart112receive_data17h8890cb7e53c5e603E+0x84>  // b.none
  10227c:	b9400308 	ldr	w8, [x24]
  102280:	910006fa 	add	x26, x23, #0x1
  102284:	3707ff28 	tbnz	w8, #0, 102268 <_ZN12ruspiro_uart5uart15Uart112receive_data17h8890cb7e53c5e603E+0x50>
  102288:	2a1603e0 	mov	w0, w22
  10228c:	9400026f 	bl	102c48 <_ZN13ruspiro_timer11sleepcycles17hcaf8521ef438039dE>
  102290:	b9400308 	ldr	w8, [x24]
  102294:	3607ffa8 	tbz	w8, #0, 102288 <_ZN12ruspiro_uart5uart15Uart112receive_data17h8890cb7e53c5e603E+0x70>
  102298:	17fffff4 	b	102268 <_ZN12ruspiro_uart5uart15Uart112receive_data17h8890cb7e53c5e603E+0x50>
  10229c:	aa1f03e8 	mov	x8, xzr
  1022a0:	f9000674 	str	x20, [x19, #8]
  1022a4:	1400000a 	b	1022cc <_ZN12ruspiro_uart5uart15Uart112receive_data17h8890cb7e53c5e603E+0xb4>
  1022a8:	d00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  1022ac:	5280028a 	mov	w10, #0x14                  	// #20
  1022b0:	91029929 	add	x9, x9, #0xa6
  1022b4:	14000004 	b	1022c4 <_ZN12ruspiro_uart5uart15Uart112receive_data17h8890cb7e53c5e603E+0xac>
  1022b8:	d00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  1022bc:	528004aa 	mov	w10, #0x25                  	// #37
  1022c0:	91020529 	add	x9, x9, #0x81
  1022c4:	52800028 	mov	w8, #0x1                   	// #1
  1022c8:	a900aa69 	stp	x9, x10, [x19, #8]
  1022cc:	f9000268 	str	x8, [x19]
  1022d0:	a9447bf3 	ldp	x19, x30, [sp, #64]
  1022d4:	a94353f5 	ldp	x21, x20, [sp, #48]
  1022d8:	a9425bf7 	ldp	x23, x22, [sp, #32]
  1022dc:	a94163f9 	ldp	x25, x24, [sp, #16]
  1022e0:	f84507fa 	ldr	x26, [sp], #80
  1022e4:	d65f03c0 	ret

00000000001022e8 <_ZN12ruspiro_uart5uart15Uart117enable_interrupts17h62cc85fc6133574dE>:
  1022e8:	39400008 	ldrb	w8, [x0]
  1022ec:	340000c8 	cbz	w8, 102304 <_ZN12ruspiro_uart5uart15Uart117enable_interrupts17h62cc85fc6133574dE+0x1c>
  1022f0:	d00000c8 	adrp	x8, 11c000 <TestKernelAarch64+0xc000>
  1022f4:	12001c29 	and	w9, w1, #0xff
  1022f8:	11003529 	add	w9, w9, #0xd
  1022fc:	f9406508 	ldr	x8, [x8, #200]
  102300:	b9000109 	str	w9, [x8]
  102304:	d65f03c0 	ret

0000000000102308 <_ZN68_$LT$ruspiro_uart..uart1..Uart1$u20$as$u20$core..ops..drop..Drop$GT$4drop17h8c59e9373ebb853bE>:
  102308:	f81e0ff4 	str	x20, [sp, #-32]!
  10230c:	a9017bf3 	stp	x19, x30, [sp, #16]
  102310:	d00000d3 	adrp	x19, 11c000 <TestKernelAarch64+0xc000>
  102314:	f944fa73 	ldr	x19, [x19, #2544]
  102318:	aa1303e0 	mov	x0, x19
  10231c:	940003bf 	bl	103218 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E>
  102320:	91004274 	add	x20, x19, #0x10
  102324:	528001c1 	mov	w1, #0xe                   	// #14
  102328:	aa1403e0 	mov	x0, x20
  10232c:	940000f5 	bl	102700 <_ZN12ruspiro_gpio4Gpio8free_pin17hc61071ceda926edfE>
  102330:	aa1403e0 	mov	x0, x20
  102334:	528001e1 	mov	w1, #0xf                   	// #15
  102338:	940000f2 	bl	102700 <_ZN12ruspiro_gpio4Gpio8free_pin17hc61071ceda926edfE>
  10233c:	aa1303e0 	mov	x0, x19
  102340:	a9417bf3 	ldp	x19, x30, [sp, #16]
  102344:	f84207f4 	ldr	x20, [sp], #32
  102348:	140003c2 	b	103250 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hcb55c707bd8b2049E>
  10234c:	00000000 	.inst	0x00000000 ; undefined

0000000000102350 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h0c21f3947b337405E>:
  102350:	d102c3ff 	sub	sp, sp, #0xb0
  102354:	a9066bfb 	stp	x27, x26, [sp, #96]
  102358:	a90763f9 	stp	x25, x24, [sp, #112]
  10235c:	a9085bf7 	stp	x23, x22, [sp, #128]
  102360:	a90953f5 	stp	x21, x20, [sp, #144]
  102364:	aa0003f4 	mov	x20, x0
  102368:	a90a7bf3 	stp	x19, x30, [sp, #160]
  10236c:	aa0803f3 	mov	x19, x8
  102370:	940003aa 	bl	103218 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E>
  102374:	91004295 	add	x21, x20, #0x10
  102378:	910083e8 	add	x8, sp, #0x20
  10237c:	aa1503e0 	mov	x0, x21
  102380:	528001c1 	mov	w1, #0xe                   	// #14
  102384:	94000083 	bl	102590 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE>
  102388:	f94013e8 	ldr	x8, [sp, #32]
  10238c:	d00000d9 	adrp	x25, 11c000 <TestKernelAarch64+0xc000>
  102390:	f100051f 	cmp	x8, #0x1
  102394:	54000081 	b.ne	1023a4 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h0c21f3947b337405E+0x54>  // b.any
  102398:	a942dff6 	ldp	x22, x23, [sp, #40]
  10239c:	52800038 	mov	w24, #0x1                   	// #1
  1023a0:	1400001c 	b	102410 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h0c21f3947b337405E+0xc0>
  1023a4:	a942dff6 	ldp	x22, x23, [sp, #40]
  1023a8:	5280004d 	mov	w13, #0x2                   	// #2
  1023ac:	f94023e8 	ldr	x8, [sp, #64]
  1023b0:	29492fea 	ldp	w10, w11, [sp, #72]
  1023b4:	b94057e9 	ldr	w9, [sp, #84]
  1023b8:	b94002cc 	ldr	w12, [x22]
  1023bc:	1acb21ab 	lsl	w11, w13, w11
  1023c0:	0a2a018c 	bic	w12, w12, w10
  1023c4:	0a0a016a 	and	w10, w11, w10
  1023c8:	2a0a018b 	orr	w11, w12, w10
  1023cc:	f940bb2a 	ldr	x10, [x25, #368]
  1023d0:	b90002cb 	str	w11, [x22]
  1023d4:	b940014b 	ldr	w11, [x10]
  1023d8:	121e756c 	and	w12, w11, #0xfffffffc
  1023dc:	528012cb 	mov	w11, #0x96                  	// #150
  1023e0:	b900014c 	str	w12, [x10]
  1023e4:	7100056b 	subs	w11, w11, #0x1
  1023e8:	d503201f 	nop
  1023ec:	54ffffc1 	b.ne	1023e4 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h0c21f3947b337405E+0x94>  // b.any
  1023f0:	528012cb 	mov	w11, #0x96                  	// #150
  1023f4:	b9000109 	str	w9, [x8]
  1023f8:	7100056b 	subs	w11, w11, #0x1
  1023fc:	d503201f 	nop
  102400:	54ffffc1 	b.ne	1023f8 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h0c21f3947b337405E+0xa8>  // b.any
  102404:	aa1f03f8 	mov	x24, xzr
  102408:	b900015f 	str	wzr, [x10]
  10240c:	b9000109 	str	w9, [x8]
  102410:	910083e8 	add	x8, sp, #0x20
  102414:	aa1503e0 	mov	x0, x21
  102418:	528001e1 	mov	w1, #0xf                   	// #15
  10241c:	9400005d 	bl	102590 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE>
  102420:	f94013e8 	ldr	x8, [sp, #32]
  102424:	f100051f 	cmp	x8, #0x1
  102428:	540000c1 	b.ne	102440 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h0c21f3947b337405E+0xf0>  // b.any
  10242c:	a942a3e9 	ldp	x9, x8, [sp, #40]
  102430:	5280002c 	mov	w12, #0x1                   	// #1
  102434:	3d8007e0 	str	q0, [sp, #16]
  102438:	3d8003e0 	str	q0, [sp]
  10243c:	14000024 	b	1024cc <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h0c21f3947b337405E+0x17c>
  102440:	2949abeb 	ldp	w11, w10, [sp, #76]
  102444:	5280004e 	mov	w14, #0x2                   	// #2
  102448:	a942a3e9 	ldp	x9, x8, [sp, #40]
  10244c:	b9404bf5 	ldr	w21, [sp, #72]
  102450:	b3607d4b 	bfi	x11, x10, #32, #32
  102454:	a943ebfb 	ldp	x27, x26, [sp, #56]
  102458:	9e670160 	fmov	d0, x11
  10245c:	294aafec 	ldp	w12, w11, [sp, #84]
  102460:	b940012a 	ldr	w10, [x9]
  102464:	b3607d6c 	bfi	x12, x11, #32, #32
  102468:	528012cb 	mov	w11, #0x96                  	// #150
  10246c:	1e26000d 	fmov	w13, s0
  102470:	0a35014a 	bic	w10, w10, w21
  102474:	9e670181 	fmov	d1, x12
  102478:	1acd21cd 	lsl	w13, w14, w13
  10247c:	0a1501ad 	and	w13, w13, w21
  102480:	2a0d014d 	orr	w13, w10, w13
  102484:	f940bb2a 	ldr	x10, [x25, #368]
  102488:	b900012d 	str	w13, [x9]
  10248c:	b940014d 	ldr	w13, [x10]
  102490:	121e75ad 	and	w13, w13, #0xfffffffc
  102494:	b900014d 	str	w13, [x10]
  102498:	7100056b 	subs	w11, w11, #0x1
  10249c:	d503201f 	nop
  1024a0:	54ffffc1 	b.ne	102498 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h0c21f3947b337405E+0x148>  // b.any
  1024a4:	1e26002b 	fmov	w11, s1
  1024a8:	528012cc 	mov	w12, #0x96                  	// #150
  1024ac:	ad0003e1 	stp	q1, q0, [sp]
  1024b0:	bd000341 	str	s1, [x26]
  1024b4:	7100058c 	subs	w12, w12, #0x1
  1024b8:	d503201f 	nop
  1024bc:	54ffffc1 	b.ne	1024b4 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h0c21f3947b337405E+0x164>  // b.any
  1024c0:	aa1f03ec 	mov	x12, xzr
  1024c4:	b900015f 	str	wzr, [x10]
  1024c8:	b900034b 	str	w11, [x26]
  1024cc:	aa1403e0 	mov	x0, x20
  1024d0:	f100031f 	cmp	x24, #0x0
  1024d4:	9a9f0598 	csinc	x24, x12, xzr, eq  // eq = none
  1024d8:	9a8912d6 	csel	x22, x22, x9, ne  // ne = any
  1024dc:	9a8812f7 	csel	x23, x23, x8, ne  // ne = any
  1024e0:	9400035c 	bl	103250 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hcb55c707bd8b2049E>
  1024e4:	3dc007e0 	ldr	q0, [sp, #16]
  1024e8:	a9005a78 	stp	x24, x22, [x19]
  1024ec:	a9016e77 	stp	x23, x27, [x19, #16]
  1024f0:	f900127a 	str	x26, [x19, #32]
  1024f4:	9e660008 	fmov	x8, d0
  1024f8:	3dc003e0 	ldr	q0, [sp]
  1024fc:	a9485bf7 	ldp	x23, x22, [sp, #128]
  102500:	a94763f9 	ldp	x25, x24, [sp, #112]
  102504:	9e66000a 	fmov	x10, d0
  102508:	a9466bfb 	ldp	x27, x26, [sp, #96]
  10250c:	d360fd09 	lsr	x9, x8, #32
  102510:	29052275 	stp	w21, w8, [x19, #40]
  102514:	a94953f5 	ldp	x21, x20, [sp, #144]
  102518:	d360fd48 	lsr	x8, x10, #32
  10251c:	29062a69 	stp	w9, w10, [x19, #48]
  102520:	b9003a68 	str	w8, [x19, #56]
  102524:	a94a7bf3 	ldp	x19, x30, [sp, #160]
  102528:	9102c3ff 	add	sp, sp, #0xb0
  10252c:	d65f03c0 	ret

0000000000102530 <lit_debug_led>:
  102530:	529999a8 	mov	w8, #0xcccd                	// #52429
  102534:	52800149 	mov	w9, #0xa                   	// #10
  102538:	72b99988 	movk	w8, #0xcccc, lsl #16
  10253c:	52a7e40a 	mov	w10, #0x3f200000            	// #1059061760
  102540:	528000ec 	mov	w12, #0x7                   	// #7
  102544:	5280002d 	mov	w13, #0x1                   	// #1
  102548:	9ba87c08 	umull	x8, w0, w8
  10254c:	d363fd08 	lsr	x8, x8, #35
  102550:	d37ef50b 	lsl	x11, x8, #2
  102554:	1b098108 	msub	w8, w8, w9, w0
  102558:	b86a6969 	ldr	w9, [x11, x10]
  10255c:	0b080508 	add	w8, w8, w8, lsl #1
  102560:	1ac8218c 	lsl	w12, w12, w8
  102564:	0a2c0129 	bic	w9, w9, w12
  102568:	1ac821a8 	lsl	w8, w13, w8
  10256c:	2a0003ec 	mov	w12, w0
  102570:	2a080128 	orr	w8, w9, w8
  102574:	52800389 	mov	w9, #0x1c                  	// #28
  102578:	72a7e409 	movk	w9, #0x3f20, lsl #16
  10257c:	d345fd8c 	lsr	x12, x12, #5
  102580:	1ac021ad 	lsl	w13, w13, w0
  102584:	b82a6968 	str	w8, [x11, x10]
  102588:	b829698d 	str	w13, [x12, x9]
  10258c:	d65f03c0 	ret

0000000000102590 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE>:
  102590:	d10143ff 	sub	sp, sp, #0x50
  102594:	2a0103e9 	mov	w9, w1
  102598:	71009c3f 	cmp	w1, #0x27
  10259c:	54000848 	b.hi	1026a4 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE+0x114>  // b.pmore
  1025a0:	3869680a 	ldrb	w10, [x0, x9]
  1025a4:	3400012a 	cbz	w10, 1025c8 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE+0x38>
  1025a8:	d00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  1025ac:	5280038a 	mov	w10, #0x1c                  	// #28
  1025b0:	9106bd29 	add	x9, x9, #0x1af
  1025b4:	5280002c 	mov	w12, #0x1                   	// #1
  1025b8:	a900a909 	stp	x9, x10, [x8, #8]
  1025bc:	f900010c 	str	x12, [x8]
  1025c0:	910143ff 	add	sp, sp, #0x50
  1025c4:	d65f03c0 	ret
  1025c8:	529999ac 	mov	w12, #0xcccd                	// #52429
  1025cc:	12001c2b 	and	w11, w1, #0xff
  1025d0:	72b9998c 	movk	w12, #0xcccc, lsl #16
  1025d4:	5280002a 	mov	w10, #0x1                   	// #1
  1025d8:	9bac7d6b 	umull	x11, w11, w12
  1025dc:	3829680a 	strb	w10, [x0, x9]
  1025e0:	d363fd6c 	lsr	x12, x11, #35
  1025e4:	7100159f 	cmp	w12, #0x5
  1025e8:	b9000fe1 	str	w1, [sp, #12]
  1025ec:	54000688 	b.hi	1026bc <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE+0x12c>  // b.pmore
  1025f0:	52800149 	mov	w9, #0xa                   	// #10
  1025f4:	d00000cd 	adrp	x13, 11c000 <TestKernelAarch64+0xc000>
  1025f8:	9105e1ad 	add	x13, x13, #0x178
  1025fc:	5280008a 	mov	w10, #0x4                   	// #4
  102600:	1b098589 	msub	w9, w12, w9, w1
  102604:	72a7e40a 	movk	w10, #0x3f20, lsl #16
  102608:	52a7e40b 	mov	w11, #0x3f200000            	// #1059061760
  10260c:	100000ce 	adr	x14, 102624 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE+0x94>
  102610:	386c69af 	ldrb	w15, [x13, x12]
  102614:	8b0f09ce 	add	x14, x14, x15, lsl #2
  102618:	0b090529 	add	w9, w9, w9, lsl #1
  10261c:	12001d29 	and	w9, w9, #0xff
  102620:	d61f01c0 	br	x14
  102624:	aa0a03eb 	mov	x11, x10
  102628:	14000008 	b	102648 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE+0xb8>
  10262c:	9100314b 	add	x11, x10, #0xc
  102630:	14000006 	b	102648 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE+0xb8>
  102634:	9100114b 	add	x11, x10, #0x4
  102638:	14000004 	b	102648 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE+0xb8>
  10263c:	9100214b 	add	x11, x10, #0x8
  102640:	14000002 	b	102648 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE+0xb8>
  102644:	9100414b 	add	x11, x10, #0x10
  102648:	9100614d 	add	x13, x10, #0x18
  10264c:	9100714e 	add	x14, x10, #0x1c
  102650:	7100803f 	cmp	w1, #0x20
  102654:	9100914f 	add	x15, x10, #0x24
  102658:	9100a150 	add	x16, x10, #0x28
  10265c:	9a8e31ad 	csel	x13, x13, x14, cc  // cc = lo, ul, last
  102660:	9a9031ee 	csel	x14, x15, x16, cc  // cc = lo, ul, last
  102664:	9102514f 	add	x15, x10, #0x94
  102668:	9102614a 	add	x10, x10, #0x98
  10266c:	aa1f03ec 	mov	x12, xzr
  102670:	9a8a31ea 	csel	x10, x15, x10, cc  // cc = lo, ul, last
  102674:	a900b50b 	stp	x11, x13, [x8, #8]
  102678:	528000eb 	mov	w11, #0x7                   	// #7
  10267c:	5280002d 	mov	w13, #0x1                   	// #1
  102680:	1ac9216b 	lsl	w11, w11, w9
  102684:	b9003901 	str	w1, [x8, #56]
  102688:	a901a90e 	stp	x14, x10, [x8, #24]
  10268c:	1ac121aa 	lsl	w10, w13, w1
  102690:	2905250b 	stp	w11, w9, [x8, #40]
  102694:	2906290a 	stp	w10, w10, [x8, #48]
  102698:	f900010c 	str	x12, [x8]
  10269c:	910143ff 	add	sp, sp, #0x50
  1026a0:	d65f03c0 	ret
  1026a4:	d00000c0 	adrp	x0, 11c000 <TestKernelAarch64+0xc000>
  1026a8:	52800502 	mov	w2, #0x28                  	// #40
  1026ac:	911f8000 	add	x0, x0, #0x7e0
  1026b0:	aa0903e1 	mov	x1, x9
  1026b4:	94000542 	bl	103bbc <_ZN4core9panicking18panic_bounds_check17h61bb2fd281420b4eE>
  1026b8:	d4200020 	brk	#0x1
  1026bc:	d00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  1026c0:	910033eb 	add	x11, sp, #0xc
  1026c4:	d00000ca 	adrp	x10, 11c000 <TestKernelAarch64+0xc000>
  1026c8:	d00000c1 	adrp	x1, 11c000 <TestKernelAarch64+0xc000>
  1026cc:	52800028 	mov	w8, #0x1                   	// #1
  1026d0:	9120414a 	add	x10, x10, #0x810
  1026d4:	f944f129 	ldr	x9, [x9, #2528]
  1026d8:	91208021 	add	x1, x1, #0x820
  1026dc:	910043e0 	add	x0, sp, #0x10
  1026e0:	a9027fff 	stp	xzr, xzr, [sp, #32]
  1026e4:	a90123ea 	stp	x10, x8, [sp, #16]
  1026e8:	a90427eb 	stp	x11, x9, [sp, #64]
  1026ec:	910103e9 	add	x9, sp, #0x40
  1026f0:	a90323e9 	stp	x9, x8, [sp, #48]
  1026f4:	94000545 	bl	103c08 <_ZN4core9panicking9panic_fmt17heca5e185b37feb0aE>
  1026f8:	d4200020 	brk	#0x1
  1026fc:	00000000 	.inst	0x00000000 ; undefined

0000000000102700 <_ZN12ruspiro_gpio4Gpio8free_pin17hc61071ceda926edfE>:
  102700:	2a0103e8 	mov	w8, w1
  102704:	2a0103e1 	mov	w1, w1
  102708:	71009d1f 	cmp	w8, #0x27
  10270c:	540000a8 	b.hi	102720 <_ZN12ruspiro_gpio4Gpio8free_pin17hc61071ceda926edfE+0x20>  // b.pmore
  102710:	38616808 	ldrb	w8, [x0, x1]
  102714:	34000048 	cbz	w8, 10271c <_ZN12ruspiro_gpio4Gpio8free_pin17hc61071ceda926edfE+0x1c>
  102718:	3821681f 	strb	wzr, [x0, x1]
  10271c:	d65f03c0 	ret
  102720:	d00000c0 	adrp	x0, 11c000 <TestKernelAarch64+0xc000>
  102724:	52800502 	mov	w2, #0x28                  	// #40
  102728:	911fe000 	add	x0, x0, #0x7f8
  10272c:	94000524 	bl	103bbc <_ZN4core9panicking18panic_bounds_check17h61bb2fd281420b4eE>
  102730:	d4200020 	brk	#0x1
  102734:	00000000 	.inst	0x00000000 ; undefined

0000000000102738 <rust_oom>:
  102738:	14000000 	b	102738 <rust_oom>
  10273c:	00000000 	.inst	0x00000000 ; undefined

0000000000102740 <__rg_alloc>:
  102740:	a9be53f5 	stp	x21, x20, [sp, #-32]!
  102744:	d00000d5 	adrp	x21, 11c000 <TestKernelAarch64+0xc000>
  102748:	a9017bf3 	stp	x19, x30, [sp, #16]
  10274c:	aa0003f4 	mov	x20, x0
  102750:	aa0103f3 	mov	x19, x1
  102754:	f944f6b5 	ldr	x21, [x21, #2536]
  102758:	aa1503e0 	mov	x0, x21
  10275c:	940002af 	bl	103218 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E>
  102760:	12003e61 	and	w1, w19, #0xffff
  102764:	2a1403e0 	mov	w0, w20
  102768:	940000be 	bl	102a60 <m_alloca>
  10276c:	aa0003f3 	mov	x19, x0
  102770:	aa1503e0 	mov	x0, x21
  102774:	940002b7 	bl	103250 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hcb55c707bd8b2049E>
  102778:	aa1303e0 	mov	x0, x19
  10277c:	a9417bf3 	ldp	x19, x30, [sp, #16]
  102780:	a8c253f5 	ldp	x21, x20, [sp], #32
  102784:	d65f03c0 	ret

0000000000102788 <__rg_dealloc>:
  102788:	f81e0ff4 	str	x20, [sp, #-32]!
  10278c:	d00000d4 	adrp	x20, 11c000 <TestKernelAarch64+0xc000>
  102790:	a9017bf3 	stp	x19, x30, [sp, #16]
  102794:	aa0003f3 	mov	x19, x0
  102798:	f944f694 	ldr	x20, [x20, #2536]
  10279c:	aa1403e0 	mov	x0, x20
  1027a0:	9400029e 	bl	103218 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E>
  1027a4:	aa1303e0 	mov	x0, x19
  1027a8:	94000116 	bl	102c00 <m_freea>
  1027ac:	a9417bf3 	ldp	x19, x30, [sp, #16]
  1027b0:	aa1403e0 	mov	x0, x20
  1027b4:	f84207f4 	ldr	x20, [sp], #32
  1027b8:	140002a6 	b	103250 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hcb55c707bd8b2049E>
  1027bc:	00000000 	.inst	0x00000000 ; undefined

00000000001027c0 <__rg_realloc>:
  1027c0:	a9bd5bf7 	stp	x23, x22, [sp, #-48]!
  1027c4:	d00000d7 	adrp	x23, 11c000 <TestKernelAarch64+0xc000>
  1027c8:	a90153f5 	stp	x21, x20, [sp, #16]
  1027cc:	a9027bf3 	stp	x19, x30, [sp, #32]
  1027d0:	aa0003f3 	mov	x19, x0
  1027d4:	aa0303f5 	mov	x21, x3
  1027d8:	aa0203f4 	mov	x20, x2
  1027dc:	f944f6f7 	ldr	x23, [x23, #2536]
  1027e0:	aa0103f6 	mov	x22, x1
  1027e4:	aa1703e0 	mov	x0, x23
  1027e8:	9400028c 	bl	103218 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E>
  1027ec:	12003e81 	and	w1, w20, #0xffff
  1027f0:	2a1503e0 	mov	w0, w21
  1027f4:	9400009b 	bl	102a60 <m_alloca>
  1027f8:	aa0003f4 	mov	x20, x0
  1027fc:	aa1703e0 	mov	x0, x23
  102800:	94000294 	bl	103250 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hcb55c707bd8b2049E>
  102804:	b40001d4 	cbz	x20, 10283c <__rg_realloc+0x7c>
  102808:	eb1502df 	cmp	x22, x21
  10280c:	aa1403e0 	mov	x0, x20
  102810:	9a9682a2 	csel	x2, x21, x22, hi  // hi = pmore
  102814:	aa1303e1 	mov	x1, x19
  102818:	94000504 	bl	103c28 <memcpy>
  10281c:	d00000d5 	adrp	x21, 11c000 <TestKernelAarch64+0xc000>
  102820:	f944f6b5 	ldr	x21, [x21, #2536]
  102824:	aa1503e0 	mov	x0, x21
  102828:	9400027c 	bl	103218 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E>
  10282c:	aa1303e0 	mov	x0, x19
  102830:	940000f4 	bl	102c00 <m_freea>
  102834:	aa1503e0 	mov	x0, x21
  102838:	94000286 	bl	103250 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hcb55c707bd8b2049E>
  10283c:	aa1403e0 	mov	x0, x20
  102840:	a9427bf3 	ldp	x19, x30, [sp, #32]
  102844:	a94153f5 	ldp	x21, x20, [sp, #16]
  102848:	a8c35bf7 	ldp	x23, x22, [sp], #48
  10284c:	d65f03c0 	ret

0000000000102850 <m_alloc>:
  102850:	f00000e8 	adrp	x8, 121000 <_ZN12ruspiro_gpio4GPIO17h050453a1c37b81f4E>
  102854:	f9406503 	ldr	x3, [x8, #200]
  102858:	b4000743 	cbz	x3, 102940 <m_alloc+0xf0>
  10285c:	f00000e1 	adrp	x1, 121000 <_ZN12ruspiro_gpio4GPIO17h050453a1c37b81f4E>
  102860:	f9406024 	ldr	x4, [x1, #192]
  102864:	2a0003e1 	mov	w1, w0
  102868:	9100fc21 	add	x1, x1, #0x3f
  10286c:	927be821 	and	x1, x1, #0xffffffffffffffe0
  102870:	f101003f 	cmp	x1, #0x40
  102874:	54000809 	b.ls	102974 <m_alloc+0x124>  // b.plast
  102878:	f104003f 	cmp	x1, #0x100
  10287c:	54000a29 	b.ls	1029c0 <m_alloc+0x170>  // b.plast
  102880:	f110003f 	cmp	x1, #0x400
  102884:	54000a69 	b.ls	1029d0 <m_alloc+0x180>  // b.plast
  102888:	f140043f 	cmp	x1, #0x1, lsl #12
  10288c:	54000aa9 	b.ls	1029e0 <m_alloc+0x190>  // b.plast
  102890:	f140103f 	cmp	x1, #0x4, lsl #12
  102894:	54000ae9 	b.ls	1029f0 <m_alloc+0x1a0>  // b.plast
  102898:	f140403f 	cmp	x1, #0x10, lsl #12
  10289c:	540008a9 	b.ls	1029b0 <m_alloc+0x160>  // b.plast
  1028a0:	f141003f 	cmp	x1, #0x40, lsl #12
  1028a4:	54000ae9 	b.ls	102a00 <m_alloc+0x1b0>  // b.plast
  1028a8:	f144003f 	cmp	x1, #0x100, lsl #12
  1028ac:	54000b29 	b.ls	102a10 <m_alloc+0x1c0>  // b.plast
  1028b0:	f150003f 	cmp	x1, #0x400, lsl #12
  1028b4:	54000b69 	b.ls	102a20 <m_alloc+0x1d0>  // b.plast
  1028b8:	f160003f 	cmp	x1, #0x800, lsl #12
  1028bc:	54000ba9 	b.ls	102a30 <m_alloc+0x1e0>  // b.plast
  1028c0:	d2a02005 	mov	x5, #0x1000000             	// #16777216
  1028c4:	eb05003f 	cmp	x1, x5
  1028c8:	54000bc9 	b.ls	102a40 <m_alloc+0x1f0>  // b.plast
  1028cc:	d2a08002 	mov	x2, #0x4000000             	// #67108864
  1028d0:	d2a20005 	mov	x5, #0x10000000            	// #268435456
  1028d4:	eb02003f 	cmp	x1, x2
  1028d8:	2a0503e9 	mov	w9, w5
  1028dc:	52800181 	mov	w1, #0xc                   	// #12
  1028e0:	54000b69 	b.ls	102a4c <m_alloc+0x1fc>  // b.plast
  1028e4:	f00000e7 	adrp	x7, 121000 <_ZN12ruspiro_gpio4GPIO17h050453a1c37b81f4E>
  1028e8:	f94068e2 	ldr	x2, [x7, #208]
  1028ec:	8b0200a2 	add	x2, x5, x2
  1028f0:	eb04005f 	cmp	x2, x4
  1028f4:	54000508 	b.hi	102994 <m_alloc+0x144>  // b.pmore
  1028f8:	2a0103e4 	mov	w4, w1
  1028fc:	f00000e6 	adrp	x6, 121000 <_ZN12ruspiro_gpio4GPIO17h050453a1c37b81f4E>
  102900:	910140c6 	add	x6, x6, #0x50
  102904:	f86478c1 	ldr	x1, [x6, x4, lsl #3]
  102908:	b40004c1 	cbz	x1, 1029a0 <m_alloc+0x150>
  10290c:	f9400823 	ldr	x3, [x1, #16]
  102910:	f82478c3 	str	x3, [x6, x4, lsl #3]
  102914:	b4000043 	cbz	x3, 10291c <m_alloc+0xcc>
  102918:	f9000c7f 	str	xzr, [x3, #24]
  10291c:	f90068e2 	str	x2, [x7, #208]
  102920:	91008022 	add	x2, x1, #0x20
  102924:	5297dde3 	mov	w3, #0xbeef                	// #48879
  102928:	72bbd5a3 	movk	w3, #0xdead, lsl #16
  10292c:	29000023 	stp	w3, w0, [x1]
  102930:	aa0203e0 	mov	x0, x2
  102934:	b9000829 	str	w9, [x1, #8]
  102938:	a9017c3f 	stp	xzr, xzr, [x1, #16]
  10293c:	d65f03c0 	ret
  102940:	d00000c3 	adrp	x3, 11c000 <TestKernelAarch64+0xc000>
  102944:	d00000c4 	adrp	x4, 11c000 <TestKernelAarch64+0xc000>
  102948:	f00000e1 	adrp	x1, 121000 <_ZN12ruspiro_gpio4GPIO17h050453a1c37b81f4E>
  10294c:	f9450463 	ldr	x3, [x3, #2568]
  102950:	f9006503 	str	x3, [x8, #200]
  102954:	f9450084 	ldr	x4, [x4, #2560]
  102958:	cb030484 	sub	x4, x4, x3, lsl #1
  10295c:	f9006024 	str	x4, [x1, #192]
  102960:	2a0003e1 	mov	w1, w0
  102964:	9100fc21 	add	x1, x1, #0x3f
  102968:	927be821 	and	x1, x1, #0xffffffffffffffe0
  10296c:	f101003f 	cmp	x1, #0x40
  102970:	54fff848 	b.hi	102878 <m_alloc+0x28>  // b.pmore
  102974:	f00000e7 	adrp	x7, 121000 <_ZN12ruspiro_gpio4GPIO17h050453a1c37b81f4E>
  102978:	f94068e2 	ldr	x2, [x7, #208]
  10297c:	d2800805 	mov	x5, #0x40                  	// #64
  102980:	52800001 	mov	w1, #0x0                   	// #0
  102984:	2a0503e9 	mov	w9, w5
  102988:	8b0200a2 	add	x2, x5, x2
  10298c:	eb04005f 	cmp	x2, x4
  102990:	54fffb49 	b.ls	1028f8 <m_alloc+0xa8>  // b.plast
  102994:	d2800002 	mov	x2, #0x0                   	// #0
  102998:	aa0203e0 	mov	x0, x2
  10299c:	d65f03c0 	ret
  1029a0:	8b0300a5 	add	x5, x5, x3
  1029a4:	aa0303e1 	mov	x1, x3
  1029a8:	f9006505 	str	x5, [x8, #200]
  1029ac:	17ffffdc 	b	10291c <m_alloc+0xcc>
  1029b0:	d2a00025 	mov	x5, #0x10000               	// #65536
  1029b4:	528000a1 	mov	w1, #0x5                   	// #5
  1029b8:	2a0503e9 	mov	w9, w5
  1029bc:	17ffffca 	b	1028e4 <m_alloc+0x94>
  1029c0:	d2802005 	mov	x5, #0x100                 	// #256
  1029c4:	52800021 	mov	w1, #0x1                   	// #1
  1029c8:	2a0503e9 	mov	w9, w5
  1029cc:	17ffffc6 	b	1028e4 <m_alloc+0x94>
  1029d0:	d2808005 	mov	x5, #0x400                 	// #1024
  1029d4:	52800041 	mov	w1, #0x2                   	// #2
  1029d8:	2a0503e9 	mov	w9, w5
  1029dc:	17ffffc2 	b	1028e4 <m_alloc+0x94>
  1029e0:	d2820005 	mov	x5, #0x1000                	// #4096
  1029e4:	52800061 	mov	w1, #0x3                   	// #3
  1029e8:	2a0503e9 	mov	w9, w5
  1029ec:	17ffffbe 	b	1028e4 <m_alloc+0x94>
  1029f0:	d2880005 	mov	x5, #0x4000                	// #16384
  1029f4:	52800081 	mov	w1, #0x4                   	// #4
  1029f8:	2a0503e9 	mov	w9, w5
  1029fc:	17ffffba 	b	1028e4 <m_alloc+0x94>
  102a00:	d2a00085 	mov	x5, #0x40000               	// #262144
  102a04:	528000c1 	mov	w1, #0x6                   	// #6
  102a08:	2a0503e9 	mov	w9, w5
  102a0c:	17ffffb6 	b	1028e4 <m_alloc+0x94>
  102a10:	d2a00205 	mov	x5, #0x100000              	// #1048576
  102a14:	528000e1 	mov	w1, #0x7                   	// #7
  102a18:	2a0503e9 	mov	w9, w5
  102a1c:	17ffffb2 	b	1028e4 <m_alloc+0x94>
  102a20:	d2a00805 	mov	x5, #0x400000              	// #4194304
  102a24:	52800101 	mov	w1, #0x8                   	// #8
  102a28:	2a0503e9 	mov	w9, w5
  102a2c:	17ffffae 	b	1028e4 <m_alloc+0x94>
  102a30:	d2a01005 	mov	x5, #0x800000              	// #8388608
  102a34:	52800121 	mov	w1, #0x9                   	// #9
  102a38:	2a0503e9 	mov	w9, w5
  102a3c:	17ffffaa 	b	1028e4 <m_alloc+0x94>
  102a40:	52800141 	mov	w1, #0xa                   	// #10
  102a44:	2a0503e9 	mov	w9, w5
  102a48:	17ffffa7 	b	1028e4 <m_alloc+0x94>
  102a4c:	aa0203e5 	mov	x5, x2
  102a50:	52800161 	mov	w1, #0xb                   	// #11
  102a54:	2a0203e9 	mov	w9, w2
  102a58:	17ffffa3 	b	1028e4 <m_alloc+0x94>
  102a5c:	00000000 	.inst	0x00000000 ; undefined

0000000000102a60 <m_alloca>:
  102a60:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  102a64:	910003fd 	mov	x29, sp
  102a68:	a90153f3 	stp	x19, x20, [sp, #16]
  102a6c:	52800034 	mov	w20, #0x1                   	// #1
  102a70:	1ac12294 	lsl	w20, w20, w1
  102a74:	11001e93 	add	w19, w20, #0x7
  102a78:	0b000260 	add	w0, w19, w0
  102a7c:	97ffff75 	bl	102850 <m_alloc>
  102a80:	b4000120 	cbz	x0, 102aa4 <m_alloca+0x44>
  102a84:	8b334013 	add	x19, x0, w19, uxtw
  102a88:	4b1403f4 	neg	w20, w20
  102a8c:	8a140273 	and	x19, x19, x20
  102a90:	f81f8260 	stur	x0, [x19, #-8]
  102a94:	aa1303e0 	mov	x0, x19
  102a98:	a94153f3 	ldp	x19, x20, [sp, #16]
  102a9c:	a8c27bfd 	ldp	x29, x30, [sp], #32
  102aa0:	d65f03c0 	ret
  102aa4:	d2800013 	mov	x19, #0x0                   	// #0
  102aa8:	17fffffb 	b	102a94 <m_alloca+0x34>
  102aac:	00000000 	.inst	0x00000000 ; undefined

0000000000102ab0 <m_free>:
  102ab0:	b40000e0 	cbz	x0, 102acc <m_free+0x1c>
  102ab4:	b85e0002 	ldur	w2, [x0, #-32]
  102ab8:	5297dde1 	mov	w1, #0xbeef                	// #48879
  102abc:	72bbd5a1 	movk	w1, #0xdead, lsl #16
  102ac0:	d1008003 	sub	x3, x0, #0x20
  102ac4:	6b01005f 	cmp	w2, w1
  102ac8:	54000040 	b.eq	102ad0 <m_free+0x20>  // b.none
  102acc:	d65f03c0 	ret
  102ad0:	b85e8001 	ldur	w1, [x0, #-24]
  102ad4:	f00000e2 	adrp	x2, 121000 <_ZN12ruspiro_gpio4GPIO17h050453a1c37b81f4E>
  102ad8:	f9406445 	ldr	x5, [x2, #200]
  102adc:	2a0103e4 	mov	w4, w1
  102ae0:	8b040066 	add	x6, x3, x4
  102ae4:	eb0500df 	cmp	x6, x5
  102ae8:	54000520 	b.eq	102b8c <m_free+0xdc>  // b.none
  102aec:	7101003f 	cmp	w1, #0x40
  102af0:	540005a9 	b.ls	102ba4 <m_free+0xf4>  // b.plast
  102af4:	7104003f 	cmp	w1, #0x100
  102af8:	540005a9 	b.ls	102bac <m_free+0xfc>  // b.plast
  102afc:	7110003f 	cmp	w1, #0x400
  102b00:	540005a9 	b.ls	102bb4 <m_free+0x104>  // b.plast
  102b04:	7140043f 	cmp	w1, #0x1, lsl #12
  102b08:	540005a9 	b.ls	102bbc <m_free+0x10c>  // b.plast
  102b0c:	7140103f 	cmp	w1, #0x4, lsl #12
  102b10:	540005a9 	b.ls	102bc4 <m_free+0x114>  // b.plast
  102b14:	7140403f 	cmp	w1, #0x10, lsl #12
  102b18:	540005a9 	b.ls	102bcc <m_free+0x11c>  // b.plast
  102b1c:	7141003f 	cmp	w1, #0x40, lsl #12
  102b20:	540005a9 	b.ls	102bd4 <m_free+0x124>  // b.plast
  102b24:	7144003f 	cmp	w1, #0x100, lsl #12
  102b28:	540005a9 	b.ls	102bdc <m_free+0x12c>  // b.plast
  102b2c:	7150003f 	cmp	w1, #0x400, lsl #12
  102b30:	540005a9 	b.ls	102be4 <m_free+0x134>  // b.plast
  102b34:	7160003f 	cmp	w1, #0x800, lsl #12
  102b38:	540005a9 	b.ls	102bec <m_free+0x13c>  // b.plast
  102b3c:	52a02002 	mov	w2, #0x1000000             	// #16777216
  102b40:	6b02003f 	cmp	w1, w2
  102b44:	54000589 	b.ls	102bf4 <m_free+0x144>  // b.plast
  102b48:	52a08002 	mov	w2, #0x4000000             	// #67108864
  102b4c:	6b02003f 	cmp	w1, w2
  102b50:	1a9f97e1 	cset	w1, hi  // hi = pmore
  102b54:	11002c21 	add	w1, w1, #0xb
  102b58:	93407c21 	sxtw	x1, w1
  102b5c:	f00000e2 	adrp	x2, 121000 <_ZN12ruspiro_gpio4GPIO17h050453a1c37b81f4E>
  102b60:	91014042 	add	x2, x2, #0x50
  102b64:	f8617845 	ldr	x5, [x2, x1, lsl #3]
  102b68:	b4000185 	cbz	x5, 102b98 <m_free+0xe8>
  102b6c:	f9000ca3 	str	x3, [x5, #24]
  102b70:	a93f7c05 	stp	x5, xzr, [x0, #-16]
  102b74:	f8217843 	str	x3, [x2, x1, lsl #3]
  102b78:	f00000e1 	adrp	x1, 121000 <_ZN12ruspiro_gpio4GPIO17h050453a1c37b81f4E>
  102b7c:	f9406820 	ldr	x0, [x1, #208]
  102b80:	cb040000 	sub	x0, x0, x4
  102b84:	f9006820 	str	x0, [x1, #208]
  102b88:	d65f03c0 	ret
  102b8c:	f9006443 	str	x3, [x2, #200]
  102b90:	b81e001f 	stur	wzr, [x0, #-32]
  102b94:	17fffff9 	b	102b78 <m_free+0xc8>
  102b98:	a93f7c1f 	stp	xzr, xzr, [x0, #-16]
  102b9c:	f8217843 	str	x3, [x2, x1, lsl #3]
  102ba0:	17fffff6 	b	102b78 <m_free+0xc8>
  102ba4:	52800001 	mov	w1, #0x0                   	// #0
  102ba8:	17ffffec 	b	102b58 <m_free+0xa8>
  102bac:	52800021 	mov	w1, #0x1                   	// #1
  102bb0:	17ffffea 	b	102b58 <m_free+0xa8>
  102bb4:	52800041 	mov	w1, #0x2                   	// #2
  102bb8:	17ffffe8 	b	102b58 <m_free+0xa8>
  102bbc:	52800061 	mov	w1, #0x3                   	// #3
  102bc0:	17ffffe6 	b	102b58 <m_free+0xa8>
  102bc4:	52800081 	mov	w1, #0x4                   	// #4
  102bc8:	17ffffe4 	b	102b58 <m_free+0xa8>
  102bcc:	528000a1 	mov	w1, #0x5                   	// #5
  102bd0:	17ffffe2 	b	102b58 <m_free+0xa8>
  102bd4:	528000c1 	mov	w1, #0x6                   	// #6
  102bd8:	17ffffe0 	b	102b58 <m_free+0xa8>
  102bdc:	528000e1 	mov	w1, #0x7                   	// #7
  102be0:	17ffffde 	b	102b58 <m_free+0xa8>
  102be4:	52800101 	mov	w1, #0x8                   	// #8
  102be8:	17ffffdc 	b	102b58 <m_free+0xa8>
  102bec:	52800121 	mov	w1, #0x9                   	// #9
  102bf0:	17ffffda 	b	102b58 <m_free+0xa8>
  102bf4:	52800141 	mov	w1, #0xa                   	// #10
  102bf8:	17ffffd8 	b	102b58 <m_free+0xa8>
  102bfc:	00000000 	.inst	0x00000000 ; undefined

0000000000102c00 <m_freea>:
  102c00:	f85f8000 	ldur	x0, [x0, #-8]
  102c04:	17ffffab 	b	102ab0 <m_free>

0000000000102c08 <_ZN13ruspiro_timer5sleep17h279cbcdbb8f764c0E>:
  102c08:	d00000c8 	adrp	x8, 11c000 <TestKernelAarch64+0xc000>
  102c0c:	d00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  102c10:	f9410d08 	ldr	x8, [x8, #536]
  102c14:	f9411129 	ldr	x9, [x9, #544]
  102c18:	b940010a 	ldr	w10, [x8]
  102c1c:	b940012b 	ldr	w11, [x9]
  102c20:	b3607d6a 	bfi	x10, x11, #32, #32
  102c24:	ab00014a 	adds	x10, x10, x0
  102c28:	540000c0 	b.eq	102c40 <_ZN13ruspiro_timer5sleep17h279cbcdbb8f764c0E+0x38>  // b.none
  102c2c:	b940010b 	ldr	w11, [x8]
  102c30:	b940012c 	ldr	w12, [x9]
  102c34:	b3607d8b 	bfi	x11, x12, #32, #32
  102c38:	eb0a017f 	cmp	x11, x10
  102c3c:	54ffff83 	b.cc	102c2c <_ZN13ruspiro_timer5sleep17h279cbcdbb8f764c0E+0x24>  // b.lo, b.ul, b.last
  102c40:	d65f03c0 	ret
  102c44:	00000000 	.inst	0x00000000 ; undefined

0000000000102c48 <_ZN13ruspiro_timer11sleepcycles17hcaf8521ef438039dE>:
  102c48:	34000080 	cbz	w0, 102c58 <_ZN13ruspiro_timer11sleepcycles17hcaf8521ef438039dE+0x10>
  102c4c:	71000400 	subs	w0, w0, #0x1
  102c50:	d503201f 	nop
  102c54:	54ffffc1 	b.ne	102c4c <_ZN13ruspiro_timer11sleepcycles17hcaf8521ef438039dE+0x4>  // b.any
  102c58:	d65f03c0 	ret
  102c5c:	00000000 	.inst	0x00000000 ; undefined

0000000000102c60 <_ZN17ruspiro_interrupt16InterruptManager10initialize17hd6db96f165282328E>:
  102c60:	d00000c8 	adrp	x8, 11c000 <TestKernelAarch64+0xc000>
  102c64:	d00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  102c68:	d00000ca 	adrp	x10, 11c000 <TestKernelAarch64+0xc000>
  102c6c:	d00000cb 	adrp	x11, 11c000 <TestKernelAarch64+0xc000>
  102c70:	1280000c 	mov	w12, #0xffffffff            	// #-1
  102c74:	f9413508 	ldr	x8, [x8, #616]
  102c78:	f9413929 	ldr	x9, [x9, #624]
  102c7c:	f9413d4a 	ldr	x10, [x10, #632]
  102c80:	f941416b 	ldr	x11, [x11, #640]
  102c84:	b900010c 	str	w12, [x8]
  102c88:	d00000c8 	adrp	x8, 11c000 <TestKernelAarch64+0xc000>
  102c8c:	b900012c 	str	w12, [x9]
  102c90:	d00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  102c94:	b900014c 	str	w12, [x10]
  102c98:	d5033fbf 	dmb	sy
  102c9c:	b900017f 	str	wzr, [x11]
  102ca0:	d00000ca 	adrp	x10, 11c000 <TestKernelAarch64+0xc000>
  102ca4:	d00000cb 	adrp	x11, 11c000 <TestKernelAarch64+0xc000>
  102ca8:	f9414508 	ldr	x8, [x8, #648]
  102cac:	f9414929 	ldr	x9, [x9, #656]
  102cb0:	5280010c 	mov	w12, #0x8                   	// #8
  102cb4:	f9414d4a 	ldr	x10, [x10, #664]
  102cb8:	f941516b 	ldr	x11, [x11, #672]
  102cbc:	b900010c 	str	w12, [x8]
  102cc0:	b900012c 	str	w12, [x9]
  102cc4:	b900014c 	str	w12, [x10]
  102cc8:	b900016c 	str	w12, [x11]
  102ccc:	d65f03c0 	ret

0000000000102cd0 <_ZN17ruspiro_interrupt16InterruptManager8activate17h9ee44817054f03e5E>:
  102cd0:	2a0103e8 	mov	w8, w1
  102cd4:	53051c21 	ubfx	w1, w1, #5, #3
  102cd8:	71000c3f 	cmp	w1, #0x3
  102cdc:	54000320 	b.eq	102d40 <_ZN17ruspiro_interrupt16InterruptManager8activate17h9ee44817054f03e5E+0x70>  // b.none
  102ce0:	d37ef429 	lsl	x9, x1, #2
  102ce4:	12001d08 	and	w8, w8, #0xff
  102ce8:	5280002b 	mov	w11, #0x1                   	// #1
  102cec:	b869680a 	ldr	w10, [x0, x9]
  102cf0:	1ac82168 	lsl	w8, w11, w8
  102cf4:	2a08014a 	orr	w10, w10, w8
  102cf8:	b829680a 	str	w10, [x0, x9]
  102cfc:	34000161 	cbz	w1, 102d28 <_ZN17ruspiro_interrupt16InterruptManager8activate17h9ee44817054f03e5E+0x58>
  102d00:	7100083f 	cmp	w1, #0x2
  102d04:	540000c0 	b.eq	102d1c <_ZN17ruspiro_interrupt16InterruptManager8activate17h9ee44817054f03e5E+0x4c>  // b.none
  102d08:	7100043f 	cmp	w1, #0x1
  102d0c:	54000161 	b.ne	102d38 <_ZN17ruspiro_interrupt16InterruptManager8activate17h9ee44817054f03e5E+0x68>  // b.any
  102d10:	d00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  102d14:	910ac129 	add	x9, x9, #0x2b0
  102d18:	14000006 	b	102d30 <_ZN17ruspiro_interrupt16InterruptManager8activate17h9ee44817054f03e5E+0x60>
  102d1c:	d00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  102d20:	910aa129 	add	x9, x9, #0x2a8
  102d24:	14000003 	b	102d30 <_ZN17ruspiro_interrupt16InterruptManager8activate17h9ee44817054f03e5E+0x60>
  102d28:	d00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  102d2c:	910ae129 	add	x9, x9, #0x2b8
  102d30:	f9400129 	ldr	x9, [x9]
  102d34:	b9000128 	str	w8, [x9]
  102d38:	d5033fbf 	dmb	sy
  102d3c:	d65f03c0 	ret
  102d40:	d00000c0 	adrp	x0, 11c000 <TestKernelAarch64+0xc000>
  102d44:	52800062 	mov	w2, #0x3                   	// #3
  102d48:	9120e000 	add	x0, x0, #0x838
  102d4c:	9400039c 	bl	103bbc <_ZN4core9panicking18panic_bounds_check17h61bb2fd281420b4eE>
  102d50:	d4200020 	brk	#0x1
  102d54:	00000000 	.inst	0x00000000 ; undefined

0000000000102d58 <__exception_handler_default>:
  102d58:	f1004c1f 	cmp	x0, #0x13
  102d5c:	540000e8 	b.hi	102d78 <__exception_handler_default+0x20>  // b.pmore
  102d60:	52800028 	mov	w8, #0x1                   	// #1
  102d64:	320e87e9 	mov	w9, #0xc000c               	// #786444
  102d68:	9ac02108 	lsl	x8, x8, x0
  102d6c:	ea09011f 	tst	x8, x9
  102d70:	54000040 	b.eq	102d78 <__exception_handler_default+0x20>  // b.none
  102d74:	14000003 	b	102d80 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E>
  102d78:	d65f03c0 	ret
  102d7c:	00000000 	.inst	0x00000000 ; undefined

0000000000102d80 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E>:
  102d80:	a9bd5bf7 	stp	x23, x22, [sp, #-48]!
  102d84:	a90153f5 	stp	x21, x20, [sp, #16]
  102d88:	a9027bf3 	stp	x19, x30, [sp, #32]
  102d8c:	94000133 	bl	103258 <_ZN22ruspiro_interrupt_core26entering_interrupt_handler17hce8bb23066ca077bE>
  102d90:	d00000c8 	adrp	x8, 11c000 <TestKernelAarch64+0xc000>
  102d94:	d00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  102d98:	d00000ca 	adrp	x10, 11c000 <TestKernelAarch64+0xc000>
  102d9c:	d00000cb 	adrp	x11, 11c000 <TestKernelAarch64+0xc000>
  102da0:	f9416108 	ldr	x8, [x8, #704]
  102da4:	f9416529 	ldr	x9, [x9, #712]
  102da8:	f941694a 	ldr	x10, [x10, #720]
  102dac:	f944ed6b 	ldr	x11, [x11, #2520]
  102db0:	b9400108 	ldr	w8, [x8]
  102db4:	b9400129 	ldr	w9, [x9]
  102db8:	b9400154 	ldr	w20, [x10]
  102dbc:	2942316a 	ldp	w10, w12, [x11, #16]
  102dc0:	b9401975 	ldr	w21, [x11, #24]
  102dc4:	6a080156 	ands	w22, w10, w8
  102dc8:	0a090193 	and	w19, w12, w9
  102dcc:	540005e0 	b.eq	102e88 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x108>  // b.none
  102dd0:	37080256 	tbnz	w22, #1, 102e18 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x98>
  102dd4:	37180276 	tbnz	w22, #3, 102e20 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xa0>
  102dd8:	37400296 	tbnz	w22, #8, 102e28 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xa8>
  102ddc:	374802b6 	tbnz	w22, #9, 102e30 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xb0>
  102de0:	376002d6 	tbnz	w22, #12, 102e38 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xb8>
  102de4:	376802f6 	tbnz	w22, #13, 102e40 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xc0>
  102de8:	37700316 	tbnz	w22, #14, 102e48 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xc8>
  102dec:	37780336 	tbnz	w22, #15, 102e50 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xd0>
  102df0:	36e80456 	tbz	w22, #29, 102e78 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xf8>
  102df4:	d00000c8 	adrp	x8, 11c000 <TestKernelAarch64+0xc000>
  102df8:	f9413117 	ldr	x23, [x8, #608]
  102dfc:	b94002e8 	ldr	w8, [x23]
  102e00:	370002e8 	tbnz	w8, #0, 102e5c <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xdc>
  102e04:	b94002e8 	ldr	w8, [x23]
  102e08:	37080308 	tbnz	w8, #1, 102e68 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xe8>
  102e0c:	b94002e8 	ldr	w8, [x23]
  102e10:	37100328 	tbnz	w8, #2, 102e74 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xf4>
  102e14:	14000019 	b	102e78 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xf8>
  102e18:	9400005c 	bl	102f88 <__irq_handler__Arm>
  102e1c:	361ffdf6 	tbz	w22, #3, 102dd8 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x58>
  102e20:	9400005a 	bl	102f88 <__irq_handler__Arm>
  102e24:	3647fdd6 	tbz	w22, #8, 102ddc <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x5c>
  102e28:	94000058 	bl	102f88 <__irq_handler__Arm>
  102e2c:	364ffdb6 	tbz	w22, #9, 102de0 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x60>
  102e30:	94000056 	bl	102f88 <__irq_handler__Arm>
  102e34:	3667fd96 	tbz	w22, #12, 102de4 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x64>
  102e38:	94000054 	bl	102f88 <__irq_handler__Arm>
  102e3c:	366ffd76 	tbz	w22, #13, 102de8 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x68>
  102e40:	94000052 	bl	102f88 <__irq_handler__Arm>
  102e44:	3677fd56 	tbz	w22, #14, 102dec <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x6c>
  102e48:	94000050 	bl	102f88 <__irq_handler__Arm>
  102e4c:	367ffd36 	tbz	w22, #15, 102df0 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x70>
  102e50:	9400004e 	bl	102f88 <__irq_handler__Arm>
  102e54:	37effd16 	tbnz	w22, #29, 102df4 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x74>
  102e58:	14000008 	b	102e78 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xf8>
  102e5c:	97fff6d3 	bl	1009a8 <__irq_handler__Aux_Uart1>
  102e60:	b94002e8 	ldr	w8, [x23]
  102e64:	360ffd48 	tbz	w8, #1, 102e0c <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x8c>
  102e68:	94000048 	bl	102f88 <__irq_handler__Arm>
  102e6c:	b94002e8 	ldr	w8, [x23]
  102e70:	36100048 	tbz	w8, #2, 102e78 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xf8>
  102e74:	94000045 	bl	102f88 <__irq_handler__Arm>
  102e78:	36f00056 	tbz	w22, #30, 102e80 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x100>
  102e7c:	94000043 	bl	102f88 <__irq_handler__Arm>
  102e80:	36f80056 	tbz	w22, #31, 102e88 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x108>
  102e84:	94000041 	bl	102f88 <__irq_handler__Arm>
  102e88:	0a1402b4 	and	w20, w21, w20
  102e8c:	34000173 	cbz	w19, 102eb8 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x138>
  102e90:	37880353 	tbnz	w19, #17, 102ef8 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x178>
  102e94:	37900373 	tbnz	w19, #18, 102f00 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x180>
  102e98:	37980393 	tbnz	w19, #19, 102f08 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x188>
  102e9c:	37a003b3 	tbnz	w19, #20, 102f10 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x190>
  102ea0:	37a803d3 	tbnz	w19, #21, 102f18 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x198>
  102ea4:	37b003f3 	tbnz	w19, #22, 102f20 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1a0>
  102ea8:	37b80413 	tbnz	w19, #23, 102f28 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1a8>
  102eac:	37c00433 	tbnz	w19, #24, 102f30 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1b0>
  102eb0:	36c80053 	tbz	w19, #25, 102eb8 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x138>
  102eb4:	94000035 	bl	102f88 <__irq_handler__Arm>
  102eb8:	34000194 	cbz	w20, 102ee8 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x168>
  102ebc:	37000414 	tbnz	w20, #0, 102f3c <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1bc>
  102ec0:	37080434 	tbnz	w20, #1, 102f44 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1c4>
  102ec4:	37100454 	tbnz	w20, #2, 102f4c <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1cc>
  102ec8:	37180474 	tbnz	w20, #3, 102f54 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1d4>
  102ecc:	37200494 	tbnz	w20, #4, 102f5c <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1dc>
  102ed0:	372804b4 	tbnz	w20, #5, 102f64 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1e4>
  102ed4:	373004d4 	tbnz	w20, #6, 102f6c <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1ec>
  102ed8:	373804f4 	tbnz	w20, #7, 102f74 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1f4>
  102edc:	37400514 	tbnz	w20, #8, 102f7c <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1fc>
  102ee0:	36480054 	tbz	w20, #9, 102ee8 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x168>
  102ee4:	94000029 	bl	102f88 <__irq_handler__Arm>
  102ee8:	a9427bf3 	ldp	x19, x30, [sp, #32]
  102eec:	a94153f5 	ldp	x21, x20, [sp, #16]
  102ef0:	a8c35bf7 	ldp	x23, x22, [sp], #48
  102ef4:	140000df 	b	103270 <_ZN22ruspiro_interrupt_core25leaving_interrupt_handler17hcb261c9670177108E>
  102ef8:	94000024 	bl	102f88 <__irq_handler__Arm>
  102efc:	3697fcf3 	tbz	w19, #18, 102e98 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x118>
  102f00:	94000022 	bl	102f88 <__irq_handler__Arm>
  102f04:	369ffcd3 	tbz	w19, #19, 102e9c <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x11c>
  102f08:	94000020 	bl	102f88 <__irq_handler__Arm>
  102f0c:	36a7fcb3 	tbz	w19, #20, 102ea0 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x120>
  102f10:	9400001e 	bl	102f88 <__irq_handler__Arm>
  102f14:	36affc93 	tbz	w19, #21, 102ea4 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x124>
  102f18:	9400001c 	bl	102f88 <__irq_handler__Arm>
  102f1c:	36b7fc73 	tbz	w19, #22, 102ea8 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x128>
  102f20:	9400001a 	bl	102f88 <__irq_handler__Arm>
  102f24:	36bffc53 	tbz	w19, #23, 102eac <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x12c>
  102f28:	94000018 	bl	102f88 <__irq_handler__Arm>
  102f2c:	36c7fc33 	tbz	w19, #24, 102eb0 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x130>
  102f30:	94000016 	bl	102f88 <__irq_handler__Arm>
  102f34:	37cffc13 	tbnz	w19, #25, 102eb4 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x134>
  102f38:	17ffffe0 	b	102eb8 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x138>
  102f3c:	94000013 	bl	102f88 <__irq_handler__Arm>
  102f40:	360ffc34 	tbz	w20, #1, 102ec4 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x144>
  102f44:	94000011 	bl	102f88 <__irq_handler__Arm>
  102f48:	3617fc14 	tbz	w20, #2, 102ec8 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x148>
  102f4c:	9400000f 	bl	102f88 <__irq_handler__Arm>
  102f50:	361ffbf4 	tbz	w20, #3, 102ecc <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x14c>
  102f54:	9400000d 	bl	102f88 <__irq_handler__Arm>
  102f58:	3627fbd4 	tbz	w20, #4, 102ed0 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x150>
  102f5c:	9400000b 	bl	102f88 <__irq_handler__Arm>
  102f60:	362ffbb4 	tbz	w20, #5, 102ed4 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x154>
  102f64:	94000009 	bl	102f88 <__irq_handler__Arm>
  102f68:	3637fb94 	tbz	w20, #6, 102ed8 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x158>
  102f6c:	94000007 	bl	102f88 <__irq_handler__Arm>
  102f70:	363ffb74 	tbz	w20, #7, 102edc <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x15c>
  102f74:	94000005 	bl	102f88 <__irq_handler__Arm>
  102f78:	3647fb54 	tbz	w20, #8, 102ee0 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x160>
  102f7c:	94000003 	bl	102f88 <__irq_handler__Arm>
  102f80:	374ffb34 	tbnz	w20, #9, 102ee4 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x164>
  102f84:	17ffffd9 	b	102ee8 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x168>

0000000000102f88 <__irq_handler__Arm>:
  102f88:	d65f03c0 	ret
  102f8c:	00000000 	.inst	0x00000000 ; undefined

0000000000102f90 <_ZN16ruspiro_register6system7aarch647tcr_el24T0SZ10with_value17h877a925dccf94987E>:
  102f90:	d00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  102f94:	f9416d29 	ldr	x9, [x9, #728]
  102f98:	d360fd2a 	lsr	x10, x9, #32
  102f9c:	b9000109 	str	w9, [x8]
  102fa0:	2900810a 	stp	w10, w0, [x8, #4]
  102fa4:	d65f03c0 	ret

0000000000102fa8 <_ZN16ruspiro_register6system7aarch649ttbr0_el25baddr10with_value17he00bdda0e676fbddE>:
  102fa8:	d00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  102fac:	3dc0d520 	ldr	q0, [x9, #848]
  102fb0:	3c9f0fe0 	str	q0, [sp, #-16]!
  102fb4:	f94007e9 	ldr	x9, [sp, #8]
  102fb8:	f9000509 	str	x9, [x8, #8]
  102fbc:	f84107e9 	ldr	x9, [sp], #16
  102fc0:	f9000900 	str	x0, [x8, #16]
  102fc4:	f9000109 	str	x9, [x8]
  102fc8:	d65f03c0 	ret
  102fcc:	00000000 	.inst	0x00000000 ; undefined

0000000000102fd0 <_ZN12ruspiro_lock9semaphore9Semaphore2up17h86ca159eb2867e89E>:
  102fd0:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  102fd4:	aa0003f3 	mov	x19, x0
  102fd8:	940000b0 	bl	103298 <_ZN22ruspiro_interrupt_core18disable_interrupts17h4262f3ae0843d19fE>
  102fdc:	52800028 	mov	w8, #0x1                   	// #1
  102fe0:	085f7e69 	ldxrb	w9, [x19]
  102fe4:	34000089 	cbz	w9, 102ff4 <_ZN12ruspiro_lock9semaphore9Semaphore2up17h86ca159eb2867e89E+0x24>
  102fe8:	d5033f5f 	clrex
  102fec:	085f7e69 	ldxrb	w9, [x19]
  102ff0:	35ffffc9 	cbnz	w9, 102fe8 <_ZN12ruspiro_lock9semaphore9Semaphore2up17h86ca159eb2867e89E+0x18>
  102ff4:	08097e68 	stxrb	w9, w8, [x19]
  102ff8:	35ffffa9 	cbnz	w9, 102fec <_ZN12ruspiro_lock9semaphore9Semaphore2up17h86ca159eb2867e89E+0x1c>
  102ffc:	d50339bf 	dmb	ishld
  103000:	b9400668 	ldr	w8, [x19, #4]
  103004:	11000508 	add	w8, w8, #0x1
  103008:	b9000668 	str	w8, [x19, #4]
  10300c:	089ffe7f 	stlrb	wzr, [x19]
  103010:	a8c17bf3 	ldp	x19, x30, [sp], #16
  103014:	140000b3 	b	1032e0 <_ZN22ruspiro_interrupt_core20re_enable_interrupts17hc17f6d544c9e00a8E>

0000000000103018 <_ZN12ruspiro_lock9semaphore9Semaphore4down17h7dd706fc35386af7E>:
  103018:	f81e0ff4 	str	x20, [sp, #-32]!
  10301c:	a9017bf3 	stp	x19, x30, [sp, #16]
  103020:	aa0003f3 	mov	x19, x0
  103024:	52800034 	mov	w20, #0x1                   	// #1
  103028:	9400009c 	bl	103298 <_ZN22ruspiro_interrupt_core18disable_interrupts17h4262f3ae0843d19fE>
  10302c:	085f7e68 	ldxrb	w8, [x19]
  103030:	34000088 	cbz	w8, 103040 <_ZN12ruspiro_lock9semaphore9Semaphore4down17h7dd706fc35386af7E+0x28>
  103034:	d5033f5f 	clrex
  103038:	085f7e68 	ldxrb	w8, [x19]
  10303c:	35ffffc8 	cbnz	w8, 103034 <_ZN12ruspiro_lock9semaphore9Semaphore4down17h7dd706fc35386af7E+0x1c>
  103040:	08087e74 	stxrb	w8, w20, [x19]
  103044:	35ffffa8 	cbnz	w8, 103038 <_ZN12ruspiro_lock9semaphore9Semaphore4down17h7dd706fc35386af7E+0x20>
  103048:	d50339bf 	dmb	ishld
  10304c:	b9400668 	ldr	w8, [x19, #4]
  103050:	35000d68 	cbnz	w8, 1031fc <_ZN12ruspiro_lock9semaphore9Semaphore4down17h7dd706fc35386af7E+0x1e4>
  103054:	089ffe7f 	stlrb	wzr, [x19]
  103058:	940000a2 	bl	1032e0 <_ZN22ruspiro_interrupt_core20re_enable_interrupts17hc17f6d544c9e00a8E>
  10305c:	d503201f 	nop
  103060:	d503201f 	nop
  103064:	d503201f 	nop
  103068:	d503201f 	nop
  10306c:	d503201f 	nop
  103070:	d503201f 	nop
  103074:	d503201f 	nop
  103078:	d503201f 	nop
  10307c:	d503201f 	nop
  103080:	d503201f 	nop
  103084:	d503201f 	nop
  103088:	d503201f 	nop
  10308c:	d503201f 	nop
  103090:	d503201f 	nop
  103094:	d503201f 	nop
  103098:	d503201f 	nop
  10309c:	d503201f 	nop
  1030a0:	d503201f 	nop
  1030a4:	d503201f 	nop
  1030a8:	d503201f 	nop
  1030ac:	d503201f 	nop
  1030b0:	d503201f 	nop
  1030b4:	d503201f 	nop
  1030b8:	d503201f 	nop
  1030bc:	d503201f 	nop
  1030c0:	d503201f 	nop
  1030c4:	d503201f 	nop
  1030c8:	d503201f 	nop
  1030cc:	d503201f 	nop
  1030d0:	d503201f 	nop
  1030d4:	d503201f 	nop
  1030d8:	d503201f 	nop
  1030dc:	d503201f 	nop
  1030e0:	d503201f 	nop
  1030e4:	d503201f 	nop
  1030e8:	d503201f 	nop
  1030ec:	d503201f 	nop
  1030f0:	d503201f 	nop
  1030f4:	d503201f 	nop
  1030f8:	d503201f 	nop
  1030fc:	d503201f 	nop
  103100:	d503201f 	nop
  103104:	d503201f 	nop
  103108:	d503201f 	nop
  10310c:	d503201f 	nop
  103110:	d503201f 	nop
  103114:	d503201f 	nop
  103118:	d503201f 	nop
  10311c:	d503201f 	nop
  103120:	d503201f 	nop
  103124:	d503201f 	nop
  103128:	d503201f 	nop
  10312c:	d503201f 	nop
  103130:	d503201f 	nop
  103134:	d503201f 	nop
  103138:	d503201f 	nop
  10313c:	d503201f 	nop
  103140:	d503201f 	nop
  103144:	d503201f 	nop
  103148:	d503201f 	nop
  10314c:	d503201f 	nop
  103150:	d503201f 	nop
  103154:	d503201f 	nop
  103158:	d503201f 	nop
  10315c:	d503201f 	nop
  103160:	d503201f 	nop
  103164:	d503201f 	nop
  103168:	d503201f 	nop
  10316c:	d503201f 	nop
  103170:	d503201f 	nop
  103174:	d503201f 	nop
  103178:	d503201f 	nop
  10317c:	d503201f 	nop
  103180:	d503201f 	nop
  103184:	d503201f 	nop
  103188:	d503201f 	nop
  10318c:	d503201f 	nop
  103190:	d503201f 	nop
  103194:	d503201f 	nop
  103198:	d503201f 	nop
  10319c:	d503201f 	nop
  1031a0:	d503201f 	nop
  1031a4:	d503201f 	nop
  1031a8:	d503201f 	nop
  1031ac:	d503201f 	nop
  1031b0:	d503201f 	nop
  1031b4:	d503201f 	nop
  1031b8:	d503201f 	nop
  1031bc:	d503201f 	nop
  1031c0:	d503201f 	nop
  1031c4:	d503201f 	nop
  1031c8:	d503201f 	nop
  1031cc:	d503201f 	nop
  1031d0:	d503201f 	nop
  1031d4:	d503201f 	nop
  1031d8:	d503201f 	nop
  1031dc:	d503201f 	nop
  1031e0:	d503201f 	nop
  1031e4:	d503201f 	nop
  1031e8:	d503201f 	nop
  1031ec:	9400002b 	bl	103298 <_ZN22ruspiro_interrupt_core18disable_interrupts17h4262f3ae0843d19fE>
  1031f0:	085f7e68 	ldxrb	w8, [x19]
  1031f4:	35fff208 	cbnz	w8, 103034 <_ZN12ruspiro_lock9semaphore9Semaphore4down17h7dd706fc35386af7E+0x1c>
  1031f8:	17ffff92 	b	103040 <_ZN12ruspiro_lock9semaphore9Semaphore4down17h7dd706fc35386af7E+0x28>
  1031fc:	51000508 	sub	w8, w8, #0x1
  103200:	b9000668 	str	w8, [x19, #4]
  103204:	089ffe7f 	stlrb	wzr, [x19]
  103208:	a9417bf3 	ldp	x19, x30, [sp, #16]
  10320c:	f84207f4 	ldr	x20, [sp], #32
  103210:	14000034 	b	1032e0 <_ZN22ruspiro_interrupt_core20re_enable_interrupts17hc17f6d544c9e00a8E>
  103214:	00000000 	.inst	0x00000000 ; undefined

0000000000103218 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E>:
  103218:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
  10321c:	aa0003f3 	mov	x19, x0
  103220:	9400001e 	bl	103298 <_ZN22ruspiro_interrupt_core18disable_interrupts17h4262f3ae0843d19fE>
  103224:	52800028 	mov	w8, #0x1                   	// #1
  103228:	085ffe69 	ldaxrb	w9, [x19]
  10322c:	34000089 	cbz	w9, 10323c <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E+0x24>
  103230:	d5033f5f 	clrex
  103234:	085ffe69 	ldaxrb	w9, [x19]
  103238:	35ffffc9 	cbnz	w9, 103230 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E+0x18>
  10323c:	0809fe68 	stlxrb	w9, w8, [x19]
  103240:	35ffffa9 	cbnz	w9, 103234 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E+0x1c>
  103244:	a8c17bf3 	ldp	x19, x30, [sp], #16
  103248:	d65f03c0 	ret
  10324c:	00000000 	.inst	0x00000000 ; undefined

0000000000103250 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hcb55c707bd8b2049E>:
  103250:	089ffc1f 	stlrb	wzr, [x0]
  103254:	14000023 	b	1032e0 <_ZN22ruspiro_interrupt_core20re_enable_interrupts17hc17f6d544c9e00a8E>

0000000000103258 <_ZN22ruspiro_interrupt_core26entering_interrupt_handler17hce8bb23066ca077bE>:
  103258:	d00000e9 	adrp	x9, 121000 <_ZN12ruspiro_gpio4GPIO17h050453a1c37b81f4E>
  10325c:	52800028 	mov	w8, #0x1                   	// #1
  103260:	91040129 	add	x9, x9, #0x100
  103264:	089ffd28 	stlrb	w8, [x9]
  103268:	d65f03c0 	ret
  10326c:	00000000 	.inst	0x00000000 ; undefined

0000000000103270 <_ZN22ruspiro_interrupt_core25leaving_interrupt_handler17hcb261c9670177108E>:
  103270:	d00000e8 	adrp	x8, 121000 <_ZN12ruspiro_gpio4GPIO17h050453a1c37b81f4E>
  103274:	91040108 	add	x8, x8, #0x100
  103278:	089ffd1f 	stlrb	wzr, [x8]
  10327c:	d65f03c0 	ret

0000000000103280 <_ZN22ruspiro_interrupt_core17enable_interrupts17h83bc49305ea1bfedE>:
  103280:	d50342ff 	msr	daifclr, #0x2
  103284:	d5033fdf 	isb
  103288:	d50341ff 	msr	daifclr, #0x1
  10328c:	d5033fdf 	isb
  103290:	d65f03c0 	ret
  103294:	00000000 	.inst	0x00000000 ; undefined

0000000000103298 <_ZN22ruspiro_interrupt_core18disable_interrupts17h4262f3ae0843d19fE>:
  103298:	d00000e8 	adrp	x8, 121000 <_ZN12ruspiro_gpio4GPIO17h050453a1c37b81f4E>
  10329c:	91040108 	add	x8, x8, #0x100
  1032a0:	08dffd08 	ldarb	w8, [x8]
  1032a4:	72001d1f 	tst	w8, #0xff
  1032a8:	54000040 	b.eq	1032b0 <_ZN22ruspiro_interrupt_core18disable_interrupts17h4262f3ae0843d19fE+0x18>  // b.none
  1032ac:	d65f03c0 	ret
  1032b0:	d00000e8 	adrp	x8, 121000 <_ZN12ruspiro_gpio4GPIO17h050453a1c37b81f4E>
  1032b4:	52800029 	mov	w9, #0x1                   	// #1
  1032b8:	91041108 	add	x8, x8, #0x104
  1032bc:	d53b422b 	mrs	x11, daif
  1032c0:	9100110a 	add	x10, x8, #0x4
  1032c4:	d50342df 	msr	daifset, #0x2
  1032c8:	089ffd09 	stlrb	w9, [x8]
  1032cc:	d53b4228 	mrs	x8, daif
  1032d0:	d50341df 	msr	daifset, #0x1
  1032d4:	089ffd49 	stlrb	w9, [x10]
  1032d8:	d65f03c0 	ret
  1032dc:	00000000 	.inst	0x00000000 ; undefined

00000000001032e0 <_ZN22ruspiro_interrupt_core20re_enable_interrupts17hc17f6d544c9e00a8E>:
  1032e0:	d00000e8 	adrp	x8, 121000 <_ZN12ruspiro_gpio4GPIO17h050453a1c37b81f4E>
  1032e4:	91040108 	add	x8, x8, #0x100
  1032e8:	08dffd08 	ldarb	w8, [x8]
  1032ec:	72001d1f 	tst	w8, #0xff
  1032f0:	540001e1 	b.ne	10332c <_ZN22ruspiro_interrupt_core20re_enable_interrupts17hc17f6d544c9e00a8E+0x4c>  // b.any
  1032f4:	d00000e8 	adrp	x8, 121000 <_ZN12ruspiro_gpio4GPIO17h050453a1c37b81f4E>
  1032f8:	91041108 	add	x8, x8, #0x104
  1032fc:	08dffd08 	ldarb	w8, [x8]
  103300:	72001d1f 	tst	w8, #0xff
  103304:	54000060 	b.eq	103310 <_ZN22ruspiro_interrupt_core20re_enable_interrupts17hc17f6d544c9e00a8E+0x30>  // b.none
  103308:	d50342ff 	msr	daifclr, #0x2
  10330c:	d5033fdf 	isb
  103310:	d00000e8 	adrp	x8, 121000 <_ZN12ruspiro_gpio4GPIO17h050453a1c37b81f4E>
  103314:	91042108 	add	x8, x8, #0x108
  103318:	08dffd08 	ldarb	w8, [x8]
  10331c:	72001d1f 	tst	w8, #0xff
  103320:	54000060 	b.eq	10332c <_ZN22ruspiro_interrupt_core20re_enable_interrupts17hc17f6d544c9e00a8E+0x4c>  // b.none
  103324:	d50341ff 	msr	daifclr, #0x1
  103328:	d5033fdf 	isb
  10332c:	d65f03c0 	ret

0000000000103330 <_ZN13ruspiro_cache15cleaninvalidate17h6a4fb3cd22e38882E>:
  103330:	14000035 	b	103404 <__cleaninvalidate_dcache>
  103334:	00000000 	.inst	0x00000000 ; undefined

0000000000103338 <_ZN13ruspiro_cache18flush_icache_range17h87fcd92ec21dca2aE>:
  103338:	1400000d 	b	10336c <__flush_dcache_range>

000000000010333c <__get_dcache_line_size>:
  10333c:	d53b0020 	mrs	x0, ctr_el0
  103340:	d503201f 	nop
  103344:	d3504c00 	ubfx	x0, x0, #16, #4
  103348:	d2800081 	mov	x1, #0x4                   	// #4
  10334c:	9ac02020 	lsl	x0, x1, x0
  103350:	d65f03c0 	ret

0000000000103354 <__get_icache_line_size>:
  103354:	d53b0020 	mrs	x0, ctr_el0
  103358:	d503201f 	nop
  10335c:	92400c00 	and	x0, x0, #0xf
  103360:	d2800081 	mov	x1, #0x4                   	// #4
  103364:	9ac02020 	lsl	x0, x1, x0
  103368:	d65f03c0 	ret

000000000010336c <__flush_dcache_range>:
  10336c:	d10103ff 	sub	sp, sp, #0x40
  103370:	a90007e0 	stp	x0, x1, [sp]
  103374:	a9010fe2 	stp	x2, x3, [sp, #16]
  103378:	a90217e4 	stp	x4, x5, [sp, #32]
  10337c:	a9037be6 	stp	x6, x30, [sp, #48]
  103380:	aa1e03e6 	mov	x6, x30
  103384:	aa0003e2 	mov	x2, x0
  103388:	aa0103e3 	mov	x3, x1
  10338c:	97ffffec 	bl	10333c <__get_dcache_line_size>
  103390:	d1000404 	sub	x4, x0, #0x1
  103394:	8a240044 	bic	x4, x2, x4
  103398:	d50b7b24 	dc	cvau, x4
  10339c:	8b000084 	add	x4, x4, x0
  1033a0:	eb01009f 	cmp	x4, x1
  1033a4:	54ffffa3 	b.cc	103398 <__flush_dcache_range+0x2c>  // b.lo, b.ul, b.last
  1033a8:	d5033b9f 	dsb	ish
  1033ac:	97ffffea 	bl	103354 <__get_icache_line_size>
  1033b0:	d1000404 	sub	x4, x0, #0x1
  1033b4:	8a240064 	bic	x4, x3, x4
  1033b8:	d50b7524 	ic	ivau, x4
  1033bc:	8b000084 	add	x4, x4, x0
  1033c0:	eb03009f 	cmp	x4, x3
  1033c4:	54ffffa3 	b.cc	1033b8 <__flush_dcache_range+0x4c>  // b.lo, b.ul, b.last
  1033c8:	d5033b9f 	dsb	ish
  1033cc:	d5033fdf 	isb
  1033d0:	d508711f 	ic	ialluis
  1033d4:	d5033b9f 	dsb	ish
  1033d8:	d5033fdf 	isb
  1033dc:	a94007e0 	ldp	x0, x1, [sp]
  1033e0:	a9410fe2 	ldp	x2, x3, [sp, #16]
  1033e4:	a94217e4 	ldp	x4, x5, [sp, #32]
  1033e8:	a9437be6 	ldp	x6, x30, [sp, #48]
  1033ec:	910103ff 	add	sp, sp, #0x40
  1033f0:	d65f03c0 	ret

00000000001033f4 <__invalidate_dcache>:
  1033f4:	94000004 	bl	103404 <__cleaninvalidate_dcache>
  1033f8:	d65f03c0 	ret

00000000001033fc <__clean_dcache>:
  1033fc:	94000002 	bl	103404 <__cleaninvalidate_dcache>
  103400:	d65f03c0 	ret

0000000000103404 <__cleaninvalidate_dcache>:
  103404:	d10403ff 	sub	sp, sp, #0x100
  103408:	a90007e0 	stp	x0, x1, [sp]
  10340c:	a9010fe2 	stp	x2, x3, [sp, #16]
  103410:	a90217e4 	stp	x4, x5, [sp, #32]
  103414:	a9031fe6 	stp	x6, x7, [sp, #48]
  103418:	a90427e8 	stp	x8, x9, [sp, #64]
  10341c:	a9052fea 	stp	x10, x11, [sp, #80]
  103420:	a90637ec 	stp	x12, x13, [sp, #96]
  103424:	a9073fee 	stp	x14, x15, [sp, #112]
  103428:	a90847f0 	stp	x16, x17, [sp, #128]
  10342c:	a9094ff2 	stp	x18, x19, [sp, #144]
  103430:	a90a57f4 	stp	x20, x21, [sp, #160]
  103434:	a90b5ff6 	stp	x22, x23, [sp, #176]
  103438:	a90c67f8 	stp	x24, x25, [sp, #192]
  10343c:	a90d6ffa 	stp	x26, x27, [sp, #208]
  103440:	a90e77fc 	stp	x28, x29, [sp, #224]
  103444:	f9007bfe 	str	x30, [sp, #240]
  103448:	d5033f9f 	dsb	sy
  10344c:	d5390020 	mrs	x0, clidr_el1
  103450:	92680803 	and	x3, x0, #0x7000000
  103454:	d357fc63 	lsr	x3, x3, #23
  103458:	b40003c3 	cbz	x3, 1034d0 <finished>
  10345c:	d280000a 	mov	x10, #0x0                   	// #0

0000000000103460 <loop1>:
  103460:	8b4a0542 	add	x2, x10, x10, lsr #1
  103464:	9ac22401 	lsr	x1, x0, x2
  103468:	92400821 	and	x1, x1, #0x7
  10346c:	f100083f 	cmp	x1, #0x2
  103470:	540002ab 	b.lt	1034c4 <skip>  // b.tstop
  103474:	d51a000a 	msr	csselr_el1, x10
  103478:	d5033fdf 	isb
  10347c:	d5390001 	mrs	x1, ccsidr_el1
  103480:	92400822 	and	x2, x1, #0x7
  103484:	91001042 	add	x2, x2, #0x4
  103488:	d2807fe4 	mov	x4, #0x3ff                 	// #1023
  10348c:	8a410c84 	and	x4, x4, x1, lsr #3
  103490:	5ac01085 	clz	w5, w4
  103494:	d28fffe7 	mov	x7, #0x7fff                	// #32767
  103498:	8a4134e7 	and	x7, x7, x1, lsr #13

000000000010349c <loop2>:
  10349c:	aa0403e9 	mov	x9, x4

00000000001034a0 <loop3>:
  1034a0:	9ac52126 	lsl	x6, x9, x5
  1034a4:	aa06014b 	orr	x11, x10, x6
  1034a8:	9ac220e6 	lsl	x6, x7, x2
  1034ac:	aa06016b 	orr	x11, x11, x6
  1034b0:	d5087e4b 	dc	cisw, x11
  1034b4:	f1000529 	subs	x9, x9, #0x1
  1034b8:	54ffff4a 	b.ge	1034a0 <loop3>  // b.tcont
  1034bc:	f10004e7 	subs	x7, x7, #0x1
  1034c0:	54fffeea 	b.ge	10349c <loop2>  // b.tcont

00000000001034c4 <skip>:
  1034c4:	9100094a 	add	x10, x10, #0x2
  1034c8:	eb0a007f 	cmp	x3, x10
  1034cc:	54fffcac 	b.gt	103460 <loop1>

00000000001034d0 <finished>:
  1034d0:	d280000a 	mov	x10, #0x0                   	// #0
  1034d4:	d51a000a 	msr	csselr_el1, x10
  1034d8:	d5033f9f 	dsb	sy
  1034dc:	d5033fdf 	isb
  1034e0:	a94007e0 	ldp	x0, x1, [sp]
  1034e4:	a9410fe2 	ldp	x2, x3, [sp, #16]
  1034e8:	a94217e4 	ldp	x4, x5, [sp, #32]
  1034ec:	a9431fe6 	ldp	x6, x7, [sp, #48]
  1034f0:	a94427e8 	ldp	x8, x9, [sp, #64]
  1034f4:	a9452fea 	ldp	x10, x11, [sp, #80]
  1034f8:	a94637ec 	ldp	x12, x13, [sp, #96]
  1034fc:	a9473fee 	ldp	x14, x15, [sp, #112]
  103500:	a94847f0 	ldp	x16, x17, [sp, #128]
  103504:	a9494ff2 	ldp	x18, x19, [sp, #144]
  103508:	a94a57f4 	ldp	x20, x21, [sp, #160]
  10350c:	a94b5ff6 	ldp	x22, x23, [sp, #176]
  103510:	a94c67f8 	ldp	x24, x25, [sp, #192]
  103514:	a94d6ffa 	ldp	x26, x27, [sp, #208]
  103518:	a94e77fc 	ldp	x28, x29, [sp, #224]
  10351c:	f9407bfe 	ldr	x30, [sp, #240]
  103520:	910403ff 	add	sp, sp, #0x100
  103524:	d65f03c0 	ret

0000000000103528 <_ZN5alloc7raw_vec17capacity_overflow17h9436d70fa899b450E>:
  103528:	b00000c0 	adrp	x0, 11c000 <TestKernelAarch64+0xc000>
  10352c:	b00000c2 	adrp	x2, 11c000 <TestKernelAarch64+0xc000>
  103530:	910f3800 	add	x0, x0, #0x3ce
  103534:	91214042 	add	x2, x2, #0x850
  103538:	52800221 	mov	w1, #0x11                  	// #17
  10353c:	94000194 	bl	103b8c <_ZN4core9panicking5panic17hc6f3025301472b62E>
  103540:	d4200020 	brk	#0x1

0000000000103544 <_ZN5alloc5alloc18handle_alloc_error17hae0fd03f65528f41E>:
  103544:	97fffc7d 	bl	102738 <rust_oom>
  103548:	d4200020 	brk	#0x1

000000000010354c <_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hd9348cd9798b9d7bE>:
  10354c:	d293fc40 	mov	x0, #0x9fe2                	// #40930
  103550:	f2b18ac0 	movk	x0, #0x8c56, lsl #16
  103554:	f2c7c820 	movk	x0, #0x3e41, lsl #32
  103558:	f2f831e0 	movk	x0, #0xc18f, lsl #48
  10355c:	d65f03c0 	ret

0000000000103560 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4c1a3e8912c56b8aE>:
  103560:	d10103ff 	sub	sp, sp, #0x40
  103564:	b9400009 	ldr	w9, [x0]
  103568:	b00000c8 	adrp	x8, 11c000 <TestKernelAarch64+0xc000>
  10356c:	f9443508 	ldr	x8, [x8, #2152]
  103570:	aa0103e0 	mov	x0, x1
  103574:	d3447d2a 	ubfx	x10, x9, #4, #28
  103578:	7109c55f 	cmp	w10, #0x271
  10357c:	f9001bfe 	str	x30, [sp, #48]
  103580:	54000443 	b.cc	103608 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4c1a3e8912c56b8aE+0xa8>  // b.lo, b.ul, b.last
  103584:	d28b296b 	mov	x11, #0x594b                	// #22859
  103588:	f2a710cb 	movk	x11, #0x3886, lsl #16
  10358c:	f2d8bacb 	movk	x11, #0xc5d6, lsl #32
  103590:	5290a3ed 	mov	w13, #0x851f                	// #34079
  103594:	529c1ff0 	mov	w16, #0xe0ff                	// #57599
  103598:	aa1f03ea 	mov	x10, xzr
  10359c:	f2e68dab 	movk	x11, #0x346d, lsl #48
  1035a0:	5284e20c 	mov	w12, #0x2710                	// #10000
  1035a4:	72aa3d6d 	movk	w13, #0x51eb, lsl #16
  1035a8:	52800c8e 	mov	w14, #0x64                  	// #100
  1035ac:	910023ef 	add	x15, sp, #0x8
  1035b0:	72a0beb0 	movk	w16, #0x5f5, lsl #16
  1035b4:	aa0903f1 	mov	x17, x9
  1035b8:	9bcb7d29 	umulh	x9, x9, x11
  1035bc:	d34bfd29 	lsr	x9, x9, #11
  1035c0:	1b0cc532 	msub	w18, w9, w12, w17
  1035c4:	12003e41 	and	w1, w18, #0xffff
  1035c8:	9bad7c21 	umull	x1, w1, w13
  1035cc:	d365fc21 	lsr	x1, x1, #37
  1035d0:	78617902 	ldrh	w2, [x8, x1, lsl #1]
  1035d4:	1b0ec832 	msub	w18, w1, w14, w18
  1035d8:	8b0a01e1 	add	x1, x15, x10
  1035dc:	92403e52 	and	x18, x18, #0xffff
  1035e0:	78023022 	sturh	w2, [x1, #35]
  1035e4:	78727912 	ldrh	w18, [x8, x18, lsl #1]
  1035e8:	eb10023f 	cmp	x17, x16
  1035ec:	d100114a 	sub	x10, x10, #0x4
  1035f0:	78025032 	sturh	w18, [x1, #37]
  1035f4:	54fffe08 	b.hi	1035b4 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4c1a3e8912c56b8aE+0x54>  // b.pmore
  1035f8:	91009d4a 	add	x10, x10, #0x27
  1035fc:	f1018d3f 	cmp	x9, #0x63
  103600:	540000a8 	b.hi	103614 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4c1a3e8912c56b8aE+0xb4>  // b.pmore
  103604:	14000011 	b	103648 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4c1a3e8912c56b8aE+0xe8>
  103608:	528004ea 	mov	w10, #0x27                  	// #39
  10360c:	f1018d3f 	cmp	x9, #0x63
  103610:	540001c9 	b.ls	103648 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4c1a3e8912c56b8aE+0xe8>  // b.plast
  103614:	5290a3ec 	mov	w12, #0x851f                	// #34079
  103618:	12003d2b 	and	w11, w9, #0xffff
  10361c:	72aa3d6c 	movk	w12, #0x51eb, lsl #16
  103620:	9bac7d6b 	umull	x11, w11, w12
  103624:	d365fd6b 	lsr	x11, x11, #37
  103628:	52800c8c 	mov	w12, #0x64                  	// #100
  10362c:	1b0ca569 	msub	w9, w11, w12, w9
  103630:	92403d29 	and	x9, x9, #0xffff
  103634:	78697909 	ldrh	w9, [x8, x9, lsl #1]
  103638:	d100094a 	sub	x10, x10, #0x2
  10363c:	910023ec 	add	x12, sp, #0x8
  103640:	782a6989 	strh	w9, [x12, x10]
  103644:	aa0b03e9 	mov	x9, x11
  103648:	f100293f 	cmp	x9, #0xa
  10364c:	540000ca 	b.ge	103664 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4c1a3e8912c56b8aE+0x104>  // b.tcont
  103650:	d1000548 	sub	x8, x10, #0x1
  103654:	1100c129 	add	w9, w9, #0x30
  103658:	910023ea 	add	x10, sp, #0x8
  10365c:	38286949 	strb	w9, [x10, x8]
  103660:	14000005 	b	103674 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4c1a3e8912c56b8aE+0x114>
  103664:	78697909 	ldrh	w9, [x8, x9, lsl #1]
  103668:	d1000948 	sub	x8, x10, #0x2
  10366c:	910023ea 	add	x10, sp, #0x8
  103670:	78286949 	strh	w9, [x10, x8]
  103674:	910023e9 	add	x9, sp, #0x8
  103678:	528004ea 	mov	w10, #0x27                  	// #39
  10367c:	b00000c2 	adrp	x2, 11c000 <TestKernelAarch64+0xc000>
  103680:	8b080124 	add	x4, x9, x8
  103684:	cb080145 	sub	x5, x10, x8
  103688:	91129c42 	add	x2, x2, #0x4a7
  10368c:	52800021 	mov	w1, #0x1                   	// #1
  103690:	aa1f03e3 	mov	x3, xzr
  103694:	94000055 	bl	1037e8 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E>
  103698:	f9401bfe 	ldr	x30, [sp, #48]
  10369c:	910103ff 	add	sp, sp, #0x40
  1036a0:	d65f03c0 	ret

00000000001036a4 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h1623b4e59f40a3ffE>:
  1036a4:	d10103ff 	sub	sp, sp, #0x40
  1036a8:	f9400009 	ldr	x9, [x0]
  1036ac:	b00000c8 	adrp	x8, 11c000 <TestKernelAarch64+0xc000>
  1036b0:	f9443508 	ldr	x8, [x8, #2152]
  1036b4:	aa0103e0 	mov	x0, x1
  1036b8:	d344fd2a 	lsr	x10, x9, #4
  1036bc:	f109c55f 	cmp	x10, #0x271
  1036c0:	f9001bfe 	str	x30, [sp, #48]
  1036c4:	54000443 	b.cc	10374c <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h1623b4e59f40a3ffE+0xa8>  // b.lo, b.ul, b.last
  1036c8:	d28b296b 	mov	x11, #0x594b                	// #22859
  1036cc:	f2a710cb 	movk	x11, #0x3886, lsl #16
  1036d0:	f2d8bacb 	movk	x11, #0xc5d6, lsl #32
  1036d4:	5290a3ed 	mov	w13, #0x851f                	// #34079
  1036d8:	529c1ff0 	mov	w16, #0xe0ff                	// #57599
  1036dc:	aa1f03ea 	mov	x10, xzr
  1036e0:	f2e68dab 	movk	x11, #0x346d, lsl #48
  1036e4:	5284e20c 	mov	w12, #0x2710                	// #10000
  1036e8:	72aa3d6d 	movk	w13, #0x51eb, lsl #16
  1036ec:	52800c8e 	mov	w14, #0x64                  	// #100
  1036f0:	910023ef 	add	x15, sp, #0x8
  1036f4:	72a0beb0 	movk	w16, #0x5f5, lsl #16
  1036f8:	aa0903f1 	mov	x17, x9
  1036fc:	9bcb7d29 	umulh	x9, x9, x11
  103700:	d34bfd29 	lsr	x9, x9, #11
  103704:	1b0cc532 	msub	w18, w9, w12, w17
  103708:	12003e41 	and	w1, w18, #0xffff
  10370c:	9bad7c21 	umull	x1, w1, w13
  103710:	d365fc21 	lsr	x1, x1, #37
  103714:	78617902 	ldrh	w2, [x8, x1, lsl #1]
  103718:	1b0ec832 	msub	w18, w1, w14, w18
  10371c:	8b0a01e1 	add	x1, x15, x10
  103720:	92403e52 	and	x18, x18, #0xffff
  103724:	78023022 	sturh	w2, [x1, #35]
  103728:	78727912 	ldrh	w18, [x8, x18, lsl #1]
  10372c:	eb10023f 	cmp	x17, x16
  103730:	d100114a 	sub	x10, x10, #0x4
  103734:	78025032 	sturh	w18, [x1, #37]
  103738:	54fffe08 	b.hi	1036f8 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h1623b4e59f40a3ffE+0x54>  // b.pmore
  10373c:	91009d4a 	add	x10, x10, #0x27
  103740:	f1018d3f 	cmp	x9, #0x63
  103744:	540000ac 	b.gt	103758 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h1623b4e59f40a3ffE+0xb4>
  103748:	14000011 	b	10378c <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h1623b4e59f40a3ffE+0xe8>
  10374c:	528004ea 	mov	w10, #0x27                  	// #39
  103750:	f1018d3f 	cmp	x9, #0x63
  103754:	540001cd 	b.le	10378c <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h1623b4e59f40a3ffE+0xe8>
  103758:	5290a3ec 	mov	w12, #0x851f                	// #34079
  10375c:	12003d2b 	and	w11, w9, #0xffff
  103760:	72aa3d6c 	movk	w12, #0x51eb, lsl #16
  103764:	9bac7d6b 	umull	x11, w11, w12
  103768:	d365fd6b 	lsr	x11, x11, #37
  10376c:	52800c8c 	mov	w12, #0x64                  	// #100
  103770:	1b0ca569 	msub	w9, w11, w12, w9
  103774:	92403d29 	and	x9, x9, #0xffff
  103778:	78697909 	ldrh	w9, [x8, x9, lsl #1]
  10377c:	d100094a 	sub	x10, x10, #0x2
  103780:	910023ec 	add	x12, sp, #0x8
  103784:	782a6989 	strh	w9, [x12, x10]
  103788:	aa0b03e9 	mov	x9, x11
  10378c:	f100293f 	cmp	x9, #0xa
  103790:	540000ca 	b.ge	1037a8 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h1623b4e59f40a3ffE+0x104>  // b.tcont
  103794:	d1000548 	sub	x8, x10, #0x1
  103798:	1100c129 	add	w9, w9, #0x30
  10379c:	910023ea 	add	x10, sp, #0x8
  1037a0:	38286949 	strb	w9, [x10, x8]
  1037a4:	14000005 	b	1037b8 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h1623b4e59f40a3ffE+0x114>
  1037a8:	78697909 	ldrh	w9, [x8, x9, lsl #1]
  1037ac:	d1000948 	sub	x8, x10, #0x2
  1037b0:	910023ea 	add	x10, sp, #0x8
  1037b4:	78286949 	strh	w9, [x10, x8]
  1037b8:	910023e9 	add	x9, sp, #0x8
  1037bc:	528004ea 	mov	w10, #0x27                  	// #39
  1037c0:	b00000c2 	adrp	x2, 11c000 <TestKernelAarch64+0xc000>
  1037c4:	8b080124 	add	x4, x9, x8
  1037c8:	cb080145 	sub	x5, x10, x8
  1037cc:	91129c42 	add	x2, x2, #0x4a7
  1037d0:	52800021 	mov	w1, #0x1                   	// #1
  1037d4:	aa1f03e3 	mov	x3, xzr
  1037d8:	94000004 	bl	1037e8 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E>
  1037dc:	f9401bfe 	ldr	x30, [sp, #48]
  1037e0:	910103ff 	add	sp, sp, #0x40
  1037e4:	d65f03c0 	ret

00000000001037e8 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E>:
  1037e8:	a9bb6bfb 	stp	x27, x26, [sp, #-80]!
  1037ec:	a9025bf7 	stp	x23, x22, [sp, #32]
  1037f0:	a90353f5 	stp	x21, x20, [sp, #48]
  1037f4:	a9047bf3 	stp	x19, x30, [sp, #64]
  1037f8:	aa0503f4 	mov	x20, x5
  1037fc:	aa0403f5 	mov	x21, x4
  103800:	aa0303f6 	mov	x22, x3
  103804:	aa0203f7 	mov	x23, x2
  103808:	aa0003f3 	mov	x19, x0
  10380c:	a90163f9 	stp	x25, x24, [sp, #16]
  103810:	34000201 	cbz	w1, 103850 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x68>
  103814:	b9405268 	ldr	w8, [x19, #80]
  103818:	52800569 	mov	w9, #0x2b                  	// #43
  10381c:	52a0022a 	mov	w10, #0x110000              	// #1114112
  103820:	9240010b 	and	x11, x8, #0x1
  103824:	7100017f 	cmp	w11, #0x0
  103828:	1a890158 	csel	w24, w10, w9, eq  // eq = none
  10382c:	8b140169 	add	x9, x11, x20
  103830:	36100188 	tbz	w8, #2, 103860 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x78>
  103834:	aa1603eb 	mov	x11, x22
  103838:	b4000616 	cbz	x22, 1038f8 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x110>
  10383c:	f10006df 	cmp	x22, #0x1
  103840:	54000281 	b.ne	103890 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0xa8>  // b.any
  103844:	aa1f03eb 	mov	x11, xzr
  103848:	aa1703ea 	mov	x10, x23
  10384c:	14000024 	b	1038dc <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0xf4>
  103850:	b9405268 	ldr	w8, [x19, #80]
  103854:	91000689 	add	x9, x20, #0x1
  103858:	528005b8 	mov	w24, #0x2d                  	// #45
  10385c:	3717fec8 	tbnz	w8, #2, 103834 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x4c>
  103860:	aa1f03f6 	mov	x22, xzr
  103864:	aa1f03f7 	mov	x23, xzr
  103868:	f940026a 	ldr	x10, [x19]
  10386c:	f100055f 	cmp	x10, #0x1
  103870:	540004e0 	b.eq	10390c <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x124>  // b.none
  103874:	aa1303e0 	mov	x0, x19
  103878:	2a1803e1 	mov	w1, w24
  10387c:	aa1703e2 	mov	x2, x23
  103880:	aa1603e3 	mov	x3, x22
  103884:	940000a6 	bl	103b1c <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hed4490a54895f023E>
  103888:	34000700 	cbz	w0, 103968 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x180>
  10388c:	1400008f 	b	103ac8 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2e0>
  103890:	927ffacd 	and	x13, x22, #0xfffffffffffffffe
  103894:	aa1f03eb 	mov	x11, xzr
  103898:	aa1f03ec 	mov	x12, xzr
  10389c:	8b0d02ea 	add	x10, x23, x13
  1038a0:	910006ee 	add	x14, x23, #0x1
  1038a4:	aa0d03ef 	mov	x15, x13
  1038a8:	385ff1d0 	ldurb	w16, [x14, #-1]
  1038ac:	384025d1 	ldrb	w17, [x14], #2
  1038b0:	121a0610 	and	w16, w16, #0xc0
  1038b4:	121a0631 	and	w17, w17, #0xc0
  1038b8:	7102021f 	cmp	w16, #0x80
  1038bc:	9a8b156b 	cinc	x11, x11, eq  // eq = none
  1038c0:	7102023f 	cmp	w17, #0x80
  1038c4:	9a8c158c 	cinc	x12, x12, eq  // eq = none
  1038c8:	f10009ef 	subs	x15, x15, #0x2
  1038cc:	54fffee1 	b.ne	1038a8 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0xc0>  // b.any
  1038d0:	eb1601bf 	cmp	x13, x22
  1038d4:	8b0b018b 	add	x11, x12, x11
  1038d8:	54000100 	b.eq	1038f8 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x110>  // b.none
  1038dc:	8b1602ec 	add	x12, x23, x22
  1038e0:	3840154d 	ldrb	w13, [x10], #1
  1038e4:	121a05ad 	and	w13, w13, #0xc0
  1038e8:	710201bf 	cmp	w13, #0x80
  1038ec:	9a8b156b 	cinc	x11, x11, eq  // eq = none
  1038f0:	eb0a019f 	cmp	x12, x10
  1038f4:	54ffff61 	b.ne	1038e0 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0xf8>  // b.any
  1038f8:	8b160129 	add	x9, x9, x22
  1038fc:	cb0b0129 	sub	x9, x9, x11
  103900:	f940026a 	ldr	x10, [x19]
  103904:	f100055f 	cmp	x10, #0x1
  103908:	54fffb61 	b.ne	103874 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x8c>  // b.any
  10390c:	f940066a 	ldr	x10, [x19, #8]
  103910:	eb09015b 	subs	x27, x10, x9
  103914:	540001e9 	b.ls	103950 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x168>  // b.plast
  103918:	371803c8 	tbnz	w8, #3, 103990 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x1a8>
  10391c:	39416268 	ldrb	w8, [x19, #88]
  103920:	b00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  103924:	9112ad29 	add	x9, x9, #0x4ab
  103928:	71000d1f 	cmp	w8, #0x3
  10392c:	1a9f1508 	csinc	w8, w8, wzr, ne  // ne = any
  103930:	100000aa 	adr	x10, 103944 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x15c>
  103934:	3868692b 	ldrb	w11, [x9, x8]
  103938:	8b0b094a 	add	x10, x10, x11, lsl #2
  10393c:	aa1f03e8 	mov	x8, xzr
  103940:	d61f0140 	br	x10
  103944:	aa1b03e8 	mov	x8, x27
  103948:	aa1f03fb 	mov	x27, xzr
  10394c:	1400002b 	b	1039f8 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x210>
  103950:	aa1303e0 	mov	x0, x19
  103954:	2a1803e1 	mov	w1, w24
  103958:	aa1703e2 	mov	x2, x23
  10395c:	aa1603e3 	mov	x3, x22
  103960:	9400006f 	bl	103b1c <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hed4490a54895f023E>
  103964:	37000b20 	tbnz	w0, #0, 103ac8 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2e0>
  103968:	a9422260 	ldp	x0, x8, [x19, #32]
  10396c:	aa1503e1 	mov	x1, x21
  103970:	aa1403e2 	mov	x2, x20
  103974:	a9447bf3 	ldp	x19, x30, [sp, #64]
  103978:	f9400d03 	ldr	x3, [x8, #24]
  10397c:	a94353f5 	ldp	x21, x20, [sp, #48]
  103980:	a9425bf7 	ldp	x23, x22, [sp, #32]
  103984:	a94163f9 	ldp	x25, x24, [sp, #16]
  103988:	a8c56bfb 	ldp	x27, x26, [sp], #80
  10398c:	d61f0060 	br	x3
  103990:	52800608 	mov	w8, #0x30                  	// #48
  103994:	52800039 	mov	w25, #0x1                   	// #1
  103998:	aa1303e0 	mov	x0, x19
  10399c:	2a1803e1 	mov	w1, w24
  1039a0:	aa1703e2 	mov	x2, x23
  1039a4:	aa1603e3 	mov	x3, x22
  1039a8:	b9005668 	str	w8, [x19, #84]
  1039ac:	39016279 	strb	w25, [x19, #88]
  1039b0:	9400005b 	bl	103b1c <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hed4490a54895f023E>
  1039b4:	370008c0 	tbnz	w0, #0, 103acc <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2e4>
  1039b8:	39416268 	ldrb	w8, [x19, #88]
  1039bc:	b00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  1039c0:	91129d29 	add	x9, x9, #0x4a7
  1039c4:	71000d1f 	cmp	w8, #0x3
  1039c8:	1a9f1508 	csinc	w8, w8, wzr, ne  // ne = any
  1039cc:	100000aa 	adr	x10, 1039e0 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x1f8>
  1039d0:	3868692b 	ldrb	w11, [x9, x8]
  1039d4:	8b0b094a 	add	x10, x10, x11, lsl #2
  1039d8:	aa1f03e8 	mov	x8, xzr
  1039dc:	d61f0140 	br	x10
  1039e0:	aa1b03e8 	mov	x8, x27
  1039e4:	aa1f03fb 	mov	x27, xzr
  1039e8:	14000028 	b	103a88 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2a0>
  1039ec:	91000769 	add	x9, x27, #0x1
  1039f0:	d341ff68 	lsr	x8, x27, #1
  1039f4:	d341fd3b 	lsr	x27, x9, #1
  1039f8:	91000519 	add	x25, x8, #0x1
  1039fc:	f1000739 	subs	x25, x25, #0x1
  103a00:	540000e0 	b.eq	103a1c <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x234>  // b.none
  103a04:	a9422260 	ldp	x0, x8, [x19, #32]
  103a08:	b9405661 	ldr	w1, [x19, #84]
  103a0c:	f9401108 	ldr	x8, [x8, #32]
  103a10:	d63f0100 	blr	x8
  103a14:	3607ff40 	tbz	w0, #0, 1039fc <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x214>
  103a18:	1400002c 	b	103ac8 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2e0>
  103a1c:	b940567a 	ldr	w26, [x19, #84]
  103a20:	aa1303e0 	mov	x0, x19
  103a24:	2a1803e1 	mov	w1, w24
  103a28:	aa1703e2 	mov	x2, x23
  103a2c:	aa1603e3 	mov	x3, x22
  103a30:	9400003b 	bl	103b1c <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hed4490a54895f023E>
  103a34:	370004a0 	tbnz	w0, #0, 103ac8 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2e0>
  103a38:	a9422260 	ldp	x0, x8, [x19, #32]
  103a3c:	aa1503e1 	mov	x1, x21
  103a40:	aa1403e2 	mov	x2, x20
  103a44:	f9400d08 	ldr	x8, [x8, #24]
  103a48:	d63f0100 	blr	x8
  103a4c:	370003e0 	tbnz	w0, #0, 103ac8 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2e0>
  103a50:	a9424e74 	ldp	x20, x19, [x19, #32]
  103a54:	91000775 	add	x21, x27, #0x1
  103a58:	52800039 	mov	w25, #0x1                   	// #1
  103a5c:	f10006b5 	subs	x21, x21, #0x1
  103a60:	540005a0 	b.eq	103b14 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x32c>  // b.none
  103a64:	f9401268 	ldr	x8, [x19, #32]
  103a68:	aa1403e0 	mov	x0, x20
  103a6c:	2a1a03e1 	mov	w1, w26
  103a70:	d63f0100 	blr	x8
  103a74:	3607ff40 	tbz	w0, #0, 103a5c <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x274>
  103a78:	14000015 	b	103acc <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2e4>
  103a7c:	91000769 	add	x9, x27, #0x1
  103a80:	d341ff68 	lsr	x8, x27, #1
  103a84:	d341fd3b 	lsr	x27, x9, #1
  103a88:	91000516 	add	x22, x8, #0x1
  103a8c:	f10006d6 	subs	x22, x22, #0x1
  103a90:	540000e0 	b.eq	103aac <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2c4>  // b.none
  103a94:	a9422260 	ldp	x0, x8, [x19, #32]
  103a98:	b9405661 	ldr	w1, [x19, #84]
  103a9c:	f9401108 	ldr	x8, [x8, #32]
  103aa0:	d63f0100 	blr	x8
  103aa4:	3607ff40 	tbz	w0, #0, 103a8c <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2a4>
  103aa8:	14000008 	b	103ac8 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2e0>
  103aac:	a9422260 	ldp	x0, x8, [x19, #32]
  103ab0:	b9405676 	ldr	w22, [x19, #84]
  103ab4:	aa1503e1 	mov	x1, x21
  103ab8:	aa1403e2 	mov	x2, x20
  103abc:	f9400d08 	ldr	x8, [x8, #24]
  103ac0:	d63f0100 	blr	x8
  103ac4:	36000120 	tbz	w0, #0, 103ae8 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x300>
  103ac8:	52800039 	mov	w25, #0x1                   	// #1
  103acc:	2a1903e0 	mov	w0, w25
  103ad0:	a9447bf3 	ldp	x19, x30, [sp, #64]
  103ad4:	a94353f5 	ldp	x21, x20, [sp, #48]
  103ad8:	a9425bf7 	ldp	x23, x22, [sp, #32]
  103adc:	a94163f9 	ldp	x25, x24, [sp, #16]
  103ae0:	a8c56bfb 	ldp	x27, x26, [sp], #80
  103ae4:	d65f03c0 	ret
  103ae8:	a9424e74 	ldp	x20, x19, [x19, #32]
  103aec:	91000775 	add	x21, x27, #0x1
  103af0:	52800039 	mov	w25, #0x1                   	// #1
  103af4:	f10006b5 	subs	x21, x21, #0x1
  103af8:	540000e0 	b.eq	103b14 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x32c>  // b.none
  103afc:	f9401268 	ldr	x8, [x19, #32]
  103b00:	aa1403e0 	mov	x0, x20
  103b04:	2a1603e1 	mov	w1, w22
  103b08:	d63f0100 	blr	x8
  103b0c:	3607ff40 	tbz	w0, #0, 103af4 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x30c>
  103b10:	17ffffef 	b	103acc <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2e4>
  103b14:	2a1f03f9 	mov	w25, wzr
  103b18:	17ffffed 	b	103acc <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2e4>

0000000000103b1c <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hed4490a54895f023E>:
  103b1c:	a9be53f5 	stp	x21, x20, [sp, #-32]!
  103b20:	a9017bf3 	stp	x19, x30, [sp, #16]
  103b24:	aa0303f3 	mov	x19, x3
  103b28:	aa0203f4 	mov	x20, x2
  103b2c:	7144403f 	cmp	w1, #0x110, lsl #12
  103b30:	aa0003f5 	mov	x21, x0
  103b34:	54000120 	b.eq	103b58 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hed4490a54895f023E+0x3c>  // b.none
  103b38:	a94222a0 	ldp	x0, x8, [x21, #32]
  103b3c:	f9401108 	ldr	x8, [x8, #32]
  103b40:	d63f0100 	blr	x8
  103b44:	340000a0 	cbz	w0, 103b58 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hed4490a54895f023E+0x3c>
  103b48:	52800020 	mov	w0, #0x1                   	// #1
  103b4c:	a9417bf3 	ldp	x19, x30, [sp, #16]
  103b50:	a8c253f5 	ldp	x21, x20, [sp], #32
  103b54:	d65f03c0 	ret
  103b58:	b4000114 	cbz	x20, 103b78 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hed4490a54895f023E+0x5c>
  103b5c:	a94222a0 	ldp	x0, x8, [x21, #32]
  103b60:	aa1303e2 	mov	x2, x19
  103b64:	a9417bf3 	ldp	x19, x30, [sp, #16]
  103b68:	aa1403e1 	mov	x1, x20
  103b6c:	f9400d03 	ldr	x3, [x8, #24]
  103b70:	a8c253f5 	ldp	x21, x20, [sp], #32
  103b74:	d61f0060 	br	x3
  103b78:	2a1f03e0 	mov	w0, wzr
  103b7c:	a9417bf3 	ldp	x19, x30, [sp, #16]
  103b80:	a8c253f5 	ldp	x21, x20, [sp], #32
  103b84:	d65f03c0 	ret

0000000000103b88 <_ZN4core3ptr18real_drop_in_place17h4131d578b7195ed7E>:
  103b88:	d65f03c0 	ret

0000000000103b8c <_ZN4core9panicking5panic17hc6f3025301472b62E>:
  103b8c:	d10103ff 	sub	sp, sp, #0x40
  103b90:	a90307e0 	stp	x0, x1, [sp, #48]
  103b94:	9100c3e8 	add	x8, sp, #0x30
  103b98:	52800029 	mov	w9, #0x1                   	// #1
  103b9c:	5280010a 	mov	w10, #0x8                   	// #8
  103ba0:	910003e0 	mov	x0, sp
  103ba4:	aa0203e1 	mov	x1, x2
  103ba8:	a9017fff 	stp	xzr, xzr, [sp, #16]
  103bac:	a90027e8 	stp	x8, x9, [sp]
  103bb0:	a9027fea 	stp	x10, xzr, [sp, #32]
  103bb4:	94000015 	bl	103c08 <_ZN4core9panicking9panic_fmt17heca5e185b37feb0aE>
  103bb8:	d4200020 	brk	#0x1

0000000000103bbc <_ZN4core9panicking18panic_bounds_check17h61bb2fd281420b4eE>:
  103bbc:	aa0003e8 	mov	x8, x0
  103bc0:	a9ba0be1 	stp	x1, x2, [sp, #-96]!
  103bc4:	b00000ca 	adrp	x10, 11c000 <TestKernelAarch64+0xc000>
  103bc8:	f944fd4a 	ldr	x10, [x10, #2552]
  103bcc:	910023e9 	add	x9, sp, #0x8
  103bd0:	910003eb 	mov	x11, sp
  103bd4:	910043e0 	add	x0, sp, #0x10
  103bd8:	a9042be9 	stp	x9, x10, [sp, #64]
  103bdc:	b00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  103be0:	91224129 	add	x9, x9, #0x890
  103be4:	a9052beb 	stp	x11, x10, [sp, #80]
  103be8:	5280004a 	mov	w10, #0x2                   	// #2
  103bec:	a9012be9 	stp	x9, x10, [sp, #16]
  103bf0:	910103e9 	add	x9, sp, #0x40
  103bf4:	aa0803e1 	mov	x1, x8
  103bf8:	a9027fff 	stp	xzr, xzr, [sp, #32]
  103bfc:	a9032be9 	stp	x9, x10, [sp, #48]
  103c00:	94000002 	bl	103c08 <_ZN4core9panicking9panic_fmt17heca5e185b37feb0aE>
  103c04:	d4200020 	brk	#0x1

0000000000103c08 <_ZN4core9panicking9panic_fmt17heca5e185b37feb0aE>:
  103c08:	b00000c9 	adrp	x9, 11c000 <TestKernelAarch64+0xc000>
  103c0c:	52800028 	mov	w8, #0x1                   	// #1
  103c10:	9121c129 	add	x9, x9, #0x870
  103c14:	a9be27e8 	stp	x8, x9, [sp, #-32]!
  103c18:	a90107e0 	stp	x0, x1, [sp, #16]
  103c1c:	910003e0 	mov	x0, sp
  103c20:	97fff494 	bl	100e70 <rust_begin_unwind>
  103c24:	d4200020 	brk	#0x1

0000000000103c28 <memcpy>:
  103c28:	b4000222 	cbz	x2, 103c6c <memcpy+0x44>
  103c2c:	f1007c5f 	cmp	x2, #0x1f
  103c30:	540000e9 	b.ls	103c4c <memcpy+0x24>  // b.plast
  103c34:	8b020028 	add	x8, x1, x2
  103c38:	eb00011f 	cmp	x8, x0
  103c3c:	540001a9 	b.ls	103c70 <memcpy+0x48>  // b.plast
  103c40:	8b020008 	add	x8, x0, x2
  103c44:	eb01011f 	cmp	x8, x1
  103c48:	54000149 	b.ls	103c70 <memcpy+0x48>  // b.plast
  103c4c:	aa1f03e8 	mov	x8, xzr
  103c50:	cb080049 	sub	x9, x2, x8
  103c54:	8b08000a 	add	x10, x0, x8
  103c58:	8b080028 	add	x8, x1, x8
  103c5c:	3840150b 	ldrb	w11, [x8], #1
  103c60:	f1000529 	subs	x9, x9, #0x1
  103c64:	3800154b 	strb	w11, [x10], #1
  103c68:	54ffffa1 	b.ne	103c5c <memcpy+0x34>  // b.any
  103c6c:	d65f03c0 	ret
  103c70:	927be848 	and	x8, x2, #0xffffffffffffffe0
  103c74:	91004029 	add	x9, x1, #0x10
  103c78:	9100400a 	add	x10, x0, #0x10
  103c7c:	aa0803eb 	mov	x11, x8
  103c80:	ad7f8520 	ldp	q0, q1, [x9, #-16]
  103c84:	91008129 	add	x9, x9, #0x20
  103c88:	f100816b 	subs	x11, x11, #0x20
  103c8c:	ad3f8540 	stp	q0, q1, [x10, #-16]
  103c90:	9100814a 	add	x10, x10, #0x20
  103c94:	54ffff61 	b.ne	103c80 <memcpy+0x58>  // b.any
  103c98:	eb02011f 	cmp	x8, x2
  103c9c:	54fffda1 	b.ne	103c50 <memcpy+0x28>  // b.any
  103ca0:	17fffff3 	b	103c6c <memcpy+0x44>

0000000000103ca4 <memset>:
  103ca4:	b4000282 	cbz	x2, 103cf4 <memset+0x50>
  103ca8:	f1007c5f 	cmp	x2, #0x1f
  103cac:	54000068 	b.hi	103cb8 <memset+0x14>  // b.pmore
  103cb0:	aa1f03e8 	mov	x8, xzr
  103cb4:	1400000b 	b	103ce0 <memset+0x3c>
  103cb8:	927be848 	and	x8, x2, #0xffffffffffffffe0
  103cbc:	4e010c20 	dup	v0.16b, w1
  103cc0:	91004009 	add	x9, x0, #0x10
  103cc4:	aa0803ea 	mov	x10, x8
  103cc8:	ad3f8120 	stp	q0, q0, [x9, #-16]
  103ccc:	f100814a 	subs	x10, x10, #0x20
  103cd0:	91008129 	add	x9, x9, #0x20
  103cd4:	54ffffa1 	b.ne	103cc8 <memset+0x24>  // b.any
  103cd8:	eb02011f 	cmp	x8, x2
  103cdc:	540000c0 	b.eq	103cf4 <memset+0x50>  // b.none
  103ce0:	cb080049 	sub	x9, x2, x8
  103ce4:	8b080008 	add	x8, x0, x8
  103ce8:	f1000529 	subs	x9, x9, #0x1
  103cec:	38001501 	strb	w1, [x8], #1
  103cf0:	54ffffc1 	b.ne	103ce8 <memset+0x44>  // b.any
  103cf4:	d65f03c0 	ret
