
stage/probe-full-7dcf12a5a:	file format elf64-x86-64

Disassembly of section .text:

000000000030f580 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>>:
  30f580:      	push	rbp
  30f581:      	mov	rbp, rsp
  30f584:      	push	r15
  30f586:      	push	r14
  30f588:      	push	r12
  30f58a:      	push	rbx
  30f58b:      	and	rsp, -0x40
  30f58f:      	sub	rsp, 0x180
  30f596:      	vxorps	xmm0, xmm0, xmm0
  30f59a:      	vmovaps	xmmword ptr [rsp], xmm0
  30f59f:      	mov	rax, rsp
  30f5a2:      	mov	r10, rdx
  30f5a5:      	sub	r10, rax
  30f5a8:      	sub	rax, rdx
  30f5ab:      	cmovb	rax, r10
  30f5af:      	cmp	rax, 0xb
  30f5b3:      	jbe	0x30fbb3 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>+0x633>
  30f5b9:      	mov	eax, dword ptr [rdx + 0x8]
  30f5bc:      	mov	dword ptr [rsp + 0x8], eax
  30f5c0:      	mov	rax, qword ptr [rdx]
  30f5c3:      	mov	qword ptr [rsp], rax
  30f5c7:      	vmovdqu	xmm0, xmmword ptr [rcx]
  30f5cb:      	mov	r10, r9
  30f5ce:      	shr	r10, 0x8
  30f5d2:      	vpshufb	xmm9, xmm0, xmmword ptr [rip - 0x26331b] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  30f5db:      	movabs	rdx, 0x5555555555555556
  30f5e5:      	mov	rax, r10
  30f5e8:      	mul	rdx
  30f5eb:      	lea	rax, [rdx + 2*rdx]
  30f5ef:      	mov	rdx, r10
  30f5f2:      	sub	rdx, rax
  30f5f5:      	mov	eax, 0x3
  30f5fa:      	cmovne	rax, rdx
  30f5fe:      	test	r10, r10
  30f601:      	je	0x30fb42 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>+0x5c2>
  30f607:      	vbroadcasti32x4	zmm0, xmmword ptr [rsp] # zmm0 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f60e:      	vpord	zmm14, zmm0, zmmword ptr [rip - 0x1ec958] # 0x122cc0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd6b8>
  30f618:      	shl	r10, 0x8
  30f61c:      	vpxor	xmm10, xmm10, xmm10
  30f621:      	mov	edx, 0x12
  30f626:      	xor	r11d, r11d
  30f629:      	mov	rbx, rsp
  30f62c:      	vmovdqa64	zmm1, zmmword ptr [rip - 0x1ec8b6] # 0x122d80 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd778>
  30f636:      	vmovdqa64	zmm2, zmmword ptr [rip - 0x1ec880] # 0x122dc0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd7b8>
  30f640:      	vmovdqa64	zmm3, zmmword ptr [rip - 0x1ec84a] # 0x122e00 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd7f8>
  30f64a:      	vmovdqa64	zmm4, zmmword ptr [rip - 0x1ec814] # 0x122e40 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd838>
  30f654:      	vmovdqa64	zmm5, zmmword ptr [rip - 0x1ec7de] # 0x122e80 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd878>
  30f65e:      	vpbroadcastq	zmm6, qword ptr [rip - 0x264638] # 0xab030 <sdallocx+0xab030>
  30f668:      	vmovdqa64	zmm7, zmmword ptr [rip - 0x1ec972] # 0x122d00 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd6f8>
  30f672:      	vmovdqa64	zmm8, zmmword ptr [rip - 0x1ec93c] # 0x122d40 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd738>
  30f67c:      	vpxor	xmm13, xmm13, xmm13
  30f681:      	vpxor	xmm11, xmm11, xmm11
  30f686:      	jmp	0x30f8b4 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>+0x334>
  30f68b:      	nop	dword ptr [rax + rax]
  30f690:      	mov	r14, qword ptr [rsp]
  30f694:      	vbroadcasti32x4	zmm22, xmmword ptr [r14] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f69a:      	vpxord	zmm14, zmm22, zmm14
  30f6a0:      	vpxord	zmm19, zmm22, zmm19
  30f6a6:      	vpxord	zmm20, zmm22, zmm20
  30f6ac:      	vpxord	zmm21, zmm22, zmm21
  30f6b2:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x10] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f6b9:      	vaesenc	zmm14, zmm14, zmm22
  30f6bf:      	vaesenc	zmm19, zmm19, zmm22
  30f6c5:      	vaesenc	zmm20, zmm20, zmm22
  30f6cb:      	vaesenc	zmm21, zmm21, zmm22
  30f6d1:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x20] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f6d8:      	vaesenc	zmm14, zmm14, zmm22
  30f6de:      	vaesenc	zmm19, zmm19, zmm22
  30f6e4:      	vaesenc	zmm20, zmm20, zmm22
  30f6ea:      	vaesenc	zmm21, zmm21, zmm22
  30f6f0:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x30] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f6f7:      	vaesenc	zmm14, zmm14, zmm22
  30f6fd:      	vaesenc	zmm19, zmm19, zmm22
  30f703:      	vaesenc	zmm20, zmm20, zmm22
  30f709:      	vaesenc	zmm21, zmm21, zmm22
  30f70f:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x40] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f716:      	vaesenc	zmm14, zmm14, zmm22
  30f71c:      	vaesenc	zmm19, zmm19, zmm22
  30f722:      	vaesenc	zmm20, zmm20, zmm22
  30f728:      	vaesenc	zmm21, zmm21, zmm22
  30f72e:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x50] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f735:      	vaesenc	zmm14, zmm14, zmm22
  30f73b:      	vaesenc	zmm19, zmm19, zmm22
  30f741:      	vaesenc	zmm20, zmm20, zmm22
  30f747:      	vaesenc	zmm21, zmm21, zmm22
  30f74d:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x60] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f754:      	vaesenc	zmm14, zmm14, zmm22
  30f75a:      	vaesenc	zmm19, zmm19, zmm22
  30f760:      	vaesenc	zmm20, zmm20, zmm22
  30f766:      	vaesenc	zmm21, zmm21, zmm22
  30f76c:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x70] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f773:      	vaesenc	zmm14, zmm14, zmm22
  30f779:      	vaesenc	zmm19, zmm19, zmm22
  30f77f:      	vaesenc	zmm20, zmm20, zmm22
  30f785:      	vaesenc	zmm21, zmm21, zmm22
  30f78b:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x80] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f792:      	vaesenc	zmm14, zmm14, zmm22
  30f798:      	vaesenc	zmm19, zmm19, zmm22
  30f79e:      	vaesenc	zmm20, zmm20, zmm22
  30f7a4:      	vaesenc	zmm21, zmm21, zmm22
  30f7aa:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x90] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f7b1:      	vaesenc	zmm14, zmm14, zmm22
  30f7b7:      	vaesenc	zmm19, zmm19, zmm22
  30f7bd:      	vaesenc	zmm20, zmm20, zmm22
  30f7c3:      	vaesenc	zmm21, zmm21, zmm22
  30f7c9:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0xa0] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f7d0:      	vaesenc	zmm14, zmm14, zmm22
  30f7d6:      	vaesenc	zmm19, zmm19, zmm22
  30f7dc:      	vaesenc	zmm20, zmm20, zmm22
  30f7e2:      	vaesenc	zmm21, zmm21, zmm22
  30f7e8:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0xb0] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f7ef:      	vaesenc	zmm14, zmm14, zmm22
  30f7f5:      	vaesenc	zmm19, zmm19, zmm22
  30f7fb:      	vaesenc	zmm20, zmm20, zmm22
  30f801:      	vaesenc	zmm21, zmm21, zmm22
  30f807:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0xc0] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f80e:      	vaesenc	zmm14, zmm14, zmm22
  30f814:      	vaesenc	zmm19, zmm19, zmm22
  30f81a:      	vaesenc	zmm20, zmm20, zmm22
  30f820:      	vaesenc	zmm21, zmm21, zmm22
  30f826:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0xd0] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f82d:      	vaesenc	zmm14, zmm14, zmm22
  30f833:      	vaesenc	zmm19, zmm19, zmm22
  30f839:      	vaesenc	zmm20, zmm20, zmm22
  30f83f:      	vaesenc	zmm21, zmm21, zmm22
  30f845:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0xe0] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f84c:      	vaesenclast	zmm14, zmm14, zmm22
  30f852:      	vpxorq	zmm14, zmm14, zmm18
  30f858:      	vmovdqu64	zmmword ptr [r8 + r11], zmm14
  30f85f:      	vaesenclast	zmm14, zmm19, zmm22
  30f865:      	vpxorq	zmm14, zmm14, zmm17
  30f86b:      	vmovdqu64	zmmword ptr [r8 + r11 + 0x40], zmm14
  30f873:      	vaesenclast	zmm14, zmm20, zmm22
  30f879:      	vpxorq	zmm14, zmm14, zmm16
  30f87f:      	vmovdqu64	zmmword ptr [r8 + r11 + 0x80], zmm14
  30f887:      	vaesenclast	zmm14, zmm21, zmm22
  30f88d:      	vpxorq	zmm14, zmm14, zmm15
  30f893:      	vmovdqu64	zmmword ptr [r8 + r11 + 0xc0], zmm14
  30f89b:      	add	edx, 0x10
  30f89e:      	add	r11, 0x100
  30f8a5:      	vmovdqa64	zmm14, zmm12
  30f8ab:      	cmp	r10, r11
  30f8ae:      	je	0x30fb51 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>+0x5d1>
  30f8b4:      	lea	r14d, [rdx - 0x10]
  30f8b8:      	mov	qword ptr [rsp], rdi
  30f8bc:      	and	r14d, 0xfe
  30f8c3:      	cmp	r14d, 0xed
  30f8ca:      	jae	0x30f8f0 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>+0x370>
  30f8cc:      	vpaddd	zmm12, zmm14, zmm1
  30f8d2:      	vpaddd	zmm19, zmm14, zmm2
  30f8d8:      	vpaddd	zmm20, zmm14, zmm3
  30f8de:      	vpaddd	zmm21, zmm14, zmm4
  30f8e4:      	jmp	0x30f95c <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>+0x3dc>
  30f8e6:      	nop	word ptr cs:[rax + rax]
  30f8f0:      	vpbroadcastd	zmm12, edx
  30f8f6:      	vpaddd	zmm12, zmm12, zmm7
  30f8fc:      	vpshufb	zmm12, zmm12, zmm8
  30f902:      	vpord	zmm12, zmm0, zmm12
  30f908:      	lea	r14d, [rdx - 0xc]
  30f90c:      	vpbroadcastd	zmm15, r14d
  30f912:      	vpaddd	zmm15, zmm15, zmm7
  30f918:      	vpshufb	zmm15, zmm15, zmm8
  30f91e:      	vpord	zmm19, zmm0, zmm15
  30f924:      	lea	r14d, [rdx - 0x8]
  30f928:      	vpbroadcastd	zmm15, r14d
  30f92e:      	vpaddd	zmm15, zmm15, zmm7
  30f934:      	vpshufb	zmm15, zmm15, zmm8
  30f93a:      	vpord	zmm20, zmm0, zmm15
  30f940:      	lea	r14d, [rdx - 0x4]
  30f944:      	vpbroadcastd	zmm15, r14d
  30f94a:      	vpaddd	zmm15, zmm15, zmm7
  30f950:      	vpshufb	zmm15, zmm15, zmm8
  30f956:      	vpord	zmm21, zmm0, zmm15
  30f95c:      	mov	r14, rax
  30f95f:      	shr	r14, 0x3c
  30f963:      	jne	0x30fbfc <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>+0x67c>
  30f969:      	vmovdqu64	zmm18, zmmword ptr [r8 + r11]
  30f970:      	vmovdqu64	zmm17, zmmword ptr [r8 + r11 + 0x40]
  30f978:      	vmovdqu64	zmm16, zmmword ptr [r8 + r11 + 0x80]
  30f980:      	vmovdqu64	zmm15, zmmword ptr [r8 + r11 + 0xc0]
  30f988:      	vpshufb	zmm22, zmm15, zmm5
  30f98e:      	vpshufb	zmm23, zmm16, zmm5
  30f994:      	vpshufb	zmm24, zmm17, zmm5
  30f99a:      	vpshufb	zmm25, zmm18, zmm5
  30f9a0:      	vpxorq	zmm9, zmm9, zmm25
  30f9a6:      	mov	r14d, eax
  30f9a9:      	shl	r14d, 0x4
  30f9ad:      	mov	r15d, 0x30
  30f9b3:      	sub	r15d, r14d
  30f9b6:      	mov	r12d, 0x34
  30f9bc:      	sub	r12d, r14d
  30f9bf:      	shr	r15d, 0x2
  30f9c3:      	shl	r15, 0x6
  30f9c7:      	vmovdqu64	zmm25, zmmword ptr [rsi + r15]
  30f9ce:      	shr	r12d, 0x2
  30f9d2:      	shl	r12, 0x6
  30f9d6:      	vmovdqu64	zmm26, zmmword ptr [rsi + r12]
  30f9dd:      	vpclmulqdq	zmm27, zmm9, zmm25, 0x0
  30f9e4:      	vpclmulqdq	zmm28, zmm24, zmm26, 0x0
  30f9eb:      	vmovdqa64	zmm29, zmm10
  30f9f1:      	vpternlogq	zmm29, zmm27, zmm28, 0x96 # zmm29 = zmm29 ^ zmm27 ^ zmm28
  30f9f8:      	vpclmulqdq	zmm10, zmm9, zmm25, 0x11
  30f9ff:      	vpclmulqdq	zmm27, zmm24, zmm26, 0x11
  30fa06:      	vmovdqa64	zmm28, zmm13
  30fa0c:      	vpternlogq	zmm28, zmm10, zmm27, 0x96 # zmm28 = zmm28 ^ zmm10 ^ zmm27
  30fa13:      	vpclmulqdq	zmm10, zmm9, zmm25, 0x1
  30fa1a:      	vpclmulqdq	zmm9, zmm9, zmm25, 0x10
  30fa21:      	vpternlogq	zmm11, zmm10, zmm9, 0x96 # zmm11 = zmm11 ^ zmm10 ^ zmm9
  30fa28:      	vpclmulqdq	zmm9, zmm24, zmm26, 0x1
  30fa2f:      	vpclmulqdq	zmm24, zmm24, zmm26, 0x10
  30fa36:      	vpternlogq	zmm24, zmm11, zmm9, 0x96 # zmm24 = zmm24 ^ zmm11 ^ zmm9
  30fa3d:      	mov	r15d, 0x38
  30fa43:      	sub	r15d, r14d
  30fa46:      	shr	r15d, 0x2
  30fa4a:      	shl	r15, 0x6
  30fa4e:      	vmovdqu64	zmm9, zmmword ptr [rsi + r15]
  30fa55:      	mov	r15d, 0x3c
  30fa5b:      	sub	r15d, r14d
  30fa5e:      	shr	r15d, 0x2
  30fa62:      	shl	r15, 0x6
  30fa66:      	vmovdqu64	zmm11, zmmword ptr [rsi + r15]
  30fa6d:      	vpclmulqdq	zmm13, zmm23, zmm9, 0x0
  30fa74:      	vpclmulqdq	zmm10, zmm22, zmm11, 0x0
  30fa7b:      	vpternlogq	zmm10, zmm29, zmm13, 0x96 # zmm10 = zmm10 ^ zmm29 ^ zmm13
  30fa82:      	vpclmulqdq	zmm25, zmm23, zmm9, 0x11
  30fa89:      	vpclmulqdq	zmm13, zmm22, zmm11, 0x11
  30fa90:      	vpternlogq	zmm13, zmm28, zmm25, 0x96 # zmm13 = zmm13 ^ zmm28 ^ zmm25
  30fa97:      	vpclmulqdq	zmm25, zmm23, zmm9, 0x1
  30fa9e:      	vpclmulqdq	zmm9, zmm23, zmm9, 0x10
  30faa5:      	vpternlogq	zmm9, zmm24, zmm25, 0x96 # zmm9 = zmm9 ^ zmm24 ^ zmm25
  30faac:      	vpclmulqdq	zmm23, zmm22, zmm11, 0x1
  30fab3:      	vpclmulqdq	zmm11, zmm22, zmm11, 0x10
  30faba:      	vpternlogq	zmm11, zmm9, zmm23, 0x96 # zmm11 = zmm11 ^ zmm9 ^ zmm23
  30fac1:      	vpxor	xmm9, xmm9, xmm9
  30fac6:      	dec	rax
  30fac9:      	jne	0x30f690 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>+0x110>
  30facf:      	vpslldq	zmm9, zmm11, 0x8        # zmm9 = zero,zero,zero,zero,zero,zero,zero,zero,zmm11[0,1,2,3,4,5,6,7],zero,zero,zero,zero,zero,zero,zero,zero,zmm11[16,17,18,19,20,21,22,23],zero,zero,zero,zero,zero,zero,zero,zero,zmm11[32,33,34,35,36,37,38,39],zero,zero,zero,zero,zero,zero,zero,zero,zmm11[48,49,50,51,52,53,54,55]
  30fad6:      	vpxord	zmm9, zmm9, zmm10
  30fadc:      	vpsrldq	zmm10, zmm11, 0x8       # zmm10 = zmm11[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero,zmm11[24,25,26,27,28,29,30,31],zero,zero,zero,zero,zero,zero,zero,zero,zmm11[40,41,42,43,44,45,46,47],zero,zero,zero,zero,zero,zero,zero,zero,zmm11[56,57,58,59,60,61,62,63],zero,zero,zero,zero,zero,zero,zero,zero
  30fae3:      	vpxorq	zmm10, zmm13, zmm10
  30fae9:      	vpshufd	zmm11, zmm9, 0x4e       # zmm11 = zmm9[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30faf0:      	vpclmulqdq	zmm9, zmm9, zmm6, 0x0
  30faf7:      	vpxorq	zmm9, zmm9, zmm11
  30fafd:      	vpshufd	zmm11, zmm9, 0x4e       # zmm11 = zmm9[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30fb04:      	vpclmulqdq	zmm9, zmm9, zmm6, 0x0
  30fb0b:      	vpternlogq	zmm9, zmm10, zmm11, 0x96 # zmm9 = zmm9 ^ zmm10 ^ zmm11
  30fb12:      	vextracti64x4	ymm10, zmm9, 0x1
  30fb19:      	vpxor	ymm9, ymm10, ymm9
  30fb1e:      	vextracti128	xmm10, ymm9, 0x1
  30fb24:      	vpxor	xmm9, xmm10, xmm9
  30fb29:      	vpxor	xmm11, xmm11, xmm11
  30fb2e:      	mov	eax, 0x3
  30fb33:      	vpxor	xmm13, xmm13, xmm13
  30fb38:      	vpxor	xmm10, xmm10, xmm10
  30fb3d:      	jmp	0x30f690 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>+0x110>
  30fb42:      	vpxor	xmm11, xmm11, xmm11
  30fb47:      	vpxor	xmm13, xmm13, xmm13
  30fb4c:      	vpxor	xmm10, xmm10, xmm10
  30fb51:      	vmovdqa64	zmmword ptr [rsp], zmm10
  30fb58:      	vmovdqa64	zmmword ptr [rsp + 0x40], zmm13
  30fb60:      	vmovdqa64	zmmword ptr [rsp + 0x80], zmm11
  30fb68:      	vmovdqa64	zmmword ptr [rsp + 0xc0], zmm9
  30fb70:      	mov	qword ptr [rsp + 0x100], rax
  30fb78:      	mov	qword ptr [rsp + 0x108], rsi
  30fb80:      	cmp	rax, 0x3
  30fb84:      	jne	0x30fbce <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>+0x64e>
  30fb86:      	vpshufb	xmm0, xmm9, xmmword ptr [rip - 0x2638cf] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  30fb8f:      	vmovdqu	xmmword ptr [rcx], xmm0
  30fb93:      	movabs	rax, 0x7fffffffffffff00
  30fb9d:      	and	r9, rax
  30fba0:      	mov	rax, r9
  30fba3:      	lea	rsp, [rbp - 0x20]
  30fba7:      	pop	rbx
  30fba8:      	pop	r12
  30fbaa:      	pop	r14
  30fbac:      	pop	r15
  30fbae:      	pop	rbp
  30fbaf:      	vzeroupper
  30fbb2:      	ret
  30fbb3:      	lea	rdi, [rip - 0x203817]   # 0x10c3a3 <anon.8182237a801038de36885de64d2c176c.5.llvm.10465402473772549265>
  30fbba:      	lea	rcx, [rip + 0x4f4d2f]   # 0x8048f0 <anon.8182237a801038de36885de64d2c176c.1.llvm.10465402473772549265>
  30fbc1:      	mov	esi, 0x237
  30fbc6:      	xor	edx, edx
  30fbc8:      	call	qword ptr [rip + 0x5681b2] # 0x877d80 <sdallocx+0x877d80>
  30fbce:      	lea	rsi, [rsp + 0x100]
  30fbd6:      	lea	rdx, [rip - 0x264abd]   # 0xab120 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.13.llvm.14024894901458550281+0x40>
  30fbdd:      	lea	rcx, [rip - 0x1ecd24]   # 0x122ec0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd8b8>
  30fbe4:      	lea	r9, [rip + 0x4f553d]    # 0x805128 <anon.8f767f2a79b26510ef523e501c99a207.8.llvm.4603560004070794364+0x80>
  30fbeb:      	mov	r8d, 0x29
  30fbf1:      	xor	edi, edi
  30fbf3:      	vzeroupper
  30fbf6:      	call	qword ptr [rip + 0x56746c] # 0x877068 <sdallocx+0x877068>
  30fbfc:      	lea	rdi, [rip + 0x4f550d]   # 0x805110 <anon.8f767f2a79b26510ef523e501c99a207.8.llvm.4603560004070794364+0x68>
  30fc03:      	vzeroupper
  30fc06:      	call	qword ptr [rip + 0x56817c] # 0x877d88 <sdallocx+0x877d88>
  30fc0c:      	int3
  30fc0d:      	int3
  30fc0e:      	int3
  30fc0f:      	int3
