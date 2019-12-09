
target/armv7-unknown-linux-gnueabihf/release/kernel:     file format elf32-littlearm


Disassembly of section .text:

00008000 <__boot>:
    8000:	ee100fb0 	mrc	15, 0, r0, cr0, cr0, {5}
    8004:	e2000003 	and	r0, r0, #3
    8008:	e59f10b8 	ldr	r1, [pc, #184]	; 80c8 <.SwitchReturn+0x24>
    800c:	e59f20b8 	ldr	r2, [pc, #184]	; 80cc <.SwitchReturn+0x28>
    8010:	e0511002 	subs	r1, r1, r2
    8014:	e0020091 	mul	r2, r1, r0
    8018:	e59f30b0 	ldr	r3, [pc, #176]	; 80d0 <.SwitchReturn+0x2c>
    801c:	e043d002 	sub	sp, r3, r2
    8020:	e3a00015 	mov	r0, #21
    8024:	eb0002d5 	bl	8b80 <lit_debug_led>
    8028:	e3500000 	cmp	r0, #0
    802c:	1a000005 	bne	8048 <.bss_done>
    8030:	e59f309c 	ldr	r3, [pc, #156]	; 80d4 <.SwitchReturn+0x30>
    8034:	e59f109c 	ldr	r1, [pc, #156]	; 80d8 <.SwitchReturn+0x34>
    8038:	e3a02000 	mov	r2, #0

0000803c <.bss_zero_loop>:
    803c:	e1530001 	cmp	r3, r1
    8040:	b4832004 	strlt	r2, [r3], #4
    8044:	bafffffc 	blt	803c <.bss_zero_loop>

00008048 <.bss_done>:
    8048:	ee110f50 	mrc	15, 0, r0, cr1, cr0, {2}
    804c:	e3800603 	orr	r0, r0, #3145728	; 0x300000
    8050:	e3800503 	orr	r0, r0, #12582912	; 0xc00000
    8054:	ee010f50 	mcr	15, 0, r0, cr1, cr0, {2}
    8058:	e3a00101 	mov	r0, #1073741824	; 0x40000000
    805c:	eee80a10 	vmsr	fpexc, r0
    8060:	ee100fb0 	mrc	15, 0, r0, cr0, cr0, {5}
    8064:	e2000003 	and	r0, r0, #3
    8068:	ea0000b2 	b	8338 <__rust_entry>
    806c:	ea0000af 	b	8330 <__hang>

00008070 <__switch_hyp_to_svc>:
    8070:	e1a0a00e 	mov	sl, lr
    8074:	e10f0000 	mrs	r0, CPSR
    8078:	e220001a 	eor	r0, r0, #26
    807c:	e310001f 	tst	r0, #31
    8080:	e3c0001f 	bic	r0, r0, #31
    8084:	e38000d3 	orr	r0, r0, #211	; 0xd3
    8088:	1a000004 	bne	80a0 <.NoSwitch>
    808c:	e3800c01 	orr	r0, r0, #256	; 0x100
    8090:	e28f100c 	add	r1, pc, #12
    8094:	e16ff000 	msr	SPSR_fsxc, r0
    8098:	e12ef301 	msr	ELR_hyp, r1
    809c:	e160006e 	eret

000080a0 <.NoSwitch>:
    80a0:	e121f000 	msr	CPSR_c, r0

000080a4 <.SwitchReturn>:
    80a4:	ee100fb0 	mrc	15, 0, r0, cr0, cr0, {5}
    80a8:	e2000003 	and	r0, r0, #3
    80ac:	e59f1014 	ldr	r1, [pc, #20]	; 80c8 <.SwitchReturn+0x24>
    80b0:	e59f2014 	ldr	r2, [pc, #20]	; 80cc <.SwitchReturn+0x28>
    80b4:	e0511002 	subs	r1, r1, r2
    80b8:	e0020091 	mul	r2, r1, r0
    80bc:	e59f3018 	ldr	r3, [pc, #24]	; 80dc <.SwitchReturn+0x38>
    80c0:	e043d002 	sub	sp, r3, r2
    80c4:	e12fff1a 	bx	sl
    80c8:	0004d280 	.word	0x0004d280
    80cc:	0003d280 	.word	0x0003d280
    80d0:	0003e280 	.word	0x0003e280
    80d4:	0000d1c0 	.word	0x0000d1c0
    80d8:	0000d242 	.word	0x0000d242
    80dc:	0004d280 	.word	0x0004d280

000080e0 <_ZN6kernel3run17h18763ef58d0badb9E>:
    80e0:	e24dd030 	sub	sp, sp, #48	; 0x30
    80e4:	e3500003 	cmp	r0, #3
    80e8:	8a00004c 	bhi	8220 <_ZN6kernel3run17h18763ef58d0badb9E+0x140>
    80ec:	e28f1004 	add	r1, pc, #4
    80f0:	e7910100 	ldr	r0, [r1, r0, lsl #2]
    80f4:	e081f000 	add	pc, r1, r0
    80f8:	00000010 	.word	0x00000010
    80fc:	00000070 	.word	0x00000070
    8100:	00000030 	.word	0x00000030
    8104:	00000050 	.word	0x00000050
    8108:	e59f4164 	ldr	r4, [pc, #356]	; 8274 <_ZN6kernel3run17h18763ef58d0badb9E+0x194>
    810c:	e79f4004 	ldr	r4, [pc, r4]
    8110:	e1a00004 	mov	r0, r4
    8114:	eb0002af 	bl	8bd8 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17hce8fb6a236942e9dE>
    8118:	e2841010 	add	r1, r4, #16
    811c:	e1a0400d 	mov	r4, sp
    8120:	e3a02011 	mov	r2, #17
    8124:	ea000016 	b	8184 <_ZN6kernel3run17h18763ef58d0badb9E+0xa4>
    8128:	e59f4154 	ldr	r4, [pc, #340]	; 8284 <_ZN6kernel3run17h18763ef58d0badb9E+0x1a4>
    812c:	e79f4004 	ldr	r4, [pc, r4]
    8130:	e1a00004 	mov	r0, r4
    8134:	eb0002a7 	bl	8bd8 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17hce8fb6a236942e9dE>
    8138:	e2841010 	add	r1, r4, #16
    813c:	e1a0400d 	mov	r4, sp
    8140:	e3a02014 	mov	r2, #20
    8144:	ea00000e 	b	8184 <_ZN6kernel3run17h18763ef58d0badb9E+0xa4>
    8148:	e59f4138 	ldr	r4, [pc, #312]	; 8288 <_ZN6kernel3run17h18763ef58d0badb9E+0x1a8>
    814c:	e79f4004 	ldr	r4, [pc, r4]
    8150:	e1a00004 	mov	r0, r4
    8154:	eb00029f 	bl	8bd8 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17hce8fb6a236942e9dE>
    8158:	e2841010 	add	r1, r4, #16
    815c:	e1a0400d 	mov	r4, sp
    8160:	e3a02015 	mov	r2, #21
    8164:	ea000006 	b	8184 <_ZN6kernel3run17h18763ef58d0badb9E+0xa4>
    8168:	e59f4110 	ldr	r4, [pc, #272]	; 8280 <_ZN6kernel3run17h18763ef58d0badb9E+0x1a0>
    816c:	e79f4004 	ldr	r4, [pc, r4]
    8170:	e1a00004 	mov	r0, r4
    8174:	eb000297 	bl	8bd8 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17hce8fb6a236942e9dE>
    8178:	e2841010 	add	r1, r4, #16
    817c:	e1a0400d 	mov	r4, sp
    8180:	e3a02012 	mov	r2, #18
    8184:	e1a00004 	mov	r0, r4
    8188:	eb000203 	bl	899c <_ZN12ruspiro_gpio4Gpio7get_pin17h5822a34fe15ccf10E>
    818c:	e59d0000 	ldr	r0, [sp]
    8190:	e3500001 	cmp	r0, #1
    8194:	0a000028 	beq	823c <_ZN6kernel3run17h18763ef58d0badb9E+0x15c>
    8198:	e2847008 	add	r7, r4, #8
    819c:	e3a03001 	mov	r3, #1
    81a0:	e89700e7 	ldm	r7, {r0, r1, r2, r5, r6, r7}
    81a4:	e202201f 	and	r2, r2, #31
    81a8:	e0012213 	and	r2, r1, r3, lsl r2
    81ac:	e5903000 	ldr	r3, [r0]
    81b0:	e1c31001 	bic	r1, r3, r1
    81b4:	e1811002 	orr	r1, r1, r2
    81b8:	e5801000 	str	r1, [r0]
    81bc:	e59f00c8 	ldr	r0, [pc, #200]	; 828c <_ZN6kernel3run17h18763ef58d0badb9E+0x1ac>
    81c0:	e79f0000 	ldr	r0, [pc, r0]
    81c4:	eb000295 	bl	8c20 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hb62ee2386e0825ecE>
    81c8:	e59f40c0 	ldr	r4, [pc, #192]	; 8290 <_ZN6kernel3run17h18763ef58d0badb9E+0x1b0>
    81cc:	e08f4004 	add	r4, pc, r4
    81d0:	e1a00004 	mov	r0, r4
    81d4:	eb00027f 	bl	8bd8 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17hce8fb6a236942e9dE>
    81d8:	e59f10b4 	ldr	r1, [pc, #180]	; 8294 <_ZN6kernel3run17h18763ef58d0badb9E+0x1b4>
    81dc:	e2840010 	add	r0, r4, #16
    81e0:	e3a02047 	mov	r2, #71	; 0x47
    81e4:	e08f1001 	add	r1, pc, r1
    81e8:	eb0000f6 	bl	85c8 <_ZN12ruspiro_uart5uart15Uart111send_string17hd05aec3f34af6fb2E>
    81ec:	e1a00004 	mov	r0, r4
    81f0:	eb00028a 	bl	8c20 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hb62ee2386e0825ecE>
    81f4:	e30943e0 	movw	r4, #37856	; 0x93e0
    81f8:	e3404004 	movt	r4, #4
    81fc:	e1a00004 	mov	r0, r4
    8200:	e3a01000 	mov	r1, #0
    8204:	eb0001a6 	bl	88a4 <_ZN13ruspiro_timer5sleep17hfb10886a7dfec4a1E>
    8208:	e1a00004 	mov	r0, r4
    820c:	e3a01000 	mov	r1, #0
    8210:	e5857000 	str	r7, [r5]
    8214:	eb0001a2 	bl	88a4 <_ZN13ruspiro_timer5sleep17hfb10886a7dfec4a1E>
    8218:	e5867000 	str	r7, [r6]
    821c:	eafffff6 	b	81fc <_ZN6kernel3run17h18763ef58d0badb9E+0x11c>
    8220:	e59f0044 	ldr	r0, [pc, #68]	; 826c <_ZN6kernel3run17h18763ef58d0badb9E+0x18c>
    8224:	e59f2044 	ldr	r2, [pc, #68]	; 8270 <_ZN6kernel3run17h18763ef58d0badb9E+0x190>
    8228:	e3a01013 	mov	r1, #19
    822c:	e08f0000 	add	r0, pc, r0
    8230:	e08f2002 	add	r2, pc, r2
    8234:	eb000b48 	bl	af5c <_ZN4core9panicking5panic17h7b567084461090e7E>
    8238:	e7ffdefe 	udf	#65006	; 0xfdee
    823c:	e59d1008 	ldr	r1, [sp, #8]
    8240:	e59d0004 	ldr	r0, [sp, #4]
    8244:	e28d2028 	add	r2, sp, #40	; 0x28
    8248:	e58d102c 	str	r1, [sp, #44]	; 0x2c
    824c:	e58d0028 	str	r0, [sp, #40]	; 0x28
    8250:	e3a0102b 	mov	r1, #43	; 0x2b
    8254:	e59f001c 	ldr	r0, [pc, #28]	; 8278 <_ZN6kernel3run17h18763ef58d0badb9E+0x198>
    8258:	e59f301c 	ldr	r3, [pc, #28]	; 827c <_ZN6kernel3run17h18763ef58d0badb9E+0x19c>
    825c:	e08f0000 	add	r0, pc, r0
    8260:	e08f3003 	add	r3, pc, r3
    8264:	eb0004cf 	bl	95a8 <_ZN4core6result13unwrap_failed17hd62dcb28c358f436E>
    8268:	e7ffdefe 	udf	#65006	; 0xfdee
    826c:	000030bc 	.word	0x000030bc
    8270:	000046b8 	.word	0x000046b8
    8274:	00005094 	.word	0x00005094
    8278:	000030ac 	.word	0x000030ac
    827c:	00004698 	.word	0x00004698
    8280:	00005034 	.word	0x00005034
    8284:	00005074 	.word	0x00005074
    8288:	00005054 	.word	0x00005054
    828c:	00004fe0 	.word	0x00004fe0
    8290:	00004fec 	.word	0x00004fec
    8294:	00003196 	.word	0x00003196

00008298 <__kernel_startup>:
    8298:	e92d4010 	push	{r4, lr}
    829c:	e1a04000 	mov	r4, r0
    82a0:	e3a00015 	mov	r0, #21
    82a4:	eb000235 	bl	8b80 <lit_debug_led>
    82a8:	e3540000 	cmp	r4, #0
    82ac:	e59f4054 	ldr	r4, [pc, #84]	; 8308 <__kernel_startup+0x70>
    82b0:	e08f4004 	add	r4, pc, r4
    82b4:	1a000009 	bne	82e0 <__kernel_startup+0x48>
    82b8:	e1a00004 	mov	r0, r4
    82bc:	eb000245 	bl	8bd8 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17hce8fb6a236942e9dE>
    82c0:	e30b1280 	movw	r1, #45696	; 0xb280
    82c4:	e30c2200 	movw	r2, #49664	; 0xc200
    82c8:	e2840010 	add	r0, r4, #16
    82cc:	e3401ee6 	movt	r1, #3814	; 0xee6
    82d0:	e3402001 	movt	r2, #1
    82d4:	eb000079 	bl	84c0 <_ZN12ruspiro_uart5uart15Uart110initialize17h32da5d7cd7b619f0E>
    82d8:	e1a00004 	mov	r0, r4
    82dc:	eb00024f 	bl	8c20 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hb62ee2386e0825ecE>
    82e0:	e1a00004 	mov	r0, r4
    82e4:	eb00023b 	bl	8bd8 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17hce8fb6a236942e9dE>
    82e8:	e59f101c 	ldr	r1, [pc, #28]	; 830c <__kernel_startup+0x74>
    82ec:	e2840010 	add	r0, r4, #16
    82f0:	e3a02047 	mov	r2, #71	; 0x47
    82f4:	e08f1001 	add	r1, pc, r1
    82f8:	eb0000b2 	bl	85c8 <_ZN12ruspiro_uart5uart15Uart111send_string17hd05aec3f34af6fb2E>
    82fc:	e1a00004 	mov	r0, r4
    8300:	e8bd4010 	pop	{r4, lr}
    8304:	ea000245 	b	8c20 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hb62ee2386e0825ecE>
    8308:	00004f08 	.word	0x00004f08
    830c:	0000303f 	.word	0x0000303f

00008310 <__kernel_run>:
    8310:	ebffff72 	bl	80e0 <_ZN6kernel3run17h18763ef58d0badb9E>
    8314:	e7ffdefe 	udf	#65006	; 0xfdee

00008318 <_ZN4core3ptr18real_drop_in_place17h8b94660d4d22d7a6E>:
    8318:	e12fff1e 	bx	lr

0000831c <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h64e8461fac21201eE>:
    831c:	e5903000 	ldr	r3, [r0]
    8320:	e1a02001 	mov	r2, r1
    8324:	e5901004 	ldr	r1, [r0, #4]
    8328:	e1a00003 	mov	r0, r3
    832c:	ea000898 	b	a594 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE>

00008330 <__hang>:
    8330:	e320f002 	wfe
    8334:	eafffffd 	b	8330 <__hang>

00008338 <__rust_entry>:
    8338:	e24dd008 	sub	sp, sp, #8
    833c:	e1a04000 	mov	r4, r0
    8340:	ebffff4a 	bl	8070 <__switch_hyp_to_svc>
    8344:	ee110f30 	mrc	15, 0, r0, cr1, cr0, {1}
    8348:	e3540000 	cmp	r4, #0
    834c:	e3800003 	orr	r0, r0, #3
    8350:	ee010f30 	mcr	15, 0, r0, cr1, cr0, {1}
    8354:	e3a00000 	mov	r0, #0
    8358:	ee020f50 	mcr	15, 0, r0, cr2, cr0, {2}
    835c:	f57ff06f 	isb	sy
    8360:	1a000040 	bne	8468 <__rust_entry+0x130>
    8364:	e3011c0e 	movw	r1, #7182	; 0x1c0e
    8368:	e3a00901 	mov	r0, #16384	; 0x4000
    836c:	e3042fc0 	movw	r2, #20416	; 0x4fc0
    8370:	e3401009 	movt	r1, #9
    8374:	e4801004 	str	r1, [r0], #4
    8378:	e2811601 	add	r1, r1, #1048576	; 0x100000
    837c:	e1500002 	cmp	r0, r2
    8380:	1afffffb 	bne	8374 <__rust_entry+0x3c>
    8384:	e3001c16 	movw	r1, #3094	; 0xc16
    8388:	e3040fc0 	movw	r0, #20416	; 0x4fc0
    838c:	e3002c0f 	movw	r2, #3087	; 0xc0f
    8390:	e3431f09 	movt	r1, #16137	; 0x3f09
    8394:	e4801004 	str	r1, [r0], #4
    8398:	e2522001 	subs	r2, r2, #1
    839c:	e2811601 	add	r1, r1, #1048576	; 0x100000
    83a0:	1afffffb 	bne	8394 <__rust_entry+0x5c>
    83a4:	e3030f85 	movw	r0, #16261	; 0x3f85
    83a8:	ee121f10 	mrc	15, 0, r1, cr2, cr0, {0}
    83ac:	e3e02002 	mvn	r2, #2
    83b0:	e3013005 	movw	r3, #4101	; 0x1005
    83b4:	e0010000 	and	r0, r1, r0
    83b8:	e304106a 	movw	r1, #16490	; 0x406a
    83bc:	e1800001 	orr	r0, r0, r1
    83c0:	ee020f10 	mcr	15, 0, r0, cr2, cr0, {0}
    83c4:	ee130f10 	mrc	15, 0, r0, cr3, cr0, {0}
    83c8:	e3800003 	orr	r0, r0, #3
    83cc:	ee030f10 	mcr	15, 0, r0, cr3, cr0, {0}
    83d0:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
    83d4:	e0000002 	and	r0, r0, r2
    83d8:	e1800003 	orr	r0, r0, r3
    83dc:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
    83e0:	f57ff04f 	dsb	sy
    83e4:	f57ff06f 	isb	sy
    83e8:	eb000032 	bl	84b8 <_ZN12ruspiro_uart5uart15Uart13new17he093b80783619d0cE>
    83ec:	e30b1280 	movw	r1, #45696	; 0xb280
    83f0:	e30c2200 	movw	r2, #49664	; 0xc200
    83f4:	e28d5007 	add	r5, sp, #7
    83f8:	e5cd0007 	strb	r0, [sp, #7]
    83fc:	e3401ee6 	movt	r1, #3814	; 0xee6
    8400:	e3402001 	movt	r2, #1
    8404:	e1a00005 	mov	r0, r5
    8408:	eb00002c 	bl	84c0 <_ZN12ruspiro_uart5uart15Uart110initialize17h32da5d7cd7b619f0E>
    840c:	e59f109c 	ldr	r1, [pc, #156]	; 84b0 <__rust_entry+0x178>
    8410:	e1a00005 	mov	r0, r5
    8414:	e3a02047 	mov	r2, #71	; 0x47
    8418:	e08f1001 	add	r1, pc, r1
    841c:	eb000069 	bl	85c8 <_ZN12ruspiro_uart5uart15Uart111send_string17hd05aec3f34af6fb2E>
    8420:	e3020710 	movw	r0, #10000	; 0x2710
    8424:	e3a01000 	mov	r1, #0
    8428:	eb00011d 	bl	88a4 <_ZN13ruspiro_timer5sleep17hfb10886a7dfec4a1E>
    842c:	e59f6080 	ldr	r6, [pc, #128]	; 84b4 <__rust_entry+0x17c>
    8430:	e79f6006 	ldr	r6, [pc, r6]
    8434:	e1a00006 	mov	r0, r6
    8438:	eb0001e6 	bl	8bd8 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17hce8fb6a236942e9dE>
    843c:	e2860010 	add	r0, r6, #16
    8440:	eb000130 	bl	8908 <_ZN17ruspiro_interrupt16InterruptManager10initialize17h43d1ca3ce7b66f74E>
    8444:	e1a00006 	mov	r0, r6
    8448:	eb0001f4 	bl	8c20 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hb62ee2386e0825ecE>
    844c:	e1a00005 	mov	r0, r5
    8450:	eb00007d 	bl	864c <_ZN68_$LT$ruspiro_uart..uart1..Uart1$u20$as$u20$core..ops..drop..Drop$GT$4drop17h5f3ae34ebbc540edE>
    8454:	e1a00004 	mov	r0, r4
    8458:	ebffff8e 	bl	8298 <__kernel_startup>
    845c:	e1a00004 	mov	r0, r4
    8460:	ebffffaa 	bl	8310 <__kernel_run>
    8464:	e7ffdefe 	udf	#65006	; 0xfdee
    8468:	e3030f85 	movw	r0, #16261	; 0x3f85
    846c:	ee121f10 	mrc	15, 0, r1, cr2, cr0, {0}
    8470:	e3e02002 	mvn	r2, #2
    8474:	e3013005 	movw	r3, #4101	; 0x1005
    8478:	e0010000 	and	r0, r1, r0
    847c:	e304106a 	movw	r1, #16490	; 0x406a
    8480:	e1800001 	orr	r0, r0, r1
    8484:	ee020f10 	mcr	15, 0, r0, cr2, cr0, {0}
    8488:	ee130f10 	mrc	15, 0, r0, cr3, cr0, {0}
    848c:	e3800003 	orr	r0, r0, #3
    8490:	ee030f10 	mcr	15, 0, r0, cr3, cr0, {0}
    8494:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
    8498:	e0000002 	and	r0, r0, r2
    849c:	e1800003 	orr	r0, r0, r3
    84a0:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
    84a4:	f57ff04f 	dsb	sy
    84a8:	f57ff06f 	isb	sy
    84ac:	eaffffe8 	b	8454 <__rust_entry+0x11c>
    84b0:	00002fa9 	.word	0x00002fa9
    84b4:	00004d6c 	.word	0x00004d6c

000084b8 <_ZN12ruspiro_uart5uart15Uart13new17he093b80783619d0cE>:
    84b8:	e3a00000 	mov	r0, #0
    84bc:	e12fff1e 	bx	lr

000084c0 <_ZN12ruspiro_uart5uart15Uart110initialize17h32da5d7cd7b619f0E>:
    84c0:	e92d4070 	push	{r4, r5, r6, lr}
    84c4:	e24dd028 	sub	sp, sp, #40	; 0x28
    84c8:	e1a05001 	mov	r5, r1
    84cc:	e59f10cc 	ldr	r1, [pc, #204]	; 85a0 <_ZN12ruspiro_uart5uart15Uart110initialize17h32da5d7cd7b619f0E+0xe0>
    84d0:	e1a04000 	mov	r4, r0
    84d4:	e1a0000d 	mov	r0, sp
    84d8:	e1a06002 	mov	r6, r2
    84dc:	e79f1001 	ldr	r1, [pc, r1]
    84e0:	eb000069 	bl	868c <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf84d0e1ce1edbb7aE>
    84e4:	e59d0000 	ldr	r0, [sp]
    84e8:	e3500001 	cmp	r0, #1
    84ec:	099d0003 	ldmibeq	sp, {r0, r1}
    84f0:	028dd028 	addeq	sp, sp, #40	; 0x28
    84f4:	08bd8070 	popeq	{r4, r5, r6, pc}
    84f8:	e59f00a4 	ldr	r0, [pc, #164]	; 85a4 <_ZN12ruspiro_uart5uart15Uart110initialize17h32da5d7cd7b619f0E+0xe4>
    84fc:	e3a0c001 	mov	ip, #1
    8500:	e3a03003 	mov	r3, #3
    8504:	e79f0000 	ldr	r0, [pc, r0]
    8508:	e580c000 	str	ip, [r0]
    850c:	e3a00000 	mov	r0, #0
    8510:	e59f1090 	ldr	r1, [pc, #144]	; 85a8 <_ZN12ruspiro_uart5uart15Uart110initialize17h32da5d7cd7b619f0E+0xe8>
    8514:	e1500186 	cmp	r0, r6, lsl #3
    8518:	e79f1001 	ldr	r1, [pc, r1]
    851c:	e5810000 	str	r0, [r1]
    8520:	e59fe084 	ldr	lr, [pc, #132]	; 85ac <_ZN12ruspiro_uart5uart15Uart110initialize17h32da5d7cd7b619f0E+0xec>
    8524:	e79fe00e 	ldr	lr, [pc, lr]
    8528:	e58e0000 	str	r0, [lr]
    852c:	e59f207c 	ldr	r2, [pc, #124]	; 85b0 <_ZN12ruspiro_uart5uart15Uart110initialize17h32da5d7cd7b619f0E+0xf0>
    8530:	e79f2002 	ldr	r2, [pc, r2]
    8534:	e5823000 	str	r3, [r2]
    8538:	e59f2074 	ldr	r2, [pc, #116]	; 85b4 <_ZN12ruspiro_uart5uart15Uart110initialize17h32da5d7cd7b619f0E+0xf4>
    853c:	e79f2002 	ldr	r2, [pc, r2]
    8540:	e5820000 	str	r0, [r2]
    8544:	e5810000 	str	r0, [r1]
    8548:	e3a020c6 	mov	r2, #198	; 0xc6
    854c:	e59f1064 	ldr	r1, [pc, #100]	; 85b8 <_ZN12ruspiro_uart5uart15Uart110initialize17h32da5d7cd7b619f0E+0xf8>
    8550:	e79f1001 	ldr	r1, [pc, r1]
    8554:	e5812000 	str	r2, [r1]
    8558:	11a01186 	lslne	r1, r6, #3
    855c:	159f2060 	ldrne	r2, [pc, #96]	; 85c4 <_ZN12ruspiro_uart5uart15Uart110initialize17h32da5d7cd7b619f0E+0x104>
    8560:	1731f115 	udivne	r1, r5, r1
    8564:	12411001 	subne	r1, r1, #1
    8568:	179f2002 	ldrne	r2, [pc, r2]
    856c:	15821000 	strne	r1, [r2]
    8570:	158e3000 	strne	r3, [lr]
    8574:	15c4c000 	strbne	ip, [r4]
    8578:	13a01000 	movne	r1, #0
    857c:	128dd028 	addne	sp, sp, #40	; 0x28
    8580:	18bd8070 	popne	{r4, r5, r6, pc}
    8584:	e59f0030 	ldr	r0, [pc, #48]	; 85bc <_ZN12ruspiro_uart5uart15Uart110initialize17h32da5d7cd7b619f0E+0xfc>
    8588:	e59f2030 	ldr	r2, [pc, #48]	; 85c0 <_ZN12ruspiro_uart5uart15Uart110initialize17h32da5d7cd7b619f0E+0x100>
    858c:	e3a01019 	mov	r1, #25
    8590:	e08f0000 	add	r0, pc, r0
    8594:	e08f2002 	add	r2, pc, r2
    8598:	eb000a6f 	bl	af5c <_ZN4core9panicking5panic17h7b567084461090e7E>
    859c:	e7ffdefe 	udf	#65006	; 0xfdee
    85a0:	00004cc4 	.word	0x00004cc4
    85a4:	00002f04 	.word	0x00002f04
    85a8:	00002ef4 	.word	0x00002ef4
    85ac:	00002eec 	.word	0x00002eec
    85b0:	00002ee4 	.word	0x00002ee4
    85b4:	00002edc 	.word	0x00002edc
    85b8:	00002ecc 	.word	0x00002ecc
    85bc:	00002ee8 	.word	0x00002ee8
    85c0:	00004374 	.word	0x00004374
    85c4:	00002eb8 	.word	0x00002eb8

000085c8 <_ZN12ruspiro_uart5uart15Uart111send_string17hd05aec3f34af6fb2E>:
    85c8:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    85cc:	e5d00000 	ldrb	r0, [r0]
    85d0:	e3500000 	cmp	r0, #0
    85d4:	13520000 	cmpne	r2, #0
    85d8:	1a000000 	bne	85e0 <_ZN12ruspiro_uart5uart15Uart111send_string17hd05aec3f34af6fb2E+0x18>
    85dc:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    85e0:	e59f805c 	ldr	r8, [pc, #92]	; 8644 <_ZN12ruspiro_uart5uart15Uart111send_string17hd05aec3f34af6fb2E+0x7c>
    85e4:	e1a04001 	mov	r4, r1
    85e8:	e0815002 	add	r5, r1, r2
    85ec:	e79f8008 	ldr	r8, [pc, r8]
    85f0:	e59f7050 	ldr	r7, [pc, #80]	; 8648 <_ZN12ruspiro_uart5uart15Uart111send_string17hd05aec3f34af6fb2E+0x80>
    85f4:	e79f7007 	ldr	r7, [pc, r7]
    85f8:	e2846001 	add	r6, r4, #1
    85fc:	e5970000 	ldr	r0, [r7]
    8600:	e3100020 	tst	r0, #32
    8604:	0a000008 	beq	862c <_ZN12ruspiro_uart5uart15Uart111send_string17hd05aec3f34af6fb2E+0x64>
    8608:	e5d40000 	ldrb	r0, [r4]
    860c:	e1560005 	cmp	r6, r5
    8610:	e1a04006 	mov	r4, r6
    8614:	e5880000 	str	r0, [r8]
    8618:	08bd81f0 	popeq	{r4, r5, r6, r7, r8, pc}
    861c:	e2846001 	add	r6, r4, #1
    8620:	e5970000 	ldr	r0, [r7]
    8624:	e3100020 	tst	r0, #32
    8628:	1afffff6 	bne	8608 <_ZN12ruspiro_uart5uart15Uart111send_string17hd05aec3f34af6fb2E+0x40>
    862c:	e3a0000a 	mov	r0, #10
    8630:	eb0000ae 	bl	88f0 <_ZN13ruspiro_timer11sleepcycles17h7b15340b223ad5daE>
    8634:	e5970000 	ldr	r0, [r7]
    8638:	e3100020 	tst	r0, #32
    863c:	0afffffa 	beq	862c <_ZN12ruspiro_uart5uart15Uart111send_string17hd05aec3f34af6fb2E+0x64>
    8640:	eafffff0 	b	8608 <_ZN12ruspiro_uart5uart15Uart111send_string17hd05aec3f34af6fb2E+0x40>
    8644:	00002e3c 	.word	0x00002e3c
    8648:	00002e30 	.word	0x00002e30

0000864c <_ZN68_$LT$ruspiro_uart..uart1..Uart1$u20$as$u20$core..ops..drop..Drop$GT$4drop17h5f3ae34ebbc540edE>:
    864c:	e92d4830 	push	{r4, r5, fp, lr}
    8650:	e59f4030 	ldr	r4, [pc, #48]	; 8688 <_ZN68_$LT$ruspiro_uart..uart1..Uart1$u20$as$u20$core..ops..drop..Drop$GT$4drop17h5f3ae34ebbc540edE+0x3c>
    8654:	e79f4004 	ldr	r4, [pc, r4]
    8658:	e1a00004 	mov	r0, r4
    865c:	eb00015d 	bl	8bd8 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17hce8fb6a236942e9dE>
    8660:	e2845010 	add	r5, r4, #16
    8664:	e3a0100e 	mov	r1, #14
    8668:	e1a00005 	mov	r0, r5
    866c:	eb000136 	bl	8b4c <_ZN12ruspiro_gpio4Gpio8free_pin17hadd4f029859cff95E>
    8670:	e1a00005 	mov	r0, r5
    8674:	e3a0100f 	mov	r1, #15
    8678:	eb000133 	bl	8b4c <_ZN12ruspiro_gpio4Gpio8free_pin17hadd4f029859cff95E>
    867c:	e1a00004 	mov	r0, r4
    8680:	e8bd4830 	pop	{r4, r5, fp, lr}
    8684:	ea000165 	b	8c20 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hb62ee2386e0825ecE>
    8688:	00004b4c 	.word	0x00004b4c

0000868c <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf84d0e1ce1edbb7aE>:
    868c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8690:	e24dd054 	sub	sp, sp, #84	; 0x54
    8694:	e1a04000 	mov	r4, r0
    8698:	e1a00001 	mov	r0, r1
    869c:	e1a09001 	mov	r9, r1
    86a0:	eb00014c 	bl	8bd8 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17hce8fb6a236942e9dE>
    86a4:	e2896010 	add	r6, r9, #16
    86a8:	e28d0010 	add	r0, sp, #16
    86ac:	e3a0200e 	mov	r2, #14
    86b0:	e1a01006 	mov	r1, r6
    86b4:	eb0000b8 	bl	899c <_ZN12ruspiro_gpio4Gpio7get_pin17h5822a34fe15ccf10E>
    86b8:	e59d0010 	ldr	r0, [sp, #16]
    86bc:	e59d5014 	ldr	r5, [sp, #20]
    86c0:	e59d1018 	ldr	r1, [sp, #24]
    86c4:	e3500001 	cmp	r0, #1
    86c8:	e58d500c 	str	r5, [sp, #12]
    86cc:	e58d1008 	str	r1, [sp, #8]
    86d0:	1a000001 	bne	86dc <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf84d0e1ce1edbb7aE+0x50>
    86d4:	e3a05001 	mov	r5, #1
    86d8:	ea00001b 	b	874c <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf84d0e1ce1edbb7aE+0xc0>
    86dc:	e59d3020 	ldr	r3, [sp, #32]
    86e0:	e59d201c 	ldr	r2, [sp, #28]
    86e4:	e3a07002 	mov	r7, #2
    86e8:	e59dc030 	ldr	ip, [sp, #48]	; 0x30
    86ec:	e59d0034 	ldr	r0, [sp, #52]	; 0x34
    86f0:	e203301f 	and	r3, r3, #31
    86f4:	e0023317 	and	r3, r2, r7, lsl r3
    86f8:	e5917000 	ldr	r7, [r1]
    86fc:	e1c72002 	bic	r2, r7, r2
    8700:	e1822003 	orr	r2, r2, r3
    8704:	e5812000 	str	r2, [r1]
    8708:	e59f218c 	ldr	r2, [pc, #396]	; 889c <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf84d0e1ce1edbb7aE+0x210>
    870c:	e79f2002 	ldr	r2, [pc, r2]
    8710:	e5923000 	ldr	r3, [r2]
    8714:	e3c33003 	bic	r3, r3, #3
    8718:	e5823000 	str	r3, [r2]
    871c:	e3a03096 	mov	r3, #150	; 0x96
    8720:	e2533001 	subs	r3, r3, #1
    8724:	e320f000 	nop	{0}
    8728:	1afffffc 	bne	8720 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf84d0e1ce1edbb7aE+0x94>
    872c:	e3a03096 	mov	r3, #150	; 0x96
    8730:	e58c0000 	str	r0, [ip]
    8734:	e2533001 	subs	r3, r3, #1
    8738:	e320f000 	nop	{0}
    873c:	1afffffc 	bne	8734 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf84d0e1ce1edbb7aE+0xa8>
    8740:	e3a05000 	mov	r5, #0
    8744:	e5825000 	str	r5, [r2]
    8748:	e58c0000 	str	r0, [ip]
    874c:	e28d0010 	add	r0, sp, #16
    8750:	e1a01006 	mov	r1, r6
    8754:	e3a0200f 	mov	r2, #15
    8758:	eb00008f 	bl	899c <_ZN12ruspiro_gpio4Gpio7get_pin17h5822a34fe15ccf10E>
    875c:	e59d0010 	ldr	r0, [sp, #16]
    8760:	e3500001 	cmp	r0, #1
    8764:	1a000003 	bne	8778 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf84d0e1ce1edbb7aE+0xec>
    8768:	e59d0014 	ldr	r0, [sp, #20]
    876c:	e59d1018 	ldr	r1, [sp, #24]
    8770:	e3a02001 	mov	r2, #1
    8774:	ea00002a 	b	8824 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf84d0e1ce1edbb7aE+0x198>
    8778:	e59d002c 	ldr	r0, [sp, #44]	; 0x2c
    877c:	e59d6020 	ldr	r6, [sp, #32]
    8780:	e59d801c 	ldr	r8, [sp, #28]
    8784:	eddd0b09 	vldr	d16, [sp, #36]	; 0x24
    8788:	e3a01002 	mov	r1, #2
    878c:	e59da030 	ldr	sl, [sp, #48]	; 0x30
    8790:	e59d7034 	ldr	r7, [sp, #52]	; 0x34
    8794:	e58d0050 	str	r0, [sp, #80]	; 0x50
    8798:	e206001f 	and	r0, r6, #31
    879c:	edcd0b12 	vstr	d16, [sp, #72]	; 0x48
    87a0:	e0082011 	and	r2, r8, r1, lsl r0
    87a4:	e59d1018 	ldr	r1, [sp, #24]
    87a8:	e59d0014 	ldr	r0, [sp, #20]
    87ac:	e5913000 	ldr	r3, [r1]
    87b0:	e1c33008 	bic	r3, r3, r8
    87b4:	e1832002 	orr	r2, r3, r2
    87b8:	e5812000 	str	r2, [r1]
    87bc:	eddd0b12 	vldr	d16, [sp, #72]	; 0x48
    87c0:	e59d2050 	ldr	r2, [sp, #80]	; 0x50
    87c4:	e58d2040 	str	r2, [sp, #64]	; 0x40
    87c8:	edcd0b0e 	vstr	d16, [sp, #56]	; 0x38
    87cc:	e59f30cc 	ldr	r3, [pc, #204]	; 88a0 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf84d0e1ce1edbb7aE+0x214>
    87d0:	e79f3003 	ldr	r3, [pc, r3]
    87d4:	e5932000 	ldr	r2, [r3]
    87d8:	e3c22003 	bic	r2, r2, #3
    87dc:	e5832000 	str	r2, [r3]
    87e0:	e3a02096 	mov	r2, #150	; 0x96
    87e4:	e2522001 	subs	r2, r2, #1
    87e8:	e320f000 	nop	{0}
    87ec:	1afffffc 	bne	87e4 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf84d0e1ce1edbb7aE+0x158>
    87f0:	e3a02096 	mov	r2, #150	; 0x96
    87f4:	e58d6004 	str	r6, [sp, #4]
    87f8:	e58a7000 	str	r7, [sl]
    87fc:	e2522001 	subs	r2, r2, #1
    8800:	e320f000 	nop	{0}
    8804:	1afffffc 	bne	87fc <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf84d0e1ce1edbb7aE+0x170>
    8808:	e3a02000 	mov	r2, #0
    880c:	e5832000 	str	r2, [r3]
    8810:	e58a7000 	str	r7, [sl]
    8814:	eddd0b0e 	vldr	d16, [sp, #56]	; 0x38
    8818:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
    881c:	e58d3050 	str	r3, [sp, #80]	; 0x50
    8820:	edcd0b12 	vstr	d16, [sp, #72]	; 0x48
    8824:	eddd0b12 	vldr	d16, [sp, #72]	; 0x48
    8828:	e59d3050 	ldr	r3, [sp, #80]	; 0x50
    882c:	e3550000 	cmp	r5, #0
    8830:	e59d500c 	ldr	r5, [sp, #12]
    8834:	e59d6008 	ldr	r6, [sp, #8]
    8838:	e3a0b001 	mov	fp, #1
    883c:	e58d3018 	str	r3, [sp, #24]
    8840:	edcd0b04 	vstr	d16, [sp, #16]
    8844:	1a000006 	bne	8864 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf84d0e1ce1edbb7aE+0x1d8>
    8848:	eddd0b04 	vldr	d16, [sp, #16]
    884c:	e59d3018 	ldr	r3, [sp, #24]
    8850:	e1a0b002 	mov	fp, r2
    8854:	e1a05000 	mov	r5, r0
    8858:	e1a06001 	mov	r6, r1
    885c:	e58d3040 	str	r3, [sp, #64]	; 0x40
    8860:	edcd0b0e 	vstr	d16, [sp, #56]	; 0x38
    8864:	e1a00009 	mov	r0, r9
    8868:	eb0000ec 	bl	8c20 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hb62ee2386e0825ecE>
    886c:	e59d0004 	ldr	r0, [sp, #4]
    8870:	e584b000 	str	fp, [r4]
    8874:	e9840160 	stmib	r4, {r5, r6, r8}
    8878:	eddd0b0e 	vldr	d16, [sp, #56]	; 0x38
    887c:	e5840010 	str	r0, [r4, #16]
    8880:	e59d0040 	ldr	r0, [sp, #64]	; 0x40
    8884:	edc40b05 	vstr	d16, [r4, #20]
    8888:	e584001c 	str	r0, [r4, #28]
    888c:	e584a020 	str	sl, [r4, #32]
    8890:	e5847024 	str	r7, [r4, #36]	; 0x24
    8894:	e28dd054 	add	sp, sp, #84	; 0x54
    8898:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    889c:	00002d88 	.word	0x00002d88
    88a0:	00002cc4 	.word	0x00002cc4

000088a4 <_ZN13ruspiro_timer5sleep17hfb10886a7dfec4a1E>:
    88a4:	e92d4830 	push	{r4, r5, fp, lr}
    88a8:	e59f5038 	ldr	r5, [pc, #56]	; 88e8 <_ZN13ruspiro_timer5sleep17hfb10886a7dfec4a1E+0x44>
    88ac:	e79f5005 	ldr	r5, [pc, r5]
    88b0:	e595c000 	ldr	ip, [r5]
    88b4:	e59f3030 	ldr	r3, [pc, #48]	; 88ec <_ZN13ruspiro_timer5sleep17hfb10886a7dfec4a1E+0x48>
    88b8:	e79f3003 	ldr	r3, [pc, r3]
    88bc:	e09c0000 	adds	r0, ip, r0
    88c0:	e593e000 	ldr	lr, [r3]
    88c4:	e0ae1001 	adc	r1, lr, r1
    88c8:	e1902001 	orrs	r2, r0, r1
    88cc:	08bd8830 	popeq	{r4, r5, fp, pc}
    88d0:	e5952000 	ldr	r2, [r5]
    88d4:	e5934000 	ldr	r4, [r3]
    88d8:	e0522000 	subs	r2, r2, r0
    88dc:	e0d42001 	sbcs	r2, r4, r1
    88e0:	3afffffa 	bcc	88d0 <_ZN13ruspiro_timer5sleep17hfb10886a7dfec4a1E+0x2c>
    88e4:	e8bd8830 	pop	{r4, r5, fp, pc}
    88e8:	00002bec 	.word	0x00002bec
    88ec:	00002be4 	.word	0x00002be4

000088f0 <_ZN13ruspiro_timer11sleepcycles17h7b15340b223ad5daE>:
    88f0:	e3500000 	cmp	r0, #0
    88f4:	012fff1e 	bxeq	lr
    88f8:	e2500001 	subs	r0, r0, #1
    88fc:	e320f000 	nop	{0}
    8900:	1afffffc 	bne	88f8 <_ZN13ruspiro_timer11sleepcycles17h7b15340b223ad5daE+0x8>
    8904:	e12fff1e 	bx	lr

00008908 <_ZN17ruspiro_interrupt16InterruptManager10initialize17h43d1ca3ce7b66f74E>:
    8908:	e59f006c 	ldr	r0, [pc, #108]	; 897c <_ZN17ruspiro_interrupt16InterruptManager10initialize17h43d1ca3ce7b66f74E+0x74>
    890c:	e3e01000 	mvn	r1, #0
    8910:	e79f0000 	ldr	r0, [pc, r0]
    8914:	e5801000 	str	r1, [r0]
    8918:	e59f0060 	ldr	r0, [pc, #96]	; 8980 <_ZN17ruspiro_interrupt16InterruptManager10initialize17h43d1ca3ce7b66f74E+0x78>
    891c:	e79f0000 	ldr	r0, [pc, r0]
    8920:	e5801000 	str	r1, [r0]
    8924:	e59f0058 	ldr	r0, [pc, #88]	; 8984 <_ZN17ruspiro_interrupt16InterruptManager10initialize17h43d1ca3ce7b66f74E+0x7c>
    8928:	e79f0000 	ldr	r0, [pc, r0]
    892c:	e5801000 	str	r1, [r0]
    8930:	f57ff05f 	dmb	sy
    8934:	e59f004c 	ldr	r0, [pc, #76]	; 8988 <_ZN17ruspiro_interrupt16InterruptManager10initialize17h43d1ca3ce7b66f74E+0x80>
    8938:	e3a01000 	mov	r1, #0
    893c:	e79f0000 	ldr	r0, [pc, r0]
    8940:	e5801000 	str	r1, [r0]
    8944:	e3a01008 	mov	r1, #8
    8948:	e59f003c 	ldr	r0, [pc, #60]	; 898c <_ZN17ruspiro_interrupt16InterruptManager10initialize17h43d1ca3ce7b66f74E+0x84>
    894c:	e79f0000 	ldr	r0, [pc, r0]
    8950:	e5801000 	str	r1, [r0]
    8954:	e59f0034 	ldr	r0, [pc, #52]	; 8990 <_ZN17ruspiro_interrupt16InterruptManager10initialize17h43d1ca3ce7b66f74E+0x88>
    8958:	e79f0000 	ldr	r0, [pc, r0]
    895c:	e5801000 	str	r1, [r0]
    8960:	e59f002c 	ldr	r0, [pc, #44]	; 8994 <_ZN17ruspiro_interrupt16InterruptManager10initialize17h43d1ca3ce7b66f74E+0x8c>
    8964:	e79f0000 	ldr	r0, [pc, r0]
    8968:	e5801000 	str	r1, [r0]
    896c:	e59f0024 	ldr	r0, [pc, #36]	; 8998 <_ZN17ruspiro_interrupt16InterruptManager10initialize17h43d1ca3ce7b66f74E+0x90>
    8970:	e79f0000 	ldr	r0, [pc, r0]
    8974:	e5801000 	str	r1, [r0]
    8978:	e12fff1e 	bx	lr
    897c:	00002b90 	.word	0x00002b90
    8980:	00002b88 	.word	0x00002b88
    8984:	00002b80 	.word	0x00002b80
    8988:	00002b70 	.word	0x00002b70
    898c:	00002b64 	.word	0x00002b64
    8990:	00002b5c 	.word	0x00002b5c
    8994:	00002b54 	.word	0x00002b54
    8998:	00002b4c 	.word	0x00002b4c

0000899c <_ZN12ruspiro_gpio4Gpio7get_pin17h5822a34fe15ccf10E>:
    899c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    89a0:	e24dd028 	sub	sp, sp, #40	; 0x28
    89a4:	e3520027 	cmp	r2, #39	; 0x27
    89a8:	8a000048 	bhi	8ad0 <_ZN12ruspiro_gpio4Gpio7get_pin17h5822a34fe15ccf10E+0x134>
    89ac:	e7d13002 	ldrb	r3, [r1, r2]
    89b0:	e3530000 	cmp	r3, #0
    89b4:	0a000008 	beq	89dc <_ZN12ruspiro_gpio4Gpio7get_pin17h5822a34fe15ccf10E+0x40>
    89b8:	e59f2178 	ldr	r2, [pc, #376]	; 8b38 <_ZN12ruspiro_gpio4Gpio7get_pin17h5822a34fe15ccf10E+0x19c>
    89bc:	e3a0101c 	mov	r1, #28
    89c0:	e08f2002 	add	r2, pc, r2
    89c4:	e5802004 	str	r2, [r0, #4]
    89c8:	e5801008 	str	r1, [r0, #8]
    89cc:	e3a01001 	mov	r1, #1
    89d0:	e5801000 	str	r1, [r0]
    89d4:	e28dd028 	add	sp, sp, #40	; 0x28
    89d8:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    89dc:	e30c3ccd 	movw	r3, #52429	; 0xcccd
    89e0:	e3a0c001 	mov	ip, #1
    89e4:	e7c1c002 	strb	ip, [r1, r2]
    89e8:	e6ef1072 	uxtb	r1, r2
    89ec:	e34c3ccc 	movt	r3, #52428	; 0xcccc
    89f0:	e58d2004 	str	r2, [sp, #4]
    89f4:	e0831391 	umull	r1, r3, r1, r3
    89f8:	e1a011a3 	lsr	r1, r3, #3
    89fc:	e3510005 	cmp	r1, #5
    8a00:	8a000038 	bhi	8ae8 <_ZN12ruspiro_gpio4Gpio7get_pin17h5822a34fe15ccf10E+0x14c>
    8a04:	e0813101 	add	r3, r1, r1, lsl #2
    8a08:	e300e000 	movw	lr, #0
    8a0c:	e0423083 	sub	r3, r2, r3, lsl #1
    8a10:	e343ef20 	movt	lr, #16160	; 0x3f20
    8a14:	e0833083 	add	r3, r3, r3, lsl #1
    8a18:	e1a0800e 	mov	r8, lr
    8a1c:	e6efc073 	uxtb	ip, r3
    8a20:	e28f3004 	add	r3, pc, #4
    8a24:	e7934101 	ldr	r4, [r3, r1, lsl #2]
    8a28:	e083f004 	add	pc, r3, r4
    8a2c:	0000003c 	.word	0x0000003c
    8a30:	00000018 	.word	0x00000018
    8a34:	00000028 	.word	0x00000028
    8a38:	00000030 	.word	0x00000030
    8a3c:	00000020 	.word	0x00000020
    8a40:	00000038 	.word	0x00000038
    8a44:	e28e8004 	add	r8, lr, #4
    8a48:	ea000006 	b	8a68 <_ZN12ruspiro_gpio4Gpio7get_pin17h5822a34fe15ccf10E+0xcc>
    8a4c:	e28e8010 	add	r8, lr, #16
    8a50:	ea000004 	b	8a68 <_ZN12ruspiro_gpio4Gpio7get_pin17h5822a34fe15ccf10E+0xcc>
    8a54:	e28e8008 	add	r8, lr, #8
    8a58:	ea000002 	b	8a68 <_ZN12ruspiro_gpio4Gpio7get_pin17h5822a34fe15ccf10E+0xcc>
    8a5c:	e28e800c 	add	r8, lr, #12
    8a60:	ea000000 	b	8a68 <_ZN12ruspiro_gpio4Gpio7get_pin17h5822a34fe15ccf10E+0xcc>
    8a64:	e28e8014 	add	r8, lr, #20
    8a68:	e202301f 	and	r3, r2, #31
    8a6c:	e3a04001 	mov	r4, #1
    8a70:	e3520020 	cmp	r2, #32
    8a74:	e20c101f 	and	r1, ip, #31
    8a78:	e3a07007 	mov	r7, #7
    8a7c:	e28e502c 	add	r5, lr, #44	; 0x2c
    8a80:	e28e6020 	add	r6, lr, #32
    8a84:	e1a03314 	lsl	r3, r4, r3
    8a88:	e28e409c 	add	r4, lr, #156	; 0x9c
    8a8c:	e1a01117 	lsl	r1, r7, r1
    8a90:	328e4098 	addcc	r4, lr, #152	; 0x98
    8a94:	e3520020 	cmp	r2, #32
    8a98:	e5803024 	str	r3, [r0, #36]	; 0x24
    8a9c:	e9800104 	stmib	r0, {r2, r8}
    8aa0:	e580100c 	str	r1, [r0, #12]
    8aa4:	e3a01000 	mov	r1, #0
    8aa8:	e580c010 	str	ip, [r0, #16]
    8aac:	328e601c 	addcc	r6, lr, #28
    8ab0:	328e5028 	addcc	r5, lr, #40	; 0x28
    8ab4:	e5806014 	str	r6, [r0, #20]
    8ab8:	e5805018 	str	r5, [r0, #24]
    8abc:	e580301c 	str	r3, [r0, #28]
    8ac0:	e5804020 	str	r4, [r0, #32]
    8ac4:	e5801000 	str	r1, [r0]
    8ac8:	e28dd028 	add	sp, sp, #40	; 0x28
    8acc:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    8ad0:	e59f0070 	ldr	r0, [pc, #112]	; 8b48 <_ZN12ruspiro_gpio4Gpio7get_pin17h5822a34fe15ccf10E+0x1ac>
    8ad4:	e1a01002 	mov	r1, r2
    8ad8:	e3a02028 	mov	r2, #40	; 0x28
    8adc:	e08f0000 	add	r0, pc, r0
    8ae0:	eb00092f 	bl	afa4 <_ZN4core9panicking18panic_bounds_check17h9369801762b8b5caE>
    8ae4:	e7ffdefe 	udf	#65006	; 0xfdee
    8ae8:	e28d0020 	add	r0, sp, #32
    8aec:	e58dc01c 	str	ip, [sp, #28]
    8af0:	e58d0018 	str	r0, [sp, #24]
    8af4:	e3a00000 	mov	r0, #0
    8af8:	e58d0014 	str	r0, [sp, #20]
    8afc:	e58d0010 	str	r0, [sp, #16]
    8b00:	e58dc00c 	str	ip, [sp, #12]
    8b04:	e59f0030 	ldr	r0, [pc, #48]	; 8b3c <_ZN12ruspiro_gpio4Gpio7get_pin17h5822a34fe15ccf10E+0x1a0>
    8b08:	e08f0000 	add	r0, pc, r0
    8b0c:	e58d0008 	str	r0, [sp, #8]
    8b10:	e28d0004 	add	r0, sp, #4
    8b14:	e58d0020 	str	r0, [sp, #32]
    8b18:	e59f0020 	ldr	r0, [pc, #32]	; 8b40 <_ZN12ruspiro_gpio4Gpio7get_pin17h5822a34fe15ccf10E+0x1a4>
    8b1c:	e79f0000 	ldr	r0, [pc, r0]
    8b20:	e58d0024 	str	r0, [sp, #36]	; 0x24
    8b24:	e28d0008 	add	r0, sp, #8
    8b28:	e59f1014 	ldr	r1, [pc, #20]	; 8b44 <_ZN12ruspiro_gpio4Gpio7get_pin17h5822a34fe15ccf10E+0x1a8>
    8b2c:	e08f1001 	add	r1, pc, r1
    8b30:	eb000936 	bl	b010 <_ZN4core9panicking9panic_fmt17hfb3f65a21a5866cfE>
    8b34:	e7ffdefe 	udf	#65006	; 0xfdee
    8b38:	00002b49 	.word	0x00002b49
    8b3c:	00003e30 	.word	0x00003e30
    8b40:	00004678 	.word	0x00004678
    8b44:	00003e14 	.word	0x00003e14
    8b48:	00003e3c 	.word	0x00003e3c

00008b4c <_ZN12ruspiro_gpio4Gpio8free_pin17hadd4f029859cff95E>:
    8b4c:	e3510027 	cmp	r1, #39	; 0x27
    8b50:	8a000004 	bhi	8b68 <_ZN12ruspiro_gpio4Gpio8free_pin17hadd4f029859cff95E+0x1c>
    8b54:	e7d02001 	ldrb	r2, [r0, r1]
    8b58:	e3520000 	cmp	r2, #0
    8b5c:	13a02000 	movne	r2, #0
    8b60:	17c02001 	strbne	r2, [r0, r1]
    8b64:	e12fff1e 	bx	lr
    8b68:	e59f000c 	ldr	r0, [pc, #12]	; 8b7c <_ZN12ruspiro_gpio4Gpio8free_pin17hadd4f029859cff95E+0x30>
    8b6c:	e3a02028 	mov	r2, #40	; 0x28
    8b70:	e08f0000 	add	r0, pc, r0
    8b74:	eb00090a 	bl	afa4 <_ZN4core9panicking18panic_bounds_check17h9369801762b8b5caE>
    8b78:	e7ffdefe 	udf	#65006	; 0xfdee
    8b7c:	00003db8 	.word	0x00003db8

00008b80 <lit_debug_led>:
    8b80:	e92d4800 	push	{fp, lr}
    8b84:	e30c1ccd 	movw	r1, #52429	; 0xcccd
    8b88:	e3a03007 	mov	r3, #7
    8b8c:	e34c1ccc 	movt	r1, #52428	; 0xcccc
    8b90:	e0821190 	umull	r1, r2, r0, r1
    8b94:	e1a011a2 	lsr	r1, r2, #3
    8b98:	e3002000 	movw	r2, #0
    8b9c:	e3432f20 	movt	r2, #16160	; 0x3f20
    8ba0:	e082c2a0 	add	ip, r2, r0, lsr #5
    8ba4:	e7b2e101 	ldr	lr, [r2, r1, lsl #2]!
    8ba8:	e0811101 	add	r1, r1, r1, lsl #2
    8bac:	e0401081 	sub	r1, r0, r1, lsl #1
    8bb0:	e200001f 	and	r0, r0, #31
    8bb4:	e0811081 	add	r1, r1, r1, lsl #1
    8bb8:	e201101f 	and	r1, r1, #31
    8bbc:	e1ce3113 	bic	r3, lr, r3, lsl r1
    8bc0:	e3a0e001 	mov	lr, #1
    8bc4:	e183111e 	orr	r1, r3, lr, lsl r1
    8bc8:	e1a0001e 	lsl	r0, lr, r0
    8bcc:	e5821000 	str	r1, [r2]
    8bd0:	e58c001c 	str	r0, [ip, #28]
    8bd4:	e8bd8800 	pop	{fp, pc}

00008bd8 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17hce8fb6a236942e9dE>:
    8bd8:	e92d4010 	push	{r4, lr}
    8bdc:	e1a04000 	mov	r4, r0
    8be0:	eb000011 	bl	8c2c <_ZN22ruspiro_interrupt_core18disable_interrupts17he2ce532c6f59ef1aE>
    8be4:	e3a00001 	mov	r0, #1
    8be8:	e1d41e9f 	ldaexb	r1, [r4]
    8bec:	e3510000 	cmp	r1, #0
    8bf0:	0a000003 	beq	8c04 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17hce8fb6a236942e9dE+0x2c>
    8bf4:	f57ff01f 	clrex
    8bf8:	e1d41e9f 	ldaexb	r1, [r4]
    8bfc:	e3510000 	cmp	r1, #0
    8c00:	1afffffb 	bne	8bf4 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17hce8fb6a236942e9dE+0x1c>
    8c04:	e1c41e90 	stlexb	r1, r0, [r4]
    8c08:	e3510000 	cmp	r1, #0
    8c0c:	08bd8010 	popeq	{r4, pc}
    8c10:	e1d41e9f 	ldaexb	r1, [r4]
    8c14:	e3510000 	cmp	r1, #0
    8c18:	0afffff9 	beq	8c04 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17hce8fb6a236942e9dE+0x2c>
    8c1c:	eafffff4 	b	8bf4 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17hce8fb6a236942e9dE+0x1c>

00008c20 <_ZN12ruspiro_lock8spinlock8Spinlock7release17hb62ee2386e0825ecE>:
    8c20:	e3a01000 	mov	r1, #0
    8c24:	e1c0fc91 	stlb	r1, [r0]
    8c28:	ea00000d 	b	8c64 <_ZN22ruspiro_interrupt_core20re_enable_interrupts17h6c80e4694bae43fbE>

00008c2c <_ZN22ruspiro_interrupt_core18disable_interrupts17he2ce532c6f59ef1aE>:
    8c2c:	e10f0000 	mrs	r0, CPSR
    8c30:	f10c0080 	cpsid	i
    8c34:	e59f1024 	ldr	r1, [pc, #36]	; 8c60 <_ZN22ruspiro_interrupt_core18disable_interrupts17he2ce532c6f59ef1aE+0x34>
    8c38:	e6ef0070 	uxtb	r0, r0
    8c3c:	e1a003a0 	lsr	r0, r0, #7
    8c40:	e08f1001 	add	r1, pc, r1
    8c44:	e1c1fc90 	stlb	r0, [r1]
    8c48:	e10f0000 	mrs	r0, CPSR
    8c4c:	f10c0040 	cpsid	f
    8c50:	e2811001 	add	r1, r1, #1
    8c54:	e7e00350 	ubfx	r0, r0, #6, #1
    8c58:	e1c1fc90 	stlb	r0, [r1]
    8c5c:	e12fff1e 	bx	lr
    8c60:	000045f8 	.word	0x000045f8

00008c64 <_ZN22ruspiro_interrupt_core20re_enable_interrupts17h6c80e4694bae43fbE>:
    8c64:	e59f0030 	ldr	r0, [pc, #48]	; 8c9c <_ZN22ruspiro_interrupt_core20re_enable_interrupts17h6c80e4694bae43fbE+0x38>
    8c68:	e08f0000 	add	r0, pc, r0
    8c6c:	e1d01c9f 	ldab	r1, [r0]
    8c70:	e31100ff 	tst	r1, #255	; 0xff
    8c74:	0a000001 	beq	8c80 <_ZN22ruspiro_interrupt_core20re_enable_interrupts17h6c80e4694bae43fbE+0x1c>
    8c78:	f1080080 	cpsie	i
    8c7c:	f57ff06f 	isb	sy
    8c80:	e2800001 	add	r0, r0, #1
    8c84:	e1d00c9f 	ldab	r0, [r0]
    8c88:	e31000ff 	tst	r0, #255	; 0xff
    8c8c:	012fff1e 	bxeq	lr
    8c90:	f1080040 	cpsie	f
    8c94:	f57ff06f 	isb	sy
    8c98:	e12fff1e 	bx	lr
    8c9c:	000045d0 	.word	0x000045d0

00008ca0 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E>:
    8ca0:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8ca4:	e24dd094 	sub	sp, sp, #148	; 0x94
    8ca8:	e1a04000 	mov	r4, r0
    8cac:	e5910000 	ldr	r0, [r1]
    8cb0:	e1a0b001 	mov	fp, r1
    8cb4:	e3100010 	tst	r0, #16
    8cb8:	1a000035 	bne	8d94 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0xf4>
    8cbc:	e5941000 	ldr	r1, [r4]
    8cc0:	e3100020 	tst	r0, #32
    8cc4:	1a00004a 	bne	8df4 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x154>
    8cc8:	e59f04a4 	ldr	r0, [pc, #1188]	; 9174 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x4d4>
    8ccc:	e302e710 	movw	lr, #10000	; 0x2710
    8cd0:	e3a02027 	mov	r2, #39	; 0x27
    8cd4:	e151000e 	cmp	r1, lr
    8cd8:	e79f0000 	ldr	r0, [pc, r0]
    8cdc:	3a000062 	bcc	8e6c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x1cc>
    8ce0:	e30ec0ff 	movw	ip, #57599	; 0xe0ff
    8ce4:	e301a759 	movw	sl, #5977	; 0x1759
    8ce8:	e58db00c 	str	fp, [sp, #12]
    8cec:	e308b51f 	movw	fp, #34079	; 0x851f
    8cf0:	e28d7010 	add	r7, sp, #16
    8cf4:	e3a02000 	mov	r2, #0
    8cf8:	e340c5f5 	movt	ip, #1525	; 0x5f5
    8cfc:	e34da1b7 	movt	sl, #53687	; 0xd1b7
    8d00:	e345b1eb 	movt	fp, #20971	; 0x51eb
    8d04:	e3a09064 	mov	r9, #100	; 0x64
    8d08:	e58d4008 	str	r4, [sp, #8]
    8d0c:	e0853a91 	umull	r3, r5, r1, sl
    8d10:	e0876002 	add	r6, r7, r2
    8d14:	e2422004 	sub	r2, r2, #4
    8d18:	e151000c 	cmp	r1, ip
    8d1c:	e1a036a5 	lsr	r3, r5, #13
    8d20:	e0651e93 	mls	r5, r3, lr, r1
    8d24:	e1a01003 	mov	r1, r3
    8d28:	e6ff4075 	uxth	r4, r5
    8d2c:	e0884b94 	umull	r4, r8, r4, fp
    8d30:	e1a042a8 	lsr	r4, r8, #5
    8d34:	e0655994 	mls	r5, r4, r9, r5
    8d38:	e0804084 	add	r4, r0, r4, lsl #1
    8d3c:	e1d440b0 	ldrh	r4, [r4]
    8d40:	e1c642b3 	strh	r4, [r6, #35]	; 0x23
    8d44:	e6ff4075 	uxth	r4, r5
    8d48:	e0804084 	add	r4, r0, r4, lsl #1
    8d4c:	e1d440b0 	ldrh	r4, [r4]
    8d50:	e1c642b5 	strh	r4, [r6, #37]	; 0x25
    8d54:	8affffec 	bhi	8d0c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x6c>
    8d58:	e59db00c 	ldr	fp, [sp, #12]
    8d5c:	e2822027 	add	r2, r2, #39	; 0x27
    8d60:	e59d4008 	ldr	r4, [sp, #8]
    8d64:	e3530063 	cmp	r3, #99	; 0x63
    8d68:	ca000042 	bgt	8e78 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x1d8>
    8d6c:	e1a01003 	mov	r1, r3
    8d70:	e351000a 	cmp	r1, #10
    8d74:	ba00004f 	blt	8eb8 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x218>
    8d78:	e0801081 	add	r1, r0, r1, lsl #1
    8d7c:	e2420002 	sub	r0, r2, #2
    8d80:	e28d2010 	add	r2, sp, #16
    8d84:	e0822000 	add	r2, r2, r0
    8d88:	e1d110b0 	ldrh	r1, [r1]
    8d8c:	e1c210b0 	strh	r1, [r2]
    8d90:	ea00004c 	b	8ec8 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x228>
    8d94:	e5942000 	ldr	r2, [r4]
    8d98:	e28d3010 	add	r3, sp, #16
    8d9c:	e3a00000 	mov	r0, #0
    8da0:	e3a01000 	mov	r1, #0
    8da4:	e202700f 	and	r7, r2, #15
    8da8:	e2876057 	add	r6, r7, #87	; 0x57
    8dac:	e357000a 	cmp	r7, #10
    8db0:	33876030 	orrcc	r6, r7, #48	; 0x30
    8db4:	e0437001 	sub	r7, r3, r1
    8db8:	e2811001 	add	r1, r1, #1
    8dbc:	e1500222 	cmp	r0, r2, lsr #4
    8dc0:	e5c7607f 	strb	r6, [r7, #127]	; 0x7f
    8dc4:	e1a07222 	lsr	r7, r2, #4
    8dc8:	e1a02007 	mov	r2, r7
    8dcc:	1afffff4 	bne	8da4 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x104>
    8dd0:	e2610080 	rsb	r0, r1, #128	; 0x80
    8dd4:	e3500081 	cmp	r0, #129	; 0x81
    8dd8:	2a0000e0 	bcs	9160 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x4c0>
    8ddc:	e59f238c 	ldr	r2, [pc, #908]	; 9170 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x4d0>
    8de0:	e0430001 	sub	r0, r3, r1
    8de4:	e2800080 	add	r0, r0, #128	; 0x80
    8de8:	e08f2002 	add	r2, pc, r2
    8dec:	e88d0003 	stm	sp, {r0, r1}
    8df0:	ea000015 	b	8e4c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x1ac>
    8df4:	e28d7010 	add	r7, sp, #16
    8df8:	e3a00000 	mov	r0, #0
    8dfc:	e3a03000 	mov	r3, #0
    8e00:	e201200f 	and	r2, r1, #15
    8e04:	e2826037 	add	r6, r2, #55	; 0x37
    8e08:	e352000a 	cmp	r2, #10
    8e0c:	33826030 	orrcc	r6, r2, #48	; 0x30
    8e10:	e0472003 	sub	r2, r7, r3
    8e14:	e2833001 	add	r3, r3, #1
    8e18:	e1500221 	cmp	r0, r1, lsr #4
    8e1c:	e5c2607f 	strb	r6, [r2, #127]	; 0x7f
    8e20:	e1a02221 	lsr	r2, r1, #4
    8e24:	e1a01002 	mov	r1, r2
    8e28:	1afffff4 	bne	8e00 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x160>
    8e2c:	e2630080 	rsb	r0, r3, #128	; 0x80
    8e30:	e3500081 	cmp	r0, #129	; 0x81
    8e34:	2a0000c9 	bcs	9160 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x4c0>
    8e38:	e59f232c 	ldr	r2, [pc, #812]	; 916c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x4cc>
    8e3c:	e0470003 	sub	r0, r7, r3
    8e40:	e2800080 	add	r0, r0, #128	; 0x80
    8e44:	e08f2002 	add	r2, pc, r2
    8e48:	e88d0009 	stm	sp, {r0, r3}
    8e4c:	e3a07001 	mov	r7, #1
    8e50:	e1a0000b 	mov	r0, fp
    8e54:	e3a01001 	mov	r1, #1
    8e58:	e3a03002 	mov	r3, #2
    8e5c:	eb0003d6 	bl	9dbc <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE>
    8e60:	e3500000 	cmp	r0, #0
    8e64:	0a000024 	beq	8efc <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x25c>
    8e68:	ea0000b9 	b	9154 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x4b4>
    8e6c:	e1a03001 	mov	r3, r1
    8e70:	e3530063 	cmp	r3, #99	; 0x63
    8e74:	daffffbc 	ble	8d6c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0xcc>
    8e78:	e308751f 	movw	r7, #34079	; 0x851f
    8e7c:	e6ff1073 	uxth	r1, r3
    8e80:	e34571eb 	movt	r7, #20971	; 0x51eb
    8e84:	e2422002 	sub	r2, r2, #2
    8e88:	e0871791 	umull	r1, r7, r1, r7
    8e8c:	e1a012a7 	lsr	r1, r7, #5
    8e90:	e3a07064 	mov	r7, #100	; 0x64
    8e94:	e0633791 	mls	r3, r1, r7, r3
    8e98:	e28d7010 	add	r7, sp, #16
    8e9c:	e0877002 	add	r7, r7, r2
    8ea0:	e6ff3073 	uxth	r3, r3
    8ea4:	e0803083 	add	r3, r0, r3, lsl #1
    8ea8:	e1d330b0 	ldrh	r3, [r3]
    8eac:	e1c730b0 	strh	r3, [r7]
    8eb0:	e351000a 	cmp	r1, #10
    8eb4:	aaffffaf 	bge	8d78 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0xd8>
    8eb8:	e2420001 	sub	r0, r2, #1
    8ebc:	e28d2010 	add	r2, sp, #16
    8ec0:	e2811030 	add	r1, r1, #48	; 0x30
    8ec4:	e7c21000 	strb	r1, [r2, r0]
    8ec8:	e59f22a8 	ldr	r2, [pc, #680]	; 9178 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x4d8>
    8ecc:	e28d3010 	add	r3, sp, #16
    8ed0:	e2601027 	rsb	r1, r0, #39	; 0x27
    8ed4:	e0830000 	add	r0, r3, r0
    8ed8:	e08f2002 	add	r2, pc, r2
    8edc:	e88d0003 	stm	sp, {r0, r1}
    8ee0:	e3a07001 	mov	r7, #1
    8ee4:	e1a0000b 	mov	r0, fp
    8ee8:	e3a01001 	mov	r1, #1
    8eec:	e3a03000 	mov	r3, #0
    8ef0:	eb0003b1 	bl	9dbc <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE>
    8ef4:	e3500000 	cmp	r0, #0
    8ef8:	1a000095 	bne	9154 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x4b4>
    8efc:	e59b0018 	ldr	r0, [fp, #24]
    8f00:	e3a03000 	mov	r3, #0
    8f04:	e59b101c 	ldr	r1, [fp, #28]
    8f08:	e3a07004 	mov	r7, #4
    8f0c:	e59f2268 	ldr	r2, [pc, #616]	; 917c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x4dc>
    8f10:	e28d6010 	add	r6, sp, #16
    8f14:	e58d3024 	str	r3, [sp, #36]	; 0x24
    8f18:	e58d7020 	str	r7, [sp, #32]
    8f1c:	e08f2002 	add	r2, pc, r2
    8f20:	e3a07001 	mov	r7, #1
    8f24:	e58d301c 	str	r3, [sp, #28]
    8f28:	e58d3018 	str	r3, [sp, #24]
    8f2c:	e58d7014 	str	r7, [sp, #20]
    8f30:	e58d2010 	str	r2, [sp, #16]
    8f34:	e1a02006 	mov	r2, r6
    8f38:	eb0002a2 	bl	99c8 <_ZN4core3fmt5write17hef5108bbb09fc778E>
    8f3c:	e3500000 	cmp	r0, #0
    8f40:	1a000083 	bne	9154 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x4b4>
    8f44:	e59b0000 	ldr	r0, [fp]
    8f48:	e3100010 	tst	r0, #16
    8f4c:	1a00002f 	bne	9010 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x370>
    8f50:	e5941004 	ldr	r1, [r4, #4]
    8f54:	e3100020 	tst	r0, #32
    8f58:	1a000043 	bne	906c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x3cc>
    8f5c:	e59f0224 	ldr	r0, [pc, #548]	; 9188 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x4e8>
    8f60:	e308c51f 	movw	ip, #34079	; 0x851f
    8f64:	e302e710 	movw	lr, #10000	; 0x2710
    8f68:	e3a03027 	mov	r3, #39	; 0x27
    8f6c:	e151000e 	cmp	r1, lr
    8f70:	e345c1eb 	movt	ip, #20971	; 0x51eb
    8f74:	e79f0000 	ldr	r0, [pc, r0]
    8f78:	3a000056 	bcc	90d8 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x438>
    8f7c:	e30e80ff 	movw	r8, #57599	; 0xe0ff
    8f80:	e3019759 	movw	r9, #5977	; 0x1759
    8f84:	e3a03000 	mov	r3, #0
    8f88:	e34085f5 	movt	r8, #1525	; 0x5f5
    8f8c:	e34d91b7 	movt	r9, #53687	; 0xd1b7
    8f90:	e3a0a064 	mov	sl, #100	; 0x64
    8f94:	e0827991 	umull	r7, r2, r1, r9
    8f98:	e1510008 	cmp	r1, r8
    8f9c:	e1a076a2 	lsr	r7, r2, #13
    8fa0:	e0621e97 	mls	r2, r7, lr, r1
    8fa4:	e1a01007 	mov	r1, r7
    8fa8:	e6ff4072 	uxth	r4, r2
    8fac:	e0854c94 	umull	r4, r5, r4, ip
    8fb0:	e1a042a5 	lsr	r4, r5, #5
    8fb4:	e0865003 	add	r5, r6, r3
    8fb8:	e0622a94 	mls	r2, r4, sl, r2
    8fbc:	e0804084 	add	r4, r0, r4, lsl #1
    8fc0:	e2433004 	sub	r3, r3, #4
    8fc4:	e1d440b0 	ldrh	r4, [r4]
    8fc8:	e1c542b3 	strh	r4, [r5, #35]	; 0x23
    8fcc:	e6ff2072 	uxth	r2, r2
    8fd0:	e0802082 	add	r2, r0, r2, lsl #1
    8fd4:	e1d220b0 	ldrh	r2, [r2]
    8fd8:	e1c522b5 	strh	r2, [r5, #37]	; 0x25
    8fdc:	8affffec 	bhi	8f94 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x2f4>
    8fe0:	e2833027 	add	r3, r3, #39	; 0x27
    8fe4:	e3570063 	cmp	r7, #99	; 0x63
    8fe8:	ca00003d 	bgt	90e4 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x444>
    8fec:	e1a01007 	mov	r1, r7
    8ff0:	e351000a 	cmp	r1, #10
    8ff4:	ba000047 	blt	9118 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x478>
    8ff8:	e0801081 	add	r1, r0, r1, lsl #1
    8ffc:	e2430002 	sub	r0, r3, #2
    9000:	e0862000 	add	r2, r6, r0
    9004:	e1d110b0 	ldrh	r1, [r1]
    9008:	e1c210b0 	strh	r1, [r2]
    900c:	ea000044 	b	9124 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x484>
    9010:	e5942004 	ldr	r2, [r4, #4]
    9014:	e3a00000 	mov	r0, #0
    9018:	e3a01000 	mov	r1, #0
    901c:	e202300f 	and	r3, r2, #15
    9020:	e2837057 	add	r7, r3, #87	; 0x57
    9024:	e353000a 	cmp	r3, #10
    9028:	33837030 	orrcc	r7, r3, #48	; 0x30
    902c:	e0463001 	sub	r3, r6, r1
    9030:	e2811001 	add	r1, r1, #1
    9034:	e1500222 	cmp	r0, r2, lsr #4
    9038:	e5c3707f 	strb	r7, [r3, #127]	; 0x7f
    903c:	e1a03222 	lsr	r3, r2, #4
    9040:	e1a02003 	mov	r2, r3
    9044:	1afffff4 	bne	901c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x37c>
    9048:	e2610080 	rsb	r0, r1, #128	; 0x80
    904c:	e3500081 	cmp	r0, #129	; 0x81
    9050:	2a000042 	bcs	9160 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x4c0>
    9054:	e59f2128 	ldr	r2, [pc, #296]	; 9184 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x4e4>
    9058:	e0460001 	sub	r0, r6, r1
    905c:	e2800080 	add	r0, r0, #128	; 0x80
    9060:	e08f2002 	add	r2, pc, r2
    9064:	e88d0003 	stm	sp, {r0, r1}
    9068:	ea000014 	b	90c0 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x420>
    906c:	e3a00000 	mov	r0, #0
    9070:	e3a03000 	mov	r3, #0
    9074:	e201200f 	and	r2, r1, #15
    9078:	e2827037 	add	r7, r2, #55	; 0x37
    907c:	e352000a 	cmp	r2, #10
    9080:	33827030 	orrcc	r7, r2, #48	; 0x30
    9084:	e0462003 	sub	r2, r6, r3
    9088:	e2833001 	add	r3, r3, #1
    908c:	e1500221 	cmp	r0, r1, lsr #4
    9090:	e5c2707f 	strb	r7, [r2, #127]	; 0x7f
    9094:	e1a02221 	lsr	r2, r1, #4
    9098:	e1a01002 	mov	r1, r2
    909c:	1afffff4 	bne	9074 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x3d4>
    90a0:	e2630080 	rsb	r0, r3, #128	; 0x80
    90a4:	e3500081 	cmp	r0, #129	; 0x81
    90a8:	2a00002c 	bcs	9160 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x4c0>
    90ac:	e59f20cc 	ldr	r2, [pc, #204]	; 9180 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x4e0>
    90b0:	e0460003 	sub	r0, r6, r3
    90b4:	e2800080 	add	r0, r0, #128	; 0x80
    90b8:	e08f2002 	add	r2, pc, r2
    90bc:	e88d0009 	stm	sp, {r0, r3}
    90c0:	e1a0000b 	mov	r0, fp
    90c4:	e3a01001 	mov	r1, #1
    90c8:	e3a03002 	mov	r3, #2
    90cc:	eb00033a 	bl	9dbc <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE>
    90d0:	e3a07000 	mov	r7, #0
    90d4:	ea00001c 	b	914c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x4ac>
    90d8:	e1a07001 	mov	r7, r1
    90dc:	e3570063 	cmp	r7, #99	; 0x63
    90e0:	daffffc1 	ble	8fec <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x34c>
    90e4:	e6ff1077 	uxth	r1, r7
    90e8:	e2433002 	sub	r3, r3, #2
    90ec:	e0821c91 	umull	r1, r2, r1, ip
    90f0:	e1a012a2 	lsr	r1, r2, #5
    90f4:	e3a02064 	mov	r2, #100	; 0x64
    90f8:	e0627291 	mls	r2, r1, r2, r7
    90fc:	e0867003 	add	r7, r6, r3
    9100:	e6ff2072 	uxth	r2, r2
    9104:	e0802082 	add	r2, r0, r2, lsl #1
    9108:	e1d220b0 	ldrh	r2, [r2]
    910c:	e1c720b0 	strh	r2, [r7]
    9110:	e351000a 	cmp	r1, #10
    9114:	aaffffb7 	bge	8ff8 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x358>
    9118:	e2430001 	sub	r0, r3, #1
    911c:	e2811030 	add	r1, r1, #48	; 0x30
    9120:	e7c61000 	strb	r1, [r6, r0]
    9124:	e59f2060 	ldr	r2, [pc, #96]	; 918c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h05fe67ac3c9d01c2E+0x4ec>
    9128:	e2601027 	rsb	r1, r0, #39	; 0x27
    912c:	e0860000 	add	r0, r6, r0
    9130:	e3a03000 	mov	r3, #0
    9134:	e08f2002 	add	r2, pc, r2
    9138:	e88d0003 	stm	sp, {r0, r1}
    913c:	e1a0000b 	mov	r0, fp
    9140:	e3a01001 	mov	r1, #1
    9144:	e3a07000 	mov	r7, #0
    9148:	eb00031b 	bl	9dbc <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE>
    914c:	e3500000 	cmp	r0, #0
    9150:	13a07001 	movne	r7, #1
    9154:	e1a00007 	mov	r0, r7
    9158:	e28dd094 	add	sp, sp, #148	; 0x94
    915c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    9160:	e3a01080 	mov	r1, #128	; 0x80
    9164:	eb00014e 	bl	96a4 <_ZN4core5slice22slice_index_order_fail17hfc8d92dea9af4734E>
    9168:	e7ffdefe 	udf	#65006	; 0xfdee
    916c:	00003781 	.word	0x00003781
    9170:	000037dd 	.word	0x000037dd
    9174:	00004428 	.word	0x00004428
    9178:	000036ed 	.word	0x000036ed
    917c:	00003a34 	.word	0x00003a34
    9180:	0000350d 	.word	0x0000350d
    9184:	00003565 	.word	0x00003565
    9188:	0000418c 	.word	0x0000418c
    918c:	00003491 	.word	0x00003491

00009190 <_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hdf48b12f10b95d69E>:
    9190:	e30502d2 	movw	r0, #21202	; 0x52d2
    9194:	e3091b23 	movw	r1, #39715	; 0x9b23
    9198:	e34f0da4 	movt	r0, #64932	; 0xfda4
    919c:	e34e1043 	movt	r1, #57411	; 0xe043
    91a0:	e12fff1e 	bx	lr

000091a4 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E>:
    91a4:	e24dd068 	sub	sp, sp, #104	; 0x68
    91a8:	e3a0c001 	mov	ip, #1
    91ac:	e3510c01 	cmp	r1, #256	; 0x100
    91b0:	e1a0e001 	mov	lr, r1
    91b4:	e88d000c 	stm	sp, {r2, r3}
    91b8:	9a000011 	bls	9204 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x60>
    91bc:	e2614000 	rsb	r4, r1, #0
    91c0:	e3a05c01 	mov	r5, #256	; 0x100
    91c4:	e3a0c000 	mov	ip, #0
    91c8:	e1550001 	cmp	r5, r1
    91cc:	2a000003 	bcs	91e0 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x3c>
    91d0:	e0806005 	add	r6, r0, r5
    91d4:	e1d660d0 	ldrsb	r6, [r6]
    91d8:	e3760041 	cmn	r6, #65	; 0x41
    91dc:	ca000006 	bgt	91fc <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x58>
    91e0:	e255e001 	subs	lr, r5, #1
    91e4:	0a000006 	beq	9204 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x60>
    91e8:	e0845005 	add	r5, r4, r5
    91ec:	e3550001 	cmp	r5, #1
    91f0:	e1a0500e 	mov	r5, lr
    91f4:	1afffff3 	bne	91c8 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x24>
    91f8:	ea000001 	b	9204 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x60>
    91fc:	e3a0c000 	mov	ip, #0
    9200:	e1a0e005 	mov	lr, r5
    9204:	e59f4354 	ldr	r4, [pc, #852]	; 9560 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x3bc>
    9208:	e3a06005 	mov	r6, #5
    920c:	e59f5350 	ldr	r5, [pc, #848]	; 9564 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x3c0>
    9210:	e35c0000 	cmp	ip, #0
    9214:	e08f4004 	add	r4, pc, r4
    9218:	13006000 	movwne	r6, #0
    921c:	e08f5005 	add	r5, pc, r5
    9220:	e58de00c 	str	lr, [sp, #12]
    9224:	11a05004 	movne	r5, r4
    9228:	e1520001 	cmp	r2, r1
    922c:	91530001 	cmpls	r3, r1
    9230:	e58d6014 	str	r6, [sp, #20]
    9234:	e58d0008 	str	r0, [sp, #8]
    9238:	e58d5010 	str	r5, [sp, #16]
    923c:	9a000020 	bls	92c4 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x120>
    9240:	e59f0350 	ldr	r0, [pc, #848]	; 9598 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x3f4>
    9244:	e1520001 	cmp	r2, r1
    9248:	e59fc34c 	ldr	ip, [pc, #844]	; 959c <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x3f8>
    924c:	81a03002 	movhi	r3, r2
    9250:	e59f6348 	ldr	r6, [pc, #840]	; 95a0 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x3fc>
    9254:	e3a01003 	mov	r1, #3
    9258:	e28d2040 	add	r2, sp, #64	; 0x40
    925c:	e08f0000 	add	r0, pc, r0
    9260:	e58d103c 	str	r1, [sp, #60]	; 0x3c
    9264:	e08f6006 	add	r6, pc, r6
    9268:	e58d2038 	str	r2, [sp, #56]	; 0x38
    926c:	e3a02000 	mov	r2, #0
    9270:	e58d2034 	str	r2, [sp, #52]	; 0x34
    9274:	e08fc00c 	add	ip, pc, ip
    9278:	e58d2030 	str	r2, [sp, #48]	; 0x30
    927c:	e58d102c 	str	r1, [sp, #44]	; 0x2c
    9280:	e28d1010 	add	r1, sp, #16
    9284:	e58d0054 	str	r0, [sp, #84]	; 0x54
    9288:	e58d1050 	str	r1, [sp, #80]	; 0x50
    928c:	e1a0100c 	mov	r1, ip
    9290:	e58d004c 	str	r0, [sp, #76]	; 0x4c
    9294:	e28d0008 	add	r0, sp, #8
    9298:	e58d3020 	str	r3, [sp, #32]
    929c:	e58d6028 	str	r6, [sp, #40]	; 0x28
    92a0:	e58d0048 	str	r0, [sp, #72]	; 0x48
    92a4:	e59f02f8 	ldr	r0, [pc, #760]	; 95a4 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x400>
    92a8:	e79f0000 	ldr	r0, [pc, r0]
    92ac:	e58d0044 	str	r0, [sp, #68]	; 0x44
    92b0:	e28d0020 	add	r0, sp, #32
    92b4:	e58d0040 	str	r0, [sp, #64]	; 0x40
    92b8:	e28d0028 	add	r0, sp, #40	; 0x28
    92bc:	eb000753 	bl	b010 <_ZN4core9panicking9panic_fmt17hfb3f65a21a5866cfE>
    92c0:	e7ffdefe 	udf	#65006	; 0xfdee
    92c4:	e1520003 	cmp	r2, r3
    92c8:	8a000084 	bhi	94e0 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x33c>
    92cc:	e3520000 	cmp	r2, #0
    92d0:	11510002 	cmpne	r1, r2
    92d4:	1a000017 	bne	9338 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x194>
    92d8:	e1a02003 	mov	r2, r3
    92dc:	e3520000 	cmp	r2, #0
    92e0:	e58d2018 	str	r2, [sp, #24]
    92e4:	11520001 	cmpne	r2, r1
    92e8:	1a00001b 	bne	935c <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x1b8>
    92ec:	e1a03002 	mov	r3, r2
    92f0:	e1530001 	cmp	r3, r1
    92f4:	1a000006 	bne	9314 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x170>
    92f8:	e59f0268 	ldr	r0, [pc, #616]	; 9568 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x3c4>
    92fc:	e3a0102b 	mov	r1, #43	; 0x2b
    9300:	e59f2264 	ldr	r2, [pc, #612]	; 956c <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x3c8>
    9304:	e08f0000 	add	r0, pc, r0
    9308:	e08f2002 	add	r2, pc, r2
    930c:	eb000712 	bl	af5c <_ZN4core9panicking5panic17h7b567084461090e7E>
    9310:	e7ffdefe 	udf	#65006	; 0xfdee
    9314:	e0804003 	add	r4, r0, r3
    9318:	e1a05004 	mov	r5, r4
    931c:	e0d560d1 	ldrsb	r6, [r5], #1
    9320:	e3760001 	cmn	r6, #1
    9324:	e6ef2076 	uxtb	r2, r6
    9328:	da000018 	ble	9390 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x1ec>
    932c:	e58d201c 	str	r2, [sp, #28]
    9330:	e3a02001 	mov	r2, #1
    9334:	ea00003c 	b	942c <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x288>
    9338:	9affffe7 	bls	92dc <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x138>
    933c:	e0806002 	add	r6, r0, r2
    9340:	e1d660d0 	ldrsb	r6, [r6]
    9344:	e3760040 	cmn	r6, #64	; 0x40
    9348:	a1a02003 	movge	r2, r3
    934c:	e3520000 	cmp	r2, #0
    9350:	e58d2018 	str	r2, [sp, #24]
    9354:	11520001 	cmpne	r2, r1
    9358:	0affffe3 	beq	92ec <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x148>
    935c:	e2815001 	add	r5, r1, #1
    9360:	e1520001 	cmp	r2, r1
    9364:	2a000003 	bcs	9378 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x1d4>
    9368:	e0803002 	add	r3, r0, r2
    936c:	e1d330d0 	ldrsb	r3, [r3]
    9370:	e3730040 	cmn	r3, #64	; 0x40
    9374:	aaffffdc 	bge	92ec <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x148>
    9378:	e2523001 	subs	r3, r2, #1
    937c:	0affffdb 	beq	92f0 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x14c>
    9380:	e1550002 	cmp	r5, r2
    9384:	e1a02003 	mov	r2, r3
    9388:	1afffff4 	bne	9360 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x1bc>
    938c:	eaffffd7 	b	92f0 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x14c>
    9390:	e0800001 	add	r0, r0, r1
    9394:	e3a01000 	mov	r1, #0
    9398:	e1550000 	cmp	r5, r0
    939c:	e202c01f 	and	ip, r2, #31
    93a0:	15d41001 	ldrbne	r1, [r4, #1]
    93a4:	e1a06000 	mov	r6, r0
    93a8:	12846002 	addne	r6, r4, #2
    93ac:	1201103f 	andne	r1, r1, #63	; 0x3f
    93b0:	e35200df 	cmp	r2, #223	; 0xdf
    93b4:	9a000013 	bls	9408 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x264>
    93b8:	e3a05000 	mov	r5, #0
    93bc:	e1560000 	cmp	r6, r0
    93c0:	14d65001 	ldrbne	r5, [r6], #1
    93c4:	e1a0e000 	mov	lr, r0
    93c8:	1205503f 	andne	r5, r5, #63	; 0x3f
    93cc:	11a0e006 	movne	lr, r6
    93d0:	e1851301 	orr	r1, r5, r1, lsl #6
    93d4:	e35200f0 	cmp	r2, #240	; 0xf0
    93d8:	3a00000c 	bcc	9410 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x26c>
    93dc:	e15e0000 	cmp	lr, r0
    93e0:	e3a02000 	mov	r2, #0
    93e4:	15de0000 	ldrbne	r0, [lr]
    93e8:	1200203f 	andne	r2, r0, #63	; 0x3f
    93ec:	e3a00707 	mov	r0, #1835008	; 0x1c0000
    93f0:	e000090c 	and	r0, r0, ip, lsl #18
    93f4:	e1800301 	orr	r0, r0, r1, lsl #6
    93f8:	e1800002 	orr	r0, r0, r2
    93fc:	e3500811 	cmp	r0, #1114112	; 0x110000
    9400:	0affffbc 	beq	92f8 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x154>
    9404:	ea000002 	b	9414 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x270>
    9408:	e181030c 	orr	r0, r1, ip, lsl #6
    940c:	ea000000 	b	9414 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x270>
    9410:	e181060c 	orr	r0, r1, ip, lsl #12
    9414:	e3a02001 	mov	r2, #1
    9418:	e3500080 	cmp	r0, #128	; 0x80
    941c:	23a02002 	movcs	r2, #2
    9420:	23500b02 	cmpcs	r0, #2048	; 0x800
    9424:	e58d001c 	str	r0, [sp, #28]
    9428:	2a000028 	bcs	94d0 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x32c>
    942c:	e59f014c 	ldr	r0, [pc, #332]	; 9580 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x3dc>
    9430:	e0822003 	add	r2, r2, r3
    9434:	e59f6148 	ldr	r6, [pc, #328]	; 9584 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x3e0>
    9438:	e28dc028 	add	ip, sp, #40	; 0x28
    943c:	e59f5144 	ldr	r5, [pc, #324]	; 9588 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x3e4>
    9440:	e08f0000 	add	r0, pc, r0
    9444:	e59f1140 	ldr	r1, [pc, #320]	; 958c <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x3e8>
    9448:	e08f6006 	add	r6, pc, r6
    944c:	e58d2024 	str	r2, [sp, #36]	; 0x24
    9450:	e3a02005 	mov	r2, #5
    9454:	e58d3020 	str	r3, [sp, #32]
    9458:	e28d3040 	add	r3, sp, #64	; 0x40
    945c:	e58d203c 	str	r2, [sp, #60]	; 0x3c
    9460:	e08f5005 	add	r5, pc, r5
    9464:	e58d3038 	str	r3, [sp, #56]	; 0x38
    9468:	e3a03000 	mov	r3, #0
    946c:	e58d3034 	str	r3, [sp, #52]	; 0x34
    9470:	e08f1001 	add	r1, pc, r1
    9474:	e88c000d 	stm	ip, {r0, r2, r3}
    9478:	e28d0010 	add	r0, sp, #16
    947c:	e58d6064 	str	r6, [sp, #100]	; 0x64
    9480:	e58d0060 	str	r0, [sp, #96]	; 0x60
    9484:	e28d0008 	add	r0, sp, #8
    9488:	e58d605c 	str	r6, [sp, #92]	; 0x5c
    948c:	e58d0058 	str	r0, [sp, #88]	; 0x58
    9490:	e28d0020 	add	r0, sp, #32
    9494:	e58d5054 	str	r5, [sp, #84]	; 0x54
    9498:	e58d0050 	str	r0, [sp, #80]	; 0x50
    949c:	e59f00ec 	ldr	r0, [pc, #236]	; 9590 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x3ec>
    94a0:	e79f0000 	ldr	r0, [pc, r0]
    94a4:	e58d004c 	str	r0, [sp, #76]	; 0x4c
    94a8:	e28d001c 	add	r0, sp, #28
    94ac:	e58d0048 	str	r0, [sp, #72]	; 0x48
    94b0:	e59f00dc 	ldr	r0, [pc, #220]	; 9594 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x3f0>
    94b4:	e79f0000 	ldr	r0, [pc, r0]
    94b8:	e58d0044 	str	r0, [sp, #68]	; 0x44
    94bc:	e28d0018 	add	r0, sp, #24
    94c0:	e58d0040 	str	r0, [sp, #64]	; 0x40
    94c4:	e28d0028 	add	r0, sp, #40	; 0x28
    94c8:	eb0006d0 	bl	b010 <_ZN4core9panicking9panic_fmt17hfb3f65a21a5866cfE>
    94cc:	e7ffdefe 	udf	#65006	; 0xfdee
    94d0:	e3a02004 	mov	r2, #4
    94d4:	e3500801 	cmp	r0, #65536	; 0x10000
    94d8:	33002003 	movwcc	r2, #3
    94dc:	eaffffd2 	b	942c <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x288>
    94e0:	e59f0088 	ldr	r0, [pc, #136]	; 9570 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x3cc>
    94e4:	e3a03004 	mov	r3, #4
    94e8:	e28d6040 	add	r6, sp, #64	; 0x40
    94ec:	e59f2080 	ldr	r2, [pc, #128]	; 9574 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x3d0>
    94f0:	e59f1080 	ldr	r1, [pc, #128]	; 9578 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x3d4>
    94f4:	e08f0000 	add	r0, pc, r0
    94f8:	e58d303c 	str	r3, [sp, #60]	; 0x3c
    94fc:	e08f2002 	add	r2, pc, r2
    9500:	e58d6038 	str	r6, [sp, #56]	; 0x38
    9504:	e3a06000 	mov	r6, #0
    9508:	e58d6034 	str	r6, [sp, #52]	; 0x34
    950c:	e08f1001 	add	r1, pc, r1
    9510:	e58d6030 	str	r6, [sp, #48]	; 0x30
    9514:	e58d302c 	str	r3, [sp, #44]	; 0x2c
    9518:	e28d3010 	add	r3, sp, #16
    951c:	e58d005c 	str	r0, [sp, #92]	; 0x5c
    9520:	e58d3058 	str	r3, [sp, #88]	; 0x58
    9524:	e28d3004 	add	r3, sp, #4
    9528:	e58d0054 	str	r0, [sp, #84]	; 0x54
    952c:	e28d0008 	add	r0, sp, #8
    9530:	e58d0050 	str	r0, [sp, #80]	; 0x50
    9534:	e59f0040 	ldr	r0, [pc, #64]	; 957c <_ZN4core3str16slice_error_fail17h2e200793efac0a84E+0x3d8>
    9538:	e79f0000 	ldr	r0, [pc, r0]
    953c:	e58d004c 	str	r0, [sp, #76]	; 0x4c
    9540:	e58d3048 	str	r3, [sp, #72]	; 0x48
    9544:	e58d0044 	str	r0, [sp, #68]	; 0x44
    9548:	e1a0000d 	mov	r0, sp
    954c:	e58d0040 	str	r0, [sp, #64]	; 0x40
    9550:	e58d2028 	str	r2, [sp, #40]	; 0x28
    9554:	e28d0028 	add	r0, sp, #40	; 0x28
    9558:	eb0006ac 	bl	b010 <_ZN4core9panicking9panic_fmt17hfb3f65a21a5866cfE>
    955c:	e7ffdefe 	udf	#65006	; 0xfdee
    9560:	0000247b 	.word	0x0000247b
    9564:	0000246e 	.word	0x0000246e
    9568:	0000226a 	.word	0x0000226a
    956c:	00003650 	.word	0x00003650
    9570:	00001a4c 	.word	0x00001a4c
    9574:	00003494 	.word	0x00003494
    9578:	000034a4 	.word	0x000034a4
    957c:	00003c60 	.word	0x00003c60
    9580:	00003580 	.word	0x00003580
    9584:	00001af8 	.word	0x00001af8
    9588:	fffff838 	.word	0xfffff838
    958c:	00003578 	.word	0x00003578
    9590:	00003d04 	.word	0x00003d04
    9594:	00003ce4 	.word	0x00003ce4
    9598:	00001ce4 	.word	0x00001ce4
    959c:	0000370c 	.word	0x0000370c
    95a0:	00003704 	.word	0x00003704
    95a4:	00003ef0 	.word	0x00003ef0

000095a8 <_ZN4core6result13unwrap_failed17hd62dcb28c358f436E>:
    95a8:	e24dd038 	sub	sp, sp, #56	; 0x38
    95ac:	e59fe068 	ldr	lr, [pc, #104]	; 961c <_ZN4core6result13unwrap_failed17hd62dcb28c358f436E+0x74>
    95b0:	e59f4068 	ldr	r4, [pc, #104]	; 9620 <_ZN4core6result13unwrap_failed17hd62dcb28c358f436E+0x78>
    95b4:	e59fc068 	ldr	ip, [pc, #104]	; 9624 <_ZN4core6result13unwrap_failed17hd62dcb28c358f436E+0x7c>
    95b8:	e08fe00e 	add	lr, pc, lr
    95bc:	e59f5064 	ldr	r5, [pc, #100]	; 9628 <_ZN4core6result13unwrap_failed17hd62dcb28c358f436E+0x80>
    95c0:	e08f4004 	add	r4, pc, r4
    95c4:	e88d000f 	stm	sp, {r0, r1, r2, r3}
    95c8:	e3a00002 	mov	r0, #2
    95cc:	e28d1028 	add	r1, sp, #40	; 0x28
    95d0:	e58d0024 	str	r0, [sp, #36]	; 0x24
    95d4:	e08fc00c 	add	ip, pc, ip
    95d8:	e58d1020 	str	r1, [sp, #32]
    95dc:	e3a01000 	mov	r1, #0
    95e0:	e58d101c 	str	r1, [sp, #28]
    95e4:	e08f5005 	add	r5, pc, r5
    95e8:	e58d1018 	str	r1, [sp, #24]
    95ec:	e1a0100c 	mov	r1, ip
    95f0:	e58d0014 	str	r0, [sp, #20]
    95f4:	e28d0008 	add	r0, sp, #8
    95f8:	e58de034 	str	lr, [sp, #52]	; 0x34
    95fc:	e58d0030 	str	r0, [sp, #48]	; 0x30
    9600:	e1a0000d 	mov	r0, sp
    9604:	e58d402c 	str	r4, [sp, #44]	; 0x2c
    9608:	e58d0028 	str	r0, [sp, #40]	; 0x28
    960c:	e28d0010 	add	r0, sp, #16
    9610:	e58d5010 	str	r5, [sp, #16]
    9614:	eb00067d 	bl	b010 <_ZN4core9panicking9panic_fmt17hfb3f65a21a5866cfE>
    9618:	e7ffdefe 	udf	#65006	; 0xfdee
    961c:	00001974 	.word	0x00001974
    9620:	00001980 	.word	0x00001980
    9624:	00003444 	.word	0x00003444
    9628:	00003424 	.word	0x00003424

0000962c <_ZN4core5slice20slice_index_len_fail17hffa223bdd7ffcc2fE>:
    962c:	e24dd030 	sub	sp, sp, #48	; 0x30
    9630:	e59f2060 	ldr	r2, [pc, #96]	; 9698 <_ZN4core5slice20slice_index_len_fail17hffa223bdd7ffcc2fE+0x6c>
    9634:	e59f3060 	ldr	r3, [pc, #96]	; 969c <_ZN4core5slice20slice_index_len_fail17hffa223bdd7ffcc2fE+0x70>
    9638:	e88d0003 	stm	sp, {r0, r1}
    963c:	e3a00002 	mov	r0, #2
    9640:	e28d1020 	add	r1, sp, #32
    9644:	e58d001c 	str	r0, [sp, #28]
    9648:	e08f3003 	add	r3, pc, r3
    964c:	e58d1018 	str	r1, [sp, #24]
    9650:	e3a01000 	mov	r1, #0
    9654:	e58d1014 	str	r1, [sp, #20]
    9658:	e08f2002 	add	r2, pc, r2
    965c:	e58d1010 	str	r1, [sp, #16]
    9660:	e28d1004 	add	r1, sp, #4
    9664:	e58d000c 	str	r0, [sp, #12]
    9668:	e58d3008 	str	r3, [sp, #8]
    966c:	e59f002c 	ldr	r0, [pc, #44]	; 96a0 <_ZN4core5slice20slice_index_len_fail17hffa223bdd7ffcc2fE+0x74>
    9670:	e79f0000 	ldr	r0, [pc, r0]
    9674:	e58d002c 	str	r0, [sp, #44]	; 0x2c
    9678:	e58d1028 	str	r1, [sp, #40]	; 0x28
    967c:	e1a01002 	mov	r1, r2
    9680:	e58d0024 	str	r0, [sp, #36]	; 0x24
    9684:	e1a0000d 	mov	r0, sp
    9688:	e58d0020 	str	r0, [sp, #32]
    968c:	e28d0008 	add	r0, sp, #8
    9690:	eb00065e 	bl	b010 <_ZN4core9panicking9panic_fmt17hfb3f65a21a5866cfE>
    9694:	e7ffdefe 	udf	#65006	; 0xfdee
    9698:	000033e0 	.word	0x000033e0
    969c:	000033e0 	.word	0x000033e0
    96a0:	00003b28 	.word	0x00003b28

000096a4 <_ZN4core5slice22slice_index_order_fail17hfc8d92dea9af4734E>:
    96a4:	e24dd030 	sub	sp, sp, #48	; 0x30
    96a8:	e59f2060 	ldr	r2, [pc, #96]	; 9710 <_ZN4core5slice22slice_index_order_fail17hfc8d92dea9af4734E+0x6c>
    96ac:	e59f3060 	ldr	r3, [pc, #96]	; 9714 <_ZN4core5slice22slice_index_order_fail17hfc8d92dea9af4734E+0x70>
    96b0:	e88d0003 	stm	sp, {r0, r1}
    96b4:	e3a00002 	mov	r0, #2
    96b8:	e28d1020 	add	r1, sp, #32
    96bc:	e58d001c 	str	r0, [sp, #28]
    96c0:	e08f3003 	add	r3, pc, r3
    96c4:	e58d1018 	str	r1, [sp, #24]
    96c8:	e3a01000 	mov	r1, #0
    96cc:	e58d1014 	str	r1, [sp, #20]
    96d0:	e08f2002 	add	r2, pc, r2
    96d4:	e58d1010 	str	r1, [sp, #16]
    96d8:	e28d1004 	add	r1, sp, #4
    96dc:	e58d000c 	str	r0, [sp, #12]
    96e0:	e58d3008 	str	r3, [sp, #8]
    96e4:	e59f002c 	ldr	r0, [pc, #44]	; 9718 <_ZN4core5slice22slice_index_order_fail17hfc8d92dea9af4734E+0x74>
    96e8:	e79f0000 	ldr	r0, [pc, r0]
    96ec:	e58d002c 	str	r0, [sp, #44]	; 0x2c
    96f0:	e58d1028 	str	r1, [sp, #40]	; 0x28
    96f4:	e1a01002 	mov	r1, r2
    96f8:	e58d0024 	str	r0, [sp, #36]	; 0x24
    96fc:	e1a0000d 	mov	r0, sp
    9700:	e58d0020 	str	r0, [sp, #32]
    9704:	e28d0008 	add	r0, sp, #8
    9708:	eb000640 	bl	b010 <_ZN4core9panicking9panic_fmt17hfb3f65a21a5866cfE>
    970c:	e7ffdefe 	udf	#65006	; 0xfdee
    9710:	00003388 	.word	0x00003388
    9714:	00003388 	.word	0x00003388
    9718:	00003ab0 	.word	0x00003ab0

0000971c <_ZN4core7unicode9printable5check17h8c6e2604042213f0E.llvm.7052769813565378627>:
    971c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
    9720:	e6ff4070 	uxth	r4, r0
    9724:	e3520000 	cmp	r2, #0
    9728:	0a00001a 	beq	9798 <_ZN4core7unicode9printable5check17h8c6e2604042213f0E.llvm.7052769813565378627+0x7c>
    972c:	e59dc020 	ldr	ip, [sp, #32]
    9730:	e0818082 	add	r8, r1, r2, lsl #1
    9734:	e1a09424 	lsr	r9, r4, #8
    9738:	e3a02000 	mov	r2, #0
    973c:	e5d17001 	ldrb	r7, [r1, #1]
    9740:	e5d15000 	ldrb	r5, [r1]
    9744:	e2811002 	add	r1, r1, #2
    9748:	e082e007 	add	lr, r2, r7
    974c:	e1550009 	cmp	r5, r9
    9750:	1a00000c 	bne	9788 <_ZN4core7unicode9printable5check17h8c6e2604042213f0E.llvm.7052769813565378627+0x6c>
    9754:	e15e0002 	cmp	lr, r2
    9758:	3a000034 	bcc	9830 <_ZN4core7unicode9printable5check17h8c6e2604042213f0E.llvm.7052769813565378627+0x114>
    975c:	e15e000c 	cmp	lr, ip
    9760:	8a000036 	bhi	9840 <_ZN4core7unicode9printable5check17h8c6e2604042213f0E.llvm.7052769813565378627+0x124>
    9764:	e0832002 	add	r2, r3, r2
    9768:	e3570000 	cmp	r7, #0
    976c:	0a000006 	beq	978c <_ZN4core7unicode9printable5check17h8c6e2604042213f0E.llvm.7052769813565378627+0x70>
    9770:	e4d25001 	ldrb	r5, [r2], #1
    9774:	e2477001 	sub	r7, r7, #1
    9778:	e6ef6070 	uxtb	r6, r0
    977c:	e1550006 	cmp	r5, r6
    9780:	1afffff8 	bne	9768 <_ZN4core7unicode9printable5check17h8c6e2604042213f0E.llvm.7052769813565378627+0x4c>
    9784:	ea00001c 	b	97fc <_ZN4core7unicode9printable5check17h8c6e2604042213f0E.llvm.7052769813565378627+0xe0>
    9788:	8a000002 	bhi	9798 <_ZN4core7unicode9printable5check17h8c6e2604042213f0E.llvm.7052769813565378627+0x7c>
    978c:	e1510008 	cmp	r1, r8
    9790:	e1a0200e 	mov	r2, lr
    9794:	1affffe8 	bne	973c <_ZN4core7unicode9printable5check17h8c6e2604042213f0E.llvm.7052769813565378627+0x20>
    9798:	e59d0028 	ldr	r0, [sp, #40]	; 0x28
    979c:	e3500000 	cmp	r0, #0
    97a0:	0a000018 	beq	9808 <_ZN4core7unicode9printable5check17h8c6e2604042213f0E.llvm.7052769813565378627+0xec>
    97a4:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
    97a8:	e0831000 	add	r1, r3, r0
    97ac:	e2832001 	add	r2, r3, #1
    97b0:	e3a00001 	mov	r0, #1
    97b4:	e5d37000 	ldrb	r7, [r3]
    97b8:	e6af3077 	sxtb	r3, r7
    97bc:	e3530000 	cmp	r3, #0
    97c0:	5a000004 	bpl	97d8 <_ZN4core7unicode9printable5check17h8c6e2604042213f0E.llvm.7052769813565378627+0xbc>
    97c4:	e1520001 	cmp	r2, r1
    97c8:	0a000011 	beq	9814 <_ZN4core7unicode9printable5check17h8c6e2604042213f0E.llvm.7052769813565378627+0xf8>
    97cc:	e4d27001 	ldrb	r7, [r2], #1
    97d0:	e203307f 	and	r3, r3, #127	; 0x7f
    97d4:	e1877403 	orr	r7, r7, r3, lsl #8
    97d8:	e0544007 	subs	r4, r4, r7
    97dc:	e1a03002 	mov	r3, r2
    97e0:	4a000003 	bmi	97f4 <_ZN4core7unicode9printable5check17h8c6e2604042213f0E.llvm.7052769813565378627+0xd8>
    97e4:	e2832001 	add	r2, r3, #1
    97e8:	e2200001 	eor	r0, r0, #1
    97ec:	e1530001 	cmp	r3, r1
    97f0:	1affffef 	bne	97b4 <_ZN4core7unicode9printable5check17h8c6e2604042213f0E.llvm.7052769813565378627+0x98>
    97f4:	e2000001 	and	r0, r0, #1
    97f8:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
    97fc:	e3a00000 	mov	r0, #0
    9800:	e2000001 	and	r0, r0, #1
    9804:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
    9808:	e3a00001 	mov	r0, #1
    980c:	e2000001 	and	r0, r0, #1
    9810:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
    9814:	e59f0034 	ldr	r0, [pc, #52]	; 9850 <_ZN4core7unicode9printable5check17h8c6e2604042213f0E.llvm.7052769813565378627+0x134>
    9818:	e3a0102b 	mov	r1, #43	; 0x2b
    981c:	e59f2030 	ldr	r2, [pc, #48]	; 9854 <_ZN4core7unicode9printable5check17h8c6e2604042213f0E.llvm.7052769813565378627+0x138>
    9820:	e08f0000 	add	r0, pc, r0
    9824:	e08f2002 	add	r2, pc, r2
    9828:	eb0005cb 	bl	af5c <_ZN4core9panicking5panic17h7b567084461090e7E>
    982c:	e7ffdefe 	udf	#65006	; 0xfdee
    9830:	e1a00002 	mov	r0, r2
    9834:	e1a0100e 	mov	r1, lr
    9838:	ebffff99 	bl	96a4 <_ZN4core5slice22slice_index_order_fail17hfc8d92dea9af4734E>
    983c:	e7ffdefe 	udf	#65006	; 0xfdee
    9840:	e1a0000e 	mov	r0, lr
    9844:	e1a0100c 	mov	r1, ip
    9848:	ebffff77 	bl	962c <_ZN4core5slice20slice_index_len_fail17hffa223bdd7ffcc2fE>
    984c:	e7ffdefe 	udf	#65006	; 0xfdee
    9850:	00001ee3 	.word	0x00001ee3
    9854:	000031d4 	.word	0x000031d4

00009858 <_ZN4core3str6traits101_$LT$impl$u20$core..slice..SliceIndex$LT$str$GT$$u20$for$u20$core..ops..range..Range$LT$usize$GT$$GT$5index28_$u7b$$u7b$closure$u7d$$u7d$17h0dca8b55fcd098caE>:
    9858:	e890000e 	ldm	r0, {r1, r2, r3}
    985c:	e5933000 	ldr	r3, [r3]
    9860:	e5922000 	ldr	r2, [r2]
    9864:	e8910003 	ldm	r1, {r0, r1}
    9868:	ebfffe4d 	bl	91a4 <_ZN4core3str16slice_error_fail17h2e200793efac0a84E>
    986c:	e7ffdefe 	udf	#65006	; 0xfdee

00009870 <_ZN4core3fmt10ArgumentV110show_usize17h70724d751e636595E.llvm.8259515445581047906>:
    9870:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    9874:	e24dd034 	sub	sp, sp, #52	; 0x34
    9878:	e1a0c001 	mov	ip, r1
    987c:	e5901000 	ldr	r1, [r0]
    9880:	e59f0138 	ldr	r0, [pc, #312]	; 99c0 <_ZN4core3fmt10ArgumentV110show_usize17h70724d751e636595E.llvm.8259515445581047906+0x150>
    9884:	e308851f 	movw	r8, #34079	; 0x851f
    9888:	e3029710 	movw	r9, #10000	; 0x2710
    988c:	e3a0e027 	mov	lr, #39	; 0x27
    9890:	e1510009 	cmp	r1, r9
    9894:	e34581eb 	movt	r8, #20971	; 0x51eb
    9898:	e79f0000 	ldr	r0, [pc, r0]
    989c:	3a000026 	bcc	993c <_ZN4core3fmt10ArgumentV110show_usize17h70724d751e636595E.llvm.8259515445581047906+0xcc>
    98a0:	e301e759 	movw	lr, #5977	; 0x1759
    98a4:	e30e40ff 	movw	r4, #57599	; 0xe0ff
    98a8:	e28db008 	add	fp, sp, #8
    98ac:	e3a02000 	mov	r2, #0
    98b0:	e34de1b7 	movt	lr, #53687	; 0xd1b7
    98b4:	e3a0a064 	mov	sl, #100	; 0x64
    98b8:	e34045f5 	movt	r4, #1525	; 0x5f5
    98bc:	e0853e91 	umull	r3, r5, r1, lr
    98c0:	e1510004 	cmp	r1, r4
    98c4:	e1a036a5 	lsr	r3, r5, #13
    98c8:	e0651993 	mls	r5, r3, r9, r1
    98cc:	e1a01003 	mov	r1, r3
    98d0:	e6ff6075 	uxth	r6, r5
    98d4:	e0876896 	umull	r6, r7, r6, r8
    98d8:	e1a062a7 	lsr	r6, r7, #5
    98dc:	e08b7002 	add	r7, fp, r2
    98e0:	e0655a96 	mls	r5, r6, sl, r5
    98e4:	e0806086 	add	r6, r0, r6, lsl #1
    98e8:	e2422004 	sub	r2, r2, #4
    98ec:	e1d660b0 	ldrh	r6, [r6]
    98f0:	e1c762b3 	strh	r6, [r7, #35]	; 0x23
    98f4:	e6ff5075 	uxth	r5, r5
    98f8:	e0805085 	add	r5, r0, r5, lsl #1
    98fc:	e1d550b0 	ldrh	r5, [r5]
    9900:	e1c752b5 	strh	r5, [r7, #37]	; 0x25
    9904:	8affffec 	bhi	98bc <_ZN4core3fmt10ArgumentV110show_usize17h70724d751e636595E.llvm.8259515445581047906+0x4c>
    9908:	e282e027 	add	lr, r2, #39	; 0x27
    990c:	e3530063 	cmp	r3, #99	; 0x63
    9910:	ca00000c 	bgt	9948 <_ZN4core3fmt10ArgumentV110show_usize17h70724d751e636595E.llvm.8259515445581047906+0xd8>
    9914:	e1a01003 	mov	r1, r3
    9918:	e351000a 	cmp	r1, #10
    991c:	ba000017 	blt	9980 <_ZN4core3fmt10ArgumentV110show_usize17h70724d751e636595E.llvm.8259515445581047906+0x110>
    9920:	e0801081 	add	r1, r0, r1, lsl #1
    9924:	e24e0002 	sub	r0, lr, #2
    9928:	e28d2008 	add	r2, sp, #8
    992c:	e0822000 	add	r2, r2, r0
    9930:	e1d110b0 	ldrh	r1, [r1]
    9934:	e1c210b0 	strh	r1, [r2]
    9938:	ea000014 	b	9990 <_ZN4core3fmt10ArgumentV110show_usize17h70724d751e636595E.llvm.8259515445581047906+0x120>
    993c:	e1a03001 	mov	r3, r1
    9940:	e3530063 	cmp	r3, #99	; 0x63
    9944:	dafffff2 	ble	9914 <_ZN4core3fmt10ArgumentV110show_usize17h70724d751e636595E.llvm.8259515445581047906+0xa4>
    9948:	e6ff1073 	uxth	r1, r3
    994c:	e24ee002 	sub	lr, lr, #2
    9950:	e0821891 	umull	r1, r2, r1, r8
    9954:	e1a012a2 	lsr	r1, r2, #5
    9958:	e3a02064 	mov	r2, #100	; 0x64
    995c:	e0623291 	mls	r2, r1, r2, r3
    9960:	e28d3008 	add	r3, sp, #8
    9964:	e083300e 	add	r3, r3, lr
    9968:	e6ff2072 	uxth	r2, r2
    996c:	e0802082 	add	r2, r0, r2, lsl #1
    9970:	e1d220b0 	ldrh	r2, [r2]
    9974:	e1c320b0 	strh	r2, [r3]
    9978:	e351000a 	cmp	r1, #10
    997c:	aaffffe7 	bge	9920 <_ZN4core3fmt10ArgumentV110show_usize17h70724d751e636595E.llvm.8259515445581047906+0xb0>
    9980:	e24e0001 	sub	r0, lr, #1
    9984:	e28d2008 	add	r2, sp, #8
    9988:	e2811030 	add	r1, r1, #48	; 0x30
    998c:	e7c21000 	strb	r1, [r2, r0]
    9990:	e59f202c 	ldr	r2, [pc, #44]	; 99c4 <_ZN4core3fmt10ArgumentV110show_usize17h70724d751e636595E.llvm.8259515445581047906+0x154>
    9994:	e28d3008 	add	r3, sp, #8
    9998:	e2601027 	rsb	r1, r0, #39	; 0x27
    999c:	e0830000 	add	r0, r3, r0
    99a0:	e08f2002 	add	r2, pc, r2
    99a4:	e88d0003 	stm	sp, {r0, r1}
    99a8:	e1a0000c 	mov	r0, ip
    99ac:	e3a01001 	mov	r1, #1
    99b0:	e3a03000 	mov	r3, #0
    99b4:	eb000100 	bl	9dbc <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE>
    99b8:	e28dd034 	add	sp, sp, #52	; 0x34
    99bc:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    99c0:	00003868 	.word	0x00003868
    99c4:	00002c25 	.word	0x00002c25

000099c8 <_ZN4core3fmt5write17hef5108bbb09fc778E>:
    99c8:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    99cc:	e24dd034 	sub	sp, sp, #52	; 0x34
    99d0:	e3a03003 	mov	r3, #3
    99d4:	e5925008 	ldr	r5, [r2, #8]
    99d8:	e5926010 	ldr	r6, [r2, #16]
    99dc:	e3a04000 	mov	r4, #0
    99e0:	e5927014 	ldr	r7, [r2, #20]
    99e4:	e3550000 	cmp	r5, #0
    99e8:	e5cd3030 	strb	r3, [sp, #48]	; 0x30
    99ec:	e3a03020 	mov	r3, #32
    99f0:	e58d3004 	str	r3, [sp, #4]
    99f4:	e28d3018 	add	r3, sp, #24
    99f8:	e58d4000 	str	r4, [sp]
    99fc:	e58d702c 	str	r7, [sp, #44]	; 0x2c
    9a00:	e58d6028 	str	r6, [sp, #40]	; 0x28
    9a04:	e8830043 	stm	r3, {r0, r1, r6}
    9a08:	e0863187 	add	r3, r6, r7, lsl #3
    9a0c:	e58d4010 	str	r4, [sp, #16]
    9a10:	e58d4008 	str	r4, [sp, #8]
    9a14:	e58d3024 	str	r3, [sp, #36]	; 0x24
    9a18:	0a000092 	beq	9c68 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x2a0>
    9a1c:	e5928004 	ldr	r8, [r2, #4]
    9a20:	e3083e39 	movw	r3, #36409	; 0x8e39
    9a24:	e592b000 	ldr	fp, [r2]
    9a28:	e34338e3 	movt	r3, #14563	; 0x38e3
    9a2c:	e592200c 	ldr	r2, [r2, #12]
    9a30:	e1a09008 	mov	r9, r8
    9a34:	e0822182 	add	r2, r2, r2, lsl #3
    9a38:	e1a02102 	lsl	r2, r2, #2
    9a3c:	e0832392 	umull	r2, r3, r2, r3
    9a40:	e15801a3 	cmp	r8, r3, lsr #3
    9a44:	21a091a3 	lsrcs	r9, r3, #3
    9a48:	e3590000 	cmp	r9, #0
    9a4c:	0a0000ad 	beq	9d08 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x340>
    9a50:	e59b3000 	ldr	r3, [fp]
    9a54:	e591600c 	ldr	r6, [r1, #12]
    9a58:	e59b2004 	ldr	r2, [fp, #4]
    9a5c:	e1a01003 	mov	r1, r3
    9a60:	e12fff36 	blx	r6
    9a64:	e3a01001 	mov	r1, #1
    9a68:	e3500000 	cmp	r0, #0
    9a6c:	1a0000a2 	bne	9cfc <_ZN4core3fmt5write17hef5108bbb09fc778E+0x334>
    9a70:	e59f7324 	ldr	r7, [pc, #804]	; 9d9c <_ZN4core3fmt5write17hef5108bbb09fc778E+0x3d4>
    9a74:	e2855020 	add	r5, r5, #32
    9a78:	e3a06000 	mov	r6, #0
    9a7c:	e1a0a00d 	mov	sl, sp
    9a80:	e08f7007 	add	r7, pc, r7
    9a84:	e5150018 	ldr	r0, [r5, #-24]	; 0xffffffe8
    9a88:	e2864001 	add	r4, r6, #1
    9a8c:	e58d0004 	str	r0, [sp, #4]
    9a90:	e5d50000 	ldrb	r0, [r5]
    9a94:	e5cd0030 	strb	r0, [sp, #48]	; 0x30
    9a98:	e5150014 	ldr	r0, [r5, #-20]	; 0xffffffec
    9a9c:	e58d0000 	str	r0, [sp]
    9aa0:	e9150003 	ldmdb	r5, {r0, r1}
    9aa4:	e28f2008 	add	r2, pc, #8
    9aa8:	e7923100 	ldr	r3, [r2, r0, lsl #2]
    9aac:	e3a00000 	mov	r0, #0
    9ab0:	e082f003 	add	pc, r2, r3
    9ab4:	00000080 	.word	0x00000080
    9ab8:	00000010 	.word	0x00000010
    9abc:	00000044 	.word	0x00000044
    9ac0:	00000084 	.word	0x00000084
    9ac4:	e59d202c 	ldr	r2, [sp, #44]	; 0x2c
    9ac8:	e1520001 	cmp	r2, r1
    9acc:	9a0000a3 	bls	9d60 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x398>
    9ad0:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
    9ad4:	e0820181 	add	r0, r2, r1, lsl #3
    9ad8:	e5900004 	ldr	r0, [r0, #4]
    9adc:	e59f32bc 	ldr	r3, [pc, #700]	; 9da0 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x3d8>
    9ae0:	e08f3003 	add	r3, pc, r3
    9ae4:	e1500003 	cmp	r0, r3
    9ae8:	e3a00000 	mov	r0, #0
    9aec:	1a000011 	bne	9b38 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x170>
    9af0:	e7920181 	ldr	r0, [r2, r1, lsl #3]
    9af4:	ea00000d 	b	9b30 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x168>
    9af8:	e59d2020 	ldr	r2, [sp, #32]
    9afc:	e59d0024 	ldr	r0, [sp, #36]	; 0x24
    9b00:	e1520000 	cmp	r2, r0
    9b04:	e3a00000 	mov	r0, #0
    9b08:	0a00000a 	beq	9b38 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x170>
    9b0c:	e2820008 	add	r0, r2, #8
    9b10:	e58d0020 	str	r0, [sp, #32]
    9b14:	e5920004 	ldr	r0, [r2, #4]
    9b18:	e59f1284 	ldr	r1, [pc, #644]	; 9da4 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x3dc>
    9b1c:	e08f1001 	add	r1, pc, r1
    9b20:	e1500001 	cmp	r0, r1
    9b24:	e3a00000 	mov	r0, #0
    9b28:	1a000002 	bne	9b38 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x170>
    9b2c:	e5920000 	ldr	r0, [r2]
    9b30:	e5901000 	ldr	r1, [r0]
    9b34:	e3a00001 	mov	r0, #1
    9b38:	e58d100c 	str	r1, [sp, #12]
    9b3c:	e58d0008 	str	r0, [sp, #8]
    9b40:	e3a00000 	mov	r0, #0
    9b44:	e5152010 	ldr	r2, [r5, #-16]
    9b48:	e515100c 	ldr	r1, [r5, #-12]
    9b4c:	e28f3004 	add	r3, pc, #4
    9b50:	e7932102 	ldr	r2, [r3, r2, lsl #2]
    9b54:	e083f002 	add	pc, r3, r2
    9b58:	0000006c 	.word	0x0000006c
    9b5c:	00000010 	.word	0x00000010
    9b60:	00000038 	.word	0x00000038
    9b64:	00000070 	.word	0x00000070
    9b68:	e59d202c 	ldr	r2, [sp, #44]	; 0x2c
    9b6c:	e1520001 	cmp	r2, r1
    9b70:	9a00007a 	bls	9d60 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x398>
    9b74:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
    9b78:	e0823181 	add	r3, r2, r1, lsl #3
    9b7c:	e5933004 	ldr	r3, [r3, #4]
    9b80:	e1530007 	cmp	r3, r7
    9b84:	1a00000f 	bne	9bc8 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x200>
    9b88:	e7920181 	ldr	r0, [r2, r1, lsl #3]
    9b8c:	ea00000b 	b	9bc0 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x1f8>
    9b90:	e59d2020 	ldr	r2, [sp, #32]
    9b94:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
    9b98:	e1520001 	cmp	r2, r1
    9b9c:	0a000030 	beq	9c64 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x29c>
    9ba0:	e2821008 	add	r1, r2, #8
    9ba4:	e58d1020 	str	r1, [sp, #32]
    9ba8:	e5921004 	ldr	r1, [r2, #4]
    9bac:	e59f31f4 	ldr	r3, [pc, #500]	; 9da8 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x3e0>
    9bb0:	e08f3003 	add	r3, pc, r3
    9bb4:	e1510003 	cmp	r1, r3
    9bb8:	1a000002 	bne	9bc8 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x200>
    9bbc:	e5920000 	ldr	r0, [r2]
    9bc0:	e5901000 	ldr	r1, [r0]
    9bc4:	e3a00001 	mov	r0, #1
    9bc8:	e58d1014 	str	r1, [sp, #20]
    9bcc:	e58d0010 	str	r0, [sp, #16]
    9bd0:	e5150020 	ldr	r0, [r5, #-32]	; 0xffffffe0
    9bd4:	e3500001 	cmp	r0, #1
    9bd8:	1a000006 	bne	9bf8 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x230>
    9bdc:	e59d202c 	ldr	r2, [sp, #44]	; 0x2c
    9be0:	e515101c 	ldr	r1, [r5, #-28]	; 0xffffffe4
    9be4:	e1510002 	cmp	r1, r2
    9be8:	2a000060 	bcs	9d70 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x3a8>
    9bec:	e59d0028 	ldr	r0, [sp, #40]	; 0x28
    9bf0:	e0800181 	add	r0, r0, r1, lsl #3
    9bf4:	ea000005 	b	9c10 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x248>
    9bf8:	e59d0020 	ldr	r0, [sp, #32]
    9bfc:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
    9c00:	e1500001 	cmp	r0, r1
    9c04:	0a00005d 	beq	9d80 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x3b8>
    9c08:	e2801008 	add	r1, r0, #8
    9c0c:	e58d1020 	str	r1, [sp, #32]
    9c10:	e2801004 	add	r1, r0, #4
    9c14:	e5900000 	ldr	r0, [r0]
    9c18:	e5912000 	ldr	r2, [r1]
    9c1c:	e1a0100a 	mov	r1, sl
    9c20:	e12fff32 	blx	r2
    9c24:	e3500000 	cmp	r0, #0
    9c28:	1a000048 	bne	9d50 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x388>
    9c2c:	e1540009 	cmp	r4, r9
    9c30:	2a000034 	bcs	9d08 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x340>
    9c34:	e59d301c 	ldr	r3, [sp, #28]
    9c38:	e08b2186 	add	r2, fp, r6, lsl #3
    9c3c:	e59d0018 	ldr	r0, [sp, #24]
    9c40:	e5921008 	ldr	r1, [r2, #8]
    9c44:	e592200c 	ldr	r2, [r2, #12]
    9c48:	e593300c 	ldr	r3, [r3, #12]
    9c4c:	e12fff33 	blx	r3
    9c50:	e2855024 	add	r5, r5, #36	; 0x24
    9c54:	e2866001 	add	r6, r6, #1
    9c58:	e3500000 	cmp	r0, #0
    9c5c:	0affff88 	beq	9a84 <_ZN4core3fmt5write17hef5108bbb09fc778E+0xbc>
    9c60:	ea00003a 	b	9d50 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x388>
    9c64:	eaffffd7 	b	9bc8 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x200>
    9c68:	e5928004 	ldr	r8, [r2, #4]
    9c6c:	e592b000 	ldr	fp, [r2]
    9c70:	e1570008 	cmp	r7, r8
    9c74:	81a07008 	movhi	r7, r8
    9c78:	e3570000 	cmp	r7, #0
    9c7c:	0a000021 	beq	9d08 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x340>
    9c80:	e59b3000 	ldr	r3, [fp]
    9c84:	e591500c 	ldr	r5, [r1, #12]
    9c88:	e59b2004 	ldr	r2, [fp, #4]
    9c8c:	e1a01003 	mov	r1, r3
    9c90:	e12fff35 	blx	r5
    9c94:	e3a01001 	mov	r1, #1
    9c98:	e3500000 	cmp	r0, #0
    9c9c:	1a000016 	bne	9cfc <_ZN4core3fmt5write17hef5108bbb09fc778E+0x334>
    9ca0:	e3a05000 	mov	r5, #0
    9ca4:	e1a0a00d 	mov	sl, sp
    9ca8:	e1a01006 	mov	r1, r6
    9cac:	e7b10185 	ldr	r0, [r1, r5, lsl #3]!
    9cb0:	e5912004 	ldr	r2, [r1, #4]
    9cb4:	e1a0100a 	mov	r1, sl
    9cb8:	e12fff32 	blx	r2
    9cbc:	e3500000 	cmp	r0, #0
    9cc0:	1a000022 	bne	9d50 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x388>
    9cc4:	e2854001 	add	r4, r5, #1
    9cc8:	e1540007 	cmp	r4, r7
    9ccc:	2a00000d 	bcs	9d08 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x340>
    9cd0:	e59d301c 	ldr	r3, [sp, #28]
    9cd4:	e08b2185 	add	r2, fp, r5, lsl #3
    9cd8:	e59d0018 	ldr	r0, [sp, #24]
    9cdc:	e5921008 	ldr	r1, [r2, #8]
    9ce0:	e592200c 	ldr	r2, [r2, #12]
    9ce4:	e593300c 	ldr	r3, [r3, #12]
    9ce8:	e12fff33 	blx	r3
    9cec:	e2855001 	add	r5, r5, #1
    9cf0:	e3500000 	cmp	r0, #0
    9cf4:	0affffeb 	beq	9ca8 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x2e0>
    9cf8:	e3a01001 	mov	r1, #1
    9cfc:	e1a00001 	mov	r0, r1
    9d00:	e28dd034 	add	sp, sp, #52	; 0x34
    9d04:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    9d08:	e1580004 	cmp	r8, r4
    9d0c:	9a00000b 	bls	9d40 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x378>
    9d10:	e59d301c 	ldr	r3, [sp, #28]
    9d14:	e7bb1184 	ldr	r1, [fp, r4, lsl #3]!
    9d18:	e59d0018 	ldr	r0, [sp, #24]
    9d1c:	e59b2004 	ldr	r2, [fp, #4]
    9d20:	e593300c 	ldr	r3, [r3, #12]
    9d24:	e12fff33 	blx	r3
    9d28:	e3a01001 	mov	r1, #1
    9d2c:	e3500000 	cmp	r0, #0
    9d30:	03a01000 	moveq	r1, #0
    9d34:	e1a00001 	mov	r0, r1
    9d38:	e28dd034 	add	sp, sp, #52	; 0x34
    9d3c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    9d40:	e3a01000 	mov	r1, #0
    9d44:	e1a00001 	mov	r0, r1
    9d48:	e28dd034 	add	sp, sp, #52	; 0x34
    9d4c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    9d50:	e3a01001 	mov	r1, #1
    9d54:	e1a00001 	mov	r0, r1
    9d58:	e28dd034 	add	sp, sp, #52	; 0x34
    9d5c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    9d60:	e59f0044 	ldr	r0, [pc, #68]	; 9dac <_ZN4core3fmt5write17hef5108bbb09fc778E+0x3e4>
    9d64:	e08f0000 	add	r0, pc, r0
    9d68:	eb00048d 	bl	afa4 <_ZN4core9panicking18panic_bounds_check17h9369801762b8b5caE>
    9d6c:	e7ffdefe 	udf	#65006	; 0xfdee
    9d70:	e59f0040 	ldr	r0, [pc, #64]	; 9db8 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x3f0>
    9d74:	e08f0000 	add	r0, pc, r0
    9d78:	eb000489 	bl	afa4 <_ZN4core9panicking18panic_bounds_check17h9369801762b8b5caE>
    9d7c:	e7ffdefe 	udf	#65006	; 0xfdee
    9d80:	e59f0028 	ldr	r0, [pc, #40]	; 9db0 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x3e8>
    9d84:	e3a0102b 	mov	r1, #43	; 0x2b
    9d88:	e59f2024 	ldr	r2, [pc, #36]	; 9db4 <_ZN4core3fmt5write17hef5108bbb09fc778E+0x3ec>
    9d8c:	e08f0000 	add	r0, pc, r0
    9d90:	e08f2002 	add	r2, pc, r2
    9d94:	eb000470 	bl	af5c <_ZN4core9panicking5panic17h7b567084461090e7E>
    9d98:	e7ffdefe 	udf	#65006	; 0xfdee
    9d9c:	fffffde8 	.word	0xfffffde8
    9da0:	fffffd88 	.word	0xfffffd88
    9da4:	fffffd4c 	.word	0xfffffd4c
    9da8:	fffffcb8 	.word	0xfffffcb8
    9dac:	0000331c 	.word	0x0000331c
    9db0:	0000268c 	.word	0x0000268c
    9db4:	000032d0 	.word	0x000032d0
    9db8:	000032fc 	.word	0x000032fc

00009dbc <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE>:
    9dbc:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    9dc0:	e24dd004 	sub	sp, sp, #4
    9dc4:	e59d602c 	ldr	r6, [sp, #44]	; 0x2c
    9dc8:	e1a0a003 	mov	sl, r3
    9dcc:	e59d8028 	ldr	r8, [sp, #40]	; 0x28
    9dd0:	e1a0b002 	mov	fp, r2
    9dd4:	e1a04000 	mov	r4, r0
    9dd8:	e3510000 	cmp	r1, #0
    9ddc:	0a000026 	beq	9e7c <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0xc0>
    9de0:	e5940000 	ldr	r0, [r4]
    9de4:	e3a0902b 	mov	r9, #43	; 0x2b
    9de8:	e2101001 	ands	r1, r0, #1
    9dec:	03a09811 	moveq	r9, #1114112	; 0x110000
    9df0:	e0815006 	add	r5, r1, r6
    9df4:	e3100004 	tst	r0, #4
    9df8:	0a000024 	beq	9e90 <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0xd4>
    9dfc:	e3a01000 	mov	r1, #0
    9e00:	e35a0000 	cmp	sl, #0
    9e04:	0a000007 	beq	9e28 <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x6c>
    9e08:	e1a0200a 	mov	r2, sl
    9e0c:	e1a0300b 	mov	r3, fp
    9e10:	e4d37001 	ldrb	r7, [r3], #1
    9e14:	e20770c0 	and	r7, r7, #192	; 0xc0
    9e18:	e3570080 	cmp	r7, #128	; 0x80
    9e1c:	02811001 	addeq	r1, r1, #1
    9e20:	e2522001 	subs	r2, r2, #1
    9e24:	1afffff9 	bne	9e10 <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x54>
    9e28:	e085200a 	add	r2, r5, sl
    9e2c:	e0425001 	sub	r5, r2, r1
    9e30:	e5941008 	ldr	r1, [r4, #8]
    9e34:	e3510001 	cmp	r1, #1
    9e38:	0a000019 	beq	9ea4 <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0xe8>
    9e3c:	e1a00004 	mov	r0, r4
    9e40:	e1a01009 	mov	r1, r9
    9e44:	e1a0200b 	mov	r2, fp
    9e48:	e1a0300a 	mov	r3, sl
    9e4c:	eb0000bc 	bl	a144 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17had0cfcd46ba89c54E>
    9e50:	e3a05001 	mov	r5, #1
    9e54:	e3500000 	cmp	r0, #0
    9e58:	1a0000b6 	bne	a138 <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x37c>
    9e5c:	e594101c 	ldr	r1, [r4, #28]
    9e60:	e5940018 	ldr	r0, [r4, #24]
    9e64:	e591300c 	ldr	r3, [r1, #12]
    9e68:	e1a01008 	mov	r1, r8
    9e6c:	e1a02006 	mov	r2, r6
    9e70:	e28dd004 	add	sp, sp, #4
    9e74:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    9e78:	e12fff13 	bx	r3
    9e7c:	e5940000 	ldr	r0, [r4]
    9e80:	e2865001 	add	r5, r6, #1
    9e84:	e3a0902d 	mov	r9, #45	; 0x2d
    9e88:	e3100004 	tst	r0, #4
    9e8c:	1affffda 	bne	9dfc <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x40>
    9e90:	e3a0a000 	mov	sl, #0
    9e94:	e3a0b000 	mov	fp, #0
    9e98:	e5941008 	ldr	r1, [r4, #8]
    9e9c:	e3510001 	cmp	r1, #1
    9ea0:	1affffe5 	bne	9e3c <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x80>
    9ea4:	e1a07008 	mov	r7, r8
    9ea8:	e594800c 	ldr	r8, [r4, #12]
    9eac:	e1580005 	cmp	r8, r5
    9eb0:	9a000010 	bls	9ef8 <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x13c>
    9eb4:	e3100008 	tst	r0, #8
    9eb8:	1a00001e 	bne	9f38 <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x17c>
    9ebc:	e5d41030 	ldrb	r1, [r4, #48]	; 0x30
    9ec0:	e28f2014 	add	r2, pc, #20
    9ec4:	e0488005 	sub	r8, r8, r5
    9ec8:	e3a00000 	mov	r0, #0
    9ecc:	e3510003 	cmp	r1, #3
    9ed0:	03001001 	movweq	r1, #1
    9ed4:	e7921101 	ldr	r1, [r2, r1, lsl #2]
    9ed8:	e082f001 	add	pc, r2, r1
    9edc:	000000e4 	.word	0x000000e4
    9ee0:	00000010 	.word	0x00000010
    9ee4:	000000d8 	.word	0x000000d8
    9ee8:	00000010 	.word	0x00000010
    9eec:	e1a00008 	mov	r0, r8
    9ef0:	e3a08000 	mov	r8, #0
    9ef4:	ea000031 	b	9fc0 <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x204>
    9ef8:	e1a00004 	mov	r0, r4
    9efc:	e1a01009 	mov	r1, r9
    9f00:	e1a0200b 	mov	r2, fp
    9f04:	e1a0300a 	mov	r3, sl
    9f08:	eb00008d 	bl	a144 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17had0cfcd46ba89c54E>
    9f0c:	e3a05001 	mov	r5, #1
    9f10:	e3500000 	cmp	r0, #0
    9f14:	1a000087 	bne	a138 <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x37c>
    9f18:	e594301c 	ldr	r3, [r4, #28]
    9f1c:	e1a01007 	mov	r1, r7
    9f20:	e5940018 	ldr	r0, [r4, #24]
    9f24:	e593300c 	ldr	r3, [r3, #12]
    9f28:	e1a02006 	mov	r2, r6
    9f2c:	e28dd004 	add	sp, sp, #4
    9f30:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    9f34:	e12fff13 	bx	r3
    9f38:	e3a00001 	mov	r0, #1
    9f3c:	e1a01009 	mov	r1, r9
    9f40:	e5c40030 	strb	r0, [r4, #48]	; 0x30
    9f44:	e3a00030 	mov	r0, #48	; 0x30
    9f48:	e5840004 	str	r0, [r4, #4]
    9f4c:	e1a00004 	mov	r0, r4
    9f50:	e1a0200b 	mov	r2, fp
    9f54:	e1a0300a 	mov	r3, sl
    9f58:	eb000079 	bl	a144 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17had0cfcd46ba89c54E>
    9f5c:	e3500000 	cmp	r0, #0
    9f60:	0a000003 	beq	9f74 <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x1b8>
    9f64:	e3a05001 	mov	r5, #1
    9f68:	e1a00005 	mov	r0, r5
    9f6c:	e28dd004 	add	sp, sp, #4
    9f70:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    9f74:	e5d41030 	ldrb	r1, [r4, #48]	; 0x30
    9f78:	e28f2018 	add	r2, pc, #24
    9f7c:	e0489005 	sub	r9, r8, r5
    9f80:	e3a00000 	mov	r0, #0
    9f84:	e3510003 	cmp	r1, #3
    9f88:	e1a08006 	mov	r8, r6
    9f8c:	03001001 	movweq	r1, #1
    9f90:	e7921101 	ldr	r1, [r2, r1, lsl #2]
    9f94:	e082f001 	add	pc, r2, r1
    9f98:	000000ec 	.word	0x000000ec
    9f9c:	00000010 	.word	0x00000010
    9fa0:	000000e0 	.word	0x000000e0
    9fa4:	00000010 	.word	0x00000010
    9fa8:	e1a00009 	mov	r0, r9
    9fac:	e3a09000 	mov	r9, #0
    9fb0:	ea000033 	b	a084 <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x2c8>
    9fb4:	e2881001 	add	r1, r8, #1
    9fb8:	e1a000a8 	lsr	r0, r8, #1
    9fbc:	e1a080a1 	lsr	r8, r1, #1
    9fc0:	e2805001 	add	r5, r0, #1
    9fc4:	e2555001 	subs	r5, r5, #1
    9fc8:	0a00000a 	beq	9ff8 <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x23c>
    9fcc:	e594201c 	ldr	r2, [r4, #28]
    9fd0:	e5941004 	ldr	r1, [r4, #4]
    9fd4:	e5940018 	ldr	r0, [r4, #24]
    9fd8:	e5922010 	ldr	r2, [r2, #16]
    9fdc:	e12fff32 	blx	r2
    9fe0:	e3500000 	cmp	r0, #0
    9fe4:	0afffff6 	beq	9fc4 <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x208>
    9fe8:	e3a05001 	mov	r5, #1
    9fec:	e1a00005 	mov	r0, r5
    9ff0:	e28dd004 	add	sp, sp, #4
    9ff4:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    9ff8:	e1a00004 	mov	r0, r4
    9ffc:	e1a01009 	mov	r1, r9
    a000:	e1a0200b 	mov	r2, fp
    a004:	e1a0300a 	mov	r3, sl
    a008:	e58d6000 	str	r6, [sp]
    a00c:	e5946004 	ldr	r6, [r4, #4]
    a010:	eb00004b 	bl	a144 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17had0cfcd46ba89c54E>
    a014:	e3a05001 	mov	r5, #1
    a018:	e3500000 	cmp	r0, #0
    a01c:	1a000045 	bne	a138 <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x37c>
    a020:	e594101c 	ldr	r1, [r4, #28]
    a024:	e1a0a006 	mov	sl, r6
    a028:	e5940018 	ldr	r0, [r4, #24]
    a02c:	e59d2000 	ldr	r2, [sp]
    a030:	e591300c 	ldr	r3, [r1, #12]
    a034:	e1a01007 	mov	r1, r7
    a038:	e12fff33 	blx	r3
    a03c:	e3500000 	cmp	r0, #0
    a040:	1a00003c 	bne	a138 <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x37c>
    a044:	e5949018 	ldr	r9, [r4, #24]
    a048:	e2886001 	add	r6, r8, #1
    a04c:	e594401c 	ldr	r4, [r4, #28]
    a050:	e1a0700a 	mov	r7, sl
    a054:	e2566001 	subs	r6, r6, #1
    a058:	0a000031 	beq	a124 <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x368>
    a05c:	e5942010 	ldr	r2, [r4, #16]
    a060:	e1a00009 	mov	r0, r9
    a064:	e1a01007 	mov	r1, r7
    a068:	e12fff32 	blx	r2
    a06c:	e3500000 	cmp	r0, #0
    a070:	0afffff7 	beq	a054 <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x298>
    a074:	ea00002f 	b	a138 <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x37c>
    a078:	e2891001 	add	r1, r9, #1
    a07c:	e1a000a9 	lsr	r0, r9, #1
    a080:	e1a090a1 	lsr	r9, r1, #1
    a084:	e2805001 	add	r5, r0, #1
    a088:	e2555001 	subs	r5, r5, #1
    a08c:	0a00000a 	beq	a0bc <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x300>
    a090:	e594201c 	ldr	r2, [r4, #28]
    a094:	e5941004 	ldr	r1, [r4, #4]
    a098:	e5940018 	ldr	r0, [r4, #24]
    a09c:	e5922010 	ldr	r2, [r2, #16]
    a0a0:	e12fff32 	blx	r2
    a0a4:	e3500000 	cmp	r0, #0
    a0a8:	0afffff6 	beq	a088 <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x2cc>
    a0ac:	e3a05001 	mov	r5, #1
    a0b0:	e1a00005 	mov	r0, r5
    a0b4:	e28dd004 	add	sp, sp, #4
    a0b8:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    a0bc:	e594101c 	ldr	r1, [r4, #28]
    a0c0:	e1a02008 	mov	r2, r8
    a0c4:	e5940018 	ldr	r0, [r4, #24]
    a0c8:	e594a004 	ldr	sl, [r4, #4]
    a0cc:	e591300c 	ldr	r3, [r1, #12]
    a0d0:	e1a01007 	mov	r1, r7
    a0d4:	e12fff33 	blx	r3
    a0d8:	e3500000 	cmp	r0, #0
    a0dc:	0a000003 	beq	a0f0 <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x334>
    a0e0:	e3a05001 	mov	r5, #1
    a0e4:	e1a00005 	mov	r0, r5
    a0e8:	e28dd004 	add	sp, sp, #4
    a0ec:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    a0f0:	e5946018 	ldr	r6, [r4, #24]
    a0f4:	e2897001 	add	r7, r9, #1
    a0f8:	e594401c 	ldr	r4, [r4, #28]
    a0fc:	e3a05001 	mov	r5, #1
    a100:	e2577001 	subs	r7, r7, #1
    a104:	0a00000a 	beq	a134 <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x378>
    a108:	e5942010 	ldr	r2, [r4, #16]
    a10c:	e1a00006 	mov	r0, r6
    a110:	e1a0100a 	mov	r1, sl
    a114:	e12fff32 	blx	r2
    a118:	e3500000 	cmp	r0, #0
    a11c:	0afffff7 	beq	a100 <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x344>
    a120:	ea000004 	b	a138 <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE+0x37c>
    a124:	e3a05000 	mov	r5, #0
    a128:	e1a00005 	mov	r0, r5
    a12c:	e28dd004 	add	sp, sp, #4
    a130:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    a134:	e3a05000 	mov	r5, #0
    a138:	e1a00005 	mov	r0, r5
    a13c:	e28dd004 	add	sp, sp, #4
    a140:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

0000a144 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17had0cfcd46ba89c54E>:
    a144:	e92d4070 	push	{r4, r5, r6, lr}
    a148:	e1a04003 	mov	r4, r3
    a14c:	e1a05002 	mov	r5, r2
    a150:	e1a06000 	mov	r6, r0
    a154:	e3510811 	cmp	r1, #1114112	; 0x110000
    a158:	0a000007 	beq	a17c <_ZN4core3fmt9Formatter12pad_integral12write_prefix17had0cfcd46ba89c54E+0x38>
    a15c:	e596201c 	ldr	r2, [r6, #28]
    a160:	e5960018 	ldr	r0, [r6, #24]
    a164:	e5922010 	ldr	r2, [r2, #16]
    a168:	e12fff32 	blx	r2
    a16c:	e1a01000 	mov	r1, r0
    a170:	e3a00001 	mov	r0, #1
    a174:	e3510000 	cmp	r1, #0
    a178:	1a000009 	bne	a1a4 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17had0cfcd46ba89c54E+0x60>
    a17c:	e3550000 	cmp	r5, #0
    a180:	0a000006 	beq	a1a0 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17had0cfcd46ba89c54E+0x5c>
    a184:	e596101c 	ldr	r1, [r6, #28]
    a188:	e1a02004 	mov	r2, r4
    a18c:	e5960018 	ldr	r0, [r6, #24]
    a190:	e591300c 	ldr	r3, [r1, #12]
    a194:	e1a01005 	mov	r1, r5
    a198:	e8bd4070 	pop	{r4, r5, r6, lr}
    a19c:	e12fff13 	bx	r3
    a1a0:	e3a00000 	mov	r0, #0
    a1a4:	e8bd8070 	pop	{r4, r5, r6, pc}

0000a1a8 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E>:
    a1a8:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    a1ac:	e24dd004 	sub	sp, sp, #4
    a1b0:	e590e008 	ldr	lr, [r0, #8]
    a1b4:	e1a04000 	mov	r4, r0
    a1b8:	e5900010 	ldr	r0, [r0, #16]
    a1bc:	e1a09002 	mov	r9, r2
    a1c0:	e1a08001 	mov	r8, r1
    a1c4:	e35e0001 	cmp	lr, #1
    a1c8:	1a000005 	bne	a1e4 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x3c>
    a1cc:	e3500001 	cmp	r0, #1
    a1d0:	0a000005 	beq	a1ec <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x44>
    a1d4:	e3a00000 	mov	r0, #0
    a1d8:	e3590000 	cmp	r9, #0
    a1dc:	1a000067 	bne	a380 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x1d8>
    a1e0:	ea00006e 	b	a3a0 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x1f8>
    a1e4:	e3500001 	cmp	r0, #1
    a1e8:	1a00008c 	bne	a420 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x278>
    a1ec:	e3590000 	cmp	r9, #0
    a1f0:	0a00000c 	beq	a228 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x80>
    a1f4:	e1a05008 	mov	r5, r8
    a1f8:	e5942014 	ldr	r2, [r4, #20]
    a1fc:	e0d500d1 	ldrsb	r0, [r5], #1
    a200:	e0886009 	add	r6, r8, r9
    a204:	e3700001 	cmn	r0, #1
    a208:	da00003d 	ble	a304 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x15c>
    a20c:	e3520000 	cmp	r2, #0
    a210:	0a00004a 	beq	a340 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x198>
    a214:	e0450008 	sub	r0, r5, r8
    a218:	e3a0c707 	mov	ip, #1835008	; 0x1c0000
    a21c:	e1560005 	cmp	r6, r5
    a220:	1a000013 	bne	a274 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0xcc>
    a224:	ea0000d6 	b	a584 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x3dc>
    a228:	e3a02000 	mov	r2, #0
    a22c:	e35e0001 	cmp	lr, #1
    a230:	0a00004e 	beq	a370 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x1c8>
    a234:	e594101c 	ldr	r1, [r4, #28]
    a238:	ea00007a 	b	a428 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x280>
    a23c:	e4d15001 	ldrb	r5, [r1], #1
    a240:	e205b03f 	and	fp, r5, #63	; 0x3f
    a244:	e1a05001 	mov	r5, r1
    a248:	e00c0900 	and	r0, ip, r0, lsl #18
    a24c:	e180030a 	orr	r0, r0, sl, lsl #6
    a250:	e180000b 	orr	r0, r0, fp
    a254:	e3500811 	cmp	r0, #1114112	; 0x110000
    a258:	0a0000c9 	beq	a584 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x3dc>
    a25c:	e0470003 	sub	r0, r7, r3
    a260:	e2522001 	subs	r2, r2, #1
    a264:	e0800005 	add	r0, r0, r5
    a268:	0a000036 	beq	a348 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x1a0>
    a26c:	e1560005 	cmp	r6, r5
    a270:	0a0000c3 	beq	a584 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x3dc>
    a274:	e1a07000 	mov	r7, r0
    a278:	e1a03005 	mov	r3, r5
    a27c:	e0d500d1 	ldrsb	r0, [r5], #1
    a280:	e3700001 	cmn	r0, #1
    a284:	cafffff4 	bgt	a25c <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0xb4>
    a288:	e6ef0070 	uxtb	r0, r0
    a28c:	e1550006 	cmp	r5, r6
    a290:	0a000011 	beq	a2dc <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x134>
    a294:	e5d31001 	ldrb	r1, [r3, #1]
    a298:	e2835002 	add	r5, r3, #2
    a29c:	e201a03f 	and	sl, r1, #63	; 0x3f
    a2a0:	e1a01005 	mov	r1, r5
    a2a4:	e35000e0 	cmp	r0, #224	; 0xe0
    a2a8:	3affffeb 	bcc	a25c <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0xb4>
    a2ac:	e1510006 	cmp	r1, r6
    a2b0:	0a00000e 	beq	a2f0 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x148>
    a2b4:	e4d15001 	ldrb	r5, [r1], #1
    a2b8:	e205b03f 	and	fp, r5, #63	; 0x3f
    a2bc:	e1a05001 	mov	r5, r1
    a2c0:	e35000f0 	cmp	r0, #240	; 0xf0
    a2c4:	3affffe4 	bcc	a25c <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0xb4>
    a2c8:	e18ba30a 	orr	sl, fp, sl, lsl #6
    a2cc:	e1510006 	cmp	r1, r6
    a2d0:	1affffd9 	bne	a23c <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x94>
    a2d4:	e3a0b000 	mov	fp, #0
    a2d8:	eaffffda 	b	a248 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0xa0>
    a2dc:	e3a0a000 	mov	sl, #0
    a2e0:	e1a01006 	mov	r1, r6
    a2e4:	e35000e0 	cmp	r0, #224	; 0xe0
    a2e8:	3affffdb 	bcc	a25c <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0xb4>
    a2ec:	eaffffee 	b	a2ac <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x104>
    a2f0:	e3a0b000 	mov	fp, #0
    a2f4:	e1a01006 	mov	r1, r6
    a2f8:	e35000f0 	cmp	r0, #240	; 0xf0
    a2fc:	3affffd6 	bcc	a25c <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0xb4>
    a300:	eafffff0 	b	a2c8 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x120>
    a304:	e6ef3070 	uxtb	r3, r0
    a308:	e3590001 	cmp	r9, #1
    a30c:	1a000074 	bne	a4e4 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x33c>
    a310:	e3a00000 	mov	r0, #0
    a314:	e1a07006 	mov	r7, r6
    a318:	e35300e0 	cmp	r3, #224	; 0xe0
    a31c:	3affffba 	bcc	a20c <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x64>
    a320:	e1570006 	cmp	r7, r6
    a324:	0a000084 	beq	a53c <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x394>
    a328:	e4d71001 	ldrb	r1, [r7], #1
    a32c:	e201103f 	and	r1, r1, #63	; 0x3f
    a330:	e1a05007 	mov	r5, r7
    a334:	e35300f0 	cmp	r3, #240	; 0xf0
    a338:	2a000083 	bcs	a54c <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x3a4>
    a33c:	eaffffb2 	b	a20c <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x64>
    a340:	e3a07000 	mov	r7, #0
    a344:	ea000002 	b	a354 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x1ac>
    a348:	e3570000 	cmp	r7, #0
    a34c:	11570009 	cmpne	r7, r9
    a350:	1a00006f 	bne	a514 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x36c>
    a354:	e1a00008 	mov	r0, r8
    a358:	e1a02007 	mov	r2, r7
    a35c:	e3500000 	cmp	r0, #0
    a360:	01a02009 	moveq	r2, r9
    a364:	11a08000 	movne	r8, r0
    a368:	e35e0001 	cmp	lr, #1
    a36c:	1affffb0 	bne	a234 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x8c>
    a370:	e1a09002 	mov	r9, r2
    a374:	e3a00000 	mov	r0, #0
    a378:	e3590000 	cmp	r9, #0
    a37c:	0a000007 	beq	a3a0 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x1f8>
    a380:	e1a01009 	mov	r1, r9
    a384:	e1a02008 	mov	r2, r8
    a388:	e4d23001 	ldrb	r3, [r2], #1
    a38c:	e20330c0 	and	r3, r3, #192	; 0xc0
    a390:	e3530080 	cmp	r3, #128	; 0x80
    a394:	02800001 	addeq	r0, r0, #1
    a398:	e2511001 	subs	r1, r1, #1
    a39c:	1afffff9 	bne	a388 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x1e0>
    a3a0:	e594100c 	ldr	r1, [r4, #12]
    a3a4:	e0490000 	sub	r0, r9, r0
    a3a8:	e1500001 	cmp	r0, r1
    a3ac:	2a00001b 	bcs	a420 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x278>
    a3b0:	e3a00000 	mov	r0, #0
    a3b4:	e3590000 	cmp	r9, #0
    a3b8:	e3a02000 	mov	r2, #0
    a3bc:	0a000008 	beq	a3e4 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x23c>
    a3c0:	e3a02000 	mov	r2, #0
    a3c4:	e1a03009 	mov	r3, r9
    a3c8:	e1a07008 	mov	r7, r8
    a3cc:	e4d76001 	ldrb	r6, [r7], #1
    a3d0:	e20660c0 	and	r6, r6, #192	; 0xc0
    a3d4:	e3560080 	cmp	r6, #128	; 0x80
    a3d8:	02822001 	addeq	r2, r2, #1
    a3dc:	e2533001 	subs	r3, r3, #1
    a3e0:	1afffff9 	bne	a3cc <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x224>
    a3e4:	e5d47030 	ldrb	r7, [r4, #48]	; 0x30
    a3e8:	e0422009 	sub	r2, r2, r9
    a3ec:	e0825001 	add	r5, r2, r1
    a3f0:	e28f100c 	add	r1, pc, #12
    a3f4:	e2573003 	subs	r3, r7, #3
    a3f8:	11a03007 	movne	r3, r7
    a3fc:	e7912103 	ldr	r2, [r1, r3, lsl #2]
    a400:	e081f002 	add	pc, r1, r2
    a404:	00000048 	.word	0x00000048
    a408:	00000010 	.word	0x00000010
    a40c:	0000003c 	.word	0x0000003c
    a410:	00000010 	.word	0x00000010
    a414:	e1a00005 	mov	r0, r5
    a418:	e3a05000 	mov	r5, #0
    a41c:	ea00000a 	b	a44c <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x2a4>
    a420:	e594101c 	ldr	r1, [r4, #28]
    a424:	e1a02009 	mov	r2, r9
    a428:	e5940018 	ldr	r0, [r4, #24]
    a42c:	e591300c 	ldr	r3, [r1, #12]
    a430:	e1a01008 	mov	r1, r8
    a434:	e28dd004 	add	sp, sp, #4
    a438:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    a43c:	e12fff13 	bx	r3
    a440:	e2851001 	add	r1, r5, #1
    a444:	e1a000a5 	lsr	r0, r5, #1
    a448:	e1a050a1 	lsr	r5, r1, #1
    a44c:	e2806001 	add	r6, r0, #1
    a450:	e2566001 	subs	r6, r6, #1
    a454:	0a00000a 	beq	a484 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x2dc>
    a458:	e594201c 	ldr	r2, [r4, #28]
    a45c:	e5941004 	ldr	r1, [r4, #4]
    a460:	e5940018 	ldr	r0, [r4, #24]
    a464:	e5922010 	ldr	r2, [r2, #16]
    a468:	e12fff32 	blx	r2
    a46c:	e3500000 	cmp	r0, #0
    a470:	0afffff6 	beq	a450 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x2a8>
    a474:	e3a08001 	mov	r8, #1
    a478:	e1a00008 	mov	r0, r8
    a47c:	e28dd004 	add	sp, sp, #4
    a480:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    a484:	e594101c 	ldr	r1, [r4, #28]
    a488:	e1a02009 	mov	r2, r9
    a48c:	e5940018 	ldr	r0, [r4, #24]
    a490:	e5947004 	ldr	r7, [r4, #4]
    a494:	e591300c 	ldr	r3, [r1, #12]
    a498:	e1a01008 	mov	r1, r8
    a49c:	e12fff33 	blx	r3
    a4a0:	e3a08001 	mov	r8, #1
    a4a4:	e3500000 	cmp	r0, #0
    a4a8:	1a00000a 	bne	a4d8 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x330>
    a4ac:	e5946018 	ldr	r6, [r4, #24]
    a4b0:	e2855001 	add	r5, r5, #1
    a4b4:	e594401c 	ldr	r4, [r4, #28]
    a4b8:	e2555001 	subs	r5, r5, #1
    a4bc:	0a000010 	beq	a504 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x35c>
    a4c0:	e5942010 	ldr	r2, [r4, #16]
    a4c4:	e1a00006 	mov	r0, r6
    a4c8:	e1a01007 	mov	r1, r7
    a4cc:	e12fff32 	blx	r2
    a4d0:	e3500000 	cmp	r0, #0
    a4d4:	0afffff7 	beq	a4b8 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x310>
    a4d8:	e1a00008 	mov	r0, r8
    a4dc:	e28dd004 	add	sp, sp, #4
    a4e0:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    a4e4:	e5d80001 	ldrb	r0, [r8, #1]
    a4e8:	e2885002 	add	r5, r8, #2
    a4ec:	e200003f 	and	r0, r0, #63	; 0x3f
    a4f0:	e1a07005 	mov	r7, r5
    a4f4:	e1a00300 	lsl	r0, r0, #6
    a4f8:	e35300e0 	cmp	r3, #224	; 0xe0
    a4fc:	2affff87 	bcs	a320 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x178>
    a500:	eaffff41 	b	a20c <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x64>
    a504:	e3a08000 	mov	r8, #0
    a508:	e1a00008 	mov	r0, r8
    a50c:	e28dd004 	add	sp, sp, #4
    a510:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    a514:	e3a00000 	mov	r0, #0
    a518:	e3a02000 	mov	r2, #0
    a51c:	2affff8e 	bcs	a35c <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x1b4>
    a520:	e0880007 	add	r0, r8, r7
    a524:	e3a02000 	mov	r2, #0
    a528:	e1d010d0 	ldrsb	r1, [r0]
    a52c:	e3a00000 	mov	r0, #0
    a530:	e3710040 	cmn	r1, #64	; 0x40
    a534:	aaffff86 	bge	a354 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x1ac>
    a538:	eaffff87 	b	a35c <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x1b4>
    a53c:	e3a01000 	mov	r1, #0
    a540:	e1a07006 	mov	r7, r6
    a544:	e35300f0 	cmp	r3, #240	; 0xf0
    a548:	3affff2f 	bcc	a20c <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x64>
    a54c:	e1810000 	orr	r0, r1, r0
    a550:	e1570006 	cmp	r7, r6
    a554:	0a000003 	beq	a568 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x3c0>
    a558:	e4d71001 	ldrb	r1, [r7], #1
    a55c:	e201103f 	and	r1, r1, #63	; 0x3f
    a560:	e1a05007 	mov	r5, r7
    a564:	ea000000 	b	a56c <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x3c4>
    a568:	e3a01000 	mov	r1, #0
    a56c:	e3a07707 	mov	r7, #1835008	; 0x1c0000
    a570:	e0073903 	and	r3, r7, r3, lsl #18
    a574:	e1830300 	orr	r0, r3, r0, lsl #6
    a578:	e1800001 	orr	r0, r0, r1
    a57c:	e3500811 	cmp	r0, #1114112	; 0x110000
    a580:	1affff21 	bne	a20c <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x64>
    a584:	e1a02009 	mov	r2, r9
    a588:	e35e0001 	cmp	lr, #1
    a58c:	1affff28 	bne	a234 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x8c>
    a590:	eaffff76 	b	a370 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E+0x1c8>

0000a594 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE>:
    a594:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    a598:	e24dd03c 	sub	sp, sp, #60	; 0x3c
    a59c:	e58d1018 	str	r1, [sp, #24]
    a5a0:	e1a04002 	mov	r4, r2
    a5a4:	e592101c 	ldr	r1, [r2, #28]
    a5a8:	e58d001c 	str	r0, [sp, #28]
    a5ac:	e5920018 	ldr	r0, [r2, #24]
    a5b0:	e5912010 	ldr	r2, [r1, #16]
    a5b4:	e3a01022 	mov	r1, #34	; 0x22
    a5b8:	e12fff32 	blx	r2
    a5bc:	e3500000 	cmp	r0, #0
    a5c0:	1a00015f 	bne	ab44 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x5b0>
    a5c4:	e59d2018 	ldr	r2, [sp, #24]
    a5c8:	e3520000 	cmp	r2, #0
    a5cc:	0a000143 	beq	aae0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x54c>
    a5d0:	e59d801c 	ldr	r8, [sp, #28]
    a5d4:	e3a0b000 	mov	fp, #0
    a5d8:	e3a09000 	mov	r9, #0
    a5dc:	e0885002 	add	r5, r8, r2
    a5e0:	e58d5010 	str	r5, [sp, #16]
    a5e4:	e1a00008 	mov	r0, r8
    a5e8:	e58d8014 	str	r8, [sp, #20]
    a5ec:	e0d010d1 	ldrsb	r1, [r0], #1
    a5f0:	e3710001 	cmn	r1, #1
    a5f4:	e6efa071 	uxtb	sl, r1
    a5f8:	da000005 	ble	a614 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x80>
    a5fc:	e1a08000 	mov	r8, r0
    a600:	e24a0009 	sub	r0, sl, #9
    a604:	e3a06002 	mov	r6, #2
    a608:	e350001e 	cmp	r0, #30
    a60c:	9a000037 	bls	a6f0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x15c>
    a610:	ea00005b 	b	a784 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x1f0>
    a614:	e1500005 	cmp	r0, r5
    a618:	0a000013 	beq	a66c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0xd8>
    a61c:	e5d81001 	ldrb	r1, [r8, #1]
    a620:	e2880002 	add	r0, r8, #2
    a624:	e201203f 	and	r2, r1, #63	; 0x3f
    a628:	e1a08000 	mov	r8, r0
    a62c:	e20a101f 	and	r1, sl, #31
    a630:	e35a00df 	cmp	sl, #223	; 0xdf
    a634:	9a000011 	bls	a680 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0xec>
    a638:	e1580005 	cmp	r8, r5
    a63c:	0a000011 	beq	a688 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0xf4>
    a640:	e4d80001 	ldrb	r0, [r8], #1
    a644:	e200303f 	and	r3, r0, #63	; 0x3f
    a648:	e1a00008 	mov	r0, r8
    a64c:	e1832302 	orr	r2, r3, r2, lsl #6
    a650:	e35a00f0 	cmp	sl, #240	; 0xf0
    a654:	3a000010 	bcc	a69c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x108>
    a658:	e1580005 	cmp	r8, r5
    a65c:	0a000016 	beq	a6bc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x128>
    a660:	e4d80001 	ldrb	r0, [r8], #1
    a664:	e200303f 	and	r3, r0, #63	; 0x3f
    a668:	ea000015 	b	a6c4 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x130>
    a66c:	e3a02000 	mov	r2, #0
    a670:	e1a08005 	mov	r8, r5
    a674:	e20a101f 	and	r1, sl, #31
    a678:	e35a00df 	cmp	sl, #223	; 0xdf
    a67c:	8affffed 	bhi	a638 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0xa4>
    a680:	e182a301 	orr	sl, r2, r1, lsl #6
    a684:	ea000005 	b	a6a0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x10c>
    a688:	e3a03000 	mov	r3, #0
    a68c:	e1a08005 	mov	r8, r5
    a690:	e1832302 	orr	r2, r3, r2, lsl #6
    a694:	e35a00f0 	cmp	sl, #240	; 0xf0
    a698:	2affffee 	bcs	a658 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0xc4>
    a69c:	e182a601 	orr	sl, r2, r1, lsl #12
    a6a0:	e1a08000 	mov	r8, r0
    a6a4:	e59d2018 	ldr	r2, [sp, #24]
    a6a8:	e24a0009 	sub	r0, sl, #9
    a6ac:	e3a06002 	mov	r6, #2
    a6b0:	e350001e 	cmp	r0, #30
    a6b4:	9a00000d 	bls	a6f0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x15c>
    a6b8:	ea000031 	b	a784 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x1f0>
    a6bc:	e3a03000 	mov	r3, #0
    a6c0:	e1a08000 	mov	r8, r0
    a6c4:	e3a00707 	mov	r0, #1835008	; 0x1c0000
    a6c8:	e0000901 	and	r0, r0, r1, lsl #18
    a6cc:	e1800302 	orr	r0, r0, r2, lsl #6
    a6d0:	e59d2018 	ldr	r2, [sp, #24]
    a6d4:	e180a003 	orr	sl, r0, r3
    a6d8:	e35a0811 	cmp	sl, #1114112	; 0x110000
    a6dc:	0a000100 	beq	aae4 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x550>
    a6e0:	e24a0009 	sub	r0, sl, #9
    a6e4:	e3a06002 	mov	r6, #2
    a6e8:	e350001e 	cmp	r0, #30
    a6ec:	8a000024 	bhi	a784 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x1f0>
    a6f0:	e28f1008 	add	r1, pc, #8
    a6f4:	e3a07074 	mov	r7, #116	; 0x74
    a6f8:	e7910100 	ldr	r0, [r1, r0, lsl #2]
    a6fc:	e081f000 	add	pc, r1, r0
    a700:	00000100 	.word	0x00000100
    a704:	0000007c 	.word	0x0000007c
    a708:	00000094 	.word	0x00000094
    a70c:	00000094 	.word	0x00000094
    a710:	000000fc 	.word	0x000000fc
    a714:	00000094 	.word	0x00000094
    a718:	00000094 	.word	0x00000094
    a71c:	00000094 	.word	0x00000094
    a720:	00000094 	.word	0x00000094
    a724:	00000094 	.word	0x00000094
    a728:	00000094 	.word	0x00000094
    a72c:	00000094 	.word	0x00000094
    a730:	00000094 	.word	0x00000094
    a734:	00000094 	.word	0x00000094
    a738:	00000094 	.word	0x00000094
    a73c:	00000094 	.word	0x00000094
    a740:	00000094 	.word	0x00000094
    a744:	00000094 	.word	0x00000094
    a748:	00000094 	.word	0x00000094
    a74c:	00000094 	.word	0x00000094
    a750:	00000094 	.word	0x00000094
    a754:	00000094 	.word	0x00000094
    a758:	00000094 	.word	0x00000094
    a75c:	00000094 	.word	0x00000094
    a760:	00000094 	.word	0x00000094
    a764:	0000008c 	.word	0x0000008c
    a768:	00000094 	.word	0x00000094
    a76c:	00000094 	.word	0x00000094
    a770:	00000094 	.word	0x00000094
    a774:	00000094 	.word	0x00000094
    a778:	0000008c 	.word	0x0000008c
    a77c:	e3a0706e 	mov	r7, #110	; 0x6e
    a780:	ea00001e 	b	a800 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x26c>
    a784:	e35a005c 	cmp	sl, #92	; 0x5c
    a788:	1a000001 	bne	a794 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x200>
    a78c:	e1a0700a 	mov	r7, sl
    a790:	ea00001a 	b	a800 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x26c>
    a794:	e59f03f4 	ldr	r0, [pc, #1012]	; ab90 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x5fc>
    a798:	e1a0100a 	mov	r1, sl
    a79c:	e08f0000 	add	r0, pc, r0
    a7a0:	eb000225 	bl	b03c <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h7af027d666565b85E>
    a7a4:	e59d5010 	ldr	r5, [sp, #16]
    a7a8:	e3500000 	cmp	r0, #0
    a7ac:	1a0000b1 	bne	aa78 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x4e4>
    a7b0:	e35a0801 	cmp	sl, #65536	; 0x10000
    a7b4:	2a000084 	bcs	a9cc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x438>
    a7b8:	e3000125 	movw	r0, #293	; 0x125
    a7bc:	e3a02029 	mov	r2, #41	; 0x29
    a7c0:	e58d0000 	str	r0, [sp]
    a7c4:	e59f03c8 	ldr	r0, [pc, #968]	; ab94 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x600>
    a7c8:	e08f0000 	add	r0, pc, r0
    a7cc:	e58d0004 	str	r0, [sp, #4]
    a7d0:	e300013a 	movw	r0, #314	; 0x13a
    a7d4:	e58d0008 	str	r0, [sp, #8]
    a7d8:	e1a0000a 	mov	r0, sl
    a7dc:	e59f13b4 	ldr	r1, [pc, #948]	; ab98 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x604>
    a7e0:	e59f33b4 	ldr	r3, [pc, #948]	; ab9c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x608>
    a7e4:	e08f1001 	add	r1, pc, r1
    a7e8:	e08f3003 	add	r3, pc, r3
    a7ec:	ebfffbca 	bl	971c <_ZN4core7unicode9printable5check17h8c6e2604042213f0E.llvm.7052769813565378627>
    a7f0:	e3500000 	cmp	r0, #0
    a7f4:	0a00009f 	beq	aa78 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x4e4>
    a7f8:	ea0000b6 	b	aad8 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x544>
    a7fc:	e3a07072 	mov	r7, #114	; 0x72
    a800:	e159000b 	cmp	r9, fp
    a804:	e59d001c 	ldr	r0, [sp, #28]
    a808:	e58d2024 	str	r2, [sp, #36]	; 0x24
    a80c:	e58d0020 	str	r0, [sp, #32]
    a810:	e58db028 	str	fp, [sp, #40]	; 0x28
    a814:	e58d902c 	str	r9, [sp, #44]	; 0x2c
    a818:	3a0000d3 	bcc	ab6c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x5d8>
    a81c:	e35b0000 	cmp	fp, #0
    a820:	115b0002 	cmpne	fp, r2
    a824:	0a000005 	beq	a840 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x2ac>
    a828:	2a0000cf 	bcs	ab6c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x5d8>
    a82c:	e59d001c 	ldr	r0, [sp, #28]
    a830:	e080000b 	add	r0, r0, fp
    a834:	e1d000d0 	ldrsb	r0, [r0]
    a838:	e3700041 	cmn	r0, #65	; 0x41
    a83c:	da0000ca 	ble	ab6c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x5d8>
    a840:	e3590000 	cmp	r9, #0
    a844:	11590002 	cmpne	r9, r2
    a848:	0a000005 	beq	a864 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x2d0>
    a84c:	2a0000c6 	bcs	ab6c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x5d8>
    a850:	e59d001c 	ldr	r0, [sp, #28]
    a854:	e0800009 	add	r0, r0, r9
    a858:	e1d000d0 	ldrsb	r0, [r0]
    a85c:	e3700041 	cmn	r0, #65	; 0x41
    a860:	da0000c1 	ble	ab6c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x5d8>
    a864:	e594201c 	ldr	r2, [r4, #28]
    a868:	e59d101c 	ldr	r1, [sp, #28]
    a86c:	e5940018 	ldr	r0, [r4, #24]
    a870:	e592300c 	ldr	r3, [r2, #12]
    a874:	e081100b 	add	r1, r1, fp
    a878:	e049200b 	sub	r2, r9, fp
    a87c:	e12fff33 	blx	r3
    a880:	e3500000 	cmp	r0, #0
    a884:	0a000008 	beq	a8ac <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x318>
    a888:	ea0000ad 	b	ab44 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x5b0>
    a88c:	e3a06000 	mov	r6, #0
    a890:	e1a01007 	mov	r1, r7
    a894:	e594201c 	ldr	r2, [r4, #28]
    a898:	e5940018 	ldr	r0, [r4, #24]
    a89c:	e5922010 	ldr	r2, [r2, #16]
    a8a0:	e12fff32 	blx	r2
    a8a4:	e3500000 	cmp	r0, #0
    a8a8:	1a0000a5 	bne	ab44 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x5b0>
    a8ac:	e28f2010 	add	r2, pc, #16
    a8b0:	e1a00006 	mov	r0, r6
    a8b4:	e3a06001 	mov	r6, #1
    a8b8:	e3a0105c 	mov	r1, #92	; 0x5c
    a8bc:	e7920100 	ldr	r0, [r2, r0, lsl #2]
    a8c0:	e082f000 	add	pc, r2, r0
    a8c4:	000000c0 	.word	0x000000c0
    a8c8:	ffffffc8 	.word	0xffffffc8
    a8cc:	ffffffd0 	.word	0xffffffd0
    a8d0:	00000010 	.word	0x00000010
    a8d4:	e28f2008 	add	r2, pc, #8
    a8d8:	e6ef0075 	uxtb	r0, r5
    a8dc:	e7920100 	ldr	r0, [r2, r0, lsl #2]
    a8e0:	e082f000 	add	pc, r2, r0
    a8e4:	000000a0 	.word	0x000000a0
    a8e8:	00000018 	.word	0x00000018
    a8ec:	00000028 	.word	0x00000028
    a8f0:	00000074 	.word	0x00000074
    a8f4:	00000064 	.word	0x00000064
    a8f8:	00000088 	.word	0x00000088
    a8fc:	e3c550ff 	bic	r5, r5, #255	; 0xff
    a900:	e3a06003 	mov	r6, #3
    a904:	e3a0107d 	mov	r1, #125	; 0x7d
    a908:	eaffffe1 	b	a894 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x300>
    a90c:	e59d200c 	ldr	r2, [sp, #12]
    a910:	e3a0001c 	mov	r0, #28
    a914:	e3a0100f 	mov	r1, #15
    a918:	e0000102 	and	r0, r0, r2, lsl #2
    a91c:	e0010037 	and	r0, r1, r7, lsr r0
    a920:	e2801057 	add	r1, r0, #87	; 0x57
    a924:	e350000a 	cmp	r0, #10
    a928:	33801030 	orrcc	r1, r0, #48	; 0x30
    a92c:	e3520000 	cmp	r2, #0
    a930:	0a00000f 	beq	a974 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x3e0>
    a934:	e1a00002 	mov	r0, r2
    a938:	e3a06003 	mov	r6, #3
    a93c:	e2420001 	sub	r0, r2, #1
    a940:	e58d000c 	str	r0, [sp, #12]
    a944:	eaffffd2 	b	a894 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x300>
    a948:	e3a06003 	mov	r6, #3
    a94c:	e3a01075 	mov	r1, #117	; 0x75
    a950:	e7c75016 	bfi	r5, r6, #0, #8
    a954:	eaffffce 	b	a894 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x300>
    a958:	e3a00002 	mov	r0, #2
    a95c:	e3a06003 	mov	r6, #3
    a960:	e7c75010 	bfi	r5, r0, #0, #8
    a964:	e3a0107b 	mov	r1, #123	; 0x7b
    a968:	eaffffc9 	b	a894 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x300>
    a96c:	e3a00004 	mov	r0, #4
    a970:	ea000000 	b	a978 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x3e4>
    a974:	e3a00001 	mov	r0, #1
    a978:	e7c75010 	bfi	r5, r0, #0, #8
    a97c:	e3a06003 	mov	r6, #3
    a980:	eaffffc3 	b	a894 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x300>
    a984:	e3a00001 	mov	r0, #1
    a988:	e35a0080 	cmp	sl, #128	; 0x80
    a98c:	23a00002 	movcs	r0, #2
    a990:	235a0b02 	cmpcs	sl, #2048	; 0x800
    a994:	2a000008 	bcs	a9bc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x428>
    a998:	e59d2018 	ldr	r2, [sp, #24]
    a99c:	e080b009 	add	fp, r0, r9
    a9a0:	e59d5010 	ldr	r5, [sp, #16]
    a9a4:	e59d0014 	ldr	r0, [sp, #20]
    a9a8:	e1550008 	cmp	r5, r8
    a9ac:	e0490000 	sub	r0, r9, r0
    a9b0:	e0809008 	add	r9, r0, r8
    a9b4:	1affff0a 	bne	a5e4 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x50>
    a9b8:	ea000049 	b	aae4 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x550>
    a9bc:	e35a0801 	cmp	sl, #65536	; 0x10000
    a9c0:	e3a00004 	mov	r0, #4
    a9c4:	33000003 	movwcc	r0, #3
    a9c8:	eafffff2 	b	a998 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x404>
    a9cc:	e35a0802 	cmp	sl, #131072	; 0x20000
    a9d0:	2a000010 	bcs	aa18 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x484>
    a9d4:	e3a000a6 	mov	r0, #166	; 0xa6
    a9d8:	e3a02023 	mov	r2, #35	; 0x23
    a9dc:	e58d0000 	str	r0, [sp]
    a9e0:	e59f01b8 	ldr	r0, [pc, #440]	; aba0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x60c>
    a9e4:	e08f0000 	add	r0, pc, r0
    a9e8:	e58d0004 	str	r0, [sp, #4]
    a9ec:	e3a00f66 	mov	r0, #408	; 0x198
    a9f0:	e58d0008 	str	r0, [sp, #8]
    a9f4:	e1a0000a 	mov	r0, sl
    a9f8:	e59f11a4 	ldr	r1, [pc, #420]	; aba4 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x610>
    a9fc:	e59f31a4 	ldr	r3, [pc, #420]	; aba8 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x614>
    aa00:	e08f1001 	add	r1, pc, r1
    aa04:	e08f3003 	add	r3, pc, r3
    aa08:	ebfffb43 	bl	971c <_ZN4core7unicode9printable5check17h8c6e2604042213f0E.llvm.7052769813565378627>
    aa0c:	e3500000 	cmp	r0, #0
    aa10:	0a000018 	beq	aa78 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x4e4>
    aa14:	ea00002f 	b	aad8 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x544>
    aa18:	e30f0e10 	movw	r0, #65040	; 0xfe10
    aa1c:	e30f1e10 	movw	r1, #65040	; 0xfe10
    aa20:	e34f0ff1 	movt	r0, #65521	; 0xfff1
    aa24:	e3401002 	movt	r1, #2
    aa28:	e08a0000 	add	r0, sl, r0
    aa2c:	e1500001 	cmp	r0, r1
    aa30:	3a000010 	bcc	aa78 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x4e4>
    aa34:	e30005e2 	movw	r0, #1506	; 0x5e2
    aa38:	e30016e2 	movw	r1, #1762	; 0x6e2
    aa3c:	e34f0ffd 	movt	r0, #65533	; 0xfffd
    aa40:	e340100b 	movt	r1, #11
    aa44:	e08a0000 	add	r0, sl, r0
    aa48:	e1500001 	cmp	r0, r1
    aa4c:	3a000009 	bcc	aa78 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x4e4>
    aa50:	e301041f 	movw	r0, #5151	; 0x141f
    aa54:	e3001c1f 	movw	r1, #3103	; 0xc1f
    aa58:	e34f0ffd 	movt	r0, #65533	; 0xfffd
    aa5c:	e08a0000 	add	r0, sl, r0
    aa60:	e1500001 	cmp	r0, r1
    aa64:	2303015e 	movwcs	r0, #12638	; 0x315e
    aa68:	234f0ffd 	movtcs	r0, #65533	; 0xfffd
    aa6c:	208a0000 	addcs	r0, sl, r0
    aa70:	2350000e 	cmpcs	r0, #14
    aa74:	2a000009 	bcs	aaa0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x50c>
    aa78:	e38a0001 	orr	r0, sl, #1
    aa7c:	e3a01007 	mov	r1, #7
    aa80:	e16f0f10 	clz	r0, r0
    aa84:	e3a05005 	mov	r5, #5
    aa88:	e3a06003 	mov	r6, #3
    aa8c:	e1a0700a 	mov	r7, sl
    aa90:	e0210120 	eor	r0, r1, r0, lsr #2
    aa94:	e58d000c 	str	r0, [sp, #12]
    aa98:	e59d2018 	ldr	r2, [sp, #24]
    aa9c:	eaffff57 	b	a800 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x26c>
    aaa0:	e30b181e 	movw	r1, #47134	; 0xb81e
    aaa4:	e3ca0001 	bic	r0, sl, #1
    aaa8:	e3401002 	movt	r1, #2
    aaac:	e1500001 	cmp	r0, r1
    aab0:	0afffff0 	beq	aa78 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x4e4>
    aab4:	e3050929 	movw	r0, #22825	; 0x5929
    aab8:	e34f0ffd 	movt	r0, #65533	; 0xfffd
    aabc:	e08a0000 	add	r0, sl, r0
    aac0:	e3500029 	cmp	r0, #41	; 0x29
    aac4:	230408cb 	movwcs	r0, #18635	; 0x48cb
    aac8:	234f0ffd 	movtcs	r0, #65533	; 0xfffd
    aacc:	208a0000 	addcs	r0, sl, r0
    aad0:	2350000a 	cmpcs	r0, #10
    aad4:	9affffe7 	bls	aa78 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x4e4>
    aad8:	e59d2018 	ldr	r2, [sp, #24]
    aadc:	eaffffb0 	b	a9a4 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x410>
    aae0:	e3a0b000 	mov	fp, #0
    aae4:	e35b0000 	cmp	fp, #0
    aae8:	e59d001c 	ldr	r0, [sp, #28]
    aaec:	115b0002 	cmpne	fp, r2
    aaf0:	e58d2024 	str	r2, [sp, #36]	; 0x24
    aaf4:	e58d0020 	str	r0, [sp, #32]
    aaf8:	e58db028 	str	fp, [sp, #40]	; 0x28
    aafc:	e58d202c 	str	r2, [sp, #44]	; 0x2c
    ab00:	0a000005 	beq	ab1c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x588>
    ab04:	2a000018 	bcs	ab6c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x5d8>
    ab08:	e59d001c 	ldr	r0, [sp, #28]
    ab0c:	e080000b 	add	r0, r0, fp
    ab10:	e1d000d0 	ldrsb	r0, [r0]
    ab14:	e3700041 	cmn	r0, #65	; 0x41
    ab18:	da000013 	ble	ab6c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x5d8>
    ab1c:	e1a07002 	mov	r7, r2
    ab20:	e594201c 	ldr	r2, [r4, #28]
    ab24:	e59d101c 	ldr	r1, [sp, #28]
    ab28:	e5940018 	ldr	r0, [r4, #24]
    ab2c:	e592300c 	ldr	r3, [r2, #12]
    ab30:	e081100b 	add	r1, r1, fp
    ab34:	e047200b 	sub	r2, r7, fp
    ab38:	e12fff33 	blx	r3
    ab3c:	e3500000 	cmp	r0, #0
    ab40:	0a000002 	beq	ab50 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h4732b7b3b244359bE+0x5bc>
    ab44:	e3a00001 	mov	r0, #1
    ab48:	e28dd03c 	add	sp, sp, #60	; 0x3c
    ab4c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ab50:	e594101c 	ldr	r1, [r4, #28]
    ab54:	e5940018 	ldr	r0, [r4, #24]
    ab58:	e5912010 	ldr	r2, [r1, #16]
    ab5c:	e3a01022 	mov	r1, #34	; 0x22
    ab60:	e28dd03c 	add	sp, sp, #60	; 0x3c
    ab64:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ab68:	e12fff12 	bx	r2
    ab6c:	e28d002c 	add	r0, sp, #44	; 0x2c
    ab70:	e58d0038 	str	r0, [sp, #56]	; 0x38
    ab74:	e28d0028 	add	r0, sp, #40	; 0x28
    ab78:	e58d0034 	str	r0, [sp, #52]	; 0x34
    ab7c:	e28d0020 	add	r0, sp, #32
    ab80:	e58d0030 	str	r0, [sp, #48]	; 0x30
    ab84:	e28d0030 	add	r0, sp, #48	; 0x30
    ab88:	ebfffb32 	bl	9858 <_ZN4core3str6traits101_$LT$impl$u20$core..slice..SliceIndex$LT$str$GT$$u20$for$u20$core..ops..range..Range$LT$usize$GT$$GT$5index28_$u7b$$u7b$closure$u7d$$u7d$17h0dca8b55fcd098caE>
    ab8c:	e7ffdefe 	udf	#65006	; 0xfdee
    ab90:	000022cc 	.word	0x000022cc
    ab94:	00001271 	.word	0x00001271
    ab98:	000010de 	.word	0x000010de
    ab9c:	0000112c 	.word	0x0000112c
    aba0:	0000127b 	.word	0x0000127b
    aba4:	00001173 	.word	0x00001173
    aba8:	000011b5 	.word	0x000011b5

0000abac <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E>:
    abac:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    abb0:	e24dd014 	sub	sp, sp, #20
    abb4:	e1a05000 	mov	r5, r0
    abb8:	e1a04001 	mov	r4, r1
    abbc:	e5910018 	ldr	r0, [r1, #24]
    abc0:	e591101c 	ldr	r1, [r1, #28]
    abc4:	e5912010 	ldr	r2, [r1, #16]
    abc8:	e3a01027 	mov	r1, #39	; 0x27
    abcc:	e12fff32 	blx	r2
    abd0:	e3500000 	cmp	r0, #0
    abd4:	0a000002 	beq	abe4 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x38>
    abd8:	e3a00001 	mov	r0, #1
    abdc:	e28dd014 	add	sp, sp, #20
    abe0:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    abe4:	e5955000 	ldr	r5, [r5]
    abe8:	e3a07002 	mov	r7, #2
    abec:	e2450009 	sub	r0, r5, #9
    abf0:	e350001e 	cmp	r0, #30
    abf4:	8a000024 	bhi	ac8c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0xe0>
    abf8:	e28f1008 	add	r1, pc, #8
    abfc:	e3a06074 	mov	r6, #116	; 0x74
    ac00:	e7910100 	ldr	r0, [r1, r0, lsl #2]
    ac04:	e081f000 	add	pc, r1, r0
    ac08:	000001f8 	.word	0x000001f8
    ac0c:	0000007c 	.word	0x0000007c
    ac10:	0000008c 	.word	0x0000008c
    ac14:	0000008c 	.word	0x0000008c
    ac18:	000000ec 	.word	0x000000ec
    ac1c:	0000008c 	.word	0x0000008c
    ac20:	0000008c 	.word	0x0000008c
    ac24:	0000008c 	.word	0x0000008c
    ac28:	0000008c 	.word	0x0000008c
    ac2c:	0000008c 	.word	0x0000008c
    ac30:	0000008c 	.word	0x0000008c
    ac34:	0000008c 	.word	0x0000008c
    ac38:	0000008c 	.word	0x0000008c
    ac3c:	0000008c 	.word	0x0000008c
    ac40:	0000008c 	.word	0x0000008c
    ac44:	0000008c 	.word	0x0000008c
    ac48:	0000008c 	.word	0x0000008c
    ac4c:	0000008c 	.word	0x0000008c
    ac50:	0000008c 	.word	0x0000008c
    ac54:	0000008c 	.word	0x0000008c
    ac58:	0000008c 	.word	0x0000008c
    ac5c:	0000008c 	.word	0x0000008c
    ac60:	0000008c 	.word	0x0000008c
    ac64:	0000008c 	.word	0x0000008c
    ac68:	0000008c 	.word	0x0000008c
    ac6c:	000001f4 	.word	0x000001f4
    ac70:	0000008c 	.word	0x0000008c
    ac74:	0000008c 	.word	0x0000008c
    ac78:	0000008c 	.word	0x0000008c
    ac7c:	0000008c 	.word	0x0000008c
    ac80:	000001f4 	.word	0x000001f4
    ac84:	e3a0606e 	mov	r6, #110	; 0x6e
    ac88:	ea00001a 	b	acf8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x14c>
    ac8c:	e355005c 	cmp	r5, #92	; 0x5c
    ac90:	0a000059 	beq	adfc <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x250>
    ac94:	e59f027c 	ldr	r0, [pc, #636]	; af18 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x36c>
    ac98:	e1a01005 	mov	r1, r5
    ac9c:	e08f0000 	add	r0, pc, r0
    aca0:	eb0000e5 	bl	b03c <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h7af027d666565b85E>
    aca4:	e3500000 	cmp	r0, #0
    aca8:	1a00003c 	bne	ada0 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x1f4>
    acac:	e3550801 	cmp	r5, #65536	; 0x10000
    acb0:	2a000011 	bcs	acfc <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x150>
    acb4:	e59f1260 	ldr	r1, [pc, #608]	; af1c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x370>
    acb8:	e300213a 	movw	r2, #314	; 0x13a
    acbc:	e59f325c 	ldr	r3, [pc, #604]	; af20 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x374>
    acc0:	e3007125 	movw	r7, #293	; 0x125
    acc4:	e59f0258 	ldr	r0, [pc, #600]	; af24 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x378>
    acc8:	e08f1001 	add	r1, pc, r1
    accc:	e08f3003 	add	r3, pc, r3
    acd0:	e58d7000 	str	r7, [sp]
    acd4:	e08f0000 	add	r0, pc, r0
    acd8:	e98d0005 	stmib	sp, {r0, r2}
    acdc:	e1a00005 	mov	r0, r5
    ace0:	e3a02029 	mov	r2, #41	; 0x29
    ace4:	ebfffa8c 	bl	971c <_ZN4core7unicode9printable5check17h8c6e2604042213f0E.llvm.7052769813565378627>
    ace8:	e3500000 	cmp	r0, #0
    acec:	0a00002b 	beq	ada0 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x1f4>
    acf0:	ea000040 	b	adf8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x24c>
    acf4:	e3a06072 	mov	r6, #114	; 0x72
    acf8:	ea000040 	b	ae00 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x254>
    acfc:	e3550802 	cmp	r5, #131072	; 0x20000
    ad00:	2a00000f 	bcs	ad44 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x198>
    ad04:	e59f121c 	ldr	r1, [pc, #540]	; af28 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x37c>
    ad08:	e3a02f66 	mov	r2, #408	; 0x198
    ad0c:	e59f3218 	ldr	r3, [pc, #536]	; af2c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x380>
    ad10:	e3a070a6 	mov	r7, #166	; 0xa6
    ad14:	e59f0214 	ldr	r0, [pc, #532]	; af30 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x384>
    ad18:	e08f1001 	add	r1, pc, r1
    ad1c:	e08f3003 	add	r3, pc, r3
    ad20:	e58d7000 	str	r7, [sp]
    ad24:	e08f0000 	add	r0, pc, r0
    ad28:	e98d0005 	stmib	sp, {r0, r2}
    ad2c:	e1a00005 	mov	r0, r5
    ad30:	e3a02023 	mov	r2, #35	; 0x23
    ad34:	ebfffa78 	bl	971c <_ZN4core7unicode9printable5check17h8c6e2604042213f0E.llvm.7052769813565378627>
    ad38:	e3500000 	cmp	r0, #0
    ad3c:	0a000017 	beq	ada0 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x1f4>
    ad40:	ea00002c 	b	adf8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x24c>
    ad44:	e2450e1f 	sub	r0, r5, #496	; 0x1f0
    ad48:	e30f1e10 	movw	r1, #65040	; 0xfe10
    ad4c:	e240080e 	sub	r0, r0, #917504	; 0xe0000
    ad50:	e3401002 	movt	r1, #2
    ad54:	e1500001 	cmp	r0, r1
    ad58:	3a000010 	bcc	ada0 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x1f4>
    ad5c:	e30005e2 	movw	r0, #1506	; 0x5e2
    ad60:	e30016e2 	movw	r1, #1762	; 0x6e2
    ad64:	e34f0ffd 	movt	r0, #65533	; 0xfffd
    ad68:	e340100b 	movt	r1, #11
    ad6c:	e0850000 	add	r0, r5, r0
    ad70:	e1500001 	cmp	r0, r1
    ad74:	3a000009 	bcc	ada0 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x1f4>
    ad78:	e301041f 	movw	r0, #5151	; 0x141f
    ad7c:	e3001c1f 	movw	r1, #3103	; 0xc1f
    ad80:	e34f0ffd 	movt	r0, #65533	; 0xfffd
    ad84:	e0850000 	add	r0, r5, r0
    ad88:	e1500001 	cmp	r0, r1
    ad8c:	2303015e 	movwcs	r0, #12638	; 0x315e
    ad90:	234f0ffd 	movtcs	r0, #65533	; 0xfffd
    ad94:	20850000 	addcs	r0, r5, r0
    ad98:	2350000e 	cmpcs	r0, #14
    ad9c:	2a000007 	bcs	adc0 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x214>
    ada0:	e3850001 	orr	r0, r5, #1
    ada4:	e3a09005 	mov	r9, #5
    ada8:	e16f0f10 	clz	r0, r0
    adac:	e3a07003 	mov	r7, #3
    adb0:	e3a01007 	mov	r1, #7
    adb4:	e0210120 	eor	r0, r1, r0, lsr #2
    adb8:	e58d0010 	str	r0, [sp, #16]
    adbc:	ea00000e 	b	adfc <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x250>
    adc0:	e30b181e 	movw	r1, #47134	; 0xb81e
    adc4:	e3c50001 	bic	r0, r5, #1
    adc8:	e3401002 	movt	r1, #2
    adcc:	e1500001 	cmp	r0, r1
    add0:	0afffff2 	beq	ada0 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x1f4>
    add4:	e3050929 	movw	r0, #22825	; 0x5929
    add8:	e34f0ffd 	movt	r0, #65533	; 0xfffd
    addc:	e0850000 	add	r0, r5, r0
    ade0:	e3500029 	cmp	r0, #41	; 0x29
    ade4:	230408cb 	movwcs	r0, #18635	; 0x48cb
    ade8:	234f0ffd 	movtcs	r0, #65533	; 0xfffd
    adec:	20850000 	addcs	r0, r5, r0
    adf0:	2350000a 	cmpcs	r0, #10
    adf4:	9affffe9 	bls	ada0 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x1f4>
    adf8:	e3a07001 	mov	r7, #1
    adfc:	e1a06005 	mov	r6, r5
    ae00:	e3a0a01c 	mov	sl, #28
    ae04:	e3a0500f 	mov	r5, #15
    ae08:	e3a08002 	mov	r8, #2
    ae0c:	e3a0b004 	mov	fp, #4
    ae10:	ea000007 	b	ae34 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x288>
    ae14:	e3a07000 	mov	r7, #0
    ae18:	e1a01006 	mov	r1, r6
    ae1c:	e594201c 	ldr	r2, [r4, #28]
    ae20:	e5940018 	ldr	r0, [r4, #24]
    ae24:	e5922010 	ldr	r2, [r2, #16]
    ae28:	e12fff32 	blx	r2
    ae2c:	e3500000 	cmp	r0, #0
    ae30:	1affff68 	bne	abd8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x2c>
    ae34:	e28f000c 	add	r0, pc, #12
    ae38:	e3a0105c 	mov	r1, #92	; 0x5c
    ae3c:	e7902107 	ldr	r2, [r0, r7, lsl #2]
    ae40:	e3a07001 	mov	r7, #1
    ae44:	e080f002 	add	pc, r0, r2
    ae48:	000000b4 	.word	0x000000b4
    ae4c:	ffffffcc 	.word	0xffffffcc
    ae50:	ffffffd4 	.word	0xffffffd4
    ae54:	00000010 	.word	0x00000010
    ae58:	e28f2008 	add	r2, pc, #8
    ae5c:	e6ef0079 	uxtb	r0, r9
    ae60:	e7920100 	ldr	r0, [r2, r0, lsl #2]
    ae64:	e082f000 	add	pc, r2, r0
    ae68:	00000094 	.word	0x00000094
    ae6c:	00000018 	.word	0x00000018
    ae70:	00000028 	.word	0x00000028
    ae74:	00000058 	.word	0x00000058
    ae78:	00000068 	.word	0x00000068
    ae7c:	00000078 	.word	0x00000078
    ae80:	e3c990ff 	bic	r9, r9, #255	; 0xff
    ae84:	e3a0107d 	mov	r1, #125	; 0x7d
    ae88:	e3a07003 	mov	r7, #3
    ae8c:	eaffffe2 	b	ae1c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x270>
    ae90:	e59d2010 	ldr	r2, [sp, #16]
    ae94:	e00a0102 	and	r0, sl, r2, lsl #2
    ae98:	e0050036 	and	r0, r5, r6, lsr r0
    ae9c:	e2801057 	add	r1, r0, #87	; 0x57
    aea0:	e350000a 	cmp	r0, #10
    aea4:	33801030 	orrcc	r1, r0, #48	; 0x30
    aea8:	e3520000 	cmp	r2, #0
    aeac:	0a00000e 	beq	aeec <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x340>
    aeb0:	e2422001 	sub	r2, r2, #1
    aeb4:	e58d2010 	str	r2, [sp, #16]
    aeb8:	e3a07003 	mov	r7, #3
    aebc:	eaffffd6 	b	ae1c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x270>
    aec0:	e7c79018 	bfi	r9, r8, #0, #8
    aec4:	e3a0107b 	mov	r1, #123	; 0x7b
    aec8:	e3a07003 	mov	r7, #3
    aecc:	eaffffd2 	b	ae1c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x270>
    aed0:	e3a07003 	mov	r7, #3
    aed4:	e3a01075 	mov	r1, #117	; 0x75
    aed8:	e7c79017 	bfi	r9, r7, #0, #8
    aedc:	eaffffce 	b	ae1c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x270>
    aee0:	e7c7901b 	bfi	r9, fp, #0, #8
    aee4:	e3a07003 	mov	r7, #3
    aee8:	eaffffcb 	b	ae1c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x270>
    aeec:	e3a00001 	mov	r0, #1
    aef0:	e3a07003 	mov	r7, #3
    aef4:	e7c79010 	bfi	r9, r0, #0, #8
    aef8:	eaffffc7 	b	ae1c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h1f18a3d12dbf7fc2E+0x270>
    aefc:	e594101c 	ldr	r1, [r4, #28]
    af00:	e5940018 	ldr	r0, [r4, #24]
    af04:	e5912010 	ldr	r2, [r1, #16]
    af08:	e3a01027 	mov	r1, #39	; 0x27
    af0c:	e28dd014 	add	sp, sp, #20
    af10:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    af14:	e12fff12 	bx	r2
    af18:	00001dcc 	.word	0x00001dcc
    af1c:	00000bfa 	.word	0x00000bfa
    af20:	00000c48 	.word	0x00000c48
    af24:	00000d65 	.word	0x00000d65
    af28:	00000e5b 	.word	0x00000e5b
    af2c:	00000e9d 	.word	0x00000e9d
    af30:	00000f3b 	.word	0x00000f3b

0000af34 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h52fc850006f471a9E>:
    af34:	e5902000 	ldr	r2, [r0]
    af38:	e5900004 	ldr	r0, [r0, #4]
    af3c:	e590300c 	ldr	r3, [r0, #12]
    af40:	e1a00002 	mov	r0, r2
    af44:	e12fff13 	bx	r3

0000af48 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h6a01c667db08276eE>:
    af48:	e1a03001 	mov	r3, r1
    af4c:	e8900006 	ldm	r0, {r1, r2}
    af50:	e1a00003 	mov	r0, r3
    af54:	eafffc93 	b	a1a8 <_ZN4core3fmt9Formatter3pad17h49e5d441d780c4f9E>

0000af58 <_ZN4core3ptr18real_drop_in_place17he010aa12b2ef774dE>:
    af58:	e12fff1e 	bx	lr

0000af5c <_ZN4core9panicking5panic17h7b567084461090e7E>:
    af5c:	e24dd020 	sub	sp, sp, #32
    af60:	e1a0c002 	mov	ip, r2
    af64:	e3a03000 	mov	r3, #0
    af68:	e3a02004 	mov	r2, #4
    af6c:	e58d101c 	str	r1, [sp, #28]
    af70:	e58d3014 	str	r3, [sp, #20]
    af74:	e1a0100c 	mov	r1, ip
    af78:	e58d2010 	str	r2, [sp, #16]
    af7c:	e3a02001 	mov	r2, #1
    af80:	e58d0018 	str	r0, [sp, #24]
    af84:	e1a0000d 	mov	r0, sp
    af88:	e58d300c 	str	r3, [sp, #12]
    af8c:	e58d3008 	str	r3, [sp, #8]
    af90:	e58d2004 	str	r2, [sp, #4]
    af94:	e28d2018 	add	r2, sp, #24
    af98:	e58d2000 	str	r2, [sp]
    af9c:	eb00001b 	bl	b010 <_ZN4core9panicking9panic_fmt17hfb3f65a21a5866cfE>
    afa0:	e7ffdefe 	udf	#65006	; 0xfdee

0000afa4 <_ZN4core9panicking18panic_bounds_check17h9369801762b8b5caE>:
    afa4:	e24dd030 	sub	sp, sp, #48	; 0x30
    afa8:	e1a03000 	mov	r3, r0
    afac:	e59f0054 	ldr	r0, [pc, #84]	; b008 <_ZN4core9panicking18panic_bounds_check17h9369801762b8b5caE+0x64>
    afb0:	e88d0006 	stm	sp, {r1, r2}
    afb4:	e3a01002 	mov	r1, #2
    afb8:	e28d2020 	add	r2, sp, #32
    afbc:	e58d101c 	str	r1, [sp, #28]
    afc0:	e08f0000 	add	r0, pc, r0
    afc4:	e58d2018 	str	r2, [sp, #24]
    afc8:	e3a02000 	mov	r2, #0
    afcc:	e28dc008 	add	ip, sp, #8
    afd0:	e58d2014 	str	r2, [sp, #20]
    afd4:	e88c0007 	stm	ip, {r0, r1, r2}
    afd8:	e1a0100d 	mov	r1, sp
    afdc:	e59f0028 	ldr	r0, [pc, #40]	; b00c <_ZN4core9panicking18panic_bounds_check17h9369801762b8b5caE+0x68>
    afe0:	e79f0000 	ldr	r0, [pc, r0]
    afe4:	e58d002c 	str	r0, [sp, #44]	; 0x2c
    afe8:	e58d1028 	str	r1, [sp, #40]	; 0x28
    afec:	e1a01003 	mov	r1, r3
    aff0:	e58d0024 	str	r0, [sp, #36]	; 0x24
    aff4:	e28d0004 	add	r0, sp, #4
    aff8:	e58d0020 	str	r0, [sp, #32]
    affc:	e28d0008 	add	r0, sp, #8
    b000:	eb000002 	bl	b010 <_ZN4core9panicking9panic_fmt17hfb3f65a21a5866cfE>
    b004:	e7ffdefe 	udf	#65006	; 0xfdee
    b008:	000020e0 	.word	0x000020e0
    b00c:	000021b4 	.word	0x000021b4

0000b010 <_ZN4core9panicking9panic_fmt17hfb3f65a21a5866cfE>:
    b010:	e24dd010 	sub	sp, sp, #16
    b014:	e59f201c 	ldr	r2, [pc, #28]	; b038 <_ZN4core9panicking9panic_fmt17hfb3f65a21a5866cfE+0x28>
    b018:	e58d100c 	str	r1, [sp, #12]
    b01c:	e58d0008 	str	r0, [sp, #8]
    b020:	e3a00001 	mov	r0, #1
    b024:	e08f2002 	add	r2, pc, r2
    b028:	e88d0005 	stm	sp, {r0, r2}
    b02c:	e1a0000d 	mov	r0, sp
    b030:	eb0000ac 	bl	b2e8 <rust_begin_unwind>
    b034:	e7ffdefe 	udf	#65006	; 0xfdee
    b038:	0000206c 	.word	0x0000206c

0000b03c <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h7af027d666565b85E>:
    b03c:	e92d4020 	push	{r5, lr}
    b040:	e3510b02 	cmp	r1, #2048	; 0x800
    b044:	2a000003 	bcs	b058 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h7af027d666565b85E+0x1c>
    b048:	e3e02007 	mvn	r2, #7
    b04c:	e00221a1 	and	r2, r2, r1, lsr #3
    b050:	e0800002 	add	r0, r0, r2
    b054:	ea00001f 	b	b0d8 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h7af027d666565b85E+0x9c>
    b058:	e3510801 	cmp	r1, #65536	; 0x10000
    b05c:	2a00000b 	bcs	b090 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h7af027d666565b85E+0x54>
    b060:	e3e0201f 	mvn	r2, #31
    b064:	e0823321 	add	r3, r2, r1, lsr #6
    b068:	e1a022a3 	lsr	r2, r3, #5
    b06c:	e352001e 	cmp	r2, #30
    b070:	8a000026 	bhi	b110 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h7af027d666565b85E+0xd4>
    b074:	e0803003 	add	r3, r0, r3
    b078:	e5902104 	ldr	r2, [r0, #260]	; 0x104
    b07c:	e5d33118 	ldrb	r3, [r3, #280]	; 0x118
    b080:	e1520003 	cmp	r2, r3
    b084:	9a000027 	bls	b128 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h7af027d666565b85E+0xec>
    b088:	e5900100 	ldr	r0, [r0, #256]	; 0x100
    b08c:	ea000010 	b	b0d4 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h7af027d666565b85E+0x98>
    b090:	e3e0200f 	mvn	r2, #15
    b094:	e0822621 	add	r2, r2, r1, lsr #12
    b098:	e3520c01 	cmp	r2, #256	; 0x100
    b09c:	2a000026 	bcs	b13c <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h7af027d666565b85E+0x100>
    b0a0:	e0802002 	add	r2, r0, r2
    b0a4:	e5d2c4f8 	ldrb	ip, [r2, #1272]	; 0x4f8
    b0a8:	e590210c 	ldr	r2, [r0, #268]	; 0x10c
    b0ac:	e7e53351 	ubfx	r3, r1, #6, #6
    b0b0:	e183330c 	orr	r3, r3, ip, lsl #6
    b0b4:	e1530002 	cmp	r3, r2
    b0b8:	2a000025 	bcs	b154 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h7af027d666565b85E+0x118>
    b0bc:	e590c108 	ldr	ip, [r0, #264]	; 0x108
    b0c0:	e5902114 	ldr	r2, [r0, #276]	; 0x114
    b0c4:	e7dc3003 	ldrb	r3, [ip, r3]
    b0c8:	e1520003 	cmp	r2, r3
    b0cc:	9a000025 	bls	b168 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h7af027d666565b85E+0x12c>
    b0d0:	e5900110 	ldr	r0, [r0, #272]	; 0x110
    b0d4:	e0800183 	add	r0, r0, r3, lsl #3
    b0d8:	e201103f 	and	r1, r1, #63	; 0x3f
    b0dc:	e3a0c001 	mov	ip, #1
    b0e0:	e2513020 	subs	r3, r1, #32
    b0e4:	e8900021 	ldm	r0, {r0, r5}
    b0e8:	e1a0211c 	lsl	r2, ip, r1
    b0ec:	e2611020 	rsb	r1, r1, #32
    b0f0:	53002000 	movwpl	r2, #0
    b0f4:	e0000002 	and	r0, r0, r2
    b0f8:	e1a0113c 	lsr	r1, ip, r1
    b0fc:	51a0131c 	lslpl	r1, ip, r3
    b100:	e0051001 	and	r1, r5, r1
    b104:	e1900001 	orrs	r0, r0, r1
    b108:	13000001 	movwne	r0, #1
    b10c:	e8bd8020 	pop	{r5, pc}
    b110:	e59f0068 	ldr	r0, [pc, #104]	; b180 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h7af027d666565b85E+0x144>
    b114:	e1a01003 	mov	r1, r3
    b118:	e3a02e3e 	mov	r2, #992	; 0x3e0
    b11c:	e08f0000 	add	r0, pc, r0
    b120:	ebffff9f 	bl	afa4 <_ZN4core9panicking18panic_bounds_check17h9369801762b8b5caE>
    b124:	e7ffdefe 	udf	#65006	; 0xfdee
    b128:	e59f0054 	ldr	r0, [pc, #84]	; b184 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h7af027d666565b85E+0x148>
    b12c:	e08f0000 	add	r0, pc, r0
    b130:	e1a01003 	mov	r1, r3
    b134:	ebffff9a 	bl	afa4 <_ZN4core9panicking18panic_bounds_check17h9369801762b8b5caE>
    b138:	e7ffdefe 	udf	#65006	; 0xfdee
    b13c:	e59f0038 	ldr	r0, [pc, #56]	; b17c <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h7af027d666565b85E+0x140>
    b140:	e1a01002 	mov	r1, r2
    b144:	e3a02c01 	mov	r2, #256	; 0x100
    b148:	e08f0000 	add	r0, pc, r0
    b14c:	ebffff94 	bl	afa4 <_ZN4core9panicking18panic_bounds_check17h9369801762b8b5caE>
    b150:	e7ffdefe 	udf	#65006	; 0xfdee
    b154:	e59f002c 	ldr	r0, [pc, #44]	; b188 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h7af027d666565b85E+0x14c>
    b158:	e08f0000 	add	r0, pc, r0
    b15c:	e1a01003 	mov	r1, r3
    b160:	ebffff8f 	bl	afa4 <_ZN4core9panicking18panic_bounds_check17h9369801762b8b5caE>
    b164:	e7ffdefe 	udf	#65006	; 0xfdee
    b168:	e59f001c 	ldr	r0, [pc, #28]	; b18c <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h7af027d666565b85E+0x150>
    b16c:	e08f0000 	add	r0, pc, r0
    b170:	e1a01003 	mov	r1, r3
    b174:	ebffff8a 	bl	afa4 <_ZN4core9panicking18panic_bounds_check17h9369801762b8b5caE>
    b178:	e7ffdefe 	udf	#65006	; 0xfdee
    b17c:	00001f88 	.word	0x00001f88
    b180:	00001f94 	.word	0x00001f94
    b184:	00001f94 	.word	0x00001f94
    b188:	00001f88 	.word	0x00001f88
    b18c:	00001f84 	.word	0x00001f84

0000b190 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h37251ddf97716b6eE>:
    b190:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    b194:	e24dd034 	sub	sp, sp, #52	; 0x34
    b198:	e1a0c001 	mov	ip, r1
    b19c:	e5901000 	ldr	r1, [r0]
    b1a0:	e59f0138 	ldr	r0, [pc, #312]	; b2e0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h37251ddf97716b6eE+0x150>
    b1a4:	e308851f 	movw	r8, #34079	; 0x851f
    b1a8:	e3029710 	movw	r9, #10000	; 0x2710
    b1ac:	e3a0e027 	mov	lr, #39	; 0x27
    b1b0:	e1510009 	cmp	r1, r9
    b1b4:	e34581eb 	movt	r8, #20971	; 0x51eb
    b1b8:	e79f0000 	ldr	r0, [pc, r0]
    b1bc:	3a000026 	bcc	b25c <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h37251ddf97716b6eE+0xcc>
    b1c0:	e301e759 	movw	lr, #5977	; 0x1759
    b1c4:	e30e40ff 	movw	r4, #57599	; 0xe0ff
    b1c8:	e28db008 	add	fp, sp, #8
    b1cc:	e3a02000 	mov	r2, #0
    b1d0:	e34de1b7 	movt	lr, #53687	; 0xd1b7
    b1d4:	e3a0a064 	mov	sl, #100	; 0x64
    b1d8:	e34045f5 	movt	r4, #1525	; 0x5f5
    b1dc:	e0853e91 	umull	r3, r5, r1, lr
    b1e0:	e1510004 	cmp	r1, r4
    b1e4:	e1a036a5 	lsr	r3, r5, #13
    b1e8:	e0651993 	mls	r5, r3, r9, r1
    b1ec:	e1a01003 	mov	r1, r3
    b1f0:	e6ff6075 	uxth	r6, r5
    b1f4:	e0876896 	umull	r6, r7, r6, r8
    b1f8:	e1a062a7 	lsr	r6, r7, #5
    b1fc:	e08b7002 	add	r7, fp, r2
    b200:	e0655a96 	mls	r5, r6, sl, r5
    b204:	e0806086 	add	r6, r0, r6, lsl #1
    b208:	e2422004 	sub	r2, r2, #4
    b20c:	e1d660b0 	ldrh	r6, [r6]
    b210:	e1c762b3 	strh	r6, [r7, #35]	; 0x23
    b214:	e6ff5075 	uxth	r5, r5
    b218:	e0805085 	add	r5, r0, r5, lsl #1
    b21c:	e1d550b0 	ldrh	r5, [r5]
    b220:	e1c752b5 	strh	r5, [r7, #37]	; 0x25
    b224:	8affffec 	bhi	b1dc <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h37251ddf97716b6eE+0x4c>
    b228:	e282e027 	add	lr, r2, #39	; 0x27
    b22c:	e3530063 	cmp	r3, #99	; 0x63
    b230:	ca00000c 	bgt	b268 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h37251ddf97716b6eE+0xd8>
    b234:	e1a01003 	mov	r1, r3
    b238:	e351000a 	cmp	r1, #10
    b23c:	ba000017 	blt	b2a0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h37251ddf97716b6eE+0x110>
    b240:	e0801081 	add	r1, r0, r1, lsl #1
    b244:	e24e0002 	sub	r0, lr, #2
    b248:	e28d2008 	add	r2, sp, #8
    b24c:	e0822000 	add	r2, r2, r0
    b250:	e1d110b0 	ldrh	r1, [r1]
    b254:	e1c210b0 	strh	r1, [r2]
    b258:	ea000014 	b	b2b0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h37251ddf97716b6eE+0x120>
    b25c:	e1a03001 	mov	r3, r1
    b260:	e3530063 	cmp	r3, #99	; 0x63
    b264:	dafffff2 	ble	b234 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h37251ddf97716b6eE+0xa4>
    b268:	e6ff1073 	uxth	r1, r3
    b26c:	e24ee002 	sub	lr, lr, #2
    b270:	e0821891 	umull	r1, r2, r1, r8
    b274:	e1a012a2 	lsr	r1, r2, #5
    b278:	e3a02064 	mov	r2, #100	; 0x64
    b27c:	e0623291 	mls	r2, r1, r2, r3
    b280:	e28d3008 	add	r3, sp, #8
    b284:	e083300e 	add	r3, r3, lr
    b288:	e6ff2072 	uxth	r2, r2
    b28c:	e0802082 	add	r2, r0, r2, lsl #1
    b290:	e1d220b0 	ldrh	r2, [r2]
    b294:	e1c320b0 	strh	r2, [r3]
    b298:	e351000a 	cmp	r1, #10
    b29c:	aaffffe7 	bge	b240 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h37251ddf97716b6eE+0xb0>
    b2a0:	e24e0001 	sub	r0, lr, #1
    b2a4:	e28d2008 	add	r2, sp, #8
    b2a8:	e2811030 	add	r1, r1, #48	; 0x30
    b2ac:	e7c21000 	strb	r1, [r2, r0]
    b2b0:	e59f202c 	ldr	r2, [pc, #44]	; b2e4 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h37251ddf97716b6eE+0x154>
    b2b4:	e28d3008 	add	r3, sp, #8
    b2b8:	e2601027 	rsb	r1, r0, #39	; 0x27
    b2bc:	e0830000 	add	r0, r3, r0
    b2c0:	e08f2002 	add	r2, pc, r2
    b2c4:	e88d0003 	stm	sp, {r0, r1}
    b2c8:	e1a0000c 	mov	r0, ip
    b2cc:	e3a01001 	mov	r1, #1
    b2d0:	e3a03000 	mov	r3, #0
    b2d4:	ebfffab8 	bl	9dbc <_ZN4core3fmt9Formatter12pad_integral17h0b2891e7021e170eE>
    b2d8:	e28dd034 	add	sp, sp, #52	; 0x34
    b2dc:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    b2e0:	00001f48 	.word	0x00001f48
    b2e4:	00001305 	.word	0x00001305

0000b2e8 <rust_begin_unwind>:
    b2e8:	eafffffe 	b	b2e8 <rust_begin_unwind>
