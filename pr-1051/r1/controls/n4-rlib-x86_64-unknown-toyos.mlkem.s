0000000000000000 <<toyos_crypto::mlkem::Poly>::decode::<1>>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%rbx
       9:      	subq	$0x218, %rsp            # imm = 0x218
      10:      	movq	%rdx, -0x230(%rbp)
      17:      	cmpq	$0x20, %rdx
      1b:      	jne	0x181 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x181>
      21:      	movq	%rsi, %r14
      24:      	movq	%rdi, %rbx
      27:      	leaq	-0x230(%rbp), %r15
      2e:      	movl	$0x200, %edx            # imm = 0x200
      33:      	movq	%r15, %rdi
      36:      	xorl	%esi, %esi
      38:      	callq	0x3d <<toyos_crypto::mlkem::Poly>::decode::<1>+0x3d>
      3d:      	leaq	-0x30(%rbp), %rdi
      41:      	movq	%r15, %rsi
      44:      	callq	0x49 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x49>
      49:      	testb	%al, %al
      4b:      	je	0x19f <<toyos_crypto::mlkem::Poly>::decode::<1>+0x19f>
      51:      	leaq	-0x30(%rbp), %rax
      55:      	movq	%r14, %rcx
      58:      	subq	%rax, %rcx
      5b:      	movq	%rax, %rdx
      5e:      	subq	%r14, %rdx
      61:      	movl	$0xe, %esi
      66:      	xorps	%xmm0, %xmm0
      69:      	nopl	(%rax)
      70:      	movaps	%xmm0, -0x30(%rbp)
      74:      	cmpq	%rax, %r14
      77:      	movq	%rcx, %rdi
      7a:      	cmovbq	%rdx, %rdi
      7e:      	testq	%rdi, %rdi
      81:      	je	0x167 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x167>
      87:      	movzbl	(%r14), %edi
      8b:      	movb	%dil, -0x30(%rbp)
      8f:      	movzwl	-0x30(%rbp), %edi
      93:      	movl	%edi, %r8d
      96:      	andl	$0x1, %r8d
      9a:      	movw	%r8w, -0x23e(%rbp,%rsi)
      a3:      	movl	%edi, %r8d
      a6:      	shrl	%r8d
      a9:      	andl	$0x1, %r8d
      ad:      	movw	%r8w, -0x23c(%rbp,%rsi)
      b6:      	movl	%edi, %r8d
      b9:      	shrl	$0x2, %r8d
      bd:      	andl	$0x1, %r8d
      c1:      	movw	%r8w, -0x23a(%rbp,%rsi)
      ca:      	movl	%edi, %r8d
      cd:      	shrl	$0x3, %r8d
      d1:      	andl	$0x1, %r8d
      d5:      	movw	%r8w, -0x238(%rbp,%rsi)
      de:      	movl	%edi, %r8d
      e1:      	shrl	$0x4, %r8d
      e5:      	andl	$0x1, %r8d
      e9:      	movw	%r8w, -0x236(%rbp,%rsi)
      f2:      	movl	%edi, %r8d
      f5:      	shrl	$0x5, %r8d
      f9:      	andl	$0x1, %r8d
      fd:      	movw	%r8w, -0x234(%rbp,%rsi)
     106:      	movl	%edi, %r8d
     109:      	shrl	$0x6, %r8d
     10d:      	andl	$0x1, %r8d
     111:      	movw	%r8w, -0x232(%rbp,%rsi)
     11a:      	shrl	$0x7, %edi
     11d:      	andl	$0x1, %edi
     120:      	movw	%di, -0x230(%rbp,%rsi)
     128:      	incq	%r14
     12b:      	incq	%rcx
     12e:      	decq	%rdx
     131:      	addq	$0x10, %rsi
     135:      	cmpq	$0x20e, %rsi            # imm = 0x20E
     13c:      	jne	0x70 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x70>
     142:      	leaq	-0x230(%rbp), %rsi
     149:      	movl	$0x200, %edx            # imm = 0x200
     14e:      	movq	%rbx, %rdi
     151:      	callq	0x156 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x156>
     156:      	movq	%rbx, %rax
     159:      	addq	$0x218, %rsp            # imm = 0x218
     160:      	popq	%rbx
     161:      	popq	%r14
     163:      	popq	%r15
     165:      	popq	%rbp
     166:      	retq
     167:      	leaq	(%rip), %rdi            # 0x16e <<toyos_crypto::mlkem::Poly>::decode::<1>+0x16e>
     16e:      	leaq	(%rip), %rcx            # 0x175 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x175>
     175:      	movl	$0x237, %esi            # imm = 0x237
     17a:      	xorl	%edx, %edx
     17c:      	callq	0x181 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x181>
     181:      	leaq	(%rip), %rdx            # 0x188 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x188>
     188:      	leaq	(%rip), %r9             # 0x18f <<toyos_crypto::mlkem::Poly>::decode::<1>+0x18f>
     18f:      	leaq	-0x230(%rbp), %rsi
     196:      	xorl	%edi, %edi
     198:      	xorl	%ecx, %ecx
     19a:      	callq	0x19f <<toyos_crypto::mlkem::Poly>::decode::<1>+0x19f>
     19f:      	leaq	(%rip), %rdi            # 0x1a6 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x1a6>
     1a6:      	leaq	(%rip), %rcx            # 0x1ad <<toyos_crypto::mlkem::Poly>::decode::<1>+0x1ad>
     1ad:      	movl	$0x193, %esi            # imm = 0x193
     1b2:      	xorl	%edx, %edx
     1b4:      	callq	0x1b9 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x1b9>
     1b9:      	callq	0x1be <<toyos_crypto::mlkem::Poly>::decode::<1>+0x1be>

0000000000000000 <<toyos_crypto::mlkem::Poly>::decode::<4>>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%rbx
       9:      	subq	$0x218, %rsp            # imm = 0x218
      10:      	movq	%rdx, -0x230(%rbp)
      17:      	cmpq	$0x80, %rdx
      1e:      	jne	0x172 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x172>
      24:      	movq	%rsi, %r14
      27:      	movq	%rdi, %rbx
      2a:      	leaq	-0x230(%rbp), %r15
      31:      	movl	$0x200, %edx            # imm = 0x200
      36:      	movq	%r15, %rdi
      39:      	xorl	%esi, %esi
      3b:      	callq	0x40 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x40>
      40:      	leaq	-0x30(%rbp), %rdi
      44:      	movq	%r15, %rsi
      47:      	callq	0x4c <<toyos_crypto::mlkem::Poly>::decode::<4>+0x4c>
      4c:      	testb	%al, %al
      4e:      	je	0x190 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x190>
      54:      	leaq	-0x30(%rbp), %rax
      58:      	movq	%r14, %rcx
      5b:      	subq	%rax, %rcx
      5e:      	movq	%rax, %rdx
      61:      	subq	%r14, %rdx
      64:      	xorl	%esi, %esi
      66:      	xorps	%xmm0, %xmm0
      69:      	nopl	(%rax)
      70:      	leaq	(%r14,%rsi), %rdi
      74:      	movaps	%xmm0, -0x30(%rbp)
      78:      	leaq	(%rcx,%rsi), %r8
      7c:      	cmpq	%rax, %rdi
      7f:      	cmovbq	%rdx, %r8
      83:      	cmpq	$0x3, %r8
      87:      	jbe	0x158 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x158>
      8d:      	movl	(%rdi), %edi
      8f:      	movl	%edi, -0x30(%rbp)
      92:      	movzwl	%di, %r8d
      96:      	movl	%edi, %r9d
      99:      	andl	$0xf, %r9d
      9d:      	movw	%r9w, -0x230(%rbp,%rsi,4)
      a6:      	movl	%edi, %r9d
      a9:      	shrl	$0x4, %r9d
      ad:      	andl	$0xf, %r9d
      b1:      	movw	%r9w, -0x22e(%rbp,%rsi,4)
      ba:      	movl	%edi, %r9d
      bd:      	shrl	$0x8, %r9d
      c1:      	andl	$0xf, %r9d
      c5:      	movw	%r9w, -0x22c(%rbp,%rsi,4)
      ce:      	shrl	$0xc, %r8d
      d2:      	movw	%r8w, -0x22a(%rbp,%rsi,4)
      db:      	movzwl	-0x2e(%rbp), %r8d
      e0:      	andl	$0xf, %r8d
      e4:      	movw	%r8w, -0x228(%rbp,%rsi,4)
      ed:      	movl	%edi, %r8d
      f0:      	shrl	$0x14, %r8d
      f4:      	andl	$0xf, %r8d
      f8:      	movw	%r8w, -0x226(%rbp,%rsi,4)
     101:      	movzwl	-0x2d(%rbp), %r8d
     106:      	andl	$0xf, %r8d
     10a:      	movw	%r8w, -0x224(%rbp,%rsi,4)
     113:      	shrl	$0x1c, %edi
     116:      	movw	%di, -0x222(%rbp,%rsi,4)
     11e:      	addq	$0x4, %rsi
     122:      	addq	$-0x4, %rdx
     126:      	cmpq	$0x80, %rsi
     12d:      	jne	0x70 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x70>
     133:      	leaq	-0x230(%rbp), %rsi
     13a:      	movl	$0x200, %edx            # imm = 0x200
     13f:      	movq	%rbx, %rdi
     142:      	callq	0x147 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x147>
     147:      	movq	%rbx, %rax
     14a:      	addq	$0x218, %rsp            # imm = 0x218
     151:      	popq	%rbx
     152:      	popq	%r14
     154:      	popq	%r15
     156:      	popq	%rbp
     157:      	retq
     158:      	leaq	(%rip), %rdi            # 0x15f <<toyos_crypto::mlkem::Poly>::decode::<4>+0x15f>
     15f:      	leaq	(%rip), %rcx            # 0x166 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x166>
     166:      	movl	$0x237, %esi            # imm = 0x237
     16b:      	xorl	%edx, %edx
     16d:      	callq	0x172 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x172>
     172:      	leaq	(%rip), %rdx            # 0x179 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x179>
     179:      	leaq	(%rip), %r9             # 0x180 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x180>
     180:      	leaq	-0x230(%rbp), %rsi
     187:      	xorl	%edi, %edi
     189:      	xorl	%ecx, %ecx
     18b:      	callq	0x190 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x190>
     190:      	leaq	(%rip), %rdi            # 0x197 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x197>
     197:      	leaq	(%rip), %rcx            # 0x19e <<toyos_crypto::mlkem::Poly>::decode::<4>+0x19e>
     19e:      	movl	$0x193, %esi            # imm = 0x193
     1a3:      	xorl	%edx, %edx
     1a5:      	callq	0x1aa <<toyos_crypto::mlkem::Poly>::decode::<4>+0x1aa>
     1aa:      	callq	0x1af <<toyos_crypto::mlkem::Poly>::decode::<4>+0x1af>

0000000000000000 <<toyos_crypto::mlkem::Poly>::decode::<10>>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%rbx
       9:      	subq	$0x218, %rsp            # imm = 0x218
      10:      	movq	%rdx, -0x230(%rbp)
      17:      	cmpq	$0x140, %rdx            # imm = 0x140
      1e:      	jne	0x1aa <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1aa>
      24:      	movq	%rsi, %r14
      27:      	movq	%rdi, %rbx
      2a:      	leaq	-0x230(%rbp), %r15
      31:      	movl	$0x200, %edx            # imm = 0x200
      36:      	movq	%r15, %rdi
      39:      	xorl	%esi, %esi
      3b:      	callq	0x40 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x40>
      40:      	leaq	-0x30(%rbp), %rdi
      44:      	movq	%r15, %rsi
      47:      	callq	0x4c <<toyos_crypto::mlkem::Poly>::decode::<10>+0x4c>
      4c:      	testb	%al, %al
      4e:      	je	0x1c8 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1c8>
      54:      	leaq	-0x30(%rbp), %rax
      58:      	movq	%r14, %rcx
      5b:      	subq	%rax, %rcx
      5e:      	movq	%rax, %rdx
      61:      	subq	%r14, %rdx
      64:      	movl	$0xe, %esi
      69:      	xorps	%xmm0, %xmm0
      6c:      	nopl	(%rax)
      70:      	movaps	%xmm0, -0x30(%rbp)
      74:      	cmpq	%rax, %r14
      77:      	movq	%rcx, %rdi
      7a:      	cmovbq	%rdx, %rdi
      7e:      	cmpq	$0x9, %rdi
      82:      	jbe	0x190 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x190>
      88:      	movzwl	0x8(%r14), %edi
      8d:      	movw	%di, -0x28(%rbp)
      91:      	movq	(%r14), %r8
      94:      	movq	%r8, -0x30(%rbp)
      98:      	movl	-0x28(%rbp), %edi
      9b:      	movl	%r8d, %r9d
      9e:      	andl	$0x3ff, %r9d            # imm = 0x3FF
      a5:      	movw	%r9w, -0x23e(%rbp,%rsi)
      ae:      	movl	%r8d, %r9d
      b1:      	shrl	$0xa, %r9d
      b5:      	andl	$0x3ff, %r9d            # imm = 0x3FF
      bc:      	movw	%r9w, -0x23c(%rbp,%rsi)
      c5:      	movl	%r8d, %r9d
      c8:      	shrl	$0x14, %r9d
      cc:      	andl	$0x3ff, %r9d            # imm = 0x3FF
      d3:      	movw	%r9w, -0x23a(%rbp,%rsi)
      dc:      	movq	%r8, %r9
      df:      	shrq	$0x1e, %r9
      e3:      	andl	$0x3ff, %r9d            # imm = 0x3FF
      ea:      	movw	%r9w, -0x238(%rbp,%rsi)
      f3:      	movzwl	-0x2b(%rbp), %r9d
      f8:      	andl	$0x3ff, %r9d            # imm = 0x3FF
      ff:      	movw	%r9w, -0x236(%rbp,%rsi)
     108:      	movq	%r8, %r9
     10b:      	shrq	$0x32, %r9
     10f:      	andl	$0x3ff, %r9d            # imm = 0x3FF
     116:      	movw	%r9w, -0x234(%rbp,%rsi)
     11f:      	shrq	$0x3c, %r8
     123:      	movl	%edi, %r9d
     126:      	shll	$0x4, %r9d
     12a:      	orl	%r8d, %r9d
     12d:      	andl	$0x3ff, %r9d            # imm = 0x3FF
     134:      	movw	%r9w, -0x232(%rbp,%rsi)
     13d:      	shrl	$0x6, %edi
     140:      	andl	$0x3ff, %edi            # imm = 0x3FF
     146:      	movw	%di, -0x230(%rbp,%rsi)
     14e:      	addq	$0xa, %rcx
     152:      	addq	$-0xa, %rdx
     156:      	addq	$0xa, %r14
     15a:      	addq	$0x10, %rsi
     15e:      	cmpq	$0x20e, %rsi            # imm = 0x20E
     165:      	jne	0x70 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x70>
     16b:      	leaq	-0x230(%rbp), %rsi
     172:      	movl	$0x200, %edx            # imm = 0x200
     177:      	movq	%rbx, %rdi
     17a:      	callq	0x17f <<toyos_crypto::mlkem::Poly>::decode::<10>+0x17f>
     17f:      	movq	%rbx, %rax
     182:      	addq	$0x218, %rsp            # imm = 0x218
     189:      	popq	%rbx
     18a:      	popq	%r14
     18c:      	popq	%r15
     18e:      	popq	%rbp
     18f:      	retq
     190:      	leaq	(%rip), %rdi            # 0x197 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x197>
     197:      	leaq	(%rip), %rcx            # 0x19e <<toyos_crypto::mlkem::Poly>::decode::<10>+0x19e>
     19e:      	movl	$0x237, %esi            # imm = 0x237
     1a3:      	xorl	%edx, %edx
     1a5:      	callq	0x1aa <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1aa>
     1aa:      	leaq	(%rip), %rdx            # 0x1b1 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1b1>
     1b1:      	leaq	(%rip), %r9             # 0x1b8 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1b8>
     1b8:      	leaq	-0x230(%rbp), %rsi
     1bf:      	xorl	%edi, %edi
     1c1:      	xorl	%ecx, %ecx
     1c3:      	callq	0x1c8 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1c8>
     1c8:      	leaq	(%rip), %rdi            # 0x1cf <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1cf>
     1cf:      	leaq	(%rip), %rcx            # 0x1d6 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1d6>
     1d6:      	movl	$0x193, %esi            # imm = 0x193
     1db:      	xorl	%edx, %edx
     1dd:      	callq	0x1e2 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1e2>
     1e2:      	callq	0x1e7 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1e7>

0000000000000000 <<toyos_crypto::mlkem::Poly>::decode::<12>>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%rbx
       9:      	subq	$0x218, %rsp            # imm = 0x218
      10:      	movq	%rdx, -0x230(%rbp)
      17:      	cmpq	$0x180, %rdx            # imm = 0x180
      1e:      	jne	0x19b <<toyos_crypto::mlkem::Poly>::decode::<12>+0x19b>
      24:      	movq	%rsi, %r14
      27:      	movq	%rdi, %rbx
      2a:      	leaq	-0x230(%rbp), %r15
      31:      	movl	$0x200, %edx            # imm = 0x200
      36:      	movq	%r15, %rdi
      39:      	xorl	%esi, %esi
      3b:      	callq	0x40 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x40>
      40:      	leaq	-0x30(%rbp), %rdi
      44:      	movq	%r15, %rsi
      47:      	callq	0x4c <<toyos_crypto::mlkem::Poly>::decode::<12>+0x4c>
      4c:      	testb	%al, %al
      4e:      	je	0x1b9 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1b9>
      54:      	leaq	-0x30(%rbp), %rax
      58:      	movq	%r14, %rcx
      5b:      	subq	%rax, %rcx
      5e:      	movq	%rax, %rdx
      61:      	subq	%r14, %rdx
      64:      	movl	$0xe, %esi
      69:      	xorps	%xmm0, %xmm0
      6c:      	nopl	(%rax)
      70:      	movaps	%xmm0, -0x30(%rbp)
      74:      	cmpq	%rax, %r14
      77:      	movq	%rcx, %rdi
      7a:      	cmovbq	%rdx, %rdi
      7e:      	cmpq	$0xb, %rdi
      82:      	jbe	0x181 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x181>
      88:      	movq	(%r14), %r8
      8b:      	movq	%r8, -0x30(%rbp)
      8f:      	movl	0x8(%r14), %edi
      93:      	movl	%edi, -0x28(%rbp)
      96:      	movl	%r8d, %r9d
      99:      	andl	$0xfff, %r9d            # imm = 0xFFF
      a0:      	movw	%r9w, -0x23e(%rbp,%rsi)
      a9:      	movl	%r8d, %r9d
      ac:      	shrl	$0xc, %r9d
      b0:      	andl	$0xfff, %r9d            # imm = 0xFFF
      b7:      	movw	%r9w, -0x23c(%rbp,%rsi)
      c0:      	movzwl	-0x2d(%rbp), %r9d
      c5:      	andl	$0xfff, %r9d            # imm = 0xFFF
      cc:      	movw	%r9w, -0x23a(%rbp,%rsi)
      d5:      	movq	%r8, %r9
      d8:      	shrq	$0x24, %r9
      dc:      	andl	$0xfff, %r9d            # imm = 0xFFF
      e3:      	movw	%r9w, -0x238(%rbp,%rsi)
      ec:      	movzwl	-0x2a(%rbp), %r9d
      f1:      	andl	$0xfff, %r9d            # imm = 0xFFF
      f8:      	movw	%r9w, -0x236(%rbp,%rsi)
     101:      	movl	%edi, %r9d
     104:      	shll	$0x4, %r9d
     108:      	shrq	$0x3c, %r8
     10c:      	orl	%r9d, %r8d
     10f:      	andl	$0xfff, %r8d            # imm = 0xFFF
     116:      	movw	%r8w, -0x234(%rbp,%rsi)
     11f:      	movzwl	-0x27(%rbp), %r8d
     124:      	andl	$0xfff, %r8d            # imm = 0xFFF
     12b:      	movw	%r8w, -0x232(%rbp,%rsi)
     134:      	shrl	$0x14, %edi
     137:      	movw	%di, -0x230(%rbp,%rsi)
     13f:      	addq	$0xc, %rcx
     143:      	addq	$-0xc, %rdx
     147:      	addq	$0xc, %r14
     14b:      	addq	$0x10, %rsi
     14f:      	cmpq	$0x20e, %rsi            # imm = 0x20E
     156:      	jne	0x70 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x70>
     15c:      	leaq	-0x230(%rbp), %rsi
     163:      	movl	$0x200, %edx            # imm = 0x200
     168:      	movq	%rbx, %rdi
     16b:      	callq	0x170 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x170>
     170:      	movq	%rbx, %rax
     173:      	addq	$0x218, %rsp            # imm = 0x218
     17a:      	popq	%rbx
     17b:      	popq	%r14
     17d:      	popq	%r15
     17f:      	popq	%rbp
     180:      	retq
     181:      	leaq	(%rip), %rdi            # 0x188 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x188>
     188:      	leaq	(%rip), %rcx            # 0x18f <<toyos_crypto::mlkem::Poly>::decode::<12>+0x18f>
     18f:      	movl	$0x237, %esi            # imm = 0x237
     194:      	xorl	%edx, %edx
     196:      	callq	0x19b <<toyos_crypto::mlkem::Poly>::decode::<12>+0x19b>
     19b:      	leaq	(%rip), %rdx            # 0x1a2 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1a2>
     1a2:      	leaq	(%rip), %r9             # 0x1a9 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1a9>
     1a9:      	leaq	-0x230(%rbp), %rsi
     1b0:      	xorl	%edi, %edi
     1b2:      	xorl	%ecx, %ecx
     1b4:      	callq	0x1b9 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1b9>
     1b9:      	leaq	(%rip), %rdi            # 0x1c0 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1c0>
     1c0:      	leaq	(%rip), %rcx            # 0x1c7 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1c7>
     1c7:      	movl	$0x193, %esi            # imm = 0x193
     1cc:      	xorl	%edx, %edx
     1ce:      	callq	0x1d3 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1d3>
     1d3:      	callq	0x1d8 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1d8>

0000000000000000 <<toyos_crypto::mlkem::Poly>::encode::<1>>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r14
       6:      	pushq	%rbx
       7:      	subq	$0x10, %rsp
       b:      	movq	%rdx, -0x20(%rbp)
       f:      	cmpq	$0x20, %rdx
      13:      	jne	0x108 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x108>
      19:      	movq	%rsi, %rbx
      1c:      	movq	%rdi, %r14
      1f:      	addq	$0x200, %rdi            # imm = 0x200
      26:      	movq	%r14, %rsi
      29:      	callq	0x2e <<toyos_crypto::mlkem::Poly>::encode::<1>+0x2e>
      2e:      	testb	%al, %al
      30:      	je	0x123 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x123>
      36:      	leaq	-0x20(%rbp), %rax
      3a:      	movq	%rax, %rcx
      3d:      	subq	%rbx, %rcx
      40:      	movq	%rbx, %rdx
      43:      	subq	%rax, %rdx
      46:      	xorl	%esi, %esi
      48:      	nopl	(%rax,%rax)
      50:      	movzwl	0xa(%r14,%rsi), %edi
      56:      	shll	$0x5, %edi
      59:      	movzwl	0x8(%r14,%rsi), %r8d
      5f:      	shll	$0x4, %r8d
      63:      	orl	%edi, %r8d
      66:      	movzwl	0x6(%r14,%rsi), %r9d
      6c:      	shll	$0x3, %r9d
      70:      	movzwl	0x4(%r14,%rsi), %edi
      76:      	shll	$0x2, %edi
      79:      	orl	%r9d, %edi
      7c:      	orl	%r8d, %edi
      7f:      	movzwl	0x2(%r14,%rsi), %r8d
      85:      	addl	%r8d, %r8d
      88:      	movzwl	(%r14,%rsi), %r9d
      8d:      	orq	%r8, %r9
      90:      	movzwl	0xc(%r14,%rsi), %r8d
      96:      	shll	$0x6, %r8d
      9a:      	orq	%r9, %r8
      9d:      	movzwl	0xe(%r14,%rsi), %r9d
      a3:      	shll	$0x7, %r9d
      a7:      	orq	%r8, %rdi
      aa:      	orq	%r9, %rdi
      ad:      	movq	%rdi, -0x20(%rbp)
      b1:      	movq	$0x0, -0x18(%rbp)
      b9:      	cmpq	%rbx, %rax
      bc:      	movq	%rcx, %r8
      bf:      	cmovbq	%rdx, %r8
      c3:      	testq	%r8, %r8
      c6:      	je	0xee <<toyos_crypto::mlkem::Poly>::encode::<1>+0xee>
      c8:      	movb	%dil, (%rbx)
      cb:      	incq	%rbx
      ce:      	decq	%rcx
      d1:      	incq	%rdx
      d4:      	addq	$0x10, %rsi
      d8:      	cmpq	$0x200, %rsi            # imm = 0x200
      df:      	jne	0x50 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x50>
      e5:      	addq	$0x10, %rsp
      e9:      	popq	%rbx
      ea:      	popq	%r14
      ec:      	popq	%rbp
      ed:      	retq
      ee:      	leaq	(%rip), %rdi            # 0xf5 <<toyos_crypto::mlkem::Poly>::encode::<1>+0xf5>
      f5:      	leaq	(%rip), %rcx            # 0xfc <<toyos_crypto::mlkem::Poly>::encode::<1>+0xfc>
      fc:      	movl	$0x237, %esi            # imm = 0x237
     101:      	xorl	%edx, %edx
     103:      	callq	0x108 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x108>
     108:      	leaq	(%rip), %rdx            # 0x10f <<toyos_crypto::mlkem::Poly>::encode::<1>+0x10f>
     10f:      	leaq	(%rip), %r9             # 0x116 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x116>
     116:      	leaq	-0x20(%rbp), %rsi
     11a:      	xorl	%edi, %edi
     11c:      	xorl	%ecx, %ecx
     11e:      	callq	0x123 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x123>
     123:      	leaq	(%rip), %rdi            # 0x12a <<toyos_crypto::mlkem::Poly>::encode::<1>+0x12a>
     12a:      	leaq	(%rip), %rcx            # 0x131 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x131>
     131:      	movl	$0x193, %esi            # imm = 0x193
     136:      	xorl	%edx, %edx
     138:      	callq	0x13d <<toyos_crypto::mlkem::Poly>::encode::<1>+0x13d>
     13d:      	callq	0x142 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x142>

0000000000000000 <<toyos_crypto::mlkem::Poly>::encode::<4>>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r14
       6:      	pushq	%rbx
       7:      	subq	$0x10, %rsp
       b:      	movq	%rdx, -0x20(%rbp)
       f:      	cmpq	$0x80, %rdx
      16:      	jne	0x10c <<toyos_crypto::mlkem::Poly>::encode::<4>+0x10c>
      1c:      	movq	%rsi, %rbx
      1f:      	movq	%rdi, %r14
      22:      	addq	$0x200, %rdi            # imm = 0x200
      29:      	movq	%r14, %rsi
      2c:      	callq	0x31 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x31>
      31:      	testb	%al, %al
      33:      	je	0x127 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x127>
      39:      	leaq	-0x20(%rbp), %rax
      3d:      	movq	%rax, %rcx
      40:      	subq	%rbx, %rcx
      43:      	movq	%rbx, %rdx
      46:      	subq	%rax, %rdx
      49:      	xorl	%esi, %esi
      4b:      	nopl	(%rax,%rax)
      50:      	leaq	(%rbx,%rsi), %rdi
      54:      	movzwl	(%r14,%rsi,4), %r8d
      59:      	movzwl	0x2(%r14,%rsi,4), %r9d
      5f:      	shll	$0x4, %r9d
      63:      	orq	%r8, %r9
      66:      	movzwl	0x4(%r14,%rsi,4), %r8d
      6c:      	shll	$0x8, %r8d
      70:      	movzwl	0x6(%r14,%rsi,4), %r10d
      76:      	shll	$0xc, %r10d
      7a:      	orq	%r8, %r10
      7d:      	orq	%r9, %r10
      80:      	movzwl	0x8(%r14,%rsi,4), %r8d
      86:      	shll	$0x10, %r8d
      8a:      	movzwl	0xa(%r14,%rsi,4), %r9d
      90:      	shlq	$0x14, %r9
      94:      	orq	%r8, %r9
      97:      	movzwl	0xc(%r14,%rsi,4), %r11d
      9d:      	shlq	$0x18, %r11
      a1:      	orq	%r9, %r11
      a4:      	orq	%r10, %r11
      a7:      	movzwl	0xe(%r14,%rsi,4), %r8d
      ad:      	shlq	$0x1c, %r8
      b1:      	orq	%r11, %r8
      b4:      	movq	%r8, -0x20(%rbp)
      b8:      	movq	$0x0, -0x18(%rbp)
      c0:      	leaq	(%rdx,%rsi), %r9
      c4:      	cmpq	%rdi, %rax
      c7:      	cmovaeq	%rcx, %r9
      cb:      	cmpq	$0x3, %r9
      cf:      	jbe	0xf2 <<toyos_crypto::mlkem::Poly>::encode::<4>+0xf2>
      d1:      	movl	%r8d, (%rdi)
      d4:      	addq	$0x4, %rsi
      d8:      	addq	$-0x4, %rcx
      dc:      	cmpq	$0x80, %rsi
      e3:      	jne	0x50 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x50>
      e9:      	addq	$0x10, %rsp
      ed:      	popq	%rbx
      ee:      	popq	%r14
      f0:      	popq	%rbp
      f1:      	retq
      f2:      	leaq	(%rip), %rdi            # 0xf9 <<toyos_crypto::mlkem::Poly>::encode::<4>+0xf9>
      f9:      	leaq	(%rip), %rcx            # 0x100 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x100>
     100:      	movl	$0x237, %esi            # imm = 0x237
     105:      	xorl	%edx, %edx
     107:      	callq	0x10c <<toyos_crypto::mlkem::Poly>::encode::<4>+0x10c>
     10c:      	leaq	(%rip), %rdx            # 0x113 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x113>
     113:      	leaq	(%rip), %r9             # 0x11a <<toyos_crypto::mlkem::Poly>::encode::<4>+0x11a>
     11a:      	leaq	-0x20(%rbp), %rsi
     11e:      	xorl	%edi, %edi
     120:      	xorl	%ecx, %ecx
     122:      	callq	0x127 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x127>
     127:      	leaq	(%rip), %rdi            # 0x12e <<toyos_crypto::mlkem::Poly>::encode::<4>+0x12e>
     12e:      	leaq	(%rip), %rcx            # 0x135 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x135>
     135:      	movl	$0x193, %esi            # imm = 0x193
     13a:      	xorl	%edx, %edx
     13c:      	callq	0x141 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x141>
     141:      	callq	0x146 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x146>

0000000000000000 <<toyos_crypto::mlkem::Poly>::encode::<10>>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r14
       6:      	pushq	%rbx
       7:      	subq	$0x10, %rsp
       b:      	movq	%rdx, -0x20(%rbp)
       f:      	cmpq	$0x140, %rdx            # imm = 0x140
      16:      	jne	0x127 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x127>
      1c:      	movq	%rsi, %rbx
      1f:      	movq	%rdi, %r14
      22:      	addq	$0x200, %rdi            # imm = 0x200
      29:      	movq	%r14, %rsi
      2c:      	callq	0x31 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x31>
      31:      	testb	%al, %al
      33:      	je	0x142 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x142>
      39:      	leaq	-0x20(%rbp), %rax
      3d:      	movq	%rax, %rcx
      40:      	subq	%rbx, %rcx
      43:      	movq	%rbx, %rdx
      46:      	subq	%rax, %rdx
      49:      	xorl	%esi, %esi
      4b:      	nopl	(%rax,%rax)
      50:      	movzwl	(%r14,%rsi), %edi
      55:      	movzwl	0x2(%r14,%rsi), %r8d
      5b:      	shll	$0xa, %r8d
      5f:      	orq	%rdi, %r8
      62:      	movzwl	0x4(%r14,%rsi), %r9d
      68:      	shlq	$0x14, %r9
      6c:      	movzwl	0x6(%r14,%rsi), %edi
      72:      	shlq	$0x1e, %rdi
      76:      	orq	%r9, %rdi
      79:      	orq	%r8, %rdi
      7c:      	movzwl	0x8(%r14,%rsi), %r8d
      82:      	shlq	$0x28, %r8
      86:      	movzwl	0xa(%r14,%rsi), %r9d
      8c:      	movl	%r9d, %r10d
      8f:      	shrl	$0xe, %r10d
      93:      	shlq	$0x32, %r9
      97:      	orq	%r8, %r9
      9a:      	movzwl	0xc(%r14,%rsi), %r8d
      a0:      	movl	%r8d, %r11d
      a3:      	shrl	$0x4, %r11d
      a7:      	orl	%r10d, %r11d
      aa:      	shlq	$0x3c, %r8
      ae:      	orq	%r9, %r8
      b1:      	orq	%rdi, %r8
      b4:      	movzwl	0xe(%r14,%rsi), %edi
      ba:      	shll	$0x6, %edi
      bd:      	orl	%r11d, %edi
      c0:      	movq	%rdi, -0x18(%rbp)
      c4:      	movq	%r8, -0x20(%rbp)
      c8:      	cmpq	%rbx, %rax
      cb:      	movq	%rcx, %rdi
      ce:      	cmovbq	%rdx, %rdi
      d2:      	cmpq	$0x9, %rdi
      d6:      	jbe	0x10d <<toyos_crypto::mlkem::Poly>::encode::<10>+0x10d>
      d8:      	movzwl	-0x18(%rbp), %edi
      dc:      	movw	%di, 0x8(%rbx)
      e0:      	movq	-0x20(%rbp), %rdi
      e4:      	movq	%rdi, (%rbx)
      e7:      	addq	$-0xa, %rcx
      eb:      	addq	$0xa, %rdx
      ef:      	addq	$0xa, %rbx
      f3:      	addq	$0x10, %rsi
      f7:      	cmpq	$0x200, %rsi            # imm = 0x200
      fe:      	jne	0x50 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x50>
     104:      	addq	$0x10, %rsp
     108:      	popq	%rbx
     109:      	popq	%r14
     10b:      	popq	%rbp
     10c:      	retq
     10d:      	leaq	(%rip), %rdi            # 0x114 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x114>
     114:      	leaq	(%rip), %rcx            # 0x11b <<toyos_crypto::mlkem::Poly>::encode::<10>+0x11b>
     11b:      	movl	$0x237, %esi            # imm = 0x237
     120:      	xorl	%edx, %edx
     122:      	callq	0x127 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x127>
     127:      	leaq	(%rip), %rdx            # 0x12e <<toyos_crypto::mlkem::Poly>::encode::<10>+0x12e>
     12e:      	leaq	(%rip), %r9             # 0x135 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x135>
     135:      	leaq	-0x20(%rbp), %rsi
     139:      	xorl	%edi, %edi
     13b:      	xorl	%ecx, %ecx
     13d:      	callq	0x142 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x142>
     142:      	leaq	(%rip), %rdi            # 0x149 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x149>
     149:      	leaq	(%rip), %rcx            # 0x150 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x150>
     150:      	movl	$0x193, %esi            # imm = 0x193
     155:      	xorl	%edx, %edx
     157:      	callq	0x15c <<toyos_crypto::mlkem::Poly>::encode::<10>+0x15c>
     15c:      	callq	0x161 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x161>

