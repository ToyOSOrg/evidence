_RNvMs0_NtNtCs4U4sOGKWW3b_12toyos_crypto3ecc4p256NtB5_9SecretKey5agree:
.Lfunc_begin55:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$224, %rsp
	movq	%rsi, %rbx
	movq	%rdi, %r14
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -144(%rbp)
	movaps	%xmm0, -160(%rbp)
	leaq	-256(%rbp), %r12
	movq	%r12, %rdi
	movq	%rdx, %rsi
	movq	%rbx, %rdx
	callq	_RNvMs3_NtCs4U4sOGKWW3b_12toyos_crypto4nistINtB5_5PointNtB5_4P256Kj4_E3mulB7_
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -80(%rbp)
	movaps	%xmm0, -96(%rbp)
	movaps	%xmm0, -112(%rbp)
	movaps	%xmm0, -128(%rbp)
	leaq	-96(%rbp), %r15
	leaq	-128(%rbp), %rsi
	movq	%r12, %rdi
	movq	%r15, %rdx
	callq	_RNvMs3_NtCs4U4sOGKWW3b_12toyos_crypto4nistINtB5_5PointNtB5_4P256Kj4_E6affineB7_
	cmpb	$-1, %al
	jne	.LBB55_1
	leaq	-136(%rbp), %rdx
	movq	-128(%rbp), %rcx
	bswapq	%rcx
	movq	%rcx, -48(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	subq	%rdx, %rsi
	subq	%rax, %rdx
	cmovbq	%rsi, %rdx
	testq	%rdx, %rdx
	je	.LBB55_9
	movq	%rcx, -136(%rbp)
	movq	-120(%rbp), %rcx
	bswapq	%rcx
	leaq	-144(%rbp), %rdx
	movq	%rcx, -48(%rbp)
	movq	%rax, %rsi
	subq	%rdx, %rsi
	subq	%rax, %rdx
	cmovbq	%rsi, %rdx
	testq	%rdx, %rdx
	je	.LBB55_9
	movq	%rcx, -144(%rbp)
	movq	-112(%rbp), %rcx
	bswapq	%rcx
	leaq	-152(%rbp), %rdx
	movq	%rcx, -48(%rbp)
	movq	%rax, %rsi
	subq	%rdx, %rsi
	subq	%rax, %rdx
	cmovbq	%rsi, %rdx
	testq	%rdx, %rdx
	je	.LBB55_9
	movq	%rcx, -152(%rbp)
	movq	-104(%rbp), %rcx
	bswapq	%rcx
	movq	%rcx, -48(%rbp)
	leaq	-160(%rbp), %rdx
	movq	%rax, %rsi
	subq	%rdx, %rsi
	subq	%rax, %rdx
	cmovbq	%rsi, %rdx
	testq	%rdx, %rdx
	je	.LBB55_9
	leaq	-112(%rbp), %rax
	movq	%rcx, -160(%rbp)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -48(%rbp)
	movq	-48(%rbp), %rcx
	movq	%rcx, -128(%rbp)
	movq	-40(%rbp), %rcx
	movq	%rcx, -120(%rbp)
	movaps	%xmm0, -48(%rbp)
	movaps	-48(%rbp), %xmm1
	movups	%xmm1, (%rax)
	movaps	%xmm0, -48(%rbp)
	movaps	-48(%rbp), %xmm1
	movups	%xmm1, (%r15)
	movaps	%xmm0, -48(%rbp)
	movaps	-48(%rbp), %xmm1
	movaps	%xmm1, -80(%rbp)
	#MEMBARRIER
	movaps	%xmm0, -128(%rbp)
	movq	-128(%rbp), %rax
	movq	%rax, -256(%rbp)
	movq	-120(%rbp), %rax
	movq	%rax, -248(%rbp)
	movaps	%xmm0, -128(%rbp)
	movaps	-128(%rbp), %xmm1
	movaps	%xmm1, -240(%rbp)
	movaps	%xmm0, -128(%rbp)
	movaps	-128(%rbp), %xmm1
	movaps	%xmm1, -224(%rbp)
	movaps	%xmm0, -128(%rbp)
	movaps	-128(%rbp), %xmm1
	movaps	%xmm1, -208(%rbp)
	movaps	%xmm0, -128(%rbp)
	movaps	-128(%rbp), %xmm1
	movaps	%xmm1, -192(%rbp)
	movaps	%xmm0, -128(%rbp)
	movaps	-128(%rbp), %xmm0
	movaps	%xmm0, -176(%rbp)
	#MEMBARRIER
	movaps	-160(%rbp), %xmm0
	movaps	-144(%rbp), %xmm1
	movups	%xmm1, 17(%r14)
	movups	%xmm0, 1(%r14)
	movb	$0, (%r14)
	movq	$0, (%rbx)
	movq	$0, 8(%rbx)
	movq	$0, 16(%rbx)
	movq	$0, 24(%rbx)
	#MEMBARRIER
	movq	%r14, %rax
	addq	$224, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB55_9:
	leaq	.Lanon.7527e279b24a9219233149cb0fcb89c0.153(%rip), %rdi
	leaq	.Lanon.7527e279b24a9219233149cb0fcb89c0.7(%rip), %rcx
	movl	$567, %esi
	xorl	%edx, %edx
	callq	_RNvNtCs9VSTO83uhuD_4core9panicking18panic_nounwind_fmt@PLT
.LBB55_1:
	movb	%al, -49(%rbp)
	leaq	.Lanon.7527e279b24a9219233149cb0fcb89c0.69(%rip), %rdi
	leaq	.Lanon.7527e279b24a9219233149cb0fcb89c0.49(%rip), %rcx
	leaq	.Lanon.7527e279b24a9219233149cb0fcb89c0.70(%rip), %r8
	leaq	-49(%rbp), %rdx
	movl	$46, %esi
	callq	_RNvNtCs9VSTO83uhuD_4core6result13unwrap_failed@PLT
	ud2
.LBB55_8:
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -48(%rbp)
	movaps	-48(%rbp), %xmm1
	movaps	%xmm1, -128(%rbp)
	movaps	%xmm0, -48(%rbp)
	movaps	-48(%rbp), %xmm1
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm0, -48(%rbp)
	movaps	-48(%rbp), %xmm1
	movups	%xmm1, (%r15)
	movaps	%xmm0, -48(%rbp)
	movaps	-48(%rbp), %xmm1
	movaps	%xmm1, -80(%rbp)
	#MEMBARRIER
	movaps	%xmm0, -48(%rbp)
	movaps	-48(%rbp), %xmm1
	movaps	%xmm1, -256(%rbp)
	movaps	%xmm0, -48(%rbp)
	movaps	-48(%rbp), %xmm1
	movaps	%xmm1, -240(%rbp)
	movaps	%xmm0, -48(%rbp)
	movaps	-48(%rbp), %xmm1
	movaps	%xmm1, -224(%rbp)
	movaps	%xmm0, -48(%rbp)
	movaps	-48(%rbp), %xmm1
	movaps	%xmm1, -208(%rbp)
	movaps	%xmm0, -48(%rbp)
	movaps	-48(%rbp), %xmm1
	movaps	%xmm1, -192(%rbp)
	movaps	%xmm0, -48(%rbp)
	movaps	-48(%rbp), %xmm1
	movaps	%xmm1, -176(%rbp)
	#MEMBARRIER
	movaps	%xmm0, -48(%rbp)
	movaps	-48(%rbp), %xmm1
	movaps	%xmm1, -160(%rbp)
	movaps	%xmm0, -48(%rbp)
	movaps	-48(%rbp), %xmm0
	movaps	%xmm0, -144(%rbp)
	#MEMBARRIER
	movq	$0, (%rbx)
	movq	$0, 8(%rbx)
	movq	$0, 16(%rbx)
	movq	$0, 24(%rbx)
	#MEMBARRIER
	movq	%rax, %rdi
	callq	_Unwind_Resume@PLT
.Lfunc_end55:
	.size	_RNvMs0_NtNtCs4U4sOGKWW3b_12toyos_crypto3ecc4p256NtB5_9SecretKey5agree, .Lfunc_end55-_RNvMs0_NtNtCs4U4sOGKWW3b_12toyos_crypto3ecc4p256NtB5_9SecretKey5agree
