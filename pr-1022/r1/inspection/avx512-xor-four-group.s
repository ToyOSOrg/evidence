	decl	%esi
	jne	LBB163_19
	vpaddd	LCPI163_4(%rip), %zmm3, %zmm3
	vpaddd	%zmm0, %zmm4, %zmm0
	vpaddd	%zmm1, %zmm5, %zmm1
	vpaddd	%zmm2, %zmm6, %zmm2
	vpxor	(%rax), %xmm3, %xmm4
	vpxor	16(%rax), %xmm0, %xmm5
	vpxor	32(%rax), %xmm1, %xmm6
	vpxor	48(%rax), %xmm2, %xmm7
	vextracti64x4	$1, %zmm3, %ymm8
	vmovdqu	%xmm4, (%rax)
	vmovdqu	%xmm5, 16(%rax)
	vmovdqu	%xmm6, 32(%rax)
	vmovdqu	%xmm7, 48(%rax)
	vextracti128	$1, %ymm3, %xmm3
	vpxor	64(%rax), %xmm3, %xmm3
	vextracti128	$1, %ymm0, %xmm4
	vmovdqu	%xmm3, 64(%rax)
	vpxor	80(%rax), %xmm4, %xmm3
	vextracti128	$1, %ymm1, %xmm4
	vmovdqu	%xmm3, 80(%rax)
	vpxor	96(%rax), %xmm4, %xmm3
	vextracti128	$1, %ymm2, %xmm4
	vmovdqu	%xmm3, 96(%rax)
	vpxor	112(%rax), %xmm4, %xmm3
	vextracti64x4	$1, %zmm1, %ymm1
	vmovdqu	%xmm3, 112(%rax)
	vpxor	128(%rax), %xmm8, %xmm3
	vextracti32x4	$2, %zmm0, %xmm4
	vmovdqu	%xmm3, 128(%rax)
	vpxor	144(%rax), %xmm4, %xmm3
	vextracti32x4	$2, %zmm2, %xmm4
	vmovdqu	%xmm3, 144(%rax)
	vpxor	160(%rax), %xmm1, %xmm3
	vmovdqu	%xmm3, 160(%rax)
	vpxor	176(%rax), %xmm4, %xmm3
	vmovdqu	%xmm3, 176(%rax)
	vextracti128	$1, %ymm8, %xmm3
	vextracti32x4	$3, %zmm2, %xmm2
	vpxor	192(%rax), %xmm3, %xmm3
	vextracti32x4	$3, %zmm0, %xmm0
	vmovdqu	%xmm3, 192(%rax)
	vpxor	208(%rax), %xmm0, %xmm0
	vextracti128	$1, %ymm1, %xmm1
	vmovdqu	%xmm0, 208(%rax)
	vpxor	224(%rax), %xmm1, %xmm0
	vmovdqu	%xmm0, 224(%rax)
	vpxor	240(%rax), %xmm2, %xmm0
	vmovdqu	%xmm0, 240(%rax)
	testq	%r8, %r8
