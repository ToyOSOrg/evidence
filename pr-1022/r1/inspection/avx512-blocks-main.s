__RNvNtNtNtNtCsgH5pGWrFjzB_12toyos_crypto4arch6x86_646chacha6avx5126blocks:
Lfunc_begin166:
	pushq	%rbp
	movq	%rsp, %rbp
	vmovdqu	(%rdi), %ymm0
	vmovdqu	16(%rdi), %ymm1
	vmovdqu	32(%rdi), %ymm4
	vinserti128	$1, 64(%rdi), %ymm0, %ymm3
	vinserti128	$1, 80(%rdi), %ymm1, %ymm2
	vinserti128	$1, 96(%rdi), %ymm4, %ymm0
	vmovdqu	48(%rdi), %ymm1
	vinserti128	$1, 112(%rdi), %ymm1, %ymm1
	cmpq	$3, %rsi
	jae	LBB166_1
	movl	$10, %eax
	vmovdqa	%ymm3, %ymm4
	vmovdqa	%ymm2, %ymm5
	vmovdqa	%ymm0, %ymm6
	vmovdqa	%ymm1, %ymm7
	.p2align	4
LBB166_5:
	vpaddd	%ymm4, %ymm5, %ymm4
	vpxor	%ymm4, %ymm7, %ymm7
	vprold	$16, %ymm7, %ymm7
	vpaddd	%ymm6, %ymm7, %ymm6
	vpxor	%ymm5, %ymm6, %ymm5
	vprold	$12, %ymm5, %ymm5
	vpaddd	%ymm4, %ymm5, %ymm4
	vpxor	%ymm7, %ymm4, %ymm7
	vprold	$8, %ymm7, %ymm7
	vpaddd	%ymm6, %ymm7, %ymm6
	vpxor	%ymm5, %ymm6, %ymm5
	vpshufd	$57, %ymm5, %ymm5
	vprold	$7, %ymm5, %ymm5
	vpshufd	$78, %ymm6, %ymm6
	vpshufd	$147, %ymm7, %ymm7
	vpaddd	%ymm4, %ymm5, %ymm4
	vpxor	%ymm7, %ymm4, %ymm7
	vprold	$16, %ymm7, %ymm7
	vpaddd	%ymm6, %ymm7, %ymm6
	vpxor	%ymm5, %ymm6, %ymm5
	vprold	$12, %ymm5, %ymm5
	vpaddd	%ymm4, %ymm5, %ymm4
	vpxor	%ymm7, %ymm4, %ymm7
	vprold	$8, %ymm7, %ymm7
	vpaddd	%ymm6, %ymm7, %ymm6
	vpxor	%ymm5, %ymm6, %ymm5
	vpshufd	$147, %ymm5, %ymm5
	vprold	$7, %ymm5, %ymm5
	vpshufd	$78, %ymm6, %ymm6
	vpshufd	$57, %ymm7, %ymm7
	decq	%rax
	jne	LBB166_5
	vpaddd	%ymm3, %ymm4, %ymm8
	vpaddd	%ymm2, %ymm5, %ymm3
	vpaddd	%ymm0, %ymm6, %ymm0
	vpaddd	%ymm1, %ymm7, %ymm1
	vinserti128	$1, %xmm3, %ymm0, %ymm2
	vinserti128	$1, %xmm1, %ymm0, %ymm4
	vperm2i128	$49, %ymm3, %ymm8, %ymm3
	vperm2i128	$49, %ymm1, %ymm0, %ymm1
	vmovdqu	%xmm8, (%rdx)
	movl	$112, %eax
	movl	$96, %ecx
	movl	$80, %esi
	movl	$64, %edi
	movl	$48, %r8d
	movl	$32, %r9d
	movl	$16, %r10d
	jmp	LBB166_7
LBB166_1:
	vmovdqu	128(%rdi), %ymm4
	vmovdqu	144(%rdi), %ymm5
	vmovdqu	160(%rdi), %ymm6
	vinserti128	$1, 192(%rdi), %ymm4, %ymm4
	vinserti128	$1, 208(%rdi), %ymm5, %ymm5
	vinserti128	$1, 224(%rdi), %ymm6, %ymm6
	vmovdqu	176(%rdi), %ymm7
	vinserti128	$1, 240(%rdi), %ymm7, %ymm7
	movl	$10, %eax
	vmovdqa	%ymm7, %ymm11
	vmovdqa	%ymm6, %ymm8
	vmovdqa	%ymm5, %ymm9
	vmovdqa	%ymm4, %ymm10
	vmovdqa	%ymm1, %ymm15
	vmovdqa	%ymm0, %ymm12
	vmovdqa	%ymm2, %ymm13
	vmovdqa	%ymm3, %ymm14
	.p2align	4
