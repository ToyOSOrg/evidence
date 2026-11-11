Disassembly of section .text._RNvNtNtCsX_5toyos2fd5owner5table:

0000000000000000 <toyos::fd::owner::table>:
       0: 55                           	pushq	%rbp
       1: 48 89 e5                     	movq	%rsp, %rbp
       4: 41 57                        	pushq	%r15
       6: 41 56                        	pushq	%r14
       8: 41 55                        	pushq	%r13
       a: 41 54                        	pushq	%r12
       c: 53                           	pushq	%rbx
       d: 48 83 ec 18                  	subq	$0x18, %rsp
      11: 0f b6 05 00 00 00 00         	movzbl	(%rip), %eax            # 0x18 <toyos::fd::owner::table+0x18>
		0000000000000014:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x4
      18: 84 c0                        	testb	%al, %al
      1a: 0f 85 8b 01 00 00            	jne	0x1ab <toyos::fd::owner::table+0x1ab>
      20: 49 89 ff                     	movq	%rdi, %r15
      23: e8 00 00 00 00               	callq	0x28 <toyos::fd::owner::table+0x28>
		0000000000000024:  R_X86_64_PLT32	<toyos::endow::Endowments>::get-0x4
      28: b9 01 00 00 00               	movl	$0x1, %ecx
      2d: 31 c0                        	xorl	%eax, %eax
      2f: f0                           	lock
      30: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x37 <toyos::fd::owner::table+0x37>
		0000000000000033:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      37: 0f 84 f1 00 00 00            	je	0x12e <toyos::fd::owner::table+0x12e>
      3d: ba 64 00 00 00               	movl	$0x64, %edx
      42: eb 27                        	jmp	0x6b <toyos::fd::owner::table+0x6b>
      44: 66 66 66 2e 0f 1f 84 00 00 00 00 00  	nopw	%cs:(%rax,%rax)
      50: 31 c0                        	xorl	%eax, %eax
      52: f0                           	lock
      53: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x5a <toyos::fd::owner::table+0x5a>
		0000000000000056:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      5a: 0f 84 ce 00 00 00            	je	0x12e <toyos::fd::owner::table+0x12e>
      60: f3 90                        	pause
      62: 83 c2 fc                     	addl	$-0x4, %edx
      65: 0f 84 8a 00 00 00            	je	0xf5 <toyos::fd::owner::table+0xf5>
      6b: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0x71 <toyos::fd::owner::table+0x71>
		000000000000006d:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      71: 85 c0                        	testl	%eax, %eax
      73: 74 0b                        	je	0x80 <toyos::fd::owner::table+0x80>
      75: 83 f8 02                     	cmpl	$0x2, %eax
      78: 75 16                        	jne	0x90 <toyos::fd::owner::table+0x90>
      7a: eb 79                        	jmp	0xf5 <toyos::fd::owner::table+0xf5>
      7c: 0f 1f 40 00                  	nopl	(%rax)
      80: 31 c0                        	xorl	%eax, %eax
      82: f0                           	lock
      83: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x8a <toyos::fd::owner::table+0x8a>
		0000000000000086:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      8a: 0f 84 9e 00 00 00            	je	0x12e <toyos::fd::owner::table+0x12e>
      90: f3 90                        	pause
      92: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0x98 <toyos::fd::owner::table+0x98>
		0000000000000094:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      98: 85 c0                        	testl	%eax, %eax
      9a: 74 14                        	je	0xb0 <toyos::fd::owner::table+0xb0>
      9c: 83 f8 02                     	cmpl	$0x2, %eax
      9f: 75 1b                        	jne	0xbc <toyos::fd::owner::table+0xbc>
      a1: eb 52                        	jmp	0xf5 <toyos::fd::owner::table+0xf5>
      a3: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
      b0: 31 c0                        	xorl	%eax, %eax
      b2: f0                           	lock
      b3: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0xba <toyos::fd::owner::table+0xba>
		00000000000000b6:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      ba: 74 72                        	je	0x12e <toyos::fd::owner::table+0x12e>
      bc: f3 90                        	pause
      be: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0xc4 <toyos::fd::owner::table+0xc4>
		00000000000000c0:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      c4: 85 c0                        	testl	%eax, %eax
      c6: 74 08                        	je	0xd0 <toyos::fd::owner::table+0xd0>
      c8: 83 f8 02                     	cmpl	$0x2, %eax
      cb: 75 0f                        	jne	0xdc <toyos::fd::owner::table+0xdc>
      cd: eb 26                        	jmp	0xf5 <toyos::fd::owner::table+0xf5>
      cf: 90                           	nop
      d0: 31 c0                        	xorl	%eax, %eax
      d2: f0                           	lock
      d3: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0xda <toyos::fd::owner::table+0xda>
		00000000000000d6:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      da: 74 52                        	je	0x12e <toyos::fd::owner::table+0x12e>
      dc: f3 90                        	pause
      de: 8b 05 00 00 00 00            	movl	(%rip), %eax            # 0xe4 <toyos::fd::owner::table+0xe4>
		00000000000000e0:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      e4: 85 c0                        	testl	%eax, %eax
      e6: 0f 84 64 ff ff ff            	je	0x50 <toyos::fd::owner::table+0x50>
      ec: 83 f8 02                     	cmpl	$0x2, %eax
      ef: 0f 85 6b ff ff ff            	jne	0x60 <toyos::fd::owner::table+0x60>
      f5: b8 02 00 00 00               	movl	$0x2, %eax
      fa: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x100 <toyos::fd::owner::table+0x100>
		00000000000000fc:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     100: 85 c0                        	testl	%eax, %eax
     102: 74 2a                        	je	0x12e <toyos::fd::owner::table+0x12e>
     104: 48 8d 1d 00 00 00 00         	leaq	(%rip), %rbx            # 0x10b <toyos::fd::owner::table+0x10b>
		0000000000000107:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     10b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
     110: 48 89 df                     	movq	%rbx, %rdi
     113: be 02 00 00 00               	movl	$0x2, %esi
     118: 31 d2                        	xorl	%edx, %edx
     11a: e8 00 00 00 00               	callq	0x11f <toyos::fd::owner::table+0x11f>
		000000000000011b:  R_X86_64_PLT32	toyos_abi::syscall::futex_wait-0x4
     11f: b8 02 00 00 00               	movl	$0x2, %eax
     124: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x12a <toyos::fd::owner::table+0x12a>
		0000000000000126:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     12a: 85 c0                        	testl	%eax, %eax
     12c: 75 e2                        	jne	0x110 <toyos::fd::owner::table+0x110>
     12e: 48 8d 05 00 00 00 00         	leaq	(%rip), %rax            # 0x135 <toyos::fd::owner::table+0x135>
		0000000000000131:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner5TABLE-0x4
     135: 48 89 45 c0                  	movq	%rax, -0x40(%rbp)
     139: 0f b6 05 00 00 00 00         	movzbl	(%rip), %eax            # 0x140 <toyos::fd::owner::table+0x140>
		000000000000013c:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x4
     140: 31 db                        	xorl	%ebx, %ebx
     142: 84 c0                        	testb	%al, %al
     144: 0f 84 94 00 00 00            	je	0x1de <toyos::fd::owner::table+0x1de>
     14a: 41 b4 ff                     	movb	$-0x1, %r12b
     14d: 45 31 ed                     	xorl	%r13d, %r13d
     150: 87 1d 00 00 00 00            	xchgl	%ebx, (%rip)            # 0x156 <toyos::fd::owner::table+0x156>
		0000000000000152:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     156: 83 fb 02                     	cmpl	$0x2, %ebx
     159: 75 11                        	jne	0x16c <toyos::fd::owner::table+0x16c>
     15b: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x162 <toyos::fd::owner::table+0x162>
		000000000000015e:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     162: be 01 00 00 00               	movl	$0x1, %esi
     167: e8 00 00 00 00               	callq	0x16c <toyos::fd::owner::table+0x16c>
		0000000000000168:  R_X86_64_PLT32	toyos_abi::syscall::futex_wake-0x4
     16c: 4d 85 ed                     	testq	%r13, %r13
     16f: 74 31                        	je	0x1a2 <toyos::fd::owner::table+0x1a2>
     171: 48 8d 1d 00 00 00 00         	leaq	(%rip), %rbx            # 0x178 <toyos::fd::owner::table+0x178>
		0000000000000174:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     178: 4c 8d 75 c8                  	leaq	-0x38(%rbp), %r14
     17c: 0f 1f 40 00                  	nopl	(%rax)
     180: ba 3f 00 00 00               	movl	$0x3f, %edx
     185: bf 02 00 00 00               	movl	$0x2, %edi
     18a: 48 89 de                     	movq	%rbx, %rsi
     18d: e8 00 00 00 00               	callq	0x192 <toyos::fd::owner::table+0x192>
		000000000000018e:  R_X86_64_PLT32	toyos_fs_write-0x4
     192: 4c 89 f7                     	movq	%r14, %rdi
     195: 48 89 c6                     	movq	%rax, %rsi
     198: e8 00 00 00 00               	callq	0x19d <toyos::fd::owner::table+0x19d>
		0000000000000199:  R_X86_64_PLT32	.text._RNvNtCsX_5toyos5files6decode-0x4
     19d: 49 ff cd                     	decq	%r13
     1a0: 75 de                        	jne	0x180 <toyos::fd::owner::table+0x180>
     1a2: 41 80 fc ff                  	cmpb	$-0x1, %r12b
     1a6: 4c 89 ff                     	movq	%r15, %rdi
     1a9: 75 1e                        	jne	0x1c9 <toyos::fd::owner::table+0x1c9>
     1ab: 48 8d 05 00 00 00 00         	leaq	(%rip), %rax            # 0x1b2 <toyos::fd::owner::table+0x1b2>
		00000000000001ae:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner5TABLE-0x4
     1b2: 48 89 47 08                  	movq	%rax, 0x8(%rdi)
     1b6: 31 c0                        	xorl	%eax, %eax
     1b8: 88 07                        	movb	%al, (%rdi)
     1ba: 48 83 c4 18                  	addq	$0x18, %rsp
     1be: 5b                           	popq	%rbx
     1bf: 41 5c                        	popq	%r12
     1c1: 41 5d                        	popq	%r13
     1c3: 41 5e                        	popq	%r14
     1c5: 41 5f                        	popq	%r15
     1c7: 5d                           	popq	%rbp
     1c8: c3                           	retq
     1c9: 41 0f b6 c4                  	movzbl	%r12b, %eax
     1cd: 83 f8 02                     	cmpl	$0x2, %eax
     1d0: 74 4e                        	je	0x220 <toyos::fd::owner::table+0x220>
     1d2: 41 80 e4 01                  	andb	$0x1, %r12b
     1d6: 44 88 67 01                  	movb	%r12b, 0x1(%rdi)
     1da: b0 01                        	movb	$0x1, %al
     1dc: eb da                        	jmp	0x1b8 <toyos::fd::owner::table+0x1b8>
     1de: 48 8d 7d c8                  	leaq	-0x38(%rbp), %rdi
     1e2: 48 8d 75 c0                  	leaq	-0x40(%rbp), %rsi
     1e6: e8 00 00 00 00               	callq	0x1eb <toyos::fd::owner::table+0x1eb>
		00000000000001e7:  R_X86_64_PLT32	.text._RNvNtNtCsX_5toyos2fd5owner5endow-0x4
     1eb: 45 31 ed                     	xorl	%r13d, %r13d
     1ee: 80 7d c8 00                  	cmpb	$0x0, -0x38(%rbp)
     1f2: 4c 0f 44 6d d0               	cmoveq	-0x30(%rbp), %r13
     1f7: 0f b6 45 c9                  	movzbl	-0x37(%rbp), %eax
     1fb: 41 bc ff 00 00 00            	movl	$0xff, %r12d
     201: 44 0f 45 e0                  	cmovnel	%eax, %r12d
     205: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x20c <toyos::fd::owner::table+0x20c>
		0000000000000207:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     20c: 87 1d 00 00 00 00            	xchgl	%ebx, (%rip)            # 0x212 <toyos::fd::owner::table+0x212>
		000000000000020e:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     212: 83 fb 02                     	cmpl	$0x2, %ebx
     215: 0f 84 40 ff ff ff            	je	0x15b <toyos::fd::owner::table+0x15b>
     21b: e9 4c ff ff ff               	jmp	0x16c <toyos::fd::owner::table+0x16c>
     220: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x227 <toyos::fd::owner::table+0x227>
		0000000000000223:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     227: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x22e <toyos::fd::owner::table+0x22e>
		000000000000022a:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     22e: be 5f 00 00 00               	movl	$0x5f, %esi
     233: e8 00 00 00 00               	callq	0x238 <toyos::fd::owner::table+0x238>
		0000000000000234:  R_X86_64_PLT32	core::panicking::panic_fmt-0x4
     238: 48 89 c3                     	movq	%rax, %rbx
     23b: 31 c0                        	xorl	%eax, %eax
     23d: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x243 <toyos::fd::owner::table+0x243>
		000000000000023f:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     243: 83 f8 02                     	cmpl	$0x2, %eax
     246: 75 11                        	jne	0x259 <toyos::fd::owner::table+0x259>
     248: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x24f <toyos::fd::owner::table+0x24f>
		000000000000024b:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     24f: be 01 00 00 00               	movl	$0x1, %esi
     254: e8 00 00 00 00               	callq	0x259 <toyos::fd::owner::table+0x259>
		0000000000000255:  R_X86_64_PLT32	toyos_abi::syscall::futex_wake-0x4
     259: 48 89 df                     	movq	%rbx, %rdi
     25c: e8 00 00 00 00               	callq	0x261 <toyos::fd::owner::table+0x261>
		000000000000025d:  R_X86_64_PLT32	_Unwind_Resume-0x4
     261: e8 00 00 00 00               	callq	0x266 <toyos::fd::owner::table+0x266>
		0000000000000262:  R_X86_64_PLT32	core::panicking::panic_in_cleanup-0x4
