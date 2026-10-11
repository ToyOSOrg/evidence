__RNvMNtNtCs4Gj4qKN687T_12toyos_crypto15rustls_provider6cipherNtB2_9Algorithm7sealing:
Lfunc_begin28:
	.cfi_startproc
	.cfi_personality 155, _rust_eh_personality
	.cfi_lsda 16, Lexception28
	stp	x22, x21, [sp, #-48]!
	.cfi_def_cfa_offset 48
	stp	x20, x19, [sp, #16]
	stp	x29, x30, [sp, #32]
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_remember_state
	sub	sp, sp, #1072
	str	xzr, [sp]
	mov	x20, x1
	mov	x19, x0
	add	x8, sp, #16
	movi.2d	v0, #0000000000000000
	ands	w9, w0, #0xff
	b.eq	LBB73_3
	cmp	w9, #2
	b.ne	LBB73_4
	stp	q0, q0, [sp, #576]
	mov	w10, #2
	b	LBB73_6
LBB73_3:
	stp	q0, q0, [sp, #544]
	stp	q0, q0, [sp, #512]
	stp	q0, q0, [sp, #480]
	stp	q0, q0, [sp, #448]
	stp	q0, q0, [sp, #416]
	stp	q0, q0, [sp, #384]
	stp	q0, q0, [sp, #352]
	str	q0, [sp, #336]
Lloh109:
	adrp	x10, __RNvNtNtNtCs4Gj4qKN687T_12toyos_crypto4arch7aarch643cpu3ARM.0@PAGE
Lloh110:
	add	x10, x10, __RNvNtNtNtCs4Gj4qKN687T_12toyos_crypto4arch7aarch643cpu3ARM.0@PAGEOFF
	ldaprb	w9, [x10]
	stp	xzr, xzr, [sp, #16]
	ldaprb	w10, [x10]
	ldp	q0, q1, [sp, #528]
	ldp	q3, q2, [sp, #496]
	stp	q2, q0, [sp, #768]
	ldr	q0, [sp, #560]
	stp	q1, q0, [sp, #800]
	ldp	q0, q1, [sp, #464]
	ldp	q4, q2, [sp, #432]
	stp	q2, q0, [sp, #704]
	stp	q1, q3, [sp, #736]
	ldp	q0, q1, [sp, #400]
	ldp	q3, q2, [sp, #368]
	stp	q2, q0, [sp, #640]
	mov	w11, #5
	and	w9, w9, w11
	cmp	w9, #4
	cset	w9, ne
	and	w10, w10, #0x6
	cmp	w10, #4
	cset	w10, ne
	stp	q1, q4, [sp, #672]
	ldp	q0, q1, [sp, #336]
	stp	q1, q3, [sp, #608]
	ldr	q1, [sp, #16]
	mov	w11, #10
	b	LBB73_5
LBB73_4:
	str	q0, [sp, #1056]
	str	q0, [sp, #1040]
	stp	q0, q0, [sp, #1008]
	stp	q0, q0, [sp, #976]
	stp	q0, q0, [sp, #944]
	stp	q0, q0, [sp, #912]
	stp	q0, q0, [sp, #880]
	stp	q0, q0, [sp, #848]
	str	q0, [sp, #832]
Lloh111:
	adrp	x10, __RNvNtNtNtCs4Gj4qKN687T_12toyos_crypto4arch7aarch643cpu3ARM.0@PAGE
Lloh112:
	add	x10, x10, __RNvNtNtNtCs4Gj4qKN687T_12toyos_crypto4arch7aarch643cpu3ARM.0@PAGEOFF
	ldaprb	w9, [x10]
	stp	xzr, xzr, [sp, #16]
	ldaprb	w10, [x10]
	ldp	q2, q0, [sp, #1008]
	ldr	q1, [sp, #1040]
	stp	q2, q0, [sp, #768]
	ldr	q0, [sp, #1056]
	stp	q1, q0, [sp, #800]
	ldp	q2, q0, [sp, #944]
	ldp	q1, q3, [sp, #976]
	stp	q2, q0, [sp, #704]
	stp	q1, q3, [sp, #736]
	ldp	q2, q0, [sp, #880]
	ldp	q1, q4, [sp, #912]
	stp	q2, q0, [sp, #640]
	mov	w11, #5
	and	w9, w9, w11
	cmp	w9, #4
	cset	w9, ne
	and	w10, w10, #0x6
	cmp	w10, #4
	cset	w10, ne
	stp	q1, q4, [sp, #672]
	ldr	q0, [sp, #832]
	ldp	q1, q3, [sp, #848]
	stp	q1, q3, [sp, #608]
	ldr	q1, [sp, #16]
	mov	w11, #14
LBB73_5:
	stp	q1, q0, [sp, #576]
LBB73_6:
	ldp	q0, q1, [sp, #768]
	stur	q0, [x8, #200]
	stur	q1, [x8, #216]
	ldp	q0, q1, [sp, #800]
	stur	q0, [x8, #232]
	stur	q1, [x8, #248]
	ldp	q0, q1, [sp, #704]
	stur	q0, [x8, #136]
	stur	q1, [x8, #152]
	ldp	q0, q1, [sp, #736]
	stur	q0, [x8, #168]
	stur	q1, [x8, #184]
	ldp	q0, q1, [sp, #640]
	stur	q0, [sp, #88]
	stur	q1, [sp, #104]
	ldp	q0, q1, [sp, #672]
	stur	q0, [sp, #120]
	stur	q1, [x8, #120]
	ldp	q0, q1, [sp, #576]
	stur	q0, [sp, #24]
	stur	q1, [sp, #40]
	ldp	q0, q1, [sp, #608]
	stur	q0, [sp, #56]
	ldr	x8, [x2]
	str	x8, [sp]
	ldr	w8, [x2, #8]
	str	w8, [sp, #8]
	stur	q1, [sp, #72]
	str	x11, [sp, #280]
	strb	w9, [sp, #288]
	strb	w10, [sp, #296]
	ldr	x8, [sp]
	stp	xzr, x8, [sp, #304]
	ldr	w8, [sp, #8]
	str	w8, [sp, #320]
	strb	wzr, [sp, #324]
	str	xzr, [sp, #16]
	strb	w3, [sp, #328]
	strb	w4, [sp, #329]
	bl	__RNvCs1njKG4L9aB3_7___rustc35___rust_no_alloc_shim_is_unstable_v2
	mov	w0, #320
	mov	w1, #8
	bl	__RNvCs1njKG4L9aB3_7___rustc12___rust_alloc
	cbz	x0, LBB73_12
	mov	x21, x0
	add	x1, sp, #16
	mov	w2, #320
	bl	_memcpy
Ltmp380:
	mov	x0, x20
	bl	__RNvXs9_NtNtCsIlpPUM2vLm_6rustls6crypto6cipherNtB5_7AeadKeyINtNtCs8Mbv00yxnRz_4core7convert5AsRefShE6as_ref
Ltmp381:
	tst	w19, #0xff
	mov	w8, #32
	mov	w9, #16
	csel	x2, x9, x8, eq
	cmp	x2, x1
	b.hi	LBB73_11
Ltmp382:
	mov	x3, x0
	add	x0, x21, #8
	mov	x1, x3
	bl	__RNvMNtCs4Gj4qKN687T_12toyos_crypto4aeadNtB2_3Key10initialize
Ltmp383:
	mov	x0, x21
	add	sp, sp, #1072
	.cfi_def_cfa wsp, 48
	ldp	x29, x30, [sp, #32]
	ldp	x20, x19, [sp, #16]
	ldp	x22, x21, [sp], #48
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	ret
LBB73_11:
	.cfi_restore_state
Ltmp384:
Lloh113:
	adrp	x3, l_anon.1e983645a80a3e538ba0bfb5baccf804.36@PAGE
Lloh114:
	add	x3, x3, l_anon.1e983645a80a3e538ba0bfb5baccf804.36@PAGEOFF
	mov	x0, #0
	mov	x8, x1
	mov	x1, x2
	mov	x2, x8
	bl	__RNvNtNtCs8Mbv00yxnRz_4core5slice5index16slice_index_fail
Ltmp385:
	b	LBB73_13
LBB73_12:
Ltmp387:
	mov	w0, #8
	mov	w1, #320
	bl	__RNvNtCshxvaOLs88l5_5alloc5alloc18handle_alloc_error
Ltmp388:
LBB73_13:
	brk	#0x1
LBB73_14:
Ltmp389:
	mov	x19, x0
	add	x0, sp, #16
	bl	__RINvNtCs8Mbv00yxnRz_4core3ptr9drop_glueNtNtNtCs4Gj4qKN687T_12toyos_crypto15rustls_provider6cipher4SealEBH_
	mov	x0, x19
	bl	__Unwind_Resume
LBB73_15:
Ltmp386:
	mov	x19, x0
	mov	x0, x21
	bl	__RINvNtCs8Mbv00yxnRz_4core3ptr9drop_glueINtNtCshxvaOLs88l5_5alloc5boxed3BoxNtNtNtCs4Gj4qKN687T_12toyos_crypto15rustls_provider6cipher4SealEEB1g_
	mov	x0, x19
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh109, Lloh110
	.loh AdrpAdd	Lloh111, Lloh112
	.loh AdrpAdd	Lloh113, Lloh114
Lfunc_end28:
	.cfi_endproc
__RNvMNtNtCs4Gj4qKN687T_12toyos_crypto15rustls_provider6cipherNtB2_9Algorithm7opening:
Lfunc_begin27:
	.cfi_startproc
	.cfi_personality 155, _rust_eh_personality
	.cfi_lsda 16, Lexception27
	stp	x22, x21, [sp, #-48]!
	.cfi_def_cfa_offset 48
	stp	x20, x19, [sp, #16]
	stp	x29, x30, [sp, #32]
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_remember_state
	sub	sp, sp, #1040
	str	xzr, [sp]
	mov	x20, x1
	mov	x19, x0
	movi.2d	v0, #0000000000000000
	ands	w8, w0, #0xff
	b.eq	LBB72_3
	cmp	w8, #2
	b.ne	LBB72_4
	stp	q0, q0, [sp, #544]
	mov	w9, #2
	b	LBB72_6
LBB72_3:
	stp	q0, q0, [sp, #512]
	stp	q0, q0, [sp, #480]
	stp	q0, q0, [sp, #448]
	stp	q0, q0, [sp, #416]
	stp	q0, q0, [sp, #384]
	stp	q0, q0, [sp, #352]
	stp	q0, q0, [sp, #320]
	str	q0, [sp, #304]
Lloh103:
	adrp	x9, __RNvNtNtNtCs4Gj4qKN687T_12toyos_crypto4arch7aarch643cpu3ARM.0@PAGE
Lloh104:
	add	x9, x9, __RNvNtNtNtCs4Gj4qKN687T_12toyos_crypto4arch7aarch643cpu3ARM.0@PAGEOFF
	ldaprb	w8, [x9]
	stp	xzr, xzr, [sp]
	ldaprb	w9, [x9]
	ldp	q0, q1, [sp, #496]
	ldp	q3, q2, [sp, #464]
	stp	q2, q0, [sp, #736]
	ldr	q0, [sp, #528]
	stp	q1, q0, [sp, #768]
	ldp	q0, q1, [sp, #432]
	ldp	q4, q2, [sp, #400]
	stp	q2, q0, [sp, #672]
	stp	q1, q3, [sp, #704]
	ldp	q0, q1, [sp, #368]
	ldp	q3, q2, [sp, #336]
	stp	q2, q0, [sp, #608]
	mov	w10, #5
	and	w8, w8, w10
	cmp	w8, #4
	cset	w8, ne
	and	w9, w9, #0x6
	cmp	w9, #4
	cset	w9, ne
	stp	q1, q4, [sp, #640]
	ldp	q0, q1, [sp, #304]
	stp	q1, q3, [sp, #576]
	ldr	q1, [sp]
	mov	w10, #10
	b	LBB72_5
LBB72_4:
	stp	q0, q0, [sp, #1008]
	stp	q0, q0, [sp, #976]
	stp	q0, q0, [sp, #944]
	stp	q0, q0, [sp, #912]
	stp	q0, q0, [sp, #880]
	stp	q0, q0, [sp, #848]
	stp	q0, q0, [sp, #816]
	str	q0, [sp, #800]
Lloh105:
	adrp	x9, __RNvNtNtNtCs4Gj4qKN687T_12toyos_crypto4arch7aarch643cpu3ARM.0@PAGE
Lloh106:
	add	x9, x9, __RNvNtNtNtCs4Gj4qKN687T_12toyos_crypto4arch7aarch643cpu3ARM.0@PAGEOFF
	ldaprb	w8, [x9]
	stp	xzr, xzr, [sp]
	ldaprb	w9, [x9]
	ldp	q0, q1, [sp, #992]
	ldp	q3, q2, [sp, #960]
	stp	q2, q0, [sp, #736]
	ldr	q0, [sp, #1024]
	stp	q1, q0, [sp, #768]
	ldp	q0, q1, [sp, #928]
	ldp	q4, q2, [sp, #896]
	stp	q2, q0, [sp, #672]
	stp	q1, q3, [sp, #704]
	ldp	q0, q1, [sp, #864]
	ldp	q3, q2, [sp, #832]
	stp	q2, q0, [sp, #608]
	mov	w10, #5
	and	w8, w8, w10
	cmp	w8, #4
	cset	w8, ne
	and	w9, w9, #0x6
	cmp	w9, #4
	cset	w9, ne
	stp	q1, q4, [sp, #640]
	ldp	q0, q1, [sp, #800]
	stp	q1, q3, [sp, #576]
	ldr	q1, [sp]
	mov	w10, #14
LBB72_5:
	stp	q1, q0, [sp, #544]
LBB72_6:
	ldp	q0, q1, [sp, #736]
	stp	q0, q1, [sp, #192]
	ldp	q0, q1, [sp, #768]
	stp	q0, q1, [sp, #224]
	ldp	q0, q1, [sp, #672]
	stp	q0, q1, [sp, #128]
	ldp	q0, q1, [sp, #704]
	stp	q0, q1, [sp, #160]
	ldp	q0, q1, [sp, #608]
	stp	q0, q1, [sp, #64]
	ldp	q0, q1, [sp, #640]
	stp	q0, q1, [sp, #96]
	ldp	q0, q1, [sp, #544]
	stp	q0, q1, [sp]
	ldp	q0, q1, [sp, #576]
	stp	q0, q1, [sp, #32]
	str	x10, [sp, #256]
	strb	w8, [sp, #264]
	strb	w9, [sp, #272]
	ldr	x8, [x2]
	str	x8, [sp, #280]
	ldr	w8, [x2, #8]
	str	w8, [sp, #288]
	strb	w3, [sp, #292]
	strb	w4, [sp, #293]
	bl	__RNvCs1njKG4L9aB3_7___rustc35___rust_no_alloc_shim_is_unstable_v2
	mov	w0, #296
	mov	w1, #8
	bl	__RNvCs1njKG4L9aB3_7___rustc12___rust_alloc
	cbz	x0, LBB72_12
	mov	x21, x0
	mov	x1, sp
	mov	w2, #296
	bl	_memcpy
Ltmp370:
	mov	x0, x20
	bl	__RNvXs9_NtNtCsIlpPUM2vLm_6rustls6crypto6cipherNtB5_7AeadKeyINtNtCs8Mbv00yxnRz_4core7convert5AsRefShE6as_ref
Ltmp371:
	tst	w19, #0xff
	mov	w8, #32
	mov	w9, #16
	csel	x2, x9, x8, eq
	cmp	x2, x1
	b.hi	LBB72_11
Ltmp372:
	mov	x3, x0
	mov	x0, x21
	mov	x1, x3
	bl	__RNvMNtCs4Gj4qKN687T_12toyos_crypto4aeadNtB2_3Key10initialize
Ltmp373:
	mov	x0, x21
	add	sp, sp, #1040
	.cfi_def_cfa wsp, 48
	ldp	x29, x30, [sp, #32]
	ldp	x20, x19, [sp, #16]
	ldp	x22, x21, [sp], #48
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	ret
LBB72_11:
	.cfi_restore_state
Ltmp374:
Lloh107:
	adrp	x3, l_anon.1e983645a80a3e538ba0bfb5baccf804.36@PAGE
Lloh108:
	add	x3, x3, l_anon.1e983645a80a3e538ba0bfb5baccf804.36@PAGEOFF
	mov	x0, #0
	mov	x8, x1
	mov	x1, x2
	mov	x2, x8
	bl	__RNvNtNtCs8Mbv00yxnRz_4core5slice5index16slice_index_fail
Ltmp375:
	b	LBB72_13
LBB72_12:
Ltmp377:
	mov	w0, #8
	mov	w1, #296
	bl	__RNvNtCshxvaOLs88l5_5alloc5alloc18handle_alloc_error
Ltmp378:
LBB72_13:
	brk	#0x1
LBB72_14:
Ltmp379:
	mov	x19, x0
	mov	x0, sp
	bl	__RINvNtCs8Mbv00yxnRz_4core3ptr9drop_glueNtNtNtCs4Gj4qKN687T_12toyos_crypto15rustls_provider6cipher4OpenEBH_
	mov	x0, x19
	bl	__Unwind_Resume
LBB72_15:
Ltmp376:
	mov	x19, x0
	mov	x0, x21
	bl	__RINvNtCs8Mbv00yxnRz_4core3ptr9drop_glueINtNtCshxvaOLs88l5_5alloc5boxed3BoxNtNtNtCs4Gj4qKN687T_12toyos_crypto15rustls_provider6cipher4OpenEEB1g_
	mov	x0, x19
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh103, Lloh104
	.loh AdrpAdd	Lloh105, Lloh106
	.loh AdrpAdd	Lloh107, Lloh108
Lfunc_end27:
	.cfi_endproc
__RNvMNtCs4Gj4qKN687T_12toyos_crypto4aeadNtB2_3Key10initialize:
	.cfi_startproc
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x20, x19, [sp, #16]
	stp	x29, x30, [sp, #32]
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_remember_state
	ldrb	w8, [x0, #272]
	cmp	w8, #2
	b.ne	LBB49_3
	cmp	x2, #32
	b.ne	LBB49_5
	ldp	q0, q1, [x1]
	stp	q0, q1, [x0]
	.cfi_def_cfa wsp, 48
	ldp	x29, x30, [sp, #32]
	ldp	x20, x19, [sp, #16]
	add	sp, sp, #48
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	ret
LBB49_3:
	.cfi_restore_state
	.cfi_remember_state
	ldr	x3, [x0, #256]
	mov	w8, #32
	mov	w9, #16
	cmp	x3, #10
	csel	x8, x9, x8, eq
	stp	x2, x8, [sp]
	cmp	x2, x8
	b.ne	LBB49_6
	ldrb	w4, [x0, #264]
	mov	x19, x0
	add	x0, x0, #16
	bl	__RNvMNtCs4Gj4qKN687T_12toyos_crypto3aesNtB2_3Aes11expand_into
	stp	xzr, xzr, [x19]
	add	x0, x19, #16
	mov	x1, x19
	.cfi_def_cfa wsp, 48
	ldp	x29, x30, [sp, #32]
	ldp	x20, x19, [sp, #16]
	add	sp, sp, #48
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	b	__RNvMNtCs4Gj4qKN687T_12toyos_crypto3aesNtB2_3Aes7encrypt
LBB49_5:
	.cfi_restore_state
Lloh69:
	adrp	x8, l_anon.1e983645a80a3e538ba0bfb5baccf804.18@PAGE
Lloh70:
	add	x8, x8, l_anon.1e983645a80a3e538ba0bfb5baccf804.18@PAGEOFF
	mov	w0, #32
	mov	x1, x2
	mov	x2, x8
	bl	__RNvNvNtCs8Mbv00yxnRz_4core5slice20copy_from_slice_impl17len_mismatch_fail
LBB49_6:
Lloh71:
	adrp	x5, l_anon.1e983645a80a3e538ba0bfb5baccf804.12@PAGE
Lloh72:
	add	x5, x5, l_anon.1e983645a80a3e538ba0bfb5baccf804.12@PAGEOFF
	mov	x1, sp
	add	x2, sp, #8
	mov	w0, #0
	mov	x3, #0
	bl	__RINvNtCs8Mbv00yxnRz_4core9panicking13assert_failedjjEB4_
	.loh AdrpAdd	Lloh69, Lloh70
	.loh AdrpAdd	Lloh71, Lloh72
	.cfi_endproc
__RNvMNtCs4Gj4qKN687T_12toyos_crypto3aesNtB2_3Aes11expand_into:
	.cfi_startproc
	sub	sp, sp, #128
	.cfi_def_cfa_offset 128
	stp	x28, x27, [sp, #32]
	stp	x26, x25, [sp, #48]
	stp	x24, x23, [sp, #64]
	stp	x22, x21, [sp, #80]
	stp	x20, x19, [sp, #96]
	stp	x29, x30, [sp, #112]
	add	x29, sp, #112
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	mov	x24, x4
	mov	x22, x3
	mov	x20, x2
	mov	x21, x0
	bl	_memcpy
	lsl	x8, x22, #4
	add	x8, x8, #16
	subs	x8, x8, x20
	b.ls	LBB36_18
	mov	x26, #0
	lsr	x9, x8, #2
	tst	x8, #0x3
	cinc	x27, x9, ne
	add	x8, sp, #20
	orr	x25, x8, #0x1
	add	x19, x21, x20
	mov	w8, #1
	str	w8, [sp, #16]
	str	w24, [sp, #8]
LBB36_2:
	add	x28, x20, x26
	add	x8, x19, x26
	ldur	w22, [x8, #-4]
	str	w22, [sp, #20]
	udiv	x8, x28, x20
	msub	x8, x8, x20, x28
	cbz	x8, LBB36_7
	cmp	x20, #32
	b.ne	LBB36_11
	and	x8, x28, #0x1f
	cmp	x8, #16
	b.ne	LBB36_11
	tbz	w24, #0, LBB36_16
	add	x0, sp, #20
	bl	__RNvNtNtCs4Gj4qKN687T_12toyos_crypto4arch7aarch647subword
	ldrb	w22, [sp, #20]
	sub	x8, x28, #240
	cbnz	x8, LBB36_12
	b	LBB36_17
LBB36_7:
	ldrh	w8, [x25]
	ldrb	w9, [x25, #2]
	strb	w9, [sp, #22]
	strh	w8, [sp, #20]
	strb	w22, [sp, #23]
	tbz	w24, #0, LBB36_9
	add	x0, sp, #20
	bl	__RNvNtNtCs4Gj4qKN687T_12toyos_crypto4arch7aarch647subword
	ldrb	w23, [sp, #20]
	b	LBB36_10
LBB36_9:
	ldrb	w0, [sp, #20]
	bl	__RNvNtCs4Gj4qKN687T_12toyos_crypto3aes4sbox
	mov	x23, x0
	strb	w0, [sp, #20]
	ldrb	w0, [sp, #21]
	bl	__RNvNtCs4Gj4qKN687T_12toyos_crypto3aes4sbox
	strb	w0, [sp, #21]
	ldrb	w0, [sp, #22]
	bl	__RNvNtCs4Gj4qKN687T_12toyos_crypto3aes4sbox
	strb	w0, [sp, #22]
	mov	x0, x22
	bl	__RNvNtCs4Gj4qKN687T_12toyos_crypto3aes4sbox
	strb	w0, [sp, #23]
LBB36_10:
	ldr	w9, [sp, #16]
	eor	w22, w23, w9
	ubfx	w8, w9, #7, #1
	str	x8, [sp, #24]
	ldr	x8, [sp, #24]
	neg	w8, w8
	mov	w10, #27
	and	w8, w8, w10
	eor	w9, w8, w9, lsl #1
	str	w9, [sp, #16]
LBB36_11:
	sub	x8, x28, #240
	cbz	x8, LBB36_17
LBB36_12:
	ldrb	w8, [x21, x26]
	eor	w8, w8, w22
	strb	w8, [x19, x26]
	cmp	x28, #238
	b.hi	LBB36_17
	ldrb	w10, [sp, #21]
	add	x8, x21, x26
	ldrb	w11, [x8, #1]
	add	x9, x19, x26
	eor	w10, w11, w10
	strb	w10, [x9, #1]
	sub	x10, x28, #238
	cbz	x10, LBB36_17
	ldrb	w10, [sp, #22]
	ldrb	w8, [x8, #2]
	eor	w8, w8, w10
	strb	w8, [x9, #2]
	cmp	x28, #236
	b.hi	LBB36_17
	ldrb	w8, [sp, #23]
	add	x9, x21, x26
	ldrb	w9, [x9, #3]
	add	x10, x19, x26
	eor	w8, w9, w8
	strb	w8, [x10, #3]
	strb	wzr, [sp, #20]
	strb	wzr, [sp, #21]
	strb	wzr, [sp, #22]
	strb	wzr, [sp, #23]
	;MEMBARRIER
	add	x26, x26, #4
	sub	x27, x27, #1
	cbnz	x27, LBB36_2
	b	LBB36_18
LBB36_16:
	lsr	w8, w22, #24
	str	w8, [sp, #12]
	lsr	w24, w22, #16
	mov	x23, x25
	lsr	w25, w22, #8
	mov	x0, x22
	bl	__RNvNtCs4Gj4qKN687T_12toyos_crypto3aes4sbox
	mov	x22, x0
	strb	w0, [sp, #20]
	mov	x0, x25
	mov	x25, x23
	bl	__RNvNtCs4Gj4qKN687T_12toyos_crypto3aes4sbox
	strb	w0, [sp, #21]
	mov	x0, x24
	ldr	w24, [sp, #8]
	bl	__RNvNtCs4Gj4qKN687T_12toyos_crypto3aes4sbox
	strb	w0, [sp, #22]
	ldr	w0, [sp, #12]
	bl	__RNvNtCs4Gj4qKN687T_12toyos_crypto3aes4sbox
	strb	w0, [sp, #23]
	sub	x8, x28, #240
	cbnz	x8, LBB36_12
LBB36_17:
Lloh30:
	adrp	x2, l_anon.1e983645a80a3e538ba0bfb5baccf804.13@PAGE
Lloh31:
	add	x2, x2, l_anon.1e983645a80a3e538ba0bfb5baccf804.13@PAGEOFF
	mov	w0, #240
	mov	w1, #240
	bl	__RNvNtCs8Mbv00yxnRz_4core9panicking18panic_bounds_check
LBB36_18:
	.cfi_def_cfa wsp, 128
	ldp	x29, x30, [sp, #112]
	ldp	x20, x19, [sp, #96]
	ldp	x22, x21, [sp, #80]
	ldp	x24, x23, [sp, #64]
	ldp	x26, x25, [sp, #48]
	ldp	x28, x27, [sp, #32]
	add	sp, sp, #128
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	.cfi_restore w23
	.cfi_restore w24
	.cfi_restore w25
	.cfi_restore w26
	.cfi_restore w27
	.cfi_restore w28
	ret
	.loh AdrpAdd	Lloh30, Lloh31
	.cfi_endproc