0000000000000000 <<&[toyos_crypto::mlkem::Poly; 3] as core::iter::traits::collect::IntoIterator>::into_iter>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	movq	%rdi, %rax
       7:      	leaq	0x600(%rdi), %rdx
       e:      	popq	%rbp
       f:      	retq

~/.claude/jobs/2280e09e/tmp/scratchpad/agents/mlkem/target-rlib/x86_64-unknown-toyos/toyos/libtoyos_crypto.rlib(toyos_crypto-d55b0841b948afee.19ir237185zdrlvqazyogfnax.1cf1o63.rcgu.o):	file format elf64-x86-64

0000000000000000 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	movq	0x10(%rdi), %rax
       8:      	cmpq	0x8(%rdi), %rax
       c:      	ja	0x85 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x85>
       e:      	testq	%rax, %rax
      11:      	je	0x83 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x83>
      13:      	movq	(%rdi), %rcx
      16:      	addq	$0xe, %rcx
      1a:      	xorl	%edx, %edx
      1c:      	nopl	(%rax)
      20:      	xorl	%esi, %esi
      22:      	nopw	%cs:(%rax,%rax)
      30:      	movw	$0x0, -0xe(%rcx,%rsi)
      37:      	movw	$0x0, -0xc(%rcx,%rsi)
      3e:      	movw	$0x0, -0xa(%rcx,%rsi)
      45:      	movw	$0x0, -0x8(%rcx,%rsi)
      4c:      	movw	$0x0, -0x6(%rcx,%rsi)
      53:      	movw	$0x0, -0x4(%rcx,%rsi)
      5a:      	movw	$0x0, -0x2(%rcx,%rsi)
      61:      	movw	$0x0, (%rcx,%rsi)
      67:      	addq	$0x10, %rsi
      6b:      	cmpq	$0x200, %rsi            # imm = 0x200
      72:      	jne	0x30 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x30>
      74:      	incq	%rdx
      77:      	addq	$0x200, %rcx            # imm = 0x200
      7e:      	cmpq	%rax, %rdx
      81:      	jne	0x20 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x20>
      83:      	popq	%rbp
      84:      	retq
      85:      	leaq	(%rip), %rdi            # 0x8c <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x8c>
      8c:      	leaq	(%rip), %rcx            # 0x93 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x93>
      93:      	movl	$0x1b5, %esi            # imm = 0x1B5
      98:      	xorl	%edx, %edx
      9a:      	callq	0x9f <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x9f>

0000000000000000 <<toyos_crypto::mlkem::SharedSecret>::as_bytes>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	movq	%rdi, %rax
       7:      	popq	%rbp
       8:      	retq

0000000000000000 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r14
       6:      	pushq	%rbx
       7:      	subq	$0x200, %rsp            # imm = 0x200
       e:      	movq	%rdi, %rbx
      11:      	cmpq	$0x4a0, %rdx            # imm = 0x4A0
      18:      	jne	0xee <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0xee>
      1e:      	movq	%rsi, %r14
      21:      	leaq	-0x210(%rbp), %rdi
      28:      	movl	$0x180, %edx            # imm = 0x180
      2d:      	callq	0x32 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x32>
      32:      	movl	$0x6, %eax
      37:      	nopw	(%rax,%rax)
      40:      	cmpq	$0x206, %rax            # imm = 0x206
      46:      	je	0x102 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x102>
      4c:      	cmpw	$0xd00, -0x216(%rbp,%rax) # imm = 0xD00
      56:      	jg	0x80 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
      58:      	cmpw	$0xd00, -0x214(%rbp,%rax) # imm = 0xD00
      62:      	jg	0x80 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
      64:      	cmpw	$0xd00, -0x212(%rbp,%rax) # imm = 0xD00
      6e:      	jg	0x80 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
      70:      	cmpw	$0xd00, -0x210(%rbp,%rax) # imm = 0xD00
      7a:      	leaq	0x8(%rax), %rax
      7e:      	jle	0x40 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x40>
      80:      	movw	$0x201, (%rbx)          # imm = 0x201
      85:      	xorl	%eax, %eax
      87:      	nopw	(%rax,%rax)
      90:      	movw	$0x0, -0x210(%rbp,%rax)
      9a:      	movw	$0x0, -0x20e(%rbp,%rax)
      a4:      	movw	$0x0, -0x20c(%rbp,%rax)
      ae:      	movw	$0x0, -0x20a(%rbp,%rax)
      b8:      	movw	$0x0, -0x208(%rbp,%rax)
      c2:      	movw	$0x0, -0x206(%rbp,%rax)
      cc:      	movw	$0x0, -0x204(%rbp,%rax)
      d6:      	movw	$0x0, -0x202(%rbp,%rax)
      e0:      	addq	$0x10, %rax
      e4:      	cmpq	$0x200, %rax            # imm = 0x200
      ea:      	jne	0x90 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x90>
      ec:      	jmp	0xf3 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0xf3>
      ee:      	movw	$0x1, (%rbx)
      f3:      	movq	%rbx, %rax
      f6:      	addq	$0x200, %rsp            # imm = 0x200
      fd:      	popq	%rbx
      fe:      	popq	%r14
     100:      	popq	%rbp
     101:      	retq
     102:      	movl	$0xe, %eax
     107:      	nopw	(%rax,%rax)
     110:      	movw	$0x0, -0x21e(%rbp,%rax)
     11a:      	movw	$0x0, -0x21c(%rbp,%rax)
     124:      	movw	$0x0, -0x21a(%rbp,%rax)
     12e:      	movw	$0x0, -0x218(%rbp,%rax)
     138:      	movw	$0x0, -0x216(%rbp,%rax)
     142:      	movw	$0x0, -0x214(%rbp,%rax)
     14c:      	movw	$0x0, -0x212(%rbp,%rax)
     156:      	movw	$0x0, -0x210(%rbp,%rax)
     160:      	addq	$0x10, %rax
     164:      	cmpq	$0x20e, %rax            # imm = 0x20E
     16a:      	jne	0x110 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x110>
     16c:      	leaq	0x180(%r14), %rsi
     173:      	leaq	-0x210(%rbp), %rdi
     17a:      	movl	$0x180, %edx            # imm = 0x180
     17f:      	callq	0x184 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x184>
     184:      	movl	$0x6, %eax
     189:      	nopl	(%rax)
     190:      	cmpq	$0x206, %rax            # imm = 0x206
     196:      	je	0x1dd <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x1dd>
     198:      	cmpw	$0xd00, -0x216(%rbp,%rax) # imm = 0xD00
     1a2:      	jg	0x80 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
     1a8:      	cmpw	$0xd00, -0x214(%rbp,%rax) # imm = 0xD00
     1b2:      	jg	0x80 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
     1b8:      	cmpw	$0xd00, -0x212(%rbp,%rax) # imm = 0xD00
     1c2:      	jg	0x80 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
     1c8:      	cmpw	$0xd00, -0x210(%rbp,%rax) # imm = 0xD00
     1d2:      	leaq	0x8(%rax), %rax
     1d6:      	jle	0x190 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x190>
     1d8:      	jmp	0x80 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
     1dd:      	movl	$0xe, %eax
     1e2:      	nopw	%cs:(%rax,%rax)
     1f0:      	movw	$0x0, -0x21e(%rbp,%rax)
     1fa:      	movw	$0x0, -0x21c(%rbp,%rax)
     204:      	movw	$0x0, -0x21a(%rbp,%rax)
     20e:      	movw	$0x0, -0x218(%rbp,%rax)
     218:      	movw	$0x0, -0x216(%rbp,%rax)
     222:      	movw	$0x0, -0x214(%rbp,%rax)
     22c:      	movw	$0x0, -0x212(%rbp,%rax)
     236:      	movw	$0x0, -0x210(%rbp,%rax)
     240:      	addq	$0x10, %rax
     244:      	cmpq	$0x20e, %rax            # imm = 0x20E
     24a:      	jne	0x1f0 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x1f0>
     24c:      	leaq	0x300(%r14), %rsi
     253:      	leaq	-0x210(%rbp), %rdi
     25a:      	movl	$0x180, %edx            # imm = 0x180
     25f:      	callq	0x264 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x264>
     264:      	xorl	%eax, %eax
     266:      	cmpq	$0x200, %rax            # imm = 0x200
     26c:      	je	0x2b3 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2b3>
     26e:      	cmpw	$0xd00, -0x210(%rbp,%rax) # imm = 0xD00
     278:      	jg	0x80 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
     27e:      	cmpw	$0xd00, -0x20e(%rbp,%rax) # imm = 0xD00
     288:      	jg	0x80 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
     28e:      	cmpw	$0xd00, -0x20c(%rbp,%rax) # imm = 0xD00
     298:      	jg	0x80 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
     29e:      	cmpw	$0xd00, -0x20a(%rbp,%rax) # imm = 0xD00
     2a8:      	leaq	0x8(%rax), %rax
     2ac:      	jle	0x266 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x266>
     2ae:      	jmp	0x80 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
     2b3:      	xorl	%eax, %eax
     2b5:      	movw	$0x0, -0x210(%rbp,%rax)
     2bf:      	movw	$0x0, -0x20e(%rbp,%rax)
     2c9:      	movw	$0x0, -0x20c(%rbp,%rax)
     2d3:      	movw	$0x0, -0x20a(%rbp,%rax)
     2dd:      	movw	$0x0, -0x208(%rbp,%rax)
     2e7:      	movw	$0x0, -0x206(%rbp,%rax)
     2f1:      	movw	$0x0, -0x204(%rbp,%rax)
     2fb:      	movw	$0x0, -0x202(%rbp,%rax)
     305:      	addq	$0x10, %rax
     309:      	cmpq	$0x200, %rax            # imm = 0x200
     30f:      	jne	0x2b5 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2b5>
     311:      	leaq	0x1(%rbx), %rdi
     315:      	movl	$0x4a0, %edx            # imm = 0x4A0
     31a:      	movq	%r14, %rsi
     31d:      	callq	0x322 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x322>
     322:      	movb	$0x0, (%rbx)
     325:      	jmp	0xf3 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0xf3>

