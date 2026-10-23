
stage/probe-full-7dcf12a5a:	file format elf64-x86-64

Disassembly of section .text:

000000000030e740 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>>:
  30e740:      	push	rbp
  30e741:      	mov	rbp, rsp
  30e744:      	push	r15
  30e746:      	push	r14
  30e748:      	push	r12
  30e74a:      	push	rbx
  30e74b:      	and	rsp, -0x40
  30e74f:      	sub	rsp, 0x180
  30e756:      	vxorps	xmm0, xmm0, xmm0
  30e75a:      	vmovaps	xmmword ptr [rsp], xmm0
  30e75f:      	mov	rax, rsp
  30e762:      	mov	r10, rdx
  30e765:      	sub	r10, rax
  30e768:      	sub	rax, rdx
  30e76b:      	cmovb	rax, r10
  30e76f:      	cmp	rax, 0xb
  30e773:      	jbe	0x30ecf3 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>+0x5b3>
  30e779:      	mov	eax, dword ptr [rdx + 0x8]
  30e77c:      	mov	dword ptr [rsp + 0x8], eax
  30e780:      	mov	rax, qword ptr [rdx]
  30e783:      	mov	qword ptr [rsp], rax
  30e787:      	vmovdqu	xmm0, xmmword ptr [rcx]
  30e78b:      	mov	r10, r9
  30e78e:      	shr	r10, 0x8
  30e792:      	vpshufb	xmm9, xmm0, xmmword ptr [rip - 0x2624db] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  30e79b:      	movabs	rdx, 0x5555555555555556
  30e7a5:      	mov	rax, r10
  30e7a8:      	mul	rdx
  30e7ab:      	lea	rax, [rdx + 2*rdx]
  30e7af:      	mov	rdx, r10
  30e7b2:      	sub	rdx, rax
  30e7b5:      	mov	eax, 0x3
  30e7ba:      	cmovne	rax, rdx
  30e7be:      	test	r10, r10
  30e7c1:      	je	0x30ec82 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>+0x542>
  30e7c7:      	vbroadcasti32x4	zmm0, xmmword ptr [rsp] # zmm0 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e7ce:      	vpord	zmm14, zmm0, zmmword ptr [rip - 0x1ebf18] # 0x1228c0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd2b8>
  30e7d8:      	shl	r10, 0x8
  30e7dc:      	vpxor	xmm10, xmm10, xmm10
  30e7e1:      	mov	edx, 0x12
  30e7e6:      	xor	r11d, r11d
  30e7e9:      	mov	rbx, rsp
  30e7ec:      	vmovdqa64	zmm1, zmmword ptr [rip - 0x1ebe76] # 0x122980 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd378>
  30e7f6:      	vmovdqa64	zmm2, zmmword ptr [rip - 0x1ebe40] # 0x1229c0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd3b8>
  30e800:      	vmovdqa64	zmm3, zmmword ptr [rip - 0x1ebe0a] # 0x122a00 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd3f8>
  30e80a:      	vmovdqa64	zmm4, zmmword ptr [rip - 0x1ebdd4] # 0x122a40 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd438>
  30e814:      	vmovdqa64	zmm5, zmmword ptr [rip - 0x1ebd9e] # 0x122a80 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd478>
  30e81e:      	vpbroadcastq	zmm6, qword ptr [rip - 0x2637f8] # 0xab030 <sdallocx+0xab030>
  30e828:      	vmovdqa64	zmm7, zmmword ptr [rip - 0x1ebf32] # 0x122900 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd2f8>
  30e832:      	vmovdqa64	zmm8, zmmword ptr [rip - 0x1ebefc] # 0x122940 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd338>
  30e83c:      	vpxor	xmm13, xmm13, xmm13
  30e841:      	vpxor	xmm11, xmm11, xmm11
  30e846:      	jmp	0x30e9f8 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>+0x2b8>
  30e84b:      	nop	dword ptr [rax + rax]
  30e850:      	mov	r14, qword ptr [rsp]
  30e854:      	vbroadcasti32x4	zmm22, xmmword ptr [r14] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e85a:      	vpxord	zmm14, zmm22, zmm14
  30e860:      	vpxord	zmm19, zmm22, zmm19
  30e866:      	vpxord	zmm20, zmm22, zmm20
  30e86c:      	vpxord	zmm21, zmm22, zmm21
  30e872:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x10] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e879:      	vaesenc	zmm14, zmm14, zmm22
  30e87f:      	vaesenc	zmm19, zmm19, zmm22
  30e885:      	vaesenc	zmm20, zmm20, zmm22
  30e88b:      	vaesenc	zmm21, zmm21, zmm22
  30e891:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x20] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e898:      	vaesenc	zmm14, zmm14, zmm22
  30e89e:      	vaesenc	zmm19, zmm19, zmm22
  30e8a4:      	vaesenc	zmm20, zmm20, zmm22
  30e8aa:      	vaesenc	zmm21, zmm21, zmm22
  30e8b0:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x30] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e8b7:      	vaesenc	zmm14, zmm14, zmm22
  30e8bd:      	vaesenc	zmm19, zmm19, zmm22
  30e8c3:      	vaesenc	zmm20, zmm20, zmm22
  30e8c9:      	vaesenc	zmm21, zmm21, zmm22
  30e8cf:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x40] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e8d6:      	vaesenc	zmm14, zmm14, zmm22
  30e8dc:      	vaesenc	zmm19, zmm19, zmm22
  30e8e2:      	vaesenc	zmm20, zmm20, zmm22
  30e8e8:      	vaesenc	zmm21, zmm21, zmm22
  30e8ee:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x50] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e8f5:      	vaesenc	zmm14, zmm14, zmm22
  30e8fb:      	vaesenc	zmm19, zmm19, zmm22
  30e901:      	vaesenc	zmm20, zmm20, zmm22
  30e907:      	vaesenc	zmm21, zmm21, zmm22
  30e90d:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x60] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e914:      	vaesenc	zmm14, zmm14, zmm22
  30e91a:      	vaesenc	zmm19, zmm19, zmm22
  30e920:      	vaesenc	zmm20, zmm20, zmm22
  30e926:      	vaesenc	zmm21, zmm21, zmm22
  30e92c:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x70] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e933:      	vaesenc	zmm14, zmm14, zmm22
  30e939:      	vaesenc	zmm19, zmm19, zmm22
  30e93f:      	vaesenc	zmm20, zmm20, zmm22
  30e945:      	vaesenc	zmm21, zmm21, zmm22
  30e94b:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x80] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e952:      	vaesenc	zmm14, zmm14, zmm22
  30e958:      	vaesenc	zmm19, zmm19, zmm22
  30e95e:      	vaesenc	zmm20, zmm20, zmm22
  30e964:      	vaesenc	zmm21, zmm21, zmm22
  30e96a:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0x90] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e971:      	vaesenc	zmm14, zmm14, zmm22
  30e977:      	vaesenc	zmm19, zmm19, zmm22
  30e97d:      	vaesenc	zmm20, zmm20, zmm22
  30e983:      	vaesenc	zmm21, zmm21, zmm22
  30e989:      	vbroadcasti32x4	zmm22, xmmword ptr [r14 + 0xa0] # zmm22 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30e990:      	vaesenclast	zmm14, zmm14, zmm22
  30e996:      	vpxorq	zmm14, zmm14, zmm18
  30e99c:      	vmovdqu64	zmmword ptr [r8 + r11], zmm14
  30e9a3:      	vaesenclast	zmm14, zmm19, zmm22
  30e9a9:      	vpxorq	zmm14, zmm14, zmm17
  30e9af:      	vmovdqu64	zmmword ptr [r8 + r11 + 0x40], zmm14
  30e9b7:      	vaesenclast	zmm14, zmm20, zmm22
  30e9bd:      	vpxorq	zmm14, zmm14, zmm16
  30e9c3:      	vmovdqu64	zmmword ptr [r8 + r11 + 0x80], zmm14
  30e9cb:      	vaesenclast	zmm14, zmm21, zmm22
  30e9d1:      	vpxorq	zmm14, zmm14, zmm15
  30e9d7:      	vmovdqu64	zmmword ptr [r8 + r11 + 0xc0], zmm14
  30e9df:      	add	edx, 0x10
  30e9e2:      	add	r11, 0x100
  30e9e9:      	vmovdqa64	zmm14, zmm12
  30e9ef:      	cmp	r10, r11
  30e9f2:      	je	0x30ec91 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>+0x551>
  30e9f8:      	lea	r14d, [rdx - 0x10]
  30e9fc:      	mov	qword ptr [rsp], rdi
  30ea00:      	and	r14d, 0xfe
  30ea07:      	cmp	r14d, 0xed
  30ea0e:      	jae	0x30ea30 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>+0x2f0>
  30ea10:      	vpaddd	zmm12, zmm14, zmm1
  30ea16:      	vpaddd	zmm19, zmm14, zmm2
  30ea1c:      	vpaddd	zmm20, zmm14, zmm3
  30ea22:      	vpaddd	zmm21, zmm14, zmm4
  30ea28:      	jmp	0x30ea9c <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>+0x35c>
  30ea2a:      	nop	word ptr [rax + rax]
  30ea30:      	vpbroadcastd	zmm12, edx
  30ea36:      	vpaddd	zmm12, zmm12, zmm7
  30ea3c:      	vpshufb	zmm12, zmm12, zmm8
  30ea42:      	vpord	zmm12, zmm0, zmm12
  30ea48:      	lea	r14d, [rdx - 0xc]
  30ea4c:      	vpbroadcastd	zmm15, r14d
  30ea52:      	vpaddd	zmm15, zmm15, zmm7
  30ea58:      	vpshufb	zmm15, zmm15, zmm8
  30ea5e:      	vpord	zmm19, zmm0, zmm15
  30ea64:      	lea	r14d, [rdx - 0x8]
  30ea68:      	vpbroadcastd	zmm15, r14d
  30ea6e:      	vpaddd	zmm15, zmm15, zmm7
  30ea74:      	vpshufb	zmm15, zmm15, zmm8
  30ea7a:      	vpord	zmm20, zmm0, zmm15
  30ea80:      	lea	r14d, [rdx - 0x4]
  30ea84:      	vpbroadcastd	zmm15, r14d
  30ea8a:      	vpaddd	zmm15, zmm15, zmm7
  30ea90:      	vpshufb	zmm15, zmm15, zmm8
  30ea96:      	vpord	zmm21, zmm0, zmm15
  30ea9c:      	mov	r14, rax
  30ea9f:      	shr	r14, 0x3c
  30eaa3:      	jne	0x30ed3c <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>+0x5fc>
  30eaa9:      	vmovdqu64	zmm18, zmmword ptr [r8 + r11]
  30eab0:      	vmovdqu64	zmm17, zmmword ptr [r8 + r11 + 0x40]
  30eab8:      	vmovdqu64	zmm16, zmmword ptr [r8 + r11 + 0x80]
  30eac0:      	vmovdqu64	zmm15, zmmword ptr [r8 + r11 + 0xc0]
  30eac8:      	vpshufb	zmm22, zmm15, zmm5
  30eace:      	vpshufb	zmm23, zmm16, zmm5
  30ead4:      	vpshufb	zmm24, zmm17, zmm5
  30eada:      	vpshufb	zmm25, zmm18, zmm5
  30eae0:      	vpxorq	zmm9, zmm9, zmm25
  30eae6:      	mov	r14d, eax
  30eae9:      	shl	r14d, 0x4
  30eaed:      	mov	r15d, 0x30
  30eaf3:      	sub	r15d, r14d
  30eaf6:      	mov	r12d, 0x34
  30eafc:      	sub	r12d, r14d
  30eaff:      	shr	r15d, 0x2
  30eb03:      	shl	r15, 0x6
  30eb07:      	vmovdqu64	zmm25, zmmword ptr [rsi + r15]
  30eb0e:      	shr	r12d, 0x2
  30eb12:      	shl	r12, 0x6
  30eb16:      	vmovdqu64	zmm26, zmmword ptr [rsi + r12]
  30eb1d:      	vpclmulqdq	zmm27, zmm9, zmm25, 0x0
  30eb24:      	vpclmulqdq	zmm28, zmm24, zmm26, 0x0
  30eb2b:      	vmovdqa64	zmm29, zmm10
  30eb31:      	vpternlogq	zmm29, zmm27, zmm28, 0x96 # zmm29 = zmm29 ^ zmm27 ^ zmm28
  30eb38:      	vpclmulqdq	zmm10, zmm9, zmm25, 0x11
  30eb3f:      	vpclmulqdq	zmm27, zmm24, zmm26, 0x11
  30eb46:      	vmovdqa64	zmm28, zmm13
  30eb4c:      	vpternlogq	zmm28, zmm10, zmm27, 0x96 # zmm28 = zmm28 ^ zmm10 ^ zmm27
  30eb53:      	vpclmulqdq	zmm10, zmm9, zmm25, 0x1
  30eb5a:      	vpclmulqdq	zmm9, zmm9, zmm25, 0x10
  30eb61:      	vpternlogq	zmm11, zmm10, zmm9, 0x96 # zmm11 = zmm11 ^ zmm10 ^ zmm9
  30eb68:      	vpclmulqdq	zmm9, zmm24, zmm26, 0x1
  30eb6f:      	vpclmulqdq	zmm24, zmm24, zmm26, 0x10
  30eb76:      	vpternlogq	zmm24, zmm11, zmm9, 0x96 # zmm24 = zmm24 ^ zmm11 ^ zmm9
  30eb7d:      	mov	r15d, 0x38
  30eb83:      	sub	r15d, r14d
  30eb86:      	shr	r15d, 0x2
  30eb8a:      	shl	r15, 0x6
  30eb8e:      	vmovdqu64	zmm9, zmmword ptr [rsi + r15]
  30eb95:      	mov	r15d, 0x3c
  30eb9b:      	sub	r15d, r14d
  30eb9e:      	shr	r15d, 0x2
  30eba2:      	shl	r15, 0x6
  30eba6:      	vmovdqu64	zmm11, zmmword ptr [rsi + r15]
  30ebad:      	vpclmulqdq	zmm13, zmm23, zmm9, 0x0
  30ebb4:      	vpclmulqdq	zmm10, zmm22, zmm11, 0x0
  30ebbb:      	vpternlogq	zmm10, zmm29, zmm13, 0x96 # zmm10 = zmm10 ^ zmm29 ^ zmm13
  30ebc2:      	vpclmulqdq	zmm25, zmm23, zmm9, 0x11
  30ebc9:      	vpclmulqdq	zmm13, zmm22, zmm11, 0x11
  30ebd0:      	vpternlogq	zmm13, zmm28, zmm25, 0x96 # zmm13 = zmm13 ^ zmm28 ^ zmm25
  30ebd7:      	vpclmulqdq	zmm25, zmm23, zmm9, 0x1
  30ebde:      	vpclmulqdq	zmm9, zmm23, zmm9, 0x10
  30ebe5:      	vpternlogq	zmm9, zmm24, zmm25, 0x96 # zmm9 = zmm9 ^ zmm24 ^ zmm25
  30ebec:      	vpclmulqdq	zmm23, zmm22, zmm11, 0x1
  30ebf3:      	vpclmulqdq	zmm11, zmm22, zmm11, 0x10
  30ebfa:      	vpternlogq	zmm11, zmm9, zmm23, 0x96 # zmm11 = zmm11 ^ zmm9 ^ zmm23
  30ec01:      	vpxor	xmm9, xmm9, xmm9
  30ec06:      	dec	rax
  30ec09:      	jne	0x30e850 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>+0x110>
  30ec0f:      	vpslldq	zmm9, zmm11, 0x8        # zmm9 = zero,zero,zero,zero,zero,zero,zero,zero,zmm11[0,1,2,3,4,5,6,7],zero,zero,zero,zero,zero,zero,zero,zero,zmm11[16,17,18,19,20,21,22,23],zero,zero,zero,zero,zero,zero,zero,zero,zmm11[32,33,34,35,36,37,38,39],zero,zero,zero,zero,zero,zero,zero,zero,zmm11[48,49,50,51,52,53,54,55]
  30ec16:      	vpxord	zmm9, zmm9, zmm10
  30ec1c:      	vpsrldq	zmm10, zmm11, 0x8       # zmm10 = zmm11[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero,zmm11[24,25,26,27,28,29,30,31],zero,zero,zero,zero,zero,zero,zero,zero,zmm11[40,41,42,43,44,45,46,47],zero,zero,zero,zero,zero,zero,zero,zero,zmm11[56,57,58,59,60,61,62,63],zero,zero,zero,zero,zero,zero,zero,zero
  30ec23:      	vpxorq	zmm10, zmm13, zmm10
  30ec29:      	vpshufd	zmm11, zmm9, 0x4e       # zmm11 = zmm9[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30ec30:      	vpclmulqdq	zmm9, zmm9, zmm6, 0x0
  30ec37:      	vpxorq	zmm9, zmm9, zmm11
  30ec3d:      	vpshufd	zmm11, zmm9, 0x4e       # zmm11 = zmm9[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30ec44:      	vpclmulqdq	zmm9, zmm9, zmm6, 0x0
  30ec4b:      	vpternlogq	zmm9, zmm10, zmm11, 0x96 # zmm9 = zmm9 ^ zmm10 ^ zmm11
  30ec52:      	vextracti64x4	ymm10, zmm9, 0x1
  30ec59:      	vpxor	ymm9, ymm10, ymm9
  30ec5e:      	vextracti128	xmm10, ymm9, 0x1
  30ec64:      	vpxor	xmm9, xmm10, xmm9
  30ec69:      	vpxor	xmm11, xmm11, xmm11
  30ec6e:      	mov	eax, 0x3
  30ec73:      	vpxor	xmm13, xmm13, xmm13
  30ec78:      	vpxor	xmm10, xmm10, xmm10
  30ec7d:      	jmp	0x30e850 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>+0x110>
  30ec82:      	vpxor	xmm11, xmm11, xmm11
  30ec87:      	vpxor	xmm13, xmm13, xmm13
  30ec8c:      	vpxor	xmm10, xmm10, xmm10
  30ec91:      	vmovdqa64	zmmword ptr [rsp], zmm10
  30ec98:      	vmovdqa64	zmmword ptr [rsp + 0x40], zmm13
  30eca0:      	vmovdqa64	zmmword ptr [rsp + 0x80], zmm11
  30eca8:      	vmovdqa64	zmmword ptr [rsp + 0xc0], zmm9
  30ecb0:      	mov	qword ptr [rsp + 0x100], rax
  30ecb8:      	mov	qword ptr [rsp + 0x108], rsi
  30ecc0:      	cmp	rax, 0x3
  30ecc4:      	jne	0x30ed0e <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>+0x5ce>
  30ecc6:      	vpshufb	xmm0, xmm9, xmmword ptr [rip - 0x262a0f] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  30eccf:      	vmovdqu	xmmword ptr [rcx], xmm0
  30ecd3:      	movabs	rax, 0x7fffffffffffff00
  30ecdd:      	and	r9, rax
  30ece0:      	mov	rax, r9
  30ece3:      	lea	rsp, [rbp - 0x20]
  30ece7:      	pop	rbx
  30ece8:      	pop	r12
  30ecea:      	pop	r14
  30ecec:      	pop	r15
  30ecee:      	pop	rbp
  30ecef:      	vzeroupper
  30ecf2:      	ret
  30ecf3:      	lea	rdi, [rip - 0x202957]   # 0x10c3a3 <anon.8182237a801038de36885de64d2c176c.5.llvm.10465402473772549265>
  30ecfa:      	lea	rcx, [rip + 0x4f5bef]   # 0x8048f0 <anon.8182237a801038de36885de64d2c176c.1.llvm.10465402473772549265>
  30ed01:      	mov	esi, 0x237
  30ed06:      	xor	edx, edx
  30ed08:      	call	qword ptr [rip + 0x569072] # 0x877d80 <sdallocx+0x877d80>
  30ed0e:      	lea	rsi, [rsp + 0x100]
  30ed16:      	lea	rdx, [rip - 0x263bfd]   # 0xab120 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.13.llvm.14024894901458550281+0x40>
  30ed1d:      	lea	rcx, [rip - 0x1ebe64]   # 0x122ec0 <toyos_crypto::nist::P256_COMB (.llvm.8623570749578859496)+0xd8b8>
  30ed24:      	lea	r9, [rip + 0x4f63fd]    # 0x805128 <anon.8f767f2a79b26510ef523e501c99a207.8.llvm.4603560004070794364+0x80>
  30ed2b:      	mov	r8d, 0x29
  30ed31:      	xor	edi, edi
  30ed33:      	vzeroupper
  30ed36:      	call	qword ptr [rip + 0x56832c] # 0x877068 <sdallocx+0x877068>
  30ed3c:      	lea	rdi, [rip + 0x4f63cd]   # 0x805110 <anon.8f767f2a79b26510ef523e501c99a207.8.llvm.4603560004070794364+0x68>
  30ed43:      	vzeroupper
  30ed46:      	call	qword ptr [rip + 0x56903c] # 0x877d88 <sdallocx+0x877d88>
  30ed4c:      	int3
  30ed4d:      	int3
  30ed4e:      	int3
  30ed4f:      	int3
