
$SCRATCH/poly1305-inline/image/fileserver-inc-c9a3f65e1:	file format elf64-x86-64

Disassembly of section .text:

000000000011c4d0 <toyos_crypto::arch::x86_64::poly1305::blocks>:
  11c4d0:      	pushq	%rbp
  11c4d1:      	movq	%rsp, %rbp
  11c4d4:      	pushq	%r15
  11c4d6:      	pushq	%r14
  11c4d8:      	pushq	%r13
  11c4da:      	pushq	%r12
  11c4dc:      	pushq	%rbx
  11c4dd:      	andq	$-0x20, %rsp
  11c4e1:      	subq	$0x580, %rsp            # imm = 0x580
  11c4e8:      	movq	%rcx, %r10
  11c4eb:      	shrq	$0x3, %r10
  11c4ef:      	je	0x11d46b <toyos_crypto::arch::x86_64::poly1305::blocks+0xf9b>
  11c4f5:      	movq	%rdx, %r8
  11c4f8:      	movq	%rcx, 0x138(%rsp)
  11c500:      	movq	(%rsi), %rcx
  11c503:      	movq	0x8(%rsi), %rax
  11c507:      	movl	%ecx, %edx
  11c509:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  11c50f:      	movl	%edx, 0xa0(%rsp)
  11c516:      	movq	%rax, %rdx
  11c519:      	shldq	$0xc, %rcx, %rdx
  11c51e:      	shrq	$0x1a, %rcx
  11c522:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  11c528:      	movq	%rcx, 0x80(%rsp)
  11c530:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  11c536:      	movq	%rdx, 0x180(%rsp)
  11c53e:      	shrq	$0xe, %rax
  11c542:      	movq	%rax, %r9
  11c545:      	movq	(%rdi), %r15
  11c548:      	movq	0x8(%rdi), %rax
  11c54c:      	movq	%rax, %rbx
  11c54f:      	mulq	%r15
  11c552:      	movq	%rdx, %rcx
  11c555:      	movq	%rax, %r11
  11c558:      	shldq	$0x1, %rax, %rcx
  11c55d:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
  11c564:      	movq	%r9, 0x160(%rsp)
  11c56c:      	addq	%rax, %r11
  11c56f:      	movq	0x10(%rdi), %rax
  11c573:      	movq	%rax, 0x60(%rsp)
  11c578:      	mulq	%rbx
  11c57b:      	movq	%rbx, 0x40(%rsp)
  11c580:      	movq	%rdx, %rdi
  11c583:      	movq	%rax, %r9
  11c586:      	movq	%r15, %rax
  11c589:      	mulq	%r15
  11c58c:      	movq	%rdx, %r13
  11c58f:      	addq	%r9, %rax
  11c592:      	adcq	%rdi, %r13
  11c595:      	addq	%r11, %r13
  11c598:      	adcq	$0x0, %rcx
  11c59c:      	movl	%ecx, %edi
  11c59e:      	andl	$0x3, %edi
  11c5a1:      	shrq	$0x2, %rcx
  11c5a5:      	leaq	(%rcx,%rcx,4), %r12
  11c5a9:      	addq	%rax, %r12
  11c5ac:      	adcq	$0x0, %r13
  11c5b0:      	movq	%rdi, %r14
  11c5b3:      	adcq	$0x0, %r14
  11c5b7:      	movq	%r14, 0x100(%rsp)
  11c5bf:      	movq	%r13, %rax
  11c5c2:      	movq	%r13, 0x140(%rsp)
  11c5ca:      	mulq	%r15
  11c5cd:      	movq	%rax, %r11
  11c5d0:      	movq	%rdx, %rdi
  11c5d3:      	imulq	%r15, %r14
  11c5d7:      	movq	%r12, %rax
  11c5da:      	movq	%r12, 0x1a0(%rsp)
  11c5e2:      	mulq	%rbx
  11c5e5:      	movq	%rdx, %rcx
  11c5e8:      	movq	%rax, %r9
  11c5eb:      	addq	%r11, %r9
  11c5ee:      	adcq	%rdi, %rcx
  11c5f1:      	movq	%r13, %rax
  11c5f4:      	movq	0x60(%rsp), %r13
  11c5f9:      	mulq	%r13
  11c5fc:      	movq	%rdx, %rdi
  11c5ff:      	movq	%rsi, 0x130(%rsp)
  11c607:      	movq	%rax, %r11
  11c60a:      	movq	%r12, %rax
  11c60d:      	mulq	%r15
  11c610:      	movq	%rdx, %rbx
  11c613:      	movq	%rax, %rsi
  11c616:      	addq	%r11, %rsi
  11c619:      	adcq	%rdi, %rbx
  11c61c:      	addq	%r9, %rbx
  11c61f:      	adcq	$0x0, %rcx
  11c623:      	movq	0x100(%rsp), %rax
  11c62b:      	mulq	%r13
  11c62e:      	addq	%rbx, %rax
  11c631:      	adcq	%rcx, %rdx
  11c634:      	addq	%r14, %rdx
  11c637:      	movl	%edx, %r12d
  11c63a:      	andl	$0x3, %r12d
  11c63e:      	shrq	$0x2, %rdx
  11c642:      	leaq	(%rdx,%rdx,4), %rbx
  11c646:      	addq	%rsi, %rbx
  11c649:      	adcq	$0x0, %rax
  11c64d:      	adcq	$0x0, %r12
  11c651:      	movq	%rax, %r11
  11c654:      	movq	%rax, 0x1e0(%rsp)
  11c65c:      	mulq	%r15
  11c65f:      	movq	%rax, %rcx
  11c662:      	movq	%rdx, %rdi
  11c665:      	movq	%r12, %r14
  11c668:      	movq	%r12, 0x200(%rsp)
  11c670:      	imulq	%r15, %r14
  11c674:      	movq	%rbx, 0x1c0(%rsp)
  11c67c:      	movq	%rbx, %rax
  11c67f:      	mulq	0x40(%rsp)
  11c684:      	movq	%rdx, %rsi
  11c687:      	movq	%rax, %r9
  11c68a:      	addq	%rcx, %r9
  11c68d:      	adcq	%rdi, %rsi
  11c690:      	movq	%r11, %rax
  11c693:      	mulq	%r13
  11c696:      	movq	%rdx, %rcx
  11c699:      	movq	%rax, %r11
  11c69c:      	movq	%rbx, %rax
  11c69f:      	mulq	%r15
  11c6a2:      	movq	%rdx, %rbx
  11c6a5:      	movq	%rax, %rdi
  11c6a8:      	addq	%r11, %rdi
  11c6ab:      	adcq	%rcx, %rbx
  11c6ae:      	addq	%r9, %rbx
  11c6b1:      	adcq	$0x0, %rsi
  11c6b5:      	movq	%r12, %rax
  11c6b8:      	mulq	%r13
  11c6bb:      	addq	%rbx, %rax
  11c6be:      	adcq	%rsi, %rdx
  11c6c1:      	addq	%r14, %rdx
  11c6c4:      	movq	%rdx, %rcx
  11c6c7:      	shrq	$0x2, %rcx
  11c6cb:      	leaq	(%rcx,%rcx,4), %rbx
  11c6cf:      	andl	$0x3, %edx
  11c6d2:      	movq	%rdx, %rsi
  11c6d5:      	addq	%rdi, %rbx
  11c6d8:      	movq	%rax, %rcx
  11c6db:      	adcq	$0x0, %rcx
  11c6df:      	adcq	$0x0, %rsi
  11c6e3:      	movq	%rsi, %r12
  11c6e6:      	movq	%rbx, %rax
  11c6e9:      	movq	%rbx, 0x220(%rsp)
  11c6f1:      	movq	%r15, %r14
  11c6f4:      	mulq	%r15
  11c6f7:      	movq	%rdx, %r9
  11c6fa:      	movq	%rax, %r11
  11c6fd:      	movq	%rcx, %rax
  11c700:      	movq	%rcx, 0x260(%rsp)
  11c708:      	mulq	%r13
  11c70b:      	movq	%rdx, %rdi
  11c70e:      	movq	%rax, %rsi
  11c711:      	addq	%r11, %rsi
  11c714:      	adcq	%r9, %rdi
  11c717:      	movq	%rbx, %rax
  11c71a:      	movq	0x40(%rsp), %r15
  11c71f:      	mulq	%r15
  11c722:      	movq	%rdx, %r11
  11c725:      	movq	%rax, %rbx
  11c728:      	movq	%rcx, %rax
  11c72b:      	mulq	%r14
  11c72e:      	movq	%r14, %r9
  11c731:      	movq	%rdx, %r14
  11c734:      	movq	%rax, %rcx
  11c737:      	addq	%rbx, %rcx
  11c73a:      	adcq	%r11, %r14
  11c73d:      	movq	%r12, 0x240(%rsp)
  11c745:      	movq	%r12, %rax
  11c748:      	mulq	%r13
  11c74b:      	addq	%rdi, %rcx
  11c74e:      	adcq	$0x0, %r14
  11c752:      	addq	%rax, %rcx
  11c755:      	movq	%rcx, %rdi
  11c758:      	adcq	%rdx, %r14
  11c75b:      	movq	%r12, %rcx
  11c75e:      	movq	%r9, %r11
  11c761:      	imulq	%r9, %rcx
  11c765:      	addq	%r14, %rcx
  11c768:      	movq	%rcx, %rax
  11c76b:      	shrq	$0x2, %rax
  11c76f:      	leaq	(%rax,%rax,4), %rax
  11c773:      	andl	$0x3, %ecx
  11c776:      	addq	%rsi, %rax
  11c779:      	movq	%rdi, %r14
  11c77c:      	adcq	$0x0, %r14
  11c780:      	adcq	$0x0, %rcx
  11c784:      	movq	%rcx, %r9
  11c787:      	movq	%rax, %rcx
  11c78a:      	movq	%rax, 0x2a0(%rsp)
  11c792:      	mulq	%r11
  11c795:      	movq	%r11, %r12
  11c798:      	movq	%rdx, %r11
  11c79b:      	movq	%rax, %rbx
  11c79e:      	movq	%r14, %rax
  11c7a1:      	movq	%r14, 0x2c0(%rsp)
  11c7a9:      	mulq	%r13
  11c7ac:      	movq	%rdx, %rdi
  11c7af:      	movq	%rax, %rsi
  11c7b2:      	addq	%rbx, %rsi
  11c7b5:      	adcq	%r11, %rdi
  11c7b8:      	movq	%rcx, %rax
  11c7bb:      	mulq	%r15
  11c7be:      	movq	%rdx, %r11
  11c7c1:      	movq	%rax, %rbx
  11c7c4:      	movq	%r14, %rax
  11c7c7:      	mulq	%r12
  11c7ca:      	movq	%r12, %rcx
  11c7cd:      	movq	%rdx, %r12
  11c7d0:      	movq	%rax, %r15
  11c7d3:      	addq	%rbx, %r15
  11c7d6:      	adcq	%r11, %r12
  11c7d9:      	movq	%r9, 0x2e0(%rsp)
  11c7e1:      	movq	%r9, %rax
  11c7e4:      	mulq	%r13
  11c7e7:      	addq	%rdi, %r15
  11c7ea:      	adcq	$0x0, %r12
  11c7ee:      	addq	%rax, %r15
  11c7f1:      	adcq	%rdx, %r12
  11c7f4:      	movq	%r9, %rdx
  11c7f7:      	imulq	%rcx, %rdx
  11c7fb:      	addq	%r12, %rdx
  11c7fe:      	movq	%rdx, %rax
  11c801:      	shrq	$0x2, %rax
  11c805:      	leaq	(%rax,%rax,4), %rbx
  11c809:      	andl	$0x3, %edx
  11c80c:      	addq	%rsi, %rbx
  11c80f:      	adcq	$0x0, %r15
  11c813:      	adcq	$0x0, %rdx
  11c817:      	movq	%rdx, 0xe0(%rsp)
  11c81f:      	movq	%rbx, %rax
  11c822:      	movq	%rbx, 0xc0(%rsp)
  11c82a:      	mulq	%rcx
  11c82d:      	movq	%rdx, %rsi
  11c830:      	movq	%rax, %r11
  11c833:      	movq	%r15, %rax
  11c836:      	mulq	%r13
  11c839:      	movq	%r13, %r9
  11c83c:      	movq	%rdx, %rdi
  11c83f:      	movq	%rax, %r13
  11c842:      	addq	%r11, %r13
  11c845:      	adcq	%rsi, %rdi
  11c848:      	movq	%rbx, %rax
  11c84b:      	mulq	0x40(%rsp)
  11c850:      	movq	%rdx, %r11
  11c853:      	movq	%rax, %rbx
  11c856:      	movq	%r15, %rax
  11c859:      	mulq	%rcx
  11c85c:      	movq	%rdx, %r12
  11c85f:      	movq	%rax, %r14
  11c862:      	addq	%rbx, %r14
  11c865:      	adcq	%r11, %r12
  11c868:      	movq	0xe0(%rsp), %rbx
  11c870:      	movq	%rbx, %rax
  11c873:      	movq	%r9, %r11
  11c876:      	mulq	%r9
  11c879:      	addq	%rdi, %r14
  11c87c:      	adcq	$0x0, %r12
  11c880:      	addq	%rax, %r14
  11c883:      	adcq	%rdx, %r12
  11c886:      	imulq	%rcx, %rbx
  11c88a:      	addq	%r12, %rbx
  11c88d:      	movq	%rbx, %rax
  11c890:      	shrq	$0x2, %rax
  11c894:      	leaq	(%rax,%rax,4), %r9
  11c898:      	andl	$0x3, %ebx
  11c89b:      	addq	%r13, %r9
  11c89e:      	adcq	$0x0, %r14
  11c8a2:      	adcq	$0x0, %rbx
  11c8a6:      	movq	%r9, %rax
  11c8a9:      	mulq	%rcx
  11c8ac:      	movq	%rcx, %rsi
  11c8af:      	movq	%rdx, %r13
  11c8b2:      	movq	%rax, %rcx
  11c8b5:      	movq	%r14, %rax
  11c8b8:      	mulq	%r11
  11c8bb:      	movq	%rdx, %r12
  11c8be:      	movq	%rax, %r11
  11c8c1:      	addq	%rcx, %r11
  11c8c4:      	adcq	%r13, %r12
  11c8c7:      	movq	%r9, %rax
  11c8ca:      	mulq	0x40(%rsp)
  11c8cf:      	movq	%rdx, %rcx
  11c8d2:      	movq	%rax, %r13
  11c8d5:      	movq	%r14, %rax
  11c8d8:      	mulq	%rsi
  11c8db:      	movq	%rsi, 0x280(%rsp)
  11c8e3:      	movq	%rdx, %rdi
  11c8e6:      	addq	%r13, %rax
  11c8e9:      	movq	%rax, %r13
  11c8ec:      	adcq	%rcx, %rdi
  11c8ef:      	movq	%rbx, %rax
  11c8f2:      	mulq	0x60(%rsp)
  11c8f7:      	addq	%r12, %r13
  11c8fa:      	adcq	$0x0, %rdi
  11c8fe:      	addq	%rax, %r13
  11c901:      	adcq	%rdx, %rdi
  11c904:      	movq	%rbx, %rdx
  11c907:      	imulq	%rsi, %rdx
  11c90b:      	addq	%rdi, %rdx
  11c90e:      	movq	%rdx, %rax
  11c911:      	shrq	$0x2, %rax
  11c915:      	leaq	(%rax,%rax,4), %rax
  11c919:      	andl	$0x3, %edx
  11c91c:      	addq	%r11, %rax
  11c91f:      	adcq	$0x0, %r13
  11c923:      	adcq	$0x0, %rdx
  11c927:      	movl	%eax, %ecx
  11c929:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  11c92f:      	movq	%r13, %rdi
  11c932:      	shldq	$0xc, %rax, %rdi
  11c937:      	shrq	$0x1a, %rax
  11c93b:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  11c940:      	shldq	$0x18, %r13, %rdx
  11c945:      	andl	$0x3ffffff, %edi        # imm = 0x3FFFFFF
  11c94b:      	shrq	$0xe, %r13
  11c94f:      	andl	$0x3ffffff, %r13d       # imm = 0x3FFFFFF
  11c956:      	movq	%rcx, (%rsp)
  11c95a:      	movq	%rax, 0x8(%rsp)
  11c95f:      	movq	%rdi, 0x10(%rsp)
  11c964:      	movq	%r13, 0x18(%rsp)
  11c969:      	movq	%rdx, 0x20(%rsp)
  11c96e:      	movq	%rcx, 0x28(%rsp)
  11c973:      	movq	%rax, 0x30(%rsp)
  11c978:      	movq	%rdi, 0x38(%rsp)
  11c97d:      	vmovups	(%rsp), %ymm0
  11c982:      	vmovaps	%ymm0, 0x300(%rsp)
  11c98b:      	vmovdqu	0x8(%rsp), %ymm12
  11c991:      	vmovdqu	0x10(%rsp), %ymm13
  11c997:      	vmovdqu	0x18(%rsp), %ymm14
  11c99d:      	vmovdqu	0x20(%rsp), %ymm15
  11c9a3:      	movq	0xc0(%rsp), %r11
  11c9ab:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
  11c9b2:      	movq	%rcx, 0x60(%rsp)
  11c9b7:      	movq	%rcx, (%rsp)
  11c9bb:      	movq	%rax, 0x8(%rsp)
  11c9c0:      	movq	%rdi, 0x10(%rsp)
  11c9c5:      	movq	%r13, 0x18(%rsp)
  11c9ca:      	movq	%rdx, 0x20(%rsp)
  11c9cf:      	movq	%r11, 0x28(%rsp)
  11c9d4:      	vmovdqu	(%rsp), %xmm4
  11c9d9:      	vmovdqu	0x8(%rsp), %xmm3
  11c9df:      	vmovdqu	0x10(%rsp), %xmm2
  11c9e5:      	vmovdqu	0x18(%rsp), %xmm1
  11c9eb:      	vmovdqu	0x20(%rsp), %xmm0
  11c9f1:      	movq	0x220(%rsp), %rcx
  11c9f9:      	movl	%ecx, %r12d
  11c9fc:      	andl	$0x3ffffff, %r12d       # imm = 0x3FFFFFF
  11ca03:      	movq	%r12, (%rsp)
  11ca07:      	movq	0x260(%rsp), %rsi
  11ca0f:      	movq	%rsi, %r12
  11ca12:      	shldq	$0xc, %rcx, %r12
  11ca17:      	shrq	$0x1a, %rcx
  11ca1b:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  11ca21:      	movq	%rcx, 0x8(%rsp)
  11ca26:      	andl	$0x3ffffff, %r12d       # imm = 0x3FFFFFF
  11ca2d:      	movq	%r12, 0x10(%rsp)
  11ca32:      	movq	%rsi, %rcx
  11ca35:      	movq	0x240(%rsp), %rsi
  11ca3d:      	shldq	$0x18, %rcx, %rsi
  11ca42:      	shrq	$0xe, %rcx
  11ca46:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  11ca4c:      	movq	%rcx, 0x18(%rsp)
  11ca51:      	movq	%rsi, 0x20(%rsp)
  11ca56:      	vpinsrq	$0x1, %r11, %xmm4, %xmm4
  11ca5c:      	movl	%r9d, %r11d
  11ca5f:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
  11ca66:      	vmovq	%r11, %xmm5
  11ca6b:      	movq	%r15, %r11
  11ca6e:      	movq	0xc0(%rsp), %rcx
  11ca76:      	shldq	$0xc, %rcx, %r11
  11ca7b:      	shrq	$0x1a, %rcx
  11ca7f:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  11ca85:      	vpinsrq	$0x1, %rcx, %xmm3, %xmm3
  11ca8b:      	movq	0x2a0(%rsp), %rcx
  11ca93:      	movl	%ecx, %r12d
  11ca96:      	andl	$0x3ffffff, %r12d       # imm = 0x3FFFFFF
  11ca9d:      	vmovq	%r12, %xmm8
  11caa2:      	movq	%r14, %r12
  11caa5:      	shldq	$0xc, %r9, %r12
  11caaa:      	shrq	$0x1a, %r9
  11caae:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
  11cab5:      	vmovq	%r9, %xmm6
  11caba:      	movq	0x2c0(%rsp), %rsi
  11cac2:      	movq	%rsi, %r9
  11cac5:      	shldq	$0xc, %rcx, %r9
  11caca:      	shrq	$0x1a, %rcx
  11cace:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  11cad4:      	vmovq	%rcx, %xmm10
  11cad9:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
  11cae0:      	vpinsrq	$0x1, %r11, %xmm2, %xmm7
  11cae6:      	andl	$0x3ffffff, %r12d       # imm = 0x3FFFFFF
  11caed:      	vmovq	%r12, %xmm9
  11caf2:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
  11caf9:      	vmovq	%r9, %xmm2
  11cafe:      	movq	0xe0(%rsp), %r9
  11cb06:      	shldq	$0x18, %r15, %r9
  11cb0b:      	shrq	$0xe, %r15
  11cb0f:      	andl	$0x3ffffff, %r15d       # imm = 0x3FFFFFF
  11cb16:      	vpinsrq	$0x1, %r15, %xmm1, %xmm1
  11cb1c:      	shldq	$0x18, %r14, %rbx
  11cb21:      	shrq	$0xe, %r14
  11cb25:      	andl	$0x3ffffff, %r14d       # imm = 0x3FFFFFF
  11cb2c:      	vpbroadcastq	%xmm5, %ymm5
  11cb31:      	vpblendd	$0x30, %ymm5, %ymm4, %ymm4 # ymm4 = ymm4[0,1,2,3],ymm5[4,5],ymm4[6,7]
  11cb37:      	vmovq	%r14, %xmm5
  11cb3c:      	movq	0x2e0(%rsp), %rcx
  11cb44:      	shldq	$0x18, %rsi, %rcx
  11cb49:      	shrq	$0xe, %rsi
  11cb4d:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  11cb53:      	vpbroadcastq	%xmm8, %ymm8
  11cb58:      	vpblendd	$0xc0, %ymm8, %ymm4, %ymm4 # ymm4 = ymm4[0,1,2,3,4,5],ymm8[6,7]
  11cb5e:      	vmovdqa	%ymm4, 0x540(%rsp)
  11cb67:      	vmovq	%rsi, %xmm4
  11cb6c:      	vpinsrq	$0x1, %r9, %xmm0, %xmm0
  11cb72:      	vpbroadcastq	%xmm6, %ymm6
  11cb77:      	vpblendd	$0x30, %ymm6, %ymm3, %ymm3 # ymm3 = ymm3[0,1,2,3],ymm6[4,5],ymm3[6,7]
  11cb7d:      	vmovq	%rbx, %xmm6
  11cb82:      	vpbroadcastq	%xmm10, %ymm8
  11cb87:      	vpblendd	$0xc0, %ymm8, %ymm3, %ymm10 # ymm10 = ymm3[0,1,2,3,4,5],ymm8[6,7]
  11cb8d:      	vmovq	%rcx, %xmm3
  11cb92:      	movq	0x1a0(%rsp), %r11
  11cb9a:      	movl	%r11d, %esi
  11cb9d:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  11cba3:      	movq	%rsi, 0x28(%rsp)
  11cba8:      	vpbroadcastq	%xmm9, %ymm8
  11cbad:      	vpblendd	$0x30, %ymm8, %ymm7, %ymm7 # ymm7 = ymm7[0,1,2,3],ymm8[4,5],ymm7[6,7]
  11cbb3:      	vmovdqu	(%rsp), %xmm8
  11cbb8:      	vpinsrq	$0x1, %rsi, %xmm8, %xmm8
  11cbbe:      	vpbroadcastq	%xmm2, %ymm2
  11cbc3:      	vpblendd	$0xc0, %ymm2, %ymm7, %ymm7 # ymm7 = ymm7[0,1,2,3,4,5],ymm2[6,7]
  11cbc9:      	movq	0x1c0(%rsp), %r12
  11cbd1:      	movl	%r12d, %esi
  11cbd4:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  11cbda:      	vmovq	%rsi, %xmm2
  11cbdf:      	movq	0x140(%rsp), %rbx
  11cbe7:      	movq	%rbx, %r9
  11cbea:      	shldq	$0xc, %r11, %r9
  11cbef:      	vpbroadcastq	%xmm5, %ymm5
  11cbf4:      	vpblendd	$0x30, %ymm5, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm5[4,5],ymm1[6,7]
  11cbfa:      	movq	0x280(%rsp), %r15
  11cc02:      	movl	%r15d, %esi
  11cc05:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  11cc0b:      	vmovq	%rsi, %xmm5
  11cc10:      	movq	%r11, %rsi
  11cc13:      	shrq	$0x1a, %rsi
  11cc17:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  11cc1d:      	vpbroadcastq	%xmm4, %ymm4
  11cc22:      	vpblendd	$0xc0, %ymm4, %ymm1, %ymm9 # ymm9 = ymm1[0,1,2,3,4,5],ymm4[6,7]
  11cc28:      	vmovdqu	0x8(%rsp), %xmm1
  11cc2e:      	vpinsrq	$0x1, %rsi, %xmm1, %xmm1
  11cc34:      	vpbroadcastq	%xmm6, %ymm4
  11cc39:      	movq	0x1e0(%rsp), %r14
  11cc41:      	movq	%r14, %rsi
  11cc44:      	movq	%r12, %r11
  11cc47:      	shldq	$0xc, %r12, %rsi
  11cc4c:      	vpblendd	$0x30, %ymm4, %ymm0, %ymm4 # ymm4 = ymm0[0,1,2,3],ymm4[4,5],ymm0[6,7]
  11cc52:      	shrq	$0x1a, %r11
  11cc56:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
  11cc5d:      	vmovq	%r11, %xmm0
  11cc62:      	vpbroadcastq	%xmm3, %ymm3
  11cc67:      	movq	0x40(%rsp), %r12
  11cc6c:      	movq	%r12, %r11
  11cc6f:      	shldq	$0xc, %r15, %r11
  11cc74:      	vpblendd	$0xc0, %ymm3, %ymm4, %ymm6 # ymm6 = ymm4[0,1,2,3,4,5],ymm3[6,7]
  11cc7a:      	shrq	$0x1a, %r15
  11cc7e:      	andl	$0x3ffffff, %r15d       # imm = 0x3FFFFFF
  11cc85:      	vmovq	%r15, %xmm3
  11cc8a:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
  11cc91:      	vpbroadcastq	%xmm2, %ymm2
  11cc96:      	vpblendd	$0x30, %ymm2, %ymm8, %ymm2 # ymm2 = ymm8[0,1,2,3],ymm2[4,5],ymm8[6,7]
  11cc9c:      	vmovdqu	0x10(%rsp), %xmm4
  11cca2:      	vpinsrq	$0x1, %r9, %xmm4, %xmm4
  11cca8:      	vpbroadcastq	%xmm5, %ymm5
  11ccad:      	vpblendd	$0xc0, %ymm5, %ymm2, %ymm2 # ymm2 = ymm2[0,1,2,3,4,5],ymm5[6,7]
  11ccb3:      	vmovdqa	%ymm2, 0x500(%rsp)
  11ccbc:      	vmovdqu	0x18(%rsp), %xmm2
  11ccc2:      	movq	%rbx, %r9
  11ccc5:      	movq	0x100(%rsp), %rbx
  11cccd:      	shldq	$0x18, %r9, %rbx
  11ccd2:      	shrq	$0xe, %r9
  11ccd6:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
  11ccdd:      	vpinsrq	$0x1, %r9, %xmm2, %xmm2
  11cce3:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  11cce9:      	movq	%r14, %r9
  11ccec:      	movq	0x200(%rsp), %r14
  11ccf4:      	shldq	$0x18, %r9, %r14
  11ccf9:      	vpbroadcastq	%xmm0, %ymm0
  11ccfe:      	vpblendd	$0x30, %ymm0, %ymm1, %ymm0 # ymm0 = ymm1[0,1,2,3],ymm0[4,5],ymm1[6,7]
  11cd04:      	vmovq	%rsi, %xmm1
  11cd09:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
  11cd10:      	vpbroadcastq	%xmm3, %ymm3
  11cd15:      	vpblendd	$0xc0, %ymm3, %ymm0, %ymm5 # ymm5 = ymm0[0,1,2,3,4,5],ymm3[6,7]
  11cd1b:      	vmovq	%r11, %xmm0
  11cd20:      	movq	0x130(%rsp), %r11
  11cd28:      	shrq	$0xe, %r9
  11cd2c:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
  11cd33:      	vpbroadcastq	%xmm1, %ymm1
  11cd38:      	vpblendd	$0x30, %ymm1, %ymm4, %ymm1 # ymm1 = ymm4[0,1,2,3],ymm1[4,5],ymm4[6,7]
  11cd3e:      	vmovq	%r9, %xmm3
  11cd43:      	vpbroadcastq	%xmm0, %ymm0
  11cd48:      	vpblendd	$0xc0, %ymm0, %ymm1, %ymm4 # ymm4 = ymm1[0,1,2,3,4,5],ymm0[6,7]
  11cd4e:      	vmovdqu	0x20(%rsp), %xmm0
  11cd54:      	vpinsrq	$0x1, %rbx, %xmm0, %xmm0
  11cd5a:      	movq	%r12, %r9
  11cd5d:      	movq	%r12, %rsi
  11cd60:      	shrq	$0xe, %rsi
  11cd64:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  11cd6a:      	vpbroadcastq	%xmm3, %ymm1
  11cd6f:      	vpblendd	$0x30, %ymm1, %ymm2, %ymm1 # ymm1 = ymm2[0,1,2,3],ymm1[4,5],ymm2[6,7]
  11cd75:      	vmovq	%rsi, %xmm2
  11cd7a:      	vpbroadcastq	%xmm2, %ymm2
  11cd7f:      	vpblendd	$0xc0, %ymm2, %ymm1, %ymm2 # ymm2 = ymm1[0,1,2,3,4,5],ymm2[6,7]
  11cd85:      	vmovq	%r14, %xmm1
  11cd8a:      	decq	%r10
  11cd8d:      	shrq	$0x28, %r9
  11cd91:      	vpbroadcastq	%xmm1, %ymm1
  11cd96:      	vpblendd	$0x30, %ymm1, %ymm0, %ymm0 # ymm0 = ymm0[0,1,2,3],ymm1[4,5],ymm0[6,7]
  11cd9c:      	vmovq	%r9, %xmm1
  11cda1:      	movq	%r10, %rsi
  11cda4:      	shlq	$0x7, %rsi
  11cda8:      	addq	%r8, %rsi
  11cdab:      	vpbroadcastq	%xmm1, %ymm1
  11cdb0:      	vpblendd	$0xc0, %ymm1, %ymm0, %ymm1 # ymm1 = ymm0[0,1,2,3,4,5],ymm1[6,7]
  11cdb6:      	vpsllq	$0x2, %ymm10, %ymm0
  11cdbc:      	vmovdqa	%ymm10, 0x520(%rsp)
  11cdc5:      	vpaddq	%ymm0, %ymm10, %ymm0
  11cdc9:      	vmovdqa	%ymm0, 0x320(%rsp)
  11cdd2:      	vpsllq	$0x2, %ymm7, %ymm0
  11cdd7:      	vmovdqa	%ymm7, 0x4a0(%rsp)
  11cde0:      	vpaddq	%ymm7, %ymm0, %ymm0
  11cde4:      	vmovdqa	%ymm0, 0x340(%rsp)
  11cded:      	vpsllq	$0x2, %ymm9, %ymm0
  11cdf3:      	vmovdqa	%ymm9, 0x440(%rsp)
  11cdfc:      	vpaddq	%ymm0, %ymm9, %ymm0
  11ce00:      	vmovdqa	%ymm0, 0x360(%rsp)
  11ce09:      	vpsllq	$0x2, %ymm6, %ymm0
  11ce0e:      	vmovdqa	%ymm6, 0x420(%rsp)
  11ce17:      	vpaddq	%ymm6, %ymm0, %ymm0
  11ce1b:      	vmovdqa	%ymm0, 0x380(%rsp)
  11ce24:      	vpsllq	$0x2, %ymm5, %ymm0
  11ce29:      	vmovdqa	%ymm5, 0x4e0(%rsp)
  11ce32:      	vpaddq	%ymm5, %ymm0, %ymm0
  11ce36:      	vmovdqa	%ymm0, 0x3a0(%rsp)
  11ce3f:      	vpsllq	$0x2, %ymm4, %ymm0
  11ce44:      	vmovdqa	%ymm4, 0x4c0(%rsp)
  11ce4d:      	vpaddq	%ymm4, %ymm0, %ymm0
  11ce51:      	vmovdqa	%ymm0, 0x3c0(%rsp)
  11ce5a:      	vpsllq	$0x2, %ymm2, %ymm0
  11ce5f:      	vmovdqa	%ymm2, 0x480(%rsp)
  11ce68:      	vpaddq	%ymm2, %ymm0, %ymm0
  11ce6c:      	vmovdqa	%ymm0, 0x3e0(%rsp)
  11ce75:      	vpsllq	$0x2, %ymm1, %ymm0
  11ce7a:      	vmovdqa	%ymm1, 0x460(%rsp)
  11ce83:      	vpaddq	%ymm1, %ymm0, %ymm0
  11ce87:      	vmovdqa	%ymm0, 0x400(%rsp)
  11ce90:      	vmovd	0xa0(%rsp), %xmm5
  11ce99:      	vmovd	0x80(%rsp), %xmm11
  11cea2:      	vmovd	0x180(%rsp), %xmm8
  11ceab:      	vmovd	0x160(%rsp), %xmm6
  11ceb4:      	vmovq	0xd(%r11), %xmm10
  11ceba:      	testq	%r10, %r10
  11cebd:      	vmovdqa	%ymm6, 0xa0(%rsp)
  11cec6:      	vmovdqa	%ymm8, 0x80(%rsp)
  11cecf:      	je	0x11d472 <toyos_crypto::arch::x86_64::poly1305::blocks+0xfa2>
  11ced5:      	vpinsrq	$0x1, %rdx, %xmm15, %xmm0
  11cedb:      	vmovq	%rdx, %xmm1
  11cee0:      	vpbroadcastq	%xmm1, %ymm1
  11cee5:      	vpblendd	$0xf0, %ymm1, %ymm0, %ymm1 # ymm1 = ymm0[0,1,2,3],ymm1[4,5,6,7]
  11ceeb:      	vpsllq	$0x2, %ymm1, %ymm0
  11cef0:      	vmovdqa	%ymm1, 0x180(%rsp)
  11cef9:      	vpaddq	%ymm1, %ymm0, %ymm0
  11cefd:      	vmovdqa	%ymm0, 0x260(%rsp)
  11cf06:      	vpinsrq	$0x1, %r13, %xmm14, %xmm0
  11cf0c:      	vmovq	%r13, %xmm1
  11cf11:      	vpbroadcastq	%xmm1, %ymm1
  11cf16:      	vpblendd	$0xf0, %ymm1, %ymm0, %ymm2 # ymm2 = ymm0[0,1,2,3],ymm1[4,5,6,7]
  11cf1c:      	vpsllq	$0x2, %ymm2, %ymm0
  11cf21:      	vpinsrq	$0x1, %rdi, %xmm13, %xmm1
  11cf27:      	vmovdqa	%ymm2, 0x160(%rsp)
  11cf30:      	vpaddq	%ymm2, %ymm0, %ymm0
  11cf34:      	vmovdqa	%ymm0, 0x140(%rsp)
  11cf3d:      	vmovq	%rdi, %xmm0
  11cf42:      	vpbroadcastq	%xmm0, %ymm0
  11cf47:      	vpblendd	$0xf0, %ymm0, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm0[4,5,6,7]
  11cf4d:      	vpsllq	$0x2, %ymm1, %ymm0
  11cf52:      	vmovdqa	%ymm1, 0x200(%rsp)
  11cf5b:      	vpaddq	%ymm1, %ymm0, %ymm0
  11cf5f:      	vmovdqa	%ymm0, 0x1e0(%rsp)
  11cf68:      	vpinsrq	$0x1, %rax, %xmm12, %xmm0
  11cf6e:      	vmovq	%rax, %xmm3
  11cf73:      	vpbroadcastq	%xmm3, %ymm3
  11cf78:      	vpblendd	$0xf0, %ymm3, %ymm0, %ymm1 # ymm1 = ymm0[0,1,2,3],ymm3[4,5,6,7]
  11cf7e:      	vpsllq	$0x2, %ymm1, %ymm0
  11cf83:      	vmovdqa	%ymm1, 0x240(%rsp)
  11cf8c:      	vpaddq	%ymm1, %ymm0, %ymm0
  11cf90:      	vmovdqa	%ymm0, 0x1c0(%rsp)
  11cf99:      	movq	0x60(%rsp), %rax
  11cf9e:      	vmovdqa	0x300(%rsp), %ymm0
  11cfa7:      	vpinsrq	$0x1, %rax, %xmm0, %xmm0
  11cfad:      	vmovq	%rax, %xmm4
  11cfb2:      	vpbroadcastq	%xmm4, %ymm4
  11cfb7:      	vpblendd	$0xf0, %ymm4, %ymm0, %ymm0 # ymm0 = ymm0[0,1,2,3],ymm4[4,5,6,7]
  11cfbd:      	vmovdqa	%ymm0, 0x220(%rsp)
  11cfc6:      	addq	$0x70, %r8
  11cfca:      	vpxor	%xmm0, %xmm0, %xmm0
  11cfce:      	vmovdqa	%ymm0, 0x60(%rsp)
  11cfd4:      	vpbroadcastq	-0xfb125(%rip), %ymm9 # 0x21eb8 <anon.f38ad35d6d2ee76e3558f602796c28fe.4.llvm.8446273095851839105+0x68>
  11cfdd:      	vpbroadcastq	-0xfb0ce(%rip), %ymm0 # 0x21f18 <anon.ab50691cd9f241d9a1f8f77f17ec7544.0.llvm.5669537534260603877+0x38>
  11cfe6:      	vmovdqa	%ymm0, 0x1a0(%rsp)
  11cfef:      	vpxor	%xmm0, %xmm0, %xmm0
  11cff3:      	vmovdqa	%ymm0, 0x100(%rsp)
  11cffc:      	vmovdqa	%ymm0, 0xc0(%rsp)
  11d005:      	vmovdqa	%ymm0, 0xe0(%rsp)
  11d00e:      	vmovdqa	%ymm0, 0x40(%rsp)
  11d014:      	vmovdqa	%ymm5, %ymm15
  11d018:      	vmovdqa	0x260(%rsp), %ymm7
  11d021:      	vmovdqa	0x240(%rsp), %ymm3
  11d02a:      	nopw	(%rax,%rax)
  11d030:      	vmovdqu	-0x70(%r8), %ymm0
  11d036:      	vmovdqu	-0x50(%r8), %ymm6
  11d03c:      	vmovdqu	-0x30(%r8), %ymm8
  11d042:      	vmovdqu	-0x10(%r8), %ymm14
  11d048:      	vpunpckhqdq	%ymm6, %ymm0, %ymm4 # ymm4 = ymm0[1],ymm6[1],ymm0[3],ymm6[3]
  11d04c:      	vpunpcklqdq	%ymm6, %ymm0, %ymm12 # ymm12 = ymm0[0],ymm6[0],ymm0[2],ymm6[2]
  11d050:      	vpsrlq	$0x34, %ymm12, %ymm0
  11d056:      	vpsllq	$0xc, %ymm4, %ymm6
  11d05b:      	vpor	%ymm0, %ymm6, %ymm13
  11d05f:      	vpunpcklqdq	%ymm14, %ymm8, %ymm6 # ymm6 = ymm8[0],ymm14[0],ymm8[2],ymm14[2]
  11d064:      	vpunpckhqdq	%ymm14, %ymm8, %ymm0 # ymm0 = ymm8[1],ymm14[1],ymm8[3],ymm14[3]
  11d069:      	vmovdqa	%ymm0, 0x280(%rsp)
  11d072:      	vpsrlq	$0x34, %ymm6, %ymm8
  11d077:      	vpsllq	$0xc, %ymm0, %ymm14
  11d07c:      	vpor	%ymm8, %ymm14, %ymm1
  11d081:      	vmovdqa	%ymm1, 0x2a0(%rsp)
  11d08a:      	vmovdqa	%ymm15, %ymm1
  11d08e:      	vpsrlq	$0x1a, %ymm15, %ymm14
  11d094:      	vpaddq	%ymm11, %ymm14, %ymm14
  11d099:      	vmovdqa	0xa0(%rsp), %ymm2
  11d0a2:      	vpsrlq	$0x1a, %ymm2, %ymm11
  11d0a7:      	vpaddq	%ymm10, %ymm11, %ymm10
  11d0ac:      	vpsrlq	$0x1a, %ymm14, %ymm11
  11d0b2:      	vpaddq	0x80(%rsp), %ymm11, %ymm11
  11d0bb:      	vpsrlq	$0x28, %ymm4, %ymm15
  11d0c0:      	vpand	%ymm9, %ymm10, %ymm8
  11d0c5:      	vpaddq	%ymm15, %ymm8, %ymm8
  11d0ca:      	vpsrlq	$0x1a, %ymm10, %ymm10
  11d0d0:      	vpsllq	$0x2, %ymm10, %ymm15
  11d0d6:      	vpaddq	%ymm10, %ymm15, %ymm10
  11d0db:      	vpand	%ymm1, %ymm9, %ymm15
  11d0df:      	vpaddq	%ymm10, %ymm15, %ymm15
  11d0e4:      	vpand	%ymm2, %ymm9, %ymm10
  11d0e8:      	vpsrlq	$0x1a, %ymm11, %ymm5
  11d0ee:      	vpaddq	%ymm5, %ymm10, %ymm5
  11d0f2:      	vpsrlq	$0xe, %ymm4, %ymm4
  11d0f7:      	vpand	%ymm4, %ymm9, %ymm1
  11d0fb:      	vpand	%ymm9, %ymm13, %ymm4
  11d100:      	vpand	%ymm9, %ymm14, %ymm10
  11d105:      	vpand	%ymm9, %ymm11, %ymm11
  11d10a:      	vpaddq	%ymm4, %ymm11, %ymm4
  11d10e:      	vpsrlq	$0x1a, %ymm15, %ymm11
  11d114:      	vpaddq	%ymm10, %ymm11, %ymm10
  11d119:      	vpsrlq	$0x1a, %ymm12, %ymm11
  11d11f:      	vpand	%ymm9, %ymm11, %ymm11
  11d124:      	vpand	%ymm9, %ymm12, %ymm12
  11d129:      	vpaddq	%ymm11, %ymm10, %ymm10
  11d12e:      	vpand	%ymm9, %ymm15, %ymm11
  11d133:      	vpaddq	%ymm11, %ymm12, %ymm14
  11d138:      	vpsrlq	$0x1a, %ymm5, %ymm11
  11d13d:      	vpaddq	%ymm11, %ymm8, %ymm8
  11d142:      	vpand	%ymm5, %ymm9, %ymm5
  11d146:      	vpaddq	%ymm5, %ymm1, %ymm13
  11d14a:      	vpaddq	0x1a0(%rsp), %ymm8, %ymm12
  11d153:      	vmovdqa	0x220(%rsp), %ymm2
  11d15c:      	vpmuludq	%ymm2, %ymm14, %ymm1
  11d160:      	vpmuludq	%ymm7, %ymm10, %ymm5
  11d164:      	vmovdqa	0x1e0(%rsp), %ymm15
  11d16d:      	vpmuludq	%ymm15, %ymm13, %ymm8
  11d172:      	vpaddq	%ymm1, %ymm8, %ymm1
  11d176:      	vmovdqa	0x140(%rsp), %ymm0
  11d17f:      	vpmuludq	%ymm0, %ymm4, %ymm8
  11d183:      	vpaddq	%ymm1, %ymm8, %ymm1
  11d187:      	vpmuludq	0x1c0(%rsp), %ymm12, %ymm8
  11d190:      	vpaddq	%ymm5, %ymm8, %ymm5
  11d194:      	vpaddq	%ymm5, %ymm1, %ymm1
  11d198:      	vmovdqa	%ymm1, 0x2e0(%rsp)
  11d1a1:      	vpmuludq	%ymm3, %ymm14, %ymm1
  11d1a5:      	vpmuludq	%ymm0, %ymm13, %ymm5
  11d1a9:      	vpaddq	%ymm5, %ymm1, %ymm1
  11d1ad:      	vpmuludq	%ymm7, %ymm4, %ymm5
  11d1b1:      	vpaddq	%ymm1, %ymm5, %ymm1
  11d1b5:      	vpmuludq	%ymm2, %ymm10, %ymm5
  11d1b9:      	vpmuludq	%ymm15, %ymm12, %ymm8
  11d1be:      	vpaddq	%ymm5, %ymm8, %ymm5
  11d1c2:      	vpaddq	%ymm5, %ymm1, %ymm1
  11d1c6:      	vmovdqa	%ymm1, 0x2c0(%rsp)
  11d1cf:      	vmovdqa	0x200(%rsp), %ymm11
  11d1d8:      	vpmuludq	%ymm11, %ymm14, %ymm1
  11d1dd:      	vpmuludq	%ymm7, %ymm13, %ymm5
  11d1e1:      	vpaddq	%ymm5, %ymm1, %ymm1
  11d1e5:      	vpmuludq	%ymm2, %ymm4, %ymm5
  11d1e9:      	vpaddq	%ymm1, %ymm5, %ymm1
  11d1ed:      	vpmuludq	%ymm3, %ymm10, %ymm5
  11d1f1:      	vpmuludq	%ymm0, %ymm12, %ymm8
  11d1f5:      	vpaddq	%ymm5, %ymm8, %ymm5
  11d1f9:      	vpaddq	%ymm5, %ymm1, %ymm1
  11d1fd:      	vmovdqa	%ymm1, 0x80(%rsp)
  11d206:      	vmovdqa	0x160(%rsp), %ymm15
  11d20f:      	vpmuludq	%ymm15, %ymm14, %ymm1
  11d214:      	vpmuludq	%ymm2, %ymm13, %ymm5
  11d218:      	vpaddq	%ymm5, %ymm1, %ymm1
  11d21c:      	vpmuludq	%ymm3, %ymm4, %ymm5
  11d220:      	vpaddq	%ymm1, %ymm5, %ymm1
  11d224:      	vpmuludq	%ymm11, %ymm10, %ymm5
  11d229:      	vpmuludq	%ymm7, %ymm12, %ymm8
  11d22d:      	vpaddq	%ymm5, %ymm8, %ymm5
  11d231:      	vpaddq	%ymm5, %ymm1, %ymm1
  11d235:      	vmovdqa	%ymm1, 0xa0(%rsp)
  11d23e:      	vpmuludq	0x180(%rsp), %ymm14, %ymm1
  11d247:      	vpmuludq	%ymm3, %ymm13, %ymm5
  11d24b:      	vpaddq	%ymm5, %ymm1, %ymm1
  11d24f:      	vpmuludq	%ymm4, %ymm11, %ymm4
  11d253:      	vpaddq	%ymm1, %ymm4, %ymm1
  11d257:      	vpand	%ymm6, %ymm9, %ymm13
  11d25b:      	vpsrlq	$0x1a, %ymm6, %ymm0
  11d260:      	vpand	%ymm0, %ymm9, %ymm4
  11d264:      	vpand	0x2a0(%rsp), %ymm9, %ymm0
  11d26d:      	vpmuludq	%ymm15, %ymm10, %ymm5
  11d272:      	vpmuludq	%ymm2, %ymm12, %ymm8
  11d276:      	vpaddq	%ymm5, %ymm8, %ymm5
  11d27a:      	vmovdqa	0x280(%rsp), %ymm6
  11d283:      	vpsrlq	$0xe, %ymm6, %ymm8
  11d288:      	vpand	%ymm9, %ymm8, %ymm11
  11d28d:      	vpsrlq	$0x28, %ymm6, %ymm6
  11d292:      	vpaddq	%ymm5, %ymm1, %ymm10
  11d296:      	vmovdqa	0x40(%rsp), %ymm5
  11d29c:      	vpsrlq	$0x1a, %ymm5, %ymm1
  11d2a1:      	vpaddq	0xe0(%rsp), %ymm1, %ymm1
  11d2aa:      	vpand	%ymm5, %ymm9, %ymm5
  11d2ae:      	vmovdqa	0x100(%rsp), %ymm12
  11d2b7:      	vpsrlq	$0x1a, %ymm12, %ymm8
  11d2bd:      	vpaddq	0x60(%rsp), %ymm8, %ymm8
  11d2c3:      	vpand	%ymm9, %ymm12, %ymm12
  11d2c8:      	vpsrlq	$0x1a, %ymm1, %ymm14
  11d2cd:      	vpaddq	0xc0(%rsp), %ymm14, %ymm14
  11d2d6:      	vpand	%ymm1, %ymm9, %ymm1
  11d2da:      	vpsrlq	$0x1a, %ymm8, %ymm15
  11d2e0:      	vpand	%ymm9, %ymm8, %ymm8
  11d2e5:      	vpaddq	%ymm6, %ymm8, %ymm6
  11d2e9:      	vpsllq	$0x2, %ymm15, %ymm8
  11d2ef:      	vpaddq	%ymm15, %ymm8, %ymm8
  11d2f4:      	vpaddq	%ymm5, %ymm8, %ymm5
  11d2f8:      	vpsrlq	$0x1a, %ymm14, %ymm8
  11d2fe:      	vpaddq	%ymm12, %ymm8, %ymm12
  11d303:      	vpand	%ymm9, %ymm14, %ymm8
  11d308:      	vpaddq	%ymm0, %ymm8, %ymm0
  11d30c:      	vpsrlq	$0x1a, %ymm5, %ymm8
  11d311:      	vpaddq	%ymm1, %ymm8, %ymm1
  11d315:      	vpaddq	%ymm4, %ymm1, %ymm4
  11d319:      	vpand	%ymm5, %ymm9, %ymm1
  11d31d:      	vpaddq	%ymm1, %ymm13, %ymm8
  11d321:      	vpsrlq	$0x1a, %ymm12, %ymm1
  11d327:      	vpaddq	%ymm1, %ymm6, %ymm1
  11d32b:      	vpand	%ymm9, %ymm12, %ymm5
  11d330:      	vpaddq	%ymm5, %ymm11, %ymm12
  11d334:      	vpaddq	0x1a0(%rsp), %ymm1, %ymm6
  11d33d:      	vpmuludq	%ymm2, %ymm8, %ymm1
  11d341:      	vpmuludq	%ymm7, %ymm4, %ymm5
  11d345:      	vmovdqa	0x140(%rsp), %ymm15
  11d34e:      	vpmuludq	%ymm0, %ymm15, %ymm11
  11d352:      	vmovdqa	0x1e0(%rsp), %ymm14
  11d35b:      	vpmuludq	%ymm14, %ymm12, %ymm13
  11d360:      	vpaddq	%ymm1, %ymm13, %ymm1
  11d364:      	vpaddq	%ymm1, %ymm11, %ymm1
  11d368:      	vpmuludq	0x1c0(%rsp), %ymm6, %ymm11
  11d371:      	vpaddq	%ymm5, %ymm11, %ymm5
  11d375:      	vpaddq	%ymm5, %ymm1, %ymm1
  11d379:      	vmovdqa	%ymm1, 0x40(%rsp)
  11d37f:      	vpmuludq	%ymm3, %ymm8, %ymm1
  11d383:      	vpmuludq	%ymm2, %ymm4, %ymm5
  11d387:      	vpmuludq	%ymm7, %ymm0, %ymm11
  11d38b:      	vpmuludq	%ymm15, %ymm12, %ymm13
  11d390:      	vpaddq	%ymm1, %ymm13, %ymm1
  11d394:      	vpaddq	%ymm1, %ymm11, %ymm1
  11d398:      	vpmuludq	%ymm6, %ymm14, %ymm11
  11d39c:      	vpaddq	%ymm5, %ymm11, %ymm5
  11d3a0:      	vpaddq	%ymm5, %ymm1, %ymm1
  11d3a4:      	vmovdqa	%ymm1, 0xe0(%rsp)
  11d3ad:      	vmovdqa	0x200(%rsp), %ymm14
  11d3b6:      	vpmuludq	%ymm14, %ymm8, %ymm1
  11d3bb:      	vpmuludq	%ymm3, %ymm4, %ymm5
  11d3bf:      	vpmuludq	%ymm2, %ymm0, %ymm11
  11d3c3:      	vpmuludq	%ymm7, %ymm12, %ymm13
  11d3c7:      	vpaddq	%ymm1, %ymm13, %ymm1
  11d3cb:      	vpaddq	%ymm1, %ymm11, %ymm1
  11d3cf:      	vpmuludq	%ymm6, %ymm15, %ymm11
  11d3d3:      	vmovdqa	0x2e0(%rsp), %ymm15
  11d3dc:      	vpaddq	%ymm5, %ymm11, %ymm5
  11d3e0:      	vpaddq	%ymm5, %ymm1, %ymm1
  11d3e4:      	vmovdqa	%ymm1, 0xc0(%rsp)
  11d3ed:      	vmovdqa	0x160(%rsp), %ymm13
  11d3f6:      	vpmuludq	%ymm13, %ymm8, %ymm1
  11d3fb:      	vpmuludq	%ymm4, %ymm14, %ymm5
  11d3ff:      	vpmuludq	%ymm2, %ymm12, %ymm11
  11d403:      	vpaddq	%ymm1, %ymm11, %ymm1
  11d407:      	vpmuludq	%ymm3, %ymm0, %ymm11
  11d40b:      	vpaddq	%ymm1, %ymm11, %ymm1
  11d40f:      	vpmuludq	%ymm7, %ymm6, %ymm11
  11d413:      	vpaddq	%ymm5, %ymm11, %ymm5
  11d417:      	vmovdqa	0x2c0(%rsp), %ymm11
  11d420:      	vpaddq	%ymm5, %ymm1, %ymm1
  11d424:      	vmovdqa	%ymm1, 0x100(%rsp)
  11d42d:      	vpmuludq	0x180(%rsp), %ymm8, %ymm1
  11d436:      	vpmuludq	%ymm3, %ymm12, %ymm5
  11d43a:      	vpaddq	%ymm5, %ymm1, %ymm1
  11d43e:      	vpmuludq	%ymm0, %ymm14, %ymm0
  11d442:      	vpaddq	%ymm1, %ymm0, %ymm0
  11d446:      	vpmuludq	%ymm4, %ymm13, %ymm1
  11d44a:      	vpmuludq	%ymm2, %ymm6, %ymm4
  11d44e:      	vpaddq	%ymm1, %ymm4, %ymm1
  11d452:      	vpaddq	%ymm1, %ymm0, %ymm0
  11d456:      	vmovdqa	%ymm0, 0x60(%rsp)
  11d45c:      	subq	$-0x80, %r8
  11d460:      	decq	%r10
  11d463:      	jne	0x11d030 <toyos_crypto::arch::x86_64::poly1305::blocks+0xb60>
  11d469:      	jmp	0x11d4a1 <toyos_crypto::arch::x86_64::poly1305::blocks+0xfd1>
  11d46b:      	xorl	%eax, %eax
  11d46d:      	jmp	0x11dadc <toyos_crypto::arch::x86_64::poly1305::blocks+0x160c>
  11d472:      	vpxor	%xmm0, %xmm0, %xmm0
  11d476:      	vmovdqa	%ymm0, 0xe0(%rsp)
  11d47f:      	vmovdqa	%ymm0, 0xc0(%rsp)
  11d488:      	vmovdqa	%ymm0, 0x100(%rsp)
  11d491:      	vmovdqa	%ymm0, 0x60(%rsp)
  11d497:      	vmovdqa	%ymm0, 0x40(%rsp)
  11d49d:      	vmovdqa	%ymm5, %ymm15
  11d4a1:      	vmovdqu	(%rsi), %ymm0
  11d4a5:      	vmovdqu	0x20(%rsi), %ymm1
  11d4aa:      	vpunpckhqdq	%ymm1, %ymm0, %ymm3 # ymm3 = ymm0[1],ymm1[1],ymm0[3],ymm1[3]
  11d4ae:      	vpunpcklqdq	%ymm1, %ymm0, %ymm5 # ymm5 = ymm0[0],ymm1[0],ymm0[2],ymm1[2]
  11d4b2:      	vpsrlq	$0x34, %ymm5, %ymm0
  11d4b7:      	vpsllq	$0xc, %ymm3, %ymm1
  11d4bc:      	vpor	%ymm0, %ymm1, %ymm6
  11d4c0:      	vmovdqu	0x40(%rsi), %ymm0
  11d4c5:      	vmovdqu	0x60(%rsi), %ymm1
  11d4ca:      	vpunpcklqdq	%ymm1, %ymm0, %ymm2 # ymm2 = ymm0[0],ymm1[0],ymm0[2],ymm1[2]
  11d4ce:      	vpunpckhqdq	%ymm1, %ymm0, %ymm1 # ymm1 = ymm0[1],ymm1[1],ymm0[3],ymm1[3]
  11d4d2:      	vmovdqa	%ymm1, 0x160(%rsp)
  11d4db:      	vpsrlq	$0x34, %ymm2, %ymm0
  11d4e0:      	vpsllq	$0xc, %ymm1, %ymm4
  11d4e5:      	vpor	%ymm0, %ymm4, %ymm4
  11d4e9:      	vpsrlq	$0x1a, %ymm15, %ymm0
  11d4ef:      	vpaddq	%ymm0, %ymm11, %ymm7
  11d4f3:      	vmovdqa	0xa0(%rsp), %ymm14
  11d4fc:      	vpsrlq	$0x1a, %ymm14, %ymm0
  11d502:      	vpaddq	%ymm0, %ymm10, %ymm8
  11d506:      	vpsrlq	$0x1a, %ymm7, %ymm0
  11d50b:      	vpaddq	0x80(%rsp), %ymm0, %ymm9
  11d514:      	vpbroadcastq	-0xfb665(%rip), %ymm0 # 0x21eb8 <anon.f38ad35d6d2ee76e3558f602796c28fe.4.llvm.8446273095851839105+0x68>
  11d51d:      	vpsrlq	$0x1a, %ymm5, %ymm10
  11d522:      	vpand	%ymm0, %ymm10, %ymm10
  11d526:      	vpand	%ymm0, %ymm7, %ymm7
  11d52a:      	vpaddq	%ymm7, %ymm10, %ymm7
  11d52e:      	vpsrlq	$0x28, %ymm3, %ymm10
  11d533:      	vpand	%ymm0, %ymm8, %ymm12
  11d537:      	vpaddq	%ymm10, %ymm12, %ymm13
  11d53c:      	vpand	%ymm0, %ymm15, %ymm10
  11d540:      	vpsrlq	$0x1a, %ymm8, %ymm8
  11d546:      	vpaddq	%ymm8, %ymm10, %ymm10
  11d54b:      	vpsllq	$0x2, %ymm8, %ymm8
  11d551:      	vpaddq	%ymm8, %ymm10, %ymm11
  11d556:      	vpand	%ymm0, %ymm14, %ymm8
  11d55a:      	vpsrlq	$0x1a, %ymm9, %ymm10
  11d560:      	vpaddq	%ymm8, %ymm10, %ymm14
  11d565:      	vpand	%ymm0, %ymm6, %ymm6
  11d569:      	vpand	%ymm0, %ymm9, %ymm8
  11d56d:      	vpaddq	%ymm6, %ymm8, %ymm8
  11d571:      	vpsrlq	$0x1a, %ymm11, %ymm6
  11d577:      	vpaddq	%ymm7, %ymm6, %ymm10
  11d57b:      	vpand	%ymm0, %ymm5, %ymm5
  11d57f:      	vpand	%ymm0, %ymm11, %ymm6
  11d583:      	vpaddq	%ymm6, %ymm5, %ymm11
  11d587:      	vpsrlq	$0xe, %ymm3, %ymm3
  11d58c:      	vpand	%ymm0, %ymm3, %ymm3
  11d590:      	vpand	%ymm0, %ymm14, %ymm5
  11d594:      	vpaddq	%ymm5, %ymm3, %ymm12
  11d598:      	vpsrlq	$0x1a, %ymm14, %ymm3
  11d59e:      	vpbroadcastq	-0xfb68f(%rip), %ymm9 # 0x21f18 <anon.ab50691cd9f241d9a1f8f77f17ec7544.0.llvm.5669537534260603877+0x38>
  11d5a7:      	vpaddq	%ymm9, %ymm13, %ymm5
  11d5ac:      	vpaddq	%ymm3, %ymm5, %ymm13
  11d5b0:      	vmovdqa	0x540(%rsp), %ymm1
  11d5b9:      	vpmuludq	%ymm1, %ymm11, %ymm3
  11d5bd:      	vmovdqa	0x360(%rsp), %ymm14
  11d5c6:      	vpmuludq	%ymm14, %ymm8, %ymm5
  11d5cb:      	vpaddq	%ymm3, %ymm5, %ymm3
  11d5cf:      	vmovdqa	0x340(%rsp), %ymm7
  11d5d8:      	vpmuludq	%ymm7, %ymm12, %ymm5
  11d5dc:      	vpaddq	%ymm5, %ymm3, %ymm3
  11d5e0:      	vpmuludq	0x320(%rsp), %ymm13, %ymm5
  11d5e9:      	vmovdqa	0x380(%rsp), %ymm15
  11d5f2:      	vpmuludq	%ymm15, %ymm10, %ymm6
  11d5f7:      	vpaddq	%ymm6, %ymm5, %ymm5
  11d5fb:      	vpaddq	%ymm5, %ymm3, %ymm3
  11d5ff:      	vmovdqa	%ymm3, 0xa0(%rsp)
  11d608:      	vmovdqa	0x520(%rsp), %ymm3
  11d611:      	vpmuludq	%ymm3, %ymm11, %ymm5
  11d615:      	vpmuludq	%ymm15, %ymm8, %ymm6
  11d61a:      	vpaddq	%ymm5, %ymm6, %ymm5
  11d61e:      	vpmuludq	%ymm14, %ymm12, %ymm6
  11d623:      	vpaddq	%ymm6, %ymm5, %ymm5
  11d627:      	vpmuludq	%ymm7, %ymm13, %ymm6
  11d62b:      	vpmuludq	%ymm1, %ymm10, %ymm7
  11d62f:      	vpaddq	%ymm7, %ymm6, %ymm6
  11d633:      	vpaddq	%ymm6, %ymm5, %ymm5
  11d637:      	vmovdqa	%ymm5, 0x80(%rsp)
  11d640:      	vmovdqa	0x4a0(%rsp), %ymm5
  11d649:      	vpmuludq	%ymm5, %ymm11, %ymm6
  11d64d:      	vpmuludq	%ymm1, %ymm8, %ymm7
  11d651:      	vpaddq	%ymm6, %ymm7, %ymm6
  11d655:      	vpmuludq	%ymm15, %ymm12, %ymm7
  11d65a:      	vpaddq	%ymm7, %ymm6, %ymm6
  11d65e:      	vpmuludq	%ymm14, %ymm13, %ymm7
  11d663:      	vpmuludq	%ymm3, %ymm10, %ymm14
  11d667:      	vpaddq	%ymm7, %ymm14, %ymm7
  11d66b:      	vpaddq	%ymm7, %ymm6, %ymm6
  11d66f:      	vmovdqa	%ymm6, 0x180(%rsp)
  11d678:      	vmovdqa	0x440(%rsp), %ymm7
  11d681:      	vpmuludq	%ymm7, %ymm11, %ymm6
  11d685:      	vpmuludq	%ymm3, %ymm8, %ymm14
  11d689:      	vpaddq	%ymm6, %ymm14, %ymm6
  11d68d:      	vpmuludq	%ymm1, %ymm12, %ymm14
  11d691:      	vpaddq	%ymm6, %ymm14, %ymm6
  11d695:      	vpmuludq	%ymm15, %ymm13, %ymm14
  11d69a:      	vpmuludq	%ymm5, %ymm10, %ymm15
  11d69e:      	vpaddq	%ymm15, %ymm14, %ymm14
  11d6a3:      	vpaddq	%ymm6, %ymm14, %ymm6
  11d6a7:      	vmovdqa	%ymm6, 0x140(%rsp)
  11d6b0:      	vpmuludq	0x420(%rsp), %ymm11, %ymm11
  11d6b9:      	vpmuludq	%ymm7, %ymm10, %ymm10
  11d6bd:      	vpmuludq	%ymm5, %ymm8, %ymm8
  11d6c1:      	vpaddq	%ymm11, %ymm8, %ymm8
  11d6c6:      	vpmuludq	%ymm3, %ymm12, %ymm11
  11d6ca:      	vpaddq	%ymm11, %ymm8, %ymm8
  11d6cf:      	vpmuludq	%ymm1, %ymm13, %ymm11
  11d6d3:      	vpaddq	%ymm10, %ymm11, %ymm10
  11d6d8:      	vpaddq	%ymm10, %ymm8, %ymm8
  11d6dd:      	vmovdqa	0x40(%rsp), %ymm1
  11d6e3:      	vpsrlq	$0x1a, %ymm1, %ymm10
  11d6e8:      	vpaddq	0xe0(%rsp), %ymm10, %ymm10
  11d6f1:      	vmovdqa	0x100(%rsp), %ymm3
  11d6fa:      	vpsrlq	$0x1a, %ymm3, %ymm11
  11d6ff:      	vpaddq	0x60(%rsp), %ymm11, %ymm11
  11d705:      	vpsrlq	$0x1a, %ymm10, %ymm12
  11d70b:      	vpaddq	0xc0(%rsp), %ymm12, %ymm12
  11d714:      	vpsrlq	$0x1a, %ymm2, %ymm13
  11d719:      	vpand	%ymm0, %ymm13, %ymm13
  11d71d:      	vpand	%ymm0, %ymm10, %ymm10
  11d721:      	vpaddq	%ymm13, %ymm10, %ymm13
  11d726:      	vmovdqa	0x160(%rsp), %ymm5
  11d72f:      	vpsrlq	$0x28, %ymm5, %ymm10
  11d734:      	vpand	%ymm0, %ymm11, %ymm14
  11d738:      	vpaddq	%ymm10, %ymm14, %ymm14
  11d73d:      	vpand	%ymm0, %ymm1, %ymm10
  11d741:      	vpsrlq	$0x1a, %ymm11, %ymm11
  11d747:      	vpaddq	%ymm10, %ymm11, %ymm10
  11d74c:      	vpsllq	$0x2, %ymm11, %ymm11
  11d752:      	vpaddq	%ymm10, %ymm11, %ymm15
  11d757:      	vpand	%ymm0, %ymm3, %ymm10
  11d75b:      	vpsrlq	$0x1a, %ymm12, %ymm11
  11d761:      	vpaddq	%ymm10, %ymm11, %ymm3
  11d766:      	vpand	%ymm0, %ymm4, %ymm4
  11d76a:      	vpand	%ymm0, %ymm12, %ymm10
  11d76e:      	vpaddq	%ymm4, %ymm10, %ymm10
  11d772:      	vpsrlq	$0x1a, %ymm15, %ymm4
  11d778:      	vpaddq	%ymm4, %ymm13, %ymm11
  11d77c:      	vpand	%ymm0, %ymm2, %ymm2
  11d780:      	vpand	%ymm0, %ymm15, %ymm4
  11d784:      	vpaddq	%ymm4, %ymm2, %ymm7
  11d788:      	vpsrlq	$0xe, %ymm5, %ymm1
  11d78d:      	vpand	%ymm0, %ymm1, %ymm1
  11d791:      	vpand	%ymm0, %ymm3, %ymm4
  11d795:      	vpaddq	%ymm4, %ymm1, %ymm6
  11d799:      	vpaddq	%ymm9, %ymm14, %ymm4
  11d79e:      	vpsrlq	$0x1a, %ymm3, %ymm3
  11d7a3:      	vpaddq	%ymm3, %ymm4, %ymm12
  11d7a7:      	vmovdqa	0x500(%rsp), %ymm5
  11d7b0:      	vpmuludq	%ymm5, %ymm7, %ymm3
  11d7b4:      	vmovdqa	0x3e0(%rsp), %ymm14
  11d7bd:      	vpmuludq	%ymm14, %ymm10, %ymm4
  11d7c2:      	vpaddq	%ymm3, %ymm4, %ymm3
  11d7c6:      	vmovdqa	0x3c0(%rsp), %ymm1
  11d7cf:      	vpmuludq	%ymm1, %ymm6, %ymm4
  11d7d3:      	vpaddq	%ymm4, %ymm3, %ymm3
  11d7d7:      	vpmuludq	0x3a0(%rsp), %ymm12, %ymm4
  11d7e0:      	vmovdqa	0x400(%rsp), %ymm15
  11d7e9:      	vpmuludq	%ymm15, %ymm11, %ymm9
  11d7ee:      	vpaddq	%ymm4, %ymm9, %ymm4
  11d7f2:      	vpaddq	%ymm4, %ymm3, %ymm2
  11d7f6:      	vmovdqa	%ymm2, 0x40(%rsp)
  11d7fc:      	vmovdqa	0x4e0(%rsp), %ymm2
  11d805:      	vpmuludq	%ymm2, %ymm7, %ymm3
  11d809:      	vpmuludq	%ymm15, %ymm10, %ymm9
  11d80e:      	vpaddq	%ymm3, %ymm9, %ymm3
  11d812:      	vpmuludq	%ymm6, %ymm14, %ymm9
  11d816:      	vpaddq	%ymm3, %ymm9, %ymm3
  11d81a:      	vpmuludq	%ymm1, %ymm12, %ymm9
  11d81e:      	vpmuludq	%ymm5, %ymm11, %ymm13
  11d822:      	vpaddq	%ymm13, %ymm9, %ymm9
  11d827:      	vpaddq	%ymm3, %ymm9, %ymm9
  11d82b:      	vmovdqa	0x4c0(%rsp), %ymm1
  11d834:      	vpmuludq	%ymm1, %ymm7, %ymm3
  11d838:      	vpmuludq	%ymm5, %ymm10, %ymm13
  11d83c:      	vpaddq	%ymm3, %ymm13, %ymm3
  11d840:      	vpmuludq	%ymm6, %ymm15, %ymm13
  11d844:      	vpaddq	%ymm3, %ymm13, %ymm3
  11d848:      	vpmuludq	%ymm14, %ymm12, %ymm13
  11d84d:      	vpmuludq	%ymm2, %ymm11, %ymm14
  11d851:      	vpaddq	%ymm14, %ymm13, %ymm13
  11d856:      	vpaddq	%ymm3, %ymm13, %ymm13
  11d85a:      	vmovdqa	0x480(%rsp), %ymm3
  11d863:      	vpmuludq	%ymm3, %ymm7, %ymm4
  11d867:      	vpmuludq	%ymm2, %ymm10, %ymm14
  11d86b:      	vpaddq	%ymm4, %ymm14, %ymm4
  11d86f:      	vpmuludq	%ymm5, %ymm6, %ymm14
  11d873:      	vpaddq	%ymm4, %ymm14, %ymm4
  11d877:      	vpmuludq	%ymm15, %ymm12, %ymm14
  11d87c:      	vpmuludq	%ymm1, %ymm11, %ymm15
  11d880:      	vpaddq	%ymm15, %ymm14, %ymm14
  11d885:      	vpaddq	%ymm4, %ymm14, %ymm14
  11d889:      	vpmuludq	0x460(%rsp), %ymm7, %ymm7
  11d892:      	vpmuludq	%ymm3, %ymm11, %ymm3
  11d896:      	vpmuludq	%ymm1, %ymm10, %ymm10
  11d89a:      	vpaddq	%ymm7, %ymm10, %ymm7
  11d89e:      	vpmuludq	%ymm2, %ymm6, %ymm1
  11d8a2:      	vpaddq	%ymm1, %ymm7, %ymm1
  11d8a6:      	vpmuludq	%ymm5, %ymm12, %ymm2
  11d8aa:      	vpaddq	%ymm3, %ymm2, %ymm2
  11d8ae:      	vpaddq	%ymm2, %ymm1, %ymm3
  11d8b2:      	vmovdqa	0xa0(%rsp), %ymm2
  11d8bb:      	vpsrlq	$0x1a, %ymm2, %ymm1
  11d8c0:      	vpaddq	0x80(%rsp), %ymm1, %ymm5
  11d8c9:      	vpand	%ymm0, %ymm2, %ymm2
  11d8cd:      	vmovdqa	0x140(%rsp), %ymm4
  11d8d6:      	vpsrlq	$0x1a, %ymm4, %ymm1
  11d8db:      	vpaddq	%ymm1, %ymm8, %ymm1
  11d8df:      	vpand	%ymm0, %ymm4, %ymm6
  11d8e3:      	vpsrlq	$0x1a, %ymm5, %ymm8
  11d8e8:      	vpaddq	0x180(%rsp), %ymm8, %ymm7
  11d8f1:      	vpsrlq	$0x1a, %ymm1, %ymm8
  11d8f6:      	vpaddq	%ymm2, %ymm8, %ymm2
  11d8fa:      	vpsllq	$0x2, %ymm8, %ymm8
  11d900:      	vpaddq	%ymm2, %ymm8, %ymm8
  11d904:      	vpsrlq	$0x1a, %ymm7, %ymm2
  11d909:      	vpaddq	%ymm6, %ymm2, %ymm2
  11d90d:      	vmovdqa	0x40(%rsp), %ymm4
  11d913:      	vpsrlq	$0x1a, %ymm4, %ymm6
  11d918:      	vpaddq	%ymm6, %ymm9, %ymm6
  11d91c:      	vpsrlq	$0x1a, %ymm14, %ymm9
  11d922:      	vpaddq	%ymm3, %ymm9, %ymm3
  11d926:      	vpsrlq	$0x1a, %ymm6, %ymm9
  11d92b:      	vpaddq	%ymm9, %ymm13, %ymm9
  11d930:      	vpand	%ymm0, %ymm5, %ymm5
  11d934:      	vpand	%ymm0, %ymm7, %ymm7
  11d938:      	vpand	%ymm0, %ymm6, %ymm6
  11d93c:      	vpaddq	%ymm6, %ymm5, %ymm5
  11d940:      	vpsrlq	$0x1a, %ymm8, %ymm6
  11d946:      	vpand	%ymm0, %ymm8, %ymm8
  11d94a:      	vpand	%ymm0, %ymm4, %ymm4
  11d94e:      	vpand	%ymm0, %ymm14, %ymm10
  11d952:      	vpaddq	%ymm5, %ymm6, %ymm5
  11d956:      	vpsrlq	$0x1a, %ymm3, %ymm6
  11d95b:      	vpaddq	%ymm4, %ymm6, %ymm4
  11d95f:      	vpsllq	$0x2, %ymm6, %ymm6
  11d964:      	vpaddq	%ymm4, %ymm6, %ymm6
  11d968:      	vpsrlq	$0x1a, %ymm9, %ymm4
  11d96e:      	vpaddq	%ymm4, %ymm10, %ymm4
  11d972:      	vpand	%ymm0, %ymm2, %ymm10
  11d976:      	vpand	%ymm0, %ymm9, %ymm9
  11d97a:      	vpaddq	%ymm7, %ymm9, %ymm7
  11d97e:      	vpsrlq	$0x1a, %ymm6, %ymm9
  11d983:      	vpaddq	%ymm5, %ymm9, %ymm9
  11d987:      	vpand	%ymm0, %ymm6, %ymm5
  11d98b:      	vpaddq	%ymm5, %ymm8, %ymm6
  11d98f:      	vpand	%ymm0, %ymm4, %ymm5
  11d993:      	vpaddq	%ymm5, %ymm10, %ymm5
  11d997:      	vpshufd	$0xee, %xmm6, %xmm8     # xmm8 = xmm6[2,3,2,3]
  11d99c:      	vextracti128	$0x1, %ymm6, %xmm10
  11d9a2:      	vpaddq	%xmm6, %xmm8, %xmm8
  11d9a6:      	vpermq	$0xff, %ymm6, %ymm6     # ymm6 = ymm6[3,3,3,3]
  11d9ac:      	vpaddq	%xmm6, %xmm10, %xmm6
  11d9b0:      	vpaddq	%xmm6, %xmm8, %xmm6
  11d9b4:      	vmovq	%xmm6, %rdx
  11d9b9:      	vpshufd	$0xee, %xmm9, %xmm6     # xmm6 = xmm9[2,3,2,3]
  11d9bf:      	vextracti128	$0x1, %ymm9, %xmm8
  11d9c5:      	vpaddq	%xmm6, %xmm9, %xmm6
  11d9c9:      	vpermq	$0xff, %ymm9, %ymm9     # ymm9 = ymm9[3,3,3,3]
  11d9cf:      	vpaddq	%xmm9, %xmm8, %xmm8
  11d9d4:      	vpaddq	%xmm6, %xmm8, %xmm6
  11d9d8:      	vmovq	%xmm6, %rsi
  11d9dd:      	vpshufd	$0xee, %xmm7, %xmm6     # xmm6 = xmm7[2,3,2,3]
  11d9e2:      	vextracti128	$0x1, %ymm7, %xmm8
  11d9e8:      	vpaddq	%xmm6, %xmm7, %xmm6
  11d9ec:      	vpermq	$0xff, %ymm7, %ymm7     # ymm7 = ymm7[3,3,3,3]
  11d9f2:      	vpaddq	%xmm7, %xmm8, %xmm7
  11d9f6:      	vpaddq	%xmm7, %xmm6, %xmm6
  11d9fa:      	vmovq	%xmm6, %r9
  11d9ff:      	vpshufd	$0xee, %xmm5, %xmm6     # xmm6 = xmm5[2,3,2,3]
  11da04:      	vextracti128	$0x1, %ymm5, %xmm7
  11da0a:      	vpaddq	%xmm6, %xmm5, %xmm6
  11da0e:      	vpermq	$0xff, %ymm5, %ymm5     # ymm5 = ymm5[3,3,3,3]
  11da14:      	vpaddq	%xmm5, %xmm7, %xmm5
  11da18:      	vpaddq	%xmm5, %xmm6, %xmm5
  11da1c:      	vmovq	%xmm5, %rcx
  11da21:      	movq	%rsi, %rdi
  11da24:      	shrq	$0x26, %rdi
  11da28:      	shlq	$0x1a, %rsi
  11da2c:      	movq	%r9, %r8
  11da2f:      	shrq	$0xc, %r8
  11da33:      	shlq	$0x34, %r9
  11da37:      	addq	%rdx, %r9
  11da3a:      	adcq	$0x0, %r8
  11da3e:      	addq	%rsi, %r9
  11da41:      	adcq	%rdi, %r8
  11da44:      	shlq	$0xe, %rcx
  11da48:      	addq	%r8, %rcx
  11da4b:      	movq	0x138(%rsp), %rax
  11da53:      	jb	0x11daee <toyos_crypto::arch::x86_64::poly1305::blocks+0x161e>
  11da59:      	movabsq	$0x7fffffffffffff8, %rdx # imm = 0x7FFFFFFFFFFFFF8
  11da63:      	andq	%rdx, %rax
  11da66:      	vpsrlq	$0x1a, %ymm2, %ymm2
  11da6b:      	vpand	%ymm0, %ymm1, %ymm1
  11da6f:      	vpand	%ymm0, %ymm3, %ymm0
  11da73:      	vpaddq	%ymm0, %ymm1, %ymm0
  11da77:      	vpaddq	%ymm0, %ymm2, %ymm0
  11da7b:      	vpsrlq	$0x1a, %ymm4, %ymm1
  11da80:      	vpaddq	%ymm1, %ymm0, %ymm0
  11da84:      	vpshufd	$0xee, %xmm0, %xmm1     # xmm1 = xmm0[2,3,2,3]
  11da89:      	vextracti128	$0x1, %ymm0, %xmm2
  11da8f:      	vpermq	$0xff, %ymm0, %ymm3     # ymm3 = ymm0[3,3,3,3]
  11da95:      	vpaddq	%xmm1, %xmm0, %xmm0
  11da99:      	vpaddq	%xmm3, %xmm2, %xmm1
  11da9d:      	vpaddq	%xmm1, %xmm0, %xmm0
  11daa1:      	vmovq	%xmm0, %rdx
  11daa6:      	movq	%rdx, %rsi
  11daa9:      	shlq	$0x28, %rsi
  11daad:      	shrq	$0x18, %rdx
  11dab1:      	addq	%rsi, %rcx
  11dab4:      	adcq	$0x0, %rdx
  11dab8:      	movq	%rdx, %rsi
  11dabb:      	shrq	$0x2, %rsi
  11dabf:      	leaq	(%rsi,%rsi,4), %rsi
  11dac3:      	andl	$0x3, %edx
  11dac6:      	addq	%rsi, %r9
  11dac9:      	adcq	$0x0, %rcx
  11dacd:      	adcq	$0x0, %rdx
  11dad1:      	movq	%r9, (%r11)
  11dad4:      	movq	%rcx, 0x8(%r11)
  11dad8:      	movq	%rdx, 0x10(%r11)
  11dadc:      	leaq	-0x28(%rbp), %rsp
  11dae0:      	popq	%rbx
  11dae1:      	popq	%r12
  11dae3:      	popq	%r13
  11dae5:      	popq	%r14
  11dae7:      	popq	%r15
  11dae9:      	popq	%rbp
  11daea:      	vzeroupper
  11daed:      	retq
  11daee:      	leaq	0x62f7b(%rip), %rdi     # 0x180a70 <anon.f6054603e20e76e19245e18dfa70e81d.5.llvm.1349518866583298265+0x60>
  11daf5:      	vzeroupper
  11daf8:      	callq	0x175d70 <core::panicking::panic_const::panic_const_add_overflow>