0000000000000000 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%r13
       a:      	pushq	%r12
       c:      	pushq	%rbx
       d:      	subq	$0x1000, %rsp           # imm = 0x1000
      14:      	movq	$0x0, (%rsp)
      1c:      	subq	$0xc88, %rsp            # imm = 0xC88
      23:      	movq	%rdx, -0x60(%rbp)
      27:      	movq	%rsi, %r15
      2a:      	movq	%rdi, -0x58(%rbp)
      2e:      	leaq	-0x1870(%rbp), %rax
      35:      	movq	%rax, -0x470(%rbp)
      3c:      	movq	$0x3, -0x468(%rbp)
      47:      	xorl	%r14d, %r14d
      4a:      	leaq	-0xa70(%rbp), %rdi
      51:      	movq	%rcx, -0x30(%rbp)
      55:      	movq	%rcx, %rsi
      58:      	xorl	%edx, %edx
      5a:      	callq	0x5f <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5f>
      5f:      	xorl	%r14d, %r14d
      62:      	leaq	-0x1cb0(%rbp), %rdi
      69:      	leaq	-0xa70(%rbp), %rsi
      70:      	callq	0x75 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x75>
      75:      	leaq	-0x270(%rbp), %rbx
      7c:      	leaq	-0x1cb0(%rbp), %rsi
      83:      	movl	$0x200, %edx            # imm = 0x200
      88:      	movq	%rbx, %rdi
      8b:      	callq	0x90 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x90>
      90:      	leaq	-0xc70(%rbp), %r14
      97:      	movl	$0x200, %edx            # imm = 0x200
      9c:      	movq	%r14, %rdi
      9f:      	movq	%rbx, %rsi
      a2:      	callq	0xa7 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa7>
      a7:      	leaq	-0x1270(%rbp), %rbx
      ae:      	movl	$0x200, %edx            # imm = 0x200
      b3:      	movq	%rbx, %rdi
      b6:      	movq	%r14, %rsi
      b9:      	callq	0xbe <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbe>
      be:      	leaq	-0x1870(%rbp), %rdi
      c5:      	movl	$0x200, %edx            # imm = 0x200
      ca:      	movq	%rbx, %rsi
      cd:      	callq	0xd2 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd2>
      d2:      	movl	$0x1, %r14d
      d8:      	leaq	-0xa70(%rbp), %rdi
      df:      	movq	-0x30(%rbp), %rsi
      e3:      	movl	$0x1, %edx
      e8:      	callq	0xed <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xed>
      ed:      	leaq	-0x1cb0(%rbp), %rdi
      f4:      	leaq	-0xa70(%rbp), %rsi
      fb:      	callq	0x100 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x100>
     100:      	leaq	-0x270(%rbp), %rbx
     107:      	leaq	-0x1cb0(%rbp), %rsi
     10e:      	movl	$0x200, %edx            # imm = 0x200
     113:      	movq	%rbx, %rdi
     116:      	callq	0x11b <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x11b>
     11b:      	leaq	-0xc70(%rbp), %r14
     122:      	movl	$0x200, %edx            # imm = 0x200
     127:      	movq	%r14, %rdi
     12a:      	movq	%rbx, %rsi
     12d:      	callq	0x132 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x132>
     132:      	leaq	-0x1270(%rbp), %rbx
     139:      	movl	$0x200, %edx            # imm = 0x200
     13e:      	movq	%rbx, %rdi
     141:      	movq	%r14, %rsi
     144:      	callq	0x149 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x149>
     149:      	leaq	-0x1670(%rbp), %rdi
     150:      	movl	$0x200, %edx            # imm = 0x200
     155:      	movq	%rbx, %rsi
     158:      	callq	0x15d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x15d>
     15d:      	movl	$0x2, %r14d
     163:      	leaq	-0xa70(%rbp), %rdi
     16a:      	movq	-0x30(%rbp), %rsi
     16e:      	movl	$0x2, %edx
     173:      	callq	0x178 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x178>
     178:      	leaq	-0x1cb0(%rbp), %rdi
     17f:      	leaq	-0xa70(%rbp), %rsi
     186:      	callq	0x18b <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x18b>
     18b:      	movq	%r15, -0x68(%rbp)
     18f:      	leaq	0x480(%r15), %r12
     196:      	leaq	-0x270(%rbp), %rbx
     19d:      	leaq	-0x1cb0(%rbp), %rsi
     1a4:      	movl	$0x200, %edx            # imm = 0x200
     1a9:      	movq	%rbx, %rdi
     1ac:      	callq	0x1b1 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1b1>
     1b1:      	leaq	-0xc70(%rbp), %r14
     1b8:      	movl	$0x200, %edx            # imm = 0x200
     1bd:      	movq	%r14, %rdi
     1c0:      	movq	%rbx, %rsi
     1c3:      	callq	0x1c8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1c8>
     1c8:      	leaq	-0x1270(%rbp), %r15
     1cf:      	movl	$0x200, %edx            # imm = 0x200
     1d4:      	movq	%r15, %rdi
     1d7:      	movq	%r14, %rsi
     1da:      	callq	0x1df <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1df>
     1df:      	leaq	-0x1470(%rbp), %rdi
     1e6:      	movl	$0x200, %edx            # imm = 0x200
     1eb:      	movq	%r15, %rsi
     1ee:      	callq	0x1f3 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1f3>
     1f3:      	leaq	-0x1270(%rbp), %rdi
     1fa:      	movl	$0x600, %edx            # imm = 0x600
     1ff:      	leaq	-0x1870(%rbp), %r14
     206:      	movq	%r14, %rsi
     209:      	callq	0x20e <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x20e>
     20e:      	leaq	-0x1cb0(%rbp), %rdi
     215:      	xorl	%r13d, %r13d
     218:      	movl	$0x440, %edx            # imm = 0x440
     21d:      	xorl	%esi, %esi
     21f:      	callq	0x224 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x224>
     224:      	movq	%r12, %rcx
     227:      	leaq	-0x470(%rbp), %rbx
     22e:      	leaq	-0xa70(%rbp), %rdx
     235:      	movq	%r12, -0x70(%rbp)
     239:      	nopl	(%rax)
     240:      	movq	%r13, -0x38(%rbp)
     244:      	movq	%r14, -0x50(%rbp)
     248:      	movq	$0x3, -0x48(%rbp)
     250:      	xorl	%r14d, %r14d
     253:      	leaq	-0x270(%rbp), %rdi
     25a:      	movq	%rdx, %r12
     25d:      	movq	%rcx, %r15
     260:      	movq	%rcx, %rsi
     263:      	xorl	%edx, %edx
     265:      	movq	%r13, %rcx
     268:      	callq	0x26d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x26d>
     26d:      	leaq	-0xc70(%rbp), %r13
     274:      	movl	$0x200, %edx            # imm = 0x200
     279:      	movq	%r13, %rdi
     27c:      	leaq	-0x270(%rbp), %rsi
     283:      	callq	0x288 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x288>
     288:      	movl	$0x200, %edx            # imm = 0x200
     28d:      	movq	%rbx, %rdi
     290:      	movq	%r13, %rsi
     293:      	callq	0x298 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x298>
     298:      	movl	$0x200, %edx            # imm = 0x200
     29d:      	movq	%r12, %rdi
     2a0:      	movq	%rbx, %rsi
     2a3:      	callq	0x2a8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x2a8>
     2a8:      	movl	$0x200, %edx            # imm = 0x200
     2ad:      	leaq	-0x1870(%rbp), %rdi
     2b4:      	movq	%r12, %rsi
     2b7:      	callq	0x2bc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x2bc>
     2bc:      	movl	$0x1, %r14d
     2c2:      	movl	$0x1, %edx
     2c7:      	leaq	-0x270(%rbp), %rdi
     2ce:      	movq	%r15, %rsi
     2d1:      	movq	-0x38(%rbp), %rcx
     2d5:      	callq	0x2da <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x2da>
     2da:      	movl	$0x200, %edx            # imm = 0x200
     2df:      	movq	%r13, %rdi
     2e2:      	leaq	-0x270(%rbp), %rsi
     2e9:      	callq	0x2ee <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x2ee>
     2ee:      	movl	$0x200, %edx            # imm = 0x200
     2f3:      	movq	%rbx, %rdi
     2f6:      	movq	%r13, %rsi
     2f9:      	callq	0x2fe <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x2fe>
     2fe:      	movl	$0x200, %edx            # imm = 0x200
     303:      	movq	%r12, %rdi
     306:      	movq	%rbx, %rsi
     309:      	callq	0x30e <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x30e>
     30e:      	movl	$0x200, %edx            # imm = 0x200
     313:      	leaq	-0x1670(%rbp), %rdi
     31a:      	movq	%r12, %rsi
     31d:      	callq	0x322 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x322>
     322:      	movl	$0x2, %r14d
     328:      	movl	$0x2, %edx
     32d:      	leaq	-0x270(%rbp), %rdi
     334:      	movq	%r15, %rsi
     337:      	movq	-0x38(%rbp), %rcx
     33b:      	callq	0x340 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x340>
     340:      	movl	$0x200, %edx            # imm = 0x200
     345:      	movq	%r13, %rdi
     348:      	leaq	-0x270(%rbp), %rsi
     34f:      	callq	0x354 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x354>
     354:      	movl	$0x200, %edx            # imm = 0x200
     359:      	movq	%rbx, %rdi
     35c:      	movq	%r13, %rsi
     35f:      	callq	0x364 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x364>
     364:      	movl	$0x200, %edx            # imm = 0x200
     369:      	movq	%r12, %rdi
     36c:      	movq	%rbx, %rsi
     36f:      	callq	0x374 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x374>
     374:      	movl	$0x200, %edx            # imm = 0x200
     379:      	leaq	-0x1470(%rbp), %rdi
     380:      	movq	%r12, %rsi
     383:      	callq	0x388 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x388>
     388:      	movl	$0x600, %edx            # imm = 0x600
     38d:      	movq	%r12, %rdi
     390:      	leaq	-0x1870(%rbp), %r15
     397:      	movq	%r15, %rsi
     39a:      	callq	0x39f <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x39f>
     39f:      	movq	%r15, %rdi
     3a2:      	movq	%r12, %r14
     3a5:      	movq	%r12, %rsi
     3a8:      	leaq	-0x1270(%rbp), %rdx
     3af:      	callq	0x3b4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3b4>
     3b4:      	leaq	-0x270(%rbp), %rbx
     3bb:      	movq	%rbx, %rdi
     3be:      	movq	%r15, %rsi
     3c1:      	callq	0x3c6 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3c6>
     3c6:      	movq	-0x38(%rbp), %rax
     3ca:      	addl	$0x3, %eax
     3cd:      	movzbl	%al, %edx
     3d0:      	movq	%r15, %rdi
     3d3:      	movq	-0x30(%rbp), %rsi
     3d7:      	callq	0x3dc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3dc>
     3dc:      	movq	%r13, %rdi
     3df:      	movq	%rbx, %rsi
     3e2:      	movq	%r15, %r12
     3e5:      	movq	%r15, %rdx
     3e8:      	callq	0x3ed <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3ed>
     3ed:      	movl	$0xa, %edx
     3f2:      	movq	%rbx, %rdi
     3f5:      	movq	%r13, %rsi
     3f8:      	callq	0x3fd <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3fd>
     3fd:      	movq	-0x38(%rbp), %r13
     401:      	leaq	(,%r13,4), %rax
     409:      	addq	%r13, %rax
     40c:      	shlq	$0x6, %rax
     410:      	leaq	(%rax,%rbp), %rsi
     414:      	addq	$-0x1cb0, %rsi          # imm = 0xE350
     41b:      	movl	$0x140, %edx            # imm = 0x140
     420:      	movq	%rbx, %rdi
     423:      	callq	0x428 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x428>
     428:      	incq	%r13
     42b:      	xorl	%eax, %eax
     42d:      	movq	-0x70(%rbp), %rcx
     431:      	leaq	-0x470(%rbp), %rbx
     438:      	movq	%r14, %rdx
     43b:      	nopl	(%rax,%rax)
     440:      	movw	$0x0, -0x270(%rbp,%rax)
     44a:      	movw	$0x0, -0x26e(%rbp,%rax)
     454:      	movw	$0x0, -0x26c(%rbp,%rax)
     45e:      	movw	$0x0, -0x26a(%rbp,%rax)
     468:      	movw	$0x0, -0x268(%rbp,%rax)
     472:      	movw	$0x0, -0x266(%rbp,%rax)
     47c:      	movw	$0x0, -0x264(%rbp,%rax)
     486:      	movw	$0x0, -0x262(%rbp,%rax)
     490:      	addq	$0x10, %rax
     494:      	cmpq	$0x200, %rax            # imm = 0x200
     49a:      	jne	0x440 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x440>
     49c:      	xorl	%eax, %eax
     49e:      	nop
     4a0:      	movw	$0x0, -0x1870(%rbp,%rax)
     4aa:      	movw	$0x0, -0x186e(%rbp,%rax)
     4b4:      	movw	$0x0, -0x186c(%rbp,%rax)
     4be:      	movw	$0x0, -0x186a(%rbp,%rax)
     4c8:      	movw	$0x0, -0x1868(%rbp,%rax)
     4d2:      	movw	$0x0, -0x1866(%rbp,%rax)
     4dc:      	movw	$0x0, -0x1864(%rbp,%rax)
     4e6:      	movw	$0x0, -0x1862(%rbp,%rax)
     4f0:      	addq	$0x10, %rax
     4f4:      	cmpq	$0x200, %rax            # imm = 0x200
     4fa:      	jne	0x4a0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4a0>
     4fc:      	xorl	%eax, %eax
     4fe:      	nop
     500:      	movw	$0x0, -0xa70(%rbp,%rax)
     50a:      	movw	$0x0, -0xa6e(%rbp,%rax)
     514:      	movw	$0x0, -0xa6c(%rbp,%rax)
     51e:      	movw	$0x0, -0xa6a(%rbp,%rax)
     528:      	movw	$0x0, -0xa68(%rbp,%rax)
     532:      	movw	$0x0, -0xa66(%rbp,%rax)
     53c:      	movw	$0x0, -0xa64(%rbp,%rax)
     546:      	movw	$0x0, -0xa62(%rbp,%rax)
     550:      	addq	$0x10, %rax
     554:      	cmpq	$0x200, %rax            # imm = 0x200
     55a:      	jne	0x500 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x500>
     55c:      	xorl	%eax, %eax
     55e:      	movq	%r12, %r14
     561:      	nopw	%cs:(%rax,%rax)
     570:      	movw	$0x0, -0x870(%rbp,%rax)
     57a:      	movw	$0x0, -0x86e(%rbp,%rax)
     584:      	movw	$0x0, -0x86c(%rbp,%rax)
     58e:      	movw	$0x0, -0x86a(%rbp,%rax)
     598:      	movw	$0x0, -0x868(%rbp,%rax)
     5a2:      	movw	$0x0, -0x866(%rbp,%rax)
     5ac:      	movw	$0x0, -0x864(%rbp,%rax)
     5b6:      	movw	$0x0, -0x862(%rbp,%rax)
     5c0:      	addq	$0x10, %rax
     5c4:      	cmpq	$0x200, %rax            # imm = 0x200
     5ca:      	jne	0x570 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x570>
     5cc:      	xorl	%eax, %eax
     5ce:      	nop
     5d0:      	movw	$0x0, -0x670(%rbp,%rax)
     5da:      	movw	$0x0, -0x66e(%rbp,%rax)
     5e4:      	movw	$0x0, -0x66c(%rbp,%rax)
     5ee:      	movw	$0x0, -0x66a(%rbp,%rax)
     5f8:      	movw	$0x0, -0x668(%rbp,%rax)
     602:      	movw	$0x0, -0x666(%rbp,%rax)
     60c:      	movw	$0x0, -0x664(%rbp,%rax)
     616:      	movw	$0x0, -0x662(%rbp,%rax)
     620:      	addq	$0x10, %rax
     624:      	cmpq	$0x200, %rax            # imm = 0x200
     62a:      	jne	0x5d0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5d0>
     62c:      	cmpq	$0x3, %r13
     630:      	jne	0x240 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x240>
     636:      	movq	%r14, -0x50(%rbp)
     63a:      	movq	$0x3, -0x48(%rbp)
     642:      	xorl	%r14d, %r14d
     645:      	leaq	-0x270(%rbp), %rdi
     64c:      	movl	$0x180, %edx            # imm = 0x180
     651:      	movq	-0x68(%rbp), %r12
     655:      	movq	%r12, %rsi
     658:      	callq	0x65d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x65d>
     65d:      	leaq	-0xc70(%rbp), %r14
     664:      	leaq	-0x270(%rbp), %rbx
     66b:      	movl	$0x200, %edx            # imm = 0x200
     670:      	movq	%r14, %rdi
     673:      	movq	%rbx, %rsi
     676:      	callq	0x67b <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x67b>
     67b:      	leaq	-0x470(%rbp), %r15
     682:      	movl	$0x200, %edx            # imm = 0x200
     687:      	movq	%r15, %rdi
     68a:      	movq	%r14, %rsi
     68d:      	callq	0x692 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x692>
     692:      	leaq	-0xa70(%rbp), %r14
     699:      	movl	$0x200, %edx            # imm = 0x200
     69e:      	movq	%r14, %rdi
     6a1:      	movq	%r15, %rsi
     6a4:      	callq	0x6a9 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x6a9>
     6a9:      	leaq	-0x1870(%rbp), %rdi
     6b0:      	movl	$0x200, %edx            # imm = 0x200
     6b5:      	movq	%r14, %rsi
     6b8:      	callq	0x6bd <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x6bd>
     6bd:      	leaq	0x180(%r12), %rsi
     6c5:      	movl	$0x1, %r14d
     6cb:      	movl	$0x180, %edx            # imm = 0x180
     6d0:      	movq	%rbx, %rdi
     6d3:      	callq	0x6d8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x6d8>
     6d8:      	leaq	-0xc70(%rbp), %r14
     6df:      	movl	$0x200, %edx            # imm = 0x200
     6e4:      	movq	%r14, %rdi
     6e7:      	movq	%rbx, %rsi
     6ea:      	callq	0x6ef <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x6ef>
     6ef:      	movl	$0x200, %edx            # imm = 0x200
     6f4:      	movq	%r15, %rdi
     6f7:      	movq	%r14, %rsi
     6fa:      	callq	0x6ff <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x6ff>
     6ff:      	leaq	-0xa70(%rbp), %r14
     706:      	movl	$0x200, %edx            # imm = 0x200
     70b:      	movq	%r14, %rdi
     70e:      	movq	%r15, %rsi
     711:      	callq	0x716 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x716>
     716:      	leaq	-0x1670(%rbp), %rdi
     71d:      	movl	$0x200, %edx            # imm = 0x200
     722:      	movq	%r14, %rsi
     725:      	callq	0x72a <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x72a>
     72a:      	addq	$0x300, %r12            # imm = 0x300
     731:      	movl	$0x2, %r14d
     737:      	movl	$0x180, %edx            # imm = 0x180
     73c:      	movq	%rbx, %rdi
     73f:      	movq	%r12, %rsi
     742:      	callq	0x747 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x747>
     747:      	leaq	-0xc70(%rbp), %rbx
     74e:      	leaq	-0x270(%rbp), %rsi
     755:      	movl	$0x200, %edx            # imm = 0x200
     75a:      	movq	%rbx, %rdi
     75d:      	callq	0x762 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x762>
     762:      	leaq	-0x470(%rbp), %r14
     769:      	movl	$0x200, %edx            # imm = 0x200
     76e:      	movq	%r14, %rdi
     771:      	movq	%rbx, %rsi
     774:      	callq	0x779 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x779>
     779:      	leaq	-0xa70(%rbp), %rbx
     780:      	movl	$0x200, %edx            # imm = 0x200
     785:      	movq	%rbx, %rdi
     788:      	movq	%r14, %rsi
     78b:      	callq	0x790 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x790>
     790:      	leaq	-0x1470(%rbp), %rdi
     797:      	movl	$0x200, %edx            # imm = 0x200
     79c:      	movq	%rbx, %rsi
     79f:      	callq	0x7a4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7a4>
     7a4:      	leaq	-0x1870(%rbp), %rsi
     7ab:      	movl	$0x600, %edx            # imm = 0x600
     7b0:      	movq	%rbx, %rdi
     7b3:      	callq	0x7b8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7b8>
     7b8:      	leaq	-0x1870(%rbp), %rdi
     7bf:      	leaq	-0x1270(%rbp), %rdx
     7c6:      	movq	%rbx, %rsi
     7c9:      	callq	0x7ce <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7ce>
     7ce:      	leaq	-0x270(%rbp), %rdi
     7d5:      	leaq	-0x1870(%rbp), %rsi
     7dc:      	callq	0x7e1 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7e1>
     7e1:      	leaq	-0xc70(%rbp), %rdi
     7e8:      	movq	-0x30(%rbp), %rsi
     7ec:      	movl	$0x6, %edx
     7f1:      	callq	0x7f6 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7f6>
     7f6:      	leaq	-0x470(%rbp), %rdi
     7fd:      	leaq	-0x270(%rbp), %rsi
     804:      	leaq	-0xc70(%rbp), %rdx
     80b:      	callq	0x810 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x810>
     810:      	leaq	-0x1870(%rbp), %rdi
     817:      	movl	$0x20, %edx
     81c:      	movq	-0x60(%rbp), %rsi
     820:      	callq	0x825 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x825>
     825:      	movl	$0x2, %ecx
     82a:      	movl	$0xd01, %esi            # imm = 0xD01
     82f:      	nop
     830:      	movswl	-0x1872(%rbp,%rcx), %eax
     838:      	mull	%esi
     83a:      	jo	0xc71 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc71>
     840:      	incl	%eax
     842:      	shrl	%eax
     844:      	movw	%ax, -0x1872(%rbp,%rcx)
     84c:      	movswl	-0x1870(%rbp,%rcx), %eax
     854:      	mull	%esi
     856:      	jo	0xc71 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc71>
     85c:      	incl	%eax
     85e:      	shrl	%eax
     860:      	movw	%ax, -0x1870(%rbp,%rcx)
     868:      	addq	$0x4, %rcx
     86c:      	cmpq	$0x202, %rcx            # imm = 0x202
     873:      	jne	0x830 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x830>
     875:      	leaq	-0x270(%rbp), %rbx
     87c:      	leaq	-0x1870(%rbp), %rsi
     883:      	movl	$0x200, %edx            # imm = 0x200
     888:      	movq	%rbx, %rdi
     88b:      	callq	0x890 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x890>
     890:      	leaq	-0x1870(%rbp), %rdi
     897:      	leaq	-0x470(%rbp), %rsi
     89e:      	movq	%rbx, %rdx
     8a1:      	callq	0x8a6 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x8a6>
     8a6:      	leaq	-0x470(%rbp), %rdi
     8ad:      	leaq	-0x1870(%rbp), %rsi
     8b4:      	movl	$0x4, %edx
     8b9:      	callq	0x8be <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x8be>
     8be:      	leaq	-0x18f0(%rbp), %rsi
     8c5:      	leaq	-0x470(%rbp), %rdi
     8cc:      	movl	$0x80, %edx
     8d1:      	callq	0x8d6 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x8d6>
     8d6:      	movq	-0x58(%rbp), %rbx
     8da:      	xorl	%eax, %eax
     8dc:      	nopl	(%rax)
     8e0:      	movw	$0x0, -0x470(%rbp,%rax)
     8ea:      	movw	$0x0, -0x46e(%rbp,%rax)
     8f4:      	movw	$0x0, -0x46c(%rbp,%rax)
     8fe:      	movw	$0x0, -0x46a(%rbp,%rax)
     908:      	movw	$0x0, -0x468(%rbp,%rax)
     912:      	movw	$0x0, -0x466(%rbp,%rax)
     91c:      	movw	$0x0, -0x464(%rbp,%rax)
     926:      	movw	$0x0, -0x462(%rbp,%rax)
     930:      	addq	$0x10, %rax
     934:      	cmpq	$0x200, %rax            # imm = 0x200
     93a:      	jne	0x8e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x8e0>
     93c:      	xorl	%eax, %eax
     93e:      	nop
     940:      	movw	$0x0, -0x270(%rbp,%rax)
     94a:      	movw	$0x0, -0x26e(%rbp,%rax)
     954:      	movw	$0x0, -0x26c(%rbp,%rax)
     95e:      	movw	$0x0, -0x26a(%rbp,%rax)
     968:      	movw	$0x0, -0x268(%rbp,%rax)
     972:      	movw	$0x0, -0x266(%rbp,%rax)
     97c:      	movw	$0x0, -0x264(%rbp,%rax)
     986:      	movw	$0x0, -0x262(%rbp,%rax)
     990:      	addq	$0x10, %rax
     994:      	cmpq	$0x200, %rax            # imm = 0x200
     99a:      	jne	0x940 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x940>
     99c:      	xorl	%eax, %eax
     99e:      	nop
     9a0:      	movw	$0x0, -0xc70(%rbp,%rax)
     9aa:      	movw	$0x0, -0xc6e(%rbp,%rax)
     9b4:      	movw	$0x0, -0xc6c(%rbp,%rax)
     9be:      	movw	$0x0, -0xc6a(%rbp,%rax)
     9c8:      	movw	$0x0, -0xc68(%rbp,%rax)
     9d2:      	movw	$0x0, -0xc66(%rbp,%rax)
     9dc:      	movw	$0x0, -0xc64(%rbp,%rax)
     9e6:      	movw	$0x0, -0xc62(%rbp,%rax)
     9f0:      	addq	$0x10, %rax
     9f4:      	cmpq	$0x200, %rax            # imm = 0x200
     9fa:      	jne	0x9a0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9a0>
     9fc:      	leaq	-0x1cb0(%rbp), %rsi
     a03:      	movl	$0x440, %edx            # imm = 0x440
     a08:      	movq	%rbx, %rdi
     a0b:      	callq	0xa10 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa10>
     a10:      	xorl	%eax, %eax
     a12:      	nopw	%cs:(%rax,%rax)
     a20:      	movw	$0x0, -0xa70(%rbp,%rax)
     a2a:      	movw	$0x0, -0xa6e(%rbp,%rax)
     a34:      	movw	$0x0, -0xa6c(%rbp,%rax)
     a3e:      	movw	$0x0, -0xa6a(%rbp,%rax)
     a48:      	movw	$0x0, -0xa68(%rbp,%rax)
     a52:      	movw	$0x0, -0xa66(%rbp,%rax)
     a5c:      	movw	$0x0, -0xa64(%rbp,%rax)
     a66:      	movw	$0x0, -0xa62(%rbp,%rax)
     a70:      	addq	$0x10, %rax
     a74:      	cmpq	$0x200, %rax            # imm = 0x200
     a7a:      	jne	0xa20 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa20>
     a7c:      	xorl	%eax, %eax
     a7e:      	nop
     a80:      	movw	$0x0, -0x870(%rbp,%rax)
     a8a:      	movw	$0x0, -0x86e(%rbp,%rax)
     a94:      	movw	$0x0, -0x86c(%rbp,%rax)
     a9e:      	movw	$0x0, -0x86a(%rbp,%rax)
     aa8:      	movw	$0x0, -0x868(%rbp,%rax)
     ab2:      	movw	$0x0, -0x866(%rbp,%rax)
     abc:      	movw	$0x0, -0x864(%rbp,%rax)
     ac6:      	movw	$0x0, -0x862(%rbp,%rax)
     ad0:      	addq	$0x10, %rax
     ad4:      	cmpq	$0x200, %rax            # imm = 0x200
     ada:      	jne	0xa80 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa80>
     adc:      	xorl	%eax, %eax
     ade:      	nop
     ae0:      	movw	$0x0, -0x670(%rbp,%rax)
     aea:      	movw	$0x0, -0x66e(%rbp,%rax)
     af4:      	movw	$0x0, -0x66c(%rbp,%rax)
     afe:      	movw	$0x0, -0x66a(%rbp,%rax)
     b08:      	movw	$0x0, -0x668(%rbp,%rax)
     b12:      	movw	$0x0, -0x666(%rbp,%rax)
     b1c:      	movw	$0x0, -0x664(%rbp,%rax)
     b26:      	movw	$0x0, -0x662(%rbp,%rax)
     b30:      	addq	$0x10, %rax
     b34:      	cmpq	$0x200, %rax            # imm = 0x200
     b3a:      	jne	0xae0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xae0>
     b3c:      	xorl	%eax, %eax
     b3e:      	nop
     b40:      	movw	$0x0, -0x1270(%rbp,%rax)
     b4a:      	movw	$0x0, -0x126e(%rbp,%rax)
     b54:      	movw	$0x0, -0x126c(%rbp,%rax)
     b5e:      	movw	$0x0, -0x126a(%rbp,%rax)
     b68:      	movw	$0x0, -0x1268(%rbp,%rax)
     b72:      	movw	$0x0, -0x1266(%rbp,%rax)
     b7c:      	movw	$0x0, -0x1264(%rbp,%rax)
     b86:      	movw	$0x0, -0x1262(%rbp,%rax)
     b90:      	addq	$0x10, %rax
     b94:      	cmpq	$0x200, %rax            # imm = 0x200
     b9a:      	jne	0xb40 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb40>
     b9c:      	xorl	%eax, %eax
     b9e:      	nop
     ba0:      	movw	$0x0, -0x1070(%rbp,%rax)
     baa:      	movw	$0x0, -0x106e(%rbp,%rax)
     bb4:      	movw	$0x0, -0x106c(%rbp,%rax)
     bbe:      	movw	$0x0, -0x106a(%rbp,%rax)
     bc8:      	movw	$0x0, -0x1068(%rbp,%rax)
     bd2:      	movw	$0x0, -0x1066(%rbp,%rax)
     bdc:      	movw	$0x0, -0x1064(%rbp,%rax)
     be6:      	movw	$0x0, -0x1062(%rbp,%rax)
     bf0:      	addq	$0x10, %rax
     bf4:      	cmpq	$0x200, %rax            # imm = 0x200
     bfa:      	jne	0xba0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xba0>
     bfc:      	xorl	%eax, %eax
     bfe:      	nop
     c00:      	movw	$0x0, -0xe70(%rbp,%rax)
     c0a:      	movw	$0x0, -0xe6e(%rbp,%rax)
     c14:      	movw	$0x0, -0xe6c(%rbp,%rax)
     c1e:      	movw	$0x0, -0xe6a(%rbp,%rax)
     c28:      	movw	$0x0, -0xe68(%rbp,%rax)
     c32:      	movw	$0x0, -0xe66(%rbp,%rax)
     c3c:      	movw	$0x0, -0xe64(%rbp,%rax)
     c46:      	movw	$0x0, -0xe62(%rbp,%rax)
     c50:      	addq	$0x10, %rax
     c54:      	cmpq	$0x200, %rax            # imm = 0x200
     c5a:      	jne	0xc00 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc00>
     c5c:      	movq	%rbx, %rax
     c5f:      	addq	$0x1c88, %rsp           # imm = 0x1C88
     c66:      	popq	%rbx
     c67:      	popq	%r12
     c69:      	popq	%r13
     c6b:      	popq	%r14
     c6d:      	popq	%r15
     c6f:      	popq	%rbp
     c70:      	retq
     c71:      	leaq	(%rip), %rdi            # 0xc78 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc78>
     c78:      	callq	0xc7d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc7d>
     c7d:      	ud2
     c7f:      	movq	%rax, %rbx
     c82:      	xorl	%eax, %eax
     c84:      	nopw	%cs:(%rax,%rax)
     c90:      	movw	$0x0, -0x470(%rbp,%rax)
     c9a:      	movw	$0x0, -0x46e(%rbp,%rax)
     ca4:      	movw	$0x0, -0x46c(%rbp,%rax)
     cae:      	movw	$0x0, -0x46a(%rbp,%rax)
     cb8:      	movw	$0x0, -0x468(%rbp,%rax)
     cc2:      	movw	$0x0, -0x466(%rbp,%rax)
     ccc:      	movw	$0x0, -0x464(%rbp,%rax)
     cd6:      	movw	$0x0, -0x462(%rbp,%rax)
     ce0:      	addq	$0x10, %rax
     ce4:      	cmpq	$0x200, %rax            # imm = 0x200
     cea:      	jne	0xc90 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc90>
     cec:      	jmp	0xd74 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd74>
     cf1:      	movq	%rax, %rbx
     cf4:      	jmp	0xf5c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xf5c>
     cf9:      	movq	%rax, %rbx
     cfc:      	jmp	0xfbc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xfbc>
     d01:      	movq	%rax, %rbx
     d04:      	xorl	%eax, %eax
     d06:      	nopw	%cs:(%rax,%rax)
     d10:      	movw	$0x0, -0x270(%rbp,%rax)
     d1a:      	movw	$0x0, -0x26e(%rbp,%rax)
     d24:      	movw	$0x0, -0x26c(%rbp,%rax)
     d2e:      	movw	$0x0, -0x26a(%rbp,%rax)
     d38:      	movw	$0x0, -0x268(%rbp,%rax)
     d42:      	movw	$0x0, -0x266(%rbp,%rax)
     d4c:      	movw	$0x0, -0x264(%rbp,%rax)
     d56:      	movw	$0x0, -0x262(%rbp,%rax)
     d60:      	addq	$0x10, %rax
     d64:      	cmpq	$0x200, %rax            # imm = 0x200
     d6a:      	jne	0xd10 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd10>
     d6c:      	jmp	0x101c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x101c>
     d71:      	movq	%rax, %rbx
     d74:      	xorl	%eax, %eax
     d76:      	nopw	%cs:(%rax,%rax)
     d80:      	movw	$0x0, -0x270(%rbp,%rax)
     d8a:      	movw	$0x0, -0x26e(%rbp,%rax)
     d94:      	movw	$0x0, -0x26c(%rbp,%rax)
     d9e:      	movw	$0x0, -0x26a(%rbp,%rax)
     da8:      	movw	$0x0, -0x268(%rbp,%rax)
     db2:      	movw	$0x0, -0x266(%rbp,%rax)
     dbc:      	movw	$0x0, -0x264(%rbp,%rax)
     dc6:      	movw	$0x0, -0x262(%rbp,%rax)
     dd0:      	addq	$0x10, %rax
     dd4:      	cmpq	$0x200, %rax            # imm = 0x200
     dda:      	jne	0xd80 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd80>
     ddc:      	jmp	0xfbc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xfbc>
     de1:      	movq	%rax, %rbx
     de4:      	jmp	0x101c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x101c>
     de9:      	jmp	0x12ce <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12ce>
     dee:      	movq	%rax, %rbx
     df1:      	movq	%r14, -0x460(%rbp)
     df8:      	leaq	-0x470(%rbp), %rdi
     dff:      	callq	0xe04 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xe04>
     e04:      	movq	%rbx, %rdi
     e07:      	callq	0xe0c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xe0c>
     e0c:      	movq	%rax, %rbx
     e0f:      	xorl	%eax, %eax
     e11:      	nopw	%cs:(%rax,%rax)
     e20:      	movw	$0x0, -0x270(%rbp,%rax)
     e2a:      	movw	$0x0, -0x26e(%rbp,%rax)
     e34:      	movw	$0x0, -0x26c(%rbp,%rax)
     e3e:      	movw	$0x0, -0x26a(%rbp,%rax)
     e48:      	movw	$0x0, -0x268(%rbp,%rax)
     e52:      	movw	$0x0, -0x266(%rbp,%rax)
     e5c:      	movw	$0x0, -0x264(%rbp,%rax)
     e66:      	movw	$0x0, -0x262(%rbp,%rax)
     e70:      	addq	$0x10, %rax
     e74:      	cmpq	$0x200, %rax            # imm = 0x200
     e7a:      	jne	0xe20 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xe20>
     e7c:      	jmp	0x11ac <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x11ac>
     e81:      	movq	%rax, %rbx
     e84:      	xorl	%eax, %eax
     e86:      	nopw	%cs:(%rax,%rax)
     e90:      	movw	$0x0, -0x270(%rbp,%rax)
     e9a:      	movw	$0x0, -0x26e(%rbp,%rax)
     ea4:      	movw	$0x0, -0x26c(%rbp,%rax)
     eae:      	movw	$0x0, -0x26a(%rbp,%rax)
     eb8:      	movw	$0x0, -0x268(%rbp,%rax)
     ec2:      	movw	$0x0, -0x266(%rbp,%rax)
     ecc:      	movw	$0x0, -0x264(%rbp,%rax)
     ed6:      	movw	$0x0, -0x262(%rbp,%rax)
     ee0:      	addq	$0x10, %rax
     ee4:      	cmpq	$0x200, %rax            # imm = 0x200
     eea:      	jne	0xe90 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xe90>
     eec:      	jmp	0x1149 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1149>
     ef1:      	movq	%rax, %rbx
     ef4:      	xorl	%eax, %eax
     ef6:      	nopw	%cs:(%rax,%rax)
     f00:      	movw	$0x0, -0x1870(%rbp,%rax)
     f0a:      	movw	$0x0, -0x186e(%rbp,%rax)
     f14:      	movw	$0x0, -0x186c(%rbp,%rax)
     f1e:      	movw	$0x0, -0x186a(%rbp,%rax)
     f28:      	movw	$0x0, -0x1868(%rbp,%rax)
     f32:      	movw	$0x0, -0x1866(%rbp,%rax)
     f3c:      	movw	$0x0, -0x1864(%rbp,%rax)
     f46:      	movw	$0x0, -0x1862(%rbp,%rax)
     f50:      	addq	$0x10, %rax
     f54:      	cmpq	$0x200, %rax            # imm = 0x200
     f5a:      	jne	0xf00 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xf00>
     f5c:      	xorl	%eax, %eax
     f5e:      	nop
     f60:      	movw	$0x0, -0x470(%rbp,%rax)
     f6a:      	movw	$0x0, -0x46e(%rbp,%rax)
     f74:      	movw	$0x0, -0x46c(%rbp,%rax)
     f7e:      	movw	$0x0, -0x46a(%rbp,%rax)
     f88:      	movw	$0x0, -0x468(%rbp,%rax)
     f92:      	movw	$0x0, -0x466(%rbp,%rax)
     f9c:      	movw	$0x0, -0x464(%rbp,%rax)
     fa6:      	movw	$0x0, -0x462(%rbp,%rax)
     fb0:      	addq	$0x10, %rax
     fb4:      	cmpq	$0x200, %rax            # imm = 0x200
     fba:      	jne	0xf60 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xf60>
     fbc:      	xorl	%eax, %eax
     fbe:      	nop
     fc0:      	movw	$0x0, -0xc70(%rbp,%rax)
     fca:      	movw	$0x0, -0xc6e(%rbp,%rax)
     fd4:      	movw	$0x0, -0xc6c(%rbp,%rax)
     fde:      	movw	$0x0, -0xc6a(%rbp,%rax)
     fe8:      	movw	$0x0, -0xc68(%rbp,%rax)
     ff2:      	movw	$0x0, -0xc66(%rbp,%rax)
     ffc:      	movw	$0x0, -0xc64(%rbp,%rax)
    1006:      	movw	$0x0, -0xc62(%rbp,%rax)
    1010:      	addq	$0x10, %rax
    1014:      	cmpq	$0x200, %rax            # imm = 0x200
    101a:      	jne	0xfc0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xfc0>
    101c:      	xorl	%eax, %eax
    101e:      	nop
    1020:      	movw	$0x0, -0xa70(%rbp,%rax)
    102a:      	movw	$0x0, -0xa6e(%rbp,%rax)
    1034:      	movw	$0x0, -0xa6c(%rbp,%rax)
    103e:      	movw	$0x0, -0xa6a(%rbp,%rax)
    1048:      	movw	$0x0, -0xa68(%rbp,%rax)
    1052:      	movw	$0x0, -0xa66(%rbp,%rax)
    105c:      	movw	$0x0, -0xa64(%rbp,%rax)
    1066:      	movw	$0x0, -0xa62(%rbp,%rax)
    1070:      	addq	$0x10, %rax
    1074:      	cmpq	$0x200, %rax            # imm = 0x200
    107a:      	jne	0x1020 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1020>
    107c:      	xorl	%eax, %eax
    107e:      	nop
    1080:      	movw	$0x0, -0x870(%rbp,%rax)
    108a:      	movw	$0x0, -0x86e(%rbp,%rax)
    1094:      	movw	$0x0, -0x86c(%rbp,%rax)
    109e:      	movw	$0x0, -0x86a(%rbp,%rax)
    10a8:      	movw	$0x0, -0x868(%rbp,%rax)
    10b2:      	movw	$0x0, -0x866(%rbp,%rax)
    10bc:      	movw	$0x0, -0x864(%rbp,%rax)
    10c6:      	movw	$0x0, -0x862(%rbp,%rax)
    10d0:      	addq	$0x10, %rax
    10d4:      	cmpq	$0x200, %rax            # imm = 0x200
    10da:      	jne	0x1080 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1080>
    10dc:      	xorl	%eax, %eax
    10de:      	nop
    10e0:      	movw	$0x0, -0x670(%rbp,%rax)
    10ea:      	movw	$0x0, -0x66e(%rbp,%rax)
    10f4:      	movw	$0x0, -0x66c(%rbp,%rax)
    10fe:      	movw	$0x0, -0x66a(%rbp,%rax)
    1108:      	movw	$0x0, -0x668(%rbp,%rax)
    1112:      	movw	$0x0, -0x666(%rbp,%rax)
    111c:      	movw	$0x0, -0x664(%rbp,%rax)
    1126:      	movw	$0x0, -0x662(%rbp,%rax)
    1130:      	addq	$0x10, %rax
    1134:      	cmpq	$0x200, %rax            # imm = 0x200
    113a:      	jne	0x10e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x10e0>
    113c:      	jmp	0x12cc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12cc>
    1141:      	movq	%rax, %rbx
    1144:      	jmp	0x11ac <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x11ac>
    1146:      	movq	%rax, %rbx
    1149:      	xorl	%eax, %eax
    114b:      	nopl	(%rax,%rax)
    1150:      	movw	$0x0, -0x1870(%rbp,%rax)
    115a:      	movw	$0x0, -0x186e(%rbp,%rax)
    1164:      	movw	$0x0, -0x186c(%rbp,%rax)
    116e:      	movw	$0x0, -0x186a(%rbp,%rax)
    1178:      	movw	$0x0, -0x1868(%rbp,%rax)
    1182:      	movw	$0x0, -0x1866(%rbp,%rax)
    118c:      	movw	$0x0, -0x1864(%rbp,%rax)
    1196:      	movw	$0x0, -0x1862(%rbp,%rax)
    11a0:      	addq	$0x10, %rax
    11a4:      	cmpq	$0x200, %rax            # imm = 0x200
    11aa:      	jne	0x1150 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1150>
    11ac:      	xorl	%eax, %eax
    11ae:      	nop
    11b0:      	movw	$0x0, -0xa70(%rbp,%rax)
    11ba:      	movw	$0x0, -0xa6e(%rbp,%rax)
    11c4:      	movw	$0x0, -0xa6c(%rbp,%rax)
    11ce:      	movw	$0x0, -0xa6a(%rbp,%rax)
    11d8:      	movw	$0x0, -0xa68(%rbp,%rax)
    11e2:      	movw	$0x0, -0xa66(%rbp,%rax)
    11ec:      	movw	$0x0, -0xa64(%rbp,%rax)
    11f6:      	movw	$0x0, -0xa62(%rbp,%rax)
    1200:      	addq	$0x10, %rax
    1204:      	cmpq	$0x200, %rax            # imm = 0x200
    120a:      	jne	0x11b0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x11b0>
    120c:      	xorl	%eax, %eax
    120e:      	nop
    1210:      	movw	$0x0, -0x870(%rbp,%rax)
    121a:      	movw	$0x0, -0x86e(%rbp,%rax)
    1224:      	movw	$0x0, -0x86c(%rbp,%rax)
    122e:      	movw	$0x0, -0x86a(%rbp,%rax)
    1238:      	movw	$0x0, -0x868(%rbp,%rax)
    1242:      	movw	$0x0, -0x866(%rbp,%rax)
    124c:      	movw	$0x0, -0x864(%rbp,%rax)
    1256:      	movw	$0x0, -0x862(%rbp,%rax)
    1260:      	addq	$0x10, %rax
    1264:      	cmpq	$0x200, %rax            # imm = 0x200
    126a:      	jne	0x1210 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1210>
    126c:      	xorl	%eax, %eax
    126e:      	nop
    1270:      	movw	$0x0, -0x670(%rbp,%rax)
    127a:      	movw	$0x0, -0x66e(%rbp,%rax)
    1284:      	movw	$0x0, -0x66c(%rbp,%rax)
    128e:      	movw	$0x0, -0x66a(%rbp,%rax)
    1298:      	movw	$0x0, -0x668(%rbp,%rax)
    12a2:      	movw	$0x0, -0x666(%rbp,%rax)
    12ac:      	movw	$0x0, -0x664(%rbp,%rax)
    12b6:      	movw	$0x0, -0x662(%rbp,%rax)
    12c0:      	addq	$0x10, %rax
    12c4:      	cmpq	$0x200, %rax            # imm = 0x200
    12ca:      	jne	0x1270 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1270>
    12cc:      	jmp	0x12de <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12de>
    12ce:      	movq	%rax, %rbx
    12d1:      	movq	%r14, -0x40(%rbp)
    12d5:      	leaq	-0x50(%rbp), %rdi
    12d9:      	callq	0x12de <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12de>
    12de:      	xorl	%eax, %eax
    12e0:      	movw	$0x0, -0x1270(%rbp,%rax)
    12ea:      	movw	$0x0, -0x126e(%rbp,%rax)
    12f4:      	movw	$0x0, -0x126c(%rbp,%rax)
    12fe:      	movw	$0x0, -0x126a(%rbp,%rax)
    1308:      	movw	$0x0, -0x1268(%rbp,%rax)
    1312:      	movw	$0x0, -0x1266(%rbp,%rax)
    131c:      	movw	$0x0, -0x1264(%rbp,%rax)
    1326:      	movw	$0x0, -0x1262(%rbp,%rax)
    1330:      	addq	$0x10, %rax
    1334:      	cmpq	$0x200, %rax            # imm = 0x200
    133a:      	jne	0x12e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12e0>
    133c:      	xorl	%eax, %eax
    133e:      	nop
    1340:      	movw	$0x0, -0x1070(%rbp,%rax)
    134a:      	movw	$0x0, -0x106e(%rbp,%rax)
    1354:      	movw	$0x0, -0x106c(%rbp,%rax)
    135e:      	movw	$0x0, -0x106a(%rbp,%rax)
    1368:      	movw	$0x0, -0x1068(%rbp,%rax)
    1372:      	movw	$0x0, -0x1066(%rbp,%rax)
    137c:      	movw	$0x0, -0x1064(%rbp,%rax)
    1386:      	movw	$0x0, -0x1062(%rbp,%rax)
    1390:      	addq	$0x10, %rax
    1394:      	cmpq	$0x200, %rax            # imm = 0x200
    139a:      	jne	0x1340 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1340>
    139c:      	xorl	%eax, %eax
    139e:      	nop
    13a0:      	movw	$0x0, -0xe70(%rbp,%rax)
    13aa:      	movw	$0x0, -0xe6e(%rbp,%rax)
    13b4:      	movw	$0x0, -0xe6c(%rbp,%rax)
    13be:      	movw	$0x0, -0xe6a(%rbp,%rax)
    13c8:      	movw	$0x0, -0xe68(%rbp,%rax)
    13d2:      	movw	$0x0, -0xe66(%rbp,%rax)
    13dc:      	movw	$0x0, -0xe64(%rbp,%rax)
    13e6:      	movw	$0x0, -0xe62(%rbp,%rax)
    13f0:      	addq	$0x10, %rax
    13f4:      	cmpq	$0x200, %rax            # imm = 0x200
    13fa:      	jne	0x13a0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x13a0>
    13fc:      	movq	%rbx, %rdi
    13ff:      	callq	0x1404 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1404>

0000000000000000 <<toyos_crypto::mlkem::EncapsulationKey>::as_bytes>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	movq	%rdi, %rax
       7:      	popq	%rbp
       8:      	retq

0000000000000000 <<toyos_crypto::mlkem::DecapsulationKey>::public_key>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	leaq	0x600(%rdi), %rax
       b:      	popq	%rbp
       c:      	retq

