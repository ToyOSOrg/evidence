_RNvNtNtNtCs4U4sOGKWW3b_12toyos_crypto4arch6x86_645aesni3ctr:
.Lfunc_begin157:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$328, %rsp
	cmpq	$10, %rsi
	jne	.LBB157_8
	movdqu	(%rdi), %xmm1
	movdqu	16(%rdi), %xmm3
	movdqu	32(%rdi), %xmm4
	movdqu	48(%rdi), %xmm2
	movups	64(%rdi), %xmm0
	movaps	%xmm0, -80(%rbp)
	movups	80(%rdi), %xmm0
	movaps	%xmm0, -64(%rbp)
	movups	96(%rdi), %xmm0
	movaps	%xmm0, -160(%rbp)
	movups	112(%rdi), %xmm0
	movaps	%xmm0, -176(%rbp)
	movups	128(%rdi), %xmm0
	movaps	%xmm0, -192(%rbp)
	movups	144(%rdi), %xmm0
	movaps	%xmm0, -208(%rbp)
	movups	160(%rdi), %xmm0
	movaps	%xmm0, -112(%rbp)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -224(%rbp)
	leaq	-224(%rbp), %rax
	movq	%rdx, %rsi
	subq	%rax, %rsi
	subq	%rdx, %rax
	cmovbq	%rsi, %rax
	cmpq	$11, %rax
	jbe	.LBB157_55
	movl	8(%rdx), %eax
	movl	%eax, -216(%rbp)
	movq	(%rdx), %rax
	movq	%rax, -224(%rbp)
	movdqa	-224(%rbp), %xmm0
	movdqa	%xmm0, -304(%rbp)
	pxor	%xmm1, %xmm0
	movdqa	%xmm0, -96(%rbp)
	movabsq	$9223372036854775680, %rax
	andq	%r9, %rax
	movq	%r9, %rdx
	shrq	$7, %rdx
	je	.LBB157_16
	movdqa	%xmm1, -288(%rbp)
	movdqa	%xmm3, -240(%rbp)
	movdqa	%xmm4, -256(%rbp)
	movdqa	%xmm2, -272(%rbp)
	movl	%ecx, %esi
	leaq	112(%r8), %r10
	shlq	$3, %rdx
	xorl	%edi, %edi
	movdqa	-160(%rbp), %xmm10
	movdqa	-176(%rbp), %xmm9
	movdqa	-192(%rbp), %xmm8
	movdqa	-208(%rbp), %xmm7
	movdqa	-80(%rbp), %xmm13
	jmp	.LBB157_6
.LBB157_4:
	movdqa	-304(%rbp), %xmm12
	pxor	%xmm15, %xmm12
	movdqa	%xmm12, %xmm14
	paddb	.LCPI157_0(%rip), %xmm14
	movdqa	-288(%rbp), %xmm3
	pxor	%xmm3, %xmm14
	movdqa	%xmm12, %xmm11
	paddb	.LCPI157_1(%rip), %xmm11
	pxor	%xmm3, %xmm11
	movdqa	%xmm12, %xmm2
	paddb	.LCPI157_2(%rip), %xmm2
	pxor	%xmm3, %xmm2
	movdqa	%xmm12, %xmm0
	paddb	.LCPI157_3(%rip), %xmm0
	pxor	%xmm3, %xmm0
	movdqa	%xmm12, %xmm1
	paddb	.LCPI157_4(%rip), %xmm1
	pxor	%xmm3, %xmm1
	movdqa	%xmm12, %xmm5
	paddb	.LCPI157_5(%rip), %xmm5
	pxor	%xmm3, %xmm5
	paddb	.LCPI157_6(%rip), %xmm12
	pxor	%xmm3, %xmm12
