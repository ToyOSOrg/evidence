_RNvNtCs4U4sOGKWW3b_12toyos_crypto6x255198multiply:
.Lfunc_begin139:
	.loc	51 47 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$840, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, -792(%rbp)
.Ltmp21512:
	.loc	53 84 21 prologue_end
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -768(%rbp)
	movaps	%xmm0, -784(%rbp)
	xorl	%eax, %eax
	xorl	%r10d, %r10d
.Ltmp21513:
	.loc	53 0 21 is_stmt 0
.Ltmp21514:
	.p2align	4
.LBB139_1:
	.loc	53 87 26 is_stmt 1
	movzbl	(%rdx,%r10), %edi
	.loc	53 87 25 is_stmt 0
	movl	%eax, %ecx
	andb	$48, %cl
	shlq	%cl, %rdi
	.loc	53 87 13
	movq	%r10, %r8
	andq	$-8, %r8
	orq	-784(%rbp,%r8), %rdi
	movq	%rdi, -784(%rbp,%r8)
.Ltmp21515:
	.loc	53 87 26
	movzbl	1(%rdx,%r10), %r9d
	.loc	53 87 25
	leal	8(%rax), %ecx
	andb	$56, %cl
	shlq	%cl, %r9
	.loc	53 87 13
	orq	%rdi, %r9
	movq	%r9, -784(%rbp,%r8)
	.loc	53 88 13 is_stmt 1
	addq	$2, %r10
.Ltmp21516:
	.loc	53 86 15
	addq	$16, %rax
	cmpq	$32, %r10
	jne	.LBB139_1
.Ltmp21517:
	.loc	53 0 15 is_stmt 0
	movabsq	$2251799813685247, %rax
	.loc	53 91 13 is_stmt 1
	movq	-784(%rbp), %rdi
	.loc	53 92 27
	movq	-776(%rbp), %r9
	.loc	53 92 13 is_stmt 0
	movq	%r9, %rbx
	shldq	$13, %rdi, %rbx
	.loc	53 91 13 is_stmt 1
	andq	%rax, %rdi
	.loc	53 92 13
	andq	%rax, %rbx
	.loc	53 93 27
	movq	-768(%rbp), %r14
	.loc	53 93 13 is_stmt 0
	shrdq	$38, %r14, %r9
	andq	%rax, %r9
	.loc	53 94 27 is_stmt 1
	movq	-760(%rbp), %r15
	.loc	53 94 13 is_stmt 0
	shrdq	$25, %r15, %r14
	andq	%rax, %r14
	.loc	53 95 13 is_stmt 1
	shrq	$12, %r15
	andq	%rax, %r15