0000000000000000 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%r13
       a:      	pushq	%r12
       c:      	pushq	%rbx
       d:      	subq	$0x1000, %rsp           # imm = 0x1000
      14:      	movq	$0x0, (%rsp)
      1c:      	subq	$0x58, %rsp
      20:      	movq	%rsi, %rbx
      23:      	movq	%rdi, %r14
      26:      	cmpq	$0x440, %rcx            # imm = 0x440
      2d:      	jne	0xdb7 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xdb7>
      33:      	movq	%rdx, %r15
      36:      	leaq	-0x1080(%rbp), %rax
      3d:      	movq	%rax, -0x60(%rbp)
      41:      	movq	$0x3, -0x58(%rbp)
      49:      	xorl	%r13d, %r13d
      4c:      	leaq	-0xa80(%rbp), %rdi
      53:      	movl	$0x140, %edx            # imm = 0x140
      58:      	movq	%r15, %rsi
      5b:      	callq	0x60 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x60>
      60:      	movl	$0x2, %esi
      65:      	xorl	%ecx, %ecx
      67:      	movl	$0xd01, %edi            # imm = 0xD01
      6c:      	nopl	(%rax)
      70:      	movswl	-0xa82(%rbp,%rsi), %eax
      78:      	mull	%edi
      7a:      	jo	0xf28 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf28>
      80:      	addl	$0x200, %eax            # imm = 0x200
      85:      	shrl	$0xa, %eax
      88:      	movw	%ax, -0xa82(%rbp,%rsi)
      90:      	movswl	-0xa80(%rbp,%rsi), %eax
      98:      	mull	%edi
      9a:      	jo	0xf28 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf28>
      a0:      	addl	$0x200, %eax            # imm = 0x200
      a5:      	shrl	$0xa, %eax
      a8:      	movw	%ax, -0xa80(%rbp,%rsi)
      b0:      	addq	$0x4, %rsi
      b4:      	cmpq	$0x202, %rsi            # imm = 0x202
      bb:      	jne	0x70 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x70>
      bd:      	leaq	-0x480(%rbp), %r12
      c4:      	leaq	-0xa80(%rbp), %rsi
      cb:      	movl	$0x200, %edx            # imm = 0x200
      d0:      	movq	%r12, %rdi
      d3:      	callq	0xd8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xd8>
      d8:      	xorl	%r13d, %r13d
      db:      	leaq	-0x280(%rbp), %rdi
      e2:      	movq	%r12, %rsi
      e5:      	callq	0xea <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xea>
      ea:      	leaq	-0xa80(%rbp), %r12
      f1:      	leaq	-0x280(%rbp), %rsi
      f8:      	movl	$0x200, %edx            # imm = 0x200
      fd:      	movq	%r12, %rdi
     100:      	callq	0x105 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x105>
     105:      	leaq	-0x1080(%rbp), %rdi
     10c:      	movl	$0x200, %edx            # imm = 0x200
     111:      	movq	%r12, %rsi
     114:      	callq	0x119 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x119>
     119:      	leaq	0x140(%r15), %rsi
     120:      	movl	$0x1, %r13d
     126:      	leaq	-0xa80(%rbp), %rdi
     12d:      	movl	$0x140, %edx            # imm = 0x140
     132:      	callq	0x137 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x137>
     137:      	movl	$0x2, %esi
     13c:      	movl	$0xd01, %edi            # imm = 0xD01
     141:      	movl	$0x1, %ecx
     146:      	nopw	%cs:(%rax,%rax)
     150:      	movswl	-0xa82(%rbp,%rsi), %eax
     158:      	mull	%edi
     15a:      	jo	0xf28 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf28>
     160:      	addl	$0x200, %eax            # imm = 0x200
     165:      	shrl	$0xa, %eax
     168:      	movw	%ax, -0xa82(%rbp,%rsi)
     170:      	movswl	-0xa80(%rbp,%rsi), %eax
     178:      	mull	%edi
     17a:      	jo	0xf28 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf28>
     180:      	addl	$0x200, %eax            # imm = 0x200
     185:      	shrl	$0xa, %eax
     188:      	movw	%ax, -0xa80(%rbp,%rsi)
     190:      	addq	$0x4, %rsi
     194:      	cmpq	$0x202, %rsi            # imm = 0x202
     19b:      	jne	0x150 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x150>
     19d:      	leaq	-0x480(%rbp), %r12
     1a4:      	leaq	-0xa80(%rbp), %rsi
     1ab:      	movl	$0x200, %edx            # imm = 0x200
     1b0:      	movq	%r12, %rdi
     1b3:      	callq	0x1b8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1b8>
     1b8:      	movl	$0x1, %r13d
     1be:      	leaq	-0x280(%rbp), %rdi
     1c5:      	movq	%r12, %rsi
     1c8:      	callq	0x1cd <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1cd>
     1cd:      	leaq	-0xa80(%rbp), %r12
     1d4:      	leaq	-0x280(%rbp), %rsi
     1db:      	movl	$0x200, %edx            # imm = 0x200
     1e0:      	movq	%r12, %rdi
     1e3:      	callq	0x1e8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1e8>
     1e8:      	leaq	-0xe80(%rbp), %rdi
     1ef:      	movl	$0x200, %edx            # imm = 0x200
     1f4:      	movq	%r12, %rsi
     1f7:      	callq	0x1fc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1fc>
     1fc:      	leaq	0x280(%r15), %rsi
     203:      	movl	$0x2, %r13d
     209:      	leaq	-0xa80(%rbp), %rdi
     210:      	movl	$0x140, %edx            # imm = 0x140
     215:      	callq	0x21a <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x21a>
     21a:      	movl	$0x2, %ecx
     21f:      	movl	$0xd01, %esi            # imm = 0xD01
     224:      	movl	$0x2, %edi
     229:      	nopl	(%rax)
     230:      	movswl	-0xa82(%rbp,%rdi), %eax
     238:      	mull	%esi
     23a:      	jo	0xf28 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf28>
     240:      	addl	$0x200, %eax            # imm = 0x200
     245:      	shrl	$0xa, %eax
     248:      	movw	%ax, -0xa82(%rbp,%rdi)
     250:      	movswl	-0xa80(%rbp,%rdi), %eax
     258:      	mull	%esi
     25a:      	jo	0xf28 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf28>
     260:      	addl	$0x200, %eax            # imm = 0x200
     265:      	shrl	$0xa, %eax
     268:      	movw	%ax, -0xa80(%rbp,%rdi)
     270:      	addq	$0x4, %rdi
     274:      	cmpq	$0x202, %rdi            # imm = 0x202
     27b:      	jne	0x230 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x230>
     27d:      	leaq	-0x480(%rbp), %r12
     284:      	leaq	-0xa80(%rbp), %rsi
     28b:      	movl	$0x200, %edx            # imm = 0x200
     290:      	movq	%r12, %rdi
     293:      	callq	0x298 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x298>
     298:      	movl	$0x2, %r13d
     29e:      	leaq	-0x280(%rbp), %rdi
     2a5:      	movq	%r12, %rsi
     2a8:      	callq	0x2ad <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x2ad>
     2ad:      	leaq	-0xa80(%rbp), %r12
     2b4:      	leaq	-0x280(%rbp), %rsi
     2bb:      	movl	$0x200, %edx            # imm = 0x200
     2c0:      	movq	%r12, %rdi
     2c3:      	callq	0x2c8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x2c8>
     2c8:      	leaq	-0xc80(%rbp), %rdi
     2cf:      	movl	$0x200, %edx            # imm = 0x200
     2d4:      	movq	%r12, %rsi
     2d7:      	callq	0x2dc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x2dc>
     2dc:      	leaq	-0xa80(%rbp), %rdi
     2e3:      	leaq	-0x1080(%rbp), %rsi
     2ea:      	movl	$0x600, %edx            # imm = 0x600
     2ef:      	callq	0x2f4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x2f4>
     2f4:      	pxor	%xmm0, %xmm0
     2f8:      	movdqa	%xmm0, -0x50(%rbp)
     2fd:      	movdqa	%xmm0, -0x60(%rbp)
     302:      	leaq	0x3c0(%r15), %rsi
     309:      	leaq	-0x1080(%rbp), %rdi
     310:      	movl	$0x80, %edx
     315:      	callq	0x31a <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x31a>
     31a:      	movl	$0x2, %ecx
     31f:      	movl	$0xd01, %esi            # imm = 0xD01
     324:      	nopw	%cs:(%rax,%rax)
     330:      	movswl	-0x1082(%rbp,%rcx), %eax
     338:      	mull	%esi
     33a:      	jo	0xf3a <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf3a>
     340:      	addl	$0x8, %eax
     343:      	shrl	$0x4, %eax
     346:      	movw	%ax, -0x1082(%rbp,%rcx)
     34e:      	movswl	-0x1080(%rbp,%rcx), %eax
     356:      	mull	%esi
     358:      	jo	0xf3a <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf3a>
     35e:      	addl	$0x8, %eax
     361:      	shrl	$0x4, %eax
     364:      	movw	%ax, -0x1080(%rbp,%rcx)
     36c:      	addq	$0x4, %rcx
     370:      	cmpq	$0x202, %rcx            # imm = 0x202
     377:      	jne	0x330 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x330>
     379:      	leaq	-0x280(%rbp), %rdi
     380:      	leaq	-0x1080(%rbp), %rsi
     387:      	movl	$0x200, %edx            # imm = 0x200
     38c:      	callq	0x391 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x391>
     391:      	leaq	-0x1080(%rbp), %rdi
     398:      	leaq	-0xa80(%rbp), %rdx
     39f:      	movq	%rbx, %rsi
     3a2:      	callq	0x3a7 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x3a7>
     3a7:      	leaq	-0x480(%rbp), %rdi
     3ae:      	leaq	-0x1080(%rbp), %rsi
     3b5:      	callq	0x3ba <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x3ba>
     3ba:      	leaq	-0x80(%rbp), %rdi
     3be:      	leaq	-0x280(%rbp), %rsi
     3c5:      	callq	0x3ca <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x3ca>
     3ca:      	testb	%al, %al
     3cc:      	je	0xf0e <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf0e>
     3d2:      	leaq	-0x280(%rbp), %rdi
     3d9:      	leaq	-0x480(%rbp), %rsi
     3e0:      	callq	0x3e5 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x3e5>
     3e5:      	testb	%al, %al
     3e7:      	je	0xf0e <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf0e>
     3ed:      	movl	$0x1, %eax
     3f2:      	nopw	%cs:(%rax,%rax)
     400:      	movzwl	-0x282(%rbp,%rax,2), %ecx
     408:      	subw	-0x482(%rbp,%rax,2), %cx
     410:      	jo	0xf48 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf48>
     416:      	movw	%cx, -0x282(%rbp,%rax,2)
     41e:      	movzwl	-0x280(%rbp,%rax,2), %ecx
     426:      	subw	-0x480(%rbp,%rax,2), %cx
     42e:      	jo	0xf48 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf48>
     434:      	movw	%cx, -0x280(%rbp,%rax,2)
     43c:      	addq	$0x2, %rax
     440:      	cmpq	$0x101, %rax            # imm = 0x101
     446:      	jne	0x400 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x400>
     448:      	leaq	-0x1080(%rbp), %r12
     44f:      	leaq	-0x280(%rbp), %rsi
     456:      	movl	$0x200, %edx            # imm = 0x200
     45b:      	movq	%r12, %rdi
     45e:      	callq	0x463 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x463>
     463:      	leaq	-0x280(%rbp), %rdi
     46a:      	movl	$0x1, %edx
     46f:      	movq	%r12, %rsi
     472:      	callq	0x477 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x477>
     477:      	leaq	-0x280(%rbp), %rdi
     47e:      	leaq	-0x60(%rbp), %r12
     482:      	movl	$0x20, %edx
     487:      	movq	%r12, %rsi
     48a:      	callq	0x48f <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x48f>
     48f:      	xorl	%eax, %eax
     491:      	nopw	%cs:(%rax,%rax)
     4a0:      	movw	$0x0, -0x280(%rbp,%rax)
     4aa:      	movw	$0x0, -0x27e(%rbp,%rax)
     4b4:      	movw	$0x0, -0x27c(%rbp,%rax)
     4be:      	movw	$0x0, -0x27a(%rbp,%rax)
     4c8:      	movw	$0x0, -0x278(%rbp,%rax)
     4d2:      	movw	$0x0, -0x276(%rbp,%rax)
     4dc:      	movw	$0x0, -0x274(%rbp,%rax)
     4e6:      	movw	$0x0, -0x272(%rbp,%rax)
     4f0:      	addq	$0x10, %rax
     4f4:      	cmpq	$0x200, %rax            # imm = 0x200
     4fa:      	jne	0x4a0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x4a0>
     4fc:      	xorl	%eax, %eax
     4fe:      	nop
     500:      	movw	$0x0, -0x480(%rbp,%rax)
     50a:      	movw	$0x0, -0x47e(%rbp,%rax)
     514:      	movw	$0x0, -0x47c(%rbp,%rax)
     51e:      	movw	$0x0, -0x47a(%rbp,%rax)
     528:      	movw	$0x0, -0x478(%rbp,%rax)
     532:      	movw	$0x0, -0x476(%rbp,%rax)
     53c:      	movw	$0x0, -0x474(%rbp,%rax)
     546:      	movw	$0x0, -0x472(%rbp,%rax)
     550:      	addq	$0x10, %rax
     554:      	cmpq	$0x200, %rax            # imm = 0x200
     55a:      	jne	0x500 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x500>
     55c:      	leaq	0xaa0(%rbx), %rax
     563:      	movq	%r12, -0x280(%rbp)
     56a:      	movq	$0x20, -0x278(%rbp)
     575:      	movq	%rax, -0x270(%rbp)
     57c:      	movq	$0x20, -0x268(%rbp)
     587:      	leaq	-0x1080(%rbp), %rdi
     58e:      	leaq	-0x280(%rbp), %rsi
     595:      	movl	$0x2, %edx
     59a:      	callq	0x59f <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x59f>
     59f:      	movups	-0x1080(%rbp), %xmm0
     5a6:      	movups	-0x1070(%rbp), %xmm1
     5ad:      	movdqu	-0x1060(%rbp), %xmm2
     5b5:      	movdqu	-0x1050(%rbp), %xmm3
     5bd:      	movdqa	%xmm3, -0x450(%rbp)
     5c5:      	movdqa	%xmm2, -0x460(%rbp)
     5cd:      	movaps	%xmm1, -0x470(%rbp)
     5d4:      	movaps	%xmm0, -0x480(%rbp)
     5db:      	leaq	0xac0(%rbx), %r13
     5e2:      	movq	%r13, -0x1080(%rbp)
     5e9:      	movq	$0x20, -0x1078(%rbp)
     5f4:      	movq	%r15, -0x1070(%rbp)
     5fb:      	movq	$0x440, -0x1068(%rbp)   # imm = 0x440
     606:      	leaq	-0x280(%rbp), %rdi
     60d:      	leaq	-0x1080(%rbp), %rsi
     614:      	movl	$0x2, %edx
     619:      	callq	0x61e <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x61e>
     61e:      	movdqa	-0x280(%rbp), %xmm0
     626:      	movdqa	-0x270(%rbp), %xmm1
     62e:      	movdqa	%xmm0, -0x80(%rbp)
     633:      	movdqa	%xmm1, -0x70(%rbp)
     638:      	leaq	0x600(%rbx), %rsi
     63f:      	leaq	-0x460(%rbp), %r12
     646:      	leaq	-0x1080(%rbp), %rdi
     64d:      	leaq	-0x60(%rbp), %rdx
     651:      	movq	%r12, %rcx
     654:      	callq	0x659 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x659>
     659:      	leaq	0x440(%r15), %rdi
     660:      	movq	%r15, %rsi
     663:      	callq	0x668 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x668>
     668:      	testb	%al, %al
     66a:      	je	0xf0e <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf0e>
     670:      	leaq	-0xc40(%rbp), %rdi
     677:      	leaq	-0x1080(%rbp), %rsi
     67e:      	callq	0x683 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x683>
     683:      	testb	%al, %al
     685:      	je	0xf0e <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf0e>
     68b:      	pxor	%xmm0, %xmm0
     68f:      	movl	$0x6, %eax
     694:      	pxor	%xmm2, %xmm2
     698:      	pxor	%xmm1, %xmm1
     69c:      	nopl	(%rax)
     6a0:      	movzwl	-0x1086(%rbp,%rax), %ecx
     6a8:      	movzwl	-0x1084(%rbp,%rax), %edx
     6b0:      	xorw	-0x6(%r15,%rax), %cx
     6b6:      	xorw	-0x4(%r15,%rax), %dx
     6bc:      	movd	%ecx, %xmm4
     6c0:      	movd	%edx, %xmm3
     6c4:      	punpcklbw	%xmm0, %xmm4    # xmm4 = xmm4[0],xmm0[0],xmm4[1],xmm0[1],xmm4[2],xmm0[2],xmm4[3],xmm0[3],xmm4[4],xmm0[4],xmm4[5],xmm0[5],xmm4[6],xmm0[6],xmm4[7],xmm0[7]
     6c8:      	punpcklwd	%xmm0, %xmm4    # xmm4 = xmm4[0],xmm0[0],xmm4[1],xmm0[1],xmm4[2],xmm0[2],xmm4[3],xmm0[3]
     6cc:      	punpckldq	%xmm0, %xmm4    # xmm4 = xmm4[0],xmm0[0],xmm4[1],xmm0[1]
     6d0:      	por	%xmm2, %xmm4
     6d4:      	punpcklbw	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3],xmm3[4],xmm0[4],xmm3[5],xmm0[5],xmm3[6],xmm0[6],xmm3[7],xmm0[7]
     6d8:      	punpcklwd	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3]
     6dc:      	punpckldq	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1]
     6e0:      	por	%xmm1, %xmm3
     6e4:      	movzwl	-0x1082(%rbp,%rax), %ecx
     6ec:      	movzwl	-0x1080(%rbp,%rax), %edx
     6f4:      	xorw	-0x2(%r15,%rax), %cx
     6fa:      	xorw	(%r15,%rax), %dx
     6ff:      	movd	%ecx, %xmm2
     703:      	movd	%edx, %xmm1
     707:      	punpcklbw	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1],xmm2[2],xmm0[2],xmm2[3],xmm0[3],xmm2[4],xmm0[4],xmm2[5],xmm0[5],xmm2[6],xmm0[6],xmm2[7],xmm0[7]
     70b:      	punpcklwd	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1],xmm2[2],xmm0[2],xmm2[3],xmm0[3]
     70f:      	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
     713:      	por	%xmm4, %xmm2
     717:      	punpcklbw	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3],xmm1[4],xmm0[4],xmm1[5],xmm0[5],xmm1[6],xmm0[6],xmm1[7],xmm0[7]
     71b:      	punpcklwd	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3]
     71f:      	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
     723:      	por	%xmm3, %xmm1
     727:      	addq	$0x8, %rax
     72b:      	cmpq	$0x446, %rax            # imm = 0x446
     731:      	jne	0x6a0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x6a0>
     737:      	por	%xmm2, %xmm1
     73b:      	pshufd	$0xee, %xmm1, %xmm0     # xmm0 = xmm1[2,3,2,3]
     740:      	por	%xmm1, %xmm0
     744:      	movq	%xmm0, %rax
     749:      	movl	$0x7, %ecx
     74e:      	nop
     750:      	movb	$0x0, -0x1087(%rbp,%rcx)
     758:      	movb	$0x0, -0x1086(%rbp,%rcx)
     760:      	movb	$0x0, -0x1085(%rbp,%rcx)
     768:      	movb	$0x0, -0x1084(%rbp,%rcx)
     770:      	movb	$0x0, -0x1083(%rbp,%rcx)
     778:      	movb	$0x0, -0x1082(%rbp,%rcx)
     780:      	movb	$0x0, -0x1081(%rbp,%rcx)
     788:      	movb	$0x0, -0x1080(%rbp,%rcx)
     790:      	addq	$0x8, %rcx
     794:      	cmpq	$0x447, %rcx            # imm = 0x447
     79b:      	jne	0x750 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x750>
     79d:      	xorl	%ecx, %ecx
     79f:      	testq	%rax, %rax
     7a2:      	setg	%cl
     7a5:      	leaq	0xff(%rcx), %rax
     7ac:      	movq	%rax, %xmm0
     7b1:      	pshufd	$0x44, %xmm0, %xmm1     # xmm1 = xmm0[0,1,0,1]
     7b6:      	negq	%rcx
     7b9:      	movq	%rcx, %xmm0
     7be:      	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
     7c3:      	movdqa	-0x480(%rbp), %xmm8
     7cc:      	movdqa	-0x470(%rbp), %xmm3
     7d4:      	movdqa	%xmm8, %xmm2
     7d9:      	punpcklbw	%xmm2, %xmm2    # xmm2 = xmm2[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
     7dd:      	movdqa	%xmm2, %xmm5
     7e1:      	punpcklwd	%xmm5, %xmm5    # xmm5 = xmm5[0,0,1,1,2,2,3,3]
     7e5:      	pshufd	$0xd4, %xmm5, %xmm4     # xmm4 = xmm5[0,1,1,3]
     7ea:      	pshufd	$0xf6, %xmm5, %xmm5     # xmm5 = xmm5[2,1,3,3]
     7ef:      	punpckhwd	%xmm2, %xmm2    # xmm2 = xmm2[4,4,5,5,6,6,7,7]
     7f3:      	pshufd	$0xd4, %xmm2, %xmm6     # xmm6 = xmm2[0,1,1,3]
     7f8:      	pshufd	$0xf6, %xmm2, %xmm7     # xmm7 = xmm2[2,1,3,3]
     7fd:      	punpckhbw	%xmm8, %xmm8    # xmm8 = xmm8[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
     802:      	movdqa	%xmm8, %xmm2
     807:      	punpcklwd	%xmm2, %xmm2    # xmm2 = xmm2[0,0,1,1,2,2,3,3]
     80b:      	pshufd	$0xd4, %xmm2, %xmm9     # xmm9 = xmm2[0,1,1,3]
     811:      	pshufd	$0xf6, %xmm2, %xmm2     # xmm2 = xmm2[2,1,3,3]
     816:      	punpckhwd	%xmm8, %xmm8    # xmm8 = xmm8[4,4,5,5,6,6,7,7]
     81b:      	pshufd	$0xd4, %xmm8, %xmm11    # xmm11 = xmm8[0,1,1,3]
     821:      	pshufd	$0xf6, %xmm8, %xmm13    # xmm13 = xmm8[2,1,3,3]
     827:      	movdqa	-0x80(%rbp), %xmm12
     82d:      	movdqa	%xmm12, %xmm10
     832:      	punpcklbw	%xmm10, %xmm10  # xmm10 = xmm10[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
     837:      	punpckhbw	%xmm12, %xmm12  # xmm12 = xmm12[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
     83c:      	movdqa	%xmm12, %xmm15
     841:      	punpckhwd	%xmm12, %xmm12  # xmm12 = xmm12[4,4,5,5,6,6,7,7]
     846:      	pshufd	$0xf6, %xmm12, %xmm8    # xmm8 = xmm12[2,1,3,3]
     84c:      	pand	%xmm1, %xmm13
     851:      	pand	%xmm0, %xmm8
     856:      	por	%xmm13, %xmm8
     85b:      	movdqa	%xmm10, %xmm13
     860:      	punpcklwd	%xmm13, %xmm13  # xmm13 = xmm13[0,0,1,1,2,2,3,3]
     865:      	punpcklwd	%xmm15, %xmm15  # xmm15 = xmm15[0,0,1,1,2,2,3,3]
     86a:      	pshufd	$0xd4, %xmm12, %xmm12   # xmm12 = xmm12[0,1,1,3]
     870:      	pand	%xmm1, %xmm11
     875:      	pand	%xmm0, %xmm12
     87a:      	por	%xmm11, %xmm12
     87f:      	pshufd	$0xf6, %xmm15, %xmm14   # xmm14 = xmm15[2,1,3,3]
     885:      	pand	%xmm1, %xmm2
     889:      	pand	%xmm0, %xmm14
     88e:      	por	%xmm2, %xmm14
     893:      	pshufd	$0xd4, %xmm13, %xmm2    # xmm2 = xmm13[0,1,1,3]
     899:      	pshufd	$0xf6, %xmm13, %xmm13   # xmm13 = xmm13[2,1,3,3]
     89f:      	punpckhwd	%xmm10, %xmm10  # xmm10 = xmm10[4,4,5,5,6,6,7,7]
     8a4:      	pshufd	$0xd4, %xmm15, %xmm11   # xmm11 = xmm15[0,1,1,3]
     8aa:      	pand	%xmm1, %xmm9
     8af:      	pand	%xmm0, %xmm11
     8b4:      	por	%xmm9, %xmm11
     8b9:      	pshufd	$0xd4, %xmm10, %xmm9    # xmm9 = xmm10[0,1,1,3]
     8bf:      	pshufd	$0xf6, %xmm10, %xmm10   # xmm10 = xmm10[2,1,3,3]
     8c5:      	pand	%xmm1, %xmm7
     8c9:      	pand	%xmm1, %xmm6
     8cd:      	pand	%xmm1, %xmm5
     8d1:      	pand	%xmm1, %xmm4
     8d5:      	pand	%xmm0, %xmm10
     8da:      	por	%xmm7, %xmm10
     8df:      	pand	%xmm0, %xmm9
     8e4:      	por	%xmm6, %xmm9
     8e9:      	pand	%xmm0, %xmm13
     8ee:      	por	%xmm5, %xmm13
     8f3:      	pand	%xmm0, %xmm2
     8f7:      	por	%xmm4, %xmm2
     8fb:      	movdqa	(%rip), %xmm4           # 0x903 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x903>
     903:      	pand	%xmm4, %xmm8
     908:      	pand	%xmm4, %xmm12
     90d:      	packuswb	%xmm8, %xmm12
     912:      	pand	%xmm4, %xmm14
     917:      	pand	%xmm4, %xmm11
     91c:      	packuswb	%xmm14, %xmm11
     921:      	packuswb	%xmm12, %xmm11
     926:      	pand	%xmm4, %xmm10
     92b:      	pand	%xmm4, %xmm9
     930:      	packuswb	%xmm10, %xmm9
     935:      	pand	%xmm4, %xmm13
     93a:      	pand	%xmm4, %xmm2
     93e:      	packuswb	%xmm13, %xmm2
     943:      	packuswb	%xmm9, %xmm2
     948:      	packuswb	%xmm11, %xmm2
     94d:      	movdqa	%xmm3, %xmm8
     952:      	punpcklbw	%xmm8, %xmm8    # xmm8 = xmm8[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
     957:      	movdqa	%xmm8, %xmm6
     95c:      	punpcklwd	%xmm6, %xmm6    # xmm6 = xmm6[0,0,1,1,2,2,3,3]
     960:      	pshufd	$0xd4, %xmm6, %xmm5     # xmm5 = xmm6[0,1,1,3]
     965:      	pshufd	$0xf6, %xmm6, %xmm6     # xmm6 = xmm6[2,1,3,3]
     96a:      	punpckhwd	%xmm8, %xmm8    # xmm8 = xmm8[4,4,5,5,6,6,7,7]
     96f:      	pshufd	$0xd4, %xmm8, %xmm7     # xmm7 = xmm8[0,1,1,3]
     975:      	pshufd	$0xf6, %xmm8, %xmm8     # xmm8 = xmm8[2,1,3,3]
     97b:      	punpckhbw	%xmm3, %xmm3    # xmm3 = xmm3[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
     97f:      	movdqa	%xmm3, %xmm10
     984:      	punpcklwd	%xmm10, %xmm10  # xmm10 = xmm10[0,0,1,1,2,2,3,3]
     989:      	pshufd	$0xd4, %xmm10, %xmm9    # xmm9 = xmm10[0,1,1,3]
     98f:      	pshufd	$0xf6, %xmm10, %xmm10   # xmm10 = xmm10[2,1,3,3]
     995:      	punpckhwd	%xmm3, %xmm3    # xmm3 = xmm3[4,4,5,5,6,6,7,7]
     999:      	pshufd	$0xd4, %xmm3, %xmm12    # xmm12 = xmm3[0,1,1,3]
     99f:      	pshufd	$0xf6, %xmm3, %xmm15    # xmm15 = xmm3[2,1,3,3]
     9a5:      	movdqa	-0x70(%rbp), %xmm11
     9ab:      	movdqa	%xmm11, %xmm3
     9b0:      	punpckhbw	%xmm11, %xmm11  # xmm11 = xmm11[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
     9b5:      	movdqa	%xmm11, %xmm14
     9ba:      	punpckhwd	%xmm11, %xmm11  # xmm11 = xmm11[4,4,5,5,6,6,7,7]
     9bf:      	pand	%xmm1, %xmm15
     9c4:      	pand	%xmm1, %xmm12
     9c9:      	pand	%xmm1, %xmm10
     9ce:      	pand	%xmm1, %xmm9
     9d3:      	pand	%xmm1, %xmm8
     9d8:      	pand	%xmm1, %xmm7
     9dc:      	pand	%xmm1, %xmm6
     9e0:      	pand	%xmm1, %xmm5
     9e4:      	pshufd	$0xf6, %xmm11, %xmm13   # xmm13 = xmm11[2,1,3,3]
     9ea:      	pand	%xmm0, %xmm13
     9ef:      	por	%xmm15, %xmm13
     9f4:      	punpcklbw	%xmm3, %xmm3    # xmm3 = xmm3[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
     9f8:      	punpcklwd	%xmm14, %xmm14  # xmm14 = xmm14[0,0,1,1,2,2,3,3]
     9fd:      	pshufd	$0xd4, %xmm11, %xmm11   # xmm11 = xmm11[0,1,1,3]
     a03:      	pand	%xmm0, %xmm11
     a08:      	por	%xmm12, %xmm11
     a0d:      	pshufd	$0xf6, %xmm14, %xmm12   # xmm12 = xmm14[2,1,3,3]
     a13:      	pand	%xmm0, %xmm12
     a18:      	por	%xmm10, %xmm12
     a1d:      	movdqa	%xmm3, %xmm10
     a22:      	punpckhwd	%xmm3, %xmm3    # xmm3 = xmm3[4,4,5,5,6,6,7,7]
     a26:      	pshufd	$0xd4, %xmm14, %xmm1    # xmm1 = xmm14[0,1,1,3]
     a2c:      	pand	%xmm0, %xmm1
     a30:      	por	%xmm9, %xmm1
     a35:      	pshufd	$0xf6, %xmm3, %xmm9     # xmm9 = xmm3[2,1,3,3]
     a3b:      	pand	%xmm0, %xmm9
     a40:      	por	%xmm8, %xmm9
     a45:      	punpcklwd	%xmm10, %xmm10  # xmm10 = xmm10[0,0,1,1,2,2,3,3]
     a4a:      	pshufd	$0xd4, %xmm3, %xmm3     # xmm3 = xmm3[0,1,1,3]
     a4f:      	pand	%xmm0, %xmm3
     a53:      	por	%xmm7, %xmm3
     a57:      	pshufd	$0xf6, %xmm10, %xmm7    # xmm7 = xmm10[2,1,3,3]
     a5d:      	pand	%xmm0, %xmm7
     a61:      	por	%xmm6, %xmm7
     a65:      	pshufd	$0xd4, %xmm10, %xmm6    # xmm6 = xmm10[0,1,1,3]
     a6b:      	pand	%xmm0, %xmm6
     a6f:      	por	%xmm5, %xmm6
     a73:      	pand	%xmm4, %xmm13
     a78:      	pand	%xmm4, %xmm11
     a7d:      	packuswb	%xmm13, %xmm11
     a82:      	pand	%xmm4, %xmm12
     a87:      	pand	%xmm4, %xmm1
     a8b:      	packuswb	%xmm12, %xmm1
     a90:      	packuswb	%xmm11, %xmm1
     a95:      	pand	%xmm4, %xmm9
     a9a:      	pand	%xmm4, %xmm3
     a9e:      	packuswb	%xmm9, %xmm3
     aa3:      	pand	%xmm4, %xmm7
     aa7:      	pand	%xmm4, %xmm6
     aab:      	packuswb	%xmm7, %xmm6
     aaf:      	packuswb	%xmm3, %xmm6
     ab3:      	packuswb	%xmm1, %xmm6
     ab7:      	movdqu	%xmm2, 0x1(%r14)
     abd:      	movdqu	%xmm6, 0x11(%r14)
     ac3:      	movb	$0x0, (%r14)
     ac7:      	pxor	%xmm0, %xmm0
     acb:      	movdqa	%xmm0, -0x1080(%rbp)
     ad3:      	movaps	-0x1080(%rbp), %xmm1
     ada:      	movaps	%xmm1, -0x80(%rbp)
     ade:      	movdqa	%xmm0, -0x1080(%rbp)
     ae6:      	movaps	-0x1080(%rbp), %xmm1
     aed:      	movaps	%xmm1, -0x70(%rbp)
     af1:      	movdqa	%xmm0, -0x1080(%rbp)
     af9:      	movaps	-0x1080(%rbp), %xmm1
     b00:      	movaps	%xmm1, -0x480(%rbp)
     b07:      	movdqa	%xmm0, -0x1080(%rbp)
     b0f:      	movaps	-0x1080(%rbp), %xmm1
     b16:      	movaps	%xmm1, -0x470(%rbp)
     b1d:      	movdqa	%xmm0, -0x1080(%rbp)
     b25:      	movaps	-0x1080(%rbp), %xmm1
     b2c:      	movups	%xmm1, (%r12)
     b31:      	movdqa	%xmm0, -0x1080(%rbp)
     b39:      	movaps	-0x1080(%rbp), %xmm1
     b40:      	movaps	%xmm1, -0x450(%rbp)
     b47:      	movdqa	%xmm0, -0x1080(%rbp)
     b4f:      	movaps	-0x1080(%rbp), %xmm1
     b56:      	movaps	%xmm1, -0x60(%rbp)
     b5a:      	movdqa	%xmm0, -0x1080(%rbp)
     b62:      	movaps	-0x1080(%rbp), %xmm0
     b69:      	movaps	%xmm0, -0x50(%rbp)
     b6d:      	xorl	%eax, %eax
     b6f:      	nop
     b70:      	movw	$0x0, -0xa80(%rbp,%rax)
     b7a:      	movw	$0x0, -0xa7e(%rbp,%rax)
     b84:      	movw	$0x0, -0xa7c(%rbp,%rax)
     b8e:      	movw	$0x0, -0xa7a(%rbp,%rax)
     b98:      	movw	$0x0, -0xa78(%rbp,%rax)
     ba2:      	movw	$0x0, -0xa76(%rbp,%rax)
     bac:      	movw	$0x0, -0xa74(%rbp,%rax)
     bb6:      	movw	$0x0, -0xa72(%rbp,%rax)
     bc0:      	addq	$0x10, %rax
     bc4:      	cmpq	$0x200, %rax            # imm = 0x200
     bca:      	jne	0xb70 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xb70>
     bcc:      	xorl	%eax, %eax
     bce:      	nop
     bd0:      	movw	$0x0, -0x880(%rbp,%rax)
     bda:      	movw	$0x0, -0x87e(%rbp,%rax)
     be4:      	movw	$0x0, -0x87c(%rbp,%rax)
     bee:      	movw	$0x0, -0x87a(%rbp,%rax)
     bf8:      	movw	$0x0, -0x878(%rbp,%rax)
     c02:      	movw	$0x0, -0x876(%rbp,%rax)
     c0c:      	movw	$0x0, -0x874(%rbp,%rax)
     c16:      	movw	$0x0, -0x872(%rbp,%rax)
     c20:      	addq	$0x10, %rax
     c24:      	cmpq	$0x200, %rax            # imm = 0x200
     c2a:      	jne	0xbd0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xbd0>
     c2c:      	xorl	%eax, %eax
     c2e:      	nop
     c30:      	movw	$0x0, -0x680(%rbp,%rax)
     c3a:      	movw	$0x0, -0x67e(%rbp,%rax)
     c44:      	movw	$0x0, -0x67c(%rbp,%rax)
     c4e:      	movw	$0x0, -0x67a(%rbp,%rax)
     c58:      	movw	$0x0, -0x678(%rbp,%rax)
     c62:      	movw	$0x0, -0x676(%rbp,%rax)
     c6c:      	movw	$0x0, -0x674(%rbp,%rax)
     c76:      	movw	$0x0, -0x672(%rbp,%rax)
     c80:      	addq	$0x10, %rax
     c84:      	cmpq	$0x200, %rax            # imm = 0x200
     c8a:      	jne	0xc30 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xc30>
     c8c:      	xorl	%eax, %eax
     c8e:      	nop
     c90:      	movw	$0x0, (%rbx,%rax)
     c96:      	movw	$0x0, 0x2(%rbx,%rax)
     c9d:      	movw	$0x0, 0x4(%rbx,%rax)
     ca4:      	movw	$0x0, 0x6(%rbx,%rax)
     cab:      	movw	$0x0, 0x8(%rbx,%rax)
     cb2:      	movw	$0x0, 0xa(%rbx,%rax)
     cb9:      	movw	$0x0, 0xc(%rbx,%rax)
     cc0:      	movw	$0x0, 0xe(%rbx,%rax)
     cc7:      	addq	$0x10, %rax
     ccb:      	cmpq	$0x200, %rax            # imm = 0x200
     cd1:      	jne	0xc90 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xc90>
     cd3:      	xorl	%eax, %eax
     cd5:      	nopw	%cs:(%rax,%rax)
     ce0:      	movw	$0x0, 0x200(%rbx,%rax)
     cea:      	movw	$0x0, 0x202(%rbx,%rax)
     cf4:      	movw	$0x0, 0x204(%rbx,%rax)
     cfe:      	movw	$0x0, 0x206(%rbx,%rax)
     d08:      	movw	$0x0, 0x208(%rbx,%rax)
     d12:      	movw	$0x0, 0x20a(%rbx,%rax)
     d1c:      	movw	$0x0, 0x20c(%rbx,%rax)
     d26:      	movw	$0x0, 0x20e(%rbx,%rax)
     d30:      	addq	$0x10, %rax
     d34:      	cmpq	$0x200, %rax            # imm = 0x200
     d3a:      	jne	0xce0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xce0>
     d3c:      	xorl	%eax, %eax
     d3e:      	nop
     d40:      	movw	$0x0, 0x400(%rbx,%rax)
     d4a:      	movw	$0x0, 0x402(%rbx,%rax)
     d54:      	movw	$0x0, 0x404(%rbx,%rax)
     d5e:      	movw	$0x0, 0x406(%rbx,%rax)
     d68:      	movw	$0x0, 0x408(%rbx,%rax)
     d72:      	movw	$0x0, 0x40a(%rbx,%rax)
     d7c:      	movw	$0x0, 0x40c(%rbx,%rax)
     d86:      	movw	$0x0, 0x40e(%rbx,%rax)
     d90:      	addq	$0x10, %rax
     d94:      	cmpq	$0x200, %rax            # imm = 0x200
     d9a:      	jne	0xd40 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xd40>
     d9c:      	xorps	%xmm0, %xmm0
     d9f:      	movaps	%xmm0, -0x1080(%rbp)
     da6:      	movaps	-0x1080(%rbp), %xmm1
     dad:      	movups	%xmm1, (%r13)
     db2:      	jmp	0xee4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xee4>
     db7:      	movw	$0x1, (%r14)
     dbd:      	xorl	%eax, %eax
     dbf:      	nop
     dc0:      	movw	$0x0, (%rbx,%rax)
     dc6:      	movw	$0x0, 0x2(%rbx,%rax)
     dcd:      	movw	$0x0, 0x4(%rbx,%rax)
     dd4:      	movw	$0x0, 0x6(%rbx,%rax)
     ddb:      	movw	$0x0, 0x8(%rbx,%rax)
     de2:      	movw	$0x0, 0xa(%rbx,%rax)
     de9:      	movw	$0x0, 0xc(%rbx,%rax)
     df0:      	movw	$0x0, 0xe(%rbx,%rax)
     df7:      	addq	$0x10, %rax
     dfb:      	cmpq	$0x200, %rax            # imm = 0x200
     e01:      	jne	0xdc0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xdc0>
     e03:      	xorl	%eax, %eax
     e05:      	nopw	%cs:(%rax,%rax)
     e10:      	movw	$0x0, 0x200(%rbx,%rax)
     e1a:      	movw	$0x0, 0x202(%rbx,%rax)
     e24:      	movw	$0x0, 0x204(%rbx,%rax)
     e2e:      	movw	$0x0, 0x206(%rbx,%rax)
     e38:      	movw	$0x0, 0x208(%rbx,%rax)
     e42:      	movw	$0x0, 0x20a(%rbx,%rax)
     e4c:      	movw	$0x0, 0x20c(%rbx,%rax)
     e56:      	movw	$0x0, 0x20e(%rbx,%rax)
     e60:      	addq	$0x10, %rax
     e64:      	cmpq	$0x200, %rax            # imm = 0x200
     e6a:      	jne	0xe10 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xe10>
     e6c:      	xorl	%eax, %eax
     e6e:      	nop
     e70:      	movw	$0x0, 0x400(%rbx,%rax)
     e7a:      	movw	$0x0, 0x402(%rbx,%rax)
     e84:      	movw	$0x0, 0x404(%rbx,%rax)
     e8e:      	movw	$0x0, 0x406(%rbx,%rax)
     e98:      	movw	$0x0, 0x408(%rbx,%rax)
     ea2:      	movw	$0x0, 0x40a(%rbx,%rax)
     eac:      	movw	$0x0, 0x40c(%rbx,%rax)
     eb6:      	movw	$0x0, 0x40e(%rbx,%rax)
     ec0:      	addq	$0x10, %rax
     ec4:      	cmpq	$0x200, %rax            # imm = 0x200
     eca:      	jne	0xe70 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xe70>
     ecc:      	xorps	%xmm0, %xmm0
     ecf:      	movaps	%xmm0, -0x1080(%rbp)
     ed6:      	movaps	-0x1080(%rbp), %xmm1
     edd:      	movups	%xmm1, 0xac0(%rbx)
     ee4:      	movaps	%xmm0, -0x1080(%rbp)
     eeb:      	movaps	-0x1080(%rbp), %xmm0
     ef2:      	movups	%xmm0, 0xad0(%rbx)
     ef9:      	movq	%r14, %rax
     efc:      	addq	$0x1058, %rsp           # imm = 0x1058
     f03:      	popq	%rbx
     f04:      	popq	%r12
     f06:      	popq	%r13
     f08:      	popq	%r14
     f0a:      	popq	%r15
     f0c:      	popq	%rbp
     f0d:      	retq
     f0e:      	leaq	(%rip), %rdi            # 0xf15 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf15>
     f15:      	leaq	(%rip), %rcx            # 0xf1c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf1c>
     f1c:      	movl	$0x193, %esi            # imm = 0x193
     f21:      	xorl	%edx, %edx
     f23:      	callq	0xf28 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf28>
     f28:      	movq	%rcx, -0x50(%rbp)
     f2c:      	leaq	(%rip), %rdi            # 0xf33 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf33>
     f33:      	callq	0xf38 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf38>
     f38:      	jmp	0xf54 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf54>
     f3a:      	leaq	(%rip), %rdi            # 0xf41 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf41>
     f41:      	callq	0xf46 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf46>
     f46:      	jmp	0xf54 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf54>
     f48:      	leaq	(%rip), %rdi            # 0xf4f <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf4f>
     f4f:      	callq	0xf54 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf54>
     f54:      	ud2
     f56:      	callq	0xf5b <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf5b>
     f5b:      	callq	0xf60 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf60>
     f60:      	movq	%rax, %r14
     f63:      	pxor	%xmm0, %xmm0
     f67:      	movdqa	%xmm0, -0x280(%rbp)
     f6f:      	movaps	-0x280(%rbp), %xmm1
     f76:      	movaps	%xmm1, -0x80(%rbp)
     f7a:      	movdqa	%xmm0, -0x280(%rbp)
     f82:      	movaps	-0x280(%rbp), %xmm0
     f89:      	movaps	%xmm0, -0x70(%rbp)
     f8d:      	jmp	0xf92 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf92>
     f8f:      	movq	%rax, %r14
     f92:      	xorps	%xmm0, %xmm0
     f95:      	movaps	%xmm0, -0x40(%rbp)
     f99:      	movaps	-0x40(%rbp), %xmm1
     f9d:      	movaps	%xmm1, -0x480(%rbp)
     fa4:      	movaps	%xmm0, -0x40(%rbp)
     fa8:      	movaps	-0x40(%rbp), %xmm1
     fac:      	movaps	%xmm1, -0x470(%rbp)
     fb3:      	movaps	%xmm0, -0x40(%rbp)
     fb7:      	movaps	-0x40(%rbp), %xmm1
     fbb:      	movaps	%xmm1, -0x460(%rbp)
     fc2:      	movaps	%xmm0, -0x40(%rbp)
     fc6:      	movdqa	-0x40(%rbp), %xmm0
     fcb:      	movdqa	%xmm0, -0x450(%rbp)
     fd3:      	jmp	0x120c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x120c>
     fd8:      	movq	%rax, %r14
     fdb:      	xorl	%eax, %eax
     fdd:      	nopl	(%rax)
     fe0:      	movw	$0x0, -0x280(%rbp,%rax)
     fea:      	movw	$0x0, -0x27e(%rbp,%rax)
     ff4:      	movw	$0x0, -0x27c(%rbp,%rax)
     ffe:      	movw	$0x0, -0x27a(%rbp,%rax)
    1008:      	movw	$0x0, -0x278(%rbp,%rax)
    1012:      	movw	$0x0, -0x276(%rbp,%rax)
    101c:      	movw	$0x0, -0x274(%rbp,%rax)
    1026:      	movw	$0x0, -0x272(%rbp,%rax)
    1030:      	addq	$0x10, %rax
    1034:      	cmpq	$0x200, %rax            # imm = 0x200
    103a:      	jne	0xfe0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfe0>
    103c:      	jmp	0x113c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x113c>
    1041:      	movq	%rax, %r14
    1044:      	jmp	0x113c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x113c>
    1049:      	callq	0x104e <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x104e>
    104e:      	callq	0x1053 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1053>
    1053:      	movq	%rax, %r14
    1056:      	jmp	0x120c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x120c>
    105b:      	movq	%rax, %r14
    105e:      	xorl	%eax, %eax
    1060:      	movw	$0x0, -0x280(%rbp,%rax)
    106a:      	movw	$0x0, -0x27e(%rbp,%rax)
    1074:      	movw	$0x0, -0x27c(%rbp,%rax)
    107e:      	movw	$0x0, -0x27a(%rbp,%rax)
    1088:      	movw	$0x0, -0x278(%rbp,%rax)
    1092:      	movw	$0x0, -0x276(%rbp,%rax)
    109c:      	movw	$0x0, -0x274(%rbp,%rax)
    10a6:      	movw	$0x0, -0x272(%rbp,%rax)
    10b0:      	addq	$0x10, %rax
    10b4:      	cmpq	$0x200, %rax            # imm = 0x200
    10ba:      	jne	0x1060 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1060>
    10bc:      	jmp	0x120c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x120c>
    10c1:      	movq	%rax, %r14
    10c4:      	movq	%r13, -0x50(%rbp)
    10c8:      	jmp	0x13af <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x13af>
    10cd:      	movq	%rax, %r14
    10d0:      	xorl	%eax, %eax
    10d2:      	nopw	%cs:(%rax,%rax)
    10e0:      	movw	$0x0, -0x280(%rbp,%rax)
    10ea:      	movw	$0x0, -0x27e(%rbp,%rax)
    10f4:      	movw	$0x0, -0x27c(%rbp,%rax)
    10fe:      	movw	$0x0, -0x27a(%rbp,%rax)
    1108:      	movw	$0x0, -0x278(%rbp,%rax)
    1112:      	movw	$0x0, -0x276(%rbp,%rax)
    111c:      	movw	$0x0, -0x274(%rbp,%rax)
    1126:      	movw	$0x0, -0x272(%rbp,%rax)
    1130:      	addq	$0x10, %rax
    1134:      	cmpq	$0x200, %rax            # imm = 0x200
    113a:      	jne	0x10e0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x10e0>
    113c:      	xorl	%eax, %eax
    113e:      	nop
    1140:      	movw	$0x0, -0x480(%rbp,%rax)
    114a:      	movw	$0x0, -0x47e(%rbp,%rax)
    1154:      	movw	$0x0, -0x47c(%rbp,%rax)
    115e:      	movw	$0x0, -0x47a(%rbp,%rax)
    1168:      	movw	$0x0, -0x478(%rbp,%rax)
    1172:      	movw	$0x0, -0x476(%rbp,%rax)
    117c:      	movw	$0x0, -0x474(%rbp,%rax)
    1186:      	movw	$0x0, -0x472(%rbp,%rax)
    1190:      	addq	$0x10, %rax
    1194:      	cmpq	$0x200, %rax            # imm = 0x200
    119a:      	jne	0x1140 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1140>
    119c:      	jmp	0x120c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x120c>
    119e:      	movq	%rax, %r14
    11a1:      	xorl	%eax, %eax
    11a3:      	nopw	%cs:(%rax,%rax)
    11b0:      	movw	$0x0, -0x1080(%rbp,%rax)
    11ba:      	movw	$0x0, -0x107e(%rbp,%rax)
    11c4:      	movw	$0x0, -0x107c(%rbp,%rax)
    11ce:      	movw	$0x0, -0x107a(%rbp,%rax)
    11d8:      	movw	$0x0, -0x1078(%rbp,%rax)
    11e2:      	movw	$0x0, -0x1076(%rbp,%rax)
    11ec:      	movw	$0x0, -0x1074(%rbp,%rax)
    11f6:      	movw	$0x0, -0x1072(%rbp,%rax)
    1200:      	addq	$0x10, %rax
    1204:      	cmpq	$0x200, %rax            # imm = 0x200
    120a:      	jne	0x11b0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x11b0>
    120c:      	pxor	%xmm0, %xmm0
    1210:      	movdqa	%xmm0, -0x40(%rbp)
    1215:      	movaps	-0x40(%rbp), %xmm1
    1219:      	movaps	%xmm1, -0x60(%rbp)
    121d:      	movdqa	%xmm0, -0x40(%rbp)
    1222:      	movaps	-0x40(%rbp), %xmm0
    1226:      	movaps	%xmm0, -0x50(%rbp)
    122a:      	xorl	%eax, %eax
    122c:      	nopl	(%rax)
    1230:      	movw	$0x0, -0xa80(%rbp,%rax)
    123a:      	movw	$0x0, -0xa7e(%rbp,%rax)
    1244:      	movw	$0x0, -0xa7c(%rbp,%rax)
    124e:      	movw	$0x0, -0xa7a(%rbp,%rax)
    1258:      	movw	$0x0, -0xa78(%rbp,%rax)
    1262:      	movw	$0x0, -0xa76(%rbp,%rax)
    126c:      	movw	$0x0, -0xa74(%rbp,%rax)
    1276:      	movw	$0x0, -0xa72(%rbp,%rax)
    1280:      	addq	$0x10, %rax
    1284:      	cmpq	$0x200, %rax            # imm = 0x200
    128a:      	jne	0x1230 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1230>
    128c:      	xorl	%eax, %eax
    128e:      	nop
    1290:      	movw	$0x0, -0x880(%rbp,%rax)
    129a:      	movw	$0x0, -0x87e(%rbp,%rax)
    12a4:      	movw	$0x0, -0x87c(%rbp,%rax)
    12ae:      	movw	$0x0, -0x87a(%rbp,%rax)
    12b8:      	movw	$0x0, -0x878(%rbp,%rax)
    12c2:      	movw	$0x0, -0x876(%rbp,%rax)
    12cc:      	movw	$0x0, -0x874(%rbp,%rax)
    12d6:      	movw	$0x0, -0x872(%rbp,%rax)
    12e0:      	addq	$0x10, %rax
    12e4:      	cmpq	$0x200, %rax            # imm = 0x200
    12ea:      	jne	0x1290 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1290>
    12ec:      	xorl	%eax, %eax
    12ee:      	nop
    12f0:      	movw	$0x0, -0x680(%rbp,%rax)
    12fa:      	movw	$0x0, -0x67e(%rbp,%rax)
    1304:      	movw	$0x0, -0x67c(%rbp,%rax)
    130e:      	movw	$0x0, -0x67a(%rbp,%rax)
    1318:      	movw	$0x0, -0x678(%rbp,%rax)
    1322:      	movw	$0x0, -0x676(%rbp,%rax)
    132c:      	movw	$0x0, -0x674(%rbp,%rax)
    1336:      	movw	$0x0, -0x672(%rbp,%rax)
    1340:      	addq	$0x10, %rax
    1344:      	cmpq	$0x200, %rax            # imm = 0x200
    134a:      	jne	0x12f0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x12f0>
    134c:      	jmp	0x13b8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x13b8>
    134e:      	movq	%rax, %r14
    1351:      	xorl	%eax, %eax
    1353:      	movw	$0x0, -0xa80(%rbp,%rax)
    135d:      	movw	$0x0, -0xa7e(%rbp,%rax)
    1367:      	movw	$0x0, -0xa7c(%rbp,%rax)
    1371:      	movw	$0x0, -0xa7a(%rbp,%rax)
    137b:      	movw	$0x0, -0xa78(%rbp,%rax)
    1385:      	movw	$0x0, -0xa76(%rbp,%rax)
    138f:      	movw	$0x0, -0xa74(%rbp,%rax)
    1399:      	movw	$0x0, -0xa72(%rbp,%rax)
    13a3:      	addq	$0x10, %rax
    13a7:      	cmpq	$0x200, %rax            # imm = 0x200
    13ad:      	jne	0x1353 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1353>
    13af:      	leaq	-0x60(%rbp), %rdi
    13b3:      	callq	0x13b8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x13b8>
    13b8:      	movq	%rbx, %rdi
    13bb:      	callq	0x13c0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x13c0>
    13c0:      	movq	%r14, %rdi
    13c3:      	callq	0x13c8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x13c8>
    13c8:      	callq	0x13cd <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x13cd>

