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
      11: 41 89 d4                     	movl	%edx, %r12d
      14: 41 89 f6                     	movl	%esi, %r14d
      17: 41 89 ff                     	movl	%edi, %r15d
      1a: e8 00 00 00 00               	callq	0x1f <toyos_fd_dup+0x1f>
		000000000000001b:  R_X86_64_PLT32	<toyos::endow::Endowments>::get-0x4
      1f: b9 01 00 00 00               	movl	$0x1, %ecx
      24: 31 c0                        	xorl	%eax, %eax
      26: f0                           	lock
      27: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x2e <toyos_fd_dup+0x2e>
		000000000000002a:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      2e: 0f 84 f0 00 00 00            	je	0x124 <toyos_fd_dup+0x124>
      34: ba 64 00 00 00               	movl	$0x64, %edx
      39: eb 20                        	jmp	0x5b <toyos_fd_dup+0x5b>
      3b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
      40: 31 c0                        	xorl	%eax, %eax
      42: f0                           	lock
      43: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x4a <toyos_fd_dup+0x4a>
		0000000000000046:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      4a: 0f 84 d4 00 00 00            	je	0x124 <toyos_fd_dup+0x124>
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
      7a: 0f 84 a4 00 00 00            	je	0x124 <toyos_fd_dup+0x124>
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
      aa: 74 78                        	je	0x124 <toyos_fd_dup+0x124>
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
      ca: 74 58                        	je	0x124 <toyos_fd_dup+0x124>
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
      f2: 74 30                        	je	0x124 <toyos_fd_dup+0x124>
      f4: 48 8d 35 00 00 00 00         	leaq	(%rip), %rsi            # 0xfb <toyos_fd_dup+0xfb>
		00000000000000f7:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      fb: bf 3a 00 00 00               	movl	$0x3a, %edi
     100: ba 02 00 00 00               	movl	$0x2, %edx
     105: 49 c7 c0 ff ff ff ff         	movq	$-0x1, %r8
     10c: 0f 1f 40 00                  	nopl	(%rax)
     110: 45 31 c9                     	xorl	%r9d, %r9d
     113: 0f 05                        	syscall
     115: b8 02 00 00 00               	movl	$0x2, %eax
     11a: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x120 <toyos_fd_dup+0x120>
		000000000000011c:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     120: 85 c0                        	testl	%eax, %eax
     122: 75 ec                        	jne	0x110 <toyos_fd_dup+0x110>
     124: 48 8d 1d 00 00 00 00         	leaq	(%rip), %rbx            # 0x12b <toyos_fd_dup+0x12b>
		0000000000000127:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner5TABLE-0x4
     12b: 48 89 5d b8                  	movq	%rbx, -0x48(%rbp)
     12f: 0f b6 05 00 00 00 00         	movzbl	(%rip), %eax            # 0x136 <toyos_fd_dup+0x136>
		0000000000000132:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x4
     136: 84 c0                        	testb	%al, %al
     138: 74 1a                        	je	0x154 <toyos_fd_dup+0x154>
     13a: 45 89 e0                     	movl	%r12d, %r8d
     13d: 45 31 e4                     	xorl	%r12d, %r12d
     140: 41 bd 01 00 00 00            	movl	$0x1, %r13d
     146: 41 81 ff ff 0f 00 00         	cmpl	$0xfff, %r15d           # imm = 0xFFF
     14d: 76 66                        	jbe	0x1b5 <toyos_fd_dup+0x1b5>
     14f: e9 3d 01 00 00               	jmp	0x291 <toyos_fd_dup+0x291>
     154: 48 8d 7d c0                  	leaq	-0x40(%rbp), %rdi
     158: 48 8d 75 b8                  	leaq	-0x48(%rbp), %rsi
     15c: e8 00 00 00 00               	callq	0x161 <toyos_fd_dup+0x161>
		000000000000015d:  R_X86_64_PLT32	.text._RNvNtNtCsX_5toyos2fd5owner5endow-0x4
     161: 80 7d c0 00                  	cmpb	$0x0, -0x40(%rbp)
     165: 74 2d                        	je	0x194 <toyos_fd_dup+0x194>
     167: 0f b6 45 c1                  	movzbl	-0x3f(%rbp), %eax
     16b: 89 45 d4                     	movl	%eax, -0x2c(%rbp)
     16e: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x175 <toyos_fd_dup+0x175>
		0000000000000170:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     175: 41 b5 01                     	movb	$0x1, %r13b
     178: 45 31 e4                     	xorl	%r12d, %r12d
     17b: 45 31 ff                     	xorl	%r15d, %r15d
     17e: 31 c0                        	xorl	%eax, %eax
     180: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x186 <toyos_fd_dup+0x186>
		0000000000000182:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     186: 83 f8 02                     	cmpl	$0x2, %eax
     189: 0f 84 25 01 00 00            	je	0x2b4 <toyos_fd_dup+0x2b4>
     18f: e9 39 01 00 00               	jmp	0x2cd <toyos_fd_dup+0x2cd>
     194: 45 89 e0                     	movl	%r12d, %r8d
     197: 4c 8b 65 c8                  	movq	-0x38(%rbp), %r12
     19b: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x1a2 <toyos_fd_dup+0x1a2>
		000000000000019d:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     1a2: 41 bd 01 00 00 00            	movl	$0x1, %r13d
     1a8: 41 81 ff ff 0f 00 00         	cmpl	$0xfff, %r15d           # imm = 0xFFF
     1af: 0f 87 dc 00 00 00            	ja	0x291 <toyos_fd_dup+0x291>
     1b5: 44 89 f8                     	movl	%r15d, %eax
     1b8: 8b bc 83 00 00 04 00         	movl	0x40000(%rbx,%rax,4), %edi
     1bf: 85 ff                        	testl	%edi, %edi
     1c1: 0f 84 ca 00 00 00            	je	0x291 <toyos_fd_dup+0x291>
     1c7: 81 e7 ff ff ff 7f            	andl	$0x7fffffff, %edi       # imm = 0x7FFFFFFF
     1cd: 74 1c                        	je	0x1eb <toyos_fd_dup+0x1eb>
     1cf: 89 f9                        	movl	%edi, %ecx
     1d1: 48 ff cf                     	decq	%rdi
     1d4: 31 c0                        	xorl	%eax, %eax
     1d6: 81 f9 01 10 00 00            	cmpl	$0x1001, %ecx           # imm = 0x1001
     1dc: 0f 92 c0                     	setb	%al
     1df: 48 83 f8 01                  	cmpq	$0x1, %rax
     1e3: 0f 85 a2 00 00 00            	jne	0x28b <toyos_fd_dup+0x28b>
     1e9: eb 0c                        	jmp	0x1f7 <toyos_fd_dup+0x1f7>
     1eb: 31 c0                        	xorl	%eax, %eax
     1ed: 48 83 f8 01                  	cmpq	$0x1, %rax
     1f1: 0f 85 94 00 00 00            	jne	0x28b <toyos_fd_dup+0x28b>
     1f7: 48 81 ff ff 0f 00 00         	cmpq	$0xfff, %rdi            # imm = 0xFFF
     1fe: 0f 87 5c 01 00 00            	ja	0x360 <toyos_fd_dup+0x360>
     204: 48 89 f9                     	movq	%rdi, %rcx
     207: 48 c1 e1 06                  	shlq	$0x6, %rcx
     20b: 8b 44 19 18                  	movl	0x18(%rcx,%rbx), %eax
     20f: 85 c0                        	testl	%eax, %eax
     211: 74 78                        	je	0x28b <toyos_fd_dup+0x28b>
     213: 41 81 fe ff 0f 00 00         	cmpl	$0xfff, %r14d           # imm = 0xFFF
     21a: 77 3e                        	ja	0x25a <toyos_fd_dup+0x25a>
     21c: 48 01 d9                     	addq	%rbx, %rcx
     21f: 44 89 f2                     	movl	%r14d, %edx
     222: 49 89 d5                     	movq	%rdx, %r13
     225: 49 c1 e5 20                  	shlq	$0x20, %r13
     229: 48 b8 00 00 00 00 01 00 00 00	movabsq	$0x100000000, %rax      # imm = 0x100000000
     233: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
     240: 8b b4 93 00 00 04 00         	movl	0x40000(%rbx,%rdx,4), %esi
     247: 85 f6                        	testl	%esi, %esi
     249: 74 17                        	je	0x262 <toyos_fd_dup+0x262>
     24b: 48 ff c2                     	incq	%rdx
     24e: 49 01 c5                     	addq	%rax, %r13
     251: 48 81 fa 00 10 00 00         	cmpq	$0x1000, %rdx           # imm = 0x1000
     258: 75 e6                        	jne	0x240 <toyos_fd_dup+0x240>
     25a: 41 bd 01 01 00 00            	movl	$0x101, %r13d           # imm = 0x101
     260: eb 2f                        	jmp	0x291 <toyos_fd_dup+0x291>
     262: 8b 41 18                     	movl	0x18(%rcx), %eax
     265: 8d 70 ff                     	leal	-0x1(%rax), %esi
     268: 83 fe fd                     	cmpl	$-0x3, %esi
     26b: 77 1e                        	ja	0x28b <toyos_fd_dup+0x28b>
     26d: 8d 70 01                     	leal	0x1(%rax), %esi
     270: f0                           	lock
     271: 0f b1 71 18                  	cmpxchgl	%esi, 0x18(%rcx)
     275: 75 ee                        	jne	0x265 <toyos_fd_dup+0x265>
     277: 41 0f b6 c0                  	movzbl	%r8b, %eax
     27b: c1 e0 1f                     	shll	$0x1f, %eax
     27e: 01 f8                        	addl	%edi, %eax
     280: ff c0                        	incl	%eax
     282: 89 84 93 00 00 04 00         	movl	%eax, 0x40000(%rbx,%rdx,4)
     289: eb 06                        	jmp	0x291 <toyos_fd_dup+0x291>
     28b: 41 bd 01 02 00 00            	movl	$0x201, %r13d           # imm = 0x201
     291: 44 89 e8                     	movl	%r13d, %eax
     294: c1 e8 08                     	shrl	$0x8, %eax
     297: 89 45 d4                     	movl	%eax, -0x2c(%rbp)
     29a: 49 bf 00 00 00 00 ff ff ff 7f	movabsq	$0x7fffffff00000000, %r15 # imm = 0x7FFFFFFF00000000
     2a4: 4d 21 ef                     	andq	%r13, %r15
     2a7: 31 c0                        	xorl	%eax, %eax
     2a9: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x2af <toyos_fd_dup+0x2af>
		00000000000002ab:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     2af: 83 f8 02                     	cmpl	$0x2, %eax
     2b2: 75 19                        	jne	0x2cd <toyos_fd_dup+0x2cd>
     2b4: 48 8d 35 00 00 00 00         	leaq	(%rip), %rsi            # 0x2bb <toyos_fd_dup+0x2bb>
		00000000000002b7:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     2bb: bf 3b 00 00 00               	movl	$0x3b, %edi
     2c0: ba 01 00 00 00               	movl	$0x1, %edx
     2c5: 45 31 c0                     	xorl	%r8d, %r8d
     2c8: 45 31 c9                     	xorl	%r9d, %r9d
     2cb: 0f 05                        	syscall
     2cd: 4d 85 e4                     	testq	%r12, %r12
     2d0: 74 30                        	je	0x302 <toyos_fd_dup+0x302>
     2d2: 48 8d 1d 00 00 00 00         	leaq	(%rip), %rbx            # 0x2d9 <toyos_fd_dup+0x2d9>
		00000000000002d5:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     2d9: 4c 8d 75 c0                  	leaq	-0x40(%rbp), %r14
     2dd: 0f 1f 00                     	nopl	(%rax)
     2e0: ba 3f 00 00 00               	movl	$0x3f, %edx
     2e5: bf 02 00 00 00               	movl	$0x2, %edi
     2ea: 48 89 de                     	movq	%rbx, %rsi
     2ed: e8 00 00 00 00               	callq	0x2f2 <toyos_fd_dup+0x2f2>
		00000000000002ee:  R_X86_64_PLT32	toyos_fs_write-0x4
     2f2: 4c 89 f7                     	movq	%r14, %rdi
     2f5: 48 89 c6                     	movq	%rax, %rsi
     2f8: e8 00 00 00 00               	callq	0x2fd <toyos_fd_dup+0x2fd>
		00000000000002f9:  R_X86_64_PLT32	.text._RNvNtCsX_5toyos5files6decode-0x4
     2fd: 49 ff cc                     	decq	%r12
     300: 75 de                        	jne	0x2e0 <toyos_fd_dup+0x2e0>
     302: 41 f6 c5 01                  	testb	$0x1, %r13b
     306: 74 12                        	je	0x31a <toyos_fd_dup+0x31a>
     308: 8b 45 d4                     	movl	-0x2c(%rbp), %eax
     30b: 3c 02                        	cmpb	$0x2, %al
     30d: 74 37                        	je	0x346 <toyos_fd_dup+0x346>
     30f: 44 0f b6 f8                  	movzbl	%al, %r15d
     313: 41 c1 e7 08                  	shll	$0x8, %r15d
     317: 49 ff c7                     	incq	%r15
     31a: 4c 89 f9                     	movq	%r15, %rcx
     31d: 48 c1 e9 20                  	shrq	$0x20, %rcx
     321: 31 c0                        	xorl	%eax, %eax
     323: 41 f7 c7 00 01 00 00         	testl	$0x100, %r15d           # imm = 0x100
     32a: 0f 94 c0                     	sete	%al
     32d: 83 c8 fe                     	orl	$-0x2, %eax
     330: 41 f6 c7 01                  	testb	$0x1, %r15b
     334: 0f 44 c1                     	cmovel	%ecx, %eax
     337: 48 83 c4 28                  	addq	$0x28, %rsp
     33b: 5b                           	popq	%rbx
     33c: 41 5c                        	popq	%r12
     33e: 41 5d                        	popq	%r13
     340: 41 5e                        	popq	%r14
     342: 41 5f                        	popq	%r15
     344: 5d                           	popq	%rbp
     345: c3                           	retq
     346: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x34d <toyos_fd_dup+0x34d>
		0000000000000349:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     34d: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x354 <toyos_fd_dup+0x354>
		0000000000000350:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     354: be 5f 00 00 00               	movl	$0x5f, %esi
     359: e8 00 00 00 00               	callq	0x35e <toyos_fd_dup+0x35e>
		000000000000035a:  R_X86_64_PLT32	core::panicking::panic_fmt-0x4
     35e: eb 11                        	jmp	0x371 <toyos_fd_dup+0x371>
     360: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x367 <toyos_fd_dup+0x367>
		0000000000000363:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     367: be 00 10 00 00               	movl	$0x1000, %esi           # imm = 0x1000
     36c: e8 00 00 00 00               	callq	0x371 <toyos_fd_dup+0x371>
		000000000000036d:  R_X86_64_PLT32	core::panicking::panic_bounds_check-0x4
     371: 0f 0b                        	ud2
     373: 31 c0                        	xorl	%eax, %eax
     375: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x37b <toyos_fd_dup+0x37b>
		0000000000000377:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     37b: 83 f8 02                     	cmpl	$0x2, %eax
     37e: 75 23                        	jne	0x3a3 <toyos_fd_dup+0x3a3>
     380: 48 8d 35 00 00 00 00         	leaq	(%rip), %rsi            # 0x387 <toyos_fd_dup+0x387>
		0000000000000383:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     387: bf 3b 00 00 00               	movl	$0x3b, %edi
     38c: ba 01 00 00 00               	movl	$0x1, %edx
     391: 45 31 c0                     	xorl	%r8d, %r8d
     394: 45 31 c9                     	xorl	%r9d, %r9d
     397: 0f 05                        	syscall
     399: e8 00 00 00 00               	callq	0x39e <toyos_fd_dup+0x39e>
		000000000000039a:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     39e: e8 00 00 00 00               	callq	0x3a3 <toyos_fd_dup+0x3a3>
		000000000000039f:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     3a3: e8 00 00 00 00               	callq	0x3a8 <toyos_fd_dup+0x3a8>
		00000000000003a4:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
