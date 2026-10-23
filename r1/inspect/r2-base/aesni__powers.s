
stage/probe-base-02301e02b:	file format elf64-x86-64

Disassembly of section .text:

00000000002ff430 <toyos_crypto::arch::x86_64::aesni::powers>:
  2ff430:      	push	rbp
  2ff431:      	mov	rbp, rsp
  2ff434:      	sub	rsp, 0x100
  2ff43b:      	mov	rax, rsi
  2ff43e:      	mov	rcx, qword ptr [rdi]
  2ff441:      	mov	rdx, qword ptr [rdi + 0x8]
  2ff445:      	xorps	xmm0, xmm0
  2ff448:      	movaps	xmmword ptr [rbp - 0x10], xmm0
  2ff44c:      	movaps	xmmword ptr [rbp - 0x20], xmm0
  2ff450:      	movaps	xmmword ptr [rbp - 0x30], xmm0
  2ff454:      	movaps	xmmword ptr [rbp - 0x40], xmm0
  2ff458:      	movaps	xmmword ptr [rbp - 0x50], xmm0
  2ff45c:      	movaps	xmmword ptr [rbp - 0x60], xmm0
  2ff460:      	movaps	xmmword ptr [rbp - 0x70], xmm0
  2ff464:      	movaps	xmmword ptr [rbp - 0x80], xmm0
  2ff468:      	movaps	xmmword ptr [rbp - 0x90], xmm0
  2ff46f:      	movaps	xmmword ptr [rbp - 0xa0], xmm0
  2ff476:      	movaps	xmmword ptr [rbp - 0xb0], xmm0
  2ff47d:      	movaps	xmmword ptr [rbp - 0xc0], xmm0
  2ff484:      	movaps	xmmword ptr [rbp - 0xd0], xmm0
  2ff48b:      	movaps	xmmword ptr [rbp - 0xe0], xmm0
  2ff492:      	bswap	rdx
  2ff495:      	bswap	rcx
  2ff498:      	movaps	xmmword ptr [rbp - 0xf0], xmm0
  2ff49f:      	mov	rsi, rcx
  2ff4a2:      	shld	rsi, rdx, 0x1
  2ff4a7:      	add	rdx, rdx
  2ff4aa:      	sar	rcx, 0x3f
  2ff4ae:      	movabs	rdi, -0x3e00000000000000
  2ff4b8:      	sub	rdx, rcx
  2ff4bb:      	and	rcx, rdi
  2ff4be:      	xor	rcx, rsi
  2ff4c1:      	mov	qword ptr [rbp - 0x100], rdx
  2ff4c8:      	mov	qword ptr [rbp - 0xf8], rcx
  2ff4cf:      	mov	ecx, 0x1
  2ff4d4:      	mov	edx, 0x10
  2ff4d9:      	xor	esi, esi
  2ff4db:      	movq	xmm0, rdi
  2ff4e0:      	lea	rdi, [8*rcx]
  2ff4e8:      	mov	r8, rsi
  2ff4eb:      	and	rdi, -0x10
  2ff4ef:      	sub	r8, rdi
  2ff4f2:      	movdqa	xmm2, xmmword ptr [rbp + r8 - 0x100]
  2ff4fc:      	movdqa	xmm3, xmmword ptr [rbp + rdi - 0x100]
  2ff505:      	movdqa	xmm1, xmm2
  2ff509:      	pshufd	xmm4, xmm2, 0xee        # xmm4 = xmm2[2,3,2,3]
  2ff50e:      	pxor	xmm4, xmm2
  2ff512:      	pclmulqdq	xmm2, xmm3, 0x0
  2ff518:      	pclmulqdq	xmm1, xmm3, 0x11
  2ff51e:      	pshufd	xmm5, xmm3, 0xee        # xmm5 = xmm3[2,3,2,3]
  2ff523:      	pxor	xmm5, xmm3
  2ff527:      	pclmulqdq	xmm5, xmm4, 0x0
  2ff52d:      	movdqa	xmm3, xmm2
  2ff531:      	pxor	xmm3, xmm1
  2ff535:      	pxor	xmm3, xmm5
  2ff539:      	movdqa	xmm4, xmm3
  2ff53d:      	pslldq	xmm4, 0x8               # xmm4 = zero,zero,zero,zero,zero,zero,zero,zero,xmm4[0,1,2,3,4,5,6,7]
  2ff542:      	pxor	xmm4, xmm2
  2ff546:      	psrldq	xmm3, 0x8               # xmm3 = xmm3[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero
  2ff54b:      	pshufd	xmm2, xmm4, 0x4e        # xmm2 = xmm4[2,3,0,1]
  2ff550:      	pclmulqdq	xmm4, xmm0, 0x0
  2ff556:      	pxor	xmm4, xmm2
  2ff55a:      	pshufd	xmm2, xmm4, 0x4e        # xmm2 = xmm4[2,3,0,1]
  2ff55f:      	pxor	xmm2, xmm3
  2ff563:      	pclmulqdq	xmm4, xmm0, 0x0
  2ff569:      	pxor	xmm2, xmm1
  2ff56d:      	pxor	xmm2, xmm4
  2ff571:      	inc	rcx
  2ff574:      	movdqa	xmmword ptr [rbp + rdx - 0x100], xmm2
  2ff57d:      	add	rdx, 0x10
  2ff581:      	add	rsi, 0x10
  2ff585:      	cmp	rdx, 0x100
  2ff58c:      	jne	0x2ff4e0 <toyos_crypto::arch::x86_64::aesni::powers+0xb0>
  2ff592:      	lea	rsi, [rbp - 0x100]
  2ff599:      	mov	edx, 0x100
  2ff59e:      	mov	rdi, rax
  2ff5a1:      	call	qword ptr [rip + 0x5766e9] # 0x875c90 <sdallocx+0x875c90>
  2ff5a7:      	add	rsp, 0x100
  2ff5ae:      	pop	rbp
  2ff5af:      	ret
