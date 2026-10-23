
bin/crypto-oracles-shipped-noninc-c9a3f65e1+product-outlined:	file format elf64-x86-64

Disassembly of section .text:

00000000002fb300 <toyos_crypto::arch::x86_64::poly1305::blocks>:
  2fb300:      	pushq	%rbp
  2fb301:      	movq	%rsp, %rbp
  2fb304:      	pushq	%r15
  2fb306:      	pushq	%r14
  2fb308:      	pushq	%r13
  2fb30a:      	pushq	%r12
  2fb30c:      	pushq	%rbx
  2fb30d:      	andq	$-0x20, %rsp
  2fb311:      	subq	$0x760, %rsp            # imm = 0x760
  2fb318:      	movq	%rdx, %r15
  2fb31b:      	movq	(%rdi), %r14
  2fb31e:      	movq	0x8(%rdi), %r9
  2fb322:      	movq	0x10(%rdi), %r12
  2fb326:      	movq	(%rsi), %rdi
  2fb329:      	movq	0x8(%rsi), %rax
  2fb32d:      	movl	%edi, %edx
  2fb32f:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  2fb335:      	movq	%rax, %r8
  2fb338:      	shldq	$0xc, %rdi, %r8
  2fb33d:      	shrq	$0x1a, %rdi
  2fb341:      	andl	$0x3ffffff, %edi        # imm = 0x3FFFFFF
  2fb347:      	andl	$0x3ffffff, %r8d        # imm = 0x3FFFFFF
  2fb34e:      	shrq	$0xe, %rax
  2fb352:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fb357:      	vmovd	%edx, %xmm0
  2fb35b:      	vmovq	0xd(%rsi), %xmm1
  2fb360:      	vmovdqa	%ymm0, 0x220(%rsp)
  2fb369:      	vmovd	%edi, %xmm0
  2fb36d:      	vmovdqa	%ymm0, 0x240(%rsp)
  2fb376:      	vmovd	%r8d, %xmm0
  2fb37b:      	vmovdqa	%ymm0, 0x260(%rsp)
  2fb384:      	vmovd	%eax, %xmm0
  2fb388:      	vmovdqa	%ymm0, 0x280(%rsp)
  2fb391:      	vmovdqa	%ymm1, 0x2a0(%rsp)
  2fb39a:      	movq	%rcx, %r13
  2fb39d:      	shrq	$0x3, %r13
  2fb3a1:      	je	0x2fc70f <toyos_crypto::arch::x86_64::poly1305::blocks+0x140f>
  2fb3a7:      	movq	%rsi, 0xa8(%rsp)
  2fb3af:      	movq	%rcx, 0xb0(%rsp)
  2fb3b7:      	movq	%r12, %rax
  2fb3ba:      	mulq	%r9
  2fb3bd:      	movq	%rdx, %rdi
  2fb3c0:      	movq	%r9, %rcx
  2fb3c3:      	movq	%rax, %r9
  2fb3c6:      	movq	%r14, %rax
  2fb3c9:      	mulq	%r14
  2fb3cc:      	movq	%rdx, %r10
  2fb3cf:      	movq	%rax, %rsi
  2fb3d2:      	addq	%r9, %rsi
  2fb3d5:      	adcq	%rdi, %r10
  2fb3d8:      	movq	%r14, %rax
  2fb3db:      	mulq	%rcx
  2fb3de:      	movq	%rcx, %r8
  2fb3e1:      	movq	%rcx, 0x40(%rsp)
  2fb3e6:      	shldq	$0x1, %rax, %rdx
  2fb3eb:      	addq	%rax, %rax
  2fb3ee:      	addq	%r10, %rax
  2fb3f1:      	adcq	$0x0, %rdx
  2fb3f5:      	movl	%edx, %edi
  2fb3f7:      	andl	$0x3, %edi
  2fb3fa:      	shrq	$0x2, %rdx
  2fb3fe:      	leaq	(%rdx,%rdx,4), %rbx
  2fb402:      	addq	%rsi, %rbx
  2fb405:      	adcq	$0x0, %rax
  2fb409:      	movq	%rdi, %rcx
  2fb40c:      	adcq	$0x0, %rcx
  2fb410:      	movq	%rcx, 0x80(%rsp)
  2fb418:      	movq	%rax, %r11
  2fb41b:      	movq	%rax, 0x200(%rsp)
  2fb423:      	mulq	%r14
  2fb426:      	movq	%rax, %rdi
  2fb429:      	movq	%rdx, %r9
  2fb42c:      	imulq	%r14, %rcx
  2fb430:      	movq	%rbx, %rax
  2fb433:      	movq	%rbx, 0x1c0(%rsp)
  2fb43b:      	mulq	%r8
  2fb43e:      	movq	%rdx, %rsi
  2fb441:      	movq	%rax, %r10
  2fb444:      	addq	%rdi, %r10
  2fb447:      	adcq	%r9, %rsi
  2fb44a:      	movq	%r11, %rax
  2fb44d:      	movq	%r12, 0x60(%rsp)
  2fb452:      	mulq	%r12
  2fb455:      	movq	%rdx, %r9
  2fb458:      	movq	%rax, %r11
  2fb45b:      	movq	%rbx, %rax
  2fb45e:      	mulq	%r14
  2fb461:      	movq	%rdx, %rbx
  2fb464:      	movq	%rax, %rdi
  2fb467:      	addq	%r11, %rdi
  2fb46a:      	adcq	%r9, %rbx
  2fb46d:      	addq	%r10, %rbx
  2fb470:      	adcq	$0x0, %rsi
  2fb474:      	movq	0x80(%rsp), %rax
  2fb47c:      	mulq	%r12
  2fb47f:      	addq	%rbx, %rax
  2fb482:      	adcq	%rsi, %rdx
  2fb485:      	addq	%rcx, %rdx
  2fb488:      	movl	%edx, %r8d
  2fb48b:      	andl	$0x3, %r8d
  2fb48f:      	shrq	$0x2, %rdx
  2fb493:      	leaq	(%rdx,%rdx,4), %rbx
  2fb497:      	addq	%rdi, %rbx
  2fb49a:      	adcq	$0x0, %rax
  2fb49e:      	adcq	$0x0, %r8
  2fb4a2:      	movq	%r8, %rcx
  2fb4a5:      	movq	%r8, 0x1e0(%rsp)
  2fb4ad:      	movq	%rax, %r11
  2fb4b0:      	movq	%rax, 0x1a0(%rsp)
  2fb4b8:      	movq	%r14, %r12
  2fb4bb:      	mulq	%r14
  2fb4be:      	movq	%rax, %rdi
  2fb4c1:      	movq	%rdx, %r9
  2fb4c4:      	imulq	%r14, %rcx
  2fb4c8:      	movq	%r14, 0xb8(%rsp)
  2fb4d0:      	movq	%rbx, %rax
  2fb4d3:      	movq	%rbx, 0x180(%rsp)
  2fb4db:      	mulq	0x40(%rsp)
  2fb4e0:      	movq	%rdx, %rsi
  2fb4e3:      	movq	%rax, %r10
  2fb4e6:      	addq	%rdi, %r10
  2fb4e9:      	adcq	%r9, %rsi
  2fb4ec:      	movq	%r11, %rax
  2fb4ef:      	movq	0x60(%rsp), %r14
  2fb4f4:      	mulq	%r14
  2fb4f7:      	movq	%rdx, %r9
  2fb4fa:      	movq	%rax, %r11
  2fb4fd:      	movq	%rbx, %rax
  2fb500:      	mulq	%r12
  2fb503:      	movq	%rdx, %rbx
  2fb506:      	movq	%rax, %rdi
  2fb509:      	addq	%r11, %rdi
  2fb50c:      	adcq	%r9, %rbx
  2fb50f:      	addq	%r10, %rbx
  2fb512:      	adcq	$0x0, %rsi
  2fb516:      	movq	%r8, %rax
  2fb519:      	mulq	%r14
  2fb51c:      	addq	%rbx, %rax
  2fb51f:      	movq	%rax, %r9
  2fb522:      	adcq	%rsi, %rdx
  2fb525:      	addq	%rcx, %rdx
  2fb528:      	movl	%edx, %eax
  2fb52a:      	andl	$0x3, %eax
  2fb52d:      	shrq	$0x2, %rdx
  2fb531:      	leaq	(%rdx,%rdx,4), %rsi
  2fb535:      	addq	%rdi, %rsi
  2fb538:      	adcq	$0x0, %r9
  2fb53c:      	movq	%r9, %r10
  2fb53f:      	adcq	$0x0, %rax
  2fb543:      	movq	%rax, %r12
  2fb546:      	movq	%rax, 0x3a0(%rsp)
  2fb54e:      	mulq	%r14
  2fb551:      	movq	%r14, %rdi
  2fb554:      	movq	%rdx, 0x160(%rsp)
  2fb55c:      	movq	%rax, 0x38(%rsp)
  2fb561:      	movq	%rsi, %rax
  2fb564:      	movq	%rsi, 0x380(%rsp)
  2fb56c:      	movq	0x40(%rsp), %r8
  2fb571:      	mulq	%r8
  2fb574:      	movq	%rdx, %r9
  2fb577:      	movq	%rax, %r11
  2fb57a:      	movq	%r10, %rcx
  2fb57d:      	movq	%r10, 0x3c0(%rsp)
  2fb585:      	movq	%r10, %rax
  2fb588:      	movq	0xb8(%rsp), %r14
  2fb590:      	mulq	%r14
  2fb593:      	movq	%rdx, %r10
  2fb596:      	movq	%rax, %rbx
  2fb599:      	addq	%r11, %rbx
  2fb59c:      	adcq	%r9, %r10
  2fb59f:      	movq	%rsi, %rax
  2fb5a2:      	mulq	%r14
  2fb5a5:      	movq	%rdx, %r9
  2fb5a8:      	movq	%rax, %r11
  2fb5ab:      	movq	%rcx, %rax
  2fb5ae:      	movq	%rdi, %rsi
  2fb5b1:      	mulq	%rdi
  2fb5b4:      	addq	%r11, %rax
  2fb5b7:      	adcq	%r9, %rdx
  2fb5ba:      	addq	%rbx, %rdx
  2fb5bd:      	adcq	$0x0, %r10
  2fb5c1:      	addq	0x38(%rsp), %rdx
  2fb5c6:      	adcq	0x160(%rsp), %r10
  2fb5ce:      	movq	%r12, %rdi
  2fb5d1:      	imulq	%r14, %rdi
  2fb5d5:      	addq	%r10, %rdi
  2fb5d8:      	movq	%rdi, %rcx
  2fb5db:      	shrq	$0x2, %rcx
  2fb5df:      	leaq	(%rcx,%rcx,4), %r12
  2fb5e3:      	andl	$0x3, %edi
  2fb5e6:      	addq	%rax, %r12
  2fb5e9:      	movq	%rdx, %rcx
  2fb5ec:      	adcq	$0x0, %rcx
  2fb5f0:      	adcq	$0x0, %rdi
  2fb5f4:      	movq	%rdi, %rax
  2fb5f7:      	movq	%rdi, 0x160(%rsp)
  2fb5ff:      	mulq	%rsi
  2fb602:      	movq	%rdx, 0x30(%rsp)
  2fb607:      	movq	%rax, 0x28(%rsp)
  2fb60c:      	movq	%r12, 0x360(%rsp)
  2fb614:      	movq	%r12, %rax
  2fb617:      	mulq	%r8
  2fb61a:      	movq	%rdx, %r9
  2fb61d:      	movq	%rax, %r10
  2fb620:      	movq	%rcx, %rax
  2fb623:      	movq	%rcx, 0x38(%rsp)
  2fb628:      	mulq	%r14
  2fb62b:      	movq	%rdx, %rbx
  2fb62e:      	movq	%rax, %r11
  2fb631:      	addq	%r10, %r11
  2fb634:      	adcq	%r9, %rbx
  2fb637:      	movq	%r12, %rax
  2fb63a:      	mulq	%r14
  2fb63d:      	movq	%r14, %r10
  2fb640:      	movq	%rdx, %r9
  2fb643:      	movq	%rax, %r12
  2fb646:      	movq	%rcx, %rax
  2fb649:      	mulq	%rsi
  2fb64c:      	movq	%rdx, %r14
  2fb64f:      	addq	%r12, %rax
  2fb652:      	adcq	%r9, %r14
  2fb655:      	addq	%r11, %r14
  2fb658:      	adcq	$0x0, %rbx
  2fb65c:      	addq	0x28(%rsp), %r14
  2fb661:      	adcq	0x30(%rsp), %rbx
  2fb666:      	movq	%r10, %rsi
  2fb669:      	imulq	%r10, %rdi
  2fb66d:      	addq	%rbx, %rdi
  2fb670:      	movq	%rdi, %rcx
  2fb673:      	shrq	$0x2, %rcx
  2fb677:      	leaq	(%rcx,%rcx,4), %r10
  2fb67b:      	andl	$0x3, %edi
  2fb67e:      	addq	%rax, %r10
  2fb681:      	adcq	$0x0, %r14
  2fb685:      	adcq	$0x0, %rdi
  2fb689:      	movq	%rdi, %rax
  2fb68c:      	movq	%rdi, 0x30(%rsp)
  2fb691:      	movq	0x60(%rsp), %r11
  2fb696:      	mulq	%r11
  2fb699:      	movq	%rdx, 0x20(%rsp)
  2fb69e:      	movq	%rax, 0x18(%rsp)
  2fb6a3:      	movq	%r10, %rax
  2fb6a6:      	movq	%r10, 0x28(%rsp)
  2fb6ab:      	mulq	%r8
  2fb6ae:      	movq	%rdx, %r9
  2fb6b1:      	movq	%rax, %rbx
  2fb6b4:      	movq	%r14, %rax
  2fb6b7:      	mulq	%rsi
  2fb6ba:      	movq	%rdx, %r12
  2fb6bd:      	movq	%rax, %rcx
  2fb6c0:      	addq	%rbx, %rcx
  2fb6c3:      	adcq	%r9, %r12
  2fb6c6:      	movq	%r10, %rax
  2fb6c9:      	mulq	%rsi
  2fb6cc:      	movq	%rsi, %r8
  2fb6cf:      	movq	%rdx, %r9
  2fb6d2:      	movq	%rax, %rsi
  2fb6d5:      	movq	%r14, %rax
  2fb6d8:      	mulq	%r11
  2fb6db:      	movq	%r11, %r10
  2fb6de:      	movq	%rdx, %rbx
  2fb6e1:      	addq	%rsi, %rax
  2fb6e4:      	adcq	%r9, %rbx
  2fb6e7:      	addq	%rcx, %rbx
  2fb6ea:      	adcq	$0x0, %r12
  2fb6ee:      	addq	0x18(%rsp), %rbx
  2fb6f3:      	adcq	0x20(%rsp), %r12
  2fb6f8:      	movq	%rdi, %r11
  2fb6fb:      	imulq	%r8, %r11
  2fb6ff:      	addq	%r12, %r11
  2fb702:      	movq	%r11, %rcx
  2fb705:      	shrq	$0x2, %rcx
  2fb709:      	leaq	(%rcx,%rcx,4), %r12
  2fb70d:      	andl	$0x3, %r11d
  2fb711:      	addq	%rax, %r12
  2fb714:      	adcq	$0x0, %rbx
  2fb718:      	adcq	$0x0, %r11
  2fb71c:      	movq	%r11, %rax
  2fb71f:      	mulq	%r10
  2fb722:      	movq	%rdx, 0x20(%rsp)
  2fb727:      	movq	%rax, 0x18(%rsp)
  2fb72c:      	movq	%r12, %rax
  2fb72f:      	mulq	0x40(%rsp)
  2fb734:      	movq	%rdx, %rsi
  2fb737:      	movq	%rax, %rcx
  2fb73a:      	movq	%rbx, %rax
  2fb73d:      	mulq	%r8
  2fb740:      	movq	%r8, %rdi
  2fb743:      	movq	%rdx, %r9
  2fb746:      	movq	%rax, %r8
  2fb749:      	addq	%rcx, %r8
  2fb74c:      	adcq	%rsi, %r9
  2fb74f:      	movq	%r12, %rax
  2fb752:      	mulq	%rdi
  2fb755:      	movq	%rdx, %rcx
  2fb758:      	movq	%rax, %rsi
  2fb75b:      	movq	%rbx, %rax
  2fb75e:      	mulq	%r10
  2fb761:      	addq	%rsi, %rax
  2fb764:      	adcq	%rcx, %rdx
  2fb767:      	addq	%r8, %rdx
  2fb76a:      	adcq	$0x0, %r9
  2fb76e:      	addq	0x18(%rsp), %rdx
  2fb773:      	adcq	0x20(%rsp), %r9
  2fb778:      	movq	%r11, %rcx
  2fb77b:      	imulq	%rdi, %rcx
  2fb77f:      	addq	%r9, %rcx
  2fb782:      	movq	%rcx, %rsi
  2fb785:      	shrq	$0x2, %rsi
  2fb789:      	leaq	(%rsi,%rsi,4), %rsi
  2fb78d:      	andl	$0x3, %ecx
  2fb790:      	addq	%rax, %rsi
  2fb793:      	adcq	$0x0, %rdx
  2fb797:      	adcq	$0x0, %rcx
  2fb79b:      	movl	%esi, %r8d
  2fb79e:      	andl	$0x3ffffff, %r8d        # imm = 0x3FFFFFF
  2fb7a5:      	movq	%rdx, %rax
  2fb7a8:      	shldq	$0xc, %rsi, %rax
  2fb7ad:      	shrq	$0x1a, %rsi
  2fb7b1:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  2fb7b7:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fb7bc:      	shldq	$0x18, %rdx, %rcx
  2fb7c1:      	shrq	$0xe, %rdx
  2fb7c5:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  2fb7cb:      	movq	%r8, 0x3e0(%rsp)
  2fb7d3:      	movq	%rsi, 0x3e8(%rsp)
  2fb7db:      	movq	%rax, 0x3f0(%rsp)
  2fb7e3:      	movq	%rdx, 0x3f8(%rsp)
  2fb7eb:      	movq	%rcx, 0x400(%rsp)
  2fb7f3:      	movq	%r8, 0x408(%rsp)
  2fb7fb:      	movq	%rsi, 0x410(%rsp)
  2fb803:      	movq	%rax, 0x418(%rsp)
  2fb80b:      	vmovdqu	0x3e0(%rsp), %xmm0
  2fb814:      	vpinsrq	$0x1, %r8, %xmm0, %xmm1
  2fb81a:      	vmovdqu	0x3e8(%rsp), %xmm0
  2fb823:      	vpinsrq	$0x1, %rsi, %xmm0, %xmm2
  2fb829:      	vmovq	%r8, %xmm4
  2fb82e:      	vmovdqu	0x3f0(%rsp), %xmm3
  2fb837:      	vmovdqu	0x3f8(%rsp), %xmm5
  2fb840:      	vmovdqu	0x400(%rsp), %xmm0
  2fb849:      	movq	%r8, 0x3e0(%rsp)
  2fb851:      	vmovq	%rsi, %xmm13
  2fb856:      	vpinsrq	$0x1, %rax, %xmm3, %xmm7
  2fb85c:      	movq	%rsi, 0x3e8(%rsp)
  2fb864:      	vmovq	%rax, %xmm12
  2fb869:      	vpinsrq	$0x1, %rdx, %xmm5, %xmm8
  2fb86f:      	movq	%rax, 0x3f0(%rsp)
  2fb877:      	vmovq	%rdx, %xmm11
  2fb87c:      	movq	%rdx, 0x3f8(%rsp)
  2fb884:      	movq	0x28(%rsp), %rsi
  2fb889:      	movl	%esi, %edx
  2fb88b:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  2fb891:      	movq	%r14, %rax
  2fb894:      	shldq	$0xc, %rsi, %rax
  2fb899:      	shrq	$0x1a, %rsi
  2fb89d:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  2fb8a3:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fb8a8:      	movq	%rcx, 0x400(%rsp)
  2fb8b0:      	movq	%rdx, 0x408(%rsp)
  2fb8b8:      	movq	%rsi, 0x410(%rsp)
  2fb8c0:      	movq	%rax, 0x418(%rsp)
  2fb8c8:      	vmovdqu	0x3e0(%rsp), %xmm3
  2fb8d1:      	vpinsrq	$0x1, %rdx, %xmm3, %xmm6
  2fb8d7:      	vpinsrq	$0x1, %rcx, %xmm0, %xmm14
  2fb8dd:      	vmovq	%rcx, %xmm15
  2fb8e2:      	movl	%r12d, %ecx
  2fb8e5:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  2fb8eb:      	vmovq	%rcx, %xmm10
  2fb8f0:      	vmovdqu	0x3e8(%rsp), %xmm0
  2fb8f9:      	vpinsrq	$0x1, %rsi, %xmm0, %xmm0
  2fb8ff:      	vmovdqa	%ymm0, 0x60(%rsp)
  2fb905:      	movq	%rbx, %rcx
  2fb908:      	shldq	$0xc, %r12, %rcx
  2fb90d:      	movq	0x360(%rsp), %r8
  2fb915:      	movl	%r8d, %edx
  2fb918:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  2fb91e:      	vmovq	%rdx, %xmm3
  2fb923:      	shrq	$0x1a, %r12
  2fb927:      	andl	$0x3ffffff, %r12d       # imm = 0x3FFFFFF
  2fb92e:      	vmovq	%r12, %xmm5
  2fb933:      	movq	0x38(%rsp), %rsi
  2fb938:      	movq	%rsi, %rdx
  2fb93b:      	shldq	$0xc, %r8, %rdx
  2fb940:      	shrq	$0x1a, %r8
  2fb944:      	andl	$0x3ffffff, %r8d        # imm = 0x3FFFFFF
  2fb94b:      	vmovq	%r8, %xmm9
  2fb950:      	vpbroadcastq	%xmm4, %ymm4
  2fb955:      	vpblendd	$0xf0, %ymm4, %ymm1, %ymm0 # ymm0 = ymm1[0,1,2,3],ymm4[4,5,6,7]
  2fb95b:      	vmovdqu	0x3f0(%rsp), %xmm1
  2fb964:      	vpinsrq	$0x1, %rax, %xmm1, %xmm1
  2fb96a:      	vpbroadcastq	%xmm13, %ymm4
  2fb96f:      	vpblendd	$0xf0, %ymm4, %ymm2, %ymm13 # ymm13 = ymm2[0,1,2,3],ymm4[4,5,6,7]
  2fb975:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  2fb97b:      	vmovq	%rcx, %xmm4
  2fb980:      	vpbroadcastq	%xmm12, %ymm2
  2fb985:      	vpblendd	$0xf0, %ymm2, %ymm7, %ymm12 # ymm12 = ymm7[0,1,2,3],ymm2[4,5,6,7]
  2fb98b:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  2fb991:      	vmovq	%rdx, %xmm7
  2fb996:      	vpbroadcastq	%xmm11, %ymm2
  2fb99b:      	vpblendd	$0xf0, %ymm2, %ymm8, %ymm8 # ymm8 = ymm8[0,1,2,3],ymm2[4,5,6,7]
  2fb9a1:      	movq	0x30(%rsp), %rax
  2fb9a6:      	shldq	$0x18, %r14, %rax
  2fb9ab:      	shrq	$0xe, %r14
  2fb9af:      	andl	$0x3ffffff, %r14d       # imm = 0x3FFFFFF
  2fb9b6:      	vmovdqu	0x3f8(%rsp), %xmm2
  2fb9bf:      	vpinsrq	$0x1, %r14, %xmm2, %xmm2
  2fb9c5:      	vmovdqa	%ymm2, 0x360(%rsp)
  2fb9ce:      	vpbroadcastq	%xmm15, %ymm2
  2fb9d3:      	vpblendd	$0xf0, %ymm2, %ymm14, %ymm11 # ymm11 = ymm14[0,1,2,3],ymm2[4,5,6,7]
  2fb9d9:      	shldq	$0x18, %rbx, %r11
  2fb9de:      	shrq	$0xe, %rbx
  2fb9e2:      	andl	$0x3ffffff, %ebx        # imm = 0x3FFFFFF
  2fb9e8:      	vmovq	%rbx, %xmm2
  2fb9ed:      	vmovdqa	%ymm0, 0x580(%rsp)
  2fb9f6:      	vpsllq	$0x2, %ymm13, %ymm0
  2fb9fc:      	vpaddq	%ymm0, %ymm13, %ymm0
  2fba00:      	vmovdqa	%ymm13, 0x5a0(%rsp)
  2fba09:      	vpsllq	$0x2, %ymm12, %ymm13
  2fba0f:      	vpaddq	%ymm12, %ymm13, %ymm13
  2fba14:      	vmovdqa	%ymm12, 0x5c0(%rsp)
  2fba1d:      	vpsllq	$0x2, %ymm8, %ymm12
  2fba23:      	vpaddq	%ymm8, %ymm12, %ymm12
  2fba28:      	vmovdqa	%ymm8, 0x5e0(%rsp)
  2fba31:      	vpsllq	$0x2, %ymm11, %ymm8
  2fba37:      	vpaddq	%ymm11, %ymm8, %ymm15
  2fba3c:      	vmovdqa	%ymm11, 0x600(%rsp)
  2fba45:      	vmovdqu	0x400(%rsp), %xmm8
  2fba4e:      	vpinsrq	$0x1, %rax, %xmm8, %xmm8
  2fba54:      	vmovdqa	%ymm0, 0x500(%rsp)
  2fba5d:      	movq	%rsi, %rax
  2fba60:      	movq	0x160(%rsp), %rcx
  2fba68:      	shldq	$0x18, %rsi, %rcx
  2fba6d:      	shrq	$0xe, %rax
  2fba71:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fba76:      	vmovq	%rax, %xmm14
  2fba7b:      	vmovdqa	%ymm13, 0x520(%rsp)
  2fba84:      	vmovq	%r11, %xmm13
  2fba89:      	vmovdqa	%ymm12, 0x540(%rsp)
  2fba92:      	vmovq	%rcx, %xmm12
  2fba97:      	movq	0x380(%rsp), %rdx
  2fba9f:      	movl	%edx, %eax
  2fbaa1:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fbaa6:      	movq	%rax, 0xc0(%rsp)
  2fbaae:      	movq	0x3c0(%rsp), %rcx
  2fbab6:      	movq	%rcx, %rax
  2fbab9:      	shldq	$0xc, %rdx, %rax
  2fbabe:      	shrq	$0x1a, %rdx
  2fbac2:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  2fbac8:      	movq	%rdx, 0xc8(%rsp)
  2fbad0:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fbad5:      	movq	%rax, 0xd0(%rsp)
  2fbadd:      	vmovdqa	%ymm15, 0x560(%rsp)
  2fbae6:      	vpbroadcastq	%xmm10, %ymm0
  2fbaeb:      	movq	%rcx, %rax
  2fbaee:      	movq	0x3a0(%rsp), %rsi
  2fbaf6:      	shldq	$0x18, %rcx, %rsi
  2fbafb:      	vpblendd	$0x30, %ymm0, %ymm6, %ymm0 # ymm0 = ymm6[0,1,2,3],ymm0[4,5],ymm6[6,7]
  2fbb01:      	shrq	$0xe, %rax
  2fbb05:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fbb0a:      	movq	%rax, 0xd8(%rsp)
  2fbb12:      	movq	0x1c0(%rsp), %rdx
  2fbb1a:      	movl	%edx, %ecx
  2fbb1c:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  2fbb22:      	movq	%rsi, 0xe0(%rsp)
  2fbb2a:      	movq	0x200(%rsp), %rsi
  2fbb32:      	movq	%rsi, %rax
  2fbb35:      	shldq	$0xc, %rdx, %rax
  2fbb3a:      	shrq	$0x1a, %rdx
  2fbb3e:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  2fbb44:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fbb49:      	movq	%rcx, 0xe8(%rsp)
  2fbb51:      	movq	%rdx, 0xf0(%rsp)
  2fbb59:      	movq	%rax, 0xf8(%rsp)
  2fbb61:      	vmovdqu	0xc0(%rsp), %xmm6
  2fbb6a:      	vpinsrq	$0x1, %rcx, %xmm6, %xmm11
  2fbb70:      	movq	0x180(%rsp), %r8
  2fbb78:      	movl	%r8d, %ecx
  2fbb7b:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  2fbb81:      	vmovq	%rcx, %xmm10
  2fbb86:      	vpbroadcastq	%xmm3, %ymm3
  2fbb8b:      	vpblendd	$0xc0, %ymm3, %ymm0, %ymm15 # ymm15 = ymm0[0,1,2,3,4,5],ymm3[6,7]
  2fbb91:      	vpbroadcastq	%xmm5, %ymm0
  2fbb96:      	vpblendd	$0xcf, 0x60(%rsp), %ymm0, %ymm0 # ymm0 = mem[0,1,2,3],ymm0[4,5],mem[6,7]
  2fbb9e:      	vpbroadcastq	%xmm9, %ymm5
  2fbba3:      	vmovdqu	0xc8(%rsp), %xmm3
  2fbbac:      	vpinsrq	$0x1, %rdx, %xmm3, %xmm6
  2fbbb2:      	movq	%rdi, %rdx
  2fbbb5:      	movl	%edx, %ecx
  2fbbb7:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  2fbbbd:      	vmovq	%rcx, %xmm3
  2fbbc2:      	movq	0x1a0(%rsp), %rdi
  2fbbca:      	movq	%rdi, %rcx
  2fbbcd:      	shldq	$0xc, %r8, %rcx
  2fbbd2:      	vpblendd	$0xc0, %ymm5, %ymm0, %ymm9 # ymm9 = ymm0[0,1,2,3,4,5],ymm5[6,7]
  2fbbd8:      	shrq	$0x1a, %r8
  2fbbdc:      	andl	$0x3ffffff, %r8d        # imm = 0x3FFFFFF
  2fbbe3:      	vmovq	%r8, %xmm5
  2fbbe8:      	vpbroadcastq	%xmm4, %ymm0
  2fbbed:      	vpblendd	$0x30, %ymm0, %ymm1, %ymm0 # ymm0 = ymm1[0,1,2,3],ymm0[4,5],ymm1[6,7]
  2fbbf3:      	vpbroadcastq	%xmm7, %ymm1
  2fbbf8:      	vpblendd	$0xc0, %ymm1, %ymm0, %ymm0 # ymm0 = ymm0[0,1,2,3,4,5],ymm1[6,7]
  2fbbfe:      	vmovdqu	0xd0(%rsp), %xmm1
  2fbc07:      	vpinsrq	$0x1, %rax, %xmm1, %xmm1
  2fbc0d:      	movq	0x40(%rsp), %r8
  2fbc12:      	movq	%r8, %rax
  2fbc15:      	shldq	$0xc, %rdx, %rax
  2fbc1a:      	shrq	$0x1a, %rdx
  2fbc1e:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  2fbc24:      	vmovq	%rdx, %xmm4
  2fbc29:      	vpbroadcastq	%xmm2, %ymm2
  2fbc2e:      	vpblendd	$0xcf, 0x360(%rsp), %ymm2, %ymm7 # ymm7 = mem[0,1,2,3],ymm2[4,5],mem[6,7]
  2fbc39:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  2fbc3f:      	vmovq	%rcx, %xmm2
  2fbc44:      	vpbroadcastq	%xmm14, %ymm14
  2fbc49:      	vpblendd	$0xc0, %ymm14, %ymm7, %ymm14 # ymm14 = ymm7[0,1,2,3,4,5],ymm14[6,7]
  2fbc4f:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fbc54:      	vmovq	%rax, %xmm7
  2fbc59:      	vpbroadcastq	%xmm13, %ymm13
  2fbc5e:      	movq	0x80(%rsp), %rdx
  2fbc66:      	movq	%rsi, %rax
  2fbc69:      	shldq	$0x18, %rsi, %rdx
  2fbc6e:      	vpblendd	$0x30, %ymm13, %ymm8, %ymm13 # ymm13 = ymm8[0,1,2,3],ymm13[4,5],ymm8[6,7]
  2fbc74:      	shrq	$0xe, %rax
  2fbc78:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fbc7d:      	vmovdqu	0xd8(%rsp), %xmm8
  2fbc86:      	vpinsrq	$0x1, %rax, %xmm8, %xmm8
  2fbc8c:      	vpbroadcastq	%xmm12, %ymm12
  2fbc91:      	vpblendd	$0xc0, %ymm12, %ymm13, %ymm12 # ymm12 = ymm13[0,1,2,3,4,5],ymm12[6,7]
  2fbc97:      	vpsllq	$0x2, %ymm9, %ymm13
  2fbc9d:      	vpaddq	%ymm9, %ymm13, %ymm13
  2fbca2:      	vmovdqa	%ymm15, 0x6a0(%rsp)
  2fbcab:      	vpsllq	$0x2, %ymm0, %ymm15
  2fbcb0:      	vpaddq	%ymm0, %ymm15, %ymm15
  2fbcb4:      	vmovdqa	%ymm9, 0x6c0(%rsp)
  2fbcbd:      	vpsllq	$0x2, %ymm14, %ymm9
  2fbcc3:      	vpaddq	%ymm14, %ymm9, %ymm9
  2fbcc8:      	vmovdqa	%ymm0, 0x6e0(%rsp)
  2fbcd1:      	vpsllq	$0x2, %ymm12, %ymm0
  2fbcd7:      	vpaddq	%ymm0, %ymm12, %ymm0
  2fbcdb:      	vmovdqa	%ymm14, 0x700(%rsp)
  2fbce4:      	vmovdqa	%ymm12, 0x720(%rsp)
  2fbced:      	movq	%rdi, %rax
  2fbcf0:      	movq	0x1e0(%rsp), %rsi
  2fbcf8:      	shldq	$0x18, %rdi, %rsi
  2fbcfd:      	shrq	$0xe, %rax
  2fbd01:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fbd06:      	vmovq	%rax, %xmm12
  2fbd0b:      	movq	%r8, %rax
  2fbd0e:      	shrq	$0xe, %rax
  2fbd12:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fbd17:      	vmovq	%rax, %xmm14
  2fbd1c:      	vmovdqa	%ymm13, 0x620(%rsp)
  2fbd25:      	vmovdqu	0xe0(%rsp), %xmm13
  2fbd2e:      	vpinsrq	$0x1, %rdx, %xmm13, %xmm13
  2fbd34:      	vmovdqa	%ymm15, 0x640(%rsp)
  2fbd3d:      	vmovq	%rsi, %xmm15
  2fbd42:      	vmovdqa	%ymm9, 0x660(%rsp)
  2fbd4b:      	vmovdqa	%ymm0, 0x680(%rsp)
  2fbd54:      	vpbroadcastq	%xmm10, %ymm0
  2fbd59:      	vpblendd	$0x30, %ymm0, %ymm11, %ymm0 # ymm0 = ymm11[0,1,2,3],ymm0[4,5],ymm11[6,7]
  2fbd5f:      	vpbroadcastq	%xmm3, %ymm3
  2fbd64:      	vpblendd	$0xc0, %ymm3, %ymm0, %ymm0 # ymm0 = ymm0[0,1,2,3,4,5],ymm3[6,7]
  2fbd6a:      	vpbroadcastq	%xmm5, %ymm3
  2fbd6f:      	vpblendd	$0x30, %ymm3, %ymm6, %ymm3 # ymm3 = ymm6[0,1,2,3],ymm3[4,5],ymm6[6,7]
  2fbd75:      	vpbroadcastq	%xmm4, %ymm4
  2fbd7a:      	vpblendd	$0xc0, %ymm4, %ymm3, %ymm3 # ymm3 = ymm3[0,1,2,3,4,5],ymm4[6,7]
  2fbd80:      	vpbroadcastq	%xmm2, %ymm2
  2fbd85:      	vpblendd	$0x30, %ymm2, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm2[4,5],ymm1[6,7]
  2fbd8b:      	movq	%r8, %rax
  2fbd8e:      	shrq	$0x28, %rax
  2fbd92:      	vpbroadcastq	%xmm7, %ymm2
  2fbd97:      	vpblendd	$0xc0, %ymm2, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3,4,5],ymm2[6,7]
  2fbd9d:      	vpbroadcastq	%xmm12, %ymm2
  2fbda2:      	vpblendd	$0x30, %ymm2, %ymm8, %ymm2 # ymm2 = ymm8[0,1,2,3],ymm2[4,5],ymm8[6,7]
  2fbda8:      	vpbroadcastq	%xmm14, %ymm4
  2fbdad:      	vpblendd	$0xc0, %ymm4, %ymm2, %ymm2 # ymm2 = ymm2[0,1,2,3,4,5],ymm4[6,7]
  2fbdb3:      	vpbroadcastq	%xmm15, %ymm4
  2fbdb8:      	vpblendd	$0x30, %ymm4, %ymm13, %ymm4 # ymm4 = ymm13[0,1,2,3],ymm4[4,5],ymm13[6,7]
  2fbdbe:      	vmovq	%rax, %xmm5
  2fbdc3:      	vpbroadcastq	%xmm5, %ymm5
  2fbdc8:      	vpblendd	$0xc0, %ymm5, %ymm4, %ymm4 # ymm4 = ymm4[0,1,2,3,4,5],ymm5[6,7]
  2fbdce:      	vpsllq	$0x2, %ymm3, %ymm5
  2fbdd3:      	vpaddq	%ymm3, %ymm5, %ymm5
  2fbdd7:      	vpsllq	$0x2, %ymm1, %ymm6
  2fbddc:      	vpaddq	%ymm1, %ymm6, %ymm6
  2fbde0:      	vpsllq	$0x2, %ymm2, %ymm7
  2fbde5:      	vpaddq	%ymm2, %ymm7, %ymm7
  2fbde9:      	vpsllq	$0x2, %ymm4, %ymm8
  2fbdee:      	vpaddq	%ymm4, %ymm8, %ymm8
  2fbdf2:      	vmovdqa	%ymm0, 0x460(%rsp)
  2fbdfb:      	vmovdqa	%ymm3, 0x480(%rsp)
  2fbe04:      	vmovdqa	%ymm1, 0x4a0(%rsp)
  2fbe0d:      	vmovdqa	%ymm2, 0x4c0(%rsp)
  2fbe16:      	vmovdqa	%ymm4, 0x4e0(%rsp)
  2fbe1f:      	vmovdqa	%ymm5, 0x3e0(%rsp)
  2fbe28:      	vmovdqa	%ymm6, 0x400(%rsp)
  2fbe31:      	vmovdqa	%ymm7, 0x420(%rsp)
  2fbe3a:      	vmovdqa	%ymm8, 0x440(%rsp)
  2fbe43:      	vpxor	%xmm0, %xmm0, %xmm0
  2fbe47:      	vmovdqa	%ymm0, 0x340(%rsp)
  2fbe50:      	vmovdqa	%ymm0, 0x320(%rsp)
  2fbe59:      	vmovdqa	%ymm0, 0x300(%rsp)
  2fbe62:      	vmovdqa	%ymm0, 0x2e0(%rsp)
  2fbe6b:      	vmovdqa	%ymm0, 0x2c0(%rsp)
  2fbe74:      	decq	%r13
  2fbe77:      	movq	%r13, %rax
  2fbe7a:      	shlq	$0x7, %rax
  2fbe7e:      	addq	%r15, %rax
  2fbe81:      	vpxor	%xmm2, %xmm2, %xmm2
  2fbe85:      	vpxor	%xmm1, %xmm1, %xmm1
  2fbe89:      	vpxor	%xmm4, %xmm4, %xmm4
  2fbe8d:      	vpxor	%xmm3, %xmm3, %xmm3
  2fbe91:      	testq	%r13, %r13
  2fbe94:      	je	0x2fc1c3 <toyos_crypto::arch::x86_64::poly1305::blocks+0xec3>
  2fbe9a:      	movq	%rax, 0x180(%rsp)
  2fbea2:      	addq	$0x70, %r15
  2fbea6:      	vbroadcastsd	-0x220207(%rip), %ymm0 # 0xdbca8 <kbrainpoolP224r1MontA+0x108>
  2fbeaf:      	vmovaps	%ymm0, 0x40(%rsp)
  2fbeb5:      	vpbroadcastq	-0x22017e(%rip), %ymm0 # 0xdbd40 <anon.54511efdcd5263d69ddc2501edb1ac10.13.llvm.1656325251768278046+0x48>
  2fbebe:      	vmovdqa	%ymm0, 0x80(%rsp)
  2fbec7:      	leaq	0x500(%rsp), %r14
  2fbecf:      	leaq	0xc0(%rsp), %r12
  2fbed7:      	leaq	0x2c0(%rsp), %rbx
  2fbedf:      	nop
  2fbee0:      	vmovdqu	-0x70(%r15), %ymm0
  2fbee6:      	vmovdqu	-0x50(%r15), %ymm1
  2fbeec:      	vmovdqu	-0x30(%r15), %ymm3
  2fbef2:      	vmovdqu	-0x10(%r15), %ymm7
  2fbef8:      	vpunpckhqdq	%ymm1, %ymm0, %ymm2 # ymm2 = ymm0[1],ymm1[1],ymm0[3],ymm1[3]
  2fbefc:      	vpsrlq	$0x28, %ymm2, %ymm6
  2fbf01:      	vpunpcklqdq	%ymm1, %ymm0, %ymm4 # ymm4 = ymm0[0],ymm1[0],ymm0[2],ymm1[2]
  2fbf05:      	vpsrlq	$0x34, %ymm4, %ymm0
  2fbf0a:      	vpsllq	$0xc, %ymm2, %ymm1
  2fbf0f:      	vpor	%ymm0, %ymm1, %ymm5
  2fbf13:      	vpsrlq	$0x1a, %ymm4, %ymm0
  2fbf18:      	vmovdqa	0x40(%rsp), %ymm13
  2fbf1e:      	vpand	%ymm0, %ymm13, %ymm8
  2fbf22:      	vpunpcklqdq	%ymm7, %ymm3, %ymm1 # ymm1 = ymm3[0],ymm7[0],ymm3[2],ymm7[2]
  2fbf26:      	vpunpckhqdq	%ymm7, %ymm3, %ymm0 # ymm0 = ymm3[1],ymm7[1],ymm3[3],ymm7[3]
  2fbf2a:      	vpsrlq	$0x34, %ymm1, %ymm3
  2fbf2f:      	vpsllq	$0xc, %ymm0, %ymm7
  2fbf34:      	vpor	%ymm3, %ymm7, %ymm3
  2fbf38:      	vmovdqa	0x220(%rsp), %ymm7
  2fbf41:      	vmovdqa	0x280(%rsp), %ymm9
  2fbf4a:      	vpsrlq	$0x1a, %ymm7, %ymm10
  2fbf4f:      	vpaddq	0x240(%rsp), %ymm10, %ymm10
  2fbf58:      	vpsrlq	$0x1a, %ymm9, %ymm11
  2fbf5e:      	vpaddq	0x2a0(%rsp), %ymm11, %ymm11
  2fbf67:      	vpand	%ymm13, %ymm10, %ymm12
  2fbf6c:      	vpaddq	%ymm8, %ymm12, %ymm8
  2fbf71:      	vpand	%ymm13, %ymm11, %ymm12
  2fbf76:      	vpaddq	%ymm6, %ymm12, %ymm6
  2fbf7a:      	vpand	%ymm7, %ymm13, %ymm7
  2fbf7e:      	vpand	%ymm13, %ymm9, %ymm9
  2fbf83:      	vpsrlq	$0x1a, %ymm10, %ymm10
  2fbf89:      	vpaddq	0x260(%rsp), %ymm10, %ymm10
  2fbf92:      	vpsrlq	$0x1a, %ymm11, %ymm11
  2fbf98:      	vpaddq	%ymm7, %ymm11, %ymm7
  2fbf9c:      	vpsllq	$0x2, %ymm11, %ymm11
  2fbfa2:      	vpaddq	%ymm7, %ymm11, %ymm7
  2fbfa6:      	vpsrlq	$0x1a, %ymm10, %ymm11
  2fbfac:      	vpaddq	%ymm9, %ymm11, %ymm9
  2fbfb1:      	vpand	%ymm5, %ymm13, %ymm5
  2fbfb5:      	vpand	%ymm13, %ymm10, %ymm10
  2fbfba:      	vpaddq	%ymm5, %ymm10, %ymm5
  2fbfbe:      	vpsrlq	$0x1a, %ymm7, %ymm10
  2fbfc3:      	vpaddq	%ymm10, %ymm8, %ymm8
  2fbfc8:      	vpsrlq	$0xe, %ymm2, %ymm2
  2fbfcd:      	vpand	%ymm2, %ymm13, %ymm2
  2fbfd1:      	vpand	%ymm4, %ymm13, %ymm4
  2fbfd5:      	vpand	%ymm7, %ymm13, %ymm7
  2fbfd9:      	vpaddq	%ymm4, %ymm7, %ymm4
  2fbfdd:      	vpand	%ymm13, %ymm9, %ymm7
  2fbfe2:      	vpaddq	%ymm2, %ymm7, %ymm2
  2fbfe6:      	vpsrlq	$0x1a, %ymm9, %ymm7
  2fbfec:      	vpaddq	0x80(%rsp), %ymm6, %ymm6
  2fbff5:      	vpaddq	%ymm7, %ymm6, %ymm6
  2fbff9:      	vmovdqa	%ymm4, 0xc0(%rsp)
  2fc002:      	vmovdqa	%ymm8, 0xe0(%rsp)
  2fc00b:      	vmovdqa	%ymm5, 0x100(%rsp)
  2fc014:      	vmovdqa	%ymm2, 0x120(%rsp)
  2fc01d:      	vpand	%ymm1, %ymm13, %ymm2
  2fc021:      	vmovdqa	%ymm2, 0x60(%rsp)
  2fc027:      	vpsrlq	$0x1a, %ymm1, %ymm1
  2fc02c:      	vpand	%ymm1, %ymm13, %ymm1
  2fc030:      	vmovdqa	%ymm1, 0x1c0(%rsp)
  2fc039:      	vpand	%ymm3, %ymm13, %ymm1
  2fc03d:      	vmovdqa	%ymm1, 0x1e0(%rsp)
  2fc046:      	vmovdqa	%ymm6, 0x140(%rsp)
  2fc04f:      	vpsrlq	$0xe, %ymm0, %ymm1
  2fc054:      	vpand	%ymm1, %ymm13, %ymm1
  2fc058:      	vmovdqa	%ymm1, 0x200(%rsp)
  2fc061:      	vpsrlq	$0x28, %ymm0, %ymm0
  2fc066:      	vmovdqa	%ymm0, 0x1a0(%rsp)
  2fc06f:      	leaq	0x220(%rsp), %rdi
  2fc077:      	movq	%r14, %rsi
  2fc07a:      	movq	%r12, %rdx
  2fc07d:      	vzeroupper
  2fc080:      	callq	0x2fb1c0 <<toyos_crypto::arch::x86_64::poly1305::Multiplier>::product>
  2fc085:      	vmovdqa	0x2c0(%rsp), %ymm0
  2fc08e:      	vmovdqa	0x320(%rsp), %ymm1
  2fc097:      	vpsrlq	$0x1a, %ymm0, %ymm2
  2fc09c:      	vpaddq	0x2e0(%rsp), %ymm2, %ymm2
  2fc0a5:      	vmovdqa	0x40(%rsp), %ymm7
  2fc0ab:      	vpand	%ymm7, %ymm0, %ymm0
  2fc0af:      	vpsrlq	$0x1a, %ymm1, %ymm3
  2fc0b4:      	vpaddq	0x340(%rsp), %ymm3, %ymm3
  2fc0bd:      	vpand	%ymm7, %ymm1, %ymm1
  2fc0c1:      	vpsrlq	$0x1a, %ymm2, %ymm4
  2fc0c6:      	vpaddq	0x300(%rsp), %ymm4, %ymm4
  2fc0cf:      	vpand	%ymm7, %ymm2, %ymm2
  2fc0d3:      	vpaddq	0x1c0(%rsp), %ymm2, %ymm2
  2fc0dc:      	vpsrlq	$0x1a, %ymm3, %ymm5
  2fc0e1:      	vpand	%ymm7, %ymm3, %ymm3
  2fc0e5:      	vpaddq	0x1a0(%rsp), %ymm3, %ymm3
  2fc0ee:      	vpsllq	$0x2, %ymm5, %ymm6
  2fc0f3:      	vpaddq	%ymm0, %ymm5, %ymm0
  2fc0f7:      	vpaddq	%ymm0, %ymm6, %ymm0
  2fc0fb:      	vpsrlq	$0x1a, %ymm4, %ymm5
  2fc100:      	vpaddq	%ymm1, %ymm5, %ymm1
  2fc104:      	vpand	%ymm7, %ymm4, %ymm4
  2fc108:      	vpaddq	0x1e0(%rsp), %ymm4, %ymm4
  2fc111:      	vpsrlq	$0x1a, %ymm0, %ymm5
  2fc116:      	vpaddq	%ymm5, %ymm2, %ymm2
  2fc11a:      	vpand	%ymm7, %ymm0, %ymm0
  2fc11e:      	vpaddq	0x60(%rsp), %ymm0, %ymm0
  2fc124:      	vpsrlq	$0x1a, %ymm1, %ymm5
  2fc129:      	vpand	%ymm7, %ymm1, %ymm1
  2fc12d:      	vpaddq	0x200(%rsp), %ymm1, %ymm1
  2fc136:      	vpaddq	0x80(%rsp), %ymm3, %ymm3
  2fc13f:      	vpaddq	%ymm5, %ymm3, %ymm3
  2fc143:      	vmovdqa	%ymm0, 0xc0(%rsp)
  2fc14c:      	vmovdqa	%ymm2, 0xe0(%rsp)
  2fc155:      	vmovdqa	%ymm4, 0x100(%rsp)
  2fc15e:      	vmovdqa	%ymm1, 0x120(%rsp)
  2fc167:      	vmovdqa	%ymm3, 0x140(%rsp)
  2fc170:      	movq	%rbx, %rdi
  2fc173:      	movq	%r14, %rsi
  2fc176:      	movq	%r12, %rdx
  2fc179:      	vzeroupper
  2fc17c:      	callq	0x2fb1c0 <<toyos_crypto::arch::x86_64::poly1305::Multiplier>::product>
  2fc181:      	subq	$-0x80, %r15
  2fc185:      	decq	%r13
  2fc188:      	jne	0x2fbee0 <toyos_crypto::arch::x86_64::poly1305::blocks+0xbe0>
  2fc18e:      	vmovdqa	0x2c0(%rsp), %ymm3
  2fc197:      	vmovdqa	0x2e0(%rsp), %ymm4
  2fc1a0:      	vmovdqa	0x300(%rsp), %ymm1
  2fc1a9:      	vmovdqa	0x320(%rsp), %ymm2
  2fc1b2:      	vmovdqa	0x340(%rsp), %ymm0
  2fc1bb:      	movq	0x180(%rsp), %rax
  2fc1c3:      	vmovdqa	%ymm0, 0x3a0(%rsp)
  2fc1cc:      	vmovdqa	%ymm3, 0x3c0(%rsp)
  2fc1d5:      	vmovdqa	%ymm4, 0x1c0(%rsp)
  2fc1de:      	vmovdqa	%ymm1, 0x200(%rsp)
  2fc1e7:      	vmovdqa	%ymm2, 0x60(%rsp)
  2fc1ed:      	vmovdqu	(%rax), %ymm2
  2fc1f1:      	vmovdqu	0x20(%rax), %ymm3
  2fc1f6:      	vmovdqu	0x40(%rax), %ymm4
  2fc1fb:      	vmovdqu	0x60(%rax), %ymm5
  2fc200:      	vpunpckhqdq	%ymm3, %ymm2, %ymm6 # ymm6 = ymm2[1],ymm3[1],ymm2[3],ymm3[3]
  2fc204:      	vpsrlq	$0x28, %ymm6, %ymm1
  2fc209:      	vpsrlq	$0xe, %ymm6, %ymm0
  2fc20e:      	vpbroadcastq	-0x22056f(%rip), %ymm10 # 0xdbca8 <kbrainpoolP224r1MontA+0x108>
  2fc217:      	vmovdqa	%ymm10, 0x40(%rsp)
  2fc21d:      	vpand	%ymm0, %ymm10, %ymm0
  2fc221:      	vpunpcklqdq	%ymm3, %ymm2, %ymm2 # ymm2 = ymm2[0],ymm3[0],ymm2[2],ymm3[2]
  2fc225:      	vpsrlq	$0x34, %ymm2, %ymm3
  2fc22a:      	vpsllq	$0xc, %ymm6, %ymm6
  2fc22f:      	vpor	%ymm3, %ymm6, %ymm3
  2fc233:      	vpand	%ymm3, %ymm10, %ymm3
  2fc237:      	vpsrlq	$0x1a, %ymm2, %ymm6
  2fc23c:      	vpand	%ymm6, %ymm10, %ymm6
  2fc240:      	vpand	%ymm2, %ymm10, %ymm2
  2fc244:      	vpunpcklqdq	%ymm5, %ymm4, %ymm7 # ymm7 = ymm4[0],ymm5[0],ymm4[2],ymm5[2]
  2fc248:      	vpunpckhqdq	%ymm5, %ymm4, %ymm4 # ymm4 = ymm4[1],ymm5[1],ymm4[3],ymm5[3]
  2fc24c:      	vpand	%ymm7, %ymm10, %ymm5
  2fc250:      	vmovdqa	%ymm5, 0x80(%rsp)
  2fc259:      	vpsrlq	$0x1a, %ymm7, %ymm5
  2fc25e:      	vpand	%ymm5, %ymm10, %ymm5
  2fc262:      	vmovdqa	%ymm5, 0x1a0(%rsp)
  2fc26b:      	vpsrlq	$0x34, %ymm7, %ymm5
  2fc270:      	vpsllq	$0xc, %ymm4, %ymm7
  2fc275:      	vpor	%ymm5, %ymm7, %ymm5
  2fc279:      	vpand	%ymm5, %ymm10, %ymm5
  2fc27d:      	vmovdqa	%ymm5, 0x380(%rsp)
  2fc286:      	vpsrlq	$0xe, %ymm4, %ymm5
  2fc28b:      	vpand	%ymm5, %ymm10, %ymm5
  2fc28f:      	vmovdqa	%ymm5, 0x180(%rsp)
  2fc298:      	vpsrlq	$0x28, %ymm4, %ymm4
  2fc29d:      	vmovdqa	%ymm4, 0x1e0(%rsp)
  2fc2a6:      	vmovdqa	0x220(%rsp), %ymm4
  2fc2af:      	vmovdqa	0x280(%rsp), %ymm5
  2fc2b8:      	vpsrlq	$0x1a, %ymm4, %ymm7
  2fc2bd:      	vpaddq	0x240(%rsp), %ymm7, %ymm7
  2fc2c6:      	vpand	%ymm4, %ymm10, %ymm4
  2fc2ca:      	vpsrlq	$0x1a, %ymm5, %ymm8
  2fc2cf:      	vpaddq	0x2a0(%rsp), %ymm8, %ymm8
  2fc2d8:      	vpand	%ymm5, %ymm10, %ymm5
  2fc2dc:      	vpsrlq	$0x1a, %ymm7, %ymm9
  2fc2e1:      	vpaddq	0x260(%rsp), %ymm9, %ymm9
  2fc2ea:      	vpand	%ymm7, %ymm10, %ymm7
  2fc2ee:      	vpaddq	%ymm6, %ymm7, %ymm6
  2fc2f2:      	vpsrlq	$0x1a, %ymm8, %ymm7
  2fc2f8:      	vpand	%ymm10, %ymm8, %ymm8
  2fc2fd:      	vpaddq	%ymm1, %ymm8, %ymm1
  2fc301:      	vpsllq	$0x2, %ymm7, %ymm8
  2fc306:      	vpaddq	%ymm4, %ymm7, %ymm4
  2fc30a:      	vpaddq	%ymm4, %ymm8, %ymm4
  2fc30e:      	vpsrlq	$0x1a, %ymm9, %ymm7
  2fc314:      	vpaddq	%ymm5, %ymm7, %ymm5
  2fc318:      	vpand	%ymm10, %ymm9, %ymm7
  2fc31d:      	vpaddq	%ymm3, %ymm7, %ymm3
  2fc321:      	vpsrlq	$0x1a, %ymm4, %ymm7
  2fc326:      	vpaddq	%ymm7, %ymm6, %ymm6
  2fc32a:      	vpand	%ymm4, %ymm10, %ymm4
  2fc32e:      	vpaddq	%ymm2, %ymm4, %ymm2
  2fc332:      	vpsrlq	$0x1a, %ymm5, %ymm4
  2fc337:      	vpand	%ymm5, %ymm10, %ymm5
  2fc33b:      	vpbroadcastq	-0x220604(%rip), %ymm7 # 0xdbd40 <anon.54511efdcd5263d69ddc2501edb1ac10.13.llvm.1656325251768278046+0x48>
  2fc344:      	vmovdqa	%ymm7, 0x160(%rsp)
  2fc34d:      	vpaddq	%ymm0, %ymm5, %ymm0
  2fc351:      	vpaddq	%ymm7, %ymm1, %ymm1
  2fc355:      	vpaddq	%ymm4, %ymm1, %ymm1
  2fc359:      	vmovdqa	%ymm2, 0xc0(%rsp)
  2fc362:      	vmovdqa	%ymm6, 0xe0(%rsp)
  2fc36b:      	vmovdqa	%ymm3, 0x100(%rsp)
  2fc374:      	vmovdqa	%ymm0, 0x120(%rsp)
  2fc37d:      	vmovdqa	%ymm1, 0x140(%rsp)
  2fc386:      	leaq	0x220(%rsp), %rdi
  2fc38e:      	leaq	0x620(%rsp), %rsi
  2fc396:      	leaq	0xc0(%rsp), %rdx
  2fc39e:      	vzeroupper
  2fc3a1:      	callq	0x2fb1c0 <<toyos_crypto::arch::x86_64::poly1305::Multiplier>::product>
  2fc3a6:      	vmovdqa	0x3c0(%rsp), %ymm1
  2fc3af:      	vpsrlq	$0x1a, %ymm1, %ymm0
  2fc3b4:      	vpaddq	0x1c0(%rsp), %ymm0, %ymm0
  2fc3bd:      	vmovdqa	0x40(%rsp), %ymm7
  2fc3c3:      	vpand	%ymm7, %ymm1, %ymm1
  2fc3c7:      	vmovdqa	0x60(%rsp), %ymm3
  2fc3cd:      	vpsrlq	$0x1a, %ymm3, %ymm2
  2fc3d2:      	vpaddq	0x3a0(%rsp), %ymm2, %ymm2
  2fc3db:      	vpand	%ymm7, %ymm3, %ymm3
  2fc3df:      	vpsrlq	$0x1a, %ymm0, %ymm4
  2fc3e4:      	vpaddq	0x200(%rsp), %ymm4, %ymm4
  2fc3ed:      	vpand	%ymm7, %ymm0, %ymm0
  2fc3f1:      	vpsrlq	$0x1a, %ymm2, %ymm5
  2fc3f6:      	vpand	%ymm7, %ymm2, %ymm2
  2fc3fa:      	vpsllq	$0x2, %ymm5, %ymm6
  2fc3ff:      	vpaddq	%ymm5, %ymm6, %ymm5
  2fc403:      	vpaddq	%ymm1, %ymm5, %ymm1
  2fc407:      	vpsrlq	$0x1a, %ymm4, %ymm5
  2fc40c:      	vpaddq	%ymm3, %ymm5, %ymm3
  2fc410:      	vpand	%ymm7, %ymm4, %ymm4
  2fc414:      	vpaddq	0x380(%rsp), %ymm4, %ymm4
  2fc41d:      	vpsrlq	$0x1a, %ymm1, %ymm5
  2fc422:      	vpaddq	%ymm5, %ymm0, %ymm0
  2fc426:      	vpaddq	0x1a0(%rsp), %ymm0, %ymm0
  2fc42f:      	vpand	%ymm7, %ymm1, %ymm1
  2fc433:      	vpaddq	0x80(%rsp), %ymm1, %ymm1
  2fc43c:      	vpsrlq	$0x1a, %ymm3, %ymm5
  2fc441:      	vpaddq	%ymm5, %ymm2, %ymm2
  2fc445:      	vpand	%ymm7, %ymm3, %ymm3
  2fc449:      	vpaddq	0x180(%rsp), %ymm3, %ymm3
  2fc452:      	vpaddq	0x160(%rsp), %ymm2, %ymm2
  2fc45b:      	vpaddq	0x1e0(%rsp), %ymm2, %ymm2
  2fc464:      	vmovdqa	%ymm1, 0xc0(%rsp)
  2fc46d:      	vmovdqa	%ymm0, 0xe0(%rsp)
  2fc476:      	vmovdqa	%ymm4, 0x100(%rsp)
  2fc47f:      	vmovdqa	%ymm3, 0x120(%rsp)
  2fc488:      	vmovdqa	%ymm2, 0x140(%rsp)
  2fc491:      	leaq	0x2c0(%rsp), %rdi
  2fc499:      	leaq	0x3e0(%rsp), %rsi
  2fc4a1:      	leaq	0xc0(%rsp), %rdx
  2fc4a9:      	vzeroupper
  2fc4ac:      	callq	0x2fb1c0 <<toyos_crypto::arch::x86_64::poly1305::Multiplier>::product>
  2fc4b1:      	vmovdqa	0x220(%rsp), %ymm1
  2fc4ba:      	vpsrlq	$0x1a, %ymm1, %ymm0
  2fc4bf:      	vpaddq	0x240(%rsp), %ymm0, %ymm2
  2fc4c8:      	vmovdqa	0x280(%rsp), %ymm3
  2fc4d1:      	vpsrlq	$0x1a, %ymm3, %ymm0
  2fc4d6:      	vpaddq	0x2a0(%rsp), %ymm0, %ymm0
  2fc4df:      	vmovdqa	0x40(%rsp), %ymm12
  2fc4e5:      	vpand	%ymm1, %ymm12, %ymm1
  2fc4e9:      	vpsrlq	$0x1a, %ymm2, %ymm4
  2fc4ee:      	vpaddq	0x260(%rsp), %ymm4, %ymm4
  2fc4f7:      	vpand	%ymm3, %ymm12, %ymm3
  2fc4fb:      	vpand	%ymm2, %ymm12, %ymm5
  2fc4ff:      	vpsrlq	$0x1a, %ymm0, %ymm2
  2fc504:      	vpsllq	$0x2, %ymm2, %ymm6
  2fc509:      	vpaddq	%ymm1, %ymm2, %ymm1
  2fc50d:      	vpaddq	%ymm1, %ymm6, %ymm2
  2fc511:      	vpsrlq	$0x1a, %ymm4, %ymm1
  2fc516:      	vpaddq	%ymm3, %ymm1, %ymm1
  2fc51a:      	vpand	%ymm4, %ymm12, %ymm4
  2fc51e:      	vpsrlq	$0x1a, %ymm2, %ymm3
  2fc523:      	vpand	%ymm2, %ymm12, %ymm6
  2fc527:      	vpand	%ymm1, %ymm12, %ymm7
  2fc52b:      	vmovdqa	0x2c0(%rsp), %ymm8
  2fc534:      	vpsrlq	$0x1a, %ymm8, %ymm2
  2fc53a:      	vpaddq	0x2e0(%rsp), %ymm2, %ymm9
  2fc543:      	vmovdqa	0x320(%rsp), %ymm10
  2fc54c:      	vpsrlq	$0x1a, %ymm10, %ymm2
  2fc552:      	vpaddq	0x340(%rsp), %ymm2, %ymm2
  2fc55b:      	vpand	%ymm12, %ymm8, %ymm8
  2fc560:      	vpsrlq	$0x1a, %ymm9, %ymm11
  2fc566:      	vpaddq	0x300(%rsp), %ymm11, %ymm11
  2fc56f:      	vpand	%ymm12, %ymm10, %ymm10
  2fc574:      	vpand	%ymm12, %ymm9, %ymm9
  2fc579:      	vpaddq	%ymm5, %ymm9, %ymm5
  2fc57d:      	vpaddq	%ymm3, %ymm5, %ymm5
  2fc581:      	vpsrlq	$0x1a, %ymm2, %ymm3
  2fc586:      	vpsllq	$0x2, %ymm3, %ymm9
  2fc58b:      	vpaddq	%ymm3, %ymm8, %ymm3
  2fc58f:      	vpaddq	%ymm3, %ymm9, %ymm8
  2fc593:      	vpsrlq	$0x1a, %ymm11, %ymm3
  2fc599:      	vpaddq	%ymm3, %ymm10, %ymm3
  2fc59d:      	vpand	%ymm12, %ymm11, %ymm9
  2fc5a2:      	vpaddq	%ymm4, %ymm9, %ymm4
  2fc5a6:      	vpsrlq	$0x1a, %ymm8, %ymm9
  2fc5ac:      	vpaddq	%ymm5, %ymm9, %ymm5
  2fc5b0:      	vpand	%ymm12, %ymm8, %ymm8
  2fc5b5:      	vpaddq	%ymm6, %ymm8, %ymm6
  2fc5b9:      	vpand	%ymm3, %ymm12, %ymm8
  2fc5bd:      	vpaddq	%ymm7, %ymm8, %ymm7
  2fc5c1:      	vpshufd	$0xee, %xmm6, %xmm8     # xmm8 = xmm6[2,3,2,3]
  2fc5c6:      	vextracti128	$0x1, %ymm6, %xmm9
  2fc5cc:      	vpermq	$0xff, %ymm6, %ymm10    # ymm10 = ymm6[3,3,3,3]
  2fc5d2:      	vpaddq	%xmm6, %xmm8, %xmm6
  2fc5d6:      	vpaddq	%xmm10, %xmm9, %xmm8
  2fc5db:      	vpaddq	%xmm6, %xmm8, %xmm6
  2fc5df:      	vmovq	%xmm6, %rdx
  2fc5e4:      	vpshufd	$0xee, %xmm5, %xmm6     # xmm6 = xmm5[2,3,2,3]
  2fc5e9:      	vextracti128	$0x1, %ymm5, %xmm8
  2fc5ef:      	vpermq	$0xff, %ymm5, %ymm9     # ymm9 = ymm5[3,3,3,3]
  2fc5f5:      	vpaddq	%xmm6, %xmm5, %xmm5
  2fc5f9:      	vpaddq	%xmm9, %xmm8, %xmm6
  2fc5fe:      	vpaddq	%xmm6, %xmm5, %xmm5
  2fc602:      	vmovq	%xmm5, %rsi
  2fc607:      	vpshufd	$0xee, %xmm4, %xmm5     # xmm5 = xmm4[2,3,2,3]
  2fc60c:      	vextracti128	$0x1, %ymm4, %xmm6
  2fc612:      	vpermq	$0xff, %ymm4, %ymm8     # ymm8 = ymm4[3,3,3,3]
  2fc618:      	vpaddq	%xmm5, %xmm4, %xmm4
  2fc61c:      	vpaddq	%xmm6, %xmm8, %xmm5
  2fc620:      	vpaddq	%xmm5, %xmm4, %xmm4
  2fc624:      	vmovq	%xmm4, %r9
  2fc629:      	vpshufd	$0xee, %xmm7, %xmm4     # xmm4 = xmm7[2,3,2,3]
  2fc62e:      	vextracti128	$0x1, %ymm7, %xmm5
  2fc634:      	vpermq	$0xff, %ymm7, %ymm6     # ymm6 = ymm7[3,3,3,3]
  2fc63a:      	vpaddq	%xmm4, %xmm7, %xmm4
  2fc63e:      	vpaddq	%xmm6, %xmm5, %xmm5
  2fc642:      	vpaddq	%xmm5, %xmm4, %xmm4
  2fc646:      	vmovq	%xmm4, %rcx
  2fc64b:      	movq	%rsi, %rdi
  2fc64e:      	shrq	$0x26, %rdi
  2fc652:      	shlq	$0x1a, %rsi
  2fc656:      	movq	%r9, %r8
  2fc659:      	shrq	$0xc, %r8
  2fc65d:      	shlq	$0x34, %r9
  2fc661:      	addq	%rdx, %r9
  2fc664:      	adcq	$0x0, %r8
  2fc668:      	addq	%rsi, %r9
  2fc66b:      	adcq	%rdi, %r8
  2fc66e:      	shlq	$0xe, %rcx
  2fc672:      	addq	%r8, %rcx
  2fc675:      	jb	0x2fc723 <toyos_crypto::arch::x86_64::poly1305::blocks+0x1423>
  2fc67b:      	movabsq	$0x7fffffffffffff8, %rdx # imm = 0x7FFFFFFFFFFFFF8
  2fc685:      	movq	0xb0(%rsp), %rax
  2fc68d:      	andq	%rdx, %rax
  2fc690:      	vpsrlq	$0x1a, %ymm1, %ymm1
  2fc695:      	vpand	%ymm0, %ymm12, %ymm0
  2fc699:      	vpand	%ymm2, %ymm12, %ymm2
  2fc69d:      	vpaddq	%ymm2, %ymm0, %ymm0
  2fc6a1:      	vpaddq	%ymm0, %ymm1, %ymm0
  2fc6a5:      	vpsrlq	$0x1a, %ymm3, %ymm1
  2fc6aa:      	vpaddq	%ymm1, %ymm0, %ymm0
  2fc6ae:      	vpshufd	$0xee, %xmm0, %xmm1     # xmm1 = xmm0[2,3,2,3]
  2fc6b3:      	vextracti128	$0x1, %ymm0, %xmm2
  2fc6b9:      	vpermq	$0xff, %ymm0, %ymm3     # ymm3 = ymm0[3,3,3,3]
  2fc6bf:      	vpaddq	%xmm1, %xmm0, %xmm0
  2fc6c3:      	vpaddq	%xmm3, %xmm2, %xmm1
  2fc6c7:      	vpaddq	%xmm1, %xmm0, %xmm0
  2fc6cb:      	vmovq	%xmm0, %rdx
  2fc6d0:      	movq	%rdx, %rsi
  2fc6d3:      	shrq	$0x18, %rsi
  2fc6d7:      	shlq	$0x28, %rdx
  2fc6db:      	addq	%rdx, %rcx
  2fc6de:      	adcq	$0x0, %rsi
  2fc6e2:      	movl	%esi, %edx
  2fc6e4:      	andl	$0x3, %edx
  2fc6e7:      	shrq	$0x2, %rsi
  2fc6eb:      	leaq	(%rsi,%rsi,4), %rsi
  2fc6ef:      	addq	%rsi, %r9
  2fc6f2:      	adcq	$0x0, %rcx
  2fc6f6:      	adcq	$0x0, %rdx
  2fc6fa:      	movq	0xa8(%rsp), %rsi
  2fc702:      	movq	%r9, (%rsi)
  2fc705:      	movq	%rcx, 0x8(%rsi)
  2fc709:      	movq	%rdx, 0x10(%rsi)
  2fc70d:      	jmp	0x2fc711 <toyos_crypto::arch::x86_64::poly1305::blocks+0x1411>
  2fc70f:      	xorl	%eax, %eax
  2fc711:      	leaq	-0x28(%rbp), %rsp
  2fc715:      	popq	%rbx
  2fc716:      	popq	%r12
  2fc718:      	popq	%r13
  2fc71a:      	popq	%r14
  2fc71c:      	popq	%r15
  2fc71e:      	popq	%rbp
  2fc71f:      	vzeroupper
  2fc722:      	retq
  2fc723:      	leaq	0x504b0e(%rip), %rdi    # 0x801238 <anon.5671b1afcf0deb4901e628e66543ca25.9.llvm.14831336972970403172+0xf0>
  2fc72a:      	vzeroupper
  2fc72d:      	callq	*0x577905(%rip)         # 0x874038 <sdallocx+0x874038>