.LBB157_5:
	movdqa	-96(%rbp), %xmm4
	pxor	%xmm4, %xmm15
	movdqa	-240(%rbp), %xmm3
	aesenc	%xmm3, %xmm15
	aesenc	%xmm3, %xmm14
	aesenc	%xmm3, %xmm11
	aesenc	%xmm3, %xmm2
	movdqa	-256(%rbp), %xmm3
	aesenc	%xmm3, %xmm15
	aesenc	%xmm3, %xmm14
	aesenc	%xmm3, %xmm11
	aesenc	%xmm3, %xmm2
	movdqa	-272(%rbp), %xmm4
	aesenc	%xmm4, %xmm15
	aesenc	%xmm4, %xmm14
	aesenc	%xmm4, %xmm11
	aesenc	%xmm4, %xmm2
	movdqa	-80(%rbp), %xmm3
	aesenc	%xmm3, %xmm15
	aesenc	%xmm3, %xmm14
	aesenc	%xmm3, %xmm11
	aesenc	%xmm3, %xmm2
	movdqa	-64(%rbp), %xmm6
	aesenc	%xmm6, %xmm15
	aesenc	%xmm6, %xmm14
	aesenc	%xmm6, %xmm11
	aesenc	%xmm6, %xmm2
	aesenc	%xmm10, %xmm15
	aesenc	%xmm10, %xmm14
	aesenc	%xmm10, %xmm11
	aesenc	%xmm10, %xmm2
	aesenc	%xmm9, %xmm15
	aesenc	%xmm9, %xmm14
	aesenc	%xmm9, %xmm11
	aesenc	%xmm9, %xmm2
	aesenc	%xmm8, %xmm15
	aesenc	%xmm8, %xmm14
	aesenc	%xmm8, %xmm11
	aesenc	%xmm8, %xmm2
	aesenc	%xmm7, %xmm15
	aesenc	%xmm7, %xmm14
	aesenc	%xmm7, %xmm11
	aesenc	%xmm7, %xmm2
	movdqa	-112(%rbp), %xmm6
	aesenclast	%xmm6, %xmm15
	aesenclast	%xmm6, %xmm14
	aesenclast	%xmm6, %xmm11
	aesenclast	%xmm6, %xmm2
	movdqu	-112(%r10), %xmm3
	pxor	%xmm15, %xmm3
	movdqu	-96(%r10), %xmm15
	pxor	%xmm14, %xmm15
	movdqu	-80(%r10), %xmm14
	pxor	%xmm11, %xmm14
	movdqu	-64(%r10), %xmm11
	pxor	%xmm2, %xmm11
	movdqu	%xmm3, -112(%r10)
	movdqa	-64(%rbp), %xmm3
	movdqu	%xmm15, -96(%r10)
	movdqu	%xmm14, -80(%r10)
	movdqa	-240(%rbp), %xmm14
	aesenc	%xmm14, %xmm0
	aesenc	%xmm14, %xmm1
	movdqa	-256(%rbp), %xmm15
	aesenc	%xmm15, %xmm0
	aesenc	%xmm15, %xmm1
	aesenc	%xmm4, %xmm0
	aesenc	%xmm4, %xmm1
	aesenc	%xmm13, %xmm0
	aesenc	%xmm13, %xmm1
	aesenc	%xmm3, %xmm0
	aesenc	%xmm3, %xmm1
	aesenc	%xmm10, %xmm0
	aesenc	%xmm10, %xmm1
	aesenc	%xmm9, %xmm0
	aesenc	%xmm9, %xmm1
	aesenc	%xmm8, %xmm0
	aesenc	%xmm8, %xmm1
	aesenc	%xmm7, %xmm0
	aesenc	%xmm7, %xmm1
	aesenclast	%xmm6, %xmm0
	movdqu	%xmm11, -64(%r10)
	movdqu	-48(%r10), %xmm2
	pxor	%xmm0, %xmm2
	aesenclast	%xmm6, %xmm1
	movdqu	%xmm2, -48(%r10)
	movdqu	-32(%r10), %xmm0
	pxor	%xmm1, %xmm0
	aesenc	%xmm14, %xmm5
	aesenc	%xmm14, %xmm12
	aesenc	%xmm15, %xmm5
	aesenc	%xmm15, %xmm12
	aesenc	%xmm4, %xmm5
	aesenc	%xmm4, %xmm12
	aesenc	%xmm13, %xmm5
	aesenc	%xmm13, %xmm12
	aesenc	%xmm3, %xmm5
	aesenc	%xmm3, %xmm12
	aesenc	%xmm10, %xmm5
	aesenc	%xmm10, %xmm12
	aesenc	%xmm9, %xmm5
	aesenc	%xmm9, %xmm12
	aesenc	%xmm8, %xmm5
	aesenc	%xmm8, %xmm12
	aesenc	%xmm7, %xmm5
	aesenc	%xmm7, %xmm12
	aesenclast	%xmm6, %xmm5
	aesenclast	%xmm6, %xmm12
	movdqu	%xmm0, -32(%r10)
	movdqu	-16(%r10), %xmm0
	pxor	%xmm5, %xmm0
	movdqu	%xmm0, -16(%r10)
	movdqu	(%r10), %xmm0
	pxor	%xmm12, %xmm0
	movdqu	%xmm0, (%r10)
	addq	$8, %rdi
	subq	$-128, %r10
	cmpq	%rdi, %rdx
	je	.LBB157_15
