
stage/probe-full-ec76bb2a7:	file format elf64-x86-64

Disassembly of section .text:

0000000000310b90 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, false>>:
  310b90:      	push	rbp
  310b91:      	mov	rbp, rsp
  310b94:      	sub	rsp, 0x1f0
  310b9b:      	mov	rax, r9
  310b9e:      	shr	rax, 0x7
  310ba2:      	je	0x311957 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, false>+0xdc7>
  310ba8:      	movdqa	xmm3, xmmword ptr [rsi + 0x280]
  310bb0:      	movdqa	xmm1, xmmword ptr [rsi + 0x290]
  310bb8:      	movdqa	xmm12, xmmword ptr [rsi + 0x2a0]
  310bc1:      	movaps	xmm15, xmmword ptr [rsi + 0x2b0]
  310bc9:      	movaps	xmm14, xmmword ptr [rsi + 0x2c0]
  310bd1:      	movaps	xmm13, xmmword ptr [rsi + 0x2d0]
  310bd9:      	movaps	xmm2, xmmword ptr [rsi + 0x2e0]
  310be0:      	movaps	xmm0, xmmword ptr [rsi + 0x2f0]
  310be7:      	movaps	xmmword ptr [rbp - 0x60], xmm0
  310beb:      	movdqu	xmm4, xmmword ptr [rdi]
  310bef:      	xorps	xmm0, xmm0
  310bf2:      	movaps	xmmword ptr [rbp - 0x10], xmm0
  310bf6:      	lea	rsi, [rbp - 0x10]
  310bfa:      	mov	r10, rdx
  310bfd:      	sub	r10, rsi
  310c00:      	sub	rsi, rdx
  310c03:      	cmovb	rsi, r10
  310c07:      	cmp	rsi, 0xb
  310c0b:      	jbe	0x311966 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, false>+0xdd6>
  310c11:      	mov	esi, dword ptr [rdx + 0x8]
  310c14:      	mov	dword ptr [rbp - 0x8], esi
  310c17:      	mov	rdx, qword ptr [rdx]
  310c1a:      	mov	qword ptr [rbp - 0x10], rdx
  310c1e:      	pxor	xmm4, xmmword ptr [rbp - 0x10]
  310c23:      	movdqa	xmm5, xmmword ptr [rip - 0x264c1b] # 0xac010 <anon.e81663b63ab83dbb5a37e8fa4238500b.6.llvm.14128926338108641276+0xc0>
  310c2b:      	pxor	xmm5, xmm4
  310c2f:      	movaps	xmmword ptr [rbp - 0x50], xmm2
  310c33:      	movdqa	xmm6, xmmword ptr [rip - 0x26560b] # 0xab630 <anon.0b2aa08f77b92a096c4b4e8601736de0.2.llvm.10746933672069200717+0x90>
  310c3b:      	pxor	xmm6, xmm4
  310c3f:      	movaps	xmmword ptr [rbp - 0x40], xmm13
  310c44:      	movdqa	xmm7, xmmword ptr [rip - 0x26560c] # 0xab640 <anon.0b2aa08f77b92a096c4b4e8601736de0.2.llvm.10746933672069200717+0xa0>
  310c4c:      	pxor	xmm7, xmm4
  310c50:      	movdqa	xmm9, xmmword ptr [rip - 0x265aa9] # 0xab1b0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.13.llvm.14024894901458550281+0xd0>
  310c59:      	pxor	xmm9, xmm4
  310c5e:      	movdqa	xmm13, xmm3
  310c63:      	movdqa	xmm3, xmmword ptr [rip - 0x2653bb] # 0xab8b0 <anon.0b2aa08f77b92a096c4b4e8601736de0.2.llvm.10746933672069200717+0x310>
  310c6b:      	pxor	xmm3, xmm4
  310c6f:      	movdqa	xmm2, xmmword ptr [rip - 0x265877] # 0xab400 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.13.llvm.14024894901458550281+0x320>
  310c77:      	pxor	xmm2, xmm4
  310c7b:      	movaps	xmmword ptr [rbp - 0x30], xmm14
  310c80:      	movaps	xmmword ptr [rbp - 0x20], xmm15
  310c85:      	movdqa	xmm15, xmm12
  310c8a:      	movdqa	xmm12, xmm1
  310c8f:      	movdqa	xmm1, xmmword ptr [rip - 0x265807] # 0xab490 <anon.e81663b63ab83dbb5a37e8fa4238500b.8.llvm.14128926338108641276+0x10>
  310c97:      	pxor	xmm1, xmm4
  310c9b:      	movdqa	xmm0, xmmword ptr [rip - 0x264d33] # 0xabf70 <anon.e81663b63ab83dbb5a37e8fa4238500b.6.llvm.14128926338108641276+0x20>
  310ca3:      	movdqa	xmmword ptr [rbp - 0x1c0], xmm4
  310cab:      	pxor	xmm0, xmm4
  310caf:      	movdqu	xmm11, xmmword ptr [rdi + 0x10]
  310cb5:      	movdqu	xmm10, xmmword ptr [rdi + 0x20]
  310cbb:      	movdqu	xmm8, xmmword ptr [rdi + 0x30]
  310cc1:      	movdqu	xmm4, xmmword ptr [rdi + 0x40]
  310cc6:      	aesenc	xmm5, xmm11
  310ccc:      	aesenc	xmm6, xmm11
  310cd2:      	aesenc	xmm7, xmm11
  310cd8:      	aesenc	xmm9, xmm11
  310cde:      	aesenc	xmm3, xmm11
  310ce4:      	aesenc	xmm2, xmm11
  310cea:      	aesenc	xmm1, xmm11
  310cf0:      	aesenc	xmm0, xmm11
  310cf6:      	aesenc	xmm5, xmm10
  310cfc:      	aesenc	xmm6, xmm10
  310d02:      	aesenc	xmm7, xmm10
  310d08:      	aesenc	xmm9, xmm10
  310d0e:      	aesenc	xmm3, xmm10
  310d14:      	aesenc	xmm2, xmm10
  310d1a:      	aesenc	xmm1, xmm10
  310d20:      	aesenc	xmm0, xmm10
  310d26:      	aesenc	xmm5, xmm8
  310d2c:      	aesenc	xmm6, xmm8
  310d32:      	aesenc	xmm7, xmm8
  310d38:      	aesenc	xmm9, xmm8
  310d3e:      	aesenc	xmm3, xmm8
  310d44:      	aesenc	xmm2, xmm8
  310d4a:      	aesenc	xmm1, xmm8
  310d50:      	aesenc	xmm0, xmm8
  310d56:      	aesenc	xmm5, xmm4
  310d5b:      	aesenc	xmm6, xmm4
  310d60:      	aesenc	xmm7, xmm4
  310d65:      	aesenc	xmm9, xmm4
  310d6b:      	aesenc	xmm3, xmm4
  310d70:      	aesenc	xmm2, xmm4
  310d75:      	aesenc	xmm1, xmm4
  310d7a:      	aesenc	xmm0, xmm4
  310d7f:      	movdqu	xmm4, xmmword ptr [rdi + 0x50]
  310d84:      	aesenc	xmm5, xmm4
  310d89:      	aesenc	xmm6, xmm4
  310d8e:      	aesenc	xmm7, xmm4
  310d93:      	aesenc	xmm9, xmm4
  310d99:      	aesenc	xmm3, xmm4
  310d9e:      	aesenc	xmm2, xmm4
  310da3:      	aesenc	xmm1, xmm4
  310da8:      	aesenc	xmm0, xmm4
  310dad:      	movdqu	xmm4, xmmword ptr [rdi + 0x60]
  310db2:      	aesenc	xmm5, xmm4
  310db7:      	aesenc	xmm6, xmm4
  310dbc:      	aesenc	xmm7, xmm4
  310dc1:      	aesenc	xmm9, xmm4
  310dc7:      	aesenc	xmm3, xmm4
  310dcc:      	aesenc	xmm2, xmm4
  310dd1:      	aesenc	xmm1, xmm4
  310dd6:      	aesenc	xmm0, xmm4
  310ddb:      	movdqu	xmm4, xmmword ptr [rdi + 0x70]
  310de0:      	aesenc	xmm5, xmm4
  310de5:      	aesenc	xmm6, xmm4
  310dea:      	aesenc	xmm7, xmm4
  310def:      	aesenc	xmm9, xmm4
  310df5:      	aesenc	xmm3, xmm4
  310dfa:      	aesenc	xmm2, xmm4
  310dff:      	aesenc	xmm1, xmm4
  310e04:      	aesenc	xmm0, xmm4
  310e09:      	movdqu	xmm11, xmmword ptr [rdi + 0x80]
  310e12:      	aesenc	xmm5, xmm11
  310e18:      	aesenc	xmm6, xmm11
  310e1e:      	aesenc	xmm7, xmm11
  310e24:      	aesenc	xmm9, xmm11
  310e2a:      	movdqu	xmm14, xmmword ptr [rdi + 0x90]
  310e33:      	aesenc	xmm5, xmm14
  310e39:      	aesenc	xmm6, xmm14
  310e3f:      	aesenc	xmm7, xmm14
  310e45:      	pshufd	xmm4, xmm13, 0xee       # xmm4 = xmm13[2,3,2,3]
  310e4b:      	aesenc	xmm9, xmm14
  310e51:      	movdqu	xmm10, xmmword ptr [rdi + 0xa0]
  310e5a:      	aesenclast	xmm5, xmm10
  310e60:      	aesenclast	xmm6, xmm10
  310e66:      	aesenclast	xmm7, xmm10
  310e6c:      	aesenclast	xmm9, xmm10
  310e72:      	movdqa	xmmword ptr [rbp - 0x110], xmm13
  310e7b:      	pxor	xmm4, xmm13
  310e80:      	movdqa	xmmword ptr [rbp - 0xd0], xmm4
  310e88:      	movdqu	xmm4, xmmword ptr [r8]
  310e8d:      	pxor	xmm4, xmm5
  310e91:      	movdqu	xmm5, xmmword ptr [r8 + 0x10]
  310e97:      	pxor	xmm5, xmm6
  310e9b:      	movdqu	xmm6, xmmword ptr [r8 + 0x20]
  310ea1:      	pxor	xmm6, xmm7
  310ea5:      	movdqu	xmm7, xmmword ptr [r8 + 0x30]
  310eab:      	pxor	xmm7, xmm9
  310eb0:      	pshufd	xmm8, xmm12, 0xee       # xmm8 = xmm12[2,3,2,3]
  310eb6:      	movdqa	xmmword ptr [rbp - 0x100], xmm12
  310ebf:      	pxor	xmm8, xmm12
  310ec4:      	movdqa	xmmword ptr [rbp - 0xa0], xmm8
  310ecd:      	movdqu	xmmword ptr [r8], xmm4
  310ed2:      	movdqu	xmmword ptr [r8 + 0x10], xmm5
  310ed8:      	pshufd	xmm5, xmm15, 0xee       # xmm5 = xmm15[2,3,2,3]
  310ede:      	movdqa	xmmword ptr [rbp - 0xf0], xmm15
  310ee7:      	pxor	xmm5, xmm15
  310eec:      	movdqa	xmmword ptr [rbp - 0xb0], xmm5
  310ef4:      	movdqu	xmmword ptr [r8 + 0x20], xmm6
  310efa:      	movdqa	xmm6, xmmword ptr [rbp - 0x20]
  310eff:      	pshufd	xmm5, xmm6, 0xee        # xmm5 = xmm6[2,3,2,3]
  310f04:      	pxor	xmm5, xmm6
  310f08:      	movdqa	xmmword ptr [rbp - 0x80], xmm5
  310f0d:      	aesenc	xmm3, xmm11
  310f13:      	aesenc	xmm3, xmm14
  310f19:      	aesenclast	xmm3, xmm10
  310f1f:      	movdqu	xmmword ptr [r8 + 0x30], xmm7
  310f25:      	movdqu	xmm5, xmmword ptr [r8 + 0x40]
  310f2b:      	pxor	xmm5, xmm3
  310f2f:      	movdqa	xmm6, xmmword ptr [rbp - 0x30]
  310f34:      	pshufd	xmm3, xmm6, 0xee        # xmm3 = xmm6[2,3,2,3]
  310f39:      	aesenc	xmm2, xmm11
  310f3f:      	aesenc	xmm2, xmm14
  310f45:      	pxor	xmm3, xmm6
  310f49:      	movdqa	xmmword ptr [rbp - 0x70], xmm3
  310f4e:      	aesenclast	xmm2, xmm10
  310f54:      	movdqu	xmmword ptr [r8 + 0x40], xmm5
  310f5a:      	movdqu	xmm3, xmmword ptr [r8 + 0x50]
  310f60:      	pxor	xmm3, xmm2
  310f64:      	movdqa	xmm2, xmmword ptr [rbp - 0x40]
  310f69:      	pshufd	xmm8, xmm2, 0xee        # xmm8 = xmm2[2,3,2,3]
  310f6f:      	pxor	xmm8, xmm2
  310f74:      	aesenc	xmm1, xmm11
  310f7a:      	aesenc	xmm1, xmm14
  310f80:      	aesenclast	xmm1, xmm10
  310f86:      	movdqu	xmmword ptr [r8 + 0x50], xmm3
  310f8c:      	movdqa	xmm3, xmm14
  310f91:      	movdqu	xmm2, xmmword ptr [r8 + 0x60]
  310f97:      	pxor	xmm2, xmm1
  310f9b:      	movdqa	xmm1, xmmword ptr [rbp - 0x50]
  310fa0:      	pshufd	xmm14, xmm1, 0xee       # xmm14 = xmm1[2,3,2,3]
  310fa6:      	aesenc	xmm0, xmm11
  310fac:      	aesenc	xmm0, xmm3
  310fb1:      	aesenclast	xmm0, xmm10
  310fb7:      	pxor	xmm14, xmm1
  310fbc:      	movdqu	xmmword ptr [r8 + 0x60], xmm2
  310fc2:      	movdqu	xmm1, xmmword ptr [r8 + 0x70]
  310fc8:      	pxor	xmm1, xmm0
  310fcc:      	movdqa	xmm2, xmmword ptr [rbp - 0x60]
  310fd1:      	pshufd	xmm0, xmm2, 0xee        # xmm0 = xmm2[2,3,2,3]
  310fd6:      	pxor	xmm0, xmm2
  310fda:      	movdqu	xmmword ptr [r8 + 0x70], xmm1
  310fe0:      	movdqu	xmm5, xmmword ptr [rcx]
  310fe4:      	pshufb	xmm5, xmmword ptr [rip - 0x264d2d] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  310fed:      	movabs	rdx, -0x3e00000000000000
  310ff7:      	cmp	rax, 0x1
  310ffb:      	movdqa	xmmword ptr [rbp - 0xe0], xmm0
  311003:      	movdqa	xmmword ptr [rbp - 0xc0], xmm14
  31100c:      	movdqa	xmmword ptr [rbp - 0x90], xmm8
  311015:      	je	0x3116d5 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, false>+0xb45>
  31101b:      	movups	xmm1, xmmword ptr [rdi + 0x10]
  31101f:      	movaps	xmmword ptr [rbp - 0x150], xmm1
  311026:      	movups	xmm1, xmmword ptr [rdi + 0x20]
  31102a:      	movaps	xmmword ptr [rbp - 0x180], xmm1
  311031:      	movups	xmm1, xmmword ptr [rdi + 0x30]
  311035:      	movaps	xmmword ptr [rbp - 0x1a0], xmm1
  31103c:      	movdqa	xmmword ptr [rbp - 0x1b0], xmm11
  311045:      	movups	xmm1, xmmword ptr [rdi + 0x40]
  311049:      	movaps	xmmword ptr [rbp - 0x190], xmm1
  311050:      	movups	xmm1, xmmword ptr [rdi + 0x50]
  311054:      	movaps	xmmword ptr [rbp - 0x170], xmm1
  31105b:      	movups	xmm1, xmmword ptr [rdi + 0x60]
  31105f:      	movaps	xmmword ptr [rbp - 0x160], xmm1
  311066:      	movdqa	xmmword ptr [rbp - 0x130], xmm3
  31106e:      	movdqu	xmm1, xmmword ptr [rdi + 0x70]
  311073:      	movdqa	xmmword ptr [rbp - 0x140], xmm1
  31107b:      	lea	rsi, [r8 + 0xf0]
  311082:      	lea	rdi, [rax - 0x1]
  311086:      	mov	r10d, 0x11
  31108c:      	movdqa	xmmword ptr [rbp - 0x120], xmm10
  311095:      	movdqa	xmm15, xmmword ptr [rbp - 0x140]
  31109e:      	nop
  3110a0:      	movdqa	xmm1, xmmword ptr [rip - 0x264de8] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  3110a8:      	pshufb	xmm4, xmm1
  3110ad:      	movdqu	xmm6, xmmword ptr [rsi - 0xe0]
  3110b5:      	movdqu	xmm8, xmmword ptr [rsi - 0xd0]
  3110be:      	pxor	xmm4, xmm5
  3110c2:      	movdqu	xmm13, xmmword ptr [rsi - 0xc0]
  3110cb:      	movdqu	xmm0, xmmword ptr [rsi - 0xb0]
  3110d3:      	pshufb	xmm6, xmm1
  3110d8:      	pshufb	xmm8, xmm1
  3110de:      	pshufb	xmm13, xmm1
  3110e4:      	pshufb	xmm0, xmm1
  3110e9:      	movdqa	xmm14, xmm6
  3110ee:      	pshufd	xmm10, xmm6, 0xee       # xmm10 = xmm6[2,3,2,3]
  3110f4:      	pxor	xmm10, xmm6
  3110f9:      	movdqa	xmm12, xmm6
  3110fe:      	movdqa	xmm7, xmm8
  311103:      	movdqa	xmm11, xmmword ptr [rbp - 0x100]
  31110c:      	pclmulqdq	xmm12, xmm11, 0x0
  311113:      	pshufd	xmm6, xmm8, 0xee        # xmm6 = xmm8[2,3,2,3]
  311119:      	pxor	xmm6, xmm8
  31111e:      	movdqa	xmm3, xmmword ptr [rbp - 0xf0]
  311126:      	pclmulqdq	xmm8, xmm3, 0x0
  31112d:      	pxor	xmm8, xmm12
  311132:      	movdqa	xmm5, xmm4
  311136:      	movdqa	xmm9, xmmword ptr [rbp - 0x110]
  31113f:      	pclmulqdq	xmm5, xmm9, 0x11
  311146:      	pclmulqdq	xmm14, xmm11, 0x11
  31114d:      	pclmulqdq	xmm10, xmmword ptr [rbp - 0xa0], 0x0
  311158:      	pclmulqdq	xmm7, xmm3, 0x11
  31115e:      	pxor	xmm7, xmm14
  311163:      	pxor	xmm7, xmm5
  311167:      	pclmulqdq	xmm6, xmmword ptr [rbp - 0xb0], 0x0
  311171:      	movdqa	xmm5, xmm13
  311176:      	pshufd	xmm12, xmm13, 0xee      # xmm12 = xmm13[2,3,2,3]
  31117c:      	pxor	xmm6, xmm10
  311181:      	pxor	xmm12, xmm13
  311186:      	movdqa	xmm10, xmm13
  31118b:      	movdqa	xmm3, xmmword ptr [rbp - 0x60]
  311190:      	movdqa	xmm14, xmm0
  311195:      	movdqa	xmm11, xmmword ptr [rbp - 0x20]
  31119b:      	pclmulqdq	xmm5, xmm11, 0x11
  3111a2:      	movdqa	xmm13, xmmword ptr [rbp - 0x30]
  3111a8:      	pclmulqdq	xmm14, xmm13, 0x11
  3111af:      	pxor	xmm14, xmm5
  3111b4:      	pshufd	xmm5, xmm0, 0xee        # xmm5 = xmm0[2,3,2,3]
  3111b9:      	pclmulqdq	xmm10, xmm11, 0x0
  3111c0:      	pxor	xmm5, xmm0
  3111c4:      	pclmulqdq	xmm0, xmm13, 0x0
  3111cb:      	pxor	xmm0, xmm10
  3111d0:      	pclmulqdq	xmm12, xmmword ptr [rbp - 0x80], 0x0
  3111d8:      	pclmulqdq	xmm5, xmmword ptr [rbp - 0x70], 0x0
  3111df:      	pxor	xmm5, xmm12
  3111e4:      	pshufd	xmm10, xmm4, 0xee       # xmm10 = xmm4[2,3,2,3]
  3111ea:      	pxor	xmm10, xmm4
  3111ef:      	pclmulqdq	xmm4, xmm9, 0x0
  3111f6:      	pxor	xmm8, xmm4
  3111fb:      	movdqu	xmm12, xmmword ptr [rsi - 0xa0]
  311204:      	pshufb	xmm12, xmm1
  31120a:      	pclmulqdq	xmm10, xmmword ptr [rbp - 0xd0], 0x0
  311215:      	pxor	xmm6, xmm10
  31121a:      	movdqa	xmm10, xmm12
  31121f:      	movdqa	xmm9, xmmword ptr [rbp - 0x40]
  311225:      	pclmulqdq	xmm10, xmm9, 0x11
  31122c:      	pxor	xmm10, xmm14
  311231:      	pshufd	xmm4, xmm12, 0xee       # xmm4 = xmm12[2,3,2,3]
  311237:      	pxor	xmm4, xmm12
  31123c:      	movdqa	xmm14, xmm12
  311241:      	pclmulqdq	xmm14, xmm9, 0x0
  311248:      	pxor	xmm14, xmm0
  31124d:      	movdqu	xmm12, xmmword ptr [rsi - 0x90]
  311256:      	pxor	xmm10, xmm7
  31125b:      	movdqu	xmm0, xmmword ptr [rsi - 0x80]
  311260:      	pshufb	xmm12, xmm1
  311266:      	pshufb	xmm0, xmm1
  31126b:      	pclmulqdq	xmm4, xmmword ptr [rbp - 0x90], 0x0
  311275:      	pxor	xmm4, xmm5
  311279:      	pxor	xmm14, xmm8
  31127e:      	movdqa	xmm8, xmm12
  311283:      	pshufd	xmm7, xmm12, 0xee       # xmm7 = xmm12[2,3,2,3]
  311289:      	pxor	xmm7, xmm12
  31128e:      	pxor	xmm4, xmm6
  311292:      	movdqa	xmm9, xmmword ptr [rbp - 0x50]
  311298:      	pclmulqdq	xmm12, xmm9, 0x0
  31129f:      	movdqa	xmm1, xmm0
  3112a3:      	pclmulqdq	xmm1, xmm3, 0x0
  3112a9:      	pxor	xmm1, xmm12
  3112ae:      	pshufd	xmm2, xmm0, 0xee        # xmm2 = xmm0[2,3,2,3]
  3112b3:      	pxor	xmm2, xmm0
  3112b7:      	pclmulqdq	xmm8, xmm9, 0x11
  3112be:      	pclmulqdq	xmm0, xmm3, 0x11
  3112c4:      	pxor	xmm0, xmm8
  3112c9:      	lea	r11d, [r10 - 0x7]
  3112cd:      	bswap	r11d
  3112d0:      	pxor	xmm0, xmm10
  3112d5:      	movdqa	xmmword ptr [rbp - 0x1f0], xmm0
  3112dd:      	movd	xmm8, r11d
  3112e2:      	pslldq	xmm8, 0xc               # xmm8 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm8[0,1,2,3]
  3112e8:      	movdqa	xmm6, xmmword ptr [rbp - 0x1c0]
  3112f0:      	pxor	xmm8, xmm6
  3112f5:      	lea	r11d, [r10 - 0x6]
  3112f9:      	bswap	r11d
  3112fc:      	pclmulqdq	xmm7, xmmword ptr [rbp - 0xc0], 0x0
  311306:      	pclmulqdq	xmm2, xmmword ptr [rbp - 0xe0], 0x0
  311310:      	pxor	xmm2, xmm7
  311314:      	movdqa	xmm0, xmm2
  311318:      	movd	xmm10, r11d
  31131d:      	pslldq	xmm10, 0xc              # xmm10 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm10[0,1,2,3]
  311323:      	pxor	xmm10, xmm6
  311328:      	lea	r11d, [r10 - 0x5]
  31132c:      	bswap	r11d
  31132f:      	pxor	xmm1, xmm14
  311334:      	movdqa	xmmword ptr [rbp - 0x1e0], xmm1
  31133c:      	movd	xmm7, r11d
  311341:      	pslldq	xmm7, 0xc               # xmm7 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm7[0,1,2,3]
  311346:      	lea	r11d, [r10 - 0x4]
  31134a:      	pxor	xmm7, xmm6
  31134e:      	movdqa	xmm2, xmmword ptr [rbp - 0x150]
  311356:      	aesenc	xmm8, xmm2
  31135c:      	aesenc	xmm10, xmm2
  311362:      	movdqa	xmm14, xmmword ptr [rbp - 0x180]
  31136b:      	aesenc	xmm8, xmm14
  311371:      	aesenc	xmm10, xmm14
  311377:      	movdqa	xmm9, xmmword ptr [rbp - 0x1a0]
  311380:      	aesenc	xmm8, xmm9
  311386:      	aesenc	xmm10, xmm9
  31138c:      	movdqa	xmm11, xmmword ptr [rbp - 0x190]
  311395:      	aesenc	xmm8, xmm11
  31139b:      	aesenc	xmm10, xmm11
  3113a1:      	movdqa	xmm13, xmmword ptr [rbp - 0x170]
  3113aa:      	aesenc	xmm8, xmm13
  3113b0:      	aesenc	xmm10, xmm13
  3113b6:      	movdqa	xmm5, xmmword ptr [rbp - 0x160]
  3113be:      	aesenc	xmm8, xmm5
  3113c4:      	aesenc	xmm10, xmm5
  3113ca:      	aesenc	xmm8, xmm15
  3113d0:      	aesenc	xmm10, xmm15
  3113d6:      	bswap	r11d
  3113d9:      	pxor	xmm0, xmm4
  3113dd:      	movdqa	xmmword ptr [rbp - 0x1d0], xmm0
  3113e5:      	movdqa	xmm3, xmmword ptr [rbp - 0x1b0]
  3113ed:      	aesenc	xmm8, xmm3
  3113f3:      	aesenc	xmm10, xmm3
  3113f9:      	movdqa	xmm1, xmmword ptr [rbp - 0x130]
  311401:      	aesenc	xmm8, xmm1
  311407:      	aesenc	xmm10, xmm1
  31140d:      	movdqa	xmm0, xmmword ptr [rbp - 0x120]
  311415:      	aesenclast	xmm8, xmm0
  31141b:      	movdqu	xmm4, xmmword ptr [rsi - 0x70]
  311420:      	aesenclast	xmm10, xmm0
  311426:      	pxor	xmm4, xmm8
  31142b:      	movdqu	xmmword ptr [rsi - 0x70], xmm4
  311430:      	movdqu	xmm12, xmmword ptr [rsi - 0x60]
  311436:      	pxor	xmm12, xmm10
  31143b:      	movd	xmm8, r11d
  311440:      	pslldq	xmm8, 0xc               # xmm8 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm8[0,1,2,3]
  311446:      	aesenc	xmm7, xmm2
  31144b:      	pxor	xmm8, xmm6
  311450:      	lea	r11d, [r10 - 0x3]
  311454:      	aesenc	xmm7, xmm14
  31145a:      	bswap	r11d
  31145d:      	aesenc	xmm7, xmm9
  311463:      	aesenc	xmm7, xmm11
  311469:      	aesenc	xmm7, xmm13
  31146f:      	aesenc	xmm7, xmm5
  311474:      	aesenc	xmm7, xmm15
  31147a:      	aesenc	xmm7, xmm3
  31147f:      	aesenc	xmm7, xmm1
  311484:      	aesenclast	xmm7, xmm0
  311489:      	movdqu	xmmword ptr [rsi - 0x60], xmm12
  31148f:      	movdqu	xmm10, xmmword ptr [rsi - 0x50]
  311495:      	pxor	xmm10, xmm7
  31149a:      	movd	xmm7, r11d
  31149f:      	pslldq	xmm7, 0xc               # xmm7 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm7[0,1,2,3]
  3114a4:      	aesenc	xmm8, xmm2
  3114aa:      	pxor	xmm7, xmm6
  3114ae:      	lea	r11d, [r10 - 0x2]
  3114b2:      	aesenc	xmm8, xmm14
  3114b8:      	bswap	r11d
  3114bb:      	aesenc	xmm8, xmm9
  3114c1:      	aesenc	xmm8, xmm11
  3114c7:      	aesenc	xmm8, xmm13
  3114cd:      	aesenc	xmm8, xmm5
  3114d3:      	aesenc	xmm8, xmm15
  3114d9:      	aesenc	xmm8, xmm3
  3114df:      	aesenc	xmm8, xmm1
  3114e5:      	aesenclast	xmm8, xmm0
  3114eb:      	movdqu	xmmword ptr [rsi - 0x50], xmm10
  3114f1:      	movdqu	xmm10, xmmword ptr [rsi - 0x40]
  3114f7:      	pxor	xmm10, xmm8
  3114fc:      	movd	xmm8, r11d
  311501:      	pslldq	xmm8, 0xc               # xmm8 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm8[0,1,2,3]
  311507:      	aesenc	xmm7, xmm2
  31150c:      	pxor	xmm8, xmm6
  311511:      	lea	r11d, [r10 - 0x1]
  311515:      	aesenc	xmm7, xmm14
  31151b:      	bswap	r11d
  31151e:      	aesenc	xmm7, xmm9
  311524:      	aesenc	xmm7, xmm11
  31152a:      	aesenc	xmm7, xmm13
  311530:      	aesenc	xmm7, xmm5
  311535:      	aesenc	xmm7, xmm15
  31153b:      	aesenc	xmm7, xmm3
  311540:      	aesenc	xmm7, xmm1
  311545:      	aesenclast	xmm7, xmm0
  31154a:      	movdqu	xmmword ptr [rsi - 0x40], xmm10
  311550:      	movdqu	xmm10, xmmword ptr [rsi - 0x30]
  311556:      	pxor	xmm10, xmm7
  31155b:      	movd	xmm7, r11d
  311560:      	pslldq	xmm7, 0xc               # xmm7 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm7[0,1,2,3]
  311565:      	aesenc	xmm8, xmm2
  31156b:      	pxor	xmm7, xmm6
  31156f:      	mov	r11d, r10d
  311572:      	aesenc	xmm8, xmm14
  311578:      	bswap	r11d
  31157b:      	aesenc	xmm8, xmm9
  311581:      	aesenc	xmm8, xmm11
  311587:      	aesenc	xmm8, xmm13
  31158d:      	aesenc	xmm8, xmm5
  311593:      	aesenc	xmm8, xmm15
  311599:      	aesenc	xmm8, xmm3
  31159f:      	aesenc	xmm8, xmm1
  3115a5:      	aesenclast	xmm8, xmm0
  3115ab:      	movdqu	xmmword ptr [rsi - 0x30], xmm10
  3115b1:      	movdqu	xmm10, xmmword ptr [rsi - 0x20]
  3115b7:      	pxor	xmm10, xmm8
  3115bc:      	movd	xmm8, r11d
  3115c1:      	pslldq	xmm8, 0xc               # xmm8 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm8[0,1,2,3]
  3115c7:      	aesenc	xmm7, xmm2
  3115cc:      	pxor	xmm8, xmm6
  3115d1:      	aesenc	xmm7, xmm14
  3115d7:      	aesenc	xmm8, xmm2
  3115dd:      	aesenc	xmm7, xmm9
  3115e3:      	aesenc	xmm8, xmm14
  3115e9:      	aesenc	xmm7, xmm11
  3115ef:      	aesenc	xmm8, xmm9
  3115f5:      	aesenc	xmm7, xmm13
  3115fb:      	aesenc	xmm8, xmm11
  311601:      	aesenc	xmm7, xmm5
  311606:      	aesenc	xmm8, xmm13
  31160c:      	aesenc	xmm7, xmm15
  311612:      	aesenc	xmm8, xmm5
  311618:      	aesenc	xmm8, xmm15
  31161e:      	aesenc	xmm7, xmm3
  311623:      	aesenc	xmm8, xmm3
  311629:      	aesenc	xmm7, xmm1
  31162e:      	aesenc	xmm8, xmm1
  311634:      	aesenclast	xmm7, xmm0
  311639:      	movdqu	xmmword ptr [rsi - 0x20], xmm10
  31163f:      	aesenclast	xmm8, xmm0
  311645:      	movdqu	xmm10, xmmword ptr [rsi - 0x10]
  31164b:      	pxor	xmm10, xmm7
  311650:      	movdqa	xmm0, xmmword ptr [rbp - 0x1e0]
  311658:      	movdqa	xmm7, xmm0
  31165c:      	movdqa	xmm1, xmmword ptr [rbp - 0x1f0]
  311664:      	pxor	xmm7, xmm1
  311668:      	movdqu	xmmword ptr [rsi - 0x10], xmm10
  31166e:      	pxor	xmm7, xmmword ptr [rbp - 0x1d0]
  311676:      	movdqa	xmm6, xmm7
  31167a:      	pslldq	xmm6, 0x8               # xmm6 = zero,zero,zero,zero,zero,zero,zero,zero,xmm6[0,1,2,3,4,5,6,7]
  31167f:      	movdqu	xmm10, xmmword ptr [rsi]
  311684:      	pxor	xmm6, xmm0
  311688:      	psrldq	xmm7, 0x8               # xmm7 = xmm7[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero
  31168d:      	pshufd	xmm5, xmm6, 0x4e        # xmm5 = xmm6[2,3,0,1]
  311692:      	pxor	xmm10, xmm8
  311697:      	movq	xmm8, rdx
  31169c:      	pclmulqdq	xmm6, xmm8, 0x0
  3116a3:      	pxor	xmm6, xmm5
  3116a7:      	pshufd	xmm5, xmm6, 0x4e        # xmm5 = xmm6[2,3,0,1]
  3116ac:      	pxor	xmm5, xmm7
  3116b0:      	pclmulqdq	xmm6, xmm8, 0x0
  3116b7:      	pxor	xmm5, xmm1
  3116bb:      	movdqu	xmmword ptr [rsi], xmm10
  3116c0:      	pxor	xmm5, xmm6
  3116c4:      	add	r10d, 0x8
  3116c8:      	sub	rsi, -0x80
  3116cc:      	dec	rdi
  3116cf:      	jne	0x3110a0 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, false>+0x510>
  3116d5:      	shl	rax, 0x7
  3116d9:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x80]
  3116e0:      	movdqa	xmm0, xmmword ptr [rip - 0x265428] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  3116e8:      	pshufb	xmm3, xmm0
  3116ed:      	pxor	xmm3, xmm5
  3116f1:      	movdqa	xmm2, xmm3
  3116f5:      	movdqa	xmm7, xmmword ptr [rbp - 0x110]
  3116fd:      	pclmulqdq	xmm2, xmm7, 0x0
  311703:      	pclmulqdq	xmm7, xmm3, 0x11
  311709:      	pshufd	xmm1, xmm3, 0xee        # xmm1 = xmm3[2,3,2,3]
  31170e:      	pxor	xmm1, xmm3
  311712:      	pclmulqdq	xmm1, xmmword ptr [rbp - 0xd0], 0x0
  31171c:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x70]
  311723:      	pshufb	xmm3, xmm0
  311728:      	movdqa	xmm4, xmm3
  31172c:      	movdqa	xmm9, xmmword ptr [rbp - 0x100]
  311735:      	pclmulqdq	xmm4, xmm9, 0x0
  31173c:      	pclmulqdq	xmm9, xmm3, 0x11
  311743:      	pshufd	xmm5, xmm3, 0xee        # xmm5 = xmm3[2,3,2,3]
  311748:      	pxor	xmm5, xmm3
  31174c:      	pclmulqdq	xmm5, xmmword ptr [rbp - 0xa0], 0x0
  311756:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x60]
  31175d:      	pshufb	xmm3, xmm0
  311762:      	movdqa	xmm6, xmm3
  311766:      	movdqa	xmm8, xmmword ptr [rbp - 0xf0]
  31176f:      	pclmulqdq	xmm6, xmm8, 0x0
  311776:      	pxor	xmm6, xmm4
  31177a:      	pclmulqdq	xmm8, xmm3, 0x11
  311781:      	pxor	xmm8, xmm9
  311786:      	pshufd	xmm4, xmm3, 0xee        # xmm4 = xmm3[2,3,2,3]
  31178b:      	pxor	xmm4, xmm3
  31178f:      	pclmulqdq	xmm4, xmmword ptr [rbp - 0xb0], 0x0
  311799:      	pxor	xmm4, xmm5
  31179d:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x50]
  3117a4:      	pshufb	xmm3, xmm0
  3117a9:      	movdqa	xmm5, xmm3
  3117ad:      	movdqa	xmm9, xmmword ptr [rbp - 0x20]
  3117b3:      	pclmulqdq	xmm5, xmm9, 0x0
  3117ba:      	pxor	xmm5, xmm6
  3117be:      	pclmulqdq	xmm9, xmm3, 0x11
  3117c5:      	pxor	xmm9, xmm8
  3117ca:      	pshufd	xmm6, xmm3, 0xee        # xmm6 = xmm3[2,3,2,3]
  3117cf:      	pxor	xmm6, xmm3
  3117d3:      	pclmulqdq	xmm6, xmmword ptr [rbp - 0x80], 0x0
  3117da:      	pxor	xmm6, xmm4
  3117de:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x40]
  3117e5:      	pshufb	xmm3, xmm0
  3117ea:      	movdqa	xmm4, xmm3
  3117ee:      	movdqa	xmm8, xmmword ptr [rbp - 0x30]
  3117f4:      	pclmulqdq	xmm4, xmm8, 0x0
  3117fb:      	pxor	xmm4, xmm5
  3117ff:      	pclmulqdq	xmm8, xmm3, 0x11
  311806:      	pxor	xmm8, xmm9
  31180b:      	pshufd	xmm5, xmm3, 0xee        # xmm5 = xmm3[2,3,2,3]
  311810:      	pxor	xmm5, xmm3
  311814:      	pclmulqdq	xmm5, xmmword ptr [rbp - 0x70], 0x0
  31181b:      	pxor	xmm5, xmm6
  31181f:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x30]
  311826:      	pshufb	xmm3, xmm0
  31182b:      	movdqa	xmm6, xmm3
  31182f:      	movdqa	xmm9, xmmword ptr [rbp - 0x40]
  311835:      	pclmulqdq	xmm6, xmm9, 0x0
  31183c:      	pxor	xmm6, xmm4
  311840:      	pclmulqdq	xmm9, xmm3, 0x11
  311847:      	pxor	xmm9, xmm8
  31184c:      	pshufd	xmm4, xmm3, 0xee        # xmm4 = xmm3[2,3,2,3]
  311851:      	pxor	xmm4, xmm3
  311855:      	pclmulqdq	xmm4, xmmword ptr [rbp - 0x90], 0x0
  31185f:      	pxor	xmm4, xmm5
  311863:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x20]
  31186a:      	pshufb	xmm3, xmm0
  31186f:      	movdqa	xmm5, xmm3
  311873:      	movdqa	xmm8, xmmword ptr [rbp - 0x50]
  311879:      	pclmulqdq	xmm5, xmm8, 0x0
  311880:      	pxor	xmm5, xmm6
  311884:      	pclmulqdq	xmm8, xmm3, 0x11
  31188b:      	pxor	xmm8, xmm9
  311890:      	pshufd	xmm6, xmm3, 0xee        # xmm6 = xmm3[2,3,2,3]
  311895:      	pxor	xmm6, xmm3
  311899:      	pclmulqdq	xmm6, xmmword ptr [rbp - 0xc0], 0x0
  3118a3:      	pxor	xmm6, xmm4
  3118a7:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x10]
  3118ae:      	pshufb	xmm3, xmm0
  3118b3:      	movdqa	xmm4, xmm3
  3118b7:      	movdqa	xmm13, xmmword ptr [rbp - 0x60]
  3118bd:      	pclmulqdq	xmm4, xmm13, 0x0
  3118c4:      	pxor	xmm4, xmm5
  3118c8:      	pxor	xmm4, xmm2
  3118cc:      	pclmulqdq	xmm13, xmm3, 0x11
  3118d3:      	pxor	xmm13, xmm8
  3118d8:      	pxor	xmm13, xmm7
  3118dd:      	pshufd	xmm2, xmm3, 0xee        # xmm2 = xmm3[2,3,2,3]
  3118e2:      	pxor	xmm2, xmm3
  3118e6:      	pclmulqdq	xmm2, xmmword ptr [rbp - 0xe0], 0x0
  3118f0:      	pxor	xmm2, xmm6
  3118f4:      	pxor	xmm2, xmm4
  3118f8:      	pxor	xmm2, xmm1
  3118fc:      	pxor	xmm2, xmm13
  311901:      	movdqa	xmm1, xmm2
  311905:      	pslldq	xmm1, 0x8               # xmm1 = zero,zero,zero,zero,zero,zero,zero,zero,xmm1[0,1,2,3,4,5,6,7]
  31190a:      	pxor	xmm1, xmm4
  31190e:      	psrldq	xmm2, 0x8               # xmm2 = xmm2[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero
  311913:      	pshufd	xmm3, xmm1, 0x4e        # xmm3 = xmm1[2,3,0,1]
  311918:      	movq	xmm4, rdx
  31191d:      	pclmulqdq	xmm1, xmm4, 0x0
  311923:      	pxor	xmm1, xmm3
  311927:      	pshufd	xmm3, xmm1, 0x4e        # xmm3 = xmm1[2,3,0,1]
  31192c:      	pxor	xmm3, xmm2
  311930:      	pclmulqdq	xmm1, xmm4, 0x0
  311936:      	pxor	xmm3, xmm13
  31193b:      	pxor	xmm3, xmm1
  31193f:      	pshufb	xmm3, xmm0
  311944:      	movdqu	xmmword ptr [rcx], xmm3
  311948:      	movabs	rax, 0x7fffffffffffff80
  311952:      	and	r9, rax
  311955:      	jmp	0x31195a <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, false>+0xdca>
  311957:      	xor	r9d, r9d
  31195a:      	mov	rax, r9
  31195d:      	add	rsp, 0x1f0
  311964:      	pop	rbp
  311965:      	ret
  311966:      	lea	rdi, [rip - 0x2055ca]   # 0x10c3a3 <anon.8182237a801038de36885de64d2c176c.5.llvm.10465402473772549265>
  31196d:      	lea	rcx, [rip + 0x4f36fc]   # 0x805070 <anon.8182237a801038de36885de64d2c176c.1.llvm.10465402473772549265>
  311974:      	mov	esi, 0x237
  311979:      	xor	edx, edx
  31197b:      	call	qword ptr [rip + 0x566bbf] # 0x878540 <sdallocx+0x878540>
  311981:      	int3
  311982:      	int3
  311983:      	int3
  311984:      	int3
  311985:      	int3
  311986:      	int3
  311987:      	int3
  311988:      	int3
  311989:      	int3
  31198a:      	int3
  31198b:      	int3
  31198c:      	int3
  31198d:      	int3
  31198e:      	int3
  31198f:      	int3
