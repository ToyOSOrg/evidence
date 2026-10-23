
stage/probe-full-ec76bb2a7:	file format elf64-x86-64

Disassembly of section .text:

000000000030ddd0 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>>:
  30ddd0:      	push	rbp
  30ddd1:      	mov	rbp, rsp
  30ddd4:      	and	rsp, -0x40
  30ddd8:      	sub	rsp, 0x1c0
  30dddf:      	vxorps	xmm0, xmm0, xmm0
  30dde3:      	vmovaps	xmmword ptr [rsp], xmm0
  30dde8:      	mov	rax, rsp
  30ddeb:      	mov	r10, rdx
  30ddee:      	sub	r10, rax
  30ddf1:      	sub	rax, rdx
  30ddf4:      	cmovb	rax, r10
  30ddf8:      	cmp	rax, 0xb
  30ddfc:      	jbe	0x30e513 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x743>
  30de02:      	mov	eax, dword ptr [rdx + 0x8]
  30de05:      	mov	dword ptr [rsp + 0x8], eax
  30de09:      	mov	rax, qword ptr [rdx]
  30de0c:      	mov	qword ptr [rsp], rax
  30de10:      	vmovdqu	xmm0, xmmword ptr [rcx]
  30de14:      	mov	r10, r9
  30de17:      	shr	r10, 0x8
  30de1b:      	vpshufb	xmm12, xmm0, xmmword ptr [rip - 0x261b64] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  30de24:      	movabs	rdx, 0x5555555555555556
  30de2e:      	mov	rax, r10
  30de31:      	mul	rdx
  30de34:      	lea	rax, [rdx + 2*rdx]
  30de38:      	mov	rdx, r10
  30de3b:      	sub	rdx, rax
  30de3e:      	mov	eax, 0x3
  30de43:      	cmovne	rax, rdx
  30de47:      	test	r10, r10
  30de4a:      	je	0x30e440 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x670>
  30de50:      	vbroadcasti32x4	zmm0, xmmword ptr [rsp] # zmm0 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30de57:      	vbroadcasti32x4	zmm2, xmmword ptr [rdi] # zmm2 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30de5d:      	vbroadcasti32x4	zmm3, xmmword ptr [rdi + 0xa0] # zmm3 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30de64:      	vmovdqa64	zmmword ptr [rsp + 0x140], zmm0
  30de6c:      	vpord	zmm21, zmm0, zmmword ptr [rip - 0x1eb7b6] # 0x1226c0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd0b8>
  30de76:      	vbroadcasti32x4	zmm4, xmmword ptr [rdi + 0x10] # zmm4 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30de7d:      	vbroadcasti32x4	zmm5, xmmword ptr [rdi + 0x20] # zmm5 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30de84:      	vbroadcasti32x4	zmm7, xmmword ptr [rdi + 0x30] # zmm7 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30de8b:      	vbroadcasti32x4	zmm8, xmmword ptr [rdi + 0x40] # zmm8 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30de92:      	vbroadcasti32x4	zmm9, xmmword ptr [rdi + 0x50] # zmm9 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30de99:      	vbroadcasti32x4	zmm10, xmmword ptr [rdi + 0x60] # zmm10 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30dea0:      	vbroadcasti32x4	zmm11, xmmword ptr [rdi + 0x70] # zmm11 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30dea7:      	vbroadcasti32x4	zmm13, xmmword ptr [rdi + 0x80] # zmm13 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30deae:      	vbroadcasti32x4	zmm14, xmmword ptr [rdi + 0x90] # zmm14 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30deb5:      	add	r8, 0xc0
  30debc:      	shl	r10, 0x4
  30dec0:      	vpxord	xmm20, xmm20, xmm20
  30dec6:      	xor	edx, edx
  30dec8:      	vpxord	xmm25, xmm25, xmm25
  30dece:      	vpxord	xmm26, xmm26, xmm26
  30ded4:      	vpxord	xmm28, xmm28, xmm28
  30deda:      	vpxord	xmm19, xmm19, xmm19
  30dee0:      	vpxord	xmm17, xmm17, xmm17
  30dee6:      	vpxord	xmm24, xmm24, xmm24
  30deec:      	jmp	0x30e071 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x2a1>
  30def1:      	nop	word ptr cs:[rax + rax]
  30df00:      	vpxord	zmm1, zmm27, zmm2
  30df06:      	vpxord	zmm6, zmm15, zmm2
  30df0c:      	vpxord	zmm15, zmm16, zmm2
  30df12:      	vpxord	zmm16, zmm18, zmm2
  30df18:      	vaesenc	zmm1, zmm1, zmm4
  30df1e:      	vaesenc	zmm6, zmm6, zmm4
  30df24:      	vaesenc	zmm15, zmm15, zmm4
  30df2a:      	vaesenc	zmm16, zmm16, zmm4
  30df30:      	vaesenc	zmm1, zmm1, zmm5
  30df36:      	vaesenc	zmm6, zmm6, zmm5
  30df3c:      	vaesenc	zmm15, zmm15, zmm5
  30df42:      	vaesenc	zmm16, zmm16, zmm5
  30df48:      	vaesenc	zmm1, zmm1, zmm7
  30df4e:      	vaesenc	zmm6, zmm6, zmm7
  30df54:      	vaesenc	zmm15, zmm15, zmm7
  30df5a:      	vaesenc	zmm16, zmm16, zmm7
  30df60:      	vaesenc	zmm1, zmm1, zmm8
  30df66:      	vaesenc	zmm6, zmm6, zmm8
  30df6c:      	vaesenc	zmm15, zmm15, zmm8
  30df72:      	vaesenc	zmm16, zmm16, zmm8
  30df78:      	vaesenc	zmm1, zmm1, zmm9
  30df7e:      	vaesenc	zmm6, zmm6, zmm9
  30df84:      	vaesenc	zmm15, zmm15, zmm9
  30df8a:      	vaesenc	zmm16, zmm16, zmm9
  30df90:      	vaesenc	zmm1, zmm1, zmm10
  30df96:      	vaesenc	zmm6, zmm6, zmm10
  30df9c:      	vaesenc	zmm15, zmm15, zmm10
  30dfa2:      	vaesenc	zmm16, zmm16, zmm10
  30dfa8:      	vaesenc	zmm1, zmm1, zmm11
  30dfae:      	vaesenc	zmm6, zmm6, zmm11
  30dfb4:      	vaesenc	zmm15, zmm15, zmm11
  30dfba:      	vaesenc	zmm16, zmm16, zmm11
  30dfc0:      	vaesenc	zmm1, zmm1, zmm13
  30dfc6:      	vaesenc	zmm6, zmm6, zmm13
  30dfcc:      	vaesenc	zmm15, zmm15, zmm13
  30dfd2:      	vaesenc	zmm16, zmm16, zmm13
  30dfd8:      	vaesenc	zmm1, zmm1, zmm14
  30dfde:      	vaesenc	zmm6, zmm6, zmm14
  30dfe4:      	vaesenc	zmm15, zmm15, zmm14
  30dfea:      	vaesenc	zmm16, zmm16, zmm14
  30dff0:      	vaesenclast	zmm1, zmm1, zmm3
  30dff6:      	vpxorq	zmm0, zmm1, zmm0
  30dffc:      	vmovdqu64	zmmword ptr [r8 - 0xc0], zmm0
  30e003:      	vaesenclast	zmm1, zmm6, zmm3
  30e009:      	vpxorq	zmm1, zmm1, zmm31
  30e00f:      	vmovdqu64	zmmword ptr [r8 - 0x80], zmm1
  30e016:      	vaesenclast	zmm6, zmm15, zmm3
  30e01c:      	vpxorq	zmm6, zmm6, zmm30
  30e022:      	vmovdqu64	zmmword ptr [r8 - 0x40], zmm6
  30e029:      	vaesenclast	zmm15, zmm16, zmm3
  30e02f:      	vpxorq	zmm15, zmm15, zmm29
  30e035:      	vmovdqu64	zmmword ptr [r8], zmm15
  30e03b:      	vmovdqa64	zmm16, zmmword ptr [rip - 0x1eb7c5] # 0x122880 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd278>
  30e045:      	vpshufb	zmm19, zmm0, zmm16
  30e04b:      	vpshufb	zmm28, zmm1, zmm16
  30e051:      	vpshufb	zmm26, zmm6, zmm16
  30e057:      	vpshufb	zmm25, zmm15, zmm16
  30e05d:      	add	rdx, 0x10
  30e061:      	add	r8, 0x100
  30e068:      	cmp	r10, rdx
  30e06b:      	je	0x30e31b <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x54b>
  30e071:      	vmovdqa64	zmm27, zmm21
  30e077:      	lea	edi, [rdx + 0x2]
  30e07a:      	and	edi, 0xfe
  30e080:      	cmp	edi, 0xed
  30e086:      	jae	0x30e0c0 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x2f0>
  30e088:      	vpaddd	zmm21, zmm27, zmmword ptr [rip - 0x1eb912] # 0x122780 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd178>
  30e092:      	vpaddd	zmm15, zmm27, zmmword ptr [rip - 0x1eb8dc] # 0x1227c0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd1b8>
  30e09c:      	vpaddd	zmm16, zmm27, zmmword ptr [rip - 0x1eb8a6] # 0x122800 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd1f8>
  30e0a6:      	vpaddd	zmm18, zmm27, zmmword ptr [rip - 0x1eb870] # 0x122840 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd238>
  30e0b0:      	jmp	0x30e149 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x379>
  30e0b5:      	nop	word ptr cs:[rax + rax]
  30e0c0:      	lea	rdi, [rdx + 0x12]
  30e0c4:      	vpbroadcastd	zmm0, edi
  30e0ca:      	vmovdqa64	zmm6, zmmword ptr [rip - 0x1eb9d4] # 0x122700 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd0f8>
  30e0d4:      	vpaddd	zmm0, zmm0, zmm6
  30e0da:      	vmovdqa64	zmm18, zmmword ptr [rip - 0x1eb9a4] # 0x122740 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd138>
  30e0e4:      	vpshufb	zmm0, zmm0, zmm18
  30e0ea:      	vmovdqa64	zmm1, zmmword ptr [rsp + 0x140]
  30e0f2:      	vpord	zmm21, zmm1, zmm0
  30e0f8:      	lea	edi, [rdx + 0x6]
  30e0fb:      	vpbroadcastd	zmm0, edi
  30e101:      	vpaddd	zmm0, zmm0, zmm6
  30e107:      	vpshufb	zmm0, zmm0, zmm18
  30e10d:      	vpord	zmm15, zmm1, zmm0
  30e113:      	lea	edi, [rdx + 0xa]
  30e116:      	vpbroadcastd	zmm0, edi
  30e11c:      	vpaddd	zmm0, zmm0, zmm6
  30e122:      	vpshufb	zmm0, zmm0, zmm18
  30e128:      	vpord	zmm16, zmm1, zmm0
  30e12e:      	lea	edi, [rdx + 0xe]
  30e131:      	vpbroadcastd	zmm0, edi
  30e137:      	vpaddd	zmm0, zmm0, zmm6
  30e13d:      	vpshufb	zmm0, zmm0, zmm18
  30e143:      	vpord	zmm18, zmm1, zmm0
  30e149:      	vmovdqu64	zmm0, zmmword ptr [r8 - 0xc0]
  30e150:      	vmovdqu64	zmm31, zmmword ptr [r8 - 0x80]
  30e157:      	vmovdqu64	zmm30, zmmword ptr [r8 - 0x40]
  30e15e:      	vmovdqu64	zmm29, zmmword ptr [r8]
  30e164:      	test	rdx, rdx
  30e167:      	je	0x30df00 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x130>
  30e16d:      	mov	r11, rax
  30e170:      	shl	r11, 0x4
  30e174:      	mov	edi, 0x30
  30e179:      	sub	edi, r11d
  30e17c:      	shr	edi, 0x2
  30e17f:      	test	rax, rax
  30e182:      	je	0x30e55c <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x78c>
  30e188:      	vpxorq	zmm12, zmm12, zmm19
  30e18e:      	shl	rdi, 0x6
  30e192:      	vmovdqu64	zmm19, zmmword ptr [rsi + rdi]
  30e199:      	mov	edi, 0x34
  30e19e:      	sub	edi, r11d
  30e1a1:      	shr	edi, 0x2
  30e1a4:      	shl	rdi, 0x6
  30e1a8:      	vmovdqu64	zmm22, zmmword ptr [rsi + rdi]
  30e1af:      	vpclmulqdq	zmm23, zmm12, zmm19, 0x0
  30e1b6:      	vpclmulqdq	zmm1, zmm28, zmm22, 0x0
  30e1bd:      	vmovdqa64	zmm6, zmm20
  30e1c3:      	vpternlogq	zmm6, zmm23, zmm1, 0x96 # zmm6 = zmm6 ^ zmm23 ^ zmm1
  30e1ca:      	vpclmulqdq	zmm1, zmm12, zmm19, 0x11
  30e1d1:      	vpclmulqdq	zmm20, zmm28, zmm22, 0x11
  30e1d8:      	vmovdqa64	zmm23, zmm17
  30e1de:      	vpternlogq	zmm23, zmm1, zmm20, 0x96 # zmm23 = zmm23 ^ zmm1 ^ zmm20
  30e1e5:      	vpclmulqdq	zmm1, zmm12, zmm19, 0x1
  30e1ec:      	vpclmulqdq	zmm12, zmm12, zmm19, 0x10
  30e1f3:      	vpternlogq	zmm24, zmm1, zmm12, 0x96 # zmm24 = zmm24 ^ zmm1 ^ zmm12
  30e1fa:      	vpclmulqdq	zmm1, zmm28, zmm22, 0x1
  30e201:      	vpclmulqdq	zmm12, zmm28, zmm22, 0x10
  30e208:      	vpternlogq	zmm12, zmm24, zmm1, 0x96 # zmm12 = zmm12 ^ zmm24 ^ zmm1
  30e20f:      	mov	edi, 0x38
  30e214:      	sub	edi, r11d
  30e217:      	shr	edi, 0x2
  30e21a:      	shl	rdi, 0x6
  30e21e:      	vmovdqu64	zmm1, zmmword ptr [rsi + rdi]
  30e225:      	mov	edi, 0x3c
  30e22a:      	sub	edi, r11d
  30e22d:      	shr	edi, 0x2
  30e230:      	shl	rdi, 0x6
  30e234:      	vmovdqu64	zmm19, zmmword ptr [rsi + rdi]
  30e23b:      	vpclmulqdq	zmm17, zmm26, zmm1, 0x0
  30e242:      	vpclmulqdq	zmm20, zmm25, zmm19, 0x0
  30e249:      	vpternlogq	zmm20, zmm6, zmm17, 0x96 # zmm20 = zmm20 ^ zmm6 ^ zmm17
  30e250:      	vpclmulqdq	zmm6, zmm26, zmm1, 0x11
  30e257:      	vpclmulqdq	zmm17, zmm25, zmm19, 0x11
  30e25e:      	vpternlogq	zmm17, zmm23, zmm6, 0x96 # zmm17 = zmm17 ^ zmm23 ^ zmm6
  30e265:      	vpclmulqdq	zmm6, zmm26, zmm1, 0x1
  30e26c:      	vpclmulqdq	zmm1, zmm26, zmm1, 0x10
  30e273:      	vpternlogq	zmm1, zmm12, zmm6, 0x96 # zmm1 = zmm1 ^ zmm12 ^ zmm6
  30e27a:      	vpclmulqdq	zmm6, zmm25, zmm19, 0x1
  30e281:      	vpclmulqdq	zmm24, zmm25, zmm19, 0x10
  30e288:      	vpternlogq	zmm24, zmm1, zmm6, 0x96 # zmm24 = zmm24 ^ zmm1 ^ zmm6
  30e28f:      	vpxor	xmm12, xmm12, xmm12
  30e294:      	dec	rax
  30e297:      	jne	0x30df00 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x130>
  30e29d:      	vpslldq	zmm1, zmm24, 0x8        # zmm1 = zero,zero,zero,zero,zero,zero,zero,zero,zmm24[0,1,2,3,4,5,6,7],zero,zero,zero,zero,zero,zero,zero,zero,zmm24[16,17,18,19,20,21,22,23],zero,zero,zero,zero,zero,zero,zero,zero,zmm24[32,33,34,35,36,37,38,39],zero,zero,zero,zero,zero,zero,zero,zero,zmm24[48,49,50,51,52,53,54,55]
  30e2a4:      	vpxord	zmm1, zmm1, zmm20
  30e2aa:      	vpsrldq	zmm6, zmm24, 0x8        # zmm6 = zmm24[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero,zmm24[24,25,26,27,28,29,30,31],zero,zero,zero,zero,zero,zero,zero,zero,zmm24[40,41,42,43,44,45,46,47],zero,zero,zero,zero,zero,zero,zero,zero,zmm24[56,57,58,59,60,61,62,63],zero,zero,zero,zero,zero,zero,zero,zero
  30e2b1:      	vpxorq	zmm6, zmm17, zmm6
  30e2b7:      	vpshufd	zmm12, zmm1, 0x4e       # zmm12 = zmm1[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30e2be:      	vpbroadcastq	zmm17, qword ptr [rip - 0x263298] # 0xab030 <sdallocx+0xab030>
  30e2c8:      	vpclmulqdq	zmm1, zmm1, zmm17, 0x0
  30e2cf:      	vpxorq	zmm1, zmm1, zmm12
  30e2d5:      	vpshufd	zmm12, zmm1, 0x4e       # zmm12 = zmm1[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30e2dc:      	vpclmulqdq	zmm1, zmm1, zmm17, 0x0
  30e2e3:      	vpternlogq	zmm1, zmm6, zmm12, 0x96 # zmm1 = zmm1 ^ zmm6 ^ zmm12
  30e2ea:      	vextracti64x4	ymm6, zmm1, 0x1
  30e2f1:      	vpxor	ymm1, ymm6, ymm1
  30e2f5:      	vextracti128	xmm6, ymm1, 0x1
  30e2fb:      	vpxor	xmm12, xmm6, xmm1
  30e2ff:      	vpxord	xmm24, xmm24, xmm24
  30e305:      	mov	eax, 0x3
  30e30a:      	vpxord	xmm17, xmm17, xmm17
  30e310:      	vpxord	xmm20, xmm20, xmm20
  30e316:      	jmp	0x30df00 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x130>
  30e31b:      	mov	rdx, rax
  30e31e:      	shl	rdx, 0x4
  30e322:      	mov	edi, 0x30
  30e327:      	sub	edi, edx
  30e329:      	shr	edi, 0x2
  30e32c:      	test	rax, rax
  30e32f:      	je	0x30e55c <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x78c>
  30e335:      	vpxorq	zmm0, zmm12, zmm19
  30e33b:      	shl	rdi, 0x6
  30e33f:      	vmovdqu64	zmm1, zmmword ptr [rsi + rdi]
  30e346:      	mov	edi, 0x34
  30e34b:      	sub	edi, edx
  30e34d:      	shr	edi, 0x2
  30e350:      	shl	rdi, 0x6
  30e354:      	vmovdqu64	zmm2, zmmword ptr [rsi + rdi]
  30e35b:      	vpclmulqdq	zmm3, zmm0, zmm1, 0x0
  30e362:      	vpclmulqdq	zmm4, zmm28, zmm2, 0x0
  30e369:      	vpternlogq	zmm20, zmm3, zmm4, 0x96 # zmm20 = zmm20 ^ zmm3 ^ zmm4
  30e370:      	vpclmulqdq	zmm3, zmm0, zmm1, 0x11
  30e377:      	vpclmulqdq	zmm4, zmm28, zmm2, 0x11
  30e37e:      	vpternlogq	zmm17, zmm3, zmm4, 0x96 # zmm17 = zmm17 ^ zmm3 ^ zmm4
  30e385:      	vpclmulqdq	zmm3, zmm0, zmm1, 0x1
  30e38c:      	vpclmulqdq	zmm0, zmm0, zmm1, 0x10
  30e393:      	vpternlogq	zmm24, zmm3, zmm0, 0x96 # zmm24 = zmm24 ^ zmm3 ^ zmm0
  30e39a:      	vpclmulqdq	zmm0, zmm28, zmm2, 0x1
  30e3a1:      	vpclmulqdq	zmm1, zmm28, zmm2, 0x10
  30e3a8:      	vpternlogq	zmm1, zmm24, zmm0, 0x96 # zmm1 = zmm1 ^ zmm24 ^ zmm0
  30e3af:      	mov	edi, 0x38
  30e3b4:      	sub	edi, edx
  30e3b6:      	shr	edi, 0x2
  30e3b9:      	shl	rdi, 0x6
  30e3bd:      	vmovdqu64	zmm0, zmmword ptr [rsi + rdi]
  30e3c4:      	mov	edi, 0x3c
  30e3c9:      	sub	edi, edx
  30e3cb:      	shr	edi, 0x2
  30e3ce:      	shl	rdi, 0x6
  30e3d2:      	vmovdqu64	zmm4, zmmword ptr [rsi + rdi]
  30e3d9:      	vpclmulqdq	zmm2, zmm26, zmm0, 0x0
  30e3e0:      	vpclmulqdq	zmm3, zmm25, zmm4, 0x0
  30e3e7:      	vpternlogq	zmm3, zmm20, zmm2, 0x96 # zmm3 = zmm3 ^ zmm20 ^ zmm2
  30e3ee:      	vpclmulqdq	zmm5, zmm26, zmm0, 0x11
  30e3f5:      	vpclmulqdq	zmm2, zmm25, zmm4, 0x11
  30e3fc:      	vpternlogq	zmm2, zmm17, zmm5, 0x96 # zmm2 = zmm2 ^ zmm17 ^ zmm5
  30e403:      	vpclmulqdq	zmm5, zmm26, zmm0, 0x1
  30e40a:      	vpclmulqdq	zmm0, zmm26, zmm0, 0x10
  30e411:      	vpternlogq	zmm0, zmm1, zmm5, 0x96 # zmm0 = zmm0 ^ zmm1 ^ zmm5
  30e418:      	vpclmulqdq	zmm5, zmm25, zmm4, 0x1
  30e41f:      	vpclmulqdq	zmm1, zmm25, zmm4, 0x10
  30e426:      	vpternlogq	zmm1, zmm0, zmm5, 0x96 # zmm1 = zmm1 ^ zmm0 ^ zmm5
  30e42d:      	dec	rax
  30e430:      	je	0x30e446 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x676>
  30e432:      	vpxor	xmm12, xmm12, xmm12
  30e437:      	vpxor	xmm0, xmm0, xmm0
  30e43b:      	jmp	0x30e4c2 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x6f2>
  30e440:      	vpxor	xmm1, xmm1, xmm1
  30e444:      	jmp	0x30e4ba <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x6ea>
  30e446:      	vpslldq	zmm0, zmm1, 0x8         # zmm0 = zero,zero,zero,zero,zero,zero,zero,zero,zmm1[0,1,2,3,4,5,6,7],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[16,17,18,19,20,21,22,23],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[32,33,34,35,36,37,38,39],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[48,49,50,51,52,53,54,55]
  30e44d:      	vpxord	zmm0, zmm0, zmm3
  30e453:      	vpsrldq	zmm1, zmm1, 0x8         # zmm1 = zmm1[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[24,25,26,27,28,29,30,31],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[40,41,42,43,44,45,46,47],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[56,57,58,59,60,61,62,63],zero,zero,zero,zero,zero,zero,zero,zero
  30e45a:      	vpxorq	zmm1, zmm2, zmm1
  30e460:      	vpshufd	zmm2, zmm0, 0x4e        # zmm2 = zmm0[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30e467:      	vpbroadcastq	zmm3, qword ptr [rip - 0x263441] # 0xab030 <sdallocx+0xab030>
  30e471:      	vpclmulqdq	zmm0, zmm0, zmm3, 0x0
  30e478:      	vpxorq	zmm0, zmm0, zmm2
  30e47e:      	vpshufd	zmm2, zmm0, 0x4e        # zmm2 = zmm0[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30e485:      	vpclmulqdq	zmm0, zmm0, zmm3, 0x0
  30e48c:      	vpternlogq	zmm0, zmm1, zmm2, 0x96 # zmm0 = zmm0 ^ zmm1 ^ zmm2
  30e493:      	vextracti64x4	ymm1, zmm0, 0x1
  30e49a:      	vpxor	ymm0, ymm1, ymm0
  30e49e:      	vextracti128	xmm1, ymm0, 0x1
  30e4a4:      	vpxor	xmm12, xmm1, xmm0
  30e4a8:      	vpshufb	xmm0, xmm12, xmmword ptr [rip - 0x2621f1] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  30e4b1:      	vpxor	xmm1, xmm1, xmm1
  30e4b5:      	mov	eax, 0x3
  30e4ba:      	vpxor	xmm2, xmm2, xmm2
  30e4be:      	vpxor	xmm3, xmm3, xmm3
  30e4c2:      	vmovdqa64	zmmword ptr [rsp], zmm3
  30e4c9:      	vmovdqa64	zmmword ptr [rsp + 0x40], zmm2
  30e4d1:      	vmovdqa64	zmmword ptr [rsp + 0x80], zmm1
  30e4d9:      	vmovdqa64	zmmword ptr [rsp + 0xc0], zmm12
  30e4e1:      	mov	qword ptr [rsp + 0x100], rax
  30e4e9:      	mov	qword ptr [rsp + 0x108], rsi
  30e4f1:      	cmp	rax, 0x3
  30e4f5:      	jne	0x30e52e <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>+0x75e>
  30e4f7:      	vmovdqu	xmmword ptr [rcx], xmm0
  30e4fb:      	movabs	rax, 0x7fffffffffffff00
  30e505:      	and	r9, rax
  30e508:      	mov	rax, r9
  30e50b:      	mov	rsp, rbp
  30e50e:      	pop	rbp
  30e50f:      	vzeroupper
  30e512:      	ret
  30e513:      	lea	rdi, [rip - 0x202177]   # 0x10c3a3 <anon.8182237a801038de36885de64d2c176c.5.llvm.10465402473772549265>
  30e51a:      	lea	rcx, [rip + 0x4f6b4f]   # 0x805070 <anon.8182237a801038de36885de64d2c176c.1.llvm.10465402473772549265>
  30e521:      	mov	esi, 0x237
  30e526:      	xor	edx, edx
  30e528:      	call	qword ptr [rip + 0x56a012] # 0x878540 <sdallocx+0x878540>
  30e52e:      	lea	rsi, [rsp + 0x100]
  30e536:      	lea	rdx, [rip - 0x26341d]   # 0xab120 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.13.llvm.14024894901458550281+0x40>
  30e53d:      	lea	rcx, [rip - 0x1eb684]   # 0x122ec0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd8b8>
  30e544:      	lea	r9, [rip + 0x4f73a5]    # 0x8058f0 <anon.f91301331f2ac3e3eb2ad538a87aa794.7.llvm.3388403078394314149+0x30>
  30e54b:      	mov	r8d, 0x29
  30e551:      	xor	edi, edi
  30e553:      	vzeroupper
  30e556:      	call	qword ptr [rip + 0x5692cc] # 0x877828 <sdallocx+0x877828>
  30e55c:      	lea	rdx, [rip + 0x4f73a5]   # 0x805908 <anon.f91301331f2ac3e3eb2ad538a87aa794.7.llvm.3388403078394314149+0x48>
  30e563:      	mov	esi, 0xc
  30e568:      	vzeroupper
  30e56b:      	call	qword ptr [rip + 0x56920f] # 0x877780 <sdallocx+0x877780>
  30e571:      	int3
  30e572:      	int3
  30e573:      	int3
  30e574:      	int3
  30e575:      	int3
  30e576:      	int3
  30e577:      	int3
  30e578:      	int3
  30e579:      	int3
  30e57a:      	int3
  30e57b:      	int3
  30e57c:      	int3
  30e57d:      	int3
  30e57e:      	int3
  30e57f:      	int3