.LBB157_6:
	leal	(%rsi,%rdi), %r11d
	movzbl	%r11b, %ebx
	bswapl	%r11d
	movd	%r11d, %xmm15
	pslldq	$12, %xmm15
	cmpl	$249, %ebx
	jb	.LBB157_4
	leal	(%rsi,%rdi), %r11d
	incl	%r11d
	bswapl	%r11d
	movd	%r11d, %xmm14
	pslldq	$12, %xmm14
	movdqa	-96(%rbp), %xmm4
	pxor	%xmm4, %xmm14
	leal	2(%rsi,%rdi), %r11d
	bswapl	%r11d
	movd	%r11d, %xmm11
	pslldq	$12, %xmm11
	pxor	%xmm4, %xmm11
	leal	3(%rsi,%rdi), %r11d
	bswapl	%r11d
	movd	%r11d, %xmm2
	pslldq	$12, %xmm2
	pxor	%xmm4, %xmm2
	leal	4(%rsi,%rdi), %r11d
	bswapl	%r11d
	movd	%r11d, %xmm0
	pslldq	$12, %xmm0
	pxor	%xmm4, %xmm0
	leal	5(%rsi,%rdi), %r11d
	bswapl	%r11d
	movd	%r11d, %xmm1
	pslldq	$12, %xmm1
	pxor	%xmm4, %xmm1
	leal	6(%rsi,%rdi), %r11d
	bswapl	%r11d
	movd	%r11d, %xmm5
	pslldq	$12, %xmm5
	pxor	%xmm4, %xmm5
	leal	7(%rsi,%rdi), %r11d
	bswapl	%r11d
	movd	%r11d, %xmm12
	pslldq	$12, %xmm12
	pxor	%xmm4, %xmm12
	jmp	.LBB157_5
.LBB157_8:
	movdqu	(%rdi), %xmm1
	movdqu	16(%rdi), %xmm11
	movdqu	32(%rdi), %xmm9
	movdqu	48(%rdi), %xmm6
	movdqu	64(%rdi), %xmm5
	movdqu	80(%rdi), %xmm4
	movdqu	96(%rdi), %xmm3
	movdqu	112(%rdi), %xmm2
	movdqu	128(%rdi), %xmm10
	movdqu	144(%rdi), %xmm7
	movups	160(%rdi), %xmm0
	movaps	%xmm0, -160(%rbp)
	movups	176(%rdi), %xmm0
	movaps	%xmm0, -80(%rbp)
	movups	192(%rdi), %xmm0
	movaps	%xmm0, -176(%rbp)
	movups	208(%rdi), %xmm0
	movaps	%xmm0, -208(%rbp)
	movups	224(%rdi), %xmm0
	movaps	%xmm0, -192(%rbp)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -224(%rbp)
	leaq	-224(%rbp), %rax
	movq	%rdx, %rsi
	subq	%rax, %rsi
	subq	%rdx, %rax
	cmovbq	%rsi, %rax
	cmpq	$11, %rax
	jbe	.LBB157_55
	movl	8(%rdx), %eax
	movl	%eax, -216(%rbp)
	movq	(%rdx), %rax
	movq	%rax, -224(%rbp)
	movdqa	-224(%rbp), %xmm0
	movdqa	%xmm0, -336(%rbp)
	pxor	%xmm1, %xmm0
	movdqa	%xmm0, -112(%rbp)
	movabsq	$9223372036854775680, %rax
	andq	%r9, %rax
	movq	%r9, %rdx
	shrq	$7, %rdx
	je	.LBB157_20
	movdqa	%xmm1, -320(%rbp)
	movdqa	%xmm11, -288(%rbp)
	movdqa	%xmm9, -304(%rbp)
	movdqa	%xmm6, -272(%rbp)
	movdqa	%xmm5, -96(%rbp)
	movdqa	%xmm4, -240(%rbp)
	movdqa	%xmm3, -256(%rbp)
	movdqa	%xmm2, -64(%rbp)
	movl	%ecx, %esi
	leaq	112(%r8), %r10
	shlq	$3, %rdx
	xorl	%edi, %edi
	movdqa	%xmm7, -352(%rbp)
	movdqa	-160(%rbp), %xmm14
	movdqa	-176(%rbp), %xmm12
	jmp	.LBB157_13
.LBB157_11:
	movdqa	-336(%rbp), %xmm5
	pxor	%xmm1, %xmm5
	movdqa	%xmm5, %xmm3
	paddb	.LCPI157_0(%rip), %xmm3
	movdqa	-320(%rbp), %xmm9
	pxor	%xmm9, %xmm3
	movdqa	%xmm5, %xmm15
	paddb	.LCPI157_1(%rip), %xmm15
	pxor	%xmm9, %xmm15
	movdqa	%xmm5, %xmm0
	paddb	.LCPI157_2(%rip), %xmm0
	pxor	%xmm9, %xmm0
	movdqa	%xmm5, %xmm2
	paddb	.LCPI157_3(%rip), %xmm2
	pxor	%xmm9, %xmm2
	movdqa	%xmm5, %xmm4
	paddb	.LCPI157_4(%rip), %xmm4
	pxor	%xmm9, %xmm4
	movdqa	%xmm5, %xmm6
	paddb	.LCPI157_5(%rip), %xmm6
	pxor	%xmm9, %xmm6
	paddb	.LCPI157_6(%rip), %xmm5
