0000000000000000 <<toyos_crypto::mlkem::Poly>::decode::<1>>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%rbx
       9:      	subq	$0x218, %rsp            # imm = 0x218
      10:      	movq	%rdx, -0x230(%rbp)
      17:      	cmpq	$0x20, %rdx
      1b:      	jne	0x1ab <<toyos_crypto::mlkem::Poly>::decode::<1>+0x1ab>
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
      4b:      	je	0x191 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x191>
      51:      	leaq	0x20(%r14), %rdi
      55:      	movq	%r14, %rsi
      58:      	callq	0x5d <<toyos_crypto::mlkem::Poly>::decode::<1>+0x5d>
      5d:      	testb	%al, %al
      5f:      	je	0x191 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x191>
      65:      	leaq	-0x30(%rbp), %rax
      69:      	movq	%r14, %rcx
      6c:      	subq	%rax, %rcx
      6f:      	movq	%rax, %rdx
      72:      	subq	%r14, %rdx
      75:      	movl	$0xe, %esi
      7a:      	xorps	%xmm0, %xmm0
      7d:      	nopl	(%rax)
      80:      	movaps	%xmm0, -0x30(%rbp)
      84:      	cmpq	%rax, %r14
      87:      	movq	%rcx, %rdi
      8a:      	cmovbq	%rdx, %rdi
      8e:      	testq	%rdi, %rdi
      91:      	je	0x177 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x177>
      97:      	movzbl	(%r14), %edi
      9b:      	movb	%dil, -0x30(%rbp)
      9f:      	movzwl	-0x30(%rbp), %edi
      a3:      	movl	%edi, %r8d
      a6:      	andl	$0x1, %r8d
      aa:      	movw	%r8w, -0x23e(%rbp,%rsi)
      b3:      	movl	%edi, %r8d
      b6:      	shrl	%r8d
      b9:      	andl	$0x1, %r8d
      bd:      	movw	%r8w, -0x23c(%rbp,%rsi)
      c6:      	movl	%edi, %r8d
      c9:      	shrl	$0x2, %r8d
      cd:      	andl	$0x1, %r8d
      d1:      	movw	%r8w, -0x23a(%rbp,%rsi)
      da:      	movl	%edi, %r8d
      dd:      	shrl	$0x3, %r8d
      e1:      	andl	$0x1, %r8d
      e5:      	movw	%r8w, -0x238(%rbp,%rsi)
      ee:      	movl	%edi, %r8d
      f1:      	shrl	$0x4, %r8d
      f5:      	andl	$0x1, %r8d
      f9:      	movw	%r8w, -0x236(%rbp,%rsi)
     102:      	movl	%edi, %r8d
     105:      	shrl	$0x5, %r8d
     109:      	andl	$0x1, %r8d
     10d:      	movw	%r8w, -0x234(%rbp,%rsi)
     116:      	movl	%edi, %r8d
     119:      	shrl	$0x6, %r8d
     11d:      	andl	$0x1, %r8d
     121:      	movw	%r8w, -0x232(%rbp,%rsi)
     12a:      	shrl	$0x7, %edi
     12d:      	andl	$0x1, %edi
     130:      	movw	%di, -0x230(%rbp,%rsi)
     138:      	addq	$0x10, %rsi
     13c:      	incq	%r14
     13f:      	incq	%rcx
     142:      	decq	%rdx
     145:      	cmpq	$0x20e, %rsi            # imm = 0x20E
     14c:      	jne	0x80 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x80>
     152:      	leaq	-0x230(%rbp), %rsi
     159:      	movl	$0x200, %edx            # imm = 0x200
     15e:      	movq	%rbx, %rdi
     161:      	callq	0x166 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x166>
     166:      	movq	%rbx, %rax
     169:      	addq	$0x218, %rsp            # imm = 0x218
     170:      	popq	%rbx
     171:      	popq	%r14
     173:      	popq	%r15
     175:      	popq	%rbp
     176:      	retq
     177:      	leaq	(%rip), %rdi            # 0x17e <<toyos_crypto::mlkem::Poly>::decode::<1>+0x17e>
     17e:      	leaq	(%rip), %rcx            # 0x185 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x185>
     185:      	movl	$0x237, %esi            # imm = 0x237
     18a:      	xorl	%edx, %edx
     18c:      	callq	0x191 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x191>
     191:      	leaq	(%rip), %rdi            # 0x198 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x198>
     198:      	leaq	(%rip), %rcx            # 0x19f <<toyos_crypto::mlkem::Poly>::decode::<1>+0x19f>
     19f:      	movl	$0x193, %esi            # imm = 0x193
     1a4:      	xorl	%edx, %edx
     1a6:      	callq	0x1ab <<toyos_crypto::mlkem::Poly>::decode::<1>+0x1ab>
     1ab:      	leaq	(%rip), %rdx            # 0x1b2 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x1b2>
     1b2:      	leaq	(%rip), %r9             # 0x1b9 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x1b9>
     1b9:      	leaq	-0x230(%rbp), %rsi
     1c0:      	xorl	%edi, %edi
     1c2:      	xorl	%ecx, %ecx
     1c4:      	callq	0x1c9 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x1c9>
     1c9:      	callq	0x1ce <<toyos_crypto::mlkem::Poly>::decode::<1>+0x1ce>
     1ce:      	callq	0x1d3 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x1d3>

0000000000000000 <<toyos_crypto::mlkem::Poly>::decode::<4>>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%rbx
       9:      	subq	$0x218, %rsp            # imm = 0x218
      10:      	movq	%rdx, -0x230(%rbp)
      17:      	cmpq	$0x80, %rdx
      1e:      	jne	0x19c <<toyos_crypto::mlkem::Poly>::decode::<4>+0x19c>
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
      4e:      	je	0x182 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x182>
      54:      	leaq	0x80(%r14), %rdi
      5b:      	movq	%r14, %rsi
      5e:      	callq	0x63 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x63>
      63:      	testb	%al, %al
      65:      	je	0x182 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x182>
      6b:      	leaq	-0x30(%rbp), %rax
      6f:      	movq	%r14, %rcx
      72:      	subq	%rax, %rcx
      75:      	movq	%rax, %rdx
      78:      	subq	%r14, %rdx
      7b:      	xorl	%esi, %esi
      7d:      	xorps	%xmm0, %xmm0
      80:      	leaq	(%r14,%rsi), %rdi
      84:      	movaps	%xmm0, -0x30(%rbp)
      88:      	leaq	(%rcx,%rsi), %r8
      8c:      	cmpq	%rax, %rdi
      8f:      	cmovbq	%rdx, %r8
      93:      	cmpq	$0x3, %r8
      97:      	jbe	0x168 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x168>
      9d:      	movl	(%rdi), %edi
      9f:      	movl	%edi, -0x30(%rbp)
      a2:      	movzwl	%di, %r8d
      a6:      	movl	%edi, %r9d
      a9:      	andl	$0xf, %r9d
      ad:      	movw	%r9w, -0x230(%rbp,%rsi,4)
      b6:      	movl	%edi, %r9d
      b9:      	shrl	$0x4, %r9d
      bd:      	andl	$0xf, %r9d
      c1:      	movw	%r9w, -0x22e(%rbp,%rsi,4)
      ca:      	movl	%edi, %r9d
      cd:      	shrl	$0x8, %r9d
      d1:      	andl	$0xf, %r9d
      d5:      	movw	%r9w, -0x22c(%rbp,%rsi,4)
      de:      	shrl	$0xc, %r8d
      e2:      	movw	%r8w, -0x22a(%rbp,%rsi,4)
      eb:      	movzwl	-0x2e(%rbp), %r8d
      f0:      	andl	$0xf, %r8d
      f4:      	movw	%r8w, -0x228(%rbp,%rsi,4)
      fd:      	movl	%edi, %r8d
     100:      	shrl	$0x14, %r8d
     104:      	andl	$0xf, %r8d
     108:      	movw	%r8w, -0x226(%rbp,%rsi,4)
     111:      	movzwl	-0x2d(%rbp), %r8d
     116:      	andl	$0xf, %r8d
     11a:      	movw	%r8w, -0x224(%rbp,%rsi,4)
     123:      	shrl	$0x1c, %edi
     126:      	movw	%di, -0x222(%rbp,%rsi,4)
     12e:      	addq	$0x4, %rsi
     132:      	addq	$-0x4, %rdx
     136:      	cmpq	$0x80, %rsi
     13d:      	jne	0x80 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x80>
     143:      	leaq	-0x230(%rbp), %rsi
     14a:      	movl	$0x200, %edx            # imm = 0x200
     14f:      	movq	%rbx, %rdi
     152:      	callq	0x157 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x157>
     157:      	movq	%rbx, %rax
     15a:      	addq	$0x218, %rsp            # imm = 0x218
     161:      	popq	%rbx
     162:      	popq	%r14
     164:      	popq	%r15
     166:      	popq	%rbp
     167:      	retq
     168:      	leaq	(%rip), %rdi            # 0x16f <<toyos_crypto::mlkem::Poly>::decode::<4>+0x16f>
     16f:      	leaq	(%rip), %rcx            # 0x176 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x176>
     176:      	movl	$0x237, %esi            # imm = 0x237
     17b:      	xorl	%edx, %edx
     17d:      	callq	0x182 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x182>
     182:      	leaq	(%rip), %rdi            # 0x189 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x189>
     189:      	leaq	(%rip), %rcx            # 0x190 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x190>
     190:      	movl	$0x193, %esi            # imm = 0x193
     195:      	xorl	%edx, %edx
     197:      	callq	0x19c <<toyos_crypto::mlkem::Poly>::decode::<4>+0x19c>
     19c:      	leaq	(%rip), %rdx            # 0x1a3 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x1a3>
     1a3:      	leaq	(%rip), %r9             # 0x1aa <<toyos_crypto::mlkem::Poly>::decode::<4>+0x1aa>
     1aa:      	leaq	-0x230(%rbp), %rsi
     1b1:      	xorl	%edi, %edi
     1b3:      	xorl	%ecx, %ecx
     1b5:      	callq	0x1ba <<toyos_crypto::mlkem::Poly>::decode::<4>+0x1ba>
     1ba:      	callq	0x1bf <<toyos_crypto::mlkem::Poly>::decode::<4>+0x1bf>
     1bf:      	callq	0x1c4 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x1c4>

0000000000000000 <<toyos_crypto::mlkem::Poly>::decode::<10>>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%rbx
       9:      	subq	$0x218, %rsp            # imm = 0x218
      10:      	movq	%rdx, -0x230(%rbp)
      17:      	cmpq	$0x140, %rdx            # imm = 0x140
      1e:      	jne	0x1e4 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1e4>
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
      4e:      	je	0x1ca <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1ca>
      54:      	leaq	0x140(%r14), %rdi
      5b:      	movq	%r14, %rsi
      5e:      	callq	0x63 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x63>
      63:      	testb	%al, %al
      65:      	je	0x1ca <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1ca>
      6b:      	leaq	-0x30(%rbp), %rax
      6f:      	movq	%r14, %rcx
      72:      	subq	%rax, %rcx
      75:      	movq	%rax, %rdx
      78:      	subq	%r14, %rdx
      7b:      	movl	$0xe, %esi
      80:      	xorps	%xmm0, %xmm0
      83:      	nopw	%cs:(%rax,%rax)
      90:      	movaps	%xmm0, -0x30(%rbp)
      94:      	cmpq	%rax, %r14
      97:      	movq	%rcx, %rdi
      9a:      	cmovbq	%rdx, %rdi
      9e:      	cmpq	$0x9, %rdi
      a2:      	jbe	0x1b0 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1b0>
      a8:      	movzwl	0x8(%r14), %edi
      ad:      	movw	%di, -0x28(%rbp)
      b1:      	movq	(%r14), %r8
      b4:      	movq	%r8, -0x30(%rbp)
      b8:      	movl	-0x28(%rbp), %edi
      bb:      	movl	%r8d, %r9d
      be:      	andl	$0x3ff, %r9d            # imm = 0x3FF
      c5:      	movw	%r9w, -0x23e(%rbp,%rsi)
      ce:      	movl	%r8d, %r9d
      d1:      	shrl	$0xa, %r9d
      d5:      	andl	$0x3ff, %r9d            # imm = 0x3FF
      dc:      	movw	%r9w, -0x23c(%rbp,%rsi)
      e5:      	movl	%r8d, %r9d
      e8:      	shrl	$0x14, %r9d
      ec:      	andl	$0x3ff, %r9d            # imm = 0x3FF
      f3:      	movw	%r9w, -0x23a(%rbp,%rsi)
      fc:      	movq	%r8, %r9
      ff:      	shrq	$0x1e, %r9
     103:      	andl	$0x3ff, %r9d            # imm = 0x3FF
     10a:      	movw	%r9w, -0x238(%rbp,%rsi)
     113:      	movzwl	-0x2b(%rbp), %r9d
     118:      	andl	$0x3ff, %r9d            # imm = 0x3FF
     11f:      	movw	%r9w, -0x236(%rbp,%rsi)
     128:      	movq	%r8, %r9
     12b:      	shrq	$0x32, %r9
     12f:      	andl	$0x3ff, %r9d            # imm = 0x3FF
     136:      	movw	%r9w, -0x234(%rbp,%rsi)
     13f:      	shrq	$0x3c, %r8
     143:      	movl	%edi, %r9d
     146:      	shll	$0x4, %r9d
     14a:      	orl	%r8d, %r9d
     14d:      	andl	$0x3ff, %r9d            # imm = 0x3FF
     154:      	movw	%r9w, -0x232(%rbp,%rsi)
     15d:      	shrl	$0x6, %edi
     160:      	andl	$0x3ff, %edi            # imm = 0x3FF
     166:      	movw	%di, -0x230(%rbp,%rsi)
     16e:      	addq	$0x10, %rsi
     172:      	addq	$0xa, %r14
     176:      	addq	$0xa, %rcx
     17a:      	addq	$-0xa, %rdx
     17e:      	cmpq	$0x20e, %rsi            # imm = 0x20E
     185:      	jne	0x90 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x90>
     18b:      	leaq	-0x230(%rbp), %rsi
     192:      	movl	$0x200, %edx            # imm = 0x200
     197:      	movq	%rbx, %rdi
     19a:      	callq	0x19f <<toyos_crypto::mlkem::Poly>::decode::<10>+0x19f>
     19f:      	movq	%rbx, %rax
     1a2:      	addq	$0x218, %rsp            # imm = 0x218
     1a9:      	popq	%rbx
     1aa:      	popq	%r14
     1ac:      	popq	%r15
     1ae:      	popq	%rbp
     1af:      	retq
     1b0:      	leaq	(%rip), %rdi            # 0x1b7 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1b7>
     1b7:      	leaq	(%rip), %rcx            # 0x1be <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1be>
     1be:      	movl	$0x237, %esi            # imm = 0x237
     1c3:      	xorl	%edx, %edx
     1c5:      	callq	0x1ca <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1ca>
     1ca:      	leaq	(%rip), %rdi            # 0x1d1 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1d1>
     1d1:      	leaq	(%rip), %rcx            # 0x1d8 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1d8>
     1d8:      	movl	$0x193, %esi            # imm = 0x193
     1dd:      	xorl	%edx, %edx
     1df:      	callq	0x1e4 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1e4>
     1e4:      	leaq	(%rip), %rdx            # 0x1eb <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1eb>
     1eb:      	leaq	(%rip), %r9             # 0x1f2 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1f2>
     1f2:      	leaq	-0x230(%rbp), %rsi
     1f9:      	xorl	%edi, %edi
     1fb:      	xorl	%ecx, %ecx
     1fd:      	callq	0x202 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x202>
     202:      	callq	0x207 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x207>
     207:      	callq	0x20c <<toyos_crypto::mlkem::Poly>::decode::<10>+0x20c>

