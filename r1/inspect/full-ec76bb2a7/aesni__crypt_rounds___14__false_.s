
stage/probe-full-ec76bb2a7:	file format elf64-x86-64

Disassembly of section .text:

0000000000312240 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, false>>:
  312240:      	push	rbp
  312241:      	mov	rbp, rsp
  312244:      	sub	rsp, 0x240
  31224b:      	mov	rax, r9
  31224e:      	shr	rax, 0x7
  312252:      	je	0x313316 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, false>+0x10d6>
  312258:      	movaps	xmm3, xmmword ptr [rsi + 0x280]
  31225f:      	movaps	xmm13, xmmword ptr [rsi + 0x290]
  312267:      	movaps	xmm1, xmmword ptr [rsi + 0x2a0]
  31226e:      	movaps	xmm14, xmmword ptr [rsi + 0x2b0]
  312276:      	movaps	xmm12, xmmword ptr [rsi + 0x2c0]
  31227e:      	movaps	xmm10, xmmword ptr [rsi + 0x2d0]
  312286:      	movaps	xmm9, xmmword ptr [rsi + 0x2e0]
  31228e:      	movaps	xmm2, xmmword ptr [rsi + 0x2f0]
  312295:      	movdqu	xmm6, xmmword ptr [rdi]
  312299:      	xorps	xmm0, xmm0
  31229c:      	movaps	xmmword ptr [rbp - 0x20], xmm0
  3122a0:      	lea	rsi, [rbp - 0x20]
  3122a4:      	mov	r10, rdx
  3122a7:      	sub	r10, rsi
  3122aa:      	sub	rsi, rdx
  3122ad:      	cmovb	rsi, r10
  3122b1:      	cmp	rsi, 0xb
  3122b5:      	jbe	0x313325 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, false>+0x10e5>
  3122bb:      	mov	esi, dword ptr [rdx + 0x8]
  3122be:      	mov	dword ptr [rbp - 0x18], esi
  3122c1:      	mov	rdx, qword ptr [rdx]
  3122c4:      	mov	qword ptr [rbp - 0x20], rdx
  3122c8:      	pxor	xmm6, xmmword ptr [rbp - 0x20]
  3122cd:      	movdqa	xmm0, xmmword ptr [rip - 0x2662c5] # 0xac010 <anon.e81663b63ab83dbb5a37e8fa4238500b.6.llvm.14128926338108641276+0xc0>
  3122d5:      	pxor	xmm0, xmm6
  3122d9:      	movdqa	xmm8, xmmword ptr [rip - 0x266cb2] # 0xab630 <anon.0b2aa08f77b92a096c4b4e8601736de0.2.llvm.10746933672069200717+0x90>
  3122e2:      	pxor	xmm8, xmm6
  3122e7:      	movdqa	xmm5, xmmword ptr [rip - 0x266caf] # 0xab640 <anon.0b2aa08f77b92a096c4b4e8601736de0.2.llvm.10746933672069200717+0xa0>
  3122ef:      	pxor	xmm5, xmm6
  3122f3:      	movdqa	xmm4, xmmword ptr [rip - 0x26714b] # 0xab1b0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.13.llvm.14024894901458550281+0xd0>
  3122fb:      	pxor	xmm4, xmm6
  3122ff:      	movaps	xmmword ptr [rbp - 0xa0], xmm3
  312306:      	movdqa	xmm3, xmmword ptr [rip - 0x266a5e] # 0xab8b0 <anon.0b2aa08f77b92a096c4b4e8601736de0.2.llvm.10746933672069200717+0x310>
  31230e:      	pxor	xmm3, xmm6
  312312:      	movaps	xmmword ptr [rbp - 0x90], xmm13
  31231a:      	movaps	xmmword ptr [rbp - 0x80], xmm2
  31231e:      	movdqa	xmm2, xmmword ptr [rip - 0x266f26] # 0xab400 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.13.llvm.14024894901458550281+0x320>
  312326:      	pxor	xmm2, xmm6
  31232a:      	movaps	xmmword ptr [rbp - 0x50], xmm12
  31232f:      	movaps	xmmword ptr [rbp - 0x60], xmm14
  312334:      	movaps	xmmword ptr [rbp - 0x70], xmm1
  312338:      	movdqa	xmm1, xmmword ptr [rip - 0x266eb0] # 0xab490 <anon.e81663b63ab83dbb5a37e8fa4238500b.8.llvm.14128926338108641276+0x10>
  312340:      	pxor	xmm1, xmm6
  312344:      	movdqa	xmm12, xmmword ptr [rip - 0x2663dd] # 0xabf70 <anon.e81663b63ab83dbb5a37e8fa4238500b.6.llvm.14128926338108641276+0x20>
  31234d:      	movdqa	xmmword ptr [rbp - 0xe0], xmm6
  312355:      	pxor	xmm12, xmm6
  31235a:      	movaps	xmmword ptr [rbp - 0x30], xmm10
  31235f:      	movdqu	xmm11, xmmword ptr [rdi + 0x10]
  312365:      	movaps	xmmword ptr [rbp - 0x40], xmm9
  31236a:      	movdqu	xmm10, xmmword ptr [rdi + 0x20]
  312370:      	movdqu	xmm9, xmmword ptr [rdi + 0x30]
  312376:      	movdqu	xmm6, xmmword ptr [rdi + 0x40]
  31237b:      	aesenc	xmm0, xmm11
  312381:      	aesenc	xmm8, xmm11
  312387:      	aesenc	xmm5, xmm11
  31238d:      	aesenc	xmm4, xmm11
  312393:      	aesenc	xmm3, xmm11
  312399:      	aesenc	xmm2, xmm11
  31239f:      	aesenc	xmm1, xmm11
  3123a5:      	aesenc	xmm12, xmm11
  3123ab:      	aesenc	xmm0, xmm10
  3123b1:      	aesenc	xmm8, xmm10
  3123b7:      	aesenc	xmm5, xmm10
  3123bd:      	aesenc	xmm4, xmm10
  3123c3:      	aesenc	xmm3, xmm10
  3123c9:      	aesenc	xmm2, xmm10
  3123cf:      	aesenc	xmm1, xmm10
  3123d5:      	aesenc	xmm12, xmm10
  3123db:      	aesenc	xmm0, xmm9
  3123e1:      	aesenc	xmm8, xmm9
  3123e7:      	aesenc	xmm5, xmm9
  3123ed:      	aesenc	xmm4, xmm9
  3123f3:      	aesenc	xmm3, xmm9
  3123f9:      	aesenc	xmm2, xmm9
  3123ff:      	aesenc	xmm1, xmm9
  312405:      	aesenc	xmm12, xmm9
  31240b:      	aesenc	xmm0, xmm6
  312410:      	aesenc	xmm8, xmm6
  312416:      	aesenc	xmm5, xmm6
  31241b:      	aesenc	xmm4, xmm6
  312420:      	aesenc	xmm3, xmm6
  312425:      	aesenc	xmm2, xmm6
  31242a:      	aesenc	xmm1, xmm6
  31242f:      	aesenc	xmm12, xmm6
  312435:      	movdqu	xmm6, xmmword ptr [rdi + 0x50]
  31243a:      	aesenc	xmm0, xmm6
  31243f:      	aesenc	xmm8, xmm6
  312445:      	aesenc	xmm5, xmm6
  31244a:      	aesenc	xmm4, xmm6
  31244f:      	aesenc	xmm3, xmm6
  312454:      	aesenc	xmm2, xmm6
  312459:      	aesenc	xmm1, xmm6
  31245e:      	aesenc	xmm12, xmm6
  312464:      	movdqu	xmm6, xmmword ptr [rdi + 0x60]
  312469:      	aesenc	xmm0, xmm6
  31246e:      	aesenc	xmm8, xmm6
  312474:      	aesenc	xmm5, xmm6
  312479:      	aesenc	xmm4, xmm6
  31247e:      	aesenc	xmm3, xmm6
  312483:      	aesenc	xmm2, xmm6
  312488:      	aesenc	xmm1, xmm6
  31248d:      	aesenc	xmm12, xmm6
  312493:      	movdqu	xmm6, xmmword ptr [rdi + 0x70]
  312498:      	aesenc	xmm0, xmm6
  31249d:      	aesenc	xmm8, xmm6
  3124a3:      	aesenc	xmm5, xmm6
  3124a8:      	aesenc	xmm4, xmm6
  3124ad:      	aesenc	xmm3, xmm6
  3124b2:      	aesenc	xmm2, xmm6
  3124b7:      	aesenc	xmm1, xmm6
  3124bc:      	aesenc	xmm12, xmm6
  3124c2:      	movdqu	xmm10, xmmword ptr [rdi + 0x80]
  3124cb:      	aesenc	xmm0, xmm10
  3124d1:      	aesenc	xmm8, xmm10
  3124d7:      	movdqu	xmm13, xmmword ptr [rdi + 0x90]
  3124e0:      	aesenc	xmm0, xmm13
  3124e6:      	aesenc	xmm8, xmm13
  3124ec:      	movdqu	xmm11, xmmword ptr [rdi + 0xa0]
  3124f5:      	aesenc	xmm0, xmm11
  3124fb:      	aesenc	xmm8, xmm11
  312501:      	movdqu	xmm15, xmmword ptr [rdi + 0xb0]
  31250a:      	aesenc	xmm0, xmm15
  312510:      	aesenc	xmm8, xmm15
  312516:      	movdqu	xmm14, xmmword ptr [rdi + 0xc0]
  31251f:      	aesenc	xmm0, xmm14
  312525:      	aesenc	xmm8, xmm14
  31252b:      	movdqu	xmm6, xmmword ptr [rdi + 0xd0]
  312533:      	movdqa	xmmword ptr [rbp - 0x10], xmm6
  312538:      	aesenc	xmm0, xmm6
  31253d:      	aesenc	xmm8, xmm6
  312543:      	movdqu	xmm9, xmmword ptr [rdi + 0xe0]
  31254c:      	aesenclast	xmm0, xmm9
  312552:      	aesenclast	xmm8, xmm9
  312558:      	movdqu	xmm7, xmmword ptr [r8]
  31255d:      	pxor	xmm7, xmm0
  312561:      	movdqu	xmm6, xmmword ptr [r8 + 0x10]
  312567:      	pxor	xmm6, xmm8
  31256c:      	movdqa	xmm0, xmmword ptr [rbp - 0xa0]
  312574:      	pshufd	xmm8, xmm0, 0xee        # xmm8 = xmm0[2,3,2,3]
  31257a:      	aesenc	xmm5, xmm10
  312580:      	aesenc	xmm5, xmm13
  312586:      	aesenc	xmm5, xmm11
  31258c:      	aesenc	xmm5, xmm15
  312592:      	aesenc	xmm5, xmm14
  312598:      	aesenc	xmm5, xmmword ptr [rbp - 0x10]
  31259e:      	pxor	xmm8, xmm0
  3125a3:      	movdqa	xmmword ptr [rbp - 0x120], xmm8
  3125ac:      	aesenclast	xmm5, xmm9
  3125b2:      	movdqu	xmmword ptr [r8], xmm7
  3125b7:      	movdqu	xmmword ptr [r8 + 0x10], xmm6
  3125bd:      	movdqu	xmm0, xmmword ptr [r8 + 0x20]
  3125c3:      	pxor	xmm0, xmm5
  3125c7:      	movdqa	xmm8, xmmword ptr [rbp - 0x90]
  3125d0:      	pshufd	xmm5, xmm8, 0xee        # xmm5 = xmm8[2,3,2,3]
  3125d6:      	movdqa	xmm6, xmm10
  3125db:      	aesenc	xmm4, xmm10
  3125e1:      	movdqa	xmm10, xmm13
  3125e6:      	aesenc	xmm4, xmm13
  3125ec:      	aesenc	xmm4, xmm11
  3125f2:      	movdqa	xmm13, xmm15
  3125f7:      	aesenc	xmm4, xmm15
  3125fd:      	aesenc	xmm4, xmm14
  312603:      	movdqa	xmm15, xmmword ptr [rbp - 0x10]
  312609:      	aesenc	xmm4, xmm15
  31260f:      	pxor	xmm5, xmm8
  312614:      	movdqa	xmmword ptr [rbp - 0x110], xmm5
  31261c:      	aesenclast	xmm4, xmm9
  312622:      	movdqu	xmmword ptr [r8 + 0x20], xmm0
  312628:      	movdqu	xmm5, xmmword ptr [r8 + 0x30]
  31262e:      	pxor	xmm5, xmm4
  312632:      	movdqa	xmm0, xmmword ptr [rbp - 0x70]
  312637:      	pshufd	xmm4, xmm0, 0xee        # xmm4 = xmm0[2,3,2,3]
  31263c:      	pxor	xmm4, xmm0
  312640:      	movdqa	xmmword ptr [rbp - 0x130], xmm4
  312648:      	movdqa	xmm0, xmm6
  31264c:      	aesenc	xmm3, xmm6
  312651:      	movdqa	xmm8, xmm10
  312656:      	aesenc	xmm3, xmm10
  31265c:      	aesenc	xmm3, xmm11
  312662:      	aesenc	xmm3, xmm13
  312668:      	aesenc	xmm3, xmm14
  31266e:      	aesenc	xmm3, xmm15
  312674:      	aesenclast	xmm3, xmm9
  31267a:      	movdqu	xmmword ptr [r8 + 0x30], xmm5
  312680:      	movdqa	xmm5, xmm15
  312685:      	movdqa	xmm10, xmm14
  31268a:      	movdqa	xmm15, xmm13
  31268f:      	movdqu	xmm4, xmmword ptr [r8 + 0x40]
  312695:      	pxor	xmm4, xmm3
  312699:      	movdqa	xmm6, xmmword ptr [rbp - 0x60]
  31269e:      	pshufd	xmm3, xmm6, 0xee        # xmm3 = xmm6[2,3,2,3]
  3126a3:      	aesenc	xmm2, xmm0
  3126a8:      	aesenc	xmm2, xmm8
  3126ae:      	aesenc	xmm2, xmm11
  3126b4:      	aesenc	xmm2, xmm13
  3126ba:      	aesenc	xmm2, xmm14
  3126c0:      	aesenc	xmm2, xmm5
  3126c5:      	aesenclast	xmm2, xmm9
  3126cb:      	pxor	xmm3, xmm6
  3126cf:      	movdqa	xmmword ptr [rbp - 0x140], xmm3
  3126d7:      	movdqu	xmmword ptr [r8 + 0x40], xmm4
  3126dd:      	movdqa	xmm6, xmm8
  3126e2:      	movdqu	xmm3, xmmword ptr [r8 + 0x50]
  3126e8:      	pxor	xmm3, xmm2
  3126ec:      	movdqa	xmm8, xmmword ptr [rbp - 0x50]
  3126f2:      	pshufd	xmm2, xmm8, 0xee        # xmm2 = xmm8[2,3,2,3]
  3126f8:      	pxor	xmm2, xmm8
  3126fd:      	movdqa	xmmword ptr [rbp - 0x160], xmm2
  312705:      	aesenc	xmm1, xmm0
  31270a:      	aesenc	xmm1, xmm6
  31270f:      	aesenc	xmm1, xmm11
  312715:      	aesenc	xmm1, xmm13
  31271b:      	aesenc	xmm1, xmm14
  312721:      	aesenc	xmm1, xmm5
  312726:      	aesenclast	xmm1, xmm9
  31272c:      	movdqu	xmmword ptr [r8 + 0x50], xmm3
  312732:      	movdqa	xmm3, xmm0
  312736:      	movdqu	xmm2, xmmword ptr [r8 + 0x60]
  31273c:      	pxor	xmm2, xmm1
  312740:      	movdqa	xmm1, xmmword ptr [rbp - 0x30]
  312745:      	pshufd	xmm13, xmm1, 0xee       # xmm13 = xmm1[2,3,2,3]
  31274b:      	aesenc	xmm12, xmm0
  312751:      	aesenc	xmm12, xmm6
  312757:      	aesenc	xmm12, xmm11
  31275d:      	aesenc	xmm12, xmm15
  312763:      	aesenc	xmm12, xmm14
  312769:      	aesenc	xmm12, xmm5
  31276f:      	pxor	xmm13, xmm1
  312774:      	movdqa	xmmword ptr [rbp - 0xd0], xmm9
  31277d:      	aesenclast	xmm12, xmm9
  312783:      	movdqu	xmmword ptr [r8 + 0x60], xmm2
  312789:      	movdqu	xmm1, xmmword ptr [r8 + 0x70]
  31278f:      	pxor	xmm1, xmm12
  312794:      	movdqa	xmm0, xmmword ptr [rbp - 0x40]
  312799:      	pshufd	xmm14, xmm0, 0xee       # xmm14 = xmm0[2,3,2,3]
  31279f:      	pxor	xmm14, xmm0
  3127a4:      	movdqu	xmmword ptr [r8 + 0x70], xmm1
  3127aa:      	movdqa	xmm0, xmmword ptr [rbp - 0x80]
  3127af:      	pshufd	xmm8, xmm0, 0xee        # xmm8 = xmm0[2,3,2,3]
  3127b5:      	pxor	xmm8, xmm0
  3127ba:      	movdqu	xmm9, xmmword ptr [rcx]
  3127bf:      	pshufb	xmm9, xmmword ptr [rip - 0x266509] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  3127c9:      	movabs	rdx, -0x3e00000000000000
  3127d3:      	cmp	rax, 0x1
  3127d7:      	movdqa	xmmword ptr [rbp - 0x150], xmm8
  3127e0:      	movdqa	xmmword ptr [rbp - 0x100], xmm14
  3127e9:      	movdqa	xmmword ptr [rbp - 0xf0], xmm13
  3127f2:      	je	0x31309b <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, false>+0xe5b>
  3127f8:      	movups	xmm0, xmmword ptr [rdi + 0x10]
  3127fc:      	movaps	xmmword ptr [rbp - 0xc0], xmm0
  312803:      	movups	xmm0, xmmword ptr [rdi + 0x20]
  312807:      	movaps	xmmword ptr [rbp - 0x1d0], xmm0
  31280e:      	movdqa	xmmword ptr [rbp - 0x200], xmm3
  312816:      	movups	xmm0, xmmword ptr [rdi + 0x30]
  31281a:      	movaps	xmmword ptr [rbp - 0x1c0], xmm0
  312821:      	movups	xmm0, xmmword ptr [rdi + 0x40]
  312825:      	movaps	xmmword ptr [rbp - 0x1a0], xmm0
  31282c:      	movdqa	xmmword ptr [rbp - 0x1f0], xmm6
  312834:      	movdqa	xmmword ptr [rbp - 0x1b0], xmm11
  31283d:      	movups	xmm0, xmmword ptr [rdi + 0x50]
  312841:      	movaps	xmmword ptr [rbp - 0x180], xmm0
  312848:      	movdqa	xmmword ptr [rbp - 0x190], xmm10
  312851:      	movdqa	xmmword ptr [rbp - 0x1e0], xmm15
  31285a:      	movups	xmm0, xmmword ptr [rdi + 0x60]
  31285e:      	movaps	xmmword ptr [rbp - 0x170], xmm0
  312865:      	movdqu	xmm0, xmmword ptr [rdi + 0x70]
  31286a:      	movdqa	xmmword ptr [rbp - 0xb0], xmm0
  312872:      	lea	rsi, [r8 + 0xf0]
  312879:      	lea	rdi, [rax - 0x1]
  31287d:      	mov	r10d, 0x11
  312883:      	nop	word ptr cs:[rax + rax]
  312890:      	movdqa	xmm2, xmmword ptr [rip - 0x2665d8] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  312898:      	pshufb	xmm7, xmm2
  31289d:      	movdqu	xmm10, xmmword ptr [rsi - 0xe0]
  3128a6:      	movdqu	xmm11, xmmword ptr [rsi - 0xd0]
  3128af:      	pxor	xmm7, xmm9
  3128b4:      	movdqu	xmm1, xmmword ptr [rsi - 0xc0]
  3128bc:      	movdqu	xmm8, xmmword ptr [rsi - 0xb0]
  3128c5:      	pshufb	xmm10, xmm2
  3128cb:      	pshufb	xmm11, xmm2
  3128d1:      	pshufb	xmm1, xmm2
  3128d6:      	pshufb	xmm8, xmm2
  3128dc:      	movdqa	xmm15, xmm10
  3128e1:      	pshufd	xmm14, xmm10, 0xee      # xmm14 = xmm10[2,3,2,3]
  3128e7:      	pxor	xmm14, xmm10
  3128ec:      	movdqa	xmm13, xmm10
  3128f1:      	movdqa	xmm12, xmm11
  3128f6:      	movdqa	xmm0, xmmword ptr [rbp - 0x90]
  3128fe:      	pclmulqdq	xmm13, xmm0, 0x0
  312905:      	pshufd	xmm10, xmm11, 0xee      # xmm10 = xmm11[2,3,2,3]
  31290b:      	pxor	xmm10, xmm11
  312910:      	movdqa	xmm4, xmmword ptr [rbp - 0x70]
  312915:      	pclmulqdq	xmm11, xmm4, 0x0
  31291c:      	pxor	xmm11, xmm13
  312921:      	movdqa	xmm9, xmm7
  312926:      	movdqa	xmm3, xmmword ptr [rbp - 0xa0]
  31292e:      	pclmulqdq	xmm9, xmm3, 0x11
  312935:      	pclmulqdq	xmm15, xmm0, 0x11
  31293c:      	pclmulqdq	xmm14, xmmword ptr [rbp - 0x110], 0x0
  312947:      	pclmulqdq	xmm12, xmm4, 0x11
  31294e:      	pxor	xmm12, xmm15
  312953:      	pxor	xmm12, xmm9
  312958:      	pclmulqdq	xmm10, xmmword ptr [rbp - 0x130], 0x0
  312963:      	movdqa	xmm9, xmm1
  312968:      	pshufd	xmm13, xmm1, 0xee       # xmm13 = xmm1[2,3,2,3]
  31296e:      	pxor	xmm10, xmm14
  312973:      	pxor	xmm13, xmm1
  312978:      	movdqa	xmm14, xmm1
  31297d:      	movdqa	xmm15, xmm8
  312982:      	movdqa	xmm4, xmmword ptr [rbp - 0x60]
  312987:      	pclmulqdq	xmm9, xmm4, 0x11
  31298e:      	movdqa	xmm1, xmmword ptr [rbp - 0x50]
  312993:      	pclmulqdq	xmm15, xmm1, 0x11
  31299a:      	pxor	xmm15, xmm9
  31299f:      	pshufd	xmm9, xmm8, 0xee        # xmm9 = xmm8[2,3,2,3]
  3129a5:      	pclmulqdq	xmm14, xmm4, 0x0
  3129ac:      	pxor	xmm9, xmm8
  3129b1:      	pclmulqdq	xmm8, xmm1, 0x0
  3129b8:      	pxor	xmm8, xmm14
  3129bd:      	pclmulqdq	xmm13, xmmword ptr [rbp - 0x140], 0x0
  3129c8:      	pclmulqdq	xmm9, xmmword ptr [rbp - 0x160], 0x0
  3129d3:      	pxor	xmm9, xmm13
  3129d8:      	pshufd	xmm1, xmm7, 0xee        # xmm1 = xmm7[2,3,2,3]
  3129dd:      	pxor	xmm1, xmm7
  3129e1:      	pclmulqdq	xmm7, xmm3, 0x0
  3129e7:      	pxor	xmm11, xmm7
  3129ec:      	movdqu	xmm13, xmmword ptr [rsi - 0xa0]
  3129f5:      	pshufb	xmm13, xmm2
  3129fb:      	pclmulqdq	xmm1, xmmword ptr [rbp - 0x120], 0x0
  312a05:      	pxor	xmm10, xmm1
  312a0a:      	movdqa	xmm14, xmm13
  312a0f:      	movdqa	xmm1, xmmword ptr [rbp - 0x30]
  312a14:      	pclmulqdq	xmm14, xmm1, 0x11
  312a1b:      	pxor	xmm14, xmm15
  312a20:      	pshufd	xmm6, xmm13, 0xee       # xmm6 = xmm13[2,3,2,3]
  312a26:      	pxor	xmm6, xmm13
  312a2b:      	movdqa	xmm15, xmm13
  312a30:      	pclmulqdq	xmm15, xmm1, 0x0
  312a37:      	pxor	xmm15, xmm8
  312a3c:      	movdqu	xmm13, xmmword ptr [rsi - 0x90]
  312a45:      	pxor	xmm14, xmm12
  312a4a:      	movdqu	xmm8, xmmword ptr [rsi - 0x80]
  312a50:      	pshufb	xmm13, xmm2
  312a56:      	pshufb	xmm8, xmm2
  312a5c:      	pclmulqdq	xmm6, xmmword ptr [rbp - 0xf0], 0x0
  312a66:      	pxor	xmm6, xmm9
  312a6b:      	pxor	xmm15, xmm11
  312a70:      	movdqa	xmm12, xmm13
  312a75:      	pshufd	xmm11, xmm13, 0xee      # xmm11 = xmm13[2,3,2,3]
  312a7b:      	pxor	xmm11, xmm13
  312a80:      	pxor	xmm6, xmm10
  312a85:      	movdqa	xmm3, xmmword ptr [rbp - 0x40]
  312a8a:      	pclmulqdq	xmm13, xmm3, 0x0
  312a91:      	movdqa	xmm0, xmm8
  312a96:      	movdqa	xmm1, xmmword ptr [rbp - 0x80]
  312a9b:      	pclmulqdq	xmm0, xmm1, 0x0
  312aa1:      	pxor	xmm0, xmm13
  312aa6:      	pshufd	xmm2, xmm8, 0xee        # xmm2 = xmm8[2,3,2,3]
  312aac:      	pxor	xmm2, xmm8
  312ab1:      	pclmulqdq	xmm12, xmm3, 0x11
  312ab8:      	pclmulqdq	xmm8, xmm1, 0x11
  312abf:      	pxor	xmm8, xmm12
  312ac4:      	lea	r11d, [r10 - 0x7]
  312ac8:      	bswap	r11d
  312acb:      	pxor	xmm8, xmm14
  312ad0:      	movdqa	xmmword ptr [rbp - 0x240], xmm8
  312ad9:      	movd	xmm12, r11d
  312ade:      	pslldq	xmm12, 0xc              # xmm12 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm12[0,1,2,3]
  312ae4:      	movdqa	xmm13, xmmword ptr [rbp - 0xe0]
  312aed:      	pxor	xmm12, xmm13
  312af2:      	lea	r11d, [r10 - 0x6]
  312af6:      	bswap	r11d
  312af9:      	pclmulqdq	xmm11, xmmword ptr [rbp - 0x100], 0x0
  312b04:      	pclmulqdq	xmm2, xmmword ptr [rbp - 0x150], 0x0
  312b0e:      	pxor	xmm2, xmm11
  312b13:      	movd	xmm14, r11d
  312b18:      	pslldq	xmm14, 0xc              # xmm14 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm14[0,1,2,3]
  312b1e:      	pxor	xmm14, xmm13
  312b23:      	lea	r11d, [r10 - 0x5]
  312b27:      	bswap	r11d
  312b2a:      	pxor	xmm0, xmm15
  312b2f:      	movdqa	xmmword ptr [rbp - 0x230], xmm0
  312b37:      	movd	xmm11, r11d
  312b3c:      	pslldq	xmm11, 0xc              # xmm11 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm11[0,1,2,3]
  312b42:      	lea	r11d, [r10 - 0x4]
  312b46:      	pxor	xmm11, xmm13
  312b4b:      	movdqa	xmm10, xmmword ptr [rbp - 0xc0]
  312b54:      	aesenc	xmm12, xmm10
  312b5a:      	aesenc	xmm14, xmm10
  312b60:      	movdqa	xmm7, xmmword ptr [rbp - 0x1d0]
  312b68:      	aesenc	xmm12, xmm7
  312b6e:      	aesenc	xmm14, xmm7
  312b74:      	movdqa	xmm4, xmmword ptr [rbp - 0x1c0]
  312b7c:      	aesenc	xmm12, xmm4
  312b82:      	aesenc	xmm14, xmm4
  312b88:      	movdqa	xmm5, xmmword ptr [rbp - 0x1a0]
  312b90:      	aesenc	xmm12, xmm5
  312b96:      	aesenc	xmm14, xmm5
  312b9c:      	movdqa	xmm15, xmmword ptr [rbp - 0x180]
  312ba5:      	aesenc	xmm12, xmm15
  312bab:      	aesenc	xmm14, xmm15
  312bb1:      	movdqa	xmm0, xmmword ptr [rbp - 0x170]
  312bb9:      	aesenc	xmm12, xmm0
  312bbf:      	aesenc	xmm14, xmm0
  312bc5:      	movdqa	xmm9, xmmword ptr [rbp - 0xb0]
  312bce:      	aesenc	xmm12, xmm9
  312bd4:      	aesenc	xmm14, xmm9
  312bda:      	bswap	r11d
  312bdd:      	pxor	xmm2, xmm6
  312be1:      	movdqa	xmmword ptr [rbp - 0x220], xmm2
  312be9:      	movdqa	xmm3, xmmword ptr [rbp - 0x200]
  312bf1:      	aesenc	xmm12, xmm3
  312bf7:      	aesenc	xmm14, xmm3
  312bfd:      	movdqa	xmm6, xmmword ptr [rbp - 0x1f0]
  312c05:      	aesenc	xmm12, xmm6
  312c0b:      	aesenc	xmm14, xmm6
  312c11:      	movdqa	xmm0, xmmword ptr [rbp - 0x1b0]
  312c19:      	aesenc	xmm12, xmm0
  312c1f:      	aesenc	xmm14, xmm0
  312c25:      	movdqa	xmm8, xmmword ptr [rbp - 0x1e0]
  312c2e:      	aesenc	xmm12, xmm8
  312c34:      	aesenc	xmm14, xmm8
  312c3a:      	movdqa	xmm0, xmmword ptr [rbp - 0x190]
  312c42:      	aesenc	xmm12, xmm0
  312c48:      	aesenc	xmm14, xmm0
  312c4e:      	movdqa	xmm0, xmmword ptr [rbp - 0x10]
  312c53:      	aesenc	xmm12, xmm0
  312c59:      	aesenc	xmm14, xmm0
  312c5f:      	movdqa	xmm1, xmmword ptr [rbp - 0xd0]
  312c67:      	aesenclast	xmm12, xmm1
  312c6d:      	movdqu	xmm0, xmmword ptr [rsi - 0x70]
  312c72:      	aesenclast	xmm14, xmm1
  312c78:      	pxor	xmm0, xmm12
  312c7d:      	movdqa	xmmword ptr [rbp - 0x210], xmm0
  312c85:      	movdqu	xmmword ptr [rsi - 0x70], xmm0
  312c8a:      	movdqu	xmm1, xmmword ptr [rsi - 0x60]
  312c8f:      	pxor	xmm1, xmm14
  312c94:      	movd	xmm12, r11d
  312c99:      	pslldq	xmm12, 0xc              # xmm12 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm12[0,1,2,3]
  312c9f:      	aesenc	xmm11, xmm10
  312ca5:      	pxor	xmm12, xmm13
  312caa:      	lea	r11d, [r10 - 0x3]
  312cae:      	movdqa	xmm2, xmm7
  312cb2:      	aesenc	xmm11, xmm7
  312cb8:      	bswap	r11d
  312cbb:      	movdqa	xmm7, xmm4
  312cbf:      	aesenc	xmm11, xmm4
  312cc5:      	movdqa	xmm0, xmm5
  312cc9:      	aesenc	xmm11, xmm5
  312ccf:      	aesenc	xmm11, xmm15
  312cd5:      	movdqa	xmm4, xmmword ptr [rbp - 0x170]
  312cdd:      	aesenc	xmm11, xmm4
  312ce3:      	aesenc	xmm11, xmm9
  312ce9:      	aesenc	xmm11, xmm3
  312cef:      	movdqa	xmm14, xmm6
  312cf4:      	aesenc	xmm11, xmm6
  312cfa:      	movdqa	xmm5, xmmword ptr [rbp - 0x1b0]
  312d02:      	aesenc	xmm11, xmm5
  312d08:      	movdqa	xmm6, xmm8
  312d0d:      	aesenc	xmm11, xmm8
  312d13:      	movdqa	xmm8, xmmword ptr [rbp - 0x190]
  312d1c:      	aesenc	xmm11, xmm8
  312d22:      	aesenc	xmm11, xmmword ptr [rbp - 0x10]
  312d29:      	aesenclast	xmm11, xmmword ptr [rbp - 0xd0]
  312d33:      	movdqu	xmmword ptr [rsi - 0x60], xmm1
  312d38:      	movdqu	xmm1, xmmword ptr [rsi - 0x50]
  312d3d:      	pxor	xmm1, xmm11
  312d42:      	movd	xmm11, r11d
  312d47:      	pslldq	xmm11, 0xc              # xmm11 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm11[0,1,2,3]
  312d4d:      	aesenc	xmm12, xmm10
  312d53:      	pxor	xmm11, xmm13
  312d58:      	lea	r11d, [r10 - 0x2]
  312d5c:      	aesenc	xmm12, xmm2
  312d62:      	bswap	r11d
  312d65:      	aesenc	xmm12, xmm7
  312d6b:      	aesenc	xmm12, xmm0
  312d71:      	movdqa	xmm13, xmm15
  312d76:      	aesenc	xmm12, xmm15
  312d7c:      	movdqa	xmm10, xmm4
  312d81:      	aesenc	xmm12, xmm4
  312d87:      	aesenc	xmm12, xmm9
  312d8d:      	aesenc	xmm12, xmm3
  312d93:      	movdqa	xmm9, xmm3
  312d98:      	movdqa	xmm3, xmm14
  312d9d:      	aesenc	xmm12, xmm14
  312da3:      	movdqa	xmm15, xmm5
  312da8:      	aesenc	xmm12, xmm5
  312dae:      	movdqa	xmm4, xmm6
  312db2:      	aesenc	xmm12, xmm6
  312db8:      	movdqa	xmm5, xmm8
  312dbd:      	aesenc	xmm12, xmm8
  312dc3:      	movdqa	xmm6, xmmword ptr [rbp - 0x10]
  312dc8:      	aesenc	xmm12, xmm6
  312dce:      	movdqa	xmm8, xmmword ptr [rbp - 0xd0]
  312dd7:      	aesenclast	xmm12, xmm8
  312ddd:      	movdqu	xmmword ptr [rsi - 0x50], xmm1
  312de2:      	movdqu	xmm1, xmmword ptr [rsi - 0x40]
  312de7:      	pxor	xmm1, xmm12
  312dec:      	movd	xmm12, r11d
  312df1:      	pslldq	xmm12, 0xc              # xmm12 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm12[0,1,2,3]
  312df7:      	aesenc	xmm11, xmmword ptr [rbp - 0xc0]
  312e01:      	pxor	xmm12, xmmword ptr [rbp - 0xe0]
  312e0a:      	lea	r11d, [r10 - 0x1]
  312e0e:      	aesenc	xmm11, xmm2
  312e14:      	bswap	r11d
  312e17:      	aesenc	xmm11, xmm7
  312e1d:      	aesenc	xmm11, xmm0
  312e23:      	movdqa	xmm7, xmm0
  312e27:      	aesenc	xmm11, xmm13
  312e2d:      	aesenc	xmm11, xmm10
  312e33:      	movdqa	xmm13, xmmword ptr [rbp - 0xb0]
  312e3c:      	aesenc	xmm11, xmm13
  312e42:      	movdqa	xmm14, xmm9
  312e47:      	aesenc	xmm11, xmm9
  312e4d:      	aesenc	xmm11, xmm3
  312e53:      	movdqa	xmm9, xmm15
  312e58:      	aesenc	xmm11, xmm15
  312e5e:      	aesenc	xmm11, xmm4
  312e64:      	aesenc	xmm11, xmm5
  312e6a:      	aesenc	xmm11, xmm6
  312e70:      	aesenclast	xmm11, xmm8
  312e76:      	movdqu	xmmword ptr [rsi - 0x40], xmm1
  312e7b:      	movdqu	xmm1, xmmword ptr [rsi - 0x30]
  312e80:      	pxor	xmm1, xmm11
  312e85:      	movd	xmm11, r11d
  312e8a:      	pslldq	xmm11, 0xc              # xmm11 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm11[0,1,2,3]
  312e90:      	movdqa	xmm0, xmmword ptr [rbp - 0xc0]
  312e98:      	aesenc	xmm12, xmm0
  312e9e:      	movdqa	xmm15, xmmword ptr [rbp - 0xe0]
  312ea7:      	pxor	xmm11, xmm15
  312eac:      	mov	r11d, r10d
  312eaf:      	aesenc	xmm12, xmm2
  312eb5:      	bswap	r11d
  312eb8:      	movdqa	xmm2, xmmword ptr [rbp - 0x1c0]
  312ec0:      	aesenc	xmm12, xmm2
  312ec6:      	aesenc	xmm12, xmm7
  312ecc:      	movdqa	xmm7, xmmword ptr [rbp - 0x180]
  312ed4:      	aesenc	xmm12, xmm7
  312eda:      	aesenc	xmm12, xmm10
  312ee0:      	aesenc	xmm12, xmm13
  312ee6:      	aesenc	xmm12, xmm14
  312eec:      	aesenc	xmm12, xmm3
  312ef2:      	aesenc	xmm12, xmm9
  312ef8:      	aesenc	xmm12, xmm4
  312efe:      	aesenc	xmm12, xmm5
  312f04:      	aesenc	xmm12, xmm6
  312f0a:      	aesenclast	xmm12, xmm8
  312f10:      	movdqu	xmmword ptr [rsi - 0x30], xmm1
  312f15:      	movdqu	xmm13, xmmword ptr [rsi - 0x20]
  312f1b:      	pxor	xmm13, xmm12
  312f20:      	movd	xmm12, r11d
  312f25:      	pslldq	xmm12, 0xc              # xmm12 = zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,xmm12[0,1,2,3]
  312f2b:      	movdqa	xmm1, xmm0
  312f2f:      	aesenc	xmm11, xmm0
  312f35:      	pxor	xmm12, xmm15
  312f3a:      	movdqa	xmm0, xmmword ptr [rbp - 0x1d0]
  312f42:      	aesenc	xmm11, xmm0
  312f48:      	aesenc	xmm12, xmm1
  312f4e:      	aesenc	xmm11, xmm2
  312f54:      	aesenc	xmm12, xmm0
  312f5a:      	movdqa	xmm0, xmmword ptr [rbp - 0x1a0]
  312f62:      	aesenc	xmm11, xmm0
  312f68:      	aesenc	xmm12, xmm2
  312f6e:      	aesenc	xmm11, xmm7
  312f74:      	aesenc	xmm12, xmm0
  312f7a:      	aesenc	xmm11, xmm10
  312f80:      	aesenc	xmm12, xmm7
  312f86:      	movdqa	xmm1, xmmword ptr [rbp - 0xb0]
  312f8e:      	aesenc	xmm11, xmm1
  312f94:      	aesenc	xmm12, xmm10
  312f9a:      	aesenc	xmm11, xmm14
  312fa0:      	aesenc	xmm12, xmm1
  312fa6:      	aesenc	xmm11, xmm3
  312fac:      	aesenc	xmm12, xmm14
  312fb2:      	aesenc	xmm11, xmm9
  312fb8:      	aesenc	xmm12, xmm3
  312fbe:      	aesenc	xmm11, xmm4
  312fc4:      	aesenc	xmm12, xmm9
  312fca:      	aesenc	xmm12, xmm4
  312fd0:      	aesenc	xmm11, xmm5
  312fd6:      	aesenc	xmm12, xmm5
  312fdc:      	movdqa	xmm7, xmmword ptr [rbp - 0x210]
  312fe4:      	aesenc	xmm11, xmm6
  312fea:      	aesenc	xmm12, xmm6
  312ff0:      	aesenclast	xmm11, xmm8
  312ff6:      	movdqu	xmmword ptr [rsi - 0x20], xmm13
  312ffc:      	aesenclast	xmm12, xmm8
  313002:      	movdqu	xmm1, xmmword ptr [rsi - 0x10]
  313007:      	pxor	xmm1, xmm11
  31300c:      	movdqa	xmm0, xmmword ptr [rbp - 0x230]
  313014:      	movdqa	xmm11, xmm0
  313019:      	movdqa	xmm2, xmmword ptr [rbp - 0x240]
  313021:      	pxor	xmm11, xmm2
  313026:      	movdqu	xmmword ptr [rsi - 0x10], xmm1
  31302b:      	pxor	xmm11, xmmword ptr [rbp - 0x220]
  313034:      	movdqa	xmm1, xmm11
  313039:      	pslldq	xmm1, 0x8               # xmm1 = zero,zero,zero,zero,zero,zero,zero,zero,xmm1[0,1,2,3,4,5,6,7]
  31303e:      	movdqu	xmm10, xmmword ptr [rsi]
  313043:      	pxor	xmm1, xmm0
  313047:      	psrldq	xmm11, 0x8              # xmm11 = xmm11[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero
  31304d:      	pshufd	xmm9, xmm1, 0x4e        # xmm9 = xmm1[2,3,0,1]
  313053:      	pxor	xmm10, xmm12
  313058:      	movq	xmm12, rdx
  31305d:      	pclmulqdq	xmm1, xmm12, 0x0
  313064:      	pxor	xmm1, xmm9
  313069:      	pshufd	xmm9, xmm1, 0x4e        # xmm9 = xmm1[2,3,0,1]
  31306f:      	pxor	xmm9, xmm11
  313074:      	pclmulqdq	xmm1, xmm12, 0x0
  31307b:      	pxor	xmm9, xmm2
  313080:      	movdqu	xmmword ptr [rsi], xmm10
  313085:      	pxor	xmm9, xmm1
  31308a:      	add	r10d, 0x8
  31308e:      	sub	rsi, -0x80
  313092:      	dec	rdi
  313095:      	jne	0x312890 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, false>+0x650>
  31309b:      	shl	rax, 0x7
  31309f:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x80]
  3130a6:      	movdqa	xmm0, xmmword ptr [rip - 0x266dee] # 0xac2c0 <anon.b7273dc156aa3f0d7dcd3f2ed21a0fc3.10.llvm.14024894901458550281+0x1f0>
  3130ae:      	pshufb	xmm3, xmm0
  3130b3:      	pxor	xmm3, xmm9
  3130b8:      	movdqa	xmm2, xmm3
  3130bc:      	movdqa	xmm8, xmmword ptr [rbp - 0xa0]
  3130c5:      	pclmulqdq	xmm2, xmm8, 0x0
  3130cc:      	pclmulqdq	xmm8, xmm3, 0x11
  3130d3:      	pshufd	xmm1, xmm3, 0xee        # xmm1 = xmm3[2,3,2,3]
  3130d8:      	pxor	xmm1, xmm3
  3130dc:      	pclmulqdq	xmm1, xmmword ptr [rbp - 0x120], 0x0
  3130e6:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x70]
  3130ed:      	pshufb	xmm3, xmm0
  3130f2:      	movdqa	xmm4, xmm3
  3130f6:      	movdqa	xmm7, xmmword ptr [rbp - 0x90]
  3130fe:      	pclmulqdq	xmm4, xmm7, 0x0
  313104:      	pclmulqdq	xmm7, xmm3, 0x11
  31310a:      	pshufd	xmm5, xmm3, 0xee        # xmm5 = xmm3[2,3,2,3]
  31310f:      	pxor	xmm5, xmm3
  313113:      	pclmulqdq	xmm5, xmmword ptr [rbp - 0x110], 0x0
  31311d:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x60]
  313124:      	pshufb	xmm3, xmm0
  313129:      	movdqa	xmm6, xmm3
  31312d:      	movdqa	xmm9, xmmword ptr [rbp - 0x70]
  313133:      	pclmulqdq	xmm6, xmm9, 0x0
  31313a:      	pxor	xmm6, xmm4
  31313e:      	pclmulqdq	xmm9, xmm3, 0x11
  313145:      	pxor	xmm9, xmm7
  31314a:      	pshufd	xmm4, xmm3, 0xee        # xmm4 = xmm3[2,3,2,3]
  31314f:      	pxor	xmm4, xmm3
  313153:      	pclmulqdq	xmm4, xmmword ptr [rbp - 0x130], 0x0
  31315d:      	pxor	xmm4, xmm5
  313161:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x50]
  313168:      	pshufb	xmm3, xmm0
  31316d:      	movdqa	xmm5, xmm3
  313171:      	movdqa	xmm7, xmmword ptr [rbp - 0x60]
  313176:      	pclmulqdq	xmm5, xmm7, 0x0
  31317c:      	pxor	xmm5, xmm6
  313180:      	pclmulqdq	xmm7, xmm3, 0x11
  313186:      	pxor	xmm7, xmm9
  31318b:      	pshufd	xmm6, xmm3, 0xee        # xmm6 = xmm3[2,3,2,3]
  313190:      	pxor	xmm6, xmm3
  313194:      	pclmulqdq	xmm6, xmmword ptr [rbp - 0x140], 0x0
  31319e:      	pxor	xmm6, xmm4
  3131a2:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x40]
  3131a9:      	pshufb	xmm3, xmm0
  3131ae:      	movdqa	xmm4, xmm3
  3131b2:      	movdqa	xmm9, xmmword ptr [rbp - 0x50]
  3131b8:      	pclmulqdq	xmm4, xmm9, 0x0
  3131bf:      	pxor	xmm4, xmm5
  3131c3:      	pclmulqdq	xmm9, xmm3, 0x11
  3131ca:      	pxor	xmm9, xmm7
  3131cf:      	pshufd	xmm5, xmm3, 0xee        # xmm5 = xmm3[2,3,2,3]
  3131d4:      	pxor	xmm5, xmm3
  3131d8:      	pclmulqdq	xmm5, xmmword ptr [rbp - 0x160], 0x0
  3131e2:      	pxor	xmm5, xmm6
  3131e6:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x30]
  3131ed:      	pshufb	xmm3, xmm0
  3131f2:      	movdqa	xmm6, xmm3
  3131f6:      	movdqa	xmm7, xmmword ptr [rbp - 0x30]
  3131fb:      	pclmulqdq	xmm6, xmm7, 0x0
  313201:      	pxor	xmm6, xmm4
  313205:      	pclmulqdq	xmm7, xmm3, 0x11
  31320b:      	pxor	xmm7, xmm9
  313210:      	pshufd	xmm4, xmm3, 0xee        # xmm4 = xmm3[2,3,2,3]
  313215:      	pxor	xmm4, xmm3
  313219:      	pclmulqdq	xmm4, xmmword ptr [rbp - 0xf0], 0x0
  313223:      	pxor	xmm4, xmm5
  313227:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x20]
  31322e:      	pshufb	xmm3, xmm0
  313233:      	movdqa	xmm5, xmm3
  313237:      	movdqa	xmm9, xmmword ptr [rbp - 0x40]
  31323d:      	pclmulqdq	xmm5, xmm9, 0x0
  313244:      	pxor	xmm5, xmm6
  313248:      	pclmulqdq	xmm9, xmm3, 0x11
  31324f:      	pxor	xmm9, xmm7
  313254:      	pshufd	xmm6, xmm3, 0xee        # xmm6 = xmm3[2,3,2,3]
  313259:      	pxor	xmm6, xmm3
  31325d:      	pclmulqdq	xmm6, xmmword ptr [rbp - 0x100], 0x0
  313267:      	pxor	xmm6, xmm4
  31326b:      	movdqu	xmm3, xmmword ptr [r8 + rax - 0x10]
  313272:      	pshufb	xmm3, xmm0
  313277:      	movdqa	xmm4, xmm3
  31327b:      	movdqa	xmm7, xmmword ptr [rbp - 0x80]
  313280:      	pclmulqdq	xmm4, xmm7, 0x0
  313286:      	pxor	xmm4, xmm5
  31328a:      	pxor	xmm4, xmm2
  31328e:      	pclmulqdq	xmm7, xmm3, 0x11
  313294:      	pxor	xmm7, xmm9
  313299:      	pxor	xmm7, xmm8
  31329e:      	pshufd	xmm2, xmm3, 0xee        # xmm2 = xmm3[2,3,2,3]
  3132a3:      	pxor	xmm2, xmm3
  3132a7:      	pclmulqdq	xmm2, xmmword ptr [rbp - 0x150], 0x0
  3132b1:      	pxor	xmm2, xmm6
  3132b5:      	pxor	xmm2, xmm4
  3132b9:      	pxor	xmm2, xmm1
  3132bd:      	pxor	xmm2, xmm7
  3132c1:      	movdqa	xmm1, xmm2
  3132c5:      	pslldq	xmm1, 0x8               # xmm1 = zero,zero,zero,zero,zero,zero,zero,zero,xmm1[0,1,2,3,4,5,6,7]
  3132ca:      	pxor	xmm1, xmm4
  3132ce:      	psrldq	xmm2, 0x8               # xmm2 = xmm2[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero
  3132d3:      	pshufd	xmm3, xmm1, 0x4e        # xmm3 = xmm1[2,3,0,1]
  3132d8:      	movq	xmm4, rdx
  3132dd:      	pclmulqdq	xmm1, xmm4, 0x0
  3132e3:      	pxor	xmm1, xmm3
  3132e7:      	pshufd	xmm3, xmm1, 0x4e        # xmm3 = xmm1[2,3,0,1]
  3132ec:      	pxor	xmm3, xmm2
  3132f0:      	pclmulqdq	xmm1, xmm4, 0x0
  3132f6:      	pxor	xmm3, xmm7
  3132fa:      	pxor	xmm3, xmm1
  3132fe:      	pshufb	xmm3, xmm0
  313303:      	movdqu	xmmword ptr [rcx], xmm3
  313307:      	movabs	rax, 0x7fffffffffffff80
  313311:      	and	r9, rax
  313314:      	jmp	0x313319 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, false>+0x10d9>
  313316:      	xor	r9d, r9d
  313319:      	mov	rax, r9
  31331c:      	add	rsp, 0x240
  313323:      	pop	rbp
  313324:      	ret
  313325:      	lea	rdi, [rip - 0x206f89]   # 0x10c3a3 <anon.8182237a801038de36885de64d2c176c.5.llvm.10465402473772549265>
  31332c:      	lea	rcx, [rip + 0x4f1d3d]   # 0x805070 <anon.8182237a801038de36885de64d2c176c.1.llvm.10465402473772549265>
  313333:      	mov	esi, 0x237
  313338:      	xor	edx, edx
  31333a:      	call	qword ptr [rip + 0x565200] # 0x878540 <sdallocx+0x878540>
