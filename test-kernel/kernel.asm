
./target/aarch64-ruspiro/release/kernel:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000080000 <__boot>:
   80000:	d53800a0 	mrs	x0, mpidr_el1
   80004:	92400400 	and	x0, x0, #0x3
   80008:	58000701 	ldr	x1, 800e8 <.SwitchReturn+0x28>
   8000c:	58000722 	ldr	x2, 800f0 <.SwitchReturn+0x30>
   80010:	eb020021 	subs	x1, x1, x2
   80014:	9b007c22 	mul	x2, x1, x0
   80018:	58000701 	ldr	x1, 800f8 <.SwitchReturn+0x38>
   8001c:	cb22603f 	sub	sp, x1, x2
   80020:	b5000120 	cbnz	x0, 80044 <.bss_done>
   80024:	580006e0 	ldr	x0, 80100 <.SwitchReturn+0x40>
   80028:	58000702 	ldr	x2, 80108 <.SwitchReturn+0x48>
   8002c:	cb000042 	sub	x2, x2, x0
   80030:	d344fc42 	lsr	x2, x2, #4
   80034:	b4000082 	cbz	x2, 80044 <.bss_done>

0000000000080038 <.bss_zero_loop>:
   80038:	a8817c1f 	stp	xzr, xzr, [x0], #16
   8003c:	d1000442 	sub	x2, x2, #0x1
   80040:	b5ffffc2 	cbnz	x2, 80038 <.bss_zero_loop>

0000000000080044 <.bss_done>:
   80044:	9400000b 	bl	80070 <__switch_el2_to_el1>
   80048:	10023dc0 	adr	x0, 84800 <__ExceptionVectorTable>
   8004c:	d518c000 	msr	vbar_el1, x0
   80050:	d5381041 	mrs	x1, cpacr_el1
   80054:	d2a00600 	mov	x0, #0x300000              	// #3145728
   80058:	aa000020 	orr	x0, x1, x0
   8005c:	d5181040 	msr	cpacr_el1, x0
   80060:	d53800a0 	mrs	x0, mpidr_el1
   80064:	92400400 	and	x0, x0, #0x3
   80068:	14001556 	b	855c0 <__rust_entry>
   8006c:	14000e3d 	b	83960 <__hang>

0000000000080070 <__switch_el2_to_el1>:
   80070:	d5384240 	mrs	x0, currentel
   80074:	f100101f 	cmp	x0, #0x4
   80078:	54000240 	b.eq	800c0 <.SwitchReturn>  // b.none
   8007c:	d518101f 	msr	sctlr_el1, xzr
   80080:	d2b00000 	mov	x0, #0x80000000            	// #2147483648
   80084:	b27f0000 	orr	x0, x0, #0x2
   80088:	d51c1100 	msr	hcr_el2, x0
   8008c:	d53c1100 	mrs	x0, hcr_el2
   80090:	d53ce102 	mrs	x2, cnthctl_el2
   80094:	b2400442 	orr	x2, x2, #0x3
   80098:	d51ce102 	msr	cnthctl_el2, x2
   8009c:	d51ce07f 	msr	cntvoff_el2, xzr
   800a0:	d28078a2 	mov	x2, #0x3c5                 	// #965
   800a4:	d51c4002 	msr	spsr_el2, x2
   800a8:	d53c1100 	mrs	x0, hcr_el2
   800ac:	927af000 	and	x0, x0, #0xffffffffffffffc7
   800b0:	d51c1100 	msr	hcr_el2, x0
   800b4:	10000061 	adr	x1, 800c0 <.SwitchReturn>
   800b8:	d51c4021 	msr	elr_el2, x1
   800bc:	d69f03e0 	eret

00000000000800c0 <.SwitchReturn>:
   800c0:	58000281 	ldr	x1, 80110 <.SwitchReturn+0x50>
   800c4:	d53800a0 	mrs	x0, mpidr_el1
   800c8:	92400400 	and	x0, x0, #0x3
   800cc:	580000e2 	ldr	x2, 800e8 <.SwitchReturn+0x28>
   800d0:	58000103 	ldr	x3, 800f0 <.SwitchReturn+0x30>
   800d4:	eb030042 	subs	x2, x2, x3
   800d8:	9b007c42 	mul	x2, x2, x0
   800dc:	cb020020 	sub	x0, x1, x2
   800e0:	9100001f 	mov	sp, x0
   800e4:	d65f03c0 	ret
   800e8:	000c8640 	.inst	0x000c8640 ; undefined
   800ec:	00000000 	.inst	0x00000000 ; undefined
   800f0:	000b8640 	.inst	0x000b8640 ; undefined
   800f4:	00000000 	.inst	0x00000000 ; undefined
   800f8:	000b9640 	.inst	0x000b9640 ; undefined
   800fc:	00000000 	.inst	0x00000000 ; undefined
   80100:	00086f08 	.inst	0x00086f08 ; undefined
   80104:	00000000 	.inst	0x00000000 ; undefined
   80108:	00087060 	.inst	0x00087060 ; undefined
   8010c:	00000000 	.inst	0x00000000 ; undefined
   80110:	000c7640 	.inst	0x000c7640 ; undefined
	...

0000000000080120 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h76db65d4af4c7553E>:
   80120:	a9bd5ffe 	stp	x30, x23, [sp, #-48]!
   80124:	a9024ff4 	stp	x20, x19, [sp, #32]
   80128:	f9400013 	ldr	x19, [x0]
   8012c:	a90157f6 	stp	x22, x21, [sp, #16]
   80130:	d5033fbf 	dmb	sy
   80134:	91004275 	add	x21, x19, #0x10
   80138:	91006276 	add	x22, x19, #0x18
   8013c:	c85ffec0 	ldaxr	x0, [x22]
   80140:	c808fedf 	stlxr	w8, xzr, [x22]
   80144:	35ffffc8 	cbnz	w8, 8013c <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h76db65d4af4c7553E+0x1c>
   80148:	d5033f9f 	dsb	sy
   8014c:	b4000520 	cbz	x0, 801f0 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h76db65d4af4c7553E+0xd0>
   80150:	c85ffea8 	ldaxr	x8, [x21]
   80154:	eb00011f 	cmp	x8, x0
   80158:	540000e1 	b.ne	80174 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h76db65d4af4c7553E+0x54>  // b.any
   8015c:	c808febf 	stlxr	w8, xzr, [x21]
   80160:	35ffff88 	cbnz	w8, 80150 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h76db65d4af4c7553E+0x30>
   80164:	d5033f9f 	dsb	sy
   80168:	c8dffc08 	ldar	x8, [x0]
   8016c:	b50000c8 	cbnz	x8, 80184 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h76db65d4af4c7553E+0x64>
   80170:	1400000c 	b	801a0 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h76db65d4af4c7553E+0x80>
   80174:	d5033f5f 	clrex
   80178:	d5033f9f 	dsb	sy
   8017c:	c8dffc08 	ldar	x8, [x0]
   80180:	b4000108 	cbz	x8, 801a0 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h76db65d4af4c7553E+0x80>
   80184:	c85ffec9 	ldaxr	x9, [x22]
   80188:	b5000089 	cbnz	x9, 80198 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h76db65d4af4c7553E+0x78>
   8018c:	c809fec8 	stlxr	w9, x8, [x22]
   80190:	35ffffa9 	cbnz	w9, 80184 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h76db65d4af4c7553E+0x64>
   80194:	14000002 	b	8019c <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h76db65d4af4c7553E+0x7c>
   80198:	d5033f5f 	clrex
   8019c:	d5033f9f 	dsb	sy
   801a0:	f9400414 	ldr	x20, [x0, #8]
   801a4:	b40004f4 	cbz	x20, 80240 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h76db65d4af4c7553E+0x120>
   801a8:	f9400817 	ldr	x23, [x0, #16]
   801ac:	52800401 	mov	w1, #0x20                  	// #32
   801b0:	52800202 	mov	w2, #0x10                  	// #16
   801b4:	9400005b 	bl	80320 <__rust_dealloc>
   801b8:	f94002e8 	ldr	x8, [x23]
   801bc:	aa1403e0 	mov	x0, x20
   801c0:	d63f0100 	blr	x8
   801c4:	f94006e1 	ldr	x1, [x23, #8]
   801c8:	b4000081 	cbz	x1, 801d8 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h76db65d4af4c7553E+0xb8>
   801cc:	f9400ae2 	ldr	x2, [x23, #16]
   801d0:	aa1403e0 	mov	x0, x20
   801d4:	94000053 	bl	80320 <__rust_dealloc>
   801d8:	d5033fbf 	dmb	sy
   801dc:	c85ffec0 	ldaxr	x0, [x22]
   801e0:	c808fedf 	stlxr	w8, xzr, [x22]
   801e4:	35ffffc8 	cbnz	w8, 801dc <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h76db65d4af4c7553E+0xbc>
   801e8:	d5033f9f 	dsb	sy
   801ec:	b5fffb20 	cbnz	x0, 80150 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h76db65d4af4c7553E+0x30>
   801f0:	b100067f 	cmn	x19, #0x1
   801f4:	540001e0 	b.eq	80230 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h76db65d4af4c7553E+0x110>  // b.none
   801f8:	91002268 	add	x8, x19, #0x8
   801fc:	c85f7d09 	ldxr	x9, [x8]
   80200:	f1000529 	subs	x9, x9, #0x1
   80204:	c80afd09 	stlxr	w10, x9, [x8]
   80208:	35ffffaa 	cbnz	w10, 801fc <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h76db65d4af4c7553E+0xdc>
   8020c:	54000121 	b.ne	80230 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h76db65d4af4c7553E+0x110>  // b.any
   80210:	d50339bf 	dmb	ishld
   80214:	aa1303e0 	mov	x0, x19
   80218:	a9424ff4 	ldp	x20, x19, [sp, #32]
   8021c:	52800401 	mov	w1, #0x20                  	// #32
   80220:	52800102 	mov	w2, #0x8                   	// #8
   80224:	a94157f6 	ldp	x22, x21, [sp, #16]
   80228:	a8c35ffe 	ldp	x30, x23, [sp], #48
   8022c:	1400003d 	b	80320 <__rust_dealloc>
   80230:	a9424ff4 	ldp	x20, x19, [sp, #32]
   80234:	a94157f6 	ldp	x22, x21, [sp, #16]
   80238:	a8c35ffe 	ldp	x30, x23, [sp], #48
   8023c:	d65f03c0 	ret
   80240:	b0000020 	adrp	x0, 85000 <__exception_handler_default>
   80244:	f0000022 	adrp	x2, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   80248:	91221800 	add	x0, x0, #0x886
   8024c:	52800561 	mov	w1, #0x2b                  	// #43
   80250:	91018042 	add	x2, x2, #0x60
   80254:	94000817 	bl	822b0 <_ZN4core9panicking5panic17h1276bf0d71dbfb98E>
   80258:	d4200020 	brk	#0x1
   8025c:	00000000 	.inst	0x00000000 ; undefined

0000000000080260 <_ZN6kernel3run17h851f38d9324f6dafE>:
   80260:	350001e0 	cbnz	w0, 8029c <_ZN6kernel3run17h851f38d9324f6dafE+0x3c>
   80264:	f81f0ffe 	str	x30, [sp, #-16]!
   80268:	b0000028 	adrp	x8, 85000 <__exception_handler_default>
   8026c:	b0000029 	adrp	x9, 85000 <__exception_handler_default>
   80270:	52a0006a 	mov	w10, #0x30000               	// #196608
   80274:	5280544b 	mov	w11, #0x2a2                 	// #674
   80278:	52800800 	mov	w0, #0x40                  	// #64
   8027c:	aa1f03e1 	mov	x1, xzr
   80280:	f9445d08 	ldr	x8, [x8, #2232]
   80284:	f944a129 	ldr	x9, [x9, #2368]
   80288:	b900010a 	str	w10, [x8]
   8028c:	b900012b 	str	w11, [x9]
   80290:	9400004c 	bl	803c0 <_ZN17ruspiro_interrupt8activate17h2db9568096015147E>
   80294:	94000043 	bl	803a0 <_ZN17ruspiro_interrupt17enable_interrupts17hffb47f8754d6d291E>
   80298:	f84107fe 	ldr	x30, [sp], #16
   8029c:	14000000 	b	8029c <_ZN6kernel3run17h851f38d9324f6dafE+0x3c>

00000000000802a0 <__kernel_startup>:
   802a0:	71000c1f 	cmp	w0, #0x3
   802a4:	540000a8 	b.hi	802b8 <__kernel_startup+0x18>  // b.pmore
   802a8:	b0000028 	adrp	x8, 85000 <__exception_handler_default>
   802ac:	91260108 	add	x8, x8, #0x980
   802b0:	b860d900 	ldr	w0, [x8, w0, sxtw #2]
   802b4:	1400001f 	b	80330 <lit_debug_led>
   802b8:	d65f03c0 	ret
   802bc:	00000000 	.inst	0x00000000 ; undefined

00000000000802c0 <__kernel_run>:
   802c0:	97ffffe8 	bl	80260 <_ZN6kernel3run17h851f38d9324f6dafE>
   802c4:	d4200020 	brk	#0x1
	...

00000000000802d0 <__irq_handler__ArmTimer>:
   802d0:	a9bf03fe 	stp	x30, x0, [sp, #-16]!
   802d4:	b0000028 	adrp	x8, 85000 <__exception_handler_default>
   802d8:	52800029 	mov	w9, #0x1                   	// #1
   802dc:	f9447508 	ldr	x8, [x8, #2280]
   802e0:	b9000109 	str	w9, [x8]
   802e4:	f94007e8 	ldr	x8, [sp, #8]
   802e8:	b4000128 	cbz	x8, 8030c <__irq_handler__ArmTimer+0x3c>
   802ec:	c85f7d09 	ldxr	x9, [x8]
   802f0:	f1000529 	subs	x9, x9, #0x1
   802f4:	c80afd09 	stlxr	w10, x9, [x8]
   802f8:	35ffffaa 	cbnz	w10, 802ec <__irq_handler__ArmTimer+0x1c>
   802fc:	54000081 	b.ne	8030c <__irq_handler__ArmTimer+0x3c>  // b.any
   80300:	910023e0 	add	x0, sp, #0x8
   80304:	d50339bf 	dmb	ishld
   80308:	97ffff86 	bl	80120 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h76db65d4af4c7553E>
   8030c:	f84107fe 	ldr	x30, [sp], #16
   80310:	d65f03c0 	ret
	...

0000000000080320 <__rust_dealloc>:
   80320:	14000288 	b	80d40 <__rg_dealloc>
	...

0000000000080330 <lit_debug_led>:
   80330:	529999a8 	mov	w8, #0xcccd                	// #52429
   80334:	52800149 	mov	w9, #0xa                   	// #10
   80338:	72b99988 	movk	w8, #0xcccc, lsl #16
   8033c:	52a7e40a 	mov	w10, #0x3f200000            	// #1059061760
   80340:	528000ec 	mov	w12, #0x7                   	// #7
   80344:	5280002d 	mov	w13, #0x1                   	// #1
   80348:	9ba87c08 	umull	x8, w0, w8
   8034c:	d363fd08 	lsr	x8, x8, #35
   80350:	d37ef50b 	lsl	x11, x8, #2
   80354:	1b098108 	msub	w8, w8, w9, w0
   80358:	b86a6969 	ldr	w9, [x11, x10]
   8035c:	0b080508 	add	w8, w8, w8, lsl #1
   80360:	1ac8218c 	lsl	w12, w12, w8
   80364:	0a2c0129 	bic	w9, w9, w12
   80368:	1ac821a8 	lsl	w8, w13, w8
   8036c:	2a0003ec 	mov	w12, w0
   80370:	2a080128 	orr	w8, w9, w8
   80374:	52800389 	mov	w9, #0x1c                  	// #28
   80378:	72a7e409 	movk	w9, #0x3f20, lsl #16
   8037c:	d345fd8c 	lsr	x12, x12, #5
   80380:	1ac021ad 	lsl	w13, w13, w0
   80384:	b82a6968 	str	w8, [x11, x10]
   80388:	b829698d 	str	w13, [x12, x9]
   8038c:	d65f03c0 	ret

0000000000080390 <_ZN4core3ptr44drop_in_place$LT$core..cell..BorrowError$GT$17h34d226d08f2836d5E>:
   80390:	d65f03c0 	ret
	...

00000000000803a0 <_ZN17ruspiro_interrupt17enable_interrupts17hffb47f8754d6d291E>:
   803a0:	d50342ff 	msr	daifclr, #0x2
   803a4:	d5033fdf 	isb
   803a8:	d50341ff 	msr	daifclr, #0x1
   803ac:	d5033fdf 	isb
   803b0:	d65f03c0 	ret
	...

00000000000803c0 <_ZN17ruspiro_interrupt8activate17h2db9568096015147E>:
   803c0:	d10103ff 	sub	sp, sp, #0x40
   803c4:	12001c08 	and	w8, w0, #0xff
   803c8:	f9000bfe 	str	x30, [sp, #16]
   803cc:	7100751f 	cmp	w8, #0x1d
   803d0:	a90257f6 	stp	x22, x21, [sp, #32]
   803d4:	a9034ff4 	stp	x20, x19, [sp, #48]
   803d8:	54000720 	b.eq	804bc <_ZN17ruspiro_interrupt8activate17h2db9568096015147E+0xfc>  // b.none
   803dc:	aa0103f4 	mov	x20, x1
   803e0:	2a0003f3 	mov	w19, w0
   803e4:	12001008 	and	w8, w0, #0x1f
   803e8:	910073e9 	add	x9, sp, #0x1c
   803ec:	b9001fe8 	str	w8, [sp, #28]
   803f0:	a90007e9 	stp	x9, x1, [sp]
   803f4:	373804e0 	tbnz	w0, #7, 80490 <_ZN17ruspiro_interrupt8activate17h2db9568096015147E+0xd0>
   803f8:	5280600b 	mov	w11, #0x300                 	// #768
   803fc:	f000002a 	adrp	x10, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   80400:	53051e69 	ubfx	w9, w19, #5, #3
   80404:	9104014a 	add	x10, x10, #0x100
   80408:	9bab292b 	umaddl	x11, w9, w11, x10
   8040c:	5280030c 	mov	w12, #0x18                  	// #24
   80410:	9bac2d16 	umaddl	x22, w8, w12, x11
   80414:	f8408ecb 	ldr	x11, [x22, #8]!
   80418:	b500060b 	cbnz	x11, 804d8 <_ZN17ruspiro_interrupt8activate17h2db9568096015147E+0x118>
   8041c:	5280600b 	mov	w11, #0x300                 	// #768
   80420:	2a0803e8 	mov	w8, w8
   80424:	5280030c 	mov	w12, #0x18                  	// #24
   80428:	9b0b2929 	madd	x9, x9, x11, x10
   8042c:	9b0c2515 	madd	x21, x8, x12, x9
   80430:	92800009 	mov	x9, #0xffffffffffffffff    	// #-1
   80434:	f90002c9 	str	x9, [x22]
   80438:	f8410ea8 	ldr	x8, [x21, #16]!
   8043c:	b4000128 	cbz	x8, 80460 <_ZN17ruspiro_interrupt8activate17h2db9568096015147E+0xa0>
   80440:	c85f7d09 	ldxr	x9, [x8]
   80444:	f1000529 	subs	x9, x9, #0x1
   80448:	c80afd09 	stlxr	w10, x9, [x8]
   8044c:	35ffffaa 	cbnz	w10, 80440 <_ZN17ruspiro_interrupt8activate17h2db9568096015147E+0x80>
   80450:	54000081 	b.ne	80460 <_ZN17ruspiro_interrupt8activate17h2db9568096015147E+0xa0>  // b.any
   80454:	aa1503e0 	mov	x0, x21
   80458:	d50339bf 	dmb	ishld
   8045c:	940001e9 	bl	80c00 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hb5bb0a9b365095d0E>
   80460:	f94002c8 	ldr	x8, [x22]
   80464:	f90002b4 	str	x20, [x21]
   80468:	91000508 	add	x8, x8, #0x1
   8046c:	f90002c8 	str	x8, [x22]
   80470:	2a1303e0 	mov	w0, w19
   80474:	94000127 	bl	80910 <_ZN17ruspiro_interrupt9interface8activate17h19c53e70a7655767E>
   80478:	d5033fbf 	dmb	sy
   8047c:	f9400bfe 	ldr	x30, [sp, #16]
   80480:	a9434ff4 	ldp	x20, x19, [sp, #48]
   80484:	a94257f6 	ldp	x22, x21, [sp, #32]
   80488:	910103ff 	add	sp, sp, #0x40
   8048c:	d65f03c0 	ret
   80490:	b4ffff14 	cbz	x20, 80470 <_ZN17ruspiro_interrupt8activate17h2db9568096015147E+0xb0>
   80494:	910003e8 	mov	x8, sp
   80498:	b27d0100 	orr	x0, x8, #0x8
   8049c:	c85f7e88 	ldxr	x8, [x20]
   804a0:	f1000508 	subs	x8, x8, #0x1
   804a4:	c809fe88 	stlxr	w9, x8, [x20]
   804a8:	35ffffa9 	cbnz	w9, 8049c <_ZN17ruspiro_interrupt8activate17h2db9568096015147E+0xdc>
   804ac:	54fffe21 	b.ne	80470 <_ZN17ruspiro_interrupt8activate17h2db9568096015147E+0xb0>  // b.any
   804b0:	d50339bf 	dmb	ishld
   804b4:	940001d3 	bl	80c00 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hb5bb0a9b365095d0E>
   804b8:	17ffffee 	b	80470 <_ZN17ruspiro_interrupt8activate17h2db9568096015147E+0xb0>
   804bc:	b0000020 	adrp	x0, 85000 <__exception_handler_default>
   804c0:	f0000022 	adrp	x2, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   804c4:	9127a000 	add	x0, x0, #0x9e8
   804c8:	528006a1 	mov	w1, #0x35                  	// #53
   804cc:	9102e042 	add	x2, x2, #0xb8
   804d0:	94000778 	bl	822b0 <_ZN4core9panicking5panic17h1276bf0d71dbfb98E>
   804d4:	d4200020 	brk	#0x1
   804d8:	b0000020 	adrp	x0, 85000 <__exception_handler_default>
   804dc:	f0000023 	adrp	x3, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   804e0:	f0000024 	adrp	x4, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   804e4:	9126c000 	add	x0, x0, #0x9b0
   804e8:	91026063 	add	x3, x3, #0x98
   804ec:	91034084 	add	x4, x4, #0xd0
   804f0:	910063e2 	add	x2, sp, #0x18
   804f4:	52800201 	mov	w1, #0x10                  	// #16
   804f8:	940005d6 	bl	81c50 <_ZN4core6result13unwrap_failed17hc96e1f395f9c9207E>
   804fc:	d4200020 	brk	#0x1

0000000000080500 <__isr_default>:
   80500:	d10243ff 	sub	sp, sp, #0x90
   80504:	b0000028 	adrp	x8, 85000 <__exception_handler_default>
   80508:	b0000029 	adrp	x9, 85000 <__exception_handler_default>
   8050c:	b000002a 	adrp	x10, 85000 <__exception_handler_default>
   80510:	b000002b 	adrp	x11, 85000 <__exception_handler_default>
   80514:	b000002c 	adrp	x12, 85000 <__exception_handler_default>
   80518:	b000002d 	adrp	x13, 85000 <__exception_handler_default>
   8051c:	f9446908 	ldr	x8, [x8, #2256]
   80520:	f944bd29 	ldr	x9, [x9, #2424]
   80524:	f9446d4a 	ldr	x10, [x10, #2264]
   80528:	f944a56b 	ldr	x11, [x11, #2376]
   8052c:	f944858c 	ldr	x12, [x12, #2312]
   80530:	a9037bfd 	stp	x29, x30, [sp, #48]
   80534:	a9046ffc 	stp	x28, x27, [sp, #64]
   80538:	a90567fa 	stp	x26, x25, [sp, #80]
   8053c:	a9065ff8 	stp	x24, x23, [sp, #96]
   80540:	a90757f6 	stp	x22, x21, [sp, #112]
   80544:	a9084ff4 	stp	x20, x19, [sp, #128]
   80548:	f0000033 	adrp	x19, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   8054c:	b9400108 	ldr	w8, [x8]
   80550:	91040273 	add	x19, x19, #0x100
   80554:	b9400129 	ldr	w9, [x9]
   80558:	b9400154 	ldr	w20, [x10]
   8055c:	b000002a 	adrp	x10, 85000 <__exception_handler_default>
   80560:	b9400175 	ldr	w21, [x11]
   80564:	b000002b 	adrp	x11, 85000 <__exception_handler_default>
   80568:	b940019c 	ldr	w28, [x12]
   8056c:	b000002c 	adrp	x12, 85000 <__exception_handler_default>
   80570:	f9447dad 	ldr	x13, [x13, #2296]
   80574:	f944794a 	ldr	x10, [x10, #2288]
   80578:	f9448d6b 	ldr	x11, [x11, #2328]
   8057c:	f9449d8c 	ldr	x12, [x12, #2360]
   80580:	b94001bd 	ldr	w29, [x13]
   80584:	b000002d 	adrp	x13, 85000 <__exception_handler_default>
   80588:	b940014f 	ldr	w15, [x10]
   8058c:	b940017b 	ldr	w27, [x11]
   80590:	b940018e 	ldr	w14, [x12]
   80594:	f94495ad 	ldr	x13, [x13, #2344]
   80598:	b90017ee 	str	w14, [sp, #20]
   8059c:	b94001ae 	ldr	w14, [x13]
   805a0:	b940014a 	ldr	w10, [x10]
   805a4:	2901abef 	stp	w15, w10, [sp, #12]
   805a8:	b940016a 	ldr	w10, [x11]
   805ac:	29032bee 	stp	w14, w10, [sp, #24]
   805b0:	b940018b 	ldr	w11, [x12]
   805b4:	b94001aa 	ldr	w10, [x13]
   805b8:	29042beb 	stp	w11, w10, [sp, #32]
   805bc:	6a08012a 	ands	w10, w9, w8
   805c0:	540004c0 	b.eq	80658 <__isr_default+0x158>  // b.none
   805c4:	5ac00148 	rbit	w8, w10
   805c8:	52800316 	mov	w22, #0x18                  	// #24
   805cc:	5ac01108 	clz	w8, w8
   805d0:	b27ff7eb 	mov	x11, #0x7ffffffffffffffe    	// #9223372036854775806
   805d4:	9bb64d17 	umaddl	x23, w8, w22, x19
   805d8:	f8408ee9 	ldr	x9, [x23, #8]!
   805dc:	eb0b013f 	cmp	x9, x11
   805e0:	54001568 	b.hi	8088c <__isr_default+0x38c>  // b.pmore
   805e4:	52800038 	mov	w24, #0x1                   	// #1
   805e8:	92f0001a 	mov	x26, #0x7fffffffffffffff    	// #9223372036854775807
   805ec:	1ac8230b 	lsl	w11, w24, w8
   805f0:	0a2b0159 	bic	w25, w10, w11
   805f4:	9b164d08 	madd	x8, x8, x22, x19
   805f8:	91000529 	add	x9, x9, #0x1
   805fc:	f90002e9 	str	x9, [x23]
   80600:	f9400900 	ldr	x0, [x8, #16]
   80604:	f9400108 	ldr	x8, [x8]
   80608:	b40000c0 	cbz	x0, 80620 <__isr_default+0x120>
   8060c:	c85f7c09 	ldxr	x9, [x0]
   80610:	9100052a 	add	x10, x9, #0x1
   80614:	c80b7c0a 	stxr	w11, x10, [x0]
   80618:	35ffffab 	cbnz	w11, 8060c <__isr_default+0x10c>
   8061c:	b7f815c9 	tbnz	x9, #63, 808d4 <__isr_default+0x3d4>
   80620:	d63f0100 	blr	x8
   80624:	f94002e8 	ldr	x8, [x23]
   80628:	d1000508 	sub	x8, x8, #0x1
   8062c:	f90002e8 	str	x8, [x23]
   80630:	34000159 	cbz	w25, 80658 <__isr_default+0x158>
   80634:	5ac00328 	rbit	w8, w25
   80638:	5ac01108 	clz	w8, w8
   8063c:	9bb64d17 	umaddl	x23, w8, w22, x19
   80640:	1ac8230a 	lsl	w10, w24, w8
   80644:	0a2a0339 	bic	w25, w25, w10
   80648:	f8408ee9 	ldr	x9, [x23, #8]!
   8064c:	eb1a013f 	cmp	x9, x26
   80650:	54fffd23 	b.cc	805f4 <__isr_default+0xf4>  // b.lo, b.ul, b.last
   80654:	1400008e 	b	8088c <__isr_default+0x38c>
   80658:	0a1402aa 	and	w10, w21, w20
   8065c:	3400050a 	cbz	w10, 806fc <__isr_default+0x1fc>
   80660:	5ac00148 	rbit	w8, w10
   80664:	52800314 	mov	w20, #0x18                  	// #24
   80668:	5ac01108 	clz	w8, w8
   8066c:	b27ff7ec 	mov	x12, #0x7ffffffffffffffe    	// #9223372036854775806
   80670:	9bb44d0b 	umaddl	x11, w8, w20, x19
   80674:	f9418569 	ldr	x9, [x11, #776]
   80678:	eb0c013f 	cmp	x9, x12
   8067c:	54001088 	b.hi	8088c <__isr_default+0x38c>  // b.pmore
   80680:	52800035 	mov	w21, #0x1                   	// #1
   80684:	910c2178 	add	x24, x11, #0x308
   80688:	1ac822ab 	lsl	w11, w21, w8
   8068c:	0a2b0156 	bic	w22, w10, w11
   80690:	92f00017 	mov	x23, #0x7fffffffffffffff    	// #9223372036854775807
   80694:	9b144d08 	madd	x8, x8, x20, x19
   80698:	91000529 	add	x9, x9, #0x1
   8069c:	f9000309 	str	x9, [x24]
   806a0:	f9418900 	ldr	x0, [x8, #784]
   806a4:	f9418108 	ldr	x8, [x8, #768]
   806a8:	b40000c0 	cbz	x0, 806c0 <__isr_default+0x1c0>
   806ac:	c85f7c09 	ldxr	x9, [x0]
   806b0:	9100052a 	add	x10, x9, #0x1
   806b4:	c80b7c0a 	stxr	w11, x10, [x0]
   806b8:	35ffffab 	cbnz	w11, 806ac <__isr_default+0x1ac>
   806bc:	b7f810c9 	tbnz	x9, #63, 808d4 <__isr_default+0x3d4>
   806c0:	d63f0100 	blr	x8
   806c4:	f9400308 	ldr	x8, [x24]
   806c8:	d1000508 	sub	x8, x8, #0x1
   806cc:	f9000308 	str	x8, [x24]
   806d0:	34000176 	cbz	w22, 806fc <__isr_default+0x1fc>
   806d4:	5ac002c8 	rbit	w8, w22
   806d8:	5ac01108 	clz	w8, w8
   806dc:	9bb44d0a 	umaddl	x10, w8, w20, x19
   806e0:	1ac822a9 	lsl	w9, w21, w8
   806e4:	0a2902d6 	bic	w22, w22, w9
   806e8:	910c2158 	add	x24, x10, #0x308
   806ec:	f9418549 	ldr	x9, [x10, #776]
   806f0:	eb17013f 	cmp	x9, x23
   806f4:	54fffd03 	b.cc	80694 <__isr_default+0x194>  // b.lo, b.ul, b.last
   806f8:	14000065 	b	8088c <__isr_default+0x38c>
   806fc:	0a1c03aa 	and	w10, w29, w28
   80700:	3400050a 	cbz	w10, 807a0 <__isr_default+0x2a0>
   80704:	5ac00148 	rbit	w8, w10
   80708:	52800314 	mov	w20, #0x18                  	// #24
   8070c:	5ac01108 	clz	w8, w8
   80710:	b27ff7ec 	mov	x12, #0x7ffffffffffffffe    	// #9223372036854775806
   80714:	9bb44d0b 	umaddl	x11, w8, w20, x19
   80718:	f9430569 	ldr	x9, [x11, #1544]
   8071c:	eb0c013f 	cmp	x9, x12
   80720:	54000b68 	b.hi	8088c <__isr_default+0x38c>  // b.pmore
   80724:	52800035 	mov	w21, #0x1                   	// #1
   80728:	91182178 	add	x24, x11, #0x608
   8072c:	1ac822ab 	lsl	w11, w21, w8
   80730:	0a2b0156 	bic	w22, w10, w11
   80734:	92f00017 	mov	x23, #0x7fffffffffffffff    	// #9223372036854775807
   80738:	9b144d08 	madd	x8, x8, x20, x19
   8073c:	91000529 	add	x9, x9, #0x1
   80740:	f9000309 	str	x9, [x24]
   80744:	f9430900 	ldr	x0, [x8, #1552]
   80748:	f9430108 	ldr	x8, [x8, #1536]
   8074c:	b40000c0 	cbz	x0, 80764 <__isr_default+0x264>
   80750:	c85f7c09 	ldxr	x9, [x0]
   80754:	9100052a 	add	x10, x9, #0x1
   80758:	c80b7c0a 	stxr	w11, x10, [x0]
   8075c:	35ffffab 	cbnz	w11, 80750 <__isr_default+0x250>
   80760:	b7f80ba9 	tbnz	x9, #63, 808d4 <__isr_default+0x3d4>
   80764:	d63f0100 	blr	x8
   80768:	f9400308 	ldr	x8, [x24]
   8076c:	d1000508 	sub	x8, x8, #0x1
   80770:	f9000308 	str	x8, [x24]
   80774:	34000176 	cbz	w22, 807a0 <__isr_default+0x2a0>
   80778:	5ac002c8 	rbit	w8, w22
   8077c:	5ac01108 	clz	w8, w8
   80780:	9bb44d0a 	umaddl	x10, w8, w20, x19
   80784:	1ac822a9 	lsl	w9, w21, w8
   80788:	0a2902d6 	bic	w22, w22, w9
   8078c:	91182158 	add	x24, x10, #0x608
   80790:	f9430549 	ldr	x9, [x10, #1544]
   80794:	eb17013f 	cmp	x9, x23
   80798:	54fffd03 	b.cc	80738 <__isr_default+0x238>  // b.lo, b.ul, b.last
   8079c:	1400003c 	b	8088c <__isr_default+0x38c>
   807a0:	2941a7e8 	ldp	w8, w9, [sp, #12]
   807a4:	b94017ea 	ldr	w10, [sp, #20]
   807a8:	2a080368 	orr	w8, w27, w8
   807ac:	53037d29 	lsr	w9, w9, #3
   807b0:	121c0129 	and	w9, w9, #0x10
   807b4:	2a0a0108 	orr	w8, w8, w10
   807b8:	b9401bea 	ldr	w10, [sp, #24]
   807bc:	2a0a0108 	orr	w8, w8, w10
   807c0:	12186d08 	and	w8, w8, #0xffffff0f
   807c4:	2a080128 	orr	w8, w9, w8
   807c8:	2943a7ea 	ldp	w10, w9, [sp, #28]
   807cc:	53027d4a 	lsr	w10, w10, #2
   807d0:	121b014a 	and	w10, w10, #0x20
   807d4:	53017d29 	lsr	w9, w9, #1
   807d8:	2a0a0108 	orr	w8, w8, w10
   807dc:	121a0129 	and	w9, w9, #0x40
   807e0:	2a090108 	orr	w8, w8, w9
   807e4:	b94027e9 	ldr	w9, [sp, #36]
   807e8:	12190129 	and	w9, w9, #0x80
   807ec:	2a09010a 	orr	w10, w8, w9
   807f0:	3400062a 	cbz	w10, 808b4 <__isr_default+0x3b4>
   807f4:	5ac00148 	rbit	w8, w10
   807f8:	52800314 	mov	w20, #0x18                  	// #24
   807fc:	5ac01108 	clz	w8, w8
   80800:	b27ff7ec 	mov	x12, #0x7ffffffffffffffe    	// #9223372036854775806
   80804:	9bb44d0b 	umaddl	x11, w8, w20, x19
   80808:	f9448569 	ldr	x9, [x11, #2312]
   8080c:	eb0c013f 	cmp	x9, x12
   80810:	540003e8 	b.hi	8088c <__isr_default+0x38c>  // b.pmore
   80814:	52800035 	mov	w21, #0x1                   	// #1
   80818:	91242178 	add	x24, x11, #0x908
   8081c:	1ac822ab 	lsl	w11, w21, w8
   80820:	0a2b0156 	bic	w22, w10, w11
   80824:	92f00017 	mov	x23, #0x7fffffffffffffff    	// #9223372036854775807
   80828:	9b144d08 	madd	x8, x8, x20, x19
   8082c:	91000529 	add	x9, x9, #0x1
   80830:	f9000309 	str	x9, [x24]
   80834:	f9448900 	ldr	x0, [x8, #2320]
   80838:	f9448108 	ldr	x8, [x8, #2304]
   8083c:	b40000c0 	cbz	x0, 80854 <__isr_default+0x354>
   80840:	c85f7c09 	ldxr	x9, [x0]
   80844:	9100052a 	add	x10, x9, #0x1
   80848:	c80b7c0a 	stxr	w11, x10, [x0]
   8084c:	35ffffab 	cbnz	w11, 80840 <__isr_default+0x340>
   80850:	b7f80429 	tbnz	x9, #63, 808d4 <__isr_default+0x3d4>
   80854:	d63f0100 	blr	x8
   80858:	f9400308 	ldr	x8, [x24]
   8085c:	d1000508 	sub	x8, x8, #0x1
   80860:	f9000308 	str	x8, [x24]
   80864:	34000296 	cbz	w22, 808b4 <__isr_default+0x3b4>
   80868:	5ac002c8 	rbit	w8, w22
   8086c:	5ac01108 	clz	w8, w8
   80870:	9bb44d0a 	umaddl	x10, w8, w20, x19
   80874:	1ac822a9 	lsl	w9, w21, w8
   80878:	0a2902d6 	bic	w22, w22, w9
   8087c:	91242158 	add	x24, x10, #0x908
   80880:	f9448549 	ldr	x9, [x10, #2312]
   80884:	eb17013f 	cmp	x9, x23
   80888:	54fffd03 	b.cc	80828 <__isr_default+0x328>  // b.lo, b.ul, b.last
   8088c:	b0000020 	adrp	x0, 85000 <__exception_handler_default>
   80890:	f0000023 	adrp	x3, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   80894:	f0000024 	adrp	x4, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   80898:	91274000 	add	x0, x0, #0x9d0
   8089c:	9101e063 	add	x3, x3, #0x78
   808a0:	9103a084 	add	x4, x4, #0xe8
   808a4:	9100a3e2 	add	x2, sp, #0x28
   808a8:	52800301 	mov	w1, #0x18                  	// #24
   808ac:	940004e9 	bl	81c50 <_ZN4core6result13unwrap_failed17hc96e1f395f9c9207E>
   808b0:	d4200020 	brk	#0x1
   808b4:	a9484ff4 	ldp	x20, x19, [sp, #128]
   808b8:	a94757f6 	ldp	x22, x21, [sp, #112]
   808bc:	a9465ff8 	ldp	x24, x23, [sp, #96]
   808c0:	a94567fa 	ldp	x26, x25, [sp, #80]
   808c4:	a9446ffc 	ldp	x28, x27, [sp, #64]
   808c8:	a9437bfd 	ldp	x29, x30, [sp, #48]
   808cc:	910243ff 	add	sp, sp, #0x90
   808d0:	d65f03c0 	ret
   808d4:	d4200020 	brk	#0x1
   808d8:	d4200020 	brk	#0x1
   808dc:	00000000 	.inst	0x00000000 ; undefined

00000000000808e0 <__irq_handler_Default>:
   808e0:	a9bf03fe 	stp	x30, x0, [sp, #-16]!
   808e4:	b4000120 	cbz	x0, 80908 <__irq_handler_Default+0x28>
   808e8:	c85f7c08 	ldxr	x8, [x0]
   808ec:	f1000508 	subs	x8, x8, #0x1
   808f0:	c809fc08 	stlxr	w9, x8, [x0]
   808f4:	35ffffa9 	cbnz	w9, 808e8 <__irq_handler_Default+0x8>
   808f8:	54000081 	b.ne	80908 <__irq_handler_Default+0x28>  // b.any
   808fc:	910023e0 	add	x0, sp, #0x8
   80900:	d50339bf 	dmb	ishld
   80904:	940000bf 	bl	80c00 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hb5bb0a9b365095d0E>
   80908:	f84107fe 	ldr	x30, [sp], #16
   8090c:	d65f03c0 	ret

0000000000080910 <_ZN17ruspiro_interrupt9interface8activate17h19c53e70a7655767E>:
   80910:	b000002a 	adrp	x10, 85000 <__exception_handler_default>
   80914:	d3451c09 	ubfx	x9, x0, #5, #3
   80918:	9129f94a 	add	x10, x10, #0xa7e
   8091c:	52800028 	mov	w8, #0x1                   	// #1
   80920:	1ac02108 	lsl	w8, w8, w0
   80924:	1000008b 	adr	x11, 80934 <_ZN17ruspiro_interrupt9interface8activate17h19c53e70a7655767E+0x24>
   80928:	3869694c 	ldrb	w12, [x10, x9]
   8092c:	8b0c096b 	add	x11, x11, x12, lsl #2
   80930:	d61f0160 	br	x11
   80934:	b0000029 	adrp	x9, 85000 <__exception_handler_default>
   80938:	f944bd29 	ldr	x9, [x9, #2424]
   8093c:	b9000128 	str	w8, [x9]
   80940:	d65f03c0 	ret
   80944:	b0000029 	adrp	x9, 85000 <__exception_handler_default>
   80948:	f944a529 	ldr	x9, [x9, #2376]
   8094c:	b9000128 	str	w8, [x9]
   80950:	d65f03c0 	ret
   80954:	b0000029 	adrp	x9, 85000 <__exception_handler_default>
   80958:	f9447d29 	ldr	x9, [x9, #2296]
   8095c:	b9000128 	str	w8, [x9]
   80960:	d65f03c0 	ret
   80964:	12001808 	and	w8, w0, #0x7f
   80968:	51018108 	sub	w8, w8, #0x60
   8096c:	71002d1f 	cmp	w8, #0xb
   80970:	540004e8 	b.hi	80a0c <_ZN17ruspiro_interrupt9interface8activate17h19c53e70a7655767E+0xfc>  // b.pmore
   80974:	b0000029 	adrp	x9, 85000 <__exception_handler_default>
   80978:	912a0929 	add	x9, x9, #0xa82
   8097c:	1000008a 	adr	x10, 8098c <_ZN17ruspiro_interrupt9interface8activate17h19c53e70a7655767E+0x7c>
   80980:	3868692b 	ldrb	w11, [x9, x8]
   80984:	8b0b094a 	add	x10, x10, x11, lsl #2
   80988:	d61f0140 	br	x10
   8098c:	b0000028 	adrp	x8, 85000 <__exception_handler_default>
   80990:	f9446108 	ldr	x8, [x8, #2240]
   80994:	b9400109 	ldr	w9, [x8]
   80998:	32000129 	orr	w9, w9, #0x1
   8099c:	1400001b 	b	80a08 <_ZN17ruspiro_interrupt9interface8activate17h19c53e70a7655767E+0xf8>
   809a0:	b0000028 	adrp	x8, 85000 <__exception_handler_default>
   809a4:	f9446108 	ldr	x8, [x8, #2240]
   809a8:	b9400109 	ldr	w9, [x8]
   809ac:	321f0129 	orr	w9, w9, #0x2
   809b0:	14000016 	b	80a08 <_ZN17ruspiro_interrupt9interface8activate17h19c53e70a7655767E+0xf8>
   809b4:	b0000028 	adrp	x8, 85000 <__exception_handler_default>
   809b8:	f9446108 	ldr	x8, [x8, #2240]
   809bc:	b9400109 	ldr	w9, [x8]
   809c0:	321e0129 	orr	w9, w9, #0x4
   809c4:	14000011 	b	80a08 <_ZN17ruspiro_interrupt9interface8activate17h19c53e70a7655767E+0xf8>
   809c8:	b0000028 	adrp	x8, 85000 <__exception_handler_default>
   809cc:	f9446108 	ldr	x8, [x8, #2240]
   809d0:	1400000c 	b	80a00 <_ZN17ruspiro_interrupt9interface8activate17h19c53e70a7655767E+0xf0>
   809d4:	b0000028 	adrp	x8, 85000 <__exception_handler_default>
   809d8:	f944a908 	ldr	x8, [x8, #2384]
   809dc:	14000009 	b	80a00 <_ZN17ruspiro_interrupt9interface8activate17h19c53e70a7655767E+0xf0>
   809e0:	b0000028 	adrp	x8, 85000 <__exception_handler_default>
   809e4:	f9448108 	ldr	x8, [x8, #2304]
   809e8:	14000006 	b	80a00 <_ZN17ruspiro_interrupt9interface8activate17h19c53e70a7655767E+0xf0>
   809ec:	b0000028 	adrp	x8, 85000 <__exception_handler_default>
   809f0:	f944b108 	ldr	x8, [x8, #2400]
   809f4:	14000003 	b	80a00 <_ZN17ruspiro_interrupt9interface8activate17h19c53e70a7655767E+0xf0>
   809f8:	b0000028 	adrp	x8, 85000 <__exception_handler_default>
   809fc:	f9449908 	ldr	x8, [x8, #2352]
   80a00:	b9400109 	ldr	w9, [x8]
   80a04:	321d0129 	orr	w9, w9, #0x8
   80a08:	b9000109 	str	w9, [x8]
   80a0c:	d65f03c0 	ret
   80a10:	b0000028 	adrp	x8, 85000 <__exception_handler_default>
   80a14:	f944b908 	ldr	x8, [x8, #2416]
   80a18:	b9400109 	ldr	w9, [x8]
   80a1c:	32030129 	orr	w9, w9, #0x20000000
   80a20:	17fffffa 	b	80a08 <_ZN17ruspiro_interrupt9interface8activate17h19c53e70a7655767E+0xf8>
	...

0000000000080a30 <_ZN4core3ptr47drop_in_place$LT$core..cell..BorrowMutError$GT$17h8a103761656e6b5fE.llvm.4895383513194605257>:
   80a30:	d65f03c0 	ret
	...

0000000000080a40 <_ZN17ruspiro_interrupt10auxhandler11aux_handler17h73dfb633eb915ecfE>:
   80a40:	d100c3ff 	sub	sp, sp, #0x30
   80a44:	b0000028 	adrp	x8, 85000 <__exception_handler_default>
   80a48:	a9024ff4 	stp	x20, x19, [sp, #32]
   80a4c:	a900fbe0 	stp	x0, x30, [sp, #8]
   80a50:	aa0003f3 	mov	x19, x0
   80a54:	f9449114 	ldr	x20, [x8, #2336]
   80a58:	b9400288 	ldr	w8, [x20]
   80a5c:	360002a8 	tbz	w8, #0, 80ab0 <_ZN17ruspiro_interrupt10auxhandler11aux_handler17h73dfb633eb915ecfE+0x70>
   80a60:	d0000028 	adrp	x8, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   80a64:	92f0000a 	mov	x10, #0x7fffffffffffffff    	// #9223372036854775807
   80a68:	f9478509 	ldr	x9, [x8, #3848]
   80a6c:	eb0a013f 	cmp	x9, x10
   80a70:	54000962 	b.cs	80b9c <_ZN17ruspiro_interrupt10auxhandler11aux_handler17h73dfb633eb915ecfE+0x15c>  // b.hs, b.nlast
   80a74:	d000002a 	adrp	x10, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   80a78:	91000529 	add	x9, x9, #0x1
   80a7c:	913c214a 	add	x10, x10, #0xf08
   80a80:	f9400540 	ldr	x0, [x10, #8]
   80a84:	f9000149 	str	x9, [x10]
   80a88:	b40000e0 	cbz	x0, 80aa4 <_ZN17ruspiro_interrupt10auxhandler11aux_handler17h73dfb633eb915ecfE+0x64>
   80a8c:	c85f7c09 	ldxr	x9, [x0]
   80a90:	9100052a 	add	x10, x9, #0x1
   80a94:	c80b7c0a 	stxr	w11, x10, [x0]
   80a98:	35ffffab 	cbnz	w11, 80a8c <_ZN17ruspiro_interrupt10auxhandler11aux_handler17h73dfb633eb915ecfE+0x4c>
   80a9c:	b7f807c9 	tbnz	x9, #63, 80b94 <_ZN17ruspiro_interrupt10auxhandler11aux_handler17h73dfb633eb915ecfE+0x154>
   80aa0:	f9478509 	ldr	x9, [x8, #3848]
   80aa4:	d1000529 	sub	x9, x9, #0x1
   80aa8:	f9078509 	str	x9, [x8, #3848]
   80aac:	97ffff8d 	bl	808e0 <__irq_handler_Default>
   80ab0:	b9400288 	ldr	w8, [x20]
   80ab4:	360802a8 	tbz	w8, #1, 80b08 <_ZN17ruspiro_interrupt10auxhandler11aux_handler17h73dfb633eb915ecfE+0xc8>
   80ab8:	d0000028 	adrp	x8, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   80abc:	92f0000a 	mov	x10, #0x7fffffffffffffff    	// #9223372036854775807
   80ac0:	f9478d09 	ldr	x9, [x8, #3864]
   80ac4:	eb0a013f 	cmp	x9, x10
   80ac8:	54000782 	b.cs	80bb8 <_ZN17ruspiro_interrupt10auxhandler11aux_handler17h73dfb633eb915ecfE+0x178>  // b.hs, b.nlast
   80acc:	d000002a 	adrp	x10, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   80ad0:	91000529 	add	x9, x9, #0x1
   80ad4:	913c614a 	add	x10, x10, #0xf18
   80ad8:	f9400540 	ldr	x0, [x10, #8]
   80adc:	f9000149 	str	x9, [x10]
   80ae0:	b40000e0 	cbz	x0, 80afc <_ZN17ruspiro_interrupt10auxhandler11aux_handler17h73dfb633eb915ecfE+0xbc>
   80ae4:	c85f7c09 	ldxr	x9, [x0]
   80ae8:	9100052a 	add	x10, x9, #0x1
   80aec:	c80b7c0a 	stxr	w11, x10, [x0]
   80af0:	35ffffab 	cbnz	w11, 80ae4 <_ZN17ruspiro_interrupt10auxhandler11aux_handler17h73dfb633eb915ecfE+0xa4>
   80af4:	b7f80509 	tbnz	x9, #63, 80b94 <_ZN17ruspiro_interrupt10auxhandler11aux_handler17h73dfb633eb915ecfE+0x154>
   80af8:	f9478d09 	ldr	x9, [x8, #3864]
   80afc:	d1000529 	sub	x9, x9, #0x1
   80b00:	f9078d09 	str	x9, [x8, #3864]
   80b04:	97ffff77 	bl	808e0 <__irq_handler_Default>
   80b08:	b9400288 	ldr	w8, [x20]
   80b0c:	361002a8 	tbz	w8, #2, 80b60 <_ZN17ruspiro_interrupt10auxhandler11aux_handler17h73dfb633eb915ecfE+0x120>
   80b10:	d0000028 	adrp	x8, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   80b14:	92f0000a 	mov	x10, #0x7fffffffffffffff    	// #9223372036854775807
   80b18:	f9479509 	ldr	x9, [x8, #3880]
   80b1c:	eb0a013f 	cmp	x9, x10
   80b20:	540005a2 	b.cs	80bd4 <_ZN17ruspiro_interrupt10auxhandler11aux_handler17h73dfb633eb915ecfE+0x194>  // b.hs, b.nlast
   80b24:	d000002a 	adrp	x10, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   80b28:	91000529 	add	x9, x9, #0x1
   80b2c:	913ca14a 	add	x10, x10, #0xf28
   80b30:	f9400540 	ldr	x0, [x10, #8]
   80b34:	f9000149 	str	x9, [x10]
   80b38:	b40000e0 	cbz	x0, 80b54 <_ZN17ruspiro_interrupt10auxhandler11aux_handler17h73dfb633eb915ecfE+0x114>
   80b3c:	c85f7c09 	ldxr	x9, [x0]
   80b40:	9100052a 	add	x10, x9, #0x1
   80b44:	c80b7c0a 	stxr	w11, x10, [x0]
   80b48:	35ffffab 	cbnz	w11, 80b3c <_ZN17ruspiro_interrupt10auxhandler11aux_handler17h73dfb633eb915ecfE+0xfc>
   80b4c:	b7f80249 	tbnz	x9, #63, 80b94 <_ZN17ruspiro_interrupt10auxhandler11aux_handler17h73dfb633eb915ecfE+0x154>
   80b50:	f9479509 	ldr	x9, [x8, #3880]
   80b54:	d1000529 	sub	x9, x9, #0x1
   80b58:	f9079509 	str	x9, [x8, #3880]
   80b5c:	97ffff61 	bl	808e0 <__irq_handler_Default>
   80b60:	b4000133 	cbz	x19, 80b84 <_ZN17ruspiro_interrupt10auxhandler11aux_handler17h73dfb633eb915ecfE+0x144>
   80b64:	c85f7e68 	ldxr	x8, [x19]
   80b68:	f1000508 	subs	x8, x8, #0x1
   80b6c:	c809fe68 	stlxr	w9, x8, [x19]
   80b70:	35ffffa9 	cbnz	w9, 80b64 <_ZN17ruspiro_interrupt10auxhandler11aux_handler17h73dfb633eb915ecfE+0x124>
   80b74:	54000081 	b.ne	80b84 <_ZN17ruspiro_interrupt10auxhandler11aux_handler17h73dfb633eb915ecfE+0x144>  // b.any
   80b78:	910023e0 	add	x0, sp, #0x8
   80b7c:	d50339bf 	dmb	ishld
   80b80:	94000020 	bl	80c00 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hb5bb0a9b365095d0E>
   80b84:	a9424ff4 	ldp	x20, x19, [sp, #32]
   80b88:	f9400bfe 	ldr	x30, [sp, #16]
   80b8c:	9100c3ff 	add	sp, sp, #0x30
   80b90:	d65f03c0 	ret
   80b94:	d4200020 	brk	#0x1
   80b98:	d4200020 	brk	#0x1
   80b9c:	b0000020 	adrp	x0, 85000 <__exception_handler_default>
   80ba0:	f0000023 	adrp	x3, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   80ba4:	f0000024 	adrp	x4, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   80ba8:	912a3800 	add	x0, x0, #0xa8e
   80bac:	91340063 	add	x3, x3, #0xd00
   80bb0:	91348084 	add	x4, x4, #0xd20
   80bb4:	1400000e 	b	80bec <_ZN17ruspiro_interrupt10auxhandler11aux_handler17h73dfb633eb915ecfE+0x1ac>
   80bb8:	b0000020 	adrp	x0, 85000 <__exception_handler_default>
   80bbc:	f0000023 	adrp	x3, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   80bc0:	f0000024 	adrp	x4, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   80bc4:	912a3800 	add	x0, x0, #0xa8e
   80bc8:	91340063 	add	x3, x3, #0xd00
   80bcc:	9134e084 	add	x4, x4, #0xd38
   80bd0:	14000007 	b	80bec <_ZN17ruspiro_interrupt10auxhandler11aux_handler17h73dfb633eb915ecfE+0x1ac>
   80bd4:	b0000020 	adrp	x0, 85000 <__exception_handler_default>
   80bd8:	f0000023 	adrp	x3, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   80bdc:	f0000024 	adrp	x4, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   80be0:	912a3800 	add	x0, x0, #0xa8e
   80be4:	91340063 	add	x3, x3, #0xd00
   80be8:	91354084 	add	x4, x4, #0xd50
   80bec:	910063e2 	add	x2, sp, #0x18
   80bf0:	52800301 	mov	w1, #0x18                  	// #24
   80bf4:	94000417 	bl	81c50 <_ZN4core6result13unwrap_failed17hc96e1f395f9c9207E>
   80bf8:	d4200020 	brk	#0x1
   80bfc:	00000000 	.inst	0x00000000 ; undefined

0000000000080c00 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hb5bb0a9b365095d0E>:
   80c00:	a9bd5ffe 	stp	x30, x23, [sp, #-48]!
   80c04:	a9024ff4 	stp	x20, x19, [sp, #32]
   80c08:	f9400013 	ldr	x19, [x0]
   80c0c:	a90157f6 	stp	x22, x21, [sp, #16]
   80c10:	d5033fbf 	dmb	sy
   80c14:	91004275 	add	x21, x19, #0x10
   80c18:	91006276 	add	x22, x19, #0x18
   80c1c:	c85ffec0 	ldaxr	x0, [x22]
   80c20:	c808fedf 	stlxr	w8, xzr, [x22]
   80c24:	35ffffc8 	cbnz	w8, 80c1c <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hb5bb0a9b365095d0E+0x1c>
   80c28:	d5033f9f 	dsb	sy
   80c2c:	b4000520 	cbz	x0, 80cd0 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hb5bb0a9b365095d0E+0xd0>
   80c30:	c85ffea8 	ldaxr	x8, [x21]
   80c34:	eb00011f 	cmp	x8, x0
   80c38:	540000e1 	b.ne	80c54 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hb5bb0a9b365095d0E+0x54>  // b.any
   80c3c:	c808febf 	stlxr	w8, xzr, [x21]
   80c40:	35ffff88 	cbnz	w8, 80c30 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hb5bb0a9b365095d0E+0x30>
   80c44:	d5033f9f 	dsb	sy
   80c48:	c8dffc08 	ldar	x8, [x0]
   80c4c:	b50000c8 	cbnz	x8, 80c64 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hb5bb0a9b365095d0E+0x64>
   80c50:	1400000c 	b	80c80 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hb5bb0a9b365095d0E+0x80>
   80c54:	d5033f5f 	clrex
   80c58:	d5033f9f 	dsb	sy
   80c5c:	c8dffc08 	ldar	x8, [x0]
   80c60:	b4000108 	cbz	x8, 80c80 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hb5bb0a9b365095d0E+0x80>
   80c64:	c85ffec9 	ldaxr	x9, [x22]
   80c68:	b5000089 	cbnz	x9, 80c78 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hb5bb0a9b365095d0E+0x78>
   80c6c:	c809fec8 	stlxr	w9, x8, [x22]
   80c70:	35ffffa9 	cbnz	w9, 80c64 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hb5bb0a9b365095d0E+0x64>
   80c74:	14000002 	b	80c7c <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hb5bb0a9b365095d0E+0x7c>
   80c78:	d5033f5f 	clrex
   80c7c:	d5033f9f 	dsb	sy
   80c80:	f9400414 	ldr	x20, [x0, #8]
   80c84:	b40004f4 	cbz	x20, 80d20 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hb5bb0a9b365095d0E+0x120>
   80c88:	f9400817 	ldr	x23, [x0, #16]
   80c8c:	52800401 	mov	w1, #0x20                  	// #32
   80c90:	52800202 	mov	w2, #0x10                  	// #16
   80c94:	97fffda3 	bl	80320 <__rust_dealloc>
   80c98:	f94002e8 	ldr	x8, [x23]
   80c9c:	aa1403e0 	mov	x0, x20
   80ca0:	d63f0100 	blr	x8
   80ca4:	f94006e1 	ldr	x1, [x23, #8]
   80ca8:	b4000081 	cbz	x1, 80cb8 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hb5bb0a9b365095d0E+0xb8>
   80cac:	f9400ae2 	ldr	x2, [x23, #16]
   80cb0:	aa1403e0 	mov	x0, x20
   80cb4:	97fffd9b 	bl	80320 <__rust_dealloc>
   80cb8:	d5033fbf 	dmb	sy
   80cbc:	c85ffec0 	ldaxr	x0, [x22]
   80cc0:	c808fedf 	stlxr	w8, xzr, [x22]
   80cc4:	35ffffc8 	cbnz	w8, 80cbc <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hb5bb0a9b365095d0E+0xbc>
   80cc8:	d5033f9f 	dsb	sy
   80ccc:	b5fffb20 	cbnz	x0, 80c30 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hb5bb0a9b365095d0E+0x30>
   80cd0:	b100067f 	cmn	x19, #0x1
   80cd4:	540001e0 	b.eq	80d10 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hb5bb0a9b365095d0E+0x110>  // b.none
   80cd8:	91002268 	add	x8, x19, #0x8
   80cdc:	c85f7d09 	ldxr	x9, [x8]
   80ce0:	f1000529 	subs	x9, x9, #0x1
   80ce4:	c80afd09 	stlxr	w10, x9, [x8]
   80ce8:	35ffffaa 	cbnz	w10, 80cdc <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hb5bb0a9b365095d0E+0xdc>
   80cec:	54000121 	b.ne	80d10 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hb5bb0a9b365095d0E+0x110>  // b.any
   80cf0:	d50339bf 	dmb	ishld
   80cf4:	aa1303e0 	mov	x0, x19
   80cf8:	a9424ff4 	ldp	x20, x19, [sp, #32]
   80cfc:	52800401 	mov	w1, #0x20                  	// #32
   80d00:	52800102 	mov	w2, #0x8                   	// #8
   80d04:	a94157f6 	ldp	x22, x21, [sp, #16]
   80d08:	a8c35ffe 	ldp	x30, x23, [sp], #48
   80d0c:	17fffd85 	b	80320 <__rust_dealloc>
   80d10:	a9424ff4 	ldp	x20, x19, [sp, #32]
   80d14:	a94157f6 	ldp	x22, x21, [sp, #16]
   80d18:	a8c35ffe 	ldp	x30, x23, [sp], #48
   80d1c:	d65f03c0 	ret
   80d20:	b0000020 	adrp	x0, 85000 <__exception_handler_default>
   80d24:	f0000022 	adrp	x2, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   80d28:	912dd000 	add	x0, x0, #0xb74
   80d2c:	52800561 	mov	w1, #0x2b                  	// #43
   80d30:	9135a042 	add	x2, x2, #0xd68
   80d34:	9400055f 	bl	822b0 <_ZN4core9panicking5panic17h1276bf0d71dbfb98E>
   80d38:	d4200020 	brk	#0x1
   80d3c:	00000000 	.inst	0x00000000 ; undefined

0000000000080d40 <__rg_dealloc>:
   80d40:	f85f8008 	ldur	x8, [x0, #-8]
   80d44:	5297dde9 	mov	w9, #0xbeef                	// #48879
   80d48:	72bbd5a9 	movk	w9, #0xdead, lsl #16
   80d4c:	39400d0a 	ldrb	w10, [x8, #3]
   80d50:	3940090b 	ldrb	w11, [x8, #2]
   80d54:	3940050c 	ldrb	w12, [x8, #1]
   80d58:	3940010d 	ldrb	w13, [x8]
   80d5c:	33181d4b 	bfi	w11, w10, #8, #8
   80d60:	33181d8d 	bfi	w13, w12, #8, #8
   80d64:	33103d6d 	bfi	w13, w11, #16, #16
   80d68:	6b0901bf 	cmp	w13, w9
   80d6c:	54000d21 	b.ne	80f10 <__rg_dealloc+0x1d0>  // b.any
   80d70:	aa0803e9 	mov	x9, x8
   80d74:	39000d1f 	strb	wzr, [x8, #3]
   80d78:	3900091f 	strb	wzr, [x8, #2]
   80d7c:	3900051f 	strb	wzr, [x8, #1]
   80d80:	3900011f 	strb	wzr, [x8]
   80d84:	3840cd2a 	ldrb	w10, [x9, #12]!
   80d88:	39400d2b 	ldrb	w11, [x9, #3]
   80d8c:	3940092c 	ldrb	w12, [x9, #2]
   80d90:	38404d2d 	ldrb	w13, [x9, #4]!
   80d94:	39400d2e 	ldrb	w14, [x9, #3]
   80d98:	39400929 	ldrb	w9, [x9, #2]
   80d9c:	3940450f 	ldrb	w15, [x8, #17]
   80da0:	b3781d6c 	bfi	x12, x11, #8, #8
   80da4:	33181dc9 	bfi	w9, w14, #8, #8
   80da8:	3940350e 	ldrb	w14, [x8, #13]
   80dac:	33181ded 	bfi	w13, w15, #8, #8
   80db0:	33103d2d 	bfi	w13, w9, #16, #16
   80db4:	b3781dca 	bfi	x10, x14, #8, #8
   80db8:	b3703d8a 	bfi	x10, x12, #16, #16
   80dbc:	b3607daa 	bfi	x10, x13, #32, #32
   80dc0:	8b080149 	add	x9, x10, x8
   80dc4:	d000002a 	adrp	x10, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   80dc8:	913ce14a 	add	x10, x10, #0xf38
   80dcc:	c85ffd4b 	ldaxr	x11, [x10]
   80dd0:	eb09017f 	cmp	x11, x9
   80dd4:	54000081 	b.ne	80de4 <__rg_dealloc+0xa4>  // b.any
   80dd8:	c80bfd48 	stlxr	w11, x8, [x10]
   80ddc:	35ffff8b 	cbnz	w11, 80dcc <__rg_dealloc+0x8c>
   80de0:	d65f03c0 	ret
   80de4:	aa0803e9 	mov	x9, x8
   80de8:	d5033f5f 	clrex
   80dec:	38404d20 	ldrb	w0, [x9, #4]!
   80df0:	aa0903ea 	mov	x10, x9
   80df4:	39400d2e 	ldrb	w14, [x9, #3]
   80df8:	3940092f 	ldrb	w15, [x9, #2]
   80dfc:	3940152d 	ldrb	w13, [x9, #5]
   80e00:	38404d4b 	ldrb	w11, [x10, #4]!
   80e04:	39400d4c 	ldrb	w12, [x10, #3]
   80e08:	3940094a 	ldrb	w10, [x10, #2]
   80e0c:	b3781dcf 	bfi	x15, x14, #8, #8
   80e10:	39400529 	ldrb	w9, [x9, #1]
   80e14:	33181dab 	bfi	w11, w13, #8, #8
   80e18:	33181d8a 	bfi	w10, w12, #8, #8
   80e1c:	b3781d20 	bfi	x0, x9, #8, #8
   80e20:	33103d4b 	bfi	w11, w10, #16, #16
   80e24:	b3703de0 	bfi	x0, x15, #16, #16
   80e28:	b3607d60 	bfi	x0, x11, #32, #32
   80e2c:	f100441f 	cmp	x0, #0x11
   80e30:	540007e2 	b.cs	80f2c <__rg_dealloc+0x1ec>  // b.hs, b.nlast
   80e34:	d0000029 	adrp	x9, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   80e38:	913d0129 	add	x9, x9, #0xf40
   80e3c:	8b001129 	add	x9, x9, x0, lsl #4
   80e40:	91002129 	add	x9, x9, #0x8
   80e44:	c8dffd29 	ldar	x9, [x9]
   80e48:	38024d1f 	strb	wzr, [x8, #36]!
   80e4c:	aa0803ea 	mov	x10, x8
   80e50:	3900151f 	strb	wzr, [x8, #5]
   80e54:	39000d1f 	strb	wzr, [x8, #3]
   80e58:	d368fd2b 	lsr	x11, x9, #40
   80e5c:	d358fd2c 	lsr	x12, x9, #24
   80e60:	381f8d49 	strb	w9, [x10, #-8]!
   80e64:	d350fd2d 	lsr	x13, x9, #16
   80e68:	d348fd2e 	lsr	x14, x9, #8
   80e6c:	381fd10b 	sturb	w11, [x8, #-3]
   80e70:	d360fd2b 	lsr	x11, x9, #32
   80e74:	39000d4c 	strb	w12, [x10, #3]
   80e78:	d378fd2c 	lsr	x12, x9, #56
   80e7c:	d370fd29 	lsr	x9, x9, #48
   80e80:	3900094d 	strb	w13, [x10, #2]
   80e84:	38004d4b 	strb	w11, [x10, #4]!
   80e88:	39000949 	strb	w9, [x10, #2]
   80e8c:	aa0803e9 	mov	x9, x8
   80e90:	39000d4c 	strb	w12, [x10, #3]
   80e94:	aa0803ea 	mov	x10, x8
   80e98:	381f910e 	sturb	w14, [x8, #-7]
   80e9c:	3900091f 	strb	wzr, [x8, #2]
   80ea0:	38004d3f 	strb	wzr, [x9, #4]!
   80ea4:	3900051f 	strb	wzr, [x8, #1]
   80ea8:	39000d3f 	strb	wzr, [x9, #3]
   80eac:	3900093f 	strb	wzr, [x9, #2]
   80eb0:	385e0d40 	ldrb	w0, [x10, #-32]!
   80eb4:	39400d49 	ldrb	w9, [x10, #3]
   80eb8:	3940094b 	ldrb	w11, [x10, #2]
   80ebc:	38404d4c 	ldrb	w12, [x10, #4]!
   80ec0:	39400d4d 	ldrb	w13, [x10, #3]
   80ec4:	3940094a 	ldrb	w10, [x10, #2]
   80ec8:	385e510e 	ldurb	w14, [x8, #-27]
   80ecc:	b3781d2b 	bfi	x11, x9, #8, #8
   80ed0:	385e1108 	ldurb	w8, [x8, #-31]
   80ed4:	33181daa 	bfi	w10, w13, #8, #8
   80ed8:	33181dcc 	bfi	w12, w14, #8, #8
   80edc:	b3781d00 	bfi	x0, x8, #8, #8
   80ee0:	33103d4c 	bfi	w12, w10, #16, #16
   80ee4:	b3703d60 	bfi	x0, x11, #16, #16
   80ee8:	b3607d80 	bfi	x0, x12, #32, #32
   80eec:	f100441f 	cmp	x0, #0x11
   80ef0:	54000282 	b.cs	80f40 <__rg_dealloc+0x200>  // b.hs, b.nlast
   80ef4:	b0000020 	adrp	x0, 85000 <__exception_handler_default>
   80ef8:	f0000022 	adrp	x2, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   80efc:	91305000 	add	x0, x0, #0xc14
   80f00:	52800681 	mov	w1, #0x34                  	// #52
   80f04:	91360042 	add	x2, x2, #0xd80
   80f08:	940004ea 	bl	822b0 <_ZN4core9panicking5panic17h1276bf0d71dbfb98E>
   80f0c:	d4200020 	brk	#0x1
   80f10:	b0000020 	adrp	x0, 85000 <__exception_handler_default>
   80f14:	f0000022 	adrp	x2, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   80f18:	9132b000 	add	x0, x0, #0xcac
   80f1c:	528005c1 	mov	w1, #0x2e                  	// #46
   80f20:	91366042 	add	x2, x2, #0xd98
   80f24:	940004e3 	bl	822b0 <_ZN4core9panicking5panic17h1276bf0d71dbfb98E>
   80f28:	d4200020 	brk	#0x1
   80f2c:	f0000022 	adrp	x2, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   80f30:	52800221 	mov	w1, #0x11                  	// #17
   80f34:	9136c042 	add	x2, x2, #0xdb0
   80f38:	940004ee 	bl	822f0 <_ZN4core9panicking18panic_bounds_check17h7e98c39e5d454fafE>
   80f3c:	d4200020 	brk	#0x1
   80f40:	f0000022 	adrp	x2, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   80f44:	52800221 	mov	w1, #0x11                  	// #17
   80f48:	91372042 	add	x2, x2, #0xdc8
   80f4c:	940004e9 	bl	822f0 <_ZN4core9panicking18panic_bounds_check17h7e98c39e5d454fafE>
   80f50:	d4200020 	brk	#0x1
	...

0000000000080f60 <_ZN4core3fmt3num51_$LT$impl$u20$core..fmt..Binary$u20$for$u20$i64$GT$3fmt17h427fbecc8e4c1936E>:
   80f60:	d10243ff 	sub	sp, sp, #0x90
   80f64:	f9400009 	ldr	x9, [x0]
   80f68:	aa1f03e8 	mov	x8, xzr
   80f6c:	910003ea 	mov	x10, sp
   80f70:	f90043fe 	str	x30, [sp, #128]
   80f74:	5280060b 	mov	w11, #0x30                  	// #48
   80f78:	d341fd2c 	lsr	x12, x9, #1
   80f7c:	3300012b 	bfxil	w11, w9, #0, #1
   80f80:	f100053f 	cmp	x9, #0x1
   80f84:	8b08014d 	add	x13, x10, x8
   80f88:	d1000508 	sub	x8, x8, #0x1
   80f8c:	aa0c03e9 	mov	x9, x12
   80f90:	3901fdab 	strb	w11, [x13, #127]
   80f94:	54ffff08 	b.hi	80f74 <_ZN4core3fmt3num51_$LT$impl$u20$core..fmt..Binary$u20$for$u20$i64$GT$3fmt17h427fbecc8e4c1936E+0x14>  // b.pmore
   80f98:	91020100 	add	x0, x8, #0x80
   80f9c:	f102041f 	cmp	x0, #0x81
   80fa0:	540001c2 	b.cs	80fd8 <_ZN4core3fmt3num51_$LT$impl$u20$core..fmt..Binary$u20$for$u20$i64$GT$3fmt17h427fbecc8e4c1936E+0x78>  // b.hs, b.nlast
   80fa4:	910003e9 	mov	x9, sp
   80fa8:	b0000022 	adrp	x2, 85000 <__exception_handler_default>
   80fac:	8b080129 	add	x9, x9, x8
   80fb0:	cb0803e5 	neg	x5, x8
   80fb4:	91020124 	add	x4, x9, #0x80
   80fb8:	91353442 	add	x2, x2, #0xd4d
   80fbc:	aa0103e0 	mov	x0, x1
   80fc0:	52800021 	mov	w1, #0x1                   	// #1
   80fc4:	52800043 	mov	w3, #0x2                   	// #2
   80fc8:	940005fa 	bl	827b0 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E>
   80fcc:	f94043fe 	ldr	x30, [sp, #128]
   80fd0:	910243ff 	add	sp, sp, #0x90
   80fd4:	d65f03c0 	ret
   80fd8:	f0000022 	adrp	x2, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   80fdc:	52801001 	mov	w1, #0x80                  	// #128
   80fe0:	91378042 	add	x2, x2, #0xde0
   80fe4:	9400002b 	bl	81090 <_ZN4core5slice5index26slice_start_index_len_fail17h7120a3f80a76b06bE>
   80fe8:	d4200020 	brk	#0x1
   80fec:	00000000 	.inst	0x00000000 ; undefined

0000000000080ff0 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i64$GT$3fmt17h5b549b8f8f8626b6E>:
   80ff0:	d10243ff 	sub	sp, sp, #0x90
   80ff4:	f940000a 	ldr	x10, [x0]
   80ff8:	aa1f03e8 	mov	x8, xzr
   80ffc:	910003e9 	mov	x9, sp
   81000:	52800aeb 	mov	w11, #0x57                  	// #87
   81004:	5280060c 	mov	w12, #0x30                  	// #48
   81008:	f90043fe 	str	x30, [sp, #128]
   8100c:	12000d4d 	and	w13, w10, #0xf
   81010:	8b08012f 	add	x15, x9, x8
   81014:	710029bf 	cmp	w13, #0xa
   81018:	d1000508 	sub	x8, x8, #0x1
   8101c:	1a8b318e 	csel	w14, w12, w11, cc  // cc = lo, ul, last
   81020:	f1003d5f 	cmp	x10, #0xf
   81024:	0b0d01cd 	add	w13, w14, w13
   81028:	d344fd4a 	lsr	x10, x10, #4
   8102c:	3901fded 	strb	w13, [x15, #127]
   81030:	54fffee8 	b.hi	8100c <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i64$GT$3fmt17h5b549b8f8f8626b6E+0x1c>  // b.pmore
   81034:	91020100 	add	x0, x8, #0x80
   81038:	f102041f 	cmp	x0, #0x81
   8103c:	540001c2 	b.cs	81074 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i64$GT$3fmt17h5b549b8f8f8626b6E+0x84>  // b.hs, b.nlast
   81040:	910003e9 	mov	x9, sp
   81044:	90000022 	adrp	x2, 85000 <__exception_handler_default>
   81048:	8b080129 	add	x9, x9, x8
   8104c:	cb0803e5 	neg	x5, x8
   81050:	91020124 	add	x4, x9, #0x80
   81054:	91352c42 	add	x2, x2, #0xd4b
   81058:	aa0103e0 	mov	x0, x1
   8105c:	52800021 	mov	w1, #0x1                   	// #1
   81060:	52800043 	mov	w3, #0x2                   	// #2
   81064:	940005d3 	bl	827b0 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E>
   81068:	f94043fe 	ldr	x30, [sp, #128]
   8106c:	910243ff 	add	sp, sp, #0x90
   81070:	d65f03c0 	ret
   81074:	d0000022 	adrp	x2, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   81078:	52801001 	mov	w1, #0x80                  	// #128
   8107c:	91378042 	add	x2, x2, #0xde0
   81080:	94000004 	bl	81090 <_ZN4core5slice5index26slice_start_index_len_fail17h7120a3f80a76b06bE>
   81084:	d4200020 	brk	#0x1
	...

0000000000081090 <_ZN4core5slice5index26slice_start_index_len_fail17h7120a3f80a76b06bE>:
   81090:	d10183ff 	sub	sp, sp, #0x60
   81094:	b0000029 	adrp	x9, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   81098:	910003e8 	mov	x8, sp
   8109c:	910023ea 	add	x10, sp, #0x8
   810a0:	f9476d29 	ldr	x9, [x9, #3800]
   810a4:	a90007e0 	stp	x0, x1, [sp]
   810a8:	910043e0 	add	x0, sp, #0x10
   810ac:	aa0203e1 	mov	x1, x2
   810b0:	a9027fff 	stp	xzr, xzr, [sp, #32]
   810b4:	a90427e8 	stp	x8, x9, [sp, #64]
   810b8:	52800048 	mov	w8, #0x2                   	// #2
   810bc:	a90527ea 	stp	x10, x9, [sp, #80]
   810c0:	d0000029 	adrp	x9, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   810c4:	9137e129 	add	x9, x9, #0xdf8
   810c8:	a90123e9 	stp	x9, x8, [sp, #16]
   810cc:	910103e9 	add	x9, sp, #0x40
   810d0:	a90323e9 	stp	x9, x8, [sp, #48]
   810d4:	9400049b 	bl	82340 <_ZN4core9panicking9panic_fmt17h2fb479caa573f9e3E>
   810d8:	d4200020 	brk	#0x1
   810dc:	00000000 	.inst	0x00000000 ; undefined

00000000000810e0 <_ZN4core5slice5index24slice_end_index_len_fail17hb9f0a64be91517a4E>:
   810e0:	d10183ff 	sub	sp, sp, #0x60
   810e4:	b0000029 	adrp	x9, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   810e8:	910003e8 	mov	x8, sp
   810ec:	910023ea 	add	x10, sp, #0x8
   810f0:	f9476d29 	ldr	x9, [x9, #3800]
   810f4:	a90007e0 	stp	x0, x1, [sp]
   810f8:	910043e0 	add	x0, sp, #0x10
   810fc:	aa0203e1 	mov	x1, x2
   81100:	a9027fff 	stp	xzr, xzr, [sp, #32]
   81104:	a90427e8 	stp	x8, x9, [sp, #64]
   81108:	52800048 	mov	w8, #0x2                   	// #2
   8110c:	a90527ea 	stp	x10, x9, [sp, #80]
   81110:	d0000029 	adrp	x9, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   81114:	91386129 	add	x9, x9, #0xe18
   81118:	a90123e9 	stp	x9, x8, [sp, #16]
   8111c:	910103e9 	add	x9, sp, #0x40
   81120:	a90323e9 	stp	x9, x8, [sp, #48]
   81124:	94000487 	bl	82340 <_ZN4core9panicking9panic_fmt17h2fb479caa573f9e3E>
   81128:	d4200020 	brk	#0x1
   8112c:	00000000 	.inst	0x00000000 ; undefined

0000000000081130 <_ZN4core5slice5index22slice_index_order_fail17hb44310cbc3fa1d3fE>:
   81130:	d10183ff 	sub	sp, sp, #0x60
   81134:	b0000029 	adrp	x9, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   81138:	910003e8 	mov	x8, sp
   8113c:	910023ea 	add	x10, sp, #0x8
   81140:	f9476d29 	ldr	x9, [x9, #3800]
   81144:	a90007e0 	stp	x0, x1, [sp]
   81148:	910043e0 	add	x0, sp, #0x10
   8114c:	aa0203e1 	mov	x1, x2
   81150:	a9027fff 	stp	xzr, xzr, [sp, #32]
   81154:	a90427e8 	stp	x8, x9, [sp, #64]
   81158:	52800048 	mov	w8, #0x2                   	// #2
   8115c:	a90527ea 	stp	x10, x9, [sp, #80]
   81160:	d0000029 	adrp	x9, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   81164:	9138e129 	add	x9, x9, #0xe38
   81168:	a90123e9 	stp	x9, x8, [sp, #16]
   8116c:	910103e9 	add	x9, sp, #0x40
   81170:	a90323e9 	stp	x9, x8, [sp, #48]
   81174:	94000473 	bl	82340 <_ZN4core9panicking9panic_fmt17h2fb479caa573f9e3E>
   81178:	d4200020 	brk	#0x1
   8117c:	00000000 	.inst	0x00000000 ; undefined

0000000000081180 <_ZN4core7unicode12unicode_data15grapheme_extend6lookup17h4c3fb151a65b2097E>:
   81180:	9000002a 	adrp	x10, 85000 <__exception_handler_default>
   81184:	aa1f03e8 	mov	x8, xzr
   81188:	528003ec 	mov	w12, #0x1f                  	// #31
   8118c:	528003eb 	mov	w11, #0x1f                  	// #31
   81190:	913bb14a 	add	x10, x10, #0xeec
   81194:	53155009 	lsl	w9, w0, #11
   81198:	14000004 	b	811a8 <_ZN4core7unicode12unicode_data15grapheme_extend6lookup17h4c3fb151a65b2097E+0x28>
   8119c:	91000588 	add	x8, x12, #0x1
   811a0:	eb08016c 	subs	x12, x11, x8
   811a4:	54000129 	b.ls	811c8 <_ZN4core7unicode12unicode_data15grapheme_extend6lookup17h4c3fb151a65b2097E+0x48>  // b.plast
   811a8:	8b4c050c 	add	x12, x8, x12, lsr #1
   811ac:	b86c794d 	ldr	w13, [x10, x12, lsl #2]
   811b0:	531551ad 	lsl	w13, w13, #11
   811b4:	6b0901bf 	cmp	w13, w9
   811b8:	54ffff23 	b.cc	8119c <_ZN4core7unicode12unicode_data15grapheme_extend6lookup17h4c3fb151a65b2097E+0x1c>  // b.lo, b.ul, b.last
   811bc:	aa0c03eb 	mov	x11, x12
   811c0:	54ffff01 	b.ne	811a0 <_ZN4core7unicode12unicode_data15grapheme_extend6lookup17h4c3fb151a65b2097E+0x20>  // b.any
   811c4:	91000588 	add	x8, x12, #0x1
   811c8:	f100791f 	cmp	x8, #0x1e
   811cc:	540006a8 	b.hi	812a0 <_ZN4core7unicode12unicode_data15grapheme_extend6lookup17h4c3fb151a65b2097E+0x120>  // b.pmore
   811d0:	f100791f 	cmp	x8, #0x1e
   811d4:	540001e1 	b.ne	81210 <_ZN4core7unicode12unicode_data15grapheme_extend6lookup17h4c3fb151a65b2097E+0x90>  // b.any
   811d8:	5280562b 	mov	w11, #0x2b1                 	// #689
   811dc:	f1000509 	subs	x9, x8, #0x1
   811e0:	54000223 	b.cc	81224 <_ZN4core7unicode12unicode_data15grapheme_extend6lookup17h4c3fb151a65b2097E+0xa4>  // b.lo, b.ul, b.last
   811e4:	f1007d3f 	cmp	x9, #0x1f
   811e8:	54000642 	b.cs	812b0 <_ZN4core7unicode12unicode_data15grapheme_extend6lookup17h4c3fb151a65b2097E+0x130>  // b.hs, b.nlast
   811ec:	b8697949 	ldr	w9, [x10, x9, lsl #2]
   811f0:	1200512c 	and	w12, w9, #0x1fffff
   811f4:	b8687948 	ldr	w8, [x10, x8, lsl #2]
   811f8:	d355fd08 	lsr	x8, x8, #21
   811fc:	aa2803e9 	mvn	x9, x8
   81200:	ab09017f 	cmn	x11, x9
   81204:	540001c1 	b.ne	8123c <_ZN4core7unicode12unicode_data15grapheme_extend6lookup17h4c3fb151a65b2097E+0xbc>  // b.any
   81208:	12000100 	and	w0, w8, #0x1
   8120c:	d65f03c0 	ret
   81210:	8b080949 	add	x9, x10, x8, lsl #2
   81214:	b9400529 	ldr	w9, [x9, #4]
   81218:	d355fd2b 	lsr	x11, x9, #21
   8121c:	f1000509 	subs	x9, x8, #0x1
   81220:	54fffe22 	b.cs	811e4 <_ZN4core7unicode12unicode_data15grapheme_extend6lookup17h4c3fb151a65b2097E+0x64>  // b.hs, b.nlast
   81224:	2a1f03ec 	mov	w12, wzr
   81228:	b8687948 	ldr	w8, [x10, x8, lsl #2]
   8122c:	d355fd08 	lsr	x8, x8, #21
   81230:	aa2803e9 	mvn	x9, x8
   81234:	ab09017f 	cmn	x11, x9
   81238:	54fffe80 	b.eq	81208 <_ZN4core7unicode12unicode_data15grapheme_extend6lookup17h4c3fb151a65b2097E+0x88>  // b.none
   8123c:	4b0c000a 	sub	w10, w0, w12
   81240:	f10ac51f 	cmp	x8, #0x2b1
   81244:	5280562c 	mov	w12, #0x2b1                 	// #689
   81248:	2a1f03e9 	mov	w9, wzr
   8124c:	9a8c8100 	csel	x0, x8, x12, hi  // hi = pmore
   81250:	9000002c 	adrp	x12, 85000 <__exception_handler_default>
   81254:	d100056b 	sub	x11, x11, #0x1
   81258:	913da18c 	add	x12, x12, #0xf68
   8125c:	eb08001f 	cmp	x0, x8
   81260:	54000160 	b.eq	8128c <_ZN4core7unicode12unicode_data15grapheme_extend6lookup17h4c3fb151a65b2097E+0x10c>  // b.none
   81264:	3868698d 	ldrb	w13, [x12, x8]
   81268:	0b0d0129 	add	w9, w9, w13
   8126c:	6b0a013f 	cmp	w9, w10
   81270:	54fffcc8 	b.hi	81208 <_ZN4core7unicode12unicode_data15grapheme_extend6lookup17h4c3fb151a65b2097E+0x88>  // b.pmore
   81274:	91000508 	add	x8, x8, #0x1
   81278:	eb08017f 	cmp	x11, x8
   8127c:	54ffff01 	b.ne	8125c <_ZN4core7unicode12unicode_data15grapheme_extend6lookup17h4c3fb151a65b2097E+0xdc>  // b.any
   81280:	aa0b03e8 	mov	x8, x11
   81284:	12000100 	and	w0, w8, #0x1
   81288:	d65f03c0 	ret
   8128c:	d0000022 	adrp	x2, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   81290:	52805621 	mov	w1, #0x2b1                 	// #689
   81294:	9139c042 	add	x2, x2, #0xe70
   81298:	94000416 	bl	822f0 <_ZN4core9panicking18panic_bounds_check17h7e98c39e5d454fafE>
   8129c:	d4200020 	brk	#0x1
   812a0:	d0000022 	adrp	x2, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   812a4:	aa0803e0 	mov	x0, x8
   812a8:	91396042 	add	x2, x2, #0xe58
   812ac:	14000004 	b	812bc <_ZN4core7unicode12unicode_data15grapheme_extend6lookup17h4c3fb151a65b2097E+0x13c>
   812b0:	d0000022 	adrp	x2, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   812b4:	aa0903e0 	mov	x0, x9
   812b8:	913a2042 	add	x2, x2, #0xe88
   812bc:	528003e1 	mov	w1, #0x1f                  	// #31
   812c0:	9400040c 	bl	822f0 <_ZN4core9panicking18panic_bounds_check17h7e98c39e5d454fafE>
   812c4:	d4200020 	brk	#0x1
	...

00000000000812d0 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE>:
   812d0:	d10283ff 	sub	sp, sp, #0xa0
   812d4:	b9403028 	ldr	w8, [x1, #48]
   812d8:	a9094ff4 	stp	x20, x19, [sp, #144]
   812dc:	aa0103f3 	mov	x19, x1
   812e0:	aa0003f4 	mov	x20, x0
   812e4:	f90043fe 	str	x30, [sp, #128]
   812e8:	372005a8 	tbnz	w8, #4, 8139c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0xcc>
   812ec:	37280788 	tbnz	w8, #5, 813dc <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x10c>
   812f0:	f9400288 	ldr	x8, [x20]
   812f4:	d344fd09 	lsr	x9, x8, #4
   812f8:	f109c53f 	cmp	x9, #0x271
   812fc:	54000ac3 	b.cc	81454 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x184>  // b.lo, b.ul, b.last
   81300:	d28b296b 	mov	x11, #0x594b                	// #22859
   81304:	529c1fea 	mov	w10, #0xe0ff                	// #57599
   81308:	f2a710cb 	movk	x11, #0x3886, lsl #16
   8130c:	90000030 	adrp	x16, 85000 <__exception_handler_default>
   81310:	f2d8bacb 	movk	x11, #0xc5d6, lsl #32
   81314:	aa1f03e9 	mov	x9, xzr
   81318:	72a0beaa 	movk	w10, #0x5f5, lsl #16
   8131c:	f2e68dab 	movk	x11, #0x346d, lsl #48
   81320:	5284e20c 	mov	w12, #0x2710                	// #10000
   81324:	52828f6d 	mov	w13, #0x147b                	// #5243
   81328:	52800c8e 	mov	w14, #0x64                  	// #100
   8132c:	910003ef 	mov	x15, sp
   81330:	91353e10 	add	x16, x16, #0xd4f
   81334:	aa0803f1 	mov	x17, x8
   81338:	9bcb7d08 	umulh	x8, x8, x11
   8133c:	8b0901e2 	add	x2, x15, x9
   81340:	d1001129 	sub	x9, x9, #0x4
   81344:	d34bfd08 	lsr	x8, x8, #11
   81348:	eb0a023f 	cmp	x17, x10
   8134c:	1b0cc512 	msub	w18, w8, w12, w17
   81350:	53023e40 	ubfx	w0, w18, #2, #14
   81354:	1b0d7c00 	mul	w0, w0, w13
   81358:	53117c00 	lsr	w0, w0, #17
   8135c:	1b0ec812 	msub	w18, w0, w14, w18
   81360:	8b204600 	add	x0, x16, w0, uxtw #1
   81364:	8b322612 	add	x18, x16, w18, uxth #1
   81368:	39400401 	ldrb	w1, [x0, #1]
   8136c:	39400000 	ldrb	w0, [x0]
   81370:	39400643 	ldrb	w3, [x18, #1]
   81374:	39400252 	ldrb	w18, [x18]
   81378:	39009041 	strb	w1, [x2, #36]
   8137c:	39008c40 	strb	w0, [x2, #35]
   81380:	39009843 	strb	w3, [x2, #38]
   81384:	39009452 	strb	w18, [x2, #37]
   81388:	54fffd68 	b.hi	81334 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x64>  // b.pmore
   8138c:	91009d29 	add	x9, x9, #0x27
   81390:	f1018d1f 	cmp	x8, #0x63
   81394:	5400066c 	b.gt	81460 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x190>
   81398:	14000043 	b	814a4 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x1d4>
   8139c:	f9400289 	ldr	x9, [x20]
   813a0:	aa1f03e8 	mov	x8, xzr
   813a4:	910003ea 	mov	x10, sp
   813a8:	52800aeb 	mov	w11, #0x57                  	// #87
   813ac:	5280060c 	mov	w12, #0x30                  	// #48
   813b0:	12000d2d 	and	w13, w9, #0xf
   813b4:	8b08014f 	add	x15, x10, x8
   813b8:	710029bf 	cmp	w13, #0xa
   813bc:	d1000508 	sub	x8, x8, #0x1
   813c0:	1a8b318e 	csel	w14, w12, w11, cc  // cc = lo, ul, last
   813c4:	f1003d3f 	cmp	x9, #0xf
   813c8:	0b0d01cd 	add	w13, w14, w13
   813cc:	d344fd29 	lsr	x9, x9, #4
   813d0:	3901fded 	strb	w13, [x15, #127]
   813d4:	54fffee8 	b.hi	813b0 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0xe0>  // b.pmore
   813d8:	14000010 	b	81418 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x148>
   813dc:	f9400289 	ldr	x9, [x20]
   813e0:	aa1f03e8 	mov	x8, xzr
   813e4:	910003ea 	mov	x10, sp
   813e8:	528006eb 	mov	w11, #0x37                  	// #55
   813ec:	5280060c 	mov	w12, #0x30                  	// #48
   813f0:	12000d2d 	and	w13, w9, #0xf
   813f4:	8b08014f 	add	x15, x10, x8
   813f8:	710029bf 	cmp	w13, #0xa
   813fc:	d1000508 	sub	x8, x8, #0x1
   81400:	1a8b318e 	csel	w14, w12, w11, cc  // cc = lo, ul, last
   81404:	f1003d3f 	cmp	x9, #0xf
   81408:	0b0d01cd 	add	w13, w14, w13
   8140c:	d344fd29 	lsr	x9, x9, #4
   81410:	3901fded 	strb	w13, [x15, #127]
   81414:	54fffee8 	b.hi	813f0 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x120>  // b.pmore
   81418:	91020100 	add	x0, x8, #0x80
   8141c:	f102041f 	cmp	x0, #0x81
   81420:	54001e62 	b.cs	817ec <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x51c>  // b.hs, b.nlast
   81424:	910003e9 	mov	x9, sp
   81428:	90000022 	adrp	x2, 85000 <__exception_handler_default>
   8142c:	8b080129 	add	x9, x9, x8
   81430:	cb0803e5 	neg	x5, x8
   81434:	91020124 	add	x4, x9, #0x80
   81438:	91352c42 	add	x2, x2, #0xd4b
   8143c:	aa1303e0 	mov	x0, x19
   81440:	52800021 	mov	w1, #0x1                   	// #1
   81444:	52800043 	mov	w3, #0x2                   	// #2
   81448:	940004da 	bl	827b0 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E>
   8144c:	36000640 	tbz	w0, #0, 81514 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x244>
   81450:	1400003d 	b	81544 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x274>
   81454:	528004e9 	mov	w9, #0x27                  	// #39
   81458:	f1018d1f 	cmp	x8, #0x63
   8145c:	5400024d 	b.le	814a4 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x1d4>
   81460:	52828f6a 	mov	w10, #0x147b                	// #5243
   81464:	53023d0b 	ubfx	w11, w8, #2, #14
   81468:	d1000929 	sub	x9, x9, #0x2
   8146c:	1b0a7d6a 	mul	w10, w11, w10
   81470:	52800c8b 	mov	w11, #0x64                  	// #100
   81474:	53117d4a 	lsr	w10, w10, #17
   81478:	1b0ba148 	msub	w8, w10, w11, w8
   8147c:	9000002b 	adrp	x11, 85000 <__exception_handler_default>
   81480:	91353d6b 	add	x11, x11, #0xd4f
   81484:	8b282568 	add	x8, x11, w8, uxth #1
   81488:	910003eb 	mov	x11, sp
   8148c:	8b09016b 	add	x11, x11, x9
   81490:	3940050c 	ldrb	w12, [x8, #1]
   81494:	3940010d 	ldrb	w13, [x8]
   81498:	aa0a03e8 	mov	x8, x10
   8149c:	3900056c 	strb	w12, [x11, #1]
   814a0:	3900016d 	strb	w13, [x11]
   814a4:	f100291f 	cmp	x8, #0xa
   814a8:	540000ca 	b.ge	814c0 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x1f0>  // b.tcont
   814ac:	d1000529 	sub	x9, x9, #0x1
   814b0:	1100c108 	add	w8, w8, #0x30
   814b4:	910003ea 	mov	x10, sp
   814b8:	38296948 	strb	w8, [x10, x9]
   814bc:	1400000b 	b	814e8 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x218>
   814c0:	9000002a 	adrp	x10, 85000 <__exception_handler_default>
   814c4:	d1000929 	sub	x9, x9, #0x2
   814c8:	91353d4a 	add	x10, x10, #0xd4f
   814cc:	8b080548 	add	x8, x10, x8, lsl #1
   814d0:	910003ea 	mov	x10, sp
   814d4:	8b09014a 	add	x10, x10, x9
   814d8:	3940050b 	ldrb	w11, [x8, #1]
   814dc:	39400108 	ldrb	w8, [x8]
   814e0:	3900054b 	strb	w11, [x10, #1]
   814e4:	39000148 	strb	w8, [x10]
   814e8:	910003e8 	mov	x8, sp
   814ec:	528004ea 	mov	w10, #0x27                  	// #39
   814f0:	b0000022 	adrp	x2, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   814f4:	8b090104 	add	x4, x8, x9
   814f8:	cb090145 	sub	x5, x10, x9
   814fc:	91088042 	add	x2, x2, #0x220
   81500:	aa1303e0 	mov	x0, x19
   81504:	52800021 	mov	w1, #0x1                   	// #1
   81508:	aa1f03e3 	mov	x3, xzr
   8150c:	940004a9 	bl	827b0 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E>
   81510:	370001a0 	tbnz	w0, #0, 81544 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x274>
   81514:	d0000029 	adrp	x9, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   81518:	52800028 	mov	w8, #0x1                   	// #1
   8151c:	913a8129 	add	x9, x9, #0xea0
   81520:	910003e2 	mov	x2, sp
   81524:	a9420660 	ldp	x0, x1, [x19, #32]
   81528:	a90023e9 	stp	x9, x8, [sp]
   8152c:	b0000028 	adrp	x8, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   81530:	91088108 	add	x8, x8, #0x220
   81534:	a9017fff 	stp	xzr, xzr, [sp, #16]
   81538:	a9027fe8 	stp	x8, xzr, [sp, #32]
   8153c:	94000409 	bl	82560 <_ZN4core3fmt5write17he3850105fd3ed4faE>
   81540:	340000c0 	cbz	w0, 81558 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x288>
   81544:	52800020 	mov	w0, #0x1                   	// #1
   81548:	a9494ff4 	ldp	x20, x19, [sp, #144]
   8154c:	f94043fe 	ldr	x30, [sp, #128]
   81550:	910283ff 	add	sp, sp, #0xa0
   81554:	d65f03c0 	ret
   81558:	b9403268 	ldr	w8, [x19, #48]
   8155c:	37200568 	tbnz	w8, #4, 81608 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x338>
   81560:	37280988 	tbnz	w8, #5, 81690 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x3c0>
   81564:	f9400688 	ldr	x8, [x20, #8]
   81568:	d344fd09 	lsr	x9, x8, #4
   8156c:	f109c53f 	cmp	x9, #0x271
   81570:	54000d43 	b.cc	81718 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x448>  // b.lo, b.ul, b.last
   81574:	d28b296b 	mov	x11, #0x594b                	// #22859
   81578:	529c1fea 	mov	w10, #0xe0ff                	// #57599
   8157c:	f2a710cb 	movk	x11, #0x3886, lsl #16
   81580:	90000030 	adrp	x16, 85000 <__exception_handler_default>
   81584:	f2d8bacb 	movk	x11, #0xc5d6, lsl #32
   81588:	aa1f03e9 	mov	x9, xzr
   8158c:	72a0beaa 	movk	w10, #0x5f5, lsl #16
   81590:	f2e68dab 	movk	x11, #0x346d, lsl #48
   81594:	5284e20c 	mov	w12, #0x2710                	// #10000
   81598:	52828f6d 	mov	w13, #0x147b                	// #5243
   8159c:	52800c8e 	mov	w14, #0x64                  	// #100
   815a0:	910003ef 	mov	x15, sp
   815a4:	91353e10 	add	x16, x16, #0xd4f
   815a8:	aa0803f1 	mov	x17, x8
   815ac:	9bcb7d08 	umulh	x8, x8, x11
   815b0:	8b0901e2 	add	x2, x15, x9
   815b4:	d1001129 	sub	x9, x9, #0x4
   815b8:	d34bfd08 	lsr	x8, x8, #11
   815bc:	eb0a023f 	cmp	x17, x10
   815c0:	1b0cc512 	msub	w18, w8, w12, w17
   815c4:	53023e40 	ubfx	w0, w18, #2, #14
   815c8:	1b0d7c00 	mul	w0, w0, w13
   815cc:	53117c00 	lsr	w0, w0, #17
   815d0:	1b0ec812 	msub	w18, w0, w14, w18
   815d4:	8b204600 	add	x0, x16, w0, uxtw #1
   815d8:	8b322612 	add	x18, x16, w18, uxth #1
   815dc:	39400401 	ldrb	w1, [x0, #1]
   815e0:	39400000 	ldrb	w0, [x0]
   815e4:	39400643 	ldrb	w3, [x18, #1]
   815e8:	39400252 	ldrb	w18, [x18]
   815ec:	39009041 	strb	w1, [x2, #36]
   815f0:	39008c40 	strb	w0, [x2, #35]
   815f4:	39009843 	strb	w3, [x2, #38]
   815f8:	39009452 	strb	w18, [x2, #37]
   815fc:	54fffd68 	b.hi	815a8 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x2d8>  // b.pmore
   81600:	91009d29 	add	x9, x9, #0x27
   81604:	14000046 	b	8171c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x44c>
   81608:	f9400689 	ldr	x9, [x20, #8]
   8160c:	aa1f03e8 	mov	x8, xzr
   81610:	910003ea 	mov	x10, sp
   81614:	52800aeb 	mov	w11, #0x57                  	// #87
   81618:	5280060c 	mov	w12, #0x30                  	// #48
   8161c:	12000d2d 	and	w13, w9, #0xf
   81620:	8b08014f 	add	x15, x10, x8
   81624:	710029bf 	cmp	w13, #0xa
   81628:	d1000508 	sub	x8, x8, #0x1
   8162c:	1a8b318e 	csel	w14, w12, w11, cc  // cc = lo, ul, last
   81630:	f1003d3f 	cmp	x9, #0xf
   81634:	0b0d01cd 	add	w13, w14, w13
   81638:	d344fd29 	lsr	x9, x9, #4
   8163c:	3901fded 	strb	w13, [x15, #127]
   81640:	54fffee8 	b.hi	8161c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x34c>  // b.pmore
   81644:	91020100 	add	x0, x8, #0x80
   81648:	f102041f 	cmp	x0, #0x81
   8164c:	54000d02 	b.cs	817ec <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x51c>  // b.hs, b.nlast
   81650:	910003e9 	mov	x9, sp
   81654:	90000022 	adrp	x2, 85000 <__exception_handler_default>
   81658:	8b080129 	add	x9, x9, x8
   8165c:	cb0803e5 	neg	x5, x8
   81660:	91020124 	add	x4, x9, #0x80
   81664:	91352c42 	add	x2, x2, #0xd4b
   81668:	aa1303e0 	mov	x0, x19
   8166c:	52800021 	mov	w1, #0x1                   	// #1
   81670:	52800043 	mov	w3, #0x2                   	// #2
   81674:	9400044f 	bl	827b0 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E>
   81678:	3707f660 	tbnz	w0, #0, 81544 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x274>
   8167c:	2a1f03e0 	mov	w0, wzr
   81680:	a9494ff4 	ldp	x20, x19, [sp, #144]
   81684:	f94043fe 	ldr	x30, [sp, #128]
   81688:	910283ff 	add	sp, sp, #0xa0
   8168c:	d65f03c0 	ret
   81690:	f9400689 	ldr	x9, [x20, #8]
   81694:	aa1f03e8 	mov	x8, xzr
   81698:	910003ea 	mov	x10, sp
   8169c:	528006eb 	mov	w11, #0x37                  	// #55
   816a0:	5280060c 	mov	w12, #0x30                  	// #48
   816a4:	12000d2d 	and	w13, w9, #0xf
   816a8:	8b08014f 	add	x15, x10, x8
   816ac:	710029bf 	cmp	w13, #0xa
   816b0:	d1000508 	sub	x8, x8, #0x1
   816b4:	1a8b318e 	csel	w14, w12, w11, cc  // cc = lo, ul, last
   816b8:	f1003d3f 	cmp	x9, #0xf
   816bc:	0b0d01cd 	add	w13, w14, w13
   816c0:	d344fd29 	lsr	x9, x9, #4
   816c4:	3901fded 	strb	w13, [x15, #127]
   816c8:	54fffee8 	b.hi	816a4 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x3d4>  // b.pmore
   816cc:	91020100 	add	x0, x8, #0x80
   816d0:	f102041f 	cmp	x0, #0x81
   816d4:	540008c2 	b.cs	817ec <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x51c>  // b.hs, b.nlast
   816d8:	910003e9 	mov	x9, sp
   816dc:	90000022 	adrp	x2, 85000 <__exception_handler_default>
   816e0:	8b080129 	add	x9, x9, x8
   816e4:	cb0803e5 	neg	x5, x8
   816e8:	91020124 	add	x4, x9, #0x80
   816ec:	91352c42 	add	x2, x2, #0xd4b
   816f0:	aa1303e0 	mov	x0, x19
   816f4:	52800021 	mov	w1, #0x1                   	// #1
   816f8:	52800043 	mov	w3, #0x2                   	// #2
   816fc:	9400042d 	bl	827b0 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E>
   81700:	3707f220 	tbnz	w0, #0, 81544 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x274>
   81704:	2a1f03e0 	mov	w0, wzr
   81708:	a9494ff4 	ldp	x20, x19, [sp, #144]
   8170c:	f94043fe 	ldr	x30, [sp, #128]
   81710:	910283ff 	add	sp, sp, #0xa0
   81714:	d65f03c0 	ret
   81718:	528004e9 	mov	w9, #0x27                  	// #39
   8171c:	f1018d1f 	cmp	x8, #0x63
   81720:	5400024d 	b.le	81768 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x498>
   81724:	52828f6a 	mov	w10, #0x147b                	// #5243
   81728:	53023d0b 	ubfx	w11, w8, #2, #14
   8172c:	d1000929 	sub	x9, x9, #0x2
   81730:	1b0a7d6a 	mul	w10, w11, w10
   81734:	52800c8b 	mov	w11, #0x64                  	// #100
   81738:	53117d4a 	lsr	w10, w10, #17
   8173c:	1b0ba148 	msub	w8, w10, w11, w8
   81740:	9000002b 	adrp	x11, 85000 <__exception_handler_default>
   81744:	91353d6b 	add	x11, x11, #0xd4f
   81748:	8b282568 	add	x8, x11, w8, uxth #1
   8174c:	910003eb 	mov	x11, sp
   81750:	8b09016b 	add	x11, x11, x9
   81754:	3940050c 	ldrb	w12, [x8, #1]
   81758:	3940010d 	ldrb	w13, [x8]
   8175c:	aa0a03e8 	mov	x8, x10
   81760:	3900056c 	strb	w12, [x11, #1]
   81764:	3900016d 	strb	w13, [x11]
   81768:	f100291f 	cmp	x8, #0xa
   8176c:	540000ca 	b.ge	81784 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x4b4>  // b.tcont
   81770:	d1000529 	sub	x9, x9, #0x1
   81774:	1100c108 	add	w8, w8, #0x30
   81778:	910003ea 	mov	x10, sp
   8177c:	38296948 	strb	w8, [x10, x9]
   81780:	1400000b 	b	817ac <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x4dc>
   81784:	9000002a 	adrp	x10, 85000 <__exception_handler_default>
   81788:	d1000929 	sub	x9, x9, #0x2
   8178c:	91353d4a 	add	x10, x10, #0xd4f
   81790:	8b080548 	add	x8, x10, x8, lsl #1
   81794:	910003ea 	mov	x10, sp
   81798:	8b09014a 	add	x10, x10, x9
   8179c:	3940050b 	ldrb	w11, [x8, #1]
   817a0:	39400108 	ldrb	w8, [x8]
   817a4:	3900054b 	strb	w11, [x10, #1]
   817a8:	39000148 	strb	w8, [x10]
   817ac:	910003e8 	mov	x8, sp
   817b0:	528004ea 	mov	w10, #0x27                  	// #39
   817b4:	b0000022 	adrp	x2, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   817b8:	8b090104 	add	x4, x8, x9
   817bc:	cb090145 	sub	x5, x10, x9
   817c0:	91088042 	add	x2, x2, #0x220
   817c4:	aa1303e0 	mov	x0, x19
   817c8:	52800021 	mov	w1, #0x1                   	// #1
   817cc:	aa1f03e3 	mov	x3, xzr
   817d0:	940003f8 	bl	827b0 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E>
   817d4:	3707eb80 	tbnz	w0, #0, 81544 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h0898a25c28d0d34bE+0x274>
   817d8:	2a1f03e0 	mov	w0, wzr
   817dc:	a9494ff4 	ldp	x20, x19, [sp, #144]
   817e0:	f94043fe 	ldr	x30, [sp, #128]
   817e4:	910283ff 	add	sp, sp, #0xa0
   817e8:	d65f03c0 	ret
   817ec:	d0000022 	adrp	x2, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   817f0:	52801001 	mov	w1, #0x80                  	// #128
   817f4:	91378042 	add	x2, x2, #0xde0
   817f8:	97fffe26 	bl	81090 <_ZN4core5slice5index26slice_start_index_len_fail17h7120a3f80a76b06bE>
   817fc:	d4200020 	brk	#0x1

0000000000081800 <_ZN4core7unicode9printable5check17h12f0cec41989e29fE.llvm.2339018429671269780>:
   81800:	b4000302 	cbz	x2, 81860 <_ZN4core7unicode9printable5check17h12f0cec41989e29fE.llvm.2339018429671269780+0x60>
   81804:	aa1f03e9 	mov	x9, xzr
   81808:	8b02042a 	add	x10, x1, x2, lsl #1
   8180c:	3940042b 	ldrb	w11, [x1, #1]
   81810:	12181c0d 	and	w13, w0, #0xff00
   81814:	3840242c 	ldrb	w12, [x1], #2
   81818:	8b0b0128 	add	x8, x9, x11
   8181c:	6b4d219f 	cmp	w12, w13, lsr #8
   81820:	54000181 	b.ne	81850 <_ZN4core7unicode9printable5check17h12f0cec41989e29fE.llvm.2339018429671269780+0x50>  // b.any
   81824:	eb09011f 	cmp	x8, x9
   81828:	540006c3 	b.cc	81900 <_ZN4core7unicode9printable5check17h12f0cec41989e29fE.llvm.2339018429671269780+0x100>  // b.lo, b.ul, b.last
   8182c:	eb04011f 	cmp	x8, x4
   81830:	54000748 	b.hi	81918 <_ZN4core7unicode9printable5check17h12f0cec41989e29fE.llvm.2339018429671269780+0x118>  // b.pmore
   81834:	8b090069 	add	x9, x3, x9
   81838:	b40000eb 	cbz	x11, 81854 <_ZN4core7unicode9printable5check17h12f0cec41989e29fE.llvm.2339018429671269780+0x54>
   8183c:	3840152c 	ldrb	w12, [x9], #1
   81840:	d100056b 	sub	x11, x11, #0x1
   81844:	6b20019f 	cmp	w12, w0, uxtb
   81848:	54ffff81 	b.ne	81838 <_ZN4core7unicode9printable5check17h12f0cec41989e29fE.llvm.2339018429671269780+0x38>  // b.any
   8184c:	14000020 	b	818cc <_ZN4core7unicode9printable5check17h12f0cec41989e29fE.llvm.2339018429671269780+0xcc>
   81850:	54000088 	b.hi	81860 <_ZN4core7unicode9printable5check17h12f0cec41989e29fE.llvm.2339018429671269780+0x60>  // b.pmore
   81854:	aa0803e9 	mov	x9, x8
   81858:	eb0a003f 	cmp	x1, x10
   8185c:	54fffd81 	b.ne	8180c <_ZN4core7unicode9printable5check17h12f0cec41989e29fE.llvm.2339018429671269780+0xc>  // b.any
   81860:	b40003c6 	cbz	x6, 818d8 <_ZN4core7unicode9printable5check17h12f0cec41989e29fE.llvm.2339018429671269780+0xd8>
   81864:	8b0600a9 	add	x9, x5, x6
   81868:	910004aa 	add	x10, x5, #0x1
   8186c:	12003c0b 	and	w11, w0, #0xffff
   81870:	52800028 	mov	w8, #0x1                   	// #1
   81874:	39c000ad 	ldrsb	w13, [x5]
   81878:	12001dac 	and	w12, w13, #0xff
   8187c:	36f8010d 	tbz	w13, #31, 8189c <_ZN4core7unicode9printable5check17h12f0cec41989e29fE.llvm.2339018429671269780+0x9c>
   81880:	eb09015f 	cmp	x10, x9
   81884:	54000300 	b.eq	818e4 <_ZN4core7unicode9printable5check17h12f0cec41989e29fE.llvm.2339018429671269780+0xe4>  // b.none
   81888:	b40002ea 	cbz	x10, 818e4 <_ZN4core7unicode9printable5check17h12f0cec41989e29fE.llvm.2339018429671269780+0xe4>
   8188c:	3840154d 	ldrb	w13, [x10], #1
   81890:	1200198c 	and	w12, w12, #0x7f
   81894:	3318198d 	bfi	w13, w12, #8, #7
   81898:	2a0d03ec 	mov	w12, w13
   8189c:	6b0c016b 	subs	w11, w11, w12
   818a0:	54000184 	b.mi	818d0 <_ZN4core7unicode9printable5check17h12f0cec41989e29fE.llvm.2339018429671269780+0xd0>  // b.first
   818a4:	eb09015f 	cmp	x10, x9
   818a8:	52000108 	eor	w8, w8, #0x1
   818ac:	9a8a03e5 	csel	x5, xzr, x10, eq  // eq = none
   818b0:	b4000105 	cbz	x5, 818d0 <_ZN4core7unicode9printable5check17h12f0cec41989e29fE.llvm.2339018429671269780+0xd0>
   818b4:	eb09015f 	cmp	x10, x9
   818b8:	9a8a054a 	cinc	x10, x10, ne  // ne = any
   818bc:	39c000ad 	ldrsb	w13, [x5]
   818c0:	12001dac 	and	w12, w13, #0xff
   818c4:	36fffecd 	tbz	w13, #31, 8189c <_ZN4core7unicode9printable5check17h12f0cec41989e29fE.llvm.2339018429671269780+0x9c>
   818c8:	17ffffee 	b	81880 <_ZN4core7unicode9printable5check17h12f0cec41989e29fE.llvm.2339018429671269780+0x80>
   818cc:	2a1f03e8 	mov	w8, wzr
   818d0:	12000100 	and	w0, w8, #0x1
   818d4:	d65f03c0 	ret
   818d8:	52800028 	mov	w8, #0x1                   	// #1
   818dc:	12000100 	and	w0, w8, #0x1
   818e0:	d65f03c0 	ret
   818e4:	b0000020 	adrp	x0, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   818e8:	d0000022 	adrp	x2, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   818ec:	91088800 	add	x0, x0, #0x222
   818f0:	52800561 	mov	w1, #0x2b                  	// #43
   818f4:	913b2042 	add	x2, x2, #0xec8
   818f8:	9400026e 	bl	822b0 <_ZN4core9panicking5panic17h1276bf0d71dbfb98E>
   818fc:	d4200020 	brk	#0x1
   81900:	d0000022 	adrp	x2, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   81904:	aa0903e0 	mov	x0, x9
   81908:	913ac042 	add	x2, x2, #0xeb0
   8190c:	aa0803e1 	mov	x1, x8
   81910:	97fffe08 	bl	81130 <_ZN4core5slice5index22slice_index_order_fail17hb44310cbc3fa1d3fE>
   81914:	d4200020 	brk	#0x1
   81918:	d0000022 	adrp	x2, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   8191c:	aa0803e0 	mov	x0, x8
   81920:	913ac042 	add	x2, x2, #0xeb0
   81924:	aa0403e1 	mov	x1, x4
   81928:	97fffdee 	bl	810e0 <_ZN4core5slice5index24slice_end_index_len_fail17hb9f0a64be91517a4E>
   8192c:	d4200020 	brk	#0x1

0000000000081930 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17he6851cfd5ed0bdc4E>:
   81930:	d10103ff 	sub	sp, sp, #0x40
   81934:	b9400009 	ldr	w9, [x0]
   81938:	aa0103e0 	mov	x0, x1
   8193c:	f9001bfe 	str	x30, [sp, #48]
   81940:	d3447d28 	ubfx	x8, x9, #4, #28
   81944:	7109c51f 	cmp	w8, #0x271
   81948:	90000028 	adrp	x8, 85000 <__exception_handler_default>
   8194c:	91353d08 	add	x8, x8, #0xd4f
   81950:	540004c3 	b.cc	819e8 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17he6851cfd5ed0bdc4E+0xb8>  // b.lo, b.ul, b.last
   81954:	d28b296b 	mov	x11, #0x594b                	// #22859
   81958:	529c1ff0 	mov	w16, #0xe0ff                	// #57599
   8195c:	f2a710cb 	movk	x11, #0x3886, lsl #16
   81960:	aa1f03ea 	mov	x10, xzr
   81964:	f2d8bacb 	movk	x11, #0xc5d6, lsl #32
   81968:	5284e20c 	mov	w12, #0x2710                	// #10000
   8196c:	f2e68dab 	movk	x11, #0x346d, lsl #48
   81970:	52828f6d 	mov	w13, #0x147b                	// #5243
   81974:	52800c8e 	mov	w14, #0x64                  	// #100
   81978:	910023ef 	add	x15, sp, #0x8
   8197c:	72a0beb0 	movk	w16, #0x5f5, lsl #16
   81980:	aa0903f1 	mov	x17, x9
   81984:	9bcb7d29 	umulh	x9, x9, x11
   81988:	8b0a01e3 	add	x3, x15, x10
   8198c:	d100114a 	sub	x10, x10, #0x4
   81990:	d34bfd29 	lsr	x9, x9, #11
   81994:	eb10023f 	cmp	x17, x16
   81998:	1b0cc532 	msub	w18, w9, w12, w17
   8199c:	53023e41 	ubfx	w1, w18, #2, #14
   819a0:	1b0d7c21 	mul	w1, w1, w13
   819a4:	53117c21 	lsr	w1, w1, #17
   819a8:	1b0ec832 	msub	w18, w1, w14, w18
   819ac:	8b214501 	add	x1, x8, w1, uxtw #1
   819b0:	8b322512 	add	x18, x8, w18, uxth #1
   819b4:	39400422 	ldrb	w2, [x1, #1]
   819b8:	39400021 	ldrb	w1, [x1]
   819bc:	39400644 	ldrb	w4, [x18, #1]
   819c0:	39400252 	ldrb	w18, [x18]
   819c4:	39009062 	strb	w2, [x3, #36]
   819c8:	39008c61 	strb	w1, [x3, #35]
   819cc:	39009864 	strb	w4, [x3, #38]
   819d0:	39009472 	strb	w18, [x3, #37]
   819d4:	54fffd68 	b.hi	81980 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17he6851cfd5ed0bdc4E+0x50>  // b.pmore
   819d8:	91009d4a 	add	x10, x10, #0x27
   819dc:	f1018d3f 	cmp	x9, #0x63
   819e0:	540000a8 	b.hi	819f4 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17he6851cfd5ed0bdc4E+0xc4>  // b.pmore
   819e4:	14000013 	b	81a30 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17he6851cfd5ed0bdc4E+0x100>
   819e8:	528004ea 	mov	w10, #0x27                  	// #39
   819ec:	f1018d3f 	cmp	x9, #0x63
   819f0:	54000209 	b.ls	81a30 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17he6851cfd5ed0bdc4E+0x100>  // b.plast
   819f4:	52828f6b 	mov	w11, #0x147b                	// #5243
   819f8:	53023d2c 	ubfx	w12, w9, #2, #14
   819fc:	d100094a 	sub	x10, x10, #0x2
   81a00:	1b0b7d8b 	mul	w11, w12, w11
   81a04:	52800c8c 	mov	w12, #0x64                  	// #100
   81a08:	53117d6b 	lsr	w11, w11, #17
   81a0c:	1b0ca569 	msub	w9, w11, w12, w9
   81a10:	910023ec 	add	x12, sp, #0x8
   81a14:	8b0a018c 	add	x12, x12, x10
   81a18:	8b292509 	add	x9, x8, w9, uxth #1
   81a1c:	3940052d 	ldrb	w13, [x9, #1]
   81a20:	3940012e 	ldrb	w14, [x9]
   81a24:	aa0b03e9 	mov	x9, x11
   81a28:	3900058d 	strb	w13, [x12, #1]
   81a2c:	3900018e 	strb	w14, [x12]
   81a30:	f100293f 	cmp	x9, #0xa
   81a34:	540000ca 	b.ge	81a4c <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17he6851cfd5ed0bdc4E+0x11c>  // b.tcont
   81a38:	d1000548 	sub	x8, x10, #0x1
   81a3c:	1100c129 	add	w9, w9, #0x30
   81a40:	910023ea 	add	x10, sp, #0x8
   81a44:	38286949 	strb	w9, [x10, x8]
   81a48:	14000009 	b	81a6c <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17he6851cfd5ed0bdc4E+0x13c>
   81a4c:	8b090509 	add	x9, x8, x9, lsl #1
   81a50:	d1000948 	sub	x8, x10, #0x2
   81a54:	910023ea 	add	x10, sp, #0x8
   81a58:	8b08014a 	add	x10, x10, x8
   81a5c:	3940052b 	ldrb	w11, [x9, #1]
   81a60:	39400129 	ldrb	w9, [x9]
   81a64:	3900054b 	strb	w11, [x10, #1]
   81a68:	39000149 	strb	w9, [x10]
   81a6c:	910023e9 	add	x9, sp, #0x8
   81a70:	528004ea 	mov	w10, #0x27                  	// #39
   81a74:	b0000022 	adrp	x2, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   81a78:	8b080124 	add	x4, x9, x8
   81a7c:	cb080145 	sub	x5, x10, x8
   81a80:	91088042 	add	x2, x2, #0x220
   81a84:	52800021 	mov	w1, #0x1                   	// #1
   81a88:	aa1f03e3 	mov	x3, xzr
   81a8c:	94000349 	bl	827b0 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E>
   81a90:	f9401bfe 	ldr	x30, [sp, #48]
   81a94:	910103ff 	add	sp, sp, #0x40
   81a98:	d65f03c0 	ret
   81a9c:	00000000 	.inst	0x00000000 ; undefined

0000000000081aa0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h46890465b2877c61E>:
   81aa0:	d10103ff 	sub	sp, sp, #0x40
   81aa4:	f9400009 	ldr	x9, [x0]
   81aa8:	aa0103e0 	mov	x0, x1
   81aac:	f9001bfe 	str	x30, [sp, #48]
   81ab0:	d344fd28 	lsr	x8, x9, #4
   81ab4:	f109c51f 	cmp	x8, #0x271
   81ab8:	90000028 	adrp	x8, 85000 <__exception_handler_default>
   81abc:	91353d08 	add	x8, x8, #0xd4f
   81ac0:	540004c3 	b.cc	81b58 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h46890465b2877c61E+0xb8>  // b.lo, b.ul, b.last
   81ac4:	d28b296b 	mov	x11, #0x594b                	// #22859
   81ac8:	529c1ff0 	mov	w16, #0xe0ff                	// #57599
   81acc:	f2a710cb 	movk	x11, #0x3886, lsl #16
   81ad0:	aa1f03ea 	mov	x10, xzr
   81ad4:	f2d8bacb 	movk	x11, #0xc5d6, lsl #32
   81ad8:	5284e20c 	mov	w12, #0x2710                	// #10000
   81adc:	f2e68dab 	movk	x11, #0x346d, lsl #48
   81ae0:	52828f6d 	mov	w13, #0x147b                	// #5243
   81ae4:	52800c8e 	mov	w14, #0x64                  	// #100
   81ae8:	910023ef 	add	x15, sp, #0x8
   81aec:	72a0beb0 	movk	w16, #0x5f5, lsl #16
   81af0:	aa0903f1 	mov	x17, x9
   81af4:	9bcb7d29 	umulh	x9, x9, x11
   81af8:	8b0a01e3 	add	x3, x15, x10
   81afc:	d100114a 	sub	x10, x10, #0x4
   81b00:	d34bfd29 	lsr	x9, x9, #11
   81b04:	eb10023f 	cmp	x17, x16
   81b08:	1b0cc532 	msub	w18, w9, w12, w17
   81b0c:	53023e41 	ubfx	w1, w18, #2, #14
   81b10:	1b0d7c21 	mul	w1, w1, w13
   81b14:	53117c21 	lsr	w1, w1, #17
   81b18:	1b0ec832 	msub	w18, w1, w14, w18
   81b1c:	8b214501 	add	x1, x8, w1, uxtw #1
   81b20:	8b322512 	add	x18, x8, w18, uxth #1
   81b24:	39400422 	ldrb	w2, [x1, #1]
   81b28:	39400021 	ldrb	w1, [x1]
   81b2c:	39400644 	ldrb	w4, [x18, #1]
   81b30:	39400252 	ldrb	w18, [x18]
   81b34:	39009062 	strb	w2, [x3, #36]
   81b38:	39008c61 	strb	w1, [x3, #35]
   81b3c:	39009864 	strb	w4, [x3, #38]
   81b40:	39009472 	strb	w18, [x3, #37]
   81b44:	54fffd68 	b.hi	81af0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h46890465b2877c61E+0x50>  // b.pmore
   81b48:	91009d4a 	add	x10, x10, #0x27
   81b4c:	f1018d3f 	cmp	x9, #0x63
   81b50:	540000ac 	b.gt	81b64 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h46890465b2877c61E+0xc4>
   81b54:	14000013 	b	81ba0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h46890465b2877c61E+0x100>
   81b58:	528004ea 	mov	w10, #0x27                  	// #39
   81b5c:	f1018d3f 	cmp	x9, #0x63
   81b60:	5400020d 	b.le	81ba0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h46890465b2877c61E+0x100>
   81b64:	52828f6b 	mov	w11, #0x147b                	// #5243
   81b68:	53023d2c 	ubfx	w12, w9, #2, #14
   81b6c:	d100094a 	sub	x10, x10, #0x2
   81b70:	1b0b7d8b 	mul	w11, w12, w11
   81b74:	52800c8c 	mov	w12, #0x64                  	// #100
   81b78:	53117d6b 	lsr	w11, w11, #17
   81b7c:	1b0ca569 	msub	w9, w11, w12, w9
   81b80:	910023ec 	add	x12, sp, #0x8
   81b84:	8b0a018c 	add	x12, x12, x10
   81b88:	8b292509 	add	x9, x8, w9, uxth #1
   81b8c:	3940052d 	ldrb	w13, [x9, #1]
   81b90:	3940012e 	ldrb	w14, [x9]
   81b94:	aa0b03e9 	mov	x9, x11
   81b98:	3900058d 	strb	w13, [x12, #1]
   81b9c:	3900018e 	strb	w14, [x12]
   81ba0:	f100293f 	cmp	x9, #0xa
   81ba4:	540000ca 	b.ge	81bbc <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h46890465b2877c61E+0x11c>  // b.tcont
   81ba8:	d1000548 	sub	x8, x10, #0x1
   81bac:	1100c129 	add	w9, w9, #0x30
   81bb0:	910023ea 	add	x10, sp, #0x8
   81bb4:	38286949 	strb	w9, [x10, x8]
   81bb8:	14000009 	b	81bdc <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h46890465b2877c61E+0x13c>
   81bbc:	8b090509 	add	x9, x8, x9, lsl #1
   81bc0:	d1000948 	sub	x8, x10, #0x2
   81bc4:	910023ea 	add	x10, sp, #0x8
   81bc8:	8b08014a 	add	x10, x10, x8
   81bcc:	3940052b 	ldrb	w11, [x9, #1]
   81bd0:	39400129 	ldrb	w9, [x9]
   81bd4:	3900054b 	strb	w11, [x10, #1]
   81bd8:	39000149 	strb	w9, [x10]
   81bdc:	910023e9 	add	x9, sp, #0x8
   81be0:	528004ea 	mov	w10, #0x27                  	// #39
   81be4:	b0000022 	adrp	x2, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   81be8:	8b080124 	add	x4, x9, x8
   81bec:	cb080145 	sub	x5, x10, x8
   81bf0:	91088042 	add	x2, x2, #0x220
   81bf4:	52800021 	mov	w1, #0x1                   	// #1
   81bf8:	aa1f03e3 	mov	x3, xzr
   81bfc:	940002ed 	bl	827b0 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E>
   81c00:	f9401bfe 	ldr	x30, [sp, #48]
   81c04:	910103ff 	add	sp, sp, #0x40
   81c08:	d65f03c0 	ret
   81c0c:	00000000 	.inst	0x00000000 ; undefined

0000000000081c10 <_ZN60_$LT$core..cell..BorrowError$u20$as$u20$core..fmt..Debug$GT$3fmt17hac253b3e00c045d8E>:
   81c10:	a9422020 	ldp	x0, x8, [x1, #32]
   81c14:	b0000021 	adrp	x1, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   81c18:	52800162 	mov	w2, #0xb                   	// #11
   81c1c:	91203c21 	add	x1, x1, #0x80f
   81c20:	f9400d03 	ldr	x3, [x8, #24]
   81c24:	d61f0060 	br	x3
	...

0000000000081c30 <_ZN63_$LT$core..cell..BorrowMutError$u20$as$u20$core..fmt..Debug$GT$3fmt17h0f879e9748ab9313E>:
   81c30:	a9422020 	ldp	x0, x8, [x1, #32]
   81c34:	b0000021 	adrp	x1, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   81c38:	528001c2 	mov	w2, #0xe                   	// #14
   81c3c:	91206821 	add	x1, x1, #0x81a
   81c40:	f9400d03 	ldr	x3, [x8, #24]
   81c44:	d61f0060 	br	x3
	...

0000000000081c50 <_ZN4core6result13unwrap_failed17hc96e1f395f9c9207E>:
   81c50:	d101c3ff 	sub	sp, sp, #0x70
   81c54:	d0000009 	adrp	x9, 83000 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x420>
   81c58:	910003e8 	mov	x8, sp
   81c5c:	91254129 	add	x9, x9, #0x950
   81c60:	910043ea 	add	x10, sp, #0x10
   81c64:	a90007e0 	stp	x0, x1, [sp]
   81c68:	910083e0 	add	x0, sp, #0x20
   81c6c:	aa0403e1 	mov	x1, x4
   81c70:	a9010fe2 	stp	x2, x3, [sp, #16]
   81c74:	a90527e8 	stp	x8, x9, [sp, #80]
   81c78:	d0000008 	adrp	x8, 83000 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x420>
   81c7c:	91250108 	add	x8, x8, #0x940
   81c80:	d0000029 	adrp	x9, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   81c84:	913b8129 	add	x9, x9, #0xee0
   81c88:	a9037fff 	stp	xzr, xzr, [sp, #48]
   81c8c:	a90623ea 	stp	x10, x8, [sp, #96]
   81c90:	52800048 	mov	w8, #0x2                   	// #2
   81c94:	a90223e9 	stp	x9, x8, [sp, #32]
   81c98:	910143e9 	add	x9, sp, #0x50
   81c9c:	a90423e9 	stp	x9, x8, [sp, #64]
   81ca0:	940001a8 	bl	82340 <_ZN4core9panicking9panic_fmt17h2fb479caa573f9e3E>
   81ca4:	d4200020 	brk	#0x1
	...

0000000000081cb0 <_ZN4core3str16slice_error_fail17h932895516ec20f79E>:
   81cb0:	f104043f 	cmp	x1, #0x101
   81cb4:	a9b30fe2 	stp	x2, x3, [sp, #-208]!
   81cb8:	54000122 	b.cs	81cdc <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2c>  // b.hs, b.nlast
   81cbc:	b0000029 	adrp	x9, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   81cc0:	aa1f03e8 	mov	x8, xzr
   81cc4:	91214d29 	add	x9, x9, #0x853
   81cc8:	a90107e0 	stp	x0, x1, [sp, #16]
   81ccc:	eb01005f 	cmp	x2, x1
   81cd0:	a90223e9 	stp	x9, x8, [sp, #32]
   81cd4:	54001649 	b.ls	81f9c <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2ec>  // b.plast
   81cd8:	140000c5 	b	81fec <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x33c>
   81cdc:	52802008 	mov	w8, #0x100                 	// #256
   81ce0:	38e86809 	ldrsb	w9, [x0, x8]
   81ce4:	3101053f 	cmn	w9, #0x41
   81ce8:	5400140c 	b.gt	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81cec:	8b080009 	add	x9, x0, x8
   81cf0:	38dff12a 	ldursb	w10, [x9, #-1]
   81cf4:	3101055f 	cmn	w10, #0x41
   81cf8:	54000bec 	b.gt	81e74 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x1c4>
   81cfc:	38dfe12a 	ldursb	w10, [x9, #-2]
   81d00:	3101055f 	cmn	w10, #0x41
   81d04:	54000bcc 	b.gt	81e7c <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x1cc>
   81d08:	38dfd12a 	ldursb	w10, [x9, #-3]
   81d0c:	3101055f 	cmn	w10, #0x41
   81d10:	54000bac 	b.gt	81e84 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x1d4>
   81d14:	38dfc12a 	ldursb	w10, [x9, #-4]
   81d18:	3101055f 	cmn	w10, #0x41
   81d1c:	54000b8c 	b.gt	81e8c <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x1dc>
   81d20:	38dfb12a 	ldursb	w10, [x9, #-5]
   81d24:	3101055f 	cmn	w10, #0x41
   81d28:	54000b6c 	b.gt	81e94 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x1e4>
   81d2c:	38dfa12a 	ldursb	w10, [x9, #-6]
   81d30:	3101055f 	cmn	w10, #0x41
   81d34:	54000b4c 	b.gt	81e9c <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x1ec>
   81d38:	38df912a 	ldursb	w10, [x9, #-7]
   81d3c:	3101055f 	cmn	w10, #0x41
   81d40:	54000b2c 	b.gt	81ea4 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x1f4>
   81d44:	38df812a 	ldursb	w10, [x9, #-8]
   81d48:	3101055f 	cmn	w10, #0x41
   81d4c:	54000b0c 	b.gt	81eac <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x1fc>
   81d50:	38df712a 	ldursb	w10, [x9, #-9]
   81d54:	3101055f 	cmn	w10, #0x41
   81d58:	54000aec 	b.gt	81eb4 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x204>
   81d5c:	38df612a 	ldursb	w10, [x9, #-10]
   81d60:	3101055f 	cmn	w10, #0x41
   81d64:	54000acc 	b.gt	81ebc <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x20c>
   81d68:	38df512a 	ldursb	w10, [x9, #-11]
   81d6c:	3101055f 	cmn	w10, #0x41
   81d70:	54000aac 	b.gt	81ec4 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x214>
   81d74:	38df412a 	ldursb	w10, [x9, #-12]
   81d78:	3101055f 	cmn	w10, #0x41
   81d7c:	54000a8c 	b.gt	81ecc <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x21c>
   81d80:	38df312a 	ldursb	w10, [x9, #-13]
   81d84:	3101055f 	cmn	w10, #0x41
   81d88:	54000a6c 	b.gt	81ed4 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x224>
   81d8c:	38df212a 	ldursb	w10, [x9, #-14]
   81d90:	3101055f 	cmn	w10, #0x41
   81d94:	54000a4c 	b.gt	81edc <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x22c>
   81d98:	38df112a 	ldursb	w10, [x9, #-15]
   81d9c:	3101055f 	cmn	w10, #0x41
   81da0:	54000a2c 	b.gt	81ee4 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x234>
   81da4:	38df012a 	ldursb	w10, [x9, #-16]
   81da8:	3101055f 	cmn	w10, #0x41
   81dac:	54000a0c 	b.gt	81eec <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x23c>
   81db0:	38def12a 	ldursb	w10, [x9, #-17]
   81db4:	3101055f 	cmn	w10, #0x41
   81db8:	540009ec 	b.gt	81ef4 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x244>
   81dbc:	38dee12a 	ldursb	w10, [x9, #-18]
   81dc0:	3101055f 	cmn	w10, #0x41
   81dc4:	540009cc 	b.gt	81efc <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x24c>
   81dc8:	38ded12a 	ldursb	w10, [x9, #-19]
   81dcc:	3101055f 	cmn	w10, #0x41
   81dd0:	540009ac 	b.gt	81f04 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x254>
   81dd4:	38dec12a 	ldursb	w10, [x9, #-20]
   81dd8:	3101055f 	cmn	w10, #0x41
   81ddc:	5400098c 	b.gt	81f0c <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x25c>
   81de0:	38deb12a 	ldursb	w10, [x9, #-21]
   81de4:	3101055f 	cmn	w10, #0x41
   81de8:	5400096c 	b.gt	81f14 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x264>
   81dec:	38dea12a 	ldursb	w10, [x9, #-22]
   81df0:	3101055f 	cmn	w10, #0x41
   81df4:	5400094c 	b.gt	81f1c <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x26c>
   81df8:	38de912a 	ldursb	w10, [x9, #-23]
   81dfc:	3101055f 	cmn	w10, #0x41
   81e00:	5400092c 	b.gt	81f24 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x274>
   81e04:	38de812a 	ldursb	w10, [x9, #-24]
   81e08:	3101055f 	cmn	w10, #0x41
   81e0c:	5400090c 	b.gt	81f2c <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x27c>
   81e10:	38de712a 	ldursb	w10, [x9, #-25]
   81e14:	3101055f 	cmn	w10, #0x41
   81e18:	540008ec 	b.gt	81f34 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x284>
   81e1c:	38de612a 	ldursb	w10, [x9, #-26]
   81e20:	3101055f 	cmn	w10, #0x41
   81e24:	540008cc 	b.gt	81f3c <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x28c>
   81e28:	38de512a 	ldursb	w10, [x9, #-27]
   81e2c:	3101055f 	cmn	w10, #0x41
   81e30:	540008ac 	b.gt	81f44 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x294>
   81e34:	38de412a 	ldursb	w10, [x9, #-28]
   81e38:	3101055f 	cmn	w10, #0x41
   81e3c:	5400088c 	b.gt	81f4c <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x29c>
   81e40:	38de312a 	ldursb	w10, [x9, #-29]
   81e44:	3101055f 	cmn	w10, #0x41
   81e48:	5400086c 	b.gt	81f54 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2a4>
   81e4c:	38de212a 	ldursb	w10, [x9, #-30]
   81e50:	3101055f 	cmn	w10, #0x41
   81e54:	5400084c 	b.gt	81f5c <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2ac>
   81e58:	38de1129 	ldursb	w9, [x9, #-31]
   81e5c:	3101053f 	cmn	w9, #0x41
   81e60:	5400082c 	b.gt	81f64 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b4>
   81e64:	f1008108 	subs	x8, x8, #0x20
   81e68:	54fff3c1 	b.ne	81ce0 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x30>  // b.any
   81e6c:	aa1f03e9 	mov	x9, xzr
   81e70:	14000044 	b	81f80 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2d0>
   81e74:	d1000508 	sub	x8, x8, #0x1
   81e78:	1400003c 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81e7c:	d1000908 	sub	x8, x8, #0x2
   81e80:	1400003a 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81e84:	d1000d08 	sub	x8, x8, #0x3
   81e88:	14000038 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81e8c:	d1001108 	sub	x8, x8, #0x4
   81e90:	14000036 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81e94:	d1001508 	sub	x8, x8, #0x5
   81e98:	14000034 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81e9c:	d1001908 	sub	x8, x8, #0x6
   81ea0:	14000032 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81ea4:	d1001d08 	sub	x8, x8, #0x7
   81ea8:	14000030 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81eac:	d1002108 	sub	x8, x8, #0x8
   81eb0:	1400002e 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81eb4:	d1002508 	sub	x8, x8, #0x9
   81eb8:	1400002c 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81ebc:	d1002908 	sub	x8, x8, #0xa
   81ec0:	1400002a 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81ec4:	d1002d08 	sub	x8, x8, #0xb
   81ec8:	14000028 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81ecc:	d1003108 	sub	x8, x8, #0xc
   81ed0:	14000026 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81ed4:	d1003508 	sub	x8, x8, #0xd
   81ed8:	14000024 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81edc:	d1003908 	sub	x8, x8, #0xe
   81ee0:	14000022 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81ee4:	d1003d08 	sub	x8, x8, #0xf
   81ee8:	14000020 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81eec:	d1004108 	sub	x8, x8, #0x10
   81ef0:	1400001e 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81ef4:	d1004508 	sub	x8, x8, #0x11
   81ef8:	1400001c 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81efc:	d1004908 	sub	x8, x8, #0x12
   81f00:	1400001a 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81f04:	d1004d08 	sub	x8, x8, #0x13
   81f08:	14000018 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81f0c:	d1005108 	sub	x8, x8, #0x14
   81f10:	14000016 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81f14:	d1005508 	sub	x8, x8, #0x15
   81f18:	14000014 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81f1c:	d1005908 	sub	x8, x8, #0x16
   81f20:	14000012 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81f24:	d1005d08 	sub	x8, x8, #0x17
   81f28:	14000010 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81f2c:	d1006108 	sub	x8, x8, #0x18
   81f30:	1400000e 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81f34:	d1006508 	sub	x8, x8, #0x19
   81f38:	1400000c 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81f3c:	d1006908 	sub	x8, x8, #0x1a
   81f40:	1400000a 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81f44:	d1006d08 	sub	x8, x8, #0x1b
   81f48:	14000008 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81f4c:	d1007108 	sub	x8, x8, #0x1c
   81f50:	14000006 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81f54:	d1007508 	sub	x8, x8, #0x1d
   81f58:	14000004 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81f5c:	d1007908 	sub	x8, x8, #0x1e
   81f60:	14000002 	b	81f68 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2b8>
   81f64:	d1007d08 	sub	x8, x8, #0x1f
   81f68:	eb01011f 	cmp	x8, x1
   81f6c:	54000062 	b.cs	81f78 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2c8>  // b.hs, b.nlast
   81f70:	aa0803e9 	mov	x9, x8
   81f74:	14000003 	b	81f80 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x2d0>
   81f78:	aa0103e9 	mov	x9, x1
   81f7c:	54000801 	b.ne	8207c <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x3cc>  // b.any
   81f80:	a90127e0 	stp	x0, x9, [sp, #16]
   81f84:	b0000029 	adrp	x9, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   81f88:	528000a8 	mov	w8, #0x5                   	// #5
   81f8c:	91233929 	add	x9, x9, #0x8ce
   81f90:	eb01005f 	cmp	x2, x1
   81f94:	a90223e9 	stp	x9, x8, [sp, #32]
   81f98:	540002a8 	b.hi	81fec <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x33c>  // b.pmore
   81f9c:	eb01007f 	cmp	x3, x1
   81fa0:	54000268 	b.hi	81fec <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x33c>  // b.pmore
   81fa4:	eb03005f 	cmp	x2, x3
   81fa8:	54000529 	b.ls	8204c <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x39c>  // b.plast
   81fac:	b0000029 	adrp	x9, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   81fb0:	910003e8 	mov	x8, sp
   81fb4:	910023ea 	add	x10, sp, #0x8
   81fb8:	d000000b 	adrp	x11, 83000 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x420>
   81fbc:	9125416b 	add	x11, x11, #0x950
   81fc0:	f9476d29 	ldr	x9, [x9, #3800]
   81fc4:	a90827e8 	stp	x8, x9, [sp, #128]
   81fc8:	910043e8 	add	x8, sp, #0x10
   81fcc:	a90927ea 	stp	x10, x9, [sp, #144]
   81fd0:	910083e9 	add	x9, sp, #0x20
   81fd4:	a90a2fe8 	stp	x8, x11, [sp, #160]
   81fd8:	52800088 	mov	w8, #0x4                   	// #4
   81fdc:	a90b2fe9 	stp	x9, x11, [sp, #176]
   81fe0:	d0000029 	adrp	x9, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   81fe4:	913d2129 	add	x9, x9, #0xf48
   81fe8:	14000011 	b	8202c <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x37c>
   81fec:	b000002a 	adrp	x10, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   81ff0:	eb01005f 	cmp	x2, x1
   81ff4:	9a838048 	csel	x8, x2, x3, hi  // hi = pmore
   81ff8:	910103e9 	add	x9, sp, #0x40
   81ffc:	910043eb 	add	x11, sp, #0x10
   82000:	f9476d4a 	ldr	x10, [x10, #3800]
   82004:	f90023e8 	str	x8, [sp, #64]
   82008:	b0000008 	adrp	x8, 83000 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x420>
   8200c:	91254108 	add	x8, x8, #0x950
   82010:	a9082be9 	stp	x9, x10, [sp, #128]
   82014:	910083e9 	add	x9, sp, #0x20
   82018:	a90923eb 	stp	x11, x8, [sp, #144]
   8201c:	a90a23e9 	stp	x9, x8, [sp, #160]
   82020:	b0000029 	adrp	x9, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   82024:	52800068 	mov	w8, #0x3                   	// #3
   82028:	913c6129 	add	x9, x9, #0xf18
   8202c:	a90523e9 	stp	x9, x8, [sp, #80]
   82030:	910203e9 	add	x9, sp, #0x80
   82034:	910143e0 	add	x0, sp, #0x50
   82038:	aa0403e1 	mov	x1, x4
   8203c:	a9067fff 	stp	xzr, xzr, [sp, #96]
   82040:	a90723e9 	stp	x9, x8, [sp, #112]
   82044:	940000bf 	bl	82340 <_ZN4core9panicking9panic_fmt17h2fb479caa573f9e3E>
   82048:	d4200020 	brk	#0x1
   8204c:	b5000242 	cbnz	x2, 82094 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x3e4>
   82050:	f9001be3 	str	x3, [sp, #48]
   82054:	b50004e3 	cbnz	x3, 820f0 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x440>
   82058:	aa1f03e3 	mov	x3, xzr
   8205c:	eb01007f 	cmp	x3, x1
   82060:	54000261 	b.ne	820ac <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x3fc>  // b.any
   82064:	90000020 	adrp	x0, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   82068:	52800561 	mov	w1, #0x2b                  	// #43
   8206c:	9120a000 	add	x0, x0, #0x828
   82070:	aa0403e2 	mov	x2, x4
   82074:	9400008f 	bl	822b0 <_ZN4core9panicking5panic17h1276bf0d71dbfb98E>
   82078:	d4200020 	brk	#0x1
   8207c:	b0000024 	adrp	x4, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   82080:	aa1f03e2 	mov	x2, xzr
   82084:	913c0084 	add	x4, x4, #0xf00
   82088:	aa0803e3 	mov	x3, x8
   8208c:	97ffff09 	bl	81cb0 <_ZN4core3str16slice_error_fail17h932895516ec20f79E>
   82090:	d4200020 	brk	#0x1
   82094:	eb01005f 	cmp	x2, x1
   82098:	540001a2 	b.cs	820cc <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x41c>  // b.hs, b.nlast
   8209c:	38e26808 	ldrsb	w8, [x0, x2]
   820a0:	3101051f 	cmn	w8, #0x41
   820a4:	54fffd6c 	b.gt	82050 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x3a0>
   820a8:	1400000b 	b	820d4 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x424>
   820ac:	8b030008 	add	x8, x0, x3
   820b0:	aa0803eb 	mov	x11, x8
   820b4:	38c0156a 	ldrsb	w10, [x11], #1
   820b8:	12001d49 	and	w9, w10, #0xff
   820bc:	37f8026a 	tbnz	w10, #31, 82108 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x458>
   820c0:	52800028 	mov	w8, #0x1                   	// #1
   820c4:	b9003fe9 	str	w9, [sp, #60]
   820c8:	14000044 	b	821d8 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x528>
   820cc:	eb02003f 	cmp	x1, x2
   820d0:	54fffc00 	b.eq	82050 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x3a0>  // b.none
   820d4:	aa0203e3 	mov	x3, x2
   820d8:	f9001be2 	str	x2, [sp, #48]
   820dc:	14000005 	b	820f0 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x440>
   820e0:	eb03003f 	cmp	x1, x3
   820e4:	54fffc00 	b.eq	82064 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x3b4>  // b.none
   820e8:	f1000463 	subs	x3, x3, #0x1
   820ec:	54fffb60 	b.eq	82058 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x3a8>  // b.none
   820f0:	eb01007f 	cmp	x3, x1
   820f4:	54ffff62 	b.cs	820e0 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x430>  // b.hs, b.nlast
   820f8:	38e36808 	ldrsb	w8, [x0, x3]
   820fc:	3101011f 	cmn	w8, #0x40
   82100:	54ffff4b 	b.lt	820e8 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x438>  // b.tstop
   82104:	17ffffd6 	b	8205c <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x3ac>
   82108:	8b01000a 	add	x10, x0, x1
   8210c:	eb0a017f 	cmp	x11, x10
   82110:	54000101 	b.ne	82130 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x480>  // b.any
   82114:	2a1f03e8 	mov	w8, wzr
   82118:	aa0a03ec 	mov	x12, x10
   8211c:	1200112b 	and	w11, w9, #0x1f
   82120:	71037d3f 	cmp	w9, #0xdf
   82124:	54000128 	b.hi	82148 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x498>  // b.pmore
   82128:	331a1168 	bfi	w8, w11, #6, #5
   8212c:	1400001f 	b	821a8 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x4f8>
   82130:	3940050b 	ldrb	w11, [x8, #1]
   82134:	9100090c 	add	x12, x8, #0x2
   82138:	12001568 	and	w8, w11, #0x3f
   8213c:	1200112b 	and	w11, w9, #0x1f
   82140:	71037d3f 	cmp	w9, #0xdf
   82144:	54ffff29 	b.ls	82128 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x478>  // b.plast
   82148:	eb0a019f 	cmp	x12, x10
   8214c:	54000081 	b.ne	8215c <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x4ac>  // b.any
   82150:	2a1f03ed 	mov	w13, wzr
   82154:	aa0a03ec 	mov	x12, x10
   82158:	14000003 	b	82164 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x4b4>
   8215c:	3840158d 	ldrb	w13, [x12], #1
   82160:	120015ad 	and	w13, w13, #0x3f
   82164:	331a150d 	bfi	w13, w8, #6, #6
   82168:	7103c13f 	cmp	w9, #0xf0
   8216c:	540000a3 	b.cc	82180 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x4d0>  // b.lo, b.ul, b.last
   82170:	eb0a019f 	cmp	x12, x10
   82174:	540000c1 	b.ne	8218c <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x4dc>  // b.any
   82178:	2a1f03e8 	mov	w8, wzr
   8217c:	14000006 	b	82194 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x4e4>
   82180:	3314116d 	bfi	w13, w11, #12, #5
   82184:	2a0d03e8 	mov	w8, w13
   82188:	14000008 	b	821a8 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x4f8>
   8218c:	39400188 	ldrb	w8, [x12]
   82190:	12001508 	and	w8, w8, #0x3f
   82194:	530e0969 	ubfiz	w9, w11, #18, #3
   82198:	331a2da9 	bfi	w9, w13, #6, #12
   8219c:	2a080128 	orr	w8, w9, w8
   821a0:	7144411f 	cmp	w8, #0x110, lsl #12
   821a4:	54fff600 	b.eq	82064 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x3b4>  // b.none
   821a8:	7102011f 	cmp	w8, #0x80
   821ac:	b9003fe8 	str	w8, [sp, #60]
   821b0:	54000062 	b.cs	821bc <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x50c>  // b.hs, b.nlast
   821b4:	52800028 	mov	w8, #0x1                   	// #1
   821b8:	14000008 	b	821d8 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x528>
   821bc:	7120011f 	cmp	w8, #0x800
   821c0:	54000062 	b.cs	821cc <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x51c>  // b.hs, b.nlast
   821c4:	52800048 	mov	w8, #0x2                   	// #2
   821c8:	14000004 	b	821d8 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x528>
   821cc:	7140411f 	cmp	w8, #0x10, lsl #12
   821d0:	52800068 	mov	w8, #0x3                   	// #3
   821d4:	9a883508 	cinc	x8, x8, cs  // cs = hs, nlast
   821d8:	9000002a 	adrp	x10, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   821dc:	9000002b 	adrp	x11, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   821e0:	8b030108 	add	x8, x8, x3
   821e4:	9100c3e9 	add	x9, sp, #0x30
   821e8:	f9476d4a 	ldr	x10, [x10, #3800]
   821ec:	f947716b 	ldr	x11, [x11, #3808]
   821f0:	a90423e3 	stp	x3, x8, [sp, #64]
   821f4:	9100f3e8 	add	x8, sp, #0x3c
   821f8:	a9082be9 	stp	x9, x10, [sp, #128]
   821fc:	f0ffffe9 	adrp	x9, 81000 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i64$GT$3fmt17h5b549b8f8f8626b6E+0x10>
   82200:	910b4129 	add	x9, x9, #0x2d0
   82204:	910103ea 	add	x10, sp, #0x40
   82208:	a9092fe8 	stp	x8, x11, [sp, #144]
   8220c:	b000000b 	adrp	x11, 83000 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x420>
   82210:	9125416b 	add	x11, x11, #0x950
   82214:	910043e8 	add	x8, sp, #0x10
   82218:	a90a27ea 	stp	x10, x9, [sp, #160]
   8221c:	910083e9 	add	x9, sp, #0x20
   82220:	a90b2fe8 	stp	x8, x11, [sp, #176]
   82224:	528000a8 	mov	w8, #0x5                   	// #5
   82228:	a90c2fe9 	stp	x9, x11, [sp, #192]
   8222c:	b0000029 	adrp	x9, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   82230:	913e2129 	add	x9, x9, #0xf88
   82234:	17ffff7e 	b	8202c <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x37c>
	...

0000000000082240 <_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17he4f0107a5c0e69b3E>:
   82240:	d29b4ac0 	mov	x0, #0xda56                	// #55894
   82244:	f2a97e60 	movk	x0, #0x4bf3, lsl #16
   82248:	f2cb2f20 	movk	x0, #0x5979, lsl #32
   8224c:	f2ef9ba0 	movk	x0, #0x7cdd, lsl #48
   82250:	d65f03c0 	ret
	...

0000000000082260 <_ZN4core5panic10panic_info9PanicInfo8location17he58c7765cd5d2043E>:
   82260:	f9400c00 	ldr	x0, [x0, #24]
   82264:	d65f03c0 	ret
	...

0000000000082270 <_ZN4core3ptr28drop_in_place$LT$$RF$u64$GT$17hd5ba8fcbb9fdb90bE.llvm.14833330310357332318>:
   82270:	d65f03c0 	ret
	...

0000000000082280 <_ZN4core5panic8location8Location4file17h918403ddba986633E>:
   82280:	a9400408 	ldp	x8, x1, [x0]
   82284:	aa0803e0 	mov	x0, x8
   82288:	d65f03c0 	ret
   8228c:	00000000 	.inst	0x00000000 ; undefined

0000000000082290 <_ZN4core5panic8location8Location4line17hd2d5b0d999bfd45dE>:
   82290:	b9401000 	ldr	w0, [x0, #16]
   82294:	d65f03c0 	ret
	...

00000000000822a0 <_ZN4core5panic8location8Location6column17h7f6cd155d4327e1eE>:
   822a0:	b9401400 	ldr	w0, [x0, #20]
   822a4:	d65f03c0 	ret
	...

00000000000822b0 <_ZN4core9panicking5panic17h1276bf0d71dbfb98E>:
   822b0:	d10103ff 	sub	sp, sp, #0x40
   822b4:	9100c3e8 	add	x8, sp, #0x30
   822b8:	52800029 	mov	w9, #0x1                   	// #1
   822bc:	a90307e0 	stp	x0, x1, [sp, #48]
   822c0:	910003e0 	mov	x0, sp
   822c4:	aa0203e1 	mov	x1, x2
   822c8:	a9017fff 	stp	xzr, xzr, [sp, #16]
   822cc:	a90027e8 	stp	x8, x9, [sp]
   822d0:	90000028 	adrp	x8, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   822d4:	9124e108 	add	x8, x8, #0x938
   822d8:	a9027fe8 	stp	x8, xzr, [sp, #32]
   822dc:	94000019 	bl	82340 <_ZN4core9panicking9panic_fmt17h2fb479caa573f9e3E>
   822e0:	d4200020 	brk	#0x1
	...

00000000000822f0 <_ZN4core9panicking18panic_bounds_check17h7e98c39e5d454fafE>:
   822f0:	d10183ff 	sub	sp, sp, #0x60
   822f4:	90000029 	adrp	x9, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   822f8:	910023e8 	add	x8, sp, #0x8
   822fc:	910003ea 	mov	x10, sp
   82300:	f9476d29 	ldr	x9, [x9, #3800]
   82304:	a90007e0 	stp	x0, x1, [sp]
   82308:	910043e0 	add	x0, sp, #0x10
   8230c:	aa0203e1 	mov	x1, x2
   82310:	a9027fff 	stp	xzr, xzr, [sp, #32]
   82314:	a90427e8 	stp	x8, x9, [sp, #64]
   82318:	52800048 	mov	w8, #0x2                   	// #2
   8231c:	a90527ea 	stp	x10, x9, [sp, #80]
   82320:	b0000029 	adrp	x9, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   82324:	913fe129 	add	x9, x9, #0xff8
   82328:	a90123e9 	stp	x9, x8, [sp, #16]
   8232c:	910103e9 	add	x9, sp, #0x40
   82330:	a90323e9 	stp	x9, x8, [sp, #48]
   82334:	94000003 	bl	82340 <_ZN4core9panicking9panic_fmt17h2fb479caa573f9e3E>
   82338:	d4200020 	brk	#0x1
   8233c:	00000000 	.inst	0x00000000 ; undefined

0000000000082340 <_ZN4core9panicking9panic_fmt17h2fb479caa573f9e3E>:
   82340:	90000028 	adrp	x8, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   82344:	b0000029 	adrp	x9, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   82348:	9124e108 	add	x8, x8, #0x938
   8234c:	913f6129 	add	x9, x9, #0xfd8
   82350:	a9be27e8 	stp	x8, x9, [sp, #-32]!
   82354:	a90107e0 	stp	x0, x1, [sp, #16]
   82358:	910003e0 	mov	x0, sp
   8235c:	94000005 	bl	82370 <rust_begin_unwind>
   82360:	d4200020 	brk	#0x1
	...

0000000000082370 <rust_begin_unwind>:
   82370:	d10243ff 	sub	sp, sp, #0x90
   82374:	a9084ffe 	stp	x30, x19, [sp, #128]
   82378:	97ffffba 	bl	82260 <_ZN4core5panic10panic_info9PanicInfo8location17he58c7765cd5d2043E>
   8237c:	90000028 	adrp	x8, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   82380:	f9477508 	ldr	x8, [x8, #3816]
   82384:	b4000420 	cbz	x0, 82408 <rust_begin_unwind+0x98>
   82388:	f9400108 	ldr	x8, [x8]
   8238c:	b40005c8 	cbz	x8, 82444 <rust_begin_unwind+0xd4>
   82390:	aa0003f3 	mov	x19, x0
   82394:	97ffffbb 	bl	82280 <_ZN4core5panic8location8Location4file17h918403ddba986633E>
   82398:	a90387e0 	stp	x0, x1, [sp, #56]
   8239c:	aa1303e0 	mov	x0, x19
   823a0:	97ffffbc 	bl	82290 <_ZN4core5panic8location8Location4line17hd2d5b0d999bfd45dE>
   823a4:	b9004be0 	str	w0, [sp, #72]
   823a8:	aa1303e0 	mov	x0, x19
   823ac:	97ffffbd 	bl	822a0 <_ZN4core5panic8location8Location6column17h7f6cd155d4327e1eE>
   823b0:	90000009 	adrp	x9, 82000 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x350>
   823b4:	9000002b 	adrp	x11, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   823b8:	9100e3e8 	add	x8, sp, #0x38
   823bc:	9114c129 	add	x9, x9, #0x530
   823c0:	b9004fe0 	str	w0, [sp, #76]
   823c4:	d0000022 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   823c8:	f947796b 	ldr	x11, [x11, #3824]
   823cc:	910123ea 	add	x10, sp, #0x48
   823d0:	a90527e8 	stp	x8, x9, [sp, #80]
   823d4:	910133e8 	add	x8, sp, #0x4c
   823d8:	d0000029 	adrp	x9, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   823dc:	91024042 	add	x2, x2, #0x90
   823e0:	91018129 	add	x9, x9, #0x60
   823e4:	910023e0 	add	x0, sp, #0x8
   823e8:	a9072fe8 	stp	x8, x11, [sp, #112]
   823ec:	52800068 	mov	w8, #0x3                   	// #3
   823f0:	a9062fea 	stp	x10, x11, [sp, #96]
   823f4:	a901ffff 	stp	xzr, xzr, [sp, #24]
   823f8:	a900a3e9 	stp	x9, x8, [sp, #8]
   823fc:	910143e9 	add	x9, sp, #0x50
   82400:	a902a3e9 	stp	x9, x8, [sp, #40]
   82404:	1400000e 	b	8243c <rust_begin_unwind+0xcc>
   82408:	f9400108 	ldr	x8, [x8]
   8240c:	b40001c8 	cbz	x8, 82444 <rust_begin_unwind+0xd4>
   82410:	d0000028 	adrp	x8, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   82414:	52800029 	mov	w9, #0x1                   	// #1
   82418:	91006108 	add	x8, x8, #0x18
   8241c:	d0000022 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   82420:	a9067fff 	stp	xzr, xzr, [sp, #96]
   82424:	9100a042 	add	x2, x2, #0x28
   82428:	910143e0 	add	x0, sp, #0x50
   8242c:	a90527e8 	stp	x8, x9, [sp, #80]
   82430:	90000028 	adrp	x8, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   82434:	9125c108 	add	x8, x8, #0x970
   82438:	a9077fe8 	stp	x8, xzr, [sp, #112]
   8243c:	52800021 	mov	w1, #0x1                   	// #1
   82440:	94000014 	bl	82490 <_ZN3log17__private_api_log17haa499543e16634a1E>
   82444:	14000000 	b	82444 <rust_begin_unwind+0xd4>
	...

0000000000082450 <_ZN4core3ptr32drop_in_place$LT$$RF$$RF$str$GT$17h8de11ae9a12aa18eE>:
   82450:	d65f03c0 	ret
	...

0000000000082460 <_ZN43_$LT$log..NopLogger$u20$as$u20$log..Log$GT$7enabled17ha489d50b3cf43f77E>:
   82460:	2a1f03e0 	mov	w0, wzr
   82464:	d65f03c0 	ret
	...

0000000000082470 <_ZN43_$LT$log..NopLogger$u20$as$u20$log..Log$GT$3log17hf245f4a53db4aac8E>:
   82470:	d65f03c0 	ret
	...

0000000000082480 <_ZN43_$LT$log..NopLogger$u20$as$u20$log..Log$GT$5flush17he4fce0f13ef37046E>:
   82480:	d65f03c0 	ret
	...

0000000000082490 <_ZN3log17__private_api_log17haa499543e16634a1E>:
   82490:	d10243ff 	sub	sp, sp, #0x90
   82494:	b0000029 	adrp	x9, 87000 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951+0xc0>
   82498:	f90043fe 	str	x30, [sp, #128]
   8249c:	91014129 	add	x9, x9, #0x50
   824a0:	b9403050 	ldr	w16, [x2, #48]
   824a4:	a9402c4a 	ldp	x10, x11, [x2]
   824a8:	d0000031 	adrp	x17, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   824ac:	52800028 	mov	w8, #0x1                   	// #1
   824b0:	a941344c 	ldp	x12, x13, [x2, #16]
   824b4:	91046231 	add	x17, x17, #0x118
   824b8:	a9423c4e 	ldp	x14, x15, [x2, #32]
   824bc:	c8dffd29 	ldar	x9, [x9]
   824c0:	a940c803 	ldp	x3, x18, [x0, #8]
   824c4:	f9400002 	ldr	x2, [x0]
   824c8:	a9002be1 	stp	x1, x10, [sp]
   824cc:	d0000021 	adrp	x1, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   824d0:	a9024be3 	stp	x3, x18, [sp, #32]
   824d4:	91038021 	add	x1, x1, #0xe0
   824d8:	a9404632 	ldp	x18, x17, [x17]
   824dc:	f100093f 	cmp	x9, #0x2
   824e0:	a941a804 	ldp	x4, x10, [x0, #24]
   824e4:	f9401400 	ldr	x0, [x0, #40]
   824e8:	9a810229 	csel	x9, x17, x1, eq  // eq = none
   824ec:	a90537ec 	stp	x12, x13, [sp, #80]
   824f0:	910003e1 	mov	x1, sp
   824f4:	a9032be4 	stp	x4, x10, [sp, #48]
   824f8:	9000002a 	adrp	x10, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   824fc:	a9063bff 	stp	xzr, x14, [sp, #96]
   82500:	9127c14a 	add	x10, x10, #0x9f0
   82504:	a9047fe0 	stp	x0, xzr, [sp, #64]
   82508:	9a8a0240 	csel	x0, x18, x10, eq  // eq = none
   8250c:	f9003bef 	str	x15, [sp, #112]
   82510:	290f43e8 	stp	w8, w16, [sp, #120]
   82514:	f9401528 	ldr	x8, [x9, #40]
   82518:	a9010beb 	stp	x11, x2, [sp, #16]
   8251c:	d63f0100 	blr	x8
   82520:	f94043fe 	ldr	x30, [sp, #128]
   82524:	910243ff 	add	sp, sp, #0x90
   82528:	d65f03c0 	ret
   8252c:	00000000 	.inst	0x00000000 ; undefined

0000000000082530 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h4abc4ee51eac9854E>:
   82530:	a9402408 	ldp	x8, x9, [x0]
   82534:	aa0103e2 	mov	x2, x1
   82538:	aa0803e0 	mov	x0, x8
   8253c:	aa0903e1 	mov	x1, x9
   82540:	140002bc 	b	83030 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E>
	...

0000000000082550 <_ZN4core3ops8function6FnOnce9call_once17h049e8c8a1d0ce9b8E.llvm.2931485523929443995>:
   82550:	f940001f 	ldr	xzr, [x0]
   82554:	14000000 	b	82554 <_ZN4core3ops8function6FnOnce9call_once17h049e8c8a1d0ce9b8E.llvm.2931485523929443995+0x4>
	...

0000000000082560 <_ZN4core3fmt5write17he3850105fd3ed4faE>:
   82560:	d10203ff 	sub	sp, sp, #0x80
   82564:	f0000008 	adrp	x8, 85000 <__exception_handler_default>
   82568:	a9074ff4 	stp	x20, x19, [sp, #112]
   8256c:	aa0203f3 	mov	x19, x2
   82570:	52800069 	mov	w9, #0x3                   	// #3
   82574:	f90023fe 	str	x30, [sp, #64]
   82578:	fd448900 	ldr	d0, [x8, #2320]
   8257c:	f9400848 	ldr	x8, [x2, #16]
   82580:	a9055ff8 	stp	x24, x23, [sp, #80]
   82584:	a90657f6 	stp	x22, x21, [sp, #96]
   82588:	f90003ff 	str	xzr, [sp]
   8258c:	f9000bff 	str	xzr, [sp, #16]
   82590:	3900e3e9 	strb	w9, [sp, #56]
   82594:	fd001be0 	str	d0, [sp, #48]
   82598:	a90207e0 	stp	x0, x1, [sp, #32]
   8259c:	b4000948 	cbz	x8, 826c4 <_ZN4core3fmt5write17he3850105fd3ed4faE+0x164>
   825a0:	f9400e69 	ldr	x9, [x19, #24]
   825a4:	5280070a 	mov	w10, #0x38                  	// #56
   825a8:	9b0a7d2a 	mul	x10, x9, x10
   825ac:	b4000c0a 	cbz	x10, 8272c <_ZN4core3fmt5write17he3850105fd3ed4faE+0x1cc>
   825b0:	f940026a 	ldr	x10, [x19]
   825b4:	5280070c 	mov	w12, #0x38                  	// #56
   825b8:	d37df12b 	lsl	x11, x9, #3
   825bc:	90000018 	adrp	x24, 82000 <_ZN4core3str16slice_error_fail17h932895516ec20f79E+0x350>
   825c0:	d100216b 	sub	x11, x11, #0x8
   825c4:	9b0c7d35 	mul	x21, x9, x12
   825c8:	d343fd6b 	lsr	x11, x11, #3
   825cc:	91000574 	add	x20, x11, #0x1
   825d0:	91002156 	add	x22, x10, #0x8
   825d4:	91006117 	add	x23, x8, #0x18
   825d8:	91154318 	add	x24, x24, #0x550
   825dc:	f94002c2 	ldr	x2, [x22]
   825e0:	b40000c2 	cbz	x2, 825f8 <_ZN4core3fmt5write17he3850105fd3ed4faE+0x98>
   825e4:	a94223e0 	ldp	x0, x8, [sp, #32]
   825e8:	f85f82c1 	ldur	x1, [x22, #-8]
   825ec:	f9400d08 	ldr	x8, [x8, #24]
   825f0:	d63f0100 	blr	x8
   825f4:	37000c00 	tbnz	w0, #0, 82774 <_ZN4core3fmt5write17he3850105fd3ed4faE+0x214>
   825f8:	b94012e8 	ldr	w8, [x23, #16]
   825fc:	b90037e8 	str	w8, [sp, #52]
   82600:	394062e8 	ldrb	w8, [x23, #24]
   82604:	3900e3e8 	strb	w8, [sp, #56]
   82608:	b94016e9 	ldr	w9, [x23, #20]
   8260c:	f9401268 	ldr	x8, [x19, #32]
   82610:	b90033e9 	str	w9, [sp, #48]
   82614:	a94026ea 	ldp	x10, x9, [x23]
   82618:	b40001ea 	cbz	x10, 82654 <_ZN4core3fmt5write17he3850105fd3ed4faE+0xf4>
   8261c:	f100055f 	cmp	x10, #0x1
   82620:	540000a1 	b.ne	82634 <_ZN4core3fmt5write17he3850105fd3ed4faE+0xd4>  // b.any
   82624:	8b09110a 	add	x10, x8, x9, lsl #4
   82628:	f940054a 	ldr	x10, [x10, #8]
   8262c:	eb18015f 	cmp	x10, x24
   82630:	540000c0 	b.eq	82648 <_ZN4core3fmt5write17he3850105fd3ed4faE+0xe8>  // b.none
   82634:	aa1f03ea 	mov	x10, xzr
   82638:	a90027ea 	stp	x10, x9, [sp]
   8263c:	a97f26ea 	ldp	x10, x9, [x23, #-16]
   82640:	b500012a 	cbnz	x10, 82664 <_ZN4core3fmt5write17he3850105fd3ed4faE+0x104>
   82644:	14000013 	b	82690 <_ZN4core3fmt5write17he3850105fd3ed4faE+0x130>
   82648:	d37ced29 	lsl	x9, x9, #4
   8264c:	f8696909 	ldr	x9, [x8, x9]
   82650:	f9400129 	ldr	x9, [x9]
   82654:	5280002a 	mov	w10, #0x1                   	// #1
   82658:	a90027ea 	stp	x10, x9, [sp]
   8265c:	a97f26ea 	ldp	x10, x9, [x23, #-16]
   82660:	b400018a 	cbz	x10, 82690 <_ZN4core3fmt5write17he3850105fd3ed4faE+0x130>
   82664:	f100055f 	cmp	x10, #0x1
   82668:	540000a1 	b.ne	8267c <_ZN4core3fmt5write17he3850105fd3ed4faE+0x11c>  // b.any
   8266c:	8b09110a 	add	x10, x8, x9, lsl #4
   82670:	f940054a 	ldr	x10, [x10, #8]
   82674:	eb18015f 	cmp	x10, x24
   82678:	54000060 	b.eq	82684 <_ZN4core3fmt5write17he3850105fd3ed4faE+0x124>  // b.none
   8267c:	aa1f03ea 	mov	x10, xzr
   82680:	14000005 	b	82694 <_ZN4core3fmt5write17he3850105fd3ed4faE+0x134>
   82684:	d37ced29 	lsl	x9, x9, #4
   82688:	f8696909 	ldr	x9, [x8, x9]
   8268c:	f9400129 	ldr	x9, [x9]
   82690:	5280002a 	mov	w10, #0x1                   	// #1
   82694:	a90127ea 	stp	x10, x9, [sp, #16]
   82698:	910003e1 	mov	x1, sp
   8269c:	f85e82e9 	ldur	x9, [x23, #-24]
   826a0:	8b091108 	add	x8, x8, x9, lsl #4
   826a4:	a9402500 	ldp	x0, x9, [x8]
   826a8:	d63f0120 	blr	x9
   826ac:	37000640 	tbnz	w0, #0, 82774 <_ZN4core3fmt5write17he3850105fd3ed4faE+0x214>
   826b0:	910042d6 	add	x22, x22, #0x10
   826b4:	f100e2b5 	subs	x21, x21, #0x38
   826b8:	9100e2f7 	add	x23, x23, #0x38
   826bc:	54fff901 	b.ne	825dc <_ZN4core3fmt5write17he3850105fd3ed4faE+0x7c>  // b.any
   826c0:	1400001c 	b	82730 <_ZN4core3fmt5write17he3850105fd3ed4faE+0x1d0>
   826c4:	f9401668 	ldr	x8, [x19, #40]
   826c8:	b4000408 	cbz	x8, 82748 <_ZN4core3fmt5write17he3850105fd3ed4faE+0x1e8>
   826cc:	f9401269 	ldr	x9, [x19, #32]
   826d0:	d37ced15 	lsl	x21, x8, #4
   826d4:	f940026a 	ldr	x10, [x19]
   826d8:	d10042a8 	sub	x8, x21, #0x10
   826dc:	d344fd08 	lsr	x8, x8, #4
   826e0:	91000514 	add	x20, x8, #0x1
   826e4:	91002137 	add	x23, x9, #0x8
   826e8:	91002156 	add	x22, x10, #0x8
   826ec:	f94002c2 	ldr	x2, [x22]
   826f0:	b40000c2 	cbz	x2, 82708 <_ZN4core3fmt5write17he3850105fd3ed4faE+0x1a8>
   826f4:	a94223e0 	ldp	x0, x8, [sp, #32]
   826f8:	f85f82c1 	ldur	x1, [x22, #-8]
   826fc:	f9400d08 	ldr	x8, [x8, #24]
   82700:	d63f0100 	blr	x8
   82704:	37000380 	tbnz	w0, #0, 82774 <_ZN4core3fmt5write17he3850105fd3ed4faE+0x214>
   82708:	a97fa2e0 	ldp	x0, x8, [x23, #-8]
   8270c:	910003e1 	mov	x1, sp
   82710:	d63f0100 	blr	x8
   82714:	37000300 	tbnz	w0, #0, 82774 <_ZN4core3fmt5write17he3850105fd3ed4faE+0x214>
   82718:	910042d6 	add	x22, x22, #0x10
   8271c:	910042f7 	add	x23, x23, #0x10
   82720:	f10042b5 	subs	x21, x21, #0x10
   82724:	54fffe41 	b.ne	826ec <_ZN4core3fmt5write17he3850105fd3ed4faE+0x18c>  // b.any
   82728:	14000002 	b	82730 <_ZN4core3fmt5write17he3850105fd3ed4faE+0x1d0>
   8272c:	aa1f03f4 	mov	x20, xzr
   82730:	a9402668 	ldp	x8, x9, [x19]
   82734:	8b141108 	add	x8, x8, x20, lsl #4
   82738:	eb09029f 	cmp	x20, x9
   8273c:	9a9f3108 	csel	x8, x8, xzr, cc  // cc = lo, ul, last
   82740:	54000103 	b.cc	82760 <_ZN4core3fmt5write17he3850105fd3ed4faE+0x200>  // b.lo, b.ul, b.last
   82744:	14000013 	b	82790 <_ZN4core3fmt5write17he3850105fd3ed4faE+0x230>
   82748:	aa1f03f4 	mov	x20, xzr
   8274c:	a9402668 	ldp	x8, x9, [x19]
   82750:	8b141108 	add	x8, x8, x20, lsl #4
   82754:	eb09029f 	cmp	x20, x9
   82758:	9a9f3108 	csel	x8, x8, xzr, cc  // cc = lo, ul, last
   8275c:	540001a2 	b.cs	82790 <_ZN4core3fmt5write17he3850105fd3ed4faE+0x230>  // b.hs, b.nlast
   82760:	a94227e0 	ldp	x0, x9, [sp, #32]
   82764:	a9400901 	ldp	x1, x2, [x8]
   82768:	f9400d28 	ldr	x8, [x9, #24]
   8276c:	d63f0100 	blr	x8
   82770:	36000100 	tbz	w0, #0, 82790 <_ZN4core3fmt5write17he3850105fd3ed4faE+0x230>
   82774:	52800020 	mov	w0, #0x1                   	// #1
   82778:	a9474ff4 	ldp	x20, x19, [sp, #112]
   8277c:	a94657f6 	ldp	x22, x21, [sp, #96]
   82780:	a9455ff8 	ldp	x24, x23, [sp, #80]
   82784:	f94023fe 	ldr	x30, [sp, #64]
   82788:	910203ff 	add	sp, sp, #0x80
   8278c:	d65f03c0 	ret
   82790:	2a1f03e0 	mov	w0, wzr
   82794:	a9474ff4 	ldp	x20, x19, [sp, #112]
   82798:	a94657f6 	ldp	x22, x21, [sp, #96]
   8279c:	a9455ff8 	ldp	x24, x23, [sp, #80]
   827a0:	f94023fe 	ldr	x30, [sp, #64]
   827a4:	910203ff 	add	sp, sp, #0x80
   827a8:	d65f03c0 	ret
   827ac:	00000000 	.inst	0x00000000 ; undefined

00000000000827b0 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E>:
   827b0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
   827b4:	a9035ff8 	stp	x24, x23, [sp, #48]
   827b8:	aa0203f7 	mov	x23, x2
   827bc:	a90457f6 	stp	x22, x21, [sp, #64]
   827c0:	aa0403f5 	mov	x21, x4
   827c4:	a9054ff4 	stp	x20, x19, [sp, #80]
   827c8:	aa0503f4 	mov	x20, x5
   827cc:	aa0303f6 	mov	x22, x3
   827d0:	aa0003f3 	mov	x19, x0
   827d4:	a9016ffc 	stp	x28, x27, [sp, #16]
   827d8:	a90267fa 	stp	x26, x25, [sp, #32]
   827dc:	340001e1 	cbz	w1, 82818 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x68>
   827e0:	b9403268 	ldr	w8, [x19, #48]
   827e4:	5280056a 	mov	w10, #0x2b                  	// #43
   827e8:	52a0022b 	mov	w11, #0x110000              	// #1114112
   827ec:	92400109 	and	x9, x8, #0x1
   827f0:	7100013f 	cmp	w9, #0x0
   827f4:	8b140129 	add	x9, x9, x20
   827f8:	1a8a0178 	csel	w24, w11, w10, eq  // eq = none
   827fc:	36100168 	tbz	w8, #2, 82828 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x78>
   82800:	b4000216 	cbz	x22, 82840 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x90>
   82804:	f10012df 	cmp	x22, #0x4
   82808:	54000202 	b.cs	82848 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x98>  // b.hs, b.nlast
   8280c:	aa1f03ec 	mov	x12, xzr
   82810:	aa1703ea 	mov	x10, x23
   82814:	14000033 	b	828e0 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x130>
   82818:	b9403268 	ldr	w8, [x19, #48]
   8281c:	91000689 	add	x9, x20, #0x1
   82820:	528005b8 	mov	w24, #0x2d                  	// #45
   82824:	3717fee8 	tbnz	w8, #2, 82800 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x50>
   82828:	aa1f03f7 	mov	x23, xzr
   8282c:	aa1f03f6 	mov	x22, xzr
   82830:	f940026a 	ldr	x10, [x19]
   82834:	f100055f 	cmp	x10, #0x1
   82838:	540006a0 	b.eq	8290c <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x15c>  // b.none
   8283c:	14000041 	b	82940 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x190>
   82840:	aa1f03ec 	mov	x12, xzr
   82844:	1400002e 	b	828fc <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x14c>
   82848:	6f00e400 	movi	v0.2d, #0x0
   8284c:	5280002a 	mov	w10, #0x1                   	// #1
   82850:	0f060401 	movi	v1.2s, #0xc0
   82854:	927ef6cb 	and	x11, x22, #0xfffffffffffffffc
   82858:	0f040402 	movi	v2.2s, #0x80
   8285c:	91000aec 	add	x12, x23, #0x2
   82860:	4e080d43 	dup	v3.2d, x10
   82864:	8b0b02ea 	add	x10, x23, x11
   82868:	aa0b03ed 	mov	x13, x11
   8286c:	4ea01c04 	mov	v4.16b, v0.16b
   82870:	385fe18e 	ldurb	w14, [x12, #-2]
   82874:	f10011ad 	subs	x13, x13, #0x4
   82878:	3940018f 	ldrb	w15, [x12]
   8287c:	385ff190 	ldurb	w16, [x12, #-1]
   82880:	1e2701c5 	fmov	s5, w14
   82884:	3940058e 	ldrb	w14, [x12, #1]
   82888:	1e2701e6 	fmov	s6, w15
   8288c:	9100118c 	add	x12, x12, #0x4
   82890:	4e0c1e05 	mov	v5.s[1], w16
   82894:	4e0c1dc6 	mov	v6.s[1], w14
   82898:	0e211ca5 	and	v5.8b, v5.8b, v1.8b
   8289c:	0e211cc6 	and	v6.8b, v6.8b, v1.8b
   828a0:	2ea28ca5 	cmeq	v5.2s, v5.2s, v2.2s
   828a4:	2ea28cc6 	cmeq	v6.2s, v6.2s, v2.2s
   828a8:	2e2058a5 	mvn	v5.8b, v5.8b
   828ac:	2e2058c6 	mvn	v6.8b, v6.8b
   828b0:	2f20a4a5 	uxtl	v5.2d, v5.2s
   828b4:	2f20a4c6 	uxtl	v6.2d, v6.2s
   828b8:	4e231ca5 	and	v5.16b, v5.16b, v3.16b
   828bc:	4e231cc6 	and	v6.16b, v6.16b, v3.16b
   828c0:	4ee58400 	add	v0.2d, v0.2d, v5.2d
   828c4:	4ee68484 	add	v4.2d, v4.2d, v6.2d
   828c8:	54fffd41 	b.ne	82870 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0xc0>  // b.any
   828cc:	4ee08480 	add	v0.2d, v4.2d, v0.2d
   828d0:	eb16017f 	cmp	x11, x22
   828d4:	5ef1b800 	addp	d0, v0.2d
   828d8:	9e66000c 	fmov	x12, d0
   828dc:	54000100 	b.eq	828fc <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x14c>  // b.none
   828e0:	8b1602eb 	add	x11, x23, x22
   828e4:	3840154d 	ldrb	w13, [x10], #1
   828e8:	121a05ad 	and	w13, w13, #0xc0
   828ec:	710201bf 	cmp	w13, #0x80
   828f0:	9a8c058c 	cinc	x12, x12, ne  // ne = any
   828f4:	eb0b015f 	cmp	x10, x11
   828f8:	54ffff61 	b.ne	828e4 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x134>  // b.any
   828fc:	8b090189 	add	x9, x12, x9
   82900:	f940026a 	ldr	x10, [x19]
   82904:	f100055f 	cmp	x10, #0x1
   82908:	540001c1 	b.ne	82940 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x190>  // b.any
   8290c:	f940066a 	ldr	x10, [x19, #8]
   82910:	eb09015c 	subs	x28, x10, x9
   82914:	54000169 	b.ls	82940 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x190>  // b.plast
   82918:	37180488 	tbnz	w8, #3, 829a8 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x1f8>
   8291c:	3940e268 	ldrb	w8, [x19, #56]
   82920:	71000d1f 	cmp	w8, #0x3
   82924:	1a9f1508 	csinc	w8, w8, wzr, ne  // ne = any
   82928:	72000508 	ands	w8, w8, #0x3
   8292c:	54000680 	b.eq	829fc <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x24c>  // b.none
   82930:	7100051f 	cmp	w8, #0x1
   82934:	540006a1 	b.ne	82a08 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x258>  // b.any
   82938:	aa1f03fb 	mov	x27, xzr
   8293c:	14000037 	b	82a18 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x268>
   82940:	aa1303e0 	mov	x0, x19
   82944:	2a1803e1 	mov	w1, w24
   82948:	aa1703e2 	mov	x2, x23
   8294c:	aa1603e3 	mov	x3, x22
   82950:	94000088 	bl	82b70 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h828c4f1b581ccd5fE>
   82954:	36000140 	tbz	w0, #0, 8297c <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x1cc>
   82958:	52800039 	mov	w25, #0x1                   	// #1
   8295c:	2a1903e0 	mov	w0, w25
   82960:	a9454ff4 	ldp	x20, x19, [sp, #80]
   82964:	a94457f6 	ldp	x22, x21, [sp, #64]
   82968:	a9435ff8 	ldp	x24, x23, [sp, #48]
   8296c:	a94267fa 	ldp	x26, x25, [sp, #32]
   82970:	a9416ffc 	ldp	x28, x27, [sp, #16]
   82974:	a8c67bfd 	ldp	x29, x30, [sp], #96
   82978:	d65f03c0 	ret
   8297c:	a9422260 	ldp	x0, x8, [x19, #32]
   82980:	aa1503e1 	mov	x1, x21
   82984:	aa1403e2 	mov	x2, x20
   82988:	a9454ff4 	ldp	x20, x19, [sp, #80]
   8298c:	f9400d03 	ldr	x3, [x8, #24]
   82990:	a94457f6 	ldp	x22, x21, [sp, #64]
   82994:	a9435ff8 	ldp	x24, x23, [sp, #48]
   82998:	a94267fa 	ldp	x26, x25, [sp, #32]
   8299c:	a9416ffc 	ldp	x28, x27, [sp, #16]
   829a0:	a8c67bfd 	ldp	x29, x30, [sp], #96
   829a4:	d61f0060 	br	x3
   829a8:	b940367a 	ldr	w26, [x19, #52]
   829ac:	52800608 	mov	w8, #0x30                  	// #48
   829b0:	3940e27b 	ldrb	w27, [x19, #56]
   829b4:	52800039 	mov	w25, #0x1                   	// #1
   829b8:	aa1303e0 	mov	x0, x19
   829bc:	2a1803e1 	mov	w1, w24
   829c0:	aa1703e2 	mov	x2, x23
   829c4:	aa1603e3 	mov	x3, x22
   829c8:	b9003668 	str	w8, [x19, #52]
   829cc:	3900e279 	strb	w25, [x19, #56]
   829d0:	94000068 	bl	82b70 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h828c4f1b581ccd5fE>
   829d4:	3707fc40 	tbnz	w0, #0, 8295c <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x1ac>
   829d8:	3940e268 	ldrb	w8, [x19, #56]
   829dc:	71000d1f 	cmp	w8, #0x3
   829e0:	1a9f1508 	csinc	w8, w8, wzr, ne  // ne = any
   829e4:	72000508 	ands	w8, w8, #0x3
   829e8:	54000640 	b.eq	82ab0 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x300>  // b.none
   829ec:	7100051f 	cmp	w8, #0x1
   829f0:	54000661 	b.ne	82abc <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x30c>  // b.any
   829f4:	aa1f03f8 	mov	x24, xzr
   829f8:	14000035 	b	82acc <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x31c>
   829fc:	aa1c03fb 	mov	x27, x28
   82a00:	aa1f03fc 	mov	x28, xzr
   82a04:	14000005 	b	82a18 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x268>
   82a08:	d341ff88 	lsr	x8, x28, #1
   82a0c:	91000789 	add	x9, x28, #0x1
   82a10:	aa0803fc 	mov	x28, x8
   82a14:	d341fd3b 	lsr	x27, x9, #1
   82a18:	a942767a 	ldp	x26, x29, [x19, #32]
   82a1c:	9100079c 	add	x28, x28, #0x1
   82a20:	b9403679 	ldr	w25, [x19, #52]
   82a24:	f100079c 	subs	x28, x28, #0x1
   82a28:	540000e0 	b.eq	82a44 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x294>  // b.none
   82a2c:	f94013a8 	ldr	x8, [x29, #32]
   82a30:	aa1a03e0 	mov	x0, x26
   82a34:	2a1903e1 	mov	w1, w25
   82a38:	d63f0100 	blr	x8
   82a3c:	3607ff40 	tbz	w0, #0, 82a24 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x274>
   82a40:	17ffffc6 	b	82958 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x1a8>
   82a44:	7144433f 	cmp	w25, #0x110, lsl #12
   82a48:	9a9b03fa 	csel	x26, xzr, x27, eq  // eq = none
   82a4c:	54fff860 	b.eq	82958 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x1a8>  // b.none
   82a50:	aa1303e0 	mov	x0, x19
   82a54:	2a1803e1 	mov	w1, w24
   82a58:	aa1703e2 	mov	x2, x23
   82a5c:	aa1603e3 	mov	x3, x22
   82a60:	94000044 	bl	82b70 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h828c4f1b581ccd5fE>
   82a64:	3707f7a0 	tbnz	w0, #0, 82958 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x1a8>
   82a68:	a9422260 	ldp	x0, x8, [x19, #32]
   82a6c:	aa1503e1 	mov	x1, x21
   82a70:	aa1403e2 	mov	x2, x20
   82a74:	f9400d08 	ldr	x8, [x8, #24]
   82a78:	d63f0100 	blr	x8
   82a7c:	3707f6e0 	tbnz	w0, #0, 82958 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x1a8>
   82a80:	a9424e74 	ldp	x20, x19, [x19, #32]
   82a84:	aa1f03f5 	mov	x21, xzr
   82a88:	eb15035f 	cmp	x26, x21
   82a8c:	540006a0 	b.eq	82b60 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x3b0>  // b.none
   82a90:	f9401268 	ldr	x8, [x19, #32]
   82a94:	aa1403e0 	mov	x0, x20
   82a98:	2a1903e1 	mov	w1, w25
   82a9c:	910006b5 	add	x21, x21, #0x1
   82aa0:	d63f0100 	blr	x8
   82aa4:	34ffff20 	cbz	w0, 82a88 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x2d8>
   82aa8:	d10006a8 	sub	x8, x21, #0x1
   82aac:	1400002e 	b	82b64 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x3b4>
   82ab0:	aa1c03f8 	mov	x24, x28
   82ab4:	aa1f03fc 	mov	x28, xzr
   82ab8:	14000005 	b	82acc <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x31c>
   82abc:	d341ff88 	lsr	x8, x28, #1
   82ac0:	91000789 	add	x9, x28, #0x1
   82ac4:	aa0803fc 	mov	x28, x8
   82ac8:	d341fd38 	lsr	x24, x9, #1
   82acc:	a9426677 	ldp	x23, x25, [x19, #32]
   82ad0:	9100079c 	add	x28, x28, #0x1
   82ad4:	b9403676 	ldr	w22, [x19, #52]
   82ad8:	f100079c 	subs	x28, x28, #0x1
   82adc:	540000e0 	b.eq	82af8 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x348>  // b.none
   82ae0:	f9401328 	ldr	x8, [x25, #32]
   82ae4:	aa1703e0 	mov	x0, x23
   82ae8:	2a1603e1 	mov	w1, w22
   82aec:	d63f0100 	blr	x8
   82af0:	3607ff40 	tbz	w0, #0, 82ad8 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x328>
   82af4:	17ffff99 	b	82958 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x1a8>
   82af8:	714442df 	cmp	w22, #0x110, lsl #12
   82afc:	9a9803f7 	csel	x23, xzr, x24, eq  // eq = none
   82b00:	54fff2c0 	b.eq	82958 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x1a8>  // b.none
   82b04:	a9422260 	ldp	x0, x8, [x19, #32]
   82b08:	aa1503e1 	mov	x1, x21
   82b0c:	aa1403e2 	mov	x2, x20
   82b10:	f9400d08 	ldr	x8, [x8, #24]
   82b14:	d63f0100 	blr	x8
   82b18:	3707f200 	tbnz	w0, #0, 82958 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x1a8>
   82b1c:	a9425674 	ldp	x20, x21, [x19, #32]
   82b20:	aa1f03f8 	mov	x24, xzr
   82b24:	eb1802ff 	cmp	x23, x24
   82b28:	54000140 	b.eq	82b50 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x3a0>  // b.none
   82b2c:	f94012a8 	ldr	x8, [x21, #32]
   82b30:	aa1403e0 	mov	x0, x20
   82b34:	2a1603e1 	mov	w1, w22
   82b38:	91000718 	add	x24, x24, #0x1
   82b3c:	d63f0100 	blr	x8
   82b40:	34ffff20 	cbz	w0, 82b24 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x374>
   82b44:	d1000708 	sub	x8, x24, #0x1
   82b48:	eb17011f 	cmp	x8, x23
   82b4c:	54fff063 	b.cc	82958 <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x1a8>  // b.lo, b.ul, b.last
   82b50:	2a1f03f9 	mov	w25, wzr
   82b54:	b900367a 	str	w26, [x19, #52]
   82b58:	3900e27b 	strb	w27, [x19, #56]
   82b5c:	17ffff80 	b	8295c <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x1ac>
   82b60:	aa1a03e8 	mov	x8, x26
   82b64:	eb1a011f 	cmp	x8, x26
   82b68:	1a9f27f9 	cset	w25, cc  // cc = lo, ul, last
   82b6c:	17ffff7c 	b	8295c <_ZN4core3fmt9Formatter12pad_integral17h4c381d3da2db2768E+0x1ac>

0000000000082b70 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h828c4f1b581ccd5fE>:
   82b70:	a9be57fe 	stp	x30, x21, [sp, #-32]!
   82b74:	a9014ff4 	stp	x20, x19, [sp, #16]
   82b78:	aa0303f3 	mov	x19, x3
   82b7c:	aa0203f4 	mov	x20, x2
   82b80:	aa0003f5 	mov	x21, x0
   82b84:	7144403f 	cmp	w1, #0x110, lsl #12
   82b88:	54000120 	b.eq	82bac <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h828c4f1b581ccd5fE+0x3c>  // b.none
   82b8c:	a94222a0 	ldp	x0, x8, [x21, #32]
   82b90:	f9401108 	ldr	x8, [x8, #32]
   82b94:	d63f0100 	blr	x8
   82b98:	360000a0 	tbz	w0, #0, 82bac <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h828c4f1b581ccd5fE+0x3c>
   82b9c:	52800020 	mov	w0, #0x1                   	// #1
   82ba0:	a9414ff4 	ldp	x20, x19, [sp, #16]
   82ba4:	a8c257fe 	ldp	x30, x21, [sp], #32
   82ba8:	d65f03c0 	ret
   82bac:	b4000114 	cbz	x20, 82bcc <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h828c4f1b581ccd5fE+0x5c>
   82bb0:	a94222a0 	ldp	x0, x8, [x21, #32]
   82bb4:	aa1403e1 	mov	x1, x20
   82bb8:	aa1303e2 	mov	x2, x19
   82bbc:	a9414ff4 	ldp	x20, x19, [sp, #16]
   82bc0:	f9400d03 	ldr	x3, [x8, #24]
   82bc4:	a8c257fe 	ldp	x30, x21, [sp], #32
   82bc8:	d61f0060 	br	x3
   82bcc:	2a1f03e0 	mov	w0, wzr
   82bd0:	a9414ff4 	ldp	x20, x19, [sp, #16]
   82bd4:	a8c257fe 	ldp	x30, x21, [sp], #32
   82bd8:	d65f03c0 	ret
   82bdc:	00000000 	.inst	0x00000000 ; undefined

0000000000082be0 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E>:
   82be0:	a9bc67fe 	stp	x30, x25, [sp, #-64]!
   82be4:	f9400008 	ldr	x8, [x0]
   82be8:	f9400809 	ldr	x9, [x0, #16]
   82bec:	a9034ff4 	stp	x20, x19, [sp, #48]
   82bf0:	aa0203f3 	mov	x19, x2
   82bf4:	aa0103f4 	mov	x20, x1
   82bf8:	a9015ff8 	stp	x24, x23, [sp, #16]
   82bfc:	f100051f 	cmp	x8, #0x1
   82c00:	a90257f6 	stp	x22, x21, [sp, #32]
   82c04:	54000081 	b.ne	82c14 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x34>  // b.any
   82c08:	f100053f 	cmp	x9, #0x1
   82c0c:	54000080 	b.eq	82c1c <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x3c>  // b.none
   82c10:	1400007e 	b	82e08 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x228>
   82c14:	f100053f 	cmp	x9, #0x1
   82c18:	540017a1 	b.ne	82f0c <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x32c>  // b.any
   82c1c:	f9400c0b 	ldr	x11, [x0, #24]
   82c20:	8b13028a 	add	x10, x20, x19
   82c24:	aa1f03e9 	mov	x9, xzr
   82c28:	b400078b 	cbz	x11, 82d18 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x138>
   82c2c:	aa1403ed 	mov	x13, x20
   82c30:	1400000a 	b	82c58 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x78>
   82c34:	38401591 	ldrb	w17, [x12], #1
   82c38:	12001631 	and	w17, w17, #0x3f
   82c3c:	530e09ef 	ubfiz	w15, w15, #18, #3
   82c40:	331415cf 	bfi	w15, w14, #12, #6
   82c44:	331a160f 	bfi	w15, w16, #6, #6
   82c48:	2a1101ee 	orr	w14, w15, w17
   82c4c:	714441df 	cmp	w14, #0x110, lsl #12
   82c50:	54000541 	b.ne	82cf8 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x118>  // b.any
   82c54:	1400006b 	b	82e00 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x220>
   82c58:	eb0a01bf 	cmp	x13, x10
   82c5c:	54000d20 	b.eq	82e00 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x220>  // b.none
   82c60:	aa0d03ec 	mov	x12, x13
   82c64:	38c0158f 	ldrsb	w15, [x12], #1
   82c68:	36f8048f 	tbz	w15, #31, 82cf8 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x118>
   82c6c:	eb0a019f 	cmp	x12, x10
   82c70:	54000100 	b.eq	82c90 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0xb0>  // b.none
   82c74:	394005ae 	ldrb	w14, [x13, #1]
   82c78:	910009ac 	add	x12, x13, #0x2
   82c7c:	120015ce 	and	w14, w14, #0x3f
   82c80:	12001def 	and	w15, w15, #0xff
   82c84:	710381ff 	cmp	w15, #0xe0
   82c88:	540000e2 	b.cs	82ca4 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0xc4>  // b.hs, b.nlast
   82c8c:	1400001b 	b	82cf8 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x118>
   82c90:	2a1f03ee 	mov	w14, wzr
   82c94:	aa0a03ec 	mov	x12, x10
   82c98:	12001def 	and	w15, w15, #0xff
   82c9c:	710381ff 	cmp	w15, #0xe0
   82ca0:	540002c3 	b.cc	82cf8 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x118>  // b.lo, b.ul, b.last
   82ca4:	eb0a019f 	cmp	x12, x10
   82ca8:	540000c0 	b.eq	82cc0 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0xe0>  // b.none
   82cac:	38401590 	ldrb	w16, [x12], #1
   82cb0:	12001610 	and	w16, w16, #0x3f
   82cb4:	7103c1ff 	cmp	w15, #0xf0
   82cb8:	540000c2 	b.cs	82cd0 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0xf0>  // b.hs, b.nlast
   82cbc:	1400000f 	b	82cf8 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x118>
   82cc0:	2a1f03f0 	mov	w16, wzr
   82cc4:	aa0a03ec 	mov	x12, x10
   82cc8:	7103c1ff 	cmp	w15, #0xf0
   82ccc:	54000163 	b.cc	82cf8 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x118>  // b.lo, b.ul, b.last
   82cd0:	eb0a019f 	cmp	x12, x10
   82cd4:	54fffb01 	b.ne	82c34 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x54>  // b.any
   82cd8:	2a1f03f1 	mov	w17, wzr
   82cdc:	aa0a03ec 	mov	x12, x10
   82ce0:	530e09ef 	ubfiz	w15, w15, #18, #3
   82ce4:	331415cf 	bfi	w15, w14, #12, #6
   82ce8:	331a160f 	bfi	w15, w16, #6, #6
   82cec:	2a1101ee 	orr	w14, w15, w17
   82cf0:	714441df 	cmp	w14, #0x110, lsl #12
   82cf4:	54000860 	b.eq	82e00 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x220>  // b.none
   82cf8:	cb0d0129 	sub	x9, x9, x13
   82cfc:	f100056b 	subs	x11, x11, #0x1
   82d00:	8b0c0129 	add	x9, x9, x12
   82d04:	aa0c03ed 	mov	x13, x12
   82d08:	54fffa81 	b.ne	82c58 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x78>  // b.any
   82d0c:	eb0a019f 	cmp	x12, x10
   82d10:	540000a1 	b.ne	82d24 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x144>  // b.any
   82d14:	1400003b 	b	82e00 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x220>
   82d18:	aa1403ec 	mov	x12, x20
   82d1c:	eb0a019f 	cmp	x12, x10
   82d20:	54000700 	b.eq	82e00 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x220>  // b.none
   82d24:	aa0c03ed 	mov	x13, x12
   82d28:	38c015ab 	ldrsb	w11, [x13], #1
   82d2c:	36f804cb 	tbz	w11, #31, 82dc4 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x1e4>
   82d30:	12001d6b 	and	w11, w11, #0xff
   82d34:	eb0a01bf 	cmp	x13, x10
   82d38:	54000100 	b.eq	82d58 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x178>  // b.none
   82d3c:	3940058e 	ldrb	w14, [x12, #1]
   82d40:	9100098d 	add	x13, x12, #0x2
   82d44:	120015cc 	and	w12, w14, #0x3f
   82d48:	531a658c 	lsl	w12, w12, #6
   82d4c:	7103817f 	cmp	w11, #0xe0
   82d50:	540000c2 	b.cs	82d68 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x188>  // b.hs, b.nlast
   82d54:	1400001c 	b	82dc4 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x1e4>
   82d58:	2a1f03ec 	mov	w12, wzr
   82d5c:	aa0a03ed 	mov	x13, x10
   82d60:	7103817f 	cmp	w11, #0xe0
   82d64:	54000303 	b.cc	82dc4 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x1e4>  // b.lo, b.ul, b.last
   82d68:	eb0a01bf 	cmp	x13, x10
   82d6c:	540000c0 	b.eq	82d84 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x1a4>  // b.none
   82d70:	384015ae 	ldrb	w14, [x13], #1
   82d74:	120015ce 	and	w14, w14, #0x3f
   82d78:	7103c17f 	cmp	w11, #0xf0
   82d7c:	540000c2 	b.cs	82d94 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x1b4>  // b.hs, b.nlast
   82d80:	14000011 	b	82dc4 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x1e4>
   82d84:	2a1f03ee 	mov	w14, wzr
   82d88:	aa0a03ed 	mov	x13, x10
   82d8c:	7103c17f 	cmp	w11, #0xf0
   82d90:	540001a3 	b.cc	82dc4 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x1e4>  // b.lo, b.ul, b.last
   82d94:	2a0c01cc 	orr	w12, w14, w12
   82d98:	eb0a01bf 	cmp	x13, x10
   82d9c:	54000080 	b.eq	82dac <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x1cc>  // b.none
   82da0:	394001aa 	ldrb	w10, [x13]
   82da4:	1200154a 	and	w10, w10, #0x3f
   82da8:	14000002 	b	82db0 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x1d0>
   82dac:	2a1f03ea 	mov	w10, wzr
   82db0:	530e096b 	ubfiz	w11, w11, #18, #3
   82db4:	331a2d8b 	bfi	w11, w12, #6, #12
   82db8:	2a0a016a 	orr	w10, w11, w10
   82dbc:	7144415f 	cmp	w10, #0x110, lsl #12
   82dc0:	54000200 	b.eq	82e00 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x220>  // b.none
   82dc4:	b4000169 	cbz	x9, 82df0 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x210>
   82dc8:	eb13013f 	cmp	x9, x19
   82dcc:	540000e2 	b.cs	82de8 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x208>  // b.hs, b.nlast
   82dd0:	38e96a8a 	ldrsb	w10, [x20, x9]
   82dd4:	3101015f 	cmn	w10, #0x40
   82dd8:	540000ca 	b.ge	82df0 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x210>  // b.tcont
   82ddc:	aa1f03ea 	mov	x10, xzr
   82de0:	aa1f03e9 	mov	x9, xzr
   82de4:	14000004 	b	82df4 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x214>
   82de8:	eb13013f 	cmp	x9, x19
   82dec:	54ffff81 	b.ne	82ddc <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x1fc>  // b.any
   82df0:	aa1403ea 	mov	x10, x20
   82df4:	f100015f 	cmp	x10, #0x0
   82df8:	9a8a0294 	csel	x20, x20, x10, eq  // eq = none
   82dfc:	9a890273 	csel	x19, x19, x9, eq  // eq = none
   82e00:	f100051f 	cmp	x8, #0x1
   82e04:	54000841 	b.ne	82f0c <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x32c>  // b.any
   82e08:	f9400408 	ldr	x8, [x0, #8]
   82e0c:	b40000d3 	cbz	x19, 82e24 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x244>
   82e10:	f100127f 	cmp	x19, #0x4
   82e14:	540000c2 	b.cs	82e2c <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x24c>  // b.hs, b.nlast
   82e18:	aa1f03eb 	mov	x11, xzr
   82e1c:	aa1403e9 	mov	x9, x20
   82e20:	14000029 	b	82ec4 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x2e4>
   82e24:	aa1f03eb 	mov	x11, xzr
   82e28:	1400002e 	b	82ee0 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x300>
   82e2c:	6f00e400 	movi	v0.2d, #0x0
   82e30:	52800029 	mov	w9, #0x1                   	// #1
   82e34:	0f060401 	movi	v1.2s, #0xc0
   82e38:	927ef66a 	and	x10, x19, #0xfffffffffffffffc
   82e3c:	0f040402 	movi	v2.2s, #0x80
   82e40:	91000a8b 	add	x11, x20, #0x2
   82e44:	4e080d23 	dup	v3.2d, x9
   82e48:	8b0a0289 	add	x9, x20, x10
   82e4c:	aa0a03ec 	mov	x12, x10
   82e50:	4ea01c04 	mov	v4.16b, v0.16b
   82e54:	385fe16d 	ldurb	w13, [x11, #-2]
   82e58:	f100118c 	subs	x12, x12, #0x4
   82e5c:	3940016e 	ldrb	w14, [x11]
   82e60:	385ff16f 	ldurb	w15, [x11, #-1]
   82e64:	1e2701a5 	fmov	s5, w13
   82e68:	3940056d 	ldrb	w13, [x11, #1]
   82e6c:	1e2701c6 	fmov	s6, w14
   82e70:	9100116b 	add	x11, x11, #0x4
   82e74:	4e0c1de5 	mov	v5.s[1], w15
   82e78:	4e0c1da6 	mov	v6.s[1], w13
   82e7c:	0e211ca5 	and	v5.8b, v5.8b, v1.8b
   82e80:	0e211cc6 	and	v6.8b, v6.8b, v1.8b
   82e84:	2ea28ca5 	cmeq	v5.2s, v5.2s, v2.2s
   82e88:	2ea28cc6 	cmeq	v6.2s, v6.2s, v2.2s
   82e8c:	2e2058a5 	mvn	v5.8b, v5.8b
   82e90:	2e2058c6 	mvn	v6.8b, v6.8b
   82e94:	2f20a4a5 	uxtl	v5.2d, v5.2s
   82e98:	2f20a4c6 	uxtl	v6.2d, v6.2s
   82e9c:	4e231ca5 	and	v5.16b, v5.16b, v3.16b
   82ea0:	4e231cc6 	and	v6.16b, v6.16b, v3.16b
   82ea4:	4ee58400 	add	v0.2d, v0.2d, v5.2d
   82ea8:	4ee68484 	add	v4.2d, v4.2d, v6.2d
   82eac:	54fffd41 	b.ne	82e54 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x274>  // b.any
   82eb0:	4ee08480 	add	v0.2d, v4.2d, v0.2d
   82eb4:	eb0a027f 	cmp	x19, x10
   82eb8:	5ef1b800 	addp	d0, v0.2d
   82ebc:	9e66000b 	fmov	x11, d0
   82ec0:	54000100 	b.eq	82ee0 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x300>  // b.none
   82ec4:	8b13028a 	add	x10, x20, x19
   82ec8:	3840152c 	ldrb	w12, [x9], #1
   82ecc:	121a058c 	and	w12, w12, #0xc0
   82ed0:	7102019f 	cmp	w12, #0x80
   82ed4:	9a8b056b 	cinc	x11, x11, ne  // ne = any
   82ed8:	eb0a013f 	cmp	x9, x10
   82edc:	54ffff61 	b.ne	82ec8 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x2e8>  // b.any
   82ee0:	eb0b0108 	subs	x8, x8, x11
   82ee4:	54000149 	b.ls	82f0c <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x32c>  // b.plast
   82ee8:	3940e009 	ldrb	w9, [x0, #56]
   82eec:	71000d3f 	cmp	w9, #0x3
   82ef0:	1a8903e9 	csel	w9, wzr, w9, eq  // eq = none
   82ef4:	72000529 	ands	w9, w9, #0x3
   82ef8:	540001e0 	b.eq	82f34 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x354>  // b.none
   82efc:	7100053f 	cmp	w9, #0x1
   82f00:	54000201 	b.ne	82f40 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x360>  // b.any
   82f04:	aa1f03f8 	mov	x24, xzr
   82f08:	14000012 	b	82f50 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x370>
   82f0c:	a9422408 	ldp	x8, x9, [x0, #32]
   82f10:	aa1403e1 	mov	x1, x20
   82f14:	aa1303e2 	mov	x2, x19
   82f18:	a9434ff4 	ldp	x20, x19, [sp, #48]
   82f1c:	f9400d23 	ldr	x3, [x9, #24]
   82f20:	aa0803e0 	mov	x0, x8
   82f24:	a94257f6 	ldp	x22, x21, [sp, #32]
   82f28:	a9415ff8 	ldp	x24, x23, [sp, #16]
   82f2c:	a8c467fe 	ldp	x30, x25, [sp], #64
   82f30:	d61f0060 	br	x3
   82f34:	aa0803f8 	mov	x24, x8
   82f38:	aa1f03e8 	mov	x8, xzr
   82f3c:	14000005 	b	82f50 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x370>
   82f40:	d341fd09 	lsr	x9, x8, #1
   82f44:	9100050a 	add	x10, x8, #0x1
   82f48:	aa0903e8 	mov	x8, x9
   82f4c:	d341fd58 	lsr	x24, x10, #1
   82f50:	a9425c15 	ldp	x21, x23, [x0, #32]
   82f54:	91000519 	add	x25, x8, #0x1
   82f58:	b9403416 	ldr	w22, [x0, #52]
   82f5c:	f1000739 	subs	x25, x25, #0x1
   82f60:	54000180 	b.eq	82f90 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x3b0>  // b.none
   82f64:	f94012e8 	ldr	x8, [x23, #32]
   82f68:	aa1503e0 	mov	x0, x21
   82f6c:	2a1603e1 	mov	w1, w22
   82f70:	d63f0100 	blr	x8
   82f74:	3607ff40 	tbz	w0, #0, 82f5c <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x37c>
   82f78:	52800020 	mov	w0, #0x1                   	// #1
   82f7c:	a9434ff4 	ldp	x20, x19, [sp, #48]
   82f80:	a94257f6 	ldp	x22, x21, [sp, #32]
   82f84:	a9415ff8 	ldp	x24, x23, [sp, #16]
   82f88:	a8c467fe 	ldp	x30, x25, [sp], #64
   82f8c:	d65f03c0 	ret
   82f90:	714442df 	cmp	w22, #0x110, lsl #12
   82f94:	9a9803f8 	csel	x24, xzr, x24, eq  // eq = none
   82f98:	540000e1 	b.ne	82fb4 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x3d4>  // b.any
   82f9c:	52800020 	mov	w0, #0x1                   	// #1
   82fa0:	a9434ff4 	ldp	x20, x19, [sp, #48]
   82fa4:	a94257f6 	ldp	x22, x21, [sp, #32]
   82fa8:	a9415ff8 	ldp	x24, x23, [sp, #16]
   82fac:	a8c467fe 	ldp	x30, x25, [sp], #64
   82fb0:	d65f03c0 	ret
   82fb4:	f9400ee8 	ldr	x8, [x23, #24]
   82fb8:	aa1503e0 	mov	x0, x21
   82fbc:	aa1403e1 	mov	x1, x20
   82fc0:	aa1303e2 	mov	x2, x19
   82fc4:	d63f0100 	blr	x8
   82fc8:	360000e0 	tbz	w0, #0, 82fe4 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x404>
   82fcc:	52800020 	mov	w0, #0x1                   	// #1
   82fd0:	a9434ff4 	ldp	x20, x19, [sp, #48]
   82fd4:	a94257f6 	ldp	x22, x21, [sp, #32]
   82fd8:	a9415ff8 	ldp	x24, x23, [sp, #16]
   82fdc:	a8c467fe 	ldp	x30, x25, [sp], #64
   82fe0:	d65f03c0 	ret
   82fe4:	aa1f03f3 	mov	x19, xzr
   82fe8:	eb13031f 	cmp	x24, x19
   82fec:	54000120 	b.eq	83010 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x430>  // b.none
   82ff0:	f94012e8 	ldr	x8, [x23, #32]
   82ff4:	aa1503e0 	mov	x0, x21
   82ff8:	2a1603e1 	mov	w1, w22
   82ffc:	91000673 	add	x19, x19, #0x1
   83000:	d63f0100 	blr	x8
   83004:	34ffff20 	cbz	w0, 82fe8 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x408>
   83008:	d1000668 	sub	x8, x19, #0x1
   8300c:	14000002 	b	83014 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E+0x434>
   83010:	aa1803e8 	mov	x8, x24
   83014:	eb18011f 	cmp	x8, x24
   83018:	1a9f27e0 	cset	w0, cc  // cc = lo, ul, last
   8301c:	a9434ff4 	ldp	x20, x19, [sp, #48]
   83020:	a94257f6 	ldp	x22, x21, [sp, #32]
   83024:	a9415ff8 	ldp	x24, x23, [sp, #16]
   83028:	a8c467fe 	ldp	x30, x25, [sp], #64
   8302c:	d65f03c0 	ret

0000000000083030 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E>:
   83030:	d10283ff 	sub	sp, sp, #0xa0
   83034:	a9094ff4 	stp	x20, x19, [sp, #144]
   83038:	a9422054 	ldp	x20, x8, [x2, #32]
   8303c:	a9047bfd 	stp	x29, x30, [sp, #64]
   83040:	a9056ffc 	stp	x28, x27, [sp, #80]
   83044:	f9401102 	ldr	x2, [x8, #32]
   83048:	a90207e8 	stp	x8, x1, [sp, #32]
   8304c:	52800441 	mov	w1, #0x22                  	// #34
   83050:	a90667fa 	stp	x26, x25, [sp, #96]
   83054:	a9075ff8 	stp	x24, x23, [sp, #112]
   83058:	a9030be0 	stp	x0, x2, [sp, #48]
   8305c:	aa1403e0 	mov	x0, x20
   83060:	a90857f6 	stp	x22, x21, [sp, #128]
   83064:	d63f0040 	blr	x2
   83068:	36000140 	tbz	w0, #0, 83090 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x60>
   8306c:	a9494ff4 	ldp	x20, x19, [sp, #144]
   83070:	52800020 	mov	w0, #0x1                   	// #1
   83074:	a94857f6 	ldp	x22, x21, [sp, #128]
   83078:	a9475ff8 	ldp	x24, x23, [sp, #112]
   8307c:	a94667fa 	ldp	x26, x25, [sp, #96]
   83080:	a9456ffc 	ldp	x28, x27, [sp, #80]
   83084:	a9447bfd 	ldp	x29, x30, [sp, #64]
   83088:	910283ff 	add	sp, sp, #0xa0
   8308c:	d65f03c0 	ret
   83090:	f94017eb 	ldr	x11, [sp, #40]
   83094:	b40026cb 	cbz	x11, 8356c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x53c>
   83098:	f9401be8 	ldr	x8, [sp, #48]
   8309c:	f000001c 	adrp	x28, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   830a0:	f000000c 	adrp	x12, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   830a4:	aa1f03f8 	mov	x24, xzr
   830a8:	aa1f03f5 	mov	x21, xzr
   830ac:	52800e96 	mov	w22, #0x74                  	// #116
   830b0:	91282b9c 	add	x28, x28, #0xa0a
   830b4:	52800b9d 	mov	w29, #0x5c                  	// #92
   830b8:	8b0b011a 	add	x26, x8, x11
   830bc:	aa0803e9 	mov	x9, x8
   830c0:	aa0803ea 	mov	x10, x8
   830c4:	9127c18c 	add	x12, x12, #0x9f0
   830c8:	f90007fa 	str	x26, [sp, #8]
   830cc:	aa0a03e8 	mov	x8, x10
   830d0:	f9000be9 	str	x9, [sp, #16]
   830d4:	38c01509 	ldrsb	w9, [x8], #1
   830d8:	12001d20 	and	w0, w9, #0xff
   830dc:	37f80069 	tbnz	w9, #31, 830e8 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0xb8>
   830e0:	aa0803ed 	mov	x13, x8
   830e4:	1400002c 	b	83194 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x164>
   830e8:	eb1a011f 	cmp	x8, x26
   830ec:	54000260 	b.eq	83138 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x108>  // b.none
   830f0:	39400548 	ldrb	w8, [x10, #1]
   830f4:	9100094d 	add	x13, x10, #0x2
   830f8:	1200150a 	and	w10, w8, #0x3f
   830fc:	12001008 	and	w8, w0, #0x1f
   83100:	71037c1f 	cmp	w0, #0xdf
   83104:	54000249 	b.ls	8314c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x11c>  // b.plast
   83108:	eb1a01bf 	cmp	x13, x26
   8310c:	54000260 	b.eq	83158 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x128>  // b.none
   83110:	384015a9 	ldrb	w9, [x13], #1
   83114:	12001529 	and	w9, w9, #0x3f
   83118:	331a1549 	bfi	w9, w10, #6, #6
   8311c:	7103c01f 	cmp	w0, #0xf0
   83120:	54000263 	b.cc	8316c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x13c>  // b.lo, b.ul, b.last
   83124:	eb1a01bf 	cmp	x13, x26
   83128:	54000280 	b.eq	83178 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x148>  // b.none
   8312c:	384015aa 	ldrb	w10, [x13], #1
   83130:	1200154a 	and	w10, w10, #0x3f
   83134:	14000013 	b	83180 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x150>
   83138:	2a1f03ea 	mov	w10, wzr
   8313c:	aa1a03ed 	mov	x13, x26
   83140:	12001008 	and	w8, w0, #0x1f
   83144:	71037c1f 	cmp	w0, #0xdf
   83148:	54fffe08 	b.hi	83108 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0xd8>  // b.pmore
   8314c:	331a110a 	bfi	w10, w8, #6, #5
   83150:	2a0a03e0 	mov	w0, w10
   83154:	14000010 	b	83194 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x164>
   83158:	2a1f03e9 	mov	w9, wzr
   8315c:	aa1a03ed 	mov	x13, x26
   83160:	331a1549 	bfi	w9, w10, #6, #6
   83164:	7103c01f 	cmp	w0, #0xf0
   83168:	54fffde2 	b.cs	83124 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0xf4>  // b.hs, b.nlast
   8316c:	33141109 	bfi	w9, w8, #12, #5
   83170:	2a0903e0 	mov	w0, w9
   83174:	14000008 	b	83194 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x164>
   83178:	2a1f03ea 	mov	w10, wzr
   8317c:	aa1a03ed 	mov	x13, x26
   83180:	530e0908 	ubfiz	w8, w8, #18, #3
   83184:	331a2d28 	bfi	w8, w9, #6, #12
   83188:	2a0a0100 	orr	w0, w8, w10
   8318c:	7144401f 	cmp	w0, #0x110, lsl #12
   83190:	54001dc0 	b.eq	83548 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x518>  // b.none
   83194:	51002408 	sub	w8, w0, #0x9
   83198:	b9001fe0 	str	w0, [sp, #28]
   8319c:	7100651f 	cmp	w8, #0x19
   831a0:	54000148 	b.hi	831c8 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x198>  // b.pmore
   831a4:	100000c9 	adr	x9, 831bc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x18c>
   831a8:	3868698a 	ldrb	w10, [x12, x8]
   831ac:	8b0a0929 	add	x9, x9, x10, lsl #2
   831b0:	52800053 	mov	w19, #0x2                   	// #2
   831b4:	2a1603f7 	mov	w23, w22
   831b8:	d61f0120 	br	x9
   831bc:	52800053 	mov	w19, #0x2                   	// #2
   831c0:	52800dd7 	mov	w23, #0x6e                  	// #110
   831c4:	14000069 	b	83368 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x338>
   831c8:	7101701f 	cmp	w0, #0x5c
   831cc:	54000081 	b.ne	831dc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x1ac>  // b.any
   831d0:	52800053 	mov	w19, #0x2                   	// #2
   831d4:	2a0003f7 	mov	w23, w0
   831d8:	14000064 	b	83368 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x338>
   831dc:	f90003ed 	str	x13, [sp]
   831e0:	97fff7e8 	bl	81180 <_ZN4core7unicode12unicode_data15grapheme_extend6lookup17h4c3fb151a65b2097E>
   831e4:	b9401fea 	ldr	w10, [sp, #28]
   831e8:	37000ac0 	tbnz	w0, #0, 83340 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x310>
   831ec:	7140415f 	cmp	w10, #0x10, lsl #12
   831f0:	54000242 	b.cs	83238 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x208>  // b.hs, b.nlast
   831f4:	f0000001 	adrp	x1, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   831f8:	f0000003 	adrp	x3, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   831fc:	f0000005 	adrp	x5, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   83200:	2a0a03e0 	mov	w0, w10
   83204:	910b2021 	add	x1, x1, #0x2c8
   83208:	52800522 	mov	w2, #0x29                  	// #41
   8320c:	910c6863 	add	x3, x3, #0x31a
   83210:	52802444 	mov	w4, #0x122                 	// #290
   83214:	9110f0a5 	add	x5, x5, #0x43c
   83218:	528026a6 	mov	w6, #0x135                 	// #309
   8321c:	97fff979 	bl	81800 <_ZN4core7unicode9printable5check17h12f0cec41989e29fE.llvm.2339018429671269780>
   83220:	b9401fea 	ldr	w10, [sp, #28]
   83224:	360008e0 	tbz	w0, #0, 83340 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x310>
   83228:	1400003b 	b	83314 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x2e4>
   8322c:	52800053 	mov	w19, #0x2                   	// #2
   83230:	52800e57 	mov	w23, #0x72                  	// #114
   83234:	1400004d 	b	83368 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x338>
   83238:	7140815f 	cmp	w10, #0x20, lsl #12
   8323c:	540001e2 	b.cs	83278 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x248>  // b.hs, b.nlast
   83240:	f0000001 	adrp	x1, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   83244:	f0000003 	adrp	x3, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   83248:	f0000005 	adrp	x5, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   8324c:	2a0a03e0 	mov	w0, w10
   83250:	9115c421 	add	x1, x1, #0x571
   83254:	528004c2 	mov	w2, #0x26                  	// #38
   83258:	9116f463 	add	x3, x3, #0x5bd
   8325c:	528015e4 	mov	w4, #0xaf                  	// #175
   83260:	9119b0a5 	add	x5, x5, #0x66c
   83264:	52803466 	mov	w6, #0x1a3                 	// #419
   83268:	97fff966 	bl	81800 <_ZN4core7unicode9printable5check17h12f0cec41989e29fE.llvm.2339018429671269780>
   8326c:	b9401fea 	ldr	w10, [sp, #28]
   83270:	37000520 	tbnz	w0, #0, 83314 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x2e4>
   83274:	14000033 	b	83340 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x310>
   83278:	528b2448 	mov	w8, #0x5922                	// #22818
   8327c:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   83280:	0b080148 	add	w8, w10, w8
   83284:	7100891f 	cmp	w8, #0x22
   83288:	540005c3 	b.cc	83340 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x310>  // b.lo, b.ul, b.last
   8328c:	52891968 	mov	w8, #0x48cb                	// #18635
   83290:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   83294:	0b080148 	add	w8, w10, w8
   83298:	71002d1f 	cmp	w8, #0xb
   8329c:	54000523 	b.cc	83340 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x310>  // b.lo, b.ul, b.last
   832a0:	529703c9 	mov	w9, #0xb81e                	// #47134
   832a4:	121f4d48 	and	w8, w10, #0x1ffffe
   832a8:	72a00049 	movk	w9, #0x2, lsl #16
   832ac:	6b09011f 	cmp	w8, w9
   832b0:	54000480 	b.eq	83340 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x310>  // b.none
   832b4:	52862bc8 	mov	w8, #0x315e                	// #12638
   832b8:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   832bc:	0b080148 	add	w8, w10, w8
   832c0:	7100391f 	cmp	w8, #0xe
   832c4:	540003e3 	b.cc	83340 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x310>  // b.lo, b.ul, b.last
   832c8:	5280bc48 	mov	w8, #0x5e2                 	// #1506
   832cc:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   832d0:	0b080148 	add	w8, w10, w8
   832d4:	1138f509 	add	w9, w8, #0xe3d
   832d8:	71307d3f 	cmp	w9, #0xc1f
   832dc:	54000323 	b.cc	83340 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x310>  // b.lo, b.ul, b.last
   832e0:	7117891f 	cmp	w8, #0x5e2
   832e4:	540002e3 	b.cc	83340 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x310>  // b.lo, b.ul, b.last
   832e8:	529d96a8 	mov	w8, #0xecb5                	// #60597
   832ec:	529db6a9 	mov	w9, #0xedb5                	// #60853
   832f0:	72bfff88 	movk	w8, #0xfffc, lsl #16
   832f4:	72a00149 	movk	w9, #0xa, lsl #16
   832f8:	0b080148 	add	w8, w10, w8
   832fc:	6b09011f 	cmp	w8, w9
   83300:	54000203 	b.cc	83340 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x310>  // b.lo, b.ul, b.last
   83304:	52803e08 	mov	w8, #0x1f0                 	// #496
   83308:	72a001c8 	movk	w8, #0xe, lsl #16
   8330c:	6b08015f 	cmp	w10, w8
   83310:	54000182 	b.cs	83340 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x310>  // b.hs, b.nlast
   83314:	f94017eb 	ldr	x11, [sp, #40]
   83318:	f000000c 	adrp	x12, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   8331c:	f9400be9 	ldr	x9, [sp, #16]
   83320:	9127c18c 	add	x12, x12, #0x9f0
   83324:	f94003ea 	ldr	x10, [sp]
   83328:	cb0902a8 	sub	x8, x21, x9
   8332c:	aa0a03e9 	mov	x9, x10
   83330:	8b0a0115 	add	x21, x8, x10
   83334:	eb1a015f 	cmp	x10, x26
   83338:	54ffeca1 	b.ne	830cc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x9c>  // b.any
   8333c:	14000083 	b	83548 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x518>
   83340:	32000148 	orr	w8, w10, #0x1
   83344:	2a0a03e9 	mov	w9, w10
   83348:	5ac01108 	clz	w8, w8
   8334c:	f94017eb 	ldr	x11, [sp, #40]
   83350:	53027d08 	lsr	w8, w8, #2
   83354:	5200091b 	eor	w27, w8, #0x7
   83358:	d2c000a8 	mov	x8, #0x500000000           	// #21474836480
   8335c:	f94003ed 	ldr	x13, [sp]
   83360:	aa080139 	orr	x25, x9, x8
   83364:	52800073 	mov	w19, #0x3                   	// #3
   83368:	eb1802bf 	cmp	x21, x24
   8336c:	540013c3 	b.cc	835e4 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x5b4>  // b.lo, b.ul, b.last
   83370:	b4000138 	cbz	x24, 83394 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x364>
   83374:	eb0b031f 	cmp	x24, x11
   83378:	540000c2 	b.cs	83390 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x360>  // b.hs, b.nlast
   8337c:	f9401be8 	ldr	x8, [sp, #48]
   83380:	38f86908 	ldrsb	w8, [x8, x24]
   83384:	3101011f 	cmn	w8, #0x40
   83388:	5400006a 	b.ge	83394 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x364>  // b.tcont
   8338c:	14000096 	b	835e4 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x5b4>
   83390:	540012a1 	b.ne	835e4 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x5b4>  // b.any
   83394:	b4000135 	cbz	x21, 833b8 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x388>
   83398:	eb0b02bf 	cmp	x21, x11
   8339c:	54000122 	b.cs	833c0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x390>  // b.hs, b.nlast
   833a0:	f9401be8 	ldr	x8, [sp, #48]
   833a4:	aa1503fa 	mov	x26, x21
   833a8:	38f56908 	ldrsb	w8, [x8, x21]
   833ac:	3101051f 	cmn	w8, #0x41
   833b0:	540000cc 	b.gt	833c8 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x398>
   833b4:	1400008c 	b	835e4 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x5b4>
   833b8:	aa1f03fa 	mov	x26, xzr
   833bc:	14000003 	b	833c8 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x398>
   833c0:	aa0b03fa 	mov	x26, x11
   833c4:	54001101 	b.ne	835e4 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x5b4>  // b.any
   833c8:	f94013e8 	ldr	x8, [sp, #32]
   833cc:	cb180342 	sub	x2, x26, x24
   833d0:	f9401be9 	ldr	x9, [sp, #48]
   833d4:	aa1403e0 	mov	x0, x20
   833d8:	aa0d03f6 	mov	x22, x13
   833dc:	f9400d08 	ldr	x8, [x8, #24]
   833e0:	8b180121 	add	x1, x9, x24
   833e4:	d63f0100 	blr	x8
   833e8:	f0000018 	adrp	x24, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   833ec:	91283b18 	add	x24, x24, #0xa0e
   833f0:	36000100 	tbz	w0, #0, 83410 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x3e0>
   833f4:	17ffff1e 	b	8306c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x3c>
   833f8:	2a1f03f3 	mov	w19, wzr
   833fc:	2a1703e1 	mov	w1, w23
   83400:	f9401fe2 	ldr	x2, [sp, #56]
   83404:	aa1403e0 	mov	x0, x20
   83408:	d63f0040 	blr	x2
   8340c:	3707e300 	tbnz	w0, #0, 8306c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x3c>
   83410:	2a1303e8 	mov	w8, w19
   83414:	52800033 	mov	w19, #0x1                   	// #1
   83418:	2a0803e8 	mov	w8, w8
   8341c:	2a1d03e1 	mov	w1, w29
   83420:	10fffec9 	adr	x9, 833f8 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x3c8>
   83424:	38686b8a 	ldrb	w10, [x28, x8]
   83428:	8b0a0929 	add	x9, x9, x10, lsl #2
   8342c:	d61f0120 	br	x9
   83430:	d3609f28 	ubfx	x8, x25, #32, #8
   83434:	10000089 	adr	x9, 83444 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x414>
   83438:	38686b0a 	ldrb	w10, [x24, x8]
   8343c:	8b0a0929 	add	x9, x9, x10, lsl #2
   83440:	d61f0120 	br	x9
   83444:	9258df39 	and	x25, x25, #0xffffff00ffffffff
   83448:	52800073 	mov	w19, #0x3                   	// #3
   8344c:	52800fa1 	mov	w1, #0x7d                  	// #125
   83450:	17ffffec 	b	83400 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x3d0>
   83454:	9258df28 	and	x8, x25, #0xffffff00ffffffff
   83458:	52800073 	mov	w19, #0x3                   	// #3
   8345c:	b2600519 	orr	x25, x8, #0x300000000
   83460:	52800ea1 	mov	w1, #0x75                  	// #117
   83464:	17ffffe7 	b	83400 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x3d0>
   83468:	531e0b68 	ubfiz	w8, w27, #2, #3
   8346c:	52800ae9 	mov	w9, #0x57                  	// #87
   83470:	5280060a 	mov	w10, #0x30                  	// #48
   83474:	1ac82728 	lsr	w8, w25, w8
   83478:	12000d08 	and	w8, w8, #0xf
   8347c:	7100291f 	cmp	w8, #0xa
   83480:	1a893149 	csel	w9, w10, w9, cc  // cc = lo, ul, last
   83484:	0b080121 	add	w1, w9, w8
   83488:	b40001db 	cbz	x27, 834c0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x490>
   8348c:	d100077b 	sub	x27, x27, #0x1
   83490:	52800073 	mov	w19, #0x3                   	// #3
   83494:	17ffffdb 	b	83400 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x3d0>
   83498:	9258df28 	and	x8, x25, #0xffffff00ffffffff
   8349c:	52800073 	mov	w19, #0x3                   	// #3
   834a0:	b25f0119 	orr	x25, x8, #0x200000000
   834a4:	52800f61 	mov	w1, #0x7b                  	// #123
   834a8:	17ffffd6 	b	83400 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x3d0>
   834ac:	9258df28 	and	x8, x25, #0xffffff00ffffffff
   834b0:	52800073 	mov	w19, #0x3                   	// #3
   834b4:	b25e0119 	orr	x25, x8, #0x400000000
   834b8:	2a1d03e1 	mov	w1, w29
   834bc:	17ffffd1 	b	83400 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x3d0>
   834c0:	9258df28 	and	x8, x25, #0xffffff00ffffffff
   834c4:	52800073 	mov	w19, #0x3                   	// #3
   834c8:	b2600119 	orr	x25, x8, #0x100000000
   834cc:	17ffffcd 	b	83400 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x3d0>
   834d0:	b9401fe8 	ldr	w8, [sp, #28]
   834d4:	7102011f 	cmp	w8, #0x80
   834d8:	54000102 	b.cs	834f8 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x4c8>  // b.hs, b.nlast
   834dc:	f94017eb 	ldr	x11, [sp, #40]
   834e0:	f000000c 	adrp	x12, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   834e4:	f9400be9 	ldr	x9, [sp, #16]
   834e8:	52800028 	mov	w8, #0x1                   	// #1
   834ec:	9127c18c 	add	x12, x12, #0x9f0
   834f0:	aa1603ea 	mov	x10, x22
   834f4:	1400000d 	b	83528 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x4f8>
   834f8:	f94017eb 	ldr	x11, [sp, #40]
   834fc:	f000000c 	adrp	x12, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   83500:	f9400be9 	ldr	x9, [sp, #16]
   83504:	9127c18c 	add	x12, x12, #0x9f0
   83508:	aa1603ea 	mov	x10, x22
   8350c:	7120011f 	cmp	w8, #0x800
   83510:	54000062 	b.cs	8351c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x4ec>  // b.hs, b.nlast
   83514:	52800048 	mov	w8, #0x2                   	// #2
   83518:	14000004 	b	83528 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x4f8>
   8351c:	7140411f 	cmp	w8, #0x10, lsl #12
   83520:	52800068 	mov	w8, #0x3                   	// #3
   83524:	9a883508 	cinc	x8, x8, cs  // cs = hs, nlast
   83528:	8b1a0118 	add	x24, x8, x26
   8352c:	f94007fa 	ldr	x26, [sp, #8]
   83530:	52800e96 	mov	w22, #0x74                  	// #116
   83534:	cb0902a8 	sub	x8, x21, x9
   83538:	aa0a03e9 	mov	x9, x10
   8353c:	8b0a0115 	add	x21, x8, x10
   83540:	eb1a015f 	cmp	x10, x26
   83544:	54ffdc41 	b.ne	830cc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x9c>  // b.any
   83548:	b4000138 	cbz	x24, 8356c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x53c>
   8354c:	eb0b031f 	cmp	x24, x11
   83550:	54000362 	b.cs	835bc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x58c>  // b.hs, b.nlast
   83554:	f9401be8 	ldr	x8, [sp, #48]
   83558:	38f86908 	ldrsb	w8, [x8, x24]
   8355c:	3101051f 	cmn	w8, #0x41
   83560:	5400032d 	b.le	835c4 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x594>
   83564:	aa1803e8 	mov	x8, x24
   83568:	14000002 	b	83570 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x540>
   8356c:	aa1f03e8 	mov	x8, xzr
   83570:	f94013e9 	ldr	x9, [sp, #32]
   83574:	cb080162 	sub	x2, x11, x8
   83578:	f9401bea 	ldr	x10, [sp, #48]
   8357c:	aa1403e0 	mov	x0, x20
   83580:	f9400d29 	ldr	x9, [x9, #24]
   83584:	8b080141 	add	x1, x10, x8
   83588:	d63f0120 	blr	x9
   8358c:	3707d700 	tbnz	w0, #0, 8306c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x3c>
   83590:	aa1403e0 	mov	x0, x20
   83594:	f9401fe2 	ldr	x2, [sp, #56]
   83598:	a9494ff4 	ldp	x20, x19, [sp, #144]
   8359c:	52800441 	mov	w1, #0x22                  	// #34
   835a0:	a94857f6 	ldp	x22, x21, [sp, #128]
   835a4:	a9475ff8 	ldp	x24, x23, [sp, #112]
   835a8:	a94667fa 	ldp	x26, x25, [sp, #96]
   835ac:	a9456ffc 	ldp	x28, x27, [sp, #80]
   835b0:	a9447bfd 	ldp	x29, x30, [sp, #64]
   835b4:	910283ff 	add	sp, sp, #0xa0
   835b8:	d61f0040 	br	x2
   835bc:	aa0b03e8 	mov	x8, x11
   835c0:	54fffd80 	b.eq	83570 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h5d87cdd23b341063E+0x540>  // b.none
   835c4:	b0000024 	adrp	x4, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   835c8:	f9401be0 	ldr	x0, [sp, #48]
   835cc:	91050084 	add	x4, x4, #0x140
   835d0:	aa0b03e1 	mov	x1, x11
   835d4:	aa1803e2 	mov	x2, x24
   835d8:	aa0b03e3 	mov	x3, x11
   835dc:	97fff9b5 	bl	81cb0 <_ZN4core3str16slice_error_fail17h932895516ec20f79E>
   835e0:	d4200020 	brk	#0x1
   835e4:	b0000024 	adrp	x4, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   835e8:	f9401be0 	ldr	x0, [sp, #48]
   835ec:	9104a084 	add	x4, x4, #0x128
   835f0:	aa0b03e1 	mov	x1, x11
   835f4:	aa1803e2 	mov	x2, x24
   835f8:	aa1503e3 	mov	x3, x21
   835fc:	97fff9ad 	bl	81cb0 <_ZN4core3str16slice_error_fail17h932895516ec20f79E>
   83600:	d4200020 	brk	#0x1
	...

0000000000083610 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE>:
   83610:	d101c3ff 	sub	sp, sp, #0x70
   83614:	a9064ff4 	stp	x20, x19, [sp, #96]
   83618:	aa0003f4 	mov	x20, x0
   8361c:	a9422033 	ldp	x19, x8, [x1, #32]
   83620:	528004e1 	mov	w1, #0x27                  	// #39
   83624:	a9017bfd 	stp	x29, x30, [sp, #16]
   83628:	a9026ffc 	stp	x28, x27, [sp, #32]
   8362c:	f9401102 	ldr	x2, [x8, #32]
   83630:	aa1303e0 	mov	x0, x19
   83634:	a90367fa 	stp	x26, x25, [sp, #48]
   83638:	a9045ff8 	stp	x24, x23, [sp, #64]
   8363c:	a90557f6 	stp	x22, x21, [sp, #80]
   83640:	f90007e2 	str	x2, [sp, #8]
   83644:	d63f0040 	blr	x2
   83648:	36000140 	tbz	w0, #0, 83670 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x60>
   8364c:	a9464ff4 	ldp	x20, x19, [sp, #96]
   83650:	52800020 	mov	w0, #0x1                   	// #1
   83654:	a94557f6 	ldp	x22, x21, [sp, #80]
   83658:	a9445ff8 	ldp	x24, x23, [sp, #64]
   8365c:	a94367fa 	ldp	x26, x25, [sp, #48]
   83660:	a9426ffc 	ldp	x28, x27, [sp, #32]
   83664:	a9417bfd 	ldp	x29, x30, [sp, #16]
   83668:	9101c3ff 	add	sp, sp, #0x70
   8366c:	d65f03c0 	ret
   83670:	b9400294 	ldr	w20, [x20]
   83674:	51002688 	sub	w8, w20, #0x9
   83678:	7100791f 	cmp	w8, #0x1e
   8367c:	54000188 	b.hi	836ac <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x9c>  // b.pmore
   83680:	f0000009 	adrp	x9, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   83684:	52800e95 	mov	w21, #0x74                  	// #116
   83688:	91285129 	add	x9, x9, #0xa14
   8368c:	52800057 	mov	w23, #0x2                   	// #2
   83690:	1000008a 	adr	x10, 836a0 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x90>
   83694:	3868692b 	ldrb	w11, [x9, x8]
   83698:	8b0b094a 	add	x10, x10, x11, lsl #2
   8369c:	d61f0140 	br	x10
   836a0:	52800dd5 	mov	w21, #0x6e                  	// #110
   836a4:	52800057 	mov	w23, #0x2                   	// #2
   836a8:	1400005c 	b	83818 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x208>
   836ac:	7101729f 	cmp	w20, #0x5c
   836b0:	54000081 	b.ne	836c0 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0xb0>  // b.any
   836b4:	52800057 	mov	w23, #0x2                   	// #2
   836b8:	2a1403f5 	mov	w21, w20
   836bc:	14000057 	b	83818 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x208>
   836c0:	2a1403e0 	mov	w0, w20
   836c4:	97fff6af 	bl	81180 <_ZN4core7unicode12unicode_data15grapheme_extend6lookup17h4c3fb151a65b2097E>
   836c8:	37000980 	tbnz	w0, #0, 837f8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x1e8>
   836cc:	7140429f 	cmp	w20, #0x10, lsl #12
   836d0:	54000222 	b.cs	83714 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x104>  // b.hs, b.nlast
   836d4:	f0000001 	adrp	x1, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   836d8:	f0000003 	adrp	x3, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   836dc:	f0000005 	adrp	x5, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   836e0:	910b2021 	add	x1, x1, #0x2c8
   836e4:	910c6863 	add	x3, x3, #0x31a
   836e8:	9110f0a5 	add	x5, x5, #0x43c
   836ec:	52800522 	mov	w2, #0x29                  	// #41
   836f0:	52802444 	mov	w4, #0x122                 	// #290
   836f4:	528026a6 	mov	w6, #0x135                 	// #309
   836f8:	2a1403e0 	mov	w0, w20
   836fc:	97fff841 	bl	81800 <_ZN4core7unicode9printable5check17h12f0cec41989e29fE.llvm.2339018429671269780>
   83700:	37000760 	tbnz	w0, #0, 837ec <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x1dc>
   83704:	1400003d 	b	837f8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x1e8>
   83708:	52800e55 	mov	w21, #0x72                  	// #114
   8370c:	52800057 	mov	w23, #0x2                   	// #2
   83710:	14000042 	b	83818 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x208>
   83714:	7140829f 	cmp	w20, #0x20, lsl #12
   83718:	540001c2 	b.cs	83750 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x140>  // b.hs, b.nlast
   8371c:	f0000001 	adrp	x1, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   83720:	f0000003 	adrp	x3, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   83724:	f0000005 	adrp	x5, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   83728:	9115c421 	add	x1, x1, #0x571
   8372c:	9116f463 	add	x3, x3, #0x5bd
   83730:	9119b0a5 	add	x5, x5, #0x66c
   83734:	528004c2 	mov	w2, #0x26                  	// #38
   83738:	528015e4 	mov	w4, #0xaf                  	// #175
   8373c:	52803466 	mov	w6, #0x1a3                 	// #419
   83740:	2a1403e0 	mov	w0, w20
   83744:	97fff82f 	bl	81800 <_ZN4core7unicode9printable5check17h12f0cec41989e29fE.llvm.2339018429671269780>
   83748:	37000520 	tbnz	w0, #0, 837ec <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x1dc>
   8374c:	1400002b 	b	837f8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x1e8>
   83750:	528b2448 	mov	w8, #0x5922                	// #22818
   83754:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   83758:	0b080288 	add	w8, w20, w8
   8375c:	7100891f 	cmp	w8, #0x22
   83760:	540004c3 	b.cc	837f8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x1e8>  // b.lo, b.ul, b.last
   83764:	52891968 	mov	w8, #0x48cb                	// #18635
   83768:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   8376c:	0b080288 	add	w8, w20, w8
   83770:	71002d1f 	cmp	w8, #0xb
   83774:	54000423 	b.cc	837f8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x1e8>  // b.lo, b.ul, b.last
   83778:	529703c9 	mov	w9, #0xb81e                	// #47134
   8377c:	121f4e88 	and	w8, w20, #0x1ffffe
   83780:	72a00049 	movk	w9, #0x2, lsl #16
   83784:	6b09011f 	cmp	w8, w9
   83788:	54000380 	b.eq	837f8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x1e8>  // b.none
   8378c:	52862bc8 	mov	w8, #0x315e                	// #12638
   83790:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   83794:	0b080288 	add	w8, w20, w8
   83798:	7100391f 	cmp	w8, #0xe
   8379c:	540002e3 	b.cc	837f8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x1e8>  // b.lo, b.ul, b.last
   837a0:	5280bc48 	mov	w8, #0x5e2                 	// #1506
   837a4:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   837a8:	0b080288 	add	w8, w20, w8
   837ac:	1138f509 	add	w9, w8, #0xe3d
   837b0:	71307d3f 	cmp	w9, #0xc1f
   837b4:	54000223 	b.cc	837f8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x1e8>  // b.lo, b.ul, b.last
   837b8:	7117891f 	cmp	w8, #0x5e2
   837bc:	540001e3 	b.cc	837f8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x1e8>  // b.lo, b.ul, b.last
   837c0:	529d96a8 	mov	w8, #0xecb5                	// #60597
   837c4:	529db6a9 	mov	w9, #0xedb5                	// #60853
   837c8:	72bfff88 	movk	w8, #0xfffc, lsl #16
   837cc:	72a00149 	movk	w9, #0xa, lsl #16
   837d0:	0b080288 	add	w8, w20, w8
   837d4:	6b09011f 	cmp	w8, w9
   837d8:	54000103 	b.cc	837f8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x1e8>  // b.lo, b.ul, b.last
   837dc:	52803e08 	mov	w8, #0x1f0                 	// #496
   837e0:	72a001c8 	movk	w8, #0xe, lsl #16
   837e4:	6b08029f 	cmp	w20, w8
   837e8:	54000082 	b.cs	837f8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x1e8>  // b.hs, b.nlast
   837ec:	52800037 	mov	w23, #0x1                   	// #1
   837f0:	2a1403f5 	mov	w21, w20
   837f4:	14000009 	b	83818 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x208>
   837f8:	32000288 	orr	w8, w20, #0x1
   837fc:	2a1403e9 	mov	w9, w20
   83800:	d2c000aa 	mov	x10, #0x500000000           	// #21474836480
   83804:	5ac01108 	clz	w8, w8
   83808:	53027d08 	lsr	w8, w8, #2
   8380c:	52000916 	eor	w22, w8, #0x7
   83810:	aa0a0138 	orr	x24, x9, x10
   83814:	52800077 	mov	w23, #0x3                   	// #3
   83818:	f000001a 	adrp	x26, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   8381c:	f0000019 	adrp	x25, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   83820:	52800b94 	mov	w20, #0x5c                  	// #92
   83824:	5280061b 	mov	w27, #0x30                  	// #48
   83828:	52800f7c 	mov	w28, #0x7b                  	// #123
   8382c:	52800ebd 	mov	w29, #0x75                  	// #117
   83830:	9128cf5a 	add	x26, x26, #0xa33
   83834:	9128df39 	add	x25, x25, #0xa37
   83838:	14000007 	b	83854 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x244>
   8383c:	2a1f03f7 	mov	w23, wzr
   83840:	2a1503e1 	mov	w1, w21
   83844:	f94007e2 	ldr	x2, [sp, #8]
   83848:	aa1303e0 	mov	x0, x19
   8384c:	d63f0040 	blr	x2
   83850:	3707efe0 	tbnz	w0, #0, 8364c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x3c>
   83854:	2a1703e8 	mov	w8, w23
   83858:	52800037 	mov	w23, #0x1                   	// #1
   8385c:	2a0803e8 	mov	w8, w8
   83860:	2a1403e1 	mov	w1, w20
   83864:	10fffec9 	adr	x9, 8383c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x22c>
   83868:	38686b4a 	ldrb	w10, [x26, x8]
   8386c:	8b0a0929 	add	x9, x9, x10, lsl #2
   83870:	d61f0120 	br	x9
   83874:	d3609f08 	ubfx	x8, x24, #32, #8
   83878:	10000089 	adr	x9, 83888 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x278>
   8387c:	38686b2a 	ldrb	w10, [x25, x8]
   83880:	8b0a0929 	add	x9, x9, x10, lsl #2
   83884:	d61f0120 	br	x9
   83888:	9258df18 	and	x24, x24, #0xffffff00ffffffff
   8388c:	52800077 	mov	w23, #0x3                   	// #3
   83890:	52800fa1 	mov	w1, #0x7d                  	// #125
   83894:	17ffffec 	b	83844 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x234>
   83898:	531e0ac8 	ubfiz	w8, w22, #2, #3
   8389c:	52800ae9 	mov	w9, #0x57                  	// #87
   838a0:	1ac82708 	lsr	w8, w24, w8
   838a4:	12000d08 	and	w8, w8, #0xf
   838a8:	7100291f 	cmp	w8, #0xa
   838ac:	1a893369 	csel	w9, w27, w9, cc  // cc = lo, ul, last
   838b0:	0b080121 	add	w1, w9, w8
   838b4:	b4000276 	cbz	x22, 83900 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x2f0>
   838b8:	d10006d6 	sub	x22, x22, #0x1
   838bc:	52800077 	mov	w23, #0x3                   	// #3
   838c0:	17ffffe1 	b	83844 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x234>
   838c4:	9258df08 	and	x8, x24, #0xffffff00ffffffff
   838c8:	52800077 	mov	w23, #0x3                   	// #3
   838cc:	b25f0118 	orr	x24, x8, #0x200000000
   838d0:	2a1c03e1 	mov	w1, w28
   838d4:	17ffffdc 	b	83844 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x234>
   838d8:	9258df08 	and	x8, x24, #0xffffff00ffffffff
   838dc:	52800077 	mov	w23, #0x3                   	// #3
   838e0:	b2600518 	orr	x24, x8, #0x300000000
   838e4:	2a1d03e1 	mov	w1, w29
   838e8:	17ffffd7 	b	83844 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x234>
   838ec:	9258df08 	and	x8, x24, #0xffffff00ffffffff
   838f0:	52800077 	mov	w23, #0x3                   	// #3
   838f4:	b25e0118 	orr	x24, x8, #0x400000000
   838f8:	2a1403e1 	mov	w1, w20
   838fc:	17ffffd2 	b	83844 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x234>
   83900:	9258df08 	and	x8, x24, #0xffffff00ffffffff
   83904:	52800077 	mov	w23, #0x3                   	// #3
   83908:	b2600118 	orr	x24, x8, #0x100000000
   8390c:	17ffffce 	b	83844 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h14840f67fe57787fE+0x234>
   83910:	aa1303e0 	mov	x0, x19
   83914:	f94007e2 	ldr	x2, [sp, #8]
   83918:	a9464ff4 	ldp	x20, x19, [sp, #96]
   8391c:	528004e1 	mov	w1, #0x27                  	// #39
   83920:	a94557f6 	ldp	x22, x21, [sp, #80]
   83924:	a9445ff8 	ldp	x24, x23, [sp, #64]
   83928:	a94367fa 	ldp	x26, x25, [sp, #48]
   8392c:	a9426ffc 	ldp	x28, x27, [sp, #32]
   83930:	a9417bfd 	ldp	x29, x30, [sp, #16]
   83934:	9101c3ff 	add	sp, sp, #0x70
   83938:	d61f0040 	br	x2
   8393c:	00000000 	.inst	0x00000000 ; undefined

0000000000083940 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a9ad9a917523fd9E>:
   83940:	a9402000 	ldp	x0, x8, [x0]
   83944:	f9400d02 	ldr	x2, [x8, #24]
   83948:	d61f0040 	br	x2
   8394c:	00000000 	.inst	0x00000000 ; undefined

0000000000083950 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h3d5dfc3806ecfe22E>:
   83950:	aa0103e8 	mov	x8, x1
   83954:	a9400801 	ldp	x1, x2, [x0]
   83958:	aa0803e0 	mov	x0, x8
   8395c:	17fffca1 	b	82be0 <_ZN4core3fmt9Formatter3pad17h878fee43bbd7a693E>

0000000000083960 <__hang>:
   83960:	d503205f 	wfe
   83964:	17ffffff 	b	83960 <__hang>
	...

0000000000084000 <__exception_trampoline>:
   84000:	d102c3ff 	sub	sp, sp, #0xb0
   84004:	a90007e0 	stp	x0, x1, [sp]
   84008:	a9010fe2 	stp	x2, x3, [sp, #16]
   8400c:	a90217e4 	stp	x4, x5, [sp, #32]
   84010:	a9031fe6 	stp	x6, x7, [sp, #48]
   84014:	a90427e8 	stp	x8, x9, [sp, #64]
   84018:	a9052fea 	stp	x10, x11, [sp, #80]
   8401c:	a90637ec 	stp	x12, x13, [sp, #96]
   84020:	a9073fee 	stp	x14, x15, [sp, #112]
   84024:	a90847f0 	stp	x16, x17, [sp, #128]
   84028:	a9097bf2 	stp	x18, x30, [sp, #144]
   8402c:	d538400a 	mrs	x10, spsr_el1
   84030:	d538402b 	mrs	x11, elr_el1
   84034:	a90a2fea 	stp	x10, x11, [sp, #160]
   84038:	d5385201 	mrs	x1, esr_el1
   8403c:	d5384002 	mrs	x2, spsr_el1
   84040:	d5386003 	mrs	x3, far_el1
   84044:	d5384024 	mrs	x4, elr_el1
   84048:	940003ee 	bl	85000 <__exception_handler_default>
   8404c:	a94a2fea 	ldp	x10, x11, [sp, #160]
   84050:	d518402b 	msr	elr_el1, x11
   84054:	d518400a 	msr	spsr_el1, x10
   84058:	a94007e0 	ldp	x0, x1, [sp]
   8405c:	a9410fe2 	ldp	x2, x3, [sp, #16]
   84060:	a94217e4 	ldp	x4, x5, [sp, #32]
   84064:	a9431fe6 	ldp	x6, x7, [sp, #48]
   84068:	a94427e8 	ldp	x8, x9, [sp, #64]
   8406c:	a9452fea 	ldp	x10, x11, [sp, #80]
   84070:	a94637ec 	ldp	x12, x13, [sp, #96]
   84074:	a9473fee 	ldp	x14, x15, [sp, #112]
   84078:	a94847f0 	ldp	x16, x17, [sp, #128]
   8407c:	a9497bf2 	ldp	x18, x30, [sp, #144]
   84080:	9102c3ff 	add	sp, sp, #0xb0
   84084:	d65f03c0 	ret
   84088:	d503201f 	nop
   8408c:	d503201f 	nop
   84090:	d503201f 	nop
   84094:	d503201f 	nop
   84098:	d503201f 	nop
   8409c:	d503201f 	nop
   840a0:	d503201f 	nop
   840a4:	d503201f 	nop
   840a8:	d503201f 	nop
   840ac:	d503201f 	nop
   840b0:	d503201f 	nop
   840b4:	d503201f 	nop
   840b8:	d503201f 	nop
   840bc:	d503201f 	nop
   840c0:	d503201f 	nop
   840c4:	d503201f 	nop
   840c8:	d503201f 	nop
   840cc:	d503201f 	nop
   840d0:	d503201f 	nop
   840d4:	d503201f 	nop
   840d8:	d503201f 	nop
   840dc:	d503201f 	nop
   840e0:	d503201f 	nop
   840e4:	d503201f 	nop
   840e8:	d503201f 	nop
   840ec:	d503201f 	nop
   840f0:	d503201f 	nop
   840f4:	d503201f 	nop
   840f8:	d503201f 	nop
   840fc:	d503201f 	nop
   84100:	d503201f 	nop
   84104:	d503201f 	nop
   84108:	d503201f 	nop
   8410c:	d503201f 	nop
   84110:	d503201f 	nop
   84114:	d503201f 	nop
   84118:	d503201f 	nop
   8411c:	d503201f 	nop
   84120:	d503201f 	nop
   84124:	d503201f 	nop
   84128:	d503201f 	nop
   8412c:	d503201f 	nop
   84130:	d503201f 	nop
   84134:	d503201f 	nop
   84138:	d503201f 	nop
   8413c:	d503201f 	nop
   84140:	d503201f 	nop
   84144:	d503201f 	nop
   84148:	d503201f 	nop
   8414c:	d503201f 	nop
   84150:	d503201f 	nop
   84154:	d503201f 	nop
   84158:	d503201f 	nop
   8415c:	d503201f 	nop
   84160:	d503201f 	nop
   84164:	d503201f 	nop
   84168:	d503201f 	nop
   8416c:	d503201f 	nop
   84170:	d503201f 	nop
   84174:	d503201f 	nop
   84178:	d503201f 	nop
   8417c:	d503201f 	nop
   84180:	d503201f 	nop
   84184:	d503201f 	nop
   84188:	d503201f 	nop
   8418c:	d503201f 	nop
   84190:	d503201f 	nop
   84194:	d503201f 	nop
   84198:	d503201f 	nop
   8419c:	d503201f 	nop
   841a0:	d503201f 	nop
   841a4:	d503201f 	nop
   841a8:	d503201f 	nop
   841ac:	d503201f 	nop
   841b0:	d503201f 	nop
   841b4:	d503201f 	nop
   841b8:	d503201f 	nop
   841bc:	d503201f 	nop
   841c0:	d503201f 	nop
   841c4:	d503201f 	nop
   841c8:	d503201f 	nop
   841cc:	d503201f 	nop
   841d0:	d503201f 	nop
   841d4:	d503201f 	nop
   841d8:	d503201f 	nop
   841dc:	d503201f 	nop
   841e0:	d503201f 	nop
   841e4:	d503201f 	nop
   841e8:	d503201f 	nop
   841ec:	d503201f 	nop
   841f0:	d503201f 	nop
   841f4:	d503201f 	nop
   841f8:	d503201f 	nop
   841fc:	d503201f 	nop
   84200:	d503201f 	nop
   84204:	d503201f 	nop
   84208:	d503201f 	nop
   8420c:	d503201f 	nop
   84210:	d503201f 	nop
   84214:	d503201f 	nop
   84218:	d503201f 	nop
   8421c:	d503201f 	nop
   84220:	d503201f 	nop
   84224:	d503201f 	nop
   84228:	d503201f 	nop
   8422c:	d503201f 	nop
   84230:	d503201f 	nop
   84234:	d503201f 	nop
   84238:	d503201f 	nop
   8423c:	d503201f 	nop
   84240:	d503201f 	nop
   84244:	d503201f 	nop
   84248:	d503201f 	nop
   8424c:	d503201f 	nop
   84250:	d503201f 	nop
   84254:	d503201f 	nop
   84258:	d503201f 	nop
   8425c:	d503201f 	nop
   84260:	d503201f 	nop
   84264:	d503201f 	nop
   84268:	d503201f 	nop
   8426c:	d503201f 	nop
   84270:	d503201f 	nop
   84274:	d503201f 	nop
   84278:	d503201f 	nop
   8427c:	d503201f 	nop
   84280:	d503201f 	nop
   84284:	d503201f 	nop
   84288:	d503201f 	nop
   8428c:	d503201f 	nop
   84290:	d503201f 	nop
   84294:	d503201f 	nop
   84298:	d503201f 	nop
   8429c:	d503201f 	nop
   842a0:	d503201f 	nop
   842a4:	d503201f 	nop
   842a8:	d503201f 	nop
   842ac:	d503201f 	nop
   842b0:	d503201f 	nop
   842b4:	d503201f 	nop
   842b8:	d503201f 	nop
   842bc:	d503201f 	nop
   842c0:	d503201f 	nop
   842c4:	d503201f 	nop
   842c8:	d503201f 	nop
   842cc:	d503201f 	nop
   842d0:	d503201f 	nop
   842d4:	d503201f 	nop
   842d8:	d503201f 	nop
   842dc:	d503201f 	nop
   842e0:	d503201f 	nop
   842e4:	d503201f 	nop
   842e8:	d503201f 	nop
   842ec:	d503201f 	nop
   842f0:	d503201f 	nop
   842f4:	d503201f 	nop
   842f8:	d503201f 	nop
   842fc:	d503201f 	nop
   84300:	d503201f 	nop
   84304:	d503201f 	nop
   84308:	d503201f 	nop
   8430c:	d503201f 	nop
   84310:	d503201f 	nop
   84314:	d503201f 	nop
   84318:	d503201f 	nop
   8431c:	d503201f 	nop
   84320:	d503201f 	nop
   84324:	d503201f 	nop
   84328:	d503201f 	nop
   8432c:	d503201f 	nop
   84330:	d503201f 	nop
   84334:	d503201f 	nop
   84338:	d503201f 	nop
   8433c:	d503201f 	nop
   84340:	d503201f 	nop
   84344:	d503201f 	nop
   84348:	d503201f 	nop
   8434c:	d503201f 	nop
   84350:	d503201f 	nop
   84354:	d503201f 	nop
   84358:	d503201f 	nop
   8435c:	d503201f 	nop
   84360:	d503201f 	nop
   84364:	d503201f 	nop
   84368:	d503201f 	nop
   8436c:	d503201f 	nop
   84370:	d503201f 	nop
   84374:	d503201f 	nop
   84378:	d503201f 	nop
   8437c:	d503201f 	nop
   84380:	d503201f 	nop
   84384:	d503201f 	nop
   84388:	d503201f 	nop
   8438c:	d503201f 	nop
   84390:	d503201f 	nop
   84394:	d503201f 	nop
   84398:	d503201f 	nop
   8439c:	d503201f 	nop
   843a0:	d503201f 	nop
   843a4:	d503201f 	nop
   843a8:	d503201f 	nop
   843ac:	d503201f 	nop
   843b0:	d503201f 	nop
   843b4:	d503201f 	nop
   843b8:	d503201f 	nop
   843bc:	d503201f 	nop
   843c0:	d503201f 	nop
   843c4:	d503201f 	nop
   843c8:	d503201f 	nop
   843cc:	d503201f 	nop
   843d0:	d503201f 	nop
   843d4:	d503201f 	nop
   843d8:	d503201f 	nop
   843dc:	d503201f 	nop
   843e0:	d503201f 	nop
   843e4:	d503201f 	nop
   843e8:	d503201f 	nop
   843ec:	d503201f 	nop
   843f0:	d503201f 	nop
   843f4:	d503201f 	nop
   843f8:	d503201f 	nop
   843fc:	d503201f 	nop
   84400:	d503201f 	nop
   84404:	d503201f 	nop
   84408:	d503201f 	nop
   8440c:	d503201f 	nop
   84410:	d503201f 	nop
   84414:	d503201f 	nop
   84418:	d503201f 	nop
   8441c:	d503201f 	nop
   84420:	d503201f 	nop
   84424:	d503201f 	nop
   84428:	d503201f 	nop
   8442c:	d503201f 	nop
   84430:	d503201f 	nop
   84434:	d503201f 	nop
   84438:	d503201f 	nop
   8443c:	d503201f 	nop
   84440:	d503201f 	nop
   84444:	d503201f 	nop
   84448:	d503201f 	nop
   8444c:	d503201f 	nop
   84450:	d503201f 	nop
   84454:	d503201f 	nop
   84458:	d503201f 	nop
   8445c:	d503201f 	nop
   84460:	d503201f 	nop
   84464:	d503201f 	nop
   84468:	d503201f 	nop
   8446c:	d503201f 	nop
   84470:	d503201f 	nop
   84474:	d503201f 	nop
   84478:	d503201f 	nop
   8447c:	d503201f 	nop
   84480:	d503201f 	nop
   84484:	d503201f 	nop
   84488:	d503201f 	nop
   8448c:	d503201f 	nop
   84490:	d503201f 	nop
   84494:	d503201f 	nop
   84498:	d503201f 	nop
   8449c:	d503201f 	nop
   844a0:	d503201f 	nop
   844a4:	d503201f 	nop
   844a8:	d503201f 	nop
   844ac:	d503201f 	nop
   844b0:	d503201f 	nop
   844b4:	d503201f 	nop
   844b8:	d503201f 	nop
   844bc:	d503201f 	nop
   844c0:	d503201f 	nop
   844c4:	d503201f 	nop
   844c8:	d503201f 	nop
   844cc:	d503201f 	nop
   844d0:	d503201f 	nop
   844d4:	d503201f 	nop
   844d8:	d503201f 	nop
   844dc:	d503201f 	nop
   844e0:	d503201f 	nop
   844e4:	d503201f 	nop
   844e8:	d503201f 	nop
   844ec:	d503201f 	nop
   844f0:	d503201f 	nop
   844f4:	d503201f 	nop
   844f8:	d503201f 	nop
   844fc:	d503201f 	nop
   84500:	d503201f 	nop
   84504:	d503201f 	nop
   84508:	d503201f 	nop
   8450c:	d503201f 	nop
   84510:	d503201f 	nop
   84514:	d503201f 	nop
   84518:	d503201f 	nop
   8451c:	d503201f 	nop
   84520:	d503201f 	nop
   84524:	d503201f 	nop
   84528:	d503201f 	nop
   8452c:	d503201f 	nop
   84530:	d503201f 	nop
   84534:	d503201f 	nop
   84538:	d503201f 	nop
   8453c:	d503201f 	nop
   84540:	d503201f 	nop
   84544:	d503201f 	nop
   84548:	d503201f 	nop
   8454c:	d503201f 	nop
   84550:	d503201f 	nop
   84554:	d503201f 	nop
   84558:	d503201f 	nop
   8455c:	d503201f 	nop
   84560:	d503201f 	nop
   84564:	d503201f 	nop
   84568:	d503201f 	nop
   8456c:	d503201f 	nop
   84570:	d503201f 	nop
   84574:	d503201f 	nop
   84578:	d503201f 	nop
   8457c:	d503201f 	nop
   84580:	d503201f 	nop
   84584:	d503201f 	nop
   84588:	d503201f 	nop
   8458c:	d503201f 	nop
   84590:	d503201f 	nop
   84594:	d503201f 	nop
   84598:	d503201f 	nop
   8459c:	d503201f 	nop
   845a0:	d503201f 	nop
   845a4:	d503201f 	nop
   845a8:	d503201f 	nop
   845ac:	d503201f 	nop
   845b0:	d503201f 	nop
   845b4:	d503201f 	nop
   845b8:	d503201f 	nop
   845bc:	d503201f 	nop
   845c0:	d503201f 	nop
   845c4:	d503201f 	nop
   845c8:	d503201f 	nop
   845cc:	d503201f 	nop
   845d0:	d503201f 	nop
   845d4:	d503201f 	nop
   845d8:	d503201f 	nop
   845dc:	d503201f 	nop
   845e0:	d503201f 	nop
   845e4:	d503201f 	nop
   845e8:	d503201f 	nop
   845ec:	d503201f 	nop
   845f0:	d503201f 	nop
   845f4:	d503201f 	nop
   845f8:	d503201f 	nop
   845fc:	d503201f 	nop
   84600:	d503201f 	nop
   84604:	d503201f 	nop
   84608:	d503201f 	nop
   8460c:	d503201f 	nop
   84610:	d503201f 	nop
   84614:	d503201f 	nop
   84618:	d503201f 	nop
   8461c:	d503201f 	nop
   84620:	d503201f 	nop
   84624:	d503201f 	nop
   84628:	d503201f 	nop
   8462c:	d503201f 	nop
   84630:	d503201f 	nop
   84634:	d503201f 	nop
   84638:	d503201f 	nop
   8463c:	d503201f 	nop
   84640:	d503201f 	nop
   84644:	d503201f 	nop
   84648:	d503201f 	nop
   8464c:	d503201f 	nop
   84650:	d503201f 	nop
   84654:	d503201f 	nop
   84658:	d503201f 	nop
   8465c:	d503201f 	nop
   84660:	d503201f 	nop
   84664:	d503201f 	nop
   84668:	d503201f 	nop
   8466c:	d503201f 	nop
   84670:	d503201f 	nop
   84674:	d503201f 	nop
   84678:	d503201f 	nop
   8467c:	d503201f 	nop
   84680:	d503201f 	nop
   84684:	d503201f 	nop
   84688:	d503201f 	nop
   8468c:	d503201f 	nop
   84690:	d503201f 	nop
   84694:	d503201f 	nop
   84698:	d503201f 	nop
   8469c:	d503201f 	nop
   846a0:	d503201f 	nop
   846a4:	d503201f 	nop
   846a8:	d503201f 	nop
   846ac:	d503201f 	nop
   846b0:	d503201f 	nop
   846b4:	d503201f 	nop
   846b8:	d503201f 	nop
   846bc:	d503201f 	nop
   846c0:	d503201f 	nop
   846c4:	d503201f 	nop
   846c8:	d503201f 	nop
   846cc:	d503201f 	nop
   846d0:	d503201f 	nop
   846d4:	d503201f 	nop
   846d8:	d503201f 	nop
   846dc:	d503201f 	nop
   846e0:	d503201f 	nop
   846e4:	d503201f 	nop
   846e8:	d503201f 	nop
   846ec:	d503201f 	nop
   846f0:	d503201f 	nop
   846f4:	d503201f 	nop
   846f8:	d503201f 	nop
   846fc:	d503201f 	nop
   84700:	d503201f 	nop
   84704:	d503201f 	nop
   84708:	d503201f 	nop
   8470c:	d503201f 	nop
   84710:	d503201f 	nop
   84714:	d503201f 	nop
   84718:	d503201f 	nop
   8471c:	d503201f 	nop
   84720:	d503201f 	nop
   84724:	d503201f 	nop
   84728:	d503201f 	nop
   8472c:	d503201f 	nop
   84730:	d503201f 	nop
   84734:	d503201f 	nop
   84738:	d503201f 	nop
   8473c:	d503201f 	nop
   84740:	d503201f 	nop
   84744:	d503201f 	nop
   84748:	d503201f 	nop
   8474c:	d503201f 	nop
   84750:	d503201f 	nop
   84754:	d503201f 	nop
   84758:	d503201f 	nop
   8475c:	d503201f 	nop
   84760:	d503201f 	nop
   84764:	d503201f 	nop
   84768:	d503201f 	nop
   8476c:	d503201f 	nop
   84770:	d503201f 	nop
   84774:	d503201f 	nop
   84778:	d503201f 	nop
   8477c:	d503201f 	nop
   84780:	d503201f 	nop
   84784:	d503201f 	nop
   84788:	d503201f 	nop
   8478c:	d503201f 	nop
   84790:	d503201f 	nop
   84794:	d503201f 	nop
   84798:	d503201f 	nop
   8479c:	d503201f 	nop
   847a0:	d503201f 	nop
   847a4:	d503201f 	nop
   847a8:	d503201f 	nop
   847ac:	d503201f 	nop
   847b0:	d503201f 	nop
   847b4:	d503201f 	nop
   847b8:	d503201f 	nop
   847bc:	d503201f 	nop
   847c0:	d503201f 	nop
   847c4:	d503201f 	nop
   847c8:	d503201f 	nop
   847cc:	d503201f 	nop
   847d0:	d503201f 	nop
   847d4:	d503201f 	nop
   847d8:	d503201f 	nop
   847dc:	d503201f 	nop
   847e0:	d503201f 	nop
   847e4:	d503201f 	nop
   847e8:	d503201f 	nop
   847ec:	d503201f 	nop
   847f0:	d503201f 	nop
   847f4:	d503201f 	nop
   847f8:	d503201f 	nop
   847fc:	d503201f 	nop

0000000000084800 <__ExceptionVectorTable>:
   84800:	d10043ff 	sub	sp, sp, #0x10
   84804:	a9007be0 	stp	x0, x30, [sp]
   84808:	d2800020 	mov	x0, #0x1                   	// #1
   8480c:	97fffdfd 	bl	84000 <__exception_trampoline>
   84810:	a9407be0 	ldp	x0, x30, [sp]
   84814:	910043ff 	add	sp, sp, #0x10
   84818:	d69f03e0 	eret
   8481c:	d503201f 	nop
   84820:	d503201f 	nop
   84824:	d503201f 	nop
   84828:	d503201f 	nop
   8482c:	d503201f 	nop
   84830:	d503201f 	nop
   84834:	d503201f 	nop
   84838:	d503201f 	nop
   8483c:	d503201f 	nop
   84840:	d503201f 	nop
   84844:	d503201f 	nop
   84848:	d503201f 	nop
   8484c:	d503201f 	nop
   84850:	d503201f 	nop
   84854:	d503201f 	nop
   84858:	d503201f 	nop
   8485c:	d503201f 	nop
   84860:	d503201f 	nop
   84864:	d503201f 	nop
   84868:	d503201f 	nop
   8486c:	d503201f 	nop
   84870:	d503201f 	nop
   84874:	d503201f 	nop
   84878:	d503201f 	nop
   8487c:	d503201f 	nop

0000000000084880 <.EXC_CURREL_SP0_Irq>:
   84880:	d10043ff 	sub	sp, sp, #0x10
   84884:	a9007be0 	stp	x0, x30, [sp]
   84888:	d2800040 	mov	x0, #0x2                   	// #2
   8488c:	97fffddd 	bl	84000 <__exception_trampoline>
   84890:	a9407be0 	ldp	x0, x30, [sp]
   84894:	910043ff 	add	sp, sp, #0x10
   84898:	d69f03e0 	eret
   8489c:	d503201f 	nop
   848a0:	d503201f 	nop
   848a4:	d503201f 	nop
   848a8:	d503201f 	nop
   848ac:	d503201f 	nop
   848b0:	d503201f 	nop
   848b4:	d503201f 	nop
   848b8:	d503201f 	nop
   848bc:	d503201f 	nop
   848c0:	d503201f 	nop
   848c4:	d503201f 	nop
   848c8:	d503201f 	nop
   848cc:	d503201f 	nop
   848d0:	d503201f 	nop
   848d4:	d503201f 	nop
   848d8:	d503201f 	nop
   848dc:	d503201f 	nop
   848e0:	d503201f 	nop
   848e4:	d503201f 	nop
   848e8:	d503201f 	nop
   848ec:	d503201f 	nop
   848f0:	d503201f 	nop
   848f4:	d503201f 	nop
   848f8:	d503201f 	nop
   848fc:	d503201f 	nop

0000000000084900 <.EXC_CURREL_SP0_Fiq>:
   84900:	d10043ff 	sub	sp, sp, #0x10
   84904:	a9007be0 	stp	x0, x30, [sp]
   84908:	d2800060 	mov	x0, #0x3                   	// #3
   8490c:	97fffdbd 	bl	84000 <__exception_trampoline>
   84910:	a9407be0 	ldp	x0, x30, [sp]
   84914:	910043ff 	add	sp, sp, #0x10
   84918:	d69f03e0 	eret
   8491c:	d503201f 	nop
   84920:	d503201f 	nop
   84924:	d503201f 	nop
   84928:	d503201f 	nop
   8492c:	d503201f 	nop
   84930:	d503201f 	nop
   84934:	d503201f 	nop
   84938:	d503201f 	nop
   8493c:	d503201f 	nop
   84940:	d503201f 	nop
   84944:	d503201f 	nop
   84948:	d503201f 	nop
   8494c:	d503201f 	nop
   84950:	d503201f 	nop
   84954:	d503201f 	nop
   84958:	d503201f 	nop
   8495c:	d503201f 	nop
   84960:	d503201f 	nop
   84964:	d503201f 	nop
   84968:	d503201f 	nop
   8496c:	d503201f 	nop
   84970:	d503201f 	nop
   84974:	d503201f 	nop
   84978:	d503201f 	nop
   8497c:	d503201f 	nop

0000000000084980 <.EXC_CURREL_SP0_SErr>:
   84980:	d10043ff 	sub	sp, sp, #0x10
   84984:	a9007be0 	stp	x0, x30, [sp]
   84988:	d2800080 	mov	x0, #0x4                   	// #4
   8498c:	97fffd9d 	bl	84000 <__exception_trampoline>
   84990:	a9407be0 	ldp	x0, x30, [sp]
   84994:	910043ff 	add	sp, sp, #0x10
   84998:	d69f03e0 	eret
   8499c:	d503201f 	nop
   849a0:	d503201f 	nop
   849a4:	d503201f 	nop
   849a8:	d503201f 	nop
   849ac:	d503201f 	nop
   849b0:	d503201f 	nop
   849b4:	d503201f 	nop
   849b8:	d503201f 	nop
   849bc:	d503201f 	nop
   849c0:	d503201f 	nop
   849c4:	d503201f 	nop
   849c8:	d503201f 	nop
   849cc:	d503201f 	nop
   849d0:	d503201f 	nop
   849d4:	d503201f 	nop
   849d8:	d503201f 	nop
   849dc:	d503201f 	nop
   849e0:	d503201f 	nop
   849e4:	d503201f 	nop
   849e8:	d503201f 	nop
   849ec:	d503201f 	nop
   849f0:	d503201f 	nop
   849f4:	d503201f 	nop
   849f8:	d503201f 	nop
   849fc:	d503201f 	nop

0000000000084a00 <.EXC_CURREL_SPX_Sync>:
   84a00:	d10043ff 	sub	sp, sp, #0x10
   84a04:	a9007be0 	stp	x0, x30, [sp]
   84a08:	d2800220 	mov	x0, #0x11                  	// #17
   84a0c:	97fffd7d 	bl	84000 <__exception_trampoline>
   84a10:	a9407be0 	ldp	x0, x30, [sp]
   84a14:	910043ff 	add	sp, sp, #0x10
   84a18:	d69f03e0 	eret
   84a1c:	d503201f 	nop
   84a20:	d503201f 	nop
   84a24:	d503201f 	nop
   84a28:	d503201f 	nop
   84a2c:	d503201f 	nop
   84a30:	d503201f 	nop
   84a34:	d503201f 	nop
   84a38:	d503201f 	nop
   84a3c:	d503201f 	nop
   84a40:	d503201f 	nop
   84a44:	d503201f 	nop
   84a48:	d503201f 	nop
   84a4c:	d503201f 	nop
   84a50:	d503201f 	nop
   84a54:	d503201f 	nop
   84a58:	d503201f 	nop
   84a5c:	d503201f 	nop
   84a60:	d503201f 	nop
   84a64:	d503201f 	nop
   84a68:	d503201f 	nop
   84a6c:	d503201f 	nop
   84a70:	d503201f 	nop
   84a74:	d503201f 	nop
   84a78:	d503201f 	nop
   84a7c:	d503201f 	nop

0000000000084a80 <.EXC_CURREL_SPX_Irq>:
   84a80:	d10043ff 	sub	sp, sp, #0x10
   84a84:	a9007be0 	stp	x0, x30, [sp]
   84a88:	d2800240 	mov	x0, #0x12                  	// #18
   84a8c:	97fffd5d 	bl	84000 <__exception_trampoline>
   84a90:	a9407be0 	ldp	x0, x30, [sp]
   84a94:	910043ff 	add	sp, sp, #0x10
   84a98:	d69f03e0 	eret
   84a9c:	d503201f 	nop
   84aa0:	d503201f 	nop
   84aa4:	d503201f 	nop
   84aa8:	d503201f 	nop
   84aac:	d503201f 	nop
   84ab0:	d503201f 	nop
   84ab4:	d503201f 	nop
   84ab8:	d503201f 	nop
   84abc:	d503201f 	nop
   84ac0:	d503201f 	nop
   84ac4:	d503201f 	nop
   84ac8:	d503201f 	nop
   84acc:	d503201f 	nop
   84ad0:	d503201f 	nop
   84ad4:	d503201f 	nop
   84ad8:	d503201f 	nop
   84adc:	d503201f 	nop
   84ae0:	d503201f 	nop
   84ae4:	d503201f 	nop
   84ae8:	d503201f 	nop
   84aec:	d503201f 	nop
   84af0:	d503201f 	nop
   84af4:	d503201f 	nop
   84af8:	d503201f 	nop
   84afc:	d503201f 	nop

0000000000084b00 <.EXC_CURREL_SPX_Fiq>:
   84b00:	d10043ff 	sub	sp, sp, #0x10
   84b04:	a9007be0 	stp	x0, x30, [sp]
   84b08:	d2800260 	mov	x0, #0x13                  	// #19
   84b0c:	97fffd3d 	bl	84000 <__exception_trampoline>
   84b10:	a9407be0 	ldp	x0, x30, [sp]
   84b14:	910043ff 	add	sp, sp, #0x10
   84b18:	d69f03e0 	eret
   84b1c:	d503201f 	nop
   84b20:	d503201f 	nop
   84b24:	d503201f 	nop
   84b28:	d503201f 	nop
   84b2c:	d503201f 	nop
   84b30:	d503201f 	nop
   84b34:	d503201f 	nop
   84b38:	d503201f 	nop
   84b3c:	d503201f 	nop
   84b40:	d503201f 	nop
   84b44:	d503201f 	nop
   84b48:	d503201f 	nop
   84b4c:	d503201f 	nop
   84b50:	d503201f 	nop
   84b54:	d503201f 	nop
   84b58:	d503201f 	nop
   84b5c:	d503201f 	nop
   84b60:	d503201f 	nop
   84b64:	d503201f 	nop
   84b68:	d503201f 	nop
   84b6c:	d503201f 	nop
   84b70:	d503201f 	nop
   84b74:	d503201f 	nop
   84b78:	d503201f 	nop
   84b7c:	d503201f 	nop

0000000000084b80 <.EXC_CURREL_SPX_SErr>:
   84b80:	d10043ff 	sub	sp, sp, #0x10
   84b84:	a9007be0 	stp	x0, x30, [sp]
   84b88:	d2800280 	mov	x0, #0x14                  	// #20
   84b8c:	97fffd1d 	bl	84000 <__exception_trampoline>
   84b90:	a9407be0 	ldp	x0, x30, [sp]
   84b94:	910043ff 	add	sp, sp, #0x10
   84b98:	d69f03e0 	eret
   84b9c:	d503201f 	nop
   84ba0:	d503201f 	nop
   84ba4:	d503201f 	nop
   84ba8:	d503201f 	nop
   84bac:	d503201f 	nop
   84bb0:	d503201f 	nop
   84bb4:	d503201f 	nop
   84bb8:	d503201f 	nop
   84bbc:	d503201f 	nop
   84bc0:	d503201f 	nop
   84bc4:	d503201f 	nop
   84bc8:	d503201f 	nop
   84bcc:	d503201f 	nop
   84bd0:	d503201f 	nop
   84bd4:	d503201f 	nop
   84bd8:	d503201f 	nop
   84bdc:	d503201f 	nop
   84be0:	d503201f 	nop
   84be4:	d503201f 	nop
   84be8:	d503201f 	nop
   84bec:	d503201f 	nop
   84bf0:	d503201f 	nop
   84bf4:	d503201f 	nop
   84bf8:	d503201f 	nop
   84bfc:	d503201f 	nop

0000000000084c00 <.EXC_LOWEREL64_SPX_Sync>:
   84c00:	d10043ff 	sub	sp, sp, #0x10
   84c04:	a9007be0 	stp	x0, x30, [sp]
   84c08:	d2800420 	mov	x0, #0x21                  	// #33
   84c0c:	97fffcfd 	bl	84000 <__exception_trampoline>
   84c10:	a9407be0 	ldp	x0, x30, [sp]
   84c14:	910043ff 	add	sp, sp, #0x10
   84c18:	d69f03e0 	eret
   84c1c:	d503201f 	nop
   84c20:	d503201f 	nop
   84c24:	d503201f 	nop
   84c28:	d503201f 	nop
   84c2c:	d503201f 	nop
   84c30:	d503201f 	nop
   84c34:	d503201f 	nop
   84c38:	d503201f 	nop
   84c3c:	d503201f 	nop
   84c40:	d503201f 	nop
   84c44:	d503201f 	nop
   84c48:	d503201f 	nop
   84c4c:	d503201f 	nop
   84c50:	d503201f 	nop
   84c54:	d503201f 	nop
   84c58:	d503201f 	nop
   84c5c:	d503201f 	nop
   84c60:	d503201f 	nop
   84c64:	d503201f 	nop
   84c68:	d503201f 	nop
   84c6c:	d503201f 	nop
   84c70:	d503201f 	nop
   84c74:	d503201f 	nop
   84c78:	d503201f 	nop
   84c7c:	d503201f 	nop

0000000000084c80 <.EXC_LOWEREL64_SPX_Irq>:
   84c80:	d10043ff 	sub	sp, sp, #0x10
   84c84:	a9007be0 	stp	x0, x30, [sp]
   84c88:	d2800440 	mov	x0, #0x22                  	// #34
   84c8c:	97fffcdd 	bl	84000 <__exception_trampoline>
   84c90:	a9407be0 	ldp	x0, x30, [sp]
   84c94:	910043ff 	add	sp, sp, #0x10
   84c98:	d69f03e0 	eret
   84c9c:	d503201f 	nop
   84ca0:	d503201f 	nop
   84ca4:	d503201f 	nop
   84ca8:	d503201f 	nop
   84cac:	d503201f 	nop
   84cb0:	d503201f 	nop
   84cb4:	d503201f 	nop
   84cb8:	d503201f 	nop
   84cbc:	d503201f 	nop
   84cc0:	d503201f 	nop
   84cc4:	d503201f 	nop
   84cc8:	d503201f 	nop
   84ccc:	d503201f 	nop
   84cd0:	d503201f 	nop
   84cd4:	d503201f 	nop
   84cd8:	d503201f 	nop
   84cdc:	d503201f 	nop
   84ce0:	d503201f 	nop
   84ce4:	d503201f 	nop
   84ce8:	d503201f 	nop
   84cec:	d503201f 	nop
   84cf0:	d503201f 	nop
   84cf4:	d503201f 	nop
   84cf8:	d503201f 	nop
   84cfc:	d503201f 	nop

0000000000084d00 <.EXC_LOWEREL64_SPX_Fiq>:
   84d00:	d10043ff 	sub	sp, sp, #0x10
   84d04:	a9007be0 	stp	x0, x30, [sp]
   84d08:	d2800460 	mov	x0, #0x23                  	// #35
   84d0c:	97fffcbd 	bl	84000 <__exception_trampoline>
   84d10:	a9407be0 	ldp	x0, x30, [sp]
   84d14:	910043ff 	add	sp, sp, #0x10
   84d18:	d69f03e0 	eret
   84d1c:	d503201f 	nop
   84d20:	d503201f 	nop
   84d24:	d503201f 	nop
   84d28:	d503201f 	nop
   84d2c:	d503201f 	nop
   84d30:	d503201f 	nop
   84d34:	d503201f 	nop
   84d38:	d503201f 	nop
   84d3c:	d503201f 	nop
   84d40:	d503201f 	nop
   84d44:	d503201f 	nop
   84d48:	d503201f 	nop
   84d4c:	d503201f 	nop
   84d50:	d503201f 	nop
   84d54:	d503201f 	nop
   84d58:	d503201f 	nop
   84d5c:	d503201f 	nop
   84d60:	d503201f 	nop
   84d64:	d503201f 	nop
   84d68:	d503201f 	nop
   84d6c:	d503201f 	nop
   84d70:	d503201f 	nop
   84d74:	d503201f 	nop
   84d78:	d503201f 	nop
   84d7c:	d503201f 	nop

0000000000084d80 <.EXC_LOWEREL64_SPX_SErr>:
   84d80:	d10043ff 	sub	sp, sp, #0x10
   84d84:	a9007be0 	stp	x0, x30, [sp]
   84d88:	d2800480 	mov	x0, #0x24                  	// #36
   84d8c:	97fffc9d 	bl	84000 <__exception_trampoline>
   84d90:	a9407be0 	ldp	x0, x30, [sp]
   84d94:	910043ff 	add	sp, sp, #0x10
   84d98:	d69f03e0 	eret
   84d9c:	d503201f 	nop
   84da0:	d503201f 	nop
   84da4:	d503201f 	nop
   84da8:	d503201f 	nop
   84dac:	d503201f 	nop
   84db0:	d503201f 	nop
   84db4:	d503201f 	nop
   84db8:	d503201f 	nop
   84dbc:	d503201f 	nop
   84dc0:	d503201f 	nop
   84dc4:	d503201f 	nop
   84dc8:	d503201f 	nop
   84dcc:	d503201f 	nop
   84dd0:	d503201f 	nop
   84dd4:	d503201f 	nop
   84dd8:	d503201f 	nop
   84ddc:	d503201f 	nop
   84de0:	d503201f 	nop
   84de4:	d503201f 	nop
   84de8:	d503201f 	nop
   84dec:	d503201f 	nop
   84df0:	d503201f 	nop
   84df4:	d503201f 	nop
   84df8:	d503201f 	nop
   84dfc:	d503201f 	nop

0000000000084e00 <.EXC_LOWEREL32_SPX_Sync>:
   84e00:	d10043ff 	sub	sp, sp, #0x10
   84e04:	a9007be0 	stp	x0, x30, [sp]
   84e08:	d2800620 	mov	x0, #0x31                  	// #49
   84e0c:	97fffc7d 	bl	84000 <__exception_trampoline>
   84e10:	a9407be0 	ldp	x0, x30, [sp]
   84e14:	910043ff 	add	sp, sp, #0x10
   84e18:	d69f03e0 	eret
   84e1c:	d503201f 	nop
   84e20:	d503201f 	nop
   84e24:	d503201f 	nop
   84e28:	d503201f 	nop
   84e2c:	d503201f 	nop
   84e30:	d503201f 	nop
   84e34:	d503201f 	nop
   84e38:	d503201f 	nop
   84e3c:	d503201f 	nop
   84e40:	d503201f 	nop
   84e44:	d503201f 	nop
   84e48:	d503201f 	nop
   84e4c:	d503201f 	nop
   84e50:	d503201f 	nop
   84e54:	d503201f 	nop
   84e58:	d503201f 	nop
   84e5c:	d503201f 	nop
   84e60:	d503201f 	nop
   84e64:	d503201f 	nop
   84e68:	d503201f 	nop
   84e6c:	d503201f 	nop
   84e70:	d503201f 	nop
   84e74:	d503201f 	nop
   84e78:	d503201f 	nop
   84e7c:	d503201f 	nop

0000000000084e80 <.EXC_LOWEREL32_SPX_Irq>:
   84e80:	d10043ff 	sub	sp, sp, #0x10
   84e84:	a9007be0 	stp	x0, x30, [sp]
   84e88:	d2800640 	mov	x0, #0x32                  	// #50
   84e8c:	97fffc5d 	bl	84000 <__exception_trampoline>
   84e90:	a9407be0 	ldp	x0, x30, [sp]
   84e94:	910043ff 	add	sp, sp, #0x10
   84e98:	d69f03e0 	eret
   84e9c:	d503201f 	nop
   84ea0:	d503201f 	nop
   84ea4:	d503201f 	nop
   84ea8:	d503201f 	nop
   84eac:	d503201f 	nop
   84eb0:	d503201f 	nop
   84eb4:	d503201f 	nop
   84eb8:	d503201f 	nop
   84ebc:	d503201f 	nop
   84ec0:	d503201f 	nop
   84ec4:	d503201f 	nop
   84ec8:	d503201f 	nop
   84ecc:	d503201f 	nop
   84ed0:	d503201f 	nop
   84ed4:	d503201f 	nop
   84ed8:	d503201f 	nop
   84edc:	d503201f 	nop
   84ee0:	d503201f 	nop
   84ee4:	d503201f 	nop
   84ee8:	d503201f 	nop
   84eec:	d503201f 	nop
   84ef0:	d503201f 	nop
   84ef4:	d503201f 	nop
   84ef8:	d503201f 	nop
   84efc:	d503201f 	nop

0000000000084f00 <.EXC_LOWEREL32_SPX_Fiq>:
   84f00:	d10043ff 	sub	sp, sp, #0x10
   84f04:	a9007be0 	stp	x0, x30, [sp]
   84f08:	d2800660 	mov	x0, #0x33                  	// #51
   84f0c:	97fffc3d 	bl	84000 <__exception_trampoline>
   84f10:	a9407be0 	ldp	x0, x30, [sp]
   84f14:	910043ff 	add	sp, sp, #0x10
   84f18:	d69f03e0 	eret
   84f1c:	d503201f 	nop
   84f20:	d503201f 	nop
   84f24:	d503201f 	nop
   84f28:	d503201f 	nop
   84f2c:	d503201f 	nop
   84f30:	d503201f 	nop
   84f34:	d503201f 	nop
   84f38:	d503201f 	nop
   84f3c:	d503201f 	nop
   84f40:	d503201f 	nop
   84f44:	d503201f 	nop
   84f48:	d503201f 	nop
   84f4c:	d503201f 	nop
   84f50:	d503201f 	nop
   84f54:	d503201f 	nop
   84f58:	d503201f 	nop
   84f5c:	d503201f 	nop
   84f60:	d503201f 	nop
   84f64:	d503201f 	nop
   84f68:	d503201f 	nop
   84f6c:	d503201f 	nop
   84f70:	d503201f 	nop
   84f74:	d503201f 	nop
   84f78:	d503201f 	nop
   84f7c:	d503201f 	nop

0000000000084f80 <.EXC_LOWEREL32_SPX_SErr>:
   84f80:	d10043ff 	sub	sp, sp, #0x10
   84f84:	a9007be0 	stp	x0, x30, [sp]
   84f88:	d2800680 	mov	x0, #0x34                  	// #52
   84f8c:	97fffc1d 	bl	84000 <__exception_trampoline>
   84f90:	a9407be0 	ldp	x0, x30, [sp]
   84f94:	910043ff 	add	sp, sp, #0x10
   84f98:	d69f03e0 	eret
   84f9c:	d503201f 	nop
   84fa0:	d503201f 	nop
   84fa4:	d503201f 	nop
   84fa8:	d503201f 	nop
   84fac:	d503201f 	nop
   84fb0:	d503201f 	nop
   84fb4:	d503201f 	nop
   84fb8:	d503201f 	nop
   84fbc:	d503201f 	nop
   84fc0:	d503201f 	nop
   84fc4:	d503201f 	nop
   84fc8:	d503201f 	nop
   84fcc:	d503201f 	nop
   84fd0:	d503201f 	nop
   84fd4:	d503201f 	nop
   84fd8:	d503201f 	nop
   84fdc:	d503201f 	nop
   84fe0:	d503201f 	nop
   84fe4:	d503201f 	nop
   84fe8:	d503201f 	nop
   84fec:	d503201f 	nop
   84ff0:	d503201f 	nop
   84ff4:	d503201f 	nop
   84ff8:	d503201f 	nop
   84ffc:	d503201f 	nop

0000000000085000 <__exception_handler_default>:
   85000:	d10283ff 	sub	sp, sp, #0xa0
   85004:	51000808 	sub	w8, w0, #0x2
   85008:	f90043fe 	str	x30, [sp, #128]
   8500c:	7100451f 	cmp	w8, #0x11
   85010:	a9094ff4 	stp	x20, x19, [sp, #144]
   85014:	a9000fe2 	stp	x2, x3, [sp]
   85018:	f9000be4 	str	x4, [sp, #16]
   8501c:	54000168 	b.hi	85048 <__exception_handler_default+0x48>  // b.pmore
   85020:	b0000009 	adrp	x9, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   85024:	912ab929 	add	x9, x9, #0xaae
   85028:	1000008a 	adr	x10, 85038 <__exception_handler_default+0x38>
   8502c:	3868692b 	ldrb	w11, [x9, x8]
   85030:	8b0b094a 	add	x10, x10, x11, lsl #2
   85034:	d61f0140 	br	x10
   85038:	a9494ff4 	ldp	x20, x19, [sp, #144]
   8503c:	f94043fe 	ldr	x30, [sp, #128]
   85040:	910283ff 	add	sp, sp, #0xa0
   85044:	17ffed2f 	b	80500 <__isr_default>
   85048:	b0000008 	adrp	x8, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   8504c:	f9477508 	ldr	x8, [x8, #3816]
   85050:	f9400108 	ldr	x8, [x8]
   85054:	b40001c8 	cbz	x8, 8508c <__exception_handler_default+0x8c>
   85058:	f0000008 	adrp	x8, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   8505c:	52800029 	mov	w9, #0x1                   	// #1
   85060:	91056108 	add	x8, x8, #0x158
   85064:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   85068:	9105a042 	add	x2, x2, #0x168
   8506c:	910143e0 	add	x0, sp, #0x50
   85070:	52800021 	mov	w1, #0x1                   	// #1
   85074:	a9067fff 	stp	xzr, xzr, [sp, #96]
   85078:	a90527e8 	stp	x8, x9, [sp, #80]
   8507c:	b0000008 	adrp	x8, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   85080:	912ba108 	add	x8, x8, #0xae8
   85084:	a9077fe8 	stp	x8, xzr, [sp, #112]
   85088:	97fff502 	bl	82490 <_ZN3log17__private_api_log17haa499543e16634a1E>
   8508c:	a9494ff4 	ldp	x20, x19, [sp, #144]
   85090:	f94043fe 	ldr	x30, [sp, #128]
   85094:	910283ff 	add	sp, sp, #0xa0
   85098:	d65f03c0 	ret
   8509c:	b0000014 	adrp	x20, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   850a0:	aa0103f3 	mov	x19, x1
   850a4:	f9477694 	ldr	x20, [x20, #3816]
   850a8:	f9400288 	ldr	x8, [x20]
   850ac:	b40002e8 	cbz	x8, 85108 <__exception_handler_default+0x108>
   850b0:	b0000009 	adrp	x9, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   850b4:	910043e8 	add	x8, sp, #0x10
   850b8:	910023ea 	add	x10, sp, #0x8
   850bc:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   850c0:	91074042 	add	x2, x2, #0x1d0
   850c4:	910063e0 	add	x0, sp, #0x18
   850c8:	f9477d29 	ldr	x9, [x9, #3832]
   850cc:	52800021 	mov	w1, #0x1                   	// #1
   850d0:	a90527e8 	stp	x8, x9, [sp, #80]
   850d4:	910003e8 	mov	x8, sp
   850d8:	a90627ea 	stp	x10, x9, [sp, #96]
   850dc:	f000000a 	adrp	x10, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   850e0:	9106814a 	add	x10, x10, #0x1a0
   850e4:	a90727e8 	stp	x8, x9, [sp, #112]
   850e8:	52800068 	mov	w8, #0x3                   	// #3
   850ec:	b0000009 	adrp	x9, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   850f0:	912e2129 	add	x9, x9, #0xb88
   850f4:	a901a3ea 	stp	x10, x8, [sp, #24]
   850f8:	910143ea 	add	x10, sp, #0x50
   850fc:	a902a3e9 	stp	x9, x8, [sp, #40]
   85100:	a903a3ea 	stp	x10, x8, [sp, #56]
   85104:	97fff4e3 	bl	82490 <_ZN3log17__private_api_log17haa499543e16634a1E>
   85108:	d35afe69 	lsr	x9, x19, #26
   8510c:	f90027e9 	str	x9, [sp, #72]
   85110:	f9400288 	ldr	x8, [x20]
   85114:	f100051f 	cmp	x8, #0x1
   85118:	54000289 	b.ls	85168 <__exception_handler_default+0x168>  // b.plast
   8511c:	b0000009 	adrp	x9, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   85120:	910123e8 	add	x8, sp, #0x48
   85124:	f000000a 	adrp	x10, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   85128:	b000000b 	adrp	x11, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   8512c:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   85130:	9108214a 	add	x10, x10, #0x208
   85134:	f9478129 	ldr	x9, [x9, #3840]
   85138:	9130c16b 	add	x11, x11, #0xc30
   8513c:	5280002c 	mov	w12, #0x1                   	// #1
   85140:	91086042 	add	x2, x2, #0x218
   85144:	910143e0 	add	x0, sp, #0x50
   85148:	52800041 	mov	w1, #0x2                   	// #2
   8514c:	a901a7e8 	stp	x8, x9, [sp, #24]
   85150:	910063e8 	add	x8, sp, #0x18
   85154:	a90533ea 	stp	x10, x12, [sp, #80]
   85158:	a90633eb 	stp	x11, x12, [sp, #96]
   8515c:	a90733e8 	stp	x8, x12, [sp, #112]
   85160:	97fff4cc 	bl	82490 <_ZN3log17__private_api_log17haa499543e16634a1E>
   85164:	f94027e9 	ldr	x9, [sp, #72]
   85168:	92406268 	and	x8, x19, #0x1ffffff
   8516c:	f100f13f 	cmp	x9, #0x3c
   85170:	f90047e8 	str	x8, [sp, #136]
   85174:	54000241 	b.ne	851bc <__exception_handler_default+0x1bc>  // b.any
   85178:	f9400288 	ldr	x8, [x20]
   8517c:	f1000d1f 	cmp	x8, #0x3
   85180:	540001c3 	b.cc	851b8 <__exception_handler_default+0x1b8>  // b.lo, b.ul, b.last
   85184:	f0000008 	adrp	x8, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   85188:	52800029 	mov	w9, #0x1                   	// #1
   8518c:	9109a108 	add	x8, x8, #0x268
   85190:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   85194:	9109e042 	add	x2, x2, #0x278
   85198:	910143e0 	add	x0, sp, #0x50
   8519c:	52800061 	mov	w1, #0x3                   	// #3
   851a0:	a9067fff 	stp	xzr, xzr, [sp, #96]
   851a4:	a90527e8 	stp	x8, x9, [sp, #80]
   851a8:	b0000008 	adrp	x8, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   851ac:	912ba108 	add	x8, x8, #0xae8
   851b0:	a9077fe8 	stp	x8, xzr, [sp, #112]
   851b4:	97fff4b7 	bl	82490 <_ZN3log17__private_api_log17haa499543e16634a1E>
   851b8:	14000000 	b	851b8 <__exception_handler_default+0x1b8>
   851bc:	f100953f 	cmp	x9, #0x25
   851c0:	54000f08 	b.hi	853a0 <__exception_handler_default+0x3a0>  // b.pmore
   851c4:	b000000a 	adrp	x10, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   851c8:	912b014a 	add	x10, x10, #0xac0
   851cc:	1000008b 	adr	x11, 851dc <__exception_handler_default+0x1dc>
   851d0:	3869694c 	ldrb	w12, [x10, x9]
   851d4:	8b0c096b 	add	x11, x11, x12, lsl #2
   851d8:	d61f0160 	br	x11
   851dc:	b0000000 	adrp	x0, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   851e0:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   851e4:	9139f000 	add	x0, x0, #0xe7c
   851e8:	91188042 	add	x2, x2, #0x620
   851ec:	528001c1 	mov	w1, #0xe                   	// #14
   851f0:	97fff430 	bl	822b0 <_ZN4core9panicking5panic17h1276bf0d71dbfb98E>
   851f4:	d4200020 	brk	#0x1
   851f8:	b0000000 	adrp	x0, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   851fc:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   85200:	91390800 	add	x0, x0, #0xe42
   85204:	528003a1 	mov	w1, #0x1d                  	// #29
   85208:	9117c042 	add	x2, x2, #0x5f0
   8520c:	97fff429 	bl	822b0 <_ZN4core9panicking5panic17h1276bf0d71dbfb98E>
   85210:	d4200020 	brk	#0x1
   85214:	b0000000 	adrp	x0, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   85218:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   8521c:	9137ac00 	add	x0, x0, #0xdeb
   85220:	528003a1 	mov	w1, #0x1d                  	// #29
   85224:	9116a042 	add	x2, x2, #0x5a8
   85228:	97fff422 	bl	822b0 <_ZN4core9panicking5panic17h1276bf0d71dbfb98E>
   8522c:	d4200020 	brk	#0x1
   85230:	b0000000 	adrp	x0, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   85234:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   85238:	9136f400 	add	x0, x0, #0xdbd
   8523c:	52800221 	mov	w1, #0x11                  	// #17
   85240:	9115e042 	add	x2, x2, #0x578
   85244:	97fff41b 	bl	822b0 <_ZN4core9panicking5panic17h1276bf0d71dbfb98E>
   85248:	d4200020 	brk	#0x1
   8524c:	b0000000 	adrp	x0, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   85250:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   85254:	91397c00 	add	x0, x0, #0xe5f
   85258:	528003a1 	mov	w1, #0x1d                  	// #29
   8525c:	91182042 	add	x2, x2, #0x608
   85260:	97fff414 	bl	822b0 <_ZN4core9panicking5panic17h1276bf0d71dbfb98E>
   85264:	d4200020 	brk	#0x1
   85268:	b0000000 	adrp	x0, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   8526c:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   85270:	91389400 	add	x0, x0, #0xe25
   85274:	528003a1 	mov	w1, #0x1d                  	// #29
   85278:	91176042 	add	x2, x2, #0x5d8
   8527c:	97fff40d 	bl	822b0 <_ZN4core9panicking5panic17h1276bf0d71dbfb98E>
   85280:	d4200020 	brk	#0x1
   85284:	b0000000 	adrp	x0, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   85288:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   8528c:	91382000 	add	x0, x0, #0xe08
   85290:	528003a1 	mov	w1, #0x1d                  	// #29
   85294:	91170042 	add	x2, x2, #0x5c0
   85298:	97fff406 	bl	822b0 <_ZN4core9panicking5panic17h1276bf0d71dbfb98E>
   8529c:	d4200020 	brk	#0x1
   852a0:	b0000000 	adrp	x0, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   852a4:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   852a8:	91373800 	add	x0, x0, #0xdce
   852ac:	528003a1 	mov	w1, #0x1d                  	// #29
   852b0:	91164042 	add	x2, x2, #0x590
   852b4:	97fff3ff 	bl	822b0 <_ZN4core9panicking5panic17h1276bf0d71dbfb98E>
   852b8:	d4200020 	brk	#0x1
   852bc:	b0000000 	adrp	x0, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   852c0:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   852c4:	9136a800 	add	x0, x0, #0xdaa
   852c8:	52800261 	mov	w1, #0x13                  	// #19
   852cc:	91158042 	add	x2, x2, #0x560
   852d0:	97fff3f8 	bl	822b0 <_ZN4core9panicking5panic17h1276bf0d71dbfb98E>
   852d4:	d4200020 	brk	#0x1
   852d8:	f9400289 	ldr	x9, [x20]
   852dc:	b4000289 	cbz	x9, 8532c <__exception_handler_default+0x32c>
   852e0:	b0000009 	adrp	x9, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   852e4:	910223e8 	add	x8, sp, #0x88
   852e8:	f000000a 	adrp	x10, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   852ec:	b000000b 	adrp	x11, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   852f0:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   852f4:	910ac14a 	add	x10, x10, #0x2b0
   852f8:	f9478129 	ldr	x9, [x9, #3840]
   852fc:	9130c16b 	add	x11, x11, #0xc30
   85300:	5280002c 	mov	w12, #0x1                   	// #1
   85304:	910b0042 	add	x2, x2, #0x2c0
   85308:	910143e0 	add	x0, sp, #0x50
   8530c:	52800021 	mov	w1, #0x1                   	// #1
   85310:	a901a7e8 	stp	x8, x9, [sp, #24]
   85314:	910063e8 	add	x8, sp, #0x18
   85318:	a90533ea 	stp	x10, x12, [sp, #80]
   8531c:	a90633eb 	stp	x11, x12, [sp, #96]
   85320:	a90733e8 	stp	x8, x12, [sp, #112]
   85324:	97fff45b 	bl	82490 <_ZN3log17__private_api_log17haa499543e16634a1E>
   85328:	f94047e8 	ldr	x8, [sp, #136]
   8532c:	36400248 	tbz	w8, #8, 85374 <__exception_handler_default+0x374>
   85330:	f9400289 	ldr	x9, [x20]
   85334:	f100113f 	cmp	x9, #0x4
   85338:	540001e3 	b.cc	85374 <__exception_handler_default+0x374>  // b.lo, b.ul, b.last
   8533c:	f0000008 	adrp	x8, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   85340:	52800029 	mov	w9, #0x1                   	// #1
   85344:	910be108 	add	x8, x8, #0x2f8
   85348:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   8534c:	910c2042 	add	x2, x2, #0x308
   85350:	910143e0 	add	x0, sp, #0x50
   85354:	52800081 	mov	w1, #0x4                   	// #4
   85358:	a9067fff 	stp	xzr, xzr, [sp, #96]
   8535c:	a90527e8 	stp	x8, x9, [sp, #80]
   85360:	b0000008 	adrp	x8, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   85364:	912ba108 	add	x8, x8, #0xae8
   85368:	a9077fe8 	stp	x8, xzr, [sp, #112]
   8536c:	97fff449 	bl	82490 <_ZN3log17__private_api_log17haa499543e16634a1E>
   85370:	f94047e8 	ldr	x8, [sp, #136]
   85374:	f9400289 	ldr	x9, [x20]
   85378:	f100113f 	cmp	x9, #0x4
   8537c:	37300208 	tbnz	w8, #6, 853bc <__exception_handler_default+0x3bc>
   85380:	540003a3 	b.cc	853f4 <__exception_handler_default+0x3f4>  // b.lo, b.ul, b.last
   85384:	f0000008 	adrp	x8, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   85388:	52800029 	mov	w9, #0x1                   	// #1
   8538c:	910e2108 	add	x8, x8, #0x388
   85390:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   85394:	a9067fff 	stp	xzr, xzr, [sp, #96]
   85398:	910e6042 	add	x2, x2, #0x398
   8539c:	1400000f 	b	853d8 <__exception_handler_default+0x3d8>
   853a0:	b0000000 	adrp	x0, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   853a4:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   853a8:	9131a000 	add	x0, x0, #0xc68
   853ac:	91094042 	add	x2, x2, #0x250
   853b0:	52800301 	mov	w1, #0x18                  	// #24
   853b4:	97fff3bf 	bl	822b0 <_ZN4core9panicking5panic17h1276bf0d71dbfb98E>
   853b8:	d4200020 	brk	#0x1
   853bc:	540001c3 	b.cc	853f4 <__exception_handler_default+0x3f4>  // b.lo, b.ul, b.last
   853c0:	f0000008 	adrp	x8, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   853c4:	52800029 	mov	w9, #0x1                   	// #1
   853c8:	910d0108 	add	x8, x8, #0x340
   853cc:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   853d0:	910d4042 	add	x2, x2, #0x350
   853d4:	a9067fff 	stp	xzr, xzr, [sp, #96]
   853d8:	a90527e8 	stp	x8, x9, [sp, #80]
   853dc:	b0000008 	adrp	x8, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   853e0:	912ba108 	add	x8, x8, #0xae8
   853e4:	a9077fe8 	stp	x8, xzr, [sp, #112]
   853e8:	910143e0 	add	x0, sp, #0x50
   853ec:	52800081 	mov	w1, #0x4                   	// #4
   853f0:	97fff428 	bl	82490 <_ZN3log17__private_api_log17haa499543e16634a1E>
   853f4:	f94047e8 	ldr	x8, [sp, #136]
   853f8:	92401509 	and	x9, x8, #0x3f
   853fc:	f100113f 	cmp	x9, #0x4
   85400:	54000241 	b.ne	85448 <__exception_handler_default+0x448>  // b.any
   85404:	f9400289 	ldr	x9, [x20]
   85408:	f100113f 	cmp	x9, #0x4
   8540c:	540001e3 	b.cc	85448 <__exception_handler_default+0x448>  // b.lo, b.ul, b.last
   85410:	f0000008 	adrp	x8, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   85414:	52800029 	mov	w9, #0x1                   	// #1
   85418:	910f4108 	add	x8, x8, #0x3d0
   8541c:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   85420:	910f8042 	add	x2, x2, #0x3e0
   85424:	910143e0 	add	x0, sp, #0x50
   85428:	52800081 	mov	w1, #0x4                   	// #4
   8542c:	a9067fff 	stp	xzr, xzr, [sp, #96]
   85430:	a90527e8 	stp	x8, x9, [sp, #80]
   85434:	b0000008 	adrp	x8, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   85438:	912ba108 	add	x8, x8, #0xae8
   8543c:	a9077fe8 	stp	x8, xzr, [sp, #112]
   85440:	97fff414 	bl	82490 <_ZN3log17__private_api_log17haa499543e16634a1E>
   85444:	f94047e8 	ldr	x8, [sp, #136]
   85448:	92401509 	and	x9, x8, #0x3f
   8544c:	f100153f 	cmp	x9, #0x5
   85450:	54000241 	b.ne	85498 <__exception_handler_default+0x498>  // b.any
   85454:	f9400289 	ldr	x9, [x20]
   85458:	f100113f 	cmp	x9, #0x4
   8545c:	540001e3 	b.cc	85498 <__exception_handler_default+0x498>  // b.lo, b.ul, b.last
   85460:	f0000008 	adrp	x8, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   85464:	52800029 	mov	w9, #0x1                   	// #1
   85468:	91106108 	add	x8, x8, #0x418
   8546c:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   85470:	9110a042 	add	x2, x2, #0x428
   85474:	910143e0 	add	x0, sp, #0x50
   85478:	52800081 	mov	w1, #0x4                   	// #4
   8547c:	a9067fff 	stp	xzr, xzr, [sp, #96]
   85480:	a90527e8 	stp	x8, x9, [sp, #80]
   85484:	b0000008 	adrp	x8, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   85488:	912ba108 	add	x8, x8, #0xae8
   8548c:	a9077fe8 	stp	x8, xzr, [sp, #112]
   85490:	97fff400 	bl	82490 <_ZN3log17__private_api_log17haa499543e16634a1E>
   85494:	f94047e8 	ldr	x8, [sp, #136]
   85498:	92401509 	and	x9, x8, #0x3f
   8549c:	f100193f 	cmp	x9, #0x6
   854a0:	54000241 	b.ne	854e8 <__exception_handler_default+0x4e8>  // b.any
   854a4:	f9400289 	ldr	x9, [x20]
   854a8:	f100113f 	cmp	x9, #0x4
   854ac:	540001e3 	b.cc	854e8 <__exception_handler_default+0x4e8>  // b.lo, b.ul, b.last
   854b0:	f0000008 	adrp	x8, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   854b4:	52800029 	mov	w9, #0x1                   	// #1
   854b8:	91118108 	add	x8, x8, #0x460
   854bc:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   854c0:	9111c042 	add	x2, x2, #0x470
   854c4:	910143e0 	add	x0, sp, #0x50
   854c8:	52800081 	mov	w1, #0x4                   	// #4
   854cc:	a9067fff 	stp	xzr, xzr, [sp, #96]
   854d0:	a90527e8 	stp	x8, x9, [sp, #80]
   854d4:	b0000008 	adrp	x8, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   854d8:	912ba108 	add	x8, x8, #0xae8
   854dc:	a9077fe8 	stp	x8, xzr, [sp, #112]
   854e0:	97fff3ec 	bl	82490 <_ZN3log17__private_api_log17haa499543e16634a1E>
   854e4:	f94047e8 	ldr	x8, [sp, #136]
   854e8:	92401509 	and	x9, x8, #0x3f
   854ec:	f1001d3f 	cmp	x9, #0x7
   854f0:	54000241 	b.ne	85538 <__exception_handler_default+0x538>  // b.any
   854f4:	f9400289 	ldr	x9, [x20]
   854f8:	f100113f 	cmp	x9, #0x4
   854fc:	540001e3 	b.cc	85538 <__exception_handler_default+0x538>  // b.lo, b.ul, b.last
   85500:	f0000008 	adrp	x8, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   85504:	52800029 	mov	w9, #0x1                   	// #1
   85508:	9112a108 	add	x8, x8, #0x4a8
   8550c:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   85510:	9112e042 	add	x2, x2, #0x4b8
   85514:	910143e0 	add	x0, sp, #0x50
   85518:	52800081 	mov	w1, #0x4                   	// #4
   8551c:	a9067fff 	stp	xzr, xzr, [sp, #96]
   85520:	a90527e8 	stp	x8, x9, [sp, #80]
   85524:	b0000008 	adrp	x8, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   85528:	912ba108 	add	x8, x8, #0xae8
   8552c:	a9077fe8 	stp	x8, xzr, [sp, #112]
   85530:	97fff3d8 	bl	82490 <_ZN3log17__private_api_log17haa499543e16634a1E>
   85534:	f94047e8 	ldr	x8, [sp, #136]
   85538:	92401508 	and	x8, x8, #0x3f
   8553c:	f100851f 	cmp	x8, #0x21
   85540:	54000301 	b.ne	855a0 <__exception_handler_default+0x5a0>  // b.any
   85544:	f9400288 	ldr	x8, [x20]
   85548:	f100111f 	cmp	x8, #0x4
   8554c:	540002a3 	b.cc	855a0 <__exception_handler_default+0x5a0>  // b.lo, b.ul, b.last
   85550:	b0000009 	adrp	x9, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   85554:	910023e8 	add	x8, sp, #0x8
   85558:	910043ea 	add	x10, sp, #0x10
   8555c:	f000000b 	adrp	x11, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   85560:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   85564:	9113c16b 	add	x11, x11, #0x4f0
   85568:	f9477d29 	ldr	x9, [x9, #3832]
   8556c:	91144042 	add	x2, x2, #0x510
   85570:	910143e0 	add	x0, sp, #0x50
   85574:	52800081 	mov	w1, #0x4                   	// #4
   85578:	a901a7e8 	stp	x8, x9, [sp, #24]
   8557c:	52800048 	mov	w8, #0x2                   	// #2
   85580:	a902a7ea 	stp	x10, x9, [sp, #40]
   85584:	b0000009 	adrp	x9, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   85588:	9134a129 	add	x9, x9, #0xd28
   8558c:	910063ea 	add	x10, sp, #0x18
   85590:	a90523eb 	stp	x11, x8, [sp, #80]
   85594:	a90623e9 	stp	x9, x8, [sp, #96]
   85598:	a90723ea 	stp	x10, x8, [sp, #112]
   8559c:	97fff3bd 	bl	82490 <_ZN3log17__private_api_log17haa499543e16634a1E>
   855a0:	b0000000 	adrp	x0, 86000 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x98>
   855a4:	f0000002 	adrp	x2, 88000 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x178>
   855a8:	91366000 	add	x0, x0, #0xd98
   855ac:	52800241 	mov	w1, #0x12                  	// #18
   855b0:	91152042 	add	x2, x2, #0x548
   855b4:	97fff33f 	bl	822b0 <_ZN4core9panicking5panic17h1276bf0d71dbfb98E>
   855b8:	d4200020 	brk	#0x1
   855bc:	00000000 	.inst	0x00000000 ; undefined

00000000000855c0 <__rust_entry>:
   855c0:	a9bf4ffe 	stp	x30, x19, [sp, #-16]!
   855c4:	2a0003f3 	mov	w19, w0
   855c8:	9400001e 	bl	85640 <_ZN13ruspiro_cache6dcache17invalidate_dcache17hc0f88a752d47d574E>
   855cc:	2a1303e0 	mov	w0, w19
   855d0:	97ffeb34 	bl	802a0 <__kernel_startup>
   855d4:	2a1303e0 	mov	w0, w19
   855d8:	94000006 	bl	855f0 <_ZN12ruspiro_boot17kickoff_next_core17h76c83402c8092a69E>
   855dc:	2a1303e0 	mov	w0, w19
   855e0:	97ffeb38 	bl	802c0 <__kernel_run>
   855e4:	d4200020 	brk	#0x1
	...

00000000000855f0 <_ZN12ruspiro_boot17kickoff_next_core17h76c83402c8092a69E>:
   855f0:	340000e0 	cbz	w0, 8560c <_ZN12ruspiro_boot17kickoff_next_core17h76c83402c8092a69E+0x1c>
   855f4:	7100081f 	cmp	w0, #0x2
   855f8:	540000e0 	b.eq	85614 <_ZN12ruspiro_boot17kickoff_next_core17h76c83402c8092a69E+0x24>  // b.none
   855fc:	7100041f 	cmp	w0, #0x1
   85600:	540001c1 	b.ne	85638 <_ZN12ruspiro_boot17kickoff_next_core17h76c83402c8092a69E+0x48>  // b.any
   85604:	52801d08 	mov	w8, #0xe8                  	// #232
   85608:	14000004 	b	85618 <_ZN12ruspiro_boot17kickoff_next_core17h76c83402c8092a69E+0x28>
   8560c:	52801c08 	mov	w8, #0xe0                  	// #224
   85610:	14000002 	b	85618 <_ZN12ruspiro_boot17kickoff_next_core17h76c83402c8092a69E+0x28>
   85614:	52801e08 	mov	w8, #0xf0                  	// #240
   85618:	f81f0ffe 	str	x30, [sp, #-16]!
   8561c:	52a00109 	mov	w9, #0x80000               	// #524288
   85620:	52801c00 	mov	w0, #0xe0                  	// #224
   85624:	52800201 	mov	w1, #0x10                  	// #16
   85628:	f9000109 	str	x9, [x8]
   8562c:	9400006d 	bl	857e0 <_ZN13ruspiro_cache6dcache18flush_dcache_range17hfaca19ddf714d732E>
   85630:	d503209f 	sev
   85634:	f84107fe 	ldr	x30, [sp], #16
   85638:	d65f03c0 	ret
   8563c:	00000000 	.inst	0x00000000 ; undefined

0000000000085640 <_ZN13ruspiro_cache6dcache17invalidate_dcache17hc0f88a752d47d574E>:
   85640:	d5033f9f 	dsb	sy
   85644:	d5390028 	mrs	x8, clidr_el1
   85648:	f268091f 	tst	x8, #0x7000000
   8564c:	54000b80 	b.eq	857bc <_ZN13ruspiro_cache6dcache17invalidate_dcache17hc0f88a752d47d574E+0x17c>  // b.none
   85650:	d5390028 	mrs	x8, clidr_el1
   85654:	f27f051f 	tst	x8, #0x6
   85658:	54000360 	b.eq	856c4 <_ZN13ruspiro_cache6dcache17invalidate_dcache17hc0f88a752d47d574E+0x84>  // b.none
   8565c:	d53a0008 	mrs	x8, csselr_el1
   85660:	927cf108 	and	x8, x8, #0xfffffffffffffff1
   85664:	d51a0008 	msr	csselr_el1, x8
   85668:	d5033fdf 	isb
   8566c:	d5390009 	mrs	x9, ccsidr_el1
   85670:	d539000a 	mrs	x10, ccsidr_el1
   85674:	d5390008 	mrs	x8, ccsidr_el1
   85678:	d34d6d08 	ubfx	x8, x8, #13, #15
   8567c:	b4000248 	cbz	x8, 856c4 <_ZN13ruspiro_cache6dcache17invalidate_dcache17hc0f88a752d47d574E+0x84>
   85680:	d343314b 	ubfx	x11, x10, #3, #10
   85684:	b400020b 	cbz	x11, 856c4 <_ZN13ruspiro_cache6dcache17invalidate_dcache17hc0f88a752d47d574E+0x84>
   85688:	92400929 	and	x9, x9, #0x7
   8568c:	dac0116a 	clz	x10, x11
   85690:	91001129 	add	x9, x9, #0x4
   85694:	9240154a 	and	x10, x10, #0x3f
   85698:	d100056b 	sub	x11, x11, #0x1
   8569c:	d1000508 	sub	x8, x8, #0x1
   856a0:	aa0b03ec 	mov	x12, x11
   856a4:	9ac9210d 	lsl	x13, x8, x9
   856a8:	9aca218e 	lsl	x14, x12, x10
   856ac:	d100058c 	sub	x12, x12, #0x1
   856b0:	b100059f 	cmn	x12, #0x1
   856b4:	aa0d01ce 	orr	x14, x14, x13
   856b8:	d508764e 	dc	isw, x14
   856bc:	54ffff61 	b.ne	856a8 <_ZN13ruspiro_cache6dcache17invalidate_dcache17hc0f88a752d47d574E+0x68>  // b.any
   856c0:	b5fffee8 	cbnz	x8, 8569c <_ZN13ruspiro_cache6dcache17invalidate_dcache17hc0f88a752d47d574E+0x5c>
   856c4:	d5390028 	mrs	x8, clidr_el1
   856c8:	f27c051f 	tst	x8, #0x30
   856cc:	540003a0 	b.eq	85740 <_ZN13ruspiro_cache6dcache17invalidate_dcache17hc0f88a752d47d574E+0x100>  // b.none
   856d0:	d53a0008 	mrs	x8, csselr_el1
   856d4:	927cf108 	and	x8, x8, #0xfffffffffffffff1
   856d8:	b27f0108 	orr	x8, x8, #0x2
   856dc:	d51a0008 	msr	csselr_el1, x8
   856e0:	d5033fdf 	isb
   856e4:	d5390009 	mrs	x9, ccsidr_el1
   856e8:	d539000a 	mrs	x10, ccsidr_el1
   856ec:	d5390008 	mrs	x8, ccsidr_el1
   856f0:	d34d6d08 	ubfx	x8, x8, #13, #15
   856f4:	b4000268 	cbz	x8, 85740 <_ZN13ruspiro_cache6dcache17invalidate_dcache17hc0f88a752d47d574E+0x100>
   856f8:	d343314b 	ubfx	x11, x10, #3, #10
   856fc:	b400022b 	cbz	x11, 85740 <_ZN13ruspiro_cache6dcache17invalidate_dcache17hc0f88a752d47d574E+0x100>
   85700:	92400929 	and	x9, x9, #0x7
   85704:	dac0116a 	clz	x10, x11
   85708:	91001129 	add	x9, x9, #0x4
   8570c:	9240154a 	and	x10, x10, #0x3f
   85710:	d100056b 	sub	x11, x11, #0x1
   85714:	d1000508 	sub	x8, x8, #0x1
   85718:	aa0b03ec 	mov	x12, x11
   8571c:	9ac9210d 	lsl	x13, x8, x9
   85720:	9aca218e 	lsl	x14, x12, x10
   85724:	d100058c 	sub	x12, x12, #0x1
   85728:	aa0e01ae 	orr	x14, x13, x14
   8572c:	b100059f 	cmn	x12, #0x1
   85730:	b27f01ce 	orr	x14, x14, #0x2
   85734:	d508764e 	dc	isw, x14
   85738:	54ffff41 	b.ne	85720 <_ZN13ruspiro_cache6dcache17invalidate_dcache17hc0f88a752d47d574E+0xe0>  // b.any
   8573c:	b5fffec8 	cbnz	x8, 85714 <_ZN13ruspiro_cache6dcache17invalidate_dcache17hc0f88a752d47d574E+0xd4>
   85740:	d5390028 	mrs	x8, clidr_el1
   85744:	f279051f 	tst	x8, #0x180
   85748:	540003a0 	b.eq	857bc <_ZN13ruspiro_cache6dcache17invalidate_dcache17hc0f88a752d47d574E+0x17c>  // b.none
   8574c:	d53a0008 	mrs	x8, csselr_el1
   85750:	927cf108 	and	x8, x8, #0xfffffffffffffff1
   85754:	b27e0108 	orr	x8, x8, #0x4
   85758:	d51a0008 	msr	csselr_el1, x8
   8575c:	d5033fdf 	isb
   85760:	d5390009 	mrs	x9, ccsidr_el1
   85764:	d539000a 	mrs	x10, ccsidr_el1
   85768:	d5390008 	mrs	x8, ccsidr_el1
   8576c:	d34d6d08 	ubfx	x8, x8, #13, #15
   85770:	b4000268 	cbz	x8, 857bc <_ZN13ruspiro_cache6dcache17invalidate_dcache17hc0f88a752d47d574E+0x17c>
   85774:	d343314b 	ubfx	x11, x10, #3, #10
   85778:	b400022b 	cbz	x11, 857bc <_ZN13ruspiro_cache6dcache17invalidate_dcache17hc0f88a752d47d574E+0x17c>
   8577c:	92400929 	and	x9, x9, #0x7
   85780:	dac0116a 	clz	x10, x11
   85784:	91001129 	add	x9, x9, #0x4
   85788:	9240154a 	and	x10, x10, #0x3f
   8578c:	d100056b 	sub	x11, x11, #0x1
   85790:	d1000508 	sub	x8, x8, #0x1
   85794:	aa0b03ec 	mov	x12, x11
   85798:	9ac9210d 	lsl	x13, x8, x9
   8579c:	9aca218e 	lsl	x14, x12, x10
   857a0:	d100058c 	sub	x12, x12, #0x1
   857a4:	aa0e01ae 	orr	x14, x13, x14
   857a8:	b100059f 	cmn	x12, #0x1
   857ac:	b27e01ce 	orr	x14, x14, #0x4
   857b0:	d508764e 	dc	isw, x14
   857b4:	54ffff41 	b.ne	8579c <_ZN13ruspiro_cache6dcache17invalidate_dcache17hc0f88a752d47d574E+0x15c>  // b.any
   857b8:	b5fffec8 	cbnz	x8, 85790 <_ZN13ruspiro_cache6dcache17invalidate_dcache17hc0f88a752d47d574E+0x150>
   857bc:	d53a0008 	mrs	x8, csselr_el1
   857c0:	927cf108 	and	x8, x8, #0xfffffffffffffff1
   857c4:	d51a0008 	msr	csselr_el1, x8
   857c8:	d5033f9f 	dsb	sy
   857cc:	d5033fdf 	isb
   857d0:	d65f03c0 	ret
	...

00000000000857e0 <_ZN13ruspiro_cache6dcache18flush_dcache_range17hfaca19ddf714d732E>:
   857e0:	d5033f9f 	dsb	sy
   857e4:	52800089 	mov	w9, #0x4                   	// #4
   857e8:	d53b0028 	mrs	x8, ctr_el0
   857ec:	53104d08 	ubfx	w8, w8, #16, #4
   857f0:	1ac82128 	lsl	w8, w9, w8
   857f4:	cb0803ea 	neg	x10, x8
   857f8:	8b000029 	add	x9, x1, x0
   857fc:	8a00014a 	and	x10, x10, x0
   85800:	eb09015f 	cmp	x10, x9
   85804:	540000a2 	b.cs	85818 <_ZN13ruspiro_cache6dcache18flush_dcache_range17hfaca19ddf714d732E+0x38>  // b.hs, b.nlast
   85808:	d50b7e2a 	dc	civac, x10
   8580c:	8b08014a 	add	x10, x10, x8
   85810:	eb09015f 	cmp	x10, x9
   85814:	54ffffa3 	b.cc	85808 <_ZN13ruspiro_cache6dcache18flush_dcache_range17hfaca19ddf714d732E+0x28>  // b.lo, b.ul, b.last
   85818:	d5033f9f 	dsb	sy
   8581c:	d65f03c0 	ret

Disassembly of section .rodata:

0000000000085820 <anon.aa99a32212951cb336354cf2f8afd4c4.0.llvm.16224240196047894230>:
   85820:	555c3a43 	.inst	0x555c3a43 ; undefined
   85824:	73726573 	.inst	0x73726573 ; undefined
   85828:	7073705c 	adr	x28, 16c633 <__heap_start+0xa3633>
   8582c:	2e5c6977 	.inst	0x2e5c6977 ; undefined
   85830:	67726163 	.inst	0x67726163 ; undefined
   85834:	65725c6f 	fnmla	z15.h, p7/m, z3.h, z18.h
   85838:	74736967 	.inst	0x74736967 ; undefined
   8583c:	735c7972 	.inst	0x735c7972 ; undefined
   85840:	675c6372 	.inst	0x675c6372 ; undefined
   85844:	75687469 	.inst	0x75687469 ; undefined
   85848:	6f632e62 	.inst	0x6f632e62 ; undefined
   8584c:	65312d6d 	.inst	0x65312d6d ; undefined
   85850:	32366363 	orr	w3, w27, #0xfffffc07
   85854:	62643939 	.inst	0x62643939 ; undefined
   85858:	38636539 	.inst	0x38636539 ; undefined
   8585c:	725c3332 	.inst	0x725c3332 ; undefined
   85860:	69707375 	ldpsw	x21, x28, [x27, #-128]
   85864:	632d6f72 	.inst	0x632d6f72 ; undefined
   85868:	6e6e6168 	rsubhn2	v8.8h, v11.4s, v14.4s
   8586c:	302d6c65 	adr	x5, e05f9 <__heap_start+0x175f9>
   85870:	312e312e 	adds	w14, w9, #0xb8c
   85874:	6372735c 	.inst	0x6372735c ; undefined
   85878:	6d706d5c 	ldp	d28, d27, [x10, #-256]
   8587c:	75715c63 	.inst	0x75715c63 ; undefined
   85880:	2e657565 	uabd	v5.4h, v11.4h, v5.4h
   85884:	 	.inst	0x61637372 ; undefined

0000000000085886 <anon.aa99a32212951cb336354cf2f8afd4c4.2.llvm.16224240196047894230>:
   85886:	6c6c6163 	ldnp	d3, d24, [x11, #-320]
   8588a:	60206465 	.inst	0x60206465 ; undefined
   8588e:	6974704f 	ldpsw	x15, x28, [x2, #-96]
   85892:	3a3a6e6f 	.inst	0x3a3a6e6f ; undefined
   85896:	72776e75 	.inst	0x72776e75 ; undefined
   8589a:	29287061 	stp	w1, w28, [x3, #-192]
   8589e:	6e6f2060 	usubl2	v0.4s, v3.8h, v15.8h
   858a2:	60206120 	.inst	0x60206120 ; undefined
   858a6:	656e6f4e 	fnmls	z14.h, p3/m, z26.h, z14.h
   858aa:	61762060 	.inst	0x61762060 ; undefined
   858ae:	0065756c 	.inst	0x0065756c ; undefined
   858b2:	00000000 	.inst	0x00000000 ; undefined
   858b6:	b4000000 	cbz	x0, 858b6 <anon.aa99a32212951cb336354cf2f8afd4c4.2.llvm.16224240196047894230+0x30>
   858ba:	00003f00 	.inst	0x00003f00 ; undefined
	...

00000000000858c0 <anon.a23b694d1dc451c0e6c510e31520f481.9.llvm.10647643565819495523>:
   858c0:	40000040 	.inst	0x40000040 ; undefined
   858c4:	00000000 	.inst	0x00000000 ; undefined
   858c8:	79622820 	ldrh	w0, [x1, #4372]
   858cc:	20736574 	.inst	0x20736574 ; undefined

00000000000858d0 <anon.a23b694d1dc451c0e6c510e31520f481.13.llvm.10647643565819495523>:
   858d0:	3f00b204 	.inst	0x3f00b204 ; undefined
   858d4:	00000000 	.inst	0x00000000 ; undefined

00000000000858d8 <anon.a23b694d1dc451c0e6c510e31520f481.14.llvm.10647643565819495523>:
   858d8:	3f00b208 	.inst	0x3f00b208 ; undefined
   858dc:	00000000 	.inst	0x00000000 ; undefined
   858e0:	5f727365 	sqdmlsl	s5, h27, v2.h[3]
   858e4:	203a6365 	.inst	0x203a6365 ; undefined
   858e8:	3f00b40c 	.inst	0x3f00b40c ; undefined
   858ec:	00000000 	.inst	0x00000000 ; undefined

00000000000858f0 <anon.a23b694d1dc451c0e6c510e31520f481.16.llvm.10647643565819495523>:
   858f0:	40000060 	.inst	0x40000060 ; undefined
   858f4:	00000000 	.inst	0x00000000 ; undefined

00000000000858f8 <anon.a23b694d1dc451c0e6c510e31520f481.10.llvm.10647643565819495523>:
   858f8:	3f00b218 	.inst	0x3f00b218 ; undefined
   858fc:	00000000 	.inst	0x00000000 ; undefined

0000000000085900 <anon.a23b694d1dc451c0e6c510e31520f481.5.llvm.10647643565819495523>:
   85900:	40000054 	.inst	0x40000054 ; undefined
   85904:	00000000 	.inst	0x00000000 ; undefined

0000000000085908 <anon.a23b694d1dc451c0e6c510e31520f481.15.llvm.10647643565819495523>:
   85908:	3f00b200 	.inst	0x3f00b200 ; undefined
	...
   85914:	00000020 	.inst	0x00000020 ; undefined

0000000000085918 <anon.a23b694d1dc451c0e6c510e31520f481.17.llvm.10647643565819495523>:
   85918:	40000064 	.inst	0x40000064 ; undefined
   8591c:	00000000 	.inst	0x00000000 ; undefined
   85920:	3f215000 	.inst	0x3f215000 ; undefined
   85924:	00000000 	.inst	0x00000000 ; undefined

0000000000085928 <anon.a23b694d1dc451c0e6c510e31520f481.19.llvm.10647643565819495523>:
   85928:	4000006c 	.inst	0x4000006c ; undefined
   8592c:	00000000 	.inst	0x00000000 ; undefined

0000000000085930 <anon.a23b694d1dc451c0e6c510e31520f481.7.llvm.10647643565819495523>:
   85930:	4000005c 	.inst	0x4000005c ; undefined
   85934:	00000000 	.inst	0x00000000 ; undefined

0000000000085938 <anon.a23b694d1dc451c0e6c510e31520f481.18.llvm.10647643565819495523>:
   85938:	40000068 	.inst	0x40000068 ; undefined
   8593c:	00000000 	.inst	0x00000000 ; undefined
   85940:	3f00b408 	.inst	0x3f00b408 ; undefined
   85944:	00000000 	.inst	0x00000000 ; undefined

0000000000085948 <anon.a23b694d1dc451c0e6c510e31520f481.11.llvm.10647643565819495523>:
   85948:	3f00b214 	.inst	0x3f00b214 ; undefined
   8594c:	00000000 	.inst	0x00000000 ; undefined

0000000000085950 <anon.a23b694d1dc451c0e6c510e31520f481.4.llvm.10647643565819495523>:
   85950:	40000050 	.inst	0x40000050 ; undefined
   85954:	00000000 	.inst	0x00000000 ; undefined
   85958:	6461202c 	fmul	z12.h, z1.h, z1.h[4]
   8595c:	203a7264 	.inst	0x203a7264 ; undefined

0000000000085960 <anon.a23b694d1dc451c0e6c510e31520f481.6.llvm.10647643565819495523>:
   85960:	40000058 	.inst	0x40000058 ; undefined
   85964:	00000000 	.inst	0x00000000 ; undefined
   85968:	7073202c 	adr	x12, 16bd6f <__heap_start+0xa2d6f>
   8596c:	203a7273 	.inst	0x203a7273 ; undefined

0000000000085970 <anon.a23b694d1dc451c0e6c510e31520f481.8.llvm.10647643565819495523>:
   85970:	40000034 	.inst	0x40000034 ; undefined
   85974:	00000000 	.inst	0x00000000 ; undefined

0000000000085978 <anon.a23b694d1dc451c0e6c510e31520f481.12.llvm.10647643565819495523>:
   85978:	3f00b210 	.inst	0x3f00b210 ; undefined
   8597c:	00000000 	.inst	0x00000000 ; undefined
   85980:	00000019 	.inst	0x00000019 ; undefined
   85984:	00000012 	.inst	0x00000012 ; undefined
   85988:	00000014 	.inst	0x00000014 ; undefined
   8598c:	00000015 	.inst	0x00000015 ; undefined
   85990:	68772029 	.inst	0x68772029 ; undefined
   85994:	73206e65 	.inst	0x73206e65 ; undefined
   85998:	6963696c 	ldpsw	x12, x26, [x11, #-232]
   8599c:	6020676e 	.inst	0x6020676e ; undefined
   859a0:	494e4150 	.inst	0x494e4150 ; undefined
   859a4:	6f732043 	umlal2	v3.4s, v2.8h, v3.h[3]
   859a8:	6877656d 	.inst	0x6877656d ; undefined
   859ac:	21657265 	.inst	0x21657265 ; undefined
   859b0:	65726c61 	fnmls	z1.h, p3/m, z3.h, z18.h
   859b4:	20796461 	.inst	0x20796461 ; undefined
   859b8:	72726f62 	.inst	0x72726f62 ; undefined
   859bc:	6465776f 	.inst	0x6465776f ; undefined
   859c0:	676e6172 	.inst	0x676e6172 ; undefined
   859c4:	6e652065 	usubl2	v5.4s, v3.8h, v5.8h
   859c8:	6e692064 	usubl2	v4.4s, v3.8h, v9.8h
   859cc:	20786564 	.inst	0x20786564 ; undefined
   859d0:	65726c61 	fnmls	z1.h, p3/m, z3.h, z18.h
   859d4:	20796461 	.inst	0x20796461 ; undefined
   859d8:	6174756d 	.inst	0x6174756d ; undefined
   859dc:	20796c62 	.inst	0x20796c62 ; undefined
   859e0:	72726f62 	.inst	0x72726f62 ; undefined
   859e4:	6465776f 	.inst	0x6465776f ; undefined
   859e8:	20585541 	.inst	0x20585541 ; undefined
   859ec:	65746e69 	fnmls	z9.h, p3/m, z19.h, z20.h
   859f0:	70757272 	adr	x18, 17083f <__heap_start+0xa783f>
   859f4:	72207374 	ands	w20, w27, #0x1fffffff
   859f8:	69757165 	ldpsw	x5, x28, [x11, #-88]
   859fc:	61206572 	.inst	0x61206572 ; undefined
   85a00:	76697463 	.inst	0x76697463 ; undefined
   85a04:	6f697461 	uqshl	v1.2d, v3.2d, #41
   85a08:	6977206e 	ldpsw	x14, x8, [x3, #-72]
   85a0c:	27206874 	.inst	0x27206874 ; undefined
   85a10:	69746361 	ldpsw	x1, x24, [x27, #-96]
   85a14:	65746176 	fnmls	z22.h, p0/m, z11.h, z20.h
   85a18:	7875615f 	stumaxlh	w21, [x10]
   85a1c:	5c3a4327 	ldr	d7, fa280 <__heap_start+0x31280>
   85a20:	72657355 	.inst	0x72657355 ; undefined
   85a24:	73705c73 	.inst	0x73705c73 ; undefined
   85a28:	5c697770 	ldr	d16, 158914 <__heap_start+0x8f914>
   85a2c:	7261632e 	.inst	0x7261632e ; undefined
   85a30:	725c6f67 	.inst	0x725c6f67 ; undefined
   85a34:	73696765 	.inst	0x73696765 ; undefined
   85a38:	5c797274 	ldr	d20, 178884 <__heap_start+0xaf884>
   85a3c:	5c637273 	ldr	d19, 14c888 <__heap_start+0x83888>
   85a40:	68746967 	.inst	0x68746967 ; undefined
   85a44:	632e6275 	.inst	0x632e6275 ; undefined
   85a48:	312d6d6f 	adds	w15, w11, #0xb5b
   85a4c:	36636365 	tbz	w5, #12, 8c6b8 <__stack_end__+0x4078>
   85a50:	64393932 	.inst	0x64393932 ; undefined
   85a54:	63653962 	.inst	0x63653962 ; undefined
   85a58:	5c333238 	ldr	d24, ec09c <__heap_start+0x2309c>
   85a5c:	70737572 	adr	x18, 16c90b <__heap_start+0xa390b>
   85a60:	2d6f7269 	ldp	s9, s28, [x19, #-136]
   85a64:	65746e69 	fnmls	z9.h, p3/m, z19.h, z20.h
   85a68:	70757272 	adr	x18, 1708b7 <__heap_start+0xa78b7>
   85a6c:	2e302d74 	uqsub	v20.8b, v11.8b, v16.8b
   85a70:	5c332e34 	ldr	d20, ec034 <__heap_start+0x23034>
   85a74:	5c637273 	ldr	d19, 14c8c0 <__heap_start+0x838c0>
   85a78:	2e62696c 	.inst	0x2e62696c ; undefined
   85a7c:	04007372 	mls	z18.b, p4/m, z27.b, z0.b
   85a80:	05000c08 	orr	z8.h, z8.h, #0x8000
   85a84:	15120f0a 	b	45096ac <__heap_start+0x44406ac>
   85a88:	20201b18 	.inst	0x20201b18 ; undefined
   85a8c:	6c612120 	ldnp	d0, d8, [x9, #-496]
   85a90:	64616572 	.inst	0x64616572 ; undefined
   85a94:	756d2079 	.inst	0x756d2079 ; undefined
   85a98:	6c626174 	ldnp	d20, d24, [x11, #-480]
   85a9c:	6f622079 	umlal2	v25.4s, v3.8h, v2.h[2]
   85aa0:	776f7272 	.inst	0x776f7272 ; undefined
   85aa4:	 	.inst	0x3a436465 ; undefined

0000000000085aa6 <anon.a628b4cb11bc7df472da5a29226e09a7.4.llvm.4895383513194605257>:
   85aa6:	555c3a43 	.inst	0x555c3a43 ; undefined
   85aaa:	73726573 	.inst	0x73726573 ; undefined
   85aae:	7073705c 	adr	x28, 16c8b9 <__heap_start+0xa38b9>
   85ab2:	2e5c6977 	.inst	0x2e5c6977 ; undefined
   85ab6:	67726163 	.inst	0x67726163 ; undefined
   85aba:	65725c6f 	fnmla	z15.h, p7/m, z3.h, z18.h
   85abe:	74736967 	.inst	0x74736967 ; undefined
   85ac2:	735c7972 	.inst	0x735c7972 ; undefined
   85ac6:	675c6372 	.inst	0x675c6372 ; undefined
   85aca:	75687469 	.inst	0x75687469 ; undefined
   85ace:	6f632e62 	.inst	0x6f632e62 ; undefined
   85ad2:	65312d6d 	.inst	0x65312d6d ; undefined
   85ad6:	32366363 	orr	w3, w27, #0xfffffc07
   85ada:	62643939 	.inst	0x62643939 ; undefined
   85ade:	38636539 	.inst	0x38636539 ; undefined
   85ae2:	725c3332 	.inst	0x725c3332 ; undefined
   85ae6:	69707375 	ldpsw	x21, x28, [x27, #-128]
   85aea:	692d6f72 	stgp	x18, x27, [x27, #-608]
   85aee:	7265746e 	.inst	0x7265746e ; undefined
   85af2:	74707572 	.inst	0x74707572 ; undefined
   85af6:	342e302d 	cbz	w13, e20fa <__heap_start+0x190fa>
   85afa:	735c332e 	.inst	0x735c332e ; undefined
   85afe:	615c6372 	.inst	0x615c6372 ; undefined
   85b02:	61687875 	.inst	0x61687875 ; undefined
   85b06:	656c646e 	fnmls	z14.h, p1/m, z3.h, z12.h
   85b0a:	73722e72 	.inst	0x73722e72 ; undefined

0000000000085b0e <anon.3fff2b7ea07e7690419720c412031537.0.llvm.11380368779637635400>:
   85b0e:	555c3a43 	.inst	0x555c3a43 ; undefined
   85b12:	73726573 	.inst	0x73726573 ; undefined
   85b16:	7073705c 	adr	x28, 16c921 <__heap_start+0xa3921>
   85b1a:	2e5c6977 	.inst	0x2e5c6977 ; undefined
   85b1e:	67726163 	.inst	0x67726163 ; undefined
   85b22:	65725c6f 	fnmla	z15.h, p7/m, z3.h, z18.h
   85b26:	74736967 	.inst	0x74736967 ; undefined
   85b2a:	735c7972 	.inst	0x735c7972 ; undefined
   85b2e:	675c6372 	.inst	0x675c6372 ; undefined
   85b32:	75687469 	.inst	0x75687469 ; undefined
   85b36:	6f632e62 	.inst	0x6f632e62 ; undefined
   85b3a:	65312d6d 	.inst	0x65312d6d ; undefined
   85b3e:	32366363 	orr	w3, w27, #0xfffffc07
   85b42:	62643939 	.inst	0x62643939 ; undefined
   85b46:	38636539 	.inst	0x38636539 ; undefined
   85b4a:	725c3332 	.inst	0x725c3332 ; undefined
   85b4e:	69707375 	ldpsw	x21, x28, [x27, #-128]
   85b52:	632d6f72 	.inst	0x632d6f72 ; undefined
   85b56:	6e6e6168 	rsubhn2	v8.8h, v11.4s, v14.4s
   85b5a:	302d6c65 	adr	x5, e08e7 <__heap_start+0x178e7>
   85b5e:	312e312e 	adds	w14, w9, #0xb8c
   85b62:	6372735c 	.inst	0x6372735c ; undefined
   85b66:	6d706d5c 	ldp	d28, d27, [x10, #-256]
   85b6a:	75715c63 	.inst	0x75715c63 ; undefined
   85b6e:	2e657565 	uabd	v5.4h, v11.4h, v5.4h
   85b72:	 	.inst	0x61637372 ; undefined

0000000000085b74 <anon.3fff2b7ea07e7690419720c412031537.2.llvm.11380368779637635400>:
   85b74:	6c6c6163 	ldnp	d3, d24, [x11, #-320]
   85b78:	60206465 	.inst	0x60206465 ; undefined
   85b7c:	6974704f 	ldpsw	x15, x28, [x2, #-96]
   85b80:	3a3a6e6f 	.inst	0x3a3a6e6f ; undefined
   85b84:	72776e75 	.inst	0x72776e75 ; undefined
   85b88:	29287061 	stp	w1, w28, [x3, #-192]
   85b8c:	6e6f2060 	usubl2	v0.4s, v3.8h, v15.8h
   85b90:	60206120 	.inst	0x60206120 ; undefined
   85b94:	656e6f4e 	fnmls	z14.h, p3/m, z26.h, z14.h
   85b98:	61762060 	.inst	0x61762060 ; undefined
   85b9c:	 	.inst	0x4365756c ; undefined

0000000000085b9f <anon.a832095947016363f6bc3bcfd8d398ed.0.llvm.11995692481347540951>:
   85b9f:	555c3a43 	.inst	0x555c3a43 ; undefined
   85ba3:	73726573 	.inst	0x73726573 ; undefined
   85ba7:	7073705c 	adr	x28, 16c9b2 <__heap_start+0xa39b2>
   85bab:	2e5c6977 	.inst	0x2e5c6977 ; undefined
   85baf:	74737572 	.inst	0x74737572 ; undefined
   85bb3:	745c7075 	.inst	0x745c7075 ; undefined
   85bb7:	636c6f6f 	.inst	0x636c6f6f ; undefined
   85bbb:	6e696168 	rsubhn2	v8.8h, v11.4s, v9.4s
   85bbf:	696e5c73 	ldpsw	x19, x23, [x3, #-144]
   85bc3:	6c746867 	ldnp	d7, d26, [x3, #-192]
   85bc7:	38782d79 	.inst	0x38782d79 ; undefined
   85bcb:	34365f36 	cbz	w22, f27af <__heap_start+0x297af>
   85bcf:	2d63702d 	ldp	s13, s28, [x1, #-232]
   85bd3:	646e6977 	.inst	0x646e6977 ; undefined
   85bd7:	2d73776f 	ldp	s15, s29, [x27, #-104]
   85bdb:	6376736d 	.inst	0x6376736d ; undefined
   85bdf:	62696c5c 	.inst	0x62696c5c ; undefined
   85be3:	7375725c 	.inst	0x7375725c ; undefined
   85be7:	62696c74 	.inst	0x62696c74 ; undefined
   85beb:	6372735c 	.inst	0x6372735c ; undefined
   85bef:	7375725c 	.inst	0x7375725c ; undefined
   85bf3:	696c5c74 	ldpsw	x20, x23, [x3, #-160]
   85bf7:	72617262 	.inst	0x72617262 ; undefined
   85bfb:	6f635c79 	.inst	0x6f635c79 ; undefined
   85bff:	735c6572 	.inst	0x735c6572 ; undefined
   85c03:	735c6372 	.inst	0x735c6372 ; undefined
   85c07:	5c636e79 	ldr	d25, 14c9d3 <__heap_start+0x839d3>
   85c0b:	6d6f7461 	ldp	d1, d29, [x3, #-272]
   85c0f:	722e6369 	ands	w9, w27, #0xfffc07ff
   85c13:	 	fnmls	z19.h, p5/m, z3.h, z8.h

0000000000085c14 <anon.a832095947016363f6bc3bcfd8d398ed.1.llvm.11995692481347540951>:
   85c14:	72656874 	.inst	0x72656874 ; undefined
   85c18:	73692065 	.inst	0x73692065 ; undefined
   85c1c:	206f6e20 	.inst	0x206f6e20 ; undefined
   85c20:	68637573 	.inst	0x68637573 ; undefined
   85c24:	69687420 	ldpsw	x0, x29, [x1, #-192]
   85c28:	6120676e 	.inst	0x6120676e ; undefined
   85c2c:	20612073 	.inst	0x20612073 ; undefined
   85c30:	656c6572 	fnmls	z18.h, p1/m, z11.h, z12.h
   85c34:	20657361 	.inst	0x20657361 ; undefined
   85c38:	6c696166 	ldnp	d6, d24, [x11, #-368]
   85c3c:	20657275 	.inst	0x20657275 ; undefined
   85c40:	6564726f 	fnmls	z15.h, p4/m, z19.h, z4.h
   85c44:	676e6972 	.inst	0x676e6972 ; undefined

0000000000085c48 <anon.a832095947016363f6bc3bcfd8d398ed.5.llvm.11995692481347540951>:
   85c48:	555c3a43 	.inst	0x555c3a43 ; undefined
   85c4c:	73726573 	.inst	0x73726573 ; undefined
   85c50:	7073705c 	adr	x28, 16ca5b <__heap_start+0xa3a5b>
   85c54:	2e5c6977 	.inst	0x2e5c6977 ; undefined
   85c58:	67726163 	.inst	0x67726163 ; undefined
   85c5c:	65725c6f 	fnmla	z15.h, p7/m, z3.h, z18.h
   85c60:	74736967 	.inst	0x74736967 ; undefined
   85c64:	735c7972 	.inst	0x735c7972 ; undefined
   85c68:	675c6372 	.inst	0x675c6372 ; undefined
   85c6c:	75687469 	.inst	0x75687469 ; undefined
   85c70:	6f632e62 	.inst	0x6f632e62 ; undefined
   85c74:	65312d6d 	.inst	0x65312d6d ; undefined
   85c78:	32366363 	orr	w3, w27, #0xfffffc07
   85c7c:	62643939 	.inst	0x62643939 ; undefined
   85c80:	38636539 	.inst	0x38636539 ; undefined
   85c84:	725c3332 	.inst	0x725c3332 ; undefined
   85c88:	69707375 	ldpsw	x21, x28, [x27, #-128]
   85c8c:	612d6f72 	.inst	0x612d6f72 ; undefined
   85c90:	636f6c6c 	.inst	0x636f6c6c ; undefined
   85c94:	726f7461 	.inst	0x726f7461 ; undefined
   85c98:	342e302d 	cbz	w13, e229c <__heap_start+0x1929c>
   85c9c:	735c352e 	.inst	0x735c352e ; undefined
   85ca0:	6d5c6372 	ldp	d18, d24, [x27, #448]
   85ca4:	726f6d65 	.inst	0x726f6d65 ; undefined
   85ca8:	73722e79 	.inst	0x73722e79 ; undefined

0000000000085cac <anon.a832095947016363f6bc3bcfd8d398ed.9.llvm.11995692481347540951>:
   85cac:	65737361 	fnmls	z1.h, p4/m, z27.h, z19.h
   85cb0:	6f697472 	uqshl	v18.2d, v3.2d, #41
   85cb4:	6166206e 	.inst	0x6166206e ; undefined
   85cb8:	64656c69 	.inst	0x64656c69 ; undefined
   85cbc:	6564203a 	fmls	z26.h, p0/m, z1.h, z4.h
   85cc0:	69726373 	ldpsw	x19, x24, [x27, #-112]
   85cc4:	726f7470 	.inst	0x726f7470 ; undefined
   85cc8:	67616d2e 	.inst	0x67616d2e ; undefined
   85ccc:	3d206369 	str	b9, [x27, #2072]
   85cd0:	4d4d203d 	.inst	0x4d4d203d ; undefined
   85cd4:	47414d5f 	.inst	0x47414d5f ; undefined
   85cd8:	 	ccmn	w26, w3, #0x9, mi  // mi = first

0000000000085cda <anon.788176469029eed6706ecead79b9694d.0.llvm.8937437104277805671>:
   85cda:	555c3a43 	.inst	0x555c3a43 ; undefined
   85cde:	73726573 	.inst	0x73726573 ; undefined
   85ce2:	7073705c 	adr	x28, 16caed <__heap_start+0xa3aed>
   85ce6:	2e5c6977 	.inst	0x2e5c6977 ; undefined
   85cea:	74737572 	.inst	0x74737572 ; undefined
   85cee:	745c7075 	.inst	0x745c7075 ; undefined
   85cf2:	636c6f6f 	.inst	0x636c6f6f ; undefined
   85cf6:	6e696168 	rsubhn2	v8.8h, v11.4s, v9.4s
   85cfa:	696e5c73 	ldpsw	x19, x23, [x3, #-144]
   85cfe:	6c746867 	ldnp	d7, d26, [x3, #-192]
   85d02:	38782d79 	.inst	0x38782d79 ; undefined
   85d06:	34365f36 	cbz	w22, f28ea <__heap_start+0x298ea>
   85d0a:	2d63702d 	ldp	s13, s28, [x1, #-232]
   85d0e:	646e6977 	.inst	0x646e6977 ; undefined
   85d12:	2d73776f 	ldp	s15, s29, [x27, #-104]
   85d16:	6376736d 	.inst	0x6376736d ; undefined
   85d1a:	62696c5c 	.inst	0x62696c5c ; undefined
   85d1e:	7375725c 	.inst	0x7375725c ; undefined
   85d22:	62696c74 	.inst	0x62696c74 ; undefined
   85d26:	6372735c 	.inst	0x6372735c ; undefined
   85d2a:	7375725c 	.inst	0x7375725c ; undefined
   85d2e:	696c5c74 	ldpsw	x20, x23, [x3, #-160]
   85d32:	72617262 	.inst	0x72617262 ; undefined
   85d36:	6f635c79 	.inst	0x6f635c79 ; undefined
   85d3a:	735c6572 	.inst	0x735c6572 ; undefined
   85d3e:	665c6372 	.inst	0x665c6372 ; undefined
   85d42:	6e5c746d 	.inst	0x6e5c746d ; undefined
   85d46:	722e6d75 	ands	w21, w11, #0xfffc3fff
   85d4a:	 	adr	x19, 176357 <__heap_start+0xad357>

0000000000085d4b <anon.788176469029eed6706ecead79b9694d.2.llvm.8937437104277805671>:
   85d4b:	62307830 	.inst	0x62307830 ; undefined

0000000000085d4f <anon.788176469029eed6706ecead79b9694d.5.llvm.8937437104277805671>:
   85d4f:	31303030 	adds	w16, w1, #0xc0c
   85d53:	33303230 	.inst	0x33303230 ; undefined
   85d57:	35303430 	cbnz	w16, e63db <__heap_start+0x1d3db>
   85d5b:	37303630 	tbnz	w16, #6, 8641f <anon.da70acf48479ae6767f568a05ea2e9a7.22.llvm.2339018429671269780+0x105>
   85d5f:	39303830 	strb	w16, [x1, #3086]
   85d63:	31313031 	adds	w17, w1, #0xc4c
   85d67:	33313231 	.inst	0x33313231 ; undefined
   85d6b:	35313431 	cbnz	w17, e83ef <__heap_start+0x1f3ef>
   85d6f:	37313631 	tbnz	w17, #6, 88433 <_ZN3log6LOGGER17h560bca14e6f52766E+0x31b>
   85d73:	39313831 	strb	w17, [x1, #3150]
   85d77:	31323032 	adds	w18, w1, #0xc8c
   85d7b:	33323232 	.inst	0x33323232 ; undefined
   85d7f:	35323432 	cbnz	w18, ea403 <__heap_start+0x21403>
   85d83:	37323632 	tbnz	w18, #6, 8a447 <__stack_end__+0x1e07>
   85d87:	39323832 	strb	w18, [x1, #3214]
   85d8b:	31333033 	adds	w19, w1, #0xccc
   85d8f:	33333233 	.inst	0x33333233 ; undefined
   85d93:	35333433 	cbnz	w19, ec417 <__heap_start+0x23417>
   85d97:	37333633 	tbnz	w19, #6, 8c45b <__stack_end__+0x3e1b>
   85d9b:	39333833 	strb	w19, [x1, #3278]
   85d9f:	31343034 	adds	w20, w1, #0xd0c
   85da3:	33343234 	.inst	0x33343234 ; undefined
   85da7:	35343434 	cbnz	w20, ee42b <__heap_start+0x2542b>
   85dab:	37343634 	tbnz	w20, #6, 7e46f <EXC_LOWEREL32_SPX_SErr+0x7e43b>
   85daf:	39343834 	strb	w20, [x1, #3342]
   85db3:	31353035 	adds	w21, w1, #0xd4c
   85db7:	33353235 	.inst	0x33353235 ; undefined
   85dbb:	35353435 	cbnz	w21, f043f <__heap_start+0x2743f>
   85dbf:	37353635 	tbnz	w21, #6, 80483 <_ZN17ruspiro_interrupt8activate17h2db9568096015147E+0xc3>
   85dc3:	39353835 	strb	w21, [x1, #3406]
   85dc7:	31363036 	adds	w22, w1, #0xd8c
   85dcb:	33363236 	.inst	0x33363236 ; undefined
   85dcf:	35363436 	cbnz	w22, f2453 <__heap_start+0x29453>
   85dd3:	37363636 	tbnz	w22, #6, 82497 <_ZN3log17__private_api_log17haa499543e16634a1E+0x7>
   85dd7:	39363836 	strb	w22, [x1, #3470]
   85ddb:	31373037 	adds	w23, w1, #0xdcc
   85ddf:	33373237 	.inst	0x33373237 ; undefined
   85de3:	35373437 	cbnz	w23, f4467 <__heap_start+0x2b467>
   85de7:	37373637 	tbnz	w23, #6, 844ab <__exception_trampoline+0x4ab>
   85deb:	39373837 	strb	w23, [x1, #3534]
   85def:	31383038 	adds	w24, w1, #0xe0c
   85df3:	33383238 	.inst	0x33383238 ; undefined
   85df7:	35383438 	cbnz	w24, f647b <__heap_start+0x2d47b>
   85dfb:	37383638 	tbnz	w24, #7, 864bf <anon.da70acf48479ae6767f568a05ea2e9a7.23.llvm.2339018429671269780+0x83>
   85dff:	39383838 	strb	w24, [x1, #3598]
   85e03:	31393039 	adds	w25, w1, #0xe4c
   85e07:	33393239 	.inst	0x33393239 ; undefined
   85e0b:	35393439 	cbnz	w25, f848f <__heap_start+0x2f48f>
   85e0f:	37393639 	tbnz	w25, #7, 884d3 <_ZN3log6LOGGER17h560bca14e6f52766E+0x3bb>
   85e13:	39393839 	strb	w25, [x1, #3662]
   85e17:	676e6172 	.inst	0x676e6172 ; undefined
   85e1b:	74732065 	.inst	0x74732065 ; undefined
   85e1f:	20747261 	.inst	0x20747261 ; undefined
   85e23:	65646e69 	fnmls	z9.h, p3/m, z19.h, z4.h
   85e27:	6f202078 	.inst	0x6f202078 ; undefined
   85e2b:	6f207475 	uqshl	v21.4s, v3.4s, #0
   85e2f:	61722066 	.inst	0x61722066 ; undefined
   85e33:	2065676e 	.inst	0x2065676e ; undefined
   85e37:	20726f66 	.inst	0x20726f66 ; undefined
   85e3b:	63696c73 	.inst	0x63696c73 ; undefined
   85e3f:	666f2065 	.inst	0x666f2065 ; undefined
   85e43:	6e656c20 	umin	v0.8h, v1.8h, v5.8h
   85e47:	20687467 	.inst	0x20687467 ; undefined
   85e4b:	63696c73 	.inst	0x63696c73 ; undefined
   85e4f:	6e692065 	usubl2	v5.4s, v3.8h, v9.8h
   85e53:	20786564 	.inst	0x20786564 ; undefined
   85e57:	72617473 	.inst	0x72617473 ; undefined
   85e5b:	61207374 	.inst	0x61207374 ; undefined
   85e5f:	62202074 	.inst	0x62202074 ; undefined
   85e63:	65207475 	.inst	0x65207475 ; undefined
   85e67:	2073646e 	.inst	0x2073646e ; undefined
   85e6b:	 	.inst	0x43207461 ; undefined

0000000000085e6e <anon.b2eb45f66a0b759930b184b68fba7a80.55.llvm.111400220230659385>:
   85e6e:	555c3a43 	.inst	0x555c3a43 ; undefined
   85e72:	73726573 	.inst	0x73726573 ; undefined
   85e76:	7073705c 	adr	x28, 16cc81 <__heap_start+0xa3c81>
   85e7a:	2e5c6977 	.inst	0x2e5c6977 ; undefined
   85e7e:	74737572 	.inst	0x74737572 ; undefined
   85e82:	745c7075 	.inst	0x745c7075 ; undefined
   85e86:	636c6f6f 	.inst	0x636c6f6f ; undefined
   85e8a:	6e696168 	rsubhn2	v8.8h, v11.4s, v9.4s
   85e8e:	696e5c73 	ldpsw	x19, x23, [x3, #-144]
   85e92:	6c746867 	ldnp	d7, d26, [x3, #-192]
   85e96:	38782d79 	.inst	0x38782d79 ; undefined
   85e9a:	34365f36 	cbz	w22, f2a7e <__heap_start+0x29a7e>
   85e9e:	2d63702d 	ldp	s13, s28, [x1, #-232]
   85ea2:	646e6977 	.inst	0x646e6977 ; undefined
   85ea6:	2d73776f 	ldp	s15, s29, [x27, #-104]
   85eaa:	6376736d 	.inst	0x6376736d ; undefined
   85eae:	62696c5c 	.inst	0x62696c5c ; undefined
   85eb2:	7375725c 	.inst	0x7375725c ; undefined
   85eb6:	62696c74 	.inst	0x62696c74 ; undefined
   85eba:	6372735c 	.inst	0x6372735c ; undefined
   85ebe:	7375725c 	.inst	0x7375725c ; undefined
   85ec2:	696c5c74 	ldpsw	x20, x23, [x3, #-160]
   85ec6:	72617262 	.inst	0x72617262 ; undefined
   85eca:	6f635c79 	.inst	0x6f635c79 ; undefined
   85ece:	735c6572 	.inst	0x735c6572 ; undefined
   85ed2:	755c6372 	.inst	0x755c6372 ; undefined
   85ed6:	6f63696e 	umlsl2	v14.4s, v11.8h, v3.h[6]
   85eda:	755c6564 	.inst	0x755c6564 ; undefined
   85ede:	6f63696e 	umlsl2	v14.4s, v11.8h, v3.h[6]
   85ee2:	645f6564 	fcmla	z4.h, p1/m, z11.h, z31.h, #270
   85ee6:	2e617461 	uabd	v1.4h, v3.4h, v1.4h
   85eea:	 	.inst	0x03007372 ; undefined

0000000000085eec <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h3f27433f34b5c313E.llvm.111400220230659385>:
   85eec:	00000300 	.inst	0x00000300 ; undefined
   85ef0:	00200483 	.inst	0x00200483 ; NYI
   85ef4:	00600591 	.inst	0x00600591 ; undefined
   85ef8:	00a0135d 	.inst	0x00a0135d ; undefined
   85efc:	1ea01712 	.inst	0x1ea01712 ; undefined
   85f00:	1ee0200c 	.inst	0x1ee0200c ; undefined
   85f04:	2b202cef 	adds	w15, w7, w0, uxth #3
   85f08:	2ba0302a 	.inst	0x2ba0302a ; undefined
   85f0c:	2c60a66f 	ldnp	s15, s9, [x19, #-252]
   85f10:	2ce0a802 	ldp	s2, s10, [x0], #-252
   85f14:	2de0fb1e 	ldp	s30, s30, [x24, #-252]!
   85f18:	35a0fe00 	cbnz	w0, fffffffffffc7ed8 <__heap_end+0xffffffffc1fc7ed8>
   85f1c:	35e0ff9e 	cbnz	w30, 47f0c <EXC_LOWEREL32_SPX_SErr+0x47ed8>
   85f20:	366101fd 	tbz	w29, #12, 87f5c <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0xd4>
   85f24:	36a10a01 	tbz	w1, #20, 88064 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x1dc>
   85f28:	37610d24 	tbnz	w4, #12, 880cc <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385+0x244>
   85f2c:	38e10eab 	.inst	0x38e10eab ; undefined
   85f30:	3921182f 	strb	w15, [x1, #2118]
   85f34:	46611c30 	.inst	0x46611c30 ; undefined
   85f38:	4aa11ef3 	eon	w19, w23, w1, asr #7
   85f3c:	4e616af0 	fcvtn2	v16.4s, v23.2d
   85f40:	4ea16f4f 	smin	v15.4s, v26.4s, v1.4s
   85f44:	4f21bc9d 	.inst	0x4f21bc9d ; undefined
   85f48:	4fe1d165 	.inst	0x4fe1d165 ; undefined
   85f4c:	5021da00 	adr	x0, c9a8e <__heap_start+0xa8e>
   85f50:	51e1e000 	.inst	0x51e1e000 ; undefined
   85f54:	5361e130 	.inst	0x5361e130 ; undefined
   85f58:	54a1e2ec 	b.gt	fffffffffffc9bb4 <__heap_end+0xffffffffc1fc9bb4>
   85f5c:	54e1e8d0 	.inst	0x54e1e8d0 ; undefined
   85f60:	552e0020 	.inst	0x552e0020 ; undefined
   85f64:	55bf01f0 	.inst	0x55bf01f0 ; undefined

0000000000085f68 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385>:
   85f68:	07007000 	.inst	0x07007000 ; undefined
   85f6c:	01012d00 	.inst	0x01012d00 ; undefined
   85f70:	02010201 	.inst	0x02010201 ; undefined
   85f74:	0b480101 	add	w1, w8, w8, lsr #0
   85f78:	01101530 	.inst	0x01101530 ; undefined
   85f7c:	06020765 	.inst	0x06020765 ; undefined
   85f80:	04010202 	sub	z2.b, p0/m, z2.b, z16.b
   85f84:	1b1e0123 	madd	w3, w9, w30, w0
   85f88:	093a0b5b 	.inst	0x093a0b5b ; undefined
   85f8c:	04180109 	orr	z9.b, p0/m, z9.b, z8.b
   85f90:	03010901 	.inst	0x03010901 ; undefined
   85f94:	032b0501 	.inst	0x032b0501 ; undefined
   85f98:	20010f77 	.inst	0x20010f77 ; undefined
   85f9c:	01010137 	.inst	0x01010137 ; undefined
   85fa0:	01040804 	.inst	0x01040804 ; undefined
   85fa4:	020a0703 	.inst	0x020a0703 ; undefined
   85fa8:	013a011d 	.inst	0x013a011d ; undefined
   85fac:	04020101 	.inst	0x04020101 ; undefined
   85fb0:	01090108 	.inst	0x01090108 ; undefined
   85fb4:	011a020a 	.inst	0x011a020a ; undefined
   85fb8:	01390202 	.inst	0x01390202 ; undefined
   85fbc:	02040204 	.inst	0x02040204 ; undefined
   85fc0:	01030302 	.inst	0x01030302 ; undefined
   85fc4:	0103021e 	.inst	0x0103021e ; undefined
   85fc8:	0139020b 	.inst	0x0139020b ; undefined
   85fcc:	02010504 	.inst	0x02010504 ; undefined
   85fd0:	02140104 	.inst	0x02140104 ; undefined
   85fd4:	01010616 	.inst	0x01010616 ; undefined
   85fd8:	0201013a 	.inst	0x0201013a ; undefined
   85fdc:	01080401 	.inst	0x01080401 ; undefined
   85fe0:	020a0307 	.inst	0x020a0307 ; undefined
   85fe4:	013b011e 	.inst	0x013b011e ; undefined
   85fe8:	010c0101 	.inst	0x010c0101 ; undefined
   85fec:	01280109 	.inst	0x01280109 ; undefined
   85ff0:	03390103 	.inst	0x03390103 ; undefined
   85ff4:	04010305 	sub	z5.b, p0/m, z5.b, z24.b
   85ff8:	020b0207 	.inst	0x020b0207 ; undefined
   85ffc:	013a011d 	.inst	0x013a011d ; undefined
   86000:	01020102 	.inst	0x01020102 ; undefined
   86004:	02050103 	.inst	0x02050103 ; undefined
   86008:	020b0207 	.inst	0x020b0207 ; undefined
   8600c:	0239021c 	.inst	0x0239021c ; undefined
   86010:	04020101 	.inst	0x04020101 ; undefined
   86014:	01090108 	.inst	0x01090108 ; undefined
   86018:	011d020a 	.inst	0x011d020a ; undefined
   8601c:	01040148 	.inst	0x01040148 ; undefined
   86020:	01010302 	.inst	0x01010302 ; undefined
   86024:	01510108 	.inst	0x01510108 ; undefined
   86028:	080c0702 	stxrb	w12, w2, [x24]
   8602c:	09020162 	.inst	0x09020162 ; undefined
   86030:	024a060b 	.inst	0x024a060b ; undefined
   86034:	0101011b 	.inst	0x0101011b ; undefined
   86038:	0e370101 	saddl	v1.8h, v8.8b, v23.8b
   8603c:	02010501 	.inst	0x02010501 ; undefined
   86040:	24010b05 	cmphs	p5.b, p2/z, z24.b, z1.b
   86044:	04660109 	add	z9.h, z8.h, z6.h
   86048:	02010601 	.inst	0x02010601 ; undefined
   8604c:	02190202 	.inst	0x02190202 ; undefined
   86050:	04100304 	mul	z4.b, p0/m, z4.b, z24.b
   86054:	0202010d 	.inst	0x0202010d ; undefined
   86058:	010f0106 	.inst	0x010f0106 ; undefined
   8605c:	03000300 	.inst	0x03000300 ; undefined
   86060:	021d031d 	.inst	0x021d031d ; undefined
   86064:	0240021e 	.inst	0x0240021e ; undefined
   86068:	01080701 	.inst	0x01080701 ; undefined
   8606c:	01090b02 	.inst	0x01090b02 ; undefined
   86070:	0277032d 	.inst	0x0277032d ; undefined
   86074:	03760122 	.inst	0x03760122 ; undefined
   86078:	01090204 	.inst	0x01090204 ; undefined
   8607c:	02db0306 	.inst	0x02db0306 ; undefined
   86080:	013a0102 	.inst	0x013a0102 ; undefined
   86084:	01010701 	.inst	0x01010701 ; undefined
   86088:	08020101 	stxrb	w2, w1, [x8]
   8608c:	01020a06 	.inst	0x01020a06 ; undefined
   86090:	043f1130 	sqadd	z16.b, z9.b, z31.b
   86094:	01010730 	.inst	0x01010730 ; undefined
   86098:	09280105 	.inst	0x09280105 ; undefined
   8609c:	0420020c 	add	z12.b, z16.b, z0.b
   860a0:	03010202 	.inst	0x03010202 ; undefined
   860a4:	02010138 	.inst	0x02010138 ; undefined
   860a8:	03010103 	.inst	0x03010103 ; undefined
   860ac:	0202083a 	.inst	0x0202083a ; undefined
   860b0:	0d010398 	.inst	0x0d010398 ; undefined
   860b4:	01040701 	.inst	0x01040701 ; undefined
   860b8:	02030106 	.inst	0x02030106 ; undefined
   860bc:	05013ac6 	orr	z6.s, z6.s, #0xfe00ffff
   860c0:	21c30100 	.inst	0x21c30100 ; undefined
   860c4:	018d0300 	.inst	0x018d0300 ; undefined
   860c8:	06002060 	.inst	0x06002060 ; undefined
   860cc:	04000269 	add	z9.b, p0/m, z9.b, z19.b
   860d0:	02200a01 	.inst	0x02200a01 ; undefined
   860d4:	01000250 	.inst	0x01000250 ; undefined
   860d8:	01040103 	.inst	0x01040103 ; undefined
   860dc:	01050219 	.inst	0x01050219 ; undefined
   860e0:	121a0297 	and	w23, w20, #0x40
   860e4:	0826010d 	.inst	0x0826010d ; undefined
   860e8:	032e0b19 	.inst	0x032e0b19 ; undefined
   860ec:	04020130 	.inst	0x04020130 ; undefined
   860f0:	01270202 	.inst	0x01270202 ; undefined
   860f4:	02020643 	.inst	0x02020643 ; undefined
   860f8:	010c0202 	.inst	0x010c0202 ; undefined
   860fc:	012f0108 	.inst	0x012f0108 ; undefined
   86100:	03010133 	.inst	0x03010133 ; undefined
   86104:	02050202 	.inst	0x02050202 ; undefined
   86108:	022a0101 	.inst	0x022a0101 ; undefined
   8610c:	01ee0108 	.inst	0x01ee0108 ; undefined
   86110:	01040102 	.inst	0x01040102 ; undefined
   86114:	10000100 	adr	x0, 86134 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h43cbc87acfaf4d34E.llvm.111400220230659385+0x1cc>
   86118:	02001010 	.inst	0x02001010 ; undefined
   8611c:	01e20100 	.inst	0x01e20100 ; undefined
   86120:	03000595 	.inst	0x03000595 ; undefined
   86124:	04050201 	.inst	0x04050201 ; undefined
   86128:	01040328 	.inst	0x01040328 ; undefined
   8612c:	040002a5 	add	z5.b, p0/m, z5.b, z21.b
   86130:	0b990200 	add	w0, w16, w25, asr #0
   86134:	0f3601b0 	.inst	0x0f3601b0 ; undefined
   86138:	04310338 	add	z24.b, z25.b, z17.b
   8613c:	03450202 	.inst	0x03450202 ; undefined
   86140:	08010524 	stxrb	w1, w4, [x9]
   86144:	020c013e 	.inst	0x020c013e ; undefined
   86148:	040a0934 	smin	z20.b, p2/m, z20.b, z9.b
   8614c:	035f0102 	.inst	0x035f0102 ; undefined
   86150:	02010102 	.inst	0x02010102 ; undefined
   86154:	01a00106 	.inst	0x01a00106 ; undefined
   86158:	02150803 	.inst	0x02150803 ; undefined
   8615c:	01010239 	.inst	0x01010239 ; undefined
   86160:	01160101 	.inst	0x01160101 ; undefined
   86164:	0503070e 	orr	z14.d, z14.d, #0xffffffff01ffffff
   86168:	030208c3 	.inst	0x030208c3 ; undefined
   8616c:	01170101 	.inst	0x01170101 ; undefined
   86170:	06020151 	.inst	0x06020151 ; undefined
   86174:	01020101 	.inst	0x01020101 ; undefined
   86178:	02010201 	.inst	0x02010201 ; undefined
   8617c:	040201eb 	.inst	0x040201eb ; undefined
   86180:	02010206 	.inst	0x02010206 ; undefined
   86184:	0855021b 	ldxrb	w27, [x16]
   86188:	02010102 	.inst	0x02010102 ; undefined
   8618c:	0101016a 	.inst	0x0101016a ; undefined
   86190:	01010602 	.inst	0x01010602 ; undefined
   86194:	04020365 	.inst	0x04020365 ; undefined
   86198:	09000501 	.inst	0x09000501 ; undefined
   8619c:	01f50201 	.inst	0x01f50201 ; undefined
   861a0:	0101020a 	.inst	0x0101020a ; undefined
   861a4:	04900104 	mul	z4.s, p0/m, z4.s, z8.s
   861a8:	01040202 	.inst	0x01040202 ; undefined
   861ac:	06280a20 	.inst	0x06280a20 ; undefined
   861b0:	01080402 	.inst	0x01080402 ; undefined
   861b4:	03020609 	.inst	0x03020609 ; undefined
   861b8:	02010d2e 	.inst	0x02010d2e ; undefined
   861bc:	06010700 	.inst	0x06010700 ; undefined
   861c0:	16520101 	b	fffffffff95065c4 <__heap_end+0xffffffffbb5065c4>
   861c4:	02010702 	.inst	0x02010702 ; undefined
   861c8:	067a0201 	.inst	0x067a0201 ; undefined
   861cc:	02010103 	.inst	0x02010103 ; undefined
   861d0:	01010701 	.inst	0x01010701 ; undefined
   861d4:	01030248 	.inst	0x01030248 ; undefined
   861d8:	02000101 	.inst	0x02000101 ; undefined
   861dc:	073b0500 	.inst	0x073b0500 ; undefined
   861e0:	043f0100 	add	z0.b, z8.b, z31.b
   861e4:	02000151 	.inst	0x02000151 ; undefined
   861e8:	03010100 	.inst	0x03010100 ; undefined
   861ec:	08080504 	stxrb	w8, w4, [x8]
   861f0:	041e0702 	.inst	0x041e0702 ; undefined
   861f4:	37000394 	tbnz	w20, #0, 86264 <anon.da70acf48479ae6767f568a05ea2e9a7.6.llvm.2339018429671269780+0x44>
   861f8:	01083204 	.inst	0x01083204 ; undefined
   861fc:	0516010e 	mov	z14.b, p6/z, #8
   86200:	07000f01 	.inst	0x07000f01 ; undefined
   86204:	07021101 	.inst	0x07021101 ; undefined
   86208:	05010201 	orr	z1.s, z1.s, #0x1ffff
   8620c:	04000700 	add	z0.b, p1/m, z0.b, z24.b
   86210:	076d0700 	.inst	0x076d0700 ; undefined
   86214:	f0806000 	adrp	x0, ffffffff00c89000 <__heap_end+0xfffffffec2c89000>
	...

0000000000086220 <anon.da70acf48479ae6767f568a05ea2e9a7.6.llvm.2339018429671269780>:
   86220:	61632e2e 	.inst	0x61632e2e ; undefined
   86224:	64656c6c 	.inst	0x64656c6c ; undefined
   86228:	704f6020 	adr	x0, 124e2f <__heap_start+0x5be2f>
   8622c:	6e6f6974 	.inst	0x6e6f6974 ; undefined
   86230:	6e753a3a 	.inst	0x6e753a3a ; undefined
   86234:	70617277 	adr	x23, 149083 <__heap_start+0x80083>
   86238:	20602928 	.inst	0x20602928 ; undefined
   8623c:	61206e6f 	.inst	0x61206e6f ; undefined
   86240:	6f4e6020 	umlsl2	v0.4s, v1.8h, v14.h[0]
   86244:	2060656e 	.inst	0x2060656e ; undefined
   86248:	756c6176 	.inst	0x756c6176 ; undefined
   8624c:	5c3a4365 	ldr	d5, faab8 <__heap_start+0x31ab8>
   86250:	72657355 	.inst	0x72657355 ; undefined
   86254:	73705c73 	.inst	0x73705c73 ; undefined
   86258:	5c697770 	ldr	d16, 159144 <__heap_start+0x90144>
   8625c:	7375722e 	.inst	0x7375722e ; undefined
   86260:	5c707574 	ldr	d20, 16710c <__heap_start+0x9e10c>
   86264:	6c6f6f74 	ldnp	d20, d27, [x27, #-272]
   86268:	69616863 	ldpsw	x3, x26, [x3, #-248]
   8626c:	6e5c736e 	.inst	0x6e5c736e ; undefined
   86270:	74686769 	.inst	0x74686769 ; undefined
   86274:	782d796c 	strh	w12, [x11, x13, lsl #1]
   86278:	365f3638 	tbz	w24, #11, 8493c <.EXC_CURREL_SP0_Fiq+0x3c>
   8627c:	63702d34 	.inst	0x63702d34 ; undefined
   86280:	6e69772d 	uabd	v13.8h, v25.8h, v9.8h
   86284:	73776f64 	.inst	0x73776f64 ; undefined
   86288:	76736d2d 	.inst	0x76736d2d ; undefined
   8628c:	696c5c63 	ldpsw	x3, x23, [x3, #-160]
   86290:	75725c62 	.inst	0x75725c62 ; undefined
   86294:	696c7473 	ldpsw	x19, x29, [x3, #-160]
   86298:	72735c62 	.inst	0x72735c62 ; undefined
   8629c:	75725c63 	.inst	0x75725c63 ; undefined
   862a0:	6c5c7473 	ldnp	d19, d29, [x3, #448]
   862a4:	61726269 	.inst	0x61726269 ; undefined
   862a8:	635c7972 	.inst	0x635c7972 ; undefined
   862ac:	5c65726f 	ldr	d15, 1510f8 <__heap_start+0x880f8>
   862b0:	5c637273 	ldr	d19, 14d0fc <__heap_start+0x840fc>
   862b4:	63696e75 	.inst	0x63696e75 ; undefined
   862b8:	5c65646f 	ldr	d15, 150f44 <__heap_start+0x87f44>
   862bc:	6e697270 	uabdl2	v16.4s, v19.8h, v9.8h
   862c0:	6c626174 	ldnp	d20, d24, [x11, #-480]
   862c4:	73722e65 	.inst	0x73722e65 ; undefined

00000000000862c8 <anon.da70acf48479ae6767f568a05ea2e9a7.21.llvm.2339018429671269780>:
   862c8:	05030100 	orr	z0.d, z0.d, #0x1ff00000000
   862cc:	03060605 	.inst	0x03060605 ; undefined
   862d0:	08080607 	stxrb	w8, w7, [x16]
   862d4:	1c0a1109 	ldr	s9, 9a4f4 <__stack_top_core3__+0x1eb4>
   862d8:	140c190b 	b	38c704 <__heap_start+0x2c3704>
   862dc:	0d0e100d 	.inst	0x0d0e100d ; undefined
   862e0:	0310040f 	.inst	0x0310040f ; undefined
   862e4:	09131212 	.inst	0x09131212 ; undefined
   862e8:	05170116 	mov	z22.b, p7/z, #8
   862ec:	03190218 	.inst	0x03190218 ; undefined
   862f0:	021c071a 	.inst	0x021c071a ; undefined
   862f4:	161f011d 	b	fffffffff8846768 <__heap_end+0xffffffffba846768>
   862f8:	032b0320 	.inst	0x032b0320 ; undefined
   862fc:	0b2d022c 	add	w12, w17, w13, uxtb
   86300:	0330012e 	.inst	0x0330012e ; undefined
   86304:	01320231 	.inst	0x01320231 ; undefined
   86308:	02a902a7 	.inst	0x02a902a7 ; undefined
   8630c:	08ab04aa 	.inst	0x08ab04aa ; undefined
   86310:	05fb02fa 	.inst	0x05fb02fa ; undefined
   86314:	03fe04fd 	.inst	0x03fe04fd ; undefined
   86318:	 	.inst	0x78ad09ff ; undefined

000000000008631a <anon.da70acf48479ae6767f568a05ea2e9a7.22.llvm.2339018429671269780>:
   8631a:	8b7978ad 	.inst	0x8b7978ad ; undefined
   8631e:	5730a28d 	.inst	0x5730a28d ; undefined
   86322:	908c8b58 	adrp	x24, ffffffff191ee000 <__heap_end+0xfffffffedb1ee000>
   86326:	0edd1d1c 	.inst	0x0edd1d1c ; undefined
   8632a:	fb4c4b0f 	.inst	0xfb4c4b0f ; undefined
   8632e:	3f2f2efc 	.inst	0x3f2f2efc ; undefined
   86332:	b55f5d5c 	cbnz	x28, 144eda <__heap_start+0x7beda>
   86336:	8e8d84e2 	.inst	0x8e8d84e2 ; undefined
   8633a:	b1a99291 	.inst	0xb1a99291 ; undefined
   8633e:	c6c5bbba 	.inst	0xc6c5bbba ; undefined
   86342:	e4decac9 	st1h	{z9.s}, p2, [x22, z30.s, sxtw]
   86346:	0400ffe5 	msb	z5.b, p7/m, z0.b, z31.b
   8634a:	31291211 	adds	w17, w16, #0xa44
   8634e:	3b3a3734 	.inst	0x3b3a3734 ; undefined
   86352:	5d4a493d 	.inst	0x5d4a493d ; undefined
   86356:	a9928e84 	stp	x4, x3, [x20, #296]!
   8635a:	bbbab4b1 	.inst	0xbbbab4b1 ; undefined
   8635e:	cfcecac6 	.inst	0xcfcecac6 ; undefined
   86362:	0400e5e4 	msb	z4.b, p1/m, z0.b, z15.b
   86366:	12110e0d 	and	w13, w16, #0x78000
   8636a:	3a343129 	.inst	0x3a343129 ; undefined
   8636e:	4946453b 	.inst	0x4946453b ; undefined
   86372:	65645e4a 	fnmla	z10.h, p7/m, z18.h, z4.h
   86376:	9d9b9184 	.inst	0x9d9b9184 ; undefined
   8637a:	0dcfcec9 	ld1r	{v9.1d}, [x22], x15
   8637e:	49452911 	.inst	0x49452911 ; undefined
   86382:	8d656457 	.inst	0x8d656457 ; undefined
   86386:	bab4a991 	.inst	0xbab4a991 ; undefined
   8638a:	dfc9c5bb 	.inst	0xdfc9c5bb ; undefined
   8638e:	0df0e5e4 	ld4r	{v4.4h-v7.4h}, [x15], x16
   86392:	64494511 	fcmla	z17.h, p1/m, z8.h, z9.h, #180
   86396:	b2848065 	.inst	0xb2848065 ; undefined
   8639a:	d5bfbebc 	.inst	0xd5bfbebc ; undefined
   8639e:	83f1f0d7 	.inst	0x83f1f0d7 ; undefined
   863a2:	a6a48b85 	.inst	0xa6a48b85 ; undefined
   863a6:	c7c5bfbe 	.inst	0xc7c5bfbe ; undefined
   863aa:	dbdacfce 	.inst	0xdbdacfce ; undefined
   863ae:	cdbd9848 	.inst	0xcdbd9848 ; undefined
   863b2:	49cfcec6 	.inst	0x49cfcec6 ; undefined
   863b6:	59574f4e 	.inst	0x59574f4e ; undefined
   863ba:	8e895f5e 	.inst	0x8e895f5e ; undefined
   863be:	b7b6b18f 	tbnz	x15, #54, 839ee <__hang+0x8e>
   863c2:	c7c6c1bf 	.inst	0xc7c6c1bf ; undefined
   863c6:	171611d7 	b	fffffffffc60ab22 <__heap_end+0xffffffffbe60ab22>
   863ca:	f7f65c5b 	.inst	0xf7f65c5b ; undefined
   863ce:	0d80fffe 	.inst	0x0d80fffe ; undefined
   863d2:	dfde716d 	.inst	0xdfde716d ; undefined
   863d6:	6e1f0f0e 	mov	v14.b[15], v24.b[1]
   863da:	5f1d1c6f 	.inst	0x5f1d1c6f ; undefined
   863de:	afae7e7d 	.inst	0xafae7e7d ; undefined
   863e2:	16fabcbb 	b	fffffffffbf356ce <__heap_end+0xffffffffbdf356ce>
   863e6:	461f1e17 	.inst	0x461f1e17 ; undefined
   863ea:	584f4e47 	ldr	x7, 124db2 <__heap_start+0x5bdb2>
   863ee:	7e5e5c5a 	.inst	0x7e5e5c5a ; undefined
   863f2:	d4c5b57f 	.inst	0xd4c5b57f ; undefined
   863f6:	f1f0dcd5 	.inst	0xf1f0dcd5 ; undefined
   863fa:	8f7372f5 	.inst	0x8f7372f5 ; undefined
   863fe:	2f967574 	.inst	0x2f967574 ; undefined
   86402:	2f2e265f 	urshr	v31.2s, v18.2s, #18
   86406:	bfb7afa7 	.inst	0xbfb7afa7 ; undefined
   8640a:	dfd7cfc7 	.inst	0xdfd7cfc7 ; undefined
   8640e:	9897409a 	ldrsw	x26, fffffffffffb4c1e <__heap_end+0xffffffffc1fb4c1e>
   86412:	c01f8f30 	.inst	0xc01f8f30 ; undefined
   86416:	4effcec1 	fmls	v1.2d, v22.2d, v31.2d
   8641a:	075b5a4f 	.inst	0x075b5a4f ; undefined
   8641e:	27100f08 	.inst	0x27100f08 ; undefined
   86422:	6eefee2f 	facgt	v15.2d, v17.2d, v15.2d
   86426:	3f3d376f 	.inst	0x3f3d376f ; undefined
   8642a:	91904542 	.inst	0x91904542 ; undefined
   8642e:	6753fffe 	.inst	0x6753fffe ; undefined
   86432:	d0c9c875 	adrp	x21, ffffffff93994000 <__heap_end+0xffffffff55994000>
   86436:	e7d9d8d1 	.inst	0xe7d9d8d1 ; undefined
   8643a:	 	.inst	0x2000fffe ; undefined

000000000008643c <anon.da70acf48479ae6767f568a05ea2e9a7.23.llvm.2339018429671269780>:
   8643c:	225f2000 	.inst	0x225f2000 ; undefined
   86440:	8204df82 	.inst	0x8204df82 ; undefined
   86444:	041b0844 	bic	z4.b, p2/m, z4.b, z2.b
   86448:	ac811106 	stp	q6, q4, [x8], #32
   8644c:	35ab800e 	cbnz	w14, fffffffffffdd44c <__heap_end+0xffffffffc1fdd44c>
   86450:	e0800b28 	.inst	0xe0800b28 ; undefined
   86454:	01081903 	.inst	0x01081903 ; undefined
   86458:	34042f04 	cbz	w4, 8ea38 <__stack_end__+0x63f8>
   8645c:	01030704 	.inst	0x01030704 ; undefined
   86460:	11070607 	add	w7, w16, #0x1c1
   86464:	120f500a 	and	w10, w0, #0xfffe003f
   86468:	03075507 	.inst	0x03075507 ; undefined
   8646c:	090a1c04 	.inst	0x090a1c04 ; undefined
   86470:	07030803 	.inst	0x07030803 ; undefined
   86474:	03030203 	.inst	0x03030203 ; undefined
   86478:	05040c03 	.inst	0x05040c03 ; undefined
   8647c:	01060b03 	.inst	0x01060b03 ; undefined
   86480:	3a05150e 	.inst	0x3a05150e ; undefined
   86484:	06071103 	.inst	0x06071103 ; undefined
   86488:	57071005 	.inst	0x57071005 ; undefined
   8648c:	15070207 	b	4246ca8 <__heap_start+0x417dca8>
   86490:	4304500d 	.inst	0x4304500d ; undefined
   86494:	01032d03 	.inst	0x01032d03 ; undefined
   86498:	0f061104 	fmla	v4.4h, v8.4h, v6.h[0]
   8649c:	1d043a0c 	.inst	0x1d043a0c ; undefined
   864a0:	6d205f25 	stp	d5, d23, [x25, #-512]
   864a4:	80256a04 	.inst	0x80256a04 ; NYI
   864a8:	b08205c8 	adrp	x8, ffffffff0413f000 <__heap_end+0xfffffffec613f000>
   864ac:	82061a03 	.inst	0x82061a03 ; undefined
   864b0:	075903fd 	.inst	0x075903fd ; undefined
   864b4:	09170b15 	.inst	0x09170b15 ; undefined
   864b8:	0c140c14 	.inst	0x0c140c14 ; undefined
   864bc:	060a066a 	.inst	0x060a066a ; undefined
   864c0:	0759061a 	.inst	0x0759061a ; undefined
   864c4:	0a46052b 	and	w11, w9, w6, lsr #1
   864c8:	040c042c 	sabd	z12.b, p1/m, z12.b, z1.b
   864cc:	0b310301 	add	w1, w24, w17, uxtb
   864d0:	061a042c 	.inst	0x061a042c ; undefined
   864d4:	ac80030b 	stp	q11, q0, [x24], #0
   864d8:	21060a06 	.inst	0x21060a06 ; undefined
   864dc:	2d044c3f 	stp	s31, s19, [x1, #32]
   864e0:	3c087403 	str	b3, [x0], #135
   864e4:	3c030f03 	str	b3, [x24, #48]!
   864e8:	2b083807 	adds	w7, w0, w8, lsl #14
   864ec:	11ff8205 	.inst	0x11ff8205 ; undefined
   864f0:	112f0818 	add	w24, w0, #0xbc2
   864f4:	1020032d 	adr	x13, c6558 <__stack_top_EL2__+0xcf18>
   864f8:	8c800f21 	.inst	0x8c800f21 ; undefined
   864fc:	19978204 	ldapursb	x4, [x16, #-136]
   86500:	9488150b 	bl	228b92c <__heap_start+0x21c292c>
   86504:	3b052f05 	.inst	0x3b052f05 ; undefined
   86508:	180e0207 	ldr	w7, a2548 <__stack_top_core3__+0x9f08>
   8650c:	2db38009 	stp	s9, s0, [x0, #-100]!
   86510:	d6800c74 	.inst	0xd6800c74 ; undefined
   86514:	80050c1a 	.inst	0x80050c1a ; undefined
   86518:	df8005ff 	.inst	0xdf8005ff ; undefined
   8651c:	030dee0c 	.inst	0x030dee0c ; undefined
   86520:	37038d84 	tbnz	w4, #0, 8d6d0 <__stack_end__+0x5090>
   86524:	145c8109 	b	17a6948 <__heap_start+0x16dd948>
   86528:	8008b880 	.inst	0x8008b880 ; undefined
   8652c:	03382acb 	.inst	0x03382acb ; undefined
   86530:	0838060a 	.inst	0x0838060a ; undefined
   86534:	060c0846 	.inst	0x060c0846 ; undefined
   86538:	031e0b74 	.inst	0x031e0b74 ; undefined
   8653c:	0959045a 	.inst	0x0959045a ; undefined
   86540:	1c188380 	ldr	s0, b75b0 <__stack_top_core2__+0xef70>
   86544:	4c09160a 	.inst	0x4c09160a ; undefined
   86548:	068a8004 	.inst	0x068a8004 ; undefined
   8654c:	170ca4ab 	b	fffffffffc3af7f8 <__heap_end+0xffffffffbe3af7f8>
   86550:	04a13104 	eor	z4.d, z8.d, z1.d
   86554:	0726da81 	.inst	0x0726da81 ; undefined
   86558:	8005050c 	.inst	0x8005050c ; undefined
   8655c:	6d8111a5 	stp	d5, d4, [x13, #16]!
   86560:	2a287810 	orn	w16, w0, w8, lsl #30
   86564:	80044c06 	.inst	0x80044c06 ; undefined
   86568:	be80048d 	.inst	0xbe80048d ; undefined
   8656c:	0f031b03 	fmla	v3.4h, v24.4h, v3.h[4]
   86570:	 	.inst	0x0106000d ; undefined

0000000000086571 <anon.da70acf48479ae6767f568a05ea2e9a7.24.llvm.2339018429671269780>:
   86571:	01010600 	.inst	0x01010600 ; undefined
   86575:	02040103 	.inst	0x02040103 ; undefined
   86579:	02090808 	.inst	0x02090808 ; undefined
   8657d:	020b050a 	.inst	0x020b050a ; undefined
   86581:	0110040e 	.inst	0x0110040e ; undefined
   86585:	05120211 	mov	z17.b, p2/z, #16
   86589:	01141113 	.inst	0x01141113 ; undefined
   8658d:	02170215 	.inst	0x02170215 ; undefined
   86591:	051c0d19 	mov	z25.b, p12/z, #104
   86595:	0124081d 	.inst	0x0124081d ; undefined
   86599:	026b036a 	.inst	0x026b036a ; undefined
   8659d:	02d102bc 	.inst	0x02d102bc ; undefined
   865a1:	09d50cd4 	.inst	0x09d50cd4 ; undefined
   865a5:	02d702d6 	.inst	0x02d702d6 ; undefined
   865a9:	05e001da 	.inst	0x05e001da ; undefined
   865ad:	02e802e1 	.inst	0x02e802e1 ; undefined
   865b1:	04f020ee 	.inst	0x04f020ee ; undefined
   865b5:	02f902f8 	.inst	0x02f902f8 ; undefined
   865b9:	01fb02fa 	.inst	0x01fb02fa ; undefined

00000000000865bd <anon.da70acf48479ae6767f568a05ea2e9a7.25.llvm.2339018429671269780>:
   865bd:	3e3b270c 	.inst	0x3e3b270c ; undefined
   865c1:	9e8f4f4e 	.inst	0x9e8f4f4e ; undefined
   865c5:	07069f9e 	.inst	0x07069f9e ; undefined
   865c9:	3e3d3609 	.inst	0x3e3d3609 ; undefined
   865cd:	d1d0f356 	.inst	0xd1d0f356 ; undefined
   865d1:	36181404 	tbz	w4, #3, 86851 <anon.da70acf48479ae6767f568a05ea2e9a7.26.llvm.2339018429671269780+0x1e5>
   865d5:	7f575637 	sli	d23, d17, #23
   865d9:	bdafaeaa 	.inst	0xbdafaeaa ; undefined
   865dd:	8712e035 	.inst	0x8712e035 ; undefined
   865e1:	049e8e89 	.inst	0x049e8e89 ; undefined
   865e5:	12110e0d 	and	w13, w16, #0x78000
   865e9:	3a343129 	.inst	0x3a343129 ; undefined
   865ed:	4a494645 	eor	w5, w18, w9, lsr #17
   865f1:	65644f4e 	fnmla	z14.h, p3/m, z26.h, z4.h
   865f5:	1bb7b65c 	.inst	0x1bb7b65c ; undefined
   865f9:	0a08071c 	and	w28, w24, w8, lsl #1
   865fd:	3617140b 	tbz	w11, #2, 8487d <__ExceptionVectorTable+0x7d>
   86601:	a9a83a39 	stp	x25, x14, [x17, #-384]!
   86605:	3709d9d8 	tbnz	w24, #1, 8a13d <__stack_end__+0x1afd>
   86609:	07a89190 	.inst	0x07a89190 ; undefined
   8660d:	663e3b0a 	.inst	0x663e3b0a ; undefined
   86611:	6f928f69 	.inst	0x6f928f69 ; undefined
   86615:	5aefee5f 	.inst	0x5aefee5f ; undefined
   86619:	279b9a62 	.inst	0x279b9a62 ; undefined
   8661d:	a09d5528 	.inst	0xa09d5528 ; undefined
   86621:	a7a4a3a1 	.inst	0xa7a4a3a1 ; undefined
   86625:	bcbaada8 	.inst	0xbcbaada8 ; undefined
   86629:	0c0b06c4 	.inst	0x0c0b06c4 ; undefined
   8662d:	3f3a1d15 	.inst	0x3f3a1d15 ; undefined
   86631:	a7a65145 	.inst	0xa7a65145 ; undefined
   86635:	07a0cdcc 	.inst	0x07a0cdcc ; undefined
   86639:	25221a19 	whilehi	p9.b, x16, x2
   8663d:	c6c53f3e 	.inst	0xc6c53f3e ; undefined
   86641:	25232004 	.inst	0x25232004 ; undefined
   86645:	38332826 	.inst	0x38332826 ; undefined
   86649:	4c4a483a 	.inst	0x4c4a483a ; undefined
   8664d:	56555350 	.inst	0x56555350 ; undefined
   86651:	5e5c5a58 	.inst	0x5e5c5a58 ; undefined
   86655:	66656360 	.inst	0x66656360 ; undefined
   86659:	7d78736b 	ldr	h11, [x27, #7224]
   8665d:	aaa48a7f 	orn	xzr, x19, x4, asr #34
   86661:	d0c0b0af 	adrp	x15, ffffffff8169c000 <__heap_end+0xffffffff4369c000>
   86665:	cc79afae 	.inst	0xcc79afae ; undefined
   86669:	 	.inst	0x5e936f6e ; undefined

000000000008666c <anon.da70acf48479ae6767f568a05ea2e9a7.26.llvm.2339018429671269780>:
   8666c:	057b225e 	mov	z30.b, z18.b[29]
   86670:	032d0403 	.inst	0x032d0403 ; undefined
   86674:	2f010366 	.inst	0x2f010366 ; undefined
   86678:	1d82802e 	.inst	0x1d82802e ; undefined
   8667c:	1c0f3103 	ldr	s3, a4c9c <__stack_top_core3__+0xc65c>
   86680:	1e092404 	.inst	0x1e092404 ; undefined
   86684:	44052b05 	cmla	z5.b, z24.b, z5.b, #180
   86688:	802a0e04 	.inst	0x802a0e04 ; NYI
   8668c:	042406aa 	sub	z10.b, z21.b, z4.b
   86690:	08280424 	.inst	0x08280424 ; undefined
   86694:	80010b34 	.inst	0x80010b34 ; undefined
   86698:	09378190 	.inst	0x09378190 ; undefined
   8669c:	80080a16 	.inst	0x80080a16 ; undefined
   866a0:	63033998 	.inst	0x63033998 ; undefined
   866a4:	16300908 	b	fffffffff8c88ac4 <__heap_end+0xffffffffbac88ac4>
   866a8:	1b032105 	madd	w5, w8, w3, w8
   866ac:	38400105 	ldurb	w5, [x8]
   866b0:	2f054b04 	.inst	0x2f054b04 ; undefined
   866b4:	09070a04 	.inst	0x09070a04 ; undefined
   866b8:	27204007 	.inst	0x27204007 ; undefined
   866bc:	36090c04 	tbz	w4, #1, 8883c <__stack_end__+0x1fc>
   866c0:	1a053a03 	.inst	0x1a053a03 ; undefined
   866c4:	070c0407 	.inst	0x070c0407 ; undefined
   866c8:	33374950 	.inst	0x33374950 ; undefined
   866cc:	2e07330d 	ext	v13.8b, v24.8b, v7.8b, #6
   866d0:	26810a08 	.inst	0x26810a08 ; undefined
   866d4:	08284e52 	.inst	0x08284e52 ; undefined
   866d8:	141c562a 	b	79bf80 <__heap_start+0x6d2f80>
   866dc:	044e0917 	.inst	0x044e0917 ; undefined
   866e0:	0e430f1e 	fmla	v30.4h, v24.4h, v3.4h
   866e4:	060a0719 	.inst	0x060a0719 ; undefined
   866e8:	09270848 	.inst	0x09270848 ; undefined
   866ec:	413f0b75 	.inst	0x413f0b75 ; undefined
   866f0:	053b062a 	ext	z10.b, z10.b, z17.b, #217
   866f4:	0651060a 	.inst	0x0651060a ; undefined
   866f8:	03100501 	.inst	0x03100501 ; undefined
   866fc:	628b8005 	.inst	0x628b8005 ; undefined
   86700:	0a08481e 	and	w30, w0, w8, lsl #18
   86704:	225ea680 	.inst	0x225ea680 ; undefined
   86708:	060a0b45 	.inst	0x060a0b45 ; undefined
   8670c:	0739130d 	.inst	0x0739130d ; undefined
   86710:	042c360a 	xar	z10.b, z10.b, z16.b, #4
   86714:	3cc08010 	ldur	q16, [x0, #8]
   86718:	480c5364 	stxrh	w12, w4, [x27]
   8671c:	45460a09 	uaddlb	z9.h, z16.b, z6.b
   86720:	5308481b 	ubfx	w27, w0, #8, #11
   86724:	0781391d 	.inst	0x0781391d ; undefined
   86728:	031d0a46 	.inst	0x031d0a46 ; undefined
   8672c:	03374947 	.inst	0x03374947 ; undefined
   86730:	060a080e 	.inst	0x060a080e ; undefined
   86734:	810a0739 	.inst	0x810a0739 ; undefined
   86738:	b7801936 	tbnz	x22, #48, 86a5c <anon.a7c90de7e5cc6c178c09142d4ee6f15c.8.llvm.14833330310357332318+0x124>
   8673c:	0d320f01 	.inst	0x0d320f01 ; undefined
   86740:	75669b83 	.inst	0x75669b83 ; undefined
   86744:	8ac4800b 	and	x11, x0, x4, ror #32
   86748:	8f2f84bc 	.inst	0x8f2f84bc ; undefined
   8674c:	a14782d1 	.inst	0xa14782d1 ; undefined
   86750:	073982b9 	.inst	0x073982b9 ; undefined
   86754:	6002042a 	.inst	0x6002042a ; undefined
   86758:	0a460a26 	and	w6, w17, w6, lsr #2
   8675c:	82130528 	.inst	0x82130528 ; undefined
   86760:	4b655bb0 	.inst	0x4b655bb0 ; undefined
   86764:	11073904 	add	w4, w8, #0x1ce
   86768:	020b0540 	.inst	0x020b0540 ; undefined
   8676c:	08f8970e 	.inst	0x08f8970e ; undefined
   86770:	092ad684 	.inst	0x092ad684 ; undefined
   86774:	1f81f7a2 	.inst	0x1f81f7a2 ; undefined
   86778:	04110331 	.inst	0x04110331 ; undefined
   8677c:	898c8108 	.inst	0x898c8108 ; undefined
   86780:	0d056b04 	.inst	0x0d056b04 ; undefined
   86784:	10070903 	adr	x3, 948a4 <__stack_end__+0xc264>
   86788:	f6806093 	.inst	0xf6806093 ; undefined
   8678c:	6e08730a 	ext	v10.16b, v24.16b, v8.16b, #14
   86790:	9a804617 	csinc	x23, x16, x0, mi  // mi = first
   86794:	09570c14 	.inst	0x09570c14 ; undefined
   86798:	81878019 	.inst	0x81878019 ; undefined
   8679c:	42850347 	.inst	0x42850347 ; undefined
   867a0:	5085150f 	adr	x15, fffffffffff90a42 <__heap_end+0xffffffffc1f90a42>
   867a4:	2dd5802b 	ldp	s11, s0, [x1, #172]!
   867a8:	02041a03 	.inst	0x02041a03 ; undefined
   867ac:	053a7081 	trn1	z1.b, z4.b, z26.b
   867b0:	80008501 	.inst	0x80008501 ; undefined
   867b4:	044c29d7 	.inst	0x044c29d7 ; undefined
   867b8:	8302040a 	.inst	0x8302040a ; undefined
   867bc:	3d4c4411 	ldr	b17, [x0, #785]
   867c0:	063cc280 	.inst	0x063cc280 ; undefined
   867c4:	05550401 	mov	z1.h, p5/z, #32
   867c8:	8102341b 	.inst	0x8102341b ; undefined
   867cc:	64042c0e 	.inst	0x64042c0e ; undefined
   867d0:	800a560c 	.inst	0x800a560c ; undefined
   867d4:	0d1d38ae 	.inst	0x0d1d38ae ; undefined
   867d8:	0709042c 	.inst	0x0709042c ; undefined
   867dc:	80060e02 	.inst	0x80060e02 ; undefined
   867e0:	08d8839a 	.inst	0x08d8839a ; undefined
   867e4:	030d030d 	.inst	0x030d030d ; undefined
   867e8:	07590c74 	.inst	0x07590c74 ; undefined
   867ec:	040c140c 	sabd	z12.b, p5/m, z12.b, z0.b
   867f0:	060a0838 	.inst	0x060a0838 ; undefined
   867f4:	4e220828 	.inst	0x4e220828 ; undefined
   867f8:	150c5481 	b	439b9fc <__heap_start+0x42d29fc>
   867fc:	07050303 	.inst	0x07050303 ; undefined
   86800:	07071909 	.inst	0x07071909 ; undefined
   86804:	070d0309 	.inst	0x070d0309 ; undefined
   86808:	25cb8029 	cmpeq	p9.d, p0/z, z1.d, #11
   8680c:	4206840a 	.inst	0x4206840a ; undefined
   86810:	6f72726f 	fcmla	v15.8h, v19.8h, v18.h[1], #270
   86814:	72724577 	.inst	0x72724577 ; undefined
   86818:	6f42726f 	fcmla	v15.8h, v19.8h, v2.h[0], #270
   8681c:	776f7272 	.inst	0x776f7272 ; undefined
   86820:	4574754d 	subhnt	z13.b, z10.h, z20.h
   86824:	726f7272 	.inst	0x726f7272 ; undefined
   86828:	6c6c6163 	ldnp	d3, d24, [x11, #-320]
   8682c:	60206465 	.inst	0x60206465 ; undefined
   86830:	6974704f 	ldpsw	x15, x28, [x2, #-96]
   86834:	3a3a6e6f 	.inst	0x3a3a6e6f ; undefined
   86838:	72776e75 	.inst	0x72776e75 ; undefined
   8683c:	29287061 	stp	w1, w28, [x3, #-192]
   86840:	6e6f2060 	usubl2	v0.4s, v3.8h, v15.8h
   86844:	60206120 	.inst	0x60206120 ; undefined
   86848:	656e6f4e 	fnmls	z14.h, p3/m, z26.h, z14.h
   8684c:	61762060 	.inst	0x61762060 ; undefined
   86850:	3a65756c 	.inst	0x3a65756c ; undefined
   86854:	5c3a4320 	ldr	d0, fb0b8 <__heap_start+0x320b8>
   86858:	72657355 	.inst	0x72657355 ; undefined
   8685c:	73705c73 	.inst	0x73705c73 ; undefined
   86860:	5c697770 	ldr	d16, 15974c <__heap_start+0x9074c>
   86864:	7375722e 	.inst	0x7375722e ; undefined
   86868:	5c707574 	ldr	d20, 167714 <__heap_start+0x9e714>
   8686c:	6c6f6f74 	ldnp	d20, d27, [x27, #-272]
   86870:	69616863 	ldpsw	x3, x26, [x3, #-248]
   86874:	6e5c736e 	.inst	0x6e5c736e ; undefined
   86878:	74686769 	.inst	0x74686769 ; undefined
   8687c:	782d796c 	strh	w12, [x11, x13, lsl #1]
   86880:	365f3638 	tbz	w24, #11, 84f44 <.EXC_LOWEREL32_SPX_Fiq+0x44>
   86884:	63702d34 	.inst	0x63702d34 ; undefined
   86888:	6e69772d 	uabd	v13.8h, v25.8h, v9.8h
   8688c:	73776f64 	.inst	0x73776f64 ; undefined
   86890:	76736d2d 	.inst	0x76736d2d ; undefined
   86894:	696c5c63 	ldpsw	x3, x23, [x3, #-160]
   86898:	75725c62 	.inst	0x75725c62 ; undefined
   8689c:	696c7473 	ldpsw	x19, x29, [x3, #-160]
   868a0:	72735c62 	.inst	0x72735c62 ; undefined
   868a4:	75725c63 	.inst	0x75725c63 ; undefined
   868a8:	6c5c7473 	ldnp	d19, d29, [x3, #448]
   868ac:	61726269 	.inst	0x61726269 ; undefined
   868b0:	635c7972 	.inst	0x635c7972 ; undefined
   868b4:	5c65726f 	ldr	d15, 151700 <__heap_start+0x88700>
   868b8:	5c637273 	ldr	d19, 14d704 <__heap_start+0x84704>
   868bc:	5c727473 	ldr	d19, 16b748 <__heap_start+0xa2748>
   868c0:	696c6176 	ldpsw	x22, x24, [x11, #-160]
   868c4:	69746164 	ldpsw	x4, x24, [x11, #-96]
   868c8:	2e736e6f 	umin	v15.4h, v19.4h, v19.4h
   868cc:	2e5b7372 	.inst	0x2e5b7372 ; undefined
   868d0:	625d2e2e 	.inst	0x625d2e2e ; undefined
   868d4:	20657479 	.inst	0x20657479 ; undefined
   868d8:	65646e69 	fnmls	z9.h, p3/m, z19.h, z4.h
   868dc:	69202078 	stgp	x24, x8, [x3, #-1024]
   868e0:	756f2073 	.inst	0x756f2073 ; undefined
   868e4:	666f2074 	.inst	0x666f2074 ; undefined
   868e8:	756f6220 	.inst	0x756f6220 ; undefined
   868ec:	2073646e 	.inst	0x2073646e ; undefined
   868f0:	6020666f 	.inst	0x6020666f ; undefined
   868f4:	67656260 	.inst	0x67656260 ; undefined
   868f8:	3c206e69 	.inst	0x3c206e69 ; undefined
   868fc:	6e65203d 	usubl2	v29.4s, v1.8h, v5.8h
   86900:	20282064 	.inst	0x20282064 ; undefined
   86904:	52203d3c 	eor	w28, w9, #0xffff
   86908:	20646165 	.inst	0x20646165 ; undefined
   8690c:	6e207369 	uabdl2	v9.8h, v27.16b, v0.16b
   86910:	6120746f 	.inst	0x6120746f ; undefined
   86914:	61686320 	.inst	0x61686320 ; undefined
   86918:	6f622072 	umlal2	v18.4s, v3.8h, v2.h[2]
   8691c:	61646e75 	.inst	0x61646e75 ; undefined
   86920:	203b7972 	.inst	0x203b7972 ; undefined
   86924:	69207469 	stgp	x9, x29, [x3, #-1024]
   86928:	6e692073 	usubl2	v19.4s, v3.8h, v9.8h
   8692c:	65646973 	fnmls	z19.h, p2/m, z11.h, z4.h
   86930:	6f202920 	.inst	0x6f202920 ; undefined
   86934:	00602066 	.inst	0x00602066 ; undefined

0000000000086938 <anon.a7c90de7e5cc6c178c09142d4ee6f15c.8.llvm.14833330310357332318>:
   86938:	65646e69 	fnmls	z9.h, p3/m, z19.h, z4.h
   8693c:	756f2078 	.inst	0x756f2078 ; undefined
   86940:	666f2074 	.inst	0x666f2074 ; undefined
   86944:	756f6220 	.inst	0x756f6220 ; undefined
   86948:	3a73646e 	.inst	0x3a73646e ; undefined
   8694c:	65687420 	fnmls	z0.h, p5/m, z1.h, z8.h
   86950:	6e656c20 	umin	v0.8h, v1.8h, v5.8h
   86954:	20736920 	.inst	0x20736920 ; undefined
   86958:	74756220 	.inst	0x74756220 ; undefined
   8695c:	65687420 	fnmls	z0.h, p5/m, z1.h, z8.h
   86960:	646e6920 	.inst	0x646e6920 ; undefined
   86964:	69207865 	stgp	x5, x30, [x3, #-1024]
   86968:	00002073 	.inst	0x00002073 ; undefined
   8696c:	00000000 	.inst	0x00000000 ; undefined
   86970:	70737572 	adr	x18, 16d81f <__heap_start+0xa481f>
   86974:	5f6f7269 	sqdmlsl	s9, h19, v15.h[2]
   86978:	746f6f62 	.inst	0x746f6f62 ; undefined
   8697c:	61703a3a 	.inst	0x61703a3a ; undefined
   86980:	4363696e 	.inst	0x4363696e ; undefined
   86984:	73555c3a 	.inst	0x73555c3a ; undefined
   86988:	5c737265 	ldr	d5, 16d7d4 <__heap_start+0xa47d4>
   8698c:	77707370 	.inst	0x77707370 ; undefined
   86990:	632e5c69 	.inst	0x632e5c69 ; undefined
   86994:	6f677261 	fcmla	v1.8h, v19.8h, v7.h[1], #270
   86998:	6765725c 	.inst	0x6765725c ; undefined
   8699c:	72747369 	.inst	0x72747369 ; undefined
   869a0:	72735c79 	.inst	0x72735c79 ; undefined
   869a4:	69675c63 	ldpsw	x3, x23, [x3, #-200]
   869a8:	62756874 	.inst	0x62756874 ; undefined
   869ac:	6d6f632e 	ldp	d14, d24, [x25, #-272]
   869b0:	6365312d 	.inst	0x6365312d ; undefined
   869b4:	39323663 	strb	w3, [x19, #3213]
   869b8:	39626439 	ldrb	w25, [x1, #2201]
   869bc:	32386365 	orr	w5, w27, #0xffffff01
   869c0:	75725c33 	.inst	0x75725c33 ; undefined
   869c4:	72697073 	.inst	0x72697073 ; undefined
   869c8:	6f622d6f 	.inst	0x6f622d6f ; undefined
   869cc:	302d746f 	adr	x15, e1859 <__heap_start+0x18859>
   869d0:	332e352e 	.inst	0x332e352e ; undefined
   869d4:	6372735c 	.inst	0x6372735c ; undefined
   869d8:	6e61705c 	uabdl2	v28.4s, v2.8h, v1.8h
   869dc:	722e6369 	ands	w9, w27, #0xfffc07ff
   869e0:	4e415073 	.inst	0x4e415073 ; undefined
   869e4:	61204349 	.inst	0x61204349 ; undefined
   869e8:	202c2074 	.inst	0x202c2074 ; undefined
   869ec:	0000003a 	.inst	0x0000003a ; undefined
   869f0:	0808006b 	stxrb	w8, w11, [x3]
   869f4:	0808081c 	stxrb	w8, w28, [x0]
   869f8:	08080808 	stxrb	w8, w8, [x0]
   869fc:	08080808 	stxrb	w8, w8, [x0]
   86a00:	08080808 	stxrb	w8, w8, [x0]
   86a04:	08080808 	stxrb	w8, w8, [x0]
   86a08:	00360508 	.inst	0x00360508 ; NYI
   86a0c:	00230e02 	.inst	0x00230e02 ; NYI
   86a10:	1a041509 	.inst	0x1a041509 ; undefined
   86a14:	0808005e 	stxrb	w8, w30, [x2]
   86a18:	0808081a 	stxrb	w8, w26, [x0]
   86a1c:	08080808 	stxrb	w8, w8, [x0]
   86a20:	08080808 	stxrb	w8, w8, [x0]
   86a24:	08080808 	stxrb	w8, w8, [x0]
   86a28:	08080808 	stxrb	w8, w8, [x0]
   86a2c:	08080808 	stxrb	w8, w8, [x0]
   86a30:	35050808 	cbnz	w8, 90b30 <__stack_end__+0x84f0>
   86a34:	220e0200 	.inst	0x220e0200 ; undefined
   86a38:	140f0400 	b	447a38 <__heap_start+0x37ea38>
   86a3c:	5c3a4319 	ldr	d25, fb29c <__heap_start+0x3229c>
   86a40:	72657355 	.inst	0x72657355 ; undefined
   86a44:	73705c73 	.inst	0x73705c73 ; undefined
   86a48:	5c697770 	ldr	d16, 159934 <__heap_start+0x90934>
   86a4c:	7375722e 	.inst	0x7375722e ; undefined
   86a50:	5c707574 	ldr	d20, 1678fc <__heap_start+0x9e8fc>
   86a54:	6c6f6f74 	ldnp	d20, d27, [x27, #-272]
   86a58:	69616863 	ldpsw	x3, x26, [x3, #-248]
   86a5c:	6e5c736e 	.inst	0x6e5c736e ; undefined
   86a60:	74686769 	.inst	0x74686769 ; undefined
   86a64:	782d796c 	strh	w12, [x11, x13, lsl #1]
   86a68:	365f3638 	tbz	w24, #11, 8512c <__exception_handler_default+0x12c>
   86a6c:	63702d34 	.inst	0x63702d34 ; undefined
   86a70:	6e69772d 	uabd	v13.8h, v25.8h, v9.8h
   86a74:	73776f64 	.inst	0x73776f64 ; undefined
   86a78:	76736d2d 	.inst	0x76736d2d ; undefined
   86a7c:	696c5c63 	ldpsw	x3, x23, [x3, #-160]
   86a80:	75725c62 	.inst	0x75725c62 ; undefined
   86a84:	696c7473 	ldpsw	x19, x29, [x3, #-160]
   86a88:	72735c62 	.inst	0x72735c62 ; undefined
   86a8c:	75725c63 	.inst	0x75725c63 ; undefined
   86a90:	6c5c7473 	ldnp	d19, d29, [x3, #448]
   86a94:	61726269 	.inst	0x61726269 ; undefined
   86a98:	635c7972 	.inst	0x635c7972 ; undefined
   86a9c:	5c65726f 	ldr	d15, 1518e8 <__heap_start+0x888e8>
   86aa0:	5c637273 	ldr	d19, 14d8ec <__heap_start+0x848ec>
   86aa4:	5c746d66 	ldr	d6, 16f850 <__heap_start+0xa6850>
   86aa8:	2e646f6d 	umin	v13.4h, v27.4h, v4.4h
   86aac:	00007372 	.inst	0x00007372 ; undefined
   86ab0:	04040404 	.inst	0x04040404 ; undefined
   86ab4:	04040404 	.inst	0x04040404 ; undefined
   86ab8:	04040404 	.inst	0x04040404 ; undefined
   86abc:	00001904 	.inst	0x00001904 ; undefined
   86ac0:	71717100 	subs	w0, w8, #0xc5c, lsl #12
   86ac4:	71717171 	subs	w17, w11, #0xc5c, lsl #12
   86ac8:	71717171 	subs	w17, w11, #0xc5c, lsl #12
   86acc:	71717171 	subs	w17, w11, #0xc5c, lsl #12
   86ad0:	23071c71 	.inst	0x23071c71 ; undefined
   86ad4:	310e2a71 	adds	w17, w19, #0x38a
   86ad8:	71717171 	subs	w17, w11, #0xc5c, lsl #12
   86adc:	71717171 	subs	w17, w11, #0xc5c, lsl #12
   86ae0:	71711571 	subs	w17, w11, #0xc45, lsl #12
   86ae4:	00003f38 	.inst	0x00003f38 ; undefined
   86ae8:	61686e75 	.inst	0x61686e75 ; undefined
   86aec:	656c646e 	fnmls	z14.h, p1/m, z3.h, z12.h
   86af0:	78652064 	ldeorlh	w5, w4, [x3]
   86af4:	69747065 	ldpsw	x5, x28, [x3, #-96]
   86af8:	75726e6f 	.inst	0x75726e6f ; undefined
   86afc:	72697073 	.inst	0x72697073 ; undefined
   86b00:	6f625f6f 	.inst	0x6f625f6f ; undefined
   86b04:	3a3a746f 	.inst	0x3a3a746f ; undefined
   86b08:	65637865 	fnmls	z5.h, p6/m, z3.h, z3.h
   86b0c:	6f697470 	uqshl	v16.2d, v3.2d, #41
   86b10:	5c3a436e 	ldr	d14, fb37c <__heap_start+0x3237c>
   86b14:	72657355 	.inst	0x72657355 ; undefined
   86b18:	73705c73 	.inst	0x73705c73 ; undefined
   86b1c:	5c697770 	ldr	d16, 159a08 <__heap_start+0x90a08>
   86b20:	7261632e 	.inst	0x7261632e ; undefined
   86b24:	725c6f67 	.inst	0x725c6f67 ; undefined
   86b28:	73696765 	.inst	0x73696765 ; undefined
   86b2c:	5c797274 	ldr	d20, 179978 <__heap_start+0xb0978>
   86b30:	5c637273 	ldr	d19, 14d97c <__heap_start+0x8497c>
   86b34:	68746967 	.inst	0x68746967 ; undefined
   86b38:	632e6275 	.inst	0x632e6275 ; undefined
   86b3c:	312d6d6f 	adds	w15, w11, #0xb5b
   86b40:	36636365 	tbz	w5, #12, 8d7ac <__stack_end__+0x516c>
   86b44:	64393932 	.inst	0x64393932 ; undefined
   86b48:	63653962 	.inst	0x63653962 ; undefined
   86b4c:	5c333238 	ldr	d24, ed190 <__heap_start+0x24190>
   86b50:	70737572 	adr	x18, 16d9ff <__heap_start+0xa49ff>
   86b54:	2d6f7269 	ldp	s9, s28, [x19, #-136]
   86b58:	746f6f62 	.inst	0x746f6f62 ; undefined
   86b5c:	352e302d 	cbnz	w13, e3160 <__heap_start+0x1a160>
   86b60:	735c332e 	.inst	0x735c332e ; undefined
   86b64:	655c6372 	fcmne	p2.h, p0/z, z27.h, z28.h
   86b68:	70656378 	adr	x24, 1517d7 <__heap_start+0x887d7>
   86b6c:	6e6f6974 	.inst	0x6e6f6974 ; undefined
   86b70:	4573722e 	subhnb	z14.b, z17.h, z19.h
   86b74:	74706578 	.inst	0x74706578 ; undefined
   86b78:	206e6f69 	.inst	0x206e6f69 ; undefined
   86b7c:	6370202d 	.inst	0x6370202d ; undefined
   86b80:	0000203a 	.inst	0x0000203a ; undefined
	...
   86b90:	00000002 	.inst	0x00000002 ; undefined
	...
   86ba0:	00000002 	.inst	0x00000002 ; undefined
	...
   86bb0:	00000020 	.inst	0x00000020 ; undefined
   86bb4:	00000004 	.inst	0x00000004 ; undefined
   86bb8:	00000003 	.inst	0x00000003 ; undefined
   86bbc:	00000000 	.inst	0x00000000 ; undefined
   86bc0:	00000001 	.inst	0x00000001 ; undefined
   86bc4:	00000000 	.inst	0x00000000 ; undefined
   86bc8:	00000002 	.inst	0x00000002 ; undefined
	...
   86bd8:	00000002 	.inst	0x00000002 ; undefined
	...
   86be8:	00000020 	.inst	0x00000020 ; undefined
   86bec:	00000004 	.inst	0x00000004 ; undefined
   86bf0:	00000003 	.inst	0x00000003 ; undefined
   86bf4:	00000000 	.inst	0x00000000 ; undefined
   86bf8:	00000002 	.inst	0x00000002 ; undefined
   86bfc:	00000000 	.inst	0x00000000 ; undefined
   86c00:	00000002 	.inst	0x00000002 ; undefined
	...
   86c10:	00000002 	.inst	0x00000002 ; undefined
	...
   86c20:	00000020 	.inst	0x00000020 ; undefined
   86c24:	00000004 	.inst	0x00000004 ; undefined
   86c28:	00000003 	.inst	0x00000003 ; undefined
	...
   86c38:	00000002 	.inst	0x00000002 ; undefined
	...
   86c48:	00000002 	.inst	0x00000002 ; undefined
	...
   86c58:	00000020 	.inst	0x00000020 ; undefined
   86c5c:	00000004 	.inst	0x00000004 ; undefined
   86c60:	00000003 	.inst	0x00000003 ; undefined
   86c64:	00000000 	.inst	0x00000000 ; undefined
   86c68:	61686e75 	.inst	0x61686e75 ; undefined
   86c6c:	656c646e 	fnmls	z14.h, p1/m, z3.h, z12.h
   86c70:	79732064 	ldrh	w4, [x3, #6544]
   86c74:	6520636e 	.inst	0x6520636e ; undefined
   86c78:	70656378 	adr	x24, 1518e7 <__heap_start+0x888e7>
   86c7c:	6e6f6974 	.inst	0x6e6f6974 ; undefined
   86c80:	204b5242 	.inst	0x204b5242 ; undefined
   86c84:	74736e69 	.inst	0x74736e69 ; undefined
   86c88:	74637572 	.inst	0x74637572 ; undefined
   86c8c:	446e6f69 	.inst	0x446e6f69 ; undefined
   86c90:	20617461 	.inst	0x20617461 ; undefined
   86c94:	726f6241 	.inst	0x726f6241 ; undefined
   86c98:	78452074 	ldurh	w20, [x3, #82]
   86c9c:	69747065 	ldpsw	x5, x28, [x3, #-96]
   86ca0:	2d206e6f 	stp	s15, s27, [x19, #-256]
   86ca4:	63614320 	.inst	0x63614320 ; undefined
   86ca8:	4d206568 	.inst	0x4d206568 ; undefined
   86cac:	746e6961 	.inst	0x746e6961 ; undefined
   86cb0:	6e616e65 	umin	v5.8h, v19.8h, v1.8h
   86cb4:	72576563 	.inst	0x72576563 ; undefined
   86cb8:	54657469 	b.ls	151b44 <__heap_start+0x88b44>  // b.plast
   86cbc:	736e6172 	.inst	0x736e6172 ; undefined
   86cc0:	6974616c 	ldpsw	x12, x24, [x11, #-96]
   86cc4:	4c206e6f 	.inst	0x4c206e6f ; undefined
   86cc8:	6c657665 	ldnp	d5, d29, [x19, #-432]
   86ccc:	72543020 	.inst	0x72543020 ; undefined
   86cd0:	6c736e61 	ldnp	d1, d27, [x19, #-208]
   86cd4:	6f697461 	uqshl	v1.2d, v3.2d, #41
   86cd8:	654c206e 	.inst	0x654c206e ; undefined
   86cdc:	206c6576 	.inst	0x206c6576 ; undefined
   86ce0:	61725431 	.inst	0x61725431 ; undefined
   86ce4:	616c736e 	.inst	0x616c736e ; undefined
   86ce8:	6e6f6974 	.inst	0x6e6f6974 ; undefined
   86cec:	76654c20 	.inst	0x76654c20 ; undefined
   86cf0:	32206c65 	orr	w5, w3, #0xfffffff
   86cf4:	6e617254 	uabdl2	v20.4s, v18.8h, v1.8h
   86cf8:	74616c73 	.inst	0x74616c73 ; undefined
   86cfc:	206e6f69 	.inst	0x206e6f69 ; undefined
   86d00:	6576654c 	fnmls	z12.h, p1/m, z10.h, z22.h
   86d04:	4133206c 	.inst	0x4133206c ; undefined
   86d08:	6e67696c 	.inst	0x6e67696c ; undefined
   86d0c:	746e656d 	.inst	0x746e656d ; undefined
   86d10:	75614620 	.inst	0x75614620 ; undefined
   86d14:	2d20746c 	stp	s12, s29, [x3, #-256]
   86d18:	52414620 	.inst	0x52414620 ; undefined
   86d1c:	202d2020 	.inst	0x202d2020 ; undefined
   86d20:	20524c45 	.inst	0x20524c45 ; undefined
	...
   86d30:	00000002 	.inst	0x00000002 ; undefined
	...
   86d40:	00000002 	.inst	0x00000002 ; undefined
	...
   86d50:	00000020 	.inst	0x00000020 ; undefined
   86d54:	00000004 	.inst	0x00000004 ; undefined
   86d58:	00000003 	.inst	0x00000003 ; undefined
   86d5c:	00000000 	.inst	0x00000000 ; undefined
   86d60:	00000001 	.inst	0x00000001 ; undefined
   86d64:	00000000 	.inst	0x00000000 ; undefined
   86d68:	00000002 	.inst	0x00000002 ; undefined
	...
   86d78:	00000002 	.inst	0x00000002 ; undefined
	...
   86d88:	00000020 	.inst	0x00000020 ; undefined
   86d8c:	00000004 	.inst	0x00000004 ; undefined
   86d90:	00000003 	.inst	0x00000003 ; undefined
   86d94:	00000000 	.inst	0x00000000 ; undefined
   86d98:	61746164 	.inst	0x61746164 ; undefined
   86d9c:	6f626120 	umlsl2	v0.4s, v9.8h, v2.h[2]
   86da0:	73207472 	.inst	0x73207472 ; undefined
   86da4:	20656d61 	.inst	0x20656d61 ; undefined
   86da8:	61644c45 	.inst	0x61644c45 ; undefined
   86dac:	61206174 	.inst	0x61206174 ; undefined
   86db0:	74726f62 	.inst	0x74726f62 ; undefined
   86db4:	776f6c20 	.inst	0x776f6c20 ; undefined
   86db8:	45207265 	.inst	0x45207265 ; undefined
   86dbc:	736e694c 	.inst	0x736e694c ; undefined
   86dc0:	63757274 	.inst	0x63757274 ; undefined
   86dc4:	6e6f6974 	.inst	0x6e6f6974 ; undefined
   86dc8:	6f626120 	umlsl2	v0.4s, v9.8h, v2.h[2]
   86dcc:	4d537472 	.inst	0x4d537472 ; undefined
   86dd0:	6e692043 	usubl2	v3.4s, v2.8h, v9.8h
   86dd4:	34366120 	cbz	w0, f39f8 <__heap_start+0x2a9f8>
   86dd8:	736e6920 	.inst	0x736e6920 ; undefined
   86ddc:	63757274 	.inst	0x63757274 ; undefined
   86de0:	6e6f6974 	.inst	0x6e6f6974 ; undefined
   86de4:	6c616320 	ldnp	d0, d24, [x25, #-496]
   86de8:	4864656c 	.inst	0x4864656c ; undefined
   86dec:	69204356 	stgp	x22, x16, [x26, #-1024]
   86df0:	3661206e 	tbz	w14, #12, 891fc <__stack_end__+0xbbc>
   86df4:	6e692034 	usubl2	v20.4s, v1.8h, v9.8h
   86df8:	75727473 	.inst	0x75727473 ; undefined
   86dfc:	6f697463 	uqshl	v3.2d, v3.2d, #41
   86e00:	6163206e 	.inst	0x6163206e ; undefined
   86e04:	64656c6c 	.inst	0x64656c6c ; undefined
   86e08:	20435653 	.inst	0x20435653 ; undefined
   86e0c:	61206e69 	.inst	0x61206e69 ; undefined
   86e10:	69203436 	stgp	x22, x13, [x1, #-1024]
   86e14:	7274736e 	.inst	0x7274736e ; undefined
   86e18:	69746375 	ldpsw	x21, x24, [x27, #-96]
   86e1c:	63206e6f 	.inst	0x63206e6f ; undefined
   86e20:	656c6c61 	fnmls	z1.h, p3/m, z3.h, z12.h
   86e24:	434d5364 	.inst	0x434d5364 ; undefined
   86e28:	206e6920 	.inst	0x206e6920 ; undefined
   86e2c:	20323361 	.inst	0x20323361 ; undefined
   86e30:	74736e69 	.inst	0x74736e69 ; undefined
   86e34:	74637572 	.inst	0x74637572 ; undefined
   86e38:	206e6f69 	.inst	0x206e6f69 ; undefined
   86e3c:	6c6c6163 	ldnp	d3, d24, [x11, #-320]
   86e40:	56486465 	.inst	0x56486465 ; undefined
   86e44:	6e692043 	usubl2	v3.4s, v2.8h, v9.8h
   86e48:	32336120 	orr	w0, w9, #0xffffe03f
   86e4c:	736e6920 	.inst	0x736e6920 ; undefined
   86e50:	63757274 	.inst	0x63757274 ; undefined
   86e54:	6e6f6974 	.inst	0x6e6f6974 ; undefined
   86e58:	6c616320 	ldnp	d0, d24, [x25, #-496]
   86e5c:	5364656c 	.inst	0x5364656c ; undefined
   86e60:	69204356 	stgp	x22, x16, [x26, #-1024]
   86e64:	3361206e 	.inst	0x3361206e ; undefined
   86e68:	6e692032 	usubl2	v18.4s, v1.8h, v9.8h
   86e6c:	75727473 	.inst	0x75727473 ; undefined
   86e70:	6f697463 	uqshl	v3.2d, v3.2d, #41
   86e74:	6163206e 	.inst	0x6163206e ; undefined
   86e78:	64656c6c 	.inst	0x64656c6c ; undefined
   86e7c:	6e6b6e55 	umin	v21.8h, v18.8h, v11.8h
   86e80:	206e776f 	.inst	0x206e776f ; undefined
   86e84:	73616552 	.inst	0x73616552 ; undefined
   86e88:	Address 0x0000000000086e88 is out of bounds.


Disassembly of section .eh_frame_hdr:

0000000000086e8c <.eh_frame_hdr>:
   86e8c:	3b031b01 	.inst	0x3b031b01 ; undefined
   86e90:	00000010 	.inst	0x00000010 ; undefined
   86e94:	00000001 	.inst	0x00000001 ; undefined
   86e98:	ffff9494 	.inst	0xffff9494 ; undefined
   86e9c:	0000002c 	.inst	0x0000002c ; undefined

Disassembly of section .eh_frame:

0000000000086ea0 <.eh_frame>:
   86ea0:	00000014 	.inst	0x00000014 ; undefined
   86ea4:	00000000 	.inst	0x00000000 ; undefined
   86ea8:	00527a01 	.inst	0x00527a01 ; undefined
   86eac:	011e7c01 	.inst	0x011e7c01 ; undefined
   86eb0:	001f0c1b 	.inst	0x001f0c1b ; undefined
   86eb4:	00000000 	.inst	0x00000000 ; undefined
   86eb8:	00000014 	.inst	0x00000014 ; undefined
   86ebc:	0000001c 	.inst	0x0000001c ; undefined
   86ec0:	ffff9460 	.inst	0xffff9460 ; undefined
   86ec4:	00000004 	.inst	0x00000004 ; undefined
	...

Disassembly of section .got:

0000000000086ed8 <.got>:
   86ed8:	00081aa0 	.inst	0x00081aa0 ; undefined
   86edc:	00000000 	.inst	0x00000000 ; undefined
   86ee0:	00083610 	.inst	0x00083610 ; undefined
   86ee4:	00000000 	.inst	0x00000000 ; undefined
   86ee8:	00087058 	.inst	0x00087058 ; undefined
   86eec:	00000000 	.inst	0x00000000 ; undefined
   86ef0:	00081930 	.inst	0x00081930 ; undefined
   86ef4:	00000000 	.inst	0x00000000 ; undefined
   86ef8:	00080ff0 	.inst	0x00080ff0 ; undefined
   86efc:	00000000 	.inst	0x00000000 ; undefined
   86f00:	00080f60 	.inst	0x00080f60 ; undefined
   86f04:	00000000 	.inst	0x00000000 ; undefined

Disassembly of section .bss:

0000000000086f08 <__bss_start__>:
	...

0000000000086f38 <_ZN17ruspiro_allocator6memory10HEAP_START17h57ec554f81a23a73E.llvm.11995692481347540951>:
	...

0000000000086f40 <_ZN17ruspiro_allocator6memory12FREE_BUCKETS17h862d300f99d834deE.llvm.11995692481347540951>:
	...

0000000000087050 <_ZN3log5STATE17ha9bbf83daa689e63E>:
	...

0000000000087058 <_ZN3log20MAX_LOG_LEVEL_FILTER17h7ea526c383d68be3E>:
	...

Disassembly of section .data:

0000000000087060 <anon.aa99a32212951cb336354cf2f8afd4c4.1.llvm.16224240196047894230>:
   87060:	00085820 	.inst	0x00085820 ; undefined
   87064:	00000000 	.inst	0x00000000 ; undefined
   87068:	00000066 	.inst	0x00000066 ; undefined
   8706c:	00000000 	.inst	0x00000000 ; undefined
   87070:	0000008d 	.inst	0x0000008d ; undefined
   87074:	0000001c 	.inst	0x0000001c ; undefined
   87078:	00080390 	.inst	0x00080390 ; undefined
	...
   87088:	00000001 	.inst	0x00000001 ; undefined
   8708c:	00000000 	.inst	0x00000000 ; undefined
   87090:	00081c10 	.inst	0x00081c10 ; undefined
   87094:	00000000 	.inst	0x00000000 ; undefined
   87098:	00080390 	.inst	0x00080390 ; undefined
	...
   870a8:	00000001 	.inst	0x00000001 ; undefined
   870ac:	00000000 	.inst	0x00000000 ; undefined
   870b0:	00081c30 	.inst	0x00081c30 ; undefined
   870b4:	00000000 	.inst	0x00000000 ; undefined
   870b8:	00085a1d 	.inst	0x00085a1d ; undefined
   870bc:	00000000 	.inst	0x00000000 ; undefined
   870c0:	00000061 	.inst	0x00000061 ; undefined
   870c4:	00000000 	.inst	0x00000000 ; undefined
   870c8:	0000008d 	.inst	0x0000008d ; undefined
   870cc:	00000005 	.inst	0x00000005 ; undefined
   870d0:	00085a1d 	.inst	0x00085a1d ; undefined
   870d4:	00000000 	.inst	0x00000000 ; undefined
   870d8:	00000061 	.inst	0x00000061 ; undefined
   870dc:	00000000 	.inst	0x00000000 ; undefined
   870e0:	00000096 	.inst	0x00000096 ; undefined
   870e4:	00000022 	.inst	0x00000022 ; undefined
   870e8:	00085a1d 	.inst	0x00085a1d ; undefined
   870ec:	00000000 	.inst	0x00000000 ; undefined
   870f0:	00000061 	.inst	0x00000061 ; undefined
   870f4:	00000000 	.inst	0x00000000 ; undefined
   870f8:	000000d8 	.inst	0x000000d8 ; undefined
   870fc:	00000014 	.inst	0x00000014 ; undefined

0000000000087100 <_ZN17ruspiro_interrupt8ISR_LIST17h156e26dbb2609d59E>:
   87100:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87118:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87130:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87148:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87160:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87178:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87190:	000808e0 	.inst	0x000808e0 ; undefined
	...
   871a8:	000808e0 	.inst	0x000808e0 ; undefined
	...
   871c0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   871d8:	000808e0 	.inst	0x000808e0 ; undefined
	...
   871f0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87208:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87220:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87238:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87250:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87268:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87280:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87298:	000808e0 	.inst	0x000808e0 ; undefined
	...
   872b0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   872c8:	000808e0 	.inst	0x000808e0 ; undefined
	...
   872e0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   872f8:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87310:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87328:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87340:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87358:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87370:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87388:	000808e0 	.inst	0x000808e0 ; undefined
	...
   873a0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   873b8:	00080a40 	.inst	0x00080a40 ; undefined
	...
   873d0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   873e8:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87400:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87418:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87430:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87448:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87460:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87478:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87490:	000808e0 	.inst	0x000808e0 ; undefined
	...
   874a8:	000808e0 	.inst	0x000808e0 ; undefined
	...
   874c0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   874d8:	000808e0 	.inst	0x000808e0 ; undefined
	...
   874f0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87508:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87520:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87538:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87550:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87568:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87580:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87598:	000808e0 	.inst	0x000808e0 ; undefined
	...
   875b0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   875c8:	000808e0 	.inst	0x000808e0 ; undefined
	...
   875e0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   875f8:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87610:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87628:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87640:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87658:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87670:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87688:	000808e0 	.inst	0x000808e0 ; undefined
	...
   876a0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   876b8:	000808e0 	.inst	0x000808e0 ; undefined
	...
   876d0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   876e8:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87700:	000802d0 	.inst	0x000802d0 ; undefined
	...
   87718:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87730:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87748:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87760:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87778:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87790:	000808e0 	.inst	0x000808e0 ; undefined
	...
   877a8:	000808e0 	.inst	0x000808e0 ; undefined
	...
   877c0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   877d8:	000808e0 	.inst	0x000808e0 ; undefined
	...
   877f0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87808:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87820:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87838:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87850:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87868:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87880:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87898:	000808e0 	.inst	0x000808e0 ; undefined
	...
   878b0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   878c8:	000808e0 	.inst	0x000808e0 ; undefined
	...
   878e0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   878f8:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87910:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87928:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87940:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87958:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87970:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87988:	000808e0 	.inst	0x000808e0 ; undefined
	...
   879a0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   879b8:	000808e0 	.inst	0x000808e0 ; undefined
	...
   879d0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   879e8:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87a00:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87a18:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87a30:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87a48:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87a60:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87a78:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87a90:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87aa8:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87ac0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87ad8:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87af0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87b08:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87b20:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87b38:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87b50:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87b68:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87b80:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87b98:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87bb0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87bc8:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87be0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87bf8:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87c10:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87c28:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87c40:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87c58:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87c70:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87c88:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87ca0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87cb8:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87cd0:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87ce8:	000808e0 	.inst	0x000808e0 ; undefined
	...
   87d00:	00080a30 	.inst	0x00080a30 ; undefined
	...
   87d10:	00000001 	.inst	0x00000001 ; undefined
   87d14:	00000000 	.inst	0x00000000 ; undefined
   87d18:	00081c10 	.inst	0x00081c10 ; undefined
   87d1c:	00000000 	.inst	0x00000000 ; undefined
   87d20:	00085aa6 	.inst	0x00085aa6 ; undefined
   87d24:	00000000 	.inst	0x00000000 ; undefined
   87d28:	00000068 	.inst	0x00000068 ; undefined
   87d2c:	00000000 	.inst	0x00000000 ; undefined
   87d30:	0000002b 	.inst	0x0000002b ; undefined
   87d34:	00000021 	.inst	0x00000021 ; undefined
   87d38:	00085aa6 	.inst	0x00085aa6 ; undefined
   87d3c:	00000000 	.inst	0x00000000 ; undefined
   87d40:	00000068 	.inst	0x00000068 ; undefined
   87d44:	00000000 	.inst	0x00000000 ; undefined
   87d48:	00000030 	.inst	0x00000030 ; undefined
   87d4c:	00000020 	.inst	0x00000020 ; undefined
   87d50:	00085aa6 	.inst	0x00085aa6 ; undefined
   87d54:	00000000 	.inst	0x00000000 ; undefined
   87d58:	00000068 	.inst	0x00000068 ; undefined
   87d5c:	00000000 	.inst	0x00000000 ; undefined
   87d60:	00000035 	.inst	0x00000035 ; undefined
   87d64:	00000020 	.inst	0x00000020 ; undefined

0000000000087d68 <anon.3fff2b7ea07e7690419720c412031537.1.llvm.11380368779637635400>:
   87d68:	00085b0e 	.inst	0x00085b0e ; undefined
   87d6c:	00000000 	.inst	0x00000000 ; undefined
   87d70:	00000066 	.inst	0x00000066 ; undefined
   87d74:	00000000 	.inst	0x00000000 ; undefined
   87d78:	0000008d 	.inst	0x0000008d ; undefined
   87d7c:	0000001c 	.inst	0x0000001c ; undefined

0000000000087d80 <anon.a832095947016363f6bc3bcfd8d398ed.2.llvm.11995692481347540951>:
   87d80:	00085b9f 	.inst	0x00085b9f ; undefined
   87d84:	00000000 	.inst	0x00000000 ; undefined
   87d88:	00000075 	.inst	0x00000075 ; undefined
   87d8c:	00000000 	.inst	0x00000000 ; undefined
   87d90:	00000984 	.inst	0x00000984 ; undefined
   87d94:	0000001d 	.inst	0x0000001d ; undefined

0000000000087d98 <anon.a832095947016363f6bc3bcfd8d398ed.10.llvm.11995692481347540951>:
   87d98:	00085c48 	.inst	0x00085c48 ; undefined
   87d9c:	00000000 	.inst	0x00000000 ; undefined
   87da0:	00000064 	.inst	0x00000064 ; undefined
   87da4:	00000000 	.inst	0x00000000 ; undefined
   87da8:	00000132 	.inst	0x00000132 ; undefined
   87dac:	00000003 	.inst	0x00000003 ; undefined

0000000000087db0 <anon.a832095947016363f6bc3bcfd8d398ed.11.llvm.11995692481347540951>:
   87db0:	00085c48 	.inst	0x00085c48 ; undefined
   87db4:	00000000 	.inst	0x00000000 ; undefined
   87db8:	00000064 	.inst	0x00000064 ; undefined
   87dbc:	00000000 	.inst	0x00000000 ; undefined
   87dc0:	00000154 	.inst	0x00000154 ; undefined
   87dc4:	0000001c 	.inst	0x0000001c ; undefined

0000000000087dc8 <anon.a832095947016363f6bc3bcfd8d398ed.12.llvm.11995692481347540951>:
   87dc8:	00085c48 	.inst	0x00085c48 ; undefined
   87dcc:	00000000 	.inst	0x00000000 ; undefined
   87dd0:	00000064 	.inst	0x00000064 ; undefined
   87dd4:	00000000 	.inst	0x00000000 ; undefined
   87dd8:	00000159 	.inst	0x00000159 ; undefined
   87ddc:	00000008 	.inst	0x00000008 ; undefined

0000000000087de0 <anon.788176469029eed6706ecead79b9694d.1.llvm.8937437104277805671>:
   87de0:	00085cda 	.inst	0x00085cda ; undefined
   87de4:	00000000 	.inst	0x00000000 ; undefined
   87de8:	00000071 	.inst	0x00000071 ; undefined
   87dec:	00000000 	.inst	0x00000000 ; undefined
   87df0:	00000065 	.inst	0x00000065 ; undefined
   87df4:	00000014 	.inst	0x00000014 ; undefined
   87df8:	00085e17 	.inst	0x00085e17 ; undefined
   87dfc:	00000000 	.inst	0x00000000 ; undefined
   87e00:	00000012 	.inst	0x00000012 ; undefined
   87e04:	00000000 	.inst	0x00000000 ; undefined
   87e08:	00085e29 	.inst	0x00085e29 ; undefined
   87e0c:	00000000 	.inst	0x00000000 ; undefined
   87e10:	00000022 	.inst	0x00000022 ; undefined
   87e14:	00000000 	.inst	0x00000000 ; undefined
   87e18:	000859c0 	.inst	0x000859c0 ; undefined
   87e1c:	00000000 	.inst	0x00000000 ; undefined
   87e20:	00000010 	.inst	0x00000010 ; undefined
   87e24:	00000000 	.inst	0x00000000 ; undefined
   87e28:	00085e29 	.inst	0x00085e29 ; undefined
   87e2c:	00000000 	.inst	0x00000000 ; undefined
   87e30:	00000022 	.inst	0x00000022 ; undefined
   87e34:	00000000 	.inst	0x00000000 ; undefined
   87e38:	00085e4b 	.inst	0x00085e4b ; undefined
   87e3c:	00000000 	.inst	0x00000000 ; undefined
   87e40:	00000016 	.inst	0x00000016 ; undefined
   87e44:	00000000 	.inst	0x00000000 ; undefined
   87e48:	00085e61 	.inst	0x00085e61 ; undefined
   87e4c:	00000000 	.inst	0x00000000 ; undefined
   87e50:	0000000d 	.inst	0x0000000d ; undefined
   87e54:	00000000 	.inst	0x00000000 ; undefined

0000000000087e58 <anon.b2eb45f66a0b759930b184b68fba7a80.59.llvm.111400220230659385>:
   87e58:	00085e6e 	.inst	0x00085e6e ; undefined
   87e5c:	00000000 	.inst	0x00000000 ; undefined
   87e60:	0000007e 	.inst	0x0000007e ; undefined
   87e64:	00000000 	.inst	0x00000000 ; undefined
   87e68:	0000004b 	.inst	0x0000004b ; undefined
   87e6c:	00000028 	.inst	0x00000028 ; undefined

0000000000087e70 <anon.b2eb45f66a0b759930b184b68fba7a80.60.llvm.111400220230659385>:
   87e70:	00085e6e 	.inst	0x00085e6e ; undefined
   87e74:	00000000 	.inst	0x00000000 ; undefined
   87e78:	0000007e 	.inst	0x0000007e ; undefined
   87e7c:	00000000 	.inst	0x00000000 ; undefined
   87e80:	00000057 	.inst	0x00000057 ; undefined
   87e84:	00000016 	.inst	0x00000016 ; undefined

0000000000087e88 <anon.b2eb45f66a0b759930b184b68fba7a80.61.llvm.111400220230659385>:
   87e88:	00085e6e 	.inst	0x00085e6e ; undefined
   87e8c:	00000000 	.inst	0x00000000 ; undefined
   87e90:	0000007e 	.inst	0x0000007e ; undefined
   87e94:	00000000 	.inst	0x00000000 ; undefined
   87e98:	00000052 	.inst	0x00000052 ; undefined
   87e9c:	0000003e 	.inst	0x0000003e ; undefined
   87ea0:	00086220 	.inst	0x00086220 ; undefined
   87ea4:	00000000 	.inst	0x00000000 ; undefined
   87ea8:	00000002 	.inst	0x00000002 ; undefined
   87eac:	00000000 	.inst	0x00000000 ; undefined
   87eb0:	0008624d 	.inst	0x0008624d ; undefined
   87eb4:	00000000 	.inst	0x00000000 ; undefined
   87eb8:	0000007b 	.inst	0x0000007b ; undefined
   87ebc:	00000000 	.inst	0x00000000 ; undefined
   87ec0:	0000000a 	.inst	0x0000000a ; undefined
   87ec4:	0000001c 	.inst	0x0000001c ; undefined
   87ec8:	0008624d 	.inst	0x0008624d ; undefined
   87ecc:	00000000 	.inst	0x00000000 ; undefined
   87ed0:	0000007b 	.inst	0x0000007b ; undefined
   87ed4:	00000000 	.inst	0x00000000 ; undefined
   87ed8:	0000001a 	.inst	0x0000001a ; undefined
   87edc:	00000036 	.inst	0x00000036 ; undefined
   87ee0:	00086853 	.inst	0x00086853 ; undefined
	...
   87ef0:	00086853 	.inst	0x00086853 ; undefined
   87ef4:	00000000 	.inst	0x00000000 ; undefined
   87ef8:	00000002 	.inst	0x00000002 ; undefined
   87efc:	00000000 	.inst	0x00000000 ; undefined
   87f00:	00086855 	.inst	0x00086855 ; undefined
   87f04:	00000000 	.inst	0x00000000 ; undefined
   87f08:	00000079 	.inst	0x00000079 ; undefined
   87f0c:	00000000 	.inst	0x00000000 ; undefined
   87f10:	00000111 	.inst	0x00000111 ; undefined
   87f14:	00000011 	.inst	0x00000011 ; undefined
   87f18:	000868d3 	.inst	0x000868d3 ; undefined
   87f1c:	00000000 	.inst	0x00000000 ; undefined
   87f20:	0000000b 	.inst	0x0000000b ; undefined
   87f24:	00000000 	.inst	0x00000000 ; undefined
   87f28:	000868de 	.inst	0x000868de ; undefined
   87f2c:	00000000 	.inst	0x00000000 ; undefined
   87f30:	00000016 	.inst	0x00000016 ; undefined
   87f34:	00000000 	.inst	0x00000000 ; undefined
   87f38:	000868f4 	.inst	0x000868f4 ; undefined
   87f3c:	00000000 	.inst	0x00000000 ; undefined
   87f40:	00000001 	.inst	0x00000001 ; undefined
   87f44:	00000000 	.inst	0x00000000 ; undefined
   87f48:	000868f5 	.inst	0x000868f5 ; undefined
   87f4c:	00000000 	.inst	0x00000000 ; undefined
   87f50:	0000000e 	.inst	0x0000000e ; undefined
   87f54:	00000000 	.inst	0x00000000 ; undefined
   87f58:	00086903 	.inst	0x00086903 ; undefined
   87f5c:	00000000 	.inst	0x00000000 ; undefined
   87f60:	00000004 	.inst	0x00000004 ; undefined
   87f64:	00000000 	.inst	0x00000000 ; undefined
   87f68:	00085990 	.inst	0x00085990 ; undefined
   87f6c:	00000000 	.inst	0x00000000 ; undefined
   87f70:	00000010 	.inst	0x00000010 ; undefined
   87f74:	00000000 	.inst	0x00000000 ; undefined
   87f78:	000868f4 	.inst	0x000868f4 ; undefined
   87f7c:	00000000 	.inst	0x00000000 ; undefined
   87f80:	00000001 	.inst	0x00000001 ; undefined
   87f84:	00000000 	.inst	0x00000000 ; undefined
   87f88:	000868d3 	.inst	0x000868d3 ; undefined
   87f8c:	00000000 	.inst	0x00000000 ; undefined
   87f90:	0000000b 	.inst	0x0000000b ; undefined
   87f94:	00000000 	.inst	0x00000000 ; undefined
   87f98:	0008690b 	.inst	0x0008690b ; undefined
   87f9c:	00000000 	.inst	0x00000000 ; undefined
   87fa0:	00000026 	.inst	0x00000026 ; undefined
   87fa4:	00000000 	.inst	0x00000000 ; undefined
   87fa8:	000858c8 	.inst	0x000858c8 ; undefined
   87fac:	00000000 	.inst	0x00000000 ; undefined
   87fb0:	00000008 	.inst	0x00000008 ; undefined
   87fb4:	00000000 	.inst	0x00000000 ; undefined
   87fb8:	00086931 	.inst	0x00086931 ; undefined
   87fbc:	00000000 	.inst	0x00000000 ; undefined
   87fc0:	00000006 	.inst	0x00000006 ; undefined
   87fc4:	00000000 	.inst	0x00000000 ; undefined
   87fc8:	000868f4 	.inst	0x000868f4 ; undefined
   87fcc:	00000000 	.inst	0x00000000 ; undefined
   87fd0:	00000001 	.inst	0x00000001 ; undefined
   87fd4:	00000000 	.inst	0x00000000 ; undefined
   87fd8:	00082270 	.inst	0x00082270 ; undefined
	...
   87fe8:	00000001 	.inst	0x00000001 ; undefined
   87fec:	00000000 	.inst	0x00000000 ; undefined
   87ff0:	00082240 	.inst	0x00082240 ; undefined
   87ff4:	00000000 	.inst	0x00000000 ; undefined
   87ff8:	00086938 	.inst	0x00086938 ; undefined
   87ffc:	00000000 	.inst	0x00000000 ; undefined
   88000:	00000020 	.inst	0x00000020 ; undefined
   88004:	00000000 	.inst	0x00000000 ; undefined
   88008:	00086958 	.inst	0x00086958 ; undefined
   8800c:	00000000 	.inst	0x00000000 ; undefined
   88010:	00000012 	.inst	0x00000012 ; undefined
   88014:	00000000 	.inst	0x00000000 ; undefined
   88018:	000859a0 	.inst	0x000859a0 ; undefined
   8801c:	00000000 	.inst	0x00000000 ; undefined
   88020:	00000010 	.inst	0x00000010 ; undefined
   88024:	00000000 	.inst	0x00000000 ; undefined
   88028:	00086970 	.inst	0x00086970 ; undefined
   8802c:	00000000 	.inst	0x00000000 ; undefined
   88030:	00000013 	.inst	0x00000013 ; undefined
   88034:	00000000 	.inst	0x00000000 ; undefined
   88038:	00086970 	.inst	0x00086970 ; undefined
   8803c:	00000000 	.inst	0x00000000 ; undefined
   88040:	00000013 	.inst	0x00000013 ; undefined
   88044:	00000000 	.inst	0x00000000 ; undefined
   88048:	00086983 	.inst	0x00086983 ; undefined
   8804c:	00000000 	.inst	0x00000000 ; undefined
   88050:	0000005e 	.inst	0x0000005e ; undefined
   88054:	00000000 	.inst	0x00000000 ; undefined
   88058:	00000020 	.inst	0x00000020 ; undefined
   8805c:	00000000 	.inst	0x00000000 ; undefined
   88060:	000869e1 	.inst	0x000869e1 ; undefined
   88064:	00000000 	.inst	0x00000000 ; undefined
   88068:	00000009 	.inst	0x00000009 ; undefined
   8806c:	00000000 	.inst	0x00000000 ; undefined
   88070:	000869ea 	.inst	0x000869ea ; undefined
   88074:	00000000 	.inst	0x00000000 ; undefined
   88078:	00000002 	.inst	0x00000002 ; undefined
   8807c:	00000000 	.inst	0x00000000 ; undefined
   88080:	000869ec 	.inst	0x000869ec ; undefined
   88084:	00000000 	.inst	0x00000000 ; undefined
   88088:	00000001 	.inst	0x00000001 ; undefined
   8808c:	00000000 	.inst	0x00000000 ; undefined
   88090:	00086970 	.inst	0x00086970 ; undefined
   88094:	00000000 	.inst	0x00000000 ; undefined
   88098:	00000013 	.inst	0x00000013 ; undefined
   8809c:	00000000 	.inst	0x00000000 ; undefined
   880a0:	00086970 	.inst	0x00086970 ; undefined
   880a4:	00000000 	.inst	0x00000000 ; undefined
   880a8:	00000013 	.inst	0x00000013 ; undefined
   880ac:	00000000 	.inst	0x00000000 ; undefined
   880b0:	00086983 	.inst	0x00086983 ; undefined
   880b4:	00000000 	.inst	0x00000000 ; undefined
   880b8:	0000005e 	.inst	0x0000005e ; undefined
   880bc:	00000000 	.inst	0x00000000 ; undefined
   880c0:	00000019 	.inst	0x00000019 ; undefined
   880c4:	00000000 	.inst	0x00000000 ; undefined
   880c8:	00082450 	.inst	0x00082450 ; undefined
	...
   880d8:	00000001 	.inst	0x00000001 ; undefined
   880dc:	00000000 	.inst	0x00000000 ; undefined
   880e0:	00082450 	.inst	0x00082450 ; undefined
	...
   880f0:	00000001 	.inst	0x00000001 ; undefined
   880f4:	00000000 	.inst	0x00000000 ; undefined
   880f8:	000880c8 	.inst	0x000880c8 ; undefined
   880fc:	00000000 	.inst	0x00000000 ; undefined
   88100:	00082460 	.inst	0x00082460 ; undefined
   88104:	00000000 	.inst	0x00000000 ; undefined
   88108:	00082470 	.inst	0x00082470 ; undefined
   8810c:	00000000 	.inst	0x00000000 ; undefined
   88110:	00082480 	.inst	0x00082480 ; undefined
   88114:	00000000 	.inst	0x00000000 ; undefined

0000000000088118 <_ZN3log6LOGGER17h560bca14e6f52766E>:
   88118:	000869f0 	.inst	0x000869f0 ; undefined
   8811c:	00000000 	.inst	0x00000000 ; undefined
   88120:	000880e0 	.inst	0x000880e0 ; undefined
   88124:	00000000 	.inst	0x00000000 ; undefined
   88128:	00086a3d 	.inst	0x00086a3d ; undefined
   8812c:	00000000 	.inst	0x00000000 ; undefined
   88130:	00000071 	.inst	0x00000071 ; undefined
   88134:	00000000 	.inst	0x00000000 ; undefined
   88138:	00000855 	.inst	0x00000855 ; undefined
   8813c:	0000001e 	.inst	0x0000001e ; undefined
   88140:	00086a3d 	.inst	0x00086a3d ; undefined
   88144:	00000000 	.inst	0x00000000 ; undefined
   88148:	00000071 	.inst	0x00000071 ; undefined
   8814c:	00000000 	.inst	0x00000000 ; undefined
   88150:	0000085c 	.inst	0x0000085c ; undefined
   88154:	00000016 	.inst	0x00000016 ; undefined
   88158:	00086ae8 	.inst	0x00086ae8 ; undefined
   8815c:	00000000 	.inst	0x00000000 ; undefined
   88160:	00000012 	.inst	0x00000012 ; undefined
   88164:	00000000 	.inst	0x00000000 ; undefined
   88168:	00086afa 	.inst	0x00086afa ; undefined
   8816c:	00000000 	.inst	0x00000000 ; undefined
   88170:	00000017 	.inst	0x00000017 ; undefined
   88174:	00000000 	.inst	0x00000000 ; undefined
   88178:	00086afa 	.inst	0x00086afa ; undefined
   8817c:	00000000 	.inst	0x00000000 ; undefined
   88180:	00000017 	.inst	0x00000017 ; undefined
   88184:	00000000 	.inst	0x00000000 ; undefined
   88188:	00086b11 	.inst	0x00086b11 ; undefined
   8818c:	00000000 	.inst	0x00000000 ; undefined
   88190:	00000062 	.inst	0x00000062 ; undefined
   88194:	00000000 	.inst	0x00000000 ; undefined
   88198:	0000008c 	.inst	0x0000008c ; undefined
   8819c:	00000000 	.inst	0x00000000 ; undefined
   881a0:	00086b73 	.inst	0x00086b73 ; undefined
   881a4:	00000000 	.inst	0x00000000 ; undefined
   881a8:	0000000f 	.inst	0x0000000f ; undefined
   881ac:	00000000 	.inst	0x00000000 ; undefined
   881b0:	00085958 	.inst	0x00085958 ; undefined
   881b4:	00000000 	.inst	0x00000000 ; undefined
   881b8:	00000008 	.inst	0x00000008 ; undefined
   881bc:	00000000 	.inst	0x00000000 ; undefined
   881c0:	00085968 	.inst	0x00085968 ; undefined
   881c4:	00000000 	.inst	0x00000000 ; undefined
   881c8:	00000008 	.inst	0x00000008 ; undefined
   881cc:	00000000 	.inst	0x00000000 ; undefined
   881d0:	00086afa 	.inst	0x00086afa ; undefined
   881d4:	00000000 	.inst	0x00000000 ; undefined
   881d8:	00000017 	.inst	0x00000017 ; undefined
   881dc:	00000000 	.inst	0x00000000 ; undefined
   881e0:	00086afa 	.inst	0x00086afa ; undefined
   881e4:	00000000 	.inst	0x00000000 ; undefined
   881e8:	00000017 	.inst	0x00000017 ; undefined
   881ec:	00000000 	.inst	0x00000000 ; undefined
   881f0:	00086b11 	.inst	0x00086b11 ; undefined
   881f4:	00000000 	.inst	0x00000000 ; undefined
   881f8:	00000062 	.inst	0x00000062 ; undefined
   881fc:	00000000 	.inst	0x00000000 ; undefined
   88200:	00000041 	.inst	0x00000041 ; undefined
   88204:	00000000 	.inst	0x00000000 ; undefined
   88208:	000858e0 	.inst	0x000858e0 ; undefined
   8820c:	00000000 	.inst	0x00000000 ; undefined
   88210:	00000008 	.inst	0x00000008 ; undefined
   88214:	00000000 	.inst	0x00000000 ; undefined
   88218:	00086afa 	.inst	0x00086afa ; undefined
   8821c:	00000000 	.inst	0x00000000 ; undefined
   88220:	00000017 	.inst	0x00000017 ; undefined
   88224:	00000000 	.inst	0x00000000 ; undefined
   88228:	00086afa 	.inst	0x00086afa ; undefined
   8822c:	00000000 	.inst	0x00000000 ; undefined
   88230:	00000017 	.inst	0x00000017 ; undefined
   88234:	00000000 	.inst	0x00000000 ; undefined
   88238:	00086b11 	.inst	0x00086b11 ; undefined
   8823c:	00000000 	.inst	0x00000000 ; undefined
   88240:	00000062 	.inst	0x00000062 ; undefined
   88244:	00000000 	.inst	0x00000000 ; undefined
   88248:	00000046 	.inst	0x00000046 ; undefined
   8824c:	00000000 	.inst	0x00000000 ; undefined
   88250:	00086b11 	.inst	0x00086b11 ; undefined
   88254:	00000000 	.inst	0x00000000 ; undefined
   88258:	00000062 	.inst	0x00000062 ; undefined
   8825c:	00000000 	.inst	0x00000000 ; undefined
   88260:	00000085 	.inst	0x00000085 ; undefined
   88264:	0000000e 	.inst	0x0000000e ; undefined
   88268:	00086c80 	.inst	0x00086c80 ; undefined
   8826c:	00000000 	.inst	0x00000000 ; undefined
   88270:	0000000f 	.inst	0x0000000f ; undefined
   88274:	00000000 	.inst	0x00000000 ; undefined
   88278:	00086afa 	.inst	0x00086afa ; undefined
   8827c:	00000000 	.inst	0x00000000 ; undefined
   88280:	00000017 	.inst	0x00000017 ; undefined
   88284:	00000000 	.inst	0x00000000 ; undefined
   88288:	00086afa 	.inst	0x00086afa ; undefined
   8828c:	00000000 	.inst	0x00000000 ; undefined
   88290:	00000017 	.inst	0x00000017 ; undefined
   88294:	00000000 	.inst	0x00000000 ; undefined
   88298:	00086b11 	.inst	0x00086b11 ; undefined
   8829c:	00000000 	.inst	0x00000000 ; undefined
   882a0:	00000062 	.inst	0x00000062 ; undefined
   882a4:	00000000 	.inst	0x00000000 ; undefined
   882a8:	00000082 	.inst	0x00000082 ; undefined
   882ac:	00000000 	.inst	0x00000000 ; undefined
   882b0:	00086c8f 	.inst	0x00086c8f ; undefined
   882b4:	00000000 	.inst	0x00000000 ; undefined
   882b8:	00000016 	.inst	0x00000016 ; undefined
   882bc:	00000000 	.inst	0x00000000 ; undefined
   882c0:	00086afa 	.inst	0x00086afa ; undefined
   882c4:	00000000 	.inst	0x00000000 ; undefined
   882c8:	00000017 	.inst	0x00000017 ; undefined
   882cc:	00000000 	.inst	0x00000000 ; undefined
   882d0:	00086afa 	.inst	0x00086afa ; undefined
   882d4:	00000000 	.inst	0x00000000 ; undefined
   882d8:	00000017 	.inst	0x00000017 ; undefined
   882dc:	00000000 	.inst	0x00000000 ; undefined
   882e0:	00086b11 	.inst	0x00086b11 ; undefined
   882e4:	00000000 	.inst	0x00000000 ; undefined
   882e8:	00000062 	.inst	0x00000062 ; undefined
   882ec:	00000000 	.inst	0x00000000 ; undefined
   882f0:	00000065 	.inst	0x00000065 ; undefined
   882f4:	00000000 	.inst	0x00000000 ; undefined
   882f8:	00086ca5 	.inst	0x00086ca5 ; undefined
   882fc:	00000000 	.inst	0x00000000 ; undefined
   88300:	00000011 	.inst	0x00000011 ; undefined
   88304:	00000000 	.inst	0x00000000 ; undefined
   88308:	00086afa 	.inst	0x00086afa ; undefined
   8830c:	00000000 	.inst	0x00000000 ; undefined
   88310:	00000017 	.inst	0x00000017 ; undefined
   88314:	00000000 	.inst	0x00000000 ; undefined
   88318:	00086afa 	.inst	0x00086afa ; undefined
   8831c:	00000000 	.inst	0x00000000 ; undefined
   88320:	00000017 	.inst	0x00000017 ; undefined
   88324:	00000000 	.inst	0x00000000 ; undefined
   88328:	00086b11 	.inst	0x00086b11 ; undefined
   8832c:	00000000 	.inst	0x00000000 ; undefined
   88330:	00000062 	.inst	0x00000062 ; undefined
   88334:	00000000 	.inst	0x00000000 ; undefined
   88338:	00000067 	.inst	0x00000067 ; undefined
   8833c:	00000000 	.inst	0x00000000 ; undefined
   88340:	00086cb6 	.inst	0x00086cb6 ; undefined
   88344:	00000000 	.inst	0x00000000 ; undefined
   88348:	00000005 	.inst	0x00000005 ; undefined
   8834c:	00000000 	.inst	0x00000000 ; undefined
   88350:	00086afa 	.inst	0x00086afa ; undefined
   88354:	00000000 	.inst	0x00000000 ; undefined
   88358:	00000017 	.inst	0x00000017 ; undefined
   8835c:	00000000 	.inst	0x00000000 ; undefined
   88360:	00086afa 	.inst	0x00086afa ; undefined
   88364:	00000000 	.inst	0x00000000 ; undefined
   88368:	00000017 	.inst	0x00000017 ; undefined
   8836c:	00000000 	.inst	0x00000000 ; undefined
   88370:	00086b11 	.inst	0x00086b11 ; undefined
   88374:	00000000 	.inst	0x00000000 ; undefined
   88378:	00000062 	.inst	0x00000062 ; undefined
   8837c:	00000000 	.inst	0x00000000 ; undefined
   88380:	0000006a 	.inst	0x0000006a ; undefined
   88384:	00000000 	.inst	0x00000000 ; undefined
   88388:	00086907 	.inst	0x00086907 ; undefined
   8838c:	00000000 	.inst	0x00000000 ; undefined
   88390:	00000004 	.inst	0x00000004 ; undefined
   88394:	00000000 	.inst	0x00000000 ; undefined
   88398:	00086afa 	.inst	0x00086afa ; undefined
   8839c:	00000000 	.inst	0x00000000 ; undefined
   883a0:	00000017 	.inst	0x00000017 ; undefined
   883a4:	00000000 	.inst	0x00000000 ; undefined
   883a8:	00086afa 	.inst	0x00086afa ; undefined
   883ac:	00000000 	.inst	0x00000000 ; undefined
   883b0:	00000017 	.inst	0x00000017 ; undefined
   883b4:	00000000 	.inst	0x00000000 ; undefined
   883b8:	00086b11 	.inst	0x00086b11 ; undefined
   883bc:	00000000 	.inst	0x00000000 ; undefined
   883c0:	00000062 	.inst	0x00000062 ; undefined
   883c4:	00000000 	.inst	0x00000000 ; undefined
   883c8:	0000006c 	.inst	0x0000006c ; undefined
   883cc:	00000000 	.inst	0x00000000 ; undefined
   883d0:	00086cbb 	.inst	0x00086cbb ; undefined
   883d4:	00000000 	.inst	0x00000000 ; undefined
   883d8:	00000013 	.inst	0x00000013 ; undefined
   883dc:	00000000 	.inst	0x00000000 ; undefined
   883e0:	00086afa 	.inst	0x00086afa ; undefined
   883e4:	00000000 	.inst	0x00000000 ; undefined
   883e8:	00000017 	.inst	0x00000017 ; undefined
   883ec:	00000000 	.inst	0x00000000 ; undefined
   883f0:	00086afa 	.inst	0x00086afa ; undefined
   883f4:	00000000 	.inst	0x00000000 ; undefined
   883f8:	00000017 	.inst	0x00000017 ; undefined
   883fc:	00000000 	.inst	0x00000000 ; undefined
   88400:	00086b11 	.inst	0x00086b11 ; undefined
   88404:	00000000 	.inst	0x00000000 ; undefined
   88408:	00000062 	.inst	0x00000062 ; undefined
   8840c:	00000000 	.inst	0x00000000 ; undefined
   88410:	0000006f 	.inst	0x0000006f ; undefined
   88414:	00000000 	.inst	0x00000000 ; undefined
   88418:	00086cce 	.inst	0x00086cce ; undefined
   8841c:	00000000 	.inst	0x00000000 ; undefined
   88420:	00000013 	.inst	0x00000013 ; undefined
   88424:	00000000 	.inst	0x00000000 ; undefined
   88428:	00086afa 	.inst	0x00086afa ; undefined
   8842c:	00000000 	.inst	0x00000000 ; undefined
   88430:	00000017 	.inst	0x00000017 ; undefined
   88434:	00000000 	.inst	0x00000000 ; undefined
   88438:	00086afa 	.inst	0x00086afa ; undefined
   8843c:	00000000 	.inst	0x00000000 ; undefined
   88440:	00000017 	.inst	0x00000017 ; undefined
   88444:	00000000 	.inst	0x00000000 ; undefined
   88448:	00086b11 	.inst	0x00086b11 ; undefined
   8844c:	00000000 	.inst	0x00000000 ; undefined
   88450:	00000062 	.inst	0x00000062 ; undefined
   88454:	00000000 	.inst	0x00000000 ; undefined
   88458:	00000072 	.inst	0x00000072 ; undefined
   8845c:	00000000 	.inst	0x00000000 ; undefined
   88460:	00086ce1 	.inst	0x00086ce1 ; undefined
   88464:	00000000 	.inst	0x00000000 ; undefined
   88468:	00000013 	.inst	0x00000013 ; undefined
   8846c:	00000000 	.inst	0x00000000 ; undefined
   88470:	00086afa 	.inst	0x00086afa ; undefined
   88474:	00000000 	.inst	0x00000000 ; undefined
   88478:	00000017 	.inst	0x00000017 ; undefined
   8847c:	00000000 	.inst	0x00000000 ; undefined
   88480:	00086afa 	.inst	0x00086afa ; undefined
   88484:	00000000 	.inst	0x00000000 ; undefined
   88488:	00000017 	.inst	0x00000017 ; undefined
   8848c:	00000000 	.inst	0x00000000 ; undefined
   88490:	00086b11 	.inst	0x00086b11 ; undefined
   88494:	00000000 	.inst	0x00000000 ; undefined
   88498:	00000062 	.inst	0x00000062 ; undefined
   8849c:	00000000 	.inst	0x00000000 ; undefined
   884a0:	00000075 	.inst	0x00000075 ; undefined
   884a4:	00000000 	.inst	0x00000000 ; undefined
   884a8:	00086cf4 	.inst	0x00086cf4 ; undefined
   884ac:	00000000 	.inst	0x00000000 ; undefined
   884b0:	00000013 	.inst	0x00000013 ; undefined
   884b4:	00000000 	.inst	0x00000000 ; undefined
   884b8:	00086afa 	.inst	0x00086afa ; undefined
   884bc:	00000000 	.inst	0x00000000 ; undefined
   884c0:	00000017 	.inst	0x00000017 ; undefined
   884c4:	00000000 	.inst	0x00000000 ; undefined
   884c8:	00086afa 	.inst	0x00086afa ; undefined
   884cc:	00000000 	.inst	0x00000000 ; undefined
   884d0:	00000017 	.inst	0x00000017 ; undefined
   884d4:	00000000 	.inst	0x00000000 ; undefined
   884d8:	00086b11 	.inst	0x00086b11 ; undefined
   884dc:	00000000 	.inst	0x00000000 ; undefined
   884e0:	00000062 	.inst	0x00000062 ; undefined
   884e4:	00000000 	.inst	0x00000000 ; undefined
   884e8:	00000078 	.inst	0x00000078 ; undefined
   884ec:	00000000 	.inst	0x00000000 ; undefined
   884f0:	00086d07 	.inst	0x00086d07 ; undefined
   884f4:	00000000 	.inst	0x00000000 ; undefined
   884f8:	00000016 	.inst	0x00000016 ; undefined
   884fc:	00000000 	.inst	0x00000000 ; undefined
   88500:	00086d1d 	.inst	0x00086d1d ; undefined
   88504:	00000000 	.inst	0x00000000 ; undefined
   88508:	00000007 	.inst	0x00000007 ; undefined
   8850c:	00000000 	.inst	0x00000000 ; undefined
   88510:	00086afa 	.inst	0x00086afa ; undefined
   88514:	00000000 	.inst	0x00000000 ; undefined
   88518:	00000017 	.inst	0x00000017 ; undefined
   8851c:	00000000 	.inst	0x00000000 ; undefined
   88520:	00086afa 	.inst	0x00086afa ; undefined
   88524:	00000000 	.inst	0x00000000 ; undefined
   88528:	00000017 	.inst	0x00000017 ; undefined
   8852c:	00000000 	.inst	0x00000000 ; undefined
   88530:	00086b11 	.inst	0x00086b11 ; undefined
   88534:	00000000 	.inst	0x00000000 ; undefined
   88538:	00000062 	.inst	0x00000062 ; undefined
   8853c:	00000000 	.inst	0x00000000 ; undefined
   88540:	0000007b 	.inst	0x0000007b ; undefined
   88544:	00000000 	.inst	0x00000000 ; undefined
   88548:	00086b11 	.inst	0x00086b11 ; undefined
   8854c:	00000000 	.inst	0x00000000 ; undefined
   88550:	00000062 	.inst	0x00000062 ; undefined
   88554:	00000000 	.inst	0x00000000 ; undefined
   88558:	0000007d 	.inst	0x0000007d ; undefined
   8855c:	0000000b 	.inst	0x0000000b ; undefined
   88560:	00086b11 	.inst	0x00086b11 ; undefined
   88564:	00000000 	.inst	0x00000000 ; undefined
   88568:	00000062 	.inst	0x00000062 ; undefined
   8856c:	00000000 	.inst	0x00000000 ; undefined
   88570:	00000062 	.inst	0x00000062 ; undefined
   88574:	0000000b 	.inst	0x0000000b ; undefined
   88578:	00086b11 	.inst	0x00086b11 ; undefined
   8857c:	00000000 	.inst	0x00000000 ; undefined
   88580:	00000062 	.inst	0x00000062 ; undefined
   88584:	00000000 	.inst	0x00000000 ; undefined
   88588:	0000005f 	.inst	0x0000005f ; undefined
   8858c:	0000000b 	.inst	0x0000000b ; undefined
   88590:	00086b11 	.inst	0x00086b11 ; undefined
   88594:	00000000 	.inst	0x00000000 ; undefined
   88598:	00000062 	.inst	0x00000062 ; undefined
   8859c:	00000000 	.inst	0x00000000 ; undefined
   885a0:	0000005c 	.inst	0x0000005c ; undefined
   885a4:	0000000b 	.inst	0x0000000b ; undefined
   885a8:	00086b11 	.inst	0x00086b11 ; undefined
   885ac:	00000000 	.inst	0x00000000 ; undefined
   885b0:	00000062 	.inst	0x00000062 ; undefined
   885b4:	00000000 	.inst	0x00000000 ; undefined
   885b8:	00000059 	.inst	0x00000059 ; undefined
   885bc:	0000000b 	.inst	0x0000000b ; undefined
   885c0:	00086b11 	.inst	0x00086b11 ; undefined
   885c4:	00000000 	.inst	0x00000000 ; undefined
   885c8:	00000062 	.inst	0x00000062 ; undefined
   885cc:	00000000 	.inst	0x00000000 ; undefined
   885d0:	00000056 	.inst	0x00000056 ; undefined
   885d4:	0000000b 	.inst	0x0000000b ; undefined
   885d8:	00086b11 	.inst	0x00086b11 ; undefined
   885dc:	00000000 	.inst	0x00000000 ; undefined
   885e0:	00000062 	.inst	0x00000062 ; undefined
   885e4:	00000000 	.inst	0x00000000 ; undefined
   885e8:	00000053 	.inst	0x00000053 ; undefined
   885ec:	0000000b 	.inst	0x0000000b ; undefined
   885f0:	00086b11 	.inst	0x00086b11 ; undefined
   885f4:	00000000 	.inst	0x00000000 ; undefined
   885f8:	00000062 	.inst	0x00000062 ; undefined
   885fc:	00000000 	.inst	0x00000000 ; undefined
   88600:	00000050 	.inst	0x00000050 ; undefined
   88604:	0000000b 	.inst	0x0000000b ; undefined
   88608:	00086b11 	.inst	0x00086b11 ; undefined
   8860c:	00000000 	.inst	0x00000000 ; undefined
   88610:	00000062 	.inst	0x00000062 ; undefined
   88614:	00000000 	.inst	0x00000000 ; undefined
   88618:	0000004d 	.inst	0x0000004d ; undefined
   8861c:	0000000b 	.inst	0x0000000b ; undefined
   88620:	00086b11 	.inst	0x00086b11 ; undefined
   88624:	00000000 	.inst	0x00000000 ; undefined
   88628:	00000062 	.inst	0x00000062 ; undefined
   8862c:	00000000 	.inst	0x00000000 ; undefined
   88630:	0000004a 	.inst	0x0000004a ; undefined
   88634:	0000000b 	.inst	0x0000000b ; undefined

Disassembly of section .fill:

0000000000088638 <__stack_end__-0x8>:
   88638:	efbeadde 	.inst	0xefbeadde ; undefined
   8863c:	aabeadde 	orn	x30, x14, x30, asr #43

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	6b6e694c 	.inst	0x6b6e694c ; undefined
   4:	203a7265 	.inst	0x203a7265 ; undefined
   8:	20444c4c 	.inst	0x20444c4c ; undefined
   c:	302e3331 	adr	x17, 5c671 <EXC_LOWEREL32_SPX_SErr+0x5c63d>
  10:	Address 0x0000000000000010 is out of bounds.

