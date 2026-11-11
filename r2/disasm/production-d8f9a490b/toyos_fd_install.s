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
      2a: 0f 84 ee 00 00 00            	je	0x11e <toyos_fd_install+0x11e>
      30: ba 64 00 00 00               	movl	$0x64, %edx
      35: eb 24                        	jmp	0x5b <toyos_fd_install+0x5b>
      37: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
      40: 31 c0                        	xorl	%eax, %eax
      42: f0                           	lock
      43: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x4a <toyos_fd_install+0x4a>
		0000000000000046:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      4a: 0f 84 ce 00 00 00            	je	0x11e <toyos_fd_install+0x11e>
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
      7a: 0f 84 9e 00 00 00            	je	0x11e <toyos_fd_install+0x11e>
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
      aa: 74 72                        	je	0x11e <toyos_fd_install+0x11e>
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
      ca: 74 52                        	je	0x11e <toyos_fd_install+0x11e>
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
      f2: 74 2a                        	je	0x11e <toyos_fd_install+0x11e>
      f4: 4c 8d 3d 00 00 00 00         	leaq	(%rip), %r15            # 0xfb <toyos_fd_install+0xfb>
		00000000000000f7:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      fb: 0f 1f 44 00 00               	nopl	(%rax,%rax)
     100: 4c 89 ff                     	movq	%r15, %rdi
     103: be 02 00 00 00               	movl	$0x2, %esi
     108: 31 d2                        	xorl	%edx, %edx
     10a: e8 00 00 00 00               	callq	0x10f <toyos_fd_install+0x10f>
		000000000000010b:  R_X86_64_PLT32	toyos_abi::syscall::futex_wait-0x4
     10f: b8 02 00 00 00               	movl	$0x2, %eax
     114: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x11a <toyos_fd_install+0x11a>
		0000000000000116:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     11a: 85 c0                        	testl	%eax, %eax
     11c: 75 e2                        	jne	0x100 <toyos_fd_install+0x100>
     11e: 4c 8d 3d 00 00 00 00         	leaq	(%rip), %r15            # 0x125 <toyos_fd_install+0x125>
		0000000000000121:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner5TABLE-0x4
     125: 4c 89 7d b8                  	movq	%r15, -0x48(%rbp)
     129: 0f b6 05 00 00 00 00         	movzbl	(%rip), %eax            # 0x130 <toyos_fd_install+0x130>
		000000000000012c:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x4
     130: 84 c0                        	testb	%al, %al
     132: 74 12                        	je	0x146 <toyos_fd_install+0x146>
     134: 45 31 e4                     	xorl	%r12d, %r12d
     137: 41 81 fe ff 0f 00 00         	cmpl	$0xfff, %r14d           # imm = 0xFFF
     13e: 0f 87 86 00 00 00            	ja	0x1ca <toyos_fd_install+0x1ca>
     144: eb 54                        	jmp	0x19a <toyos_fd_install+0x19a>
     146: 48 8d 7d c0                  	leaq	-0x40(%rbp), %rdi
     14a: 48 8d 75 b8                  	leaq	-0x48(%rbp), %rsi
     14e: e8 00 00 00 00               	callq	0x153 <toyos_fd_install+0x153>
		000000000000014f:  R_X86_64_PLT32	.text._RNvNtNtCsX_5toyos2fd5owner5endow-0x4
     153: 80 7d c0 00                  	cmpb	$0x0, -0x40(%rbp)
     157: 74 2d                        	je	0x186 <toyos_fd_install+0x186>
     159: 0f b6 45 c1                  	movzbl	-0x3f(%rbp), %eax
     15d: 89 45 d4                     	movl	%eax, -0x2c(%rbp)
     160: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x167 <toyos_fd_install+0x167>
		0000000000000162:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     167: 41 b5 01                     	movb	$0x1, %r13b
     16a: 45 31 e4                     	xorl	%r12d, %r12d
     16d: 45 31 ff                     	xorl	%r15d, %r15d
     170: 31 c0                        	xorl	%eax, %eax
     172: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x178 <toyos_fd_install+0x178>
		0000000000000174:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     178: 83 f8 02                     	cmpl	$0x2, %eax
     17b: 0f 84 08 01 00 00            	je	0x289 <toyos_fd_install+0x289>
     181: e9 14 01 00 00               	jmp	0x29a <toyos_fd_install+0x29a>
     186: 4c 8b 65 c8                  	movq	-0x38(%rbp), %r12
     18a: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x191 <toyos_fd_install+0x191>
		000000000000018c:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     191: 41 81 fe ff 0f 00 00         	cmpl	$0xfff, %r14d           # imm = 0xFFF
     198: 77 30                        	ja	0x1ca <toyos_fd_install+0x1ca>
     19a: 44 89 f0                     	movl	%r14d, %eax
     19d: 49 89 c5                     	movq	%rax, %r13
     1a0: 49 c1 e5 20                  	shlq	$0x20, %r13
     1a4: 48 b9 00 00 00 00 01 00 00 00	movabsq	$0x100000000, %rcx      # imm = 0x100000000
     1ae: 66 90                        	nop
     1b0: 41 8b 94 87 00 00 04 00      	movl	0x40000(%r15,%rax,4), %edx
     1b8: 85 d2                        	testl	%edx, %edx
     1ba: 74 19                        	je	0x1d5 <toyos_fd_install+0x1d5>
     1bc: 48 ff c0                     	incq	%rax
     1bf: 49 01 cd                     	addq	%rcx, %r13
     1c2: 48 3d 00 10 00 00            	cmpq	$0x1000, %rax           # imm = 0x1000
     1c8: 75 e6                        	jne	0x1b0 <toyos_fd_install+0x1b0>
     1ca: 41 bd 01 01 00 00            	movl	$0x101, %r13d           # imm = 0x101
     1d0: e9 91 00 00 00               	jmp	0x266 <toyos_fd_install+0x266>
     1d5: 31 c9                        	xorl	%ecx, %ecx
     1d7: 31 d2                        	xorl	%edx, %edx
     1d9: 0f 1f 80 00 00 00 00         	nopl	(%rax)
     1e0: 42 8b 74 3a 18               	movl	0x18(%rdx,%r15), %esi
     1e5: 85 f6                        	testl	%esi, %esi
     1e7: 74 46                        	je	0x22f <toyos_fd_install+0x22f>
     1e9: 42 8b 74 3a 58               	movl	0x58(%rdx,%r15), %esi
     1ee: 85 f6                        	testl	%esi, %esi
     1f0: 74 2e                        	je	0x220 <toyos_fd_install+0x220>
     1f2: 42 8b b4 3a 98 00 00 00      	movl	0x98(%rdx,%r15), %esi
     1fa: 85 f6                        	testl	%esi, %esi
     1fc: 74 27                        	je	0x225 <toyos_fd_install+0x225>
     1fe: 42 8b b4 3a d8 00 00 00      	movl	0xd8(%rdx,%r15), %esi
     206: 85 f6                        	testl	%esi, %esi
     208: 74 21                        	je	0x22b <toyos_fd_install+0x22b>
     20a: 48 81 c2 00 01 00 00         	addq	$0x100, %rdx            # imm = 0x100
     211: 48 83 c1 04                  	addq	$0x4, %rcx
     215: 48 81 fa 00 00 04 00         	cmpq	$0x40000, %rdx          # imm = 0x40000
     21c: 75 c2                        	jne	0x1e0 <toyos_fd_install+0x1e0>
     21e: eb aa                        	jmp	0x1ca <toyos_fd_install+0x1ca>
     220: 48 ff c1                     	incq	%rcx
     223: eb 0a                        	jmp	0x22f <toyos_fd_install+0x22f>
     225: 48 83 c1 02                  	addq	$0x2, %rcx
     229: eb 04                        	jmp	0x22f <toyos_fd_install+0x22f>
     22b: 48 83 c1 03                  	addq	$0x3, %rcx
     22f: 48 89 ca                     	movq	%rcx, %rdx
     232: 48 c1 e2 06                  	shlq	$0x6, %rdx
     236: 48 8d 7d 10                  	leaq	0x10(%rbp), %rdi
     23a: 48 8b 77 10                  	movq	0x10(%rdi), %rsi
     23e: 4a 89 74 3a 10               	movq	%rsi, 0x10(%rdx,%r15)
     243: 0f 10 07                     	movups	(%rdi), %xmm0
     246: 42 0f 11 04 3a               	movups	%xmm0, (%rdx,%r15)
     24b: 42 c7 44 3a 18 01 00 00 00   	movl	$0x1, 0x18(%rdx,%r15)
     254: 0f b6 d3                     	movzbl	%bl, %edx
     257: c1 e2 1f                     	shll	$0x1f, %edx
     25a: 01 d1                        	addl	%edx, %ecx
     25c: ff c1                        	incl	%ecx
     25e: 41 89 8c 87 00 00 04 00      	movl	%ecx, 0x40000(%r15,%rax,4)
     266: 44 89 e8                     	movl	%r13d, %eax
     269: c1 e8 08                     	shrl	$0x8, %eax
     26c: 89 45 d4                     	movl	%eax, -0x2c(%rbp)
     26f: 49 bf 00 00 00 00 ff ff ff 7f	movabsq	$0x7fffffff00000000, %r15 # imm = 0x7FFFFFFF00000000
     279: 4d 21 ef                     	andq	%r13, %r15
     27c: 31 c0                        	xorl	%eax, %eax
     27e: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x284 <toyos_fd_install+0x284>
		0000000000000280:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     284: 83 f8 02                     	cmpl	$0x2, %eax
     287: 75 11                        	jne	0x29a <toyos_fd_install+0x29a>
     289: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x290 <toyos_fd_install+0x290>
		000000000000028c:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     290: be 01 00 00 00               	movl	$0x1, %esi
     295: e8 00 00 00 00               	callq	0x29a <toyos_fd_install+0x29a>
		0000000000000296:  R_X86_64_PLT32	toyos_abi::syscall::futex_wake-0x4
     29a: 4d 85 e4                     	testq	%r12, %r12
     29d: 74 33                        	je	0x2d2 <toyos_fd_install+0x2d2>
     29f: 48 8d 1d 00 00 00 00         	leaq	(%rip), %rbx            # 0x2a6 <toyos_fd_install+0x2a6>
		00000000000002a2:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     2a6: 4c 8d 75 c0                  	leaq	-0x40(%rbp), %r14
     2aa: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
     2b0: ba 3f 00 00 00               	movl	$0x3f, %edx
     2b5: bf 02 00 00 00               	movl	$0x2, %edi
     2ba: 48 89 de                     	movq	%rbx, %rsi
     2bd: e8 00 00 00 00               	callq	0x2c2 <toyos_fd_install+0x2c2>
		00000000000002be:  R_X86_64_PLT32	toyos_fs_write-0x4
     2c2: 4c 89 f7                     	movq	%r14, %rdi
     2c5: 48 89 c6                     	movq	%rax, %rsi
     2c8: e8 00 00 00 00               	callq	0x2cd <toyos_fd_install+0x2cd>
		00000000000002c9:  R_X86_64_PLT32	.text._RNvNtCsX_5toyos5files6decode-0x4
     2cd: 49 ff cc                     	decq	%r12
     2d0: 75 de                        	jne	0x2b0 <toyos_fd_install+0x2b0>
     2d2: 41 f6 c5 01                  	testb	$0x1, %r13b
     2d6: 48 8d 4d 10                  	leaq	0x10(%rbp), %rcx
     2da: 74 12                        	je	0x2ee <toyos_fd_install+0x2ee>
     2dc: 8b 45 d4                     	movl	-0x2c(%rbp), %eax
     2df: 3c 02                        	cmpb	$0x2, %al
     2e1: 74 50                        	je	0x333 <toyos_fd_install+0x333>
     2e3: 44 0f b6 f8                  	movzbl	%al, %r15d
     2e7: 41 c1 e7 08                  	shll	$0x8, %r15d
     2eb: 49 ff c7                     	incq	%r15
     2ee: 41 f6 c7 01                  	testb	$0x1, %r15b
     2f2: 74 11                        	je	0x305 <toyos_fd_install+0x305>
     2f4: 48 8b 41 10                  	movq	0x10(%rcx), %rax
     2f8: 48 85 c0                     	testq	%rax, %rax
     2fb: 74 11                        	je	0x30e <toyos_fd_install+0x30e>
     2fd: 48 8b 79 08                  	movq	0x8(%rcx), %rdi
     301: ff d0                        	callq	*%rax
     303: eb 10                        	jmp	0x315 <toyos_fd_install+0x315>
     305: 49 c1 ef 20                  	shrq	$0x20, %r15
     309: 44 89 f8                     	movl	%r15d, %eax
     30c: eb 16                        	jmp	0x324 <toyos_fd_install+0x324>
     30e: 8b 39                        	movl	(%rcx), %edi
     310: e8 00 00 00 00               	callq	0x315 <toyos_fd_install+0x315>
		0000000000000311:  R_X86_64_PLT32	toyos::net::stream::let_go-0x4
     315: 31 c0                        	xorl	%eax, %eax
     317: 41 f7 c7 00 01 00 00         	testl	$0x100, %r15d           # imm = 0x100
     31e: 0f 94 c0                     	sete	%al
     321: 83 c8 fe                     	orl	$-0x2, %eax
     324: 48 83 c4 28                  	addq	$0x28, %rsp
     328: 5b                           	popq	%rbx
     329: 41 5c                        	popq	%r12
     32b: 41 5d                        	popq	%r13
     32d: 41 5e                        	popq	%r14
     32f: 41 5f                        	popq	%r15
     331: 5d                           	popq	%rbp
     332: c3                           	retq
     333: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x33a <toyos_fd_install+0x33a>
		0000000000000336:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     33a: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x341 <toyos_fd_install+0x341>
		000000000000033d:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     341: be 5f 00 00 00               	movl	$0x5f, %esi
     346: e8 00 00 00 00               	callq	0x34b <toyos_fd_install+0x34b>
		0000000000000347:  R_X86_64_PLT32	core::panicking::panic_fmt-0x4
     34b: 0f 0b                        	ud2
     34d: 31 c0                        	xorl	%eax, %eax
     34f: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x355 <toyos_fd_install+0x355>
		0000000000000351:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     355: 83 f8 02                     	cmpl	$0x2, %eax
     358: 75 22                        	jne	0x37c <toyos_fd_install+0x37c>
     35a: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x361 <toyos_fd_install+0x361>
		000000000000035d:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     361: be 01 00 00 00               	movl	$0x1, %esi
     366: e8 00 00 00 00               	callq	0x36b <toyos_fd_install+0x36b>
		0000000000000367:  R_X86_64_PLT32	toyos_abi::syscall::futex_wake-0x4
     36b: eb 0f                        	jmp	0x37c <toyos_fd_install+0x37c>
     36d: e8 00 00 00 00               	callq	0x372 <toyos_fd_install+0x372>
		000000000000036e:  R_X86_64_PLT32	core::panicking::panic_in_cleanup-0x4
     372: e8 00 00 00 00               	callq	0x377 <toyos_fd_install+0x377>
		0000000000000373:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     377: e8 00 00 00 00               	callq	0x37c <toyos_fd_install+0x37c>
		0000000000000378:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     37c: e8 00 00 00 00               	callq	0x381 <toyos_fd_install+0x381>
		000000000000037d:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