0000000000000000 <<toyos_crypto::mlkem::Poly>::ntt>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%r13
       a:      	pushq	%r12
       c:      	pushq	%rbx
       d:      	subq	$0x58, %rsp
      11:      	movq	%rsi, %rbx
      14:      	movq	%rdi, -0x30(%rbp)
      18:      	movl	$0x8, %eax
      1d:      	leaq	(%rip), %r14            # 0x24 <<toyos_crypto::mlkem::Poly>::ntt+0x24>
      24:      	jmp	0x46 <<toyos_crypto::mlkem::Poly>::ntt+0x46>
      26:      	nopw	%cs:(%rax,%rax)
      30:      	leaq	(%rip), %r14            # 0x37 <<toyos_crypto::mlkem::Poly>::ntt+0x37>
      37:      	cmpq	$0x2, -0x38(%rbp)
      3c:      	movq	-0x40(%rbp), %rax
      40:      	jbe	0x13e <<toyos_crypto::mlkem::Poly>::ntt+0x13e>
      46:      	movq	%rax, -0x38(%rbp)
      4a:      	leaq	-0x1(%rax), %rcx
      4e:      	movl	$0x1, %edx
      53:      	shlq	%cl, %rdx
      56:      	movl	$0x2, %edi
      5b:      	movq	%rcx, -0x40(%rbp)
      5f:      	shlq	%cl, %rdi
      62:      	movl	%edi, %r12d
      65:      	negl	%r12d
      68:      	andl	$0x100, %r12d           # imm = 0x100
      6f:      	movq	%rbx, %r13
      72:      	cmpq	%r12, %rdi
      75:      	movq	%rdx, -0x50(%rbp)
      79:      	movq	%rdi, -0x48(%rbp)
      7d:      	jbe	0xa4 <<toyos_crypto::mlkem::Poly>::ntt+0xa4>
      7f:      	jmp	0x37 <<toyos_crypto::mlkem::Poly>::ntt+0x37>
      81:      	nopw	%cs:(%rax,%rax)
      90:      	movq	-0x48(%rbp), %rdi
      94:      	subq	%rdi, %r12
      97:      	addq	$0x2, %r14
      9b:      	cmpq	%r12, %rdi
      9e:      	movq	-0x50(%rbp), %rdx
      a2:      	ja	0x37 <<toyos_crypto::mlkem::Poly>::ntt+0x37>
      a4:      	leaq	(%rip), %rax            # 0xab <<toyos_crypto::mlkem::Poly>::ntt+0xab>
      ab:      	cmpq	%rax, %r14
      ae:      	je	0x30 <<toyos_crypto::mlkem::Poly>::ntt+0x30>
      b0:      	cmpq	%rdi, %rdx
      b3:      	ja	0x1d2 <<toyos_crypto::mlkem::Poly>::ntt+0x1d2>
      b9:      	movq	%r13, %rsi
      bc:      	leaq	(%r13,%rdi,2), %r13
      c1:      	movswl	(%r14), %r15d
      c5:      	leaq	(%rsi,%rdx,2), %rcx
      c9:      	leaq	-0x80(%rbp), %rdi
      cd:      	movq	%rcx, %rdx
      d0:      	movq	%r13, %r8
      d3:      	callq	0xd8 <<toyos_crypto::mlkem::Poly>::ntt+0xd8>
      d8:      	movq	-0x60(%rbp), %rax
      dc:      	movq	-0x58(%rbp), %rcx
      e0:      	cmpq	%rcx, %rax
      e3:      	jae	0x90 <<toyos_crypto::mlkem::Poly>::ntt+0x90>
      e5:      	movq	-0x80(%rbp), %rdx
      e9:      	movq	-0x70(%rbp), %rsi
      ed:      	nopl	(%rax)
      f0:      	movswl	(%rsi,%rax,2), %r8d
      f5:      	imull	%r15d, %r8d
      f9:      	imull	$0xf3010000, %r8d, %edi # imm = 0xF3010000
     100:      	sarl	$0x10, %edi
     103:      	imull	$0xfffff2ff, %edi, %edi # imm = 0xFFFFF2FF
     109:      	addl	%r8d, %edi
     10c:      	shrl	$0x10, %edi
     10f:      	movzwl	(%rdx,%rax,2), %r8d
     114:      	subw	%di, %r8w
     118:      	jo	0x1ec <<toyos_crypto::mlkem::Poly>::ntt+0x1ec>
     11e:      	movw	%r8w, (%rsi,%rax,2)
     123:      	addw	(%rdx,%rax,2), %di
     127:      	jo	0x1fa <<toyos_crypto::mlkem::Poly>::ntt+0x1fa>
     12d:      	movw	%di, (%rdx,%rax,2)
     131:      	incq	%rax
     134:      	cmpq	%rax, %rcx
     137:      	jne	0xf0 <<toyos_crypto::mlkem::Poly>::ntt+0xf0>
     139:      	jmp	0x90 <<toyos_crypto::mlkem::Poly>::ntt+0x90>
     13e:      	xorl	%eax, %eax
     140:      	movdqa	(%rip), %xmm0           # 0x148 <<toyos_crypto::mlkem::Poly>::ntt+0x148>
     148:      	movdqa	(%rip), %xmm1           # 0x150 <<toyos_crypto::mlkem::Poly>::ntt+0x150>
     150:      	movdqa	(%rip), %xmm2           # 0x158 <<toyos_crypto::mlkem::Poly>::ntt+0x158>
     158:      	nopl	(%rax,%rax)
     160:      	movdqu	(%rbx,%rax,2), %xmm3
     165:      	movdqa	%xmm3, %xmm4
     169:      	punpcklwd	%xmm4, %xmm4    # xmm4 = xmm4[0,0,1,1,2,2,3,3]
     16d:      	movdqa	%xmm3, %xmm5
     171:      	punpckhwd	%xmm5, %xmm5    # xmm5 = xmm5[4,4,5,5,6,6,7,7]
     175:      	pmaddwd	%xmm0, %xmm5
     179:      	pmaddwd	%xmm0, %xmm4
     17d:      	paddd	%xmm1, %xmm4
     181:      	paddd	%xmm1, %xmm5
     185:      	psrad	$0x1a, %xmm5
     18a:      	psrad	$0x1a, %xmm4
     18f:      	packssdw	%xmm5, %xmm4
     193:      	pmullw	%xmm2, %xmm4
     197:      	paddw	%xmm3, %xmm4
     19b:      	movdqu	%xmm4, (%rbx,%rax,2)
     1a0:      	addq	$0x8, %rax
     1a4:      	cmpq	$0x100, %rax            # imm = 0x100
     1aa:      	jne	0x160 <<toyos_crypto::mlkem::Poly>::ntt+0x160>
     1ac:      	movl	$0x200, %edx            # imm = 0x200
     1b1:      	movq	-0x30(%rbp), %r14
     1b5:      	movq	%r14, %rdi
     1b8:      	movq	%rbx, %rsi
     1bb:      	callq	0x1c0 <<toyos_crypto::mlkem::Poly>::ntt+0x1c0>
     1c0:      	movq	%r14, %rax
     1c3:      	addq	$0x58, %rsp
     1c7:      	popq	%rbx
     1c8:      	popq	%r12
     1ca:      	popq	%r13
     1cc:      	popq	%r14
     1ce:      	popq	%r15
     1d0:      	popq	%rbp
     1d1:      	retq
     1d2:      	leaq	(%rip), %rdi            # 0x1d9 <<toyos_crypto::mlkem::Poly>::ntt+0x1d9>
     1d9:      	leaq	(%rip), %rdx            # 0x1e0 <<toyos_crypto::mlkem::Poly>::ntt+0x1e0>
     1e0:      	movl	$0x13, %esi
     1e5:      	callq	0x1ea <<toyos_crypto::mlkem::Poly>::ntt+0x1ea>
     1ea:      	jmp	0x206 <<toyos_crypto::mlkem::Poly>::ntt+0x206>
     1ec:      	leaq	(%rip), %rdi            # 0x1f3 <<toyos_crypto::mlkem::Poly>::ntt+0x1f3>
     1f3:      	callq	0x1f8 <<toyos_crypto::mlkem::Poly>::ntt+0x1f8>
     1f8:      	jmp	0x206 <<toyos_crypto::mlkem::Poly>::ntt+0x206>
     1fa:      	leaq	(%rip), %rdi            # 0x201 <<toyos_crypto::mlkem::Poly>::ntt+0x201>
     201:      	callq	0x206 <<toyos_crypto::mlkem::Poly>::ntt+0x206>
     206:      	ud2
     208:      	jmp	0x20a <<toyos_crypto::mlkem::Poly>::ntt+0x20a>
     20a:      	xorl	%ecx, %ecx
     20c:      	nopl	(%rax)
     210:      	movw	$0x0, (%rbx,%rcx)
     216:      	movw	$0x0, 0x2(%rbx,%rcx)
     21d:      	movw	$0x0, 0x4(%rbx,%rcx)
     224:      	movw	$0x0, 0x6(%rbx,%rcx)
     22b:      	movw	$0x0, 0x8(%rbx,%rcx)
     232:      	movw	$0x0, 0xa(%rbx,%rcx)
     239:      	movw	$0x0, 0xc(%rbx,%rcx)
     240:      	movw	$0x0, 0xe(%rbx,%rcx)
     247:      	addq	$0x10, %rcx
     24b:      	cmpq	$0x200, %rcx            # imm = 0x200
     252:      	jne	0x210 <<toyos_crypto::mlkem::Poly>::ntt+0x210>
     254:      	movq	%rax, %rdi
     257:      	callq	0x25c <<toyos_crypto::mlkem::Poly>::ntt+0x25c>

0000000000000000 <<toyos_crypto::mlkem::Poly>::plus>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%rbx
       9:      	pushq	%rax
       a:      	movq	%rdx, %r15
       d:      	movq	%rsi, %rbx
      10:      	movq	%rdi, %r14
      13:      	leaq	0x200(%rsi), %rdi
      1a:      	callq	0x1f <<toyos_crypto::mlkem::Poly>::plus+0x1f>
      1f:      	testb	%al, %al
      21:      	je	0x8b <<toyos_crypto::mlkem::Poly>::plus+0x8b>
      23:      	leaq	0x200(%r15), %rdi
      2a:      	movq	%r15, %rsi
      2d:      	callq	0x32 <<toyos_crypto::mlkem::Poly>::plus+0x32>
      32:      	testb	%al, %al
      34:      	je	0x8b <<toyos_crypto::mlkem::Poly>::plus+0x8b>
      36:      	movl	$0x1, %eax
      3b:      	nopl	(%rax,%rax)
      40:      	movzwl	-0x2(%rbx,%rax,2), %ecx
      45:      	addw	-0x2(%r15,%rax,2), %cx
      4b:      	jo	0xa5 <<toyos_crypto::mlkem::Poly>::plus+0xa5>
      4d:      	movw	%cx, -0x2(%rbx,%rax,2)
      52:      	movzwl	(%rbx,%rax,2), %ecx
      56:      	addw	(%r15,%rax,2), %cx
      5b:      	jo	0xa5 <<toyos_crypto::mlkem::Poly>::plus+0xa5>
      5d:      	movw	%cx, (%rbx,%rax,2)
      61:      	addq	$0x2, %rax
      65:      	cmpq	$0x101, %rax            # imm = 0x101
      6b:      	jne	0x40 <<toyos_crypto::mlkem::Poly>::plus+0x40>
      6d:      	movl	$0x200, %edx            # imm = 0x200
      72:      	movq	%r14, %rdi
      75:      	movq	%rbx, %rsi
      78:      	callq	0x7d <<toyos_crypto::mlkem::Poly>::plus+0x7d>
      7d:      	movq	%r14, %rax
      80:      	addq	$0x8, %rsp
      84:      	popq	%rbx
      85:      	popq	%r14
      87:      	popq	%r15
      89:      	popq	%rbp
      8a:      	retq
      8b:      	leaq	(%rip), %rdi            # 0x92 <<toyos_crypto::mlkem::Poly>::plus+0x92>
      92:      	leaq	(%rip), %rcx            # 0x99 <<toyos_crypto::mlkem::Poly>::plus+0x99>
      99:      	movl	$0x193, %esi            # imm = 0x193
      9e:      	xorl	%edx, %edx
      a0:      	callq	0xa5 <<toyos_crypto::mlkem::Poly>::plus+0xa5>
      a5:      	leaq	(%rip), %rdi            # 0xac <<toyos_crypto::mlkem::Poly>::plus+0xac>
      ac:      	callq	0xb1 <<toyos_crypto::mlkem::Poly>::plus+0xb1>
      b1:      	ud2
      b3:      	callq	0xb8 <<toyos_crypto::mlkem::Poly>::plus+0xb8>
      b8:      	callq	0xbd <<toyos_crypto::mlkem::Poly>::plus+0xbd>
      bd:      	xorl	%ecx, %ecx
      bf:      	nop
      c0:      	movw	$0x0, (%rbx,%rcx)
      c6:      	movw	$0x0, 0x2(%rbx,%rcx)
      cd:      	movw	$0x0, 0x4(%rbx,%rcx)
      d4:      	movw	$0x0, 0x6(%rbx,%rcx)
      db:      	movw	$0x0, 0x8(%rbx,%rcx)
      e2:      	movw	$0x0, 0xa(%rbx,%rcx)
      e9:      	movw	$0x0, 0xc(%rbx,%rcx)
      f0:      	movw	$0x0, 0xe(%rbx,%rcx)
      f7:      	addq	$0x10, %rcx
      fb:      	cmpq	$0x200, %rcx            # imm = 0x200
     102:      	jne	0xc0 <<toyos_crypto::mlkem::Poly>::plus+0xc0>
     104:      	movq	%rax, %rdi
     107:      	callq	0x10c <<toyos_crypto::mlkem::Poly>::plus+0x10c>

0000000000000000 <<toyos_crypto::mlkem::Poly>::zero>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%rbx
       5:      	pushq	%rax
       6:      	movq	%rdi, %rbx
       9:      	movl	$0x200, %edx            # imm = 0x200
       e:      	xorl	%esi, %esi
      10:      	callq	0x15 <<toyos_crypto::mlkem::Poly>::zero+0x15>
      15:      	movq	%rbx, %rax
      18:      	addq	$0x8, %rsp
      1c:      	popq	%rbx
      1d:      	popq	%rbp
      1e:      	retq

0000000000000000 <<toyos_crypto::mlkem::Poly>::scale>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%rbx
       5:      	pushq	%rax
       6:      	movq	%rdi, %rbx
       9:      	movswl	%dx, %eax
       c:      	movd	%eax, %xmm0
      10:      	pshufd	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
      15:      	movdqa	(%rip), %xmm1           # 0x1d <<toyos_crypto::mlkem::Poly>::scale+0x1d>
      1d:      	pmuludq	%xmm0, %xmm1
      21:      	pshufd	$0xa0, %xmm1, %xmm1     # xmm1 = xmm1[0,0,2,2]
      26:      	xorl	%eax, %eax
      28:      	pshufd	$0xf5, %xmm0, %xmm2     # xmm2 = xmm0[1,1,3,3]
      2d:      	pshufd	$0xf5, %xmm1, %xmm3     # xmm3 = xmm1[1,1,3,3]
      32:      	movdqa	(%rip), %xmm4           # 0x3a <<toyos_crypto::mlkem::Poly>::scale+0x3a>
      3a:      	nopw	(%rax,%rax)
      40:      	movdqu	(%rsi,%rax,2), %xmm5
      45:      	punpcklwd	%xmm5, %xmm7    # xmm7 = xmm7[0],xmm5[0],xmm7[1],xmm5[1],xmm7[2],xmm5[2],xmm7[3],xmm5[3]
      49:      	psrad	$0x10, %xmm7
      4e:      	punpckhwd	%xmm5, %xmm8    # xmm8 = xmm8[4],xmm5[4],xmm8[5],xmm5[5],xmm8[6],xmm5[6],xmm8[7],xmm5[7]
      53:      	psrad	$0x10, %xmm8
      59:      	movdqa	%xmm0, %xmm5
      5d:      	pmuludq	%xmm8, %xmm5
      62:      	pshufd	$0xe8, %xmm5, %xmm5     # xmm5 = xmm5[0,2,2,3]
      67:      	pshufd	$0xf5, %xmm8, %xmm9     # xmm9 = xmm8[1,1,3,3]
      6d:      	movdqa	%xmm2, %xmm6
      71:      	pmuludq	%xmm9, %xmm6
      76:      	pshufd	$0xe8, %xmm6, %xmm6     # xmm6 = xmm6[0,2,2,3]
      7b:      	punpckldq	%xmm6, %xmm5    # xmm5 = xmm5[0],xmm6[0],xmm5[1],xmm6[1]
      7f:      	movdqa	%xmm0, %xmm6
      83:      	pmuludq	%xmm7, %xmm6
      87:      	pshufd	$0xe8, %xmm6, %xmm6     # xmm6 = xmm6[0,2,2,3]
      8c:      	pshufd	$0xf5, %xmm7, %xmm10    # xmm10 = xmm7[1,1,3,3]
      92:      	movdqa	%xmm2, %xmm11
      97:      	pmuludq	%xmm10, %xmm11
      9c:      	pshufd	$0xe8, %xmm11, %xmm11   # xmm11 = xmm11[0,2,2,3]
      a2:      	punpckldq	%xmm11, %xmm6   # xmm6 = xmm6[0],xmm11[0],xmm6[1],xmm11[1]
      a7:      	pmuludq	%xmm1, %xmm8
      ac:      	pshufd	$0xe8, %xmm8, %xmm8     # xmm8 = xmm8[0,2,2,3]
      b2:      	pmuludq	%xmm3, %xmm9
      b7:      	pshufd	$0xe8, %xmm9, %xmm9     # xmm9 = xmm9[0,2,2,3]
      bd:      	punpckldq	%xmm9, %xmm8    # xmm8 = xmm8[0],xmm9[0],xmm8[1],xmm9[1]
      c2:      	pmuludq	%xmm1, %xmm7
      c6:      	pshufd	$0xe8, %xmm7, %xmm7     # xmm7 = xmm7[0,2,2,3]
      cb:      	pmuludq	%xmm3, %xmm10
      d0:      	pshufd	$0xe8, %xmm10, %xmm9    # xmm9 = xmm10[0,2,2,3]
      d6:      	punpckldq	%xmm9, %xmm7    # xmm7 = xmm7[0],xmm9[0],xmm7[1],xmm9[1]
      db:      	psrld	$0x10, %xmm7
      e0:      	psrld	$0x10, %xmm8
      e6:      	pmaddwd	%xmm4, %xmm8
      eb:      	paddd	%xmm5, %xmm8
      f0:      	pmaddwd	%xmm4, %xmm7
      f4:      	paddd	%xmm6, %xmm7
      f8:      	psrad	$0x10, %xmm8
      fe:      	psrad	$0x10, %xmm7
     103:      	packssdw	%xmm8, %xmm7
     108:      	movdqu	%xmm7, (%rsi,%rax,2)
     10d:      	addq	$0x8, %rax
     111:      	cmpq	$0x100, %rax            # imm = 0x100
     117:      	jne	0x40 <<toyos_crypto::mlkem::Poly>::scale+0x40>
     11d:      	movl	$0x200, %edx            # imm = 0x200
     122:      	movq	%rbx, %rdi
     125:      	callq	0x12a <<toyos_crypto::mlkem::Poly>::scale+0x12a>
     12a:      	movq	%rbx, %rax
     12d:      	addq	$0x8, %rsp
     131:      	popq	%rbx
     132:      	popq	%rbp
     133:      	retq

