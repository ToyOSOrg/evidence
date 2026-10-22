__RNvNtNtNtNtCsgH5pGWrFjzB_12toyos_crypto4arch6x86_646chacha6avx5126blocks:
Lfunc_begin164:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	(%rdx), %rax
	cmpq	$3, %rcx
	jae	LBB164_1
	movq	(%rdi), %rcx
	movq	8(%rdi), %rdx
	vmovdqu	(%rcx), %xmm0
	vinserti128	$1, (%rdx), %ymm0, %ymm0
	vmovdqu	16(%rcx), %xmm1
	vinserti128	$1, 16(%rdx), %ymm1, %ymm1
	vmovdqu	(%rsi), %xmm2
	vpinsrq	$1, %rax, %xmm2, %xmm2
	vpbroadcastq	8(%rsi), %ymm3
	vpblendd	$48, %ymm3, %ymm2, %ymm2
	vpbroadcastq	%rax, %ymm3
	vpblendd	$192, %ymm3, %ymm2, %ymm2
	vmovdqa	LCPI164_1(%rip), %ymm3
	movl	$10, %eax
	vmovdqa	%ymm0, %ymm4
	vmovdqa	%ymm1, %ymm5
	vmovdqa	%ymm2, %ymm6
	.p2align	4
LBB164_5:
	vpaddd	%ymm3, %ymm4, %ymm3
	vpxor	%ymm3, %ymm6, %ymm6
	vprold	$16, %ymm6, %ymm6
	vpaddd	%ymm5, %ymm6, %ymm5
	vpxor	%ymm4, %ymm5, %ymm4
	vprold	$12, %ymm4, %ymm4
	vpaddd	%ymm3, %ymm4, %ymm3
	vpxor	%ymm6, %ymm3, %ymm6
	vprold	$8, %ymm6, %ymm6
	vpaddd	%ymm5, %ymm6, %ymm5
	vpxor	%ymm4, %ymm5, %ymm4
	vpshufd	$57, %ymm4, %ymm4
	vprold	$7, %ymm4, %ymm4
	vpshufd	$78, %ymm5, %ymm5
	vpshufd	$147, %ymm6, %ymm6
	vpaddd	%ymm3, %ymm4, %ymm3
	vpxor	%ymm6, %ymm3, %ymm6
	vprold	$16, %ymm6, %ymm6
	vpaddd	%ymm5, %ymm6, %ymm5
	vpxor	%ymm4, %ymm5, %ymm4
	vprold	$12, %ymm4, %ymm4
	vpaddd	%ymm3, %ymm4, %ymm3
	vpxor	%ymm6, %ymm3, %ymm6
	vprold	$8, %ymm6, %ymm6
	vpaddd	%ymm5, %ymm6, %ymm5
	vpxor	%ymm4, %ymm5, %ymm4
	vpshufd	$147, %ymm4, %ymm4
	vprold	$7, %ymm4, %ymm4
	vpshufd	$78, %ymm5, %ymm5
	vpshufd	$57, %ymm6, %ymm6
	decq	%rax
	jne	LBB164_5
	vpaddd	LCPI164_1(%rip), %ymm3, %ymm3
	vpaddd	%ymm0, %ymm4, %ymm0
	vpaddd	%ymm1, %ymm5, %ymm1
	vpaddd	%ymm2, %ymm6, %ymm2
	vinserti128	$1, %xmm2, %ymm1, %ymm4
	vinserti128	$1, %xmm0, %ymm3, %ymm5
	vinserti64x4	$1, %ymm4, %zmm5, %zmm4
	vmovdqu64	%zmm4, (%r8)
	vinserti64x4	$1, %ymm2, %zmm1, %zmm1
	vinserti64x4	$1, %ymm0, %zmm3, %zmm0
	vshufi64x2	$221, %zmm1, %zmm0, %zmm0
	vmovdqu64	%zmm0, 64(%r8)
	popq	%rbp
	vzeroupper
	retq
