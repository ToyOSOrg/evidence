Disassembly of section .text.toyos_fd_dup2:

0000000000000000 <toyos_fd_dup2>:
       0: 55                           	pushq	%rbp
       1: 48 89 e5                     	movq	%rsp, %rbp
       4: 41 57                        	pushq	%r15
       6: 41 56                        	pushq	%r14
       8: 41 55                        	pushq	%r13
       a: 41 54                        	pushq	%r12
       c: 53                           	pushq	%rbx
       d: 48 83 ec 48                  	subq	$0x48, %rsp
      11: 41 89 d7                     	movl	%edx, %r15d
      14: 89 f3                        	movl	%esi, %ebx
      16: 41 89 fc                     	movl	%edi, %r12d
      19: e8 00 00 00 00               	callq	0x1e <toyos_fd_dup2+0x1e>
		000000000000001a:  R_X86_64_PLT32	<toyos::endow::Endowments>::get-0x4
      1e: b9 01 00 00 00               	movl	$0x1, %ecx
      23: 31 c0                        	xorl	%eax, %eax
      25: f0                           	lock
      26: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x2d <toyos_fd_dup2+0x2d>
		0000000000000029:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      2d: 0f 84 f1 00 00 00            	je	0x124 <toyos_fd_dup2+0x124>
      33: ba 64 00 00 00               	movl	$0x64, %edx
      38: eb 21                        	jmp	0x5b <toyos_fd_dup2+0x5b>
      3a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
      40: 31 c0                        	xorl	%eax, %eax
      42: f0                           	lock
      43: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x4a <toyos_fd_dup2+0x4a>
		0000000000000046:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      4a: 0f 84 d4 00 00 00            	je	0x124 <toyos_fd_dup2+0x124>
      50: f3 90                        	pause
      52: 83 c2 fc                     	addl	$-0x4, %edx
      55: 0f 84 8a 00 00 00            	je	0xe5 <toyos_fd_dup2+0xe5>
      5b: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0x61 <toyos_fd_dup2+0x61>
		000000000000005d:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      61: 85 c0                        	testl	%eax, %eax
      63: 74 0b                        	je	0x70 <toyos_fd_dup2+0x70>
      65: 83 f8 02                     	cmpl	$0x2, %eax
      68: 75 16                        	jne	0x80 <toyos_fd_dup2+0x80>
      6a: eb 79                        	jmp	0xe5 <toyos_fd_dup2+0xe5>
      6c: 0f 1f 40 00                  	nopl	(%rax)
      70: 31 c0                        	xorl	%eax, %eax
      72: f0                           	lock
      73: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x7a <toyos_fd_dup2+0x7a>
		0000000000000076:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      7a: 0f 84 a4 00 00 00            	je	0x124 <toyos_fd_dup2+0x124>
      80: f3 90                        	pause
      82: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0x88 <toyos_fd_dup2+0x88>
		0000000000000084:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      88: 85 c0                        	testl	%eax, %eax
      8a: 74 14                        	je	0xa0 <toyos_fd_dup2+0xa0>
      8c: 83 f8 02                     	cmpl	$0x2, %eax
      8f: 75 1b                        	jne	0xac <toyos_fd_dup2+0xac>
      91: eb 52                        	jmp	0xe5 <toyos_fd_dup2+0xe5>
      93: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
      a0: 31 c0                        	xorl	%eax, %eax
      a2: f0                           	lock
      a3: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0xaa <toyos_fd_dup2+0xaa>
		00000000000000a6:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      aa: 74 78                        	je	0x124 <toyos_fd_dup2+0x124>
      ac: f3 90                        	pause
      ae: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0xb4 <toyos_fd_dup2+0xb4>
		00000000000000b0:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      b4: 85 c0                        	testl	%eax, %eax
      b6: 74 08                        	je	0xc0 <toyos_fd_dup2+0xc0>
      b8: 83 f8 02                     	cmpl	$0x2, %eax
      bb: 75 0f                        	jne	0xcc <toyos_fd_dup2+0xcc>
      bd: eb 26                        	jmp	0xe5 <toyos_fd_dup2+0xe5>
      bf: 90                           	nop
      c0: 31 c0                        	xorl	%eax, %eax
      c2: f0                           	lock
      c3: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0xca <toyos_fd_dup2+0xca>
		00000000000000c6:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      ca: 74 58                        	je	0x124 <toyos_fd_dup2+0x124>
      cc: f3 90                        	pause
      ce: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0xd4 <toyos_fd_dup2+0xd4>
		00000000000000d0:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      d4: 85 c0                        	testl	%eax, %eax
      d6: 0f 84 64 ff ff ff            	je	0x40 <toyos_fd_dup2+0x40>
      dc: 83 f8 02                     	cmpl	$0x2, %eax
      df: 0f 85 6b ff ff ff            	jne	0x50 <toyos_fd_dup2+0x50>
      e5: b8 02 00 00 00               	movl	$0x2, %eax
      ea: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0xf0 <toyos_fd_dup2+0xf0>
		00000000000000ec:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      f0: 85 c0                        	testl	%eax, %eax
      f2: 74 30                        	je	0x124 <toyos_fd_dup2+0x124>
      f4: 48 8d 35 00 00 00 00         	leaq	(%rip), %rsi            # 0xfb <toyos_fd_dup2+0xfb>
		00000000000000f7:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      fb: bf 3a 00 00 00               	movl	$0x3a, %edi
     100: ba 02 00 00 00               	movl	$0x2, %edx
     105: 49 c7 c0 ff ff ff ff         	movq	$-0x1, %r8
     10c: 0f 1f 40 00                  	nopl	(%rax)
     110: 45 31 c9                     	xorl	%r9d, %r9d
     113: 0f 05                        	syscall
     115: b8 02 00 00 00               	movl	$0x2, %eax
     11a: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x120 <toyos_fd_dup2+0x120>
		000000000000011c:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     120: 85 c0                        	testl	%eax, %eax
     122: 75 ec                        	jne	0x110 <toyos_fd_dup2+0x110>
     124: 4c 8d 2d 00 00 00 00         	leaq	(%rip), %r13            # 0x12b <toyos_fd_dup2+0x12b>
		0000000000000127:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner5TABLE-0x4
     12b: 4c 89 6d 98                  	movq	%r13, -0x68(%rbp)
     12f: 0f b6 05 00 00 00 00         	movzbl	(%rip), %eax            # 0x136 <toyos_fd_dup2+0x136>
		0000000000000132:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x4
     136: 84 c0                        	testb	%al, %al
     138: 89 5d c4                     	movl	%ebx, -0x3c(%rbp)
     13b: 74 1c                        	je	0x159 <toyos_fd_dup2+0x159>
     13d: 48 c7 45 c8 00 00 00 00      	movq	$0x0, -0x38(%rbp)
     145: 45 31 f6                     	xorl	%r14d, %r14d
     148: 41 b2 01                     	movb	$0x1, %r10b
     14b: 41 81 fc ff 0f 00 00         	cmpl	$0xfff, %r12d           # imm = 0xFFF
     152: 76 5f                        	jbe	0x1b3 <toyos_fd_dup2+0x1b3>
     154: e9 ed 00 00 00               	jmp	0x246 <toyos_fd_dup2+0x246>
     159: 48 8d 7d b0                  	leaq	-0x50(%rbp), %rdi
     15d: 48 8d 75 98                  	leaq	-0x68(%rbp), %rsi
     161: e8 00 00 00 00               	callq	0x166 <toyos_fd_dup2+0x166>
		0000000000000162:  R_X86_64_PLT32	.text._RNvNtNtCsX_5toyos2fd5owner5endow-0x4
     166: 80 7d b0 00                  	cmpb	$0x0, -0x50(%rbp)
     16a: 74 24                        	je	0x190 <toyos_fd_dup2+0x190>
     16c: 0f b6 45 b1                  	movzbl	-0x4f(%rbp), %eax
     170: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
     174: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x17b <toyos_fd_dup2+0x17b>
		0000000000000176:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     17b: 41 b2 01                     	movb	$0x1, %r10b
     17e: 48 c7 45 c8 00 00 00 00      	movq	$0x0, -0x38(%rbp)
     186: 31 db                        	xorl	%ebx, %ebx
     188: 45 31 f6                     	xorl	%r14d, %r14d
     18b: e9 bf 01 00 00               	jmp	0x34f <toyos_fd_dup2+0x34f>
     190: 48 c7 45 c8 00 00 00 00      	movq	$0x0, -0x38(%rbp)
     198: 4c 8b 75 b8                  	movq	-0x48(%rbp), %r14
     19c: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x1a3 <toyos_fd_dup2+0x1a3>
		000000000000019e:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     1a3: 41 b2 01                     	movb	$0x1, %r10b
     1a6: 41 81 fc ff 0f 00 00         	cmpl	$0xfff, %r12d           # imm = 0xFFF
     1ad: 0f 87 93 00 00 00            	ja	0x246 <toyos_fd_dup2+0x246>
     1b3: 44 89 e0                     	movl	%r12d, %eax
     1b6: 41 8b 8c 85 00 00 04 00      	movl	0x40000(%r13,%rax,4), %ecx
     1be: 85 c9                        	testl	%ecx, %ecx
     1c0: 74 7c                        	je	0x23e <toyos_fd_dup2+0x23e>
     1c2: 48 c7 45 c8 00 00 00 00      	movq	$0x0, -0x38(%rbp)
     1ca: 81 e1 ff ff ff 7f            	andl	$0x7fffffff, %ecx       # imm = 0x7FFFFFFF
     1d0: 74 1b                        	je	0x1ed <toyos_fd_dup2+0x1ed>
     1d2: 89 ca                        	movl	%ecx, %edx
     1d4: 48 ff c9                     	decq	%rcx
     1d7: 31 c0                        	xorl	%eax, %eax
     1d9: 81 fa 01 10 00 00            	cmpl	$0x1001, %edx           # imm = 0x1001
     1df: 0f 92 c0                     	setb	%al
     1e2: 48 83 f8 01                  	cmpq	$0x1, %rax
     1e6: 74 11                        	je	0x1f9 <toyos_fd_dup2+0x1f9>
     1e8: e9 4a 01 00 00               	jmp	0x337 <toyos_fd_dup2+0x337>
     1ed: 31 c0                        	xorl	%eax, %eax
     1ef: 48 83 f8 01                  	cmpq	$0x1, %rax
     1f3: 0f 85 3e 01 00 00            	jne	0x337 <toyos_fd_dup2+0x337>
     1f9: 48 89 cf                     	movq	%rcx, %rdi
     1fc: 48 81 f9 ff 0f 00 00         	cmpq	$0xfff, %rcx            # imm = 0xFFF
     203: 0f 87 36 02 00 00            	ja	0x43f <toyos_fd_dup2+0x43f>
     209: 48 89 ca                     	movq	%rcx, %rdx
     20c: 48 c1 e2 06                  	shlq	$0x6, %rdx
     210: 42 8b 44 2a 18               	movl	0x18(%rdx,%r13), %eax
     215: 85 c0                        	testl	%eax, %eax
     217: 0f 84 22 01 00 00            	je	0x33f <toyos_fd_dup2+0x33f>
     21d: 81 fb ff 0f 00 00            	cmpl	$0xfff, %ebx            # imm = 0xFFF
     223: 77 19                        	ja	0x23e <toyos_fd_dup2+0x23e>
     225: 44 39 e3                     	cmpl	%r12d, %ebx
     228: 75 29                        	jne	0x253 <toyos_fd_dup2+0x253>
     22a: 48 c7 45 c8 00 00 00 00      	movq	$0x0, -0x38(%rbp)
     232: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
     236: 45 31 d2                     	xorl	%r10d, %r10d
     239: e9 0f 01 00 00               	jmp	0x34d <toyos_fd_dup2+0x34d>
     23e: 48 c7 45 c8 00 00 00 00      	movq	$0x0, -0x38(%rbp)
     246: 48 c7 45 d0 00 00 00 00      	movq	$0x0, -0x30(%rbp)
     24e: e9 fa 00 00 00               	jmp	0x34d <toyos_fd_dup2+0x34d>
     253: 89 de                        	movl	%ebx, %esi
     255: 41 8b bc b5 00 00 04 00      	movl	0x40000(%r13,%rsi,4), %edi
     25d: 41 b0 01                     	movb	$0x1, %r8b
     260: 85 ff                        	testl	%edi, %edi
     262: 74 1c                        	je	0x280 <toyos_fd_dup2+0x280>
     264: 81 e7 ff ff ff 7f            	andl	$0x7fffffff, %edi       # imm = 0x7FFFFFFF
     26a: 74 16                        	je	0x282 <toyos_fd_dup2+0x282>
     26c: 41 89 f9                     	movl	%edi, %r9d
     26f: 48 ff cf                     	decq	%rdi
     272: 31 c0                        	xorl	%eax, %eax
     274: 41 81 f9 01 10 00 00         	cmpl	$0x1001, %r9d           # imm = 0x1001
     27b: 0f 92 c0                     	setb	%al
     27e: eb 04                        	jmp	0x284 <toyos_fd_dup2+0x284>
     280: eb 27                        	jmp	0x2a9 <toyos_fd_dup2+0x2a9>
     282: 31 c0                        	xorl	%eax, %eax
     284: 48 83 f8 01                  	cmpq	$0x1, %rax
     288: 75 1f                        	jne	0x2a9 <toyos_fd_dup2+0x2a9>
     28a: 48 81 ff ff 0f 00 00         	cmpq	$0xfff, %rdi            # imm = 0xFFF
     291: 0f 87 a8 01 00 00            	ja	0x43f <toyos_fd_dup2+0x43f>
     297: 48 89 f8                     	movq	%rdi, %rax
     29a: 48 c1 e0 06                  	shlq	$0x6, %rax
     29e: 42 8b 44 28 18               	movl	0x18(%rax,%r13), %eax
     2a3: 85 c0                        	testl	%eax, %eax
     2a5: 41 0f 94 c0                  	sete	%r8b
     2a9: 4c 01 ea                     	addq	%r13, %rdx
     2ac: 8b 42 18                     	movl	0x18(%rdx), %eax
     2af: 44 8d 48 ff                  	leal	-0x1(%rax), %r9d
     2b3: 41 b2 01                     	movb	$0x1, %r10b
     2b6: 48 c7 45 c8 00 00 00 00      	movq	$0x0, -0x38(%rbp)
     2be: 41 83 f9 fd                  	cmpl	$-0x3, %r9d
     2c2: 77 73                        	ja	0x337 <toyos_fd_dup2+0x337>
     2c4: 44 8d 48 01                  	leal	0x1(%rax), %r9d
     2c8: f0                           	lock
     2c9: 44 0f b1 4a 18               	cmpxchgl	%r9d, 0x18(%rdx)
     2ce: 75 df                        	jne	0x2af <toyos_fd_dup2+0x2af>
     2d0: 81 fe ff 0f 00 00            	cmpl	$0xfff, %esi            # imm = 0xFFF
     2d6: 77 67                        	ja	0x33f <toyos_fd_dup2+0x33f>
     2d8: 41 0f b6 c7                  	movzbl	%r15b, %eax
     2dc: c1 e0 1f                     	shll	$0x1f, %eax
     2df: 01 c8                        	addl	%ecx, %eax
     2e1: ff c0                        	incl	%eax
     2e3: 41 89 84 b5 00 00 04 00      	movl	%eax, 0x40000(%r13,%rsi,4)
     2eb: 45 84 c0                     	testb	%r8b, %r8b
     2ee: 0f 85 36 ff ff ff            	jne	0x22a <toyos_fd_dup2+0x22a>
     2f4: 48 c1 e7 06                  	shlq	$0x6, %rdi
     2f8: 42 0f b6 04 2f               	movzbl	(%rdi,%r13), %eax
     2fd: 42 0f b7 74 2f 01            	movzwl	0x1(%rdi,%r13), %esi
     303: 42 0f b6 4c 2f 03            	movzbl	0x3(%rdi,%r13), %ecx
     309: 4e 8b 44 2f 08               	movq	0x8(%rdi,%r13), %r8
     30e: 4e 8b 4c 2f 10               	movq	0x10(%rdi,%r13), %r9
     313: ba ff ff ff ff               	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
     318: f0                           	lock
     319: 42 0f c1 54 2f 18            	xaddl	%edx, 0x18(%rdi,%r13)
     31f: 83 fa 01                     	cmpl	$0x1, %edx
     322: 0f 84 f5 00 00 00            	je	0x41d <toyos_fd_dup2+0x41d>
     328: b0 02                        	movb	$0x2, %al
     32a: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
     32e: 85 d2                        	testl	%edx, %edx
     330: 74 13                        	je	0x345 <toyos_fd_dup2+0x345>
     332: e9 f3 fe ff ff               	jmp	0x22a <toyos_fd_dup2+0x22a>
     337: b0 02                        	movb	$0x2, %al
     339: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
     33d: eb 0e                        	jmp	0x34d <toyos_fd_dup2+0x34d>
     33f: b0 02                        	movb	$0x2, %al
     341: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
     345: 48 c7 45 c8 00 00 00 00      	movq	$0x0, -0x38(%rbp)
     34d: 31 db                        	xorl	%ebx, %ebx
     34f: 4d 89 d7                     	movq	%r10, %r15
     352: 31 c0                        	xorl	%eax, %eax
     354: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x35a <toyos_fd_dup2+0x35a>
		0000000000000356:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     35a: 83 f8 02                     	cmpl	$0x2, %eax
     35d: 75 19                        	jne	0x378 <toyos_fd_dup2+0x378>
     35f: 48 8d 35 00 00 00 00         	leaq	(%rip), %rsi            # 0x366 <toyos_fd_dup2+0x366>
		0000000000000362:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     366: bf 3b 00 00 00               	movl	$0x3b, %edi
     36b: ba 01 00 00 00               	movl	$0x1, %edx
     370: 45 31 c0                     	xorl	%r8d, %r8d
     373: 45 31 c9                     	xorl	%r9d, %r9d
     376: 0f 05                        	syscall
     378: 4d 85 f6                     	testq	%r14, %r14
     37b: 74 35                        	je	0x3b2 <toyos_fd_dup2+0x3b2>
     37d: 4c 8d 25 00 00 00 00         	leaq	(%rip), %r12            # 0x384 <toyos_fd_dup2+0x384>
		0000000000000380:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     384: 4c 8d 6d b0                  	leaq	-0x50(%rbp), %r13
     388: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
     390: ba 3f 00 00 00               	movl	$0x3f, %edx
     395: bf 02 00 00 00               	movl	$0x2, %edi
     39a: 4c 89 e6                     	movq	%r12, %rsi
     39d: e8 00 00 00 00               	callq	0x3a2 <toyos_fd_dup2+0x3a2>
		000000000000039e:  R_X86_64_PLT32	toyos_fs_write-0x4
     3a2: 4c 89 ef                     	movq	%r13, %rdi
     3a5: 48 89 c6                     	movq	%rax, %rsi
     3a8: e8 00 00 00 00               	callq	0x3ad <toyos_fd_dup2+0x3ad>
		00000000000003a9:  R_X86_64_PLT32	.text._RNvNtCsX_5toyos5files6decode-0x4
     3ad: 49 ff ce                     	decq	%r14
     3b0: 75 de                        	jne	0x390 <toyos_fd_dup2+0x390>
     3b2: 45 84 ff                     	testb	%r15b, %r15b
     3b5: 74 13                        	je	0x3ca <toyos_fd_dup2+0x3ca>
     3b7: 48 8b 5d d0                  	movq	-0x30(%rbp), %rbx
     3bb: 80 fb 02                     	cmpb	$0x2, %bl
     3be: 74 43                        	je	0x403 <toyos_fd_dup2+0x403>
     3c0: 0f b6 c3                     	movzbl	%bl, %eax
     3c3: f7 d0                        	notl	%eax
     3c5: 83 c8 fe                     	orl	$-0x2, %eax
     3c8: eb 16                        	jmp	0x3e0 <toyos_fd_dup2+0x3e0>
     3ca: 84 db                        	testb	%bl, %bl
     3cc: 74 0f                        	je	0x3dd <toyos_fd_dup2+0x3dd>
     3ce: 48 8b 45 a0                  	movq	-0x60(%rbp), %rax
     3d2: 48 85 c0                     	testq	%rax, %rax
     3d5: 74 18                        	je	0x3ef <toyos_fd_dup2+0x3ef>
     3d7: 48 8b 7d a8                  	movq	-0x58(%rbp), %rdi
     3db: ff d0                        	callq	*%rax
     3dd: 8b 45 c4                     	movl	-0x3c(%rbp), %eax
     3e0: 48 83 c4 48                  	addq	$0x48, %rsp
     3e4: 5b                           	popq	%rbx
     3e5: 41 5c                        	popq	%r12
     3e7: 41 5d                        	popq	%r13
     3e9: 41 5e                        	popq	%r14
     3eb: 41 5f                        	popq	%r15
     3ed: 5d                           	popq	%rbp
     3ee: c3                           	retq
     3ef: 0f b6 45 d0                  	movzbl	-0x30(%rbp), %eax
     3f3: 48 8b 7d c8                  	movq	-0x38(%rbp), %rdi
     3f7: 09 c7                        	orl	%eax, %edi
     3f9: e8 00 00 00 00               	callq	0x3fe <toyos_fd_dup2+0x3fe>
		00000000000003fa:  R_X86_64_PLT32	toyos::net::stream::let_go-0x4
     3fe: 8b 45 c4                     	movl	-0x3c(%rbp), %eax
     401: eb dd                        	jmp	0x3e0 <toyos_fd_dup2+0x3e0>
     403: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x40a <toyos_fd_dup2+0x40a>
		0000000000000406:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     40a: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x411 <toyos_fd_dup2+0x411>
		000000000000040d:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     411: be 5f 00 00 00               	movl	$0x5f, %esi
     416: e8 00 00 00 00               	callq	0x41b <toyos_fd_dup2+0x41b>
		0000000000000417:  R_X86_64_PLT32	core::panicking::panic_fmt-0x4
     41b: eb 33                        	jmp	0x450 <toyos_fd_dup2+0x450>
     41d: 4c 89 4d a0                  	movq	%r9, -0x60(%rbp)
     421: 4c 89 45 a8                  	movq	%r8, -0x58(%rbp)
     425: c1 e1 10                     	shll	$0x10, %ecx
     428: 09 ce                        	orl	%ecx, %esi
     42a: c1 e6 08                     	shll	$0x8, %esi
     42d: 48 89 75 c8                  	movq	%rsi, -0x38(%rbp)
     431: b3 01                        	movb	$0x1, %bl
     433: 45 31 d2                     	xorl	%r10d, %r10d
     436: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
     43a: e9 10 ff ff ff               	jmp	0x34f <toyos_fd_dup2+0x34f>
     43f: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x446 <toyos_fd_dup2+0x446>
		0000000000000442:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     446: be 00 10 00 00               	movl	$0x1000, %esi           # imm = 0x1000
     44b: e8 00 00 00 00               	callq	0x450 <toyos_fd_dup2+0x450>
		000000000000044c:  R_X86_64_PLT32	core::panicking::panic_bounds_check-0x4
     450: 0f 0b                        	ud2
     452: 31 c0                        	xorl	%eax, %eax
     454: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x45a <toyos_fd_dup2+0x45a>
		0000000000000456:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     45a: 83 f8 02                     	cmpl	$0x2, %eax
     45d: 75 23                        	jne	0x482 <toyos_fd_dup2+0x482>
     45f: 48 8d 35 00 00 00 00         	leaq	(%rip), %rsi            # 0x466 <toyos_fd_dup2+0x466>
		0000000000000462:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     466: bf 3b 00 00 00               	movl	$0x3b, %edi
     46b: ba 01 00 00 00               	movl	$0x1, %edx
     470: 45 31 c0                     	xorl	%r8d, %r8d
     473: 45 31 c9                     	xorl	%r9d, %r9d
     476: 0f 05                        	syscall
     478: e8 00 00 00 00               	callq	0x47d <toyos_fd_dup2+0x47d>
		0000000000000479:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     47d: e8 00 00 00 00               	callq	0x482 <toyos_fd_dup2+0x482>
		000000000000047e:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     482: e8 00 00 00 00               	callq	0x487 <toyos_fd_dup2+0x487>
		0000000000000483:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