0000000000000000 <<toyos_crypto::mlkem::Poly>::decode::<12>>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%rbx
       9:      	subq	$0x218, %rsp            # imm = 0x218
      10:      	movq	%rdx, -0x230(%rbp)
      17:      	cmpq	$0x180, %rdx            # imm = 0x180
      1e:      	jne	0x1d5 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1d5>
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
      4e:      	je	0x1bb <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1bb>
      54:      	leaq	0x180(%r14), %rdi
      5b:      	movq	%r14, %rsi
      5e:      	callq	0x63 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x63>
      63:      	testb	%al, %al
      65:      	je	0x1bb <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1bb>
      6b:      	leaq	-0x30(%rbp), %rax
      6f:      	movq	%r14, %rcx
      72:      	subq	%rax, %rcx
      75:      	movq	%rax, %rdx
      78:      	subq	%r14, %rdx
      7b:      	movl	$0xe, %esi
      80:      	xorps	%xmm0, %xmm0
      83:      	nopw	%cs:(%rax,%rax)
      90:      	movaps	%xmm0, -0x30(%rbp)
      94:      	cmpq	%rax, %r14
      97:      	movq	%rcx, %rdi
      9a:      	cmovbq	%rdx, %rdi
      9e:      	cmpq	$0xb, %rdi
      a2:      	jbe	0x1a1 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1a1>
      a8:      	movq	(%r14), %r8
      ab:      	movq	%r8, -0x30(%rbp)
      af:      	movl	0x8(%r14), %edi
      b3:      	movl	%edi, -0x28(%rbp)
      b6:      	movl	%r8d, %r9d
      b9:      	andl	$0xfff, %r9d            # imm = 0xFFF
      c0:      	movw	%r9w, -0x23e(%rbp,%rsi)
      c9:      	movl	%r8d, %r9d
      cc:      	shrl	$0xc, %r9d
      d0:      	andl	$0xfff, %r9d            # imm = 0xFFF
      d7:      	movw	%r9w, -0x23c(%rbp,%rsi)
      e0:      	movzwl	-0x2d(%rbp), %r9d
      e5:      	andl	$0xfff, %r9d            # imm = 0xFFF
      ec:      	movw	%r9w, -0x23a(%rbp,%rsi)
      f5:      	movq	%r8, %r9
      f8:      	shrq	$0x24, %r9
      fc:      	andl	$0xfff, %r9d            # imm = 0xFFF
     103:      	movw	%r9w, -0x238(%rbp,%rsi)
     10c:      	movzwl	-0x2a(%rbp), %r9d
     111:      	andl	$0xfff, %r9d            # imm = 0xFFF
     118:      	movw	%r9w, -0x236(%rbp,%rsi)
     121:      	movl	%edi, %r9d
     124:      	shll	$0x4, %r9d
     128:      	shrq	$0x3c, %r8
     12c:      	orl	%r9d, %r8d
     12f:      	andl	$0xfff, %r8d            # imm = 0xFFF
     136:      	movw	%r8w, -0x234(%rbp,%rsi)
     13f:      	movzwl	-0x27(%rbp), %r8d
     144:      	andl	$0xfff, %r8d            # imm = 0xFFF
     14b:      	movw	%r8w, -0x232(%rbp,%rsi)
     154:      	shrl	$0x14, %edi
     157:      	movw	%di, -0x230(%rbp,%rsi)
     15f:      	addq	$0x10, %rsi
     163:      	addq	$0xc, %r14
     167:      	addq	$0xc, %rcx
     16b:      	addq	$-0xc, %rdx
     16f:      	cmpq	$0x20e, %rsi            # imm = 0x20E
     176:      	jne	0x90 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x90>
     17c:      	leaq	-0x230(%rbp), %rsi
     183:      	movl	$0x200, %edx            # imm = 0x200
     188:      	movq	%rbx, %rdi
     18b:      	callq	0x190 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x190>
     190:      	movq	%rbx, %rax
     193:      	addq	$0x218, %rsp            # imm = 0x218
     19a:      	popq	%rbx
     19b:      	popq	%r14
     19d:      	popq	%r15
     19f:      	popq	%rbp
     1a0:      	retq
     1a1:      	leaq	(%rip), %rdi            # 0x1a8 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1a8>
     1a8:      	leaq	(%rip), %rcx            # 0x1af <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1af>
     1af:      	movl	$0x237, %esi            # imm = 0x237
     1b4:      	xorl	%edx, %edx
     1b6:      	callq	0x1bb <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1bb>
     1bb:      	leaq	(%rip), %rdi            # 0x1c2 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1c2>
     1c2:      	leaq	(%rip), %rcx            # 0x1c9 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1c9>
     1c9:      	movl	$0x193, %esi            # imm = 0x193
     1ce:      	xorl	%edx, %edx
     1d0:      	callq	0x1d5 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1d5>
     1d5:      	leaq	(%rip), %rdx            # 0x1dc <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1dc>
     1dc:      	leaq	(%rip), %r9             # 0x1e3 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1e3>
     1e3:      	leaq	-0x230(%rbp), %rsi
     1ea:      	xorl	%edi, %edi
     1ec:      	xorl	%ecx, %ecx
     1ee:      	callq	0x1f3 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1f3>
     1f3:      	callq	0x1f8 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1f8>
     1f8:      	callq	0x1fd <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1fd>

0000000000000000 <<toyos_crypto::mlkem::Poly>::encode::<1>>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r14
       6:      	pushq	%rbx
       7:      	subq	$0x10, %rsp
       b:      	movq	%rdx, -0x20(%rbp)
       f:      	cmpq	$0x20, %rdx
      13:      	jne	0x132 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x132>
      19:      	movq	%rsi, %rbx
      1c:      	movq	%rdi, %r14
      1f:      	addq	$0x200, %rdi            # imm = 0x200
      26:      	movq	%r14, %rsi
      29:      	callq	0x2e <<toyos_crypto::mlkem::Poly>::encode::<1>+0x2e>
      2e:      	testb	%al, %al
      30:      	je	0x118 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x118>
      36:      	leaq	0x20(%rbx), %rdi
      3a:      	movq	%rbx, %rsi
      3d:      	callq	0x42 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x42>
      42:      	testb	%al, %al
      44:      	je	0x118 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x118>
      4a:      	leaq	-0x20(%rbp), %rax
      4e:      	movq	%rax, %rcx
      51:      	subq	%rbx, %rcx
      54:      	movq	%rbx, %rdx
      57:      	subq	%rax, %rdx
      5a:      	xorl	%esi, %esi
      5c:      	nopl	(%rax)
      60:      	movzwl	0xa(%r14,%rsi), %edi
      66:      	shll	$0x5, %edi
      69:      	movzwl	0x8(%r14,%rsi), %r8d
      6f:      	shll	$0x4, %r8d
      73:      	orl	%edi, %r8d
      76:      	movzwl	0x6(%r14,%rsi), %r9d
      7c:      	shll	$0x3, %r9d
      80:      	movzwl	0x4(%r14,%rsi), %edi
      86:      	shll	$0x2, %edi
      89:      	orl	%r9d, %edi
      8c:      	orl	%r8d, %edi
      8f:      	movzwl	0x2(%r14,%rsi), %r8d
      95:      	addl	%r8d, %r8d
      98:      	movzwl	(%r14,%rsi), %r9d
      9d:      	orq	%r8, %r9
      a0:      	movzwl	0xc(%r14,%rsi), %r8d
      a6:      	shll	$0x6, %r8d
      aa:      	orq	%r9, %r8
      ad:      	movzwl	0xe(%r14,%rsi), %r9d
      b3:      	shll	$0x7, %r9d
      b7:      	orq	%r8, %rdi
      ba:      	orq	%r9, %rdi
      bd:      	movq	%rdi, -0x20(%rbp)
      c1:      	movq	$0x0, -0x18(%rbp)
      c9:      	cmpq	%rbx, %rax
      cc:      	movq	%rcx, %r8
      cf:      	cmovbq	%rdx, %r8
      d3:      	testq	%r8, %r8
      d6:      	je	0xfe <<toyos_crypto::mlkem::Poly>::encode::<1>+0xfe>
      d8:      	movb	%dil, (%rbx)
      db:      	addq	$0x10, %rsi
      df:      	incq	%rbx
      e2:      	decq	%rcx
      e5:      	incq	%rdx
      e8:      	cmpq	$0x200, %rsi            # imm = 0x200
      ef:      	jne	0x60 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x60>
      f5:      	addq	$0x10, %rsp
      f9:      	popq	%rbx
      fa:      	popq	%r14
      fc:      	popq	%rbp
      fd:      	retq
      fe:      	leaq	(%rip), %rdi            # 0x105 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x105>
     105:      	leaq	(%rip), %rcx            # 0x10c <<toyos_crypto::mlkem::Poly>::encode::<1>+0x10c>
     10c:      	movl	$0x237, %esi            # imm = 0x237
     111:      	xorl	%edx, %edx
     113:      	callq	0x118 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x118>
     118:      	leaq	(%rip), %rdi            # 0x11f <<toyos_crypto::mlkem::Poly>::encode::<1>+0x11f>
     11f:      	leaq	(%rip), %rcx            # 0x126 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x126>
     126:      	movl	$0x193, %esi            # imm = 0x193
     12b:      	xorl	%edx, %edx
     12d:      	callq	0x132 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x132>
     132:      	leaq	(%rip), %rdx            # 0x139 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x139>
     139:      	leaq	(%rip), %r9             # 0x140 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x140>
     140:      	leaq	-0x20(%rbp), %rsi
     144:      	xorl	%edi, %edi
     146:      	xorl	%ecx, %ecx
     148:      	callq	0x14d <<toyos_crypto::mlkem::Poly>::encode::<1>+0x14d>
     14d:      	callq	0x152 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x152>
     152:      	callq	0x157 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x157>

0000000000000000 <<toyos_crypto::mlkem::Poly>::encode::<4>>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r14
       6:      	pushq	%rbx
       7:      	subq	$0x10, %rsp
       b:      	movq	%rdx, -0x20(%rbp)
       f:      	cmpq	$0x80, %rdx
      16:      	jne	0x146 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x146>
      1c:      	movq	%rsi, %rbx
      1f:      	movq	%rdi, %r14
      22:      	addq	$0x200, %rdi            # imm = 0x200
      29:      	movq	%r14, %rsi
      2c:      	callq	0x31 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x31>
      31:      	testb	%al, %al
      33:      	je	0x12c <<toyos_crypto::mlkem::Poly>::encode::<4>+0x12c>
      39:      	leaq	0x80(%rbx), %rdi
      40:      	movq	%rbx, %rsi
      43:      	callq	0x48 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x48>
      48:      	testb	%al, %al
      4a:      	je	0x12c <<toyos_crypto::mlkem::Poly>::encode::<4>+0x12c>
      50:      	leaq	-0x20(%rbp), %rax
      54:      	movq	%rax, %rcx
      57:      	subq	%rbx, %rcx
      5a:      	movq	%rbx, %rdx
      5d:      	subq	%rax, %rdx
      60:      	xorl	%esi, %esi
      62:      	nopw	%cs:(%rax,%rax)
      70:      	leaq	(%rbx,%rsi), %rdi
      74:      	movzwl	(%r14,%rsi,4), %r8d
      79:      	movzwl	0x2(%r14,%rsi,4), %r9d
      7f:      	shll	$0x4, %r9d
      83:      	orq	%r8, %r9
      86:      	movzwl	0x4(%r14,%rsi,4), %r8d
      8c:      	shll	$0x8, %r8d
      90:      	movzwl	0x6(%r14,%rsi,4), %r10d
      96:      	shll	$0xc, %r10d
      9a:      	orq	%r8, %r10
      9d:      	orq	%r9, %r10
      a0:      	movzwl	0x8(%r14,%rsi,4), %r8d
      a6:      	shll	$0x10, %r8d
      aa:      	movzwl	0xa(%r14,%rsi,4), %r9d
      b0:      	shlq	$0x14, %r9
      b4:      	orq	%r8, %r9
      b7:      	movzwl	0xc(%r14,%rsi,4), %r11d
      bd:      	shlq	$0x18, %r11
      c1:      	orq	%r9, %r11
      c4:      	orq	%r10, %r11
      c7:      	movzwl	0xe(%r14,%rsi,4), %r8d
      cd:      	shlq	$0x1c, %r8
      d1:      	orq	%r11, %r8
      d4:      	movq	%r8, -0x20(%rbp)
      d8:      	movq	$0x0, -0x18(%rbp)
      e0:      	leaq	(%rdx,%rsi), %r9
      e4:      	cmpq	%rdi, %rax
      e7:      	cmovaeq	%rcx, %r9
      eb:      	cmpq	$0x3, %r9
      ef:      	jbe	0x112 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x112>
      f1:      	movl	%r8d, (%rdi)
      f4:      	addq	$0x4, %rsi
      f8:      	addq	$-0x4, %rcx
      fc:      	cmpq	$0x80, %rsi
     103:      	jne	0x70 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x70>
     109:      	addq	$0x10, %rsp
     10d:      	popq	%rbx
     10e:      	popq	%r14
     110:      	popq	%rbp
     111:      	retq
     112:      	leaq	(%rip), %rdi            # 0x119 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x119>
     119:      	leaq	(%rip), %rcx            # 0x120 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x120>
     120:      	movl	$0x237, %esi            # imm = 0x237
     125:      	xorl	%edx, %edx
     127:      	callq	0x12c <<toyos_crypto::mlkem::Poly>::encode::<4>+0x12c>
     12c:      	leaq	(%rip), %rdi            # 0x133 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x133>
     133:      	leaq	(%rip), %rcx            # 0x13a <<toyos_crypto::mlkem::Poly>::encode::<4>+0x13a>
     13a:      	movl	$0x193, %esi            # imm = 0x193
     13f:      	xorl	%edx, %edx
     141:      	callq	0x146 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x146>
     146:      	leaq	(%rip), %rdx            # 0x14d <<toyos_crypto::mlkem::Poly>::encode::<4>+0x14d>
     14d:      	leaq	(%rip), %r9             # 0x154 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x154>
     154:      	leaq	-0x20(%rbp), %rsi
     158:      	xorl	%edi, %edi
     15a:      	xorl	%ecx, %ecx
     15c:      	callq	0x161 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x161>
     161:      	callq	0x166 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x166>
     166:      	callq	0x16b <<toyos_crypto::mlkem::Poly>::encode::<4>+0x16b>

0000000000000000 <<toyos_crypto::mlkem::Poly>::encode::<10>>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r14
       6:      	pushq	%rbx
       7:      	subq	$0x10, %rsp
       b:      	movq	%rdx, -0x20(%rbp)
       f:      	cmpq	$0x140, %rdx            # imm = 0x140
      16:      	jne	0x161 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x161>
      1c:      	movq	%rsi, %rbx
      1f:      	movq	%rdi, %r14
      22:      	addq	$0x200, %rdi            # imm = 0x200
      29:      	movq	%r14, %rsi
      2c:      	callq	0x31 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x31>
      31:      	testb	%al, %al
      33:      	je	0x147 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x147>
      39:      	leaq	0x140(%rbx), %rdi
      40:      	movq	%rbx, %rsi
      43:      	callq	0x48 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x48>
      48:      	testb	%al, %al
      4a:      	je	0x147 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x147>
      50:      	leaq	-0x20(%rbp), %rax
      54:      	movq	%rax, %rcx
      57:      	subq	%rbx, %rcx
      5a:      	movq	%rbx, %rdx
      5d:      	subq	%rax, %rdx
      60:      	xorl	%esi, %esi
      62:      	nopw	%cs:(%rax,%rax)
      70:      	movzwl	(%r14,%rsi), %edi
      75:      	movzwl	0x2(%r14,%rsi), %r8d
      7b:      	shll	$0xa, %r8d
      7f:      	orq	%rdi, %r8
      82:      	movzwl	0x4(%r14,%rsi), %r9d
      88:      	shlq	$0x14, %r9
      8c:      	movzwl	0x6(%r14,%rsi), %edi
      92:      	shlq	$0x1e, %rdi
      96:      	orq	%r9, %rdi
      99:      	orq	%r8, %rdi
      9c:      	movzwl	0x8(%r14,%rsi), %r8d
      a2:      	shlq	$0x28, %r8
      a6:      	movzwl	0xa(%r14,%rsi), %r9d
      ac:      	movl	%r9d, %r10d
      af:      	shrl	$0xe, %r10d
      b3:      	shlq	$0x32, %r9
      b7:      	orq	%r8, %r9
      ba:      	movzwl	0xc(%r14,%rsi), %r8d
      c0:      	movl	%r8d, %r11d
      c3:      	shrl	$0x4, %r11d
      c7:      	orl	%r10d, %r11d
      ca:      	shlq	$0x3c, %r8
      ce:      	orq	%r9, %r8
      d1:      	orq	%rdi, %r8
      d4:      	movzwl	0xe(%r14,%rsi), %edi
      da:      	shll	$0x6, %edi
      dd:      	orl	%r11d, %edi
      e0:      	movq	%rdi, -0x18(%rbp)
      e4:      	movq	%r8, -0x20(%rbp)
      e8:      	cmpq	%rbx, %rax
      eb:      	movq	%rcx, %rdi
      ee:      	cmovbq	%rdx, %rdi
      f2:      	cmpq	$0x9, %rdi
      f6:      	jbe	0x12d <<toyos_crypto::mlkem::Poly>::encode::<10>+0x12d>
      f8:      	movzwl	-0x18(%rbp), %edi
      fc:      	movw	%di, 0x8(%rbx)
     100:      	movq	-0x20(%rbp), %rdi
     104:      	movq	%rdi, (%rbx)
     107:      	addq	$0x10, %rsi
     10b:      	addq	$0xa, %rbx
     10f:      	addq	$-0xa, %rcx
     113:      	addq	$0xa, %rdx
     117:      	cmpq	$0x200, %rsi            # imm = 0x200
     11e:      	jne	0x70 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x70>
     124:      	addq	$0x10, %rsp
     128:      	popq	%rbx
     129:      	popq	%r14
     12b:      	popq	%rbp
     12c:      	retq
     12d:      	leaq	(%rip), %rdi            # 0x134 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x134>
     134:      	leaq	(%rip), %rcx            # 0x13b <<toyos_crypto::mlkem::Poly>::encode::<10>+0x13b>
     13b:      	movl	$0x237, %esi            # imm = 0x237
     140:      	xorl	%edx, %edx
     142:      	callq	0x147 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x147>
     147:      	leaq	(%rip), %rdi            # 0x14e <<toyos_crypto::mlkem::Poly>::encode::<10>+0x14e>
     14e:      	leaq	(%rip), %rcx            # 0x155 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x155>
     155:      	movl	$0x193, %esi            # imm = 0x193
     15a:      	xorl	%edx, %edx
     15c:      	callq	0x161 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x161>
     161:      	leaq	(%rip), %rdx            # 0x168 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x168>
     168:      	leaq	(%rip), %r9             # 0x16f <<toyos_crypto::mlkem::Poly>::encode::<10>+0x16f>
     16f:      	leaq	-0x20(%rbp), %rsi
     173:      	xorl	%edi, %edi
     175:      	xorl	%ecx, %ecx
     177:      	callq	0x17c <<toyos_crypto::mlkem::Poly>::encode::<10>+0x17c>
     17c:      	callq	0x181 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x181>
     181:      	callq	0x186 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x186>

0000000000000000 <<&[toyos_crypto::mlkem::Poly; 3] as core::iter::traits::collect::IntoIterator>::into_iter>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	movq	%rdi, %rax
       7:      	leaq	0x600(%rdi), %rdx
       e:      	popq	%rbp
       f:      	retq

