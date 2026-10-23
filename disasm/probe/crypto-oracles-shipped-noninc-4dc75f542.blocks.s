
crypto-oracles-shipped-noninc-4dc75f542:	file format elf64-x86-64

Disassembly of section .text:

00000000002fc8b0 <toyos_crypto::arch::x86_64::poly1305::blocks>:
  2fc8b0:      	pushq	%rbp
  2fc8b1:      	movq	%rsp, %rbp
  2fc8b4:      	pushq	%r15
  2fc8b6:      	pushq	%r14
  2fc8b8:      	pushq	%r13
  2fc8ba:      	pushq	%r12
  2fc8bc:      	pushq	%rbx
  2fc8bd:      	andq	$-0x20, %rsp
  2fc8c1:      	subq	$0x760, %rsp            # imm = 0x760
  2fc8c8:      	movq	%rdx, %r15
  2fc8cb:      	movq	(%rdi), %r14
  2fc8ce:      	movq	0x8(%rdi), %r9
  2fc8d2:      	movq	0x10(%rdi), %r12
  2fc8d6:      	movq	(%rsi), %rdi
  2fc8d9:      	movq	0x8(%rsi), %rax
  2fc8dd:      	movl	%edi, %edx
  2fc8df:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  2fc8e5:      	movq	%rax, %r8
  2fc8e8:      	shldq	$0xc, %rdi, %r8
  2fc8ed:      	shrq	$0x1a, %rdi
  2fc8f1:      	andl	$0x3ffffff, %edi        # imm = 0x3FFFFFF
  2fc8f7:      	andl	$0x3ffffff, %r8d        # imm = 0x3FFFFFF
  2fc8fe:      	shrq	$0xe, %rax
  2fc902:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fc907:      	vmovd	%edx, %xmm0
  2fc90b:      	vmovq	0xd(%rsi), %xmm1
  2fc910:      	vmovdqa	%ymm0, 0x220(%rsp)
  2fc919:      	vmovd	%edi, %xmm0
  2fc91d:      	vmovdqa	%ymm0, 0x240(%rsp)
  2fc926:      	vmovd	%r8d, %xmm0
  2fc92b:      	vmovdqa	%ymm0, 0x260(%rsp)
  2fc934:      	vmovd	%eax, %xmm0
  2fc938:      	vmovdqa	%ymm0, 0x280(%rsp)
  2fc941:      	vmovdqa	%ymm1, 0x2a0(%rsp)
  2fc94a:      	movq	%rcx, %r13
  2fc94d:      	shrq	$0x3, %r13
  2fc951:      	je	0x2fdcbf <toyos_crypto::arch::x86_64::poly1305::blocks+0x140f>
  2fc957:      	movq	%rsi, 0xa8(%rsp)
  2fc95f:      	movq	%rcx, 0xb0(%rsp)
  2fc967:      	movq	%r12, %rax
  2fc96a:      	mulq	%r9
  2fc96d:      	movq	%rdx, %rdi
  2fc970:      	movq	%r9, %rcx
  2fc973:      	movq	%rax, %r9
  2fc976:      	movq	%r14, %rax
  2fc979:      	mulq	%r14
  2fc97c:      	movq	%rdx, %r10
  2fc97f:      	movq	%rax, %rsi
  2fc982:      	addq	%r9, %rsi
  2fc985:      	adcq	%rdi, %r10
  2fc988:      	movq	%r14, %rax
  2fc98b:      	mulq	%rcx
  2fc98e:      	movq	%rcx, %r8
  2fc991:      	movq	%rcx, 0x40(%rsp)
  2fc996:      	shldq	$0x1, %rax, %rdx
  2fc99b:      	addq	%rax, %rax
  2fc99e:      	addq	%r10, %rax
  2fc9a1:      	adcq	$0x0, %rdx
  2fc9a5:      	movl	%edx, %edi
  2fc9a7:      	andl	$0x3, %edi
  2fc9aa:      	shrq	$0x2, %rdx
  2fc9ae:      	leaq	(%rdx,%rdx,4), %rbx
  2fc9b2:      	addq	%rsi, %rbx
  2fc9b5:      	adcq	$0x0, %rax
  2fc9b9:      	movq	%rdi, %rcx
  2fc9bc:      	adcq	$0x0, %rcx
  2fc9c0:      	movq	%rcx, 0x80(%rsp)
  2fc9c8:      	movq	%rax, %r11
  2fc9cb:      	movq	%rax, 0x200(%rsp)
  2fc9d3:      	mulq	%r14
  2fc9d6:      	movq	%rax, %rdi
  2fc9d9:      	movq	%rdx, %r9
  2fc9dc:      	imulq	%r14, %rcx
  2fc9e0:      	movq	%rbx, %rax
  2fc9e3:      	movq	%rbx, 0x1c0(%rsp)
  2fc9eb:      	mulq	%r8
  2fc9ee:      	movq	%rdx, %rsi
  2fc9f1:      	movq	%rax, %r10
  2fc9f4:      	addq	%rdi, %r10
  2fc9f7:      	adcq	%r9, %rsi
  2fc9fa:      	movq	%r11, %rax
  2fc9fd:      	movq	%r12, 0x60(%rsp)
  2fca02:      	mulq	%r12
  2fca05:      	movq	%rdx, %r9
  2fca08:      	movq	%rax, %r11
  2fca0b:      	movq	%rbx, %rax
  2fca0e:      	mulq	%r14
  2fca11:      	movq	%rdx, %rbx
  2fca14:      	movq	%rax, %rdi
  2fca17:      	addq	%r11, %rdi
  2fca1a:      	adcq	%r9, %rbx
  2fca1d:      	addq	%r10, %rbx
  2fca20:      	adcq	$0x0, %rsi
  2fca24:      	movq	0x80(%rsp), %rax
  2fca2c:      	mulq	%r12
  2fca2f:      	addq	%rbx, %rax
  2fca32:      	adcq	%rsi, %rdx
  2fca35:      	addq	%rcx, %rdx
  2fca38:      	movl	%edx, %r8d
  2fca3b:      	andl	$0x3, %r8d
  2fca3f:      	shrq	$0x2, %rdx
  2fca43:      	leaq	(%rdx,%rdx,4), %rbx
  2fca47:      	addq	%rdi, %rbx
  2fca4a:      	adcq	$0x0, %rax
  2fca4e:      	adcq	$0x0, %r8
  2fca52:      	movq	%r8, %rcx
  2fca55:      	movq	%r8, 0x1e0(%rsp)
  2fca5d:      	movq	%rax, %r11
  2fca60:      	movq	%rax, 0x1a0(%rsp)
  2fca68:      	movq	%r14, %r12
  2fca6b:      	mulq	%r14
  2fca6e:      	movq	%rax, %rdi
  2fca71:      	movq	%rdx, %r9
  2fca74:      	imulq	%r14, %rcx
  2fca78:      	movq	%r14, 0xb8(%rsp)
  2fca80:      	movq	%rbx, %rax
  2fca83:      	movq	%rbx, 0x180(%rsp)
  2fca8b:      	mulq	0x40(%rsp)
  2fca90:      	movq	%rdx, %rsi
  2fca93:      	movq	%rax, %r10
  2fca96:      	addq	%rdi, %r10
  2fca99:      	adcq	%r9, %rsi
  2fca9c:      	movq	%r11, %rax
  2fca9f:      	movq	0x60(%rsp), %r14
  2fcaa4:      	mulq	%r14
  2fcaa7:      	movq	%rdx, %r9
  2fcaaa:      	movq	%rax, %r11
  2fcaad:      	movq	%rbx, %rax
  2fcab0:      	mulq	%r12
  2fcab3:      	movq	%rdx, %rbx
  2fcab6:      	movq	%rax, %rdi
  2fcab9:      	addq	%r11, %rdi
  2fcabc:      	adcq	%r9, %rbx
  2fcabf:      	addq	%r10, %rbx
  2fcac2:      	adcq	$0x0, %rsi
  2fcac6:      	movq	%r8, %rax
  2fcac9:      	mulq	%r14
  2fcacc:      	addq	%rbx, %rax
  2fcacf:      	movq	%rax, %r9
  2fcad2:      	adcq	%rsi, %rdx
  2fcad5:      	addq	%rcx, %rdx
  2fcad8:      	movl	%edx, %eax
  2fcada:      	andl	$0x3, %eax
  2fcadd:      	shrq	$0x2, %rdx
  2fcae1:      	leaq	(%rdx,%rdx,4), %rsi
  2fcae5:      	addq	%rdi, %rsi
  2fcae8:      	adcq	$0x0, %r9
  2fcaec:      	movq	%r9, %r10
  2fcaef:      	adcq	$0x0, %rax
  2fcaf3:      	movq	%rax, %r12
  2fcaf6:      	movq	%rax, 0x3a0(%rsp)
  2fcafe:      	mulq	%r14
  2fcb01:      	movq	%r14, %rdi
  2fcb04:      	movq	%rdx, 0x160(%rsp)
  2fcb0c:      	movq	%rax, 0x38(%rsp)
  2fcb11:      	movq	%rsi, %rax
  2fcb14:      	movq	%rsi, 0x380(%rsp)
  2fcb1c:      	movq	0x40(%rsp), %r8
  2fcb21:      	mulq	%r8
  2fcb24:      	movq	%rdx, %r9
  2fcb27:      	movq	%rax, %r11
  2fcb2a:      	movq	%r10, %rcx
  2fcb2d:      	movq	%r10, 0x3c0(%rsp)
  2fcb35:      	movq	%r10, %rax
  2fcb38:      	movq	0xb8(%rsp), %r14
  2fcb40:      	mulq	%r14
  2fcb43:      	movq	%rdx, %r10
  2fcb46:      	movq	%rax, %rbx
  2fcb49:      	addq	%r11, %rbx
  2fcb4c:      	adcq	%r9, %r10
  2fcb4f:      	movq	%rsi, %rax
  2fcb52:      	mulq	%r14
  2fcb55:      	movq	%rdx, %r9
  2fcb58:      	movq	%rax, %r11
  2fcb5b:      	movq	%rcx, %rax
  2fcb5e:      	movq	%rdi, %rsi
  2fcb61:      	mulq	%rdi
  2fcb64:      	addq	%r11, %rax
  2fcb67:      	adcq	%r9, %rdx
  2fcb6a:      	addq	%rbx, %rdx
  2fcb6d:      	adcq	$0x0, %r10
  2fcb71:      	addq	0x38(%rsp), %rdx
  2fcb76:      	adcq	0x160(%rsp), %r10
  2fcb7e:      	movq	%r12, %rdi
  2fcb81:      	imulq	%r14, %rdi
  2fcb85:      	addq	%r10, %rdi
  2fcb88:      	movq	%rdi, %rcx
  2fcb8b:      	shrq	$0x2, %rcx
  2fcb8f:      	leaq	(%rcx,%rcx,4), %r12
  2fcb93:      	andl	$0x3, %edi
  2fcb96:      	addq	%rax, %r12
  2fcb99:      	movq	%rdx, %rcx
  2fcb9c:      	adcq	$0x0, %rcx
  2fcba0:      	adcq	$0x0, %rdi
  2fcba4:      	movq	%rdi, %rax
  2fcba7:      	movq	%rdi, 0x160(%rsp)
  2fcbaf:      	mulq	%rsi
  2fcbb2:      	movq	%rdx, 0x30(%rsp)
  2fcbb7:      	movq	%rax, 0x28(%rsp)
  2fcbbc:      	movq	%r12, 0x360(%rsp)
  2fcbc4:      	movq	%r12, %rax
  2fcbc7:      	mulq	%r8
  2fcbca:      	movq	%rdx, %r9
  2fcbcd:      	movq	%rax, %r10
  2fcbd0:      	movq	%rcx, %rax
  2fcbd3:      	movq	%rcx, 0x38(%rsp)
  2fcbd8:      	mulq	%r14
  2fcbdb:      	movq	%rdx, %rbx
  2fcbde:      	movq	%rax, %r11
  2fcbe1:      	addq	%r10, %r11
  2fcbe4:      	adcq	%r9, %rbx
  2fcbe7:      	movq	%r12, %rax
  2fcbea:      	mulq	%r14
  2fcbed:      	movq	%r14, %r10
  2fcbf0:      	movq	%rdx, %r9
  2fcbf3:      	movq	%rax, %r12
  2fcbf6:      	movq	%rcx, %rax
  2fcbf9:      	mulq	%rsi
  2fcbfc:      	movq	%rdx, %r14
  2fcbff:      	addq	%r12, %rax
  2fcc02:      	adcq	%r9, %r14
  2fcc05:      	addq	%r11, %r14
  2fcc08:      	adcq	$0x0, %rbx
  2fcc0c:      	addq	0x28(%rsp), %r14
  2fcc11:      	adcq	0x30(%rsp), %rbx
  2fcc16:      	movq	%r10, %rsi
  2fcc19:      	imulq	%r10, %rdi
  2fcc1d:      	addq	%rbx, %rdi
  2fcc20:      	movq	%rdi, %rcx
  2fcc23:      	shrq	$0x2, %rcx
  2fcc27:      	leaq	(%rcx,%rcx,4), %r10
  2fcc2b:      	andl	$0x3, %edi
  2fcc2e:      	addq	%rax, %r10
  2fcc31:      	adcq	$0x0, %r14
  2fcc35:      	adcq	$0x0, %rdi
  2fcc39:      	movq	%rdi, %rax
  2fcc3c:      	movq	%rdi, 0x30(%rsp)
  2fcc41:      	movq	0x60(%rsp), %r11
  2fcc46:      	mulq	%r11
  2fcc49:      	movq	%rdx, 0x20(%rsp)
  2fcc4e:      	movq	%rax, 0x18(%rsp)
  2fcc53:      	movq	%r10, %rax
  2fcc56:      	movq	%r10, 0x28(%rsp)
  2fcc5b:      	mulq	%r8
  2fcc5e:      	movq	%rdx, %r9
  2fcc61:      	movq	%rax, %rbx
  2fcc64:      	movq	%r14, %rax
  2fcc67:      	mulq	%rsi
  2fcc6a:      	movq	%rdx, %r12
  2fcc6d:      	movq	%rax, %rcx
  2fcc70:      	addq	%rbx, %rcx
  2fcc73:      	adcq	%r9, %r12
  2fcc76:      	movq	%r10, %rax
  2fcc79:      	mulq	%rsi
  2fcc7c:      	movq	%rsi, %r8
  2fcc7f:      	movq	%rdx, %r9
  2fcc82:      	movq	%rax, %rsi
  2fcc85:      	movq	%r14, %rax
  2fcc88:      	mulq	%r11
  2fcc8b:      	movq	%r11, %r10
  2fcc8e:      	movq	%rdx, %rbx
  2fcc91:      	addq	%rsi, %rax
  2fcc94:      	adcq	%r9, %rbx
  2fcc97:      	addq	%rcx, %rbx
  2fcc9a:      	adcq	$0x0, %r12
  2fcc9e:      	addq	0x18(%rsp), %rbx
  2fcca3:      	adcq	0x20(%rsp), %r12
  2fcca8:      	movq	%rdi, %r11
  2fccab:      	imulq	%r8, %r11
  2fccaf:      	addq	%r12, %r11
  2fccb2:      	movq	%r11, %rcx
  2fccb5:      	shrq	$0x2, %rcx
  2fccb9:      	leaq	(%rcx,%rcx,4), %r12
  2fccbd:      	andl	$0x3, %r11d
  2fccc1:      	addq	%rax, %r12
  2fccc4:      	adcq	$0x0, %rbx
  2fccc8:      	adcq	$0x0, %r11
  2fcccc:      	movq	%r11, %rax
  2fcccf:      	mulq	%r10
  2fccd2:      	movq	%rdx, 0x20(%rsp)
  2fccd7:      	movq	%rax, 0x18(%rsp)
  2fccdc:      	movq	%r12, %rax
  2fccdf:      	mulq	0x40(%rsp)
  2fcce4:      	movq	%rdx, %rsi
  2fcce7:      	movq	%rax, %rcx
  2fccea:      	movq	%rbx, %rax
  2fcced:      	mulq	%r8
  2fccf0:      	movq	%r8, %rdi
  2fccf3:      	movq	%rdx, %r9
  2fccf6:      	movq	%rax, %r8
  2fccf9:      	addq	%rcx, %r8
  2fccfc:      	adcq	%rsi, %r9
  2fccff:      	movq	%r12, %rax
  2fcd02:      	mulq	%rdi
  2fcd05:      	movq	%rdx, %rcx
  2fcd08:      	movq	%rax, %rsi
  2fcd0b:      	movq	%rbx, %rax
  2fcd0e:      	mulq	%r10
  2fcd11:      	addq	%rsi, %rax
  2fcd14:      	adcq	%rcx, %rdx
  2fcd17:      	addq	%r8, %rdx
  2fcd1a:      	adcq	$0x0, %r9
  2fcd1e:      	addq	0x18(%rsp), %rdx
  2fcd23:      	adcq	0x20(%rsp), %r9
  2fcd28:      	movq	%r11, %rcx
  2fcd2b:      	imulq	%rdi, %rcx
  2fcd2f:      	addq	%r9, %rcx
  2fcd32:      	movq	%rcx, %rsi
  2fcd35:      	shrq	$0x2, %rsi
  2fcd39:      	leaq	(%rsi,%rsi,4), %rsi
  2fcd3d:      	andl	$0x3, %ecx
  2fcd40:      	addq	%rax, %rsi
  2fcd43:      	adcq	$0x0, %rdx
  2fcd47:      	adcq	$0x0, %rcx
  2fcd4b:      	movl	%esi, %r8d
  2fcd4e:      	andl	$0x3ffffff, %r8d        # imm = 0x3FFFFFF
  2fcd55:      	movq	%rdx, %rax
  2fcd58:      	shldq	$0xc, %rsi, %rax
  2fcd5d:      	shrq	$0x1a, %rsi
  2fcd61:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  2fcd67:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fcd6c:      	shldq	$0x18, %rdx, %rcx
  2fcd71:      	shrq	$0xe, %rdx
  2fcd75:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  2fcd7b:      	movq	%r8, 0x3e0(%rsp)
  2fcd83:      	movq	%rsi, 0x3e8(%rsp)
  2fcd8b:      	movq	%rax, 0x3f0(%rsp)
  2fcd93:      	movq	%rdx, 0x3f8(%rsp)
  2fcd9b:      	movq	%rcx, 0x400(%rsp)
  2fcda3:      	movq	%r8, 0x408(%rsp)
  2fcdab:      	movq	%rsi, 0x410(%rsp)
  2fcdb3:      	movq	%rax, 0x418(%rsp)
  2fcdbb:      	vmovdqu	0x3e0(%rsp), %xmm0
  2fcdc4:      	vpinsrq	$0x1, %r8, %xmm0, %xmm1
  2fcdca:      	vmovdqu	0x3e8(%rsp), %xmm0
  2fcdd3:      	vpinsrq	$0x1, %rsi, %xmm0, %xmm2
  2fcdd9:      	vmovq	%r8, %xmm4
  2fcdde:      	vmovdqu	0x3f0(%rsp), %xmm3
  2fcde7:      	vmovdqu	0x3f8(%rsp), %xmm5
  2fcdf0:      	vmovdqu	0x400(%rsp), %xmm0
  2fcdf9:      	movq	%r8, 0x3e0(%rsp)
  2fce01:      	vmovq	%rsi, %xmm13
  2fce06:      	vpinsrq	$0x1, %rax, %xmm3, %xmm7
  2fce0c:      	movq	%rsi, 0x3e8(%rsp)
  2fce14:      	vmovq	%rax, %xmm12
  2fce19:      	vpinsrq	$0x1, %rdx, %xmm5, %xmm8
  2fce1f:      	movq	%rax, 0x3f0(%rsp)
  2fce27:      	vmovq	%rdx, %xmm11
  2fce2c:      	movq	%rdx, 0x3f8(%rsp)
  2fce34:      	movq	0x28(%rsp), %rsi
  2fce39:      	movl	%esi, %edx
  2fce3b:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  2fce41:      	movq	%r14, %rax
  2fce44:      	shldq	$0xc, %rsi, %rax
  2fce49:      	shrq	$0x1a, %rsi
  2fce4d:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  2fce53:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fce58:      	movq	%rcx, 0x400(%rsp)
  2fce60:      	movq	%rdx, 0x408(%rsp)
  2fce68:      	movq	%rsi, 0x410(%rsp)
  2fce70:      	movq	%rax, 0x418(%rsp)
  2fce78:      	vmovdqu	0x3e0(%rsp), %xmm3
  2fce81:      	vpinsrq	$0x1, %rdx, %xmm3, %xmm6
  2fce87:      	vpinsrq	$0x1, %rcx, %xmm0, %xmm14
  2fce8d:      	vmovq	%rcx, %xmm15
  2fce92:      	movl	%r12d, %ecx
  2fce95:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  2fce9b:      	vmovq	%rcx, %xmm10
  2fcea0:      	vmovdqu	0x3e8(%rsp), %xmm0
  2fcea9:      	vpinsrq	$0x1, %rsi, %xmm0, %xmm0
  2fceaf:      	vmovdqa	%ymm0, 0x60(%rsp)
  2fceb5:      	movq	%rbx, %rcx
  2fceb8:      	shldq	$0xc, %r12, %rcx
  2fcebd:      	movq	0x360(%rsp), %r8
  2fcec5:      	movl	%r8d, %edx
  2fcec8:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  2fcece:      	vmovq	%rdx, %xmm3
  2fced3:      	shrq	$0x1a, %r12
  2fced7:      	andl	$0x3ffffff, %r12d       # imm = 0x3FFFFFF
  2fcede:      	vmovq	%r12, %xmm5
  2fcee3:      	movq	0x38(%rsp), %rsi
  2fcee8:      	movq	%rsi, %rdx
  2fceeb:      	shldq	$0xc, %r8, %rdx
  2fcef0:      	shrq	$0x1a, %r8
  2fcef4:      	andl	$0x3ffffff, %r8d        # imm = 0x3FFFFFF
  2fcefb:      	vmovq	%r8, %xmm9
  2fcf00:      	vpbroadcastq	%xmm4, %ymm4
  2fcf05:      	vpblendd	$0xf0, %ymm4, %ymm1, %ymm0 # ymm0 = ymm1[0,1,2,3],ymm4[4,5,6,7]
  2fcf0b:      	vmovdqu	0x3f0(%rsp), %xmm1
  2fcf14:      	vpinsrq	$0x1, %rax, %xmm1, %xmm1
  2fcf1a:      	vpbroadcastq	%xmm13, %ymm4
  2fcf1f:      	vpblendd	$0xf0, %ymm4, %ymm2, %ymm13 # ymm13 = ymm2[0,1,2,3],ymm4[4,5,6,7]
  2fcf25:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  2fcf2b:      	vmovq	%rcx, %xmm4
  2fcf30:      	vpbroadcastq	%xmm12, %ymm2
  2fcf35:      	vpblendd	$0xf0, %ymm2, %ymm7, %ymm12 # ymm12 = ymm7[0,1,2,3],ymm2[4,5,6,7]
  2fcf3b:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  2fcf41:      	vmovq	%rdx, %xmm7
  2fcf46:      	vpbroadcastq	%xmm11, %ymm2
  2fcf4b:      	vpblendd	$0xf0, %ymm2, %ymm8, %ymm8 # ymm8 = ymm8[0,1,2,3],ymm2[4,5,6,7]
  2fcf51:      	movq	0x30(%rsp), %rax
  2fcf56:      	shldq	$0x18, %r14, %rax
  2fcf5b:      	shrq	$0xe, %r14
  2fcf5f:      	andl	$0x3ffffff, %r14d       # imm = 0x3FFFFFF
  2fcf66:      	vmovdqu	0x3f8(%rsp), %xmm2
  2fcf6f:      	vpinsrq	$0x1, %r14, %xmm2, %xmm2
  2fcf75:      	vmovdqa	%ymm2, 0x360(%rsp)
  2fcf7e:      	vpbroadcastq	%xmm15, %ymm2
  2fcf83:      	vpblendd	$0xf0, %ymm2, %ymm14, %ymm11 # ymm11 = ymm14[0,1,2,3],ymm2[4,5,6,7]
  2fcf89:      	shldq	$0x18, %rbx, %r11
  2fcf8e:      	shrq	$0xe, %rbx
  2fcf92:      	andl	$0x3ffffff, %ebx        # imm = 0x3FFFFFF
  2fcf98:      	vmovq	%rbx, %xmm2
  2fcf9d:      	vmovdqa	%ymm0, 0x580(%rsp)
  2fcfa6:      	vpsllq	$0x2, %ymm13, %ymm0
  2fcfac:      	vpaddq	%ymm0, %ymm13, %ymm0
  2fcfb0:      	vmovdqa	%ymm13, 0x5a0(%rsp)
  2fcfb9:      	vpsllq	$0x2, %ymm12, %ymm13
  2fcfbf:      	vpaddq	%ymm12, %ymm13, %ymm13
  2fcfc4:      	vmovdqa	%ymm12, 0x5c0(%rsp)
  2fcfcd:      	vpsllq	$0x2, %ymm8, %ymm12
  2fcfd3:      	vpaddq	%ymm8, %ymm12, %ymm12
  2fcfd8:      	vmovdqa	%ymm8, 0x5e0(%rsp)
  2fcfe1:      	vpsllq	$0x2, %ymm11, %ymm8
  2fcfe7:      	vpaddq	%ymm11, %ymm8, %ymm15
  2fcfec:      	vmovdqa	%ymm11, 0x600(%rsp)
  2fcff5:      	vmovdqu	0x400(%rsp), %xmm8
  2fcffe:      	vpinsrq	$0x1, %rax, %xmm8, %xmm8
  2fd004:      	vmovdqa	%ymm0, 0x500(%rsp)
  2fd00d:      	movq	%rsi, %rax
  2fd010:      	movq	0x160(%rsp), %rcx
  2fd018:      	shldq	$0x18, %rsi, %rcx
  2fd01d:      	shrq	$0xe, %rax
  2fd021:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fd026:      	vmovq	%rax, %xmm14
  2fd02b:      	vmovdqa	%ymm13, 0x520(%rsp)
  2fd034:      	vmovq	%r11, %xmm13
  2fd039:      	vmovdqa	%ymm12, 0x540(%rsp)
  2fd042:      	vmovq	%rcx, %xmm12
  2fd047:      	movq	0x380(%rsp), %rdx
  2fd04f:      	movl	%edx, %eax
  2fd051:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fd056:      	movq	%rax, 0xc0(%rsp)
  2fd05e:      	movq	0x3c0(%rsp), %rcx
  2fd066:      	movq	%rcx, %rax
  2fd069:      	shldq	$0xc, %rdx, %rax
  2fd06e:      	shrq	$0x1a, %rdx
  2fd072:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  2fd078:      	movq	%rdx, 0xc8(%rsp)
  2fd080:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fd085:      	movq	%rax, 0xd0(%rsp)
  2fd08d:      	vmovdqa	%ymm15, 0x560(%rsp)
  2fd096:      	vpbroadcastq	%xmm10, %ymm0
  2fd09b:      	movq	%rcx, %rax
  2fd09e:      	movq	0x3a0(%rsp), %rsi
  2fd0a6:      	shldq	$0x18, %rcx, %rsi
  2fd0ab:      	vpblendd	$0x30, %ymm0, %ymm6, %ymm0 # ymm0 = ymm6[0,1,2,3],ymm0[4,5],ymm6[6,7]
  2fd0b1:      	shrq	$0xe, %rax
  2fd0b5:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fd0ba:      	movq	%rax, 0xd8(%rsp)
  2fd0c2:      	movq	0x1c0(%rsp), %rdx
  2fd0ca:      	movl	%edx, %ecx
  2fd0cc:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  2fd0d2:      	movq	%rsi, 0xe0(%rsp)
  2fd0da:      	movq	0x200(%rsp), %rsi
  2fd0e2:      	movq	%rsi, %rax
  2fd0e5:      	shldq	$0xc, %rdx, %rax
  2fd0ea:      	shrq	$0x1a, %rdx
  2fd0ee:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  2fd0f4:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fd0f9:      	movq	%rcx, 0xe8(%rsp)
  2fd101:      	movq	%rdx, 0xf0(%rsp)
  2fd109:      	movq	%rax, 0xf8(%rsp)
  2fd111:      	vmovdqu	0xc0(%rsp), %xmm6
  2fd11a:      	vpinsrq	$0x1, %rcx, %xmm6, %xmm11
  2fd120:      	movq	0x180(%rsp), %r8
  2fd128:      	movl	%r8d, %ecx
  2fd12b:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  2fd131:      	vmovq	%rcx, %xmm10
  2fd136:      	vpbroadcastq	%xmm3, %ymm3
  2fd13b:      	vpblendd	$0xc0, %ymm3, %ymm0, %ymm15 # ymm15 = ymm0[0,1,2,3,4,5],ymm3[6,7]
  2fd141:      	vpbroadcastq	%xmm5, %ymm0
  2fd146:      	vpblendd	$0xcf, 0x60(%rsp), %ymm0, %ymm0 # ymm0 = mem[0,1,2,3],ymm0[4,5],mem[6,7]
  2fd14e:      	vpbroadcastq	%xmm9, %ymm5
  2fd153:      	vmovdqu	0xc8(%rsp), %xmm3
  2fd15c:      	vpinsrq	$0x1, %rdx, %xmm3, %xmm6
  2fd162:      	movq	%rdi, %rdx
  2fd165:      	movl	%edx, %ecx
  2fd167:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  2fd16d:      	vmovq	%rcx, %xmm3
  2fd172:      	movq	0x1a0(%rsp), %rdi
  2fd17a:      	movq	%rdi, %rcx
  2fd17d:      	shldq	$0xc, %r8, %rcx
  2fd182:      	vpblendd	$0xc0, %ymm5, %ymm0, %ymm9 # ymm9 = ymm0[0,1,2,3,4,5],ymm5[6,7]
  2fd188:      	shrq	$0x1a, %r8
  2fd18c:      	andl	$0x3ffffff, %r8d        # imm = 0x3FFFFFF
  2fd193:      	vmovq	%r8, %xmm5
  2fd198:      	vpbroadcastq	%xmm4, %ymm0
  2fd19d:      	vpblendd	$0x30, %ymm0, %ymm1, %ymm0 # ymm0 = ymm1[0,1,2,3],ymm0[4,5],ymm1[6,7]
  2fd1a3:      	vpbroadcastq	%xmm7, %ymm1
  2fd1a8:      	vpblendd	$0xc0, %ymm1, %ymm0, %ymm0 # ymm0 = ymm0[0,1,2,3,4,5],ymm1[6,7]
  2fd1ae:      	vmovdqu	0xd0(%rsp), %xmm1
  2fd1b7:      	vpinsrq	$0x1, %rax, %xmm1, %xmm1
  2fd1bd:      	movq	0x40(%rsp), %r8
  2fd1c2:      	movq	%r8, %rax
  2fd1c5:      	shldq	$0xc, %rdx, %rax
  2fd1ca:      	shrq	$0x1a, %rdx
  2fd1ce:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  2fd1d4:      	vmovq	%rdx, %xmm4
  2fd1d9:      	vpbroadcastq	%xmm2, %ymm2
  2fd1de:      	vpblendd	$0xcf, 0x360(%rsp), %ymm2, %ymm7 # ymm7 = mem[0,1,2,3],ymm2[4,5],mem[6,7]
  2fd1e9:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  2fd1ef:      	vmovq	%rcx, %xmm2
  2fd1f4:      	vpbroadcastq	%xmm14, %ymm14
  2fd1f9:      	vpblendd	$0xc0, %ymm14, %ymm7, %ymm14 # ymm14 = ymm7[0,1,2,3,4,5],ymm14[6,7]
  2fd1ff:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fd204:      	vmovq	%rax, %xmm7
  2fd209:      	vpbroadcastq	%xmm13, %ymm13
  2fd20e:      	movq	0x80(%rsp), %rdx
  2fd216:      	movq	%rsi, %rax
  2fd219:      	shldq	$0x18, %rsi, %rdx
  2fd21e:      	vpblendd	$0x30, %ymm13, %ymm8, %ymm13 # ymm13 = ymm8[0,1,2,3],ymm13[4,5],ymm8[6,7]
  2fd224:      	shrq	$0xe, %rax
  2fd228:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fd22d:      	vmovdqu	0xd8(%rsp), %xmm8
  2fd236:      	vpinsrq	$0x1, %rax, %xmm8, %xmm8
  2fd23c:      	vpbroadcastq	%xmm12, %ymm12
  2fd241:      	vpblendd	$0xc0, %ymm12, %ymm13, %ymm12 # ymm12 = ymm13[0,1,2,3,4,5],ymm12[6,7]
  2fd247:      	vpsllq	$0x2, %ymm9, %ymm13
  2fd24d:      	vpaddq	%ymm9, %ymm13, %ymm13
  2fd252:      	vmovdqa	%ymm15, 0x6a0(%rsp)
  2fd25b:      	vpsllq	$0x2, %ymm0, %ymm15
  2fd260:      	vpaddq	%ymm0, %ymm15, %ymm15
  2fd264:      	vmovdqa	%ymm9, 0x6c0(%rsp)
  2fd26d:      	vpsllq	$0x2, %ymm14, %ymm9
  2fd273:      	vpaddq	%ymm14, %ymm9, %ymm9
  2fd278:      	vmovdqa	%ymm0, 0x6e0(%rsp)
  2fd281:      	vpsllq	$0x2, %ymm12, %ymm0
  2fd287:      	vpaddq	%ymm0, %ymm12, %ymm0
  2fd28b:      	vmovdqa	%ymm14, 0x700(%rsp)
  2fd294:      	vmovdqa	%ymm12, 0x720(%rsp)
  2fd29d:      	movq	%rdi, %rax
  2fd2a0:      	movq	0x1e0(%rsp), %rsi
  2fd2a8:      	shldq	$0x18, %rdi, %rsi
  2fd2ad:      	shrq	$0xe, %rax
  2fd2b1:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fd2b6:      	vmovq	%rax, %xmm12
  2fd2bb:      	movq	%r8, %rax
  2fd2be:      	shrq	$0xe, %rax
  2fd2c2:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  2fd2c7:      	vmovq	%rax, %xmm14
  2fd2cc:      	vmovdqa	%ymm13, 0x620(%rsp)
  2fd2d5:      	vmovdqu	0xe0(%rsp), %xmm13
  2fd2de:      	vpinsrq	$0x1, %rdx, %xmm13, %xmm13
  2fd2e4:      	vmovdqa	%ymm15, 0x640(%rsp)
  2fd2ed:      	vmovq	%rsi, %xmm15
  2fd2f2:      	vmovdqa	%ymm9, 0x660(%rsp)
  2fd2fb:      	vmovdqa	%ymm0, 0x680(%rsp)
  2fd304:      	vpbroadcastq	%xmm10, %ymm0
  2fd309:      	vpblendd	$0x30, %ymm0, %ymm11, %ymm0 # ymm0 = ymm11[0,1,2,3],ymm0[4,5],ymm11[6,7]
  2fd30f:      	vpbroadcastq	%xmm3, %ymm3
  2fd314:      	vpblendd	$0xc0, %ymm3, %ymm0, %ymm0 # ymm0 = ymm0[0,1,2,3,4,5],ymm3[6,7]
  2fd31a:      	vpbroadcastq	%xmm5, %ymm3
  2fd31f:      	vpblendd	$0x30, %ymm3, %ymm6, %ymm3 # ymm3 = ymm6[0,1,2,3],ymm3[4,5],ymm6[6,7]
  2fd325:      	vpbroadcastq	%xmm4, %ymm4
  2fd32a:      	vpblendd	$0xc0, %ymm4, %ymm3, %ymm3 # ymm3 = ymm3[0,1,2,3,4,5],ymm4[6,7]
  2fd330:      	vpbroadcastq	%xmm2, %ymm2
  2fd335:      	vpblendd	$0x30, %ymm2, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm2[4,5],ymm1[6,7]
  2fd33b:      	movq	%r8, %rax
  2fd33e:      	shrq	$0x28, %rax
  2fd342:      	vpbroadcastq	%xmm7, %ymm2
  2fd347:      	vpblendd	$0xc0, %ymm2, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3,4,5],ymm2[6,7]
  2fd34d:      	vpbroadcastq	%xmm12, %ymm2
  2fd352:      	vpblendd	$0x30, %ymm2, %ymm8, %ymm2 # ymm2 = ymm8[0,1,2,3],ymm2[4,5],ymm8[6,7]
  2fd358:      	vpbroadcastq	%xmm14, %ymm4
  2fd35d:      	vpblendd	$0xc0, %ymm4, %ymm2, %ymm2 # ymm2 = ymm2[0,1,2,3,4,5],ymm4[6,7]
  2fd363:      	vpbroadcastq	%xmm15, %ymm4
  2fd368:      	vpblendd	$0x30, %ymm4, %ymm13, %ymm4 # ymm4 = ymm13[0,1,2,3],ymm4[4,5],ymm13[6,7]
  2fd36e:      	vmovq	%rax, %xmm5
  2fd373:      	vpbroadcastq	%xmm5, %ymm5
  2fd378:      	vpblendd	$0xc0, %ymm5, %ymm4, %ymm4 # ymm4 = ymm4[0,1,2,3,4,5],ymm5[6,7]
  2fd37e:      	vpsllq	$0x2, %ymm3, %ymm5
  2fd383:      	vpaddq	%ymm3, %ymm5, %ymm5
  2fd387:      	vpsllq	$0x2, %ymm1, %ymm6
  2fd38c:      	vpaddq	%ymm1, %ymm6, %ymm6
  2fd390:      	vpsllq	$0x2, %ymm2, %ymm7
  2fd395:      	vpaddq	%ymm2, %ymm7, %ymm7
  2fd399:      	vpsllq	$0x2, %ymm4, %ymm8
  2fd39e:      	vpaddq	%ymm4, %ymm8, %ymm8
  2fd3a2:      	vmovdqa	%ymm0, 0x460(%rsp)
  2fd3ab:      	vmovdqa	%ymm3, 0x480(%rsp)
  2fd3b4:      	vmovdqa	%ymm1, 0x4a0(%rsp)
  2fd3bd:      	vmovdqa	%ymm2, 0x4c0(%rsp)
  2fd3c6:      	vmovdqa	%ymm4, 0x4e0(%rsp)
  2fd3cf:      	vmovdqa	%ymm5, 0x3e0(%rsp)
  2fd3d8:      	vmovdqa	%ymm6, 0x400(%rsp)
  2fd3e1:      	vmovdqa	%ymm7, 0x420(%rsp)
  2fd3ea:      	vmovdqa	%ymm8, 0x440(%rsp)
  2fd3f3:      	vpxor	%xmm0, %xmm0, %xmm0
  2fd3f7:      	vmovdqa	%ymm0, 0x340(%rsp)
  2fd400:      	vmovdqa	%ymm0, 0x320(%rsp)
  2fd409:      	vmovdqa	%ymm0, 0x300(%rsp)
  2fd412:      	vmovdqa	%ymm0, 0x2e0(%rsp)
  2fd41b:      	vmovdqa	%ymm0, 0x2c0(%rsp)
  2fd424:      	decq	%r13
  2fd427:      	movq	%r13, %rax
  2fd42a:      	shlq	$0x7, %rax
  2fd42e:      	addq	%r15, %rax
  2fd431:      	vpxor	%xmm2, %xmm2, %xmm2
  2fd435:      	vpxor	%xmm1, %xmm1, %xmm1
  2fd439:      	vpxor	%xmm4, %xmm4, %xmm4
  2fd43d:      	vpxor	%xmm3, %xmm3, %xmm3
  2fd441:      	testq	%r13, %r13
  2fd444:      	je	0x2fd773 <toyos_crypto::arch::x86_64::poly1305::blocks+0xec3>
  2fd44a:      	movq	%rax, 0x180(%rsp)
  2fd452:      	addq	$0x70, %r15
  2fd456:      	vbroadcastsd	-0x2216b7(%rip), %ymm0 # 0xdbda8 <kbrainpoolP224r1MontA+0x108>
  2fd45f:      	vmovaps	%ymm0, 0x40(%rsp)
  2fd465:      	vpbroadcastq	-0x22162e(%rip), %ymm0 # 0xdbe40 <anon.54511efdcd5263d69ddc2501edb1ac10.13.llvm.1656325251768278046+0x48>
  2fd46e:      	vmovdqa	%ymm0, 0x80(%rsp)
  2fd477:      	leaq	0x500(%rsp), %r14
  2fd47f:      	leaq	0xc0(%rsp), %r12
  2fd487:      	leaq	0x2c0(%rsp), %rbx
  2fd48f:      	nop
  2fd490:      	vmovdqu	-0x70(%r15), %ymm0
  2fd496:      	vmovdqu	-0x50(%r15), %ymm1
  2fd49c:      	vmovdqu	-0x30(%r15), %ymm3
  2fd4a2:      	vmovdqu	-0x10(%r15), %ymm7
  2fd4a8:      	vpunpckhqdq	%ymm1, %ymm0, %ymm2 # ymm2 = ymm0[1],ymm1[1],ymm0[3],ymm1[3]
  2fd4ac:      	vpsrlq	$0x28, %ymm2, %ymm6
  2fd4b1:      	vpunpcklqdq	%ymm1, %ymm0, %ymm4 # ymm4 = ymm0[0],ymm1[0],ymm0[2],ymm1[2]
  2fd4b5:      	vpsrlq	$0x34, %ymm4, %ymm0
  2fd4ba:      	vpsllq	$0xc, %ymm2, %ymm1
  2fd4bf:      	vpor	%ymm0, %ymm1, %ymm5
  2fd4c3:      	vpsrlq	$0x1a, %ymm4, %ymm0
  2fd4c8:      	vmovdqa	0x40(%rsp), %ymm13
  2fd4ce:      	vpand	%ymm0, %ymm13, %ymm8
  2fd4d2:      	vpunpcklqdq	%ymm7, %ymm3, %ymm1 # ymm1 = ymm3[0],ymm7[0],ymm3[2],ymm7[2]
  2fd4d6:      	vpunpckhqdq	%ymm7, %ymm3, %ymm0 # ymm0 = ymm3[1],ymm7[1],ymm3[3],ymm7[3]
  2fd4da:      	vpsrlq	$0x34, %ymm1, %ymm3
  2fd4df:      	vpsllq	$0xc, %ymm0, %ymm7
  2fd4e4:      	vpor	%ymm3, %ymm7, %ymm3
  2fd4e8:      	vmovdqa	0x220(%rsp), %ymm7
  2fd4f1:      	vmovdqa	0x280(%rsp), %ymm9
  2fd4fa:      	vpsrlq	$0x1a, %ymm7, %ymm10
  2fd4ff:      	vpaddq	0x240(%rsp), %ymm10, %ymm10
  2fd508:      	vpsrlq	$0x1a, %ymm9, %ymm11
  2fd50e:      	vpaddq	0x2a0(%rsp), %ymm11, %ymm11
  2fd517:      	vpand	%ymm13, %ymm10, %ymm12
  2fd51c:      	vpaddq	%ymm8, %ymm12, %ymm8
  2fd521:      	vpand	%ymm13, %ymm11, %ymm12
  2fd526:      	vpaddq	%ymm6, %ymm12, %ymm6
  2fd52a:      	vpand	%ymm7, %ymm13, %ymm7
  2fd52e:      	vpand	%ymm13, %ymm9, %ymm9
  2fd533:      	vpsrlq	$0x1a, %ymm10, %ymm10
  2fd539:      	vpaddq	0x260(%rsp), %ymm10, %ymm10
  2fd542:      	vpsrlq	$0x1a, %ymm11, %ymm11
  2fd548:      	vpaddq	%ymm7, %ymm11, %ymm7
  2fd54c:      	vpsllq	$0x2, %ymm11, %ymm11
  2fd552:      	vpaddq	%ymm7, %ymm11, %ymm7
  2fd556:      	vpsrlq	$0x1a, %ymm10, %ymm11
  2fd55c:      	vpaddq	%ymm9, %ymm11, %ymm9
  2fd561:      	vpand	%ymm5, %ymm13, %ymm5
  2fd565:      	vpand	%ymm13, %ymm10, %ymm10
  2fd56a:      	vpaddq	%ymm5, %ymm10, %ymm5
  2fd56e:      	vpsrlq	$0x1a, %ymm7, %ymm10
  2fd573:      	vpaddq	%ymm10, %ymm8, %ymm8
  2fd578:      	vpsrlq	$0xe, %ymm2, %ymm2
  2fd57d:      	vpand	%ymm2, %ymm13, %ymm2
  2fd581:      	vpand	%ymm4, %ymm13, %ymm4
  2fd585:      	vpand	%ymm7, %ymm13, %ymm7
  2fd589:      	vpaddq	%ymm4, %ymm7, %ymm4
  2fd58d:      	vpand	%ymm13, %ymm9, %ymm7
  2fd592:      	vpaddq	%ymm2, %ymm7, %ymm2
  2fd596:      	vpsrlq	$0x1a, %ymm9, %ymm7
  2fd59c:      	vpaddq	0x80(%rsp), %ymm6, %ymm6
  2fd5a5:      	vpaddq	%ymm7, %ymm6, %ymm6
  2fd5a9:      	vmovdqa	%ymm4, 0xc0(%rsp)
  2fd5b2:      	vmovdqa	%ymm8, 0xe0(%rsp)
  2fd5bb:      	vmovdqa	%ymm5, 0x100(%rsp)
  2fd5c4:      	vmovdqa	%ymm2, 0x120(%rsp)
  2fd5cd:      	vpand	%ymm1, %ymm13, %ymm2
  2fd5d1:      	vmovdqa	%ymm2, 0x60(%rsp)
  2fd5d7:      	vpsrlq	$0x1a, %ymm1, %ymm1
  2fd5dc:      	vpand	%ymm1, %ymm13, %ymm1
  2fd5e0:      	vmovdqa	%ymm1, 0x1c0(%rsp)
  2fd5e9:      	vpand	%ymm3, %ymm13, %ymm1
  2fd5ed:      	vmovdqa	%ymm1, 0x1e0(%rsp)
  2fd5f6:      	vmovdqa	%ymm6, 0x140(%rsp)
  2fd5ff:      	vpsrlq	$0xe, %ymm0, %ymm1
  2fd604:      	vpand	%ymm1, %ymm13, %ymm1
  2fd608:      	vmovdqa	%ymm1, 0x200(%rsp)
  2fd611:      	vpsrlq	$0x28, %ymm0, %ymm0
  2fd616:      	vmovdqa	%ymm0, 0x1a0(%rsp)
  2fd61f:      	leaq	0x220(%rsp), %rdi
  2fd627:      	movq	%r14, %rsi
  2fd62a:      	movq	%r12, %rdx
  2fd62d:      	vzeroupper
  2fd630:      	callq	0x2fc410 <<toyos_crypto::arch::x86_64::poly1305::Multiplier>::product>
  2fd635:      	vmovdqa	0x2c0(%rsp), %ymm0
  2fd63e:      	vmovdqa	0x320(%rsp), %ymm1
  2fd647:      	vpsrlq	$0x1a, %ymm0, %ymm2
  2fd64c:      	vpaddq	0x2e0(%rsp), %ymm2, %ymm2
  2fd655:      	vmovdqa	0x40(%rsp), %ymm7
  2fd65b:      	vpand	%ymm7, %ymm0, %ymm0
  2fd65f:      	vpsrlq	$0x1a, %ymm1, %ymm3
  2fd664:      	vpaddq	0x340(%rsp), %ymm3, %ymm3
  2fd66d:      	vpand	%ymm7, %ymm1, %ymm1
  2fd671:      	vpsrlq	$0x1a, %ymm2, %ymm4
  2fd676:      	vpaddq	0x300(%rsp), %ymm4, %ymm4
  2fd67f:      	vpand	%ymm7, %ymm2, %ymm2
  2fd683:      	vpaddq	0x1c0(%rsp), %ymm2, %ymm2
  2fd68c:      	vpsrlq	$0x1a, %ymm3, %ymm5
  2fd691:      	vpand	%ymm7, %ymm3, %ymm3
  2fd695:      	vpaddq	0x1a0(%rsp), %ymm3, %ymm3
  2fd69e:      	vpsllq	$0x2, %ymm5, %ymm6
  2fd6a3:      	vpaddq	%ymm0, %ymm5, %ymm0
  2fd6a7:      	vpaddq	%ymm0, %ymm6, %ymm0
  2fd6ab:      	vpsrlq	$0x1a, %ymm4, %ymm5
  2fd6b0:      	vpaddq	%ymm1, %ymm5, %ymm1
  2fd6b4:      	vpand	%ymm7, %ymm4, %ymm4
  2fd6b8:      	vpaddq	0x1e0(%rsp), %ymm4, %ymm4
  2fd6c1:      	vpsrlq	$0x1a, %ymm0, %ymm5
  2fd6c6:      	vpaddq	%ymm5, %ymm2, %ymm2
  2fd6ca:      	vpand	%ymm7, %ymm0, %ymm0
  2fd6ce:      	vpaddq	0x60(%rsp), %ymm0, %ymm0
  2fd6d4:      	vpsrlq	$0x1a, %ymm1, %ymm5
  2fd6d9:      	vpand	%ymm7, %ymm1, %ymm1
  2fd6dd:      	vpaddq	0x200(%rsp), %ymm1, %ymm1
  2fd6e6:      	vpaddq	0x80(%rsp), %ymm3, %ymm3
  2fd6ef:      	vpaddq	%ymm5, %ymm3, %ymm3
  2fd6f3:      	vmovdqa	%ymm0, 0xc0(%rsp)
  2fd6fc:      	vmovdqa	%ymm2, 0xe0(%rsp)
  2fd705:      	vmovdqa	%ymm4, 0x100(%rsp)
  2fd70e:      	vmovdqa	%ymm1, 0x120(%rsp)
  2fd717:      	vmovdqa	%ymm3, 0x140(%rsp)
  2fd720:      	movq	%rbx, %rdi
  2fd723:      	movq	%r14, %rsi
  2fd726:      	movq	%r12, %rdx
  2fd729:      	vzeroupper
  2fd72c:      	callq	0x2fc410 <<toyos_crypto::arch::x86_64::poly1305::Multiplier>::product>
  2fd731:      	subq	$-0x80, %r15
  2fd735:      	decq	%r13
  2fd738:      	jne	0x2fd490 <toyos_crypto::arch::x86_64::poly1305::blocks+0xbe0>
  2fd73e:      	vmovdqa	0x2c0(%rsp), %ymm3
  2fd747:      	vmovdqa	0x2e0(%rsp), %ymm4
  2fd750:      	vmovdqa	0x300(%rsp), %ymm1
  2fd759:      	vmovdqa	0x320(%rsp), %ymm2
  2fd762:      	vmovdqa	0x340(%rsp), %ymm0
  2fd76b:      	movq	0x180(%rsp), %rax
  2fd773:      	vmovdqa	%ymm0, 0x3a0(%rsp)
  2fd77c:      	vmovdqa	%ymm3, 0x3c0(%rsp)
  2fd785:      	vmovdqa	%ymm4, 0x1c0(%rsp)
  2fd78e:      	vmovdqa	%ymm1, 0x200(%rsp)
  2fd797:      	vmovdqa	%ymm2, 0x60(%rsp)
  2fd79d:      	vmovdqu	(%rax), %ymm2
  2fd7a1:      	vmovdqu	0x20(%rax), %ymm3
  2fd7a6:      	vmovdqu	0x40(%rax), %ymm4
  2fd7ab:      	vmovdqu	0x60(%rax), %ymm5
  2fd7b0:      	vpunpckhqdq	%ymm3, %ymm2, %ymm6 # ymm6 = ymm2[1],ymm3[1],ymm2[3],ymm3[3]
  2fd7b4:      	vpsrlq	$0x28, %ymm6, %ymm1
  2fd7b9:      	vpsrlq	$0xe, %ymm6, %ymm0
  2fd7be:      	vpbroadcastq	-0x221a1f(%rip), %ymm10 # 0xdbda8 <kbrainpoolP224r1MontA+0x108>
  2fd7c7:      	vmovdqa	%ymm10, 0x40(%rsp)
  2fd7cd:      	vpand	%ymm0, %ymm10, %ymm0
  2fd7d1:      	vpunpcklqdq	%ymm3, %ymm2, %ymm2 # ymm2 = ymm2[0],ymm3[0],ymm2[2],ymm3[2]
  2fd7d5:      	vpsrlq	$0x34, %ymm2, %ymm3
  2fd7da:      	vpsllq	$0xc, %ymm6, %ymm6
  2fd7df:      	vpor	%ymm3, %ymm6, %ymm3
  2fd7e3:      	vpand	%ymm3, %ymm10, %ymm3
  2fd7e7:      	vpsrlq	$0x1a, %ymm2, %ymm6
  2fd7ec:      	vpand	%ymm6, %ymm10, %ymm6
  2fd7f0:      	vpand	%ymm2, %ymm10, %ymm2
  2fd7f4:      	vpunpcklqdq	%ymm5, %ymm4, %ymm7 # ymm7 = ymm4[0],ymm5[0],ymm4[2],ymm5[2]
  2fd7f8:      	vpunpckhqdq	%ymm5, %ymm4, %ymm4 # ymm4 = ymm4[1],ymm5[1],ymm4[3],ymm5[3]
  2fd7fc:      	vpand	%ymm7, %ymm10, %ymm5
  2fd800:      	vmovdqa	%ymm5, 0x80(%rsp)
  2fd809:      	vpsrlq	$0x1a, %ymm7, %ymm5
  2fd80e:      	vpand	%ymm5, %ymm10, %ymm5
  2fd812:      	vmovdqa	%ymm5, 0x1a0(%rsp)
  2fd81b:      	vpsrlq	$0x34, %ymm7, %ymm5
  2fd820:      	vpsllq	$0xc, %ymm4, %ymm7
  2fd825:      	vpor	%ymm5, %ymm7, %ymm5
  2fd829:      	vpand	%ymm5, %ymm10, %ymm5
  2fd82d:      	vmovdqa	%ymm5, 0x380(%rsp)
  2fd836:      	vpsrlq	$0xe, %ymm4, %ymm5
  2fd83b:      	vpand	%ymm5, %ymm10, %ymm5
  2fd83f:      	vmovdqa	%ymm5, 0x180(%rsp)
  2fd848:      	vpsrlq	$0x28, %ymm4, %ymm4
  2fd84d:      	vmovdqa	%ymm4, 0x1e0(%rsp)
  2fd856:      	vmovdqa	0x220(%rsp), %ymm4
  2fd85f:      	vmovdqa	0x280(%rsp), %ymm5
  2fd868:      	vpsrlq	$0x1a, %ymm4, %ymm7
  2fd86d:      	vpaddq	0x240(%rsp), %ymm7, %ymm7
  2fd876:      	vpand	%ymm4, %ymm10, %ymm4
  2fd87a:      	vpsrlq	$0x1a, %ymm5, %ymm8
  2fd87f:      	vpaddq	0x2a0(%rsp), %ymm8, %ymm8
  2fd888:      	vpand	%ymm5, %ymm10, %ymm5
  2fd88c:      	vpsrlq	$0x1a, %ymm7, %ymm9
  2fd891:      	vpaddq	0x260(%rsp), %ymm9, %ymm9
  2fd89a:      	vpand	%ymm7, %ymm10, %ymm7
  2fd89e:      	vpaddq	%ymm6, %ymm7, %ymm6
  2fd8a2:      	vpsrlq	$0x1a, %ymm8, %ymm7
  2fd8a8:      	vpand	%ymm10, %ymm8, %ymm8
  2fd8ad:      	vpaddq	%ymm1, %ymm8, %ymm1
  2fd8b1:      	vpsllq	$0x2, %ymm7, %ymm8
  2fd8b6:      	vpaddq	%ymm4, %ymm7, %ymm4
  2fd8ba:      	vpaddq	%ymm4, %ymm8, %ymm4
  2fd8be:      	vpsrlq	$0x1a, %ymm9, %ymm7
  2fd8c4:      	vpaddq	%ymm5, %ymm7, %ymm5
  2fd8c8:      	vpand	%ymm10, %ymm9, %ymm7
  2fd8cd:      	vpaddq	%ymm3, %ymm7, %ymm3
  2fd8d1:      	vpsrlq	$0x1a, %ymm4, %ymm7
  2fd8d6:      	vpaddq	%ymm7, %ymm6, %ymm6
  2fd8da:      	vpand	%ymm4, %ymm10, %ymm4
  2fd8de:      	vpaddq	%ymm2, %ymm4, %ymm2
  2fd8e2:      	vpsrlq	$0x1a, %ymm5, %ymm4
  2fd8e7:      	vpand	%ymm5, %ymm10, %ymm5
  2fd8eb:      	vpbroadcastq	-0x221ab4(%rip), %ymm7 # 0xdbe40 <anon.54511efdcd5263d69ddc2501edb1ac10.13.llvm.1656325251768278046+0x48>
  2fd8f4:      	vmovdqa	%ymm7, 0x160(%rsp)
  2fd8fd:      	vpaddq	%ymm0, %ymm5, %ymm0
  2fd901:      	vpaddq	%ymm7, %ymm1, %ymm1
  2fd905:      	vpaddq	%ymm4, %ymm1, %ymm1
  2fd909:      	vmovdqa	%ymm2, 0xc0(%rsp)
  2fd912:      	vmovdqa	%ymm6, 0xe0(%rsp)
  2fd91b:      	vmovdqa	%ymm3, 0x100(%rsp)
  2fd924:      	vmovdqa	%ymm0, 0x120(%rsp)
  2fd92d:      	vmovdqa	%ymm1, 0x140(%rsp)
  2fd936:      	leaq	0x220(%rsp), %rdi
  2fd93e:      	leaq	0x620(%rsp), %rsi
  2fd946:      	leaq	0xc0(%rsp), %rdx
  2fd94e:      	vzeroupper
  2fd951:      	callq	0x2fc410 <<toyos_crypto::arch::x86_64::poly1305::Multiplier>::product>
  2fd956:      	vmovdqa	0x3c0(%rsp), %ymm1
  2fd95f:      	vpsrlq	$0x1a, %ymm1, %ymm0
  2fd964:      	vpaddq	0x1c0(%rsp), %ymm0, %ymm0
  2fd96d:      	vmovdqa	0x40(%rsp), %ymm7
  2fd973:      	vpand	%ymm7, %ymm1, %ymm1
  2fd977:      	vmovdqa	0x60(%rsp), %ymm3
  2fd97d:      	vpsrlq	$0x1a, %ymm3, %ymm2
  2fd982:      	vpaddq	0x3a0(%rsp), %ymm2, %ymm2
  2fd98b:      	vpand	%ymm7, %ymm3, %ymm3
  2fd98f:      	vpsrlq	$0x1a, %ymm0, %ymm4
  2fd994:      	vpaddq	0x200(%rsp), %ymm4, %ymm4
  2fd99d:      	vpand	%ymm7, %ymm0, %ymm0
  2fd9a1:      	vpsrlq	$0x1a, %ymm2, %ymm5
  2fd9a6:      	vpand	%ymm7, %ymm2, %ymm2
  2fd9aa:      	vpsllq	$0x2, %ymm5, %ymm6
  2fd9af:      	vpaddq	%ymm5, %ymm6, %ymm5
  2fd9b3:      	vpaddq	%ymm1, %ymm5, %ymm1
  2fd9b7:      	vpsrlq	$0x1a, %ymm4, %ymm5
  2fd9bc:      	vpaddq	%ymm3, %ymm5, %ymm3
  2fd9c0:      	vpand	%ymm7, %ymm4, %ymm4
  2fd9c4:      	vpaddq	0x380(%rsp), %ymm4, %ymm4
  2fd9cd:      	vpsrlq	$0x1a, %ymm1, %ymm5
  2fd9d2:      	vpaddq	%ymm5, %ymm0, %ymm0
  2fd9d6:      	vpaddq	0x1a0(%rsp), %ymm0, %ymm0
  2fd9df:      	vpand	%ymm7, %ymm1, %ymm1
  2fd9e3:      	vpaddq	0x80(%rsp), %ymm1, %ymm1
  2fd9ec:      	vpsrlq	$0x1a, %ymm3, %ymm5
  2fd9f1:      	vpaddq	%ymm5, %ymm2, %ymm2
  2fd9f5:      	vpand	%ymm7, %ymm3, %ymm3
  2fd9f9:      	vpaddq	0x180(%rsp), %ymm3, %ymm3
  2fda02:      	vpaddq	0x160(%rsp), %ymm2, %ymm2
  2fda0b:      	vpaddq	0x1e0(%rsp), %ymm2, %ymm2
  2fda14:      	vmovdqa	%ymm1, 0xc0(%rsp)
  2fda1d:      	vmovdqa	%ymm0, 0xe0(%rsp)
  2fda26:      	vmovdqa	%ymm4, 0x100(%rsp)
  2fda2f:      	vmovdqa	%ymm3, 0x120(%rsp)
  2fda38:      	vmovdqa	%ymm2, 0x140(%rsp)
  2fda41:      	leaq	0x2c0(%rsp), %rdi
  2fda49:      	leaq	0x3e0(%rsp), %rsi
  2fda51:      	leaq	0xc0(%rsp), %rdx
  2fda59:      	vzeroupper
  2fda5c:      	callq	0x2fc410 <<toyos_crypto::arch::x86_64::poly1305::Multiplier>::product>
  2fda61:      	vmovdqa	0x220(%rsp), %ymm1
  2fda6a:      	vpsrlq	$0x1a, %ymm1, %ymm0
  2fda6f:      	vpaddq	0x240(%rsp), %ymm0, %ymm2
  2fda78:      	vmovdqa	0x280(%rsp), %ymm3
  2fda81:      	vpsrlq	$0x1a, %ymm3, %ymm0
  2fda86:      	vpaddq	0x2a0(%rsp), %ymm0, %ymm0
  2fda8f:      	vmovdqa	0x40(%rsp), %ymm12
  2fda95:      	vpand	%ymm1, %ymm12, %ymm1
  2fda99:      	vpsrlq	$0x1a, %ymm2, %ymm4
  2fda9e:      	vpaddq	0x260(%rsp), %ymm4, %ymm4
  2fdaa7:      	vpand	%ymm3, %ymm12, %ymm3
  2fdaab:      	vpand	%ymm2, %ymm12, %ymm5
  2fdaaf:      	vpsrlq	$0x1a, %ymm0, %ymm2
  2fdab4:      	vpsllq	$0x2, %ymm2, %ymm6
  2fdab9:      	vpaddq	%ymm1, %ymm2, %ymm1
  2fdabd:      	vpaddq	%ymm1, %ymm6, %ymm2
  2fdac1:      	vpsrlq	$0x1a, %ymm4, %ymm1
  2fdac6:      	vpaddq	%ymm3, %ymm1, %ymm1
  2fdaca:      	vpand	%ymm4, %ymm12, %ymm4
  2fdace:      	vpsrlq	$0x1a, %ymm2, %ymm3
  2fdad3:      	vpand	%ymm2, %ymm12, %ymm6
  2fdad7:      	vpand	%ymm1, %ymm12, %ymm7
  2fdadb:      	vmovdqa	0x2c0(%rsp), %ymm8
  2fdae4:      	vpsrlq	$0x1a, %ymm8, %ymm2
  2fdaea:      	vpaddq	0x2e0(%rsp), %ymm2, %ymm9
  2fdaf3:      	vmovdqa	0x320(%rsp), %ymm10
  2fdafc:      	vpsrlq	$0x1a, %ymm10, %ymm2
  2fdb02:      	vpaddq	0x340(%rsp), %ymm2, %ymm2
  2fdb0b:      	vpand	%ymm12, %ymm8, %ymm8
  2fdb10:      	vpsrlq	$0x1a, %ymm9, %ymm11
  2fdb16:      	vpaddq	0x300(%rsp), %ymm11, %ymm11
  2fdb1f:      	vpand	%ymm12, %ymm10, %ymm10
  2fdb24:      	vpand	%ymm12, %ymm9, %ymm9
  2fdb29:      	vpaddq	%ymm5, %ymm9, %ymm5
  2fdb2d:      	vpaddq	%ymm3, %ymm5, %ymm5
  2fdb31:      	vpsrlq	$0x1a, %ymm2, %ymm3
  2fdb36:      	vpsllq	$0x2, %ymm3, %ymm9
  2fdb3b:      	vpaddq	%ymm3, %ymm8, %ymm3
  2fdb3f:      	vpaddq	%ymm3, %ymm9, %ymm8
  2fdb43:      	vpsrlq	$0x1a, %ymm11, %ymm3
  2fdb49:      	vpaddq	%ymm3, %ymm10, %ymm3
  2fdb4d:      	vpand	%ymm12, %ymm11, %ymm9
  2fdb52:      	vpaddq	%ymm4, %ymm9, %ymm4
  2fdb56:      	vpsrlq	$0x1a, %ymm8, %ymm9
  2fdb5c:      	vpaddq	%ymm5, %ymm9, %ymm5
  2fdb60:      	vpand	%ymm12, %ymm8, %ymm8
  2fdb65:      	vpaddq	%ymm6, %ymm8, %ymm6
  2fdb69:      	vpand	%ymm3, %ymm12, %ymm8
  2fdb6d:      	vpaddq	%ymm7, %ymm8, %ymm7
  2fdb71:      	vpshufd	$0xee, %xmm6, %xmm8     # xmm8 = xmm6[2,3,2,3]
  2fdb76:      	vextracti128	$0x1, %ymm6, %xmm9
  2fdb7c:      	vpermq	$0xff, %ymm6, %ymm10    # ymm10 = ymm6[3,3,3,3]
  2fdb82:      	vpaddq	%xmm6, %xmm8, %xmm6
  2fdb86:      	vpaddq	%xmm10, %xmm9, %xmm8
  2fdb8b:      	vpaddq	%xmm6, %xmm8, %xmm6
  2fdb8f:      	vmovq	%xmm6, %rdx
  2fdb94:      	vpshufd	$0xee, %xmm5, %xmm6     # xmm6 = xmm5[2,3,2,3]
  2fdb99:      	vextracti128	$0x1, %ymm5, %xmm8
  2fdb9f:      	vpermq	$0xff, %ymm5, %ymm9     # ymm9 = ymm5[3,3,3,3]
  2fdba5:      	vpaddq	%xmm6, %xmm5, %xmm5
  2fdba9:      	vpaddq	%xmm9, %xmm8, %xmm6
  2fdbae:      	vpaddq	%xmm6, %xmm5, %xmm5
  2fdbb2:      	vmovq	%xmm5, %rsi
  2fdbb7:      	vpshufd	$0xee, %xmm4, %xmm5     # xmm5 = xmm4[2,3,2,3]
  2fdbbc:      	vextracti128	$0x1, %ymm4, %xmm6
  2fdbc2:      	vpermq	$0xff, %ymm4, %ymm8     # ymm8 = ymm4[3,3,3,3]
  2fdbc8:      	vpaddq	%xmm5, %xmm4, %xmm4
  2fdbcc:      	vpaddq	%xmm6, %xmm8, %xmm5
  2fdbd0:      	vpaddq	%xmm5, %xmm4, %xmm4
  2fdbd4:      	vmovq	%xmm4, %r9
  2fdbd9:      	vpshufd	$0xee, %xmm7, %xmm4     # xmm4 = xmm7[2,3,2,3]
  2fdbde:      	vextracti128	$0x1, %ymm7, %xmm5
  2fdbe4:      	vpermq	$0xff, %ymm7, %ymm6     # ymm6 = ymm7[3,3,3,3]
  2fdbea:      	vpaddq	%xmm4, %xmm7, %xmm4
  2fdbee:      	vpaddq	%xmm6, %xmm5, %xmm5
  2fdbf2:      	vpaddq	%xmm5, %xmm4, %xmm4
  2fdbf6:      	vmovq	%xmm4, %rcx
  2fdbfb:      	movq	%rsi, %rdi
  2fdbfe:      	shrq	$0x26, %rdi
  2fdc02:      	shlq	$0x1a, %rsi
  2fdc06:      	movq	%r9, %r8
  2fdc09:      	shrq	$0xc, %r8
  2fdc0d:      	shlq	$0x34, %r9
  2fdc11:      	addq	%rdx, %r9
  2fdc14:      	adcq	$0x0, %r8
  2fdc18:      	addq	%rsi, %r9
  2fdc1b:      	adcq	%rdi, %r8
  2fdc1e:      	shlq	$0xe, %rcx
  2fdc22:      	addq	%r8, %rcx
  2fdc25:      	jb	0x2fdcd3 <toyos_crypto::arch::x86_64::poly1305::blocks+0x1423>
  2fdc2b:      	movabsq	$0x7fffffffffffff8, %rdx # imm = 0x7FFFFFFFFFFFFF8
  2fdc35:      	movq	0xb0(%rsp), %rax
  2fdc3d:      	andq	%rdx, %rax
  2fdc40:      	vpsrlq	$0x1a, %ymm1, %ymm1
  2fdc45:      	vpand	%ymm0, %ymm12, %ymm0
  2fdc49:      	vpand	%ymm2, %ymm12, %ymm2
  2fdc4d:      	vpaddq	%ymm2, %ymm0, %ymm0
  2fdc51:      	vpaddq	%ymm0, %ymm1, %ymm0
  2fdc55:      	vpsrlq	$0x1a, %ymm3, %ymm1
  2fdc5a:      	vpaddq	%ymm1, %ymm0, %ymm0
  2fdc5e:      	vpshufd	$0xee, %xmm0, %xmm1     # xmm1 = xmm0[2,3,2,3]
  2fdc63:      	vextracti128	$0x1, %ymm0, %xmm2
  2fdc69:      	vpermq	$0xff, %ymm0, %ymm3     # ymm3 = ymm0[3,3,3,3]
  2fdc6f:      	vpaddq	%xmm1, %xmm0, %xmm0
  2fdc73:      	vpaddq	%xmm3, %xmm2, %xmm1
  2fdc77:      	vpaddq	%xmm1, %xmm0, %xmm0
  2fdc7b:      	vmovq	%xmm0, %rdx
  2fdc80:      	movq	%rdx, %rsi
  2fdc83:      	shrq	$0x18, %rsi
  2fdc87:      	shlq	$0x28, %rdx
  2fdc8b:      	addq	%rdx, %rcx
  2fdc8e:      	adcq	$0x0, %rsi
  2fdc92:      	movl	%esi, %edx
  2fdc94:      	andl	$0x3, %edx
  2fdc97:      	shrq	$0x2, %rsi
  2fdc9b:      	leaq	(%rsi,%rsi,4), %rsi
  2fdc9f:      	addq	%rsi, %r9
  2fdca2:      	adcq	$0x0, %rcx
  2fdca6:      	adcq	$0x0, %rdx
  2fdcaa:      	movq	0xa8(%rsp), %rsi
  2fdcb2:      	movq	%r9, (%rsi)
  2fdcb5:      	movq	%rcx, 0x8(%rsi)
  2fdcb9:      	movq	%rdx, 0x10(%rsi)
  2fdcbd:      	jmp	0x2fdcc1 <toyos_crypto::arch::x86_64::poly1305::blocks+0x1411>
  2fdcbf:      	xorl	%eax, %eax
  2fdcc1:      	leaq	-0x28(%rbp), %rsp
  2fdcc5:      	popq	%rbx
  2fdcc6:      	popq	%r12
  2fdcc8:      	popq	%r13
  2fdcca:      	popq	%r14
  2fdccc:      	popq	%r15
  2fdcce:      	popq	%rbp
  2fdccf:      	vzeroupper
  2fdcd2:      	retq
  2fdcd3:      	leaq	0x504b96(%rip), %rdi    # 0x802870 <anon.5671b1afcf0deb4901e628e66543ca25.9.llvm.14831336972970403172+0x168>
  2fdcda:      	vzeroupper
  2fdcdd:      	callq	*0x577985(%rip)         # 0x875668 <sdallocx+0x875668>
