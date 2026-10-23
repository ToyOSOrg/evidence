
$SCRATCH/poly1305-inline/image/sshserver-inc-c9a3f65e1:	file format elf64-x86-64

Disassembly of section .text:

000000000009dac0 <toyos_crypto::arch::x86_64::poly1305::blocks>:
   9dac0:      	pushq	%rbp
   9dac1:      	movq	%rsp, %rbp
   9dac4:      	pushq	%r15
   9dac6:      	pushq	%r14
   9dac8:      	pushq	%r13
   9daca:      	pushq	%r12
   9dacc:      	pushq	%rbx
   9dacd:      	andq	$-0x20, %rsp
   9dad1:      	subq	$0x580, %rsp            # imm = 0x580
   9dad8:      	movq	%rcx, %r10
   9dadb:      	shrq	$0x3, %r10
   9dadf:      	je	0x9ea5b <toyos_crypto::arch::x86_64::poly1305::blocks+0xf9b>
   9dae5:      	movq	%rdx, %r8
   9dae8:      	movq	%rcx, 0x138(%rsp)
   9daf0:      	movq	(%rsi), %rcx
   9daf3:      	movq	0x8(%rsi), %rax
   9daf7:      	movl	%ecx, %edx
   9daf9:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
   9daff:      	movl	%edx, 0xa0(%rsp)
   9db06:      	movq	%rax, %rdx
   9db09:      	shldq	$0xc, %rcx, %rdx
   9db0e:      	shrq	$0x1a, %rcx
   9db12:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
   9db18:      	movq	%rcx, 0x80(%rsp)
   9db20:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
   9db26:      	movq	%rdx, 0x180(%rsp)
   9db2e:      	shrq	$0xe, %rax
   9db32:      	movq	%rax, %r9
   9db35:      	movq	(%rdi), %r15
   9db38:      	movq	0x8(%rdi), %rax
   9db3c:      	movq	%rax, %rbx
   9db3f:      	mulq	%r15
   9db42:      	movq	%rdx, %rcx
   9db45:      	movq	%rax, %r11
   9db48:      	shldq	$0x1, %rax, %rcx
   9db4d:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
   9db54:      	movq	%r9, 0x160(%rsp)
   9db5c:      	addq	%rax, %r11
   9db5f:      	movq	0x10(%rdi), %rax
   9db63:      	movq	%rax, 0x60(%rsp)
   9db68:      	mulq	%rbx
   9db6b:      	movq	%rbx, 0x40(%rsp)
   9db70:      	movq	%rdx, %rdi
   9db73:      	movq	%rax, %r9
   9db76:      	movq	%r15, %rax
   9db79:      	mulq	%r15
   9db7c:      	movq	%rdx, %r13
   9db7f:      	addq	%r9, %rax
   9db82:      	adcq	%rdi, %r13
   9db85:      	addq	%r11, %r13
   9db88:      	adcq	$0x0, %rcx
   9db8c:      	movl	%ecx, %edi
   9db8e:      	andl	$0x3, %edi
   9db91:      	shrq	$0x2, %rcx
   9db95:      	leaq	(%rcx,%rcx,4), %r12
   9db99:      	addq	%rax, %r12
   9db9c:      	adcq	$0x0, %r13
   9dba0:      	movq	%rdi, %r14
   9dba3:      	adcq	$0x0, %r14
   9dba7:      	movq	%r14, 0x100(%rsp)
   9dbaf:      	movq	%r13, %rax
   9dbb2:      	movq	%r13, 0x140(%rsp)
   9dbba:      	mulq	%r15
   9dbbd:      	movq	%rax, %r11
   9dbc0:      	movq	%rdx, %rdi
   9dbc3:      	imulq	%r15, %r14
   9dbc7:      	movq	%r12, %rax
   9dbca:      	movq	%r12, 0x1a0(%rsp)
   9dbd2:      	mulq	%rbx
   9dbd5:      	movq	%rdx, %rcx
   9dbd8:      	movq	%rax, %r9
   9dbdb:      	addq	%r11, %r9
   9dbde:      	adcq	%rdi, %rcx
   9dbe1:      	movq	%r13, %rax
   9dbe4:      	movq	0x60(%rsp), %r13
   9dbe9:      	mulq	%r13
   9dbec:      	movq	%rdx, %rdi
   9dbef:      	movq	%rsi, 0x130(%rsp)
   9dbf7:      	movq	%rax, %r11
   9dbfa:      	movq	%r12, %rax
   9dbfd:      	mulq	%r15
   9dc00:      	movq	%rdx, %rbx
   9dc03:      	movq	%rax, %rsi
   9dc06:      	addq	%r11, %rsi
   9dc09:      	adcq	%rdi, %rbx
   9dc0c:      	addq	%r9, %rbx
   9dc0f:      	adcq	$0x0, %rcx
   9dc13:      	movq	0x100(%rsp), %rax
   9dc1b:      	mulq	%r13
   9dc1e:      	addq	%rbx, %rax
   9dc21:      	adcq	%rcx, %rdx
   9dc24:      	addq	%r14, %rdx
   9dc27:      	movl	%edx, %r12d
   9dc2a:      	andl	$0x3, %r12d
   9dc2e:      	shrq	$0x2, %rdx
   9dc32:      	leaq	(%rdx,%rdx,4), %rbx
   9dc36:      	addq	%rsi, %rbx
   9dc39:      	adcq	$0x0, %rax
   9dc3d:      	adcq	$0x0, %r12
   9dc41:      	movq	%rax, %r11
   9dc44:      	movq	%rax, 0x1e0(%rsp)
   9dc4c:      	mulq	%r15
   9dc4f:      	movq	%rax, %rcx
   9dc52:      	movq	%rdx, %rdi
   9dc55:      	movq	%r12, %r14
   9dc58:      	movq	%r12, 0x200(%rsp)
   9dc60:      	imulq	%r15, %r14
   9dc64:      	movq	%rbx, 0x1c0(%rsp)
   9dc6c:      	movq	%rbx, %rax
   9dc6f:      	mulq	0x40(%rsp)
   9dc74:      	movq	%rdx, %rsi
   9dc77:      	movq	%rax, %r9
   9dc7a:      	addq	%rcx, %r9
   9dc7d:      	adcq	%rdi, %rsi
   9dc80:      	movq	%r11, %rax
   9dc83:      	mulq	%r13
   9dc86:      	movq	%rdx, %rcx
   9dc89:      	movq	%rax, %r11
   9dc8c:      	movq	%rbx, %rax
   9dc8f:      	mulq	%r15
   9dc92:      	movq	%rdx, %rbx
   9dc95:      	movq	%rax, %rdi
   9dc98:      	addq	%r11, %rdi
   9dc9b:      	adcq	%rcx, %rbx
   9dc9e:      	addq	%r9, %rbx
   9dca1:      	adcq	$0x0, %rsi
   9dca5:      	movq	%r12, %rax
   9dca8:      	mulq	%r13
   9dcab:      	addq	%rbx, %rax
   9dcae:      	adcq	%rsi, %rdx
   9dcb1:      	addq	%r14, %rdx
   9dcb4:      	movq	%rdx, %rcx
   9dcb7:      	shrq	$0x2, %rcx
   9dcbb:      	leaq	(%rcx,%rcx,4), %rbx
   9dcbf:      	andl	$0x3, %edx
   9dcc2:      	movq	%rdx, %rsi
   9dcc5:      	addq	%rdi, %rbx
   9dcc8:      	movq	%rax, %rcx
   9dccb:      	adcq	$0x0, %rcx
   9dccf:      	adcq	$0x0, %rsi
   9dcd3:      	movq	%rsi, %r12
   9dcd6:      	movq	%rbx, %rax
   9dcd9:      	movq	%rbx, 0x220(%rsp)
   9dce1:      	movq	%r15, %r14
   9dce4:      	mulq	%r15
   9dce7:      	movq	%rdx, %r9
   9dcea:      	movq	%rax, %r11
   9dced:      	movq	%rcx, %rax
   9dcf0:      	movq	%rcx, 0x260(%rsp)
   9dcf8:      	mulq	%r13
   9dcfb:      	movq	%rdx, %rdi
   9dcfe:      	movq	%rax, %rsi
   9dd01:      	addq	%r11, %rsi
   9dd04:      	adcq	%r9, %rdi
   9dd07:      	movq	%rbx, %rax
   9dd0a:      	movq	0x40(%rsp), %r15
   9dd0f:      	mulq	%r15
   9dd12:      	movq	%rdx, %r11
   9dd15:      	movq	%rax, %rbx
   9dd18:      	movq	%rcx, %rax
   9dd1b:      	mulq	%r14
   9dd1e:      	movq	%r14, %r9
   9dd21:      	movq	%rdx, %r14
   9dd24:      	movq	%rax, %rcx
   9dd27:      	addq	%rbx, %rcx
   9dd2a:      	adcq	%r11, %r14
   9dd2d:      	movq	%r12, 0x240(%rsp)
   9dd35:      	movq	%r12, %rax
   9dd38:      	mulq	%r13
   9dd3b:      	addq	%rdi, %rcx
   9dd3e:      	adcq	$0x0, %r14
   9dd42:      	addq	%rax, %rcx
   9dd45:      	movq	%rcx, %rdi
   9dd48:      	adcq	%rdx, %r14
   9dd4b:      	movq	%r12, %rcx
   9dd4e:      	movq	%r9, %r11
   9dd51:      	imulq	%r9, %rcx
   9dd55:      	addq	%r14, %rcx
   9dd58:      	movq	%rcx, %rax
   9dd5b:      	shrq	$0x2, %rax
   9dd5f:      	leaq	(%rax,%rax,4), %rax
   9dd63:      	andl	$0x3, %ecx
   9dd66:      	addq	%rsi, %rax
   9dd69:      	movq	%rdi, %r14
   9dd6c:      	adcq	$0x0, %r14
   9dd70:      	adcq	$0x0, %rcx
   9dd74:      	movq	%rcx, %r9
   9dd77:      	movq	%rax, %rcx
   9dd7a:      	movq	%rax, 0x2a0(%rsp)
   9dd82:      	mulq	%r11
   9dd85:      	movq	%r11, %r12
   9dd88:      	movq	%rdx, %r11
   9dd8b:      	movq	%rax, %rbx
   9dd8e:      	movq	%r14, %rax
   9dd91:      	movq	%r14, 0x2c0(%rsp)
   9dd99:      	mulq	%r13
   9dd9c:      	movq	%rdx, %rdi
   9dd9f:      	movq	%rax, %rsi
   9dda2:      	addq	%rbx, %rsi
   9dda5:      	adcq	%r11, %rdi
   9dda8:      	movq	%rcx, %rax
   9ddab:      	mulq	%r15
   9ddae:      	movq	%rdx, %r11
   9ddb1:      	movq	%rax, %rbx
   9ddb4:      	movq	%r14, %rax
   9ddb7:      	mulq	%r12
   9ddba:      	movq	%r12, %rcx
   9ddbd:      	movq	%rdx, %r12
   9ddc0:      	movq	%rax, %r15
   9ddc3:      	addq	%rbx, %r15
   9ddc6:      	adcq	%r11, %r12
   9ddc9:      	movq	%r9, 0x2e0(%rsp)
   9ddd1:      	movq	%r9, %rax
   9ddd4:      	mulq	%r13
   9ddd7:      	addq	%rdi, %r15
   9ddda:      	adcq	$0x0, %r12
   9ddde:      	addq	%rax, %r15
   9dde1:      	adcq	%rdx, %r12
   9dde4:      	movq	%r9, %rdx
   9dde7:      	imulq	%rcx, %rdx
   9ddeb:      	addq	%r12, %rdx
   9ddee:      	movq	%rdx, %rax
   9ddf1:      	shrq	$0x2, %rax
   9ddf5:      	leaq	(%rax,%rax,4), %rbx
   9ddf9:      	andl	$0x3, %edx
   9ddfc:      	addq	%rsi, %rbx
   9ddff:      	adcq	$0x0, %r15
   9de03:      	adcq	$0x0, %rdx
   9de07:      	movq	%rdx, 0xe0(%rsp)
   9de0f:      	movq	%rbx, %rax
   9de12:      	movq	%rbx, 0xc0(%rsp)
   9de1a:      	mulq	%rcx
   9de1d:      	movq	%rdx, %rsi
   9de20:      	movq	%rax, %r11
   9de23:      	movq	%r15, %rax
   9de26:      	mulq	%r13
   9de29:      	movq	%r13, %r9
   9de2c:      	movq	%rdx, %rdi
   9de2f:      	movq	%rax, %r13
   9de32:      	addq	%r11, %r13
   9de35:      	adcq	%rsi, %rdi
   9de38:      	movq	%rbx, %rax
   9de3b:      	mulq	0x40(%rsp)
   9de40:      	movq	%rdx, %r11
   9de43:      	movq	%rax, %rbx
   9de46:      	movq	%r15, %rax
   9de49:      	mulq	%rcx
   9de4c:      	movq	%rdx, %r12
   9de4f:      	movq	%rax, %r14
   9de52:      	addq	%rbx, %r14
   9de55:      	adcq	%r11, %r12
   9de58:      	movq	0xe0(%rsp), %rbx
   9de60:      	movq	%rbx, %rax
   9de63:      	movq	%r9, %r11
   9de66:      	mulq	%r9
   9de69:      	addq	%rdi, %r14
   9de6c:      	adcq	$0x0, %r12
   9de70:      	addq	%rax, %r14
   9de73:      	adcq	%rdx, %r12
   9de76:      	imulq	%rcx, %rbx
   9de7a:      	addq	%r12, %rbx
   9de7d:      	movq	%rbx, %rax
   9de80:      	shrq	$0x2, %rax
   9de84:      	leaq	(%rax,%rax,4), %r9
   9de88:      	andl	$0x3, %ebx
   9de8b:      	addq	%r13, %r9
   9de8e:      	adcq	$0x0, %r14
   9de92:      	adcq	$0x0, %rbx
   9de96:      	movq	%r9, %rax
   9de99:      	mulq	%rcx
   9de9c:      	movq	%rcx, %rsi
   9de9f:      	movq	%rdx, %r13
   9dea2:      	movq	%rax, %rcx
   9dea5:      	movq	%r14, %rax
   9dea8:      	mulq	%r11
   9deab:      	movq	%rdx, %r12
   9deae:      	movq	%rax, %r11
   9deb1:      	addq	%rcx, %r11
   9deb4:      	adcq	%r13, %r12
   9deb7:      	movq	%r9, %rax
   9deba:      	mulq	0x40(%rsp)
   9debf:      	movq	%rdx, %rcx
   9dec2:      	movq	%rax, %r13
   9dec5:      	movq	%r14, %rax
   9dec8:      	mulq	%rsi
   9decb:      	movq	%rsi, 0x280(%rsp)
   9ded3:      	movq	%rdx, %rdi
   9ded6:      	addq	%r13, %rax
   9ded9:      	movq	%rax, %r13
   9dedc:      	adcq	%rcx, %rdi
   9dedf:      	movq	%rbx, %rax
   9dee2:      	mulq	0x60(%rsp)
   9dee7:      	addq	%r12, %r13
   9deea:      	adcq	$0x0, %rdi
   9deee:      	addq	%rax, %r13
   9def1:      	adcq	%rdx, %rdi
   9def4:      	movq	%rbx, %rdx
   9def7:      	imulq	%rsi, %rdx
   9defb:      	addq	%rdi, %rdx
   9defe:      	movq	%rdx, %rax
   9df01:      	shrq	$0x2, %rax
   9df05:      	leaq	(%rax,%rax,4), %rax
   9df09:      	andl	$0x3, %edx
   9df0c:      	addq	%r11, %rax
   9df0f:      	adcq	$0x0, %r13
   9df13:      	adcq	$0x0, %rdx
   9df17:      	movl	%eax, %ecx
   9df19:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
   9df1f:      	movq	%r13, %rdi
   9df22:      	shldq	$0xc, %rax, %rdi
   9df27:      	shrq	$0x1a, %rax
   9df2b:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
   9df30:      	shldq	$0x18, %r13, %rdx
   9df35:      	andl	$0x3ffffff, %edi        # imm = 0x3FFFFFF
   9df3b:      	shrq	$0xe, %r13
   9df3f:      	andl	$0x3ffffff, %r13d       # imm = 0x3FFFFFF
   9df46:      	movq	%rcx, (%rsp)
   9df4a:      	movq	%rax, 0x8(%rsp)
   9df4f:      	movq	%rdi, 0x10(%rsp)
   9df54:      	movq	%r13, 0x18(%rsp)
   9df59:      	movq	%rdx, 0x20(%rsp)
   9df5e:      	movq	%rcx, 0x28(%rsp)
   9df63:      	movq	%rax, 0x30(%rsp)
   9df68:      	movq	%rdi, 0x38(%rsp)
   9df6d:      	vmovups	(%rsp), %ymm0
   9df72:      	vmovaps	%ymm0, 0x300(%rsp)
   9df7b:      	vmovdqu	0x8(%rsp), %ymm12
   9df81:      	vmovdqu	0x10(%rsp), %ymm13
   9df87:      	vmovdqu	0x18(%rsp), %ymm14
   9df8d:      	vmovdqu	0x20(%rsp), %ymm15
   9df93:      	movq	0xc0(%rsp), %r11
   9df9b:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
   9dfa2:      	movq	%rcx, 0x60(%rsp)
   9dfa7:      	movq	%rcx, (%rsp)
   9dfab:      	movq	%rax, 0x8(%rsp)
   9dfb0:      	movq	%rdi, 0x10(%rsp)
   9dfb5:      	movq	%r13, 0x18(%rsp)
   9dfba:      	movq	%rdx, 0x20(%rsp)
   9dfbf:      	movq	%r11, 0x28(%rsp)
   9dfc4:      	vmovdqu	(%rsp), %xmm4
   9dfc9:      	vmovdqu	0x8(%rsp), %xmm3
   9dfcf:      	vmovdqu	0x10(%rsp), %xmm2
   9dfd5:      	vmovdqu	0x18(%rsp), %xmm1
   9dfdb:      	vmovdqu	0x20(%rsp), %xmm0
   9dfe1:      	movq	0x220(%rsp), %rcx
   9dfe9:      	movl	%ecx, %r12d
   9dfec:      	andl	$0x3ffffff, %r12d       # imm = 0x3FFFFFF
   9dff3:      	movq	%r12, (%rsp)
   9dff7:      	movq	0x260(%rsp), %rsi
   9dfff:      	movq	%rsi, %r12
   9e002:      	shldq	$0xc, %rcx, %r12
   9e007:      	shrq	$0x1a, %rcx
   9e00b:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
   9e011:      	movq	%rcx, 0x8(%rsp)
   9e016:      	andl	$0x3ffffff, %r12d       # imm = 0x3FFFFFF
   9e01d:      	movq	%r12, 0x10(%rsp)
   9e022:      	movq	%rsi, %rcx
   9e025:      	movq	0x240(%rsp), %rsi
   9e02d:      	shldq	$0x18, %rcx, %rsi
   9e032:      	shrq	$0xe, %rcx
   9e036:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
   9e03c:      	movq	%rcx, 0x18(%rsp)
   9e041:      	movq	%rsi, 0x20(%rsp)
   9e046:      	vpinsrq	$0x1, %r11, %xmm4, %xmm4
   9e04c:      	movl	%r9d, %r11d
   9e04f:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
   9e056:      	vmovq	%r11, %xmm5
   9e05b:      	movq	%r15, %r11
   9e05e:      	movq	0xc0(%rsp), %rcx
   9e066:      	shldq	$0xc, %rcx, %r11
   9e06b:      	shrq	$0x1a, %rcx
   9e06f:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
   9e075:      	vpinsrq	$0x1, %rcx, %xmm3, %xmm3
   9e07b:      	movq	0x2a0(%rsp), %rcx
   9e083:      	movl	%ecx, %r12d
   9e086:      	andl	$0x3ffffff, %r12d       # imm = 0x3FFFFFF
   9e08d:      	vmovq	%r12, %xmm8
   9e092:      	movq	%r14, %r12
   9e095:      	shldq	$0xc, %r9, %r12
   9e09a:      	shrq	$0x1a, %r9
   9e09e:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
   9e0a5:      	vmovq	%r9, %xmm6
   9e0aa:      	movq	0x2c0(%rsp), %rsi
   9e0b2:      	movq	%rsi, %r9
   9e0b5:      	shldq	$0xc, %rcx, %r9
   9e0ba:      	shrq	$0x1a, %rcx
   9e0be:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
   9e0c4:      	vmovq	%rcx, %xmm10
   9e0c9:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
   9e0d0:      	vpinsrq	$0x1, %r11, %xmm2, %xmm7
   9e0d6:      	andl	$0x3ffffff, %r12d       # imm = 0x3FFFFFF
   9e0dd:      	vmovq	%r12, %xmm9
   9e0e2:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
   9e0e9:      	vmovq	%r9, %xmm2
   9e0ee:      	movq	0xe0(%rsp), %r9
   9e0f6:      	shldq	$0x18, %r15, %r9
   9e0fb:      	shrq	$0xe, %r15
   9e0ff:      	andl	$0x3ffffff, %r15d       # imm = 0x3FFFFFF
   9e106:      	vpinsrq	$0x1, %r15, %xmm1, %xmm1
   9e10c:      	shldq	$0x18, %r14, %rbx
   9e111:      	shrq	$0xe, %r14
   9e115:      	andl	$0x3ffffff, %r14d       # imm = 0x3FFFFFF
   9e11c:      	vpbroadcastq	%xmm5, %ymm5
   9e121:      	vpblendd	$0x30, %ymm5, %ymm4, %ymm4 # ymm4 = ymm4[0,1,2,3],ymm5[4,5],ymm4[6,7]
   9e127:      	vmovq	%r14, %xmm5
   9e12c:      	movq	0x2e0(%rsp), %rcx
   9e134:      	shldq	$0x18, %rsi, %rcx
   9e139:      	shrq	$0xe, %rsi
   9e13d:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
   9e143:      	vpbroadcastq	%xmm8, %ymm8
   9e148:      	vpblendd	$0xc0, %ymm8, %ymm4, %ymm4 # ymm4 = ymm4[0,1,2,3,4,5],ymm8[6,7]
   9e14e:      	vmovdqa	%ymm4, 0x540(%rsp)
   9e157:      	vmovq	%rsi, %xmm4
   9e15c:      	vpinsrq	$0x1, %r9, %xmm0, %xmm0
   9e162:      	vpbroadcastq	%xmm6, %ymm6
   9e167:      	vpblendd	$0x30, %ymm6, %ymm3, %ymm3 # ymm3 = ymm3[0,1,2,3],ymm6[4,5],ymm3[6,7]
   9e16d:      	vmovq	%rbx, %xmm6
   9e172:      	vpbroadcastq	%xmm10, %ymm8
   9e177:      	vpblendd	$0xc0, %ymm8, %ymm3, %ymm10 # ymm10 = ymm3[0,1,2,3,4,5],ymm8[6,7]
   9e17d:      	vmovq	%rcx, %xmm3
   9e182:      	movq	0x1a0(%rsp), %r11
   9e18a:      	movl	%r11d, %esi
   9e18d:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
   9e193:      	movq	%rsi, 0x28(%rsp)
   9e198:      	vpbroadcastq	%xmm9, %ymm8
   9e19d:      	vpblendd	$0x30, %ymm8, %ymm7, %ymm7 # ymm7 = ymm7[0,1,2,3],ymm8[4,5],ymm7[6,7]
   9e1a3:      	vmovdqu	(%rsp), %xmm8
   9e1a8:      	vpinsrq	$0x1, %rsi, %xmm8, %xmm8
   9e1ae:      	vpbroadcastq	%xmm2, %ymm2
   9e1b3:      	vpblendd	$0xc0, %ymm2, %ymm7, %ymm7 # ymm7 = ymm7[0,1,2,3,4,5],ymm2[6,7]
   9e1b9:      	movq	0x1c0(%rsp), %r12
   9e1c1:      	movl	%r12d, %esi
   9e1c4:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
   9e1ca:      	vmovq	%rsi, %xmm2
   9e1cf:      	movq	0x140(%rsp), %rbx
   9e1d7:      	movq	%rbx, %r9
   9e1da:      	shldq	$0xc, %r11, %r9
   9e1df:      	vpbroadcastq	%xmm5, %ymm5
   9e1e4:      	vpblendd	$0x30, %ymm5, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm5[4,5],ymm1[6,7]
   9e1ea:      	movq	0x280(%rsp), %r15
   9e1f2:      	movl	%r15d, %esi
   9e1f5:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
   9e1fb:      	vmovq	%rsi, %xmm5
   9e200:      	movq	%r11, %rsi
   9e203:      	shrq	$0x1a, %rsi
   9e207:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
   9e20d:      	vpbroadcastq	%xmm4, %ymm4
   9e212:      	vpblendd	$0xc0, %ymm4, %ymm1, %ymm9 # ymm9 = ymm1[0,1,2,3,4,5],ymm4[6,7]
   9e218:      	vmovdqu	0x8(%rsp), %xmm1
   9e21e:      	vpinsrq	$0x1, %rsi, %xmm1, %xmm1
   9e224:      	vpbroadcastq	%xmm6, %ymm4
   9e229:      	movq	0x1e0(%rsp), %r14
   9e231:      	movq	%r14, %rsi
   9e234:      	movq	%r12, %r11
   9e237:      	shldq	$0xc, %r12, %rsi
   9e23c:      	vpblendd	$0x30, %ymm4, %ymm0, %ymm4 # ymm4 = ymm0[0,1,2,3],ymm4[4,5],ymm0[6,7]
   9e242:      	shrq	$0x1a, %r11
   9e246:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
   9e24d:      	vmovq	%r11, %xmm0
   9e252:      	vpbroadcastq	%xmm3, %ymm3
   9e257:      	movq	0x40(%rsp), %r12
   9e25c:      	movq	%r12, %r11
   9e25f:      	shldq	$0xc, %r15, %r11
   9e264:      	vpblendd	$0xc0, %ymm3, %ymm4, %ymm6 # ymm6 = ymm4[0,1,2,3,4,5],ymm3[6,7]
   9e26a:      	shrq	$0x1a, %r15
   9e26e:      	andl	$0x3ffffff, %r15d       # imm = 0x3FFFFFF
   9e275:      	vmovq	%r15, %xmm3
   9e27a:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
   9e281:      	vpbroadcastq	%xmm2, %ymm2
   9e286:      	vpblendd	$0x30, %ymm2, %ymm8, %ymm2 # ymm2 = ymm8[0,1,2,3],ymm2[4,5],ymm8[6,7]
   9e28c:      	vmovdqu	0x10(%rsp), %xmm4
   9e292:      	vpinsrq	$0x1, %r9, %xmm4, %xmm4
   9e298:      	vpbroadcastq	%xmm5, %ymm5
   9e29d:      	vpblendd	$0xc0, %ymm5, %ymm2, %ymm2 # ymm2 = ymm2[0,1,2,3,4,5],ymm5[6,7]
   9e2a3:      	vmovdqa	%ymm2, 0x500(%rsp)
   9e2ac:      	vmovdqu	0x18(%rsp), %xmm2
   9e2b2:      	movq	%rbx, %r9
   9e2b5:      	movq	0x100(%rsp), %rbx
   9e2bd:      	shldq	$0x18, %r9, %rbx
   9e2c2:      	shrq	$0xe, %r9
   9e2c6:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
   9e2cd:      	vpinsrq	$0x1, %r9, %xmm2, %xmm2
   9e2d3:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
   9e2d9:      	movq	%r14, %r9
   9e2dc:      	movq	0x200(%rsp), %r14
   9e2e4:      	shldq	$0x18, %r9, %r14
   9e2e9:      	vpbroadcastq	%xmm0, %ymm0
   9e2ee:      	vpblendd	$0x30, %ymm0, %ymm1, %ymm0 # ymm0 = ymm1[0,1,2,3],ymm0[4,5],ymm1[6,7]
   9e2f4:      	vmovq	%rsi, %xmm1
   9e2f9:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
   9e300:      	vpbroadcastq	%xmm3, %ymm3
   9e305:      	vpblendd	$0xc0, %ymm3, %ymm0, %ymm5 # ymm5 = ymm0[0,1,2,3,4,5],ymm3[6,7]
   9e30b:      	vmovq	%r11, %xmm0
   9e310:      	movq	0x130(%rsp), %r11
   9e318:      	shrq	$0xe, %r9
   9e31c:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
   9e323:      	vpbroadcastq	%xmm1, %ymm1
   9e328:      	vpblendd	$0x30, %ymm1, %ymm4, %ymm1 # ymm1 = ymm4[0,1,2,3],ymm1[4,5],ymm4[6,7]
   9e32e:      	vmovq	%r9, %xmm3
   9e333:      	vpbroadcastq	%xmm0, %ymm0
   9e338:      	vpblendd	$0xc0, %ymm0, %ymm1, %ymm4 # ymm4 = ymm1[0,1,2,3,4,5],ymm0[6,7]
   9e33e:      	vmovdqu	0x20(%rsp), %xmm0
   9e344:      	vpinsrq	$0x1, %rbx, %xmm0, %xmm0
   9e34a:      	movq	%r12, %r9
   9e34d:      	movq	%r12, %rsi
   9e350:      	shrq	$0xe, %rsi
   9e354:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
   9e35a:      	vpbroadcastq	%xmm3, %ymm1
   9e35f:      	vpblendd	$0x30, %ymm1, %ymm2, %ymm1 # ymm1 = ymm2[0,1,2,3],ymm1[4,5],ymm2[6,7]
   9e365:      	vmovq	%rsi, %xmm2
   9e36a:      	vpbroadcastq	%xmm2, %ymm2
   9e36f:      	vpblendd	$0xc0, %ymm2, %ymm1, %ymm2 # ymm2 = ymm1[0,1,2,3,4,5],ymm2[6,7]
   9e375:      	vmovq	%r14, %xmm1
   9e37a:      	decq	%r10
   9e37d:      	shrq	$0x28, %r9
   9e381:      	vpbroadcastq	%xmm1, %ymm1
   9e386:      	vpblendd	$0x30, %ymm1, %ymm0, %ymm0 # ymm0 = ymm0[0,1,2,3],ymm1[4,5],ymm0[6,7]
   9e38c:      	vmovq	%r9, %xmm1
   9e391:      	movq	%r10, %rsi
   9e394:      	shlq	$0x7, %rsi
   9e398:      	addq	%r8, %rsi
   9e39b:      	vpbroadcastq	%xmm1, %ymm1
   9e3a0:      	vpblendd	$0xc0, %ymm1, %ymm0, %ymm1 # ymm1 = ymm0[0,1,2,3,4,5],ymm1[6,7]
   9e3a6:      	vpsllq	$0x2, %ymm10, %ymm0
   9e3ac:      	vmovdqa	%ymm10, 0x520(%rsp)
   9e3b5:      	vpaddq	%ymm0, %ymm10, %ymm0
   9e3b9:      	vmovdqa	%ymm0, 0x320(%rsp)
   9e3c2:      	vpsllq	$0x2, %ymm7, %ymm0
   9e3c7:      	vmovdqa	%ymm7, 0x4a0(%rsp)
   9e3d0:      	vpaddq	%ymm7, %ymm0, %ymm0
   9e3d4:      	vmovdqa	%ymm0, 0x340(%rsp)
   9e3dd:      	vpsllq	$0x2, %ymm9, %ymm0
   9e3e3:      	vmovdqa	%ymm9, 0x440(%rsp)
   9e3ec:      	vpaddq	%ymm0, %ymm9, %ymm0
   9e3f0:      	vmovdqa	%ymm0, 0x360(%rsp)
   9e3f9:      	vpsllq	$0x2, %ymm6, %ymm0
   9e3fe:      	vmovdqa	%ymm6, 0x420(%rsp)
   9e407:      	vpaddq	%ymm6, %ymm0, %ymm0
   9e40b:      	vmovdqa	%ymm0, 0x380(%rsp)
   9e414:      	vpsllq	$0x2, %ymm5, %ymm0
   9e419:      	vmovdqa	%ymm5, 0x4e0(%rsp)
   9e422:      	vpaddq	%ymm5, %ymm0, %ymm0
   9e426:      	vmovdqa	%ymm0, 0x3a0(%rsp)
   9e42f:      	vpsllq	$0x2, %ymm4, %ymm0
   9e434:      	vmovdqa	%ymm4, 0x4c0(%rsp)
   9e43d:      	vpaddq	%ymm4, %ymm0, %ymm0
   9e441:      	vmovdqa	%ymm0, 0x3c0(%rsp)
   9e44a:      	vpsllq	$0x2, %ymm2, %ymm0
   9e44f:      	vmovdqa	%ymm2, 0x480(%rsp)
   9e458:      	vpaddq	%ymm2, %ymm0, %ymm0
   9e45c:      	vmovdqa	%ymm0, 0x3e0(%rsp)
   9e465:      	vpsllq	$0x2, %ymm1, %ymm0
   9e46a:      	vmovdqa	%ymm1, 0x460(%rsp)
   9e473:      	vpaddq	%ymm1, %ymm0, %ymm0
   9e477:      	vmovdqa	%ymm0, 0x400(%rsp)
   9e480:      	vmovd	0xa0(%rsp), %xmm5
   9e489:      	vmovd	0x80(%rsp), %xmm11
   9e492:      	vmovd	0x180(%rsp), %xmm8
   9e49b:      	vmovd	0x160(%rsp), %xmm6
   9e4a4:      	vmovq	0xd(%r11), %xmm10
   9e4aa:      	testq	%r10, %r10
   9e4ad:      	vmovdqa	%ymm6, 0xa0(%rsp)
   9e4b6:      	vmovdqa	%ymm8, 0x80(%rsp)
   9e4bf:      	je	0x9ea62 <toyos_crypto::arch::x86_64::poly1305::blocks+0xfa2>
   9e4c5:      	vpinsrq	$0x1, %rdx, %xmm15, %xmm0
   9e4cb:      	vmovq	%rdx, %xmm1
   9e4d0:      	vpbroadcastq	%xmm1, %ymm1
   9e4d5:      	vpblendd	$0xf0, %ymm1, %ymm0, %ymm1 # ymm1 = ymm0[0,1,2,3],ymm1[4,5,6,7]
   9e4db:      	vpsllq	$0x2, %ymm1, %ymm0
   9e4e0:      	vmovdqa	%ymm1, 0x180(%rsp)
   9e4e9:      	vpaddq	%ymm1, %ymm0, %ymm0
   9e4ed:      	vmovdqa	%ymm0, 0x260(%rsp)
   9e4f6:      	vpinsrq	$0x1, %r13, %xmm14, %xmm0
   9e4fc:      	vmovq	%r13, %xmm1
   9e501:      	vpbroadcastq	%xmm1, %ymm1
   9e506:      	vpblendd	$0xf0, %ymm1, %ymm0, %ymm2 # ymm2 = ymm0[0,1,2,3],ymm1[4,5,6,7]
   9e50c:      	vpsllq	$0x2, %ymm2, %ymm0
   9e511:      	vpinsrq	$0x1, %rdi, %xmm13, %xmm1
   9e517:      	vmovdqa	%ymm2, 0x160(%rsp)
   9e520:      	vpaddq	%ymm2, %ymm0, %ymm0
   9e524:      	vmovdqa	%ymm0, 0x140(%rsp)
   9e52d:      	vmovq	%rdi, %xmm0
   9e532:      	vpbroadcastq	%xmm0, %ymm0
   9e537:      	vpblendd	$0xf0, %ymm0, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm0[4,5,6,7]
   9e53d:      	vpsllq	$0x2, %ymm1, %ymm0
   9e542:      	vmovdqa	%ymm1, 0x200(%rsp)
   9e54b:      	vpaddq	%ymm1, %ymm0, %ymm0
   9e54f:      	vmovdqa	%ymm0, 0x1e0(%rsp)
   9e558:      	vpinsrq	$0x1, %rax, %xmm12, %xmm0
   9e55e:      	vmovq	%rax, %xmm3
   9e563:      	vpbroadcastq	%xmm3, %ymm3
   9e568:      	vpblendd	$0xf0, %ymm3, %ymm0, %ymm1 # ymm1 = ymm0[0,1,2,3],ymm3[4,5,6,7]
   9e56e:      	vpsllq	$0x2, %ymm1, %ymm0
   9e573:      	vmovdqa	%ymm1, 0x240(%rsp)
   9e57c:      	vpaddq	%ymm1, %ymm0, %ymm0
   9e580:      	vmovdqa	%ymm0, 0x1c0(%rsp)
   9e589:      	movq	0x60(%rsp), %rax
   9e58e:      	vmovdqa	0x300(%rsp), %ymm0
   9e597:      	vpinsrq	$0x1, %rax, %xmm0, %xmm0
   9e59d:      	vmovq	%rax, %xmm4
   9e5a2:      	vpbroadcastq	%xmm4, %ymm4
   9e5a7:      	vpblendd	$0xf0, %ymm4, %ymm0, %ymm0 # ymm0 = ymm0[0,1,2,3],ymm4[4,5,6,7]
   9e5ad:      	vmovdqa	%ymm0, 0x220(%rsp)
   9e5b6:      	addq	$0x70, %r8
   9e5ba:      	vpxor	%xmm0, %xmm0, %xmm0
   9e5be:      	vmovdqa	%ymm0, 0x60(%rsp)
   9e5c4:      	vpbroadcastq	-0x93f35(%rip), %ymm9 # 0xa698 <anon.06a5d9ca6d216076d14f4792906d843c.6.llvm.11130069727037220349+0x16b>
   9e5cd:      	vpbroadcastq	-0x93f06(%rip), %ymm0 # 0xa6d0 <anon.06a5d9ca6d216076d14f4792906d843c.6.llvm.11130069727037220349+0x1a3>
   9e5d6:      	vmovdqa	%ymm0, 0x1a0(%rsp)
   9e5df:      	vpxor	%xmm0, %xmm0, %xmm0
   9e5e3:      	vmovdqa	%ymm0, 0x100(%rsp)
   9e5ec:      	vmovdqa	%ymm0, 0xc0(%rsp)
   9e5f5:      	vmovdqa	%ymm0, 0xe0(%rsp)
   9e5fe:      	vmovdqa	%ymm0, 0x40(%rsp)
   9e604:      	vmovdqa	%ymm5, %ymm15
   9e608:      	vmovdqa	0x260(%rsp), %ymm7
   9e611:      	vmovdqa	0x240(%rsp), %ymm3
   9e61a:      	nopw	(%rax,%rax)
   9e620:      	vmovdqu	-0x70(%r8), %ymm0
   9e626:      	vmovdqu	-0x50(%r8), %ymm6
   9e62c:      	vmovdqu	-0x30(%r8), %ymm8
   9e632:      	vmovdqu	-0x10(%r8), %ymm14
   9e638:      	vpunpckhqdq	%ymm6, %ymm0, %ymm4 # ymm4 = ymm0[1],ymm6[1],ymm0[3],ymm6[3]
   9e63c:      	vpunpcklqdq	%ymm6, %ymm0, %ymm12 # ymm12 = ymm0[0],ymm6[0],ymm0[2],ymm6[2]
   9e640:      	vpsrlq	$0x34, %ymm12, %ymm0
   9e646:      	vpsllq	$0xc, %ymm4, %ymm6
   9e64b:      	vpor	%ymm0, %ymm6, %ymm13
   9e64f:      	vpunpcklqdq	%ymm14, %ymm8, %ymm6 # ymm6 = ymm8[0],ymm14[0],ymm8[2],ymm14[2]
   9e654:      	vpunpckhqdq	%ymm14, %ymm8, %ymm0 # ymm0 = ymm8[1],ymm14[1],ymm8[3],ymm14[3]
   9e659:      	vmovdqa	%ymm0, 0x280(%rsp)
   9e662:      	vpsrlq	$0x34, %ymm6, %ymm8
   9e667:      	vpsllq	$0xc, %ymm0, %ymm14
   9e66c:      	vpor	%ymm8, %ymm14, %ymm1
   9e671:      	vmovdqa	%ymm1, 0x2a0(%rsp)
   9e67a:      	vmovdqa	%ymm15, %ymm1
   9e67e:      	vpsrlq	$0x1a, %ymm15, %ymm14
   9e684:      	vpaddq	%ymm11, %ymm14, %ymm14
   9e689:      	vmovdqa	0xa0(%rsp), %ymm2
   9e692:      	vpsrlq	$0x1a, %ymm2, %ymm11
   9e697:      	vpaddq	%ymm10, %ymm11, %ymm10
   9e69c:      	vpsrlq	$0x1a, %ymm14, %ymm11
   9e6a2:      	vpaddq	0x80(%rsp), %ymm11, %ymm11
   9e6ab:      	vpsrlq	$0x28, %ymm4, %ymm15
   9e6b0:      	vpand	%ymm9, %ymm10, %ymm8
   9e6b5:      	vpaddq	%ymm15, %ymm8, %ymm8
   9e6ba:      	vpsrlq	$0x1a, %ymm10, %ymm10
   9e6c0:      	vpsllq	$0x2, %ymm10, %ymm15
   9e6c6:      	vpaddq	%ymm10, %ymm15, %ymm10
   9e6cb:      	vpand	%ymm1, %ymm9, %ymm15
   9e6cf:      	vpaddq	%ymm10, %ymm15, %ymm15
   9e6d4:      	vpand	%ymm2, %ymm9, %ymm10
   9e6d8:      	vpsrlq	$0x1a, %ymm11, %ymm5
   9e6de:      	vpaddq	%ymm5, %ymm10, %ymm5
   9e6e2:      	vpsrlq	$0xe, %ymm4, %ymm4
   9e6e7:      	vpand	%ymm4, %ymm9, %ymm1
   9e6eb:      	vpand	%ymm9, %ymm13, %ymm4
   9e6f0:      	vpand	%ymm9, %ymm14, %ymm10
   9e6f5:      	vpand	%ymm9, %ymm11, %ymm11
   9e6fa:      	vpaddq	%ymm4, %ymm11, %ymm4
   9e6fe:      	vpsrlq	$0x1a, %ymm15, %ymm11
   9e704:      	vpaddq	%ymm10, %ymm11, %ymm10
   9e709:      	vpsrlq	$0x1a, %ymm12, %ymm11
   9e70f:      	vpand	%ymm9, %ymm11, %ymm11
   9e714:      	vpand	%ymm9, %ymm12, %ymm12
   9e719:      	vpaddq	%ymm11, %ymm10, %ymm10
   9e71e:      	vpand	%ymm9, %ymm15, %ymm11
   9e723:      	vpaddq	%ymm11, %ymm12, %ymm14
   9e728:      	vpsrlq	$0x1a, %ymm5, %ymm11
   9e72d:      	vpaddq	%ymm11, %ymm8, %ymm8
   9e732:      	vpand	%ymm5, %ymm9, %ymm5
   9e736:      	vpaddq	%ymm5, %ymm1, %ymm13
   9e73a:      	vpaddq	0x1a0(%rsp), %ymm8, %ymm12
   9e743:      	vmovdqa	0x220(%rsp), %ymm2
   9e74c:      	vpmuludq	%ymm2, %ymm14, %ymm1
   9e750:      	vpmuludq	%ymm7, %ymm10, %ymm5
   9e754:      	vmovdqa	0x1e0(%rsp), %ymm15
   9e75d:      	vpmuludq	%ymm15, %ymm13, %ymm8
   9e762:      	vpaddq	%ymm1, %ymm8, %ymm1
   9e766:      	vmovdqa	0x140(%rsp), %ymm0
   9e76f:      	vpmuludq	%ymm0, %ymm4, %ymm8
   9e773:      	vpaddq	%ymm1, %ymm8, %ymm1
   9e777:      	vpmuludq	0x1c0(%rsp), %ymm12, %ymm8
   9e780:      	vpaddq	%ymm5, %ymm8, %ymm5
   9e784:      	vpaddq	%ymm5, %ymm1, %ymm1
   9e788:      	vmovdqa	%ymm1, 0x2e0(%rsp)
   9e791:      	vpmuludq	%ymm3, %ymm14, %ymm1
   9e795:      	vpmuludq	%ymm0, %ymm13, %ymm5
   9e799:      	vpaddq	%ymm5, %ymm1, %ymm1
   9e79d:      	vpmuludq	%ymm7, %ymm4, %ymm5
   9e7a1:      	vpaddq	%ymm1, %ymm5, %ymm1
   9e7a5:      	vpmuludq	%ymm2, %ymm10, %ymm5
   9e7a9:      	vpmuludq	%ymm15, %ymm12, %ymm8
   9e7ae:      	vpaddq	%ymm5, %ymm8, %ymm5
   9e7b2:      	vpaddq	%ymm5, %ymm1, %ymm1
   9e7b6:      	vmovdqa	%ymm1, 0x2c0(%rsp)
   9e7bf:      	vmovdqa	0x200(%rsp), %ymm11
   9e7c8:      	vpmuludq	%ymm11, %ymm14, %ymm1
   9e7cd:      	vpmuludq	%ymm7, %ymm13, %ymm5
   9e7d1:      	vpaddq	%ymm5, %ymm1, %ymm1
   9e7d5:      	vpmuludq	%ymm2, %ymm4, %ymm5
   9e7d9:      	vpaddq	%ymm1, %ymm5, %ymm1
   9e7dd:      	vpmuludq	%ymm3, %ymm10, %ymm5
   9e7e1:      	vpmuludq	%ymm0, %ymm12, %ymm8
   9e7e5:      	vpaddq	%ymm5, %ymm8, %ymm5
   9e7e9:      	vpaddq	%ymm5, %ymm1, %ymm1
   9e7ed:      	vmovdqa	%ymm1, 0x80(%rsp)
   9e7f6:      	vmovdqa	0x160(%rsp), %ymm15
   9e7ff:      	vpmuludq	%ymm15, %ymm14, %ymm1
   9e804:      	vpmuludq	%ymm2, %ymm13, %ymm5
   9e808:      	vpaddq	%ymm5, %ymm1, %ymm1
   9e80c:      	vpmuludq	%ymm3, %ymm4, %ymm5
   9e810:      	vpaddq	%ymm1, %ymm5, %ymm1
   9e814:      	vpmuludq	%ymm11, %ymm10, %ymm5
   9e819:      	vpmuludq	%ymm7, %ymm12, %ymm8
   9e81d:      	vpaddq	%ymm5, %ymm8, %ymm5
   9e821:      	vpaddq	%ymm5, %ymm1, %ymm1
   9e825:      	vmovdqa	%ymm1, 0xa0(%rsp)
   9e82e:      	vpmuludq	0x180(%rsp), %ymm14, %ymm1
   9e837:      	vpmuludq	%ymm3, %ymm13, %ymm5
   9e83b:      	vpaddq	%ymm5, %ymm1, %ymm1
   9e83f:      	vpmuludq	%ymm4, %ymm11, %ymm4
   9e843:      	vpaddq	%ymm1, %ymm4, %ymm1
   9e847:      	vpand	%ymm6, %ymm9, %ymm13
   9e84b:      	vpsrlq	$0x1a, %ymm6, %ymm0
   9e850:      	vpand	%ymm0, %ymm9, %ymm4
   9e854:      	vpand	0x2a0(%rsp), %ymm9, %ymm0
   9e85d:      	vpmuludq	%ymm15, %ymm10, %ymm5
   9e862:      	vpmuludq	%ymm2, %ymm12, %ymm8
   9e866:      	vpaddq	%ymm5, %ymm8, %ymm5
   9e86a:      	vmovdqa	0x280(%rsp), %ymm6
   9e873:      	vpsrlq	$0xe, %ymm6, %ymm8
   9e878:      	vpand	%ymm9, %ymm8, %ymm11
   9e87d:      	vpsrlq	$0x28, %ymm6, %ymm6
   9e882:      	vpaddq	%ymm5, %ymm1, %ymm10
   9e886:      	vmovdqa	0x40(%rsp), %ymm5
   9e88c:      	vpsrlq	$0x1a, %ymm5, %ymm1
   9e891:      	vpaddq	0xe0(%rsp), %ymm1, %ymm1
   9e89a:      	vpand	%ymm5, %ymm9, %ymm5
   9e89e:      	vmovdqa	0x100(%rsp), %ymm12
   9e8a7:      	vpsrlq	$0x1a, %ymm12, %ymm8
   9e8ad:      	vpaddq	0x60(%rsp), %ymm8, %ymm8
   9e8b3:      	vpand	%ymm9, %ymm12, %ymm12
   9e8b8:      	vpsrlq	$0x1a, %ymm1, %ymm14
   9e8bd:      	vpaddq	0xc0(%rsp), %ymm14, %ymm14
   9e8c6:      	vpand	%ymm1, %ymm9, %ymm1
   9e8ca:      	vpsrlq	$0x1a, %ymm8, %ymm15
   9e8d0:      	vpand	%ymm9, %ymm8, %ymm8
   9e8d5:      	vpaddq	%ymm6, %ymm8, %ymm6
   9e8d9:      	vpsllq	$0x2, %ymm15, %ymm8
   9e8df:      	vpaddq	%ymm15, %ymm8, %ymm8
   9e8e4:      	vpaddq	%ymm5, %ymm8, %ymm5
   9e8e8:      	vpsrlq	$0x1a, %ymm14, %ymm8
   9e8ee:      	vpaddq	%ymm12, %ymm8, %ymm12
   9e8f3:      	vpand	%ymm9, %ymm14, %ymm8
   9e8f8:      	vpaddq	%ymm0, %ymm8, %ymm0
   9e8fc:      	vpsrlq	$0x1a, %ymm5, %ymm8
   9e901:      	vpaddq	%ymm1, %ymm8, %ymm1
   9e905:      	vpaddq	%ymm4, %ymm1, %ymm4
   9e909:      	vpand	%ymm5, %ymm9, %ymm1
   9e90d:      	vpaddq	%ymm1, %ymm13, %ymm8
   9e911:      	vpsrlq	$0x1a, %ymm12, %ymm1
   9e917:      	vpaddq	%ymm1, %ymm6, %ymm1
   9e91b:      	vpand	%ymm9, %ymm12, %ymm5
   9e920:      	vpaddq	%ymm5, %ymm11, %ymm12
   9e924:      	vpaddq	0x1a0(%rsp), %ymm1, %ymm6
   9e92d:      	vpmuludq	%ymm2, %ymm8, %ymm1
   9e931:      	vpmuludq	%ymm7, %ymm4, %ymm5
   9e935:      	vmovdqa	0x140(%rsp), %ymm15
   9e93e:      	vpmuludq	%ymm0, %ymm15, %ymm11
   9e942:      	vmovdqa	0x1e0(%rsp), %ymm14
   9e94b:      	vpmuludq	%ymm14, %ymm12, %ymm13
   9e950:      	vpaddq	%ymm1, %ymm13, %ymm1
   9e954:      	vpaddq	%ymm1, %ymm11, %ymm1
   9e958:      	vpmuludq	0x1c0(%rsp), %ymm6, %ymm11
   9e961:      	vpaddq	%ymm5, %ymm11, %ymm5
   9e965:      	vpaddq	%ymm5, %ymm1, %ymm1
   9e969:      	vmovdqa	%ymm1, 0x40(%rsp)
   9e96f:      	vpmuludq	%ymm3, %ymm8, %ymm1
   9e973:      	vpmuludq	%ymm2, %ymm4, %ymm5
   9e977:      	vpmuludq	%ymm7, %ymm0, %ymm11
   9e97b:      	vpmuludq	%ymm15, %ymm12, %ymm13
   9e980:      	vpaddq	%ymm1, %ymm13, %ymm1
   9e984:      	vpaddq	%ymm1, %ymm11, %ymm1
   9e988:      	vpmuludq	%ymm6, %ymm14, %ymm11
   9e98c:      	vpaddq	%ymm5, %ymm11, %ymm5
   9e990:      	vpaddq	%ymm5, %ymm1, %ymm1
   9e994:      	vmovdqa	%ymm1, 0xe0(%rsp)
   9e99d:      	vmovdqa	0x200(%rsp), %ymm14
   9e9a6:      	vpmuludq	%ymm14, %ymm8, %ymm1
   9e9ab:      	vpmuludq	%ymm3, %ymm4, %ymm5
   9e9af:      	vpmuludq	%ymm2, %ymm0, %ymm11
   9e9b3:      	vpmuludq	%ymm7, %ymm12, %ymm13
   9e9b7:      	vpaddq	%ymm1, %ymm13, %ymm1
   9e9bb:      	vpaddq	%ymm1, %ymm11, %ymm1
   9e9bf:      	vpmuludq	%ymm6, %ymm15, %ymm11
   9e9c3:      	vmovdqa	0x2e0(%rsp), %ymm15
   9e9cc:      	vpaddq	%ymm5, %ymm11, %ymm5
   9e9d0:      	vpaddq	%ymm5, %ymm1, %ymm1
   9e9d4:      	vmovdqa	%ymm1, 0xc0(%rsp)
   9e9dd:      	vmovdqa	0x160(%rsp), %ymm13
   9e9e6:      	vpmuludq	%ymm13, %ymm8, %ymm1
   9e9eb:      	vpmuludq	%ymm4, %ymm14, %ymm5
   9e9ef:      	vpmuludq	%ymm2, %ymm12, %ymm11
   9e9f3:      	vpaddq	%ymm1, %ymm11, %ymm1
   9e9f7:      	vpmuludq	%ymm3, %ymm0, %ymm11
   9e9fb:      	vpaddq	%ymm1, %ymm11, %ymm1
   9e9ff:      	vpmuludq	%ymm7, %ymm6, %ymm11
   9ea03:      	vpaddq	%ymm5, %ymm11, %ymm5
   9ea07:      	vmovdqa	0x2c0(%rsp), %ymm11
   9ea10:      	vpaddq	%ymm5, %ymm1, %ymm1
   9ea14:      	vmovdqa	%ymm1, 0x100(%rsp)
   9ea1d:      	vpmuludq	0x180(%rsp), %ymm8, %ymm1
   9ea26:      	vpmuludq	%ymm3, %ymm12, %ymm5
   9ea2a:      	vpaddq	%ymm5, %ymm1, %ymm1
   9ea2e:      	vpmuludq	%ymm0, %ymm14, %ymm0
   9ea32:      	vpaddq	%ymm1, %ymm0, %ymm0
   9ea36:      	vpmuludq	%ymm4, %ymm13, %ymm1
   9ea3a:      	vpmuludq	%ymm2, %ymm6, %ymm4
   9ea3e:      	vpaddq	%ymm1, %ymm4, %ymm1
   9ea42:      	vpaddq	%ymm1, %ymm0, %ymm0
   9ea46:      	vmovdqa	%ymm0, 0x60(%rsp)
   9ea4c:      	subq	$-0x80, %r8
   9ea50:      	decq	%r10
   9ea53:      	jne	0x9e620 <toyos_crypto::arch::x86_64::poly1305::blocks+0xb60>
   9ea59:      	jmp	0x9ea91 <toyos_crypto::arch::x86_64::poly1305::blocks+0xfd1>
   9ea5b:      	xorl	%eax, %eax
   9ea5d:      	jmp	0x9f0cc <toyos_crypto::arch::x86_64::poly1305::blocks+0x160c>
   9ea62:      	vpxor	%xmm0, %xmm0, %xmm0
   9ea66:      	vmovdqa	%ymm0, 0xe0(%rsp)
   9ea6f:      	vmovdqa	%ymm0, 0xc0(%rsp)
   9ea78:      	vmovdqa	%ymm0, 0x100(%rsp)
   9ea81:      	vmovdqa	%ymm0, 0x60(%rsp)
   9ea87:      	vmovdqa	%ymm0, 0x40(%rsp)
   9ea8d:      	vmovdqa	%ymm5, %ymm15
   9ea91:      	vmovdqu	(%rsi), %ymm0
   9ea95:      	vmovdqu	0x20(%rsi), %ymm1
   9ea9a:      	vpunpckhqdq	%ymm1, %ymm0, %ymm3 # ymm3 = ymm0[1],ymm1[1],ymm0[3],ymm1[3]
   9ea9e:      	vpunpcklqdq	%ymm1, %ymm0, %ymm5 # ymm5 = ymm0[0],ymm1[0],ymm0[2],ymm1[2]
   9eaa2:      	vpsrlq	$0x34, %ymm5, %ymm0
   9eaa7:      	vpsllq	$0xc, %ymm3, %ymm1
   9eaac:      	vpor	%ymm0, %ymm1, %ymm6
   9eab0:      	vmovdqu	0x40(%rsi), %ymm0
   9eab5:      	vmovdqu	0x60(%rsi), %ymm1
   9eaba:      	vpunpcklqdq	%ymm1, %ymm0, %ymm2 # ymm2 = ymm0[0],ymm1[0],ymm0[2],ymm1[2]
   9eabe:      	vpunpckhqdq	%ymm1, %ymm0, %ymm1 # ymm1 = ymm0[1],ymm1[1],ymm0[3],ymm1[3]
   9eac2:      	vmovdqa	%ymm1, 0x160(%rsp)
   9eacb:      	vpsrlq	$0x34, %ymm2, %ymm0
   9ead0:      	vpsllq	$0xc, %ymm1, %ymm4
   9ead5:      	vpor	%ymm0, %ymm4, %ymm4
   9ead9:      	vpsrlq	$0x1a, %ymm15, %ymm0
   9eadf:      	vpaddq	%ymm0, %ymm11, %ymm7
   9eae3:      	vmovdqa	0xa0(%rsp), %ymm14
   9eaec:      	vpsrlq	$0x1a, %ymm14, %ymm0
   9eaf2:      	vpaddq	%ymm0, %ymm10, %ymm8
   9eaf6:      	vpsrlq	$0x1a, %ymm7, %ymm0
   9eafb:      	vpaddq	0x80(%rsp), %ymm0, %ymm9
   9eb04:      	vpbroadcastq	-0x94475(%rip), %ymm0 # 0xa698 <anon.06a5d9ca6d216076d14f4792906d843c.6.llvm.11130069727037220349+0x16b>
   9eb0d:      	vpsrlq	$0x1a, %ymm5, %ymm10
   9eb12:      	vpand	%ymm0, %ymm10, %ymm10
   9eb16:      	vpand	%ymm0, %ymm7, %ymm7
   9eb1a:      	vpaddq	%ymm7, %ymm10, %ymm7
   9eb1e:      	vpsrlq	$0x28, %ymm3, %ymm10
   9eb23:      	vpand	%ymm0, %ymm8, %ymm12
   9eb27:      	vpaddq	%ymm10, %ymm12, %ymm13
   9eb2c:      	vpand	%ymm0, %ymm15, %ymm10
   9eb30:      	vpsrlq	$0x1a, %ymm8, %ymm8
   9eb36:      	vpaddq	%ymm8, %ymm10, %ymm10
   9eb3b:      	vpsllq	$0x2, %ymm8, %ymm8
   9eb41:      	vpaddq	%ymm8, %ymm10, %ymm11
   9eb46:      	vpand	%ymm0, %ymm14, %ymm8
   9eb4a:      	vpsrlq	$0x1a, %ymm9, %ymm10
   9eb50:      	vpaddq	%ymm8, %ymm10, %ymm14
   9eb55:      	vpand	%ymm0, %ymm6, %ymm6
   9eb59:      	vpand	%ymm0, %ymm9, %ymm8
   9eb5d:      	vpaddq	%ymm6, %ymm8, %ymm8
   9eb61:      	vpsrlq	$0x1a, %ymm11, %ymm6
   9eb67:      	vpaddq	%ymm7, %ymm6, %ymm10
   9eb6b:      	vpand	%ymm0, %ymm5, %ymm5
   9eb6f:      	vpand	%ymm0, %ymm11, %ymm6
   9eb73:      	vpaddq	%ymm6, %ymm5, %ymm11
   9eb77:      	vpsrlq	$0xe, %ymm3, %ymm3
   9eb7c:      	vpand	%ymm0, %ymm3, %ymm3
   9eb80:      	vpand	%ymm0, %ymm14, %ymm5
   9eb84:      	vpaddq	%ymm5, %ymm3, %ymm12
   9eb88:      	vpsrlq	$0x1a, %ymm14, %ymm3
   9eb8e:      	vpbroadcastq	-0x944c7(%rip), %ymm9 # 0xa6d0 <anon.06a5d9ca6d216076d14f4792906d843c.6.llvm.11130069727037220349+0x1a3>
   9eb97:      	vpaddq	%ymm9, %ymm13, %ymm5
   9eb9c:      	vpaddq	%ymm3, %ymm5, %ymm13
   9eba0:      	vmovdqa	0x540(%rsp), %ymm1
   9eba9:      	vpmuludq	%ymm1, %ymm11, %ymm3
   9ebad:      	vmovdqa	0x360(%rsp), %ymm14
   9ebb6:      	vpmuludq	%ymm14, %ymm8, %ymm5
   9ebbb:      	vpaddq	%ymm3, %ymm5, %ymm3
   9ebbf:      	vmovdqa	0x340(%rsp), %ymm7
   9ebc8:      	vpmuludq	%ymm7, %ymm12, %ymm5
   9ebcc:      	vpaddq	%ymm5, %ymm3, %ymm3
   9ebd0:      	vpmuludq	0x320(%rsp), %ymm13, %ymm5
   9ebd9:      	vmovdqa	0x380(%rsp), %ymm15
   9ebe2:      	vpmuludq	%ymm15, %ymm10, %ymm6
   9ebe7:      	vpaddq	%ymm6, %ymm5, %ymm5
   9ebeb:      	vpaddq	%ymm5, %ymm3, %ymm3
   9ebef:      	vmovdqa	%ymm3, 0xa0(%rsp)
   9ebf8:      	vmovdqa	0x520(%rsp), %ymm3
   9ec01:      	vpmuludq	%ymm3, %ymm11, %ymm5
   9ec05:      	vpmuludq	%ymm15, %ymm8, %ymm6
   9ec0a:      	vpaddq	%ymm5, %ymm6, %ymm5
   9ec0e:      	vpmuludq	%ymm14, %ymm12, %ymm6
   9ec13:      	vpaddq	%ymm6, %ymm5, %ymm5
   9ec17:      	vpmuludq	%ymm7, %ymm13, %ymm6
   9ec1b:      	vpmuludq	%ymm1, %ymm10, %ymm7
   9ec1f:      	vpaddq	%ymm7, %ymm6, %ymm6
   9ec23:      	vpaddq	%ymm6, %ymm5, %ymm5
   9ec27:      	vmovdqa	%ymm5, 0x80(%rsp)
   9ec30:      	vmovdqa	0x4a0(%rsp), %ymm5
   9ec39:      	vpmuludq	%ymm5, %ymm11, %ymm6
   9ec3d:      	vpmuludq	%ymm1, %ymm8, %ymm7
   9ec41:      	vpaddq	%ymm6, %ymm7, %ymm6
   9ec45:      	vpmuludq	%ymm15, %ymm12, %ymm7
   9ec4a:      	vpaddq	%ymm7, %ymm6, %ymm6
   9ec4e:      	vpmuludq	%ymm14, %ymm13, %ymm7
   9ec53:      	vpmuludq	%ymm3, %ymm10, %ymm14
   9ec57:      	vpaddq	%ymm7, %ymm14, %ymm7
   9ec5b:      	vpaddq	%ymm7, %ymm6, %ymm6
   9ec5f:      	vmovdqa	%ymm6, 0x180(%rsp)
   9ec68:      	vmovdqa	0x440(%rsp), %ymm7
   9ec71:      	vpmuludq	%ymm7, %ymm11, %ymm6
   9ec75:      	vpmuludq	%ymm3, %ymm8, %ymm14
   9ec79:      	vpaddq	%ymm6, %ymm14, %ymm6
   9ec7d:      	vpmuludq	%ymm1, %ymm12, %ymm14
   9ec81:      	vpaddq	%ymm6, %ymm14, %ymm6
   9ec85:      	vpmuludq	%ymm15, %ymm13, %ymm14
   9ec8a:      	vpmuludq	%ymm5, %ymm10, %ymm15
   9ec8e:      	vpaddq	%ymm15, %ymm14, %ymm14
   9ec93:      	vpaddq	%ymm6, %ymm14, %ymm6
   9ec97:      	vmovdqa	%ymm6, 0x140(%rsp)
   9eca0:      	vpmuludq	0x420(%rsp), %ymm11, %ymm11
   9eca9:      	vpmuludq	%ymm7, %ymm10, %ymm10
   9ecad:      	vpmuludq	%ymm5, %ymm8, %ymm8
   9ecb1:      	vpaddq	%ymm11, %ymm8, %ymm8
   9ecb6:      	vpmuludq	%ymm3, %ymm12, %ymm11
   9ecba:      	vpaddq	%ymm11, %ymm8, %ymm8
   9ecbf:      	vpmuludq	%ymm1, %ymm13, %ymm11
   9ecc3:      	vpaddq	%ymm10, %ymm11, %ymm10
   9ecc8:      	vpaddq	%ymm10, %ymm8, %ymm8
   9eccd:      	vmovdqa	0x40(%rsp), %ymm1
   9ecd3:      	vpsrlq	$0x1a, %ymm1, %ymm10
   9ecd8:      	vpaddq	0xe0(%rsp), %ymm10, %ymm10
   9ece1:      	vmovdqa	0x100(%rsp), %ymm3
   9ecea:      	vpsrlq	$0x1a, %ymm3, %ymm11
   9ecef:      	vpaddq	0x60(%rsp), %ymm11, %ymm11
   9ecf5:      	vpsrlq	$0x1a, %ymm10, %ymm12
   9ecfb:      	vpaddq	0xc0(%rsp), %ymm12, %ymm12
   9ed04:      	vpsrlq	$0x1a, %ymm2, %ymm13
   9ed09:      	vpand	%ymm0, %ymm13, %ymm13
   9ed0d:      	vpand	%ymm0, %ymm10, %ymm10
   9ed11:      	vpaddq	%ymm13, %ymm10, %ymm13
   9ed16:      	vmovdqa	0x160(%rsp), %ymm5
   9ed1f:      	vpsrlq	$0x28, %ymm5, %ymm10
   9ed24:      	vpand	%ymm0, %ymm11, %ymm14
   9ed28:      	vpaddq	%ymm10, %ymm14, %ymm14
   9ed2d:      	vpand	%ymm0, %ymm1, %ymm10
   9ed31:      	vpsrlq	$0x1a, %ymm11, %ymm11
   9ed37:      	vpaddq	%ymm10, %ymm11, %ymm10
   9ed3c:      	vpsllq	$0x2, %ymm11, %ymm11
   9ed42:      	vpaddq	%ymm10, %ymm11, %ymm15
   9ed47:      	vpand	%ymm0, %ymm3, %ymm10
   9ed4b:      	vpsrlq	$0x1a, %ymm12, %ymm11
   9ed51:      	vpaddq	%ymm10, %ymm11, %ymm3
   9ed56:      	vpand	%ymm0, %ymm4, %ymm4
   9ed5a:      	vpand	%ymm0, %ymm12, %ymm10
   9ed5e:      	vpaddq	%ymm4, %ymm10, %ymm10
   9ed62:      	vpsrlq	$0x1a, %ymm15, %ymm4
   9ed68:      	vpaddq	%ymm4, %ymm13, %ymm11
   9ed6c:      	vpand	%ymm0, %ymm2, %ymm2
   9ed70:      	vpand	%ymm0, %ymm15, %ymm4
   9ed74:      	vpaddq	%ymm4, %ymm2, %ymm7
   9ed78:      	vpsrlq	$0xe, %ymm5, %ymm1
   9ed7d:      	vpand	%ymm0, %ymm1, %ymm1
   9ed81:      	vpand	%ymm0, %ymm3, %ymm4
   9ed85:      	vpaddq	%ymm4, %ymm1, %ymm6
   9ed89:      	vpaddq	%ymm9, %ymm14, %ymm4
   9ed8e:      	vpsrlq	$0x1a, %ymm3, %ymm3
   9ed93:      	vpaddq	%ymm3, %ymm4, %ymm12
   9ed97:      	vmovdqa	0x500(%rsp), %ymm5
   9eda0:      	vpmuludq	%ymm5, %ymm7, %ymm3
   9eda4:      	vmovdqa	0x3e0(%rsp), %ymm14
   9edad:      	vpmuludq	%ymm14, %ymm10, %ymm4
   9edb2:      	vpaddq	%ymm3, %ymm4, %ymm3
   9edb6:      	vmovdqa	0x3c0(%rsp), %ymm1
   9edbf:      	vpmuludq	%ymm1, %ymm6, %ymm4
   9edc3:      	vpaddq	%ymm4, %ymm3, %ymm3
   9edc7:      	vpmuludq	0x3a0(%rsp), %ymm12, %ymm4
   9edd0:      	vmovdqa	0x400(%rsp), %ymm15
   9edd9:      	vpmuludq	%ymm15, %ymm11, %ymm9
   9edde:      	vpaddq	%ymm4, %ymm9, %ymm4
   9ede2:      	vpaddq	%ymm4, %ymm3, %ymm2
   9ede6:      	vmovdqa	%ymm2, 0x40(%rsp)
   9edec:      	vmovdqa	0x4e0(%rsp), %ymm2
   9edf5:      	vpmuludq	%ymm2, %ymm7, %ymm3
   9edf9:      	vpmuludq	%ymm15, %ymm10, %ymm9
   9edfe:      	vpaddq	%ymm3, %ymm9, %ymm3
   9ee02:      	vpmuludq	%ymm6, %ymm14, %ymm9
   9ee06:      	vpaddq	%ymm3, %ymm9, %ymm3
   9ee0a:      	vpmuludq	%ymm1, %ymm12, %ymm9
   9ee0e:      	vpmuludq	%ymm5, %ymm11, %ymm13
   9ee12:      	vpaddq	%ymm13, %ymm9, %ymm9
   9ee17:      	vpaddq	%ymm3, %ymm9, %ymm9
   9ee1b:      	vmovdqa	0x4c0(%rsp), %ymm1
   9ee24:      	vpmuludq	%ymm1, %ymm7, %ymm3
   9ee28:      	vpmuludq	%ymm5, %ymm10, %ymm13
   9ee2c:      	vpaddq	%ymm3, %ymm13, %ymm3
   9ee30:      	vpmuludq	%ymm6, %ymm15, %ymm13
   9ee34:      	vpaddq	%ymm3, %ymm13, %ymm3
   9ee38:      	vpmuludq	%ymm14, %ymm12, %ymm13
   9ee3d:      	vpmuludq	%ymm2, %ymm11, %ymm14
   9ee41:      	vpaddq	%ymm14, %ymm13, %ymm13
   9ee46:      	vpaddq	%ymm3, %ymm13, %ymm13
   9ee4a:      	vmovdqa	0x480(%rsp), %ymm3
   9ee53:      	vpmuludq	%ymm3, %ymm7, %ymm4
   9ee57:      	vpmuludq	%ymm2, %ymm10, %ymm14
   9ee5b:      	vpaddq	%ymm4, %ymm14, %ymm4
   9ee5f:      	vpmuludq	%ymm5, %ymm6, %ymm14
   9ee63:      	vpaddq	%ymm4, %ymm14, %ymm4
   9ee67:      	vpmuludq	%ymm15, %ymm12, %ymm14
   9ee6c:      	vpmuludq	%ymm1, %ymm11, %ymm15
   9ee70:      	vpaddq	%ymm15, %ymm14, %ymm14
   9ee75:      	vpaddq	%ymm4, %ymm14, %ymm14
   9ee79:      	vpmuludq	0x460(%rsp), %ymm7, %ymm7
   9ee82:      	vpmuludq	%ymm3, %ymm11, %ymm3
   9ee86:      	vpmuludq	%ymm1, %ymm10, %ymm10
   9ee8a:      	vpaddq	%ymm7, %ymm10, %ymm7
   9ee8e:      	vpmuludq	%ymm2, %ymm6, %ymm1
   9ee92:      	vpaddq	%ymm1, %ymm7, %ymm1
   9ee96:      	vpmuludq	%ymm5, %ymm12, %ymm2
   9ee9a:      	vpaddq	%ymm3, %ymm2, %ymm2
   9ee9e:      	vpaddq	%ymm2, %ymm1, %ymm3
   9eea2:      	vmovdqa	0xa0(%rsp), %ymm2
   9eeab:      	vpsrlq	$0x1a, %ymm2, %ymm1
   9eeb0:      	vpaddq	0x80(%rsp), %ymm1, %ymm5
   9eeb9:      	vpand	%ymm0, %ymm2, %ymm2
   9eebd:      	vmovdqa	0x140(%rsp), %ymm4
   9eec6:      	vpsrlq	$0x1a, %ymm4, %ymm1
   9eecb:      	vpaddq	%ymm1, %ymm8, %ymm1
   9eecf:      	vpand	%ymm0, %ymm4, %ymm6
   9eed3:      	vpsrlq	$0x1a, %ymm5, %ymm8
   9eed8:      	vpaddq	0x180(%rsp), %ymm8, %ymm7
   9eee1:      	vpsrlq	$0x1a, %ymm1, %ymm8
   9eee6:      	vpaddq	%ymm2, %ymm8, %ymm2
   9eeea:      	vpsllq	$0x2, %ymm8, %ymm8
   9eef0:      	vpaddq	%ymm2, %ymm8, %ymm8
   9eef4:      	vpsrlq	$0x1a, %ymm7, %ymm2
   9eef9:      	vpaddq	%ymm6, %ymm2, %ymm2
   9eefd:      	vmovdqa	0x40(%rsp), %ymm4
   9ef03:      	vpsrlq	$0x1a, %ymm4, %ymm6
   9ef08:      	vpaddq	%ymm6, %ymm9, %ymm6
   9ef0c:      	vpsrlq	$0x1a, %ymm14, %ymm9
   9ef12:      	vpaddq	%ymm3, %ymm9, %ymm3
   9ef16:      	vpsrlq	$0x1a, %ymm6, %ymm9
   9ef1b:      	vpaddq	%ymm9, %ymm13, %ymm9
   9ef20:      	vpand	%ymm0, %ymm5, %ymm5
   9ef24:      	vpand	%ymm0, %ymm7, %ymm7
   9ef28:      	vpand	%ymm0, %ymm6, %ymm6
   9ef2c:      	vpaddq	%ymm6, %ymm5, %ymm5
   9ef30:      	vpsrlq	$0x1a, %ymm8, %ymm6
   9ef36:      	vpand	%ymm0, %ymm8, %ymm8
   9ef3a:      	vpand	%ymm0, %ymm4, %ymm4
   9ef3e:      	vpand	%ymm0, %ymm14, %ymm10
   9ef42:      	vpaddq	%ymm5, %ymm6, %ymm5
   9ef46:      	vpsrlq	$0x1a, %ymm3, %ymm6
   9ef4b:      	vpaddq	%ymm4, %ymm6, %ymm4
   9ef4f:      	vpsllq	$0x2, %ymm6, %ymm6
   9ef54:      	vpaddq	%ymm4, %ymm6, %ymm6
   9ef58:      	vpsrlq	$0x1a, %ymm9, %ymm4
   9ef5e:      	vpaddq	%ymm4, %ymm10, %ymm4
   9ef62:      	vpand	%ymm0, %ymm2, %ymm10
   9ef66:      	vpand	%ymm0, %ymm9, %ymm9
   9ef6a:      	vpaddq	%ymm7, %ymm9, %ymm7
   9ef6e:      	vpsrlq	$0x1a, %ymm6, %ymm9
   9ef73:      	vpaddq	%ymm5, %ymm9, %ymm9
   9ef77:      	vpand	%ymm0, %ymm6, %ymm5
   9ef7b:      	vpaddq	%ymm5, %ymm8, %ymm6
   9ef7f:      	vpand	%ymm0, %ymm4, %ymm5
   9ef83:      	vpaddq	%ymm5, %ymm10, %ymm5
   9ef87:      	vpshufd	$0xee, %xmm6, %xmm8     # xmm8 = xmm6[2,3,2,3]
   9ef8c:      	vextracti128	$0x1, %ymm6, %xmm10
   9ef92:      	vpaddq	%xmm6, %xmm8, %xmm8
   9ef96:      	vpermq	$0xff, %ymm6, %ymm6     # ymm6 = ymm6[3,3,3,3]
   9ef9c:      	vpaddq	%xmm6, %xmm10, %xmm6
   9efa0:      	vpaddq	%xmm6, %xmm8, %xmm6
   9efa4:      	vmovq	%xmm6, %rdx
   9efa9:      	vpshufd	$0xee, %xmm9, %xmm6     # xmm6 = xmm9[2,3,2,3]
   9efaf:      	vextracti128	$0x1, %ymm9, %xmm8
   9efb5:      	vpaddq	%xmm6, %xmm9, %xmm6
   9efb9:      	vpermq	$0xff, %ymm9, %ymm9     # ymm9 = ymm9[3,3,3,3]
   9efbf:      	vpaddq	%xmm9, %xmm8, %xmm8
   9efc4:      	vpaddq	%xmm6, %xmm8, %xmm6
   9efc8:      	vmovq	%xmm6, %rsi
   9efcd:      	vpshufd	$0xee, %xmm7, %xmm6     # xmm6 = xmm7[2,3,2,3]
   9efd2:      	vextracti128	$0x1, %ymm7, %xmm8
   9efd8:      	vpaddq	%xmm6, %xmm7, %xmm6
   9efdc:      	vpermq	$0xff, %ymm7, %ymm7     # ymm7 = ymm7[3,3,3,3]
   9efe2:      	vpaddq	%xmm7, %xmm8, %xmm7
   9efe6:      	vpaddq	%xmm7, %xmm6, %xmm6
   9efea:      	vmovq	%xmm6, %r9
   9efef:      	vpshufd	$0xee, %xmm5, %xmm6     # xmm6 = xmm5[2,3,2,3]
   9eff4:      	vextracti128	$0x1, %ymm5, %xmm7
   9effa:      	vpaddq	%xmm6, %xmm5, %xmm6
   9effe:      	vpermq	$0xff, %ymm5, %ymm5     # ymm5 = ymm5[3,3,3,3]
   9f004:      	vpaddq	%xmm5, %xmm7, %xmm5
   9f008:      	vpaddq	%xmm5, %xmm6, %xmm5
   9f00c:      	vmovq	%xmm5, %rcx
   9f011:      	movq	%rsi, %rdi
   9f014:      	shrq	$0x26, %rdi
   9f018:      	shlq	$0x1a, %rsi
   9f01c:      	movq	%r9, %r8
   9f01f:      	shrq	$0xc, %r8
   9f023:      	shlq	$0x34, %r9
   9f027:      	addq	%rdx, %r9
   9f02a:      	adcq	$0x0, %r8
   9f02e:      	addq	%rsi, %r9
   9f031:      	adcq	%rdi, %r8
   9f034:      	shlq	$0xe, %rcx
   9f038:      	addq	%r8, %rcx
   9f03b:      	movq	0x138(%rsp), %rax
   9f043:      	jb	0x9f0de <toyos_crypto::arch::x86_64::poly1305::blocks+0x161e>
   9f049:      	movabsq	$0x7fffffffffffff8, %rdx # imm = 0x7FFFFFFFFFFFFF8
   9f053:      	andq	%rdx, %rax
   9f056:      	vpsrlq	$0x1a, %ymm2, %ymm2
   9f05b:      	vpand	%ymm0, %ymm1, %ymm1
   9f05f:      	vpand	%ymm0, %ymm3, %ymm0
   9f063:      	vpaddq	%ymm0, %ymm1, %ymm0
   9f067:      	vpaddq	%ymm0, %ymm2, %ymm0
   9f06b:      	vpsrlq	$0x1a, %ymm4, %ymm1
   9f070:      	vpaddq	%ymm1, %ymm0, %ymm0
   9f074:      	vpshufd	$0xee, %xmm0, %xmm1     # xmm1 = xmm0[2,3,2,3]
   9f079:      	vextracti128	$0x1, %ymm0, %xmm2
   9f07f:      	vpermq	$0xff, %ymm0, %ymm3     # ymm3 = ymm0[3,3,3,3]
   9f085:      	vpaddq	%xmm1, %xmm0, %xmm0
   9f089:      	vpaddq	%xmm3, %xmm2, %xmm1
   9f08d:      	vpaddq	%xmm1, %xmm0, %xmm0
   9f091:      	vmovq	%xmm0, %rdx
   9f096:      	movq	%rdx, %rsi
   9f099:      	shlq	$0x28, %rsi
   9f09d:      	shrq	$0x18, %rdx
   9f0a1:      	addq	%rsi, %rcx
   9f0a4:      	adcq	$0x0, %rdx
   9f0a8:      	movq	%rdx, %rsi
   9f0ab:      	shrq	$0x2, %rsi
   9f0af:      	leaq	(%rsi,%rsi,4), %rsi
   9f0b3:      	andl	$0x3, %edx
   9f0b6:      	addq	%rsi, %r9
   9f0b9:      	adcq	$0x0, %rcx
   9f0bd:      	adcq	$0x0, %rdx
   9f0c1:      	movq	%r9, (%r11)
   9f0c4:      	movq	%rcx, 0x8(%r11)
   9f0c8:      	movq	%rdx, 0x10(%r11)
   9f0cc:      	leaq	-0x28(%rbp), %rsp
   9f0d0:      	popq	%rbx
   9f0d1:      	popq	%r12
   9f0d3:      	popq	%r13
   9f0d5:      	popq	%r14
   9f0d7:      	popq	%r15
   9f0d9:      	popq	%rbp
   9f0da:      	vzeroupper
   9f0dd:      	retq
   9f0de:      	leaq	0x7492b(%rip), %rdi     # 0x113a10 <anon.68c3b30278565fbd7c0b87acd371f0b5.8.llvm.12585340529057702454+0x18>
   9f0e5:      	vzeroupper
   9f0e8:      	callq	0x10bb90 <core::panicking::panic_const::panic_const_add_overflow>
