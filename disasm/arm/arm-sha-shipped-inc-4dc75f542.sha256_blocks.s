
arm-sha-shipped-inc-4dc75f542:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001000018cc <toyos_crypto::arch::aarch64::sha256_blocks>:
1000018cc:     	ldp	q0, q1, [x0]
1000018d0:     	cbz	x2, 0x1000019e4 <toyos_crypto::arch::aarch64::sha256_blocks+0x118>
1000018d4:     	sub	sp, sp, #0x40
1000018d8:     	add	x8, x1, x2, lsl #6
1000018dc:     	adrp	x9, 0x100038000 <dyld_stub_binder+0x100038000>
1000018e0:     	ldr	q2, [x9, #0x460]
1000018e4:     	adrp	x9, 0x100038000 <dyld_stub_binder+0x100038000>
1000018e8:     	ldr	q3, [x9, #0x470]
1000018ec:     	adrp	x9, 0x100038000 <dyld_stub_binder+0x100038000>
1000018f0:     	ldr	q4, [x9, #0x480]
1000018f4:     	mov	x9, sp
1000018f8:     	adrp	x10, 0x100038000 <dyld_stub_binder+0x100038000>
1000018fc:     	ldr	q5, [x10, #0x490]
100001900:     	adrp	x10, 0x100038000 <dyld_stub_binder+0x100038000>
100001904:     	add	x10, x10, #0x4e0
100001908:     	ldp	q6, q7, [x1]
10000190c:     	rev32.16b	v6, v6
100001910:     	rev32.16b	v7, v7
100001914:     	ldp	q16, q17, [x1, #0x20]
100001918:     	rev32.16b	v16, v16
10000191c:     	rev32.16b	v17, v17
100001920:     	stp	q6, q7, [sp]
100001924:     	stp	q16, q17, [sp, #0x20]
100001928:     	add.4s	v6, v6, v2
10000192c:     	mov.16b	v18, v0
100001930:     	sha256h.4s	q18, q1, v6
100001934:     	mov.16b	v19, v1
100001938:     	sha256h2.4s	q19, q0, v6
10000193c:     	add.4s	v6, v7, v3
100001940:     	mov.16b	v7, v18
100001944:     	sha256h.4s	q7, q19, v6
100001948:     	sha256h2.4s	q19, q18, v6
10000194c:     	add.4s	v16, v16, v4
100001950:     	mov.16b	v6, v7
100001954:     	sha256h.4s	q6, q19, v16
100001958:     	sha256h2.4s	q19, q7, v16
10000195c:     	add.4s	v16, v17, v5
100001960:     	mov.16b	v7, v19
100001964:     	sha256h2.4s	q7, q6, v16
100001968:     	sha256h.4s	q6, q19, v16
10000196c:     	mov	w11, #0x7               ; =7
100001970:     	mov	x12, x10
100001974:     	sub	w13, w11, #0x3
100001978:     	sub	w14, w11, #0x2
10000197c:     	and	x13, x13, #0x3
100001980:     	lsl	x15, x13, #4
100001984:     	ldr	q16, [x9, x15]
100001988:     	and	x14, x14, #0x3
10000198c:     	ldr	q17, [x9, x14, lsl #4]
100001990:     	eor	x13, x13, #0x2
100001994:     	ldr	q18, [x9, x13, lsl #4]
100001998:     	and	x13, x11, #0x3
10000199c:     	ldr	q19, [x9, x13, lsl #4]
1000019a0:     	sha256su0.4s	v16, v17
1000019a4:     	sha256su1.4s	v16, v18, v19
1000019a8:     	str	q16, [x9, x15]
1000019ac:     	ldr	q17, [x12], #0x10
1000019b0:     	mov.16b	v18, v6
1000019b4:     	add.4s	v16, v17, v16
1000019b8:     	sha256h.4s	q6, q7, v16
1000019bc:     	sha256h2.4s	q7, q18, v16
1000019c0:     	add	x11, x11, #0x1
1000019c4:     	cmp	x11, #0x13
1000019c8:     	b.ne	0x100001974 <toyos_crypto::arch::aarch64::sha256_blocks+0xa8>
1000019cc:     	add	x1, x1, #0x40
1000019d0:     	add.4s	v0, v6, v0
1000019d4:     	add.4s	v1, v7, v1
1000019d8:     	cmp	x1, x8
1000019dc:     	b.ne	0x100001908 <toyos_crypto::arch::aarch64::sha256_blocks+0x3c>
1000019e0:     	add	sp, sp, #0x40
1000019e4:     	stp	q0, q1, [x0]
1000019e8:     	mov	w0, #0x1                ; =1
1000019ec:     	ret
