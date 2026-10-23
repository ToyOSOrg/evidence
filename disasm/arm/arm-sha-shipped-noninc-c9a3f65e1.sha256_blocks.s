
arm-sha-shipped-noninc-c9a3f65e1:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001000033dc <toyos_crypto::arch::aarch64::sha256_blocks>:
1000033dc:     	ldp	q0, q1, [x0]
1000033e0:     	cbz	x2, 0x1000034f4 <toyos_crypto::arch::aarch64::sha256_blocks+0x118>
1000033e4:     	sub	sp, sp, #0x40
1000033e8:     	add	x8, x1, x2, lsl #6
1000033ec:     	adrp	x9, 0x100038000 <dyld_stub_binder+0x100038000>
1000033f0:     	ldr	q2, [x9, #0x8f0]
1000033f4:     	adrp	x9, 0x100038000 <dyld_stub_binder+0x100038000>
1000033f8:     	ldr	q3, [x9, #0x900]
1000033fc:     	adrp	x9, 0x100038000 <dyld_stub_binder+0x100038000>
100003400:     	ldr	q4, [x9, #0x910]
100003404:     	mov	x9, sp
100003408:     	adrp	x10, 0x100038000 <dyld_stub_binder+0x100038000>
10000340c:     	ldr	q5, [x10, #0x920]
100003410:     	adrp	x10, 0x100038000 <dyld_stub_binder+0x100038000>
100003414:     	add	x10, x10, #0x970
100003418:     	ldp	q6, q7, [x1]
10000341c:     	rev32.16b	v6, v6
100003420:     	rev32.16b	v7, v7
100003424:     	stp	q6, q7, [sp]
100003428:     	ldp	q16, q17, [x1, #0x20]
10000342c:     	rev32.16b	v16, v16
100003430:     	rev32.16b	v17, v17
100003434:     	stp	q16, q17, [sp, #0x20]
100003438:     	add.4s	v6, v6, v2
10000343c:     	mov.16b	v18, v0
100003440:     	sha256h.4s	q18, q1, v6
100003444:     	mov.16b	v19, v1
100003448:     	sha256h2.4s	q19, q0, v6
10000344c:     	add.4s	v6, v7, v3
100003450:     	mov.16b	v7, v18
100003454:     	sha256h.4s	q7, q19, v6
100003458:     	sha256h2.4s	q19, q18, v6
10000345c:     	add.4s	v16, v16, v4
100003460:     	mov.16b	v6, v7
100003464:     	sha256h.4s	q6, q19, v16
100003468:     	sha256h2.4s	q19, q7, v16
10000346c:     	add.4s	v16, v17, v5
100003470:     	mov.16b	v7, v19
100003474:     	sha256h2.4s	q7, q6, v16
100003478:     	sha256h.4s	q6, q19, v16
10000347c:     	mov	w11, #0x7               ; =7
100003480:     	mov	x12, x10
100003484:     	sub	w13, w11, #0x3
100003488:     	sub	w14, w11, #0x2
10000348c:     	and	x13, x13, #0x3
100003490:     	lsl	x15, x13, #4
100003494:     	ldr	q16, [x9, x15]
100003498:     	and	x14, x14, #0x3
10000349c:     	ldr	q17, [x9, x14, lsl #4]
1000034a0:     	eor	x13, x13, #0x2
1000034a4:     	ldr	q18, [x9, x13, lsl #4]
1000034a8:     	and	x13, x11, #0x3
1000034ac:     	ldr	q19, [x9, x13, lsl #4]
1000034b0:     	sha256su0.4s	v16, v17
1000034b4:     	sha256su1.4s	v16, v18, v19
1000034b8:     	str	q16, [x9, x15]
1000034bc:     	ldr	q17, [x12], #0x10
1000034c0:     	mov.16b	v18, v6
1000034c4:     	add.4s	v16, v17, v16
1000034c8:     	sha256h.4s	q6, q7, v16
1000034cc:     	sha256h2.4s	q7, q18, v16
1000034d0:     	add	x11, x11, #0x1
1000034d4:     	cmp	x11, #0x13
1000034d8:     	b.ne	0x100003484 <toyos_crypto::arch::aarch64::sha256_blocks+0xa8>
1000034dc:     	add	x1, x1, #0x40
1000034e0:     	add.4s	v0, v6, v0
1000034e4:     	add.4s	v1, v7, v1
1000034e8:     	cmp	x1, x8
1000034ec:     	b.ne	0x100003418 <toyos_crypto::arch::aarch64::sha256_blocks+0x3c>
1000034f0:     	add	sp, sp, #0x40
1000034f4:     	stp	q0, q1, [x0]
1000034f8:     	mov	w0, #0x1                ; =1
1000034fc:     	ret