.Ltmp21518:
	.loc	51 49 31
	movq	$0, -528(%rbp)
	movups	.Lanon.7527e279b24a9219233149cb0fcb89c0.40+16(%rip), %xmm0
	movups	.Lanon.7527e279b24a9219233149cb0fcb89c0.40(%rip), %xmm1
	xorps	%xmm2, %xmm2
	movups	%xmm2, -520(%rbp)
	movups	%xmm2, -504(%rbp)
	movq	$0, -488(%rbp)
	.loc	51 49 21 is_stmt 0
	movaps	%xmm1, -784(%rbp)
	movaps	%xmm0, -768(%rbp)
	movq	-528(%rbp), %rax
	movq	%rax, -752(%rbp)
	movq	-520(%rbp), %rax
	movq	%rax, -744(%rbp)
	movaps	-512(%rbp), %xmm0
	movaps	%xmm0, -736(%rbp)
	movq	-496(%rbp), %rax
	movq	%rax, -720(%rbp)
	movq	-488(%rbp), %rax
	movq	%rax, -712(%rbp)
	movq	-784(%rbp), %rax
	movq	%rax, -120(%rbp)
	movq	-776(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	-768(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	-760(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-752(%rbp), %rax
	movq	%rax, -96(%rbp)
	movq	-744(%rbp), %r10
.Ltmp21519:
	.loc	51 0 21
	movq	-736(%rbp), %r13
	movq	-728(%rbp), %rcx
	movq	-720(%rbp), %r11
	movl	$1, %eax
	movq	%rax, -136(%rbp)
	movl	$254, %r12d
	xorl	%edx, %edx
.Ltmp21520:
	movq	-712(%rbp), %r8
	movq	%rdi, -472(%rbp)
.Ltmp21521:
	movq	%rbx, -456(%rbp)
.Ltmp21522:
	movq	%r9, -464(%rbp)
.Ltmp21523:
	movq	%r14, -624(%rbp)
.Ltmp21524:
	movq	%r15, -616(%rbp)
.Ltmp21525:
	movq	%r15, -232(%rbp)
	movq	$0, -160(%rbp)
	movq	$0, -80(%rbp)
	movq	$0, -88(%rbp)
	movq	$0, -112(%rbp)
	movq	%rsi, -800(%rbp)
.Ltmp21526:
	.p2align	4
.LBB139_3:
	movq	%r12, -872(%rbp)
	movq	%rdx, %rax
.Ltmp21527:
	.loc	51 53 37 is_stmt 1
	movq	%r12, %rdx
.Ltmp21528:
	shrq	$3, %rdx
	.loc	51 53 30 is_stmt 0
	movzbl	(%rsi,%rdx), %edx
	.loc	51 53 29
	movl	%r12d, %esi
	andl	$7, %esi
	btl	%esi, %edx
	movl	$0, %edx
	setb	%dl
.Ltmp21529:
	.loc	51 0 29
	movq	%rdx, -864(%rbp)
.Ltmp21530:
	.loc	51 54 29 is_stmt 1
	xorq	%rdx, %rax
.Ltmp21531:
	.loc	21 44 9
	#APP

	# rax 

	#NO_APP
.Ltmp21532:
	.loc	4 2649 13
	negq	%rax
.Ltmp21533:
	.loc	53 185 21
	movq	%rdi, %rdx
	movq	-120(%rbp), %rsi
	xorq	%rsi, %rdx
	andq	%rax, %rdx
.Ltmp21534:
	.loc	53 186 13
	xorq	%rdx, %rsi
	movq	%rsi, %r12
	movq	%rsi, -120(%rbp)
	.loc	53 187 13
	xorq	%rdi, %rdx
.Ltmp21535:
	.loc	53 0 13 is_stmt 0
	movq	%rdx, -152(%rbp)
.Ltmp21536:
	.loc	53 185 21 is_stmt 1
	movq	%rbx, %rdx
	movq	-64(%rbp), %rsi
	xorq	%rsi, %rdx
	andq	%rax, %rdx
.Ltmp21537:
	.loc	53 186 13
	xorq	%rdx, %rsi
	movq	%rsi, %r15
	movq	%rsi, -64(%rbp)
	.loc	53 187 13
	xorq	%rbx, %rdx
.Ltmp21538:
	.loc	53 0 13 is_stmt 0
	movq	%rdx, -168(%rbp)
.Ltmp21539:
	.loc	53 185 21 is_stmt 1
	movq	%r9, %rdx
	movq	-56(%rbp), %rsi
	xorq	%rsi, %rdx
	andq	%rax, %rdx
.Ltmp21540:
	.loc	53 186 13
	xorq	%rdx, %rsi
	movq	%rsi, %rbx
	movq	%rsi, -56(%rbp)
	.loc	53 187 13
	xorq	%r9, %rdx
.Ltmp21541:
	.loc	53 0 13 is_stmt 0
	movq	%rdx, -48(%rbp)
.Ltmp21542:
	.loc	53 185 21 is_stmt 1
	movq	%r14, %rdx
	movq	-72(%rbp), %rsi
	xorq	%rsi, %rdx
	andq	%rax, %rdx
.Ltmp21543:
	.loc	53 186 13
	xorq	%rdx, %rsi
	movq	%rsi, %r9
	movq	%rsi, -72(%rbp)
	.loc	53 187 13
	xorq	%r14, %rdx
.Ltmp21544:
	.loc	53 0 13 is_stmt 0
	movq	%rdx, -184(%rbp)
	movq	-232(%rbp), %rsi
.Ltmp21545:
	.loc	53 185 21 is_stmt 1
	movq	%rsi, %rdx
	movq	-96(%rbp), %rdi
	xorq	%rdi, %rdx
	andq	%rax, %rdx
.Ltmp21546:
	.loc	53 186 13
	xorq	%rdx, %rdi
	movq	%rdi, -96(%rbp)
	.loc	53 187 13
	xorq	%rsi, %rdx
.Ltmp21547:
	.loc	53 0 13 is_stmt 0
	movq	%rdx, -224(%rbp)
	movq	-136(%rbp), %rdx
.Ltmp21548:
	.loc	53 185 21 is_stmt 1
	movq	%rdx, %rsi
	xorq	%r10, %rsi
	andq	%rax, %rsi
.Ltmp21549:
	.loc	53 186 13
	xorq	%rsi, %r10
	.loc	53 187 13
	xorq	%rdx, %rsi
.Ltmp21550:
	.loc	53 0 13 is_stmt 0
	movq	%rsi, -216(%rbp)
	movq	-160(%rbp), %rdx
.Ltmp21551:
	.loc	53 185 21 is_stmt 1
	movq	%rdx, %rsi
	xorq	%r13, %rsi
	andq	%rax, %rsi
.Ltmp21552:
	.loc	53 186 13
	xorq	%rsi, %r13
	movq	%r13, -240(%rbp)
	.loc	53 187 13
	xorq	%rdx, %rsi
.Ltmp21553:
	.loc	53 0 13 is_stmt 0
	movq	%rsi, -336(%rbp)
	movq	-80(%rbp), %rdx
.Ltmp21554:
	.loc	53 185 21 is_stmt 1
	movq	%rdx, %rsi
	xorq	%rcx, %rsi
	andq	%rax, %rsi
.Ltmp21555:
	.loc	53 186 13
	xorq	%rsi, %rcx
	.loc	53 187 13
	xorq	%rdx, %rsi
.Ltmp21556:
	.loc	53 0 13 is_stmt 0
	movq	%rsi, -344(%rbp)
	movq	-88(%rbp), %rdx
.Ltmp21557:
	.loc	53 185 21 is_stmt 1
	movq	%rdx, %rsi
	xorq	%r11, %rsi
	andq	%rax, %rsi
.Ltmp21558:
	.loc	53 186 13
	xorq	%rsi, %r11
	.loc	53 187 13
	xorq	%rdx, %rsi
.Ltmp21559:
	.loc	53 0 13 is_stmt 0
	movq	%rsi, -288(%rbp)
	movq	-112(%rbp), %rdx
.Ltmp21560:
	.loc	53 185 21 is_stmt 1
	movq	%rdx, %rsi
	xorq	%r8, %rsi
	andq	%rax, %rsi
.Ltmp21561:
	.loc	53 186 13
	xorq	%rsi, %r8
	.loc	53 187 13
	xorq	%rdx, %rsi
.Ltmp21562:
	.loc	53 0 13 is_stmt 0
	movq	%rsi, -352(%rbp)
.Ltmp21563:
	.loc	4 2612 13 is_stmt 1
	leaq	(%r11,%r9), %rdx
.Ltmp21564:
	.loc	4 0 13 is_stmt 0
	movq	%rdx, -200(%rbp)
.Ltmp21565:
	.loc	4 2688 13 is_stmt 1
	leaq	(%rdx,%rdx,8), %rax
.Ltmp21566:
	.loc	4 0 13 is_stmt 0
	movq	%r10, %rsi
	movq	%r10, -192(%rbp)
.Ltmp21567:
	.loc	4 2688 13
	leaq	(%rdx,%rax,2), %r10
.Ltmp21568:
	.loc	4 2612 13 is_stmt 1
	leaq	(%r8,%rdi), %rdx
.Ltmp21569:
	.loc	4 0 13 is_stmt 0
	movq	%rdx, -144(%rbp)
.Ltmp21570:
	.loc	4 2688 13 is_stmt 1
	leaq	(%rdx,%rdx,8), %rax
	leaq	(%rdx,%rax,2), %r9
.Ltmp21571:
	.loc	4 0 13 is_stmt 0
	movq	%r9, -104(%rbp)
.Ltmp21572:
	.loc	4 2612 13 is_stmt 1
	addq	%r12, %rsi
.Ltmp21573:
	.loc	4 2688 13
	movq	%rsi, %rax
	mulq	%rsi
.Ltmp21574:
	.loc	4 0 13 is_stmt 0
	movq	%rsi, -304(%rbp)
	.loc	4 2688 13
	movq	%rax, %r12
	movq	%rdx, %rdi
.Ltmp21575:
	.loc	4 2612 13 is_stmt 1
	addq	%r13, %r15
.Ltmp21576:
	.loc	4 2688 13
	leaq	(%r15,%r15), %rdx
.Ltmp21577:
	.loc	4 0 13 is_stmt 0
	movq	%rdx, -80(%rbp)
.Ltmp21578:
	.loc	4 2688 13
	movq	%r9, %rax
.Ltmp21579:
	mulq	%rdx
.Ltmp21580:
	movq	%rax, %r9
	movq	%rdx, %r14
.Ltmp21581:
	.loc	4 2612 13 is_stmt 1
	leaq	(%rcx,%rbx), %rax
.Ltmp21582:
	.loc	4 0 13 is_stmt 0
	movq	%rax, -88(%rbp)
.Ltmp21583:
	.loc	4 2688 13 is_stmt 1
	leaq	(%rax,%rax), %r13
.Ltmp21584:
	.loc	4 2688 13 is_stmt 0
	movq	%r10, %rax
.Ltmp21585:
	.loc	4 0 13
	movq	%r10, -232(%rbp)
.Ltmp21586:
	.loc	4 2688 13
	mulq	%r13
.Ltmp21587:
	.loc	4 2612 13 is_stmt 1
	addq	%r12, %rax
	adcq	%rdx, %rdi
.Ltmp21588:
	.loc	4 2612 13 is_stmt 0
	addq	%r9, %rax
	movq	%rax, -280(%rbp)
	adcq	%r14, %rdi
.Ltmp21589:
	.loc	4 2688 13 is_stmt 1
	leaq	(%rsi,%rsi), %rbx
.Ltmp21590:
	.loc	4 2688 13 is_stmt 0
	movq	%r15, %rax
	mulq	%rbx
.Ltmp21591:
	movq	%rdx, %r14
.Ltmp21592:
	movq	%rax, %rsi
.Ltmp21593:
	.loc	4 2688 13
	movq	%r10, %rax
	movq	-200(%rbp), %r12
.Ltmp21594:
	mulq	%r12
	movq	%rax, %r9
.Ltmp21595:
	.loc	4 2612 13 is_stmt 1
	addq	%rsi, %r9
	adcq	%rdx, %r14
.Ltmp21596:
	.loc	4 0 13 is_stmt 0
	movq	-104(%rbp), %r10
.Ltmp21597:
	.loc	4 2688 13 is_stmt 1
	movq	%r10, %rax
.Ltmp21598:
	mulq	%r13
.Ltmp21599:
	.loc	4 2612 13
	addq	%r9, %rax
.Ltmp21600:
	.loc	4 0 13 is_stmt 0
	movq	%rax, -328(%rbp)
	.loc	4 2612 13
	adcq	%rdx, %r14
.Ltmp21601:
	.loc	4 0 13
	movq	-88(%rbp), %r13
.Ltmp21602:
	.loc	4 2688 13 is_stmt 1
	movq	%r13, %rax
	movq	%rbx, %r9
.Ltmp21603:
	.loc	4 0 13 is_stmt 0
	movq	%rbx, -272(%rbp)
.Ltmp21604:
	.loc	4 2688 13
	mulq	%rbx
.Ltmp21605:
	movq	%rdx, %rbx
.Ltmp21606:
	movq	%rax, %rsi
.Ltmp21607:
	.loc	4 0 13
	movq	%r15, -160(%rbp)
.Ltmp21608:
	.loc	4 2688 13
	movq	%r15, %rax
	mulq	%r15
	movq	%rax, %r15
.Ltmp21609:
	.loc	4 2612 13 is_stmt 1
	addq	%rsi, %r15
.Ltmp21610:
	adcq	%rdx, %rbx
.Ltmp21611:
	.loc	4 2688 13
	leaq	(%r12,%r12), %rdx
.Ltmp21612:
	.loc	4 2688 13 is_stmt 0
	movq	%r10, %rax
.Ltmp21613:
	mulq	%rdx
.Ltmp21614:
	.loc	4 2612 13 is_stmt 1
	addq	%r15, %rax
.Ltmp21615:
	.loc	4 0 13 is_stmt 0
	movq	%rax, -320(%rbp)
	.loc	4 2612 13
	adcq	%rdx, %rbx
.Ltmp21616:
	.loc	4 2688 13 is_stmt 1
	movq	%r12, %rax
	mulq	%r9
.Ltmp21617:
	movq	%rdx, %rsi
.Ltmp21618:
	movq	%rax, %r15
.Ltmp21619:
	.loc	4 2688 13 is_stmt 0
	movq	%r13, %rax
	movq	-80(%rbp), %r9
	mulq	%r9
	movq	%rax, %r12
.Ltmp21620:
	.loc	4 2612 13 is_stmt 1
	addq	%r15, %r12
.Ltmp21621:
	adcq	%rdx, %rsi
.Ltmp21622:
	.loc	4 2688 13
	movq	%r10, %rax
.Ltmp21623:
	.loc	4 0 13 is_stmt 0
	movq	-144(%rbp), %r10
	.loc	4 2688 13
	mulq	%r10
.Ltmp21624:
	movq	%rax, %r15
.Ltmp21625:
	.loc	4 2612 13 is_stmt 1
	addq	%r12, %r15
.Ltmp21626:
	adcq	%rdx, %rsi
.Ltmp21627:
	.loc	4 2688 13
	movq	%r10, %rax
.Ltmp21628:
	mulq	-272(%rbp)
.Ltmp21629:
	.loc	4 0 13 is_stmt 0
	movq	%rdx, -272(%rbp)
.Ltmp21630:
	movq	%rax, -176(%rbp)
.Ltmp21631:
	movq	-72(%rbp), %rax
.Ltmp21632:
	.loc	4 2688 13
	addq	%r11, %rax
	mulq	%r9
	movq	%rdx, -80(%rbp)
.Ltmp21633:
	.loc	4 0 13
	movq	%rax, -264(%rbp)
.Ltmp21634:
	.loc	4 2688 13
	movq	%r13, %rax
	mulq	%r13
.Ltmp21635:
	.loc	53 63 30 is_stmt 1
	movq	%rdi, %r12
.Ltmp21636:
	.loc	53 0 30 is_stmt 0
	movq	-280(%rbp), %r10
	.loc	53 63 30
	shldq	$13, %r10, %rdi
.Ltmp21637:
	shrq	$51, %r12
.Ltmp21638:
	.loc	4 2612 13 is_stmt 1
	addq	-328(%rbp), %rdi
.Ltmp21639:
	adcq	%r14, %r12
.Ltmp21640:
	.loc	53 64 30
	movq	%r12, %r14
.Ltmp21641:
	shldq	$13, %rdi, %r12
.Ltmp21642:
	shrq	$51, %r14
.Ltmp21643:
	.loc	4 2612 13
	addq	-320(%rbp), %r12
.Ltmp21644:
	adcq	%rbx, %r14
.Ltmp21645:
	.loc	53 65 30
	movq	%r14, %r9
.Ltmp21646:
	shrq	$51, %r9
.Ltmp21647:
	shldq	$13, %r12, %r14
.Ltmp21648:
	.loc	4 2612 13
	addq	%r15, %r14
.Ltmp21649:
	adcq	%rsi, %r9
.Ltmp21650:
	.loc	53 66 30
	movq	%r9, %rsi
.Ltmp21651:
	shrq	$51, %rsi
.Ltmp21652:
	shldq	$13, %r14, %r9
.Ltmp21653:
	.loc	53 0 30 is_stmt 0
	movq	%r14, %r15
.Ltmp21654:
	.loc	4 2612 13 is_stmt 1
	addq	-264(%rbp), %rax
	adcq	-80(%rbp), %rdx
.Ltmp21655:
	.loc	4 2612 13 is_stmt 0
	addq	-176(%rbp), %rax
.Ltmp21656:
	adcq	-272(%rbp), %rdx
.Ltmp21657:
	.loc	4 2612 13
	addq	%r9, %rax
.Ltmp21658:
	.loc	4 0 13
	movq	%rax, %r9
.Ltmp21659:
	.loc	4 2612 13
	adcq	%rsi, %rdx
.Ltmp21660:
	.loc	53 67 56 is_stmt 1
	movq	%rdx, %rax
.Ltmp21661:
	shrq	$51, %rdx
.Ltmp21662:
	.loc	4 2688 13
	leaq	(%rdx,%rdx,8), %rsi
.Ltmp21663:
	leaq	(%rdx,%rsi,2), %r14
	movabsq	$2251799813685247, %rsi
.Ltmp21664:
	.loc	27 72 17
	andq	%rsi, %r10
.Ltmp21665:
	.loc	53 67 56
	shldq	$13, %r9, %rax
.Ltmp21666:
	.loc	53 0 56 is_stmt 0
	movl	$19, %edx
.Ltmp21667:
	.loc	4 2688 13 is_stmt 1
	mulq	%rdx
.Ltmp21668:
	.loc	4 2612 13
	addq	%r10, %rax
.Ltmp21669:
	adcq	%rdx, %r14
.Ltmp21670:
	.loc	53 68 14
	andq	%rsi, %rdi
.Ltmp21671:
	.loc	53 68 46 is_stmt 0
	shldq	$13, %rax, %r14
.Ltmp21672:
	.loc	53 0 46
	movq	%rax, %rdx
.Ltmp21673:
	.loc	4 2612 13 is_stmt 1
	addq	%rdi, %r14
.Ltmp21674:
	.loc	4 0 13 is_stmt 0
	movq	%r14, -320(%rbp)
.Ltmp21675:
	movabsq	$4503599627370494, %r10
.Ltmp21676:
	movq	-120(%rbp), %rax
.Ltmp21677:
	.loc	4 2612 13
	leaq	(%rax,%r10), %rbx
.Ltmp21678:
	addq	$-36, %rbx
.Ltmp21679:
	.loc	4 2649 13 is_stmt 1
	subq	-192(%rbp), %rbx
.Ltmp21680:
	.loc	4 0 13 is_stmt 0
	movq	-64(%rbp), %r14
.Ltmp21681:
	.loc	4 2612 13 is_stmt 1
	addq	%r10, %r14
.Ltmp21682:
	.loc	4 2649 13
	subq	-240(%rbp), %r14
.Ltmp21683:
	.loc	4 0 13 is_stmt 0
	movq	-56(%rbp), %r13
.Ltmp21684:
	.loc	4 2612 13 is_stmt 1
	addq	%r10, %r13
.Ltmp21685:
	.loc	4 2649 13
	subq	%rcx, %r13
.Ltmp21686:
	.loc	4 0 13 is_stmt 0
	movq	%r13, -56(%rbp)
.Ltmp21687:
	movq	-72(%rbp), %rcx
.Ltmp21688:
	.loc	4 2612 13 is_stmt 1
	addq	%r10, %rcx
.Ltmp21689:
	.loc	4 2649 13
	subq	%r11, %rcx
.Ltmp21690:
	.loc	4 0 13 is_stmt 0
	movq	%rcx, -72(%rbp)
.Ltmp21691:
	movq	-96(%rbp), %rdi
.Ltmp21692:
	.loc	4 2612 13 is_stmt 1
	addq	%r10, %rdi
.Ltmp21693:
	.loc	4 2649 13
	subq	%r8, %rdi
.Ltmp21694:
	.loc	4 0 13 is_stmt 0
	movq	%rdi, -96(%rbp)
.Ltmp21695:
	.loc	53 70 9 is_stmt 1
	andq	%rsi, %rdx
.Ltmp21696:
	.loc	53 0 9 is_stmt 0
	movq	%rdx, -280(%rbp)
.Ltmp21697:
	.loc	53 72 9 is_stmt 1
	andq	%rsi, %r12
.Ltmp21698:
	.loc	53 0 9 is_stmt 0
	movq	%r12, -240(%rbp)
.Ltmp21699:
	.loc	53 73 9 is_stmt 1
	andq	%rsi, %r15
.Ltmp21700:
	.loc	53 0 9 is_stmt 0
	movq	%r15, -272(%rbp)
	.loc	53 74 9 is_stmt 1
	andq	%rsi, %r9
.Ltmp21701:
	.loc	53 0 9 is_stmt 0
	movq	%r9, -192(%rbp)
.Ltmp21702:
	.loc	4 2688 13 is_stmt 1
	leaq	(%rcx,%rcx,8), %rax
	leaq	(%rcx,%rax,2), %r11
.Ltmp21703:
	.loc	4 2688 13 is_stmt 0
	leaq	(%rdi,%rdi,8), %rax
	leaq	(%rdi,%rax,2), %r15
.Ltmp21704:
	.loc	4 2688 13
	movq	%rbx, %rax
	mulq	%rbx
.Ltmp21705:
	.loc	4 0 13
	movq	%rbx, %r12
.Ltmp21706:
	movq	%rbx, -112(%rbp)
.Ltmp21707:
	.loc	4 2688 13
	movq	%rax, %rsi
	movq	%rdx, %r8
.Ltmp21708:
	.loc	4 2688 13
	leaq	(%r14,%r14), %rcx
.Ltmp21709:
	.loc	4 0 13
	movq	%rcx, -80(%rbp)
.Ltmp21710:
	.loc	4 2688 13
	movq	%r15, %rax
	mulq	%rcx
.Ltmp21711:
	movq	%rax, %r9
.Ltmp21712:
	movq	%rdx, %r10
.Ltmp21713:
	.loc	4 2688 13
	leaq	(,%r13,2), %rbx
.Ltmp21714:
	.loc	4 2688 13
	movq	%r11, %rax
.Ltmp21715:
	.loc	4 0 13
	movq	%r11, -208(%rbp)
.Ltmp21716:
	.loc	4 2688 13
	mulq	%rbx
.Ltmp21717:
	movq	%rdx, %rcx
.Ltmp21718:
	.loc	4 2612 13 is_stmt 1
	addq	%rsi, %rax
	adcq	%r8, %rcx
.Ltmp21719:
	.loc	4 2612 13 is_stmt 0
	addq	%r9, %rax
	movq	%rax, -120(%rbp)
.Ltmp21720:
	adcq	%r10, %rcx
.Ltmp21721:
	.loc	4 2688 13 is_stmt 1
	leaq	(%r12,%r12), %rdi
.Ltmp21722:
	.loc	4 2688 13 is_stmt 0
	movq	%r14, %rax
	mulq	%rdi
.Ltmp21723:
	movq	%rdx, %rsi
.Ltmp21724:
	movq	%rax, %r8
.Ltmp21725:
	.loc	4 2688 13
	movq	%r11, %rax
.Ltmp21726:
	.loc	4 0 13
	movq	-72(%rbp), %r10
.Ltmp21727:
	.loc	4 2688 13
	mulq	%r10
	movq	%rdx, %r9
.Ltmp21728:
	movq	%rax, %r11
.Ltmp21729:
	.loc	4 2612 13 is_stmt 1
	addq	%r8, %r11
	adcq	%rsi, %r9
.Ltmp21730:
	.loc	4 0 13 is_stmt 0
	movq	%r15, %r13
.Ltmp21731:
	.loc	4 2688 13 is_stmt 1
	movq	%r15, %rax
.Ltmp21732:
	mulq	%rbx
.Ltmp21733:
	.loc	4 2612 13
	addq	%r11, %rax
.Ltmp21734:
	.loc	4 0 13 is_stmt 0
	movq	%rax, -328(%rbp)
.Ltmp21735:
	.loc	4 2612 13
	adcq	%r9, %rdx
.Ltmp21736:
	.loc	4 0 13
	movq	%rdx, -176(%rbp)
.Ltmp21737:
	movq	-56(%rbp), %r15
.Ltmp21738:
	.loc	4 2688 13 is_stmt 1
	movq	%r15, %rax
	mulq	%rdi
	movq	%rdi, %r8
.Ltmp21739:
	movq	%rdx, %r9
.Ltmp21740:
	movq	%rax, %rsi
.Ltmp21741:
	.loc	4 0 13 is_stmt 0
	movq	%r14, -64(%rbp)
.Ltmp21742:
	.loc	4 2688 13
	movq	%r14, %rax
	mulq	%r14
.Ltmp21743:
	movq	%rax, %r11
.Ltmp21744:
	.loc	4 2612 13 is_stmt 1
	addq	%rsi, %r11
	adcq	%rdx, %r9
.Ltmp21745:
	.loc	4 0 13 is_stmt 0
	movq	%r10, %rdi
.Ltmp21746:
	.loc	4 2688 13 is_stmt 1
	leaq	(%r10,%r10), %rdx
.Ltmp21747:
	.loc	4 2688 13 is_stmt 0
	movq	%r13, %rax
.Ltmp21748:
	.loc	4 0 13
	movq	%r13, -136(%rbp)
	.loc	4 2688 13
	mulq	%rdx
.Ltmp21749:
	movq	%rax, %r10
.Ltmp21750:
	.loc	4 2612 13 is_stmt 1
	addq	%r11, %r10
.Ltmp21751:
	adcq	%rdx, %r9
.Ltmp21752:
	.loc	4 2688 13
	movq	%rdi, %rax
.Ltmp21753:
	mulq	%r8
.Ltmp21754:
	movq	%rdx, %r11
.Ltmp21755:
	movq	%rax, %rbx
.Ltmp21756:
	.loc	4 2688 13 is_stmt 0
	movq	%r15, %rax
	movq	-80(%rbp), %rsi
.Ltmp21757:
	mulq	%rsi
.Ltmp21758:
	movq	%rdx, %r14
	movq	%rax, %r12
.Ltmp21759:
	.loc	4 2612 13 is_stmt 1
	addq	%rbx, %r12
.Ltmp21760:
	adcq	%r11, %r14
.Ltmp21761:
	.loc	4 2688 13
	movq	%r13, %rax
.Ltmp21762:
	.loc	4 0 13 is_stmt 0
	movq	-96(%rbp), %r11
.Ltmp21763:
	.loc	4 2688 13
	mulq	%r11
	movq	%rdx, %rbx
.Ltmp21764:
	movq	%rax, %r15
.Ltmp21765:
	.loc	4 2612 13 is_stmt 1
	addq	%r12, %r15
.Ltmp21766:
	adcq	%r14, %rbx
.Ltmp21767:
	.loc	4 2688 13
	movq	%r11, %rax
.Ltmp21768:
	mulq	%r8
	movq	%rdx, -264(%rbp)
.Ltmp21769:
	movq	%rax, %r14
.Ltmp21770:
	.loc	4 2688 13 is_stmt 0
	movq	%rdi, %rax
	mulq	%rsi
	movq	%rdx, %r12
.Ltmp21771:
	movq	%rax, %r13
.Ltmp21772:
	.loc	4 0 13
	movq	-56(%rbp), %rax
.Ltmp21773:
	.loc	4 2688 13
	mulq	%rax
	movq	%rax, %r11
.Ltmp21774:
	.loc	53 63 30 is_stmt 1
	movq	%rcx, %rax
	movq	-120(%rbp), %rdi
	shldq	$13, %rdi, %rcx
.Ltmp21775:
	shrq	$51, %rax
.Ltmp21776:
	.loc	4 2612 13
	addq	-328(%rbp), %rcx
.Ltmp21777:
	adcq	-176(%rbp), %rax
.Ltmp21778:
	.loc	53 64 30
	movq	%rax, %r8
.Ltmp21779:
	shldq	$13, %rcx, %rax
.Ltmp21780:
	shrq	$51, %r8
.Ltmp21781:
	.loc	4 2612 13
	addq	%r10, %rax
.Ltmp21782:
	.loc	4 0 13 is_stmt 0
	movq	%rax, %r10
.Ltmp21783:
	.loc	4 2612 13
	adcq	%r9, %r8
.Ltmp21784:
	.loc	53 65 30 is_stmt 1
	movq	%r8, %rax
.Ltmp21785:
	shrq	$51, %rax
.Ltmp21786:
	shldq	$13, %r10, %r8
.Ltmp21787:
	.loc	4 2612 13
	addq	%r15, %r8
.Ltmp21788:
	adcq	%rbx, %rax
.Ltmp21789:
	.loc	53 66 30
	movq	%rax, %rsi
	shrq	$51, %rsi
.Ltmp21790:
	shldq	$13, %r8, %rax
.Ltmp21791:
	.loc	4 2612 13
	addq	%r13, %r11
	adcq	%r12, %rdx
.Ltmp21792:
	.loc	4 2612 13 is_stmt 0
	addq	%r14, %r11
.Ltmp21793:
	adcq	-264(%rbp), %rdx
.Ltmp21794:
	.loc	4 2612 13
	addq	%rax, %r11
.Ltmp21795:
	adcq	%rsi, %rdx
.Ltmp21796:
	.loc	53 67 56 is_stmt 1
	movq	%rdx, %rax
.Ltmp21797:
	shldq	$13, %r11, %rax
.Ltmp21798:
	shrq	$51, %rdx
.Ltmp21799:
	.loc	4 2688 13
	leaq	(%rdx,%rdx,8), %rsi
.Ltmp21800:
	leaq	(%rdx,%rsi,2), %rsi
	movl	$19, %edx
.Ltmp21801:
	mulq	%rdx
.Ltmp21802:
	.loc	4 0 13 is_stmt 0
	movabsq	$2251799813685247, %rbx
.Ltmp21803:
	.loc	27 72 17 is_stmt 1
	andq	%rbx, %rdi
.Ltmp21804:
	.loc	4 2612 13
	addq	%rdi, %rax
.Ltmp21805:
	adcq	%rsi, %rdx
.Ltmp21806:
	.loc	53 68 46
	shldq	$13, %rax, %rdx
.Ltmp21807:
	.loc	53 68 14 is_stmt 0
	andq	%rbx, %rcx
.Ltmp21808:
	.loc	4 2612 13 is_stmt 1
	addq	%rcx, %rdx
.Ltmp21809:
	.loc	4 0 13 is_stmt 0
	movq	%rdx, %r12
.Ltmp21810:
	movq	%rdx, -120(%rbp)
.Ltmp21811:
	movq	-168(%rbp), %rcx
.Ltmp21812:
	movq	-336(%rbp), %rdx
.Ltmp21813:
	.loc	4 2612 13
	leaq	(%rdx,%rcx), %rdi
.Ltmp21814:
	.loc	4 0 13
	movq	%rdi, -296(%rbp)
.Ltmp21815:
	movabsq	$4503599627370494, %rdi
.Ltmp21816:
	.loc	4 2612 13
	addq	%rdi, %rcx
.Ltmp21817:
	.loc	4 2649 13 is_stmt 1
	subq	%rdx, %rcx
.Ltmp21818:
	.loc	4 0 13 is_stmt 0
	movq	%rcx, %r14
.Ltmp21819:
	movq	%rcx, -168(%rbp)
.Ltmp21820:
	movq	-48(%rbp), %rcx
	movq	-344(%rbp), %rdx
.Ltmp21821:
	.loc	4 2612 13 is_stmt 1
	leaq	(%rdx,%rcx), %r9
.Ltmp21822:
	.loc	4 0 13 is_stmt 0
	movq	%r9, -128(%rbp)
.Ltmp21823:
	.loc	4 2612 13
	addq	%rdi, %rcx
.Ltmp21824:
	.loc	4 2649 13 is_stmt 1
	subq	%rdx, %rcx
.Ltmp21825:
	.loc	4 0 13 is_stmt 0
	movq	%rcx, -48(%rbp)
.Ltmp21826:
	movq	-184(%rbp), %r15
.Ltmp21827:
	movq	-288(%rbp), %rdx
.Ltmp21828:
	.loc	4 2612 13 is_stmt 1
	leaq	(%rdx,%r15), %r9
.Ltmp21829:
	.loc	4 0 13 is_stmt 0
	movq	%r9, -392(%rbp)
.Ltmp21830:
	.loc	4 2612 13
	addq	%rdi, %r15
.Ltmp21831:
	.loc	4 2649 13 is_stmt 1
	subq	%rdx, %r15
.Ltmp21832:
	.loc	4 0 13 is_stmt 0
	movq	%r15, -184(%rbp)
.Ltmp21833:
	movq	-224(%rbp), %rsi
	movq	-352(%rbp), %rdx
.Ltmp21834:
	.loc	4 2612 13 is_stmt 1
	leaq	(%rdx,%rsi), %r9
.Ltmp21835:
	.loc	4 0 13 is_stmt 0
	movq	%r9, -384(%rbp)
.Ltmp21836:
	.loc	4 2612 13
	addq	%rdi, %rsi
.Ltmp21837:
	.loc	4 2649 13 is_stmt 1
	subq	%rdx, %rsi
.Ltmp21838:
	.loc	4 0 13 is_stmt 0
	movq	%rsi, -224(%rbp)
.Ltmp21839:
	movq	%rax, %rdx
.Ltmp21840:
	.loc	53 70 9 is_stmt 1
	andq	%rbx, %rdx
.Ltmp21841:
	.loc	53 0 9 is_stmt 0
	movq	%rdx, -440(%rbp)
	.loc	53 72 9 is_stmt 1
	andq	%rbx, %r10
.Ltmp21842:
	.loc	53 0 9 is_stmt 0
	movq	%r10, -264(%rbp)
.Ltmp21843:
	.loc	53 73 9 is_stmt 1
	andq	%rbx, %r8
.Ltmp21844:
	.loc	53 0 9 is_stmt 0
	movq	%r8, -176(%rbp)
.Ltmp21845:
	.loc	53 74 9 is_stmt 1
	andq	%rbx, %r11
.Ltmp21846:
	.loc	53 0 9 is_stmt 0
	movq	%r11, %r13
.Ltmp21847:
	movq	%r11, -432(%rbp)
	movq	-280(%rbp), %rax
.Ltmp21848:
	.loc	4 2612 13 is_stmt 1
	addq	%rdi, %rax
	addq	$-36, %rax
.Ltmp21849:
	.loc	4 2649 13
	subq	%rdx, %rax
.Ltmp21850:
	.loc	4 0 13 is_stmt 0
	movq	%rax, -336(%rbp)
.Ltmp21851:
	movq	-320(%rbp), %rax
.Ltmp21852:
	.loc	4 2612 13 is_stmt 1
	addq	%rdi, %rax
.Ltmp21853:
	.loc	4 2649 13
	subq	%r12, %rax
.Ltmp21854:
	.loc	4 0 13 is_stmt 0
	movq	%rax, -288(%rbp)
.Ltmp21855:
	movq	-240(%rbp), %rax
.Ltmp21856:
	.loc	4 2612 13 is_stmt 1
	addq	%rdi, %rax
.Ltmp21857:
	.loc	4 2649 13
	subq	%r10, %rax
.Ltmp21858:
	.loc	4 0 13 is_stmt 0
	movq	%rax, -328(%rbp)
.Ltmp21859:
	movq	-272(%rbp), %rax
.Ltmp21860:
	.loc	4 2612 13 is_stmt 1
	addq	%rdi, %rax
.Ltmp21861:
	.loc	4 2649 13
	subq	%r8, %rax
.Ltmp21862:
	.loc	4 0 13 is_stmt 0
	movq	%rax, -344(%rbp)
.Ltmp21863:
	movq	-152(%rbp), %rax
.Ltmp21864:
	.loc	4 2612 13 is_stmt 1
	leaq	(%rax,%rdi), %rbx
	addq	$-36, %rbx
.Ltmp21865:
	.loc	4 2649 13
	subq	-216(%rbp), %rbx
.Ltmp21866:
	.loc	4 2688 13
	movq	%rbx, %rax
	movq	-304(%rbp), %r10
.Ltmp21867:
	mulq	%r10
.Ltmp21868:
	movq	%rax, %rdi
	movq	%rdx, -312(%rbp)
	movq	-160(%rbp), %rcx
.Ltmp21869:
	.loc	4 2688 13 is_stmt 0
	leaq	(%rcx,%rcx,8), %rax
	leaq	(%rcx,%rax,2), %r12
.Ltmp21870:
	.loc	4 0 13
	movq	-104(%rbp), %r9
.Ltmp21871:
	.loc	4 2688 13
	movq	%r9, %rax
	mulq	%r14
	movq	%rdx, -256(%rbp)
	movq	%rax, -248(%rbp)
.Ltmp21872:
	.loc	4 0 13
	movq	-232(%rbp), %rax
	movq	-48(%rbp), %r8
.Ltmp21873:
	.loc	4 2688 13
	mulq	%r8
	movq	%rax, %r11
.Ltmp21874:
	movq	%rdx, %r14
	movq	-88(%rbp), %rcx
.Ltmp21875:
	.loc	4 2688 13
	leaq	(%rcx,%rcx,8), %rax
	leaq	(%rcx,%rax,2), %rcx
.Ltmp21876:
	.loc	4 0 13
	movq	%rcx, -80(%rbp)
.Ltmp21877:
	.loc	4 2688 13
	movq	%r15, %rax
	mulq	%rcx
	movq	%rdx, %rcx
.Ltmp21878:
	movq	%rax, %r15
.Ltmp21879:
	.loc	4 2688 13
	movq	%rsi, %rax
	mulq	%r12
.Ltmp21880:
	.loc	4 0 13
	movq	-192(%rbp), %r12
.Ltmp21881:
	.loc	4 2612 13 is_stmt 1
	movabsq	$4503599627370494, %rsi
	addq	%rsi, %r12
.Ltmp21882:
	.loc	4 2649 13
	subq	%r13, %r12
.Ltmp21883:
	.loc	4 0 13 is_stmt 0
	movq	%r12, -352(%rbp)
.Ltmp21884:
	.loc	4 2612 13 is_stmt 1
	addq	%rdi, %r15
	adcq	-312(%rbp), %rcx
.Ltmp21885:
	.loc	4 2612 13 is_stmt 0
	addq	%r11, %r15
	adcq	%r14, %rcx
.Ltmp21886:
	.loc	4 2612 13
	addq	%rax, %r15
	adcq	%rdx, %rcx
.Ltmp21887:
	.loc	4 2612 13
	addq	-248(%rbp), %r15
	movq	%r15, -808(%rbp)
	adcq	-256(%rbp), %rcx
.Ltmp21888:
	.loc	4 0 13
	movq	-160(%rbp), %r13
.Ltmp21889:
	.loc	4 2688 13 is_stmt 1
	movq	%r13, %rax
.Ltmp21890:
	mulq	%rbx
.Ltmp21891:
	movq	%rdx, %rsi
	movq	%rax, %rdi
.Ltmp21892:
	.loc	4 0 13 is_stmt 0
	movq	-168(%rbp), %r11
.Ltmp21893:
	.loc	4 2688 13
	movq	%r11, %rax
	mulq	%r10
.Ltmp21894:
	.loc	4 2612 13 is_stmt 1
	addq	%rdi, %rax
.Ltmp21895:
	.loc	4 0 13 is_stmt 0
	movq	%rax, -312(%rbp)
.Ltmp21896:
	.loc	4 2612 13
	adcq	%rsi, %rdx
.Ltmp21897:
	.loc	4 0 13
	movq	%rdx, -376(%rbp)
.Ltmp21898:
	.loc	4 2688 13 is_stmt 1
	movq	%r9, %rax
	mulq	%r8
	movq	%rdx, -256(%rbp)
.Ltmp21899:
	.loc	4 0 13 is_stmt 0
	movq	%rax, -248(%rbp)
.Ltmp21900:
	movq	-232(%rbp), %rax
	movq	-184(%rbp), %r15
.Ltmp21901:
	.loc	4 2688 13
	mulq	%r15
	movq	%rdx, %r14
.Ltmp21902:
	movq	%rax, %r8
.Ltmp21903:
	.loc	4 0 13
	movq	-224(%rbp), %r10
.Ltmp21904:
	.loc	4 2688 13
	movq	%r10, %rax
	mulq	-80(%rbp)
	movq	%rdx, -368(%rbp)
	movq	%rax, -360(%rbp)
.Ltmp21905:
	.loc	4 0 13
	movq	-88(%rbp), %r12
.Ltmp21906:
	.loc	4 2688 13
	movq	%r12, %rax
	mulq	%rbx
	movq	%rdx, %rsi
.Ltmp21907:
	movq	%rax, %rdi
.Ltmp21908:
	.loc	4 2688 13
	movq	%r11, %rax
	mulq	%r13
	movq	%rdx, %r9
	movq	%rax, %r13
.Ltmp21909:
	.loc	4 2612 13 is_stmt 1
	addq	%rdi, %r13
.Ltmp21910:
	adcq	%rsi, %r9
.Ltmp21911:
	.loc	4 0 13 is_stmt 0
	movq	-48(%rbp), %rsi
.Ltmp21912:
	.loc	4 2688 13 is_stmt 1
	movq	%rsi, %rax
.Ltmp21913:
	.loc	4 0 13 is_stmt 0
	movq	-304(%rbp), %rdi
.Ltmp21914:
	.loc	4 2688 13
	mulq	%rdi
.Ltmp21915:
	.loc	4 2612 13 is_stmt 1
	addq	%r13, %rax
.Ltmp21916:
	.loc	4 0 13 is_stmt 0
	movq	%rax, -400(%rbp)
	.loc	4 2612 13
	adcq	%r9, %rdx
.Ltmp21917:
	.loc	4 0 13
	movq	%rdx, -448(%rbp)
.Ltmp21918:
	movq	-104(%rbp), %r9
.Ltmp21919:
	.loc	4 2688 13 is_stmt 1
	movq	%r9, %rax
	movq	%r15, %r11
	mulq	%r15
	movq	%rdx, -408(%rbp)
	movq	%rax, -480(%rbp)
.Ltmp21920:
	.loc	4 2688 13 is_stmt 0
	movq	%r10, %rax
	mulq	-232(%rbp)
	movq	%rdx, %r13
.Ltmp21921:
	.loc	4 0 13
	movq	%rax, -80(%rbp)
.Ltmp21922:
	movq	-200(%rbp), %r10
.Ltmp21923:
	.loc	4 2688 13
	movq	%r10, %rax
	mulq	%rbx
	movq	%rdx, -424(%rbp)
	movq	%rax, -416(%rbp)
.Ltmp21924:
	.loc	4 2688 13
	movq	%r12, %rax
	movq	-168(%rbp), %r15
	mulq	%r15
	movq	%rdx, -856(%rbp)
	movq	%rax, -848(%rbp)
.Ltmp21925:
	.loc	4 2688 13
	movq	%rsi, %rax
	movq	-160(%rbp), %r12
	mulq	%r12
	movq	%rdx, %rsi
	movq	%rax, -232(%rbp)
.Ltmp21926:
	.loc	4 2688 13
	movq	%r11, %rax
	mulq	%rdi
	movq	%rdx, -840(%rbp)
	movq	%rax, -824(%rbp)
.Ltmp21927:
	.loc	4 2688 13
	movq	%r9, %rax
	movq	-224(%rbp), %r11
	mulq	%r11
	movq	%rdx, -832(%rbp)
	movq	%rax, -816(%rbp)
.Ltmp21928:
	.loc	4 0 13
	movq	-144(%rbp), %rax
.Ltmp21929:
	.loc	4 2688 13
	mulq	%rbx
	movq	%rdx, -104(%rbp)
.Ltmp21930:
	.loc	4 0 13
	movq	%rax, -144(%rbp)
.Ltmp21931:
	.loc	4 2688 13
	movq	%r10, %rax
	mulq	%r15
	movq	%rdx, -168(%rbp)
.Ltmp21932:
	.loc	4 0 13
	movq	%rax, -200(%rbp)
.Ltmp21933:
	movq	-48(%rbp), %rax
.Ltmp21934:
	.loc	4 2688 13
	mulq	-88(%rbp)
	movq	%rdx, %rbx
.Ltmp21935:
	.loc	4 0 13
	movq	%rax, -48(%rbp)
.Ltmp21936:
	movq	-184(%rbp), %rax
.Ltmp21937:
	.loc	4 2688 13
	mulq	%r12
	movq	%rdx, -88(%rbp)
.Ltmp21938:
	movq	%rax, %r9
.Ltmp21939:
	.loc	4 2688 13
	movq	%r11, %rax
.Ltmp21940:
	mulq	%rdi
.Ltmp21941:
	.loc	53 63 30 is_stmt 1
	movq	%rcx, %rdi
	movq	-808(%rbp), %r15
.Ltmp21942:
	shldq	$13, %r15, %rcx
.Ltmp21943:
	shrq	$51, %rdi
.Ltmp21944:
	.loc	4 2612 13
	addq	-312(%rbp), %r8
	adcq	-376(%rbp), %r14
.Ltmp21945:
	.loc	4 2612 13 is_stmt 0
	addq	-360(%rbp), %r8
	adcq	-368(%rbp), %r14
.Ltmp21946:
	.loc	4 2612 13
	addq	-248(%rbp), %r8
.Ltmp21947:
	adcq	-256(%rbp), %r14
.Ltmp21948:
	.loc	4 2612 13
	addq	%rcx, %r8
.Ltmp21949:
	adcq	%rdi, %r14
.Ltmp21950:
	.loc	53 64 30 is_stmt 1
	movq	%r14, %rcx
.Ltmp21951:
	shldq	$13, %r8, %r14
.Ltmp21952:
	shrq	$51, %rcx
.Ltmp21953:
	.loc	53 0 30 is_stmt 0
	movq	-80(%rbp), %rdi
.Ltmp21954:
	.loc	4 2612 13 is_stmt 1
	addq	-400(%rbp), %rdi
	adcq	-448(%rbp), %r13
.Ltmp21955:
	.loc	4 2612 13 is_stmt 0
	addq	-480(%rbp), %rdi
.Ltmp21956:
	adcq	-408(%rbp), %r13
.Ltmp21957:
	.loc	4 2612 13
	addq	%r14, %rdi
.Ltmp21958:
	adcq	%rcx, %r13
.Ltmp21959:
	.loc	53 65 30 is_stmt 1
	movq	%r13, %rcx
.Ltmp21960:
	shldq	$13, %rdi, %r13
.Ltmp21961:
	.loc	53 0 30 is_stmt 0
	movq	%rdi, %r10
.Ltmp21962:
	.loc	53 65 30
	shrq	$51, %rcx
.Ltmp21963:
	.loc	53 0 30
	movq	-232(%rbp), %rdi
.Ltmp21964:
	.loc	4 2612 13 is_stmt 1
	addq	-848(%rbp), %rdi
.Ltmp21965:
	adcq	-856(%rbp), %rsi
.Ltmp21966:
	.loc	4 2612 13 is_stmt 0
	addq	-416(%rbp), %rdi
.Ltmp21967:
	adcq	-424(%rbp), %rsi
.Ltmp21968:
	.loc	4 2612 13
	addq	-824(%rbp), %rdi
.Ltmp21969:
	adcq	-840(%rbp), %rsi
.Ltmp21970:
	.loc	4 2612 13
	addq	-816(%rbp), %rdi
.Ltmp21971:
	adcq	-832(%rbp), %rsi
.Ltmp21972:
	.loc	4 2612 13
	addq	%r13, %rdi
.Ltmp21973:
	adcq	%rcx, %rsi
.Ltmp21974:
	.loc	53 66 30 is_stmt 1
	movq	%rsi, %rcx
.Ltmp21975:
	shldq	$13, %rdi, %rsi
.Ltmp21976:
	.loc	53 0 30 is_stmt 0
	movq	%rdi, %r12
.Ltmp21977:
	.loc	53 66 30
	shrq	$51, %rcx
.Ltmp21978:
	.loc	53 0 30
	movq	-48(%rbp), %r14
.Ltmp21979:
	.loc	4 2612 13 is_stmt 1
	addq	-200(%rbp), %r14
	adcq	-168(%rbp), %rbx
	movq	-152(%rbp), %rdi
	movq	-216(%rbp), %r11
.Ltmp21980:
	.loc	4 2612 13 is_stmt 0
	addq	%r11, %rdi
.Ltmp21981:
	.loc	4 0 13
	movq	%rdi, -184(%rbp)
.Ltmp21982:
	.loc	4 2612 13
	addq	%r9, %r14
	adcq	-88(%rbp), %rbx
.Ltmp21983:
	.loc	4 2612 13
	addq	-144(%rbp), %r14
.Ltmp21984:
	adcq	-104(%rbp), %rbx
.Ltmp21985:
	.loc	4 2612 13
	addq	%rax, %r14
.Ltmp21986:
	adcq	%rdx, %rbx
.Ltmp21987:
	.loc	4 2612 13
	addq	%rsi, %r14
.Ltmp21988:
	adcq	%rcx, %rbx
.Ltmp21989:
	.loc	53 67 56 is_stmt 1
	movq	%rbx, %rax
.Ltmp21990:
	shldq	$13, %r14, %rax
.Ltmp21991:
	shrq	$51, %rbx
.Ltmp21992:
	.loc	4 2688 13
	leaq	(%rbx,%rbx,8), %rcx
.Ltmp21993:
	leaq	(%rbx,%rcx,2), %rcx
	movl	$19, %edx
.Ltmp21994:
	mulq	%rdx
.Ltmp21995:
	.loc	4 0 13 is_stmt 0
	movabsq	$2251799813685247, %rsi
.Ltmp21996:
	movq	%r15, %r9
.Ltmp21997:
	.loc	27 72 17 is_stmt 1
	andq	%rsi, %r9
.Ltmp21998:
	.loc	4 2612 13
	addq	%r9, %rax
.Ltmp21999:
	adcq	%rcx, %rdx
.Ltmp22000:
	.loc	53 68 46
	shldq	$13, %rax, %rdx
.Ltmp22001:
	.loc	53 68 14 is_stmt 0
	andq	%rsi, %r8
.Ltmp22002:
	.loc	4 2612 13 is_stmt 1
	addq	%r8, %rdx
.Ltmp22003:
	.loc	4 0 13 is_stmt 0
	movq	%rdx, -160(%rbp)
.Ltmp22004:
	.loc	53 70 9 is_stmt 1
	andq	%rsi, %rax
.Ltmp22005:
	.loc	53 0 9 is_stmt 0
	movq	%rax, -104(%rbp)
.Ltmp22006:
	.loc	53 72 9 is_stmt 1
	andq	%rsi, %r10
.Ltmp22007:
	.loc	53 0 9 is_stmt 0
	movq	%r10, -80(%rbp)
	.loc	53 73 9 is_stmt 1
	andq	%rsi, %r12
.Ltmp22008:
	.loc	53 0 9 is_stmt 0
	movq	%r12, -232(%rbp)
.Ltmp22009:
	movq	-64(%rbp), %rcx
.Ltmp22010:
	.loc	4 2688 13 is_stmt 1
	leaq	(%rcx,%rcx,8), %rax
	leaq	(%rcx,%rax,2), %rsi
.Ltmp22011:
	.loc	4 2688 13 is_stmt 0
	movq	%rdi, %rax
	mulq	-112(%rbp)
	movq	%rdx, -152(%rbp)
.Ltmp22012:
	movq	%rax, %rcx
.Ltmp22013:
	.loc	4 0 13
	movq	-136(%rbp), %r13
.Ltmp22014:
	.loc	4 2688 13
	movq	%r13, %rax
.Ltmp22015:
	.loc	4 0 13
	movq	-296(%rbp), %r11
	.loc	4 2688 13
	mulq	%r11
	movq	%rax, -168(%rbp)
.Ltmp22016:
	.loc	4 0 13
	movq	%rdx, -88(%rbp)
.Ltmp22017:
	movq	-56(%rbp), %rdx
.Ltmp22018:
	.loc	4 2688 13
	leaq	(%rdx,%rdx,8), %rax
	leaq	(%rdx,%rax,2), %r9
.Ltmp22019:
	.loc	4 0 13
	movq	%r9, -224(%rbp)
.Ltmp22020:
	movq	-208(%rbp), %r8
.Ltmp22021:
	.loc	4 2688 13
	movq	%r8, %rax
	movq	-128(%rbp), %rdi
.Ltmp22022:
	mulq	%rdi
	movq	%rdx, %r10
.Ltmp22023:
	movq	%rax, %rbx
.Ltmp22024:
	.loc	4 0 13
	movq	-392(%rbp), %rax
.Ltmp22025:
	.loc	4 2688 13
	mulq	%r9
.Ltmp22026:
	movq	%rdx, %r15
.Ltmp22027:
	movq	%rax, %r9
.Ltmp22028:
	.loc	4 0 13
	movq	-384(%rbp), %r12
.Ltmp22029:
	.loc	4 2688 13
	movq	%r12, %rax
	mulq	%rsi
.Ltmp22030:
	.loc	53 74 9 is_stmt 1
	movabsq	$2251799813685247, %rsi
.Ltmp22031:
	andq	%rsi, %r14
.Ltmp22032:
	.loc	53 0 9 is_stmt 0
	movq	%r14, -48(%rbp)
.Ltmp22033:
	.loc	4 2612 13 is_stmt 1
	addq	%rcx, %r9
	adcq	-152(%rbp), %r15
.Ltmp22034:
	.loc	4 2612 13 is_stmt 0
	addq	%rbx, %r9
	adcq	%r10, %r15
.Ltmp22035:
	.loc	4 2612 13
	addq	%rax, %r9
	adcq	%rdx, %r15
.Ltmp22036:
	.loc	4 2612 13
	addq	-168(%rbp), %r9
	movq	%r9, -168(%rbp)
.Ltmp22037:
	adcq	-88(%rbp), %r15
.Ltmp22038:
	.loc	4 0 13
	movq	-64(%rbp), %rcx
.Ltmp22039:
	.loc	4 2688 13 is_stmt 1
	movq	%rcx, %rax
.Ltmp22040:
	.loc	4 0 13 is_stmt 0
	movq	-184(%rbp), %rbx
.Ltmp22041:
	.loc	4 2688 13
	mulq	%rbx
.Ltmp22042:
	movq	%rdx, %r14
.Ltmp22043:
	movq	%rax, %rsi
.Ltmp22044:
	.loc	4 0 13
	movq	%r11, %r10
.Ltmp22045:
	.loc	4 2688 13
	movq	%r11, %rax
	mulq	-112(%rbp)
.Ltmp22046:
	.loc	4 2612 13 is_stmt 1
	addq	%rsi, %rax
	movq	%rax, -144(%rbp)
.Ltmp22047:
	adcq	%r14, %rdx
	movq	%rdx, -200(%rbp)
.Ltmp22048:
	.loc	4 2688 13
	movq	%r13, %rax
	mulq	%rdi
	movq	%rdx, -152(%rbp)
	movq	%rax, -216(%rbp)
.Ltmp22049:
	.loc	4 2688 13 is_stmt 0
	movq	%r8, %rax
	movq	-392(%rbp), %r9
	mulq	%r9
	movq	%rdx, %r14
.Ltmp22050:
	movq	%rax, %rsi
.Ltmp22051:
	.loc	4 0 13
	movq	%r12, %r11
.Ltmp22052:
	.loc	4 2688 13
	movq	%r12, %rax
	mulq	-224(%rbp)
	movq	%rdx, -304(%rbp)
.Ltmp22053:
	.loc	4 0 13
	movq	%rax, -256(%rbp)
.Ltmp22054:
	movq	-56(%rbp), %r13
.Ltmp22055:
	.loc	4 2688 13
	movq	%r13, %rax
	mulq	%rbx
	movq	%rdx, %r8
	movq	%rax, %rdi
.Ltmp22056:
	.loc	4 2688 13
	movq	%r10, %rax
	mulq	%rcx
.Ltmp22057:
	movq	%rdx, %rbx
	movq	%rax, %r12
.Ltmp22058:
	.loc	4 2612 13 is_stmt 1
	addq	%rdi, %r12
.Ltmp22059:
	adcq	%r8, %rbx
.Ltmp22060:
	.loc	4 0 13 is_stmt 0
	movq	-128(%rbp), %rcx
.Ltmp22061:
	.loc	4 2688 13 is_stmt 1
	movq	%rcx, %rax
.Ltmp22062:
	.loc	4 0 13 is_stmt 0
	movq	-112(%rbp), %rdi
.Ltmp22063:
	.loc	4 2688 13
	mulq	%rdi
.Ltmp22064:
	.loc	4 2612 13 is_stmt 1
	addq	%r12, %rax
.Ltmp22065:
	.loc	4 0 13 is_stmt 0
	movq	%rax, -376(%rbp)
.Ltmp22066:
	.loc	4 2612 13
	adcq	%rbx, %rdx
.Ltmp22067:
	.loc	4 0 13
	movq	%rdx, -368(%rbp)
.Ltmp22068:
	movq	-136(%rbp), %rax
	movq	%r9, %r10
.Ltmp22069:
	.loc	4 2688 13 is_stmt 1
	mulq	%r9
	movq	%rdx, -312(%rbp)
	movq	%rax, -360(%rbp)
.Ltmp22070:
	.loc	4 2688 13 is_stmt 0
	movq	%r11, %rax
	mulq	-208(%rbp)
	movq	%rdx, %r12
.Ltmp22071:
	.loc	4 0 13
	movq	%rax, -224(%rbp)
.Ltmp22072:
	movq	-72(%rbp), %rax
	movq	-184(%rbp), %rbx
.Ltmp22073:
	.loc	4 2688 13
	mulq	%rbx
	movq	%rdx, -208(%rbp)
.Ltmp22074:
	.loc	4 0 13
	movq	%rax, -248(%rbp)
.Ltmp22075:
	.loc	4 2688 13
	movq	%r13, %rax
	movq	-296(%rbp), %r8
.Ltmp22076:
	mulq	%r8
	movq	%rdx, -424(%rbp)
.Ltmp22077:
	.loc	4 0 13
	movq	%rax, -416(%rbp)
.Ltmp22078:
	.loc	4 2688 13
	movq	%rcx, %rax
	movq	-64(%rbp), %r9
	mulq	%r9
	movq	%rdx, %rcx
	movq	%rax, -88(%rbp)
.Ltmp22079:
	.loc	4 2688 13
	movq	%r10, %rax
	mulq	%rdi
	movq	%rdx, -408(%rbp)
.Ltmp22080:
	.loc	4 0 13
	movq	%rax, -400(%rbp)
.Ltmp22081:
	movq	-136(%rbp), %rax
.Ltmp22082:
	.loc	4 2688 13
	mulq	%r11
	movq	%r11, %r10
	movq	%rdx, -136(%rbp)
	movq	%rax, -448(%rbp)
.Ltmp22083:
	.loc	4 0 13
	movq	-96(%rbp), %rax
.Ltmp22084:
	.loc	4 2688 13
	mulq	%rbx
	movq	%rdx, -96(%rbp)
.Ltmp22085:
	.loc	4 0 13
	movq	%rax, -184(%rbp)
.Ltmp22086:
	movq	-72(%rbp), %rax
.Ltmp22087:
	.loc	4 2688 13
	mulq	%r8
	movq	%rdx, -72(%rbp)
.Ltmp22088:
	.loc	4 0 13
	movq	%rax, -296(%rbp)
.Ltmp22089:
	movq	-128(%rbp), %rax
.Ltmp22090:
	.loc	4 2688 13
	mulq	%r13
	movq	%rdx, %rbx
.Ltmp22091:
	movq	%rax, %r13
.Ltmp22092:
	.loc	4 0 13
	movq	-392(%rbp), %rax
.Ltmp22093:
	.loc	4 2688 13
	mulq	%r9
	movq	%rdx, -56(%rbp)
.Ltmp22094:
	movq	%rax, %r11
.Ltmp22095:
	.loc	4 2688 13
	movq	%r10, %rax
.Ltmp22096:
	mulq	%rdi
.Ltmp22097:
	.loc	53 63 30 is_stmt 1
	movq	%r15, %rdi
	movq	-168(%rbp), %r9
	shldq	$13, %r9, %r15
.Ltmp22098:
	shrq	$51, %rdi
.Ltmp22099:
	.loc	4 2612 13
	addq	-144(%rbp), %rsi
	adcq	-200(%rbp), %r14
.Ltmp22100:
	.loc	4 2612 13 is_stmt 0
	addq	-256(%rbp), %rsi
	adcq	-304(%rbp), %r14
.Ltmp22101:
	.loc	4 2612 13
	addq	-216(%rbp), %rsi
.Ltmp22102:
	adcq	-152(%rbp), %r14
.Ltmp22103:
	.loc	4 2612 13
	addq	%r15, %rsi
.Ltmp22104:
	adcq	%rdi, %r14
.Ltmp22105:
	.loc	53 64 30 is_stmt 1
	movq	%r14, %rdi
.Ltmp22106:
	shldq	$13, %rsi, %r14
.Ltmp22107:
	shrq	$51, %rdi
.Ltmp22108:
	.loc	53 0 30 is_stmt 0
	movq	-224(%rbp), %r8
.Ltmp22109:
	.loc	4 2612 13 is_stmt 1
	addq	-376(%rbp), %r8
	adcq	-368(%rbp), %r12
.Ltmp22110:
	.loc	4 2612 13 is_stmt 0
	addq	-360(%rbp), %r8
.Ltmp22111:
	adcq	-312(%rbp), %r12
.Ltmp22112:
	.loc	4 2612 13
	addq	%r14, %r8
.Ltmp22113:
	adcq	%rdi, %r12
.Ltmp22114:
	.loc	53 65 30 is_stmt 1
	movq	%r12, %rdi
.Ltmp22115:
	shldq	$13, %r8, %r12
.Ltmp22116:
	shrq	$51, %rdi
.Ltmp22117:
	.loc	53 0 30 is_stmt 0
	movq	-88(%rbp), %r10
.Ltmp22118:
	.loc	4 2612 13 is_stmt 1
	addq	-416(%rbp), %r10
	adcq	-424(%rbp), %rcx
.Ltmp22119:
	.loc	4 2612 13 is_stmt 0
	addq	-248(%rbp), %r10
.Ltmp22120:
	adcq	-208(%rbp), %rcx
.Ltmp22121:
	.loc	4 2612 13
	addq	-400(%rbp), %r10
.Ltmp22122:
	adcq	-408(%rbp), %rcx
.Ltmp22123:
	.loc	4 2612 13
	addq	-448(%rbp), %r10
.Ltmp22124:
	adcq	-136(%rbp), %rcx
.Ltmp22125:
	.loc	4 2612 13
	addq	%r12, %r10
.Ltmp22126:
	adcq	%rdi, %rcx
.Ltmp22127:
	.loc	53 66 30 is_stmt 1
	movq	%rcx, %rdi
.Ltmp22128:
	shldq	$13, %r10, %rcx
.Ltmp22129:
	shrq	$51, %rdi
.Ltmp22130:
	.loc	4 2612 13
	addq	-296(%rbp), %r13
	adcq	-72(%rbp), %rbx
.Ltmp22131:
	.loc	4 2612 13 is_stmt 0
	addq	%r11, %r13
	adcq	-56(%rbp), %rbx
.Ltmp22132:
	.loc	4 2612 13
	addq	-184(%rbp), %r13
.Ltmp22133:
	adcq	-96(%rbp), %rbx
.Ltmp22134:
	.loc	4 2612 13
	addq	%rax, %r13
.Ltmp22135:
	adcq	%rdx, %rbx
.Ltmp22136:
	.loc	4 2612 13
	addq	%rcx, %r13
.Ltmp22137:
	adcq	%rdi, %rbx
.Ltmp22138:
	.loc	53 67 56 is_stmt 1
	movq	%rbx, %rax
.Ltmp22139:
	shrq	$51, %rbx
.Ltmp22140:
	.loc	4 2688 13
	leaq	(%rbx,%rbx,8), %rcx
.Ltmp22141:
	leaq	(%rbx,%rcx,2), %rcx
	movabsq	$2251799813685247, %rdi
.Ltmp22142:
	.loc	27 72 17
	andq	%rdi, %r9
.Ltmp22143:
	.loc	53 67 56
	shldq	$13, %r13, %rax
.Ltmp22144:
	.loc	4 2688 13
	movl	$19, %edx
.Ltmp22145:
	mulq	%rdx
.Ltmp22146:
	.loc	4 2612 13
	addq	%r9, %rax
.Ltmp22147:
	.loc	4 0 13 is_stmt 0
	movq	%rdx, %r9
.Ltmp22148:
	.loc	4 2612 13
	adcq	%rcx, %r9
.Ltmp22149:
	.loc	53 68 14 is_stmt 1
	andq	%rdi, %rsi
.Ltmp22150:
	.loc	53 68 46 is_stmt 0
	shldq	$13, %rax, %r9
.Ltmp22151:
	.loc	4 2612 13 is_stmt 1
	addq	%rsi, %r9
.Ltmp22152:
	.loc	4 0 13 is_stmt 0
	movq	%r9, -72(%rbp)
.Ltmp22153:
	.loc	53 70 9 is_stmt 1
	andq	%rdi, %rax
.Ltmp22154:
	.loc	53 0 9 is_stmt 0
	movq	%rax, %rsi
.Ltmp22155:
	movq	%rax, -56(%rbp)
.Ltmp22156:
	movq	%r8, %rcx
	.loc	53 72 9 is_stmt 1
	andq	%rdi, %rcx
	movq	%rcx, -224(%rbp)
	.loc	53 73 9
	andq	%rdi, %r10
.Ltmp22157:
	.loc	53 0 9 is_stmt 0
	movq	%r10, -88(%rbp)
.Ltmp22158:
	.loc	53 74 9 is_stmt 1
	andq	%rdi, %r13
.Ltmp22159:
	.loc	53 0 9 is_stmt 0
	movq	%r13, %r11
.Ltmp22160:
	movq	%r13, -256(%rbp)
.Ltmp22161:
	movq	-232(%rbp), %rax
.Ltmp22162:
	.loc	4 2612 13 is_stmt 1
	leaq	(%r10,%rax), %r13
.Ltmp22163:
	.loc	4 2688 13
	leaq	(%r13,%r13,8), %rax
	leaq	(%r13,%rax,2), %r8
.Ltmp22164:
	.loc	4 0 13 is_stmt 0
	movq	-104(%rbp), %rax
.Ltmp22165:
	.loc	4 2612 13 is_stmt 1
	addq	%rsi, %rax
.Ltmp22166:
	.loc	4 0 13 is_stmt 0
	movq	%rax, -64(%rbp)
.Ltmp22167:
	.loc	4 2688 13 is_stmt 1
	mulq	%rax
.Ltmp22168:
	movq	%rax, %r14
.Ltmp22169:
	movq	%rdx, %r15
.Ltmp22170:
	.loc	4 0 13 is_stmt 0
	movq	-48(%rbp), %rax
.Ltmp22171:
	.loc	4 2612 13 is_stmt 1
	leaq	(%r11,%rax), %rdx
.Ltmp22172:
	.loc	4 0 13 is_stmt 0
	movq	%rdx, -112(%rbp)
.Ltmp22173:
	.loc	4 2688 13 is_stmt 1
	leaq	(%rdx,%rdx,8), %rax
	leaq	(%rdx,%rax,2), %r12
.Ltmp22174:
	.loc	4 0 13 is_stmt 0
	movq	-160(%rbp), %rax
.Ltmp22175:
	.loc	4 2612 13 is_stmt 1
	leaq	(%r9,%rax), %rdi
.Ltmp22176:
	.loc	4 2688 13
	leaq	(%rdi,%rdi), %rax
.Ltmp22177:
	.loc	4 0 13 is_stmt 0
	movq	%rax, -384(%rbp)
.Ltmp22178:
	.loc	4 2688 13
	mulq	%r12
.Ltmp22179:
	movq	%rax, %r10
	movq	%rdx, %r9
	movq	-80(%rbp), %rax
.Ltmp22180:
	.loc	4 2612 13 is_stmt 1
	leaq	(%rcx,%rax), %r11
.Ltmp22181:
	.loc	4 2688 13
	leaq	(%r11,%r11), %rbx
.Ltmp22182:
	.loc	4 2688 13 is_stmt 0
	movq	%r8, %rax
	mulq	%rbx
.Ltmp22183:
	movq	%rdx, %rcx
	movq	%rax, %rsi
.Ltmp22184:
	.loc	4 2612 13 is_stmt 1
	addq	%r14, %rsi
.Ltmp22185:
	adcq	%r15, %rcx
.Ltmp22186:
	.loc	4 2612 13 is_stmt 0
	addq	%r10, %rsi
	adcq	%r9, %rcx
.Ltmp22187:
	.loc	4 0 13
	movq	-64(%rbp), %rax
.Ltmp22188:
	.loc	4 2688 13 is_stmt 1
	leaq	(%rax,%rax), %r14
.Ltmp22189:
	.loc	4 2688 13 is_stmt 0
	movq	%r14, %rax
	mulq	%rdi
.Ltmp22190:
	.loc	4 0 13
	movq	%rdx, -64(%rbp)
	movq	%rax, -136(%rbp)
.Ltmp22191:
	.loc	4 2688 13
	movq	%r8, %rax
	mulq	%r13
	movq	%rdx, -208(%rbp)
.Ltmp22192:
	.loc	4 0 13
	movq	%rax, -304(%rbp)
.Ltmp22193:
	.loc	4 2688 13
	movq	%r12, %rax
	mulq	%rbx
	movq	%rdx, %r9
.Ltmp22194:
	movq	%rax, %r8
.Ltmp22195:
	.loc	4 2688 13
	movq	%r14, %rax
	mulq	%r11
	movq	%rdx, -96(%rbp)
.Ltmp22196:
	.loc	4 0 13
	movq	%rax, -392(%rbp)
.Ltmp22197:
	.loc	4 2688 13
	movq	%rdi, %rax
	mulq	%rdi
	movq	%rax, -296(%rbp)
.Ltmp22198:
	.loc	4 0 13
	movq	%rdx, -200(%rbp)
.Ltmp22199:
	.loc	4 2688 13
	leaq	(,%r13,2), %rdx
.Ltmp22200:
	.loc	4 2688 13
	movq	%r12, %rax
	mulq	%rdx
.Ltmp22201:
	movq	%rdx, %r10
.Ltmp22202:
	.loc	4 0 13
	movq	%rax, -184(%rbp)
.Ltmp22203:
	.loc	4 2688 13
	movq	%r14, %rax
	mulq	%r13
	movq	%rdx, -128(%rbp)
.Ltmp22204:
	.loc	4 0 13
	movq	%rax, -216(%rbp)
.Ltmp22205:
	movq	-384(%rbp), %rbx
.Ltmp22206:
	.loc	4 2688 13
	movq	%rbx, %rax
	mulq	%r11
	movq	%rdx, -152(%rbp)
.Ltmp22207:
	.loc	4 0 13
	movq	%rax, -144(%rbp)
.Ltmp22208:
	.loc	4 2688 13
	movq	%r12, %rax
	movq	-112(%rbp), %r15
.Ltmp22209:
	mulq	%r15
	movq	%rdx, %r12
.Ltmp22210:
	.loc	4 0 13
	movq	%rax, -168(%rbp)
.Ltmp22211:
	.loc	4 2688 13
	movq	%r14, %rax
	mulq	%r15
	movq	%rdx, %r14
.Ltmp22212:
	.loc	4 0 13
	movq	%rax, -112(%rbp)
.Ltmp22213:
	.loc	4 2688 13
	movq	%rbx, %rax
	mulq	%r13
	movq	%rdx, %rbx
	movq	%rax, %r15
.Ltmp22214:
	.loc	4 2688 13
	movq	%r11, %rax
	mulq	%r11
.Ltmp22215:
	.loc	53 63 30 is_stmt 1
	movq	%rcx, %rdi
.Ltmp22216:
	shldq	$13, %rsi, %rcx
.Ltmp22217:
	shrq	$51, %rdi
.Ltmp22218:
	.loc	4 2612 13
	addq	-304(%rbp), %r8
	adcq	-208(%rbp), %r9
.Ltmp22219:
	.loc	4 2612 13 is_stmt 0
	addq	-136(%rbp), %r8
.Ltmp22220:
	adcq	-64(%rbp), %r9
.Ltmp22221:
	.loc	4 2612 13
	addq	%rcx, %r8
.Ltmp22222:
	adcq	%rdi, %r9
.Ltmp22223:
	.loc	53 64 30 is_stmt 1
	movq	%r9, %rcx
.Ltmp22224:
	shldq	$13, %r8, %r9
.Ltmp22225:
	shrq	$51, %rcx
.Ltmp22226:
	.loc	53 0 30 is_stmt 0
	movq	-184(%rbp), %rdi
.Ltmp22227:
	.loc	4 2612 13 is_stmt 1
	addq	-296(%rbp), %rdi
	adcq	-200(%rbp), %r10
.Ltmp22228:
	.loc	4 2612 13 is_stmt 0
	addq	-392(%rbp), %rdi
.Ltmp22229:
	adcq	-96(%rbp), %r10
.Ltmp22230:
	.loc	4 2612 13
	addq	%r9, %rdi
.Ltmp22231:
	adcq	%rcx, %r10
.Ltmp22232:
	.loc	53 65 30 is_stmt 1
	movq	%r10, %rcx
.Ltmp22233:
	shldq	$13, %rdi, %r10
.Ltmp22234:
	.loc	53 0 30 is_stmt 0
	movq	%rdi, %r9
.Ltmp22235:
	.loc	53 65 30
	shrq	$51, %rcx
.Ltmp22236:
	.loc	53 0 30
	movq	-168(%rbp), %rdi
.Ltmp22237:
	.loc	4 2612 13 is_stmt 1
	addq	-216(%rbp), %rdi
.Ltmp22238:
	adcq	-128(%rbp), %r12
.Ltmp22239:
	.loc	4 2612 13 is_stmt 0
	addq	-144(%rbp), %rdi
.Ltmp22240:
	adcq	-152(%rbp), %r12
.Ltmp22241:
	.loc	4 2612 13
	addq	%r10, %rdi
.Ltmp22242:
	adcq	%rcx, %r12
.Ltmp22243:
	.loc	53 66 30 is_stmt 1
	movq	%r12, %rcx
.Ltmp22244:
	shrq	$51, %rcx
.Ltmp22245:
	shldq	$13, %rdi, %r12
.Ltmp22246:
	.loc	4 2688 13
	movq	%rax, %r10
.Ltmp22247:
	.loc	4 2612 13
	addq	-112(%rbp), %r10
	adcq	%r14, %rdx
.Ltmp22248:
	.loc	4 2612 13 is_stmt 0
	addq	%r15, %r10
.Ltmp22249:
	adcq	%rbx, %rdx
.Ltmp22250:
	.loc	4 2612 13
	addq	%r12, %r10
.Ltmp22251:
	adcq	%rcx, %rdx
.Ltmp22252:
	.loc	53 67 56 is_stmt 1
	movq	%rdx, %rax
.Ltmp22253:
	shldq	$13, %r10, %rax
.Ltmp22254:
	shrq	$51, %rdx
.Ltmp22255:
	.loc	4 2688 13
	leaq	(%rdx,%rdx,8), %rcx
.Ltmp22256:
	leaq	(%rdx,%rcx,2), %rcx
	movl	$19, %edx
.Ltmp22257:
	mulq	%rdx
.Ltmp22258:
	.loc	4 0 13 is_stmt 0
	movabsq	$2251799813685247, %r14
.Ltmp22259:
	.loc	27 72 17 is_stmt 1
	andq	%r14, %rsi
.Ltmp22260:
	.loc	4 2612 13
	addq	%rsi, %rax
.Ltmp22261:
	adcq	%rcx, %rdx
.Ltmp22262:
	.loc	53 68 46
	shldq	$13, %rax, %rdx
.Ltmp22263:
	.loc	53 68 14 is_stmt 0
	andq	%r14, %r8
.Ltmp22264:
	.loc	4 2612 13 is_stmt 1
	addq	%r8, %rdx
.Ltmp22265:
	.loc	4 0 13 is_stmt 0
	movq	%rdx, -392(%rbp)
.Ltmp22266:
	movabsq	$4503599627370494, %rdx
	movq	-104(%rbp), %rcx
.Ltmp22267:
	.loc	4 2612 13
	addq	%rdx, %rcx
	addq	$-36, %rcx
.Ltmp22268:
	.loc	4 2649 13 is_stmt 1
	subq	-56(%rbp), %rcx
.Ltmp22269:
	.loc	4 0 13 is_stmt 0
	movq	-160(%rbp), %r15
.Ltmp22270:
	.loc	4 2612 13 is_stmt 1
	addq	%rdx, %r15
.Ltmp22271:
	.loc	4 2649 13
	subq	-72(%rbp), %r15
.Ltmp22272:
	.loc	4 0 13 is_stmt 0
	movq	-80(%rbp), %rbx
.Ltmp22273:
	.loc	4 2612 13 is_stmt 1
	addq	%rdx, %rbx
.Ltmp22274:
	.loc	4 2649 13
	subq	-224(%rbp), %rbx
.Ltmp22275:
	.loc	4 0 13 is_stmt 0
	movq	-232(%rbp), %rsi
.Ltmp22276:
	.loc	4 2612 13 is_stmt 1
	addq	%rdx, %rsi
.Ltmp22277:
	.loc	4 2649 13
	subq	-88(%rbp), %rsi
.Ltmp22278:
	.loc	4 0 13 is_stmt 0
	movq	-48(%rbp), %r8
.Ltmp22279:
	.loc	4 2612 13 is_stmt 1
	addq	%rdx, %r8
.Ltmp22280:
	.loc	4 2649 13
	subq	-256(%rbp), %r8
.Ltmp22281:
	.loc	53 70 9
	andq	%r14, %rax
.Ltmp22282:
	.loc	53 0 9 is_stmt 0
	movq	%rax, -224(%rbp)
.Ltmp22283:
	.loc	53 72 9 is_stmt 1
	andq	%r14, %r9
.Ltmp22284:
	.loc	53 0 9 is_stmt 0
	movq	%r9, -184(%rbp)
.Ltmp22285:
	.loc	53 73 9 is_stmt 1
	andq	%r14, %rdi
.Ltmp22286:
	.loc	53 0 9 is_stmt 0
	movq	%rdi, -168(%rbp)
.Ltmp22287:
	.loc	53 74 9 is_stmt 1
	andq	%r14, %r10
.Ltmp22288:
	.loc	53 0 9 is_stmt 0
	movq	%r10, -232(%rbp)
.Ltmp22289:
	.loc	4 2688 13 is_stmt 1
	movq	%rcx, %rax
	mulq	%rcx
	movq	%rax, %r12
.Ltmp22290:
	movq	%rdx, %r11
.Ltmp22291:
	.loc	4 0 13 is_stmt 0
	movq	%r8, -48(%rbp)
.Ltmp22292:
	.loc	4 2688 13
	leaq	(%r8,%r8,8), %rax
	leaq	(%r8,%rax,2), %r8
.Ltmp22293:
	.loc	4 2688 13
	leaq	(%r15,%r15), %r13
.Ltmp22294:
	.loc	4 2688 13
	movq	%r13, %rax
	mulq	%r8
.Ltmp22295:
	movq	%rax, %r9
	movq	%rdx, %r10
	movq	%rsi, %rdi
.Ltmp22296:
	.loc	4 2688 13
	leaq	(%rsi,%rsi,8), %rax
	leaq	(%rsi,%rax,2), %r14
.Ltmp22297:
	.loc	4 2688 13
	leaq	(%rbx,%rbx), %rdx
.Ltmp22298:
	.loc	4 2688 13
	movq	%r14, %rax
	mulq	%rdx
.Ltmp22299:
	movq	%rax, %rsi
.Ltmp22300:
	.loc	4 2612 13 is_stmt 1
	addq	%r12, %rsi
.Ltmp22301:
	adcq	%rdx, %r11
.Ltmp22302:
	.loc	4 2612 13 is_stmt 0
	addq	%r9, %rsi
	adcq	%r10, %r11
.Ltmp22303:
	.loc	4 2688 13 is_stmt 1
	leaq	(%rcx,%rcx), %r12
.Ltmp22304:
	.loc	4 2688 13 is_stmt 0
	movq	%r12, %rax
.Ltmp22305:
	mulq	%r15
.Ltmp22306:
	.loc	4 0 13
	movq	%rdx, -64(%rbp)
.Ltmp22307:
	movq	%rax, -80(%rbp)
.Ltmp22308:
	.loc	4 2688 13
	movq	%r14, %rax
	mulq	%rdi
	movq	%rdx, -160(%rbp)
.Ltmp22309:
	.loc	4 0 13
	movq	%rax, -208(%rbp)
.Ltmp22310:
	.loc	4 2688 13
	movq	%r8, %rax
	leaq	(%rbx,%rbx), %rcx
.Ltmp22311:
	mulq	%rcx
	movq	%rdx, %r9
.Ltmp22312:
	movq	%rax, %r10
.Ltmp22313:
	.loc	4 2688 13
	movq	%r12, %rax
	mulq	%rbx
	movq	%rdx, -96(%rbp)
.Ltmp22314:
	.loc	4 0 13
	movq	%rax, -88(%rbp)
.Ltmp22315:
	.loc	4 2688 13
	movq	%r15, %rax
	mulq	%r15
	movq	%rax, -144(%rbp)
.Ltmp22316:
	.loc	4 0 13
	movq	%rdx, -152(%rbp)
.Ltmp22317:
	.loc	4 2688 13
	leaq	(%rdi,%rdi), %rcx
.Ltmp22318:
	.loc	4 2688 13
	movq	%r8, %rax
	mulq	%rcx
	movq	%rdx, %r14
.Ltmp22319:
	.loc	4 0 13
	movq	%rax, -72(%rbp)
.Ltmp22320:
	.loc	4 2688 13
	movq	%r12, %rax
	mulq	%rdi
	movq	%rdx, -112(%rbp)
.Ltmp22321:
	.loc	4 0 13
	movq	%rax, -104(%rbp)
.Ltmp22322:
	.loc	4 2688 13
	movq	%r13, %rax
	mulq	%rbx
	movq	%rdx, -136(%rbp)
.Ltmp22323:
	.loc	4 0 13
	movq	%rax, -216(%rbp)
.Ltmp22324:
	.loc	4 2688 13
	movq	%r8, %rax
	movq	-48(%rbp), %rcx
.Ltmp22325:
	mulq	%rcx
	movq	%rdx, %r15
.Ltmp22326:
	.loc	4 0 13
	movq	%rax, -56(%rbp)
.Ltmp22327:
	.loc	4 2688 13
	movq	%r12, %rax
	mulq	%rcx
	movq	%rdx, -48(%rbp)
.Ltmp22328:
	.loc	4 0 13
	movq	%rax, -128(%rbp)
.Ltmp22329:
	.loc	4 2688 13
	movq	%r13, %rax
	mulq	%rdi
	movq	%rdx, %r13
.Ltmp22330:
	movq	%rax, %rdi
.Ltmp22331:
	.loc	4 2688 13
	movq	%rbx, %rax
	mulq	%rbx
	movq	%rax, %rcx
.Ltmp22332:
	.loc	53 63 30 is_stmt 1
	movq	%r11, %rax
	shldq	$13, %rsi, %r11
.Ltmp22333:
	shrq	$51, %rax
.Ltmp22334:
	.loc	4 2612 13
	addq	-208(%rbp), %r10
	adcq	-160(%rbp), %r9
.Ltmp22335:
	.loc	4 2612 13 is_stmt 0
	addq	-80(%rbp), %r10
.Ltmp22336:
	adcq	-64(%rbp), %r9
.Ltmp22337:
	.loc	4 2612 13
	addq	%r11, %r10
.Ltmp22338:
	adcq	%rax, %r9
.Ltmp22339:
	.loc	53 64 30 is_stmt 1
	movq	%r9, %rax
.Ltmp22340:
	shldq	$13, %r10, %r9
.Ltmp22341:
	shrq	$51, %rax
.Ltmp22342:
	.loc	53 0 30 is_stmt 0
	movq	-72(%rbp), %r8
.Ltmp22343:
	.loc	4 2612 13 is_stmt 1
	addq	-144(%rbp), %r8
	adcq	-152(%rbp), %r14
.Ltmp22344:
	.loc	4 2612 13 is_stmt 0
	addq	-88(%rbp), %r8
.Ltmp22345:
	adcq	-96(%rbp), %r14
.Ltmp22346:
	.loc	4 2612 13
	addq	%r9, %r8
.Ltmp22347:
	adcq	%rax, %r14
.Ltmp22348:
	.loc	53 65 30 is_stmt 1
	movq	%r14, %rax
.Ltmp22349:
	shldq	$13, %r8, %r14
.Ltmp22350:
	.loc	53 0 30 is_stmt 0
	movq	%r8, %r12
.Ltmp22351:
	.loc	53 65 30
	shrq	$51, %rax
.Ltmp22352:
	.loc	53 0 30
	movq	-56(%rbp), %r8
.Ltmp22353:
	.loc	4 2612 13 is_stmt 1
	addq	-104(%rbp), %r8
	adcq	-112(%rbp), %r15
.Ltmp22354:
	.loc	4 2612 13 is_stmt 0
	addq	-216(%rbp), %r8
.Ltmp22355:
	adcq	-136(%rbp), %r15
.Ltmp22356:
	.loc	4 2612 13
	addq	%r14, %r8
.Ltmp22357:
	adcq	%rax, %r15
.Ltmp22358:
	.loc	53 66 30 is_stmt 1
	movq	%r15, %rax
.Ltmp22359:
	shrq	$51, %rax
.Ltmp22360:
	shldq	$13, %r8, %r15
.Ltmp22361:
	.loc	4 2612 13
	addq	-128(%rbp), %rcx
	adcq	-48(%rbp), %rdx
.Ltmp22362:
	.loc	4 2612 13 is_stmt 0
	addq	%rdi, %rcx
.Ltmp22363:
	adcq	%r13, %rdx
.Ltmp22364:
	.loc	4 2612 13
	addq	%r15, %rcx
.Ltmp22365:
	adcq	%rax, %rdx
.Ltmp22366:
	.loc	53 67 56 is_stmt 1
	movq	%rdx, %rax
.Ltmp22367:
	shrq	$51, %rdx
.Ltmp22368:
	.loc	4 2688 13
	leaq	(%rdx,%rdx,8), %r9
.Ltmp22369:
	leaq	(%rdx,%r9,2), %r11
.Ltmp22370:
	.loc	4 0 13 is_stmt 0
	movabsq	$2251799813685247, %rdi
.Ltmp22371:
	.loc	27 72 17 is_stmt 1
	andq	%rdi, %rsi
.Ltmp22372:
	.loc	53 67 56
	shldq	$13, %rcx, %rax
.Ltmp22373:
	.loc	4 2688 13
	movl	$19, %edx
.Ltmp22374:
	mulq	%rdx
.Ltmp22375:
	.loc	4 2612 13
	addq	%rsi, %rax
.Ltmp22376:
	adcq	%rdx, %r11
.Ltmp22377:
	.loc	4 0 13 is_stmt 0
	movq	%rdi, %rdx
.Ltmp22378:
	.loc	53 68 14 is_stmt 1
	andq	%rdi, %r10
.Ltmp22379:
	.loc	53 68 46 is_stmt 0
	shldq	$13, %rax, %r11
.Ltmp22380:
	.loc	4 2612 13 is_stmt 1
	addq	%r10, %r11
.Ltmp22381:
	.loc	53 72 9
	andq	%rdi, %r12
.Ltmp22382:
	.loc	53 0 9 is_stmt 0
	movq	%r12, -72(%rbp)
.Ltmp22383:
	.loc	53 73 9 is_stmt 1
	andq	%rdi, %r8
.Ltmp22384:
	.loc	53 74 9
	andq	%rdi, %rcx
.Ltmp22385:
	.loc	4 2688 13
	leaq	(%r11,%r11,8), %rsi
.Ltmp22386:
	leaq	(%r11,%rsi,2), %r10
.Ltmp22387:
	.loc	4 2688 13 is_stmt 0
	leaq	(%r12,%r12,8), %rsi
	leaq	(%r12,%rsi,2), %rdi
.Ltmp22388:
	.loc	4 0 13
	movq	%rdi, -112(%rbp)
.Ltmp22389:
	movq	%rcx, -88(%rbp)
.Ltmp22390:
	.loc	4 2688 13
	leaq	(%rcx,%rcx,8), %rsi
	leaq	(%rcx,%rsi,2), %rcx
.Ltmp22391:
	.loc	4 0 13
	movq	%rcx, -64(%rbp)
.Ltmp22392:
	.loc	27 72 17 is_stmt 1
	andq	%rdx, %rax
.Ltmp22393:
	.loc	27 0 17 is_stmt 0
	movq	%rax, %rbx
.Ltmp22394:
	movq	%rax, -96(%rbp)
.Ltmp22395:
	.loc	4 2688 13 is_stmt 1
	mulq	-472(%rbp)
	movq	%rdx, -48(%rbp)
.Ltmp22396:
	.loc	4 0 13 is_stmt 0
	movq	%rax, -80(%rbp)
.Ltmp22397:
	.loc	4 2688 13
	movq	%rcx, %rax
	mulq	-456(%rbp)
	movq	%rax, %r15
.Ltmp22398:
	movq	%rdx, %r9
	movq	%r8, -56(%rbp)
.Ltmp22399:
	.loc	4 2688 13
	leaq	(%r8,%r8,8), %rax
	leaq	(%r8,%rax,2), %r12
.Ltmp22400:
	.loc	4 2688 13
	movq	%r12, %rax
	movq	%r12, -248(%rbp)
.Ltmp22401:
	mulq	-464(%rbp)
	movq	%rdx, %r13
.Ltmp22402:
	movq	%rax, %rsi
.Ltmp22403:
	.loc	4 2688 13
	movq	%rdi, %rax
	mulq	-624(%rbp)
	movq	%rdx, %r14
.Ltmp22404:
	movq	%rax, %rcx
.Ltmp22405:
	.loc	4 2688 13
	movq	%r10, %rax
	movq	-616(%rbp), %r10
.Ltmp22406:
	mulq	%r10
.Ltmp22407:
	.loc	4 2612 13 is_stmt 1
	addq	%rsi, %rcx
	adcq	%r13, %r14
.Ltmp22408:
	.loc	4 2612 13 is_stmt 0
	addq	%r15, %rcx
	adcq	%r9, %r14
.Ltmp22409:
	.loc	4 2612 13
	addq	-80(%rbp), %rcx
.Ltmp22410:
	adcq	-48(%rbp), %r14
.Ltmp22411:
	.loc	4 2612 13
	addq	%rax, %rcx
.Ltmp22412:
	.loc	4 0 13
	movq	%rcx, -136(%rbp)
.Ltmp22413:
	.loc	4 2612 13
	adcq	%rdx, %r14
.Ltmp22414:
	.loc	4 2688 13 is_stmt 1
	movq	%r11, %rax
.Ltmp22415:
	.loc	4 0 13 is_stmt 0
	movq	-472(%rbp), %rdi
	.loc	4 2688 13
	mulq	%rdi
.Ltmp22416:
	.loc	4 0 13
	movq	%rdx, -48(%rbp)
	movq	%rax, -80(%rbp)
.Ltmp22417:
	.loc	4 2688 13
	movq	%rbx, %rax
	movq	-456(%rbp), %r8
	mulq	%r8
	movq	%rdx, -160(%rbp)
.Ltmp22418:
	.loc	4 0 13
	movq	%rax, -152(%rbp)
.Ltmp22419:
	movq	-64(%rbp), %rcx
.Ltmp22420:
	.loc	4 2688 13
	movq	%rcx, %rax
	movq	-464(%rbp), %r9
	mulq	%r9
	movq	%rdx, -128(%rbp)
.Ltmp22421:
	.loc	4 0 13
	movq	%rax, -208(%rbp)
.Ltmp22422:
	.loc	4 2688 13
	movq	%r12, %rax
	movq	-624(%rbp), %r13
	mulq	%r13
	movq	%rdx, -384(%rbp)
.Ltmp22423:
	.loc	4 0 13
	movq	%rax, -312(%rbp)
.Ltmp22424:
	movq	-112(%rbp), %rax
.Ltmp22425:
	.loc	4 2688 13
	mulq	%r10
	movq	%r10, %r12
.Ltmp22426:
	movq	%rdx, %r15
	movq	%rax, %r10
.Ltmp22427:
	.loc	4 0 13
	movq	-72(%rbp), %rsi
.Ltmp22428:
	.loc	4 2688 13
	movq	%rsi, %rax
	mulq	%rdi
	movq	%rdi, %rbx
	movq	%rdx, -216(%rbp)
.Ltmp22429:
	.loc	4 0 13
	movq	%rax, -144(%rbp)
.Ltmp22430:
	.loc	4 2688 13
	movq	%r11, %rax
	mulq	%r8
	movq	%rdx, -112(%rbp)
.Ltmp22431:
	.loc	4 0 13
	movq	%rax, -104(%rbp)
.Ltmp22432:
	movq	-96(%rbp), %r8
.Ltmp22433:
	.loc	4 2688 13
	movq	%r8, %rax
	mulq	%r9
	movq	%rdx, -200(%rbp)
.Ltmp22434:
	.loc	4 0 13
	movq	%rax, -296(%rbp)
.Ltmp22435:
	.loc	4 2688 13
	movq	%rcx, %rax
	mulq	%r13
	movq	%r13, %r9
	movq	%rdx, -304(%rbp)
.Ltmp22436:
	.loc	4 0 13
	movq	%rax, -256(%rbp)
.Ltmp22437:
	movq	-248(%rbp), %rax
.Ltmp22438:
	.loc	4 2688 13
	mulq	%r12
	movq	%rdx, %r12
	movq	%rax, %rdi
.Ltmp22439:
	.loc	4 0 13
	movq	-56(%rbp), %rax
.Ltmp22440:
	.loc	4 2688 13
	mulq	%rbx
	movq	%rdx, %rcx
	movq	%rax, %r13
.Ltmp22441:
	.loc	4 2688 13
	movq	%rsi, %rax
	movq	-456(%rbp), %rsi
	mulq	%rsi
.Ltmp22442:
	.loc	4 2612 13 is_stmt 1
	addq	%r13, %rax
.Ltmp22443:
	.loc	4 0 13 is_stmt 0
	movq	%rax, -368(%rbp)
.Ltmp22444:
	.loc	4 2612 13
	adcq	%rcx, %rdx
.Ltmp22445:
	.loc	4 0 13
	movq	%rdx, -360(%rbp)
.Ltmp22446:
	.loc	4 2688 13 is_stmt 1
	movq	%r11, %rax
	movq	-464(%rbp), %rcx
.Ltmp22447:
	mulq	%rcx
	movq	%rdx, -248(%rbp)
	movq	%rax, -376(%rbp)
.Ltmp22448:
	.loc	4 2688 13 is_stmt 0
	movq	%r8, %rax
	mulq	%r9
	movq	%rdx, %r13
.Ltmp22449:
	movq	%rax, %r8
.Ltmp22450:
	.loc	4 0 13
	movq	-64(%rbp), %rax
	movq	-616(%rbp), %rbx
.Ltmp22451:
	.loc	4 2688 13
	mulq	%rbx
	movq	%rdx, -408(%rbp)
.Ltmp22452:
	.loc	4 0 13
	movq	%rax, -400(%rbp)
.Ltmp22453:
	movq	-88(%rbp), %rax
.Ltmp22454:
	.loc	4 2688 13
	mulq	-472(%rbp)
	movq	%rdx, -64(%rbp)
.Ltmp22455:
	.loc	4 0 13
	movq	%rax, -88(%rbp)
.Ltmp22456:
	movq	-56(%rbp), %rax
.Ltmp22457:
	.loc	4 2688 13
	mulq	%rsi
	movq	%rdx, -424(%rbp)
.Ltmp22458:
	.loc	4 0 13
	movq	%rax, -416(%rbp)
.Ltmp22459:
	movq	-72(%rbp), %rax
.Ltmp22460:
	.loc	4 2688 13
	mulq	%rcx
	movq	%rdx, %rcx
	movq	%rax, %rsi
.Ltmp22461:
	.loc	4 2688 13
	movq	%r11, %rax
	mulq	%r9
	movq	%rdx, -56(%rbp)
.Ltmp22462:
	.loc	4 0 13
	movq	%rax, -72(%rbp)
.Ltmp22463:
	movq	-96(%rbp), %rax
.Ltmp22464:
	.loc	4 2688 13
	mulq	%rbx
.Ltmp22465:
	.loc	53 63 30 is_stmt 1
	movq	%r14, %rbx
	movq	-136(%rbp), %r11
.Ltmp22466:
	shldq	$13, %r11, %r14
.Ltmp22467:
	shrq	$51, %rbx
.Ltmp22468:
	.loc	4 2612 13
	addq	-312(%rbp), %r10
	adcq	-384(%rbp), %r15
.Ltmp22469:
	.loc	4 2612 13 is_stmt 0
	addq	-152(%rbp), %r10
	adcq	-160(%rbp), %r15
.Ltmp22470:
	.loc	4 2612 13
	addq	-208(%rbp), %r10
	adcq	-128(%rbp), %r15
.Ltmp22471:
	.loc	4 2612 13
	addq	-80(%rbp), %r10
.Ltmp22472:
	adcq	-48(%rbp), %r15
.Ltmp22473:
	.loc	4 2612 13
	addq	%r14, %r10
.Ltmp22474:
	adcq	%rbx, %r15
.Ltmp22475:
	.loc	53 64 30 is_stmt 1
	movq	%r15, %rbx
.Ltmp22476:
	shldq	$13, %r10, %r15
.Ltmp22477:
	shrq	$51, %rbx
.Ltmp22478:
	.loc	4 2612 13
	addq	-144(%rbp), %rdi
	adcq	-216(%rbp), %r12
.Ltmp22479:
	.loc	4 2612 13 is_stmt 0
	addq	-296(%rbp), %rdi
	adcq	-200(%rbp), %r12
.Ltmp22480:
	.loc	4 2612 13
	addq	-256(%rbp), %rdi
	adcq	-304(%rbp), %r12
.Ltmp22481:
	.loc	4 2612 13
	addq	-104(%rbp), %rdi
.Ltmp22482:
	adcq	-112(%rbp), %r12
.Ltmp22483:
	.loc	4 2612 13
	addq	%r15, %rdi
.Ltmp22484:
	adcq	%rbx, %r12
.Ltmp22485:
	.loc	53 65 30 is_stmt 1
	movq	%r12, %rbx
.Ltmp22486:
	shldq	$13, %rdi, %r12
.Ltmp22487:
	shrq	$51, %rbx
.Ltmp22488:
	.loc	4 2612 13
	addq	-368(%rbp), %r8
	adcq	-360(%rbp), %r13
.Ltmp22489:
	.loc	4 2612 13 is_stmt 0
	addq	-400(%rbp), %r8
	adcq	-408(%rbp), %r13
.Ltmp22490:
	.loc	4 2612 13
	addq	-376(%rbp), %r8
.Ltmp22491:
	adcq	-248(%rbp), %r13
.Ltmp22492:
	.loc	4 2612 13
	addq	%r12, %r8
.Ltmp22493:
	adcq	%rbx, %r13
.Ltmp22494:
	.loc	53 66 30 is_stmt 1
	movq	%r13, %r9
	shldq	$13, %r8, %r13
.Ltmp22495:
	shrq	$51, %r9
.Ltmp22496:
	.loc	4 2612 13
	addq	-416(%rbp), %rsi
	adcq	-424(%rbp), %rcx
.Ltmp22497:
	.loc	4 2612 13 is_stmt 0
	addq	-88(%rbp), %rsi
	adcq	-64(%rbp), %rcx
.Ltmp22498:
	.loc	4 2612 13
	addq	%rax, %rsi
	adcq	%rdx, %rcx
.Ltmp22499:
	.loc	4 2612 13
	addq	-72(%rbp), %rsi
.Ltmp22500:
	adcq	-56(%rbp), %rcx
.Ltmp22501:
	.loc	4 2612 13
	addq	%r13, %rsi
.Ltmp22502:
	adcq	%r9, %rcx
.Ltmp22503:
	.loc	53 67 56 is_stmt 1
	movq	%rcx, %rax
.Ltmp22504:
	shldq	$13, %rsi, %rax
.Ltmp22505:
	shrq	$51, %rcx
.Ltmp22506:
	.loc	4 2688 13
	leaq	(%rcx,%rcx,8), %rdx
.Ltmp22507:
	leaq	(%rcx,%rdx,2), %rcx
.Ltmp22508:
	movl	$19, %edx
	mulq	%rdx
.Ltmp22509:
	.loc	4 0 13 is_stmt 0
	movabsq	$2251799813685247, %r9
.Ltmp22510:
	.loc	27 72 17 is_stmt 1
	andq	%r9, %r11
.Ltmp22511:
	.loc	4 2612 13
	addq	%r11, %rax
.Ltmp22512:
	adcq	%rcx, %rdx
.Ltmp22513:
	.loc	53 68 46
	shldq	$13, %rax, %rdx
.Ltmp22514:
	.loc	53 68 14 is_stmt 0
	andq	%r9, %r10
.Ltmp22515:
	.loc	4 2612 13 is_stmt 1
	addq	%r10, %rdx
.Ltmp22516:
	.loc	4 0 13 is_stmt 0
	movq	%rdx, -160(%rbp)
.Ltmp22517:
	.loc	53 70 9 is_stmt 1
	andq	%r9, %rax
.Ltmp22518:
	.loc	53 0 9 is_stmt 0
	movq	%rax, -136(%rbp)
.Ltmp22519:
	.loc	53 72 9 is_stmt 1
	andq	%r9, %rdi
.Ltmp22520:
	.loc	53 0 9 is_stmt 0
	movq	%rdi, -80(%rbp)
.Ltmp22521:
	.loc	53 73 9 is_stmt 1
	andq	%r9, %r8
.Ltmp22522:
	.loc	53 0 9 is_stmt 0
	movq	%r8, -88(%rbp)
	movq	-120(%rbp), %rcx
.Ltmp22523:
	.loc	4 2688 13 is_stmt 1
	leaq	(%rcx,%rcx,8), %rax
	leaq	(%rcx,%rax,2), %r12
.Ltmp22524:
	.loc	4 0 13 is_stmt 0
	movq	-264(%rbp), %rcx
.Ltmp22525:
	.loc	4 2688 13
	leaq	(%rcx,%rcx,8), %rax
	leaq	(%rcx,%rax,2), %r14
.Ltmp22526:
	.loc	4 0 13
	movq	%r14, -104(%rbp)
.Ltmp22527:
	movq	-432(%rbp), %rcx
.Ltmp22528:
	.loc	4 2688 13
	leaq	(%rcx,%rcx,8), %rax
	leaq	(%rcx,%rax,2), %rcx
.Ltmp22529:
	.loc	4 0 13
	movq	%rcx, -72(%rbp)
.Ltmp22530:
	movq	-280(%rbp), %r9
.Ltmp22531:
	.loc	4 2688 13
	movq	%r9, %rax
	movq	-440(%rbp), %r11
.Ltmp22532:
	mulq	%r11
	movq	%rdx, -64(%rbp)
	movq	%rax, -96(%rbp)
.Ltmp22533:
	.loc	4 0 13
	movq	-320(%rbp), %r10
.Ltmp22534:
	.loc	4 2688 13
	movq	%r10, %rax
.Ltmp22535:
	mulq	%rcx
	movq	%rax, -128(%rbp)
.Ltmp22536:
	.loc	4 0 13
	movq	%rdx, -48(%rbp)
.Ltmp22537:
	movq	-176(%rbp), %rcx
.Ltmp22538:
	.loc	4 2688 13
	leaq	(%rcx,%rcx,8), %rax
	leaq	(%rcx,%rax,2), %rcx
.Ltmp22539:
	.loc	4 0 13
	movq	%rcx, -56(%rbp)
.Ltmp22540:
	movq	-240(%rbp), %rdi
.Ltmp22541:
	.loc	4 2688 13
	movq	%rdi, %rax
	mulq	%rcx
	movq	%rdx, %r8
.Ltmp22542:
	movq	%rax, %rbx
.Ltmp22543:
	.loc	4 0 13
	movq	-272(%rbp), %r13
.Ltmp22544:
	.loc	4 2688 13
	movq	%r13, %rax
	mulq	%r14
.Ltmp22545:
	movq	%rdx, %rcx
.Ltmp22546:
	movq	%rax, %r15
.Ltmp22547:
	.loc	4 0 13
	movq	-192(%rbp), %r14
.Ltmp22548:
	.loc	4 2688 13
	movq	%r14, %rax
	mulq	%r12
.Ltmp22549:
	.loc	53 74 9 is_stmt 1
	movabsq	$2251799813685247, %r12
.Ltmp22550:
	andq	%r12, %rsi
.Ltmp22551:
	.loc	53 0 9 is_stmt 0
	movq	%rsi, -112(%rbp)
.Ltmp22552:
	.loc	4 2612 13 is_stmt 1
	addq	%rbx, %r15
	adcq	%r8, %rcx
.Ltmp22553:
	.loc	4 2612 13 is_stmt 0
	addq	-96(%rbp), %r15
	adcq	-64(%rbp), %rcx
.Ltmp22554:
	.loc	4 2612 13
	addq	-128(%rbp), %r15
.Ltmp22555:
	adcq	-48(%rbp), %rcx
.Ltmp22556:
	.loc	4 2612 13
	addq	%rax, %r15
.Ltmp22557:
	.loc	4 0 13
	movq	%r15, -128(%rbp)
.Ltmp22558:
	.loc	4 2612 13
	adcq	%rdx, %rcx
.Ltmp22559:
	.loc	4 0 13
	movq	%r9, %rbx
.Ltmp22560:
	.loc	4 2688 13 is_stmt 1
	movq	%r9, %rax
.Ltmp22561:
	.loc	4 0 13 is_stmt 0
	movq	-120(%rbp), %r15
	.loc	4 2688 13
	mulq	%r15
.Ltmp22562:
	.loc	4 0 13
	movq	%rdx, -64(%rbp)
.Ltmp22563:
	movq	%rax, -96(%rbp)
.Ltmp22564:
	.loc	4 2688 13
	movq	%r11, %rax
	mulq	%r10
	movq	%rdx, -48(%rbp)
.Ltmp22565:
	.loc	4 0 13
	movq	%rax, -152(%rbp)
.Ltmp22566:
	.loc	4 2688 13
	movq	%rdi, %rax
	movq	-72(%rbp), %rsi
	mulq	%rsi
	movq	%rdx, -144(%rbp)
.Ltmp22567:
	.loc	4 0 13
	movq	%rax, -256(%rbp)
.Ltmp22568:
	.loc	4 2688 13
	movq	%r13, %rax
	mulq	-56(%rbp)
	movq	%rdx, -416(%rbp)
.Ltmp22569:
	.loc	4 0 13
	movq	%rax, -400(%rbp)
.Ltmp22570:
	.loc	4 2688 13
	movq	%r14, %rax
	mulq	-104(%rbp)
	movq	%rdx, %r9
	movq	%rax, %r14
.Ltmp22571:
	.loc	4 2688 13
	movq	%rbx, %rax
	movq	-264(%rbp), %rbx
	mulq	%rbx
	movq	%rdx, -208(%rbp)
.Ltmp22572:
	.loc	4 0 13
	movq	%rax, -200(%rbp)
.Ltmp22573:
	.loc	4 2688 13
	movq	%r10, %rax
	movq	%r10, %r12
	mulq	%r15
	movq	%rdx, -104(%rbp)
.Ltmp22574:
	.loc	4 0 13
	movq	%rax, -216(%rbp)
.Ltmp22575:
	movq	%r11, %r10
.Ltmp22576:
	.loc	4 2688 13
	movq	%r11, %rax
	mulq	%rdi
	movq	%rdx, -376(%rbp)
.Ltmp22577:
	.loc	4 0 13
	movq	%rax, -360(%rbp)
.Ltmp22578:
	.loc	4 2688 13
	movq	%r13, %rax
	mulq	%rsi
	movq	%rdx, -368(%rbp)
	movq	%rax, -408(%rbp)
.Ltmp22579:
	.loc	4 0 13
	movq	-192(%rbp), %r8
.Ltmp22580:
	.loc	4 2688 13
	movq	%r8, %rax
	mulq	-56(%rbp)
	movq	%rdx, %rdi
	movq	%rax, %rsi
.Ltmp22581:
	.loc	4 0 13
	movq	-280(%rbp), %r11
.Ltmp22582:
	.loc	4 2688 13
	movq	%r11, %rax
	mulq	-176(%rbp)
	movq	%rdx, -304(%rbp)
.Ltmp22583:
	.loc	4 0 13
	movq	%rax, -248(%rbp)
.Ltmp22584:
	.loc	4 2688 13
	movq	%rbx, %rax
	mulq	%r12
	movq	%r12, %r15
	movq	%rdx, -56(%rbp)
	movq	%rax, -384(%rbp)
.Ltmp22585:
	.loc	4 0 13
	movq	-240(%rbp), %r12
.Ltmp22586:
	.loc	4 2688 13
	movq	%r12, %rax
	mulq	-120(%rbp)
	movq	%rdx, -296(%rbp)
.Ltmp22587:
	.loc	4 0 13
	movq	%rax, -312(%rbp)
.Ltmp22588:
	.loc	4 2688 13
	movq	%r10, %rax
	mulq	%r13
	movq	%rdx, %r10
	movq	%rax, %rbx
.Ltmp22589:
	.loc	4 2688 13
	movq	%r8, %rax
	mulq	-72(%rbp)
	movq	%rdx, -448(%rbp)
.Ltmp22590:
	.loc	4 0 13
	movq	%rax, -480(%rbp)
.Ltmp22591:
	.loc	4 2688 13
	movq	%r11, %rax
	mulq	-432(%rbp)
	movq	%rdx, -432(%rbp)
.Ltmp22592:
	.loc	4 0 13
	movq	%rax, -424(%rbp)
.Ltmp22593:
	movq	-176(%rbp), %rax
.Ltmp22594:
	.loc	4 2688 13
	mulq	%r15
	movq	%rdx, -72(%rbp)
.Ltmp22595:
	.loc	4 0 13
	movq	%rax, -176(%rbp)
.Ltmp22596:
	.loc	4 2688 13
	movq	%r12, %rax
	mulq	-264(%rbp)
	movq	%rdx, %r12
.Ltmp22597:
	movq	%rax, %r11
.Ltmp22598:
	.loc	4 2688 13
	movq	%r13, %rax
	mulq	-120(%rbp)
	movq	%rdx, %r13
	movq	%rax, -120(%rbp)
.Ltmp22599:
	.loc	4 0 13
	movq	-440(%rbp), %rax
.Ltmp22600:
	.loc	4 2688 13
	mulq	%r8
.Ltmp22601:
	.loc	53 63 30 is_stmt 1
	movq	%rcx, %r8
	movq	-128(%rbp), %r15
	shldq	$13, %r15, %rcx
.Ltmp22602:
	shrq	$51, %r8
.Ltmp22603:
	.loc	4 2612 13
	addq	-400(%rbp), %r14
	adcq	-416(%rbp), %r9
.Ltmp22604:
	.loc	4 2612 13 is_stmt 0
	addq	-256(%rbp), %r14
	adcq	-144(%rbp), %r9
.Ltmp22605:
	.loc	4 2612 13
	addq	-152(%rbp), %r14
	adcq	-48(%rbp), %r9
.Ltmp22606:
	.loc	4 2612 13
	addq	-96(%rbp), %r14
.Ltmp22607:
	adcq	-64(%rbp), %r9
.Ltmp22608:
	.loc	4 2612 13
	addq	%rcx, %r14
.Ltmp22609:
	adcq	%r8, %r9
.Ltmp22610:
	.loc	53 64 30 is_stmt 1
	movq	%r9, %rcx
.Ltmp22611:
	shldq	$13, %r14, %r9
.Ltmp22612:
	shrq	$51, %rcx
.Ltmp22613:
	.loc	4 2612 13
	addq	-200(%rbp), %rsi
	adcq	-208(%rbp), %rdi
.Ltmp22614:
	.loc	4 2612 13 is_stmt 0
	addq	-360(%rbp), %rsi
	adcq	-376(%rbp), %rdi
.Ltmp22615:
	.loc	4 2612 13
	addq	-408(%rbp), %rsi
	adcq	-368(%rbp), %rdi
.Ltmp22616:
	.loc	4 2612 13
	addq	-216(%rbp), %rsi
.Ltmp22617:
	adcq	-104(%rbp), %rdi
.Ltmp22618:
	.loc	4 2612 13
	addq	%r9, %rsi
.Ltmp22619:
	adcq	%rcx, %rdi
.Ltmp22620:
	.loc	53 65 30 is_stmt 1
	movq	%rdi, %rcx
.Ltmp22621:
	shldq	$13, %rsi, %rdi
.Ltmp22622:
	shrq	$51, %rcx
.Ltmp22623:
	.loc	4 2612 13
	addq	-248(%rbp), %rbx
	adcq	-304(%rbp), %r10
.Ltmp22624:
	.loc	4 2612 13 is_stmt 0
	addq	-480(%rbp), %rbx
	adcq	-448(%rbp), %r10
.Ltmp22625:
	.loc	4 2612 13
	addq	-384(%rbp), %rbx
	adcq	-56(%rbp), %r10
.Ltmp22626:
	.loc	4 2612 13
	addq	-312(%rbp), %rbx
.Ltmp22627:
	adcq	-296(%rbp), %r10
.Ltmp22628:
	.loc	4 2612 13
	addq	%rdi, %rbx
.Ltmp22629:
	adcq	%rcx, %r10
.Ltmp22630:
	.loc	53 66 30 is_stmt 1
	movq	%r10, %rcx
.Ltmp22631:
	shrq	$51, %rcx
.Ltmp22632:
	shldq	$13, %rbx, %r10
.Ltmp22633:
	.loc	4 2612 13
	addq	-424(%rbp), %r11
	adcq	-432(%rbp), %r12
.Ltmp22634:
	.loc	4 2612 13 is_stmt 0
	addq	%rax, %r11
	adcq	%rdx, %r12
.Ltmp22635:
	.loc	4 2612 13
	addq	-176(%rbp), %r11
	adcq	-72(%rbp), %r12
.Ltmp22636:
	.loc	4 2612 13
	addq	-120(%rbp), %r11
.Ltmp22637:
	adcq	%r13, %r12
.Ltmp22638:
	.loc	4 2612 13
	addq	%r10, %r11
.Ltmp22639:
	adcq	%rcx, %r12
.Ltmp22640:
	.loc	53 67 56 is_stmt 1
	movq	%r12, %rax
.Ltmp22641:
	shrq	$51, %r12
.Ltmp22642:
	.loc	4 2688 13
	leaq	(%r12,%r12,8), %rcx
.Ltmp22643:
	leaq	(%r12,%rcx,2), %rcx
	movabsq	$2251799813685247, %rdi
.Ltmp22644:
	.loc	4 0 13 is_stmt 0
	movq	%r15, %r8
.Ltmp22645:
	.loc	27 72 17 is_stmt 1
	andq	%rdi, %r8
.Ltmp22646:
	.loc	53 67 56
	shldq	$13, %r11, %rax
.Ltmp22647:
	.loc	4 2688 13
	movl	$19, %edx
.Ltmp22648:
	mulq	%rdx
.Ltmp22649:
	.loc	4 2612 13
	addq	%r8, %rax
.Ltmp22650:
	adcq	%rcx, %rdx
.Ltmp22651:
	.loc	53 68 14
	andq	%rdi, %r14
.Ltmp22652:
	.loc	53 68 46 is_stmt 0
	shldq	$13, %rax, %rdx
.Ltmp22653:
	.loc	4 2612 13 is_stmt 1
	addq	%r14, %rdx
.Ltmp22654:
	.loc	4 0 13 is_stmt 0
	movq	%rdx, -64(%rbp)
.Ltmp22655:
	.loc	53 70 9 is_stmt 1
	andq	%rdi, %rax
.Ltmp22656:
	.loc	53 0 9 is_stmt 0
	movq	%rdi, %r8
.Ltmp22657:
	movq	%rax, -120(%rbp)
	movq	-336(%rbp), %rax
	movl	$121665, %r14d
.Ltmp22658:
	.loc	4 2688 13 is_stmt 1
	mulq	%r14
	movq	%rax, %rcx
	movq	%rdx, %r10
.Ltmp22659:
	.loc	53 72 9
	andq	%rdi, %rsi
.Ltmp22660:
	.loc	53 0 9 is_stmt 0
	movq	%rsi, -56(%rbp)
.Ltmp22661:
	movq	-288(%rbp), %rax
.Ltmp22662:
	.loc	4 2688 13 is_stmt 1
	mulq	%r14
.Ltmp22663:
	movq	%rdx, %r15
	movq	%rax, %rdi
.Ltmp22664:
	.loc	4 0 13 is_stmt 0
	movq	-328(%rbp), %rax
.Ltmp22665:
	.loc	4 2688 13
	mulq	%r14
	movq	%rdx, %r13
	movq	%rax, %r9
.Ltmp22666:
	.loc	4 0 13
	movq	-344(%rbp), %rax
.Ltmp22667:
	.loc	4 2688 13
	mulq	%r14
.Ltmp22668:
	movq	%rax, %r12
.Ltmp22669:
	movq	%rdx, %rsi
.Ltmp22670:
	.loc	53 73 9 is_stmt 1
	andq	%r8, %rbx
.Ltmp22671:
	.loc	53 0 9 is_stmt 0
	movq	%rbx, -72(%rbp)
.Ltmp22672:
	movq	-352(%rbp), %rax
.Ltmp22673:
	.loc	4 2688 13 is_stmt 1
	mulq	%r14
.Ltmp22674:
	.loc	53 63 30
	shldq	$13, %rcx, %r10
.Ltmp22675:
	.loc	53 74 9
	andq	%r8, %r11
.Ltmp22676:
	.loc	53 0 9 is_stmt 0
	movq	%r11, -96(%rbp)
.Ltmp22677:
	.loc	4 2612 13 is_stmt 1
	addq	%rdi, %r10
.Ltmp22678:
	adcq	$0, %r15
.Ltmp22679:
	.loc	53 64 30
	shldq	$13, %r10, %r15
.Ltmp22680:
	.loc	4 2612 13
	addq	%r9, %r15
.Ltmp22681:
	adcq	$0, %r13
.Ltmp22682:
	.loc	53 65 30
	shldq	$13, %r15, %r13
.Ltmp22683:
	.loc	4 2612 13
	addq	%r12, %r13
.Ltmp22684:
	adcq	$0, %rsi
.Ltmp22685:
	.loc	53 66 30
	shldq	$13, %r13, %rsi
.Ltmp22686:
	.loc	27 72 17
	andq	%r8, %rcx
.Ltmp22687:
	.loc	4 2612 13
	addq	%rsi, %rax
.Ltmp22688:
	.loc	53 67 56
	adcl	$0, %edx
.Ltmp22689:
	movq	%rax, %rsi
.Ltmp22690:
	shrq	$51, %rsi
	shll	$13, %edx
	orq	%rsi, %rdx
.Ltmp22691:
	.loc	4 2688 13
	leaq	(%rdx,%rdx,8), %rsi
	leaq	(%rdx,%rsi,2), %rsi
.Ltmp22692:
	.loc	4 2612 13
	addq	%rcx, %rsi
.Ltmp22693:
	.loc	53 68 46
	movq	%rsi, %rdx
.Ltmp22694:
	.loc	53 0 46 is_stmt 0
	movq	%r8, %rcx
.Ltmp22695:
	.loc	53 70 9 is_stmt 1
	andq	%r8, %rsi
.Ltmp22696:
	.loc	53 0 9 is_stmt 0
	movq	%rsi, %r8
.Ltmp22697:
	.loc	4 2612 13 is_stmt 1
	addq	-280(%rbp), %r8
.Ltmp22698:
	.loc	53 68 14
	andq	%rcx, %r10
.Ltmp22699:
	.loc	4 2612 13
	addq	-320(%rbp), %r10
.Ltmp22700:
	.loc	53 68 46
	shrq	$51, %rdx
.Ltmp22701:
	.loc	4 2612 13
	addq	%rdx, %r10
.Ltmp22702:
	.loc	53 72 9
	andq	%rcx, %r15
.Ltmp22703:
	.loc	4 2612 13
	addq	-240(%rbp), %r15
.Ltmp22704:
	.loc	53 73 9
	andq	%rcx, %r13
.Ltmp22705:
	.loc	4 2612 13
	addq	-272(%rbp), %r13
.Ltmp22706:
	.loc	4 0 13 is_stmt 0
	movq	%rax, %rdx
.Ltmp22707:
	.loc	53 74 9 is_stmt 1
	andq	%rcx, %rdx
.Ltmp22708:
	.loc	4 2612 13
	addq	-192(%rbp), %rdx
.Ltmp22709:
	.loc	4 0 13 is_stmt 0
	movq	%rdx, -240(%rbp)
.Ltmp22710:
	.loc	4 2688 13 is_stmt 1
	leaq	(%r10,%r10,8), %rax
.Ltmp22711:
	leaq	(%r10,%rax,2), %r12
.Ltmp22712:
	.loc	4 2688 13 is_stmt 0
	leaq	(%r15,%r15,8), %rax
	leaq	(%r15,%rax,2), %rbx
.Ltmp22713:
	.loc	4 0 13
	movq	%rbx, -264(%rbp)
.Ltmp22714:
	.loc	4 2688 13
	leaq	(%rdx,%rdx,8), %rax
	leaq	(%rdx,%rax,2), %rcx
.Ltmp22715:
	.loc	4 0 13
	movq	%rcx, -192(%rbp)
.Ltmp22716:
	.loc	4 2688 13
	movq	%r8, %rax
	movq	-336(%rbp), %rdi
.Ltmp22717:
	mulq	%rdi
	movq	%rdx, -320(%rbp)
.Ltmp22718:
	.loc	4 0 13
	movq	%rax, -272(%rbp)
.Ltmp22719:
	.loc	4 2688 13
	movq	%rcx, %rax
	movq	-288(%rbp), %rsi
.Ltmp22720:
	mulq	%rsi
	movq	%rax, -104(%rbp)
.Ltmp22721:
	.loc	4 0 13
	movq	%rdx, -176(%rbp)
.Ltmp22722:
	.loc	4 2688 13
	leaq	(,%r13,8), %rax
	addq	%r13, %rax
	leaq	(,%rax,2), %rax
	addq	%r13, %rax
.Ltmp22723:
	.loc	4 0 13
	movq	%rax, -48(%rbp)
.Ltmp22724:
	.loc	4 2688 13
	mulq	-328(%rbp)
.Ltmp22725:
	movq	%rdx, %r11
	movq	%rax, %r9
.Ltmp22726:
	.loc	4 2688 13
	movq	%rbx, %rax
	movq	-344(%rbp), %rbx
	mulq	%rbx
	movq	%rdx, %r14
	movq	%rax, %rcx
.Ltmp22727:
	.loc	4 2688 13
	movq	%r12, %rax
	movq	-352(%rbp), %r12
.Ltmp22728:
	mulq	%r12
.Ltmp22729:
	.loc	4 2612 13 is_stmt 1
	addq	%r9, %rcx
	adcq	%r11, %r14
.Ltmp22730:
	.loc	4 2612 13 is_stmt 0
	addq	-104(%rbp), %rcx
	adcq	-176(%rbp), %r14
.Ltmp22731:
	.loc	4 2612 13
	addq	-272(%rbp), %rcx
.Ltmp22732:
	adcq	-320(%rbp), %r14
.Ltmp22733:
	.loc	4 2612 13
	addq	%rax, %rcx
.Ltmp22734:
	.loc	4 0 13
	movq	%rcx, -104(%rbp)
.Ltmp22735:
	.loc	4 2612 13
	adcq	%rdx, %r14
.Ltmp22736:
	.loc	4 2688 13 is_stmt 1
	movq	%r10, %rax
.Ltmp22737:
	mulq	%rdi
.Ltmp22738:
	.loc	4 0 13 is_stmt 0
	movq	%rdx, -320(%rbp)
.Ltmp22739:
	movq	%rax, -272(%rbp)
.Ltmp22740:
	.loc	4 2688 13
	movq	%r8, %rax
	movq	%r8, -280(%rbp)
.Ltmp22741:
	mulq	%rsi
	movq	%rdx, -176(%rbp)
.Ltmp22742:
	.loc	4 0 13
	movq	%rax, -128(%rbp)
.Ltmp22743:
	movq	-192(%rbp), %rcx
.Ltmp22744:
	.loc	4 2688 13
	movq	%rcx, %rax
	movq	-328(%rbp), %r11
	mulq	%r11
	movq	%rdx, -152(%rbp)
.Ltmp22745:
	.loc	4 0 13
	movq	%rax, -144(%rbp)
.Ltmp22746:
	movq	-48(%rbp), %rax
.Ltmp22747:
	.loc	4 2688 13
	mulq	%rbx
	movq	%rdx, -304(%rbp)
	movq	%rax, -384(%rbp)
.Ltmp22748:
	.loc	4 0 13
	movq	-264(%rbp), %rax
.Ltmp22749:
	.loc	4 2688 13
	mulq	%r12
	movq	%rdx, %r9
	movq	%rax, %r12
.Ltmp22750:
	.loc	4 2688 13
	movq	%r15, %rax
	mulq	%rdi
	movq	%rdx, -432(%rbp)
	movq	%rax, -216(%rbp)
.Ltmp22751:
	.loc	4 2688 13
	movq	%r10, %rax
	mulq	%rsi
	movq	%rdx, -264(%rbp)
.Ltmp22752:
	.loc	4 0 13
	movq	%rax, -440(%rbp)
.Ltmp22753:
	.loc	4 2688 13
	movq	%r8, %rax
	movq	%r11, %rbx
	mulq	%r11
	movq	%rdx, -208(%rbp)
.Ltmp22754:
	.loc	4 0 13
	movq	%rax, -200(%rbp)
.Ltmp22755:
	.loc	4 2688 13
	movq	%rcx, %rax
	movq	-344(%rbp), %rsi
	mulq	%rsi
	movq	%rdx, -296(%rbp)
	movq	%rax, -248(%rbp)
.Ltmp22756:
	.loc	4 0 13
	movq	-48(%rbp), %rax
	movq	-352(%rbp), %r8
.Ltmp22757:
	.loc	4 2688 13
	mulq	%r8
	movq	%rdx, %rdi
	movq	%rax, %rcx
.Ltmp22758:
	.loc	4 2688 13
	movq	%r13, %rax
	mulq	-336(%rbp)
	movq	%rdx, -48(%rbp)
	movq	%rax, %r11
.Ltmp22759:
	.loc	4 2688 13
	movq	%r15, %rax
	mulq	-288(%rbp)
.Ltmp22760:
	.loc	4 2612 13 is_stmt 1
	addq	%r11, %rax
	movq	%rax, -312(%rbp)
	adcq	-48(%rbp), %rdx
.Ltmp22761:
	.loc	4 0 13 is_stmt 0
	movq	%rdx, -376(%rbp)
.Ltmp22762:
	.loc	4 2688 13 is_stmt 1
	movq	%r10, %rax
	mulq	%rbx
	movq	%rdx, -48(%rbp)
	movq	%rax, -256(%rbp)
.Ltmp22763:
	.loc	4 0 13 is_stmt 0
	movq	-280(%rbp), %rax
.Ltmp22764:
	.loc	4 2688 13
	mulq	%rsi
	movq	%rdx, -368(%rbp)
.Ltmp22765:
	.loc	4 0 13
	movq	%rax, -360(%rbp)
.Ltmp22766:
	movq	-192(%rbp), %rax
.Ltmp22767:
	.loc	4 2688 13
	mulq	%r8
	movq	%rdx, %rsi
	movq	%rax, %r11
.Ltmp22768:
	.loc	4 0 13
	movq	-240(%rbp), %rax
.Ltmp22769:
	.loc	4 2688 13
	mulq	-336(%rbp)
	movq	%rdx, -336(%rbp)
.Ltmp22770:
	.loc	4 0 13
	movq	%rax, -192(%rbp)
.Ltmp22771:
	.loc	4 2688 13
	movq	%r13, %rax
	mulq	-288(%rbp)
	movq	%rdx, -288(%rbp)
.Ltmp22772:
	.loc	4 0 13
	movq	%rax, -240(%rbp)
.Ltmp22773:
	.loc	4 2688 13
	movq	%r15, %rax
	mulq	%rbx
	movq	%rdx, %rbx
	movq	%rax, %r8
.Ltmp22774:
	.loc	4 2688 13
	movq	%r10, %rax
	mulq	-344(%rbp)
	movq	%rdx, -344(%rbp)
.Ltmp22775:
	movq	%rax, %r10
.Ltmp22776:
	.loc	4 0 13
	movq	-280(%rbp), %rax
.Ltmp22777:
	.loc	4 2688 13
	mulq	-352(%rbp)
.Ltmp22778:
	.loc	53 63 30 is_stmt 1
	movq	%r14, %r15
.Ltmp22779:
	.loc	53 0 30 is_stmt 0
	movq	-104(%rbp), %r13
.Ltmp22780:
	.loc	53 63 30
	shldq	$13, %r13, %r14
.Ltmp22781:
	shrq	$51, %r15
.Ltmp22782:
	.loc	4 2612 13 is_stmt 1
	addq	-384(%rbp), %r12
	adcq	-304(%rbp), %r9
.Ltmp22783:
	.loc	4 2612 13 is_stmt 0
	addq	-144(%rbp), %r12
	adcq	-152(%rbp), %r9
.Ltmp22784:
	.loc	4 2612 13
	addq	-128(%rbp), %r12
	adcq	-176(%rbp), %r9
.Ltmp22785:
	.loc	4 2612 13
	addq	-272(%rbp), %r12
.Ltmp22786:
	adcq	-320(%rbp), %r9
.Ltmp22787:
	.loc	4 2612 13
	addq	%r14, %r12
.Ltmp22788:
	adcq	%r15, %r9
.Ltmp22789:
	.loc	53 64 30 is_stmt 1
	movq	%r9, %r14
.Ltmp22790:
	shldq	$13, %r12, %r9
.Ltmp22791:
	shrq	$51, %r14
.Ltmp22792:
	.loc	4 2612 13
	addq	-216(%rbp), %rcx
	adcq	-432(%rbp), %rdi
.Ltmp22793:
	.loc	4 2612 13 is_stmt 0
	addq	-248(%rbp), %rcx
	adcq	-296(%rbp), %rdi
.Ltmp22794:
	.loc	4 2612 13
	addq	-200(%rbp), %rcx
	adcq	-208(%rbp), %rdi
.Ltmp22795:
	.loc	4 2612 13
	addq	-440(%rbp), %rcx
.Ltmp22796:
	adcq	-264(%rbp), %rdi
.Ltmp22797:
	.loc	4 2612 13
	addq	%r9, %rcx
.Ltmp22798:
	adcq	%r14, %rdi
.Ltmp22799:
	.loc	53 65 30 is_stmt 1
	movq	%rdi, %r9
.Ltmp22800:
	shldq	$13, %rcx, %rdi
.Ltmp22801:
	shrq	$51, %r9
.Ltmp22802:
	.loc	4 2612 13
	addq	-312(%rbp), %r11
	adcq	-376(%rbp), %rsi
.Ltmp22803:
	.loc	4 2612 13 is_stmt 0
	addq	-360(%rbp), %r11
	adcq	-368(%rbp), %rsi
.Ltmp22804:
	.loc	4 2612 13
	addq	-256(%rbp), %r11
.Ltmp22805:
	adcq	-48(%rbp), %rsi
.Ltmp22806:
	.loc	4 2612 13
	addq	%rdi, %r11
.Ltmp22807:
	adcq	%r9, %rsi
.Ltmp22808:
	.loc	53 66 30 is_stmt 1
	movq	%rsi, %rdi
.Ltmp22809:
	shldq	$13, %r11, %rsi
.Ltmp22810:
	shrq	$51, %rdi
.Ltmp22811:
	.loc	4 2612 13
	addq	-240(%rbp), %r8
	adcq	-288(%rbp), %rbx
.Ltmp22812:
	.loc	4 2612 13 is_stmt 0
	addq	-192(%rbp), %r8
	adcq	-336(%rbp), %rbx
.Ltmp22813:
	.loc	4 2612 13
	addq	%rax, %r8
	adcq	%rdx, %rbx
.Ltmp22814:
	.loc	4 2612 13
	addq	%r10, %r8
.Ltmp22815:
	adcq	-344(%rbp), %rbx
.Ltmp22816:
	.loc	4 2612 13
	addq	%rsi, %r8
.Ltmp22817:
	adcq	%rdi, %rbx
.Ltmp22818:
	.loc	53 67 56 is_stmt 1
	movq	%rbx, %rax
.Ltmp22819:
	shrq	$51, %rbx
.Ltmp22820:
	.loc	4 2688 13
	leaq	(%rbx,%rbx,8), %rdx
	leaq	(%rbx,%rdx,2), %rdi
.Ltmp22821:
	.loc	4 0 13 is_stmt 0
	movq	-800(%rbp), %rsi
.Ltmp22822:
	movabsq	$2251799813685247, %r15
.Ltmp22823:
	movq	%r13, %r9
.Ltmp22824:
	.loc	27 72 17 is_stmt 1
	andq	%r15, %r9
.Ltmp22825:
	.loc	53 67 56
	shldq	$13, %r8, %rax
.Ltmp22826:
	.loc	4 2688 13
	movl	$19, %edx
	mulq	%rdx
.Ltmp22827:
	movq	%rax, %r10
.Ltmp22828:
	.loc	4 2612 13
	addq	%r9, %r10
.Ltmp22829:
	.loc	4 2688 13
	movq	%rdx, %r13
	movq	-864(%rbp), %rdx
.Ltmp22830:
	.loc	4 2612 13
	adcq	%rdi, %r13
.Ltmp22831:
	.loc	4 0 13 is_stmt 0
	movq	-224(%rbp), %rdi
	movq	-392(%rbp), %rbx
.Ltmp22832:
	movq	-168(%rbp), %r14
.Ltmp22833:
	movq	-184(%rbp), %r9
.Ltmp22834:
	.loc	53 68 14 is_stmt 1
	andq	%r15, %r12
.Ltmp22835:
	.loc	53 68 46 is_stmt 0
	shldq	$13, %r10, %r13
.Ltmp22836:
	.loc	4 2612 13 is_stmt 1
	addq	%r12, %r13
.Ltmp22837:
	.loc	4 0 13 is_stmt 0
	movq	-872(%rbp), %r12
.Ltmp22838:
	.loc	53 70 9 is_stmt 1
	andq	%r15, %r10
.Ltmp22839:
	.loc	53 72 9
	andq	%r15, %rcx
.Ltmp22840:
	.loc	53 73 9
	andq	%r15, %r11
.Ltmp22841:
	.loc	53 74 9
	andq	%r15, %r8
.Ltmp22842:
	.loc	37 1936 50
	addq	$-1, %r12
.Ltmp22843:
	.loc	24 1142 12
	jb	.LBB139_3
.Ltmp22844:
	.loc	21 44 9
	#APP

	# rdx 

	#NO_APP
.Ltmp22845:
	.loc	4 2649 13
	negq	%rdx
.Ltmp22846:
	.loc	53 185 21
	movq	%rdi, %rax
	movq	-120(%rbp), %rsi
	xorq	%rsi, %rax
	andq	%rdx, %rax
.Ltmp22847:
	.loc	53 186 13
	xorq	%rax, %rsi
	.loc	53 187 13
	xorq	%rdi, %rax
.Ltmp22848:
	.loc	53 186 13
	movq	%rsi, -784(%rbp)
	movq	%rsi, %r15
	movq	%rsi, -120(%rbp)
	.loc	53 187 13
	movq	%rax, -704(%rbp)
.Ltmp22849:
	.loc	53 185 21
	movq	%rbx, %rax
	movq	-64(%rbp), %rsi
	xorq	%rsi, %rax
	andq	%rdx, %rax
.Ltmp22850:
	.loc	53 186 13
	xorq	%rax, %rsi
	movq	%rsi, -64(%rbp)
	.loc	53 187 13
	xorq	%rbx, %rax
.Ltmp22851:
	.loc	53 186 13
	movq	%rsi, -776(%rbp)
	.loc	53 187 13
	movq	%rax, -696(%rbp)
.Ltmp22852:
	.loc	53 185 21
	movq	%r9, %rax
	movq	-56(%rbp), %rsi
	xorq	%rsi, %rax
	andq	%rdx, %rax
.Ltmp22853:
	.loc	53 186 13
	xorq	%rax, %rsi
	.loc	53 187 13
	xorq	%r9, %rax
.Ltmp22854:
	.loc	53 186 13
	movq	%rsi, -768(%rbp)
	movq	%rsi, %r12
	.loc	53 187 13
	movq	%rax, -688(%rbp)
.Ltmp22855:
	.loc	53 185 21
	movq	%r14, %rax
	movq	-72(%rbp), %rsi
	xorq	%rsi, %rax
	andq	%rdx, %rax
.Ltmp22856:
	.loc	53 186 13
	xorq	%rax, %rsi
	.loc	53 187 13
	xorq	%r14, %rax
.Ltmp22857:
	.loc	53 186 13
	movq	%rsi, -760(%rbp)
	movq	%rsi, %rbx
	.loc	53 187 13
	movq	%rax, -680(%rbp)
.Ltmp22858:
	.loc	53 0 13 is_stmt 0
	movq	-232(%rbp), %rsi
.Ltmp22859:
	.loc	53 185 21 is_stmt 1
	movq	%rsi, %rax
	movq	-96(%rbp), %rdi
	xorq	%rdi, %rax
	andq	%rdx, %rax
.Ltmp22860:
	.loc	53 186 13
	xorq	%rax, %rdi
	movq	%rdi, -96(%rbp)
	.loc	53 187 13
	xorq	%rsi, %rax
.Ltmp22861:
	.loc	53 186 13
	movq	%rdi, -752(%rbp)
	.loc	53 187 13
	movq	%rax, -672(%rbp)
.Ltmp22862:
	.loc	53 0 13 is_stmt 0
	movq	-136(%rbp), %rsi
.Ltmp22863:
	.loc	53 185 21 is_stmt 1
	movq	%rsi, %rax
	xorq	%r10, %rax
	andq	%rdx, %rax
.Ltmp22864:
	.loc	53 186 13
	xorq	%rax, %r10
	movq	%r10, -744(%rbp)
	.loc	53 187 13
	xorq	%rsi, %rax
.Ltmp22865:
	movq	%rax, -664(%rbp)
.Ltmp22866:
	.loc	53 0 13 is_stmt 0
	movq	-160(%rbp), %rsi
.Ltmp22867:
	.loc	53 185 21 is_stmt 1
	movq	%rsi, %rax
	xorq	%r13, %rax
	andq	%rdx, %rax
.Ltmp22868:
	.loc	53 186 13
	xorq	%rax, %r13
	movq	%r13, -736(%rbp)
	.loc	53 187 13
	xorq	%rsi, %rax
.Ltmp22869:
	movq	%rax, -656(%rbp)
.Ltmp22870:
	.loc	53 0 13 is_stmt 0
	movq	-80(%rbp), %rsi
.Ltmp22871:
	.loc	53 185 21 is_stmt 1
	movq	%rsi, %rax
	xorq	%rcx, %rax
	andq	%rdx, %rax
.Ltmp22872:
	.loc	53 186 13
	xorq	%rax, %rcx
	movq	%rcx, -728(%rbp)
	.loc	53 187 13
	xorq	%rsi, %rax
.Ltmp22873:
	movq	%rax, -648(%rbp)
.Ltmp22874:
	.loc	53 0 13 is_stmt 0
	movq	-88(%rbp), %rcx
.Ltmp22875:
	.loc	53 185 21 is_stmt 1
	movq	%rcx, %rax
	xorq	%r11, %rax
	andq	%rdx, %rax
.Ltmp22876:
	.loc	53 186 13
	xorq	%rax, %r11
	movq	%r11, -720(%rbp)
	.loc	53 187 13
	xorq	%rcx, %rax
.Ltmp22877:
	movq	%rax, -640(%rbp)
.Ltmp22878:
	.loc	53 0 13 is_stmt 0
	movq	-112(%rbp), %rcx
.Ltmp22879:
	.loc	53 185 21 is_stmt 1
	movq	%rcx, %rax
	xorq	%r8, %rax
	andq	%rdx, %rax
.Ltmp22880:
	.loc	53 186 13
	xorq	%rax, %r8
	movq	%r8, -712(%rbp)
	.loc	53 187 13
	xorq	%rcx, %rax
.Ltmp22881:
	movq	%rax, -632(%rbp)
.Ltmp22882:
	.loc	53 0 13 is_stmt 0
	leaq	-560(%rbp), %rdi
.Ltmp22883:
	.loc	51 75 39 is_stmt 1
	leaq	-744(%rbp), %rsi
	callq	_RNvMs0_NtCs4U4sOGKWW3b_12toyos_crypto10field25519NtB5_5Tight6invert
.Ltmp22884:
	.loc	53 256 32
	movq	-560(%rbp), %r11
.Ltmp22885:
	.loc	53 251 18
	movq	-552(%rbp), %rdx
.Ltmp22886:
	.loc	53 0 18 is_stmt 0
	movq	%rdx, -344(%rbp)
.Ltmp22887:
	.loc	4 2688 13 is_stmt 1
	leaq	(%rdx,%rdx,8), %rcx
	leaq	(%rdx,%rcx,2), %rcx
.Ltmp22888:
	.loc	53 254 18
	movq	-528(%rbp), %rdi
.Ltmp22889:
	.loc	53 0 18 is_stmt 0
	movq	%rdi, -352(%rbp)
.Ltmp22890:
	.loc	4 2688 13 is_stmt 1
	leaq	(%rdi,%rdi,8), %rsi
.Ltmp22891:
	.loc	4 2688 13 is_stmt 0
	movq	%r11, %rax
	movq	%r11, -336(%rbp)
.Ltmp22892:
	mulq	%r15
	movq	%rax, -240(%rbp)
	movq	%rdx, -192(%rbp)
.Ltmp22893:
	.loc	4 2688 13
	leaq	(%rdi,%rsi,2), %rax
.Ltmp22894:
	.loc	4 0 13
	movq	%rax, -288(%rbp)
	movq	-64(%rbp), %r15
.Ltmp22895:
	.loc	4 2688 13
	mulq	%r15
.Ltmp22896:
	movq	%rax, %r13
	movq	%rdx, -280(%rbp)
.Ltmp22897:
	.loc	53 253 18 is_stmt 1
	movq	-536(%rbp), %rdx
.Ltmp22898:
	.loc	53 0 18 is_stmt 0
	movq	%rdx, -392(%rbp)
.Ltmp22899:
	.loc	4 2688 13 is_stmt 1
	leaq	(%rdx,%rdx,8), %rax
	leaq	(%rdx,%rax,2), %rax
.Ltmp22900:
	.loc	4 0 13 is_stmt 0
	movq	%rax, -80(%rbp)
.Ltmp22901:
	.loc	4 2688 13
	mulq	%r12
.Ltmp22902:
	.loc	4 0 13
	movq	%r12, %rdi
	movq	%r12, -56(%rbp)
.Ltmp22903:
	.loc	4 2688 13
	movq	%rax, %r8
	movq	%rdx, %r9
.Ltmp22904:
	.loc	53 252 18 is_stmt 1
	movq	-544(%rbp), %r12
.Ltmp22905:
	.loc	4 2688 13
	leaq	(%r12,%r12,8), %rax
	leaq	(%r12,%rax,2), %rax
.Ltmp22906:
	.loc	4 0 13 is_stmt 0
	movq	%rax, -328(%rbp)
	movq	%r12, -48(%rbp)
	movq	%rbx, %r10
	movq	%rbx, -72(%rbp)
.Ltmp22907:
	.loc	4 2688 13
	mulq	%rbx
.Ltmp22908:
	movq	%rdx, %r14
	movq	%rax, %rbx
.Ltmp22909:
	.loc	4 2688 13
	movq	%rcx, %rax
	movq	-96(%rbp), %rsi
	mulq	%rsi
	movq	%rdx, %rcx
.Ltmp22910:
	.loc	4 2612 13 is_stmt 1
	addq	%rbx, %rax
	adcq	%r14, %rcx
.Ltmp22911:
	.loc	4 2612 13 is_stmt 0
	addq	%r8, %rax
	adcq	%r9, %rcx
.Ltmp22912:
	.loc	4 2612 13
	addq	%r13, %rax
	adcq	-280(%rbp), %rcx
.Ltmp22913:
	.loc	4 2612 13
	addq	-240(%rbp), %rax
	movq	%rax, -440(%rbp)
	adcq	-192(%rbp), %rcx
.Ltmp22914:
	.loc	4 0 13
	movq	-344(%rbp), %r13
.Ltmp22915:
	.loc	4 2688 13 is_stmt 1
	movq	%r13, %rax
	movq	-120(%rbp), %r8
.Ltmp22916:
	mulq	%r8
.Ltmp22917:
	.loc	4 0 13 is_stmt 0
	movq	%rdx, -240(%rbp)
.Ltmp22918:
	movq	%rax, -168(%rbp)
.Ltmp22919:
	.loc	4 2688 13
	movq	%r11, %rax
	movq	%r15, %r14
.Ltmp22920:
	mulq	%r15
	movq	%rdx, -192(%rbp)
.Ltmp22921:
	.loc	4 0 13
	movq	%rax, -184(%rbp)
.Ltmp22922:
	movq	-288(%rbp), %r11
.Ltmp22923:
	.loc	4 2688 13
	movq	%r11, %rax
	mulq	%rdi
	movq	%rdx, -280(%rbp)
.Ltmp22924:
	.loc	4 0 13
	movq	%rax, -232(%rbp)
.Ltmp22925:
	movq	-80(%rbp), %rdi
.Ltmp22926:
	.loc	4 2688 13
	movq	%rdi, %rax
	mulq	%r10
	movq	%rdx, -224(%rbp)
	movq	%rax, -88(%rbp)
.Ltmp22927:
	.loc	4 0 13
	movq	-328(%rbp), %rax
	movq	%rsi, %r10
.Ltmp22928:
	.loc	4 2688 13
	mulq	%rsi
	movq	%rdx, %r15
	movq	%rax, %rsi
.Ltmp22929:
	.loc	4 2688 13
	movq	%r12, %rax
	mulq	%r8
	movq	%rdx, %r8
	movq	%rax, %r9
.Ltmp22930:
	.loc	4 2688 13
	movq	%r13, %rax
.Ltmp22931:
	mulq	%r14
.Ltmp22932:
	.loc	4 2612 13 is_stmt 1
	addq	%r9, %rax
.Ltmp22933:
	.loc	4 0 13 is_stmt 0
	movq	%rax, -272(%rbp)
	.loc	4 2612 13
	adcq	%r8, %rdx
.Ltmp22934:
	.loc	4 0 13
	movq	%rdx, -176(%rbp)
.Ltmp22935:
	movq	-336(%rbp), %rbx
.Ltmp22936:
	.loc	4 2688 13 is_stmt 1
	movq	%rbx, %rax
	movq	-56(%rbp), %r9
.Ltmp22937:
	mulq	%r9
	movq	%rdx, -328(%rbp)
	movq	%rax, -112(%rbp)
.Ltmp22938:
	.loc	4 2688 13 is_stmt 0
	movq	%r11, %rax
	movq	-72(%rbp), %r11
	mulq	%r11
	movq	%rdx, -264(%rbp)
	movq	%rax, -136(%rbp)
.Ltmp22939:
	.loc	4 2688 13
	movq	%rdi, %rax
	mulq	%r10
	movq	%rdx, %r8
.Ltmp22940:
	movq	%rax, %rdi
.Ltmp22941:
	.loc	4 0 13
	movq	-392(%rbp), %r12
.Ltmp22942:
	.loc	4 2688 13
	movq	%r12, %rax
	movq	-120(%rbp), %r10
	mulq	%r10
	movq	%rdx, -80(%rbp)
	movq	%rax, -320(%rbp)
.Ltmp22943:
	.loc	4 0 13
	movq	-48(%rbp), %rax
.Ltmp22944:
	.loc	4 2688 13
	mulq	%r14
	movq	%rdx, -160(%rbp)
	movq	%rax, -104(%rbp)
.Ltmp22945:
	.loc	4 2688 13
	movq	%r13, %rax
	mulq	%r9
	movq	%rdx, %r13
	movq	%rax, %r9
.Ltmp22946:
	.loc	4 2688 13
	movq	%rbx, %rax
	mulq	%r11
	movq	%rdx, -128(%rbp)
	movq	%rax, -464(%rbp)
.Ltmp22947:
	.loc	4 0 13
	movq	-288(%rbp), %rax
	movq	-96(%rbp), %rbx
.Ltmp22948:
	.loc	4 2688 13
	mulq	%rbx
	movq	%rdx, -472(%rbp)
.Ltmp22949:
	.loc	4 0 13
	movq	%rax, -456(%rbp)
.Ltmp22950:
	movq	-352(%rbp), %rax
.Ltmp22951:
	.loc	4 2688 13
	mulq	%r10
	movq	%rdx, -288(%rbp)
	movq	%rax, -352(%rbp)
.Ltmp22952:
	.loc	4 2688 13
	movq	%r12, %rax
	mulq	%r14
	movq	%rdx, -64(%rbp)
.Ltmp22953:
	.loc	4 0 13
	movq	%rax, -120(%rbp)
.Ltmp22954:
	movq	-48(%rbp), %rax
.Ltmp22955:
	.loc	4 2688 13
	mulq	-56(%rbp)
	movq	%rdx, -56(%rbp)
.Ltmp22956:
	.loc	4 0 13
	movq	%rax, -48(%rbp)
.Ltmp22957:
	movq	-344(%rbp), %rax
.Ltmp22958:
	.loc	4 2688 13
	mulq	%r11
	movq	%rdx, %r14
.Ltmp22959:
	movq	%rax, %r10
.Ltmp22960:
	.loc	4 0 13
	movq	-336(%rbp), %rax
.Ltmp22961:
	.loc	4 2688 13
	mulq	%rbx
.Ltmp22962:
	.loc	53 63 30 is_stmt 1
	movq	%rcx, %r11
	movq	-440(%rbp), %rbx
	shldq	$13, %rbx, %rcx
.Ltmp22963:
	shrq	$51, %r11
.Ltmp22964:
	.loc	4 2612 13
	addq	-168(%rbp), %rsi
	adcq	-240(%rbp), %r15
.Ltmp22965:
	.loc	4 2612 13 is_stmt 0
	addq	-88(%rbp), %rsi
	adcq	-224(%rbp), %r15
.Ltmp22966:
	.loc	4 2612 13
	addq	-184(%rbp), %rsi
	adcq	-192(%rbp), %r15
.Ltmp22967:
	.loc	4 2612 13
	addq	-232(%rbp), %rsi
.Ltmp22968:
	adcq	-280(%rbp), %r15
.Ltmp22969:
	.loc	4 2612 13
	addq	%rcx, %rsi
.Ltmp22970:
	adcq	%r11, %r15
.Ltmp22971:
	.loc	53 64 30 is_stmt 1
	movq	%r15, %rcx
.Ltmp22972:
	shldq	$13, %rsi, %r15
.Ltmp22973:
	shrq	$51, %rcx
.Ltmp22974:
	.loc	4 2612 13
	addq	-272(%rbp), %rdi
	adcq	-176(%rbp), %r8
.Ltmp22975:
	.loc	4 2612 13 is_stmt 0
	addq	-112(%rbp), %rdi
	adcq	-328(%rbp), %r8
.Ltmp22976:
	.loc	4 2612 13
	addq	-136(%rbp), %rdi
.Ltmp22977:
	adcq	-264(%rbp), %r8
.Ltmp22978:
	.loc	4 2612 13
	addq	%r15, %rdi
.Ltmp22979:
	adcq	%rcx, %r8
.Ltmp22980:
	.loc	53 65 30 is_stmt 1
	movq	%r8, %rcx
.Ltmp22981:
	shldq	$13, %rdi, %r8
.Ltmp22982:
	shrq	$51, %rcx
.Ltmp22983:
	.loc	4 2612 13
	addq	-104(%rbp), %r9
	adcq	-160(%rbp), %r13
.Ltmp22984:
	.loc	4 2612 13 is_stmt 0
	addq	-320(%rbp), %r9
.Ltmp22985:
	adcq	-80(%rbp), %r13
.Ltmp22986:
	.loc	4 2612 13
	addq	-464(%rbp), %r9
.Ltmp22987:
	adcq	-128(%rbp), %r13
.Ltmp22988:
	.loc	4 2612 13
	addq	-456(%rbp), %r9
.Ltmp22989:
	adcq	-472(%rbp), %r13
.Ltmp22990:
	.loc	4 2612 13
	addq	%r8, %r9
.Ltmp22991:
	adcq	%rcx, %r13
.Ltmp22992:
	.loc	53 66 30 is_stmt 1
	movq	%r13, %rcx
.Ltmp22993:
	shldq	$13, %r9, %r13
.Ltmp22994:
	shrq	$51, %rcx
.Ltmp22995:
	.loc	4 2612 13
	addq	-48(%rbp), %r10
	adcq	-56(%rbp), %r14
.Ltmp22996:
	.loc	4 2612 13 is_stmt 0
	addq	-120(%rbp), %r10
	adcq	-64(%rbp), %r14
.Ltmp22997:
	.loc	4 2612 13
	addq	-352(%rbp), %r10
.Ltmp22998:
	adcq	-288(%rbp), %r14
.Ltmp22999:
	.loc	4 2612 13
	addq	%rax, %r10
.Ltmp23000:
	adcq	%rdx, %r14
.Ltmp23001:
	.loc	4 2612 13
	addq	%r13, %r10
.Ltmp23002:
	adcq	%rcx, %r14
.Ltmp23003:
	.loc	4 0 13
	movabsq	$2251799813685247, %r8
.Ltmp23004:
	movq	%rbx, %r11
.Ltmp23005:
	.loc	27 72 17 is_stmt 1
	andq	%r8, %r11
.Ltmp23006:
	.loc	53 67 56
	movq	%r14, %rax
.Ltmp23007:
	shldq	$13, %r10, %rax
.Ltmp23008:
	shrq	$51, %r14
.Ltmp23009:
	.loc	4 2688 13
	leaq	(%r14,%r14,8), %rcx
.Ltmp23010:
	leaq	(%r14,%rcx,2), %rcx
	movl	$19, %edx
.Ltmp23011:
	mulq	%rdx
.Ltmp23012:
	.loc	4 2612 13
	addq	%r11, %rax
.Ltmp23013:
	adcq	%rcx, %rdx
.Ltmp23014:
	.loc	53 68 14
	andq	%r8, %rsi
.Ltmp23015:
	.loc	53 68 46 is_stmt 0
	shldq	$13, %rax, %rdx
.Ltmp23016:
	.loc	4 2612 13 is_stmt 1
	addq	%rsi, %rdx
.Ltmp23017:
	.loc	53 70 9
	andq	%r8, %rax
.Ltmp23018:
	.loc	53 72 9
	andq	%r8, %rdi
.Ltmp23019:
	.loc	53 73 9
	andq	%r8, %r9
.Ltmp23020:
	.loc	53 74 9
	andq	%r8, %r10
.Ltmp23021:
	.loc	51 75 18
	movq	%rax, -608(%rbp)
	movq	%rdx, -600(%rbp)
	movq	%rdi, -592(%rbp)
	movq	%r9, -584(%rbp)
	movq	%r10, -576(%rbp)
	leaq	-608(%rbp), %rsi
.Ltmp23022:
	.loc	51 0 18 is_stmt 0
	movq	-792(%rbp), %rbx
.Ltmp23023:
	.loc	51 76 21 is_stmt 1
	movq	%rbx, %rdi
	callq	_RNvMs0_NtCs4U4sOGKWW3b_12toyos_crypto10field25519NtB5_5Tight5bytes
.Ltmp23024:
	.loc	14 80 81
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -560(%rbp)
.Ltmp23025:
	.loc	6 2259 9
	movaps	-560(%rbp), %xmm1
	movaps	%xmm1, -608(%rbp)
.Ltmp23026:
	.loc	14 80 81
	movaps	%xmm0, -560(%rbp)
.Ltmp23027:
	.loc	6 2259 9
	movaps	-560(%rbp), %xmm1
	movaps	%xmm1, -592(%rbp)
.Ltmp23028:
	.loc	6 2259 9 is_stmt 0
	movb	$0, -576(%rbp)
.Ltmp23029:
	movb	$0, -575(%rbp)
.Ltmp23030:
	movb	$0, -574(%rbp)
.Ltmp23031:
	movb	$0, -573(%rbp)
.Ltmp23032:
	movb	$0, -572(%rbp)
.Ltmp23033:
	movb	$0, -571(%rbp)
.Ltmp23034:
	movb	$0, -570(%rbp)
.Ltmp23035:
	movb	$0, -569(%rbp)
.Ltmp23036:
	#MEMBARRIER
	.loc	14 80 81 is_stmt 1
	movaps	%xmm0, -560(%rbp)
.Ltmp23037:
	.loc	6 2259 9
	movaps	-560(%rbp), %xmm1
	movaps	%xmm1, -784(%rbp)
.Ltmp23038:
	.loc	14 80 81
	movaps	%xmm0, -560(%rbp)
.Ltmp23039:
	.loc	6 2259 9
	movaps	-560(%rbp), %xmm1
	leaq	-768(%rbp), %rax
	movups	%xmm1, (%rax)
.Ltmp23040:
	.loc	14 80 81
	movaps	%xmm0, -560(%rbp)
.Ltmp23041:
	.loc	6 2259 9
	movaps	-560(%rbp), %xmm1
	movups	%xmm1, 16(%rax)
.Ltmp23042:
	.loc	14 80 81
	movaps	%xmm0, -560(%rbp)
.Ltmp23043:
	.loc	6 2259 9
	movaps	-560(%rbp), %xmm1
	movups	%xmm1, 32(%rax)
.Ltmp23044:
	.loc	14 80 81
	movaps	%xmm0, -560(%rbp)
.Ltmp23045:
	.loc	6 2259 9
	movaps	-560(%rbp), %xmm1
	movups	%xmm1, 48(%rax)
.Ltmp23046:
	.loc	14 80 81
	movaps	%xmm0, -560(%rbp)
.Ltmp23047:
	.loc	6 2259 9
	movaps	-560(%rbp), %xmm1
	movaps	%xmm1, -704(%rbp)
.Ltmp23048:
	.loc	14 80 81
	movaps	%xmm0, -560(%rbp)
.Ltmp23049:
	.loc	6 2259 9
	movaps	-560(%rbp), %xmm1
	movaps	%xmm1, -688(%rbp)
.Ltmp23050:
	.loc	14 80 81
	movaps	%xmm0, -560(%rbp)
.Ltmp23051:
	.loc	6 2259 9
	movaps	-560(%rbp), %xmm1
	movaps	%xmm1, -672(%rbp)
.Ltmp23052:
	.loc	14 80 81
	movaps	%xmm0, -560(%rbp)
.Ltmp23053:
	.loc	6 2259 9
	movaps	-560(%rbp), %xmm1
	movaps	%xmm1, -656(%rbp)
.Ltmp23054:
	.loc	14 80 81
	movaps	%xmm0, -560(%rbp)
.Ltmp23055:
	.loc	6 2259 9
	movaps	-560(%rbp), %xmm0
	movaps	%xmm0, -640(%rbp)
.Ltmp23056:
	#MEMBARRIER
	.loc	51 77 2
	movq	%rbx, %rax
	.loc	51 77 2 epilogue_begin is_stmt 0
	addq	$840, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
.Ltmp23057:
	popq	%r14
.Ltmp23058:
	popq	%r15
.Ltmp23059:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp23060:
.Lfunc_end139:
	.size	_RNvNtCs4U4sOGKWW3b_12toyos_crypto6x255198multiply, .Lfunc_end139-_RNvNtCs4U4sOGKWW3b_12toyos_crypto6x255198multiply
	.cfi_endproc