LBB166_2:
	vpaddd	%ymm13, %ymm14, %ymm14
	vpxor	%ymm15, %ymm14, %ymm15
	vprold	$16, %ymm15, %ymm15
	vpaddd	%ymm12, %ymm15, %ymm12
	vpxor	%ymm13, %ymm12, %ymm13
	vprold	$12, %ymm13, %ymm13
	vpaddd	%ymm14, %ymm13, %ymm14
	vpxor	%ymm15, %ymm14, %ymm15
	vprold	$8, %ymm15, %ymm15
	vpaddd	%ymm12, %ymm15, %ymm12
	vpxor	%ymm13, %ymm12, %ymm13
	vpshufd	$57, %ymm13, %ymm13
	vprold	$7, %ymm13, %ymm13
	vpshufd	$78, %ymm12, %ymm12
	vpshufd	$147, %ymm15, %ymm15
	vpaddd	%ymm9, %ymm10, %ymm10
	vpxor	%ymm11, %ymm10, %ymm11
	vprold	$16, %ymm11, %ymm11
	vpaddd	%ymm8, %ymm11, %ymm8
	vpxor	%ymm9, %ymm8, %ymm9
	vprold	$12, %ymm9, %ymm9
	vpaddd	%ymm10, %ymm9, %ymm10
	vpxor	%ymm11, %ymm10, %ymm11
	vprold	$8, %ymm11, %ymm11
	vpaddd	%ymm8, %ymm11, %ymm8
	vpxor	%ymm9, %ymm8, %ymm9
	vpshufd	$57, %ymm9, %ymm9
	vprold	$7, %ymm9, %ymm9
	vpshufd	$78, %ymm8, %ymm8
	vpshufd	$147, %ymm11, %ymm11
	vpaddd	%ymm14, %ymm13, %ymm14
	vpxor	%ymm15, %ymm14, %ymm15
	vprold	$16, %ymm15, %ymm15
	vpaddd	%ymm12, %ymm15, %ymm12
	vpxor	%ymm13, %ymm12, %ymm13
	vprold	$12, %ymm13, %ymm13
	vpaddd	%ymm14, %ymm13, %ymm14
	vpxor	%ymm15, %ymm14, %ymm15
	vprold	$8, %ymm15, %ymm15
	vpaddd	%ymm12, %ymm15, %ymm12
	vpxor	%ymm13, %ymm12, %ymm13
	vpshufd	$147, %ymm13, %ymm13
	vprold	$7, %ymm13, %ymm13
	vpshufd	$78, %ymm12, %ymm12
	vpshufd	$57, %ymm15, %ymm15
	vpaddd	%ymm10, %ymm9, %ymm10
	vpxor	%ymm11, %ymm10, %ymm11
	vprold	$16, %ymm11, %ymm11
	vpaddd	%ymm8, %ymm11, %ymm8
	vpxor	%ymm9, %ymm8, %ymm9
	vprold	$12, %ymm9, %ymm9
	vpaddd	%ymm10, %ymm9, %ymm10
	vpxor	%ymm11, %ymm10, %ymm11
	vprold	$8, %ymm11, %ymm11
	vpaddd	%ymm8, %ymm11, %ymm8
	vpxor	%ymm9, %ymm8, %ymm9
	vpshufd	$147, %ymm9, %ymm9
	vprold	$7, %ymm9, %ymm9
	vpshufd	$78, %ymm8, %ymm8
	vpshufd	$57, %ymm11, %ymm11
	decq	%rax
	jne	LBB166_2
	vpaddd	%ymm3, %ymm14, %ymm3
	vpaddd	%ymm2, %ymm13, %ymm2
	vpaddd	%ymm0, %ymm12, %ymm12
	vpaddd	%ymm1, %ymm15, %ymm1
	vpaddd	%ymm4, %ymm10, %ymm10
	vpaddd	%ymm5, %ymm9, %ymm5
	vpaddd	%ymm6, %ymm8, %ymm0
	vpaddd	%ymm7, %ymm11, %ymm6
	vinserti128	$1, %xmm1, %ymm12, %ymm4
	vinserti128	$1, %xmm2, %ymm3, %ymm7
	vinserti64x4	$1, %ymm4, %zmm7, %zmm4
	vmovdqu64	%zmm4, (%rdx)
	vinserti64x4	$1, %ymm1, %zmm12, %zmm1
	vinserti64x4	$1, %ymm2, %zmm3, %zmm2
	vshufi64x2	$221, %zmm1, %zmm2, %zmm1
	vmovdqu64	%zmm1, 64(%rdx)
	vinserti128	$1, %xmm5, %ymm0, %ymm2
	vinserti128	$1, %xmm6, %ymm0, %ymm4
	vperm2i128	$49, %ymm5, %ymm10, %ymm3
	vperm2i128	$49, %ymm6, %ymm0, %ymm1
	vmovdqu	%xmm10, 128(%rdx)
	movl	$240, %eax
	movl	$224, %ecx
	movl	$208, %esi
	movl	$192, %edi
	movl	$176, %r8d
	movl	$160, %r9d
	movl	$144, %r10d