.LBB157_12:
	pxor	%xmm9, %xmm5
	movdqa	-112(%rbp), %xmm9
	pxor	%xmm9, %xmm1
	movdqa	-288(%rbp), %xmm8
	aesenc	%xmm8, %xmm1
	aesenc	%xmm8, %xmm3
	aesenc	%xmm8, %xmm15
	aesenc	%xmm8, %xmm0
	movdqa	-304(%rbp), %xmm8
	aesenc	%xmm8, %xmm1
	aesenc	%xmm8, %xmm3
	aesenc	%xmm8, %xmm15
	aesenc	%xmm8, %xmm0
	movdqa	-272(%rbp), %xmm8
	aesenc	%xmm8, %xmm1
	aesenc	%xmm8, %xmm3
	aesenc	%xmm8, %xmm15
	aesenc	%xmm8, %xmm0
	movdqa	-96(%rbp), %xmm8
	aesenc	%xmm8, %xmm1
	aesenc	%xmm8, %xmm3
	aesenc	%xmm8, %xmm15
	aesenc	%xmm8, %xmm0
	movdqa	-240(%rbp), %xmm8
	aesenc	%xmm8, %xmm1
	aesenc	%xmm8, %xmm3
	aesenc	%xmm8, %xmm15
	aesenc	%xmm8, %xmm0
	movdqa	-256(%rbp), %xmm8
	aesenc	%xmm8, %xmm1
	aesenc	%xmm8, %xmm3
	aesenc	%xmm8, %xmm15
	aesenc	%xmm8, %xmm0
	movdqa	-64(%rbp), %xmm8
	aesenc	%xmm8, %xmm1
	aesenc	%xmm8, %xmm3
	aesenc	%xmm8, %xmm15
	aesenc	%xmm8, %xmm0
	aesenc	%xmm10, %xmm1
	aesenc	%xmm10, %xmm3
	aesenc	%xmm10, %xmm15
	aesenc	%xmm10, %xmm0
	aesenc	%xmm7, %xmm1
	aesenc	%xmm7, %xmm3
	aesenc	%xmm7, %xmm15
	aesenc	%xmm7, %xmm0
	aesenc	%xmm14, %xmm1
	aesenc	%xmm14, %xmm3
	aesenc	%xmm14, %xmm15
	aesenc	%xmm14, %xmm0
	movdqa	-80(%rbp), %xmm9
	aesenc	%xmm9, %xmm1
	aesenc	%xmm9, %xmm3
	aesenc	%xmm9, %xmm15
	aesenc	%xmm9, %xmm0
	aesenc	%xmm12, %xmm1
	aesenc	%xmm12, %xmm3
	aesenc	%xmm12, %xmm15
	aesenc	%xmm12, %xmm0
	movdqa	-208(%rbp), %xmm13
	aesenc	%xmm13, %xmm1
	aesenc	%xmm13, %xmm3
	aesenc	%xmm13, %xmm15
	aesenc	%xmm13, %xmm0
	movdqa	-192(%rbp), %xmm11
	aesenclast	%xmm11, %xmm1
	aesenclast	%xmm11, %xmm3
	aesenclast	%xmm11, %xmm15
	aesenclast	%xmm11, %xmm0
	movdqu	-112(%r10), %xmm7
	pxor	%xmm1, %xmm7
	movdqa	%xmm10, %xmm9
	movdqu	-96(%r10), %xmm8
	pxor	%xmm3, %xmm8
	movdqu	-80(%r10), %xmm3
	pxor	%xmm15, %xmm3
	movdqu	-64(%r10), %xmm10
	pxor	%xmm0, %xmm10
	movdqu	%xmm7, -112(%r10)
	movdqa	%xmm13, %xmm15
	movdqa	-80(%rbp), %xmm13
	movdqa	-352(%rbp), %xmm1
	movdqu	%xmm8, -96(%r10)
	movdqa	%xmm11, %xmm8
	movdqa	%xmm9, %xmm7
	movdqu	%xmm3, -80(%r10)
	movdqa	-288(%rbp), %xmm3
	aesenc	%xmm3, %xmm2
	aesenc	%xmm3, %xmm4
	movdqa	-304(%rbp), %xmm9
	aesenc	%xmm9, %xmm2
	aesenc	%xmm9, %xmm4
	movdqa	-272(%rbp), %xmm11
	aesenc	%xmm11, %xmm2
	aesenc	%xmm11, %xmm4
	movdqa	-96(%rbp), %xmm0
	aesenc	%xmm0, %xmm2
	aesenc	%xmm0, %xmm4
	movdqa	-240(%rbp), %xmm0
	aesenc	%xmm0, %xmm2
	aesenc	%xmm0, %xmm4
	movdqa	-256(%rbp), %xmm0
	aesenc	%xmm0, %xmm2
	aesenc	%xmm0, %xmm4
	movdqa	-64(%rbp), %xmm0
	aesenc	%xmm0, %xmm2
	aesenc	%xmm0, %xmm4
	aesenc	%xmm7, %xmm2
	aesenc	%xmm7, %xmm4
	aesenc	%xmm1, %xmm2
	aesenc	%xmm1, %xmm4
	aesenc	%xmm14, %xmm2
	aesenc	%xmm14, %xmm4
	aesenc	%xmm13, %xmm2
	aesenc	%xmm13, %xmm4
	aesenc	%xmm12, %xmm2
	aesenc	%xmm12, %xmm4
	aesenc	%xmm15, %xmm2
	aesenc	%xmm15, %xmm4
	aesenclast	%xmm8, %xmm2
	movdqu	%xmm10, -64(%r10)
	movdqu	-48(%r10), %xmm0
	pxor	%xmm2, %xmm0
	aesenclast	%xmm8, %xmm4
	movdqu	%xmm0, -48(%r10)
	movdqu	-32(%r10), %xmm0
	pxor	%xmm4, %xmm0
	aesenc	%xmm3, %xmm6
	aesenc	%xmm3, %xmm5
	aesenc	%xmm9, %xmm6
	aesenc	%xmm9, %xmm5
	aesenc	%xmm11, %xmm6
	aesenc	%xmm11, %xmm5
	movdqa	-96(%rbp), %xmm2
	aesenc	%xmm2, %xmm6
	aesenc	%xmm2, %xmm5
	movdqa	-240(%rbp), %xmm2
	aesenc	%xmm2, %xmm6
	aesenc	%xmm2, %xmm5
	movdqa	-256(%rbp), %xmm2
	aesenc	%xmm2, %xmm6
	aesenc	%xmm2, %xmm5
	movdqa	-64(%rbp), %xmm2
	aesenc	%xmm2, %xmm6
	aesenc	%xmm2, %xmm5
	aesenc	%xmm7, %xmm6
	movdqa	%xmm7, %xmm10
	aesenc	%xmm7, %xmm5
	aesenc	%xmm1, %xmm6
	movdqa	%xmm1, %xmm7
	aesenc	%xmm1, %xmm5
	aesenc	%xmm14, %xmm6
	aesenc	%xmm14, %xmm5
	aesenc	%xmm13, %xmm6
	aesenc	%xmm13, %xmm5
	aesenc	%xmm12, %xmm6
	aesenc	%xmm12, %xmm5
	aesenc	%xmm15, %xmm6
	aesenc	%xmm15, %xmm5
	aesenclast	%xmm8, %xmm6
	aesenclast	%xmm8, %xmm5
	movdqu	%xmm0, -32(%r10)
	movdqu	-16(%r10), %xmm0
	pxor	%xmm6, %xmm0
	movdqu	%xmm0, -16(%r10)
	movdqu	(%r10), %xmm0
	pxor	%xmm5, %xmm0
	movdqu	%xmm0, (%r10)
	addq	$8, %rdi
	subq	$-128, %r10
	cmpq	%rdi, %rdx
	je	.LBB157_19
