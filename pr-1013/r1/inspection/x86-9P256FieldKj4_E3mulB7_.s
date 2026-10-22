_RNvMs1_NtCs4U4sOGKWW3b_12toyos_crypto10montgomeryINtB5_7ResidueNtNtB7_4nist9P256FieldKj4_E3mulB7_:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	movq	%rdx, %r15
	movq	%rsi, %r12
	movq	(%rdx), %rax
	movq	%rax, -56(%rbp)
	movq	(%rsi), %r9
	movq	%rsi, -80(%rbp)
	mulq	%r9
	movq	%rax, %r11
	movq	%rdx, %rcx
	movq	8(%r15), %rax
	movq	%rax, -48(%rbp)
	mulq	%r9
	movq	%rax, %rbx
	movq	%rdx, %r13
	movq	16(%r15), %rax
	movq	%rax, -64(%rbp)
	mulq	%r9
	movq	%rax, %r14
	movq	%rdx, %r8
	movq	24(%r15), %rax
	movq	%rax, -72(%rbp)
	mulq	%r9
	movq	%rax, %r9
	movq	%rdx, -88(%rbp)
	movq	%r11, %rsi
	shlq	$32, %rsi
	movq	%r11, %r10
	movabsq	$-4294967295, %rdx
	movq	%r11, %rax
	mulq	%rdx
	movq	%rax, %r15
	movq	%rdx, %r11
	shrq	$32, %r10
	addq	%rcx, %rbx
	adcq	%r13, %r14
	adcq	%r8, %r9
	setb	%al
	addq	%r9, %r15
	adcq	$0, %r11
	addq	%rsi, %rbx
	adcq	%r10, %r14
	movq	8(%r12), %rcx
	adcq	$0, %r15
	adcq	$0, %r11
	addb	$255, %al
	adcq	-88(%rbp), %r11
	setb	%sil
	movq	%rcx, %rax
	mulq	-56(%rbp)
	movq	%rdx, %r8
	movq	%rax, %r10
	movq	%rcx, %rax
	mulq	-48(%rbp)
	movq	%rax, %r12
	movq	%rdx, %r9
	addq	%rbx, %r10
	adcq	%r8, %r12
	adcq	$0, %r9
	addq	%r14, %r12
	adcq	$0, %r9
	movq	%rcx, %rax
	mulq	-64(%rbp)
	movq	%rdx, %r8
	movq	%rax, %rbx
	addq	%r9, %rbx
	adcq	$0, %r8
	addq	%r15, %rbx
	adcq	$0, %r8
	movq	%rcx, %rax
	mulq	-72(%rbp)
	movq	%rdx, %rcx
	movq	%rax, %r9
	addq	%r11, %r9
	adcq	$0, %rcx
	addq	%r8, %r9
	adcq	$0, %rcx
	addb	$255, %sil
	adcq	$0, %rcx
	setb	%r8b
	movq	%r10, %r13
	shlq	$32, %r13
	movq	%r10, %rsi
	shrq	$32, %rsi
	movq	%r10, %rax
	movabsq	$-4294967295, %rdx
	mulq	%rdx
	movq	%rdx, %r11
	movq	%rax, %r14
	addq	%r9, %r14
	adcq	$0, %r11
	addq	%r12, %r13
	adcq	%rbx, %rsi
	adcq	$0, %r14
	adcq	$0, %r11
	addq	%rcx, %r11
	setb	%r15b
	orb	%r8b, %r15b
	movq	-80(%rbp), %rax
	movq	16(%rax), %r12
	movq	%r12, %rax
	mulq	-56(%rbp)
	movq	%rdx, %rcx
	movq	%rax, %r10
	movq	%r12, %rax
	mulq	-48(%rbp)
	movq	%rax, %rbx
	movq	%rdx, %r8
	addq	%r13, %r10
	adcq	%rcx, %rbx
	adcq	$0, %r8
	addq	%rsi, %rbx
	adcq	$0, %r8
	movq	%r12, %rax
	mulq	-64(%rbp)
	movq	%rdx, %r9
	movq	%rax, %rcx
	addq	%r8, %rcx
	adcq	$0, %r9
	addq	%r14, %rcx
	adcq	$0, %r9
	movq	%r12, %rax
	mulq	-72(%rbp)
	movq	%rdx, %r12
	movq	%rax, %r8
	addq	%r11, %r8
	adcq	$0, %r12
	addq	%r9, %r8
	movzbl	%r15b, %eax
	adcq	$0, %r12
	addq	%rax, %r12
	setb	%sil
	movq	%r10, %r15
	shlq	$32, %r15
	movq	%r10, %r13
	shrq	$32, %r13
	movq	%r10, %rax
	movabsq	$-4294967295, %rdx
	mulq	%rdx
	movq	%rdx, %r11
	movq	%rax, %r14
	addq	%r8, %r14
	adcq	$0, %r11
	addq	%rbx, %r15
	adcq	%rcx, %r13
	adcq	$0, %r14
	adcq	$0, %r11
	addq	%r12, %r11
	setb	%r12b
	orb	%sil, %r12b
	movq	-80(%rbp), %rax
	movq	24(%rax), %rcx
	movq	%rcx, %rax
	mulq	-56(%rbp)
	movq	%rdx, %r8
	movq	%rax, %r9
	movq	%rcx, %rax
	mulq	-48(%rbp)
	movq	%rax, %rsi
	movq	%rdx, %r10
	addq	%r15, %r9
	adcq	%r8, %rsi
	adcq	$0, %r10
	addq	%r13, %rsi
	adcq	$0, %r10
	movq	%rcx, %rax
	mulq	-64(%rbp)
	movq	%rdx, %rbx
	movq	%rax, %r8
	addq	%r10, %r8
	adcq	$0, %rbx
	addq	%r14, %r8
	adcq	$0, %rbx
	movq	%rcx, %rax
	mulq	-72(%rbp)
	movq	%rdx, %rcx
	movq	%rax, %r10
	addq	%r11, %r10
	adcq	$0, %rcx
	addq	%rbx, %r10
	adcq	$0, %rcx
	movzbl	%r12b, %eax
	addq	%rax, %rcx
	setb	%r14b
	movq	%r9, %r11
	movq	%r9, %rbx
	shlq	$32, %rbx
	shrq	$32, %r11
	movq	%r9, %rax
	movabsq	$-4294967295, %rdx
	mulq	%rdx
	addq	%r10, %rax
	adcq	$0, %rdx
	addq	%rsi, %rbx
	adcq	%r8, %r11
	adcq	$0, %rax
	adcq	$0, %rdx
	addq	%rcx, %rdx
	setb	%r10b
	orb	%r14b, %r10b
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	incq	%rcx
	setne	%r8b
	movabsq	$-4294967296, %r9
	leaq	(%r11,%r9), %rsi
	incq	%rsi
	movl	$4294967295, %r14d
	cmpq	%r14, %r11
	setb	%r15b
	subq	%r8, %rsi
	setb	%r8b
	orb	%r15b, %r8b
	movzbl	%r8b, %r15d
	cmpq	%r9, %rdx
	seta	%r12b
	movq	%rax, %r8
	subq	%r15, %r8
	leaq	(%rdx,%r14), %r9
	sbbq	$0, %r9
	setae	%r14b
	andb	%r12b, %r14b
	orb	%r10b, %r14b
	movzbl	%r14b, %r10d


	movq	%r10, %r14
	negq	%r14
	decq	%r10
	andq	%r10, %rbx
	andq	%r14, %rcx
	orq	%rbx, %rcx
	andq	%r10, %r11
	andq	%r14, %rsi
	orq	%r11, %rsi
	andq	%r10, %rax
	andq	%r14, %r8
	orq	%rax, %r8
	andq	%rdx, %r10
	andq	%r9, %r14
	orq	%r10, %r14
	movq	%rcx, (%rdi)
	movq	%rsi, 8(%rdi)
	movq	%r8, 16(%rdi)
	movq	%r14, 24(%rdi)
	movq	%rdi, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