LBB166_7:
	vextracti128	$1, %ymm2, (%rdx,%r10)
	vmovdqu	%xmm0, (%rdx,%r9)
	vextracti128	$1, %ymm4, (%rdx,%r8)
	vmovdqu	%xmm3, (%rdx,%rdi)
	vextracti128	$1, %ymm3, (%rdx,%rsi)
	vmovdqu	%xmm1, (%rdx,%rcx)
	vextracti128	$1, %ymm1, (%rdx,%rax)
	popq	%rbp
	vzeroupper
	retq
Lfunc_end166:

	.globl	__RNvXNtCsgH5pGWrFjzB_12toyos_crypto5mlkemNtB2_4PolyNtNtNtCsjLnd7uqfVBb_4core3ops4drop4Drop4drop
	.p2align	4
__RNvXNtCsgH5pGWrFjzB_12toyos_crypto5mlkemNtB2_4PolyNtNtNtCsjLnd7uqfVBb_4core3ops4drop4Drop4drop:
Lfunc_begin167:
	pushq	%rbp
	movq	%rsp, %rbp
	xorl	%eax, %eax
	.p2align	4
LBB167_1:
	movw	$0, (%rdi,%rax)
	movw	$0, 2(%rdi,%rax)
	movw	$0, 4(%rdi,%rax)
	movw	$0, 6(%rdi,%rax)
	movw	$0, 8(%rdi,%rax)
	movw	$0, 10(%rdi,%rax)
	movw	$0, 12(%rdi,%rax)
	movw	$0, 14(%rdi,%rax)
	addq	$16, %rax
	cmpq	$512, %rax
	jne	LBB167_1
	popq	%rbp
	retq
Lfunc_end167:

	.globl	__RNvXNtCsgH5pGWrFjzB_12toyos_crypto6keccakNtB2_6SpongeNtNtNtCsjLnd7uqfVBb_4core3ops4drop4Drop4drop
	.p2align	4
__RNvXNtCsgH5pGWrFjzB_12toyos_crypto6keccakNtB2_6SpongeNtNtNtCsjLnd7uqfVBb_4core3ops4drop4Drop4drop:
Lfunc_begin168:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$0, (%rdi)
	movq	$0, 8(%rdi)
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movq	$0, 32(%rdi)
	movq	$0, 40(%rdi)
	movq	$0, 48(%rdi)
	movq	$0, 56(%rdi)
	movq	$0, 64(%rdi)
	movq	$0, 72(%rdi)
	movq	$0, 80(%rdi)
	movq	$0, 88(%rdi)
	movq	$0, 96(%rdi)
	movq	$0, 104(%rdi)
	movq	$0, 112(%rdi)
	movq	$0, 120(%rdi)
	movq	$0, 128(%rdi)
	movq	$0, 136(%rdi)
	movq	$0, 144(%rdi)
	movq	$0, 152(%rdi)
	movq	$0, 160(%rdi)
	movq	$0, 168(%rdi)
	movq	$0, 176(%rdi)
	movq	$0, 184(%rdi)
	movq	$0, 192(%rdi)
	popq	%rbp
	retq
Lfunc_end168:

	.p2align	4
__RNvXs1_CsgH5pGWrFjzB_12toyos_cryptoNtB5_5ErrorNtNtCsjLnd7uqfVBb_4core3fmt5Debug3fmt:
Lfunc_begin169:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rsi, %rax
	movzbl	(%rdi), %ecx
	leaq	l_switch.table._RNvXs1_CsgH5pGWrFjzB_12toyos_cryptoNtB5_5ErrorNtNtCsjLnd7uqfVBb_4core3fmt5Debug3fmt(%rip), %rdx
	movq	(%rdx,%rcx,8), %rdx
	leaq	l_switch.table._RNvXs1_CsgH5pGWrFjzB_12toyos_cryptoNtB5_5ErrorNtNtCsjLnd7uqfVBb_4core3fmt5Debug3fmt.1.rel(%rip), %rdi
	movslq	(%rdi,%rcx,4), %rsi
	addq	%rdi, %rsi
	movq	%rax, %rdi
	popq	%rbp
	jmp	__RNvMsa_NtCsjLnd7uqfVBb_4core3fmtNtB5_9Formatter9write_str
