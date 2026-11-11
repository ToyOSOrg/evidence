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
      28: 0f 84 f0 00 00 00            	je	0x11e <toyos_fd_replace+0x11e>
      2e: ba 64 00 00 00               	movl	$0x64, %edx
      33: eb 26                        	jmp	0x5b <toyos_fd_replace+0x5b>
      35: 66 66 2e 0f 1f 84 00 00 00 00 00     	nopw	%cs:(%rax,%rax)
      40: 31 c0                        	xorl	%eax, %eax
      42: f0                           	lock
      43: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x4a <toyos_fd_replace+0x4a>
		0000000000000046:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      4a: 0f 84 ce 00 00 00            	je	0x11e <toyos_fd_replace+0x11e>
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
      7a: 0f 84 9e 00 00 00            	je	0x11e <toyos_fd_replace+0x11e>
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
      aa: 74 72                        	je	0x11e <toyos_fd_replace+0x11e>
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
      ca: 74 52                        	je	0x11e <toyos_fd_replace+0x11e>
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
      f2: 74 2a                        	je	0x11e <toyos_fd_replace+0x11e>
      f4: 48 8d 1d 00 00 00 00         	leaq	(%rip), %rbx            # 0xfb <toyos_fd_replace+0xfb>
		00000000000000f7:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      fb: 0f 1f 44 00 00               	nopl	(%rax,%rax)
     100: 48 89 df                     	movq	%rbx, %rdi
     103: be 02 00 00 00               	movl	$0x2, %esi
     108: 31 d2                        	xorl	%edx, %edx
     10a: e8 00 00 00 00               	callq	0x10f <toyos_fd_replace+0x10f>
		000000000000010b:  R_X86_64_PLT32	toyos_abi::syscall::futex_wait-0x4
     10f: b8 02 00 00 00               	movl	$0x2, %eax
     114: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x11a <toyos_fd_replace+0x11a>
		0000000000000116:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     11a: 85 c0                        	testl	%eax, %eax
     11c: 75 e2                        	jne	0x100 <toyos_fd_replace+0x100>
     11e: 4c 8d 65 10                  	leaq	0x10(%rbp), %r12
     122: 4c 8d 3d 00 00 00 00         	leaq	(%rip), %r15            # 0x129 <toyos_fd_replace+0x129>
		0000000000000125:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner5TABLE-0x4
     129: 4c 89 7d a0                  	movq	%r15, -0x60(%rbp)
     12d: 0f b6 05 00 00 00 00         	movzbl	(%rip), %eax            # 0x134 <toyos_fd_replace+0x134>
		0000000000000130:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x4
     134: 31 db                        	xorl	%ebx, %ebx
     136: 84 c0                        	testb	%al, %al
     138: 74 17                        	je	0x151 <toyos_fd_replace+0x151>
     13a: 45 31 ed                     	xorl	%r13d, %r13d
     13d: b0 01                        	movb	$0x1, %al
     13f: 48 89 45 c8                  	movq	%rax, -0x38(%rbp)
     143: 41 81 fe ff 0f 00 00         	cmpl	$0xfff, %r14d           # imm = 0xFFF
     14a: 76 65                        	jbe	0x1b1 <toyos_fd_replace+0x1b1>
     14c: e9 9e 00 00 00               	jmp	0x1ef <toyos_fd_replace+0x1ef>
     151: 48 8d 7d b8                  	leaq	-0x48(%rbp), %rdi
     155: 48 8d 75 a0                  	leaq	-0x60(%rbp), %rsi
     159: e8 00 00 00 00               	callq	0x15e <toyos_fd_replace+0x15e>
		000000000000015a:  R_X86_64_PLT32	.text._RNvNtNtCsX_5toyos2fd5owner5endow-0x4
     15e: 80 7d b8 00                  	cmpb	$0x0, -0x48(%rbp)
     162: 74 33                        	je	0x197 <toyos_fd_replace+0x197>
     164: 0f b6 45 b9                  	movzbl	-0x47(%rbp), %eax
     168: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
     16c: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x173 <toyos_fd_replace+0x173>
		000000000000016e:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     173: b0 01                        	movb	$0x1, %al
     175: 48 89 45 c8                  	movq	%rax, -0x38(%rbp)
     179: 31 db                        	xorl	%ebx, %ebx
     17b: 45 31 f6                     	xorl	%r14d, %r14d
     17e: 45 31 ed                     	xorl	%r13d, %r13d
     181: 31 c0                        	xorl	%eax, %eax
     183: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x189 <toyos_fd_replace+0x189>
		0000000000000185:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     189: 83 f8 02                     	cmpl	$0x2, %eax
     18c: 0f 85 96 01 00 00            	jne	0x328 <toyos_fd_replace+0x328>
     192: e9 80 01 00 00               	jmp	0x317 <toyos_fd_replace+0x317>
     197: 4c 8b 6d c0                  	movq	-0x40(%rbp), %r13
     19b: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x1a2 <toyos_fd_replace+0x1a2>
		000000000000019d:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     1a2: b0 01                        	movb	$0x1, %al
     1a4: 48 89 45 c8                  	movq	%rax, -0x38(%rbp)
     1a8: 41 81 fe ff 0f 00 00         	cmpl	$0xfff, %r14d           # imm = 0xFFF
     1af: 77 3e                        	ja	0x1ef <toyos_fd_replace+0x1ef>
     1b1: 44 89 f0                     	movl	%r14d, %eax
     1b4: 41 8b 8c 87 00 00 04 00      	movl	0x40000(%r15,%rax,4), %ecx
     1bc: 31 db                        	xorl	%ebx, %ebx
     1be: 85 c9                        	testl	%ecx, %ecx
     1c0: 74 2d                        	je	0x1ef <toyos_fd_replace+0x1ef>
     1c2: 89 cf                        	movl	%ecx, %edi
     1c4: 81 e7 ff ff ff 7f            	andl	$0x7fffffff, %edi       # imm = 0x7FFFFFFF
     1ca: 74 30                        	je	0x1fc <toyos_fd_replace+0x1fc>
     1cc: 89 fe                        	movl	%edi, %esi
     1ce: 48 ff cf                     	decq	%rdi
     1d1: 31 d2                        	xorl	%edx, %edx
     1d3: 81 fe 01 10 00 00            	cmpl	$0x1001, %esi           # imm = 0x1001
     1d9: 0f 92 c2                     	setb	%dl
     1dc: 40 b6 02                     	movb	$0x2, %sil
     1df: 48 89 75 d0                  	movq	%rsi, -0x30(%rbp)
     1e3: 48 83 fa 01                  	cmpq	$0x1, %rdx
     1e7: 0f 85 1a 01 00 00            	jne	0x307 <toyos_fd_replace+0x307>
     1ed: eb 20                        	jmp	0x20f <toyos_fd_replace+0x20f>
     1ef: 48 c7 45 d0 00 00 00 00      	movq	$0x0, -0x30(%rbp)
     1f7: e9 0b 01 00 00               	jmp	0x307 <toyos_fd_replace+0x307>
     1fc: 31 d2                        	xorl	%edx, %edx
     1fe: 40 b6 02                     	movb	$0x2, %sil
     201: 48 89 75 d0                  	movq	%rsi, -0x30(%rbp)
     205: 48 83 fa 01                  	cmpq	$0x1, %rdx
     209: 0f 85 f8 00 00 00            	jne	0x307 <toyos_fd_replace+0x307>
     20f: 48 81 ff ff 0f 00 00         	cmpq	$0xfff, %rdi            # imm = 0xFFF
     216: 0f 87 17 02 00 00            	ja	0x433 <toyos_fd_replace+0x433>
     21c: 48 c1 e7 06                  	shlq	$0x6, %rdi
     220: 42 8b 54 3f 18               	movl	0x18(%rdi,%r15), %edx
     225: 85 d2                        	testl	%edx, %edx
     227: 0f 84 d8 00 00 00            	je	0x305 <toyos_fd_replace+0x305>
     22d: 4c 01 ff                     	addq	%r15, %rdi
     230: 31 d2                        	xorl	%edx, %edx
     232: 31 f6                        	xorl	%esi, %esi
     234: 66 66 66 2e 0f 1f 84 00 00 00 00 00  	nopw	%cs:(%rax,%rax)
     240: 46 8b 44 3e 18               	movl	0x18(%rsi,%r15), %r8d
     245: 45 85 c0                     	testl	%r8d, %r8d
     248: 74 57                        	je	0x2a1 <toyos_fd_replace+0x2a1>
     24a: 46 8b 44 3e 58               	movl	0x58(%rsi,%r15), %r8d
     24f: 45 85 c0                     	testl	%r8d, %r8d
     252: 74 3e                        	je	0x292 <toyos_fd_replace+0x292>
     254: 46 8b 84 3e 98 00 00 00      	movl	0x98(%rsi,%r15), %r8d
     25c: 45 85 c0                     	testl	%r8d, %r8d
     25f: 74 36                        	je	0x297 <toyos_fd_replace+0x297>
     261: 46 8b 84 3e d8 00 00 00      	movl	0xd8(%rsi,%r15), %r8d
     269: 45 85 c0                     	testl	%r8d, %r8d
     26c: 74 2f                        	je	0x29d <toyos_fd_replace+0x29d>
     26e: 48 81 c6 00 01 00 00         	addq	$0x100, %rsi            # imm = 0x100
     275: 48 83 c2 04                  	addq	$0x4, %rdx
     279: 31 db                        	xorl	%ebx, %ebx
     27b: 48 81 fe 00 00 04 00         	cmpq	$0x40000, %rsi          # imm = 0x40000
     282: 75 bc                        	jne	0x240 <toyos_fd_replace+0x240>
     284: b0 01                        	movb	$0x1, %al
     286: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
     28a: b0 01                        	movb	$0x1, %al
     28c: 48 89 45 c8                  	movq	%rax, -0x38(%rbp)
     290: eb 75                        	jmp	0x307 <toyos_fd_replace+0x307>
     292: 48 ff c2                     	incq	%rdx
     295: eb 0a                        	jmp	0x2a1 <toyos_fd_replace+0x2a1>
     297: 48 83 c2 02                  	addq	$0x2, %rdx
     29b: eb 04                        	jmp	0x2a1 <toyos_fd_replace+0x2a1>
     29d: 48 83 c2 03                  	addq	$0x3, %rdx
     2a1: 48 89 d6                     	movq	%rdx, %rsi
     2a4: 48 c1 e6 06                  	shlq	$0x6, %rsi
     2a8: 4d 8b 44 24 10               	movq	0x10(%r12), %r8
     2ad: 4e 89 44 3e 10               	movq	%r8, 0x10(%rsi,%r15)
     2b2: 41 0f 10 04 24               	movups	(%r12), %xmm0
     2b7: 42 0f 11 04 3e               	movups	%xmm0, (%rsi,%r15)
     2bc: 42 c7 44 3e 18 01 00 00 00   	movl	$0x1, 0x18(%rsi,%r15)
     2c5: 81 e1 00 00 00 80            	andl	$0x80000000, %ecx       # imm = 0x80000000
     2cb: 01 d1                        	addl	%edx, %ecx
     2cd: ff c1                        	incl	%ecx
     2cf: 41 89 8c 87 00 00 04 00      	movl	%ecx, 0x40000(%r15,%rax,4)
     2d7: 0f b6 07                     	movzbl	(%rdi), %eax
     2da: 0f b7 5f 01                  	movzwl	0x1(%rdi), %ebx
     2de: 0f b6 4f 03                  	movzbl	0x3(%rdi), %ecx
     2e2: 48 8b 77 08                  	movq	0x8(%rdi), %rsi
     2e6: 4c 8b 47 10                  	movq	0x10(%rdi), %r8
     2ea: ba ff ff ff ff               	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
     2ef: f0                           	lock
     2f0: 0f c1 57 18                  	xaddl	%edx, 0x18(%rdi)
     2f4: 83 fa 01                     	cmpl	$0x1, %edx
     2f7: 0f 84 d4 00 00 00            	je	0x3d1 <toyos_fd_replace+0x3d1>
     2fd: 85 d2                        	testl	%edx, %edx
     2ff: 0f 85 01 01 00 00            	jne	0x406 <toyos_fd_replace+0x406>
     305: 31 db                        	xorl	%ebx, %ebx
     307: 45 31 f6                     	xorl	%r14d, %r14d
     30a: 31 c0                        	xorl	%eax, %eax
     30c: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x312 <toyos_fd_replace+0x312>
		000000000000030e:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     312: 83 f8 02                     	cmpl	$0x2, %eax
     315: 75 11                        	jne	0x328 <toyos_fd_replace+0x328>
     317: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x31e <toyos_fd_replace+0x31e>
		000000000000031a:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     31e: be 01 00 00 00               	movl	$0x1, %esi
     323: e8 00 00 00 00               	callq	0x328 <toyos_fd_replace+0x328>
		0000000000000324:  R_X86_64_PLT32	toyos_abi::syscall::futex_wake-0x4
     328: 4d 85 ed                     	testq	%r13, %r13
     32b: 74 35                        	je	0x362 <toyos_fd_replace+0x362>
     32d: 4c 8d 3d 00 00 00 00         	leaq	(%rip), %r15            # 0x334 <toyos_fd_replace+0x334>
		0000000000000330:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     334: 4c 8d 65 b8                  	leaq	-0x48(%rbp), %r12
     338: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
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
     362: 80 7d c8 00                  	cmpb	$0x0, -0x38(%rbp)
     366: 74 1f                        	je	0x387 <toyos_fd_replace+0x387>
     368: 80 7d d0 02                  	cmpb	$0x2, -0x30(%rbp)
     36c: 0f 84 a7 00 00 00            	je	0x419 <toyos_fd_replace+0x419>
     372: 48 8d 4d 10                  	leaq	0x10(%rbp), %rcx
     376: 48 8b 41 10                  	movq	0x10(%rcx), %rax
     37a: 48 85 c0                     	testq	%rax, %rax
     37d: 74 22                        	je	0x3a1 <toyos_fd_replace+0x3a1>
     37f: 48 8b 79 08                  	movq	0x8(%rcx), %rdi
     383: ff d0                        	callq	*%rax
     385: eb 21                        	jmp	0x3a8 <toyos_fd_replace+0x3a8>
     387: 31 c0                        	xorl	%eax, %eax
     389: 45 84 f6                     	testb	%r14b, %r14b
     38c: 74 23                        	je	0x3b1 <toyos_fd_replace+0x3b1>
     38e: 48 8b 45 a8                  	movq	-0x58(%rbp), %rax
     392: 48 85 c0                     	testq	%rax, %rax
     395: 74 29                        	je	0x3c0 <toyos_fd_replace+0x3c0>
     397: 48 8b 7d b0                  	movq	-0x50(%rbp), %rdi
     39b: ff d0                        	callq	*%rax
     39d: 31 c0                        	xorl	%eax, %eax
     39f: eb 10                        	jmp	0x3b1 <toyos_fd_replace+0x3b1>
     3a1: 8b 39                        	movl	(%rcx), %edi
     3a3: e8 00 00 00 00               	callq	0x3a8 <toyos_fd_replace+0x3a8>
		00000000000003a4:  R_X86_64_PLT32	toyos::net::stream::let_go-0x4
     3a8: 0f b6 45 d0                  	movzbl	-0x30(%rbp), %eax
     3ac: f7 d0                        	notl	%eax
     3ae: 83 c8 fe                     	orl	$-0x2, %eax
     3b1: 48 83 c4 38                  	addq	$0x38, %rsp
     3b5: 5b                           	popq	%rbx
     3b6: 41 5c                        	popq	%r12
     3b8: 41 5d                        	popq	%r13
     3ba: 41 5e                        	popq	%r14
     3bc: 41 5f                        	popq	%r15
     3be: 5d                           	popq	%rbp
     3bf: c3                           	retq
     3c0: 0f b6 45 d0                  	movzbl	-0x30(%rbp), %eax
     3c4: 09 c3                        	orl	%eax, %ebx
     3c6: 89 df                        	movl	%ebx, %edi
     3c8: e8 00 00 00 00               	callq	0x3cd <toyos_fd_replace+0x3cd>
		00000000000003c9:  R_X86_64_PLT32	toyos::net::stream::let_go-0x4
     3cd: 31 c0                        	xorl	%eax, %eax
     3cf: eb e0                        	jmp	0x3b1 <toyos_fd_replace+0x3b1>
     3d1: 4c 89 45 a8                  	movq	%r8, -0x58(%rbp)
     3d5: 48 89 75 b0                  	movq	%rsi, -0x50(%rbp)
     3d9: c1 e1 10                     	shll	$0x10, %ecx
     3dc: 09 cb                        	orl	%ecx, %ebx
     3de: c1 e3 08                     	shll	$0x8, %ebx
     3e1: 41 b6 01                     	movb	$0x1, %r14b
     3e4: 48 c7 45 c8 00 00 00 00      	movq	$0x0, -0x38(%rbp)
     3ec: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
     3f0: 31 c0                        	xorl	%eax, %eax
     3f2: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x3f8 <toyos_fd_replace+0x3f8>
		00000000000003f4:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     3f8: 83 f8 02                     	cmpl	$0x2, %eax
     3fb: 0f 85 27 ff ff ff            	jne	0x328 <toyos_fd_replace+0x328>
     401: e9 11 ff ff ff               	jmp	0x317 <toyos_fd_replace+0x317>
     406: 31 db                        	xorl	%ebx, %ebx
     408: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
     40c: 48 c7 45 c8 00 00 00 00      	movq	$0x0, -0x38(%rbp)
     414: e9 ee fe ff ff               	jmp	0x307 <toyos_fd_replace+0x307>
     419: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x420 <toyos_fd_replace+0x420>
		000000000000041c:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     420: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x427 <toyos_fd_replace+0x427>
		0000000000000423:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     427: be 5f 00 00 00               	movl	$0x5f, %esi
     42c: e8 00 00 00 00               	callq	0x431 <toyos_fd_replace+0x431>
		000000000000042d:  R_X86_64_PLT32	core::panicking::panic_fmt-0x4
     431: eb 11                        	jmp	0x444 <toyos_fd_replace+0x444>
     433: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x43a <toyos_fd_replace+0x43a>
		0000000000000436:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     43a: be 00 10 00 00               	movl	$0x1000, %esi           # imm = 0x1000
     43f: e8 00 00 00 00               	callq	0x444 <toyos_fd_replace+0x444>
		0000000000000440:  R_X86_64_PLT32	core::panicking::panic_bounds_check-0x4
     444: 0f 0b                        	ud2
     446: 31 c0                        	xorl	%eax, %eax
     448: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x44e <toyos_fd_replace+0x44e>
		000000000000044a:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     44e: 83 f8 02                     	cmpl	$0x2, %eax
     451: 75 22                        	jne	0x475 <toyos_fd_replace+0x475>
     453: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x45a <toyos_fd_replace+0x45a>
		0000000000000456:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     45a: be 01 00 00 00               	movl	$0x1, %esi
     45f: e8 00 00 00 00               	callq	0x464 <toyos_fd_replace+0x464>
		0000000000000460:  R_X86_64_PLT32	toyos_abi::syscall::futex_wake-0x4
     464: eb 0f                        	jmp	0x475 <toyos_fd_replace+0x475>
     466: e8 00 00 00 00               	callq	0x46b <toyos_fd_replace+0x46b>
		0000000000000467:  R_X86_64_PLT32	core::panicking::panic_in_cleanup-0x4
     46b: e8 00 00 00 00               	callq	0x470 <toyos_fd_replace+0x470>
		000000000000046c:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     470: e8 00 00 00 00               	callq	0x475 <toyos_fd_replace+0x475>
		0000000000000471:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     475: e8 00 00 00 00               	callq	0x47a <toyos_fd_replace+0x47a>
		0000000000000476:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