.LBB157_13:
	leal	(%rsi,%rdi), %r11d
	movzbl	%r11b, %ebx
	bswapl	%r11d
	movd	%r11d, %xmm1
	pslldq	$12, %xmm1
	cmpl	$249, %ebx
	jb	.LBB157_11
	leal	(%rsi,%rdi), %r11d
	incl	%r11d
	bswapl	%r11d
	movd	%r11d, %xmm3
	pslldq	$12, %xmm3
	movdqa	-112(%rbp), %xmm9
	pxor	%xmm9, %xmm3
	leal	2(%rsi,%rdi), %r11d
	bswapl	%r11d
	movd	%r11d, %xmm15
	pslldq	$12, %xmm15
	pxor	%xmm9, %xmm15
	leal	3(%rsi,%rdi), %r11d
	bswapl	%r11d
	movd	%r11d, %xmm0
	pslldq	$12, %xmm0
	pxor	%xmm9, %xmm0
	leal	4(%rsi,%rdi), %r11d
	bswapl	%r11d
	movd	%r11d, %xmm2
	pslldq	$12, %xmm2
	pxor	%xmm9, %xmm2
	leal	5(%rsi,%rdi), %r11d
	bswapl	%r11d
	movd	%r11d, %xmm4
	pslldq	$12, %xmm4
	pxor	%xmm9, %xmm4
	leal	6(%rsi,%rdi), %r11d
	bswapl	%r11d
	movd	%r11d, %xmm6
	pslldq	$12, %xmm6
	pxor	%xmm9, %xmm6
	leal	7(%rsi,%rdi), %r11d
	bswapl	%r11d
	movd	%r11d, %xmm5
	pslldq	$12, %xmm5
	jmp	.LBB157_12
.LBB157_15:
	addl	%edi, %ecx
	movdqa	-272(%rbp), %xmm2
	movdqa	-256(%rbp), %xmm4
	movdqa	-240(%rbp), %xmm3
