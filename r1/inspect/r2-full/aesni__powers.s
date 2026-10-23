
stage/probe-full-7dcf12a5a:	file format elf64-x86-64

Disassembly of section .text:

00000000002ff8e0 <toyos_crypto::arch::x86_64::aesni::powers>:
  2ff8e0:      	push	rbp
  2ff8e1:      	mov	rbp, rsp
  2ff8e4:      	sub	rsp, 0x80
  2ff8eb:      	mov	rax, qword ptr [rdi]
  2ff8ee:      	mov	rcx, qword ptr [rdi + 0x8]
  2ff8f2:      	xorps	xmm0, xmm0
  2ff8f5:      	movaps	xmmword ptr [rbp - 0x10], xmm0
  2ff8f9:      	movaps	xmmword ptr [rbp - 0x20], xmm0
  2ff8fd:      	movaps	xmmword ptr [rbp - 0x30], xmm0
  2ff901:      	movaps	xmmword ptr [rbp - 0x40], xmm0
  2ff905:      	movaps	xmmword ptr [rbp - 0x50], xmm0
  2ff909:      	movaps	xmmword ptr [rbp - 0x60], xmm0
  2ff90d:      	movaps	xmmword ptr [rbp - 0x70], xmm0
  2ff911:      	movaps	xmmword ptr [rbp - 0x80], xmm0
  2ff915:      	movaps	xmmword ptr [rbp - 0x90], xmm0
  2ff91c:      	movaps	xmmword ptr [rbp - 0xa0], xmm0
  2ff923:      	movaps	xmmword ptr [rbp - 0xb0], xmm0
  2ff92a:      	movaps	xmmword ptr [rbp - 0xc0], xmm0
  2ff931:      	movaps	xmmword ptr [rbp - 0xd0], xmm0
  2ff938:      	movaps	xmmword ptr [rbp - 0xe0], xmm0
  2ff93f:      	bswap	rcx
  2ff942:      	bswap	rax
  2ff945:      	movaps	xmmword ptr [rbp - 0xf0], xmm0
  2ff94c:      	mov	rdx, rax
  2ff94f:      	shld	rdx, rcx, 0x1
  2ff954:      	add	rcx, rcx
  2ff957:      	sar	rax, 0x3f
  2ff95b:      	movabs	rdi, -0x3e00000000000000
  2ff965:      	sub	rcx, rax
  2ff968:      	and	rax, rdi
  2ff96b:      	xor	rax, rdx
  2ff96e:      	mov	qword ptr [rbp - 0x100], rcx
  2ff975:      	mov	qword ptr [rbp - 0xf8], rax
  2ff97c:      	mov	eax, 0x1
  2ff981:      	mov	ecx, 0x10
  2ff986:      	xor	edx, edx
  2ff988:      	movq	xmm0, rdi
  2ff98d:      	nop	dword ptr [rax]
  2ff990:      	lea	rdi, [8*rax]
  2ff998:      	mov	r8, rdx
  2ff99b:      	and	rdi, -0x10
  2ff99f:      	sub	r8, rdi
  2ff9a2:      	movdqa	xmm2, xmmword ptr [rbp + r8 - 0x100]
  2ff9ac:      	movdqa	xmm3, xmmword ptr [rbp + rdi - 0x100]
  2ff9b5:      	movdqa	xmm1, xmm2
  2ff9b9:      	pshufd	xmm4, xmm2, 0xee        # xmm4 = xmm2[2,3,2,3]
  2ff9be:      	pxor	xmm4, xmm2
  2ff9c2:      	pclmulqdq	xmm2, xmm3, 0x0
  2ff9c8:      	pclmulqdq	xmm1, xmm3, 0x11
  2ff9ce:      	pshufd	xmm5, xmm3, 0xee        # xmm5 = xmm3[2,3,2,3]
  2ff9d3:      	pxor	xmm5, xmm3
  2ff9d7:      	pclmulqdq	xmm5, xmm4, 0x0
  2ff9dd:      	movdqa	xmm3, xmm2
  2ff9e1:      	pxor	xmm3, xmm1
  2ff9e5:      	pxor	xmm3, xmm5
  2ff9e9:      	movdqa	xmm4, xmm3
  2ff9ed:      	pslldq	xmm4, 0x8               # xmm4 = zero,zero,zero,zero,zero,zero,zero,zero,xmm4[0,1,2,3,4,5,6,7]
  2ff9f2:      	pxor	xmm4, xmm2
  2ff9f6:      	psrldq	xmm3, 0x8               # xmm3 = xmm3[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero
  2ff9fb:      	pshufd	xmm2, xmm4, 0x4e        # xmm2 = xmm4[2,3,0,1]
  2ffa00:      	pclmulqdq	xmm4, xmm0, 0x0
  2ffa06:      	pxor	xmm4, xmm2
  2ffa0a:      	pshufd	xmm2, xmm4, 0x4e        # xmm2 = xmm4[2,3,0,1]
  2ffa0f:      	pxor	xmm2, xmm3
  2ffa13:      	pclmulqdq	xmm4, xmm0, 0x0
  2ffa19:      	pxor	xmm2, xmm1
  2ffa1d:      	pxor	xmm2, xmm4
  2ffa21:      	inc	rax
  2ffa24:      	movdqa	xmmword ptr [rbp + rcx - 0x100], xmm2
  2ffa2d:      	add	rcx, 0x10
  2ffa31:      	add	rdx, 0x10
  2ffa35:      	cmp	rcx, 0x100
  2ffa3c:      	jne	0x2ff990 <toyos_crypto::arch::x86_64::aesni::powers+0xb0>
  2ffa42:      	movaps	xmm0, xmmword ptr [rbp - 0x100]
  2ffa49:      	movaps	xmmword ptr [rsi + 0x2f0], xmm0
  2ffa50:      	movaps	xmm0, xmmword ptr [rbp - 0xf0]
  2ffa57:      	movaps	xmmword ptr [rsi + 0x2e0], xmm0
  2ffa5e:      	movaps	xmm0, xmmword ptr [rbp - 0xe0]
  2ffa65:      	movaps	xmmword ptr [rsi + 0x2d0], xmm0
  2ffa6c:      	movaps	xmm0, xmmword ptr [rbp - 0xd0]
  2ffa73:      	movaps	xmmword ptr [rsi + 0x2c0], xmm0
  2ffa7a:      	movaps	xmm0, xmmword ptr [rbp - 0xc0]
  2ffa81:      	movaps	xmmword ptr [rsi + 0x2b0], xmm0
  2ffa88:      	movaps	xmm0, xmmword ptr [rbp - 0xb0]
  2ffa8f:      	movaps	xmmword ptr [rsi + 0x2a0], xmm0
  2ffa96:      	movaps	xmm0, xmmword ptr [rbp - 0xa0]
  2ffa9d:      	movaps	xmmword ptr [rsi + 0x290], xmm0
  2ffaa4:      	movaps	xmm0, xmmword ptr [rbp - 0x90]
  2ffaab:      	movaps	xmmword ptr [rsi + 0x280], xmm0
  2ffab2:      	movaps	xmm0, xmmword ptr [rbp - 0x80]
  2ffab6:      	movaps	xmmword ptr [rsi + 0x270], xmm0
  2ffabd:      	movaps	xmm0, xmmword ptr [rbp - 0x70]
  2ffac1:      	movaps	xmmword ptr [rsi + 0x260], xmm0
  2ffac8:      	movaps	xmm0, xmmword ptr [rbp - 0x60]
  2ffacc:      	movaps	xmmword ptr [rsi + 0x250], xmm0
  2ffad3:      	movaps	xmm0, xmmword ptr [rbp - 0x50]
  2ffad7:      	movaps	xmmword ptr [rsi + 0x240], xmm0
  2ffade:      	movaps	xmm0, xmmword ptr [rbp - 0x40]
  2ffae2:      	movaps	xmmword ptr [rsi + 0x230], xmm0
  2ffae9:      	movaps	xmm0, xmmword ptr [rbp - 0x30]
  2ffaed:      	movaps	xmmword ptr [rsi + 0x220], xmm0
  2ffaf4:      	movaps	xmm0, xmmword ptr [rbp - 0x20]
  2ffaf8:      	movaps	xmmword ptr [rsi + 0x210], xmm0
  2ffaff:      	movaps	xmm0, xmmword ptr [rbp - 0x10]
  2ffb03:      	movaps	xmmword ptr [rsi + 0x200], xmm0
  2ffb0a:      	add	rsp, 0x80
  2ffb11:      	pop	rbp
  2ffb12:      	ret
  2ffb13:      	int3
  2ffb14:      	int3
  2ffb15:      	int3
  2ffb16:      	int3
  2ffb17:      	int3
  2ffb18:      	int3
  2ffb19:      	int3
  2ffb1a:      	int3
  2ffb1b:      	int3
  2ffb1c:      	int3
  2ffb1d:      	int3
  2ffb1e:      	int3
  2ffb1f:      	int3
