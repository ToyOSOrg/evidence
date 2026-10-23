
stage/probe-full-ec76bb2a7:	file format elf64-x86-64

Disassembly of section .text:

000000000030eb80 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>>:
  30eb80:      	push	rbp
  30eb81:      	mov	rbp, rsp
  30eb84:      	and	rsp, -0x40
  30eb88:      	sub	rsp, 0x2c0
  30eb8f:      	vxorps	xmm0, xmm0, xmm0
  30eb93:      	vmovaps	xmmword ptr [rsp + 0x40], xmm0
  30eb99:      	lea	rax, [rsp + 0x40]
  30eb9e:      	mov	r10, rdx
  30eba1:      	sub	r10, rax
  30eba4:      	sub	rax, rdx
  30eba7:      	cmovb	rax, r10
  30ebab:      	cmp	rax, 0xb
  30ebaf:      	jbe	0x30f39b <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x81b>
  30ebb5:      	mov	eax, dword ptr [rdx + 0x8]
  30ebb8:      	mov	dword ptr [rsp + 0x48], eax
  30ebbc:      	mov	rax, qword ptr [rdx]
  30ebbf:      	mov	qword ptr [rsp + 0x40], rax
  30ebc4:      	vmovdqu	xmm0, xmmword ptr [rcx]
  30ebc8:      	mov	r10, r9
  30ebcb:      	shr	r10, 0x8
  30ebcf:      	vpshufb	xmm25, xmm0, xmmword ptr [rip - 0x262919] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  30ebd9:      	movabs	rdx, 0x5555555555555556
  30ebe3:      	mov	rax, r10
  30ebe6:      	mul	rdx
  30ebe9:      	lea	rax, [rdx + 2*rdx]
  30ebed:      	mov	rdx, r10
  30ebf0:      	sub	rdx, rax
  30ebf3:      	mov	eax, 0x3
  30ebf8:      	cmovne	rax, rdx
  30ebfc:      	test	r10, r10
  30ebff:      	je	0x30f2c4 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x744>
  30ec05:      	vbroadcasti32x4	zmm0, xmmword ptr [rsp + 0x40] # zmm0 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30ec0d:      	vbroadcasti32x4	zmm1, xmmword ptr [rdi] # zmm1 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30ec13:      	vmovdqa64	zmmword ptr [rsp + 0x240], zmm1
  30ec1b:      	vbroadcasti32x4	zmm1, xmmword ptr [rdi + 0xe0] # zmm1 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30ec22:      	vmovdqa64	zmmword ptr [rsp + 0x200], zmm1
  30ec2a:      	vmovdqa64	zmmword ptr [rsp + 0x180], zmm0
  30ec32:      	vpord	zmm31, zmm0, zmmword ptr [rip - 0x1ec17c] # 0x122ac0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd4b8>
  30ec3c:      	vbroadcasti32x4	zmm0, xmmword ptr [rdi + 0x10] # zmm0 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30ec43:      	vmovdqa64	zmmword ptr [rsp + 0x1c0], zmm0
  30ec4b:      	vbroadcasti32x4	zmm5, xmmword ptr [rdi + 0x20] # zmm5 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30ec52:      	vbroadcasti32x4	zmm6, xmmword ptr [rdi + 0x30] # zmm6 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30ec59:      	vbroadcasti32x4	zmm7, xmmword ptr [rdi + 0x40] # zmm7 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30ec60:      	vbroadcasti32x4	zmm8, xmmword ptr [rdi + 0x50] # zmm8 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30ec67:      	vbroadcasti32x4	zmm9, xmmword ptr [rdi + 0x60] # zmm9 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30ec6e:      	vbroadcasti32x4	zmm11, xmmword ptr [rdi + 0x70] # zmm11 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30ec75:      	vbroadcasti32x4	zmm13, xmmword ptr [rdi + 0x80] # zmm13 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30ec7c:      	vbroadcasti32x4	zmm14, xmmword ptr [rdi + 0x90] # zmm14 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30ec83:      	vbroadcasti32x4	zmm15, xmmword ptr [rdi + 0xa0] # zmm15 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30ec8a:      	vbroadcasti32x4	zmm16, xmmword ptr [rdi + 0xb0] # zmm16 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30ec91:      	vbroadcasti32x4	zmm17, xmmword ptr [rdi + 0xc0] # zmm17 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30ec98:      	vbroadcasti32x4	zmm18, xmmword ptr [rdi + 0xd0] # zmm18 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30ec9f:      	add	r8, 0xc0
  30eca6:      	shl	r10, 0x4
  30ecaa:      	vpxord	xmm22, xmm22, xmm22
  30ecb0:      	xor	edx, edx
  30ecb2:      	vpxord	xmm29, xmm29, xmm29
  30ecb8:      	vpxord	xmm30, xmm30, xmm30
  30ecbe:      	vpxord	xmm24, xmm24, xmm24
  30ecc4:      	vpxor	xmm1, xmm1, xmm1
  30ecc8:      	vpxor	xmm0, xmm0, xmm0
  30eccc:      	vmovdqa64	zmmword ptr [rsp], zmm0
  30ecd3:      	vpxord	xmm28, xmm28, xmm28
  30ecd9:      	jmp	0x30ef4f <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x3cf>
  30ecde:      	nop
  30ece0:      	vpslldq	zmm0, zmm28, 0x8        # zmm0 = zero,zero,zero,zero,zero,zero,zero,zero,zmm28[0,1,2,3,4,5,6,7],zero,zero,zero,zero,zero,zero,zero,zero,zmm28[16,17,18,19,20,21,22,23],zero,zero,zero,zero,zero,zero,zero,zero,zmm28[32,33,34,35,36,37,38,39],zero,zero,zero,zero,zero,zero,zero,zero,zmm28[48,49,50,51,52,53,54,55]
  30ece7:      	vpxord	zmm0, zmm0, zmm24
  30eced:      	vpsrldq	zmm1, zmm28, 0x8        # zmm1 = zmm28[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero,zmm28[24,25,26,27,28,29,30,31],zero,zero,zero,zero,zero,zero,zero,zero,zmm28[40,41,42,43,44,45,46,47],zero,zero,zero,zero,zero,zero,zero,zero,zmm28[56,57,58,59,60,61,62,63],zero,zero,zero,zero,zero,zero,zero,zero
  30ecf4:      	vpxorq	zmm1, zmm31, zmm1
  30ecfa:      	vpshufd	zmm10, zmm0, 0x4e       # zmm10 = zmm0[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30ed01:      	vpbroadcastq	zmm19, qword ptr [rip - 0x263cdb] # 0xab030 <sdallocx+0xab030>
  30ed0b:      	vpclmulqdq	zmm0, zmm0, zmm19, 0x0
  30ed12:      	vpxorq	zmm0, zmm0, zmm10
  30ed18:      	vpshufd	zmm10, zmm0, 0x4e       # zmm10 = zmm0[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30ed1f:      	vpclmulqdq	zmm0, zmm0, zmm19, 0x0
  30ed26:      	vpternlogq	zmm0, zmm1, zmm10, 0x96 # zmm0 = zmm0 ^ zmm1 ^ zmm10
  30ed2d:      	vextracti64x4	ymm1, zmm0, 0x1
  30ed34:      	vpxor	ymm0, ymm1, ymm0
  30ed38:      	vextracti128	xmm1, ymm0, 0x1
  30ed3e:      	vpxorq	xmm25, xmm1, xmm0
  30ed44:      	vpxord	xmm28, xmm28, xmm28
  30ed4a:      	mov	eax, 0x3
  30ed4f:      	vpxor	xmm0, xmm0, xmm0
  30ed53:      	vmovdqa64	zmmword ptr [rsp], zmm0
  30ed5a:      	vpxord	xmm22, xmm22, xmm22
  30ed60:      	vmovdqa64	zmm31, zmm20
  30ed66:      	vmovdqa64	zmm19, zmmword ptr [rsp + 0x240]
  30ed6e:      	vpxord	zmm0, zmm21, zmm19
  30ed74:      	vpxord	zmm1, zmm3, zmm19
  30ed7a:      	vpxord	zmm10, zmm4, zmm19
  30ed80:      	vpxord	zmm12, zmm12, zmm19
  30ed86:      	vmovdqa64	zmm3, zmmword ptr [rsp + 0x1c0]
  30ed8e:      	vaesenc	zmm0, zmm0, zmm3
  30ed94:      	vaesenc	zmm1, zmm1, zmm3
  30ed9a:      	vaesenc	zmm10, zmm10, zmm3
  30eda0:      	vaesenc	zmm12, zmm12, zmm3
  30eda6:      	vaesenc	zmm0, zmm0, zmm5
  30edac:      	vaesenc	zmm1, zmm1, zmm5
  30edb2:      	vaesenc	zmm10, zmm10, zmm5
  30edb8:      	vaesenc	zmm12, zmm12, zmm5
  30edbe:      	vaesenc	zmm0, zmm0, zmm6
  30edc4:      	vaesenc	zmm1, zmm1, zmm6
  30edca:      	vaesenc	zmm10, zmm10, zmm6
  30edd0:      	vaesenc	zmm12, zmm12, zmm6
  30edd6:      	vaesenc	zmm0, zmm0, zmm7
  30eddc:      	vaesenc	zmm1, zmm1, zmm7
  30ede2:      	vaesenc	zmm10, zmm10, zmm7
  30ede8:      	vaesenc	zmm12, zmm12, zmm7
  30edee:      	vaesenc	zmm0, zmm0, zmm8
  30edf4:      	vaesenc	zmm1, zmm1, zmm8
  30edfa:      	vaesenc	zmm10, zmm10, zmm8
  30ee00:      	vaesenc	zmm12, zmm12, zmm8
  30ee06:      	vaesenc	zmm0, zmm0, zmm9
  30ee0c:      	vaesenc	zmm1, zmm1, zmm9
  30ee12:      	vaesenc	zmm10, zmm10, zmm9
  30ee18:      	vaesenc	zmm12, zmm12, zmm9
  30ee1e:      	vaesenc	zmm0, zmm0, zmm11
  30ee24:      	vaesenc	zmm1, zmm1, zmm11
  30ee2a:      	vaesenc	zmm10, zmm10, zmm11
  30ee30:      	vaesenc	zmm12, zmm12, zmm11
  30ee36:      	vaesenc	zmm0, zmm0, zmm13
  30ee3c:      	vaesenc	zmm1, zmm1, zmm13
  30ee42:      	vaesenc	zmm10, zmm10, zmm13
  30ee48:      	vaesenc	zmm12, zmm12, zmm13
  30ee4e:      	vaesenc	zmm0, zmm0, zmm14
  30ee54:      	vaesenc	zmm1, zmm1, zmm14
  30ee5a:      	vaesenc	zmm10, zmm10, zmm14
  30ee60:      	vaesenc	zmm12, zmm12, zmm14
  30ee66:      	vaesenc	zmm0, zmm0, zmm15
  30ee6c:      	vaesenc	zmm1, zmm1, zmm15
  30ee72:      	vaesenc	zmm10, zmm10, zmm15
  30ee78:      	vaesenc	zmm12, zmm12, zmm15
  30ee7e:      	vaesenc	zmm0, zmm0, zmm16
  30ee84:      	vaesenc	zmm1, zmm1, zmm16
  30ee8a:      	vaesenc	zmm10, zmm10, zmm16
  30ee90:      	vaesenc	zmm12, zmm12, zmm16
  30ee96:      	vaesenc	zmm0, zmm0, zmm17
  30ee9c:      	vaesenc	zmm1, zmm1, zmm17
  30eea2:      	vaesenc	zmm10, zmm10, zmm17
  30eea8:      	vaesenc	zmm12, zmm12, zmm17
  30eeae:      	vaesenc	zmm0, zmm0, zmm18
  30eeb4:      	vaesenc	zmm1, zmm1, zmm18
  30eeba:      	vaesenc	zmm10, zmm10, zmm18
  30eec0:      	vaesenc	zmm12, zmm12, zmm18
  30eec6:      	vmovdqa64	zmm3, zmmword ptr [rsp + 0x200]
  30eece:      	vaesenclast	zmm0, zmm0, zmm3
  30eed4:      	vpxorq	zmm0, zmm0, zmm2
  30eeda:      	vmovdqu64	zmmword ptr [r8 - 0xc0], zmm0
  30eee1:      	vaesenclast	zmm1, zmm1, zmm3
  30eee7:      	vpxorq	zmm19, zmm1, zmm27
  30eeed:      	vmovdqu64	zmmword ptr [r8 - 0x80], zmm19
  30eef4:      	vaesenclast	zmm1, zmm10, zmm3
  30eefa:      	vpxorq	zmm10, zmm1, zmm26
  30ef00:      	vmovdqu64	zmmword ptr [r8 - 0x40], zmm10
  30ef07:      	vaesenclast	zmm1, zmm12, zmm3
  30ef0d:      	vpxorq	zmm12, zmm1, zmm23
  30ef13:      	vmovdqu64	zmmword ptr [r8], zmm12
  30ef19:      	vmovdqa64	zmm20, zmmword ptr [rip - 0x1ec2a3] # 0x122c80 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd678>
  30ef23:      	vpshufb	zmm1, zmm0, zmm20
  30ef29:      	vpshufb	zmm24, zmm19, zmm20
  30ef2f:      	vpshufb	zmm30, zmm10, zmm20
  30ef35:      	vpshufb	zmm29, zmm12, zmm20
  30ef3b:      	add	rdx, 0x10
  30ef3f:      	add	r8, 0x100
  30ef46:      	cmp	r10, rdx
  30ef49:      	je	0x30f197 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x617>
  30ef4f:      	vmovdqa64	zmm21, zmm31
  30ef55:      	lea	edi, [rdx + 0x2]
  30ef58:      	and	edi, 0xfe
  30ef5e:      	cmp	edi, 0xed
  30ef64:      	jae	0x30efa0 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x420>
  30ef66:      	vpaddd	zmm31, zmm21, zmmword ptr [rip - 0x1ec3f0] # 0x122b80 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd578>
  30ef70:      	vpaddd	zmm3, zmm21, zmmword ptr [rip - 0x1ec3ba] # 0x122bc0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd5b8>
  30ef7a:      	vpaddd	zmm4, zmm21, zmmword ptr [rip - 0x1ec384] # 0x122c00 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd5f8>
  30ef84:      	vpaddd	zmm12, zmm21, zmmword ptr [rip - 0x1ec34e] # 0x122c40 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd638>
  30ef8e:      	jmp	0x30f029 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x4a9>
  30ef93:      	nop	word ptr cs:[rax + rax]
  30efa0:      	lea	rdi, [rdx + 0x12]
  30efa4:      	vpbroadcastd	zmm0, edi
  30efaa:      	vmovdqa64	zmm12, zmmword ptr [rip - 0x1ec4b4] # 0x122b00 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd4f8>
  30efb4:      	vpaddd	zmm0, zmm0, zmm12
  30efba:      	vmovdqa64	zmm19, zmmword ptr [rip - 0x1ec484] # 0x122b40 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd538>
  30efc4:      	vpshufb	zmm0, zmm0, zmm19
  30efca:      	vmovdqa64	zmm10, zmmword ptr [rsp + 0x180]
  30efd2:      	vpord	zmm31, zmm10, zmm0
  30efd8:      	lea	edi, [rdx + 0x6]
  30efdb:      	vpbroadcastd	zmm0, edi
  30efe1:      	vpaddd	zmm0, zmm0, zmm12
  30efe7:      	vpshufb	zmm0, zmm0, zmm19
  30efed:      	vpord	zmm3, zmm10, zmm0
  30eff3:      	lea	edi, [rdx + 0xa]
  30eff6:      	vpbroadcastd	zmm0, edi
  30effc:      	vpaddd	zmm0, zmm0, zmm12
  30f002:      	vpshufb	zmm0, zmm0, zmm19
  30f008:      	vpord	zmm4, zmm10, zmm0
  30f00e:      	lea	edi, [rdx + 0xe]
  30f011:      	vpbroadcastd	zmm0, edi
  30f017:      	vpaddd	zmm0, zmm0, zmm12
  30f01d:      	vpshufb	zmm0, zmm0, zmm19
  30f023:      	vpord	zmm12, zmm10, zmm0
  30f029:      	vmovdqu64	zmm2, zmmword ptr [r8 - 0xc0]
  30f030:      	vmovdqu64	zmm27, zmmword ptr [r8 - 0x80]
  30f037:      	vmovdqu64	zmm26, zmmword ptr [r8 - 0x40]
  30f03e:      	vmovdqu64	zmm23, zmmword ptr [r8]
  30f044:      	test	rdx, rdx
  30f047:      	je	0x30ed66 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x1e6>
  30f04d:      	mov	r11, rax
  30f050:      	shl	r11, 0x4
  30f054:      	mov	edi, 0x30
  30f059:      	sub	edi, r11d
  30f05c:      	shr	edi, 0x2
  30f05f:      	test	rax, rax
  30f062:      	je	0x30f3e4 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x864>
  30f068:      	vmovdqa64	zmm20, zmm31
  30f06e:      	vpxorq	zmm1, zmm25, zmm1
  30f074:      	shl	rdi, 0x6
  30f078:      	vmovdqu64	zmm25, zmmword ptr [rsi + rdi]
  30f07f:      	mov	edi, 0x34
  30f084:      	sub	edi, r11d
  30f087:      	shr	edi, 0x2
  30f08a:      	shl	rdi, 0x6
  30f08e:      	vmovdqu64	zmm19, zmmword ptr [rsi + rdi]
  30f095:      	vpclmulqdq	zmm10, zmm1, zmm25, 0x0
  30f09c:      	vpclmulqdq	zmm31, zmm24, zmm19, 0x0
  30f0a3:      	vpternlogq	zmm22, zmm10, zmm31, 0x96 # zmm22 = zmm22 ^ zmm10 ^ zmm31
  30f0aa:      	vpclmulqdq	zmm10, zmm1, zmm25, 0x11
  30f0b1:      	vpclmulqdq	zmm31, zmm24, zmm19, 0x11
  30f0b8:      	vmovdqa64	zmm0, zmmword ptr [rsp]
  30f0bf:      	vpternlogq	zmm0, zmm10, zmm31, 0x96 # zmm0 = zmm0 ^ zmm10 ^ zmm31
  30f0c6:      	vpclmulqdq	zmm10, zmm1, zmm25, 0x1
  30f0cd:      	vpclmulqdq	zmm1, zmm1, zmm25, 0x10
  30f0d4:      	vpternlogq	zmm28, zmm10, zmm1, 0x96 # zmm28 = zmm28 ^ zmm10 ^ zmm1
  30f0db:      	vpclmulqdq	zmm1, zmm24, zmm19, 0x1
  30f0e2:      	vpclmulqdq	zmm10, zmm24, zmm19, 0x10
  30f0e9:      	vpternlogq	zmm10, zmm28, zmm1, 0x96 # zmm10 = zmm10 ^ zmm28 ^ zmm1
  30f0f0:      	mov	edi, 0x38
  30f0f5:      	sub	edi, r11d
  30f0f8:      	shr	edi, 0x2
  30f0fb:      	shl	rdi, 0x6
  30f0ff:      	vmovdqu64	zmm1, zmmword ptr [rsi + rdi]
  30f106:      	mov	edi, 0x3c
  30f10b:      	sub	edi, r11d
  30f10e:      	shr	edi, 0x2
  30f111:      	shl	rdi, 0x6
  30f115:      	vmovdqu64	zmm19, zmmword ptr [rsi + rdi]
  30f11c:      	vpclmulqdq	zmm24, zmm30, zmm1, 0x0
  30f123:      	vpclmulqdq	zmm25, zmm29, zmm19, 0x0
  30f12a:      	vpternlogq	zmm25, zmm22, zmm24, 0x96 # zmm25 = zmm25 ^ zmm22 ^ zmm24
  30f131:      	vmovdqa64	zmm24, zmm25
  30f137:      	vpclmulqdq	zmm22, zmm30, zmm1, 0x11
  30f13e:      	vpclmulqdq	zmm31, zmm29, zmm19, 0x11
  30f145:      	vpternlogq	zmm31, zmm0, zmm22, 0x96 # zmm31 = zmm31 ^ zmm0 ^ zmm22
  30f14c:      	vpclmulqdq	zmm0, zmm30, zmm1, 0x1
  30f153:      	vpclmulqdq	zmm1, zmm30, zmm1, 0x10
  30f15a:      	vpternlogq	zmm1, zmm10, zmm0, 0x96 # zmm1 = zmm1 ^ zmm10 ^ zmm0
  30f161:      	vpclmulqdq	zmm0, zmm29, zmm19, 0x1
  30f168:      	vpclmulqdq	zmm28, zmm29, zmm19, 0x10
  30f16f:      	vpternlogq	zmm28, zmm1, zmm0, 0x96 # zmm28 = zmm28 ^ zmm1 ^ zmm0
  30f176:      	vpxord	xmm25, xmm25, xmm25
  30f17c:      	dec	rax
  30f17f:      	je	0x30ece0 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x160>
  30f185:      	vmovdqa64	zmmword ptr [rsp], zmm31
  30f18c:      	vmovdqa64	zmm22, zmm24
  30f192:      	jmp	0x30ed60 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x1e0>
  30f197:      	mov	rdx, rax
  30f19a:      	shl	rdx, 0x4
  30f19e:      	mov	edi, 0x30
  30f1a3:      	sub	edi, edx
  30f1a5:      	shr	edi, 0x2
  30f1a8:      	test	rax, rax
  30f1ab:      	je	0x30f3e4 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x864>
  30f1b1:      	vpxorq	zmm0, zmm25, zmm1
  30f1b7:      	shl	rdi, 0x6
  30f1bb:      	vmovdqu64	zmm1, zmmword ptr [rsi + rdi]
  30f1c2:      	mov	edi, 0x34
  30f1c7:      	sub	edi, edx
  30f1c9:      	shr	edi, 0x2
  30f1cc:      	shl	rdi, 0x6
  30f1d0:      	vmovdqu64	zmm2, zmmword ptr [rsi + rdi]
  30f1d7:      	vpclmulqdq	zmm3, zmm0, zmm1, 0x0
  30f1de:      	vpclmulqdq	zmm4, zmm24, zmm2, 0x0
  30f1e5:      	vpternlogq	zmm22, zmm3, zmm4, 0x96 # zmm22 = zmm22 ^ zmm3 ^ zmm4
  30f1ec:      	vpclmulqdq	zmm3, zmm0, zmm1, 0x11
  30f1f3:      	vpclmulqdq	zmm4, zmm24, zmm2, 0x11
  30f1fa:      	vmovdqa64	zmm6, zmmword ptr [rsp]
  30f201:      	vpternlogq	zmm6, zmm3, zmm4, 0x96 # zmm6 = zmm6 ^ zmm3 ^ zmm4
  30f208:      	vpclmulqdq	zmm3, zmm0, zmm1, 0x1
  30f20f:      	vpclmulqdq	zmm0, zmm0, zmm1, 0x10
  30f216:      	vpternlogq	zmm28, zmm3, zmm0, 0x96 # zmm28 = zmm28 ^ zmm3 ^ zmm0
  30f21d:      	vpclmulqdq	zmm0, zmm24, zmm2, 0x1
  30f224:      	vpclmulqdq	zmm1, zmm24, zmm2, 0x10
  30f22b:      	vpternlogq	zmm1, zmm28, zmm0, 0x96 # zmm1 = zmm1 ^ zmm28 ^ zmm0
  30f232:      	mov	edi, 0x38
  30f237:      	sub	edi, edx
  30f239:      	shr	edi, 0x2
  30f23c:      	shl	rdi, 0x6
  30f240:      	vmovdqu64	zmm0, zmmword ptr [rsi + rdi]
  30f247:      	mov	edi, 0x3c
  30f24c:      	sub	edi, edx
  30f24e:      	shr	edi, 0x2
  30f251:      	shl	rdi, 0x6
  30f255:      	vmovdqu64	zmm4, zmmword ptr [rsi + rdi]
  30f25c:      	vpclmulqdq	zmm2, zmm30, zmm0, 0x0
  30f263:      	vpclmulqdq	zmm3, zmm29, zmm4, 0x0
  30f26a:      	vpternlogq	zmm3, zmm22, zmm2, 0x96 # zmm3 = zmm3 ^ zmm22 ^ zmm2
  30f271:      	vpclmulqdq	zmm5, zmm30, zmm0, 0x11
  30f278:      	vpclmulqdq	zmm2, zmm29, zmm4, 0x11
  30f27f:      	vpternlogq	zmm2, zmm6, zmm5, 0x96 # zmm2 = zmm2 ^ zmm6 ^ zmm5
  30f286:      	vpclmulqdq	zmm5, zmm30, zmm0, 0x1
  30f28d:      	vpclmulqdq	zmm0, zmm30, zmm0, 0x10
  30f294:      	vpternlogq	zmm0, zmm1, zmm5, 0x96 # zmm0 = zmm0 ^ zmm1 ^ zmm5
  30f29b:      	vpclmulqdq	zmm5, zmm29, zmm4, 0x1
  30f2a2:      	vpclmulqdq	zmm1, zmm29, zmm4, 0x10
  30f2a9:      	vpternlogq	zmm1, zmm0, zmm5, 0x96 # zmm1 = zmm1 ^ zmm0 ^ zmm5
  30f2b0:      	dec	rax
  30f2b3:      	je	0x30f2ca <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x74a>
  30f2b5:      	vpxord	xmm25, xmm25, xmm25
  30f2bb:      	vpxor	xmm0, xmm0, xmm0
  30f2bf:      	jmp	0x30f349 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x7c9>
  30f2c4:      	vpxor	xmm1, xmm1, xmm1
  30f2c8:      	jmp	0x30f341 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x7c1>
  30f2ca:      	vpslldq	zmm0, zmm1, 0x8         # zmm0 = zero,zero,zero,zero,zero,zero,zero,zero,zmm1[0,1,2,3,4,5,6,7],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[16,17,18,19,20,21,22,23],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[32,33,34,35,36,37,38,39],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[48,49,50,51,52,53,54,55]
  30f2d1:      	vpxord	zmm0, zmm0, zmm3
  30f2d7:      	vpsrldq	zmm1, zmm1, 0x8         # zmm1 = zmm1[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[24,25,26,27,28,29,30,31],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[40,41,42,43,44,45,46,47],zero,zero,zero,zero,zero,zero,zero,zero,zmm1[56,57,58,59,60,61,62,63],zero,zero,zero,zero,zero,zero,zero,zero
  30f2de:      	vpxorq	zmm1, zmm2, zmm1
  30f2e4:      	vpshufd	zmm2, zmm0, 0x4e        # zmm2 = zmm0[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30f2eb:      	vpbroadcastq	zmm3, qword ptr [rip - 0x2642c5] # 0xab030 <sdallocx+0xab030>
  30f2f5:      	vpclmulqdq	zmm0, zmm0, zmm3, 0x0
  30f2fc:      	vpxorq	zmm0, zmm0, zmm2
  30f302:      	vpshufd	zmm2, zmm0, 0x4e        # zmm2 = zmm0[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30f309:      	vpclmulqdq	zmm0, zmm0, zmm3, 0x0
  30f310:      	vpternlogq	zmm0, zmm1, zmm2, 0x96 # zmm0 = zmm0 ^ zmm1 ^ zmm2
  30f317:      	vextracti64x4	ymm1, zmm0, 0x1
  30f31e:      	vpxor	ymm0, ymm1, ymm0
  30f322:      	vextracti128	xmm1, ymm0, 0x1
  30f328:      	vpxorq	xmm25, xmm1, xmm0
  30f32e:      	vpshufb	xmm0, xmm25, xmmword ptr [rip - 0x263078] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  30f338:      	vpxor	xmm1, xmm1, xmm1
  30f33c:      	mov	eax, 0x3
  30f341:      	vpxor	xmm2, xmm2, xmm2
  30f345:      	vpxor	xmm3, xmm3, xmm3
  30f349:      	vmovdqa64	zmmword ptr [rsp + 0x40], zmm3
  30f351:      	vmovdqa64	zmmword ptr [rsp + 0x80], zmm2
  30f359:      	vmovdqa64	zmmword ptr [rsp + 0xc0], zmm1
  30f361:      	vmovdqa64	zmmword ptr [rsp + 0x100], zmm25
  30f369:      	mov	qword ptr [rsp + 0x140], rax
  30f371:      	mov	qword ptr [rsp + 0x148], rsi
  30f379:      	cmp	rax, 0x3
  30f37d:      	jne	0x30f3b6 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>+0x836>
  30f37f:      	vmovdqu	xmmword ptr [rcx], xmm0
  30f383:      	movabs	rax, 0x7fffffffffffff00
  30f38d:      	and	r9, rax
  30f390:      	mov	rax, r9
  30f393:      	mov	rsp, rbp
  30f396:      	pop	rbp
  30f397:      	vzeroupper
  30f39a:      	ret
  30f39b:      	lea	rdi, [rip - 0x202fff]   # 0x10c3a3 <anon.8182237a801038de36885de64d2c176c.5.llvm.10465402473772549265>
  30f3a2:      	lea	rcx, [rip + 0x4f5cc7]   # 0x805070 <anon.8182237a801038de36885de64d2c176c.1.llvm.10465402473772549265>
  30f3a9:      	mov	esi, 0x237
  30f3ae:      	xor	edx, edx
  30f3b0:      	call	qword ptr [rip + 0x56918a] # 0x878540 <sdallocx+0x878540>
  30f3b6:      	lea	rsi, [rsp + 0x140]
  30f3be:      	lea	rdx, [rip - 0x2642a5]   # 0xab120 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.13.llvm.14024894901458550281+0x40>
  30f3c5:      	lea	rcx, [rip - 0x1ec50c]   # 0x122ec0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd8b8>
  30f3cc:      	lea	r9, [rip + 0x4f651d]    # 0x8058f0 <anon.f91301331f2ac3e3eb2ad538a87aa794.7.llvm.3388403078394314149+0x30>
  30f3d3:      	mov	r8d, 0x29
  30f3d9:      	xor	edi, edi
  30f3db:      	vzeroupper
  30f3de:      	call	qword ptr [rip + 0x568444] # 0x877828 <sdallocx+0x877828>
  30f3e4:      	lea	rdx, [rip + 0x4f651d]   # 0x805908 <anon.f91301331f2ac3e3eb2ad538a87aa794.7.llvm.3388403078394314149+0x48>
  30f3eb:      	mov	esi, 0xc
  30f3f0:      	vzeroupper
  30f3f3:      	call	qword ptr [rip + 0x568387] # 0x877780 <sdallocx+0x877780>
  30f3f9:      	int3
  30f3fa:      	int3
  30f3fb:      	int3
  30f3fc:      	int3
  30f3fd:      	int3
  30f3fe:      	int3
  30f3ff:      	int3
