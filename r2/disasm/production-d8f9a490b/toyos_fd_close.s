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
      28: 0f 84 f0 00 00 00            	je	0x11e <toyos_fd_close+0x11e>
      2e: ba 64 00 00 00               	movl	$0x64, %edx
      33: eb 26                        	jmp	0x5b <toyos_fd_close+0x5b>
      35: 66 66 2e 0f 1f 84 00 00 00 00 00     	nopw	%cs:(%rax,%rax)
      40: 31 c0                        	xorl	%eax, %eax
      42: f0                           	lock
      43: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x4a <toyos_fd_close+0x4a>
		0000000000000046:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      4a: 0f 84 ce 00 00 00            	je	0x11e <toyos_fd_close+0x11e>
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
      7a: 0f 84 9e 00 00 00            	je	0x11e <toyos_fd_close+0x11e>
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
      aa: 74 72                        	je	0x11e <toyos_fd_close+0x11e>
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
      ca: 74 52                        	je	0x11e <toyos_fd_close+0x11e>
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
      f2: 74 2a                        	je	0x11e <toyos_fd_close+0x11e>
      f4: 48 8d 1d 00 00 00 00         	leaq	(%rip), %rbx            # 0xfb <toyos_fd_close+0xfb>
		00000000000000f7:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      fb: 0f 1f 44 00 00               	nopl	(%rax,%rax)
     100: 48 89 df                     	movq	%rbx, %rdi
     103: be 02 00 00 00               	movl	$0x2, %esi
     108: 31 d2                        	xorl	%edx, %edx
     10a: e8 00 00 00 00               	callq	0x10f <toyos_fd_close+0x10f>
		000000000000010b:  R_X86_64_PLT32	toyos_abi::syscall::futex_wait-0x4
     10f: b8 02 00 00 00               	movl	$0x2, %eax
     114: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x11a <toyos_fd_close+0x11a>
		0000000000000116:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     11a: 85 c0                        	testl	%eax, %eax
     11c: 75 e2                        	jne	0x100 <toyos_fd_close+0x100>
     11e: 48 8d 1d 00 00 00 00         	leaq	(%rip), %rbx            # 0x125 <toyos_fd_close+0x125>
		0000000000000121:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner5TABLE-0x4
     125: 48 89 5d a0                  	movq	%rbx, -0x60(%rbp)
     129: 0f b6 05 00 00 00 00         	movzbl	(%rip), %eax            # 0x130 <toyos_fd_close+0x130>
		000000000000012c:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x4
     130: 45 31 ff                     	xorl	%r15d, %r15d
     133: 84 c0                        	testb	%al, %al
     135: 74 14                        	je	0x14b <toyos_fd_close+0x14b>
     137: 45 31 ed                     	xorl	%r13d, %r13d
     13a: 40 b6 01                     	movb	$0x1, %sil
     13d: 41 81 fe ff 0f 00 00         	cmpl	$0xfff, %r14d           # imm = 0xFFF
     144: 76 4e                        	jbe	0x194 <toyos_fd_close+0x194>
     146: e9 80 00 00 00               	jmp	0x1cb <toyos_fd_close+0x1cb>
     14b: 48 8d 7d c0                  	leaq	-0x40(%rbp), %rdi
     14f: 48 8d 75 a0                  	leaq	-0x60(%rbp), %rsi
     153: e8 00 00 00 00               	callq	0x158 <toyos_fd_close+0x158>
		0000000000000154:  R_X86_64_PLT32	.text._RNvNtNtCsX_5toyos2fd5owner5endow-0x4
     158: 80 7d c0 00                  	cmpb	$0x0, -0x40(%rbp)
     15c: 74 1f                        	je	0x17d <toyos_fd_close+0x17d>
     15e: 0f b6 45 c1                  	movzbl	-0x3f(%rbp), %eax
     162: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
     166: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x16d <toyos_fd_close+0x16d>
		0000000000000168:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     16d: 40 b6 01                     	movb	$0x1, %sil
     170: 45 31 ff                     	xorl	%r15d, %r15d
     173: 31 db                        	xorl	%ebx, %ebx
     175: 45 31 ed                     	xorl	%r13d, %r13d
     178: e9 c1 00 00 00               	jmp	0x23e <toyos_fd_close+0x23e>
     17d: 4c 8b 6d c8                  	movq	-0x38(%rbp), %r13
     181: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x188 <toyos_fd_close+0x188>
		0000000000000183:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     188: 40 b6 01                     	movb	$0x1, %sil
     18b: 41 81 fe ff 0f 00 00         	cmpl	$0xfff, %r14d           # imm = 0xFFF
     192: 77 37                        	ja	0x1cb <toyos_fd_close+0x1cb>
     194: 44 89 f0                     	movl	%r14d, %eax
     197: 8b bc 83 00 00 04 00         	movl	0x40000(%rbx,%rax,4), %edi
     19e: 45 31 ff                     	xorl	%r15d, %r15d
     1a1: 85 ff                        	testl	%edi, %edi
     1a3: 74 26                        	je	0x1cb <toyos_fd_close+0x1cb>
     1a5: 81 e7 ff ff ff 7f            	andl	$0x7fffffff, %edi       # imm = 0x7FFFFFFF
     1ab: 74 28                        	je	0x1d5 <toyos_fd_close+0x1d5>
     1ad: 89 fa                        	movl	%edi, %edx
     1af: 48 ff cf                     	decq	%rdi
     1b2: 31 c9                        	xorl	%ecx, %ecx
     1b4: 81 fa 01 10 00 00            	cmpl	$0x1001, %edx           # imm = 0x1001
     1ba: 0f 92 c1                     	setb	%cl
     1bd: b2 02                        	movb	$0x2, %dl
     1bf: 48 89 55 d0                  	movq	%rdx, -0x30(%rbp)
     1c3: 48 83 f9 01                  	cmpq	$0x1, %rcx
     1c7: 75 73                        	jne	0x23c <toyos_fd_close+0x23c>
     1c9: eb 18                        	jmp	0x1e3 <toyos_fd_close+0x1e3>
     1cb: 48 c7 45 d0 00 00 00 00      	movq	$0x0, -0x30(%rbp)
     1d3: eb 67                        	jmp	0x23c <toyos_fd_close+0x23c>
     1d5: 31 c9                        	xorl	%ecx, %ecx
     1d7: b2 02                        	movb	$0x2, %dl
     1d9: 48 89 55 d0                  	movq	%rdx, -0x30(%rbp)
     1dd: 48 83 f9 01                  	cmpq	$0x1, %rcx
     1e1: 75 59                        	jne	0x23c <toyos_fd_close+0x23c>
     1e3: 48 81 ff ff 0f 00 00         	cmpq	$0xfff, %rdi            # imm = 0xFFF
     1ea: 0f 87 49 01 00 00            	ja	0x339 <toyos_fd_close+0x339>
     1f0: 48 c1 e7 06                  	shlq	$0x6, %rdi
     1f4: 8b 4c 1f 18                  	movl	0x18(%rdi,%rbx), %ecx
     1f8: 85 c9                        	testl	%ecx, %ecx
     1fa: 74 3d                        	je	0x239 <toyos_fd_close+0x239>
     1fc: 48 01 df                     	addq	%rbx, %rdi
     1ff: c7 84 83 00 00 04 00 00 00 00 00     	movl	$0x0, 0x40000(%rbx,%rax,4)
     20a: 0f b6 07                     	movzbl	(%rdi), %eax
     20d: 44 0f b7 7f 01               	movzwl	0x1(%rdi), %r15d
     212: 0f b6 4f 03                  	movzbl	0x3(%rdi), %ecx
     216: 4c 8b 47 08                  	movq	0x8(%rdi), %r8
     21a: 4c 8b 4f 10                  	movq	0x10(%rdi), %r9
     21e: ba ff ff ff ff               	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
     223: f0                           	lock
     224: 0f c1 57 18                  	xaddl	%edx, 0x18(%rdi)
     228: 83 fa 01                     	cmpl	$0x1, %edx
     22b: 0f 84 c1 00 00 00            	je	0x2f2 <toyos_fd_close+0x2f2>
     231: 85 d2                        	testl	%edx, %edx
     233: 0f 85 d8 00 00 00            	jne	0x311 <toyos_fd_close+0x311>
     239: 45 31 ff                     	xorl	%r15d, %r15d
     23c: 31 db                        	xorl	%ebx, %ebx
     23e: 4c 89 7d a8                  	movq	%r15, -0x58(%rbp)
     242: 49 89 f6                     	movq	%rsi, %r14
     245: 31 c0                        	xorl	%eax, %eax
     247: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x24d <toyos_fd_close+0x24d>
		0000000000000249:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     24d: 83 f8 02                     	cmpl	$0x2, %eax
     250: 75 11                        	jne	0x263 <toyos_fd_close+0x263>
     252: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x259 <toyos_fd_close+0x259>
		0000000000000255:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     259: be 01 00 00 00               	movl	$0x1, %esi
     25e: e8 00 00 00 00               	callq	0x263 <toyos_fd_close+0x263>
		000000000000025f:  R_X86_64_PLT32	toyos_abi::syscall::futex_wake-0x4
     263: 4d 85 ed                     	testq	%r13, %r13
     266: 74 3a                        	je	0x2a2 <toyos_fd_close+0x2a2>
     268: 4c 8d 3d 00 00 00 00         	leaq	(%rip), %r15            # 0x26f <toyos_fd_close+0x26f>
		000000000000026b:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     26f: 4c 8d 65 c0                  	leaq	-0x40(%rbp), %r12
     273: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
     280: ba 3f 00 00 00               	movl	$0x3f, %edx
     285: bf 02 00 00 00               	movl	$0x2, %edi
     28a: 4c 89 fe                     	movq	%r15, %rsi
     28d: e8 00 00 00 00               	callq	0x292 <toyos_fd_close+0x292>
		000000000000028e:  R_X86_64_PLT32	toyos_fs_write-0x4
     292: 4c 89 e7                     	movq	%r12, %rdi
     295: 48 89 c6                     	movq	%rax, %rsi
     298: e8 00 00 00 00               	callq	0x29d <toyos_fd_close+0x29d>
		0000000000000299:  R_X86_64_PLT32	.text._RNvNtCsX_5toyos5files6decode-0x4
     29d: 49 ff cd                     	decq	%r13
     2a0: 75 de                        	jne	0x280 <toyos_fd_close+0x280>
     2a2: 45 84 f6                     	testb	%r14b, %r14b
     2a5: 74 12                        	je	0x2b9 <toyos_fd_close+0x2b9>
     2a7: 48 8b 45 d0                  	movq	-0x30(%rbp), %rax
     2ab: 3c 02                        	cmpb	$0x2, %al
     2ad: 74 70                        	je	0x31f <toyos_fd_close+0x31f>
     2af: 0f b6 c0                     	movzbl	%al, %eax
     2b2: f7 d0                        	notl	%eax
     2b4: 83 c8 fe                     	orl	$-0x2, %eax
     2b7: eb 2a                        	jmp	0x2e3 <toyos_fd_close+0x2e3>
     2b9: 31 c0                        	xorl	%eax, %eax
     2bb: 84 db                        	testb	%bl, %bl
     2bd: 74 24                        	je	0x2e3 <toyos_fd_close+0x2e3>
     2bf: 48 8b 45 b0                  	movq	-0x50(%rbp), %rax
     2c3: 48 85 c0                     	testq	%rax, %rax
     2c6: 74 0a                        	je	0x2d2 <toyos_fd_close+0x2d2>
     2c8: 48 8b 7d b8                  	movq	-0x48(%rbp), %rdi
     2cc: ff d0                        	callq	*%rax
     2ce: 31 c0                        	xorl	%eax, %eax
     2d0: eb 11                        	jmp	0x2e3 <toyos_fd_close+0x2e3>
     2d2: 0f b6 45 d0                  	movzbl	-0x30(%rbp), %eax
     2d6: 48 8b 7d a8                  	movq	-0x58(%rbp), %rdi
     2da: 09 c7                        	orl	%eax, %edi
     2dc: e8 00 00 00 00               	callq	0x2e1 <toyos_fd_close+0x2e1>
		00000000000002dd:  R_X86_64_PLT32	toyos::net::stream::let_go-0x4
     2e1: 31 c0                        	xorl	%eax, %eax
     2e3: 48 83 c4 38                  	addq	$0x38, %rsp
     2e7: 5b                           	popq	%rbx
     2e8: 41 5c                        	popq	%r12
     2ea: 41 5d                        	popq	%r13
     2ec: 41 5e                        	popq	%r14
     2ee: 41 5f                        	popq	%r15
     2f0: 5d                           	popq	%rbp
     2f1: c3                           	retq
     2f2: 4c 89 4d b0                  	movq	%r9, -0x50(%rbp)
     2f6: 4c 89 45 b8                  	movq	%r8, -0x48(%rbp)
     2fa: c1 e1 10                     	shll	$0x10, %ecx
     2fd: 41 09 cf                     	orl	%ecx, %r15d
     300: 41 c1 e7 08                  	shll	$0x8, %r15d
     304: b3 01                        	movb	$0x1, %bl
     306: 31 f6                        	xorl	%esi, %esi
     308: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
     30c: e9 2d ff ff ff               	jmp	0x23e <toyos_fd_close+0x23e>
     311: 45 31 ff                     	xorl	%r15d, %r15d
     314: 48 89 45 d0                  	movq	%rax, -0x30(%rbp)
     318: 31 f6                        	xorl	%esi, %esi
     31a: e9 1d ff ff ff               	jmp	0x23c <toyos_fd_close+0x23c>
     31f: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x326 <toyos_fd_close+0x326>
		0000000000000322:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     326: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x32d <toyos_fd_close+0x32d>
		0000000000000329:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     32d: be 5f 00 00 00               	movl	$0x5f, %esi
     332: e8 00 00 00 00               	callq	0x337 <toyos_fd_close+0x337>
		0000000000000333:  R_X86_64_PLT32	core::panicking::panic_fmt-0x4
     337: eb 11                        	jmp	0x34a <toyos_fd_close+0x34a>
     339: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x340 <toyos_fd_close+0x340>
		000000000000033c:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     340: be 00 10 00 00               	movl	$0x1000, %esi           # imm = 0x1000
     345: e8 00 00 00 00               	callq	0x34a <toyos_fd_close+0x34a>
		0000000000000346:  R_X86_64_PLT32	core::panicking::panic_bounds_check-0x4
     34a: 0f 0b                        	ud2
     34c: 31 c0                        	xorl	%eax, %eax
     34e: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x354 <toyos_fd_close+0x354>
		0000000000000350:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     354: 83 f8 02                     	cmpl	$0x2, %eax
     357: 75 22                        	jne	0x37b <toyos_fd_close+0x37b>
     359: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x360 <toyos_fd_close+0x360>
		000000000000035c:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     360: be 01 00 00 00               	movl	$0x1, %esi
     365: e8 00 00 00 00               	callq	0x36a <toyos_fd_close+0x36a>
		0000000000000366:  R_X86_64_PLT32	toyos_abi::syscall::futex_wake-0x4
     36a: eb 0f                        	jmp	0x37b <toyos_fd_close+0x37b>
     36c: e8 00 00 00 00               	callq	0x371 <toyos_fd_close+0x371>
		000000000000036d:  R_X86_64_PLT32	core::panicking::panic_in_cleanup-0x4
     371: e8 00 00 00 00               	callq	0x376 <toyos_fd_close+0x376>
		0000000000000372:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     376: e8 00 00 00 00               	callq	0x37b <toyos_fd_close+0x37b>
		0000000000000377:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     37b: e8 00 00 00 00               	callq	0x380 <toyos_fd_close+0x380>
		000000000000037c:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
