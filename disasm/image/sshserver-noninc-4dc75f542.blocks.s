
$SCRATCH/poly1305-inline/image/sshserver-noninc-4dc75f542:	file format elf64-x86-64

Disassembly of section .text:

0000000000091b70 <toyos_crypto::arch::x86_64::poly1305::blocks>:
   91b70:      	pushq	%rbp
   91b71:      	movq	%rsp, %rbp
   91b74:      	pushq	%r15
   91b76:      	pushq	%r14
   91b78:      	pushq	%r13
   91b7a:      	pushq	%r12
   91b7c:      	pushq	%rbx
   91b7d:      	andq	$-0x20, %rsp
   91b81:      	subq	$0x760, %rsp            # imm = 0x760
   91b88:      	movq	%rdx, %r15
   91b8b:      	movq	(%rdi), %r14
   91b8e:      	movq	0x8(%rdi), %r9
   91b92:      	movq	0x10(%rdi), %r12
   91b96:      	movq	(%rsi), %rdi
   91b99:      	movq	0x8(%rsi), %rax
   91b9d:      	movl	%edi, %edx
   91b9f:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
   91ba5:      	movq	%rax, %r8
   91ba8:      	shldq	$0xc, %rdi, %r8
   91bad:      	shrq	$0x1a, %rdi
   91bb1:      	andl	$0x3ffffff, %edi        # imm = 0x3FFFFFF
   91bb7:      	andl	$0x3ffffff, %r8d        # imm = 0x3FFFFFF
   91bbe:      	shrq	$0xe, %rax
   91bc2:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
   91bc7:      	vmovd	%edx, %xmm0
   91bcb:      	vmovq	0xd(%rsi), %xmm1
   91bd0:      	vmovdqa	%ymm0, 0x220(%rsp)
   91bd9:      	vmovd	%edi, %xmm0
   91bdd:      	vmovdqa	%ymm0, 0x240(%rsp)
   91be6:      	vmovd	%r8d, %xmm0
   91beb:      	vmovdqa	%ymm0, 0x260(%rsp)
   91bf4:      	vmovd	%eax, %xmm0
   91bf8:      	vmovdqa	%ymm0, 0x280(%rsp)
   91c01:      	vmovdqa	%ymm1, 0x2a0(%rsp)
   91c0a:      	movq	%rcx, %r13
   91c0d:      	shrq	$0x3, %r13
   91c11:      	je	0x92f7f <toyos_crypto::arch::x86_64::poly1305::blocks+0x140f>
   91c17:      	movq	%rsi, 0xa8(%rsp)
   91c1f:      	movq	%rcx, 0xb0(%rsp)
   91c27:      	movq	%r12, %rax
   91c2a:      	mulq	%r9
   91c2d:      	movq	%rdx, %rdi
   91c30:      	movq	%r9, %rcx
   91c33:      	movq	%rax, %r9
   91c36:      	movq	%r14, %rax
   91c39:      	mulq	%r14
   91c3c:      	movq	%rdx, %r10
   91c3f:      	movq	%rax, %rsi
   91c42:      	addq	%r9, %rsi
   91c45:      	adcq	%rdi, %r10
   91c48:      	movq	%r14, %rax
   91c4b:      	mulq	%rcx
   91c4e:      	movq	%rcx, %r8
   91c51:      	movq	%rcx, 0x40(%rsp)
   91c56:      	shldq	$0x1, %rax, %rdx
   91c5b:      	addq	%rax, %rax
   91c5e:      	addq	%r10, %rax
   91c61:      	adcq	$0x0, %rdx
   91c65:      	movl	%edx, %edi
   91c67:      	andl	$0x3, %edi
   91c6a:      	shrq	$0x2, %rdx
   91c6e:      	leaq	(%rdx,%rdx,4), %rbx
   91c72:      	addq	%rsi, %rbx
   91c75:      	adcq	$0x0, %rax
   91c79:      	movq	%rdi, %rcx
   91c7c:      	adcq	$0x0, %rcx
   91c80:      	movq	%rcx, 0x80(%rsp)
   91c88:      	movq	%rax, %r11
   91c8b:      	movq	%rax, 0x200(%rsp)
   91c93:      	mulq	%r14
   91c96:      	movq	%rax, %rdi
   91c99:      	movq	%rdx, %r9
   91c9c:      	imulq	%r14, %rcx
   91ca0:      	movq	%rbx, %rax
   91ca3:      	movq	%rbx, 0x1c0(%rsp)
   91cab:      	mulq	%r8
   91cae:      	movq	%rdx, %rsi
   91cb1:      	movq	%rax, %r10
   91cb4:      	addq	%rdi, %r10
   91cb7:      	adcq	%r9, %rsi
   91cba:      	movq	%r11, %rax
   91cbd:      	movq	%r12, 0x60(%rsp)
   91cc2:      	mulq	%r12
   91cc5:      	movq	%rdx, %r9
   91cc8:      	movq	%rax, %r11
   91ccb:      	movq	%rbx, %rax
   91cce:      	mulq	%r14
   91cd1:      	movq	%rdx, %rbx
   91cd4:      	movq	%rax, %rdi
   91cd7:      	addq	%r11, %rdi
   91cda:      	adcq	%r9, %rbx
   91cdd:      	addq	%r10, %rbx
   91ce0:      	adcq	$0x0, %rsi
   91ce4:      	movq	0x80(%rsp), %rax
   91cec:      	mulq	%r12
   91cef:      	addq	%rbx, %rax
   91cf2:      	adcq	%rsi, %rdx
   91cf5:      	addq	%rcx, %rdx
   91cf8:      	movl	%edx, %r8d
   91cfb:      	andl	$0x3, %r8d
   91cff:      	shrq	$0x2, %rdx
   91d03:      	leaq	(%rdx,%rdx,4), %rbx
   91d07:      	addq	%rdi, %rbx
   91d0a:      	adcq	$0x0, %rax
   91d0e:      	adcq	$0x0, %r8
   91d12:      	movq	%r8, %rcx
   91d15:      	movq	%r8, 0x1e0(%rsp)
   91d1d:      	movq	%rax, %r11
   91d20:      	movq	%rax, 0x1a0(%rsp)
   91d28:      	movq	%r14, %r12
   91d2b:      	mulq	%r14
   91d2e:      	movq	%rax, %rdi
   91d31:      	movq	%rdx, %r9
   91d34:      	imulq	%r14, %rcx
   91d38:      	movq	%r14, 0xb8(%rsp)
   91d40:      	movq	%rbx, %rax
   91d43:      	movq	%rbx, 0x180(%rsp)
   91d4b:      	mulq	0x40(%rsp)
   91d50:      	movq	%rdx, %rsi
   91d53:      	movq	%rax, %r10
   91d56:      	addq	%rdi, %r10
   91d59:      	adcq	%r9, %rsi
   91d5c:      	movq	%r11, %rax
   91d5f:      	movq	0x60(%rsp), %r14
   91d64:      	mulq	%r14
   91d67:      	movq	%rdx, %r9
   91d6a:      	movq	%rax, %r11
   91d6d:      	movq	%rbx, %rax
   91d70:      	mulq	%r12
   91d73:      	movq	%rdx, %rbx
   91d76:      	movq	%rax, %rdi
   91d79:      	addq	%r11, %rdi
   91d7c:      	adcq	%r9, %rbx
   91d7f:      	addq	%r10, %rbx
   91d82:      	adcq	$0x0, %rsi
   91d86:      	movq	%r8, %rax
   91d89:      	mulq	%r14
   91d8c:      	addq	%rbx, %rax
   91d8f:      	movq	%rax, %r9
   91d92:      	adcq	%rsi, %rdx
   91d95:      	addq	%rcx, %rdx
   91d98:      	movl	%edx, %eax
   91d9a:      	andl	$0x3, %eax
   91d9d:      	shrq	$0x2, %rdx
   91da1:      	leaq	(%rdx,%rdx,4), %rsi
   91da5:      	addq	%rdi, %rsi
   91da8:      	adcq	$0x0, %r9
   91dac:      	movq	%r9, %r10
   91daf:      	adcq	$0x0, %rax
   91db3:      	movq	%rax, %r12
   91db6:      	movq	%rax, 0x3a0(%rsp)
   91dbe:      	mulq	%r14
   91dc1:      	movq	%r14, %rdi
   91dc4:      	movq	%rdx, 0x160(%rsp)
   91dcc:      	movq	%rax, 0x38(%rsp)
   91dd1:      	movq	%rsi, %rax
   91dd4:      	movq	%rsi, 0x380(%rsp)
   91ddc:      	movq	0x40(%rsp), %r8
   91de1:      	mulq	%r8
   91de4:      	movq	%rdx, %r9
   91de7:      	movq	%rax, %r11
   91dea:      	movq	%r10, %rcx
   91ded:      	movq	%r10, 0x3c0(%rsp)
   91df5:      	movq	%r10, %rax
   91df8:      	movq	0xb8(%rsp), %r14
   91e00:      	mulq	%r14
   91e03:      	movq	%rdx, %r10
   91e06:      	movq	%rax, %rbx
   91e09:      	addq	%r11, %rbx
   91e0c:      	adcq	%r9, %r10
   91e0f:      	movq	%rsi, %rax
   91e12:      	mulq	%r14
   91e15:      	movq	%rdx, %r9
   91e18:      	movq	%rax, %r11
   91e1b:      	movq	%rcx, %rax
   91e1e:      	movq	%rdi, %rsi
   91e21:      	mulq	%rdi
   91e24:      	addq	%r11, %rax
   91e27:      	adcq	%r9, %rdx
   91e2a:      	addq	%rbx, %rdx
   91e2d:      	adcq	$0x0, %r10
   91e31:      	addq	0x38(%rsp), %rdx
   91e36:      	adcq	0x160(%rsp), %r10
   91e3e:      	movq	%r12, %rdi
   91e41:      	imulq	%r14, %rdi
   91e45:      	addq	%r10, %rdi
   91e48:      	movq	%rdi, %rcx
   91e4b:      	shrq	$0x2, %rcx
   91e4f:      	leaq	(%rcx,%rcx,4), %r12
   91e53:      	andl	$0x3, %edi
   91e56:      	addq	%rax, %r12
   91e59:      	movq	%rdx, %rcx
   91e5c:      	adcq	$0x0, %rcx
   91e60:      	adcq	$0x0, %rdi
   91e64:      	movq	%rdi, %rax
   91e67:      	movq	%rdi, 0x160(%rsp)
   91e6f:      	mulq	%rsi
   91e72:      	movq	%rdx, 0x30(%rsp)
   91e77:      	movq	%rax, 0x28(%rsp)
   91e7c:      	movq	%r12, 0x360(%rsp)
   91e84:      	movq	%r12, %rax
   91e87:      	mulq	%r8
   91e8a:      	movq	%rdx, %r9
   91e8d:      	movq	%rax, %r10
   91e90:      	movq	%rcx, %rax
   91e93:      	movq	%rcx, 0x38(%rsp)
   91e98:      	mulq	%r14
   91e9b:      	movq	%rdx, %rbx
   91e9e:      	movq	%rax, %r11
   91ea1:      	addq	%r10, %r11
   91ea4:      	adcq	%r9, %rbx
   91ea7:      	movq	%r12, %rax
   91eaa:      	mulq	%r14
   91ead:      	movq	%r14, %r10
   91eb0:      	movq	%rdx, %r9
   91eb3:      	movq	%rax, %r12
   91eb6:      	movq	%rcx, %rax
   91eb9:      	mulq	%rsi
   91ebc:      	movq	%rdx, %r14
   91ebf:      	addq	%r12, %rax
   91ec2:      	adcq	%r9, %r14
   91ec5:      	addq	%r11, %r14
   91ec8:      	adcq	$0x0, %rbx
   91ecc:      	addq	0x28(%rsp), %r14
   91ed1:      	adcq	0x30(%rsp), %rbx
   91ed6:      	movq	%r10, %rsi
   91ed9:      	imulq	%r10, %rdi
   91edd:      	addq	%rbx, %rdi
   91ee0:      	movq	%rdi, %rcx
   91ee3:      	shrq	$0x2, %rcx
   91ee7:      	leaq	(%rcx,%rcx,4), %r10
   91eeb:      	andl	$0x3, %edi
   91eee:      	addq	%rax, %r10
   91ef1:      	adcq	$0x0, %r14
   91ef5:      	adcq	$0x0, %rdi
   91ef9:      	movq	%rdi, %rax
   91efc:      	movq	%rdi, 0x30(%rsp)
   91f01:      	movq	0x60(%rsp), %r11
   91f06:      	mulq	%r11
   91f09:      	movq	%rdx, 0x20(%rsp)
   91f0e:      	movq	%rax, 0x18(%rsp)
   91f13:      	movq	%r10, %rax
   91f16:      	movq	%r10, 0x28(%rsp)
   91f1b:      	mulq	%r8
   91f1e:      	movq	%rdx, %r9
   91f21:      	movq	%rax, %rbx
   91f24:      	movq	%r14, %rax
   91f27:      	mulq	%rsi
   91f2a:      	movq	%rdx, %r12
   91f2d:      	movq	%rax, %rcx
   91f30:      	addq	%rbx, %rcx
   91f33:      	adcq	%r9, %r12
   91f36:      	movq	%r10, %rax
   91f39:      	mulq	%rsi
   91f3c:      	movq	%rsi, %r8
   91f3f:      	movq	%rdx, %r9
   91f42:      	movq	%rax, %rsi
   91f45:      	movq	%r14, %rax
   91f48:      	mulq	%r11
   91f4b:      	movq	%r11, %r10
   91f4e:      	movq	%rdx, %rbx
   91f51:      	addq	%rsi, %rax
   91f54:      	adcq	%r9, %rbx
   91f57:      	addq	%rcx, %rbx
   91f5a:      	adcq	$0x0, %r12
   91f5e:      	addq	0x18(%rsp), %rbx
   91f63:      	adcq	0x20(%rsp), %r12
   91f68:      	movq	%rdi, %r11
   91f6b:      	imulq	%r8, %r11
   91f6f:      	addq	%r12, %r11
   91f72:      	movq	%r11, %rcx
   91f75:      	shrq	$0x2, %rcx
   91f79:      	leaq	(%rcx,%rcx,4), %r12
   91f7d:      	andl	$0x3, %r11d
   91f81:      	addq	%rax, %r12
   91f84:      	adcq	$0x0, %rbx
   91f88:      	adcq	$0x0, %r11
   91f8c:      	movq	%r11, %rax
   91f8f:      	mulq	%r10
   91f92:      	movq	%rdx, 0x20(%rsp)
   91f97:      	movq	%rax, 0x18(%rsp)
   91f9c:      	movq	%r12, %rax
   91f9f:      	mulq	0x40(%rsp)
   91fa4:      	movq	%rdx, %rsi
   91fa7:      	movq	%rax, %rcx
   91faa:      	movq	%rbx, %rax
   91fad:      	mulq	%r8
   91fb0:      	movq	%r8, %rdi
   91fb3:      	movq	%rdx, %r9
   91fb6:      	movq	%rax, %r8
   91fb9:      	addq	%rcx, %r8
   91fbc:      	adcq	%rsi, %r9
   91fbf:      	movq	%r12, %rax
   91fc2:      	mulq	%rdi
   91fc5:      	movq	%rdx, %rcx
   91fc8:      	movq	%rax, %rsi
   91fcb:      	movq	%rbx, %rax
   91fce:      	mulq	%r10
   91fd1:      	addq	%rsi, %rax
   91fd4:      	adcq	%rcx, %rdx
   91fd7:      	addq	%r8, %rdx
   91fda:      	adcq	$0x0, %r9
   91fde:      	addq	0x18(%rsp), %rdx
   91fe3:      	adcq	0x20(%rsp), %r9
   91fe8:      	movq	%r11, %rcx
   91feb:      	imulq	%rdi, %rcx
   91fef:      	addq	%r9, %rcx
   91ff2:      	movq	%rcx, %rsi
   91ff5:      	shrq	$0x2, %rsi
   91ff9:      	leaq	(%rsi,%rsi,4), %rsi
   91ffd:      	andl	$0x3, %ecx
   92000:      	addq	%rax, %rsi
   92003:      	adcq	$0x0, %rdx
   92007:      	adcq	$0x0, %rcx
   9200b:      	movl	%esi, %r8d
   9200e:      	andl	$0x3ffffff, %r8d        # imm = 0x3FFFFFF
   92015:      	movq	%rdx, %rax
   92018:      	shldq	$0xc, %rsi, %rax
   9201d:      	shrq	$0x1a, %rsi
   92021:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
   92027:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
   9202c:      	shldq	$0x18, %rdx, %rcx
   92031:      	shrq	$0xe, %rdx
   92035:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
   9203b:      	movq	%r8, 0x3e0(%rsp)
   92043:      	movq	%rsi, 0x3e8(%rsp)
   9204b:      	movq	%rax, 0x3f0(%rsp)
   92053:      	movq	%rdx, 0x3f8(%rsp)
   9205b:      	movq	%rcx, 0x400(%rsp)
   92063:      	movq	%r8, 0x408(%rsp)
   9206b:      	movq	%rsi, 0x410(%rsp)
   92073:      	movq	%rax, 0x418(%rsp)
   9207b:      	vmovdqu	0x3e0(%rsp), %xmm0
   92084:      	vpinsrq	$0x1, %r8, %xmm0, %xmm1
   9208a:      	vmovdqu	0x3e8(%rsp), %xmm0
   92093:      	vpinsrq	$0x1, %rsi, %xmm0, %xmm2
   92099:      	vmovq	%r8, %xmm4
   9209e:      	vmovdqu	0x3f0(%rsp), %xmm3
   920a7:      	vmovdqu	0x3f8(%rsp), %xmm5
   920b0:      	vmovdqu	0x400(%rsp), %xmm0
   920b9:      	movq	%r8, 0x3e0(%rsp)
   920c1:      	vmovq	%rsi, %xmm13
   920c6:      	vpinsrq	$0x1, %rax, %xmm3, %xmm7
   920cc:      	movq	%rsi, 0x3e8(%rsp)
   920d4:      	vmovq	%rax, %xmm12
   920d9:      	vpinsrq	$0x1, %rdx, %xmm5, %xmm8
   920df:      	movq	%rax, 0x3f0(%rsp)
   920e7:      	vmovq	%rdx, %xmm11
   920ec:      	movq	%rdx, 0x3f8(%rsp)
   920f4:      	movq	0x28(%rsp), %rsi
   920f9:      	movl	%esi, %edx
   920fb:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
   92101:      	movq	%r14, %rax
   92104:      	shldq	$0xc, %rsi, %rax
   92109:      	shrq	$0x1a, %rsi
   9210d:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
   92113:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
   92118:      	movq	%rcx, 0x400(%rsp)
   92120:      	movq	%rdx, 0x408(%rsp)
   92128:      	movq	%rsi, 0x410(%rsp)
   92130:      	movq	%rax, 0x418(%rsp)
   92138:      	vmovdqu	0x3e0(%rsp), %xmm3
   92141:      	vpinsrq	$0x1, %rdx, %xmm3, %xmm6
   92147:      	vpinsrq	$0x1, %rcx, %xmm0, %xmm14
   9214d:      	vmovq	%rcx, %xmm15
   92152:      	movl	%r12d, %ecx
   92155:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
   9215b:      	vmovq	%rcx, %xmm10
   92160:      	vmovdqu	0x3e8(%rsp), %xmm0
   92169:      	vpinsrq	$0x1, %rsi, %xmm0, %xmm0
   9216f:      	vmovdqa	%ymm0, 0x60(%rsp)
   92175:      	movq	%rbx, %rcx
   92178:      	shldq	$0xc, %r12, %rcx
   9217d:      	movq	0x360(%rsp), %r8
   92185:      	movl	%r8d, %edx
   92188:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
   9218e:      	vmovq	%rdx, %xmm3
   92193:      	shrq	$0x1a, %r12
   92197:      	andl	$0x3ffffff, %r12d       # imm = 0x3FFFFFF
   9219e:      	vmovq	%r12, %xmm5
   921a3:      	movq	0x38(%rsp), %rsi
   921a8:      	movq	%rsi, %rdx
   921ab:      	shldq	$0xc, %r8, %rdx
   921b0:      	shrq	$0x1a, %r8
   921b4:      	andl	$0x3ffffff, %r8d        # imm = 0x3FFFFFF
   921bb:      	vmovq	%r8, %xmm9
   921c0:      	vpbroadcastq	%xmm4, %ymm4
   921c5:      	vpblendd	$0xf0, %ymm4, %ymm1, %ymm0 # ymm0 = ymm1[0,1,2,3],ymm4[4,5,6,7]
   921cb:      	vmovdqu	0x3f0(%rsp), %xmm1
   921d4:      	vpinsrq	$0x1, %rax, %xmm1, %xmm1
   921da:      	vpbroadcastq	%xmm13, %ymm4
   921df:      	vpblendd	$0xf0, %ymm4, %ymm2, %ymm13 # ymm13 = ymm2[0,1,2,3],ymm4[4,5,6,7]
   921e5:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
   921eb:      	vmovq	%rcx, %xmm4
   921f0:      	vpbroadcastq	%xmm12, %ymm2
   921f5:      	vpblendd	$0xf0, %ymm2, %ymm7, %ymm12 # ymm12 = ymm7[0,1,2,3],ymm2[4,5,6,7]
   921fb:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
   92201:      	vmovq	%rdx, %xmm7
   92206:      	vpbroadcastq	%xmm11, %ymm2
   9220b:      	vpblendd	$0xf0, %ymm2, %ymm8, %ymm8 # ymm8 = ymm8[0,1,2,3],ymm2[4,5,6,7]
   92211:      	movq	0x30(%rsp), %rax
   92216:      	shldq	$0x18, %r14, %rax
   9221b:      	shrq	$0xe, %r14
   9221f:      	andl	$0x3ffffff, %r14d       # imm = 0x3FFFFFF
   92226:      	vmovdqu	0x3f8(%rsp), %xmm2
   9222f:      	vpinsrq	$0x1, %r14, %xmm2, %xmm2
   92235:      	vmovdqa	%ymm2, 0x360(%rsp)
   9223e:      	vpbroadcastq	%xmm15, %ymm2
   92243:      	vpblendd	$0xf0, %ymm2, %ymm14, %ymm11 # ymm11 = ymm14[0,1,2,3],ymm2[4,5,6,7]
   92249:      	shldq	$0x18, %rbx, %r11
   9224e:      	shrq	$0xe, %rbx
   92252:      	andl	$0x3ffffff, %ebx        # imm = 0x3FFFFFF
   92258:      	vmovq	%rbx, %xmm2
   9225d:      	vmovdqa	%ymm0, 0x580(%rsp)
   92266:      	vpsllq	$0x2, %ymm13, %ymm0
   9226c:      	vpaddq	%ymm0, %ymm13, %ymm0
   92270:      	vmovdqa	%ymm13, 0x5a0(%rsp)
   92279:      	vpsllq	$0x2, %ymm12, %ymm13
   9227f:      	vpaddq	%ymm12, %ymm13, %ymm13
   92284:      	vmovdqa	%ymm12, 0x5c0(%rsp)
   9228d:      	vpsllq	$0x2, %ymm8, %ymm12
   92293:      	vpaddq	%ymm8, %ymm12, %ymm12
   92298:      	vmovdqa	%ymm8, 0x5e0(%rsp)
   922a1:      	vpsllq	$0x2, %ymm11, %ymm8
   922a7:      	vpaddq	%ymm11, %ymm8, %ymm15
   922ac:      	vmovdqa	%ymm11, 0x600(%rsp)
   922b5:      	vmovdqu	0x400(%rsp), %xmm8
   922be:      	vpinsrq	$0x1, %rax, %xmm8, %xmm8
   922c4:      	vmovdqa	%ymm0, 0x500(%rsp)
   922cd:      	movq	%rsi, %rax
   922d0:      	movq	0x160(%rsp), %rcx
   922d8:      	shldq	$0x18, %rsi, %rcx
   922dd:      	shrq	$0xe, %rax
   922e1:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
   922e6:      	vmovq	%rax, %xmm14
   922eb:      	vmovdqa	%ymm13, 0x520(%rsp)
   922f4:      	vmovq	%r11, %xmm13
   922f9:      	vmovdqa	%ymm12, 0x540(%rsp)
   92302:      	vmovq	%rcx, %xmm12
   92307:      	movq	0x380(%rsp), %rdx
   9230f:      	movl	%edx, %eax
   92311:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
   92316:      	movq	%rax, 0xc0(%rsp)
   9231e:      	movq	0x3c0(%rsp), %rcx
   92326:      	movq	%rcx, %rax
   92329:      	shldq	$0xc, %rdx, %rax
   9232e:      	shrq	$0x1a, %rdx
   92332:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
   92338:      	movq	%rdx, 0xc8(%rsp)
   92340:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
   92345:      	movq	%rax, 0xd0(%rsp)
   9234d:      	vmovdqa	%ymm15, 0x560(%rsp)
   92356:      	vpbroadcastq	%xmm10, %ymm0
   9235b:      	movq	%rcx, %rax
   9235e:      	movq	0x3a0(%rsp), %rsi
   92366:      	shldq	$0x18, %rcx, %rsi
   9236b:      	vpblendd	$0x30, %ymm0, %ymm6, %ymm0 # ymm0 = ymm6[0,1,2,3],ymm0[4,5],ymm6[6,7]
   92371:      	shrq	$0xe, %rax
   92375:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
   9237a:      	movq	%rax, 0xd8(%rsp)
   92382:      	movq	0x1c0(%rsp), %rdx
   9238a:      	movl	%edx, %ecx
   9238c:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
   92392:      	movq	%rsi, 0xe0(%rsp)
   9239a:      	movq	0x200(%rsp), %rsi
   923a2:      	movq	%rsi, %rax
   923a5:      	shldq	$0xc, %rdx, %rax
   923aa:      	shrq	$0x1a, %rdx
   923ae:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
   923b4:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
   923b9:      	movq	%rcx, 0xe8(%rsp)
   923c1:      	movq	%rdx, 0xf0(%rsp)
   923c9:      	movq	%rax, 0xf8(%rsp)
   923d1:      	vmovdqu	0xc0(%rsp), %xmm6
   923da:      	vpinsrq	$0x1, %rcx, %xmm6, %xmm11
   923e0:      	movq	0x180(%rsp), %r8
   923e8:      	movl	%r8d, %ecx
   923eb:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
   923f1:      	vmovq	%rcx, %xmm10
   923f6:      	vpbroadcastq	%xmm3, %ymm3
   923fb:      	vpblendd	$0xc0, %ymm3, %ymm0, %ymm15 # ymm15 = ymm0[0,1,2,3,4,5],ymm3[6,7]
   92401:      	vpbroadcastq	%xmm5, %ymm0
   92406:      	vpblendd	$0xcf, 0x60(%rsp), %ymm0, %ymm0 # ymm0 = mem[0,1,2,3],ymm0[4,5],mem[6,7]
   9240e:      	vpbroadcastq	%xmm9, %ymm5
   92413:      	vmovdqu	0xc8(%rsp), %xmm3
   9241c:      	vpinsrq	$0x1, %rdx, %xmm3, %xmm6
   92422:      	movq	%rdi, %rdx
   92425:      	movl	%edx, %ecx
   92427:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
   9242d:      	vmovq	%rcx, %xmm3
   92432:      	movq	0x1a0(%rsp), %rdi
   9243a:      	movq	%rdi, %rcx
   9243d:      	shldq	$0xc, %r8, %rcx
   92442:      	vpblendd	$0xc0, %ymm5, %ymm0, %ymm9 # ymm9 = ymm0[0,1,2,3,4,5],ymm5[6,7]
   92448:      	shrq	$0x1a, %r8
   9244c:      	andl	$0x3ffffff, %r8d        # imm = 0x3FFFFFF
   92453:      	vmovq	%r8, %xmm5
   92458:      	vpbroadcastq	%xmm4, %ymm0
   9245d:      	vpblendd	$0x30, %ymm0, %ymm1, %ymm0 # ymm0 = ymm1[0,1,2,3],ymm0[4,5],ymm1[6,7]
   92463:      	vpbroadcastq	%xmm7, %ymm1
   92468:      	vpblendd	$0xc0, %ymm1, %ymm0, %ymm0 # ymm0 = ymm0[0,1,2,3,4,5],ymm1[6,7]
   9246e:      	vmovdqu	0xd0(%rsp), %xmm1
   92477:      	vpinsrq	$0x1, %rax, %xmm1, %xmm1
   9247d:      	movq	0x40(%rsp), %r8
   92482:      	movq	%r8, %rax
   92485:      	shldq	$0xc, %rdx, %rax
   9248a:      	shrq	$0x1a, %rdx
   9248e:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
   92494:      	vmovq	%rdx, %xmm4
   92499:      	vpbroadcastq	%xmm2, %ymm2
   9249e:      	vpblendd	$0xcf, 0x360(%rsp), %ymm2, %ymm7 # ymm7 = mem[0,1,2,3],ymm2[4,5],mem[6,7]
   924a9:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
   924af:      	vmovq	%rcx, %xmm2
   924b4:      	vpbroadcastq	%xmm14, %ymm14
   924b9:      	vpblendd	$0xc0, %ymm14, %ymm7, %ymm14 # ymm14 = ymm7[0,1,2,3,4,5],ymm14[6,7]
   924bf:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
   924c4:      	vmovq	%rax, %xmm7
   924c9:      	vpbroadcastq	%xmm13, %ymm13
   924ce:      	movq	0x80(%rsp), %rdx
   924d6:      	movq	%rsi, %rax
   924d9:      	shldq	$0x18, %rsi, %rdx
   924de:      	vpblendd	$0x30, %ymm13, %ymm8, %ymm13 # ymm13 = ymm8[0,1,2,3],ymm13[4,5],ymm8[6,7]
   924e4:      	shrq	$0xe, %rax
   924e8:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
   924ed:      	vmovdqu	0xd8(%rsp), %xmm8
   924f6:      	vpinsrq	$0x1, %rax, %xmm8, %xmm8
   924fc:      	vpbroadcastq	%xmm12, %ymm12
   92501:      	vpblendd	$0xc0, %ymm12, %ymm13, %ymm12 # ymm12 = ymm13[0,1,2,3,4,5],ymm12[6,7]
   92507:      	vpsllq	$0x2, %ymm9, %ymm13
   9250d:      	vpaddq	%ymm9, %ymm13, %ymm13
   92512:      	vmovdqa	%ymm15, 0x6a0(%rsp)
   9251b:      	vpsllq	$0x2, %ymm0, %ymm15
   92520:      	vpaddq	%ymm0, %ymm15, %ymm15
   92524:      	vmovdqa	%ymm9, 0x6c0(%rsp)
   9252d:      	vpsllq	$0x2, %ymm14, %ymm9
   92533:      	vpaddq	%ymm14, %ymm9, %ymm9
   92538:      	vmovdqa	%ymm0, 0x6e0(%rsp)
   92541:      	vpsllq	$0x2, %ymm12, %ymm0
   92547:      	vpaddq	%ymm0, %ymm12, %ymm0
   9254b:      	vmovdqa	%ymm14, 0x700(%rsp)
   92554:      	vmovdqa	%ymm12, 0x720(%rsp)
   9255d:      	movq	%rdi, %rax
   92560:      	movq	0x1e0(%rsp), %rsi
   92568:      	shldq	$0x18, %rdi, %rsi
   9256d:      	shrq	$0xe, %rax
   92571:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
   92576:      	vmovq	%rax, %xmm12
   9257b:      	movq	%r8, %rax
   9257e:      	shrq	$0xe, %rax
   92582:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
   92587:      	vmovq	%rax, %xmm14
   9258c:      	vmovdqa	%ymm13, 0x620(%rsp)
   92595:      	vmovdqu	0xe0(%rsp), %xmm13
   9259e:      	vpinsrq	$0x1, %rdx, %xmm13, %xmm13
   925a4:      	vmovdqa	%ymm15, 0x640(%rsp)
   925ad:      	vmovq	%rsi, %xmm15
   925b2:      	vmovdqa	%ymm9, 0x660(%rsp)
   925bb:      	vmovdqa	%ymm0, 0x680(%rsp)
   925c4:      	vpbroadcastq	%xmm10, %ymm0
   925c9:      	vpblendd	$0x30, %ymm0, %ymm11, %ymm0 # ymm0 = ymm11[0,1,2,3],ymm0[4,5],ymm11[6,7]
   925cf:      	vpbroadcastq	%xmm3, %ymm3
   925d4:      	vpblendd	$0xc0, %ymm3, %ymm0, %ymm0 # ymm0 = ymm0[0,1,2,3,4,5],ymm3[6,7]
   925da:      	vpbroadcastq	%xmm5, %ymm3
   925df:      	vpblendd	$0x30, %ymm3, %ymm6, %ymm3 # ymm3 = ymm6[0,1,2,3],ymm3[4,5],ymm6[6,7]
   925e5:      	vpbroadcastq	%xmm4, %ymm4
   925ea:      	vpblendd	$0xc0, %ymm4, %ymm3, %ymm3 # ymm3 = ymm3[0,1,2,3,4,5],ymm4[6,7]
   925f0:      	vpbroadcastq	%xmm2, %ymm2
   925f5:      	vpblendd	$0x30, %ymm2, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm2[4,5],ymm1[6,7]
   925fb:      	movq	%r8, %rax
   925fe:      	shrq	$0x28, %rax
   92602:      	vpbroadcastq	%xmm7, %ymm2
   92607:      	vpblendd	$0xc0, %ymm2, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3,4,5],ymm2[6,7]
   9260d:      	vpbroadcastq	%xmm12, %ymm2
   92612:      	vpblendd	$0x30, %ymm2, %ymm8, %ymm2 # ymm2 = ymm8[0,1,2,3],ymm2[4,5],ymm8[6,7]
   92618:      	vpbroadcastq	%xmm14, %ymm4
   9261d:      	vpblendd	$0xc0, %ymm4, %ymm2, %ymm2 # ymm2 = ymm2[0,1,2,3,4,5],ymm4[6,7]
   92623:      	vpbroadcastq	%xmm15, %ymm4
   92628:      	vpblendd	$0x30, %ymm4, %ymm13, %ymm4 # ymm4 = ymm13[0,1,2,3],ymm4[4,5],ymm13[6,7]
   9262e:      	vmovq	%rax, %xmm5
   92633:      	vpbroadcastq	%xmm5, %ymm5
   92638:      	vpblendd	$0xc0, %ymm5, %ymm4, %ymm4 # ymm4 = ymm4[0,1,2,3,4,5],ymm5[6,7]
   9263e:      	vpsllq	$0x2, %ymm3, %ymm5
   92643:      	vpaddq	%ymm3, %ymm5, %ymm5
   92647:      	vpsllq	$0x2, %ymm1, %ymm6
   9264c:      	vpaddq	%ymm1, %ymm6, %ymm6
   92650:      	vpsllq	$0x2, %ymm2, %ymm7
   92655:      	vpaddq	%ymm2, %ymm7, %ymm7
   92659:      	vpsllq	$0x2, %ymm4, %ymm8
   9265e:      	vpaddq	%ymm4, %ymm8, %ymm8
   92662:      	vmovdqa	%ymm0, 0x460(%rsp)
   9266b:      	vmovdqa	%ymm3, 0x480(%rsp)
   92674:      	vmovdqa	%ymm1, 0x4a0(%rsp)
   9267d:      	vmovdqa	%ymm2, 0x4c0(%rsp)
   92686:      	vmovdqa	%ymm4, 0x4e0(%rsp)
   9268f:      	vmovdqa	%ymm5, 0x3e0(%rsp)
   92698:      	vmovdqa	%ymm6, 0x400(%rsp)
   926a1:      	vmovdqa	%ymm7, 0x420(%rsp)
   926aa:      	vmovdqa	%ymm8, 0x440(%rsp)
   926b3:      	vpxor	%xmm0, %xmm0, %xmm0
   926b7:      	vmovdqa	%ymm0, 0x340(%rsp)
   926c0:      	vmovdqa	%ymm0, 0x320(%rsp)
   926c9:      	vmovdqa	%ymm0, 0x300(%rsp)
   926d2:      	vmovdqa	%ymm0, 0x2e0(%rsp)
   926db:      	vmovdqa	%ymm0, 0x2c0(%rsp)
   926e4:      	decq	%r13
   926e7:      	movq	%r13, %rax
   926ea:      	shlq	$0x7, %rax
   926ee:      	addq	%r15, %rax
   926f1:      	vpxor	%xmm2, %xmm2, %xmm2
   926f5:      	vpxor	%xmm1, %xmm1, %xmm1
   926f9:      	vpxor	%xmm4, %xmm4, %xmm4
   926fd:      	vpxor	%xmm3, %xmm3, %xmm3
   92701:      	testq	%r13, %r13
   92704:      	je	0x92a33 <toyos_crypto::arch::x86_64::poly1305::blocks+0xec3>
   9270a:      	movq	%rax, 0x180(%rsp)
   92712:      	addq	$0x70, %r15
   92716:      	vbroadcastsd	-0x7a347(%rip), %ymm0 # 0x183d8 <anon.61c29e2b6718c1088020d883dbc089c6.10.llvm.11391827976878554171+0x114>
   9271f:      	vmovaps	%ymm0, 0x40(%rsp)
   92725:      	vpbroadcastq	-0x7a31e(%rip), %ymm0 # 0x18410 <anon.61c29e2b6718c1088020d883dbc089c6.10.llvm.11391827976878554171+0x14c>
   9272e:      	vmovdqa	%ymm0, 0x80(%rsp)
   92737:      	leaq	0x500(%rsp), %r14
   9273f:      	leaq	0xc0(%rsp), %r12
   92747:      	leaq	0x2c0(%rsp), %rbx
   9274f:      	nop
   92750:      	vmovdqu	-0x70(%r15), %ymm0
   92756:      	vmovdqu	-0x50(%r15), %ymm1
   9275c:      	vmovdqu	-0x30(%r15), %ymm3
   92762:      	vmovdqu	-0x10(%r15), %ymm7
   92768:      	vpunpckhqdq	%ymm1, %ymm0, %ymm2 # ymm2 = ymm0[1],ymm1[1],ymm0[3],ymm1[3]
   9276c:      	vpsrlq	$0x28, %ymm2, %ymm6
   92771:      	vpunpcklqdq	%ymm1, %ymm0, %ymm4 # ymm4 = ymm0[0],ymm1[0],ymm0[2],ymm1[2]
   92775:      	vpsrlq	$0x34, %ymm4, %ymm0
   9277a:      	vpsllq	$0xc, %ymm2, %ymm1
   9277f:      	vpor	%ymm0, %ymm1, %ymm5
   92783:      	vpsrlq	$0x1a, %ymm4, %ymm0
   92788:      	vmovdqa	0x40(%rsp), %ymm13
   9278e:      	vpand	%ymm0, %ymm13, %ymm8
   92792:      	vpunpcklqdq	%ymm7, %ymm3, %ymm1 # ymm1 = ymm3[0],ymm7[0],ymm3[2],ymm7[2]
   92796:      	vpunpckhqdq	%ymm7, %ymm3, %ymm0 # ymm0 = ymm3[1],ymm7[1],ymm3[3],ymm7[3]
   9279a:      	vpsrlq	$0x34, %ymm1, %ymm3
   9279f:      	vpsllq	$0xc, %ymm0, %ymm7
   927a4:      	vpor	%ymm3, %ymm7, %ymm3
   927a8:      	vmovdqa	0x220(%rsp), %ymm7
   927b1:      	vmovdqa	0x280(%rsp), %ymm9
   927ba:      	vpsrlq	$0x1a, %ymm7, %ymm10
   927bf:      	vpaddq	0x240(%rsp), %ymm10, %ymm10
   927c8:      	vpsrlq	$0x1a, %ymm9, %ymm11
   927ce:      	vpaddq	0x2a0(%rsp), %ymm11, %ymm11
   927d7:      	vpand	%ymm13, %ymm10, %ymm12
   927dc:      	vpaddq	%ymm8, %ymm12, %ymm8
   927e1:      	vpand	%ymm13, %ymm11, %ymm12
   927e6:      	vpaddq	%ymm6, %ymm12, %ymm6
   927ea:      	vpand	%ymm7, %ymm13, %ymm7
   927ee:      	vpand	%ymm13, %ymm9, %ymm9
   927f3:      	vpsrlq	$0x1a, %ymm10, %ymm10
   927f9:      	vpaddq	0x260(%rsp), %ymm10, %ymm10
   92802:      	vpsrlq	$0x1a, %ymm11, %ymm11
   92808:      	vpaddq	%ymm7, %ymm11, %ymm7
   9280c:      	vpsllq	$0x2, %ymm11, %ymm11
   92812:      	vpaddq	%ymm7, %ymm11, %ymm7
   92816:      	vpsrlq	$0x1a, %ymm10, %ymm11
   9281c:      	vpaddq	%ymm9, %ymm11, %ymm9
   92821:      	vpand	%ymm5, %ymm13, %ymm5
   92825:      	vpand	%ymm13, %ymm10, %ymm10
   9282a:      	vpaddq	%ymm5, %ymm10, %ymm5
   9282e:      	vpsrlq	$0x1a, %ymm7, %ymm10
   92833:      	vpaddq	%ymm10, %ymm8, %ymm8
   92838:      	vpsrlq	$0xe, %ymm2, %ymm2
   9283d:      	vpand	%ymm2, %ymm13, %ymm2
   92841:      	vpand	%ymm4, %ymm13, %ymm4
   92845:      	vpand	%ymm7, %ymm13, %ymm7
   92849:      	vpaddq	%ymm4, %ymm7, %ymm4
   9284d:      	vpand	%ymm13, %ymm9, %ymm7
   92852:      	vpaddq	%ymm2, %ymm7, %ymm2
   92856:      	vpsrlq	$0x1a, %ymm9, %ymm7
   9285c:      	vpaddq	0x80(%rsp), %ymm6, %ymm6
   92865:      	vpaddq	%ymm7, %ymm6, %ymm6
   92869:      	vmovdqa	%ymm4, 0xc0(%rsp)
   92872:      	vmovdqa	%ymm8, 0xe0(%rsp)
   9287b:      	vmovdqa	%ymm5, 0x100(%rsp)
   92884:      	vmovdqa	%ymm2, 0x120(%rsp)
   9288d:      	vpand	%ymm1, %ymm13, %ymm2
   92891:      	vmovdqa	%ymm2, 0x60(%rsp)
   92897:      	vpsrlq	$0x1a, %ymm1, %ymm1
   9289c:      	vpand	%ymm1, %ymm13, %ymm1
   928a0:      	vmovdqa	%ymm1, 0x1c0(%rsp)
   928a9:      	vpand	%ymm3, %ymm13, %ymm1
   928ad:      	vmovdqa	%ymm1, 0x1e0(%rsp)
   928b6:      	vmovdqa	%ymm6, 0x140(%rsp)
   928bf:      	vpsrlq	$0xe, %ymm0, %ymm1
   928c4:      	vpand	%ymm1, %ymm13, %ymm1
   928c8:      	vmovdqa	%ymm1, 0x200(%rsp)
   928d1:      	vpsrlq	$0x28, %ymm0, %ymm0
   928d6:      	vmovdqa	%ymm0, 0x1a0(%rsp)
   928df:      	leaq	0x220(%rsp), %rdi
   928e7:      	movq	%r14, %rsi
   928ea:      	movq	%r12, %rdx
   928ed:      	vzeroupper
   928f0:      	callq	0x8e510 <<toyos_crypto::arch::x86_64::poly1305::Multiplier>::product>
   928f5:      	vmovdqa	0x2c0(%rsp), %ymm0
   928fe:      	vmovdqa	0x320(%rsp), %ymm1
   92907:      	vpsrlq	$0x1a, %ymm0, %ymm2
   9290c:      	vpaddq	0x2e0(%rsp), %ymm2, %ymm2
   92915:      	vmovdqa	0x40(%rsp), %ymm7
   9291b:      	vpand	%ymm7, %ymm0, %ymm0
   9291f:      	vpsrlq	$0x1a, %ymm1, %ymm3
   92924:      	vpaddq	0x340(%rsp), %ymm3, %ymm3
   9292d:      	vpand	%ymm7, %ymm1, %ymm1
   92931:      	vpsrlq	$0x1a, %ymm2, %ymm4
   92936:      	vpaddq	0x300(%rsp), %ymm4, %ymm4
   9293f:      	vpand	%ymm7, %ymm2, %ymm2
   92943:      	vpaddq	0x1c0(%rsp), %ymm2, %ymm2
   9294c:      	vpsrlq	$0x1a, %ymm3, %ymm5
   92951:      	vpand	%ymm7, %ymm3, %ymm3
   92955:      	vpaddq	0x1a0(%rsp), %ymm3, %ymm3
   9295e:      	vpsllq	$0x2, %ymm5, %ymm6
   92963:      	vpaddq	%ymm0, %ymm5, %ymm0
   92967:      	vpaddq	%ymm0, %ymm6, %ymm0
   9296b:      	vpsrlq	$0x1a, %ymm4, %ymm5
   92970:      	vpaddq	%ymm1, %ymm5, %ymm1
   92974:      	vpand	%ymm7, %ymm4, %ymm4
   92978:      	vpaddq	0x1e0(%rsp), %ymm4, %ymm4
   92981:      	vpsrlq	$0x1a, %ymm0, %ymm5
   92986:      	vpaddq	%ymm5, %ymm2, %ymm2
   9298a:      	vpand	%ymm7, %ymm0, %ymm0
   9298e:      	vpaddq	0x60(%rsp), %ymm0, %ymm0
   92994:      	vpsrlq	$0x1a, %ymm1, %ymm5
   92999:      	vpand	%ymm7, %ymm1, %ymm1
   9299d:      	vpaddq	0x200(%rsp), %ymm1, %ymm1
   929a6:      	vpaddq	0x80(%rsp), %ymm3, %ymm3
   929af:      	vpaddq	%ymm5, %ymm3, %ymm3
   929b3:      	vmovdqa	%ymm0, 0xc0(%rsp)
   929bc:      	vmovdqa	%ymm2, 0xe0(%rsp)
   929c5:      	vmovdqa	%ymm4, 0x100(%rsp)
   929ce:      	vmovdqa	%ymm1, 0x120(%rsp)
   929d7:      	vmovdqa	%ymm3, 0x140(%rsp)
   929e0:      	movq	%rbx, %rdi
   929e3:      	movq	%r14, %rsi
   929e6:      	movq	%r12, %rdx
   929e9:      	vzeroupper
   929ec:      	callq	0x8e510 <<toyos_crypto::arch::x86_64::poly1305::Multiplier>::product>
   929f1:      	subq	$-0x80, %r15
   929f5:      	decq	%r13
   929f8:      	jne	0x92750 <toyos_crypto::arch::x86_64::poly1305::blocks+0xbe0>
   929fe:      	vmovdqa	0x2c0(%rsp), %ymm3
   92a07:      	vmovdqa	0x2e0(%rsp), %ymm4
   92a10:      	vmovdqa	0x300(%rsp), %ymm1
   92a19:      	vmovdqa	0x320(%rsp), %ymm2
   92a22:      	vmovdqa	0x340(%rsp), %ymm0
   92a2b:      	movq	0x180(%rsp), %rax
   92a33:      	vmovdqa	%ymm0, 0x3a0(%rsp)
   92a3c:      	vmovdqa	%ymm3, 0x3c0(%rsp)
   92a45:      	vmovdqa	%ymm4, 0x1c0(%rsp)
   92a4e:      	vmovdqa	%ymm1, 0x200(%rsp)
   92a57:      	vmovdqa	%ymm2, 0x60(%rsp)
   92a5d:      	vmovdqu	(%rax), %ymm2
   92a61:      	vmovdqu	0x20(%rax), %ymm3
   92a66:      	vmovdqu	0x40(%rax), %ymm4
   92a6b:      	vmovdqu	0x60(%rax), %ymm5
   92a70:      	vpunpckhqdq	%ymm3, %ymm2, %ymm6 # ymm6 = ymm2[1],ymm3[1],ymm2[3],ymm3[3]
   92a74:      	vpsrlq	$0x28, %ymm6, %ymm1
   92a79:      	vpsrlq	$0xe, %ymm6, %ymm0
   92a7e:      	vpbroadcastq	-0x7a6af(%rip), %ymm10 # 0x183d8 <anon.61c29e2b6718c1088020d883dbc089c6.10.llvm.11391827976878554171+0x114>
   92a87:      	vmovdqa	%ymm10, 0x40(%rsp)
   92a8d:      	vpand	%ymm0, %ymm10, %ymm0
   92a91:      	vpunpcklqdq	%ymm3, %ymm2, %ymm2 # ymm2 = ymm2[0],ymm3[0],ymm2[2],ymm3[2]
   92a95:      	vpsrlq	$0x34, %ymm2, %ymm3
   92a9a:      	vpsllq	$0xc, %ymm6, %ymm6
   92a9f:      	vpor	%ymm3, %ymm6, %ymm3
   92aa3:      	vpand	%ymm3, %ymm10, %ymm3
   92aa7:      	vpsrlq	$0x1a, %ymm2, %ymm6
   92aac:      	vpand	%ymm6, %ymm10, %ymm6
   92ab0:      	vpand	%ymm2, %ymm10, %ymm2
   92ab4:      	vpunpcklqdq	%ymm5, %ymm4, %ymm7 # ymm7 = ymm4[0],ymm5[0],ymm4[2],ymm5[2]
   92ab8:      	vpunpckhqdq	%ymm5, %ymm4, %ymm4 # ymm4 = ymm4[1],ymm5[1],ymm4[3],ymm5[3]
   92abc:      	vpand	%ymm7, %ymm10, %ymm5
   92ac0:      	vmovdqa	%ymm5, 0x80(%rsp)
   92ac9:      	vpsrlq	$0x1a, %ymm7, %ymm5
   92ace:      	vpand	%ymm5, %ymm10, %ymm5
   92ad2:      	vmovdqa	%ymm5, 0x1a0(%rsp)
   92adb:      	vpsrlq	$0x34, %ymm7, %ymm5
   92ae0:      	vpsllq	$0xc, %ymm4, %ymm7
   92ae5:      	vpor	%ymm5, %ymm7, %ymm5
   92ae9:      	vpand	%ymm5, %ymm10, %ymm5
   92aed:      	vmovdqa	%ymm5, 0x380(%rsp)
   92af6:      	vpsrlq	$0xe, %ymm4, %ymm5
   92afb:      	vpand	%ymm5, %ymm10, %ymm5
   92aff:      	vmovdqa	%ymm5, 0x180(%rsp)
   92b08:      	vpsrlq	$0x28, %ymm4, %ymm4
   92b0d:      	vmovdqa	%ymm4, 0x1e0(%rsp)
   92b16:      	vmovdqa	0x220(%rsp), %ymm4
   92b1f:      	vmovdqa	0x280(%rsp), %ymm5
   92b28:      	vpsrlq	$0x1a, %ymm4, %ymm7
   92b2d:      	vpaddq	0x240(%rsp), %ymm7, %ymm7
   92b36:      	vpand	%ymm4, %ymm10, %ymm4
   92b3a:      	vpsrlq	$0x1a, %ymm5, %ymm8
   92b3f:      	vpaddq	0x2a0(%rsp), %ymm8, %ymm8
   92b48:      	vpand	%ymm5, %ymm10, %ymm5
   92b4c:      	vpsrlq	$0x1a, %ymm7, %ymm9
   92b51:      	vpaddq	0x260(%rsp), %ymm9, %ymm9
   92b5a:      	vpand	%ymm7, %ymm10, %ymm7
   92b5e:      	vpaddq	%ymm6, %ymm7, %ymm6
   92b62:      	vpsrlq	$0x1a, %ymm8, %ymm7
   92b68:      	vpand	%ymm10, %ymm8, %ymm8
   92b6d:      	vpaddq	%ymm1, %ymm8, %ymm1
   92b71:      	vpsllq	$0x2, %ymm7, %ymm8
   92b76:      	vpaddq	%ymm4, %ymm7, %ymm4
   92b7a:      	vpaddq	%ymm4, %ymm8, %ymm4
   92b7e:      	vpsrlq	$0x1a, %ymm9, %ymm7
   92b84:      	vpaddq	%ymm5, %ymm7, %ymm5
   92b88:      	vpand	%ymm10, %ymm9, %ymm7
   92b8d:      	vpaddq	%ymm3, %ymm7, %ymm3
   92b91:      	vpsrlq	$0x1a, %ymm4, %ymm7
   92b96:      	vpaddq	%ymm7, %ymm6, %ymm6
   92b9a:      	vpand	%ymm4, %ymm10, %ymm4
   92b9e:      	vpaddq	%ymm2, %ymm4, %ymm2
   92ba2:      	vpsrlq	$0x1a, %ymm5, %ymm4
   92ba7:      	vpand	%ymm5, %ymm10, %ymm5
   92bab:      	vpbroadcastq	-0x7a7a4(%rip), %ymm7 # 0x18410 <anon.61c29e2b6718c1088020d883dbc089c6.10.llvm.11391827976878554171+0x14c>
   92bb4:      	vmovdqa	%ymm7, 0x160(%rsp)
   92bbd:      	vpaddq	%ymm0, %ymm5, %ymm0
   92bc1:      	vpaddq	%ymm7, %ymm1, %ymm1
   92bc5:      	vpaddq	%ymm4, %ymm1, %ymm1
   92bc9:      	vmovdqa	%ymm2, 0xc0(%rsp)
   92bd2:      	vmovdqa	%ymm6, 0xe0(%rsp)
   92bdb:      	vmovdqa	%ymm3, 0x100(%rsp)
   92be4:      	vmovdqa	%ymm0, 0x120(%rsp)
   92bed:      	vmovdqa	%ymm1, 0x140(%rsp)
   92bf6:      	leaq	0x220(%rsp), %rdi
   92bfe:      	leaq	0x620(%rsp), %rsi
   92c06:      	leaq	0xc0(%rsp), %rdx
   92c0e:      	vzeroupper
   92c11:      	callq	0x8e510 <<toyos_crypto::arch::x86_64::poly1305::Multiplier>::product>
   92c16:      	vmovdqa	0x3c0(%rsp), %ymm1
   92c1f:      	vpsrlq	$0x1a, %ymm1, %ymm0
   92c24:      	vpaddq	0x1c0(%rsp), %ymm0, %ymm0
   92c2d:      	vmovdqa	0x40(%rsp), %ymm7
   92c33:      	vpand	%ymm7, %ymm1, %ymm1
   92c37:      	vmovdqa	0x60(%rsp), %ymm3
   92c3d:      	vpsrlq	$0x1a, %ymm3, %ymm2
   92c42:      	vpaddq	0x3a0(%rsp), %ymm2, %ymm2
   92c4b:      	vpand	%ymm7, %ymm3, %ymm3
   92c4f:      	vpsrlq	$0x1a, %ymm0, %ymm4
   92c54:      	vpaddq	0x200(%rsp), %ymm4, %ymm4
   92c5d:      	vpand	%ymm7, %ymm0, %ymm0
   92c61:      	vpsrlq	$0x1a, %ymm2, %ymm5
   92c66:      	vpand	%ymm7, %ymm2, %ymm2
   92c6a:      	vpsllq	$0x2, %ymm5, %ymm6
   92c6f:      	vpaddq	%ymm5, %ymm6, %ymm5
   92c73:      	vpaddq	%ymm1, %ymm5, %ymm1
   92c77:      	vpsrlq	$0x1a, %ymm4, %ymm5
   92c7c:      	vpaddq	%ymm3, %ymm5, %ymm3
   92c80:      	vpand	%ymm7, %ymm4, %ymm4
   92c84:      	vpaddq	0x380(%rsp), %ymm4, %ymm4
   92c8d:      	vpsrlq	$0x1a, %ymm1, %ymm5
   92c92:      	vpaddq	%ymm5, %ymm0, %ymm0
   92c96:      	vpaddq	0x1a0(%rsp), %ymm0, %ymm0
   92c9f:      	vpand	%ymm7, %ymm1, %ymm1
   92ca3:      	vpaddq	0x80(%rsp), %ymm1, %ymm1
   92cac:      	vpsrlq	$0x1a, %ymm3, %ymm5
   92cb1:      	vpaddq	%ymm5, %ymm2, %ymm2
   92cb5:      	vpand	%ymm7, %ymm3, %ymm3
   92cb9:      	vpaddq	0x180(%rsp), %ymm3, %ymm3
   92cc2:      	vpaddq	0x160(%rsp), %ymm2, %ymm2
   92ccb:      	vpaddq	0x1e0(%rsp), %ymm2, %ymm2
   92cd4:      	vmovdqa	%ymm1, 0xc0(%rsp)
   92cdd:      	vmovdqa	%ymm0, 0xe0(%rsp)
   92ce6:      	vmovdqa	%ymm4, 0x100(%rsp)
   92cef:      	vmovdqa	%ymm3, 0x120(%rsp)
   92cf8:      	vmovdqa	%ymm2, 0x140(%rsp)
   92d01:      	leaq	0x2c0(%rsp), %rdi
   92d09:      	leaq	0x3e0(%rsp), %rsi
   92d11:      	leaq	0xc0(%rsp), %rdx
   92d19:      	vzeroupper
   92d1c:      	callq	0x8e510 <<toyos_crypto::arch::x86_64::poly1305::Multiplier>::product>
   92d21:      	vmovdqa	0x220(%rsp), %ymm1
   92d2a:      	vpsrlq	$0x1a, %ymm1, %ymm0
   92d2f:      	vpaddq	0x240(%rsp), %ymm0, %ymm2
   92d38:      	vmovdqa	0x280(%rsp), %ymm3
   92d41:      	vpsrlq	$0x1a, %ymm3, %ymm0
   92d46:      	vpaddq	0x2a0(%rsp), %ymm0, %ymm0
   92d4f:      	vmovdqa	0x40(%rsp), %ymm12
   92d55:      	vpand	%ymm1, %ymm12, %ymm1
   92d59:      	vpsrlq	$0x1a, %ymm2, %ymm4
   92d5e:      	vpaddq	0x260(%rsp), %ymm4, %ymm4
   92d67:      	vpand	%ymm3, %ymm12, %ymm3
   92d6b:      	vpand	%ymm2, %ymm12, %ymm5
   92d6f:      	vpsrlq	$0x1a, %ymm0, %ymm2
   92d74:      	vpsllq	$0x2, %ymm2, %ymm6
   92d79:      	vpaddq	%ymm1, %ymm2, %ymm1
   92d7d:      	vpaddq	%ymm1, %ymm6, %ymm2
   92d81:      	vpsrlq	$0x1a, %ymm4, %ymm1
   92d86:      	vpaddq	%ymm3, %ymm1, %ymm1
   92d8a:      	vpand	%ymm4, %ymm12, %ymm4
   92d8e:      	vpsrlq	$0x1a, %ymm2, %ymm3
   92d93:      	vpand	%ymm2, %ymm12, %ymm6
   92d97:      	vpand	%ymm1, %ymm12, %ymm7
   92d9b:      	vmovdqa	0x2c0(%rsp), %ymm8
   92da4:      	vpsrlq	$0x1a, %ymm8, %ymm2
   92daa:      	vpaddq	0x2e0(%rsp), %ymm2, %ymm9
   92db3:      	vmovdqa	0x320(%rsp), %ymm10
   92dbc:      	vpsrlq	$0x1a, %ymm10, %ymm2
   92dc2:      	vpaddq	0x340(%rsp), %ymm2, %ymm2
   92dcb:      	vpand	%ymm12, %ymm8, %ymm8
   92dd0:      	vpsrlq	$0x1a, %ymm9, %ymm11
   92dd6:      	vpaddq	0x300(%rsp), %ymm11, %ymm11
   92ddf:      	vpand	%ymm12, %ymm10, %ymm10
   92de4:      	vpand	%ymm12, %ymm9, %ymm9
   92de9:      	vpaddq	%ymm5, %ymm9, %ymm5
   92ded:      	vpaddq	%ymm3, %ymm5, %ymm5
   92df1:      	vpsrlq	$0x1a, %ymm2, %ymm3
   92df6:      	vpsllq	$0x2, %ymm3, %ymm9
   92dfb:      	vpaddq	%ymm3, %ymm8, %ymm3
   92dff:      	vpaddq	%ymm3, %ymm9, %ymm8
   92e03:      	vpsrlq	$0x1a, %ymm11, %ymm3
   92e09:      	vpaddq	%ymm3, %ymm10, %ymm3
   92e0d:      	vpand	%ymm12, %ymm11, %ymm9
   92e12:      	vpaddq	%ymm4, %ymm9, %ymm4
   92e16:      	vpsrlq	$0x1a, %ymm8, %ymm9
   92e1c:      	vpaddq	%ymm5, %ymm9, %ymm5
   92e20:      	vpand	%ymm12, %ymm8, %ymm8
   92e25:      	vpaddq	%ymm6, %ymm8, %ymm6
   92e29:      	vpand	%ymm3, %ymm12, %ymm8
   92e2d:      	vpaddq	%ymm7, %ymm8, %ymm7
   92e31:      	vpshufd	$0xee, %xmm6, %xmm8     # xmm8 = xmm6[2,3,2,3]
   92e36:      	vextracti128	$0x1, %ymm6, %xmm9
   92e3c:      	vpermq	$0xff, %ymm6, %ymm10    # ymm10 = ymm6[3,3,3,3]
   92e42:      	vpaddq	%xmm6, %xmm8, %xmm6
   92e46:      	vpaddq	%xmm10, %xmm9, %xmm8
   92e4b:      	vpaddq	%xmm6, %xmm8, %xmm6
   92e4f:      	vmovq	%xmm6, %rdx
   92e54:      	vpshufd	$0xee, %xmm5, %xmm6     # xmm6 = xmm5[2,3,2,3]
   92e59:      	vextracti128	$0x1, %ymm5, %xmm8
   92e5f:      	vpermq	$0xff, %ymm5, %ymm9     # ymm9 = ymm5[3,3,3,3]
   92e65:      	vpaddq	%xmm6, %xmm5, %xmm5
   92e69:      	vpaddq	%xmm9, %xmm8, %xmm6
   92e6e:      	vpaddq	%xmm6, %xmm5, %xmm5
   92e72:      	vmovq	%xmm5, %rsi
   92e77:      	vpshufd	$0xee, %xmm4, %xmm5     # xmm5 = xmm4[2,3,2,3]
   92e7c:      	vextracti128	$0x1, %ymm4, %xmm6
   92e82:      	vpermq	$0xff, %ymm4, %ymm8     # ymm8 = ymm4[3,3,3,3]
   92e88:      	vpaddq	%xmm5, %xmm4, %xmm4
   92e8c:      	vpaddq	%xmm6, %xmm8, %xmm5
   92e90:      	vpaddq	%xmm5, %xmm4, %xmm4
   92e94:      	vmovq	%xmm4, %r9
   92e99:      	vpshufd	$0xee, %xmm7, %xmm4     # xmm4 = xmm7[2,3,2,3]
   92e9e:      	vextracti128	$0x1, %ymm7, %xmm5
   92ea4:      	vpermq	$0xff, %ymm7, %ymm6     # ymm6 = ymm7[3,3,3,3]
   92eaa:      	vpaddq	%xmm4, %xmm7, %xmm4
   92eae:      	vpaddq	%xmm6, %xmm5, %xmm5
   92eb2:      	vpaddq	%xmm5, %xmm4, %xmm4
   92eb6:      	vmovq	%xmm4, %rcx
   92ebb:      	movq	%rsi, %rdi
   92ebe:      	shrq	$0x26, %rdi
   92ec2:      	shlq	$0x1a, %rsi
   92ec6:      	movq	%r9, %r8
   92ec9:      	shrq	$0xc, %r8
   92ecd:      	shlq	$0x34, %r9
   92ed1:      	addq	%rdx, %r9
   92ed4:      	adcq	$0x0, %r8
   92ed8:      	addq	%rsi, %r9
   92edb:      	adcq	%rdi, %r8
   92ede:      	shlq	$0xe, %rcx
   92ee2:      	addq	%r8, %rcx
   92ee5:      	jb	0x92f93 <toyos_crypto::arch::x86_64::poly1305::blocks+0x1423>
   92eeb:      	movabsq	$0x7fffffffffffff8, %rdx # imm = 0x7FFFFFFFFFFFFF8
   92ef5:      	movq	0xb0(%rsp), %rax
   92efd:      	andq	%rdx, %rax
   92f00:      	vpsrlq	$0x1a, %ymm1, %ymm1
   92f05:      	vpand	%ymm0, %ymm12, %ymm0
   92f09:      	vpand	%ymm2, %ymm12, %ymm2
   92f0d:      	vpaddq	%ymm2, %ymm0, %ymm0
   92f11:      	vpaddq	%ymm0, %ymm1, %ymm0
   92f15:      	vpsrlq	$0x1a, %ymm3, %ymm1
   92f1a:      	vpaddq	%ymm1, %ymm0, %ymm0
   92f1e:      	vpshufd	$0xee, %xmm0, %xmm1     # xmm1 = xmm0[2,3,2,3]
   92f23:      	vextracti128	$0x1, %ymm0, %xmm2
   92f29:      	vpermq	$0xff, %ymm0, %ymm3     # ymm3 = ymm0[3,3,3,3]
   92f2f:      	vpaddq	%xmm1, %xmm0, %xmm0
   92f33:      	vpaddq	%xmm3, %xmm2, %xmm1
   92f37:      	vpaddq	%xmm1, %xmm0, %xmm0
   92f3b:      	vmovq	%xmm0, %rdx
   92f40:      	movq	%rdx, %rsi
   92f43:      	shrq	$0x18, %rsi
   92f47:      	shlq	$0x28, %rdx
   92f4b:      	addq	%rdx, %rcx
   92f4e:      	adcq	$0x0, %rsi
   92f52:      	movl	%esi, %edx
   92f54:      	andl	$0x3, %edx
   92f57:      	shrq	$0x2, %rsi
   92f5b:      	leaq	(%rsi,%rsi,4), %rsi
   92f5f:      	addq	%rsi, %r9
   92f62:      	adcq	$0x0, %rcx
   92f66:      	adcq	$0x0, %rdx
   92f6a:      	movq	0xa8(%rsp), %rsi
   92f72:      	movq	%r9, (%rsi)
   92f75:      	movq	%rcx, 0x8(%rsi)
   92f79:      	movq	%rdx, 0x10(%rsi)
   92f7d:      	jmp	0x92f81 <toyos_crypto::arch::x86_64::poly1305::blocks+0x1411>
   92f7f:      	xorl	%eax, %eax
   92f81:      	leaq	-0x28(%rbp), %rsp
   92f85:      	popq	%rbx
   92f86:      	popq	%r12
   92f88:      	popq	%r13
   92f8a:      	popq	%r14
   92f8c:      	popq	%r15
   92f8e:      	popq	%rbp
   92f8f:      	vzeroupper
   92f92:      	retq
   92f93:      	leaq	0x81a66(%rip), %rdi     # 0x114a00 <anon.f1a63303d415bafeaff7957ae4047c82.8.llvm.17913998573588270565+0xa8>
   92f9a:      	vzeroupper
   92f9d:      	callq	0x10cda0 <core::panicking::panic_const::panic_const_add_overflow>
