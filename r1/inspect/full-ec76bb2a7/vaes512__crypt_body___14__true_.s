
stage/probe-full-ec76bb2a7:	file format elf64-x86-64

Disassembly of section .text:

000000000030f400 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>>:
  30f400:      	push	rbp
  30f401:      	mov	rbp, rsp
  30f404:      	push	r14
  30f406:      	push	rbx
  30f407:      	and	rsp, -0x40
  30f40b:      	sub	rsp, 0x300
  30f412:      	vxorps	xmm0, xmm0, xmm0
  30f416:      	vmovaps	xmmword ptr [rsp + 0x100], xmm0
  30f41f:      	lea	rax, [rsp + 0x100]
  30f427:      	mov	r10, rdx
  30f42a:      	sub	r10, rax
  30f42d:      	sub	rax, rdx
  30f430:      	cmovb	rax, r10
  30f434:      	cmp	rax, 0xb
  30f438:      	jbe	0x30fa6d <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>+0x66d>
  30f43e:      	mov	eax, dword ptr [rdx + 0x8]
  30f441:      	mov	dword ptr [rsp + 0x108], eax
  30f448:      	mov	rax, qword ptr [rdx]
  30f44b:      	mov	qword ptr [rsp + 0x100], rax
  30f453:      	vmovdqu	xmm0, xmmword ptr [rcx]
  30f457:      	mov	r10, r9
  30f45a:      	shr	r10, 0x8
  30f45e:      	vpshufb	xmm24, xmm0, xmmword ptr [rip - 0x2631a8] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  30f468:      	movabs	rdx, 0x5555555555555556
  30f472:      	mov	rax, r10
  30f475:      	mul	rdx
  30f478:      	lea	rax, [rdx + 2*rdx]
  30f47c:      	mov	rdx, r10
  30f47f:      	sub	rdx, rax
  30f482:      	mov	eax, 0x3
  30f487:      	cmovne	rax, rdx
  30f48b:      	test	r10, r10
  30f48e:      	je	0x30f9fd <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>+0x5fd>
  30f494:      	vbroadcasti32x4	zmm0, xmmword ptr [rsp + 0x100] # zmm0 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f49c:      	vbroadcasti32x4	zmm1, xmmword ptr [rdi] # zmm1 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f4a2:      	vmovdqa64	zmmword ptr [rsp + 0x280], zmm1
  30f4aa:      	vbroadcasti32x4	zmm2, xmmword ptr [rdi + 0xe0] # zmm2 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f4b1:      	vmovdqa64	zmmword ptr [rsp + 0x240], zmm0
  30f4b9:      	vpord	zmm29, zmm0, zmmword ptr [rip - 0x1ec803] # 0x122cc0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd6b8>
  30f4c3:      	vbroadcasti32x4	zmm3, xmmword ptr [rdi + 0x10] # zmm3 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f4ca:      	vbroadcasti32x4	zmm4, xmmword ptr [rdi + 0x20] # zmm4 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f4d1:      	vbroadcasti32x4	zmm5, xmmword ptr [rdi + 0x30] # zmm5 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f4d8:      	vbroadcasti32x4	zmm6, xmmword ptr [rdi + 0x40] # zmm6 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f4df:      	vbroadcasti32x4	zmm7, xmmword ptr [rdi + 0x50] # zmm7 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f4e6:      	vbroadcasti32x4	zmm8, xmmword ptr [rdi + 0x60] # zmm8 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f4ed:      	vbroadcasti32x4	zmm9, xmmword ptr [rdi + 0x70] # zmm9 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f4f4:      	vbroadcasti32x4	zmm10, xmmword ptr [rdi + 0x80] # zmm10 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f4fb:      	vbroadcasti32x4	zmm11, xmmword ptr [rdi + 0x90] # zmm11 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f502:      	vbroadcasti32x4	zmm12, xmmword ptr [rdi + 0xa0] # zmm12 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f509:      	vbroadcasti32x4	zmm13, xmmword ptr [rdi + 0xb0] # zmm13 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f510:      	vbroadcasti32x4	zmm14, xmmword ptr [rdi + 0xc0] # zmm14 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f517:      	vbroadcasti32x4	zmm15, xmmword ptr [rdi + 0xd0] # zmm15 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f51e:      	shl	r10, 0x8
  30f522:      	vpxord	xmm21, xmm21, xmm21
  30f528:      	mov	edx, 0x12
  30f52d:      	xor	edi, edi
  30f52f:      	vpxor	xmm1, xmm1, xmm1
  30f533:      	vpxord	xmm26, xmm26, xmm26
  30f539:      	jmp	0x30f707 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>+0x307>
  30f53e:      	nop
  30f540:      	vmovdqa64	zmm20, zmmword ptr [rsp + 0x280]
  30f548:      	vpxord	zmm0, zmm29, zmm20
  30f54e:      	vpxord	zmm18, zmm20, zmmword ptr [rsp + 0x80]
  30f556:      	vpxord	zmm19, zmm20, zmmword ptr [rsp + 0x40]
  30f55e:      	vpxord	zmm20, zmm20, zmmword ptr [rsp]
  30f565:      	vaesenc	zmm0, zmm0, zmm3
  30f56b:      	vaesenc	zmm18, zmm18, zmm3
  30f571:      	vaesenc	zmm19, zmm19, zmm3
  30f577:      	vaesenc	zmm20, zmm20, zmm3
  30f57d:      	vaesenc	zmm0, zmm0, zmm4
  30f583:      	vaesenc	zmm18, zmm18, zmm4
  30f589:      	vaesenc	zmm19, zmm19, zmm4
  30f58f:      	vaesenc	zmm20, zmm20, zmm4
  30f595:      	vaesenc	zmm0, zmm0, zmm5
  30f59b:      	vaesenc	zmm18, zmm18, zmm5
  30f5a1:      	vaesenc	zmm19, zmm19, zmm5
  30f5a7:      	vaesenc	zmm20, zmm20, zmm5
  30f5ad:      	vaesenc	zmm0, zmm0, zmm6
  30f5b3:      	vaesenc	zmm18, zmm18, zmm6
  30f5b9:      	vaesenc	zmm19, zmm19, zmm6
  30f5bf:      	vaesenc	zmm20, zmm20, zmm6
  30f5c5:      	vaesenc	zmm0, zmm0, zmm7
  30f5cb:      	vaesenc	zmm18, zmm18, zmm7
  30f5d1:      	vaesenc	zmm19, zmm19, zmm7
  30f5d7:      	vaesenc	zmm20, zmm20, zmm7
  30f5dd:      	vaesenc	zmm0, zmm0, zmm8
  30f5e3:      	vaesenc	zmm18, zmm18, zmm8
  30f5e9:      	vaesenc	zmm19, zmm19, zmm8
  30f5ef:      	vaesenc	zmm20, zmm20, zmm8
  30f5f5:      	vaesenc	zmm0, zmm0, zmm9
  30f5fb:      	vaesenc	zmm18, zmm18, zmm9
  30f601:      	vaesenc	zmm19, zmm19, zmm9
  30f607:      	vaesenc	zmm20, zmm20, zmm9
  30f60d:      	vaesenc	zmm0, zmm0, zmm10
  30f613:      	vaesenc	zmm18, zmm18, zmm10
  30f619:      	vaesenc	zmm19, zmm19, zmm10
  30f61f:      	vaesenc	zmm20, zmm20, zmm10
  30f625:      	vaesenc	zmm0, zmm0, zmm11
  30f62b:      	vaesenc	zmm18, zmm18, zmm11
  30f631:      	vaesenc	zmm19, zmm19, zmm11
  30f637:      	vaesenc	zmm20, zmm20, zmm11
  30f63d:      	vaesenc	zmm0, zmm0, zmm12
  30f643:      	vaesenc	zmm18, zmm18, zmm12
  30f649:      	vaesenc	zmm19, zmm19, zmm12
  30f64f:      	vaesenc	zmm20, zmm20, zmm12
  30f655:      	vaesenc	zmm0, zmm0, zmm13
  30f65b:      	vaesenc	zmm18, zmm18, zmm13
  30f661:      	vaesenc	zmm19, zmm19, zmm13
  30f667:      	vaesenc	zmm20, zmm20, zmm13
  30f66d:      	vaesenc	zmm0, zmm0, zmm14
  30f673:      	vaesenc	zmm18, zmm18, zmm14
  30f679:      	vaesenc	zmm19, zmm19, zmm14
  30f67f:      	vaesenc	zmm20, zmm20, zmm14
  30f685:      	vaesenc	zmm0, zmm0, zmm15
  30f68b:      	vaesenc	zmm18, zmm18, zmm15
  30f691:      	vaesenc	zmm19, zmm19, zmm15
  30f697:      	vaesenc	zmm20, zmm20, zmm15
  30f69d:      	vaesenclast	zmm0, zmm0, zmm2
  30f6a3:      	vpxorq	zmm0, zmm0, zmm17
  30f6a9:      	vmovdqu64	zmmword ptr [r8 + rdi], zmm0
  30f6b0:      	vaesenclast	zmm0, zmm18, zmm2
  30f6b6:      	vpxorq	zmm0, zmm0, zmm16
  30f6bc:      	vmovdqu64	zmmword ptr [r8 + rdi + 0x40], zmm0
  30f6c4:      	vaesenclast	zmm0, zmm19, zmm2
  30f6ca:      	vpxorq	zmm0, zmm0, zmm31
  30f6d0:      	vmovdqu64	zmmword ptr [r8 + rdi + 0x80], zmm0
  30f6d8:      	vaesenclast	zmm0, zmm20, zmm2
  30f6de:      	vpxorq	zmm0, zmm0, zmm30
  30f6e4:      	vmovdqu64	zmmword ptr [r8 + rdi + 0xc0], zmm0
  30f6ec:      	add	edx, 0x10
  30f6ef:      	add	rdi, 0x100
  30f6f6:      	vmovdqa64	zmm29, zmmword ptr [rsp + 0xc0]
  30f6fe:      	cmp	r10, rdi
  30f701:      	je	0x30fa0d <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>+0x60d>
  30f707:      	lea	r11d, [rdx - 0x10]
  30f70b:      	and	r11d, 0xfe
  30f712:      	cmp	r11d, 0xed
  30f719:      	jae	0x30f760 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>+0x360>
  30f71b:      	vpaddd	zmm0, zmm29, zmmword ptr [rip - 0x1ec9a5] # 0x122d80 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd778>
  30f725:      	vmovdqa64	zmmword ptr [rsp + 0xc0], zmm0
  30f72d:      	vpaddd	zmm0, zmm29, zmmword ptr [rip - 0x1ec977] # 0x122dc0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd7b8>
  30f737:      	vmovdqa64	zmmword ptr [rsp + 0x80], zmm0
  30f73f:      	vpaddd	zmm0, zmm29, zmmword ptr [rip - 0x1ec949] # 0x122e00 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd7f8>
  30f749:      	vmovdqa64	zmmword ptr [rsp + 0x40], zmm0
  30f751:      	vpaddd	zmm0, zmm29, zmmword ptr [rip - 0x1ec91b] # 0x122e40 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd838>
  30f75b:      	jmp	0x30f800 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>+0x400>
  30f760:      	vpbroadcastd	zmm16, edx
  30f766:      	vmovdqa64	zmm17, zmmword ptr [rip - 0x1eca70] # 0x122d00 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd6f8>
  30f770:      	vpaddd	zmm16, zmm16, zmm17
  30f776:      	vmovdqa64	zmm18, zmmword ptr [rip - 0x1eca40] # 0x122d40 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd738>
  30f780:      	vpshufb	zmm16, zmm16, zmm18
  30f786:      	vmovdqa64	zmm0, zmmword ptr [rsp + 0x240]
  30f78e:      	vpord	zmm16, zmm0, zmm16
  30f794:      	vmovdqa64	zmmword ptr [rsp + 0xc0], zmm16
  30f79c:      	lea	r11d, [rdx - 0xc]
  30f7a0:      	vpbroadcastd	zmm16, r11d
  30f7a6:      	vpaddd	zmm16, zmm16, zmm17
  30f7ac:      	vpshufb	zmm16, zmm16, zmm18
  30f7b2:      	vpord	zmm16, zmm0, zmm16
  30f7b8:      	vmovdqa64	zmmword ptr [rsp + 0x80], zmm16
  30f7c0:      	lea	r11d, [rdx - 0x8]
  30f7c4:      	vpbroadcastd	zmm16, r11d
  30f7ca:      	vpaddd	zmm16, zmm16, zmm17
  30f7d0:      	vpshufb	zmm16, zmm16, zmm18
  30f7d6:      	vpord	zmm16, zmm0, zmm16
  30f7dc:      	vmovdqa64	zmmword ptr [rsp + 0x40], zmm16
  30f7e4:      	lea	r11d, [rdx - 0x4]
  30f7e8:      	vpbroadcastd	zmm16, r11d
  30f7ee:      	vpaddd	zmm16, zmm16, zmm17
  30f7f4:      	vpshufb	zmm16, zmm16, zmm18
  30f7fa:      	vpord	zmm0, zmm0, zmm16
  30f800:      	vmovdqa64	zmmword ptr [rsp], zmm0
  30f807:      	mov	r11, rax
  30f80a:      	shr	r11, 0x3c
  30f80e:      	jne	0x30fab6 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>+0x6b6>
  30f814:      	vmovdqu64	zmm17, zmmword ptr [r8 + rdi]
  30f81b:      	vmovdqu64	zmm16, zmmword ptr [r8 + rdi + 0x40]
  30f823:      	vmovdqu64	zmm31, zmmword ptr [r8 + rdi + 0x80]
  30f82b:      	vmovdqu64	zmm30, zmmword ptr [r8 + rdi + 0xc0]
  30f833:      	vmovdqa64	zmm18, zmmword ptr [rip - 0x1ec9bd] # 0x122e80 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd878>
  30f83d:      	vpshufb	zmm22, zmm30, zmm18
  30f843:      	vpshufb	zmm23, zmm31, zmm18
  30f849:      	vpshufb	zmm0, zmm16, zmm18
  30f84f:      	vpshufb	zmm20, zmm17, zmm18
  30f855:      	vpxorq	zmm20, zmm24, zmm20
  30f85b:      	mov	r11d, eax
  30f85e:      	shl	r11d, 0x4
  30f862:      	mov	ebx, 0x30
  30f867:      	sub	ebx, r11d
  30f86a:      	mov	r14d, 0x34
  30f870:      	sub	r14d, r11d
  30f873:      	shr	ebx, 0x2
  30f876:      	shl	rbx, 0x6
  30f87a:      	vmovdqu64	zmm24, zmmword ptr [rsi + rbx]
  30f881:      	shr	r14d, 0x2
  30f885:      	shl	r14, 0x6
  30f889:      	vmovdqu64	zmm27, zmmword ptr [rsi + r14]
  30f890:      	vpclmulqdq	zmm18, zmm20, zmm24, 0x0
  30f897:      	vpclmulqdq	zmm19, zmm0, zmm27, 0x0
  30f89e:      	vmovdqa64	zmm25, zmm21
  30f8a4:      	vpternlogq	zmm25, zmm18, zmm19, 0x96 # zmm25 = zmm25 ^ zmm18 ^ zmm19
  30f8ab:      	vpclmulqdq	zmm18, zmm20, zmm24, 0x11
  30f8b2:      	vpclmulqdq	zmm19, zmm0, zmm27, 0x11
  30f8b9:      	vmovdqa64	zmm28, zmm1
  30f8bf:      	vpternlogq	zmm28, zmm18, zmm19, 0x96 # zmm28 = zmm28 ^ zmm18 ^ zmm19
  30f8c6:      	vpclmulqdq	zmm1, zmm20, zmm24, 0x1
  30f8cd:      	vpclmulqdq	zmm18, zmm20, zmm24, 0x10
  30f8d4:      	vpternlogq	zmm26, zmm1, zmm18, 0x96 # zmm26 = zmm26 ^ zmm1 ^ zmm18
  30f8db:      	vpclmulqdq	zmm1, zmm0, zmm27, 0x1
  30f8e2:      	vpclmulqdq	zmm0, zmm0, zmm27, 0x10
  30f8e9:      	vpternlogq	zmm0, zmm26, zmm1, 0x96 # zmm0 = zmm0 ^ zmm26 ^ zmm1
  30f8f0:      	mov	ebx, 0x38
  30f8f5:      	sub	ebx, r11d
  30f8f8:      	shr	ebx, 0x2
  30f8fb:      	shl	rbx, 0x6
  30f8ff:      	vmovdqu64	zmm18, zmmword ptr [rsi + rbx]
  30f906:      	mov	ebx, 0x3c
  30f90b:      	sub	ebx, r11d
  30f90e:      	shr	ebx, 0x2
  30f911:      	shl	rbx, 0x6
  30f915:      	vmovdqu64	zmm19, zmmword ptr [rsi + rbx]
  30f91c:      	vpclmulqdq	zmm1, zmm23, zmm18, 0x0
  30f923:      	vpclmulqdq	zmm21, zmm22, zmm19, 0x0
  30f92a:      	vpternlogq	zmm21, zmm25, zmm1, 0x96 # zmm21 = zmm21 ^ zmm25 ^ zmm1
  30f931:      	vpclmulqdq	zmm20, zmm23, zmm18, 0x11
  30f938:      	vpclmulqdq	zmm1, zmm22, zmm19, 0x11
  30f93f:      	vpternlogq	zmm1, zmm28, zmm20, 0x96 # zmm1 = zmm1 ^ zmm28 ^ zmm20
  30f946:      	vpclmulqdq	zmm20, zmm23, zmm18, 0x1
  30f94d:      	vpclmulqdq	zmm18, zmm23, zmm18, 0x10
  30f954:      	vpternlogq	zmm18, zmm0, zmm20, 0x96 # zmm18 = zmm18 ^ zmm0 ^ zmm20
  30f95b:      	vpclmulqdq	zmm0, zmm22, zmm19, 0x1
  30f962:      	vpclmulqdq	zmm26, zmm22, zmm19, 0x10
  30f969:      	vpternlogq	zmm26, zmm18, zmm0, 0x96 # zmm26 = zmm26 ^ zmm18 ^ zmm0
  30f970:      	vpxord	xmm24, xmm24, xmm24
  30f976:      	dec	rax
  30f979:      	jne	0x30f540 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>+0x140>
  30f97f:      	vpslldq	zmm0, zmm26, 0x8        # zmm0 = zero,zero,zero,zero,zero,zero,zero,zero,zmm26[0,1,2,3,4,5,6,7],zero,zero,zero,zero,zero,zero,zero,zero,zmm26[16,17,18,19,20,21,22,23],zero,zero,zero,zero,zero,zero,zero,zero,zmm26[32,33,34,35,36,37,38,39],zero,zero,zero,zero,zero,zero,zero,zero,zmm26[48,49,50,51,52,53,54,55]
  30f986:      	vpxord	zmm0, zmm0, zmm21
  30f98c:      	vpsrldq	zmm18, zmm26, 0x8       # zmm18 = zmm26[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero,zmm26[24,25,26,27,28,29,30,31],zero,zero,zero,zero,zero,zero,zero,zero,zmm26[40,41,42,43,44,45,46,47],zero,zero,zero,zero,zero,zero,zero,zero,zmm26[56,57,58,59,60,61,62,63],zero,zero,zero,zero,zero,zero,zero,zero
  30f993:      	vpxorq	zmm1, zmm1, zmm18
  30f999:      	vpshufd	zmm18, zmm0, 0x4e       # zmm18 = zmm0[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30f9a0:      	vpbroadcastq	zmm19, qword ptr [rip - 0x26497a] # 0xab030 <sdallocx+0xab030>
  30f9aa:      	vpclmulqdq	zmm0, zmm0, zmm19, 0x0
  30f9b1:      	vpxorq	zmm0, zmm0, zmm18
  30f9b7:      	vpshufd	zmm18, zmm0, 0x4e       # zmm18 = zmm0[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30f9be:      	vpclmulqdq	zmm0, zmm0, zmm19, 0x0
  30f9c5:      	vpternlogq	zmm0, zmm1, zmm18, 0x96 # zmm0 = zmm0 ^ zmm1 ^ zmm18
  30f9cc:      	vextracti64x4	ymm1, zmm0, 0x1
  30f9d3:      	vpxor	ymm0, ymm1, ymm0
  30f9d7:      	vextracti128	xmm1, ymm0, 0x1
  30f9dd:      	vpxorq	xmm24, xmm1, xmm0
  30f9e3:      	vpxord	xmm26, xmm26, xmm26
  30f9e9:      	mov	eax, 0x3
  30f9ee:      	vpxor	xmm1, xmm1, xmm1
  30f9f2:      	vpxord	xmm21, xmm21, xmm21
  30f9f8:      	jmp	0x30f540 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>+0x140>
  30f9fd:      	vpxord	xmm26, xmm26, xmm26
  30fa03:      	vpxor	xmm1, xmm1, xmm1
  30fa07:      	vpxord	xmm21, xmm21, xmm21
  30fa0d:      	vmovdqa64	zmmword ptr [rsp + 0x100], zmm21
  30fa15:      	vmovdqa64	zmmword ptr [rsp + 0x140], zmm1
  30fa1d:      	vmovdqa64	zmmword ptr [rsp + 0x180], zmm26
  30fa25:      	vmovdqa64	zmmword ptr [rsp + 0x1c0], zmm24
  30fa2d:      	mov	qword ptr [rsp + 0x200], rax
  30fa35:      	mov	qword ptr [rsp + 0x208], rsi
  30fa3d:      	cmp	rax, 0x3
  30fa41:      	jne	0x30fa88 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>+0x688>
  30fa43:      	vpshufb	xmm0, xmm24, xmmword ptr [rip - 0x26378d] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  30fa4d:      	vmovdqu	xmmword ptr [rcx], xmm0
  30fa51:      	movabs	rax, 0x7fffffffffffff00
  30fa5b:      	and	r9, rax
  30fa5e:      	mov	rax, r9
  30fa61:      	lea	rsp, [rbp - 0x10]
  30fa65:      	pop	rbx
  30fa66:      	pop	r14
  30fa68:      	pop	rbp
  30fa69:      	vzeroupper
  30fa6c:      	ret
  30fa6d:      	lea	rdi, [rip - 0x2036d1]   # 0x10c3a3 <anon.8182237a801038de36885de64d2c176c.5.llvm.10465402473772549265>
  30fa74:      	lea	rcx, [rip + 0x4f55f5]   # 0x805070 <anon.8182237a801038de36885de64d2c176c.1.llvm.10465402473772549265>
  30fa7b:      	mov	esi, 0x237
  30fa80:      	xor	edx, edx
  30fa82:      	call	qword ptr [rip + 0x568ab8] # 0x878540 <sdallocx+0x878540>
  30fa88:      	lea	rsi, [rsp + 0x200]
  30fa90:      	lea	rdx, [rip - 0x264977]   # 0xab120 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.13.llvm.14024894901458550281+0x40>
  30fa97:      	lea	rcx, [rip - 0x1ecbde]   # 0x122ec0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd8b8>
  30fa9e:      	lea	r9, [rip + 0x4f5e4b]    # 0x8058f0 <anon.f91301331f2ac3e3eb2ad538a87aa794.7.llvm.3388403078394314149+0x30>
  30faa5:      	mov	r8d, 0x29
  30faab:      	xor	edi, edi
  30faad:      	vzeroupper
  30fab0:      	call	qword ptr [rip + 0x567d72] # 0x877828 <sdallocx+0x877828>
  30fab6:      	lea	rdi, [rip + 0x4f5e1b]   # 0x8058d8 <anon.f91301331f2ac3e3eb2ad538a87aa794.7.llvm.3388403078394314149+0x18>
  30fabd:      	vzeroupper
  30fac0:      	call	qword ptr [rip + 0x568a82] # 0x878548 <sdallocx+0x878548>
  30fac6:      	int3
  30fac7:      	int3
  30fac8:      	int3
  30fac9:      	int3
  30faca:      	int3
  30facb:      	int3
  30facc:      	int3
  30facd:      	int3
  30face:      	int3
  30facf:      	int3