~/.claude/jobs/2280e09e/tmp/scratchpad/agents/mlkem/target-rlib/x86_64-unknown-toyos/toyos/libtoyos_crypto.rlib(toyos_crypto-d55b0841b948afee.19ir237185zdrlvqazyogfnax.0acy6cv.rcgu.o):	file format elf64-x86-64

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
      2e:      	leaq	-0x1270(%rbp), %rax
      35:      	movq	%rax, -0xc70(%rbp)
      3c:      	movq	$0x3, -0xc68(%rbp)
      47:      	xorl	%r14d, %r14d
      4a:      	leaq	-0xa70(%rbp), %rdi
      51:      	movq	%rcx, -0x38(%rbp)
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
      90:      	leaq	-0x470(%rbp), %r14
      97:      	movl	$0x200, %edx            # imm = 0x200
      9c:      	movq	%r14, %rdi
      9f:      	movq	%rbx, %rsi
      a2:      	callq	0xa7 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa7>
      a7:      	leaq	-0x1870(%rbp), %rbx
      ae:      	movl	$0x200, %edx            # imm = 0x200
      b3:      	movq	%rbx, %rdi
      b6:      	movq	%r14, %rsi
      b9:      	callq	0xbe <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbe>
      be:      	leaq	-0x1270(%rbp), %rdi
      c5:      	movl	$0x200, %edx            # imm = 0x200
      ca:      	movq	%rbx, %rsi
      cd:      	callq	0xd2 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd2>
      d2:      	movl	$0x1, %r14d
      d8:      	leaq	-0xa70(%rbp), %rdi
      df:      	movq	-0x38(%rbp), %rsi
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
     11b:      	leaq	-0x470(%rbp), %r14
     122:      	movl	$0x200, %edx            # imm = 0x200
     127:      	movq	%r14, %rdi
     12a:      	movq	%rbx, %rsi
     12d:      	callq	0x132 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x132>
     132:      	leaq	-0x1870(%rbp), %rbx
     139:      	movl	$0x200, %edx            # imm = 0x200
     13e:      	movq	%rbx, %rdi
     141:      	movq	%r14, %rsi
     144:      	callq	0x149 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x149>
     149:      	leaq	-0x1070(%rbp), %rdi
     150:      	movl	$0x200, %edx            # imm = 0x200
     155:      	movq	%rbx, %rsi
     158:      	callq	0x15d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x15d>
     15d:      	movl	$0x2, %r14d
     163:      	leaq	-0xa70(%rbp), %rdi
     16a:      	movq	-0x38(%rbp), %rsi
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
     1b1:      	leaq	-0x470(%rbp), %r14
     1b8:      	movl	$0x200, %edx            # imm = 0x200
     1bd:      	movq	%r14, %rdi
     1c0:      	movq	%rbx, %rsi
     1c3:      	callq	0x1c8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1c8>
     1c8:      	leaq	-0x1870(%rbp), %r15
     1cf:      	movl	$0x200, %edx            # imm = 0x200
     1d4:      	movq	%r15, %rdi
     1d7:      	movq	%r14, %rsi
     1da:      	movq	%rbx, %r14
     1dd:      	callq	0x1e2 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1e2>
     1e2:      	leaq	-0xe70(%rbp), %rdi
     1e9:      	movl	$0x200, %edx            # imm = 0x200
     1ee:      	movq	%r15, %rsi
     1f1:      	callq	0x1f6 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1f6>
     1f6:      	leaq	-0x1870(%rbp), %rdi
     1fd:      	movl	$0x600, %edx            # imm = 0x600
     202:      	leaq	-0x1270(%rbp), %r15
     209:      	movq	%r15, %rsi
     20c:      	callq	0x211 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x211>
     211:      	leaq	-0x1cb0(%rbp), %rdi
     218:      	movq	$0x0, -0x30(%rbp)
     220:      	movl	$0x440, %edx            # imm = 0x440
     225:      	xorl	%esi, %esi
     227:      	callq	0x22c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x22c>
     22c:      	leaq	-0xc70(%rbp), %rbx
     233:      	leaq	-0xa70(%rbp), %r13
     23a:      	movq	%r12, -0x70(%rbp)
     23e:      	nop
     240:      	movq	%r15, -0x50(%rbp)
     244:      	movq	$0x3, -0x48(%rbp)
     24c:      	xorl	%r15d, %r15d
     24f:      	movq	%r14, %rdi
     252:      	movq	%r12, %rsi
     255:      	xorl	%edx, %edx
     257:      	movq	-0x30(%rbp), %rcx
     25b:      	callq	0x260 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x260>
     260:      	movl	$0x200, %edx            # imm = 0x200
     265:      	leaq	-0x470(%rbp), %r15
     26c:      	movq	%r15, %rdi
     26f:      	leaq	-0x270(%rbp), %r14
     276:      	movq	%r14, %rsi
     279:      	callq	0x27e <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x27e>
     27e:      	movl	$0x200, %edx            # imm = 0x200
     283:      	movq	%rbx, %rdi
     286:      	movq	%r15, %rsi
     289:      	callq	0x28e <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x28e>
     28e:      	movl	$0x200, %edx            # imm = 0x200
     293:      	movq	%r13, %rdi
     296:      	movq	%rbx, %rsi
     299:      	callq	0x29e <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x29e>
     29e:      	movl	$0x200, %edx            # imm = 0x200
     2a3:      	leaq	-0x1270(%rbp), %rdi
     2aa:      	movq	%r13, %rsi
     2ad:      	callq	0x2b2 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x2b2>
     2b2:      	movl	$0x1, %r15d
     2b8:      	movl	$0x1, %edx
     2bd:      	movq	%r14, %rdi
     2c0:      	movq	%r12, %rsi
     2c3:      	movq	-0x30(%rbp), %rcx
     2c7:      	callq	0x2cc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x2cc>
     2cc:      	movl	$0x200, %edx            # imm = 0x200
     2d1:      	leaq	-0x470(%rbp), %r15
     2d8:      	movq	%r15, %rdi
     2db:      	movq	%r14, %rsi
     2de:      	callq	0x2e3 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x2e3>
     2e3:      	movl	$0x200, %edx            # imm = 0x200
     2e8:      	movq	%rbx, %rdi
     2eb:      	movq	%r15, %rsi
     2ee:      	callq	0x2f3 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x2f3>
     2f3:      	movl	$0x200, %edx            # imm = 0x200
     2f8:      	movq	%r13, %rdi
     2fb:      	movq	%rbx, %rsi
     2fe:      	callq	0x303 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x303>
     303:      	movl	$0x200, %edx            # imm = 0x200
     308:      	leaq	-0x1070(%rbp), %rdi
     30f:      	movq	%r13, %rsi
     312:      	callq	0x317 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x317>
     317:      	movl	$0x2, %r15d
     31d:      	movl	$0x2, %edx
     322:      	movq	%r14, %rdi
     325:      	movq	%r12, %rsi
     328:      	movq	-0x30(%rbp), %rcx
     32c:      	callq	0x331 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x331>
     331:      	movq	-0x30(%rbp), %r14
     335:      	movl	$0x200, %edx            # imm = 0x200
     33a:      	leaq	-0x470(%rbp), %r15
     341:      	movq	%r15, %rdi
     344:      	leaq	-0x270(%rbp), %r12
     34b:      	movq	%r12, %rsi
     34e:      	callq	0x353 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x353>
     353:      	movl	$0x200, %edx            # imm = 0x200
     358:      	movq	%rbx, %rdi
     35b:      	movq	%r15, %rsi
     35e:      	callq	0x363 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x363>
     363:      	movl	$0x200, %edx            # imm = 0x200
     368:      	movq	%r13, %rdi
     36b:      	movq	%rbx, %rsi
     36e:      	callq	0x373 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x373>
     373:      	movl	$0x200, %edx            # imm = 0x200
     378:      	leaq	-0xe70(%rbp), %rdi
     37f:      	movq	%r13, %rsi
     382:      	callq	0x387 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x387>
     387:      	movl	$0x600, %edx            # imm = 0x600
     38c:      	movq	%r13, %rdi
     38f:      	leaq	-0x1270(%rbp), %r15
     396:      	movq	%r15, %rsi
     399:      	callq	0x39e <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x39e>
     39e:      	movq	%r15, %rdi
     3a1:      	movq	%r13, %rsi
     3a4:      	leaq	-0x1870(%rbp), %rdx
     3ab:      	callq	0x3b0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3b0>
     3b0:      	movq	%r12, %rdi
     3b3:      	movq	%r15, %rsi
     3b6:      	callq	0x3bb <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3bb>
     3bb:      	leal	0x3(%r14), %eax
     3bf:      	movzbl	%al, %edx
     3c2:      	movq	%r15, %rdi
     3c5:      	movq	-0x38(%rbp), %rsi
     3c9:      	callq	0x3ce <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3ce>
     3ce:      	leaq	-0x470(%rbp), %rdi
     3d5:      	movq	%r12, %rsi
     3d8:      	movq	%r15, %rdx
     3db:      	callq	0x3e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3e0>
     3e0:      	leaq	0x1(%r14), %r15
     3e4:      	xorl	%eax, %eax
     3e6:      	leaq	-0x470(%rbp), %rsi
     3ed:      	nopl	(%rax)
     3f0:      	movswl	-0x470(%rbp,%rax), %ecx
     3f8:      	imull	$0x4ebf, %ecx, %edx     # imm = 0x4EBF
     3fe:      	addl	$0x2000000, %edx        # imm = 0x2000000
     404:      	sarl	$0x1a, %edx
     407:      	imull	$0xfffff2ff, %edx, %edx # imm = 0xFFFFF2FF
     40d:      	addl	%ecx, %edx
     40f:      	movswl	%dx, %ecx
     412:      	movl	%ecx, %edx
     414:      	shrl	$0xf, %edx
     417:      	andl	$0xd01, %edx            # imm = 0xD01
     41d:      	addw	%dx, %cx
     420:      	jo	0xd51 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd51>
     426:      	movswl	%cx, %ecx
     429:      	shll	$0xa, %ecx
     42c:      	cmpl	$0xfffff97f, %ecx       # imm = 0xFFFFF97F
     432:      	ja	0xd5f <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd5f>
     438:      	addl	$0x680, %ecx            # imm = 0x680
     43e:      	imulq	$0x275f6f, %rcx, %rcx   # imm = 0x275F6F
     445:      	shrq	$0x21, %rcx
     449:      	andl	$0x3ff, %ecx            # imm = 0x3FF
     44f:      	movw	%cx, -0x470(%rbp,%rax)
     457:      	addq	$0x2, %rax
     45b:      	cmpq	$0x200, %rax            # imm = 0x200
     461:      	jne	0x3f0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3f0>
     463:      	movl	$0x200, %edx            # imm = 0x200
     468:      	movq	%r12, %rdi
     46b:      	callq	0x470 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x470>
     470:      	leaq	(%r14,%r14,4), %rax
     474:      	shlq	$0x6, %rax
     478:      	leaq	(%rax,%rbp), %rsi
     47c:      	addq	$-0x1cb0, %rsi          # imm = 0xE350
     483:      	movl	$0x140, %edx            # imm = 0x140
     488:      	movq	%r12, %r14
     48b:      	movq	%r12, %rdi
     48e:      	callq	0x493 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x493>
     493:      	xorl	%eax, %eax
     495:      	movq	-0x70(%rbp), %r12
     499:      	leaq	-0xa70(%rbp), %r13
     4a0:      	movw	$0x0, -0x270(%rbp,%rax)
     4aa:      	movw	$0x0, -0x26e(%rbp,%rax)
     4b4:      	movw	$0x0, -0x26c(%rbp,%rax)
     4be:      	movw	$0x0, -0x26a(%rbp,%rax)
     4c8:      	movw	$0x0, -0x268(%rbp,%rax)
     4d2:      	movw	$0x0, -0x266(%rbp,%rax)
     4dc:      	movw	$0x0, -0x264(%rbp,%rax)
     4e6:      	movw	$0x0, -0x262(%rbp,%rax)
     4f0:      	addq	$0x10, %rax
     4f4:      	cmpq	$0x200, %rax            # imm = 0x200
     4fa:      	jne	0x4a0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4a0>
     4fc:      	xorl	%eax, %eax
     4fe:      	nop
     500:      	movw	$0x0, -0x1270(%rbp,%rax)
     50a:      	movw	$0x0, -0x126e(%rbp,%rax)
     514:      	movw	$0x0, -0x126c(%rbp,%rax)
     51e:      	movw	$0x0, -0x126a(%rbp,%rax)
     528:      	movw	$0x0, -0x1268(%rbp,%rax)
     532:      	movw	$0x0, -0x1266(%rbp,%rax)
     53c:      	movw	$0x0, -0x1264(%rbp,%rax)
     546:      	movw	$0x0, -0x1262(%rbp,%rax)
     550:      	addq	$0x10, %rax
     554:      	cmpq	$0x200, %rax            # imm = 0x200
     55a:      	jne	0x500 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x500>
     55c:      	xorl	%eax, %eax
     55e:      	nop
     560:      	movw	$0x0, -0xa70(%rbp,%rax)
     56a:      	movw	$0x0, -0xa6e(%rbp,%rax)
     574:      	movw	$0x0, -0xa6c(%rbp,%rax)
     57e:      	movw	$0x0, -0xa6a(%rbp,%rax)
     588:      	movw	$0x0, -0xa68(%rbp,%rax)
     592:      	movw	$0x0, -0xa66(%rbp,%rax)
     59c:      	movw	$0x0, -0xa64(%rbp,%rax)
     5a6:      	movw	$0x0, -0xa62(%rbp,%rax)
     5b0:      	addq	$0x10, %rax
     5b4:      	cmpq	$0x200, %rax            # imm = 0x200
     5ba:      	jne	0x560 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x560>
     5bc:      	xorl	%eax, %eax
     5be:      	nop
     5c0:      	movw	$0x0, -0x870(%rbp,%rax)
     5ca:      	movw	$0x0, -0x86e(%rbp,%rax)
     5d4:      	movw	$0x0, -0x86c(%rbp,%rax)
     5de:      	movw	$0x0, -0x86a(%rbp,%rax)
     5e8:      	movw	$0x0, -0x868(%rbp,%rax)
     5f2:      	movw	$0x0, -0x866(%rbp,%rax)
     5fc:      	movw	$0x0, -0x864(%rbp,%rax)
     606:      	movw	$0x0, -0x862(%rbp,%rax)
     610:      	addq	$0x10, %rax
     614:      	cmpq	$0x200, %rax            # imm = 0x200
     61a:      	jne	0x5c0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5c0>
     61c:      	xorl	%eax, %eax
     61e:      	nop
     620:      	movw	$0x0, -0x670(%rbp,%rax)
     62a:      	movw	$0x0, -0x66e(%rbp,%rax)
     634:      	movw	$0x0, -0x66c(%rbp,%rax)
     63e:      	movw	$0x0, -0x66a(%rbp,%rax)
     648:      	movw	$0x0, -0x668(%rbp,%rax)
     652:      	movw	$0x0, -0x666(%rbp,%rax)
     65c:      	movw	$0x0, -0x664(%rbp,%rax)
     666:      	movw	$0x0, -0x662(%rbp,%rax)
     670:      	addq	$0x10, %rax
     674:      	cmpq	$0x200, %rax            # imm = 0x200
     67a:      	jne	0x620 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x620>
     67c:      	movq	%r15, -0x30(%rbp)
     680:      	cmpq	$0x3, %r15
     684:      	leaq	-0x1270(%rbp), %r15
     68b:      	jne	0x240 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x240>
     691:      	movq	%r15, -0x50(%rbp)
     695:      	movq	$0x3, -0x48(%rbp)
     69d:      	xorl	%r14d, %r14d
     6a0:      	leaq	-0x270(%rbp), %rdi
     6a7:      	movl	$0x180, %edx            # imm = 0x180
     6ac:      	movq	-0x68(%rbp), %r12
     6b0:      	movq	%r12, %rsi
     6b3:      	callq	0x6b8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x6b8>
     6b8:      	leaq	-0x470(%rbp), %r14
     6bf:      	leaq	-0x270(%rbp), %rbx
     6c6:      	movl	$0x200, %edx            # imm = 0x200
     6cb:      	movq	%r14, %rdi
     6ce:      	movq	%rbx, %rsi
     6d1:      	callq	0x6d6 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x6d6>
     6d6:      	leaq	-0xc70(%rbp), %r15
     6dd:      	movl	$0x200, %edx            # imm = 0x200
     6e2:      	movq	%r15, %rdi
     6e5:      	movq	%r14, %rsi
     6e8:      	callq	0x6ed <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x6ed>
     6ed:      	leaq	-0xa70(%rbp), %r14
     6f4:      	movl	$0x200, %edx            # imm = 0x200
     6f9:      	movq	%r14, %rdi
     6fc:      	movq	%r15, %rsi
     6ff:      	callq	0x704 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x704>
     704:      	leaq	-0x1270(%rbp), %rdi
     70b:      	movl	$0x200, %edx            # imm = 0x200
     710:      	movq	%r14, %rsi
     713:      	callq	0x718 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x718>
     718:      	leaq	0x180(%r12), %rsi
     720:      	movl	$0x1, %r14d
     726:      	movl	$0x180, %edx            # imm = 0x180
     72b:      	movq	%rbx, %rdi
     72e:      	callq	0x733 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x733>
     733:      	leaq	-0x470(%rbp), %r14
     73a:      	movl	$0x200, %edx            # imm = 0x200
     73f:      	movq	%r14, %rdi
     742:      	movq	%rbx, %rsi
     745:      	callq	0x74a <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x74a>
     74a:      	movl	$0x200, %edx            # imm = 0x200
     74f:      	movq	%r15, %rdi
     752:      	movq	%r14, %rsi
     755:      	callq	0x75a <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x75a>
     75a:      	leaq	-0xa70(%rbp), %r14
     761:      	movl	$0x200, %edx            # imm = 0x200
     766:      	movq	%r14, %rdi
     769:      	movq	%r15, %rsi
     76c:      	callq	0x771 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x771>
     771:      	leaq	-0x1070(%rbp), %rdi
     778:      	movl	$0x200, %edx            # imm = 0x200
     77d:      	movq	%r14, %rsi
     780:      	callq	0x785 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x785>
     785:      	addq	$0x300, %r12            # imm = 0x300
     78c:      	movl	$0x2, %r14d
     792:      	movl	$0x180, %edx            # imm = 0x180
     797:      	movq	%rbx, %rdi
     79a:      	movq	%r12, %rsi
     79d:      	callq	0x7a2 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7a2>
     7a2:      	leaq	-0x470(%rbp), %rbx
     7a9:      	leaq	-0x270(%rbp), %rsi
     7b0:      	movl	$0x200, %edx            # imm = 0x200
     7b5:      	movq	%rbx, %rdi
     7b8:      	callq	0x7bd <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7bd>
     7bd:      	leaq	-0xc70(%rbp), %r14
     7c4:      	movl	$0x200, %edx            # imm = 0x200
     7c9:      	movq	%r14, %rdi
     7cc:      	movq	%rbx, %rsi
     7cf:      	callq	0x7d4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7d4>
     7d4:      	leaq	-0xa70(%rbp), %rbx
     7db:      	movl	$0x200, %edx            # imm = 0x200
     7e0:      	movq	%rbx, %rdi
     7e3:      	movq	%r14, %rsi
     7e6:      	callq	0x7eb <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7eb>
     7eb:      	leaq	-0xe70(%rbp), %rdi
     7f2:      	movl	$0x200, %edx            # imm = 0x200
     7f7:      	movq	%rbx, %rsi
     7fa:      	callq	0x7ff <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7ff>
     7ff:      	leaq	-0x1270(%rbp), %rsi
     806:      	movl	$0x600, %edx            # imm = 0x600
     80b:      	movq	%rbx, %rdi
     80e:      	callq	0x813 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x813>
     813:      	leaq	-0x1270(%rbp), %rdi
     81a:      	leaq	-0x1870(%rbp), %rdx
     821:      	movq	%rbx, %rsi
     824:      	callq	0x829 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x829>
     829:      	leaq	-0x270(%rbp), %rdi
     830:      	leaq	-0x1270(%rbp), %rsi
     837:      	callq	0x83c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x83c>
     83c:      	leaq	-0x470(%rbp), %rdi
     843:      	movq	-0x38(%rbp), %rsi
     847:      	movl	$0x6, %edx
     84c:      	callq	0x851 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x851>
     851:      	leaq	-0xc70(%rbp), %rdi
     858:      	leaq	-0x270(%rbp), %rsi
     85f:      	leaq	-0x470(%rbp), %rdx
     866:      	callq	0x86b <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x86b>
     86b:      	leaq	-0x1270(%rbp), %rdi
     872:      	movl	$0x20, %edx
     877:      	movq	-0x60(%rbp), %rsi
     87b:      	callq	0x880 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x880>
     880:      	movl	$0x2, %ecx
     885:      	movl	$0xd01, %esi            # imm = 0xD01
     88a:      	nopw	(%rax,%rax)
     890:      	movswl	-0x1272(%rbp,%rcx), %eax
     898:      	mull	%esi
     89a:      	jo	0xd6d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd6d>
     8a0:      	incl	%eax
     8a2:      	shrl	%eax
     8a4:      	movw	%ax, -0x1272(%rbp,%rcx)
     8ac:      	movswl	-0x1270(%rbp,%rcx), %eax
     8b4:      	mull	%esi
     8b6:      	jo	0xd6d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd6d>
     8bc:      	incl	%eax
     8be:      	shrl	%eax
     8c0:      	movw	%ax, -0x1270(%rbp,%rcx)
     8c8:      	addq	$0x4, %rcx
     8cc:      	cmpq	$0x202, %rcx            # imm = 0x202
     8d3:      	jne	0x890 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x890>
     8d5:      	leaq	-0x270(%rbp), %rbx
     8dc:      	leaq	-0x1270(%rbp), %rsi
     8e3:      	movl	$0x200, %edx            # imm = 0x200
     8e8:      	movq	%rbx, %rdi
     8eb:      	callq	0x8f0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x8f0>
     8f0:      	leaq	-0x1270(%rbp), %rdi
     8f7:      	leaq	-0xc70(%rbp), %rsi
     8fe:      	movq	%rbx, %rdx
     901:      	callq	0x906 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x906>
     906:      	xorl	%eax, %eax
     908:      	nopl	(%rax,%rax)
     910:      	movswl	-0x1270(%rbp,%rax), %ecx
     918:      	imull	$0x4ebf, %ecx, %edx     # imm = 0x4EBF
     91e:      	addl	$0x2000000, %edx        # imm = 0x2000000
     924:      	sarl	$0x1a, %edx
     927:      	imull	$0xfffff2ff, %edx, %edx # imm = 0xFFFFF2FF
     92d:      	addl	%ecx, %edx
     92f:      	movswl	%dx, %ecx
     932:      	movl	%ecx, %edx
     934:      	shrl	$0xf, %edx
     937:      	andl	$0xd01, %edx            # imm = 0xD01
     93d:      	addw	%dx, %cx
     940:      	jo	0xd7b <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd7b>
     946:      	movswl	%cx, %ecx
     949:      	shll	$0x4, %ecx
     94c:      	cmpl	$0xfffff97f, %ecx       # imm = 0xFFFFF97F
     952:      	ja	0xd89 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd89>
     958:      	addl	$0x680, %ecx            # imm = 0x680
     95e:      	imulq	$0x275f6f, %rcx, %rcx   # imm = 0x275F6F
     965:      	shrq	$0x21, %rcx
     969:      	andl	$0xf, %ecx
     96c:      	movw	%cx, -0x1270(%rbp,%rax)
     974:      	addq	$0x2, %rax
     978:      	cmpq	$0x200, %rax            # imm = 0x200
     97e:      	jne	0x910 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x910>
     980:      	leaq	-0xc70(%rbp), %rbx
     987:      	leaq	-0x1270(%rbp), %rsi
     98e:      	movl	$0x200, %edx            # imm = 0x200
     993:      	movq	%rbx, %rdi
     996:      	callq	0x99b <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x99b>
     99b:      	leaq	-0x18f0(%rbp), %rsi
     9a2:      	movl	$0x80, %edx
     9a7:      	movq	%rbx, %rdi
     9aa:      	callq	0x9af <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9af>
     9af:      	xorl	%eax, %eax
     9b1:      	movq	-0x58(%rbp), %rbx
     9b5:      	nopw	%cs:(%rax,%rax)
     9c0:      	movw	$0x0, -0xc70(%rbp,%rax)
     9ca:      	movw	$0x0, -0xc6e(%rbp,%rax)
     9d4:      	movw	$0x0, -0xc6c(%rbp,%rax)
     9de:      	movw	$0x0, -0xc6a(%rbp,%rax)
     9e8:      	movw	$0x0, -0xc68(%rbp,%rax)
     9f2:      	movw	$0x0, -0xc66(%rbp,%rax)
     9fc:      	movw	$0x0, -0xc64(%rbp,%rax)
     a06:      	movw	$0x0, -0xc62(%rbp,%rax)
     a10:      	addq	$0x10, %rax
     a14:      	cmpq	$0x200, %rax            # imm = 0x200
     a1a:      	jne	0x9c0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9c0>
     a1c:      	xorl	%eax, %eax
     a1e:      	nop
     a20:      	movw	$0x0, -0x270(%rbp,%rax)
     a2a:      	movw	$0x0, -0x26e(%rbp,%rax)
     a34:      	movw	$0x0, -0x26c(%rbp,%rax)
     a3e:      	movw	$0x0, -0x26a(%rbp,%rax)
     a48:      	movw	$0x0, -0x268(%rbp,%rax)
     a52:      	movw	$0x0, -0x266(%rbp,%rax)
     a5c:      	movw	$0x0, -0x264(%rbp,%rax)
     a66:      	movw	$0x0, -0x262(%rbp,%rax)
     a70:      	addq	$0x10, %rax
     a74:      	cmpq	$0x200, %rax            # imm = 0x200
     a7a:      	jne	0xa20 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa20>
     a7c:      	xorl	%eax, %eax
     a7e:      	nop
     a80:      	movw	$0x0, -0x470(%rbp,%rax)
     a8a:      	movw	$0x0, -0x46e(%rbp,%rax)
     a94:      	movw	$0x0, -0x46c(%rbp,%rax)
     a9e:      	movw	$0x0, -0x46a(%rbp,%rax)
     aa8:      	movw	$0x0, -0x468(%rbp,%rax)
     ab2:      	movw	$0x0, -0x466(%rbp,%rax)
     abc:      	movw	$0x0, -0x464(%rbp,%rax)
     ac6:      	movw	$0x0, -0x462(%rbp,%rax)
     ad0:      	addq	$0x10, %rax
     ad4:      	cmpq	$0x200, %rax            # imm = 0x200
     ada:      	jne	0xa80 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa80>
     adc:      	leaq	-0x1cb0(%rbp), %rsi
     ae3:      	movl	$0x440, %edx            # imm = 0x440
     ae8:      	movq	%rbx, %rdi
     aeb:      	callq	0xaf0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xaf0>
     af0:      	xorl	%eax, %eax
     af2:      	nopw	%cs:(%rax,%rax)
     b00:      	movw	$0x0, -0xa70(%rbp,%rax)
     b0a:      	movw	$0x0, -0xa6e(%rbp,%rax)
     b14:      	movw	$0x0, -0xa6c(%rbp,%rax)
     b1e:      	movw	$0x0, -0xa6a(%rbp,%rax)
     b28:      	movw	$0x0, -0xa68(%rbp,%rax)
     b32:      	movw	$0x0, -0xa66(%rbp,%rax)
     b3c:      	movw	$0x0, -0xa64(%rbp,%rax)
     b46:      	movw	$0x0, -0xa62(%rbp,%rax)
     b50:      	addq	$0x10, %rax
     b54:      	cmpq	$0x200, %rax            # imm = 0x200
     b5a:      	jne	0xb00 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb00>
     b5c:      	xorl	%eax, %eax
     b5e:      	nop
     b60:      	movw	$0x0, -0x870(%rbp,%rax)
     b6a:      	movw	$0x0, -0x86e(%rbp,%rax)
     b74:      	movw	$0x0, -0x86c(%rbp,%rax)
     b7e:      	movw	$0x0, -0x86a(%rbp,%rax)
     b88:      	movw	$0x0, -0x868(%rbp,%rax)
     b92:      	movw	$0x0, -0x866(%rbp,%rax)
     b9c:      	movw	$0x0, -0x864(%rbp,%rax)
     ba6:      	movw	$0x0, -0x862(%rbp,%rax)
     bb0:      	addq	$0x10, %rax
     bb4:      	cmpq	$0x200, %rax            # imm = 0x200
     bba:      	jne	0xb60 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb60>
     bbc:      	xorl	%eax, %eax
     bbe:      	nop
     bc0:      	movw	$0x0, -0x670(%rbp,%rax)
     bca:      	movw	$0x0, -0x66e(%rbp,%rax)
     bd4:      	movw	$0x0, -0x66c(%rbp,%rax)
     bde:      	movw	$0x0, -0x66a(%rbp,%rax)
     be8:      	movw	$0x0, -0x668(%rbp,%rax)
     bf2:      	movw	$0x0, -0x666(%rbp,%rax)
     bfc:      	movw	$0x0, -0x664(%rbp,%rax)
     c06:      	movw	$0x0, -0x662(%rbp,%rax)
     c10:      	addq	$0x10, %rax
     c14:      	cmpq	$0x200, %rax            # imm = 0x200
     c1a:      	jne	0xbc0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbc0>
     c1c:      	xorl	%eax, %eax
     c1e:      	nop
     c20:      	movw	$0x0, -0x1870(%rbp,%rax)
     c2a:      	movw	$0x0, -0x186e(%rbp,%rax)
     c34:      	movw	$0x0, -0x186c(%rbp,%rax)
     c3e:      	movw	$0x0, -0x186a(%rbp,%rax)
     c48:      	movw	$0x0, -0x1868(%rbp,%rax)
     c52:      	movw	$0x0, -0x1866(%rbp,%rax)
     c5c:      	movw	$0x0, -0x1864(%rbp,%rax)
     c66:      	movw	$0x0, -0x1862(%rbp,%rax)
     c70:      	addq	$0x10, %rax
     c74:      	cmpq	$0x200, %rax            # imm = 0x200
     c7a:      	jne	0xc20 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc20>
     c7c:      	xorl	%eax, %eax
     c7e:      	nop
     c80:      	movw	$0x0, -0x1670(%rbp,%rax)
     c8a:      	movw	$0x0, -0x166e(%rbp,%rax)
     c94:      	movw	$0x0, -0x166c(%rbp,%rax)
     c9e:      	movw	$0x0, -0x166a(%rbp,%rax)
     ca8:      	movw	$0x0, -0x1668(%rbp,%rax)
     cb2:      	movw	$0x0, -0x1666(%rbp,%rax)
     cbc:      	movw	$0x0, -0x1664(%rbp,%rax)
     cc6:      	movw	$0x0, -0x1662(%rbp,%rax)
     cd0:      	addq	$0x10, %rax
     cd4:      	cmpq	$0x200, %rax            # imm = 0x200
     cda:      	jne	0xc80 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc80>
     cdc:      	xorl	%eax, %eax
     cde:      	nop
     ce0:      	movw	$0x0, -0x1470(%rbp,%rax)
     cea:      	movw	$0x0, -0x146e(%rbp,%rax)
     cf4:      	movw	$0x0, -0x146c(%rbp,%rax)
     cfe:      	movw	$0x0, -0x146a(%rbp,%rax)
     d08:      	movw	$0x0, -0x1468(%rbp,%rax)
     d12:      	movw	$0x0, -0x1466(%rbp,%rax)
     d1c:      	movw	$0x0, -0x1464(%rbp,%rax)
     d26:      	movw	$0x0, -0x1462(%rbp,%rax)
     d30:      	addq	$0x10, %rax
     d34:      	cmpq	$0x200, %rax            # imm = 0x200
     d3a:      	jne	0xce0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xce0>
     d3c:      	movq	%rbx, %rax
     d3f:      	addq	$0x1c88, %rsp           # imm = 0x1C88
     d46:      	popq	%rbx
     d47:      	popq	%r12
     d49:      	popq	%r13
     d4b:      	popq	%r14
     d4d:      	popq	%r15
     d4f:      	popq	%rbp
     d50:      	retq
     d51:      	leaq	(%rip), %rdi            # 0xd58 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd58>
     d58:      	callq	0xd5d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd5d>
     d5d:      	jmp	0xd95 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd95>
     d5f:      	leaq	(%rip), %rdi            # 0xd66 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd66>
     d66:      	callq	0xd6b <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd6b>
     d6b:      	jmp	0xd95 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd95>
     d6d:      	leaq	(%rip), %rdi            # 0xd74 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd74>
     d74:      	callq	0xd79 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd79>
     d79:      	jmp	0xd95 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd95>
     d7b:      	leaq	(%rip), %rdi            # 0xd82 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd82>
     d82:      	callq	0xd87 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd87>
     d87:      	jmp	0xd95 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd95>
     d89:      	leaq	(%rip), %rdi            # 0xd90 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd90>
     d90:      	callq	0xd95 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd95>
     d95:      	ud2
     d97:      	xorl	%ecx, %ecx
     d99:      	nopl	(%rax)
     da0:      	movw	$0x0, -0xc70(%rbp,%rcx)
     daa:      	movw	$0x0, -0xc6e(%rbp,%rcx)
     db4:      	movw	$0x0, -0xc6c(%rbp,%rcx)
     dbe:      	movw	$0x0, -0xc6a(%rbp,%rcx)
     dc8:      	movw	$0x0, -0xc68(%rbp,%rcx)
     dd2:      	movw	$0x0, -0xc66(%rbp,%rcx)
     ddc:      	movw	$0x0, -0xc64(%rbp,%rcx)
     de6:      	movw	$0x0, -0xc62(%rbp,%rcx)
     df0:      	addq	$0x10, %rcx
     df4:      	cmpq	$0x200, %rcx            # imm = 0x200
     dfb:      	jne	0xda0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xda0>
     dfd:      	jmp	0xffd <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xffd>
     e02:      	jmp	0xffd <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xffd>
     e07:      	jmp	0x10cd <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x10cd>
     e0c:      	jmp	0x112d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x112d>
     e11:      	xorl	%ecx, %ecx
     e13:      	nopw	%cs:(%rax,%rax)
     e20:      	movw	$0x0, -0x270(%rbp,%rcx)
     e2a:      	movw	$0x0, -0x26e(%rbp,%rcx)
     e34:      	movw	$0x0, -0x26c(%rbp,%rcx)
     e3e:      	movw	$0x0, -0x26a(%rbp,%rcx)
     e48:      	movw	$0x0, -0x268(%rbp,%rcx)
     e52:      	movw	$0x0, -0x266(%rbp,%rcx)
     e5c:      	movw	$0x0, -0x264(%rbp,%rcx)
     e66:      	movw	$0x0, -0x262(%rbp,%rcx)
     e70:      	addq	$0x10, %rcx
     e74:      	cmpq	$0x200, %rcx            # imm = 0x200
     e7b:      	jne	0xe20 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xe20>
     e7d:      	jmp	0xe7f <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xe7f>
     e7f:      	movq	%rax, %rdi
     e82:      	jmp	0x119c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x119c>
     e87:      	movq	%rax, %rbx
     e8a:      	movq	%r14, -0x40(%rbp)
     e8e:      	jmp	0x12d0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12d0>
     e93:      	movq	%rax, %rbx
     e96:      	movq	%r14, -0xc60(%rbp)
     e9d:      	leaq	-0xc70(%rbp), %rdi
     ea4:      	callq	0xea9 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xea9>
     ea9:      	movq	%rbx, %rdi
     eac:      	callq	0xeb1 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xeb1>
     eb1:      	xorl	%ecx, %ecx
     eb3:      	nopw	%cs:(%rax,%rax)
     ec0:      	movw	$0x0, -0x270(%rbp,%rcx)
     eca:      	movw	$0x0, -0x26e(%rbp,%rcx)
     ed4:      	movw	$0x0, -0x26c(%rbp,%rcx)
     ede:      	movw	$0x0, -0x26a(%rbp,%rcx)
     ee8:      	movw	$0x0, -0x268(%rbp,%rcx)
     ef2:      	movw	$0x0, -0x266(%rbp,%rcx)
     efc:      	movw	$0x0, -0x264(%rbp,%rcx)
     f06:      	movw	$0x0, -0x262(%rbp,%rcx)
     f10:      	addq	$0x10, %rcx
     f14:      	cmpq	$0x200, %rcx            # imm = 0x200
     f1b:      	jne	0xec0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xec0>
     f1d:      	jmp	0xf92 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xf92>
     f1f:      	xorl	%ecx, %ecx
     f21:      	nopw	%cs:(%rax,%rax)
     f30:      	movw	$0x0, -0x270(%rbp,%rcx)
     f3a:      	movw	$0x0, -0x26e(%rbp,%rcx)
     f44:      	movw	$0x0, -0x26c(%rbp,%rcx)
     f4e:      	movw	$0x0, -0x26a(%rbp,%rcx)
     f58:      	movw	$0x0, -0x268(%rbp,%rcx)
     f62:      	movw	$0x0, -0x266(%rbp,%rcx)
     f6c:      	movw	$0x0, -0x264(%rbp,%rcx)
     f76:      	movw	$0x0, -0x262(%rbp,%rcx)
     f80:      	addq	$0x10, %rcx
     f84:      	cmpq	$0x200, %rcx            # imm = 0x200
     f8b:      	jne	0xf30 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xf30>
     f8d:      	jmp	0x12c1 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12c1>
     f92:      	movq	%rax, %rdi
     f95:      	jmp	0x134c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x134c>
     f9a:      	xorl	%ecx, %ecx
     f9c:      	nopl	(%rax)
     fa0:      	movw	$0x0, -0x1270(%rbp,%rcx)
     faa:      	movw	$0x0, -0x126e(%rbp,%rcx)
     fb4:      	movw	$0x0, -0x126c(%rbp,%rcx)
     fbe:      	movw	$0x0, -0x126a(%rbp,%rcx)
     fc8:      	movw	$0x0, -0x1268(%rbp,%rcx)
     fd2:      	movw	$0x0, -0x1266(%rbp,%rcx)
     fdc:      	movw	$0x0, -0x1264(%rbp,%rcx)
     fe6:      	movw	$0x0, -0x1262(%rbp,%rcx)
     ff0:      	addq	$0x10, %rcx
     ff4:      	cmpq	$0x200, %rcx            # imm = 0x200
     ffb:      	jne	0xfa0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xfa0>
     ffd:      	xorl	%ecx, %ecx
     fff:      	nop
    1000:      	movw	$0x0, -0x270(%rbp,%rcx)
    100a:      	movw	$0x0, -0x26e(%rbp,%rcx)
    1014:      	movw	$0x0, -0x26c(%rbp,%rcx)
    101e:      	movw	$0x0, -0x26a(%rbp,%rcx)
    1028:      	movw	$0x0, -0x268(%rbp,%rcx)
    1032:      	movw	$0x0, -0x266(%rbp,%rcx)
    103c:      	movw	$0x0, -0x264(%rbp,%rcx)
    1046:      	movw	$0x0, -0x262(%rbp,%rcx)
    1050:      	addq	$0x10, %rcx
    1054:      	cmpq	$0x200, %rcx            # imm = 0x200
    105b:      	jne	0x1000 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1000>
    105d:      	jmp	0x112d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x112d>
    1062:      	xorl	%ecx, %ecx
    1064:      	nopw	%cs:(%rax,%rax)
    1070:      	movw	$0x0, -0x1270(%rbp,%rcx)
    107a:      	movw	$0x0, -0x126e(%rbp,%rcx)
    1084:      	movw	$0x0, -0x126c(%rbp,%rcx)
    108e:      	movw	$0x0, -0x126a(%rbp,%rcx)
    1098:      	movw	$0x0, -0x1268(%rbp,%rcx)
    10a2:      	movw	$0x0, -0x1266(%rbp,%rcx)
    10ac:      	movw	$0x0, -0x1264(%rbp,%rcx)
    10b6:      	movw	$0x0, -0x1262(%rbp,%rcx)
    10c0:      	addq	$0x10, %rcx
    10c4:      	cmpq	$0x200, %rcx            # imm = 0x200
    10cb:      	jne	0x1070 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1070>
    10cd:      	xorl	%ecx, %ecx
    10cf:      	nop
    10d0:      	movw	$0x0, -0xc70(%rbp,%rcx)
    10da:      	movw	$0x0, -0xc6e(%rbp,%rcx)
    10e4:      	movw	$0x0, -0xc6c(%rbp,%rcx)
    10ee:      	movw	$0x0, -0xc6a(%rbp,%rcx)
    10f8:      	movw	$0x0, -0xc68(%rbp,%rcx)
    1102:      	movw	$0x0, -0xc66(%rbp,%rcx)
    110c:      	movw	$0x0, -0xc64(%rbp,%rcx)
    1116:      	movw	$0x0, -0xc62(%rbp,%rcx)
    1120:      	addq	$0x10, %rcx
    1124:      	cmpq	$0x200, %rcx            # imm = 0x200
    112b:      	jne	0x10d0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x10d0>
    112d:      	movq	%rax, %rdi
    1130:      	xorl	%eax, %eax
    1132:      	nopw	%cs:(%rax,%rax)
    1140:      	movw	$0x0, -0x470(%rbp,%rax)
    114a:      	movw	$0x0, -0x46e(%rbp,%rax)
    1154:      	movw	$0x0, -0x46c(%rbp,%rax)
    115e:      	movw	$0x0, -0x46a(%rbp,%rax)
    1168:      	movw	$0x0, -0x468(%rbp,%rax)
    1172:      	movw	$0x0, -0x466(%rbp,%rax)
    117c:      	movw	$0x0, -0x464(%rbp,%rax)
    1186:      	movw	$0x0, -0x462(%rbp,%rax)
    1190:      	addq	$0x10, %rax
    1194:      	cmpq	$0x200, %rax            # imm = 0x200
    119a:      	jne	0x1140 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1140>
    119c:      	xorl	%eax, %eax
    119e:      	nop
    11a0:      	movw	$0x0, -0xa70(%rbp,%rax)
    11aa:      	movw	$0x0, -0xa6e(%rbp,%rax)
    11b4:      	movw	$0x0, -0xa6c(%rbp,%rax)
    11be:      	movw	$0x0, -0xa6a(%rbp,%rax)
    11c8:      	movw	$0x0, -0xa68(%rbp,%rax)
    11d2:      	movw	$0x0, -0xa66(%rbp,%rax)
    11dc:      	movw	$0x0, -0xa64(%rbp,%rax)
    11e6:      	movw	$0x0, -0xa62(%rbp,%rax)
    11f0:      	addq	$0x10, %rax
    11f4:      	cmpq	$0x200, %rax            # imm = 0x200
    11fa:      	jne	0x11a0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x11a0>
    11fc:      	xorl	%eax, %eax
    11fe:      	nop
    1200:      	movw	$0x0, -0x870(%rbp,%rax)
    120a:      	movw	$0x0, -0x86e(%rbp,%rax)
    1214:      	movw	$0x0, -0x86c(%rbp,%rax)
    121e:      	movw	$0x0, -0x86a(%rbp,%rax)
    1228:      	movw	$0x0, -0x868(%rbp,%rax)
    1232:      	movw	$0x0, -0x866(%rbp,%rax)
    123c:      	movw	$0x0, -0x864(%rbp,%rax)
    1246:      	movw	$0x0, -0x862(%rbp,%rax)
    1250:      	addq	$0x10, %rax
    1254:      	cmpq	$0x200, %rax            # imm = 0x200
    125a:      	jne	0x1200 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1200>
    125c:      	xorl	%eax, %eax
    125e:      	nop
    1260:      	movw	$0x0, -0x670(%rbp,%rax)
    126a:      	movw	$0x0, -0x66e(%rbp,%rax)
    1274:      	movw	$0x0, -0x66c(%rbp,%rax)
    127e:      	movw	$0x0, -0x66a(%rbp,%rax)
    1288:      	movw	$0x0, -0x668(%rbp,%rax)
    1292:      	movw	$0x0, -0x666(%rbp,%rax)
    129c:      	movw	$0x0, -0x664(%rbp,%rax)
    12a6:      	movw	$0x0, -0x662(%rbp,%rax)
    12b0:      	addq	$0x10, %rax
    12b4:      	cmpq	$0x200, %rax            # imm = 0x200
    12ba:      	jne	0x1260 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1260>
    12bc:      	jmp	0x14cc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x14cc>
    12c1:      	movq	%rax, %rdi
    12c4:      	jmp	0x13ac <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x13ac>
    12c9:      	movq	%rax, %rbx
    12cc:      	movq	%r15, -0x40(%rbp)
    12d0:      	leaq	-0x50(%rbp), %rdi
    12d4:      	callq	0x12d9 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12d9>
    12d9:      	movq	%rbx, %rdi
    12dc:      	jmp	0x14cc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x14cc>
    12e1:      	movq	%rax, %rdi
    12e4:      	xorl	%eax, %eax
    12e6:      	nopw	%cs:(%rax,%rax)
    12f0:      	movw	$0x0, -0x470(%rbp,%rax)
    12fa:      	movw	$0x0, -0x46e(%rbp,%rax)
    1304:      	movw	$0x0, -0x46c(%rbp,%rax)
    130e:      	movw	$0x0, -0x46a(%rbp,%rax)
    1318:      	movw	$0x0, -0x468(%rbp,%rax)
    1322:      	movw	$0x0, -0x466(%rbp,%rax)
    132c:      	movw	$0x0, -0x464(%rbp,%rax)
    1336:      	movw	$0x0, -0x462(%rbp,%rax)
    1340:      	addq	$0x10, %rax
    1344:      	cmpq	$0x200, %rax            # imm = 0x200
    134a:      	jne	0x12f0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12f0>
    134c:      	xorl	%eax, %eax
    134e:      	nop
    1350:      	movw	$0x0, -0x1270(%rbp,%rax)
    135a:      	movw	$0x0, -0x126e(%rbp,%rax)
    1364:      	movw	$0x0, -0x126c(%rbp,%rax)
    136e:      	movw	$0x0, -0x126a(%rbp,%rax)
    1378:      	movw	$0x0, -0x1268(%rbp,%rax)
    1382:      	movw	$0x0, -0x1266(%rbp,%rax)
    138c:      	movw	$0x0, -0x1264(%rbp,%rax)
    1396:      	movw	$0x0, -0x1262(%rbp,%rax)
    13a0:      	addq	$0x10, %rax
    13a4:      	cmpq	$0x200, %rax            # imm = 0x200
    13aa:      	jne	0x1350 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1350>
    13ac:      	xorl	%eax, %eax
    13ae:      	nop
    13b0:      	movw	$0x0, -0xa70(%rbp,%rax)
    13ba:      	movw	$0x0, -0xa6e(%rbp,%rax)
    13c4:      	movw	$0x0, -0xa6c(%rbp,%rax)
    13ce:      	movw	$0x0, -0xa6a(%rbp,%rax)
    13d8:      	movw	$0x0, -0xa68(%rbp,%rax)
    13e2:      	movw	$0x0, -0xa66(%rbp,%rax)
    13ec:      	movw	$0x0, -0xa64(%rbp,%rax)
    13f6:      	movw	$0x0, -0xa62(%rbp,%rax)
    1400:      	addq	$0x10, %rax
    1404:      	cmpq	$0x200, %rax            # imm = 0x200
    140a:      	jne	0x13b0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x13b0>
    140c:      	xorl	%eax, %eax
    140e:      	nop
    1410:      	movw	$0x0, -0x870(%rbp,%rax)
    141a:      	movw	$0x0, -0x86e(%rbp,%rax)
    1424:      	movw	$0x0, -0x86c(%rbp,%rax)
    142e:      	movw	$0x0, -0x86a(%rbp,%rax)
    1438:      	movw	$0x0, -0x868(%rbp,%rax)
    1442:      	movw	$0x0, -0x866(%rbp,%rax)
    144c:      	movw	$0x0, -0x864(%rbp,%rax)
    1456:      	movw	$0x0, -0x862(%rbp,%rax)
    1460:      	addq	$0x10, %rax
    1464:      	cmpq	$0x200, %rax            # imm = 0x200
    146a:      	jne	0x1410 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1410>
    146c:      	xorl	%eax, %eax
    146e:      	nop
    1470:      	movw	$0x0, -0x670(%rbp,%rax)
    147a:      	movw	$0x0, -0x66e(%rbp,%rax)
    1484:      	movw	$0x0, -0x66c(%rbp,%rax)
    148e:      	movw	$0x0, -0x66a(%rbp,%rax)
    1498:      	movw	$0x0, -0x668(%rbp,%rax)
    14a2:      	movw	$0x0, -0x666(%rbp,%rax)
    14ac:      	movw	$0x0, -0x664(%rbp,%rax)
    14b6:      	movw	$0x0, -0x662(%rbp,%rax)
    14c0:      	addq	$0x10, %rax
    14c4:      	cmpq	$0x200, %rax            # imm = 0x200
    14ca:      	jne	0x1470 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1470>
    14cc:      	xorl	%eax, %eax
    14ce:      	nop
    14d0:      	movw	$0x0, -0x1870(%rbp,%rax)
    14da:      	movw	$0x0, -0x186e(%rbp,%rax)
    14e4:      	movw	$0x0, -0x186c(%rbp,%rax)
    14ee:      	movw	$0x0, -0x186a(%rbp,%rax)
    14f8:      	movw	$0x0, -0x1868(%rbp,%rax)
    1502:      	movw	$0x0, -0x1866(%rbp,%rax)
    150c:      	movw	$0x0, -0x1864(%rbp,%rax)
    1516:      	movw	$0x0, -0x1862(%rbp,%rax)
    1520:      	addq	$0x10, %rax
    1524:      	cmpq	$0x200, %rax            # imm = 0x200
    152a:      	jne	0x14d0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x14d0>
    152c:      	xorl	%eax, %eax
    152e:      	nop
    1530:      	movw	$0x0, -0x1670(%rbp,%rax)
    153a:      	movw	$0x0, -0x166e(%rbp,%rax)
    1544:      	movw	$0x0, -0x166c(%rbp,%rax)
    154e:      	movw	$0x0, -0x166a(%rbp,%rax)
    1558:      	movw	$0x0, -0x1668(%rbp,%rax)
    1562:      	movw	$0x0, -0x1666(%rbp,%rax)
    156c:      	movw	$0x0, -0x1664(%rbp,%rax)
    1576:      	movw	$0x0, -0x1662(%rbp,%rax)
    1580:      	addq	$0x10, %rax
    1584:      	cmpq	$0x200, %rax            # imm = 0x200
    158a:      	jne	0x1530 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1530>
    158c:      	xorl	%eax, %eax
    158e:      	nop
    1590:      	movw	$0x0, -0x1470(%rbp,%rax)
    159a:      	movw	$0x0, -0x146e(%rbp,%rax)
    15a4:      	movw	$0x0, -0x146c(%rbp,%rax)
    15ae:      	movw	$0x0, -0x146a(%rbp,%rax)
    15b8:      	movw	$0x0, -0x1468(%rbp,%rax)
    15c2:      	movw	$0x0, -0x1466(%rbp,%rax)
    15cc:      	movw	$0x0, -0x1464(%rbp,%rax)
    15d6:      	movw	$0x0, -0x1462(%rbp,%rax)
    15e0:      	addq	$0x10, %rax
    15e4:      	cmpq	$0x200, %rax            # imm = 0x200
    15ea:      	jne	0x1590 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1590>
    15ec:      	callq	0x15f1 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x15f1>

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
      2d:      	jne	0xe27 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xe27>
      33:      	movq	%rdx, %r15
      36:      	leaq	-0xa80(%rbp), %rax
      3d:      	movq	%rax, -0x60(%rbp)
      41:      	movq	$0x3, -0x58(%rbp)
      49:      	xorl	%r13d, %r13d
      4c:      	leaq	-0x1080(%rbp), %rdi
      53:      	movl	$0x140, %edx            # imm = 0x140
      58:      	movq	%r15, %rsi
      5b:      	callq	0x60 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x60>
      60:      	movl	$0x2, %esi
      65:      	xorl	%ecx, %ecx
      67:      	movl	$0xd01, %edi            # imm = 0xD01
      6c:      	nopl	(%rax)
      70:      	movswl	-0x1082(%rbp,%rsi), %eax
      78:      	mull	%edi
      7a:      	jo	0xf98 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf98>
      80:      	addl	$0x200, %eax            # imm = 0x200
      85:      	shrl	$0xa, %eax
      88:      	movw	%ax, -0x1082(%rbp,%rsi)
      90:      	movswl	-0x1080(%rbp,%rsi), %eax
      98:      	mull	%edi
      9a:      	jo	0xf98 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf98>
      a0:      	addl	$0x200, %eax            # imm = 0x200
      a5:      	shrl	$0xa, %eax
      a8:      	movw	%ax, -0x1080(%rbp,%rsi)
      b0:      	addq	$0x4, %rsi
      b4:      	cmpq	$0x202, %rsi            # imm = 0x202
      bb:      	jne	0x70 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x70>
      bd:      	leaq	-0x480(%rbp), %r12
      c4:      	leaq	-0x1080(%rbp), %rsi
      cb:      	movl	$0x200, %edx            # imm = 0x200
      d0:      	movq	%r12, %rdi
      d3:      	callq	0xd8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xd8>
      d8:      	xorl	%r13d, %r13d
      db:      	leaq	-0x280(%rbp), %rdi
      e2:      	movq	%r12, %rsi
      e5:      	callq	0xea <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xea>
      ea:      	leaq	-0x1080(%rbp), %r12
      f1:      	leaq	-0x280(%rbp), %rsi
      f8:      	movl	$0x200, %edx            # imm = 0x200
      fd:      	movq	%r12, %rdi
     100:      	callq	0x105 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x105>
     105:      	leaq	-0xa80(%rbp), %rdi
     10c:      	movl	$0x200, %edx            # imm = 0x200
     111:      	movq	%r12, %rsi
     114:      	callq	0x119 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x119>
     119:      	leaq	0x140(%r15), %rsi
     120:      	movl	$0x1, %r13d
     126:      	leaq	-0x1080(%rbp), %rdi
     12d:      	movl	$0x140, %edx            # imm = 0x140
     132:      	callq	0x137 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x137>
     137:      	movl	$0x2, %esi
     13c:      	movl	$0xd01, %edi            # imm = 0xD01
     141:      	movl	$0x1, %ecx
     146:      	nopw	%cs:(%rax,%rax)
     150:      	movswl	-0x1082(%rbp,%rsi), %eax
     158:      	mull	%edi
     15a:      	jo	0xf98 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf98>
     160:      	addl	$0x200, %eax            # imm = 0x200
     165:      	shrl	$0xa, %eax
     168:      	movw	%ax, -0x1082(%rbp,%rsi)
     170:      	movswl	-0x1080(%rbp,%rsi), %eax
     178:      	mull	%edi
     17a:      	jo	0xf98 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf98>
     180:      	addl	$0x200, %eax            # imm = 0x200
     185:      	shrl	$0xa, %eax
     188:      	movw	%ax, -0x1080(%rbp,%rsi)
     190:      	addq	$0x4, %rsi
     194:      	cmpq	$0x202, %rsi            # imm = 0x202
     19b:      	jne	0x150 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x150>
     19d:      	leaq	-0x480(%rbp), %r12
     1a4:      	leaq	-0x1080(%rbp), %rsi
     1ab:      	movl	$0x200, %edx            # imm = 0x200
     1b0:      	movq	%r12, %rdi
     1b3:      	callq	0x1b8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1b8>
     1b8:      	movl	$0x1, %r13d
     1be:      	leaq	-0x280(%rbp), %rdi
     1c5:      	movq	%r12, %rsi
     1c8:      	callq	0x1cd <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1cd>
     1cd:      	leaq	-0x1080(%rbp), %r12
     1d4:      	leaq	-0x280(%rbp), %rsi
     1db:      	movl	$0x200, %edx            # imm = 0x200
     1e0:      	movq	%r12, %rdi
     1e3:      	callq	0x1e8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1e8>
     1e8:      	leaq	-0x880(%rbp), %rdi
     1ef:      	movl	$0x200, %edx            # imm = 0x200
     1f4:      	movq	%r12, %rsi
     1f7:      	callq	0x1fc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1fc>
     1fc:      	leaq	0x280(%r15), %rsi
     203:      	movl	$0x2, %r13d
     209:      	leaq	-0x1080(%rbp), %rdi
     210:      	movl	$0x140, %edx            # imm = 0x140
     215:      	callq	0x21a <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x21a>
     21a:      	movl	$0x2, %ecx
     21f:      	movl	$0xd01, %esi            # imm = 0xD01
     224:      	movl	$0x2, %edi
     229:      	nopl	(%rax)
     230:      	movswl	-0x1082(%rbp,%rdi), %eax
     238:      	mull	%esi
     23a:      	jo	0xf98 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf98>
     240:      	addl	$0x200, %eax            # imm = 0x200
     245:      	shrl	$0xa, %eax
     248:      	movw	%ax, -0x1082(%rbp,%rdi)
     250:      	movswl	-0x1080(%rbp,%rdi), %eax
     258:      	mull	%esi
     25a:      	jo	0xf98 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf98>
     260:      	addl	$0x200, %eax            # imm = 0x200
     265:      	shrl	$0xa, %eax
     268:      	movw	%ax, -0x1080(%rbp,%rdi)
     270:      	addq	$0x4, %rdi
     274:      	cmpq	$0x202, %rdi            # imm = 0x202
     27b:      	jne	0x230 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x230>
     27d:      	leaq	-0x480(%rbp), %r12
     284:      	leaq	-0x1080(%rbp), %rsi
     28b:      	movl	$0x200, %edx            # imm = 0x200
     290:      	movq	%r12, %rdi
     293:      	callq	0x298 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x298>
     298:      	movl	$0x2, %r13d
     29e:      	leaq	-0x280(%rbp), %rdi
     2a5:      	movq	%r12, %rsi
     2a8:      	callq	0x2ad <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x2ad>
     2ad:      	leaq	-0x1080(%rbp), %r12
     2b4:      	leaq	-0x280(%rbp), %rsi
     2bb:      	movl	$0x200, %edx            # imm = 0x200
     2c0:      	movq	%r12, %rdi
     2c3:      	callq	0x2c8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x2c8>
     2c8:      	leaq	-0x680(%rbp), %rdi
     2cf:      	movl	$0x200, %edx            # imm = 0x200
     2d4:      	movq	%r12, %rsi
     2d7:      	callq	0x2dc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x2dc>
     2dc:      	leaq	-0x1080(%rbp), %rdi
     2e3:      	leaq	-0xa80(%rbp), %rsi
     2ea:      	movl	$0x600, %edx            # imm = 0x600
     2ef:      	callq	0x2f4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x2f4>
     2f4:      	pxor	%xmm0, %xmm0
     2f8:      	movdqa	%xmm0, -0x50(%rbp)
     2fd:      	movdqa	%xmm0, -0x60(%rbp)
     302:      	leaq	0x3c0(%r15), %rsi
     309:      	leaq	-0xa80(%rbp), %rdi
     310:      	movl	$0x80, %edx
     315:      	callq	0x31a <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x31a>
     31a:      	movl	$0x2, %ecx
     31f:      	movl	$0xd01, %esi            # imm = 0xD01
     324:      	nopw	%cs:(%rax,%rax)
     330:      	movswl	-0xa82(%rbp,%rcx), %eax
     338:      	mull	%esi
     33a:      	jo	0xfaa <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfaa>
     340:      	addl	$0x8, %eax
     343:      	shrl	$0x4, %eax
     346:      	movw	%ax, -0xa82(%rbp,%rcx)
     34e:      	movswl	-0xa80(%rbp,%rcx), %eax
     356:      	mull	%esi
     358:      	jo	0xfaa <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfaa>
     35e:      	addl	$0x8, %eax
     361:      	shrl	$0x4, %eax
     364:      	movw	%ax, -0xa80(%rbp,%rcx)
     36c:      	addq	$0x4, %rcx
     370:      	cmpq	$0x202, %rcx            # imm = 0x202
     377:      	jne	0x330 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x330>
     379:      	leaq	-0x280(%rbp), %rdi
     380:      	leaq	-0xa80(%rbp), %rsi
     387:      	movl	$0x200, %edx            # imm = 0x200
     38c:      	callq	0x391 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x391>
     391:      	leaq	-0xa80(%rbp), %rdi
     398:      	leaq	-0x1080(%rbp), %rdx
     39f:      	movq	%rbx, %rsi
     3a2:      	callq	0x3a7 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x3a7>
     3a7:      	leaq	-0x480(%rbp), %rdi
     3ae:      	leaq	-0xa80(%rbp), %rsi
     3b5:      	callq	0x3ba <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x3ba>
     3ba:      	leaq	-0x80(%rbp), %rdi
     3be:      	leaq	-0x280(%rbp), %rsi
     3c5:      	callq	0x3ca <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x3ca>
     3ca:      	testb	%al, %al
     3cc:      	je	0xf7e <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf7e>
     3d2:      	leaq	-0x280(%rbp), %rdi
     3d9:      	leaq	-0x480(%rbp), %rsi
     3e0:      	callq	0x3e5 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x3e5>
     3e5:      	testb	%al, %al
     3e7:      	je	0xf7e <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf7e>
     3ed:      	movl	$0x1, %eax
     3f2:      	nopw	%cs:(%rax,%rax)
     400:      	movzwl	-0x282(%rbp,%rax,2), %ecx
     408:      	subw	-0x482(%rbp,%rax,2), %cx
     410:      	jo	0xfb8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfb8>
     416:      	movw	%cx, -0x282(%rbp,%rax,2)
     41e:      	movzwl	-0x280(%rbp,%rax,2), %ecx
     426:      	subw	-0x480(%rbp,%rax,2), %cx
     42e:      	jo	0xfb8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfb8>
     434:      	movw	%cx, -0x280(%rbp,%rax,2)
     43c:      	addq	$0x2, %rax
     440:      	cmpq	$0x101, %rax            # imm = 0x101
     446:      	jne	0x400 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x400>
     448:      	leaq	-0xa80(%rbp), %rdi
     44f:      	leaq	-0x280(%rbp), %rsi
     456:      	movl	$0x200, %edx            # imm = 0x200
     45b:      	callq	0x460 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x460>
     460:      	xorl	%eax, %eax
     462:      	nopw	%cs:(%rax,%rax)
     470:      	movswl	-0xa80(%rbp,%rax), %ecx
     478:      	imull	$0x4ebf, %ecx, %edx     # imm = 0x4EBF
     47e:      	addl	$0x2000000, %edx        # imm = 0x2000000
     484:      	sarl	$0x1a, %edx
     487:      	imull	$0xfffff2ff, %edx, %edx # imm = 0xFFFFF2FF
     48d:      	addl	%ecx, %edx
     48f:      	movswl	%dx, %ecx
     492:      	movl	%ecx, %edx
     494:      	shrl	$0xf, %edx
     497:      	andl	$0xd01, %edx            # imm = 0xD01
     49d:      	addw	%dx, %cx
     4a0:      	jo	0xfc6 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfc6>
     4a6:      	movswl	%cx, %ecx
     4a9:      	addl	%ecx, %ecx
     4ab:      	cmpl	$0xfffff97f, %ecx       # imm = 0xFFFFF97F
     4b1:      	ja	0xfd4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfd4>
     4b7:      	addl	$0x680, %ecx            # imm = 0x680
     4bd:      	imulq	$0x275f6f, %rcx, %rcx   # imm = 0x275F6F
     4c4:      	shrq	$0x21, %rcx
     4c8:      	andl	$0x1, %ecx
     4cb:      	movw	%cx, -0xa80(%rbp,%rax)
     4d3:      	addq	$0x2, %rax
     4d7:      	cmpq	$0x200, %rax            # imm = 0x200
     4dd:      	jne	0x470 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x470>
     4df:      	leaq	-0x280(%rbp), %r13
     4e6:      	leaq	-0xa80(%rbp), %rsi
     4ed:      	movl	$0x200, %edx            # imm = 0x200
     4f2:      	movq	%r13, %rdi
     4f5:      	callq	0x4fa <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x4fa>
     4fa:      	leaq	-0x60(%rbp), %r12
     4fe:      	movl	$0x20, %edx
     503:      	movq	%r13, %rdi
     506:      	movq	%r12, %rsi
     509:      	callq	0x50e <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x50e>
     50e:      	xorl	%eax, %eax
     510:      	movw	$0x0, -0x280(%rbp,%rax)
     51a:      	movw	$0x0, -0x27e(%rbp,%rax)
     524:      	movw	$0x0, -0x27c(%rbp,%rax)
     52e:      	movw	$0x0, -0x27a(%rbp,%rax)
     538:      	movw	$0x0, -0x278(%rbp,%rax)
     542:      	movw	$0x0, -0x276(%rbp,%rax)
     54c:      	movw	$0x0, -0x274(%rbp,%rax)
     556:      	movw	$0x0, -0x272(%rbp,%rax)
     560:      	addq	$0x10, %rax
     564:      	cmpq	$0x200, %rax            # imm = 0x200
     56a:      	jne	0x510 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x510>
     56c:      	xorl	%eax, %eax
     56e:      	nop
     570:      	movw	$0x0, -0x480(%rbp,%rax)
     57a:      	movw	$0x0, -0x47e(%rbp,%rax)
     584:      	movw	$0x0, -0x47c(%rbp,%rax)
     58e:      	movw	$0x0, -0x47a(%rbp,%rax)
     598:      	movw	$0x0, -0x478(%rbp,%rax)
     5a2:      	movw	$0x0, -0x476(%rbp,%rax)
     5ac:      	movw	$0x0, -0x474(%rbp,%rax)
     5b6:      	movw	$0x0, -0x472(%rbp,%rax)
     5c0:      	addq	$0x10, %rax
     5c4:      	cmpq	$0x200, %rax            # imm = 0x200
     5ca:      	jne	0x570 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x570>
     5cc:      	leaq	0xaa0(%rbx), %rax
     5d3:      	movq	%r12, -0x280(%rbp)
     5da:      	movq	$0x20, -0x278(%rbp)
     5e5:      	movq	%rax, -0x270(%rbp)
     5ec:      	movq	$0x20, -0x268(%rbp)
     5f7:      	leaq	-0xa80(%rbp), %rdi
     5fe:      	leaq	-0x280(%rbp), %rsi
     605:      	movl	$0x2, %edx
     60a:      	callq	0x60f <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x60f>
     60f:      	movups	-0xa80(%rbp), %xmm0
     616:      	movups	-0xa70(%rbp), %xmm1
     61d:      	movdqu	-0xa60(%rbp), %xmm2
     625:      	movdqu	-0xa50(%rbp), %xmm3
     62d:      	movdqa	%xmm3, -0x450(%rbp)
     635:      	movdqa	%xmm2, -0x460(%rbp)
     63d:      	movaps	%xmm1, -0x470(%rbp)
     644:      	movaps	%xmm0, -0x480(%rbp)
     64b:      	leaq	0xac0(%rbx), %r13
     652:      	movq	%r13, -0xa80(%rbp)
     659:      	movq	$0x20, -0xa78(%rbp)
     664:      	movq	%r15, -0xa70(%rbp)
     66b:      	movq	$0x440, -0xa68(%rbp)    # imm = 0x440
     676:      	leaq	-0x280(%rbp), %rdi
     67d:      	leaq	-0xa80(%rbp), %rsi
     684:      	movl	$0x2, %edx
     689:      	callq	0x68e <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x68e>
     68e:      	movdqa	-0x280(%rbp), %xmm0
     696:      	movdqa	-0x270(%rbp), %xmm1
     69e:      	movdqa	%xmm0, -0x80(%rbp)
     6a3:      	movdqa	%xmm1, -0x70(%rbp)
     6a8:      	leaq	0x600(%rbx), %rsi
     6af:      	leaq	-0x460(%rbp), %r12
     6b6:      	leaq	-0xa80(%rbp), %rdi
     6bd:      	leaq	-0x60(%rbp), %rdx
     6c1:      	movq	%r12, %rcx
     6c4:      	callq	0x6c9 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x6c9>
     6c9:      	leaq	0x440(%r15), %rdi
     6d0:      	movq	%r15, %rsi
     6d3:      	callq	0x6d8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x6d8>
     6d8:      	testb	%al, %al
     6da:      	je	0xf7e <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf7e>
     6e0:      	leaq	-0x640(%rbp), %rdi
     6e7:      	leaq	-0xa80(%rbp), %rsi
     6ee:      	callq	0x6f3 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x6f3>
     6f3:      	testb	%al, %al
     6f5:      	je	0xf7e <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf7e>
     6fb:      	pxor	%xmm0, %xmm0
     6ff:      	movl	$0x6, %eax
     704:      	pxor	%xmm2, %xmm2
     708:      	pxor	%xmm1, %xmm1
     70c:      	nopl	(%rax)
     710:      	movzwl	-0xa86(%rbp,%rax), %ecx
     718:      	movzwl	-0xa84(%rbp,%rax), %edx
     720:      	xorw	-0x6(%r15,%rax), %cx
     726:      	xorw	-0x4(%r15,%rax), %dx
     72c:      	movd	%ecx, %xmm4
     730:      	movd	%edx, %xmm3
     734:      	punpcklbw	%xmm0, %xmm4    # xmm4 = xmm4[0],xmm0[0],xmm4[1],xmm0[1],xmm4[2],xmm0[2],xmm4[3],xmm0[3],xmm4[4],xmm0[4],xmm4[5],xmm0[5],xmm4[6],xmm0[6],xmm4[7],xmm0[7]
     738:      	punpcklwd	%xmm0, %xmm4    # xmm4 = xmm4[0],xmm0[0],xmm4[1],xmm0[1],xmm4[2],xmm0[2],xmm4[3],xmm0[3]
     73c:      	punpckldq	%xmm0, %xmm4    # xmm4 = xmm4[0],xmm0[0],xmm4[1],xmm0[1]
     740:      	por	%xmm2, %xmm4
     744:      	punpcklbw	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3],xmm3[4],xmm0[4],xmm3[5],xmm0[5],xmm3[6],xmm0[6],xmm3[7],xmm0[7]
     748:      	punpcklwd	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3]
     74c:      	punpckldq	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1]
     750:      	por	%xmm1, %xmm3
     754:      	movzwl	-0xa82(%rbp,%rax), %ecx
     75c:      	movzwl	-0xa80(%rbp,%rax), %edx
     764:      	xorw	-0x2(%r15,%rax), %cx
     76a:      	xorw	(%r15,%rax), %dx
     76f:      	movd	%ecx, %xmm2
     773:      	movd	%edx, %xmm1
     777:      	punpcklbw	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1],xmm2[2],xmm0[2],xmm2[3],xmm0[3],xmm2[4],xmm0[4],xmm2[5],xmm0[5],xmm2[6],xmm0[6],xmm2[7],xmm0[7]
     77b:      	punpcklwd	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1],xmm2[2],xmm0[2],xmm2[3],xmm0[3]
     77f:      	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
     783:      	por	%xmm4, %xmm2
     787:      	punpcklbw	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3],xmm1[4],xmm0[4],xmm1[5],xmm0[5],xmm1[6],xmm0[6],xmm1[7],xmm0[7]
     78b:      	punpcklwd	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3]
     78f:      	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
     793:      	por	%xmm3, %xmm1
     797:      	addq	$0x8, %rax
     79b:      	cmpq	$0x446, %rax            # imm = 0x446
     7a1:      	jne	0x710 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x710>
     7a7:      	por	%xmm2, %xmm1
     7ab:      	pshufd	$0xee, %xmm1, %xmm0     # xmm0 = xmm1[2,3,2,3]
     7b0:      	por	%xmm1, %xmm0
     7b4:      	movq	%xmm0, %rax
     7b9:      	movl	$0x7, %ecx
     7be:      	nop
     7c0:      	movb	$0x0, -0xa87(%rbp,%rcx)
     7c8:      	movb	$0x0, -0xa86(%rbp,%rcx)
     7d0:      	movb	$0x0, -0xa85(%rbp,%rcx)
     7d8:      	movb	$0x0, -0xa84(%rbp,%rcx)
     7e0:      	movb	$0x0, -0xa83(%rbp,%rcx)
     7e8:      	movb	$0x0, -0xa82(%rbp,%rcx)
     7f0:      	movb	$0x0, -0xa81(%rbp,%rcx)
     7f8:      	movb	$0x0, -0xa80(%rbp,%rcx)
     800:      	addq	$0x8, %rcx
     804:      	cmpq	$0x447, %rcx            # imm = 0x447
     80b:      	jne	0x7c0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x7c0>
     80d:      	xorl	%ecx, %ecx
     80f:      	testq	%rax, %rax
     812:      	setg	%cl
     815:      	leaq	0xff(%rcx), %rax
     81c:      	movq	%rax, %xmm0
     821:      	pshufd	$0x44, %xmm0, %xmm1     # xmm1 = xmm0[0,1,0,1]
     826:      	negq	%rcx
     829:      	movq	%rcx, %xmm0
     82e:      	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
     833:      	movdqa	-0x480(%rbp), %xmm8
     83c:      	movdqa	-0x470(%rbp), %xmm3
     844:      	movdqa	%xmm8, %xmm2
     849:      	punpcklbw	%xmm2, %xmm2    # xmm2 = xmm2[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
     84d:      	movdqa	%xmm2, %xmm5
     851:      	punpcklwd	%xmm5, %xmm5    # xmm5 = xmm5[0,0,1,1,2,2,3,3]
     855:      	pshufd	$0xd4, %xmm5, %xmm4     # xmm4 = xmm5[0,1,1,3]
     85a:      	pshufd	$0xf6, %xmm5, %xmm5     # xmm5 = xmm5[2,1,3,3]
     85f:      	punpckhwd	%xmm2, %xmm2    # xmm2 = xmm2[4,4,5,5,6,6,7,7]
     863:      	pshufd	$0xd4, %xmm2, %xmm6     # xmm6 = xmm2[0,1,1,3]
     868:      	pshufd	$0xf6, %xmm2, %xmm7     # xmm7 = xmm2[2,1,3,3]
     86d:      	punpckhbw	%xmm8, %xmm8    # xmm8 = xmm8[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
     872:      	movdqa	%xmm8, %xmm2
     877:      	punpcklwd	%xmm2, %xmm2    # xmm2 = xmm2[0,0,1,1,2,2,3,3]
     87b:      	pshufd	$0xd4, %xmm2, %xmm9     # xmm9 = xmm2[0,1,1,3]
     881:      	pshufd	$0xf6, %xmm2, %xmm2     # xmm2 = xmm2[2,1,3,3]
     886:      	punpckhwd	%xmm8, %xmm8    # xmm8 = xmm8[4,4,5,5,6,6,7,7]
     88b:      	pshufd	$0xd4, %xmm8, %xmm11    # xmm11 = xmm8[0,1,1,3]
     891:      	pshufd	$0xf6, %xmm8, %xmm13    # xmm13 = xmm8[2,1,3,3]
     897:      	movdqa	-0x80(%rbp), %xmm12
     89d:      	movdqa	%xmm12, %xmm10
     8a2:      	punpcklbw	%xmm10, %xmm10  # xmm10 = xmm10[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
     8a7:      	punpckhbw	%xmm12, %xmm12  # xmm12 = xmm12[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
     8ac:      	movdqa	%xmm12, %xmm15
     8b1:      	punpckhwd	%xmm12, %xmm12  # xmm12 = xmm12[4,4,5,5,6,6,7,7]
     8b6:      	pshufd	$0xf6, %xmm12, %xmm8    # xmm8 = xmm12[2,1,3,3]
     8bc:      	pand	%xmm1, %xmm13
     8c1:      	pand	%xmm0, %xmm8
     8c6:      	por	%xmm13, %xmm8
     8cb:      	movdqa	%xmm10, %xmm13
     8d0:      	punpcklwd	%xmm13, %xmm13  # xmm13 = xmm13[0,0,1,1,2,2,3,3]
     8d5:      	punpcklwd	%xmm15, %xmm15  # xmm15 = xmm15[0,0,1,1,2,2,3,3]
     8da:      	pshufd	$0xd4, %xmm12, %xmm12   # xmm12 = xmm12[0,1,1,3]
     8e0:      	pand	%xmm1, %xmm11
     8e5:      	pand	%xmm0, %xmm12
     8ea:      	por	%xmm11, %xmm12
     8ef:      	pshufd	$0xf6, %xmm15, %xmm14   # xmm14 = xmm15[2,1,3,3]
     8f5:      	pand	%xmm1, %xmm2
     8f9:      	pand	%xmm0, %xmm14
     8fe:      	por	%xmm2, %xmm14
     903:      	pshufd	$0xd4, %xmm13, %xmm2    # xmm2 = xmm13[0,1,1,3]
     909:      	pshufd	$0xf6, %xmm13, %xmm13   # xmm13 = xmm13[2,1,3,3]
     90f:      	punpckhwd	%xmm10, %xmm10  # xmm10 = xmm10[4,4,5,5,6,6,7,7]
     914:      	pshufd	$0xd4, %xmm15, %xmm11   # xmm11 = xmm15[0,1,1,3]
     91a:      	pand	%xmm1, %xmm9
     91f:      	pand	%xmm0, %xmm11
     924:      	por	%xmm9, %xmm11
     929:      	pshufd	$0xd4, %xmm10, %xmm9    # xmm9 = xmm10[0,1,1,3]
     92f:      	pshufd	$0xf6, %xmm10, %xmm10   # xmm10 = xmm10[2,1,3,3]
     935:      	pand	%xmm1, %xmm7
     939:      	pand	%xmm1, %xmm6
     93d:      	pand	%xmm1, %xmm5
     941:      	pand	%xmm1, %xmm4
     945:      	pand	%xmm0, %xmm10
     94a:      	por	%xmm7, %xmm10
     94f:      	pand	%xmm0, %xmm9
     954:      	por	%xmm6, %xmm9
     959:      	pand	%xmm0, %xmm13
     95e:      	por	%xmm5, %xmm13
     963:      	pand	%xmm0, %xmm2
     967:      	por	%xmm4, %xmm2
     96b:      	movdqa	(%rip), %xmm4           # 0x973 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x973>
     973:      	pand	%xmm4, %xmm8
     978:      	pand	%xmm4, %xmm12
     97d:      	packuswb	%xmm8, %xmm12
     982:      	pand	%xmm4, %xmm14
     987:      	pand	%xmm4, %xmm11
     98c:      	packuswb	%xmm14, %xmm11
     991:      	packuswb	%xmm12, %xmm11
     996:      	pand	%xmm4, %xmm10
     99b:      	pand	%xmm4, %xmm9
     9a0:      	packuswb	%xmm10, %xmm9
     9a5:      	pand	%xmm4, %xmm13
     9aa:      	pand	%xmm4, %xmm2
     9ae:      	packuswb	%xmm13, %xmm2
     9b3:      	packuswb	%xmm9, %xmm2
     9b8:      	packuswb	%xmm11, %xmm2
     9bd:      	movdqa	%xmm3, %xmm8
     9c2:      	punpcklbw	%xmm8, %xmm8    # xmm8 = xmm8[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
     9c7:      	movdqa	%xmm8, %xmm6
     9cc:      	punpcklwd	%xmm6, %xmm6    # xmm6 = xmm6[0,0,1,1,2,2,3,3]
     9d0:      	pshufd	$0xd4, %xmm6, %xmm5     # xmm5 = xmm6[0,1,1,3]
     9d5:      	pshufd	$0xf6, %xmm6, %xmm6     # xmm6 = xmm6[2,1,3,3]
     9da:      	punpckhwd	%xmm8, %xmm8    # xmm8 = xmm8[4,4,5,5,6,6,7,7]
     9df:      	pshufd	$0xd4, %xmm8, %xmm7     # xmm7 = xmm8[0,1,1,3]
     9e5:      	pshufd	$0xf6, %xmm8, %xmm8     # xmm8 = xmm8[2,1,3,3]
     9eb:      	punpckhbw	%xmm3, %xmm3    # xmm3 = xmm3[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
     9ef:      	movdqa	%xmm3, %xmm10
     9f4:      	punpcklwd	%xmm10, %xmm10  # xmm10 = xmm10[0,0,1,1,2,2,3,3]
     9f9:      	pshufd	$0xd4, %xmm10, %xmm9    # xmm9 = xmm10[0,1,1,3]
     9ff:      	pshufd	$0xf6, %xmm10, %xmm10   # xmm10 = xmm10[2,1,3,3]
     a05:      	punpckhwd	%xmm3, %xmm3    # xmm3 = xmm3[4,4,5,5,6,6,7,7]
     a09:      	pshufd	$0xd4, %xmm3, %xmm12    # xmm12 = xmm3[0,1,1,3]
     a0f:      	pshufd	$0xf6, %xmm3, %xmm15    # xmm15 = xmm3[2,1,3,3]
     a15:      	movdqa	-0x70(%rbp), %xmm11
     a1b:      	movdqa	%xmm11, %xmm3
     a20:      	punpckhbw	%xmm11, %xmm11  # xmm11 = xmm11[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
     a25:      	movdqa	%xmm11, %xmm14
     a2a:      	punpckhwd	%xmm11, %xmm11  # xmm11 = xmm11[4,4,5,5,6,6,7,7]
     a2f:      	pand	%xmm1, %xmm15
     a34:      	pand	%xmm1, %xmm12
     a39:      	pand	%xmm1, %xmm10
     a3e:      	pand	%xmm1, %xmm9
     a43:      	pand	%xmm1, %xmm8
     a48:      	pand	%xmm1, %xmm7
     a4c:      	pand	%xmm1, %xmm6
     a50:      	pand	%xmm1, %xmm5
     a54:      	pshufd	$0xf6, %xmm11, %xmm13   # xmm13 = xmm11[2,1,3,3]
     a5a:      	pand	%xmm0, %xmm13
     a5f:      	por	%xmm15, %xmm13
     a64:      	punpcklbw	%xmm3, %xmm3    # xmm3 = xmm3[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
     a68:      	punpcklwd	%xmm14, %xmm14  # xmm14 = xmm14[0,0,1,1,2,2,3,3]
     a6d:      	pshufd	$0xd4, %xmm11, %xmm11   # xmm11 = xmm11[0,1,1,3]
     a73:      	pand	%xmm0, %xmm11
     a78:      	por	%xmm12, %xmm11
     a7d:      	pshufd	$0xf6, %xmm14, %xmm12   # xmm12 = xmm14[2,1,3,3]
     a83:      	pand	%xmm0, %xmm12
     a88:      	por	%xmm10, %xmm12
     a8d:      	movdqa	%xmm3, %xmm10
     a92:      	punpckhwd	%xmm3, %xmm3    # xmm3 = xmm3[4,4,5,5,6,6,7,7]
     a96:      	pshufd	$0xd4, %xmm14, %xmm1    # xmm1 = xmm14[0,1,1,3]
     a9c:      	pand	%xmm0, %xmm1
     aa0:      	por	%xmm9, %xmm1
     aa5:      	pshufd	$0xf6, %xmm3, %xmm9     # xmm9 = xmm3[2,1,3,3]
     aab:      	pand	%xmm0, %xmm9
     ab0:      	por	%xmm8, %xmm9
     ab5:      	punpcklwd	%xmm10, %xmm10  # xmm10 = xmm10[0,0,1,1,2,2,3,3]
     aba:      	pshufd	$0xd4, %xmm3, %xmm3     # xmm3 = xmm3[0,1,1,3]
     abf:      	pand	%xmm0, %xmm3
     ac3:      	por	%xmm7, %xmm3
     ac7:      	pshufd	$0xf6, %xmm10, %xmm7    # xmm7 = xmm10[2,1,3,3]
     acd:      	pand	%xmm0, %xmm7
     ad1:      	por	%xmm6, %xmm7
     ad5:      	pshufd	$0xd4, %xmm10, %xmm6    # xmm6 = xmm10[0,1,1,3]
     adb:      	pand	%xmm0, %xmm6
     adf:      	por	%xmm5, %xmm6
     ae3:      	pand	%xmm4, %xmm13
     ae8:      	pand	%xmm4, %xmm11
     aed:      	packuswb	%xmm13, %xmm11
     af2:      	pand	%xmm4, %xmm12
     af7:      	pand	%xmm4, %xmm1
     afb:      	packuswb	%xmm12, %xmm1
     b00:      	packuswb	%xmm11, %xmm1
     b05:      	pand	%xmm4, %xmm9
     b0a:      	pand	%xmm4, %xmm3
     b0e:      	packuswb	%xmm9, %xmm3
     b13:      	pand	%xmm4, %xmm7
     b17:      	pand	%xmm4, %xmm6
     b1b:      	packuswb	%xmm7, %xmm6
     b1f:      	packuswb	%xmm3, %xmm6
     b23:      	packuswb	%xmm1, %xmm6
     b27:      	movdqu	%xmm2, 0x1(%r14)
     b2d:      	movdqu	%xmm6, 0x11(%r14)
     b33:      	movb	$0x0, (%r14)
     b37:      	pxor	%xmm0, %xmm0
     b3b:      	movdqa	%xmm0, -0xa80(%rbp)
     b43:      	movaps	-0xa80(%rbp), %xmm1
     b4a:      	movaps	%xmm1, -0x80(%rbp)
     b4e:      	movdqa	%xmm0, -0xa80(%rbp)
     b56:      	movaps	-0xa80(%rbp), %xmm1
     b5d:      	movaps	%xmm1, -0x70(%rbp)
     b61:      	movdqa	%xmm0, -0xa80(%rbp)
     b69:      	movaps	-0xa80(%rbp), %xmm1
     b70:      	movaps	%xmm1, -0x480(%rbp)
     b77:      	movdqa	%xmm0, -0xa80(%rbp)
     b7f:      	movaps	-0xa80(%rbp), %xmm1
     b86:      	movaps	%xmm1, -0x470(%rbp)
     b8d:      	movdqa	%xmm0, -0xa80(%rbp)
     b95:      	movaps	-0xa80(%rbp), %xmm1
     b9c:      	movups	%xmm1, (%r12)
     ba1:      	movdqa	%xmm0, -0xa80(%rbp)
     ba9:      	movaps	-0xa80(%rbp), %xmm1
     bb0:      	movaps	%xmm1, -0x450(%rbp)
     bb7:      	movdqa	%xmm0, -0xa80(%rbp)
     bbf:      	movaps	-0xa80(%rbp), %xmm1
     bc6:      	movaps	%xmm1, -0x60(%rbp)
     bca:      	movdqa	%xmm0, -0xa80(%rbp)
     bd2:      	movaps	-0xa80(%rbp), %xmm0
     bd9:      	movaps	%xmm0, -0x50(%rbp)
     bdd:      	xorl	%eax, %eax
     bdf:      	nop
     be0:      	movw	$0x0, -0x1080(%rbp,%rax)
     bea:      	movw	$0x0, -0x107e(%rbp,%rax)
     bf4:      	movw	$0x0, -0x107c(%rbp,%rax)
     bfe:      	movw	$0x0, -0x107a(%rbp,%rax)
     c08:      	movw	$0x0, -0x1078(%rbp,%rax)
     c12:      	movw	$0x0, -0x1076(%rbp,%rax)
     c1c:      	movw	$0x0, -0x1074(%rbp,%rax)
     c26:      	movw	$0x0, -0x1072(%rbp,%rax)
     c30:      	addq	$0x10, %rax
     c34:      	cmpq	$0x200, %rax            # imm = 0x200
     c3a:      	jne	0xbe0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xbe0>
     c3c:      	xorl	%eax, %eax
     c3e:      	nop
     c40:      	movw	$0x0, -0xe80(%rbp,%rax)
     c4a:      	movw	$0x0, -0xe7e(%rbp,%rax)
     c54:      	movw	$0x0, -0xe7c(%rbp,%rax)
     c5e:      	movw	$0x0, -0xe7a(%rbp,%rax)
     c68:      	movw	$0x0, -0xe78(%rbp,%rax)
     c72:      	movw	$0x0, -0xe76(%rbp,%rax)
     c7c:      	movw	$0x0, -0xe74(%rbp,%rax)
     c86:      	movw	$0x0, -0xe72(%rbp,%rax)
     c90:      	addq	$0x10, %rax
     c94:      	cmpq	$0x200, %rax            # imm = 0x200
     c9a:      	jne	0xc40 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xc40>
     c9c:      	xorl	%eax, %eax
     c9e:      	nop
     ca0:      	movw	$0x0, -0xc80(%rbp,%rax)
     caa:      	movw	$0x0, -0xc7e(%rbp,%rax)
     cb4:      	movw	$0x0, -0xc7c(%rbp,%rax)
     cbe:      	movw	$0x0, -0xc7a(%rbp,%rax)
     cc8:      	movw	$0x0, -0xc78(%rbp,%rax)
     cd2:      	movw	$0x0, -0xc76(%rbp,%rax)
     cdc:      	movw	$0x0, -0xc74(%rbp,%rax)
     ce6:      	movw	$0x0, -0xc72(%rbp,%rax)
     cf0:      	addq	$0x10, %rax
     cf4:      	cmpq	$0x200, %rax            # imm = 0x200
     cfa:      	jne	0xca0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xca0>
     cfc:      	xorl	%eax, %eax
     cfe:      	nop
     d00:      	movw	$0x0, (%rbx,%rax)
     d06:      	movw	$0x0, 0x2(%rbx,%rax)
     d0d:      	movw	$0x0, 0x4(%rbx,%rax)
     d14:      	movw	$0x0, 0x6(%rbx,%rax)
     d1b:      	movw	$0x0, 0x8(%rbx,%rax)
     d22:      	movw	$0x0, 0xa(%rbx,%rax)
     d29:      	movw	$0x0, 0xc(%rbx,%rax)
     d30:      	movw	$0x0, 0xe(%rbx,%rax)
     d37:      	addq	$0x10, %rax
     d3b:      	cmpq	$0x200, %rax            # imm = 0x200
     d41:      	jne	0xd00 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xd00>
     d43:      	xorl	%eax, %eax
     d45:      	nopw	%cs:(%rax,%rax)
     d50:      	movw	$0x0, 0x200(%rbx,%rax)
     d5a:      	movw	$0x0, 0x202(%rbx,%rax)
     d64:      	movw	$0x0, 0x204(%rbx,%rax)
     d6e:      	movw	$0x0, 0x206(%rbx,%rax)
     d78:      	movw	$0x0, 0x208(%rbx,%rax)
     d82:      	movw	$0x0, 0x20a(%rbx,%rax)
     d8c:      	movw	$0x0, 0x20c(%rbx,%rax)
     d96:      	movw	$0x0, 0x20e(%rbx,%rax)
     da0:      	addq	$0x10, %rax
     da4:      	cmpq	$0x200, %rax            # imm = 0x200
     daa:      	jne	0xd50 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xd50>
     dac:      	xorl	%eax, %eax
     dae:      	nop
     db0:      	movw	$0x0, 0x400(%rbx,%rax)
     dba:      	movw	$0x0, 0x402(%rbx,%rax)
     dc4:      	movw	$0x0, 0x404(%rbx,%rax)
     dce:      	movw	$0x0, 0x406(%rbx,%rax)
     dd8:      	movw	$0x0, 0x408(%rbx,%rax)
     de2:      	movw	$0x0, 0x40a(%rbx,%rax)
     dec:      	movw	$0x0, 0x40c(%rbx,%rax)
     df6:      	movw	$0x0, 0x40e(%rbx,%rax)
     e00:      	addq	$0x10, %rax
     e04:      	cmpq	$0x200, %rax            # imm = 0x200
     e0a:      	jne	0xdb0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xdb0>
     e0c:      	xorps	%xmm0, %xmm0
     e0f:      	movaps	%xmm0, -0xa80(%rbp)
     e16:      	movaps	-0xa80(%rbp), %xmm1
     e1d:      	movups	%xmm1, (%r13)
     e22:      	jmp	0xf54 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf54>
     e27:      	movw	$0x1, (%r14)
     e2d:      	xorl	%eax, %eax
     e2f:      	nop
     e30:      	movw	$0x0, (%rbx,%rax)
     e36:      	movw	$0x0, 0x2(%rbx,%rax)
     e3d:      	movw	$0x0, 0x4(%rbx,%rax)
     e44:      	movw	$0x0, 0x6(%rbx,%rax)
     e4b:      	movw	$0x0, 0x8(%rbx,%rax)
     e52:      	movw	$0x0, 0xa(%rbx,%rax)
     e59:      	movw	$0x0, 0xc(%rbx,%rax)
     e60:      	movw	$0x0, 0xe(%rbx,%rax)
     e67:      	addq	$0x10, %rax
     e6b:      	cmpq	$0x200, %rax            # imm = 0x200
     e71:      	jne	0xe30 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xe30>
     e73:      	xorl	%eax, %eax
     e75:      	nopw	%cs:(%rax,%rax)
     e80:      	movw	$0x0, 0x200(%rbx,%rax)
     e8a:      	movw	$0x0, 0x202(%rbx,%rax)
     e94:      	movw	$0x0, 0x204(%rbx,%rax)
     e9e:      	movw	$0x0, 0x206(%rbx,%rax)
     ea8:      	movw	$0x0, 0x208(%rbx,%rax)
     eb2:      	movw	$0x0, 0x20a(%rbx,%rax)
     ebc:      	movw	$0x0, 0x20c(%rbx,%rax)
     ec6:      	movw	$0x0, 0x20e(%rbx,%rax)
     ed0:      	addq	$0x10, %rax
     ed4:      	cmpq	$0x200, %rax            # imm = 0x200
     eda:      	jne	0xe80 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xe80>
     edc:      	xorl	%eax, %eax
     ede:      	nop
     ee0:      	movw	$0x0, 0x400(%rbx,%rax)
     eea:      	movw	$0x0, 0x402(%rbx,%rax)
     ef4:      	movw	$0x0, 0x404(%rbx,%rax)
     efe:      	movw	$0x0, 0x406(%rbx,%rax)
     f08:      	movw	$0x0, 0x408(%rbx,%rax)
     f12:      	movw	$0x0, 0x40a(%rbx,%rax)
     f1c:      	movw	$0x0, 0x40c(%rbx,%rax)
     f26:      	movw	$0x0, 0x40e(%rbx,%rax)
     f30:      	addq	$0x10, %rax
     f34:      	cmpq	$0x200, %rax            # imm = 0x200
     f3a:      	jne	0xee0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xee0>
     f3c:      	xorps	%xmm0, %xmm0
     f3f:      	movaps	%xmm0, -0xa80(%rbp)
     f46:      	movaps	-0xa80(%rbp), %xmm1
     f4d:      	movups	%xmm1, 0xac0(%rbx)
     f54:      	movaps	%xmm0, -0xa80(%rbp)
     f5b:      	movaps	-0xa80(%rbp), %xmm0
     f62:      	movups	%xmm0, 0xad0(%rbx)
     f69:      	movq	%r14, %rax
     f6c:      	addq	$0x1058, %rsp           # imm = 0x1058
     f73:      	popq	%rbx
     f74:      	popq	%r12
     f76:      	popq	%r13
     f78:      	popq	%r14
     f7a:      	popq	%r15
     f7c:      	popq	%rbp
     f7d:      	retq
     f7e:      	leaq	(%rip), %rdi            # 0xf85 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf85>
     f85:      	leaq	(%rip), %rcx            # 0xf8c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf8c>
     f8c:      	movl	$0x193, %esi            # imm = 0x193
     f91:      	xorl	%edx, %edx
     f93:      	callq	0xf98 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf98>
     f98:      	movq	%rcx, -0x50(%rbp)
     f9c:      	leaq	(%rip), %rdi            # 0xfa3 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfa3>
     fa3:      	callq	0xfa8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfa8>
     fa8:      	jmp	0xfe0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfe0>
     faa:      	leaq	(%rip), %rdi            # 0xfb1 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfb1>
     fb1:      	callq	0xfb6 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfb6>
     fb6:      	jmp	0xfe0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfe0>
     fb8:      	leaq	(%rip), %rdi            # 0xfbf <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfbf>
     fbf:      	callq	0xfc4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfc4>
     fc4:      	jmp	0xfe0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfe0>
     fc6:      	leaq	(%rip), %rdi            # 0xfcd <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfcd>
     fcd:      	callq	0xfd2 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfd2>
     fd2:      	jmp	0xfe0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfe0>
     fd4:      	leaq	(%rip), %rdi            # 0xfdb <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfdb>
     fdb:      	callq	0xfe0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfe0>
     fe0:      	ud2
     fe2:      	callq	0xfe7 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfe7>
     fe7:      	callq	0xfec <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfec>
     fec:      	movq	%rax, %r14
     fef:      	pxor	%xmm0, %xmm0
     ff3:      	movdqa	%xmm0, -0x280(%rbp)
     ffb:      	movaps	-0x280(%rbp), %xmm1
    1002:      	movaps	%xmm1, -0x80(%rbp)
    1006:      	movdqa	%xmm0, -0x280(%rbp)
    100e:      	movaps	-0x280(%rbp), %xmm0
    1015:      	movaps	%xmm0, -0x70(%rbp)
    1019:      	jmp	0x101e <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x101e>
    101b:      	movq	%rax, %r14
    101e:      	xorps	%xmm0, %xmm0
    1021:      	movaps	%xmm0, -0x40(%rbp)
    1025:      	movaps	-0x40(%rbp), %xmm1
    1029:      	movaps	%xmm1, -0x480(%rbp)
    1030:      	movaps	%xmm0, -0x40(%rbp)
    1034:      	movaps	-0x40(%rbp), %xmm1
    1038:      	movaps	%xmm1, -0x470(%rbp)
    103f:      	movaps	%xmm0, -0x40(%rbp)
    1043:      	movaps	-0x40(%rbp), %xmm1
    1047:      	movaps	%xmm1, -0x460(%rbp)
    104e:      	movaps	%xmm0, -0x40(%rbp)
    1052:      	movdqa	-0x40(%rbp), %xmm0
    1057:      	movdqa	%xmm0, -0x450(%rbp)
    105f:      	jmp	0x130c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x130c>
    1064:      	movq	%rax, %r14
    1067:      	xorl	%eax, %eax
    1069:      	nopl	(%rax)
    1070:      	movw	$0x0, -0x280(%rbp,%rax)
    107a:      	movw	$0x0, -0x27e(%rbp,%rax)
    1084:      	movw	$0x0, -0x27c(%rbp,%rax)
    108e:      	movw	$0x0, -0x27a(%rbp,%rax)
    1098:      	movw	$0x0, -0x278(%rbp,%rax)
    10a2:      	movw	$0x0, -0x276(%rbp,%rax)
    10ac:      	movw	$0x0, -0x274(%rbp,%rax)
    10b6:      	movw	$0x0, -0x272(%rbp,%rax)
    10c0:      	addq	$0x10, %rax
    10c4:      	cmpq	$0x200, %rax            # imm = 0x200
    10ca:      	jne	0x1070 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1070>
    10cc:      	jmp	0x123c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x123c>
    10d1:      	callq	0x10d6 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x10d6>
    10d6:      	callq	0x10db <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x10db>
    10db:      	movq	%rax, %r14
    10de:      	jmp	0x130c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x130c>
    10e3:      	movq	%rax, %r14
    10e6:      	xorl	%eax, %eax
    10e8:      	nopl	(%rax,%rax)
    10f0:      	movw	$0x0, -0x280(%rbp,%rax)
    10fa:      	movw	$0x0, -0x27e(%rbp,%rax)
    1104:      	movw	$0x0, -0x27c(%rbp,%rax)
    110e:      	movw	$0x0, -0x27a(%rbp,%rax)
    1118:      	movw	$0x0, -0x278(%rbp,%rax)
    1122:      	movw	$0x0, -0x276(%rbp,%rax)
    112c:      	movw	$0x0, -0x274(%rbp,%rax)
    1136:      	movw	$0x0, -0x272(%rbp,%rax)
    1140:      	addq	$0x10, %rax
    1144:      	cmpq	$0x200, %rax            # imm = 0x200
    114a:      	jne	0x10f0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x10f0>
    114c:      	jmp	0x130c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x130c>
    1151:      	movq	%rax, %r14
    1154:      	movq	%r13, -0x50(%rbp)
    1158:      	jmp	0x14af <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x14af>
    115d:      	movq	%rax, %r14
    1160:      	xorl	%eax, %eax
    1162:      	nopw	%cs:(%rax,%rax)
    1170:      	movw	$0x0, -0xa80(%rbp,%rax)
    117a:      	movw	$0x0, -0xa7e(%rbp,%rax)
    1184:      	movw	$0x0, -0xa7c(%rbp,%rax)
    118e:      	movw	$0x0, -0xa7a(%rbp,%rax)
    1198:      	movw	$0x0, -0xa78(%rbp,%rax)
    11a2:      	movw	$0x0, -0xa76(%rbp,%rax)
    11ac:      	movw	$0x0, -0xa74(%rbp,%rax)
    11b6:      	movw	$0x0, -0xa72(%rbp,%rax)
    11c0:      	addq	$0x10, %rax
    11c4:      	cmpq	$0x200, %rax            # imm = 0x200
    11ca:      	jne	0x1170 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1170>
    11cc:      	jmp	0x123c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x123c>
    11ce:      	movq	%rax, %r14
    11d1:      	xorl	%eax, %eax
    11d3:      	nopw	%cs:(%rax,%rax)
    11e0:      	movw	$0x0, -0x280(%rbp,%rax)
    11ea:      	movw	$0x0, -0x27e(%rbp,%rax)
    11f4:      	movw	$0x0, -0x27c(%rbp,%rax)
    11fe:      	movw	$0x0, -0x27a(%rbp,%rax)
    1208:      	movw	$0x0, -0x278(%rbp,%rax)
    1212:      	movw	$0x0, -0x276(%rbp,%rax)
    121c:      	movw	$0x0, -0x274(%rbp,%rax)
    1226:      	movw	$0x0, -0x272(%rbp,%rax)
    1230:      	addq	$0x10, %rax
    1234:      	cmpq	$0x200, %rax            # imm = 0x200
    123a:      	jne	0x11e0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x11e0>
    123c:      	xorl	%eax, %eax
    123e:      	nop
    1240:      	movw	$0x0, -0x480(%rbp,%rax)
    124a:      	movw	$0x0, -0x47e(%rbp,%rax)
    1254:      	movw	$0x0, -0x47c(%rbp,%rax)
    125e:      	movw	$0x0, -0x47a(%rbp,%rax)
    1268:      	movw	$0x0, -0x478(%rbp,%rax)
    1272:      	movw	$0x0, -0x476(%rbp,%rax)
    127c:      	movw	$0x0, -0x474(%rbp,%rax)
    1286:      	movw	$0x0, -0x472(%rbp,%rax)
    1290:      	addq	$0x10, %rax
    1294:      	cmpq	$0x200, %rax            # imm = 0x200
    129a:      	jne	0x1240 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1240>
    129c:      	jmp	0x130c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x130c>
    129e:      	movq	%rax, %r14
    12a1:      	xorl	%eax, %eax
    12a3:      	nopw	%cs:(%rax,%rax)
    12b0:      	movw	$0x0, -0xa80(%rbp,%rax)
    12ba:      	movw	$0x0, -0xa7e(%rbp,%rax)
    12c4:      	movw	$0x0, -0xa7c(%rbp,%rax)
    12ce:      	movw	$0x0, -0xa7a(%rbp,%rax)
    12d8:      	movw	$0x0, -0xa78(%rbp,%rax)
    12e2:      	movw	$0x0, -0xa76(%rbp,%rax)
    12ec:      	movw	$0x0, -0xa74(%rbp,%rax)
    12f6:      	movw	$0x0, -0xa72(%rbp,%rax)
    1300:      	addq	$0x10, %rax
    1304:      	cmpq	$0x200, %rax            # imm = 0x200
    130a:      	jne	0x12b0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x12b0>
    130c:      	pxor	%xmm0, %xmm0
    1310:      	movdqa	%xmm0, -0x40(%rbp)
    1315:      	movaps	-0x40(%rbp), %xmm1
    1319:      	movaps	%xmm1, -0x60(%rbp)
    131d:      	movdqa	%xmm0, -0x40(%rbp)
    1322:      	movaps	-0x40(%rbp), %xmm0
    1326:      	movaps	%xmm0, -0x50(%rbp)
    132a:      	xorl	%eax, %eax
    132c:      	nopl	(%rax)
    1330:      	movw	$0x0, -0x1080(%rbp,%rax)
    133a:      	movw	$0x0, -0x107e(%rbp,%rax)
    1344:      	movw	$0x0, -0x107c(%rbp,%rax)
    134e:      	movw	$0x0, -0x107a(%rbp,%rax)
    1358:      	movw	$0x0, -0x1078(%rbp,%rax)
    1362:      	movw	$0x0, -0x1076(%rbp,%rax)
    136c:      	movw	$0x0, -0x1074(%rbp,%rax)
    1376:      	movw	$0x0, -0x1072(%rbp,%rax)
    1380:      	addq	$0x10, %rax
    1384:      	cmpq	$0x200, %rax            # imm = 0x200
    138a:      	jne	0x1330 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1330>
    138c:      	xorl	%eax, %eax
    138e:      	nop
    1390:      	movw	$0x0, -0xe80(%rbp,%rax)
    139a:      	movw	$0x0, -0xe7e(%rbp,%rax)
    13a4:      	movw	$0x0, -0xe7c(%rbp,%rax)
    13ae:      	movw	$0x0, -0xe7a(%rbp,%rax)
    13b8:      	movw	$0x0, -0xe78(%rbp,%rax)
    13c2:      	movw	$0x0, -0xe76(%rbp,%rax)
    13cc:      	movw	$0x0, -0xe74(%rbp,%rax)
    13d6:      	movw	$0x0, -0xe72(%rbp,%rax)
    13e0:      	addq	$0x10, %rax
    13e4:      	cmpq	$0x200, %rax            # imm = 0x200
    13ea:      	jne	0x1390 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1390>
    13ec:      	xorl	%eax, %eax
    13ee:      	nop
    13f0:      	movw	$0x0, -0xc80(%rbp,%rax)
    13fa:      	movw	$0x0, -0xc7e(%rbp,%rax)
    1404:      	movw	$0x0, -0xc7c(%rbp,%rax)
    140e:      	movw	$0x0, -0xc7a(%rbp,%rax)
    1418:      	movw	$0x0, -0xc78(%rbp,%rax)
    1422:      	movw	$0x0, -0xc76(%rbp,%rax)
    142c:      	movw	$0x0, -0xc74(%rbp,%rax)
    1436:      	movw	$0x0, -0xc72(%rbp,%rax)
    1440:      	addq	$0x10, %rax
    1444:      	cmpq	$0x200, %rax            # imm = 0x200
    144a:      	jne	0x13f0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x13f0>
    144c:      	jmp	0x14b8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x14b8>
    144e:      	movq	%rax, %r14
    1451:      	xorl	%eax, %eax
    1453:      	movw	$0x0, -0x1080(%rbp,%rax)
    145d:      	movw	$0x0, -0x107e(%rbp,%rax)
    1467:      	movw	$0x0, -0x107c(%rbp,%rax)
    1471:      	movw	$0x0, -0x107a(%rbp,%rax)
    147b:      	movw	$0x0, -0x1078(%rbp,%rax)
    1485:      	movw	$0x0, -0x1076(%rbp,%rax)
    148f:      	movw	$0x0, -0x1074(%rbp,%rax)
    1499:      	movw	$0x0, -0x1072(%rbp,%rax)
    14a3:      	addq	$0x10, %rax
    14a7:      	cmpq	$0x200, %rax            # imm = 0x200
    14ad:      	jne	0x1453 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1453>
    14af:      	leaq	-0x60(%rbp), %rdi
    14b3:      	callq	0x14b8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x14b8>
    14b8:      	movq	%rbx, %rdi
    14bb:      	callq	0x14c0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x14c0>
    14c0:      	movq	%r14, %rdi
    14c3:      	callq	0x14c8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x14c8>
    14c8:      	callq	0x14cd <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x14cd>

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

