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
      2a: 0f 84 ee 00 00 00            	je	0x11e <toyos_fd_set_inheritable+0x11e>
      30: ba 64 00 00 00               	movl	$0x64, %edx
      35: eb 24                        	jmp	0x5b <toyos_fd_set_inheritable+0x5b>
      37: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
      40: 31 c0                        	xorl	%eax, %eax
      42: f0                           	lock
      43: 0f b1 0d 00 00 00 00         	cmpxchgl	%ecx, (%rip)            # 0x4a <toyos_fd_set_inheritable+0x4a>
		0000000000000046:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      4a: 0f 84 ce 00 00 00            	je	0x11e <toyos_fd_set_inheritable+0x11e>
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
      7a: 0f 84 9e 00 00 00            	je	0x11e <toyos_fd_set_inheritable+0x11e>
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
      aa: 74 72                        	je	0x11e <toyos_fd_set_inheritable+0x11e>
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
      ca: 74 52                        	je	0x11e <toyos_fd_set_inheritable+0x11e>
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
      f2: 74 2a                        	je	0x11e <toyos_fd_set_inheritable+0x11e>
      f4: 4c 8d 3d 00 00 00 00         	leaq	(%rip), %r15            # 0xfb <toyos_fd_set_inheritable+0xfb>
		00000000000000f7:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
      fb: 0f 1f 44 00 00               	nopl	(%rax,%rax)
     100: 4c 89 ff                     	movq	%r15, %rdi
     103: be 02 00 00 00               	movl	$0x2, %esi
     108: 31 d2                        	xorl	%edx, %edx
     10a: e8 00 00 00 00               	callq	0x10f <toyos_fd_set_inheritable+0x10f>
		000000000000010b:  R_X86_64_PLT32	toyos_abi::syscall::futex_wait-0x4
     10f: b8 02 00 00 00               	movl	$0x2, %eax
     114: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x11a <toyos_fd_set_inheritable+0x11a>
		0000000000000116:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     11a: 85 c0                        	testl	%eax, %eax
     11c: 75 e2                        	jne	0x100 <toyos_fd_set_inheritable+0x100>
     11e: 4c 8d 2d 00 00 00 00         	leaq	(%rip), %r13            # 0x125 <toyos_fd_set_inheritable+0x125>
		0000000000000121:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner5TABLE-0x4
     125: 4c 89 6d c0                  	movq	%r13, -0x40(%rbp)
     129: 0f b6 05 00 00 00 00         	movzbl	(%rip), %eax            # 0x130 <toyos_fd_set_inheritable+0x130>
		000000000000012c:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x4
     130: 84 c0                        	testb	%al, %al
     132: 74 0e                        	je	0x142 <toyos_fd_set_inheritable+0x142>
     134: 45 31 ff                     	xorl	%r15d, %r15d
     137: 41 81 fe ff 0f 00 00         	cmpl	$0xfff, %r14d           # imm = 0xFFF
     13e: 77 74                        	ja	0x1b4 <toyos_fd_set_inheritable+0x1b4>
     140: eb 38                        	jmp	0x17a <toyos_fd_set_inheritable+0x17a>
     142: 48 8d 7d c8                  	leaq	-0x38(%rbp), %rdi
     146: 48 8d 75 c0                  	leaq	-0x40(%rbp), %rsi
     14a: e8 00 00 00 00               	callq	0x14f <toyos_fd_set_inheritable+0x14f>
		000000000000014b:  R_X86_64_PLT32	.text._RNvNtNtCsX_5toyos2fd5owner5endow-0x4
     14f: 80 7d c8 00                  	cmpb	$0x0, -0x38(%rbp)
     153: 74 11                        	je	0x166 <toyos_fd_set_inheritable+0x166>
     155: 44 0f b6 65 c9               	movzbl	-0x37(%rbp), %r12d
     15a: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x161 <toyos_fd_set_inheritable+0x161>
		000000000000015c:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     161: 45 31 ff                     	xorl	%r15d, %r15d
     164: eb 51                        	jmp	0x1b7 <toyos_fd_set_inheritable+0x1b7>
     166: 4c 8b 7d d0                  	movq	-0x30(%rbp), %r15
     16a: c6 05 00 00 00 00 01         	movb	$0x1, (%rip)            # 0x171 <toyos_fd_set_inheritable+0x171>
		000000000000016c:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7ENDOWED.0-0x5
     171: 41 81 fe ff 0f 00 00         	cmpl	$0xfff, %r14d           # imm = 0xFFF
     178: 77 3a                        	ja	0x1b4 <toyos_fd_set_inheritable+0x1b4>
     17a: 44 89 f0                     	movl	%r14d, %eax
     17d: 41 8b bc 85 00 00 04 00      	movl	0x40000(%r13,%rax,4), %edi
     185: 85 ff                        	testl	%edi, %edi
     187: 74 2b                        	je	0x1b4 <toyos_fd_set_inheritable+0x1b4>
     189: 81 e7 ff ff ff 7f            	andl	$0x7fffffff, %edi       # imm = 0x7FFFFFFF
     18f: 0f 84 a2 00 00 00            	je	0x237 <toyos_fd_set_inheritable+0x237>
     195: 89 fa                        	movl	%edi, %edx
     197: 48 ff cf                     	decq	%rdi
     19a: 31 c9                        	xorl	%ecx, %ecx
     19c: 81 fa 01 10 00 00            	cmpl	$0x1001, %edx           # imm = 0x1001
     1a2: 0f 92 c1                     	setb	%cl
     1a5: 41 b4 02                     	movb	$0x2, %r12b
     1a8: 48 83 f9 01                  	cmpq	$0x1, %rcx
     1ac: 0f 84 94 00 00 00            	je	0x246 <toyos_fd_set_inheritable+0x246>
     1b2: eb 03                        	jmp	0x1b7 <toyos_fd_set_inheritable+0x1b7>
     1b4: 45 31 e4                     	xorl	%r12d, %r12d
     1b7: 31 c0                        	xorl	%eax, %eax
     1b9: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x1bf <toyos_fd_set_inheritable+0x1bf>
		00000000000001bb:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     1bf: 83 f8 02                     	cmpl	$0x2, %eax
     1c2: 75 11                        	jne	0x1d5 <toyos_fd_set_inheritable+0x1d5>
     1c4: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x1cb <toyos_fd_set_inheritable+0x1cb>
		00000000000001c7:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     1cb: be 01 00 00 00               	movl	$0x1, %esi
     1d0: e8 00 00 00 00               	callq	0x1d5 <toyos_fd_set_inheritable+0x1d5>
		00000000000001d1:  R_X86_64_PLT32	toyos_abi::syscall::futex_wake-0x4
     1d5: 4d 85 ff                     	testq	%r15, %r15
     1d8: 74 38                        	je	0x212 <toyos_fd_set_inheritable+0x212>
     1da: 48 8d 1d 00 00 00 00         	leaq	(%rip), %rbx            # 0x1e1 <toyos_fd_set_inheritable+0x1e1>
		00000000000001dd:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     1e1: 4c 8d 75 c8                  	leaq	-0x38(%rbp), %r14
     1e5: 66 66 2e 0f 1f 84 00 00 00 00 00     	nopw	%cs:(%rax,%rax)
     1f0: ba 3f 00 00 00               	movl	$0x3f, %edx
     1f5: bf 02 00 00 00               	movl	$0x2, %edi
     1fa: 48 89 de                     	movq	%rbx, %rsi
     1fd: e8 00 00 00 00               	callq	0x202 <toyos_fd_set_inheritable+0x202>
		00000000000001fe:  R_X86_64_PLT32	toyos_fs_write-0x4
     202: 4c 89 f7                     	movq	%r14, %rdi
     205: 48 89 c6                     	movq	%rax, %rsi
     208: e8 00 00 00 00               	callq	0x20d <toyos_fd_set_inheritable+0x20d>
		0000000000000209:  R_X86_64_PLT32	.text._RNvNtCsX_5toyos5files6decode-0x4
     20d: 49 ff cf                     	decq	%r15
     210: 75 de                        	jne	0x1f0 <toyos_fd_set_inheritable+0x1f0>
     212: 31 c0                        	xorl	%eax, %eax
     214: 41 80 fc ff                  	cmpb	$-0x1, %r12b
     218: 74 0e                        	je	0x228 <toyos_fd_set_inheritable+0x228>
     21a: 41 0f b6 c4                  	movzbl	%r12b, %eax
     21e: 83 f8 02                     	cmpl	$0x2, %eax
     221: 74 5a                        	je	0x27d <toyos_fd_set_inheritable+0x27d>
     223: f7 d0                        	notl	%eax
     225: 83 c8 fe                     	orl	$-0x2, %eax
     228: 48 83 c4 18                  	addq	$0x18, %rsp
     22c: 5b                           	popq	%rbx
     22d: 41 5c                        	popq	%r12
     22f: 41 5d                        	popq	%r13
     231: 41 5e                        	popq	%r14
     233: 41 5f                        	popq	%r15
     235: 5d                           	popq	%rbp
     236: c3                           	retq
     237: 31 c9                        	xorl	%ecx, %ecx
     239: 41 b4 02                     	movb	$0x2, %r12b
     23c: 48 83 f9 01                  	cmpq	$0x1, %rcx
     240: 0f 85 71 ff ff ff            	jne	0x1b7 <toyos_fd_set_inheritable+0x1b7>
     246: 48 81 ff ff 0f 00 00         	cmpq	$0xfff, %rdi            # imm = 0xFFF
     24d: 77 48                        	ja	0x297 <toyos_fd_set_inheritable+0x297>
     24f: 48 89 f9                     	movq	%rdi, %rcx
     252: 48 c1 e1 06                  	shlq	$0x6, %rcx
     256: 42 8b 4c 29 18               	movl	0x18(%rcx,%r13), %ecx
     25b: 85 c9                        	testl	%ecx, %ecx
     25d: 0f 84 54 ff ff ff            	je	0x1b7 <toyos_fd_set_inheritable+0x1b7>
     263: 0f b6 cb                     	movzbl	%bl, %ecx
     266: c1 e1 1f                     	shll	$0x1f, %ecx
     269: 01 f9                        	addl	%edi, %ecx
     26b: ff c1                        	incl	%ecx
     26d: 41 89 8c 85 00 00 04 00      	movl	%ecx, 0x40000(%r13,%rax,4)
     275: 41 b4 ff                     	movb	$-0x1, %r12b
     278: e9 3a ff ff ff               	jmp	0x1b7 <toyos_fd_set_inheritable+0x1b7>
     27d: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x284 <toyos_fd_set_inheritable+0x284>
		0000000000000280:  R_X86_64_PC32	.rodata..Lanon.X-0x4
     284: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x28b <toyos_fd_set_inheritable+0x28b>
		0000000000000287:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     28b: be 5f 00 00 00               	movl	$0x5f, %esi
     290: e8 00 00 00 00               	callq	0x295 <toyos_fd_set_inheritable+0x295>
		0000000000000291:  R_X86_64_PLT32	core::panicking::panic_fmt-0x4
     295: eb 11                        	jmp	0x2a8 <toyos_fd_set_inheritable+0x2a8>
     297: 48 8d 15 00 00 00 00         	leaq	(%rip), %rdx            # 0x29e <toyos_fd_set_inheritable+0x29e>
		000000000000029a:  R_X86_64_PC32	.data.rel.ro..Lanon.X-0x4
     29e: be 00 10 00 00               	movl	$0x1000, %esi           # imm = 0x1000
     2a3: e8 00 00 00 00               	callq	0x2a8 <toyos_fd_set_inheritable+0x2a8>
		00000000000002a4:  R_X86_64_PLT32	core::panicking::panic_bounds_check-0x4
     2a8: 0f 0b                        	ud2
     2aa: 31 c0                        	xorl	%eax, %eax
     2ac: 87 05 00 00 00 00            	xchgl	%eax, (%rip)            # 0x2b2 <toyos_fd_set_inheritable+0x2b2>
		00000000000002ae:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     2b2: 83 f8 02                     	cmpl	$0x2, %eax
     2b5: 75 22                        	jne	0x2d9 <toyos_fd_set_inheritable+0x2d9>
     2b7: 48 8d 3d 00 00 00 00         	leaq	(%rip), %rdi            # 0x2be <toyos_fd_set_inheritable+0x2be>
		00000000000002ba:  R_X86_64_PC32	.bss._RNvNtNtCsX_5toyos2fd5owner7WRITING-0x4
     2be: be 01 00 00 00               	movl	$0x1, %esi
     2c3: e8 00 00 00 00               	callq	0x2c8 <toyos_fd_set_inheritable+0x2c8>
		00000000000002c4:  R_X86_64_PLT32	toyos_abi::syscall::futex_wake-0x4
     2c8: eb 0f                        	jmp	0x2d9 <toyos_fd_set_inheritable+0x2d9>
     2ca: e8 00 00 00 00               	callq	0x2cf <toyos_fd_set_inheritable+0x2cf>
		00000000000002cb:  R_X86_64_PLT32	core::panicking::panic_in_cleanup-0x4
     2cf: e8 00 00 00 00               	callq	0x2d4 <toyos_fd_set_inheritable+0x2d4>
		00000000000002d0:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     2d4: e8 00 00 00 00               	callq	0x2d9 <toyos_fd_set_inheritable+0x2d9>
		00000000000002d5:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
     2d9: e8 00 00 00 00               	callq	0x2de <toyos_fd_set_inheritable+0x2de>
		00000000000002da:  R_X86_64_PLT32	core::panicking::panic_cannot_unwind-0x4