0000000000000000 <<toyos_crypto::mlkem::Poly>::inverse>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%r13
       a:      	pushq	%r12
       c:      	pushq	%rbx
       d:      	subq	$0x228, %rsp            # imm = 0x228
      14:      	movq	%rsi, %r14
      17:      	movq	%rdi, -0x30(%rbp)
      1b:      	movl	$0x1, %ecx
      20:      	leaq	(%rip), %rbx            # 0x27 <<toyos_crypto::mlkem::Poly>::inverse+0x27>
      27:      	jmp	0x48 <<toyos_crypto::mlkem::Poly>::inverse+0x48>
      29:      	nopl	(%rax)
      30:      	leaq	(%rip), %rbx            # 0x37 <<toyos_crypto::mlkem::Poly>::inverse+0x37>
      37:      	movq	-0x38(%rbp), %rcx
      3b:      	incq	%rcx
      3e:      	cmpq	$0x8, %rcx
      42:      	je	0x16a <<toyos_crypto::mlkem::Poly>::inverse+0x16a>
      48:      	movl	$0x1, %eax
      4d:      	shlq	%cl, %rax
      50:      	movq	%rax, -0x48(%rbp)
      54:      	movl	$0x2, %edx
      59:      	movq	%rcx, -0x38(%rbp)
      5d:      	shlq	%cl, %rdx
      60:      	movl	%edx, %r15d
      63:      	negl	%r15d
      66:      	andl	$0x100, %r15d           # imm = 0x100
      6d:      	movq	%r14, %r13
      70:      	cmpq	%r15, %rdx
      73:      	movq	%rdx, -0x40(%rbp)
      77:      	jbe	0x90 <<toyos_crypto::mlkem::Poly>::inverse+0x90>
      79:      	jmp	0x37 <<toyos_crypto::mlkem::Poly>::inverse+0x37>
      7b:      	nopl	(%rax,%rax)
      80:      	movq	-0x40(%rbp), %rdx
      84:      	subq	%rdx, %r15
      87:      	addq	$-0x2, %rbx
      8b:      	cmpq	%r15, %rdx
      8e:      	ja	0x37 <<toyos_crypto::mlkem::Poly>::inverse+0x37>
      90:      	leaq	(%rip), %rax            # 0x97 <<toyos_crypto::mlkem::Poly>::inverse+0x97>
      97:      	cmpq	%rax, %rbx
      9a:      	je	0x30 <<toyos_crypto::mlkem::Poly>::inverse+0x30>
      9c:      	movq	%r13, %rsi
      9f:      	leaq	(%r13,%rdx,2), %r13
      a4:      	movswl	-0x2(%rbx), %r12d
      a9:      	movq	-0x48(%rbp), %rax
      ad:      	leaq	(%rsi,%rax,2), %rcx
      b1:      	leaq	-0x248(%rbp), %rdi
      b8:      	movq	%rcx, %rdx
      bb:      	movq	%r13, %r8
      be:      	callq	0xc3 <<toyos_crypto::mlkem::Poly>::inverse+0xc3>
      c3:      	movq	-0x228(%rbp), %rax
      ca:      	movq	-0x220(%rbp), %rcx
      d1:      	cmpq	%rcx, %rax
      d4:      	jae	0x80 <<toyos_crypto::mlkem::Poly>::inverse+0x80>
      d6:      	movq	-0x248(%rbp), %rdx
      dd:      	movq	-0x238(%rbp), %rsi
      e4:      	nopw	%cs:(%rax,%rax)
      f0:      	movzwl	(%rdx,%rax,2), %edi
      f4:      	movzwl	(%rsi,%rax,2), %r8d
      f9:      	addw	%di, %r8w
      fd:      	jo	0x27d <<toyos_crypto::mlkem::Poly>::inverse+0x27d>
     103:      	movswl	%r8w, %r9d
     107:      	imull	$0x4ebf, %r9d, %r9d     # imm = 0x4EBF
     10e:      	addl	$0x2000000, %r9d        # imm = 0x2000000
     115:      	sarl	$0x1a, %r9d
     119:      	imull	$0xfffff2ff, %r9d, %r9d # imm = 0xFFFFF2FF
     120:      	addl	%r8d, %r9d
     123:      	movw	%r9w, (%rdx,%rax,2)
     128:      	movzwl	(%rsi,%rax,2), %r8d
     12d:      	subw	%di, %r8w
     131:      	jo	0x28b <<toyos_crypto::mlkem::Poly>::inverse+0x28b>
     137:      	movswl	%r8w, %edi
     13b:      	imull	%r12d, %edi
     13f:      	imull	$0xf3010000, %edi, %r8d # imm = 0xF3010000
     146:      	sarl	$0x10, %r8d
     14a:      	imull	$0xfffff2ff, %r8d, %r8d # imm = 0xFFFFF2FF
     151:      	addl	%edi, %r8d
     154:      	shrl	$0x10, %r8d
     158:      	movw	%r8w, (%rsi,%rax,2)
     15d:      	incq	%rax
     160:      	cmpq	%rax, %rcx
     163:      	jne	0xf0 <<toyos_crypto::mlkem::Poly>::inverse+0xf0>
     165:      	jmp	0x80 <<toyos_crypto::mlkem::Poly>::inverse+0x80>
     16a:      	leaq	-0x248(%rbp), %rdi
     171:      	movl	$0x200, %edx            # imm = 0x200
     176:      	movq	%r14, %rsi
     179:      	callq	0x17e <<toyos_crypto::mlkem::Poly>::inverse+0x17e>
     17e:      	xorl	%eax, %eax
     180:      	movdqa	(%rip), %xmm0           # 0x188 <<toyos_crypto::mlkem::Poly>::inverse+0x188>
     188:      	movdqa	(%rip), %xmm1           # 0x190 <<toyos_crypto::mlkem::Poly>::inverse+0x190>
     190:      	movdqu	-0x248(%rbp,%rax,2), %xmm3
     199:      	punpckhwd	%xmm3, %xmm2    # xmm2 = xmm2[4],xmm3[4],xmm2[5],xmm3[5],xmm2[6],xmm3[6],xmm2[7],xmm3[7]
     19d:      	psrad	$0x10, %xmm2
     1a2:      	punpcklwd	%xmm3, %xmm3    # xmm3 = xmm3[0,0,1,1,2,2,3,3]
     1a6:      	psrad	$0x10, %xmm3
     1ab:      	movdqa	%xmm3, %xmm4
     1af:      	pmuludq	%xmm0, %xmm4
     1b3:      	pshufd	$0xe8, %xmm4, %xmm4     # xmm4 = xmm4[0,2,2,3]
     1b8:      	pshufd	$0xf5, %xmm3, %xmm5     # xmm5 = xmm3[1,1,3,3]
     1bd:      	pmuludq	%xmm0, %xmm5
     1c1:      	pshufd	$0xe8, %xmm5, %xmm5     # xmm5 = xmm5[0,2,2,3]
     1c6:      	punpckldq	%xmm5, %xmm4    # xmm4 = xmm4[0],xmm5[0],xmm4[1],xmm5[1]
     1ca:      	movdqa	%xmm2, %xmm5
     1ce:      	pmuludq	%xmm0, %xmm5
     1d2:      	pshufd	$0xe8, %xmm5, %xmm5     # xmm5 = xmm5[0,2,2,3]
     1d7:      	pshufd	$0xf5, %xmm2, %xmm6     # xmm6 = xmm2[1,1,3,3]
     1dc:      	pmuludq	%xmm0, %xmm6
     1e0:      	pshufd	$0xe8, %xmm6, %xmm6     # xmm6 = xmm6[0,2,2,3]
     1e5:      	punpckldq	%xmm6, %xmm5    # xmm5 = xmm5[0],xmm6[0],xmm5[1],xmm6[1]
     1e9:      	psrld	$0x10, %xmm5
     1ee:      	psrld	$0x10, %xmm4
     1f3:      	pshuflw	$0xe8, %xmm4, %xmm4     # xmm4 = xmm4[0,2,2,3,4,5,6,7]
     1f8:      	pshufhw	$0xe8, %xmm4, %xmm4     # xmm4 = xmm4[0,1,2,3,4,6,6,7]
     1fd:      	pshufd	$0xe8, %xmm4, %xmm4     # xmm4 = xmm4[0,2,2,3]
     202:      	packssdw	%xmm3, %xmm3
     206:      	punpcklwd	%xmm3, %xmm4    # xmm4 = xmm4[0],xmm3[0],xmm4[1],xmm3[1],xmm4[2],xmm3[2],xmm4[3],xmm3[3]
     20a:      	pmaddwd	%xmm1, %xmm4
     20e:      	pshuflw	$0xe8, %xmm5, %xmm3     # xmm3 = xmm5[0,2,2,3,4,5,6,7]
     213:      	pshufhw	$0xe8, %xmm3, %xmm3     # xmm3 = xmm3[0,1,2,3,4,6,6,7]
     218:      	pshufd	$0xe8, %xmm3, %xmm3     # xmm3 = xmm3[0,2,2,3]
     21d:      	packssdw	%xmm2, %xmm2
     221:      	punpcklwd	%xmm2, %xmm3    # xmm3 = xmm3[0],xmm2[0],xmm3[1],xmm2[1],xmm3[2],xmm2[2],xmm3[3],xmm2[3]
     225:      	pmaddwd	%xmm1, %xmm3
     229:      	psrad	$0x10, %xmm3
     22e:      	psrad	$0x10, %xmm4
     233:      	packssdw	%xmm3, %xmm4
     237:      	movdqu	%xmm4, -0x248(%rbp,%rax,2)
     240:      	addq	$0x8, %rax
     244:      	cmpq	$0x100, %rax            # imm = 0x100
     24a:      	jne	0x190 <<toyos_crypto::mlkem::Poly>::inverse+0x190>
     250:      	leaq	-0x248(%rbp), %rsi
     257:      	movl	$0x200, %edx            # imm = 0x200
     25c:      	movq	-0x30(%rbp), %rbx
     260:      	movq	%rbx, %rdi
     263:      	callq	0x268 <<toyos_crypto::mlkem::Poly>::inverse+0x268>
     268:      	movq	%rbx, %rax
     26b:      	addq	$0x228, %rsp            # imm = 0x228
     272:      	popq	%rbx
     273:      	popq	%r12
     275:      	popq	%r13
     277:      	popq	%r14
     279:      	popq	%r15
     27b:      	popq	%rbp
     27c:      	retq
     27d:      	leaq	(%rip), %rdi            # 0x284 <<toyos_crypto::mlkem::Poly>::inverse+0x284>
     284:      	callq	0x289 <<toyos_crypto::mlkem::Poly>::inverse+0x289>
     289:      	jmp	0x297 <<toyos_crypto::mlkem::Poly>::inverse+0x297>
     28b:      	leaq	(%rip), %rdi            # 0x292 <<toyos_crypto::mlkem::Poly>::inverse+0x292>
     292:      	callq	0x297 <<toyos_crypto::mlkem::Poly>::inverse+0x297>
     297:      	ud2
     299:      	jmp	0x29b <<toyos_crypto::mlkem::Poly>::inverse+0x29b>
     29b:      	xorl	%ecx, %ecx
     29d:      	nopl	(%rax)
     2a0:      	movw	$0x0, (%r14,%rcx)
     2a7:      	movw	$0x0, 0x2(%r14,%rcx)
     2af:      	movw	$0x0, 0x4(%r14,%rcx)
     2b7:      	movw	$0x0, 0x6(%r14,%rcx)
     2bf:      	movw	$0x0, 0x8(%r14,%rcx)
     2c7:      	movw	$0x0, 0xa(%r14,%rcx)
     2cf:      	movw	$0x0, 0xc(%r14,%rcx)
     2d7:      	movw	$0x0, 0xe(%r14,%rcx)
     2df:      	addq	$0x10, %rcx
     2e3:      	cmpq	$0x200, %rcx            # imm = 0x200
     2ea:      	jne	0x2a0 <<toyos_crypto::mlkem::Poly>::inverse+0x2a0>
     2ec:      	movq	%rax, %rdi
     2ef:      	callq	0x2f4 <<toyos_crypto::mlkem::Poly>::inverse+0x2f4>

0000000000000000 <<toyos_crypto::mlkem::Poly>::compress>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r14
       6:      	pushq	%rbx
       7:      	subq	$0x10, %rsp
       b:      	movq	%rdx, %rcx
       e:      	movq	%rsi, %rbx
      11:      	movl	$0xffffffff, %esi       # imm = 0xFFFFFFFF
      16:      	shll	%cl, %esi
      18:      	movq	%rdi, %r14
      1b:      	notl	%esi
      1d:      	xorl	%edi, %edi
      1f:      	leaq	-0x14(%rbp), %r8
      23:      	nopw	%cs:(%rax,%rax)
      30:      	movswl	(%rbx,%rdi), %eax
      34:      	imull	$0x4ebf, %eax, %edx     # imm = 0x4EBF
      3a:      	addl	$0x2000000, %edx        # imm = 0x2000000
      40:      	sarl	$0x1a, %edx
      43:      	imull	$0xfffff2ff, %edx, %edx # imm = 0xFFFFF2FF
      49:      	addl	%eax, %edx
      4b:      	movswl	%dx, %eax
      4e:      	movl	%eax, %edx
      50:      	shrl	$0xf, %edx
      53:      	andl	$0xd01, %edx            # imm = 0xD01
      59:      	addw	%dx, %ax
      5c:      	jo	0xbf <<toyos_crypto::mlkem::Poly>::compress+0xbf>
      5e:      	cwtl
      5f:      	shll	%cl, %eax
      61:      	cmpl	$0xfffff97f, %eax       # imm = 0xFFFFF97F
      66:      	ja	0xcd <<toyos_crypto::mlkem::Poly>::compress+0xcd>
      68:      	movl	$0xd01, -0x14(%rbp)     # imm = 0xD01
      6f:      	movl	-0x14(%rbp), %r9d
      73:      	testl	%r9d, %r9d
      76:      	je	0xb1 <<toyos_crypto::mlkem::Poly>::compress+0xb1>
      78:      	addl	$0x680, %eax            # imm = 0x680
      7d:      	xorl	%edx, %edx
      7f:      	divl	%r9d
      82:      	andl	%esi, %eax
      84:      	movw	%ax, (%rbx,%rdi)
      88:      	addq	$0x2, %rdi
      8c:      	cmpq	$0x200, %rdi            # imm = 0x200
      93:      	jne	0x30 <<toyos_crypto::mlkem::Poly>::compress+0x30>
      95:      	movl	$0x200, %edx            # imm = 0x200
      9a:      	movq	%r14, %rdi
      9d:      	movq	%rbx, %rsi
      a0:      	callq	0xa5 <<toyos_crypto::mlkem::Poly>::compress+0xa5>
      a5:      	movq	%r14, %rax
      a8:      	addq	$0x10, %rsp
      ac:      	popq	%rbx
      ad:      	popq	%r14
      af:      	popq	%rbp
      b0:      	retq
      b1:      	leaq	(%rip), %rdi            # 0xb8 <<toyos_crypto::mlkem::Poly>::compress+0xb8>
      b8:      	callq	0xbd <<toyos_crypto::mlkem::Poly>::compress+0xbd>
      bd:      	jmp	0xd9 <<toyos_crypto::mlkem::Poly>::compress+0xd9>
      bf:      	leaq	(%rip), %rdi            # 0xc6 <<toyos_crypto::mlkem::Poly>::compress+0xc6>
      c6:      	callq	0xcb <<toyos_crypto::mlkem::Poly>::compress+0xcb>
      cb:      	jmp	0xd9 <<toyos_crypto::mlkem::Poly>::compress+0xd9>
      cd:      	leaq	(%rip), %rdi            # 0xd4 <<toyos_crypto::mlkem::Poly>::compress+0xd4>
      d4:      	callq	0xd9 <<toyos_crypto::mlkem::Poly>::compress+0xd9>
      d9:      	ud2
      db:      	xorl	%ecx, %ecx
      dd:      	nopl	(%rax)
      e0:      	movw	$0x0, (%rbx,%rcx)
      e6:      	movw	$0x0, 0x2(%rbx,%rcx)
      ed:      	movw	$0x0, 0x4(%rbx,%rcx)
      f4:      	movw	$0x0, 0x6(%rbx,%rcx)
      fb:      	movw	$0x0, 0x8(%rbx,%rcx)
     102:      	movw	$0x0, 0xa(%rbx,%rcx)
     109:      	movw	$0x0, 0xc(%rbx,%rcx)
     110:      	movw	$0x0, 0xe(%rbx,%rcx)
     117:      	addq	$0x10, %rcx
     11b:      	cmpq	$0x200, %rcx            # imm = 0x200
     122:      	jne	0xe0 <<toyos_crypto::mlkem::Poly>::compress+0xe0>
     124:      	movq	%rax, %rdi
     127:      	callq	0x12c <<toyos_crypto::mlkem::Poly>::compress+0x12c>

0000000000000000 <<toyos_crypto::mlkem::Poly>::canonical>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r14
       6:      	pushq	%rbx
       7:      	movq	%rsi, %rbx
       a:      	movq	%rdi, %r14
       d:      	xorl	%eax, %eax
       f:      	nop
      10:      	movswl	(%rbx,%rax), %ecx
      14:      	imull	$0x4ebf, %ecx, %edx     # imm = 0x4EBF
      1a:      	addl	$0x2000000, %edx        # imm = 0x2000000
      20:      	sarl	$0x1a, %edx
      23:      	imull	$0xfffff2ff, %edx, %edx # imm = 0xFFFFF2FF
      29:      	addl	%ecx, %edx
      2b:      	movswl	%dx, %ecx
      2e:      	movl	%ecx, %edx
      30:      	shrl	$0xf, %edx
      33:      	andl	$0xd01, %edx            # imm = 0xD01
      39:      	addw	%dx, %cx
      3c:      	jo	0x66 <<toyos_crypto::mlkem::Poly>::canonical+0x66>
      3e:      	movw	%cx, (%rbx,%rax)
      42:      	addq	$0x2, %rax
      46:      	cmpq	$0x200, %rax            # imm = 0x200
      4c:      	jne	0x10 <<toyos_crypto::mlkem::Poly>::canonical+0x10>
      4e:      	movl	$0x200, %edx            # imm = 0x200
      53:      	movq	%r14, %rdi
      56:      	movq	%rbx, %rsi
      59:      	callq	0x5e <<toyos_crypto::mlkem::Poly>::canonical+0x5e>
      5e:      	movq	%r14, %rax
      61:      	popq	%rbx
      62:      	popq	%r14
      64:      	popq	%rbp
      65:      	retq
      66:      	leaq	(%rip), %rdi            # 0x6d <<toyos_crypto::mlkem::Poly>::canonical+0x6d>
      6d:      	callq	0x72 <<toyos_crypto::mlkem::Poly>::canonical+0x72>
      72:      	ud2
      74:      	xorl	%ecx, %ecx
      76:      	nopw	%cs:(%rax,%rax)
      80:      	movw	$0x0, (%rbx,%rcx)
      86:      	movw	$0x0, 0x2(%rbx,%rcx)
      8d:      	movw	$0x0, 0x4(%rbx,%rcx)
      94:      	movw	$0x0, 0x6(%rbx,%rcx)
      9b:      	movw	$0x0, 0x8(%rbx,%rcx)
      a2:      	movw	$0x0, 0xa(%rbx,%rcx)
      a9:      	movw	$0x0, 0xc(%rbx,%rcx)
      b0:      	movw	$0x0, 0xe(%rbx,%rcx)
      b7:      	addq	$0x10, %rcx
      bb:      	cmpq	$0x200, %rcx            # imm = 0x200
      c2:      	jne	0x80 <<toyos_crypto::mlkem::Poly>::canonical+0x80>
      c4:      	movq	%rax, %rdi
      c7:      	callq	0xcc <<toyos_crypto::mlkem::Poly>::canonical+0xcc>

0000000000000000 <toyos_crypto::mlkem::dot>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%r13
       a:      	pushq	%r12
       c:      	pushq	%rbx
       d:      	subq	$0x228, %rsp            # imm = 0x228
      14:      	movq	%rdx, %r14
      17:      	movq	%rsi, %r15
      1a:      	movq	%rdi, -0x30(%rbp)
      1e:      	leaq	-0x248(%rbp), %rdi
      25:      	xorl	%ebx, %ebx
      27:      	movl	$0x200, %edx            # imm = 0x200
      2c:      	xorl	%esi, %esi
      2e:      	callq	0x33 <toyos_crypto::mlkem::dot+0x33>
      33:      	leaq	0x600(%r15), %rax
      3a:      	movq	%rax, -0x48(%rbp)
      3e:      	leaq	0x600(%r14), %rax
      45:      	movq	%rax, -0x38(%rbp)
      49:      	movq	%r14, -0x40(%rbp)
      4d:      	leaq	0x402(%r14), %r13
      54:      	movq	%r15, %r12
      57:      	leaq	0x402(%r15), %r14
      5e:      	nop
      60:      	leaq	(%rip), %rax            # 0x67 <toyos_crypto::mlkem::dot+0x67>
      67:      	movswl	(%rbx,%rax), %r15d
      6c:      	movq	-0x48(%rbp), %rdi
      70:      	movq	%r12, %rsi
      73:      	callq	0x78 <toyos_crypto::mlkem::dot+0x78>
      78:      	testb	%al, %al
      7a:      	je	0x244 <toyos_crypto::mlkem::dot+0x244>
      80:      	movq	-0x38(%rbp), %rdi
      84:      	movq	-0x40(%rbp), %rsi
      88:      	callq	0x8d <toyos_crypto::mlkem::dot+0x8d>
      8d:      	testb	%al, %al
      8f:      	je	0x244 <toyos_crypto::mlkem::dot+0x244>
      95:      	movswl	-0x402(%r14,%rbx,2), %ecx
      9e:      	movswl	-0x400(%r14,%rbx,2), %edi
      a7:      	movswl	-0x402(%r13,%rbx,2), %edx
      b0:      	movswl	-0x400(%r13,%rbx,2), %esi
      b9:      	movl	%esi, %r8d
      bc:      	imull	%ecx, %r8d
      c0:      	movl	%edx, %eax
      c2:      	imull	%edi, %eax
      c5:      	addl	%r8d, %eax
      c8:      	jo	0x25e <toyos_crypto::mlkem::dot+0x25e>
      ce:      	imull	%edi, %esi
      d1:      	imull	$0xf3010000, %esi, %edi # imm = 0xF3010000
      d7:      	sarl	$0x10, %edi
      da:      	imull	$0xfffff2ff, %edi, %edi # imm = 0xFFFFF2FF
      e0:      	addl	%esi, %edi
      e2:      	sarl	$0x10, %edi
      e5:      	imull	%r15d, %edi
      e9:      	imull	%ecx, %edx
      ec:      	addl	%edi, %edx
      ee:      	movswl	-0x202(%r14,%rbx,2), %r9d
      f7:      	movswl	-0x200(%r14,%rbx,2), %edi
     100:      	movswl	-0x202(%r13,%rbx,2), %esi
     109:      	movswl	-0x200(%r13,%rbx,2), %r8d
     112:      	movl	%esi, %r10d
     115:      	imull	%r9d, %r10d
     119:      	movl	%r8d, %r11d
     11c:      	imull	%edi, %r11d
     120:      	imull	$0xf3010000, %r11d, %ecx # imm = 0xF3010000
     127:      	sarl	$0x10, %ecx
     12a:      	imull	$0xfffff2ff, %ecx, %ecx # imm = 0xFFFFF2FF
     130:      	addl	%r11d, %ecx
     133:      	sarl	$0x10, %ecx
     136:      	imull	%r15d, %ecx
     13a:      	addl	%r10d, %ecx
     13d:      	addl	%edx, %ecx
     13f:      	jo	0x270 <toyos_crypto::mlkem::dot+0x270>
     145:      	imull	%r9d, %r8d
     149:      	imull	%edi, %esi
     14c:      	addl	%r8d, %esi
     14f:      	jo	0x25e <toyos_crypto::mlkem::dot+0x25e>
     155:      	addl	%esi, %eax
     157:      	jo	0x267 <toyos_crypto::mlkem::dot+0x267>
     15d:      	movswl	-0x2(%r14,%rbx,2), %r8d
     163:      	movswl	(%r14,%rbx,2), %esi
     168:      	movswl	-0x2(%r13,%rbx,2), %edx
     16e:      	movswl	(%r13,%rbx,2), %edi
     174:      	movl	%edx, %r9d
     177:      	imull	%r8d, %r9d
     17b:      	movl	%edi, %r10d
     17e:      	imull	%esi, %r10d
     182:      	imull	$0xf3010000, %r10d, %r11d # imm = 0xF3010000
     189:      	sarl	$0x10, %r11d
     18d:      	imull	$0xfffff2ff, %r11d, %r11d # imm = 0xFFFFF2FF
     194:      	addl	%r10d, %r11d
     197:      	sarl	$0x10, %r11d
     19b:      	imull	%r15d, %r11d
     19f:      	addl	%r9d, %r11d
     1a2:      	addl	%r11d, %ecx
     1a5:      	jo	0x270 <toyos_crypto::mlkem::dot+0x270>
     1ab:      	imull	%r8d, %edi
     1af:      	imull	%esi, %edx
     1b2:      	addl	%edi, %edx
     1b4:      	jo	0x25e <toyos_crypto::mlkem::dot+0x25e>
     1ba:      	addl	%edx, %eax
     1bc:      	jo	0x267 <toyos_crypto::mlkem::dot+0x267>
     1c2:      	imull	$0xf3010000, %ecx, %edx # imm = 0xF3010000
     1c8:      	sarl	$0x10, %edx
     1cb:      	imull	$0xd01, %edx, %edx      # imm = 0xD01
     1d1:      	subl	%edx, %ecx
     1d3:      	jo	0x27e <toyos_crypto::mlkem::dot+0x27e>
     1d9:      	shrl	$0x10, %ecx
     1dc:      	movw	%cx, -0x248(%rbp,%rbx,2)
     1e4:      	imull	$0xf3010000, %eax, %ecx # imm = 0xF3010000
     1ea:      	sarl	$0x10, %ecx
     1ed:      	imull	$0xd01, %ecx, %ecx      # imm = 0xD01
     1f3:      	subl	%ecx, %eax
     1f5:      	jo	0x27e <toyos_crypto::mlkem::dot+0x27e>
     1fb:      	shrl	$0x10, %eax
     1fe:      	movw	%ax, -0x246(%rbp,%rbx,2)
     206:      	addq	$0x2, %rbx
     20a:      	cmpq	$0x100, %rbx            # imm = 0x100
     211:      	jne	0x60 <toyos_crypto::mlkem::dot+0x60>
     217:      	movl	$0x200, %edx            # imm = 0x200
     21c:      	movq	-0x30(%rbp), %rbx
     220:      	movq	%rbx, %rdi
     223:      	leaq	-0x248(%rbp), %rsi
     22a:      	callq	0x22f <toyos_crypto::mlkem::dot+0x22f>
     22f:      	movq	%rbx, %rax
     232:      	addq	$0x228, %rsp            # imm = 0x228
     239:      	popq	%rbx
     23a:      	popq	%r12
     23c:      	popq	%r13
     23e:      	popq	%r14
     240:      	popq	%r15
     242:      	popq	%rbp
     243:      	retq
     244:      	leaq	(%rip), %rdi            # 0x24b <toyos_crypto::mlkem::dot+0x24b>
     24b:      	leaq	(%rip), %rcx            # 0x252 <toyos_crypto::mlkem::dot+0x252>
     252:      	movl	$0x193, %esi            # imm = 0x193
     257:      	xorl	%edx, %edx
     259:      	callq	0x25e <toyos_crypto::mlkem::dot+0x25e>
     25e:      	leaq	(%rip), %rdi            # 0x265 <toyos_crypto::mlkem::dot+0x265>
     265:      	jmp	0x277 <toyos_crypto::mlkem::dot+0x277>
     267:      	leaq	(%rip), %rdi            # 0x26e <toyos_crypto::mlkem::dot+0x26e>
     26e:      	jmp	0x277 <toyos_crypto::mlkem::dot+0x277>
     270:      	leaq	(%rip), %rdi            # 0x277 <toyos_crypto::mlkem::dot+0x277>
     277:      	callq	0x27c <toyos_crypto::mlkem::dot+0x27c>
     27c:      	jmp	0x28a <toyos_crypto::mlkem::dot+0x28a>
     27e:      	leaq	(%rip), %rdi            # 0x285 <toyos_crypto::mlkem::dot+0x285>
     285:      	callq	0x28a <toyos_crypto::mlkem::dot+0x28a>
     28a:      	ud2
     28c:      	callq	0x291 <toyos_crypto::mlkem::dot+0x291>
     291:      	callq	0x296 <toyos_crypto::mlkem::dot+0x296>
     296:      	xorl	%ecx, %ecx
     298:      	nopl	(%rax,%rax)
     2a0:      	movw	$0x0, -0x248(%rbp,%rcx)
     2aa:      	movw	$0x0, -0x246(%rbp,%rcx)
     2b4:      	movw	$0x0, -0x244(%rbp,%rcx)
     2be:      	movw	$0x0, -0x242(%rbp,%rcx)
     2c8:      	movw	$0x0, -0x240(%rbp,%rcx)
     2d2:      	movw	$0x0, -0x23e(%rbp,%rcx)
     2dc:      	movw	$0x0, -0x23c(%rbp,%rcx)
     2e6:      	movw	$0x0, -0x23a(%rbp,%rcx)
     2f0:      	addq	$0x10, %rcx
     2f4:      	cmpq	$0x200, %rcx            # imm = 0x200
     2fb:      	jne	0x2a0 <toyos_crypto::mlkem::dot+0x2a0>
     2fd:      	movq	%rax, %rdi
     300:      	callq	0x305 <toyos_crypto::mlkem::dot+0x305>

0000000000000000 <toyos_crypto::mlkem::noise>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%rbx
       9:      	subq	$0x2a8, %rsp            # imm = 0x2A8
      10:      	movq	%rdi, %rbx
      13:      	xorps	%xmm0, %xmm0
      16:      	movaps	%xmm0, -0x50(%rbp)
      1a:      	movaps	%xmm0, -0x60(%rbp)
      1e:      	movaps	%xmm0, -0x70(%rbp)
      22:      	movaps	%xmm0, -0x80(%rbp)
      26:      	movaps	%xmm0, -0x90(%rbp)
      2d:      	movaps	%xmm0, -0xa0(%rbp)
      34:      	movaps	%xmm0, -0xb0(%rbp)
      3b:      	movaps	%xmm0, -0xc0(%rbp)
      42:      	movb	%dl, -0x19(%rbp)
      45:      	movq	%rsi, -0x40(%rbp)
      49:      	movq	$0x20, -0x38(%rbp)
      51:      	leaq	-0x19(%rbp), %rax
      55:      	movq	%rax, -0x30(%rbp)
      59:      	movq	$0x1, -0x28(%rbp)
      61:      	leaq	-0x2c0(%rbp), %rdi
      68:      	leaq	-0x40(%rbp), %rcx
      6c:      	movl	$0x88, %esi
      71:      	movl	$0x2, %r8d
      77:      	movl	$0x1f, %edx
      7c:      	callq	0x81 <toyos_crypto::mlkem::noise+0x81>
      81:      	leaq	-0x2c0(%rbp), %rdi
      88:      	leaq	-0xc0(%rbp), %r14
      8f:      	movl	$0x80, %edx
      94:      	movq	%r14, %rsi
      97:      	callq	0x9c <toyos_crypto::mlkem::noise+0x9c>
      9c:      	movq	$0x0, -0x2c0(%rbp)
      a7:      	movq	$0x0, -0x2b8(%rbp)
      b2:      	movq	$0x0, -0x2b0(%rbp)
      bd:      	movq	$0x0, -0x2a8(%rbp)
      c8:      	movq	$0x0, -0x2a0(%rbp)
      d3:      	movq	$0x0, -0x298(%rbp)
      de:      	movq	$0x0, -0x290(%rbp)
      e9:      	movq	$0x0, -0x288(%rbp)
      f4:      	movq	$0x0, -0x280(%rbp)
      ff:      	movq	$0x0, -0x278(%rbp)
     10a:      	movq	$0x0, -0x270(%rbp)
     115:      	movq	$0x0, -0x268(%rbp)
     120:      	movq	$0x0, -0x260(%rbp)
     12b:      	movq	$0x0, -0x258(%rbp)
     136:      	movq	$0x0, -0x250(%rbp)
     141:      	movq	$0x0, -0x248(%rbp)
     14c:      	movq	$0x0, -0x240(%rbp)
     157:      	movq	$0x0, -0x238(%rbp)
     162:      	movq	$0x0, -0x230(%rbp)
     16d:      	movq	$0x0, -0x228(%rbp)
     178:      	movq	$0x0, -0x220(%rbp)
     183:      	movq	$0x0, -0x218(%rbp)
     18e:      	movq	$0x0, -0x210(%rbp)
     199:      	movq	$0x0, -0x208(%rbp)
     1a4:      	movq	$0x0, -0x200(%rbp)
     1af:      	leaq	-0x2c0(%rbp), %rdi
     1b6:      	xorl	%r15d, %r15d
     1b9:      	movl	$0x200, %edx            # imm = 0x200
     1be:      	xorl	%esi, %esi
     1c0:      	callq	0x1c5 <toyos_crypto::mlkem::noise+0x1c5>
     1c5:      	movd	(%rip), %xmm0           # 0x1cd <toyos_crypto::mlkem::noise+0x1cd>
     1cd:      	movd	(%rip), %xmm1           # 0x1d5 <toyos_crypto::mlkem::noise+0x1d5>
     1d5:      	pxor	%xmm2, %xmm2
     1d9:      	movdqa	(%rip), %xmm3           # 0x1e1 <toyos_crypto::mlkem::noise+0x1e1>
     1e1:      	movdqa	(%rip), %xmm4           # 0x1e9 <toyos_crypto::mlkem::noise+0x1e9>
     1e9:      	movdqa	(%rip), %xmm5           # 0x1f1 <toyos_crypto::mlkem::noise+0x1f1>
     1f1:      	movdqa	(%rip), %xmm6           # 0x1f9 <toyos_crypto::mlkem::noise+0x1f9>
     1f9:      	movdqa	(%rip), %xmm7           # 0x201 <toyos_crypto::mlkem::noise+0x201>
     201:      	nopw	%cs:(%rax,%rax)
     210:      	movzbl	(%r14), %eax
     214:      	movd	%eax, %xmm8
     219:      	punpcklbw	%xmm8, %xmm8    # xmm8 = xmm8[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
     21e:      	movdqa	%xmm0, %xmm9
     223:      	psllw	$0x7, %xmm9
     229:      	pand	%xmm1, %xmm9
     22e:      	pxor	%xmm10, %xmm10
     233:      	pcmpgtb	%xmm9, %xmm10
     238:      	movdqa	%xmm10, %xmm11
     23d:      	pandn	%xmm8, %xmm11
     242:      	psrlw	$0x4, %xmm8
     248:      	pand	%xmm10, %xmm8
     24d:      	pand	%xmm3, %xmm8
     252:      	por	%xmm11, %xmm8
     257:      	paddb	%xmm9, %xmm9
     25c:      	pxor	%xmm10, %xmm10
     261:      	pcmpgtb	%xmm9, %xmm10
     266:      	movdqa	%xmm10, %xmm11
     26b:      	pandn	%xmm8, %xmm11
     270:      	psrlw	$0x2, %xmm8
     276:      	pand	%xmm10, %xmm8
     27b:      	pand	%xmm4, %xmm8
     280:      	por	%xmm11, %xmm8
     285:      	paddb	%xmm9, %xmm9
     28a:      	pxor	%xmm10, %xmm10
     28f:      	pcmpgtb	%xmm9, %xmm10
     294:      	movdqa	%xmm10, %xmm9
     299:      	pandn	%xmm8, %xmm9
     29e:      	psrlw	$0x1, %xmm8
     2a4:      	pand	%xmm10, %xmm8
     2a9:      	pand	%xmm5, %xmm8
     2ae:      	por	%xmm9, %xmm8
     2b3:      	movdqa	%xmm8, %xmm9
     2b8:      	pand	%xmm6, %xmm9
     2bd:      	movdqa	%xmm8, %xmm10
     2c2:      	psrlw	$0x1, %xmm10
     2c8:      	pand	%xmm6, %xmm10
     2cd:      	paddb	%xmm9, %xmm10
     2d2:      	movdqa	%xmm8, %xmm9
     2d7:      	psrlw	$0x2, %xmm9
     2dd:      	pand	%xmm6, %xmm9
     2e2:      	psrlw	$0x3, %xmm8
     2e8:      	pand	%xmm6, %xmm8
     2ed:      	paddb	%xmm9, %xmm8
     2f2:      	punpcklbw	%xmm2, %xmm10   # xmm10 = xmm10[0],xmm2[0],xmm10[1],xmm2[1],xmm10[2],xmm2[2],xmm10[3],xmm2[3],xmm10[4],xmm2[4],xmm10[5],xmm2[5],xmm10[6],xmm2[6],xmm10[7],xmm2[7]
     2f7:      	punpcklbw	%xmm2, %xmm8    # xmm8 = xmm8[0],xmm2[0],xmm8[1],xmm2[1],xmm8[2],xmm2[2],xmm8[3],xmm2[3],xmm8[4],xmm2[4],xmm8[5],xmm2[5],xmm8[6],xmm2[6],xmm8[7],xmm2[7]
     2fc:      	psubw	%xmm8, %xmm10
     301:      	movd	%xmm10, -0x2c0(%rbp,%r15,2)
     30b:      	addq	$0x2, %r15
     30f:      	paddb	%xmm7, %xmm0
     313:      	incq	%r14
     316:      	cmpq	$0x100, %r15            # imm = 0x100
     31d:      	jne	0x210 <toyos_crypto::mlkem::noise+0x210>
     323:      	leaq	-0x2c0(%rbp), %rsi
     32a:      	movl	$0x200, %edx            # imm = 0x200
     32f:      	movq	%rbx, %rdi
     332:      	callq	0x337 <toyos_crypto::mlkem::noise+0x337>
     337:      	pxor	%xmm0, %xmm0
     33b:      	movdqa	%xmm0, -0x2c0(%rbp)
     343:      	movaps	-0x2c0(%rbp), %xmm1
     34a:      	movaps	%xmm1, -0xc0(%rbp)
     351:      	movdqa	%xmm0, -0x2c0(%rbp)
     359:      	movaps	-0x2c0(%rbp), %xmm1
     360:      	movaps	%xmm1, -0xb0(%rbp)
     367:      	movdqa	%xmm0, -0x2c0(%rbp)
     36f:      	movaps	-0x2c0(%rbp), %xmm1
     376:      	movaps	%xmm1, -0xa0(%rbp)
     37d:      	movdqa	%xmm0, -0x2c0(%rbp)
     385:      	movaps	-0x2c0(%rbp), %xmm1
     38c:      	movaps	%xmm1, -0x90(%rbp)
     393:      	movdqa	%xmm0, -0x2c0(%rbp)
     39b:      	movaps	-0x2c0(%rbp), %xmm1
     3a2:      	movaps	%xmm1, -0x80(%rbp)
     3a6:      	movdqa	%xmm0, -0x2c0(%rbp)
     3ae:      	movaps	-0x2c0(%rbp), %xmm1
     3b5:      	movaps	%xmm1, -0x70(%rbp)
     3b9:      	movdqa	%xmm0, -0x2c0(%rbp)
     3c1:      	movaps	-0x2c0(%rbp), %xmm1
     3c8:      	movaps	%xmm1, -0x60(%rbp)
     3cc:      	movdqa	%xmm0, -0x2c0(%rbp)
     3d4:      	movaps	-0x2c0(%rbp), %xmm0
     3db:      	movaps	%xmm0, -0x50(%rbp)
     3df:      	movq	%rbx, %rax
     3e2:      	addq	$0x2a8, %rsp            # imm = 0x2A8
     3e9:      	popq	%rbx
     3ea:      	popq	%r14
     3ec:      	popq	%r15
     3ee:      	popq	%rbp
     3ef:      	retq
     3f0:      	movq	%rax, %rbx
     3f3:      	leaq	-0x2c0(%rbp), %rdi
     3fa:      	callq	0x3ff <toyos_crypto::mlkem::noise+0x3ff>
     3ff:      	jmp	0x404 <toyos_crypto::mlkem::noise+0x404>
     401:      	movq	%rax, %rbx
     404:      	leaq	-0xc0(%rbp), %rdi
     40b:      	callq	0x410 <toyos_crypto::mlkem::noise+0x410>
     410:      	movq	%rbx, %rdi
     413:      	callq	0x418 <toyos_crypto::mlkem::noise+0x418>
     418:      	callq	0x41d <toyos_crypto::mlkem::noise+0x41d>

