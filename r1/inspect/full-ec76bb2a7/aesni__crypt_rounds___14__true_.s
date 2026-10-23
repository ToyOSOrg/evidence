
stage/probe-full-ec76bb2a7:	file format elf64-x86-64

Disassembly of section .text:

0000000000313340 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, true>>:
  313340:      	push	rbp
  313341:      	mov	rbp, rsp
  313344:      	sub	rsp, 0x240
  31334b:      	mov	rax, r9
  31334e:      	shr	rax, 0x7
  313352:      	je	0x313cff <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, true>+0x9bf>
  313358:      	movaps	xmm0, xmmword ptr [rsi + 0x280]
  31335f:      	movaps	xmmword ptr [rbp - 0x30], xmm0
  313363:      	movaps	xmm0, xmmword ptr [rsi + 0x290]
  31336a:      	movaps	xmmword ptr [rbp - 0xc0], xmm0
  313371:      	movaps	xmm0, xmmword ptr [rsi + 0x2a0]
  313378:      	movaps	xmmword ptr [rbp - 0xb0], xmm0
  31337f:      	movaps	xmm0, xmmword ptr [rsi + 0x2b0]
  313386:      	movaps	xmmword ptr [rbp - 0xa0], xmm0
  31338d:      	movaps	xmm0, xmmword ptr [rsi + 0x2c0]
  313394:      	movaps	xmmword ptr [rbp - 0x90], xmm0
  31339b:      	movaps	xmm0, xmmword ptr [rsi + 0x2d0]
  3133a2:      	movaps	xmmword ptr [rbp - 0x80], xmm0
  3133a6:      	movaps	xmm0, xmmword ptr [rsi + 0x2e0]
  3133ad:      	movaps	xmmword ptr [rbp - 0x70], xmm0
  3133b1:      	movaps	xmm0, xmmword ptr [rsi + 0x2f0]
  3133b8:      	movaps	xmmword ptr [rbp - 0x60], xmm0
  3133bc:      	movups	xmm0, xmmword ptr [rdi]
  3133bf:      	movaps	xmmword ptr [rbp - 0x10], xmm0
  3133c3:      	xorps	xmm0, xmm0
  3133c6:      	movaps	xmmword ptr [rbp - 0x20], xmm0
  3133ca:      	lea	rsi, [rbp - 0x20]
  3133ce:      	mov	r10, rdx
  3133d1:      	sub	r10, rsi
  3133d4:      	sub	rsi, rdx
  3133d7:      	cmovb	rsi, r10
  3133db:      	cmp	rsi, 0xb
  3133df:      	jbe	0x313d0e <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, true>+0x9ce>
  3133e5:      	movdqa	xmm0, xmmword ptr [rbp - 0x30]
  3133ea:      	pshufd	xmm1, xmm0, 0xee        # xmm1 = xmm0[2,3,2,3]
  3133ef:      	pxor	xmm1, xmm0
  3133f3:      	movdqa	xmmword ptr [rbp - 0x210], xmm1
  3133fb:      	movdqa	xmm0, xmmword ptr [rbp - 0xc0]
  313403:      	pshufd	xmm1, xmm0, 0xee        # xmm1 = xmm0[2,3,2,3]
  313408:      	pxor	xmm1, xmm0
  31340c:      	movdqa	xmmword ptr [rbp - 0x200], xmm1
  313414:      	movdqa	xmm0, xmmword ptr [rbp - 0xb0]
  31341c:      	pshufd	xmm1, xmm0, 0xee        # xmm1 = xmm0[2,3,2,3]
  313421:      	pxor	xmm1, xmm0
  313425:      	movdqa	xmmword ptr [rbp - 0x1f0], xmm1
  31342d:      	movdqa	xmm0, xmmword ptr [rbp - 0xa0]
  313435:      	pshufd	xmm1, xmm0, 0xee        # xmm1 = xmm0[2,3,2,3]
  31343a:      	pxor	xmm1, xmm0
  31343e:      	movdqa	xmmword ptr [rbp - 0x1e0], xmm1
  313446:      	movdqa	xmm0, xmmword ptr [rbp - 0x90]
  31344e:      	pshufd	xmm1, xmm0, 0xee        # xmm1 = xmm0[2,3,2,3]
  313453:      	pxor	xmm1, xmm0
  313457:      	movdqa	xmmword ptr [rbp - 0x1d0], xmm1
  31345f:      	movdqa	xmm0, xmmword ptr [rbp - 0x80]
  313464:      	pshufd	xmm1, xmm0, 0xee        # xmm1 = xmm0[2,3,2,3]
  313469:      	pxor	xmm1, xmm0
  31346d:      	movdqa	xmmword ptr [rbp - 0x1c0], xmm1
  313475:      	movdqa	xmm0, xmmword ptr [rbp - 0x70]
  31347a:      	pshufd	xmm1, xmm0, 0xee        # xmm1 = xmm0[2,3,2,3]
  31347f:      	pxor	xmm1, xmm0
  313483:      	movdqa	xmmword ptr [rbp - 0x1b0], xmm1
  31348b:      	movdqa	xmm0, xmmword ptr [rbp - 0x60]
  313490:      	pshufd	xmm2, xmm0, 0xee        # xmm2 = xmm0[2,3,2,3]
  313495:      	mov	esi, dword ptr [rdx + 0x8]
  313498:      	mov	dword ptr [rbp - 0x18], esi
  31349b:      	mov	rdx, qword ptr [rdx]
  31349e:      	mov	qword ptr [rbp - 0x20], rdx
  3134a2:      	movdqa	xmm1, xmmword ptr [rbp - 0x10]
  3134a7:      	pxor	xmm1, xmmword ptr [rbp - 0x20]
  3134ac:      	movdqa	xmmword ptr [rbp - 0x10], xmm1
  3134b1:      	pxor	xmm2, xmm0
  3134b5:      	movdqa	xmmword ptr [rbp - 0x1a0], xmm2
  3134bd:      	movdqu	xmm13, xmmword ptr [rcx]
  3134c2:      	pshufb	xmm13, xmmword ptr [rip - 0x26720c] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  3134cc:      	movups	xmm0, xmmword ptr [rdi + 0xe0]
  3134d3:      	movaps	xmmword ptr [rbp - 0x40], xmm0
  3134d7:      	movups	xmm0, xmmword ptr [rdi + 0x80]
  3134de:      	movaps	xmmword ptr [rbp - 0x190], xmm0
  3134e5:      	movups	xmm0, xmmword ptr [rdi + 0x90]
  3134ec:      	movaps	xmmword ptr [rbp - 0x180], xmm0
  3134f3:      	movups	xmm0, xmmword ptr [rdi + 0xa0]
  3134fa:      	movaps	xmmword ptr [rbp - 0x170], xmm0
  313501:      	movups	xmm0, xmmword ptr [rdi + 0xb0]
  313508:      	movaps	xmmword ptr [rbp - 0x160], xmm0
  31350f:      	movups	xmm0, xmmword ptr [rdi + 0xc0]
  313516:      	movaps	xmmword ptr [rbp - 0x150], xmm0
  31351d:      	movups	xmm0, xmmword ptr [rdi + 0xd0]
  313524:      	movaps	xmmword ptr [rbp - 0x140], xmm0
  31352b:      	shl	rax, 0x3
  31352f:      	add	r8, 0x70
  313533:      	xor	r10d, r10d
  313536:      	movabs	rdx, -0x3e00000000000000
  313540:      	xor	esi, esi
  313542:      	movups	xmm0, xmmword ptr [rdi + 0x10]
  313546:      	movaps	xmmword ptr [rbp - 0x130], xmm0
  31354d:      	movups	xmm0, xmmword ptr [rdi + 0x20]
  313551:      	movaps	xmmword ptr [rbp - 0x120], xmm0
  313558:      	movups	xmm0, xmmword ptr [rdi + 0x30]
  31355c:      	movaps	xmmword ptr [rbp - 0x110], xmm0
  313563:      	movups	xmm0, xmmword ptr [rdi + 0x40]
  313567:      	movaps	xmmword ptr [rbp - 0x100], xmm0
  31356e:      	movups	xmm0, xmmword ptr [rdi + 0x50]
  313572:      	movaps	xmmword ptr [rbp - 0xf0], xmm0
  313579:      	movups	xmm0, xmmword ptr [rdi + 0x60]
  31357d:      	movaps	xmmword ptr [rbp - 0xe0], xmm0
  313584:      	movdqu	xmm0, xmmword ptr [rdi + 0x70]
  313589:      	movdqa	xmmword ptr [rbp - 0xd0], xmm0
  313591:      	nop	word ptr cs:[rax + rax]
  3135a0:      	movdqu	xmm7, xmmword ptr [r8 - 0x70]
  3135a6:      	movdqu	xmm5, xmmword ptr [r8 - 0x60]
  3135ac:      	movdqu	xmm4, xmmword ptr [r8 - 0x50]
  3135b2:      	lea	edi, [r10 + 0x2]
  3135b6:      	bswap	edi
  3135b8:      	movd	xmm0, edi
  3135bc:      	lea	edi, [r10 + 0x3]
  3135c0:      	bswap	edi
  3135c2:      	movd	xmm1, edi
  3135c6:      	pslldq	xmm0, 0xc               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3]
  3135cb:      	pslldq	xmm1, 0xc               # xmm1 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm1[0,1,2,3]
  3135d0:      	lea	edi, [r10 + 0x4]
  3135d4:      	bswap	edi
  3135d6:      	movdqa	xmm6, xmmword ptr [rbp - 0x10]
  3135db:      	pxor	xmm0, xmm6
  3135df:      	movdqa	xmm2, xmm0
  3135e3:      	movd	xmm0, edi
  3135e7:      	pslldq	xmm0, 0xc               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3]
  3135ec:      	lea	edi, [r10 + 0x5]
  3135f0:      	pxor	xmm1, xmm6
  3135f4:      	bswap	edi
  3135f6:      	movd	xmm11, edi
  3135fb:      	pslldq	xmm11, 0xc              # xmm11 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm11[0,1,2,3]
  313601:      	pxor	xmm0, xmm6
  313605:      	lea	edi, [r10 + 0x6]
  313609:      	bswap	edi
  31360b:      	movd	xmm12, edi
  313610:      	pxor	xmm11, xmm6
  313615:      	pslldq	xmm12, 0xc              # xmm12 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm12[0,1,2,3]
  31361b:      	pxor	xmm12, xmm6
  313620:      	movdqa	xmm3, xmmword ptr [rbp - 0x130]
  313628:      	aesenc	xmm2, xmm3
  31362d:      	aesenc	xmm1, xmm3
  313632:      	aesenc	xmm0, xmm3
  313637:      	aesenc	xmm11, xmm3
  31363d:      	aesenc	xmm12, xmm3
  313643:      	movdqa	xmm3, xmmword ptr [rbp - 0x120]
  31364b:      	aesenc	xmm2, xmm3
  313650:      	aesenc	xmm1, xmm3
  313655:      	aesenc	xmm0, xmm3
  31365a:      	aesenc	xmm11, xmm3
  313660:      	aesenc	xmm12, xmm3
  313666:      	movdqa	xmm3, xmmword ptr [rbp - 0x110]
  31366e:      	aesenc	xmm2, xmm3
  313673:      	aesenc	xmm1, xmm3
  313678:      	aesenc	xmm0, xmm3
  31367d:      	aesenc	xmm11, xmm3
  313683:      	aesenc	xmm12, xmm3
  313689:      	movdqa	xmm3, xmmword ptr [rbp - 0x100]
  313691:      	aesenc	xmm2, xmm3
  313696:      	aesenc	xmm1, xmm3
  31369b:      	aesenc	xmm0, xmm3
  3136a0:      	aesenc	xmm11, xmm3
  3136a6:      	aesenc	xmm12, xmm3
  3136ac:      	movdqa	xmm3, xmmword ptr [rbp - 0xf0]
  3136b4:      	aesenc	xmm2, xmm3
  3136b9:      	aesenc	xmm1, xmm3
  3136be:      	aesenc	xmm0, xmm3
  3136c3:      	aesenc	xmm11, xmm3
  3136c9:      	aesenc	xmm12, xmm3
  3136cf:      	movdqa	xmm3, xmmword ptr [rbp - 0xe0]
  3136d7:      	aesenc	xmm2, xmm3
  3136dc:      	aesenc	xmm1, xmm3
  3136e1:      	aesenc	xmm0, xmm3
  3136e6:      	aesenc	xmm11, xmm3
  3136ec:      	aesenc	xmm12, xmm3
  3136f2:      	movdqa	xmm3, xmmword ptr [rbp - 0xd0]
  3136fa:      	aesenc	xmm2, xmm3
  3136ff:      	aesenc	xmm1, xmm3
  313704:      	aesenc	xmm0, xmm3
  313709:      	aesenc	xmm11, xmm3
  31370f:      	aesenc	xmm12, xmm3
  313715:      	movdqa	xmm3, xmmword ptr [rbp - 0x190]
  31371d:      	aesenc	xmm2, xmm3
  313722:      	aesenc	xmm1, xmm3
  313727:      	aesenc	xmm0, xmm3
  31372c:      	aesenc	xmm11, xmm3
  313732:      	aesenc	xmm12, xmm3
  313738:      	movdqa	xmm3, xmmword ptr [rbp - 0x180]
  313740:      	aesenc	xmm2, xmm3
  313745:      	aesenc	xmm1, xmm3
  31374a:      	aesenc	xmm0, xmm3
  31374f:      	aesenc	xmm11, xmm3
  313755:      	aesenc	xmm12, xmm3
  31375b:      	movdqa	xmm3, xmmword ptr [rbp - 0x170]
  313763:      	aesenc	xmm2, xmm3
  313768:      	aesenc	xmm1, xmm3
  31376d:      	aesenc	xmm0, xmm3
  313772:      	aesenc	xmm11, xmm3
  313778:      	aesenc	xmm12, xmm3
  31377e:      	movdqa	xmm3, xmmword ptr [rbp - 0x160]
  313786:      	aesenc	xmm2, xmm3
  31378b:      	aesenc	xmm1, xmm3
  313790:      	aesenc	xmm0, xmm3
  313795:      	aesenc	xmm11, xmm3
  31379b:      	aesenc	xmm12, xmm3
  3137a1:      	movdqa	xmm9, xmmword ptr [rbp - 0x150]
  3137aa:      	aesenc	xmm2, xmm9
  3137b0:      	aesenc	xmm1, xmm9
  3137b6:      	aesenc	xmm0, xmm9
  3137bc:      	aesenc	xmm11, xmm9
  3137c2:      	movdqa	xmm8, xmmword ptr [rbp - 0x140]
  3137cb:      	aesenc	xmm2, xmm8
  3137d1:      	aesenc	xmm1, xmm8
  3137d7:      	aesenc	xmm0, xmm8
  3137dd:      	aesenc	xmm11, xmm8
  3137e3:      	movdqu	xmm3, xmmword ptr [r8 - 0x40]
  3137e9:      	movdqa	xmm10, xmmword ptr [rbp - 0x40]
  3137ef:      	aesenclast	xmm2, xmm10
  3137f5:      	pxor	xmm2, xmm7
  3137f9:      	movdqa	xmmword ptr [rbp - 0x240], xmm2
  313801:      	aesenclast	xmm1, xmm10
  313807:      	pxor	xmm1, xmm5
  31380b:      	movdqa	xmmword ptr [rbp - 0x230], xmm1
  313813:      	movdqa	xmm2, xmm5
  313817:      	aesenclast	xmm0, xmm10
  31381d:      	pxor	xmm0, xmm4
  313821:      	movdqa	xmmword ptr [rbp - 0x220], xmm0
  313829:      	movdqa	xmm1, xmm4
  31382d:      	aesenclast	xmm11, xmm10
  313833:      	pxor	xmm11, xmm3
  313838:      	aesenc	xmm12, xmm9
  31383e:      	movdqa	xmm0, xmmword ptr [rip - 0x267586] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  313846:      	pshufb	xmm7, xmm0
  31384b:      	movdqu	xmm5, xmmword ptr [r8 - 0x30]
  313851:      	aesenc	xmm12, xmm8
  313857:      	pshufb	xmm2, xmm0
  31385c:      	aesenclast	xmm12, xmm10
  313862:      	pxor	xmm12, xmm5
  313867:      	pshufb	xmm1, xmm0
  31386c:      	lea	edi, [r10 + 0x7]
  313870:      	bswap	edi
  313872:      	pshufb	xmm3, xmm0
  313877:      	movd	xmm14, edi
  31387c:      	pslldq	xmm14, 0xc              # xmm14 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm14[0,1,2,3]
  313882:      	pxor	xmm14, xmm6
  313887:      	pshufb	xmm5, xmm0
  31388c:      	add	rsi, 0x8
  313890:      	mov	edi, esi
  313892:      	bswap	edi
  313894:      	pxor	xmm7, xmm13
  313899:      	movdqa	xmm4, xmm7
  31389d:      	movdqa	xmm6, xmm2
  3138a1:      	pshufd	xmm9, xmm2, 0xee        # xmm9 = xmm2[2,3,2,3]
  3138a7:      	pclmulqdq	xmm4, xmmword ptr [rbp - 0x30], 0x11
  3138ae:      	pxor	xmm9, xmm2
  3138b3:      	movdqa	xmm15, xmm2
  3138b8:      	movdqa	xmm0, xmmword ptr [rbp - 0xc0]
  3138c0:      	pclmulqdq	xmm6, xmm0, 0x11
  3138c6:      	pclmulqdq	xmm15, xmm0, 0x0
  3138cd:      	movdqa	xmm10, xmm1
  3138d2:      	pshufd	xmm13, xmm1, 0xee       # xmm13 = xmm1[2,3,2,3]
  3138d8:      	pxor	xmm13, xmm1
  3138dd:      	pclmulqdq	xmm9, xmmword ptr [rbp - 0x200], 0x0
  3138e8:      	movdqa	xmm0, xmmword ptr [rbp - 0xb0]
  3138f0:      	pclmulqdq	xmm1, xmm0, 0x0
  3138f6:      	pclmulqdq	xmm10, xmm0, 0x11
  3138fd:      	pxor	xmm1, xmm15
  313902:      	movdqa	xmmword ptr [rbp - 0x50], xmm1
  313907:      	pxor	xmm10, xmm6
  31390c:      	pclmulqdq	xmm13, xmmword ptr [rbp - 0x1f0], 0x0
  313917:      	movdqa	xmm0, xmm3
  31391b:      	pxor	xmm10, xmm4
  313920:      	pshufd	xmm6, xmm3, 0xee        # xmm6 = xmm3[2,3,2,3]
  313925:      	pxor	xmm6, xmm3
  313929:      	movdqa	xmm15, xmm3
  31392e:      	pxor	xmm13, xmm9
  313933:      	pshufd	xmm8, xmm5, 0xee        # xmm8 = xmm5[2,3,2,3]
  313939:      	pxor	xmm8, xmm5
  31393e:      	movdqa	xmm4, xmm5
  313942:      	movdqa	xmm9, xmmword ptr [rbp - 0xa0]
  31394b:      	pclmulqdq	xmm15, xmm9, 0x0
  313952:      	movdqa	xmm1, xmmword ptr [rbp - 0x90]
  31395a:      	pclmulqdq	xmm4, xmm1, 0x0
  313960:      	pxor	xmm4, xmm15
  313965:      	movd	xmm15, edi
  31396a:      	pslldq	xmm15, 0xc              # xmm15 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm15[0,1,2,3]
  313970:      	lea	edi, [r10 + 0x9]
  313974:      	bswap	edi
  313976:      	pclmulqdq	xmm0, xmm9, 0x11
  31397d:      	pclmulqdq	xmm5, xmm1, 0x11
  313983:      	pxor	xmm5, xmm0
  313987:      	movd	xmm9, edi
  31398c:      	movdqa	xmm0, xmmword ptr [rbp - 0x10]
  313991:      	pxor	xmm15, xmm0
  313996:      	pslldq	xmm9, 0xc               # xmm9 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm9[0,1,2,3]
  31399c:      	pxor	xmm9, xmm0
  3139a1:      	movdqa	xmm0, xmmword ptr [rbp - 0x130]
  3139a9:      	aesenc	xmm14, xmm0
  3139af:      	aesenc	xmm9, xmm0
  3139b5:      	aesenc	xmm15, xmm0
  3139bb:      	movdqa	xmm0, xmmword ptr [rbp - 0x120]
  3139c3:      	aesenc	xmm14, xmm0
  3139c9:      	aesenc	xmm15, xmm0
  3139cf:      	aesenc	xmm9, xmm0
  3139d5:      	movdqa	xmm0, xmmword ptr [rbp - 0x110]
  3139dd:      	aesenc	xmm14, xmm0
  3139e3:      	aesenc	xmm9, xmm0
  3139e9:      	aesenc	xmm15, xmm0
  3139ef:      	movdqa	xmm0, xmmword ptr [rbp - 0x100]
  3139f7:      	aesenc	xmm14, xmm0
  3139fd:      	aesenc	xmm15, xmm0
  313a03:      	aesenc	xmm9, xmm0
  313a09:      	movdqa	xmm0, xmmword ptr [rbp - 0xf0]
  313a11:      	aesenc	xmm14, xmm0
  313a17:      	aesenc	xmm9, xmm0
  313a1d:      	aesenc	xmm15, xmm0
  313a23:      	movdqa	xmm0, xmmword ptr [rbp - 0xe0]
  313a2b:      	aesenc	xmm14, xmm0
  313a31:      	aesenc	xmm15, xmm0
  313a37:      	aesenc	xmm9, xmm0
  313a3d:      	movdqa	xmm0, xmmword ptr [rbp - 0xd0]
  313a45:      	aesenc	xmm14, xmm0
  313a4b:      	aesenc	xmm9, xmm0
  313a51:      	aesenc	xmm15, xmm0
  313a57:      	movdqa	xmm0, xmmword ptr [rbp - 0x190]
  313a5f:      	aesenc	xmm14, xmm0
  313a65:      	aesenc	xmm15, xmm0
  313a6b:      	aesenc	xmm9, xmm0
  313a71:      	movdqa	xmm0, xmmword ptr [rbp - 0x180]
  313a79:      	aesenc	xmm14, xmm0
  313a7f:      	aesenc	xmm9, xmm0
  313a85:      	aesenc	xmm15, xmm0
  313a8b:      	movdqa	xmm0, xmmword ptr [rbp - 0x170]
  313a93:      	aesenc	xmm14, xmm0
  313a99:      	aesenc	xmm15, xmm0
  313a9f:      	pclmulqdq	xmm6, xmmword ptr [rbp - 0x1e0], 0x0
  313aa9:      	aesenc	xmm9, xmm0
  313aaf:      	pclmulqdq	xmm8, xmmword ptr [rbp - 0x1d0], 0x0
  313aba:      	pxor	xmm8, xmm6
  313abf:      	movdqa	xmm1, xmmword ptr [rbp - 0x160]
  313ac7:      	aesenc	xmm14, xmm1
  313acd:      	pshufd	xmm0, xmm7, 0xee        # xmm0 = xmm7[2,3,2,3]
  313ad2:      	pxor	xmm0, xmm7
  313ad6:      	movdqa	xmm2, xmmword ptr [rbp - 0x150]
  313ade:      	aesenc	xmm14, xmm2
  313ae4:      	pclmulqdq	xmm7, xmmword ptr [rbp - 0x30], 0x0
  313aeb:      	movdqa	xmm3, xmmword ptr [rbp - 0x140]
  313af3:      	aesenc	xmm14, xmm3
  313af9:      	movdqa	xmm6, xmmword ptr [rbp - 0x50]
  313afe:      	pxor	xmm6, xmm7
  313b02:      	movdqa	xmmword ptr [rbp - 0x50], xmm6
  313b07:      	movdqu	xmm6, xmmword ptr [r8 - 0x20]
  313b0d:      	aesenclast	xmm14, xmmword ptr [rbp - 0x40]
  313b14:      	pxor	xmm14, xmm6
  313b19:      	aesenc	xmm15, xmm1
  313b1f:      	pshufb	xmm6, xmmword ptr [rip - 0x267868] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  313b28:      	pclmulqdq	xmm0, xmmword ptr [rbp - 0x210], 0x0
  313b32:      	aesenc	xmm9, xmm1
  313b38:      	pxor	xmm13, xmm0
  313b3d:      	movdqa	xmm0, xmm6
  313b41:      	aesenc	xmm15, xmm2
  313b47:      	movdqa	xmm1, xmmword ptr [rbp - 0x80]
  313b4c:      	pclmulqdq	xmm0, xmm1, 0x11
  313b52:      	pxor	xmm0, xmm5
  313b56:      	aesenc	xmm9, xmm2
  313b5c:      	pshufd	xmm5, xmm6, 0xee        # xmm5 = xmm6[2,3,2,3]
  313b61:      	pxor	xmm5, xmm6
  313b65:      	aesenc	xmm15, xmm3
  313b6b:      	pclmulqdq	xmm6, xmm1, 0x0
  313b71:      	aesenc	xmm9, xmm3
  313b77:      	pxor	xmm6, xmm4
  313b7b:      	movdqu	xmm4, xmmword ptr [r8 - 0x10]
  313b81:      	movdqa	xmm1, xmmword ptr [rbp - 0x40]
  313b86:      	aesenclast	xmm15, xmm1
  313b8c:      	pxor	xmm15, xmm4
  313b91:      	aesenclast	xmm9, xmm1
  313b97:      	pxor	xmm0, xmm10
  313b9c:      	movdqu	xmm7, xmmword ptr [r8]
  313ba1:      	pxor	xmm9, xmm7
  313ba6:      	movdqa	xmm1, xmmword ptr [rip - 0x2678ee] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  313bae:      	pshufb	xmm4, xmm1
  313bb3:      	pshufb	xmm7, xmm1
  313bb8:      	pclmulqdq	xmm5, xmmword ptr [rbp - 0x1c0], 0x0
  313bc2:      	pxor	xmm5, xmm8
  313bc7:      	pxor	xmm6, xmmword ptr [rbp - 0x50]
  313bcc:      	movdqa	xmm1, xmm4
  313bd0:      	movdqa	xmm2, xmm7
  313bd4:      	movdqa	xmm10, xmmword ptr [rbp - 0x60]
  313bda:      	pclmulqdq	xmm2, xmm10, 0x0
  313be1:      	movdqa	xmm8, xmmword ptr [rbp - 0x70]
  313be7:      	pclmulqdq	xmm1, xmm8, 0x0
  313bee:      	pxor	xmm2, xmm1
  313bf2:      	pshufd	xmm3, xmm4, 0xee        # xmm3 = xmm4[2,3,2,3]
  313bf7:      	pxor	xmm3, xmm4
  313bfb:      	pxor	xmm2, xmm6
  313bff:      	pshufd	xmm6, xmm7, 0xee        # xmm6 = xmm7[2,3,2,3]
  313c04:      	pxor	xmm6, xmm7
  313c08:      	movdqa	xmm1, xmm7
  313c0c:      	pclmulqdq	xmm4, xmm8, 0x11
  313c13:      	pclmulqdq	xmm1, xmm10, 0x11
  313c1a:      	pxor	xmm1, xmm4
  313c1e:      	pclmulqdq	xmm3, xmmword ptr [rbp - 0x1b0], 0x0
  313c28:      	pclmulqdq	xmm6, xmmword ptr [rbp - 0x1a0], 0x0
  313c32:      	pxor	xmm6, xmm3
  313c36:      	movaps	xmm3, xmmword ptr [rbp - 0x240]
  313c3d:      	movups	xmmword ptr [r8 - 0x70], xmm3
  313c42:      	pxor	xmm5, xmm13
  313c47:      	movaps	xmm3, xmmword ptr [rbp - 0x230]
  313c4e:      	movups	xmmword ptr [r8 - 0x60], xmm3
  313c53:      	movaps	xmm3, xmmword ptr [rbp - 0x220]
  313c5a:      	movups	xmmword ptr [r8 - 0x50], xmm3
  313c5f:      	movdqu	xmmword ptr [r8 - 0x40], xmm11
  313c65:      	pxor	xmm1, xmm0
  313c69:      	movdqu	xmmword ptr [r8 - 0x30], xmm12
  313c6f:      	movdqu	xmmword ptr [r8 - 0x20], xmm14
  313c75:      	movdqu	xmmword ptr [r8 - 0x10], xmm15
  313c7b:      	pxor	xmm6, xmm5
  313c7f:      	movdqa	xmm0, xmm2
  313c83:      	pxor	xmm0, xmm1
  313c87:      	pxor	xmm0, xmm6
  313c8b:      	movdqu	xmmword ptr [r8], xmm9
  313c90:      	movdqa	xmm3, xmm0
  313c94:      	pslldq	xmm3, 0x8               # xmm3 = zero,zero,zero,zero,zero,zero,zero,zero,xmm3[0,1,2,3,4,5,6,7]
  313c99:      	pxor	xmm3, xmm2
  313c9d:      	pshufd	xmm2, xmm3, 0x4e        # xmm2 = xmm3[2,3,0,1]
  313ca2:      	movq	xmm4, rdx
  313ca7:      	pclmulqdq	xmm3, xmm4, 0x0
  313cad:      	pxor	xmm3, xmm2
  313cb1:      	psrldq	xmm0, 0x8               # xmm0 = xmm0[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero
  313cb6:      	pshufd	xmm13, xmm3, 0x4e       # xmm13 = xmm3[2,3,0,1]
  313cbc:      	pxor	xmm13, xmm0
  313cc1:      	pclmulqdq	xmm3, xmm4, 0x0
  313cc7:      	pxor	xmm13, xmm1
  313ccc:      	pxor	xmm13, xmm3
  313cd1:      	sub	r8, -0x80
  313cd5:      	mov	r10, rsi
  313cd8:      	cmp	rax, rsi
  313cdb:      	jne	0x3135a0 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, true>+0x260>
  313ce1:      	pshufb	xmm13, xmmword ptr [rip - 0x267a2b] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  313ceb:      	movdqu	xmmword ptr [rcx], xmm13
  313cf0:      	movabs	rax, 0x7fffffffffffff80
  313cfa:      	and	r9, rax
  313cfd:      	jmp	0x313d02 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, true>+0x9c2>
  313cff:      	xor	r9d, r9d
  313d02:      	mov	rax, r9
  313d05:      	add	rsp, 0x240
  313d0c:      	pop	rbp
  313d0d:      	ret
  313d0e:      	lea	rdi, [rip - 0x207972]   # 0x10c3a3 <anon.8182237a801038de36885de64d2c176c.5.llvm.10465402473772549265>
  313d15:      	lea	rcx, [rip + 0x4f1354]   # 0x805070 <anon.8182237a801038de36885de64d2c176c.1.llvm.10465402473772549265>
  313d1c:      	mov	esi, 0x237
  313d21:      	xor	edx, edx
  313d23:      	call	qword ptr [rip + 0x564817] # 0x878540 <sdallocx+0x878540>
  313d29:      	int3
  313d2a:      	int3
  313d2b:      	int3
  313d2c:      	int3
  313d2d:      	int3
  313d2e:      	int3
  313d2f:      	int3
