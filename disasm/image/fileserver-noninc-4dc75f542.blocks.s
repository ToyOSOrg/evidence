
$SCRATCH/poly1305-inline/image/fileserver-noninc-4dc75f542:	file format elf64-x86-64

Disassembly of section .text:

00000000001133f0 <toyos_crypto::arch::x86_64::poly1305::blocks>:
  1133f0:      	pushq	%rbp
  1133f1:      	movq	%rsp, %rbp
  1133f4:      	pushq	%r15
  1133f6:      	pushq	%r14
  1133f8:      	pushq	%r13
  1133fa:      	pushq	%r12
  1133fc:      	pushq	%rbx
  1133fd:      	andq	$-0x20, %rsp
  113401:      	subq	$0x760, %rsp            # imm = 0x760
  113408:      	movq	%rdx, %r15
  11340b:      	movq	(%rdi), %r14
  11340e:      	movq	0x8(%rdi), %r9
  113412:      	movq	0x10(%rdi), %r12
  113416:      	movq	(%rsi), %rdi
  113419:      	movq	0x8(%rsi), %rax
  11341d:      	movl	%edi, %edx
  11341f:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  113425:      	movq	%rax, %r8
  113428:      	shldq	$0xc, %rdi, %r8
  11342d:      	shrq	$0x1a, %rdi
  113431:      	andl	$0x3ffffff, %edi        # imm = 0x3FFFFFF
  113437:      	andl	$0x3ffffff, %r8d        # imm = 0x3FFFFFF
  11343e:      	shrq	$0xe, %rax
  113442:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  113447:      	vmovd	%edx, %xmm0
  11344b:      	vmovq	0xd(%rsi), %xmm1
  113450:      	vmovdqa	%ymm0, 0x220(%rsp)
  113459:      	vmovd	%edi, %xmm0
  11345d:      	vmovdqa	%ymm0, 0x240(%rsp)
  113466:      	vmovd	%r8d, %xmm0
  11346b:      	vmovdqa	%ymm0, 0x260(%rsp)
  113474:      	vmovd	%eax, %xmm0
  113478:      	vmovdqa	%ymm0, 0x280(%rsp)
  113481:      	vmovdqa	%ymm1, 0x2a0(%rsp)
  11348a:      	movq	%rcx, %r13
  11348d:      	shrq	$0x3, %r13
  113491:      	je	0x1147ff <toyos_crypto::arch::x86_64::poly1305::blocks+0x140f>
  113497:      	movq	%rsi, 0xa8(%rsp)
  11349f:      	movq	%rcx, 0xb0(%rsp)
  1134a7:      	movq	%r12, %rax
  1134aa:      	mulq	%r9
  1134ad:      	movq	%rdx, %rdi
  1134b0:      	movq	%r9, %rcx
  1134b3:      	movq	%rax, %r9
  1134b6:      	movq	%r14, %rax
  1134b9:      	mulq	%r14
  1134bc:      	movq	%rdx, %r10
  1134bf:      	movq	%rax, %rsi
  1134c2:      	addq	%r9, %rsi
  1134c5:      	adcq	%rdi, %r10
  1134c8:      	movq	%r14, %rax
  1134cb:      	mulq	%rcx
  1134ce:      	movq	%rcx, %r8
  1134d1:      	movq	%rcx, 0x40(%rsp)
  1134d6:      	shldq	$0x1, %rax, %rdx
  1134db:      	addq	%rax, %rax
  1134de:      	addq	%r10, %rax
  1134e1:      	adcq	$0x0, %rdx
  1134e5:      	movl	%edx, %edi
  1134e7:      	andl	$0x3, %edi
  1134ea:      	shrq	$0x2, %rdx
  1134ee:      	leaq	(%rdx,%rdx,4), %rbx
  1134f2:      	addq	%rsi, %rbx
  1134f5:      	adcq	$0x0, %rax
  1134f9:      	movq	%rdi, %rcx
  1134fc:      	adcq	$0x0, %rcx
  113500:      	movq	%rcx, 0x80(%rsp)
  113508:      	movq	%rax, %r11
  11350b:      	movq	%rax, 0x200(%rsp)
  113513:      	mulq	%r14
  113516:      	movq	%rax, %rdi
  113519:      	movq	%rdx, %r9
  11351c:      	imulq	%r14, %rcx
  113520:      	movq	%rbx, %rax
  113523:      	movq	%rbx, 0x1c0(%rsp)
  11352b:      	mulq	%r8
  11352e:      	movq	%rdx, %rsi
  113531:      	movq	%rax, %r10
  113534:      	addq	%rdi, %r10
  113537:      	adcq	%r9, %rsi
  11353a:      	movq	%r11, %rax
  11353d:      	movq	%r12, 0x60(%rsp)
  113542:      	mulq	%r12
  113545:      	movq	%rdx, %r9
  113548:      	movq	%rax, %r11
  11354b:      	movq	%rbx, %rax
  11354e:      	mulq	%r14
  113551:      	movq	%rdx, %rbx
  113554:      	movq	%rax, %rdi
  113557:      	addq	%r11, %rdi
  11355a:      	adcq	%r9, %rbx
  11355d:      	addq	%r10, %rbx
  113560:      	adcq	$0x0, %rsi
  113564:      	movq	0x80(%rsp), %rax
  11356c:      	mulq	%r12
  11356f:      	addq	%rbx, %rax
  113572:      	adcq	%rsi, %rdx
  113575:      	addq	%rcx, %rdx
  113578:      	movl	%edx, %r8d
  11357b:      	andl	$0x3, %r8d
  11357f:      	shrq	$0x2, %rdx
  113583:      	leaq	(%rdx,%rdx,4), %rbx
  113587:      	addq	%rdi, %rbx
  11358a:      	adcq	$0x0, %rax
  11358e:      	adcq	$0x0, %r8
  113592:      	movq	%r8, %rcx
  113595:      	movq	%r8, 0x1e0(%rsp)
  11359d:      	movq	%rax, %r11
  1135a0:      	movq	%rax, 0x1a0(%rsp)
  1135a8:      	movq	%r14, %r12
  1135ab:      	mulq	%r14
  1135ae:      	movq	%rax, %rdi
  1135b1:      	movq	%rdx, %r9
  1135b4:      	imulq	%r14, %rcx
  1135b8:      	movq	%r14, 0xb8(%rsp)
  1135c0:      	movq	%rbx, %rax
  1135c3:      	movq	%rbx, 0x180(%rsp)
  1135cb:      	mulq	0x40(%rsp)
  1135d0:      	movq	%rdx, %rsi
  1135d3:      	movq	%rax, %r10
  1135d6:      	addq	%rdi, %r10
  1135d9:      	adcq	%r9, %rsi
  1135dc:      	movq	%r11, %rax
  1135df:      	movq	0x60(%rsp), %r14
  1135e4:      	mulq	%r14
  1135e7:      	movq	%rdx, %r9
  1135ea:      	movq	%rax, %r11
  1135ed:      	movq	%rbx, %rax
  1135f0:      	mulq	%r12
  1135f3:      	movq	%rdx, %rbx
  1135f6:      	movq	%rax, %rdi
  1135f9:      	addq	%r11, %rdi
  1135fc:      	adcq	%r9, %rbx
  1135ff:      	addq	%r10, %rbx
  113602:      	adcq	$0x0, %rsi
  113606:      	movq	%r8, %rax
  113609:      	mulq	%r14
  11360c:      	addq	%rbx, %rax
  11360f:      	movq	%rax, %r9
  113612:      	adcq	%rsi, %rdx
  113615:      	addq	%rcx, %rdx
  113618:      	movl	%edx, %eax
  11361a:      	andl	$0x3, %eax
  11361d:      	shrq	$0x2, %rdx
  113621:      	leaq	(%rdx,%rdx,4), %rsi
  113625:      	addq	%rdi, %rsi
  113628:      	adcq	$0x0, %r9
  11362c:      	movq	%r9, %r10
  11362f:      	adcq	$0x0, %rax
  113633:      	movq	%rax, %r12
  113636:      	movq	%rax, 0x3a0(%rsp)
  11363e:      	mulq	%r14
  113641:      	movq	%r14, %rdi
  113644:      	movq	%rdx, 0x160(%rsp)
  11364c:      	movq	%rax, 0x38(%rsp)
  113651:      	movq	%rsi, %rax
  113654:      	movq	%rsi, 0x380(%rsp)
  11365c:      	movq	0x40(%rsp), %r8
  113661:      	mulq	%r8
  113664:      	movq	%rdx, %r9
  113667:      	movq	%rax, %r11
  11366a:      	movq	%r10, %rcx
  11366d:      	movq	%r10, 0x3c0(%rsp)
  113675:      	movq	%r10, %rax
  113678:      	movq	0xb8(%rsp), %r14
  113680:      	mulq	%r14
  113683:      	movq	%rdx, %r10
  113686:      	movq	%rax, %rbx
  113689:      	addq	%r11, %rbx
  11368c:      	adcq	%r9, %r10
  11368f:      	movq	%rsi, %rax
  113692:      	mulq	%r14
  113695:      	movq	%rdx, %r9
  113698:      	movq	%rax, %r11
  11369b:      	movq	%rcx, %rax
  11369e:      	movq	%rdi, %rsi
  1136a1:      	mulq	%rdi
  1136a4:      	addq	%r11, %rax
  1136a7:      	adcq	%r9, %rdx
  1136aa:      	addq	%rbx, %rdx
  1136ad:      	adcq	$0x0, %r10
  1136b1:      	addq	0x38(%rsp), %rdx
  1136b6:      	adcq	0x160(%rsp), %r10
  1136be:      	movq	%r12, %rdi
  1136c1:      	imulq	%r14, %rdi
  1136c5:      	addq	%r10, %rdi
  1136c8:      	movq	%rdi, %rcx
  1136cb:      	shrq	$0x2, %rcx
  1136cf:      	leaq	(%rcx,%rcx,4), %r12
  1136d3:      	andl	$0x3, %edi
  1136d6:      	addq	%rax, %r12
  1136d9:      	movq	%rdx, %rcx
  1136dc:      	adcq	$0x0, %rcx
  1136e0:      	adcq	$0x0, %rdi
  1136e4:      	movq	%rdi, %rax
  1136e7:      	movq	%rdi, 0x160(%rsp)
  1136ef:      	mulq	%rsi
  1136f2:      	movq	%rdx, 0x30(%rsp)
  1136f7:      	movq	%rax, 0x28(%rsp)
  1136fc:      	movq	%r12, 0x360(%rsp)
  113704:      	movq	%r12, %rax
  113707:      	mulq	%r8
  11370a:      	movq	%rdx, %r9
  11370d:      	movq	%rax, %r10
  113710:      	movq	%rcx, %rax
  113713:      	movq	%rcx, 0x38(%rsp)
  113718:      	mulq	%r14
  11371b:      	movq	%rdx, %rbx
  11371e:      	movq	%rax, %r11
  113721:      	addq	%r10, %r11
  113724:      	adcq	%r9, %rbx
  113727:      	movq	%r12, %rax
  11372a:      	mulq	%r14
  11372d:      	movq	%r14, %r10
  113730:      	movq	%rdx, %r9
  113733:      	movq	%rax, %r12
  113736:      	movq	%rcx, %rax
  113739:      	mulq	%rsi
  11373c:      	movq	%rdx, %r14
  11373f:      	addq	%r12, %rax
  113742:      	adcq	%r9, %r14
  113745:      	addq	%r11, %r14
  113748:      	adcq	$0x0, %rbx
  11374c:      	addq	0x28(%rsp), %r14
  113751:      	adcq	0x30(%rsp), %rbx
  113756:      	movq	%r10, %rsi
  113759:      	imulq	%r10, %rdi
  11375d:      	addq	%rbx, %rdi
  113760:      	movq	%rdi, %rcx
  113763:      	shrq	$0x2, %rcx
  113767:      	leaq	(%rcx,%rcx,4), %r10
  11376b:      	andl	$0x3, %edi
  11376e:      	addq	%rax, %r10
  113771:      	adcq	$0x0, %r14
  113775:      	adcq	$0x0, %rdi
  113779:      	movq	%rdi, %rax
  11377c:      	movq	%rdi, 0x30(%rsp)
  113781:      	movq	0x60(%rsp), %r11
  113786:      	mulq	%r11
  113789:      	movq	%rdx, 0x20(%rsp)
  11378e:      	movq	%rax, 0x18(%rsp)
  113793:      	movq	%r10, %rax
  113796:      	movq	%r10, 0x28(%rsp)
  11379b:      	mulq	%r8
  11379e:      	movq	%rdx, %r9
  1137a1:      	movq	%rax, %rbx
  1137a4:      	movq	%r14, %rax
  1137a7:      	mulq	%rsi
  1137aa:      	movq	%rdx, %r12
  1137ad:      	movq	%rax, %rcx
  1137b0:      	addq	%rbx, %rcx
  1137b3:      	adcq	%r9, %r12
  1137b6:      	movq	%r10, %rax
  1137b9:      	mulq	%rsi
  1137bc:      	movq	%rsi, %r8
  1137bf:      	movq	%rdx, %r9
  1137c2:      	movq	%rax, %rsi
  1137c5:      	movq	%r14, %rax
  1137c8:      	mulq	%r11
  1137cb:      	movq	%r11, %r10
  1137ce:      	movq	%rdx, %rbx
  1137d1:      	addq	%rsi, %rax
  1137d4:      	adcq	%r9, %rbx
  1137d7:      	addq	%rcx, %rbx
  1137da:      	adcq	$0x0, %r12
  1137de:      	addq	0x18(%rsp), %rbx
  1137e3:      	adcq	0x20(%rsp), %r12
  1137e8:      	movq	%rdi, %r11
  1137eb:      	imulq	%r8, %r11
  1137ef:      	addq	%r12, %r11
  1137f2:      	movq	%r11, %rcx
  1137f5:      	shrq	$0x2, %rcx
  1137f9:      	leaq	(%rcx,%rcx,4), %r12
  1137fd:      	andl	$0x3, %r11d
  113801:      	addq	%rax, %r12
  113804:      	adcq	$0x0, %rbx
  113808:      	adcq	$0x0, %r11
  11380c:      	movq	%r11, %rax
  11380f:      	mulq	%r10
  113812:      	movq	%rdx, 0x20(%rsp)
  113817:      	movq	%rax, 0x18(%rsp)
  11381c:      	movq	%r12, %rax
  11381f:      	mulq	0x40(%rsp)
  113824:      	movq	%rdx, %rsi
  113827:      	movq	%rax, %rcx
  11382a:      	movq	%rbx, %rax
  11382d:      	mulq	%r8
  113830:      	movq	%r8, %rdi
  113833:      	movq	%rdx, %r9
  113836:      	movq	%rax, %r8
  113839:      	addq	%rcx, %r8
  11383c:      	adcq	%rsi, %r9
  11383f:      	movq	%r12, %rax
  113842:      	mulq	%rdi
  113845:      	movq	%rdx, %rcx
  113848:      	movq	%rax, %rsi
  11384b:      	movq	%rbx, %rax
  11384e:      	mulq	%r10
  113851:      	addq	%rsi, %rax
  113854:      	adcq	%rcx, %rdx
  113857:      	addq	%r8, %rdx
  11385a:      	adcq	$0x0, %r9
  11385e:      	addq	0x18(%rsp), %rdx
  113863:      	adcq	0x20(%rsp), %r9
  113868:      	movq	%r11, %rcx
  11386b:      	imulq	%rdi, %rcx
  11386f:      	addq	%r9, %rcx
  113872:      	movq	%rcx, %rsi
  113875:      	shrq	$0x2, %rsi
  113879:      	leaq	(%rsi,%rsi,4), %rsi
  11387d:      	andl	$0x3, %ecx
  113880:      	addq	%rax, %rsi
  113883:      	adcq	$0x0, %rdx
  113887:      	adcq	$0x0, %rcx
  11388b:      	movl	%esi, %r8d
  11388e:      	andl	$0x3ffffff, %r8d        # imm = 0x3FFFFFF
  113895:      	movq	%rdx, %rax
  113898:      	shldq	$0xc, %rsi, %rax
  11389d:      	shrq	$0x1a, %rsi
  1138a1:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  1138a7:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  1138ac:      	shldq	$0x18, %rdx, %rcx
  1138b1:      	shrq	$0xe, %rdx
  1138b5:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  1138bb:      	movq	%r8, 0x3e0(%rsp)
  1138c3:      	movq	%rsi, 0x3e8(%rsp)
  1138cb:      	movq	%rax, 0x3f0(%rsp)
  1138d3:      	movq	%rdx, 0x3f8(%rsp)
  1138db:      	movq	%rcx, 0x400(%rsp)
  1138e3:      	movq	%r8, 0x408(%rsp)
  1138eb:      	movq	%rsi, 0x410(%rsp)
  1138f3:      	movq	%rax, 0x418(%rsp)
  1138fb:      	vmovdqu	0x3e0(%rsp), %xmm0
  113904:      	vpinsrq	$0x1, %r8, %xmm0, %xmm1
  11390a:      	vmovdqu	0x3e8(%rsp), %xmm0
  113913:      	vpinsrq	$0x1, %rsi, %xmm0, %xmm2
  113919:      	vmovq	%r8, %xmm4
  11391e:      	vmovdqu	0x3f0(%rsp), %xmm3
  113927:      	vmovdqu	0x3f8(%rsp), %xmm5
  113930:      	vmovdqu	0x400(%rsp), %xmm0
  113939:      	movq	%r8, 0x3e0(%rsp)
  113941:      	vmovq	%rsi, %xmm13
  113946:      	vpinsrq	$0x1, %rax, %xmm3, %xmm7
  11394c:      	movq	%rsi, 0x3e8(%rsp)
  113954:      	vmovq	%rax, %xmm12
  113959:      	vpinsrq	$0x1, %rdx, %xmm5, %xmm8
  11395f:      	movq	%rax, 0x3f0(%rsp)
  113967:      	vmovq	%rdx, %xmm11
  11396c:      	movq	%rdx, 0x3f8(%rsp)
  113974:      	movq	0x28(%rsp), %rsi
  113979:      	movl	%esi, %edx
  11397b:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  113981:      	movq	%r14, %rax
  113984:      	shldq	$0xc, %rsi, %rax
  113989:      	shrq	$0x1a, %rsi
  11398d:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  113993:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  113998:      	movq	%rcx, 0x400(%rsp)
  1139a0:      	movq	%rdx, 0x408(%rsp)
  1139a8:      	movq	%rsi, 0x410(%rsp)
  1139b0:      	movq	%rax, 0x418(%rsp)
  1139b8:      	vmovdqu	0x3e0(%rsp), %xmm3
  1139c1:      	vpinsrq	$0x1, %rdx, %xmm3, %xmm6
  1139c7:      	vpinsrq	$0x1, %rcx, %xmm0, %xmm14
  1139cd:      	vmovq	%rcx, %xmm15
  1139d2:      	movl	%r12d, %ecx
  1139d5:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  1139db:      	vmovq	%rcx, %xmm10
  1139e0:      	vmovdqu	0x3e8(%rsp), %xmm0
  1139e9:      	vpinsrq	$0x1, %rsi, %xmm0, %xmm0
  1139ef:      	vmovdqa	%ymm0, 0x60(%rsp)
  1139f5:      	movq	%rbx, %rcx
  1139f8:      	shldq	$0xc, %r12, %rcx
  1139fd:      	movq	0x360(%rsp), %r8
  113a05:      	movl	%r8d, %edx
  113a08:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  113a0e:      	vmovq	%rdx, %xmm3
  113a13:      	shrq	$0x1a, %r12
  113a17:      	andl	$0x3ffffff, %r12d       # imm = 0x3FFFFFF
  113a1e:      	vmovq	%r12, %xmm5
  113a23:      	movq	0x38(%rsp), %rsi
  113a28:      	movq	%rsi, %rdx
  113a2b:      	shldq	$0xc, %r8, %rdx
  113a30:      	shrq	$0x1a, %r8
  113a34:      	andl	$0x3ffffff, %r8d        # imm = 0x3FFFFFF
  113a3b:      	vmovq	%r8, %xmm9
  113a40:      	vpbroadcastq	%xmm4, %ymm4
  113a45:      	vpblendd	$0xf0, %ymm4, %ymm1, %ymm0 # ymm0 = ymm1[0,1,2,3],ymm4[4,5,6,7]
  113a4b:      	vmovdqu	0x3f0(%rsp), %xmm1
  113a54:      	vpinsrq	$0x1, %rax, %xmm1, %xmm1
  113a5a:      	vpbroadcastq	%xmm13, %ymm4
  113a5f:      	vpblendd	$0xf0, %ymm4, %ymm2, %ymm13 # ymm13 = ymm2[0,1,2,3],ymm4[4,5,6,7]
  113a65:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  113a6b:      	vmovq	%rcx, %xmm4
  113a70:      	vpbroadcastq	%xmm12, %ymm2
  113a75:      	vpblendd	$0xf0, %ymm2, %ymm7, %ymm12 # ymm12 = ymm7[0,1,2,3],ymm2[4,5,6,7]
  113a7b:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  113a81:      	vmovq	%rdx, %xmm7
  113a86:      	vpbroadcastq	%xmm11, %ymm2
  113a8b:      	vpblendd	$0xf0, %ymm2, %ymm8, %ymm8 # ymm8 = ymm8[0,1,2,3],ymm2[4,5,6,7]
  113a91:      	movq	0x30(%rsp), %rax
  113a96:      	shldq	$0x18, %r14, %rax
  113a9b:      	shrq	$0xe, %r14
  113a9f:      	andl	$0x3ffffff, %r14d       # imm = 0x3FFFFFF
  113aa6:      	vmovdqu	0x3f8(%rsp), %xmm2
  113aaf:      	vpinsrq	$0x1, %r14, %xmm2, %xmm2
  113ab5:      	vmovdqa	%ymm2, 0x360(%rsp)
  113abe:      	vpbroadcastq	%xmm15, %ymm2
  113ac3:      	vpblendd	$0xf0, %ymm2, %ymm14, %ymm11 # ymm11 = ymm14[0,1,2,3],ymm2[4,5,6,7]
  113ac9:      	shldq	$0x18, %rbx, %r11
  113ace:      	shrq	$0xe, %rbx
  113ad2:      	andl	$0x3ffffff, %ebx        # imm = 0x3FFFFFF
  113ad8:      	vmovq	%rbx, %xmm2
  113add:      	vmovdqa	%ymm0, 0x580(%rsp)
  113ae6:      	vpsllq	$0x2, %ymm13, %ymm0
  113aec:      	vpaddq	%ymm0, %ymm13, %ymm0
  113af0:      	vmovdqa	%ymm13, 0x5a0(%rsp)
  113af9:      	vpsllq	$0x2, %ymm12, %ymm13
  113aff:      	vpaddq	%ymm12, %ymm13, %ymm13
  113b04:      	vmovdqa	%ymm12, 0x5c0(%rsp)
  113b0d:      	vpsllq	$0x2, %ymm8, %ymm12
  113b13:      	vpaddq	%ymm8, %ymm12, %ymm12
  113b18:      	vmovdqa	%ymm8, 0x5e0(%rsp)
  113b21:      	vpsllq	$0x2, %ymm11, %ymm8
  113b27:      	vpaddq	%ymm11, %ymm8, %ymm15
  113b2c:      	vmovdqa	%ymm11, 0x600(%rsp)
  113b35:      	vmovdqu	0x400(%rsp), %xmm8
  113b3e:      	vpinsrq	$0x1, %rax, %xmm8, %xmm8
  113b44:      	vmovdqa	%ymm0, 0x500(%rsp)
  113b4d:      	movq	%rsi, %rax
  113b50:      	movq	0x160(%rsp), %rcx
  113b58:      	shldq	$0x18, %rsi, %rcx
  113b5d:      	shrq	$0xe, %rax
  113b61:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  113b66:      	vmovq	%rax, %xmm14
  113b6b:      	vmovdqa	%ymm13, 0x520(%rsp)
  113b74:      	vmovq	%r11, %xmm13
  113b79:      	vmovdqa	%ymm12, 0x540(%rsp)
  113b82:      	vmovq	%rcx, %xmm12
  113b87:      	movq	0x380(%rsp), %rdx
  113b8f:      	movl	%edx, %eax
  113b91:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  113b96:      	movq	%rax, 0xc0(%rsp)
  113b9e:      	movq	0x3c0(%rsp), %rcx
  113ba6:      	movq	%rcx, %rax
  113ba9:      	shldq	$0xc, %rdx, %rax
  113bae:      	shrq	$0x1a, %rdx
  113bb2:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  113bb8:      	movq	%rdx, 0xc8(%rsp)
  113bc0:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  113bc5:      	movq	%rax, 0xd0(%rsp)
  113bcd:      	vmovdqa	%ymm15, 0x560(%rsp)
  113bd6:      	vpbroadcastq	%xmm10, %ymm0
  113bdb:      	movq	%rcx, %rax
  113bde:      	movq	0x3a0(%rsp), %rsi
  113be6:      	shldq	$0x18, %rcx, %rsi
  113beb:      	vpblendd	$0x30, %ymm0, %ymm6, %ymm0 # ymm0 = ymm6[0,1,2,3],ymm0[4,5],ymm6[6,7]
  113bf1:      	shrq	$0xe, %rax
  113bf5:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  113bfa:      	movq	%rax, 0xd8(%rsp)
  113c02:      	movq	0x1c0(%rsp), %rdx
  113c0a:      	movl	%edx, %ecx
  113c0c:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  113c12:      	movq	%rsi, 0xe0(%rsp)
  113c1a:      	movq	0x200(%rsp), %rsi
  113c22:      	movq	%rsi, %rax
  113c25:      	shldq	$0xc, %rdx, %rax
  113c2a:      	shrq	$0x1a, %rdx
  113c2e:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  113c34:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  113c39:      	movq	%rcx, 0xe8(%rsp)
  113c41:      	movq	%rdx, 0xf0(%rsp)
  113c49:      	movq	%rax, 0xf8(%rsp)
  113c51:      	vmovdqu	0xc0(%rsp), %xmm6
  113c5a:      	vpinsrq	$0x1, %rcx, %xmm6, %xmm11
  113c60:      	movq	0x180(%rsp), %r8
  113c68:      	movl	%r8d, %ecx
  113c6b:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  113c71:      	vmovq	%rcx, %xmm10
  113c76:      	vpbroadcastq	%xmm3, %ymm3
  113c7b:      	vpblendd	$0xc0, %ymm3, %ymm0, %ymm15 # ymm15 = ymm0[0,1,2,3,4,5],ymm3[6,7]
  113c81:      	vpbroadcastq	%xmm5, %ymm0
  113c86:      	vpblendd	$0xcf, 0x60(%rsp), %ymm0, %ymm0 # ymm0 = mem[0,1,2,3],ymm0[4,5],mem[6,7]
  113c8e:      	vpbroadcastq	%xmm9, %ymm5
  113c93:      	vmovdqu	0xc8(%rsp), %xmm3
  113c9c:      	vpinsrq	$0x1, %rdx, %xmm3, %xmm6
  113ca2:      	movq	%rdi, %rdx
  113ca5:      	movl	%edx, %ecx
  113ca7:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  113cad:      	vmovq	%rcx, %xmm3
  113cb2:      	movq	0x1a0(%rsp), %rdi
  113cba:      	movq	%rdi, %rcx
  113cbd:      	shldq	$0xc, %r8, %rcx
  113cc2:      	vpblendd	$0xc0, %ymm5, %ymm0, %ymm9 # ymm9 = ymm0[0,1,2,3,4,5],ymm5[6,7]
  113cc8:      	shrq	$0x1a, %r8
  113ccc:      	andl	$0x3ffffff, %r8d        # imm = 0x3FFFFFF
  113cd3:      	vmovq	%r8, %xmm5
  113cd8:      	vpbroadcastq	%xmm4, %ymm0
  113cdd:      	vpblendd	$0x30, %ymm0, %ymm1, %ymm0 # ymm0 = ymm1[0,1,2,3],ymm0[4,5],ymm1[6,7]
  113ce3:      	vpbroadcastq	%xmm7, %ymm1
  113ce8:      	vpblendd	$0xc0, %ymm1, %ymm0, %ymm0 # ymm0 = ymm0[0,1,2,3,4,5],ymm1[6,7]
  113cee:      	vmovdqu	0xd0(%rsp), %xmm1
  113cf7:      	vpinsrq	$0x1, %rax, %xmm1, %xmm1
  113cfd:      	movq	0x40(%rsp), %r8
  113d02:      	movq	%r8, %rax
  113d05:      	shldq	$0xc, %rdx, %rax
  113d0a:      	shrq	$0x1a, %rdx
  113d0e:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  113d14:      	vmovq	%rdx, %xmm4
  113d19:      	vpbroadcastq	%xmm2, %ymm2
  113d1e:      	vpblendd	$0xcf, 0x360(%rsp), %ymm2, %ymm7 # ymm7 = mem[0,1,2,3],ymm2[4,5],mem[6,7]
  113d29:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  113d2f:      	vmovq	%rcx, %xmm2
  113d34:      	vpbroadcastq	%xmm14, %ymm14
  113d39:      	vpblendd	$0xc0, %ymm14, %ymm7, %ymm14 # ymm14 = ymm7[0,1,2,3,4,5],ymm14[6,7]
  113d3f:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  113d44:      	vmovq	%rax, %xmm7
  113d49:      	vpbroadcastq	%xmm13, %ymm13
  113d4e:      	movq	0x80(%rsp), %rdx
  113d56:      	movq	%rsi, %rax
  113d59:      	shldq	$0x18, %rsi, %rdx
  113d5e:      	vpblendd	$0x30, %ymm13, %ymm8, %ymm13 # ymm13 = ymm8[0,1,2,3],ymm13[4,5],ymm8[6,7]
  113d64:      	shrq	$0xe, %rax
  113d68:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  113d6d:      	vmovdqu	0xd8(%rsp), %xmm8
  113d76:      	vpinsrq	$0x1, %rax, %xmm8, %xmm8
  113d7c:      	vpbroadcastq	%xmm12, %ymm12
  113d81:      	vpblendd	$0xc0, %ymm12, %ymm13, %ymm12 # ymm12 = ymm13[0,1,2,3,4,5],ymm12[6,7]
  113d87:      	vpsllq	$0x2, %ymm9, %ymm13
  113d8d:      	vpaddq	%ymm9, %ymm13, %ymm13
  113d92:      	vmovdqa	%ymm15, 0x6a0(%rsp)
  113d9b:      	vpsllq	$0x2, %ymm0, %ymm15
  113da0:      	vpaddq	%ymm0, %ymm15, %ymm15
  113da4:      	vmovdqa	%ymm9, 0x6c0(%rsp)
  113dad:      	vpsllq	$0x2, %ymm14, %ymm9
  113db3:      	vpaddq	%ymm14, %ymm9, %ymm9
  113db8:      	vmovdqa	%ymm0, 0x6e0(%rsp)
  113dc1:      	vpsllq	$0x2, %ymm12, %ymm0
  113dc7:      	vpaddq	%ymm0, %ymm12, %ymm0
  113dcb:      	vmovdqa	%ymm14, 0x700(%rsp)
  113dd4:      	vmovdqa	%ymm12, 0x720(%rsp)
  113ddd:      	movq	%rdi, %rax
  113de0:      	movq	0x1e0(%rsp), %rsi
  113de8:      	shldq	$0x18, %rdi, %rsi
  113ded:      	shrq	$0xe, %rax
  113df1:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  113df6:      	vmovq	%rax, %xmm12
  113dfb:      	movq	%r8, %rax
  113dfe:      	shrq	$0xe, %rax
  113e02:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  113e07:      	vmovq	%rax, %xmm14
  113e0c:      	vmovdqa	%ymm13, 0x620(%rsp)
  113e15:      	vmovdqu	0xe0(%rsp), %xmm13
  113e1e:      	vpinsrq	$0x1, %rdx, %xmm13, %xmm13
  113e24:      	vmovdqa	%ymm15, 0x640(%rsp)
  113e2d:      	vmovq	%rsi, %xmm15
  113e32:      	vmovdqa	%ymm9, 0x660(%rsp)
  113e3b:      	vmovdqa	%ymm0, 0x680(%rsp)
  113e44:      	vpbroadcastq	%xmm10, %ymm0
  113e49:      	vpblendd	$0x30, %ymm0, %ymm11, %ymm0 # ymm0 = ymm11[0,1,2,3],ymm0[4,5],ymm11[6,7]
  113e4f:      	vpbroadcastq	%xmm3, %ymm3
  113e54:      	vpblendd	$0xc0, %ymm3, %ymm0, %ymm0 # ymm0 = ymm0[0,1,2,3,4,5],ymm3[6,7]
  113e5a:      	vpbroadcastq	%xmm5, %ymm3
  113e5f:      	vpblendd	$0x30, %ymm3, %ymm6, %ymm3 # ymm3 = ymm6[0,1,2,3],ymm3[4,5],ymm6[6,7]
  113e65:      	vpbroadcastq	%xmm4, %ymm4
  113e6a:      	vpblendd	$0xc0, %ymm4, %ymm3, %ymm3 # ymm3 = ymm3[0,1,2,3,4,5],ymm4[6,7]
  113e70:      	vpbroadcastq	%xmm2, %ymm2
  113e75:      	vpblendd	$0x30, %ymm2, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm2[4,5],ymm1[6,7]
  113e7b:      	movq	%r8, %rax
  113e7e:      	shrq	$0x28, %rax
  113e82:      	vpbroadcastq	%xmm7, %ymm2
  113e87:      	vpblendd	$0xc0, %ymm2, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3,4,5],ymm2[6,7]
  113e8d:      	vpbroadcastq	%xmm12, %ymm2
  113e92:      	vpblendd	$0x30, %ymm2, %ymm8, %ymm2 # ymm2 = ymm8[0,1,2,3],ymm2[4,5],ymm8[6,7]
  113e98:      	vpbroadcastq	%xmm14, %ymm4
  113e9d:      	vpblendd	$0xc0, %ymm4, %ymm2, %ymm2 # ymm2 = ymm2[0,1,2,3,4,5],ymm4[6,7]
  113ea3:      	vpbroadcastq	%xmm15, %ymm4
  113ea8:      	vpblendd	$0x30, %ymm4, %ymm13, %ymm4 # ymm4 = ymm13[0,1,2,3],ymm4[4,5],ymm13[6,7]
  113eae:      	vmovq	%rax, %xmm5
  113eb3:      	vpbroadcastq	%xmm5, %ymm5
  113eb8:      	vpblendd	$0xc0, %ymm5, %ymm4, %ymm4 # ymm4 = ymm4[0,1,2,3,4,5],ymm5[6,7]
  113ebe:      	vpsllq	$0x2, %ymm3, %ymm5
  113ec3:      	vpaddq	%ymm3, %ymm5, %ymm5
  113ec7:      	vpsllq	$0x2, %ymm1, %ymm6
  113ecc:      	vpaddq	%ymm1, %ymm6, %ymm6
  113ed0:      	vpsllq	$0x2, %ymm2, %ymm7
  113ed5:      	vpaddq	%ymm2, %ymm7, %ymm7
  113ed9:      	vpsllq	$0x2, %ymm4, %ymm8
  113ede:      	vpaddq	%ymm4, %ymm8, %ymm8
  113ee2:      	vmovdqa	%ymm0, 0x460(%rsp)
  113eeb:      	vmovdqa	%ymm3, 0x480(%rsp)
  113ef4:      	vmovdqa	%ymm1, 0x4a0(%rsp)
  113efd:      	vmovdqa	%ymm2, 0x4c0(%rsp)
  113f06:      	vmovdqa	%ymm4, 0x4e0(%rsp)
  113f0f:      	vmovdqa	%ymm5, 0x3e0(%rsp)
  113f18:      	vmovdqa	%ymm6, 0x400(%rsp)
  113f21:      	vmovdqa	%ymm7, 0x420(%rsp)
  113f2a:      	vmovdqa	%ymm8, 0x440(%rsp)
  113f33:      	vpxor	%xmm0, %xmm0, %xmm0
  113f37:      	vmovdqa	%ymm0, 0x340(%rsp)
  113f40:      	vmovdqa	%ymm0, 0x320(%rsp)
  113f49:      	vmovdqa	%ymm0, 0x300(%rsp)
  113f52:      	vmovdqa	%ymm0, 0x2e0(%rsp)
  113f5b:      	vmovdqa	%ymm0, 0x2c0(%rsp)
  113f64:      	decq	%r13
  113f67:      	movq	%r13, %rax
  113f6a:      	shlq	$0x7, %rax
  113f6e:      	addq	%r15, %rax
  113f71:      	vpxor	%xmm2, %xmm2, %xmm2
  113f75:      	vpxor	%xmm1, %xmm1, %xmm1
  113f79:      	vpxor	%xmm4, %xmm4, %xmm4
  113f7d:      	vpxor	%xmm3, %xmm3, %xmm3
  113f81:      	testq	%r13, %r13
  113f84:      	je	0x1142b3 <toyos_crypto::arch::x86_64::poly1305::blocks+0xec3>
  113f8a:      	movq	%rax, 0x180(%rsp)
  113f92:      	addq	$0x70, %r15
  113f96:      	vbroadcastsd	-0xf058f(%rip), %ymm0 # 0x23a10 <anon.0d9a86fc381b8874252d5280d7e25c65.69.llvm.16651531316759922699+0xa20>
  113f9f:      	vmovaps	%ymm0, 0x40(%rsp)
  113fa5:      	vpbroadcastq	-0xf053e(%rip), %ymm0 # 0x23a70 <anon.0d9a86fc381b8874252d5280d7e25c65.69.llvm.16651531316759922699+0xa80>
  113fae:      	vmovdqa	%ymm0, 0x80(%rsp)
  113fb7:      	leaq	0x500(%rsp), %r14
  113fbf:      	leaq	0xc0(%rsp), %r12
  113fc7:      	leaq	0x2c0(%rsp), %rbx
  113fcf:      	nop
  113fd0:      	vmovdqu	-0x70(%r15), %ymm0
  113fd6:      	vmovdqu	-0x50(%r15), %ymm1
  113fdc:      	vmovdqu	-0x30(%r15), %ymm3
  113fe2:      	vmovdqu	-0x10(%r15), %ymm7
  113fe8:      	vpunpckhqdq	%ymm1, %ymm0, %ymm2 # ymm2 = ymm0[1],ymm1[1],ymm0[3],ymm1[3]
  113fec:      	vpsrlq	$0x28, %ymm2, %ymm6
  113ff1:      	vpunpcklqdq	%ymm1, %ymm0, %ymm4 # ymm4 = ymm0[0],ymm1[0],ymm0[2],ymm1[2]
  113ff5:      	vpsrlq	$0x34, %ymm4, %ymm0
  113ffa:      	vpsllq	$0xc, %ymm2, %ymm1
  113fff:      	vpor	%ymm0, %ymm1, %ymm5
  114003:      	vpsrlq	$0x1a, %ymm4, %ymm0
  114008:      	vmovdqa	0x40(%rsp), %ymm13
  11400e:      	vpand	%ymm0, %ymm13, %ymm8
  114012:      	vpunpcklqdq	%ymm7, %ymm3, %ymm1 # ymm1 = ymm3[0],ymm7[0],ymm3[2],ymm7[2]
  114016:      	vpunpckhqdq	%ymm7, %ymm3, %ymm0 # ymm0 = ymm3[1],ymm7[1],ymm3[3],ymm7[3]
  11401a:      	vpsrlq	$0x34, %ymm1, %ymm3
  11401f:      	vpsllq	$0xc, %ymm0, %ymm7
  114024:      	vpor	%ymm3, %ymm7, %ymm3
  114028:      	vmovdqa	0x220(%rsp), %ymm7
  114031:      	vmovdqa	0x280(%rsp), %ymm9
  11403a:      	vpsrlq	$0x1a, %ymm7, %ymm10
  11403f:      	vpaddq	0x240(%rsp), %ymm10, %ymm10
  114048:      	vpsrlq	$0x1a, %ymm9, %ymm11
  11404e:      	vpaddq	0x2a0(%rsp), %ymm11, %ymm11
  114057:      	vpand	%ymm13, %ymm10, %ymm12
  11405c:      	vpaddq	%ymm8, %ymm12, %ymm8
  114061:      	vpand	%ymm13, %ymm11, %ymm12
  114066:      	vpaddq	%ymm6, %ymm12, %ymm6
  11406a:      	vpand	%ymm7, %ymm13, %ymm7
  11406e:      	vpand	%ymm13, %ymm9, %ymm9
  114073:      	vpsrlq	$0x1a, %ymm10, %ymm10
  114079:      	vpaddq	0x260(%rsp), %ymm10, %ymm10
  114082:      	vpsrlq	$0x1a, %ymm11, %ymm11
  114088:      	vpaddq	%ymm7, %ymm11, %ymm7
  11408c:      	vpsllq	$0x2, %ymm11, %ymm11
  114092:      	vpaddq	%ymm7, %ymm11, %ymm7
  114096:      	vpsrlq	$0x1a, %ymm10, %ymm11
  11409c:      	vpaddq	%ymm9, %ymm11, %ymm9
  1140a1:      	vpand	%ymm5, %ymm13, %ymm5
  1140a5:      	vpand	%ymm13, %ymm10, %ymm10
  1140aa:      	vpaddq	%ymm5, %ymm10, %ymm5
  1140ae:      	vpsrlq	$0x1a, %ymm7, %ymm10
  1140b3:      	vpaddq	%ymm10, %ymm8, %ymm8
  1140b8:      	vpsrlq	$0xe, %ymm2, %ymm2
  1140bd:      	vpand	%ymm2, %ymm13, %ymm2
  1140c1:      	vpand	%ymm4, %ymm13, %ymm4
  1140c5:      	vpand	%ymm7, %ymm13, %ymm7
  1140c9:      	vpaddq	%ymm4, %ymm7, %ymm4
  1140cd:      	vpand	%ymm13, %ymm9, %ymm7
  1140d2:      	vpaddq	%ymm2, %ymm7, %ymm2
  1140d6:      	vpsrlq	$0x1a, %ymm9, %ymm7
  1140dc:      	vpaddq	0x80(%rsp), %ymm6, %ymm6
  1140e5:      	vpaddq	%ymm7, %ymm6, %ymm6
  1140e9:      	vmovdqa	%ymm4, 0xc0(%rsp)
  1140f2:      	vmovdqa	%ymm8, 0xe0(%rsp)
  1140fb:      	vmovdqa	%ymm5, 0x100(%rsp)
  114104:      	vmovdqa	%ymm2, 0x120(%rsp)
  11410d:      	vpand	%ymm1, %ymm13, %ymm2
  114111:      	vmovdqa	%ymm2, 0x60(%rsp)
  114117:      	vpsrlq	$0x1a, %ymm1, %ymm1
  11411c:      	vpand	%ymm1, %ymm13, %ymm1
  114120:      	vmovdqa	%ymm1, 0x1c0(%rsp)
  114129:      	vpand	%ymm3, %ymm13, %ymm1
  11412d:      	vmovdqa	%ymm1, 0x1e0(%rsp)
  114136:      	vmovdqa	%ymm6, 0x140(%rsp)
  11413f:      	vpsrlq	$0xe, %ymm0, %ymm1
  114144:      	vpand	%ymm1, %ymm13, %ymm1
  114148:      	vmovdqa	%ymm1, 0x200(%rsp)
  114151:      	vpsrlq	$0x28, %ymm0, %ymm0
  114156:      	vmovdqa	%ymm0, 0x1a0(%rsp)
  11415f:      	leaq	0x220(%rsp), %rdi
  114167:      	movq	%r14, %rsi
  11416a:      	movq	%r12, %rdx
  11416d:      	vzeroupper
  114170:      	callq	0x112f50 <<toyos_crypto::arch::x86_64::poly1305::Multiplier>::product>
  114175:      	vmovdqa	0x2c0(%rsp), %ymm0
  11417e:      	vmovdqa	0x320(%rsp), %ymm1
  114187:      	vpsrlq	$0x1a, %ymm0, %ymm2
  11418c:      	vpaddq	0x2e0(%rsp), %ymm2, %ymm2
  114195:      	vmovdqa	0x40(%rsp), %ymm7
  11419b:      	vpand	%ymm7, %ymm0, %ymm0
  11419f:      	vpsrlq	$0x1a, %ymm1, %ymm3
  1141a4:      	vpaddq	0x340(%rsp), %ymm3, %ymm3
  1141ad:      	vpand	%ymm7, %ymm1, %ymm1
  1141b1:      	vpsrlq	$0x1a, %ymm2, %ymm4
  1141b6:      	vpaddq	0x300(%rsp), %ymm4, %ymm4
  1141bf:      	vpand	%ymm7, %ymm2, %ymm2
  1141c3:      	vpaddq	0x1c0(%rsp), %ymm2, %ymm2
  1141cc:      	vpsrlq	$0x1a, %ymm3, %ymm5
  1141d1:      	vpand	%ymm7, %ymm3, %ymm3
  1141d5:      	vpaddq	0x1a0(%rsp), %ymm3, %ymm3
  1141de:      	vpsllq	$0x2, %ymm5, %ymm6
  1141e3:      	vpaddq	%ymm0, %ymm5, %ymm0
  1141e7:      	vpaddq	%ymm0, %ymm6, %ymm0
  1141eb:      	vpsrlq	$0x1a, %ymm4, %ymm5
  1141f0:      	vpaddq	%ymm1, %ymm5, %ymm1
  1141f4:      	vpand	%ymm7, %ymm4, %ymm4
  1141f8:      	vpaddq	0x1e0(%rsp), %ymm4, %ymm4
  114201:      	vpsrlq	$0x1a, %ymm0, %ymm5
  114206:      	vpaddq	%ymm5, %ymm2, %ymm2
  11420a:      	vpand	%ymm7, %ymm0, %ymm0
  11420e:      	vpaddq	0x60(%rsp), %ymm0, %ymm0
  114214:      	vpsrlq	$0x1a, %ymm1, %ymm5
  114219:      	vpand	%ymm7, %ymm1, %ymm1
  11421d:      	vpaddq	0x200(%rsp), %ymm1, %ymm1
  114226:      	vpaddq	0x80(%rsp), %ymm3, %ymm3
  11422f:      	vpaddq	%ymm5, %ymm3, %ymm3
  114233:      	vmovdqa	%ymm0, 0xc0(%rsp)
  11423c:      	vmovdqa	%ymm2, 0xe0(%rsp)
  114245:      	vmovdqa	%ymm4, 0x100(%rsp)
  11424e:      	vmovdqa	%ymm1, 0x120(%rsp)
  114257:      	vmovdqa	%ymm3, 0x140(%rsp)
  114260:      	movq	%rbx, %rdi
  114263:      	movq	%r14, %rsi
  114266:      	movq	%r12, %rdx
  114269:      	vzeroupper
  11426c:      	callq	0x112f50 <<toyos_crypto::arch::x86_64::poly1305::Multiplier>::product>
  114271:      	subq	$-0x80, %r15
  114275:      	decq	%r13
  114278:      	jne	0x113fd0 <toyos_crypto::arch::x86_64::poly1305::blocks+0xbe0>
  11427e:      	vmovdqa	0x2c0(%rsp), %ymm3
  114287:      	vmovdqa	0x2e0(%rsp), %ymm4
  114290:      	vmovdqa	0x300(%rsp), %ymm1
  114299:      	vmovdqa	0x320(%rsp), %ymm2
  1142a2:      	vmovdqa	0x340(%rsp), %ymm0
  1142ab:      	movq	0x180(%rsp), %rax
  1142b3:      	vmovdqa	%ymm0, 0x3a0(%rsp)
  1142bc:      	vmovdqa	%ymm3, 0x3c0(%rsp)
  1142c5:      	vmovdqa	%ymm4, 0x1c0(%rsp)
  1142ce:      	vmovdqa	%ymm1, 0x200(%rsp)
  1142d7:      	vmovdqa	%ymm2, 0x60(%rsp)
  1142dd:      	vmovdqu	(%rax), %ymm2
  1142e1:      	vmovdqu	0x20(%rax), %ymm3
  1142e6:      	vmovdqu	0x40(%rax), %ymm4
  1142eb:      	vmovdqu	0x60(%rax), %ymm5
  1142f0:      	vpunpckhqdq	%ymm3, %ymm2, %ymm6 # ymm6 = ymm2[1],ymm3[1],ymm2[3],ymm3[3]
  1142f4:      	vpsrlq	$0x28, %ymm6, %ymm1
  1142f9:      	vpsrlq	$0xe, %ymm6, %ymm0
  1142fe:      	vpbroadcastq	-0xf08f7(%rip), %ymm10 # 0x23a10 <anon.0d9a86fc381b8874252d5280d7e25c65.69.llvm.16651531316759922699+0xa20>
  114307:      	vmovdqa	%ymm10, 0x40(%rsp)
  11430d:      	vpand	%ymm0, %ymm10, %ymm0
  114311:      	vpunpcklqdq	%ymm3, %ymm2, %ymm2 # ymm2 = ymm2[0],ymm3[0],ymm2[2],ymm3[2]
  114315:      	vpsrlq	$0x34, %ymm2, %ymm3
  11431a:      	vpsllq	$0xc, %ymm6, %ymm6
  11431f:      	vpor	%ymm3, %ymm6, %ymm3
  114323:      	vpand	%ymm3, %ymm10, %ymm3
  114327:      	vpsrlq	$0x1a, %ymm2, %ymm6
  11432c:      	vpand	%ymm6, %ymm10, %ymm6
  114330:      	vpand	%ymm2, %ymm10, %ymm2
  114334:      	vpunpcklqdq	%ymm5, %ymm4, %ymm7 # ymm7 = ymm4[0],ymm5[0],ymm4[2],ymm5[2]
  114338:      	vpunpckhqdq	%ymm5, %ymm4, %ymm4 # ymm4 = ymm4[1],ymm5[1],ymm4[3],ymm5[3]
  11433c:      	vpand	%ymm7, %ymm10, %ymm5
  114340:      	vmovdqa	%ymm5, 0x80(%rsp)
  114349:      	vpsrlq	$0x1a, %ymm7, %ymm5
  11434e:      	vpand	%ymm5, %ymm10, %ymm5
  114352:      	vmovdqa	%ymm5, 0x1a0(%rsp)
  11435b:      	vpsrlq	$0x34, %ymm7, %ymm5
  114360:      	vpsllq	$0xc, %ymm4, %ymm7
  114365:      	vpor	%ymm5, %ymm7, %ymm5
  114369:      	vpand	%ymm5, %ymm10, %ymm5
  11436d:      	vmovdqa	%ymm5, 0x380(%rsp)
  114376:      	vpsrlq	$0xe, %ymm4, %ymm5
  11437b:      	vpand	%ymm5, %ymm10, %ymm5
  11437f:      	vmovdqa	%ymm5, 0x180(%rsp)
  114388:      	vpsrlq	$0x28, %ymm4, %ymm4
  11438d:      	vmovdqa	%ymm4, 0x1e0(%rsp)
  114396:      	vmovdqa	0x220(%rsp), %ymm4
  11439f:      	vmovdqa	0x280(%rsp), %ymm5
  1143a8:      	vpsrlq	$0x1a, %ymm4, %ymm7
  1143ad:      	vpaddq	0x240(%rsp), %ymm7, %ymm7
  1143b6:      	vpand	%ymm4, %ymm10, %ymm4
  1143ba:      	vpsrlq	$0x1a, %ymm5, %ymm8
  1143bf:      	vpaddq	0x2a0(%rsp), %ymm8, %ymm8
  1143c8:      	vpand	%ymm5, %ymm10, %ymm5
  1143cc:      	vpsrlq	$0x1a, %ymm7, %ymm9
  1143d1:      	vpaddq	0x260(%rsp), %ymm9, %ymm9
  1143da:      	vpand	%ymm7, %ymm10, %ymm7
  1143de:      	vpaddq	%ymm6, %ymm7, %ymm6
  1143e2:      	vpsrlq	$0x1a, %ymm8, %ymm7
  1143e8:      	vpand	%ymm10, %ymm8, %ymm8
  1143ed:      	vpaddq	%ymm1, %ymm8, %ymm1
  1143f1:      	vpsllq	$0x2, %ymm7, %ymm8
  1143f6:      	vpaddq	%ymm4, %ymm7, %ymm4
  1143fa:      	vpaddq	%ymm4, %ymm8, %ymm4
  1143fe:      	vpsrlq	$0x1a, %ymm9, %ymm7
  114404:      	vpaddq	%ymm5, %ymm7, %ymm5
  114408:      	vpand	%ymm10, %ymm9, %ymm7
  11440d:      	vpaddq	%ymm3, %ymm7, %ymm3
  114411:      	vpsrlq	$0x1a, %ymm4, %ymm7
  114416:      	vpaddq	%ymm7, %ymm6, %ymm6
  11441a:      	vpand	%ymm4, %ymm10, %ymm4
  11441e:      	vpaddq	%ymm2, %ymm4, %ymm2
  114422:      	vpsrlq	$0x1a, %ymm5, %ymm4
  114427:      	vpand	%ymm5, %ymm10, %ymm5
  11442b:      	vpbroadcastq	-0xf09c4(%rip), %ymm7 # 0x23a70 <anon.0d9a86fc381b8874252d5280d7e25c65.69.llvm.16651531316759922699+0xa80>
  114434:      	vmovdqa	%ymm7, 0x160(%rsp)
  11443d:      	vpaddq	%ymm0, %ymm5, %ymm0
  114441:      	vpaddq	%ymm7, %ymm1, %ymm1
  114445:      	vpaddq	%ymm4, %ymm1, %ymm1
  114449:      	vmovdqa	%ymm2, 0xc0(%rsp)
  114452:      	vmovdqa	%ymm6, 0xe0(%rsp)
  11445b:      	vmovdqa	%ymm3, 0x100(%rsp)
  114464:      	vmovdqa	%ymm0, 0x120(%rsp)
  11446d:      	vmovdqa	%ymm1, 0x140(%rsp)
  114476:      	leaq	0x220(%rsp), %rdi
  11447e:      	leaq	0x620(%rsp), %rsi
  114486:      	leaq	0xc0(%rsp), %rdx
  11448e:      	vzeroupper
  114491:      	callq	0x112f50 <<toyos_crypto::arch::x86_64::poly1305::Multiplier>::product>
  114496:      	vmovdqa	0x3c0(%rsp), %ymm1
  11449f:      	vpsrlq	$0x1a, %ymm1, %ymm0
  1144a4:      	vpaddq	0x1c0(%rsp), %ymm0, %ymm0
  1144ad:      	vmovdqa	0x40(%rsp), %ymm7
  1144b3:      	vpand	%ymm7, %ymm1, %ymm1
  1144b7:      	vmovdqa	0x60(%rsp), %ymm3
  1144bd:      	vpsrlq	$0x1a, %ymm3, %ymm2
  1144c2:      	vpaddq	0x3a0(%rsp), %ymm2, %ymm2
  1144cb:      	vpand	%ymm7, %ymm3, %ymm3
  1144cf:      	vpsrlq	$0x1a, %ymm0, %ymm4
  1144d4:      	vpaddq	0x200(%rsp), %ymm4, %ymm4
  1144dd:      	vpand	%ymm7, %ymm0, %ymm0
  1144e1:      	vpsrlq	$0x1a, %ymm2, %ymm5
  1144e6:      	vpand	%ymm7, %ymm2, %ymm2
  1144ea:      	vpsllq	$0x2, %ymm5, %ymm6
  1144ef:      	vpaddq	%ymm5, %ymm6, %ymm5
  1144f3:      	vpaddq	%ymm1, %ymm5, %ymm1
  1144f7:      	vpsrlq	$0x1a, %ymm4, %ymm5
  1144fc:      	vpaddq	%ymm3, %ymm5, %ymm3
  114500:      	vpand	%ymm7, %ymm4, %ymm4
  114504:      	vpaddq	0x380(%rsp), %ymm4, %ymm4
  11450d:      	vpsrlq	$0x1a, %ymm1, %ymm5
  114512:      	vpaddq	%ymm5, %ymm0, %ymm0
  114516:      	vpaddq	0x1a0(%rsp), %ymm0, %ymm0
  11451f:      	vpand	%ymm7, %ymm1, %ymm1
  114523:      	vpaddq	0x80(%rsp), %ymm1, %ymm1
  11452c:      	vpsrlq	$0x1a, %ymm3, %ymm5
  114531:      	vpaddq	%ymm5, %ymm2, %ymm2
  114535:      	vpand	%ymm7, %ymm3, %ymm3
  114539:      	vpaddq	0x180(%rsp), %ymm3, %ymm3
  114542:      	vpaddq	0x160(%rsp), %ymm2, %ymm2
  11454b:      	vpaddq	0x1e0(%rsp), %ymm2, %ymm2
  114554:      	vmovdqa	%ymm1, 0xc0(%rsp)
  11455d:      	vmovdqa	%ymm0, 0xe0(%rsp)
  114566:      	vmovdqa	%ymm4, 0x100(%rsp)
  11456f:      	vmovdqa	%ymm3, 0x120(%rsp)
  114578:      	vmovdqa	%ymm2, 0x140(%rsp)
  114581:      	leaq	0x2c0(%rsp), %rdi
  114589:      	leaq	0x3e0(%rsp), %rsi
  114591:      	leaq	0xc0(%rsp), %rdx
  114599:      	vzeroupper
  11459c:      	callq	0x112f50 <<toyos_crypto::arch::x86_64::poly1305::Multiplier>::product>
  1145a1:      	vmovdqa	0x220(%rsp), %ymm1
  1145aa:      	vpsrlq	$0x1a, %ymm1, %ymm0
  1145af:      	vpaddq	0x240(%rsp), %ymm0, %ymm2
  1145b8:      	vmovdqa	0x280(%rsp), %ymm3
  1145c1:      	vpsrlq	$0x1a, %ymm3, %ymm0
  1145c6:      	vpaddq	0x2a0(%rsp), %ymm0, %ymm0
  1145cf:      	vmovdqa	0x40(%rsp), %ymm12
  1145d5:      	vpand	%ymm1, %ymm12, %ymm1
  1145d9:      	vpsrlq	$0x1a, %ymm2, %ymm4
  1145de:      	vpaddq	0x260(%rsp), %ymm4, %ymm4
  1145e7:      	vpand	%ymm3, %ymm12, %ymm3
  1145eb:      	vpand	%ymm2, %ymm12, %ymm5
  1145ef:      	vpsrlq	$0x1a, %ymm0, %ymm2
  1145f4:      	vpsllq	$0x2, %ymm2, %ymm6
  1145f9:      	vpaddq	%ymm1, %ymm2, %ymm1
  1145fd:      	vpaddq	%ymm1, %ymm6, %ymm2
  114601:      	vpsrlq	$0x1a, %ymm4, %ymm1
  114606:      	vpaddq	%ymm3, %ymm1, %ymm1
  11460a:      	vpand	%ymm4, %ymm12, %ymm4
  11460e:      	vpsrlq	$0x1a, %ymm2, %ymm3
  114613:      	vpand	%ymm2, %ymm12, %ymm6
  114617:      	vpand	%ymm1, %ymm12, %ymm7
  11461b:      	vmovdqa	0x2c0(%rsp), %ymm8
  114624:      	vpsrlq	$0x1a, %ymm8, %ymm2
  11462a:      	vpaddq	0x2e0(%rsp), %ymm2, %ymm9
  114633:      	vmovdqa	0x320(%rsp), %ymm10
  11463c:      	vpsrlq	$0x1a, %ymm10, %ymm2
  114642:      	vpaddq	0x340(%rsp), %ymm2, %ymm2
  11464b:      	vpand	%ymm12, %ymm8, %ymm8
  114650:      	vpsrlq	$0x1a, %ymm9, %ymm11
  114656:      	vpaddq	0x300(%rsp), %ymm11, %ymm11
  11465f:      	vpand	%ymm12, %ymm10, %ymm10
  114664:      	vpand	%ymm12, %ymm9, %ymm9
  114669:      	vpaddq	%ymm5, %ymm9, %ymm5
  11466d:      	vpaddq	%ymm3, %ymm5, %ymm5
  114671:      	vpsrlq	$0x1a, %ymm2, %ymm3
  114676:      	vpsllq	$0x2, %ymm3, %ymm9
  11467b:      	vpaddq	%ymm3, %ymm8, %ymm3
  11467f:      	vpaddq	%ymm3, %ymm9, %ymm8
  114683:      	vpsrlq	$0x1a, %ymm11, %ymm3
  114689:      	vpaddq	%ymm3, %ymm10, %ymm3
  11468d:      	vpand	%ymm12, %ymm11, %ymm9
  114692:      	vpaddq	%ymm4, %ymm9, %ymm4
  114696:      	vpsrlq	$0x1a, %ymm8, %ymm9
  11469c:      	vpaddq	%ymm5, %ymm9, %ymm5
  1146a0:      	vpand	%ymm12, %ymm8, %ymm8
  1146a5:      	vpaddq	%ymm6, %ymm8, %ymm6
  1146a9:      	vpand	%ymm3, %ymm12, %ymm8
  1146ad:      	vpaddq	%ymm7, %ymm8, %ymm7
  1146b1:      	vpshufd	$0xee, %xmm6, %xmm8     # xmm8 = xmm6[2,3,2,3]
  1146b6:      	vextracti128	$0x1, %ymm6, %xmm9
  1146bc:      	vpermq	$0xff, %ymm6, %ymm10    # ymm10 = ymm6[3,3,3,3]
  1146c2:      	vpaddq	%xmm6, %xmm8, %xmm6
  1146c6:      	vpaddq	%xmm10, %xmm9, %xmm8
  1146cb:      	vpaddq	%xmm6, %xmm8, %xmm6
  1146cf:      	vmovq	%xmm6, %rdx
  1146d4:      	vpshufd	$0xee, %xmm5, %xmm6     # xmm6 = xmm5[2,3,2,3]
  1146d9:      	vextracti128	$0x1, %ymm5, %xmm8
  1146df:      	vpermq	$0xff, %ymm5, %ymm9     # ymm9 = ymm5[3,3,3,3]
  1146e5:      	vpaddq	%xmm6, %xmm5, %xmm5
  1146e9:      	vpaddq	%xmm9, %xmm8, %xmm6
  1146ee:      	vpaddq	%xmm6, %xmm5, %xmm5
  1146f2:      	vmovq	%xmm5, %rsi
  1146f7:      	vpshufd	$0xee, %xmm4, %xmm5     # xmm5 = xmm4[2,3,2,3]
  1146fc:      	vextracti128	$0x1, %ymm4, %xmm6
  114702:      	vpermq	$0xff, %ymm4, %ymm8     # ymm8 = ymm4[3,3,3,3]
  114708:      	vpaddq	%xmm5, %xmm4, %xmm4
  11470c:      	vpaddq	%xmm6, %xmm8, %xmm5
  114710:      	vpaddq	%xmm5, %xmm4, %xmm4
  114714:      	vmovq	%xmm4, %r9
  114719:      	vpshufd	$0xee, %xmm7, %xmm4     # xmm4 = xmm7[2,3,2,3]
  11471e:      	vextracti128	$0x1, %ymm7, %xmm5
  114724:      	vpermq	$0xff, %ymm7, %ymm6     # ymm6 = ymm7[3,3,3,3]
  11472a:      	vpaddq	%xmm4, %xmm7, %xmm4
  11472e:      	vpaddq	%xmm6, %xmm5, %xmm5
  114732:      	vpaddq	%xmm5, %xmm4, %xmm4
  114736:      	vmovq	%xmm4, %rcx
  11473b:      	movq	%rsi, %rdi
  11473e:      	shrq	$0x26, %rdi
  114742:      	shlq	$0x1a, %rsi
  114746:      	movq	%r9, %r8
  114749:      	shrq	$0xc, %r8
  11474d:      	shlq	$0x34, %r9
  114751:      	addq	%rdx, %r9
  114754:      	adcq	$0x0, %r8
  114758:      	addq	%rsi, %r9
  11475b:      	adcq	%rdi, %r8
  11475e:      	shlq	$0xe, %rcx
  114762:      	addq	%r8, %rcx
  114765:      	jb	0x114813 <toyos_crypto::arch::x86_64::poly1305::blocks+0x1423>
  11476b:      	movabsq	$0x7fffffffffffff8, %rdx # imm = 0x7FFFFFFFFFFFFF8
  114775:      	movq	0xb0(%rsp), %rax
  11477d:      	andq	%rdx, %rax
  114780:      	vpsrlq	$0x1a, %ymm1, %ymm1
  114785:      	vpand	%ymm0, %ymm12, %ymm0
  114789:      	vpand	%ymm2, %ymm12, %ymm2
  11478d:      	vpaddq	%ymm2, %ymm0, %ymm0
  114791:      	vpaddq	%ymm0, %ymm1, %ymm0
  114795:      	vpsrlq	$0x1a, %ymm3, %ymm1
  11479a:      	vpaddq	%ymm1, %ymm0, %ymm0
  11479e:      	vpshufd	$0xee, %xmm0, %xmm1     # xmm1 = xmm0[2,3,2,3]
  1147a3:      	vextracti128	$0x1, %ymm0, %xmm2
  1147a9:      	vpermq	$0xff, %ymm0, %ymm3     # ymm3 = ymm0[3,3,3,3]
  1147af:      	vpaddq	%xmm1, %xmm0, %xmm0
  1147b3:      	vpaddq	%xmm3, %xmm2, %xmm1
  1147b7:      	vpaddq	%xmm1, %xmm0, %xmm0
  1147bb:      	vmovq	%xmm0, %rdx
  1147c0:      	movq	%rdx, %rsi
  1147c3:      	shrq	$0x18, %rsi
  1147c7:      	shlq	$0x28, %rdx
  1147cb:      	addq	%rdx, %rcx
  1147ce:      	adcq	$0x0, %rsi
  1147d2:      	movl	%esi, %edx
  1147d4:      	andl	$0x3, %edx
  1147d7:      	shrq	$0x2, %rsi
  1147db:      	leaq	(%rsi,%rsi,4), %rsi
  1147df:      	addq	%rsi, %r9
  1147e2:      	adcq	$0x0, %rcx
  1147e6:      	adcq	$0x0, %rdx
  1147ea:      	movq	0xa8(%rsp), %rsi
  1147f2:      	movq	%r9, (%rsi)
  1147f5:      	movq	%rcx, 0x8(%rsi)
  1147f9:      	movq	%rdx, 0x10(%rsi)
  1147fd:      	jmp	0x114801 <toyos_crypto::arch::x86_64::poly1305::blocks+0x1411>
  1147ff:      	xorl	%eax, %eax
  114801:      	leaq	-0x28(%rbp), %rsp
  114805:      	popq	%rbx
  114806:      	popq	%r12
  114808:      	popq	%r13
  11480a:      	popq	%r14
  11480c:      	popq	%r15
  11480e:      	popq	%rbp
  11480f:      	vzeroupper
  114812:      	retq
  114813:      	leaq	0x63126(%rip), %rdi     # 0x177940 <anon.1b8b6464ffb31dec79baff4f70948fff.19.llvm.7769631450880698189+0x90>
  11481a:      	vzeroupper
  11481d:      	callq	0x16d060 <core::panicking::panic_const::panic_const_add_overflow>
