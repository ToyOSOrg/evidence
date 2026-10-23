
$SCRATCH/poly1305-inline/image/fileserver-noninc-c9a3f65e1:	file format elf64-x86-64

Disassembly of section .text:

0000000000115700 <toyos_crypto::arch::x86_64::poly1305::blocks (.llvm.3142307217602062041)>:
  115700:      	pushq	%rbp
  115701:      	movq	%rsp, %rbp
  115704:      	pushq	%r15
  115706:      	pushq	%r14
  115708:      	pushq	%r13
  11570a:      	pushq	%r12
  11570c:      	pushq	%rbx
  11570d:      	andq	$-0x20, %rsp
  115711:      	subq	$0x540, %rsp            # imm = 0x540
  115718:      	movq	%rdx, %r8
  11571b:      	movq	%rsi, 0x168(%rsp)
  115723:      	movq	(%rsi), %rdx
  115726:      	movq	0x8(%rsi), %rax
  11572a:      	movq	%rdx, %rsi
  11572d:      	movl	%esi, %r9d
  115730:      	movq	%rax, %rdx
  115733:      	shldq	$0xc, %rsi, %rdx
  115738:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
  11573f:      	movl	%r9d, 0x120(%rsp)
  115747:      	shrq	$0x1a, %rsi
  11574b:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  115751:      	movq	%rsi, 0x200(%rsp)
  115759:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  11575f:      	movq	%rdx, 0x1c0(%rsp)
  115767:      	shrq	$0xe, %rax
  11576b:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  115770:      	movq	%rax, 0x260(%rsp)
  115778:      	movq	%rcx, 0x150(%rsp)
  115780:      	shrq	$0x3, %rcx
  115784:      	movq	%rcx, 0x240(%rsp)
  11578c:      	movq	0x10(%rdi), %r12
  115790:      	movq	(%rdi), %r10
  115793:      	movq	0x8(%rdi), %r11
  115797:      	movq	%r11, %rax
  11579a:      	mulq	%r12
  11579d:      	movq	%rdx, %rsi
  1157a0:      	movq	%rax, %rdi
  1157a3:      	movq	%r10, %rax
  1157a6:      	mulq	%r10
  1157a9:      	movq	%rdx, %r9
  1157ac:      	movq	%rax, %rcx
  1157af:      	addq	%rdi, %rcx
  1157b2:      	adcq	%rsi, %r9
  1157b5:      	movq	%r11, %rax
  1157b8:      	movq	%r11, %rbx
  1157bb:      	movq	%r11, 0x58(%rsp)
  1157c0:      	mulq	%r10
  1157c3:      	movq	%rax, %r11
  1157c6:      	shldq	$0x1, %rax, %rdx
  1157cb:      	addq	%rax, %r11
  1157ce:      	addq	%r9, %r11
  1157d1:      	adcq	$0x0, %rdx
  1157d5:      	movl	%edx, %r15d
  1157d8:      	andl	$0x3, %r15d
  1157dc:      	shrq	$0x2, %rdx
  1157e0:      	leaq	(%rdx,%rdx,4), %rax
  1157e4:      	addq	%rcx, %rax
  1157e7:      	movq	%rax, %rcx
  1157ea:      	adcq	$0x0, %r11
  1157ee:      	adcq	$0x0, %r15
  1157f2:      	movq	%r11, %rax
  1157f5:      	movq	%r11, 0x158(%rsp)
  1157fd:      	mulq	%r10
  115800:      	movq	%rax, %rsi
  115803:      	movq	%rdx, %rdi
  115806:      	movq	%r15, %r14
  115809:      	imulq	%r10, %r14
  11580d:      	movq	%r10, %r13
  115810:      	movq	%rcx, %rax
  115813:      	movq	%rcx, %r10
  115816:      	movq	%rcx, 0x220(%rsp)
  11581e:      	mulq	%rbx
  115821:      	movq	%rdx, %rcx
  115824:      	movq	%rax, %r9
  115827:      	addq	%rsi, %r9
  11582a:      	adcq	%rdi, %rcx
  11582d:      	movq	%r11, %rax
  115830:      	mulq	%r12
  115833:      	movq	%rdx, %rdi
  115836:      	movq	%rax, %r11
  115839:      	movq	%r10, %rax
  11583c:      	mulq	%r13
  11583f:      	movq	%rdx, %rbx
  115842:      	movq	%rax, %rsi
  115845:      	addq	%r11, %rsi
  115848:      	adcq	%rdi, %rbx
  11584b:      	addq	%r9, %rbx
  11584e:      	adcq	$0x0, %rcx
  115852:      	movq	%r15, 0x1b8(%rsp)
  11585a:      	movq	%r15, %rax
  11585d:      	mulq	%r12
  115860:      	movq	%rax, %r9
  115863:      	addq	%rbx, %r9
  115866:      	adcq	%rcx, %rdx
  115869:      	addq	%r14, %rdx
  11586c:      	movl	%edx, %r15d
  11586f:      	andl	$0x3, %r15d
  115873:      	shrq	$0x2, %rdx
  115877:      	leaq	(%rdx,%rdx,4), %rbx
  11587b:      	addq	%rsi, %rbx
  11587e:      	adcq	$0x0, %r9
  115882:      	adcq	$0x0, %r15
  115886:      	movq	%r9, %rax
  115889:      	mulq	%r13
  11588c:      	movq	%rax, %rcx
  11588f:      	movq	%rdx, %rdi
  115892:      	movq	%r15, %r14
  115895:      	imulq	%r13, %r14
  115899:      	movq	%r13, %r10
  11589c:      	movq	%r13, 0xb8(%rsp)
  1158a4:      	movq	%rbx, %rax
  1158a7:      	movq	0x58(%rsp), %r13
  1158ac:      	mulq	%r13
  1158af:      	movq	%rdx, %rsi
  1158b2:      	movq	%rax, %r11
  1158b5:      	addq	%rcx, %r11
  1158b8:      	adcq	%rdi, %rsi
  1158bb:      	movq	%r9, 0x1a8(%rsp)
  1158c3:      	movq	%r9, %rax
  1158c6:      	mulq	%r12
  1158c9:      	movq	%rdx, %rcx
  1158cc:      	movq	%rax, %rdi
  1158cf:      	movq	%rbx, 0x1a0(%rsp)
  1158d7:      	movq	%rbx, %rax
  1158da:      	mulq	%r10
  1158dd:      	movq	%rdx, %rbx
  1158e0:      	movq	%rax, %r9
  1158e3:      	addq	%rdi, %r9
  1158e6:      	adcq	%rcx, %rbx
  1158e9:      	addq	%r11, %rbx
  1158ec:      	adcq	$0x0, %rsi
  1158f0:      	movq	%r15, 0x1b0(%rsp)
  1158f8:      	movq	%r15, %rax
  1158fb:      	mulq	%r12
  1158fe:      	movq	%rax, %r10
  115901:      	addq	%rbx, %r10
  115904:      	adcq	%rsi, %rdx
  115907:      	addq	%r14, %rdx
  11590a:      	movl	%edx, %eax
  11590c:      	andl	$0x3, %eax
  11590f:      	shrq	$0x2, %rdx
  115913:      	leaq	(%rdx,%rdx,4), %r11
  115917:      	addq	%r9, %r11
  11591a:      	adcq	$0x0, %r10
  11591e:      	adcq	$0x0, %rax
  115922:      	movq	%rax, %rcx
  115925:      	movq	%rax, 0xe0(%rsp)
  11592d:      	mulq	%r12
  115930:      	movq	%r12, %rsi
  115933:      	movq	%rdx, 0x80(%rsp)
  11593b:      	movq	%rax, %r9
  11593e:      	movq	%r11, %rax
  115941:      	movq	%r11, 0xc0(%rsp)
  115949:      	mulq	%r13
  11594c:      	movq	%rdx, %r14
  11594f:      	movq	%rax, %r15
  115952:      	movq	%r10, 0x100(%rsp)
  11595a:      	movq	%r10, %rax
  11595d:      	movq	0xb8(%rsp), %rdi
  115965:      	mulq	%rdi
  115968:      	movq	%rdx, %rbx
  11596b:      	movq	%rax, %r12
  11596e:      	addq	%r15, %r12
  115971:      	adcq	%r14, %rbx
  115974:      	movq	%r11, %rax
  115977:      	mulq	%rdi
  11597a:      	movq	%rdi, %r11
  11597d:      	movq	%rdx, %r14
  115980:      	movq	%rax, %r15
  115983:      	movq	%r10, %rax
  115986:      	movq	%rsi, %r10
  115989:      	mulq	%rsi
  11598c:      	movq	%rdx, %rdi
  11598f:      	addq	%r15, %rax
  115992:      	adcq	%r14, %rdi
  115995:      	addq	%r12, %rdi
  115998:      	adcq	$0x0, %rbx
  11599c:      	addq	%r9, %rdi
  11599f:      	adcq	0x80(%rsp), %rbx
  1159a7:      	movq	%rcx, %rsi
  1159aa:      	imulq	%r11, %rsi
  1159ae:      	addq	%rbx, %rsi
  1159b1:      	movq	%rsi, %rdx
  1159b4:      	shrq	$0x2, %rdx
  1159b8:      	leaq	(%rdx,%rdx,4), %r13
  1159bc:      	andl	$0x3, %esi
  1159bf:      	addq	%rax, %r13
  1159c2:      	adcq	$0x0, %rdi
  1159c6:      	adcq	$0x0, %rsi
  1159ca:      	movq	%rsi, %rax
  1159cd:      	mulq	%r10
  1159d0:      	movq	%r10, %rcx
  1159d3:      	movq	%rdx, 0x80(%rsp)
  1159db:      	movq	%rax, %r9
  1159de:      	movq	%r13, %rax
  1159e1:      	movq	0x58(%rsp), %r10
  1159e6:      	mulq	%r10
  1159e9:      	movq	%rdx, %r14
  1159ec:      	movq	%rax, %r15
  1159ef:      	movq	%rdi, %rax
  1159f2:      	mulq	%r11
  1159f5:      	movq	%rdx, %rbx
  1159f8:      	movq	%rax, %r12
  1159fb:      	addq	%r15, %r12
  1159fe:      	adcq	%r14, %rbx
  115a01:      	movq	%r13, 0x188(%rsp)
  115a09:      	movq	%r13, %rax
  115a0c:      	mulq	%r11
  115a0f:      	movq	%rdx, %r15
  115a12:      	movq	%rax, %r13
  115a15:      	movq	%rdi, 0x198(%rsp)
  115a1d:      	movq	%rdi, %rax
  115a20:      	movq	%rcx, %rdi
  115a23:      	mulq	%rcx
  115a26:      	movq	%rdx, %rcx
  115a29:      	addq	%r13, %rax
  115a2c:      	adcq	%r15, %rcx
  115a2f:      	addq	%r12, %rcx
  115a32:      	adcq	$0x0, %rbx
  115a36:      	addq	%r9, %rcx
  115a39:      	adcq	0x80(%rsp), %rbx
  115a41:      	movq	%rsi, 0x190(%rsp)
  115a49:      	imulq	%r11, %rsi
  115a4d:      	addq	%rbx, %rsi
  115a50:      	movq	%rsi, %rdx
  115a53:      	shrq	$0x2, %rdx
  115a57:      	leaq	(%rdx,%rdx,4), %r15
  115a5b:      	andl	$0x3, %esi
  115a5e:      	addq	%rax, %r15
  115a61:      	adcq	$0x0, %rcx
  115a65:      	adcq	$0x0, %rsi
  115a69:      	movq	%rsi, %rax
  115a6c:      	mulq	%rdi
  115a6f:      	movq	%rdi, %r9
  115a72:      	movq	%rdx, 0x80(%rsp)
  115a7a:      	movq	%rax, 0x60(%rsp)
  115a7f:      	movq	%r15, %rax
  115a82:      	mulq	%r10
  115a85:      	movq	%rdx, %r14
  115a88:      	movq	%rax, %r12
  115a8b:      	movq	%rcx, %rax
  115a8e:      	mulq	%r11
  115a91:      	movq	%rdx, %rbx
  115a94:      	movq	%rax, %r13
  115a97:      	addq	%r12, %r13
  115a9a:      	adcq	%r14, %rbx
  115a9d:      	movq	%r15, %rax
  115aa0:      	mulq	%r11
  115aa3:      	movq	%rdx, %rdi
  115aa6:      	movq	%rax, %r14
  115aa9:      	movq	%rcx, %rax
  115aac:      	mulq	%r9
  115aaf:      	movq	%rdx, %r12
  115ab2:      	addq	%r14, %rax
  115ab5:      	adcq	%rdi, %r12
  115ab8:      	addq	%r13, %r12
  115abb:      	adcq	$0x0, %rbx
  115abf:      	vmovd	0x120(%rsp), %xmm12
  115ac8:      	addq	0x60(%rsp), %r12
  115acd:      	adcq	0x80(%rsp), %rbx
  115ad5:      	movq	%rsi, 0x178(%rsp)
  115add:      	movq	%rsi, %r14
  115ae0:      	imulq	%r11, %r14
  115ae4:      	addq	%rbx, %r14
  115ae7:      	movq	%r14, %rdx
  115aea:      	shrq	$0x2, %rdx
  115aee:      	leaq	(%rdx,%rdx,4), %r13
  115af2:      	andl	$0x3, %r14d
  115af6:      	addq	%rax, %r13
  115af9:      	adcq	$0x0, %r12
  115afd:      	adcq	$0x0, %r14
  115b01:      	movq	%r14, %rax
  115b04:      	mulq	%r9
  115b07:      	movq	%r9, %rbx
  115b0a:      	movq	%rdx, 0x120(%rsp)
  115b12:      	movq	%rax, 0x60(%rsp)
  115b17:      	movq	%r13, %rax
  115b1a:      	mulq	%r10
  115b1d:      	movq	%rax, %rdi
  115b20:      	movq	%rdx, %r10
  115b23:      	vmovss	0x200(%rsp), %xmm0
  115b2c:      	vmovaps	%ymm0, 0x80(%rsp)
  115b35:      	movq	%r12, %rax
  115b38:      	mulq	%r11
  115b3b:      	movq	%rdx, %rsi
  115b3e:      	movq	%rax, %r9
  115b41:      	addq	%rdi, %r9
  115b44:      	adcq	%r10, %rsi
  115b47:      	movq	%r13, 0x160(%rsp)
  115b4f:      	movq	%r13, %rax
  115b52:      	mulq	%r11
  115b55:      	movq	%rdx, %rdi
  115b58:      	movq	%rax, %r13
  115b5b:      	movq	%r12, %rax
  115b5e:      	mulq	%rbx
  115b61:      	addq	%r13, %rax
  115b64:      	adcq	%rdi, %rdx
  115b67:      	movq	%r15, %rdi
  115b6a:      	addq	%r9, %rdx
  115b6d:      	adcq	$0x0, %rsi
  115b71:      	addq	0x60(%rsp), %rdx
  115b76:      	adcq	0x120(%rsp), %rsi
  115b7e:      	movq	%r14, 0x170(%rsp)
  115b86:      	imulq	%r11, %r14
  115b8a:      	movq	0x158(%rsp), %r10
  115b92:      	addq	%rsi, %r14
  115b95:      	movq	%r14, %rsi
  115b98:      	shrq	$0x2, %rsi
  115b9c:      	leaq	(%rsi,%rsi,4), %rbx
  115ba0:      	andl	$0x3, %r14d
  115ba4:      	addq	%rax, %rbx
  115ba7:      	adcq	$0x0, %rdx
  115bab:      	adcq	$0x0, %r14
  115baf:      	movl	%ebx, %eax
  115bb1:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  115bb6:      	movq	%rdx, %r15
  115bb9:      	shldq	$0xc, %rbx, %r15
  115bbe:      	shrq	$0x1a, %rbx
  115bc2:      	andl	$0x3ffffff, %ebx        # imm = 0x3FFFFFF
  115bc8:      	andl	$0x3ffffff, %r15d       # imm = 0x3FFFFFF
  115bcf:      	shldq	$0x18, %rdx, %r14
  115bd4:      	shrq	$0xe, %rdx
  115bd8:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  115bde:      	movq	%rax, 0x18(%rsp)
  115be3:      	movq	%rbx, 0x20(%rsp)
  115be8:      	movq	%r15, 0x28(%rsp)
  115bed:      	movq	%rdx, 0x30(%rsp)
  115bf2:      	movq	%r14, 0x38(%rsp)
  115bf7:      	movq	%rax, 0x40(%rsp)
  115bfc:      	vmovdqu	0x38(%rsp), %xmm4
  115c02:      	vmovdqu	0x30(%rsp), %xmm3
  115c08:      	vmovdqu	0x28(%rsp), %xmm2
  115c0e:      	vmovdqu	0x20(%rsp), %xmm1
  115c14:      	vmovdqu	0x18(%rsp), %xmm0
  115c1a:      	movl	%edi, %r9d
  115c1d:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
  115c24:      	movq	%rcx, 0x180(%rsp)
  115c2c:      	movq	%rcx, %rsi
  115c2f:      	shldq	$0xc, %rdi, %rsi
  115c34:      	shrq	$0x1a, %rdi
  115c38:      	andl	$0x3ffffff, %edi        # imm = 0x3FFFFFF
  115c3e:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  115c44:      	movq	%rax, 0x18(%rsp)
  115c49:      	movq	%rbx, 0x20(%rsp)
  115c4e:      	movq	%r15, 0x28(%rsp)
  115c53:      	movq	%rdx, 0x30(%rsp)
  115c58:      	movq	%r14, 0x38(%rsp)
  115c5d:      	movq	%r9, 0x40(%rsp)
  115c62:      	movq	%rdi, 0x48(%rsp)
  115c67:      	movq	%rsi, 0x50(%rsp)
  115c6c:      	vmovups	0x18(%rsp), %ymm5
  115c72:      	vmovaps	%ymm5, 0x3c0(%rsp)
  115c7b:      	vmovups	0x20(%rsp), %ymm5
  115c81:      	vmovaps	%ymm5, 0x400(%rsp)
  115c8a:      	vmovups	0x28(%rsp), %ymm5
  115c90:      	vmovaps	%ymm5, 0x420(%rsp)
  115c99:      	vmovups	0x30(%rsp), %ymm5
  115c9f:      	vmovaps	%ymm5, 0x480(%rsp)
  115ca8:      	vmovups	0x38(%rsp), %ymm5
  115cae:      	vmovaps	%ymm5, 0x4c0(%rsp)
  115cb7:      	movq	0xc0(%rsp), %r11
  115cbf:      	movl	%r11d, %r13d
  115cc2:      	andl	$0x3ffffff, %r13d       # imm = 0x3FFFFFF
  115cc9:      	movq	%r13, 0x18(%rsp)
  115cce:      	movq	0x100(%rsp), %rcx
  115cd6:      	movq	%rcx, %r13
  115cd9:      	shldq	$0xc, %r11, %r13
  115cde:      	shrq	$0x1a, %r11
  115ce2:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
  115ce9:      	movq	%r11, 0x20(%rsp)
  115cee:      	andl	$0x3ffffff, %r13d       # imm = 0x3FFFFFF
  115cf5:      	movq	%r13, 0x28(%rsp)
  115cfa:      	movq	0xe0(%rsp), %r11
  115d02:      	shldq	$0x18, %rcx, %r11
  115d07:      	shrq	$0xe, %rcx
  115d0b:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  115d11:      	movq	%rcx, 0x30(%rsp)
  115d16:      	vpinsrq	$0x1, %r14, %xmm4, %xmm5
  115d1c:      	movq	%r11, 0x38(%rsp)
  115d21:      	vmovq	%r14, %xmm6
  115d26:      	movq	0x220(%rsp), %r14
  115d2e:      	vpinsrq	$0x1, %rdx, %xmm3, %xmm3
  115d34:      	vmovq	%rdx, %xmm4
  115d39:      	vpinsrq	$0x1, %r15, %xmm2, %xmm2
  115d3f:      	vmovq	%r15, %xmm7
  115d44:      	movq	0x240(%rsp), %r15
  115d4c:      	vpinsrq	$0x1, %rbx, %xmm1, %xmm1
  115d52:      	vmovq	%rbx, %xmm8
  115d57:      	movq	0x168(%rsp), %rbx
  115d5f:      	vpbroadcastq	%xmm6, %ymm6
  115d64:      	vpblendd	$0xf0, %ymm6, %ymm5, %ymm6 # ymm6 = ymm5[0,1,2,3],ymm6[4,5,6,7]
  115d6a:      	vpinsrq	$0x1, %rax, %xmm0, %xmm0
  115d70:      	vmovq	%rax, %xmm5
  115d75:      	movq	%r10, %rcx
  115d78:      	shldq	$0xc, %r14, %rcx
  115d7d:      	movl	%r14d, %edx
  115d80:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  115d86:      	shrq	$0x1a, %r14
  115d8a:      	andl	$0x3ffffff, %r14d       # imm = 0x3FFFFFF
  115d91:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  115d97:      	movq	%rdx, 0x40(%rsp)
  115d9c:      	movq	%r14, 0x48(%rsp)
  115da1:      	movq	%rcx, 0x50(%rsp)
  115da6:      	vpbroadcastq	%xmm4, %ymm4
  115dab:      	vpblendd	$0xf0, %ymm4, %ymm3, %ymm4 # ymm4 = ymm3[0,1,2,3],ymm4[4,5,6,7]
  115db1:      	vpsllq	$0x2, %ymm6, %ymm3
  115db6:      	vmovdqa	%ymm6, 0x60(%rsp)
  115dbc:      	vpaddq	%ymm6, %ymm3, %ymm3
  115dc0:      	vmovdqa	%ymm3, 0x300(%rsp)
  115dc9:      	vpbroadcastq	%xmm7, %ymm3
  115dce:      	vpblendd	$0xf0, %ymm3, %ymm2, %ymm3 # ymm3 = ymm2[0,1,2,3],ymm3[4,5,6,7]
  115dd4:      	vpsllq	$0x2, %ymm4, %ymm2
  115dd9:      	vmovdqa	%ymm4, 0x1e0(%rsp)
  115de2:      	vpaddq	%ymm4, %ymm2, %ymm2
  115de6:      	vmovdqa	%ymm2, 0x2c0(%rsp)
  115def:      	vpbroadcastq	%xmm8, %ymm2
  115df4:      	vpblendd	$0xf0, %ymm2, %ymm1, %ymm2 # ymm2 = ymm1[0,1,2,3],ymm2[4,5,6,7]
  115dfa:      	vpsllq	$0x2, %ymm3, %ymm1
  115dff:      	vmovdqa	%ymm3, 0x2e0(%rsp)
  115e08:      	vpaddq	%ymm3, %ymm1, %ymm1
  115e0c:      	vmovdqa	%ymm1, 0x2a0(%rsp)
  115e15:      	vpbroadcastq	%xmm5, %ymm4
  115e1a:      	vpblendd	$0xf0, %ymm4, %ymm0, %ymm0 # ymm0 = ymm0[0,1,2,3],ymm4[4,5,6,7]
  115e20:      	vmovdqa	%ymm0, 0x320(%rsp)
  115e29:      	vpsllq	$0x2, %ymm2, %ymm0
  115e2e:      	vmovdqa	%ymm2, 0x340(%rsp)
  115e37:      	vpaddq	%ymm2, %ymm0, %ymm0
  115e3b:      	vmovdqa	%ymm0, 0x280(%rsp)
  115e44:      	leaq	-0x1(%r15), %rax
  115e48:      	shlq	$0x7, %r15
  115e4c:      	addq	$-0x80, %r15
  115e50:      	xorl	%r11d, %r11d
  115e53:      	vmovss	0x1c0(%rsp), %xmm0
  115e5c:      	vmovaps	%ymm0, 0xe0(%rsp)
  115e65:      	vmovss	0x260(%rsp), %xmm0
  115e6e:      	vmovaps	%ymm0, 0x100(%rsp)
  115e77:      	vmovsd	0xd(%rbx), %xmm0
  115e7c:      	vmovaps	%ymm0, 0xc0(%rsp)
  115e85:      	vmovups	0x18(%rsp), %ymm0
  115e8b:      	vmovaps	%ymm0, 0x3e0(%rsp)
  115e94:      	vmovups	0x20(%rsp), %ymm0
  115e9a:      	vmovaps	%ymm0, 0x440(%rsp)
  115ea3:      	vmovups	0x28(%rsp), %ymm0
  115ea9:      	vmovaps	%ymm0, 0x460(%rsp)
  115eb2:      	vmovups	0x30(%rsp), %ymm0
  115eb8:      	vmovaps	%ymm0, 0x4a0(%rsp)
  115ec1:      	vmovups	0x38(%rsp), %ymm0
  115ec7:      	vmovaps	%ymm0, 0x4e0(%rsp)
  115ed0:      	vxorps	%xmm0, %xmm0, %xmm0
  115ed4:      	vmovaps	%ymm0, 0x120(%rsp)
  115edd:      	vbroadcastsd	-0xf25d6(%rip), %ymm0 # 0x23910 <anon.0d9a86fc381b8874252d5280d7e25c65.69.llvm.16651531316759922699+0xa20>
  115ee6:      	vmovaps	%ymm0, 0x360(%rsp)
  115eef:      	vpbroadcastq	-0xf2588(%rip), %ymm0 # 0x23970 <anon.0d9a86fc381b8874252d5280d7e25c65.69.llvm.16651531316759922699+0xa80>
  115ef8:      	vmovdqa	%ymm0, 0x1c0(%rsp)
  115f01:      	vpxor	%xmm0, %xmm0, %xmm0
  115f05:      	vmovdqa	%ymm0, 0x240(%rsp)
  115f0e:      	vmovdqa	%ymm0, 0x220(%rsp)
  115f17:      	vmovdqa	%ymm0, 0x200(%rsp)
  115f20:      	vmovdqa	%ymm0, 0x260(%rsp)
  115f29:      	vmovdqa	0x320(%rsp), %ymm14
  115f32:      	nopw	%cs:(%rax,%rax)
  115f40:      	vmovdqu	(%r8,%r11), %ymm4
  115f46:      	vmovdqu	0x20(%r8,%r11), %ymm7
  115f4d:      	vmovdqu	0x40(%r8,%r11), %ymm8
  115f54:      	vmovdqu	0x60(%r8,%r11), %ymm11
  115f5b:      	vpunpckhqdq	%ymm7, %ymm4, %ymm5 # ymm5 = ymm4[1],ymm7[1],ymm4[3],ymm7[3]
  115f5f:      	vpunpcklqdq	%ymm7, %ymm4, %ymm4 # ymm4 = ymm4[0],ymm7[0],ymm4[2],ymm7[2]
  115f63:      	vpsrlq	$0x34, %ymm4, %ymm7
  115f68:      	vpsllq	$0xc, %ymm5, %ymm9
  115f6d:      	vpor	%ymm7, %ymm9, %ymm9
  115f71:      	vpunpcklqdq	%ymm11, %ymm8, %ymm13 # ymm13 = ymm8[0],ymm11[0],ymm8[2],ymm11[2]
  115f76:      	vpunpckhqdq	%ymm11, %ymm8, %ymm0 # ymm0 = ymm8[1],ymm11[1],ymm8[3],ymm11[3]
  115f7b:      	vmovdqa	%ymm0, 0x380(%rsp)
  115f84:      	vpsrlq	$0x34, %ymm13, %ymm7
  115f8a:      	vpsllq	$0xc, %ymm0, %ymm11
  115f8f:      	vpor	%ymm7, %ymm11, %ymm0
  115f93:      	vmovdqa	%ymm0, 0x3a0(%rsp)
  115f9c:      	vpsrlq	$0x1a, %ymm12, %ymm11
  115fa2:      	vpaddq	0x80(%rsp), %ymm11, %ymm11
  115fab:      	vmovdqa	0x100(%rsp), %ymm3
  115fb4:      	vpsrlq	$0x1a, %ymm3, %ymm15
  115fb9:      	vpaddq	0xc0(%rsp), %ymm15, %ymm15
  115fc2:      	vpsrlq	$0x1a, %ymm11, %ymm10
  115fc8:      	vpaddq	0xe0(%rsp), %ymm10, %ymm10
  115fd1:      	vpsrlq	$0x28, %ymm5, %ymm1
  115fd6:      	vmovdqa	0x360(%rsp), %ymm0
  115fdf:      	vpand	%ymm0, %ymm15, %ymm7
  115fe3:      	vpaddq	%ymm1, %ymm7, %ymm1
  115fe7:      	vpsrlq	$0x1a, %ymm15, %ymm7
  115fed:      	vpsllq	$0x2, %ymm7, %ymm15
  115ff2:      	vpaddq	%ymm7, %ymm15, %ymm7
  115ff6:      	vpand	%ymm0, %ymm12, %ymm15
  115ffa:      	vpaddq	%ymm7, %ymm15, %ymm7
  115ffe:      	vpand	%ymm0, %ymm3, %ymm15
  116002:      	vpsrlq	$0x1a, %ymm10, %ymm3
  116008:      	vpaddq	%ymm3, %ymm15, %ymm3
  11600c:      	vpsrlq	$0xe, %ymm5, %ymm5
  116011:      	vpand	%ymm0, %ymm5, %ymm12
  116015:      	vpand	%ymm0, %ymm9, %ymm5
  116019:      	vpand	%ymm0, %ymm11, %ymm9
  11601d:      	vpand	%ymm0, %ymm10, %ymm10
  116021:      	vpaddq	%ymm5, %ymm10, %ymm11
  116025:      	vpsrlq	$0x1a, %ymm7, %ymm5
  11602a:      	vpaddq	%ymm5, %ymm9, %ymm5
  11602e:      	vpsrlq	$0x1a, %ymm4, %ymm9
  116033:      	vpand	%ymm0, %ymm9, %ymm9
  116037:      	vpand	%ymm0, %ymm4, %ymm4
  11603b:      	vpaddq	%ymm5, %ymm9, %ymm15
  11603f:      	vpand	%ymm0, %ymm7, %ymm5
  116043:      	vpaddq	%ymm5, %ymm4, %ymm5
  116047:      	vpsrlq	$0x1a, %ymm3, %ymm4
  11604c:      	vpaddq	%ymm4, %ymm1, %ymm1
  116050:      	vpand	%ymm0, %ymm3, %ymm3
  116054:      	vpaddq	%ymm3, %ymm12, %ymm9
  116058:      	vpaddq	0x1c0(%rsp), %ymm1, %ymm4
  116061:      	vpmuludq	%ymm5, %ymm14, %ymm1
  116065:      	vmovdqa	0x300(%rsp), %ymm2
  11606e:      	vpmuludq	%ymm2, %ymm15, %ymm3
  116072:      	vmovdqa	0x2a0(%rsp), %ymm12
  11607b:      	vpmuludq	%ymm12, %ymm9, %ymm7
  116080:      	vpaddq	%ymm7, %ymm1, %ymm1
  116084:      	vmovdqa	0x2c0(%rsp), %ymm6
  11608d:      	vpmuludq	%ymm6, %ymm11, %ymm7
  116091:      	vpaddq	%ymm1, %ymm7, %ymm1
  116095:      	vpmuludq	0x280(%rsp), %ymm4, %ymm7
  11609e:      	vpaddq	%ymm3, %ymm7, %ymm3
  1160a2:      	vpaddq	%ymm3, %ymm1, %ymm1
  1160a6:      	vmovdqa	%ymm1, 0x500(%rsp)
  1160af:      	vmovdqa	0x340(%rsp), %ymm8
  1160b8:      	vpmuludq	%ymm5, %ymm8, %ymm1
  1160bc:      	vpmuludq	%ymm6, %ymm9, %ymm3
  1160c0:      	vpaddq	%ymm3, %ymm1, %ymm1
  1160c4:      	vpmuludq	%ymm2, %ymm11, %ymm3
  1160c8:      	vpaddq	%ymm1, %ymm3, %ymm1
  1160cc:      	vpmuludq	%ymm14, %ymm15, %ymm3
  1160d1:      	vpmuludq	%ymm4, %ymm12, %ymm7
  1160d5:      	vpaddq	%ymm3, %ymm7, %ymm3
  1160d9:      	vpaddq	%ymm3, %ymm1, %ymm1
  1160dd:      	vmovdqa	%ymm1, 0x80(%rsp)
  1160e6:      	vmovdqa	0x2e0(%rsp), %ymm10
  1160ef:      	vpmuludq	%ymm5, %ymm10, %ymm1
  1160f3:      	vpmuludq	%ymm2, %ymm9, %ymm3
  1160f7:      	vpaddq	%ymm3, %ymm1, %ymm1
  1160fb:      	vpmuludq	%ymm14, %ymm11, %ymm3
  116100:      	vpaddq	%ymm1, %ymm3, %ymm1
  116104:      	vpmuludq	%ymm8, %ymm15, %ymm3
  116109:      	vpmuludq	%ymm6, %ymm4, %ymm7
  11610d:      	vpaddq	%ymm3, %ymm7, %ymm3
  116111:      	vpaddq	%ymm3, %ymm1, %ymm1
  116115:      	vmovdqa	%ymm1, 0xe0(%rsp)
  11611e:      	vmovdqa	0x1e0(%rsp), %ymm12
  116127:      	vpmuludq	%ymm5, %ymm12, %ymm1
  11612b:      	vpmuludq	%ymm14, %ymm9, %ymm3
  116130:      	vpaddq	%ymm3, %ymm1, %ymm1
  116134:      	vpmuludq	%ymm8, %ymm11, %ymm3
  116139:      	vpaddq	%ymm1, %ymm3, %ymm1
  11613d:      	vpmuludq	%ymm10, %ymm15, %ymm3
  116142:      	vpmuludq	%ymm2, %ymm4, %ymm7
  116146:      	vpaddq	%ymm3, %ymm7, %ymm3
  11614a:      	vpaddq	%ymm3, %ymm1, %ymm1
  11614e:      	vmovdqa	%ymm1, 0x100(%rsp)
  116157:      	vpmuludq	0x60(%rsp), %ymm5, %ymm1
  11615d:      	vpmuludq	%ymm8, %ymm9, %ymm3
  116162:      	vmovdqa	%ymm8, %ymm6
  116166:      	vpaddq	%ymm3, %ymm1, %ymm1
  11616a:      	vpmuludq	%ymm10, %ymm11, %ymm3
  11616f:      	vpaddq	%ymm1, %ymm3, %ymm1
  116173:      	vpand	%ymm0, %ymm13, %ymm5
  116177:      	vpsrlq	$0x1a, %ymm13, %ymm3
  11617d:      	vpand	%ymm0, %ymm3, %ymm3
  116181:      	vpand	0x3a0(%rsp), %ymm0, %ymm7
  11618a:      	vpmuludq	%ymm12, %ymm15, %ymm9
  11618f:      	vpmuludq	%ymm4, %ymm14, %ymm4
  116193:      	vpaddq	%ymm4, %ymm9, %ymm4
  116197:      	vmovdqa	0x380(%rsp), %ymm2
  1161a0:      	vpsrlq	$0xe, %ymm2, %ymm9
  1161a5:      	vpand	%ymm0, %ymm9, %ymm9
  1161a9:      	vpsrlq	$0x28, %ymm2, %ymm8
  1161ae:      	vpaddq	%ymm4, %ymm1, %ymm1
  1161b2:      	vmovdqa	%ymm1, 0xc0(%rsp)
  1161bb:      	vmovdqa	0x260(%rsp), %ymm4
  1161c4:      	vpsrlq	$0x1a, %ymm4, %ymm1
  1161c9:      	vpaddq	0x200(%rsp), %ymm1, %ymm1
  1161d2:      	vpand	%ymm0, %ymm4, %ymm4
  1161d6:      	vmovdqa	0x240(%rsp), %ymm11
  1161df:      	vpsrlq	$0x1a, %ymm11, %ymm10
  1161e5:      	vpaddq	0x120(%rsp), %ymm10, %ymm10
  1161ee:      	vpand	%ymm0, %ymm11, %ymm11
  1161f2:      	vpsrlq	$0x1a, %ymm1, %ymm12
  1161f7:      	vpaddq	0x220(%rsp), %ymm12, %ymm12
  116200:      	vpand	%ymm0, %ymm1, %ymm1
  116204:      	vpsrlq	$0x1a, %ymm10, %ymm13
  11620a:      	vpand	%ymm0, %ymm10, %ymm10
  11620e:      	vpaddq	%ymm8, %ymm10, %ymm10
  116213:      	vpsllq	$0x2, %ymm13, %ymm8
  116219:      	vpaddq	%ymm13, %ymm8, %ymm8
  11621e:      	vpaddq	%ymm4, %ymm8, %ymm8
  116222:      	vpsrlq	$0x1a, %ymm12, %ymm4
  116228:      	vpaddq	%ymm4, %ymm11, %ymm11
  11622c:      	vpand	%ymm0, %ymm12, %ymm4
  116230:      	vmovdqa	0x500(%rsp), %ymm12
  116239:      	vpaddq	%ymm4, %ymm7, %ymm4
  11623d:      	vpsrlq	$0x1a, %ymm8, %ymm7
  116243:      	vpaddq	%ymm1, %ymm7, %ymm1
  116247:      	vpaddq	%ymm3, %ymm1, %ymm7
  11624b:      	vpand	%ymm0, %ymm8, %ymm1
  11624f:      	vpaddq	%ymm1, %ymm5, %ymm8
  116253:      	vpsrlq	$0x1a, %ymm11, %ymm1
  116259:      	vpaddq	%ymm1, %ymm10, %ymm1
  11625d:      	vpand	%ymm0, %ymm11, %ymm3
  116261:      	vpaddq	%ymm3, %ymm9, %ymm9
  116265:      	vpaddq	0x1c0(%rsp), %ymm1, %ymm5
  11626e:      	vpmuludq	%ymm14, %ymm8, %ymm1
  116273:      	vmovdqa	0x300(%rsp), %ymm2
  11627c:      	vpmuludq	%ymm2, %ymm7, %ymm3
  116280:      	vmovdqa	0x2c0(%rsp), %ymm15
  116289:      	vpmuludq	%ymm4, %ymm15, %ymm10
  11628d:      	vmovdqa	0x2a0(%rsp), %ymm13
  116296:      	vpmuludq	%ymm13, %ymm9, %ymm11
  11629b:      	vpaddq	%ymm1, %ymm11, %ymm1
  11629f:      	vpaddq	%ymm1, %ymm10, %ymm1
  1162a3:      	vpmuludq	0x280(%rsp), %ymm5, %ymm10
  1162ac:      	vpaddq	%ymm3, %ymm10, %ymm3
  1162b0:      	vpaddq	%ymm3, %ymm1, %ymm0
  1162b4:      	vmovdqa	%ymm0, 0x260(%rsp)
  1162bd:      	vpmuludq	%ymm6, %ymm8, %ymm1
  1162c1:      	vpmuludq	%ymm7, %ymm14, %ymm3
  1162c5:      	vpmuludq	%ymm2, %ymm4, %ymm10
  1162c9:      	vpmuludq	%ymm15, %ymm9, %ymm11
  1162ce:      	vpaddq	%ymm1, %ymm11, %ymm1
  1162d2:      	vpaddq	%ymm1, %ymm10, %ymm1
  1162d6:      	vpmuludq	%ymm5, %ymm13, %ymm10
  1162da:      	vpaddq	%ymm3, %ymm10, %ymm3
  1162de:      	vpaddq	%ymm3, %ymm1, %ymm0
  1162e2:      	vmovdqa	%ymm0, 0x200(%rsp)
  1162eb:      	vmovdqa	0x2e0(%rsp), %ymm13
  1162f4:      	vpmuludq	%ymm13, %ymm8, %ymm1
  1162f9:      	vpmuludq	%ymm6, %ymm7, %ymm3
  1162fd:      	vpmuludq	%ymm4, %ymm14, %ymm10
  116301:      	vpmuludq	%ymm2, %ymm9, %ymm11
  116305:      	vpaddq	%ymm1, %ymm11, %ymm1
  116309:      	vpaddq	%ymm1, %ymm10, %ymm1
  11630d:      	vpmuludq	%ymm5, %ymm15, %ymm10
  116311:      	vpaddq	%ymm3, %ymm10, %ymm3
  116315:      	vpaddq	%ymm3, %ymm1, %ymm0
  116319:      	vmovdqa	%ymm0, 0x220(%rsp)
  116322:      	vmovdqa	0x1e0(%rsp), %ymm11
  11632b:      	vpmuludq	%ymm11, %ymm8, %ymm1
  116330:      	vpmuludq	%ymm7, %ymm13, %ymm3
  116334:      	vpmuludq	%ymm14, %ymm9, %ymm10
  116339:      	vpaddq	%ymm1, %ymm10, %ymm1
  11633d:      	vpmuludq	%ymm6, %ymm4, %ymm10
  116341:      	vpaddq	%ymm1, %ymm10, %ymm1
  116345:      	vpmuludq	%ymm2, %ymm5, %ymm10
  116349:      	vpaddq	%ymm3, %ymm10, %ymm3
  11634d:      	vpaddq	%ymm3, %ymm1, %ymm0
  116351:      	vmovdqa	%ymm0, 0x240(%rsp)
  11635a:      	vpmuludq	0x60(%rsp), %ymm8, %ymm1
  116360:      	vpmuludq	%ymm6, %ymm9, %ymm3
  116364:      	vpaddq	%ymm3, %ymm1, %ymm1
  116368:      	vpmuludq	%ymm4, %ymm13, %ymm3
  11636c:      	vpaddq	%ymm1, %ymm3, %ymm1
  116370:      	vpmuludq	%ymm7, %ymm11, %ymm3
  116374:      	vpmuludq	%ymm5, %ymm14, %ymm4
  116378:      	vpaddq	%ymm3, %ymm4, %ymm3
  11637c:      	vpaddq	%ymm3, %ymm1, %ymm0
  116380:      	vmovdqa	%ymm0, 0x120(%rsp)
  116389:      	subq	$-0x80, %r11
  11638d:      	cmpq	%r11, %r15
  116390:      	jne	0x115f40 <toyos_crypto::arch::x86_64::poly1305::blocks (.llvm.3142307217602062041)+0x840>
  116396:      	vmovdqa	0x3c0(%rsp), %ymm0
  11639f:      	vpinsrq	$0x1, %r9, %xmm0, %xmm1
  1163a5:      	movq	0x160(%rsp), %r11
  1163ad:      	movl	%r11d, %r9d
  1163b0:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
  1163b7:      	vmovq	%r9, %xmm2
  1163bc:      	vpbroadcastq	%xmm2, %ymm2
  1163c1:      	vpblendd	$0x30, %ymm2, %ymm1, %ymm2 # ymm2 = ymm1[0,1,2,3],ymm2[4,5],ymm1[6,7]
  1163c7:      	vmovdqa	0x400(%rsp), %ymm0
  1163d0:      	vpinsrq	$0x1, %rdi, %xmm0, %xmm3
  1163d6:      	vmovdqa	0x420(%rsp), %ymm0
  1163df:      	vpinsrq	$0x1, %rsi, %xmm0, %xmm1
  1163e5:      	movq	0x188(%rsp), %r15
  1163ed:      	movl	%r15d, %esi
  1163f0:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  1163f6:      	vmovq	%rsi, %xmm4
  1163fb:      	vpbroadcastq	%xmm4, %ymm4
  116400:      	vpblendd	$0xc0, %ymm4, %ymm2, %ymm0 # ymm0 = ymm2[0,1,2,3,4,5],ymm4[6,7]
  116406:      	vmovdqa	%ymm0, 0x300(%rsp)
  11640f:      	movq	%r12, %rsi
  116412:      	shldq	$0xc, %r11, %rsi
  116417:      	shrq	$0x1a, %r11
  11641b:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
  116422:      	vmovq	%r11, %xmm2
  116427:      	vpbroadcastq	%xmm2, %ymm2
  11642c:      	vpblendd	$0x30, %ymm2, %ymm3, %ymm2 # ymm2 = ymm3[0,1,2,3],ymm2[4,5],ymm3[6,7]
  116432:      	movq	0x198(%rsp), %r11
  11643a:      	movq	%r11, %r9
  11643d:      	shldq	$0xc, %r15, %r9
  116442:      	shrq	$0x1a, %r15
  116446:      	andl	$0x3ffffff, %r15d       # imm = 0x3FFFFFF
  11644d:      	vmovq	%r15, %xmm3
  116452:      	vpbroadcastq	%xmm3, %ymm3
  116457:      	vpblendd	$0xc0, %ymm3, %ymm2, %ymm0 # ymm0 = ymm2[0,1,2,3,4,5],ymm3[6,7]
  11645d:      	vmovdqa	%ymm0, 0x2e0(%rsp)
  116466:      	movq	0x178(%rsp), %rdi
  11646e:      	movq	0x180(%rsp), %r15
  116476:      	shldq	$0x18, %r15, %rdi
  11647b:      	shrq	$0xe, %r15
  11647f:      	andl	$0x3ffffff, %r15d       # imm = 0x3FFFFFF
  116486:      	vmovdqa	0x480(%rsp), %ymm0
  11648f:      	vpinsrq	$0x1, %r15, %xmm0, %xmm2
  116495:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  11649b:      	movq	0x170(%rsp), %r15
  1164a3:      	shldq	$0x18, %r12, %r15
  1164a8:      	vmovq	%rsi, %xmm3
  1164ad:      	vpbroadcastq	%xmm3, %ymm3
  1164b2:      	vpblendd	$0x30, %ymm3, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm3[4,5],ymm1[6,7]
  1164b8:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
  1164bf:      	vmovq	%r9, %xmm3
  1164c4:      	vpbroadcastq	%xmm3, %ymm3
  1164c9:      	vpblendd	$0xc0, %ymm3, %ymm1, %ymm10 # ymm10 = ymm1[0,1,2,3,4,5],ymm3[6,7]
  1164cf:      	shrq	$0xe, %r12
  1164d3:      	andl	$0x3ffffff, %r12d       # imm = 0x3FFFFFF
  1164da:      	vmovq	%r12, %xmm1
  1164df:      	vpbroadcastq	%xmm1, %ymm1
  1164e4:      	vpblendd	$0x30, %ymm1, %ymm2, %ymm1 # ymm1 = ymm2[0,1,2,3],ymm1[4,5],ymm2[6,7]
  1164ea:      	movq	0x190(%rsp), %rsi
  1164f2:      	shldq	$0x18, %r11, %rsi
  1164f7:      	shrq	$0xe, %r11
  1164fb:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
  116502:      	vmovq	%r11, %xmm2
  116507:      	vpbroadcastq	%xmm2, %ymm2
  11650c:      	vpblendd	$0xc0, %ymm2, %ymm1, %ymm11 # ymm11 = ymm1[0,1,2,3,4,5],ymm2[6,7]
  116512:      	vmovdqa	0x4c0(%rsp), %ymm0
  11651b:      	vpinsrq	$0x1, %rdi, %xmm0, %xmm1
  116521:      	vmovq	%r15, %xmm2
  116526:      	vpbroadcastq	%xmm2, %ymm2
  11652b:      	vpblendd	$0x30, %ymm2, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm2[4,5],ymm1[6,7]
  116531:      	vmovq	%rsi, %xmm2
  116536:      	vpbroadcastq	%xmm2, %ymm2
  11653b:      	vpblendd	$0xc0, %ymm2, %ymm1, %ymm0 # ymm0 = ymm1[0,1,2,3,4,5],ymm2[6,7]
  116541:      	vmovdqa	%ymm0, 0x60(%rsp)
  116547:      	vmovdqa	0x3e0(%rsp), %ymm0
  116550:      	vpinsrq	$0x1, %rdx, %xmm0, %xmm1
  116556:      	movq	0x1a0(%rsp), %rsi
  11655e:      	movl	%esi, %edx
  116560:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  116566:      	vmovq	%rdx, %xmm2
  11656b:      	vpbroadcastq	%xmm2, %ymm2
  116570:      	vpblendd	$0x30, %ymm2, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm2[4,5],ymm1[6,7]
  116576:      	movq	0xb8(%rsp), %rdi
  11657e:      	movl	%edi, %edx
  116580:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  116586:      	vmovq	%rdx, %xmm2
  11658b:      	vpbroadcastq	%xmm2, %ymm2
  116590:      	vpblendd	$0xc0, %ymm2, %ymm1, %ymm0 # ymm0 = ymm1[0,1,2,3,4,5],ymm2[6,7]
  116596:      	vmovdqa	%ymm0, 0x2c0(%rsp)
  11659f:      	vmovdqa	0x440(%rsp), %ymm0
  1165a8:      	vpinsrq	$0x1, %r14, %xmm0, %xmm1
  1165ae:      	movq	0x1a8(%rsp), %r11
  1165b6:      	movq	%r11, %rdx
  1165b9:      	shldq	$0xc, %rsi, %rdx
  1165be:      	shrq	$0x1a, %rsi
  1165c2:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  1165c8:      	vmovq	%rsi, %xmm2
  1165cd:      	vpbroadcastq	%xmm2, %ymm2
  1165d2:      	vmovdqa	0x460(%rsp), %ymm0
  1165db:      	vpinsrq	$0x1, %rcx, %xmm0, %xmm3
  1165e1:      	vpblendd	$0x30, %ymm2, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm2[4,5],ymm1[6,7]
  1165e7:      	movq	0x58(%rsp), %rsi
  1165ec:      	movq	%rsi, %rcx
  1165ef:      	shldq	$0xc, %rdi, %rcx
  1165f4:      	shrq	$0x1a, %rdi
  1165f8:      	andl	$0x3ffffff, %edi        # imm = 0x3FFFFFF
  1165fe:      	vmovq	%rdi, %xmm2
  116603:      	vpbroadcastq	%xmm2, %ymm2
  116608:      	vpblendd	$0xc0, %ymm2, %ymm1, %ymm0 # ymm0 = ymm1[0,1,2,3,4,5],ymm2[6,7]
  11660e:      	vmovdqa	%ymm0, 0x2a0(%rsp)
  116617:      	movq	0x1b8(%rsp), %rdi
  11661f:      	shldq	$0x18, %r10, %rdi
  116624:      	shrq	$0xe, %r10
  116628:      	andl	$0x3ffffff, %r10d       # imm = 0x3FFFFFF
  11662f:      	vmovdqa	0x4a0(%rsp), %ymm0
  116638:      	vpinsrq	$0x1, %r10, %xmm0, %xmm1
  11663e:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  116644:      	movq	0x1b0(%rsp), %r9
  11664c:      	shldq	$0x18, %r11, %r9
  116651:      	vmovq	%rdx, %xmm2
  116656:      	vpbroadcastq	%xmm2, %ymm2
  11665b:      	vpblendd	$0x30, %ymm2, %ymm3, %ymm2 # ymm2 = ymm3[0,1,2,3],ymm2[4,5],ymm3[6,7]
  116661:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  116667:      	vmovq	%rcx, %xmm3
  11666c:      	vpbroadcastq	%xmm3, %ymm3
  116671:      	vpblendd	$0xc0, %ymm3, %ymm2, %ymm0 # ymm0 = ymm2[0,1,2,3,4,5],ymm3[6,7]
  116677:      	vmovdqa	%ymm0, 0x280(%rsp)
  116680:      	shrq	$0xe, %r11
  116684:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
  11668b:      	vmovq	%r11, %xmm2
  116690:      	vpbroadcastq	%xmm2, %ymm2
  116695:      	vpblendd	$0x30, %ymm2, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm2[4,5],ymm1[6,7]
  11669b:      	movq	%rsi, %rcx
  11669e:      	shrq	$0xe, %rcx
  1166a2:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  1166a8:      	vmovq	%rcx, %xmm2
  1166ad:      	vpbroadcastq	%xmm2, %ymm2
  1166b2:      	vpblendd	$0xc0, %ymm2, %ymm1, %ymm0 # ymm0 = ymm1[0,1,2,3,4,5],ymm2[6,7]
  1166b8:      	vmovdqa	%ymm0, 0x3a0(%rsp)
  1166c1:      	vmovdqa	0x4e0(%rsp), %ymm0
  1166ca:      	vpinsrq	$0x1, %rdi, %xmm0, %xmm1
  1166d0:      	vmovq	%r9, %xmm2
  1166d5:      	vpbroadcastq	%xmm2, %ymm2
  1166da:      	vpblendd	$0x30, %ymm2, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm2[4,5],ymm1[6,7]
  1166e0:      	shrq	$0x28, %rsi
  1166e4:      	vmovq	%rsi, %xmm2
  1166e9:      	vpbroadcastq	%xmm2, %ymm2
  1166ee:      	vpblendd	$0xc0, %ymm2, %ymm1, %ymm0 # ymm0 = ymm1[0,1,2,3,4,5],ymm2[6,7]
  1166f4:      	vmovdqa	%ymm0, 0x1e0(%rsp)
  1166fd:      	shlq	$0x7, %rax
  116701:      	vmovdqu	(%r8,%rax), %ymm2
  116707:      	vmovdqu	0x20(%r8,%rax), %ymm3
  11670e:      	vpunpckhqdq	%ymm3, %ymm2, %ymm1 # ymm1 = ymm2[1],ymm3[1],ymm2[3],ymm3[3]
  116712:      	vpunpcklqdq	%ymm3, %ymm2, %ymm2 # ymm2 = ymm2[0],ymm3[0],ymm2[2],ymm3[2]
  116716:      	vpsrlq	$0x34, %ymm2, %ymm3
  11671b:      	vpsllq	$0xc, %ymm1, %ymm4
  116720:      	vpor	%ymm3, %ymm4, %ymm3
  116724:      	vmovdqu	0x40(%r8,%rax), %ymm4
  11672b:      	vmovdqu	0x60(%r8,%rax), %ymm5
  116732:      	vpunpcklqdq	%ymm5, %ymm4, %ymm6 # ymm6 = ymm4[0],ymm5[0],ymm4[2],ymm5[2]
  116736:      	vmovdqa	%ymm6, 0x320(%rsp)
  11673f:      	vpunpckhqdq	%ymm5, %ymm4, %ymm0 # ymm0 = ymm4[1],ymm5[1],ymm4[3],ymm5[3]
  116743:      	vmovdqa	%ymm0, 0x340(%rsp)
  11674c:      	vpsrlq	$0x34, %ymm6, %ymm4
  116751:      	vpsllq	$0xc, %ymm0, %ymm5
  116756:      	vpor	%ymm4, %ymm5, %ymm0
  11675a:      	vmovdqa	%ymm0, 0x380(%rsp)
  116763:      	vpsrlq	$0x1a, %ymm12, %ymm4
  116769:      	vpaddq	0x80(%rsp), %ymm4, %ymm4
  116772:      	vmovdqa	0x100(%rsp), %ymm7
  11677b:      	vpsrlq	$0x1a, %ymm7, %ymm5
  116780:      	vpaddq	0xc0(%rsp), %ymm5, %ymm5
  116789:      	vpsrlq	$0x1a, %ymm4, %ymm8
  11678e:      	vpaddq	0xe0(%rsp), %ymm8, %ymm8
  116797:      	vpsrlq	$0x1a, %ymm2, %ymm9
  11679c:      	vmovdqa	0x360(%rsp), %ymm0
  1167a5:      	vpand	%ymm0, %ymm9, %ymm9
  1167a9:      	vpand	%ymm0, %ymm4, %ymm4
  1167ad:      	vpaddq	%ymm4, %ymm9, %ymm4
  1167b1:      	vpsrlq	$0x28, %ymm1, %ymm9
  1167b6:      	vpand	%ymm0, %ymm5, %ymm15
  1167ba:      	vpaddq	%ymm9, %ymm15, %ymm9
  1167bf:      	vpand	%ymm0, %ymm12, %ymm15
  1167c3:      	vpsrlq	$0x1a, %ymm5, %ymm5
  1167c8:      	vpaddq	%ymm5, %ymm15, %ymm15
  1167cc:      	vpsllq	$0x2, %ymm5, %ymm5
  1167d1:      	vpaddq	%ymm5, %ymm15, %ymm5
  1167d5:      	vpand	%ymm0, %ymm7, %ymm15
  1167d9:      	vpsrlq	$0x1a, %ymm8, %ymm14
  1167df:      	vpaddq	%ymm15, %ymm14, %ymm14
  1167e4:      	vpand	%ymm0, %ymm3, %ymm3
  1167e8:      	vpand	%ymm0, %ymm8, %ymm8
  1167ec:      	vpaddq	%ymm3, %ymm8, %ymm8
  1167f0:      	vpsrlq	$0x1a, %ymm5, %ymm3
  1167f5:      	vpaddq	%ymm4, %ymm3, %ymm7
  1167f9:      	vpand	%ymm0, %ymm2, %ymm2
  1167fd:      	vpand	%ymm0, %ymm5, %ymm4
  116801:      	vpaddq	%ymm4, %ymm2, %ymm6
  116805:      	vpsrlq	$0xe, %ymm1, %ymm1
  11680a:      	vpand	%ymm0, %ymm1, %ymm1
  11680e:      	vpand	%ymm0, %ymm14, %ymm4
  116812:      	vpaddq	%ymm4, %ymm1, %ymm4
  116816:      	vpsrlq	$0x1a, %ymm14, %ymm1
  11681c:      	vpaddq	0x1c0(%rsp), %ymm9, %ymm5
  116825:      	vpaddq	%ymm1, %ymm5, %ymm3
  116829:      	vpsllq	$0x2, %ymm11, %ymm5
  11682f:      	vpaddq	%ymm5, %ymm11, %ymm5
  116833:      	vmovdqa	0x300(%rsp), %ymm1
  11683c:      	vpmuludq	%ymm1, %ymm6, %ymm9
  116840:      	vpmuludq	%ymm5, %ymm8, %ymm14
  116844:      	vpaddq	%ymm9, %ymm14, %ymm9
  116849:      	vpsllq	$0x2, %ymm10, %ymm14
  11684f:      	vpaddq	%ymm10, %ymm14, %ymm14
  116854:      	vpmuludq	%ymm4, %ymm14, %ymm15
  116858:      	vpaddq	%ymm15, %ymm9, %ymm9
  11685d:      	vmovdqa	0x2e0(%rsp), %ymm2
  116866:      	vpsllq	$0x2, %ymm2, %ymm15
  11686b:      	vpaddq	%ymm2, %ymm15, %ymm15
  11686f:      	vmovdqa	0x60(%rsp), %ymm13
  116875:      	vpsllq	$0x2, %ymm13, %ymm12
  11687b:      	vpaddq	%ymm13, %ymm12, %ymm12
  116880:      	vpmuludq	%ymm3, %ymm15, %ymm15
  116884:      	vpmuludq	%ymm7, %ymm12, %ymm13
  116888:      	vpaddq	%ymm13, %ymm15, %ymm13
  11688d:      	vpaddq	%ymm13, %ymm9, %ymm9
  116892:      	vmovdqa	%ymm9, 0x100(%rsp)
  11689b:      	vpmuludq	%ymm2, %ymm6, %ymm9
  11689f:      	vpmuludq	%ymm12, %ymm8, %ymm13
  1168a4:      	vpaddq	%ymm9, %ymm13, %ymm9
  1168a9:      	vpmuludq	%ymm5, %ymm4, %ymm13
  1168ad:      	vpaddq	%ymm13, %ymm9, %ymm9
  1168b2:      	vpmuludq	%ymm3, %ymm14, %ymm13
  1168b6:      	vpmuludq	%ymm1, %ymm7, %ymm14
  1168ba:      	vpaddq	%ymm14, %ymm13, %ymm13
  1168bf:      	vpaddq	%ymm13, %ymm9, %ymm9
  1168c4:      	vmovdqa	%ymm9, 0xe0(%rsp)
  1168cd:      	vpmuludq	%ymm6, %ymm10, %ymm9
  1168d1:      	vpmuludq	%ymm1, %ymm8, %ymm13
  1168d5:      	vpaddq	%ymm9, %ymm13, %ymm9
  1168da:      	vpmuludq	%ymm4, %ymm12, %ymm13
  1168de:      	vpaddq	%ymm13, %ymm9, %ymm9
  1168e3:      	vpmuludq	%ymm5, %ymm3, %ymm5
  1168e7:      	vpmuludq	%ymm2, %ymm7, %ymm13
  1168eb:      	vpaddq	%ymm5, %ymm13, %ymm5
  1168ef:      	vpaddq	%ymm5, %ymm9, %ymm5
  1168f3:      	vmovdqa	%ymm5, 0xc0(%rsp)
  1168fc:      	vpmuludq	%ymm6, %ymm11, %ymm5
  116900:      	vpmuludq	%ymm2, %ymm8, %ymm9
  116904:      	vpaddq	%ymm5, %ymm9, %ymm5
  116908:      	vpmuludq	%ymm1, %ymm4, %ymm9
  11690c:      	vpaddq	%ymm5, %ymm9, %ymm5
  116910:      	vpmuludq	%ymm3, %ymm12, %ymm9
  116914:      	vpmuludq	%ymm7, %ymm10, %ymm12
  116918:      	vpaddq	%ymm12, %ymm9, %ymm9
  11691d:      	vpaddq	%ymm5, %ymm9, %ymm5
  116921:      	vmovdqa	%ymm5, 0x80(%rsp)
  11692a:      	vpmuludq	0x60(%rsp), %ymm6, %ymm12
  116930:      	vpmuludq	%ymm7, %ymm11, %ymm6
  116934:      	vpmuludq	%ymm10, %ymm8, %ymm5
  116939:      	vpaddq	%ymm5, %ymm12, %ymm5
  11693d:      	vpmuludq	%ymm2, %ymm4, %ymm4
  116941:      	vpaddq	%ymm4, %ymm5, %ymm4
  116945:      	vpmuludq	%ymm1, %ymm3, %ymm1
  116949:      	vpaddq	%ymm6, %ymm1, %ymm1
  11694d:      	vpaddq	%ymm1, %ymm4, %ymm1
  116951:      	vmovdqa	%ymm1, 0x60(%rsp)
  116957:      	vmovdqa	0x260(%rsp), %ymm8
  116960:      	vpsrlq	$0x1a, %ymm8, %ymm1
  116966:      	vpaddq	0x200(%rsp), %ymm1, %ymm1
  11696f:      	vmovdqa	0x240(%rsp), %ymm12
  116978:      	vpsrlq	$0x1a, %ymm12, %ymm2
  11697e:      	vpaddq	0x120(%rsp), %ymm2, %ymm2
  116987:      	vpsrlq	$0x1a, %ymm1, %ymm3
  11698c:      	vpaddq	0x220(%rsp), %ymm3, %ymm3
  116995:      	vmovdqa	0x320(%rsp), %ymm7
  11699e:      	vpsrlq	$0x1a, %ymm7, %ymm4
  1169a3:      	vpand	%ymm0, %ymm4, %ymm4
  1169a7:      	vpand	%ymm0, %ymm1, %ymm1
  1169ab:      	vpaddq	%ymm4, %ymm1, %ymm1
  1169af:      	vmovdqa	0x340(%rsp), %ymm6
  1169b8:      	vpsrlq	$0x28, %ymm6, %ymm4
  1169bd:      	vpand	%ymm0, %ymm2, %ymm5
  1169c1:      	vpaddq	%ymm4, %ymm5, %ymm4
  1169c5:      	vpand	%ymm0, %ymm8, %ymm5
  1169c9:      	vpsrlq	$0x1a, %ymm2, %ymm2
  1169ce:      	vpaddq	%ymm5, %ymm2, %ymm5
  1169d2:      	vpsllq	$0x2, %ymm2, %ymm2
  1169d7:      	vpaddq	%ymm5, %ymm2, %ymm2
  1169db:      	vpand	%ymm0, %ymm12, %ymm5
  1169df:      	vpsrlq	$0x1a, %ymm3, %ymm12
  1169e4:      	vpaddq	%ymm5, %ymm12, %ymm12
  1169e8:      	vpand	0x380(%rsp), %ymm0, %ymm5
  1169f1:      	vpand	%ymm0, %ymm3, %ymm3
  1169f5:      	vpaddq	%ymm3, %ymm5, %ymm5
  1169f9:      	vpsrlq	$0x1a, %ymm2, %ymm3
  1169fe:      	vpaddq	%ymm1, %ymm3, %ymm1
  116a02:      	vpand	%ymm0, %ymm7, %ymm3
  116a06:      	vpand	%ymm0, %ymm2, %ymm2
  116a0a:      	vpaddq	%ymm2, %ymm3, %ymm2
  116a0e:      	vpsrlq	$0xe, %ymm6, %ymm3
  116a13:      	vpand	%ymm0, %ymm3, %ymm3
  116a17:      	vpand	%ymm0, %ymm12, %ymm6
  116a1b:      	vpaddq	%ymm6, %ymm3, %ymm6
  116a1f:      	vpaddq	0x1c0(%rsp), %ymm4, %ymm3
  116a28:      	vpsrlq	$0x1a, %ymm12, %ymm4
  116a2e:      	vpaddq	%ymm4, %ymm3, %ymm3
  116a32:      	vmovdqa	0x3a0(%rsp), %ymm15
  116a3b:      	vpsllq	$0x2, %ymm15, %ymm4
  116a41:      	vpaddq	%ymm4, %ymm15, %ymm13
  116a45:      	vmovdqa	0x2c0(%rsp), %ymm10
  116a4e:      	vpmuludq	%ymm2, %ymm10, %ymm4
  116a52:      	vpmuludq	%ymm5, %ymm13, %ymm7
  116a56:      	vpaddq	%ymm4, %ymm7, %ymm4
  116a5a:      	vmovdqa	0x280(%rsp), %ymm9
  116a63:      	vpsllq	$0x2, %ymm9, %ymm7
  116a69:      	vpaddq	%ymm7, %ymm9, %ymm7
  116a6d:      	vpmuludq	%ymm7, %ymm6, %ymm12
  116a71:      	vpaddq	%ymm4, %ymm12, %ymm4
  116a75:      	vmovdqa	0x2a0(%rsp), %ymm11
  116a7e:      	vpsllq	$0x2, %ymm11, %ymm12
  116a84:      	vpaddq	%ymm11, %ymm12, %ymm12
  116a89:      	vmovdqa	0x1e0(%rsp), %ymm8
  116a92:      	vpsllq	$0x2, %ymm8, %ymm14
  116a98:      	vpaddq	%ymm8, %ymm14, %ymm14
  116a9d:      	vpmuludq	%ymm3, %ymm12, %ymm12
  116aa1:      	vpmuludq	%ymm1, %ymm14, %ymm8
  116aa5:      	vpaddq	%ymm8, %ymm12, %ymm8
  116aaa:      	vpaddq	%ymm4, %ymm8, %ymm4
  116aae:      	vpmuludq	%ymm2, %ymm11, %ymm8
  116ab2:      	vpmuludq	%ymm5, %ymm14, %ymm12
  116ab6:      	vpaddq	%ymm8, %ymm12, %ymm8
  116abb:      	vpmuludq	%ymm6, %ymm13, %ymm12
  116abf:      	vpaddq	%ymm12, %ymm8, %ymm8
  116ac4:      	vpmuludq	%ymm7, %ymm3, %ymm7
  116ac8:      	vpmuludq	%ymm1, %ymm10, %ymm12
  116acc:      	vpaddq	%ymm7, %ymm12, %ymm7
  116ad0:      	vpaddq	%ymm7, %ymm8, %ymm7
  116ad4:      	vpmuludq	%ymm2, %ymm9, %ymm8
  116ad8:      	vpmuludq	%ymm5, %ymm10, %ymm12
  116adc:      	vpaddq	%ymm8, %ymm12, %ymm8
  116ae1:      	vpmuludq	%ymm6, %ymm14, %ymm12
  116ae5:      	vpaddq	%ymm12, %ymm8, %ymm8
  116aea:      	vpmuludq	%ymm3, %ymm13, %ymm12
  116aee:      	vpmuludq	%ymm1, %ymm11, %ymm13
  116af2:      	vpaddq	%ymm13, %ymm12, %ymm12
  116af7:      	vpaddq	%ymm12, %ymm8, %ymm13
  116afc:      	vpmuludq	%ymm2, %ymm15, %ymm8
  116b00:      	vpmuludq	%ymm5, %ymm11, %ymm12
  116b04:      	vpaddq	%ymm8, %ymm12, %ymm8
  116b09:      	vpmuludq	%ymm6, %ymm10, %ymm12
  116b0d:      	vpaddq	%ymm12, %ymm8, %ymm8
  116b12:      	vpmuludq	%ymm3, %ymm14, %ymm12
  116b16:      	vpmuludq	%ymm1, %ymm9, %ymm14
  116b1a:      	vpaddq	%ymm14, %ymm12, %ymm12
  116b1f:      	vpaddq	%ymm12, %ymm8, %ymm14
  116b24:      	vpmuludq	0x1e0(%rsp), %ymm2, %ymm2
  116b2d:      	vpmuludq	%ymm1, %ymm15, %ymm1
  116b31:      	vpmuludq	%ymm5, %ymm9, %ymm5
  116b35:      	vpaddq	%ymm2, %ymm5, %ymm2
  116b39:      	vpmuludq	%ymm6, %ymm11, %ymm5
  116b3d:      	vpaddq	%ymm5, %ymm2, %ymm2
  116b41:      	vpmuludq	%ymm3, %ymm10, %ymm3
  116b45:      	vpaddq	%ymm1, %ymm3, %ymm1
  116b49:      	vpaddq	%ymm1, %ymm2, %ymm3
  116b4d:      	vmovdqa	0x100(%rsp), %ymm2
  116b56:      	vpsrlq	$0x1a, %ymm2, %ymm1
  116b5b:      	vpaddq	0xe0(%rsp), %ymm1, %ymm5
  116b64:      	vpand	%ymm0, %ymm2, %ymm2
  116b68:      	vmovdqa	0x80(%rsp), %ymm6
  116b71:      	vpsrlq	$0x1a, %ymm6, %ymm1
  116b76:      	vpaddq	0x60(%rsp), %ymm1, %ymm1
  116b7c:      	vpand	%ymm0, %ymm6, %ymm6
  116b80:      	vpsrlq	$0x1a, %ymm5, %ymm8
  116b85:      	vpaddq	0xc0(%rsp), %ymm8, %ymm8
  116b8e:      	vpsrlq	$0x1a, %ymm1, %ymm9
  116b93:      	vpaddq	%ymm2, %ymm9, %ymm2
  116b97:      	vpsllq	$0x2, %ymm9, %ymm9
  116b9d:      	vpaddq	%ymm2, %ymm9, %ymm9
  116ba1:      	vpsrlq	$0x1a, %ymm8, %ymm2
  116ba7:      	vpaddq	%ymm6, %ymm2, %ymm2
  116bab:      	vpsrlq	$0x1a, %ymm4, %ymm6
  116bb0:      	vpaddq	%ymm6, %ymm7, %ymm6
  116bb4:      	vpsrlq	$0x1a, %ymm14, %ymm7
  116bba:      	vpaddq	%ymm7, %ymm3, %ymm3
  116bbe:      	vpsrlq	$0x1a, %ymm6, %ymm7
  116bc3:      	vpaddq	%ymm7, %ymm13, %ymm7
  116bc7:      	vpand	%ymm0, %ymm5, %ymm5
  116bcb:      	vpand	%ymm0, %ymm8, %ymm8
  116bcf:      	vpand	%ymm0, %ymm6, %ymm6
  116bd3:      	vpaddq	%ymm6, %ymm5, %ymm5
  116bd7:      	vpsrlq	$0x1a, %ymm9, %ymm6
  116bdd:      	vpand	%ymm0, %ymm9, %ymm9
  116be1:      	vpand	%ymm0, %ymm4, %ymm4
  116be5:      	vpand	%ymm0, %ymm14, %ymm10
  116be9:      	vpaddq	%ymm5, %ymm6, %ymm5
  116bed:      	vpsrlq	$0x1a, %ymm3, %ymm6
  116bf2:      	vpaddq	%ymm4, %ymm6, %ymm4
  116bf6:      	vpsllq	$0x2, %ymm6, %ymm6
  116bfb:      	vpaddq	%ymm4, %ymm6, %ymm6
  116bff:      	vpsrlq	$0x1a, %ymm7, %ymm4
  116c04:      	vpaddq	%ymm4, %ymm10, %ymm4
  116c08:      	vpand	%ymm0, %ymm2, %ymm10
  116c0c:      	vpand	%ymm0, %ymm7, %ymm7
  116c10:      	vpaddq	%ymm7, %ymm8, %ymm7
  116c14:      	vpsrlq	$0x1a, %ymm6, %ymm8
  116c19:      	vpaddq	%ymm5, %ymm8, %ymm8
  116c1d:      	vpand	%ymm0, %ymm6, %ymm5
  116c21:      	vpaddq	%ymm5, %ymm9, %ymm6
  116c25:      	vpand	%ymm0, %ymm4, %ymm5
  116c29:      	vpaddq	%ymm5, %ymm10, %ymm5
  116c2d:      	vpshufd	$0xee, %xmm6, %xmm9     # xmm9 = xmm6[2,3,2,3]
  116c32:      	vextracti128	$0x1, %ymm6, %xmm10
  116c38:      	vpaddq	%xmm6, %xmm9, %xmm9
  116c3c:      	vpermq	$0xff, %ymm6, %ymm6     # ymm6 = ymm6[3,3,3,3]
  116c42:      	vpaddq	%xmm6, %xmm10, %xmm6
  116c46:      	vpaddq	%xmm6, %xmm9, %xmm6
  116c4a:      	vmovq	%xmm6, %rdx
  116c4f:      	vpshufd	$0xee, %xmm8, %xmm6     # xmm6 = xmm8[2,3,2,3]
  116c55:      	vextracti128	$0x1, %ymm8, %xmm9
  116c5b:      	vpaddq	%xmm6, %xmm8, %xmm6
  116c5f:      	vpermq	$0xff, %ymm8, %ymm8     # ymm8 = ymm8[3,3,3,3]
  116c65:      	vpaddq	%xmm8, %xmm9, %xmm8
  116c6a:      	vpaddq	%xmm6, %xmm8, %xmm6
  116c6e:      	vmovq	%xmm6, %rsi
  116c73:      	vpshufd	$0xee, %xmm7, %xmm6     # xmm6 = xmm7[2,3,2,3]
  116c78:      	vextracti128	$0x1, %ymm7, %xmm8
  116c7e:      	vpaddq	%xmm6, %xmm7, %xmm6
  116c82:      	vpermq	$0xff, %ymm7, %ymm7     # ymm7 = ymm7[3,3,3,3]
  116c88:      	vpaddq	%xmm7, %xmm8, %xmm7
  116c8c:      	vpaddq	%xmm7, %xmm6, %xmm6
  116c90:      	vmovq	%xmm6, %rax
  116c95:      	vpshufd	$0xee, %xmm5, %xmm6     # xmm6 = xmm5[2,3,2,3]
  116c9a:      	vextracti128	$0x1, %ymm5, %xmm7
  116ca0:      	vpaddq	%xmm6, %xmm5, %xmm6
  116ca4:      	vpermq	$0xff, %ymm5, %ymm5     # ymm5 = ymm5[3,3,3,3]
  116caa:      	vpaddq	%xmm5, %xmm7, %xmm5
  116cae:      	vpaddq	%xmm5, %xmm6, %xmm5
  116cb2:      	vmovq	%xmm5, %rcx
  116cb7:      	movq	%rsi, %rdi
  116cba:      	shrq	$0x26, %rdi
  116cbe:      	shlq	$0x1a, %rsi
  116cc2:      	movq	%rax, %r8
  116cc5:      	shrq	$0xc, %r8
  116cc9:      	shlq	$0x34, %rax
  116ccd:      	addq	%rdx, %rax
  116cd0:      	adcq	$0x0, %r8
  116cd4:      	addq	%rsi, %rax
  116cd7:      	adcq	%rdi, %r8
  116cda:      	shlq	$0xe, %rcx
  116cde:      	addq	%r8, %rcx
  116ce1:      	jb	0x116d8c <toyos_crypto::arch::x86_64::poly1305::blocks (.llvm.3142307217602062041)+0x168c>
  116ce7:      	vpsrlq	$0x1a, %ymm2, %ymm2
  116cec:      	vmovdqa	0x360(%rsp), %ymm0
  116cf5:      	vpand	%ymm0, %ymm1, %ymm1
  116cf9:      	vpand	%ymm0, %ymm3, %ymm0
  116cfd:      	vpaddq	%ymm0, %ymm1, %ymm0
  116d01:      	vpaddq	%ymm0, %ymm2, %ymm0
  116d05:      	vpsrlq	$0x1a, %ymm4, %ymm1
  116d0a:      	vpaddq	%ymm1, %ymm0, %ymm0
  116d0e:      	vpshufd	$0xee, %xmm0, %xmm1     # xmm1 = xmm0[2,3,2,3]
  116d13:      	vextracti128	$0x1, %ymm0, %xmm2
  116d19:      	vpermq	$0xff, %ymm0, %ymm3     # ymm3 = ymm0[3,3,3,3]
  116d1f:      	vpaddq	%xmm1, %xmm0, %xmm0
  116d23:      	vpaddq	%xmm3, %xmm2, %xmm1
  116d27:      	vpaddq	%xmm1, %xmm0, %xmm0
  116d2b:      	vmovq	%xmm0, %rdx
  116d30:      	movq	%rdx, %rsi
  116d33:      	shrq	$0x18, %rsi
  116d37:      	shlq	$0x28, %rdx
  116d3b:      	addq	%rdx, %rcx
  116d3e:      	adcq	$0x0, %rsi
  116d42:      	movl	%esi, %edx
  116d44:      	andl	$0x3, %edx
  116d47:      	shrq	$0x2, %rsi
  116d4b:      	leaq	(%rsi,%rsi,4), %rsi
  116d4f:      	addq	%rsi, %rax
  116d52:      	adcq	$0x0, %rcx
  116d56:      	adcq	$0x0, %rdx
  116d5a:      	movq	%rax, (%rbx)
  116d5d:      	movq	%rcx, 0x8(%rbx)
  116d61:      	movq	%rdx, 0x10(%rbx)
  116d65:      	movabsq	$0x7fffffffffffff8, %rcx # imm = 0x7FFFFFFFFFFFFF8
  116d6f:      	movq	0x150(%rsp), %rax
  116d77:      	andq	%rcx, %rax
  116d7a:      	leaq	-0x28(%rbp), %rsp
  116d7e:      	popq	%rbx
  116d7f:      	popq	%r12
  116d81:      	popq	%r13
  116d83:      	popq	%r14
  116d85:      	popq	%r15
  116d87:      	popq	%rbp
  116d88:      	vzeroupper
  116d8b:      	retq
  116d8c:      	leaq	0x603ad(%rip), %rdi     # 0x177140 <anon.035262e224809c533440a9541ff83897.1.llvm.16451390423216165772+0x78>
  116d93:      	vzeroupper
  116d96:      	callq	0x16c860 <core::panicking::panic_const::panic_const_add_overflow>
