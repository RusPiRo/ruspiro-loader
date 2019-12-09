
target/aarch64-unknown-linux-gnu/release/kernel:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000080000 <__boot>:
   80000:	d53800a0 	mrs	x0, mpidr_el1
   80004:	92400400 	and	x0, x0, #0x3
   80008:	58000681 	ldr	x1, 800d8 <.El1Return+0x28>
   8000c:	580006a2 	ldr	x2, 800e0 <.El1Return+0x30>
   80010:	eb020021 	subs	x1, x1, x2
   80014:	9b007c22 	mul	x2, x1, x0
   80018:	58000681 	ldr	x1, 800e8 <.El1Return+0x38>
   8001c:	cb22603f 	sub	sp, x1, x2
   80020:	b5000120 	cbnz	x0, 80044 <.bss_done>
   80024:	58000660 	ldr	x0, 800f0 <.El1Return+0x40>
   80028:	58000682 	ldr	x2, 800f8 <.El1Return+0x48>
   8002c:	cb000042 	sub	x2, x2, x0
   80030:	d344fc42 	lsr	x2, x2, #4
   80034:	b4000082 	cbz	x2, 80044 <.bss_done>

0000000000080038 <.bss_zero_loop>:
   80038:	a8817c1f 	stp	xzr, xzr, [x0], #16
   8003c:	d1000442 	sub	x2, x2, #0x1
   80040:	b5ffffc2 	cbnz	x2, 80038 <.bss_zero_loop>

0000000000080044 <.bss_done>:
   80044:	10007de0 	adr	x0, 81000 <__ExceptionVectorTable>
   80048:	d51cc000 	msr	vbar_el2, x0
   8004c:	d518c000 	msr	vbar_el1, x0
   80050:	d53c1100 	mrs	x0, hcr_el2
   80054:	b27d0800 	orr	x0, x0, #0x38
   80058:	d51c1100 	msr	hcr_el2, x0
   8005c:	d53800a0 	mrs	x0, mpidr_el1
   80060:	92400400 	and	x0, x0, #0x3
   80064:	140005c9 	b	81788 <__rust_entry>
   80068:	140000d6 	b	803c0 <__hang>

000000000008006c <__switch_el2_to_el1>:
   8006c:	580004a1 	ldr	x1, 80100 <.El1Return+0x50>
   80070:	d51c4101 	msr	sp_el1, x1
   80074:	d518101f 	msr	sctlr_el1, xzr
   80078:	d2b00000 	mov	x0, #0x80000000            	// #2147483648
   8007c:	b27f0000 	orr	x0, x0, #0x2
   80080:	d51c1100 	msr	hcr_el2, x0
   80084:	d53c1100 	mrs	x0, hcr_el2
   80088:	d53ce102 	mrs	x2, cnthctl_el2
   8008c:	b2400442 	orr	x2, x2, #0x3
   80090:	d51ce102 	msr	cnthctl_el2, x2
   80094:	d51ce07f 	msr	cntvoff_el2, xzr
   80098:	d2807882 	mov	x2, #0x3c4                 	// #964
   8009c:	d2807882 	mov	x2, #0x3c4                 	// #964
   800a0:	d51c4002 	msr	spsr_el2, x2
   800a4:	10000061 	adr	x1, 800b0 <.El1Return>
   800a8:	d51c4021 	msr	elr_el2, x1
   800ac:	d69f03e0 	eret

00000000000800b0 <.El1Return>:
   800b0:	58000281 	ldr	x1, 80100 <.El1Return+0x50>
   800b4:	d53800a0 	mrs	x0, mpidr_el1
   800b8:	92400400 	and	x0, x0, #0x3
   800bc:	580000e2 	ldr	x2, 800d8 <.El1Return+0x28>
   800c0:	58000103 	ldr	x3, 800e0 <.El1Return+0x30>
   800c4:	eb030042 	subs	x2, x2, x3
   800c8:	9b007c42 	mul	x2, x2, x0
   800cc:	cb020020 	sub	x0, x1, x2
   800d0:	9100001f 	mov	sp, x0
   800d4:	d65f03c0 	ret
   800d8:	000cc080 	.word	0x000cc080
   800dc:	00000000 	.word	0x00000000
   800e0:	000bc080 	.word	0x000bc080
   800e4:	00000000 	.word	0x00000000
   800e8:	000bd080 	.word	0x000bd080
   800ec:	00000000 	.word	0x00000000
   800f0:	00088000 	.word	0x00088000
   800f4:	00000000 	.word	0x00000000
   800f8:	0008c069 	.word	0x0008c069
   800fc:	00000000 	.word	0x00000000
   80100:	000cb080 	.word	0x000cb080
   80104:	00000000 	.word	0x00000000

0000000000080108 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h142d223fe09a0670E>:
   80108:	a9402408 	ldp	x8, x9, [x0]
   8010c:	aa0103e2 	mov	x2, x1
   80110:	aa0803e0 	mov	x0, x8
   80114:	aa0903e1 	mov	x1, x9
   80118:	14000f6d 	b	83ecc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E>
   8011c:	00000000 	.inst	0x00000000 ; undefined

0000000000080120 <_ZN4core3ptr18real_drop_in_place17h86c8d437bb5acba3E>:
   80120:	d65f03c0 	ret
   80124:	00000000 	.inst	0x00000000 ; undefined

