Disassembly of section .text._RNCNvNtNtCsX_5toyos2fd5owner16toyos_fd_acquire0B7_:

0000000000000000 <toyos::fd::owner::toyos_fd_acquire::{closure#0}>:
       0: 55                           	pushq	%rbp
       1: 48 89 e5                     	movq	%rsp, %rbp
       4: 41 57                        	pushq	%r15
       6: 41 56                        	pushq	%r14
       8: 41 54                        	pushq	%r12
       a: 53                           	pushq	%rbx
       b: 48 83 ec 20                  	subq	$0x20, %rsp
       f: 81 fe ff 0f 00 00            	cmpl	$0xfff, %esi            # imm = 0xFFF
      15: 0f 87 13 01 00 00            	ja	0x12e <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x12e>
      1b: 89 f3                        	movl	%esi, %ebx
      1d: 8b 84 9a 00 00 04 00         	movl	0x40000(%rdx,%rbx,4), %eax
      24: 85 c0                        	testl	%eax, %eax
      26: 0f 84 02 01 00 00            	je	0x12e <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x12e>
      2c: 25 ff ff ff 7f               	andl	$0x7fffffff, %eax       # imm = 0x7FFFFFFF
      31: 74 1c                        	je	0x4f <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x4f>
      33: 89 c1                        	movl	%eax, %ecx
      35: 48 ff c9                     	decq	%rcx
      38: 45 31 c0                     	xorl	%r8d, %r8d
      3b: 3d 01 10 00 00               	cmpl	$0x1001, %eax           # imm = 0x1001
      40: 41 0f 92 c0                  	setb	%r8b
      44: 49 83 f8 01                  	cmpq	$0x1, %r8
      48: 74 12                        	je	0x5c <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x5c>
      4a: e9 1b 01 00 00               	jmp	0x16a <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x16a>
      4f: 45 31 c0                     	xorl	%r8d, %r8d
      52: 49 83 f8 01                  	cmpq	$0x1, %r8
      56: 0f 85 0e 01 00 00            	jne	0x16a <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x16a>
      5c: 48 81 f9 ff 0f 00 00         	cmpq	$0xfff, %rcx            # imm = 0xFFF
      63: 0f 87 01 01 00 00            	ja	0x16a <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x16a>
      69: 48 89 c8                     	movq	%rcx, %rax
      6c: 48 c1 e0 06                  	shlq	$0x6, %rax
      70: 4c 8d 04 02                  	leaq	(%rdx,%rax), %r8
      74: 8b 44 02 18                  	movl	0x18(%rdx,%rax), %eax
      78: 85 c0                        	testl	%eax, %eax
      7a: 0f 84 c0 00 00 00            	je	0x140 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x140>
      80: 83 f8 ff                     	cmpl	$-0x1, %eax
      83: 0f 84 e1 00 00 00            	je	0x16a <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x16a>
      89: 44 8d 48 01                  	leal	0x1(%rax), %r9d
      8d: f0                           	lock
      8e: 45 0f b1 48 18               	cmpxchgl	%r9d, 0x18(%r8)
      93: 75 e3                        	jne	0x78 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x78>
      95: 49 8b 40 10                  	movq	0x10(%r8), %rax
      99: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
      9d: 41 0f 10 00                  	movups	(%r8), %xmm0
      a1: 0f 29 45 c0                  	movaps	%xmm0, -0x40(%rbp)
      a5: 8b 84 9a 00 00 04 00         	movl	0x40000(%rdx,%rbx,4), %eax
      ac: 85 c0                        	testl	%eax, %eax
      ae: 74 2b                        	je	0xdb <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0xdb>
      b0: 25 ff ff ff 7f               	andl	$0x7fffffff, %eax       # imm = 0x7FFFFFFF
      b5: 74 16                        	je	0xcd <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0xcd>
      b7: 41 89 c2                     	movl	%eax, %r10d
      ba: 48 ff c8                     	decq	%rax
      bd: 45 31 c9                     	xorl	%r9d, %r9d
      c0: 41 81 fa 01 10 00 00         	cmpl	$0x1001, %r10d          # imm = 0x1001
      c7: 41 0f 92 c1                  	setb	%r9b
      cb: eb 03                        	jmp	0xd0 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0xd0>
      cd: 45 31 c9                     	xorl	%r9d, %r9d
      d0: 49 83 f9 01                  	cmpq	$0x1, %r9
      d4: 75 05                        	jne	0xdb <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0xdb>
      d6: 48 39 c8                     	cmpq	%rcx, %rax
      d9: 74 76                        	je	0x151 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x151>
      db: 41 8b 00                     	movl	(%r8), %eax
      de: 49 8b 48 08                  	movq	0x8(%r8), %rcx
      e2: 4d 8b 48 10                  	movq	0x10(%r8), %r9
      e6: 41 ba ff ff ff ff            	movl	$0xffffffff, %r10d      # imm = 0xFFFFFFFF
      ec: f0                           	lock
      ed: 45 0f c1 50 18               	xaddl	%r10d, 0x18(%r8)
      f2: 41 83 fa 01                  	cmpl	$0x1, %r10d
      f6: 74 0b                        	je	0x103 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x103>
      f8: 45 85 d2                     	testl	%r10d, %r10d
      fb: 0f 85 1c ff ff ff            	jne	0x1d <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x1d>
     101: eb 67                        	jmp	0x16a <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x16a>
     103: 49 89 d6                     	movq	%rdx, %r14
     106: 41 89 f7                     	movl	%esi, %r15d
     109: 49 89 fc                     	movq	%rdi, %r12
     10c: 4d 85 c9                     	testq	%r9, %r9
     10f: 74 08                        	je	0x119 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x119>
     111: 48 89 cf                     	movq	%rcx, %rdi
     114: 41 ff d1                     	callq	*%r9
     117: eb 07                        	jmp	0x120 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x120>
     119: 89 c7                        	movl	%eax, %edi
     11b: e8 00 00 00 00               	callq	0x120 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x120>
		000000000000011c:  R_X86_64_PLT32	toyos::net::stream::let_go-0x4
     120: 4c 89 e7                     	movq	%r12, %rdi
     123: 44 89 fe                     	movl	%r15d, %esi
     126: 4c 89 f2                     	movq	%r14, %rdx
     129: e9 ef fe ff ff               	jmp	0x1d <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x1d>
     12e: 66 c7 07 01 00               	movw	$0x1, (%rdi)
     133: 48 83 c4 20                  	addq	$0x20, %rsp
     137: 5b                           	popq	%rbx
     138: 41 5c                        	popq	%r12
     13a: 41 5e                        	popq	%r14
     13c: 41 5f                        	popq	%r15
     13e: 5d                           	popq	%rbp
     13f: c3                           	retq
     140: 48 83 c4 20                  	addq	$0x20, %rsp
     144: 5b                           	popq	%rbx
     145: 41 5c                        	popq	%r12
     147: 41 5e                        	popq	%r14
     149: 41 5f                        	popq	%r15
     14b: 5d                           	popq	%rbp
     14c: e9 00 00 00 00               	jmp	0x151 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x151>
		000000000000014d:  R_X86_64_PLT32	.text.unlikely._RNvNtNtCsX_5toyos2fd5owner7settled-0x4
     151: 48 8b 45 d0                  	movq	-0x30(%rbp), %rax
     155: 48 89 47 20                  	movq	%rax, 0x20(%rdi)
     159: 0f 28 45 c0                  	movaps	-0x40(%rbp), %xmm0
     15d: 0f 11 47 10                  	movups	%xmm0, 0x10(%rdi)
     161: 48 89 4f 08                  	movq	%rcx, 0x8(%rdi)
     165: c6 07 00                     	movb	$0x0, (%rdi)
     168: eb c9                        	jmp	0x133 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x133>
     16a: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x171 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x171>
		000000000000016d:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     171: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x178 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x178>
		0000000000000174:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     178: be 5f 00 00 00               	movl	$0x5f, %esi
     17d: e8 00 00 00 00               	callq	0x182 <toyos::fd::owner::toyos_fd_acquire::{closure#0}+0x182>
		000000000000017e:  R_X86_64_PLT32	core::panicking::panic_fmt-0x4
