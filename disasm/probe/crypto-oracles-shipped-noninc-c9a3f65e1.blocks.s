
crypto-oracles-shipped-noninc-c9a3f65e1:	file format elf64-x86-64

Disassembly of section .text:

00000000002fb1c0 <toyos_crypto::arch::x86_64::poly1305::blocks>:
  2fb1c0:      	pushq	%rbp
  2fb1c1:      	movq	%rsp, %rbp
  2fb1c4:      	pushq	%r15
  2fb1c6:      	pushq	%r14
  2fb1c8:      	pushq	%r13
  2fb1ca:      	pushq	%r12
  2fb1cc:      	pushq	%rbx
  2fb1cd:      	andq	$-0x20, %rsp
  2fb1d1:      	subq	$0x580, %rsp            # imm = 0x580
  2fb1d8:      	movq	%rcx, %r13
  2fb1db:      	shrq	$0x3, %r13
  2fb1df:      	je	0x2fc19b <toyos_crypto::arch::x86_64::poly1305::blocks+0xfdb>
  2fb1e5:      	movq	%rdx, %r8
  2fb1e8:      	movq	%rcx, 0xb0(%rsp)
  2fb1f0:      	movq	(%rsi), %rcx
  2fb1f3:      	movq	0x8(%rsi), %rax
  2fb1f7:      	movl	%ecx, %edx
  2fb1f9:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  2fb1ff:      	movl	%edx, 0x1c0(%rsp)
  2fb206:      	movq	%rax, %rdx
  2fb209:      	shldq	$0xc, %rcx, %rdx
  2fb20e:      	shrq	$0x1a, %rcx
  2fb212:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  2fb218:      	movq	%rcx, 0x1a0(%rsp)
  2fb220:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  2fb226:      	movq	%rdx, 0x180(%rsp)
  2fb22e:      	shrq	$0xe, %rax
  2fb232:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fb237:      	movq	%rax, 0x160(%rsp)
  2fb23f:      	movq	0x10(%rdi), %rcx
  2fb243:      	movq	%rcx, 0x220(%rsp)
  2fb24b:      	movq	(%rdi), %r14
  2fb24e:      	movq	0x8(%rdi), %r11
  2fb252:      	movq	%r11, %rax
  2fb255:      	mulq	%rcx
  2fb258:      	movq	%rdx, %r10
  2fb25b:      	movq	%rax, %rdi
  2fb25e:      	movq	%r14, %rax
  2fb261:      	mulq	%r14
  2fb264:      	movq	%rdx, %r9
  2fb267:      	movq	%rax, %rcx
  2fb26a:      	addq	%rdi, %rcx
  2fb26d:      	adcq	%r10, %r9
  2fb270:      	movq	%r11, %rax
  2fb273:      	movq	%r11, 0x40(%rsp)
  2fb278:      	mulq	%r14
  2fb27b:      	movq	%rax, %r12
  2fb27e:      	shldq	$0x1, %rax, %rdx
  2fb283:      	addq	%rax, %r12
  2fb286:      	addq	%r9, %r12
  2fb289:      	adcq	$0x0, %rdx
  2fb28d:      	movl	%edx, %r15d
  2fb290:      	andl	$0x3, %r15d
  2fb294:      	shrq	$0x2, %rdx
  2fb298:      	leaq	(%rdx,%rdx,4), %rbx
  2fb29c:      	addq	%rcx, %rbx
  2fb29f:      	adcq	$0x0, %r12
  2fb2a3:      	adcq	$0x0, %r15
  2fb2a7:      	movq	%rsi, 0xb8(%rsp)
  2fb2af:      	movq	%r15, %r10
  2fb2b2:      	movq	%r15, 0x80(%rsp)
  2fb2ba:      	movq	%r12, %rax
  2fb2bd:      	movq	%r12, 0x60(%rsp)
  2fb2c2:      	mulq	%r14
  2fb2c5:      	movq	%rax, %rsi
  2fb2c8:      	movq	%rdx, %rdi
  2fb2cb:      	imulq	%r14, %r10
  2fb2cf:      	movq	%rbx, 0x2a0(%rsp)
  2fb2d7:      	movq	%rbx, %rax
  2fb2da:      	mulq	%r11
  2fb2dd:      	movq	%rdx, %rcx
  2fb2e0:      	movq	%rax, %r9
  2fb2e3:      	addq	%rsi, %r9
  2fb2e6:      	adcq	%rdi, %rcx
  2fb2e9:      	movq	%r12, %rax
  2fb2ec:      	movq	0x220(%rsp), %r12
  2fb2f4:      	mulq	%r12
  2fb2f7:      	movq	%rdx, %rdi
  2fb2fa:      	movq	%rax, %r11
  2fb2fd:      	movq	%rbx, %rax
  2fb300:      	mulq	%r14
  2fb303:      	movq	%rdx, %rbx
  2fb306:      	movq	%rax, %rsi
  2fb309:      	addq	%r11, %rsi
  2fb30c:      	adcq	%rdi, %rbx
  2fb30f:      	addq	%r9, %rbx
  2fb312:      	adcq	$0x0, %rcx
  2fb316:      	movq	%r15, %rax
  2fb319:      	mulq	%r12
  2fb31c:      	movq	%r12, %r15
  2fb31f:      	addq	%rbx, %rax
  2fb322:      	adcq	%rcx, %rdx
  2fb325:      	addq	%r10, %rdx
  2fb328:      	movl	%edx, %r12d
  2fb32b:      	andl	$0x3, %r12d
  2fb32f:      	shrq	$0x2, %rdx
  2fb333:      	leaq	(%rdx,%rdx,4), %rbx
  2fb337:      	addq	%rsi, %rbx
  2fb33a:      	adcq	$0x0, %rax
  2fb33e:      	adcq	$0x0, %r12
  2fb342:      	movq	%rax, %r11
  2fb345:      	movq	%rax, 0x120(%rsp)
  2fb34d:      	mulq	%r14
  2fb350:      	movq	%rax, %rsi
  2fb353:      	movq	%rdx, %rdi
  2fb356:      	movq	%r12, %r10
  2fb359:      	movq	%r12, 0x140(%rsp)
  2fb361:      	imulq	%r14, %r10
  2fb365:      	movq	%rbx, 0x100(%rsp)
  2fb36d:      	movq	%rbx, %rax
  2fb370:      	mulq	0x40(%rsp)
  2fb375:      	movq	%rdx, %rcx
  2fb378:      	movq	%rax, %r9
  2fb37b:      	addq	%rsi, %r9
  2fb37e:      	adcq	%rdi, %rcx
  2fb381:      	movq	%r11, %rax
  2fb384:      	mulq	%r15
  2fb387:      	movq	%rdx, %rsi
  2fb38a:      	movq	%rax, %r11
  2fb38d:      	movq	%rbx, %rax
  2fb390:      	mulq	%r14
  2fb393:      	movq	%rdx, %rbx
  2fb396:      	movq	%rax, %rdi
  2fb399:      	addq	%r11, %rdi
  2fb39c:      	adcq	%rsi, %rbx
  2fb39f:      	addq	%r9, %rbx
  2fb3a2:      	adcq	$0x0, %rcx
  2fb3a6:      	movq	%r12, %rax
  2fb3a9:      	mulq	%r15
  2fb3ac:      	movq	%r15, %r11
  2fb3af:      	movq	%rax, %r12
  2fb3b2:      	addq	%rbx, %r12
  2fb3b5:      	adcq	%rcx, %rdx
  2fb3b8:      	addq	%r10, %rdx
  2fb3bb:      	movl	%edx, %eax
  2fb3bd:      	andl	$0x3, %eax
  2fb3c0:      	shrq	$0x2, %rdx
  2fb3c4:      	leaq	(%rdx,%rdx,4), %rcx
  2fb3c8:      	addq	%rdi, %rcx
  2fb3cb:      	adcq	$0x0, %r12
  2fb3cf:      	adcq	$0x0, %rax
  2fb3d3:      	movq	%rax, %r15
  2fb3d6:      	movq	%rax, 0x2e0(%rsp)
  2fb3de:      	mulq	%r11
  2fb3e1:      	movq	%r11, %rdi
  2fb3e4:      	movq	%rdx, 0xe0(%rsp)
  2fb3ec:      	movq	%rax, 0xc0(%rsp)
  2fb3f4:      	movq	%rcx, %rax
  2fb3f7:      	movq	%rcx, 0x2c0(%rsp)
  2fb3ff:      	movq	0x40(%rsp), %rsi
  2fb404:      	mulq	%rsi
  2fb407:      	movq	%rdx, %r11
  2fb40a:      	movq	%rax, %rbx
  2fb40d:      	movq	%r12, %rax
  2fb410:      	movq	%r12, 0x300(%rsp)
  2fb418:      	movq	%r14, %r10
  2fb41b:      	mulq	%r14
  2fb41e:      	movq	%rdx, %r9
  2fb421:      	movq	%rax, %r14
  2fb424:      	addq	%rbx, %r14
  2fb427:      	adcq	%r11, %r9
  2fb42a:      	movq	%rcx, %rax
  2fb42d:      	mulq	%r10
  2fb430:      	movq	%rdx, %r11
  2fb433:      	movq	%rax, %rbx
  2fb436:      	movq	%r12, %rax
  2fb439:      	movq	%rdi, %r12
  2fb43c:      	mulq	%rdi
  2fb43f:      	addq	%rbx, %rax
  2fb442:      	adcq	%r11, %rdx
  2fb445:      	addq	%r14, %rdx
  2fb448:      	adcq	$0x0, %r9
  2fb44c:      	addq	0xc0(%rsp), %rdx
  2fb454:      	movq	%rdx, %rdi
  2fb457:      	adcq	0xe0(%rsp), %r9
  2fb45f:      	movq	%r15, %rdx
  2fb462:      	imulq	%r10, %rdx
  2fb466:      	addq	%r9, %rdx
  2fb469:      	movq	%rdx, %rcx
  2fb46c:      	shrq	$0x2, %rcx
  2fb470:      	leaq	(%rcx,%rcx,4), %r15
  2fb474:      	andl	$0x3, %edx
  2fb477:      	addq	%rax, %r15
  2fb47a:      	adcq	$0x0, %rdi
  2fb47e:      	adcq	$0x0, %rdx
  2fb482:      	movq	%rdx, %rax
  2fb485:      	movq	%rdx, %rcx
  2fb488:      	movq	%rdx, 0xe0(%rsp)
  2fb490:      	mulq	%r12
  2fb493:      	movq	%r12, %r9
  2fb496:      	movq	%rdx, 0x260(%rsp)
  2fb49e:      	movq	%rax, 0x240(%rsp)
  2fb4a6:      	movq	%r15, %rax
  2fb4a9:      	movq	%r15, 0x280(%rsp)
  2fb4b1:      	mulq	%rsi
  2fb4b4:      	movq	%rdx, %rbx
  2fb4b7:      	movq	%rax, %r14
  2fb4ba:      	movq	%rdi, %rax
  2fb4bd:      	movq	%rdi, 0xc0(%rsp)
  2fb4c5:      	mulq	%r10
  2fb4c8:      	movq	%rdx, %r11
  2fb4cb:      	movq	%rax, %r12
  2fb4ce:      	addq	%r14, %r12
  2fb4d1:      	adcq	%rbx, %r11
  2fb4d4:      	movq	%r15, %rax
  2fb4d7:      	mulq	%r10
  2fb4da:      	movq	%rdx, %rbx
  2fb4dd:      	movq	%rax, %r14
  2fb4e0:      	movq	%rdi, %rax
  2fb4e3:      	mulq	%r9
  2fb4e6:      	movq	%rdx, %r15
  2fb4e9:      	addq	%r14, %rax
  2fb4ec:      	adcq	%rbx, %r15
  2fb4ef:      	addq	%r12, %r15
  2fb4f2:      	adcq	$0x0, %r11
  2fb4f6:      	addq	0x240(%rsp), %r15
  2fb4fe:      	adcq	0x260(%rsp), %r11
  2fb506:      	movq	%rcx, %rdi
  2fb509:      	imulq	%r10, %rdi
  2fb50d:      	addq	%r11, %rdi
  2fb510:      	movq	%rdi, %rcx
  2fb513:      	shrq	$0x2, %rcx
  2fb517:      	leaq	(%rcx,%rcx,4), %rbx
  2fb51b:      	andl	$0x3, %edi
  2fb51e:      	addq	%rax, %rbx
  2fb521:      	adcq	$0x0, %r15
  2fb525:      	adcq	$0x0, %rdi
  2fb529:      	movq	%rdi, %rax
  2fb52c:      	movq	%rdi, 0x260(%rsp)
  2fb534:      	movq	%r9, %r14
  2fb537:      	mulq	%r9
  2fb53a:      	movq	%rdx, 0x200(%rsp)
  2fb542:      	movq	%rax, 0x1e0(%rsp)
  2fb54a:      	movq	%rbx, %rax
  2fb54d:      	movq	%rbx, 0x240(%rsp)
  2fb555:      	mulq	%rsi
  2fb558:      	movq	%rdx, %r11
  2fb55b:      	movq	%rax, %r12
  2fb55e:      	movq	%r15, %rax
  2fb561:      	mulq	%r10
  2fb564:      	movq	%rdx, %rcx
  2fb567:      	movq	%rax, %r9
  2fb56a:      	addq	%r12, %r9
  2fb56d:      	adcq	%r11, %rcx
  2fb570:      	movq	%rbx, %rax
  2fb573:      	mulq	%r10
  2fb576:      	movq	%rdx, %r12
  2fb579:      	movq	%rax, %rsi
  2fb57c:      	movq	%r15, %rax
  2fb57f:      	mulq	%r14
  2fb582:      	movq	%rdx, %r11
  2fb585:      	addq	%rsi, %rax
  2fb588:      	adcq	%r12, %r11
  2fb58b:      	addq	%r9, %r11
  2fb58e:      	adcq	$0x0, %rcx
  2fb592:      	addq	0x1e0(%rsp), %r11
  2fb59a:      	adcq	0x200(%rsp), %rcx
  2fb5a2:      	movq	%rdi, %rbx
  2fb5a5:      	movq	%r10, %rsi
  2fb5a8:      	imulq	%r10, %rbx
  2fb5ac:      	addq	%rcx, %rbx
  2fb5af:      	movq	%rbx, %rcx
  2fb5b2:      	shrq	$0x2, %rcx
  2fb5b6:      	leaq	(%rcx,%rcx,4), %r10
  2fb5ba:      	andl	$0x3, %ebx
  2fb5bd:      	addq	%rax, %r10
  2fb5c0:      	adcq	$0x0, %r11
  2fb5c4:      	adcq	$0x0, %rbx
  2fb5c8:      	movq	%rbx, %rax
  2fb5cb:      	mulq	%r14
  2fb5ce:      	movq	%rdx, 0x200(%rsp)
  2fb5d6:      	movq	%rax, 0x1e0(%rsp)
  2fb5de:      	movq	%r10, %rax
  2fb5e1:      	mulq	0x40(%rsp)
  2fb5e6:      	movq	%rdx, %r9
  2fb5e9:      	movq	%rax, %rdi
  2fb5ec:      	movq	%r11, %rax
  2fb5ef:      	mulq	%rsi
  2fb5f2:      	movq	%rdx, %r12
  2fb5f5:      	movq	%rax, %rcx
  2fb5f8:      	addq	%rdi, %rcx
  2fb5fb:      	adcq	%r9, %r12
  2fb5fe:      	movq	%r10, %rax
  2fb601:      	mulq	%rsi
  2fb604:      	movq	%rsi, %r9
  2fb607:      	movq	%rsi, 0x320(%rsp)
  2fb60f:      	movq	%rdx, %rsi
  2fb612:      	movq	%rax, %rdi
  2fb615:      	movq	%r11, %rax
  2fb618:      	mulq	%r14
  2fb61b:      	addq	%rdi, %rax
  2fb61e:      	adcq	%rsi, %rdx
  2fb621:      	addq	%rcx, %rdx
  2fb624:      	adcq	$0x0, %r12
  2fb628:      	addq	0x1e0(%rsp), %rdx
  2fb630:      	adcq	0x200(%rsp), %r12
  2fb638:      	movq	%rbx, %rsi
  2fb63b:      	imulq	%r9, %rsi
  2fb63f:      	addq	%r12, %rsi
  2fb642:      	movq	%rsi, %rcx
  2fb645:      	shrq	$0x2, %rcx
  2fb649:      	leaq	(%rcx,%rcx,4), %rcx
  2fb64d:      	andl	$0x3, %esi
  2fb650:      	addq	%rax, %rcx
  2fb653:      	adcq	$0x0, %rdx
  2fb657:      	adcq	$0x0, %rsi
  2fb65b:      	movl	%ecx, %eax
  2fb65d:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fb662:      	movq	%rdx, %rdi
  2fb665:      	shldq	$0xc, %rcx, %rdi
  2fb66a:      	shrq	$0x1a, %rcx
  2fb66e:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  2fb674:      	shldq	$0x18, %rdx, %rsi
  2fb679:      	andl	$0x3ffffff, %edi        # imm = 0x3FFFFFF
  2fb67f:      	shrq	$0xe, %rdx
  2fb683:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  2fb689:      	movq	%rax, (%rsp)
  2fb68d:      	movq	%rcx, 0x8(%rsp)
  2fb692:      	movq	%rdi, 0x10(%rsp)
  2fb697:      	movq	%rdx, 0x18(%rsp)
  2fb69c:      	movq	%rsi, 0x20(%rsp)
  2fb6a1:      	movq	%rax, 0x28(%rsp)
  2fb6a6:      	movq	%rcx, 0x30(%rsp)
  2fb6ab:      	movq	%rdi, 0x38(%rsp)
  2fb6b0:      	vmovups	(%rsp), %ymm0
  2fb6b5:      	vmovaps	%ymm0, 0x340(%rsp)
  2fb6be:      	vmovdqu	0x8(%rsp), %ymm12
  2fb6c4:      	vmovdqu	0x10(%rsp), %ymm13
  2fb6ca:      	vmovdqu	0x18(%rsp), %ymm14
  2fb6d0:      	vmovdqu	0x20(%rsp), %ymm15
  2fb6d6:      	movq	0x240(%rsp), %r14
  2fb6de:      	movl	%r14d, %r12d
  2fb6e1:      	andl	$0x3ffffff, %r12d       # imm = 0x3FFFFFF
  2fb6e8:      	movq	%rax, 0x220(%rsp)
  2fb6f0:      	movq	%rax, (%rsp)
  2fb6f4:      	movq	%rcx, 0x8(%rsp)
  2fb6f9:      	movq	%rdi, 0xa8(%rsp)
  2fb701:      	movq	%rdi, 0x10(%rsp)
  2fb706:      	movq	%rdx, 0x18(%rsp)
  2fb70b:      	movq	%rsi, 0x20(%rsp)
  2fb710:      	movq	%r12, 0x28(%rsp)
  2fb715:      	vmovdqu	(%rsp), %xmm4
  2fb71a:      	vmovdqu	0x8(%rsp), %xmm3
  2fb720:      	vmovdqu	0x10(%rsp), %xmm2
  2fb726:      	vmovdqu	0x18(%rsp), %xmm1
  2fb72c:      	vmovdqu	0x20(%rsp), %xmm0
  2fb732:      	movq	0x2c0(%rsp), %r9
  2fb73a:      	movl	%r9d, %eax
  2fb73d:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fb742:      	movq	%rax, (%rsp)
  2fb746:      	movq	0x300(%rsp), %rdi
  2fb74e:      	movq	%rdi, %rax
  2fb751:      	shldq	$0xc, %r9, %rax
  2fb756:      	shrq	$0x1a, %r9
  2fb75a:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
  2fb761:      	movq	%r9, 0x8(%rsp)
  2fb766:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fb76b:      	movq	%rax, 0x10(%rsp)
  2fb770:      	movq	%rdi, %rax
  2fb773:      	movq	0x2e0(%rsp), %rdi
  2fb77b:      	shldq	$0x18, %rax, %rdi
  2fb780:      	shrq	$0xe, %rax
  2fb784:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fb789:      	movq	%rax, 0x18(%rsp)
  2fb78e:      	movq	%rdi, 0x20(%rsp)
  2fb793:      	vpinsrq	$0x1, %r12, %xmm4, %xmm4
  2fb799:      	movl	%r10d, %eax
  2fb79c:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fb7a1:      	vmovq	%rax, %xmm5
  2fb7a6:      	movq	%r15, %rax
  2fb7a9:      	movq	%r14, %rdi
  2fb7ac:      	shldq	$0xc, %r14, %rax
  2fb7b1:      	shrq	$0x1a, %rdi
  2fb7b5:      	andl	$0x3ffffff, %edi        # imm = 0x3FFFFFF
  2fb7bb:      	vpinsrq	$0x1, %rdi, %xmm3, %xmm3
  2fb7c1:      	movq	0x280(%rsp), %r12
  2fb7c9:      	movl	%r12d, %r14d
  2fb7cc:      	andl	$0x3ffffff, %r14d       # imm = 0x3FFFFFF
  2fb7d3:      	vmovq	%r14, %xmm8
  2fb7d8:      	movq	%r11, %r14
  2fb7db:      	shldq	$0xc, %r10, %r14
  2fb7e0:      	shrq	$0x1a, %r10
  2fb7e4:      	andl	$0x3ffffff, %r10d       # imm = 0x3FFFFFF
  2fb7eb:      	vmovq	%r10, %xmm6
  2fb7f0:      	movq	0xc0(%rsp), %rdi
  2fb7f8:      	movq	%rdi, %r10
  2fb7fb:      	shldq	$0xc, %r12, %r10
  2fb800:      	shrq	$0x1a, %r12
  2fb804:      	andl	$0x3ffffff, %r12d       # imm = 0x3FFFFFF
  2fb80b:      	vmovq	%r12, %xmm10
  2fb810:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fb815:      	vpinsrq	$0x1, %rax, %xmm2, %xmm7
  2fb81b:      	andl	$0x3ffffff, %r14d       # imm = 0x3FFFFFF
  2fb822:      	vmovq	%r14, %xmm9
  2fb827:      	andl	$0x3ffffff, %r10d       # imm = 0x3FFFFFF
  2fb82e:      	vmovq	%r10, %xmm2
  2fb833:      	movq	0x260(%rsp), %r9
  2fb83b:      	shldq	$0x18, %r15, %r9
  2fb840:      	shrq	$0xe, %r15
  2fb844:      	andl	$0x3ffffff, %r15d       # imm = 0x3FFFFFF
  2fb84b:      	vpinsrq	$0x1, %r15, %xmm1, %xmm1
  2fb851:      	shldq	$0x18, %r11, %rbx
  2fb856:      	shrq	$0xe, %r11
  2fb85a:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
  2fb861:      	vpbroadcastq	%xmm5, %ymm5
  2fb866:      	vpblendd	$0x30, %ymm5, %ymm4, %ymm4 # ymm4 = ymm4[0,1,2,3],ymm5[4,5],ymm4[6,7]
  2fb86c:      	vmovq	%r11, %xmm5
  2fb871:      	movq	0xe0(%rsp), %r10
  2fb879:      	shldq	$0x18, %rdi, %r10
  2fb87e:      	shrq	$0xe, %rdi
  2fb882:      	andl	$0x3ffffff, %edi        # imm = 0x3FFFFFF
  2fb888:      	vpbroadcastq	%xmm8, %ymm8
  2fb88d:      	vpblendd	$0xc0, %ymm8, %ymm4, %ymm4 # ymm4 = ymm4[0,1,2,3,4,5],ymm8[6,7]
  2fb893:      	vmovdqa	%ymm4, 0x200(%rsp)
  2fb89c:      	vmovq	%rdi, %xmm4
  2fb8a1:      	vpinsrq	$0x1, %r9, %xmm0, %xmm0
  2fb8a7:      	vpbroadcastq	%xmm6, %ymm6
  2fb8ac:      	vpblendd	$0x30, %ymm6, %ymm3, %ymm3 # ymm3 = ymm3[0,1,2,3],ymm6[4,5],ymm3[6,7]
  2fb8b2:      	vmovq	%rbx, %xmm6
  2fb8b7:      	vpbroadcastq	%xmm10, %ymm8
  2fb8bc:      	vpblendd	$0xc0, %ymm8, %ymm3, %ymm10 # ymm10 = ymm3[0,1,2,3,4,5],ymm8[6,7]
  2fb8c2:      	vmovq	%r10, %xmm3
  2fb8c7:      	movq	0x2a0(%rsp), %rbx
  2fb8cf:      	movl	%ebx, %r9d
  2fb8d2:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
  2fb8d9:      	movq	%r9, 0x28(%rsp)
  2fb8de:      	vpbroadcastq	%xmm9, %ymm8
  2fb8e3:      	vpblendd	$0x30, %ymm8, %ymm7, %ymm7 # ymm7 = ymm7[0,1,2,3],ymm8[4,5],ymm7[6,7]
  2fb8e9:      	vmovdqu	(%rsp), %xmm8
  2fb8ee:      	vpinsrq	$0x1, %r9, %xmm8, %xmm8
  2fb8f4:      	vpbroadcastq	%xmm2, %ymm2
  2fb8f9:      	vpblendd	$0xc0, %ymm2, %ymm7, %ymm7 # ymm7 = ymm7[0,1,2,3,4,5],ymm2[6,7]
  2fb8ff:      	movq	0x100(%rsp), %r15
  2fb907:      	movl	%r15d, %eax
  2fb90a:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fb90f:      	vmovq	%rax, %xmm2
  2fb914:      	movq	0x60(%rsp), %r11
  2fb919:      	movq	%r11, %r10
  2fb91c:      	movq	%rbx, %r9
  2fb91f:      	shldq	$0xc, %rbx, %r10
  2fb924:      	vpbroadcastq	%xmm5, %ymm5
  2fb929:      	vpblendd	$0x30, %ymm5, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm5[4,5],ymm1[6,7]
  2fb92f:      	movq	0x320(%rsp), %rbx
  2fb937:      	movl	%ebx, %eax
  2fb939:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fb93e:      	vmovq	%rax, %xmm5
  2fb943:      	movq	%r9, %rax
  2fb946:      	shrq	$0x1a, %rax
  2fb94a:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fb94f:      	vpbroadcastq	%xmm4, %ymm4
  2fb954:      	vpblendd	$0xc0, %ymm4, %ymm1, %ymm9 # ymm9 = ymm1[0,1,2,3,4,5],ymm4[6,7]
  2fb95a:      	vmovdqu	0x8(%rsp), %xmm1
  2fb960:      	vpinsrq	$0x1, %rax, %xmm1, %xmm1
  2fb966:      	vpbroadcastq	%xmm6, %ymm4
  2fb96b:      	movq	0x120(%rsp), %r14
  2fb973:      	movq	%r14, %r9
  2fb976:      	movq	%r15, %rax
  2fb979:      	shldq	$0xc, %r15, %r9
  2fb97e:      	vpblendd	$0x30, %ymm4, %ymm0, %ymm4 # ymm4 = ymm0[0,1,2,3],ymm4[4,5],ymm0[6,7]
  2fb984:      	shrq	$0x1a, %rax
  2fb988:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fb98d:      	vmovq	%rax, %xmm0
  2fb992:      	vpbroadcastq	%xmm3, %ymm3
  2fb997:      	movq	0x40(%rsp), %r15
  2fb99c:      	movq	%r15, %rax
  2fb99f:      	shldq	$0xc, %rbx, %rax
  2fb9a4:      	vpblendd	$0xc0, %ymm3, %ymm4, %ymm6 # ymm6 = ymm4[0,1,2,3,4,5],ymm3[6,7]
  2fb9aa:      	shrq	$0x1a, %rbx
  2fb9ae:      	andl	$0x3ffffff, %ebx        # imm = 0x3FFFFFF
  2fb9b4:      	vmovq	%rbx, %xmm3
  2fb9b9:      	andl	$0x3ffffff, %r10d       # imm = 0x3FFFFFF
  2fb9c0:      	vpbroadcastq	%xmm2, %ymm2
  2fb9c5:      	vpblendd	$0x30, %ymm2, %ymm8, %ymm2 # ymm2 = ymm8[0,1,2,3],ymm2[4,5],ymm8[6,7]
  2fb9cb:      	vmovdqu	0x10(%rsp), %xmm4
  2fb9d1:      	vpinsrq	$0x1, %r10, %xmm4, %xmm4
  2fb9d7:      	movq	0xb8(%rsp), %r10
  2fb9df:      	vpbroadcastq	%xmm5, %ymm5
  2fb9e4:      	vpblendd	$0xc0, %ymm5, %ymm2, %ymm2 # ymm2 = ymm2[0,1,2,3,4,5],ymm5[6,7]
  2fb9ea:      	vmovdqa	%ymm2, 0x540(%rsp)
  2fb9f3:      	vmovdqu	0x18(%rsp), %xmm2
  2fb9f9:      	movq	0x80(%rsp), %rbx
  2fba01:      	shldq	$0x18, %r11, %rbx
  2fba06:      	shrq	$0xe, %r11
  2fba0a:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
  2fba11:      	vpinsrq	$0x1, %r11, %xmm2, %xmm2
  2fba17:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
  2fba1e:      	movq	%r14, %r11
  2fba21:      	movq	0x140(%rsp), %r14
  2fba29:      	shldq	$0x18, %r11, %r14
  2fba2e:      	vpbroadcastq	%xmm0, %ymm0
  2fba33:      	vpblendd	$0x30, %ymm0, %ymm1, %ymm0 # ymm0 = ymm1[0,1,2,3],ymm0[4,5],ymm1[6,7]
  2fba39:      	vmovq	%r9, %xmm1
  2fba3e:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fba43:      	vpbroadcastq	%xmm3, %ymm3
  2fba48:      	vpblendd	$0xc0, %ymm3, %ymm0, %ymm5 # ymm5 = ymm0[0,1,2,3,4,5],ymm3[6,7]
  2fba4e:      	vmovq	%rax, %xmm0
  2fba53:      	shrq	$0xe, %r11
  2fba57:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
  2fba5e:      	vpbroadcastq	%xmm1, %ymm1
  2fba63:      	vpblendd	$0x30, %ymm1, %ymm4, %ymm1 # ymm1 = ymm4[0,1,2,3],ymm1[4,5],ymm4[6,7]
  2fba69:      	vmovq	%r11, %xmm3
  2fba6e:      	vpbroadcastq	%xmm0, %ymm0
  2fba73:      	vpblendd	$0xc0, %ymm0, %ymm1, %ymm4 # ymm4 = ymm1[0,1,2,3,4,5],ymm0[6,7]
  2fba79:      	vmovdqu	0x20(%rsp), %xmm0
  2fba7f:      	vpinsrq	$0x1, %rbx, %xmm0, %xmm0
  2fba85:      	movq	%r15, %r9
  2fba88:      	movq	%r15, %rax
  2fba8b:      	shrq	$0xe, %rax
  2fba8f:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fba94:      	vpbroadcastq	%xmm3, %ymm1
  2fba99:      	vpblendd	$0x30, %ymm1, %ymm2, %ymm1 # ymm1 = ymm2[0,1,2,3],ymm1[4,5],ymm2[6,7]
  2fba9f:      	vmovq	%rax, %xmm2
  2fbaa4:      	vpbroadcastq	%xmm2, %ymm2
  2fbaa9:      	vpblendd	$0xc0, %ymm2, %ymm1, %ymm2 # ymm2 = ymm1[0,1,2,3,4,5],ymm2[6,7]
  2fbaaf:      	vmovq	%r14, %xmm1
  2fbab4:      	decq	%r13
  2fbab7:      	shrq	$0x28, %r9
  2fbabb:      	vpbroadcastq	%xmm1, %ymm1
  2fbac0:      	vpblendd	$0x30, %ymm1, %ymm0, %ymm0 # ymm0 = ymm0[0,1,2,3],ymm1[4,5],ymm0[6,7]
  2fbac6:      	vmovq	%r9, %xmm1
  2fbacb:      	movq	%r13, %r9
  2fbace:      	shlq	$0x7, %r9
  2fbad2:      	addq	%r8, %r9
  2fbad5:      	vpbroadcastq	%xmm1, %ymm1
  2fbada:      	vpblendd	$0xc0, %ymm1, %ymm0, %ymm1 # ymm1 = ymm0[0,1,2,3,4,5],ymm1[6,7]
  2fbae0:      	vpsllq	$0x2, %ymm10, %ymm0
  2fbae6:      	vmovdqa	%ymm10, 0x1e0(%rsp)
  2fbaef:      	vpaddq	%ymm0, %ymm10, %ymm0
  2fbaf3:      	vmovdqa	%ymm0, 0x360(%rsp)
  2fbafc:      	vpsllq	$0x2, %ymm7, %ymm0
  2fbb01:      	vmovdqa	%ymm7, 0x4e0(%rsp)
  2fbb0a:      	vpaddq	%ymm7, %ymm0, %ymm0
  2fbb0e:      	vmovdqa	%ymm0, 0x380(%rsp)
  2fbb17:      	vpsllq	$0x2, %ymm9, %ymm0
  2fbb1d:      	vmovdqa	%ymm9, 0x480(%rsp)
  2fbb26:      	vpaddq	%ymm0, %ymm9, %ymm0
  2fbb2a:      	vmovdqa	%ymm0, 0x3a0(%rsp)
  2fbb33:      	vpsllq	$0x2, %ymm6, %ymm0
  2fbb38:      	vmovdqa	%ymm6, 0x460(%rsp)
  2fbb41:      	vpaddq	%ymm6, %ymm0, %ymm0
  2fbb45:      	vmovdqa	%ymm0, 0x3c0(%rsp)
  2fbb4e:      	vpsllq	$0x2, %ymm5, %ymm0
  2fbb53:      	vmovdqa	%ymm5, 0x520(%rsp)
  2fbb5c:      	vpaddq	%ymm5, %ymm0, %ymm0
  2fbb60:      	vmovdqa	%ymm0, 0x3e0(%rsp)
  2fbb69:      	vpsllq	$0x2, %ymm4, %ymm0
  2fbb6e:      	vmovdqa	%ymm4, 0x500(%rsp)
  2fbb77:      	vpaddq	%ymm4, %ymm0, %ymm0
  2fbb7b:      	vmovdqa	%ymm0, 0x400(%rsp)
  2fbb84:      	vpsllq	$0x2, %ymm2, %ymm0
  2fbb89:      	vmovdqa	%ymm2, 0x4c0(%rsp)
  2fbb92:      	vpaddq	%ymm2, %ymm0, %ymm0
  2fbb96:      	vmovdqa	%ymm0, 0x420(%rsp)
  2fbb9f:      	vpsllq	$0x2, %ymm1, %ymm0
  2fbba4:      	vmovdqa	%ymm1, 0x4a0(%rsp)
  2fbbad:      	vpaddq	%ymm1, %ymm0, %ymm0
  2fbbb1:      	vmovdqa	%ymm0, 0x440(%rsp)
  2fbbba:      	vmovd	0x1c0(%rsp), %xmm5
  2fbbc3:      	vmovd	0x1a0(%rsp), %xmm11
  2fbbcc:      	vmovd	0x180(%rsp), %xmm8
  2fbbd5:      	vmovd	0x160(%rsp), %xmm6
  2fbbde:      	vmovq	0xd(%r10), %xmm10
  2fbbe4:      	testq	%r13, %r13
  2fbbe7:      	vmovdqa	%ymm6, 0x80(%rsp)
  2fbbf0:      	vmovdqa	%ymm8, 0x60(%rsp)
  2fbbf6:      	je	0x2fc1a2 <toyos_crypto::arch::x86_64::poly1305::blocks+0xfe2>
  2fbbfc:      	vpinsrq	$0x1, %rsi, %xmm15, %xmm0
  2fbc02:      	vmovq	%rsi, %xmm1
  2fbc07:      	vpbroadcastq	%xmm1, %ymm1
  2fbc0c:      	vpblendd	$0xf0, %ymm1, %ymm0, %ymm1 # ymm1 = ymm0[0,1,2,3],ymm1[4,5,6,7]
  2fbc12:      	vpsllq	$0x2, %ymm1, %ymm0
  2fbc17:      	vmovdqa	%ymm1, 0x140(%rsp)
  2fbc20:      	vpaddq	%ymm1, %ymm0, %ymm0
  2fbc24:      	vmovdqa	%ymm0, 0x2c0(%rsp)
  2fbc2d:      	vpinsrq	$0x1, %rdx, %xmm14, %xmm0
  2fbc33:      	vmovq	%rdx, %xmm1
  2fbc38:      	vpbroadcastq	%xmm1, %ymm1
  2fbc3d:      	vpblendd	$0xf0, %ymm1, %ymm0, %ymm2 # ymm2 = ymm0[0,1,2,3],ymm1[4,5,6,7]
  2fbc43:      	vpsllq	$0x2, %ymm2, %ymm0
  2fbc48:      	movq	0xa8(%rsp), %rax
  2fbc50:      	vpinsrq	$0x1, %rax, %xmm13, %xmm1
  2fbc56:      	vmovdqa	%ymm2, 0x120(%rsp)
  2fbc5f:      	vpaddq	%ymm2, %ymm0, %ymm0
  2fbc63:      	vmovdqa	%ymm0, 0x100(%rsp)
  2fbc6c:      	vmovq	%rax, %xmm0
  2fbc71:      	vpbroadcastq	%xmm0, %ymm0
  2fbc76:      	vpblendd	$0xf0, %ymm0, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm0[4,5,6,7]
  2fbc7c:      	vpsllq	$0x2, %ymm1, %ymm0
  2fbc81:      	vmovdqa	%ymm1, 0x2a0(%rsp)
  2fbc8a:      	vpaddq	%ymm1, %ymm0, %ymm0
  2fbc8e:      	vmovdqa	%ymm0, 0xe0(%rsp)
  2fbc97:      	vpinsrq	$0x1, %rcx, %xmm12, %xmm0
  2fbc9d:      	vmovq	%rcx, %xmm3
  2fbca2:      	vpbroadcastq	%xmm3, %ymm3
  2fbca7:      	vpblendd	$0xf0, %ymm3, %ymm0, %ymm1 # ymm1 = ymm0[0,1,2,3],ymm3[4,5,6,7]
  2fbcad:      	vpsllq	$0x2, %ymm1, %ymm0
  2fbcb2:      	vmovdqa	%ymm1, 0x240(%rsp)
  2fbcbb:      	vpaddq	%ymm1, %ymm0, %ymm0
  2fbcbf:      	vmovdqa	%ymm0, 0xc0(%rsp)
  2fbcc8:      	movq	0x220(%rsp), %rax
  2fbcd0:      	vmovdqa	0x340(%rsp), %ymm0
  2fbcd9:      	vpinsrq	$0x1, %rax, %xmm0, %xmm0
  2fbcdf:      	vmovq	%rax, %xmm4
  2fbce4:      	vpbroadcastq	%xmm4, %ymm4
  2fbce9:      	vpblendd	$0xf0, %ymm4, %ymm0, %ymm0 # ymm0 = ymm0[0,1,2,3],ymm4[4,5,6,7]
  2fbcef:      	vmovdqa	%ymm0, 0x220(%rsp)
  2fbcf8:      	addq	$0x70, %r8
  2fbcfc:      	vpxor	%xmm0, %xmm0, %xmm0
  2fbd00:      	vmovdqa	%ymm0, 0x160(%rsp)
  2fbd09:      	vpbroadcastq	-0x22006a(%rip), %ymm9 # 0xdbca8 <kbrainpoolP224r1MontA+0x108>
  2fbd12:      	vpbroadcastq	-0x21ffdb(%rip), %ymm0 # 0xdbd40 <anon.54511efdcd5263d69ddc2501edb1ac10.13.llvm.1656325251768278046+0x48>
  2fbd1b:      	vmovdqa	%ymm0, 0x280(%rsp)
  2fbd24:      	vpxor	%xmm0, %xmm0, %xmm0
  2fbd28:      	vmovdqa	%ymm0, 0x1c0(%rsp)
  2fbd31:      	vmovdqa	%ymm0, 0x180(%rsp)
  2fbd3a:      	vmovdqa	%ymm0, 0x1a0(%rsp)
  2fbd43:      	vmovdqa	%ymm0, 0x40(%rsp)
  2fbd49:      	vmovdqa	%ymm5, %ymm15
  2fbd4d:      	vmovdqa	0x2c0(%rsp), %ymm7
  2fbd56:      	vmovdqa	0x240(%rsp), %ymm3
  2fbd5f:      	nop
  2fbd60:      	vmovdqu	-0x70(%r8), %ymm0
  2fbd66:      	vmovdqu	-0x50(%r8), %ymm6
  2fbd6c:      	vmovdqu	-0x30(%r8), %ymm8
  2fbd72:      	vmovdqu	-0x10(%r8), %ymm14
  2fbd78:      	vpunpckhqdq	%ymm6, %ymm0, %ymm4 # ymm4 = ymm0[1],ymm6[1],ymm0[3],ymm6[3]
  2fbd7c:      	vpunpcklqdq	%ymm6, %ymm0, %ymm12 # ymm12 = ymm0[0],ymm6[0],ymm0[2],ymm6[2]
  2fbd80:      	vpsrlq	$0x34, %ymm12, %ymm0
  2fbd86:      	vpsllq	$0xc, %ymm4, %ymm6
  2fbd8b:      	vpor	%ymm0, %ymm6, %ymm13
  2fbd8f:      	vpunpcklqdq	%ymm14, %ymm8, %ymm6 # ymm6 = ymm8[0],ymm14[0],ymm8[2],ymm14[2]
  2fbd94:      	vpunpckhqdq	%ymm14, %ymm8, %ymm0 # ymm0 = ymm8[1],ymm14[1],ymm8[3],ymm14[3]
  2fbd99:      	vmovdqa	%ymm0, 0x260(%rsp)
  2fbda2:      	vpsrlq	$0x34, %ymm6, %ymm8
  2fbda7:      	vpsllq	$0xc, %ymm0, %ymm14
  2fbdac:      	vpor	%ymm8, %ymm14, %ymm1
  2fbdb1:      	vmovdqa	%ymm1, 0x2e0(%rsp)
  2fbdba:      	vmovdqa	%ymm15, %ymm1
  2fbdbe:      	vpsrlq	$0x1a, %ymm15, %ymm14
  2fbdc4:      	vpaddq	%ymm11, %ymm14, %ymm14
  2fbdc9:      	vmovdqa	0x80(%rsp), %ymm2
  2fbdd2:      	vpsrlq	$0x1a, %ymm2, %ymm11
  2fbdd7:      	vpaddq	%ymm10, %ymm11, %ymm10
  2fbddc:      	vpsrlq	$0x1a, %ymm14, %ymm11
  2fbde2:      	vpaddq	0x60(%rsp), %ymm11, %ymm11
  2fbde8:      	vpsrlq	$0x28, %ymm4, %ymm15
  2fbded:      	vpand	%ymm9, %ymm10, %ymm8
  2fbdf2:      	vpaddq	%ymm15, %ymm8, %ymm8
  2fbdf7:      	vpsrlq	$0x1a, %ymm10, %ymm10
  2fbdfd:      	vpsllq	$0x2, %ymm10, %ymm15
  2fbe03:      	vpaddq	%ymm10, %ymm15, %ymm10
  2fbe08:      	vpand	%ymm1, %ymm9, %ymm15
  2fbe0c:      	vpaddq	%ymm10, %ymm15, %ymm15
  2fbe11:      	vpand	%ymm2, %ymm9, %ymm10
  2fbe15:      	vpsrlq	$0x1a, %ymm11, %ymm5
  2fbe1b:      	vpaddq	%ymm5, %ymm10, %ymm5
  2fbe1f:      	vpsrlq	$0xe, %ymm4, %ymm4
  2fbe24:      	vpand	%ymm4, %ymm9, %ymm1
  2fbe28:      	vpand	%ymm9, %ymm13, %ymm4
  2fbe2d:      	vpand	%ymm9, %ymm14, %ymm10
  2fbe32:      	vpand	%ymm9, %ymm11, %ymm11
  2fbe37:      	vpaddq	%ymm4, %ymm11, %ymm4
  2fbe3b:      	vpsrlq	$0x1a, %ymm15, %ymm11
  2fbe41:      	vpaddq	%ymm10, %ymm11, %ymm10
  2fbe46:      	vpsrlq	$0x1a, %ymm12, %ymm11
  2fbe4c:      	vpand	%ymm9, %ymm11, %ymm11
  2fbe51:      	vpand	%ymm9, %ymm12, %ymm12
  2fbe56:      	vpaddq	%ymm11, %ymm10, %ymm10
  2fbe5b:      	vpand	%ymm9, %ymm15, %ymm11
  2fbe60:      	vpaddq	%ymm11, %ymm12, %ymm14
  2fbe65:      	vpsrlq	$0x1a, %ymm5, %ymm11
  2fbe6a:      	vpaddq	%ymm11, %ymm8, %ymm8
  2fbe6f:      	vpand	%ymm5, %ymm9, %ymm5
  2fbe73:      	vpaddq	%ymm5, %ymm1, %ymm13
  2fbe77:      	vpaddq	0x280(%rsp), %ymm8, %ymm12
  2fbe80:      	vmovdqa	0x220(%rsp), %ymm2
  2fbe89:      	vpmuludq	%ymm2, %ymm14, %ymm1
  2fbe8d:      	vpmuludq	%ymm7, %ymm10, %ymm5
  2fbe91:      	vmovdqa	0xe0(%rsp), %ymm15
  2fbe9a:      	vpmuludq	%ymm15, %ymm13, %ymm8
  2fbe9f:      	vpaddq	%ymm1, %ymm8, %ymm1
  2fbea3:      	vmovdqa	0x100(%rsp), %ymm0
  2fbeac:      	vpmuludq	%ymm0, %ymm4, %ymm8
  2fbeb0:      	vpaddq	%ymm1, %ymm8, %ymm1
  2fbeb4:      	vpmuludq	0xc0(%rsp), %ymm12, %ymm8
  2fbebd:      	vpaddq	%ymm5, %ymm8, %ymm5
  2fbec1:      	vpaddq	%ymm5, %ymm1, %ymm1
  2fbec5:      	vmovdqa	%ymm1, 0x320(%rsp)
  2fbece:      	vpmuludq	%ymm3, %ymm14, %ymm1
  2fbed2:      	vpmuludq	%ymm0, %ymm13, %ymm5
  2fbed6:      	vpaddq	%ymm5, %ymm1, %ymm1
  2fbeda:      	vpmuludq	%ymm7, %ymm4, %ymm5
  2fbede:      	vpaddq	%ymm1, %ymm5, %ymm1
  2fbee2:      	vpmuludq	%ymm2, %ymm10, %ymm5
  2fbee6:      	vpmuludq	%ymm15, %ymm12, %ymm8
  2fbeeb:      	vpaddq	%ymm5, %ymm8, %ymm5
  2fbeef:      	vpaddq	%ymm5, %ymm1, %ymm1
  2fbef3:      	vmovdqa	%ymm1, 0x300(%rsp)
  2fbefc:      	vmovdqa	0x2a0(%rsp), %ymm11
  2fbf05:      	vpmuludq	%ymm11, %ymm14, %ymm1
  2fbf0a:      	vpmuludq	%ymm7, %ymm13, %ymm5
  2fbf0e:      	vpaddq	%ymm5, %ymm1, %ymm1
  2fbf12:      	vpmuludq	%ymm2, %ymm4, %ymm5
  2fbf16:      	vpaddq	%ymm1, %ymm5, %ymm1
  2fbf1a:      	vpmuludq	%ymm3, %ymm10, %ymm5
  2fbf1e:      	vpmuludq	%ymm0, %ymm12, %ymm8
  2fbf22:      	vpaddq	%ymm5, %ymm8, %ymm5
  2fbf26:      	vpaddq	%ymm5, %ymm1, %ymm1
  2fbf2a:      	vmovdqa	%ymm1, 0x60(%rsp)
  2fbf30:      	vmovdqa	0x120(%rsp), %ymm15
  2fbf39:      	vpmuludq	%ymm15, %ymm14, %ymm1
  2fbf3e:      	vpmuludq	%ymm2, %ymm13, %ymm5
  2fbf42:      	vpaddq	%ymm5, %ymm1, %ymm1
  2fbf46:      	vpmuludq	%ymm3, %ymm4, %ymm5
  2fbf4a:      	vpaddq	%ymm1, %ymm5, %ymm1
  2fbf4e:      	vpmuludq	%ymm11, %ymm10, %ymm5
  2fbf53:      	vpmuludq	%ymm7, %ymm12, %ymm8
  2fbf57:      	vpaddq	%ymm5, %ymm8, %ymm5
  2fbf5b:      	vpaddq	%ymm5, %ymm1, %ymm1
  2fbf5f:      	vmovdqa	%ymm1, 0x80(%rsp)
  2fbf68:      	vpmuludq	0x140(%rsp), %ymm14, %ymm1
  2fbf71:      	vpmuludq	%ymm3, %ymm13, %ymm5
  2fbf75:      	vpaddq	%ymm5, %ymm1, %ymm1
  2fbf79:      	vpmuludq	%ymm4, %ymm11, %ymm4
  2fbf7d:      	vpaddq	%ymm1, %ymm4, %ymm1
  2fbf81:      	vpand	%ymm6, %ymm9, %ymm13
  2fbf85:      	vpsrlq	$0x1a, %ymm6, %ymm0
  2fbf8a:      	vpand	%ymm0, %ymm9, %ymm4
  2fbf8e:      	vpand	0x2e0(%rsp), %ymm9, %ymm0
  2fbf97:      	vpmuludq	%ymm15, %ymm10, %ymm5
  2fbf9c:      	vpmuludq	%ymm2, %ymm12, %ymm8
  2fbfa0:      	vpaddq	%ymm5, %ymm8, %ymm5
  2fbfa4:      	vmovdqa	0x260(%rsp), %ymm6
  2fbfad:      	vpsrlq	$0xe, %ymm6, %ymm8
  2fbfb2:      	vpand	%ymm9, %ymm8, %ymm11
  2fbfb7:      	vpsrlq	$0x28, %ymm6, %ymm6
  2fbfbc:      	vpaddq	%ymm5, %ymm1, %ymm10
  2fbfc0:      	vmovdqa	0x40(%rsp), %ymm5
  2fbfc6:      	vpsrlq	$0x1a, %ymm5, %ymm1
  2fbfcb:      	vpaddq	0x1a0(%rsp), %ymm1, %ymm1
  2fbfd4:      	vpand	%ymm5, %ymm9, %ymm5
  2fbfd8:      	vmovdqa	0x1c0(%rsp), %ymm12
  2fbfe1:      	vpsrlq	$0x1a, %ymm12, %ymm8
  2fbfe7:      	vpaddq	0x160(%rsp), %ymm8, %ymm8
  2fbff0:      	vpand	%ymm9, %ymm12, %ymm12
  2fbff5:      	vpsrlq	$0x1a, %ymm1, %ymm14
  2fbffa:      	vpaddq	0x180(%rsp), %ymm14, %ymm14
  2fc003:      	vpand	%ymm1, %ymm9, %ymm1
  2fc007:      	vpsrlq	$0x1a, %ymm8, %ymm15
  2fc00d:      	vpand	%ymm9, %ymm8, %ymm8
  2fc012:      	vpaddq	%ymm6, %ymm8, %ymm6
  2fc016:      	vpsllq	$0x2, %ymm15, %ymm8
  2fc01c:      	vpaddq	%ymm15, %ymm8, %ymm8
  2fc021:      	vpaddq	%ymm5, %ymm8, %ymm5
  2fc025:      	vpsrlq	$0x1a, %ymm14, %ymm8
  2fc02b:      	vpaddq	%ymm12, %ymm8, %ymm12
  2fc030:      	vpand	%ymm9, %ymm14, %ymm8
  2fc035:      	vpaddq	%ymm0, %ymm8, %ymm0
  2fc039:      	vpsrlq	$0x1a, %ymm5, %ymm8
  2fc03e:      	vpaddq	%ymm1, %ymm8, %ymm1
  2fc042:      	vpaddq	%ymm4, %ymm1, %ymm4
  2fc046:      	vpand	%ymm5, %ymm9, %ymm1
  2fc04a:      	vpaddq	%ymm1, %ymm13, %ymm8
  2fc04e:      	vpsrlq	$0x1a, %ymm12, %ymm1
  2fc054:      	vpaddq	%ymm1, %ymm6, %ymm1
  2fc058:      	vpand	%ymm9, %ymm12, %ymm5
  2fc05d:      	vpaddq	%ymm5, %ymm11, %ymm12
  2fc061:      	vpaddq	0x280(%rsp), %ymm1, %ymm6
  2fc06a:      	vpmuludq	%ymm2, %ymm8, %ymm1
  2fc06e:      	vpmuludq	%ymm7, %ymm4, %ymm5
  2fc072:      	vmovdqa	0x100(%rsp), %ymm15
  2fc07b:      	vpmuludq	%ymm0, %ymm15, %ymm11
  2fc07f:      	vmovdqa	0xe0(%rsp), %ymm14
  2fc088:      	vpmuludq	%ymm14, %ymm12, %ymm13
  2fc08d:      	vpaddq	%ymm1, %ymm13, %ymm1
  2fc091:      	vpaddq	%ymm1, %ymm11, %ymm1
  2fc095:      	vpmuludq	0xc0(%rsp), %ymm6, %ymm11
  2fc09e:      	vpaddq	%ymm5, %ymm11, %ymm5
  2fc0a2:      	vpaddq	%ymm5, %ymm1, %ymm1
  2fc0a6:      	vmovdqa	%ymm1, 0x40(%rsp)
  2fc0ac:      	vpmuludq	%ymm3, %ymm8, %ymm1
  2fc0b0:      	vpmuludq	%ymm2, %ymm4, %ymm5
  2fc0b4:      	vpmuludq	%ymm7, %ymm0, %ymm11
  2fc0b8:      	vpmuludq	%ymm15, %ymm12, %ymm13
  2fc0bd:      	vpaddq	%ymm1, %ymm13, %ymm1
  2fc0c1:      	vpaddq	%ymm1, %ymm11, %ymm1
  2fc0c5:      	vpmuludq	%ymm6, %ymm14, %ymm11
  2fc0c9:      	vpaddq	%ymm5, %ymm11, %ymm5
  2fc0cd:      	vpaddq	%ymm5, %ymm1, %ymm1
  2fc0d1:      	vmovdqa	%ymm1, 0x1a0(%rsp)
  2fc0da:      	vmovdqa	0x2a0(%rsp), %ymm14
  2fc0e3:      	vpmuludq	%ymm14, %ymm8, %ymm1
  2fc0e8:      	vpmuludq	%ymm3, %ymm4, %ymm5
  2fc0ec:      	vpmuludq	%ymm2, %ymm0, %ymm11
  2fc0f0:      	vpmuludq	%ymm7, %ymm12, %ymm13
  2fc0f4:      	vpaddq	%ymm1, %ymm13, %ymm1
  2fc0f8:      	vpaddq	%ymm1, %ymm11, %ymm1
  2fc0fc:      	vpmuludq	%ymm6, %ymm15, %ymm11
  2fc100:      	vmovdqa	0x320(%rsp), %ymm15
  2fc109:      	vpaddq	%ymm5, %ymm11, %ymm5
  2fc10d:      	vpaddq	%ymm5, %ymm1, %ymm1
  2fc111:      	vmovdqa	%ymm1, 0x180(%rsp)
  2fc11a:      	vmovdqa	0x120(%rsp), %ymm13
  2fc123:      	vpmuludq	%ymm13, %ymm8, %ymm1
  2fc128:      	vpmuludq	%ymm4, %ymm14, %ymm5
  2fc12c:      	vpmuludq	%ymm2, %ymm12, %ymm11
  2fc130:      	vpaddq	%ymm1, %ymm11, %ymm1
  2fc134:      	vpmuludq	%ymm3, %ymm0, %ymm11
  2fc138:      	vpaddq	%ymm1, %ymm11, %ymm1
  2fc13c:      	vpmuludq	%ymm7, %ymm6, %ymm11
  2fc140:      	vpaddq	%ymm5, %ymm11, %ymm5
  2fc144:      	vmovdqa	0x300(%rsp), %ymm11
  2fc14d:      	vpaddq	%ymm5, %ymm1, %ymm1
  2fc151:      	vmovdqa	%ymm1, 0x1c0(%rsp)
  2fc15a:      	vpmuludq	0x140(%rsp), %ymm8, %ymm1
  2fc163:      	vpmuludq	%ymm3, %ymm12, %ymm5
  2fc167:      	vpaddq	%ymm5, %ymm1, %ymm1
  2fc16b:      	vpmuludq	%ymm0, %ymm14, %ymm0
  2fc16f:      	vpaddq	%ymm1, %ymm0, %ymm0
  2fc173:      	vpmuludq	%ymm4, %ymm13, %ymm1
  2fc177:      	vpmuludq	%ymm2, %ymm6, %ymm4
  2fc17b:      	vpaddq	%ymm1, %ymm4, %ymm1
  2fc17f:      	vpaddq	%ymm1, %ymm0, %ymm0
  2fc183:      	vmovdqa	%ymm0, 0x160(%rsp)
  2fc18c:      	subq	$-0x80, %r8
  2fc190:      	decq	%r13
  2fc193:      	jne	0x2fbd60 <toyos_crypto::arch::x86_64::poly1305::blocks+0xba0>
  2fc199:      	jmp	0x2fc1d4 <toyos_crypto::arch::x86_64::poly1305::blocks+0x1014>
  2fc19b:      	xorl	%eax, %eax
  2fc19d:      	jmp	0x2fc80c <toyos_crypto::arch::x86_64::poly1305::blocks+0x164c>
  2fc1a2:      	vpxor	%xmm0, %xmm0, %xmm0
  2fc1a6:      	vmovdqa	%ymm0, 0x1a0(%rsp)
  2fc1af:      	vmovdqa	%ymm0, 0x180(%rsp)
  2fc1b8:      	vmovdqa	%ymm0, 0x1c0(%rsp)
  2fc1c1:      	vmovdqa	%ymm0, 0x160(%rsp)
  2fc1ca:      	vmovdqa	%ymm0, 0x40(%rsp)
  2fc1d0:      	vmovdqa	%ymm5, %ymm15
  2fc1d4:      	vmovdqu	(%r9), %ymm0
  2fc1d9:      	vmovdqu	0x20(%r9), %ymm1
  2fc1df:      	vpunpckhqdq	%ymm1, %ymm0, %ymm3 # ymm3 = ymm0[1],ymm1[1],ymm0[3],ymm1[3]
  2fc1e3:      	vpunpcklqdq	%ymm1, %ymm0, %ymm5 # ymm5 = ymm0[0],ymm1[0],ymm0[2],ymm1[2]
  2fc1e7:      	vpsrlq	$0x34, %ymm5, %ymm0
  2fc1ec:      	vpsllq	$0xc, %ymm3, %ymm1
  2fc1f1:      	vpor	%ymm0, %ymm1, %ymm6
  2fc1f5:      	vmovdqu	0x40(%r9), %ymm0
  2fc1fb:      	vmovdqu	0x60(%r9), %ymm1
  2fc201:      	vpunpcklqdq	%ymm1, %ymm0, %ymm2 # ymm2 = ymm0[0],ymm1[0],ymm0[2],ymm1[2]
  2fc205:      	vpunpckhqdq	%ymm1, %ymm0, %ymm1 # ymm1 = ymm0[1],ymm1[1],ymm0[3],ymm1[3]
  2fc209:      	vmovdqa	%ymm1, 0x120(%rsp)
  2fc212:      	vpsrlq	$0x34, %ymm2, %ymm0
  2fc217:      	vpsllq	$0xc, %ymm1, %ymm4
  2fc21c:      	vpor	%ymm0, %ymm4, %ymm4
  2fc220:      	vpsrlq	$0x1a, %ymm15, %ymm0
  2fc226:      	vpaddq	%ymm0, %ymm11, %ymm7
  2fc22a:      	vmovdqa	0x80(%rsp), %ymm14
  2fc233:      	vpsrlq	$0x1a, %ymm14, %ymm0
  2fc239:      	vpaddq	%ymm0, %ymm10, %ymm8
  2fc23d:      	vpsrlq	$0x1a, %ymm7, %ymm0
  2fc242:      	vpaddq	0x60(%rsp), %ymm0, %ymm9
  2fc248:      	vpbroadcastq	-0x2205a9(%rip), %ymm0 # 0xdbca8 <kbrainpoolP224r1MontA+0x108>
  2fc251:      	vpsrlq	$0x1a, %ymm5, %ymm10
  2fc256:      	vpand	%ymm0, %ymm10, %ymm10
  2fc25a:      	vpand	%ymm0, %ymm7, %ymm7
  2fc25e:      	vpaddq	%ymm7, %ymm10, %ymm7
  2fc262:      	vpsrlq	$0x28, %ymm3, %ymm10
  2fc267:      	vpand	%ymm0, %ymm8, %ymm12
  2fc26b:      	vpaddq	%ymm10, %ymm12, %ymm13
  2fc270:      	vpand	%ymm0, %ymm15, %ymm10
  2fc274:      	vpsrlq	$0x1a, %ymm8, %ymm8
  2fc27a:      	vpaddq	%ymm8, %ymm10, %ymm10
  2fc27f:      	vpsllq	$0x2, %ymm8, %ymm8
  2fc285:      	vpaddq	%ymm8, %ymm10, %ymm11
  2fc28a:      	vpand	%ymm0, %ymm14, %ymm8
  2fc28e:      	vpsrlq	$0x1a, %ymm9, %ymm10
  2fc294:      	vpaddq	%ymm8, %ymm10, %ymm14
  2fc299:      	vpand	%ymm0, %ymm6, %ymm6
  2fc29d:      	vpand	%ymm0, %ymm9, %ymm8
  2fc2a1:      	vpaddq	%ymm6, %ymm8, %ymm8
  2fc2a5:      	vpsrlq	$0x1a, %ymm11, %ymm6
  2fc2ab:      	vpaddq	%ymm7, %ymm6, %ymm10
  2fc2af:      	vpand	%ymm0, %ymm5, %ymm5
  2fc2b3:      	vpand	%ymm0, %ymm11, %ymm6
  2fc2b7:      	vpaddq	%ymm6, %ymm5, %ymm11
  2fc2bb:      	vpsrlq	$0xe, %ymm3, %ymm3
  2fc2c0:      	vpand	%ymm0, %ymm3, %ymm3
  2fc2c4:      	vpand	%ymm0, %ymm14, %ymm5
  2fc2c8:      	vpaddq	%ymm5, %ymm3, %ymm12
  2fc2cc:      	vpsrlq	$0x1a, %ymm14, %ymm3
  2fc2d2:      	vpbroadcastq	-0x22059b(%rip), %ymm9 # 0xdbd40 <anon.54511efdcd5263d69ddc2501edb1ac10.13.llvm.1656325251768278046+0x48>
  2fc2db:      	vpaddq	%ymm9, %ymm13, %ymm5
  2fc2e0:      	vpaddq	%ymm3, %ymm5, %ymm13
  2fc2e4:      	vmovdqa	0x200(%rsp), %ymm1
  2fc2ed:      	vpmuludq	%ymm1, %ymm11, %ymm3
  2fc2f1:      	vmovdqa	0x3a0(%rsp), %ymm14
  2fc2fa:      	vpmuludq	%ymm14, %ymm8, %ymm5
  2fc2ff:      	vpaddq	%ymm3, %ymm5, %ymm3
  2fc303:      	vmovdqa	0x380(%rsp), %ymm7
  2fc30c:      	vpmuludq	%ymm7, %ymm12, %ymm5
  2fc310:      	vpaddq	%ymm5, %ymm3, %ymm3
  2fc314:      	vpmuludq	0x360(%rsp), %ymm13, %ymm5
  2fc31d:      	vmovdqa	0x3c0(%rsp), %ymm15
  2fc326:      	vpmuludq	%ymm15, %ymm10, %ymm6
  2fc32b:      	vpaddq	%ymm6, %ymm5, %ymm5
  2fc32f:      	vpaddq	%ymm5, %ymm3, %ymm3
  2fc333:      	vmovdqa	%ymm3, 0x80(%rsp)
  2fc33c:      	vmovdqa	0x1e0(%rsp), %ymm3
  2fc345:      	vpmuludq	%ymm3, %ymm11, %ymm5
  2fc349:      	vpmuludq	%ymm15, %ymm8, %ymm6
  2fc34e:      	vpaddq	%ymm5, %ymm6, %ymm5
  2fc352:      	vpmuludq	%ymm14, %ymm12, %ymm6
  2fc357:      	vpaddq	%ymm6, %ymm5, %ymm5
  2fc35b:      	vpmuludq	%ymm7, %ymm13, %ymm6
  2fc35f:      	vpmuludq	%ymm1, %ymm10, %ymm7
  2fc363:      	vpaddq	%ymm7, %ymm6, %ymm6
  2fc367:      	vpaddq	%ymm6, %ymm5, %ymm5
  2fc36b:      	vmovdqa	%ymm5, 0x60(%rsp)
  2fc371:      	vmovdqa	0x4e0(%rsp), %ymm5
  2fc37a:      	vpmuludq	%ymm5, %ymm11, %ymm6
  2fc37e:      	vpmuludq	%ymm1, %ymm8, %ymm7
  2fc382:      	vpaddq	%ymm6, %ymm7, %ymm6
  2fc386:      	vpmuludq	%ymm15, %ymm12, %ymm7
  2fc38b:      	vpaddq	%ymm7, %ymm6, %ymm6
  2fc38f:      	vpmuludq	%ymm14, %ymm13, %ymm7
  2fc394:      	vpmuludq	%ymm3, %ymm10, %ymm14
  2fc398:      	vpaddq	%ymm7, %ymm14, %ymm7
  2fc39c:      	vpaddq	%ymm7, %ymm6, %ymm6
  2fc3a0:      	vmovdqa	%ymm6, 0x140(%rsp)
  2fc3a9:      	vmovdqa	0x480(%rsp), %ymm7
  2fc3b2:      	vpmuludq	%ymm7, %ymm11, %ymm6
  2fc3b6:      	vpmuludq	%ymm3, %ymm8, %ymm14
  2fc3ba:      	vpaddq	%ymm6, %ymm14, %ymm6
  2fc3be:      	vpmuludq	%ymm1, %ymm12, %ymm14
  2fc3c2:      	vpaddq	%ymm6, %ymm14, %ymm6
  2fc3c6:      	vpmuludq	%ymm15, %ymm13, %ymm14
  2fc3cb:      	vpmuludq	%ymm5, %ymm10, %ymm15
  2fc3cf:      	vpaddq	%ymm15, %ymm14, %ymm14
  2fc3d4:      	vpaddq	%ymm6, %ymm14, %ymm6
  2fc3d8:      	vmovdqa	%ymm6, 0x100(%rsp)
  2fc3e1:      	vpmuludq	0x460(%rsp), %ymm11, %ymm11
  2fc3ea:      	vpmuludq	%ymm7, %ymm10, %ymm10
  2fc3ee:      	vpmuludq	%ymm5, %ymm8, %ymm8
  2fc3f2:      	vpaddq	%ymm11, %ymm8, %ymm8
  2fc3f7:      	vpmuludq	%ymm3, %ymm12, %ymm11
  2fc3fb:      	vpaddq	%ymm11, %ymm8, %ymm8
  2fc400:      	vpmuludq	%ymm1, %ymm13, %ymm11
  2fc404:      	vpaddq	%ymm10, %ymm11, %ymm10
  2fc409:      	vpaddq	%ymm10, %ymm8, %ymm8
  2fc40e:      	vmovdqa	0x40(%rsp), %ymm1
  2fc414:      	vpsrlq	$0x1a, %ymm1, %ymm10
  2fc419:      	vpaddq	0x1a0(%rsp), %ymm10, %ymm10
  2fc422:      	vmovdqa	0x1c0(%rsp), %ymm3
  2fc42b:      	vpsrlq	$0x1a, %ymm3, %ymm11
  2fc430:      	vpaddq	0x160(%rsp), %ymm11, %ymm11
  2fc439:      	vpsrlq	$0x1a, %ymm10, %ymm12
  2fc43f:      	vpaddq	0x180(%rsp), %ymm12, %ymm12
  2fc448:      	vpsrlq	$0x1a, %ymm2, %ymm13
  2fc44d:      	vpand	%ymm0, %ymm13, %ymm13
  2fc451:      	vpand	%ymm0, %ymm10, %ymm10
  2fc455:      	vpaddq	%ymm13, %ymm10, %ymm13
  2fc45a:      	vmovdqa	0x120(%rsp), %ymm5
  2fc463:      	vpsrlq	$0x28, %ymm5, %ymm10
  2fc468:      	vpand	%ymm0, %ymm11, %ymm14
  2fc46c:      	vpaddq	%ymm10, %ymm14, %ymm14
  2fc471:      	vpand	%ymm0, %ymm1, %ymm10
  2fc475:      	vpsrlq	$0x1a, %ymm11, %ymm11
  2fc47b:      	vpaddq	%ymm10, %ymm11, %ymm10
  2fc480:      	vpsllq	$0x2, %ymm11, %ymm11
  2fc486:      	vpaddq	%ymm10, %ymm11, %ymm15
  2fc48b:      	vpand	%ymm0, %ymm3, %ymm10
  2fc48f:      	vpsrlq	$0x1a, %ymm12, %ymm11
  2fc495:      	vpaddq	%ymm10, %ymm11, %ymm3
  2fc49a:      	vpand	%ymm0, %ymm4, %ymm4
  2fc49e:      	vpand	%ymm0, %ymm12, %ymm10
  2fc4a2:      	vpaddq	%ymm4, %ymm10, %ymm10
  2fc4a6:      	vpsrlq	$0x1a, %ymm15, %ymm4
  2fc4ac:      	vpaddq	%ymm4, %ymm13, %ymm11
  2fc4b0:      	vpand	%ymm0, %ymm2, %ymm2
  2fc4b4:      	vpand	%ymm0, %ymm15, %ymm4
  2fc4b8:      	vpaddq	%ymm4, %ymm2, %ymm7
  2fc4bc:      	vpsrlq	$0xe, %ymm5, %ymm1
  2fc4c1:      	vpand	%ymm0, %ymm1, %ymm1
  2fc4c5:      	vpand	%ymm0, %ymm3, %ymm4
  2fc4c9:      	vpaddq	%ymm4, %ymm1, %ymm6
  2fc4cd:      	vpaddq	%ymm9, %ymm14, %ymm4
  2fc4d2:      	vpsrlq	$0x1a, %ymm3, %ymm3
  2fc4d7:      	vpaddq	%ymm3, %ymm4, %ymm12
  2fc4db:      	vmovdqa	0x540(%rsp), %ymm5
  2fc4e4:      	vpmuludq	%ymm5, %ymm7, %ymm3
  2fc4e8:      	vmovdqa	0x420(%rsp), %ymm14
  2fc4f1:      	vpmuludq	%ymm14, %ymm10, %ymm4
  2fc4f6:      	vpaddq	%ymm3, %ymm4, %ymm3
  2fc4fa:      	vmovdqa	0x400(%rsp), %ymm1
  2fc503:      	vpmuludq	%ymm1, %ymm6, %ymm4
  2fc507:      	vpaddq	%ymm4, %ymm3, %ymm3
  2fc50b:      	vpmuludq	0x3e0(%rsp), %ymm12, %ymm4
  2fc514:      	vmovdqa	0x440(%rsp), %ymm15
  2fc51d:      	vpmuludq	%ymm15, %ymm11, %ymm9
  2fc522:      	vpaddq	%ymm4, %ymm9, %ymm4
  2fc526:      	vpaddq	%ymm4, %ymm3, %ymm2
  2fc52a:      	vmovdqa	%ymm2, 0x40(%rsp)
  2fc530:      	vmovdqa	0x520(%rsp), %ymm2
  2fc539:      	vpmuludq	%ymm2, %ymm7, %ymm3
  2fc53d:      	vpmuludq	%ymm15, %ymm10, %ymm9
  2fc542:      	vpaddq	%ymm3, %ymm9, %ymm3
  2fc546:      	vpmuludq	%ymm6, %ymm14, %ymm9
  2fc54a:      	vpaddq	%ymm3, %ymm9, %ymm3
  2fc54e:      	vpmuludq	%ymm1, %ymm12, %ymm9
  2fc552:      	vpmuludq	%ymm5, %ymm11, %ymm13
  2fc556:      	vpaddq	%ymm13, %ymm9, %ymm9
  2fc55b:      	vpaddq	%ymm3, %ymm9, %ymm9
  2fc55f:      	vmovdqa	0x500(%rsp), %ymm1
  2fc568:      	vpmuludq	%ymm1, %ymm7, %ymm3
  2fc56c:      	vpmuludq	%ymm5, %ymm10, %ymm13
  2fc570:      	vpaddq	%ymm3, %ymm13, %ymm3
  2fc574:      	vpmuludq	%ymm6, %ymm15, %ymm13
  2fc578:      	vpaddq	%ymm3, %ymm13, %ymm3
  2fc57c:      	vpmuludq	%ymm14, %ymm12, %ymm13
  2fc581:      	vpmuludq	%ymm2, %ymm11, %ymm14
  2fc585:      	vpaddq	%ymm14, %ymm13, %ymm13
  2fc58a:      	vpaddq	%ymm3, %ymm13, %ymm13
  2fc58e:      	vmovdqa	0x4c0(%rsp), %ymm3
  2fc597:      	vpmuludq	%ymm3, %ymm7, %ymm4
  2fc59b:      	vpmuludq	%ymm2, %ymm10, %ymm14
  2fc59f:      	vpaddq	%ymm4, %ymm14, %ymm4
  2fc5a3:      	vpmuludq	%ymm5, %ymm6, %ymm14
  2fc5a7:      	vpaddq	%ymm4, %ymm14, %ymm4
  2fc5ab:      	vpmuludq	%ymm15, %ymm12, %ymm14
  2fc5b0:      	vpmuludq	%ymm1, %ymm11, %ymm15
  2fc5b4:      	vpaddq	%ymm15, %ymm14, %ymm14
  2fc5b9:      	vpaddq	%ymm4, %ymm14, %ymm14
  2fc5bd:      	vpmuludq	0x4a0(%rsp), %ymm7, %ymm7
  2fc5c6:      	vpmuludq	%ymm3, %ymm11, %ymm3
  2fc5ca:      	vpmuludq	%ymm1, %ymm10, %ymm10
  2fc5ce:      	vpaddq	%ymm7, %ymm10, %ymm7
  2fc5d2:      	vpmuludq	%ymm2, %ymm6, %ymm1
  2fc5d6:      	vpaddq	%ymm1, %ymm7, %ymm1
  2fc5da:      	vpmuludq	%ymm5, %ymm12, %ymm2
  2fc5de:      	vpaddq	%ymm3, %ymm2, %ymm2
  2fc5e2:      	vpaddq	%ymm2, %ymm1, %ymm3
  2fc5e6:      	vmovdqa	0x80(%rsp), %ymm2
  2fc5ef:      	vpsrlq	$0x1a, %ymm2, %ymm1
  2fc5f4:      	vpaddq	0x60(%rsp), %ymm1, %ymm5
  2fc5fa:      	vpand	%ymm0, %ymm2, %ymm2
  2fc5fe:      	vmovdqa	0x100(%rsp), %ymm4
  2fc607:      	vpsrlq	$0x1a, %ymm4, %ymm1
  2fc60c:      	vpaddq	%ymm1, %ymm8, %ymm1
  2fc610:      	vpand	%ymm0, %ymm4, %ymm6
  2fc614:      	vpsrlq	$0x1a, %ymm5, %ymm8
  2fc619:      	vpaddq	0x140(%rsp), %ymm8, %ymm7
  2fc622:      	vpsrlq	$0x1a, %ymm1, %ymm8
  2fc627:      	vpaddq	%ymm2, %ymm8, %ymm2
  2fc62b:      	vpsllq	$0x2, %ymm8, %ymm8
  2fc631:      	vpaddq	%ymm2, %ymm8, %ymm8
  2fc635:      	vpsrlq	$0x1a, %ymm7, %ymm2
  2fc63a:      	vpaddq	%ymm6, %ymm2, %ymm2
  2fc63e:      	vmovdqa	0x40(%rsp), %ymm4
  2fc644:      	vpsrlq	$0x1a, %ymm4, %ymm6
  2fc649:      	vpaddq	%ymm6, %ymm9, %ymm6
  2fc64d:      	vpsrlq	$0x1a, %ymm14, %ymm9
  2fc653:      	vpaddq	%ymm3, %ymm9, %ymm3
  2fc657:      	vpsrlq	$0x1a, %ymm6, %ymm9
  2fc65c:      	vpaddq	%ymm9, %ymm13, %ymm9
  2fc661:      	vpand	%ymm0, %ymm5, %ymm5
  2fc665:      	vpand	%ymm0, %ymm7, %ymm7
  2fc669:      	vpand	%ymm0, %ymm6, %ymm6
  2fc66d:      	vpaddq	%ymm6, %ymm5, %ymm5
  2fc671:      	vpsrlq	$0x1a, %ymm8, %ymm6
  2fc677:      	vpand	%ymm0, %ymm8, %ymm8
  2fc67b:      	vpand	%ymm0, %ymm4, %ymm4
  2fc67f:      	vpand	%ymm0, %ymm14, %ymm10
  2fc683:      	vpaddq	%ymm5, %ymm6, %ymm5
  2fc687:      	vpsrlq	$0x1a, %ymm3, %ymm6
  2fc68c:      	vpaddq	%ymm4, %ymm6, %ymm4
  2fc690:      	vpsllq	$0x2, %ymm6, %ymm6
  2fc695:      	vpaddq	%ymm4, %ymm6, %ymm6
  2fc699:      	vpsrlq	$0x1a, %ymm9, %ymm4
  2fc69f:      	vpaddq	%ymm4, %ymm10, %ymm4
  2fc6a3:      	vpand	%ymm0, %ymm2, %ymm10
  2fc6a7:      	vpand	%ymm0, %ymm9, %ymm9
  2fc6ab:      	vpaddq	%ymm7, %ymm9, %ymm7
  2fc6af:      	vpsrlq	$0x1a, %ymm6, %ymm9
  2fc6b4:      	vpaddq	%ymm5, %ymm9, %ymm9
  2fc6b8:      	vpand	%ymm0, %ymm6, %ymm5
  2fc6bc:      	vpaddq	%ymm5, %ymm8, %ymm6
  2fc6c0:      	vpand	%ymm0, %ymm4, %ymm5
  2fc6c4:      	vpaddq	%ymm5, %ymm10, %ymm5
  2fc6c8:      	vpshufd	$0xee, %xmm6, %xmm8     # xmm8 = xmm6[2,3,2,3]
  2fc6cd:      	vextracti128	$0x1, %ymm6, %xmm10
  2fc6d3:      	vpaddq	%xmm6, %xmm8, %xmm8
  2fc6d7:      	vpermq	$0xff, %ymm6, %ymm6     # ymm6 = ymm6[3,3,3,3]
  2fc6dd:      	vpaddq	%xmm6, %xmm10, %xmm6
  2fc6e1:      	vpaddq	%xmm6, %xmm8, %xmm6
  2fc6e5:      	vmovq	%xmm6, %rdx
  2fc6ea:      	vpshufd	$0xee, %xmm9, %xmm6     # xmm6 = xmm9[2,3,2,3]
  2fc6f0:      	vextracti128	$0x1, %ymm9, %xmm8
  2fc6f6:      	vpaddq	%xmm6, %xmm9, %xmm6
  2fc6fa:      	vpermq	$0xff, %ymm9, %ymm9     # ymm9 = ymm9[3,3,3,3]
  2fc700:      	vpaddq	%xmm9, %xmm8, %xmm8
  2fc705:      	vpaddq	%xmm6, %xmm8, %xmm6
  2fc709:      	vmovq	%xmm6, %rsi
  2fc70e:      	vpshufd	$0xee, %xmm7, %xmm6     # xmm6 = xmm7[2,3,2,3]
  2fc713:      	vextracti128	$0x1, %ymm7, %xmm8
  2fc719:      	vpaddq	%xmm6, %xmm7, %xmm6
  2fc71d:      	vpermq	$0xff, %ymm7, %ymm7     # ymm7 = ymm7[3,3,3,3]
  2fc723:      	vpaddq	%xmm7, %xmm8, %xmm7
  2fc727:      	vpaddq	%xmm7, %xmm6, %xmm6
  2fc72b:      	vmovq	%xmm6, %r9
  2fc730:      	vpshufd	$0xee, %xmm5, %xmm6     # xmm6 = xmm5[2,3,2,3]
  2fc735:      	vextracti128	$0x1, %ymm5, %xmm7
  2fc73b:      	vpaddq	%xmm6, %xmm5, %xmm6
  2fc73f:      	vpermq	$0xff, %ymm5, %ymm5     # ymm5 = ymm5[3,3,3,3]
  2fc745:      	vpaddq	%xmm5, %xmm7, %xmm5
  2fc749:      	vpaddq	%xmm5, %xmm6, %xmm5
  2fc74d:      	vmovq	%xmm5, %rcx
  2fc752:      	movq	%rsi, %rdi
  2fc755:      	shrq	$0x26, %rdi
  2fc759:      	shlq	$0x1a, %rsi
  2fc75d:      	movq	%r9, %r8
  2fc760:      	shrq	$0xc, %r8
  2fc764:      	shlq	$0x34, %r9
  2fc768:      	addq	%rdx, %r9
  2fc76b:      	adcq	$0x0, %r8
  2fc76f:      	addq	%rsi, %r9
  2fc772:      	adcq	%rdi, %r8
  2fc775:      	shlq	$0xe, %rcx
  2fc779:      	addq	%r8, %rcx
  2fc77c:      	jb	0x2fc81e <toyos_crypto::arch::x86_64::poly1305::blocks+0x165e>
  2fc782:      	movabsq	$0x7fffffffffffff8, %rdx # imm = 0x7FFFFFFFFFFFFF8
  2fc78c:      	movq	0xb0(%rsp), %rax
  2fc794:      	andq	%rdx, %rax
  2fc797:      	vpsrlq	$0x1a, %ymm2, %ymm2
  2fc79c:      	vpand	%ymm0, %ymm1, %ymm1
  2fc7a0:      	vpand	%ymm0, %ymm3, %ymm0
  2fc7a4:      	vpaddq	%ymm0, %ymm1, %ymm0
  2fc7a8:      	vpaddq	%ymm0, %ymm2, %ymm0
  2fc7ac:      	vpsrlq	$0x1a, %ymm4, %ymm1
  2fc7b1:      	vpaddq	%ymm1, %ymm0, %ymm0
  2fc7b5:      	vpshufd	$0xee, %xmm0, %xmm1     # xmm1 = xmm0[2,3,2,3]
  2fc7ba:      	vextracti128	$0x1, %ymm0, %xmm2
  2fc7c0:      	vpermq	$0xff, %ymm0, %ymm3     # ymm3 = ymm0[3,3,3,3]
  2fc7c6:      	vpaddq	%xmm1, %xmm0, %xmm0
  2fc7ca:      	vpaddq	%xmm3, %xmm2, %xmm1
  2fc7ce:      	vpaddq	%xmm1, %xmm0, %xmm0
  2fc7d2:      	vmovq	%xmm0, %rdx
  2fc7d7:      	movq	%rdx, %rsi
  2fc7da:      	shrq	$0x18, %rsi
  2fc7de:      	shlq	$0x28, %rdx
  2fc7e2:      	addq	%rdx, %rcx
  2fc7e5:      	adcq	$0x0, %rsi
  2fc7e9:      	movl	%esi, %edx
  2fc7eb:      	andl	$0x3, %edx
  2fc7ee:      	shrq	$0x2, %rsi
  2fc7f2:      	leaq	(%rsi,%rsi,4), %rsi
  2fc7f6:      	addq	%rsi, %r9
  2fc7f9:      	adcq	$0x0, %rcx
  2fc7fd:      	adcq	$0x0, %rdx
  2fc801:      	movq	%r9, (%r10)
  2fc804:      	movq	%rcx, 0x8(%r10)
  2fc808:      	movq	%rdx, 0x10(%r10)
  2fc80c:      	leaq	-0x28(%rbp), %rsp
  2fc810:      	popq	%rbx
  2fc811:      	popq	%r12
  2fc813:      	popq	%r13
  2fc815:      	popq	%r14
  2fc817:      	popq	%r15
  2fc819:      	popq	%rbp
  2fc81a:      	vzeroupper
  2fc81d:      	retq
  2fc81e:      	leaq	0x504b13(%rip), %rdi    # 0x801338 <anon.5671b1afcf0deb4901e628e66543ca25.9.llvm.14831336972970403172+0xf0>
  2fc825:      	vzeroupper
  2fc828:      	callq	*0x57790a(%rip)         # 0x874138 <sdallocx+0x874138>