0000000000080128 <_ZN6kernel3run17h5515ea84cdd0f18bE>:
   80128:	d10303ff 	sub	sp, sp, #0xc0
   8012c:	71000c1f 	cmp	w0, #0x3
   80130:	a9095bf7 	stp	x23, x22, [sp, #144]
   80134:	a90a53f5 	stp	x21, x20, [sp, #160]
   80138:	a90b7bf3 	stp	x19, x30, [sp, #176]
   8013c:	54000d88 	b.hi	802ec <_ZN6kernel3run17h5515ea84cdd0f18bE+0x1c4>  // b.pmore
   80140:	90000029 	adrp	x9, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   80144:	2a0003e8 	mov	w8, w0
   80148:	91272529 	add	x9, x9, #0x9c9
   8014c:	1000008a 	adr	x10, 8015c <_ZN6kernel3run17h5515ea84cdd0f18bE+0x34>
   80150:	3868692b 	ldrb	w11, [x9, x8]
   80154:	8b0b094a 	add	x10, x10, x11, lsl #2
   80158:	d61f0140 	br	x10
   8015c:	f0000033 	adrp	x19, 87000 <_DYNAMIC+0xf0>
   80160:	f9402673 	ldr	x19, [x19, #72]
   80164:	aa1303e0 	mov	x0, x19
   80168:	94000888 	bl	82388 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E>
   8016c:	91004260 	add	x0, x19, #0x10
   80170:	52800221 	mov	w1, #0x11                  	// #17
   80174:	910103e8 	add	x8, sp, #0x40
   80178:	910103f4 	add	x20, sp, #0x40
   8017c:	9400076f 	bl	81f38 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE>
   80180:	f94023e8 	ldr	x8, [sp, #64]
   80184:	f100051f 	cmp	x8, #0x1
   80188:	540006e1 	b.ne	80264 <_ZN6kernel3run17h5515ea84cdd0f18bE+0x13c>  // b.any
   8018c:	f94027e8 	ldr	x8, [sp, #72]
   80190:	f90003e8 	str	x8, [sp]
   80194:	f9402be8 	ldr	x8, [sp, #80]
   80198:	f90007e8 	str	x8, [sp, #8]
   8019c:	3dc003e0 	ldr	q0, [sp]
   801a0:	1400005f 	b	8031c <_ZN6kernel3run17h5515ea84cdd0f18bE+0x1f4>
   801a4:	f0000033 	adrp	x19, 87000 <_DYNAMIC+0xf0>
   801a8:	f9402673 	ldr	x19, [x19, #72]
   801ac:	aa1303e0 	mov	x0, x19
   801b0:	94000876 	bl	82388 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E>
   801b4:	91004260 	add	x0, x19, #0x10
   801b8:	52800281 	mov	w1, #0x14                  	// #20
   801bc:	910103e8 	add	x8, sp, #0x40
   801c0:	910103f4 	add	x20, sp, #0x40
   801c4:	9400075d 	bl	81f38 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE>
   801c8:	f94023e8 	ldr	x8, [sp, #64]
   801cc:	f100051f 	cmp	x8, #0x1
   801d0:	540004a1 	b.ne	80264 <_ZN6kernel3run17h5515ea84cdd0f18bE+0x13c>  // b.any
   801d4:	f94027e8 	ldr	x8, [sp, #72]
   801d8:	f90013e8 	str	x8, [sp, #32]
   801dc:	f9402be8 	ldr	x8, [sp, #80]
   801e0:	f90017e8 	str	x8, [sp, #40]
   801e4:	3dc00be0 	ldr	q0, [sp, #32]
   801e8:	1400004d 	b	8031c <_ZN6kernel3run17h5515ea84cdd0f18bE+0x1f4>
   801ec:	f0000033 	adrp	x19, 87000 <_DYNAMIC+0xf0>
   801f0:	f9402673 	ldr	x19, [x19, #72]
   801f4:	aa1303e0 	mov	x0, x19
   801f8:	94000864 	bl	82388 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E>
   801fc:	91004260 	add	x0, x19, #0x10
   80200:	528002a1 	mov	w1, #0x15                  	// #21
   80204:	910103e8 	add	x8, sp, #0x40
   80208:	910103f4 	add	x20, sp, #0x40
   8020c:	9400074b 	bl	81f38 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE>
   80210:	f94023e8 	ldr	x8, [sp, #64]
   80214:	f100051f 	cmp	x8, #0x1
   80218:	54000261 	b.ne	80264 <_ZN6kernel3run17h5515ea84cdd0f18bE+0x13c>  // b.any
   8021c:	f94027e8 	ldr	x8, [sp, #72]
   80220:	f9001be8 	str	x8, [sp, #48]
   80224:	f9402be8 	ldr	x8, [sp, #80]
   80228:	f9001fe8 	str	x8, [sp, #56]
   8022c:	3dc00fe0 	ldr	q0, [sp, #48]
   80230:	1400003b 	b	8031c <_ZN6kernel3run17h5515ea84cdd0f18bE+0x1f4>
   80234:	f0000033 	adrp	x19, 87000 <_DYNAMIC+0xf0>
   80238:	f9402673 	ldr	x19, [x19, #72]
   8023c:	aa1303e0 	mov	x0, x19
   80240:	94000852 	bl	82388 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E>
   80244:	91004260 	add	x0, x19, #0x10
   80248:	52800241 	mov	w1, #0x12                  	// #18
   8024c:	910103e8 	add	x8, sp, #0x40
   80250:	910103f4 	add	x20, sp, #0x40
   80254:	94000739 	bl	81f38 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE>
   80258:	f94023e8 	ldr	x8, [sp, #64]
   8025c:	f100051f 	cmp	x8, #0x1
   80260:	54000540 	b.eq	80308 <_ZN6kernel3run17h5515ea84cdd0f18bE+0x1e0>  // b.none
   80264:	a940d688 	ldp	x8, x21, [x20, #8]
   80268:	5280002c 	mov	w12, #0x1                   	// #1
   8026c:	f0000020 	adrp	x0, 87000 <_DYNAMIC+0xf0>
   80270:	f9400e96 	ldr	x22, [x20, #24]
   80274:	52927c13 	mov	w19, #0x93e0                	// #37856
   80278:	29452a89 	ldp	w9, w10, [x20, #40]
   8027c:	72a00093 	movk	w19, #0x4, lsl #16
   80280:	b9403297 	ldr	w23, [x20, #48]
   80284:	b940010b 	ldr	w11, [x8]
   80288:	1aca218a 	lsl	w10, w12, w10
   8028c:	0a29016b 	bic	w11, w11, w9
   80290:	0a090149 	and	w9, w10, w9
   80294:	2a090169 	orr	w9, w11, w9
   80298:	b9000109 	str	w9, [x8]
   8029c:	f9402400 	ldr	x0, [x0, #72]
   802a0:	94000848 	bl	823c0 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hcb55c707bd8b2049E>
   802a4:	90000054 	adrp	x20, 88000 <__bss_start__>
   802a8:	91000294 	add	x20, x20, #0x0
   802ac:	aa1403e0 	mov	x0, x20
   802b0:	94000836 	bl	82388 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E>
   802b4:	90000021 	adrp	x1, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   802b8:	91004280 	add	x0, x20, #0x10
   802bc:	528008e2 	mov	w2, #0x47                  	// #71
   802c0:	91260821 	add	x1, x1, #0x982
   802c4:	94000641 	bl	81bc8 <_ZN12ruspiro_uart5uart15Uart111send_string17h19fbfad7ae847e56E>
   802c8:	aa1403e0 	mov	x0, x20
   802cc:	9400083d 	bl	823c0 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hcb55c707bd8b2049E>
   802d0:	aa1303e0 	mov	x0, x19
   802d4:	940006eb 	bl	81e80 <_ZN13ruspiro_timer5sleep17h279cbcdbb8f764c0E>
   802d8:	aa1303e0 	mov	x0, x19
   802dc:	b90002b7 	str	w23, [x21]
   802e0:	940006e8 	bl	81e80 <_ZN13ruspiro_timer5sleep17h279cbcdbb8f764c0E>
   802e4:	b90002d7 	str	w23, [x22]
   802e8:	17fffffa 	b	802d0 <_ZN6kernel3run17h5515ea84cdd0f18bE+0x1a8>
   802ec:	90000020 	adrp	x0, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   802f0:	d0000022 	adrp	x2, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   802f4:	91273400 	add	x0, x0, #0x9cd
   802f8:	52800261 	mov	w1, #0x13                  	// #19
   802fc:	91160042 	add	x2, x2, #0x580
   80300:	94001116 	bl	84758 <_ZN4core9panicking5panic17hc6f3025301472b62E>
   80304:	d4200020 	brk	#0x1
   80308:	f94027e8 	ldr	x8, [sp, #72]
   8030c:	f9000be8 	str	x8, [sp, #16]
   80310:	f9402be8 	ldr	x8, [sp, #80]
   80314:	f9000fe8 	str	x8, [sp, #24]
   80318:	3dc007e0 	ldr	q0, [sp, #16]
   8031c:	90000020 	adrp	x0, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   80320:	d0000023 	adrp	x3, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   80324:	91244000 	add	x0, x0, #0x910
   80328:	52800561 	mov	w1, #0x2b                  	// #43
   8032c:	91158063 	add	x3, x3, #0x560
   80330:	910203e2 	add	x2, sp, #0x80
   80334:	3d8023e0 	str	q0, [sp, #128]
   80338:	94000b2b 	bl	82fe4 <_ZN4core6result13unwrap_failed17h9c29e1765dae37fbE>
   8033c:	d4200020 	brk	#0x1

0000000000080340 <__kernel_startup>:
   80340:	f81e0ff4 	str	x20, [sp, #-32]!
   80344:	2a0003f4 	mov	w20, w0
   80348:	528002a0 	mov	w0, #0x15                  	// #21
   8034c:	a9017bf3 	stp	x19, x30, [sp, #16]
   80350:	940006e2 	bl	81ed8 <lit_debug_led>
   80354:	90000053 	adrp	x19, 88000 <__bss_start__>
   80358:	91000273 	add	x19, x19, #0x0
   8035c:	35000174 	cbnz	w20, 80388 <__kernel_startup+0x48>
   80360:	aa1303e0 	mov	x0, x19
   80364:	94000809 	bl	82388 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E>
   80368:	52965001 	mov	w1, #0xb280                	// #45696
   8036c:	52984002 	mov	w2, #0xc200                	// #49664
   80370:	91004260 	add	x0, x19, #0x10
   80374:	72a1dcc1 	movk	w1, #0xee6, lsl #16
   80378:	72a00022 	movk	w2, #0x1, lsl #16
   8037c:	940005d5 	bl	81ad0 <_ZN12ruspiro_uart5uart15Uart110initialize17h24939a06ff40fab9E>
   80380:	aa1303e0 	mov	x0, x19
   80384:	9400080f 	bl	823c0 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hcb55c707bd8b2049E>
   80388:	aa1303e0 	mov	x0, x19
   8038c:	940007ff 	bl	82388 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E>
   80390:	90000021 	adrp	x1, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   80394:	91004260 	add	x0, x19, #0x10
   80398:	528008e2 	mov	w2, #0x47                  	// #71
   8039c:	9124ec21 	add	x1, x1, #0x93b
   803a0:	9400060a 	bl	81bc8 <_ZN12ruspiro_uart5uart15Uart111send_string17h19fbfad7ae847e56E>
   803a4:	aa1303e0 	mov	x0, x19
   803a8:	a9417bf3 	ldp	x19, x30, [sp, #16]
   803ac:	f84207f4 	ldr	x20, [sp], #32
   803b0:	14000804 	b	823c0 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hcb55c707bd8b2049E>
   803b4:	00000000 	.inst	0x00000000 ; undefined

00000000000803b8 <__kernel_run>:
   803b8:	97ffff5c 	bl	80128 <_ZN6kernel3run17h5515ea84cdd0f18bE>
   803bc:	d4200020 	brk	#0x1

00000000000803c0 <__hang>:
   803c0:	d503205f 	wfe
   803c4:	17ffffff 	b	803c0 <__hang>
	...
   80800:	d503201f 	nop
   80804:	d65f03c0 	ret

0000000000080808 <__exception_trampoline>:
   80808:	d10403ff 	sub	sp, sp, #0x100
   8080c:	a90007e0 	stp	x0, x1, [sp]
   80810:	a9010fe2 	stp	x2, x3, [sp, #16]
   80814:	a90217e4 	stp	x4, x5, [sp, #32]
   80818:	a9031fe6 	stp	x6, x7, [sp, #48]
   8081c:	a90427e8 	stp	x8, x9, [sp, #64]
   80820:	a9052fea 	stp	x10, x11, [sp, #80]
   80824:	a90637ec 	stp	x12, x13, [sp, #96]
   80828:	a9073fee 	stp	x14, x15, [sp, #112]
   8082c:	a90847f0 	stp	x16, x17, [sp, #128]
   80830:	a9094ff2 	stp	x18, x19, [sp, #144]
   80834:	a90a57f4 	stp	x20, x21, [sp, #160]
   80838:	a90b5ff6 	stp	x22, x23, [sp, #176]
   8083c:	a90c67f8 	stp	x24, x25, [sp, #192]
   80840:	a90d6ffa 	stp	x26, x27, [sp, #208]
   80844:	a90e77fc 	stp	x28, x29, [sp, #224]
   80848:	f9007bfe 	str	x30, [sp, #240]
   8084c:	d53c400a 	mrs	x10, spsr_el2
   80850:	d53c402b 	mrs	x11, elr_el2
   80854:	a9102fea 	stp	x10, x11, [sp, #256]
   80858:	d53c5201 	mrs	x1, esr_el2
   8085c:	d53c4002 	mrs	x2, spsr_el2
   80860:	d53c6003 	mrs	x3, far_el2
   80864:	d53c4024 	mrs	x4, elr_el2
   80868:	9400063a 	bl	82150 <__exception_handler_default>
   8086c:	a94007e0 	ldp	x0, x1, [sp]
   80870:	a9410fe2 	ldp	x2, x3, [sp, #16]
   80874:	a94217e4 	ldp	x4, x5, [sp, #32]
   80878:	a9431fe6 	ldp	x6, x7, [sp, #48]
   8087c:	a94427e8 	ldp	x8, x9, [sp, #64]
   80880:	a9452fea 	ldp	x10, x11, [sp, #80]
   80884:	a94637ec 	ldp	x12, x13, [sp, #96]
   80888:	a9473fee 	ldp	x14, x15, [sp, #112]
   8088c:	a94847f0 	ldp	x16, x17, [sp, #128]
   80890:	a9494ff2 	ldp	x18, x19, [sp, #144]
   80894:	a94a57f4 	ldp	x20, x21, [sp, #160]
   80898:	a94b5ff6 	ldp	x22, x23, [sp, #176]
   8089c:	a94c67f8 	ldp	x24, x25, [sp, #192]
   808a0:	a94d6ffa 	ldp	x26, x27, [sp, #208]
   808a4:	a94e77fc 	ldp	x28, x29, [sp, #224]
   808a8:	f9407bfe 	ldr	x30, [sp, #240]
   808ac:	a9502fea 	ldp	x10, x11, [sp, #256]
   808b0:	d51c402b 	msr	elr_el2, x11
   808b4:	d51c400a 	msr	spsr_el2, x10
   808b8:	910403ff 	add	sp, sp, #0x100
   808bc:	d69f03e0 	eret
   808c0:	d503201f 	nop
   808c4:	d503201f 	nop
   808c8:	d503201f 	nop
   808cc:	d503201f 	nop
   808d0:	d503201f 	nop
   808d4:	d503201f 	nop
   808d8:	d503201f 	nop
   808dc:	d503201f 	nop
   808e0:	d503201f 	nop
   808e4:	d503201f 	nop
   808e8:	d503201f 	nop
   808ec:	d503201f 	nop
   808f0:	d503201f 	nop
   808f4:	d503201f 	nop
   808f8:	d503201f 	nop
   808fc:	d503201f 	nop
   80900:	d503201f 	nop
   80904:	d503201f 	nop
   80908:	d503201f 	nop
   8090c:	d503201f 	nop
   80910:	d503201f 	nop
   80914:	d503201f 	nop
   80918:	d503201f 	nop
   8091c:	d503201f 	nop
   80920:	d503201f 	nop
   80924:	d503201f 	nop
   80928:	d503201f 	nop
   8092c:	d503201f 	nop
   80930:	d503201f 	nop
   80934:	d503201f 	nop
   80938:	d503201f 	nop
   8093c:	d503201f 	nop
   80940:	d503201f 	nop
   80944:	d503201f 	nop
   80948:	d503201f 	nop
   8094c:	d503201f 	nop
   80950:	d503201f 	nop
   80954:	d503201f 	nop
   80958:	d503201f 	nop
   8095c:	d503201f 	nop
   80960:	d503201f 	nop
   80964:	d503201f 	nop
   80968:	d503201f 	nop
   8096c:	d503201f 	nop
   80970:	d503201f 	nop
   80974:	d503201f 	nop
   80978:	d503201f 	nop
   8097c:	d503201f 	nop
   80980:	d503201f 	nop
   80984:	d503201f 	nop
   80988:	d503201f 	nop
   8098c:	d503201f 	nop
   80990:	d503201f 	nop
   80994:	d503201f 	nop
   80998:	d503201f 	nop
   8099c:	d503201f 	nop
   809a0:	d503201f 	nop
   809a4:	d503201f 	nop
   809a8:	d503201f 	nop
   809ac:	d503201f 	nop
   809b0:	d503201f 	nop
   809b4:	d503201f 	nop
   809b8:	d503201f 	nop
   809bc:	d503201f 	nop
   809c0:	d503201f 	nop
   809c4:	d503201f 	nop
   809c8:	d503201f 	nop
   809cc:	d503201f 	nop
   809d0:	d503201f 	nop
   809d4:	d503201f 	nop
   809d8:	d503201f 	nop
   809dc:	d503201f 	nop
   809e0:	d503201f 	nop
   809e4:	d503201f 	nop
   809e8:	d503201f 	nop
   809ec:	d503201f 	nop
   809f0:	d503201f 	nop
   809f4:	d503201f 	nop
   809f8:	d503201f 	nop
   809fc:	d503201f 	nop
   80a00:	d503201f 	nop
   80a04:	d503201f 	nop
   80a08:	d503201f 	nop
   80a0c:	d503201f 	nop
   80a10:	d503201f 	nop
   80a14:	d503201f 	nop
   80a18:	d503201f 	nop
   80a1c:	d503201f 	nop
   80a20:	d503201f 	nop
   80a24:	d503201f 	nop
   80a28:	d503201f 	nop
   80a2c:	d503201f 	nop
   80a30:	d503201f 	nop
   80a34:	d503201f 	nop
   80a38:	d503201f 	nop
   80a3c:	d503201f 	nop
   80a40:	d503201f 	nop
   80a44:	d503201f 	nop
   80a48:	d503201f 	nop
   80a4c:	d503201f 	nop
   80a50:	d503201f 	nop
   80a54:	d503201f 	nop
   80a58:	d503201f 	nop
   80a5c:	d503201f 	nop
   80a60:	d503201f 	nop
   80a64:	d503201f 	nop
   80a68:	d503201f 	nop
   80a6c:	d503201f 	nop
   80a70:	d503201f 	nop
   80a74:	d503201f 	nop
   80a78:	d503201f 	nop
   80a7c:	d503201f 	nop
   80a80:	d503201f 	nop
   80a84:	d503201f 	nop
   80a88:	d503201f 	nop
   80a8c:	d503201f 	nop
   80a90:	d503201f 	nop
   80a94:	d503201f 	nop
   80a98:	d503201f 	nop
   80a9c:	d503201f 	nop
   80aa0:	d503201f 	nop
   80aa4:	d503201f 	nop
   80aa8:	d503201f 	nop
   80aac:	d503201f 	nop
   80ab0:	d503201f 	nop
   80ab4:	d503201f 	nop
   80ab8:	d503201f 	nop
   80abc:	d503201f 	nop
   80ac0:	d503201f 	nop
   80ac4:	d503201f 	nop
   80ac8:	d503201f 	nop
   80acc:	d503201f 	nop
   80ad0:	d503201f 	nop
   80ad4:	d503201f 	nop
   80ad8:	d503201f 	nop
   80adc:	d503201f 	nop
   80ae0:	d503201f 	nop
   80ae4:	d503201f 	nop
   80ae8:	d503201f 	nop
   80aec:	d503201f 	nop
   80af0:	d503201f 	nop
   80af4:	d503201f 	nop
   80af8:	d503201f 	nop
   80afc:	d503201f 	nop
   80b00:	d503201f 	nop
   80b04:	d503201f 	nop
   80b08:	d503201f 	nop
   80b0c:	d503201f 	nop
   80b10:	d503201f 	nop
   80b14:	d503201f 	nop
   80b18:	d503201f 	nop
   80b1c:	d503201f 	nop
   80b20:	d503201f 	nop
   80b24:	d503201f 	nop
   80b28:	d503201f 	nop
   80b2c:	d503201f 	nop
   80b30:	d503201f 	nop
   80b34:	d503201f 	nop
   80b38:	d503201f 	nop
   80b3c:	d503201f 	nop
   80b40:	d503201f 	nop
   80b44:	d503201f 	nop
   80b48:	d503201f 	nop
   80b4c:	d503201f 	nop
   80b50:	d503201f 	nop
   80b54:	d503201f 	nop
   80b58:	d503201f 	nop
   80b5c:	d503201f 	nop
   80b60:	d503201f 	nop
   80b64:	d503201f 	nop
   80b68:	d503201f 	nop
   80b6c:	d503201f 	nop
   80b70:	d503201f 	nop
   80b74:	d503201f 	nop
   80b78:	d503201f 	nop
   80b7c:	d503201f 	nop
   80b80:	d503201f 	nop
   80b84:	d503201f 	nop
   80b88:	d503201f 	nop
   80b8c:	d503201f 	nop
   80b90:	d503201f 	nop
   80b94:	d503201f 	nop
   80b98:	d503201f 	nop
   80b9c:	d503201f 	nop
   80ba0:	d503201f 	nop
   80ba4:	d503201f 	nop
   80ba8:	d503201f 	nop
   80bac:	d503201f 	nop
   80bb0:	d503201f 	nop
   80bb4:	d503201f 	nop
   80bb8:	d503201f 	nop
   80bbc:	d503201f 	nop
   80bc0:	d503201f 	nop
   80bc4:	d503201f 	nop
   80bc8:	d503201f 	nop
   80bcc:	d503201f 	nop
   80bd0:	d503201f 	nop
   80bd4:	d503201f 	nop
   80bd8:	d503201f 	nop
   80bdc:	d503201f 	nop
   80be0:	d503201f 	nop
   80be4:	d503201f 	nop
   80be8:	d503201f 	nop
   80bec:	d503201f 	nop
   80bf0:	d503201f 	nop
   80bf4:	d503201f 	nop
   80bf8:	d503201f 	nop
   80bfc:	d503201f 	nop
   80c00:	d503201f 	nop
   80c04:	d503201f 	nop
   80c08:	d503201f 	nop
   80c0c:	d503201f 	nop
   80c10:	d503201f 	nop
   80c14:	d503201f 	nop
   80c18:	d503201f 	nop
   80c1c:	d503201f 	nop
   80c20:	d503201f 	nop
   80c24:	d503201f 	nop
   80c28:	d503201f 	nop
   80c2c:	d503201f 	nop
   80c30:	d503201f 	nop
   80c34:	d503201f 	nop
   80c38:	d503201f 	nop
   80c3c:	d503201f 	nop
   80c40:	d503201f 	nop
   80c44:	d503201f 	nop
   80c48:	d503201f 	nop
   80c4c:	d503201f 	nop
   80c50:	d503201f 	nop
   80c54:	d503201f 	nop
   80c58:	d503201f 	nop
   80c5c:	d503201f 	nop
   80c60:	d503201f 	nop
   80c64:	d503201f 	nop
   80c68:	d503201f 	nop
   80c6c:	d503201f 	nop
   80c70:	d503201f 	nop
   80c74:	d503201f 	nop
   80c78:	d503201f 	nop
   80c7c:	d503201f 	nop
   80c80:	d503201f 	nop
   80c84:	d503201f 	nop
   80c88:	d503201f 	nop
   80c8c:	d503201f 	nop
   80c90:	d503201f 	nop
   80c94:	d503201f 	nop
   80c98:	d503201f 	nop
   80c9c:	d503201f 	nop
   80ca0:	d503201f 	nop
   80ca4:	d503201f 	nop
   80ca8:	d503201f 	nop
   80cac:	d503201f 	nop
   80cb0:	d503201f 	nop
   80cb4:	d503201f 	nop
   80cb8:	d503201f 	nop
   80cbc:	d503201f 	nop
   80cc0:	d503201f 	nop
   80cc4:	d503201f 	nop
   80cc8:	d503201f 	nop
   80ccc:	d503201f 	nop
   80cd0:	d503201f 	nop
   80cd4:	d503201f 	nop
   80cd8:	d503201f 	nop
   80cdc:	d503201f 	nop
   80ce0:	d503201f 	nop
   80ce4:	d503201f 	nop
   80ce8:	d503201f 	nop
   80cec:	d503201f 	nop
   80cf0:	d503201f 	nop
   80cf4:	d503201f 	nop
   80cf8:	d503201f 	nop
   80cfc:	d503201f 	nop
   80d00:	d503201f 	nop
   80d04:	d503201f 	nop
   80d08:	d503201f 	nop
   80d0c:	d503201f 	nop
   80d10:	d503201f 	nop
   80d14:	d503201f 	nop
   80d18:	d503201f 	nop
   80d1c:	d503201f 	nop
   80d20:	d503201f 	nop
   80d24:	d503201f 	nop
   80d28:	d503201f 	nop
   80d2c:	d503201f 	nop
   80d30:	d503201f 	nop
   80d34:	d503201f 	nop
   80d38:	d503201f 	nop
   80d3c:	d503201f 	nop
   80d40:	d503201f 	nop
   80d44:	d503201f 	nop
   80d48:	d503201f 	nop
   80d4c:	d503201f 	nop
   80d50:	d503201f 	nop
   80d54:	d503201f 	nop
   80d58:	d503201f 	nop
   80d5c:	d503201f 	nop
   80d60:	d503201f 	nop
   80d64:	d503201f 	nop
   80d68:	d503201f 	nop
   80d6c:	d503201f 	nop
   80d70:	d503201f 	nop
   80d74:	d503201f 	nop
   80d78:	d503201f 	nop
   80d7c:	d503201f 	nop
   80d80:	d503201f 	nop
   80d84:	d503201f 	nop
   80d88:	d503201f 	nop
   80d8c:	d503201f 	nop
   80d90:	d503201f 	nop
   80d94:	d503201f 	nop
   80d98:	d503201f 	nop
   80d9c:	d503201f 	nop
   80da0:	d503201f 	nop
   80da4:	d503201f 	nop
   80da8:	d503201f 	nop
   80dac:	d503201f 	nop
   80db0:	d503201f 	nop
   80db4:	d503201f 	nop
   80db8:	d503201f 	nop
   80dbc:	d503201f 	nop
   80dc0:	d503201f 	nop
   80dc4:	d503201f 	nop
   80dc8:	d503201f 	nop
   80dcc:	d503201f 	nop
   80dd0:	d503201f 	nop
   80dd4:	d503201f 	nop
   80dd8:	d503201f 	nop
   80ddc:	d503201f 	nop
   80de0:	d503201f 	nop
   80de4:	d503201f 	nop
   80de8:	d503201f 	nop
   80dec:	d503201f 	nop
   80df0:	d503201f 	nop
   80df4:	d503201f 	nop
   80df8:	d503201f 	nop
   80dfc:	d503201f 	nop
   80e00:	d503201f 	nop
   80e04:	d503201f 	nop
   80e08:	d503201f 	nop
   80e0c:	d503201f 	nop
   80e10:	d503201f 	nop
   80e14:	d503201f 	nop
   80e18:	d503201f 	nop
   80e1c:	d503201f 	nop
   80e20:	d503201f 	nop
   80e24:	d503201f 	nop
   80e28:	d503201f 	nop
   80e2c:	d503201f 	nop
   80e30:	d503201f 	nop
   80e34:	d503201f 	nop
   80e38:	d503201f 	nop
   80e3c:	d503201f 	nop
   80e40:	d503201f 	nop
   80e44:	d503201f 	nop
   80e48:	d503201f 	nop
   80e4c:	d503201f 	nop
   80e50:	d503201f 	nop
   80e54:	d503201f 	nop
   80e58:	d503201f 	nop
   80e5c:	d503201f 	nop
   80e60:	d503201f 	nop
   80e64:	d503201f 	nop
   80e68:	d503201f 	nop
   80e6c:	d503201f 	nop
   80e70:	d503201f 	nop
   80e74:	d503201f 	nop
   80e78:	d503201f 	nop
   80e7c:	d503201f 	nop
   80e80:	d503201f 	nop
   80e84:	d503201f 	nop
   80e88:	d503201f 	nop
   80e8c:	d503201f 	nop
   80e90:	d503201f 	nop
   80e94:	d503201f 	nop
   80e98:	d503201f 	nop
   80e9c:	d503201f 	nop
   80ea0:	d503201f 	nop
   80ea4:	d503201f 	nop
   80ea8:	d503201f 	nop
   80eac:	d503201f 	nop
   80eb0:	d503201f 	nop
   80eb4:	d503201f 	nop
   80eb8:	d503201f 	nop
   80ebc:	d503201f 	nop
   80ec0:	d503201f 	nop
   80ec4:	d503201f 	nop
   80ec8:	d503201f 	nop
   80ecc:	d503201f 	nop
   80ed0:	d503201f 	nop
   80ed4:	d503201f 	nop
   80ed8:	d503201f 	nop
   80edc:	d503201f 	nop
   80ee0:	d503201f 	nop
   80ee4:	d503201f 	nop
   80ee8:	d503201f 	nop
   80eec:	d503201f 	nop
   80ef0:	d503201f 	nop
   80ef4:	d503201f 	nop
   80ef8:	d503201f 	nop
   80efc:	d503201f 	nop
   80f00:	d503201f 	nop
   80f04:	d503201f 	nop
   80f08:	d503201f 	nop
   80f0c:	d503201f 	nop
   80f10:	d503201f 	nop
   80f14:	d503201f 	nop
   80f18:	d503201f 	nop
   80f1c:	d503201f 	nop
   80f20:	d503201f 	nop
   80f24:	d503201f 	nop
   80f28:	d503201f 	nop
   80f2c:	d503201f 	nop
   80f30:	d503201f 	nop
   80f34:	d503201f 	nop
   80f38:	d503201f 	nop
   80f3c:	d503201f 	nop
   80f40:	d503201f 	nop
   80f44:	d503201f 	nop
   80f48:	d503201f 	nop
   80f4c:	d503201f 	nop
   80f50:	d503201f 	nop
   80f54:	d503201f 	nop
   80f58:	d503201f 	nop
   80f5c:	d503201f 	nop
   80f60:	d503201f 	nop
   80f64:	d503201f 	nop
   80f68:	d503201f 	nop
   80f6c:	d503201f 	nop
   80f70:	d503201f 	nop
   80f74:	d503201f 	nop
   80f78:	d503201f 	nop
   80f7c:	d503201f 	nop
   80f80:	d503201f 	nop
   80f84:	d503201f 	nop
   80f88:	d503201f 	nop
   80f8c:	d503201f 	nop
   80f90:	d503201f 	nop
   80f94:	d503201f 	nop
   80f98:	d503201f 	nop
   80f9c:	d503201f 	nop
   80fa0:	d503201f 	nop
   80fa4:	d503201f 	nop
   80fa8:	d503201f 	nop
   80fac:	d503201f 	nop
   80fb0:	d503201f 	nop
   80fb4:	d503201f 	nop
   80fb8:	d503201f 	nop
   80fbc:	d503201f 	nop
   80fc0:	d503201f 	nop
   80fc4:	d503201f 	nop
   80fc8:	d503201f 	nop
   80fcc:	d503201f 	nop
   80fd0:	d503201f 	nop
   80fd4:	d503201f 	nop
   80fd8:	d503201f 	nop
   80fdc:	d503201f 	nop
   80fe0:	d503201f 	nop
   80fe4:	d503201f 	nop
   80fe8:	d503201f 	nop
   80fec:	d503201f 	nop
   80ff0:	d503201f 	nop
   80ff4:	d503201f 	nop
   80ff8:	d503201f 	nop
   80ffc:	d503201f 	nop

0000000000081000 <__ExceptionVectorTable>:
   81000:	d2800020 	mov	x0, #0x1                   	// #1
   81004:	17fffe01 	b	80808 <__exception_trampoline>
   81008:	d503201f 	nop
   8100c:	d503201f 	nop
   81010:	d503201f 	nop
   81014:	d503201f 	nop
   81018:	d503201f 	nop
   8101c:	d503201f 	nop
   81020:	d503201f 	nop
   81024:	d503201f 	nop
   81028:	d503201f 	nop
   8102c:	d503201f 	nop
   81030:	d503201f 	nop
   81034:	d503201f 	nop
   81038:	d503201f 	nop
   8103c:	d503201f 	nop
   81040:	d503201f 	nop
   81044:	d503201f 	nop
   81048:	d503201f 	nop
   8104c:	d503201f 	nop
   81050:	d503201f 	nop
   81054:	d503201f 	nop
   81058:	d503201f 	nop
   8105c:	d503201f 	nop
   81060:	d503201f 	nop
   81064:	d503201f 	nop
   81068:	d503201f 	nop
   8106c:	d503201f 	nop
   81070:	d503201f 	nop
   81074:	d503201f 	nop
   81078:	d503201f 	nop
   8107c:	d503201f 	nop

0000000000081080 <.EXC_CURREL_SP0_Irq>:
   81080:	d2800040 	mov	x0, #0x2                   	// #2
   81084:	17fffde1 	b	80808 <__exception_trampoline>
   81088:	d503201f 	nop
   8108c:	d503201f 	nop
   81090:	d503201f 	nop
   81094:	d503201f 	nop
   81098:	d503201f 	nop
   8109c:	d503201f 	nop
   810a0:	d503201f 	nop
   810a4:	d503201f 	nop
   810a8:	d503201f 	nop
   810ac:	d503201f 	nop
   810b0:	d503201f 	nop
   810b4:	d503201f 	nop
   810b8:	d503201f 	nop
   810bc:	d503201f 	nop
   810c0:	d503201f 	nop
   810c4:	d503201f 	nop
   810c8:	d503201f 	nop
   810cc:	d503201f 	nop
   810d0:	d503201f 	nop
   810d4:	d503201f 	nop
   810d8:	d503201f 	nop
   810dc:	d503201f 	nop
   810e0:	d503201f 	nop
   810e4:	d503201f 	nop
   810e8:	d503201f 	nop
   810ec:	d503201f 	nop
   810f0:	d503201f 	nop
   810f4:	d503201f 	nop
   810f8:	d503201f 	nop
   810fc:	d503201f 	nop

0000000000081100 <.EXC_CURREL_SP0_Fiq>:
   81100:	d2800060 	mov	x0, #0x3                   	// #3
   81104:	17fffdc1 	b	80808 <__exception_trampoline>
   81108:	d503201f 	nop
   8110c:	d503201f 	nop
   81110:	d503201f 	nop
   81114:	d503201f 	nop
   81118:	d503201f 	nop
   8111c:	d503201f 	nop
   81120:	d503201f 	nop
   81124:	d503201f 	nop
   81128:	d503201f 	nop
   8112c:	d503201f 	nop
   81130:	d503201f 	nop
   81134:	d503201f 	nop
   81138:	d503201f 	nop
   8113c:	d503201f 	nop
   81140:	d503201f 	nop
   81144:	d503201f 	nop
   81148:	d503201f 	nop
   8114c:	d503201f 	nop
   81150:	d503201f 	nop
   81154:	d503201f 	nop
   81158:	d503201f 	nop
   8115c:	d503201f 	nop
   81160:	d503201f 	nop
   81164:	d503201f 	nop
   81168:	d503201f 	nop
   8116c:	d503201f 	nop
   81170:	d503201f 	nop
   81174:	d503201f 	nop
   81178:	d503201f 	nop
   8117c:	d503201f 	nop

0000000000081180 <.EXC_CURREL_SP0_SErr>:
   81180:	d2800080 	mov	x0, #0x4                   	// #4
   81184:	17fffda1 	b	80808 <__exception_trampoline>
   81188:	d503201f 	nop
   8118c:	d503201f 	nop
   81190:	d503201f 	nop
   81194:	d503201f 	nop
   81198:	d503201f 	nop
   8119c:	d503201f 	nop
   811a0:	d503201f 	nop
   811a4:	d503201f 	nop
   811a8:	d503201f 	nop
   811ac:	d503201f 	nop
   811b0:	d503201f 	nop
   811b4:	d503201f 	nop
   811b8:	d503201f 	nop
   811bc:	d503201f 	nop
   811c0:	d503201f 	nop
   811c4:	d503201f 	nop
   811c8:	d503201f 	nop
   811cc:	d503201f 	nop
   811d0:	d503201f 	nop
   811d4:	d503201f 	nop
   811d8:	d503201f 	nop
   811dc:	d503201f 	nop
   811e0:	d503201f 	nop
   811e4:	d503201f 	nop
   811e8:	d503201f 	nop
   811ec:	d503201f 	nop
   811f0:	d503201f 	nop
   811f4:	d503201f 	nop
   811f8:	d503201f 	nop
   811fc:	d503201f 	nop

0000000000081200 <.EXC_CURREL_SPX_Sync>:
   81200:	d2800220 	mov	x0, #0x11                  	// #17
   81204:	17fffd81 	b	80808 <__exception_trampoline>
   81208:	d503201f 	nop
   8120c:	d503201f 	nop
   81210:	d503201f 	nop
   81214:	d503201f 	nop
   81218:	d503201f 	nop
   8121c:	d503201f 	nop
   81220:	d503201f 	nop
   81224:	d503201f 	nop
   81228:	d503201f 	nop
   8122c:	d503201f 	nop
   81230:	d503201f 	nop
   81234:	d503201f 	nop
   81238:	d503201f 	nop
   8123c:	d503201f 	nop
   81240:	d503201f 	nop
   81244:	d503201f 	nop
   81248:	d503201f 	nop
   8124c:	d503201f 	nop
   81250:	d503201f 	nop
   81254:	d503201f 	nop
   81258:	d503201f 	nop
   8125c:	d503201f 	nop
   81260:	d503201f 	nop
   81264:	d503201f 	nop
   81268:	d503201f 	nop
   8126c:	d503201f 	nop
   81270:	d503201f 	nop
   81274:	d503201f 	nop
   81278:	d503201f 	nop
   8127c:	d503201f 	nop

0000000000081280 <.EXC_CURREL_SPX_Irq>:
   81280:	d2800240 	mov	x0, #0x12                  	// #18
   81284:	17fffd61 	b	80808 <__exception_trampoline>
   81288:	d503201f 	nop
   8128c:	d503201f 	nop
   81290:	d503201f 	nop
   81294:	d503201f 	nop
   81298:	d503201f 	nop
   8129c:	d503201f 	nop
   812a0:	d503201f 	nop
   812a4:	d503201f 	nop
   812a8:	d503201f 	nop
   812ac:	d503201f 	nop
   812b0:	d503201f 	nop
   812b4:	d503201f 	nop
   812b8:	d503201f 	nop
   812bc:	d503201f 	nop
   812c0:	d503201f 	nop
   812c4:	d503201f 	nop
   812c8:	d503201f 	nop
   812cc:	d503201f 	nop
   812d0:	d503201f 	nop
   812d4:	d503201f 	nop
   812d8:	d503201f 	nop
   812dc:	d503201f 	nop
   812e0:	d503201f 	nop
   812e4:	d503201f 	nop
   812e8:	d503201f 	nop
   812ec:	d503201f 	nop
   812f0:	d503201f 	nop
   812f4:	d503201f 	nop
   812f8:	d503201f 	nop
   812fc:	d503201f 	nop

0000000000081300 <.EXC_CURREL_SPX_Fiq>:
   81300:	d2800260 	mov	x0, #0x13                  	// #19
   81304:	17fffd41 	b	80808 <__exception_trampoline>
   81308:	d503201f 	nop
   8130c:	d503201f 	nop
   81310:	d503201f 	nop
   81314:	d503201f 	nop
   81318:	d503201f 	nop
   8131c:	d503201f 	nop
   81320:	d503201f 	nop
   81324:	d503201f 	nop
   81328:	d503201f 	nop
   8132c:	d503201f 	nop
   81330:	d503201f 	nop
   81334:	d503201f 	nop
   81338:	d503201f 	nop
   8133c:	d503201f 	nop
   81340:	d503201f 	nop
   81344:	d503201f 	nop
   81348:	d503201f 	nop
   8134c:	d503201f 	nop
   81350:	d503201f 	nop
   81354:	d503201f 	nop
   81358:	d503201f 	nop
   8135c:	d503201f 	nop
   81360:	d503201f 	nop
   81364:	d503201f 	nop
   81368:	d503201f 	nop
   8136c:	d503201f 	nop
   81370:	d503201f 	nop
   81374:	d503201f 	nop
   81378:	d503201f 	nop
   8137c:	d503201f 	nop

0000000000081380 <.EXC_CURREL_SPX_SErr>:
   81380:	d2800280 	mov	x0, #0x14                  	// #20
   81384:	17fffd21 	b	80808 <__exception_trampoline>
   81388:	d503201f 	nop
   8138c:	d503201f 	nop
   81390:	d503201f 	nop
   81394:	d503201f 	nop
   81398:	d503201f 	nop
   8139c:	d503201f 	nop
   813a0:	d503201f 	nop
   813a4:	d503201f 	nop
   813a8:	d503201f 	nop
   813ac:	d503201f 	nop
   813b0:	d503201f 	nop
   813b4:	d503201f 	nop
   813b8:	d503201f 	nop
   813bc:	d503201f 	nop
   813c0:	d503201f 	nop
   813c4:	d503201f 	nop
   813c8:	d503201f 	nop
   813cc:	d503201f 	nop
   813d0:	d503201f 	nop
   813d4:	d503201f 	nop
   813d8:	d503201f 	nop
   813dc:	d503201f 	nop
   813e0:	d503201f 	nop
   813e4:	d503201f 	nop
   813e8:	d503201f 	nop
   813ec:	d503201f 	nop
   813f0:	d503201f 	nop
   813f4:	d503201f 	nop
   813f8:	d503201f 	nop
   813fc:	d503201f 	nop

0000000000081400 <.EXC_LOWEREL64_SPX_Sync>:
   81400:	d2800420 	mov	x0, #0x21                  	// #33
   81404:	17fffd01 	b	80808 <__exception_trampoline>
   81408:	d503201f 	nop
   8140c:	d503201f 	nop
   81410:	d503201f 	nop
   81414:	d503201f 	nop
   81418:	d503201f 	nop
   8141c:	d503201f 	nop
   81420:	d503201f 	nop
   81424:	d503201f 	nop
   81428:	d503201f 	nop
   8142c:	d503201f 	nop
   81430:	d503201f 	nop
   81434:	d503201f 	nop
   81438:	d503201f 	nop
   8143c:	d503201f 	nop
   81440:	d503201f 	nop
   81444:	d503201f 	nop
   81448:	d503201f 	nop
   8144c:	d503201f 	nop
   81450:	d503201f 	nop
   81454:	d503201f 	nop
   81458:	d503201f 	nop
   8145c:	d503201f 	nop
   81460:	d503201f 	nop
   81464:	d503201f 	nop
   81468:	d503201f 	nop
   8146c:	d503201f 	nop
   81470:	d503201f 	nop
   81474:	d503201f 	nop
   81478:	d503201f 	nop
   8147c:	d503201f 	nop

0000000000081480 <.EXC_LOWEREL64_SPX_Irq>:
   81480:	d2800440 	mov	x0, #0x22                  	// #34
   81484:	17fffce1 	b	80808 <__exception_trampoline>
   81488:	d503201f 	nop
   8148c:	d503201f 	nop
   81490:	d503201f 	nop
   81494:	d503201f 	nop
   81498:	d503201f 	nop
   8149c:	d503201f 	nop
   814a0:	d503201f 	nop
   814a4:	d503201f 	nop
   814a8:	d503201f 	nop
   814ac:	d503201f 	nop
   814b0:	d503201f 	nop
   814b4:	d503201f 	nop
   814b8:	d503201f 	nop
   814bc:	d503201f 	nop
   814c0:	d503201f 	nop
   814c4:	d503201f 	nop
   814c8:	d503201f 	nop
   814cc:	d503201f 	nop
   814d0:	d503201f 	nop
   814d4:	d503201f 	nop
   814d8:	d503201f 	nop
   814dc:	d503201f 	nop
   814e0:	d503201f 	nop
   814e4:	d503201f 	nop
   814e8:	d503201f 	nop
   814ec:	d503201f 	nop
   814f0:	d503201f 	nop
   814f4:	d503201f 	nop
   814f8:	d503201f 	nop
   814fc:	d503201f 	nop

0000000000081500 <.EXC_LOWEREL64_SPX_Fiq>:
   81500:	d2800460 	mov	x0, #0x23                  	// #35
   81504:	17fffcc1 	b	80808 <__exception_trampoline>
   81508:	d503201f 	nop
   8150c:	d503201f 	nop
   81510:	d503201f 	nop
   81514:	d503201f 	nop
   81518:	d503201f 	nop
   8151c:	d503201f 	nop
   81520:	d503201f 	nop
   81524:	d503201f 	nop
   81528:	d503201f 	nop
   8152c:	d503201f 	nop
   81530:	d503201f 	nop
   81534:	d503201f 	nop
   81538:	d503201f 	nop
   8153c:	d503201f 	nop
   81540:	d503201f 	nop
   81544:	d503201f 	nop
   81548:	d503201f 	nop
   8154c:	d503201f 	nop
   81550:	d503201f 	nop
   81554:	d503201f 	nop
   81558:	d503201f 	nop
   8155c:	d503201f 	nop
   81560:	d503201f 	nop
   81564:	d503201f 	nop
   81568:	d503201f 	nop
   8156c:	d503201f 	nop
   81570:	d503201f 	nop
   81574:	d503201f 	nop
   81578:	d503201f 	nop
   8157c:	d503201f 	nop

0000000000081580 <.EXC_LOWEREL64_SPX_SErr>:
   81580:	d2800480 	mov	x0, #0x24                  	// #36
   81584:	17fffca1 	b	80808 <__exception_trampoline>
   81588:	d503201f 	nop
   8158c:	d503201f 	nop
   81590:	d503201f 	nop
   81594:	d503201f 	nop
   81598:	d503201f 	nop
   8159c:	d503201f 	nop
   815a0:	d503201f 	nop
   815a4:	d503201f 	nop
   815a8:	d503201f 	nop
   815ac:	d503201f 	nop
   815b0:	d503201f 	nop
   815b4:	d503201f 	nop
   815b8:	d503201f 	nop
   815bc:	d503201f 	nop
   815c0:	d503201f 	nop
   815c4:	d503201f 	nop
   815c8:	d503201f 	nop
   815cc:	d503201f 	nop
   815d0:	d503201f 	nop
   815d4:	d503201f 	nop
   815d8:	d503201f 	nop
   815dc:	d503201f 	nop
   815e0:	d503201f 	nop
   815e4:	d503201f 	nop
   815e8:	d503201f 	nop
   815ec:	d503201f 	nop
   815f0:	d503201f 	nop
   815f4:	d503201f 	nop
   815f8:	d503201f 	nop
   815fc:	d503201f 	nop

0000000000081600 <.EXC_LOWEREL32_SPX_Sync>:
   81600:	d2800620 	mov	x0, #0x31                  	// #49
   81604:	17fffc81 	b	80808 <__exception_trampoline>
   81608:	d503201f 	nop
   8160c:	d503201f 	nop
   81610:	d503201f 	nop
   81614:	d503201f 	nop
   81618:	d503201f 	nop
   8161c:	d503201f 	nop
   81620:	d503201f 	nop
   81624:	d503201f 	nop
   81628:	d503201f 	nop
   8162c:	d503201f 	nop
   81630:	d503201f 	nop
   81634:	d503201f 	nop
   81638:	d503201f 	nop
   8163c:	d503201f 	nop
   81640:	d503201f 	nop
   81644:	d503201f 	nop
   81648:	d503201f 	nop
   8164c:	d503201f 	nop
   81650:	d503201f 	nop
   81654:	d503201f 	nop
   81658:	d503201f 	nop
   8165c:	d503201f 	nop
   81660:	d503201f 	nop
   81664:	d503201f 	nop
   81668:	d503201f 	nop
   8166c:	d503201f 	nop
   81670:	d503201f 	nop
   81674:	d503201f 	nop
   81678:	d503201f 	nop
   8167c:	d503201f 	nop

0000000000081680 <.EXC_LOWEREL32_SPX_Irq>:
   81680:	d2800640 	mov	x0, #0x32                  	// #50
   81684:	17fffc61 	b	80808 <__exception_trampoline>
   81688:	d503201f 	nop
   8168c:	d503201f 	nop
   81690:	d503201f 	nop
   81694:	d503201f 	nop
   81698:	d503201f 	nop
   8169c:	d503201f 	nop
   816a0:	d503201f 	nop
   816a4:	d503201f 	nop
   816a8:	d503201f 	nop
   816ac:	d503201f 	nop
   816b0:	d503201f 	nop
   816b4:	d503201f 	nop
   816b8:	d503201f 	nop
   816bc:	d503201f 	nop
   816c0:	d503201f 	nop
   816c4:	d503201f 	nop
   816c8:	d503201f 	nop
   816cc:	d503201f 	nop
   816d0:	d503201f 	nop
   816d4:	d503201f 	nop
   816d8:	d503201f 	nop
   816dc:	d503201f 	nop
   816e0:	d503201f 	nop
   816e4:	d503201f 	nop
   816e8:	d503201f 	nop
   816ec:	d503201f 	nop
   816f0:	d503201f 	nop
   816f4:	d503201f 	nop
   816f8:	d503201f 	nop
   816fc:	d503201f 	nop

0000000000081700 <.EXC_LOWEREL32_SPX_Fiq>:
   81700:	d2800660 	mov	x0, #0x33                  	// #51
   81704:	17fffc41 	b	80808 <__exception_trampoline>
   81708:	d503201f 	nop
   8170c:	d503201f 	nop
   81710:	d503201f 	nop
   81714:	d503201f 	nop
   81718:	d503201f 	nop
   8171c:	d503201f 	nop
   81720:	d503201f 	nop
   81724:	d503201f 	nop
   81728:	d503201f 	nop
   8172c:	d503201f 	nop
   81730:	d503201f 	nop
   81734:	d503201f 	nop
   81738:	d503201f 	nop
   8173c:	d503201f 	nop
   81740:	d503201f 	nop
   81744:	d503201f 	nop
   81748:	d503201f 	nop
   8174c:	d503201f 	nop
   81750:	d503201f 	nop
   81754:	d503201f 	nop
   81758:	d503201f 	nop
   8175c:	d503201f 	nop
   81760:	d503201f 	nop
   81764:	d503201f 	nop
   81768:	d503201f 	nop
   8176c:	d503201f 	nop
   81770:	d503201f 	nop
   81774:	d503201f 	nop
   81778:	d503201f 	nop
   8177c:	d503201f 	nop

0000000000081780 <.EXC_LOWEREL32_SPX_SErr>:
   81780:	d2800680 	mov	x0, #0x34                  	// #52
   81784:	17fffc21 	b	80808 <__exception_trampoline>

0000000000081788 <__rust_entry>:
   81788:	d10103ff 	sub	sp, sp, #0x40
   8178c:	f0000008 	adrp	x8, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   81790:	f90013f4 	str	x20, [sp, #32]
   81794:	a9037bf3 	stp	x19, x30, [sp, #48]
   81798:	2a0003f3 	mov	w19, w0
   8179c:	910003e0 	mov	x0, sp
   817a0:	3dc27d00 	ldr	q0, [x8, #2544]
   817a4:	d5384248 	mrs	x8, currentel
   817a8:	927e0508 	and	x8, x8, #0xc
   817ac:	3d8003e0 	str	q0, [sp]
   817b0:	f9000be8 	str	x8, [sp, #16]
   817b4:	94000335 	bl	82488 <_ZN16ruspiro_register8register29RegisterFieldValue$LT$u64$GT$5value17h2246d405a6591018E>
   817b8:	f100081f 	cmp	x0, #0x2
   817bc:	540000a1 	b.ne	817d0 <__rust_entry+0x48>  // b.any
   817c0:	97fffa2b 	bl	8006c <__switch_el2_to_el1>
   817c4:	d5381048 	mrs	x8, cpacr_el1
   817c8:	b26c0508 	orr	x8, x8, #0x300000
   817cc:	d5181048 	msr	cpacr_el1, x8
   817d0:	2a1303e0 	mov	w0, w19
   817d4:	94000021 	bl	81858 <_ZN12ruspiro_boot5mmu6414initialize_mmu17hbf59d82e46cbda85E>
   817d8:	35000353 	cbnz	w19, 81840 <__rust_entry+0xb8>
   817dc:	940000bb 	bl	81ac8 <_ZN12ruspiro_uart5uart15Uart13new17h49fe92a6f97f66ebE>
   817e0:	52965001 	mov	w1, #0xb280                	// #45696
   817e4:	52984002 	mov	w2, #0xc200                	// #49664
   817e8:	390003e0 	strb	w0, [sp]
   817ec:	72a1dcc1 	movk	w1, #0xee6, lsl #16
   817f0:	72a00022 	movk	w2, #0x1, lsl #16
   817f4:	910003e0 	mov	x0, sp
   817f8:	940000b6 	bl	81ad0 <_ZN12ruspiro_uart5uart15Uart110initialize17h24939a06ff40fab9E>
   817fc:	f0000001 	adrp	x1, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   81800:	528008e2 	mov	w2, #0x47                  	// #71
   81804:	91280021 	add	x1, x1, #0xa00
   81808:	910003e0 	mov	x0, sp
   8180c:	940000ef 	bl	81bc8 <_ZN12ruspiro_uart5uart15Uart111send_string17h19fbfad7ae847e56E>
   81810:	5284e200 	mov	w0, #0x2710                	// #10000
   81814:	9400019b 	bl	81e80 <_ZN13ruspiro_timer5sleep17h279cbcdbb8f764c0E>
   81818:	d0000034 	adrp	x20, 87000 <_DYNAMIC+0xf0>
   8181c:	f9401e94 	ldr	x20, [x20, #56]
   81820:	aa1403e0 	mov	x0, x20
   81824:	940002d9 	bl	82388 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E>
   81828:	91004280 	add	x0, x20, #0x10
   8182c:	9400022d 	bl	820e0 <_ZN17ruspiro_interrupt16InterruptManager10initialize17hd6db96f165282328E>
   81830:	aa1403e0 	mov	x0, x20
   81834:	940002e3 	bl	823c0 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hcb55c707bd8b2049E>
   81838:	910003e0 	mov	x0, sp
   8183c:	94000107 	bl	81c58 <_ZN68_$LT$ruspiro_uart..uart1..Uart1$u20$as$u20$core..ops..drop..Drop$GT$4drop17h5a07b8669530e530E>
   81840:	2a1303e0 	mov	w0, w19
   81844:	97fffabf 	bl	80340 <__kernel_startup>
   81848:	2a1303e0 	mov	w0, w19
   8184c:	97fffadb 	bl	803b8 <__kernel_run>
   81850:	d4200020 	brk	#0x1
   81854:	00000000 	.inst	0x00000000 ; undefined

0000000000081858 <_ZN12ruspiro_boot5mmu6414initialize_mmu17hbf59d82e46cbda85E>:
   81858:	d10103ff 	sub	sp, sp, #0x40
   8185c:	a90253f5 	stp	x21, x20, [sp, #32]
   81860:	a9037bf3 	stp	x19, x30, [sp, #48]
   81864:	350005c0 	cbnz	w0, 8191c <_ZN12ruspiro_boot5mmu6414initialize_mmu17hbf59d82e46cbda85E+0xc4>
   81868:	90000048 	adrp	x8, 89000 <_ZN12ruspiro_boot5mmu647MMU_CFG17h77c624b8203e0bb3E>
   8186c:	5280e22b 	mov	w11, #0x711                 	// #1809
   81870:	91000108 	add	x8, x8, #0x0
   81874:	91400509 	add	x9, x8, #0x1, lsl #12
   81878:	9140090a 	add	x10, x8, #0x2, lsl #12
   8187c:	b2410929 	orr	x9, x9, #0x8000000000000003
   81880:	b241094a 	orr	x10, x10, #0x8000000000000003
   81884:	4e080d60 	dup	v0.2d, x11
   81888:	5280008b 	mov	w11, #0x4                   	// #4
   8188c:	9e670124 	fmov	d4, x9
   81890:	5280e229 	mov	w9, #0x711                 	// #1809
   81894:	72a00809 	movk	w9, #0x40, lsl #16
   81898:	4e080d62 	dup	v2.2d, x11
   8189c:	4e080d21 	dup	v1.2d, x9
   818a0:	f0000009 	adrp	x9, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   818a4:	4e181d44 	mov	v4.d[1], x10
   818a8:	3dc29523 	ldr	q3, [x9, #2640]
   818ac:	aa1f03e9 	mov	x9, xzr
   818b0:	3d800104 	str	q4, [x8]
   818b4:	4f555464 	shl	v4.2d, v3.2d, #21
   818b8:	8b09010a 	add	x10, x8, x9
   818bc:	4ee28463 	add	v3.2d, v3.2d, v2.2d
   818c0:	91008129 	add	x9, x9, #0x20
   818c4:	f13f013f 	cmp	x9, #0xfc0
   818c8:	4ea01c85 	orr	v5.16b, v4.16b, v0.16b
   818cc:	4ee18484 	add	v4.2d, v4.2d, v1.2d
   818d0:	3d840145 	str	q5, [x10, #4096]
   818d4:	3d840544 	str	q4, [x10, #4112]
   818d8:	54fffee1 	b.ne	818b4 <_ZN12ruspiro_boot5mmu6414initialize_mmu17hbf59d82e46cbda85E+0x5c>  // b.any
   818dc:	f0000008 	adrp	x8, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   818e0:	f0000009 	adrp	x9, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   818e4:	f000000a 	adrp	x10, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   818e8:	3dc29900 	ldr	q0, [x8, #2656]
   818ec:	f0000008 	adrp	x8, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   818f0:	3dc29d21 	ldr	q1, [x9, #2672]
   818f4:	b0000049 	adrp	x9, 8a000 <_ZN12ruspiro_boot5mmu647MMU_CFG17h77c624b8203e0bb3E+0x1000>
   818f8:	3dc2a142 	ldr	q2, [x10, #2688]
   818fc:	913f0129 	add	x9, x9, #0xfc0
   81900:	3dc2a503 	ldr	q3, [x8, #2704]
   81904:	52808028 	mov	w8, #0x401                 	// #1025
   81908:	72a80008 	movk	w8, #0x4000, lsl #16
   8190c:	ad000520 	stp	q0, q1, [x9]
   81910:	ad010d22 	stp	q2, q3, [x9, #32]
   81914:	f9002128 	str	x8, [x9, #64]
   81918:	d5033a9f 	dsb	ishst
   8191c:	f0000008 	adrp	x8, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   81920:	910003e0 	mov	x0, sp
   81924:	3dc27d00 	ldr	q0, [x8, #2544]
   81928:	d5384248 	mrs	x8, currentel
   8192c:	927e0508 	and	x8, x8, #0xc
   81930:	3d8003e0 	str	q0, [sp]
   81934:	f9000be8 	str	x8, [sp, #16]
   81938:	940002d4 	bl	82488 <_ZN16ruspiro_register8register29RegisterFieldValue$LT$u64$GT$5value17h2246d405a6591018E>
   8193c:	f100081f 	cmp	x0, #0x2
   81940:	540006a0 	b.eq	81a14 <_ZN12ruspiro_boot5mmu6414initialize_mmu17hbf59d82e46cbda85E+0x1bc>  // b.none
   81944:	f100041f 	cmp	x0, #0x1
   81948:	540005e1 	b.ne	81a04 <_ZN12ruspiro_boot5mmu6414initialize_mmu17hbf59d82e46cbda85E+0x1ac>  // b.any
   8194c:	d2808008 	mov	x8, #0x400                 	// #1024
   81950:	d538a209 	mrs	x9, mair_el1
   81954:	f2a88188 	movk	x8, #0x440c, lsl #16
   81958:	90000040 	adrp	x0, 89000 <_ZN12ruspiro_boot5mmu647MMU_CFG17h77c624b8203e0bb3E>
   8195c:	f2c01fe8 	movk	x8, #0xff, lsl #32
   81960:	91000000 	add	x0, x0, #0x0
   81964:	b3409d09 	bfxil	x9, x8, #0, #40
   81968:	910003e8 	mov	x8, sp
   8196c:	d518a209 	msr	mair_el1, x9
   81970:	940002ca 	bl	82498 <_ZN16ruspiro_register6system7aarch649ttbr0_el15baddr10with_value17ha5726d68ee951ab0E>
   81974:	f94003e8 	ldr	x8, [sp]
   81978:	52800333 	mov	w19, #0x19                  	// #25
   8197c:	f9400be9 	ldr	x9, [sp, #16]
   81980:	d538200a 	mrs	x10, ttbr0_el1
   81984:	2a1303e0 	mov	w0, w19
   81988:	8a280148 	bic	x8, x10, x8
   8198c:	aa090108 	orr	x8, x8, x9
   81990:	d5182008 	msr	ttbr0_el1, x8
   81994:	910003e8 	mov	x8, sp
   81998:	940002e2 	bl	82520 <_ZN16ruspiro_register6system7aarch647tcr_el14T0SZ10with_value17h2011dff7461ad050E>
   8199c:	b9400bf4 	ldr	w20, [sp, #8]
   819a0:	910003e8 	mov	x8, sp
   819a4:	b94003f5 	ldr	w21, [sp]
   819a8:	2a1303e0 	mov	w0, w19
   819ac:	940002d5 	bl	82500 <_ZN16ruspiro_register6system7aarch647tcr_el14T1SZ10with_value17h4173013b39c56686E>
   819b0:	b94003e8 	ldr	w8, [sp]
   819b4:	b9400be9 	ldr	w9, [sp, #8]
   819b8:	d538204a 	mrs	x10, tcr_el1
   819bc:	2a0802a8 	orr	w8, w21, w8
   819c0:	0a280148 	bic	w8, w10, w8
   819c4:	52800f0a 	mov	w10, #0x78                  	// #120
   819c8:	72a00fea 	movk	w10, #0x7f, lsl #16
   819cc:	2a090289 	orr	w9, w20, w9
   819d0:	0a0a0108 	and	w8, w8, w10
   819d4:	5286a00a 	mov	w10, #0x3500                	// #13568
   819d8:	72a7b00a 	movk	w10, #0x3d80, lsl #16
   819dc:	2a080128 	orr	w8, w9, w8
   819e0:	2a0a0108 	orr	w8, w8, w10
   819e4:	d5182048 	msr	tcr_el1, x8
   819e8:	d5381008 	mrs	x8, sctlr_el1
   819ec:	528200a9 	mov	w9, #0x1005                	// #4101
   819f0:	927cf108 	and	x8, x8, #0xfffffffffffffff1
   819f4:	aa090108 	orr	x8, x8, x9
   819f8:	d5181008 	msr	sctlr_el1, x8
   819fc:	d503201f 	nop
   81a00:	d503201f 	nop
   81a04:	a9437bf3 	ldp	x19, x30, [sp, #48]
   81a08:	a94253f5 	ldp	x21, x20, [sp, #32]
   81a0c:	910103ff 	add	sp, sp, #0x40
   81a10:	d65f03c0 	ret
   81a14:	d2808008 	mov	x8, #0x400                 	// #1024
   81a18:	d53ca209 	mrs	x9, mair_el2
   81a1c:	f2a88188 	movk	x8, #0x440c, lsl #16
   81a20:	90000040 	adrp	x0, 89000 <_ZN12ruspiro_boot5mmu647MMU_CFG17h77c624b8203e0bb3E>
   81a24:	f2c01fe8 	movk	x8, #0xff, lsl #32
   81a28:	91000000 	add	x0, x0, #0x0
   81a2c:	b3409d09 	bfxil	x9, x8, #0, #40
   81a30:	910003e8 	mov	x8, sp
   81a34:	d51ca209 	msr	mair_el2, x9
   81a38:	940002a8 	bl	824d8 <_ZN16ruspiro_register6system7aarch649ttbr0_el25baddr10with_value17he00bdda0e676fbddE>
   81a3c:	f94003e8 	ldr	x8, [sp]
   81a40:	52800320 	mov	w0, #0x19                  	// #25
   81a44:	f9400be9 	ldr	x9, [sp, #16]
   81a48:	d53c200a 	mrs	x10, ttbr0_el2
   81a4c:	8a280148 	bic	x8, x10, x8
   81a50:	aa090108 	orr	x8, x8, x9
   81a54:	d51c2008 	msr	ttbr0_el2, x8
   81a58:	910003e8 	mov	x8, sp
   81a5c:	94000299 	bl	824c0 <_ZN16ruspiro_register6system7aarch647tcr_el24T0SZ10with_value17h877a925dccf94987E>
   81a60:	b94003e8 	ldr	w8, [sp]
   81a64:	b9400be9 	ldr	w9, [sp, #8]
   81a68:	d53c204a 	mrs	x10, tcr_el2
   81a6c:	0a280148 	bic	w8, w10, w8
   81a70:	5286a00a 	mov	w10, #0x3500                	// #13568
   81a74:	120d5508 	and	w8, w8, #0xfff801ff
   81a78:	72a0020a 	movk	w10, #0x10, lsl #16
   81a7c:	2a080128 	orr	w8, w9, w8
   81a80:	92820029 	mov	x9, #0xffffffffffffeffe    	// #-4098
   81a84:	2a0a0108 	orr	w8, w8, w10
   81a88:	d51c2048 	msr	tcr_el2, x8
   81a8c:	d53c1108 	mrs	x8, hcr_el2
   81a90:	8a090108 	and	x8, x8, x9
   81a94:	d51c1108 	msr	hcr_el2, x8
   81a98:	d53c1008 	mrs	x8, sctlr_el2
   81a9c:	528200a9 	mov	w9, #0x1005                	// #4101
   81aa0:	927cf108 	and	x8, x8, #0xfffffffffffffff1
   81aa4:	aa090108 	orr	x8, x8, x9
   81aa8:	d51c1008 	msr	sctlr_el2, x8
   81aac:	d503201f 	nop
   81ab0:	d503201f 	nop
   81ab4:	a9437bf3 	ldp	x19, x30, [sp, #48]
   81ab8:	a94253f5 	ldp	x21, x20, [sp, #32]
   81abc:	910103ff 	add	sp, sp, #0x40
   81ac0:	d65f03c0 	ret
   81ac4:	00000000 	.inst	0x00000000 ; undefined

0000000000081ac8 <_ZN12ruspiro_uart5uart15Uart13new17h49fe92a6f97f66ebE>:
   81ac8:	2a1f03e0 	mov	w0, wzr
   81acc:	d65f03c0 	ret

0000000000081ad0 <_ZN12ruspiro_uart5uart15Uart110initialize17h24939a06ff40fab9E>:
   81ad0:	d10183ff 	sub	sp, sp, #0x60
   81ad4:	a9057bf3 	stp	x19, x30, [sp, #80]
   81ad8:	aa0003f3 	mov	x19, x0
   81adc:	d0000020 	adrp	x0, 87000 <_DYNAMIC+0xf0>
   81ae0:	a90453f5 	stp	x21, x20, [sp, #64]
   81ae4:	910003e8 	mov	x8, sp
   81ae8:	2a0203f5 	mov	w21, w2
   81aec:	2a0103f4 	mov	w20, w1
   81af0:	f9402400 	ldr	x0, [x0, #72]
   81af4:	9400006b 	bl	81ca0 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h03a474cf46a122f8E>
   81af8:	f94003e8 	ldr	x8, [sp]
   81afc:	f100051f 	cmp	x8, #0x1
   81b00:	540000c1 	b.ne	81b18 <_ZN12ruspiro_uart5uart15Uart110initialize17h24939a06ff40fab9E+0x48>  // b.any
   81b04:	a94087e0 	ldp	x0, x1, [sp, #8]
   81b08:	a9457bf3 	ldp	x19, x30, [sp, #80]
   81b0c:	a94453f5 	ldp	x21, x20, [sp, #64]
   81b10:	910183ff 	add	sp, sp, #0x60
   81b14:	d65f03c0 	ret
   81b18:	f0000008 	adrp	x8, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   81b1c:	f0000009 	adrp	x9, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   81b20:	f000000a 	adrp	x10, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   81b24:	f000000b 	adrp	x11, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   81b28:	f000000d 	adrp	x13, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   81b2c:	f000000f 	adrp	x15, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   81b30:	f945510c 	ldr	x12, [x8, #2720]
   81b34:	52800028 	mov	w8, #0x1                   	// #1
   81b38:	f945552e 	ldr	x14, [x9, #2728]
   81b3c:	f9455949 	ldr	x9, [x10, #2736]
   81b40:	5280006a 	mov	w10, #0x3                   	// #3
   81b44:	f9455d6b 	ldr	x11, [x11, #2744]
   81b48:	f94561ad 	ldr	x13, [x13, #2752]
   81b4c:	b9000188 	str	w8, [x12]
   81b50:	b90001df 	str	wzr, [x14]
   81b54:	b900013f 	str	wzr, [x9]
   81b58:	f94565ec 	ldr	x12, [x15, #2760]
   81b5c:	528018cf 	mov	w15, #0xc6                  	// #198
   81b60:	b900016a 	str	w10, [x11]
   81b64:	531d72ab 	lsl	w11, w21, #3
   81b68:	b90001bf 	str	wzr, [x13]
   81b6c:	b90001df 	str	wzr, [x14]
   81b70:	b900018f 	str	w15, [x12]
   81b74:	340001cb 	cbz	w11, 81bac <_ZN12ruspiro_uart5uart15Uart110initialize17h24939a06ff40fab9E+0xdc>
   81b78:	f000000c 	adrp	x12, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   81b7c:	1acb0a8b 	udiv	w11, w20, w11
   81b80:	aa1f03e0 	mov	x0, xzr
   81b84:	aa1f03e1 	mov	x1, xzr
   81b88:	5100056b 	sub	w11, w11, #0x1
   81b8c:	f945698c 	ldr	x12, [x12, #2768]
   81b90:	b900018b 	str	w11, [x12]
   81b94:	b900012a 	str	w10, [x9]
   81b98:	39000268 	strb	w8, [x19]
   81b9c:	a9457bf3 	ldp	x19, x30, [sp, #80]
   81ba0:	a94453f5 	ldp	x21, x20, [sp, #64]
   81ba4:	910183ff 	add	sp, sp, #0x60
   81ba8:	d65f03c0 	ret
   81bac:	f0000000 	adrp	x0, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   81bb0:	b0000022 	adrp	x2, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   81bb4:	912cc000 	add	x0, x0, #0xb30
   81bb8:	52800321 	mov	w1, #0x19                  	// #25
   81bbc:	91166042 	add	x2, x2, #0x598
   81bc0:	94000ae6 	bl	84758 <_ZN4core9panicking5panic17hc6f3025301472b62E>
   81bc4:	d4200020 	brk	#0x1

0000000000081bc8 <_ZN12ruspiro_uart5uart15Uart111send_string17h19fbfad7ae847e56E>:
   81bc8:	f81c0ff8 	str	x24, [sp, #-64]!
   81bcc:	39400008 	ldrb	w8, [x0]
   81bd0:	a9015bf7 	stp	x23, x22, [sp, #16]
   81bd4:	a90253f5 	stp	x21, x20, [sp, #32]
   81bd8:	a9037bf3 	stp	x19, x30, [sp, #48]
   81bdc:	7100011f 	cmp	w8, #0x0
   81be0:	fa401844 	ccmp	x2, #0x0, #0x4, ne  // ne = any
   81be4:	54000300 	b.eq	81c44 <_ZN12ruspiro_uart5uart15Uart111send_string17h19fbfad7ae847e56E+0x7c>  // b.none
   81be8:	f0000008 	adrp	x8, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   81bec:	f0000009 	adrp	x9, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   81bf0:	aa0103f3 	mov	x19, x1
   81bf4:	8b020037 	add	x23, x1, x2
   81bf8:	52800154 	mov	w20, #0xa                   	// #10
   81bfc:	f9456d15 	ldr	x21, [x8, #2776]
   81c00:	f9457136 	ldr	x22, [x9, #2784]
   81c04:	b94002a8 	ldr	w8, [x21]
   81c08:	91000678 	add	x24, x19, #0x1
   81c0c:	36280128 	tbz	w8, #5, 81c30 <_ZN12ruspiro_uart5uart15Uart111send_string17h19fbfad7ae847e56E+0x68>
   81c10:	39400268 	ldrb	w8, [x19]
   81c14:	aa1803f3 	mov	x19, x24
   81c18:	eb17031f 	cmp	x24, x23
   81c1c:	b90002c8 	str	w8, [x22]
   81c20:	54000120 	b.eq	81c44 <_ZN12ruspiro_uart5uart15Uart111send_string17h19fbfad7ae847e56E+0x7c>  // b.none
   81c24:	b94002a8 	ldr	w8, [x21]
   81c28:	91000678 	add	x24, x19, #0x1
   81c2c:	372fff28 	tbnz	w8, #5, 81c10 <_ZN12ruspiro_uart5uart15Uart111send_string17h19fbfad7ae847e56E+0x48>
   81c30:	2a1403e0 	mov	w0, w20
   81c34:	940000a3 	bl	81ec0 <_ZN13ruspiro_timer11sleepcycles17hcaf8521ef438039dE>
   81c38:	b94002a8 	ldr	w8, [x21]
   81c3c:	362fffa8 	tbz	w8, #5, 81c30 <_ZN12ruspiro_uart5uart15Uart111send_string17h19fbfad7ae847e56E+0x68>
   81c40:	17fffff4 	b	81c10 <_ZN12ruspiro_uart5uart15Uart111send_string17h19fbfad7ae847e56E+0x48>
   81c44:	a9437bf3 	ldp	x19, x30, [sp, #48]
   81c48:	a94253f5 	ldp	x21, x20, [sp, #32]
   81c4c:	a9415bf7 	ldp	x23, x22, [sp, #16]
   81c50:	f84407f8 	ldr	x24, [sp], #64
   81c54:	d65f03c0 	ret

0000000000081c58 <_ZN68_$LT$ruspiro_uart..uart1..Uart1$u20$as$u20$core..ops..drop..Drop$GT$4drop17h5a07b8669530e530E>:
   81c58:	f81e0ff4 	str	x20, [sp, #-32]!
   81c5c:	a9017bf3 	stp	x19, x30, [sp, #16]
   81c60:	d0000033 	adrp	x19, 87000 <_DYNAMIC+0xf0>
   81c64:	f9402673 	ldr	x19, [x19, #72]
   81c68:	aa1303e0 	mov	x0, x19
   81c6c:	940001c7 	bl	82388 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E>
   81c70:	91004274 	add	x20, x19, #0x10
   81c74:	528001c1 	mov	w1, #0xe                   	// #14
   81c78:	aa1403e0 	mov	x0, x20
   81c7c:	9400010b 	bl	820a8 <_ZN12ruspiro_gpio4Gpio8free_pin17hc61071ceda926edfE>
   81c80:	aa1403e0 	mov	x0, x20
   81c84:	528001e1 	mov	w1, #0xf                   	// #15
   81c88:	94000108 	bl	820a8 <_ZN12ruspiro_gpio4Gpio8free_pin17hc61071ceda926edfE>
   81c8c:	aa1303e0 	mov	x0, x19
   81c90:	a9417bf3 	ldp	x19, x30, [sp, #16]
   81c94:	f84207f4 	ldr	x20, [sp], #32
   81c98:	140001ca 	b	823c0 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hcb55c707bd8b2049E>
   81c9c:	00000000 	.inst	0x00000000 ; undefined

0000000000081ca0 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h03a474cf46a122f8E>:
   81ca0:	d102c3ff 	sub	sp, sp, #0xb0
   81ca4:	a9066bfb 	stp	x27, x26, [sp, #96]
   81ca8:	a90763f9 	stp	x25, x24, [sp, #112]
   81cac:	a9085bf7 	stp	x23, x22, [sp, #128]
   81cb0:	a90953f5 	stp	x21, x20, [sp, #144]
   81cb4:	aa0003f4 	mov	x20, x0
   81cb8:	a90a7bf3 	stp	x19, x30, [sp, #160]
   81cbc:	aa0803f3 	mov	x19, x8
   81cc0:	940001b2 	bl	82388 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E>
   81cc4:	91004295 	add	x21, x20, #0x10
   81cc8:	910083e8 	add	x8, sp, #0x20
   81ccc:	aa1503e0 	mov	x0, x21
   81cd0:	528001c1 	mov	w1, #0xe                   	// #14
   81cd4:	94000099 	bl	81f38 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE>
   81cd8:	f94013e8 	ldr	x8, [sp, #32]
   81cdc:	f0000019 	adrp	x25, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   81ce0:	f100051f 	cmp	x8, #0x1
   81ce4:	54000081 	b.ne	81cf4 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h03a474cf46a122f8E+0x54>  // b.any
   81ce8:	a942dff6 	ldp	x22, x23, [sp, #40]
   81cec:	52800038 	mov	w24, #0x1                   	// #1
   81cf0:	1400001c 	b	81d60 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h03a474cf46a122f8E+0xc0>
   81cf4:	a942dff6 	ldp	x22, x23, [sp, #40]
   81cf8:	5280004d 	mov	w13, #0x2                   	// #2
   81cfc:	f94023e8 	ldr	x8, [sp, #64]
   81d00:	29492fea 	ldp	w10, w11, [sp, #72]
   81d04:	b94057e9 	ldr	w9, [sp, #84]
   81d08:	b94002cc 	ldr	w12, [x22]
   81d0c:	1acb21ab 	lsl	w11, w13, w11
   81d10:	0a2a018c 	bic	w12, w12, w10
   81d14:	0a0a016a 	and	w10, w11, w10
   81d18:	2a0a018b 	orr	w11, w12, w10
   81d1c:	f945ab2a 	ldr	x10, [x25, #2896]
   81d20:	b90002cb 	str	w11, [x22]
   81d24:	b940014b 	ldr	w11, [x10]
   81d28:	121e756c 	and	w12, w11, #0xfffffffc
   81d2c:	528012cb 	mov	w11, #0x96                  	// #150
   81d30:	b900014c 	str	w12, [x10]
   81d34:	7100056b 	subs	w11, w11, #0x1
   81d38:	d503201f 	nop
   81d3c:	54ffffc1 	b.ne	81d34 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h03a474cf46a122f8E+0x94>  // b.any
   81d40:	528012cb 	mov	w11, #0x96                  	// #150
   81d44:	b9000109 	str	w9, [x8]
   81d48:	7100056b 	subs	w11, w11, #0x1
   81d4c:	d503201f 	nop
   81d50:	54ffffc1 	b.ne	81d48 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h03a474cf46a122f8E+0xa8>  // b.any
   81d54:	aa1f03f8 	mov	x24, xzr
   81d58:	b900015f 	str	wzr, [x10]
   81d5c:	b9000109 	str	w9, [x8]
   81d60:	910083e8 	add	x8, sp, #0x20
   81d64:	aa1503e0 	mov	x0, x21
   81d68:	528001e1 	mov	w1, #0xf                   	// #15
   81d6c:	94000073 	bl	81f38 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE>
   81d70:	f94013e8 	ldr	x8, [sp, #32]
   81d74:	f100051f 	cmp	x8, #0x1
   81d78:	540000c1 	b.ne	81d90 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h03a474cf46a122f8E+0xf0>  // b.any
   81d7c:	a942a3e9 	ldp	x9, x8, [sp, #40]
   81d80:	5280002c 	mov	w12, #0x1                   	// #1
   81d84:	3d8007e0 	str	q0, [sp, #16]
   81d88:	3d8003e0 	str	q0, [sp]
   81d8c:	14000024 	b	81e1c <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h03a474cf46a122f8E+0x17c>
   81d90:	2949abeb 	ldp	w11, w10, [sp, #76]
   81d94:	5280004e 	mov	w14, #0x2                   	// #2
   81d98:	a942a3e9 	ldp	x9, x8, [sp, #40]
   81d9c:	b9404bf5 	ldr	w21, [sp, #72]
   81da0:	b3607d4b 	bfi	x11, x10, #32, #32
   81da4:	a943ebfb 	ldp	x27, x26, [sp, #56]
   81da8:	9e670160 	fmov	d0, x11
   81dac:	294aafec 	ldp	w12, w11, [sp, #84]
   81db0:	b940012a 	ldr	w10, [x9]
   81db4:	b3607d6c 	bfi	x12, x11, #32, #32
   81db8:	528012cb 	mov	w11, #0x96                  	// #150
   81dbc:	1e26000d 	fmov	w13, s0
   81dc0:	0a35014a 	bic	w10, w10, w21
   81dc4:	9e670181 	fmov	d1, x12
   81dc8:	1acd21cd 	lsl	w13, w14, w13
   81dcc:	0a1501ad 	and	w13, w13, w21
   81dd0:	2a0d014d 	orr	w13, w10, w13
   81dd4:	f945ab2a 	ldr	x10, [x25, #2896]
   81dd8:	b900012d 	str	w13, [x9]
   81ddc:	b940014d 	ldr	w13, [x10]
   81de0:	121e75ad 	and	w13, w13, #0xfffffffc
   81de4:	b900014d 	str	w13, [x10]
   81de8:	7100056b 	subs	w11, w11, #0x1
   81dec:	d503201f 	nop
   81df0:	54ffffc1 	b.ne	81de8 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h03a474cf46a122f8E+0x148>  // b.any
   81df4:	1e26002b 	fmov	w11, s1
   81df8:	528012cc 	mov	w12, #0x96                  	// #150
   81dfc:	ad0003e1 	stp	q1, q0, [sp]
   81e00:	bd000341 	str	s1, [x26]
   81e04:	7100058c 	subs	w12, w12, #0x1
   81e08:	d503201f 	nop
   81e0c:	54ffffc1 	b.ne	81e04 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h03a474cf46a122f8E+0x164>  // b.any
   81e10:	aa1f03ec 	mov	x12, xzr
   81e14:	b900015f 	str	wzr, [x10]
   81e18:	b900034b 	str	w11, [x26]
   81e1c:	aa1403e0 	mov	x0, x20
   81e20:	f100031f 	cmp	x24, #0x0
   81e24:	9a9f0598 	csinc	x24, x12, xzr, eq  // eq = none
   81e28:	9a8912d6 	csel	x22, x22, x9, ne  // ne = any
   81e2c:	9a8812f7 	csel	x23, x23, x8, ne  // ne = any
   81e30:	94000164 	bl	823c0 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hcb55c707bd8b2049E>
   81e34:	3dc007e0 	ldr	q0, [sp, #16]
   81e38:	a9005a78 	stp	x24, x22, [x19]
   81e3c:	a9016e77 	stp	x23, x27, [x19, #16]
   81e40:	f900127a 	str	x26, [x19, #32]
   81e44:	9e660008 	fmov	x8, d0
   81e48:	3dc003e0 	ldr	q0, [sp]
   81e4c:	a9485bf7 	ldp	x23, x22, [sp, #128]
   81e50:	a94763f9 	ldp	x25, x24, [sp, #112]
   81e54:	9e66000a 	fmov	x10, d0
   81e58:	a9466bfb 	ldp	x27, x26, [sp, #96]
   81e5c:	d360fd09 	lsr	x9, x8, #32
   81e60:	29052275 	stp	w21, w8, [x19, #40]
   81e64:	a94953f5 	ldp	x21, x20, [sp, #144]
   81e68:	d360fd48 	lsr	x8, x10, #32
   81e6c:	29062a69 	stp	w9, w10, [x19, #48]
   81e70:	b9003a68 	str	w8, [x19, #56]
   81e74:	a94a7bf3 	ldp	x19, x30, [sp, #160]
   81e78:	9102c3ff 	add	sp, sp, #0xb0
   81e7c:	d65f03c0 	ret

0000000000081e80 <_ZN13ruspiro_timer5sleep17h279cbcdbb8f764c0E>:
   81e80:	f0000008 	adrp	x8, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   81e84:	f0000009 	adrp	x9, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   81e88:	f945ad08 	ldr	x8, [x8, #2904]
   81e8c:	f945b129 	ldr	x9, [x9, #2912]
   81e90:	b940010a 	ldr	w10, [x8]
   81e94:	b940012b 	ldr	w11, [x9]
   81e98:	b3607d6a 	bfi	x10, x11, #32, #32
   81e9c:	ab00014a 	adds	x10, x10, x0
   81ea0:	540000c0 	b.eq	81eb8 <_ZN13ruspiro_timer5sleep17h279cbcdbb8f764c0E+0x38>  // b.none
   81ea4:	b940010b 	ldr	w11, [x8]
   81ea8:	b940012c 	ldr	w12, [x9]
   81eac:	b3607d8b 	bfi	x11, x12, #32, #32
   81eb0:	eb0a017f 	cmp	x11, x10
   81eb4:	54ffff83 	b.cc	81ea4 <_ZN13ruspiro_timer5sleep17h279cbcdbb8f764c0E+0x24>  // b.lo, b.ul, b.last
   81eb8:	d65f03c0 	ret
   81ebc:	00000000 	.inst	0x00000000 ; undefined

0000000000081ec0 <_ZN13ruspiro_timer11sleepcycles17hcaf8521ef438039dE>:
   81ec0:	34000080 	cbz	w0, 81ed0 <_ZN13ruspiro_timer11sleepcycles17hcaf8521ef438039dE+0x10>
   81ec4:	71000400 	subs	w0, w0, #0x1
   81ec8:	d503201f 	nop
   81ecc:	54ffffc1 	b.ne	81ec4 <_ZN13ruspiro_timer11sleepcycles17hcaf8521ef438039dE+0x4>  // b.any
   81ed0:	d65f03c0 	ret
   81ed4:	00000000 	.inst	0x00000000 ; undefined

0000000000081ed8 <lit_debug_led>:
   81ed8:	529999a8 	mov	w8, #0xcccd                	// #52429
   81edc:	52800149 	mov	w9, #0xa                   	// #10
   81ee0:	72b99988 	movk	w8, #0xcccc, lsl #16
   81ee4:	52a7e40a 	mov	w10, #0x3f200000            	// #1059061760
   81ee8:	528000ec 	mov	w12, #0x7                   	// #7
   81eec:	5280002d 	mov	w13, #0x1                   	// #1
   81ef0:	9ba87c08 	umull	x8, w0, w8
   81ef4:	d363fd08 	lsr	x8, x8, #35
   81ef8:	d37ef50b 	lsl	x11, x8, #2
   81efc:	1b098108 	msub	w8, w8, w9, w0
   81f00:	b86a6969 	ldr	w9, [x11, x10]
   81f04:	0b080508 	add	w8, w8, w8, lsl #1
   81f08:	1ac8218c 	lsl	w12, w12, w8
   81f0c:	0a2c0129 	bic	w9, w9, w12
   81f10:	1ac821a8 	lsl	w8, w13, w8
   81f14:	2a0003ec 	mov	w12, w0
   81f18:	2a080128 	orr	w8, w9, w8
   81f1c:	52800389 	mov	w9, #0x1c                  	// #28
   81f20:	72a7e409 	movk	w9, #0x3f20, lsl #16
   81f24:	d345fd8c 	lsr	x12, x12, #5
   81f28:	1ac021ad 	lsl	w13, w13, w0
   81f2c:	b82a6968 	str	w8, [x11, x10]
   81f30:	b829698d 	str	w13, [x12, x9]
   81f34:	d65f03c0 	ret

0000000000081f38 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE>:
   81f38:	d10143ff 	sub	sp, sp, #0x50
   81f3c:	2a0103e9 	mov	w9, w1
   81f40:	71009c3f 	cmp	w1, #0x27
   81f44:	54000848 	b.hi	8204c <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE+0x114>  // b.pmore
   81f48:	3869680a 	ldrb	w10, [x0, x9]
   81f4c:	3400012a 	cbz	w10, 81f70 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE+0x38>
   81f50:	f0000009 	adrp	x9, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   81f54:	5280038a 	mov	w10, #0x1c                  	// #28
   81f58:	912e7d29 	add	x9, x9, #0xb9f
   81f5c:	5280002c 	mov	w12, #0x1                   	// #1
   81f60:	a900a909 	stp	x9, x10, [x8, #8]
   81f64:	f900010c 	str	x12, [x8]
   81f68:	910143ff 	add	sp, sp, #0x50
   81f6c:	d65f03c0 	ret
   81f70:	529999ac 	mov	w12, #0xcccd                	// #52429
   81f74:	12001c2b 	and	w11, w1, #0xff
   81f78:	72b9998c 	movk	w12, #0xcccc, lsl #16
   81f7c:	5280002a 	mov	w10, #0x1                   	// #1
   81f80:	9bac7d6b 	umull	x11, w11, w12
   81f84:	3829680a 	strb	w10, [x0, x9]
   81f88:	d363fd6c 	lsr	x12, x11, #35
   81f8c:	7100159f 	cmp	w12, #0x5
   81f90:	b9000fe1 	str	w1, [sp, #12]
   81f94:	54000688 	b.hi	82064 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE+0x12c>  // b.pmore
   81f98:	52800149 	mov	w9, #0xa                   	// #10
   81f9c:	f000000d 	adrp	x13, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   81fa0:	912da1ad 	add	x13, x13, #0xb68
   81fa4:	5280008a 	mov	w10, #0x4                   	// #4
   81fa8:	1b098589 	msub	w9, w12, w9, w1
   81fac:	72a7e40a 	movk	w10, #0x3f20, lsl #16
   81fb0:	52a7e40b 	mov	w11, #0x3f200000            	// #1059061760
   81fb4:	100000ce 	adr	x14, 81fcc <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE+0x94>
   81fb8:	386c69af 	ldrb	w15, [x13, x12]
   81fbc:	8b0f09ce 	add	x14, x14, x15, lsl #2
   81fc0:	0b090529 	add	w9, w9, w9, lsl #1
   81fc4:	12001d29 	and	w9, w9, #0xff
   81fc8:	d61f01c0 	br	x14
   81fcc:	aa0a03eb 	mov	x11, x10
   81fd0:	14000008 	b	81ff0 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE+0xb8>
   81fd4:	9100314b 	add	x11, x10, #0xc
   81fd8:	14000006 	b	81ff0 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE+0xb8>
   81fdc:	9100114b 	add	x11, x10, #0x4
   81fe0:	14000004 	b	81ff0 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE+0xb8>
   81fe4:	9100214b 	add	x11, x10, #0x8
   81fe8:	14000002 	b	81ff0 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE+0xb8>
   81fec:	9100414b 	add	x11, x10, #0x10
   81ff0:	9100614d 	add	x13, x10, #0x18
   81ff4:	9100714e 	add	x14, x10, #0x1c
   81ff8:	7100803f 	cmp	w1, #0x20
   81ffc:	9100914f 	add	x15, x10, #0x24
   82000:	9100a150 	add	x16, x10, #0x28
   82004:	9a8e31ad 	csel	x13, x13, x14, cc  // cc = lo, ul, last
   82008:	9a9031ee 	csel	x14, x15, x16, cc  // cc = lo, ul, last
   8200c:	9102514f 	add	x15, x10, #0x94
   82010:	9102614a 	add	x10, x10, #0x98
   82014:	aa1f03ec 	mov	x12, xzr
   82018:	9a8a31ea 	csel	x10, x15, x10, cc  // cc = lo, ul, last
   8201c:	a900b50b 	stp	x11, x13, [x8, #8]
   82020:	528000eb 	mov	w11, #0x7                   	// #7
   82024:	5280002d 	mov	w13, #0x1                   	// #1
   82028:	1ac9216b 	lsl	w11, w11, w9
   8202c:	b9003901 	str	w1, [x8, #56]
   82030:	a901a90e 	stp	x14, x10, [x8, #24]
   82034:	1ac121aa 	lsl	w10, w13, w1
   82038:	2905250b 	stp	w11, w9, [x8, #40]
   8203c:	2906290a 	stp	w10, w10, [x8, #48]
   82040:	f900010c 	str	x12, [x8]
   82044:	910143ff 	add	sp, sp, #0x50
   82048:	d65f03c0 	ret
   8204c:	90000020 	adrp	x0, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   82050:	52800502 	mov	w2, #0x28                  	// #40
   82054:	9116c000 	add	x0, x0, #0x5b0
   82058:	aa0903e1 	mov	x1, x9
   8205c:	940009cb 	bl	84788 <_ZN4core9panicking18panic_bounds_check17h61bb2fd281420b4eE>
   82060:	d4200020 	brk	#0x1
   82064:	b0000029 	adrp	x9, 87000 <_DYNAMIC+0xf0>
   82068:	910033eb 	add	x11, sp, #0xc
   8206c:	9000002a 	adrp	x10, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   82070:	90000021 	adrp	x1, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   82074:	52800028 	mov	w8, #0x1                   	// #1
   82078:	9117814a 	add	x10, x10, #0x5e0
   8207c:	f9402129 	ldr	x9, [x9, #64]
   82080:	9117c021 	add	x1, x1, #0x5f0
   82084:	910043e0 	add	x0, sp, #0x10
   82088:	a9027fff 	stp	xzr, xzr, [sp, #32]
   8208c:	a90123ea 	stp	x10, x8, [sp, #16]
   82090:	a90427eb 	stp	x11, x9, [sp, #64]
   82094:	910103e9 	add	x9, sp, #0x40
   82098:	a90323e9 	stp	x9, x8, [sp, #48]
   8209c:	940009ce 	bl	847d4 <_ZN4core9panicking9panic_fmt17heca5e185b37feb0aE>
   820a0:	d4200020 	brk	#0x1
   820a4:	00000000 	.inst	0x00000000 ; undefined

00000000000820a8 <_ZN12ruspiro_gpio4Gpio8free_pin17hc61071ceda926edfE>:
   820a8:	2a0103e8 	mov	w8, w1
   820ac:	2a0103e1 	mov	w1, w1
   820b0:	71009d1f 	cmp	w8, #0x27
   820b4:	540000a8 	b.hi	820c8 <_ZN12ruspiro_gpio4Gpio8free_pin17hc61071ceda926edfE+0x20>  // b.pmore
   820b8:	38616808 	ldrb	w8, [x0, x1]
   820bc:	34000048 	cbz	w8, 820c4 <_ZN12ruspiro_gpio4Gpio8free_pin17hc61071ceda926edfE+0x1c>
   820c0:	3821681f 	strb	wzr, [x0, x1]
   820c4:	d65f03c0 	ret
   820c8:	90000020 	adrp	x0, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   820cc:	52800502 	mov	w2, #0x28                  	// #40
   820d0:	91172000 	add	x0, x0, #0x5c8
   820d4:	940009ad 	bl	84788 <_ZN4core9panicking18panic_bounds_check17h61bb2fd281420b4eE>
   820d8:	d4200020 	brk	#0x1
   820dc:	00000000 	.inst	0x00000000 ; undefined

00000000000820e0 <_ZN17ruspiro_interrupt16InterruptManager10initialize17hd6db96f165282328E>:
   820e0:	d0000008 	adrp	x8, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   820e4:	d0000009 	adrp	x9, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   820e8:	d000000a 	adrp	x10, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   820ec:	d000000b 	adrp	x11, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   820f0:	1280000c 	mov	w12, #0xffffffff            	// #-1
   820f4:	f9460908 	ldr	x8, [x8, #3088]
   820f8:	f9460d29 	ldr	x9, [x9, #3096]
   820fc:	f946114a 	ldr	x10, [x10, #3104]
   82100:	f946156b 	ldr	x11, [x11, #3112]
   82104:	b900010c 	str	w12, [x8]
   82108:	d0000008 	adrp	x8, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   8210c:	b900012c 	str	w12, [x9]
   82110:	d0000009 	adrp	x9, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   82114:	b900014c 	str	w12, [x10]
   82118:	d5033fbf 	dmb	sy
   8211c:	b900017f 	str	wzr, [x11]
   82120:	d000000a 	adrp	x10, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   82124:	d000000b 	adrp	x11, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   82128:	f9461908 	ldr	x8, [x8, #3120]
   8212c:	f9461d29 	ldr	x9, [x9, #3128]
   82130:	5280010c 	mov	w12, #0x8                   	// #8
   82134:	f946214a 	ldr	x10, [x10, #3136]
   82138:	f946256b 	ldr	x11, [x11, #3144]
   8213c:	b900010c 	str	w12, [x8]
   82140:	b900012c 	str	w12, [x9]
   82144:	b900014c 	str	w12, [x10]
   82148:	b900016c 	str	w12, [x11]
   8214c:	d65f03c0 	ret

0000000000082150 <__exception_handler_default>:
   82150:	f1004c1f 	cmp	x0, #0x13
   82154:	540000e8 	b.hi	82170 <__exception_handler_default+0x20>  // b.pmore
   82158:	52800028 	mov	w8, #0x1                   	// #1
   8215c:	320e87e9 	mov	w9, #0xc000c               	// #786444
   82160:	9ac02108 	lsl	x8, x8, x0
   82164:	ea09011f 	tst	x8, x9
   82168:	54000040 	b.eq	82170 <__exception_handler_default+0x20>  // b.none
   8216c:	14000003 	b	82178 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E>
   82170:	d65f03c0 	ret
   82174:	00000000 	.inst	0x00000000 ; undefined

0000000000082178 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E>:
   82178:	a9bd5bf7 	stp	x23, x22, [sp, #-48]!
   8217c:	a90153f5 	stp	x21, x20, [sp, #16]
   82180:	a9027bf3 	stp	x19, x30, [sp, #32]
   82184:	94000091 	bl	823c8 <_ZN22ruspiro_interrupt_core26entering_interrupt_handler17hce8bb23066ca077bE>
   82188:	d0000008 	adrp	x8, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   8218c:	d0000009 	adrp	x9, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   82190:	d000000a 	adrp	x10, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   82194:	b000002b 	adrp	x11, 87000 <_DYNAMIC+0xf0>
   82198:	f9463508 	ldr	x8, [x8, #3176]
   8219c:	f9463929 	ldr	x9, [x9, #3184]
   821a0:	f9463d4a 	ldr	x10, [x10, #3192]
   821a4:	f9401d6b 	ldr	x11, [x11, #56]
   821a8:	b9400108 	ldr	w8, [x8]
   821ac:	b9400129 	ldr	w9, [x9]
   821b0:	b9400154 	ldr	w20, [x10]
   821b4:	2942316a 	ldp	w10, w12, [x11, #16]
   821b8:	b9401975 	ldr	w21, [x11, #24]
   821bc:	6a080156 	ands	w22, w10, w8
   821c0:	0a090193 	and	w19, w12, w9
   821c4:	540005e0 	b.eq	82280 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x108>  // b.none
   821c8:	37080256 	tbnz	w22, #1, 82210 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x98>
   821cc:	37180276 	tbnz	w22, #3, 82218 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xa0>
   821d0:	37400296 	tbnz	w22, #8, 82220 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xa8>
   821d4:	374802b6 	tbnz	w22, #9, 82228 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xb0>
   821d8:	376002d6 	tbnz	w22, #12, 82230 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xb8>
   821dc:	376802f6 	tbnz	w22, #13, 82238 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xc0>
   821e0:	37700316 	tbnz	w22, #14, 82240 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xc8>
   821e4:	37780336 	tbnz	w22, #15, 82248 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xd0>
   821e8:	36e80456 	tbz	w22, #29, 82270 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xf8>
   821ec:	d0000008 	adrp	x8, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   821f0:	f9460517 	ldr	x23, [x8, #3080]
   821f4:	b94002e8 	ldr	w8, [x23]
   821f8:	370002e8 	tbnz	w8, #0, 82254 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xdc>
   821fc:	b94002e8 	ldr	w8, [x23]
   82200:	37080308 	tbnz	w8, #1, 82260 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xe8>
   82204:	b94002e8 	ldr	w8, [x23]
   82208:	37100328 	tbnz	w8, #2, 8226c <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xf4>
   8220c:	14000019 	b	82270 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xf8>
   82210:	9400005c 	bl	82380 <__irq_handler__Arm>
   82214:	361ffdf6 	tbz	w22, #3, 821d0 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x58>
   82218:	9400005a 	bl	82380 <__irq_handler__Arm>
   8221c:	3647fdd6 	tbz	w22, #8, 821d4 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x5c>
   82220:	94000058 	bl	82380 <__irq_handler__Arm>
   82224:	364ffdb6 	tbz	w22, #9, 821d8 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x60>
   82228:	94000056 	bl	82380 <__irq_handler__Arm>
   8222c:	3667fd96 	tbz	w22, #12, 821dc <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x64>
   82230:	94000054 	bl	82380 <__irq_handler__Arm>
   82234:	366ffd76 	tbz	w22, #13, 821e0 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x68>
   82238:	94000052 	bl	82380 <__irq_handler__Arm>
   8223c:	3677fd56 	tbz	w22, #14, 821e4 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x6c>
   82240:	94000050 	bl	82380 <__irq_handler__Arm>
   82244:	367ffd36 	tbz	w22, #15, 821e8 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x70>
   82248:	9400004e 	bl	82380 <__irq_handler__Arm>
   8224c:	37effd16 	tbnz	w22, #29, 821ec <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x74>
   82250:	14000008 	b	82270 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xf8>
   82254:	9400004b 	bl	82380 <__irq_handler__Arm>
   82258:	b94002e8 	ldr	w8, [x23]
   8225c:	360ffd48 	tbz	w8, #1, 82204 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x8c>
   82260:	94000048 	bl	82380 <__irq_handler__Arm>
   82264:	b94002e8 	ldr	w8, [x23]
   82268:	36100048 	tbz	w8, #2, 82270 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0xf8>
   8226c:	94000045 	bl	82380 <__irq_handler__Arm>
   82270:	36f00056 	tbz	w22, #30, 82278 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x100>
   82274:	94000043 	bl	82380 <__irq_handler__Arm>
   82278:	36f80056 	tbz	w22, #31, 82280 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x108>
   8227c:	94000041 	bl	82380 <__irq_handler__Arm>
   82280:	0a1402b4 	and	w20, w21, w20
   82284:	34000173 	cbz	w19, 822b0 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x138>
   82288:	37880353 	tbnz	w19, #17, 822f0 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x178>
   8228c:	37900373 	tbnz	w19, #18, 822f8 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x180>
   82290:	37980393 	tbnz	w19, #19, 82300 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x188>
   82294:	37a003b3 	tbnz	w19, #20, 82308 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x190>
   82298:	37a803d3 	tbnz	w19, #21, 82310 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x198>
   8229c:	37b003f3 	tbnz	w19, #22, 82318 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1a0>
   822a0:	37b80413 	tbnz	w19, #23, 82320 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1a8>
   822a4:	37c00433 	tbnz	w19, #24, 82328 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1b0>
   822a8:	36c80053 	tbz	w19, #25, 822b0 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x138>
   822ac:	94000035 	bl	82380 <__irq_handler__Arm>
   822b0:	34000194 	cbz	w20, 822e0 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x168>
   822b4:	37000414 	tbnz	w20, #0, 82334 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1bc>
   822b8:	37080434 	tbnz	w20, #1, 8233c <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1c4>
   822bc:	37100454 	tbnz	w20, #2, 82344 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1cc>
   822c0:	37180474 	tbnz	w20, #3, 8234c <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1d4>
   822c4:	37200494 	tbnz	w20, #4, 82354 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1dc>
   822c8:	372804b4 	tbnz	w20, #5, 8235c <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1e4>
   822cc:	373004d4 	tbnz	w20, #6, 82364 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1ec>
   822d0:	373804f4 	tbnz	w20, #7, 8236c <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1f4>
   822d4:	37400514 	tbnz	w20, #8, 82374 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x1fc>
   822d8:	36480054 	tbz	w20, #9, 822e0 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x168>
   822dc:	94000029 	bl	82380 <__irq_handler__Arm>
   822e0:	a9427bf3 	ldp	x19, x30, [sp, #32]
   822e4:	a94153f5 	ldp	x21, x20, [sp, #16]
   822e8:	a8c35bf7 	ldp	x23, x22, [sp], #48
   822ec:	1400003d 	b	823e0 <_ZN22ruspiro_interrupt_core25leaving_interrupt_handler17hcb261c9670177108E>
   822f0:	94000024 	bl	82380 <__irq_handler__Arm>
   822f4:	3697fcf3 	tbz	w19, #18, 82290 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x118>
   822f8:	94000022 	bl	82380 <__irq_handler__Arm>
   822fc:	369ffcd3 	tbz	w19, #19, 82294 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x11c>
   82300:	94000020 	bl	82380 <__irq_handler__Arm>
   82304:	36a7fcb3 	tbz	w19, #20, 82298 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x120>
   82308:	9400001e 	bl	82380 <__irq_handler__Arm>
   8230c:	36affc93 	tbz	w19, #21, 8229c <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x124>
   82310:	9400001c 	bl	82380 <__irq_handler__Arm>
   82314:	36b7fc73 	tbz	w19, #22, 822a0 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x128>
   82318:	9400001a 	bl	82380 <__irq_handler__Arm>
   8231c:	36bffc53 	tbz	w19, #23, 822a4 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x12c>
   82320:	94000018 	bl	82380 <__irq_handler__Arm>
   82324:	36c7fc33 	tbz	w19, #24, 822a8 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x130>
   82328:	94000016 	bl	82380 <__irq_handler__Arm>
   8232c:	37cffc13 	tbnz	w19, #25, 822ac <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x134>
   82330:	17ffffe0 	b	822b0 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x138>
   82334:	94000013 	bl	82380 <__irq_handler__Arm>
   82338:	360ffc34 	tbz	w20, #1, 822bc <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x144>
   8233c:	94000011 	bl	82380 <__irq_handler__Arm>
   82340:	3617fc14 	tbz	w20, #2, 822c0 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x148>
   82344:	9400000f 	bl	82380 <__irq_handler__Arm>
   82348:	361ffbf4 	tbz	w20, #3, 822c4 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x14c>
   8234c:	9400000d 	bl	82380 <__irq_handler__Arm>
   82350:	3627fbd4 	tbz	w20, #4, 822c8 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x150>
   82354:	9400000b 	bl	82380 <__irq_handler__Arm>
   82358:	362ffbb4 	tbz	w20, #5, 822cc <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x154>
   8235c:	94000009 	bl	82380 <__irq_handler__Arm>
   82360:	3637fb94 	tbz	w20, #6, 822d0 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x158>
   82364:	94000007 	bl	82380 <__irq_handler__Arm>
   82368:	363ffb74 	tbz	w20, #7, 822d4 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x15c>
   8236c:	94000005 	bl	82380 <__irq_handler__Arm>
   82370:	3647fb54 	tbz	w20, #8, 822d8 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x160>
   82374:	94000003 	bl	82380 <__irq_handler__Arm>
   82378:	374ffb34 	tbnz	w20, #9, 822dc <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x164>
   8237c:	17ffffd9 	b	822e0 <_ZN17ruspiro_interrupt17interrupt_handler17h30dcf06b54877117E+0x168>

0000000000082380 <__irq_handler__Arm>:
   82380:	d65f03c0 	ret
   82384:	00000000 	.inst	0x00000000 ; undefined

0000000000082388 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E>:
   82388:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
   8238c:	aa0003f3 	mov	x19, x0
   82390:	94000018 	bl	823f0 <_ZN22ruspiro_interrupt_core18disable_interrupts17h4262f3ae0843d19fE>
   82394:	52800028 	mov	w8, #0x1                   	// #1
   82398:	085ffe69 	ldaxrb	w9, [x19]
   8239c:	34000089 	cbz	w9, 823ac <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E+0x24>
   823a0:	d5033f5f 	clrex
   823a4:	085ffe69 	ldaxrb	w9, [x19]
   823a8:	35ffffc9 	cbnz	w9, 823a0 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E+0x18>
   823ac:	0809fe68 	stlxrb	w9, w8, [x19]
   823b0:	35ffffa9 	cbnz	w9, 823a4 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h4612ceb0de7393a4E+0x1c>
   823b4:	a8c17bf3 	ldp	x19, x30, [sp], #16
   823b8:	d65f03c0 	ret
   823bc:	00000000 	.inst	0x00000000 ; undefined

00000000000823c0 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hcb55c707bd8b2049E>:
   823c0:	089ffc1f 	stlrb	wzr, [x0]
   823c4:	1400001d 	b	82438 <_ZN22ruspiro_interrupt_core20re_enable_interrupts17hc17f6d544c9e00a8E>

00000000000823c8 <_ZN22ruspiro_interrupt_core26entering_interrupt_handler17hce8bb23066ca077bE>:
   823c8:	d0000049 	adrp	x9, 8c000 <_ZN12ruspiro_gpio4GPIO17h050453a1c37b81f4E>
   823cc:	52800028 	mov	w8, #0x1                   	// #1
   823d0:	91018129 	add	x9, x9, #0x60
   823d4:	089ffd28 	stlrb	w8, [x9]
   823d8:	d65f03c0 	ret
   823dc:	00000000 	.inst	0x00000000 ; undefined

00000000000823e0 <_ZN22ruspiro_interrupt_core25leaving_interrupt_handler17hcb261c9670177108E>:
   823e0:	d0000048 	adrp	x8, 8c000 <_ZN12ruspiro_gpio4GPIO17h050453a1c37b81f4E>
   823e4:	91018108 	add	x8, x8, #0x60
   823e8:	089ffd1f 	stlrb	wzr, [x8]
   823ec:	d65f03c0 	ret

00000000000823f0 <_ZN22ruspiro_interrupt_core18disable_interrupts17h4262f3ae0843d19fE>:
   823f0:	d0000048 	adrp	x8, 8c000 <_ZN12ruspiro_gpio4GPIO17h050453a1c37b81f4E>
   823f4:	91018108 	add	x8, x8, #0x60
   823f8:	08dffd08 	ldarb	w8, [x8]
   823fc:	72001d1f 	tst	w8, #0xff
   82400:	54000040 	b.eq	82408 <_ZN22ruspiro_interrupt_core18disable_interrupts17h4262f3ae0843d19fE+0x18>  // b.none
   82404:	d65f03c0 	ret
   82408:	d0000048 	adrp	x8, 8c000 <_ZN12ruspiro_gpio4GPIO17h050453a1c37b81f4E>
   8240c:	52800029 	mov	w9, #0x1                   	// #1
   82410:	91019108 	add	x8, x8, #0x64
   82414:	d53b422b 	mrs	x11, daif
   82418:	9100110a 	add	x10, x8, #0x4
   8241c:	d50342df 	msr	daifset, #0x2
   82420:	089ffd09 	stlrb	w9, [x8]
   82424:	d53b4228 	mrs	x8, daif
   82428:	d50341df 	msr	daifset, #0x1
   8242c:	089ffd49 	stlrb	w9, [x10]
   82430:	d65f03c0 	ret
   82434:	00000000 	.inst	0x00000000 ; undefined

0000000000082438 <_ZN22ruspiro_interrupt_core20re_enable_interrupts17hc17f6d544c9e00a8E>:
   82438:	d0000048 	adrp	x8, 8c000 <_ZN12ruspiro_gpio4GPIO17h050453a1c37b81f4E>
   8243c:	91018108 	add	x8, x8, #0x60
   82440:	08dffd08 	ldarb	w8, [x8]
   82444:	72001d1f 	tst	w8, #0xff
   82448:	540001e1 	b.ne	82484 <_ZN22ruspiro_interrupt_core20re_enable_interrupts17hc17f6d544c9e00a8E+0x4c>  // b.any
   8244c:	d0000048 	adrp	x8, 8c000 <_ZN12ruspiro_gpio4GPIO17h050453a1c37b81f4E>
   82450:	91019108 	add	x8, x8, #0x64
   82454:	08dffd08 	ldarb	w8, [x8]
   82458:	72001d1f 	tst	w8, #0xff
   8245c:	54000060 	b.eq	82468 <_ZN22ruspiro_interrupt_core20re_enable_interrupts17hc17f6d544c9e00a8E+0x30>  // b.none
   82460:	d50342ff 	msr	daifclr, #0x2
   82464:	d5033fdf 	isb
   82468:	d0000048 	adrp	x8, 8c000 <_ZN12ruspiro_gpio4GPIO17h050453a1c37b81f4E>
   8246c:	9101a108 	add	x8, x8, #0x68
   82470:	08dffd08 	ldarb	w8, [x8]
   82474:	72001d1f 	tst	w8, #0xff
   82478:	54000060 	b.eq	82484 <_ZN22ruspiro_interrupt_core20re_enable_interrupts17hc17f6d544c9e00a8E+0x4c>  // b.none
   8247c:	d50341ff 	msr	daifclr, #0x1
   82480:	d5033fdf 	isb
   82484:	d65f03c0 	ret

0000000000082488 <_ZN16ruspiro_register8register29RegisterFieldValue$LT$u64$GT$5value17h2246d405a6591018E>:
   82488:	a940a408 	ldp	x8, x9, [x0, #8]
   8248c:	9ac82520 	lsr	x0, x9, x8
   82490:	d65f03c0 	ret
   82494:	00000000 	.inst	0x00000000 ; undefined

0000000000082498 <_ZN16ruspiro_register6system7aarch649ttbr0_el15baddr10with_value17ha5726d68ee951ab0E>:
   82498:	d0000009 	adrp	x9, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   8249c:	3dc33120 	ldr	q0, [x9, #3264]
   824a0:	3c9f0fe0 	str	q0, [sp, #-16]!
   824a4:	f94007e9 	ldr	x9, [sp, #8]
   824a8:	f9000509 	str	x9, [x8, #8]
   824ac:	f84107e9 	ldr	x9, [sp], #16
   824b0:	f9000900 	str	x0, [x8, #16]
   824b4:	f9000109 	str	x9, [x8]
   824b8:	d65f03c0 	ret
   824bc:	00000000 	.inst	0x00000000 ; undefined

00000000000824c0 <_ZN16ruspiro_register6system7aarch647tcr_el24T0SZ10with_value17h877a925dccf94987E>:
   824c0:	d0000009 	adrp	x9, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   824c4:	f9467129 	ldr	x9, [x9, #3296]
   824c8:	d360fd2a 	lsr	x10, x9, #32
   824cc:	b9000109 	str	w9, [x8]
   824d0:	2900810a 	stp	w10, w0, [x8, #4]
   824d4:	d65f03c0 	ret

00000000000824d8 <_ZN16ruspiro_register6system7aarch649ttbr0_el25baddr10with_value17he00bdda0e676fbddE>:
   824d8:	d0000009 	adrp	x9, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   824dc:	3dc33120 	ldr	q0, [x9, #3264]
   824e0:	3c9f0fe0 	str	q0, [sp, #-16]!
   824e4:	f94007e9 	ldr	x9, [sp, #8]
   824e8:	f9000509 	str	x9, [x8, #8]
   824ec:	f84107e9 	ldr	x9, [sp], #16
   824f0:	f9000900 	str	x0, [x8, #16]
   824f4:	f9000109 	str	x9, [x8]
   824f8:	d65f03c0 	ret
   824fc:	00000000 	.inst	0x00000000 ; undefined

0000000000082500 <_ZN16ruspiro_register6system7aarch647tcr_el14T1SZ10with_value17h4173013b39c56686E>:
   82500:	d0000009 	adrp	x9, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   82504:	53103c0b 	lsl	w11, w0, #16
   82508:	b900090b 	str	w11, [x8, #8]
   8250c:	f946a129 	ldr	x9, [x9, #3392]
   82510:	d360fd2a 	lsr	x10, x9, #32
   82514:	29002909 	stp	w9, w10, [x8]
   82518:	d65f03c0 	ret
   8251c:	00000000 	.inst	0x00000000 ; undefined

0000000000082520 <_ZN16ruspiro_register6system7aarch647tcr_el14T0SZ10with_value17h2011dff7461ad050E>:
   82520:	d0000009 	adrp	x9, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   82524:	f9467129 	ldr	x9, [x9, #3296]
   82528:	d360fd2a 	lsr	x10, x9, #32
   8252c:	b9000109 	str	w9, [x8]
   82530:	2900810a 	stp	w10, w0, [x8, #4]
   82534:	d65f03c0 	ret

0000000000082538 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E>:
   82538:	d10283ff 	sub	sp, sp, #0xa0
   8253c:	a90853f5 	stp	x21, x20, [sp, #128]
   82540:	a9097bf3 	stp	x19, x30, [sp, #144]
   82544:	b9405029 	ldr	w9, [x1, #80]
   82548:	aa0103f3 	mov	x19, x1
   8254c:	aa0003f4 	mov	x20, x0
   82550:	37200529 	tbnz	w9, #4, 825f4 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0xbc>
   82554:	f9400288 	ldr	x8, [x20]
   82558:	372807a9 	tbnz	w9, #5, 8264c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x114>
   8255c:	90000029 	adrp	x9, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   82560:	f9478529 	ldr	x9, [x9, #3848]
   82564:	d344fd0a 	lsr	x10, x8, #4
   82568:	f109c55f 	cmp	x10, #0x271
   8256c:	54000ac3 	b.cc	826c4 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x18c>  // b.lo, b.ul, b.last
   82570:	d28b296c 	mov	x12, #0x594b                	// #22859
   82574:	f2a710cc 	movk	x12, #0x3886, lsl #16
   82578:	529c1feb 	mov	w11, #0xe0ff                	// #57599
   8257c:	f2d8bacc 	movk	x12, #0xc5d6, lsl #32
   82580:	5290a3ee 	mov	w14, #0x851f                	// #34079
   82584:	aa1f03ea 	mov	x10, xzr
   82588:	72a0beab 	movk	w11, #0x5f5, lsl #16
   8258c:	f2e68dac 	movk	x12, #0x346d, lsl #48
   82590:	5284e20d 	mov	w13, #0x2710                	// #10000
   82594:	72aa3d6e 	movk	w14, #0x51eb, lsl #16
   82598:	52800c8f 	mov	w15, #0x64                  	// #100
   8259c:	910003f0 	mov	x16, sp
   825a0:	aa0803f1 	mov	x17, x8
   825a4:	9bcc7d08 	umulh	x8, x8, x12
   825a8:	d34bfd08 	lsr	x8, x8, #11
   825ac:	1b0dc512 	msub	w18, w8, w13, w17
   825b0:	12003e40 	and	w0, w18, #0xffff
   825b4:	9bae7c00 	umull	x0, w0, w14
   825b8:	d365fc00 	lsr	x0, x0, #37
   825bc:	78607921 	ldrh	w1, [x9, x0, lsl #1]
   825c0:	1b0fc812 	msub	w18, w0, w15, w18
   825c4:	8b0a0200 	add	x0, x16, x10
   825c8:	92403e52 	and	x18, x18, #0xffff
   825cc:	78023001 	sturh	w1, [x0, #35]
   825d0:	78727932 	ldrh	w18, [x9, x18, lsl #1]
   825d4:	eb0b023f 	cmp	x17, x11
   825d8:	d100114a 	sub	x10, x10, #0x4
   825dc:	78025012 	sturh	w18, [x0, #37]
   825e0:	54fffe08 	b.hi	825a0 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x68>  // b.pmore
   825e4:	91009d4a 	add	x10, x10, #0x27
   825e8:	f1018d1f 	cmp	x8, #0x63
   825ec:	5400072c 	b.gt	826d0 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x198>
   825f0:	14000045 	b	82704 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x1cc>
   825f4:	f940028a 	ldr	x10, [x20]
   825f8:	aa1f03e8 	mov	x8, xzr
   825fc:	910003e9 	mov	x9, sp
   82600:	12000d4d 	and	w13, w10, #0xf
   82604:	5280060e 	mov	w14, #0x30                  	// #48
   82608:	d344fd4c 	lsr	x12, x10, #4
   8260c:	33000d4e 	bfxil	w14, w10, #0, #4
   82610:	11015daa 	add	w10, w13, #0x57
   82614:	710029bf 	cmp	w13, #0xa
   82618:	8b08012b 	add	x11, x9, x8
   8261c:	1a8a31ca 	csel	w10, w14, w10, cc  // cc = lo, ul, last
   82620:	3901fd6a 	strb	w10, [x11, #127]
   82624:	d1000508 	sub	x8, x8, #0x1
   82628:	aa0c03ea 	mov	x10, x12
   8262c:	b5fffeac 	cbnz	x12, 82600 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0xc8>
   82630:	91020100 	add	x0, x8, #0x80
   82634:	f102041f 	cmp	x0, #0x81
   82638:	54001c02 	b.cs	829b8 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x480>  // b.hs, b.nlast
   8263c:	910003e9 	mov	x9, sp
   82640:	cb0803e5 	neg	x5, x8
   82644:	8b080128 	add	x8, x9, x8
   82648:	14000015 	b	8269c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x164>
   8264c:	aa1f03e9 	mov	x9, xzr
   82650:	910003ea 	mov	x10, sp
   82654:	12000d0d 	and	w13, w8, #0xf
   82658:	5280060e 	mov	w14, #0x30                  	// #48
   8265c:	d344fd0c 	lsr	x12, x8, #4
   82660:	33000d0e 	bfxil	w14, w8, #0, #4
   82664:	1100dda8 	add	w8, w13, #0x37
   82668:	710029bf 	cmp	w13, #0xa
   8266c:	8b09014b 	add	x11, x10, x9
   82670:	1a8831c8 	csel	w8, w14, w8, cc  // cc = lo, ul, last
   82674:	3901fd68 	strb	w8, [x11, #127]
   82678:	d1000529 	sub	x9, x9, #0x1
   8267c:	aa0c03e8 	mov	x8, x12
   82680:	b5fffeac 	cbnz	x12, 82654 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x11c>
   82684:	91020120 	add	x0, x9, #0x80
   82688:	f102041f 	cmp	x0, #0x81
   8268c:	54001962 	b.cs	829b8 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x480>  // b.hs, b.nlast
   82690:	910003e8 	mov	x8, sp
   82694:	cb0903e5 	neg	x5, x9
   82698:	8b090108 	add	x8, x8, x9
   8269c:	f0000002 	adrp	x2, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   826a0:	91020104 	add	x4, x8, #0x80
   826a4:	91392c42 	add	x2, x2, #0xe4b
   826a8:	52800021 	mov	w1, #0x1                   	// #1
   826ac:	52800043 	mov	w3, #0x2                   	// #2
   826b0:	aa1303e0 	mov	x0, x19
   826b4:	52800035 	mov	w21, #0x1                   	// #1
   826b8:	9400040e 	bl	836f0 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E>
   826bc:	36000520 	tbz	w0, #0, 82760 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x228>
   826c0:	140000b9 	b	829a4 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x46c>
   826c4:	528004ea 	mov	w10, #0x27                  	// #39
   826c8:	f1018d1f 	cmp	x8, #0x63
   826cc:	540001cd 	b.le	82704 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x1cc>
   826d0:	5290a3ec 	mov	w12, #0x851f                	// #34079
   826d4:	12003d0b 	and	w11, w8, #0xffff
   826d8:	72aa3d6c 	movk	w12, #0x51eb, lsl #16
   826dc:	9bac7d6b 	umull	x11, w11, w12
   826e0:	d365fd6b 	lsr	x11, x11, #37
   826e4:	52800c8c 	mov	w12, #0x64                  	// #100
   826e8:	1b0ca168 	msub	w8, w11, w12, w8
   826ec:	92403d08 	and	x8, x8, #0xffff
   826f0:	78687928 	ldrh	w8, [x9, x8, lsl #1]
   826f4:	d100094a 	sub	x10, x10, #0x2
   826f8:	910003ec 	mov	x12, sp
   826fc:	782a6988 	strh	w8, [x12, x10]
   82700:	aa0b03e8 	mov	x8, x11
   82704:	f100291f 	cmp	x8, #0xa
   82708:	540000ca 	b.ge	82720 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x1e8>  // b.tcont
   8270c:	d1000549 	sub	x9, x10, #0x1
   82710:	1100c108 	add	w8, w8, #0x30
   82714:	910003ea 	mov	x10, sp
   82718:	38296948 	strb	w8, [x10, x9]
   8271c:	14000005 	b	82730 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x1f8>
   82720:	78687928 	ldrh	w8, [x9, x8, lsl #1]
   82724:	d1000949 	sub	x9, x10, #0x2
   82728:	910003ea 	mov	x10, sp
   8272c:	78296948 	strh	w8, [x10, x9]
   82730:	910003e8 	mov	x8, sp
   82734:	528004ea 	mov	w10, #0x27                  	// #39
   82738:	d0000002 	adrp	x2, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   8273c:	8b090104 	add	x4, x8, x9
   82740:	cb090145 	sub	x5, x10, x9
   82744:	91354842 	add	x2, x2, #0xd52
   82748:	52800021 	mov	w1, #0x1                   	// #1
   8274c:	aa1303e0 	mov	x0, x19
   82750:	aa1f03e3 	mov	x3, xzr
   82754:	52800035 	mov	w21, #0x1                   	// #1
   82758:	940003e6 	bl	836f0 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E>
   8275c:	35001240 	cbnz	w0, 829a4 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x46c>
   82760:	a9420660 	ldp	x0, x1, [x19, #32]
   82764:	90000028 	adrp	x8, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   82768:	91182108 	add	x8, x8, #0x608
   8276c:	52800035 	mov	w21, #0x1                   	// #1
   82770:	a90057e8 	stp	x8, x21, [sp]
   82774:	52800108 	mov	w8, #0x8                   	// #8
   82778:	910003e2 	mov	x2, sp
   8277c:	a9017fff 	stp	xzr, xzr, [sp, #16]
   82780:	a9027fe8 	stp	x8, xzr, [sp, #32]
   82784:	940002f5 	bl	83358 <_ZN4core3fmt5write17hc57a24d3d8e085f5E>
   82788:	370010e0 	tbnz	w0, #0, 829a4 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x46c>
   8278c:	b9405269 	ldr	w9, [x19, #80]
   82790:	37200789 	tbnz	w9, #4, 82880 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x348>
   82794:	f9400688 	ldr	x8, [x20, #8]
   82798:	37280a29 	tbnz	w9, #5, 828dc <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x3a4>
   8279c:	90000029 	adrp	x9, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   827a0:	f9478529 	ldr	x9, [x9, #3848]
   827a4:	d344fd0a 	lsr	x10, x8, #4
   827a8:	f109c55f 	cmp	x10, #0x271
   827ac:	54000d43 	b.cc	82954 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x41c>  // b.lo, b.ul, b.last
   827b0:	d28b296c 	mov	x12, #0x594b                	// #22859
   827b4:	f2a710cc 	movk	x12, #0x3886, lsl #16
   827b8:	529c1feb 	mov	w11, #0xe0ff                	// #57599
   827bc:	f2d8bacc 	movk	x12, #0xc5d6, lsl #32
   827c0:	5290a3ee 	mov	w14, #0x851f                	// #34079
   827c4:	aa1f03ea 	mov	x10, xzr
   827c8:	72a0beab 	movk	w11, #0x5f5, lsl #16
   827cc:	f2e68dac 	movk	x12, #0x346d, lsl #48
   827d0:	5284e20d 	mov	w13, #0x2710                	// #10000
   827d4:	72aa3d6e 	movk	w14, #0x51eb, lsl #16
   827d8:	52800c8f 	mov	w15, #0x64                  	// #100
   827dc:	910003f0 	mov	x16, sp
   827e0:	aa0803f1 	mov	x17, x8
   827e4:	9bcc7d08 	umulh	x8, x8, x12
   827e8:	d34bfd08 	lsr	x8, x8, #11
   827ec:	1b0dc512 	msub	w18, w8, w13, w17
   827f0:	12003e40 	and	w0, w18, #0xffff
   827f4:	9bae7c00 	umull	x0, w0, w14
   827f8:	d365fc00 	lsr	x0, x0, #37
   827fc:	78607921 	ldrh	w1, [x9, x0, lsl #1]
   82800:	1b0fc812 	msub	w18, w0, w15, w18
   82804:	8b0a0200 	add	x0, x16, x10
   82808:	92403e52 	and	x18, x18, #0xffff
   8280c:	78023001 	sturh	w1, [x0, #35]
   82810:	78727932 	ldrh	w18, [x9, x18, lsl #1]
   82814:	eb0b023f 	cmp	x17, x11
   82818:	d100114a 	sub	x10, x10, #0x4
   8281c:	78025012 	sturh	w18, [x0, #37]
   82820:	54fffe08 	b.hi	827e0 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x2a8>  // b.pmore
   82824:	91009d4a 	add	x10, x10, #0x27
   82828:	f1018d1f 	cmp	x8, #0x63
   8282c:	540001cd 	b.le	82864 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x32c>
   82830:	5290a3ec 	mov	w12, #0x851f                	// #34079
   82834:	12003d0b 	and	w11, w8, #0xffff
   82838:	72aa3d6c 	movk	w12, #0x51eb, lsl #16
   8283c:	9bac7d6b 	umull	x11, w11, w12
   82840:	d365fd6b 	lsr	x11, x11, #37
   82844:	52800c8c 	mov	w12, #0x64                  	// #100
   82848:	1b0ca168 	msub	w8, w11, w12, w8
   8284c:	92403d08 	and	x8, x8, #0xffff
   82850:	78687928 	ldrh	w8, [x9, x8, lsl #1]
   82854:	d100094a 	sub	x10, x10, #0x2
   82858:	910003ec 	mov	x12, sp
   8285c:	782a6988 	strh	w8, [x12, x10]
   82860:	aa0b03e8 	mov	x8, x11
   82864:	f100291f 	cmp	x8, #0xa
   82868:	540007ea 	b.ge	82964 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x42c>  // b.tcont
   8286c:	d1000549 	sub	x9, x10, #0x1
   82870:	1100c108 	add	w8, w8, #0x30
   82874:	910003ea 	mov	x10, sp
   82878:	38296948 	strb	w8, [x10, x9]
   8287c:	1400003e 	b	82974 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x43c>
   82880:	f940068a 	ldr	x10, [x20, #8]
   82884:	aa1f03e8 	mov	x8, xzr
   82888:	910003e9 	mov	x9, sp
   8288c:	12000d4d 	and	w13, w10, #0xf
   82890:	5280060e 	mov	w14, #0x30                  	// #48
   82894:	d344fd4c 	lsr	x12, x10, #4
   82898:	33000d4e 	bfxil	w14, w10, #0, #4
   8289c:	11015daa 	add	w10, w13, #0x57
   828a0:	710029bf 	cmp	w13, #0xa
   828a4:	8b08012b 	add	x11, x9, x8
   828a8:	1a8a31ca 	csel	w10, w14, w10, cc  // cc = lo, ul, last
   828ac:	3901fd6a 	strb	w10, [x11, #127]
   828b0:	d1000508 	sub	x8, x8, #0x1
   828b4:	aa0c03ea 	mov	x10, x12
   828b8:	b5fffeac 	cbnz	x12, 8288c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x354>
   828bc:	91020100 	add	x0, x8, #0x80
   828c0:	f102041f 	cmp	x0, #0x81
   828c4:	540007a2 	b.cs	829b8 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x480>  // b.hs, b.nlast
   828c8:	910003e9 	mov	x9, sp
   828cc:	cb0803e5 	neg	x5, x8
   828d0:	8b080128 	add	x8, x9, x8
   828d4:	f0000002 	adrp	x2, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   828d8:	14000016 	b	82930 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x3f8>
   828dc:	aa1f03e9 	mov	x9, xzr
   828e0:	910003ea 	mov	x10, sp
   828e4:	12000d0d 	and	w13, w8, #0xf
   828e8:	5280060e 	mov	w14, #0x30                  	// #48
   828ec:	d344fd0c 	lsr	x12, x8, #4
   828f0:	33000d0e 	bfxil	w14, w8, #0, #4
   828f4:	1100dda8 	add	w8, w13, #0x37
   828f8:	710029bf 	cmp	w13, #0xa
   828fc:	8b09014b 	add	x11, x10, x9
   82900:	1a8831c8 	csel	w8, w14, w8, cc  // cc = lo, ul, last
   82904:	3901fd68 	strb	w8, [x11, #127]
   82908:	d1000529 	sub	x9, x9, #0x1
   8290c:	aa0c03e8 	mov	x8, x12
   82910:	b5fffeac 	cbnz	x12, 828e4 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x3ac>
   82914:	91020120 	add	x0, x9, #0x80
   82918:	f102041f 	cmp	x0, #0x81
   8291c:	540004e2 	b.cs	829b8 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x480>  // b.hs, b.nlast
   82920:	910003e8 	mov	x8, sp
   82924:	8b090108 	add	x8, x8, x9
   82928:	f0000002 	adrp	x2, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   8292c:	cb0903e5 	neg	x5, x9
   82930:	91020104 	add	x4, x8, #0x80
   82934:	91392c42 	add	x2, x2, #0xe4b
   82938:	52800021 	mov	w1, #0x1                   	// #1
   8293c:	52800043 	mov	w3, #0x2                   	// #2
   82940:	aa1303e0 	mov	x0, x19
   82944:	9400036b 	bl	836f0 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E>
   82948:	360002c0 	tbz	w0, #0, 829a0 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x468>
   8294c:	52800035 	mov	w21, #0x1                   	// #1
   82950:	14000015 	b	829a4 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x46c>
   82954:	528004ea 	mov	w10, #0x27                  	// #39
   82958:	f1018d1f 	cmp	x8, #0x63
   8295c:	54fff84d 	b.le	82864 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x32c>
   82960:	17ffffb4 	b	82830 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x2f8>
   82964:	78687928 	ldrh	w8, [x9, x8, lsl #1]
   82968:	d1000949 	sub	x9, x10, #0x2
   8296c:	910003ea 	mov	x10, sp
   82970:	78296948 	strh	w8, [x10, x9]
   82974:	910003e8 	mov	x8, sp
   82978:	528004ea 	mov	w10, #0x27                  	// #39
   8297c:	d0000002 	adrp	x2, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   82980:	8b090104 	add	x4, x8, x9
   82984:	cb090145 	sub	x5, x10, x9
   82988:	91354842 	add	x2, x2, #0xd52
   8298c:	52800021 	mov	w1, #0x1                   	// #1
   82990:	aa1303e0 	mov	x0, x19
   82994:	aa1f03e3 	mov	x3, xzr
   82998:	94000356 	bl	836f0 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E>
   8299c:	35fffd80 	cbnz	w0, 8294c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h170c5d5778516a10E+0x414>
   829a0:	2a1f03f5 	mov	w21, wzr
   829a4:	2a1503e0 	mov	w0, w21
   829a8:	a9497bf3 	ldp	x19, x30, [sp, #144]
   829ac:	a94853f5 	ldp	x21, x20, [sp, #128]
   829b0:	910283ff 	add	sp, sp, #0xa0
   829b4:	d65f03c0 	ret
   829b8:	52801001 	mov	w1, #0x80                  	// #128
   829bc:	940001b3 	bl	83088 <_ZN4core5slice22slice_index_order_fail17hf2829e51e4e6cde7E>
   829c0:	d4200020 	brk	#0x1

00000000000829c4 <_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hd9348cd9798b9d7bE>:
   829c4:	d293fc40 	mov	x0, #0x9fe2                	// #40930
   829c8:	f2b18ac0 	movk	x0, #0x8c56, lsl #16
   829cc:	f2c7c820 	movk	x0, #0x3e41, lsl #32
   829d0:	f2f831e0 	movk	x0, #0xc18f, lsl #48
   829d4:	d65f03c0 	ret

00000000000829d8 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4c1a3e8912c56b8aE>:
   829d8:	d10103ff 	sub	sp, sp, #0x40
   829dc:	b9400009 	ldr	w9, [x0]
   829e0:	90000028 	adrp	x8, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   829e4:	f9478508 	ldr	x8, [x8, #3848]
   829e8:	aa0103e0 	mov	x0, x1
   829ec:	d3447d2a 	ubfx	x10, x9, #4, #28
   829f0:	7109c55f 	cmp	w10, #0x271
   829f4:	f9001bfe 	str	x30, [sp, #48]
   829f8:	54000443 	b.cc	82a80 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4c1a3e8912c56b8aE+0xa8>  // b.lo, b.ul, b.last
   829fc:	d28b296b 	mov	x11, #0x594b                	// #22859
   82a00:	f2a710cb 	movk	x11, #0x3886, lsl #16
   82a04:	f2d8bacb 	movk	x11, #0xc5d6, lsl #32
   82a08:	5290a3ed 	mov	w13, #0x851f                	// #34079
   82a0c:	529c1ff0 	mov	w16, #0xe0ff                	// #57599
   82a10:	aa1f03ea 	mov	x10, xzr
   82a14:	f2e68dab 	movk	x11, #0x346d, lsl #48
   82a18:	5284e20c 	mov	w12, #0x2710                	// #10000
   82a1c:	72aa3d6d 	movk	w13, #0x51eb, lsl #16
   82a20:	52800c8e 	mov	w14, #0x64                  	// #100
   82a24:	910023ef 	add	x15, sp, #0x8
   82a28:	72a0beb0 	movk	w16, #0x5f5, lsl #16
   82a2c:	aa0903f1 	mov	x17, x9
   82a30:	9bcb7d29 	umulh	x9, x9, x11
   82a34:	d34bfd29 	lsr	x9, x9, #11
   82a38:	1b0cc532 	msub	w18, w9, w12, w17
   82a3c:	12003e41 	and	w1, w18, #0xffff
   82a40:	9bad7c21 	umull	x1, w1, w13
   82a44:	d365fc21 	lsr	x1, x1, #37
   82a48:	78617902 	ldrh	w2, [x8, x1, lsl #1]
   82a4c:	1b0ec832 	msub	w18, w1, w14, w18
   82a50:	8b0a01e1 	add	x1, x15, x10
   82a54:	92403e52 	and	x18, x18, #0xffff
   82a58:	78023022 	sturh	w2, [x1, #35]
   82a5c:	78727912 	ldrh	w18, [x8, x18, lsl #1]
   82a60:	eb10023f 	cmp	x17, x16
   82a64:	d100114a 	sub	x10, x10, #0x4
   82a68:	78025032 	sturh	w18, [x1, #37]
   82a6c:	54fffe08 	b.hi	82a2c <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4c1a3e8912c56b8aE+0x54>  // b.pmore
   82a70:	91009d4a 	add	x10, x10, #0x27
   82a74:	f1018d3f 	cmp	x9, #0x63
   82a78:	540000a8 	b.hi	82a8c <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4c1a3e8912c56b8aE+0xb4>  // b.pmore
   82a7c:	14000011 	b	82ac0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4c1a3e8912c56b8aE+0xe8>
   82a80:	528004ea 	mov	w10, #0x27                  	// #39
   82a84:	f1018d3f 	cmp	x9, #0x63
   82a88:	540001c9 	b.ls	82ac0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4c1a3e8912c56b8aE+0xe8>  // b.plast
   82a8c:	5290a3ec 	mov	w12, #0x851f                	// #34079
   82a90:	12003d2b 	and	w11, w9, #0xffff
   82a94:	72aa3d6c 	movk	w12, #0x51eb, lsl #16
   82a98:	9bac7d6b 	umull	x11, w11, w12
   82a9c:	d365fd6b 	lsr	x11, x11, #37
   82aa0:	52800c8c 	mov	w12, #0x64                  	// #100
   82aa4:	1b0ca569 	msub	w9, w11, w12, w9
   82aa8:	92403d29 	and	x9, x9, #0xffff
   82aac:	78697909 	ldrh	w9, [x8, x9, lsl #1]
   82ab0:	d100094a 	sub	x10, x10, #0x2
   82ab4:	910023ec 	add	x12, sp, #0x8
   82ab8:	782a6989 	strh	w9, [x12, x10]
   82abc:	aa0b03e9 	mov	x9, x11
   82ac0:	f100293f 	cmp	x9, #0xa
   82ac4:	540000ca 	b.ge	82adc <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4c1a3e8912c56b8aE+0x104>  // b.tcont
   82ac8:	d1000548 	sub	x8, x10, #0x1
   82acc:	1100c129 	add	w9, w9, #0x30
   82ad0:	910023ea 	add	x10, sp, #0x8
   82ad4:	38286949 	strb	w9, [x10, x8]
   82ad8:	14000005 	b	82aec <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h4c1a3e8912c56b8aE+0x114>
   82adc:	78697909 	ldrh	w9, [x8, x9, lsl #1]
   82ae0:	d1000948 	sub	x8, x10, #0x2
   82ae4:	910023ea 	add	x10, sp, #0x8
   82ae8:	78286949 	strh	w9, [x10, x8]
   82aec:	910023e9 	add	x9, sp, #0x8
   82af0:	528004ea 	mov	w10, #0x27                  	// #39
   82af4:	d0000002 	adrp	x2, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   82af8:	8b080124 	add	x4, x9, x8
   82afc:	cb080145 	sub	x5, x10, x8
   82b00:	91354842 	add	x2, x2, #0xd52
   82b04:	52800021 	mov	w1, #0x1                   	// #1
   82b08:	aa1f03e3 	mov	x3, xzr
   82b0c:	940002f9 	bl	836f0 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E>
   82b10:	f9401bfe 	ldr	x30, [sp, #48]
   82b14:	910103ff 	add	sp, sp, #0x40
   82b18:	d65f03c0 	ret

0000000000082b1c <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h1623b4e59f40a3ffE>:
   82b1c:	d10103ff 	sub	sp, sp, #0x40
   82b20:	f9400009 	ldr	x9, [x0]
   82b24:	90000028 	adrp	x8, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   82b28:	f9478508 	ldr	x8, [x8, #3848]
   82b2c:	aa0103e0 	mov	x0, x1
   82b30:	d344fd2a 	lsr	x10, x9, #4
   82b34:	f109c55f 	cmp	x10, #0x271
   82b38:	f9001bfe 	str	x30, [sp, #48]
   82b3c:	54000443 	b.cc	82bc4 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h1623b4e59f40a3ffE+0xa8>  // b.lo, b.ul, b.last
   82b40:	d28b296b 	mov	x11, #0x594b                	// #22859
   82b44:	f2a710cb 	movk	x11, #0x3886, lsl #16
   82b48:	f2d8bacb 	movk	x11, #0xc5d6, lsl #32
   82b4c:	5290a3ed 	mov	w13, #0x851f                	// #34079
   82b50:	529c1ff0 	mov	w16, #0xe0ff                	// #57599
   82b54:	aa1f03ea 	mov	x10, xzr
   82b58:	f2e68dab 	movk	x11, #0x346d, lsl #48
   82b5c:	5284e20c 	mov	w12, #0x2710                	// #10000
   82b60:	72aa3d6d 	movk	w13, #0x51eb, lsl #16
   82b64:	52800c8e 	mov	w14, #0x64                  	// #100
   82b68:	910023ef 	add	x15, sp, #0x8
   82b6c:	72a0beb0 	movk	w16, #0x5f5, lsl #16
   82b70:	aa0903f1 	mov	x17, x9
   82b74:	9bcb7d29 	umulh	x9, x9, x11
   82b78:	d34bfd29 	lsr	x9, x9, #11
   82b7c:	1b0cc532 	msub	w18, w9, w12, w17
   82b80:	12003e41 	and	w1, w18, #0xffff
   82b84:	9bad7c21 	umull	x1, w1, w13
   82b88:	d365fc21 	lsr	x1, x1, #37
   82b8c:	78617902 	ldrh	w2, [x8, x1, lsl #1]
   82b90:	1b0ec832 	msub	w18, w1, w14, w18
   82b94:	8b0a01e1 	add	x1, x15, x10
   82b98:	92403e52 	and	x18, x18, #0xffff
   82b9c:	78023022 	sturh	w2, [x1, #35]
   82ba0:	78727912 	ldrh	w18, [x8, x18, lsl #1]
   82ba4:	eb10023f 	cmp	x17, x16
   82ba8:	d100114a 	sub	x10, x10, #0x4
   82bac:	78025032 	sturh	w18, [x1, #37]
   82bb0:	54fffe08 	b.hi	82b70 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h1623b4e59f40a3ffE+0x54>  // b.pmore
   82bb4:	91009d4a 	add	x10, x10, #0x27
   82bb8:	f1018d3f 	cmp	x9, #0x63
   82bbc:	540000ac 	b.gt	82bd0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h1623b4e59f40a3ffE+0xb4>
   82bc0:	14000011 	b	82c04 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h1623b4e59f40a3ffE+0xe8>
   82bc4:	528004ea 	mov	w10, #0x27                  	// #39
   82bc8:	f1018d3f 	cmp	x9, #0x63
   82bcc:	540001cd 	b.le	82c04 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h1623b4e59f40a3ffE+0xe8>
   82bd0:	5290a3ec 	mov	w12, #0x851f                	// #34079
   82bd4:	12003d2b 	and	w11, w9, #0xffff
   82bd8:	72aa3d6c 	movk	w12, #0x51eb, lsl #16
   82bdc:	9bac7d6b 	umull	x11, w11, w12
   82be0:	d365fd6b 	lsr	x11, x11, #37
   82be4:	52800c8c 	mov	w12, #0x64                  	// #100
   82be8:	1b0ca569 	msub	w9, w11, w12, w9
   82bec:	92403d29 	and	x9, x9, #0xffff
   82bf0:	78697909 	ldrh	w9, [x8, x9, lsl #1]
   82bf4:	d100094a 	sub	x10, x10, #0x2
   82bf8:	910023ec 	add	x12, sp, #0x8
   82bfc:	782a6989 	strh	w9, [x12, x10]
   82c00:	aa0b03e9 	mov	x9, x11
   82c04:	f100293f 	cmp	x9, #0xa
   82c08:	540000ca 	b.ge	82c20 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h1623b4e59f40a3ffE+0x104>  // b.tcont
   82c0c:	d1000548 	sub	x8, x10, #0x1
   82c10:	1100c129 	add	w9, w9, #0x30
   82c14:	910023ea 	add	x10, sp, #0x8
   82c18:	38286949 	strb	w9, [x10, x8]
   82c1c:	14000005 	b	82c30 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17h1623b4e59f40a3ffE+0x114>
   82c20:	78697909 	ldrh	w9, [x8, x9, lsl #1]
   82c24:	d1000948 	sub	x8, x10, #0x2
   82c28:	910023ea 	add	x10, sp, #0x8
   82c2c:	78286949 	strh	w9, [x10, x8]
   82c30:	910023e9 	add	x9, sp, #0x8
   82c34:	528004ea 	mov	w10, #0x27                  	// #39
   82c38:	d0000002 	adrp	x2, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   82c3c:	8b080124 	add	x4, x9, x8
   82c40:	cb080145 	sub	x5, x10, x8
   82c44:	91354842 	add	x2, x2, #0xd52
   82c48:	52800021 	mov	w1, #0x1                   	// #1
   82c4c:	aa1f03e3 	mov	x3, xzr
   82c50:	940002a8 	bl	836f0 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E>
   82c54:	f9401bfe 	ldr	x30, [sp, #48]
   82c58:	910103ff 	add	sp, sp, #0x40
   82c5c:	d65f03c0 	ret

0000000000082c60 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E>:
   82c60:	a9b30fe2 	stp	x2, x3, [sp, #-208]!
   82c64:	f104043f 	cmp	x1, #0x101
   82c68:	54000082 	b.cs	82c78 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x18>  // b.hs, b.nlast
   82c6c:	52800029 	mov	w9, #0x1                   	// #1
   82c70:	aa0103e8 	mov	x8, x1
   82c74:	14000015 	b	82cc8 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x68>
   82c78:	aa1f03e8 	mov	x8, xzr
   82c7c:	91040009 	add	x9, x0, #0x100
   82c80:	d103fc2a 	sub	x10, x1, #0xff
   82c84:	9104010b 	add	x11, x8, #0x100
   82c88:	eb01017f 	cmp	x11, x1
   82c8c:	54000082 	b.cs	82c9c <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x3c>  // b.hs, b.nlast
   82c90:	38e8692b 	ldrsb	w11, [x9, x8]
   82c94:	3101057f 	cmn	w11, #0x41
   82c98:	5400014c 	b.gt	82cc0 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x60>
   82c9c:	b103fd1f 	cmn	x8, #0xff
   82ca0:	d100050b 	sub	x11, x8, #0x1
   82ca4:	54000080 	b.eq	82cb4 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x54>  // b.none
   82ca8:	eb08015f 	cmp	x10, x8
   82cac:	aa0b03e8 	mov	x8, x11
   82cb0:	54fffea1 	b.ne	82c84 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x24>  // b.any
   82cb4:	2a1f03e9 	mov	w9, wzr
   82cb8:	91040168 	add	x8, x11, #0x100
   82cbc:	14000003 	b	82cc8 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x68>
   82cc0:	2a1f03e9 	mov	w9, wzr
   82cc4:	91040108 	add	x8, x8, #0x100
   82cc8:	a90123e0 	stp	x0, x8, [sp, #16]
   82ccc:	d0000008 	adrp	x8, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   82cd0:	d000000a 	adrp	x10, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   82cd4:	913a1508 	add	x8, x8, #0xe85
   82cd8:	913a294a 	add	x10, x10, #0xe8a
   82cdc:	7100013f 	cmp	w9, #0x0
   82ce0:	528000a9 	mov	w9, #0x5                   	// #5
   82ce4:	9a881148 	csel	x8, x10, x8, ne  // ne = any
   82ce8:	9a8913e9 	csel	x9, xzr, x9, ne  // ne = any
   82cec:	eb01005f 	cmp	x2, x1
   82cf0:	a90227e8 	stp	x8, x9, [sp, #32]
   82cf4:	54001168 	b.hi	82f20 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x2c0>  // b.pmore
   82cf8:	eb01007f 	cmp	x3, x1
   82cfc:	54001128 	b.hi	82f20 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x2c0>  // b.pmore
   82d00:	eb03005f 	cmp	x2, x3
   82d04:	54001408 	b.hi	82f84 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x324>  // b.pmore
   82d08:	b40000e2 	cbz	x2, 82d24 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0xc4>
   82d0c:	eb02003f 	cmp	x1, x2
   82d10:	540000a0 	b.eq	82d24 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0xc4>  // b.none
   82d14:	540000a9 	b.ls	82d28 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0xc8>  // b.plast
   82d18:	38e26808 	ldrsb	w8, [x0, x2]
   82d1c:	3101011f 	cmn	w8, #0x40
   82d20:	5400004b 	b.lt	82d28 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0xc8>  // b.tstop
   82d24:	aa0303e2 	mov	x2, x3
   82d28:	f9001be2 	str	x2, [sp, #48]
   82d2c:	b40001e2 	cbz	x2, 82d68 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x108>
   82d30:	eb01005f 	cmp	x2, x1
   82d34:	540001a0 	b.eq	82d68 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x108>  // b.none
   82d38:	91000429 	add	x9, x1, #0x1
   82d3c:	eb01005f 	cmp	x2, x1
   82d40:	54000082 	b.cs	82d50 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0xf0>  // b.hs, b.nlast
   82d44:	38e26808 	ldrsb	w8, [x0, x2]
   82d48:	3101011f 	cmn	w8, #0x40
   82d4c:	540000ea 	b.ge	82d68 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x108>  // b.tcont
   82d50:	f1000448 	subs	x8, x2, #0x1
   82d54:	540000c0 	b.eq	82d6c <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x10c>  // b.none
   82d58:	eb02013f 	cmp	x9, x2
   82d5c:	aa0803e2 	mov	x2, x8
   82d60:	54fffee1 	b.ne	82d3c <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0xdc>  // b.any
   82d64:	14000002 	b	82d6c <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x10c>
   82d68:	aa0203e8 	mov	x8, x2
   82d6c:	eb01011f 	cmp	x8, x1
   82d70:	54000101 	b.ne	82d90 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x130>  // b.any
   82d74:	d0000000 	adrp	x0, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   82d78:	90000022 	adrp	x2, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   82d7c:	91360400 	add	x0, x0, #0xd81
   82d80:	91186042 	add	x2, x2, #0x618
   82d84:	52800561 	mov	w1, #0x2b                  	// #43
   82d88:	94000674 	bl	84758 <_ZN4core9panicking5panic17hc6f3025301472b62E>
   82d8c:	d4200020 	brk	#0x1
   82d90:	8b080009 	add	x9, x0, x8
   82d94:	aa0903ec 	mov	x12, x9
   82d98:	38c0158b 	ldrsb	w11, [x12], #1
   82d9c:	12001d6a 	and	w10, w11, #0xff
   82da0:	37f8008b 	tbnz	w11, #31, 82db0 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x150>
   82da4:	b9003fea 	str	w10, [sp, #60]
   82da8:	52800029 	mov	w9, #0x1                   	// #1
   82dac:	1400003d 	b	82ea0 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x240>
   82db0:	8b01000b 	add	x11, x0, x1
   82db4:	eb0b019f 	cmp	x12, x11
   82db8:	54000161 	b.ne	82de4 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x184>  // b.any
   82dbc:	2a1f03e9 	mov	w9, wzr
   82dc0:	aa0b03ed 	mov	x13, x11
   82dc4:	71037d5f 	cmp	w10, #0xdf
   82dc8:	1200114c 	and	w12, w10, #0x1f
   82dcc:	54000188 	b.hi	82dfc <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x19c>  // b.pmore
   82dd0:	331a1189 	bfi	w9, w12, #6, #5
   82dd4:	7102013f 	cmp	w9, #0x80
   82dd8:	b9003fe9 	str	w9, [sp, #60]
   82ddc:	54000503 	b.cc	82e7c <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x21c>  // b.lo, b.ul, b.last
   82de0:	14000029 	b	82e84 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x224>
   82de4:	3940052c 	ldrb	w12, [x9, #1]
   82de8:	9100092d 	add	x13, x9, #0x2
   82dec:	12001589 	and	w9, w12, #0x3f
   82df0:	71037d5f 	cmp	w10, #0xdf
   82df4:	1200114c 	and	w12, w10, #0x1f
   82df8:	54fffec9 	b.ls	82dd0 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x170>  // b.plast
   82dfc:	eb0b01bf 	cmp	x13, x11
   82e00:	54000181 	b.ne	82e30 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x1d0>  // b.any
   82e04:	2a1f03ee 	mov	w14, wzr
   82e08:	aa0b03ed 	mov	x13, x11
   82e0c:	7103c15f 	cmp	w10, #0xf0
   82e10:	331a152e 	bfi	w14, w9, #6, #6
   82e14:	54000182 	b.cs	82e44 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x1e4>  // b.hs, b.nlast
   82e18:	3314118e 	bfi	w14, w12, #12, #5
   82e1c:	2a0e03e9 	mov	w9, w14
   82e20:	7102013f 	cmp	w9, #0x80
   82e24:	b9003fe9 	str	w9, [sp, #60]
   82e28:	540002a3 	b.cc	82e7c <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x21c>  // b.lo, b.ul, b.last
   82e2c:	14000016 	b	82e84 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x224>
   82e30:	384015ae 	ldrb	w14, [x13], #1
   82e34:	120015ce 	and	w14, w14, #0x3f
   82e38:	7103c15f 	cmp	w10, #0xf0
   82e3c:	331a152e 	bfi	w14, w9, #6, #6
   82e40:	54fffec3 	b.cc	82e18 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x1b8>  // b.lo, b.ul, b.last
   82e44:	eb0b01bf 	cmp	x13, x11
   82e48:	54000061 	b.ne	82e54 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x1f4>  // b.any
   82e4c:	2a1f03e9 	mov	w9, wzr
   82e50:	14000003 	b	82e5c <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x1fc>
   82e54:	394001a9 	ldrb	w9, [x13]
   82e58:	12001529 	and	w9, w9, #0x3f
   82e5c:	530e098a 	ubfiz	w10, w12, #18, #3
   82e60:	331a2dca 	bfi	w10, w14, #6, #12
   82e64:	2a090149 	orr	w9, w10, w9
   82e68:	7144413f 	cmp	w9, #0x110, lsl #12
   82e6c:	54fff840 	b.eq	82d74 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x114>  // b.none
   82e70:	7102013f 	cmp	w9, #0x80
   82e74:	b9003fe9 	str	w9, [sp, #60]
   82e78:	54000062 	b.cs	82e84 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x224>  // b.hs, b.nlast
   82e7c:	52800029 	mov	w9, #0x1                   	// #1
   82e80:	14000008 	b	82ea0 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x240>
   82e84:	7120013f 	cmp	w9, #0x800
   82e88:	54000062 	b.cs	82e94 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x234>  // b.hs, b.nlast
   82e8c:	52800049 	mov	w9, #0x2                   	// #2
   82e90:	14000004 	b	82ea0 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E+0x240>
   82e94:	7140413f 	cmp	w9, #0x10, lsl #12
   82e98:	52800069 	mov	w9, #0x3                   	// #3
   82e9c:	9a893529 	cinc	x9, x9, cs  // cs = hs, nlast
   82ea0:	b000002b 	adrp	x11, 87000 <_DYNAMIC+0xf0>
   82ea4:	f940296b 	ldr	x11, [x11, #80]
   82ea8:	8b080129 	add	x9, x9, x8
   82eac:	9100c3ea 	add	x10, sp, #0x30
   82eb0:	b000002d 	adrp	x13, 87000 <_DYNAMIC+0xf0>
   82eb4:	f9402dad 	ldr	x13, [x13, #88]
   82eb8:	a90427e8 	stp	x8, x9, [sp, #64]
   82ebc:	90000008 	adrp	x8, 82000 <_ZN12ruspiro_gpio4Gpio7get_pin17hbfbf8c5cd53a0dafE+0xc8>
   82ec0:	a9082fea 	stp	x10, x11, [sp, #128]
   82ec4:	d000000a 	adrp	x10, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   82ec8:	910103ee 	add	x14, sp, #0x40
   82ecc:	9114e108 	add	x8, x8, #0x538
   82ed0:	910043e9 	add	x9, sp, #0x10
   82ed4:	911d114a 	add	x10, x10, #0x744
   82ed8:	a90a23ee 	stp	x14, x8, [sp, #160]
   82edc:	910083e8 	add	x8, sp, #0x20
   82ee0:	a90b2be9 	stp	x9, x10, [sp, #176]
   82ee4:	90000029 	adrp	x9, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   82ee8:	911b4129 	add	x9, x9, #0x6d0
   82eec:	a90c2be8 	stp	x8, x10, [sp, #192]
   82ef0:	528000a8 	mov	w8, #0x5                   	// #5
   82ef4:	9100f3ec 	add	x12, sp, #0x3c
   82ef8:	a90523e9 	stp	x9, x8, [sp, #80]
   82efc:	910203e9 	add	x9, sp, #0x80
   82f00:	90000021 	adrp	x1, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   82f04:	a90937ec 	stp	x12, x13, [sp, #144]
   82f08:	a9067fff 	stp	xzr, xzr, [sp, #96]
   82f0c:	a90723e9 	stp	x9, x8, [sp, #112]
   82f10:	911c8021 	add	x1, x1, #0x720
   82f14:	910143e0 	add	x0, sp, #0x50
   82f18:	9400062f 	bl	847d4 <_ZN4core9panicking9panic_fmt17heca5e185b37feb0aE>
   82f1c:	d4200020 	brk	#0x1
   82f20:	b0000029 	adrp	x9, 87000 <_DYNAMIC+0xf0>
   82f24:	f9402929 	ldr	x9, [x9, #80]
   82f28:	910103e8 	add	x8, sp, #0x40
   82f2c:	d000000c 	adrp	x12, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   82f30:	911d118c 	add	x12, x12, #0x744
   82f34:	a90827e8 	stp	x8, x9, [sp, #128]
   82f38:	910083e8 	add	x8, sp, #0x20
   82f3c:	90000029 	adrp	x9, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   82f40:	eb01005f 	cmp	x2, x1
   82f44:	9118c129 	add	x9, x9, #0x630
   82f48:	a90a33e8 	stp	x8, x12, [sp, #160]
   82f4c:	52800068 	mov	w8, #0x3                   	// #3
   82f50:	90000021 	adrp	x1, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   82f54:	910043ea 	add	x10, sp, #0x10
   82f58:	9a83804b 	csel	x11, x2, x3, hi  // hi = pmore
   82f5c:	a90523e9 	stp	x9, x8, [sp, #80]
   82f60:	910203e9 	add	x9, sp, #0x80
   82f64:	91198021 	add	x1, x1, #0x660
   82f68:	a90933ea 	stp	x10, x12, [sp, #144]
   82f6c:	a9067fff 	stp	xzr, xzr, [sp, #96]
   82f70:	f90023eb 	str	x11, [sp, #64]
   82f74:	a90723e9 	stp	x9, x8, [sp, #112]
   82f78:	910143e0 	add	x0, sp, #0x50
   82f7c:	94000616 	bl	847d4 <_ZN4core9panicking9panic_fmt17heca5e185b37feb0aE>
   82f80:	d4200020 	brk	#0x1
   82f84:	b0000029 	adrp	x9, 87000 <_DYNAMIC+0xf0>
   82f88:	f9402929 	ldr	x9, [x9, #80]
   82f8c:	910003e8 	mov	x8, sp
   82f90:	910023ea 	add	x10, sp, #0x8
   82f94:	910043eb 	add	x11, sp, #0x10
   82f98:	a90827e8 	stp	x8, x9, [sp, #128]
   82f9c:	d0000008 	adrp	x8, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   82fa0:	911d1108 	add	x8, x8, #0x744
   82fa4:	a90927ea 	stp	x10, x9, [sp, #144]
   82fa8:	910083e9 	add	x9, sp, #0x20
   82fac:	9000002a 	adrp	x10, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   82fb0:	a90a23eb 	stp	x11, x8, [sp, #160]
   82fb4:	9119e14a 	add	x10, x10, #0x678
   82fb8:	a90b23e9 	stp	x9, x8, [sp, #176]
   82fbc:	52800088 	mov	w8, #0x4                   	// #4
   82fc0:	910203e9 	add	x9, sp, #0x80
   82fc4:	90000021 	adrp	x1, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   82fc8:	a9067fff 	stp	xzr, xzr, [sp, #96]
   82fcc:	a90523ea 	stp	x10, x8, [sp, #80]
   82fd0:	a90723e9 	stp	x9, x8, [sp, #112]
   82fd4:	911ae021 	add	x1, x1, #0x6b8
   82fd8:	910143e0 	add	x0, sp, #0x50
   82fdc:	940005fe 	bl	847d4 <_ZN4core9panicking9panic_fmt17heca5e185b37feb0aE>
   82fe0:	d4200020 	brk	#0x1

0000000000082fe4 <_ZN4core6result13unwrap_failed17h9c29e1765dae37fbE>:
   82fe4:	a9b907e0 	stp	x0, x1, [sp, #-112]!
   82fe8:	d0000009 	adrp	x9, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   82fec:	910003e8 	mov	x8, sp
   82ff0:	911d1129 	add	x9, x9, #0x744
   82ff4:	d000000b 	adrp	x11, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   82ff8:	9000002c 	adrp	x12, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   82ffc:	90000021 	adrp	x1, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   83000:	910043ea 	add	x10, sp, #0x10
   83004:	911ce16b 	add	x11, x11, #0x738
   83008:	911d418c 	add	x12, x12, #0x750
   8300c:	5280004d 	mov	w13, #0x2                   	// #2
   83010:	a90527e8 	stp	x8, x9, [sp, #80]
   83014:	910143e8 	add	x8, sp, #0x50
   83018:	911dc021 	add	x1, x1, #0x770
   8301c:	910083e0 	add	x0, sp, #0x20
   83020:	a9010fe2 	stp	x2, x3, [sp, #16]
   83024:	a9037fff 	stp	xzr, xzr, [sp, #48]
   83028:	a9062fea 	stp	x10, x11, [sp, #96]
   8302c:	a90237ec 	stp	x12, x13, [sp, #32]
   83030:	a90437e8 	stp	x8, x13, [sp, #64]
   83034:	940005e8 	bl	847d4 <_ZN4core9panicking9panic_fmt17heca5e185b37feb0aE>
   83038:	d4200020 	brk	#0x1

000000000008303c <_ZN4core5slice20slice_index_len_fail17h7de5c2f6a09b202dE>:
   8303c:	a9ba07e0 	stp	x0, x1, [sp, #-96]!
   83040:	90000029 	adrp	x9, 87000 <_DYNAMIC+0xf0>
   83044:	f9402929 	ldr	x9, [x9, #80]
   83048:	910003e8 	mov	x8, sp
   8304c:	910023ea 	add	x10, sp, #0x8
   83050:	f0000001 	adrp	x1, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   83054:	a90427e8 	stp	x8, x9, [sp, #64]
   83058:	f0000008 	adrp	x8, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   8305c:	911e2108 	add	x8, x8, #0x788
   83060:	a90527ea 	stp	x10, x9, [sp, #80]
   83064:	52800049 	mov	w9, #0x2                   	// #2
   83068:	a90127e8 	stp	x8, x9, [sp, #16]
   8306c:	910103e8 	add	x8, sp, #0x40
   83070:	911ea021 	add	x1, x1, #0x7a8
   83074:	910043e0 	add	x0, sp, #0x10
   83078:	a9027fff 	stp	xzr, xzr, [sp, #32]
   8307c:	a90327e8 	stp	x8, x9, [sp, #48]
   83080:	940005d5 	bl	847d4 <_ZN4core9panicking9panic_fmt17heca5e185b37feb0aE>
   83084:	d4200020 	brk	#0x1

0000000000083088 <_ZN4core5slice22slice_index_order_fail17hf2829e51e4e6cde7E>:
   83088:	a9ba07e0 	stp	x0, x1, [sp, #-96]!
   8308c:	90000029 	adrp	x9, 87000 <_DYNAMIC+0xf0>
   83090:	f9402929 	ldr	x9, [x9, #80]
   83094:	910003e8 	mov	x8, sp
   83098:	910023ea 	add	x10, sp, #0x8
   8309c:	f0000001 	adrp	x1, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   830a0:	a90427e8 	stp	x8, x9, [sp, #64]
   830a4:	f0000008 	adrp	x8, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   830a8:	911f0108 	add	x8, x8, #0x7c0
   830ac:	a90527ea 	stp	x10, x9, [sp, #80]
   830b0:	52800049 	mov	w9, #0x2                   	// #2
   830b4:	a90127e8 	stp	x8, x9, [sp, #16]
   830b8:	910103e8 	add	x8, sp, #0x40
   830bc:	911f8021 	add	x1, x1, #0x7e0
   830c0:	910043e0 	add	x0, sp, #0x10
   830c4:	a9027fff 	stp	xzr, xzr, [sp, #32]
   830c8:	a90327e8 	stp	x8, x9, [sp, #48]
   830cc:	940005c2 	bl	847d4 <_ZN4core9panicking9panic_fmt17heca5e185b37feb0aE>
   830d0:	d4200020 	brk	#0x1

00000000000830d4 <_ZN4core7unicode9printable5check17he98a1a62d61fca11E.llvm.12087558922116405837>:
   830d4:	b4000322 	cbz	x2, 83138 <_ZN4core7unicode9printable5check17he98a1a62d61fca11E.llvm.12087558922116405837+0x64>
   830d8:	aa1f03e9 	mov	x9, xzr
   830dc:	8b02042a 	add	x10, x1, x2, lsl #1
   830e0:	39400028 	ldrb	w8, [x1]
   830e4:	3940042b 	ldrb	w11, [x1, #1]
   830e8:	12181c0c 	and	w12, w0, #0xff00
   830ec:	91000821 	add	x1, x1, #0x2
   830f0:	6b4c211f 	cmp	w8, w12, lsr #8
   830f4:	8b0b0128 	add	x8, x9, x11
   830f8:	54000181 	b.ne	83128 <_ZN4core7unicode9printable5check17he98a1a62d61fca11E.llvm.12087558922116405837+0x54>  // b.any
   830fc:	eb09011f 	cmp	x8, x9
   83100:	540006c3 	b.cc	831d8 <_ZN4core7unicode9printable5check17he98a1a62d61fca11E.llvm.12087558922116405837+0x104>  // b.lo, b.ul, b.last
   83104:	eb04011f 	cmp	x8, x4
   83108:	54000708 	b.hi	831e8 <_ZN4core7unicode9printable5check17he98a1a62d61fca11E.llvm.12087558922116405837+0x114>  // b.pmore
   8310c:	8b090069 	add	x9, x3, x9
   83110:	b40000eb 	cbz	x11, 8312c <_ZN4core7unicode9printable5check17he98a1a62d61fca11E.llvm.12087558922116405837+0x58>
   83114:	3840152c 	ldrb	w12, [x9], #1
   83118:	d100056b 	sub	x11, x11, #0x1
   8311c:	6b20019f 	cmp	w12, w0, uxtb
   83120:	54ffff81 	b.ne	83110 <_ZN4core7unicode9printable5check17he98a1a62d61fca11E.llvm.12087558922116405837+0x3c>  // b.any
   83124:	14000020 	b	831a4 <_ZN4core7unicode9printable5check17he98a1a62d61fca11E.llvm.12087558922116405837+0xd0>
   83128:	54000088 	b.hi	83138 <_ZN4core7unicode9printable5check17he98a1a62d61fca11E.llvm.12087558922116405837+0x64>  // b.pmore
   8312c:	eb0a003f 	cmp	x1, x10
   83130:	aa0803e9 	mov	x9, x8
   83134:	54fffd61 	b.ne	830e0 <_ZN4core7unicode9printable5check17he98a1a62d61fca11E.llvm.12087558922116405837+0xc>  // b.any
   83138:	b40003c6 	cbz	x6, 831b0 <_ZN4core7unicode9printable5check17he98a1a62d61fca11E.llvm.12087558922116405837+0xdc>
   8313c:	8b0600a9 	add	x9, x5, x6
   83140:	910004ab 	add	x11, x5, #0x1
   83144:	12003c0a 	and	w10, w0, #0xffff
   83148:	52800028 	mov	w8, #0x1                   	// #1
   8314c:	39c000ad 	ldrsb	w13, [x5]
   83150:	12001dac 	and	w12, w13, #0xff
   83154:	37f800ad 	tbnz	w13, #31, 83168 <_ZN4core7unicode9printable5check17he98a1a62d61fca11E.llvm.12087558922116405837+0x94>
   83158:	aa0b03e5 	mov	x5, x11
   8315c:	6b0c014a 	subs	w10, w10, w12
   83160:	54000165 	b.pl	8318c <_ZN4core7unicode9printable5check17he98a1a62d61fca11E.llvm.12087558922116405837+0xb8>  // b.nfrst
   83164:	1400000e 	b	8319c <_ZN4core7unicode9printable5check17he98a1a62d61fca11E.llvm.12087558922116405837+0xc8>
   83168:	eb09017f 	cmp	x11, x9
   8316c:	54000280 	b.eq	831bc <_ZN4core7unicode9printable5check17he98a1a62d61fca11E.llvm.12087558922116405837+0xe8>  // b.none
   83170:	3840156d 	ldrb	w13, [x11], #1
   83174:	1200198c 	and	w12, w12, #0x7f
   83178:	3318198d 	bfi	w13, w12, #8, #7
   8317c:	aa0b03e5 	mov	x5, x11
   83180:	2a0d03ec 	mov	w12, w13
   83184:	6b0c014a 	subs	w10, w10, w12
   83188:	540000a4 	b.mi	8319c <_ZN4core7unicode9printable5check17he98a1a62d61fca11E.llvm.12087558922116405837+0xc8>  // b.first
   8318c:	52000108 	eor	w8, w8, #0x1
   83190:	eb0900bf 	cmp	x5, x9
   83194:	910004ab 	add	x11, x5, #0x1
   83198:	54fffda1 	b.ne	8314c <_ZN4core7unicode9printable5check17he98a1a62d61fca11E.llvm.12087558922116405837+0x78>  // b.any
   8319c:	12000100 	and	w0, w8, #0x1
   831a0:	d65f03c0 	ret
   831a4:	2a1f03e8 	mov	w8, wzr
   831a8:	12000100 	and	w0, w8, #0x1
   831ac:	d65f03c0 	ret
   831b0:	52800028 	mov	w8, #0x1                   	// #1
   831b4:	12000100 	and	w0, w8, #0x1
   831b8:	d65f03c0 	ret
   831bc:	b0000000 	adrp	x0, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   831c0:	f0000002 	adrp	x2, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   831c4:	913c7000 	add	x0, x0, #0xf1c
   831c8:	911ce042 	add	x2, x2, #0x738
   831cc:	52800561 	mov	w1, #0x2b                  	// #43
   831d0:	94000562 	bl	84758 <_ZN4core9panicking5panic17hc6f3025301472b62E>
   831d4:	d4200020 	brk	#0x1
   831d8:	aa0903e0 	mov	x0, x9
   831dc:	aa0803e1 	mov	x1, x8
   831e0:	97ffffaa 	bl	83088 <_ZN4core5slice22slice_index_order_fail17hf2829e51e4e6cde7E>
   831e4:	d4200020 	brk	#0x1
   831e8:	aa0803e0 	mov	x0, x8
   831ec:	aa0403e1 	mov	x1, x4
   831f0:	97ffff93 	bl	8303c <_ZN4core5slice20slice_index_len_fail17h7de5c2f6a09b202dE>
   831f4:	d4200020 	brk	#0x1

00000000000831f8 <_ZN4core3str6traits101_$LT$impl$u20$core..slice..SliceIndex$LT$str$GT$$u20$for$u20$core..ops..range..Range$LT$usize$GT$$GT$5index28_$u7b$$u7b$closure$u7d$$u7d$17hdc798627b99da649E>:
   831f8:	a9402408 	ldp	x8, x9, [x0]
   831fc:	f940080a 	ldr	x10, [x0, #16]
   83200:	a9400500 	ldp	x0, x1, [x8]
   83204:	f9400122 	ldr	x2, [x9]
   83208:	f9400143 	ldr	x3, [x10]
   8320c:	97fffe95 	bl	82c60 <_ZN4core3str16slice_error_fail17h5ca7707651d53306E>
   83210:	d4200020 	brk	#0x1

0000000000083214 <_ZN4core3fmt10ArgumentV110show_usize17h47c4023363016272E.llvm.9999796914341271988>:
   83214:	d10103ff 	sub	sp, sp, #0x40
   83218:	f9400009 	ldr	x9, [x0]
   8321c:	f0000008 	adrp	x8, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   83220:	f9478508 	ldr	x8, [x8, #3848]
   83224:	aa0103e0 	mov	x0, x1
   83228:	d344fd2a 	lsr	x10, x9, #4
   8322c:	f109c55f 	cmp	x10, #0x271
   83230:	f9001bfe 	str	x30, [sp, #48]
   83234:	54000443 	b.cc	832bc <_ZN4core3fmt10ArgumentV110show_usize17h47c4023363016272E.llvm.9999796914341271988+0xa8>  // b.lo, b.ul, b.last
   83238:	d28b296b 	mov	x11, #0x594b                	// #22859
   8323c:	f2a710cb 	movk	x11, #0x3886, lsl #16
   83240:	f2d8bacb 	movk	x11, #0xc5d6, lsl #32
   83244:	5290a3ed 	mov	w13, #0x851f                	// #34079
   83248:	529c1ff0 	mov	w16, #0xe0ff                	// #57599
   8324c:	aa1f03ea 	mov	x10, xzr
   83250:	f2e68dab 	movk	x11, #0x346d, lsl #48
   83254:	5284e20c 	mov	w12, #0x2710                	// #10000
   83258:	72aa3d6d 	movk	w13, #0x51eb, lsl #16
   8325c:	52800c8e 	mov	w14, #0x64                  	// #100
   83260:	910023ef 	add	x15, sp, #0x8
   83264:	72a0beb0 	movk	w16, #0x5f5, lsl #16
   83268:	aa0903f1 	mov	x17, x9
   8326c:	9bcb7d29 	umulh	x9, x9, x11
   83270:	d34bfd29 	lsr	x9, x9, #11
   83274:	1b0cc532 	msub	w18, w9, w12, w17
   83278:	12003e41 	and	w1, w18, #0xffff
   8327c:	9bad7c21 	umull	x1, w1, w13
   83280:	d365fc21 	lsr	x1, x1, #37
   83284:	78617902 	ldrh	w2, [x8, x1, lsl #1]
   83288:	1b0ec832 	msub	w18, w1, w14, w18
   8328c:	8b0a01e1 	add	x1, x15, x10
   83290:	92403e52 	and	x18, x18, #0xffff
   83294:	78023022 	sturh	w2, [x1, #35]
   83298:	78727912 	ldrh	w18, [x8, x18, lsl #1]
   8329c:	eb10023f 	cmp	x17, x16
   832a0:	d100114a 	sub	x10, x10, #0x4
   832a4:	78025032 	sturh	w18, [x1, #37]
   832a8:	54fffe08 	b.hi	83268 <_ZN4core3fmt10ArgumentV110show_usize17h47c4023363016272E.llvm.9999796914341271988+0x54>  // b.pmore
   832ac:	91009d4a 	add	x10, x10, #0x27
   832b0:	f1018d3f 	cmp	x9, #0x63
   832b4:	540000ac 	b.gt	832c8 <_ZN4core3fmt10ArgumentV110show_usize17h47c4023363016272E.llvm.9999796914341271988+0xb4>
   832b8:	14000011 	b	832fc <_ZN4core3fmt10ArgumentV110show_usize17h47c4023363016272E.llvm.9999796914341271988+0xe8>
   832bc:	528004ea 	mov	w10, #0x27                  	// #39
   832c0:	f1018d3f 	cmp	x9, #0x63
   832c4:	540001cd 	b.le	832fc <_ZN4core3fmt10ArgumentV110show_usize17h47c4023363016272E.llvm.9999796914341271988+0xe8>
   832c8:	5290a3ec 	mov	w12, #0x851f                	// #34079
   832cc:	12003d2b 	and	w11, w9, #0xffff
   832d0:	72aa3d6c 	movk	w12, #0x51eb, lsl #16
   832d4:	9bac7d6b 	umull	x11, w11, w12
   832d8:	d365fd6b 	lsr	x11, x11, #37
   832dc:	52800c8c 	mov	w12, #0x64                  	// #100
   832e0:	1b0ca569 	msub	w9, w11, w12, w9
   832e4:	92403d29 	and	x9, x9, #0xffff
   832e8:	78697909 	ldrh	w9, [x8, x9, lsl #1]
   832ec:	d100094a 	sub	x10, x10, #0x2
   832f0:	910023ec 	add	x12, sp, #0x8
   832f4:	782a6989 	strh	w9, [x12, x10]
   832f8:	aa0b03e9 	mov	x9, x11
   832fc:	f100293f 	cmp	x9, #0xa
   83300:	540000ca 	b.ge	83318 <_ZN4core3fmt10ArgumentV110show_usize17h47c4023363016272E.llvm.9999796914341271988+0x104>  // b.tcont
   83304:	d1000548 	sub	x8, x10, #0x1
   83308:	1100c129 	add	w9, w9, #0x30
   8330c:	910023ea 	add	x10, sp, #0x8
   83310:	38286949 	strb	w9, [x10, x8]
   83314:	14000005 	b	83328 <_ZN4core3fmt10ArgumentV110show_usize17h47c4023363016272E.llvm.9999796914341271988+0x114>
   83318:	78697909 	ldrh	w9, [x8, x9, lsl #1]
   8331c:	d1000948 	sub	x8, x10, #0x2
   83320:	910023ea 	add	x10, sp, #0x8
   83324:	78286949 	strh	w9, [x10, x8]
   83328:	910023e9 	add	x9, sp, #0x8
   8332c:	528004ea 	mov	w10, #0x27                  	// #39
   83330:	b0000002 	adrp	x2, 84000 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x134>
   83334:	8b080124 	add	x4, x9, x8
   83338:	cb080145 	sub	x5, x10, x8
   8333c:	91354842 	add	x2, x2, #0xd52
   83340:	52800021 	mov	w1, #0x1                   	// #1
   83344:	aa1f03e3 	mov	x3, xzr
   83348:	940000ea 	bl	836f0 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E>
   8334c:	f9401bfe 	ldr	x30, [sp, #48]
   83350:	910103ff 	add	sp, sp, #0x40
   83354:	d65f03c0 	ret

0000000000083358 <_ZN4core3fmt5write17hc57a24d3d8e085f5E>:
   83358:	d10303ff 	sub	sp, sp, #0xc0
   8335c:	a9095bf7 	stp	x23, x22, [sp, #144]
   83360:	a9422056 	ldp	x22, x8, [x2, #32]
   83364:	d0000009 	adrp	x9, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   83368:	a90a53f5 	stp	x21, x20, [sp, #160]
   8336c:	fd461920 	ldr	d0, [x9, #3120]
   83370:	f9400855 	ldr	x21, [x2, #16]
   83374:	5280006a 	mov	w10, #0x3                   	// #3
   83378:	8b0812c9 	add	x9, x22, x8, lsl #4
   8337c:	f90033fc 	str	x28, [sp, #96]
   83380:	a9076bfb 	stp	x27, x26, [sp, #112]
   83384:	a90863f9 	stp	x25, x24, [sp, #128]
   83388:	a90b7bf3 	stp	x19, x30, [sp, #176]
   8338c:	f9000bff 	str	xzr, [sp, #16]
   83390:	f90003ff 	str	xzr, [sp]
   83394:	a90207e0 	stp	x0, x1, [sp, #32]
   83398:	390163ea 	strb	w10, [sp, #88]
   8339c:	a90423f6 	stp	x22, x8, [sp, #64]
   833a0:	a90327f6 	stp	x22, x9, [sp, #48]
   833a4:	fd002be0 	str	d0, [sp, #80]
   833a8:	b4001295 	cbz	x21, 835f8 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x2a0>
   833ac:	f9400c48 	ldr	x8, [x2, #24]
   833b0:	a9405053 	ldp	x19, x20, [x2]
   833b4:	9240e508 	and	x8, x8, #0x3ffffffffffffff
   833b8:	eb14011f 	cmp	x8, x20
   833bc:	9a888296 	csel	x22, x20, x8, hi  // hi = pmore
   833c0:	b4001536 	cbz	x22, 83664 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x30c>
   833c4:	a9400a68 	ldp	x8, x2, [x19]
   833c8:	f9400c29 	ldr	x9, [x1, #24]
   833cc:	aa0803e1 	mov	x1, x8
   833d0:	d63f0120 	blr	x9
   833d4:	370015a0 	tbnz	w0, #0, 83688 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x330>
   833d8:	d000001a 	adrp	x26, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   833dc:	d000001b 	adrp	x27, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   833e0:	9000001c 	adrp	x28, 83000 <_ZN4core6result13unwrap_failed17h9c29e1765dae37fbE+0x1c>
   833e4:	910082b7 	add	x23, x21, #0x20
   833e8:	91006278 	add	x24, x19, #0x18
   833ec:	52800039 	mov	w25, #0x1                   	// #1
   833f0:	9130e35a 	add	x26, x26, #0xc38
   833f4:	9130f37b 	add	x27, x27, #0xc3c
   833f8:	9108539c 	add	x28, x28, #0x214
   833fc:	52800035 	mov	w21, #0x1                   	// #1
   83400:	394062e8 	ldrb	w8, [x23, #24]
   83404:	390163e8 	strb	w8, [sp, #88]
   83408:	fd400ae0 	ldr	d0, [x23, #16]
   8340c:	0ea00800 	rev64	v0.2s, v0.2s
   83410:	fd002be0 	str	d0, [sp, #80]
   83414:	a94006e8 	ldp	x8, x1, [x23]
   83418:	100000a9 	adr	x9, 8342c <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0xd4>
   8341c:	38686b4a 	ldrb	w10, [x26, x8]
   83420:	8b0a0929 	add	x9, x9, x10, lsl #2
   83424:	aa1f03e8 	mov	x8, xzr
   83428:	d61f0120 	br	x9
   8342c:	a90007f9 	stp	x25, x1, [sp]
   83430:	a97f06e8 	ldp	x8, x1, [x23, #-16]
   83434:	100000a9 	adr	x9, 83448 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0xf0>
   83438:	38686b6a 	ldrb	w10, [x27, x8]
   8343c:	8b0a0929 	add	x9, x9, x10, lsl #2
   83440:	aa1f03e8 	mov	x8, xzr
   83444:	d61f0120 	br	x9
   83448:	a94327e8 	ldp	x8, x9, [sp, #48]
   8344c:	eb09011f 	cmp	x8, x9
   83450:	54000c80 	b.eq	835e0 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x288>  // b.none
   83454:	91004109 	add	x9, x8, #0x10
   83458:	f9001be9 	str	x9, [sp, #48]
   8345c:	f9400509 	ldr	x9, [x8, #8]
   83460:	eb1c013f 	cmp	x9, x28
   83464:	54000be1 	b.ne	835e0 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x288>  // b.any
   83468:	f9400108 	ldr	x8, [x8]
   8346c:	14000041 	b	83570 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x218>
   83470:	f94027e2 	ldr	x2, [sp, #72]
   83474:	eb01005f 	cmp	x2, x1
   83478:	54001269 	b.ls	836c4 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x36c>  // b.plast
   8347c:	f94023e8 	ldr	x8, [sp, #64]
   83480:	8b011109 	add	x9, x8, x1, lsl #4
   83484:	f9400529 	ldr	x9, [x9, #8]
   83488:	eb1c013f 	cmp	x9, x28
   8348c:	540004e1 	b.ne	83528 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x1d0>  // b.any
   83490:	d37cec29 	lsl	x9, x1, #4
   83494:	f8696908 	ldr	x8, [x8, x9]
   83498:	f9400108 	ldr	x8, [x8]
   8349c:	a90023f9 	stp	x25, x8, [sp]
   834a0:	a97f06e8 	ldp	x8, x1, [x23, #-16]
   834a4:	10fffd29 	adr	x9, 83448 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0xf0>
   834a8:	38686b6a 	ldrb	w10, [x27, x8]
   834ac:	8b0a0929 	add	x9, x9, x10, lsl #2
   834b0:	aa1f03e8 	mov	x8, xzr
   834b4:	d61f0120 	br	x9
   834b8:	a90107e8 	stp	x8, x1, [sp, #16]
   834bc:	f85e02e8 	ldur	x8, [x23, #-32]
   834c0:	f100051f 	cmp	x8, #0x1
   834c4:	54000621 	b.ne	83588 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x230>  // b.any
   834c8:	f85e82e1 	ldur	x1, [x23, #-24]
   834cc:	f94027e2 	ldr	x2, [sp, #72]
   834d0:	eb02003f 	cmp	x1, x2
   834d4:	54000f02 	b.cs	836b4 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x35c>  // b.hs, b.nlast
   834d8:	f94023e8 	ldr	x8, [sp, #64]
   834dc:	8b011108 	add	x8, x8, x1, lsl #4
   834e0:	1400002f 	b	8359c <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x244>
   834e4:	a94327e8 	ldp	x8, x9, [sp, #48]
   834e8:	eb09011f 	cmp	x8, x9
   834ec:	540001e0 	b.eq	83528 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x1d0>  // b.none
   834f0:	91004109 	add	x9, x8, #0x10
   834f4:	f9001be9 	str	x9, [sp, #48]
   834f8:	f9400509 	ldr	x9, [x8, #8]
   834fc:	eb1c013f 	cmp	x9, x28
   83500:	54000141 	b.ne	83528 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x1d0>  // b.any
   83504:	f9400108 	ldr	x8, [x8]
   83508:	f9400108 	ldr	x8, [x8]
   8350c:	a90023f9 	stp	x25, x8, [sp]
   83510:	a97f06e8 	ldp	x8, x1, [x23, #-16]
   83514:	10fff9a9 	adr	x9, 83448 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0xf0>
   83518:	38686b6a 	ldrb	w10, [x27, x8]
   8351c:	8b0a0929 	add	x9, x9, x10, lsl #2
   83520:	aa1f03e8 	mov	x8, xzr
   83524:	d61f0120 	br	x9
   83528:	aa1f03e8 	mov	x8, xzr
   8352c:	a90023e8 	stp	x8, x8, [sp]
   83530:	a97f06e8 	ldp	x8, x1, [x23, #-16]
   83534:	10fff8a9 	adr	x9, 83448 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0xf0>
   83538:	38686b6a 	ldrb	w10, [x27, x8]
   8353c:	8b0a0929 	add	x9, x9, x10, lsl #2
   83540:	aa1f03e8 	mov	x8, xzr
   83544:	d61f0120 	br	x9
   83548:	f94027e2 	ldr	x2, [sp, #72]
   8354c:	eb01005f 	cmp	x2, x1
   83550:	54000ba9 	b.ls	836c4 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x36c>  // b.plast
   83554:	f94023e8 	ldr	x8, [sp, #64]
   83558:	8b011109 	add	x9, x8, x1, lsl #4
   8355c:	f9400529 	ldr	x9, [x9, #8]
   83560:	eb1c013f 	cmp	x9, x28
   83564:	540003e1 	b.ne	835e0 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x288>  // b.any
   83568:	d37cec29 	lsl	x9, x1, #4
   8356c:	f8696908 	ldr	x8, [x8, x9]
   83570:	f9400101 	ldr	x1, [x8]
   83574:	52800028 	mov	w8, #0x1                   	// #1
   83578:	a90107e8 	stp	x8, x1, [sp, #16]
   8357c:	f85e02e8 	ldur	x8, [x23, #-32]
   83580:	f100051f 	cmp	x8, #0x1
   83584:	54fffa20 	b.eq	834c8 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x170>  // b.none
   83588:	a94327e8 	ldp	x8, x9, [sp, #48]
   8358c:	eb09011f 	cmp	x8, x9
   83590:	54000a20 	b.eq	836d4 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x37c>  // b.none
   83594:	91004109 	add	x9, x8, #0x10
   83598:	f9001be9 	str	x9, [sp, #48]
   8359c:	91002109 	add	x9, x8, #0x8
   835a0:	f9400129 	ldr	x9, [x9]
   835a4:	f9400100 	ldr	x0, [x8]
   835a8:	910003e1 	mov	x1, sp
   835ac:	d63f0120 	blr	x9
   835b0:	370006c0 	tbnz	w0, #0, 83688 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x330>
   835b4:	eb1602bf 	cmp	x21, x22
   835b8:	54000582 	b.cs	83668 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x310>  // b.hs, b.nlast
   835bc:	a94223e0 	ldp	x0, x8, [sp, #32]
   835c0:	a97f8b01 	ldp	x1, x2, [x24, #-8]
   835c4:	910006b5 	add	x21, x21, #0x1
   835c8:	f9400d08 	ldr	x8, [x8, #24]
   835cc:	d63f0100 	blr	x8
   835d0:	910102f7 	add	x23, x23, #0x40
   835d4:	91004318 	add	x24, x24, #0x10
   835d8:	3607f140 	tbz	w0, #0, 83400 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0xa8>
   835dc:	1400002b 	b	83688 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x330>
   835e0:	aa1f03e8 	mov	x8, xzr
   835e4:	a90107e8 	stp	x8, x1, [sp, #16]
   835e8:	f85e02e8 	ldur	x8, [x23, #-32]
   835ec:	f100051f 	cmp	x8, #0x1
   835f0:	54fff6c0 	b.eq	834c8 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x170>  // b.none
   835f4:	17ffffe5 	b	83588 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x230>
   835f8:	a9405053 	ldp	x19, x20, [x2]
   835fc:	eb14011f 	cmp	x8, x20
   83600:	9a888297 	csel	x23, x20, x8, hi  // hi = pmore
   83604:	b4000317 	cbz	x23, 83664 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x30c>
   83608:	a9400a68 	ldp	x8, x2, [x19]
   8360c:	f9400c29 	ldr	x9, [x1, #24]
   83610:	aa0803e1 	mov	x1, x8
   83614:	d63f0120 	blr	x9
   83618:	37000380 	tbnz	w0, #0, 83688 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x330>
   8361c:	aa1f03f8 	mov	x24, xzr
   83620:	52800035 	mov	w21, #0x1                   	// #1
   83624:	8b1802c8 	add	x8, x22, x24
   83628:	a9402100 	ldp	x0, x8, [x8]
   8362c:	910003e1 	mov	x1, sp
   83630:	d63f0100 	blr	x8
   83634:	370002a0 	tbnz	w0, #0, 83688 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x330>
   83638:	eb1702bf 	cmp	x21, x23
   8363c:	54000162 	b.cs	83668 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x310>  // b.hs, b.nlast
   83640:	a94223e0 	ldp	x0, x8, [sp, #32]
   83644:	8b180269 	add	x9, x19, x24
   83648:	a9410921 	ldp	x1, x2, [x9, #16]
   8364c:	910006b5 	add	x21, x21, #0x1
   83650:	f9400d08 	ldr	x8, [x8, #24]
   83654:	d63f0100 	blr	x8
   83658:	91004318 	add	x24, x24, #0x10
   8365c:	3607fe40 	tbz	w0, #0, 83624 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x2cc>
   83660:	1400000a 	b	83688 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x330>
   83664:	aa1f03f5 	mov	x21, xzr
   83668:	eb15029f 	cmp	x20, x21
   8366c:	54000129 	b.ls	83690 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x338>  // b.plast
   83670:	a94223e0 	ldp	x0, x8, [sp, #32]
   83674:	8b151269 	add	x9, x19, x21, lsl #4
   83678:	a9400921 	ldp	x1, x2, [x9]
   8367c:	f9400d08 	ldr	x8, [x8, #24]
   83680:	d63f0100 	blr	x8
   83684:	36000060 	tbz	w0, #0, 83690 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x338>
   83688:	52800020 	mov	w0, #0x1                   	// #1
   8368c:	14000002 	b	83694 <_ZN4core3fmt5write17hc57a24d3d8e085f5E+0x33c>
   83690:	2a1f03e0 	mov	w0, wzr
   83694:	a94b7bf3 	ldp	x19, x30, [sp, #176]
   83698:	a94a53f5 	ldp	x21, x20, [sp, #160]
   8369c:	a9495bf7 	ldp	x23, x22, [sp, #144]
   836a0:	a94863f9 	ldp	x25, x24, [sp, #128]
   836a4:	a9476bfb 	ldp	x27, x26, [sp, #112]
   836a8:	f94033fc 	ldr	x28, [sp, #96]
   836ac:	910303ff 	add	sp, sp, #0xc0
   836b0:	d65f03c0 	ret
   836b4:	f0000000 	adrp	x0, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   836b8:	91388000 	add	x0, x0, #0xe20
   836bc:	94000433 	bl	84788 <_ZN4core9panicking18panic_bounds_check17h61bb2fd281420b4eE>
   836c0:	d4200020 	brk	#0x1
   836c4:	f0000000 	adrp	x0, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   836c8:	9138e000 	add	x0, x0, #0xe38
   836cc:	9400042f 	bl	84788 <_ZN4core9panicking18panic_bounds_check17h61bb2fd281420b4eE>
   836d0:	d4200020 	brk	#0x1
   836d4:	d0000000 	adrp	x0, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   836d8:	f0000002 	adrp	x2, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   836dc:	91327800 	add	x0, x0, #0xc9e
   836e0:	91382042 	add	x2, x2, #0xe08
   836e4:	52800561 	mov	w1, #0x2b                  	// #43
   836e8:	9400041c 	bl	84758 <_ZN4core9panicking5panic17hc6f3025301472b62E>
   836ec:	d4200020 	brk	#0x1

00000000000836f0 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E>:
   836f0:	a9bb6bfb 	stp	x27, x26, [sp, #-80]!
   836f4:	a9025bf7 	stp	x23, x22, [sp, #32]
   836f8:	a90353f5 	stp	x21, x20, [sp, #48]
   836fc:	a9047bf3 	stp	x19, x30, [sp, #64]
   83700:	aa0503f4 	mov	x20, x5
   83704:	aa0403f5 	mov	x21, x4
   83708:	aa0303f6 	mov	x22, x3
   8370c:	aa0203f7 	mov	x23, x2
   83710:	aa0003f3 	mov	x19, x0
   83714:	a90163f9 	stp	x25, x24, [sp, #16]
   83718:	34000201 	cbz	w1, 83758 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x68>
   8371c:	b9405268 	ldr	w8, [x19, #80]
   83720:	52800569 	mov	w9, #0x2b                  	// #43
   83724:	52a0022a 	mov	w10, #0x110000              	// #1114112
   83728:	9240010b 	and	x11, x8, #0x1
   8372c:	7100017f 	cmp	w11, #0x0
   83730:	1a890158 	csel	w24, w10, w9, eq  // eq = none
   83734:	8b140169 	add	x9, x11, x20
   83738:	36100188 	tbz	w8, #2, 83768 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x78>
   8373c:	aa1603eb 	mov	x11, x22
   83740:	b4000616 	cbz	x22, 83800 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x110>
   83744:	f10006df 	cmp	x22, #0x1
   83748:	54000281 	b.ne	83798 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0xa8>  // b.any
   8374c:	aa1f03eb 	mov	x11, xzr
   83750:	aa1703ea 	mov	x10, x23
   83754:	14000024 	b	837e4 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0xf4>
   83758:	b9405268 	ldr	w8, [x19, #80]
   8375c:	91000689 	add	x9, x20, #0x1
   83760:	528005b8 	mov	w24, #0x2d                  	// #45
   83764:	3717fec8 	tbnz	w8, #2, 8373c <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x4c>
   83768:	aa1f03f6 	mov	x22, xzr
   8376c:	aa1f03f7 	mov	x23, xzr
   83770:	f940026a 	ldr	x10, [x19]
   83774:	f100055f 	cmp	x10, #0x1
   83778:	540004e0 	b.eq	83814 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x124>  // b.none
   8377c:	aa1303e0 	mov	x0, x19
   83780:	2a1803e1 	mov	w1, w24
   83784:	aa1703e2 	mov	x2, x23
   83788:	aa1603e3 	mov	x3, x22
   8378c:	940000a6 	bl	83a24 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hed4490a54895f023E>
   83790:	34000700 	cbz	w0, 83870 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x180>
   83794:	1400008f 	b	839d0 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2e0>
   83798:	927ffacd 	and	x13, x22, #0xfffffffffffffffe
   8379c:	aa1f03eb 	mov	x11, xzr
   837a0:	aa1f03ec 	mov	x12, xzr
   837a4:	8b0d02ea 	add	x10, x23, x13
   837a8:	910006ee 	add	x14, x23, #0x1
   837ac:	aa0d03ef 	mov	x15, x13
   837b0:	385ff1d0 	ldurb	w16, [x14, #-1]
   837b4:	384025d1 	ldrb	w17, [x14], #2
   837b8:	121a0610 	and	w16, w16, #0xc0
   837bc:	121a0631 	and	w17, w17, #0xc0
   837c0:	7102021f 	cmp	w16, #0x80
   837c4:	9a8b156b 	cinc	x11, x11, eq  // eq = none
   837c8:	7102023f 	cmp	w17, #0x80
   837cc:	9a8c158c 	cinc	x12, x12, eq  // eq = none
   837d0:	f10009ef 	subs	x15, x15, #0x2
   837d4:	54fffee1 	b.ne	837b0 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0xc0>  // b.any
   837d8:	eb1601bf 	cmp	x13, x22
   837dc:	8b0b018b 	add	x11, x12, x11
   837e0:	54000100 	b.eq	83800 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x110>  // b.none
   837e4:	8b1602ec 	add	x12, x23, x22
   837e8:	3840154d 	ldrb	w13, [x10], #1
   837ec:	121a05ad 	and	w13, w13, #0xc0
   837f0:	710201bf 	cmp	w13, #0x80
   837f4:	9a8b156b 	cinc	x11, x11, eq  // eq = none
   837f8:	eb0a019f 	cmp	x12, x10
   837fc:	54ffff61 	b.ne	837e8 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0xf8>  // b.any
   83800:	8b160129 	add	x9, x9, x22
   83804:	cb0b0129 	sub	x9, x9, x11
   83808:	f940026a 	ldr	x10, [x19]
   8380c:	f100055f 	cmp	x10, #0x1
   83810:	54fffb61 	b.ne	8377c <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x8c>  // b.any
   83814:	f940066a 	ldr	x10, [x19, #8]
   83818:	eb09015b 	subs	x27, x10, x9
   8381c:	540001e9 	b.ls	83858 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x168>  // b.plast
   83820:	371803c8 	tbnz	w8, #3, 83898 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x1a8>
   83824:	39416268 	ldrb	w8, [x19, #88]
   83828:	d0000009 	adrp	x9, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   8382c:	91311129 	add	x9, x9, #0xc44
   83830:	71000d1f 	cmp	w8, #0x3
   83834:	1a9f1508 	csinc	w8, w8, wzr, ne  // ne = any
   83838:	100000aa 	adr	x10, 8384c <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x15c>
   8383c:	3868692b 	ldrb	w11, [x9, x8]
   83840:	8b0b094a 	add	x10, x10, x11, lsl #2
   83844:	aa1f03e8 	mov	x8, xzr
   83848:	d61f0140 	br	x10
   8384c:	aa1b03e8 	mov	x8, x27
   83850:	aa1f03fb 	mov	x27, xzr
   83854:	1400002b 	b	83900 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x210>
   83858:	aa1303e0 	mov	x0, x19
   8385c:	2a1803e1 	mov	w1, w24
   83860:	aa1703e2 	mov	x2, x23
   83864:	aa1603e3 	mov	x3, x22
   83868:	9400006f 	bl	83a24 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hed4490a54895f023E>
   8386c:	37000b20 	tbnz	w0, #0, 839d0 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2e0>
   83870:	a9422260 	ldp	x0, x8, [x19, #32]
   83874:	aa1503e1 	mov	x1, x21
   83878:	aa1403e2 	mov	x2, x20
   8387c:	a9447bf3 	ldp	x19, x30, [sp, #64]
   83880:	f9400d03 	ldr	x3, [x8, #24]
   83884:	a94353f5 	ldp	x21, x20, [sp, #48]
   83888:	a9425bf7 	ldp	x23, x22, [sp, #32]
   8388c:	a94163f9 	ldp	x25, x24, [sp, #16]
   83890:	a8c56bfb 	ldp	x27, x26, [sp], #80
   83894:	d61f0060 	br	x3
   83898:	52800608 	mov	w8, #0x30                  	// #48
   8389c:	52800039 	mov	w25, #0x1                   	// #1
   838a0:	aa1303e0 	mov	x0, x19
   838a4:	2a1803e1 	mov	w1, w24
   838a8:	aa1703e2 	mov	x2, x23
   838ac:	aa1603e3 	mov	x3, x22
   838b0:	b9005668 	str	w8, [x19, #84]
   838b4:	39016279 	strb	w25, [x19, #88]
   838b8:	9400005b 	bl	83a24 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hed4490a54895f023E>
   838bc:	370008c0 	tbnz	w0, #0, 839d4 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2e4>
   838c0:	39416268 	ldrb	w8, [x19, #88]
   838c4:	d0000009 	adrp	x9, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   838c8:	91310129 	add	x9, x9, #0xc40
   838cc:	71000d1f 	cmp	w8, #0x3
   838d0:	1a9f1508 	csinc	w8, w8, wzr, ne  // ne = any
   838d4:	100000aa 	adr	x10, 838e8 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x1f8>
   838d8:	3868692b 	ldrb	w11, [x9, x8]
   838dc:	8b0b094a 	add	x10, x10, x11, lsl #2
   838e0:	aa1f03e8 	mov	x8, xzr
   838e4:	d61f0140 	br	x10
   838e8:	aa1b03e8 	mov	x8, x27
   838ec:	aa1f03fb 	mov	x27, xzr
   838f0:	14000028 	b	83990 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2a0>
   838f4:	91000769 	add	x9, x27, #0x1
   838f8:	d341ff68 	lsr	x8, x27, #1
   838fc:	d341fd3b 	lsr	x27, x9, #1
   83900:	91000519 	add	x25, x8, #0x1
   83904:	f1000739 	subs	x25, x25, #0x1
   83908:	540000e0 	b.eq	83924 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x234>  // b.none
   8390c:	a9422260 	ldp	x0, x8, [x19, #32]
   83910:	b9405661 	ldr	w1, [x19, #84]
   83914:	f9401108 	ldr	x8, [x8, #32]
   83918:	d63f0100 	blr	x8
   8391c:	3607ff40 	tbz	w0, #0, 83904 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x214>
   83920:	1400002c 	b	839d0 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2e0>
   83924:	b940567a 	ldr	w26, [x19, #84]
   83928:	aa1303e0 	mov	x0, x19
   8392c:	2a1803e1 	mov	w1, w24
   83930:	aa1703e2 	mov	x2, x23
   83934:	aa1603e3 	mov	x3, x22
   83938:	9400003b 	bl	83a24 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hed4490a54895f023E>
   8393c:	370004a0 	tbnz	w0, #0, 839d0 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2e0>
   83940:	a9422260 	ldp	x0, x8, [x19, #32]
   83944:	aa1503e1 	mov	x1, x21
   83948:	aa1403e2 	mov	x2, x20
   8394c:	f9400d08 	ldr	x8, [x8, #24]
   83950:	d63f0100 	blr	x8
   83954:	370003e0 	tbnz	w0, #0, 839d0 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2e0>
   83958:	a9424e74 	ldp	x20, x19, [x19, #32]
   8395c:	91000775 	add	x21, x27, #0x1
   83960:	52800039 	mov	w25, #0x1                   	// #1
   83964:	f10006b5 	subs	x21, x21, #0x1
   83968:	540005a0 	b.eq	83a1c <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x32c>  // b.none
   8396c:	f9401268 	ldr	x8, [x19, #32]
   83970:	aa1403e0 	mov	x0, x20
   83974:	2a1a03e1 	mov	w1, w26
   83978:	d63f0100 	blr	x8
   8397c:	3607ff40 	tbz	w0, #0, 83964 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x274>
   83980:	14000015 	b	839d4 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2e4>
   83984:	91000769 	add	x9, x27, #0x1
   83988:	d341ff68 	lsr	x8, x27, #1
   8398c:	d341fd3b 	lsr	x27, x9, #1
   83990:	91000516 	add	x22, x8, #0x1
   83994:	f10006d6 	subs	x22, x22, #0x1
   83998:	540000e0 	b.eq	839b4 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2c4>  // b.none
   8399c:	a9422260 	ldp	x0, x8, [x19, #32]
   839a0:	b9405661 	ldr	w1, [x19, #84]
   839a4:	f9401108 	ldr	x8, [x8, #32]
   839a8:	d63f0100 	blr	x8
   839ac:	3607ff40 	tbz	w0, #0, 83994 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2a4>
   839b0:	14000008 	b	839d0 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2e0>
   839b4:	a9422260 	ldp	x0, x8, [x19, #32]
   839b8:	b9405676 	ldr	w22, [x19, #84]
   839bc:	aa1503e1 	mov	x1, x21
   839c0:	aa1403e2 	mov	x2, x20
   839c4:	f9400d08 	ldr	x8, [x8, #24]
   839c8:	d63f0100 	blr	x8
   839cc:	36000120 	tbz	w0, #0, 839f0 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x300>
   839d0:	52800039 	mov	w25, #0x1                   	// #1
   839d4:	2a1903e0 	mov	w0, w25
   839d8:	a9447bf3 	ldp	x19, x30, [sp, #64]
   839dc:	a94353f5 	ldp	x21, x20, [sp, #48]
   839e0:	a9425bf7 	ldp	x23, x22, [sp, #32]
   839e4:	a94163f9 	ldp	x25, x24, [sp, #16]
   839e8:	a8c56bfb 	ldp	x27, x26, [sp], #80
   839ec:	d65f03c0 	ret
   839f0:	a9424e74 	ldp	x20, x19, [x19, #32]
   839f4:	91000775 	add	x21, x27, #0x1
   839f8:	52800039 	mov	w25, #0x1                   	// #1
   839fc:	f10006b5 	subs	x21, x21, #0x1
   83a00:	540000e0 	b.eq	83a1c <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x32c>  // b.none
   83a04:	f9401268 	ldr	x8, [x19, #32]
   83a08:	aa1403e0 	mov	x0, x20
   83a0c:	2a1603e1 	mov	w1, w22
   83a10:	d63f0100 	blr	x8
   83a14:	3607ff40 	tbz	w0, #0, 839fc <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x30c>
   83a18:	17ffffef 	b	839d4 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2e4>
   83a1c:	2a1f03f9 	mov	w25, wzr
   83a20:	17ffffed 	b	839d4 <_ZN4core3fmt9Formatter12pad_integral17ha43538b6be94a2c3E+0x2e4>

0000000000083a24 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hed4490a54895f023E>:
   83a24:	a9be53f5 	stp	x21, x20, [sp, #-32]!
   83a28:	a9017bf3 	stp	x19, x30, [sp, #16]
   83a2c:	aa0303f3 	mov	x19, x3
   83a30:	aa0203f4 	mov	x20, x2
   83a34:	7144403f 	cmp	w1, #0x110, lsl #12
   83a38:	aa0003f5 	mov	x21, x0
   83a3c:	54000120 	b.eq	83a60 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hed4490a54895f023E+0x3c>  // b.none
   83a40:	a94222a0 	ldp	x0, x8, [x21, #32]
   83a44:	f9401108 	ldr	x8, [x8, #32]
   83a48:	d63f0100 	blr	x8
   83a4c:	340000a0 	cbz	w0, 83a60 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hed4490a54895f023E+0x3c>
   83a50:	52800020 	mov	w0, #0x1                   	// #1
   83a54:	a9417bf3 	ldp	x19, x30, [sp, #16]
   83a58:	a8c253f5 	ldp	x21, x20, [sp], #32
   83a5c:	d65f03c0 	ret
   83a60:	b4000114 	cbz	x20, 83a80 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hed4490a54895f023E+0x5c>
   83a64:	a94222a0 	ldp	x0, x8, [x21, #32]
   83a68:	aa1303e2 	mov	x2, x19
   83a6c:	a9417bf3 	ldp	x19, x30, [sp, #16]
   83a70:	aa1403e1 	mov	x1, x20
   83a74:	f9400d03 	ldr	x3, [x8, #24]
   83a78:	a8c253f5 	ldp	x21, x20, [sp], #32
   83a7c:	d61f0060 	br	x3
   83a80:	2a1f03e0 	mov	w0, wzr
   83a84:	a9417bf3 	ldp	x19, x30, [sp, #16]
   83a88:	a8c253f5 	ldp	x21, x20, [sp], #32
   83a8c:	d65f03c0 	ret

0000000000083a90 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E>:
   83a90:	a9bd5bf7 	stp	x23, x22, [sp, #-48]!
   83a94:	a90153f5 	stp	x21, x20, [sp, #16]
   83a98:	a9027bf3 	stp	x19, x30, [sp, #32]
   83a9c:	f9400008 	ldr	x8, [x0]
   83aa0:	f9400809 	ldr	x9, [x0, #16]
   83aa4:	aa0203f4 	mov	x20, x2
   83aa8:	aa0003f3 	mov	x19, x0
   83aac:	f100051f 	cmp	x8, #0x1
   83ab0:	aa0103f5 	mov	x21, x1
   83ab4:	54000081 	b.ne	83ac4 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x34>  // b.any
   83ab8:	f100053f 	cmp	x9, #0x1
   83abc:	54000080 	b.eq	83acc <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x3c>  // b.none
   83ac0:	1400006f 	b	83c7c <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x1ec>
   83ac4:	f100053f 	cmp	x9, #0x1
   83ac8:	540013a1 	b.ne	83d3c <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x2ac>  // b.any
   83acc:	b4000d54 	cbz	x20, 83c74 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x1e4>
   83ad0:	aa1503eb 	mov	x11, x21
   83ad4:	f9400e69 	ldr	x9, [x19, #24]
   83ad8:	38c0156c 	ldrsb	w12, [x11], #1
   83adc:	8b1402aa 	add	x10, x21, x20
   83ae0:	36f8052c 	tbz	w12, #31, 83b84 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0xf4>
   83ae4:	f100069f 	cmp	x20, #0x1
   83ae8:	12001d8c 	and	w12, w12, #0xff
   83aec:	540001a1 	b.ne	83b20 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x90>  // b.any
   83af0:	2a1f03ed 	mov	w13, wzr
   83af4:	aa0a03ee 	mov	x14, x10
   83af8:	7103819f 	cmp	w12, #0xe0
   83afc:	54000443 	b.cc	83b84 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0xf4>  // b.lo, b.ul, b.last
   83b00:	eb0a01df 	cmp	x14, x10
   83b04:	540001e0 	b.eq	83b40 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0xb0>  // b.none
   83b08:	384015cb 	ldrb	w11, [x14], #1
   83b0c:	1200156f 	and	w15, w11, #0x3f
   83b10:	aa0e03eb 	mov	x11, x14
   83b14:	7103c19f 	cmp	w12, #0xf0
   83b18:	540001c2 	b.cs	83b50 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0xc0>  // b.hs, b.nlast
   83b1c:	1400001a 	b	83b84 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0xf4>
   83b20:	394006ad 	ldrb	w13, [x21, #1]
   83b24:	91000aab 	add	x11, x21, #0x2
   83b28:	aa0b03ee 	mov	x14, x11
   83b2c:	120015ad 	and	w13, w13, #0x3f
   83b30:	531a65ad 	lsl	w13, w13, #6
   83b34:	7103819f 	cmp	w12, #0xe0
   83b38:	54fffe42 	b.cs	83b00 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x70>  // b.hs, b.nlast
   83b3c:	14000012 	b	83b84 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0xf4>
   83b40:	2a1f03ef 	mov	w15, wzr
   83b44:	aa0a03ee 	mov	x14, x10
   83b48:	7103c19f 	cmp	w12, #0xf0
   83b4c:	540001c3 	b.cc	83b84 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0xf4>  // b.lo, b.ul, b.last
   83b50:	eb0a01df 	cmp	x14, x10
   83b54:	2a0d01ed 	orr	w13, w15, w13
   83b58:	540000a0 	b.eq	83b6c <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0xdc>  // b.none
   83b5c:	384015cb 	ldrb	w11, [x14], #1
   83b60:	1200156f 	and	w15, w11, #0x3f
   83b64:	aa0e03eb 	mov	x11, x14
   83b68:	14000002 	b	83b70 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0xe0>
   83b6c:	2a1f03ef 	mov	w15, wzr
   83b70:	530e098c 	ubfiz	w12, w12, #18, #3
   83b74:	331a2dac 	bfi	w12, w13, #6, #12
   83b78:	2a0f018c 	orr	w12, w12, w15
   83b7c:	7144419f 	cmp	w12, #0x110, lsl #12
   83b80:	540007a0 	b.eq	83c74 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x1e4>  // b.none
   83b84:	b40006e9 	cbz	x9, 83c60 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x1d0>
   83b88:	cb15016e 	sub	x14, x11, x21
   83b8c:	eb0b015f 	cmp	x10, x11
   83b90:	54000221 	b.ne	83bd4 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x144>  // b.any
   83b94:	14000038 	b	83c74 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x1e4>
   83b98:	3840160d 	ldrb	w13, [x16], #1
   83b9c:	120015af 	and	w15, w13, #0x3f
   83ba0:	aa1003ed 	mov	x13, x16
   83ba4:	530e09ce 	ubfiz	w14, w14, #18, #3
   83ba8:	331a2e2e 	bfi	w14, w17, #6, #12
   83bac:	2a0f01ce 	orr	w14, w14, w15
   83bb0:	714441df 	cmp	w14, #0x110, lsl #12
   83bb4:	54000600 	b.eq	83c74 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x1e4>  // b.none
   83bb8:	cb0b018b 	sub	x11, x12, x11
   83bbc:	d1000529 	sub	x9, x9, #0x1
   83bc0:	8b0d016e 	add	x14, x11, x13
   83bc4:	aa0d03eb 	mov	x11, x13
   83bc8:	b4000ce9 	cbz	x9, 83d64 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x2d4>
   83bcc:	eb0b015f 	cmp	x10, x11
   83bd0:	54000520 	b.eq	83c74 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x1e4>  // b.none
   83bd4:	aa0b03ed 	mov	x13, x11
   83bd8:	aa0e03ec 	mov	x12, x14
   83bdc:	38c015ae 	ldrsb	w14, [x13], #1
   83be0:	36fffece 	tbz	w14, #31, 83bb8 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x128>
   83be4:	eb0a01bf 	cmp	x13, x10
   83be8:	12001dce 	and	w14, w14, #0xff
   83bec:	54000260 	b.eq	83c38 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x1a8>  // b.none
   83bf0:	3940056f 	ldrb	w15, [x11, #1]
   83bf4:	9100096d 	add	x13, x11, #0x2
   83bf8:	aa0d03f0 	mov	x16, x13
   83bfc:	120015ef 	and	w15, w15, #0x3f
   83c00:	710381df 	cmp	w14, #0xe0
   83c04:	54fffda3 	b.cc	83bb8 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x128>  // b.lo, b.ul, b.last
   83c08:	eb0a021f 	cmp	x16, x10
   83c0c:	54000200 	b.eq	83c4c <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x1bc>  // b.none
   83c10:	3840160d 	ldrb	w13, [x16], #1
   83c14:	120015b1 	and	w17, w13, #0x3f
   83c18:	aa1003ed 	mov	x13, x16
   83c1c:	7103c1df 	cmp	w14, #0xf0
   83c20:	54fffcc3 	b.cc	83bb8 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x128>  // b.lo, b.ul, b.last
   83c24:	eb0a021f 	cmp	x16, x10
   83c28:	331a15f1 	bfi	w17, w15, #6, #6
   83c2c:	54fffb61 	b.ne	83b98 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x108>  // b.any
   83c30:	2a1f03ef 	mov	w15, wzr
   83c34:	17ffffdc 	b	83ba4 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x114>
   83c38:	2a1f03ef 	mov	w15, wzr
   83c3c:	aa0a03f0 	mov	x16, x10
   83c40:	710381df 	cmp	w14, #0xe0
   83c44:	54fffba3 	b.cc	83bb8 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x128>  // b.lo, b.ul, b.last
   83c48:	17fffff0 	b	83c08 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x178>
   83c4c:	2a1f03f1 	mov	w17, wzr
   83c50:	aa0a03f0 	mov	x16, x10
   83c54:	7103c1df 	cmp	w14, #0xf0
   83c58:	54fffb03 	b.cc	83bb8 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x128>  // b.lo, b.ul, b.last
   83c5c:	17fffff2 	b	83c24 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x194>
   83c60:	aa1f03ec 	mov	x12, xzr
   83c64:	aa1503e9 	mov	x9, x21
   83c68:	f100013f 	cmp	x9, #0x0
   83c6c:	9a8c0294 	csel	x20, x20, x12, eq  // eq = none
   83c70:	9a8902b5 	csel	x21, x21, x9, eq  // eq = none
   83c74:	f100051f 	cmp	x8, #0x1
   83c78:	54000621 	b.ne	83d3c <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x2ac>  // b.any
   83c7c:	b40000d4 	cbz	x20, 83c94 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x204>
   83c80:	f100069f 	cmp	x20, #0x1
   83c84:	54000141 	b.ne	83cac <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x21c>  // b.any
   83c88:	aa1f03e9 	mov	x9, xzr
   83c8c:	aa1503e8 	mov	x8, x21
   83c90:	1400001a 	b	83cf8 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x268>
   83c94:	aa1f03e9 	mov	x9, xzr
   83c98:	f9400668 	ldr	x8, [x19, #8]
   83c9c:	cb090289 	sub	x9, x20, x9
   83ca0:	eb08013f 	cmp	x9, x8
   83ca4:	54000403 	b.cc	83d24 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x294>  // b.lo, b.ul, b.last
   83ca8:	14000025 	b	83d3c <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x2ac>
   83cac:	927ffa8b 	and	x11, x20, #0xfffffffffffffffe
   83cb0:	aa1f03e9 	mov	x9, xzr
   83cb4:	aa1f03ea 	mov	x10, xzr
   83cb8:	8b0b02a8 	add	x8, x21, x11
   83cbc:	910006ac 	add	x12, x21, #0x1
   83cc0:	aa0b03ed 	mov	x13, x11
   83cc4:	385ff18e 	ldurb	w14, [x12, #-1]
   83cc8:	3840258f 	ldrb	w15, [x12], #2
   83ccc:	121a05ce 	and	w14, w14, #0xc0
   83cd0:	121a05ef 	and	w15, w15, #0xc0
   83cd4:	710201df 	cmp	w14, #0x80
   83cd8:	9a891529 	cinc	x9, x9, eq  // eq = none
   83cdc:	710201ff 	cmp	w15, #0x80
   83ce0:	9a8a154a 	cinc	x10, x10, eq  // eq = none
   83ce4:	f10009ad 	subs	x13, x13, #0x2
   83ce8:	54fffee1 	b.ne	83cc4 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x234>  // b.any
   83cec:	eb0b029f 	cmp	x20, x11
   83cf0:	8b090149 	add	x9, x10, x9
   83cf4:	54000100 	b.eq	83d14 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x284>  // b.none
   83cf8:	8b1402aa 	add	x10, x21, x20
   83cfc:	3840150b 	ldrb	w11, [x8], #1
   83d00:	121a056b 	and	w11, w11, #0xc0
   83d04:	7102017f 	cmp	w11, #0x80
   83d08:	9a891529 	cinc	x9, x9, eq  // eq = none
   83d0c:	eb08015f 	cmp	x10, x8
   83d10:	54ffff61 	b.ne	83cfc <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x26c>  // b.any
   83d14:	f9400668 	ldr	x8, [x19, #8]
   83d18:	cb090289 	sub	x9, x20, x9
   83d1c:	eb08013f 	cmp	x9, x8
   83d20:	540000e2 	b.cs	83d3c <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x2ac>  // b.hs, b.nlast
   83d24:	b40001d4 	cbz	x20, 83d5c <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x2cc>
   83d28:	f100069f 	cmp	x20, #0x1
   83d2c:	54000321 	b.ne	83d90 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x300>  // b.any
   83d30:	aa1f03ea 	mov	x10, xzr
   83d34:	aa1503e9 	mov	x9, x21
   83d38:	14000029 	b	83ddc <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x34c>
   83d3c:	a9422260 	ldp	x0, x8, [x19, #32]
   83d40:	aa1503e1 	mov	x1, x21
   83d44:	aa1403e2 	mov	x2, x20
   83d48:	a9427bf3 	ldp	x19, x30, [sp, #32]
   83d4c:	f9400d03 	ldr	x3, [x8, #24]
   83d50:	a94153f5 	ldp	x21, x20, [sp, #16]
   83d54:	a8c35bf7 	ldp	x23, x22, [sp], #48
   83d58:	d61f0060 	br	x3
   83d5c:	aa1f03ea 	mov	x10, xzr
   83d60:	14000026 	b	83df8 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x368>
   83d64:	b4fff80c 	cbz	x12, 83c64 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x1d4>
   83d68:	eb14019f 	cmp	x12, x20
   83d6c:	54fff7c0 	b.eq	83c64 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x1d4>  // b.none
   83d70:	eb14019f 	cmp	x12, x20
   83d74:	54000082 	b.cs	83d84 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x2f4>  // b.hs, b.nlast
   83d78:	38ec6aa9 	ldrsb	w9, [x21, x12]
   83d7c:	3101013f 	cmn	w9, #0x40
   83d80:	54fff72a 	b.ge	83c64 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x1d4>  // b.tcont
   83d84:	aa1f03e9 	mov	x9, xzr
   83d88:	aa1f03ec 	mov	x12, xzr
   83d8c:	17ffffb7 	b	83c68 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x1d8>
   83d90:	927ffa8c 	and	x12, x20, #0xfffffffffffffffe
   83d94:	aa1f03ea 	mov	x10, xzr
   83d98:	aa1f03eb 	mov	x11, xzr
   83d9c:	8b0c02a9 	add	x9, x21, x12
   83da0:	910006ad 	add	x13, x21, #0x1
   83da4:	aa0c03ee 	mov	x14, x12
   83da8:	385ff1af 	ldurb	w15, [x13, #-1]
   83dac:	384025b0 	ldrb	w16, [x13], #2
   83db0:	121a05ef 	and	w15, w15, #0xc0
   83db4:	121a0610 	and	w16, w16, #0xc0
   83db8:	710201ff 	cmp	w15, #0x80
   83dbc:	9a8a154a 	cinc	x10, x10, eq  // eq = none
   83dc0:	7102021f 	cmp	w16, #0x80
   83dc4:	9a8b156b 	cinc	x11, x11, eq  // eq = none
   83dc8:	f10009ce 	subs	x14, x14, #0x2
   83dcc:	54fffee1 	b.ne	83da8 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x318>  // b.any
   83dd0:	eb0c029f 	cmp	x20, x12
   83dd4:	8b0a016a 	add	x10, x11, x10
   83dd8:	54000100 	b.eq	83df8 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x368>  // b.none
   83ddc:	8b1402ab 	add	x11, x21, x20
   83de0:	3840152c 	ldrb	w12, [x9], #1
   83de4:	121a058c 	and	w12, w12, #0xc0
   83de8:	7102019f 	cmp	w12, #0x80
   83dec:	9a8a154a 	cinc	x10, x10, eq  // eq = none
   83df0:	eb09017f 	cmp	x11, x9
   83df4:	54ffff61 	b.ne	83de0 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x350>  // b.any
   83df8:	3941626b 	ldrb	w11, [x19, #88]
   83dfc:	d000000c 	adrp	x12, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   83e00:	9131218c 	add	x12, x12, #0xc48
   83e04:	cb14014a 	sub	x10, x10, x20
   83e08:	71000d7f 	cmp	w11, #0x3
   83e0c:	1a8b03eb 	csel	w11, wzr, w11, eq  // eq = none
   83e10:	100000cd 	adr	x13, 83e28 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x398>
   83e14:	386b698e 	ldrb	w14, [x12, x11]
   83e18:	8b0e09ad 	add	x13, x13, x14, lsl #2
   83e1c:	aa1f03e9 	mov	x9, xzr
   83e20:	8b080157 	add	x23, x10, x8
   83e24:	d61f01a0 	br	x13
   83e28:	aa1703e9 	mov	x9, x23
   83e2c:	aa1f03f7 	mov	x23, xzr
   83e30:	14000004 	b	83e40 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x3b0>
   83e34:	910006e8 	add	x8, x23, #0x1
   83e38:	d341fee9 	lsr	x9, x23, #1
   83e3c:	d341fd17 	lsr	x23, x8, #1
   83e40:	91000536 	add	x22, x9, #0x1
   83e44:	f10006d6 	subs	x22, x22, #0x1
   83e48:	540000e0 	b.eq	83e64 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x3d4>  // b.none
   83e4c:	a9422260 	ldp	x0, x8, [x19, #32]
   83e50:	b9405661 	ldr	w1, [x19, #84]
   83e54:	f9401108 	ldr	x8, [x8, #32]
   83e58:	d63f0100 	blr	x8
   83e5c:	3607ff40 	tbz	w0, #0, 83e44 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x3b4>
   83e60:	14000011 	b	83ea4 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x414>
   83e64:	a9422260 	ldp	x0, x8, [x19, #32]
   83e68:	b9405676 	ldr	w22, [x19, #84]
   83e6c:	aa1503e1 	mov	x1, x21
   83e70:	aa1403e2 	mov	x2, x20
   83e74:	f9400d08 	ldr	x8, [x8, #24]
   83e78:	d63f0100 	blr	x8
   83e7c:	37000140 	tbnz	w0, #0, 83ea4 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x414>
   83e80:	a9424e74 	ldp	x20, x19, [x19, #32]
   83e84:	910006f5 	add	x21, x23, #0x1
   83e88:	f10006b5 	subs	x21, x21, #0x1
   83e8c:	54000160 	b.eq	83eb8 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x428>  // b.none
   83e90:	f9401268 	ldr	x8, [x19, #32]
   83e94:	aa1403e0 	mov	x0, x20
   83e98:	2a1603e1 	mov	w1, w22
   83e9c:	d63f0100 	blr	x8
   83ea0:	3607ff40 	tbz	w0, #0, 83e88 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E+0x3f8>
   83ea4:	52800020 	mov	w0, #0x1                   	// #1
   83ea8:	a9427bf3 	ldp	x19, x30, [sp, #32]
   83eac:	a94153f5 	ldp	x21, x20, [sp, #16]
   83eb0:	a8c35bf7 	ldp	x23, x22, [sp], #48
   83eb4:	d65f03c0 	ret
   83eb8:	2a1f03e0 	mov	w0, wzr
   83ebc:	a9427bf3 	ldp	x19, x30, [sp, #32]
   83ec0:	a94153f5 	ldp	x21, x20, [sp, #16]
   83ec4:	a8c35bf7 	ldp	x23, x22, [sp], #48
   83ec8:	d65f03c0 	ret

0000000000083ecc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E>:
   83ecc:	d10283ff 	sub	sp, sp, #0xa0
   83ed0:	a9046ffc 	stp	x28, x27, [sp, #64]
   83ed4:	a90567fa 	stp	x26, x25, [sp, #80]
   83ed8:	a9065ff8 	stp	x24, x23, [sp, #96]
   83edc:	a90757f6 	stp	x22, x21, [sp, #112]
   83ee0:	a9084ff4 	stp	x20, x19, [sp, #128]
   83ee4:	a9097bfd 	stp	x29, x30, [sp, #144]
   83ee8:	a9422448 	ldp	x8, x9, [x2, #32]
   83eec:	aa0103f4 	mov	x20, x1
   83ef0:	aa0003f6 	mov	x22, x0
   83ef4:	52800441 	mov	w1, #0x22                  	// #34
   83ef8:	f9401129 	ldr	x9, [x9, #32]
   83efc:	aa0803e0 	mov	x0, x8
   83f00:	aa0203f3 	mov	x19, x2
   83f04:	d63f0120 	blr	x9
   83f08:	35002520 	cbnz	w0, 843ac <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x4e0>
   83f0c:	aa1f03f9 	mov	x25, xzr
   83f10:	b4002314 	cbz	x20, 84370 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x4a4>
   83f14:	aa1f03fb 	mov	x27, xzr
   83f18:	8b1402da 	add	x26, x22, x20
   83f1c:	aa1603f5 	mov	x21, x22
   83f20:	aa1503e9 	mov	x9, x21
   83f24:	38c0152a 	ldrsb	w10, [x9], #1
   83f28:	aa1503f8 	mov	x24, x21
   83f2c:	12001d48 	and	w8, w10, #0xff
   83f30:	37f8012a 	tbnz	w10, #31, 83f54 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x88>
   83f34:	aa0903f5 	mov	x21, x9
   83f38:	2a0803fd 	mov	w29, w8
   83f3c:	510027a8 	sub	w8, w29, #0x9
   83f40:	7100791f 	cmp	w8, #0x1e
   83f44:	54000749 	b.ls	8402c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x160>  // b.plast
   83f48:	710173bf 	cmp	w29, #0x5c
   83f4c:	540015a1 	b.ne	84200 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x334>  // b.any
   83f50:	1400003f 	b	8404c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x180>
   83f54:	eb1a013f 	cmp	x9, x26
   83f58:	540002c0 	b.eq	83fb0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0xe4>  // b.none
   83f5c:	394006a9 	ldrb	w9, [x21, #1]
   83f60:	91000aaa 	add	x10, x21, #0x2
   83f64:	aa0a03f5 	mov	x21, x10
   83f68:	1200153d 	and	w29, w9, #0x3f
   83f6c:	71037d1f 	cmp	w8, #0xdf
   83f70:	12001109 	and	w9, w8, #0x1f
   83f74:	540002a9 	b.ls	83fc8 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0xfc>  // b.plast
   83f78:	eb1a015f 	cmp	x10, x26
   83f7c:	54000300 	b.eq	83fdc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x110>  // b.none
   83f80:	3840154b 	ldrb	w11, [x10], #1
   83f84:	1200156b 	and	w11, w11, #0x3f
   83f88:	aa0a03f5 	mov	x21, x10
   83f8c:	7103c11f 	cmp	w8, #0xf0
   83f90:	331a17ab 	bfi	w11, w29, #6, #6
   83f94:	540002e3 	b.cc	83ff0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x124>  // b.lo, b.ul, b.last
   83f98:	eb1a015f 	cmp	x10, x26
   83f9c:	54000360 	b.eq	84008 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x13c>  // b.none
   83fa0:	38401548 	ldrb	w8, [x10], #1
   83fa4:	12001508 	and	w8, w8, #0x3f
   83fa8:	aa0a03f5 	mov	x21, x10
   83fac:	14000018 	b	8400c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x140>
   83fb0:	2a1f03fd 	mov	w29, wzr
   83fb4:	aa0903f5 	mov	x21, x9
   83fb8:	aa1a03ea 	mov	x10, x26
   83fbc:	71037d1f 	cmp	w8, #0xdf
   83fc0:	12001109 	and	w9, w8, #0x1f
   83fc4:	54fffda8 	b.hi	83f78 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0xac>  // b.pmore
   83fc8:	331a113d 	bfi	w29, w9, #6, #5
   83fcc:	510027a8 	sub	w8, w29, #0x9
   83fd0:	7100791f 	cmp	w8, #0x1e
   83fd4:	540002c9 	b.ls	8402c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x160>  // b.plast
   83fd8:	17ffffdc 	b	83f48 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x7c>
   83fdc:	2a1f03eb 	mov	w11, wzr
   83fe0:	aa1a03ea 	mov	x10, x26
   83fe4:	7103c11f 	cmp	w8, #0xf0
   83fe8:	331a17ab 	bfi	w11, w29, #6, #6
   83fec:	54fffd62 	b.cs	83f98 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0xcc>  // b.hs, b.nlast
   83ff0:	3314112b 	bfi	w11, w9, #12, #5
   83ff4:	2a0b03fd 	mov	w29, w11
   83ff8:	510027a8 	sub	w8, w29, #0x9
   83ffc:	7100791f 	cmp	w8, #0x1e
   84000:	54000169 	b.ls	8402c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x160>  // b.plast
   84004:	17ffffd1 	b	83f48 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x7c>
   84008:	2a1f03e8 	mov	w8, wzr
   8400c:	530e0929 	ubfiz	w9, w9, #18, #3
   84010:	331a2d69 	bfi	w9, w11, #6, #12
   84014:	2a08013d 	orr	w29, w9, w8
   84018:	714443bf 	cmp	w29, #0x110, lsl #12
   8401c:	54001aa0 	b.eq	84370 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x4a4>  // b.none
   84020:	510027a8 	sub	w8, w29, #0x9
   84024:	7100791f 	cmp	w8, #0x1e
   84028:	54fff908 	b.hi	83f48 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x7c>  // b.pmore
   8402c:	b000000b 	adrp	x11, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   84030:	9131316b 	add	x11, x11, #0xc4c
   84034:	100000c9 	adr	x9, 8404c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x180>
   84038:	3868696a 	ldrb	w10, [x11, x8]
   8403c:	8b0a0929 	add	x9, x9, x10, lsl #2
   84040:	52800e97 	mov	w23, #0x74                  	// #116
   84044:	5280005c 	mov	w28, #0x2                   	// #2
   84048:	d61f0120 	br	x9
   8404c:	5280005c 	mov	w28, #0x2                   	// #2
   84050:	2a1d03f7 	mov	w23, w29
   84054:	eb190362 	subs	x2, x27, x25
   84058:	a900d3f6 	stp	x22, x20, [sp, #8]
   8405c:	a901eff9 	stp	x25, x27, [sp, #24]
   84060:	54001ce3 	b.cc	843fc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x530>  // b.lo, b.ul, b.last
   84064:	b40000f9 	cbz	x25, 84080 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x1b4>
   84068:	eb14033f 	cmp	x25, x20
   8406c:	540000a0 	b.eq	84080 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x1b4>  // b.none
   84070:	54001c62 	b.cs	843fc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x530>  // b.hs, b.nlast
   84074:	38f96ac8 	ldrsb	w8, [x22, x25]
   84078:	3101051f 	cmn	w8, #0x41
   8407c:	54001c0d 	b.le	843fc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x530>
   84080:	b40000fb 	cbz	x27, 8409c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x1d0>
   84084:	eb14037f 	cmp	x27, x20
   84088:	540000a0 	b.eq	8409c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x1d0>  // b.none
   8408c:	54001b82 	b.cs	843fc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x530>  // b.hs, b.nlast
   84090:	38fb6ac8 	ldrsb	w8, [x22, x27]
   84094:	3101051f 	cmn	w8, #0x41
   84098:	54001b2d 	b.le	843fc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x530>
   8409c:	a9422260 	ldp	x0, x8, [x19, #32]
   840a0:	8b1902c1 	add	x1, x22, x25
   840a4:	f9400d08 	ldr	x8, [x8, #24]
   840a8:	d63f0100 	blr	x8
   840ac:	37001800 	tbnz	w0, #0, 843ac <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x4e0>
   840b0:	528000b9 	mov	w25, #0x5                   	// #5
   840b4:	14000007 	b	840d0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x204>
   840b8:	2a1f03fc 	mov	w28, wzr
   840bc:	2a1703e1 	mov	w1, w23
   840c0:	a9422260 	ldp	x0, x8, [x19, #32]
   840c4:	f9401108 	ldr	x8, [x8, #32]
   840c8:	d63f0100 	blr	x8
   840cc:	37001700 	tbnz	w0, #0, 843ac <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x4e0>
   840d0:	b000000b 	adrp	x11, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   840d4:	2a1c03e8 	mov	w8, w28
   840d8:	9131ad6b 	add	x11, x11, #0xc6b
   840dc:	10fffee9 	adr	x9, 840b8 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x1ec>
   840e0:	3868696a 	ldrb	w10, [x11, x8]
   840e4:	8b0a0929 	add	x9, x9, x10, lsl #2
   840e8:	52800b81 	mov	w1, #0x5c                  	// #92
   840ec:	5280003c 	mov	w28, #0x1                   	// #1
   840f0:	d61f0120 	br	x9
   840f4:	b000000b 	adrp	x11, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   840f8:	92401f28 	and	x8, x25, #0xff
   840fc:	9131bd6b 	add	x11, x11, #0xc6f
   84100:	10fffe09 	adr	x9, 840c0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x1f4>
   84104:	3868696a 	ldrb	w10, [x11, x8]
   84108:	8b0a0929 	add	x9, x9, x10, lsl #2
   8410c:	5280007c 	mov	w28, #0x3                   	// #3
   84110:	52800b81 	mov	w1, #0x5c                  	// #92
   84114:	52800099 	mov	w25, #0x4                   	// #4
   84118:	d61f0120 	br	x9
   8411c:	2a1f03f9 	mov	w25, wzr
   84120:	5280007c 	mov	w28, #0x3                   	// #3
   84124:	52800fa1 	mov	w1, #0x7d                  	// #125
   84128:	a9422260 	ldp	x0, x8, [x19, #32]
   8412c:	f9401108 	ldr	x8, [x8, #32]
   84130:	d63f0100 	blr	x8
   84134:	3607fce0 	tbz	w0, #0, 840d0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x204>
   84138:	1400009d 	b	843ac <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x4e0>
   8413c:	5280007c 	mov	w28, #0x3                   	// #3
   84140:	52800059 	mov	w25, #0x2                   	// #2
   84144:	52800f61 	mov	w1, #0x7b                  	// #123
   84148:	a9422260 	ldp	x0, x8, [x19, #32]
   8414c:	f9401108 	ldr	x8, [x8, #32]
   84150:	d63f0100 	blr	x8
   84154:	3607fbe0 	tbz	w0, #0, 840d0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x204>
   84158:	14000095 	b	843ac <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x4e0>
   8415c:	f94003ec 	ldr	x12, [sp]
   84160:	52800609 	mov	w9, #0x30                  	// #48
   84164:	531e0988 	ubfiz	w8, w12, #2, #3
   84168:	1ac827a8 	lsr	w8, w29, w8
   8416c:	12000d0b 	and	w11, w8, #0xf
   84170:	33000d09 	bfxil	w9, w8, #0, #4
   84174:	11015d68 	add	w8, w11, #0x57
   84178:	7100297f 	cmp	w11, #0xa
   8417c:	d100058a 	sub	x10, x12, #0x1
   84180:	1a883121 	csel	w1, w9, w8, cc  // cc = lo, ul, last
   84184:	f100019f 	cmp	x12, #0x0
   84188:	52800028 	mov	w8, #0x1                   	// #1
   8418c:	1a880519 	cinc	w25, w8, ne  // ne = any
   84190:	9a8a03e8 	csel	x8, xzr, x10, eq  // eq = none
   84194:	f90003e8 	str	x8, [sp]
   84198:	14000003 	b	841a4 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x2d8>
   8419c:	52800079 	mov	w25, #0x3                   	// #3
   841a0:	52800ea1 	mov	w1, #0x75                  	// #117
   841a4:	5280007c 	mov	w28, #0x3                   	// #3
   841a8:	a9422260 	ldp	x0, x8, [x19, #32]
   841ac:	f9401108 	ldr	x8, [x8, #32]
   841b0:	d63f0100 	blr	x8
   841b4:	3607f8e0 	tbz	w0, #0, 840d0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x204>
   841b8:	1400007d 	b	843ac <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x4e0>
   841bc:	710203bf 	cmp	w29, #0x80
   841c0:	54000062 	b.cs	841cc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x300>  // b.hs, b.nlast
   841c4:	52800028 	mov	w8, #0x1                   	// #1
   841c8:	14000008 	b	841e8 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x31c>
   841cc:	712003bf 	cmp	w29, #0x800
   841d0:	54000062 	b.cs	841dc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x310>  // b.hs, b.nlast
   841d4:	52800048 	mov	w8, #0x2                   	// #2
   841d8:	14000004 	b	841e8 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x31c>
   841dc:	714043bf 	cmp	w29, #0x10, lsl #12
   841e0:	52800068 	mov	w8, #0x3                   	// #3
   841e4:	9a883508 	cinc	x8, x8, cs  // cs = hs, nlast
   841e8:	8b1b0119 	add	x25, x8, x27
   841ec:	cb180368 	sub	x8, x27, x24
   841f0:	eb15035f 	cmp	x26, x21
   841f4:	8b15011b 	add	x27, x8, x21
   841f8:	54ffe941 	b.ne	83f20 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x54>  // b.any
   841fc:	1400005d 	b	84370 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x4a4>
   84200:	d0000000 	adrp	x0, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   84204:	911fe000 	add	x0, x0, #0x7f8
   84208:	2a1d03e1 	mov	w1, w29
   8420c:	9400017a 	bl	847f4 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h3d9be1ef71f9a60dE>
   84210:	370009a0 	tbnz	w0, #0, 84344 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x478>
   84214:	714043bf 	cmp	w29, #0x10, lsl #12
   84218:	540002e2 	b.cs	84274 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x3a8>  // b.hs, b.nlast
   8421c:	b0000001 	adrp	x1, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   84220:	b0000003 	adrp	x3, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   84224:	b0000005 	adrp	x5, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   84228:	52800522 	mov	w2, #0x29                  	// #41
   8422c:	528024a4 	mov	w4, #0x125                 	// #293
   84230:	52802746 	mov	w6, #0x13a                 	// #314
   84234:	2a1d03e0 	mov	w0, w29
   84238:	91036c21 	add	x1, x1, #0xdb
   8423c:	9104b463 	add	x3, x3, #0x12d
   84240:	910948a5 	add	x5, x5, #0x252
   84244:	97fffba4 	bl	830d4 <_ZN4core7unicode9printable5check17he98a1a62d61fca11E.llvm.12087558922116405837>
   84248:	3707fd20 	tbnz	w0, #0, 841ec <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x320>
   8424c:	1400003e 	b	84344 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x478>
   84250:	52800e57 	mov	w23, #0x72                  	// #114
   84254:	14000002 	b	8425c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x390>
   84258:	52800dd7 	mov	w23, #0x6e                  	// #110
   8425c:	5280005c 	mov	w28, #0x2                   	// #2
   84260:	eb190362 	subs	x2, x27, x25
   84264:	a900d3f6 	stp	x22, x20, [sp, #8]
   84268:	a901eff9 	stp	x25, x27, [sp, #24]
   8426c:	54ffefc2 	b.cs	84064 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x198>  // b.hs, b.nlast
   84270:	14000063 	b	843fc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x530>
   84274:	714083bf 	cmp	w29, #0x20, lsl #12
   84278:	540001c2 	b.cs	842b0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x3e4>  // b.hs, b.nlast
   8427c:	b0000001 	adrp	x1, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   84280:	b0000003 	adrp	x3, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   84284:	b0000005 	adrp	x5, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   84288:	52800462 	mov	w2, #0x23                  	// #35
   8428c:	528014c4 	mov	w4, #0xa6                  	// #166
   84290:	52803306 	mov	w6, #0x198                 	// #408
   84294:	2a1d03e0 	mov	w0, w29
   84298:	910e3021 	add	x1, x1, #0x38c
   8429c:	910f4863 	add	x3, x3, #0x3d2
   842a0:	9111e0a5 	add	x5, x5, #0x478
   842a4:	97fffb8c 	bl	830d4 <_ZN4core7unicode9printable5check17he98a1a62d61fca11E.llvm.12087558922116405837>
   842a8:	3707fa20 	tbnz	w0, #0, 841ec <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x320>
   842ac:	14000026 	b	84344 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x478>
   842b0:	529fc208 	mov	w8, #0xfe10                	// #65040
   842b4:	72bffe28 	movk	w8, #0xfff1, lsl #16
   842b8:	529fc209 	mov	w9, #0xfe10                	// #65040
   842bc:	0b0803a8 	add	w8, w29, w8
   842c0:	72a00049 	movk	w9, #0x2, lsl #16
   842c4:	6b09011f 	cmp	w8, w9
   842c8:	540003e3 	b.cc	84344 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x478>  // b.lo, b.ul, b.last
   842cc:	5280bc48 	mov	w8, #0x5e2                 	// #1506
   842d0:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   842d4:	5280dc49 	mov	w9, #0x6e2                 	// #1762
   842d8:	0b0803a8 	add	w8, w29, w8
   842dc:	72a00169 	movk	w9, #0xb, lsl #16
   842e0:	6b09011f 	cmp	w8, w9
   842e4:	54000303 	b.cc	84344 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x478>  // b.lo, b.ul, b.last
   842e8:	1138f508 	add	w8, w8, #0xe3d
   842ec:	71307d1f 	cmp	w8, #0xc1f
   842f0:	540002a3 	b.cc	84344 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x478>  // b.lo, b.ul, b.last
   842f4:	52862bc8 	mov	w8, #0x315e                	// #12638
   842f8:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   842fc:	0b0803a8 	add	w8, w29, w8
   84300:	7100391f 	cmp	w8, #0xe
   84304:	54000203 	b.cc	84344 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x478>  // b.lo, b.ul, b.last
   84308:	529703c9 	mov	w9, #0xb81e                	// #47134
   8430c:	121f4fa8 	and	w8, w29, #0x1ffffe
   84310:	72a00049 	movk	w9, #0x2, lsl #16
   84314:	6b09011f 	cmp	w8, w9
   84318:	54000160 	b.eq	84344 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x478>  // b.none
   8431c:	528b2528 	mov	w8, #0x5929                	// #22825
   84320:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   84324:	0b0803a8 	add	w8, w29, w8
   84328:	7100a51f 	cmp	w8, #0x29
   8432c:	540000c3 	b.cc	84344 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x478>  // b.lo, b.ul, b.last
   84330:	52891968 	mov	w8, #0x48cb                	// #18635
   84334:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   84338:	0b0803a8 	add	w8, w29, w8
   8433c:	7100291f 	cmp	w8, #0xa
   84340:	54fff568 	b.hi	841ec <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x320>  // b.pmore
   84344:	320003a8 	orr	w8, w29, #0x1
   84348:	5ac01108 	clz	w8, w8
   8434c:	53027d08 	lsr	w8, w8, #2
   84350:	52000908 	eor	w8, w8, #0x7
   84354:	5280007c 	mov	w28, #0x3                   	// #3
   84358:	f90003e8 	str	x8, [sp]
   8435c:	eb190362 	subs	x2, x27, x25
   84360:	a900d3f6 	stp	x22, x20, [sp, #8]
   84364:	a901eff9 	stp	x25, x27, [sp, #24]
   84368:	54ffe7e2 	b.cs	84064 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x198>  // b.hs, b.nlast
   8436c:	14000024 	b	843fc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x530>
   84370:	a900d3f6 	stp	x22, x20, [sp, #8]
   84374:	a901d3f9 	stp	x25, x20, [sp, #24]
   84378:	b40000f9 	cbz	x25, 84394 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x4c8>
   8437c:	eb14033f 	cmp	x25, x20
   84380:	540000a0 	b.eq	84394 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x4c8>  // b.none
   84384:	540003c2 	b.cs	843fc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x530>  // b.hs, b.nlast
   84388:	38f96ac8 	ldrsb	w8, [x22, x25]
   8438c:	3101051f 	cmn	w8, #0x41
   84390:	5400036d 	b.le	843fc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x530>
   84394:	a9422260 	ldp	x0, x8, [x19, #32]
   84398:	8b1902c1 	add	x1, x22, x25
   8439c:	cb190282 	sub	x2, x20, x25
   843a0:	f9400d08 	ldr	x8, [x8, #24]
   843a4:	d63f0100 	blr	x8
   843a8:	36000140 	tbz	w0, #0, 843d0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17hb50223159381ebe3E+0x504>
   843ac:	a9497bfd 	ldp	x29, x30, [sp, #144]
   843b0:	a9484ff4 	ldp	x20, x19, [sp, #128]
   843b4:	a94757f6 	ldp	x22, x21, [sp, #112]
   843b8:	a9465ff8 	ldp	x24, x23, [sp, #96]
   843bc:	a94567fa 	ldp	x26, x25, [sp, #80]
   843c0:	a9446ffc 	ldp	x28, x27, [sp, #64]
   843c4:	52800020 	mov	w0, #0x1                   	// #1
   843c8:	910283ff 	add	sp, sp, #0xa0
   843cc:	d65f03c0 	ret
   843d0:	a9422260 	ldp	x0, x8, [x19, #32]
   843d4:	a9497bfd 	ldp	x29, x30, [sp, #144]
   843d8:	a9484ff4 	ldp	x20, x19, [sp, #128]
   843dc:	a94757f6 	ldp	x22, x21, [sp, #112]
   843e0:	f9401102 	ldr	x2, [x8, #32]
   843e4:	a9465ff8 	ldp	x24, x23, [sp, #96]
   843e8:	a94567fa 	ldp	x26, x25, [sp, #80]
   843ec:	a9446ffc 	ldp	x28, x27, [sp, #64]
   843f0:	52800441 	mov	w1, #0x22                  	// #34
   843f4:	910283ff 	add	sp, sp, #0xa0
   843f8:	d61f0040 	br	x2
   843fc:	910023e8 	add	x8, sp, #0x8
   84400:	910063e9 	add	x9, sp, #0x18
   84404:	910083ea 	add	x10, sp, #0x20
   84408:	9100a3e0 	add	x0, sp, #0x28
   8440c:	a902a7e8 	stp	x8, x9, [sp, #40]
   84410:	f9001fea 	str	x10, [sp, #56]
   84414:	97fffb79 	bl	831f8 <_ZN4core3str6traits101_$LT$impl$u20$core..slice..SliceIndex$LT$str$GT$$u20$for$u20$core..ops..range..Range$LT$usize$GT$$GT$5index28_$u7b$$u7b$closure$u7d$$u7d$17hdc798627b99da649E>
   84418:	d4200020 	brk	#0x1

000000000008441c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE>:
   8441c:	a9bb6bfb 	stp	x27, x26, [sp, #-80]!
   84420:	a90163f9 	stp	x25, x24, [sp, #16]
   84424:	a9025bf7 	stp	x23, x22, [sp, #32]
   84428:	a90353f5 	stp	x21, x20, [sp, #48]
   8442c:	a9047bf3 	stp	x19, x30, [sp, #64]
   84430:	a9422428 	ldp	x8, x9, [x1, #32]
   84434:	aa0103f3 	mov	x19, x1
   84438:	aa0003f4 	mov	x20, x0
   8443c:	528004e1 	mov	w1, #0x27                  	// #39
   84440:	f9401129 	ldr	x9, [x9, #32]
   84444:	aa0803e0 	mov	x0, x8
   84448:	d63f0120 	blr	x9
   8444c:	34000100 	cbz	w0, 8446c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x50>
   84450:	a9447bf3 	ldp	x19, x30, [sp, #64]
   84454:	a94353f5 	ldp	x21, x20, [sp, #48]
   84458:	a9425bf7 	ldp	x23, x22, [sp, #32]
   8445c:	a94163f9 	ldp	x25, x24, [sp, #16]
   84460:	52800020 	mov	w0, #0x1                   	// #1
   84464:	a8c56bfb 	ldp	x27, x26, [sp], #80
   84468:	d65f03c0 	ret
   8446c:	b9400294 	ldr	w20, [x20]
   84470:	51002688 	sub	w8, w20, #0x9
   84474:	7100791f 	cmp	w8, #0x1e
   84478:	54000188 	b.hi	844a8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x8c>  // b.pmore
   8447c:	b0000009 	adrp	x9, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   84480:	9131d529 	add	x9, x9, #0xc75
   84484:	100000ca 	adr	x10, 8449c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x80>
   84488:	3868692b 	ldrb	w11, [x9, x8]
   8448c:	8b0b094a 	add	x10, x10, x11, lsl #2
   84490:	52800057 	mov	w23, #0x2                   	// #2
   84494:	52800e96 	mov	w22, #0x74                  	// #116
   84498:	d61f0140 	br	x10
   8449c:	52800057 	mov	w23, #0x2                   	// #2
   844a0:	52800dd6 	mov	w22, #0x6e                  	// #110
   844a4:	1400001c 	b	84514 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0xf8>
   844a8:	7101729f 	cmp	w20, #0x5c
   844ac:	54000081 	b.ne	844bc <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0xa0>  // b.any
   844b0:	52800057 	mov	w23, #0x2                   	// #2
   844b4:	2a1403f6 	mov	w22, w20
   844b8:	14000054 	b	84608 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x1ec>
   844bc:	d0000000 	adrp	x0, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   844c0:	911fe000 	add	x0, x0, #0x7f8
   844c4:	2a1403e1 	mov	w1, w20
   844c8:	940000cb 	bl	847f4 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h3d9be1ef71f9a60dE>
   844cc:	35000940 	cbnz	w0, 845f4 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x1d8>
   844d0:	7140429f 	cmp	w20, #0x10, lsl #12
   844d4:	54000222 	b.cs	84518 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0xfc>  // b.hs, b.nlast
   844d8:	b0000001 	adrp	x1, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   844dc:	b0000003 	adrp	x3, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   844e0:	b0000005 	adrp	x5, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   844e4:	91036c21 	add	x1, x1, #0xdb
   844e8:	9104b463 	add	x3, x3, #0x12d
   844ec:	910948a5 	add	x5, x5, #0x252
   844f0:	52800522 	mov	w2, #0x29                  	// #41
   844f4:	528024a4 	mov	w4, #0x125                 	// #293
   844f8:	52802746 	mov	w6, #0x13a                 	// #314
   844fc:	2a1403e0 	mov	w0, w20
   84500:	97fffaf5 	bl	830d4 <_ZN4core7unicode9printable5check17he98a1a62d61fca11E.llvm.12087558922116405837>
   84504:	37000720 	tbnz	w0, #0, 845e8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x1cc>
   84508:	1400003b 	b	845f4 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x1d8>
   8450c:	52800057 	mov	w23, #0x2                   	// #2
   84510:	52800e56 	mov	w22, #0x72                  	// #114
   84514:	1400003d 	b	84608 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x1ec>
   84518:	7140829f 	cmp	w20, #0x20, lsl #12
   8451c:	540001c2 	b.cs	84554 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x138>  // b.hs, b.nlast
   84520:	b0000001 	adrp	x1, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   84524:	b0000003 	adrp	x3, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   84528:	b0000005 	adrp	x5, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   8452c:	910e3021 	add	x1, x1, #0x38c
   84530:	910f4863 	add	x3, x3, #0x3d2
   84534:	9111e0a5 	add	x5, x5, #0x478
   84538:	52800462 	mov	w2, #0x23                  	// #35
   8453c:	528014c4 	mov	w4, #0xa6                  	// #166
   84540:	52803306 	mov	w6, #0x198                 	// #408
   84544:	2a1403e0 	mov	w0, w20
   84548:	97fffae3 	bl	830d4 <_ZN4core7unicode9printable5check17he98a1a62d61fca11E.llvm.12087558922116405837>
   8454c:	370004e0 	tbnz	w0, #0, 845e8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x1cc>
   84550:	14000029 	b	845f4 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x1d8>
   84554:	529fc208 	mov	w8, #0xfe10                	// #65040
   84558:	72bffe28 	movk	w8, #0xfff1, lsl #16
   8455c:	529fc209 	mov	w9, #0xfe10                	// #65040
   84560:	0b080288 	add	w8, w20, w8
   84564:	72a00049 	movk	w9, #0x2, lsl #16
   84568:	6b09011f 	cmp	w8, w9
   8456c:	54000443 	b.cc	845f4 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x1d8>  // b.lo, b.ul, b.last
   84570:	5280bc48 	mov	w8, #0x5e2                 	// #1506
   84574:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   84578:	5280dc49 	mov	w9, #0x6e2                 	// #1762
   8457c:	0b080288 	add	w8, w20, w8
   84580:	72a00169 	movk	w9, #0xb, lsl #16
   84584:	6b09011f 	cmp	w8, w9
   84588:	54000363 	b.cc	845f4 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x1d8>  // b.lo, b.ul, b.last
   8458c:	1138f508 	add	w8, w8, #0xe3d
   84590:	71307d1f 	cmp	w8, #0xc1f
   84594:	54000303 	b.cc	845f4 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x1d8>  // b.lo, b.ul, b.last
   84598:	52862bc8 	mov	w8, #0x315e                	// #12638
   8459c:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   845a0:	0b080288 	add	w8, w20, w8
   845a4:	7100391f 	cmp	w8, #0xe
   845a8:	54000263 	b.cc	845f4 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x1d8>  // b.lo, b.ul, b.last
   845ac:	529703c9 	mov	w9, #0xb81e                	// #47134
   845b0:	121f4e88 	and	w8, w20, #0x1ffffe
   845b4:	72a00049 	movk	w9, #0x2, lsl #16
   845b8:	6b09011f 	cmp	w8, w9
   845bc:	540001c0 	b.eq	845f4 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x1d8>  // b.none
   845c0:	528b2528 	mov	w8, #0x5929                	// #22825
   845c4:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   845c8:	0b080288 	add	w8, w20, w8
   845cc:	7100a51f 	cmp	w8, #0x29
   845d0:	54000123 	b.cc	845f4 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x1d8>  // b.lo, b.ul, b.last
   845d4:	52891968 	mov	w8, #0x48cb                	// #18635
   845d8:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   845dc:	0b080288 	add	w8, w20, w8
   845e0:	7100291f 	cmp	w8, #0xa
   845e4:	54000089 	b.ls	845f4 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x1d8>  // b.plast
   845e8:	52800037 	mov	w23, #0x1                   	// #1
   845ec:	2a1403f6 	mov	w22, w20
   845f0:	14000006 	b	84608 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x1ec>
   845f4:	32000288 	orr	w8, w20, #0x1
   845f8:	5ac01108 	clz	w8, w8
   845fc:	53027d08 	lsr	w8, w8, #2
   84600:	52000915 	eor	w21, w8, #0x7
   84604:	52800077 	mov	w23, #0x3                   	// #3
   84608:	b0000018 	adrp	x24, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   8460c:	b0000019 	adrp	x25, 85000 <anon.99640ad5fa2558591539ad4e94055125.13.llvm.5141956181242385385+0x2ae>
   84610:	528000bb 	mov	w27, #0x5                   	// #5
   84614:	91325318 	add	x24, x24, #0xc94
   84618:	91326339 	add	x25, x25, #0xc98
   8461c:	5280003a 	mov	w26, #0x1                   	// #1
   84620:	14000008 	b	84640 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x224>
   84624:	5280007b 	mov	w27, #0x3                   	// #3
   84628:	52800ea1 	mov	w1, #0x75                  	// #117
   8462c:	52800077 	mov	w23, #0x3                   	// #3
   84630:	a9422260 	ldp	x0, x8, [x19, #32]
   84634:	f9401108 	ldr	x8, [x8, #32]
   84638:	d63f0100 	blr	x8
   8463c:	3707f0a0 	tbnz	w0, #0, 84450 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x34>
   84640:	2a1703e8 	mov	w8, w23
   84644:	10ffff69 	adr	x9, 84630 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x214>
   84648:	38686b0a 	ldrb	w10, [x24, x8]
   8464c:	8b0a0929 	add	x9, x9, x10, lsl #2
   84650:	52800b81 	mov	w1, #0x5c                  	// #92
   84654:	52800037 	mov	w23, #0x1                   	// #1
   84658:	d61f0120 	br	x9
   8465c:	714442df 	cmp	w22, #0x110, lsl #12
   84660:	540005a0 	b.eq	84714 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x2f8>  // b.none
   84664:	2a1f03f7 	mov	w23, wzr
   84668:	2a1603e1 	mov	w1, w22
   8466c:	a9422260 	ldp	x0, x8, [x19, #32]
   84670:	f9401108 	ldr	x8, [x8, #32]
   84674:	d63f0100 	blr	x8
   84678:	3607fe40 	tbz	w0, #0, 84640 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x224>
   8467c:	17ffff75 	b	84450 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x34>
   84680:	92401f68 	and	x8, x27, #0xff
   84684:	10fffd09 	adr	x9, 84624 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x208>
   84688:	38686b2a 	ldrb	w10, [x25, x8]
   8468c:	8b0a0929 	add	x9, x9, x10, lsl #2
   84690:	52800077 	mov	w23, #0x3                   	// #3
   84694:	52800b81 	mov	w1, #0x5c                  	// #92
   84698:	5280009b 	mov	w27, #0x4                   	// #4
   8469c:	d61f0120 	br	x9
   846a0:	2a1f03fb 	mov	w27, wzr
   846a4:	52800077 	mov	w23, #0x3                   	// #3
   846a8:	52800fa1 	mov	w1, #0x7d                  	// #125
   846ac:	a9422260 	ldp	x0, x8, [x19, #32]
   846b0:	f9401108 	ldr	x8, [x8, #32]
   846b4:	d63f0100 	blr	x8
   846b8:	3607fc40 	tbz	w0, #0, 84640 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x224>
   846bc:	17ffff65 	b	84450 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x34>
   846c0:	531e0aa8 	ubfiz	w8, w21, #2, #3
   846c4:	1ac82688 	lsr	w8, w20, w8
   846c8:	52800609 	mov	w9, #0x30                  	// #48
   846cc:	12000d0b 	and	w11, w8, #0xf
   846d0:	33000d09 	bfxil	w9, w8, #0, #4
   846d4:	11015d68 	add	w8, w11, #0x57
   846d8:	7100297f 	cmp	w11, #0xa
   846dc:	d10006aa 	sub	x10, x21, #0x1
   846e0:	1a883121 	csel	w1, w9, w8, cc  // cc = lo, ul, last
   846e4:	f10002bf 	cmp	x21, #0x0
   846e8:	1a9a075b 	cinc	w27, w26, ne  // ne = any
   846ec:	9a8a03f5 	csel	x21, xzr, x10, eq  // eq = none
   846f0:	17ffffcf 	b	8462c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x210>
   846f4:	52800077 	mov	w23, #0x3                   	// #3
   846f8:	5280005b 	mov	w27, #0x2                   	// #2
   846fc:	52800f61 	mov	w1, #0x7b                  	// #123
   84700:	a9422260 	ldp	x0, x8, [x19, #32]
   84704:	f9401108 	ldr	x8, [x8, #32]
   84708:	d63f0100 	blr	x8
   8470c:	3607f9a0 	tbz	w0, #0, 84640 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x224>
   84710:	17ffff50 	b	84450 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h9fd67380d39aa33bE+0x34>
   84714:	a9422260 	ldp	x0, x8, [x19, #32]
   84718:	a9447bf3 	ldp	x19, x30, [sp, #64]
   8471c:	a94353f5 	ldp	x21, x20, [sp, #48]
   84720:	a9425bf7 	ldp	x23, x22, [sp, #32]
   84724:	f9401102 	ldr	x2, [x8, #32]
   84728:	a94163f9 	ldp	x25, x24, [sp, #16]
   8472c:	528004e1 	mov	w1, #0x27                  	// #39
   84730:	a8c56bfb 	ldp	x27, x26, [sp], #80
   84734:	d61f0040 	br	x2

0000000000084738 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h80461e635c4837b1E>:
   84738:	a9402000 	ldp	x0, x8, [x0]
   8473c:	f9400d02 	ldr	x2, [x8, #24]
   84740:	d61f0040 	br	x2

0000000000084744 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h138420cc67a515e1E>:
   84744:	a9400808 	ldp	x8, x2, [x0]
   84748:	aa0103e0 	mov	x0, x1
   8474c:	aa0803e1 	mov	x1, x8
   84750:	17fffcd0 	b	83a90 <_ZN4core3fmt9Formatter3pad17h44432f2c9d234b24E>

0000000000084754 <_ZN4core3ptr18real_drop_in_place17h4131d578b7195ed7E>:
   84754:	d65f03c0 	ret

0000000000084758 <_ZN4core9panicking5panic17hc6f3025301472b62E>:
   84758:	d10103ff 	sub	sp, sp, #0x40
   8475c:	a90307e0 	stp	x0, x1, [sp, #48]
   84760:	9100c3e8 	add	x8, sp, #0x30
   84764:	52800029 	mov	w9, #0x1                   	// #1
   84768:	5280010a 	mov	w10, #0x8                   	// #8
   8476c:	910003e0 	mov	x0, sp
   84770:	aa0203e1 	mov	x1, x2
   84774:	a9017fff 	stp	xzr, xzr, [sp, #16]
   84778:	a90027e8 	stp	x8, x9, [sp]
   8477c:	a9027fea 	stp	x10, xzr, [sp, #32]
   84780:	94000015 	bl	847d4 <_ZN4core9panicking9panic_fmt17heca5e185b37feb0aE>
   84784:	d4200020 	brk	#0x1

0000000000084788 <_ZN4core9panicking18panic_bounds_check17h61bb2fd281420b4eE>:
   84788:	aa0003e8 	mov	x8, x0
   8478c:	a9ba0be1 	stp	x1, x2, [sp, #-96]!
   84790:	f000000a 	adrp	x10, 87000 <_DYNAMIC+0xf0>
   84794:	f940294a 	ldr	x10, [x10, #80]
   84798:	910023e9 	add	x9, sp, #0x8
   8479c:	910003eb 	mov	x11, sp
   847a0:	910043e0 	add	x0, sp, #0x10
   847a4:	a9042be9 	stp	x9, x10, [sp, #64]
   847a8:	d0000009 	adrp	x9, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   847ac:	9139c129 	add	x9, x9, #0xe70
   847b0:	a9052beb 	stp	x11, x10, [sp, #80]
   847b4:	5280004a 	mov	w10, #0x2                   	// #2
   847b8:	a9012be9 	stp	x9, x10, [sp, #16]
   847bc:	910103e9 	add	x9, sp, #0x40
   847c0:	aa0803e1 	mov	x1, x8
   847c4:	a9027fff 	stp	xzr, xzr, [sp, #32]
   847c8:	a9032be9 	stp	x9, x10, [sp, #48]
   847cc:	94000002 	bl	847d4 <_ZN4core9panicking9panic_fmt17heca5e185b37feb0aE>
   847d0:	d4200020 	brk	#0x1

00000000000847d4 <_ZN4core9panicking9panic_fmt17heca5e185b37feb0aE>:
   847d4:	d0000009 	adrp	x9, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   847d8:	52800028 	mov	w8, #0x1                   	// #1
   847dc:	91394129 	add	x9, x9, #0xe50
   847e0:	a9be27e8 	stp	x8, x9, [sp, #-32]!
   847e4:	a90107e0 	stp	x0, x1, [sp, #16]
   847e8:	910003e0 	mov	x0, sp
   847ec:	94000047 	bl	84908 <rust_begin_unwind>
   847f0:	d4200020 	brk	#0x1

00000000000847f4 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h3d9be1ef71f9a60dE>:
   847f4:	7120003f 	cmp	w1, #0x800
   847f8:	54000082 	b.cs	84808 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h3d9be1ef71f9a60dE+0x14>  // b.hs, b.nlast
   847fc:	53067c28 	lsr	w8, w1, #6
   84800:	8b284c08 	add	x8, x0, w8, uxtw #3
   84804:	14000020 	b	84884 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h3d9be1ef71f9a60dE+0x90>
   84808:	7140403f 	cmp	w1, #0x10, lsl #12
   8480c:	54000182 	b.cs	8483c <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h3d9be1ef71f9a60dE+0x48>  // b.hs, b.nlast
   84810:	53067c28 	lsr	w8, w1, #6
   84814:	d1008108 	sub	x8, x8, #0x20
   84818:	f10f7d1f 	cmp	x8, #0x3df
   8481c:	54000408 	b.hi	8489c <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h3d9be1ef71f9a60dE+0xa8>  // b.pmore
   84820:	8b080008 	add	x8, x0, x8
   84824:	3944c108 	ldrb	w8, [x8, #304]
   84828:	f9408402 	ldr	x2, [x0, #264]
   8482c:	eb08005f 	cmp	x2, x8
   84830:	54000429 	b.ls	848b4 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h3d9be1ef71f9a60dE+0xc0>  // b.plast
   84834:	f9408009 	ldr	x9, [x0, #256]
   84838:	14000012 	b	84880 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h3d9be1ef71f9a60dE+0x8c>
   8483c:	530c7c28 	lsr	w8, w1, #12
   84840:	d1004108 	sub	x8, x8, #0x10
   84844:	f104011f 	cmp	x8, #0x100
   84848:	54000402 	b.cs	848c8 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h3d9be1ef71f9a60dE+0xd4>  // b.hs, b.nlast
   8484c:	8b080008 	add	x8, x0, x8
   84850:	39544109 	ldrb	w9, [x8, #1296]
   84854:	f9408c02 	ldr	x2, [x0, #280]
   84858:	53062c28 	ubfx	w8, w1, #6, #6
   8485c:	b37a1d28 	bfi	x8, x9, #6, #8
   84860:	eb02011f 	cmp	x8, x2
   84864:	540003e2 	b.cs	848e0 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h3d9be1ef71f9a60dE+0xec>  // b.hs, b.nlast
   84868:	f9408809 	ldr	x9, [x0, #272]
   8486c:	f9409402 	ldr	x2, [x0, #296]
   84870:	38686928 	ldrb	w8, [x9, x8]
   84874:	eb08005f 	cmp	x2, x8
   84878:	540003e9 	b.ls	848f4 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h3d9be1ef71f9a60dE+0x100>  // b.plast
   8487c:	f9409009 	ldr	x9, [x0, #288]
   84880:	8b080d28 	add	x8, x9, x8, lsl #3
   84884:	f9400108 	ldr	x8, [x8]
   84888:	52800029 	mov	w9, #0x1                   	// #1
   8488c:	9ac12129 	lsl	x9, x9, x1
   84890:	ea09011f 	tst	x8, x9
   84894:	1a9f07e0 	cset	w0, ne  // ne = any
   84898:	d65f03c0 	ret
   8489c:	d0000000 	adrp	x0, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   848a0:	913a4000 	add	x0, x0, #0xe90
   848a4:	52807c02 	mov	w2, #0x3e0                 	// #992
   848a8:	aa0803e1 	mov	x1, x8
   848ac:	97ffffb7 	bl	84788 <_ZN4core9panicking18panic_bounds_check17h61bb2fd281420b4eE>
   848b0:	d4200020 	brk	#0x1
   848b4:	d0000000 	adrp	x0, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   848b8:	913aa000 	add	x0, x0, #0xea8
   848bc:	aa0803e1 	mov	x1, x8
   848c0:	97ffffb2 	bl	84788 <_ZN4core9panicking18panic_bounds_check17h61bb2fd281420b4eE>
   848c4:	d4200020 	brk	#0x1
   848c8:	d0000000 	adrp	x0, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   848cc:	913b0000 	add	x0, x0, #0xec0
   848d0:	52802002 	mov	w2, #0x100                 	// #256
   848d4:	aa0803e1 	mov	x1, x8
   848d8:	97ffffac 	bl	84788 <_ZN4core9panicking18panic_bounds_check17h61bb2fd281420b4eE>
   848dc:	d4200020 	brk	#0x1
   848e0:	d0000000 	adrp	x0, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   848e4:	913b6000 	add	x0, x0, #0xed8
   848e8:	aa0803e1 	mov	x1, x8
   848ec:	97ffffa7 	bl	84788 <_ZN4core9panicking18panic_bounds_check17h61bb2fd281420b4eE>
   848f0:	d4200020 	brk	#0x1
   848f4:	d0000000 	adrp	x0, 86000 <anon.81cf826497787de4c024a8cbd0487f0b.3.llvm.10142641549133215767+0x1b3>
   848f8:	913bc000 	add	x0, x0, #0xef0
   848fc:	aa0803e1 	mov	x1, x8
   84900:	97ffffa2 	bl	84788 <_ZN4core9panicking18panic_bounds_check17h61bb2fd281420b4eE>
   84904:	d4200020 	brk	#0x1

0000000000084908 <rust_begin_unwind>:
   84908:	14000000 	b	84908 <rust_begin_unwind>
