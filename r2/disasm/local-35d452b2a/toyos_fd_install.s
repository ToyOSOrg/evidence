Disassembly of section .text.toyos_fd_install:

0000000000000000 <toyos_fd_install>:
       0: 55                           	pushq	%rbp
       1: 48 89 e5                     	movq	%rsp, %rbp
       4: 41 57                        	pushq	%r15
       6: 41 56                        	pushq	%r14
       8: 41 55                        	pushq	%r13
       a: 41 54                        	pushq	%r12
       c: 53                           	pushq	%rbx
       d: 48 83 ec 28                  	subq	$0x28, %rsp
      11: 41 89 f6                     	movl	%esi, %r14d
      14: 89 fb                        	movl	%edi, %ebx
      16: e8 00 00 00 00               	callq	0x1b <toyos_fd_install+0x1b>
		0000000000000017:  R_X86_64_PLT32	<toyos::endow::Endowments>::get-0x4
      1b: b9 01 00 00 00               	movl	$0x1, %ecx
      20: 31 c0                        	xorl	%eax, %eax
      22: f0                           	lock
      23: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x2a <toyos_fd_install+0x2a>
		0000000000000026:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      2a: 0f 84 f4 00 00 00            	je	0x124 <toyos_fd_install+0x124>
      30: ba 64 00 00 00               	movl	$0x64, %edx
      35: eb 24                        	jmp	0x5b <toyos_fd_install+0x5b>
      37: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
      40: 31 c0                        	xorl	%eax, %eax
      42: f0                           	lock
      43: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x4a <toyos_fd_install+0x4a>
		0000000000000046:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      4a: 0f 84 d4 00 00 00            	je	0x124 <toyos_fd_install+0x124>
      50: f3 90                        	pause
      52: 83 c2 fc                     	addl	$-0x4, %edx
      55: 0f 84 8a 00 00 00            	je	0xe5 <toyos_fd_install+0xe5>
      5b: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0x61 <toyos_fd_install+0x61>
		000000000000005d:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      61: 85 c0                        	testl	%eax, %eax
      63: 74 0b                        	je	0x70 <toyos_fd_install+0x70>
      65: 83 f8 02                     	cmpl	$0x2, %eax
      68: 75 16                        	jne	0x80 <toyos_fd_install+0x80>
      6a: eb 79                        	jmp	0xe5 <toyos_fd_install+0xe5>
      6c: 0f 1f 40 00                  	nopl	(%rax)
      70: 31 c0                        	xorl	%eax, %eax
      72: f0                           	lock
      73: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x7a <toyos_fd_install+0x7a>
		0000000000000076:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      7a: 0f 84 a4 00 00 00            	je	0x124 <toyos_fd_install+0x124>
      80: f3 90                        	pause
      82: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0x88 <toyos_fd_install+0x88>
		0000000000000084:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      88: 85 c0                        	testl	%eax, %eax
      8a: 74 14                        	je	0xa0 <toyos_fd_install+0xa0>
      8c: 83 f8 02                     	cmpl	$0x2, %eax
      8f: 75 1b                        	jne	0xac <toyos_fd_install+0xac>
      91: eb 52                        	jmp	0xe5 <toyos_fd_install+0xe5>
      93: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
      a0: 31 c0                        	xorl	%eax, %eax
      a2: f0                           	lock
      a3: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0xaa <toyos_fd_install+0xaa>
		00000000000000a6:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      aa: 74 78                        	je	0x124 <toyos_fd_install+0x124>
      ac: f3 90                        	pause
      ae: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0xb4 <toyos_fd_install+0xb4>
		00000000000000b0:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      b4: 85 c0                        	testl	%eax, %eax
      b6: 74 08                        	je	0xc0 <toyos_fd_install+0xc0>
      b8: 83 f8 02                     	cmpl	$0x2, %eax
      bb: 75 0f                        	jne	0xcc <toyos_fd_install+0xcc>
      bd: eb 26                        	jmp	0xe5 <toyos_fd_install+0xe5>
      bf: 90                           	nop
      c0: 31 c0                        	xorl	%eax, %eax
      c2: f0                           	lock
      c3: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0xca <toyos_fd_install+0xca>
		00000000000000c6:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      ca: 74 58                        	je	0x124 <toyos_fd_install+0x124>
      cc: f3 90                        	pause
      ce: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0xd4 <toyos_fd_install+0xd4>
		00000000000000d0:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      d4: 85 c0                        	testl	%eax, %eax
      d6: 0f 84 64 ff ff ff            	je	0x40 <toyos_fd_install+0x40>
      dc: 83 f8 02                     	cmpl	$0x2, %eax
      df: 0f 85 6b ff ff ff            	jne	0x50 <toyos_fd_install+0x50>
      e5: b8 02 00 00 00               	movl	$0x2, %eax
      ea: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0xf0 <toyos_fd_install+0xf0>
		00000000000000ec:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      f0: 85 c0                        	testl	%eax, %eax
      f2: 74 30                        	je	0x124 <toyos_fd_install+0x124>
      f4: 48 8d 35 00 00 00 00         	leaq	(%rip), %rsi            # 0xfb <toyos_fd_install+0xfb>
		00000000000000f7:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      fb: bf 3a 00 00 00               	movl	$0x3a, %edi
     100: ba 02 00 00 00               	movl	$0x2, %edx
     105: 49 c7 c0 ff ff ff ff         	movq	$-0x1, %r8
     10c: 0f 1f 40 00                  	nopl	(%rax)
     110: 45 31 c9                     	xorl	%r9d, %r9d
     113: 0f 05                        	syscall
     115: b8 02 00 00 00               	movl	$0x2, %eax
     11a: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x120 <toyos_fd_install+0x120>
		000000000000011c:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     120: 85 c0                        	testl	%eax, %eax
     122: 75 ec                        	jne	0x110 <toyos_fd_install+0x110>
     124: 4c 8d 3d 00 00 00 00         	leaq	(%rip), %r15            # 0x12b <toyos_fd_install+0x12b>
		0000000000000127:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner5TABLE-0x4
     12b: 4c 89 7d b8                  	movq	%r15, -0x48(%rbp)
     12f: 0f b6 05 00 00 00 00         	movzbl	(%rip), %eax            # 0x136 <toyos_fd_install+0x136>
		0000000000000132:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x4
     136: 84 c0                        	testb	%al, %al
     138: 74 12                        	je	0x14c <toyos_fd_install+0x14c>
     13a: 45 31 e4                     	xorl	%r12d, %r12d
     13d: 41 81 fe ff 0f 00 00         	cmpl	$0xfff, %r14d           # imm = 0xFFF
     144: 0f 87 90 00 00 00            	ja	0x1da <toyos_fd_install+0x1da>
     14a: eb 54                        	jmp	0x1a0 <toyos_fd_install+0x1a0>
     14c: 48 8d 7d c0                  	leaq	-0x40(%rbp), %rdi
     150: 48 8d 75 b8                  	leaq	-0x48(%rbp), %rsi
     154: e8 00 00 00 00               	callq	0x159 <toyos_fd_install+0x159>
		0000000000000155:  R_X86_64_PLT32	.text._RNvNtNtCsX_5toyos2fd5owner5endow-0x4
     159: 80 7d c0 00                  	cmpb	$0x0, -0x40(%rbp)
     15d: 74 2d                        	je	0x18c <toyos_fd_install+0x18c>
     15f: 0f b6 45 c1                  	movzbl	-0x3f(%rbp), %eax
     163: 89 45 d4                     	movl	%eax, -0x2c(%rbp)
     166: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x16d <toyos_fd_install+0x16d>
		0000000000000168:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     16d: 41 b5 01                     	movb	$0x1, %r13b
     170: 45 31 e4                     	xorl	%r12d, %r12d
     173: 45 31 ff                     	xorl	%r15d, %r15d
     176: 31 c0                        	xorl	%eax, %eax
     178: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x17e <toyos_fd_install+0x17e>
		000000000000017a:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     17e: 83 f8 02                     	cmpl	$0x2, %eax
     181: 0f 84 12 01 00 00            	je	0x299 <toyos_fd_install+0x299>
     187: e9 26 01 00 00               	jmp	0x2b2 <toyos_fd_install+0x2b2>
     18c: 4c 8b 65 c8                  	movq	-0x38(%rbp), %r12
     190: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x197 <toyos_fd_install+0x197>
		0000000000000192:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     197: 41 81 fe ff 0f 00 00         	cmpl	$0xfff, %r14d           # imm = 0xFFF
     19e: 77 3a                        	ja	0x1da <toyos_fd_install+0x1da>
     1a0: 44 89 f0                     	movl	%r14d, %eax
     1a3: 49 89 c5                     	movq	%rax, %r13
     1a6: 49 c1 e5 20                  	shlq	$0x20, %r13
     1aa: 48 b9 00 00 00 00 01 00 00 00	movabsq	$0x100000000, %rcx      # imm = 0x100000000
     1b4: 66 66 66 2e 0f 1f 84 00 00 00 00 00  	nopw	%cs:(%rax,%rax)
     1c0: 41 8b 94 87 00 00 04 00      	movl	0x40000(%r15,%rax,4), %edx
     1c8: 85 d2                        	testl	%edx, %edx
     1ca: 74 19                        	je	0x1e5 <toyos_fd_install+0x1e5>
     1cc: 48 ff c0                     	incq	%rax
     1cf: 49 01 cd                     	addq	%rcx, %r13
     1d2: 48 3d 00 10 00 00            	cmpq	$0x1000, %rax           # imm = 0x1000
     1d8: 75 e6                        	jne	0x1c0 <toyos_fd_install+0x1c0>
     1da: 41 bd 01 01 00 00            	movl	$0x101, %r13d           # imm = 0x101
     1e0: e9 91 00 00 00               	jmp	0x276 <toyos_fd_install+0x276>
     1e5: 31 c9                        	xorl	%ecx, %ecx
     1e7: 31 d2                        	xorl	%edx, %edx
     1e9: 0f 1f 80 00 00 00 00         	nopl	(%rax)
     1f0: 42 8b 74 3a 18               	movl	0x18(%rdx,%r15), %esi
     1f5: 85 f6                        	testl	%esi, %esi
     1f7: 74 46                        	je	0x23f <toyos_fd_install+0x23f>
     1f9: 42 8b 74 3a 58               	movl	0x58(%rdx,%r15), %esi
     1fe: 85 f6                        	testl	%esi, %esi
     200: 74 2e                        	je	0x230 <toyos_fd_install+0x230>
     202: 42 8b b4 3a 98 00 00 00      	movl	0x98(%rdx,%r15), %esi
     20a: 85 f6                        	testl	%esi, %esi
     20c: 74 27                        	je	0x235 <toyos_fd_install+0x235>
     20e: 42 8b b4 3a d8 00 00 00      	movl	0xd8(%rdx,%r15), %esi
     216: 85 f6                        	testl	%esi, %esi
     218: 74 21                        	je	0x23b <toyos_fd_install+0x23b>
     21a: 48 81 c2 00 01 00 00         	addq	$0x100, %rdx            # imm = 0x100
     221: 48 83 c1 04                  	addq	$0x4, %rcx
     225: 48 81 fa 00 00 04 00         	cmpq	$0x40000, %rdx          # imm = 0x40000
     22c: 75 c2                        	jne	0x1f0 <toyos_fd_install+0x1f0>
     22e: eb aa                        	jmp	0x1da <toyos_fd_install+0x1da>
     230: 48 ff c1                     	incq	%rcx
     233: eb 0a                        	jmp	0x23f <toyos_fd_install+0x23f>
     235: 48 83 c1 02                  	addq	$0x2, %rcx
     239: eb 04                        	jmp	0x23f <toyos_fd_install+0x23f>
     23b: 48 83 c1 03                  	addq	$0x3, %rcx
     23f: 48 89 ca                     	movq	%rcx, %rdx
     242: 48 c1 e2 06                  	shlq	$0x6, %rdx
     246: 48 8d 7d 10                  	leaq	0x10(%rbp), %rdi
     24a: 48 8b 77 10                  	movq	0x10(%rdi), %rsi
     24e: 4a 89 74 3a 10               	movq	%rsi, 0x10(%rdx,%r15)
     253: 0f 10 07                     	movups	(%rdi), %xmm0
     256: 42 0f 11 04 3a               	movups	%xmm0, (%rdx,%r15)
     25b: 42 c7 44 3a 18 01 00 00 00   	movl	$0x1, 0x18(%rdx,%r15)
     264: 0f b6 d3                     	movzbl	%bl, %edx
     267: c1 e2 1f                     	shll	$0x1f, %edx
     26a: 01 d1                        	addl	%edx, %ecx
     26c: ff c1                        	incl	%ecx
     26e: 41 89 8c 87 00 00 04 00      	movl	%ecx, 0x40000(%r15,%rax,4)
     276: 44 89 e8                     	movl	%r13d, %eax
     279: c1 e8 08                     	shrl	$0x8, %eax
     27c: 89 45 d4                     	movl	%eax, -0x2c(%rbp)
     27f: 49 bf 00 00 00 00 ff ff ff 7f	movabsq	$0x7fffffff00000000, %r15 # imm = 0x7FFFFFFF00000000
     289: 4d 21 ef                     	andq	%r13, %r15
     28c: 31 c0                        	xorl	%eax, %eax
     28e: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x294 <toyos_fd_install+0x294>
		0000000000000290:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     294: 83 f8 02                     	cmpl	$0x2, %eax
     297: 75 19                        	jne	0x2b2 <toyos_fd_install+0x2b2>
     299: 48 8d 35 00 00 00 00         	leaq	(%rip), %rsi            # 0x2a0 <toyos_fd_install+0x2a0>
		000000000000029c:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     2a0: bf 3b 00 00 00               	movl	$0x3b, %edi
     2a5: ba 01 00 00 00               	movl	$0x1, %edx
     2aa: 45 31 c0                     	xorl	%r8d, %r8d
     2ad: 45 31 c9                     	xorl	%r9d, %r9d
     2b0: 0f 05                        	syscall
     2b2: 4d 85 e4                     	testq	%r12, %r12
     2b5: 74 3b                        	je	0x2f2 <toyos_fd_install+0x2f2>
     2b7: 48 8d 1d 00 00 00 00         	leaq	(%rip), %rbx            # 0x2be <toyos_fd_install+0x2be>
		00000000000002ba:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     2be: 4c 8d 75 c0                  	leaq	-0x40(%rbp), %r14
     2c2: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
     2d0: ba 3f 00 00 00               	movl	$0x3f, %edx
     2d5: bf 02 00 00 00               	movl	$0x2, %edi
     2da: 48 89 de                     	movq	%rbx, %rsi
     2dd: e8 00 00 00 00               	callq	0x2e2 <toyos_fd_install+0x2e2>
		00000000000002de:  R_X86_64_PLT32	toyos_fs_write-0x4
     2e2: 4c 89 f7                     	movq	%r14, %rdi
     2e5: 48 89 c6                     	movq	%rax, %rsi
     2e8: e8 00 00 00 00               	callq	0x2ed <toyos_fd_install+0x2ed>
		00000000000002e9:  R_X86_64_PLT32	.text._RNvNtCsX_5toyos5files6decode-0x4
     2ed: 49 ff cc                     	decq	%r12
     2f0: 75 de                        	jne	0x2d0 <toyos_fd_install+0x2d0>
     2f2: 41 f6 c5 01                  	testb	$0x1, %r13b
     2f6: 48 8d 4d 10                  	leaq	0x10(%rbp), %rcx
     2fa: 74 12                        	je	0x30e <toyos_fd_install+0x30e>
     2fc: 8b 45 d4                     	movl	-0x2c(%rbp), %eax
     2ff: 3c 02                        	cmpb	$0x2, %al
     301: 74 50                        	je	0x353 <toyos_fd_install+0x353>
     303: 44 0f b6 f8                  	movzbl	%al, %r15d
     307: 41 c1 e7 08                  	shll	$0x8, %r15d
     30b: 49 ff c7                     	incq	%r15
     30e: 41 f6 c7 01                  	testb	$0x1, %r15b
     312: 74 11                        	je	0x325 <toyos_fd_install+0x325>
     314: 48 8b 41 10                  	movq	0x10(%rcx), %rax
     318: 48 85 c0                     	testq	%rax, %rax
     31b: 74 11                        	je	0x32e <toyos_fd_install+0x32e>
     31d: 48 8b 79 08                  	movq	0x8(%rcx), %rdi
     321: ff d0                        	callq	*%rax
     323: eb 10                        	jmp	0x335 <toyos_fd_install+0x335>
     325: 49 c1 ef 20                  	shrq	$0x20, %r15
     329: 44 89 f8                     	movl	%r15d, %eax
     32c: eb 16                        	jmp	0x344 <toyos_fd_install+0x344>
     32e: 8b 39                        	movl	(%rcx), %edi
     330: e8 00 00 00 00               	callq	0x335 <toyos_fd_install+0x335>
		0000000000000331:  R_X86_64_PLT32	toyos::net::stream::let_go-0x4
     335: 31 c0                        	xorl	%eax, %eax
     337: 41 f7 c7 00 01 00 00         	testl	$0x100, %r15d           # imm = 0x100
     33e: 0f 94 c0                     	sete	%al
     341: 83 c8 fe                     	orl	$-0x2, %eax
     344: 48 83 c4 28                  	addq	$0x28, %rsp
     348: 5b                           	popq	%rbx
     349: 41 5c                        	popq	%r12
     34b: 41 5d                        	popq	%r13
     34d: 41 5e                        	popq	%r14
     34f: 41 5f                        	popq	%r15
     351: 5d                           	popq	%rbp
     352: c3                           	retq
     353: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x35a <toyos_fd_install+0x35a>
		0000000000000356:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     35a: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x361 <toyos_fd_install+0x361>
		000000000000035d:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     361: be 5f 00 00 00               	movl	$0x5f, %esi
     366: e8 00 00 00 00               	callq	0x36b <toyos_fd_install+0x36b>
		0000000000000367:  R_X86_64_PLT32	core::panicking::panic_fmt-0x4
     36b: 0f 0b                        	ud2
     36d: 31 c0                        	xorl	%eax, %eax
     36f: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x375 <toyos_fd_install+0x375>
		0000000000000371:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     375: 83 f8 02                     	cmpl	$0x2, %eax
     378: 75 23                        	jne	0x39d <toyos_fd_install+0x39d>
     37a: 48 8d 35 00 00 00 00         	leaq	(%rip), %rsi            # 0x381 <toyos_fd_install+0x381>
		000000000000037d:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     381: bf 3b 00 00 00               	movl	$0x3b, %edi
     386: ba 01 00 00 00               	movl	$0x1, %edx
     38b: 45 31 c0                     	xorl	%r8d, %r8d
     38e: 45 31 c9                     	xorl	%r9d, %r9d
     391: 0f 05                        	syscall
     393: e8 00 00 00 00               	callq	0x398 <toyos_fd_install+0x398>
		0000000000000394:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     398: e8 00 00 00 00               	callq	0x39d <toyos_fd_install+0x39d>
		0000000000000399:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     39d: e8 00 00 00 00               	callq	0x3a2 <toyos_fd_install+0x3a2>
		000000000000039e:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