LBB164_1:
	movq	(%rdi), %rcx
	movq	8(%rdi), %rdx
	vmovdqu	(%rcx), %xmm0
	vinserti32x4	$1, (%rdx), %zmm0, %zmm0
	movq	16(%rdi), %r9
	vinserti32x4	$2, (%r9), %zmm0, %zmm0
	vmovdqu	16(%rcx), %xmm1
	movq	24(%rdi), %rcx
	vinserti32x4	$3, (%rcx), %zmm0, %zmm0
	vinserti32x4	$1, 16(%rdx), %zmm1, %zmm1
	vinserti32x4	$2, 16(%r9), %zmm1, %zmm1
	vinserti32x4	$3, 16(%rcx), %zmm1, %zmm1
	vmovq	%rax, %xmm2
	vmovq	24(%rsi), %xmm3
	vpunpcklqdq	%xmm2, %xmm3, %xmm3
	vmovq	16(%rsi), %xmm4
	vpunpcklqdq	%xmm2, %xmm4, %xmm4
	vinserti128	$1, %xmm3, %ymm4, %ymm3
	vmovq	8(%rsi), %xmm4
	vpunpcklqdq	%xmm2, %xmm4, %xmm4
	vmovq	(%rsi), %xmm5
	vpunpcklqdq	%xmm2, %xmm5, %xmm2
	vinserti128	$1, %xmm4, %ymm2, %ymm2
	vinserti64x4	$1, %ymm3, %zmm2, %zmm2
	vmovdqa64	LCPI164_0(%rip), %zmm3
	movl	$10, %eax
	vmovdqa64	%zmm0, %zmm4
	vmovdqa64	%zmm1, %zmm5
	vmovdqa64	%zmm2, %zmm6
	.p2align	4
LBB164_2:
	vpaddd	%zmm3, %zmm4, %zmm3
	vpxord	%zmm3, %zmm6, %zmm6
	vprold	$16, %zmm6, %zmm6
	vpaddd	%zmm5, %zmm6, %zmm5
	vpxord	%zmm4, %zmm5, %zmm4
	vprold	$12, %zmm4, %zmm4
	vpaddd	%zmm3, %zmm4, %zmm3
	vpxord	%zmm6, %zmm3, %zmm6
	vprold	$8, %zmm6, %zmm6
	vpaddd	%zmm5, %zmm6, %zmm5
	vpxord	%zmm4, %zmm5, %zmm4
	vpshufd	$57, %zmm4, %zmm4
	vprold	$7, %zmm4, %zmm4
	vpshufd	$78, %zmm5, %zmm5
	vpshufd	$147, %zmm6, %zmm6
	vpaddd	%zmm3, %zmm4, %zmm3
	vpxord	%zmm6, %zmm3, %zmm6
	vprold	$16, %zmm6, %zmm6
	vpaddd	%zmm5, %zmm6, %zmm5
	vpxord	%zmm4, %zmm5, %zmm4
	vprold	$12, %zmm4, %zmm4
	vpaddd	%zmm3, %zmm4, %zmm3
	vpxord	%zmm6, %zmm3, %zmm6
	vprold	$8, %zmm6, %zmm6
	vpaddd	%zmm5, %zmm6, %zmm5
	vpxord	%zmm4, %zmm5, %zmm4
	vpshufd	$147, %zmm4, %zmm4
	vprold	$7, %zmm4, %zmm4
	vpshufd	$78, %zmm5, %zmm5
	vpshufd	$57, %zmm6, %zmm6
	decl	%eax
	jne	LBB164_2
	vpaddd	LCPI164_0(%rip), %zmm3, %zmm3
	vpaddd	%zmm0, %zmm4, %zmm0
	vpaddd	%zmm1, %zmm5, %zmm1
	vpaddd	%zmm2, %zmm6, %zmm2
	vextracti64x4	$1, %zmm3, %ymm4
	vinserti128	$1, %xmm2, %ymm1, %ymm5
	vinserti128	$1, %xmm0, %ymm3, %ymm6
	vinserti64x4	$1, %ymm5, %zmm6, %zmm5
	vmovdqu64	%zmm5, (%r8)
	vextracti128	$1, %ymm3, %xmm3
	vextracti128	$1, %ymm0, %xmm5
	vextracti128	$1, %ymm1, %xmm6
	vextracti128	$1, %ymm2, %xmm7
	vinserti128	$1, %xmm7, %ymm6, %ymm6
	vinserti128	$1, %xmm5, %ymm3, %ymm3
	vinserti64x4	$1, %ymm6, %zmm3, %zmm3
	vmovdqu64	%zmm3, 64(%r8)
	vextracti32x4	$2, %zmm0, %xmm3
	vextracti32x4	$2, %zmm1, %xmm5
	vextracti32x4	$2, %zmm2, %xmm6
	vinserti128	$1, %xmm6, %ymm5, %ymm5
	vinserti128	$1, %xmm3, %ymm4, %ymm3
	vinserti64x4	$1, %ymm5, %zmm3, %zmm3
	vmovdqu64	%zmm3, 128(%r8)
	vextracti128	$1, %ymm4, %xmm3
	vextracti32x4	$3, %zmm0, %xmm0
	vextracti32x4	$3, %zmm1, %xmm1
	vextracti32x4	$3, %zmm2, %xmm2
	vinserti128	$1, %xmm2, %ymm1, %ymm1
	vinserti128	$1, %xmm0, %ymm3, %ymm0
	vinserti64x4	$1, %ymm1, %zmm0, %zmm0
	vmovdqu64	%zmm0, 192(%r8)
	popq	%rbp
	vzeroupper
	retq
