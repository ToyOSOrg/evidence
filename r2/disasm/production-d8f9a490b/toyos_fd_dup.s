Disassembly of section .text.toyos_fd_dup:

0000000000000000 <toyos_fd_dup>:
       0: 55                           	pushq	%rbp
       1: 48 89 e5                     	movq	%rsp, %rbp
       4: 41 57                        	pushq	%r15
       6: 41 56                        	pushq	%r14
       8: 41 55                        	pushq	%r13
       a: 41 54                        	pushq	%r12
       c: 53                           	pushq	%rbx
       d: 48 83 ec 28                  	subq	$0x28, %rsp
      11: 41 89 d5                     	movl	%edx, %r13d
      14: 41 89 f6                     	movl	%esi, %r14d
      17: 41 89 ff                     	movl	%edi, %r15d
      1a: e8 00 00 00 00               	callq	0x1f <toyos_fd_dup+0x1f>
		000000000000001b:  R_X86_64_PLT32	<toyos::endow::Endowments>::get-0x4
      1f: b9 01 00 00 00               	movl	$0x1, %ecx
      24: 31 c0                        	xorl	%eax, %eax
      26: f0                           	lock
      27: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x2e <toyos_fd_dup+0x2e>
		000000000000002a:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      2e: 0f 84 ea 00 00 00            	je	0x11e <toyos_fd_dup+0x11e>
      34: ba 64 00 00 00               	movl	$0x64, %edx
      39: eb 20                        	jmp	0x5b <toyos_fd_dup+0x5b>
      3b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
      40: 31 c0                        	xorl	%eax, %eax
      42: f0                           	lock
      43: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x4a <toyos_fd_dup+0x4a>
		0000000000000046:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      4a: 0f 84 ce 00 00 00            	je	0x11e <toyos_fd_dup+0x11e>
      50: f3 90                        	pause
      52: 83 c2 fc                     	addl	$-0x4, %edx
      55: 0f 84 8a 00 00 00            	je	0xe5 <toyos_fd_dup+0xe5>
      5b: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0x61 <toyos_fd_dup+0x61>
		000000000000005d:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      61: 85 c0                        	testl	%eax, %eax
      63: 74 0b                        	je	0x70 <toyos_fd_dup+0x70>
      65: 83 f8 02                     	cmpl	$0x2, %eax
      68: 75 16                        	jne	0x80 <toyos_fd_dup+0x80>
      6a: eb 79                        	jmp	0xe5 <toyos_fd_dup+0xe5>
      6c: 0f 1f 40 00                  	nopl	(%rax)
      70: 31 c0                        	xorl	%eax, %eax
      72: f0                           	lock
      73: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x7a <toyos_fd_dup+0x7a>
		0000000000000076:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      7a: 0f 84 9e 00 00 00            	je	0x11e <toyos_fd_dup+0x11e>
      80: f3 90                        	pause
      82: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0x88 <toyos_fd_dup+0x88>
		0000000000000084:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      88: 85 c0                        	testl	%eax, %eax
      8a: 74 14                        	je	0xa0 <toyos_fd_dup+0xa0>
      8c: 83 f8 02                     	cmpl	$0x2, %eax
      8f: 75 1b                        	jne	0xac <toyos_fd_dup+0xac>
      91: eb 52                        	jmp	0xe5 <toyos_fd_dup+0xe5>
      93: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
      a0: 31 c0                        	xorl	%eax, %eax
      a2: f0                           	lock
      a3: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0xaa <toyos_fd_dup+0xaa>
		00000000000000a6:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      aa: 74 72                        	je	0x11e <toyos_fd_dup+0x11e>
      ac: f3 90                        	pause
      ae: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0xb4 <toyos_fd_dup+0xb4>
		00000000000000b0:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      b4: 85 c0                        	testl	%eax, %eax
      b6: 74 08                        	je	0xc0 <toyos_fd_dup+0xc0>
      b8: 83 f8 02                     	cmpl	$0x2, %eax
      bb: 75 0f                        	jne	0xcc <toyos_fd_dup+0xcc>
      bd: eb 26                        	jmp	0xe5 <toyos_fd_dup+0xe5>
      bf: 90                           	nop
      c0: 31 c0                        	xorl	%eax, %eax
      c2: f0                           	lock
      c3: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0xca <toyos_fd_dup+0xca>
		00000000000000c6:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      ca: 74 52                        	je	0x11e <toyos_fd_dup+0x11e>
      cc: f3 90                        	pause
      ce: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0xd4 <toyos_fd_dup+0xd4>
		00000000000000d0:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      d4: 85 c0                        	testl	%eax, %eax
      d6: 0f 84 64 ff ff ff            	je	0x40 <toyos_fd_dup+0x40>
      dc: 83 f8 02                     	cmpl	$0x2, %eax
      df: 0f 85 6b ff ff ff            	jne	0x50 <toyos_fd_dup+0x50>
      e5: b8 02 00 00 00               	movl	$0x2, %eax
      ea: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0xf0 <toyos_fd_dup+0xf0>
		00000000000000ec:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      f0: 85 c0                        	testl	%eax, %eax
      f2: 74 2a                        	je	0x11e <toyos_fd_dup+0x11e>
      f4: 4c 8d 25 00 00 00 00         	leaq	(%rip), %r12            # 0xfb <toyos_fd_dup+0xfb>
		00000000000000f7:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      fb: 0f 1f 44 00 00               	nopl	(%rax,%rax)
     100: 4c 89 e7                     	movq	%r12, %rdi
     103: be 02 00 00 00               	movl	$0x2, %esi
     108: 31 d2                        	xorl	%edx, %edx
     10a: e8 00 00 00 00               	callq	0x10f <toyos_fd_dup+0x10f>
		000000000000010b:  R_X86_64_PLT32	toyos_abi::syscall::futex_wait-0x4
     10f: b8 02 00 00 00               	movl	$0x2, %eax
     114: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x11a <toyos_fd_dup+0x11a>
		0000000000000116:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     11a: 85 c0                        	testl	%eax, %eax
     11c: 75 e2                        	jne	0x100 <toyos_fd_dup+0x100>
     11e: 48 8d 1d 00 00 00 00         	leaq	(%rip), %rbx            # 0x125 <toyos_fd_dup+0x125>
		0000000000000121:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner5TABLE-0x4
     125: 48 89 5d b8                  	movq	%rbx, -0x48(%rbp)
     129: 0f b6 05 00 00 00 00         	movzbl	(%rip), %eax            # 0x130 <toyos_fd_dup+0x130>
		000000000000012c:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x4
     130: 84 c0                        	testb	%al, %al
     132: 74 1a                        	je	0x14e <toyos_fd_dup+0x14e>
     134: 45 89 e8                     	movl	%r13d, %r8d
     137: 45 31 e4                     	xorl	%r12d, %r12d
     13a: 41 bd 01 00 00 00            	movl	$0x1, %r13d
     140: 41 81 ff ff 0f 00 00         	cmpl	$0xfff, %r15d           # imm = 0xFFF
     147: 76 66                        	jbe	0x1af <toyos_fd_dup+0x1af>
     149: e9 33 01 00 00               	jmp	0x281 <toyos_fd_dup+0x281>
     14e: 48 8d 7d c0                  	leaq	-0x40(%rbp), %rdi
     152: 48 8d 75 b8                  	leaq	-0x48(%rbp), %rsi
     156: e8 00 00 00 00               	callq	0x15b <toyos_fd_dup+0x15b>
		0000000000000157:  R_X86_64_PLT32	.text._RNvNtNtCsX_5toyos2fd5owner5endow-0x4
     15b: 80 7d c0 00                  	cmpb	$0x0, -0x40(%rbp)
     15f: 74 2d                        	je	0x18e <toyos_fd_dup+0x18e>
     161: 0f b6 45 c1                  	movzbl	-0x3f(%rbp), %eax
     165: 89 45 d4                     	movl	%eax, -0x2c(%rbp)
     168: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x16f <toyos_fd_dup+0x16f>
		000000000000016a:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     16f: 41 b5 01                     	movb	$0x1, %r13b
     172: 45 31 e4                     	xorl	%r12d, %r12d
     175: 45 31 ff                     	xorl	%r15d, %r15d
     178: 31 c0                        	xorl	%eax, %eax
     17a: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x180 <toyos_fd_dup+0x180>
		000000000000017c:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     180: 83 f8 02                     	cmpl	$0x2, %eax
     183: 0f 84 1b 01 00 00            	je	0x2a4 <toyos_fd_dup+0x2a4>
     189: e9 27 01 00 00               	jmp	0x2b5 <toyos_fd_dup+0x2b5>
     18e: 45 89 e8                     	movl	%r13d, %r8d
     191: 4c 8b 65 c8                  	movq	-0x38(%rbp), %r12
     195: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x19c <toyos_fd_dup+0x19c>
		0000000000000197:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     19c: 41 bd 01 00 00 00            	movl	$0x1, %r13d
     1a2: 41 81 ff ff 0f 00 00         	cmpl	$0xfff, %r15d           # imm = 0xFFF
     1a9: 0f 87 d2 00 00 00            	ja	0x281 <toyos_fd_dup+0x281>
     1af: 44 89 f8                     	movl	%r15d, %eax
     1b2: 8b bc 83 00 00 04 00         	movl	0x40000(%rbx,%rax,4), %edi
     1b9: 85 ff                        	testl	%edi, %edi
     1bb: 0f 84 c0 00 00 00            	je	0x281 <toyos_fd_dup+0x281>
     1c1: 81 e7 ff ff ff 7f            	andl	$0x7fffffff, %edi       # imm = 0x7FFFFFFF
     1c7: 74 1c                        	je	0x1e5 <toyos_fd_dup+0x1e5>
     1c9: 89 f9                        	movl	%edi, %ecx
     1cb: 48 ff cf                     	decq	%rdi
     1ce: 31 c0                        	xorl	%eax, %eax
     1d0: 81 f9 01 10 00 00            	cmpl	$0x1001, %ecx           # imm = 0x1001
     1d6: 0f 92 c0                     	setb	%al
     1d9: 48 83 f8 01                  	cmpq	$0x1, %rax
     1dd: 0f 85 98 00 00 00            	jne	0x27b <toyos_fd_dup+0x27b>
     1e3: eb 0c                        	jmp	0x1f1 <toyos_fd_dup+0x1f1>
     1e5: 31 c0                        	xorl	%eax, %eax
     1e7: 48 83 f8 01                  	cmpq	$0x1, %rax
     1eb: 0f 85 8a 00 00 00            	jne	0x27b <toyos_fd_dup+0x27b>
     1f1: 48 81 ff ff 0f 00 00         	cmpq	$0xfff, %rdi            # imm = 0xFFF
     1f8: 0f 87 52 01 00 00            	ja	0x350 <toyos_fd_dup+0x350>
     1fe: 48 89 f9                     	movq	%rdi, %rcx
     201: 48 c1 e1 06                  	shlq	$0x6, %rcx
     205: 8b 44 19 18                  	movl	0x18(%rcx,%rbx), %eax
     209: 85 c0                        	testl	%eax, %eax
     20b: 74 6e                        	je	0x27b <toyos_fd_dup+0x27b>
     20d: 41 81 fe ff 0f 00 00         	cmpl	$0xfff, %r14d           # imm = 0xFFF
     214: 77 34                        	ja	0x24a <toyos_fd_dup+0x24a>
     216: 48 01 d9                     	addq	%rbx, %rcx
     219: 44 89 f2                     	movl	%r14d, %edx
     21c: 49 89 d5                     	movq	%rdx, %r13
     21f: 49 c1 e5 20                  	shlq	$0x20, %r13
     223: 48 b8 00 00 00 00 01 00 00 00	movabsq	$0x100000000, %rax      # imm = 0x100000000
     22d: 0f 1f 00                     	nopl	(%rax)
     230: 8b b4 93 00 00 04 00         	movl	0x40000(%rbx,%rdx,4), %esi
     237: 85 f6                        	testl	%esi, %esi
     239: 74 17                        	je	0x252 <toyos_fd_dup+0x252>
     23b: 48 ff c2                     	incq	%rdx
     23e: 49 01 c5                     	addq	%rax, %r13
     241: 48 81 fa 00 10 00 00         	cmpq	$0x1000, %rdx           # imm = 0x1000
     248: 75 e6                        	jne	0x230 <toyos_fd_dup+0x230>
     24a: 41 bd 01 01 00 00            	movl	$0x101, %r13d           # imm = 0x101
     250: eb 2f                        	jmp	0x281 <toyos_fd_dup+0x281>
     252: 8b 41 18                     	movl	0x18(%rcx), %eax
     255: 8d 70 ff                     	leal	-0x1(%rax), %esi
     258: 83 fe fd                     	cmpl	$-0x3, %esi
     25b: 77 1e                        	ja	0x27b <toyos_fd_dup+0x27b>
     25d: 8d 70 01                     	leal	0x1(%rax), %esi
     260: f0                           	lock
     261: 0f b1 71 18                  	cmpxchgl	%esi, 0x18(%rcx)
     265: 75 ee                        	jne	0x255 <toyos_fd_dup+0x255>
     267: 41 0f b6 c0                  	movzbl	%r8b, %eax
     26b: c1 e0 1f                     	shll	$0x1f, %eax
     26e: 01 f8                        	addl	%edi, %eax
     270: ff c0                        	incl	%eax
     272: 89 84 93 00 00 04 00         	movl	%eax, 0x40000(%rbx,%rdx,4)
     279: eb 06                        	jmp	0x281 <toyos_fd_dup+0x281>
     27b: 41 bd 01 02 00 00            	movl	$0x201, %r13d           # imm = 0x201
     281: 44 89 e8                     	movl	%r13d, %eax
     284: c1 e8 08                     	shrl	$0x8, %eax
     287: 89 45 d4                     	movl	%eax, -0x2c(%rbp)
     28a: 49 bf 00 00 00 00 ff ff ff 7f	movabsq	$0x7fffffff00000000, %r15 # imm = 0x7FFFFFFF00000000
     294: 4d 21 ef                     	andq	%r13, %r15
     297: 31 c0                        	xorl	%eax, %eax
     299: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x29f <toyos_fd_dup+0x29f>
		000000000000029b:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     29f: 83 f8 02                     	cmpl	$0x2, %eax
     2a2: 75 11                        	jne	0x2b5 <toyos_fd_dup+0x2b5>
     2a4: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x2ab <toyos_fd_dup+0x2ab>
		00000000000002a7:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     2ab: be 01 00 00 00               	movl	$0x1, %esi
     2b0: e8 00 00 00 00               	callq	0x2b5 <toyos_fd_dup+0x2b5>
		00000000000002b1:  R_X86_64_PLT32	toyos_abi::syscall::futex_wake-0x4
     2b5: 4d 85 e4                     	testq	%r12, %r12
     2b8: 74 38                        	je	0x2f2 <toyos_fd_dup+0x2f2>
     2ba: 48 8d 1d 00 00 00 00         	leaq	(%rip), %rbx            # 0x2c1 <toyos_fd_dup+0x2c1>
		00000000000002bd:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     2c1: 4c 8d 75 c0                  	leaq	-0x40(%rbp), %r14
     2c5: 66 66 2e 0f 1f 84 00 00 00 00 00     	nopw	%cs:(%rax,%rax)
     2d0: ba 3f 00 00 00               	movl	$0x3f, %edx
     2d5: bf 02 00 00 00               	movl	$0x2, %edi
     2da: 48 89 de                     	movq	%rbx, %rsi
     2dd: e8 00 00 00 00               	callq	0x2e2 <toyos_fd_dup+0x2e2>
		00000000000002de:  R_X86_64_PLT32	toyos_fs_write-0x4
     2e2: 4c 89 f7                     	movq	%r14, %rdi
     2e5: 48 89 c6                     	movq	%rax, %rsi
     2e8: e8 00 00 00 00               	callq	0x2ed <toyos_fd_dup+0x2ed>
		00000000000002e9:  R_X86_64_PLT32	.text._RNvNtCsX_5toyos5files6decode-0x4
     2ed: 49 ff cc                     	decq	%r12
     2f0: 75 de                        	jne	0x2d0 <toyos_fd_dup+0x2d0>
     2f2: 41 f6 c5 01                  	testb	$0x1, %r13b
     2f6: 74 12                        	je	0x30a <toyos_fd_dup+0x30a>
     2f8: 8b 45 d4                     	movl	-0x2c(%rbp), %eax
     2fb: 3c 02                        	cmpb	$0x2, %al
     2fd: 74 37                        	je	0x336 <toyos_fd_dup+0x336>
     2ff: 44 0f b6 f8                  	movzbl	%al, %r15d
     303: 41 c1 e7 08                  	shll	$0x8, %r15d
     307: 49 ff c7                     	incq	%r15
     30a: 4c 89 f9                     	movq	%r15, %rcx
     30d: 48 c1 e9 20                  	shrq	$0x20, %rcx
     311: 31 c0                        	xorl	%eax, %eax
     313: 41 f7 c7 00 01 00 00         	testl	$0x100, %r15d           # imm = 0x100
     31a: 0f 94 c0                     	sete	%al
     31d: 83 c8 fe                     	orl	$-0x2, %eax
     320: 41 f6 c7 01                  	testb	$0x1, %r15b
     324: 0f 44 c1                     	cmovel	%ecx, %eax
     327: 48 83 c4 28                  	addq	$0x28, %rsp
     32b: 5b                           	popq	%rbx
     32c: 41 5c                        	popq	%r12
     32e: 41 5d                        	popq	%r13
     330: 41 5e                        	popq	%r14
     332: 41 5f                        	popq	%r15
     334: 5d                           	popq	%rbp
     335: c3                           	retq
     336: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x33d <toyos_fd_dup+0x33d>
		0000000000000339:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     33d: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x344 <toyos_fd_dup+0x344>
		0000000000000340:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     344: be 5f 00 00 00               	movl	$0x5f, %esi
     349: e8 00 00 00 00               	callq	0x34e <toyos_fd_dup+0x34e>
		000000000000034a:  R_X86_64_PLT32	core::panicking::panic_fmt-0x4
     34e: eb 11                        	jmp	0x361 <toyos_fd_dup+0x361>
     350: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x357 <toyos_fd_dup+0x357>
		0000000000000353:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     357: be 00 10 00 00               	movl	$0x1000, %esi           # imm = 0x1000
     35c: e8 00 00 00 00               	callq	0x361 <toyos_fd_dup+0x361>
		000000000000035d:  R_X86_64_PLT32	core::panicking::panic_bounds_check-0x4
     361: 0f 0b                        	ud2
     363: 31 c0                        	xorl	%eax, %eax
     365: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x36b <toyos_fd_dup+0x36b>
		0000000000000367:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     36b: 83 f8 02                     	cmpl	$0x2, %eax
     36e: 75 22                        	jne	0x392 <toyos_fd_dup+0x392>
     370: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x377 <toyos_fd_dup+0x377>
		0000000000000373:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     377: be 01 00 00 00               	movl	$0x1, %esi
     37c: e8 00 00 00 00               	callq	0x381 <toyos_fd_dup+0x381>
		000000000000037d:  R_X86_64_PLT32	toyos_abi::syscall::futex_wake-0x4
     381: eb 0f                        	jmp	0x392 <toyos_fd_dup+0x392>
     383: e8 00 00 00 00               	callq	0x388 <toyos_fd_dup+0x388>
		0000000000000384:  R_X86_64_PLT32	core::panicking::panic_in_cleanup-0x4
     388: e8 00 00 00 00               	callq	0x38d <toyos_fd_dup+0x38d>
		0000000000000389:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     38d: e8 00 00 00 00               	callq	0x392 <toyos_fd_dup+0x392>
		000000000000038e:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     392: e8 00 00 00 00               	callq	0x397 <toyos_fd_dup+0x397>
		0000000000000393:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
