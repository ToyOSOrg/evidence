Disassembly of section .text.toyos_fd_inheritable:

0000000000000000 <toyos_fd_inheritable>:
       0: 55                           	pushq	%rbp
       1: 48 89 e5                     	movq	%rsp, %rbp
       4: 53                           	pushq	%rbx
       5: 48 83 ec 18                  	subq	$0x18, %rsp
       9: 89 fb                        	movl	%edi, %ebx
       b: 48 8d 7d e8                  	leaq	-0x18(%rbp), %rdi
       f: e8 00 00 00 00               	callq	0x14 <toyos_fd_inheritable+0x14>
		0000000000000010:  R_X86_64_PLT32	.text._RNvNtNtCsX_5toyos2fd5owner5table-0x4
      14: 80 7d e8 01                  	cmpb	$0x1, -0x18(%rbp)
      18: 75 0d                        	jne	0x27 <toyos_fd_inheritable+0x27>
      1a: 0f b6 45 e9                  	movzbl	-0x17(%rbp), %eax
      1e: f7 d0                        	notl	%eax
      20: 48 83 c4 18                  	addq	$0x18, %rsp
      24: 5b                           	popq	%rbx
      25: 5d                           	popq	%rbp
      26: c3                           	retq
      27: 31 c0                        	xorl	%eax, %eax
      29: 81 fb ff 0f 00 00            	cmpl	$0xfff, %ebx            # imm = 0xFFF
      2f: 77 3d                        	ja	0x6e <toyos_fd_inheritable+0x6e>
      31: 48 8b 4d f0                  	movq	-0x10(%rbp), %rcx
      35: 89 da                        	movl	%ebx, %edx
      37: 8b 94 91 00 00 04 00         	movl	0x40000(%rcx,%rdx,4), %edx
      3e: 85 d2                        	testl	%edx, %edx
      40: 40 0f 94 c6                  	sete	%sil
      44: 89 d1                        	movl	%edx, %ecx
      46: 81 e1 ff ff ff 7f            	andl	$0x7fffffff, %ecx       # imm = 0x7FFFFFFF
      4c: 81 c1 ff ef ff ff            	addl	$0xffffefff, %ecx       # imm = 0xFFFFEFFF
      52: c1 ea 1f                     	shrl	$0x1f, %edx
      55: 81 f9 00 f0 ff ff            	cmpl	$0xfffff000, %ecx       # imm = 0xFFFFF000
      5b: 0f 92 c1                     	setb	%cl
      5e: 40 0f 93 c7                  	setae	%dil
      62: 0f 42 d0                     	cmovbl	%eax, %edx
      65: 40 08 f7                     	orb	%sil, %dil
      68: 74 1a                        	je	0x84 <toyos_fd_inheritable+0x84>
      6a: 89 d0                        	movl	%edx, %eax
      6c: eb 02                        	jmp	0x70 <toyos_fd_inheritable+0x70>
      6e: b1 01                        	movb	$0x1, %cl
      70: 0f b6 d0                     	movzbl	%al, %edx
      73: 89 d0                        	movl	%edx, %eax
      75: f7 d0                        	notl	%eax
      77: f6 c1 01                     	testb	$0x1, %cl
      7a: 0f 44 c2                     	cmovel	%edx, %eax
      7d: 48 83 c4 18                  	addq	$0x18, %rsp
      81: 5b                           	popq	%rbx
      82: 5d                           	popq	%rbp
      83: c3                           	retq
      84: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x8b <toyos_fd_inheritable+0x8b>
		0000000000000087:  R_X86_64_PC32	.rodata..Lanon.X-0x4
      8b: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x92 <toyos_fd_inheritable+0x92>
		000000000000008e:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
      92: be 5f 00 00 00               	movl	$0x5f, %esi
      97: e8 00 00 00 00               	callq	0x9c <toyos_fd_inheritable+0x9c>
		0000000000000098:  R_X86_64_PLT32	core::panicking::panic_fmt-0x4
      9c: 0f 0b                        	ud2
      9e: e8 00 00 00 00               	callq	0xa3 <toyos_fd_inheritable+0xa3>
		000000000000009f:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
