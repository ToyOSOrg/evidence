
arm-sha-shipped-inc-4dc75f542:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001000019f0 <toyos_crypto::arch::aarch64::sha512_blocks>:
1000019f0:     	ldp	q3, q2, [x0]
1000019f4:     	ldp	q1, q0, [x0, #0x20]
1000019f8:     	cbz	x2, 0x100001b24 <toyos_crypto::arch::aarch64::sha512_blocks+0x134>
1000019fc:     	sub	sp, sp, #0x80
100001a00:     	add	x8, x1, x2, lsl #7
100001a04:     	mov	x9, sp
100001a08:     	adrp	x10, 0x100038000 <dyld_stub_binder+0x100038000>
100001a0c:     	add	x10, x10, #0x5a0
100001a10:     	b	0x100001a30 <toyos_crypto::arch::aarch64::sha512_blocks+0x40>
100001a14:     	add.2d	v3, v16, v3
100001a18:     	add.2d	v2, v6, v2
100001a1c:     	add.2d	v1, v17, v1
100001a20:     	add.2d	v0, v4, v0
100001a24:     	add	x1, x1, #0x80
100001a28:     	cmp	x1, x8
100001a2c:     	b.eq	0x100001b20 <toyos_crypto::arch::aarch64::sha512_blocks+0x130>
100001a30:     	mov	x11, #0x0               ; =0
100001a34:     	ldp	q4, q5, [x1]
100001a38:     	rev64.16b	v4, v4
100001a3c:     	rev64.16b	v5, v5
100001a40:     	ldp	q6, q7, [x1, #0x20]
100001a44:     	rev64.16b	v6, v6
100001a48:     	rev64.16b	v7, v7
100001a4c:     	ldp	q16, q17, [x1, #0x40]
100001a50:     	rev64.16b	v16, v16
100001a54:     	rev64.16b	v17, v17
100001a58:     	ldp	q18, q19, [x1, #0x60]
100001a5c:     	rev64.16b	v18, v18
100001a60:     	rev64.16b	v19, v19
100001a64:     	stp	q4, q5, [sp]
100001a68:     	stp	q6, q7, [sp, #0x20]
100001a6c:     	stp	q16, q17, [sp, #0x40]
100001a70:     	mov.16b	v7, v0
100001a74:     	mov.16b	v16, v3
100001a78:     	mov.16b	v5, v2
100001a7c:     	mov.16b	v17, v1
100001a80:     	stp	q18, q19, [sp, #0x60]
100001a84:     	b	0x100001b04 <toyos_crypto::arch::aarch64::sha512_blocks+0x114>
100001a88:     	and	x13, x11, #0x7
100001a8c:     	lsl	x14, x13, #4
100001a90:     	ldr	q16, [x9, x14]
100001a94:     	and	x15, x12, #0x7
100001a98:     	ldr	q17, [x9, x15, lsl #4]
100001a9c:     	sub	w15, w11, #0x1
100001aa0:     	and	x15, x15, #0x7
100001aa4:     	ldr	q18, [x9, x15, lsl #4]
100001aa8:     	sha512su0.2d	v16, v17
100001aac:     	eor	x13, x13, #0x4
100001ab0:     	ldr	q17, [x9, x13, lsl #4]
100001ab4:     	add	w13, w11, #0x5
100001ab8:     	and	x13, x13, #0x7
100001abc:     	ldr	q19, [x9, x13, lsl #4]
100001ac0:     	ext.16b	v17, v17, v19, #0x8
100001ac4:     	sha512su1.2d	v16, v18, v17
100001ac8:     	str	q16, [x9, x14]
100001acc:     	ldr	q17, [x10, x11, lsl #4]
100001ad0:     	add.2d	v16, v17, v16
100001ad4:     	ext.16b	v16, v16, v16, #0x8
100001ad8:     	add.2d	v16, v16, v7
100001adc:     	ext.16b	v7, v4, v7, #0x8
100001ae0:     	ext.16b	v17, v5, v4, #0x8
100001ae4:     	sha512h.2d	q16, q7, v17
100001ae8:     	add.2d	v17, v16, v5
100001aec:     	sha512h2.2d	q16, q5, v6
100001af0:     	mov.16b	v7, v4
100001af4:     	mov.16b	v5, v6
100001af8:     	mov	x11, x12
100001afc:     	cmp	x12, #0x28
100001b00:     	b.eq	0x100001a14 <toyos_crypto::arch::aarch64::sha512_blocks+0x24>
100001b04:     	mov.16b	v4, v17
100001b08:     	mov.16b	v6, v16
100001b0c:     	add	x12, x11, #0x1
100001b10:     	cmp	x11, #0x7
100001b14:     	b.hi	0x100001a88 <toyos_crypto::arch::aarch64::sha512_blocks+0x98>
100001b18:     	ldr	q16, [x9, x11, lsl #4]
100001b1c:     	b	0x100001acc <toyos_crypto::arch::aarch64::sha512_blocks+0xdc>
100001b20:     	add	sp, sp, #0x80
100001b24:     	stp	q3, q2, [x0]
100001b28:     	stp	q1, q0, [x0, #0x20]
100001b2c:     	mov	w0, #0x1                ; =1
100001b30:     	ret
