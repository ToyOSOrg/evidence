
arm-sha-shipped-noninc-4dc75f542:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100003500 <toyos_crypto::arch::aarch64::sha512_blocks>:
100003500:     	ldp	q3, q2, [x0]
100003504:     	ldp	q1, q0, [x0, #0x20]
100003508:     	cbz	x2, 0x100003634 <toyos_crypto::arch::aarch64::sha512_blocks+0x134>
10000350c:     	sub	sp, sp, #0x80
100003510:     	add	x8, x1, x2, lsl #7
100003514:     	mov	x9, sp
100003518:     	adrp	x10, 0x100038000 <dyld_stub_binder+0x100038000>
10000351c:     	add	x10, x10, #0x910
100003520:     	b	0x100003540 <toyos_crypto::arch::aarch64::sha512_blocks+0x40>
100003524:     	add.2d	v3, v16, v3
100003528:     	add.2d	v2, v6, v2
10000352c:     	add.2d	v1, v17, v1
100003530:     	add.2d	v0, v4, v0
100003534:     	add	x1, x1, #0x80
100003538:     	cmp	x1, x8
10000353c:     	b.eq	0x100003630 <toyos_crypto::arch::aarch64::sha512_blocks+0x130>
100003540:     	mov	x11, #0x0               ; =0
100003544:     	ldp	q4, q5, [x1]
100003548:     	rev64.16b	v4, v4
10000354c:     	rev64.16b	v5, v5
100003550:     	ldp	q6, q7, [x1, #0x20]
100003554:     	rev64.16b	v6, v6
100003558:     	rev64.16b	v7, v7
10000355c:     	ldp	q16, q17, [x1, #0x40]
100003560:     	rev64.16b	v16, v16
100003564:     	rev64.16b	v17, v17
100003568:     	ldp	q18, q19, [x1, #0x60]
10000356c:     	rev64.16b	v18, v18
100003570:     	rev64.16b	v19, v19
100003574:     	stp	q4, q5, [sp]
100003578:     	stp	q6, q7, [sp, #0x20]
10000357c:     	stp	q16, q17, [sp, #0x40]
100003580:     	mov.16b	v7, v0
100003584:     	mov.16b	v16, v3
100003588:     	mov.16b	v5, v2
10000358c:     	mov.16b	v17, v1
100003590:     	stp	q18, q19, [sp, #0x60]
100003594:     	b	0x100003614 <toyos_crypto::arch::aarch64::sha512_blocks+0x114>
100003598:     	and	x13, x11, #0x7
10000359c:     	lsl	x14, x13, #4
1000035a0:     	ldr	q16, [x9, x14]
1000035a4:     	and	x15, x12, #0x7
1000035a8:     	ldr	q17, [x9, x15, lsl #4]
1000035ac:     	sub	w15, w11, #0x1
1000035b0:     	and	x15, x15, #0x7
1000035b4:     	ldr	q18, [x9, x15, lsl #4]
1000035b8:     	sha512su0.2d	v16, v17
1000035bc:     	eor	x13, x13, #0x4
1000035c0:     	ldr	q17, [x9, x13, lsl #4]
1000035c4:     	add	w13, w11, #0x5
1000035c8:     	and	x13, x13, #0x7
1000035cc:     	ldr	q19, [x9, x13, lsl #4]
1000035d0:     	ext.16b	v17, v17, v19, #0x8
1000035d4:     	sha512su1.2d	v16, v18, v17
1000035d8:     	str	q16, [x9, x14]
1000035dc:     	ldr	q17, [x10, x11, lsl #4]
1000035e0:     	add.2d	v16, v17, v16
1000035e4:     	ext.16b	v16, v16, v16, #0x8
1000035e8:     	add.2d	v16, v16, v7
1000035ec:     	ext.16b	v7, v4, v7, #0x8
1000035f0:     	ext.16b	v17, v5, v4, #0x8
1000035f4:     	sha512h.2d	q16, q7, v17
1000035f8:     	add.2d	v17, v16, v5
1000035fc:     	sha512h2.2d	q16, q5, v6
100003600:     	mov.16b	v7, v4
100003604:     	mov.16b	v5, v6
100003608:     	mov	x11, x12
10000360c:     	cmp	x12, #0x28
100003610:     	b.eq	0x100003524 <toyos_crypto::arch::aarch64::sha512_blocks+0x24>
100003614:     	mov.16b	v4, v17
100003618:     	mov.16b	v6, v16
10000361c:     	add	x12, x11, #0x1
100003620:     	cmp	x11, #0x7
100003624:     	b.hi	0x100003598 <toyos_crypto::arch::aarch64::sha512_blocks+0x98>
100003628:     	ldr	q16, [x9, x11, lsl #4]
10000362c:     	b	0x1000035dc <toyos_crypto::arch::aarch64::sha512_blocks+0xdc>
100003630:     	add	sp, sp, #0x80
100003634:     	stp	q3, q2, [x0]
100003638:     	stp	q1, q0, [x0, #0x20]
10000363c:     	mov	w0, #0x1                ; =1
100003640:     	ret
