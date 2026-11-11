Disassembly of section .text.toyos_fd_set_inheritable:

0000000000000000 <toyos_fd_set_inheritable>:
       0: 55                           	pushq	%rbp
       1: 48 89 e5                     	movq	%rsp, %rbp
       4: 41 57                        	pushq	%r15
       6: 41 56                        	pushq	%r14
       8: 41 55                        	pushq	%r13
       a: 41 54                        	pushq	%r12
       c: 53                           	pushq	%rbx
       d: 48 83 ec 18                  	subq	$0x18, %rsp
      11: 89 f3                        	movl	%esi, %ebx
      13: 41 89 fe                     	movl	%edi, %r14d
      16: e8 00 00 00 00               	callq	0x1b <toyos_fd_set_inheritable+0x1b>
		0000000000000017:  R_X86_64_PLT32	<toyos::endow::Endowments>::get-0x4
      1b: b9 01 00 00 00               	movl	$0x1, %ecx
      20: 31 c0                        	xorl	%eax, %eax
      22: f0                           	lock
      23: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x2a <toyos_fd_set_inheritable+0x2a>
		0000000000000026:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      2a: 0f 84 f4 00 00 00            	je	0x124 <toyos_fd_set_inheritable+0x124>
      30: ba 64 00 00 00               	movl	$0x64, %edx
      35: eb 24                        	jmp	0x5b <toyos_fd_set_inheritable+0x5b>
      37: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
      40: 31 c0                        	xorl	%eax, %eax
      42: f0                           	lock
      43: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x4a <toyos_fd_set_inheritable+0x4a>
		0000000000000046:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      4a: 0f 84 d4 00 00 00            	je	0x124 <toyos_fd_set_inheritable+0x124>
      50: f3 90                        	pause
      52: 83 c2 fc                     	addl	$-0x4, %edx
      55: 0f 84 8a 00 00 00            	je	0xe5 <toyos_fd_set_inheritable+0xe5>
      5b: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0x61 <toyos_fd_set_inheritable+0x61>
		000000000000005d:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      61: 85 c0                        	testl	%eax, %eax
      63: 74 0b                        	je	0x70 <toyos_fd_set_inheritable+0x70>
      65: 83 f8 02                     	cmpl	$0x2, %eax
      68: 75 16                        	jne	0x80 <toyos_fd_set_inheritable+0x80>
      6a: eb 79                        	jmp	0xe5 <toyos_fd_set_inheritable+0xe5>
      6c: 0f 1f 40 00                  	nopl	(%rax)
      70: 31 c0                        	xorl	%eax, %eax
      72: f0                           	lock
      73: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x7a <toyos_fd_set_inheritable+0x7a>
		0000000000000076:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      7a: 0f 84 a4 00 00 00            	je	0x124 <toyos_fd_set_inheritable+0x124>
      80: f3 90                        	pause
      82: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0x88 <toyos_fd_set_inheritable+0x88>
		0000000000000084:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      88: 85 c0                        	testl	%eax, %eax
      8a: 74 14                        	je	0xa0 <toyos_fd_set_inheritable+0xa0>
      8c: 83 f8 02                     	cmpl	$0x2, %eax
      8f: 75 1b                        	jne	0xac <toyos_fd_set_inheritable+0xac>
      91: eb 52                        	jmp	0xe5 <toyos_fd_set_inheritable+0xe5>
      93: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
      a0: 31 c0                        	xorl	%eax, %eax
      a2: f0                           	lock
      a3: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0xaa <toyos_fd_set_inheritable+0xaa>
		00000000000000a6:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      aa: 74 78                        	je	0x124 <toyos_fd_set_inheritable+0x124>
      ac: f3 90                        	pause
      ae: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0xb4 <toyos_fd_set_inheritable+0xb4>
		00000000000000b0:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      b4: 85 c0                        	testl	%eax, %eax
      b6: 74 08                        	je	0xc0 <toyos_fd_set_inheritable+0xc0>
      b8: 83 f8 02                     	cmpl	$0x2, %eax
      bb: 75 0f                        	jne	0xcc <toyos_fd_set_inheritable+0xcc>
      bd: eb 26                        	jmp	0xe5 <toyos_fd_set_inheritable+0xe5>
      bf: 90                           	nop
      c0: 31 c0                        	xorl	%eax, %eax
      c2: f0                           	lock
      c3: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0xca <toyos_fd_set_inheritable+0xca>
		00000000000000c6:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      ca: 74 58                        	je	0x124 <toyos_fd_set_inheritable+0x124>
      cc: f3 90                        	pause
      ce: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0xd4 <toyos_fd_set_inheritable+0xd4>
		00000000000000d0:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      d4: 85 c0                        	testl	%eax, %eax
      d6: 0f 84 64 ff ff ff            	je	0x40 <toyos_fd_set_inheritable+0x40>
      dc: 83 f8 02                     	cmpl	$0x2, %eax
      df: 0f 85 6b ff ff ff            	jne	0x50 <toyos_fd_set_inheritable+0x50>
      e5: b8 02 00 00 00               	movl	$0x2, %eax
      ea: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0xf0 <toyos_fd_set_inheritable+0xf0>
		00000000000000ec:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      f0: 85 c0                        	testl	%eax, %eax
      f2: 74 30                        	je	0x124 <toyos_fd_set_inheritable+0x124>
      f4: 48 8d 35 00 00 00 00         	leaq	(%rip), %rsi            # 0xfb <toyos_fd_set_inheritable+0xfb>
		00000000000000f7:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      fb: bf 3a 00 00 00               	movl	$0x3a, %edi
     100: ba 02 00 00 00               	movl	$0x2, %edx
     105: 49 c7 c0 ff ff ff ff         	movq	$-0x1, %r8
     10c: 0f 1f 40 00                  	nopl	(%rax)
     110: 45 31 c9                     	xorl	%r9d, %r9d
     113: 0f 05                        	syscall
     115: b8 02 00 00 00               	movl	$0x2, %eax
     11a: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x120 <toyos_fd_set_inheritable+0x120>
		000000000000011c:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     120: 85 c0                        	testl	%eax, %eax
     122: 75 ec                        	jne	0x110 <toyos_fd_set_inheritable+0x110>
     124: 4c 8d 2d 00 00 00 00         	leaq	(%rip), %r13            # 0x12b <toyos_fd_set_inheritable+0x12b>
		0000000000000127:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner5TABLE-0x4
     12b: 4c 89 6d c0                  	movq	%r13, -0x40(%rbp)
     12f: 0f b6 05 00 00 00 00         	movzbl	(%rip), %eax            # 0x136 <toyos_fd_set_inheritable+0x136>
		0000000000000132:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x4
     136: 84 c0                        	testb	%al, %al
     138: 74 0e                        	je	0x148 <toyos_fd_set_inheritable+0x148>
     13a: 45 31 ff                     	xorl	%r15d, %r15d
     13d: 41 81 fe ff 0f 00 00         	cmpl	$0xfff, %r14d           # imm = 0xFFF
     144: 77 74                        	ja	0x1ba <toyos_fd_set_inheritable+0x1ba>
     146: eb 38                        	jmp	0x180 <toyos_fd_set_inheritable+0x180>
     148: 48 8d 7d c8                  	leaq	-0x38(%rbp), %rdi
     14c: 48 8d 75 c0                  	leaq	-0x40(%rbp), %rsi
     150: e8 00 00 00 00               	callq	0x155 <toyos_fd_set_inheritable+0x155>
		0000000000000151:  R_X86_64_PLT32	.text._RNvNtNtCsX_5toyos2fd5owner5endow-0x4
     155: 80 7d c8 00                  	cmpb	$0x0, -0x38(%rbp)
     159: 74 11                        	je	0x16c <toyos_fd_set_inheritable+0x16c>
     15b: 44 0f b6 65 c9               	movzbl	-0x37(%rbp), %r12d
     160: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x167 <toyos_fd_set_inheritable+0x167>
		0000000000000162:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     167: 45 31 ff                     	xorl	%r15d, %r15d
     16a: eb 51                        	jmp	0x1bd <toyos_fd_set_inheritable+0x1bd>
     16c: 4c 8b 7d d0                  	movq	-0x30(%rbp), %r15
     170: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x177 <toyos_fd_set_inheritable+0x177>
		0000000000000172:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     177: 41 81 fe ff 0f 00 00         	cmpl	$0xfff, %r14d           # imm = 0xFFF
     17e: 77 3a                        	ja	0x1ba <toyos_fd_set_inheritable+0x1ba>
     180: 44 89 f0                     	movl	%r14d, %eax
     183: 41 8b bc 85 00 00 04 00      	movl	0x40000(%r13,%rax,4), %edi
     18b: 85 ff                        	testl	%edi, %edi
     18d: 74 2b                        	je	0x1ba <toyos_fd_set_inheritable+0x1ba>
     18f: 81 e7 ff ff ff 7f            	andl	$0x7fffffff, %edi       # imm = 0x7FFFFFFF
     195: 0f 84 ac 00 00 00            	je	0x247 <toyos_fd_set_inheritable+0x247>
     19b: 89 fa                        	movl	%edi, %edx
     19d: 48 ff cf                     	decq	%rdi
     1a0: 31 c9                        	xorl	%ecx, %ecx
     1a2: 81 fa 01 10 00 00            	cmpl	$0x1001, %edx           # imm = 0x1001
     1a8: 0f 92 c1                     	setb	%cl
     1ab: 41 b4 02                     	movb	$0x2, %r12b
     1ae: 48 83 f9 01                  	cmpq	$0x1, %rcx
     1b2: 0f 84 9e 00 00 00            	je	0x256 <toyos_fd_set_inheritable+0x256>
     1b8: eb 03                        	jmp	0x1bd <toyos_fd_set_inheritable+0x1bd>
     1ba: 45 31 e4                     	xorl	%r12d, %r12d
     1bd: 31 c0                        	xorl	%eax, %eax
     1bf: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x1c5 <toyos_fd_set_inheritable+0x1c5>
		00000000000001c1:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     1c5: 83 f8 02                     	cmpl	$0x2, %eax
     1c8: 75 19                        	jne	0x1e3 <toyos_fd_set_inheritable+0x1e3>
     1ca: 48 8d 35 00 00 00 00         	leaq	(%rip), %rsi            # 0x1d1 <toyos_fd_set_inheritable+0x1d1>
		00000000000001cd:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     1d1: bf 3b 00 00 00               	movl	$0x3b, %edi
     1d6: ba 01 00 00 00               	movl	$0x1, %edx
     1db: 45 31 c0                     	xorl	%r8d, %r8d
     1de: 45 31 c9                     	xorl	%r9d, %r9d
     1e1: 0f 05                        	syscall
     1e3: 4d 85 ff                     	testq	%r15, %r15
     1e6: 74 3a                        	je	0x222 <toyos_fd_set_inheritable+0x222>
     1e8: 48 8d 1d 00 00 00 00         	leaq	(%rip), %rbx            # 0x1ef <toyos_fd_set_inheritable+0x1ef>
		00000000000001eb:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     1ef: 4c 8d 75 c8                  	leaq	-0x38(%rbp), %r14
     1f3: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
     200: ba 3f 00 00 00               	movl	$0x3f, %edx
     205: bf 02 00 00 00               	movl	$0x2, %edi
     20a: 48 89 de                     	movq	%rbx, %rsi
     20d: e8 00 00 00 00               	callq	0x212 <toyos_fd_set_inheritable+0x212>
		000000000000020e:  R_X86_64_PLT32	toyos_fs_write-0x4
     212: 4c 89 f7                     	movq	%r14, %rdi
     215: 48 89 c6                     	movq	%rax, %rsi
     218: e8 00 00 00 00               	callq	0x21d <toyos_fd_set_inheritable+0x21d>
		0000000000000219:  R_X86_64_PLT32	.text._RNvNtCsX_5toyos5files6decode-0x4
     21d: 49 ff cf                     	decq	%r15
     220: 75 de                        	jne	0x200 <toyos_fd_set_inheritable+0x200>
     222: 31 c0                        	xorl	%eax, %eax
     224: 41 80 fc ff                  	cmpb	$-0x1, %r12b
     228: 74 0e                        	je	0x238 <toyos_fd_set_inheritable+0x238>
     22a: 41 0f b6 c4                  	movzbl	%r12b, %eax
     22e: 83 f8 02                     	cmpl	$0x2, %eax
     231: 74 5a                        	je	0x28d <toyos_fd_set_inheritable+0x28d>
     233: f7 d0                        	notl	%eax
     235: 83 c8 fe                     	orl	$-0x2, %eax
     238: 48 83 c4 18                  	addq	$0x18, %rsp
     23c: 5b                           	popq	%rbx
     23d: 41 5c                        	popq	%r12
     23f: 41 5d                        	popq	%r13
     241: 41 5e                        	popq	%r14
     243: 41 5f                        	popq	%r15
     245: 5d                           	popq	%rbp
     246: c3                           	retq
     247: 31 c9                        	xorl	%ecx, %ecx
     249: 41 b4 02                     	movb	$0x2, %r12b
     24c: 48 83 f9 01                  	cmpq	$0x1, %rcx
     250: 0f 85 67 ff ff ff            	jne	0x1bd <toyos_fd_set_inheritable+0x1bd>
     256: 48 81 ff ff 0f 00 00         	cmpq	$0xfff, %rdi            # imm = 0xFFF
     25d: 77 48                        	ja	0x2a7 <toyos_fd_set_inheritable+0x2a7>
     25f: 48 89 f9                     	movq	%rdi, %rcx
     262: 48 c1 e1 06                  	shlq	$0x6, %rcx
     266: 42 8b 4c 29 18               	movl	0x18(%rcx,%r13), %ecx
     26b: 85 c9                        	testl	%ecx, %ecx
     26d: 0f 84 4a ff ff ff            	je	0x1bd <toyos_fd_set_inheritable+0x1bd>
     273: 0f b6 cb                     	movzbl	%bl, %ecx
     276: c1 e1 1f                     	shll	$0x1f, %ecx
     279: 01 f9                        	addl	%edi, %ecx
     27b: ff c1                        	incl	%ecx
     27d: 41 89 8c 85 00 00 04 00      	movl	%ecx, 0x40000(%r13,%rax,4)
     285: 41 b4 ff                     	movb	$-0x1, %r12b
     288: e9 30 ff ff ff               	jmp	0x1bd <toyos_fd_set_inheritable+0x1bd>
     28d: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x294 <toyos_fd_set_inheritable+0x294>
		0000000000000290:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     294: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x29b <toyos_fd_set_inheritable+0x29b>
		0000000000000297:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     29b: be 5f 00 00 00               	movl	$0x5f, %esi
     2a0: e8 00 00 00 00               	callq	0x2a5 <toyos_fd_set_inheritable+0x2a5>
		00000000000002a1:  R_X86_64_PLT32	core::panicking::panic_fmt-0x4
     2a5: eb 11                        	jmp	0x2b8 <toyos_fd_set_inheritable+0x2b8>
     2a7: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x2ae <toyos_fd_set_inheritable+0x2ae>
		00000000000002aa:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     2ae: be 00 10 00 00               	movl	$0x1000, %esi           # imm = 0x1000
     2b3: e8 00 00 00 00               	callq	0x2b8 <toyos_fd_set_inheritable+0x2b8>
		00000000000002b4:  R_X86_64_PLT32	core::panicking::panic_bounds_check-0x4
     2b8: 0f 0b                        	ud2
     2ba: 31 c0                        	xorl	%eax, %eax
     2bc: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x2c2 <toyos_fd_set_inheritable+0x2c2>
		00000000000002be:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     2c2: 83 f8 02                     	cmpl	$0x2, %eax
     2c5: 75 23                        	jne	0x2ea <toyos_fd_set_inheritable+0x2ea>
     2c7: 48 8d 35 00 00 00 00         	leaq	(%rip), %rsi            # 0x2ce <toyos_fd_set_inheritable+0x2ce>
		00000000000002ca:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     2ce: bf 3b 00 00 00               	movl	$0x3b, %edi
     2d3: ba 01 00 00 00               	movl	$0x1, %edx
     2d8: 45 31 c0                     	xorl	%r8d, %r8d
     2db: 45 31 c9                     	xorl	%r9d, %r9d
     2de: 0f 05                        	syscall
     2e0: e8 00 00 00 00               	callq	0x2e5 <toyos_fd_set_inheritable+0x2e5>
		00000000000002e1:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     2e5: e8 00 00 00 00               	callq	0x2ea <toyos_fd_set_inheritable+0x2ea>
		00000000000002e6:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     2ea: e8 00 00 00 00               	callq	0x2ef <toyos_fd_set_inheritable+0x2ef>
		00000000000002eb:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
