Disassembly of section .text.toyos_fd_close:

0000000000000000 <toyos_fd_close>:
       0: 55                           	pushq	%rbp
       1: 48 89 e5                     	movq	%rsp, %rbp
       4: 41 57                        	pushq	%r15
       6: 41 56                        	pushq	%r14
       8: 41 55                        	pushq	%r13
       a: 41 54                        	pushq	%r12
       c: 53                           	pushq	%rbx
       d: 48 83 ec 38                  	subq	$0x38, %rsp
      11: 41 89 fe                     	movl	%edi, %r14d
      14: e8 00 00 00 00               	callq	0x19 <toyos_fd_close+0x19>
		0000000000000015:  R_X86_64_PLT32	<toyos::endow::Endowments>::get-0x4
      19: b9 01 00 00 00               	movl	$0x1, %ecx
      1e: 31 c0                        	xorl	%eax, %eax
      20: f0                           	lock
      21: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x28 <toyos_fd_close+0x28>
		0000000000000024:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      28: 0f 84 f6 00 00 00            	je	0x124 <toyos_fd_close+0x124>
      2e: ba 64 00 00 00               	movl	$0x64, %edx
      33: eb 26                        	jmp	0x5b <toyos_fd_close+0x5b>
      35: 66 66 2e 0f 1f 84 00 00 00 00 00     	nopw	%cs:(%rax,%rax)
      40: 31 c0                        	xorl	%eax, %eax
      42: f0                           	lock
      43: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x4a <toyos_fd_close+0x4a>
		0000000000000046:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      4a: 0f 84 d4 00 00 00            	je	0x124 <toyos_fd_close+0x124>
      50: f3 90                        	pause
      52: 83 c2 fc                     	addl	$-0x4, %edx
      55: 0f 84 8a 00 00 00            	je	0xe5 <toyos_fd_close+0xe5>
      5b: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0x61 <toyos_fd_close+0x61>
		000000000000005d:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      61: 85 c0                        	testl	%eax, %eax
      63: 74 0b                        	je	0x70 <toyos_fd_close+0x70>
      65: 83 f8 02                     	cmpl	$0x2, %eax
      68: 75 16                        	jne	0x80 <toyos_fd_close+0x80>
      6a: eb 79                        	jmp	0xe5 <toyos_fd_close+0xe5>
      6c: 0f 1f 40 00                  	nopl	(%rax)
      70: 31 c0                        	xorl	%eax, %eax
      72: f0                           	lock
      73: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x7a <toyos_fd_close+0x7a>
		0000000000000076:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      7a: 0f 84 a4 00 00 00            	je	0x124 <toyos_fd_close+0x124>
      80: f3 90                        	pause
      82: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0x88 <toyos_fd_close+0x88>
		0000000000000084:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      88: 85 c0                        	testl	%eax, %eax
      8a: 74 14                        	je	0xa0 <toyos_fd_close+0xa0>
      8c: 83 f8 02                     	cmpl	$0x2, %eax
      8f: 75 1b                        	jne	0xac <toyos_fd_close+0xac>
      91: eb 52                        	jmp	0xe5 <toyos_fd_close+0xe5>
      93: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
      a0: 31 c0                        	xorl	%eax, %eax
      a2: f0                           	lock
      a3: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0xaa <toyos_fd_close+0xaa>
		00000000000000a6:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      aa: 74 78                        	je	0x124 <toyos_fd_close+0x124>
      ac: f3 90                        	pause
      ae: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0xb4 <toyos_fd_close+0xb4>
		00000000000000b0:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      b4: 85 c0                        	testl	%eax, %eax
      b6: 74 08                        	je	0xc0 <toyos_fd_close+0xc0>
      b8: 83 f8 02                     	cmpl	$0x2, %eax
      bb: 75 0f                        	jne	0xcc <toyos_fd_close+0xcc>
      bd: eb 26                        	jmp	0xe5 <toyos_fd_close+0xe5>
      bf: 90                           	nop
      c0: 31 c0                        	xorl	%eax, %eax
      c2: f0                           	lock
      c3: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0xca <toyos_fd_close+0xca>
		00000000000000c6:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      ca: 74 58                        	je	0x124 <toyos_fd_close+0x124>
      cc: f3 90                        	pause
      ce: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0xd4 <toyos_fd_close+0xd4>
		00000000000000d0:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      d4: 85 c0                        	testl	%eax, %eax
      d6: 0f 84 64 ff ff ff            	je	0x40 <toyos_fd_close+0x40>
      dc: 83 f8 02                     	cmpl	$0x2, %eax
      df: 0f 85 6b ff ff ff            	jne	0x50 <toyos_fd_close+0x50>
      e5: b8 02 00 00 00               	movl	$0x2, %eax
      ea: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0xf0 <toyos_fd_close+0xf0>
		00000000000000ec:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      f0: 85 c0                        	testl	%eax, %eax
      f2: 74 30                        	je	0x124 <toyos_fd_close+0x124>
      f4: 48 8d 35 00 00 00 00         	leaq	(%rip), %rsi            # 0xfb <toyos_fd_close+0xfb>
		00000000000000f7:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      fb: bf 3a 00 00 00               	movl	$0x3a, %edi
     100: ba 02 00 00 00               	movl	$0x2, %edx
     105: 49 c7 c0 ff ff ff ff         	movq	$-0x1, %r8
     10c: 0f 1f 40 00                  	nopl	(%rax)
     110: 45 31 c9                     	xorl	%r9d, %r9d
     113: 0f 05                        	syscall
     115: b8 02 00 00 00               	movl	$0x2, %eax
     11a: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x120 <toyos_fd_close+0x120>
		000000000000011c:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     120: 85 c0                        	testl	%eax, %eax
     122: 75 ec                        	jne	0x110 <toyos_fd_close+0x110>
     124: 48 8d 1d 00 00 00 00         	leaq	(%rip), %rbx            # 0x12b <toyos_fd_close+0x12b>
		0000000000000127:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner5TABLE-0x4
     12b: 48 89 5d a0                  	movq	%rbx, -0x60(%rbp)
     12f: 0f b6 05 00 00 00 00         	movzbl	(%rip), %eax            # 0x136 <toyos_fd_close+0x136>
		0000000000000132:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x4
     136: 45 31 ff                     	xorl	%r15d, %r15d
     139: 84 c0                        	testb	%al, %al
     13b: 74 14                        	je	0x151 <toyos_fd_close+0x151>
     13d: 45 31 ed                     	xorl	%r13d, %r13d
     140: 40 b6 01                     	movb	$0x1, %sil
     143: 41 81 fe ff 0f 00 00         	cmpl	$0xfff, %r14d           # imm = 0xFFF
     14a: 76 4e                        	jbe	0x19a <toyos_fd_close+0x19a>
     14c: e9 80 00 00 00               	jmp	0x1d1 <toyos_fd_close+0x1d1>
     151: 48 8d 7d c0                  	leaq	-0x40(%rbp), %rdi
     155: 48 8d 75 a0                  	leaq	-0x60(%rbp), %rsi
     159: e8 00 00 00 00               	callq	0x15e <toyos_fd_close+0x15e>
		000000000000015a:  R_X86_64_PLT32	.text._RNvNtNtCsX_5toyos2fd5owner5endow-0x4
     15e: 80 7d c0 00                  	cmpb	$0x0, -0x40(%rbp)
     162: 74 1f                        	je	0x183 <toyos_fd_close+0x183>
     164: 0f b6 45 c1                  	movzbl	-0x3f(%rbp), %eax
     168: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
     16c: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x173 <toyos_fd_close+0x173>
		000000000000016e:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     173: 40 b6 01                     	movb	$0x1, %sil
     176: 45 31 ff                     	xorl	%r15d, %r15d
     179: 31 db                        	xorl	%ebx, %ebx
     17b: 45 31 ed                     	xorl	%r13d, %r13d
     17e: e9 c1 00 00 00               	jmp	0x244 <toyos_fd_close+0x244>
     183: 4c 8b 6d c8                  	movq	-0x38(%rbp), %r13
     187: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x18e <toyos_fd_close+0x18e>
		0000000000000189:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     18e: 40 b6 01                     	movb	$0x1, %sil
     191: 41 81 fe ff 0f 00 00         	cmpl	$0xfff, %r14d           # imm = 0xFFF
     198: 77 37                        	ja	0x1d1 <toyos_fd_close+0x1d1>
     19a: 44 89 f0                     	movl	%r14d, %eax
     19d: 8b bc 83 00 00 04 00         	movl	0x40000(%rbx,%rax,4), %edi
     1a4: 45 31 ff                     	xorl	%r15d, %r15d
     1a7: 85 ff                        	testl	%edi, %edi
     1a9: 74 26                        	je	0x1d1 <toyos_fd_close+0x1d1>
     1ab: 81 e7 ff ff ff 7f            	andl	$0x7fffffff, %edi       # imm = 0x7FFFFFFF
     1b1: 74 28                        	je	0x1db <toyos_fd_close+0x1db>
     1b3: 89 fa                        	movl	%edi, %edx
     1b5: 48 ff cf                     	decq	%rdi
     1b8: 31 c9                        	xorl	%ecx, %ecx
     1ba: 81 fa 01 10 00 00            	cmpl	$0x1001, %edx           # imm = 0x1001
     1c0: 0f 92 c1                     	setb	%cl
     1c3: b2 02                        	movb	$0x2, %dl
     1c5: 48 89 55 d0                  	movq	%rdx, -0x30(%rbp)
     1c9: 48 83 f9 01                  	cmpq	$0x1, %rcx
     1cd: 75 73                        	jne	0x242 <toyos_fd_close+0x242>
     1cf: eb 18                        	jmp	0x1e9 <toyos_fd_close+0x1e9>
     1d1: 48 c7 45 d0 00 00 00 00      	movq	$0x0, -0x30(%rbp)
     1d9: eb 67                        	jmp	0x242 <toyos_fd_close+0x242>
     1db: 31 c9                        	xorl	%ecx, %ecx
     1dd: b2 02                        	movb	$0x2, %dl
     1df: 48 89 55 d0                  	movq	%rdx, -0x30(%rbp)
     1e3: 48 83 f9 01                  	cmpq	$0x1, %rcx
     1e7: 75 59                        	jne	0x242 <toyos_fd_close+0x242>
     1e9: 48 81 ff ff 0f 00 00         	cmpq	$0xfff, %rdi            # imm = 0xFFF
     1f0: 0f 87 53 01 00 00            	ja	0x349 <toyos_fd_close+0x349>
     1f6: 48 c1 e7 06                  	shlq	$0x6, %rdi
     1fa: 8b 4c 1f 18                  	movl	0x18(%rdi,%rbx), %ecx
     1fe: 85 c9                        	testl	%ecx, %ecx
     200: 74 3d                        	je	0x23f <toyos_fd_close+0x23f>
     202: 48 01 df                     	addq	%rbx, %rdi
     205: c7 84 83 00 00 04 00 00 00 00 00     	movl	$0x0, 0x40000(%rbx,%rax,4)
     210: 0f b6 07                     	movzbl	(%rdi), %eax
     213: 44 0f b7 7f 01               	movzwl	0x1(%rdi), %r15d
     218: 0f b6 4f 03                  	movzbl	0x3(%rdi), %ecx
     21c: 4c 8b 47 08                  	movq	0x8(%rdi), %r8
     220: 4c 8b 4f 10                  	movq	0x10(%rdi), %r9
     224: ba ff ff ff ff               	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
     229: f0                           	lock
     22a: 0f c1 57 18                  	xaddl	%edx, 0x18(%rdi)
     22e: 83 fa 01                     	cmpl	$0x1, %edx
     231: 0f 84 cb 00 00 00            	je	0x302 <toyos_fd_close+0x302>
     237: 85 d2                        	testl	%edx, %edx
     239: 0f 85 e2 00 00 00            	jne	0x321 <toyos_fd_close+0x321>
     23f: 45 31 ff                     	xorl	%r15d, %r15d
     242: 31 db                        	xorl	%ebx, %ebx
     244: 4c 89 7d a8                  	movq	%r15, -0x58(%rbp)
     248: 49 89 f6                     	movq	%rsi, %r14
     24b: 31 c0                        	xorl	%eax, %eax
     24d: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x253 <toyos_fd_close+0x253>
		000000000000024f:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     253: 83 f8 02                     	cmpl	$0x2, %eax
     256: 75 19                        	jne	0x271 <toyos_fd_close+0x271>
     258: 48 8d 35 00 00 00 00         	leaq	(%rip), %rsi            # 0x25f <toyos_fd_close+0x25f>
		000000000000025b:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     25f: bf 3b 00 00 00               	movl	$0x3b, %edi
     264: ba 01 00 00 00               	movl	$0x1, %edx
     269: 45 31 c0                     	xorl	%r8d, %r8d
     26c: 45 31 c9                     	xorl	%r9d, %r9d
     26f: 0f 05                        	syscall
     271: 4d 85 ed                     	testq	%r13, %r13
     274: 74 3c                        	je	0x2b2 <toyos_fd_close+0x2b2>
     276: 4c 8d 3d 00 00 00 00         	leaq	(%rip), %r15            # 0x27d <toyos_fd_close+0x27d>
		0000000000000279:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     27d: 4c 8d 65 c0                  	leaq	-0x40(%rbp), %r12
     281: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
     290: ba 3f 00 00 00               	movl	$0x3f, %edx
     295: bf 02 00 00 00               	movl	$0x2, %edi
     29a: 4c 89 fe                     	movq	%r15, %rsi
     29d: e8 00 00 00 00               	callq	0x2a2 <toyos_fd_close+0x2a2>
		000000000000029e:  R_X86_64_PLT32	toyos_fs_write-0x4
     2a2: 4c 89 e7                     	movq	%r12, %rdi
     2a5: 48 89 c6                     	movq	%rax, %rsi
     2a8: e8 00 00 00 00               	callq	0x2ad <toyos_fd_close+0x2ad>
		00000000000002a9:  R_X86_64_PLT32	.text._RNvNtCsX_5toyos5files6decode-0x4
     2ad: 49 ff cd                     	decq	%r13
     2b0: 75 de                        	jne	0x290 <toyos_fd_close+0x290>
     2b2: 45 84 f6                     	testb	%r14b, %r14b
     2b5: 74 12                        	je	0x2c9 <toyos_fd_close+0x2c9>
     2b7: 48 8b 45 d0                  	movq	-0x30(%rbp), %rax
     2bb: 3c 02                        	cmpb	$0x2, %al
     2bd: 74 70                        	je	0x32f <toyos_fd_close+0x32f>
     2bf: 0f b6 c0                     	movzbl	%al, %eax
     2c2: f7 d0                        	notl	%eax
     2c4: 83 c8 fe                     	orl	$-0x2, %eax
     2c7: eb 2a                        	jmp	0x2f3 <toyos_fd_close+0x2f3>
     2c9: 31 c0                        	xorl	%eax, %eax
     2cb: 84 db                        	testb	%bl, %bl
     2cd: 74 24                        	je	0x2f3 <toyos_fd_close+0x2f3>
     2cf: 48 8b 45 b0                  	movq	-0x50(%rbp), %rax
     2d3: 48 85 c0                     	testq	%rax, %rax
     2d6: 74 0a                        	je	0x2e2 <toyos_fd_close+0x2e2>
     2d8: 48 8b 7d b8                  	movq	-0x48(%rbp), %rdi
     2dc: ff d0                        	callq	*%rax
     2de: 31 c0                        	xorl	%eax, %eax
     2e0: eb 11                        	jmp	0x2f3 <toyos_fd_close+0x2f3>
     2e2: 0f b6 45 d0                  	movzbl	-0x30(%rbp), %eax
     2e6: 48 8b 7d a8                  	movq	-0x58(%rbp), %rdi
     2ea: 09 c7                        	orl	%eax, %edi
     2ec: e8 00 00 00 00               	callq	0x2f1 <toyos_fd_close+0x2f1>
		00000000000002ed:  R_X86_64_PLT32	toyos::net::stream::let_go-0x4
     2f1: 31 c0                        	xorl	%eax, %eax
     2f3: 48 83 c4 38                  	addq	$0x38, %rsp
     2f7: 5b                           	popq	%rbx
     2f8: 41 5c                        	popq	%r12
     2fa: 41 5d                        	popq	%r13
     2fc: 41 5e                        	popq	%r14
     2fe: 41 5f                        	popq	%r15
     300: 5d                           	popq	%rbp
     301: c3                           	retq
     302: 4c 89 4d b0                  	movq	%r9, -0x50(%rbp)
     306: 4c 89 45 b8                  	movq	%r8, -0x48(%rbp)
     30a: c1 e1 10                     	shll	$0x10, %ecx
     30d: 41 09 cf                     	orl	%ecx, %r15d
     310: 41 c1 e7 08                  	shll	$0x8, %r15d
     314: b3 01                        	movb	$0x1, %bl
     316: 31 f6                        	xorl	%esi, %esi
     318: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
     31c: e9 23 ff ff ff               	jmp	0x244 <toyos_fd_close+0x244>
     321: 45 31 ff                     	xorl	%r15d, %r15d
     324: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
     328: 31 f6                        	xorl	%esi, %esi
     32a: e9 13 ff ff ff               	jmp	0x242 <toyos_fd_close+0x242>
     32f: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x336 <toyos_fd_close+0x336>
		0000000000000332:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     336: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x33d <toyos_fd_close+0x33d>
		0000000000000339:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     33d: be 5f 00 00 00               	movl	$0x5f, %esi
     342: e8 00 00 00 00               	callq	0x347 <toyos_fd_close+0x347>
		0000000000000343:  R_X86_64_PLT32	core::panicking::panic_fmt-0x4
     347: eb 11                        	jmp	0x35a <toyos_fd_close+0x35a>
     349: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x350 <toyos_fd_close+0x350>
		000000000000034c:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     350: be 00 10 00 00               	movl	$0x1000, %esi           # imm = 0x1000
     355: e8 00 00 00 00               	callq	0x35a <toyos_fd_close+0x35a>
		0000000000000356:  R_X86_64_PLT32	core::panicking::panic_bounds_check-0x4
     35a: 0f 0b                        	ud2
     35c: 31 c0                        	xorl	%eax, %eax
     35e: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x364 <toyos_fd_close+0x364>
		0000000000000360:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     364: 83 f8 02                     	cmpl	$0x2, %eax
     367: 75 23                        	jne	0x38c <toyos_fd_close+0x38c>
     369: 48 8d 35 00 00 00 00         	leaq	(%rip), %rsi            # 0x370 <toyos_fd_close+0x370>
		000000000000036c:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     370: bf 3b 00 00 00               	movl	$0x3b, %edi
     375: ba 01 00 00 00               	movl	$0x1, %edx
     37a: 45 31 c0                     	xorl	%r8d, %r8d
     37d: 45 31 c9                     	xorl	%r9d, %r9d
     380: 0f 05                        	syscall
     382: e8 00 00 00 00               	callq	0x387 <toyos_fd_close+0x387>
		0000000000000383:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     387: e8 00 00 00 00               	callq	0x38c <toyos_fd_close+0x38c>
		0000000000000388:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     38c: e8 00 00 00 00               	callq	0x391 <toyos_fd_close+0x391>
		000000000000038d:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
