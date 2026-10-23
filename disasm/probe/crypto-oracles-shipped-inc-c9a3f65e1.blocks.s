
crypto-oracles-shipped-inc-c9a3f65e1:	file format elf64-x86-64

Disassembly of section .text:

000000000030ac10 <toyos_crypto::arch::x86_64::poly1305::blocks>:
  30ac10:      	pushq	%rbp
  30ac11:      	movq	%rsp, %rbp
  30ac14:      	pushq	%r15
  30ac16:      	pushq	%r14
  30ac18:      	pushq	%r13
  30ac1a:      	pushq	%r12
  30ac1c:      	pushq	%rbx
  30ac1d:      	andq	$-0x20, %rsp
  30ac21:      	subq	$0x580, %rsp            # imm = 0x580
  30ac28:      	movq	%rcx, %r10
  30ac2b:      	shrq	$0x3, %r10
  30ac2f:      	je	0x30bbab <toyos_crypto::arch::x86_64::poly1305::blocks+0xf9b>
  30ac35:      	movq	%rdx, %r8
  30ac38:      	movq	%rcx, 0x138(%rsp)
  30ac40:      	movq	(%rsi), %rcx
  30ac43:      	movq	0x8(%rsi), %rax
  30ac47:      	movl	%ecx, %edx
  30ac49:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  30ac4f:      	movl	%edx, 0xa0(%rsp)
  30ac56:      	movq	%rax, %rdx
  30ac59:      	shldq	$0xc, %rcx, %rdx
  30ac5e:      	shrq	$0x1a, %rcx
  30ac62:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  30ac68:      	movq	%rcx, 0x80(%rsp)
  30ac70:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
  30ac76:      	movq	%rdx, 0x180(%rsp)
  30ac7e:      	shrq	$0xe, %rax
  30ac82:      	movq	%rax, %r9
  30ac85:      	movq	(%rdi), %r15
  30ac88:      	movq	0x8(%rdi), %rax
  30ac8c:      	movq	%rax, %rbx
  30ac8f:      	mulq	%r15
  30ac92:      	movq	%rdx, %rcx
  30ac95:      	movq	%rax, %r11
  30ac98:      	shldq	$0x1, %rax, %rcx
  30ac9d:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
  30aca4:      	movq	%r9, 0x160(%rsp)
  30acac:      	addq	%rax, %r11
  30acaf:      	movq	0x10(%rdi), %rax
  30acb3:      	movq	%rax, 0x60(%rsp)
  30acb8:      	mulq	%rbx
  30acbb:      	movq	%rbx, 0x40(%rsp)
  30acc0:      	movq	%rdx, %rdi
  30acc3:      	movq	%rax, %r9
  30acc6:      	movq	%r15, %rax
  30acc9:      	mulq	%r15
  30accc:      	movq	%rdx, %r13
  30accf:      	addq	%r9, %rax
  30acd2:      	adcq	%rdi, %r13
  30acd5:      	addq	%r11, %r13
  30acd8:      	adcq	$0x0, %rcx
  30acdc:      	movl	%ecx, %edi
  30acde:      	andl	$0x3, %edi
  30ace1:      	shrq	$0x2, %rcx
  30ace5:      	leaq	(%rcx,%rcx,4), %r12
  30ace9:      	addq	%rax, %r12
  30acec:      	adcq	$0x0, %r13
  30acf0:      	movq	%rdi, %r14
  30acf3:      	adcq	$0x0, %r14
  30acf7:      	movq	%r14, 0x100(%rsp)
  30acff:      	movq	%r13, %rax
  30ad02:      	movq	%r13, 0x140(%rsp)
  30ad0a:      	mulq	%r15
  30ad0d:      	movq	%rax, %r11
  30ad10:      	movq	%rdx, %rdi
  30ad13:      	imulq	%r15, %r14
  30ad17:      	movq	%r12, %rax
  30ad1a:      	movq	%r12, 0x1a0(%rsp)
  30ad22:      	mulq	%rbx
  30ad25:      	movq	%rdx, %rcx
  30ad28:      	movq	%rax, %r9
  30ad2b:      	addq	%r11, %r9
  30ad2e:      	adcq	%rdi, %rcx
  30ad31:      	movq	%r13, %rax
  30ad34:      	movq	0x60(%rsp), %r13
  30ad39:      	mulq	%r13
  30ad3c:      	movq	%rdx, %rdi
  30ad3f:      	movq	%rsi, 0x130(%rsp)
  30ad47:      	movq	%rax, %r11
  30ad4a:      	movq	%r12, %rax
  30ad4d:      	mulq	%r15
  30ad50:      	movq	%rdx, %rbx
  30ad53:      	movq	%rax, %rsi
  30ad56:      	addq	%r11, %rsi
  30ad59:      	adcq	%rdi, %rbx
  30ad5c:      	addq	%r9, %rbx
  30ad5f:      	adcq	$0x0, %rcx
  30ad63:      	movq	0x100(%rsp), %rax
  30ad6b:      	mulq	%r13
  30ad6e:      	addq	%rbx, %rax
  30ad71:      	adcq	%rcx, %rdx
  30ad74:      	addq	%r14, %rdx
  30ad77:      	movl	%edx, %r12d
  30ad7a:      	andl	$0x3, %r12d
  30ad7e:      	shrq	$0x2, %rdx
  30ad82:      	leaq	(%rdx,%rdx,4), %rbx
  30ad86:      	addq	%rsi, %rbx
  30ad89:      	adcq	$0x0, %rax
  30ad8d:      	adcq	$0x0, %r12
  30ad91:      	movq	%rax, %r11
  30ad94:      	movq	%rax, 0x1e0(%rsp)
  30ad9c:      	mulq	%r15
  30ad9f:      	movq	%rax, %rcx
  30ada2:      	movq	%rdx, %rdi
  30ada5:      	movq	%r12, %r14
  30ada8:      	movq	%r12, 0x200(%rsp)
  30adb0:      	imulq	%r15, %r14
  30adb4:      	movq	%rbx, 0x1c0(%rsp)
  30adbc:      	movq	%rbx, %rax
  30adbf:      	mulq	0x40(%rsp)
  30adc4:      	movq	%rdx, %rsi
  30adc7:      	movq	%rax, %r9
  30adca:      	addq	%rcx, %r9
  30adcd:      	adcq	%rdi, %rsi
  30add0:      	movq	%r11, %rax
  30add3:      	mulq	%r13
  30add6:      	movq	%rdx, %rcx
  30add9:      	movq	%rax, %r11
  30addc:      	movq	%rbx, %rax
  30addf:      	mulq	%r15
  30ade2:      	movq	%rdx, %rbx
  30ade5:      	movq	%rax, %rdi
  30ade8:      	addq	%r11, %rdi
  30adeb:      	adcq	%rcx, %rbx
  30adee:      	addq	%r9, %rbx
  30adf1:      	adcq	$0x0, %rsi
  30adf5:      	movq	%r12, %rax
  30adf8:      	mulq	%r13
  30adfb:      	addq	%rbx, %rax
  30adfe:      	adcq	%rsi, %rdx
  30ae01:      	addq	%r14, %rdx
  30ae04:      	movq	%rdx, %rcx
  30ae07:      	shrq	$0x2, %rcx
  30ae0b:      	leaq	(%rcx,%rcx,4), %rbx
  30ae0f:      	andl	$0x3, %edx
  30ae12:      	movq	%rdx, %rsi
  30ae15:      	addq	%rdi, %rbx
  30ae18:      	movq	%rax, %rcx
  30ae1b:      	adcq	$0x0, %rcx
  30ae1f:      	adcq	$0x0, %rsi
  30ae23:      	movq	%rsi, %r12
  30ae26:      	movq	%rbx, %rax
  30ae29:      	movq	%rbx, 0x220(%rsp)
  30ae31:      	movq	%r15, %r14
  30ae34:      	mulq	%r15
  30ae37:      	movq	%rdx, %r9
  30ae3a:      	movq	%rax, %r11
  30ae3d:      	movq	%rcx, %rax
  30ae40:      	movq	%rcx, 0x260(%rsp)
  30ae48:      	mulq	%r13
  30ae4b:      	movq	%rdx, %rdi
  30ae4e:      	movq	%rax, %rsi
  30ae51:      	addq	%r11, %rsi
  30ae54:      	adcq	%r9, %rdi
  30ae57:      	movq	%rbx, %rax
  30ae5a:      	movq	0x40(%rsp), %r15
  30ae5f:      	mulq	%r15
  30ae62:      	movq	%rdx, %r11
  30ae65:      	movq	%rax, %rbx
  30ae68:      	movq	%rcx, %rax
  30ae6b:      	mulq	%r14
  30ae6e:      	movq	%r14, %r9
  30ae71:      	movq	%rdx, %r14
  30ae74:      	movq	%rax, %rcx
  30ae77:      	addq	%rbx, %rcx
  30ae7a:      	adcq	%r11, %r14
  30ae7d:      	movq	%r12, 0x240(%rsp)
  30ae85:      	movq	%r12, %rax
  30ae88:      	mulq	%r13
  30ae8b:      	addq	%rdi, %rcx
  30ae8e:      	adcq	$0x0, %r14
  30ae92:      	addq	%rax, %rcx
  30ae95:      	movq	%rcx, %rdi
  30ae98:      	adcq	%rdx, %r14
  30ae9b:      	movq	%r12, %rcx
  30ae9e:      	movq	%r9, %r11
  30aea1:      	imulq	%r9, %rcx
  30aea5:      	addq	%r14, %rcx
  30aea8:      	movq	%rcx, %rax
  30aeab:      	shrq	$0x2, %rax
  30aeaf:      	leaq	(%rax,%rax,4), %rax
  30aeb3:      	andl	$0x3, %ecx
  30aeb6:      	addq	%rsi, %rax
  30aeb9:      	movq	%rdi, %r14
  30aebc:      	adcq	$0x0, %r14
  30aec0:      	adcq	$0x0, %rcx
  30aec4:      	movq	%rcx, %r9
  30aec7:      	movq	%rax, %rcx
  30aeca:      	movq	%rax, 0x2a0(%rsp)
  30aed2:      	mulq	%r11
  30aed5:      	movq	%r11, %r12
  30aed8:      	movq	%rdx, %r11
  30aedb:      	movq	%rax, %rbx
  30aede:      	movq	%r14, %rax
  30aee1:      	movq	%r14, 0x2c0(%rsp)
  30aee9:      	mulq	%r13
  30aeec:      	movq	%rdx, %rdi
  30aeef:      	movq	%rax, %rsi
  30aef2:      	addq	%rbx, %rsi
  30aef5:      	adcq	%r11, %rdi
  30aef8:      	movq	%rcx, %rax
  30aefb:      	mulq	%r15
  30aefe:      	movq	%rdx, %r11
  30af01:      	movq	%rax, %rbx
  30af04:      	movq	%r14, %rax
  30af07:      	mulq	%r12
  30af0a:      	movq	%r12, %rcx
  30af0d:      	movq	%rdx, %r12
  30af10:      	movq	%rax, %r15
  30af13:      	addq	%rbx, %r15
  30af16:      	adcq	%r11, %r12
  30af19:      	movq	%r9, 0x2e0(%rsp)
  30af21:      	movq	%r9, %rax
  30af24:      	mulq	%r13
  30af27:      	addq	%rdi, %r15
  30af2a:      	adcq	$0x0, %r12
  30af2e:      	addq	%rax, %r15
  30af31:      	adcq	%rdx, %r12
  30af34:      	movq	%r9, %rdx
  30af37:      	imulq	%rcx, %rdx
  30af3b:      	addq	%r12, %rdx
  30af3e:      	movq	%rdx, %rax
  30af41:      	shrq	$0x2, %rax
  30af45:      	leaq	(%rax,%rax,4), %rbx
  30af49:      	andl	$0x3, %edx
  30af4c:      	addq	%rsi, %rbx
  30af4f:      	adcq	$0x0, %r15
  30af53:      	adcq	$0x0, %rdx
  30af57:      	movq	%rdx, 0xe0(%rsp)
  30af5f:      	movq	%rbx, %rax
  30af62:      	movq	%rbx, 0xc0(%rsp)
  30af6a:      	mulq	%rcx
  30af6d:      	movq	%rdx, %rsi
  30af70:      	movq	%rax, %r11
  30af73:      	movq	%r15, %rax
  30af76:      	mulq	%r13
  30af79:      	movq	%r13, %r9
  30af7c:      	movq	%rdx, %rdi
  30af7f:      	movq	%rax, %r13
  30af82:      	addq	%r11, %r13
  30af85:      	adcq	%rsi, %rdi
  30af88:      	movq	%rbx, %rax
  30af8b:      	mulq	0x40(%rsp)
  30af90:      	movq	%rdx, %r11
  30af93:      	movq	%rax, %rbx
  30af96:      	movq	%r15, %rax
  30af99:      	mulq	%rcx
  30af9c:      	movq	%rdx, %r12
  30af9f:      	movq	%rax, %r14
  30afa2:      	addq	%rbx, %r14
  30afa5:      	adcq	%r11, %r12
  30afa8:      	movq	0xe0(%rsp), %rbx
  30afb0:      	movq	%rbx, %rax
  30afb3:      	movq	%r9, %r11
  30afb6:      	mulq	%r9
  30afb9:      	addq	%rdi, %r14
  30afbc:      	adcq	$0x0, %r12
  30afc0:      	addq	%rax, %r14
  30afc3:      	adcq	%rdx, %r12
  30afc6:      	imulq	%rcx, %rbx
  30afca:      	addq	%r12, %rbx
  30afcd:      	movq	%rbx, %rax
  30afd0:      	shrq	$0x2, %rax
  30afd4:      	leaq	(%rax,%rax,4), %r9
  30afd8:      	andl	$0x3, %ebx
  30afdb:      	addq	%r13, %r9
  30afde:      	adcq	$0x0, %r14
  30afe2:      	adcq	$0x0, %rbx
  30afe6:      	movq	%r9, %rax
  30afe9:      	mulq	%rcx
  30afec:      	movq	%rcx, %rsi
  30afef:      	movq	%rdx, %r13
  30aff2:      	movq	%rax, %rcx
  30aff5:      	movq	%r14, %rax
  30aff8:      	mulq	%r11
  30affb:      	movq	%rdx, %r12
  30affe:      	movq	%rax, %r11
  30b001:      	addq	%rcx, %r11
  30b004:      	adcq	%r13, %r12
  30b007:      	movq	%r9, %rax
  30b00a:      	mulq	0x40(%rsp)
  30b00f:      	movq	%rdx, %rcx
  30b012:      	movq	%rax, %r13
  30b015:      	movq	%r14, %rax
  30b018:      	mulq	%rsi
  30b01b:      	movq	%rsi, 0x280(%rsp)
  30b023:      	movq	%rdx, %rdi
  30b026:      	addq	%r13, %rax
  30b029:      	movq	%rax, %r13
  30b02c:      	adcq	%rcx, %rdi
  30b02f:      	movq	%rbx, %rax
  30b032:      	mulq	0x60(%rsp)
  30b037:      	addq	%r12, %r13
  30b03a:      	adcq	$0x0, %rdi
  30b03e:      	addq	%rax, %r13
  30b041:      	adcq	%rdx, %rdi
  30b044:      	movq	%rbx, %rdx
  30b047:      	imulq	%rsi, %rdx
  30b04b:      	addq	%rdi, %rdx
  30b04e:      	movq	%rdx, %rax
  30b051:      	shrq	$0x2, %rax
  30b055:      	leaq	(%rax,%rax,4), %rax
  30b059:      	andl	$0x3, %edx
  30b05c:      	addq	%r11, %rax
  30b05f:      	adcq	$0x0, %r13
  30b063:      	adcq	$0x0, %rdx
  30b067:      	movl	%eax, %ecx
  30b069:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  30b06f:      	movq	%r13, %rdi
  30b072:      	shldq	$0xc, %rax, %rdi
  30b077:      	shrq	$0x1a, %rax
  30b07b:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
  30b080:      	shldq	$0x18, %r13, %rdx
  30b085:      	andl	$0x3ffffff, %edi        # imm = 0x3FFFFFF
  30b08b:      	shrq	$0xe, %r13
  30b08f:      	andl	$0x3ffffff, %r13d       # imm = 0x3FFFFFF
  30b096:      	movq	%rcx, (%rsp)
  30b09a:      	movq	%rax, 0x8(%rsp)
  30b09f:      	movq	%rdi, 0x10(%rsp)
  30b0a4:      	movq	%r13, 0x18(%rsp)
  30b0a9:      	movq	%rdx, 0x20(%rsp)
  30b0ae:      	movq	%rcx, 0x28(%rsp)
  30b0b3:      	movq	%rax, 0x30(%rsp)
  30b0b8:      	movq	%rdi, 0x38(%rsp)
  30b0bd:      	vmovups	(%rsp), %ymm0
  30b0c2:      	vmovaps	%ymm0, 0x300(%rsp)
  30b0cb:      	vmovdqu	0x8(%rsp), %ymm12
  30b0d1:      	vmovdqu	0x10(%rsp), %ymm13
  30b0d7:      	vmovdqu	0x18(%rsp), %ymm14
  30b0dd:      	vmovdqu	0x20(%rsp), %ymm15
  30b0e3:      	movq	0xc0(%rsp), %r11
  30b0eb:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
  30b0f2:      	movq	%rcx, 0x60(%rsp)
  30b0f7:      	movq	%rcx, (%rsp)
  30b0fb:      	movq	%rax, 0x8(%rsp)
  30b100:      	movq	%rdi, 0x10(%rsp)
  30b105:      	movq	%r13, 0x18(%rsp)
  30b10a:      	movq	%rdx, 0x20(%rsp)
  30b10f:      	movq	%r11, 0x28(%rsp)
  30b114:      	vmovdqu	(%rsp), %xmm4
  30b119:      	vmovdqu	0x8(%rsp), %xmm3
  30b11f:      	vmovdqu	0x10(%rsp), %xmm2
  30b125:      	vmovdqu	0x18(%rsp), %xmm1
  30b12b:      	vmovdqu	0x20(%rsp), %xmm0
  30b131:      	movq	0x220(%rsp), %rcx
  30b139:      	movl	%ecx, %r12d
  30b13c:      	andl	$0x3ffffff, %r12d       # imm = 0x3FFFFFF
  30b143:      	movq	%r12, (%rsp)
  30b147:      	movq	0x260(%rsp), %rsi
  30b14f:      	movq	%rsi, %r12
  30b152:      	shldq	$0xc, %rcx, %r12
  30b157:      	shrq	$0x1a, %rcx
  30b15b:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  30b161:      	movq	%rcx, 0x8(%rsp)
  30b166:      	andl	$0x3ffffff, %r12d       # imm = 0x3FFFFFF
  30b16d:      	movq	%r12, 0x10(%rsp)
  30b172:      	movq	%rsi, %rcx
  30b175:      	movq	0x240(%rsp), %rsi
  30b17d:      	shldq	$0x18, %rcx, %rsi
  30b182:      	shrq	$0xe, %rcx
  30b186:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  30b18c:      	movq	%rcx, 0x18(%rsp)
  30b191:      	movq	%rsi, 0x20(%rsp)
  30b196:      	vpinsrq	$0x1, %r11, %xmm4, %xmm4
  30b19c:      	movl	%r9d, %r11d
  30b19f:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
  30b1a6:      	vmovq	%r11, %xmm5
  30b1ab:      	movq	%r15, %r11
  30b1ae:      	movq	0xc0(%rsp), %rcx
  30b1b6:      	shldq	$0xc, %rcx, %r11
  30b1bb:      	shrq	$0x1a, %rcx
  30b1bf:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  30b1c5:      	vpinsrq	$0x1, %rcx, %xmm3, %xmm3
  30b1cb:      	movq	0x2a0(%rsp), %rcx
  30b1d3:      	movl	%ecx, %r12d
  30b1d6:      	andl	$0x3ffffff, %r12d       # imm = 0x3FFFFFF
  30b1dd:      	vmovq	%r12, %xmm8
  30b1e2:      	movq	%r14, %r12
  30b1e5:      	shldq	$0xc, %r9, %r12
  30b1ea:      	shrq	$0x1a, %r9
  30b1ee:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
  30b1f5:      	vmovq	%r9, %xmm6
  30b1fa:      	movq	0x2c0(%rsp), %rsi
  30b202:      	movq	%rsi, %r9
  30b205:      	shldq	$0xc, %rcx, %r9
  30b20a:      	shrq	$0x1a, %rcx
  30b20e:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
  30b214:      	vmovq	%rcx, %xmm10
  30b219:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
  30b220:      	vpinsrq	$0x1, %r11, %xmm2, %xmm7
  30b226:      	andl	$0x3ffffff, %r12d       # imm = 0x3FFFFFF
  30b22d:      	vmovq	%r12, %xmm9
  30b232:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
  30b239:      	vmovq	%r9, %xmm2
  30b23e:      	movq	0xe0(%rsp), %r9
  30b246:      	shldq	$0x18, %r15, %r9
  30b24b:      	shrq	$0xe, %r15
  30b24f:      	andl	$0x3ffffff, %r15d       # imm = 0x3FFFFFF
  30b256:      	vpinsrq	$0x1, %r15, %xmm1, %xmm1
  30b25c:      	shldq	$0x18, %r14, %rbx
  30b261:      	shrq	$0xe, %r14
  30b265:      	andl	$0x3ffffff, %r14d       # imm = 0x3FFFFFF
  30b26c:      	vpbroadcastq	%xmm5, %ymm5
  30b271:      	vpblendd	$0x30, %ymm5, %ymm4, %ymm4 # ymm4 = ymm4[0,1,2,3],ymm5[4,5],ymm4[6,7]
  30b277:      	vmovq	%r14, %xmm5
  30b27c:      	movq	0x2e0(%rsp), %rcx
  30b284:      	shldq	$0x18, %rsi, %rcx
  30b289:      	shrq	$0xe, %rsi
  30b28d:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  30b293:      	vpbroadcastq	%xmm8, %ymm8
  30b298:      	vpblendd	$0xc0, %ymm8, %ymm4, %ymm4 # ymm4 = ymm4[0,1,2,3,4,5],ymm8[6,7]
  30b29e:      	vmovdqa	%ymm4, 0x540(%rsp)
  30b2a7:      	vmovq	%rsi, %xmm4
  30b2ac:      	vpinsrq	$0x1, %r9, %xmm0, %xmm0
  30b2b2:      	vpbroadcastq	%xmm6, %ymm6
  30b2b7:      	vpblendd	$0x30, %ymm6, %ymm3, %ymm3 # ymm3 = ymm3[0,1,2,3],ymm6[4,5],ymm3[6,7]
  30b2bd:      	vmovq	%rbx, %xmm6
  30b2c2:      	vpbroadcastq	%xmm10, %ymm8
  30b2c7:      	vpblendd	$0xc0, %ymm8, %ymm3, %ymm10 # ymm10 = ymm3[0,1,2,3,4,5],ymm8[6,7]
  30b2cd:      	vmovq	%rcx, %xmm3
  30b2d2:      	movq	0x1a0(%rsp), %r11
  30b2da:      	movl	%r11d, %esi
  30b2dd:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  30b2e3:      	movq	%rsi, 0x28(%rsp)
  30b2e8:      	vpbroadcastq	%xmm9, %ymm8
  30b2ed:      	vpblendd	$0x30, %ymm8, %ymm7, %ymm7 # ymm7 = ymm7[0,1,2,3],ymm8[4,5],ymm7[6,7]
  30b2f3:      	vmovdqu	(%rsp), %xmm8
  30b2f8:      	vpinsrq	$0x1, %rsi, %xmm8, %xmm8
  30b2fe:      	vpbroadcastq	%xmm2, %ymm2
  30b303:      	vpblendd	$0xc0, %ymm2, %ymm7, %ymm7 # ymm7 = ymm7[0,1,2,3,4,5],ymm2[6,7]
  30b309:      	movq	0x1c0(%rsp), %r12
  30b311:      	movl	%r12d, %esi
  30b314:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  30b31a:      	vmovq	%rsi, %xmm2
  30b31f:      	movq	0x140(%rsp), %rbx
  30b327:      	movq	%rbx, %r9
  30b32a:      	shldq	$0xc, %r11, %r9
  30b32f:      	vpbroadcastq	%xmm5, %ymm5
  30b334:      	vpblendd	$0x30, %ymm5, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm5[4,5],ymm1[6,7]
  30b33a:      	movq	0x280(%rsp), %r15
  30b342:      	movl	%r15d, %esi
  30b345:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  30b34b:      	vmovq	%rsi, %xmm5
  30b350:      	movq	%r11, %rsi
  30b353:      	shrq	$0x1a, %rsi
  30b357:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  30b35d:      	vpbroadcastq	%xmm4, %ymm4
  30b362:      	vpblendd	$0xc0, %ymm4, %ymm1, %ymm9 # ymm9 = ymm1[0,1,2,3,4,5],ymm4[6,7]
  30b368:      	vmovdqu	0x8(%rsp), %xmm1
  30b36e:      	vpinsrq	$0x1, %rsi, %xmm1, %xmm1
  30b374:      	vpbroadcastq	%xmm6, %ymm4
  30b379:      	movq	0x1e0(%rsp), %r14
  30b381:      	movq	%r14, %rsi
  30b384:      	movq	%r12, %r11
  30b387:      	shldq	$0xc, %r12, %rsi
  30b38c:      	vpblendd	$0x30, %ymm4, %ymm0, %ymm4 # ymm4 = ymm0[0,1,2,3],ymm4[4,5],ymm0[6,7]
  30b392:      	shrq	$0x1a, %r11
  30b396:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
  30b39d:      	vmovq	%r11, %xmm0
  30b3a2:      	vpbroadcastq	%xmm3, %ymm3
  30b3a7:      	movq	0x40(%rsp), %r12
  30b3ac:      	movq	%r12, %r11
  30b3af:      	shldq	$0xc, %r15, %r11
  30b3b4:      	vpblendd	$0xc0, %ymm3, %ymm4, %ymm6 # ymm6 = ymm4[0,1,2,3,4,5],ymm3[6,7]
  30b3ba:      	shrq	$0x1a, %r15
  30b3be:      	andl	$0x3ffffff, %r15d       # imm = 0x3FFFFFF
  30b3c5:      	vmovq	%r15, %xmm3
  30b3ca:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
  30b3d1:      	vpbroadcastq	%xmm2, %ymm2
  30b3d6:      	vpblendd	$0x30, %ymm2, %ymm8, %ymm2 # ymm2 = ymm8[0,1,2,3],ymm2[4,5],ymm8[6,7]
  30b3dc:      	vmovdqu	0x10(%rsp), %xmm4
  30b3e2:      	vpinsrq	$0x1, %r9, %xmm4, %xmm4
  30b3e8:      	vpbroadcastq	%xmm5, %ymm5
  30b3ed:      	vpblendd	$0xc0, %ymm5, %ymm2, %ymm2 # ymm2 = ymm2[0,1,2,3,4,5],ymm5[6,7]
  30b3f3:      	vmovdqa	%ymm2, 0x500(%rsp)
  30b3fc:      	vmovdqu	0x18(%rsp), %xmm2
  30b402:      	movq	%rbx, %r9
  30b405:      	movq	0x100(%rsp), %rbx
  30b40d:      	shldq	$0x18, %r9, %rbx
  30b412:      	shrq	$0xe, %r9
  30b416:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
  30b41d:      	vpinsrq	$0x1, %r9, %xmm2, %xmm2
  30b423:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  30b429:      	movq	%r14, %r9
  30b42c:      	movq	0x200(%rsp), %r14
  30b434:      	shldq	$0x18, %r9, %r14
  30b439:      	vpbroadcastq	%xmm0, %ymm0
  30b43e:      	vpblendd	$0x30, %ymm0, %ymm1, %ymm0 # ymm0 = ymm1[0,1,2,3],ymm0[4,5],ymm1[6,7]
  30b444:      	vmovq	%rsi, %xmm1
  30b449:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
  30b450:      	vpbroadcastq	%xmm3, %ymm3
  30b455:      	vpblendd	$0xc0, %ymm3, %ymm0, %ymm5 # ymm5 = ymm0[0,1,2,3,4,5],ymm3[6,7]
  30b45b:      	vmovq	%r11, %xmm0
  30b460:      	movq	0x130(%rsp), %r11
  30b468:      	shrq	$0xe, %r9
  30b46c:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
  30b473:      	vpbroadcastq	%xmm1, %ymm1
  30b478:      	vpblendd	$0x30, %ymm1, %ymm4, %ymm1 # ymm1 = ymm4[0,1,2,3],ymm1[4,5],ymm4[6,7]
  30b47e:      	vmovq	%r9, %xmm3
  30b483:      	vpbroadcastq	%xmm0, %ymm0
  30b488:      	vpblendd	$0xc0, %ymm0, %ymm1, %ymm4 # ymm4 = ymm1[0,1,2,3,4,5],ymm0[6,7]
  30b48e:      	vmovdqu	0x20(%rsp), %xmm0
  30b494:      	vpinsrq	$0x1, %rbx, %xmm0, %xmm0
  30b49a:      	movq	%r12, %r9
  30b49d:      	movq	%r12, %rsi
  30b4a0:      	shrq	$0xe, %rsi
  30b4a4:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
  30b4aa:      	vpbroadcastq	%xmm3, %ymm1
  30b4af:      	vpblendd	$0x30, %ymm1, %ymm2, %ymm1 # ymm1 = ymm2[0,1,2,3],ymm1[4,5],ymm2[6,7]
  30b4b5:      	vmovq	%rsi, %xmm2
  30b4ba:      	vpbroadcastq	%xmm2, %ymm2
  30b4bf:      	vpblendd	$0xc0, %ymm2, %ymm1, %ymm2 # ymm2 = ymm1[0,1,2,3,4,5],ymm2[6,7]
  30b4c5:      	vmovq	%r14, %xmm1
  30b4ca:      	decq	%r10
  30b4cd:      	shrq	$0x28, %r9
  30b4d1:      	vpbroadcastq	%xmm1, %ymm1
  30b4d6:      	vpblendd	$0x30, %ymm1, %ymm0, %ymm0 # ymm0 = ymm0[0,1,2,3],ymm1[4,5],ymm0[6,7]
  30b4dc:      	vmovq	%r9, %xmm1
  30b4e1:      	movq	%r10, %rsi
  30b4e4:      	shlq	$0x7, %rsi
  30b4e8:      	addq	%r8, %rsi
  30b4eb:      	vpbroadcastq	%xmm1, %ymm1
  30b4f0:      	vpblendd	$0xc0, %ymm1, %ymm0, %ymm1 # ymm1 = ymm0[0,1,2,3,4,5],ymm1[6,7]
  30b4f6:      	vpsllq	$0x2, %ymm10, %ymm0
  30b4fc:      	vmovdqa	%ymm10, 0x520(%rsp)
  30b505:      	vpaddq	%ymm0, %ymm10, %ymm0
  30b509:      	vmovdqa	%ymm0, 0x320(%rsp)
  30b512:      	vpsllq	$0x2, %ymm7, %ymm0
  30b517:      	vmovdqa	%ymm7, 0x4a0(%rsp)
  30b520:      	vpaddq	%ymm7, %ymm0, %ymm0
  30b524:      	vmovdqa	%ymm0, 0x340(%rsp)
  30b52d:      	vpsllq	$0x2, %ymm9, %ymm0
  30b533:      	vmovdqa	%ymm9, 0x440(%rsp)
  30b53c:      	vpaddq	%ymm0, %ymm9, %ymm0
  30b540:      	vmovdqa	%ymm0, 0x360(%rsp)
  30b549:      	vpsllq	$0x2, %ymm6, %ymm0
  30b54e:      	vmovdqa	%ymm6, 0x420(%rsp)
  30b557:      	vpaddq	%ymm6, %ymm0, %ymm0
  30b55b:      	vmovdqa	%ymm0, 0x380(%rsp)
  30b564:      	vpsllq	$0x2, %ymm5, %ymm0
  30b569:      	vmovdqa	%ymm5, 0x4e0(%rsp)
  30b572:      	vpaddq	%ymm5, %ymm0, %ymm0
  30b576:      	vmovdqa	%ymm0, 0x3a0(%rsp)
  30b57f:      	vpsllq	$0x2, %ymm4, %ymm0
  30b584:      	vmovdqa	%ymm4, 0x4c0(%rsp)
  30b58d:      	vpaddq	%ymm4, %ymm0, %ymm0
  30b591:      	vmovdqa	%ymm0, 0x3c0(%rsp)
  30b59a:      	vpsllq	$0x2, %ymm2, %ymm0
  30b59f:      	vmovdqa	%ymm2, 0x480(%rsp)
  30b5a8:      	vpaddq	%ymm2, %ymm0, %ymm0
  30b5ac:      	vmovdqa	%ymm0, 0x3e0(%rsp)
  30b5b5:      	vpsllq	$0x2, %ymm1, %ymm0
  30b5ba:      	vmovdqa	%ymm1, 0x460(%rsp)
  30b5c3:      	vpaddq	%ymm1, %ymm0, %ymm0
  30b5c7:      	vmovdqa	%ymm0, 0x400(%rsp)
  30b5d0:      	vmovd	0xa0(%rsp), %xmm5
  30b5d9:      	vmovd	0x80(%rsp), %xmm11
  30b5e2:      	vmovd	0x180(%rsp), %xmm8
  30b5eb:      	vmovd	0x160(%rsp), %xmm6
  30b5f4:      	vmovq	0xd(%r11), %xmm10
  30b5fa:      	testq	%r10, %r10
  30b5fd:      	vmovdqa	%ymm6, 0xa0(%rsp)
  30b606:      	vmovdqa	%ymm8, 0x80(%rsp)
  30b60f:      	je	0x30bbb2 <toyos_crypto::arch::x86_64::poly1305::blocks+0xfa2>
  30b615:      	vpinsrq	$0x1, %rdx, %xmm15, %xmm0
  30b61b:      	vmovq	%rdx, %xmm1
  30b620:      	vpbroadcastq	%xmm1, %ymm1
  30b625:      	vpblendd	$0xf0, %ymm1, %ymm0, %ymm1 # ymm1 = ymm0[0,1,2,3],ymm1[4,5,6,7]
  30b62b:      	vpsllq	$0x2, %ymm1, %ymm0
  30b630:      	vmovdqa	%ymm1, 0x180(%rsp)
  30b639:      	vpaddq	%ymm1, %ymm0, %ymm0
  30b63d:      	vmovdqa	%ymm0, 0x260(%rsp)
  30b646:      	vpinsrq	$0x1, %r13, %xmm14, %xmm0
  30b64c:      	vmovq	%r13, %xmm1
  30b651:      	vpbroadcastq	%xmm1, %ymm1
  30b656:      	vpblendd	$0xf0, %ymm1, %ymm0, %ymm2 # ymm2 = ymm0[0,1,2,3],ymm1[4,5,6,7]
  30b65c:      	vpsllq	$0x2, %ymm2, %ymm0
  30b661:      	vpinsrq	$0x1, %rdi, %xmm13, %xmm1
  30b667:      	vmovdqa	%ymm2, 0x160(%rsp)
  30b670:      	vpaddq	%ymm2, %ymm0, %ymm0
  30b674:      	vmovdqa	%ymm0, 0x140(%rsp)
  30b67d:      	vmovq	%rdi, %xmm0
  30b682:      	vpbroadcastq	%xmm0, %ymm0
  30b687:      	vpblendd	$0xf0, %ymm0, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm0[4,5,6,7]
  30b68d:      	vpsllq	$0x2, %ymm1, %ymm0
  30b692:      	vmovdqa	%ymm1, 0x200(%rsp)
  30b69b:      	vpaddq	%ymm1, %ymm0, %ymm0
  30b69f:      	vmovdqa	%ymm0, 0x1e0(%rsp)
  30b6a8:      	vpinsrq	$0x1, %rax, %xmm12, %xmm0
  30b6ae:      	vmovq	%rax, %xmm3
  30b6b3:      	vpbroadcastq	%xmm3, %ymm3
  30b6b8:      	vpblendd	$0xf0, %ymm3, %ymm0, %ymm1 # ymm1 = ymm0[0,1,2,3],ymm3[4,5,6,7]
  30b6be:      	vpsllq	$0x2, %ymm1, %ymm0
  30b6c3:      	vmovdqa	%ymm1, 0x240(%rsp)
  30b6cc:      	vpaddq	%ymm1, %ymm0, %ymm0
  30b6d0:      	vmovdqa	%ymm0, 0x1c0(%rsp)
  30b6d9:      	movq	0x60(%rsp), %rax
  30b6de:      	vmovdqa	0x300(%rsp), %ymm0
  30b6e7:      	vpinsrq	$0x1, %rax, %xmm0, %xmm0
  30b6ed:      	vmovq	%rax, %xmm4
  30b6f2:      	vpbroadcastq	%xmm4, %ymm4
  30b6f7:      	vpblendd	$0xf0, %ymm4, %ymm0, %ymm0 # ymm0 = ymm0[0,1,2,3],ymm4[4,5,6,7]
  30b6fd:      	vmovdqa	%ymm0, 0x220(%rsp)
  30b706:      	addq	$0x70, %r8
  30b70a:      	vpxor	%xmm0, %xmm0, %xmm0
  30b70e:      	vmovdqa	%ymm0, 0x60(%rsp)
  30b714:      	vpbroadcastq	-0x2606ed(%rip), %ymm9 # 0xab030 <sdallocx+0xab030>
  30b71d:      	vpbroadcastq	-0x260656(%rip), %ymm0 # 0xab0d0 <anon.8939df2432453ca20e81ebdf34edf285.4.llvm.12339943212417015884+0x8>
  30b726:      	vmovdqa	%ymm0, 0x1a0(%rsp)
  30b72f:      	vpxor	%xmm0, %xmm0, %xmm0
  30b733:      	vmovdqa	%ymm0, 0x100(%rsp)
  30b73c:      	vmovdqa	%ymm0, 0xc0(%rsp)
  30b745:      	vmovdqa	%ymm0, 0xe0(%rsp)
  30b74e:      	vmovdqa	%ymm0, 0x40(%rsp)
  30b754:      	vmovdqa	%ymm5, %ymm15
  30b758:      	vmovdqa	0x260(%rsp), %ymm7
  30b761:      	vmovdqa	0x240(%rsp), %ymm3
  30b76a:      	nopw	(%rax,%rax)
  30b770:      	vmovdqu	-0x70(%r8), %ymm0
  30b776:      	vmovdqu	-0x50(%r8), %ymm6
  30b77c:      	vmovdqu	-0x30(%r8), %ymm8
  30b782:      	vmovdqu	-0x10(%r8), %ymm14
  30b788:      	vpunpckhqdq	%ymm6, %ymm0, %ymm4 # ymm4 = ymm0[1],ymm6[1],ymm0[3],ymm6[3]
  30b78c:      	vpunpcklqdq	%ymm6, %ymm0, %ymm12 # ymm12 = ymm0[0],ymm6[0],ymm0[2],ymm6[2]
  30b790:      	vpsrlq	$0x34, %ymm12, %ymm0
  30b796:      	vpsllq	$0xc, %ymm4, %ymm6
  30b79b:      	vpor	%ymm0, %ymm6, %ymm13
  30b79f:      	vpunpcklqdq	%ymm14, %ymm8, %ymm6 # ymm6 = ymm8[0],ymm14[0],ymm8[2],ymm14[2]
  30b7a4:      	vpunpckhqdq	%ymm14, %ymm8, %ymm0 # ymm0 = ymm8[1],ymm14[1],ymm8[3],ymm14[3]
  30b7a9:      	vmovdqa	%ymm0, 0x280(%rsp)
  30b7b2:      	vpsrlq	$0x34, %ymm6, %ymm8
  30b7b7:      	vpsllq	$0xc, %ymm0, %ymm14
  30b7bc:      	vpor	%ymm8, %ymm14, %ymm1
  30b7c1:      	vmovdqa	%ymm1, 0x2a0(%rsp)
  30b7ca:      	vmovdqa	%ymm15, %ymm1
  30b7ce:      	vpsrlq	$0x1a, %ymm15, %ymm14
  30b7d4:      	vpaddq	%ymm11, %ymm14, %ymm14
  30b7d9:      	vmovdqa	0xa0(%rsp), %ymm2
  30b7e2:      	vpsrlq	$0x1a, %ymm2, %ymm11
  30b7e7:      	vpaddq	%ymm10, %ymm11, %ymm10
  30b7ec:      	vpsrlq	$0x1a, %ymm14, %ymm11
  30b7f2:      	vpaddq	0x80(%rsp), %ymm11, %ymm11
  30b7fb:      	vpsrlq	$0x28, %ymm4, %ymm15
  30b800:      	vpand	%ymm9, %ymm10, %ymm8
  30b805:      	vpaddq	%ymm15, %ymm8, %ymm8
  30b80a:      	vpsrlq	$0x1a, %ymm10, %ymm10
  30b810:      	vpsllq	$0x2, %ymm10, %ymm15
  30b816:      	vpaddq	%ymm10, %ymm15, %ymm10
  30b81b:      	vpand	%ymm1, %ymm9, %ymm15
  30b81f:      	vpaddq	%ymm10, %ymm15, %ymm15
  30b824:      	vpand	%ymm2, %ymm9, %ymm10
  30b828:      	vpsrlq	$0x1a, %ymm11, %ymm5
  30b82e:      	vpaddq	%ymm5, %ymm10, %ymm5
  30b832:      	vpsrlq	$0xe, %ymm4, %ymm4
  30b837:      	vpand	%ymm4, %ymm9, %ymm1
  30b83b:      	vpand	%ymm9, %ymm13, %ymm4
  30b840:      	vpand	%ymm9, %ymm14, %ymm10
  30b845:      	vpand	%ymm9, %ymm11, %ymm11
  30b84a:      	vpaddq	%ymm4, %ymm11, %ymm4
  30b84e:      	vpsrlq	$0x1a, %ymm15, %ymm11
  30b854:      	vpaddq	%ymm10, %ymm11, %ymm10
  30b859:      	vpsrlq	$0x1a, %ymm12, %ymm11
  30b85f:      	vpand	%ymm9, %ymm11, %ymm11
  30b864:      	vpand	%ymm9, %ymm12, %ymm12
  30b869:      	vpaddq	%ymm11, %ymm10, %ymm10
  30b86e:      	vpand	%ymm9, %ymm15, %ymm11
  30b873:      	vpaddq	%ymm11, %ymm12, %ymm14
  30b878:      	vpsrlq	$0x1a, %ymm5, %ymm11
  30b87d:      	vpaddq	%ymm11, %ymm8, %ymm8
  30b882:      	vpand	%ymm5, %ymm9, %ymm5
  30b886:      	vpaddq	%ymm5, %ymm1, %ymm13
  30b88a:      	vpaddq	0x1a0(%rsp), %ymm8, %ymm12
  30b893:      	vmovdqa	0x220(%rsp), %ymm2
  30b89c:      	vpmuludq	%ymm2, %ymm14, %ymm1
  30b8a0:      	vpmuludq	%ymm7, %ymm10, %ymm5
  30b8a4:      	vmovdqa	0x1e0(%rsp), %ymm15
  30b8ad:      	vpmuludq	%ymm15, %ymm13, %ymm8
  30b8b2:      	vpaddq	%ymm1, %ymm8, %ymm1
  30b8b6:      	vmovdqa	0x140(%rsp), %ymm0
  30b8bf:      	vpmuludq	%ymm0, %ymm4, %ymm8
  30b8c3:      	vpaddq	%ymm1, %ymm8, %ymm1
  30b8c7:      	vpmuludq	0x1c0(%rsp), %ymm12, %ymm8
  30b8d0:      	vpaddq	%ymm5, %ymm8, %ymm5
  30b8d4:      	vpaddq	%ymm5, %ymm1, %ymm1
  30b8d8:      	vmovdqa	%ymm1, 0x2e0(%rsp)
  30b8e1:      	vpmuludq	%ymm3, %ymm14, %ymm1
  30b8e5:      	vpmuludq	%ymm0, %ymm13, %ymm5
  30b8e9:      	vpaddq	%ymm5, %ymm1, %ymm1
  30b8ed:      	vpmuludq	%ymm7, %ymm4, %ymm5
  30b8f1:      	vpaddq	%ymm1, %ymm5, %ymm1
  30b8f5:      	vpmuludq	%ymm2, %ymm10, %ymm5
  30b8f9:      	vpmuludq	%ymm15, %ymm12, %ymm8
  30b8fe:      	vpaddq	%ymm5, %ymm8, %ymm5
  30b902:      	vpaddq	%ymm5, %ymm1, %ymm1
  30b906:      	vmovdqa	%ymm1, 0x2c0(%rsp)
  30b90f:      	vmovdqa	0x200(%rsp), %ymm11
  30b918:      	vpmuludq	%ymm11, %ymm14, %ymm1
  30b91d:      	vpmuludq	%ymm7, %ymm13, %ymm5
  30b921:      	vpaddq	%ymm5, %ymm1, %ymm1
  30b925:      	vpmuludq	%ymm2, %ymm4, %ymm5
  30b929:      	vpaddq	%ymm1, %ymm5, %ymm1
  30b92d:      	vpmuludq	%ymm3, %ymm10, %ymm5
  30b931:      	vpmuludq	%ymm0, %ymm12, %ymm8
  30b935:      	vpaddq	%ymm5, %ymm8, %ymm5
  30b939:      	vpaddq	%ymm5, %ymm1, %ymm1
  30b93d:      	vmovdqa	%ymm1, 0x80(%rsp)
  30b946:      	vmovdqa	0x160(%rsp), %ymm15
  30b94f:      	vpmuludq	%ymm15, %ymm14, %ymm1
  30b954:      	vpmuludq	%ymm2, %ymm13, %ymm5
  30b958:      	vpaddq	%ymm5, %ymm1, %ymm1
  30b95c:      	vpmuludq	%ymm3, %ymm4, %ymm5
  30b960:      	vpaddq	%ymm1, %ymm5, %ymm1
  30b964:      	vpmuludq	%ymm11, %ymm10, %ymm5
  30b969:      	vpmuludq	%ymm7, %ymm12, %ymm8
  30b96d:      	vpaddq	%ymm5, %ymm8, %ymm5
  30b971:      	vpaddq	%ymm5, %ymm1, %ymm1
  30b975:      	vmovdqa	%ymm1, 0xa0(%rsp)
  30b97e:      	vpmuludq	0x180(%rsp), %ymm14, %ymm1
  30b987:      	vpmuludq	%ymm3, %ymm13, %ymm5
  30b98b:      	vpaddq	%ymm5, %ymm1, %ymm1
  30b98f:      	vpmuludq	%ymm4, %ymm11, %ymm4
  30b993:      	vpaddq	%ymm1, %ymm4, %ymm1
  30b997:      	vpand	%ymm6, %ymm9, %ymm13
  30b99b:      	vpsrlq	$0x1a, %ymm6, %ymm0
  30b9a0:      	vpand	%ymm0, %ymm9, %ymm4
  30b9a4:      	vpand	0x2a0(%rsp), %ymm9, %ymm0
  30b9ad:      	vpmuludq	%ymm15, %ymm10, %ymm5
  30b9b2:      	vpmuludq	%ymm2, %ymm12, %ymm8
  30b9b6:      	vpaddq	%ymm5, %ymm8, %ymm5
  30b9ba:      	vmovdqa	0x280(%rsp), %ymm6
  30b9c3:      	vpsrlq	$0xe, %ymm6, %ymm8
  30b9c8:      	vpand	%ymm9, %ymm8, %ymm11
  30b9cd:      	vpsrlq	$0x28, %ymm6, %ymm6
  30b9d2:      	vpaddq	%ymm5, %ymm1, %ymm10
  30b9d6:      	vmovdqa	0x40(%rsp), %ymm5
  30b9dc:      	vpsrlq	$0x1a, %ymm5, %ymm1
  30b9e1:      	vpaddq	0xe0(%rsp), %ymm1, %ymm1
  30b9ea:      	vpand	%ymm5, %ymm9, %ymm5
  30b9ee:      	vmovdqa	0x100(%rsp), %ymm12
  30b9f7:      	vpsrlq	$0x1a, %ymm12, %ymm8
  30b9fd:      	vpaddq	0x60(%rsp), %ymm8, %ymm8
  30ba03:      	vpand	%ymm9, %ymm12, %ymm12
  30ba08:      	vpsrlq	$0x1a, %ymm1, %ymm14
  30ba0d:      	vpaddq	0xc0(%rsp), %ymm14, %ymm14
  30ba16:      	vpand	%ymm1, %ymm9, %ymm1
  30ba1a:      	vpsrlq	$0x1a, %ymm8, %ymm15
  30ba20:      	vpand	%ymm9, %ymm8, %ymm8
  30ba25:      	vpaddq	%ymm6, %ymm8, %ymm6
  30ba29:      	vpsllq	$0x2, %ymm15, %ymm8
  30ba2f:      	vpaddq	%ymm15, %ymm8, %ymm8
  30ba34:      	vpaddq	%ymm5, %ymm8, %ymm5
  30ba38:      	vpsrlq	$0x1a, %ymm14, %ymm8
  30ba3e:      	vpaddq	%ymm12, %ymm8, %ymm12
  30ba43:      	vpand	%ymm9, %ymm14, %ymm8
  30ba48:      	vpaddq	%ymm0, %ymm8, %ymm0
  30ba4c:      	vpsrlq	$0x1a, %ymm5, %ymm8
  30ba51:      	vpaddq	%ymm1, %ymm8, %ymm1
  30ba55:      	vpaddq	%ymm4, %ymm1, %ymm4
  30ba59:      	vpand	%ymm5, %ymm9, %ymm1
  30ba5d:      	vpaddq	%ymm1, %ymm13, %ymm8
  30ba61:      	vpsrlq	$0x1a, %ymm12, %ymm1
  30ba67:      	vpaddq	%ymm1, %ymm6, %ymm1
  30ba6b:      	vpand	%ymm9, %ymm12, %ymm5
  30ba70:      	vpaddq	%ymm5, %ymm11, %ymm12
  30ba74:      	vpaddq	0x1a0(%rsp), %ymm1, %ymm6
  30ba7d:      	vpmuludq	%ymm2, %ymm8, %ymm1
  30ba81:      	vpmuludq	%ymm7, %ymm4, %ymm5
  30ba85:      	vmovdqa	0x140(%rsp), %ymm15
  30ba8e:      	vpmuludq	%ymm0, %ymm15, %ymm11
  30ba92:      	vmovdqa	0x1e0(%rsp), %ymm14
  30ba9b:      	vpmuludq	%ymm14, %ymm12, %ymm13
  30baa0:      	vpaddq	%ymm1, %ymm13, %ymm1
  30baa4:      	vpaddq	%ymm1, %ymm11, %ymm1
  30baa8:      	vpmuludq	0x1c0(%rsp), %ymm6, %ymm11
  30bab1:      	vpaddq	%ymm5, %ymm11, %ymm5
  30bab5:      	vpaddq	%ymm5, %ymm1, %ymm1
  30bab9:      	vmovdqa	%ymm1, 0x40(%rsp)
  30babf:      	vpmuludq	%ymm3, %ymm8, %ymm1
  30bac3:      	vpmuludq	%ymm2, %ymm4, %ymm5
  30bac7:      	vpmuludq	%ymm7, %ymm0, %ymm11
  30bacb:      	vpmuludq	%ymm15, %ymm12, %ymm13
  30bad0:      	vpaddq	%ymm1, %ymm13, %ymm1
  30bad4:      	vpaddq	%ymm1, %ymm11, %ymm1
  30bad8:      	vpmuludq	%ymm6, %ymm14, %ymm11
  30badc:      	vpaddq	%ymm5, %ymm11, %ymm5
  30bae0:      	vpaddq	%ymm5, %ymm1, %ymm1
  30bae4:      	vmovdqa	%ymm1, 0xe0(%rsp)
  30baed:      	vmovdqa	0x200(%rsp), %ymm14
  30baf6:      	vpmuludq	%ymm14, %ymm8, %ymm1
  30bafb:      	vpmuludq	%ymm3, %ymm4, %ymm5
  30baff:      	vpmuludq	%ymm2, %ymm0, %ymm11
  30bb03:      	vpmuludq	%ymm7, %ymm12, %ymm13
  30bb07:      	vpaddq	%ymm1, %ymm13, %ymm1
  30bb0b:      	vpaddq	%ymm1, %ymm11, %ymm1
  30bb0f:      	vpmuludq	%ymm6, %ymm15, %ymm11
  30bb13:      	vmovdqa	0x2e0(%rsp), %ymm15
  30bb1c:      	vpaddq	%ymm5, %ymm11, %ymm5
  30bb20:      	vpaddq	%ymm5, %ymm1, %ymm1
  30bb24:      	vmovdqa	%ymm1, 0xc0(%rsp)
  30bb2d:      	vmovdqa	0x160(%rsp), %ymm13
  30bb36:      	vpmuludq	%ymm13, %ymm8, %ymm1
  30bb3b:      	vpmuludq	%ymm4, %ymm14, %ymm5
  30bb3f:      	vpmuludq	%ymm2, %ymm12, %ymm11
  30bb43:      	vpaddq	%ymm1, %ymm11, %ymm1
  30bb47:      	vpmuludq	%ymm3, %ymm0, %ymm11
  30bb4b:      	vpaddq	%ymm1, %ymm11, %ymm1
  30bb4f:      	vpmuludq	%ymm7, %ymm6, %ymm11
  30bb53:      	vpaddq	%ymm5, %ymm11, %ymm5
  30bb57:      	vmovdqa	0x2c0(%rsp), %ymm11
  30bb60:      	vpaddq	%ymm5, %ymm1, %ymm1
  30bb64:      	vmovdqa	%ymm1, 0x100(%rsp)
  30bb6d:      	vpmuludq	0x180(%rsp), %ymm8, %ymm1
  30bb76:      	vpmuludq	%ymm3, %ymm12, %ymm5
  30bb7a:      	vpaddq	%ymm5, %ymm1, %ymm1
  30bb7e:      	vpmuludq	%ymm0, %ymm14, %ymm0
  30bb82:      	vpaddq	%ymm1, %ymm0, %ymm0
  30bb86:      	vpmuludq	%ymm4, %ymm13, %ymm1
  30bb8a:      	vpmuludq	%ymm2, %ymm6, %ymm4
  30bb8e:      	vpaddq	%ymm1, %ymm4, %ymm1
  30bb92:      	vpaddq	%ymm1, %ymm0, %ymm0
  30bb96:      	vmovdqa	%ymm0, 0x60(%rsp)
  30bb9c:      	subq	$-0x80, %r8
  30bba0:      	decq	%r10
  30bba3:      	jne	0x30b770 <toyos_crypto::arch::x86_64::poly1305::blocks+0xb60>
  30bba9:      	jmp	0x30bbe1 <toyos_crypto::arch::x86_64::poly1305::blocks+0xfd1>
  30bbab:      	xorl	%eax, %eax
  30bbad:      	jmp	0x30c21c <toyos_crypto::arch::x86_64::poly1305::blocks+0x160c>
  30bbb2:      	vpxor	%xmm0, %xmm0, %xmm0
  30bbb6:      	vmovdqa	%ymm0, 0xe0(%rsp)
  30bbbf:      	vmovdqa	%ymm0, 0xc0(%rsp)
  30bbc8:      	vmovdqa	%ymm0, 0x100(%rsp)
  30bbd1:      	vmovdqa	%ymm0, 0x60(%rsp)
  30bbd7:      	vmovdqa	%ymm0, 0x40(%rsp)
  30bbdd:      	vmovdqa	%ymm5, %ymm15
  30bbe1:      	vmovdqu	(%rsi), %ymm0
  30bbe5:      	vmovdqu	0x20(%rsi), %ymm1
  30bbea:      	vpunpckhqdq	%ymm1, %ymm0, %ymm3 # ymm3 = ymm0[1],ymm1[1],ymm0[3],ymm1[3]
  30bbee:      	vpunpcklqdq	%ymm1, %ymm0, %ymm5 # ymm5 = ymm0[0],ymm1[0],ymm0[2],ymm1[2]
  30bbf2:      	vpsrlq	$0x34, %ymm5, %ymm0
  30bbf7:      	vpsllq	$0xc, %ymm3, %ymm1
  30bbfc:      	vpor	%ymm0, %ymm1, %ymm6
  30bc00:      	vmovdqu	0x40(%rsi), %ymm0
  30bc05:      	vmovdqu	0x60(%rsi), %ymm1
  30bc0a:      	vpunpcklqdq	%ymm1, %ymm0, %ymm2 # ymm2 = ymm0[0],ymm1[0],ymm0[2],ymm1[2]
  30bc0e:      	vpunpckhqdq	%ymm1, %ymm0, %ymm1 # ymm1 = ymm0[1],ymm1[1],ymm0[3],ymm1[3]
  30bc12:      	vmovdqa	%ymm1, 0x160(%rsp)
  30bc1b:      	vpsrlq	$0x34, %ymm2, %ymm0
  30bc20:      	vpsllq	$0xc, %ymm1, %ymm4
  30bc25:      	vpor	%ymm0, %ymm4, %ymm4
  30bc29:      	vpsrlq	$0x1a, %ymm15, %ymm0
  30bc2f:      	vpaddq	%ymm0, %ymm11, %ymm7
  30bc33:      	vmovdqa	0xa0(%rsp), %ymm14
  30bc3c:      	vpsrlq	$0x1a, %ymm14, %ymm0
  30bc42:      	vpaddq	%ymm0, %ymm10, %ymm8
  30bc46:      	vpsrlq	$0x1a, %ymm7, %ymm0
  30bc4b:      	vpaddq	0x80(%rsp), %ymm0, %ymm9
  30bc54:      	vpbroadcastq	-0x260c2d(%rip), %ymm0 # 0xab030 <sdallocx+0xab030>
  30bc5d:      	vpsrlq	$0x1a, %ymm5, %ymm10
  30bc62:      	vpand	%ymm0, %ymm10, %ymm10
  30bc66:      	vpand	%ymm0, %ymm7, %ymm7
  30bc6a:      	vpaddq	%ymm7, %ymm10, %ymm7
  30bc6e:      	vpsrlq	$0x28, %ymm3, %ymm10
  30bc73:      	vpand	%ymm0, %ymm8, %ymm12
  30bc77:      	vpaddq	%ymm10, %ymm12, %ymm13
  30bc7c:      	vpand	%ymm0, %ymm15, %ymm10
  30bc80:      	vpsrlq	$0x1a, %ymm8, %ymm8
  30bc86:      	vpaddq	%ymm8, %ymm10, %ymm10
  30bc8b:      	vpsllq	$0x2, %ymm8, %ymm8
  30bc91:      	vpaddq	%ymm8, %ymm10, %ymm11
  30bc96:      	vpand	%ymm0, %ymm14, %ymm8
  30bc9a:      	vpsrlq	$0x1a, %ymm9, %ymm10
  30bca0:      	vpaddq	%ymm8, %ymm10, %ymm14
  30bca5:      	vpand	%ymm0, %ymm6, %ymm6
  30bca9:      	vpand	%ymm0, %ymm9, %ymm8
  30bcad:      	vpaddq	%ymm6, %ymm8, %ymm8
  30bcb1:      	vpsrlq	$0x1a, %ymm11, %ymm6
  30bcb7:      	vpaddq	%ymm7, %ymm6, %ymm10
  30bcbb:      	vpand	%ymm0, %ymm5, %ymm5
  30bcbf:      	vpand	%ymm0, %ymm11, %ymm6
  30bcc3:      	vpaddq	%ymm6, %ymm5, %ymm11
  30bcc7:      	vpsrlq	$0xe, %ymm3, %ymm3
  30bccc:      	vpand	%ymm0, %ymm3, %ymm3
  30bcd0:      	vpand	%ymm0, %ymm14, %ymm5
  30bcd4:      	vpaddq	%ymm5, %ymm3, %ymm12
  30bcd8:      	vpsrlq	$0x1a, %ymm14, %ymm3
  30bcde:      	vpbroadcastq	-0x260c17(%rip), %ymm9 # 0xab0d0 <anon.8939df2432453ca20e81ebdf34edf285.4.llvm.12339943212417015884+0x8>
  30bce7:      	vpaddq	%ymm9, %ymm13, %ymm5
  30bcec:      	vpaddq	%ymm3, %ymm5, %ymm13
  30bcf0:      	vmovdqa	0x540(%rsp), %ymm1
  30bcf9:      	vpmuludq	%ymm1, %ymm11, %ymm3
  30bcfd:      	vmovdqa	0x360(%rsp), %ymm14
  30bd06:      	vpmuludq	%ymm14, %ymm8, %ymm5
  30bd0b:      	vpaddq	%ymm3, %ymm5, %ymm3
  30bd0f:      	vmovdqa	0x340(%rsp), %ymm7
  30bd18:      	vpmuludq	%ymm7, %ymm12, %ymm5
  30bd1c:      	vpaddq	%ymm5, %ymm3, %ymm3
  30bd20:      	vpmuludq	0x320(%rsp), %ymm13, %ymm5
  30bd29:      	vmovdqa	0x380(%rsp), %ymm15
  30bd32:      	vpmuludq	%ymm15, %ymm10, %ymm6
  30bd37:      	vpaddq	%ymm6, %ymm5, %ymm5
  30bd3b:      	vpaddq	%ymm5, %ymm3, %ymm3
  30bd3f:      	vmovdqa	%ymm3, 0xa0(%rsp)
  30bd48:      	vmovdqa	0x520(%rsp), %ymm3
  30bd51:      	vpmuludq	%ymm3, %ymm11, %ymm5
  30bd55:      	vpmuludq	%ymm15, %ymm8, %ymm6
  30bd5a:      	vpaddq	%ymm5, %ymm6, %ymm5
  30bd5e:      	vpmuludq	%ymm14, %ymm12, %ymm6
  30bd63:      	vpaddq	%ymm6, %ymm5, %ymm5
  30bd67:      	vpmuludq	%ymm7, %ymm13, %ymm6
  30bd6b:      	vpmuludq	%ymm1, %ymm10, %ymm7
  30bd6f:      	vpaddq	%ymm7, %ymm6, %ymm6
  30bd73:      	vpaddq	%ymm6, %ymm5, %ymm5
  30bd77:      	vmovdqa	%ymm5, 0x80(%rsp)
  30bd80:      	vmovdqa	0x4a0(%rsp), %ymm5
  30bd89:      	vpmuludq	%ymm5, %ymm11, %ymm6
  30bd8d:      	vpmuludq	%ymm1, %ymm8, %ymm7
  30bd91:      	vpaddq	%ymm6, %ymm7, %ymm6
  30bd95:      	vpmuludq	%ymm15, %ymm12, %ymm7
  30bd9a:      	vpaddq	%ymm7, %ymm6, %ymm6
  30bd9e:      	vpmuludq	%ymm14, %ymm13, %ymm7
  30bda3:      	vpmuludq	%ymm3, %ymm10, %ymm14
  30bda7:      	vpaddq	%ymm7, %ymm14, %ymm7
  30bdab:      	vpaddq	%ymm7, %ymm6, %ymm6
  30bdaf:      	vmovdqa	%ymm6, 0x180(%rsp)
  30bdb8:      	vmovdqa	0x440(%rsp), %ymm7
  30bdc1:      	vpmuludq	%ymm7, %ymm11, %ymm6
  30bdc5:      	vpmuludq	%ymm3, %ymm8, %ymm14
  30bdc9:      	vpaddq	%ymm6, %ymm14, %ymm6
  30bdcd:      	vpmuludq	%ymm1, %ymm12, %ymm14
  30bdd1:      	vpaddq	%ymm6, %ymm14, %ymm6
  30bdd5:      	vpmuludq	%ymm15, %ymm13, %ymm14
  30bdda:      	vpmuludq	%ymm5, %ymm10, %ymm15
  30bdde:      	vpaddq	%ymm15, %ymm14, %ymm14
  30bde3:      	vpaddq	%ymm6, %ymm14, %ymm6
  30bde7:      	vmovdqa	%ymm6, 0x140(%rsp)
  30bdf0:      	vpmuludq	0x420(%rsp), %ymm11, %ymm11
  30bdf9:      	vpmuludq	%ymm7, %ymm10, %ymm10
  30bdfd:      	vpmuludq	%ymm5, %ymm8, %ymm8
  30be01:      	vpaddq	%ymm11, %ymm8, %ymm8
  30be06:      	vpmuludq	%ymm3, %ymm12, %ymm11
  30be0a:      	vpaddq	%ymm11, %ymm8, %ymm8
  30be0f:      	vpmuludq	%ymm1, %ymm13, %ymm11
  30be13:      	vpaddq	%ymm10, %ymm11, %ymm10
  30be18:      	vpaddq	%ymm10, %ymm8, %ymm8
  30be1d:      	vmovdqa	0x40(%rsp), %ymm1
  30be23:      	vpsrlq	$0x1a, %ymm1, %ymm10
  30be28:      	vpaddq	0xe0(%rsp), %ymm10, %ymm10
  30be31:      	vmovdqa	0x100(%rsp), %ymm3
  30be3a:      	vpsrlq	$0x1a, %ymm3, %ymm11
  30be3f:      	vpaddq	0x60(%rsp), %ymm11, %ymm11
  30be45:      	vpsrlq	$0x1a, %ymm10, %ymm12
  30be4b:      	vpaddq	0xc0(%rsp), %ymm12, %ymm12
  30be54:      	vpsrlq	$0x1a, %ymm2, %ymm13
  30be59:      	vpand	%ymm0, %ymm13, %ymm13
  30be5d:      	vpand	%ymm0, %ymm10, %ymm10
  30be61:      	vpaddq	%ymm13, %ymm10, %ymm13
  30be66:      	vmovdqa	0x160(%rsp), %ymm5
  30be6f:      	vpsrlq	$0x28, %ymm5, %ymm10
  30be74:      	vpand	%ymm0, %ymm11, %ymm14
  30be78:      	vpaddq	%ymm10, %ymm14, %ymm14
  30be7d:      	vpand	%ymm0, %ymm1, %ymm10
  30be81:      	vpsrlq	$0x1a, %ymm11, %ymm11
  30be87:      	vpaddq	%ymm10, %ymm11, %ymm10
  30be8c:      	vpsllq	$0x2, %ymm11, %ymm11
  30be92:      	vpaddq	%ymm10, %ymm11, %ymm15
  30be97:      	vpand	%ymm0, %ymm3, %ymm10
  30be9b:      	vpsrlq	$0x1a, %ymm12, %ymm11
  30bea1:      	vpaddq	%ymm10, %ymm11, %ymm3
  30bea6:      	vpand	%ymm0, %ymm4, %ymm4
  30beaa:      	vpand	%ymm0, %ymm12, %ymm10
  30beae:      	vpaddq	%ymm4, %ymm10, %ymm10
  30beb2:      	vpsrlq	$0x1a, %ymm15, %ymm4
  30beb8:      	vpaddq	%ymm4, %ymm13, %ymm11
  30bebc:      	vpand	%ymm0, %ymm2, %ymm2
  30bec0:      	vpand	%ymm0, %ymm15, %ymm4
  30bec4:      	vpaddq	%ymm4, %ymm2, %ymm7
  30bec8:      	vpsrlq	$0xe, %ymm5, %ymm1
  30becd:      	vpand	%ymm0, %ymm1, %ymm1
  30bed1:      	vpand	%ymm0, %ymm3, %ymm4
  30bed5:      	vpaddq	%ymm4, %ymm1, %ymm6
  30bed9:      	vpaddq	%ymm9, %ymm14, %ymm4
  30bede:      	vpsrlq	$0x1a, %ymm3, %ymm3
  30bee3:      	vpaddq	%ymm3, %ymm4, %ymm12
  30bee7:      	vmovdqa	0x500(%rsp), %ymm5
  30bef0:      	vpmuludq	%ymm5, %ymm7, %ymm3
  30bef4:      	vmovdqa	0x3e0(%rsp), %ymm14
  30befd:      	vpmuludq	%ymm14, %ymm10, %ymm4
  30bf02:      	vpaddq	%ymm3, %ymm4, %ymm3
  30bf06:      	vmovdqa	0x3c0(%rsp), %ymm1
  30bf0f:      	vpmuludq	%ymm1, %ymm6, %ymm4
  30bf13:      	vpaddq	%ymm4, %ymm3, %ymm3
  30bf17:      	vpmuludq	0x3a0(%rsp), %ymm12, %ymm4
  30bf20:      	vmovdqa	0x400(%rsp), %ymm15
  30bf29:      	vpmuludq	%ymm15, %ymm11, %ymm9
  30bf2e:      	vpaddq	%ymm4, %ymm9, %ymm4
  30bf32:      	vpaddq	%ymm4, %ymm3, %ymm2
  30bf36:      	vmovdqa	%ymm2, 0x40(%rsp)
  30bf3c:      	vmovdqa	0x4e0(%rsp), %ymm2
  30bf45:      	vpmuludq	%ymm2, %ymm7, %ymm3
  30bf49:      	vpmuludq	%ymm15, %ymm10, %ymm9
  30bf4e:      	vpaddq	%ymm3, %ymm9, %ymm3
  30bf52:      	vpmuludq	%ymm6, %ymm14, %ymm9
  30bf56:      	vpaddq	%ymm3, %ymm9, %ymm3
  30bf5a:      	vpmuludq	%ymm1, %ymm12, %ymm9
  30bf5e:      	vpmuludq	%ymm5, %ymm11, %ymm13
  30bf62:      	vpaddq	%ymm13, %ymm9, %ymm9
  30bf67:      	vpaddq	%ymm3, %ymm9, %ymm9
  30bf6b:      	vmovdqa	0x4c0(%rsp), %ymm1
  30bf74:      	vpmuludq	%ymm1, %ymm7, %ymm3
  30bf78:      	vpmuludq	%ymm5, %ymm10, %ymm13
  30bf7c:      	vpaddq	%ymm3, %ymm13, %ymm3
  30bf80:      	vpmuludq	%ymm6, %ymm15, %ymm13
  30bf84:      	vpaddq	%ymm3, %ymm13, %ymm3
  30bf88:      	vpmuludq	%ymm14, %ymm12, %ymm13
  30bf8d:      	vpmuludq	%ymm2, %ymm11, %ymm14
  30bf91:      	vpaddq	%ymm14, %ymm13, %ymm13
  30bf96:      	vpaddq	%ymm3, %ymm13, %ymm13
  30bf9a:      	vmovdqa	0x480(%rsp), %ymm3
  30bfa3:      	vpmuludq	%ymm3, %ymm7, %ymm4
  30bfa7:      	vpmuludq	%ymm2, %ymm10, %ymm14
  30bfab:      	vpaddq	%ymm4, %ymm14, %ymm4
  30bfaf:      	vpmuludq	%ymm5, %ymm6, %ymm14
  30bfb3:      	vpaddq	%ymm4, %ymm14, %ymm4
  30bfb7:      	vpmuludq	%ymm15, %ymm12, %ymm14
  30bfbc:      	vpmuludq	%ymm1, %ymm11, %ymm15
  30bfc0:      	vpaddq	%ymm15, %ymm14, %ymm14
  30bfc5:      	vpaddq	%ymm4, %ymm14, %ymm14
  30bfc9:      	vpmuludq	0x460(%rsp), %ymm7, %ymm7
  30bfd2:      	vpmuludq	%ymm3, %ymm11, %ymm3
  30bfd6:      	vpmuludq	%ymm1, %ymm10, %ymm10
  30bfda:      	vpaddq	%ymm7, %ymm10, %ymm7
  30bfde:      	vpmuludq	%ymm2, %ymm6, %ymm1
  30bfe2:      	vpaddq	%ymm1, %ymm7, %ymm1
  30bfe6:      	vpmuludq	%ymm5, %ymm12, %ymm2
  30bfea:      	vpaddq	%ymm3, %ymm2, %ymm2
  30bfee:      	vpaddq	%ymm2, %ymm1, %ymm3
  30bff2:      	vmovdqa	0xa0(%rsp), %ymm2
  30bffb:      	vpsrlq	$0x1a, %ymm2, %ymm1
  30c000:      	vpaddq	0x80(%rsp), %ymm1, %ymm5
  30c009:      	vpand	%ymm0, %ymm2, %ymm2
  30c00d:      	vmovdqa	0x140(%rsp), %ymm4
  30c016:      	vpsrlq	$0x1a, %ymm4, %ymm1
  30c01b:      	vpaddq	%ymm1, %ymm8, %ymm1
  30c01f:      	vpand	%ymm0, %ymm4, %ymm6
  30c023:      	vpsrlq	$0x1a, %ymm5, %ymm8
  30c028:      	vpaddq	0x180(%rsp), %ymm8, %ymm7
  30c031:      	vpsrlq	$0x1a, %ymm1, %ymm8
  30c036:      	vpaddq	%ymm2, %ymm8, %ymm2
  30c03a:      	vpsllq	$0x2, %ymm8, %ymm8
  30c040:      	vpaddq	%ymm2, %ymm8, %ymm8
  30c044:      	vpsrlq	$0x1a, %ymm7, %ymm2
  30c049:      	vpaddq	%ymm6, %ymm2, %ymm2
  30c04d:      	vmovdqa	0x40(%rsp), %ymm4
  30c053:      	vpsrlq	$0x1a, %ymm4, %ymm6
  30c058:      	vpaddq	%ymm6, %ymm9, %ymm6
  30c05c:      	vpsrlq	$0x1a, %ymm14, %ymm9
  30c062:      	vpaddq	%ymm3, %ymm9, %ymm3
  30c066:      	vpsrlq	$0x1a, %ymm6, %ymm9
  30c06b:      	vpaddq	%ymm9, %ymm13, %ymm9
  30c070:      	vpand	%ymm0, %ymm5, %ymm5
  30c074:      	vpand	%ymm0, %ymm7, %ymm7
  30c078:      	vpand	%ymm0, %ymm6, %ymm6
  30c07c:      	vpaddq	%ymm6, %ymm5, %ymm5
  30c080:      	vpsrlq	$0x1a, %ymm8, %ymm6
  30c086:      	vpand	%ymm0, %ymm8, %ymm8
  30c08a:      	vpand	%ymm0, %ymm4, %ymm4
  30c08e:      	vpand	%ymm0, %ymm14, %ymm10
  30c092:      	vpaddq	%ymm5, %ymm6, %ymm5
  30c096:      	vpsrlq	$0x1a, %ymm3, %ymm6
  30c09b:      	vpaddq	%ymm4, %ymm6, %ymm4
  30c09f:      	vpsllq	$0x2, %ymm6, %ymm6
  30c0a4:      	vpaddq	%ymm4, %ymm6, %ymm6
  30c0a8:      	vpsrlq	$0x1a, %ymm9, %ymm4
  30c0ae:      	vpaddq	%ymm4, %ymm10, %ymm4
  30c0b2:      	vpand	%ymm0, %ymm2, %ymm10
  30c0b6:      	vpand	%ymm0, %ymm9, %ymm9
  30c0ba:      	vpaddq	%ymm7, %ymm9, %ymm7
  30c0be:      	vpsrlq	$0x1a, %ymm6, %ymm9
  30c0c3:      	vpaddq	%ymm5, %ymm9, %ymm9
  30c0c7:      	vpand	%ymm0, %ymm6, %ymm5
  30c0cb:      	vpaddq	%ymm5, %ymm8, %ymm6
  30c0cf:      	vpand	%ymm0, %ymm4, %ymm5
  30c0d3:      	vpaddq	%ymm5, %ymm10, %ymm5
  30c0d7:      	vpshufd	$0xee, %xmm6, %xmm8     # xmm8 = xmm6[2,3,2,3]
  30c0dc:      	vextracti128	$0x1, %ymm6, %xmm10
  30c0e2:      	vpaddq	%xmm6, %xmm8, %xmm8
  30c0e6:      	vpermq	$0xff, %ymm6, %ymm6     # ymm6 = ymm6[3,3,3,3]
  30c0ec:      	vpaddq	%xmm6, %xmm10, %xmm6
  30c0f0:      	vpaddq	%xmm6, %xmm8, %xmm6
  30c0f4:      	vmovq	%xmm6, %rdx
  30c0f9:      	vpshufd	$0xee, %xmm9, %xmm6     # xmm6 = xmm9[2,3,2,3]
  30c0ff:      	vextracti128	$0x1, %ymm9, %xmm8
  30c105:      	vpaddq	%xmm6, %xmm9, %xmm6
  30c109:      	vpermq	$0xff, %ymm9, %ymm9     # ymm9 = ymm9[3,3,3,3]
  30c10f:      	vpaddq	%xmm9, %xmm8, %xmm8
  30c114:      	vpaddq	%xmm6, %xmm8, %xmm6
  30c118:      	vmovq	%xmm6, %rsi
  30c11d:      	vpshufd	$0xee, %xmm7, %xmm6     # xmm6 = xmm7[2,3,2,3]
  30c122:      	vextracti128	$0x1, %ymm7, %xmm8
  30c128:      	vpaddq	%xmm6, %xmm7, %xmm6
  30c12c:      	vpermq	$0xff, %ymm7, %ymm7     # ymm7 = ymm7[3,3,3,3]
  30c132:      	vpaddq	%xmm7, %xmm8, %xmm7
  30c136:      	vpaddq	%xmm7, %xmm6, %xmm6
  30c13a:      	vmovq	%xmm6, %r9
  30c13f:      	vpshufd	$0xee, %xmm5, %xmm6     # xmm6 = xmm5[2,3,2,3]
  30c144:      	vextracti128	$0x1, %ymm5, %xmm7
  30c14a:      	vpaddq	%xmm6, %xmm5, %xmm6
  30c14e:      	vpermq	$0xff, %ymm5, %ymm5     # ymm5 = ymm5[3,3,3,3]
  30c154:      	vpaddq	%xmm5, %xmm7, %xmm5
  30c158:      	vpaddq	%xmm5, %xmm6, %xmm5
  30c15c:      	vmovq	%xmm5, %rcx
  30c161:      	movq	%rsi, %rdi
  30c164:      	shrq	$0x26, %rdi
  30c168:      	shlq	$0x1a, %rsi
  30c16c:      	movq	%r9, %r8
  30c16f:      	shrq	$0xc, %r8
  30c173:      	shlq	$0x34, %r9
  30c177:      	addq	%rdx, %r9
  30c17a:      	adcq	$0x0, %r8
  30c17e:      	addq	%rsi, %r9
  30c181:      	adcq	%rdi, %r8
  30c184:      	shlq	$0xe, %rcx
  30c188:      	addq	%r8, %rcx
  30c18b:      	movq	0x138(%rsp), %rax
  30c193:      	jb	0x30c22e <toyos_crypto::arch::x86_64::poly1305::blocks+0x161e>
  30c199:      	movabsq	$0x7fffffffffffff8, %rdx # imm = 0x7FFFFFFFFFFFFF8
  30c1a3:      	andq	%rdx, %rax
  30c1a6:      	vpsrlq	$0x1a, %ymm2, %ymm2
  30c1ab:      	vpand	%ymm0, %ymm1, %ymm1
  30c1af:      	vpand	%ymm0, %ymm3, %ymm0
  30c1b3:      	vpaddq	%ymm0, %ymm1, %ymm0
  30c1b7:      	vpaddq	%ymm0, %ymm2, %ymm0
  30c1bb:      	vpsrlq	$0x1a, %ymm4, %ymm1
  30c1c0:      	vpaddq	%ymm1, %ymm0, %ymm0
  30c1c4:      	vpshufd	$0xee, %xmm0, %xmm1     # xmm1 = xmm0[2,3,2,3]
  30c1c9:      	vextracti128	$0x1, %ymm0, %xmm2
  30c1cf:      	vpermq	$0xff, %ymm0, %ymm3     # ymm3 = ymm0[3,3,3,3]
  30c1d5:      	vpaddq	%xmm1, %xmm0, %xmm0
  30c1d9:      	vpaddq	%xmm3, %xmm2, %xmm1
  30c1dd:      	vpaddq	%xmm1, %xmm0, %xmm0
  30c1e1:      	vmovq	%xmm0, %rdx
  30c1e6:      	movq	%rdx, %rsi
  30c1e9:      	shlq	$0x28, %rsi
  30c1ed:      	shrq	$0x18, %rdx
  30c1f1:      	addq	%rsi, %rcx
  30c1f4:      	adcq	$0x0, %rdx
  30c1f8:      	movq	%rdx, %rsi
  30c1fb:      	shrq	$0x2, %rsi
  30c1ff:      	leaq	(%rsi,%rsi,4), %rsi
  30c203:      	andl	$0x3, %edx
  30c206:      	addq	%rsi, %r9
  30c209:      	adcq	$0x0, %rcx
  30c20d:      	adcq	$0x0, %rdx
  30c211:      	movq	%r9, (%r11)
  30c214:      	movq	%rcx, 0x8(%r11)
  30c218:      	movq	%rdx, 0x10(%r11)
  30c21c:      	leaq	-0x28(%rbp), %rsp
  30c220:      	popq	%rbx
  30c221:      	popq	%r12
  30c223:      	popq	%r13
  30c225:      	popq	%r14
  30c227:      	popq	%r15
  30c229:      	popq	%rbp
  30c22a:      	vzeroupper
  30c22d:      	retq
  30c22e:      	leaq	0x4f9cf3(%rip), %rdi    # 0x805f28 <anon.82512870eb8e0132f6a040156ea4d9cc.5.llvm.1166392773056798946+0xa8>
  30c235:      	vzeroupper
  30c238:      	callq	*0x56ca6a(%rip)         # 0x878ca8 <sdallocx+0x878ca8>
