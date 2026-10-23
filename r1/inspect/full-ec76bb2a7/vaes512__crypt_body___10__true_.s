
stage/probe-full-ec76bb2a7:	file format elf64-x86-64

Disassembly of section .text:

000000000030e580 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>>:
  30e580:      	push	rbp
  30e581:      	mov	rbp, rsp
  30e584:      	push	r14
  30e586:      	push	rbx
  30e587:      	and	rsp, -0x40
  30e58b:      	sub	rsp, 0x1c0
  30e592:      	vxorps	xmm0, xmm0, xmm0
  30e596:      	vmovaps	xmmword ptr [rsp], xmm0
  30e59b:      	mov	rax, rsp
  30e59e:      	mov	r10, rdx
  30e5a1:      	sub	r10, rax
  30e5a4:      	sub	rax, rdx
  30e5a7:      	cmovb	rax, r10
  30e5ab:      	cmp	rax, 0xb
  30e5af:      	jbe	0x30eb21 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>+0x5a1>
  30e5b5:      	mov	eax, dword ptr [rdx + 0x8]
  30e5b8:      	mov	dword ptr [rsp + 0x8], eax
  30e5bc:      	mov	rax, qword ptr [rdx]
  30e5bf:      	mov	qword ptr [rsp], rax
  30e5c3:      	vmovdqu	xmm0, xmmword ptr [rcx]
  30e5c7:      	mov	r10, r9
  30e5ca:      	shr	r10, 0x8
  30e5ce:      	vpshufb	xmm20, xmm0, xmmword ptr [rip - 0x262318] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  30e5d8:      	movabs	rdx, 0x5555555555555556
  30e5e2:      	mov	rax, r10
  30e5e5:      	mul	rdx
  30e5e8:      	lea	rax, [rdx + 2*rdx]
  30e5ec:      	mov	rdx, r10
  30e5ef:      	sub	rdx, rax
  30e5f2:      	mov	eax, 0x3
  30e5f7:      	cmovne	rax, rdx
  30e5fb:      	test	r10, r10
  30e5fe:      	je	0x30eab0 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>+0x530>
  30e604:      	vbroadcasti32x4	zmm0, xmmword ptr [rsp] # zmm0 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e60b:      	vbroadcasti32x4	zmm1, xmmword ptr [rdi] # zmm1 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e611:      	vbroadcasti32x4	zmm2, xmmword ptr [rdi + 0xa0] # zmm2 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e618:      	vmovdqa64	zmmword ptr [rsp + 0x140], zmm0
  30e620:      	vpord	zmm22, zmm0, zmmword ptr [rip - 0x1ebd6a] # 0x1228c0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd2b8>
  30e62a:      	vbroadcasti32x4	zmm3, xmmword ptr [rdi + 0x10] # zmm3 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e631:      	vbroadcasti32x4	zmm4, xmmword ptr [rdi + 0x20] # zmm4 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e638:      	vbroadcasti32x4	zmm5, xmmword ptr [rdi + 0x30] # zmm5 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e63f:      	vbroadcasti32x4	zmm6, xmmword ptr [rdi + 0x40] # zmm6 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e646:      	vbroadcasti32x4	zmm7, xmmword ptr [rdi + 0x50] # zmm7 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e64d:      	vbroadcasti32x4	zmm8, xmmword ptr [rdi + 0x60] # zmm8 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e654:      	vbroadcasti32x4	zmm9, xmmword ptr [rdi + 0x70] # zmm9 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e65b:      	vbroadcasti32x4	zmm10, xmmword ptr [rdi + 0x80] # zmm10 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e662:      	vbroadcasti32x4	zmm11, xmmword ptr [rdi + 0x90] # zmm11 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e669:      	shl	r10, 0x8
  30e66d:      	vpxord	xmm16, xmm16, xmm16
  30e673:      	mov	edx, 0x12
  30e678:      	xor	edi, edi
  30e67a:      	vpxord	xmm25, xmm25, xmm25
  30e680:      	vpxord	xmm23, xmm23, xmm23
  30e686:      	jmp	0x30e7e8 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>+0x268>
  30e68b:      	nop	dword ptr [rax + rax]
  30e690:      	vpxord	zmm0, zmm22, zmm1
  30e696:      	vpxord	zmm13, zmm30, zmm1
  30e69c:      	vpxord	zmm14, zmm31, zmm1
  30e6a2:      	vpxord	zmm12, zmm12, zmm1
  30e6a8:      	vaesenc	zmm0, zmm0, zmm3
  30e6ae:      	vaesenc	zmm13, zmm13, zmm3
  30e6b4:      	vaesenc	zmm14, zmm14, zmm3
  30e6ba:      	vaesenc	zmm12, zmm12, zmm3
  30e6c0:      	vaesenc	zmm0, zmm0, zmm4
  30e6c6:      	vaesenc	zmm13, zmm13, zmm4
  30e6cc:      	vaesenc	zmm14, zmm14, zmm4
  30e6d2:      	vaesenc	zmm12, zmm12, zmm4
  30e6d8:      	vaesenc	zmm0, zmm0, zmm5
  30e6de:      	vaesenc	zmm13, zmm13, zmm5
  30e6e4:      	vaesenc	zmm14, zmm14, zmm5
  30e6ea:      	vaesenc	zmm12, zmm12, zmm5
  30e6f0:      	vaesenc	zmm0, zmm0, zmm6
  30e6f6:      	vaesenc	zmm13, zmm13, zmm6
  30e6fc:      	vaesenc	zmm14, zmm14, zmm6
  30e702:      	vaesenc	zmm12, zmm12, zmm6
  30e708:      	vaesenc	zmm0, zmm0, zmm7
  30e70e:      	vaesenc	zmm13, zmm13, zmm7
  30e714:      	vaesenc	zmm14, zmm14, zmm7
  30e71a:      	vaesenc	zmm12, zmm12, zmm7
  30e720:      	vaesenc	zmm0, zmm0, zmm8
  30e726:      	vaesenc	zmm13, zmm13, zmm8
  30e72c:      	vaesenc	zmm14, zmm14, zmm8
  30e732:      	vaesenc	zmm12, zmm12, zmm8
  30e738:      	vaesenc	zmm0, zmm0, zmm9
  30e73e:      	vaesenc	zmm13, zmm13, zmm9
  30e744:      	vaesenc	zmm14, zmm14, zmm9
  30e74a:      	vaesenc	zmm12, zmm12, zmm9
  30e750:      	vaesenc	zmm0, zmm0, zmm10
  30e756:      	vaesenc	zmm13, zmm13, zmm10
  30e75c:      	vaesenc	zmm14, zmm14, zmm10
  30e762:      	vaesenc	zmm12, zmm12, zmm10
  30e768:      	vaesenc	zmm0, zmm0, zmm11
  30e76e:      	vaesenc	zmm13, zmm13, zmm11
  30e774:      	vaesenc	zmm14, zmm14, zmm11
  30e77a:      	vaesenc	zmm12, zmm12, zmm11
  30e780:      	vaesenclast	zmm0, zmm0, zmm2
  30e786:      	vpxorq	zmm0, zmm0, zmm29
  30e78c:      	vmovdqu64	zmmword ptr [r8 + rdi], zmm0
  30e793:      	vaesenclast	zmm0, zmm13, zmm2
  30e799:      	vpxorq	zmm0, zmm0, zmm28
  30e79f:      	vmovdqu64	zmmword ptr [r8 + rdi + 0x40], zmm0
  30e7a7:      	vaesenclast	zmm0, zmm14, zmm2
  30e7ad:      	vpxorq	zmm0, zmm0, zmm27
  30e7b3:      	vmovdqu64	zmmword ptr [r8 + rdi + 0x80], zmm0
  30e7bb:      	vaesenclast	zmm0, zmm12, zmm2
  30e7c1:      	vpxorq	zmm0, zmm0, zmm26
  30e7c7:      	vmovdqu64	zmmword ptr [r8 + rdi + 0xc0], zmm0
  30e7cf:      	add	edx, 0x10
  30e7d2:      	add	rdi, 0x100
  30e7d9:      	vmovdqa64	zmm22, zmm24
  30e7df:      	cmp	r10, rdi
  30e7e2:      	je	0x30eac2 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>+0x542>
  30e7e8:      	lea	r11d, [rdx - 0x10]
  30e7ec:      	and	r11d, 0xfe
  30e7f3:      	cmp	r11d, 0xed
  30e7fa:      	jae	0x30e830 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>+0x2b0>
  30e7fc:      	vpaddd	zmm24, zmm22, zmmword ptr [rip - 0x1ebe86] # 0x122980 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd378>
  30e806:      	vpaddd	zmm30, zmm22, zmmword ptr [rip - 0x1ebe50] # 0x1229c0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd3b8>
  30e810:      	vpaddd	zmm31, zmm22, zmmword ptr [rip - 0x1ebe1a] # 0x122a00 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd3f8>
  30e81a:      	vpaddd	zmm12, zmm22, zmmword ptr [rip - 0x1ebde4] # 0x122a40 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd438>
  30e824:      	jmp	0x30e8b8 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>+0x338>
  30e829:      	nop	dword ptr [rax]
  30e830:      	vpbroadcastd	zmm12, edx
  30e836:      	vmovdqa64	zmm13, zmmword ptr [rip - 0x1ebf40] # 0x122900 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd2f8>
  30e840:      	vpaddd	zmm12, zmm12, zmm13
  30e846:      	vmovdqa64	zmm14, zmmword ptr [rip - 0x1ebf10] # 0x122940 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd338>
  30e850:      	vpshufb	zmm12, zmm12, zmm14
  30e856:      	vmovdqa64	zmm0, zmmword ptr [rsp + 0x140]
  30e85e:      	vpord	zmm24, zmm0, zmm12
  30e864:      	lea	r11d, [rdx - 0xc]
  30e868:      	vpbroadcastd	zmm12, r11d
  30e86e:      	vpaddd	zmm12, zmm12, zmm13
  30e874:      	vpshufb	zmm12, zmm12, zmm14
  30e87a:      	vpord	zmm30, zmm0, zmm12
  30e880:      	lea	r11d, [rdx - 0x8]
  30e884:      	vpbroadcastd	zmm12, r11d
  30e88a:      	vpaddd	zmm12, zmm12, zmm13
  30e890:      	vpshufb	zmm12, zmm12, zmm14
  30e896:      	vpord	zmm31, zmm0, zmm12
  30e89c:      	lea	r11d, [rdx - 0x4]
  30e8a0:      	vpbroadcastd	zmm12, r11d
  30e8a6:      	vpaddd	zmm12, zmm12, zmm13
  30e8ac:      	vpshufb	zmm12, zmm12, zmm14
  30e8b2:      	vpord	zmm12, zmm0, zmm12
  30e8b8:      	mov	r11, rax
  30e8bb:      	shr	r11, 0x3c
  30e8bf:      	jne	0x30eb6a <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>+0x5ea>
  30e8c5:      	vmovdqu64	zmm29, zmmword ptr [r8 + rdi]
  30e8cc:      	vmovdqu64	zmm28, zmmword ptr [r8 + rdi + 0x40]
  30e8d4:      	vmovdqu64	zmm27, zmmword ptr [r8 + rdi + 0x80]
  30e8dc:      	vmovdqu64	zmm26, zmmword ptr [r8 + rdi + 0xc0]
  30e8e4:      	vmovdqa64	zmm0, zmmword ptr [rip - 0x1ebe6e] # 0x122a80 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd478>
  30e8ee:      	vpshufb	zmm13, zmm26, zmm0
  30e8f4:      	vpshufb	zmm14, zmm27, zmm0
  30e8fa:      	vpshufb	zmm15, zmm28, zmm0
  30e900:      	vpshufb	zmm17, zmm29, zmm0
  30e906:      	vpxorq	zmm17, zmm20, zmm17
  30e90c:      	mov	r11d, eax
  30e90f:      	shl	r11d, 0x4
  30e913:      	mov	ebx, 0x30
  30e918:      	sub	ebx, r11d
  30e91b:      	mov	r14d, 0x34
  30e921:      	sub	r14d, r11d
  30e924:      	shr	ebx, 0x2
  30e927:      	shl	rbx, 0x6
  30e92b:      	vmovdqu64	zmm20, zmmword ptr [rsi + rbx]
  30e932:      	shr	r14d, 0x2
  30e936:      	shl	r14, 0x6
  30e93a:      	vmovdqu64	zmm18, zmmword ptr [rsi + r14]
  30e941:      	vpclmulqdq	zmm19, zmm17, zmm20, 0x0
  30e948:      	vpclmulqdq	zmm0, zmm15, zmm18, 0x0
  30e94f:      	vmovdqa64	zmm21, zmm16
  30e955:      	vpternlogq	zmm21, zmm19, zmm0, 0x96 # zmm21 = zmm21 ^ zmm19 ^ zmm0
  30e95c:      	vpclmulqdq	zmm0, zmm17, zmm20, 0x11
  30e963:      	vpclmulqdq	zmm16, zmm15, zmm18, 0x11
  30e96a:      	vmovdqa64	zmm19, zmm25
  30e970:      	vpternlogq	zmm19, zmm0, zmm16, 0x96 # zmm19 = zmm19 ^ zmm0 ^ zmm16
  30e977:      	vpclmulqdq	zmm0, zmm17, zmm20, 0x1
  30e97e:      	vpclmulqdq	zmm16, zmm17, zmm20, 0x10
  30e985:      	vpternlogq	zmm23, zmm0, zmm16, 0x96 # zmm23 = zmm23 ^ zmm0 ^ zmm16
  30e98c:      	vpclmulqdq	zmm0, zmm15, zmm18, 0x1
  30e993:      	vpclmulqdq	zmm15, zmm15, zmm18, 0x10
  30e99a:      	vpternlogq	zmm15, zmm23, zmm0, 0x96 # zmm15 = zmm15 ^ zmm23 ^ zmm0
  30e9a1:      	mov	ebx, 0x38
  30e9a6:      	sub	ebx, r11d
  30e9a9:      	shr	ebx, 0x2
  30e9ac:      	shl	rbx, 0x6
  30e9b0:      	vmovdqu64	zmm0, zmmword ptr [rsi + rbx]
  30e9b7:      	mov	ebx, 0x3c
  30e9bc:      	sub	ebx, r11d
  30e9bf:      	shr	ebx, 0x2
  30e9c2:      	shl	rbx, 0x6
  30e9c6:      	vmovdqu64	zmm17, zmmword ptr [rsi + rbx]
  30e9cd:      	vpclmulqdq	zmm18, zmm14, zmm0, 0x0
  30e9d4:      	vpclmulqdq	zmm16, zmm13, zmm17, 0x0
  30e9db:      	vpternlogq	zmm16, zmm21, zmm18, 0x96 # zmm16 = zmm16 ^ zmm21 ^ zmm18
  30e9e2:      	vpclmulqdq	zmm18, zmm14, zmm0, 0x11
  30e9e9:      	vpclmulqdq	zmm25, zmm13, zmm17, 0x11
  30e9f0:      	vpternlogq	zmm25, zmm19, zmm18, 0x96 # zmm25 = zmm25 ^ zmm19 ^ zmm18
  30e9f7:      	vpclmulqdq	zmm18, zmm14, zmm0, 0x1
  30e9fe:      	vpclmulqdq	zmm0, zmm14, zmm0, 0x10
  30ea05:      	vpternlogq	zmm0, zmm15, zmm18, 0x96 # zmm0 = zmm0 ^ zmm15 ^ zmm18
  30ea0c:      	vpclmulqdq	zmm14, zmm13, zmm17, 0x1
  30ea13:      	vpclmulqdq	zmm23, zmm13, zmm17, 0x10
  30ea1a:      	vpternlogq	zmm23, zmm0, zmm14, 0x96 # zmm23 = zmm23 ^ zmm0 ^ zmm14
  30ea21:      	vpxord	xmm20, xmm20, xmm20
  30ea27:      	dec	rax
  30ea2a:      	jne	0x30e690 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>+0x110>
  30ea30:      	vpslldq	zmm0, zmm23, 0x8        # zmm0 = zero,zero,zero,zero,zero,zero,zero,zero,zmm23[0,1,2,3,4,5,6,7],zero,zero,zero,zero,zero,zero,zero,zero,zmm23[16,17,18,19,20,21,22,23],zero,zero,zero,zero,zero,zero,zero,zero,zmm23[32,33,34,35,36,37,38,39],zero,zero,zero,zero,zero,zero,zero,zero,zmm23[48,49,50,51,52,53,54,55]
  30ea37:      	vpxord	zmm0, zmm0, zmm16
  30ea3d:      	vpsrldq	zmm13, zmm23, 0x8       # zmm13 = zmm23[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero,zmm23[24,25,26,27,28,29,30,31],zero,zero,zero,zero,zero,zero,zero,zero,zmm23[40,41,42,43,44,45,46,47],zero,zero,zero,zero,zero,zero,zero,zero,zmm23[56,57,58,59,60,61,62,63],zero,zero,zero,zero,zero,zero,zero,zero
  30ea44:      	vpxorq	zmm13, zmm25, zmm13
  30ea4a:      	vpshufd	zmm14, zmm0, 0x4e       # zmm14 = zmm0[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30ea51:      	vpbroadcastq	zmm15, qword ptr [rip - 0x263a2b] # 0xab030 <sdallocx+0xab030>
  30ea5b:      	vpclmulqdq	zmm0, zmm0, zmm15, 0x0
  30ea62:      	vpxorq	zmm0, zmm0, zmm14
  30ea68:      	vpshufd	zmm14, zmm0, 0x4e       # zmm14 = zmm0[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30ea6f:      	vpclmulqdq	zmm0, zmm0, zmm15, 0x0
  30ea76:      	vpternlogq	zmm0, zmm13, zmm14, 0x96 # zmm0 = zmm0 ^ zmm13 ^ zmm14
  30ea7d:      	vextracti64x4	ymm13, zmm0, 0x1
  30ea84:      	vpxor	ymm0, ymm13, ymm0
  30ea88:      	vextracti128	xmm13, ymm0, 0x1
  30ea8e:      	vpxorq	xmm20, xmm13, xmm0
  30ea94:      	vpxord	xmm23, xmm23, xmm23
  30ea9a:      	mov	eax, 0x3
  30ea9f:      	vpxord	xmm25, xmm25, xmm25
  30eaa5:      	vpxord	xmm16, xmm16, xmm16
  30eaab:      	jmp	0x30e690 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>+0x110>
  30eab0:      	vpxord	xmm23, xmm23, xmm23
  30eab6:      	vpxord	xmm25, xmm25, xmm25
  30eabc:      	vpxord	xmm16, xmm16, xmm16
  30eac2:      	vmovdqa64	zmmword ptr [rsp], zmm16
  30eac9:      	vmovdqa64	zmmword ptr [rsp + 0x40], zmm25
  30ead1:      	vmovdqa64	zmmword ptr [rsp + 0x80], zmm23
  30ead9:      	vmovdqa64	zmmword ptr [rsp + 0xc0], zmm20
  30eae1:      	mov	qword ptr [rsp + 0x100], rax
  30eae9:      	mov	qword ptr [rsp + 0x108], rsi
  30eaf1:      	cmp	rax, 0x3
  30eaf5:      	jne	0x30eb3c <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>+0x5bc>
  30eaf7:      	vpshufb	xmm0, xmm20, xmmword ptr [rip - 0x262841] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  30eb01:      	vmovdqu	xmmword ptr [rcx], xmm0
  30eb05:      	movabs	rax, 0x7fffffffffffff00
  30eb0f:      	and	r9, rax
  30eb12:      	mov	rax, r9
  30eb15:      	lea	rsp, [rbp - 0x10]
  30eb19:      	pop	rbx
  30eb1a:      	pop	r14
  30eb1c:      	pop	rbp
  30eb1d:      	vzeroupper
  30eb20:      	ret
  30eb21:      	lea	rdi, [rip - 0x202785]   # 0x10c3a3 <anon.8182237a801038de36885de64d2c176c.5.llvm.10465402473772549265>
  30eb28:      	lea	rcx, [rip + 0x4f6541]   # 0x805070 <anon.8182237a801038de36885de64d2c176c.1.llvm.10465402473772549265>
  30eb2f:      	mov	esi, 0x237
  30eb34:      	xor	edx, edx
  30eb36:      	call	qword ptr [rip + 0x569a04] # 0x878540 <sdallocx+0x878540>
  30eb3c:      	lea	rsi, [rsp + 0x100]
  30eb44:      	lea	rdx, [rip - 0x263a2b]   # 0xab120 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.13.llvm.14024894901458550281+0x40>
  30eb4b:      	lea	rcx, [rip - 0x1ebc92]   # 0x122ec0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd8b8>
  30eb52:      	lea	r9, [rip + 0x4f6d97]    # 0x8058f0 <anon.f91301331f2ac3e3eb2ad538a87aa794.7.llvm.3388403078394314149+0x30>
  30eb59:      	mov	r8d, 0x29
  30eb5f:      	xor	edi, edi
  30eb61:      	vzeroupper
  30eb64:      	call	qword ptr [rip + 0x568cbe] # 0x877828 <sdallocx+0x877828>
  30eb6a:      	lea	rdi, [rip + 0x4f6d67]   # 0x8058d8 <anon.f91301331f2ac3e3eb2ad538a87aa794.7.llvm.3388403078394314149+0x18>
  30eb71:      	vzeroupper
  30eb74:      	call	qword ptr [rip + 0x5699ce] # 0x878548 <sdallocx+0x878548>
  30eb7a:      	int3
  30eb7b:      	int3
  30eb7c:      	int3
  30eb7d:      	int3
  30eb7e:      	int3
  30eb7f:      	int3
