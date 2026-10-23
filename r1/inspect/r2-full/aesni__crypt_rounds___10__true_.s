
stage/probe-full-7dcf12a5a:	file format elf64-x86-64

Disassembly of section .text:

0000000000311b00 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, true>>:
  311b00:      	push	rbp
  311b01:      	mov	rbp, rsp
  311b04:      	sub	rsp, 0x210
  311b0b:      	mov	rax, r9
  311b0e:      	shr	rax, 0x7
  311b12:      	je	0x31239c <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, true>+0x89c>
  311b18:      	movaps	xmm0, xmmword ptr [rsi + 0x280]
  311b1f:      	movaps	xmmword ptr [rbp - 0x30], xmm0
  311b23:      	movaps	xmm0, xmmword ptr [rsi + 0x290]
  311b2a:      	movaps	xmmword ptr [rbp - 0xb0], xmm0
  311b31:      	movaps	xmm0, xmmword ptr [rsi + 0x2a0]
  311b38:      	movaps	xmmword ptr [rbp - 0xa0], xmm0
  311b3f:      	movaps	xmm0, xmmword ptr [rsi + 0x2b0]
  311b46:      	movaps	xmmword ptr [rbp - 0x90], xmm0
  311b4d:      	movaps	xmm0, xmmword ptr [rsi + 0x2c0]
  311b54:      	movaps	xmmword ptr [rbp - 0x80], xmm0
  311b58:      	movaps	xmm0, xmmword ptr [rsi + 0x2d0]
  311b5f:      	movaps	xmmword ptr [rbp - 0x70], xmm0
  311b63:      	movaps	xmm0, xmmword ptr [rsi + 0x2e0]
  311b6a:      	movaps	xmmword ptr [rbp - 0x60], xmm0
  311b6e:      	movaps	xmm0, xmmword ptr [rsi + 0x2f0]
  311b75:      	movaps	xmmword ptr [rbp - 0x50], xmm0
  311b79:      	movups	xmm0, xmmword ptr [rdi]
  311b7c:      	movaps	xmmword ptr [rbp - 0x10], xmm0
  311b80:      	xorps	xmm0, xmm0
  311b83:      	movaps	xmmword ptr [rbp - 0x20], xmm0
  311b87:      	lea	rsi, [rbp - 0x20]
  311b8b:      	mov	r10, rdx
  311b8e:      	sub	r10, rsi
  311b91:      	sub	rsi, rdx
  311b94:      	cmovb	rsi, r10
  311b98:      	cmp	rsi, 0xb
  311b9c:      	jbe	0x3123ab <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, true>+0x8ab>
  311ba2:      	movdqa	xmm0, xmmword ptr [rbp - 0x30]
  311ba7:      	pshufd	xmm1, xmm0, 0xee        # xmm1 = xmm0[2,3,2,3]
  311bac:      	pxor	xmm1, xmm0
  311bb0:      	movdqa	xmmword ptr [rbp - 0x1c0], xmm1
  311bb8:      	movdqa	xmm0, xmmword ptr [rbp - 0xb0]
  311bc0:      	pshufd	xmm1, xmm0, 0xee        # xmm1 = xmm0[2,3,2,3]
  311bc5:      	pxor	xmm1, xmm0
  311bc9:      	movdqa	xmmword ptr [rbp - 0x1b0], xmm1
  311bd1:      	movdqa	xmm0, xmmword ptr [rbp - 0xa0]
  311bd9:      	pshufd	xmm1, xmm0, 0xee        # xmm1 = xmm0[2,3,2,3]
  311bde:      	pxor	xmm1, xmm0
  311be2:      	movdqa	xmmword ptr [rbp - 0x1a0], xmm1
  311bea:      	movdqa	xmm0, xmmword ptr [rbp - 0x90]
  311bf2:      	pshufd	xmm1, xmm0, 0xee        # xmm1 = xmm0[2,3,2,3]
  311bf7:      	pxor	xmm1, xmm0
  311bfb:      	movdqa	xmmword ptr [rbp - 0x190], xmm1
  311c03:      	movdqa	xmm0, xmmword ptr [rbp - 0x80]
  311c08:      	pshufd	xmm1, xmm0, 0xee        # xmm1 = xmm0[2,3,2,3]
  311c0d:      	pxor	xmm1, xmm0
  311c11:      	movdqa	xmmword ptr [rbp - 0x180], xmm1
  311c19:      	movdqa	xmm0, xmmword ptr [rbp - 0x70]
  311c1e:      	pshufd	xmm1, xmm0, 0xee        # xmm1 = xmm0[2,3,2,3]
  311c23:      	pxor	xmm1, xmm0
  311c27:      	movdqa	xmmword ptr [rbp - 0x170], xmm1
  311c2f:      	movdqa	xmm0, xmmword ptr [rbp - 0x60]
  311c34:      	pshufd	xmm1, xmm0, 0xee        # xmm1 = xmm0[2,3,2,3]
  311c39:      	pxor	xmm1, xmm0
  311c3d:      	movdqa	xmmword ptr [rbp - 0x160], xmm1
  311c45:      	movdqa	xmm0, xmmword ptr [rbp - 0x50]
  311c4a:      	pshufd	xmm2, xmm0, 0xee        # xmm2 = xmm0[2,3,2,3]
  311c4f:      	mov	esi, dword ptr [rdx + 0x8]
  311c52:      	mov	dword ptr [rbp - 0x18], esi
  311c55:      	mov	rdx, qword ptr [rdx]
  311c58:      	mov	qword ptr [rbp - 0x20], rdx
  311c5c:      	movdqa	xmm1, xmmword ptr [rbp - 0x10]
  311c61:      	pxor	xmm1, xmmword ptr [rbp - 0x20]
  311c66:      	movdqa	xmmword ptr [rbp - 0x10], xmm1
  311c6b:      	pxor	xmm2, xmm0
  311c6f:      	movdqa	xmmword ptr [rbp - 0x150], xmm2
  311c77:      	movdqu	xmm6, xmmword ptr [rcx]
  311c7b:      	pshufb	xmm6, xmmword ptr [rip - 0x2659c4] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  311c84:      	movups	xmm0, xmmword ptr [rdi + 0xa0]
  311c8b:      	movaps	xmmword ptr [rbp - 0x40], xmm0
  311c8f:      	movups	xmm0, xmmword ptr [rdi + 0x10]
  311c93:      	movaps	xmmword ptr [rbp - 0x130], xmm0
  311c9a:      	movups	xmm0, xmmword ptr [rdi + 0x20]
  311c9e:      	movaps	xmmword ptr [rbp - 0x120], xmm0
  311ca5:      	movups	xmm0, xmmword ptr [rdi + 0x30]
  311ca9:      	movaps	xmmword ptr [rbp - 0x110], xmm0
  311cb0:      	movups	xmm0, xmmword ptr [rdi + 0x40]
  311cb4:      	movaps	xmmword ptr [rbp - 0x100], xmm0
  311cbb:      	movups	xmm0, xmmword ptr [rdi + 0x50]
  311cbf:      	movaps	xmmword ptr [rbp - 0xf0], xmm0
  311cc6:      	movups	xmm0, xmmword ptr [rdi + 0x60]
  311cca:      	movaps	xmmword ptr [rbp - 0xe0], xmm0
  311cd1:      	shl	rax, 0x3
  311cd5:      	add	r8, 0x70
  311cd9:      	xor	r10d, r10d
  311cdc:      	movabs	rdx, -0x3e00000000000000
  311ce6:      	xor	esi, esi
  311ce8:      	movups	xmm0, xmmword ptr [rdi + 0x70]
  311cec:      	movaps	xmmword ptr [rbp - 0xd0], xmm0
  311cf3:      	movups	xmm0, xmmword ptr [rdi + 0x80]
  311cfa:      	movaps	xmmword ptr [rbp - 0x140], xmm0
  311d01:      	movdqu	xmm0, xmmword ptr [rdi + 0x90]
  311d09:      	movdqa	xmmword ptr [rbp - 0xc0], xmm0
  311d11:      	nop	word ptr cs:[rax + rax]
  311d20:      	movdqu	xmm12, xmmword ptr [r8 - 0x70]
  311d26:      	movdqu	xmm4, xmmword ptr [r8 - 0x60]
  311d2c:      	movdqu	xmm13, xmmword ptr [r8 - 0x50]
  311d32:      	movdqu	xmm2, xmmword ptr [r8 - 0x40]
  311d38:      	lea	edi, [r10 + 0x9]
  311d3c:      	bswap	edi
  311d3e:      	movd	xmm0, edi
  311d42:      	lea	edi, [r10 + 0x6]
  311d46:      	bswap	edi
  311d48:      	pslldq	xmm0, 0xc               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3]
  311d4d:      	movd	xmm3, edi
  311d51:      	pslldq	xmm3, 0xc               # xmm3 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm3[0,1,2,3]
  311d56:      	lea	edi, [r10 + 0x5]
  311d5a:      	movdqa	xmm9, xmmword ptr [rbp - 0x10]
  311d60:      	pxor	xmm0, xmm9
  311d65:      	movdqa	xmm5, xmm0
  311d69:      	bswap	edi
  311d6b:      	movd	xmm0, edi
  311d6f:      	pslldq	xmm0, 0xc               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3]
  311d74:      	pxor	xmm3, xmm9
  311d79:      	lea	edi, [r10 + 0x4]
  311d7d:      	bswap	edi
  311d7f:      	movd	xmm1, edi
  311d83:      	pxor	xmm0, xmm9
  311d88:      	pslldq	xmm1, 0xc               # xmm1 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm1[0,1,2,3]
  311d8d:      	pxor	xmm1, xmm9
  311d92:      	movdqa	xmm7, xmmword ptr [rbp - 0x130]
  311d9a:      	aesenc	xmm5, xmm7
  311d9f:      	movdqa	xmmword ptr [rbp - 0x210], xmm5
  311da7:      	lea	edi, [r10 + 0x3]
  311dab:      	bswap	edi
  311dad:      	aesenc	xmm3, xmm7
  311db2:      	movd	xmm5, edi
  311db6:      	pslldq	xmm5, 0xc               # xmm5 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm5[0,1,2,3]
  311dbb:      	aesenc	xmm0, xmm7
  311dc0:      	pxor	xmm5, xmm9
  311dc5:      	movdqa	xmm8, xmm5
  311dca:      	lea	edi, [r10 + 0x2]
  311dce:      	aesenc	xmm1, xmm7
  311dd3:      	bswap	edi
  311dd5:      	movd	xmm10, edi
  311dda:      	aesenc	xmm8, xmm7
  311de0:      	pslldq	xmm10, 0xc              # xmm10 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm10[0,1,2,3]
  311de6:      	pxor	xmm10, xmm9
  311deb:      	aesenc	xmm10, xmm7
  311df1:      	movdqa	xmm5, xmmword ptr [rbp - 0x120]
  311df9:      	aesenc	xmm10, xmm5
  311dff:      	aesenc	xmm8, xmm5
  311e05:      	aesenc	xmm1, xmm5
  311e0a:      	aesenc	xmm0, xmm5
  311e0f:      	aesenc	xmm3, xmm5
  311e14:      	movdqa	xmm5, xmmword ptr [rbp - 0x110]
  311e1c:      	aesenc	xmm10, xmm5
  311e22:      	aesenc	xmm8, xmm5
  311e28:      	aesenc	xmm1, xmm5
  311e2d:      	aesenc	xmm0, xmm5
  311e32:      	aesenc	xmm3, xmm5
  311e37:      	movdqa	xmm5, xmmword ptr [rbp - 0x100]
  311e3f:      	aesenc	xmm10, xmm5
  311e45:      	aesenc	xmm8, xmm5
  311e4b:      	aesenc	xmm1, xmm5
  311e50:      	aesenc	xmm0, xmm5
  311e55:      	aesenc	xmm3, xmm5
  311e5a:      	movdqa	xmm5, xmmword ptr [rbp - 0xf0]
  311e62:      	aesenc	xmm10, xmm5
  311e68:      	aesenc	xmm8, xmm5
  311e6e:      	aesenc	xmm1, xmm5
  311e73:      	aesenc	xmm0, xmm5
  311e78:      	aesenc	xmm3, xmm5
  311e7d:      	movdqa	xmm5, xmmword ptr [rbp - 0xe0]
  311e85:      	aesenc	xmm10, xmm5
  311e8b:      	aesenc	xmm8, xmm5
  311e91:      	aesenc	xmm1, xmm5
  311e96:      	aesenc	xmm0, xmm5
  311e9b:      	aesenc	xmm3, xmm5
  311ea0:      	movdqa	xmm5, xmmword ptr [rbp - 0xd0]
  311ea8:      	aesenc	xmm10, xmm5
  311eae:      	aesenc	xmm8, xmm5
  311eb4:      	aesenc	xmm1, xmm5
  311eb9:      	aesenc	xmm0, xmm5
  311ebe:      	aesenc	xmm3, xmm5
  311ec3:      	movdqa	xmm7, xmmword ptr [rbp - 0x140]
  311ecb:      	aesenc	xmm10, xmm7
  311ed1:      	aesenc	xmm8, xmm7
  311ed7:      	aesenc	xmm1, xmm7
  311edc:      	aesenc	xmm0, xmm7
  311ee1:      	movdqa	xmm5, xmm0
  311ee5:      	movdqa	xmm11, xmmword ptr [rbp - 0xc0]
  311eee:      	aesenc	xmm5, xmm11
  311ef4:      	movdqa	xmm0, xmm1
  311ef8:      	aesenc	xmm0, xmm11
  311efe:      	aesenc	xmm8, xmm11
  311f04:      	aesenc	xmm10, xmm11
  311f0a:      	movdqa	xmm9, xmmword ptr [rbp - 0x40]
  311f10:      	aesenclast	xmm10, xmm9
  311f16:      	pxor	xmm10, xmm12
  311f1b:      	aesenclast	xmm8, xmm9
  311f21:      	pxor	xmm8, xmm4
  311f26:      	movdqa	xmmword ptr [rbp - 0x1d0], xmm8
  311f2f:      	movdqa	xmm1, xmm4
  311f33:      	aesenclast	xmm0, xmm9
  311f39:      	pxor	xmm0, xmm13
  311f3e:      	movdqa	xmmword ptr [rbp - 0x200], xmm0
  311f46:      	aesenclast	xmm5, xmm9
  311f4c:      	pxor	xmm5, xmm2
  311f50:      	movdqa	xmmword ptr [rbp - 0x1f0], xmm5
  311f58:      	movdqa	xmm0, xmmword ptr [rip - 0x265ca0] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  311f60:      	pshufb	xmm12, xmm0
  311f66:      	aesenc	xmm3, xmm7
  311f6b:      	pshufb	xmm1, xmm0
  311f70:      	movdqu	xmm14, xmmword ptr [r8 - 0x30]
  311f76:      	aesenc	xmm3, xmm11
  311f7c:      	pshufb	xmm13, xmm0
  311f82:      	aesenclast	xmm3, xmm9
  311f88:      	pxor	xmm3, xmm14
  311f8d:      	movdqa	xmmword ptr [rbp - 0x1e0], xmm3
  311f95:      	pshufb	xmm2, xmm0
  311f9a:      	add	rsi, 0x8
  311f9e:      	mov	edi, esi
  311fa0:      	pshufb	xmm14, xmm0
  311fa6:      	bswap	edi
  311fa8:      	movd	xmm11, edi
  311fad:      	pslldq	xmm11, 0xc              # xmm11 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm11[0,1,2,3]
  311fb3:      	pxor	xmm12, xmm6
  311fb8:      	movdqa	xmm0, xmm1
  311fbc:      	pshufd	xmm9, xmm1, 0xee        # xmm9 = xmm1[2,3,2,3]
  311fc2:      	pxor	xmm9, xmm1
  311fc7:      	movdqa	xmm15, xmm13
  311fcc:      	pshufd	xmm8, xmm13, 0xee       # xmm8 = xmm13[2,3,2,3]
  311fd2:      	pxor	xmm8, xmm13
  311fd7:      	movdqa	xmm3, xmmword ptr [rbp - 0xb0]
  311fdf:      	pclmulqdq	xmm1, xmm3, 0x0
  311fe5:      	movdqa	xmm4, xmmword ptr [rbp - 0xa0]
  311fed:      	pclmulqdq	xmm13, xmm4, 0x0
  311ff4:      	pxor	xmm13, xmm1
  311ff9:      	movdqa	xmm1, xmm12
  311ffe:      	lea	edi, [r10 + 0x7]
  312002:      	bswap	edi
  312004:      	pclmulqdq	xmm0, xmm3, 0x11
  31200a:      	pclmulqdq	xmm1, xmmword ptr [rbp - 0x30], 0x11
  312011:      	pclmulqdq	xmm9, xmmword ptr [rbp - 0x1b0], 0x0
  31201c:      	pclmulqdq	xmm15, xmm4, 0x11
  312023:      	pxor	xmm15, xmm0
  312028:      	pxor	xmm15, xmm1
  31202d:      	pclmulqdq	xmm8, xmmword ptr [rbp - 0x1a0], 0x0
  312038:      	movdqa	xmm0, xmm2
  31203c:      	pshufd	xmm1, xmm2, 0xee        # xmm1 = xmm2[2,3,2,3]
  312041:      	pxor	xmm8, xmm9
  312046:      	pxor	xmm1, xmm2
  31204a:      	movdqa	xmm5, xmm14
  31204f:      	movdqa	xmm4, xmmword ptr [rbp - 0x90]
  312057:      	pclmulqdq	xmm0, xmm4, 0x11
  31205d:      	movdqa	xmm3, xmmword ptr [rbp - 0x80]
  312062:      	pclmulqdq	xmm5, xmm3, 0x11
  312068:      	pxor	xmm5, xmm0
  31206c:      	pshufd	xmm9, xmm14, 0xee       # xmm9 = xmm14[2,3,2,3]
  312072:      	pclmulqdq	xmm2, xmm4, 0x0
  312078:      	pxor	xmm9, xmm14
  31207d:      	movdqa	xmm6, xmm14
  312082:      	pclmulqdq	xmm6, xmm3, 0x0
  312088:      	pxor	xmm6, xmm2
  31208c:      	movd	xmm14, edi
  312091:      	pslldq	xmm14, 0xc              # xmm14 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm14[0,1,2,3]
  312097:      	movdqa	xmm0, xmmword ptr [rbp - 0x10]
  31209c:      	pxor	xmm14, xmm0
  3120a1:      	pxor	xmm11, xmm0
  3120a6:      	movdqa	xmm0, xmmword ptr [rbp - 0x130]
  3120ae:      	aesenc	xmm14, xmm0
  3120b4:      	aesenc	xmm11, xmm0
  3120ba:      	movdqa	xmm0, xmmword ptr [rbp - 0x120]
  3120c2:      	aesenc	xmm14, xmm0
  3120c8:      	aesenc	xmm11, xmm0
  3120ce:      	movdqa	xmm4, xmmword ptr [rbp - 0x210]
  3120d6:      	aesenc	xmm4, xmm0
  3120db:      	movdqa	xmm0, xmmword ptr [rbp - 0x110]
  3120e3:      	aesenc	xmm14, xmm0
  3120e9:      	aesenc	xmm4, xmm0
  3120ee:      	aesenc	xmm11, xmm0
  3120f4:      	movdqa	xmm0, xmmword ptr [rbp - 0x100]
  3120fc:      	aesenc	xmm14, xmm0
  312102:      	aesenc	xmm11, xmm0
  312108:      	aesenc	xmm4, xmm0
  31210d:      	movdqa	xmm0, xmmword ptr [rbp - 0xf0]
  312115:      	aesenc	xmm14, xmm0
  31211b:      	aesenc	xmm4, xmm0
  312120:      	aesenc	xmm11, xmm0
  312126:      	movdqa	xmm0, xmmword ptr [rbp - 0xe0]
  31212e:      	aesenc	xmm14, xmm0
  312134:      	aesenc	xmm11, xmm0
  31213a:      	pclmulqdq	xmm1, xmmword ptr [rbp - 0x190], 0x0
  312144:      	aesenc	xmm4, xmm0
  312149:      	pclmulqdq	xmm9, xmmword ptr [rbp - 0x180], 0x0
  312154:      	pxor	xmm9, xmm1
  312159:      	movdqa	xmm0, xmmword ptr [rbp - 0xd0]
  312161:      	aesenc	xmm14, xmm0
  312167:      	pshufd	xmm1, xmm12, 0xee       # xmm1 = xmm12[2,3,2,3]
  31216d:      	pxor	xmm1, xmm12
  312172:      	aesenc	xmm14, xmm7
  312178:      	pclmulqdq	xmm12, xmmword ptr [rbp - 0x30], 0x0
  312180:      	movdqa	xmm3, xmmword ptr [rbp - 0xc0]
  312188:      	aesenc	xmm14, xmm3
  31218e:      	pxor	xmm13, xmm12
  312193:      	movdqu	xmm2, xmmword ptr [r8 - 0x20]
  312199:      	aesenclast	xmm14, xmmword ptr [rbp - 0x40]
  3121a0:      	pxor	xmm14, xmm2
  3121a5:      	aesenc	xmm11, xmm0
  3121ab:      	pshufb	xmm2, xmmword ptr [rip - 0x265ef4] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  3121b4:      	pclmulqdq	xmm1, xmmword ptr [rbp - 0x1c0], 0x0
  3121be:      	aesenc	xmm4, xmm0
  3121c3:      	pxor	xmm8, xmm1
  3121c8:      	movdqa	xmm12, xmm2
  3121cd:      	aesenc	xmm11, xmm7
  3121d3:      	movdqa	xmm0, xmmword ptr [rbp - 0x70]
  3121d8:      	pclmulqdq	xmm12, xmm0, 0x11
  3121df:      	pxor	xmm12, xmm5
  3121e4:      	aesenc	xmm4, xmm7
  3121e9:      	pshufd	xmm1, xmm2, 0xee        # xmm1 = xmm2[2,3,2,3]
  3121ee:      	pxor	xmm1, xmm2
  3121f2:      	aesenc	xmm4, xmm3
  3121f7:      	movdqa	xmm5, xmm3
  3121fb:      	movdqa	xmm3, xmm2
  3121ff:      	pclmulqdq	xmm3, xmm0, 0x0
  312205:      	aesenc	xmm11, xmm5
  31220b:      	pxor	xmm3, xmm6
  31220f:      	movdqu	xmm0, xmmword ptr [r8 - 0x10]
  312215:      	movdqa	xmm2, xmmword ptr [rbp - 0x40]
  31221a:      	aesenclast	xmm11, xmm2
  312220:      	pxor	xmm11, xmm0
  312225:      	aesenclast	xmm4, xmm2
  31222a:      	pxor	xmm12, xmm15
  31222f:      	movdqu	xmm15, xmmword ptr [r8]
  312234:      	pxor	xmm4, xmm15
  312239:      	movdqa	xmm2, xmmword ptr [rip - 0x265f81] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  312241:      	pshufb	xmm0, xmm2
  312246:      	pshufb	xmm15, xmm2
  31224c:      	pclmulqdq	xmm1, xmmword ptr [rbp - 0x170], 0x0
  312256:      	pxor	xmm1, xmm9
  31225b:      	pxor	xmm3, xmm13
  312260:      	movdqa	xmm9, xmm0
  312265:      	movdqa	xmm2, xmm15
  31226a:      	movdqa	xmm5, xmmword ptr [rbp - 0x50]
  31226f:      	pclmulqdq	xmm2, xmm5, 0x0
  312275:      	movdqa	xmm6, xmmword ptr [rbp - 0x60]
  31227a:      	pclmulqdq	xmm9, xmm6, 0x0
  312281:      	pxor	xmm2, xmm9
  312286:      	pshufd	xmm9, xmm0, 0xee        # xmm9 = xmm0[2,3,2,3]
  31228c:      	pxor	xmm9, xmm0
  312291:      	pxor	xmm2, xmm3
  312295:      	pshufd	xmm13, xmm15, 0xee      # xmm13 = xmm15[2,3,2,3]
  31229b:      	pxor	xmm13, xmm15
  3122a0:      	movdqa	xmm3, xmm15
  3122a5:      	pclmulqdq	xmm0, xmm6, 0x11
  3122ab:      	pclmulqdq	xmm3, xmm5, 0x11
  3122b1:      	pxor	xmm3, xmm0
  3122b5:      	pclmulqdq	xmm9, xmmword ptr [rbp - 0x160], 0x0
  3122c0:      	pclmulqdq	xmm13, xmmword ptr [rbp - 0x150], 0x0
  3122cb:      	pxor	xmm13, xmm9
  3122d0:      	movdqu	xmmword ptr [r8 - 0x70], xmm10
  3122d6:      	pxor	xmm1, xmm8
  3122db:      	movaps	xmm0, xmmword ptr [rbp - 0x1d0]
  3122e2:      	movups	xmmword ptr [r8 - 0x60], xmm0
  3122e7:      	movaps	xmm0, xmmword ptr [rbp - 0x200]
  3122ee:      	movups	xmmword ptr [r8 - 0x50], xmm0
  3122f3:      	movaps	xmm0, xmmword ptr [rbp - 0x1f0]
  3122fa:      	movups	xmmword ptr [r8 - 0x40], xmm0
  3122ff:      	pxor	xmm3, xmm12
  312304:      	movaps	xmm0, xmmword ptr [rbp - 0x1e0]
  31230b:      	movups	xmmword ptr [r8 - 0x30], xmm0
  312310:      	movdqu	xmmword ptr [r8 - 0x20], xmm14
  312316:      	movdqu	xmmword ptr [r8 - 0x10], xmm11
  31231c:      	pxor	xmm13, xmm1
  312321:      	movdqa	xmm0, xmm2
  312325:      	pxor	xmm0, xmm3
  312329:      	pxor	xmm0, xmm13
  31232e:      	movdqu	xmmword ptr [r8], xmm4
  312333:      	movdqa	xmm1, xmm0
  312337:      	pslldq	xmm1, 0x8               # xmm1 = zero,zero,zero,zero,zero,zero,zero,zero,xmm1[0,1,2,3,4,5,6,7]
  31233c:      	pxor	xmm1, xmm2
  312340:      	pshufd	xmm2, xmm1, 0x4e        # xmm2 = xmm1[2,3,0,1]
  312345:      	movq	xmm4, rdx
  31234a:      	pclmulqdq	xmm1, xmm4, 0x0
  312350:      	pxor	xmm1, xmm2
  312354:      	psrldq	xmm0, 0x8               # xmm0 = xmm0[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero
  312359:      	pshufd	xmm6, xmm1, 0x4e        # xmm6 = xmm1[2,3,0,1]
  31235e:      	pxor	xmm6, xmm0
  312362:      	pclmulqdq	xmm1, xmm4, 0x0
  312368:      	pxor	xmm6, xmm3
  31236c:      	pxor	xmm6, xmm1
  312370:      	sub	r8, -0x80
  312374:      	mov	r10, rsi
  312377:      	cmp	rax, rsi
  31237a:      	jne	0x311d20 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, true>+0x220>
  312380:      	pshufb	xmm6, xmmword ptr [rip - 0x2660c9] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  312389:      	movdqu	xmmword ptr [rcx], xmm6
  31238d:      	movabs	rax, 0x7fffffffffffff80
  312397:      	and	r9, rax
  31239a:      	jmp	0x31239f <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, true>+0x89f>
  31239c:      	xor	r9d, r9d
  31239f:      	mov	rax, r9
  3123a2:      	add	rsp, 0x210
  3123a9:      	pop	rbp
  3123aa:      	ret
  3123ab:      	lea	rdi, [rip - 0x20600f]   # 0x10c3a3 <anon.8182237a801038de36885de64d2c176c.5.llvm.10465402473772549265>
  3123b2:      	lea	rcx, [rip + 0x4f2537]   # 0x8048f0 <anon.8182237a801038de36885de64d2c176c.1.llvm.10465402473772549265>
  3123b9:      	mov	esi, 0x237
  3123be:      	xor	edx, edx
  3123c0:      	call	qword ptr [rip + 0x5659ba] # 0x877d80 <sdallocx+0x877d80>
  3123c6:      	int3
  3123c7:      	int3
  3123c8:      	int3
  3123c9:      	int3
  3123ca:      	int3
  3123cb:      	int3
  3123cc:      	int3
  3123cd:      	int3
  3123ce:      	int3
  3123cf:      	int3
