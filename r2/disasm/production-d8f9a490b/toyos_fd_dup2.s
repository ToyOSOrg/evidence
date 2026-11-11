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
      11: 89 d3                        	movl	%edx, %ebx
      13: 89 75 c4                     	movl	%esi, -0x3c(%rbp)
      16: 41 89 fc                     	movl	%edi, %r12d
      19: e8 00 00 00 00               	callq	0x1e <toyos_fd_dup2+0x1e>
		000000000000001a:  R_X86_64_PLT32	<toyos::endow::Endowments>::get-0x4
      1e: b9 01 00 00 00               	movl	$0x1, %ecx
      23: 31 c0                        	xorl	%eax, %eax
      25: f0                           	lock
      26: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x2d <toyos_fd_dup2+0x2d>
		0000000000000029:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      2d: 0f 84 eb 00 00 00            	je	0x11e <toyos_fd_dup2+0x11e>
      33: ba 64 00 00 00               	movl	$0x64, %edx
      38: eb 21                        	jmp	0x5b <toyos_fd_dup2+0x5b>
      3a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
      40: 31 c0                        	xorl	%eax, %eax
      42: f0                           	lock
      43: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x4a <toyos_fd_dup2+0x4a>
		0000000000000046:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      4a: 0f 84 ce 00 00 00            	je	0x11e <toyos_fd_dup2+0x11e>
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
      7a: 0f 84 9e 00 00 00            	je	0x11e <toyos_fd_dup2+0x11e>
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
      aa: 74 72                        	je	0x11e <toyos_fd_dup2+0x11e>
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
      ca: 74 52                        	je	0x11e <toyos_fd_dup2+0x11e>
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
      f2: 74 2a                        	je	0x11e <toyos_fd_dup2+0x11e>
      f4: 4c 8d 3d 00 00 00 00         	leaq	(%rip), %r15            # 0xfb <toyos_fd_dup2+0xfb>
		00000000000000f7:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      fb: 0f 1f 44 00 00               	nopl	(%rax,%rax)
     100: 4c 89 ff                     	movq	%r15, %rdi
     103: be 02 00 00 00               	movl	$0x2, %esi
     108: 31 d2                        	xorl	%edx, %edx
     10a: e8 00 00 00 00               	callq	0x10f <toyos_fd_dup2+0x10f>
		000000000000010b:  R_X86_64_PLT32	toyos_abi::syscall::futex_wait-0x4
     10f: b8 02 00 00 00               	movl	$0x2, %eax
     114: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x11a <toyos_fd_dup2+0x11a>
		0000000000000116:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     11a: 85 c0                        	testl	%eax, %eax
     11c: 75 e2                        	jne	0x100 <toyos_fd_dup2+0x100>
     11e: 4c 8d 2d 00 00 00 00         	leaq	(%rip), %r13            # 0x125 <toyos_fd_dup2+0x125>
		0000000000000121:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner5TABLE-0x4
     125: 4c 89 6d 98                  	movq	%r13, -0x68(%rbp)
     129: 0f b6 05 00 00 00 00         	movzbl	(%rip), %eax            # 0x130 <toyos_fd_dup2+0x130>
		000000000000012c:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x4
     130: 84 c0                        	testb	%al, %al
     132: 74 11                        	je	0x145 <toyos_fd_dup2+0x145>
     134: 45 31 f6                     	xorl	%r14d, %r14d
     137: 41 81 fc ff 0f 00 00         	cmpl	$0xfff, %r12d           # imm = 0xFFF
     13e: 76 65                        	jbe	0x1a5 <toyos_fd_dup2+0x1a5>
     140: e9 e4 00 00 00               	jmp	0x229 <toyos_fd_dup2+0x229>
     145: 48 8d 7d b0                  	leaq	-0x50(%rbp), %rdi
     149: 48 8d 75 98                  	leaq	-0x68(%rbp), %rsi
     14d: e8 00 00 00 00               	callq	0x152 <toyos_fd_dup2+0x152>
		000000000000014e:  R_X86_64_PLT32	.text._RNvNtNtCsX_5toyos2fd5owner5endow-0x4
     152: 80 7d b0 00                  	cmpb	$0x0, -0x50(%rbp)
     156: 74 35                        	je	0x18d <toyos_fd_dup2+0x18d>
     158: 0f b6 45 b1                  	movzbl	-0x4f(%rbp), %eax
     15c: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
     160: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x167 <toyos_fd_dup2+0x167>
		0000000000000162:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     167: b3 01                        	movb	$0x1, %bl
     169: 48 c7 45 c8 00 00 00 00      	movq	$0x0, -0x38(%rbp)
     171: 45 31 ff                     	xorl	%r15d, %r15d
     174: 45 31 f6                     	xorl	%r14d, %r14d
     177: 31 c0                        	xorl	%eax, %eax
     179: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x17f <toyos_fd_dup2+0x17f>
		000000000000017b:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     17f: 83 f8 02                     	cmpl	$0x2, %eax
     182: 0f 85 d5 01 00 00            	jne	0x35d <toyos_fd_dup2+0x35d>
     188: e9 bf 01 00 00               	jmp	0x34c <toyos_fd_dup2+0x34c>
     18d: 4c 8b 75 b8                  	movq	-0x48(%rbp), %r14
     191: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x198 <toyos_fd_dup2+0x198>
		0000000000000193:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     198: 41 81 fc ff 0f 00 00         	cmpl	$0xfff, %r12d           # imm = 0xFFF
     19f: 0f 87 84 00 00 00            	ja	0x229 <toyos_fd_dup2+0x229>
     1a5: 44 89 e0                     	movl	%r12d, %eax
     1a8: 41 8b 8c 85 00 00 04 00      	movl	0x40000(%r13,%rax,4), %ecx
     1b0: 85 c9                        	testl	%ecx, %ecx
     1b2: 74 75                        	je	0x229 <toyos_fd_dup2+0x229>
     1b4: 81 e1 ff ff ff 7f            	andl	$0x7fffffff, %ecx       # imm = 0x7FFFFFFF
     1ba: 74 1b                        	je	0x1d7 <toyos_fd_dup2+0x1d7>
     1bc: 89 ca                        	movl	%ecx, %edx
     1be: 48 ff c9                     	decq	%rcx
     1c1: 31 c0                        	xorl	%eax, %eax
     1c3: 81 fa 01 10 00 00            	cmpl	$0x1001, %edx           # imm = 0x1001
     1c9: 0f 92 c0                     	setb	%al
     1cc: 48 83 f8 01                  	cmpq	$0x1, %rax
     1d0: 74 11                        	je	0x1e3 <toyos_fd_dup2+0x1e3>
     1d2: e9 43 01 00 00               	jmp	0x31a <toyos_fd_dup2+0x31a>
     1d7: 31 c0                        	xorl	%eax, %eax
     1d9: 48 83 f8 01                  	cmpq	$0x1, %rax
     1dd: 0f 85 37 01 00 00            	jne	0x31a <toyos_fd_dup2+0x31a>
     1e3: 48 89 cf                     	movq	%rcx, %rdi
     1e6: 48 81 f9 ff 0f 00 00         	cmpq	$0xfff, %rcx            # imm = 0xFFF
     1ed: 0f 87 3d 02 00 00            	ja	0x430 <toyos_fd_dup2+0x430>
     1f3: 48 89 ca                     	movq	%rcx, %rdx
     1f6: 48 c1 e2 06                  	shlq	$0x6, %rdx
     1fa: 42 8b 44 2a 18               	movl	0x18(%rdx,%r13), %eax
     1ff: 85 c0                        	testl	%eax, %eax
     201: 0f 84 25 01 00 00            	je	0x32c <toyos_fd_dup2+0x32c>
     207: 8b 45 c4                     	movl	-0x3c(%rbp), %eax
     20a: 3d ff 0f 00 00               	cmpl	$0xfff, %eax            # imm = 0xFFF
     20f: 77 18                        	ja	0x229 <toyos_fd_dup2+0x229>
     211: 44 39 e0                     	cmpl	%r12d, %eax
     214: 75 2a                        	jne	0x240 <toyos_fd_dup2+0x240>
     216: 48 c7 45 c8 00 00 00 00      	movq	$0x0, -0x38(%rbp)
     21e: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
     222: 31 db                        	xorl	%ebx, %ebx
     224: e9 13 01 00 00               	jmp	0x33c <toyos_fd_dup2+0x33c>
     229: b3 01                        	movb	$0x1, %bl
     22b: 48 c7 45 c8 00 00 00 00      	movq	$0x0, -0x38(%rbp)
     233: 48 c7 45 d0 00 00 00 00      	movq	$0x0, -0x30(%rbp)
     23b: e9 fc 00 00 00               	jmp	0x33c <toyos_fd_dup2+0x33c>
     240: 89 c6                        	movl	%eax, %esi
     242: 41 8b bc b5 00 00 04 00      	movl	0x40000(%r13,%rsi,4), %edi
     24a: 41 b0 01                     	movb	$0x1, %r8b
     24d: 85 ff                        	testl	%edi, %edi
     24f: 74 1c                        	je	0x26d <toyos_fd_dup2+0x26d>
     251: 81 e7 ff ff ff 7f            	andl	$0x7fffffff, %edi       # imm = 0x7FFFFFFF
     257: 74 16                        	je	0x26f <toyos_fd_dup2+0x26f>
     259: 41 89 f9                     	movl	%edi, %r9d
     25c: 48 ff cf                     	decq	%rdi
     25f: 31 c0                        	xorl	%eax, %eax
     261: 41 81 f9 01 10 00 00         	cmpl	$0x1001, %r9d           # imm = 0x1001
     268: 0f 92 c0                     	setb	%al
     26b: eb 04                        	jmp	0x271 <toyos_fd_dup2+0x271>
     26d: eb 27                        	jmp	0x296 <toyos_fd_dup2+0x296>
     26f: 31 c0                        	xorl	%eax, %eax
     271: 48 83 f8 01                  	cmpq	$0x1, %rax
     275: 75 1f                        	jne	0x296 <toyos_fd_dup2+0x296>
     277: 48 81 ff ff 0f 00 00         	cmpq	$0xfff, %rdi            # imm = 0xFFF
     27e: 0f 87 ac 01 00 00            	ja	0x430 <toyos_fd_dup2+0x430>
     284: 48 89 f8                     	movq	%rdi, %rax
     287: 48 c1 e0 06                  	shlq	$0x6, %rax
     28b: 42 8b 44 28 18               	movl	0x18(%rax,%r13), %eax
     290: 85 c0                        	testl	%eax, %eax
     292: 41 0f 94 c0                  	sete	%r8b
     296: 4c 01 ea                     	addq	%r13, %rdx
     299: 8b 42 18                     	movl	0x18(%rdx), %eax
     29c: 44 8d 48 ff                  	leal	-0x1(%rax), %r9d
     2a0: 41 83 f9 fd                  	cmpl	$-0x3, %r9d
     2a4: 77 74                        	ja	0x31a <toyos_fd_dup2+0x31a>
     2a6: 44 8d 48 01                  	leal	0x1(%rax), %r9d
     2aa: f0                           	lock
     2ab: 44 0f b1 4a 18               	cmpxchgl	%r9d, 0x18(%rdx)
     2b0: 75 ea                        	jne	0x29c <toyos_fd_dup2+0x29c>
     2b2: 81 fe ff 0f 00 00            	cmpl	$0xfff, %esi            # imm = 0xFFF
     2b8: 77 72                        	ja	0x32c <toyos_fd_dup2+0x32c>
     2ba: 0f b6 c3                     	movzbl	%bl, %eax
     2bd: c1 e0 1f                     	shll	$0x1f, %eax
     2c0: 01 c8                        	addl	%ecx, %eax
     2c2: ff c0                        	incl	%eax
     2c4: 41 89 84 b5 00 00 04 00      	movl	%eax, 0x40000(%r13,%rsi,4)
     2cc: 45 84 c0                     	testb	%r8b, %r8b
     2cf: 0f 85 41 ff ff ff            	jne	0x216 <toyos_fd_dup2+0x216>
     2d5: 48 c1 e7 06                  	shlq	$0x6, %rdi
     2d9: 42 0f b6 04 2f               	movzbl	(%rdi,%r13), %eax
     2de: 42 0f b7 74 2f 01            	movzwl	0x1(%rdi,%r13), %esi
     2e4: 42 0f b6 4c 2f 03            	movzbl	0x3(%rdi,%r13), %ecx
     2ea: 4e 8b 44 2f 08               	movq	0x8(%rdi,%r13), %r8
     2ef: 4e 8b 4c 2f 10               	movq	0x10(%rdi,%r13), %r9
     2f4: ba ff ff ff ff               	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
     2f9: f0                           	lock
     2fa: 42 0f c1 54 2f 18            	xaddl	%edx, 0x18(%rdi,%r13)
     300: 83 fa 01                     	cmpl	$0x1, %edx
     303: 0f 84 f4 00 00 00            	je	0x3fd <toyos_fd_dup2+0x3fd>
     309: b3 01                        	movb	$0x1, %bl
     30b: b0 02                        	movb	$0x2, %al
     30d: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
     311: 85 d2                        	testl	%edx, %edx
     313: 74 1f                        	je	0x334 <toyos_fd_dup2+0x334>
     315: e9 fc fe ff ff               	jmp	0x216 <toyos_fd_dup2+0x216>
     31a: b3 01                        	movb	$0x1, %bl
     31c: 48 c7 45 c8 00 00 00 00      	movq	$0x0, -0x38(%rbp)
     324: b0 02                        	movb	$0x2, %al
     326: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
     32a: eb 10                        	jmp	0x33c <toyos_fd_dup2+0x33c>
     32c: b3 01                        	movb	$0x1, %bl
     32e: b0 02                        	movb	$0x2, %al
     330: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
     334: 48 c7 45 c8 00 00 00 00      	movq	$0x0, -0x38(%rbp)
     33c: 45 31 ff                     	xorl	%r15d, %r15d
     33f: 31 c0                        	xorl	%eax, %eax
     341: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x347 <toyos_fd_dup2+0x347>
		0000000000000343:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     347: 83 f8 02                     	cmpl	$0x2, %eax
     34a: 75 11                        	jne	0x35d <toyos_fd_dup2+0x35d>
     34c: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x353 <toyos_fd_dup2+0x353>
		000000000000034f:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     353: be 01 00 00 00               	movl	$0x1, %esi
     358: e8 00 00 00 00               	callq	0x35d <toyos_fd_dup2+0x35d>
		0000000000000359:  R_X86_64_PLT32	toyos_abi::syscall::futex_wake-0x4
     35d: 4d 85 f6                     	testq	%r14, %r14
     360: 74 30                        	je	0x392 <toyos_fd_dup2+0x392>
     362: 4c 8d 25 00 00 00 00         	leaq	(%rip), %r12            # 0x369 <toyos_fd_dup2+0x369>
		0000000000000365:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     369: 4c 8d 6d b0                  	leaq	-0x50(%rbp), %r13
     36d: 0f 1f 00                     	nopl	(%rax)
     370: ba 3f 00 00 00               	movl	$0x3f, %edx
     375: bf 02 00 00 00               	movl	$0x2, %edi
     37a: 4c 89 e6                     	movq	%r12, %rsi
     37d: e8 00 00 00 00               	callq	0x382 <toyos_fd_dup2+0x382>
		000000000000037e:  R_X86_64_PLT32	toyos_fs_write-0x4
     382: 4c 89 ef                     	movq	%r13, %rdi
     385: 48 89 c6                     	movq	%rax, %rsi
     388: e8 00 00 00 00               	callq	0x38d <toyos_fd_dup2+0x38d>
		0000000000000389:  R_X86_64_PLT32	.text._RNvNtCsX_5toyos5files6decode-0x4
     38d: 49 ff ce                     	decq	%r14
     390: 75 de                        	jne	0x370 <toyos_fd_dup2+0x370>
     392: 84 db                        	testb	%bl, %bl
     394: 74 16                        	je	0x3ac <toyos_fd_dup2+0x3ac>
     396: 48 8b 5d d0                  	movq	-0x30(%rbp), %rbx
     39a: 80 fb 02                     	cmpb	$0x2, %bl
     39d: 74 44                        	je	0x3e3 <toyos_fd_dup2+0x3e3>
     39f: 0f b6 c3                     	movzbl	%bl, %eax
     3a2: f7 d0                        	notl	%eax
     3a4: 83 c8 fe                     	orl	$-0x2, %eax
     3a7: 89 45 c4                     	movl	%eax, -0x3c(%rbp)
     3aa: eb 25                        	jmp	0x3d1 <toyos_fd_dup2+0x3d1>
     3ac: 45 84 ff                     	testb	%r15b, %r15b
     3af: 74 20                        	je	0x3d1 <toyos_fd_dup2+0x3d1>
     3b1: 48 8b 45 a0                  	movq	-0x60(%rbp), %rax
     3b5: 48 85 c0                     	testq	%rax, %rax
     3b8: 74 08                        	je	0x3c2 <toyos_fd_dup2+0x3c2>
     3ba: 48 8b 7d a8                  	movq	-0x58(%rbp), %rdi
     3be: ff d0                        	callq	*%rax
     3c0: eb 0f                        	jmp	0x3d1 <toyos_fd_dup2+0x3d1>
     3c2: 0f b6 45 d0                  	movzbl	-0x30(%rbp), %eax
     3c6: 48 8b 7d c8                  	movq	-0x38(%rbp), %rdi
     3ca: 09 c7                        	orl	%eax, %edi
     3cc: e8 00 00 00 00               	callq	0x3d1 <toyos_fd_dup2+0x3d1>
		00000000000003cd:  R_X86_64_PLT32	toyos::net::stream::let_go-0x4
     3d1: 8b 45 c4                     	movl	-0x3c(%rbp), %eax
     3d4: 48 83 c4 48                  	addq	$0x48, %rsp
     3d8: 5b                           	popq	%rbx
     3d9: 41 5c                        	popq	%r12
     3db: 41 5d                        	popq	%r13
     3dd: 41 5e                        	popq	%r14
     3df: 41 5f                        	popq	%r15
     3e1: 5d                           	popq	%rbp
     3e2: c3                           	retq
     3e3: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x3ea <toyos_fd_dup2+0x3ea>
		00000000000003e6:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     3ea: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x3f1 <toyos_fd_dup2+0x3f1>
		00000000000003ed:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     3f1: be 5f 00 00 00               	movl	$0x5f, %esi
     3f6: e8 00 00 00 00               	callq	0x3fb <toyos_fd_dup2+0x3fb>
		00000000000003f7:  R_X86_64_PLT32	core::panicking::panic_fmt-0x4
     3fb: eb 44                        	jmp	0x441 <toyos_fd_dup2+0x441>
     3fd: 4c 89 4d a0                  	movq	%r9, -0x60(%rbp)
     401: 4c 89 45 a8                  	movq	%r8, -0x58(%rbp)
     405: c1 e1 10                     	shll	$0x10, %ecx
     408: 09 ce                        	orl	%ecx, %esi
     40a: c1 e6 08                     	shll	$0x8, %esi
     40d: 48 89 75 c8                  	movq	%rsi, -0x38(%rbp)
     411: 41 b7 01                     	movb	$0x1, %r15b
     414: 31 db                        	xorl	%ebx, %ebx
     416: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
     41a: 31 c0                        	xorl	%eax, %eax
     41c: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x422 <toyos_fd_dup2+0x422>
		000000000000041e:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     422: 83 f8 02                     	cmpl	$0x2, %eax
     425: 0f 85 32 ff ff ff            	jne	0x35d <toyos_fd_dup2+0x35d>
     42b: e9 1c ff ff ff               	jmp	0x34c <toyos_fd_dup2+0x34c>
     430: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x437 <toyos_fd_dup2+0x437>
		0000000000000433:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     437: be 00 10 00 00               	movl	$0x1000, %esi           # imm = 0x1000
     43c: e8 00 00 00 00               	callq	0x441 <toyos_fd_dup2+0x441>
		000000000000043d:  R_X86_64_PLT32	core::panicking::panic_bounds_check-0x4
     441: 0f 0b                        	ud2
     443: 31 c0                        	xorl	%eax, %eax
     445: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x44b <toyos_fd_dup2+0x44b>
		0000000000000447:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     44b: 83 f8 02                     	cmpl	$0x2, %eax
     44e: 75 22                        	jne	0x472 <toyos_fd_dup2+0x472>
     450: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x457 <toyos_fd_dup2+0x457>
		0000000000000453:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     457: be 01 00 00 00               	movl	$0x1, %esi
     45c: e8 00 00 00 00               	callq	0x461 <toyos_fd_dup2+0x461>
		000000000000045d:  R_X86_64_PLT32	toyos_abi::syscall::futex_wake-0x4
     461: eb 0f                        	jmp	0x472 <toyos_fd_dup2+0x472>
     463: e8 00 00 00 00               	callq	0x468 <toyos_fd_dup2+0x468>
		0000000000000464:  R_X86_64_PLT32	core::panicking::panic_in_cleanup-0x4
     468: e8 00 00 00 00               	callq	0x46d <toyos_fd_dup2+0x46d>
		0000000000000469:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     46d: e8 00 00 00 00               	callq	0x472 <toyos_fd_dup2+0x472>
		000000000000046e:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     472: e8 00 00 00 00               	callq	0x477 <toyos_fd_dup2+0x477>
		0000000000000473:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
