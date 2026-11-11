Disassembly of section .text._RNCNvNtNtCsX_5toyos2fd5owner16toyos_fd_acquire0B7_:

0000000000000000 <toyos::fd::owner::toyos_fd_acquire::{closure#0}>:
       0: 55                           	pushq	%rbp
       1: 48 89 e5                     	movq	%rsp, %rbp
       4: 41 57                        	pushq	%r15
       6: 41 56                        	pushq	%r14
       8: 53                           	pushq	%rbx
       9: 48 83 ec 18                  	subq	$0x18, %rsp
       d: 81 fe ff 0f 00 00            	cmpl	$0xfff, %esi            # imm = 0xFFF
      13: 0f 87 1f 01 00 00            	ja	0x138 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x138>
      19: 89 f3                        	movl	%esi, %ebx
      1b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
      20: 8b 84 9a 00 00 04 00         	movl	0x40000(%rdx,%rbx,4), %eax
      27: 85 c0                        	testl	%eax, %eax
      29: 0f 84 09 01 00 00            	je	0x138 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x138>
      2f: 25 ff ff ff 7f               	andl	$0x7fffffff, %eax       # imm = 0x7FFFFFFF
      34: 74 2a                        	je	0x60 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x60>
      36: 89 c1                        	movl	%eax, %ecx
      38: 48 ff c9                     	decq	%rcx
      3b: 31 f6                        	xorl	%esi, %esi
      3d: 3d 01 10 00 00               	cmpl	$0x1001, %eax           # imm = 0x1001
      42: 40 0f 92 c6                  	setb	%sil
      46: 48 83 fe 01                  	cmpq	$0x1, %rsi
      4a: 74 20                        	je	0x6c <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x6c>
      4c: e9 12 01 00 00               	jmp	0x163 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x163>
      51: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
      60: 31 f6                        	xorl	%esi, %esi
      62: 48 83 fe 01                  	cmpq	$0x1, %rsi
      66: 0f 85 f7 00 00 00            	jne	0x163 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x163>
      6c: 48 81 f9 ff 0f 00 00         	cmpq	$0xfff, %rcx            # imm = 0xFFF
      73: 0f 87 ea 00 00 00            	ja	0x163 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x163>
      79: 48 89 c8                     	movq	%rcx, %rax
      7c: 48 c1 e0 06                  	shlq	$0x6, %rax
      80: 48 8d 34 02                  	leaq	(%rdx,%rax), %rsi
      84: 8b 44 02 18                  	movl	0x18(%rdx,%rax), %eax
      88: 85 c0                        	testl	%eax, %eax
      8a: 74 94                        	je	0x20 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x20>
      8c: 83 f8 ff                     	cmpl	$-0x1, %eax
      8f: 0f 84 ce 00 00 00            	je	0x163 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x163>
      95: 44 8d 40 01                  	leal	0x1(%rax), %r8d
      99: f0                           	lock
      9a: 44 0f b1 46 18               	cmpxchgl	%r8d, 0x18(%rsi)
      9f: 75 e7                        	jne	0x88 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x88>
      a1: 48 8b 46 10                  	movq	0x10(%rsi), %rax
      a5: 48 89 45 e0                  	movq	%rax, -0x20(%rbp)
      a9: 0f 10 06                     	movups	(%rsi), %xmm0
      ac: 0f 29 45 d0                  	movaps	%xmm0, -0x30(%rbp)
      b0: 8b 84 9a 00 00 04 00         	movl	0x40000(%rdx,%rbx,4), %eax
      b7: 85 c0                        	testl	%eax, %eax
      b9: 74 31                        	je	0xec <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0xec>
      bb: 25 ff ff ff 7f               	andl	$0x7fffffff, %eax       # imm = 0x7FFFFFFF
      c0: 74 1c                        	je	0xde <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0xde>
      c2: 41 89 c1                     	movl	%eax, %r9d
      c5: 48 ff c8                     	decq	%rax
      c8: 45 31 c0                     	xorl	%r8d, %r8d
      cb: 41 81 f9 01 10 00 00         	cmpl	$0x1001, %r9d           # imm = 0x1001
      d2: 41 0f 92 c0                  	setb	%r8b
      d6: 49 83 f8 01                  	cmpq	$0x1, %r8
      da: 74 0b                        	je	0xe7 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0xe7>
      dc: eb 0e                        	jmp	0xec <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0xec>
      de: 45 31 c0                     	xorl	%r8d, %r8d
      e1: 49 83 f8 01                  	cmpq	$0x1, %r8
      e5: 75 05                        	jne	0xec <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0xec>
      e7: 48 39 c8                     	cmpq	%rcx, %rax
      ea: 74 5f                        	je	0x14b <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x14b>
      ec: 8b 06                        	movl	(%rsi), %eax
      ee: 48 8b 4e 08                  	movq	0x8(%rsi), %rcx
      f2: 4c 8b 46 10                  	movq	0x10(%rsi), %r8
      f6: 41 b9 ff ff ff ff            	movl	$0xffffffff, %r9d       # imm = 0xFFFFFFFF
      fc: f0                           	lock
      fd: 44 0f c1 4e 18               	xaddl	%r9d, 0x18(%rsi)
     102: 41 83 f9 01                  	cmpl	$0x1, %r9d
     106: 74 0b                        	je	0x113 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x113>
     108: 45 85 c9                     	testl	%r9d, %r9d
     10b: 0f 85 0f ff ff ff            	jne	0x20 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x20>
     111: eb 50                        	jmp	0x163 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x163>
     113: 49 89 d6                     	movq	%rdx, %r14
     116: 49 89 ff                     	movq	%rdi, %r15
     119: 4d 85 c0                     	testq	%r8, %r8
     11c: 74 08                        	je	0x126 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x126>
     11e: 48 89 cf                     	movq	%rcx, %rdi
     121: 41 ff d0                     	callq	*%r8
     124: eb 07                        	jmp	0x12d <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x12d>
     126: 89 c7                        	movl	%eax, %edi
     128: e8 00 00 00 00               	callq	0x12d <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x12d>
		0000000000000129:  R_X86_64_PLT32	toyos::net::stream::let_go-0x4
     12d: 4c 89 ff                     	movq	%r15, %rdi
     130: 4c 89 f2                     	movq	%r14, %rdx
     133: e9 e8 fe ff ff               	jmp	0x20 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x20>
     138: c6 47 01 00                  	movb	$0x0, 0x1(%rdi)
     13c: b0 01                        	movb	$0x1, %al
     13e: 88 07                        	movb	%al, (%rdi)
     140: 48 83 c4 18                  	addq	$0x18, %rsp
     144: 5b                           	popq	%rbx
     145: 41 5e                        	popq	%r14
     147: 41 5f                        	popq	%r15
     149: 5d                           	popq	%rbp
     14a: c3                           	retq
     14b: 48 8b 45 e0                  	movq	-0x20(%rbp), %rax
     14f: 48 89 47 20                  	movq	%rax, 0x20(%rdi)
     153: 0f 28 45 d0                  	movaps	-0x30(%rbp), %xmm0
     157: 0f 11 47 10                  	movups	%xmm0, 0x10(%rdi)
     15b: 48 89 4f 08                  	movq	%rcx, 0x8(%rdi)
     15f: 31 c0                        	xorl	%eax, %eax
     161: eb db                        	jmp	0x13e <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x13e>
     163: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x16a <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x16a>
		0000000000000166:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     16a: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x171 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x171>
		000000000000016d:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     171: be 5f 00 00 00               	movl	$0x5f, %esi
     176: e8 00 00 00 00               	callq	0x17b <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x17b>
		0000000000000177:  R_X86_64_PLT32	core::panicking::panic_fmt-0x4
