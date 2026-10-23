
stage/probe-full-7dcf12a5a:	file format elf64-x86-64

Disassembly of section .text:

0000000000313010 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, true>>:
  313010:      	push	rbp
  313011:      	mov	rbp, rsp
  313014:      	push	rbx
  313015:      	sub	rsp, 0x228
  31301c:      	mov	rax, r9
  31301f:      	shr	rax, 0x7
  313023:      	je	0x313589 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, true>+0x579>
  313029:      	movaps	xmm0, xmmword ptr [rsi + 0x280]
  313030:      	movaps	xmm1, xmmword ptr [rsi + 0x290]
  313037:      	movdqa	xmm2, xmmword ptr [rsi + 0x2a0]
  31303f:      	movaps	xmm3, xmmword ptr [rsi + 0x2b0]
  313046:      	movaps	xmmword ptr [rbp - 0x1b0], xmm0
  31304d:      	movaps	xmmword ptr [rbp - 0x1a0], xmm1
  313054:      	movdqa	xmmword ptr [rbp - 0x190], xmm2
  31305c:      	movaps	xmmword ptr [rbp - 0x180], xmm3
  313063:      	movaps	xmm0, xmmword ptr [rsi + 0x2c0]
  31306a:      	movaps	xmmword ptr [rbp - 0x170], xmm0
  313071:      	movaps	xmm0, xmmword ptr [rsi + 0x2d0]
  313078:      	movaps	xmmword ptr [rbp - 0x160], xmm0
  31307f:      	movaps	xmm0, xmmword ptr [rsi + 0x2e0]
  313086:      	movaps	xmmword ptr [rbp - 0x150], xmm0
  31308d:      	movaps	xmm0, xmmword ptr [rsi + 0x2f0]
  313094:      	movaps	xmmword ptr [rbp - 0x140], xmm0
  31309b:      	movdqa	xmm0, xmmword ptr [rsi + 0x280]
  3130a3:      	pshufd	xmm1, xmm0, 0x4e        # xmm1 = xmm0[2,3,0,1]
  3130a8:      	pxor	xmm1, xmm0
  3130ac:      	movdqa	xmmword ptr [rbp - 0x30], xmm1
  3130b1:      	movdqa	xmmword ptr [rbp - 0x230], xmm1
  3130b9:      	movdqa	xmm0, xmmword ptr [rsi + 0x290]
  3130c1:      	pshufd	xmm1, xmm0, 0x4e        # xmm1 = xmm0[2,3,0,1]
  3130c6:      	pxor	xmm1, xmm0
  3130ca:      	movdqa	xmmword ptr [rbp - 0x220], xmm1
  3130d2:      	movdqa	xmm0, xmmword ptr [rsi + 0x2a0]
  3130da:      	pshufd	xmm1, xmm0, 0x4e        # xmm1 = xmm0[2,3,0,1]
  3130df:      	pxor	xmm1, xmm0
  3130e3:      	movdqa	xmmword ptr [rbp - 0x210], xmm1
  3130eb:      	movdqa	xmm0, xmmword ptr [rsi + 0x2b0]
  3130f3:      	pshufd	xmm1, xmm0, 0x4e        # xmm1 = xmm0[2,3,0,1]
  3130f8:      	pxor	xmm1, xmm0
  3130fc:      	movdqa	xmmword ptr [rbp - 0x200], xmm1
  313104:      	movdqa	xmm0, xmmword ptr [rsi + 0x2c0]
  31310c:      	pshufd	xmm1, xmm0, 0x4e        # xmm1 = xmm0[2,3,0,1]
  313111:      	pxor	xmm1, xmm0
  313115:      	movdqa	xmmword ptr [rbp - 0x1f0], xmm1
  31311d:      	movdqa	xmm0, xmmword ptr [rsi + 0x2d0]
  313125:      	pshufd	xmm1, xmm0, 0x4e        # xmm1 = xmm0[2,3,0,1]
  31312a:      	pxor	xmm1, xmm0
  31312e:      	movdqa	xmmword ptr [rbp - 0x1e0], xmm1
  313136:      	movdqa	xmm0, xmmword ptr [rsi + 0x2e0]
  31313e:      	pshufd	xmm1, xmm0, 0x4e        # xmm1 = xmm0[2,3,0,1]
  313143:      	pxor	xmm1, xmm0
  313147:      	movdqa	xmmword ptr [rbp - 0x1d0], xmm1
  31314f:      	movdqa	xmm0, xmmword ptr [rsi + 0x2f0]
  313157:      	pshufd	xmm1, xmm0, 0x4e        # xmm1 = xmm0[2,3,0,1]
  31315c:      	pxor	xmm1, xmm0
  313160:      	movdqa	xmmword ptr [rbp - 0x1c0], xmm1
  313168:      	movdqu	xmm1, xmmword ptr [rdi]
  31316c:      	pxor	xmm0, xmm0
  313170:      	movdqa	xmmword ptr [rbp - 0x130], xmm0
  313178:      	lea	rsi, [rbp - 0x130]
  31317f:      	mov	r10, rdx
  313182:      	sub	r10, rsi
  313185:      	sub	rsi, rdx
  313188:      	cmovb	rsi, r10
  31318c:      	cmp	rsi, 0xb
  313190:      	jbe	0x313599 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, true>+0x589>
  313196:      	mov	esi, dword ptr [rdx + 0x8]
  313199:      	mov	dword ptr [rbp - 0x128], esi
  31319f:      	mov	rdx, qword ptr [rdx]
  3131a2:      	mov	qword ptr [rbp - 0x130], rdx
  3131a9:      	pxor	xmm1, xmmword ptr [rbp - 0x130]
  3131b1:      	movdqu	xmm7, xmmword ptr [rcx]
  3131b5:      	pshufb	xmm7, xmmword ptr [rip - 0x266efe] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  3131be:      	movdqa	xmm0, xmmword ptr [rbp - 0x1b0]
  3131c6:      	movdqa	xmmword ptr [rbp - 0x20], xmm0
  3131cb:      	movdqu	xmm3, xmmword ptr [rdi + 0xe0]
  3131d3:      	xor	edx, edx
  3131d5:      	movabs	rsi, -0x3e00000000000000
  3131df:      	jmp	0x3132da <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, true>+0x2ca>
  3131e4:      	nop	word ptr cs:[rax + rax]
  3131f0:      	aesenclast	xmm13, xmm3
  3131f6:      	pxor	xmm13, xmmword ptr [rbp - 0x40]
  3131fc:      	movdqu	xmmword ptr [r10], xmm13
  313201:      	aesenclast	xmm14, xmm3
  313207:      	pxor	xmm14, xmmword ptr [rbp - 0x50]
  31320d:      	movdqu	xmmword ptr [r10 + 0x10], xmm14
  313213:      	aesenclast	xmm15, xmm3
  313219:      	pxor	xmm15, xmmword ptr [rbp - 0x60]
  31321f:      	movdqu	xmmword ptr [r10 + 0x20], xmm15
  313225:      	aesenclast	xmm0, xmm3
  31322a:      	pxor	xmm0, xmmword ptr [rbp - 0x70]
  31322f:      	movdqu	xmmword ptr [r10 + 0x30], xmm0
  313235:      	aesenclast	xmm2, xmm3
  31323a:      	pxor	xmm2, xmmword ptr [rbp - 0x80]
  31323f:      	movdqu	xmmword ptr [r10 + 0x40], xmm2
  313245:      	aesenclast	xmm5, xmm3
  31324a:      	pxor	xmm5, xmmword ptr [rbp - 0x90]
  313252:      	movdqu	xmmword ptr [r10 + 0x50], xmm5
  313258:      	aesenclast	xmm8, xmm3
  31325e:      	pxor	xmm8, xmmword ptr [rbp - 0xa0]
  313267:      	movdqu	xmmword ptr [r10 + 0x60], xmm8
  31326d:      	aesenclast	xmm7, xmm3
  313272:      	pxor	xmm7, xmmword ptr [rbp - 0xb0]
  31327a:      	movdqu	xmmword ptr [r10 + 0x70], xmm7
  313280:      	movdqa	xmm0, xmm6
  313284:      	pxor	xmm0, xmm10
  313289:      	pxor	xmm0, xmm9
  31328e:      	movdqa	xmm2, xmm0
  313292:      	pslldq	xmm2, 0x8               # xmm2 = zero,zero,zero,zero,zero,zero,zero,zero,xmm2[0,1,2,3,4,5,6,7]
  313297:      	pxor	xmm2, xmm10
  31329c:      	psrldq	xmm0, 0x8               # xmm0 = xmm0[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero
  3132a1:      	pshufd	xmm5, xmm2, 0x4e        # xmm5 = xmm2[2,3,0,1]
  3132a6:      	movq	xmm8, rsi
  3132ab:      	pclmulqdq	xmm2, xmm8, 0x0
  3132b2:      	pxor	xmm2, xmm5
  3132b6:      	pshufd	xmm7, xmm2, 0x4e        # xmm7 = xmm2[2,3,0,1]
  3132bb:      	pxor	xmm7, xmm0
  3132bf:      	pclmulqdq	xmm2, xmm8, 0x0
  3132c6:      	pxor	xmm7, xmm6
  3132ca:      	pxor	xmm7, xmm2
  3132ce:      	inc	rdx
  3132d1:      	cmp	rdx, rax
  3132d4:      	je	0x31356d <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, true>+0x55d>
  3132da:      	mov	r11, rdx
  3132dd:      	shl	r11, 0x7
  3132e1:      	lea	r10, [r8 + r11]
  3132e5:      	movdqu	xmm10, xmmword ptr [r8 + r11]
  3132eb:      	movdqa	xmmword ptr [rbp - 0x40], xmm10
  3132f1:      	movdqa	xmm2, xmmword ptr [rip - 0x267039] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  3132f9:      	pshufb	xmm10, xmm2
  3132ff:      	movdqa	xmmword ptr [rbp - 0x130], xmm10
  313308:      	movdqu	xmm0, xmmword ptr [r8 + r11 + 0x10]
  31330f:      	movdqa	xmmword ptr [rbp - 0x50], xmm0
  313314:      	pshufb	xmm0, xmm2
  313319:      	movdqa	xmmword ptr [rbp - 0x120], xmm0
  313321:      	movdqu	xmm0, xmmword ptr [r8 + r11 + 0x20]
  313328:      	movdqa	xmmword ptr [rbp - 0x60], xmm0
  31332d:      	pshufb	xmm0, xmm2
  313332:      	movdqa	xmmword ptr [rbp - 0x110], xmm0
  31333a:      	movdqu	xmm0, xmmword ptr [r8 + r11 + 0x30]
  313341:      	movdqa	xmmword ptr [rbp - 0x70], xmm0
  313346:      	pshufb	xmm0, xmm2
  31334b:      	movdqa	xmmword ptr [rbp - 0x100], xmm0
  313353:      	movdqu	xmm0, xmmword ptr [r8 + r11 + 0x40]
  31335a:      	movdqa	xmmword ptr [rbp - 0x80], xmm0
  31335f:      	pshufb	xmm0, xmm2
  313364:      	movdqa	xmmword ptr [rbp - 0xf0], xmm0
  31336c:      	movdqu	xmm0, xmmword ptr [r8 + r11 + 0x50]
  313373:      	movdqa	xmmword ptr [rbp - 0x90], xmm0
  31337b:      	pshufb	xmm0, xmm2
  313380:      	movdqa	xmmword ptr [rbp - 0xe0], xmm0
  313388:      	movdqu	xmm0, xmmword ptr [r8 + r11 + 0x60]
  31338f:      	movdqa	xmmword ptr [rbp - 0xa0], xmm0
  313397:      	pshufb	xmm0, xmm2
  31339c:      	movdqa	xmmword ptr [rbp - 0xd0], xmm0
  3133a4:      	movdqu	xmm0, xmmword ptr [r8 + r11 + 0x70]
  3133ab:      	movdqa	xmmword ptr [rbp - 0xb0], xmm0
  3133b3:      	pshufb	xmm0, xmm2
  3133b8:      	movdqa	xmmword ptr [rbp - 0xc0], xmm0
  3133c0:      	lea	r11d, [8*rdx + 0x2]
  3133c8:      	bswap	r11d
  3133cb:      	movd	xmm13, r11d
  3133d0:      	pslldq	xmm13, 0xc              # xmm13 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm13[0,1,2,3]
  3133d6:      	pxor	xmm13, xmm1
  3133db:      	lea	r11d, [8*rdx + 0x3]
  3133e3:      	bswap	r11d
  3133e6:      	movd	xmm14, r11d
  3133eb:      	pslldq	xmm14, 0xc              # xmm14 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm14[0,1,2,3]
  3133f1:      	pxor	xmm14, xmm1
  3133f6:      	lea	r11d, [8*rdx + 0x4]
  3133fe:      	bswap	r11d
  313401:      	movd	xmm15, r11d
  313406:      	pslldq	xmm15, 0xc              # xmm15 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm15[0,1,2,3]
  31340c:      	pxor	xmm15, xmm1
  313411:      	lea	r11d, [8*rdx + 0x5]
  313419:      	bswap	r11d
  31341c:      	movd	xmm0, r11d
  313421:      	pslldq	xmm0, 0xc               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3]
  313426:      	pxor	xmm0, xmm1
  31342a:      	lea	r11d, [8*rdx + 0x6]
  313432:      	bswap	r11d
  313435:      	movd	xmm2, r11d
  31343a:      	pslldq	xmm2, 0xc               # xmm2 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm2[0,1,2,3]
  31343f:      	pxor	xmm2, xmm1
  313443:      	lea	r11d, [8*rdx + 0x7]
  31344b:      	bswap	r11d
  31344e:      	movd	xmm5, r11d
  313453:      	pslldq	xmm5, 0xc               # xmm5 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm5[0,1,2,3]
  313458:      	pxor	xmm5, xmm1
  31345c:      	lea	r11d, [8*rdx + 0x8]
  313464:      	bswap	r11d
  313467:      	pxor	xmm10, xmm7
  31346c:      	movd	xmm8, r11d
  313471:      	pslldq	xmm8, 0xc               # xmm8 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm8[0,1,2,3]
  313477:      	pxor	xmm8, xmm1
  31347c:      	lea	r11d, [8*rdx + 0x9]
  313484:      	bswap	r11d
  313487:      	movd	xmm7, r11d
  31348c:      	pslldq	xmm7, 0xc               # xmm7 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm7[0,1,2,3]
  313491:      	pxor	xmm7, xmm1
  313495:      	pshufd	xmm9, xmm10, 0xee       # xmm9 = xmm10[2,3,2,3]
  31349b:      	pxor	xmm9, xmm10
  3134a0:      	movdqa	xmm6, xmm10
  3134a5:      	movdqa	xmm4, xmmword ptr [rbp - 0x20]
  3134aa:      	pclmulqdq	xmm10, xmm4, 0x0
  3134b1:      	pclmulqdq	xmm6, xmm4, 0x11
  3134b7:      	pclmulqdq	xmm9, xmmword ptr [rbp - 0x30], 0x0
  3134bf:      	mov	r11, -0x1
  3134c6:      	xor	ebx, ebx
  3134c8:      	jmp	0x313518 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, true>+0x508>
  3134ca:      	nop	word ptr [rax + rax]
  3134d0:      	movdqu	xmm11, xmmword ptr [rdi + rbx + 0x10]
  3134d7:      	aesenc	xmm13, xmm11
  3134dd:      	aesenc	xmm14, xmm11
  3134e3:      	aesenc	xmm15, xmm11
  3134e9:      	aesenc	xmm0, xmm11
  3134ef:      	aesenc	xmm2, xmm11
  3134f5:      	aesenc	xmm5, xmm11
  3134fb:      	aesenc	xmm8, xmm11
  313501:      	aesenc	xmm7, xmm11
  313507:      	add	rbx, 0x10
  31350b:      	inc	r11
  31350e:      	cmp	r11, 0xc
  313512:      	je	0x3131f0 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, true>+0x1e0>
  313518:      	cmp	r11, 0x7
  31351c:      	jae	0x3134d0 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, true>+0x4c0>
  31351e:      	movdqa	xmm12, xmmword ptr [rbp + rbx - 0x130]
  313528:      	movdqa	xmm4, xmmword ptr [rbp + rbx - 0x1b0]
  313531:      	movdqa	xmm11, xmm12
  313536:      	pclmulqdq	xmm11, xmm4, 0x0
  31353d:      	pxor	xmm10, xmm11
  313542:      	pclmulqdq	xmm4, xmm12, 0x11
  313549:      	pxor	xmm6, xmm4
  31354d:      	pshufd	xmm4, xmm12, 0xee       # xmm4 = xmm12[2,3,2,3]
  313553:      	pxor	xmm4, xmm12
  313558:      	pclmulqdq	xmm4, xmmword ptr [rbp + rbx - 0x230], 0x0
  313563:      	pxor	xmm9, xmm4
  313568:      	jmp	0x3134d0 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, true>+0x4c0>
  31356d:      	pshufb	xmm7, xmmword ptr [rip - 0x2672b6] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  313576:      	movdqu	xmmword ptr [rcx], xmm7
  31357a:      	movabs	rax, 0x7fffffffffffff80
  313584:      	and	r9, rax
  313587:      	jmp	0x31358c <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, true>+0x57c>
  313589:      	xor	r9d, r9d
  31358c:      	mov	rax, r9
  31358f:      	add	rsp, 0x228
  313596:      	pop	rbx
  313597:      	pop	rbp
  313598:      	ret
  313599:      	lea	rdi, [rip - 0x2071fd]   # 0x10c3a3 <anon.8182237a801038de36885de64d2c176c.5.llvm.10465402473772549265>
  3135a0:      	lea	rcx, [rip + 0x4f1349]   # 0x8048f0 <anon.8182237a801038de36885de64d2c176c.1.llvm.10465402473772549265>
  3135a7:      	mov	esi, 0x237
  3135ac:      	xor	edx, edx
  3135ae:      	call	qword ptr [rip + 0x5647cc] # 0x877d80 <sdallocx+0x877d80>
  3135b4:      	int3
  3135b5:      	int3
  3135b6:      	int3
  3135b7:      	int3
  3135b8:      	int3
  3135b9:      	int3
  3135ba:      	int3
  3135bb:      	int3
  3135bc:      	int3
  3135bd:      	int3
  3135be:      	int3
  3135bf:      	int3
