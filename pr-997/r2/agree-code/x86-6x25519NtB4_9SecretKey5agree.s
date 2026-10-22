_RNvMs_NtCs4U4sOGKWW3b_12toyos_crypto6x25519NtB4_9SecretKey5agree:
.Lfunc_begin105:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	subq	$48, %rsp
	movq	%rsi, %r14
	movq	%rdi, %rbx
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -32(%rbp)
	movaps	%xmm0, -48(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rsi, %rdi
	movq	%rdx, %rsi
	movq	%rax, %rdx
	callq	_RNvNtCs4U4sOGKWW3b_12toyos_crypto6x255198multiply
	movzbl	-48(%rbp), %eax
	orb	-47(%rbp), %al
	orb	-46(%rbp), %al
	orb	-45(%rbp), %al
	orb	-44(%rbp), %al
	orb	-43(%rbp), %al
	orb	-42(%rbp), %al
	orb	-41(%rbp), %al
	orb	-40(%rbp), %al
	orb	-39(%rbp), %al
	orb	-38(%rbp), %al
	orb	-37(%rbp), %al
	orb	-36(%rbp), %al
	orb	-35(%rbp), %al
	orb	-34(%rbp), %al
	orb	-33(%rbp), %al
	orb	-32(%rbp), %al
	orb	-31(%rbp), %al
	orb	-30(%rbp), %al
	orb	-29(%rbp), %al
	orb	-28(%rbp), %al
	orb	-27(%rbp), %al
	orb	-26(%rbp), %al
	orb	-25(%rbp), %al
	orb	-24(%rbp), %al
	orb	-23(%rbp), %al
	orb	-22(%rbp), %al
	orb	-21(%rbp), %al
	orb	-20(%rbp), %al
	orb	-19(%rbp), %al
	orb	-18(%rbp), %al
	xorl	%ecx, %ecx
	orb	-17(%rbp), %al
	setne	%cl
	#APP

	# rcx 

	#NO_APP
	testq	%rcx, %rcx
	je	.LBB105_2
	leaq	1(%rbx), %rax
	movaps	-48(%rbp), %xmm0
	movaps	-32(%rbp), %xmm1
	movups	%xmm1, 16(%rax)
	movups	%xmm0, (%rax)
	movb	$0, (%rbx)
	jmp	.LBB105_3
.LBB105_2:
	leaq	-32(%rbp), %rax
	movw	$769, (%rbx)
	xorps	%xmm1, %xmm1
	movaps	%xmm1, -64(%rbp)
	movaps	-64(%rbp), %xmm0
	movaps	%xmm0, -48(%rbp)
	movaps	%xmm1, -64(%rbp)
	movaps	-64(%rbp), %xmm0
	movups	%xmm0, (%rax)
	#MEMBARRIER
.LBB105_3:
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -48(%rbp)
	movaps	-48(%rbp), %xmm1
	movups	%xmm1, (%r14)
	movaps	%xmm0, -48(%rbp)
	movaps	-48(%rbp), %xmm0
	movups	%xmm0, 16(%r14)
	#MEMBARRIER
	movq	%rbx, %rax
	addq	$48, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end105:
	.size	_RNvMs_NtCs4U4sOGKWW3b_12toyos_crypto6x25519NtB4_9SecretKey5agree, .Lfunc_end105-_RNvMs_NtCs4U4sOGKWW3b_12toyos_crypto6x25519NtB4_9SecretKey5agree
