_RNvMs0_NtNtCs8xBsXJZo7Hy_12toyos_crypto3ecc4p256NtB5_9SecretKey5agree:
.Lfunc_begin51:
	sub	sp, sp, #272
	stp	x29, x30, [sp, #224]
	stp	x28, x21, [sp, #240]
	stp	x20, x19, [sp, #256]
	add	x29, sp, #224
	movi	v0.2d, #0000000000000000
	mov	x19, x0
	mov	x20, x8
	add	x8, sp, #32
	mov	x0, x1
	mov	x1, x19
	stp	q0, q0, [sp]
	bl	_RNvMs3_NtCs8xBsXJZo7Hy_12toyos_crypto4nistINtB5_5PointNtB5_4P256Kj4_E3mulB7_
	movi	v0.2d, #0000000000000000
	sub	x21, x29, #96
	add	x0, sp, #32
	sub	x1, x29, #96
	add	x2, x21, #32
	stp	q0, q0, [x29, #-96]
	stp	q0, q0, [x29, #-64]
	bl	_RNvMs3_NtCs8xBsXJZo7Hy_12toyos_crypto4nistINtB5_5PointNtB5_4P256Kj4_E6affineB7_
	mov	w8, #255
	bics	wzr, w8, w0
	b.ne	.LBB51_7
	mov	x8, sp
	ldur	x11, [x29, #-96]
	sub	x9, x29, #16
	add	x10, x8, #24
	subs	x12, x9, x10
	rev	x10, x11
	cneg	x11, x12, ls
	stur	x10, [x29, #-16]
	cbz	x11, .LBB51_6
	add	x8, x8, #16
	ldur	x11, [x29, #-88]
	str	x10, [sp, #24]
	subs	x8, x9, x8
	rev	x9, x11
	cneg	x8, x8, ls
	stur	x9, [x29, #-16]
	cbz	x8, .LBB51_6
	mov	x8, sp
	ldur	x12, [x29, #-80]
	sub	x10, x29, #16
	orr	x11, x8, #0x8
	str	x9, [sp, #16]
	subs	x11, x10, x11
	rev	x9, x12
	cneg	x11, x11, ls
	stur	x9, [x29, #-16]
	cbz	x11, .LBB51_6
	ldur	x11, [x29, #-72]
	subs	x10, x10, x8
	str	x9, [sp, #8]
	cneg	x9, x10, ls
	rev	x8, x11
	stur	x8, [x29, #-16]
	cbz	x9, .LBB51_6
	str	x8, [sp]
	sub	x8, x29, #96
	stp	xzr, xzr, [x29, #-16]
	ldur	q0, [x29, #-16]
	stur	q0, [x29, #-96]
	stp	xzr, xzr, [x29, #-16]
	ldur	q0, [x29, #-16]
	stur	q0, [x8, #16]
	stp	xzr, xzr, [x29, #-16]
	ldur	q0, [x29, #-16]
	stur	q0, [x21, #32]
	stp	xzr, xzr, [x29, #-16]
	ldur	q0, [x29, #-16]
	stur	q0, [x29, #-48]
	//MEMBARRIER
	stp	xzr, xzr, [x29, #-96]
	ldur	q0, [x29, #-96]
	str	q0, [sp, #32]
	stp	xzr, xzr, [x29, #-96]
	ldur	q0, [x29, #-96]
	str	q0, [sp, #48]
	stp	xzr, xzr, [x29, #-96]
	ldur	q0, [x29, #-96]
	str	q0, [sp, #64]
	stp	xzr, xzr, [x29, #-96]
	ldur	q0, [x29, #-96]
	str	q0, [sp, #80]
	stp	xzr, xzr, [x29, #-96]
	ldur	q0, [x29, #-96]
	str	q0, [sp, #96]
	stp	xzr, xzr, [x29, #-96]
	ldur	q0, [x29, #-96]
	str	q0, [sp, #112]
	//MEMBARRIER
	ldp	q0, q1, [sp]
	strb	wzr, [x20]
	stur	q0, [x20, #1]
	stur	q1, [x20, #17]
	str	xzr, [x19]
	str	xzr, [x19, #8]
	str	xzr, [x19, #16]
	str	xzr, [x19, #24]
	//MEMBARRIER
	ldp	x20, x19, [sp, #256]
	ldp	x28, x21, [sp, #240]
	ldp	x29, x30, [sp, #224]
	add	sp, sp, #272
	ret
.LBB51_6:
	adrp	x0, .Lanon.ce89d528133a8615234dc292d00b17b0.132
	add	x0, x0, :lo12:.Lanon.ce89d528133a8615234dc292d00b17b0.132
	adrp	x3, .Lanon.ce89d528133a8615234dc292d00b17b0.3
	add	x3, x3, :lo12:.Lanon.ce89d528133a8615234dc292d00b17b0.3
	mov	w1, #567
	mov	w2, wzr
	bl	_RNvNtCs1iGS1rTreNT_4core9panicking18panic_nounwind_fmt
.LBB51_7:
	sturb	w0, [x29, #-20]
	adrp	x0, .Lanon.ce89d528133a8615234dc292d00b17b0.57
	add	x0, x0, :lo12:.Lanon.ce89d528133a8615234dc292d00b17b0.57
	adrp	x3, .Lanon.ce89d528133a8615234dc292d00b17b0.19
	add	x3, x3, :lo12:.Lanon.ce89d528133a8615234dc292d00b17b0.19
	adrp	x4, .Lanon.ce89d528133a8615234dc292d00b17b0.58
	add	x4, x4, :lo12:.Lanon.ce89d528133a8615234dc292d00b17b0.58
	sub	x2, x29, #20
	mov	w1, #46
	bl	_RNvNtCs1iGS1rTreNT_4core6result13unwrap_failed
	brk	#0x1
.LBB51_9:
	stp	xzr, xzr, [x29, #-16]
	ldur	q0, [x29, #-16]
	stur	q0, [x29, #-96]
	stp	xzr, xzr, [x29, #-16]
	ldur	q0, [x29, #-16]
	stur	q0, [x29, #-80]
	stp	xzr, xzr, [x29, #-16]
	ldur	q0, [x29, #-16]
	stur	q0, [x21, #32]
	stp	xzr, xzr, [x29, #-16]
	ldur	q0, [x29, #-16]
	stur	q0, [x29, #-48]
	//MEMBARRIER
	stp	xzr, xzr, [x29, #-16]
	ldur	q0, [x29, #-16]
	str	q0, [sp, #32]
	stp	xzr, xzr, [x29, #-16]
	ldur	q0, [x29, #-16]
	str	q0, [sp, #48]
	stp	xzr, xzr, [x29, #-16]
	ldur	q0, [x29, #-16]
	str	q0, [sp, #64]
	stp	xzr, xzr, [x29, #-16]
	ldur	q0, [x29, #-16]
	str	q0, [sp, #80]
	stp	xzr, xzr, [x29, #-16]
	ldur	q0, [x29, #-16]
	str	q0, [sp, #96]
	stp	xzr, xzr, [x29, #-16]
	ldur	q0, [x29, #-16]
	str	q0, [sp, #112]
	//MEMBARRIER
	stp	xzr, xzr, [x29, #-16]
	ldur	q0, [x29, #-16]
	str	q0, [sp]
	stp	xzr, xzr, [x29, #-16]
	ldur	q0, [x29, #-16]
	str	q0, [sp, #16]
	//MEMBARRIER
	str	xzr, [x19]
	str	xzr, [x19, #8]
	str	xzr, [x19, #16]
	str	xzr, [x19, #24]
	//MEMBARRIER
	bl	_Unwind_Resume
.Lfunc_end51:
	.size	_RNvMs0_NtNtCs8xBsXJZo7Hy_12toyos_crypto3ecc4p256NtB5_9SecretKey5agree, .Lfunc_end51-_RNvMs0_NtNtCs8xBsXJZo7Hy_12toyos_crypto3ecc4p256NtB5_9SecretKey5agree