0000000000000000 <toyos_crypto::mlkem::sample>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%r12
       a:      	pushq	%rbx
       b:      	subq	$0x380, %rsp            # imm = 0x380
      12:      	movq	%rdi, %rbx
      15:      	movb	%cl, -0x1a0(%rbp)
      1b:      	movb	%dl, -0x19f(%rbp)
      21:      	movq	%rsi, -0x3a0(%rbp)
      28:      	movq	$0x20, -0x398(%rbp)
      33:      	leaq	-0x1a0(%rbp), %r14
      3a:      	movq	%r14, -0x390(%rbp)
      41:      	movq	$0x2, -0x388(%rbp)
      4c:      	leaq	-0xf8(%rbp), %r15
      53:      	leaq	-0x3a0(%rbp), %rcx
      5a:      	movl	$0xa8, %esi
      5f:      	movl	$0x2, %r8d
      65:      	movq	%r15, %rdi
      68:      	movl	$0x1f, %edx
      6d:      	callq	0x72 <toyos_crypto::mlkem::sample+0x72>
      72:      	leaq	-0x3a0(%rbp), %rdi
      79:      	xorl	%r12d, %r12d
      7c:      	movl	$0x200, %edx            # imm = 0x200
      81:      	xorl	%esi, %esi
      83:      	callq	0x88 <toyos_crypto::mlkem::sample+0x88>
      88:      	xorps	%xmm0, %xmm0
      8b:      	movaps	%xmm0, -0x110(%rbp)
      92:      	movaps	%xmm0, -0x120(%rbp)
      99:      	movaps	%xmm0, -0x130(%rbp)
      a0:      	movaps	%xmm0, -0x140(%rbp)
      a7:      	movaps	%xmm0, -0x150(%rbp)
      ae:      	movaps	%xmm0, -0x160(%rbp)
      b5:      	movaps	%xmm0, -0x170(%rbp)
      bc:      	movaps	%xmm0, -0x180(%rbp)
      c3:      	movaps	%xmm0, -0x190(%rbp)
      ca:      	movaps	%xmm0, -0x1a0(%rbp)
      d1:      	movq	$0x0, -0x100(%rbp)
      dc:      	jmp	0xed <toyos_crypto::mlkem::sample+0xed>
      de:      	nop
      e0:      	cmpq	$0x100, %r12            # imm = 0x100
      e7:      	jae	0x185 <toyos_crypto::mlkem::sample+0x185>
      ed:      	movl	$0xa8, %edx
      f2:      	movq	%r15, %rdi
      f5:      	movq	%r14, %rsi
      f8:      	callq	0xfd <toyos_crypto::mlkem::sample+0xfd>
      fd:      	movl	$0x2, %eax
     102:      	jmp	0x11c <toyos_crypto::mlkem::sample+0x11c>
     104:      	nopw	%cs:(%rax,%rax)
     110:      	addq	$0x3, %rax
     114:      	cmpq	$0xaa, %rax
     11a:      	je	0xe0 <toyos_crypto::mlkem::sample+0xe0>
     11c:      	movzbl	-0x1a2(%rbp,%rax), %esi
     124:      	movzbl	-0x1a1(%rbp,%rax), %ecx
     12c:      	movl	%ecx, %edx
     12e:      	andl	$0xf, %edx
     131:      	shll	$0x8, %edx
     134:      	orl	%esi, %edx
     136:      	cmpl	$0xd00, %edx            # imm = 0xD00
     13c:      	ja	0x153 <toyos_crypto::mlkem::sample+0x153>
     13e:      	cmpq	$0x100, %r12            # imm = 0x100
     145:      	jae	0x153 <toyos_crypto::mlkem::sample+0x153>
     147:      	movw	%dx, -0x3a0(%rbp,%r12,2)
     150:      	incq	%r12
     153:      	movzbl	-0x1a0(%rbp,%rax), %edx
     15b:      	shrl	$0x4, %ecx
     15e:      	shll	$0x4, %edx
     161:      	orl	%ecx, %edx
     163:      	movzwl	%dx, %ecx
     166:      	cmpl	$0xd00, %ecx            # imm = 0xD00
     16c:      	ja	0x110 <toyos_crypto::mlkem::sample+0x110>
     16e:      	cmpq	$0xff, %r12
     175:      	ja	0x110 <toyos_crypto::mlkem::sample+0x110>
     177:      	movw	%dx, -0x3a0(%rbp,%r12,2)
     180:      	incq	%r12
     183:      	jmp	0x110 <toyos_crypto::mlkem::sample+0x110>
     185:      	leaq	-0x3a0(%rbp), %rsi
     18c:      	movl	$0x200, %edx            # imm = 0x200
     191:      	movq	%rbx, %rdi
     194:      	callq	0x199 <toyos_crypto::mlkem::sample+0x199>
     199:      	movq	$0x0, -0xf8(%rbp)
     1a4:      	movq	$0x0, -0xf0(%rbp)
     1af:      	movq	$0x0, -0xe8(%rbp)
     1ba:      	movq	$0x0, -0xe0(%rbp)
     1c5:      	movq	$0x0, -0xd8(%rbp)
     1d0:      	movq	$0x0, -0xd0(%rbp)
     1db:      	movq	$0x0, -0xc8(%rbp)
     1e6:      	movq	$0x0, -0xc0(%rbp)
     1f1:      	movq	$0x0, -0xb8(%rbp)
     1fc:      	movq	$0x0, -0xb0(%rbp)
     207:      	movq	$0x0, -0xa8(%rbp)
     212:      	movq	$0x0, -0xa0(%rbp)
     21d:      	movq	$0x0, -0x98(%rbp)
     228:      	movq	$0x0, -0x90(%rbp)
     233:      	movq	$0x0, -0x88(%rbp)
     23e:      	movq	$0x0, -0x80(%rbp)
     246:      	movq	$0x0, -0x78(%rbp)
     24e:      	movq	$0x0, -0x70(%rbp)
     256:      	movq	$0x0, -0x68(%rbp)
     25e:      	movq	$0x0, -0x60(%rbp)
     266:      	movq	$0x0, -0x58(%rbp)
     26e:      	movq	$0x0, -0x50(%rbp)
     276:      	movq	$0x0, -0x48(%rbp)
     27e:      	movq	$0x0, -0x40(%rbp)
     286:      	movq	$0x0, -0x38(%rbp)
     28e:      	movq	%rbx, %rax
     291:      	addq	$0x380, %rsp            # imm = 0x380
     298:      	popq	%rbx
     299:      	popq	%r12
     29b:      	popq	%r14
     29d:      	popq	%r15
     29f:      	popq	%rbp
     2a0:      	retq
     2a1:      	movq	%rax, %rbx
     2a4:      	xorl	%eax, %eax
     2a6:      	nopw	%cs:(%rax,%rax)
     2b0:      	movw	$0x0, -0x3a0(%rbp,%rax)
     2ba:      	movw	$0x0, -0x39e(%rbp,%rax)
     2c4:      	movw	$0x0, -0x39c(%rbp,%rax)
     2ce:      	movw	$0x0, -0x39a(%rbp,%rax)
     2d8:      	movw	$0x0, -0x398(%rbp,%rax)
     2e2:      	movw	$0x0, -0x396(%rbp,%rax)
     2ec:      	movw	$0x0, -0x394(%rbp,%rax)
     2f6:      	movw	$0x0, -0x392(%rbp,%rax)
     300:      	addq	$0x10, %rax
     304:      	cmpq	$0x200, %rax            # imm = 0x200
     30a:      	jne	0x2b0 <toyos_crypto::mlkem::sample+0x2b0>
     30c:      	leaq	-0xf8(%rbp), %rdi
     313:      	callq	0x318 <toyos_crypto::mlkem::sample+0x318>
     318:      	movq	%rbx, %rdi
     31b:      	callq	0x320 <toyos_crypto::mlkem::sample+0x320>
     320:      	callq	0x325 <toyos_crypto::mlkem::sample+0x325>

~/.claude/jobs/2280e09e/tmp/scratchpad/agents/mlkem/target-rlib/x86_64-unknown-toyos/toyos/libtoyos_crypto.rlib(toyos_crypto-d55b0841b948afee.2ram1ocbntcacqk0me8ebi5o4.1cf1o63.rcgu.o):	file format elf64-x86-64

0000000000000000 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>>:
       0:      	xorl	%eax, %eax
       2:      	nopw	%cs:(%rax,%rax)
      10:      	movw	$0x0, (%rdi,%rax)
      16:      	movw	$0x0, 0x2(%rdi,%rax)
      1d:      	movw	$0x0, 0x4(%rdi,%rax)
      24:      	movw	$0x0, 0x6(%rdi,%rax)
      2b:      	movw	$0x0, 0x8(%rdi,%rax)
      32:      	movw	$0x0, 0xa(%rdi,%rax)
      39:      	movw	$0x0, 0xc(%rdi,%rax)
      40:      	movw	$0x0, 0xe(%rdi,%rax)
      47:      	addq	$0x10, %rax
      4b:      	cmpq	$0x200, %rax            # imm = 0x200
      51:      	jne	0x10 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>+0x10>
      53:      	xorl	%eax, %eax
      55:      	nopw	%cs:(%rax,%rax)
      60:      	movw	$0x0, 0x200(%rdi,%rax)
      6a:      	movw	$0x0, 0x202(%rdi,%rax)
      74:      	movw	$0x0, 0x204(%rdi,%rax)
      7e:      	movw	$0x0, 0x206(%rdi,%rax)
      88:      	movw	$0x0, 0x208(%rdi,%rax)
      92:      	movw	$0x0, 0x20a(%rdi,%rax)
      9c:      	movw	$0x0, 0x20c(%rdi,%rax)
      a6:      	movw	$0x0, 0x20e(%rdi,%rax)
      b0:      	addq	$0x10, %rax
      b4:      	cmpq	$0x200, %rax            # imm = 0x200
      ba:      	jne	0x60 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>+0x60>
      bc:      	xorl	%eax, %eax
      be:      	nop
      c0:      	movw	$0x0, 0x400(%rdi,%rax)
      ca:      	movw	$0x0, 0x402(%rdi,%rax)
      d4:      	movw	$0x0, 0x404(%rdi,%rax)
      de:      	movw	$0x0, 0x406(%rdi,%rax)
      e8:      	movw	$0x0, 0x408(%rdi,%rax)
      f2:      	movw	$0x0, 0x40a(%rdi,%rax)
      fc:      	movw	$0x0, 0x40c(%rdi,%rax)
     106:      	movw	$0x0, 0x40e(%rdi,%rax)
     110:      	addq	$0x10, %rax
     114:      	cmpq	$0x200, %rax            # imm = 0x200
     11a:      	jne	0xc0 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>+0xc0>
     11c:      	pushq	%rbp
     11d:      	movq	%rsp, %rbp
     120:      	xorps	%xmm0, %xmm0
     123:      	movaps	%xmm0, -0x10(%rbp)
     127:      	movaps	-0x10(%rbp), %xmm1
     12b:      	movups	%xmm1, 0xac0(%rdi)
     132:      	movaps	%xmm0, -0x10(%rbp)
     136:      	movaps	-0x10(%rbp), %xmm0
     13a:      	movups	%xmm0, 0xad0(%rdi)
     141:      	popq	%rbp
     142:      	retq

0000000000000000 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	xorl	%eax, %eax
       6:      	nopw	%cs:(%rax,%rax)
      10:      	movw	$0x0, (%rdi,%rax)
      16:      	movw	$0x0, 0x2(%rdi,%rax)
      1d:      	movw	$0x0, 0x4(%rdi,%rax)
      24:      	movw	$0x0, 0x6(%rdi,%rax)
      2b:      	movw	$0x0, 0x8(%rdi,%rax)
      32:      	movw	$0x0, 0xa(%rdi,%rax)
      39:      	movw	$0x0, 0xc(%rdi,%rax)
      40:      	movw	$0x0, 0xe(%rdi,%rax)
      47:      	addq	$0x10, %rax
      4b:      	cmpq	$0x200, %rax            # imm = 0x200
      51:      	jne	0x10 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop+0x10>
      53:      	popq	%rbp
      54:      	retq

0000000000000000 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	movq	$0x0, (%rdi)
       b:      	movq	$0x0, 0x8(%rdi)
      13:      	movq	$0x0, 0x10(%rdi)
      1b:      	movq	$0x0, 0x18(%rdi)
      23:      	movq	$0x0, 0x20(%rdi)
      2b:      	movq	$0x0, 0x28(%rdi)
      33:      	movq	$0x0, 0x30(%rdi)
      3b:      	movq	$0x0, 0x38(%rdi)
      43:      	movq	$0x0, 0x40(%rdi)
      4b:      	movq	$0x0, 0x48(%rdi)
      53:      	movq	$0x0, 0x50(%rdi)
      5b:      	movq	$0x0, 0x58(%rdi)
      63:      	movq	$0x0, 0x60(%rdi)
      6b:      	movq	$0x0, 0x68(%rdi)
      73:      	movq	$0x0, 0x70(%rdi)
      7b:      	movq	$0x0, 0x78(%rdi)
      83:      	movq	$0x0, 0x80(%rdi)
      8e:      	movq	$0x0, 0x88(%rdi)
      99:      	movq	$0x0, 0x90(%rdi)
      a4:      	movq	$0x0, 0x98(%rdi)
      af:      	movq	$0x0, 0xa0(%rdi)
      ba:      	movq	$0x0, 0xa8(%rdi)
      c5:      	movq	$0x0, 0xb0(%rdi)
      d0:      	movq	$0x0, 0xb8(%rdi)
      db:      	movq	$0x0, 0xc0(%rdi)
      e6:      	popq	%rbp
      e7:      	retq

0000000000000000 <<core::iter::adapters::zip::Zip<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>>>::new>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%r13
       a:      	pushq	%r12
       c:      	pushq	%rbx
       d:      	pushq	%rax
       e:      	movq	%r8, %rbx
      11:      	movq	%rcx, %r15
      14:      	movq	%rdx, %r12
      17:      	movq	%rsi, %r13
      1a:      	movq	%rdi, %r14
      1d:      	movq	%rdx, %rdi
      20:      	callq	0x25 <<core::iter::adapters::zip::Zip<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>>>::new+0x25>
      25:      	testb	%al, %al
      27:      	je	0x80 <<core::iter::adapters::zip::Zip<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>>>::new+0x80>
      29:      	movq	%rbx, %rdi
      2c:      	movq	%r15, %rsi
      2f:      	callq	0x34 <<core::iter::adapters::zip::Zip<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>>>::new+0x34>
      34:      	testb	%al, %al
      36:      	je	0x80 <<core::iter::adapters::zip::Zip<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>>>::new+0x80>
      38:      	movq	%r12, %rax
      3b:      	subq	%r13, %rax
      3e:      	shrq	$0x9, %rax
      42:      	movq	%rbx, %rcx
      45:      	subq	%r15, %rcx
      48:      	shrq	$0x9, %rcx
      4c:      	cmpq	%rax, %rcx
      4f:      	cmovaeq	%rax, %rcx
      53:      	movq	%r13, (%r14)
      56:      	movq	%r12, 0x8(%r14)
      5a:      	movq	%r15, 0x10(%r14)
      5e:      	movq	%rbx, 0x18(%r14)
      62:      	movq	$0x0, 0x20(%r14)
      6a:      	movq	%rcx, 0x28(%r14)
      6e:      	movq	%r14, %rax
      71:      	addq	$0x8, %rsp
      75:      	popq	%rbx
      76:      	popq	%r12
      78:      	popq	%r13
      7a:      	popq	%r14
      7c:      	popq	%r15
      7e:      	popq	%rbp
      7f:      	retq
      80:      	leaq	(%rip), %rdi            # 0x87 <<core::iter::adapters::zip::Zip<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>>>::new+0x87>
      87:      	leaq	(%rip), %rcx            # 0x8e <<core::iter::adapters::zip::Zip<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>>>::new+0x8e>
      8e:      	movl	$0x193, %esi            # imm = 0x193
      93:      	xorl	%edx, %edx
      95:      	callq	0x9a <<core::iter::adapters::zip::Zip<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>>>::new+0x9a>
      9a:      	callq	0x9f <<core::iter::adapters::zip::Zip<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>>>::new+0x9f>
      9f:      	callq	0xa4 <<core::iter::adapters::zip::Zip<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>>>::new+0xa4>

0000000000000000 <<core::slice::iter::Iter<toyos_crypto::mlkem::Poly> as core::iter::adapters::zip::TrustedRandomAccessNoCoerce>::size>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r14
       6:      	pushq	%rbx
       7:      	movq	(%rdi), %r14
       a:      	movq	0x8(%rdi), %rbx
       e:      	movq	%rbx, %rdi
      11:      	movq	%r14, %rsi
      14:      	callq	0x19 <<core::slice::iter::Iter<toyos_crypto::mlkem::Poly> as core::iter::adapters::zip::TrustedRandomAccessNoCoerce>::size+0x19>
      19:      	testb	%al, %al
      1b:      	je	0x2c <<core::slice::iter::Iter<toyos_crypto::mlkem::Poly> as core::iter::adapters::zip::TrustedRandomAccessNoCoerce>::size+0x2c>
      1d:      	subq	%r14, %rbx
      20:      	shrq	$0x9, %rbx
      24:      	movq	%rbx, %rax
      27:      	popq	%rbx
      28:      	popq	%r14
      2a:      	popq	%rbp
      2b:      	retq
      2c:      	leaq	(%rip), %rdi            # 0x33 <<core::slice::iter::Iter<toyos_crypto::mlkem::Poly> as core::iter::adapters::zip::TrustedRandomAccessNoCoerce>::size+0x33>
      33:      	leaq	(%rip), %rcx            # 0x3a <<core::slice::iter::Iter<toyos_crypto::mlkem::Poly> as core::iter::adapters::zip::TrustedRandomAccessNoCoerce>::size+0x3a>
      3a:      	movl	$0x193, %esi            # imm = 0x193
      3f:      	xorl	%edx, %edx
      41:      	callq	0x46 <<core::slice::iter::Iter<toyos_crypto::mlkem::Poly> as core::iter::adapters::zip::TrustedRandomAccessNoCoerce>::size+0x46>
      46:      	callq	0x4b <<core::slice::iter::Iter<toyos_crypto::mlkem::Poly> as core::iter::adapters::zip::TrustedRandomAccessNoCoerce>::size+0x4b>

0000000000000000 <<toyos_crypto::keccak::Sponge>::new>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%r13
       a:      	pushq	%r12
       c:      	pushq	%rbx
       d:      	subq	$0x108, %rsp            # imm = 0x108
      14:      	movq	%rcx, %r12
      17:      	movq	%rdi, %r14
      1a:      	cmpq	$0x48, %rsi
      1e:      	je	0x36 <<toyos_crypto::keccak::Sponge>::new+0x36>
      20:      	cmpq	$0x88, %rsi
      27:      	je	0x36 <<toyos_crypto::keccak::Sponge>::new+0x36>
      29:      	cmpq	$0xa8, %rsi
      30:      	jne	0x2b0 <<toyos_crypto::keccak::Sponge>::new+0x2b0>
      36:      	xorps	%xmm0, %xmm0
      39:      	movaps	%xmm0, -0x80(%rbp)
      3d:      	movaps	%xmm0, -0x90(%rbp)
      44:      	movaps	%xmm0, -0xa0(%rbp)
      4b:      	movaps	%xmm0, -0xb0(%rbp)
      52:      	movaps	%xmm0, -0xc0(%rbp)
      59:      	movaps	%xmm0, -0xd0(%rbp)
      60:      	movaps	%xmm0, -0xe0(%rbp)
      67:      	movaps	%xmm0, -0xf0(%rbp)
      6e:      	movaps	%xmm0, -0x100(%rbp)
      75:      	movaps	%xmm0, -0x110(%rbp)
      7c:      	movaps	%xmm0, -0x120(%rbp)
      83:      	movaps	%xmm0, -0x130(%rbp)
      8a:      	movq	$0x0, -0x70(%rbp)
      92:      	movq	%rsi, -0x68(%rbp)
      96:      	movq	$0x0, -0x60(%rbp)
      9e:      	testq	%r8, %r8
      a1:      	je	0x1f8 <<toyos_crypto::keccak::Sponge>::new+0x1f8>
      a7:      	movl	%edx, -0x2c(%rbp)
      aa:      	movq	%rsi, -0x40(%rbp)
      ae:      	movq	%r14, -0x48(%rbp)
      b2:      	shlq	$0x4, %r8
      b6:      	addq	%r12, %r8
      b9:      	movq	%r8, -0x50(%rbp)
      bd:      	xorl	%ecx, %ecx
      bf:      	leaq	-0x130(%rbp), %r15
      c6:      	leaq	(%rip), %rax            # 0xcd <<toyos_crypto::keccak::Sponge>::new+0xcd>
      cd:      	movq	%rax, -0x38(%rbp)
      d1:      	jmp	0xee <<toyos_crypto::keccak::Sponge>::new+0xee>
      d3:      	nopw	%cs:(%rax,%rax)
      e0:      	addq	$0x10, %r12
      e4:      	cmpq	-0x50(%rbp), %r12
      e8:      	je	0x1a9 <<toyos_crypto::keccak::Sponge>::new+0x1a9>
      ee:      	movq	0x8(%r12), %rdx
      f3:      	testq	%rdx, %rdx
      f6:      	je	0xe0 <<toyos_crypto::keccak::Sponge>::new+0xe0>
      f8:      	movq	(%r12), %r14
      fc:      	jmp	0x10b <<toyos_crypto::keccak::Sponge>::new+0x10b>
      fe:      	nop
     100:      	addq	%rbx, %r14
     103:      	movq	%r13, %rdx
     106:      	testq	%r13, %r13
     109:      	je	0xe0 <<toyos_crypto::keccak::Sponge>::new+0xe0>
     10b:      	testb	$0x7, %cl
     10e:      	jne	0x140 <<toyos_crypto::keccak::Sponge>::new+0x140>
     110:      	cmpq	$0x8, %rdx
     114:      	jb	0x140 <<toyos_crypto::keccak::Sponge>::new+0x140>
     116:      	cmpq	$0xc7, %rcx
     11d:      	ja	0x280 <<toyos_crypto::keccak::Sponge>::new+0x280>
     123:      	movq	(%r14), %rax
     126:      	xorq	%rax, -0x130(%rbp,%rcx)
     12e:      	movl	$0x8, %ebx
     133:      	jmp	0x16b <<toyos_crypto::keccak::Sponge>::new+0x16b>
     135:      	nopw	%cs:(%rax,%rax)
     140:      	movq	%rcx, %rdi
     143:      	shrq	$0x3, %rdi
     147:      	cmpq	$0xc7, %rcx
     14e:      	ja	0x292 <<toyos_crypto::keccak::Sponge>::new+0x292>
     154:      	movzbl	(%r14), %eax
     158:      	shll	$0x3, %ecx
     15b:      	shlq	%cl, %rax
     15e:      	xorq	%rax, -0x130(%rbp,%rdi,8)
     166:      	movl	$0x1, %ebx
     16b:      	movq	%rdx, %r13
     16e:      	subq	%rbx, %r13
     171:      	jb	0x25e <<toyos_crypto::keccak::Sponge>::new+0x25e>
     177:      	movq	-0x60(%rbp), %rcx
     17b:      	addq	%rbx, %rcx
     17e:      	jb	0x272 <<toyos_crypto::keccak::Sponge>::new+0x272>
     184:      	movq	%rcx, -0x60(%rbp)
     188:      	cmpq	-0x68(%rbp), %rcx
     18c:      	jne	0x100 <<toyos_crypto::keccak::Sponge>::new+0x100>
     192:      	movq	%r15, %rdi
     195:      	callq	0x19a <<toyos_crypto::keccak::Sponge>::new+0x19a>
     19a:      	movq	$0x0, -0x60(%rbp)
     1a2:      	xorl	%ecx, %ecx
     1a4:      	jmp	0x100 <<toyos_crypto::keccak::Sponge>::new+0x100>
     1a9:      	movq	%rcx, %rdi
     1ac:      	shrq	$0x3, %rdi
     1b0:      	cmpq	$0xc7, %rcx
     1b7:      	ja	0x292 <<toyos_crypto::keccak::Sponge>::new+0x292>
     1bd:      	shll	$0x3, %ecx
     1c0:      	movzbl	-0x2c(%rbp), %eax
     1c4:      	shlq	%cl, %rax
     1c7:      	xorq	%rax, -0x130(%rbp,%rdi,8)
     1cf:      	movq	-0x40(%rbp), %rax
     1d3:      	testq	%rax, %rax
     1d6:      	movq	-0x48(%rbp), %r14
     1da:      	je	0x2a2 <<toyos_crypto::keccak::Sponge>::new+0x2a2>
     1e0:      	leaq	-0x1(%rax), %rcx
     1e4:      	movq	%rcx, %rdi
     1e7:      	shrq	$0x3, %rdi
     1eb:      	cmpq	$0xc9, %rax
     1f1:      	jb	0x20f <<toyos_crypto::keccak::Sponge>::new+0x20f>
     1f3:      	jmp	0x292 <<toyos_crypto::keccak::Sponge>::new+0x292>
     1f8:      	movzbl	%dl, %eax
     1fb:      	movq	%rax, -0x130(%rbp)
     202:      	decq	%rsi
     205:      	movq	%rsi, %rdi
     208:      	shrq	$0x3, %rdi
     20c:      	movq	%rsi, %rcx
     20f:      	shll	$0x3, %ecx
     212:      	movl	$0x80, %eax
     217:      	shlq	%cl, %rax
     21a:      	xorq	%rax, -0x130(%rbp,%rdi,8)
     222:      	leaq	-0x130(%rbp), %rbx
     229:      	movq	%rbx, %rdi
     22c:      	callq	0x231 <<toyos_crypto::keccak::Sponge>::new+0x231>
     231:      	movq	$0x0, -0x60(%rbp)
     239:      	movl	$0xd8, %edx
     23e:      	movq	%r14, %rdi
     241:      	movq	%rbx, %rsi
     244:      	callq	0x249 <<toyos_crypto::keccak::Sponge>::new+0x249>
     249:      	movq	%r14, %rax
     24c:      	addq	$0x108, %rsp            # imm = 0x108
     253:      	popq	%rbx
     254:      	popq	%r12
     256:      	popq	%r13
     258:      	popq	%r14
     25a:      	popq	%r15
     25c:      	popq	%rbp
     25d:      	retq
     25e:      	leaq	(%rip), %rcx            # 0x265 <<toyos_crypto::keccak::Sponge>::new+0x265>
     265:      	movq	%rbx, %rdi
     268:      	movq	%rdx, %rsi
     26b:      	callq	0x270 <<toyos_crypto::keccak::Sponge>::new+0x270>
     270:      	jmp	0x2ae <<toyos_crypto::keccak::Sponge>::new+0x2ae>
     272:      	leaq	(%rip), %rdi            # 0x279 <<toyos_crypto::keccak::Sponge>::new+0x279>
     279:      	callq	0x27e <<toyos_crypto::keccak::Sponge>::new+0x27e>
     27e:      	jmp	0x2ae <<toyos_crypto::keccak::Sponge>::new+0x2ae>
     280:      	shrq	$0x3, %rcx
     284:      	leaq	(%rip), %rax            # 0x28b <<toyos_crypto::keccak::Sponge>::new+0x28b>
     28b:      	movq	%rax, -0x38(%rbp)
     28f:      	movq	%rcx, %rdi
     292:      	movl	$0x19, %esi
     297:      	movq	-0x38(%rbp), %rdx
     29b:      	callq	0x2a0 <<toyos_crypto::keccak::Sponge>::new+0x2a0>
     2a0:      	jmp	0x2ae <<toyos_crypto::keccak::Sponge>::new+0x2ae>
     2a2:      	leaq	(%rip), %rdi            # 0x2a9 <<toyos_crypto::keccak::Sponge>::new+0x2a9>
     2a9:      	callq	0x2ae <<toyos_crypto::keccak::Sponge>::new+0x2ae>
     2ae:      	ud2
     2b0:      	leaq	(%rip), %rdi            # 0x2b7 <<toyos_crypto::keccak::Sponge>::new+0x2b7>
     2b7:      	leaq	(%rip), %rdx            # 0x2be <<toyos_crypto::keccak::Sponge>::new+0x2be>
     2be:      	movl	$0x30, %esi
     2c3:      	callq	0x2c8 <<toyos_crypto::keccak::Sponge>::new+0x2c8>
     2c8:      	movq	$0x0, -0x130(%rbp)
     2d3:      	movq	$0x0, -0x128(%rbp)
     2de:      	movq	$0x0, -0x120(%rbp)
     2e9:      	movq	$0x0, -0x118(%rbp)
     2f4:      	movq	$0x0, -0x110(%rbp)
     2ff:      	movq	$0x0, -0x108(%rbp)
     30a:      	movq	$0x0, -0x100(%rbp)
     315:      	movq	$0x0, -0xf8(%rbp)
     320:      	movq	$0x0, -0xf0(%rbp)
     32b:      	movq	$0x0, -0xe8(%rbp)
     336:      	movq	$0x0, -0xe0(%rbp)
     341:      	movq	$0x0, -0xd8(%rbp)
     34c:      	movq	$0x0, -0xd0(%rbp)
     357:      	movq	$0x0, -0xc8(%rbp)
     362:      	movq	$0x0, -0xc0(%rbp)
     36d:      	movq	$0x0, -0xb8(%rbp)
     378:      	movq	$0x0, -0xb0(%rbp)
     383:      	movq	$0x0, -0xa8(%rbp)
     38e:      	movq	$0x0, -0xa0(%rbp)
     399:      	movq	$0x0, -0x98(%rbp)
     3a4:      	movq	$0x0, -0x90(%rbp)
     3af:      	movq	$0x0, -0x88(%rbp)
     3ba:      	movq	$0x0, -0x80(%rbp)
     3c2:      	movq	$0x0, -0x78(%rbp)
     3ca:      	movq	$0x0, -0x70(%rbp)
     3d2:      	movq	%rax, %rdi
     3d5:      	callq	0x3da <<toyos_crypto::keccak::Sponge>::new+0x3da>

