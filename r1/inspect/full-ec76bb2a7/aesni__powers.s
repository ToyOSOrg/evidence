
stage/probe-full-ec76bb2a7:	file format elf64-x86-64

Disassembly of section .text:

00000000002ff8a0 <toyos_crypto::arch::x86_64::aesni::powers>:
  2ff8a0:      	push	rbp
  2ff8a1:      	mov	rbp, rsp
  2ff8a4:      	sub	rsp, 0x80
  2ff8ab:      	mov	rax, qword ptr [rdi]
  2ff8ae:      	mov	rcx, qword ptr [rdi + 0x8]
  2ff8b2:      	lea	rdx, [rbp - 0xf0]
  2ff8b9:      	xorps	xmm0, xmm0
  2ff8bc:      	movaps	xmmword ptr [rbp - 0x10], xmm0
  2ff8c0:      	movaps	xmmword ptr [rbp - 0x20], xmm0
  2ff8c4:      	movaps	xmmword ptr [rbp - 0x30], xmm0
  2ff8c8:      	movaps	xmmword ptr [rbp - 0x40], xmm0
  2ff8cc:      	movaps	xmmword ptr [rbp - 0x50], xmm0
  2ff8d0:      	movaps	xmmword ptr [rbp - 0x60], xmm0
  2ff8d4:      	movaps	xmmword ptr [rbp - 0x70], xmm0
  2ff8d8:      	movaps	xmmword ptr [rbp - 0x80], xmm0
  2ff8dc:      	movaps	xmmword ptr [rbp - 0x90], xmm0
  2ff8e3:      	movaps	xmmword ptr [rbp - 0xa0], xmm0
  2ff8ea:      	movaps	xmmword ptr [rbp - 0xb0], xmm0
  2ff8f1:      	movaps	xmmword ptr [rbp - 0xc0], xmm0
  2ff8f8:      	movaps	xmmword ptr [rbp - 0xd0], xmm0
  2ff8ff:      	movaps	xmmword ptr [rbp - 0xe0], xmm0
  2ff906:      	bswap	rcx
  2ff909:      	movaps	xmmword ptr [rbp - 0xf0], xmm0
  2ff910:      	bswap	rax
  2ff913:      	mov	rdi, rax
  2ff916:      	shld	rdi, rcx, 0x1
  2ff91b:      	add	rcx, rcx
  2ff91e:      	sar	rax, 0x3f
  2ff922:      	movabs	r9, -0x3e00000000000000
  2ff92c:      	sub	rcx, rax
  2ff92f:      	and	rax, r9
  2ff932:      	xor	rax, rdi
  2ff935:      	mov	qword ptr [rbp - 0x100], rcx
  2ff93c:      	mov	qword ptr [rbp - 0xf8], rax
  2ff943:      	mov	r8d, 0x1
  2ff949:      	movq	xmm0, r9
  2ff94e:      	nop
  2ff950:      	lea	rdi, [r8 + 0x1]
  2ff954:      	shl	r8, 0x3
  2ff958:      	and	r8, -0x10
  2ff95c:      	mov	r9, rdx
  2ff95f:      	sub	r9, r8
  2ff962:      	movdqa	xmm2, xmmword ptr [r9 - 0x10]
  2ff968:      	movdqa	xmm3, xmmword ptr [rbp + r8 - 0x100]
  2ff972:      	movdqa	xmm1, xmm2
  2ff976:      	pshufd	xmm4, xmm2, 0xee        # xmm4 = xmm2[2,3,2,3]
  2ff97b:      	pxor	xmm4, xmm2
  2ff97f:      	pclmulqdq	xmm2, xmm3, 0x0
  2ff985:      	pclmulqdq	xmm1, xmm3, 0x11
  2ff98b:      	pshufd	xmm5, xmm3, 0xee        # xmm5 = xmm3[2,3,2,3]
  2ff990:      	pxor	xmm5, xmm3
  2ff994:      	pclmulqdq	xmm5, xmm4, 0x0
  2ff99a:      	movdqa	xmm3, xmm2
  2ff99e:      	pxor	xmm3, xmm1
  2ff9a2:      	pxor	xmm3, xmm5
  2ff9a6:      	movdqa	xmm4, xmm3
  2ff9aa:      	pslldq	xmm4, 0x8               # xmm4 = zero,zero,zero,zero,zero,zero,zero,zero,xmm4[0,1,2,3,4,5,6,7]
  2ff9af:      	pxor	xmm4, xmm2
  2ff9b3:      	psrldq	xmm3, 0x8               # xmm3 = xmm3[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero
  2ff9b8:      	pshufd	xmm2, xmm4, 0x4e        # xmm2 = xmm4[2,3,0,1]
  2ff9bd:      	pclmulqdq	xmm4, xmm0, 0x0
  2ff9c3:      	pxor	xmm4, xmm2
  2ff9c7:      	pshufd	xmm2, xmm4, 0x4e        # xmm2 = xmm4[2,3,0,1]
  2ff9cc:      	pxor	xmm2, xmm3
  2ff9d0:      	pclmulqdq	xmm4, xmm0, 0x0
  2ff9d6:      	pxor	xmm2, xmm1
  2ff9da:      	pxor	xmm2, xmm4
  2ff9de:      	movdqa	xmmword ptr [rdx], xmm2
  2ff9e2:      	add	rdx, 0x10
  2ff9e6:      	mov	r8, rdi
  2ff9e9:      	cmp	rdi, 0x10
  2ff9ed:      	jne	0x2ff950 <toyos_crypto::arch::x86_64::aesni::powers+0xb0>
  2ff9f3:      	mov	qword ptr [rsi + 0x2f0], rcx
  2ff9fa:      	mov	qword ptr [rsi + 0x2f8], rax
  2ffa01:      	movaps	xmm0, xmmword ptr [rbp - 0xf0]
  2ffa08:      	movaps	xmmword ptr [rsi + 0x2e0], xmm0
  2ffa0f:      	movaps	xmm0, xmmword ptr [rbp - 0xe0]
  2ffa16:      	movaps	xmmword ptr [rsi + 0x2d0], xmm0
  2ffa1d:      	movaps	xmm0, xmmword ptr [rbp - 0xd0]
  2ffa24:      	movaps	xmmword ptr [rsi + 0x2c0], xmm0
  2ffa2b:      	movaps	xmm0, xmmword ptr [rbp - 0xc0]
  2ffa32:      	movaps	xmmword ptr [rsi + 0x2b0], xmm0
  2ffa39:      	movaps	xmm0, xmmword ptr [rbp - 0xb0]
  2ffa40:      	movaps	xmmword ptr [rsi + 0x2a0], xmm0
  2ffa47:      	movaps	xmm0, xmmword ptr [rbp - 0xa0]
  2ffa4e:      	movaps	xmmword ptr [rsi + 0x290], xmm0
  2ffa55:      	movaps	xmm0, xmmword ptr [rbp - 0x90]
  2ffa5c:      	movaps	xmmword ptr [rsi + 0x280], xmm0
  2ffa63:      	movaps	xmm0, xmmword ptr [rbp - 0x80]
  2ffa67:      	movaps	xmmword ptr [rsi + 0x270], xmm0
  2ffa6e:      	movaps	xmm0, xmmword ptr [rbp - 0x70]
  2ffa72:      	movaps	xmmword ptr [rsi + 0x260], xmm0
  2ffa79:      	movaps	xmm0, xmmword ptr [rbp - 0x60]
  2ffa7d:      	movaps	xmmword ptr [rsi + 0x250], xmm0
  2ffa84:      	movaps	xmm0, xmmword ptr [rbp - 0x50]
  2ffa88:      	movaps	xmmword ptr [rsi + 0x240], xmm0
  2ffa8f:      	movaps	xmm0, xmmword ptr [rbp - 0x40]
  2ffa93:      	movaps	xmmword ptr [rsi + 0x230], xmm0
  2ffa9a:      	movaps	xmm0, xmmword ptr [rbp - 0x30]
  2ffa9e:      	movaps	xmmword ptr [rsi + 0x220], xmm0
  2ffaa5:      	movaps	xmm0, xmmword ptr [rbp - 0x20]
  2ffaa9:      	movaps	xmmword ptr [rsi + 0x210], xmm0
  2ffab0:      	movaps	xmm0, xmmword ptr [rbp - 0x10]
  2ffab4:      	movaps	xmmword ptr [rsi + 0x200], xmm0
  2ffabb:      	add	rsp, 0x80
  2ffac2:      	pop	rbp
  2ffac3:      	ret
  2ffac4:      	int3
  2ffac5:      	int3
  2ffac6:      	int3
  2ffac7:      	int3
  2ffac8:      	int3
  2ffac9:      	int3
  2ffaca:      	int3
  2ffacb:      	int3
  2ffacc:      	int3
  2ffacd:      	int3
  2fface:      	int3
  2ffacf:      	int3
