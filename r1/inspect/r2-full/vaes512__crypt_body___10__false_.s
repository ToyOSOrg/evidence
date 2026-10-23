
stage/probe-full-7dcf12a5a:	file format elf64-x86-64

Disassembly of section .text:

000000000030df80 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>>:
  30df80:      	push	rbp
  30df81:      	mov	rbp, rsp
  30df84:      	push	r15
  30df86:      	push	r14
  30df88:      	push	rbx
  30df89:      	and	rsp, -0x40
  30df8d:      	sub	rsp, 0x180
  30df94:      	vxorps	xmm0, xmm0, xmm0
  30df98:      	vmovaps	xmmword ptr [rsp], xmm0
  30df9d:      	mov	rax, rsp
  30dfa0:      	mov	r10, rdx
  30dfa3:      	sub	r10, rax
  30dfa6:      	sub	rax, rdx
  30dfa9:      	cmovb	rax, r10
  30dfad:      	cmp	rax, 0xb
  30dfb1:      	jbe	0x30e6bc <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x73c>
  30dfb7:      	mov	eax, dword ptr [rdx + 0x8]
  30dfba:      	mov	dword ptr [rsp + 0x8], eax
  30dfbe:      	mov	rax, qword ptr [rdx]
  30dfc1:      	mov	qword ptr [rsp], rax
  30dfc5:      	vmovdqu	xmm0, xmmword ptr [rcx]
  30dfc9:      	mov	r10, r9
  30dfcc:      	shr	r10, 0x8
  30dfd0:      	vpshufb	xmm3, xmm0, xmmword ptr [rip - 0x261d19] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  30dfd9:      	movabs	rdx, 0x5555555555555556
  30dfe3:      	mov	rax, r10
  30dfe6:      	mul	rdx
  30dfe9:      	lea	rax, [rdx + 2*rdx]
  30dfed:      	mov	r11, r10
  30dff0:      	sub	r11, rax
  30dff3:      	mov	edx, 0x3
  30dff8:      	cmovne	rdx, r11
  30dffc:      	test	r10, r10
  30dfff:      	je	0x30e5ed <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x66d>
  30e005:      	vbroadcasti32x4	zmm2, xmmword ptr [rsp] # zmm2 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e00c:      	vpord	zmm12, zmm2, zmmword ptr [rip - 0x1eb956] # 0x1226c0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd0b8>
  30e016:      	add	r8, 0xc0
  30e01d:      	shl	r10, 0x4
  30e021:      	vpxor	xmm1, xmm1, xmm1
  30e025:      	xor	r11d, r11d
  30e028:      	mov	rbx, rsp
  30e02b:      	vmovdqa64	zmm4, zmmword ptr [rip - 0x1eb8b5] # 0x122780 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd178>
  30e035:      	vmovdqa64	zmm5, zmmword ptr [rip - 0x1eb87f] # 0x1227c0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd1b8>
  30e03f:      	vmovdqa64	zmm7, zmmword ptr [rip - 0x1eb849] # 0x122800 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd1f8>
  30e049:      	vmovdqa64	zmm8, zmmword ptr [rip - 0x1eb813] # 0x122840 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd238>
  30e053:      	vmovdqa64	zmm9, zmmword ptr [rip - 0x1eb7dd] # 0x122880 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd278>
  30e05d:      	vpbroadcastq	zmm0, qword ptr [rip - 0x263037] # 0xab030 <sdallocx+0xab030>
  30e067:      	vmovdqa64	zmm10, zmmword ptr [rip - 0x1eb971] # 0x122700 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd0f8>
  30e071:      	vmovdqa64	zmm11, zmmword ptr [rip - 0x1eb93b] # 0x122740 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd138>
  30e07b:      	vpxor	xmm14, xmm14, xmm14
  30e080:      	vpxor	xmm15, xmm15, xmm15
  30e085:      	vpxord	xmm19, xmm19, xmm19
  30e08b:      	vpxord	xmm25, xmm25, xmm25
  30e091:      	vpxor	xmm6, xmm6, xmm6
  30e095:      	vpxor	xmm13, xmm13, xmm13
  30e09a:      	jmp	0x30e24d <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x2cd>
  30e09f:      	nop
  30e0a0:      	vpxord	zmm14, zmm26, zmm16
  30e0a6:      	vpxord	zmm15, zmm26, zmm22
  30e0ac:      	vpxord	zmm16, zmm26, zmm23
  30e0b2:      	vpxord	zmm19, zmm26, zmm24
  30e0b8:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x10] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e0bf:      	vaesenc	zmm14, zmm14, zmm22
  30e0c5:      	vaesenc	zmm15, zmm15, zmm22
  30e0cb:      	vaesenc	zmm16, zmm16, zmm22
  30e0d1:      	vaesenc	zmm19, zmm19, zmm22
  30e0d7:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x20] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e0de:      	vaesenc	zmm14, zmm14, zmm22
  30e0e4:      	vaesenc	zmm15, zmm15, zmm22
  30e0ea:      	vaesenc	zmm16, zmm16, zmm22
  30e0f0:      	vaesenc	zmm19, zmm19, zmm22
  30e0f6:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x30] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e0fd:      	vaesenc	zmm14, zmm14, zmm22
  30e103:      	vaesenc	zmm15, zmm15, zmm22
  30e109:      	vaesenc	zmm16, zmm16, zmm22
  30e10f:      	vaesenc	zmm19, zmm19, zmm22
  30e115:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x40] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e11c:      	vaesenc	zmm14, zmm14, zmm22
  30e122:      	vaesenc	zmm15, zmm15, zmm22
  30e128:      	vaesenc	zmm16, zmm16, zmm22
  30e12e:      	vaesenc	zmm19, zmm19, zmm22
  30e134:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x50] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e13b:      	vaesenc	zmm14, zmm14, zmm22
  30e141:      	vaesenc	zmm15, zmm15, zmm22
  30e147:      	vaesenc	zmm16, zmm16, zmm22
  30e14d:      	vaesenc	zmm19, zmm19, zmm22
  30e153:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x60] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e15a:      	vaesenc	zmm14, zmm14, zmm22
  30e160:      	vaesenc	zmm15, zmm15, zmm22
  30e166:      	vaesenc	zmm16, zmm16, zmm22
  30e16c:      	vaesenc	zmm19, zmm19, zmm22
  30e172:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x70] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e179:      	vaesenc	zmm14, zmm14, zmm22
  30e17f:      	vaesenc	zmm15, zmm15, zmm22
  30e185:      	vaesenc	zmm16, zmm16, zmm22
  30e18b:      	vaesenc	zmm19, zmm19, zmm22
  30e191:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x80] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e198:      	vaesenc	zmm14, zmm14, zmm22
  30e19e:      	vaesenc	zmm15, zmm15, zmm22
  30e1a4:      	vaesenc	zmm16, zmm16, zmm22
  30e1aa:      	vaesenc	zmm19, zmm19, zmm22
  30e1b0:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x90] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e1b7:      	vaesenc	zmm14, zmm14, zmm22
  30e1bd:      	vaesenc	zmm15, zmm15, zmm22
  30e1c3:      	vaesenc	zmm16, zmm16, zmm22
  30e1c9:      	vaesenc	zmm19, zmm19, zmm22
  30e1cf:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0xa0] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e1d6:      	vaesenclast	zmm14, zmm14, zmm22
  30e1dc:      	vpxorq	zmm14, zmm14, zmm21
  30e1e2:      	vmovdqu64	zmmword ptr [r8 - 0xc0], zmm14
  30e1e9:      	vaesenclast	zmm15, zmm15, zmm22
  30e1ef:      	vpxorq	zmm15, zmm15, zmm20
  30e1f5:      	vmovdqu64	zmmword ptr [r8 - 0x80], zmm15
  30e1fc:      	vaesenclast	zmm16, zmm16, zmm22
  30e202:      	vpxorq	zmm16, zmm16, zmm18
  30e208:      	vmovdqu64	zmmword ptr [r8 - 0x40], zmm16
  30e20f:      	vaesenclast	zmm18, zmm19, zmm22
  30e215:      	vpxorq	zmm17, zmm18, zmm17
  30e21b:      	vmovdqu64	zmmword ptr [r8], zmm17
  30e221:      	vpshufb	zmm25, zmm14, zmm9
  30e227:      	vpshufb	zmm19, zmm15, zmm9
  30e22d:      	vpshufb	zmm15, zmm16, zmm9
  30e233:      	vpshufb	zmm14, zmm17, zmm9
  30e239:      	add	r11, 0x10
  30e23d:      	add	r8, 0x100
  30e244:      	cmp	r10, r11
  30e247:      	je	0x30e4cc <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x54c>
  30e24d:      	vmovdqa64	zmm16, zmm12
  30e253:      	lea	eax, [r11 + 0x2]
  30e257:      	mov	qword ptr [rsp], rdi
  30e25b:      	and	eax, 0xfe
  30e260:      	cmp	eax, 0xed
  30e265:      	jae	0x30e290 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x310>
  30e267:      	vpaddd	zmm12, zmm16, zmm4
  30e26d:      	vpaddd	zmm22, zmm16, zmm5
  30e273:      	vpaddd	zmm23, zmm16, zmm7
  30e279:      	vpaddd	zmm24, zmm16, zmm8
  30e27f:      	jmp	0x30e300 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x380>
  30e281:      	nop	word ptr cs:[rax + rax]
  30e290:      	lea	rax, [r11 + 0x12]
  30e294:      	vpbroadcastd	zmm12, eax
  30e29a:      	vpaddd	zmm12, zmm12, zmm10
  30e2a0:      	vpshufb	zmm12, zmm12, zmm11
  30e2a6:      	vpord	zmm12, zmm2, zmm12
  30e2ac:      	lea	eax, [r11 + 0x6]
  30e2b0:      	vpbroadcastd	zmm17, eax
  30e2b6:      	vpaddd	zmm17, zmm17, zmm10
  30e2bc:      	vpshufb	zmm17, zmm17, zmm11
  30e2c2:      	vpord	zmm22, zmm2, zmm17
  30e2c8:      	lea	eax, [r11 + 0xa]
  30e2cc:      	vpbroadcastd	zmm17, eax
  30e2d2:      	vpaddd	zmm17, zmm17, zmm10
  30e2d8:      	vpshufb	zmm17, zmm17, zmm11
  30e2de:      	vpord	zmm23, zmm2, zmm17
  30e2e4:      	lea	eax, [r11 + 0xe]
  30e2e8:      	vpbroadcastd	zmm17, eax
  30e2ee:      	vpaddd	zmm17, zmm17, zmm10
  30e2f4:      	vpshufb	zmm17, zmm17, zmm11
  30e2fa:      	vpord	zmm24, zmm2, zmm17
  30e300:      	mov	r14, qword ptr [rsp]
  30e304:      	vmovdqu64	zmm21, zmmword ptr [r8 - 0xc0]
  30e30b:      	vmovdqu64	zmm20, zmmword ptr [r8 - 0x80]
  30e312:      	vmovdqu64	zmm18, zmmword ptr [r8 - 0x40]
  30e319:      	vmovdqu64	zmm17, zmmword ptr [r8]
  30e31f:      	vbroadcasti32x4	zmm26, xmmword ptr [r14] # zmm26 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e325:      	test	r11, r11
  30e328:      	je	0x30e0a0 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x120>
  30e32e:      	mov	r15, rdx
  30e331:      	shl	r15, 0x4
  30e335:      	mov	eax, 0x30
  30e33a:      	sub	eax, r15d
  30e33d:      	shr	eax, 0x2
  30e340:      	test	rdx, rdx
  30e343:      	je	0x30e705 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x785>
  30e349:      	vpxorq	zmm3, zmm3, zmm25
  30e34f:      	shl	rax, 0x6
  30e353:      	vmovdqu64	zmm25, zmmword ptr [rsi + rax]
  30e35a:      	mov	eax, 0x34
  30e35f:      	sub	eax, r15d
  30e362:      	shr	eax, 0x2
  30e365:      	shl	rax, 0x6
  30e369:      	vmovdqu64	zmm27, zmmword ptr [rsi + rax]
  30e370:      	vpclmulqdq	zmm28, zmm3, zmm25, 0x0
  30e377:      	vpclmulqdq	zmm29, zmm19, zmm27, 0x0
  30e37e:      	vmovdqa64	zmm30, zmm1
  30e384:      	vpternlogq	zmm30, zmm28, zmm29, 0x96 # zmm30 = zmm30 ^ zmm28 ^ zmm29
  30e38b:      	vpclmulqdq	zmm1, zmm3, zmm25, 0x11
  30e392:      	vpclmulqdq	zmm28, zmm19, zmm27, 0x11
  30e399:      	vmovdqa64	zmm29, zmm6
  30e39f:      	vpternlogq	zmm29, zmm1, zmm28, 0x96 # zmm29 = zmm29 ^ zmm1 ^ zmm28
  30e3a6:      	vpclmulqdq	zmm1, zmm3, zmm25, 0x1
  30e3ad:      	vpclmulqdq	zmm3, zmm3, zmm25, 0x10
  30e3b4:      	vpternlogq	zmm13, zmm1, zmm3, 0x96 # zmm13 = zmm13 ^ zmm1 ^ zmm3
  30e3bb:      	vpclmulqdq	zmm1, zmm19, zmm27, 0x1
  30e3c2:      	vpclmulqdq	zmm3, zmm19, zmm27, 0x10
  30e3c9:      	vpternlogq	zmm3, zmm13, zmm1, 0x96 # zmm3 = zmm3 ^ zmm13 ^ zmm1
  30e3d0:      	mov	eax, 0x38
  30e3d5:      	sub	eax, r15d
  30e3d8:      	shr	eax, 0x2
  30e3db:      	shl	rax, 0x6
  30e3df:      	vmovdqu64	zmm13, zmmword ptr [rsi + rax]
  30e3e6:      	mov	eax, 0x3c
  30e3eb:      	sub	eax, r15d
  30e3ee:      	shr	eax, 0x2
  30e3f1:      	shl	rax, 0x6
  30e3f5:      	vmovdqu64	zmm19, zmmword ptr [rsi + rax]
  30e3fc:      	vpclmulqdq	zmm6, zmm15, zmm13, 0x0
  30e403:      	vpclmulqdq	zmm1, zmm14, zmm19, 0x0
  30e40a:      	vpternlogq	zmm1, zmm30, zmm6, 0x96 # zmm1 = zmm1 ^ zmm30 ^ zmm6
  30e411:      	vpclmulqdq	zmm25, zmm15, zmm13, 0x11
  30e418:      	vpclmulqdq	zmm6, zmm14, zmm19, 0x11
  30e41f:      	vpternlogq	zmm6, zmm29, zmm25, 0x96 # zmm6 = zmm6 ^ zmm29 ^ zmm25
  30e426:      	vpclmulqdq	zmm25, zmm15, zmm13, 0x1
  30e42d:      	vpclmulqdq	zmm15, zmm15, zmm13, 0x10
  30e434:      	vpternlogq	zmm15, zmm3, zmm25, 0x96 # zmm15 = zmm15 ^ zmm3 ^ zmm25
  30e43b:      	vpclmulqdq	zmm3, zmm14, zmm19, 0x1
  30e442:      	vpclmulqdq	zmm13, zmm14, zmm19, 0x10
  30e449:      	vpternlogq	zmm13, zmm15, zmm3, 0x96 # zmm13 = zmm13 ^ zmm15 ^ zmm3
  30e450:      	vpxor	xmm3, xmm3, xmm3
  30e454:      	dec	rdx
  30e457:      	jne	0x30e0a0 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x120>
  30e45d:      	vpslldq	zmm3, zmm13, 0x8        # zmm3 = zero,zero,zero,zero,zero,zero,zero,zero,zmm13[0,1,2,3,4,5,6,7],zero,zero,zero,zero,zero,zero,zero,zero,zmm13[16,17,18,19,20,21,22,23],zero,zero,zero,zero,zero,zero,zero,zero,zmm13[32,33,34,35,36,37,38,39],zero,zero,zero,zero,zero,zero,zero,zero,zmm13[48,49,50,51,52,53,54,55]
  30e464:      	vpxord	zmm1, zmm3, zmm1
  30e46a:      	vpsrldq	zmm3, zmm13, 0x8        # zmm3 = zmm13[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero,zmm13[24,25,26,27,28,29,30,31],zero,zero,zero,zero,zero,zero,zero,zero,zmm13[40,41,42,43,44,45,46,47],zero,zero,zero,zero,zero,zero,zero,zero,zmm13[56,57,58,59,60,61,62,63],zero,zero,zero,zero,zero,zero,zero,zero
  30e471:      	vpxorq	zmm3, zmm6, zmm3
  30e477:      	vpshufd	zmm6, zmm1, 0x4e        # zmm6 = zmm1[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30e47e:      	vpclmulqdq	zmm1, zmm1, zmm0, 0x0
  30e485:      	vpxorq	zmm1, zmm1, zmm6
  30e48b:      	vpshufd	zmm6, zmm1, 0x4e        # zmm6 = zmm1[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30e492:      	vpclmulqdq	zmm1, zmm1, zmm0, 0x0
  30e499:      	vpternlogq	zmm1, zmm3, zmm6, 0x96 # zmm1 = zmm1 ^ zmm3 ^ zmm6
  30e4a0:      	vextracti64x4	ymm3, zmm1, 0x1
  30e4a7:      	vpxor	ymm1, ymm3, ymm1
  30e4ab:      	vextracti128	xmm3, ymm1, 0x1
  30e4b1:      	vpxor	xmm3, xmm3, xmm1
  30e4b5:      	vpxor	xmm13, xmm13, xmm13
  30e4ba:      	mov	edx, 0x3
  30e4bf:      	vpxor	xmm6, xmm6, xmm6
  30e4c3:      	vpxor	xmm1, xmm1, xmm1
  30e4c7:      	jmp	0x30e0a0 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x120>
  30e4cc:      	mov	rax, rdx
  30e4cf:      	shl	rax, 0x4
  30e4d3:      	mov	edi, 0x30
  30e4d8:      	sub	edi, eax
  30e4da:      	shr	edi, 0x2
  30e4dd:      	test	rdx, rdx
  30e4e0:      	je	0x30e71d <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x79d>
  30e4e6:      	vpxorq	zmm2, zmm3, zmm25
  30e4ec:      	shl	rdi, 0x6
  30e4f0:      	vmovdqu64	zmm3, zmmword ptr [rsi + rdi]
  30e4f7:      	mov	edi, 0x34
  30e4fc:      	sub	edi, eax
  30e4fe:      	shr	edi, 0x2
  30e501:      	shl	rdi, 0x6
  30e505:      	vmovdqu64	zmm4, zmmword ptr [rsi + rdi]
  30e50c:      	vpclmulqdq	zmm5, zmm2, zmm3, 0x0
  30e513:      	vpclmulqdq	zmm7, zmm19, zmm4, 0x0
  30e51a:      	vpternlogq	zmm1, zmm5, zmm7, 0x96 # zmm1 = zmm1 ^ zmm5 ^ zmm7
  30e521:      	vpclmulqdq	zmm5, zmm2, zmm3, 0x11
  30e528:      	vpclmulqdq	zmm7, zmm19, zmm4, 0x11
  30e52f:      	vpternlogq	zmm6, zmm5, zmm7, 0x96 # zmm6 = zmm6 ^ zmm5 ^ zmm7
  30e536:      	vpclmulqdq	zmm5, zmm2, zmm3, 0x1
  30e53d:      	vpclmulqdq	zmm2, zmm2, zmm3, 0x10
  30e544:      	vpternlogq	zmm13, zmm5, zmm2, 0x96 # zmm13 = zmm13 ^ zmm5 ^ zmm2
  30e54b:      	vpclmulqdq	zmm2, zmm19, zmm4, 0x1
  30e552:      	vpclmulqdq	zmm3, zmm19, zmm4, 0x10
  30e559:      	vpternlogq	zmm3, zmm13, zmm2, 0x96 # zmm3 = zmm3 ^ zmm13 ^ zmm2
  30e560:      	mov	edi, 0x38
  30e565:      	sub	edi, eax
  30e567:      	shr	edi, 0x2
  30e56a:      	shl	rdi, 0x6
  30e56e:      	vmovdqu64	zmm5, zmmword ptr [rsi + rdi]
  30e575:      	mov	edi, 0x3c
  30e57a:      	sub	edi, eax
  30e57c:      	shr	edi, 0x2
  30e57f:      	shl	rdi, 0x6
  30e583:      	vmovdqu64	zmm7, zmmword ptr [rsi + rdi]
  30e58a:      	vpclmulqdq	zmm2, zmm15, zmm5, 0x0
  30e591:      	vpclmulqdq	zmm4, zmm14, zmm7, 0x0
  30e598:      	vpternlogq	zmm4, zmm1, zmm2, 0x96 # zmm4 = zmm4 ^ zmm1 ^ zmm2
  30e59f:      	vpclmulqdq	zmm1, zmm15, zmm5, 0x11
  30e5a6:      	vpclmulqdq	zmm2, zmm14, zmm7, 0x11
  30e5ad:      	vpternlogq	zmm2, zmm6, zmm1, 0x96 # zmm2 = zmm2 ^ zmm6 ^ zmm1
  30e5b4:      	vpclmulqdq	zmm1, zmm15, zmm5, 0x1
  30e5bb:      	vpclmulqdq	zmm5, zmm15, zmm5, 0x10
  30e5c2:      	vpternlogq	zmm5, zmm3, zmm1, 0x96 # zmm5 = zmm5 ^ zmm3 ^ zmm1
  30e5c9:      	vpclmulqdq	zmm3, zmm14, zmm7, 0x1
  30e5d0:      	vpclmulqdq	zmm1, zmm14, zmm7, 0x10
  30e5d7:      	vpternlogq	zmm1, zmm5, zmm3, 0x96 # zmm1 = zmm1 ^ zmm5 ^ zmm3
  30e5de:      	dec	rdx
  30e5e1:      	je	0x30e5f3 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x673>
  30e5e3:      	vpxor	xmm3, xmm3, xmm3
  30e5e7:      	vpxor	xmm0, xmm0, xmm0
  30e5eb:      	jmp	0x30e665 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x6e5>
  30e5ed:      	vpxor	xmm1, xmm1, xmm1
  30e5f1:      	jmp	0x30e65d <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x6dd>
  30e5f3:      	vpslldq	zmm3, zmm1, 0x8         # zmm3 = zero,zero,zero,zero,zero,zero,zero,zero,zmm1[0,1,2,3,4,5,6,7],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[16,17,18,19,20,21,22,23],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[32,33,34,35,36,37,38,39],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[48,49,50,51,52,53,54,55]
  30e5fa:      	vpxord	zmm3, zmm3, zmm4
  30e600:      	vpsrldq	zmm1, zmm1, 0x8         # zmm1 = zmm1[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[24,25,26,27,28,29,30,31],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[40,41,42,43,44,45,46,47],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[56,57,58,59,60,61,62,63],zero,zero,zero,zero,zero,zero,zero,zero
  30e607:      	vpxorq	zmm1, zmm2, zmm1
  30e60d:      	vpshufd	zmm2, zmm3, 0x4e        # zmm2 = zmm3[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30e614:      	vpclmulqdq	zmm3, zmm3, zmm0, 0x0
  30e61b:      	vpxorq	zmm2, zmm3, zmm2
  30e621:      	vpshufd	zmm3, zmm2, 0x4e        # zmm3 = zmm2[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30e628:      	vpclmulqdq	zmm0, zmm2, zmm0, 0x0
  30e62f:      	vpternlogq	zmm0, zmm1, zmm3, 0x96 # zmm0 = zmm0 ^ zmm1 ^ zmm3
  30e636:      	vextracti64x4	ymm1, zmm0, 0x1
  30e63d:      	vpxor	ymm0, ymm1, ymm0
  30e641:      	vextracti128	xmm1, ymm0, 0x1
  30e647:      	vpxor	xmm3, xmm1, xmm0
  30e64b:      	vpshufb	xmm0, xmm3, xmmword ptr [rip - 0x262394] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  30e654:      	vpxor	xmm1, xmm1, xmm1
  30e658:      	mov	edx, 0x3
  30e65d:      	vpxor	xmm2, xmm2, xmm2
  30e661:      	vpxor	xmm4, xmm4, xmm4
  30e665:      	vmovdqa64	zmmword ptr [rsp], zmm4
  30e66c:      	vmovdqa64	zmmword ptr [rsp + 0x40], zmm2
  30e674:      	vmovdqa64	zmmword ptr [rsp + 0x80], zmm1
  30e67c:      	vmovdqa64	zmmword ptr [rsp + 0xc0], zmm3
  30e684:      	mov	qword ptr [rsp + 0x100], rdx
  30e68c:      	mov	qword ptr [rsp + 0x108], rsi
  30e694:      	cmp	rdx, 0x3
  30e698:      	jne	0x30e6d7 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x757>
  30e69a:      	vmovdqu	xmmword ptr [rcx], xmm0
  30e69e:      	movabs	rax, 0x7fffffffffffff00
  30e6a8:      	and	r9, rax
  30e6ab:      	mov	rax, r9
  30e6ae:      	lea	rsp, [rbp - 0x18]
  30e6b2:      	pop	rbx
  30e6b3:      	pop	r14
  30e6b5:      	pop	r15
  30e6b7:      	pop	rbp
  30e6b8:      	vzeroupper
  30e6bb:      	ret
  30e6bc:      	lea	rdi, [rip - 0x202320]   # 0x10c3a3 <anon.8182237a801038de36885de64d2c176c.5.llvm.10465402473772549265>
  30e6c3:      	lea	rcx, [rip + 0x4f6226]   # 0x8048f0 <anon.8182237a801038de36885de64d2c176c.1.llvm.10465402473772549265>
  30e6ca:      	mov	esi, 0x237
  30e6cf:      	xor	edx, edx
  30e6d1:      	call	qword ptr [rip + 0x5696a9] # 0x877d80 <sdallocx+0x877d80>
  30e6d7:      	lea	rsi, [rsp + 0x100]
  30e6df:      	lea	rdx, [rip - 0x2635c6]   # 0xab120 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.13.llvm.14024894901458550281+0x40>
  30e6e6:      	lea	rcx, [rip - 0x1eb82d]   # 0x122ec0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd8b8>
  30e6ed:      	lea	r9, [rip + 0x4f6a34]    # 0x805128 <anon.8f767f2a79b26510ef523e501c99a207.8.llvm.4603560004070794364+0x80>
  30e6f4:      	mov	r8d, 0x29
  30e6fa:      	xor	edi, edi
  30e6fc:      	vzeroupper
  30e6ff:      	call	qword ptr [rip + 0x568963] # 0x877068 <sdallocx+0x877068>
  30e705:      	lea	rdx, [rip + 0x4f6a34]   # 0x805140 <anon.8f767f2a79b26510ef523e501c99a207.8.llvm.4603560004070794364+0x98>
  30e70c:      	mov	esi, 0xc
  30e711:      	mov	rdi, rax
  30e714:      	vzeroupper
  30e717:      	call	qword ptr [rip + 0x5688a3] # 0x876fc0 <sdallocx+0x876fc0>
  30e71d:      	lea	rdx, [rip + 0x4f6a1c]   # 0x805140 <anon.8f767f2a79b26510ef523e501c99a207.8.llvm.4603560004070794364+0x98>
  30e724:      	mov	esi, 0xc
  30e729:      	vzeroupper
  30e72c:      	call	qword ptr [rip + 0x56888e] # 0x876fc0 <sdallocx+0x876fc0>
  30e732:      	int3
  30e733:      	int3
  30e734:      	int3
  30e735:      	int3
  30e736:      	int3
  30e737:      	int3
  30e738:      	int3
  30e739:      	int3
  30e73a:      	int3
  30e73b:      	int3
  30e73c:      	int3
  30e73d:      	int3
  30e73e:      	int3
  30e73f:      	int3