~/.claude/jobs/2280e09e/tmp/scratchpad/agents/mlkem/target-rlib/x86_64-unknown-toyos/toyos/libtoyos_crypto.rlib(toyos_crypto-d55b0841b948afee.2ram1ocbntcacqk0me8ebi5o4.0acy6cv.rcgu.o):	file format elf64-x86-64

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

0000000000000000 <toyos_crypto::keccak::permute (.llvm.17976581313314788243)>:
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
     4b0:      	leaq	(%rip), %rdx            # 0x4b7 <toyos_crypto::keccak::permute (.llvm.17976581313314788243)+0x4b7>
     4b7:      	movq	-0x108(%rbp), %rdi
     4be:      	movq	-0x50(%rbp), %r14
     4c2:      	xorq	(%rdi,%rdx), %r14
     4c6:      	xorq	-0xc0(%rbp), %r14
     4cd:      	movq	%r14, -0x50(%rbp)
     4d1:      	leaq	0x8(%rdi), %rdx
     4d5:      	cmpq	$0xc0, %rdx
     4dc:      	jne	0xe0 <toyos_crypto::keccak::permute (.llvm.17976581313314788243)+0xe0>
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

~/.claude/jobs/2280e09e/tmp/scratchpad/agents/mlkem/target-rlib/x86_64-unknown-toyos/toyos/libtoyos_crypto.rlib(toyos_crypto-d55b0841b948afee.e9e023su5zr58yv99ezecp7gn.0acy6cv.rcgu.o):	file format elf64-x86-64