Lfunc_end169:

	.p2align	4
__RNvXs1g_NtCsjLnd7uqfVBb_4core3fmtRuNtB6_5Debug3fmtCsgH5pGWrFjzB_12toyos_crypto:
Lfunc_begin170:
	.file	90 "$HOME/.rustup/toolchains/stable-aarch64-apple-darwin/lib/rustlib/src/rust/library/core/src/fmt" "mod.rs"
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rsi, %rdi
	leaq	l_anon.d2ce196b1be0a17c88a81230f55c56e2.181(%rip), %rsi
	movl	$2, %edx
	popq	%rbp
	jmp	__RNvMsa_NtCsjLnd7uqfVBb_4core3fmtNtB5_9Formatter3pad
Lfunc_end170:

	.p2align	4
__RNvXs2Q_NtNtCsjLnd7uqfVBb_4core5slice4iterINtB6_7IterMutNtNtCsgH5pGWrFjzB_12toyos_crypto7ed255196CachedENtNtNtNtBa_4iter6traits8iterator8Iterator3nthBW_:
Lfunc_begin171:
	movq	(%rdi), %rdx
	movq	8(%rdi), %rcx
	movq	%rcx, %rax
	subq	%rdx, %rax
	jb	LBB171_2
	shrq	$5, %rax
	movabsq	$-3689348814741910323, %r8
	imulq	%rax, %r8
	leaq	(%rsi,%rsi,4), %r9
	shlq	$5, %r9
	leaq	(%rdx,%r9), %r10
	xorl	%eax, %eax
	cmpq	%r8, %rsi
	leaq	160(%rdx,%r9), %rdx
	cmovbq	%rdx, %rcx
	cmovbq	%r10, %rax
	movq	%rcx, (%rdi)
	retq
LBB171_2:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	l_anon.d2ce196b1be0a17c88a81230f55c56e2.165(%rip), %rdi
	leaq	l_anon.d2ce196b1be0a17c88a81230f55c56e2.22(%rip), %rcx
	movl	$403, %esi
	xorl	%edx, %edx
	callq	__RNvNtCsjLnd7uqfVBb_4core9panicking18panic_nounwind_fmt
Lfunc_end171:

	.globl	__RNvXs2_NtCsgH5pGWrFjzB_12toyos_crypto4hashNtB5_6Sha256NtNtNtCsjLnd7uqfVBb_4core3ops4drop4Drop4drop
	.p2align	4
__RNvXs2_NtCsgH5pGWrFjzB_12toyos_crypto4hashNtB5_6Sha256NtNtNtCsjLnd7uqfVBb_4core3ops4drop4Drop4drop:
Lfunc_begin172:
	pushq	%rbp
	movq	%rsp, %rbp
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	%rcx, 8(%rdi)
	movq	%rax, (%rdi)
	movaps	%xmm0, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	%rcx, 24(%rdi)
	movq	%rax, 16(%rdi)
	movaps	%xmm0, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	%rcx, 40(%rdi)
	movq	%rax, 32(%rdi)
	movaps	%xmm0, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	%rcx, 56(%rdi)
	movq	%rax, 48(%rdi)
	movaps	%xmm0, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	%rcx, 72(%rdi)
	movq	%rax, 64(%rdi)
	movaps	%xmm0, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	%rcx, 88(%rdi)
	movq	%rax, 80(%rdi)
	popq	%rbp
	retq
Lfunc_end172:

	.globl	__RNvXs4_NtCsgH5pGWrFjzB_12toyos_crypto4hashNtB5_6Sha384NtNtCsjLnd7uqfVBb_4core7default7Default7default
	.p2align	4
__RNvXs4_NtCsgH5pGWrFjzB_12toyos_crypto4hashNtB5_6Sha384NtNtCsjLnd7uqfVBb_4core7default7Default7default:
Lfunc_begin173:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, %rax
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 112(%rdi)
	movaps	%xmm0, 96(%rdi)
	movaps	%xmm0, 80(%rdi)
	movaps	%xmm0, 64(%rdi)
	movaps	%xmm0, 48(%rdi)
	movaps	%xmm0, 32(%rdi)
	movaps	%xmm0, 16(%rdi)
