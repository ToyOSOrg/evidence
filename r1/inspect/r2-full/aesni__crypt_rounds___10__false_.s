
stage/probe-full-7dcf12a5a:	file format elf64-x86-64

Disassembly of section .text:

0000000000310cd0 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, false>>:
  310cd0:      	push	rbp
  310cd1:      	mov	rbp, rsp
  310cd4:      	push	r15
  310cd6:      	push	r14
  310cd8:      	push	r13
  310cda:      	push	r12
  310cdc:      	push	rbx
  310cdd:      	sub	rsp, 0x1f8
  310ce4:      	mov	rax, r9
  310ce7:      	shr	rax, 0x7
  310ceb:      	je	0x311ac2 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, false>+0xdf2>
  310cf1:      	movdqa	xmm1, xmmword ptr [rsi + 0x280]
  310cf9:      	movdqa	xmm10, xmmword ptr [rsi + 0x290]
  310d02:      	movdqa	xmm15, xmmword ptr [rsi + 0x2a0]
  310d0b:      	movaps	xmm14, xmmword ptr [rsi + 0x2b0]
  310d13:      	movdqa	xmm13, xmmword ptr [rsi + 0x2c0]
  310d1c:      	movdqa	xmm12, xmmword ptr [rsi + 0x2d0]
  310d25:      	movaps	xmm0, xmmword ptr [rsi + 0x2e0]
  310d2c:      	movaps	xmmword ptr [rbp - 0x60], xmm0
  310d30:      	movaps	xmm0, xmmword ptr [rsi + 0x2f0]
  310d37:      	movaps	xmmword ptr [rbp - 0x70], xmm0
  310d3b:      	movdqu	xmm4, xmmword ptr [rdi]
  310d3f:      	xorps	xmm0, xmm0
  310d42:      	movaps	xmmword ptr [rbp - 0x40], xmm0
  310d46:      	lea	rsi, [rbp - 0x40]
  310d4a:      	mov	r10, rdx
  310d4d:      	sub	r10, rsi
  310d50:      	sub	rsi, rdx
  310d53:      	cmovb	rsi, r10
  310d57:      	cmp	rsi, 0xb
  310d5b:      	jbe	0x311ada <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, false>+0xe0a>
  310d61:      	mov	esi, dword ptr [rdx + 0x8]
  310d64:      	mov	dword ptr [rbp - 0x38], esi
  310d67:      	mov	rdx, qword ptr [rdx]
  310d6a:      	mov	qword ptr [rbp - 0x40], rdx
  310d6e:      	pxor	xmm4, xmmword ptr [rbp - 0x40]
  310d73:      	movdqa	xmm5, xmmword ptr [rip - 0x264d6b] # 0xac010 <anon.e81663b63ab83dbb5a37e8fa4238500b.6.llvm.14128926338108641276+0xc0>
  310d7b:      	pxor	xmm5, xmm4
  310d7f:      	movdqa	xmm7, xmmword ptr [rip - 0x265757] # 0xab630 <anon.0b2aa08f77b92a096c4b4e8601736de0.2.llvm.10746933672069200717+0x90>
  310d87:      	pxor	xmm7, xmm4
  310d8b:      	movdqa	xmm9, xmmword ptr [rip - 0x265754] # 0xab640 <anon.0b2aa08f77b92a096c4b4e8601736de0.2.llvm.10746933672069200717+0xa0>
  310d94:      	pxor	xmm9, xmm4
  310d99:      	movdqa	xmm11, xmmword ptr [rip - 0x265bf2] # 0xab1b0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.13.llvm.14024894901458550281+0xd0>
  310da2:      	pxor	xmm11, xmm4
  310da7:      	movdqa	xmm3, xmmword ptr [rip - 0x2654ff] # 0xab8b0 <anon.0b2aa08f77b92a096c4b4e8601736de0.2.llvm.10746933672069200717+0x310>
  310daf:      	pxor	xmm3, xmm4
  310db3:      	movdqa	xmm2, xmmword ptr [rip - 0x2659bb] # 0xab400 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.13.llvm.14024894901458550281+0x320>
  310dbb:      	pxor	xmm2, xmm4
  310dbf:      	movaps	xmmword ptr [rbp - 0x50], xmm14
  310dc4:      	movdqa	xmm14, xmm1
  310dc9:      	movdqa	xmm1, xmmword ptr [rip - 0x265941] # 0xab490 <anon.e81663b63ab83dbb5a37e8fa4238500b.8.llvm.14128926338108641276+0x10>
  310dd1:      	pxor	xmm1, xmm4
  310dd5:      	movdqa	xmm0, xmmword ptr [rip - 0x264e6d] # 0xabf70 <anon.e81663b63ab83dbb5a37e8fa4238500b.6.llvm.14128926338108641276+0x20>
  310ddd:      	movdqa	xmmword ptr [rbp - 0x1f0], xmm4
  310de5:      	pxor	xmm0, xmm4
  310de9:      	movdqu	xmm4, xmmword ptr [rdi + 0x10]
  310dee:      	movdqu	xmm6, xmmword ptr [rdi + 0x20]
  310df3:      	aesenc	xmm5, xmm4
  310df8:      	aesenc	xmm7, xmm4
  310dfd:      	aesenc	xmm9, xmm4
  310e03:      	aesenc	xmm11, xmm4
  310e09:      	aesenc	xmm3, xmm4
  310e0e:      	aesenc	xmm2, xmm4
  310e13:      	aesenc	xmm1, xmm4
  310e18:      	movdqu	xmm8, xmmword ptr [rdi + 0x30]
  310e1e:      	aesenc	xmm0, xmm4
  310e23:      	movdqu	xmm4, xmmword ptr [rdi + 0x40]
  310e28:      	aesenc	xmm5, xmm6
  310e2d:      	aesenc	xmm7, xmm6
  310e32:      	aesenc	xmm9, xmm6
  310e38:      	aesenc	xmm11, xmm6
  310e3e:      	aesenc	xmm3, xmm6
  310e43:      	aesenc	xmm2, xmm6
  310e48:      	aesenc	xmm1, xmm6
  310e4d:      	aesenc	xmm0, xmm6
  310e52:      	aesenc	xmm5, xmm8
  310e58:      	aesenc	xmm7, xmm8
  310e5e:      	aesenc	xmm9, xmm8
  310e64:      	aesenc	xmm11, xmm8
  310e6a:      	aesenc	xmm3, xmm8
  310e70:      	aesenc	xmm2, xmm8
  310e76:      	aesenc	xmm1, xmm8
  310e7c:      	aesenc	xmm0, xmm8
  310e82:      	aesenc	xmm5, xmm4
  310e87:      	aesenc	xmm7, xmm4
  310e8c:      	aesenc	xmm9, xmm4
  310e92:      	aesenc	xmm11, xmm4
  310e98:      	aesenc	xmm3, xmm4
  310e9d:      	aesenc	xmm2, xmm4
  310ea2:      	aesenc	xmm1, xmm4
  310ea7:      	aesenc	xmm0, xmm4
  310eac:      	movdqu	xmm4, xmmword ptr [rdi + 0x50]
  310eb1:      	aesenc	xmm5, xmm4
  310eb6:      	aesenc	xmm7, xmm4
  310ebb:      	aesenc	xmm9, xmm4
  310ec1:      	aesenc	xmm11, xmm4
  310ec7:      	aesenc	xmm3, xmm4
  310ecc:      	aesenc	xmm2, xmm4
  310ed1:      	aesenc	xmm1, xmm4
  310ed6:      	aesenc	xmm0, xmm4
  310edb:      	movdqu	xmm4, xmmword ptr [rdi + 0x60]
  310ee0:      	aesenc	xmm5, xmm4
  310ee5:      	aesenc	xmm7, xmm4
  310eea:      	aesenc	xmm9, xmm4
  310ef0:      	aesenc	xmm11, xmm4
  310ef6:      	aesenc	xmm3, xmm4
  310efb:      	aesenc	xmm2, xmm4
  310f00:      	aesenc	xmm1, xmm4
  310f05:      	aesenc	xmm0, xmm4
  310f0a:      	movdqu	xmm4, xmmword ptr [rdi + 0x70]
  310f0f:      	aesenc	xmm5, xmm4
  310f14:      	aesenc	xmm7, xmm4
  310f19:      	aesenc	xmm9, xmm4
  310f1f:      	aesenc	xmm11, xmm4
  310f25:      	aesenc	xmm3, xmm4
  310f2a:      	aesenc	xmm2, xmm4
  310f2f:      	aesenc	xmm1, xmm4
  310f34:      	aesenc	xmm0, xmm4
  310f39:      	movdqu	xmm4, xmmword ptr [rdi + 0x80]
  310f41:      	aesenc	xmm5, xmm4
  310f46:      	aesenc	xmm7, xmm4
  310f4b:      	aesenc	xmm9, xmm4
  310f51:      	aesenc	xmm11, xmm4
  310f57:      	aesenc	xmm3, xmm4
  310f5c:      	aesenc	xmm2, xmm4
  310f61:      	aesenc	xmm1, xmm4
  310f66:      	aesenc	xmm0, xmm4
  310f6b:      	movdqu	xmm4, xmmword ptr [rdi + 0x90]
  310f73:      	aesenc	xmm5, xmm4
  310f78:      	aesenc	xmm7, xmm4
  310f7d:      	aesenc	xmm9, xmm4
  310f83:      	aesenc	xmm11, xmm4
  310f89:      	aesenc	xmm3, xmm4
  310f8e:      	aesenc	xmm2, xmm4
  310f93:      	aesenc	xmm1, xmm4
  310f98:      	pshufd	xmm6, xmm14, 0xee       # xmm6 = xmm14[2,3,2,3]
  310f9e:      	aesenc	xmm0, xmm4
  310fa3:      	movdqu	xmm8, xmmword ptr [rdi + 0xa0]
  310fac:      	aesenclast	xmm5, xmm8
  310fb2:      	aesenclast	xmm7, xmm8
  310fb8:      	aesenclast	xmm9, xmm8
  310fbe:      	aesenclast	xmm11, xmm8
  310fc4:      	movdqa	xmmword ptr [rbp - 0x140], xmm14
  310fcd:      	pxor	xmm6, xmm14
  310fd2:      	movdqa	xmmword ptr [rbp - 0x100], xmm6
  310fda:      	movdqu	xmm4, xmmword ptr [r8]
  310fdf:      	pxor	xmm4, xmm5
  310fe3:      	movdqu	xmm5, xmmword ptr [r8 + 0x10]
  310fe9:      	pxor	xmm5, xmm7
  310fed:      	movdqu	xmm6, xmmword ptr [r8 + 0x20]
  310ff3:      	pxor	xmm6, xmm9
  310ff8:      	movdqa	xmm9, xmm8
  310ffd:      	movdqu	xmm7, xmmword ptr [r8 + 0x30]
  311003:      	pxor	xmm7, xmm11
  311008:      	pshufd	xmm8, xmm10, 0xee       # xmm8 = xmm10[2,3,2,3]
  31100e:      	movdqa	xmmword ptr [rbp - 0x130], xmm10
  311017:      	pxor	xmm8, xmm10
  31101c:      	movdqa	xmmword ptr [rbp - 0xb0], xmm8
  311025:      	movdqu	xmmword ptr [r8], xmm4
  31102a:      	movdqu	xmmword ptr [r8 + 0x10], xmm5
  311030:      	pshufd	xmm5, xmm15, 0xee       # xmm5 = xmm15[2,3,2,3]
  311036:      	movdqa	xmm14, xmm15
  31103b:      	pxor	xmm5, xmm15
  311040:      	movdqa	xmmword ptr [rbp - 0xd0], xmm5
  311048:      	movdqu	xmmword ptr [r8 + 0x20], xmm6
  31104e:      	movdqa	xmm6, xmmword ptr [rbp - 0x50]
  311053:      	pshufd	xmm5, xmm6, 0xee        # xmm5 = xmm6[2,3,2,3]
  311058:      	pxor	xmm5, xmm6
  31105c:      	movdqa	xmmword ptr [rbp - 0x110], xmm5
  311064:      	aesenclast	xmm3, xmm9
  31106a:      	movdqu	xmmword ptr [r8 + 0x30], xmm7
  311070:      	movdqu	xmm5, xmmword ptr [r8 + 0x40]
  311076:      	pxor	xmm5, xmm3
  31107a:      	pshufd	xmm15, xmm13, 0xee      # xmm15 = xmm13[2,3,2,3]
  311080:      	pxor	xmm15, xmm13
  311085:      	aesenclast	xmm2, xmm9
  31108b:      	movdqu	xmmword ptr [r8 + 0x40], xmm5
  311091:      	movdqu	xmm3, xmmword ptr [r8 + 0x50]
  311097:      	pxor	xmm3, xmm2
  31109b:      	pshufd	xmm11, xmm12, 0xee      # xmm11 = xmm12[2,3,2,3]
  3110a1:      	pxor	xmm11, xmm12
  3110a6:      	aesenclast	xmm1, xmm9
  3110ac:      	movdqu	xmmword ptr [r8 + 0x50], xmm3
  3110b2:      	movdqu	xmm2, xmmword ptr [r8 + 0x60]
  3110b8:      	pxor	xmm2, xmm1
  3110bc:      	movdqa	xmm1, xmmword ptr [rbp - 0x60]
  3110c1:      	pshufd	xmm8, xmm1, 0xee        # xmm8 = xmm1[2,3,2,3]
  3110c7:      	aesenclast	xmm0, xmm9
  3110cd:      	pxor	xmm8, xmm1
  3110d2:      	movdqu	xmmword ptr [r8 + 0x60], xmm2
  3110d8:      	movdqu	xmm1, xmmword ptr [r8 + 0x70]
  3110de:      	pxor	xmm1, xmm0
  3110e2:      	movdqa	xmm2, xmmword ptr [rbp - 0x70]
  3110e7:      	pshufd	xmm0, xmm2, 0xee        # xmm0 = xmm2[2,3,2,3]
  3110ec:      	pxor	xmm0, xmm2
  3110f0:      	movdqu	xmmword ptr [r8 + 0x70], xmm1
  3110f6:      	movdqu	xmm6, xmmword ptr [rcx]
  3110fa:      	pshufb	xmm6, xmmword ptr [rip - 0x264e43] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  311103:      	movabs	rdx, -0x3e00000000000000
  31110d:      	cmp	rax, 0x1
  311111:      	movdqa	xmmword ptr [rbp - 0x120], xmm0
  311119:      	movdqa	xmmword ptr [rbp - 0xf0], xmm8
  311122:      	movdqa	xmmword ptr [rbp - 0xe0], xmm12
  31112b:      	movdqa	xmmword ptr [rbp - 0xc0], xmm11
  311134:      	movdqa	xmmword ptr [rbp - 0xa0], xmm13
  31113d:      	movdqa	xmmword ptr [rbp - 0x90], xmm15
  311146:      	movdqa	xmmword ptr [rbp - 0x80], xmm14
  31114c:      	je	0x311837 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, false>+0xb67>
  311152:      	movups	xmm1, xmmword ptr [rdi + 0x10]
  311156:      	movaps	xmmword ptr [rbp - 0x1d0], xmm1
  31115d:      	movups	xmm1, xmmword ptr [rdi + 0x20]
  311161:      	movaps	xmmword ptr [rbp - 0x1b0], xmm1
  311168:      	movups	xmm1, xmmword ptr [rdi + 0x30]
  31116c:      	movaps	xmmword ptr [rbp - 0x170], xmm1
  311173:      	movups	xmm1, xmmword ptr [rdi + 0x40]
  311177:      	movaps	xmmword ptr [rbp - 0x1a0], xmm1
  31117e:      	movups	xmm1, xmmword ptr [rdi + 0x50]
  311182:      	movaps	xmmword ptr [rbp - 0x180], xmm1
  311189:      	movups	xmm1, xmmword ptr [rdi + 0x60]
  31118d:      	movaps	xmmword ptr [rbp - 0x1c0], xmm1
  311194:      	movups	xmm1, xmmword ptr [rdi + 0x70]
  311198:      	movaps	xmmword ptr [rbp - 0x190], xmm1
  31119f:      	movups	xmm1, xmmword ptr [rdi + 0x80]
  3111a6:      	movaps	xmmword ptr [rbp - 0x160], xmm1
  3111ad:      	movdqu	xmm1, xmmword ptr [rdi + 0x90]
  3111b5:      	movdqa	xmmword ptr [rbp - 0x150], xmm1
  3111bd:      	lea	rsi, [r8 + 0xf0]
  3111c4:      	lea	rdi, [rax - 0x1]
  3111c8:      	mov	r10d, 0x11
  3111ce:      	movdqa	xmmword ptr [rbp - 0x1e0], xmm9
  3111d7:      	movdqa	xmm14, xmmword ptr [rbp - 0x170]
  3111e0:      	movdqa	xmm3, xmmword ptr [rbp - 0x180]
  3111e8:      	nop	dword ptr [rax + rax]
  3111f0:      	movdqa	xmm2, xmmword ptr [rip - 0x264f38] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  3111f8:      	pshufb	xmm4, xmm2
  3111fd:      	movdqu	xmm7, xmmword ptr [rsi - 0xe0]
  311205:      	movdqu	xmm8, xmmword ptr [rsi - 0xd0]
  31120e:      	pxor	xmm4, xmm6
  311212:      	movdqu	xmm13, xmmword ptr [rsi - 0xc0]
  31121b:      	movdqu	xmm0, xmmword ptr [rsi - 0xb0]
  311223:      	pshufb	xmm7, xmm2
  311228:      	pshufb	xmm8, xmm2
  31122e:      	pshufb	xmm13, xmm2
  311234:      	pshufb	xmm0, xmm2
  311239:      	movdqa	xmm11, xmm7
  31123e:      	pshufd	xmm10, xmm7, 0xee       # xmm10 = xmm7[2,3,2,3]
  311244:      	pxor	xmm10, xmm7
  311249:      	movdqa	xmm12, xmm7
  31124e:      	movdqa	xmm6, xmm8
  311253:      	movdqa	xmm9, xmmword ptr [rbp - 0x130]
  31125c:      	pclmulqdq	xmm12, xmm9, 0x0
  311263:      	pshufd	xmm7, xmm8, 0xee        # xmm7 = xmm8[2,3,2,3]
  311269:      	pxor	xmm7, xmm8
  31126e:      	movdqa	xmm1, xmmword ptr [rbp - 0x80]
  311273:      	pclmulqdq	xmm8, xmm1, 0x0
  31127a:      	pxor	xmm8, xmm12
  31127f:      	movdqa	xmm5, xmm4
  311283:      	movdqa	xmm15, xmmword ptr [rbp - 0x140]
  31128c:      	pclmulqdq	xmm5, xmm15, 0x11
  311293:      	pclmulqdq	xmm11, xmm9, 0x11
  31129a:      	pclmulqdq	xmm10, xmmword ptr [rbp - 0xb0], 0x0
  3112a5:      	pclmulqdq	xmm6, xmm1, 0x11
  3112ab:      	pxor	xmm6, xmm11
  3112b0:      	pxor	xmm6, xmm5
  3112b4:      	pclmulqdq	xmm7, xmmword ptr [rbp - 0xd0], 0x0
  3112be:      	movdqa	xmm5, xmm13
  3112c3:      	pshufd	xmm12, xmm13, 0xee      # xmm12 = xmm13[2,3,2,3]
  3112c9:      	pxor	xmm7, xmm10
  3112ce:      	pxor	xmm12, xmm13
  3112d3:      	movdqa	xmm10, xmm13
  3112d8:      	movdqa	xmm9, xmmword ptr [rbp - 0x60]
  3112de:      	movdqa	xmm11, xmm0
  3112e3:      	movdqa	xmm1, xmmword ptr [rbp - 0x50]
  3112e8:      	pclmulqdq	xmm5, xmm1, 0x11
  3112ee:      	movdqa	xmm13, xmmword ptr [rbp - 0xa0]
  3112f7:      	pclmulqdq	xmm11, xmm13, 0x11
  3112fe:      	pxor	xmm11, xmm5
  311303:      	pshufd	xmm5, xmm0, 0xee        # xmm5 = xmm0[2,3,2,3]
  311308:      	pclmulqdq	xmm10, xmm1, 0x0
  31130f:      	pxor	xmm5, xmm0
  311313:      	pclmulqdq	xmm0, xmm13, 0x0
  31131a:      	pxor	xmm0, xmm10
  31131f:      	pclmulqdq	xmm12, xmmword ptr [rbp - 0x110], 0x0
  31132a:      	pclmulqdq	xmm5, xmmword ptr [rbp - 0x90], 0x0
  311334:      	pxor	xmm5, xmm12
  311339:      	pshufd	xmm10, xmm4, 0xee       # xmm10 = xmm4[2,3,2,3]
  31133f:      	pxor	xmm10, xmm4
  311344:      	pclmulqdq	xmm4, xmm15, 0x0
  31134b:      	pxor	xmm8, xmm4
  311350:      	movdqu	xmm12, xmmword ptr [rsi - 0xa0]
  311359:      	pshufb	xmm12, xmm2
  31135f:      	pclmulqdq	xmm10, xmmword ptr [rbp - 0x100], 0x0
  31136a:      	pxor	xmm7, xmm10
  31136f:      	movdqa	xmm10, xmm12
  311374:      	movdqa	xmm15, xmmword ptr [rbp - 0xe0]
  31137d:      	pclmulqdq	xmm10, xmm15, 0x11
  311384:      	pxor	xmm10, xmm11
  311389:      	pshufd	xmm4, xmm12, 0xee       # xmm4 = xmm12[2,3,2,3]
  31138f:      	pxor	xmm4, xmm12
  311394:      	movdqa	xmm11, xmm12
  311399:      	movdqa	xmm1, xmmword ptr [rbp - 0x70]
  31139e:      	pclmulqdq	xmm11, xmm15, 0x0
  3113a5:      	pxor	xmm11, xmm0
  3113aa:      	pxor	xmm10, xmm6
  3113af:      	movdqu	xmm6, xmmword ptr [rsi - 0x90]
  3113b7:      	pshufb	xmm6, xmm2
  3113bc:      	pclmulqdq	xmm4, xmmword ptr [rbp - 0xc0], 0x0
  3113c6:      	pxor	xmm4, xmm5
  3113ca:      	movdqu	xmm5, xmmword ptr [rsi - 0x80]
  3113cf:      	pshufb	xmm5, xmm2
  3113d4:      	pxor	xmm11, xmm8
  3113d9:      	pxor	xmm4, xmm7
  3113dd:      	movdqa	xmm7, xmm6
  3113e1:      	movdqa	xmm0, xmm5
  3113e5:      	pclmulqdq	xmm7, xmm9, 0x0
  3113ec:      	pclmulqdq	xmm0, xmm1, 0x0
  3113f2:      	pxor	xmm0, xmm7
  3113f6:      	pshufd	xmm7, xmm6, 0xee        # xmm7 = xmm6[2,3,2,3]
  3113fb:      	pxor	xmm7, xmm6
  3113ff:      	movdqa	xmm8, xmm6
  311404:      	pxor	xmm0, xmm11
  311409:      	movdqa	xmmword ptr [rbp - 0x220], xmm0
  311411:      	pshufd	xmm0, xmm5, 0xee        # xmm0 = xmm5[2,3,2,3]
  311416:      	pxor	xmm0, xmm5
  31141a:      	mov	ebx, r10d
  31141d:      	lea	r11d, [r10 - 0x1]
  311421:      	lea	r14d, [r10 - 0x2]
  311425:      	lea	r12d, [r10 - 0x4]
  311429:      	lea	r15d, [r10 - 0x7]
  31142d:      	bswap	r15d
  311430:      	pclmulqdq	xmm8, xmm9, 0x11
  311437:      	movdqa	xmm6, xmmword ptr [rbp - 0x1e0]
  31143f:      	pclmulqdq	xmm5, xmm1, 0x11
  311445:      	pxor	xmm5, xmm8
  31144a:      	movd	xmm11, r15d
  31144f:      	lea	r15d, [r10 - 0x5]
  311453:      	lea	r13d, [r10 - 0x6]
  311457:      	bswap	r13d
  31145a:      	pxor	xmm5, xmm10
  31145f:      	movdqa	xmmword ptr [rbp - 0x210], xmm5
  311467:      	movd	xmm8, r13d
  31146c:      	pslldq	xmm8, 0xc               # xmm8 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm8[0,1,2,3]
  311472:      	pslldq	xmm11, 0xc              # xmm11 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm11[0,1,2,3]
  311478:      	movdqa	xmm5, xmmword ptr [rbp - 0x1f0]
  311480:      	pxor	xmm11, xmm5
  311485:      	pxor	xmm8, xmm5
  31148a:      	movdqa	xmm1, xmmword ptr [rbp - 0x1d0]
  311492:      	aesenc	xmm11, xmm1
  311498:      	aesenc	xmm8, xmm1
  31149e:      	bswap	r15d
  3114a1:      	movdqa	xmm13, xmmword ptr [rbp - 0x1b0]
  3114aa:      	aesenc	xmm11, xmm13
  3114b0:      	bswap	r12d
  3114b3:      	pclmulqdq	xmm7, xmmword ptr [rbp - 0xf0], 0x0
  3114bd:      	pclmulqdq	xmm0, xmmword ptr [rbp - 0x120], 0x0
  3114c7:      	pxor	xmm0, xmm7
  3114cb:      	movdqa	xmm10, xmm0
  3114d0:      	movd	xmm7, r12d
  3114d5:      	aesenc	xmm8, xmm13
  3114db:      	aesenc	xmm11, xmm14
  3114e1:      	aesenc	xmm8, xmm14
  3114e7:      	movdqa	xmm12, xmmword ptr [rbp - 0x1a0]
  3114f0:      	aesenc	xmm11, xmm12
  3114f6:      	aesenc	xmm8, xmm12
  3114fc:      	aesenc	xmm11, xmm3
  311502:      	aesenc	xmm8, xmm3
  311508:      	movdqa	xmm15, xmmword ptr [rbp - 0x1c0]
  311511:      	aesenc	xmm11, xmm15
  311517:      	aesenc	xmm8, xmm15
  31151d:      	movdqa	xmm2, xmmword ptr [rbp - 0x190]
  311525:      	aesenc	xmm11, xmm2
  31152b:      	aesenc	xmm8, xmm2
  311531:      	movdqa	xmm9, xmmword ptr [rbp - 0x160]
  31153a:      	aesenc	xmm11, xmm9
  311540:      	aesenc	xmm8, xmm9
  311546:      	movdqa	xmm0, xmmword ptr [rbp - 0x150]
  31154e:      	aesenc	xmm8, xmm0
  311554:      	aesenc	xmm11, xmm0
  31155a:      	aesenclast	xmm11, xmm6
  311560:      	pxor	xmm10, xmm4
  311565:      	movdqa	xmmword ptr [rbp - 0x200], xmm10
  31156e:      	movdqu	xmm4, xmmword ptr [rsi - 0x70]
  311573:      	pxor	xmm4, xmm11
  311578:      	movdqu	xmmword ptr [rsi - 0x70], xmm4
  31157d:      	aesenclast	xmm8, xmm6
  311583:      	movdqu	xmm10, xmmword ptr [rsi - 0x60]
  311589:      	pxor	xmm10, xmm8
  31158e:      	movd	xmm8, r15d
  311593:      	lea	r15d, [r10 - 0x3]
  311597:      	pslldq	xmm8, 0xc               # xmm8 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm8[0,1,2,3]
  31159d:      	pslldq	xmm7, 0xc               # xmm7 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm7[0,1,2,3]
  3115a2:      	pxor	xmm8, xmm5
  3115a7:      	aesenc	xmm8, xmm1
  3115ad:      	bswap	r14d
  3115b0:      	pxor	xmm7, xmm5
  3115b4:      	aesenc	xmm8, xmm13
  3115ba:      	bswap	r15d
  3115bd:      	aesenc	xmm8, xmm14
  3115c3:      	aesenc	xmm8, xmm12
  3115c9:      	aesenc	xmm8, xmm3
  3115cf:      	aesenc	xmm8, xmm15
  3115d5:      	aesenc	xmm8, xmm2
  3115db:      	aesenc	xmm8, xmm9
  3115e1:      	aesenc	xmm8, xmm0
  3115e7:      	aesenclast	xmm8, xmm6
  3115ed:      	movdqu	xmmword ptr [rsi - 0x60], xmm10
  3115f3:      	movdqu	xmm10, xmmword ptr [rsi - 0x50]
  3115f9:      	pxor	xmm10, xmm8
  3115fe:      	movd	xmm8, r15d
  311603:      	aesenc	xmm7, xmm1
  311608:      	aesenc	xmm7, xmm13
  31160e:      	aesenc	xmm7, xmm14
  311614:      	aesenc	xmm7, xmm12
  31161a:      	aesenc	xmm7, xmm3
  31161f:      	aesenc	xmm7, xmm15
  311625:      	aesenc	xmm7, xmm2
  31162a:      	aesenc	xmm7, xmm9
  311630:      	aesenc	xmm7, xmm0
  311635:      	aesenclast	xmm7, xmm6
  31163a:      	movdqu	xmmword ptr [rsi - 0x50], xmm10
  311640:      	movdqu	xmm11, xmmword ptr [rsi - 0x40]
  311646:      	pxor	xmm11, xmm7
  31164b:      	movd	xmm10, r14d
  311650:      	pslldq	xmm10, 0xc              # xmm10 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm10[0,1,2,3]
  311656:      	pslldq	xmm8, 0xc               # xmm8 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm8[0,1,2,3]
  31165c:      	pxor	xmm8, xmm5
  311661:      	pxor	xmm10, xmm5
  311666:      	aesenc	xmm8, xmm1
  31166c:      	aesenc	xmm10, xmm1
  311672:      	bswap	r11d
  311675:      	aesenc	xmm8, xmm13
  31167b:      	bswap	ebx
  31167d:      	aesenc	xmm8, xmm14
  311683:      	aesenc	xmm8, xmm12
  311689:      	aesenc	xmm8, xmm3
  31168f:      	aesenc	xmm8, xmm15
  311695:      	aesenc	xmm8, xmm2
  31169b:      	aesenc	xmm8, xmm9
  3116a1:      	aesenc	xmm8, xmm0
  3116a7:      	aesenclast	xmm8, xmm6
  3116ad:      	movdqu	xmmword ptr [rsi - 0x40], xmm11
  3116b3:      	movdqu	xmm11, xmmword ptr [rsi - 0x30]
  3116b9:      	pxor	xmm11, xmm8
  3116be:      	movd	xmm7, ebx
  3116c2:      	aesenc	xmm10, xmm13
  3116c8:      	aesenc	xmm10, xmm14
  3116ce:      	aesenc	xmm10, xmm12
  3116d4:      	aesenc	xmm10, xmm3
  3116da:      	aesenc	xmm10, xmm15
  3116e0:      	aesenc	xmm10, xmm2
  3116e6:      	aesenc	xmm10, xmm9
  3116ec:      	aesenc	xmm10, xmm0
  3116f2:      	movdqu	xmmword ptr [rsi - 0x30], xmm11
  3116f8:      	aesenclast	xmm10, xmm6
  3116fe:      	movdqu	xmm11, xmmword ptr [rsi - 0x20]
  311704:      	pxor	xmm11, xmm10
  311709:      	movd	xmm8, r11d
  31170e:      	pslldq	xmm8, 0xc               # xmm8 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm8[0,1,2,3]
  311714:      	pslldq	xmm7, 0xc               # xmm7 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm7[0,1,2,3]
  311719:      	pxor	xmm8, xmm5
  31171e:      	aesenc	xmm8, xmm1
  311724:      	pxor	xmm7, xmm5
  311728:      	aesenc	xmm8, xmm13
  31172e:      	aesenc	xmm7, xmm1
  311733:      	aesenc	xmm8, xmm14
  311739:      	aesenc	xmm7, xmm13
  31173f:      	aesenc	xmm8, xmm12
  311745:      	aesenc	xmm7, xmm14
  31174b:      	aesenc	xmm8, xmm3
  311751:      	aesenc	xmm7, xmm12
  311757:      	aesenc	xmm8, xmm15
  31175d:      	aesenc	xmm7, xmm3
  311762:      	aesenc	xmm8, xmm2
  311768:      	aesenc	xmm7, xmm15
  31176e:      	aesenc	xmm7, xmm2
  311773:      	aesenc	xmm8, xmm9
  311779:      	aesenc	xmm7, xmm9
  31177f:      	aesenc	xmm7, xmm0
  311784:      	aesenc	xmm8, xmm0
  31178a:      	aesenclast	xmm8, xmm6
  311790:      	movdqu	xmmword ptr [rsi - 0x20], xmm11
  311796:      	aesenclast	xmm7, xmm6
  31179b:      	movdqu	xmm10, xmmword ptr [rsi - 0x10]
  3117a1:      	pxor	xmm10, xmm8
  3117a6:      	movdqa	xmm0, xmmword ptr [rbp - 0x220]
  3117ae:      	movdqa	xmm8, xmm0
  3117b3:      	movdqa	xmm1, xmmword ptr [rbp - 0x210]
  3117bb:      	pxor	xmm8, xmm1
  3117c0:      	movdqu	xmmword ptr [rsi - 0x10], xmm10
  3117c6:      	pxor	xmm8, xmmword ptr [rbp - 0x200]
  3117cf:      	movdqa	xmm10, xmm8
  3117d4:      	pslldq	xmm10, 0x8              # xmm10 = zero,zero,zero,zero,zero,zero,zero,zero,xmm10[0,1,2,3,4,5,6,7]
  3117da:      	movdqu	xmm11, xmmword ptr [rsi]
  3117df:      	pxor	xmm10, xmm0
  3117e4:      	psrldq	xmm8, 0x8               # xmm8 = xmm8[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero
  3117ea:      	pshufd	xmm0, xmm10, 0x4e       # xmm0 = xmm10[2,3,0,1]
  3117f0:      	pxor	xmm11, xmm7
  3117f5:      	movq	xmm7, rdx
  3117fa:      	pclmulqdq	xmm10, xmm7, 0x0
  311801:      	pxor	xmm10, xmm0
  311806:      	pshufd	xmm6, xmm10, 0x4e       # xmm6 = xmm10[2,3,0,1]
  31180c:      	pxor	xmm6, xmm8
  311811:      	pclmulqdq	xmm10, xmm7, 0x0
  311818:      	pxor	xmm6, xmm1
  31181c:      	movdqu	xmmword ptr [rsi], xmm11
  311821:      	pxor	xmm6, xmm10
  311826:      	add	r10d, 0x8
  31182a:      	sub	rsi, -0x80
  31182e:      	dec	rdi
  311831:      	jne	0x3111f0 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, false>+0x520>
  311837:      	shl	rax, 0x7
  31183b:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x80]
  311842:      	movdqa	xmm0, xmmword ptr [rip - 0x26558a] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  31184a:      	pshufb	xmm3, xmm0
  31184f:      	pxor	xmm3, xmm6
  311853:      	movdqa	xmm2, xmm3
  311857:      	movdqa	xmm7, xmmword ptr [rbp - 0x140]
  31185f:      	pclmulqdq	xmm2, xmm7, 0x0
  311865:      	pclmulqdq	xmm7, xmm3, 0x11
  31186b:      	pshufd	xmm1, xmm3, 0xee        # xmm1 = xmm3[2,3,2,3]
  311870:      	pxor	xmm1, xmm3
  311874:      	pclmulqdq	xmm1, xmmword ptr [rbp - 0x100], 0x0
  31187e:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x70]
  311885:      	pshufb	xmm3, xmm0
  31188a:      	movdqa	xmm4, xmm3
  31188e:      	movdqa	xmm8, xmmword ptr [rbp - 0x130]
  311897:      	pclmulqdq	xmm4, xmm8, 0x0
  31189e:      	pclmulqdq	xmm8, xmm3, 0x11
  3118a5:      	pshufd	xmm5, xmm3, 0xee        # xmm5 = xmm3[2,3,2,3]
  3118aa:      	pxor	xmm5, xmm3
  3118ae:      	pclmulqdq	xmm5, xmmword ptr [rbp - 0xb0], 0x0
  3118b8:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x60]
  3118bf:      	pshufb	xmm3, xmm0
  3118c4:      	movdqa	xmm6, xmm3
  3118c8:      	movdqa	xmm9, xmmword ptr [rbp - 0x80]
  3118ce:      	pclmulqdq	xmm6, xmm9, 0x0
  3118d5:      	pxor	xmm6, xmm4
  3118d9:      	pclmulqdq	xmm9, xmm3, 0x11
  3118e0:      	pxor	xmm9, xmm8
  3118e5:      	pshufd	xmm4, xmm3, 0xee        # xmm4 = xmm3[2,3,2,3]
  3118ea:      	pxor	xmm4, xmm3
  3118ee:      	pclmulqdq	xmm4, xmmword ptr [rbp - 0xd0], 0x0
  3118f8:      	pxor	xmm4, xmm5
  3118fc:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x50]
  311903:      	pshufb	xmm3, xmm0
  311908:      	movdqa	xmm5, xmm3
  31190c:      	movdqa	xmm8, xmmword ptr [rbp - 0x50]
  311912:      	pclmulqdq	xmm5, xmm8, 0x0
  311919:      	pxor	xmm5, xmm6
  31191d:      	pclmulqdq	xmm8, xmm3, 0x11
  311924:      	pxor	xmm8, xmm9
  311929:      	pshufd	xmm6, xmm3, 0xee        # xmm6 = xmm3[2,3,2,3]
  31192e:      	pxor	xmm6, xmm3
  311932:      	pclmulqdq	xmm6, xmmword ptr [rbp - 0x110], 0x0
  31193c:      	pxor	xmm6, xmm4
  311940:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x40]
  311947:      	pshufb	xmm3, xmm0
  31194c:      	movdqa	xmm4, xmm3
  311950:      	movdqa	xmm9, xmmword ptr [rbp - 0xa0]
  311959:      	pclmulqdq	xmm4, xmm9, 0x0
  311960:      	pxor	xmm4, xmm5
  311964:      	pclmulqdq	xmm9, xmm3, 0x11
  31196b:      	pxor	xmm9, xmm8
  311970:      	pshufd	xmm5, xmm3, 0xee        # xmm5 = xmm3[2,3,2,3]
  311975:      	pxor	xmm5, xmm3
  311979:      	pclmulqdq	xmm5, xmmword ptr [rbp - 0x90], 0x0
  311983:      	pxor	xmm5, xmm6
  311987:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x30]
  31198e:      	pshufb	xmm3, xmm0
  311993:      	movdqa	xmm6, xmm3
  311997:      	movdqa	xmm8, xmmword ptr [rbp - 0xe0]
  3119a0:      	pclmulqdq	xmm6, xmm8, 0x0
  3119a7:      	pxor	xmm6, xmm4
  3119ab:      	pclmulqdq	xmm8, xmm3, 0x11
  3119b2:      	pxor	xmm8, xmm9
  3119b7:      	pshufd	xmm4, xmm3, 0xee        # xmm4 = xmm3[2,3,2,3]
  3119bc:      	pxor	xmm4, xmm3
  3119c0:      	pclmulqdq	xmm4, xmmword ptr [rbp - 0xc0], 0x0
  3119ca:      	pxor	xmm4, xmm5
  3119ce:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x20]
  3119d5:      	pshufb	xmm3, xmm0
  3119da:      	movdqa	xmm5, xmm3
  3119de:      	movdqa	xmm13, xmmword ptr [rbp - 0x60]
  3119e4:      	pclmulqdq	xmm5, xmm13, 0x0
  3119eb:      	pxor	xmm5, xmm6
  3119ef:      	pclmulqdq	xmm13, xmm3, 0x11
  3119f6:      	pxor	xmm13, xmm8
  3119fb:      	pshufd	xmm6, xmm3, 0xee        # xmm6 = xmm3[2,3,2,3]
  311a00:      	pxor	xmm6, xmm3
  311a04:      	pclmulqdq	xmm6, xmmword ptr [rbp - 0xf0], 0x0
  311a0e:      	pxor	xmm6, xmm4
  311a12:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x10]
  311a19:      	pshufb	xmm3, xmm0
  311a1e:      	movdqa	xmm4, xmm3
  311a22:      	movdqa	xmm8, xmmword ptr [rbp - 0x70]
  311a28:      	pclmulqdq	xmm4, xmm8, 0x0
  311a2f:      	pxor	xmm4, xmm5
  311a33:      	pxor	xmm4, xmm2
  311a37:      	pclmulqdq	xmm8, xmm3, 0x11
  311a3e:      	pxor	xmm8, xmm13
  311a43:      	pxor	xmm8, xmm7
  311a48:      	pshufd	xmm2, xmm3, 0xee        # xmm2 = xmm3[2,3,2,3]
  311a4d:      	pxor	xmm2, xmm3
  311a51:      	pclmulqdq	xmm2, xmmword ptr [rbp - 0x120], 0x0
  311a5b:      	pxor	xmm2, xmm6
  311a5f:      	pxor	xmm2, xmm4
  311a63:      	pxor	xmm2, xmm1
  311a67:      	pxor	xmm2, xmm8
  311a6c:      	movdqa	xmm1, xmm2
  311a70:      	pslldq	xmm1, 0x8               # xmm1 = zero,zero,zero,zero,zero,zero,zero,zero,xmm1[0,1,2,3,4,5,6,7]
  311a75:      	pxor	xmm1, xmm4
  311a79:      	psrldq	xmm2, 0x8               # xmm2 = xmm2[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero
  311a7e:      	pshufd	xmm3, xmm1, 0x4e        # xmm3 = xmm1[2,3,0,1]
  311a83:      	movq	xmm4, rdx
  311a88:      	pclmulqdq	xmm1, xmm4, 0x0
  311a8e:      	pxor	xmm1, xmm3
  311a92:      	pshufd	xmm3, xmm1, 0x4e        # xmm3 = xmm1[2,3,0,1]
  311a97:      	pxor	xmm3, xmm2
  311a9b:      	pclmulqdq	xmm1, xmm4, 0x0
  311aa1:      	pxor	xmm3, xmm8
  311aa6:      	pxor	xmm3, xmm1
  311aaa:      	pshufb	xmm3, xmm0
  311aaf:      	movdqu	xmmword ptr [rcx], xmm3
  311ab3:      	movabs	rax, 0x7fffffffffffff80
  311abd:      	and	r9, rax
  311ac0:      	jmp	0x311ac5 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, false>+0xdf5>
  311ac2:      	xor	r9d, r9d
  311ac5:      	mov	rax, r9
  311ac8:      	add	rsp, 0x1f8
  311acf:      	pop	rbx
  311ad0:      	pop	r12
  311ad2:      	pop	r13
  311ad4:      	pop	r14
  311ad6:      	pop	r15
  311ad8:      	pop	rbp
  311ad9:      	ret
  311ada:      	lea	rdi, [rip - 0x20573e]   # 0x10c3a3 <anon.8182237a801038de36885de64d2c176c.5.llvm.10465402473772549265>
  311ae1:      	lea	rcx, [rip + 0x4f2e08]   # 0x8048f0 <anon.8182237a801038de36885de64d2c176c.1.llvm.10465402473772549265>
  311ae8:      	mov	esi, 0x237
  311aed:      	xor	edx, edx
  311aef:      	call	qword ptr [rip + 0x56628b] # 0x877d80 <sdallocx+0x877d80>
  311af5:      	int3
  311af6:      	int3
  311af7:      	int3
  311af8:      	int3
  311af9:      	int3
  311afa:      	int3
  311afb:      	int3
  311afc:      	int3
  311afd:      	int3
  311afe:      	int3
  311aff:      	int3
