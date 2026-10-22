_RNvMs_NtCs8xBsXJZo7Hy_12toyos_crypto6x25519NtB4_9SecretKey5agree:
.Lfunc_begin101:
	sub	sp, sp, #96
	stp	x29, x30, [sp, #48]
	str	x21, [sp, #64]
	stp	x20, x19, [sp, #80]
	add	x29, sp, #48
	movi	v0.2d, #0000000000000000
	mov	x2, sp
	mov	x19, x0
	mov	x20, x8
	mov	x21, sp
	stp	q0, q0, [sp]
	bl	_RNvNtCs8xBsXJZo7Hy_12toyos_crypto6x255198multiply
	ldrb	w8, [sp]
	ldrb	w9, [sp, #1]
	ldrb	w10, [sp, #2]
	ldrb	w11, [sp, #3]
	ldrb	w12, [sp, #4]
	ldrb	w13, [sp, #5]
	orr	w8, w8, w9
	ldrb	w14, [sp, #6]
	ldrb	w15, [sp, #24]
	orr	w9, w10, w11
	orr	w10, w12, w13
	ldrb	w11, [sp, #8]
	orr	w8, w8, w9
	orr	w9, w10, w14
	ldrb	w10, [sp, #7]
	orr	w8, w8, w9
	ldrb	w9, [sp, #9]
	ldrb	w12, [sp, #11]
	ldrb	w13, [sp, #12]
	orr	w10, w10, w11
	ldrb	w11, [sp, #10]
	ldrb	w14, [sp, #13]
	orr	w9, w10, w9
	orr	w10, w12, w13
	ldrb	w12, [sp, #14]
	orr	w9, w9, w11
	orr	w10, w10, w14
	ldrb	w11, [sp, #15]
	ldrb	w13, [sp, #17]
	orr	w10, w10, w12
	ldrb	w12, [sp, #16]
	orr	w8, w8, w9
	orr	w9, w10, w11
	ldrb	w10, [sp, #18]
	ldrb	w11, [sp, #19]
	orr	w8, w8, w9
	orr	w9, w12, w13
	ldrb	w12, [sp, #22]
	ldrb	w13, [sp, #23]
	orr	w9, w9, w10
	ldrb	w10, [sp, #20]
	orr	w9, w9, w11
	ldrb	w14, [sp, #30]
	orr	w11, w12, w13
	ldrb	w12, [sp, #25]
	orr	w9, w9, w10
	orr	w10, w11, w15
	ldrb	w11, [sp, #26]
	ldrb	w13, [sp, #21]
	orr	w10, w10, w12
	ldrb	w12, [sp, #27]
	ldrb	w15, [sp, #29]
	orr	w10, w10, w11
	ldrb	w11, [sp, #28]
	orr	w9, w9, w13
	orr	w10, w10, w12
	ldrb	w12, [sp, #31]
	orr	w8, w8, w9
	orr	w9, w10, w11
	orr	w10, w15, w14
	orr	w8, w8, w9
	orr	w9, w10, w12
	orr	w8, w8, w9
	cmp	w8, #0
	cset	w8, ne
	//APP
	// x8 
	//NO_APP
	cbz	x8, .LBB101_2
	ldp	q0, q1, [sp]
	strb	wzr, [x20]
	stur	q0, [x20, #1]
	stur	q1, [x20, #17]
	b	.LBB101_3
.LBB101_2:
	mov	w8, #769
	stp	xzr, xzr, [x29, #-16]
	strh	w8, [x20]
	ldur	q0, [x29, #-16]
	str	q0, [sp]
	stp	xzr, xzr, [x29, #-16]
	ldur	q0, [x29, #-16]
	stur	q0, [x21, #16]
	//MEMBARRIER
.LBB101_3:
	stp	xzr, xzr, [sp]
	ldr	q0, [sp]
	str	q0, [x19]
	stp	xzr, xzr, [sp]
	ldr	q0, [sp]
	str	q0, [x19, #16]
	//MEMBARRIER
	ldp	x20, x19, [sp, #80]
	ldr	x21, [sp, #64]
	ldp	x29, x30, [sp, #48]
	add	sp, sp, #96
	ret
.Lfunc_end101:
	.size	_RNvMs_NtCs8xBsXJZo7Hy_12toyos_crypto6x25519NtB4_9SecretKey5agree, .Lfunc_end101-_RNvMs_NtCs8xBsXJZo7Hy_12toyos_crypto6x25519NtB4_9SecretKey5agree
