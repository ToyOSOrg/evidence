
stage/probe-full-ec76bb2a7:	file format elf64-x86-64

Disassembly of section .text:

0000000000311990 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, true>>:
  311990:      	push	rbp
  311991:      	mov	rbp, rsp
  311994:      	sub	rsp, 0x200
  31199b:      	mov	rax, r9
  31199e:      	shr	rax, 0x7
  3119a2:      	je	0x312211 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, true>+0x881>
  3119a8:      	movaps	xmm0, xmmword ptr [rsi + 0x280]
  3119af:      	movaps	xmmword ptr [rbp - 0xa0], xmm0
  3119b6:      	movaps	xmm0, xmmword ptr [rsi + 0x290]
  3119bd:      	movaps	xmmword ptr [rbp - 0x90], xmm0
  3119c4:      	movaps	xmm0, xmmword ptr [rsi + 0x2a0]
  3119cb:      	movaps	xmmword ptr [rbp - 0x80], xmm0
  3119cf:      	movaps	xmm0, xmmword ptr [rsi + 0x2b0]
  3119d6:      	movaps	xmmword ptr [rbp - 0x70], xmm0
  3119da:      	movaps	xmm0, xmmword ptr [rsi + 0x2c0]
  3119e1:      	movaps	xmmword ptr [rbp - 0x60], xmm0
  3119e5:      	movaps	xmm0, xmmword ptr [rsi + 0x2d0]
  3119ec:      	movaps	xmmword ptr [rbp - 0x50], xmm0
  3119f0:      	movaps	xmm0, xmmword ptr [rsi + 0x2e0]
  3119f7:      	movaps	xmmword ptr [rbp - 0x40], xmm0
  3119fb:      	movaps	xmm0, xmmword ptr [rsi + 0x2f0]
  311a02:      	movaps	xmmword ptr [rbp - 0x30], xmm0
  311a06:      	movups	xmm0, xmmword ptr [rdi]
  311a09:      	movaps	xmmword ptr [rbp - 0x10], xmm0
  311a0d:      	xorps	xmm0, xmm0
  311a10:      	movaps	xmmword ptr [rbp - 0x20], xmm0
  311a14:      	lea	rsi, [rbp - 0x20]
  311a18:      	mov	r10, rdx
  311a1b:      	sub	r10, rsi
  311a1e:      	sub	rsi, rdx
  311a21:      	cmovb	rsi, r10
  311a25:      	cmp	rsi, 0xb
  311a29:      	jbe	0x312220 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, true>+0x890>
  311a2f:      	movdqa	xmm0, xmmword ptr [rbp - 0xa0]
  311a37:      	pshufd	xmm1, xmm0, 0xee        # xmm1 = xmm0[2,3,2,3]
  311a3c:      	pxor	xmm1, xmm0
  311a40:      	movdqa	xmmword ptr [rbp - 0x1c0], xmm1
  311a48:      	movdqa	xmm0, xmmword ptr [rbp - 0x90]
  311a50:      	pshufd	xmm1, xmm0, 0xee        # xmm1 = xmm0[2,3,2,3]
  311a55:      	pxor	xmm1, xmm0
  311a59:      	movdqa	xmmword ptr [rbp - 0x1b0], xmm1
  311a61:      	movdqa	xmm0, xmmword ptr [rbp - 0x80]
  311a66:      	pshufd	xmm1, xmm0, 0xee        # xmm1 = xmm0[2,3,2,3]
  311a6b:      	pxor	xmm1, xmm0
  311a6f:      	movdqa	xmmword ptr [rbp - 0x1a0], xmm1
  311a77:      	movdqa	xmm0, xmmword ptr [rbp - 0x70]
  311a7c:      	pshufd	xmm1, xmm0, 0xee        # xmm1 = xmm0[2,3,2,3]
  311a81:      	pxor	xmm1, xmm0
  311a85:      	movdqa	xmmword ptr [rbp - 0x190], xmm1
  311a8d:      	movdqa	xmm0, xmmword ptr [rbp - 0x60]
  311a92:      	pshufd	xmm1, xmm0, 0xee        # xmm1 = xmm0[2,3,2,3]
  311a97:      	pxor	xmm1, xmm0
  311a9b:      	movdqa	xmmword ptr [rbp - 0x180], xmm1
  311aa3:      	movdqa	xmm0, xmmword ptr [rbp - 0x50]
  311aa8:      	pshufd	xmm1, xmm0, 0xee        # xmm1 = xmm0[2,3,2,3]
  311aad:      	pxor	xmm1, xmm0
  311ab1:      	movdqa	xmmword ptr [rbp - 0x170], xmm1
  311ab9:      	movdqa	xmm0, xmmword ptr [rbp - 0x40]
  311abe:      	pshufd	xmm1, xmm0, 0xee        # xmm1 = xmm0[2,3,2,3]
  311ac3:      	pxor	xmm1, xmm0
  311ac7:      	movdqa	xmmword ptr [rbp - 0x160], xmm1
  311acf:      	movdqa	xmm0, xmmword ptr [rbp - 0x30]
  311ad4:      	pshufd	xmm2, xmm0, 0xee        # xmm2 = xmm0[2,3,2,3]
  311ad9:      	mov	esi, dword ptr [rdx + 0x8]
  311adc:      	mov	dword ptr [rbp - 0x18], esi
  311adf:      	mov	rdx, qword ptr [rdx]
  311ae2:      	mov	qword ptr [rbp - 0x20], rdx
  311ae6:      	movdqa	xmm1, xmmword ptr [rbp - 0x10]
  311aeb:      	pxor	xmm1, xmmword ptr [rbp - 0x20]
  311af0:      	movdqa	xmmword ptr [rbp - 0x10], xmm1
  311af5:      	pxor	xmm2, xmm0
  311af9:      	movdqa	xmmword ptr [rbp - 0x150], xmm2
  311b01:      	movdqu	xmm8, xmmword ptr [rcx]
  311b06:      	pshufb	xmm8, xmmword ptr [rip - 0x265850] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  311b10:      	movups	xmm0, xmmword ptr [rdi + 0xa0]
  311b17:      	movaps	xmmword ptr [rbp - 0x140], xmm0
  311b1e:      	movups	xmm0, xmmword ptr [rdi + 0x80]
  311b25:      	movaps	xmmword ptr [rbp - 0x130], xmm0
  311b2c:      	movups	xmm0, xmmword ptr [rdi + 0x90]
  311b33:      	movaps	xmmword ptr [rbp - 0x120], xmm0
  311b3a:      	movups	xmm0, xmmword ptr [rdi + 0x10]
  311b3e:      	movaps	xmmword ptr [rbp - 0x110], xmm0
  311b45:      	movups	xmm0, xmmword ptr [rdi + 0x20]
  311b49:      	movaps	xmmword ptr [rbp - 0x100], xmm0
  311b50:      	movups	xmm0, xmmword ptr [rdi + 0x30]
  311b54:      	movaps	xmmword ptr [rbp - 0xf0], xmm0
  311b5b:      	movups	xmm0, xmmword ptr [rdi + 0x40]
  311b5f:      	movaps	xmmword ptr [rbp - 0xe0], xmm0
  311b66:      	shl	rax, 0x3
  311b6a:      	add	r8, 0x70
  311b6e:      	xor	r10d, r10d
  311b71:      	movabs	rdx, -0x3e00000000000000
  311b7b:      	xor	esi, esi
  311b7d:      	movups	xmm0, xmmword ptr [rdi + 0x50]
  311b81:      	movaps	xmmword ptr [rbp - 0xd0], xmm0
  311b88:      	movups	xmm0, xmmword ptr [rdi + 0x60]
  311b8c:      	movaps	xmmword ptr [rbp - 0xc0], xmm0
  311b93:      	movdqu	xmm0, xmmword ptr [rdi + 0x70]
  311b98:      	movdqa	xmmword ptr [rbp - 0xb0], xmm0
  311ba0:      	movdqu	xmm13, xmmword ptr [r8 - 0x70]
  311ba6:      	movdqu	xmm4, xmmword ptr [r8 - 0x60]
  311bac:      	movdqu	xmm14, xmmword ptr [r8 - 0x50]
  311bb2:      	lea	edi, [r10 + 0x2]
  311bb6:      	bswap	edi
  311bb8:      	movd	xmm0, edi
  311bbc:      	lea	edi, [r10 + 0x3]
  311bc0:      	bswap	edi
  311bc2:      	movd	xmm1, edi
  311bc6:      	pslldq	xmm0, 0xc               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3]
  311bcb:      	pslldq	xmm1, 0xc               # xmm1 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm1[0,1,2,3]
  311bd0:      	lea	edi, [r10 + 0x4]
  311bd4:      	bswap	edi
  311bd6:      	movdqa	xmm3, xmmword ptr [rbp - 0x10]
  311bdb:      	pxor	xmm0, xmm3
  311bdf:      	movdqa	xmm2, xmm0
  311be3:      	movd	xmm0, edi
  311be7:      	pslldq	xmm0, 0xc               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3]
  311bec:      	lea	edi, [r10 + 0x5]
  311bf0:      	pxor	xmm1, xmm3
  311bf4:      	bswap	edi
  311bf6:      	movd	xmm6, edi
  311bfa:      	pslldq	xmm6, 0xc               # xmm6 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm6[0,1,2,3]
  311bff:      	pxor	xmm0, xmm3
  311c03:      	lea	edi, [r10 + 0x6]
  311c07:      	bswap	edi
  311c09:      	movd	xmm7, edi
  311c0d:      	pxor	xmm6, xmm3
  311c11:      	pslldq	xmm7, 0xc               # xmm7 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm7[0,1,2,3]
  311c16:      	pxor	xmm7, xmm3
  311c1a:      	movdqa	xmm5, xmmword ptr [rbp - 0x110]
  311c22:      	aesenc	xmm2, xmm5
  311c27:      	aesenc	xmm1, xmm5
  311c2c:      	aesenc	xmm0, xmm5
  311c31:      	aesenc	xmm6, xmm5
  311c36:      	aesenc	xmm7, xmm5
  311c3b:      	movdqa	xmm5, xmmword ptr [rbp - 0x100]
  311c43:      	aesenc	xmm2, xmm5
  311c48:      	aesenc	xmm1, xmm5
  311c4d:      	aesenc	xmm0, xmm5
  311c52:      	aesenc	xmm6, xmm5
  311c57:      	aesenc	xmm7, xmm5
  311c5c:      	movdqa	xmm5, xmmword ptr [rbp - 0xf0]
  311c64:      	aesenc	xmm2, xmm5
  311c69:      	aesenc	xmm1, xmm5
  311c6e:      	aesenc	xmm0, xmm5
  311c73:      	aesenc	xmm6, xmm5
  311c78:      	aesenc	xmm7, xmm5
  311c7d:      	movdqa	xmm5, xmmword ptr [rbp - 0xe0]
  311c85:      	aesenc	xmm2, xmm5
  311c8a:      	aesenc	xmm1, xmm5
  311c8f:      	aesenc	xmm0, xmm5
  311c94:      	aesenc	xmm6, xmm5
  311c99:      	aesenc	xmm7, xmm5
  311c9e:      	movdqa	xmm5, xmmword ptr [rbp - 0xd0]
  311ca6:      	aesenc	xmm2, xmm5
  311cab:      	aesenc	xmm1, xmm5
  311cb0:      	aesenc	xmm0, xmm5
  311cb5:      	aesenc	xmm6, xmm5
  311cba:      	aesenc	xmm7, xmm5
  311cbf:      	movdqa	xmm5, xmmword ptr [rbp - 0xc0]
  311cc7:      	aesenc	xmm2, xmm5
  311ccc:      	aesenc	xmm1, xmm5
  311cd1:      	aesenc	xmm0, xmm5
  311cd6:      	aesenc	xmm6, xmm5
  311cdb:      	aesenc	xmm7, xmm5
  311ce0:      	movdqa	xmm5, xmmword ptr [rbp - 0xb0]
  311ce8:      	aesenc	xmm2, xmm5
  311ced:      	aesenc	xmm1, xmm5
  311cf2:      	movdqa	xmm9, xmm1
  311cf7:      	movdqa	xmm1, xmm0
  311cfb:      	aesenc	xmm1, xmm5
  311d00:      	aesenc	xmm6, xmm5
  311d05:      	aesenc	xmm7, xmm5
  311d0a:      	movdqa	xmm10, xmmword ptr [rbp - 0x130]
  311d13:      	aesenc	xmm2, xmm10
  311d19:      	aesenc	xmm9, xmm10
  311d1f:      	aesenc	xmm1, xmm10
  311d25:      	aesenc	xmm6, xmm10
  311d2b:      	movdqa	xmm11, xmmword ptr [rbp - 0x120]
  311d34:      	aesenc	xmm2, xmm11
  311d3a:      	aesenc	xmm9, xmm11
  311d40:      	aesenc	xmm1, xmm11
  311d46:      	aesenc	xmm6, xmm11
  311d4c:      	movdqu	xmm0, xmmword ptr [r8 - 0x40]
  311d52:      	movdqa	xmm5, xmmword ptr [rbp - 0x140]
  311d5a:      	aesenclast	xmm2, xmm5
  311d5f:      	pxor	xmm2, xmm13
  311d64:      	movdqa	xmmword ptr [rbp - 0x200], xmm2
  311d6c:      	aesenclast	xmm9, xmm5
  311d72:      	pxor	xmm9, xmm4
  311d77:      	movdqa	xmmword ptr [rbp - 0x1f0], xmm9
  311d80:      	movdqa	xmm2, xmm4
  311d84:      	aesenclast	xmm1, xmm5
  311d89:      	pxor	xmm1, xmm14
  311d8e:      	movdqa	xmmword ptr [rbp - 0x1e0], xmm1
  311d96:      	aesenclast	xmm6, xmm5
  311d9b:      	pxor	xmm6, xmm0
  311d9f:      	movdqa	xmmword ptr [rbp - 0x1d0], xmm6
  311da7:      	aesenc	xmm7, xmm10
  311dad:      	movdqa	xmm6, xmm10
  311db2:      	movdqa	xmm4, xmmword ptr [rip - 0x265afa] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  311dba:      	pshufb	xmm13, xmm4
  311dc0:      	movdqu	xmm1, xmmword ptr [r8 - 0x30]
  311dc6:      	aesenc	xmm7, xmm11
  311dcc:      	pshufb	xmm2, xmm4
  311dd1:      	aesenclast	xmm7, xmm5
  311dd6:      	pxor	xmm7, xmm1
  311dda:      	pshufb	xmm14, xmm4
  311de0:      	lea	edi, [r10 + 0x7]
  311de4:      	bswap	edi
  311de6:      	pshufb	xmm0, xmm4
  311deb:      	movd	xmm10, edi
  311df0:      	pslldq	xmm10, 0xc              # xmm10 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm10[0,1,2,3]
  311df6:      	pxor	xmm10, xmm3
  311dfb:      	pshufb	xmm1, xmm4
  311e00:      	add	rsi, 0x8
  311e04:      	mov	edi, esi
  311e06:      	bswap	edi
  311e08:      	pxor	xmm13, xmm8
  311e0d:      	movdqa	xmm9, xmm13
  311e12:      	movdqa	xmm11, xmm2
  311e17:      	pshufd	xmm12, xmm2, 0xee       # xmm12 = xmm2[2,3,2,3]
  311e1d:      	movdqa	xmm4, xmmword ptr [rbp - 0xa0]
  311e25:      	pclmulqdq	xmm9, xmm4, 0x11
  311e2c:      	pxor	xmm12, xmm2
  311e31:      	movdqa	xmm3, xmmword ptr [rbp - 0x90]
  311e39:      	pclmulqdq	xmm11, xmm3, 0x11
  311e40:      	pclmulqdq	xmm2, xmm3, 0x0
  311e46:      	movdqa	xmm15, xmm14
  311e4b:      	pshufd	xmm8, xmm14, 0xee       # xmm8 = xmm14[2,3,2,3]
  311e51:      	pxor	xmm8, xmm14
  311e56:      	pclmulqdq	xmm12, xmmword ptr [rbp - 0x1b0], 0x0
  311e61:      	movdqa	xmm3, xmmword ptr [rbp - 0x80]
  311e66:      	pclmulqdq	xmm14, xmm3, 0x0
  311e6d:      	pclmulqdq	xmm15, xmm3, 0x11
  311e74:      	pxor	xmm14, xmm2
  311e79:      	pxor	xmm15, xmm11
  311e7e:      	pclmulqdq	xmm8, xmmword ptr [rbp - 0x1a0], 0x0
  311e89:      	movdqa	xmm2, xmm0
  311e8d:      	pxor	xmm15, xmm9
  311e92:      	pshufd	xmm3, xmm0, 0xee        # xmm3 = xmm0[2,3,2,3]
  311e97:      	pxor	xmm3, xmm0
  311e9b:      	movdqa	xmm11, xmm0
  311ea0:      	pxor	xmm8, xmm12
  311ea5:      	pshufd	xmm9, xmm1, 0xee        # xmm9 = xmm1[2,3,2,3]
  311eab:      	pxor	xmm9, xmm1
  311eb0:      	movdqa	xmm5, xmm1
  311eb4:      	movdqa	xmm12, xmmword ptr [rbp - 0x70]
  311eba:      	pclmulqdq	xmm11, xmm12, 0x0
  311ec1:      	movdqa	xmm0, xmmword ptr [rbp - 0x60]
  311ec6:      	pclmulqdq	xmm5, xmm0, 0x0
  311ecc:      	pxor	xmm5, xmm11
  311ed1:      	movd	xmm11, edi
  311ed6:      	pslldq	xmm11, 0xc              # xmm11 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm11[0,1,2,3]
  311edc:      	lea	edi, [r10 + 0x9]
  311ee0:      	bswap	edi
  311ee2:      	pclmulqdq	xmm2, xmm12, 0x11
  311ee9:      	pclmulqdq	xmm1, xmm0, 0x11
  311eef:      	pxor	xmm1, xmm2
  311ef3:      	movd	xmm12, edi
  311ef8:      	movdqa	xmm0, xmmword ptr [rbp - 0x10]
  311efd:      	pxor	xmm11, xmm0
  311f02:      	pslldq	xmm12, 0xc              # xmm12 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm12[0,1,2,3]
  311f08:      	pxor	xmm12, xmm0
  311f0d:      	movdqa	xmm0, xmmword ptr [rbp - 0x110]
  311f15:      	aesenc	xmm10, xmm0
  311f1b:      	aesenc	xmm12, xmm0
  311f21:      	aesenc	xmm11, xmm0
  311f27:      	movdqa	xmm0, xmmword ptr [rbp - 0x100]
  311f2f:      	aesenc	xmm10, xmm0
  311f35:      	aesenc	xmm11, xmm0
  311f3b:      	aesenc	xmm12, xmm0
  311f41:      	movdqa	xmm0, xmmword ptr [rbp - 0xf0]
  311f49:      	aesenc	xmm10, xmm0
  311f4f:      	aesenc	xmm12, xmm0
  311f55:      	aesenc	xmm11, xmm0
  311f5b:      	movdqa	xmm0, xmmword ptr [rbp - 0xe0]
  311f63:      	aesenc	xmm10, xmm0
  311f69:      	aesenc	xmm11, xmm0
  311f6f:      	aesenc	xmm12, xmm0
  311f75:      	movdqa	xmm0, xmmword ptr [rbp - 0xd0]
  311f7d:      	aesenc	xmm10, xmm0
  311f83:      	aesenc	xmm12, xmm0
  311f89:      	aesenc	xmm11, xmm0
  311f8f:      	movdqa	xmm0, xmmword ptr [rbp - 0xc0]
  311f97:      	aesenc	xmm10, xmm0
  311f9d:      	aesenc	xmm11, xmm0
  311fa3:      	pclmulqdq	xmm3, xmmword ptr [rbp - 0x190], 0x0
  311fad:      	aesenc	xmm12, xmm0
  311fb3:      	pclmulqdq	xmm9, xmmword ptr [rbp - 0x180], 0x0
  311fbe:      	pxor	xmm9, xmm3
  311fc3:      	movdqa	xmm0, xmmword ptr [rbp - 0xb0]
  311fcb:      	aesenc	xmm10, xmm0
  311fd1:      	pshufd	xmm2, xmm13, 0xee       # xmm2 = xmm13[2,3,2,3]
  311fd7:      	pxor	xmm2, xmm13
  311fdc:      	aesenc	xmm10, xmm6
  311fe2:      	pclmulqdq	xmm13, xmm4, 0x0
  311fe9:      	movdqa	xmm4, xmmword ptr [rbp - 0x120]
  311ff1:      	aesenc	xmm10, xmm4
  311ff7:      	pxor	xmm14, xmm13
  311ffc:      	movdqu	xmm3, xmmword ptr [r8 - 0x20]
  312002:      	movdqa	xmm6, xmmword ptr [rbp - 0x140]
  31200a:      	aesenclast	xmm10, xmm6
  312010:      	pxor	xmm10, xmm3
  312015:      	aesenc	xmm11, xmm0
  31201b:      	pshufb	xmm3, xmmword ptr [rip - 0x265d64] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  312024:      	pclmulqdq	xmm2, xmmword ptr [rbp - 0x1c0], 0x0
  31202e:      	aesenc	xmm12, xmm0
  312034:      	pxor	xmm8, xmm2
  312039:      	movdqa	xmm13, xmm3
  31203e:      	movdqa	xmm2, xmmword ptr [rbp - 0x130]
  312046:      	aesenc	xmm11, xmm2
  31204c:      	movdqa	xmm0, xmmword ptr [rbp - 0x50]
  312051:      	pclmulqdq	xmm13, xmm0, 0x11
  312058:      	pxor	xmm13, xmm1
  31205d:      	aesenc	xmm12, xmm2
  312063:      	pshufd	xmm1, xmm3, 0xee        # xmm1 = xmm3[2,3,2,3]
  312068:      	pxor	xmm1, xmm3
  31206c:      	aesenc	xmm11, xmm4
  312072:      	pclmulqdq	xmm3, xmm0, 0x0
  312078:      	aesenc	xmm12, xmm4
  31207e:      	pxor	xmm3, xmm5
  312082:      	movdqu	xmm0, xmmword ptr [r8 - 0x10]
  312088:      	aesenclast	xmm11, xmm6
  31208e:      	pxor	xmm11, xmm0
  312093:      	aesenclast	xmm12, xmm6
  312099:      	pxor	xmm13, xmm15
  31209e:      	movdqu	xmm15, xmmword ptr [r8]
  3120a3:      	pxor	xmm12, xmm15
  3120a8:      	movdqa	xmm2, xmmword ptr [rip - 0x265df0] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  3120b0:      	pshufb	xmm0, xmm2
  3120b5:      	pshufb	xmm15, xmm2
  3120bb:      	pclmulqdq	xmm1, xmmword ptr [rbp - 0x170], 0x0
  3120c5:      	pxor	xmm1, xmm9
  3120ca:      	pxor	xmm3, xmm14
  3120cf:      	movdqa	xmm9, xmm0
  3120d4:      	movdqa	xmm2, xmm15
  3120d9:      	movdqa	xmm5, xmmword ptr [rbp - 0x30]
  3120de:      	pclmulqdq	xmm2, xmm5, 0x0
  3120e4:      	movdqa	xmm4, xmmword ptr [rbp - 0x40]
  3120e9:      	pclmulqdq	xmm9, xmm4, 0x0
  3120f0:      	pxor	xmm2, xmm9
  3120f5:      	pshufd	xmm9, xmm0, 0xee        # xmm9 = xmm0[2,3,2,3]
  3120fb:      	pxor	xmm9, xmm0
  312100:      	pxor	xmm2, xmm3
  312104:      	pshufd	xmm14, xmm15, 0xee      # xmm14 = xmm15[2,3,2,3]
  31210a:      	pxor	xmm14, xmm15
  31210f:      	movdqa	xmm3, xmm15
  312114:      	pclmulqdq	xmm0, xmm4, 0x11
  31211a:      	pclmulqdq	xmm3, xmm5, 0x11
  312120:      	pxor	xmm3, xmm0
  312124:      	pclmulqdq	xmm9, xmmword ptr [rbp - 0x160], 0x0
  31212f:      	pclmulqdq	xmm14, xmmword ptr [rbp - 0x150], 0x0
  31213a:      	pxor	xmm14, xmm9
  31213f:      	movaps	xmm0, xmmword ptr [rbp - 0x200]
  312146:      	movups	xmmword ptr [r8 - 0x70], xmm0
  31214b:      	pxor	xmm1, xmm8
  312150:      	movaps	xmm0, xmmword ptr [rbp - 0x1f0]
  312157:      	movups	xmmword ptr [r8 - 0x60], xmm0
  31215c:      	movaps	xmm0, xmmword ptr [rbp - 0x1e0]
  312163:      	movups	xmmword ptr [r8 - 0x50], xmm0
  312168:      	movaps	xmm0, xmmword ptr [rbp - 0x1d0]
  31216f:      	movups	xmmword ptr [r8 - 0x40], xmm0
  312174:      	pxor	xmm3, xmm13
  312179:      	movdqu	xmmword ptr [r8 - 0x30], xmm7
  31217f:      	movdqu	xmmword ptr [r8 - 0x20], xmm10
  312185:      	movdqu	xmmword ptr [r8 - 0x10], xmm11
  31218b:      	pxor	xmm14, xmm1
  312190:      	movdqa	xmm0, xmm2
  312194:      	pxor	xmm0, xmm3
  312198:      	pxor	xmm0, xmm14
  31219d:      	movdqu	xmmword ptr [r8], xmm12
  3121a2:      	movdqa	xmm1, xmm0
  3121a6:      	pslldq	xmm1, 0x8               # xmm1 = zero,zero,zero,zero,zero,zero,zero,zero,xmm1[0,1,2,3,4,5,6,7]
  3121ab:      	pxor	xmm1, xmm2
  3121af:      	pshufd	xmm2, xmm1, 0x4e        # xmm2 = xmm1[2,3,0,1]
  3121b4:      	movq	xmm4, rdx
  3121b9:      	pclmulqdq	xmm1, xmm4, 0x0
  3121bf:      	pxor	xmm1, xmm2
  3121c3:      	psrldq	xmm0, 0x8               # xmm0 = xmm0[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero
  3121c8:      	pshufd	xmm8, xmm1, 0x4e        # xmm8 = xmm1[2,3,0,1]
  3121ce:      	pxor	xmm8, xmm0
  3121d3:      	pclmulqdq	xmm1, xmm4, 0x0
  3121d9:      	pxor	xmm8, xmm3
  3121de:      	pxor	xmm8, xmm1
  3121e3:      	sub	r8, -0x80
  3121e7:      	mov	r10, rsi
  3121ea:      	cmp	rax, rsi
  3121ed:      	jne	0x311ba0 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, true>+0x210>
  3121f3:      	pshufb	xmm8, xmmword ptr [rip - 0x265f3d] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  3121fd:      	movdqu	xmmword ptr [rcx], xmm8
  312202:      	movabs	rax, 0x7fffffffffffff80
  31220c:      	and	r9, rax
  31220f:      	jmp	0x312214 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, true>+0x884>
  312211:      	xor	r9d, r9d
  312214:      	mov	rax, r9
  312217:      	add	rsp, 0x200
  31221e:      	pop	rbp
  31221f:      	ret
  312220:      	lea	rdi, [rip - 0x205e84]   # 0x10c3a3 <anon.8182237a801038de36885de64d2c176c.5.llvm.10465402473772549265>
  312227:      	lea	rcx, [rip + 0x4f2e42]   # 0x805070 <anon.8182237a801038de36885de64d2c176c.1.llvm.10465402473772549265>
  31222e:      	mov	esi, 0x237
  312233:      	xor	edx, edx
  312235:      	call	qword ptr [rip + 0x566305] # 0x878540 <sdallocx+0x878540>
  31223b:      	int3
  31223c:      	int3
  31223d:      	int3
  31223e:      	int3
  31223f:      	int3
