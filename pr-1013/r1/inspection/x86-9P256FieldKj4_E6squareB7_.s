_RNvMs1_NtCs4U4sOGKWW3b_12toyos_crypto10montgomeryINtB5_7ResidueNtNtB7_4nist9P256FieldKj4_E6squareB7_:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	movq	(%rsi), %r8
	movq	8(%rsi), %rbx
	movq	%rbx, %rax
	mulq	%r8
	movq	%rax, -48(%rbp)
	movq	%rdx, -64(%rbp)
	movq	16(%rsi), %r9
	movq	%r9, %rax
	mulq	%r8
	movq	%rax, %r10
	movq	%rdx, -56(%rbp)
	movq	24(%rsi), %rcx
	movq	%rcx, %rax
	mulq	%r8
	movq	%rdx, %r12
	movq	%rax, %r11
	movq	%r9, %rax
	movq	%rbx, %rsi
	mulq	%rbx
	movq	%rdx, %r13
	movq	%rax, %rbx
	movq	%rcx, %rax
	mulq	%rsi
	movq	%rax, %r14
	movq	%rdx, %r15
	addq	-64(%rbp), %r10
	adcq	-56(%rbp), %r11
	adcq	%r12, %r14
	adcq	$0, %r15
	addq	%rbx, %r11
	adcq	%r13, %r14
	adcq	$0, %r15
	movq	%rcx, %rax
	mulq	%r9
	movq	%rdx, %r12
	movq	%rax, %r13
	addq	%r15, %r13
	adcq	$0, %r12
	movq	%r12, %rax
	shrq	$63, %rax
	movq	%rax, -64(%rbp)
	shldq	$1, %r13, %r12
	shldq	$1, %r14, %r13
	shldq	$1, %r11, %r14
	shldq	$1, %r10, %r11
	movq	-48(%rbp), %r15
	shldq	$1, %r15, %r10
	movq	%r8, %rax
	mulq	%r8
	movq	%rdx, %r8
	movq	%rax, -56(%rbp)
	movq	%rsi, %rax
	mulq	%rsi
	movq	%rax, %rbx
	movq	%rdx, %rsi
	addq	%r15, %r15
	movq	%r15, -48(%rbp)
	movq	%r9, %rax
	mulq	%r9
	movq	%rdx, %r15
	movq	%rax, -72(%rbp)
	movq	%rcx, %rax
	mulq	%rcx
	movq	%rax, %r9
	movq	%rdx, %rcx
	addq	-48(%rbp), %r8
	adcq	%r10, %rbx
	adcq	%r11, %rsi
	movq	%rsi, -48(%rbp)
	movq	-72(%rbp), %r10
	adcq	%r14, %r10
	adcq	%r13, %r15
	adcq	%r12, %r9
	adcq	-64(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	movq	%rax, %r14
	shlq	$32, %r14
	movabsq	$-4294967295, %rdx
	mulq	%rdx
	movq	%rax, %r11
	movq	%rdx, %r13
	shrq	$32, %rsi
	addq	%r8, %r14
	adcq	%rbx, %rsi
	adcq	-48(%rbp), %r11
	adcq	%r10, %r13
	adcq	$0, %r15
	adcq	$0, %r9
	adcq	$0, %rcx
	setb	-48(%rbp)
	shlq	$32, %r8
	movq	%r14, %r12
	movq	%r14, %rax
	movabsq	$-4294967295, %r10
	mulq	%r10
	movq	%rax, %r14
	movq	%rdx, %rbx
	shrq	$32, %r12
	addq	%rsi, %r8
	adcq	%r11, %r12
	adcq	%r13, %r14
	adcq	%r15, %rbx
	adcq	$0, %r9
	adcq	$0, %rcx
	setb	%r11b
	shlq	$32, %rsi
	movq	%r8, %r15
	movq	%r8, %rax
	mulq	%r10
	movq	%r10, %r13
	movq	%rax, %r10
	movq	%rdx, %r8
	shrq	$32, %r15
	addq	%r12, %rsi
	adcq	%r14, %r15
	adcq	%rbx, %r10
	adcq	%r9, %r8
	adcq	$0, %rcx
	setb	%bl
	shlq	$32, %r12
	movq	%rsi, %r9
	movq	%rsi, %rax
	mulq	%r13
	shrq	$32, %r9
	addq	%r15, %r12
	adcq	%r10, %r9
	adcq	%r8, %rax
	adcq	%rcx, %rdx
	setb	%r14b
	xorl	%r8d, %r8d
	movq	%r12, %rcx
	incq	%rcx
	setne	%r8b
	movabsq	$-4294967296, %r10
	leaq	(%r9,%r10), %rsi
	incq	%rsi
	movl	$4294967295, %r15d
	cmpq	%r15, %r9
	setb	%r13b
	subq	%r8, %rsi
	setb	%r8b
	orb	%r13b, %r8b
	movzbl	%r8b, %r13d
	cmpq	%r10, %rdx
	seta	%r10b
	movq	%rax, %r8
	subq	%r13, %r8
	leaq	(%rdx,%r15), %r15
	sbbq	$0, %r15
	setae	%r13b
	andb	%r10b, %r13b
	orb	%bl, %r14b
	orb	%r11b, %r14b
	orb	-48(%rbp), %r14b
	orb	%r13b, %r14b
	movzbl	%r14b, %r11d


	movq	%r11, %rbx
	negq	%rbx
	decq	%r11
	andq	%r11, %r12
	andq	%rbx, %rcx
	orq	%r12, %rcx
	andq	%r11, %r9
	andq	%rbx, %rsi
	orq	%r9, %rsi
	andq	%r11, %rax
	andq	%rbx, %r8
	orq	%rax, %r8
	andq	%rdx, %r11
	andq	%r15, %rbx
	orq	%r11, %rbx
	movq	%rcx, (%rdi)
	movq	%rsi, 8(%rdi)
	movq	%r8, 16(%rdi)
	movq	%rbx, 24(%rdi)
	movq	%rdi, %rax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