.LBB157_16:
	addq	%rax, %r8
	movl	%r9d, %eax
	andl	$15, %eax
	movl	%r9d, %edx
	shrl	$4, %edx
	andl	$7, %edx
	je	.LBB157_36
	movl	%ecx, %esi
	bswapl	%esi
	movd	%esi, %xmm0
	pslldq	$12, %xmm0
	pxor	-96(%rbp), %xmm0
	aesenc	%xmm3, %xmm0
	aesenc	%xmm4, %xmm0
	aesenc	%xmm2, %xmm0
	aesenc	-80(%rbp), %xmm0
	aesenc	-64(%rbp), %xmm0
	aesenc	-160(%rbp), %xmm0
	aesenc	-176(%rbp), %xmm0
	aesenc	-192(%rbp), %xmm0
	aesenc	-208(%rbp), %xmm0
	aesenclast	-112(%rbp), %xmm0
	movdqu	(%r8), %xmm1
	pxor	%xmm0, %xmm1
	movdqu	%xmm1, (%r8)
	leal	1(%rcx), %esi
	cmpl	$1, %edx
	je	.LBB157_18
	bswapl	%esi
	movd	%esi, %xmm0
	pslldq	$12, %xmm0
	pxor	-96(%rbp), %xmm0
	aesenc	%xmm3, %xmm0
	aesenc	%xmm4, %xmm0
	aesenc	%xmm2, %xmm0
	aesenc	-80(%rbp), %xmm0
	aesenc	-64(%rbp), %xmm0
	aesenc	-160(%rbp), %xmm0
	aesenc	-176(%rbp), %xmm0
	aesenc	-192(%rbp), %xmm0
	aesenc	-208(%rbp), %xmm0
	aesenclast	-112(%rbp), %xmm0
	movdqu	16(%r8), %xmm1
	pxor	%xmm0, %xmm1
	movdqu	%xmm1, 16(%r8)
	leal	2(%rcx), %esi
	cmpl	$2, %edx
	je	.LBB157_18
	bswapl	%esi
	movd	%esi, %xmm0
	pslldq	$12, %xmm0
	pxor	-96(%rbp), %xmm0
	aesenc	%xmm3, %xmm0
	aesenc	%xmm4, %xmm0
	aesenc	%xmm2, %xmm0
	aesenc	-80(%rbp), %xmm0
	aesenc	-64(%rbp), %xmm0
	aesenc	-160(%rbp), %xmm0
	aesenc	-176(%rbp), %xmm0
	aesenc	-192(%rbp), %xmm0
	aesenc	-208(%rbp), %xmm0
	aesenclast	-112(%rbp), %xmm0
	movdqu	32(%r8), %xmm1
	pxor	%xmm0, %xmm1
	movdqu	%xmm1, 32(%r8)
	leal	3(%rcx), %esi
	cmpl	$3, %edx
	je	.LBB157_18
	bswapl	%esi
	movd	%esi, %xmm0
	pslldq	$12, %xmm0
	pxor	-96(%rbp), %xmm0
	aesenc	%xmm3, %xmm0
	aesenc	%xmm4, %xmm0
	aesenc	%xmm2, %xmm0
	aesenc	-80(%rbp), %xmm0
	aesenc	-64(%rbp), %xmm0
	aesenc	-160(%rbp), %xmm0
	aesenc	-176(%rbp), %xmm0
	aesenc	-192(%rbp), %xmm0
	aesenc	-208(%rbp), %xmm0
	aesenclast	-112(%rbp), %xmm0
	movdqu	48(%r8), %xmm1
	pxor	%xmm0, %xmm1
	movdqu	%xmm1, 48(%r8)
	leal	4(%rcx), %esi
	cmpl	$4, %edx
	je	.LBB157_18
	bswapl	%esi
	movd	%esi, %xmm0
	pslldq	$12, %xmm0
	pxor	-96(%rbp), %xmm0
	aesenc	%xmm3, %xmm0
	aesenc	%xmm4, %xmm0
	aesenc	%xmm2, %xmm0
	aesenc	-80(%rbp), %xmm0
	aesenc	-64(%rbp), %xmm0
	aesenc	-160(%rbp), %xmm0
	aesenc	-176(%rbp), %xmm0
	aesenc	-192(%rbp), %xmm0
	aesenc	-208(%rbp), %xmm0
	aesenclast	-112(%rbp), %xmm0
	movdqu	64(%r8), %xmm1
	pxor	%xmm0, %xmm1
	movdqu	%xmm1, 64(%r8)
	leal	5(%rcx), %esi
	cmpl	$5, %edx
	je	.LBB157_18
	bswapl	%esi
	movd	%esi, %xmm0
	pslldq	$12, %xmm0
	pxor	-96(%rbp), %xmm0
	aesenc	%xmm3, %xmm0
	aesenc	%xmm4, %xmm0
	aesenc	%xmm2, %xmm0
	aesenc	-80(%rbp), %xmm0
	aesenc	-64(%rbp), %xmm0
	aesenc	-160(%rbp), %xmm0
	aesenc	-176(%rbp), %xmm0
	aesenc	-192(%rbp), %xmm0
	aesenc	-208(%rbp), %xmm0
	aesenclast	-112(%rbp), %xmm0
	movdqu	80(%r8), %xmm1
	pxor	%xmm0, %xmm1
	movdqu	%xmm1, 80(%r8)
	leal	6(%rcx), %esi
	cmpl	$6, %edx
	jne	.LBB157_35
