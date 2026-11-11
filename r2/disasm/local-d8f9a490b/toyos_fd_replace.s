Disassembly of section .text.toyos_fd_replace:

0000000000000000 <toyos_fd_replace>:
       0: 55                           	pushq	%rbp
       1: 48 89 e5                     	movq	%rsp, %rbp
       4: 41 57                        	pushq	%r15
       6: 41 56                        	pushq	%r14
       8: 41 55                        	pushq	%r13
       a: 41 54                        	pushq	%r12
       c: 53                           	pushq	%rbx
       d: 48 83 ec 38                  	subq	$0x38, %rsp
      11: 41 89 fe                     	movl	%edi, %r14d
      14: e8 00 00 00 00               	callq	0x19 <toyos_fd_replace+0x19>
		0000000000000015:  R_X86_64_PLT32	<toyos::endow::Endowments>::get-0x4
      19: b9 01 00 00 00               	movl	$0x1, %ecx
      1e: 31 c0                        	xorl	%eax, %eax
      20: f0                           	lock
      21: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x28 <toyos_fd_replace+0x28>
		0000000000000024:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      28: 0f 84 f6 00 00 00            	je	0x124 <toyos_fd_replace+0x124>
      2e: ba 64 00 00 00               	movl	$0x64, %edx
      33: eb 26                        	jmp	0x5b <toyos_fd_replace+0x5b>
      35: 66 66 2e 0f 1f 84 00 00 00 00 00     	nopw	%cs:(%rax,%rax)
      40: 31 c0                        	xorl	%eax, %eax
      42: f0                           	lock
      43: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x4a <toyos_fd_replace+0x4a>
		0000000000000046:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      4a: 0f 84 d4 00 00 00            	je	0x124 <toyos_fd_replace+0x124>
      50: f3 90                        	pause
      52: 83 c2 fc                     	addl	$-0x4, %edx
      55: 0f 84 8a 00 00 00            	je	0xe5 <toyos_fd_replace+0xe5>
      5b: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0x61 <toyos_fd_replace+0x61>
		000000000000005d:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      61: 85 c0                        	testl	%eax, %eax
      63: 74 0b                        	je	0x70 <toyos_fd_replace+0x70>
      65: 83 f8 02                     	cmpl	$0x2, %eax
      68: 75 16                        	jne	0x80 <toyos_fd_replace+0x80>
      6a: eb 79                        	jmp	0xe5 <toyos_fd_replace+0xe5>
      6c: 0f 1f 40 00                  	nopl	(%rax)
      70: 31 c0                        	xorl	%eax, %eax
      72: f0                           	lock
      73: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x7a <toyos_fd_replace+0x7a>
		0000000000000076:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      7a: 0f 84 a4 00 00 00            	je	0x124 <toyos_fd_replace+0x124>
      80: f3 90                        	pause
      82: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0x88 <toyos_fd_replace+0x88>
		0000000000000084:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      88: 85 c0                        	testl	%eax, %eax
      8a: 74 14                        	je	0xa0 <toyos_fd_replace+0xa0>
      8c: 83 f8 02                     	cmpl	$0x2, %eax
      8f: 75 1b                        	jne	0xac <toyos_fd_replace+0xac>
      91: eb 52                        	jmp	0xe5 <toyos_fd_replace+0xe5>
      93: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
      a0: 31 c0                        	xorl	%eax, %eax
      a2: f0                           	lock
      a3: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0xaa <toyos_fd_replace+0xaa>
		00000000000000a6:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      aa: 74 78                        	je	0x124 <toyos_fd_replace+0x124>
      ac: f3 90                        	pause
      ae: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0xb4 <toyos_fd_replace+0xb4>
		00000000000000b0:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      b4: 85 c0                        	testl	%eax, %eax
      b6: 74 08                        	je	0xc0 <toyos_fd_replace+0xc0>
      b8: 83 f8 02                     	cmpl	$0x2, %eax
      bb: 75 0f                        	jne	0xcc <toyos_fd_replace+0xcc>
      bd: eb 26                        	jmp	0xe5 <toyos_fd_replace+0xe5>
      bf: 90                           	nop
      c0: 31 c0                        	xorl	%eax, %eax
      c2: f0                           	lock
      c3: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0xca <toyos_fd_replace+0xca>
		00000000000000c6:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      ca: 74 58                        	je	0x124 <toyos_fd_replace+0x124>
      cc: f3 90                        	pause
      ce: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0xd4 <toyos_fd_replace+0xd4>
		00000000000000d0:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      d4: 85 c0                        	testl	%eax, %eax
      d6: 0f 84 64 ff ff ff            	je	0x40 <toyos_fd_replace+0x40>
      dc: 83 f8 02                     	cmpl	$0x2, %eax
      df: 0f 85 6b ff ff ff            	jne	0x50 <toyos_fd_replace+0x50>
      e5: b8 02 00 00 00               	movl	$0x2, %eax
      ea: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0xf0 <toyos_fd_replace+0xf0>
		00000000000000ec:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      f0: 85 c0                        	testl	%eax, %eax
      f2: 74 30                        	je	0x124 <toyos_fd_replace+0x124>
      f4: 48 8d 35 00 00 00 00         	leaq	(%rip), %rsi            # 0xfb <toyos_fd_replace+0xfb>
		00000000000000f7:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      fb: bf 3a 00 00 00               	movl	$0x3a, %edi
     100: ba 02 00 00 00               	movl	$0x2, %edx
     105: 49 c7 c0 ff ff ff ff         	movq	$-0x1, %r8
     10c: 0f 1f 40 00                  	nopl	(%rax)
     110: 45 31 c9                     	xorl	%r9d, %r9d
     113: 0f 05                        	syscall
     115: b8 02 00 00 00               	movl	$0x2, %eax
     11a: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x120 <toyos_fd_replace+0x120>
		000000000000011c:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     120: 85 c0                        	testl	%eax, %eax
     122: 75 ec                        	jne	0x110 <toyos_fd_replace+0x110>
     124: 4c 8d 65 10                  	leaq	0x10(%rbp), %r12
     128: 4c 8d 3d 00 00 00 00         	leaq	(%rip), %r15            # 0x12f <toyos_fd_replace+0x12f>
		000000000000012b:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner5TABLE-0x4
     12f: 4c 89 7d a0                  	movq	%r15, -0x60(%rbp)
     133: 0f b6 05 00 00 00 00         	movzbl	(%rip), %eax            # 0x13a <toyos_fd_replace+0x13a>
		0000000000000136:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x4
     13a: 31 db                        	xorl	%ebx, %ebx
     13c: 84 c0                        	testb	%al, %al
     13e: 74 14                        	je	0x154 <toyos_fd_replace+0x154>
     140: 45 31 ed                     	xorl	%r13d, %r13d
     143: 41 b1 01                     	movb	$0x1, %r9b
     146: 41 81 fe ff 0f 00 00         	cmpl	$0xfff, %r14d           # imm = 0xFFF
     14d: 76 53                        	jbe	0x1a2 <toyos_fd_replace+0x1a2>
     14f: e9 8c 00 00 00               	jmp	0x1e0 <toyos_fd_replace+0x1e0>
     154: 48 8d 7d b8                  	leaq	-0x48(%rbp), %rdi
     158: 48 8d 75 a0                  	leaq	-0x60(%rbp), %rsi
     15c: e8 00 00 00 00               	callq	0x161 <toyos_fd_replace+0x161>
		000000000000015d:  R_X86_64_PLT32	.text._RNvNtNtCsX_5toyos2fd5owner5endow-0x4
     161: 80 7d b8 00                  	cmpb	$0x0, -0x48(%rbp)
     165: 74 24                        	je	0x18b <toyos_fd_replace+0x18b>
     167: 0f b6 45 b9                  	movzbl	-0x47(%rbp), %eax
     16b: 48 89 45 c8                  	movq	%rax, -0x38(%rbp)
     16f: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x176 <toyos_fd_replace+0x176>
		0000000000000171:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     176: 41 b1 01                     	movb	$0x1, %r9b
     179: 31 db                        	xorl	%ebx, %ebx
     17b: 48 c7 45 d0 00 00 00 00      	movq	$0x0, -0x30(%rbp)
     183: 45 31 ed                     	xorl	%r13d, %r13d
     186: e9 71 01 00 00               	jmp	0x2fc <toyos_fd_replace+0x2fc>
     18b: 4c 8b 6d c0                  	movq	-0x40(%rbp), %r13
     18f: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x196 <toyos_fd_replace+0x196>
		0000000000000191:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     196: 41 b1 01                     	movb	$0x1, %r9b
     199: 41 81 fe ff 0f 00 00         	cmpl	$0xfff, %r14d           # imm = 0xFFF
     1a0: 77 3e                        	ja	0x1e0 <toyos_fd_replace+0x1e0>
     1a2: 44 89 f0                     	movl	%r14d, %eax
     1a5: 41 8b 8c 87 00 00 04 00      	movl	0x40000(%r15,%rax,4), %ecx
     1ad: 31 db                        	xorl	%ebx, %ebx
     1af: 85 c9                        	testl	%ecx, %ecx
     1b1: 74 2d                        	je	0x1e0 <toyos_fd_replace+0x1e0>
     1b3: 89 cf                        	movl	%ecx, %edi
     1b5: 81 e7 ff ff ff 7f            	andl	$0x7fffffff, %edi       # imm = 0x7FFFFFFF
     1bb: 74 30                        	je	0x1ed <toyos_fd_replace+0x1ed>
     1bd: 89 fe                        	movl	%edi, %esi
     1bf: 48 ff cf                     	decq	%rdi
     1c2: 31 d2                        	xorl	%edx, %edx
     1c4: 81 fe 01 10 00 00            	cmpl	$0x1001, %esi           # imm = 0x1001
     1ca: 0f 92 c2                     	setb	%dl
     1cd: 40 b6 02                     	movb	$0x2, %sil
     1d0: 48 89 75 c8                  	movq	%rsi, -0x38(%rbp)
     1d4: 48 83 fa 01                  	cmpq	$0x1, %rdx
     1d8: 0f 85 16 01 00 00            	jne	0x2f4 <toyos_fd_replace+0x2f4>
     1de: eb 20                        	jmp	0x200 <toyos_fd_replace+0x200>
     1e0: 48 c7 45 c8 00 00 00 00      	movq	$0x0, -0x38(%rbp)
     1e8: e9 07 01 00 00               	jmp	0x2f4 <toyos_fd_replace+0x2f4>
     1ed: 31 d2                        	xorl	%edx, %edx
     1ef: 40 b6 02                     	movb	$0x2, %sil
     1f2: 48 89 75 c8                  	movq	%rsi, -0x38(%rbp)
     1f6: 48 83 fa 01                  	cmpq	$0x1, %rdx
     1fa: 0f 85 f4 00 00 00            	jne	0x2f4 <toyos_fd_replace+0x2f4>
     200: 48 81 ff ff 0f 00 00         	cmpq	$0xfff, %rdi            # imm = 0xFFF
     207: 0f 87 10 02 00 00            	ja	0x41d <toyos_fd_replace+0x41d>
     20d: 48 c1 e7 06                  	shlq	$0x6, %rdi
     211: 42 8b 54 3f 18               	movl	0x18(%rdi,%r15), %edx
     216: 85 d2                        	testl	%edx, %edx
     218: 0f 84 d4 00 00 00            	je	0x2f2 <toyos_fd_replace+0x2f2>
     21e: 4c 01 ff                     	addq	%r15, %rdi
     221: 31 d2                        	xorl	%edx, %edx
     223: 31 f6                        	xorl	%esi, %esi
     225: 66 66 2e 0f 1f 84 00 00 00 00 00     	nopw	%cs:(%rax,%rax)
     230: 46 8b 44 3e 18               	movl	0x18(%rsi,%r15), %r8d
     235: 45 85 c0                     	testl	%r8d, %r8d
     238: 74 54                        	je	0x28e <toyos_fd_replace+0x28e>
     23a: 46 8b 44 3e 58               	movl	0x58(%rsi,%r15), %r8d
     23f: 45 85 c0                     	testl	%r8d, %r8d
     242: 74 3b                        	je	0x27f <toyos_fd_replace+0x27f>
     244: 46 8b 84 3e 98 00 00 00      	movl	0x98(%rsi,%r15), %r8d
     24c: 45 85 c0                     	testl	%r8d, %r8d
     24f: 74 33                        	je	0x284 <toyos_fd_replace+0x284>
     251: 46 8b 84 3e d8 00 00 00      	movl	0xd8(%rsi,%r15), %r8d
     259: 45 85 c0                     	testl	%r8d, %r8d
     25c: 74 2c                        	je	0x28a <toyos_fd_replace+0x28a>
     25e: 48 81 c6 00 01 00 00         	addq	$0x100, %rsi            # imm = 0x100
     265: 48 83 c2 04                  	addq	$0x4, %rdx
     269: 31 db                        	xorl	%ebx, %ebx
     26b: 48 81 fe 00 00 04 00         	cmpq	$0x40000, %rsi          # imm = 0x40000
     272: 75 bc                        	jne	0x230 <toyos_fd_replace+0x230>
     274: b0 01                        	movb	$0x1, %al
     276: 48 89 45 c8                  	movq	%rax, -0x38(%rbp)
     27a: 41 b1 01                     	movb	$0x1, %r9b
     27d: eb 75                        	jmp	0x2f4 <toyos_fd_replace+0x2f4>
     27f: 48 ff c2                     	incq	%rdx
     282: eb 0a                        	jmp	0x28e <toyos_fd_replace+0x28e>
     284: 48 83 c2 02                  	addq	$0x2, %rdx
     288: eb 04                        	jmp	0x28e <toyos_fd_replace+0x28e>
     28a: 48 83 c2 03                  	addq	$0x3, %rdx
     28e: 48 89 d6                     	movq	%rdx, %rsi
     291: 48 c1 e6 06                  	shlq	$0x6, %rsi
     295: 4d 8b 44 24 10               	movq	0x10(%r12), %r8
     29a: 4e 89 44 3e 10               	movq	%r8, 0x10(%rsi,%r15)
     29f: 41 0f 10 04 24               	movups	(%r12), %xmm0
     2a4: 42 0f 11 04 3e               	movups	%xmm0, (%rsi,%r15)
     2a9: 42 c7 44 3e 18 01 00 00 00   	movl	$0x1, 0x18(%rsi,%r15)
     2b2: 81 e1 00 00 00 80            	andl	$0x80000000, %ecx       # imm = 0x80000000
     2b8: 01 d1                        	addl	%edx, %ecx
     2ba: ff c1                        	incl	%ecx
     2bc: 41 89 8c 87 00 00 04 00      	movl	%ecx, 0x40000(%r15,%rax,4)
     2c4: 0f b6 07                     	movzbl	(%rdi), %eax
     2c7: 0f b7 5f 01                  	movzwl	0x1(%rdi), %ebx
     2cb: 0f b6 4f 03                  	movzbl	0x3(%rdi), %ecx
     2cf: 48 8b 77 08                  	movq	0x8(%rdi), %rsi
     2d3: 4c 8b 47 10                  	movq	0x10(%rdi), %r8
     2d7: ba ff ff ff ff               	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
     2dc: f0                           	lock
     2dd: 0f c1 57 18                  	xaddl	%edx, 0x18(%rdi)
     2e1: 83 fa 01                     	cmpl	$0x1, %edx
     2e4: 0f 84 e9 00 00 00            	je	0x3d3 <toyos_fd_replace+0x3d3>
     2ea: 85 d2                        	testl	%edx, %edx
     2ec: 0f 85 03 01 00 00            	jne	0x3f5 <toyos_fd_replace+0x3f5>
     2f2: 31 db                        	xorl	%ebx, %ebx
     2f4: 48 c7 45 d0 00 00 00 00      	movq	$0x0, -0x30(%rbp)
     2fc: 4d 89 ce                     	movq	%r9, %r14
     2ff: 31 c0                        	xorl	%eax, %eax
     301: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x307 <toyos_fd_replace+0x307>
		0000000000000303:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     307: 83 f8 02                     	cmpl	$0x2, %eax
     30a: 75 19                        	jne	0x325 <toyos_fd_replace+0x325>
     30c: 48 8d 35 00 00 00 00         	leaq	(%rip), %rsi            # 0x313 <toyos_fd_replace+0x313>
		000000000000030f:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     313: bf 3b 00 00 00               	movl	$0x3b, %edi
     318: ba 01 00 00 00               	movl	$0x1, %edx
     31d: 45 31 c0                     	xorl	%r8d, %r8d
     320: 45 31 c9                     	xorl	%r9d, %r9d
     323: 0f 05                        	syscall
     325: 4d 85 ed                     	testq	%r13, %r13
     328: 74 38                        	je	0x362 <toyos_fd_replace+0x362>
     32a: 4c 8d 3d 00 00 00 00         	leaq	(%rip), %r15            # 0x331 <toyos_fd_replace+0x331>
		000000000000032d:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     331: 4c 8d 65 b8                  	leaq	-0x48(%rbp), %r12
     335: 66 66 2e 0f 1f 84 00 00 00 00 00     	nopw	%cs:(%rax,%rax)
     340: ba 3f 00 00 00               	movl	$0x3f, %edx
     345: bf 02 00 00 00               	movl	$0x2, %edi
     34a: 4c 89 fe                     	movq	%r15, %rsi
     34d: e8 00 00 00 00               	callq	0x352 <toyos_fd_replace+0x352>
		000000000000034e:  R_X86_64_PLT32	toyos_fs_write-0x4
     352: 4c 89 e7                     	movq	%r12, %rdi
     355: 48 89 c6                     	movq	%rax, %rsi
     358: e8 00 00 00 00               	callq	0x35d <toyos_fd_replace+0x35d>
		0000000000000359:  R_X86_64_PLT32	.text._RNvNtCsX_5toyos5files6decode-0x4
     35d: 49 ff cd                     	decq	%r13
     360: 75 de                        	jne	0x340 <toyos_fd_replace+0x340>
     362: 45 84 f6                     	testb	%r14b, %r14b
     365: 74 22                        	je	0x389 <toyos_fd_replace+0x389>
     367: 48 8b 5d c8                  	movq	-0x38(%rbp), %rbx
     36b: 80 fb 02                     	cmpb	$0x2, %bl
     36e: 0f 84 8f 00 00 00            	je	0x403 <toyos_fd_replace+0x403>
     374: 48 8d 4d 10                  	leaq	0x10(%rbp), %rcx
     378: 48 8b 41 10                  	movq	0x10(%rcx), %rax
     37c: 48 85 c0                     	testq	%rax, %rax
     37f: 74 23                        	je	0x3a4 <toyos_fd_replace+0x3a4>
     381: 48 8b 79 08                  	movq	0x8(%rcx), %rdi
     385: ff d0                        	callq	*%rax
     387: eb 22                        	jmp	0x3ab <toyos_fd_replace+0x3ab>
     389: 31 c0                        	xorl	%eax, %eax
     38b: 80 7d d0 00                  	cmpb	$0x0, -0x30(%rbp)
     38f: 74 22                        	je	0x3b3 <toyos_fd_replace+0x3b3>
     391: 48 8b 45 a8                  	movq	-0x58(%rbp), %rax
     395: 48 85 c0                     	testq	%rax, %rax
     398: 74 28                        	je	0x3c2 <toyos_fd_replace+0x3c2>
     39a: 48 8b 7d b0                  	movq	-0x50(%rbp), %rdi
     39e: ff d0                        	callq	*%rax
     3a0: 31 c0                        	xorl	%eax, %eax
     3a2: eb 0f                        	jmp	0x3b3 <toyos_fd_replace+0x3b3>
     3a4: 8b 39                        	movl	(%rcx), %edi
     3a6: e8 00 00 00 00               	callq	0x3ab <toyos_fd_replace+0x3ab>
		00000000000003a7:  R_X86_64_PLT32	toyos::net::stream::let_go-0x4
     3ab: 0f b6 c3                     	movzbl	%bl, %eax
     3ae: f7 d0                        	notl	%eax
     3b0: 83 c8 fe                     	orl	$-0x2, %eax
     3b3: 48 83 c4 38                  	addq	$0x38, %rsp
     3b7: 5b                           	popq	%rbx
     3b8: 41 5c                        	popq	%r12
     3ba: 41 5d                        	popq	%r13
     3bc: 41 5e                        	popq	%r14
     3be: 41 5f                        	popq	%r15
     3c0: 5d                           	popq	%rbp
     3c1: c3                           	retq
     3c2: 0f b6 45 c8                  	movzbl	-0x38(%rbp), %eax
     3c6: 09 c3                        	orl	%eax, %ebx
     3c8: 89 df                        	movl	%ebx, %edi
     3ca: e8 00 00 00 00               	callq	0x3cf <toyos_fd_replace+0x3cf>
		00000000000003cb:  R_X86_64_PLT32	toyos::net::stream::let_go-0x4
     3cf: 31 c0                        	xorl	%eax, %eax
     3d1: eb e0                        	jmp	0x3b3 <toyos_fd_replace+0x3b3>
     3d3: 4c 89 45 a8                  	movq	%r8, -0x58(%rbp)
     3d7: 48 89 75 b0                  	movq	%rsi, -0x50(%rbp)
     3db: c1 e1 10                     	shll	$0x10, %ecx
     3de: 09 cb                        	orl	%ecx, %ebx
     3e0: c1 e3 08                     	shll	$0x8, %ebx
     3e3: b1 01                        	movb	$0x1, %cl
     3e5: 48 89 4d d0                  	movq	%rcx, -0x30(%rbp)
     3e9: 45 31 c9                     	xorl	%r9d, %r9d
     3ec: 48 89 45 c8                  	movq	%rax, -0x38(%rbp)
     3f0: e9 07 ff ff ff               	jmp	0x2fc <toyos_fd_replace+0x2fc>
     3f5: 31 db                        	xorl	%ebx, %ebx
     3f7: 48 89 45 c8                  	movq	%rax, -0x38(%rbp)
     3fb: 45 31 c9                     	xorl	%r9d, %r9d
     3fe: e9 f1 fe ff ff               	jmp	0x2f4 <toyos_fd_replace+0x2f4>
     403: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x40a <toyos_fd_replace+0x40a>
		0000000000000406:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     40a: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x411 <toyos_fd_replace+0x411>
		000000000000040d:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     411: be 5f 00 00 00               	movl	$0x5f, %esi
     416: e8 00 00 00 00               	callq	0x41b <toyos_fd_replace+0x41b>
		0000000000000417:  R_X86_64_PLT32	core::panicking::panic_fmt-0x4
     41b: eb 11                        	jmp	0x42e <toyos_fd_replace+0x42e>
     41d: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x424 <toyos_fd_replace+0x424>
		0000000000000420:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     424: be 00 10 00 00               	movl	$0x1000, %esi           # imm = 0x1000
     429: e8 00 00 00 00               	callq	0x42e <toyos_fd_replace+0x42e>
		000000000000042a:  R_X86_64_PLT32	core::panicking::panic_bounds_check-0x4
     42e: 0f 0b                        	ud2
     430: 31 c0                        	xorl	%eax, %eax
     432: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x438 <toyos_fd_replace+0x438>
		0000000000000434:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     438: 83 f8 02                     	cmpl	$0x2, %eax
     43b: 75 23                        	jne	0x460 <toyos_fd_replace+0x460>
     43d: 48 8d 35 00 00 00 00         	leaq	(%rip), %rsi            # 0x444 <toyos_fd_replace+0x444>
		0000000000000440:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     444: bf 3b 00 00 00               	movl	$0x3b, %edi
     449: ba 01 00 00 00               	movl	$0x1, %edx
     44e: 45 31 c0                     	xorl	%r8d, %r8d
     451: 45 31 c9                     	xorl	%r9d, %r9d
     454: 0f 05                        	syscall
     456: e8 00 00 00 00               	callq	0x45b <toyos_fd_replace+0x45b>
		0000000000000457:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     45b: e8 00 00 00 00               	callq	0x460 <toyos_fd_replace+0x460>
		000000000000045c:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     460: e8 00 00 00 00               	callq	0x465 <toyos_fd_replace+0x465>
		0000000000000461:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