0000000000000000 <<toyos_crypto::keccak::Sponge>::read>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%r13
       a:      	pushq	%r12
       c:      	pushq	%rbx
       d:      	subq	$0x18, %rsp
      11:      	testq	%rdx, %rdx
      14:      	je	0xe7 <<toyos_crypto::keccak::Sponge>::read+0xe7>
      1a:      	movq	%rdx, %rbx
      1d:      	movq	%rsi, %r15
      20:      	movq	%rdi, %rcx
      23:      	movq	0xd0(%rdi), %r13
      2a:      	movq	%rdi, -0x30(%rbp)
      2e:      	nop
      30:      	cmpq	0xc8(%rcx), %r13
      37:      	jne	0x53 <<toyos_crypto::keccak::Sponge>::read+0x53>
      39:      	movq	%rcx, %rdi
      3c:      	callq	0x41 <<toyos_crypto::keccak::Sponge>::read+0x41>
      41:      	movq	-0x30(%rbp), %rcx
      45:      	movq	$0x0, 0xd0(%rcx)
      50:      	xorl	%r13d, %r13d
      53:      	movq	%r13, %rdi
      56:      	andq	$0x7, %rdi
      5a:      	movl	$0x1, %r12d
      60:      	movl	$0x8, %eax
      65:      	cmoveq	%rax, %r12
      69:      	cmpq	$0x8, %rbx
      6d:      	movl	$0x1, %eax
      72:      	cmovbq	%rax, %r12
      76:      	movq	%r13, %rax
      79:      	shrq	$0x3, %rax
      7d:      	cmpq	$0xc7, %r13
      84:      	ja	0x139 <<toyos_crypto::keccak::Sponge>::read+0x139>
      8a:      	movq	(%rcx,%rax,8), %rax
      8e:      	movq	%rax, -0x38(%rbp)
      92:      	cmpq	%r12, %rbx
      95:      	jb	0x107 <<toyos_crypto::keccak::Sponge>::read+0x107>
      97:      	leaq	(%r12,%rdi), %rsi
      9b:      	cmpq	$0x9, %rsi
      9f:      	jae	0xf6 <<toyos_crypto::keccak::Sponge>::read+0xf6>
      a1:      	leaq	(%rdi,%rbp), %rsi
      a5:      	addq	$-0x38, %rsi
      a9:      	movq	%rsi, %rax
      ac:      	subq	%r15, %rax
      af:      	movq	%r15, %rcx
      b2:      	subq	%rsi, %rcx
      b5:      	cmovbq	%rax, %rcx
      b9:      	cmpq	%r12, %rcx
      bc:      	jb	0x11f <<toyos_crypto::keccak::Sponge>::read+0x11f>
      be:      	leaq	(%r15,%r12), %r14
      c2:      	movq	%r15, %rdi
      c5:      	movq	%r12, %rdx
      c8:      	callq	0xcd <<toyos_crypto::keccak::Sponge>::read+0xcd>
      cd:      	movq	-0x30(%rbp), %rcx
      d1:      	addq	%r12, %r13
      d4:      	movq	%r13, 0xd0(%rcx)
      db:      	movq	%r14, %r15
      de:      	subq	%r12, %rbx
      e1:      	jne	0x30 <<toyos_crypto::keccak::Sponge>::read+0x30>
      e7:      	addq	$0x18, %rsp
      eb:      	popq	%rbx
      ec:      	popq	%r12
      ee:      	popq	%r13
      f0:      	popq	%r14
      f2:      	popq	%r15
      f4:      	popq	%rbp
      f5:      	retq
      f6:      	leaq	(%rip), %rcx            # 0xfd <<toyos_crypto::keccak::Sponge>::read+0xfd>
      fd:      	movl	$0x8, %edx
     102:      	callq	0x107 <<toyos_crypto::keccak::Sponge>::read+0x107>
     107:      	leaq	(%rip), %rdi            # 0x10e <<toyos_crypto::keccak::Sponge>::read+0x10e>
     10e:      	leaq	(%rip), %rdx            # 0x115 <<toyos_crypto::keccak::Sponge>::read+0x115>
     115:      	movl	$0x13, %esi
     11a:      	callq	0x11f <<toyos_crypto::keccak::Sponge>::read+0x11f>
     11f:      	leaq	(%rip), %rdi            # 0x126 <<toyos_crypto::keccak::Sponge>::read+0x126>
     126:      	leaq	(%rip), %rcx            # 0x12d <<toyos_crypto::keccak::Sponge>::read+0x12d>
     12d:      	movl	$0x237, %esi            # imm = 0x237
     132:      	xorl	%edx, %edx
     134:      	callq	0x139 <<toyos_crypto::keccak::Sponge>::read+0x139>
     139:      	leaq	(%rip), %rdx            # 0x140 <<toyos_crypto::keccak::Sponge>::read+0x140>
     140:      	movl	$0x19, %esi
     145:      	movq	%rax, %rdi
     148:      	callq	0x14d <<toyos_crypto::keccak::Sponge>::read+0x14d>

0000000000000000 <toyos_crypto::keccak::g>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r14
       6:      	pushq	%rbx
       7:      	subq	$0x120, %rsp            # imm = 0x120
       e:      	movq	%rdx, %r8
      11:      	movq	%rsi, %rcx
      14:      	movq	%rdi, %rbx
      17:      	xorps	%xmm0, %xmm0
      1a:      	movaps	%xmm0, -0x20(%rbp)
      1e:      	movaps	%xmm0, -0x30(%rbp)
      22:      	movaps	%xmm0, -0x40(%rbp)
      26:      	movaps	%xmm0, -0x50(%rbp)
      2a:      	leaq	-0x128(%rbp), %r14
      31:      	movl	$0x48, %esi
      36:      	movq	%r14, %rdi
      39:      	movl	$0x6, %edx
      3e:      	callq	0x43 <toyos_crypto::keccak::g+0x43>
      43:      	leaq	-0x50(%rbp), %rsi
      47:      	movl	$0x40, %edx
      4c:      	movq	%r14, %rdi
      4f:      	callq	0x54 <toyos_crypto::keccak::g+0x54>
      54:      	movq	$0x0, -0x128(%rbp)
      5f:      	movq	$0x0, -0x120(%rbp)
      6a:      	movq	$0x0, -0x118(%rbp)
      75:      	movq	$0x0, -0x110(%rbp)
      80:      	movq	$0x0, -0x108(%rbp)
      8b:      	movq	$0x0, -0x100(%rbp)
      96:      	movq	$0x0, -0xf8(%rbp)
      a1:      	movq	$0x0, -0xf0(%rbp)
      ac:      	movq	$0x0, -0xe8(%rbp)
      b7:      	movq	$0x0, -0xe0(%rbp)
      c2:      	movq	$0x0, -0xd8(%rbp)
      cd:      	movq	$0x0, -0xd0(%rbp)
      d8:      	movq	$0x0, -0xc8(%rbp)
      e3:      	movq	$0x0, -0xc0(%rbp)
      ee:      	movq	$0x0, -0xb8(%rbp)
      f9:      	movq	$0x0, -0xb0(%rbp)
     104:      	movq	$0x0, -0xa8(%rbp)
     10f:      	movq	$0x0, -0xa0(%rbp)
     11a:      	movq	$0x0, -0x98(%rbp)
     125:      	movq	$0x0, -0x90(%rbp)
     130:      	movq	$0x0, -0x88(%rbp)
     13b:      	movq	$0x0, -0x80(%rbp)
     143:      	movq	$0x0, -0x78(%rbp)
     14b:      	movq	$0x0, -0x70(%rbp)
     153:      	movq	$0x0, -0x68(%rbp)
     15b:      	movaps	-0x50(%rbp), %xmm0
     15f:      	movaps	-0x40(%rbp), %xmm1
     163:      	movaps	-0x30(%rbp), %xmm2
     167:      	movaps	-0x20(%rbp), %xmm3
     16b:      	movups	%xmm3, 0x30(%rbx)
     16f:      	movups	%xmm2, 0x20(%rbx)
     173:      	movups	%xmm1, 0x10(%rbx)
     177:      	movups	%xmm0, (%rbx)
     17a:      	movq	%rbx, %rax
     17d:      	addq	$0x120, %rsp            # imm = 0x120
     184:      	popq	%rbx
     185:      	popq	%r14
     187:      	popq	%rbp
     188:      	retq
     189:      	movq	%rax, %rbx
     18c:      	leaq	-0x128(%rbp), %rdi
     193:      	callq	0x198 <toyos_crypto::keccak::g+0x198>
     198:      	movq	%rbx, %rdi
     19b:      	callq	0x1a0 <toyos_crypto::keccak::g+0x1a0>
     1a0:      	callq	0x1a5 <toyos_crypto::keccak::g+0x1a5>

0000000000000000 <toyos_crypto::keccak::h>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r14
       6:      	pushq	%rbx
       7:      	subq	$0x100, %rsp            # imm = 0x100
       e:      	movq	%rdx, %r8
      11:      	movq	%rsi, %rcx
      14:      	movq	%rdi, %rbx
      17:      	xorps	%xmm0, %xmm0
      1a:      	movaps	%xmm0, -0x20(%rbp)
      1e:      	movaps	%xmm0, -0x30(%rbp)
      22:      	leaq	-0x108(%rbp), %r14
      29:      	movl	$0x88, %esi
      2e:      	movq	%r14, %rdi
      31:      	movl	$0x6, %edx
      36:      	callq	0x3b <toyos_crypto::keccak::h+0x3b>
      3b:      	leaq	-0x30(%rbp), %rsi
      3f:      	movl	$0x20, %edx
      44:      	movq	%r14, %rdi
      47:      	callq	0x4c <toyos_crypto::keccak::h+0x4c>
      4c:      	movq	$0x0, -0x108(%rbp)
      57:      	movq	$0x0, -0x100(%rbp)
      62:      	movq	$0x0, -0xf8(%rbp)
      6d:      	movq	$0x0, -0xf0(%rbp)
      78:      	movq	$0x0, -0xe8(%rbp)
      83:      	movq	$0x0, -0xe0(%rbp)
      8e:      	movq	$0x0, -0xd8(%rbp)
      99:      	movq	$0x0, -0xd0(%rbp)
      a4:      	movq	$0x0, -0xc8(%rbp)
      af:      	movq	$0x0, -0xc0(%rbp)
      ba:      	movq	$0x0, -0xb8(%rbp)
      c5:      	movq	$0x0, -0xb0(%rbp)
      d0:      	movq	$0x0, -0xa8(%rbp)
      db:      	movq	$0x0, -0xa0(%rbp)
      e6:      	movq	$0x0, -0x98(%rbp)
      f1:      	movq	$0x0, -0x90(%rbp)
      fc:      	movq	$0x0, -0x88(%rbp)
     107:      	movq	$0x0, -0x80(%rbp)
     10f:      	movq	$0x0, -0x78(%rbp)
     117:      	movq	$0x0, -0x70(%rbp)
     11f:      	movq	$0x0, -0x68(%rbp)
     127:      	movq	$0x0, -0x60(%rbp)
     12f:      	movq	$0x0, -0x58(%rbp)
     137:      	movq	$0x0, -0x50(%rbp)
     13f:      	movq	$0x0, -0x48(%rbp)
     147:      	movaps	-0x30(%rbp), %xmm0
     14b:      	movaps	-0x20(%rbp), %xmm1
     14f:      	movups	%xmm1, 0x10(%rbx)
     153:      	movups	%xmm0, (%rbx)
     156:      	movq	%rbx, %rax
     159:      	addq	$0x100, %rsp            # imm = 0x100
     160:      	popq	%rbx
     161:      	popq	%r14
     163:      	popq	%rbp
     164:      	retq
     165:      	movq	%rax, %rbx
     168:      	leaq	-0x108(%rbp), %rdi
     16f:      	callq	0x174 <toyos_crypto::keccak::h+0x174>
     174:      	movq	%rbx, %rdi
     177:      	callq	0x17c <toyos_crypto::keccak::h+0x17c>
     17c:      	callq	0x181 <toyos_crypto::keccak::h+0x181>

0000000000000000 <toyos_crypto::keccak::j>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r14
       6:      	pushq	%rbx
       7:      	subq	$0x100, %rsp            # imm = 0x100
       e:      	movq	%rdx, %r8
      11:      	movq	%rsi, %rcx
      14:      	movq	%rdi, %rbx
      17:      	xorps	%xmm0, %xmm0
      1a:      	movaps	%xmm0, -0x20(%rbp)
      1e:      	movaps	%xmm0, -0x30(%rbp)
      22:      	leaq	-0x108(%rbp), %r14
      29:      	movl	$0x88, %esi
      2e:      	movq	%r14, %rdi
      31:      	movl	$0x1f, %edx
      36:      	callq	0x3b <toyos_crypto::keccak::j+0x3b>
      3b:      	leaq	-0x30(%rbp), %rsi
      3f:      	movl	$0x20, %edx
      44:      	movq	%r14, %rdi
      47:      	callq	0x4c <toyos_crypto::keccak::j+0x4c>
      4c:      	movq	$0x0, -0x108(%rbp)
      57:      	movq	$0x0, -0x100(%rbp)
      62:      	movq	$0x0, -0xf8(%rbp)
      6d:      	movq	$0x0, -0xf0(%rbp)
      78:      	movq	$0x0, -0xe8(%rbp)
      83:      	movq	$0x0, -0xe0(%rbp)
      8e:      	movq	$0x0, -0xd8(%rbp)
      99:      	movq	$0x0, -0xd0(%rbp)
      a4:      	movq	$0x0, -0xc8(%rbp)
      af:      	movq	$0x0, -0xc0(%rbp)
      ba:      	movq	$0x0, -0xb8(%rbp)
      c5:      	movq	$0x0, -0xb0(%rbp)
      d0:      	movq	$0x0, -0xa8(%rbp)
      db:      	movq	$0x0, -0xa0(%rbp)
      e6:      	movq	$0x0, -0x98(%rbp)
      f1:      	movq	$0x0, -0x90(%rbp)
      fc:      	movq	$0x0, -0x88(%rbp)
     107:      	movq	$0x0, -0x80(%rbp)
     10f:      	movq	$0x0, -0x78(%rbp)
     117:      	movq	$0x0, -0x70(%rbp)
     11f:      	movq	$0x0, -0x68(%rbp)
     127:      	movq	$0x0, -0x60(%rbp)
     12f:      	movq	$0x0, -0x58(%rbp)
     137:      	movq	$0x0, -0x50(%rbp)
     13f:      	movq	$0x0, -0x48(%rbp)
     147:      	movaps	-0x30(%rbp), %xmm0
     14b:      	movaps	-0x20(%rbp), %xmm1
     14f:      	movups	%xmm1, 0x10(%rbx)
     153:      	movups	%xmm0, (%rbx)
     156:      	movq	%rbx, %rax
     159:      	addq	$0x100, %rsp            # imm = 0x100
     160:      	popq	%rbx
     161:      	popq	%r14
     163:      	popq	%rbp
     164:      	retq
     165:      	movq	%rax, %rbx
     168:      	leaq	-0x108(%rbp), %rdi
     16f:      	callq	0x174 <toyos_crypto::keccak::j+0x174>
     174:      	movq	%rbx, %rdi
     177:      	callq	0x17c <toyos_crypto::keccak::j+0x17c>
     17c:      	callq	0x181 <toyos_crypto::keccak::j+0x181>

0000000000000000 <toyos_crypto::keccak::permute (.llvm.4555766010212265317)>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%r13
       a:      	pushq	%r12
       c:      	pushq	%rbx
       d:      	subq	$0x60, %rsp
      11:      	movq	(%rdi), %rax
      14:      	movq	%rax, -0x50(%rbp)
      18:      	movq	0x8(%rdi), %rax
      1c:      	movq	%rax, -0x98(%rbp)
      23:      	movq	0x28(%rdi), %rax
      27:      	movq	%rax, -0x48(%rbp)
      2b:      	movq	0x50(%rdi), %rax
      2f:      	movq	0x78(%rdi), %r15
      33:      	movq	0xa0(%rdi), %rcx
      3a:      	movq	%rcx, -0x70(%rbp)
      3e:      	movq	0x30(%rdi), %rbx
      42:      	movq	0x58(%rdi), %r13
      46:      	movq	0x80(%rdi), %rsi
      4d:      	movq	0xa8(%rdi), %rcx
      54:      	movq	%rcx, -0x78(%rbp)
      58:      	movq	0x10(%rdi), %rcx
      5c:      	movq	%rcx, -0xa0(%rbp)
      63:      	movq	0x38(%rdi), %r8
      67:      	movq	%r8, -0x60(%rbp)
      6b:      	movq	0x60(%rdi), %r11
      6f:      	movq	0x88(%rdi), %r10
      76:      	movq	0xb0(%rdi), %rcx
      7d:      	movq	%rcx, -0x90(%rbp)
      84:      	movq	0x18(%rdi), %rcx
      88:      	movq	%rcx, -0x58(%rbp)
      8c:      	movq	0x40(%rdi), %r9
      90:      	movq	0x68(%rdi), %rcx
      94:      	movq	0x90(%rdi), %r12
      9b:      	movq	0xb8(%rdi), %rdx
      a2:      	movq	%rdx, -0x88(%rbp)
      a9:      	movq	0x20(%rdi), %r8
      ad:      	movq	%r8, -0x30(%rbp)
      b1:      	movq	0x48(%rdi), %r8
      b5:      	movq	%r8, -0x38(%rbp)
      b9:      	movq	0x70(%rdi), %rdx
      bd:      	movq	%rdx, -0x80(%rbp)
      c1:      	movq	0x98(%rdi), %r8
      c8:      	movq	%rdi, -0xe8(%rbp)
      cf:      	movq	0xc0(%rdi), %rdx
      d6:      	movq	%rdx, -0x40(%rbp)
      da:      	xorl	%edx, %edx
      dc:      	nopl	(%rax)
      e0:      	movq	%rax, -0xc8(%rbp)
      e7:      	movq	%rsi, -0x68(%rbp)
      eb:      	movq	%r10, -0xd8(%rbp)
      f2:      	movq	%rdx, -0x108(%rbp)
      f9:      	movq	%r15, %rdx
      fc:      	xorq	-0x70(%rbp), %rdx
     100:      	movq	%rax, %rdi
     103:      	xorq	-0x48(%rbp), %rdi
     107:      	xorq	%rdx, %rdi
     10a:      	movq	%r8, %rdx
     10d:      	movq	%r8, -0xd0(%rbp)
     114:      	movq	%rsi, %r8
     117:      	xorq	-0x78(%rbp), %r8
     11b:      	movq	%r13, -0xe0(%rbp)
     122:      	movq	%r13, %rsi
     125:      	xorq	%rbx, %rsi
     128:      	xorq	%r8, %rsi
     12b:      	movq	%r10, %r8
     12e:      	xorq	-0x90(%rbp), %r8
     135:      	movq	%r11, %r10
     138:      	xorq	-0x60(%rbp), %r10
     13c:      	xorq	%r8, %r10
     13f:      	movq	%r12, %r14
     142:      	xorq	-0x88(%rbp), %r14
     149:      	movq	%rcx, %rax
     14c:      	xorq	%r9, %rax
     14f:      	xorq	%r14, %rax
     152:      	movq	%rdx, %r14
     155:      	xorq	-0x40(%rbp), %r14
     159:      	movq	-0x80(%rbp), %rdx
     15d:      	xorq	-0x38(%rbp), %rdx
     161:      	xorq	%r14, %rdx
     164:      	movq	-0x50(%rbp), %r14
     168:      	xorq	%r14, %rdi
     16b:      	movq	-0x98(%rbp), %r13
     172:      	xorq	%r13, %rsi
     175:      	xorq	-0x58(%rbp), %rax
     179:      	xorq	-0x30(%rbp), %rdx
     17d:      	movq	%rax, %r8
     180:      	rolq	%r8
     183:      	xorq	%rsi, %r8
     186:      	rolq	%rsi
     189:      	xorq	%rdx, %rsi
     18c:      	xorq	%rsi, %r14
     18f:      	movq	%r14, -0xc0(%rbp)
     196:      	xorq	%rsi, -0x48(%rbp)
     19a:      	xorq	%rsi, -0xc8(%rbp)
     1a1:      	xorq	%rsi, %r15
     1a4:      	xorq	-0x70(%rbp), %rsi
     1a8:      	movq	%rsi, -0x100(%rbp)
     1af:      	movq	-0xa0(%rbp), %r14
     1b6:      	xorq	%r14, %r10
     1b9:      	rolq	%rdx
     1bc:      	xorq	%r10, %rdx
     1bf:      	rolq	%r10
     1c2:      	xorq	%rdi, %r10
     1c5:      	xorq	%r10, %r13
     1c8:      	xorq	%r10, %rbx
     1cb:      	xorq	%r10, -0xe0(%rbp)
     1d2:      	xorq	%r10, -0x68(%rbp)
     1d6:      	xorq	-0x78(%rbp), %r10
     1da:      	movq	%r10, -0xa8(%rbp)
     1e1:      	xorq	%r8, %r14
     1e4:      	xorq	%r8, -0x60(%rbp)
     1e8:      	xorq	%r8, %r11
     1eb:      	xorq	%r8, -0xd8(%rbp)
     1f2:      	xorq	-0x90(%rbp), %r8
     1f9:      	movq	%r8, -0xf0(%rbp)
     200:      	xorq	%rdx, -0x58(%rbp)
     204:      	xorq	%rdx, %r9
     207:      	xorq	%rdx, %rcx
     20a:      	movq	%rcx, -0xf8(%rbp)
     211:      	xorq	%rdx, %r12
     214:      	xorq	-0x88(%rbp), %rdx
     21b:      	movq	%rdx, -0xb8(%rbp)
     222:      	rolq	%rdi
     225:      	xorq	%rax, %rdi
     228:      	movq	-0x30(%rbp), %rcx
     22c:      	xorq	%rdi, %rcx
     22f:      	movq	-0x38(%rbp), %rax
     233:      	xorq	%rdi, %rax
     236:      	movq	-0x80(%rbp), %r8
     23a:      	xorq	%rdi, %r8
     23d:      	xorq	%rdi, -0xd0(%rbp)
     244:      	xorq	-0x40(%rbp), %rdi
     248:      	movq	%r13, -0x38(%rbp)
     24c:      	movq	%r14, %r13
     24f:      	rolq	$0x3e, %r13
     253:      	rolq	$0x2c, %rbx
     257:      	rolq	$0x2b, %r11
     25b:      	rolq	$0x15, %r12
     25f:      	movq	%rcx, -0xb0(%rbp)
     266:      	rolq	$0xe, %rdi
     26a:      	movq	%rdi, -0x30(%rbp)
     26e:      	movq	%rbx, %rcx
     271:      	notq	%rcx
     274:      	andq	%r11, %rcx
     277:      	movq	%rcx, -0x50(%rbp)
     27b:      	movq	%r12, %rdx
     27e:      	notq	%rdx
     281:      	andq	%rdi, %rdx
     284:      	xorq	%r11, %rdx
     287:      	movq	%rdx, -0xa0(%rbp)
     28e:      	notq	%r11
     291:      	andq	%r12, %r11
     294:      	xorq	%rbx, %r11
     297:      	movq	%r11, -0x98(%rbp)
     29e:      	movq	-0xc0(%rbp), %r11
     2a5:      	movq	%r11, %r10
     2a8:      	notq	%r10
     2ab:      	andq	%rbx, %r10
     2ae:      	rolq	$0x37, %r9
     2b2:      	movq	%r8, %rdx
     2b5:      	rolq	$0x27, %rdx
     2b9:      	rolq	$0x29, %r15
     2bd:      	movq	-0xa8(%rbp), %r8
     2c4:      	rolq	$0x2, %r8
     2c8:      	movq	%r9, %rdi
     2cb:      	notq	%rdi
     2ce:      	andq	%rdx, %rdi
     2d1:      	xorq	%r13, %rdi
     2d4:      	movq	%rdi, -0x70(%rbp)
     2d8:      	movq	%r15, %rdi
     2db:      	notq	%rdi
     2de:      	movq	%r8, %r14
     2e1:      	movq	%r8, -0xa8(%rbp)
     2e8:      	andq	%r8, %rdi
     2eb:      	xorq	%rdx, %rdi
     2ee:      	movq	%rdi, -0x90(%rbp)
     2f5:      	notq	%rdx
     2f8:      	andq	%r15, %rdx
     2fb:      	xorq	%r9, %rdx
     2fe:      	movq	%rdx, -0x78(%rbp)
     302:      	notq	%r14
     305:      	andq	%r13, %r14
     308:      	notq	%r13
     30b:      	andq	%r9, %r13
     30e:      	movq	%r13, -0x40(%rbp)
     312:      	movq	-0x58(%rbp), %rdx
     316:      	rolq	$0x1c, %rdx
     31a:      	movq	%rax, %r13
     31d:      	rolq	$0x14, %r13
     321:      	movq	-0xc8(%rbp), %rax
     328:      	rolq	$0x3, %rax
     32c:      	movq	-0x68(%rbp), %r9
     330:      	rolq	$0x2d, %r9
     334:      	movq	-0xf0(%rbp), %rcx
     33b:      	rolq	$0x3d, %rcx
     33f:      	movq	-0x48(%rbp), %rsi
     343:      	movq	%r13, %rdi
     346:      	notq	%rdi
     349:      	andq	%rax, %rdi
     34c:      	xorq	%rdx, %rdi
     34f:      	movq	%rdi, -0x48(%rbp)
     353:      	movq	%rax, %rbx
     356:      	notq	%rbx
     359:      	andq	%r9, %rbx
     35c:      	movq	%r9, %rdi
     35f:      	xorq	%r13, %rbx
     362:      	movq	%rcx, %r9
     365:      	notq	%r9
     368:      	andq	%rdx, %r9
     36b:      	notq	%rdx
     36e:      	andq	%rdx, %r13
     371:      	movq	-0x30(%rbp), %r8
     375:      	movq	%r8, %rdx
     378:      	notq	%rdx
     37b:      	andq	%r11, %rdx
     37e:      	xorq	%r12, %rdx
     381:      	movq	%rdx, -0x58(%rbp)
     385:      	xorq	%r8, %r10
     388:      	movq	%r10, -0x30(%rbp)
     38c:      	movq	-0x60(%rbp), %r8
     390:      	movq	%rdi, %r10
     393:      	notq	%r10
     396:      	andq	%rcx, %r10
     399:      	xorq	%rax, %r10
     39c:      	movq	%r10, -0x60(%rbp)
     3a0:      	movq	-0x38(%rbp), %rdx
     3a4:      	rolq	%rdx
     3a7:      	movq	-0xb0(%rbp), %r11
     3ae:      	rolq	$0x1b, %r11
     3b2:      	movq	%r11, -0xb0(%rbp)
     3b9:      	rolq	$0x24, %rsi
     3bd:      	movq	%rsi, -0x68(%rbp)
     3c1:      	rolq	$0x6, %r8
     3c5:      	xorq	%rdi, %r9
     3c8:      	movq	-0xe0(%rbp), %rax
     3cf:      	rolq	$0xa, %rax
     3d3:      	xorq	%rcx, %r13
     3d6:      	movq	%r13, -0x38(%rbp)
     3da:      	movq	-0xf8(%rbp), %r13
     3e1:      	rolq	$0x19, %r13
     3e5:      	movq	-0xd8(%rbp), %r10
     3ec:      	rolq	$0xf, %r10
     3f0:      	movq	-0xd0(%rbp), %rdi
     3f7:      	rolq	$0x8, %rdi
     3fb:      	xorq	%r15, %r14
     3fe:      	movq	%r14, -0x88(%rbp)
     405:      	movq	-0xb8(%rbp), %rcx
     40c:      	rolq	$0x38, %rcx
     410:      	movq	%rcx, -0xb8(%rbp)
     417:      	movq	%rsi, %r15
     41a:      	notq	%r15
     41d:      	andq	%rax, %r15
     420:      	movq	%rax, %rsi
     423:      	notq	%rsi
     426:      	andq	%r10, %rsi
     429:      	movq	%rcx, %r12
     42c:      	notq	%r12
     42f:      	andq	%r11, %r12
     432:      	xorq	%r10, %r12
     435:      	notq	%r10
     438:      	andq	%rcx, %r10
     43b:      	xorq	%rax, %r10
     43e:      	movq	-0x100(%rbp), %r14
     445:      	rolq	$0x12, %r14
     449:      	movq	%r8, %rax
     44c:      	notq	%rax
     44f:      	andq	%r13, %rax
     452:      	movq	%rdi, %r11
     455:      	notq	%r11
     458:      	andq	%r14, %r11
     45b:      	xorq	%r13, %r11
     45e:      	notq	%r13
     461:      	andq	%rdi, %r13
     464:      	movq	%r14, %rcx
     467:      	notq	%rcx
     46a:      	andq	%rdx, %rcx
     46d:      	xorq	%rdi, %rcx
     470:      	xorq	%rdx, %rax
     473:      	xorq	%r8, %r13
     476:      	notq	%rdx
     479:      	andq	%r8, %rdx
     47c:      	xorq	%r14, %rdx
     47f:      	movq	%rdx, -0x80(%rbp)
     483:      	movq	-0xb0(%rbp), %r8
     48a:      	xorq	%r8, %r15
     48d:      	movq	-0x68(%rbp), %rdx
     491:      	xorq	%rdx, %rsi
     494:      	notq	%r8
     497:      	andq	%rdx, %r8
     49a:      	xorq	-0xb8(%rbp), %r8
     4a1:      	movq	-0x40(%rbp), %rdx
     4a5:      	xorq	-0xa8(%rbp), %rdx
     4ac:      	movq	%rdx, -0x40(%rbp)
     4b0:      	leaq	(%rip), %rdx            # 0x4b7 <toyos_crypto::keccak::permute (.llvm.4555766010212265317)+0x4b7>
     4b7:      	movq	-0x108(%rbp), %rdi
     4be:      	movq	-0x50(%rbp), %r14
     4c2:      	xorq	(%rdi,%rdx), %r14
     4c6:      	xorq	-0xc0(%rbp), %r14
     4cd:      	movq	%r14, -0x50(%rbp)
     4d1:      	leaq	0x8(%rdi), %rdx
     4d5:      	cmpq	$0xc0, %rdx
     4dc:      	jne	0xe0 <toyos_crypto::keccak::permute (.llvm.4555766010212265317)+0xe0>
     4e2:      	movq	-0xe8(%rbp), %r14
     4e9:      	movq	-0x98(%rbp), %rdx
     4f0:      	movq	%rdx, 0x8(%r14)
     4f4:      	movq	-0xa0(%rbp), %rdx
     4fb:      	movq	%rdx, 0x10(%r14)
     4ff:      	movq	-0x58(%rbp), %rdx
     503:      	movq	%rdx, 0x18(%r14)
     507:      	movq	-0x30(%rbp), %rdx
     50b:      	movq	%rdx, 0x20(%r14)
     50f:      	movq	-0x48(%rbp), %rdx
     513:      	movq	%rdx, 0x28(%r14)
     517:      	movq	%rbx, 0x30(%r14)
     51b:      	movq	-0x60(%rbp), %rdi
     51f:      	movq	%rdi, 0x38(%r14)
     523:      	movq	%r9, 0x40(%r14)
     527:      	movq	-0x38(%rbp), %rdi
     52b:      	movq	%rdi, 0x48(%r14)
     52f:      	movq	%rax, 0x50(%r14)
     533:      	movq	%r13, 0x58(%r14)
     537:      	movq	%r11, 0x60(%r14)
     53b:      	movq	%rcx, 0x68(%r14)
     53f:      	movq	-0x80(%rbp), %rax
     543:      	movq	%rax, 0x70(%r14)
     547:      	movq	%r15, 0x78(%r14)
     54b:      	movq	%rsi, 0x80(%r14)
     552:      	movq	%r10, 0x88(%r14)
     559:      	movq	%r12, 0x90(%r14)
     560:      	movq	%r8, 0x98(%r14)
     567:      	movq	-0x70(%rbp), %rax
     56b:      	movq	%rax, 0xa0(%r14)
     572:      	movq	-0x78(%rbp), %rax
     576:      	movq	%rax, 0xa8(%r14)
     57d:      	movq	-0x90(%rbp), %rax
     584:      	movq	%rax, 0xb0(%r14)
     58b:      	movq	-0x88(%rbp), %rax
     592:      	movq	%rax, 0xb8(%r14)
     599:      	movq	-0x40(%rbp), %rax
     59d:      	movq	%rax, 0xc0(%r14)
     5a4:      	movq	-0x50(%rbp), %rax
     5a8:      	movq	%rax, (%r14)
     5ab:      	addq	$0x60, %rsp
     5af:      	popq	%rbx
     5b0:      	popq	%r12
     5b2:      	popq	%r13
     5b4:      	popq	%r14
     5b6:      	popq	%r15
     5b8:      	popq	%rbp
     5b9:      	retq

~/.claude/jobs/2280e09e/tmp/scratchpad/agents/mlkem/target-rlib/x86_64-unknown-toyos/toyos/libtoyos_crypto.rlib(toyos_crypto-d55b0841b948afee.e9e023su5zr58yv99ezecp7gn.1cf1o63.rcgu.o):	file format elf64-x86-64