.LBB157_18:
	movl	%esi, %ecx
.LBB157_36:
	testq	%rax, %rax
	je	.LBB157_54
.LBB157_37:
	bswapl	%ecx
	movd	%ecx, %xmm0
	pslldq	$12, %xmm0
	movdqa	-96(%rbp), %xmm1
	pxor	%xmm0, %xmm1
	aesenc	%xmm3, %xmm1
	aesenc	%xmm4, %xmm1
	aesenc	%xmm2, %xmm1
	aesenc	-80(%rbp), %xmm1
	aesenc	-64(%rbp), %xmm1
	aesenc	-160(%rbp), %xmm1
	aesenc	-176(%rbp), %xmm1
	aesenc	-192(%rbp), %xmm1
	aesenc	-208(%rbp), %xmm1
	aesenclast	-112(%rbp), %xmm1
	andl	$112, %r9d
	movdqa	%xmm1, -128(%rbp)
	movzbl	-128(%rbp), %esi
	movzbl	-126(%rbp), %edx
	movzbl	-125(%rbp), %ecx
	movzbl	-124(%rbp), %r13d
	movzbl	-123(%rbp), %r12d
	movzbl	-122(%rbp), %r15d
	movzbl	-121(%rbp), %r14d
	movzbl	-120(%rbp), %ebx
	movzbl	-119(%rbp), %r11d
	movzbl	-118(%rbp), %r10d
	movzbl	-117(%rbp), %edi
	movb	%dil, -80(%rbp)
	movzbl	-116(%rbp), %edi
	movb	%dil, -64(%rbp)
	movzbl	-115(%rbp), %edi
	movb	%dil, -256(%rbp)
	movzbl	-114(%rbp), %edi
	jmp	.LBB157_38
.LBB157_19:
	addl	%edi, %ecx
	movdqa	-64(%rbp), %xmm2
	movdqa	-256(%rbp), %xmm3
	movdqa	-240(%rbp), %xmm4
	movdqa	-96(%rbp), %xmm5
	movdqa	-272(%rbp), %xmm6
	movdqa	-304(%rbp), %xmm9
	movdqa	-288(%rbp), %xmm11
.LBB157_20:
	addq	%rax, %r8
	movl	%r9d, %eax
	andl	$15, %eax
	movl	%r9d, %edx
	shrl	$4, %edx
	andl	$7, %edx
	je	.LBB157_23
	shll	$4, %edx
	xorl	%esi, %esi
.LBB157_22:
	movl	%ecx, %edi
	bswapl	%edi
	movd	%edi, %xmm0
	pslldq	$12, %xmm0
	pxor	-112(%rbp), %xmm0
	aesenc	%xmm11, %xmm0
	aesenc	%xmm9, %xmm0
	aesenc	%xmm6, %xmm0
	aesenc	%xmm5, %xmm0
	aesenc	%xmm4, %xmm0
	aesenc	%xmm3, %xmm0
	aesenc	%xmm2, %xmm0
	aesenc	%xmm10, %xmm0
	aesenc	%xmm7, %xmm0
	aesenc	-160(%rbp), %xmm0
	aesenc	-80(%rbp), %xmm0
	aesenc	-176(%rbp), %xmm0
	aesenc	-208(%rbp), %xmm0
	aesenclast	-192(%rbp), %xmm0
	movdqu	(%r8,%rsi), %xmm1
	pxor	%xmm0, %xmm1
	movdqu	%xmm1, (%r8,%rsi)
	incl	%ecx
	addq	$16, %rsi
	cmpq	%rsi, %rdx
	jne	.LBB157_22
