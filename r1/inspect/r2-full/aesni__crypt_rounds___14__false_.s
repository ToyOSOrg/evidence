
stage/probe-full-7dcf12a5a:	file format elf64-x86-64

Disassembly of section .text:

00000000003123d0 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, false>>:
  3123d0:      	push	rbp
  3123d1:      	mov	rbp, rsp
  3123d4:      	push	rbx
  3123d5:      	sub	rsp, 0x228
  3123dc:      	mov	rax, r9
  3123df:      	shr	rax, 0x7
  3123e3:      	je	0x312c52 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, false>+0x882>
  3123e9:      	movaps	xmm0, xmmword ptr [rsi + 0x280]
  3123f0:      	movaps	xmm1, xmmword ptr [rsi + 0x290]
  3123f7:      	movaps	xmm2, xmmword ptr [rsi + 0x2a0]
  3123fe:      	movaps	xmm3, xmmword ptr [rsi + 0x2b0]
  312405:      	movaps	xmmword ptr [rbp - 0x1b0], xmm0
  31240c:      	movaps	xmmword ptr [rbp - 0x1a0], xmm1
  312413:      	movaps	xmmword ptr [rbp - 0x190], xmm2
  31241a:      	movaps	xmmword ptr [rbp - 0x180], xmm3
  312421:      	movaps	xmm0, xmmword ptr [rsi + 0x2c0]
  312428:      	movaps	xmmword ptr [rbp - 0x170], xmm0
  31242f:      	movaps	xmm0, xmmword ptr [rsi + 0x2d0]
  312436:      	movaps	xmmword ptr [rbp - 0x160], xmm0
  31243d:      	movaps	xmm0, xmmword ptr [rsi + 0x2e0]
  312444:      	movaps	xmmword ptr [rbp - 0x150], xmm0
  31244b:      	movaps	xmm0, xmmword ptr [rsi + 0x2f0]
  312452:      	movaps	xmmword ptr [rbp - 0x140], xmm0
  312459:      	movdqa	xmm8, xmmword ptr [rsi + 0x280]
  312462:      	pshufd	xmm0, xmm8, 0x4e        # xmm0 = xmm8[2,3,0,1]
  312468:      	pxor	xmm0, xmm8
  31246d:      	movdqa	xmmword ptr [rbp - 0xb0], xmm0
  312475:      	movdqa	xmmword ptr [rbp - 0x230], xmm0
  31247d:      	movdqa	xmm7, xmmword ptr [rsi + 0x290]
  312485:      	pshufd	xmm0, xmm7, 0x4e        # xmm0 = xmm7[2,3,0,1]
  31248a:      	pxor	xmm0, xmm7
  31248e:      	movdqa	xmmword ptr [rbp - 0x220], xmm0
  312496:      	movdqa	xmm6, xmmword ptr [rsi + 0x2a0]
  31249e:      	pshufd	xmm0, xmm6, 0x4e        # xmm0 = xmm6[2,3,0,1]
  3124a3:      	pxor	xmm0, xmm6
  3124a7:      	movdqa	xmmword ptr [rbp - 0x210], xmm0
  3124af:      	movdqa	xmm5, xmmword ptr [rsi + 0x2b0]
  3124b7:      	pshufd	xmm0, xmm5, 0x4e        # xmm0 = xmm5[2,3,0,1]
  3124bc:      	pxor	xmm0, xmm5
  3124c0:      	movdqa	xmmword ptr [rbp - 0x200], xmm0
  3124c8:      	movdqa	xmm4, xmmword ptr [rsi + 0x2c0]
  3124d0:      	pshufd	xmm0, xmm4, 0x4e        # xmm0 = xmm4[2,3,0,1]
  3124d5:      	pxor	xmm0, xmm4
  3124d9:      	movdqa	xmmword ptr [rbp - 0x1f0], xmm0
  3124e1:      	movdqa	xmm3, xmmword ptr [rsi + 0x2d0]
  3124e9:      	pshufd	xmm0, xmm3, 0x4e        # xmm0 = xmm3[2,3,0,1]
  3124ee:      	pxor	xmm0, xmm3
  3124f2:      	movdqa	xmmword ptr [rbp - 0x1e0], xmm0
  3124fa:      	movdqa	xmm2, xmmword ptr [rsi + 0x2e0]
  312502:      	pshufd	xmm0, xmm2, 0x4e        # xmm0 = xmm2[2,3,0,1]
  312507:      	pxor	xmm0, xmm2
  31250b:      	movdqa	xmmword ptr [rbp - 0x1d0], xmm0
  312513:      	movdqa	xmm1, xmmword ptr [rsi + 0x2f0]
  31251b:      	pshufd	xmm0, xmm1, 0x4e        # xmm0 = xmm1[2,3,0,1]
  312520:      	pxor	xmm0, xmm1
  312524:      	movdqa	xmmword ptr [rbp - 0x1c0], xmm0
  31252c:      	movdqu	xmm9, xmmword ptr [rdi]
  312531:      	pxor	xmm0, xmm0
  312535:      	movdqa	xmmword ptr [rbp - 0x130], xmm0
  31253d:      	lea	rsi, [rbp - 0x130]
  312544:      	mov	r10, rdx
  312547:      	sub	r10, rsi
  31254a:      	sub	rsi, rdx
  31254d:      	cmovb	rsi, r10
  312551:      	cmp	rsi, 0xb
  312555:      	jbe	0x312fe9 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, false>+0xc19>
  31255b:      	movdqa	xmmword ptr [rbp - 0x20], xmm8
  312561:      	movdqa	xmmword ptr [rbp - 0x30], xmm7
  312566:      	movdqa	xmmword ptr [rbp - 0x40], xmm6
  31256b:      	movdqa	xmmword ptr [rbp - 0x50], xmm5
  312570:      	movdqa	xmmword ptr [rbp - 0x60], xmm4
  312575:      	movdqa	xmmword ptr [rbp - 0x70], xmm3
  31257a:      	movdqa	xmmword ptr [rbp - 0x80], xmm2
  31257f:      	movdqa	xmmword ptr [rbp - 0x90], xmm1
  312587:      	mov	esi, dword ptr [rdx + 0x8]
  31258a:      	mov	dword ptr [rbp - 0x128], esi
  312590:      	mov	rdx, qword ptr [rdx]
  312593:      	mov	qword ptr [rbp - 0x130], rdx
  31259a:      	pxor	xmm9, xmmword ptr [rbp - 0x130]
  3125a3:      	movdqa	xmm1, xmmword ptr [rip - 0x26659b] # 0xac010 <anon.e81663b63ab83dbb5a37e8fa4238500b.6.llvm.14128926338108641276+0xc0>
  3125ab:      	pxor	xmm1, xmm9
  3125b0:      	movdqa	xmm2, xmmword ptr [rip - 0x266f88] # 0xab630 <anon.0b2aa08f77b92a096c4b4e8601736de0.2.llvm.10746933672069200717+0x90>
  3125b8:      	pxor	xmm2, xmm9
  3125bd:      	movdqa	xmm0, xmmword ptr [rip - 0x266f85] # 0xab640 <anon.0b2aa08f77b92a096c4b4e8601736de0.2.llvm.10746933672069200717+0xa0>
  3125c5:      	pxor	xmm0, xmm9
  3125ca:      	movdqa	xmm15, xmmword ptr [rip - 0x267423] # 0xab1b0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.13.llvm.14024894901458550281+0xd0>
  3125d3:      	pxor	xmm15, xmm9
  3125d8:      	movdqa	xmm14, xmmword ptr [rip - 0x266d31] # 0xab8b0 <anon.0b2aa08f77b92a096c4b4e8601736de0.2.llvm.10746933672069200717+0x310>
  3125e1:      	pxor	xmm14, xmm9
  3125e6:      	movdqa	xmm13, xmmword ptr [rip - 0x2671ef] # 0xab400 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.13.llvm.14024894901458550281+0x320>
  3125ef:      	pxor	xmm13, xmm9
  3125f4:      	movdqa	xmm12, xmmword ptr [rip - 0x26716d] # 0xab490 <anon.e81663b63ab83dbb5a37e8fa4238500b.8.llvm.14128926338108641276+0x10>
  3125fd:      	pxor	xmm12, xmm9
  312602:      	movdqa	xmm11, xmmword ptr [rip - 0x26669b] # 0xabf70 <anon.e81663b63ab83dbb5a37e8fa4238500b.6.llvm.14128926338108641276+0x20>
  31260b:      	pxor	xmm11, xmm9
  312610:      	movdqu	xmm6, xmmword ptr [rdi + 0x10]
  312615:      	movdqu	xmm5, xmmword ptr [rdi + 0x20]
  31261a:      	movdqu	xmm4, xmmword ptr [rdi + 0x30]
  31261f:      	movdqu	xmm3, xmmword ptr [rdi + 0x40]
  312624:      	aesenc	xmm1, xmm6
  312629:      	aesenc	xmm2, xmm6
  31262e:      	aesenc	xmm0, xmm6
  312633:      	aesenc	xmm15, xmm6
  312639:      	aesenc	xmm14, xmm6
  31263f:      	aesenc	xmm13, xmm6
  312645:      	aesenc	xmm12, xmm6
  31264b:      	aesenc	xmm11, xmm6
  312651:      	aesenc	xmm1, xmm5
  312656:      	aesenc	xmm2, xmm5
  31265b:      	aesenc	xmm0, xmm5
  312660:      	aesenc	xmm15, xmm5
  312666:      	aesenc	xmm14, xmm5
  31266c:      	aesenc	xmm13, xmm5
  312672:      	aesenc	xmm12, xmm5
  312678:      	aesenc	xmm11, xmm5
  31267e:      	aesenc	xmm1, xmm4
  312683:      	aesenc	xmm2, xmm4
  312688:      	aesenc	xmm0, xmm4
  31268d:      	aesenc	xmm15, xmm4
  312693:      	aesenc	xmm14, xmm4
  312699:      	aesenc	xmm13, xmm4
  31269f:      	aesenc	xmm12, xmm4
  3126a5:      	aesenc	xmm11, xmm4
  3126ab:      	aesenc	xmm1, xmm3
  3126b0:      	aesenc	xmm2, xmm3
  3126b5:      	aesenc	xmm0, xmm3
  3126ba:      	aesenc	xmm15, xmm3
  3126c0:      	aesenc	xmm14, xmm3
  3126c6:      	aesenc	xmm13, xmm3
  3126cc:      	aesenc	xmm12, xmm3
  3126d2:      	aesenc	xmm11, xmm3
  3126d8:      	movdqu	xmm3, xmmword ptr [rdi + 0x50]
  3126dd:      	aesenc	xmm1, xmm3
  3126e2:      	aesenc	xmm2, xmm3
  3126e7:      	aesenc	xmm0, xmm3
  3126ec:      	aesenc	xmm15, xmm3
  3126f2:      	aesenc	xmm14, xmm3
  3126f8:      	aesenc	xmm13, xmm3
  3126fe:      	aesenc	xmm12, xmm3
  312704:      	aesenc	xmm11, xmm3
  31270a:      	movdqu	xmm3, xmmword ptr [rdi + 0x60]
  31270f:      	aesenc	xmm1, xmm3
  312714:      	aesenc	xmm2, xmm3
  312719:      	aesenc	xmm0, xmm3
  31271e:      	aesenc	xmm15, xmm3
  312724:      	aesenc	xmm14, xmm3
  31272a:      	aesenc	xmm13, xmm3
  312730:      	aesenc	xmm12, xmm3
  312736:      	aesenc	xmm11, xmm3
  31273c:      	movdqu	xmm3, xmmword ptr [rdi + 0x70]
  312741:      	aesenc	xmm1, xmm3
  312746:      	aesenc	xmm2, xmm3
  31274b:      	aesenc	xmm0, xmm3
  312750:      	aesenc	xmm15, xmm3
  312756:      	aesenc	xmm14, xmm3
  31275c:      	aesenc	xmm13, xmm3
  312762:      	aesenc	xmm12, xmm3
  312768:      	aesenc	xmm11, xmm3
  31276e:      	movdqu	xmm3, xmmword ptr [rdi + 0x80]
  312776:      	aesenc	xmm1, xmm3
  31277b:      	aesenc	xmm2, xmm3
  312780:      	aesenc	xmm0, xmm3
  312785:      	aesenc	xmm15, xmm3
  31278b:      	aesenc	xmm14, xmm3
  312791:      	aesenc	xmm13, xmm3
  312797:      	aesenc	xmm12, xmm3
  31279d:      	aesenc	xmm11, xmm3
  3127a3:      	movdqu	xmm3, xmmword ptr [rdi + 0x90]
  3127ab:      	aesenc	xmm1, xmm3
  3127b0:      	aesenc	xmm2, xmm3
  3127b5:      	aesenc	xmm0, xmm3
  3127ba:      	aesenc	xmm15, xmm3
  3127c0:      	aesenc	xmm14, xmm3
  3127c6:      	aesenc	xmm13, xmm3
  3127cc:      	aesenc	xmm12, xmm3
  3127d2:      	aesenc	xmm11, xmm3
  3127d8:      	movdqu	xmm3, xmmword ptr [rdi + 0xa0]
  3127e0:      	aesenc	xmm1, xmm3
  3127e5:      	aesenc	xmm2, xmm3
  3127ea:      	aesenc	xmm0, xmm3
  3127ef:      	aesenc	xmm15, xmm3
  3127f5:      	aesenc	xmm14, xmm3
  3127fb:      	aesenc	xmm13, xmm3
  312801:      	aesenc	xmm12, xmm3
  312807:      	aesenc	xmm11, xmm3
  31280d:      	movdqu	xmm3, xmmword ptr [rdi + 0xb0]
  312815:      	aesenc	xmm1, xmm3
  31281a:      	aesenc	xmm2, xmm3
  31281f:      	aesenc	xmm0, xmm3
  312824:      	aesenc	xmm15, xmm3
  31282a:      	aesenc	xmm14, xmm3
  312830:      	aesenc	xmm13, xmm3
  312836:      	aesenc	xmm12, xmm3
  31283c:      	aesenc	xmm11, xmm3
  312842:      	movdqu	xmm3, xmmword ptr [rdi + 0xc0]
  31284a:      	aesenc	xmm1, xmm3
  31284f:      	aesenc	xmm2, xmm3
  312854:      	aesenc	xmm0, xmm3
  312859:      	aesenc	xmm15, xmm3
  31285f:      	aesenc	xmm14, xmm3
  312865:      	aesenc	xmm13, xmm3
  31286b:      	aesenc	xmm12, xmm3
  312871:      	aesenc	xmm11, xmm3
  312877:      	movdqu	xmm3, xmmword ptr [rdi + 0xd0]
  31287f:      	aesenc	xmm1, xmm3
  312884:      	aesenc	xmm2, xmm3
  312889:      	aesenc	xmm0, xmm3
  31288e:      	aesenc	xmm15, xmm3
  312894:      	aesenc	xmm14, xmm3
  31289a:      	aesenc	xmm13, xmm3
  3128a0:      	aesenc	xmm12, xmm3
  3128a6:      	movdqu	xmm4, xmmword ptr [rcx]
  3128aa:      	aesenc	xmm11, xmm3
  3128b0:      	movdqu	xmm10, xmmword ptr [rdi + 0xe0]
  3128b9:      	aesenclast	xmm1, xmm10
  3128bf:      	aesenclast	xmm2, xmm10
  3128c5:      	aesenclast	xmm0, xmm10
  3128cb:      	aesenclast	xmm15, xmm10
  3128d1:      	aesenclast	xmm14, xmm10
  3128d7:      	aesenclast	xmm13, xmm10
  3128dd:      	aesenclast	xmm12, xmm10
  3128e3:      	aesenclast	xmm11, xmm10
  3128e9:      	movdqu	xmm3, xmmword ptr [r8]
  3128ee:      	pxor	xmm3, xmm1
  3128f2:      	movdqu	xmm1, xmmword ptr [r8 + 0x10]
  3128f8:      	pxor	xmm1, xmm2
  3128fc:      	movdqu	xmmword ptr [r8], xmm3
  312901:      	movdqu	xmmword ptr [r8 + 0x10], xmm1
  312907:      	movdqu	xmm1, xmmword ptr [r8 + 0x20]
  31290d:      	pxor	xmm1, xmm0
  312911:      	movdqu	xmmword ptr [r8 + 0x20], xmm1
  312917:      	movdqu	xmm0, xmmword ptr [r8 + 0x30]
  31291d:      	pxor	xmm0, xmm15
  312922:      	movdqu	xmmword ptr [r8 + 0x30], xmm0
  312928:      	movdqu	xmm0, xmmword ptr [r8 + 0x40]
  31292e:      	pxor	xmm0, xmm14
  312933:      	movdqu	xmmword ptr [r8 + 0x40], xmm0
  312939:      	movdqu	xmm0, xmmword ptr [r8 + 0x50]
  31293f:      	pxor	xmm0, xmm13
  312944:      	movdqu	xmmword ptr [r8 + 0x50], xmm0
  31294a:      	movdqu	xmm0, xmmword ptr [r8 + 0x60]
  312950:      	pxor	xmm0, xmm12
  312955:      	movdqu	xmmword ptr [r8 + 0x60], xmm0
  31295b:      	movdqu	xmm0, xmmword ptr [r8 + 0x70]
  312961:      	pxor	xmm0, xmm11
  312966:      	movdqu	xmmword ptr [r8 + 0x70], xmm0
  31296c:      	pshufb	xmm4, xmmword ptr [rip - 0x2666b5] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  312975:      	movabs	rdx, -0x3e00000000000000
  31297f:      	cmp	rax, 0x1
  312983:      	jne	0x312c62 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, false>+0x892>
  312989:      	shl	rax, 0x7
  31298d:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x80]
  312994:      	movdqu	xmm5, xmmword ptr [r8 + rax - 0x70]
  31299b:      	movdqa	xmm0, xmmword ptr [rip - 0x2666e3] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  3129a3:      	pshufb	xmm3, xmm0
  3129a8:      	pxor	xmm3, xmm4
  3129ac:      	movdqa	xmm2, xmm3
  3129b0:      	pshufd	xmm4, xmm3, 0xee        # xmm4 = xmm3[2,3,2,3]
  3129b5:      	pxor	xmm4, xmm3
  3129b9:      	movdqa	xmm6, xmmword ptr [rbp - 0x20]
  3129be:      	pclmulqdq	xmm3, xmm6, 0x0
  3129c4:      	pclmulqdq	xmm2, xmm6, 0x11
  3129ca:      	pshufd	xmm1, xmm6, 0xee        # xmm1 = xmm6[2,3,2,3]
  3129cf:      	pxor	xmm1, xmm6
  3129d3:      	pclmulqdq	xmm1, xmm4, 0x0
  3129d9:      	pshufb	xmm5, xmm0
  3129de:      	movdqa	xmm4, xmm5
  3129e2:      	pshufd	xmm6, xmm5, 0xee        # xmm6 = xmm5[2,3,2,3]
  3129e7:      	pxor	xmm6, xmm5
  3129eb:      	movdqa	xmm8, xmmword ptr [rbp - 0x30]
  3129f1:      	pclmulqdq	xmm5, xmm8, 0x0
  3129f8:      	pclmulqdq	xmm4, xmm8, 0x11
  3129ff:      	pshufd	xmm7, xmm8, 0xee        # xmm7 = xmm8[2,3,2,3]
  312a05:      	pxor	xmm7, xmm8
  312a0a:      	movdqu	xmm8, xmmword ptr [r8 + rax - 0x60]
  312a11:      	pclmulqdq	xmm7, xmm6, 0x0
  312a17:      	pshufb	xmm8, xmm0
  312a1d:      	movdqa	xmm6, xmm8
  312a22:      	movdqa	xmm9, xmmword ptr [rbp - 0x40]
  312a28:      	pclmulqdq	xmm6, xmm9, 0x0
  312a2f:      	pxor	xmm6, xmm5
  312a33:      	pshufd	xmm5, xmm8, 0xee        # xmm5 = xmm8[2,3,2,3]
  312a39:      	pxor	xmm5, xmm8
  312a3e:      	pclmulqdq	xmm8, xmm9, 0x11
  312a45:      	pxor	xmm8, xmm4
  312a4a:      	pshufd	xmm4, xmm9, 0xee        # xmm4 = xmm9[2,3,2,3]
  312a50:      	pxor	xmm4, xmm9
  312a55:      	pclmulqdq	xmm4, xmm5, 0x0
  312a5b:      	movdqu	xmm5, xmmword ptr [r8 + rax - 0x50]
  312a62:      	pxor	xmm4, xmm7
  312a66:      	pshufb	xmm5, xmm0
  312a6b:      	movdqa	xmm7, xmm5
  312a6f:      	movdqa	xmm9, xmmword ptr [rbp - 0x50]
  312a75:      	pclmulqdq	xmm7, xmm9, 0x0
  312a7c:      	pxor	xmm7, xmm6
  312a80:      	pshufd	xmm6, xmm5, 0xee        # xmm6 = xmm5[2,3,2,3]
  312a85:      	pxor	xmm6, xmm5
  312a89:      	pclmulqdq	xmm5, xmm9, 0x11
  312a90:      	pxor	xmm5, xmm8
  312a95:      	pshufd	xmm8, xmm9, 0xee        # xmm8 = xmm9[2,3,2,3]
  312a9b:      	pxor	xmm8, xmm9
  312aa0:      	pclmulqdq	xmm8, xmm6, 0x0
  312aa7:      	pxor	xmm8, xmm4
  312aac:      	movdqu	xmm4, xmmword ptr [r8 + rax - 0x40]
  312ab3:      	pshufb	xmm4, xmm0
  312ab8:      	movdqa	xmm6, xmm4
  312abc:      	movdqa	xmm9, xmmword ptr [rbp - 0x60]
  312ac2:      	pclmulqdq	xmm6, xmm9, 0x0
  312ac9:      	pxor	xmm6, xmm7
  312acd:      	pshufd	xmm7, xmm4, 0xee        # xmm7 = xmm4[2,3,2,3]
  312ad2:      	pxor	xmm7, xmm4
  312ad6:      	pclmulqdq	xmm4, xmm9, 0x11
  312add:      	pxor	xmm4, xmm5
  312ae1:      	pshufd	xmm5, xmm9, 0xee        # xmm5 = xmm9[2,3,2,3]
  312ae7:      	pxor	xmm5, xmm9
  312aec:      	pclmulqdq	xmm5, xmm7, 0x0
  312af2:      	pxor	xmm5, xmm8
  312af7:      	movdqu	xmm7, xmmword ptr [r8 + rax - 0x30]
  312afe:      	pshufb	xmm7, xmm0
  312b03:      	movdqa	xmm8, xmm7
  312b08:      	movdqa	xmm10, xmmword ptr [rbp - 0x70]
  312b0e:      	pclmulqdq	xmm8, xmm10, 0x0
  312b15:      	pxor	xmm8, xmm6
  312b1a:      	pshufd	xmm6, xmm7, 0xee        # xmm6 = xmm7[2,3,2,3]
  312b1f:      	pxor	xmm6, xmm7
  312b23:      	pclmulqdq	xmm7, xmm10, 0x11
  312b2a:      	pxor	xmm7, xmm4
  312b2e:      	pshufd	xmm9, xmm10, 0xee       # xmm9 = xmm10[2,3,2,3]
  312b34:      	pxor	xmm9, xmm10
  312b39:      	pclmulqdq	xmm9, xmm6, 0x0
  312b40:      	pxor	xmm9, xmm5
  312b45:      	movdqu	xmm4, xmmword ptr [r8 + rax - 0x20]
  312b4c:      	pshufb	xmm4, xmm0
  312b51:      	movdqa	xmm6, xmm4
  312b55:      	movdqa	xmm10, xmmword ptr [rbp - 0x80]
  312b5b:      	pclmulqdq	xmm6, xmm10, 0x0
  312b62:      	pxor	xmm6, xmm8
  312b67:      	pshufd	xmm5, xmm4, 0xee        # xmm5 = xmm4[2,3,2,3]
  312b6c:      	pxor	xmm5, xmm4
  312b70:      	movdqa	xmm8, xmm4
  312b75:      	pclmulqdq	xmm8, xmm10, 0x11
  312b7c:      	pxor	xmm8, xmm7
  312b81:      	pshufd	xmm4, xmm10, 0xee       # xmm4 = xmm10[2,3,2,3]
  312b87:      	pxor	xmm4, xmm10
  312b8c:      	pclmulqdq	xmm4, xmm5, 0x0
  312b92:      	pxor	xmm4, xmm9
  312b97:      	movdqu	xmm7, xmmword ptr [r8 + rax - 0x10]
  312b9e:      	pshufb	xmm7, xmm0
  312ba3:      	movdqa	xmm5, xmm7
  312ba7:      	movdqa	xmm9, xmmword ptr [rbp - 0x90]
  312bb0:      	pclmulqdq	xmm5, xmm9, 0x0
  312bb7:      	pxor	xmm5, xmm6
  312bbb:      	pxor	xmm5, xmm3
  312bbf:      	pshufd	xmm6, xmm7, 0xee        # xmm6 = xmm7[2,3,2,3]
  312bc4:      	pxor	xmm6, xmm7
  312bc8:      	movdqa	xmm3, xmm7
  312bcc:      	pclmulqdq	xmm3, xmm9, 0x11
  312bd3:      	pxor	xmm3, xmm8
  312bd8:      	pxor	xmm3, xmm2
  312bdc:      	pshufd	xmm2, xmm9, 0xee        # xmm2 = xmm9[2,3,2,3]
  312be2:      	pxor	xmm2, xmm9
  312be7:      	pclmulqdq	xmm2, xmm6, 0x0
  312bed:      	pxor	xmm2, xmm4
  312bf1:      	pxor	xmm2, xmm5
  312bf5:      	pxor	xmm2, xmm1
  312bf9:      	pxor	xmm2, xmm3
  312bfd:      	movdqa	xmm1, xmm2
  312c01:      	pslldq	xmm1, 0x8               # xmm1 = zero,zero,zero,zero,zero,zero,zero,zero,xmm1[0,1,2,3,4,5,6,7]
  312c06:      	pxor	xmm1, xmm5
  312c0a:      	psrldq	xmm2, 0x8               # xmm2 = xmm2[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero
  312c0f:      	pshufd	xmm4, xmm1, 0x4e        # xmm4 = xmm1[2,3,0,1]
  312c14:      	movq	xmm5, rdx
  312c19:      	pclmulqdq	xmm1, xmm5, 0x0
  312c1f:      	pxor	xmm1, xmm4
  312c23:      	pshufd	xmm4, xmm1, 0x4e        # xmm4 = xmm1[2,3,0,1]
  312c28:      	pxor	xmm4, xmm2
  312c2c:      	pclmulqdq	xmm1, xmm5, 0x0
  312c32:      	pxor	xmm4, xmm3
  312c36:      	pxor	xmm4, xmm1
  312c3a:      	pshufb	xmm4, xmm0
  312c3f:      	movdqu	xmmword ptr [rcx], xmm4
  312c43:      	movabs	rax, 0x7fffffffffffff80
  312c4d:      	and	r9, rax
  312c50:      	jmp	0x312c55 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, false>+0x885>
  312c52:      	xor	r9d, r9d
  312c55:      	mov	rax, r9
  312c58:      	add	rsp, 0x228
  312c5f:      	pop	rbx
  312c60:      	pop	rbp
  312c61:      	ret
  312c62:      	mov	esi, 0x1
  312c67:      	movdqa	xmm0, xmmword ptr [rbp - 0x1b0]
  312c6f:      	movdqa	xmmword ptr [rbp - 0xa0], xmm0
  312c77:      	jmp	0x312d89 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, false>+0x9b9>
  312c7c:      	nop	dword ptr [rax]
  312c80:      	aesenclast	xmm14, xmm10
  312c86:      	inc	rsi
  312c89:      	movdqu	xmm3, xmmword ptr [r10]
  312c8e:      	pxor	xmm3, xmm14
  312c93:      	movdqu	xmm14, xmmword ptr [r10 + 0x10]
  312c99:      	movdqu	xmm11, xmmword ptr [r10 + 0x20]
  312c9f:      	movdqu	xmm12, xmmword ptr [r10 + 0x30]
  312ca5:      	aesenclast	xmm0, xmm10
  312cab:      	movdqu	xmmword ptr [r10], xmm3
  312cb0:      	pxor	xmm0, xmm14
  312cb5:      	aesenclast	xmm2, xmm10
  312cbb:      	movdqu	xmmword ptr [r10 + 0x10], xmm0
  312cc1:      	pxor	xmm2, xmm11
  312cc6:      	aesenclast	xmm13, xmm10
  312ccc:      	movdqu	xmmword ptr [r10 + 0x20], xmm2
  312cd2:      	pxor	xmm13, xmm12
  312cd7:      	aesenclast	xmm15, xmm10
  312cdd:      	movdqu	xmmword ptr [r10 + 0x30], xmm13
  312ce3:      	movdqu	xmm0, xmmword ptr [r10 + 0x40]
  312ce9:      	pxor	xmm0, xmm15
  312cee:      	movdqu	xmmword ptr [r10 + 0x40], xmm0
  312cf4:      	aesenclast	xmm5, xmm10
  312cfa:      	movdqu	xmm0, xmmword ptr [r10 + 0x50]
  312d00:      	pxor	xmm0, xmm5
  312d04:      	movdqu	xmmword ptr [r10 + 0x50], xmm0
  312d0a:      	aesenclast	xmm6, xmm10
  312d10:      	movdqu	xmm0, xmmword ptr [r10 + 0x60]
  312d16:      	pxor	xmm0, xmm6
  312d1a:      	movdqu	xmmword ptr [r10 + 0x60], xmm0
  312d20:      	aesenclast	xmm7, xmm10
  312d26:      	movdqu	xmm0, xmmword ptr [r10 + 0x70]
  312d2c:      	pxor	xmm0, xmm7
  312d30:      	movdqu	xmmword ptr [r10 + 0x70], xmm0
  312d36:      	movdqa	xmm0, xmm1
  312d3a:      	pxor	xmm0, xmm4
  312d3e:      	pxor	xmm0, xmm8
  312d43:      	movdqa	xmm2, xmm0
  312d47:      	pslldq	xmm2, 0x8               # xmm2 = zero,zero,zero,zero,zero,zero,zero,zero,xmm2[0,1,2,3,4,5,6,7]
  312d4c:      	pxor	xmm2, xmm4
  312d50:      	psrldq	xmm0, 0x8               # xmm0 = xmm0[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero
  312d55:      	pshufd	xmm4, xmm2, 0x4e        # xmm4 = xmm2[2,3,0,1]
  312d5a:      	movq	xmm5, rdx
  312d5f:      	pclmulqdq	xmm2, xmm5, 0x0
  312d65:      	pxor	xmm2, xmm4
  312d69:      	pshufd	xmm4, xmm2, 0x4e        # xmm4 = xmm2[2,3,0,1]
  312d6e:      	pxor	xmm4, xmm0
  312d72:      	pclmulqdq	xmm2, xmm5, 0x0
  312d78:      	pxor	xmm4, xmm1
  312d7c:      	pxor	xmm4, xmm2
  312d80:      	cmp	rsi, rax
  312d83:      	je	0x312989 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, false>+0x5b9>
  312d89:      	mov	r11, rsi
  312d8c:      	shl	r11, 0x7
  312d90:      	lea	r10, [r8 + r11]
  312d94:      	movdqa	xmm1, xmmword ptr [rip - 0x266adc] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  312d9c:      	pshufb	xmm3, xmm1
  312da1:      	movdqa	xmmword ptr [rbp - 0x130], xmm3
  312da9:      	movdqu	xmm0, xmmword ptr [r8 + r11 - 0x70]
  312db0:      	pshufb	xmm0, xmm1
  312db5:      	movdqa	xmmword ptr [rbp - 0x120], xmm0
  312dbd:      	movdqu	xmm0, xmmword ptr [r8 + r11 - 0x60]
  312dc4:      	pshufb	xmm0, xmm1
  312dc9:      	movdqa	xmmword ptr [rbp - 0x110], xmm0
  312dd1:      	movdqu	xmm0, xmmword ptr [r8 + r11 - 0x50]
  312dd8:      	pshufb	xmm0, xmm1
  312ddd:      	movdqa	xmmword ptr [rbp - 0x100], xmm0
  312de5:      	movdqu	xmm0, xmmword ptr [r8 + r11 - 0x40]
  312dec:      	pshufb	xmm0, xmm1
  312df1:      	movdqa	xmmword ptr [rbp - 0xf0], xmm0
  312df9:      	movdqu	xmm0, xmmword ptr [r8 + r11 - 0x30]
  312e00:      	pshufb	xmm0, xmm1
  312e05:      	movdqa	xmmword ptr [rbp - 0xe0], xmm0
  312e0d:      	movdqu	xmm0, xmmword ptr [r8 + r11 - 0x20]
  312e14:      	pshufb	xmm0, xmm1
  312e19:      	movdqa	xmmword ptr [rbp - 0xd0], xmm0
  312e21:      	movdqu	xmm0, xmmword ptr [r8 + r11 - 0x10]
  312e28:      	pshufb	xmm0, xmm1
  312e2d:      	movdqa	xmmword ptr [rbp - 0xc0], xmm0
  312e35:      	lea	r11d, [8*rsi + 0x2]
  312e3d:      	bswap	r11d
  312e40:      	movd	xmm14, r11d
  312e45:      	pslldq	xmm14, 0xc              # xmm14 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm14[0,1,2,3]
  312e4b:      	pxor	xmm14, xmm9
  312e50:      	lea	r11d, [8*rsi + 0x3]
  312e58:      	bswap	r11d
  312e5b:      	movd	xmm0, r11d
  312e60:      	pslldq	xmm0, 0xc               # xmm0 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm0[0,1,2,3]
  312e65:      	pxor	xmm0, xmm9
  312e6a:      	lea	r11d, [8*rsi + 0x4]
  312e72:      	bswap	r11d
  312e75:      	movd	xmm2, r11d
  312e7a:      	pslldq	xmm2, 0xc               # xmm2 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm2[0,1,2,3]
  312e7f:      	pxor	xmm2, xmm9
  312e84:      	lea	r11d, [8*rsi + 0x5]
  312e8c:      	bswap	r11d
  312e8f:      	movd	xmm13, r11d
  312e94:      	pslldq	xmm13, 0xc              # xmm13 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm13[0,1,2,3]
  312e9a:      	pxor	xmm13, xmm9
  312e9f:      	lea	r11d, [8*rsi + 0x6]
  312ea7:      	bswap	r11d
  312eaa:      	movd	xmm15, r11d
  312eaf:      	pslldq	xmm15, 0xc              # xmm15 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm15[0,1,2,3]
  312eb5:      	pxor	xmm15, xmm9
  312eba:      	lea	r11d, [8*rsi + 0x7]
  312ec2:      	bswap	r11d
  312ec5:      	movd	xmm5, r11d
  312eca:      	pslldq	xmm5, 0xc               # xmm5 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm5[0,1,2,3]
  312ecf:      	pxor	xmm5, xmm9
  312ed4:      	lea	r11d, [8*rsi + 0x8]
  312edc:      	bswap	r11d
  312edf:      	movd	xmm6, r11d
  312ee4:      	pslldq	xmm6, 0xc               # xmm6 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm6[0,1,2,3]
  312ee9:      	pxor	xmm6, xmm9
  312eee:      	lea	r11d, [8*rsi + 0x9]
  312ef6:      	bswap	r11d
  312ef9:      	movd	xmm7, r11d
  312efe:      	pslldq	xmm7, 0xc               # xmm7 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm7[0,1,2,3]
  312f03:      	pxor	xmm7, xmm9
  312f08:      	pxor	xmm3, xmm4
  312f0c:      	movdqa	xmm4, xmm3
  312f10:      	movdqa	xmm8, xmmword ptr [rbp - 0xa0]
  312f19:      	pclmulqdq	xmm4, xmm8, 0x0
  312f20:      	movdqa	xmm1, xmm3
  312f24:      	pclmulqdq	xmm1, xmm8, 0x11
  312f2b:      	pshufd	xmm8, xmm3, 0xee        # xmm8 = xmm3[2,3,2,3]
  312f31:      	pxor	xmm8, xmm3
  312f36:      	pclmulqdq	xmm8, xmmword ptr [rbp - 0xb0], 0x0
  312f41:      	mov	r11, -0x1
  312f48:      	mov	ebx, 0x0
  312f4d:      	jmp	0x312f92 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, false>+0xbc2>
  312f4f:      	nop
  312f50:      	movdqu	xmm3, xmmword ptr [rdi + rbx + 0x10]
  312f56:      	aesenc	xmm14, xmm3
  312f5c:      	aesenc	xmm0, xmm3
  312f61:      	aesenc	xmm2, xmm3
  312f66:      	aesenc	xmm13, xmm3
  312f6c:      	aesenc	xmm15, xmm3
  312f72:      	aesenc	xmm5, xmm3
  312f77:      	aesenc	xmm6, xmm3
  312f7c:      	aesenc	xmm7, xmm3
  312f81:      	add	rbx, 0x10
  312f85:      	inc	r11
  312f88:      	cmp	r11, 0xc
  312f8c:      	je	0x312c80 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, false>+0x8b0>
  312f92:      	cmp	r11, 0x7
  312f96:      	jae	0x312f50 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, false>+0xb80>
  312f98:      	movdqa	xmm3, xmmword ptr [rbp + rbx - 0x130]
  312fa1:      	movdqa	xmm11, xmmword ptr [rbp + rbx - 0x1b0]
  312fab:      	movdqa	xmm12, xmm3
  312fb0:      	pclmulqdq	xmm12, xmm11, 0x0
  312fb7:      	pxor	xmm4, xmm12
  312fbc:      	pclmulqdq	xmm11, xmm3, 0x11
  312fc3:      	pxor	xmm1, xmm11
  312fc8:      	pshufd	xmm11, xmm3, 0xee       # xmm11 = xmm3[2,3,2,3]
  312fce:      	pxor	xmm11, xmm3
  312fd3:      	pclmulqdq	xmm11, xmmword ptr [rbp + rbx - 0x230], 0x0
  312fdf:      	pxor	xmm8, xmm11
  312fe4:      	jmp	0x312f50 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, false>+0xb80>
  312fe9:      	lea	rdi, [rip - 0x206c4d]   # 0x10c3a3 <anon.8182237a801038de36885de64d2c176c.5.llvm.10465402473772549265>
  312ff0:      	lea	rcx, [rip + 0x4f18f9]   # 0x8048f0 <anon.8182237a801038de36885de64d2c176c.1.llvm.10465402473772549265>
  312ff7:      	mov	esi, 0x237
  312ffc:      	xor	edx, edx
  312ffe:      	call	qword ptr [rip + 0x564d7c] # 0x877d80 <sdallocx+0x877d80>
  313004:      	int3
  313005:      	int3
  313006:      	int3
  313007:      	int3
  313008:      	int3
  313009:      	int3
  31300a:      	int3
  31300b:      	int3
  31300c:      	int3
  31300d:      	int3
  31300e:      	int3
  31300f:      	int3
