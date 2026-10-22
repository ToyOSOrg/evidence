_RNvNtNtNtCs4U4sOGKWW3b_12toyos_crypto4arch6x86_6410montgomery3mul:
.Lfunc_begin154:
	.file	69 "$WORKTREE/lib/crypto" "src/arch/x86_64/montgomery.rs"
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$584, %rsp
	movq	%r9, -56(%rbp)
	movq	%r8, %rbx
	movq	%rcx, %r13
	movq	%rdx, -96(%rbp)
	movq	%rsi, %r14
	movq	%rdi, -88(%rbp)
	leaq	-624(%rbp), %rdi
	movl	$528, %edx
	xorl	%esi, %esi
	callq	memset@PLT
	leaq	(,%rbx,8), %rdx
	movq	%rbx, -48(%rbp)
	testq	%rbx, %rbx
	je	.LBB154_3
	movq	-48(%rbp), %rax
	shrq	$2, %rax
	movq	%rax, -80(%rbp)
	xorl	%r9d, %r9d
	movq	%rdx, -72(%rbp)
	movq	%r14, -64(%rbp)
	movq	-96(%rbp), %r12
	movq	-88(%rbp), %rsi
	movq	-80(%rbp), %r8
.LBB154_2:
	movq	(%r14,%r9), %rdx
	xorl	%r15d, %r15d
	leaq	-624(%rbp), %r14
	#APP

	movq	%rsi, %r10
	movq	%r14, %r11
	movq	%r8, %rcx
	xorl	%eax, %eax
	mulxq	(%r10), %rbx, %rdi
	adcxq	(%r11), %rbx
	adoxq	%rax, %rbx
	movq	%rbx, (%r11)
	mulxq	8(%r10), %rbx, %rax
	adcxq	8(%r11), %rbx
	adoxq	%rdi, %rbx
	movq	%rbx, 8(%r11)
	mulxq	16(%r10), %rbx, %rdi
	adcxq	16(%r11), %rbx
	adoxq	%rax, %rbx
	movq	%rbx, 16(%r11)
	mulxq	24(%r10), %rbx, %rax
	adcxq	24(%r11), %rbx
	adoxq	%rdi, %rbx
	movq	%rbx, 24(%r11)
	leaq	32(%r10), %r10
	leaq	32(%r11), %r11
	leaq	-1(%rcx), %rcx
	jrcxz	.Ltmp25349
	jmp	.Ltmp25348
	movq	$0, %rbx
	movq	(%r11), %rdi
	adcxq	%rbx, %rdi
	adoxq	%rax, %rdi
	movq	%rdi, (%r11)
	movq	$0, %rdi
	adcxq	%rbx, %rdi
	adoxq	%rbx, %rdi
	movq	%rdi, 8(%r11)
	movq	(%r14), %rdx
	imulq	%r13, %rdx
	movq	%r12, %r10
	movq	%r14, %r11
	movq	%r8, %rcx
	xorl	%eax, %eax
	mulxq	(%r10), %rbx, %rax
	adcxq	(%r11), %rbx
	mulxq	8(%r10), %rbx, %rdi
	adcxq	8(%r11), %rbx
	adoxq	%rax, %rbx
	movq	%rbx, (%r11)
	mulxq	16(%r10), %rbx, %rax
	adcxq	16(%r11), %rbx
	adoxq	%rdi, %rbx
	movq	%rbx, 8(%r11)
	mulxq	24(%r10), %rbx, %rdi
	adcxq	24(%r11), %rbx
	adoxq	%rax, %rbx
	movq	%rbx, 16(%r11)
	leaq	32(%r10), %r10
	leaq	32(%r11), %r11
	leaq	-1(%rcx), %rcx
	jrcxz	.Ltmp25350
	mulxq	(%r10), %rbx, %rax
	adcxq	(%r11), %rbx
	adoxq	%rdi, %rbx
	movq	%rbx, -8(%r11)
	mulxq	8(%r10), %rbx, %rdi
	adcxq	8(%r11), %rbx
	adoxq	%rax, %rbx
	movq	%rbx, (%r11)
	mulxq	16(%r10), %rbx, %rax
	adcxq	16(%r11), %rbx
	adoxq	%rdi, %rbx
	movq	%rbx, 8(%r11)
	mulxq	24(%r10), %rbx, %rdi
	adcxq	24(%r11), %rbx
	adoxq	%rax, %rbx
	movq	%rbx, 16(%r11)
	leaq	32(%r10), %r10
	leaq	32(%r11), %r11
	leaq	-1(%rcx), %rcx
	jrcxz	.Ltmp25350
	jmp	.Ltmp25351
	movq	(%r11), %rbx
	adcxq	%r15, %rbx
	adoxq	%rdi, %rbx
	movq	%rbx, -8(%r11)
	movq	8(%r11), %rbx
	adcxq	%r15, %rbx
	adoxq	%r15, %rbx
	movq	%rbx, (%r11)

	#NO_APP
	movq	-64(%rbp), %r14
	movq	-72(%rbp), %rdx
	addq	$8, %r9
	cmpq	%r9, %rdx
	jne	.LBB154_2
.LBB154_3:
	leaq	-624(%rbp), %rsi
	movq	%rsi, %rax
	movq	-56(%rbp), %rdi
	subq	%rdi, %rax
	movq	%rdi, %rcx
	subq	%rsi, %rcx
	cmovbq	%rax, %rcx
	cmpq	%rdx, %rcx
	jb	.LBB154_5
	callq	memcpy@PLT
	movq	-48(%rbp), %rax
	movq	-624(%rbp,%rax,8), %rax
	addq	$584, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB154_5:
	leaq	.Lanon.7e635326e95ff0630b0cf2686a4c3962.172(%rip), %rdi
	leaq	.Lanon.7e635326e95ff0630b0cf2686a4c3962.13(%rip), %rcx
	movl	$567, %esi
	xorl	%edx, %edx
	callq	_RNvNtCs9VSTO83uhuD_4core9panicking18panic_nounwind_fmt@PLT
.Lfunc_end154:
	.size	_RNvNtNtNtCs4U4sOGKWW3b_12toyos_crypto4arch6x86_6410montgomery3mul, .Lfunc_end154-_RNvNtNtNtCs4U4sOGKWW3b_12toyos_crypto4arch6x86_6410montgomery3mul