.LBB157_23:
	testq	%rax, %rax
	je	.LBB157_54
	bswapl	%ecx
	movd	%ecx, %xmm0
	pslldq	$12, %xmm0
	movdqa	-112(%rbp), %xmm1
	pxor	%xmm0, %xmm1
	aesenc	%xmm11, %xmm1
	aesenc	%xmm9, %xmm1
	aesenc	%xmm6, %xmm1
	aesenc	%xmm5, %xmm1
	aesenc	%xmm4, %xmm1
	aesenc	%xmm3, %xmm1
	aesenc	%xmm2, %xmm1
	aesenc	%xmm10, %xmm1
	aesenc	%xmm7, %xmm1
	aesenc	-160(%rbp), %xmm1
	aesenc	-80(%rbp), %xmm1
	aesenc	-176(%rbp), %xmm1
	aesenc	-208(%rbp), %xmm1
	aesenclast	-192(%rbp), %xmm1
	andl	$112, %r9d
	movdqa	%xmm1, -144(%rbp)
	movzbl	-144(%rbp), %esi
	movzbl	-142(%rbp), %edx
	movzbl	-141(%rbp), %ecx
	movzbl	-140(%rbp), %r13d
	movzbl	-139(%rbp), %r12d
	movzbl	-138(%rbp), %r15d
	movzbl	-137(%rbp), %r14d
	movzbl	-136(%rbp), %ebx
	movzbl	-135(%rbp), %r11d
	movzbl	-134(%rbp), %r10d
	movzbl	-133(%rbp), %edi
	movb	%dil, -80(%rbp)
	movzbl	-132(%rbp), %edi
	movb	%dil, -64(%rbp)
	movzbl	-131(%rbp), %edi
	movb	%dil, -256(%rbp)
	movzbl	-130(%rbp), %edi
.LBB157_38:
	movb	%dil, -240(%rbp)
	xorb	%sil, (%r8,%r9)
	cmpl	$1, %eax
	je	.LBB157_53
	movd	%xmm1, %esi
	shrl	$8, %esi
	xorb	%sil, 1(%r8,%r9)
	cmpl	$2, %eax
	je	.LBB157_53
	xorb	%dl, 2(%r8,%r9)
	cmpl	$3, %eax
	je	.LBB157_53
	xorb	%cl, 3(%r8,%r9)
	cmpl	$4, %eax
	je	.LBB157_53
	xorb	%r13b, 4(%r8,%r9)
	cmpl	$5, %eax
	je	.LBB157_53
	xorb	%r12b, 5(%r8,%r9)
	cmpl	$6, %eax
	je	.LBB157_53
	xorb	%r15b, 6(%r8,%r9)
	cmpl	$7, %eax
	je	.LBB157_53
	xorb	%r14b, 7(%r8,%r9)
	cmpl	$8, %eax
	je	.LBB157_53
	xorb	%bl, 8(%r8,%r9)
	cmpl	$9, %eax
	je	.LBB157_53
	xorb	%r11b, 9(%r8,%r9)
	cmpl	$10, %eax
	je	.LBB157_53
	xorb	%r10b, 10(%r8,%r9)
	cmpl	$11, %eax
	je	.LBB157_53
	movzbl	-80(%rbp), %ecx
	xorb	%cl, 11(%r8,%r9)
	cmpl	$12, %eax
	je	.LBB157_53
	movzbl	-64(%rbp), %ecx
	xorb	%cl, 12(%r8,%r9)
	cmpl	$13, %eax
	je	.LBB157_53
	movzbl	-256(%rbp), %ecx
	xorb	%cl, 13(%r8,%r9)
	cmpl	$14, %eax
	je	.LBB157_53
	movzbl	-240(%rbp), %eax
	xorb	%al, 14(%r8,%r9)
.LBB157_53:
	pxor	%xmm0, %xmm0
	movdqa	%xmm0, -224(%rbp)
	movdqa	-224(%rbp), %xmm0
	movdqa	%xmm0, -368(%rbp)
.LBB157_54:
	addq	$328, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB157_35:
	bswapl	%esi
	movd	%esi, %xmm0
	pslldq	$12, %xmm0
	pxor	-96(%rbp), %xmm0
	aesenc	%xmm3, %xmm0
	aesenc	%xmm4, %xmm0
	aesenc	%xmm2, %xmm0
	aesenc	-80(%rbp), %xmm0
	aesenc	-64(%rbp), %xmm0
	aesenc	-160(%rbp), %xmm0
	aesenc	-176(%rbp), %xmm0
	aesenc	-192(%rbp), %xmm0
	aesenc	-208(%rbp), %xmm0
	aesenclast	-112(%rbp), %xmm0
	movdqu	96(%r8), %xmm1
	pxor	%xmm0, %xmm1
	movdqu	%xmm1, 96(%r8)
	addl	$7, %ecx
	testq	%rax, %rax
	jne	.LBB157_37
	jmp	.LBB157_54
.LBB157_55:
	leaq	.Lanon.7e635326e95ff0630b0cf2686a4c3962.168(%rip), %rdi
	leaq	.Lanon.7e635326e95ff0630b0cf2686a4c3962.13(%rip), %rcx
	movl	$567, %esi
	xorl	%edx, %edx
	callq	_RNvNtCs9VSTO83uhuD_4core9panicking18panic_nounwind_fmt@PLT
.Lfunc_end157:
	.size	_RNvNtNtNtCs4U4sOGKWW3b_12toyos_crypto4arch6x86_645aesni3ctr, .Lfunc_end157-_RNvNtNtNtCs4U4sOGKWW3b_12toyos_crypto4arch6x86_645aesni3ctr
