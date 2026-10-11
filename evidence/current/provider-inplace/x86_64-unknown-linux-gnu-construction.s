_RNvMNtNtCsc3dv7wr5mwB_12toyos_crypto15rustls_provider6cipherNtB2_9Algorithm7sealing:
.Lfunc_begin28:
	.cfi_startproc
	.cfi_personality 155, DW.ref.rust_eh_personality
	.cfi_lsda 27, .Lexception28
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$616, %rsp
	.cfi_def_cfa_offset 672
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%r8d, %ebp
	movl	%ecx, %r15d
	movq	%rdx, %r8
	movl	%edi, %ebx
	testb	%bl, %bl
	movq	%rsi, 24(%rsp)
	je	.LBB72_3
	movzbl	%bl, %eax
	cmpl	$2, %eax
	jne	.LBB72_4
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm0, 32(%rsp)
	movb	$2, %r13b
	jmp	.LBB72_5
.LBB72_3:
	movl	$1, %eax
	xorl	%ecx, %ecx
	#APP

	movq	%rbx, %rsi
	cpuid
	xchgq	%rbx, %rsi

	#NO_APP
	movl	%ecx, %r12d
	shrl	$25, %r12d
	andb	$1, %r12b
	movl	$1, %eax
	xorl	%ecx, %ecx
	#APP

	movq	%rbx, %rsi
	cpuid
	xchgq	%rbx, %rsi

	#NO_APP
	movl	%ecx, %r13d
	shrb	%r13b
	andb	$1, %r13b
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 32(%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm0, 64(%rsp)
	movaps	%xmm0, 80(%rsp)
	movaps	%xmm0, 96(%rsp)
	movaps	%xmm0, 112(%rsp)
	movaps	%xmm0, 128(%rsp)
	movaps	%xmm0, 144(%rsp)
	movaps	%xmm0, 160(%rsp)
	movaps	%xmm0, 176(%rsp)
	movaps	%xmm0, 192(%rsp)
	movaps	%xmm0, 208(%rsp)
	movaps	%xmm0, 224(%rsp)
	movaps	%xmm0, 240(%rsp)
	movaps	%xmm0, 256(%rsp)
	movaps	%xmm0, 272(%rsp)
	movl	$10, %r14d
	jmp	.LBB72_5
.LBB72_4:
	movl	$1, %eax
	xorl	%ecx, %ecx
	#APP

	movq	%rbx, %rsi
	cpuid
	xchgq	%rbx, %rsi

	#NO_APP
	movl	%ecx, %r12d
	shrl	$25, %r12d
	andb	$1, %r12b
	movl	$1, %eax
	xorl	%ecx, %ecx
	#APP

	movq	%rbx, %rsi
	cpuid
	xchgq	%rbx, %rsi

	#NO_APP
	movl	%ecx, %r13d
	shrb	%r13b
	andb	$1, %r13b
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 32(%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm0, 64(%rsp)
	movaps	%xmm0, 80(%rsp)
	movaps	%xmm0, 96(%rsp)
	movaps	%xmm0, 112(%rsp)
	movaps	%xmm0, 128(%rsp)
	movaps	%xmm0, 144(%rsp)
	movaps	%xmm0, 160(%rsp)
	movaps	%xmm0, 176(%rsp)
	movaps	%xmm0, 192(%rsp)
	movaps	%xmm0, 208(%rsp)
	movaps	%xmm0, 224(%rsp)
	movaps	%xmm0, 240(%rsp)
	movaps	%xmm0, 256(%rsp)
	movaps	%xmm0, 272(%rsp)
	movl	$14, %r14d
.LBB72_5:
	movl	8(%r8), %eax
	movl	%eax, 16(%rsp)
	movq	(%r8), %rax
	movq	%rax, 8(%rsp)
	leaq	304(%rsp), %rdi
	leaq	32(%rsp), %rsi
	movl	$256, %edx
	callq	*memcpy@GOTPCREL(%rip)
	movq	%r14, 560(%rsp)
	movb	%r12b, 568(%rsp)
	movb	%r13b, 576(%rsp)
	movq	$0, 584(%rsp)
	movq	8(%rsp), %rax
	movq	%rax, 592(%rsp)
	movl	16(%rsp), %eax
	movl	%eax, 600(%rsp)
	movb	$0, 604(%rsp)
	movq	$0, 296(%rsp)
	movb	%r15b, 608(%rsp)
	movb	%bpl, 609(%rsp)
	callq	*_RNvCs1njKG4L9aB3_7___rustc35___rust_no_alloc_shim_is_unstable_v2@GOTPCREL(%rip)
	movl	$320, %edi
	movl	$8, %esi
	callq	*_RNvCs1njKG4L9aB3_7___rustc12___rust_alloc@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.LBB72_6
	movq	%rax, %r15
	leaq	296(%rsp), %rsi
	movl	$320, %edx
	movq	%rax, %rdi
	callq	*memcpy@GOTPCREL(%rip)
.Ltmp358:
	movq	24(%rsp), %rdi
	callq	*_RNvXs9_NtNtCs8iW9FvK90By_6rustls6crypto6cipherNtB5_7AeadKeyINtNtCsgxBkk5gSRhY_4core7convert5AsRefShE6as_ref@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rdx, %rax
.Ltmp359:
	xorl	%edx, %edx
	testb	%bl, %bl
	setne	%dl
	shll	$4, %edx
	addq	$16, %rdx
	cmpq	%rax, %rdx
	ja	.LBB72_12
	movq	%r15, %rdi
	addq	$8, %rdi
.Ltmp360:
	callq	_RNvMNtCsc3dv7wr5mwB_12toyos_crypto4aeadNtB2_3Key10initialize
.Ltmp361:
	movq	%r15, %rax
	addq	$616, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB72_12:
	.cfi_def_cfa_offset 672
.Ltmp362:
	leaq	.Lanon.330c70e8e5180eaf18521ac389e3febd.36(%rip), %rcx
	xorl	%edi, %edi
	movq	%rdx, %rsi
	movq	%rax, %rdx
	callq	*_RNvNtNtCsgxBkk5gSRhY_4core5slice5index16slice_index_fail@GOTPCREL(%rip)
.Ltmp363:
	jmp	.LBB72_7
.LBB72_6:
.Ltmp365:
	movl	$8, %edi
	movl	$320, %esi
	callq	*_RNvNtCs6i54tJFfzR_5alloc5alloc18handle_alloc_error@GOTPCREL(%rip)
.Ltmp366:
.LBB72_7:
	ud2
.LBB72_8:
.Ltmp367:
	movq	%rax, %rbx
	leaq	296(%rsp), %rdi
	callq	_RINvNtCsgxBkk5gSRhY_4core3ptr9drop_glueNtNtNtCsc3dv7wr5mwB_12toyos_crypto15rustls_provider6cipher4SealEBH_
	movq	%rbx, %rdi
	callq	_Unwind_Resume@PLT
.LBB72_13:
.Ltmp364:
	movq	%rax, %rbx
	movq	%r15, %rdi
	callq	_RINvNtCsgxBkk5gSRhY_4core3ptr9drop_glueINtNtCs6i54tJFfzR_5alloc5boxed3BoxNtNtNtCsc3dv7wr5mwB_12toyos_crypto15rustls_provider6cipher4SealEEB1f_
	movq	%rbx, %rdi
	callq	_Unwind_Resume@PLT
.Lfunc_end72:
	.size	_RNvMNtNtCsc3dv7wr5mwB_12toyos_crypto15rustls_provider6cipherNtB2_9Algorithm7sealing, .Lfunc_end72-_RNvMNtNtCsc3dv7wr5mwB_12toyos_crypto15rustls_provider6cipherNtB2_9Algorithm7sealing
	.cfi_endproc
_RNvMNtNtCsc3dv7wr5mwB_12toyos_crypto15rustls_provider6cipherNtB2_9Algorithm7opening:
.Lfunc_begin27:
	.cfi_startproc
	.cfi_personality 155, DW.ref.rust_eh_personality
	.cfi_lsda 27, .Lexception27
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$568, %rsp
	.cfi_def_cfa_offset 624
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdx, %r12
	movl	%edi, %ebx
	testb	%bl, %bl
	movq	%rsi, 8(%rsp)
	movl	%r8d, 4(%rsp)
	je	.LBB71_3
	movzbl	%bl, %eax
	movl	%ecx, %r15d
	cmpl	$2, %eax
	jne	.LBB71_4
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 32(%rsp)
	movaps	%xmm0, 16(%rsp)
	movb	$2, %r14b
	jmp	.LBB71_5
.LBB71_3:
	movl	%ecx, %r15d
	movl	$1, %eax
	xorl	%ecx, %ecx
	#APP

	movq	%rbx, %rsi
	cpuid
	xchgq	%rbx, %rsi

	#NO_APP
	movl	%ecx, %r13d
	shrl	$25, %r13d
	andb	$1, %r13b
	movl	$1, %eax
	xorl	%ecx, %ecx
	#APP

	movq	%rbx, %rsi
	cpuid
	xchgq	%rbx, %rsi

	#NO_APP
	movl	%ecx, %r14d
	shrb	%r14b
	andb	$1, %r14b
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 16(%rsp)
	movaps	%xmm0, 32(%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm0, 64(%rsp)
	movaps	%xmm0, 80(%rsp)
	movaps	%xmm0, 96(%rsp)
	movaps	%xmm0, 112(%rsp)
	movaps	%xmm0, 128(%rsp)
	movaps	%xmm0, 144(%rsp)
	movaps	%xmm0, 160(%rsp)
	movaps	%xmm0, 176(%rsp)
	movaps	%xmm0, 192(%rsp)
	movaps	%xmm0, 208(%rsp)
	movaps	%xmm0, 224(%rsp)
	movaps	%xmm0, 240(%rsp)
	movaps	%xmm0, 256(%rsp)
	movl	$10, %ebp
	jmp	.LBB71_5
.LBB71_4:
	movl	$1, %eax
	xorl	%ecx, %ecx
	#APP

	movq	%rbx, %rsi
	cpuid
	xchgq	%rbx, %rsi

	#NO_APP
	movl	%ecx, %r13d
	shrl	$25, %r13d
	andb	$1, %r13b
	movl	$1, %eax
	xorl	%ecx, %ecx
	#APP

	movq	%rbx, %rsi
	cpuid
	xchgq	%rbx, %rsi

	#NO_APP
	movl	%ecx, %r14d
	shrb	%r14b
	andb	$1, %r14b
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 16(%rsp)
	movaps	%xmm0, 32(%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm0, 64(%rsp)
	movaps	%xmm0, 80(%rsp)
	movaps	%xmm0, 96(%rsp)
	movaps	%xmm0, 112(%rsp)
	movaps	%xmm0, 128(%rsp)
	movaps	%xmm0, 144(%rsp)
	movaps	%xmm0, 160(%rsp)
	movaps	%xmm0, 176(%rsp)
	movaps	%xmm0, 192(%rsp)
	movaps	%xmm0, 208(%rsp)
	movaps	%xmm0, 224(%rsp)
	movaps	%xmm0, 240(%rsp)
	movaps	%xmm0, 256(%rsp)
	movl	$14, %ebp
.LBB71_5:
	leaq	272(%rsp), %rdi
	leaq	16(%rsp), %rsi
	movl	$256, %edx
	callq	*memcpy@GOTPCREL(%rip)
	movq	%rbp, 528(%rsp)
	movb	%r13b, 536(%rsp)
	movb	%r14b, 544(%rsp)
	movq	(%r12), %rax
	movq	%rax, 552(%rsp)
	movl	8(%r12), %eax
	movl	%eax, 560(%rsp)
	movb	%r15b, 564(%rsp)
	movl	4(%rsp), %eax
	movb	%al, 565(%rsp)
	callq	*_RNvCs1njKG4L9aB3_7___rustc35___rust_no_alloc_shim_is_unstable_v2@GOTPCREL(%rip)
	movl	$296, %edi
	movl	$8, %esi
	callq	*_RNvCs1njKG4L9aB3_7___rustc12___rust_alloc@GOTPCREL(%rip)
	testq	%rax, %rax
	je	.LBB71_6
	movq	%rax, %r14
	leaq	272(%rsp), %rsi
	movl	$296, %edx
	movq	%rax, %rdi
	callq	*memcpy@GOTPCREL(%rip)
.Ltmp348:
	movq	8(%rsp), %rdi
	callq	*_RNvXs9_NtNtCs8iW9FvK90By_6rustls6crypto6cipherNtB5_7AeadKeyINtNtCsgxBkk5gSRhY_4core7convert5AsRefShE6as_ref@GOTPCREL(%rip)
	movq	%rax, %rsi
	movq	%rdx, %rax
.Ltmp349:
	xorl	%edx, %edx
	testb	%bl, %bl
	setne	%dl
	shll	$4, %edx
	addq	$16, %rdx
	cmpq	%rax, %rdx
	ja	.LBB71_12
.Ltmp350:
	movq	%r14, %rdi
	callq	_RNvMNtCsc3dv7wr5mwB_12toyos_crypto4aeadNtB2_3Key10initialize
.Ltmp351:
	movq	%r14, %rax
	addq	$568, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB71_12:
	.cfi_def_cfa_offset 624
.Ltmp352:
	leaq	.Lanon.330c70e8e5180eaf18521ac389e3febd.36(%rip), %rcx
	xorl	%edi, %edi
	movq	%rdx, %rsi
	movq	%rax, %rdx
	callq	*_RNvNtNtCsgxBkk5gSRhY_4core5slice5index16slice_index_fail@GOTPCREL(%rip)
.Ltmp353:
	jmp	.LBB71_7
.LBB71_6:
.Ltmp355:
	movl	$8, %edi
	movl	$296, %esi
	callq	*_RNvNtCs6i54tJFfzR_5alloc5alloc18handle_alloc_error@GOTPCREL(%rip)
.Ltmp356:
.LBB71_7:
	ud2
.LBB71_8:
.Ltmp357:
	movq	%rax, %rbx
	leaq	272(%rsp), %rdi
	callq	_RINvNtCsgxBkk5gSRhY_4core3ptr9drop_glueNtNtNtCsc3dv7wr5mwB_12toyos_crypto15rustls_provider6cipher4OpenEBH_
	movq	%rbx, %rdi
	callq	_Unwind_Resume@PLT
.LBB71_13:
.Ltmp354:
	movq	%rax, %rbx
	movq	%r14, %rdi
	callq	_RINvNtCsgxBkk5gSRhY_4core3ptr9drop_glueINtNtCs6i54tJFfzR_5alloc5boxed3BoxNtNtNtCsc3dv7wr5mwB_12toyos_crypto15rustls_provider6cipher4OpenEEB1f_
	movq	%rbx, %rdi
	callq	_Unwind_Resume@PLT
.Lfunc_end71:
	.size	_RNvMNtNtCsc3dv7wr5mwB_12toyos_crypto15rustls_provider6cipherNtB2_9Algorithm7opening, .Lfunc_end71-_RNvMNtNtCsc3dv7wr5mwB_12toyos_crypto15rustls_provider6cipherNtB2_9Algorithm7opening
	.cfi_endproc
_RNvMNtCsc3dv7wr5mwB_12toyos_crypto4aeadNtB2_3Key10initialize:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	cmpb	$2, 272(%rdi)
	jne	.LBB48_1
	cmpq	$32, %rdx
	jne	.LBB48_6
	movups	(%rsi), %xmm0
	movups	16(%rsi), %xmm1
	movups	%xmm1, 16(%rdi)
	movups	%xmm0, (%rdi)
	addq	$24, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB48_1:
	.cfi_def_cfa_offset 48
	movq	%rdx, 8(%rsp)
	movq	256(%rdi), %rcx
	xorl	%eax, %eax
	cmpq	$10, %rcx
	setne	%al
	shll	$4, %eax
	addq	$16, %rax
	movq	%rax, 16(%rsp)
	cmpq	%rax, %rdx
	jne	.LBB48_5
	leaq	16(%rdi), %rbx
	movzbl	264(%rdi), %r8d
	movq	%rdi, %r14
	movq	%rbx, %rdi
	callq	_RNvMNtCsc3dv7wr5mwB_12toyos_crypto3aesNtB2_3Aes11expand_into
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14)
	movq	%rbx, %rdi
	movq	%r14, %rsi
	addq	$24, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	_RNvMNtCsc3dv7wr5mwB_12toyos_crypto3aesNtB2_3Aes7encrypt
.LBB48_6:
	.cfi_def_cfa_offset 48
	leaq	.Lanon.330c70e8e5180eaf18521ac389e3febd.18(%rip), %rax
	movl	$32, %edi
	movq	%rdx, %rsi
	movq	%rax, %rdx
	callq	*_RNvNvNtCsgxBkk5gSRhY_4core5slice20copy_from_slice_impl17len_mismatch_fail@GOTPCREL(%rip)
.LBB48_5:
	leaq	.Lanon.330c70e8e5180eaf18521ac389e3febd.12(%rip), %r9
	leaq	8(%rsp), %rsi
	leaq	16(%rsp), %rdx
	xorl	%edi, %edi
	xorl	%ecx, %ecx
	callq	*_RINvNtCsgxBkk5gSRhY_4core9panicking13assert_failedjjEB4_@GOTPCREL(%rip)
.Lfunc_end48:
	.size	_RNvMNtCsc3dv7wr5mwB_12toyos_crypto4aeadNtB2_3Key10initialize, .Lfunc_end48-_RNvMNtCsc3dv7wr5mwB_12toyos_crypto4aeadNtB2_3Key10initialize
	.cfi_endproc
_RNvMNtCsc3dv7wr5mwB_12toyos_crypto3aesNtB2_3Aes11expand_into:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%r8d, 12(%rsp)
	movq	%rcx, %r13
	movq	%rdx, %r14
	movq	%rdi, %rbx
	callq	*memcpy@GOTPCREL(%rip)
	shlq	$4, %r13
	addq	$16, %r13
	subq	%r14, %r13
	jbe	.LBB35_20
	movq	%rbx, %rsi
	movq	%r13, %r12
	shrq	$2, %r12
	andl	$3, %r13d
	cmpq	$1, %r13
	sbbq	$-1, %r12
	leaq	(%r14,%rbx), %rdi
	addq	$3, %rdi
	movb	$1, %r13b
	xorl	%ebx, %ebx
	movq	%r14, %rax
	xorq	$32, %rax
	movq	%rax, 40(%rsp)
	movq	%rsi, 24(%rsp)
	movq	%rdi, 16(%rsp)
	.p2align	4
.LBB35_2:
	leaq	(%r14,%rbx), %r8
	movl	-7(%rdi,%rbx), %ebp
	movl	%ebp, 8(%rsp)
	movq	%r8, %rax
	shrq	$32, %rax
	je	.LBB35_3
	movq	%r8, %rax
	xorl	%edx, %edx
	divq	%r14
	testq	%rdx, %rdx
	je	.LBB35_6
.LBB35_10:
	movl	%r8d, %eax
	andl	$31, %eax
	xorq	$16, %rax
	orq	40(%rsp), %rax
	jne	.LBB35_15
	cmpb	$0, 12(%rsp)
	je	.LBB35_12
	leaq	8(%rsp), %rdi
	callq	_RNvNtNtCsc3dv7wr5mwB_12toyos_crypto4arch6x86_647subword
	movzbl	8(%rsp), %ebp
	jmp	.LBB35_14
	.p2align	4
.LBB35_3:
	movl	%r8d, %eax
	xorl	%edx, %edx
	divl	%r14d
	testq	%rdx, %rdx
	jne	.LBB35_10
.LBB35_6:
	leaq	9(%rsp), %rcx
	movzwl	(%rcx), %eax
	movzbl	2(%rcx), %ecx
	movb	%cl, 10(%rsp)
	movw	%ax, 8(%rsp)
	movb	%bpl, 11(%rsp)
	cmpb	$0, 12(%rsp)
	je	.LBB35_7
	leaq	8(%rsp), %rdi
	callq	_RNvNtNtCsc3dv7wr5mwB_12toyos_crypto4arch6x86_647subword
	movzbl	8(%rsp), %ebp
	jmp	.LBB35_9
.LBB35_7:
	movl	8(%rsp), %edi
	callq	_RNvNtCsc3dv7wr5mwB_12toyos_crypto3aes4sbox
	movl	%eax, %r15d
	movb	%al, 8(%rsp)
	movzbl	9(%rsp), %edi
	callq	_RNvNtCsc3dv7wr5mwB_12toyos_crypto3aes4sbox
	movb	%al, 9(%rsp)
	movzbl	10(%rsp), %edi
	callq	_RNvNtCsc3dv7wr5mwB_12toyos_crypto3aes4sbox
	movb	%al, 10(%rsp)
	movzbl	%bpl, %edi
	callq	_RNvNtCsc3dv7wr5mwB_12toyos_crypto3aes4sbox
	movb	%al, 11(%rsp)
	movl	%r15d, %ebp
.LBB35_9:
	xorb	%r13b, %bpl
	leal	(,%r13,2), %eax
	shrb	$7, %r13b
	movzbl	%r13b, %ecx
	movq	%rcx, 48(%rsp)
	movq	48(%rsp), %r13
	negb	%r13b
	andb	$27, %r13b
	xorb	%al, %r13b
	jmp	.LBB35_14
.LBB35_12:
	movl	%ebp, %r15d
	shrl	$8, %r15d
	movl	%ebp, %eax
	shrl	$16, %eax
	movl	%eax, 32(%rsp)
	movl	%ebp, %eax
	shrl	$24, %eax
	movl	%eax, 36(%rsp)
	movzbl	%bpl, %edi
	callq	_RNvNtCsc3dv7wr5mwB_12toyos_crypto3aes4sbox
	movl	%eax, %ebp
	movb	%al, 8(%rsp)
	movzbl	%r15b, %edi
	callq	_RNvNtCsc3dv7wr5mwB_12toyos_crypto3aes4sbox
	movb	%al, 9(%rsp)
	movzbl	32(%rsp), %edi
	callq	_RNvNtCsc3dv7wr5mwB_12toyos_crypto3aes4sbox
	movb	%al, 10(%rsp)
	movzbl	36(%rsp), %edi
	callq	_RNvNtCsc3dv7wr5mwB_12toyos_crypto3aes4sbox
	movb	%al, 11(%rsp)
.LBB35_14:
	movq	24(%rsp), %rsi
	movq	16(%rsp), %rdi
	leaq	(%r14,%rbx), %r8
.LBB35_15:
	leaq	(%r14,%rbx), %rax
	addq	$-240, %rax
	testq	%rax, %rax
	je	.LBB35_21
	xorb	(%rsi,%rbx), %bpl
	movb	%bpl, -3(%rdi,%rbx)
	cmpq	$238, %r8
	ja	.LBB35_21
	leaq	(%r14,%rbx), %rax
	addq	$-238, %rax
	movzbl	1(%rsi,%rbx), %ecx
	xorb	9(%rsp), %cl
	movb	%cl, -2(%rdi,%rbx)
	testq	%rax, %rax
	je	.LBB35_21
	movzbl	2(%rsi,%rbx), %eax
	xorb	10(%rsp), %al
	movb	%al, -1(%rdi,%rbx)
	cmpq	$236, %r8
	ja	.LBB35_21
	movzbl	3(%rsi,%rbx), %eax
	xorb	11(%rsp), %al
	decq	%r12
	movb	%al, (%rdi,%rbx)
	movb	$0, 8(%rsp)
	movb	$0, 9(%rsp)
	movb	$0, 10(%rsp)
	movb	$0, 11(%rsp)
	#MEMBARRIER
	addq	$4, %rbx
	testq	%r12, %r12
	jne	.LBB35_2
.LBB35_20:
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB35_21:
	.cfi_def_cfa_offset 112
	leaq	.Lanon.330c70e8e5180eaf18521ac389e3febd.13(%rip), %rdx
	movl	$240, %edi
	movl	$240, %esi
	callq	*_RNvNtCsgxBkk5gSRhY_4core9panicking18panic_bounds_check@GOTPCREL(%rip)
.Lfunc_end35:
	.size	_RNvMNtCsc3dv7wr5mwB_12toyos_crypto3aesNtB2_3Aes11expand_into, .Lfunc_end35-_RNvMNtCsc3dv7wr5mwB_12toyos_crypto3aesNtB2_3Aes11expand_into
	.cfi_endproc
