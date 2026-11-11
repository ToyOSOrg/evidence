Disassembly of section .text.toyos_fd_unuse:

0000000000000000 <toyos_fd_unuse>:
       0: 55                           	pushq	%rbp
       1: 48 89 e5                     	movq	%rsp, %rbp
       4: 48 83 ec 10                  	subq	$0x10, %rsp
       8: 85 ff                        	testl	%edi, %edi
       a: 78 6a                        	js	0x76 <toyos_fd_unuse+0x76>
       c: 81 ff ff 0f 00 00            	cmpl	$0xfff, %edi            # imm = 0xFFF
      12: 77 30                        	ja	0x44 <toyos_fd_unuse+0x44>
      14: 89 fe                        	movl	%edi, %esi
      16: 48 c1 e6 06                  	shlq	$0x6, %rsi
      1a: 4c 8d 05 00 00 00 00         	leaq	(%rip), %r8             # 0x21 <toyos_fd_unuse+0x21>
		000000000000001d:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner5TABLE-0x4
      21: 42 8b 3c 06                  	movl	(%rsi,%r8), %edi
      25: 4a 8b 44 06 08               	movq	0x8(%rsi,%r8), %rax
      2a: 4a 8b 4c 06 10               	movq	0x10(%rsi,%r8), %rcx
      2f: ba ff ff ff ff               	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
      34: f0                           	lock
      35: 42 0f c1 54 06 18            	xaddl	%edx, 0x18(%rsi,%r8)
      3b: 83 fa 01                     	cmpl	$0x1, %edx
      3e: 74 1c                        	je	0x5c <toyos_fd_unuse+0x5c>
      40: 85 d2                        	testl	%edx, %edx
      42: 75 2c                        	jne	0x70 <toyos_fd_unuse+0x70>
      44: c6 45 fe 02                  	movb	$0x2, -0x2(%rbp)
      48: 4c 8d 05 00 00 00 00         	leaq	(%rip), %r8             # 0x4f <toyos_fd_unuse+0x4f>
		000000000000004b:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
      4f: 48 8d 0d 00 00 00 00         	leaq	(%rip), %rcx            # 0x56 <toyos_fd_unuse+0x56>
		0000000000000052:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
      56: 48 8d 55 fe                  	leaq	-0x2(%rbp), %rdx
      5a: eb 30                        	jmp	0x8c <toyos_fd_unuse+0x8c>
      5c: 48 85 c9                     	testq	%rcx, %rcx
      5f: 74 0a                        	je	0x6b <toyos_fd_unuse+0x6b>
      61: 48 89 c7                     	movq	%rax, %rdi
      64: 48 83 c4 10                  	addq	$0x10, %rsp
      68: 5d                           	popq	%rbp
      69: ff e1                        	jmpq	*%rcx
      6b: e8 00 00 00 00               	callq	0x70 <toyos_fd_unuse+0x70>
		000000000000006c:  R_X86_64_PLT32	toyos::net::stream::let_go-0x4
      70: 48 83 c4 10                  	addq	$0x10, %rsp
      74: 5d                           	popq	%rbp
      75: c3                           	retq
      76: c6 45 ff 03                  	movb	$0x3, -0x1(%rbp)
      7a: 4c 8d 05 00 00 00 00         	leaq	(%rip), %r8             # 0x81 <toyos_fd_unuse+0x81>
		000000000000007d:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
      81: 48 8d 0d 00 00 00 00         	leaq	(%rip), %rcx            # 0x88 <toyos_fd_unuse+0x88>
		0000000000000084:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
      88: 48 8d 55 ff                  	leaq	-0x1(%rbp), %rdx
      8c: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x93 <toyos_fd_unuse+0x93>
		000000000000008f:  R_X86_64_PC32	.rodata..Lanon.X-0x4
      93: be 26 00 00 00               	movl	$0x26, %esi
      98: e8 00 00 00 00               	callq	0x9d <toyos_fd_unuse+0x9d>
		0000000000000099:  R_X86_64_PLT32	core::result::unwrap_failed-0x4
      9d: 0f 0b                        	ud2
      9f: e8 00 00 00 00               	callq	0xa4 <toyos_fd_unuse+0xa4>
		00000000000000a0:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
