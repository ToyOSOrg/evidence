Disassembly of section .text.toyos_fd_acquire:

0000000000000000 <toyos_fd_acquire>:
       0: 55                           	pushq	%rbp
       1: 48 89 e5                     	movq	%rsp, %rbp
       4: 41 56                        	pushq	%r14
       6: 53                           	pushq	%rbx
       7: 48 83 ec 40                  	subq	$0x40, %rsp
       b: 48 89 f3                     	movq	%rsi, %rbx
       e: 41 89 fe                     	movl	%edi, %r14d
      11: 48 8d 7d e0                  	leaq	-0x20(%rbp), %rdi
      15: e8 00 00 00 00               	callq	0x1a <toyos_fd_acquire+0x1a>
		0000000000000016:  R_X86_64_PLT32	.text._RNvNtNtCsX_5toyos2fd5owner5table-0x4
      1a: 80 7d e0 01                  	cmpb	$0x1, -0x20(%rbp)
      1e: 75 06                        	jne	0x26 <toyos_fd_acquire+0x26>
      20: 0f b6 45 e1                  	movzbl	-0x1f(%rbp), %eax
      24: eb 1a                        	jmp	0x40 <toyos_fd_acquire+0x40>
      26: 48 8b 55 e8                  	movq	-0x18(%rbp), %rdx
      2a: 48 8d 7d b8                  	leaq	-0x48(%rbp), %rdi
      2e: 44 89 f6                     	movl	%r14d, %esi
      31: e8 00 00 00 00               	callq	0x36 <toyos_fd_acquire+0x36>
		0000000000000032:  R_X86_64_PLT32	.text._RNCNvNtNtCsX_5toyos2fd5owner16toyos_fd_acquire0B7_-0x4
      36: 80 7d b8 01                  	cmpb	$0x1, -0x48(%rbp)
      3a: 75 0b                        	jne	0x47 <toyos_fd_acquire+0x47>
      3c: 0f b6 45 b9                  	movzbl	-0x47(%rbp), %eax
      40: 0f b6 c0                     	movzbl	%al, %eax
      43: f7 d0                        	notl	%eax
      45: eb 12                        	jmp	0x59 <toyos_fd_acquire+0x59>
      47: 8b 45 c0                     	movl	-0x40(%rbp), %eax
      4a: 48 8b 4d d8                  	movq	-0x28(%rbp), %rcx
      4e: 48 89 4b 10                  	movq	%rcx, 0x10(%rbx)
      52: 0f 10 45 c8                  	movups	-0x38(%rbp), %xmm0
      56: 0f 11 03                     	movups	%xmm0, (%rbx)
      59: 48 83 c4 40                  	addq	$0x40, %rsp
      5d: 5b                           	popq	%rbx
      5e: 41 5e                        	popq	%r14
      60: 5d                           	popq	%rbp
      61: c3                           	retq
      62: e8 00 00 00 00               	callq	0x67 <toyos_fd_acquire+0x67>
		0000000000000063:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
