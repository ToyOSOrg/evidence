
stage/probe-full-7dcf12a5a:	file format elf64-x86-64

Disassembly of section .text:

000000000030ed50 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>>:
  30ed50:      	push	rbp
  30ed51:      	mov	rbp, rsp
  30ed54:      	push	r15
  30ed56:      	push	r14
  30ed58:      	push	rbx
  30ed59:      	and	rsp, -0x40
  30ed5d:      	sub	rsp, 0x180
  30ed64:      	vxorps	xmm0, xmm0, xmm0
  30ed68:      	vmovaps	xmmword ptr [rsp], xmm0
  30ed6d:      	mov	rax, rsp
  30ed70:      	mov	r10, rdx
  30ed73:      	sub	r10, rax
  30ed76:      	sub	rax, rdx
  30ed79:      	cmovb	rax, r10
  30ed7d:      	cmp	rax, 0xb
  30ed81:      	jbe	0x30f4fc <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x7ac>
  30ed87:      	mov	eax, dword ptr [rdx + 0x8]
  30ed8a:      	mov	dword ptr [rsp + 0x8], eax
  30ed8e:      	mov	rax, qword ptr [rdx]
  30ed91:      	mov	qword ptr [rsp], rax
  30ed95:      	vmovdqu	xmm0, xmmword ptr [rcx]
  30ed99:      	mov	r10, r9
  30ed9c:      	shr	r10, 0x8
  30eda0:      	vpshufb	xmm3, xmm0, xmmword ptr [rip - 0x262ae9] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  30eda9:      	movabs	rdx, 0x5555555555555556
  30edb3:      	mov	rax, r10
  30edb6:      	mul	rdx
  30edb9:      	lea	rax, [rdx + 2*rdx]
  30edbd:      	mov	r11, r10
  30edc0:      	sub	r11, rax
  30edc3:      	mov	edx, 0x3
  30edc8:      	cmovne	rdx, r11
  30edcc:      	test	r10, r10
  30edcf:      	je	0x30f42d <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x6dd>
  30edd5:      	vbroadcasti32x4	zmm2, xmmword ptr [rsp] # zmm2 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30eddc:      	vpord	zmm12, zmm2, zmmword ptr [rip - 0x1ec326] # 0x122ac0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd4b8>
  30ede6:      	add	r8, 0xc0
  30eded:      	shl	r10, 0x4
  30edf1:      	vpxor	xmm1, xmm1, xmm1
  30edf5:      	xor	r11d, r11d
  30edf8:      	mov	rbx, rsp
  30edfb:      	vmovdqa64	zmm4, zmmword ptr [rip - 0x1ec285] # 0x122b80 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd578>
  30ee05:      	vmovdqa64	zmm5, zmmword ptr [rip - 0x1ec24f] # 0x122bc0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd5b8>
  30ee0f:      	vmovdqa64	zmm7, zmmword ptr [rip - 0x1ec219] # 0x122c00 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd5f8>
  30ee19:      	vmovdqa64	zmm8, zmmword ptr [rip - 0x1ec1e3] # 0x122c40 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd638>
  30ee23:      	vmovdqa64	zmm9, zmmword ptr [rip - 0x1ec1ad] # 0x122c80 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd678>
  30ee2d:      	vpbroadcastq	zmm0, qword ptr [rip - 0x263e07] # 0xab030 <sdallocx+0xab030>
  30ee37:      	vmovdqa64	zmm10, zmmword ptr [rip - 0x1ec341] # 0x122b00 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd4f8>
  30ee41:      	vmovdqa64	zmm11, zmmword ptr [rip - 0x1ec30b] # 0x122b40 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd538>
  30ee4b:      	vpxor	xmm14, xmm14, xmm14
  30ee50:      	vpxor	xmm15, xmm15, xmm15
  30ee55:      	vpxord	xmm21, xmm21, xmm21
  30ee5b:      	vpxord	xmm25, xmm25, xmm25
  30ee61:      	vpxor	xmm6, xmm6, xmm6
  30ee65:      	vpxor	xmm13, xmm13, xmm13
  30ee6a:      	jmp	0x30f099 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x349>
  30ee6f:      	nop
  30ee70:      	vpxord	zmm14, zmm26, zmm20
  30ee76:      	vpxord	zmm15, zmm26, zmm22
  30ee7c:      	vpxord	zmm20, zmm26, zmm23
  30ee82:      	vpxord	zmm21, zmm26, zmm24
  30ee88:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x10] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30ee8f:      	vaesenc	zmm14, zmm14, zmm22
  30ee95:      	vaesenc	zmm15, zmm15, zmm22
  30ee9b:      	vaesenc	zmm20, zmm20, zmm22
  30eea1:      	vaesenc	zmm21, zmm21, zmm22
  30eea7:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x20] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30eeae:      	vaesenc	zmm14, zmm14, zmm22
  30eeb4:      	vaesenc	zmm15, zmm15, zmm22
  30eeba:      	vaesenc	zmm20, zmm20, zmm22
  30eec0:      	vaesenc	zmm21, zmm21, zmm22
  30eec6:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x30] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30eecd:      	vaesenc	zmm14, zmm14, zmm22
  30eed3:      	vaesenc	zmm15, zmm15, zmm22
  30eed9:      	vaesenc	zmm20, zmm20, zmm22
  30eedf:      	vaesenc	zmm21, zmm21, zmm22
  30eee5:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x40] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30eeec:      	vaesenc	zmm14, zmm14, zmm22
  30eef2:      	vaesenc	zmm15, zmm15, zmm22
  30eef8:      	vaesenc	zmm20, zmm20, zmm22
  30eefe:      	vaesenc	zmm21, zmm21, zmm22
  30ef04:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x50] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30ef0b:      	vaesenc	zmm14, zmm14, zmm22
  30ef11:      	vaesenc	zmm15, zmm15, zmm22
  30ef17:      	vaesenc	zmm20, zmm20, zmm22
  30ef1d:      	vaesenc	zmm21, zmm21, zmm22
  30ef23:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x60] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30ef2a:      	vaesenc	zmm14, zmm14, zmm22
  30ef30:      	vaesenc	zmm15, zmm15, zmm22
  30ef36:      	vaesenc	zmm20, zmm20, zmm22
  30ef3c:      	vaesenc	zmm21, zmm21, zmm22
  30ef42:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x70] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30ef49:      	vaesenc	zmm14, zmm14, zmm22
  30ef4f:      	vaesenc	zmm15, zmm15, zmm22
  30ef55:      	vaesenc	zmm20, zmm20, zmm22
  30ef5b:      	vaesenc	zmm21, zmm21, zmm22
  30ef61:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x80] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30ef68:      	vaesenc	zmm14, zmm14, zmm22
  30ef6e:      	vaesenc	zmm15, zmm15, zmm22
  30ef74:      	vaesenc	zmm20, zmm20, zmm22
  30ef7a:      	vaesenc	zmm21, zmm21, zmm22
  30ef80:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x90] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30ef87:      	vaesenc	zmm14, zmm14, zmm22
  30ef8d:      	vaesenc	zmm15, zmm15, zmm22
  30ef93:      	vaesenc	zmm20, zmm20, zmm22
  30ef99:      	vaesenc	zmm21, zmm21, zmm22
  30ef9f:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0xa0] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30efa6:      	vaesenc	zmm14, zmm14, zmm22
  30efac:      	vaesenc	zmm15, zmm15, zmm22
  30efb2:      	vaesenc	zmm20, zmm20, zmm22
  30efb8:      	vaesenc	zmm21, zmm21, zmm22
  30efbe:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0xb0] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30efc5:      	vaesenc	zmm14, zmm14, zmm22
  30efcb:      	vaesenc	zmm15, zmm15, zmm22
  30efd1:      	vaesenc	zmm20, zmm20, zmm22
  30efd7:      	vaesenc	zmm21, zmm21, zmm22
  30efdd:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0xc0] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30efe4:      	vaesenc	zmm14, zmm14, zmm22
  30efea:      	vaesenc	zmm15, zmm15, zmm22
  30eff0:      	vaesenc	zmm20, zmm20, zmm22
  30eff6:      	vaesenc	zmm21, zmm21, zmm22
  30effc:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0xd0] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f003:      	vaesenc	zmm14, zmm14, zmm22
  30f009:      	vaesenc	zmm15, zmm15, zmm22
  30f00f:      	vaesenc	zmm20, zmm20, zmm22
  30f015:      	vaesenc	zmm21, zmm21, zmm22
  30f01b:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0xe0] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f022:      	vaesenclast	zmm14, zmm14, zmm22
  30f028:      	vpxorq	zmm14, zmm14, zmm19
  30f02e:      	vmovdqu64	zmmword ptr [r8 - 0xc0], zmm14
  30f035:      	vaesenclast	zmm15, zmm15, zmm22
  30f03b:      	vpxorq	zmm15, zmm15, zmm18
  30f041:      	vmovdqu64	zmmword ptr [r8 - 0x80], zmm15
  30f048:      	vaesenclast	zmm18, zmm20, zmm22
  30f04e:      	vpxorq	zmm17, zmm18, zmm17
  30f054:      	vmovdqu64	zmmword ptr [r8 - 0x40], zmm17
  30f05b:      	vaesenclast	zmm18, zmm21, zmm22
  30f061:      	vpxorq	zmm16, zmm18, zmm16
  30f067:      	vmovdqu64	zmmword ptr [r8], zmm16
  30f06d:      	vpshufb	zmm25, zmm14, zmm9
  30f073:      	vpshufb	zmm21, zmm15, zmm9
  30f079:      	vpshufb	zmm15, zmm17, zmm9
  30f07f:      	vpshufb	zmm14, zmm16, zmm9
  30f085:      	add	r11, 0x10
  30f089:      	add	r8, 0x100
  30f090:      	cmp	r10, r11
  30f093:      	je	0x30f30c <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x5bc>
  30f099:      	vmovdqa64	zmm20, zmm12
  30f09f:      	lea	eax, [r11 + 0x2]
  30f0a3:      	mov	qword ptr [rsp], rdi
  30f0a7:      	and	eax, 0xfe
  30f0ac:      	cmp	eax, 0xed
  30f0b1:      	jae	0x30f0d0 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x380>
  30f0b3:      	vpaddd	zmm12, zmm20, zmm4
  30f0b9:      	vpaddd	zmm22, zmm20, zmm5
  30f0bf:      	vpaddd	zmm23, zmm20, zmm7
  30f0c5:      	vpaddd	zmm24, zmm20, zmm8
  30f0cb:      	jmp	0x30f140 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x3f0>
  30f0cd:      	nop	dword ptr [rax]
  30f0d0:      	lea	rax, [r11 + 0x12]
  30f0d4:      	vpbroadcastd	zmm12, eax
  30f0da:      	vpaddd	zmm12, zmm12, zmm10
  30f0e0:      	vpshufb	zmm12, zmm12, zmm11
  30f0e6:      	vpord	zmm12, zmm2, zmm12
  30f0ec:      	lea	eax, [r11 + 0x6]
  30f0f0:      	vpbroadcastd	zmm16, eax
  30f0f6:      	vpaddd	zmm16, zmm16, zmm10
  30f0fc:      	vpshufb	zmm16, zmm16, zmm11
  30f102:      	vpord	zmm22, zmm2, zmm16
  30f108:      	lea	eax, [r11 + 0xa]
  30f10c:      	vpbroadcastd	zmm16, eax
  30f112:      	vpaddd	zmm16, zmm16, zmm10
  30f118:      	vpshufb	zmm16, zmm16, zmm11
  30f11e:      	vpord	zmm23, zmm2, zmm16
  30f124:      	lea	eax, [r11 + 0xe]
  30f128:      	vpbroadcastd	zmm16, eax
  30f12e:      	vpaddd	zmm16, zmm16, zmm10
  30f134:      	vpshufb	zmm16, zmm16, zmm11
  30f13a:      	vpord	zmm24, zmm2, zmm16
  30f140:      	mov	r14, qword ptr [rsp]
  30f144:      	vmovdqu64	zmm19, zmmword ptr [r8 - 0xc0]
  30f14b:      	vmovdqu64	zmm18, zmmword ptr [r8 - 0x80]
  30f152:      	vmovdqu64	zmm17, zmmword ptr [r8 - 0x40]
  30f159:      	vmovdqu64	zmm16, zmmword ptr [r8]
  30f15f:      	vbroadcasti32x4	zmm26, xmmword ptr [r14] # zmm26 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30f165:      	test	r11, r11
  30f168:      	je	0x30ee70 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x120>
  30f16e:      	mov	r15, rdx
  30f171:      	shl	r15, 0x4
  30f175:      	mov	eax, 0x30
  30f17a:      	sub	eax, r15d
  30f17d:      	shr	eax, 0x2
  30f180:      	test	rdx, rdx
  30f183:      	je	0x30f545 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x7f5>
  30f189:      	vpxorq	zmm3, zmm3, zmm25
  30f18f:      	shl	rax, 0x6
  30f193:      	vmovdqu64	zmm25, zmmword ptr [rsi + rax]
  30f19a:      	mov	eax, 0x34
  30f19f:      	sub	eax, r15d
  30f1a2:      	shr	eax, 0x2
  30f1a5:      	shl	rax, 0x6
  30f1a9:      	vmovdqu64	zmm27, zmmword ptr [rsi + rax]
  30f1b0:      	vpclmulqdq	zmm28, zmm3, zmm25, 0x0
  30f1b7:      	vpclmulqdq	zmm29, zmm21, zmm27, 0x0
  30f1be:      	vmovdqa64	zmm30, zmm1
  30f1c4:      	vpternlogq	zmm30, zmm28, zmm29, 0x96 # zmm30 = zmm30 ^ zmm28 ^ zmm29
  30f1cb:      	vpclmulqdq	zmm1, zmm3, zmm25, 0x11
  30f1d2:      	vpclmulqdq	zmm28, zmm21, zmm27, 0x11
  30f1d9:      	vmovdqa64	zmm29, zmm6
  30f1df:      	vpternlogq	zmm29, zmm1, zmm28, 0x96 # zmm29 = zmm29 ^ zmm1 ^ zmm28
  30f1e6:      	vpclmulqdq	zmm1, zmm3, zmm25, 0x1
  30f1ed:      	vpclmulqdq	zmm3, zmm3, zmm25, 0x10
  30f1f4:      	vpternlogq	zmm13, zmm1, zmm3, 0x96 # zmm13 = zmm13 ^ zmm1 ^ zmm3
  30f1fb:      	vpclmulqdq	zmm1, zmm21, zmm27, 0x1
  30f202:      	vpclmulqdq	zmm3, zmm21, zmm27, 0x10
  30f209:      	vpternlogq	zmm3, zmm13, zmm1, 0x96 # zmm3 = zmm3 ^ zmm13 ^ zmm1
  30f210:      	mov	eax, 0x38
  30f215:      	sub	eax, r15d
  30f218:      	shr	eax, 0x2
  30f21b:      	shl	rax, 0x6
  30f21f:      	vmovdqu64	zmm13, zmmword ptr [rsi + rax]
  30f226:      	mov	eax, 0x3c
  30f22b:      	sub	eax, r15d
  30f22e:      	shr	eax, 0x2
  30f231:      	shl	rax, 0x6
  30f235:      	vmovdqu64	zmm21, zmmword ptr [rsi + rax]
  30f23c:      	vpclmulqdq	zmm6, zmm15, zmm13, 0x0
  30f243:      	vpclmulqdq	zmm1, zmm14, zmm21, 0x0
  30f24a:      	vpternlogq	zmm1, zmm30, zmm6, 0x96 # zmm1 = zmm1 ^ zmm30 ^ zmm6
  30f251:      	vpclmulqdq	zmm25, zmm15, zmm13, 0x11
  30f258:      	vpclmulqdq	zmm6, zmm14, zmm21, 0x11
  30f25f:      	vpternlogq	zmm6, zmm29, zmm25, 0x96 # zmm6 = zmm6 ^ zmm29 ^ zmm25
  30f266:      	vpclmulqdq	zmm25, zmm15, zmm13, 0x1
  30f26d:      	vpclmulqdq	zmm15, zmm15, zmm13, 0x10
  30f274:      	vpternlogq	zmm15, zmm3, zmm25, 0x96 # zmm15 = zmm15 ^ zmm3 ^ zmm25
  30f27b:      	vpclmulqdq	zmm3, zmm14, zmm21, 0x1
  30f282:      	vpclmulqdq	zmm13, zmm14, zmm21, 0x10
  30f289:      	vpternlogq	zmm13, zmm15, zmm3, 0x96 # zmm13 = zmm13 ^ zmm15 ^ zmm3
  30f290:      	vpxor	xmm3, xmm3, xmm3
  30f294:      	dec	rdx
  30f297:      	jne	0x30ee70 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x120>
  30f29d:      	vpslldq	zmm3, zmm13, 0x8        # zmm3 = zero,zero,zero,zero,zero,zero,zero,zero,zmm13[0,1,2,3,4,5,6,7],zero,zero,zero,zero,zero,zero,zero,zero,zmm13[16,17,18,19,20,21,22,23],zero,zero,zero,zero,zero,zero,zero,zero,zmm13[32,33,34,35,36,37,38,39],zero,zero,zero,zero,zero,zero,zero,zero,zmm13[48,49,50,51,52,53,54,55]
  30f2a4:      	vpxord	zmm1, zmm3, zmm1
  30f2aa:      	vpsrldq	zmm3, zmm13, 0x8        # zmm3 = zmm13[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero,zmm13[24,25,26,27,28,29,30,31],zero,zero,zero,zero,zero,zero,zero,zero,zmm13[40,41,42,43,44,45,46,47],zero,zero,zero,zero,zero,zero,zero,zero,zmm13[56,57,58,59,60,61,62,63],zero,zero,zero,zero,zero,zero,zero,zero
  30f2b1:      	vpxorq	zmm3, zmm6, zmm3
  30f2b7:      	vpshufd	zmm6, zmm1, 0x4e        # zmm6 = zmm1[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30f2be:      	vpclmulqdq	zmm1, zmm1, zmm0, 0x0
  30f2c5:      	vpxorq	zmm1, zmm1, zmm6
  30f2cb:      	vpshufd	zmm6, zmm1, 0x4e        # zmm6 = zmm1[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30f2d2:      	vpclmulqdq	zmm1, zmm1, zmm0, 0x0
  30f2d9:      	vpternlogq	zmm1, zmm3, zmm6, 0x96 # zmm1 = zmm1 ^ zmm3 ^ zmm6
  30f2e0:      	vextracti64x4	ymm3, zmm1, 0x1
  30f2e7:      	vpxor	ymm1, ymm3, ymm1
  30f2eb:      	vextracti128	xmm3, ymm1, 0x1
  30f2f1:      	vpxor	xmm3, xmm3, xmm1
  30f2f5:      	vpxor	xmm13, xmm13, xmm13
  30f2fa:      	mov	edx, 0x3
  30f2ff:      	vpxor	xmm6, xmm6, xmm6
  30f303:      	vpxor	xmm1, xmm1, xmm1
  30f307:      	jmp	0x30ee70 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x120>
  30f30c:      	mov	rax, rdx
  30f30f:      	shl	rax, 0x4
  30f313:      	mov	edi, 0x30
  30f318:      	sub	edi, eax
  30f31a:      	shr	edi, 0x2
  30f31d:      	test	rdx, rdx
  30f320:      	je	0x30f55d <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x80d>
  30f326:      	vpxorq	zmm2, zmm3, zmm25
  30f32c:      	shl	rdi, 0x6
  30f330:      	vmovdqu64	zmm3, zmmword ptr [rsi + rdi]
  30f337:      	mov	edi, 0x34
  30f33c:      	sub	edi, eax
  30f33e:      	shr	edi, 0x2
  30f341:      	shl	rdi, 0x6
  30f345:      	vmovdqu64	zmm4, zmmword ptr [rsi + rdi]
  30f34c:      	vpclmulqdq	zmm5, zmm2, zmm3, 0x0
  30f353:      	vpclmulqdq	zmm7, zmm21, zmm4, 0x0
  30f35a:      	vpternlogq	zmm1, zmm5, zmm7, 0x96 # zmm1 = zmm1 ^ zmm5 ^ zmm7
  30f361:      	vpclmulqdq	zmm5, zmm2, zmm3, 0x11
  30f368:      	vpclmulqdq	zmm7, zmm21, zmm4, 0x11
  30f36f:      	vpternlogq	zmm6, zmm5, zmm7, 0x96 # zmm6 = zmm6 ^ zmm5 ^ zmm7
  30f376:      	vpclmulqdq	zmm5, zmm2, zmm3, 0x1
  30f37d:      	vpclmulqdq	zmm2, zmm2, zmm3, 0x10
  30f384:      	vpternlogq	zmm13, zmm5, zmm2, 0x96 # zmm13 = zmm13 ^ zmm5 ^ zmm2
  30f38b:      	vpclmulqdq	zmm2, zmm21, zmm4, 0x1
  30f392:      	vpclmulqdq	zmm3, zmm21, zmm4, 0x10
  30f399:      	vpternlogq	zmm3, zmm13, zmm2, 0x96 # zmm3 = zmm3 ^ zmm13 ^ zmm2
  30f3a0:      	mov	edi, 0x38
  30f3a5:      	sub	edi, eax
  30f3a7:      	shr	edi, 0x2
  30f3aa:      	shl	rdi, 0x6
  30f3ae:      	vmovdqu64	zmm5, zmmword ptr [rsi + rdi]
  30f3b5:      	mov	edi, 0x3c
  30f3ba:      	sub	edi, eax
  30f3bc:      	shr	edi, 0x2
  30f3bf:      	shl	rdi, 0x6
  30f3c3:      	vmovdqu64	zmm7, zmmword ptr [rsi + rdi]
  30f3ca:      	vpclmulqdq	zmm2, zmm15, zmm5, 0x0
  30f3d1:      	vpclmulqdq	zmm4, zmm14, zmm7, 0x0
  30f3d8:      	vpternlogq	zmm4, zmm1, zmm2, 0x96 # zmm4 = zmm4 ^ zmm1 ^ zmm2
  30f3df:      	vpclmulqdq	zmm1, zmm15, zmm5, 0x11
  30f3e6:      	vpclmulqdq	zmm2, zmm14, zmm7, 0x11
  30f3ed:      	vpternlogq	zmm2, zmm6, zmm1, 0x96 # zmm2 = zmm2 ^ zmm6 ^ zmm1
  30f3f4:      	vpclmulqdq	zmm1, zmm15, zmm5, 0x1
  30f3fb:      	vpclmulqdq	zmm5, zmm15, zmm5, 0x10
  30f402:      	vpternlogq	zmm5, zmm3, zmm1, 0x96 # zmm5 = zmm5 ^ zmm3 ^ zmm1
  30f409:      	vpclmulqdq	zmm3, zmm14, zmm7, 0x1
  30f410:      	vpclmulqdq	zmm1, zmm14, zmm7, 0x10
  30f417:      	vpternlogq	zmm1, zmm5, zmm3, 0x96 # zmm1 = zmm1 ^ zmm5 ^ zmm3
  30f41e:      	dec	rdx
  30f421:      	je	0x30f433 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x6e3>
  30f423:      	vpxor	xmm3, xmm3, xmm3
  30f427:      	vpxor	xmm0, xmm0, xmm0
  30f42b:      	jmp	0x30f4a5 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x755>
  30f42d:      	vpxor	xmm1, xmm1, xmm1
  30f431:      	jmp	0x30f49d <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x74d>
  30f433:      	vpslldq	zmm3, zmm1, 0x8         # zmm3 = zero,zero,zero,zero,zero,zero,zero,zero,zmm1[0,1,2,3,4,5,6,7],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[16,17,18,19,20,21,22,23],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[32,33,34,35,36,37,38,39],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[48,49,50,51,52,53,54,55]
  30f43a:      	vpxord	zmm3, zmm3, zmm4
  30f440:      	vpsrldq	zmm1, zmm1, 0x8         # zmm1 = zmm1[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[24,25,26,27,28,29,30,31],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[40,41,42,43,44,45,46,47],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[56,57,58,59,60,61,62,63],zero,zero,zero,zero,zero,zero,zero,zero
  30f447:      	vpxorq	zmm1, zmm2, zmm1
  30f44d:      	vpshufd	zmm2, zmm3, 0x4e        # zmm2 = zmm3[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30f454:      	vpclmulqdq	zmm3, zmm3, zmm0, 0x0
  30f45b:      	vpxorq	zmm2, zmm3, zmm2
  30f461:      	vpshufd	zmm3, zmm2, 0x4e        # zmm3 = zmm2[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30f468:      	vpclmulqdq	zmm0, zmm2, zmm0, 0x0
  30f46f:      	vpternlogq	zmm0, zmm1, zmm3, 0x96 # zmm0 = zmm0 ^ zmm1 ^ zmm3
  30f476:      	vextracti64x4	ymm1, zmm0, 0x1
  30f47d:      	vpxor	ymm0, ymm1, ymm0
  30f481:      	vextracti128	xmm1, ymm0, 0x1
  30f487:      	vpxor	xmm3, xmm1, xmm0
  30f48b:      	vpshufb	xmm0, xmm3, xmmword ptr [rip - 0x2631d4] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  30f494:      	vpxor	xmm1, xmm1, xmm1
  30f498:      	mov	edx, 0x3
  30f49d:      	vpxor	xmm2, xmm2, xmm2
  30f4a1:      	vpxor	xmm4, xmm4, xmm4
  30f4a5:      	vmovdqa64	zmmword ptr [rsp], zmm4
  30f4ac:      	vmovdqa64	zmmword ptr [rsp + 0x40], zmm2
  30f4b4:      	vmovdqa64	zmmword ptr [rsp + 0x80], zmm1
  30f4bc:      	vmovdqa64	zmmword ptr [rsp + 0xc0], zmm3
  30f4c4:      	mov	qword ptr [rsp + 0x100], rdx
  30f4cc:      	mov	qword ptr [rsp + 0x108], rsi
  30f4d4:      	cmp	rdx, 0x3
  30f4d8:      	jne	0x30f517 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x7c7>
  30f4da:      	vmovdqu	xmmword ptr [rcx], xmm0
  30f4de:      	movabs	rax, 0x7fffffffffffff00
  30f4e8:      	and	r9, rax
  30f4eb:      	mov	rax, r9
  30f4ee:      	lea	rsp, [rbp - 0x18]
  30f4f2:      	pop	rbx
  30f4f3:      	pop	r14
  30f4f5:      	pop	r15
  30f4f7:      	pop	rbp
  30f4f8:      	vzeroupper
  30f4fb:      	ret
  30f4fc:      	lea	rdi, [rip - 0x203160]   # 0x10c3a3 <anon.8182237a801038de36885de64d2c176c.5.llvm.10465402473772549265>
  30f503:      	lea	rcx, [rip + 0x4f53e6]   # 0x8048f0 <anon.8182237a801038de36885de64d2c176c.1.llvm.10465402473772549265>
  30f50a:      	mov	esi, 0x237
  30f50f:      	xor	edx, edx
  30f511:      	call	qword ptr [rip + 0x568869] # 0x877d80 <sdallocx+0x877d80>
  30f517:      	lea	rsi, [rsp + 0x100]
  30f51f:      	lea	rdx, [rip - 0x264406]   # 0xab120 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.13.llvm.14024894901458550281+0x40>
  30f526:      	lea	rcx, [rip - 0x1ec66d]   # 0x122ec0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd8b8>
  30f52d:      	lea	r9, [rip + 0x4f5bf4]    # 0x805128 <anon.8f767f2a79b26510ef523e501c99a207.8.llvm.4603560004070794364+0x80>
  30f534:      	mov	r8d, 0x29
  30f53a:      	xor	edi, edi
  30f53c:      	vzeroupper
  30f53f:      	call	qword ptr [rip + 0x567b23] # 0x877068 <sdallocx+0x877068>
  30f545:      	lea	rdx, [rip + 0x4f5bf4]   # 0x805140 <anon.8f767f2a79b26510ef523e501c99a207.8.llvm.4603560004070794364+0x98>
  30f54c:      	mov	esi, 0xc
  30f551:      	mov	rdi, rax
  30f554:      	vzeroupper
  30f557:      	call	qword ptr [rip + 0x567a63] # 0x876fc0 <sdallocx+0x876fc0>
  30f55d:      	lea	rdx, [rip + 0x4f5bdc]   # 0x805140 <anon.8f767f2a79b26510ef523e501c99a207.8.llvm.4603560004070794364+0x98>
  30f564:      	mov	esi, 0xc
  30f569:      	vzeroupper
  30f56c:      	call	qword ptr [rip + 0x567a4e] # 0x876fc0 <sdallocx+0x876fc0>
  30f572:      	int3
  30f573:      	int3
  30f574:      	int3
  30f575:      	int3
  30f576:      	int3
  30f577:      	int3
  30f578:      	int3
  30f579:      	int3
  30f57a:      	int3
  30f57b:      	int3
  30f57c:      	int3
  30f57d:      	int3
  30f57e:      	int3
  30f57f:      	int3
