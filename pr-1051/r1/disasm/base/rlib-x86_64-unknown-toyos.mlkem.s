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
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%r13
       a:      	pushq	%r12
       c:      	pushq	%rbx
       d:      	subq	$0x408, %rsp            # imm = 0x408
      14:      	movq	%rdi, %rbx
      17:      	cmpq	$0x4a0, %rdx            # imm = 0x4A0
      1e:      	jne	0x2bf <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2bf>
      24:      	movq	%rsi, %r14
      27:      	xorl	%r13d, %r13d
      2a:      	leaq	-0x428(%rbp), %r15
      31:      	leaq	(%r14,%r13), %r12
      35:      	movl	$0x200, %edx            # imm = 0x200
      3a:      	movq	%r15, %rdi
      3d:      	xorl	%esi, %esi
      3f:      	callq	0x44 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x44>
      44:      	xorl	%eax, %eax
      46:      	movq	%r15, %rdx
      49:      	nopl	(%rax)
      50:      	movq	%rax, %rcx
      53:      	shrq	$0x3, %rcx
      57:      	movzbl	(%r12,%rcx), %r9d
      5c:      	movl	%eax, %ecx
      5e:      	andb	$0x4, %cl
      61:      	movzbl	%cl, %esi
      64:      	xorl	%r8d, %r8d
      67:      	btl	%esi, %r9d
      6b:      	setb	%r8b
      6f:      	leal	0x1(%rsi), %ecx
      72:      	movl	%r9d, %r10d
      75:      	shrl	%cl, %r10d
      78:      	orw	(%rdx), %r8w
      7c:      	leal	0x2(%rsi), %ecx
      7f:      	movl	%r9d, %edi
      82:      	shrl	%cl, %edi
      84:      	addl	%r10d, %r10d
      87:      	andl	$0x2, %r10d
      8b:      	shll	$0x2, %edi
      8e:      	leal	0x3(%rsi), %ecx
      91:      	shrl	%cl, %r9d
      94:      	andl	$0x4, %edi
      97:      	orl	%r10d, %edi
      9a:      	shll	$0x3, %r9d
      9e:      	leaq	0x4(%rax), %rcx
      a2:      	movq	%rcx, %r10
      a5:      	shrq	$0x3, %r10
      a9:      	movzbl	(%r12,%r10), %r10d
      ae:      	andb	$0x4, %cl
      b1:      	shrl	%cl, %r10d
      b4:      	andl	$0x8, %r9d
      b8:      	orl	%edi, %r9d
      bb:      	shll	$0x4, %r10d
      bf:      	leaq	0x5(%rax), %rcx
      c3:      	movq	%rcx, %rdi
      c6:      	shrq	$0x3, %rdi
      ca:      	movzbl	(%r12,%rdi), %edi
      cf:      	andb	$0x5, %cl
      d2:      	shrl	%cl, %edi
      d4:      	andl	$0x10, %r10d
      d8:      	orl	%r9d, %r10d
      db:      	shll	$0x5, %edi
      de:      	andl	$0x20, %edi
      e1:      	orl	%r10d, %edi
      e4:      	orl	%r8d, %edi
      e7:      	leaq	0x6(%rax), %rcx
      eb:      	movq	%rcx, %r8
      ee:      	shrq	$0x3, %r8
      f2:      	movzbl	(%r12,%r8), %r8d
      f7:      	andb	$0x6, %cl
      fa:      	shrl	%cl, %r8d
      fd:      	leaq	0x7(%rax), %rcx
     101:      	movq	%rcx, %r9
     104:      	shrq	$0x3, %r9
     108:      	movzbl	(%r12,%r9), %r9d
     10d:      	andb	$0x7, %cl
     110:      	shrb	%cl, %r9b
     113:      	shll	$0x6, %r8d
     117:      	andl	$0x40, %r8d
     11b:      	shlb	$0x7, %r9b
     11f:      	movzbl	%r9b, %ecx
     123:      	orl	%r8d, %ecx
     126:      	leaq	0x8(%rax), %r8
     12a:      	shrq	$0x3, %r8
     12e:      	movzbl	(%r12,%r8), %r8d
     133:      	xorl	%r9d, %r9d
     136:      	btl	%esi, %r8d
     13a:      	setb	%r9b
     13e:      	shll	$0x8, %r9d
     142:      	orl	%ecx, %r9d
     145:      	leaq	0x9(%rax), %rcx
     149:      	movq	%rcx, %rsi
     14c:      	shrq	$0x3, %rsi
     150:      	movzbl	(%r12,%rsi), %esi
     155:      	andl	$0x5, %ecx
     158:      	xorl	%r8d, %r8d
     15b:      	btl	%ecx, %esi
     15e:      	setb	%r8b
     162:      	shll	$0x9, %r8d
     166:      	orl	%r9d, %r8d
     169:      	leaq	0xa(%rax), %rcx
     16d:      	movq	%rcx, %rsi
     170:      	shrq	$0x3, %rsi
     174:      	movzbl	(%r12,%rsi), %esi
     179:      	andl	$0x6, %ecx
     17c:      	xorl	%r9d, %r9d
     17f:      	btl	%ecx, %esi
     182:      	setb	%r9b
     186:      	shll	$0xa, %r9d
     18a:      	orl	%r8d, %r9d
     18d:      	orl	%edi, %r9d
     190:      	leaq	0xb(%rax), %rcx
     194:      	movq	%rcx, %rsi
     197:      	shrq	$0x3, %rsi
     19b:      	movzbl	(%r12,%rsi), %esi
     1a0:      	andl	$0x7, %ecx
     1a3:      	xorl	%edi, %edi
     1a5:      	btl	%ecx, %esi
     1a8:      	setb	%dil
     1ac:      	shll	$0xb, %edi
     1af:      	orl	%r9d, %edi
     1b2:      	movw	%di, (%rdx)
     1b5:      	addq	$0x2, %rdx
     1b9:      	addq	$0xc, %rax
     1bd:      	cmpq	$0xc00, %rax            # imm = 0xC00
     1c3:      	jne	0x50 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x50>
     1c9:      	addq	$0x180, %r13            # imm = 0x180
     1d0:      	movl	$0x200, %edx            # imm = 0x200
     1d5:      	leaq	-0x228(%rbp), %rdi
     1dc:      	movq	%r15, %rsi
     1df:      	callq	0x1e4 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x1e4>
     1e4:      	xorl	%eax, %eax
     1e6:      	nopw	%cs:(%rax,%rax)
     1f0:      	cmpq	$0x200, %rax            # imm = 0x200
     1f6:      	je	0x23d <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x23d>
     1f8:      	cmpw	$0xd00, -0x228(%rbp,%rax) # imm = 0xD00
     202:      	ja	0x2c6 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2c6>
     208:      	cmpw	$0xd00, -0x226(%rbp,%rax) # imm = 0xD00
     212:      	ja	0x2c6 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2c6>
     218:      	cmpw	$0xd00, -0x224(%rbp,%rax) # imm = 0xD00
     222:      	ja	0x2c6 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2c6>
     228:      	cmpw	$0xd00, -0x222(%rbp,%rax) # imm = 0xD00
     232:      	leaq	0x8(%rax), %rax
     236:      	jbe	0x1f0 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x1f0>
     238:      	jmp	0x2c6 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2c6>
     23d:      	xorl	%eax, %eax
     23f:      	nop
     240:      	movw	$0x0, -0x228(%rbp,%rax)
     24a:      	movw	$0x0, -0x226(%rbp,%rax)
     254:      	movw	$0x0, -0x224(%rbp,%rax)
     25e:      	movw	$0x0, -0x222(%rbp,%rax)
     268:      	movw	$0x0, -0x220(%rbp,%rax)
     272:      	movw	$0x0, -0x21e(%rbp,%rax)
     27c:      	movw	$0x0, -0x21c(%rbp,%rax)
     286:      	movw	$0x0, -0x21a(%rbp,%rax)
     290:      	addq	$0x10, %rax
     294:      	cmpq	$0x200, %rax            # imm = 0x200
     29a:      	jne	0x240 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x240>
     29c:      	cmpq	$0x480, %r13            # imm = 0x480
     2a3:      	jne	0x31 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x31>
     2a9:      	leaq	0x1(%rbx), %rdi
     2ad:      	movl	$0x4a0, %edx            # imm = 0x4A0
     2b2:      	movq	%r14, %rsi
     2b5:      	callq	0x2ba <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2ba>
     2ba:      	movb	$0x0, (%rbx)
     2bd:      	jmp	0x32c <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x32c>
     2bf:      	movw	$0x1, (%rbx)
     2c4:      	jmp	0x32c <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x32c>
     2c6:      	movw	$0x201, (%rbx)          # imm = 0x201
     2cb:      	xorl	%eax, %eax
     2cd:      	nopl	(%rax)
     2d0:      	movw	$0x0, -0x228(%rbp,%rax)
     2da:      	movw	$0x0, -0x226(%rbp,%rax)
     2e4:      	movw	$0x0, -0x224(%rbp,%rax)
     2ee:      	movw	$0x0, -0x222(%rbp,%rax)
     2f8:      	movw	$0x0, -0x220(%rbp,%rax)
     302:      	movw	$0x0, -0x21e(%rbp,%rax)
     30c:      	movw	$0x0, -0x21c(%rbp,%rax)
     316:      	movw	$0x0, -0x21a(%rbp,%rax)
     320:      	addq	$0x10, %rax
     324:      	cmpq	$0x200, %rax            # imm = 0x200
     32a:      	jne	0x2d0 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2d0>
     32c:      	movq	%rbx, %rax
     32f:      	addq	$0x408, %rsp            # imm = 0x408
     336:      	popq	%rbx
     337:      	popq	%r12
     339:      	popq	%r13
     33b:      	popq	%r14
     33d:      	popq	%r15
     33f:      	popq	%rbp
     340:      	retq

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
      1c:      	subq	$0xa38, %rsp            # imm = 0xA38
      23:      	movq	%rdx, -0x58(%rbp)
      27:      	movq	%rsi, -0x48(%rbp)
      2b:      	movq	%rdi, %r15
      2e:      	leaq	-0x1a60(%rbp), %rax
      35:      	movq	%rax, -0x860(%rbp)
      3c:      	movq	$0x3, -0x858(%rbp)
      47:      	xorl	%r14d, %r14d
      4a:      	leaq	-0x1060(%rbp), %rdi
      51:      	movq	%rcx, -0x38(%rbp)
      55:      	movq	%rcx, %rsi
      58:      	xorl	%edx, %edx
      5a:      	callq	0x5f <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5f>
      5f:      	xorl	%r14d, %r14d
      62:      	leaq	-0x660(%rbp), %rdi
      69:      	leaq	-0x1060(%rbp), %rsi
      70:      	callq	0x75 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x75>
      75:      	leaq	-0x260(%rbp), %rbx
      7c:      	leaq	-0x660(%rbp), %rsi
      83:      	movl	$0x200, %edx            # imm = 0x200
      88:      	movq	%rbx, %rdi
      8b:      	callq	0x90 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x90>
      90:      	leaq	-0xa60(%rbp), %r14
      97:      	movl	$0x200, %edx            # imm = 0x200
      9c:      	movq	%r14, %rdi
      9f:      	movq	%rbx, %rsi
      a2:      	callq	0xa7 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa7>
      a7:      	leaq	-0x460(%rbp), %rbx
      ae:      	movl	$0x200, %edx            # imm = 0x200
      b3:      	movq	%rbx, %rdi
      b6:      	movq	%r14, %rsi
      b9:      	callq	0xbe <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbe>
      be:      	leaq	-0x1a60(%rbp), %rdi
      c5:      	movl	$0x200, %edx            # imm = 0x200
      ca:      	movq	%rbx, %rsi
      cd:      	callq	0xd2 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd2>
      d2:      	movl	$0x1, %r14d
      d8:      	leaq	-0x1060(%rbp), %rdi
      df:      	movq	-0x38(%rbp), %rsi
      e3:      	movl	$0x1, %edx
      e8:      	callq	0xed <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xed>
      ed:      	leaq	-0x660(%rbp), %rdi
      f4:      	leaq	-0x1060(%rbp), %rsi
      fb:      	callq	0x100 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x100>
     100:      	leaq	-0x260(%rbp), %rbx
     107:      	leaq	-0x660(%rbp), %rsi
     10e:      	movl	$0x200, %edx            # imm = 0x200
     113:      	movq	%rbx, %rdi
     116:      	callq	0x11b <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x11b>
     11b:      	leaq	-0xa60(%rbp), %r14
     122:      	movl	$0x200, %edx            # imm = 0x200
     127:      	movq	%r14, %rdi
     12a:      	movq	%rbx, %rsi
     12d:      	callq	0x132 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x132>
     132:      	leaq	-0x460(%rbp), %rbx
     139:      	movl	$0x200, %edx            # imm = 0x200
     13e:      	movq	%rbx, %rdi
     141:      	movq	%r14, %rsi
     144:      	callq	0x149 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x149>
     149:      	leaq	-0x1860(%rbp), %rdi
     150:      	movl	$0x200, %edx            # imm = 0x200
     155:      	movq	%rbx, %rsi
     158:      	callq	0x15d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x15d>
     15d:      	movl	$0x2, %r14d
     163:      	leaq	-0x1060(%rbp), %rdi
     16a:      	movq	-0x38(%rbp), %rsi
     16e:      	movl	$0x2, %edx
     173:      	callq	0x178 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x178>
     178:      	leaq	-0x660(%rbp), %rdi
     17f:      	leaq	-0x1060(%rbp), %rsi
     186:      	callq	0x18b <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x18b>
     18b:      	movq	%r15, -0x50(%rbp)
     18f:      	movq	-0x48(%rbp), %rax
     193:      	addq	$0x480, %rax            # imm = 0x480
     199:      	movq	%rax, -0x40(%rbp)
     19d:      	leaq	-0x260(%rbp), %rbx
     1a4:      	leaq	-0x660(%rbp), %rsi
     1ab:      	movl	$0x200, %edx            # imm = 0x200
     1b0:      	movq	%rbx, %rdi
     1b3:      	callq	0x1b8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1b8>
     1b8:      	leaq	-0xa60(%rbp), %r14
     1bf:      	movl	$0x200, %edx            # imm = 0x200
     1c4:      	movq	%r14, %rdi
     1c7:      	movq	%rbx, %rsi
     1ca:      	callq	0x1cf <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1cf>
     1cf:      	leaq	-0x460(%rbp), %r12
     1d6:      	movl	$0x200, %edx            # imm = 0x200
     1db:      	movq	%r12, %rdi
     1de:      	movq	%r14, %rsi
     1e1:      	callq	0x1e6 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1e6>
     1e6:      	leaq	-0x1660(%rbp), %rdi
     1ed:      	movl	$0x200, %edx            # imm = 0x200
     1f2:      	movq	%r12, %rsi
     1f5:      	callq	0x1fa <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1fa>
     1fa:      	leaq	-0x1060(%rbp), %rdi
     201:      	leaq	-0x1a60(%rbp), %rsi
     208:      	movl	$0x600, %edx            # imm = 0x600
     20d:      	callq	0x212 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x212>
     212:      	leaq	-0x1a60(%rbp), %rdi
     219:      	xorl	%r14d, %r14d
     21c:      	movl	$0x440, %edx            # imm = 0x440
     221:      	xorl	%esi, %esi
     223:      	callq	0x228 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x228>
     228:      	movl	$0x9d7dbb41, %ebx       # imm = 0x9D7DBB41
     22d:      	nopl	(%rax)
     230:      	movq	%r14, -0x30(%rbp)
     234:      	leaq	0x1(%r14), %rax
     238:      	movq	%rax, -0x60(%rbp)
     23c:      	movl	$0x200, %edx            # imm = 0x200
     241:      	leaq	-0x860(%rbp), %rdi
     248:      	xorl	%esi, %esi
     24a:      	callq	0x24f <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x24f>
     24f:      	xorl	%r15d, %r15d
     252:      	xorl	%r13d, %r13d
     255:      	nopw	%cs:(%rax,%rax)
     260:      	leaq	-0x660(%rbp), %rdi
     267:      	movq	-0x40(%rbp), %rsi
     26b:      	movq	%r15, %rdx
     26e:      	movq	-0x30(%rbp), %rcx
     272:      	callq	0x277 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x277>
     277:      	leaq	-0x1060(,%r13), %r14
     27f:      	addq	%rbp, %r14
     282:      	addq	$0x200, %r13            # imm = 0x200
     289:      	incq	%r15
     28c:      	movl	$0x200, %edx            # imm = 0x200
     291:      	movq	%r12, %rdi
     294:      	xorl	%esi, %esi
     296:      	callq	0x29b <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x29b>
     29b:      	xorl	%eax, %eax
     29d:      	jmp	0x3c8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3c8>
     2a2:      	nopw	%cs:(%rax,%rax)
     2b0:      	movzwl	-0x660(%rbp,%rax,4), %edi
     2b8:      	movzwl	(%r14,%rax,4), %edx
     2bd:      	movl	%edx, %r9d
     2c0:      	imull	%edi, %r9d
     2c4:      	imulq	$0x3afb7681, %r9, %rsi  # imm = 0x3AFB7681
     2cb:      	shrq	$0x20, %rsi
     2cf:      	movl	%r9d, %r8d
     2d2:      	subl	%esi, %r8d
     2d5:      	shrl	%r8d
     2d8:      	addl	%esi, %r8d
     2db:      	shrl	$0xb, %r8d
     2df:      	imull	$0xd01, %r8d, %esi      # imm = 0xD01
     2e6:      	subl	%esi, %r9d
     2e9:      	movzwl	-0x65e(%rbp,%rax,4), %r8d
     2f2:      	movzwl	0x2(%r14,%rax,4), %esi
     2f8:      	movl	%esi, %r10d
     2fb:      	imull	%r8d, %r10d
     2ff:      	imulq	$0x3afb7681, %r10, %r11 # imm = 0x3AFB7681
     306:      	shrq	$0x20, %r11
     30a:      	movl	%r10d, %r12d
     30d:      	subl	%r11d, %r12d
     310:      	shrl	%r12d
     313:      	addl	%r11d, %r12d
     316:      	shrl	$0xb, %r12d
     31a:      	imull	$0xd01, %r12d, %r11d    # imm = 0xD01
     321:      	subl	%r11d, %r10d
     324:      	movzwl	%cx, %ecx
     327:      	imull	%r10d, %ecx
     32b:      	imulq	$0x13afb769, %rcx, %r10 # imm = 0x13AFB769
     332:      	shrq	$0x28, %r10
     336:      	imull	$0xd01, %r10d, %r10d    # imm = 0xD01
     33d:      	subl	%r10d, %ecx
     340:      	addl	%r9d, %ecx
     343:      	leal	-0xd01(%rcx), %r9d
     34a:      	cmpl	$0xd01, %ecx            # imm = 0xD01
     350:      	cmovbl	%ecx, %r9d
     354:      	movw	%r9w, -0x460(%rbp,%rax,4)
     35d:      	imull	%edi, %esi
     360:      	imulq	$0x3afb7681, %rsi, %rcx # imm = 0x3AFB7681
     367:      	shrq	$0x20, %rcx
     36b:      	movl	%esi, %edi
     36d:      	subl	%ecx, %edi
     36f:      	shrl	%edi
     371:      	addl	%ecx, %edi
     373:      	shrl	$0xb, %edi
     376:      	imull	$0xd01, %edi, %ecx      # imm = 0xD01
     37c:      	subl	%ecx, %esi
     37e:      	imull	%r8d, %edx
     382:      	imulq	$0x3afb7681, %rdx, %rcx # imm = 0x3AFB7681
     389:      	shrq	$0x20, %rcx
     38d:      	movl	%edx, %edi
     38f:      	subl	%ecx, %edi
     391:      	shrl	%edi
     393:      	addl	%ecx, %edi
     395:      	shrl	$0xb, %edi
     398:      	imull	$0xd01, %edi, %ecx      # imm = 0xD01
     39e:      	subl	%ecx, %edx
     3a0:      	addl	%esi, %edx
     3a2:      	leal	-0xd01(%rdx), %ecx
     3a8:      	cmpl	$0xd01, %edx            # imm = 0xD01
     3ae:      	cmovbl	%edx, %ecx
     3b1:      	movw	%cx, -0x45e(%rbp,%rax,4)
     3b9:      	incq	%rax
     3bc:      	cmpq	$0x80, %rax
     3c2:      	je	0x460 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x460>
     3c8:      	movl	%eax, %ecx
     3ca:      	rolb	$0x4, %cl
     3cd:      	orb	$0x8, %cl
     3d0:      	movl	%ecx, %edx
     3d2:      	andb	$0x33, %dl
     3d5:      	shlb	$0x2, %dl
     3d8:      	shrb	$0x2, %cl
     3db:      	andb	$0x33, %cl
     3de:      	orb	%dl, %cl
     3e0:      	movl	%ecx, %edx
     3e2:      	andb	$0x55, %dl
     3e5:      	addb	%dl, %dl
     3e7:      	shrb	%cl
     3e9:      	andb	$0x55, %cl
     3ec:      	orb	%dl, %cl
     3ee:      	movzbl	%cl, %edx
     3f1:      	movw	$0x1, %cx
     3f5:      	movw	$0x11, %si
     3f9:      	jmp	0x41e <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x41e>
     3fb:      	nopl	(%rax,%rax)
     400:      	imull	%esi, %esi
     403:      	movq	%rsi, %rdi
     406:      	imulq	%rbx, %rdi
     40a:      	shrq	$0x2b, %rdi
     40e:      	imull	$0xd01, %edi, %edi      # imm = 0xD01
     414:      	subl	%edi, %esi
     416:      	shrl	%edx
     418:      	je	0x2b0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x2b0>
     41e:      	movzwl	%si, %esi
     421:      	testb	$0x1, %dl
     424:      	je	0x400 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x400>
     426:      	movzwl	%cx, %ecx
     429:      	imull	%esi, %ecx
     42c:      	imulq	$0x3afb7681, %rcx, %rdi # imm = 0x3AFB7681
     433:      	shrq	$0x20, %rdi
     437:      	movl	%ecx, %r8d
     43a:      	subl	%edi, %r8d
     43d:      	shrl	%r8d
     440:      	addl	%edi, %r8d
     443:      	shrl	$0xb, %r8d
     447:      	imull	$0xd01, %r8d, %edi      # imm = 0xD01
     44e:      	subl	%edi, %ecx
     450:      	jmp	0x400 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x400>
     452:      	nopw	%cs:(%rax,%rax)
     460:      	movl	$0x200, %edx            # imm = 0x200
     465:      	leaq	-0x260(%rbp), %rdi
     46c:      	leaq	-0x460(%rbp), %r12
     473:      	movq	%r12, %rsi
     476:      	callq	0x47b <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x47b>
     47b:      	xorl	%eax, %eax
     47d:      	movdqa	(%rip), %xmm4           # 0x485 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x485>
     485:      	movdqa	(%rip), %xmm5           # 0x48d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x48d>
     48d:      	pxor	%xmm6, %xmm6
     491:      	nopw	%cs:(%rax,%rax)
     4a0:      	movdqu	-0x860(%rbp,%rax,2), %xmm2
     4a9:      	movdqu	-0x260(%rbp,%rax,2), %xmm0
     4b2:      	movdqa	%xmm2, %xmm3
     4b6:      	punpckhwd	%xmm6, %xmm3    # xmm3 = xmm3[4],xmm6[4],xmm3[5],xmm6[5],xmm3[6],xmm6[6],xmm3[7],xmm6[7]
     4ba:      	punpcklwd	%xmm6, %xmm2    # xmm2 = xmm2[0],xmm6[0],xmm2[1],xmm6[1],xmm2[2],xmm6[2],xmm2[3],xmm6[3]
     4be:      	movdqa	%xmm0, %xmm1
     4c2:      	punpckhwd	%xmm6, %xmm1    # xmm1 = xmm1[4],xmm6[4],xmm1[5],xmm6[5],xmm1[6],xmm6[6],xmm1[7],xmm6[7]
     4c6:      	paddd	%xmm3, %xmm1
     4ca:      	punpcklwd	%xmm6, %xmm0    # xmm0 = xmm0[0],xmm6[0],xmm0[1],xmm6[1],xmm0[2],xmm6[2],xmm0[3],xmm6[3]
     4ce:      	paddd	%xmm2, %xmm0
     4d2:      	movdqa	%xmm1, %xmm2
     4d6:      	pmuludq	%xmm4, %xmm2
     4da:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
     4df:      	pshufd	$0xf5, %xmm1, %xmm3     # xmm3 = xmm1[1,1,3,3]
     4e4:      	pmuludq	%xmm4, %xmm3
     4e8:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
     4ed:      	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
     4f1:      	pmaddwd	%xmm5, %xmm2
     4f5:      	psubd	%xmm2, %xmm1
     4f9:      	movdqa	%xmm0, %xmm2
     4fd:      	pmuludq	%xmm4, %xmm2
     501:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
     506:      	pshufd	$0xf5, %xmm0, %xmm3     # xmm3 = xmm0[1,1,3,3]
     50b:      	pmuludq	%xmm4, %xmm3
     50f:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
     514:      	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
     518:      	pmaddwd	%xmm5, %xmm2
     51c:      	psubd	%xmm2, %xmm0
     520:      	packssdw	%xmm1, %xmm0
     524:      	movdqu	%xmm0, -0x460(%rbp,%rax,2)
     52d:      	addq	$0x8, %rax
     531:      	cmpq	$0x100, %rax            # imm = 0x100
     537:      	jne	0x4a0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4a0>
     53d:      	movl	$0x200, %edx            # imm = 0x200
     542:      	leaq	-0xa60(%rbp), %r14
     549:      	movq	%r14, %rdi
     54c:      	movq	%r12, %rsi
     54f:      	callq	0x554 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x554>
     554:      	movl	$0xe, %eax
     559:      	nopl	(%rax)
     560:      	movw	$0x0, -0x86e(%rbp,%rax)
     56a:      	movw	$0x0, -0x86c(%rbp,%rax)
     574:      	movw	$0x0, -0x86a(%rbp,%rax)
     57e:      	movw	$0x0, -0x868(%rbp,%rax)
     588:      	movw	$0x0, -0x866(%rbp,%rax)
     592:      	movw	$0x0, -0x864(%rbp,%rax)
     59c:      	movw	$0x0, -0x862(%rbp,%rax)
     5a6:      	movw	$0x0, -0x860(%rbp,%rax)
     5b0:      	addq	$0x10, %rax
     5b4:      	cmpq	$0x20e, %rax            # imm = 0x20E
     5ba:      	jne	0x560 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x560>
     5bc:      	movl	$0x200, %edx            # imm = 0x200
     5c1:      	leaq	-0x860(%rbp), %rdi
     5c8:      	movq	%r14, %rsi
     5cb:      	callq	0x5d0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5d0>
     5d0:      	xorl	%eax, %eax
     5d2:      	nopw	%cs:(%rax,%rax)
     5e0:      	movw	$0x0, -0x260(%rbp,%rax)
     5ea:      	movw	$0x0, -0x25e(%rbp,%rax)
     5f4:      	movw	$0x0, -0x25c(%rbp,%rax)
     5fe:      	movw	$0x0, -0x25a(%rbp,%rax)
     608:      	movw	$0x0, -0x258(%rbp,%rax)
     612:      	movw	$0x0, -0x256(%rbp,%rax)
     61c:      	movw	$0x0, -0x254(%rbp,%rax)
     626:      	movw	$0x0, -0x252(%rbp,%rax)
     630:      	addq	$0x10, %rax
     634:      	cmpq	$0x200, %rax            # imm = 0x200
     63a:      	jne	0x5e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5e0>
     63c:      	xorl	%eax, %eax
     63e:      	nop
     640:      	movw	$0x0, -0x660(%rbp,%rax)
     64a:      	movw	$0x0, -0x65e(%rbp,%rax)
     654:      	movw	$0x0, -0x65c(%rbp,%rax)
     65e:      	movw	$0x0, -0x65a(%rbp,%rax)
     668:      	movw	$0x0, -0x658(%rbp,%rax)
     672:      	movw	$0x0, -0x656(%rbp,%rax)
     67c:      	movw	$0x0, -0x654(%rbp,%rax)
     686:      	movw	$0x0, -0x652(%rbp,%rax)
     690:      	addq	$0x10, %rax
     694:      	cmpq	$0x200, %rax            # imm = 0x200
     69a:      	jne	0x640 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x640>
     69c:      	cmpq	$0x600, %r13            # imm = 0x600
     6a3:      	jne	0x260 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x260>
     6a9:      	movl	$0x200, %edx            # imm = 0x200
     6ae:      	movq	%r12, %rdi
     6b1:      	leaq	-0x860(%rbp), %rsi
     6b8:      	callq	0x6bd <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x6bd>
     6bd:      	leaq	-0x260(%rbp), %rdi
     6c4:      	movq	%r12, %rsi
     6c7:      	callq	0x6cc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x6cc>
     6cc:      	movq	-0x30(%rbp), %r15
     6d0:      	leal	0x3(%r15), %eax
     6d4:      	movzbl	%al, %edx
     6d7:      	leaq	-0x660(%rbp), %rdi
     6de:      	movq	-0x38(%rbp), %rsi
     6e2:      	callq	0x6e7 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x6e7>
     6e7:      	xorl	%eax, %eax
     6e9:      	movdqa	(%rip), %xmm4           # 0x6f1 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x6f1>
     6f1:      	movdqa	(%rip), %xmm5           # 0x6f9 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x6f9>
     6f9:      	pxor	%xmm6, %xmm6
     6fd:      	nopl	(%rax)
     700:      	movdqu	-0x260(%rbp,%rax,2), %xmm2
     709:      	movdqu	-0x660(%rbp,%rax,2), %xmm0
     712:      	movdqa	%xmm2, %xmm3
     716:      	punpckhwd	%xmm6, %xmm3    # xmm3 = xmm3[4],xmm6[4],xmm3[5],xmm6[5],xmm3[6],xmm6[6],xmm3[7],xmm6[7]
     71a:      	punpcklwd	%xmm6, %xmm2    # xmm2 = xmm2[0],xmm6[0],xmm2[1],xmm6[1],xmm2[2],xmm6[2],xmm2[3],xmm6[3]
     71e:      	movdqa	%xmm0, %xmm1
     722:      	punpckhwd	%xmm6, %xmm1    # xmm1 = xmm1[4],xmm6[4],xmm1[5],xmm6[5],xmm1[6],xmm6[6],xmm1[7],xmm6[7]
     726:      	paddd	%xmm3, %xmm1
     72a:      	punpcklwd	%xmm6, %xmm0    # xmm0 = xmm0[0],xmm6[0],xmm0[1],xmm6[1],xmm0[2],xmm6[2],xmm0[3],xmm6[3]
     72e:      	paddd	%xmm2, %xmm0
     732:      	movdqa	%xmm1, %xmm2
     736:      	pmuludq	%xmm4, %xmm2
     73a:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
     73f:      	pshufd	$0xf5, %xmm1, %xmm3     # xmm3 = xmm1[1,1,3,3]
     744:      	pmuludq	%xmm4, %xmm3
     748:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
     74d:      	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
     751:      	pmaddwd	%xmm5, %xmm2
     755:      	psubd	%xmm2, %xmm1
     759:      	movdqa	%xmm0, %xmm2
     75d:      	pmuludq	%xmm4, %xmm2
     761:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
     766:      	pshufd	$0xf5, %xmm0, %xmm3     # xmm3 = xmm0[1,1,3,3]
     76b:      	pmuludq	%xmm4, %xmm3
     76f:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
     774:      	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
     778:      	pmaddwd	%xmm5, %xmm2
     77c:      	psubd	%xmm2, %xmm0
     780:      	packssdw	%xmm1, %xmm0
     784:      	movdqu	%xmm0, -0x460(%rbp,%rax,2)
     78d:      	addq	$0x8, %rax
     791:      	cmpq	$0x100, %rax            # imm = 0x100
     797:      	jne	0x700 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x700>
     79d:      	movl	$0x200, %edx            # imm = 0x200
     7a2:      	movq	%r14, %rdi
     7a5:      	movq	%r12, %rsi
     7a8:      	callq	0x7ad <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7ad>
     7ad:      	pxor	%xmm4, %xmm4
     7b1:      	xorl	%eax, %eax
     7b3:      	movdqa	(%rip), %xmm3           # 0x7bb <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7bb>
     7bb:      	movdqa	(%rip), %xmm5           # 0x7c3 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7c3>
     7c3:      	movdqa	(%rip), %xmm6           # 0x7cb <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7cb>
     7cb:      	nopl	(%rax,%rax)
     7d0:      	movdqu	-0xa60(%rbp,%rax,2), %xmm0
     7d9:      	movdqa	%xmm0, %xmm1
     7dd:      	punpcklwd	%xmm4, %xmm1    # xmm1 = xmm1[0],xmm4[0],xmm1[1],xmm4[1],xmm1[2],xmm4[2],xmm1[3],xmm4[3]
     7e1:      	punpckhwd	%xmm4, %xmm0    # xmm0 = xmm0[4],xmm4[4],xmm0[5],xmm4[5],xmm0[6],xmm4[6],xmm0[7],xmm4[7]
     7e5:      	pslld	$0xa, %xmm0
     7ea:      	pslld	$0xa, %xmm1
     7ef:      	paddd	%xmm3, %xmm1
     7f3:      	paddd	%xmm3, %xmm0
     7f7:      	pshufd	$0xf5, %xmm0, %xmm2     # xmm2 = xmm0[1,1,3,3]
     7fc:      	pmuludq	%xmm5, %xmm0
     800:      	pshufd	$0xed, %xmm0, %xmm0     # xmm0 = xmm0[1,3,2,3]
     805:      	pmuludq	%xmm5, %xmm2
     809:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
     80e:      	punpckldq	%xmm2, %xmm0    # xmm0 = xmm0[0],xmm2[0],xmm0[1],xmm2[1]
     812:      	psrld	$0x7, %xmm0
     817:      	pshufd	$0xf5, %xmm1, %xmm2     # xmm2 = xmm1[1,1,3,3]
     81c:      	pmuludq	%xmm5, %xmm1
     820:      	pshufd	$0xed, %xmm1, %xmm1     # xmm1 = xmm1[1,3,2,3]
     825:      	pmuludq	%xmm5, %xmm2
     829:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
     82e:      	punpckldq	%xmm2, %xmm1    # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
     832:      	psrld	$0x7, %xmm1
     837:      	packssdw	%xmm0, %xmm1
     83b:      	pand	%xmm6, %xmm1
     83f:      	movdqu	%xmm1, -0xa60(%rbp,%rax,2)
     848:      	addq	$0x8, %rax
     84c:      	cmpq	$0x100, %rax            # imm = 0x100
     852:      	jne	0x7d0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7d0>
     858:      	movl	$0x200, %edx            # imm = 0x200
     85d:      	movq	%r12, %rdi
     860:      	movq	%r14, %rsi
     863:      	callq	0x868 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x868>
     868:      	leaq	(%r15,%r15,4), %rax
     86c:      	shlq	$0x6, %rax
     870:      	leaq	(%rax,%rbp), %rdx
     874:      	addq	$-0x1a60, %rdx          # imm = 0xE5A0
     87b:      	movl	$0xa, %esi
     880:      	movl	$0x140, %ecx            # imm = 0x140
     885:      	movq	%r12, %rdi
     888:      	callq	0x88d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x88d>
     88d:      	xorl	%eax, %eax
     88f:      	nop
     890:      	movw	$0x0, -0x460(%rbp,%rax)
     89a:      	movw	$0x0, -0x45e(%rbp,%rax)
     8a4:      	movw	$0x0, -0x45c(%rbp,%rax)
     8ae:      	movw	$0x0, -0x45a(%rbp,%rax)
     8b8:      	movw	$0x0, -0x458(%rbp,%rax)
     8c2:      	movw	$0x0, -0x456(%rbp,%rax)
     8cc:      	movw	$0x0, -0x454(%rbp,%rax)
     8d6:      	movw	$0x0, -0x452(%rbp,%rax)
     8e0:      	addq	$0x10, %rax
     8e4:      	cmpq	$0x200, %rax            # imm = 0x200
     8ea:      	jne	0x890 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x890>
     8ec:      	xorl	%eax, %eax
     8ee:      	nop
     8f0:      	movw	$0x0, -0x660(%rbp,%rax)
     8fa:      	movw	$0x0, -0x65e(%rbp,%rax)
     904:      	movw	$0x0, -0x65c(%rbp,%rax)
     90e:      	movw	$0x0, -0x65a(%rbp,%rax)
     918:      	movw	$0x0, -0x658(%rbp,%rax)
     922:      	movw	$0x0, -0x656(%rbp,%rax)
     92c:      	movw	$0x0, -0x654(%rbp,%rax)
     936:      	movw	$0x0, -0x652(%rbp,%rax)
     940:      	addq	$0x10, %rax
     944:      	cmpq	$0x200, %rax            # imm = 0x200
     94a:      	jne	0x8f0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x8f0>
     94c:      	xorl	%eax, %eax
     94e:      	nop
     950:      	movw	$0x0, -0x260(%rbp,%rax)
     95a:      	movw	$0x0, -0x25e(%rbp,%rax)
     964:      	movw	$0x0, -0x25c(%rbp,%rax)
     96e:      	movw	$0x0, -0x25a(%rbp,%rax)
     978:      	movw	$0x0, -0x258(%rbp,%rax)
     982:      	movw	$0x0, -0x256(%rbp,%rax)
     98c:      	movw	$0x0, -0x254(%rbp,%rax)
     996:      	movw	$0x0, -0x252(%rbp,%rax)
     9a0:      	addq	$0x10, %rax
     9a4:      	cmpq	$0x200, %rax            # imm = 0x200
     9aa:      	jne	0x950 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x950>
     9ac:      	movq	-0x60(%rbp), %rax
     9b0:      	movq	%rax, %r14
     9b3:      	cmpq	$0x3, %rax
     9b7:      	jne	0x230 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x230>
     9bd:      	leaq	-0x1460(%rbp), %rdi
     9c4:      	movq	$0x0, -0x30(%rbp)
     9cc:      	movl	$0x200, %edx            # imm = 0x200
     9d1:      	xorl	%esi, %esi
     9d3:      	callq	0x9d8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9d8>
     9d8:      	movl	$0x9d7dbb41, %r15d      # imm = 0x9D7DBB41
     9de:      	leaq	-0xa60(%rbp), %rbx
     9e5:      	xorl	%eax, %eax
     9e7:      	nopw	(%rax,%rax)
     9f0:      	movq	%r12, %r14
     9f3:      	leaq	(%rax,%rbp), %r12
     9f7:      	addq	$-0x1060, %r12          # imm = 0xEFA0
     9fe:      	addq	$0x200, %rax            # imm = 0x200
     a04:      	movq	%rax, -0x40(%rbp)
     a08:      	movq	-0x30(%rbp), %rax
     a0c:      	leaq	(%rax,%rax,2), %r13
     a10:      	incq	%rax
     a13:      	movq	%rax, -0x30(%rbp)
     a17:      	shlq	$0x7, %r13
     a1b:      	addq	-0x48(%rbp), %r13
     a1f:      	movl	$0x200, %edx            # imm = 0x200
     a24:      	movq	%r14, %rdi
     a27:      	xorl	%esi, %esi
     a29:      	callq	0xa2e <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa2e>
     a2e:      	xorl	%eax, %eax
     a30:      	movq	%rax, %rcx
     a33:      	shrq	$0x3, %rcx
     a37:      	movzbl	(%r13,%rcx), %r9d
     a3d:      	movl	%eax, %ecx
     a3f:      	andb	$0x4, %cl
     a42:      	movzbl	%cl, %esi
     a45:      	xorl	%r8d, %r8d
     a48:      	btl	%esi, %r9d
     a4c:      	setb	%r8b
     a50:      	leal	0x1(%rsi), %ecx
     a53:      	movl	%r9d, %r10d
     a56:      	shrl	%cl, %r10d
     a59:      	orw	(%r14), %r8w
     a5d:      	leal	0x2(%rsi), %ecx
     a60:      	movl	%r9d, %edi
     a63:      	shrl	%cl, %edi
     a65:      	addl	%r10d, %r10d
     a68:      	andl	$0x2, %r10d
     a6c:      	shll	$0x2, %edi
     a6f:      	leal	0x3(%rsi), %ecx
     a72:      	shrl	%cl, %r9d
     a75:      	andl	$0x4, %edi
     a78:      	orl	%r10d, %edi
     a7b:      	shll	$0x3, %r9d
     a7f:      	leaq	0x4(%rax), %rcx
     a83:      	movq	%rcx, %r10
     a86:      	shrq	$0x3, %r10
     a8a:      	movzbl	(%r13,%r10), %r10d
     a90:      	andb	$0x4, %cl
     a93:      	shrl	%cl, %r10d
     a96:      	andl	$0x8, %r9d
     a9a:      	orl	%edi, %r9d
     a9d:      	shll	$0x4, %r10d
     aa1:      	leaq	0x5(%rax), %rcx
     aa5:      	movq	%rcx, %rdi
     aa8:      	shrq	$0x3, %rdi
     aac:      	movzbl	(%r13,%rdi), %edi
     ab2:      	andb	$0x5, %cl
     ab5:      	shrl	%cl, %edi
     ab7:      	andl	$0x10, %r10d
     abb:      	orl	%r9d, %r10d
     abe:      	shll	$0x5, %edi
     ac1:      	andl	$0x20, %edi
     ac4:      	orl	%r10d, %edi
     ac7:      	orl	%r8d, %edi
     aca:      	leaq	0x6(%rax), %rcx
     ace:      	movq	%rcx, %r8
     ad1:      	shrq	$0x3, %r8
     ad5:      	movzbl	(%r13,%r8), %r8d
     adb:      	andb	$0x6, %cl
     ade:      	shrl	%cl, %r8d
     ae1:      	leaq	0x7(%rax), %rcx
     ae5:      	movq	%rcx, %r9
     ae8:      	shrq	$0x3, %r9
     aec:      	movzbl	(%r13,%r9), %r9d
     af2:      	andb	$0x7, %cl
     af5:      	shrb	%cl, %r9b
     af8:      	shll	$0x6, %r8d
     afc:      	andl	$0x40, %r8d
     b00:      	shlb	$0x7, %r9b
     b04:      	movzbl	%r9b, %ecx
     b08:      	orl	%r8d, %ecx
     b0b:      	leaq	0x8(%rax), %r8
     b0f:      	shrq	$0x3, %r8
     b13:      	movzbl	(%r13,%r8), %r8d
     b19:      	xorl	%r9d, %r9d
     b1c:      	btl	%esi, %r8d
     b20:      	setb	%r9b
     b24:      	shll	$0x8, %r9d
     b28:      	orl	%ecx, %r9d
     b2b:      	leaq	0x9(%rax), %rcx
     b2f:      	movq	%rcx, %rsi
     b32:      	shrq	$0x3, %rsi
     b36:      	movzbl	(%r13,%rsi), %esi
     b3c:      	andl	$0x5, %ecx
     b3f:      	xorl	%r8d, %r8d
     b42:      	btl	%ecx, %esi
     b45:      	setb	%r8b
     b49:      	shll	$0x9, %r8d
     b4d:      	orl	%r9d, %r8d
     b50:      	leaq	0xa(%rax), %rcx
     b54:      	movq	%rcx, %rsi
     b57:      	shrq	$0x3, %rsi
     b5b:      	movzbl	(%r13,%rsi), %esi
     b61:      	andl	$0x6, %ecx
     b64:      	xorl	%r9d, %r9d
     b67:      	btl	%ecx, %esi
     b6a:      	setb	%r9b
     b6e:      	shll	$0xa, %r9d
     b72:      	orl	%r8d, %r9d
     b75:      	orl	%edi, %r9d
     b78:      	leaq	0xb(%rax), %rcx
     b7c:      	movq	%rcx, %rsi
     b7f:      	shrq	$0x3, %rsi
     b83:      	movzbl	(%r13,%rsi), %esi
     b89:      	andl	$0x7, %ecx
     b8c:      	xorl	%edi, %edi
     b8e:      	btl	%ecx, %esi
     b91:      	setb	%dil
     b95:      	shll	$0xb, %edi
     b98:      	orl	%r9d, %edi
     b9b:      	movw	%di, (%r14)
     b9f:      	addq	$0x2, %r14
     ba3:      	addq	$0xc, %rax
     ba7:      	cmpq	$0xc00, %rax            # imm = 0xC00
     bad:      	jne	0xa30 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa30>
     bb3:      	movl	$0x200, %edx            # imm = 0x200
     bb8:      	leaq	-0x660(%rbp), %rdi
     bbf:      	leaq	-0x460(%rbp), %r14
     bc6:      	movq	%r14, %rsi
     bc9:      	callq	0xbce <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbce>
     bce:      	movl	$0x200, %edx            # imm = 0x200
     bd3:      	movq	%r14, %rdi
     bd6:      	xorl	%esi, %esi
     bd8:      	callq	0xbdd <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbdd>
     bdd:      	xorl	%eax, %eax
     bdf:      	jmp	0xd08 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd08>
     be4:      	nopw	%cs:(%rax,%rax)
     bf0:      	movzwl	-0x660(%rbp,%rax,4), %edi
     bf8:      	movzwl	(%r12,%rax,4), %edx
     bfd:      	movl	%edx, %r9d
     c00:      	imull	%edi, %r9d
     c04:      	imulq	$0x3afb7681, %r9, %rsi  # imm = 0x3AFB7681
     c0b:      	shrq	$0x20, %rsi
     c0f:      	movl	%r9d, %r8d
     c12:      	subl	%esi, %r8d
     c15:      	shrl	%r8d
     c18:      	addl	%esi, %r8d
     c1b:      	shrl	$0xb, %r8d
     c1f:      	imull	$0xd01, %r8d, %esi      # imm = 0xD01
     c26:      	subl	%esi, %r9d
     c29:      	movzwl	-0x65e(%rbp,%rax,4), %r8d
     c32:      	movzwl	0x2(%r12,%rax,4), %esi
     c38:      	movl	%esi, %r10d
     c3b:      	imull	%r8d, %r10d
     c3f:      	imulq	$0x3afb7681, %r10, %r11 # imm = 0x3AFB7681
     c46:      	shrq	$0x20, %r11
     c4a:      	movl	%r10d, %r13d
     c4d:      	subl	%r11d, %r13d
     c50:      	shrl	%r13d
     c53:      	addl	%r11d, %r13d
     c56:      	shrl	$0xb, %r13d
     c5a:      	imull	$0xd01, %r13d, %r11d    # imm = 0xD01
     c61:      	subl	%r11d, %r10d
     c64:      	movzwl	%cx, %ecx
     c67:      	imull	%r10d, %ecx
     c6b:      	imulq	$0x13afb769, %rcx, %r10 # imm = 0x13AFB769
     c72:      	shrq	$0x28, %r10
     c76:      	imull	$0xd01, %r10d, %r10d    # imm = 0xD01
     c7d:      	subl	%r10d, %ecx
     c80:      	addl	%r9d, %ecx
     c83:      	leal	-0xd01(%rcx), %r9d
     c8a:      	cmpl	$0xd01, %ecx            # imm = 0xD01
     c90:      	cmovbl	%ecx, %r9d
     c94:      	movw	%r9w, -0x460(%rbp,%rax,4)
     c9d:      	imull	%edi, %esi
     ca0:      	imulq	$0x3afb7681, %rsi, %rcx # imm = 0x3AFB7681
     ca7:      	shrq	$0x20, %rcx
     cab:      	movl	%esi, %edi
     cad:      	subl	%ecx, %edi
     caf:      	shrl	%edi
     cb1:      	addl	%ecx, %edi
     cb3:      	shrl	$0xb, %edi
     cb6:      	imull	$0xd01, %edi, %ecx      # imm = 0xD01
     cbc:      	subl	%ecx, %esi
     cbe:      	imull	%r8d, %edx
     cc2:      	imulq	$0x3afb7681, %rdx, %rcx # imm = 0x3AFB7681
     cc9:      	shrq	$0x20, %rcx
     ccd:      	movl	%edx, %edi
     ccf:      	subl	%ecx, %edi
     cd1:      	shrl	%edi
     cd3:      	addl	%ecx, %edi
     cd5:      	shrl	$0xb, %edi
     cd8:      	imull	$0xd01, %edi, %ecx      # imm = 0xD01
     cde:      	subl	%ecx, %edx
     ce0:      	addl	%esi, %edx
     ce2:      	leal	-0xd01(%rdx), %ecx
     ce8:      	cmpl	$0xd01, %edx            # imm = 0xD01
     cee:      	cmovbl	%edx, %ecx
     cf1:      	movw	%cx, -0x45e(%rbp,%rax,4)
     cf9:      	incq	%rax
     cfc:      	cmpq	$0x80, %rax
     d02:      	je	0xda0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xda0>
     d08:      	movl	%eax, %ecx
     d0a:      	rolb	$0x4, %cl
     d0d:      	orb	$0x8, %cl
     d10:      	movl	%ecx, %edx
     d12:      	andb	$0x33, %dl
     d15:      	shlb	$0x2, %dl
     d18:      	shrb	$0x2, %cl
     d1b:      	andb	$0x33, %cl
     d1e:      	orb	%dl, %cl
     d20:      	movl	%ecx, %edx
     d22:      	andb	$0x55, %dl
     d25:      	addb	%dl, %dl
     d27:      	shrb	%cl
     d29:      	andb	$0x55, %cl
     d2c:      	orb	%dl, %cl
     d2e:      	movzbl	%cl, %edx
     d31:      	movw	$0x1, %cx
     d35:      	movw	$0x11, %si
     d39:      	jmp	0xd5e <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd5e>
     d3b:      	nopl	(%rax,%rax)
     d40:      	imull	%esi, %esi
     d43:      	movq	%rsi, %rdi
     d46:      	imulq	%r15, %rdi
     d4a:      	shrq	$0x2b, %rdi
     d4e:      	imull	$0xd01, %edi, %edi      # imm = 0xD01
     d54:      	subl	%edi, %esi
     d56:      	shrl	%edx
     d58:      	je	0xbf0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbf0>
     d5e:      	movzwl	%si, %esi
     d61:      	testb	$0x1, %dl
     d64:      	je	0xd40 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd40>
     d66:      	movzwl	%cx, %ecx
     d69:      	imull	%esi, %ecx
     d6c:      	imulq	$0x3afb7681, %rcx, %rdi # imm = 0x3AFB7681
     d73:      	shrq	$0x20, %rdi
     d77:      	movl	%ecx, %r8d
     d7a:      	subl	%edi, %r8d
     d7d:      	shrl	%r8d
     d80:      	addl	%edi, %r8d
     d83:      	shrl	$0xb, %r8d
     d87:      	imull	$0xd01, %r8d, %edi      # imm = 0xD01
     d8e:      	subl	%edi, %ecx
     d90:      	jmp	0xd40 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd40>
     d92:      	nopw	%cs:(%rax,%rax)
     da0:      	movl	$0x200, %edx            # imm = 0x200
     da5:      	leaq	-0x260(%rbp), %rdi
     dac:      	leaq	-0x460(%rbp), %r12
     db3:      	movq	%r12, %rsi
     db6:      	callq	0xdbb <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xdbb>
     dbb:      	xorl	%eax, %eax
     dbd:      	movdqa	(%rip), %xmm4           # 0xdc5 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xdc5>
     dc5:      	movdqa	(%rip), %xmm5           # 0xdcd <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xdcd>
     dcd:      	pxor	%xmm6, %xmm6
     dd1:      	nopw	%cs:(%rax,%rax)
     de0:      	movdqu	-0x1460(%rbp,%rax,2), %xmm2
     de9:      	movdqu	-0x260(%rbp,%rax,2), %xmm0
     df2:      	movdqa	%xmm2, %xmm3
     df6:      	punpckhwd	%xmm6, %xmm3    # xmm3 = xmm3[4],xmm6[4],xmm3[5],xmm6[5],xmm3[6],xmm6[6],xmm3[7],xmm6[7]
     dfa:      	punpcklwd	%xmm6, %xmm2    # xmm2 = xmm2[0],xmm6[0],xmm2[1],xmm6[1],xmm2[2],xmm6[2],xmm2[3],xmm6[3]
     dfe:      	movdqa	%xmm0, %xmm1
     e02:      	punpckhwd	%xmm6, %xmm1    # xmm1 = xmm1[4],xmm6[4],xmm1[5],xmm6[5],xmm1[6],xmm6[6],xmm1[7],xmm6[7]
     e06:      	paddd	%xmm3, %xmm1
     e0a:      	punpcklwd	%xmm6, %xmm0    # xmm0 = xmm0[0],xmm6[0],xmm0[1],xmm6[1],xmm0[2],xmm6[2],xmm0[3],xmm6[3]
     e0e:      	paddd	%xmm2, %xmm0
     e12:      	movdqa	%xmm1, %xmm2
     e16:      	pmuludq	%xmm4, %xmm2
     e1a:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
     e1f:      	pshufd	$0xf5, %xmm1, %xmm3     # xmm3 = xmm1[1,1,3,3]
     e24:      	pmuludq	%xmm4, %xmm3
     e28:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
     e2d:      	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
     e31:      	pmaddwd	%xmm5, %xmm2
     e35:      	psubd	%xmm2, %xmm1
     e39:      	movdqa	%xmm0, %xmm2
     e3d:      	pmuludq	%xmm4, %xmm2
     e41:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
     e46:      	pshufd	$0xf5, %xmm0, %xmm3     # xmm3 = xmm0[1,1,3,3]
     e4b:      	pmuludq	%xmm4, %xmm3
     e4f:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
     e54:      	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
     e58:      	pmaddwd	%xmm5, %xmm2
     e5c:      	psubd	%xmm2, %xmm0
     e60:      	packssdw	%xmm1, %xmm0
     e64:      	movdqu	%xmm0, -0x460(%rbp,%rax,2)
     e6d:      	addq	$0x8, %rax
     e71:      	cmpq	$0x100, %rax            # imm = 0x100
     e77:      	jne	0xde0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xde0>
     e7d:      	movl	$0x200, %edx            # imm = 0x200
     e82:      	movq	%rbx, %rdi
     e85:      	movq	%r12, %rsi
     e88:      	callq	0xe8d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xe8d>
     e8d:      	movl	$0xe, %eax
     e92:      	nopw	%cs:(%rax,%rax)
     ea0:      	movw	$0x0, -0x146e(%rbp,%rax)
     eaa:      	movw	$0x0, -0x146c(%rbp,%rax)
     eb4:      	movw	$0x0, -0x146a(%rbp,%rax)
     ebe:      	movw	$0x0, -0x1468(%rbp,%rax)
     ec8:      	movw	$0x0, -0x1466(%rbp,%rax)
     ed2:      	movw	$0x0, -0x1464(%rbp,%rax)
     edc:      	movw	$0x0, -0x1462(%rbp,%rax)
     ee6:      	movw	$0x0, -0x1460(%rbp,%rax)
     ef0:      	addq	$0x10, %rax
     ef4:      	cmpq	$0x20e, %rax            # imm = 0x20E
     efa:      	jne	0xea0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xea0>
     efc:      	movl	$0x200, %edx            # imm = 0x200
     f01:      	leaq	-0x1460(%rbp), %rdi
     f08:      	movq	%rbx, %rsi
     f0b:      	callq	0xf10 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xf10>
     f10:      	xorl	%eax, %eax
     f12:      	nopw	%cs:(%rax,%rax)
     f20:      	movw	$0x0, -0x260(%rbp,%rax)
     f2a:      	movw	$0x0, -0x25e(%rbp,%rax)
     f34:      	movw	$0x0, -0x25c(%rbp,%rax)
     f3e:      	movw	$0x0, -0x25a(%rbp,%rax)
     f48:      	movw	$0x0, -0x258(%rbp,%rax)
     f52:      	movw	$0x0, -0x256(%rbp,%rax)
     f5c:      	movw	$0x0, -0x254(%rbp,%rax)
     f66:      	movw	$0x0, -0x252(%rbp,%rax)
     f70:      	addq	$0x10, %rax
     f74:      	cmpq	$0x200, %rax            # imm = 0x200
     f7a:      	jne	0xf20 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xf20>
     f7c:      	xorl	%eax, %eax
     f7e:      	nop
     f80:      	movw	$0x0, -0x660(%rbp,%rax)
     f8a:      	movw	$0x0, -0x65e(%rbp,%rax)
     f94:      	movw	$0x0, -0x65c(%rbp,%rax)
     f9e:      	movw	$0x0, -0x65a(%rbp,%rax)
     fa8:      	movw	$0x0, -0x658(%rbp,%rax)
     fb2:      	movw	$0x0, -0x656(%rbp,%rax)
     fbc:      	movw	$0x0, -0x654(%rbp,%rax)
     fc6:      	movw	$0x0, -0x652(%rbp,%rax)
     fd0:      	addq	$0x10, %rax
     fd4:      	cmpq	$0x200, %rax            # imm = 0x200
     fda:      	jne	0xf80 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xf80>
     fdc:      	movq	-0x40(%rbp), %rax
     fe0:      	cmpq	$0x600, %rax            # imm = 0x600
     fe6:      	jne	0x9f0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9f0>
     fec:      	leaq	-0x460(%rbp), %rbx
     ff3:      	leaq	-0x1460(%rbp), %rsi
     ffa:      	movl	$0x200, %edx            # imm = 0x200
     fff:      	movq	%rbx, %rdi
    1002:      	callq	0x1007 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1007>
    1007:      	leaq	-0x860(%rbp), %rdi
    100e:      	movq	%rbx, %rsi
    1011:      	callq	0x1016 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1016>
    1016:      	leaq	-0xa60(%rbp), %rdi
    101d:      	movq	-0x38(%rbp), %rsi
    1021:      	movl	$0x6, %edx
    1026:      	callq	0x102b <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x102b>
    102b:      	movq	-0x50(%rbp), %r14
    102f:      	xorl	%eax, %eax
    1031:      	pxor	%xmm0, %xmm0
    1035:      	movdqa	(%rip), %xmm5           # 0x103d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x103d>
    103d:      	movdqa	(%rip), %xmm6           # 0x1045 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1045>
    1045:      	nopw	%cs:(%rax,%rax)
    1050:      	movdqu	-0x860(%rbp,%rax,2), %xmm3
    1059:      	movdqu	-0xa60(%rbp,%rax,2), %xmm1
    1062:      	movdqa	%xmm3, %xmm4
    1066:      	punpckhwd	%xmm0, %xmm4    # xmm4 = xmm4[4],xmm0[4],xmm4[5],xmm0[5],xmm4[6],xmm0[6],xmm4[7],xmm0[7]
    106a:      	punpcklwd	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3]
    106e:      	movdqa	%xmm1, %xmm2
    1072:      	punpckhwd	%xmm0, %xmm2    # xmm2 = xmm2[4],xmm0[4],xmm2[5],xmm0[5],xmm2[6],xmm0[6],xmm2[7],xmm0[7]
    1076:      	paddd	%xmm4, %xmm2
    107a:      	punpcklwd	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3]
    107e:      	paddd	%xmm3, %xmm1
    1082:      	movdqa	%xmm2, %xmm3
    1086:      	pmuludq	%xmm5, %xmm3
    108a:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
    108f:      	pshufd	$0xf5, %xmm2, %xmm4     # xmm4 = xmm2[1,1,3,3]
    1094:      	pmuludq	%xmm5, %xmm4
    1098:      	pshufd	$0xed, %xmm4, %xmm4     # xmm4 = xmm4[1,3,2,3]
    109d:      	punpckldq	%xmm4, %xmm3    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
    10a1:      	pmaddwd	%xmm6, %xmm3
    10a5:      	psubd	%xmm3, %xmm2
    10a9:      	movdqa	%xmm1, %xmm3
    10ad:      	pmuludq	%xmm5, %xmm3
    10b1:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
    10b6:      	pshufd	$0xf5, %xmm1, %xmm4     # xmm4 = xmm1[1,1,3,3]
    10bb:      	pmuludq	%xmm5, %xmm4
    10bf:      	pshufd	$0xed, %xmm4, %xmm4     # xmm4 = xmm4[1,3,2,3]
    10c4:      	punpckldq	%xmm4, %xmm3    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
    10c8:      	pmaddwd	%xmm6, %xmm3
    10cc:      	psubd	%xmm3, %xmm1
    10d0:      	packssdw	%xmm2, %xmm1
    10d4:      	movdqu	%xmm1, -0x460(%rbp,%rax,2)
    10dd:      	addq	$0x8, %rax
    10e1:      	cmpq	$0x100, %rax            # imm = 0x100
    10e7:      	jne	0x1050 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1050>
    10ed:      	leaq	-0x1260(%rbp), %rdi
    10f4:      	leaq	-0x460(%rbp), %rsi
    10fb:      	movl	$0x200, %edx            # imm = 0x200
    1100:      	callq	0x1105 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1105>
    1105:      	leaq	-0x460(%rbp), %rdi
    110c:      	xorl	%ebx, %ebx
    110e:      	movl	$0x200, %edx            # imm = 0x200
    1113:      	xorl	%esi, %esi
    1115:      	callq	0x111a <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x111a>
    111a:      	movq	(%rip), %xmm0           # 0x1122 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1122>
    1122:      	movq	(%rip), %xmm1           # 0x112a <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x112a>
    112a:      	pxor	%xmm2, %xmm2
    112e:      	movdqa	(%rip), %xmm3           # 0x1136 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1136>
    1136:      	movdqa	(%rip), %xmm4           # 0x113e <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x113e>
    113e:      	movdqa	(%rip), %xmm5           # 0x1146 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1146>
    1146:      	movdqa	(%rip), %xmm6           # 0x114e <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x114e>
    114e:      	movq	-0x58(%rbp), %rcx
    1152:      	nopw	%cs:(%rax,%rax)
    1160:      	movzbl	(%rcx), %eax
    1163:      	movd	%eax, %xmm7
    1167:      	punpcklbw	%xmm7, %xmm7    # xmm7 = xmm7[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
    116b:      	pshuflw	$0x0, %xmm7, %xmm7      # xmm7 = xmm7[0,0,0,0,4,5,6,7]
    1170:      	movdqa	%xmm0, %xmm8
    1175:      	psllw	$0x5, %xmm8
    117b:      	pand	%xmm1, %xmm8
    1180:      	pxor	%xmm9, %xmm9
    1185:      	pcmpgtb	%xmm8, %xmm9
    118a:      	movdqa	%xmm9, %xmm10
    118f:      	pandn	%xmm7, %xmm10
    1194:      	psrlw	$0x4, %xmm7
    1199:      	pand	%xmm9, %xmm7
    119e:      	pand	%xmm3, %xmm7
    11a2:      	por	%xmm10, %xmm7
    11a7:      	paddb	%xmm8, %xmm8
    11ac:      	pxor	%xmm9, %xmm9
    11b1:      	pcmpgtb	%xmm8, %xmm9
    11b6:      	movdqa	%xmm9, %xmm10
    11bb:      	pandn	%xmm7, %xmm10
    11c0:      	psrlw	$0x2, %xmm7
    11c5:      	pand	%xmm9, %xmm7
    11ca:      	pand	%xmm4, %xmm7
    11ce:      	por	%xmm10, %xmm7
    11d3:      	paddb	%xmm8, %xmm8
    11d8:      	pxor	%xmm9, %xmm9
    11dd:      	pcmpgtb	%xmm8, %xmm9
    11e2:      	movdqa	%xmm9, %xmm8
    11e7:      	pandn	%xmm7, %xmm8
    11ec:      	psrlw	$0x1, %xmm7
    11f1:      	pand	%xmm9, %xmm7
    11f6:      	por	%xmm8, %xmm7
    11fb:      	pand	%xmm5, %xmm7
    11ff:      	punpcklbw	%xmm2, %xmm7    # xmm7 = xmm7[0],xmm2[0],xmm7[1],xmm2[1],xmm7[2],xmm2[2],xmm7[3],xmm2[3],xmm7[4],xmm2[4],xmm7[5],xmm2[5],xmm7[6],xmm2[6],xmm7[7],xmm2[7]
    1203:      	movdqu	-0x460(%rbp,%rbx,2), %xmm8
    120d:      	por	%xmm7, %xmm8
    1212:      	movdqu	%xmm8, -0x460(%rbp,%rbx,2)
    121c:      	addq	$0x8, %rbx
    1220:      	paddb	%xmm6, %xmm0
    1224:      	incq	%rcx
    1227:      	cmpq	$0x100, %rbx            # imm = 0x100
    122e:      	jne	0x1160 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1160>
    1234:      	leaq	-0x660(%rbp), %rdi
    123b:      	leaq	-0x460(%rbp), %rsi
    1242:      	movl	$0x200, %edx            # imm = 0x200
    1247:      	callq	0x124c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x124c>
    124c:      	xorl	%eax, %eax
    124e:      	movdqa	(%rip), %xmm0           # 0x1256 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1256>
    1256:      	pcmpeqd	%xmm1, %xmm1
    125a:      	nopw	(%rax,%rax)
    1260:      	movdqu	-0x660(%rbp,%rax,2), %xmm2
    1269:      	movdqa	%xmm2, %xmm3
    126d:      	pmulhuw	%xmm0, %xmm3
    1271:      	pmullw	%xmm0, %xmm2
    1275:      	movdqa	%xmm2, %xmm4
    1279:      	punpckhwd	%xmm3, %xmm4    # xmm4 = xmm4[4],xmm3[4],xmm4[5],xmm3[5],xmm4[6],xmm3[6],xmm4[7],xmm3[7]
    127d:      	punpcklwd	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1],xmm2[2],xmm3[2],xmm2[3],xmm3[3]
    1281:      	psubd	%xmm1, %xmm2
    1285:      	psubd	%xmm1, %xmm4
    1289:      	pslld	$0xf, %xmm4
    128e:      	psrad	$0x10, %xmm4
    1293:      	pslld	$0xf, %xmm2
    1298:      	psrad	$0x10, %xmm2
    129d:      	packssdw	%xmm4, %xmm2
    12a1:      	movdqu	%xmm2, -0x660(%rbp,%rax,2)
    12aa:      	addq	$0x8, %rax
    12ae:      	cmpq	$0x100, %rax            # imm = 0x100
    12b4:      	jne	0x1260 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1260>
    12b6:      	leaq	-0x260(%rbp), %rdi
    12bd:      	leaq	-0x660(%rbp), %rsi
    12c4:      	movl	$0x200, %edx            # imm = 0x200
    12c9:      	callq	0x12ce <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12ce>
    12ce:      	xorl	%eax, %eax
    12d0:      	pxor	%xmm0, %xmm0
    12d4:      	movdqa	(%rip), %xmm6           # 0x12dc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12dc>
    12dc:      	movdqa	(%rip), %xmm5           # 0x12e4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12e4>
    12e4:      	nopw	%cs:(%rax,%rax)
    12f0:      	movdqu	-0x1260(%rbp,%rax,2), %xmm3
    12f9:      	movdqu	-0x260(%rbp,%rax,2), %xmm1
    1302:      	movdqa	%xmm3, %xmm4
    1306:      	punpckhwd	%xmm0, %xmm4    # xmm4 = xmm4[4],xmm0[4],xmm4[5],xmm0[5],xmm4[6],xmm0[6],xmm4[7],xmm0[7]
    130a:      	punpcklwd	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3]
    130e:      	movdqa	%xmm1, %xmm2
    1312:      	punpckhwd	%xmm0, %xmm2    # xmm2 = xmm2[4],xmm0[4],xmm2[5],xmm0[5],xmm2[6],xmm0[6],xmm2[7],xmm0[7]
    1316:      	paddd	%xmm4, %xmm2
    131a:      	punpcklwd	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3]
    131e:      	paddd	%xmm3, %xmm1
    1322:      	movdqa	%xmm2, %xmm3
    1326:      	pmuludq	%xmm6, %xmm3
    132a:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
    132f:      	pshufd	$0xf5, %xmm2, %xmm4     # xmm4 = xmm2[1,1,3,3]
    1334:      	pmuludq	%xmm6, %xmm4
    1338:      	pshufd	$0xed, %xmm4, %xmm4     # xmm4 = xmm4[1,3,2,3]
    133d:      	punpckldq	%xmm4, %xmm3    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
    1341:      	pmaddwd	%xmm5, %xmm3
    1345:      	psubd	%xmm3, %xmm2
    1349:      	movdqa	%xmm1, %xmm3
    134d:      	pmuludq	%xmm6, %xmm3
    1351:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
    1356:      	pshufd	$0xf5, %xmm1, %xmm4     # xmm4 = xmm1[1,1,3,3]
    135b:      	pmuludq	%xmm6, %xmm4
    135f:      	pshufd	$0xed, %xmm4, %xmm4     # xmm4 = xmm4[1,3,2,3]
    1364:      	punpckldq	%xmm4, %xmm3    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
    1368:      	pmaddwd	%xmm5, %xmm3
    136c:      	psubd	%xmm3, %xmm1
    1370:      	packssdw	%xmm2, %xmm1
    1374:      	movdqu	%xmm1, -0x460(%rbp,%rax,2)
    137d:      	addq	$0x8, %rax
    1381:      	cmpq	$0x100, %rax            # imm = 0x100
    1387:      	jne	0x12f0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12f0>
    138d:      	leaq	-0x660(%rbp), %rdi
    1394:      	leaq	-0x460(%rbp), %rsi
    139b:      	movl	$0x200, %edx            # imm = 0x200
    13a0:      	callq	0x13a5 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x13a5>
    13a5:      	movdqa	(%rip), %xmm6           # 0x13ad <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x13ad>
    13ad:      	xorl	%eax, %eax
    13af:      	pxor	%xmm0, %xmm0
    13b3:      	movdqa	(%rip), %xmm1           # 0x13bb <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x13bb>
    13bb:      	movdqa	(%rip), %xmm5           # 0x13c3 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x13c3>
    13c3:      	nopw	%cs:(%rax,%rax)
    13d0:      	movdqu	-0x660(%rbp,%rax,2), %xmm2
    13d9:      	movdqa	%xmm2, %xmm3
    13dd:      	punpcklwd	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3]
    13e1:      	punpckhwd	%xmm0, %xmm2    # xmm2 = xmm2[4],xmm0[4],xmm2[5],xmm0[5],xmm2[6],xmm0[6],xmm2[7],xmm0[7]
    13e5:      	pslld	$0x4, %xmm2
    13ea:      	pslld	$0x4, %xmm3
    13ef:      	paddd	%xmm5, %xmm3
    13f3:      	paddd	%xmm5, %xmm2
    13f7:      	pshufd	$0xf5, %xmm2, %xmm4     # xmm4 = xmm2[1,1,3,3]
    13fc:      	pmuludq	%xmm6, %xmm2
    1400:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
    1405:      	pmuludq	%xmm6, %xmm4
    1409:      	pshufd	$0xed, %xmm4, %xmm4     # xmm4 = xmm4[1,3,2,3]
    140e:      	punpckldq	%xmm4, %xmm2    # xmm2 = xmm2[0],xmm4[0],xmm2[1],xmm4[1]
    1412:      	pshufd	$0xf5, %xmm3, %xmm4     # xmm4 = xmm3[1,1,3,3]
    1417:      	pmuludq	%xmm6, %xmm3
    141b:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
    1420:      	pmuludq	%xmm6, %xmm4
    1424:      	pshufd	$0xed, %xmm4, %xmm4     # xmm4 = xmm4[1,3,2,3]
    1429:      	punpckldq	%xmm4, %xmm3    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
    142d:      	packssdw	%xmm2, %xmm3
    1431:      	pand	%xmm1, %xmm3
    1435:      	movdqu	%xmm3, -0x660(%rbp,%rax,2)
    143e:      	addq	$0x8, %rax
    1442:      	cmpq	$0x100, %rax            # imm = 0x100
    1448:      	jne	0x13d0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x13d0>
    144a:      	leaq	-0x460(%rbp), %rbx
    1451:      	leaq	-0x660(%rbp), %rsi
    1458:      	movl	$0x200, %edx            # imm = 0x200
    145d:      	movq	%rbx, %rdi
    1460:      	callq	0x1465 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1465>
    1465:      	leaq	-0x16a0(%rbp), %rdx
    146c:      	movl	$0x4, %esi
    1471:      	movl	$0x80, %ecx
    1476:      	movq	%rbx, %rdi
    1479:      	callq	0x147e <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x147e>
    147e:      	xorl	%eax, %eax
    1480:      	movw	$0x0, -0x460(%rbp,%rax)
    148a:      	movw	$0x0, -0x45e(%rbp,%rax)
    1494:      	movw	$0x0, -0x45c(%rbp,%rax)
    149e:      	movw	$0x0, -0x45a(%rbp,%rax)
    14a8:      	movw	$0x0, -0x458(%rbp,%rax)
    14b2:      	movw	$0x0, -0x456(%rbp,%rax)
    14bc:      	movw	$0x0, -0x454(%rbp,%rax)
    14c6:      	movw	$0x0, -0x452(%rbp,%rax)
    14d0:      	addq	$0x10, %rax
    14d4:      	cmpq	$0x200, %rax            # imm = 0x200
    14da:      	jne	0x1480 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1480>
    14dc:      	xorl	%eax, %eax
    14de:      	nop
    14e0:      	movw	$0x0, -0x260(%rbp,%rax)
    14ea:      	movw	$0x0, -0x25e(%rbp,%rax)
    14f4:      	movw	$0x0, -0x25c(%rbp,%rax)
    14fe:      	movw	$0x0, -0x25a(%rbp,%rax)
    1508:      	movw	$0x0, -0x258(%rbp,%rax)
    1512:      	movw	$0x0, -0x256(%rbp,%rax)
    151c:      	movw	$0x0, -0x254(%rbp,%rax)
    1526:      	movw	$0x0, -0x252(%rbp,%rax)
    1530:      	addq	$0x10, %rax
    1534:      	cmpq	$0x200, %rax            # imm = 0x200
    153a:      	jne	0x14e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x14e0>
    153c:      	xorl	%eax, %eax
    153e:      	nop
    1540:      	movw	$0x0, -0x1260(%rbp,%rax)
    154a:      	movw	$0x0, -0x125e(%rbp,%rax)
    1554:      	movw	$0x0, -0x125c(%rbp,%rax)
    155e:      	movw	$0x0, -0x125a(%rbp,%rax)
    1568:      	movw	$0x0, -0x1258(%rbp,%rax)
    1572:      	movw	$0x0, -0x1256(%rbp,%rax)
    157c:      	movw	$0x0, -0x1254(%rbp,%rax)
    1586:      	movw	$0x0, -0x1252(%rbp,%rax)
    1590:      	addq	$0x10, %rax
    1594:      	cmpq	$0x200, %rax            # imm = 0x200
    159a:      	jne	0x1540 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1540>
    159c:      	xorl	%eax, %eax
    159e:      	nop
    15a0:      	movw	$0x0, -0xa60(%rbp,%rax)
    15aa:      	movw	$0x0, -0xa5e(%rbp,%rax)
    15b4:      	movw	$0x0, -0xa5c(%rbp,%rax)
    15be:      	movw	$0x0, -0xa5a(%rbp,%rax)
    15c8:      	movw	$0x0, -0xa58(%rbp,%rax)
    15d2:      	movw	$0x0, -0xa56(%rbp,%rax)
    15dc:      	movw	$0x0, -0xa54(%rbp,%rax)
    15e6:      	movw	$0x0, -0xa52(%rbp,%rax)
    15f0:      	addq	$0x10, %rax
    15f4:      	cmpq	$0x200, %rax            # imm = 0x200
    15fa:      	jne	0x15a0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x15a0>
    15fc:      	xorl	%eax, %eax
    15fe:      	nop
    1600:      	movw	$0x0, -0x860(%rbp,%rax)
    160a:      	movw	$0x0, -0x85e(%rbp,%rax)
    1614:      	movw	$0x0, -0x85c(%rbp,%rax)
    161e:      	movw	$0x0, -0x85a(%rbp,%rax)
    1628:      	movw	$0x0, -0x858(%rbp,%rax)
    1632:      	movw	$0x0, -0x856(%rbp,%rax)
    163c:      	movw	$0x0, -0x854(%rbp,%rax)
    1646:      	movw	$0x0, -0x852(%rbp,%rax)
    1650:      	addq	$0x10, %rax
    1654:      	cmpq	$0x200, %rax            # imm = 0x200
    165a:      	jne	0x1600 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1600>
    165c:      	leaq	-0x1a60(%rbp), %rsi
    1663:      	movl	$0x440, %edx            # imm = 0x440
    1668:      	movq	%r14, %rdi
    166b:      	callq	0x1670 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1670>
    1670:      	xorl	%eax, %eax
    1672:      	nopw	%cs:(%rax,%rax)
    1680:      	movw	$0x0, -0x1060(%rbp,%rax)
    168a:      	movw	$0x0, -0x105e(%rbp,%rax)
    1694:      	movw	$0x0, -0x105c(%rbp,%rax)
    169e:      	movw	$0x0, -0x105a(%rbp,%rax)
    16a8:      	movw	$0x0, -0x1058(%rbp,%rax)
    16b2:      	movw	$0x0, -0x1056(%rbp,%rax)
    16bc:      	movw	$0x0, -0x1054(%rbp,%rax)
    16c6:      	movw	$0x0, -0x1052(%rbp,%rax)
    16d0:      	addq	$0x10, %rax
    16d4:      	cmpq	$0x200, %rax            # imm = 0x200
    16da:      	jne	0x1680 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1680>
    16dc:      	xorl	%eax, %eax
    16de:      	nop
    16e0:      	movw	$0x0, -0xe60(%rbp,%rax)
    16ea:      	movw	$0x0, -0xe5e(%rbp,%rax)
    16f4:      	movw	$0x0, -0xe5c(%rbp,%rax)
    16fe:      	movw	$0x0, -0xe5a(%rbp,%rax)
    1708:      	movw	$0x0, -0xe58(%rbp,%rax)
    1712:      	movw	$0x0, -0xe56(%rbp,%rax)
    171c:      	movw	$0x0, -0xe54(%rbp,%rax)
    1726:      	movw	$0x0, -0xe52(%rbp,%rax)
    1730:      	addq	$0x10, %rax
    1734:      	cmpq	$0x200, %rax            # imm = 0x200
    173a:      	jne	0x16e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x16e0>
    173c:      	xorl	%eax, %eax
    173e:      	nop
    1740:      	movw	$0x0, -0xc60(%rbp,%rax)
    174a:      	movw	$0x0, -0xc5e(%rbp,%rax)
    1754:      	movw	$0x0, -0xc5c(%rbp,%rax)
    175e:      	movw	$0x0, -0xc5a(%rbp,%rax)
    1768:      	movw	$0x0, -0xc58(%rbp,%rax)
    1772:      	movw	$0x0, -0xc56(%rbp,%rax)
    177c:      	movw	$0x0, -0xc54(%rbp,%rax)
    1786:      	movw	$0x0, -0xc52(%rbp,%rax)
    1790:      	addq	$0x10, %rax
    1794:      	cmpq	$0x200, %rax            # imm = 0x200
    179a:      	jne	0x1740 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1740>
    179c:      	movq	%r14, %rax
    179f:      	addq	$0x1a38, %rsp           # imm = 0x1A38
    17a6:      	popq	%rbx
    17a7:      	popq	%r12
    17a9:      	popq	%r13
    17ab:      	popq	%r14
    17ad:      	popq	%r15
    17af:      	popq	%rbp
    17b0:      	retq
    17b1:      	xorl	%ecx, %ecx
    17b3:      	nopw	%cs:(%rax,%rax)
    17c0:      	movw	$0x0, -0x460(%rbp,%rcx)
    17ca:      	movw	$0x0, -0x45e(%rbp,%rcx)
    17d4:      	movw	$0x0, -0x45c(%rbp,%rcx)
    17de:      	movw	$0x0, -0x45a(%rbp,%rcx)
    17e8:      	movw	$0x0, -0x458(%rbp,%rcx)
    17f2:      	movw	$0x0, -0x456(%rbp,%rcx)
    17fc:      	movw	$0x0, -0x454(%rbp,%rcx)
    1806:      	movw	$0x0, -0x452(%rbp,%rcx)
    1810:      	addq	$0x10, %rcx
    1814:      	cmpq	$0x200, %rcx            # imm = 0x200
    181b:      	jne	0x17c0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x17c0>
    181d:      	xorl	%ecx, %ecx
    181f:      	nop
    1820:      	movw	$0x0, -0x260(%rbp,%rcx)
    182a:      	movw	$0x0, -0x25e(%rbp,%rcx)
    1834:      	movw	$0x0, -0x25c(%rbp,%rcx)
    183e:      	movw	$0x0, -0x25a(%rbp,%rcx)
    1848:      	movw	$0x0, -0x258(%rbp,%rcx)
    1852:      	movw	$0x0, -0x256(%rbp,%rcx)
    185c:      	movw	$0x0, -0x254(%rbp,%rcx)
    1866:      	movw	$0x0, -0x252(%rbp,%rcx)
    1870:      	addq	$0x10, %rcx
    1874:      	cmpq	$0x200, %rcx            # imm = 0x200
    187b:      	jne	0x1820 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1820>
    187d:      	xorl	%ecx, %ecx
    187f:      	nop
    1880:      	movw	$0x0, -0x1260(%rbp,%rcx)
    188a:      	movw	$0x0, -0x125e(%rbp,%rcx)
    1894:      	movw	$0x0, -0x125c(%rbp,%rcx)
    189e:      	movw	$0x0, -0x125a(%rbp,%rcx)
    18a8:      	movw	$0x0, -0x1258(%rbp,%rcx)
    18b2:      	movw	$0x0, -0x1256(%rbp,%rcx)
    18bc:      	movw	$0x0, -0x1254(%rbp,%rcx)
    18c6:      	movw	$0x0, -0x1252(%rbp,%rcx)
    18d0:      	addq	$0x10, %rcx
    18d4:      	cmpq	$0x200, %rcx            # imm = 0x200
    18db:      	jne	0x1880 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1880>
    18dd:      	xorl	%ecx, %ecx
    18df:      	nop
    18e0:      	movw	$0x0, -0xa60(%rbp,%rcx)
    18ea:      	movw	$0x0, -0xa5e(%rbp,%rcx)
    18f4:      	movw	$0x0, -0xa5c(%rbp,%rcx)
    18fe:      	movw	$0x0, -0xa5a(%rbp,%rcx)
    1908:      	movw	$0x0, -0xa58(%rbp,%rcx)
    1912:      	movw	$0x0, -0xa56(%rbp,%rcx)
    191c:      	movw	$0x0, -0xa54(%rbp,%rcx)
    1926:      	movw	$0x0, -0xa52(%rbp,%rcx)
    1930:      	addq	$0x10, %rcx
    1934:      	cmpq	$0x200, %rcx            # imm = 0x200
    193b:      	jne	0x18e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x18e0>
    193d:      	jmp	0x193f <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x193f>
    193f:      	xorl	%ecx, %ecx
    1941:      	nopw	%cs:(%rax,%rax)
    1950:      	movw	$0x0, -0x860(%rbp,%rcx)
    195a:      	movw	$0x0, -0x85e(%rbp,%rcx)
    1964:      	movw	$0x0, -0x85c(%rbp,%rcx)
    196e:      	movw	$0x0, -0x85a(%rbp,%rcx)
    1978:      	movw	$0x0, -0x858(%rbp,%rcx)
    1982:      	movw	$0x0, -0x856(%rbp,%rcx)
    198c:      	movw	$0x0, -0x854(%rbp,%rcx)
    1996:      	movw	$0x0, -0x852(%rbp,%rcx)
    19a0:      	addq	$0x10, %rcx
    19a4:      	cmpq	$0x200, %rcx            # imm = 0x200
    19ab:      	jne	0x1950 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1950>
    19ad:      	jmp	0x1b0d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1b0d>
    19b2:      	jmp	0x1b0f <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1b0f>
    19b7:      	movq	%rax, %rbx
    19ba:      	movq	%r14, -0x850(%rbp)
    19c1:      	leaq	-0x860(%rbp), %rdi
    19c8:      	callq	0x19cd <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x19cd>
    19cd:      	movq	%rbx, %rdi
    19d0:      	callq	0x19d5 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x19d5>
    19d5:      	xorl	%ecx, %ecx
    19d7:      	nopw	(%rax,%rax)
    19e0:      	movw	$0x0, -0x460(%rbp,%rcx)
    19ea:      	movw	$0x0, -0x45e(%rbp,%rcx)
    19f4:      	movw	$0x0, -0x45c(%rbp,%rcx)
    19fe:      	movw	$0x0, -0x45a(%rbp,%rcx)
    1a08:      	movw	$0x0, -0x458(%rbp,%rcx)
    1a12:      	movw	$0x0, -0x456(%rbp,%rcx)
    1a1c:      	movw	$0x0, -0x454(%rbp,%rcx)
    1a26:      	movw	$0x0, -0x452(%rbp,%rcx)
    1a30:      	addq	$0x10, %rcx
    1a34:      	cmpq	$0x200, %rcx            # imm = 0x200
    1a3b:      	jne	0x19e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x19e0>
    1a3d:      	xorl	%ecx, %ecx
    1a3f:      	nop
    1a40:      	movw	$0x0, -0x660(%rbp,%rcx)
    1a4a:      	movw	$0x0, -0x65e(%rbp,%rcx)
    1a54:      	movw	$0x0, -0x65c(%rbp,%rcx)
    1a5e:      	movw	$0x0, -0x65a(%rbp,%rcx)
    1a68:      	movw	$0x0, -0x658(%rbp,%rcx)
    1a72:      	movw	$0x0, -0x656(%rbp,%rcx)
    1a7c:      	movw	$0x0, -0x654(%rbp,%rcx)
    1a86:      	movw	$0x0, -0x652(%rbp,%rcx)
    1a90:      	addq	$0x10, %rcx
    1a94:      	cmpq	$0x200, %rcx            # imm = 0x200
    1a9b:      	jne	0x1a40 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1a40>
    1a9d:      	jmp	0x1a9f <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1a9f>
    1a9f:      	xorl	%ecx, %ecx
    1aa1:      	nopw	%cs:(%rax,%rax)
    1ab0:      	movw	$0x0, -0x260(%rbp,%rcx)
    1aba:      	movw	$0x0, -0x25e(%rbp,%rcx)
    1ac4:      	movw	$0x0, -0x25c(%rbp,%rcx)
    1ace:      	movw	$0x0, -0x25a(%rbp,%rcx)
    1ad8:      	movw	$0x0, -0x258(%rbp,%rcx)
    1ae2:      	movw	$0x0, -0x256(%rbp,%rcx)
    1aec:      	movw	$0x0, -0x254(%rbp,%rcx)
    1af6:      	movw	$0x0, -0x252(%rbp,%rcx)
    1b00:      	addq	$0x10, %rcx
    1b04:      	cmpq	$0x200, %rcx            # imm = 0x200
    1b0b:      	jne	0x1ab0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1ab0>
    1b0d:      	jmp	0x1b0f <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1b0f>
    1b0f:      	movq	%rax, %rdi
    1b12:      	jmp	0x1b7c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1b7c>
    1b14:      	movq	%rax, %rdi
    1b17:      	xorl	%eax, %eax
    1b19:      	nopl	(%rax)
    1b20:      	movw	$0x0, -0x860(%rbp,%rax)
    1b2a:      	movw	$0x0, -0x85e(%rbp,%rax)
    1b34:      	movw	$0x0, -0x85c(%rbp,%rax)
    1b3e:      	movw	$0x0, -0x85a(%rbp,%rax)
    1b48:      	movw	$0x0, -0x858(%rbp,%rax)
    1b52:      	movw	$0x0, -0x856(%rbp,%rax)
    1b5c:      	movw	$0x0, -0x854(%rbp,%rax)
    1b66:      	movw	$0x0, -0x852(%rbp,%rax)
    1b70:      	addq	$0x10, %rax
    1b74:      	cmpq	$0x200, %rax            # imm = 0x200
    1b7a:      	jne	0x1b20 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1b20>
    1b7c:      	xorl	%eax, %eax
    1b7e:      	nop
    1b80:      	movw	$0x0, -0x1060(%rbp,%rax)
    1b8a:      	movw	$0x0, -0x105e(%rbp,%rax)
    1b94:      	movw	$0x0, -0x105c(%rbp,%rax)
    1b9e:      	movw	$0x0, -0x105a(%rbp,%rax)
    1ba8:      	movw	$0x0, -0x1058(%rbp,%rax)
    1bb2:      	movw	$0x0, -0x1056(%rbp,%rax)
    1bbc:      	movw	$0x0, -0x1054(%rbp,%rax)
    1bc6:      	movw	$0x0, -0x1052(%rbp,%rax)
    1bd0:      	addq	$0x10, %rax
    1bd4:      	cmpq	$0x200, %rax            # imm = 0x200
    1bda:      	jne	0x1b80 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1b80>
    1bdc:      	xorl	%eax, %eax
    1bde:      	nop
    1be0:      	movw	$0x0, -0xe60(%rbp,%rax)
    1bea:      	movw	$0x0, -0xe5e(%rbp,%rax)
    1bf4:      	movw	$0x0, -0xe5c(%rbp,%rax)
    1bfe:      	movw	$0x0, -0xe5a(%rbp,%rax)
    1c08:      	movw	$0x0, -0xe58(%rbp,%rax)
    1c12:      	movw	$0x0, -0xe56(%rbp,%rax)
    1c1c:      	movw	$0x0, -0xe54(%rbp,%rax)
    1c26:      	movw	$0x0, -0xe52(%rbp,%rax)
    1c30:      	addq	$0x10, %rax
    1c34:      	cmpq	$0x200, %rax            # imm = 0x200
    1c3a:      	jne	0x1be0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1be0>
    1c3c:      	xorl	%eax, %eax
    1c3e:      	nop
    1c40:      	movw	$0x0, -0xc60(%rbp,%rax)
    1c4a:      	movw	$0x0, -0xc5e(%rbp,%rax)
    1c54:      	movw	$0x0, -0xc5c(%rbp,%rax)
    1c5e:      	movw	$0x0, -0xc5a(%rbp,%rax)
    1c68:      	movw	$0x0, -0xc58(%rbp,%rax)
    1c72:      	movw	$0x0, -0xc56(%rbp,%rax)
    1c7c:      	movw	$0x0, -0xc54(%rbp,%rax)
    1c86:      	movw	$0x0, -0xc52(%rbp,%rax)
    1c90:      	addq	$0x10, %rax
    1c94:      	cmpq	$0x200, %rax            # imm = 0x200
    1c9a:      	jne	0x1c40 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1c40>
    1c9c:      	callq	0x1ca1 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1ca1>

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
       d:      	subq	$0xca8, %rsp            # imm = 0xCA8
      14:      	movq	%rsi, %rbx
      17:      	cmpq	$0x440, %rcx            # imm = 0x440
      1e:      	jne	0x1207 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1207>
      24:      	movq	%rdx, -0x30(%rbp)
      28:      	movq	%rdi, -0x88(%rbp)
      2f:      	leaq	-0xad0(%rbp), %rdi
      36:      	movq	$0x0, -0x38(%rbp)
      3e:      	movl	$0x200, %edx            # imm = 0x200
      43:      	xorl	%esi, %esi
      45:      	callq	0x4a <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x4a>
      4a:      	leaq	-0x8d0(%rbp), %r13
      51:      	movl	$0x9d7dbb41, %r14d      # imm = 0x9D7DBB41
      57:      	xorl	%eax, %eax
      59:      	nopl	(%rax)
      60:      	leaq	(%rbx,%rax), %r15
      64:      	addq	$0x200, %rax            # imm = 0x200
      6a:      	movq	%rax, -0x90(%rbp)
      71:      	movq	-0x38(%rbp), %rax
      75:      	leaq	(%rax,%rax,4), %r12
      79:      	incq	%rax
      7c:      	movq	%rax, -0x38(%rbp)
      80:      	shlq	$0x6, %r12
      84:      	addq	-0x30(%rbp), %r12
      88:      	movl	$0x200, %edx            # imm = 0x200
      8d:      	movq	%r13, %rdi
      90:      	xorl	%esi, %esi
      92:      	callq	0x97 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x97>
      97:      	xorl	%edx, %edx
      99:      	nopl	(%rax)
      a0:      	movq	%rdx, %rax
      a3:      	shrq	$0x3, %rax
      a7:      	movzbl	(%r12,%rax), %r8d
      ac:      	movl	%edx, %eax
      ae:      	andb	$0x6, %al
      b0:      	movzbl	%al, %edi
      b3:      	xorl	%eax, %eax
      b5:      	btl	%edi, %r8d
      b9:      	setb	%al
      bc:      	orw	(%r13), %ax
      c1:      	leal	0x1(%rdi), %ecx
      c4:      	shrl	%cl, %r8d
      c7:      	leaq	0x2(%rdx), %rcx
      cb:      	movq	%rcx, %r9
      ce:      	shrq	$0x3, %r9
      d2:      	movzbl	(%r12,%r9), %r9d
      d7:      	andb	$0x6, %cl
      da:      	shrl	%cl, %r9d
      dd:      	addl	%r8d, %r8d
      e0:      	andl	$0x2, %r8d
      e4:      	shll	$0x2, %r9d
      e8:      	leaq	0x3(%rdx), %rcx
      ec:      	movq	%rcx, %r10
      ef:      	shrq	$0x3, %r10
      f3:      	movzbl	(%r12,%r10), %r10d
      f8:      	andb	$0x7, %cl
      fb:      	shrl	%cl, %r10d
      fe:      	andl	$0x4, %r9d
     102:      	orl	%r8d, %r9d
     105:      	shll	$0x3, %r10d
     109:      	leaq	0x4(%rdx), %rcx
     10d:      	movq	%rcx, %r8
     110:      	shrq	$0x3, %r8
     114:      	movzbl	(%r12,%r8), %r8d
     119:      	andb	$0x6, %cl
     11c:      	shrl	%cl, %r8d
     11f:      	andl	$0x8, %r10d
     123:      	orl	%r9d, %r10d
     126:      	shll	$0x4, %r8d
     12a:      	andl	$0x10, %r8d
     12e:      	orl	%r10d, %r8d
     131:      	orl	%eax, %r8d
     134:      	leaq	0x5(%rdx), %rcx
     138:      	movq	%rcx, %rax
     13b:      	shrq	$0x3, %rax
     13f:      	movzbl	(%r12,%rax), %r9d
     144:      	andb	$0x7, %cl
     147:      	shrl	%cl, %r9d
     14a:      	leaq	0x6(%rdx), %rcx
     14e:      	leaq	0x7(%rdx), %rax
     152:      	movq	%rax, %r10
     155:      	shrq	$0x3, %r10
     159:      	movzbl	(%r12,%r10), %r10d
     15e:      	movq	%rcx, %r11
     161:      	shrq	$0x3, %r11
     165:      	movzbl	(%r12,%r11), %r11d
     16a:      	andb	$0x6, %cl
     16d:      	shrl	%cl, %r11d
     170:      	shll	$0x5, %r9d
     174:      	andl	$0x20, %r9d
     178:      	shll	$0x6, %r11d
     17c:      	andb	$0x7, %al
     17e:      	movl	%eax, %ecx
     180:      	shrb	%cl, %r10b
     183:      	andl	$0x40, %r11d
     187:      	orl	%r9d, %r11d
     18a:      	shlb	$0x7, %r10b
     18e:      	movzbl	%r10b, %eax
     192:      	orl	%r11d, %eax
     195:      	leaq	0x8(%rdx), %rcx
     199:      	shrq	$0x3, %rcx
     19d:      	movzbl	(%r12,%rcx), %ecx
     1a2:      	xorl	%r9d, %r9d
     1a5:      	btl	%edi, %ecx
     1a8:      	setb	%r9b
     1ac:      	shll	$0x8, %r9d
     1b0:      	orl	%eax, %r9d
     1b3:      	leaq	0x9(%rdx), %rax
     1b7:      	movq	%rax, %rcx
     1ba:      	shrq	$0x3, %rcx
     1be:      	movzbl	(%r12,%rcx), %ecx
     1c3:      	andl	$0x7, %eax
     1c6:      	xorl	%edi, %edi
     1c8:      	btl	%eax, %ecx
     1cb:      	setb	%dil
     1cf:      	shll	$0x9, %edi
     1d2:      	orl	%r9d, %edi
     1d5:      	orl	%r8d, %edi
     1d8:      	movw	%di, (%r13)
     1dd:      	addq	$0x2, %r13
     1e1:      	addq	$0xa, %rdx
     1e5:      	cmpq	$0xa00, %rdx            # imm = 0xA00
     1ec:      	jne	0xa0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xa0>
     1f2:      	movl	$0x200, %edx            # imm = 0x200
     1f7:      	leaq	-0x290(%rbp), %r13
     1fe:      	movq	%r13, %rdi
     201:      	leaq	-0x8d0(%rbp), %r12
     208:      	movq	%r12, %rsi
     20b:      	callq	0x210 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x210>
     210:      	xorl	%eax, %eax
     212:      	movdqa	(%rip), %xmm3           # 0x21a <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x21a>
     21a:      	movdqa	(%rip), %xmm4           # 0x222 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x222>
     222:      	nopw	%cs:(%rax,%rax)
     230:      	movdqu	-0x290(%rbp,%rax,2), %xmm0
     239:      	movdqa	%xmm0, %xmm1
     23d:      	pmulhuw	%xmm3, %xmm1
     241:      	pmullw	%xmm3, %xmm0
     245:      	movdqa	%xmm0, %xmm2
     249:      	punpckhwd	%xmm1, %xmm2    # xmm2 = xmm2[4],xmm1[4],xmm2[5],xmm1[5],xmm2[6],xmm1[6],xmm2[7],xmm1[7]
     24d:      	punpcklwd	%xmm1, %xmm0    # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1],xmm0[2],xmm1[2],xmm0[3],xmm1[3]
     251:      	paddd	%xmm4, %xmm0
     255:      	paddd	%xmm4, %xmm2
     259:      	pslld	$0x6, %xmm2
     25e:      	psrad	$0x10, %xmm2
     263:      	pslld	$0x6, %xmm0
     268:      	psrad	$0x10, %xmm0
     26d:      	packssdw	%xmm2, %xmm0
     271:      	movdqu	%xmm0, -0x290(%rbp,%rax,2)
     27a:      	addq	$0x8, %rax
     27e:      	cmpq	$0x100, %rax            # imm = 0x100
     284:      	jne	0x230 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x230>
     286:      	movl	$0x200, %edx            # imm = 0x200
     28b:      	movq	%r12, %rdi
     28e:      	movq	%r13, %rsi
     291:      	callq	0x296 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x296>
     296:      	movq	%r13, %rdi
     299:      	movq	%r12, %rsi
     29c:      	callq	0x2a1 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x2a1>
     2a1:      	movl	$0x200, %edx            # imm = 0x200
     2a6:      	movq	%r12, %rdi
     2a9:      	xorl	%esi, %esi
     2ab:      	callq	0x2b0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x2b0>
     2b0:      	xorl	%eax, %eax
     2b2:      	jmp	0x3d7 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x3d7>
     2b7:      	nopw	(%rax,%rax)
     2c0:      	movzwl	(%r15,%rax,4), %edi
     2c5:      	movzwl	-0x290(%rbp,%rax,4), %edx
     2cd:      	movl	%edx, %r9d
     2d0:      	imull	%edi, %r9d
     2d4:      	imulq	$0x3afb7681, %r9, %rsi  # imm = 0x3AFB7681
     2db:      	shrq	$0x20, %rsi
     2df:      	movl	%r9d, %r8d
     2e2:      	subl	%esi, %r8d
     2e5:      	shrl	%r8d
     2e8:      	addl	%esi, %r8d
     2eb:      	shrl	$0xb, %r8d
     2ef:      	imull	$0xd01, %r8d, %esi      # imm = 0xD01
     2f6:      	subl	%esi, %r9d
     2f9:      	movzwl	0x2(%r15,%rax,4), %r8d
     2ff:      	movzwl	-0x28e(%rbp,%rax,4), %esi
     307:      	movl	%esi, %r10d
     30a:      	imull	%r8d, %r10d
     30e:      	imulq	$0x3afb7681, %r10, %r11 # imm = 0x3AFB7681
     315:      	shrq	$0x20, %r11
     319:      	movl	%r10d, %r12d
     31c:      	subl	%r11d, %r12d
     31f:      	shrl	%r12d
     322:      	addl	%r11d, %r12d
     325:      	shrl	$0xb, %r12d
     329:      	imull	$0xd01, %r12d, %r11d    # imm = 0xD01
     330:      	subl	%r11d, %r10d
     333:      	movzwl	%cx, %ecx
     336:      	imull	%r10d, %ecx
     33a:      	imulq	$0x13afb769, %rcx, %r10 # imm = 0x13AFB769
     341:      	shrq	$0x28, %r10
     345:      	imull	$0xd01, %r10d, %r10d    # imm = 0xD01
     34c:      	subl	%r10d, %ecx
     34f:      	addl	%r9d, %ecx
     352:      	leal	-0xd01(%rcx), %r9d
     359:      	cmpl	$0xd01, %ecx            # imm = 0xD01
     35f:      	cmovbl	%ecx, %r9d
     363:      	movw	%r9w, -0x8d0(%rbp,%rax,4)
     36c:      	imull	%edi, %esi
     36f:      	imulq	$0x3afb7681, %rsi, %rcx # imm = 0x3AFB7681
     376:      	shrq	$0x20, %rcx
     37a:      	movl	%esi, %edi
     37c:      	subl	%ecx, %edi
     37e:      	shrl	%edi
     380:      	addl	%ecx, %edi
     382:      	shrl	$0xb, %edi
     385:      	imull	$0xd01, %edi, %ecx      # imm = 0xD01
     38b:      	subl	%ecx, %esi
     38d:      	imull	%r8d, %edx
     391:      	imulq	$0x3afb7681, %rdx, %rcx # imm = 0x3AFB7681
     398:      	shrq	$0x20, %rcx
     39c:      	movl	%edx, %edi
     39e:      	subl	%ecx, %edi
     3a0:      	shrl	%edi
     3a2:      	addl	%ecx, %edi
     3a4:      	shrl	$0xb, %edi
     3a7:      	imull	$0xd01, %edi, %ecx      # imm = 0xD01
     3ad:      	subl	%ecx, %edx
     3af:      	addl	%esi, %edx
     3b1:      	leal	-0xd01(%rdx), %ecx
     3b7:      	cmpl	$0xd01, %edx            # imm = 0xD01
     3bd:      	cmovbl	%edx, %ecx
     3c0:      	movw	%cx, -0x8ce(%rbp,%rax,4)
     3c8:      	incq	%rax
     3cb:      	cmpq	$0x80, %rax
     3d1:      	je	0x470 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x470>
     3d7:      	movl	%eax, %ecx
     3d9:      	rolb	$0x4, %cl
     3dc:      	orb	$0x8, %cl
     3df:      	movl	%ecx, %edx
     3e1:      	andb	$0x33, %dl
     3e4:      	shlb	$0x2, %dl
     3e7:      	shrb	$0x2, %cl
     3ea:      	andb	$0x33, %cl
     3ed:      	orb	%dl, %cl
     3ef:      	movl	%ecx, %edx
     3f1:      	andb	$0x55, %dl
     3f4:      	addb	%dl, %dl
     3f6:      	shrb	%cl
     3f8:      	andb	$0x55, %cl
     3fb:      	orb	%dl, %cl
     3fd:      	movzbl	%cl, %edx
     400:      	movw	$0x1, %cx
     404:      	movw	$0x11, %si
     408:      	jmp	0x42e <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x42e>
     40a:      	nopw	(%rax,%rax)
     410:      	imull	%esi, %esi
     413:      	movq	%rsi, %rdi
     416:      	imulq	%r14, %rdi
     41a:      	shrq	$0x2b, %rdi
     41e:      	imull	$0xd01, %edi, %edi      # imm = 0xD01
     424:      	subl	%edi, %esi
     426:      	shrl	%edx
     428:      	je	0x2c0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x2c0>
     42e:      	movzwl	%si, %esi
     431:      	testb	$0x1, %dl
     434:      	je	0x410 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x410>
     436:      	movzwl	%cx, %ecx
     439:      	imull	%esi, %ecx
     43c:      	imulq	$0x3afb7681, %rcx, %rdi # imm = 0x3AFB7681
     443:      	shrq	$0x20, %rdi
     447:      	movl	%ecx, %r8d
     44a:      	subl	%edi, %r8d
     44d:      	shrl	%r8d
     450:      	addl	%edi, %r8d
     453:      	shrl	$0xb, %r8d
     457:      	imull	$0xd01, %r8d, %edi      # imm = 0xD01
     45e:      	subl	%edi, %ecx
     460:      	jmp	0x410 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x410>
     462:      	nopw	%cs:(%rax,%rax)
     470:      	movl	$0x200, %edx            # imm = 0x200
     475:      	leaq	-0x490(%rbp), %rdi
     47c:      	leaq	-0x8d0(%rbp), %r13
     483:      	movq	%r13, %rsi
     486:      	callq	0x48b <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x48b>
     48b:      	xorl	%eax, %eax
     48d:      	movdqa	(%rip), %xmm4           # 0x495 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x495>
     495:      	pxor	%xmm5, %xmm5
     499:      	movdqa	(%rip), %xmm6           # 0x4a1 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x4a1>
     4a1:      	nopw	%cs:(%rax,%rax)
     4b0:      	movdqu	-0xad0(%rbp,%rax,2), %xmm2
     4b9:      	movdqu	-0x490(%rbp,%rax,2), %xmm0
     4c2:      	movdqa	%xmm2, %xmm3
     4c6:      	punpckhwd	%xmm5, %xmm3    # xmm3 = xmm3[4],xmm5[4],xmm3[5],xmm5[5],xmm3[6],xmm5[6],xmm3[7],xmm5[7]
     4ca:      	punpcklwd	%xmm5, %xmm2    # xmm2 = xmm2[0],xmm5[0],xmm2[1],xmm5[1],xmm2[2],xmm5[2],xmm2[3],xmm5[3]
     4ce:      	movdqa	%xmm0, %xmm1
     4d2:      	punpckhwd	%xmm5, %xmm1    # xmm1 = xmm1[4],xmm5[4],xmm1[5],xmm5[5],xmm1[6],xmm5[6],xmm1[7],xmm5[7]
     4d6:      	paddd	%xmm3, %xmm1
     4da:      	punpcklwd	%xmm5, %xmm0    # xmm0 = xmm0[0],xmm5[0],xmm0[1],xmm5[1],xmm0[2],xmm5[2],xmm0[3],xmm5[3]
     4de:      	paddd	%xmm2, %xmm0
     4e2:      	movdqa	%xmm1, %xmm2
     4e6:      	pmuludq	%xmm4, %xmm2
     4ea:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
     4ef:      	pshufd	$0xf5, %xmm1, %xmm3     # xmm3 = xmm1[1,1,3,3]
     4f4:      	pmuludq	%xmm4, %xmm3
     4f8:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
     4fd:      	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
     501:      	pmaddwd	%xmm6, %xmm2
     505:      	psubd	%xmm2, %xmm1
     509:      	movdqa	%xmm0, %xmm2
     50d:      	pmuludq	%xmm4, %xmm2
     511:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
     516:      	pshufd	$0xf5, %xmm0, %xmm3     # xmm3 = xmm0[1,1,3,3]
     51b:      	pmuludq	%xmm4, %xmm3
     51f:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
     524:      	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
     528:      	pmaddwd	%xmm6, %xmm2
     52c:      	psubd	%xmm2, %xmm0
     530:      	packssdw	%xmm1, %xmm0
     534:      	movdqu	%xmm0, -0x8d0(%rbp,%rax,2)
     53d:      	addq	$0x8, %rax
     541:      	cmpq	$0x100, %rax            # imm = 0x100
     547:      	jne	0x4b0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x4b0>
     54d:      	movl	$0x200, %edx            # imm = 0x200
     552:      	leaq	-0xcd0(%rbp), %r15
     559:      	movq	%r15, %rdi
     55c:      	movq	%r13, %rsi
     55f:      	callq	0x564 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x564>
     564:      	movl	$0xe, %eax
     569:      	nopl	(%rax)
     570:      	movw	$0x0, -0xade(%rbp,%rax)
     57a:      	movw	$0x0, -0xadc(%rbp,%rax)
     584:      	movw	$0x0, -0xada(%rbp,%rax)
     58e:      	movw	$0x0, -0xad8(%rbp,%rax)
     598:      	movw	$0x0, -0xad6(%rbp,%rax)
     5a2:      	movw	$0x0, -0xad4(%rbp,%rax)
     5ac:      	movw	$0x0, -0xad2(%rbp,%rax)
     5b6:      	movw	$0x0, -0xad0(%rbp,%rax)
     5c0:      	addq	$0x10, %rax
     5c4:      	cmpq	$0x20e, %rax            # imm = 0x20E
     5ca:      	jne	0x570 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x570>
     5cc:      	movl	$0x200, %edx            # imm = 0x200
     5d1:      	leaq	-0xad0(%rbp), %rdi
     5d8:      	movq	%r15, %rsi
     5db:      	callq	0x5e0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x5e0>
     5e0:      	xorl	%eax, %eax
     5e2:      	nopw	%cs:(%rax,%rax)
     5f0:      	movw	$0x0, -0x490(%rbp,%rax)
     5fa:      	movw	$0x0, -0x48e(%rbp,%rax)
     604:      	movw	$0x0, -0x48c(%rbp,%rax)
     60e:      	movw	$0x0, -0x48a(%rbp,%rax)
     618:      	movw	$0x0, -0x488(%rbp,%rax)
     622:      	movw	$0x0, -0x486(%rbp,%rax)
     62c:      	movw	$0x0, -0x484(%rbp,%rax)
     636:      	movw	$0x0, -0x482(%rbp,%rax)
     640:      	addq	$0x10, %rax
     644:      	cmpq	$0x200, %rax            # imm = 0x200
     64a:      	jne	0x5f0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x5f0>
     64c:      	xorl	%eax, %eax
     64e:      	nop
     650:      	movw	$0x0, -0x290(%rbp,%rax)
     65a:      	movw	$0x0, -0x28e(%rbp,%rax)
     664:      	movw	$0x0, -0x28c(%rbp,%rax)
     66e:      	movw	$0x0, -0x28a(%rbp,%rax)
     678:      	movw	$0x0, -0x288(%rbp,%rax)
     682:      	movw	$0x0, -0x286(%rbp,%rax)
     68c:      	movw	$0x0, -0x284(%rbp,%rax)
     696:      	movw	$0x0, -0x282(%rbp,%rax)
     6a0:      	addq	$0x10, %rax
     6a4:      	cmpq	$0x200, %rax            # imm = 0x200
     6aa:      	jne	0x650 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x650>
     6ac:      	movq	-0x90(%rbp), %rax
     6b3:      	cmpq	$0x600, %rax            # imm = 0x600
     6b9:      	jne	0x60 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x60>
     6bf:      	pxor	%xmm0, %xmm0
     6c3:      	movdqa	%xmm0, -0x50(%rbp)
     6c8:      	movdqa	%xmm0, -0x60(%rbp)
     6cd:      	leaq	-0x8d0(%rbp), %rdi
     6d4:      	xorl	%r14d, %r14d
     6d7:      	movl	$0x200, %edx            # imm = 0x200
     6dc:      	xorl	%esi, %esi
     6de:      	callq	0x6e3 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x6e3>
     6e3:      	xorl	%edx, %edx
     6e5:      	movq	-0x30(%rbp), %r15
     6e9:      	nopl	(%rax)
     6f0:      	movq	%rdx, %rax
     6f3:      	shrq	%rax
     6f6:      	movzbl	0x3c0(%r15,%rax), %esi
     6ff:      	movl	%r14d, %eax
     702:      	andb	$0x4, %al
     704:      	movzbl	%al, %eax
     707:      	xorl	%edi, %edi
     709:      	btl	%eax, %esi
     70c:      	setb	%dil
     710:      	orw	-0x8d0(%rbp,%rdx,2), %di
     718:      	leal	0x1(%rax), %ecx
     71b:      	movl	%esi, %r8d
     71e:      	shrl	%cl, %r8d
     721:      	addl	%r8d, %r8d
     724:      	andl	$0x2, %r8d
     728:      	leal	0x2(%rax), %ecx
     72b:      	movl	%esi, %r9d
     72e:      	shrl	%cl, %r9d
     731:      	shll	$0x2, %r9d
     735:      	andl	$0x4, %r9d
     739:      	orl	%r8d, %r9d
     73c:      	orb	$0x3, %al
     73e:      	movl	%eax, %ecx
     740:      	shrl	%cl, %esi
     742:      	shll	$0x3, %esi
     745:      	andl	$0x8, %esi
     748:      	orl	%r9d, %esi
     74b:      	orl	%edi, %esi
     74d:      	movw	%si, -0x8d0(%rbp,%rdx,2)
     755:      	incq	%rdx
     758:      	addb	$0x4, %r14b
     75c:      	cmpq	$0x100, %rdx            # imm = 0x100
     763:      	jne	0x6f0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x6f0>
     765:      	leaq	-0x290(%rbp), %rdi
     76c:      	leaq	-0x8d0(%rbp), %rsi
     773:      	movl	$0x200, %edx            # imm = 0x200
     778:      	callq	0x77d <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x77d>
     77d:      	xorl	%eax, %eax
     77f:      	movdqa	(%rip), %xmm0           # 0x787 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x787>
     787:      	movdqa	(%rip), %xmm4           # 0x78f <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x78f>
     78f:      	nop
     790:      	movdqu	-0x290(%rbp,%rax,2), %xmm1
     799:      	movdqa	%xmm1, %xmm2
     79d:      	pmulhuw	%xmm4, %xmm2
     7a1:      	pmullw	%xmm4, %xmm1
     7a5:      	movdqa	%xmm1, %xmm3
     7a9:      	punpckhwd	%xmm2, %xmm3    # xmm3 = xmm3[4],xmm2[4],xmm3[5],xmm2[5],xmm3[6],xmm2[6],xmm3[7],xmm2[7]
     7ad:      	punpcklwd	%xmm2, %xmm1    # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1],xmm1[2],xmm2[2],xmm1[3],xmm2[3]
     7b1:      	paddd	%xmm0, %xmm1
     7b5:      	paddd	%xmm0, %xmm3
     7b9:      	pslld	$0xc, %xmm3
     7be:      	psrad	$0x10, %xmm3
     7c3:      	pslld	$0xc, %xmm1
     7c8:      	psrad	$0x10, %xmm1
     7cd:      	packssdw	%xmm3, %xmm1
     7d1:      	movdqu	%xmm1, -0x290(%rbp,%rax,2)
     7da:      	addq	$0x8, %rax
     7de:      	cmpq	$0x100, %rax            # imm = 0x100
     7e4:      	jne	0x790 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x790>
     7e6:      	leaq	-0x490(%rbp), %rdi
     7ed:      	leaq	-0x290(%rbp), %rsi
     7f4:      	movl	$0x200, %edx            # imm = 0x200
     7f9:      	callq	0x7fe <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x7fe>
     7fe:      	leaq	-0x8d0(%rbp), %r14
     805:      	leaq	-0xad0(%rbp), %rsi
     80c:      	movl	$0x200, %edx            # imm = 0x200
     811:      	movq	%r14, %rdi
     814:      	callq	0x819 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x819>
     819:      	leaq	-0x290(%rbp), %rdi
     820:      	movq	%r14, %rsi
     823:      	callq	0x828 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x828>
     828:      	movl	$0x1, %eax
     82d:      	nopl	(%rax)
     830:      	movzwl	-0x492(%rbp,%rax,2), %ecx
     838:      	movzwl	-0x292(%rbp,%rax,2), %edx
     840:      	addl	$0xd01, %ecx            # imm = 0xD01
     846:      	subl	%edx, %ecx
     848:      	jb	0x1378 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1378>
     84e:      	imulq	$0x13afb8, %rcx, %rdx   # imm = 0x13AFB8
     855:      	shrq	$0x20, %rdx
     859:      	imull	$0xd01, %edx, %edx      # imm = 0xD01
     85f:      	subl	%edx, %ecx
     861:      	movw	%cx, -0x8d2(%rbp,%rax,2)
     869:      	movzwl	-0x490(%rbp,%rax,2), %ecx
     871:      	movzwl	-0x290(%rbp,%rax,2), %edx
     879:      	addl	$0xd01, %ecx            # imm = 0xD01
     87f:      	subl	%edx, %ecx
     881:      	jb	0x1378 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1378>
     887:      	imulq	$0x13afb8, %rcx, %rdx   # imm = 0x13AFB8
     88e:      	shrq	$0x20, %rdx
     892:      	imull	$0xd01, %edx, %edx      # imm = 0xD01
     898:      	subl	%edx, %ecx
     89a:      	movw	%cx, -0x8d0(%rbp,%rax,2)
     8a2:      	addq	$0x2, %rax
     8a6:      	cmpq	$0x101, %rax            # imm = 0x101
     8ac:      	jne	0x830 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x830>
     8ae:      	leaq	-0xcd0(%rbp), %rdi
     8b5:      	leaq	-0x8d0(%rbp), %rsi
     8bc:      	movl	$0x200, %edx            # imm = 0x200
     8c1:      	callq	0x8c6 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x8c6>
     8c6:      	xorl	%eax, %eax
     8c8:      	pxor	%xmm0, %xmm0
     8cc:      	movdqa	(%rip), %xmm1           # 0x8d4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x8d4>
     8d4:      	movdqa	(%rip), %xmm2           # 0x8dc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x8dc>
     8dc:      	movdqa	(%rip), %xmm6           # 0x8e4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x8e4>
     8e4:      	nopw	%cs:(%rax,%rax)
     8f0:      	movdqu	-0xcd0(%rbp,%rax,2), %xmm3
     8f9:      	movdqa	%xmm3, %xmm4
     8fd:      	punpcklwd	%xmm0, %xmm4    # xmm4 = xmm4[0],xmm0[0],xmm4[1],xmm0[1],xmm4[2],xmm0[2],xmm4[3],xmm0[3]
     901:      	punpckhwd	%xmm0, %xmm3    # xmm3 = xmm3[4],xmm0[4],xmm3[5],xmm0[5],xmm3[6],xmm0[6],xmm3[7],xmm0[7]
     905:      	paddd	%xmm3, %xmm3
     909:      	paddd	%xmm4, %xmm4
     90d:      	paddd	%xmm1, %xmm4
     911:      	paddd	%xmm1, %xmm3
     915:      	pshufd	$0xf5, %xmm3, %xmm5     # xmm5 = xmm3[1,1,3,3]
     91a:      	pmuludq	%xmm6, %xmm3
     91e:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
     923:      	pmuludq	%xmm6, %xmm5
     927:      	pshufd	$0xed, %xmm5, %xmm5     # xmm5 = xmm5[1,3,2,3]
     92c:      	punpckldq	%xmm5, %xmm3    # xmm3 = xmm3[0],xmm5[0],xmm3[1],xmm5[1]
     930:      	pshufd	$0xf5, %xmm4, %xmm5     # xmm5 = xmm4[1,1,3,3]
     935:      	pmuludq	%xmm6, %xmm4
     939:      	pshufd	$0xed, %xmm4, %xmm4     # xmm4 = xmm4[1,3,2,3]
     93e:      	pmuludq	%xmm6, %xmm5
     942:      	pshufd	$0xed, %xmm5, %xmm5     # xmm5 = xmm5[1,3,2,3]
     947:      	punpckldq	%xmm5, %xmm4    # xmm4 = xmm4[0],xmm5[0],xmm4[1],xmm5[1]
     94b:      	packuswb	%xmm3, %xmm4
     94f:      	pand	%xmm2, %xmm4
     953:      	movdqu	%xmm4, -0xcd0(%rbp,%rax,2)
     95c:      	addq	$0x8, %rax
     960:      	cmpq	$0x100, %rax            # imm = 0x100
     966:      	jne	0x8f0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x8f0>
     968:      	leaq	-0x8d0(%rbp), %r12
     96f:      	leaq	-0xcd0(%rbp), %rsi
     976:      	movl	$0x200, %edx            # imm = 0x200
     97b:      	movq	%r12, %rdi
     97e:      	callq	0x983 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x983>
     983:      	leaq	-0x60(%rbp), %r14
     987:      	movl	$0x1, %esi
     98c:      	movl	$0x20, %ecx
     991:      	movq	%r12, %rdi
     994:      	movq	%r14, %rdx
     997:      	callq	0x99c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x99c>
     99c:      	xorl	%eax, %eax
     99e:      	nop
     9a0:      	movw	$0x0, -0x8d0(%rbp,%rax)
     9aa:      	movw	$0x0, -0x8ce(%rbp,%rax)
     9b4:      	movw	$0x0, -0x8cc(%rbp,%rax)
     9be:      	movw	$0x0, -0x8ca(%rbp,%rax)
     9c8:      	movw	$0x0, -0x8c8(%rbp,%rax)
     9d2:      	movw	$0x0, -0x8c6(%rbp,%rax)
     9dc:      	movw	$0x0, -0x8c4(%rbp,%rax)
     9e6:      	movw	$0x0, -0x8c2(%rbp,%rax)
     9f0:      	addq	$0x10, %rax
     9f4:      	cmpq	$0x200, %rax            # imm = 0x200
     9fa:      	jne	0x9a0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x9a0>
     9fc:      	xorl	%eax, %eax
     9fe:      	nop
     a00:      	movw	$0x0, -0x290(%rbp,%rax)
     a0a:      	movw	$0x0, -0x28e(%rbp,%rax)
     a14:      	movw	$0x0, -0x28c(%rbp,%rax)
     a1e:      	movw	$0x0, -0x28a(%rbp,%rax)
     a28:      	movw	$0x0, -0x288(%rbp,%rax)
     a32:      	movw	$0x0, -0x286(%rbp,%rax)
     a3c:      	movw	$0x0, -0x284(%rbp,%rax)
     a46:      	movw	$0x0, -0x282(%rbp,%rax)
     a50:      	addq	$0x10, %rax
     a54:      	cmpq	$0x200, %rax            # imm = 0x200
     a5a:      	jne	0xa00 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xa00>
     a5c:      	xorl	%eax, %eax
     a5e:      	nop
     a60:      	movw	$0x0, -0x490(%rbp,%rax)
     a6a:      	movw	$0x0, -0x48e(%rbp,%rax)
     a74:      	movw	$0x0, -0x48c(%rbp,%rax)
     a7e:      	movw	$0x0, -0x48a(%rbp,%rax)
     a88:      	movw	$0x0, -0x488(%rbp,%rax)
     a92:      	movw	$0x0, -0x486(%rbp,%rax)
     a9c:      	movw	$0x0, -0x484(%rbp,%rax)
     aa6:      	movw	$0x0, -0x482(%rbp,%rax)
     ab0:      	addq	$0x10, %rax
     ab4:      	cmpq	$0x200, %rax            # imm = 0x200
     aba:      	jne	0xa60 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xa60>
     abc:      	leaq	0xaa0(%rbx), %rax
     ac3:      	movq	%r14, -0x490(%rbp)
     aca:      	movq	$0x20, -0x488(%rbp)
     ad5:      	movq	%rax, -0x480(%rbp)
     adc:      	movq	$0x20, -0x478(%rbp)
     ae7:      	leaq	-0x8d0(%rbp), %rdi
     aee:      	leaq	-0x490(%rbp), %rsi
     af5:      	movl	$0x2, %edx
     afa:      	callq	0xaff <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xaff>
     aff:      	movups	-0x8d0(%rbp), %xmm0
     b06:      	movups	-0x8c0(%rbp), %xmm1
     b0d:      	movdqu	-0x8b0(%rbp), %xmm2
     b15:      	movdqu	-0x8a0(%rbp), %xmm3
     b1d:      	movdqa	%xmm3, -0x260(%rbp)
     b25:      	movdqa	%xmm2, -0x270(%rbp)
     b2d:      	movaps	%xmm1, -0x280(%rbp)
     b34:      	movaps	%xmm0, -0x290(%rbp)
     b3b:      	leaq	0xac0(%rbx), %r12
     b42:      	movq	%r12, -0x8d0(%rbp)
     b49:      	movq	$0x20, -0x8c8(%rbp)
     b54:      	movq	%r15, -0x8c0(%rbp)
     b5b:      	movq	$0x440, -0x8b8(%rbp)    # imm = 0x440
     b66:      	leaq	-0x490(%rbp), %rdi
     b6d:      	leaq	-0x8d0(%rbp), %rsi
     b74:      	movl	$0x2, %edx
     b79:      	callq	0xb7e <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xb7e>
     b7e:      	movdqa	-0x490(%rbp), %xmm0
     b86:      	movdqa	-0x480(%rbp), %xmm1
     b8e:      	movdqa	%xmm0, -0x80(%rbp)
     b93:      	movdqa	%xmm1, -0x70(%rbp)
     b98:      	leaq	-0x270(%rbp), %r14
     b9f:      	leaq	-0x8d0(%rbp), %rdi
     ba6:      	leaq	-0x60(%rbp), %rdx
     baa:      	leaq	0x600(%rbx), %rsi
     bb1:      	movq	%r14, %rcx
     bb4:      	callq	0xbb9 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xbb9>
     bb9:      	leaq	0x440(%r15), %rdi
     bc0:      	movq	%r15, %rsi
     bc3:      	callq	0xbc8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xbc8>
     bc8:      	testb	%al, %al
     bca:      	je	0x135e <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x135e>
     bd0:      	leaq	-0x490(%rbp), %rdi
     bd7:      	leaq	-0x8d0(%rbp), %rsi
     bde:      	callq	0xbe3 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xbe3>
     be3:      	testb	%al, %al
     be5:      	je	0x135e <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x135e>
     beb:      	pxor	%xmm0, %xmm0
     bef:      	movl	$0x6, %eax
     bf4:      	pxor	%xmm2, %xmm2
     bf8:      	pxor	%xmm1, %xmm1
     bfc:      	nopl	(%rax)
     c00:      	movzwl	-0x8d6(%rbp,%rax), %ecx
     c08:      	movzwl	-0x8d4(%rbp,%rax), %edx
     c10:      	xorw	-0x6(%r15,%rax), %cx
     c16:      	xorw	-0x4(%r15,%rax), %dx
     c1c:      	movd	%ecx, %xmm4
     c20:      	movd	%edx, %xmm3
     c24:      	punpcklbw	%xmm0, %xmm4    # xmm4 = xmm4[0],xmm0[0],xmm4[1],xmm0[1],xmm4[2],xmm0[2],xmm4[3],xmm0[3],xmm4[4],xmm0[4],xmm4[5],xmm0[5],xmm4[6],xmm0[6],xmm4[7],xmm0[7]
     c28:      	punpcklwd	%xmm0, %xmm4    # xmm4 = xmm4[0],xmm0[0],xmm4[1],xmm0[1],xmm4[2],xmm0[2],xmm4[3],xmm0[3]
     c2c:      	punpckldq	%xmm0, %xmm4    # xmm4 = xmm4[0],xmm0[0],xmm4[1],xmm0[1]
     c30:      	por	%xmm2, %xmm4
     c34:      	punpcklbw	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3],xmm3[4],xmm0[4],xmm3[5],xmm0[5],xmm3[6],xmm0[6],xmm3[7],xmm0[7]
     c38:      	punpcklwd	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3]
     c3c:      	punpckldq	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1]
     c40:      	por	%xmm1, %xmm3
     c44:      	movzwl	-0x8d2(%rbp,%rax), %ecx
     c4c:      	movzwl	-0x8d0(%rbp,%rax), %edx
     c54:      	xorw	-0x2(%r15,%rax), %cx
     c5a:      	xorw	(%r15,%rax), %dx
     c5f:      	movd	%ecx, %xmm2
     c63:      	movd	%edx, %xmm1
     c67:      	punpcklbw	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1],xmm2[2],xmm0[2],xmm2[3],xmm0[3],xmm2[4],xmm0[4],xmm2[5],xmm0[5],xmm2[6],xmm0[6],xmm2[7],xmm0[7]
     c6b:      	punpcklwd	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1],xmm2[2],xmm0[2],xmm2[3],xmm0[3]
     c6f:      	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
     c73:      	por	%xmm4, %xmm2
     c77:      	punpcklbw	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3],xmm1[4],xmm0[4],xmm1[5],xmm0[5],xmm1[6],xmm0[6],xmm1[7],xmm0[7]
     c7b:      	punpcklwd	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3]
     c7f:      	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
     c83:      	por	%xmm3, %xmm1
     c87:      	addq	$0x8, %rax
     c8b:      	cmpq	$0x446, %rax            # imm = 0x446
     c91:      	jne	0xc00 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xc00>
     c97:      	por	%xmm2, %xmm1
     c9b:      	pshufd	$0xee, %xmm1, %xmm0     # xmm0 = xmm1[2,3,2,3]
     ca0:      	por	%xmm1, %xmm0
     ca4:      	movq	%xmm0, %rax
     ca9:      	movl	$0x7, %ecx
     cae:      	nop
     cb0:      	movb	$0x0, -0x8d7(%rbp,%rcx)
     cb8:      	movb	$0x0, -0x8d6(%rbp,%rcx)
     cc0:      	movb	$0x0, -0x8d5(%rbp,%rcx)
     cc8:      	movb	$0x0, -0x8d4(%rbp,%rcx)
     cd0:      	movb	$0x0, -0x8d3(%rbp,%rcx)
     cd8:      	movb	$0x0, -0x8d2(%rbp,%rcx)
     ce0:      	movb	$0x0, -0x8d1(%rbp,%rcx)
     ce8:      	movb	$0x0, -0x8d0(%rbp,%rcx)
     cf0:      	addq	$0x8, %rcx
     cf4:      	cmpq	$0x447, %rcx            # imm = 0x447
     cfb:      	jne	0xcb0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xcb0>
     cfd:      	xorl	%ecx, %ecx
     cff:      	testq	%rax, %rax
     d02:      	setg	%cl
     d05:      	leaq	0xff(%rcx), %rax
     d0c:      	movq	%rax, %xmm0
     d11:      	pshufd	$0x44, %xmm0, %xmm1     # xmm1 = xmm0[0,1,0,1]
     d16:      	negq	%rcx
     d19:      	movq	%rcx, %xmm0
     d1e:      	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
     d23:      	movdqa	-0x290(%rbp), %xmm8
     d2c:      	movdqa	-0x280(%rbp), %xmm3
     d34:      	movdqa	%xmm8, %xmm2
     d39:      	punpcklbw	%xmm2, %xmm2    # xmm2 = xmm2[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
     d3d:      	movdqa	%xmm2, %xmm5
     d41:      	punpcklwd	%xmm5, %xmm5    # xmm5 = xmm5[0,0,1,1,2,2,3,3]
     d45:      	pshufd	$0xd4, %xmm5, %xmm4     # xmm4 = xmm5[0,1,1,3]
     d4a:      	pshufd	$0xf6, %xmm5, %xmm5     # xmm5 = xmm5[2,1,3,3]
     d4f:      	punpckhwd	%xmm2, %xmm2    # xmm2 = xmm2[4,4,5,5,6,6,7,7]
     d53:      	pshufd	$0xd4, %xmm2, %xmm6     # xmm6 = xmm2[0,1,1,3]
     d58:      	pshufd	$0xf6, %xmm2, %xmm7     # xmm7 = xmm2[2,1,3,3]
     d5d:      	punpckhbw	%xmm8, %xmm8    # xmm8 = xmm8[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
     d62:      	movdqa	%xmm8, %xmm2
     d67:      	punpcklwd	%xmm2, %xmm2    # xmm2 = xmm2[0,0,1,1,2,2,3,3]
     d6b:      	pshufd	$0xd4, %xmm2, %xmm9     # xmm9 = xmm2[0,1,1,3]
     d71:      	pshufd	$0xf6, %xmm2, %xmm2     # xmm2 = xmm2[2,1,3,3]
     d76:      	punpckhwd	%xmm8, %xmm8    # xmm8 = xmm8[4,4,5,5,6,6,7,7]
     d7b:      	pshufd	$0xd4, %xmm8, %xmm11    # xmm11 = xmm8[0,1,1,3]
     d81:      	pshufd	$0xf6, %xmm8, %xmm13    # xmm13 = xmm8[2,1,3,3]
     d87:      	movdqa	-0x80(%rbp), %xmm12
     d8d:      	movdqa	%xmm12, %xmm10
     d92:      	punpcklbw	%xmm10, %xmm10  # xmm10 = xmm10[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
     d97:      	punpckhbw	%xmm12, %xmm12  # xmm12 = xmm12[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
     d9c:      	movdqa	%xmm12, %xmm15
     da1:      	punpckhwd	%xmm12, %xmm12  # xmm12 = xmm12[4,4,5,5,6,6,7,7]
     da6:      	pshufd	$0xf6, %xmm12, %xmm8    # xmm8 = xmm12[2,1,3,3]
     dac:      	pand	%xmm1, %xmm13
     db1:      	pand	%xmm0, %xmm8
     db6:      	por	%xmm13, %xmm8
     dbb:      	movdqa	%xmm10, %xmm13
     dc0:      	punpcklwd	%xmm13, %xmm13  # xmm13 = xmm13[0,0,1,1,2,2,3,3]
     dc5:      	punpcklwd	%xmm15, %xmm15  # xmm15 = xmm15[0,0,1,1,2,2,3,3]
     dca:      	pshufd	$0xd4, %xmm12, %xmm12   # xmm12 = xmm12[0,1,1,3]
     dd0:      	pand	%xmm1, %xmm11
     dd5:      	pand	%xmm0, %xmm12
     dda:      	por	%xmm11, %xmm12
     ddf:      	pshufd	$0xf6, %xmm15, %xmm14   # xmm14 = xmm15[2,1,3,3]
     de5:      	pand	%xmm1, %xmm2
     de9:      	pand	%xmm0, %xmm14
     dee:      	por	%xmm2, %xmm14
     df3:      	pshufd	$0xd4, %xmm13, %xmm2    # xmm2 = xmm13[0,1,1,3]
     df9:      	pshufd	$0xf6, %xmm13, %xmm13   # xmm13 = xmm13[2,1,3,3]
     dff:      	punpckhwd	%xmm10, %xmm10  # xmm10 = xmm10[4,4,5,5,6,6,7,7]
     e04:      	pshufd	$0xd4, %xmm15, %xmm11   # xmm11 = xmm15[0,1,1,3]
     e0a:      	pand	%xmm1, %xmm9
     e0f:      	pand	%xmm0, %xmm11
     e14:      	por	%xmm9, %xmm11
     e19:      	pshufd	$0xd4, %xmm10, %xmm9    # xmm9 = xmm10[0,1,1,3]
     e1f:      	pshufd	$0xf6, %xmm10, %xmm10   # xmm10 = xmm10[2,1,3,3]
     e25:      	pand	%xmm1, %xmm7
     e29:      	pand	%xmm1, %xmm6
     e2d:      	pand	%xmm1, %xmm5
     e31:      	pand	%xmm1, %xmm4
     e35:      	pand	%xmm0, %xmm10
     e3a:      	por	%xmm7, %xmm10
     e3f:      	pand	%xmm0, %xmm9
     e44:      	por	%xmm6, %xmm9
     e49:      	pand	%xmm0, %xmm13
     e4e:      	por	%xmm5, %xmm13
     e53:      	pand	%xmm0, %xmm2
     e57:      	por	%xmm4, %xmm2
     e5b:      	movdqa	(%rip), %xmm4           # 0xe63 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xe63>
     e63:      	pand	%xmm4, %xmm8
     e68:      	pand	%xmm4, %xmm12
     e6d:      	packuswb	%xmm8, %xmm12
     e72:      	pand	%xmm4, %xmm14
     e77:      	pand	%xmm4, %xmm11
     e7c:      	packuswb	%xmm14, %xmm11
     e81:      	packuswb	%xmm12, %xmm11
     e86:      	pand	%xmm4, %xmm10
     e8b:      	pand	%xmm4, %xmm9
     e90:      	packuswb	%xmm10, %xmm9
     e95:      	pand	%xmm4, %xmm13
     e9a:      	pand	%xmm4, %xmm2
     e9e:      	packuswb	%xmm13, %xmm2
     ea3:      	packuswb	%xmm9, %xmm2
     ea8:      	packuswb	%xmm11, %xmm2
     ead:      	movdqa	%xmm3, %xmm8
     eb2:      	punpcklbw	%xmm8, %xmm8    # xmm8 = xmm8[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
     eb7:      	movdqa	%xmm8, %xmm6
     ebc:      	punpcklwd	%xmm6, %xmm6    # xmm6 = xmm6[0,0,1,1,2,2,3,3]
     ec0:      	pshufd	$0xd4, %xmm6, %xmm5     # xmm5 = xmm6[0,1,1,3]
     ec5:      	pshufd	$0xf6, %xmm6, %xmm6     # xmm6 = xmm6[2,1,3,3]
     eca:      	punpckhwd	%xmm8, %xmm8    # xmm8 = xmm8[4,4,5,5,6,6,7,7]
     ecf:      	pshufd	$0xd4, %xmm8, %xmm7     # xmm7 = xmm8[0,1,1,3]
     ed5:      	pshufd	$0xf6, %xmm8, %xmm8     # xmm8 = xmm8[2,1,3,3]
     edb:      	punpckhbw	%xmm3, %xmm3    # xmm3 = xmm3[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
     edf:      	movdqa	%xmm3, %xmm10
     ee4:      	punpcklwd	%xmm10, %xmm10  # xmm10 = xmm10[0,0,1,1,2,2,3,3]
     ee9:      	pshufd	$0xd4, %xmm10, %xmm9    # xmm9 = xmm10[0,1,1,3]
     eef:      	pshufd	$0xf6, %xmm10, %xmm10   # xmm10 = xmm10[2,1,3,3]
     ef5:      	punpckhwd	%xmm3, %xmm3    # xmm3 = xmm3[4,4,5,5,6,6,7,7]
     ef9:      	pshufd	$0xd4, %xmm3, %xmm12    # xmm12 = xmm3[0,1,1,3]
     eff:      	pshufd	$0xf6, %xmm3, %xmm15    # xmm15 = xmm3[2,1,3,3]
     f05:      	movdqa	-0x70(%rbp), %xmm11
     f0b:      	movdqa	%xmm11, %xmm3
     f10:      	punpckhbw	%xmm11, %xmm11  # xmm11 = xmm11[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
     f15:      	movdqa	%xmm11, %xmm14
     f1a:      	punpckhwd	%xmm11, %xmm11  # xmm11 = xmm11[4,4,5,5,6,6,7,7]
     f1f:      	pand	%xmm1, %xmm15
     f24:      	pand	%xmm1, %xmm12
     f29:      	pand	%xmm1, %xmm10
     f2e:      	pand	%xmm1, %xmm9
     f33:      	pand	%xmm1, %xmm8
     f38:      	pand	%xmm1, %xmm7
     f3c:      	pand	%xmm1, %xmm6
     f40:      	pand	%xmm1, %xmm5
     f44:      	pshufd	$0xf6, %xmm11, %xmm13   # xmm13 = xmm11[2,1,3,3]
     f4a:      	pand	%xmm0, %xmm13
     f4f:      	por	%xmm15, %xmm13
     f54:      	punpcklbw	%xmm3, %xmm3    # xmm3 = xmm3[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
     f58:      	punpcklwd	%xmm14, %xmm14  # xmm14 = xmm14[0,0,1,1,2,2,3,3]
     f5d:      	pshufd	$0xd4, %xmm11, %xmm11   # xmm11 = xmm11[0,1,1,3]
     f63:      	pand	%xmm0, %xmm11
     f68:      	por	%xmm12, %xmm11
     f6d:      	pshufd	$0xf6, %xmm14, %xmm12   # xmm12 = xmm14[2,1,3,3]
     f73:      	pand	%xmm0, %xmm12
     f78:      	por	%xmm10, %xmm12
     f7d:      	movdqa	%xmm3, %xmm10
     f82:      	punpckhwd	%xmm3, %xmm3    # xmm3 = xmm3[4,4,5,5,6,6,7,7]
     f86:      	pshufd	$0xd4, %xmm14, %xmm1    # xmm1 = xmm14[0,1,1,3]
     f8c:      	pand	%xmm0, %xmm1
     f90:      	por	%xmm9, %xmm1
     f95:      	pshufd	$0xf6, %xmm3, %xmm9     # xmm9 = xmm3[2,1,3,3]
     f9b:      	pand	%xmm0, %xmm9
     fa0:      	por	%xmm8, %xmm9
     fa5:      	punpcklwd	%xmm10, %xmm10  # xmm10 = xmm10[0,0,1,1,2,2,3,3]
     faa:      	pshufd	$0xd4, %xmm3, %xmm3     # xmm3 = xmm3[0,1,1,3]
     faf:      	pand	%xmm0, %xmm3
     fb3:      	por	%xmm7, %xmm3
     fb7:      	pshufd	$0xf6, %xmm10, %xmm7    # xmm7 = xmm10[2,1,3,3]
     fbd:      	pand	%xmm0, %xmm7
     fc1:      	por	%xmm6, %xmm7
     fc5:      	pshufd	$0xd4, %xmm10, %xmm6    # xmm6 = xmm10[0,1,1,3]
     fcb:      	pand	%xmm0, %xmm6
     fcf:      	por	%xmm5, %xmm6
     fd3:      	pand	%xmm4, %xmm13
     fd8:      	pand	%xmm4, %xmm11
     fdd:      	packuswb	%xmm13, %xmm11
     fe2:      	pand	%xmm4, %xmm12
     fe7:      	pand	%xmm4, %xmm1
     feb:      	packuswb	%xmm12, %xmm1
     ff0:      	packuswb	%xmm11, %xmm1
     ff5:      	pand	%xmm4, %xmm9
     ffa:      	pand	%xmm4, %xmm3
     ffe:      	packuswb	%xmm9, %xmm3
    1003:      	pand	%xmm4, %xmm7
    1007:      	pand	%xmm4, %xmm6
    100b:      	packuswb	%xmm7, %xmm6
    100f:      	packuswb	%xmm3, %xmm6
    1013:      	packuswb	%xmm1, %xmm6
    1017:      	movq	-0x88(%rbp), %rdi
    101e:      	movdqu	%xmm2, 0x1(%rdi)
    1023:      	movdqu	%xmm6, 0x11(%rdi)
    1028:      	movb	$0x0, (%rdi)
    102b:      	pxor	%xmm0, %xmm0
    102f:      	movdqa	%xmm0, -0x8d0(%rbp)
    1037:      	movaps	-0x8d0(%rbp), %xmm1
    103e:      	movaps	%xmm1, -0x80(%rbp)
    1042:      	movdqa	%xmm0, -0x8d0(%rbp)
    104a:      	movaps	-0x8d0(%rbp), %xmm1
    1051:      	movaps	%xmm1, -0x70(%rbp)
    1055:      	movdqa	%xmm0, -0x8d0(%rbp)
    105d:      	movaps	-0x8d0(%rbp), %xmm1
    1064:      	movaps	%xmm1, -0x290(%rbp)
    106b:      	movdqa	%xmm0, -0x8d0(%rbp)
    1073:      	movaps	-0x8d0(%rbp), %xmm1
    107a:      	movaps	%xmm1, -0x280(%rbp)
    1081:      	movdqa	%xmm0, -0x8d0(%rbp)
    1089:      	movaps	-0x8d0(%rbp), %xmm1
    1090:      	movups	%xmm1, (%r14)
    1094:      	movdqa	%xmm0, -0x8d0(%rbp)
    109c:      	movaps	-0x8d0(%rbp), %xmm1
    10a3:      	movaps	%xmm1, -0x260(%rbp)
    10aa:      	movdqa	%xmm0, -0x8d0(%rbp)
    10b2:      	movaps	-0x8d0(%rbp), %xmm1
    10b9:      	movaps	%xmm1, -0x60(%rbp)
    10bd:      	movdqa	%xmm0, -0x8d0(%rbp)
    10c5:      	movaps	-0x8d0(%rbp), %xmm0
    10cc:      	movaps	%xmm0, -0x50(%rbp)
    10d0:      	xorl	%eax, %eax
    10d2:      	nopw	%cs:(%rax,%rax)
    10e0:      	movw	$0x0, (%rbx,%rax)
    10e6:      	movw	$0x0, 0x2(%rbx,%rax)
    10ed:      	movw	$0x0, 0x4(%rbx,%rax)
    10f4:      	movw	$0x0, 0x6(%rbx,%rax)
    10fb:      	movw	$0x0, 0x8(%rbx,%rax)
    1102:      	movw	$0x0, 0xa(%rbx,%rax)
    1109:      	movw	$0x0, 0xc(%rbx,%rax)
    1110:      	movw	$0x0, 0xe(%rbx,%rax)
    1117:      	addq	$0x10, %rax
    111b:      	cmpq	$0x200, %rax            # imm = 0x200
    1121:      	jne	0x10e0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x10e0>
    1123:      	xorl	%eax, %eax
    1125:      	nopw	%cs:(%rax,%rax)
    1130:      	movw	$0x0, 0x200(%rbx,%rax)
    113a:      	movw	$0x0, 0x202(%rbx,%rax)
    1144:      	movw	$0x0, 0x204(%rbx,%rax)
    114e:      	movw	$0x0, 0x206(%rbx,%rax)
    1158:      	movw	$0x0, 0x208(%rbx,%rax)
    1162:      	movw	$0x0, 0x20a(%rbx,%rax)
    116c:      	movw	$0x0, 0x20c(%rbx,%rax)
    1176:      	movw	$0x0, 0x20e(%rbx,%rax)
    1180:      	addq	$0x10, %rax
    1184:      	cmpq	$0x200, %rax            # imm = 0x200
    118a:      	jne	0x1130 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1130>
    118c:      	xorl	%eax, %eax
    118e:      	nop
    1190:      	movw	$0x0, 0x400(%rbx,%rax)
    119a:      	movw	$0x0, 0x402(%rbx,%rax)
    11a4:      	movw	$0x0, 0x404(%rbx,%rax)
    11ae:      	movw	$0x0, 0x406(%rbx,%rax)
    11b8:      	movw	$0x0, 0x408(%rbx,%rax)
    11c2:      	movw	$0x0, 0x40a(%rbx,%rax)
    11cc:      	movw	$0x0, 0x40c(%rbx,%rax)
    11d6:      	movw	$0x0, 0x40e(%rbx,%rax)
    11e0:      	addq	$0x10, %rax
    11e4:      	cmpq	$0x200, %rax            # imm = 0x200
    11ea:      	jne	0x1190 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1190>
    11ec:      	xorps	%xmm0, %xmm0
    11ef:      	movaps	%xmm0, -0x8d0(%rbp)
    11f6:      	movaps	-0x8d0(%rbp), %xmm1
    11fd:      	movups	%xmm1, (%r12)
    1202:      	jmp	0x1334 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1334>
    1207:      	movw	$0x1, (%rdi)
    120c:      	xorl	%eax, %eax
    120e:      	nop
    1210:      	movw	$0x0, (%rbx,%rax)
    1216:      	movw	$0x0, 0x2(%rbx,%rax)
    121d:      	movw	$0x0, 0x4(%rbx,%rax)
    1224:      	movw	$0x0, 0x6(%rbx,%rax)
    122b:      	movw	$0x0, 0x8(%rbx,%rax)
    1232:      	movw	$0x0, 0xa(%rbx,%rax)
    1239:      	movw	$0x0, 0xc(%rbx,%rax)
    1240:      	movw	$0x0, 0xe(%rbx,%rax)
    1247:      	addq	$0x10, %rax
    124b:      	cmpq	$0x200, %rax            # imm = 0x200
    1251:      	jne	0x1210 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1210>
    1253:      	xorl	%eax, %eax
    1255:      	nopw	%cs:(%rax,%rax)
    1260:      	movw	$0x0, 0x200(%rbx,%rax)
    126a:      	movw	$0x0, 0x202(%rbx,%rax)
    1274:      	movw	$0x0, 0x204(%rbx,%rax)
    127e:      	movw	$0x0, 0x206(%rbx,%rax)
    1288:      	movw	$0x0, 0x208(%rbx,%rax)
    1292:      	movw	$0x0, 0x20a(%rbx,%rax)
    129c:      	movw	$0x0, 0x20c(%rbx,%rax)
    12a6:      	movw	$0x0, 0x20e(%rbx,%rax)
    12b0:      	addq	$0x10, %rax
    12b4:      	cmpq	$0x200, %rax            # imm = 0x200
    12ba:      	jne	0x1260 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1260>
    12bc:      	xorl	%eax, %eax
    12be:      	nop
    12c0:      	movw	$0x0, 0x400(%rbx,%rax)
    12ca:      	movw	$0x0, 0x402(%rbx,%rax)
    12d4:      	movw	$0x0, 0x404(%rbx,%rax)
    12de:      	movw	$0x0, 0x406(%rbx,%rax)
    12e8:      	movw	$0x0, 0x408(%rbx,%rax)
    12f2:      	movw	$0x0, 0x40a(%rbx,%rax)
    12fc:      	movw	$0x0, 0x40c(%rbx,%rax)
    1306:      	movw	$0x0, 0x40e(%rbx,%rax)
    1310:      	addq	$0x10, %rax
    1314:      	cmpq	$0x200, %rax            # imm = 0x200
    131a:      	jne	0x12c0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x12c0>
    131c:      	xorps	%xmm0, %xmm0
    131f:      	movaps	%xmm0, -0x8d0(%rbp)
    1326:      	movaps	-0x8d0(%rbp), %xmm1
    132d:      	movups	%xmm1, 0xac0(%rbx)
    1334:      	movaps	%xmm0, -0x8d0(%rbp)
    133b:      	movaps	-0x8d0(%rbp), %xmm0
    1342:      	movups	%xmm0, 0xad0(%rbx)
    1349:      	movq	%rdi, %rax
    134c:      	addq	$0xca8, %rsp            # imm = 0xCA8
    1353:      	popq	%rbx
    1354:      	popq	%r12
    1356:      	popq	%r13
    1358:      	popq	%r14
    135a:      	popq	%r15
    135c:      	popq	%rbp
    135d:      	retq
    135e:      	leaq	(%rip), %rdi            # 0x1365 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1365>
    1365:      	leaq	(%rip), %rcx            # 0x136c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x136c>
    136c:      	movl	$0x193, %esi            # imm = 0x193
    1371:      	xorl	%edx, %edx
    1373:      	callq	0x1378 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1378>
    1378:      	leaq	(%rip), %rdi            # 0x137f <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x137f>
    137f:      	callq	0x1384 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1384>
    1384:      	ud2
    1386:      	callq	0x138b <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x138b>
    138b:      	callq	0x1390 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1390>
    1390:      	movq	%rax, %r14
    1393:      	pxor	%xmm0, %xmm0
    1397:      	movdqa	%xmm0, -0x490(%rbp)
    139f:      	movaps	-0x490(%rbp), %xmm1
    13a6:      	movaps	%xmm1, -0x80(%rbp)
    13aa:      	movdqa	%xmm0, -0x490(%rbp)
    13b2:      	movaps	-0x490(%rbp), %xmm0
    13b9:      	movaps	%xmm0, -0x70(%rbp)
    13bd:      	jmp	0x13c2 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x13c2>
    13bf:      	movq	%rax, %r14
    13c2:      	xorps	%xmm0, %xmm0
    13c5:      	movaps	%xmm0, -0xcd0(%rbp)
    13cc:      	movaps	-0xcd0(%rbp), %xmm1
    13d3:      	movaps	%xmm1, -0x290(%rbp)
    13da:      	movaps	%xmm0, -0xcd0(%rbp)
    13e1:      	movaps	-0xcd0(%rbp), %xmm1
    13e8:      	movaps	%xmm1, -0x280(%rbp)
    13ef:      	movaps	%xmm0, -0xcd0(%rbp)
    13f6:      	movdqa	-0xcd0(%rbp), %xmm1
    13fe:      	movdqa	%xmm1, -0x270(%rbp)
    1406:      	movaps	%xmm0, -0xcd0(%rbp)
    140d:      	movdqa	-0xcd0(%rbp), %xmm0
    1415:      	movdqa	%xmm0, -0x260(%rbp)
    141d:      	jmp	0x15cc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x15cc>
    1422:      	movq	%rax, %r14
    1425:      	jmp	0x15cc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x15cc>
    142a:      	movq	%rax, %r14
    142d:      	xorl	%eax, %eax
    142f:      	nop
    1430:      	movw	$0x0, -0x8d0(%rbp,%rax)
    143a:      	movw	$0x0, -0x8ce(%rbp,%rax)
    1444:      	movw	$0x0, -0x8cc(%rbp,%rax)
    144e:      	movw	$0x0, -0x8ca(%rbp,%rax)
    1458:      	movw	$0x0, -0x8c8(%rbp,%rax)
    1462:      	movw	$0x0, -0x8c6(%rbp,%rax)
    146c:      	movw	$0x0, -0x8c4(%rbp,%rax)
    1476:      	movw	$0x0, -0x8c2(%rbp,%rax)
    1480:      	addq	$0x10, %rax
    1484:      	cmpq	$0x200, %rax            # imm = 0x200
    148a:      	jne	0x1430 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1430>
    148c:      	jmp	0x1504 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1504>
    148e:      	movq	%rax, %r14
    1491:      	jmp	0x156c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x156c>
    1496:      	movq	%rax, %r14
    1499:      	xorl	%eax, %eax
    149b:      	nopl	(%rax,%rax)
    14a0:      	movw	$0x0, -0xad0(%rbp,%rax)
    14aa:      	movw	$0x0, -0xace(%rbp,%rax)
    14b4:      	movw	$0x0, -0xacc(%rbp,%rax)
    14be:      	movw	$0x0, -0xaca(%rbp,%rax)
    14c8:      	movw	$0x0, -0xac8(%rbp,%rax)
    14d2:      	movw	$0x0, -0xac6(%rbp,%rax)
    14dc:      	movw	$0x0, -0xac4(%rbp,%rax)
    14e6:      	movw	$0x0, -0xac2(%rbp,%rax)
    14f0:      	addq	$0x10, %rax
    14f4:      	cmpq	$0x200, %rax            # imm = 0x200
    14fa:      	jne	0x14a0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x14a0>
    14fc:      	jmp	0x15fa <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x15fa>
    1501:      	movq	%rax, %r14
    1504:      	xorl	%eax, %eax
    1506:      	nopw	%cs:(%rax,%rax)
    1510:      	movw	$0x0, -0x290(%rbp,%rax)
    151a:      	movw	$0x0, -0x28e(%rbp,%rax)
    1524:      	movw	$0x0, -0x28c(%rbp,%rax)
    152e:      	movw	$0x0, -0x28a(%rbp,%rax)
    1538:      	movw	$0x0, -0x288(%rbp,%rax)
    1542:      	movw	$0x0, -0x286(%rbp,%rax)
    154c:      	movw	$0x0, -0x284(%rbp,%rax)
    1556:      	movw	$0x0, -0x282(%rbp,%rax)
    1560:      	addq	$0x10, %rax
    1564:      	cmpq	$0x200, %rax            # imm = 0x200
    156a:      	jne	0x1510 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1510>
    156c:      	xorl	%eax, %eax
    156e:      	nop
    1570:      	movw	$0x0, -0x490(%rbp,%rax)
    157a:      	movw	$0x0, -0x48e(%rbp,%rax)
    1584:      	movw	$0x0, -0x48c(%rbp,%rax)
    158e:      	movw	$0x0, -0x48a(%rbp,%rax)
    1598:      	movw	$0x0, -0x488(%rbp,%rax)
    15a2:      	movw	$0x0, -0x486(%rbp,%rax)
    15ac:      	movw	$0x0, -0x484(%rbp,%rax)
    15b6:      	movw	$0x0, -0x482(%rbp,%rax)
    15c0:      	addq	$0x10, %rax
    15c4:      	cmpq	$0x200, %rax            # imm = 0x200
    15ca:      	jne	0x1570 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1570>
    15cc:      	pxor	%xmm0, %xmm0
    15d0:      	movdqa	%xmm0, -0xcd0(%rbp)
    15d8:      	movdqa	-0xcd0(%rbp), %xmm1
    15e0:      	movdqa	%xmm1, -0x60(%rbp)
    15e5:      	movdqa	%xmm0, -0xcd0(%rbp)
    15ed:      	movdqa	-0xcd0(%rbp), %xmm0
    15f5:      	movdqa	%xmm0, -0x50(%rbp)
    15fa:      	movq	%rbx, %rdi
    15fd:      	callq	0x1602 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1602>
    1602:      	movq	%r14, %rdi
    1605:      	callq	0x160a <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x160a>
    160a:      	callq	0x160f <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x160f>

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
      14:      	movq	%rdi, -0x50(%rbp)
      18:      	movl	$0x80, %esi
      1d:      	movl	$0x1, %eax
      22:      	movq	%rax, -0x30(%rbp)
      26:      	movdqa	(%rip), %xmm0           # 0x2e <<toyos_crypto::mlkem::Poly>::ntt+0x2e>
      2e:      	movdqa	(%rip), %xmm1           # 0x36 <<toyos_crypto::mlkem::Poly>::ntt+0x36>
      36:      	pxor	%xmm2, %xmm2
      3a:      	movdqa	(%rip), %xmm3           # 0x42 <<toyos_crypto::mlkem::Poly>::ntt+0x42>
      42:      	jmp	0x6b <<toyos_crypto::mlkem::Poly>::ntt+0x6b>
      44:      	nopw	%cs:(%rax,%rax)
      50:      	movq	-0x58(%rbp), %rax
      54:      	movq	%rax, -0x30(%rbp)
      58:      	movq	%rsi, %rax
      5b:      	shrq	%rax
      5e:      	cmpq	$0x3, %rsi
      62:      	movq	%rax, %rsi
      65:      	jbe	0x5cf <<toyos_crypto::mlkem::Poly>::ntt+0x5cf>
      6b:      	leaq	(%rsi,%rsi), %rdx
      6f:      	tzcntq	%rdx, %rcx
      74:      	movl	$0x100, %r15d           # imm = 0x100
      7a:      	shrq	%cl, %r15
      7d:      	leal	-0x1(%rdx), %eax
      80:      	btl	$0x8, %eax
      84:      	adcq	$0x0, %r15
      88:      	je	0x58 <<toyos_crypto::mlkem::Poly>::ntt+0x58>
      8a:      	movq	-0x30(%rbp), %rax
      8e:      	addq	%r15, %rax
      91:      	movq	%rax, -0x58(%rbp)
      95:      	movq	%rdx, %rax
      98:      	negq	%rax
      9b:      	movq	%rax, -0x68(%rbp)
      9f:      	leaq	(%rbx,%rdx), %r13
      a3:      	leaq	(%rbx,%rdx), %rax
      a7:      	addq	$0x2, %rax
      ab:      	movq	%rax, -0x60(%rbp)
      af:      	leaq	(%rbx,%rsi,2), %rcx
      b3:      	movq	%rsi, %rdi
      b6:      	negq	%rdi
      b9:      	movq	%rbx, %r14
      bc:      	xorl	%r10d, %r10d
      bf:      	movq	%rsi, %rax
      c2:      	movq	$0x0, -0x40(%rbp)
      ca:      	nopw	(%rax,%rax)
      d0:      	cmpq	$0x101, %rax            # imm = 0x101
      d6:      	movl	$0x100, %r9d            # imm = 0x100
      dc:      	cmovaeq	%rax, %r9
      e0:      	movq	%rdi, -0x78(%rbp)
      e4:      	addq	%r9, %rdi
      e7:      	leaq	-0x1(%rsi), %r8
      eb:      	cmpq	%r8, %rdi
      ee:      	cmovaeq	%r8, %rdi
      f2:      	movq	-0x68(%rbp), %rdx
      f6:      	movq	%r10, -0x48(%rbp)
      fa:      	imulq	%r10, %rdx
      fe:      	subq	%rsi, %rdx
     101:      	addq	%r9, %rdx
     104:      	cmpq	%r8, %rdx
     107:      	movq	%r8, %r10
     10a:      	cmovbq	%rdx, %r10
     10e:      	cmovaeq	%r8, %rdx
     112:      	movq	-0x30(%rbp), %r8
     116:      	movl	%r8d, %r9d
     119:      	rolb	$0x4, %r9b
     11d:      	movl	%r9d, %r11d
     120:      	andb	$0x33, %r11b
     124:      	shlb	$0x2, %r11b
     128:      	shrb	$0x2, %r9b
     12c:      	andb	$0x33, %r9b
     130:      	orb	%r11b, %r9b
     133:      	movl	%r9d, %r11d
     136:      	andb	$0x55, %r11b
     13a:      	addb	%r11b, %r11b
     13d:      	shrb	%r9b
     140:      	andb	$0x54, %r9b
     144:      	orb	%r11b, %r9b
     147:      	shrb	%r9b
     14a:      	movq	%rdi, -0x70(%rbp)
     14e:      	je	0x1e0 <<toyos_crypto::mlkem::Poly>::ntt+0x1e0>
     154:      	movq	%r15, -0x38(%rbp)
     158:      	movzbl	%r9b, %r12d
     15c:      	movw	$0x1, %r9w
     161:      	movw	$0x11, %r11w
     166:      	jmp	0x194 <<toyos_crypto::mlkem::Poly>::ntt+0x194>
     168:      	nopl	(%rax,%rax)
     170:      	imull	%r11d, %r11d
     174:      	movq	%r11, %r8
     177:      	movl	$0x9d7dbb41, %r15d      # imm = 0x9D7DBB41
     17d:      	imulq	%r15, %r8
     181:      	shrq	$0x2b, %r8
     185:      	imull	$0xd01, %r8d, %r8d      # imm = 0xD01
     18c:      	subl	%r8d, %r11d
     18f:      	shrl	%r12d
     192:      	je	0x1d0 <<toyos_crypto::mlkem::Poly>::ntt+0x1d0>
     194:      	movzwl	%r11w, %r11d
     198:      	testb	$0x1, %r12b
     19c:      	je	0x170 <<toyos_crypto::mlkem::Poly>::ntt+0x170>
     19e:      	movzwl	%r9w, %r9d
     1a2:      	imull	%r11d, %r9d
     1a6:      	imulq	$0x3afb7681, %r9, %r15  # imm = 0x3AFB7681
     1ad:      	shrq	$0x20, %r15
     1b1:      	movl	%r9d, %r8d
     1b4:      	subl	%r15d, %r8d
     1b7:      	shrl	%r8d
     1ba:      	addl	%r15d, %r8d
     1bd:      	shrl	$0xb, %r8d
     1c1:      	imull	$0xd01, %r8d, %r8d      # imm = 0xD01
     1c8:      	subl	%r8d, %r9d
     1cb:      	jmp	0x170 <<toyos_crypto::mlkem::Poly>::ntt+0x170>
     1cd:      	nopl	(%rax)
     1d0:      	movzwl	%r9w, %r12d
     1d4:      	movq	-0x38(%rbp), %r15
     1d8:      	jmp	0x1e6 <<toyos_crypto::mlkem::Poly>::ntt+0x1e6>
     1da:      	nopw	(%rax,%rax)
     1e0:      	movl	$0x1, %r12d
     1e6:      	incq	-0x30(%rbp)
     1ea:      	movq	-0x40(%rbp), %rdi
     1ee:      	je	0x608 <<toyos_crypto::mlkem::Poly>::ntt+0x608>
     1f4:      	movq	%rdi, %r9
     1f7:      	cmpq	$0x7, %r10
     1fb:      	jbe	0x4f3 <<toyos_crypto::mlkem::Poly>::ntt+0x4f3>
     201:      	leaq	(,%rsi,4), %r9
     209:      	imulq	-0x48(%rbp), %r9
     20e:      	leaq	(%rbx,%r9), %r11
     212:      	movq	%r10, -0x38(%rbp)
     216:      	movq	%r15, %r10
     219:      	leaq	(%r11,%rdx,2), %r15
     21d:      	addq	$0x2, %r15
     221:      	leaq	(%r9,%r13), %r8
     225:      	cmpq	%r15, %r8
     228:      	movq	%r10, %r15
     22b:      	movq	-0x38(%rbp), %r10
     22f:      	jae	0x245 <<toyos_crypto::mlkem::Poly>::ntt+0x245>
     231:      	addq	-0x60(%rbp), %r9
     235:      	leaq	(%r9,%rdx,2), %rdx
     239:      	movq	%rdi, %r9
     23c:      	cmpq	%rdx, %r11
     23f:      	jb	0x4f3 <<toyos_crypto::mlkem::Poly>::ntt+0x4f3>
     245:      	incq	%r10
     248:      	movl	%r10d, %edx
     24b:      	andl	$0x7, %edx
     24e:      	movl	$0x8, %r8d
     254:      	cmoveq	%r8, %rdx
     258:      	subq	%rdx, %r10
     25b:      	movq	%r10, %r9
     25e:      	addq	%rdi, %r9
     261:      	movd	%r12d, %xmm4
     266:      	pshufd	$0x0, %xmm4, %xmm4      # xmm4 = xmm4[0,0,0,0]
     26b:      	movq	-0x70(%rbp), %rdi
     26f:      	subq	%rdx, %rdi
     272:      	incq	%rdi
     275:      	pslld	$0x10, %xmm4
     27a:      	psrad	$0x10, %xmm4
     27f:      	packssdw	%xmm4, %xmm4
     283:      	xorl	%r10d, %r10d
     286:      	nopw	%cs:(%rax,%rax)
     290:      	movdqu	(%rcx,%r10,2), %xmm5
     296:      	movdqa	%xmm4, %xmm7
     29a:      	pmulhuw	%xmm5, %xmm7
     29e:      	pmullw	%xmm4, %xmm5
     2a2:      	movdqa	%xmm5, %xmm6
     2a6:      	punpcklwd	%xmm7, %xmm6    # xmm6 = xmm6[0],xmm7[0],xmm6[1],xmm7[1],xmm6[2],xmm7[2],xmm6[3],xmm7[3]
     2aa:      	punpckhwd	%xmm7, %xmm5    # xmm5 = xmm5[4],xmm7[4],xmm5[5],xmm7[5],xmm5[6],xmm7[6],xmm5[7],xmm7[7]
     2ae:      	movdqa	%xmm5, %xmm7
     2b2:      	pmuludq	%xmm0, %xmm7
     2b6:      	pshufd	$0xed, %xmm7, %xmm7     # xmm7 = xmm7[1,3,2,3]
     2bb:      	pshufd	$0xf5, %xmm5, %xmm8     # xmm8 = xmm5[1,1,3,3]
     2c1:      	pmuludq	%xmm0, %xmm8
     2c6:      	pshufd	$0xed, %xmm8, %xmm8     # xmm8 = xmm8[1,3,2,3]
     2cc:      	punpckldq	%xmm8, %xmm7    # xmm7 = xmm7[0],xmm8[0],xmm7[1],xmm8[1]
     2d1:      	movdqa	%xmm5, %xmm8
     2d6:      	psubd	%xmm7, %xmm8
     2db:      	psrld	$0x1, %xmm8
     2e1:      	paddd	%xmm7, %xmm8
     2e6:      	psrld	$0xb, %xmm8
     2ec:      	pshufd	$0xf5, %xmm8, %xmm7     # xmm7 = xmm8[1,1,3,3]
     2f2:      	pmuludq	%xmm1, %xmm8
     2f7:      	pshufd	$0xe8, %xmm8, %xmm8     # xmm8 = xmm8[0,2,2,3]
     2fd:      	pmuludq	%xmm1, %xmm7
     301:      	pshufd	$0xe8, %xmm7, %xmm7     # xmm7 = xmm7[0,2,2,3]
     306:      	punpckldq	%xmm7, %xmm8    # xmm8 = xmm8[0],xmm7[0],xmm8[1],xmm7[1]
     30b:      	psubd	%xmm8, %xmm5
     310:      	movdqa	%xmm6, %xmm7
     314:      	pmuludq	%xmm0, %xmm7
     318:      	pshufd	$0xed, %xmm7, %xmm7     # xmm7 = xmm7[1,3,2,3]
     31d:      	pshufd	$0xf5, %xmm6, %xmm8     # xmm8 = xmm6[1,1,3,3]
     323:      	pmuludq	%xmm0, %xmm8
     328:      	pshufd	$0xed, %xmm8, %xmm8     # xmm8 = xmm8[1,3,2,3]
     32e:      	punpckldq	%xmm8, %xmm7    # xmm7 = xmm7[0],xmm8[0],xmm7[1],xmm8[1]
     333:      	movdqa	%xmm6, %xmm8
     338:      	psubd	%xmm7, %xmm8
     33d:      	psrld	$0x1, %xmm8
     343:      	paddd	%xmm7, %xmm8
     348:      	psrld	$0xb, %xmm8
     34e:      	pshufd	$0xf5, %xmm8, %xmm7     # xmm7 = xmm8[1,1,3,3]
     354:      	pmuludq	%xmm1, %xmm8
     359:      	pshufd	$0xe8, %xmm8, %xmm8     # xmm8 = xmm8[0,2,2,3]
     35f:      	pmuludq	%xmm1, %xmm7
     363:      	pshufd	$0xe8, %xmm7, %xmm7     # xmm7 = xmm7[0,2,2,3]
     368:      	punpckldq	%xmm7, %xmm8    # xmm8 = xmm8[0],xmm7[0],xmm8[1],xmm7[1]
     36d:      	psubd	%xmm8, %xmm6
     372:      	movdqu	(%r14,%r10,2), %xmm7
     378:      	movdqa	%xmm7, %xmm8
     37d:      	punpckhwd	%xmm2, %xmm8    # xmm8 = xmm8[4],xmm2[4],xmm8[5],xmm2[5],xmm8[6],xmm2[6],xmm8[7],xmm2[7]
     382:      	punpcklwd	%xmm2, %xmm7    # xmm7 = xmm7[0],xmm2[0],xmm7[1],xmm2[1],xmm7[2],xmm2[2],xmm7[3],xmm2[3]
     386:      	movdqa	%xmm7, %xmm9
     38b:      	psubd	%xmm6, %xmm9
     390:      	paddd	%xmm1, %xmm9
     395:      	movdqa	%xmm8, %xmm10
     39a:      	psubd	%xmm5, %xmm10
     39f:      	paddd	%xmm1, %xmm10
     3a4:      	movdqa	%xmm10, %xmm11
     3a9:      	pmuludq	%xmm0, %xmm11
     3ae:      	pshufd	$0xed, %xmm11, %xmm11   # xmm11 = xmm11[1,3,2,3]
     3b4:      	pshufd	$0xf5, %xmm10, %xmm12   # xmm12 = xmm10[1,1,3,3]
     3ba:      	pmuludq	%xmm0, %xmm12
     3bf:      	pshufd	$0xed, %xmm12, %xmm12   # xmm12 = xmm12[1,3,2,3]
     3c5:      	punpckldq	%xmm12, %xmm11  # xmm11 = xmm11[0],xmm12[0],xmm11[1],xmm12[1]
     3ca:      	movdqa	%xmm10, %xmm12
     3cf:      	psubd	%xmm11, %xmm12
     3d4:      	psrld	$0x1, %xmm12
     3da:      	paddd	%xmm11, %xmm12
     3df:      	psrld	$0xb, %xmm12
     3e5:      	pshufd	$0xf5, %xmm12, %xmm11   # xmm11 = xmm12[1,1,3,3]
     3eb:      	pmuludq	%xmm1, %xmm12
     3f0:      	pshufd	$0xe8, %xmm12, %xmm12   # xmm12 = xmm12[0,2,2,3]
     3f6:      	pmuludq	%xmm1, %xmm11
     3fb:      	pshufd	$0xe8, %xmm11, %xmm11   # xmm11 = xmm11[0,2,2,3]
     401:      	punpckldq	%xmm11, %xmm12  # xmm12 = xmm12[0],xmm11[0],xmm12[1],xmm11[1]
     406:      	psubd	%xmm12, %xmm10
     40b:      	movdqa	%xmm9, %xmm11
     410:      	pmuludq	%xmm0, %xmm11
     415:      	pshufd	$0xed, %xmm11, %xmm11   # xmm11 = xmm11[1,3,2,3]
     41b:      	pshufd	$0xf5, %xmm9, %xmm12    # xmm12 = xmm9[1,1,3,3]
     421:      	pmuludq	%xmm0, %xmm12
     426:      	pshufd	$0xed, %xmm12, %xmm12   # xmm12 = xmm12[1,3,2,3]
     42c:      	punpckldq	%xmm12, %xmm11  # xmm11 = xmm11[0],xmm12[0],xmm11[1],xmm12[1]
     431:      	movdqa	%xmm9, %xmm12
     436:      	psubd	%xmm11, %xmm12
     43b:      	psrld	$0x1, %xmm12
     441:      	paddd	%xmm11, %xmm12
     446:      	psrld	$0xb, %xmm12
     44c:      	pshufd	$0xf5, %xmm12, %xmm11   # xmm11 = xmm12[1,1,3,3]
     452:      	pmuludq	%xmm1, %xmm12
     457:      	pshufd	$0xe8, %xmm12, %xmm12   # xmm12 = xmm12[0,2,2,3]
     45d:      	pmuludq	%xmm1, %xmm11
     462:      	pshufd	$0xe8, %xmm11, %xmm11   # xmm11 = xmm11[0,2,2,3]
     468:      	punpckldq	%xmm11, %xmm12  # xmm12 = xmm12[0],xmm11[0],xmm12[1],xmm11[1]
     46d:      	psubd	%xmm12, %xmm9
     472:      	packssdw	%xmm10, %xmm9
     477:      	movdqu	%xmm9, (%rcx,%r10,2)
     47d:      	paddd	%xmm6, %xmm7
     481:      	paddd	%xmm5, %xmm8
     486:      	movdqa	%xmm8, %xmm5
     48b:      	pmuludq	%xmm3, %xmm5
     48f:      	pshufd	$0xed, %xmm5, %xmm5     # xmm5 = xmm5[1,3,2,3]
     494:      	pshufd	$0xf5, %xmm8, %xmm6     # xmm6 = xmm8[1,1,3,3]
     49a:      	pmuludq	%xmm3, %xmm6
     49e:      	pshufd	$0xed, %xmm6, %xmm6     # xmm6 = xmm6[1,3,2,3]
     4a3:      	punpckldq	%xmm6, %xmm5    # xmm5 = xmm5[0],xmm6[0],xmm5[1],xmm6[1]
     4a7:      	pmaddwd	%xmm1, %xmm5
     4ab:      	psubd	%xmm5, %xmm8
     4b0:      	movdqa	%xmm7, %xmm5
     4b4:      	pmuludq	%xmm3, %xmm5
     4b8:      	pshufd	$0xed, %xmm5, %xmm5     # xmm5 = xmm5[1,3,2,3]
     4bd:      	pshufd	$0xf5, %xmm7, %xmm6     # xmm6 = xmm7[1,1,3,3]
     4c2:      	pmuludq	%xmm3, %xmm6
     4c6:      	pshufd	$0xed, %xmm6, %xmm6     # xmm6 = xmm6[1,3,2,3]
     4cb:      	punpckldq	%xmm6, %xmm5    # xmm5 = xmm5[0],xmm6[0],xmm5[1],xmm6[1]
     4cf:      	pmaddwd	%xmm1, %xmm5
     4d3:      	psubd	%xmm5, %xmm7
     4d7:      	packssdw	%xmm8, %xmm7
     4dc:      	movdqu	%xmm7, (%r14,%r10,2)
     4e2:      	addq	$0x8, %r10
     4e6:      	cmpq	%r10, %rdi
     4e9:      	jne	0x290 <<toyos_crypto::mlkem::Poly>::ntt+0x290>
     4ef:      	movq	-0x40(%rbp), %rdi
     4f3:      	leaq	(%rsi,%rsi), %r11
     4f7:      	addq	%r11, %rdi
     4fa:      	movq	%rdi, -0x40(%rbp)
     4fe:      	decq	%r15
     501:      	nopw	%cs:(%rax,%rax)
     510:      	leaq	(%rsi,%r9), %rdi
     514:      	cmpq	$0x100, %rdi            # imm = 0x100
     51b:      	jae	0x5f5 <<toyos_crypto::mlkem::Poly>::ntt+0x5f5>
     521:      	movzwl	(%r13,%r9,2), %edx
     527:      	imull	%r12d, %edx
     52b:      	imulq	$0x3afb7681, %rdx, %rdi # imm = 0x3AFB7681
     532:      	shrq	$0x20, %rdi
     536:      	movl	%edx, %r8d
     539:      	subl	%edi, %r8d
     53c:      	shrl	%r8d
     53f:      	addl	%edi, %r8d
     542:      	shrl	$0xb, %r8d
     546:      	imull	$0xd01, %r8d, %edi      # imm = 0xD01
     54d:      	subl	%edi, %edx
     54f:      	movzwl	(%rbx,%r9,2), %edi
     554:      	movl	%edi, %r8d
     557:      	subl	%edx, %r8d
     55a:      	addl	$0xd01, %r8d            # imm = 0xD01
     561:      	imulq	$0x13afb8, %r8, %r10    # imm = 0x13AFB8
     568:      	shrq	$0x20, %r10
     56c:      	imull	$0xd01, %r10d, %r10d    # imm = 0xD01
     573:      	subl	%r10d, %r8d
     576:      	movw	%r8w, (%r13,%r9,2)
     57c:      	addl	%edi, %edx
     57e:      	imulq	$0x13afb8, %rdx, %rdi   # imm = 0x13AFB8
     585:      	shrq	$0x20, %rdi
     589:      	imull	$0xd01, %edi, %edi      # imm = 0xD01
     58f:      	subl	%edi, %edx
     591:      	movw	%dx, (%rbx,%r9,2)
     596:      	incq	%r9
     599:      	cmpq	%r9, %rax
     59c:      	jne	0x510 <<toyos_crypto::mlkem::Poly>::ntt+0x510>
     5a2:      	addq	%r11, %rax
     5a5:      	movq	-0x48(%rbp), %r10
     5a9:      	incq	%r10
     5ac:      	movq	-0x78(%rbp), %rdi
     5b0:      	subq	%r11, %rdi
     5b3:      	leaq	(,%rsi,4), %rdx
     5bb:      	addq	%rdx, %rcx
     5be:      	addq	%rdx, %r14
     5c1:      	testq	%r15, %r15
     5c4:      	jne	0xd0 <<toyos_crypto::mlkem::Poly>::ntt+0xd0>
     5ca:      	jmp	0x50 <<toyos_crypto::mlkem::Poly>::ntt+0x50>
     5cf:      	movl	$0x200, %edx            # imm = 0x200
     5d4:      	movq	-0x50(%rbp), %r14
     5d8:      	movq	%r14, %rdi
     5db:      	movq	%rbx, %rsi
     5de:      	callq	0x5e3 <<toyos_crypto::mlkem::Poly>::ntt+0x5e3>
     5e3:      	movq	%r14, %rax
     5e6:      	addq	$0x58, %rsp
     5ea:      	popq	%rbx
     5eb:      	popq	%r12
     5ed:      	popq	%r13
     5ef:      	popq	%r14
     5f1:      	popq	%r15
     5f3:      	popq	%rbp
     5f4:      	retq
     5f5:      	leaq	(%rip), %rdx            # 0x5fc <<toyos_crypto::mlkem::Poly>::ntt+0x5fc>
     5fc:      	movl	$0x100, %esi            # imm = 0x100
     601:      	callq	0x606 <<toyos_crypto::mlkem::Poly>::ntt+0x606>
     606:      	jmp	0x614 <<toyos_crypto::mlkem::Poly>::ntt+0x614>
     608:      	leaq	(%rip), %rdi            # 0x60f <<toyos_crypto::mlkem::Poly>::ntt+0x60f>
     60f:      	callq	0x614 <<toyos_crypto::mlkem::Poly>::ntt+0x614>
     614:      	ud2
     616:      	xorl	%ecx, %ecx
     618:      	nopl	(%rax,%rax)
     620:      	movw	$0x0, (%rbx,%rcx)
     626:      	movw	$0x0, 0x2(%rbx,%rcx)
     62d:      	movw	$0x0, 0x4(%rbx,%rcx)
     634:      	movw	$0x0, 0x6(%rbx,%rcx)
     63b:      	movw	$0x0, 0x8(%rbx,%rcx)
     642:      	movw	$0x0, 0xa(%rbx,%rcx)
     649:      	movw	$0x0, 0xc(%rbx,%rcx)
     650:      	movw	$0x0, 0xe(%rbx,%rcx)
     657:      	addq	$0x10, %rcx
     65b:      	cmpq	$0x200, %rcx            # imm = 0x200
     662:      	jne	0x620 <<toyos_crypto::mlkem::Poly>::ntt+0x620>
     664:      	movq	%rax, %rdi
     667:      	callq	0x66c <<toyos_crypto::mlkem::Poly>::ntt+0x66c>

0000000000000000 <<toyos_crypto::mlkem::Poly>::plus>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%rbx
       5:      	subq	$0x208, %rsp            # imm = 0x208
       c:      	movq	%rdi, %rbx
       f:      	xorl	%eax, %eax
      11:      	pxor	%xmm0, %xmm0
      15:      	movdqa	(%rip), %xmm1           # 0x1d <<toyos_crypto::mlkem::Poly>::plus+0x1d>
      1d:      	movdqa	(%rip), %xmm2           # 0x25 <<toyos_crypto::mlkem::Poly>::plus+0x25>
      25:      	nopw	%cs:(%rax,%rax)
      30:      	movdqu	(%rsi,%rax,2), %xmm5
      35:      	movdqu	(%rdx,%rax,2), %xmm3
      3a:      	movdqa	%xmm5, %xmm6
      3e:      	punpckhwd	%xmm0, %xmm6    # xmm6 = xmm6[4],xmm0[4],xmm6[5],xmm0[5],xmm6[6],xmm0[6],xmm6[7],xmm0[7]
      42:      	punpcklwd	%xmm0, %xmm5    # xmm5 = xmm5[0],xmm0[0],xmm5[1],xmm0[1],xmm5[2],xmm0[2],xmm5[3],xmm0[3]
      46:      	movdqa	%xmm3, %xmm4
      4a:      	punpckhwd	%xmm0, %xmm4    # xmm4 = xmm4[4],xmm0[4],xmm4[5],xmm0[5],xmm4[6],xmm0[6],xmm4[7],xmm0[7]
      4e:      	paddd	%xmm6, %xmm4
      52:      	punpcklwd	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3]
      56:      	paddd	%xmm5, %xmm3
      5a:      	movdqa	%xmm4, %xmm5
      5e:      	pmuludq	%xmm1, %xmm5
      62:      	pshufd	$0xed, %xmm5, %xmm5     # xmm5 = xmm5[1,3,2,3]
      67:      	pshufd	$0xf5, %xmm4, %xmm6     # xmm6 = xmm4[1,1,3,3]
      6c:      	pmuludq	%xmm1, %xmm6
      70:      	pshufd	$0xed, %xmm6, %xmm6     # xmm6 = xmm6[1,3,2,3]
      75:      	punpckldq	%xmm6, %xmm5    # xmm5 = xmm5[0],xmm6[0],xmm5[1],xmm6[1]
      79:      	pmaddwd	%xmm2, %xmm5
      7d:      	psubd	%xmm5, %xmm4
      81:      	movdqa	%xmm3, %xmm5
      85:      	pmuludq	%xmm1, %xmm5
      89:      	pshufd	$0xed, %xmm5, %xmm5     # xmm5 = xmm5[1,3,2,3]
      8e:      	pshufd	$0xf5, %xmm3, %xmm6     # xmm6 = xmm3[1,1,3,3]
      93:      	pmuludq	%xmm1, %xmm6
      97:      	pshufd	$0xed, %xmm6, %xmm6     # xmm6 = xmm6[1,3,2,3]
      9c:      	punpckldq	%xmm6, %xmm5    # xmm5 = xmm5[0],xmm6[0],xmm5[1],xmm6[1]
      a0:      	pmaddwd	%xmm2, %xmm5
      a4:      	psubd	%xmm5, %xmm3
      a8:      	packssdw	%xmm4, %xmm3
      ac:      	movdqu	%xmm3, -0x208(%rbp,%rax,2)
      b5:      	addq	$0x8, %rax
      b9:      	cmpq	$0x100, %rax            # imm = 0x100
      bf:      	jne	0x30 <<toyos_crypto::mlkem::Poly>::plus+0x30>
      c5:      	leaq	-0x208(%rbp), %rsi
      cc:      	movl	$0x200, %edx            # imm = 0x200
      d1:      	movq	%rbx, %rdi
      d4:      	callq	0xd9 <<toyos_crypto::mlkem::Poly>::plus+0xd9>
      d9:      	movq	%rbx, %rax
      dc:      	addq	$0x208, %rsp            # imm = 0x208
      e3:      	popq	%rbx
      e4:      	popq	%rbp
      e5:      	retq

0000000000000000 <<toyos_crypto::mlkem::Poly>::encode>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%r13
       a:      	pushq	%r12
       c:      	pushq	%rbx
       d:      	subq	$0x18, %rsp
      11:      	movq	%rcx, -0x30(%rbp)
      15:      	movq	%rsi, %rax
      18:      	shrq	$0x3b, %rax
      1c:      	jne	0x129 <<toyos_crypto::mlkem::Poly>::encode+0x129>
      22:      	movq	%rcx, %rbx
      25:      	movq	%rsi, %r15
      28:      	movq	%rsi, %rax
      2b:      	shlq	$0x5, %rax
      2f:      	movq	%rax, -0x38(%rbp)
      33:      	cmpq	%rax, %rcx
      36:      	jne	0x105 <<toyos_crypto::mlkem::Poly>::encode+0x105>
      3c:      	movq	%rdx, %r14
      3f:      	movq	%rdi, %r12
      42:      	xorl	%r13d, %r13d
      45:      	movq	%rdx, %rdi
      48:      	movq	%rbx, %rsi
      4b:      	xorl	%edx, %edx
      4d:      	callq	0x52 <<toyos_crypto::mlkem::Poly>::encode+0x52>
      52:      	xorl	%esi, %esi
      54:      	jmp	0x6f <<toyos_crypto::mlkem::Poly>::encode+0x6f>
      56:      	nopw	%cs:(%rax,%rax)
      60:      	incq	%r13
      63:      	addq	%r15, %rsi
      66:      	cmpq	$0x100, %r13            # imm = 0x100
      6d:      	je	0xcf <<toyos_crypto::mlkem::Poly>::encode+0xcf>
      6f:      	testq	%r15, %r15
      72:      	je	0x60 <<toyos_crypto::mlkem::Poly>::encode+0x60>
      74:      	movq	%r13, %rax
      77:      	mulq	%r15
      7a:      	jo	0x11d <<toyos_crypto::mlkem::Poly>::encode+0x11d>
      80:      	xorl	%ecx, %ecx
      82:      	nopw	%cs:(%rax,%rax)
      90:      	leaq	(%rsi,%rcx), %rdi
      94:      	cmpq	%rax, %rdi
      97:      	jb	0xea <<toyos_crypto::mlkem::Poly>::encode+0xea>
      99:      	cmpq	$0x10, %rcx
      9d:      	je	0xde <<toyos_crypto::mlkem::Poly>::encode+0xde>
      9f:      	shrq	$0x3, %rdi
      a3:      	cmpq	%rbx, %rdi
      a6:      	jae	0xf6 <<toyos_crypto::mlkem::Poly>::encode+0xf6>
      a8:      	leaq	0x1(%rcx), %rdx
      ac:      	movzwl	(%r12,%r13,2), %r8d
      b1:      	btl	%ecx, %r8d
      b5:      	setb	%r8b
      b9:      	addl	%esi, %ecx
      bb:      	andb	$0x7, %cl
      be:      	shlb	%cl, %r8b
      c1:      	orb	%r8b, (%r14,%rdi)
      c5:      	movq	%rdx, %rcx
      c8:      	cmpq	%rdx, %r15
      cb:      	jne	0x90 <<toyos_crypto::mlkem::Poly>::encode+0x90>
      cd:      	jmp	0x60 <<toyos_crypto::mlkem::Poly>::encode+0x60>
      cf:      	addq	$0x18, %rsp
      d3:      	popq	%rbx
      d4:      	popq	%r12
      d6:      	popq	%r13
      d8:      	popq	%r14
      da:      	popq	%r15
      dc:      	popq	%rbp
      dd:      	retq
      de:      	leaq	(%rip), %rdi            # 0xe5 <<toyos_crypto::mlkem::Poly>::encode+0xe5>
      e5:      	callq	0xea <<toyos_crypto::mlkem::Poly>::encode+0xea>
      ea:      	leaq	(%rip), %rdi            # 0xf1 <<toyos_crypto::mlkem::Poly>::encode+0xf1>
      f1:      	callq	0xf6 <<toyos_crypto::mlkem::Poly>::encode+0xf6>
      f6:      	leaq	(%rip), %rdx            # 0xfd <<toyos_crypto::mlkem::Poly>::encode+0xfd>
      fd:      	movq	%rbx, %rsi
     100:      	callq	0x105 <<toyos_crypto::mlkem::Poly>::encode+0x105>
     105:      	leaq	(%rip), %r9             # 0x10c <<toyos_crypto::mlkem::Poly>::encode+0x10c>
     10c:      	leaq	-0x30(%rbp), %rsi
     110:      	leaq	-0x38(%rbp), %rdx
     114:      	xorl	%edi, %edi
     116:      	xorl	%ecx, %ecx
     118:      	callq	0x11d <<toyos_crypto::mlkem::Poly>::encode+0x11d>
     11d:      	leaq	(%rip), %rdi            # 0x124 <<toyos_crypto::mlkem::Poly>::encode+0x124>
     124:      	callq	0x129 <<toyos_crypto::mlkem::Poly>::encode+0x129>
     129:      	leaq	(%rip), %rdi            # 0x130 <<toyos_crypto::mlkem::Poly>::encode+0x130>
     130:      	callq	0x135 <<toyos_crypto::mlkem::Poly>::encode+0x135>

0000000000000000 <<toyos_crypto::mlkem::Poly>::inverse>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%r13
       a:      	pushq	%r12
       c:      	pushq	%rbx
       d:      	subq	$0x18, %rsp
      11:      	movq	%rsi, %rbx
      14:      	movq	%rdi, -0x38(%rbp)
      18:      	movl	$0x2, %edx
      1d:      	movl	$0x7f, %eax
      22:      	movl	$0x9d7dbb41, %esi       # imm = 0x9D7DBB41
      27:      	jmp	0x3a <<toyos_crypto::mlkem::Poly>::inverse+0x3a>
      29:      	nopl	(%rax)
      30:      	cmpq	$0x41, %r8
      34:      	jae	0x20c <<toyos_crypto::mlkem::Poly>::inverse+0x20c>
      3a:      	movq	%rdx, %r8
      3d:      	addq	%rdx, %rdx
      40:      	tzcntl	%edx, %ecx
      44:      	movl	$0x100, %edi            # imm = 0x100
      49:      	shrl	%cl, %edi
      4b:      	leal	-0x1(%rdx), %ecx
      4e:      	btl	$0x8, %ecx
      52:      	adcq	$0x0, %rdi
      56:      	movq	%rdi, -0x30(%rbp)
      5a:      	je	0x30 <<toyos_crypto::mlkem::Poly>::inverse+0x30>
      5c:      	leaq	(%rbx,%rdx), %rcx
      60:      	movq	%rbx, %r11
      63:      	movq	%r8, %r15
      66:      	xorl	%r12d, %r12d
      69:      	nopl	(%rax)
      70:      	movl	%eax, %edi
      72:      	rolb	$0x4, %dil
      76:      	movl	%edi, %r10d
      79:      	andb	$0x33, %r10b
      7d:      	shlb	$0x2, %r10b
      81:      	shrb	$0x2, %dil
      85:      	andb	$0x33, %dil
      89:      	orb	%r10b, %dil
      8c:      	movl	%edi, %r10d
      8f:      	andb	$0x55, %r10b
      93:      	addb	%r10b, %r10b
      96:      	shrb	%dil
      99:      	andb	$0x54, %dil
      9d:      	orb	%r10b, %dil
      a0:      	shrb	%dil
      a3:      	je	0x120 <<toyos_crypto::mlkem::Poly>::inverse+0x120>
      a5:      	movzbl	%dil, %r14d
      a9:      	movw	$0x1, %di
      ad:      	movw	$0x11, %r13w
      b2:      	jmp	0xdd <<toyos_crypto::mlkem::Poly>::inverse+0xdd>
      b4:      	nopw	%cs:(%rax,%rax)
      c0:      	imull	%r13d, %r13d
      c4:      	movq	%r13, %rdx
      c7:      	imulq	%rsi, %rdx
      cb:      	shrq	$0x2b, %rdx
      cf:      	imull	$0xd01, %edx, %edx      # imm = 0xD01
      d5:      	subl	%edx, %r13d
      d8:      	shrl	%r14d
      db:      	je	0x110 <<toyos_crypto::mlkem::Poly>::inverse+0x110>
      dd:      	movzwl	%r13w, %r13d
      e1:      	testb	$0x1, %r14b
      e5:      	je	0xc0 <<toyos_crypto::mlkem::Poly>::inverse+0xc0>
      e7:      	movzwl	%di, %edi
      ea:      	imull	%r13d, %edi
      ee:      	imulq	$0x3afb7681, %rdi, %r10 # imm = 0x3AFB7681
      f5:      	shrq	$0x20, %r10
      f9:      	movl	%edi, %edx
      fb:      	subl	%r10d, %edx
      fe:      	shrl	%edx
     100:      	addl	%r10d, %edx
     103:      	shrl	$0xb, %edx
     106:      	imull	$0xd01, %edx, %edx      # imm = 0xD01
     10c:      	subl	%edx, %edi
     10e:      	jmp	0xc0 <<toyos_crypto::mlkem::Poly>::inverse+0xc0>
     110:      	movzwl	%di, %r14d
     114:      	subq	$0x1, %rax
     118:      	jae	0x130 <<toyos_crypto::mlkem::Poly>::inverse+0x130>
     11a:      	jmp	0x32a <<toyos_crypto::mlkem::Poly>::inverse+0x32a>
     11f:      	nop
     120:      	movl	$0x1, %r14d
     126:      	subq	$0x1, %rax
     12a:      	jb	0x32a <<toyos_crypto::mlkem::Poly>::inverse+0x32a>
     130:      	leaq	(%r8,%r8), %rdx
     134:      	addq	%r12, %rdx
     137:      	movq	%rdx, -0x40(%rbp)
     13b:      	decq	-0x30(%rbp)
     13f:      	xorl	%r10d, %r10d
     142:      	nopw	%cs:(%rax,%rax)
     150:      	leaq	(%r12,%r10), %rdi
     154:      	cmpq	$0xff, %rdi
     15b:      	ja	0x317 <<toyos_crypto::mlkem::Poly>::inverse+0x317>
     161:      	leaq	(%r15,%r10), %rdi
     165:      	cmpq	$0x100, %rdi            # imm = 0x100
     16c:      	jae	0x30e <<toyos_crypto::mlkem::Poly>::inverse+0x30e>
     172:      	movzwl	(%r11,%r10,2), %edx
     177:      	movzwl	(%rcx,%r10,2), %edi
     17c:      	leal	(%rdi,%rdx), %r9d
     180:      	imulq	$0x13afb8, %r9, %r13    # imm = 0x13AFB8
     187:      	shrq	$0x20, %r13
     18b:      	imull	$0xd01, %r13d, %r13d    # imm = 0xD01
     192:      	subl	%r13d, %r9d
     195:      	movw	%r9w, (%r11,%r10,2)
     19a:      	addl	$0xd01, %edi            # imm = 0xD01
     1a0:      	subl	%edx, %edi
     1a2:      	jb	0x300 <<toyos_crypto::mlkem::Poly>::inverse+0x300>
     1a8:      	imulq	$0x13afb8, %rdi, %rdx   # imm = 0x13AFB8
     1af:      	shrq	$0x20, %rdx
     1b3:      	imull	$0xd01, %edx, %edx      # imm = 0xD01
     1b9:      	subl	%edx, %edi
     1bb:      	imull	%r14d, %edi
     1bf:      	imulq	$0x13afb769, %rdi, %rdx # imm = 0x13AFB769
     1c6:      	shrq	$0x28, %rdx
     1ca:      	imull	$0xd01, %edx, %edx      # imm = 0xD01
     1d0:      	subl	%edx, %edi
     1d2:      	movw	%di, (%rcx,%r10,2)
     1d7:      	incq	%r10
     1da:      	cmpq	%r10, %r8
     1dd:      	jne	0x150 <<toyos_crypto::mlkem::Poly>::inverse+0x150>
     1e3:      	leaq	(%r8,%r8), %rdx
     1e7:      	addq	%rdx, %r15
     1ea:      	leaq	(,%r8,4), %rdi
     1f2:      	addq	%rdi, %rcx
     1f5:      	addq	%rdi, %r11
     1f8:      	movq	-0x40(%rbp), %r12
     1fc:      	cmpq	$0x0, -0x30(%rbp)
     201:      	jne	0x70 <<toyos_crypto::mlkem::Poly>::inverse+0x70>
     207:      	jmp	0x30 <<toyos_crypto::mlkem::Poly>::inverse+0x30>
     20c:      	xorl	%eax, %eax
     20e:      	movdqa	(%rip), %xmm0           # 0x216 <<toyos_crypto::mlkem::Poly>::inverse+0x216>
     216:      	movdqa	(%rip), %xmm1           # 0x21e <<toyos_crypto::mlkem::Poly>::inverse+0x21e>
     21e:      	movdqa	(%rip), %xmm2           # 0x226 <<toyos_crypto::mlkem::Poly>::inverse+0x226>
     226:      	nopw	%cs:(%rax,%rax)
     230:      	movdqu	(%rbx,%rax,2), %xmm3
     235:      	movdqa	%xmm3, %xmm5
     239:      	pmulhuw	%xmm0, %xmm5
     23d:      	pmullw	%xmm0, %xmm3
     241:      	movdqa	%xmm3, %xmm4
     245:      	punpcklwd	%xmm5, %xmm4    # xmm4 = xmm4[0],xmm5[0],xmm4[1],xmm5[1],xmm4[2],xmm5[2],xmm4[3],xmm5[3]
     249:      	punpckhwd	%xmm5, %xmm3    # xmm3 = xmm3[4],xmm5[4],xmm3[5],xmm5[5],xmm3[6],xmm5[6],xmm3[7],xmm5[7]
     24d:      	pshufd	$0xf5, %xmm3, %xmm5     # xmm5 = xmm3[1,1,3,3]
     252:      	pmuludq	%xmm1, %xmm5
     256:      	psrlq	$0x28, %xmm5
     25b:      	pmuludq	%xmm2, %xmm5
     25f:      	pshufd	$0xe8, %xmm5, %xmm5     # xmm5 = xmm5[0,2,2,3]
     264:      	movdqa	%xmm3, %xmm6
     268:      	pmuludq	%xmm1, %xmm6
     26c:      	pshufd	$0xf5, %xmm6, %xmm6     # xmm6 = xmm6[1,1,3,3]
     271:      	psrld	$0x8, %xmm6
     276:      	pmuludq	%xmm2, %xmm6
     27a:      	pshufd	$0xe8, %xmm6, %xmm6     # xmm6 = xmm6[0,2,2,3]
     27f:      	punpckldq	%xmm5, %xmm6    # xmm6 = xmm6[0],xmm5[0],xmm6[1],xmm5[1]
     283:      	psubd	%xmm6, %xmm3
     287:      	pshufd	$0xf5, %xmm4, %xmm5     # xmm5 = xmm4[1,1,3,3]
     28c:      	pmuludq	%xmm1, %xmm5
     290:      	psrlq	$0x28, %xmm5
     295:      	pmuludq	%xmm2, %xmm5
     299:      	pshufd	$0xe8, %xmm5, %xmm5     # xmm5 = xmm5[0,2,2,3]
     29e:      	movdqa	%xmm4, %xmm6
     2a2:      	pmuludq	%xmm1, %xmm6
     2a6:      	pshufd	$0xf5, %xmm6, %xmm6     # xmm6 = xmm6[1,1,3,3]
     2ab:      	psrld	$0x8, %xmm6
     2b0:      	pmuludq	%xmm2, %xmm6
     2b4:      	pshufd	$0xe8, %xmm6, %xmm6     # xmm6 = xmm6[0,2,2,3]
     2b9:      	punpckldq	%xmm5, %xmm6    # xmm6 = xmm6[0],xmm5[0],xmm6[1],xmm5[1]
     2bd:      	psubd	%xmm6, %xmm4
     2c1:      	packssdw	%xmm3, %xmm4
     2c5:      	movdqu	%xmm4, (%rbx,%rax,2)
     2ca:      	addq	$0x8, %rax
     2ce:      	cmpq	$0x100, %rax            # imm = 0x100
     2d4:      	jne	0x230 <<toyos_crypto::mlkem::Poly>::inverse+0x230>
     2da:      	movl	$0x200, %edx            # imm = 0x200
     2df:      	movq	-0x38(%rbp), %r14
     2e3:      	movq	%r14, %rdi
     2e6:      	movq	%rbx, %rsi
     2e9:      	callq	0x2ee <<toyos_crypto::mlkem::Poly>::inverse+0x2ee>
     2ee:      	movq	%r14, %rax
     2f1:      	addq	$0x18, %rsp
     2f5:      	popq	%rbx
     2f6:      	popq	%r12
     2f8:      	popq	%r13
     2fa:      	popq	%r14
     2fc:      	popq	%r15
     2fe:      	popq	%rbp
     2ff:      	retq
     300:      	leaq	(%rip), %rdi            # 0x307 <<toyos_crypto::mlkem::Poly>::inverse+0x307>
     307:      	callq	0x30c <<toyos_crypto::mlkem::Poly>::inverse+0x30c>
     30c:      	jmp	0x336 <<toyos_crypto::mlkem::Poly>::inverse+0x336>
     30e:      	leaq	(%rip), %rdx            # 0x315 <<toyos_crypto::mlkem::Poly>::inverse+0x315>
     315:      	jmp	0x31e <<toyos_crypto::mlkem::Poly>::inverse+0x31e>
     317:      	leaq	(%rip), %rdx            # 0x31e <<toyos_crypto::mlkem::Poly>::inverse+0x31e>
     31e:      	movl	$0x100, %esi            # imm = 0x100
     323:      	callq	0x328 <<toyos_crypto::mlkem::Poly>::inverse+0x328>
     328:      	jmp	0x336 <<toyos_crypto::mlkem::Poly>::inverse+0x336>
     32a:      	leaq	(%rip), %rdi            # 0x331 <<toyos_crypto::mlkem::Poly>::inverse+0x331>
     331:      	callq	0x336 <<toyos_crypto::mlkem::Poly>::inverse+0x336>
     336:      	ud2
     338:      	xorl	%ecx, %ecx
     33a:      	nopw	(%rax,%rax)
     340:      	movw	$0x0, (%rbx,%rcx)
     346:      	movw	$0x0, 0x2(%rbx,%rcx)
     34d:      	movw	$0x0, 0x4(%rbx,%rcx)
     354:      	movw	$0x0, 0x6(%rbx,%rcx)
     35b:      	movw	$0x0, 0x8(%rbx,%rcx)
     362:      	movw	$0x0, 0xa(%rbx,%rcx)
     369:      	movw	$0x0, 0xc(%rbx,%rcx)
     370:      	movw	$0x0, 0xe(%rbx,%rcx)
     377:      	addq	$0x10, %rcx
     37b:      	cmpq	$0x200, %rcx            # imm = 0x200
     382:      	jne	0x340 <<toyos_crypto::mlkem::Poly>::inverse+0x340>
     384:      	movq	%rax, %rdi
     387:      	callq	0x38c <<toyos_crypto::mlkem::Poly>::inverse+0x38c>

0000000000000000 <<toyos_crypto::mlkem::Poly>::product>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%r13
       a:      	pushq	%r12
       c:      	pushq	%rbx
       d:      	subq	$0x208, %rsp            # imm = 0x208
      14:      	movq	%rdx, %r14
      17:      	movq	%rsi, %r15
      1a:      	movq	%rdi, %rbx
      1d:      	leaq	-0x228(%rbp), %rdi
      24:      	xorl	%r12d, %r12d
      27:      	movl	$0x200, %edx            # imm = 0x200
      2c:      	xorl	%esi, %esi
      2e:      	callq	0x33 <<toyos_crypto::mlkem::Poly>::product+0x33>
      33:      	movl	$0x9d7dbb41, %eax       # imm = 0x9D7DBB41
      38:      	jmp	0x154 <<toyos_crypto::mlkem::Poly>::product+0x154>
      3d:      	nopl	(%rax)
      40:      	movzwl	(%r15,%r12,4), %edi
      45:      	movzwl	(%r14,%r12,4), %edx
      4a:      	movl	%edx, %r9d
      4d:      	imull	%edi, %r9d
      51:      	imulq	$0x3afb7681, %r9, %rsi  # imm = 0x3AFB7681
      58:      	shrq	$0x20, %rsi
      5c:      	movl	%r9d, %r8d
      5f:      	subl	%esi, %r8d
      62:      	shrl	%r8d
      65:      	addl	%esi, %r8d
      68:      	shrl	$0xb, %r8d
      6c:      	imull	$0xd01, %r8d, %esi      # imm = 0xD01
      73:      	subl	%esi, %r9d
      76:      	movzwl	0x2(%r15,%r12,4), %r8d
      7c:      	movzwl	0x2(%r14,%r12,4), %esi
      82:      	movl	%esi, %r10d
      85:      	imull	%r8d, %r10d
      89:      	imulq	$0x3afb7681, %r10, %r11 # imm = 0x3AFB7681
      90:      	shrq	$0x20, %r11
      94:      	movl	%r10d, %r13d
      97:      	subl	%r11d, %r13d
      9a:      	shrl	%r13d
      9d:      	addl	%r11d, %r13d
      a0:      	shrl	$0xb, %r13d
      a4:      	imull	$0xd01, %r13d, %r11d    # imm = 0xD01
      ab:      	subl	%r11d, %r10d
      ae:      	movzwl	%cx, %ecx
      b1:      	imull	%r10d, %ecx
      b5:      	imulq	$0x13afb769, %rcx, %r10 # imm = 0x13AFB769
      bc:      	shrq	$0x28, %r10
      c0:      	imull	$0xd01, %r10d, %r10d    # imm = 0xD01
      c7:      	subl	%r10d, %ecx
      ca:      	addl	%r9d, %ecx
      cd:      	leal	-0xd01(%rcx), %r9d
      d4:      	cmpl	$0xd01, %ecx            # imm = 0xD01
      da:      	cmovbl	%ecx, %r9d
      de:      	movw	%r9w, -0x228(%rbp,%r12,4)
      e7:      	imull	%edi, %esi
      ea:      	imulq	$0x3afb7681, %rsi, %rcx # imm = 0x3AFB7681
      f1:      	shrq	$0x20, %rcx
      f5:      	movl	%esi, %edi
      f7:      	subl	%ecx, %edi
      f9:      	shrl	%edi
      fb:      	addl	%ecx, %edi
      fd:      	shrl	$0xb, %edi
     100:      	imull	$0xd01, %edi, %ecx      # imm = 0xD01
     106:      	subl	%ecx, %esi
     108:      	imull	%r8d, %edx
     10c:      	imulq	$0x3afb7681, %rdx, %rcx # imm = 0x3AFB7681
     113:      	shrq	$0x20, %rcx
     117:      	movl	%edx, %edi
     119:      	subl	%ecx, %edi
     11b:      	shrl	%edi
     11d:      	addl	%ecx, %edi
     11f:      	shrl	$0xb, %edi
     122:      	imull	$0xd01, %edi, %ecx      # imm = 0xD01
     128:      	subl	%ecx, %edx
     12a:      	addl	%esi, %edx
     12c:      	leal	-0xd01(%rdx), %ecx
     132:      	cmpl	$0xd01, %edx            # imm = 0xD01
     138:      	cmovbl	%edx, %ecx
     13b:      	movw	%cx, -0x226(%rbp,%r12,4)
     144:      	incq	%r12
     147:      	cmpq	$0x80, %r12
     14e:      	je	0x1e2 <<toyos_crypto::mlkem::Poly>::product+0x1e2>
     154:      	movl	%r12d, %ecx
     157:      	rolb	$0x4, %cl
     15a:      	orb	$0x8, %cl
     15d:      	movl	%ecx, %edx
     15f:      	andb	$0x33, %dl
     162:      	shlb	$0x2, %dl
     165:      	shrb	$0x2, %cl
     168:      	andb	$0x33, %cl
     16b:      	orb	%dl, %cl
     16d:      	movl	%ecx, %edx
     16f:      	andb	$0x55, %dl
     172:      	addb	%dl, %dl
     174:      	shrb	%cl
     176:      	andb	$0x55, %cl
     179:      	orb	%dl, %cl
     17b:      	movzbl	%cl, %edx
     17e:      	movw	$0x1, %cx
     182:      	movw	$0x11, %si
     186:      	jmp	0x1ae <<toyos_crypto::mlkem::Poly>::product+0x1ae>
     188:      	nopl	(%rax,%rax)
     190:      	imull	%esi, %esi
     193:      	movq	%rsi, %rdi
     196:      	imulq	%rax, %rdi
     19a:      	shrq	$0x2b, %rdi
     19e:      	imull	$0xd01, %edi, %edi      # imm = 0xD01
     1a4:      	subl	%edi, %esi
     1a6:      	shrl	%edx
     1a8:      	je	0x40 <<toyos_crypto::mlkem::Poly>::product+0x40>
     1ae:      	movzwl	%si, %esi
     1b1:      	testb	$0x1, %dl
     1b4:      	je	0x190 <<toyos_crypto::mlkem::Poly>::product+0x190>
     1b6:      	movzwl	%cx, %ecx
     1b9:      	imull	%esi, %ecx
     1bc:      	imulq	$0x3afb7681, %rcx, %rdi # imm = 0x3AFB7681
     1c3:      	shrq	$0x20, %rdi
     1c7:      	movl	%ecx, %r8d
     1ca:      	subl	%edi, %r8d
     1cd:      	shrl	%r8d
     1d0:      	addl	%edi, %r8d
     1d3:      	shrl	$0xb, %r8d
     1d7:      	imull	$0xd01, %r8d, %edi      # imm = 0xD01
     1de:      	subl	%edi, %ecx
     1e0:      	jmp	0x190 <<toyos_crypto::mlkem::Poly>::product+0x190>
     1e2:      	leaq	-0x228(%rbp), %rsi
     1e9:      	movl	$0x200, %edx            # imm = 0x200
     1ee:      	movq	%rbx, %rdi
     1f1:      	callq	0x1f6 <<toyos_crypto::mlkem::Poly>::product+0x1f6>
     1f6:      	movq	%rbx, %rax
     1f9:      	addq	$0x208, %rsp            # imm = 0x208
     200:      	popq	%rbx
     201:      	popq	%r12
     203:      	popq	%r13
     205:      	popq	%r14
     207:      	popq	%r15
     209:      	popq	%rbp
     20a:      	retq

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
      81:      	movq	-0x1f0(%rbp), %rax
      88:      	xorl	%r15d, %r15d
      8b:      	leaq	-0x2c0(%rbp), %r14
      92:      	jmp	0xe5 <toyos_crypto::mlkem::noise+0xe5>
      94:      	nopw	%cs:(%rax,%rax)
      a0:      	movq	%rax, %rdi
      a3:      	shrq	$0x3, %rdi
      a7:      	cmpq	$0xc8, %rax
      ad:      	jae	0x545 <toyos_crypto::mlkem::noise+0x545>
      b3:      	leaq	-0x2c0(,%rdi,8), %rcx
      bb:      	addq	%rbp, %rcx
      be:      	movl	%eax, %edx
      c0:      	andl	$0x7, %edx
      c3:      	movzbl	(%rdx,%rcx), %ecx
      c7:      	movb	%cl, -0xc0(%rbp,%r15)
      cf:      	incq	%r15
      d2:      	incq	%rax
      d5:      	movq	%rax, -0x1f0(%rbp)
      dc:      	cmpq	$0x80, %r15
      e3:      	je	0x107 <toyos_crypto::mlkem::noise+0x107>
      e5:      	cmpq	-0x1f8(%rbp), %rax
      ec:      	jne	0xa0 <toyos_crypto::mlkem::noise+0xa0>
      ee:      	movq	%r14, %rdi
      f1:      	callq	0xf6 <toyos_crypto::mlkem::noise+0xf6>
      f6:      	movq	$0x0, -0x1f0(%rbp)
     101:      	xorl	%edi, %edi
     103:      	xorl	%eax, %eax
     105:      	jmp	0xb3 <toyos_crypto::mlkem::noise+0xb3>
     107:      	movq	$0x0, -0x2c0(%rbp)
     112:      	movq	$0x0, -0x2b8(%rbp)
     11d:      	movq	$0x0, -0x2b0(%rbp)
     128:      	movq	$0x0, -0x2a8(%rbp)
     133:      	movq	$0x0, -0x2a0(%rbp)
     13e:      	movq	$0x0, -0x298(%rbp)
     149:      	movq	$0x0, -0x290(%rbp)
     154:      	movq	$0x0, -0x288(%rbp)
     15f:      	movq	$0x0, -0x280(%rbp)
     16a:      	movq	$0x0, -0x278(%rbp)
     175:      	movq	$0x0, -0x270(%rbp)
     180:      	movq	$0x0, -0x268(%rbp)
     18b:      	movq	$0x0, -0x260(%rbp)
     196:      	movq	$0x0, -0x258(%rbp)
     1a1:      	movq	$0x0, -0x250(%rbp)
     1ac:      	movq	$0x0, -0x248(%rbp)
     1b7:      	movq	$0x0, -0x240(%rbp)
     1c2:      	movq	$0x0, -0x238(%rbp)
     1cd:      	movq	$0x0, -0x230(%rbp)
     1d8:      	movq	$0x0, -0x228(%rbp)
     1e3:      	movq	$0x0, -0x220(%rbp)
     1ee:      	movq	$0x0, -0x218(%rbp)
     1f9:      	movq	$0x0, -0x210(%rbp)
     204:      	movq	$0x0, -0x208(%rbp)
     20f:      	movq	$0x0, -0x200(%rbp)
     21a:      	leaq	-0x2c0(%rbp), %rdi
     221:      	xorl	%r14d, %r14d
     224:      	movl	$0x200, %edx            # imm = 0x200
     229:      	xorl	%esi, %esi
     22b:      	callq	0x230 <toyos_crypto::mlkem::noise+0x230>
     230:      	movq	(%rip), %xmm0           # 0x238 <toyos_crypto::mlkem::noise+0x238>
     238:      	leaq	-0xbd(%rbp), %rax
     23f:      	pxor	%xmm2, %xmm2
     243:      	movdqa	(%rip), %xmm5           # 0x24b <toyos_crypto::mlkem::noise+0x24b>
     24b:      	movdqa	(%rip), %xmm6           # 0x253 <toyos_crypto::mlkem::noise+0x253>
     253:      	movdqa	(%rip), %xmm7           # 0x25b <toyos_crypto::mlkem::noise+0x25b>
     25b:      	movdqa	(%rip), %xmm8           # 0x264 <toyos_crypto::mlkem::noise+0x264>
     264:      	movdqa	(%rip), %xmm9           # 0x26d <toyos_crypto::mlkem::noise+0x26d>
     26d:      	movdqa	(%rip), %xmm3           # 0x275 <toyos_crypto::mlkem::noise+0x275>
     275:      	movdqa	(%rip), %xmm11          # 0x27e <toyos_crypto::mlkem::noise+0x27e>
     27e:      	nop
     280:      	movzbl	-0x3(%rax), %ecx
     284:      	movzbl	-0x2(%rax), %edx
     288:      	movzbl	-0x1(%rax), %esi
     28c:      	movl	%esi, %edi
     28e:      	shll	$0x8, %edi
     291:      	movl	%ecx, %r8d
     294:      	shll	$0x8, %r8d
     298:      	orl	%esi, %edi
     29a:      	orl	%ecx, %r8d
     29d:      	movl	%edx, %ecx
     29f:      	shll	$0x10, %ecx
     2a2:      	orl	%r8d, %ecx
     2a5:      	shll	$0x18, %edx
     2a8:      	orl	%ecx, %edx
     2aa:      	movzbl	(%rax), %ecx
     2ad:      	movd	%edx, %xmm12
     2b2:      	movl	%ecx, %edx
     2b4:      	shll	$0x8, %edx
     2b7:      	pinsrw	$0x2, %edi, %xmm12
     2bd:      	movdqa	%xmm0, %xmm13
     2c2:      	psllw	$0x7, %xmm13
     2c8:      	pand	(%rip), %xmm13          # 0x2d1 <toyos_crypto::mlkem::noise+0x2d1>
     2d1:      	orl	%ecx, %edx
     2d3:      	pxor	%xmm14, %xmm14
     2d8:      	pcmpgtb	%xmm13, %xmm14
     2dd:      	pinsrw	$0x3, %edx, %xmm12
     2e3:      	movdqa	%xmm14, %xmm15
     2e8:      	pandn	%xmm12, %xmm15
     2ed:      	psrlw	$0x4, %xmm12
     2f3:      	pand	%xmm14, %xmm12
     2f8:      	pand	(%rip), %xmm12          # 0x301 <toyos_crypto::mlkem::noise+0x301>
     301:      	paddb	%xmm13, %xmm13
     306:      	pxor	%xmm14, %xmm14
     30b:      	por	%xmm15, %xmm12
     310:      	pcmpgtb	%xmm13, %xmm14
     315:      	movdqa	%xmm14, %xmm15
     31a:      	pandn	%xmm12, %xmm15
     31f:      	psrlw	$0x2, %xmm12
     325:      	pand	%xmm14, %xmm12
     32a:      	pand	(%rip), %xmm12          # 0x333 <toyos_crypto::mlkem::noise+0x333>
     333:      	paddb	%xmm13, %xmm13
     338:      	por	%xmm15, %xmm12
     33d:      	pxor	%xmm14, %xmm14
     342:      	pcmpgtb	%xmm13, %xmm14
     347:      	movdqa	%xmm14, %xmm13
     34c:      	pandn	%xmm12, %xmm13
     351:      	psrlw	$0x1, %xmm12
     357:      	pand	%xmm14, %xmm12
     35c:      	pand	%xmm5, %xmm12
     361:      	por	%xmm13, %xmm12
     366:      	movdqa	%xmm12, %xmm14
     36b:      	pand	%xmm6, %xmm14
     370:      	movdqa	%xmm12, %xmm13
     375:      	psrlw	$0x1, %xmm13
     37b:      	pand	%xmm6, %xmm13
     380:      	paddb	%xmm14, %xmm13
     385:      	punpcklbw	%xmm2, %xmm13   # xmm13 = xmm13[0],xmm2[0],xmm13[1],xmm2[1],xmm13[2],xmm2[2],xmm13[3],xmm2[3],xmm13[4],xmm2[4],xmm13[5],xmm2[5],xmm13[6],xmm2[6],xmm13[7],xmm2[7]
     38a:      	movdqa	%xmm13, %xmm14
     38f:      	movdqa	%xmm12, %xmm15
     394:      	psrlw	$0x2, %xmm15
     39a:      	pand	%xmm6, %xmm15
     39f:      	punpcklwd	%xmm2, %xmm13   # xmm13 = xmm13[0],xmm2[0],xmm13[1],xmm2[1],xmm13[2],xmm2[2],xmm13[3],xmm2[3]
     3a4:      	psrlw	$0x3, %xmm12
     3aa:      	pand	%xmm6, %xmm12
     3af:      	paddb	%xmm15, %xmm12
     3b4:      	punpckhwd	%xmm2, %xmm14   # xmm14 = xmm14[4],xmm2[4],xmm14[5],xmm2[5],xmm14[6],xmm2[6],xmm14[7],xmm2[7]
     3b9:      	punpcklbw	%xmm2, %xmm12   # xmm12 = xmm12[0],xmm2[0],xmm12[1],xmm2[1],xmm12[2],xmm2[2],xmm12[3],xmm2[3],xmm12[4],xmm2[4],xmm12[5],xmm2[5],xmm12[6],xmm2[6],xmm12[7],xmm2[7]
     3be:      	movdqa	%xmm12, %xmm15
     3c3:      	punpckhwd	%xmm2, %xmm15   # xmm15 = xmm15[4],xmm2[4],xmm15[5],xmm2[5],xmm15[6],xmm2[6],xmm15[7],xmm2[7]
     3c8:      	psubd	%xmm15, %xmm14
     3cd:      	punpcklwd	%xmm2, %xmm12   # xmm12 = xmm12[0],xmm2[0],xmm12[1],xmm2[1],xmm12[2],xmm2[2],xmm12[3],xmm2[3]
     3d2:      	psubd	%xmm12, %xmm13
     3d7:      	movdqa	%xmm13, %xmm12
     3dc:      	paddd	%xmm7, %xmm12
     3e1:      	movdqa	%xmm14, %xmm15
     3e6:      	paddd	%xmm7, %xmm15
     3eb:      	movdqa	%xmm15, %xmm1
     3f0:      	pxor	%xmm9, %xmm1
     3f5:      	movdqa	%xmm3, %xmm10
     3fa:      	movdqa	%xmm12, %xmm4
     3ff:      	pxor	%xmm9, %xmm4
     404:      	pcmpgtd	%xmm1, %xmm10
     409:      	movdqa	%xmm3, %xmm1
     40d:      	pcmpgtd	%xmm4, %xmm1
     411:      	paddd	%xmm8, %xmm13
     416:      	pand	%xmm1, %xmm12
     41b:      	pandn	%xmm13, %xmm1
     420:      	por	%xmm12, %xmm1
     425:      	paddd	%xmm8, %xmm14
     42a:      	pand	%xmm10, %xmm15
     42f:      	pandn	%xmm14, %xmm10
     434:      	por	%xmm15, %xmm10
     439:      	pslld	$0x10, %xmm10
     43f:      	psrad	$0x10, %xmm10
     445:      	pslld	$0x10, %xmm1
     44a:      	psrad	$0x10, %xmm1
     44f:      	packssdw	%xmm10, %xmm1
     454:      	movdqu	%xmm1, -0x2c0(%rbp,%r14,2)
     45e:      	addq	$0x8, %r14
     462:      	paddb	%xmm11, %xmm0
     467:      	addq	$0x4, %rax
     46b:      	cmpq	$0x100, %r14            # imm = 0x100
     472:      	jne	0x280 <toyos_crypto::mlkem::noise+0x280>
     478:      	leaq	-0x2c0(%rbp), %rsi
     47f:      	movl	$0x200, %edx            # imm = 0x200
     484:      	movq	%rbx, %rdi
     487:      	callq	0x48c <toyos_crypto::mlkem::noise+0x48c>
     48c:      	pxor	%xmm0, %xmm0
     490:      	movdqa	%xmm0, -0x2c0(%rbp)
     498:      	movaps	-0x2c0(%rbp), %xmm1
     49f:      	movaps	%xmm1, -0xc0(%rbp)
     4a6:      	movdqa	%xmm0, -0x2c0(%rbp)
     4ae:      	movaps	-0x2c0(%rbp), %xmm1
     4b5:      	movaps	%xmm1, -0xb0(%rbp)
     4bc:      	movdqa	%xmm0, -0x2c0(%rbp)
     4c4:      	movaps	-0x2c0(%rbp), %xmm1
     4cb:      	movaps	%xmm1, -0xa0(%rbp)
     4d2:      	movdqa	%xmm0, -0x2c0(%rbp)
     4da:      	movaps	-0x2c0(%rbp), %xmm1
     4e1:      	movaps	%xmm1, -0x90(%rbp)
     4e8:      	movdqa	%xmm0, -0x2c0(%rbp)
     4f0:      	movaps	-0x2c0(%rbp), %xmm1
     4f7:      	movaps	%xmm1, -0x80(%rbp)
     4fb:      	movdqa	%xmm0, -0x2c0(%rbp)
     503:      	movaps	-0x2c0(%rbp), %xmm1
     50a:      	movaps	%xmm1, -0x70(%rbp)
     50e:      	movdqa	%xmm0, -0x2c0(%rbp)
     516:      	movaps	-0x2c0(%rbp), %xmm1
     51d:      	movaps	%xmm1, -0x60(%rbp)
     521:      	movdqa	%xmm0, -0x2c0(%rbp)
     529:      	movaps	-0x2c0(%rbp), %xmm0
     530:      	movaps	%xmm0, -0x50(%rbp)
     534:      	movq	%rbx, %rax
     537:      	addq	$0x2a8, %rsp            # imm = 0x2A8
     53e:      	popq	%rbx
     53f:      	popq	%r14
     541:      	popq	%r15
     543:      	popq	%rbp
     544:      	retq
     545:      	leaq	(%rip), %rdx            # 0x54c <toyos_crypto::mlkem::noise+0x54c>
     54c:      	movl	$0x19, %esi
     551:      	callq	0x556 <toyos_crypto::mlkem::noise+0x556>
     556:      	ud2
     558:      	movq	%rax, %rbx
     55b:      	jmp	0x56e <toyos_crypto::mlkem::noise+0x56e>
     55d:      	jmp	0x55f <toyos_crypto::mlkem::noise+0x55f>
     55f:      	movq	%rax, %rbx
     562:      	leaq	-0x2c0(%rbp), %rdi
     569:      	callq	0x56e <toyos_crypto::mlkem::noise+0x56e>
     56e:      	leaq	-0xc0(%rbp), %rdi
     575:      	callq	0x57a <toyos_crypto::mlkem::noise+0x57a>
     57a:      	movq	%rbx, %rdi
     57d:      	callq	0x582 <toyos_crypto::mlkem::noise+0x582>
     582:      	callq	0x587 <toyos_crypto::mlkem::noise+0x587>

0000000000000000 <toyos_crypto::mlkem::sample>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%r13
       a:      	pushq	%r12
       c:      	pushq	%rbx
       d:      	subq	$0x2e8, %rsp            # imm = 0x2E8
      14:      	movq	%rdi, %rbx
      17:      	movb	%cl, -0x2a(%rbp)
      1a:      	movb	%dl, -0x29(%rbp)
      1d:      	movq	%rsi, -0x308(%rbp)
      24:      	movq	$0x20, -0x300(%rbp)
      2f:      	leaq	-0x2a(%rbp), %rax
      33:      	movq	%rax, -0x2f8(%rbp)
      3a:      	movq	$0x2, -0x2f0(%rbp)
      45:      	leaq	-0x108(%rbp), %r14
      4c:      	leaq	-0x308(%rbp), %rcx
      53:      	movl	$0xa8, %esi
      58:      	movl	$0x2, %r8d
      5e:      	movq	%r14, %rdi
      61:      	movl	$0x1f, %edx
      66:      	callq	0x6b <toyos_crypto::mlkem::sample+0x6b>
      6b:      	leaq	-0x308(%rbp), %rdi
      72:      	xorl	%r15d, %r15d
      75:      	movl	$0x200, %edx            # imm = 0x200
      7a:      	xorl	%esi, %esi
      7c:      	callq	0x81 <toyos_crypto::mlkem::sample+0x81>
      81:      	movq	-0x38(%rbp), %rax
      85:      	jmp	0x9d <toyos_crypto::mlkem::sample+0x9d>
      87:      	nopw	(%rax,%rax)
      90:      	cmpq	$0x100, %r15            # imm = 0x100
      97:      	jae	0x1ec <toyos_crypto::mlkem::sample+0x1ec>
      9d:      	movq	-0x40(%rbp), %rdx
      a1:      	cmpq	%rdx, %rax
      a4:      	jne	0xc0 <toyos_crypto::mlkem::sample+0xc0>
      a6:      	movq	%r14, %rdi
      a9:      	callq	0xae <toyos_crypto::mlkem::sample+0xae>
      ae:      	movq	$0x0, -0x38(%rbp)
      b6:      	movq	-0x40(%rbp), %rdx
      ba:      	xorl	%edi, %edi
      bc:      	xorl	%eax, %eax
      be:      	jmp	0xd3 <toyos_crypto::mlkem::sample+0xd3>
      c0:      	movq	%rax, %rdi
      c3:      	shrq	$0x3, %rdi
      c7:      	cmpq	$0xc8, %rax
      cd:      	jae	0x310 <toyos_crypto::mlkem::sample+0x310>
      d3:      	movq	-0x108(%rbp,%rdi,8), %r12
      db:      	leal	(,%rax,8), %ecx
      e2:      	shrq	%cl, %r12
      e5:      	leaq	0x1(%rax), %rsi
      e9:      	movq	%rsi, -0x38(%rbp)
      ed:      	cmpq	%rdx, %rsi
      f0:      	jne	0x110 <toyos_crypto::mlkem::sample+0x110>
      f2:      	movq	%r14, %rdi
      f5:      	callq	0xfa <toyos_crypto::mlkem::sample+0xfa>
      fa:      	movq	$0x0, -0x38(%rbp)
     102:      	movq	-0x40(%rbp), %rdx
     106:      	xorl	%edi, %edi
     108:      	xorl	%esi, %esi
     10a:      	jmp	0x123 <toyos_crypto::mlkem::sample+0x123>
     10c:      	nopl	(%rax)
     110:      	movq	%rsi, %rdi
     113:      	shrq	$0x3, %rdi
     117:      	cmpq	$0xc7, %rax
     11d:      	jae	0x310 <toyos_crypto::mlkem::sample+0x310>
     123:      	movq	-0x108(%rbp,%rdi,8), %r13
     12b:      	leal	(,%rsi,8), %ecx
     132:      	shrq	%cl, %r13
     135:      	leaq	0x1(%rsi), %rax
     139:      	movq	%rax, -0x38(%rbp)
     13d:      	cmpq	%rdx, %rax
     140:      	jne	0x160 <toyos_crypto::mlkem::sample+0x160>
     142:      	movq	%r14, %rdi
     145:      	callq	0x14a <toyos_crypto::mlkem::sample+0x14a>
     14a:      	movq	$0x0, -0x38(%rbp)
     152:      	xorl	%edi, %edi
     154:      	xorl	%eax, %eax
     156:      	jmp	0x174 <toyos_crypto::mlkem::sample+0x174>
     158:      	nopl	(%rax,%rax)
     160:      	movq	%rax, %rdi
     163:      	shrq	$0x3, %rdi
     167:      	cmpq	$0xc7, %rsi
     16e:      	jae	0x310 <toyos_crypto::mlkem::sample+0x310>
     174:      	movq	-0x108(%rbp,%rdi,8), %rdx
     17c:      	leal	(,%rax,8), %ecx
     183:      	shrq	%cl, %rdx
     186:      	incq	%rax
     189:      	movq	%rax, -0x38(%rbp)
     18d:      	movzbl	%r12b, %esi
     191:      	movl	%r13d, %ecx
     194:      	andl	$0xf, %ecx
     197:      	shll	$0x8, %ecx
     19a:      	orl	%esi, %ecx
     19c:      	cmpl	$0xd01, %ecx            # imm = 0xD01
     1a2:      	jae	0x1b0 <toyos_crypto::mlkem::sample+0x1b0>
     1a4:      	movw	%cx, -0x308(%rbp,%r15,2)
     1ad:      	incq	%r15
     1b0:      	movzbl	%r13b, %esi
     1b4:      	shrl	$0x4, %esi
     1b7:      	movzbl	%dl, %ecx
     1ba:      	shll	$0x4, %ecx
     1bd:      	orl	%esi, %ecx
     1bf:      	movzwl	%cx, %edx
     1c2:      	cmpl	$0xd00, %edx            # imm = 0xD00
     1c8:      	ja	0x90 <toyos_crypto::mlkem::sample+0x90>
     1ce:      	cmpq	$0xff, %r15
     1d5:      	ja	0x90 <toyos_crypto::mlkem::sample+0x90>
     1db:      	movw	%cx, -0x308(%rbp,%r15,2)
     1e4:      	incq	%r15
     1e7:      	jmp	0x90 <toyos_crypto::mlkem::sample+0x90>
     1ec:      	leaq	-0x308(%rbp), %rsi
     1f3:      	movl	$0x200, %edx            # imm = 0x200
     1f8:      	movq	%rbx, %rdi
     1fb:      	callq	0x200 <toyos_crypto::mlkem::sample+0x200>
     200:      	movq	$0x0, -0x108(%rbp)
     20b:      	movq	$0x0, -0x100(%rbp)
     216:      	movq	$0x0, -0xf8(%rbp)
     221:      	movq	$0x0, -0xf0(%rbp)
     22c:      	movq	$0x0, -0xe8(%rbp)
     237:      	movq	$0x0, -0xe0(%rbp)
     242:      	movq	$0x0, -0xd8(%rbp)
     24d:      	movq	$0x0, -0xd0(%rbp)
     258:      	movq	$0x0, -0xc8(%rbp)
     263:      	movq	$0x0, -0xc0(%rbp)
     26e:      	movq	$0x0, -0xb8(%rbp)
     279:      	movq	$0x0, -0xb0(%rbp)
     284:      	movq	$0x0, -0xa8(%rbp)
     28f:      	movq	$0x0, -0xa0(%rbp)
     29a:      	movq	$0x0, -0x98(%rbp)
     2a5:      	movq	$0x0, -0x90(%rbp)
     2b0:      	movq	$0x0, -0x88(%rbp)
     2bb:      	movq	$0x0, -0x80(%rbp)
     2c3:      	movq	$0x0, -0x78(%rbp)
     2cb:      	movq	$0x0, -0x70(%rbp)
     2d3:      	movq	$0x0, -0x68(%rbp)
     2db:      	movq	$0x0, -0x60(%rbp)
     2e3:      	movq	$0x0, -0x58(%rbp)
     2eb:      	movq	$0x0, -0x50(%rbp)
     2f3:      	movq	$0x0, -0x48(%rbp)
     2fb:      	movq	%rbx, %rax
     2fe:      	addq	$0x2e8, %rsp            # imm = 0x2E8
     305:      	popq	%rbx
     306:      	popq	%r12
     308:      	popq	%r13
     30a:      	popq	%r14
     30c:      	popq	%r15
     30e:      	popq	%rbp
     30f:      	retq
     310:      	leaq	(%rip), %rdx            # 0x317 <toyos_crypto::mlkem::sample+0x317>
     317:      	movl	$0x19, %esi
     31c:      	callq	0x321 <toyos_crypto::mlkem::sample+0x321>
     321:      	ud2
     323:      	jmp	0x325 <toyos_crypto::mlkem::sample+0x325>
     325:      	movq	%rax, %rbx
     328:      	xorl	%eax, %eax
     32a:      	nopw	(%rax,%rax)
     330:      	movw	$0x0, -0x308(%rbp,%rax)
     33a:      	movw	$0x0, -0x306(%rbp,%rax)
     344:      	movw	$0x0, -0x304(%rbp,%rax)
     34e:      	movw	$0x0, -0x302(%rbp,%rax)
     358:      	movw	$0x0, -0x300(%rbp,%rax)
     362:      	movw	$0x0, -0x2fe(%rbp,%rax)
     36c:      	movw	$0x0, -0x2fc(%rbp,%rax)
     376:      	movw	$0x0, -0x2fa(%rbp,%rax)
     380:      	addq	$0x10, %rax
     384:      	cmpq	$0x200, %rax            # imm = 0x200
     38a:      	jne	0x330 <toyos_crypto::mlkem::sample+0x330>
     38c:      	leaq	-0x108(%rbp), %rdi
     393:      	callq	0x398 <toyos_crypto::mlkem::sample+0x398>
     398:      	movq	%rbx, %rdi
     39b:      	callq	0x3a0 <toyos_crypto::mlkem::sample+0x3a0>
     3a0:      	callq	0x3a5 <toyos_crypto::mlkem::sample+0x3a5>

~/.claude/jobs/2280e09e/tmp/scratchpad/agents/mlkem/target-rlib/x86_64-unknown-toyos/toyos/libtoyos_crypto.rlib(toyos_crypto-d55b0841b948afee.2ram1ocbntcacqk0me8ebi5o4.0z0t0v6.rcgu.o):	file format elf64-x86-64

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

0000000000000000 <<toyos_crypto::keccak::Sponge>::new>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%r13
       a:      	pushq	%r12
       c:      	pushq	%rbx
       d:      	subq	$0xf8, %rsp
      14:      	movq	%rcx, %r13
      17:      	movq	%rsi, %r14
      1a:      	movq	%rdi, %rbx
      1d:      	cmpq	$0x48, %rsi
      21:      	je	0x39 <<toyos_crypto::keccak::Sponge>::new+0x39>
      23:      	cmpq	$0x88, %r14
      2a:      	je	0x39 <<toyos_crypto::keccak::Sponge>::new+0x39>
      2c:      	cmpq	$0xa8, %r14
      33:      	jne	0x23e <<toyos_crypto::keccak::Sponge>::new+0x23e>
      39:      	xorps	%xmm0, %xmm0
      3c:      	movaps	%xmm0, -0x70(%rbp)
      40:      	movaps	%xmm0, -0x80(%rbp)
      44:      	movaps	%xmm0, -0x90(%rbp)
      4b:      	movaps	%xmm0, -0xa0(%rbp)
      52:      	movaps	%xmm0, -0xb0(%rbp)
      59:      	movaps	%xmm0, -0xc0(%rbp)
      60:      	movaps	%xmm0, -0xd0(%rbp)
      67:      	movaps	%xmm0, -0xe0(%rbp)
      6e:      	movaps	%xmm0, -0xf0(%rbp)
      75:      	movaps	%xmm0, -0x100(%rbp)
      7c:      	movaps	%xmm0, -0x110(%rbp)
      83:      	movaps	%xmm0, -0x120(%rbp)
      8a:      	movq	$0x0, -0x60(%rbp)
      92:      	movq	%r14, -0x58(%rbp)
      96:      	movq	$0x0, -0x50(%rbp)
      9e:      	testq	%r8, %r8
      a1:      	je	0x1a1 <<toyos_crypto::keccak::Sponge>::new+0x1a1>
      a7:      	movl	%edx, -0x34(%rbp)
      aa:      	movq	%rbx, -0x40(%rbp)
      ae:      	shlq	$0x4, %r8
      b2:      	addq	%r13, %r8
      b5:      	xorl	%ecx, %ecx
      b7:      	leaq	(%rip), %rax            # 0xbe <<toyos_crypto::keccak::Sponge>::new+0xbe>
      be:      	movq	%rax, -0x30(%rbp)
      c2:      	movq	%r8, -0x48(%rbp)
      c6:      	jmp	0xdd <<toyos_crypto::keccak::Sponge>::new+0xdd>
      c8:      	nopl	(%rax,%rax)
      d0:      	addq	$0x10, %r13
      d4:      	movq	-0x48(%rbp), %r8
      d8:      	cmpq	%r8, %r13
      db:      	je	0x151 <<toyos_crypto::keccak::Sponge>::new+0x151>
      dd:      	movq	0x8(%r13), %rbx
      e1:      	testq	%rbx, %rbx
      e4:      	je	0xd0 <<toyos_crypto::keccak::Sponge>::new+0xd0>
      e6:      	movq	(%r13), %r12
      ea:      	xorl	%r15d, %r15d
      ed:      	jmp	0xf8 <<toyos_crypto::keccak::Sponge>::new+0xf8>
      ef:      	nop
      f0:      	incq	%r15
      f3:      	cmpq	%r15, %rbx
      f6:      	je	0xd0 <<toyos_crypto::keccak::Sponge>::new+0xd0>
      f8:      	movq	%rcx, %rdi
      fb:      	shrq	$0x3, %rdi
      ff:      	cmpq	$0xc7, %rcx
     106:      	ja	0x220 <<toyos_crypto::keccak::Sponge>::new+0x220>
     10c:      	shll	$0x3, %ecx
     10f:      	movzbl	(%r12,%r15), %eax
     114:      	shlq	%cl, %rax
     117:      	xorq	%rax, -0x120(%rbp,%rdi,8)
     11f:      	movq	-0x50(%rbp), %rcx
     123:      	cmpq	$-0x1, %rcx
     127:      	je	0x207 <<toyos_crypto::keccak::Sponge>::new+0x207>
     12d:      	incq	%rcx
     130:      	movq	%rcx, -0x50(%rbp)
     134:      	cmpq	%r14, %rcx
     137:      	jne	0xf0 <<toyos_crypto::keccak::Sponge>::new+0xf0>
     139:      	leaq	-0x120(%rbp), %rdi
     140:      	callq	0x145 <<toyos_crypto::keccak::Sponge>::new+0x145>
     145:      	movq	$0x0, -0x50(%rbp)
     14d:      	xorl	%ecx, %ecx
     14f:      	jmp	0xf0 <<toyos_crypto::keccak::Sponge>::new+0xf0>
     151:      	movq	%rcx, %rdi
     154:      	shrq	$0x3, %rdi
     158:      	cmpq	$0xc8, %rcx
     15f:      	jae	0x215 <<toyos_crypto::keccak::Sponge>::new+0x215>
     165:      	shll	$0x3, %ecx
     168:      	movzbl	-0x34(%rbp), %eax
     16c:      	shlq	%cl, %rax
     16f:      	xorq	%rax, -0x120(%rbp,%rdi,8)
     177:      	testq	%r14, %r14
     17a:      	movq	-0x40(%rbp), %rbx
     17e:      	je	0x230 <<toyos_crypto::keccak::Sponge>::new+0x230>
     184:      	leaq	-0x1(%r14), %rcx
     188:      	movq	%rcx, %rdi
     18b:      	shrq	$0x3, %rdi
     18f:      	cmpq	$0xc9, %r14
     196:      	jb	0x1b8 <<toyos_crypto::keccak::Sponge>::new+0x1b8>
     198:      	leaq	(%rip), %rax            # 0x19f <<toyos_crypto::keccak::Sponge>::new+0x19f>
     19f:      	jmp	0x21c <<toyos_crypto::keccak::Sponge>::new+0x21c>
     1a1:      	movzbl	%dl, %eax
     1a4:      	movq	%rax, -0x120(%rbp)
     1ab:      	decq	%r14
     1ae:      	movq	%r14, %rdi
     1b1:      	shrq	$0x3, %rdi
     1b5:      	movq	%r14, %rcx
     1b8:      	shll	$0x3, %ecx
     1bb:      	movl	$0x80, %eax
     1c0:      	shlq	%cl, %rax
     1c3:      	xorq	%rax, -0x120(%rbp,%rdi,8)
     1cb:      	leaq	-0x120(%rbp), %r14
     1d2:      	movq	%r14, %rdi
     1d5:      	callq	0x1da <<toyos_crypto::keccak::Sponge>::new+0x1da>
     1da:      	movq	$0x0, -0x50(%rbp)
     1e2:      	movl	$0xd8, %edx
     1e7:      	movq	%rbx, %rdi
     1ea:      	movq	%r14, %rsi
     1ed:      	callq	0x1f2 <<toyos_crypto::keccak::Sponge>::new+0x1f2>
     1f2:      	movq	%rbx, %rax
     1f5:      	addq	$0xf8, %rsp
     1fc:      	popq	%rbx
     1fd:      	popq	%r12
     1ff:      	popq	%r13
     201:      	popq	%r14
     203:      	popq	%r15
     205:      	popq	%rbp
     206:      	retq
     207:      	leaq	(%rip), %rdi            # 0x20e <<toyos_crypto::keccak::Sponge>::new+0x20e>
     20e:      	callq	0x213 <<toyos_crypto::keccak::Sponge>::new+0x213>
     213:      	jmp	0x23c <<toyos_crypto::keccak::Sponge>::new+0x23c>
     215:      	leaq	(%rip), %rax            # 0x21c <<toyos_crypto::keccak::Sponge>::new+0x21c>
     21c:      	movq	%rax, -0x30(%rbp)
     220:      	movl	$0x19, %esi
     225:      	movq	-0x30(%rbp), %rdx
     229:      	callq	0x22e <<toyos_crypto::keccak::Sponge>::new+0x22e>
     22e:      	jmp	0x23c <<toyos_crypto::keccak::Sponge>::new+0x23c>
     230:      	leaq	(%rip), %rdi            # 0x237 <<toyos_crypto::keccak::Sponge>::new+0x237>
     237:      	callq	0x23c <<toyos_crypto::keccak::Sponge>::new+0x23c>
     23c:      	ud2
     23e:      	leaq	(%rip), %rdi            # 0x245 <<toyos_crypto::keccak::Sponge>::new+0x245>
     245:      	leaq	(%rip), %rdx            # 0x24c <<toyos_crypto::keccak::Sponge>::new+0x24c>
     24c:      	movl	$0x30, %esi
     251:      	callq	0x256 <<toyos_crypto::keccak::Sponge>::new+0x256>
     256:      	movq	%rax, %rbx
     259:      	leaq	-0x120(%rbp), %rdi
     260:      	callq	0x265 <<toyos_crypto::keccak::Sponge>::new+0x265>
     265:      	movq	%rbx, %rdi
     268:      	callq	0x26d <<toyos_crypto::keccak::Sponge>::new+0x26d>
     26d:      	callq	0x272 <<toyos_crypto::keccak::Sponge>::new+0x272>

0000000000000000 <<toyos_crypto::keccak::Sponge>::read>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%r12
       a:      	pushq	%rbx
       b:      	testq	%rdx, %rdx
       e:      	je	0x93 <<toyos_crypto::keccak::Sponge>::read+0x93>
      14:      	movq	%rdx, %rbx
      17:      	movq	%rsi, %r14
      1a:      	movq	%rdi, %r15
      1d:      	movq	0xd0(%rdi), %rax
      24:      	xorl	%r12d, %r12d
      27:      	jmp	0x6a <<toyos_crypto::keccak::Sponge>::read+0x6a>
      29:      	nopl	(%rax)
      30:      	movq	%r15, %rdi
      33:      	callq	0x38 <<toyos_crypto::keccak::Sponge>::read+0x38>
      38:      	movq	$0x0, 0xd0(%r15)
      43:      	xorl	%edi, %edi
      45:      	xorl	%eax, %eax
      47:      	leaq	(%r15,%rdi,8), %rcx
      4b:      	movl	%eax, %edx
      4d:      	andl	$0x7, %edx
      50:      	movzbl	(%rdx,%rcx), %ecx
      54:      	movb	%cl, (%r14,%r12)
      58:      	incq	%rax
      5b:      	movq	%rax, 0xd0(%r15)
      62:      	incq	%r12
      65:      	cmpq	%r12, %rbx
      68:      	je	0x93 <<toyos_crypto::keccak::Sponge>::read+0x93>
      6a:      	cmpq	0xc8(%r15), %rax
      71:      	je	0x30 <<toyos_crypto::keccak::Sponge>::read+0x30>
      73:      	movq	%rax, %rdi
      76:      	shrq	$0x3, %rdi
      7a:      	cmpq	$0xc8, %rax
      80:      	jb	0x47 <<toyos_crypto::keccak::Sponge>::read+0x47>
      82:      	leaq	(%rip), %rdx            # 0x89 <<toyos_crypto::keccak::Sponge>::read+0x89>
      89:      	movl	$0x19, %esi
      8e:      	callq	0x93 <<toyos_crypto::keccak::Sponge>::read+0x93>
      93:      	popq	%rbx
      94:      	popq	%r12
      96:      	popq	%r14
      98:      	popq	%r15
      9a:      	popq	%rbp
      9b:      	retq

0000000000000000 <<toyos_crypto::keccak::Sponge>::permute (.llvm.18235512069962108442)>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%r13
       a:      	pushq	%r12
       c:      	pushq	%rbx
       d:      	subq	$0x358, %rsp            # imm = 0x358
      14:      	movq	%rdi, %rbx
      17:      	movq	$0x0, -0x240(%rbp)
      22:      	movq	$0x0, -0x238(%rbp)
      2d:      	movq	$0x0, -0x230(%rbp)
      38:      	movq	$0x0, -0x228(%rbp)
      43:      	movq	$0x0, -0x220(%rbp)
      4e:      	movq	$0x0, -0x178(%rbp)
      59:      	movq	$0x0, -0x170(%rbp)
      64:      	movq	$0x0, -0x168(%rbp)
      6f:      	movq	$0x0, -0x160(%rbp)
      7a:      	movq	$0x0, -0x158(%rbp)
      85:      	movq	$0x0, -0x1d0(%rbp)
      90:      	movq	$0x0, -0x1c8(%rbp)
      9b:      	movq	$0x0, -0x1c0(%rbp)
      a6:      	movq	$0x0, -0x1b8(%rbp)
      b1:      	movq	$0x0, -0x1b0(%rbp)
      bc:      	movq	$0x0, -0x1a8(%rbp)
      c7:      	movq	$0x0, -0x1a0(%rbp)
      d2:      	movq	$0x0, -0x198(%rbp)
      dd:      	movq	$0x0, -0x190(%rbp)
      e8:      	movq	$0x0, -0x188(%rbp)
      f3:      	movq	$0x0, -0x180(%rbp)
      fe:      	leaq	-0x370(%rbp), %rdi
     105:      	leaq	(%rip), %rsi            # 0x10c <<toyos_crypto::keccak::Sponge>::permute (.llvm.18235512069962108442)+0x10c>
     10c:      	movl	$0xc0, %edx
     111:      	callq	0x116 <<toyos_crypto::keccak::Sponge>::permute (.llvm.18235512069962108442)+0x116>
     116:      	movq	(%rbx), %rdi
     119:      	movq	0x8(%rbx), %rax
     11d:      	movq	%rax, -0x40(%rbp)
     121:      	movq	0x28(%rbx), %rax
     125:      	movq	%rax, -0xb8(%rbp)
     12c:      	movq	0x50(%rbx), %rax
     130:      	movq	%rax, -0xa0(%rbp)
     137:      	movq	0x78(%rbx), %rax
     13b:      	movq	%rax, -0x80(%rbp)
     13f:      	movq	0xa0(%rbx), %rax
     146:      	movq	%rax, -0x60(%rbp)
     14a:      	movq	0x30(%rbx), %rax
     14e:      	movq	%rax, -0xa8(%rbp)
     155:      	movq	0x58(%rbx), %rax
     159:      	movq	%rax, -0x98(%rbp)
     160:      	movq	0x80(%rbx), %rax
     167:      	movq	%rax, -0x78(%rbp)
     16b:      	movq	0xa8(%rbx), %rax
     172:      	movq	%rax, -0x58(%rbp)
     176:      	movq	0x10(%rbx), %rax
     17a:      	movq	%rax, -0xb0(%rbp)
     181:      	movq	0x38(%rbx), %rax
     185:      	movq	%rax, -0x90(%rbp)
     18c:      	movq	0x60(%rbx), %rax
     190:      	movq	%rax, -0x70(%rbp)
     194:      	movq	0x88(%rbx), %r10
     19b:      	movq	0xb0(%rbx), %r13
     1a2:      	movq	0x18(%rbx), %rax
     1a6:      	movq	%rax, -0x88(%rbp)
     1ad:      	movq	0x40(%rbx), %rax
     1b1:      	movq	%rax, -0x68(%rbp)
     1b5:      	movq	0x68(%rbx), %rax
     1b9:      	movq	%rax, -0x50(%rbp)
     1bd:      	movq	0x90(%rbx), %r9
     1c4:      	movq	0xb8(%rbx), %r12
     1cb:      	movq	0x20(%rbx), %rax
     1cf:      	movq	%rax, -0xc8(%rbp)
     1d6:      	movq	0x48(%rbx), %rax
     1da:      	movq	%rax, -0x48(%rbp)
     1de:      	movq	0x70(%rbx), %rdx
     1e2:      	movq	0x98(%rbx), %r15
     1e9:      	movq	0xc0(%rbx), %r11
     1f0:      	movl	$0x2, %r14d
     1f6:      	movq	%r14, -0x218(%rbp)
     1fd:      	movq	-0x80(%rbp), %rax
     201:      	xorq	-0x60(%rbp), %rax
     205:      	movq	-0xa0(%rbp), %rcx
     20c:      	xorq	-0xb8(%rbp), %rcx
     213:      	xorq	%rax, %rcx
     216:      	movq	-0x78(%rbp), %rsi
     21a:      	xorq	-0x58(%rbp), %rsi
     21e:      	movq	-0x98(%rbp), %rax
     225:      	xorq	-0xa8(%rbp), %rax
     22c:      	xorq	%rsi, %rax
     22f:      	movq	%r10, -0x38(%rbp)
     233:      	xorq	%r13, %r10
     236:      	movq	-0x70(%rbp), %r14
     23a:      	xorq	-0x90(%rbp), %r14
     241:      	xorq	%r10, %r14
     244:      	movq	%r9, %rsi
     247:      	xorq	%r12, %rsi
     24a:      	movq	%rdi, %r8
     24d:      	movq	%rdi, -0x30(%rbp)
     251:      	movq	-0x50(%rbp), %rdi
     255:      	xorq	-0x68(%rbp), %rdi
     259:      	xorq	%rsi, %rdi
     25c:      	movq	%r15, %r10
     25f:      	xorq	%r11, %r10
     262:      	movq	%rdx, %rsi
     265:      	xorq	-0x48(%rbp), %rsi
     269:      	xorq	%r10, %rsi
     26c:      	xorq	%r8, %rcx
     26f:      	xorq	-0x40(%rbp), %rax
     273:      	xorq	-0xb0(%rbp), %r14
     27a:      	xorq	-0x88(%rbp), %rdi
     281:      	movq	-0xc8(%rbp), %r8
     288:      	xorq	%r8, %rsi
     28b:      	movq	%rdi, %r10
     28e:      	rolq	%r10
     291:      	xorq	%rax, %r10
     294:      	movq	%r10, -0xd0(%rbp)
     29b:      	rolq	%rax
     29e:      	xorq	%rsi, %rax
     2a1:      	movq	%r14, %r10
     2a4:      	rolq	%r10
     2a7:      	xorq	%rcx, %r10
     2aa:      	rolq	%rsi
     2ad:      	rolq	%rcx
     2b0:      	xorq	%r14, %rsi
     2b3:      	xorq	%rdi, %rcx
     2b6:      	movq	-0x30(%rbp), %rdi
     2ba:      	xorq	%rax, %rdi
     2bd:      	movq	%rdi, -0xc0(%rbp)
     2c4:      	movq	-0x40(%rbp), %rdi
     2c8:      	xorq	%r10, %rdi
     2cb:      	rolq	%rdi
     2ce:      	movq	%rdi, -0x150(%rbp)
     2d5:      	movq	-0xd0(%rbp), %r14
     2dc:      	movq	-0xb0(%rbp), %rdi
     2e3:      	xorq	%r14, %rdi
     2e6:      	rolq	$0x3e, %rdi
     2ea:      	movq	%rdi, -0x148(%rbp)
     2f1:      	movq	-0x88(%rbp), %rdi
     2f8:      	xorq	%rsi, %rdi
     2fb:      	rolq	$0x1c, %rdi
     2ff:      	movq	%rdi, -0x140(%rbp)
     306:      	xorq	%rcx, %r8
     309:      	rolq	$0x1b, %r8
     30d:      	movq	%r8, -0x138(%rbp)
     314:      	movq	-0xb8(%rbp), %rdi
     31b:      	xorq	%rax, %rdi
     31e:      	rolq	$0x24, %rdi
     322:      	movq	%rdi, -0x130(%rbp)
     329:      	movq	-0xa8(%rbp), %rdi
     330:      	xorq	%r10, %rdi
     333:      	rolq	$0x2c, %rdi
     337:      	movq	%rdi, -0x128(%rbp)
     33e:      	movq	-0x90(%rbp), %rdi
     345:      	xorq	%r14, %rdi
     348:      	movq	%r14, %r8
     34b:      	rolq	$0x6, %rdi
     34f:      	movq	%rdi, -0x120(%rbp)
     356:      	movq	-0x68(%rbp), %rdi
     35a:      	xorq	%rsi, %rdi
     35d:      	rolq	$0x37, %rdi
     361:      	movq	%rdi, -0x30(%rbp)
     365:      	movq	-0x48(%rbp), %rdi
     369:      	xorq	%rcx, %rdi
     36c:      	rolq	$0x14, %rdi
     370:      	movq	%rdi, -0x118(%rbp)
     377:      	movq	-0xa0(%rbp), %rdi
     37e:      	xorq	%rax, %rdi
     381:      	rolq	$0x3, %rdi
     385:      	movq	%rdi, -0x110(%rbp)
     38c:      	movq	-0x98(%rbp), %rdi
     393:      	xorq	%r10, %rdi
     396:      	rolq	$0xa, %rdi
     39a:      	movq	%rdi, -0x108(%rbp)
     3a1:      	movq	-0x70(%rbp), %r14
     3a5:      	xorq	%r8, %r14
     3a8:      	rolq	$0x2b, %r14
     3ac:      	movq	-0x50(%rbp), %rdi
     3b0:      	xorq	%rsi, %rdi
     3b3:      	rolq	$0x19, %rdi
     3b7:      	movq	%rdi, -0x100(%rbp)
     3be:      	xorq	%rcx, %rdx
     3c1:      	rolq	$0x27, %rdx
     3c5:      	movq	%rdx, -0xf8(%rbp)
     3cc:      	movq	-0x80(%rbp), %rdx
     3d0:      	xorq	%rax, %rdx
     3d3:      	rolq	$0x29, %rdx
     3d7:      	movq	%rdx, -0xf0(%rbp)
     3de:      	movq	-0x78(%rbp), %rdx
     3e2:      	xorq	%r10, %rdx
     3e5:      	rolq	$0x2d, %rdx
     3e9:      	movq	%rdx, -0xe8(%rbp)
     3f0:      	movq	-0x38(%rbp), %r8
     3f4:      	movq	-0xd0(%rbp), %rdx
     3fb:      	xorq	%rdx, %r8
     3fe:      	rolq	$0xf, %r8
     402:      	movq	%r8, -0x38(%rbp)
     406:      	xorq	%rsi, %r9
     409:      	rolq	$0x15, %r9
     40d:      	xorq	%rcx, %r15
     410:      	rolq	$0x8, %r15
     414:      	movq	%rax, -0x210(%rbp)
     41b:      	movq	-0x60(%rbp), %rdi
     41f:      	xorq	%rax, %rdi
     422:      	rolq	$0x12, %rdi
     426:      	movq	%rdi, -0xe0(%rbp)
     42d:      	movq	%r10, -0x208(%rbp)
     434:      	movq	-0x58(%rbp), %rdi
     438:      	xorq	%r10, %rdi
     43b:      	rolq	$0x2, %rdi
     43f:      	movq	%rdi, -0xd8(%rbp)
     446:      	xorq	%rdx, %r13
     449:      	rolq	$0x3d, %r13
     44d:      	xorq	%rsi, %r12
     450:      	rolq	$0x38, %r12
     454:      	xorq	%rcx, %r11
     457:      	rolq	$0xe, %r11
     45b:      	movq	-0x128(%rbp), %r8
     462:      	movq	%r8, %rdi
     465:      	notq	%rdi
     468:      	andq	%r14, %rdi
     46b:      	movq	%r14, %rax
     46e:      	notq	%rax
     471:      	andq	%r9, %rax
     474:      	xorq	%r8, %rax
     477:      	movq	%r8, %r10
     47a:      	movq	%rax, -0x40(%rbp)
     47e:      	movq	%r9, %rax
     481:      	notq	%rax
     484:      	andq	%r11, %rax
     487:      	movq	%r14, -0x200(%rbp)
     48e:      	xorq	%r14, %rax
     491:      	movq	%rax, -0xb0(%rbp)
     498:      	movq	%r11, %rax
     49b:      	notq	%rax
     49e:      	movq	-0xc0(%rbp), %r8
     4a5:      	andq	%r8, %rax
     4a8:      	movq	%r9, -0x1f8(%rbp)
     4af:      	xorq	%r9, %rax
     4b2:      	movq	%rax, -0x88(%rbp)
     4b9:      	movq	%r8, %rax
     4bc:      	notq	%rax
     4bf:      	andq	%r10, %rax
     4c2:      	movq	%r11, -0x1d8(%rbp)
     4c9:      	xorq	%r11, %rax
     4cc:      	movq	%rax, -0xc8(%rbp)
     4d3:      	movq	-0x118(%rbp), %r9
     4da:      	movq	%r9, %rax
     4dd:      	notq	%rax
     4e0:      	movq	-0x110(%rbp), %r10
     4e7:      	andq	%r10, %rax
     4ea:      	movq	-0x140(%rbp), %r8
     4f1:      	xorq	%r8, %rax
     4f4:      	movq	%rax, -0xb8(%rbp)
     4fb:      	movq	%r10, %rax
     4fe:      	notq	%rax
     501:      	movq	-0xe8(%rbp), %rdx
     508:      	andq	%rdx, %rax
     50b:      	xorq	%r9, %rax
     50e:      	movq	%rax, -0xa8(%rbp)
     515:      	movq	%rdx, %rax
     518:      	notq	%rax
     51b:      	andq	%r13, %rax
     51e:      	xorq	%r10, %rax
     521:      	movq	%rax, -0x90(%rbp)
     528:      	movq	%r13, %rax
     52b:      	notq	%rax
     52e:      	andq	%r8, %rax
     531:      	xorq	%rdx, %rax
     534:      	movq	%rax, -0x68(%rbp)
     538:      	movq	%r8, %rax
     53b:      	notq	%rax
     53e:      	andq	%r9, %rax
     541:      	movq	%r13, -0x1e8(%rbp)
     548:      	xorq	%r13, %rax
     54b:      	movq	%rax, -0x48(%rbp)
     54f:      	movq	-0x120(%rbp), %r8
     556:      	movq	%r8, %rax
     559:      	notq	%rax
     55c:      	movq	-0x100(%rbp), %r9
     563:      	andq	%r9, %rax
     566:      	movq	-0x150(%rbp), %rdx
     56d:      	xorq	%rdx, %rax
     570:      	movq	%rax, -0xa0(%rbp)
     577:      	movq	%r9, %rax
     57a:      	notq	%rax
     57d:      	andq	%r15, %rax
     580:      	xorq	%r8, %rax
     583:      	movq	%rax, -0x98(%rbp)
     58a:      	movq	%r15, %rax
     58d:      	notq	%rax
     590:      	movq	-0xe0(%rbp), %r10
     597:      	andq	%r10, %rax
     59a:      	xorq	%r9, %rax
     59d:      	movq	%rax, -0x70(%rbp)
     5a1:      	movq	%r10, %rax
     5a4:      	notq	%rax
     5a7:      	andq	%rdx, %rax
     5aa:      	movq	%r15, -0x1f0(%rbp)
     5b1:      	xorq	%r15, %rax
     5b4:      	movq	%rax, -0x50(%rbp)
     5b8:      	notq	%rdx
     5bb:      	andq	%r8, %rdx
     5be:      	xorq	%r10, %rdx
     5c1:      	movq	-0x130(%rbp), %r8
     5c8:      	movq	%r8, %rax
     5cb:      	notq	%rax
     5ce:      	movq	-0x108(%rbp), %r9
     5d5:      	andq	%r9, %rax
     5d8:      	movq	-0x138(%rbp), %r15
     5df:      	xorq	%r15, %rax
     5e2:      	movq	%rax, -0x80(%rbp)
     5e6:      	movq	%r9, %rax
     5e9:      	notq	%rax
     5ec:      	movq	-0x38(%rbp), %r11
     5f0:      	andq	%r11, %rax
     5f3:      	xorq	%r8, %rax
     5f6:      	movq	%rax, -0x78(%rbp)
     5fa:      	movq	%r11, %r10
     5fd:      	notq	%r10
     600:      	andq	%r12, %r10
     603:      	xorq	%r9, %r10
     606:      	movq	%r12, %r9
     609:      	notq	%r9
     60c:      	andq	%r15, %r9
     60f:      	xorq	%r11, %r9
     612:      	notq	%r15
     615:      	andq	%r8, %r15
     618:      	movq	%r12, -0x1e0(%rbp)
     61f:      	xorq	%r12, %r15
     622:      	movq	-0x30(%rbp), %r8
     626:      	movq	%r8, %rax
     629:      	notq	%rax
     62c:      	movq	-0xf8(%rbp), %r14
     633:      	andq	%r14, %rax
     636:      	movq	-0x148(%rbp), %r11
     63d:      	xorq	%r11, %rax
     640:      	movq	%rax, -0x60(%rbp)
     644:      	movq	%r14, %rax
     647:      	notq	%rax
     64a:      	movq	-0xf0(%rbp), %r13
     651:      	andq	%r13, %rax
     654:      	xorq	%r8, %rax
     657:      	movq	%rax, -0x58(%rbp)
     65b:      	movq	%r13, %rax
     65e:      	notq	%r13
     661:      	movq	-0xd8(%rbp), %r8
     668:      	andq	%r8, %r13
     66b:      	xorq	%r14, %r13
     66e:      	movq	%r8, %r12
     671:      	notq	%r12
     674:      	andq	%r11, %r12
     677:      	xorq	%rax, %r12
     67a:      	notq	%r11
     67d:      	andq	-0x30(%rbp), %r11
     681:      	movq	-0x218(%rbp), %rax
     688:      	xorq	-0x380(%rbp,%rax,8), %rdi
     690:      	xorq	%r8, %r11
     693:      	xorq	-0xc0(%rbp), %rdi
     69a:      	incq	%rax
     69d:      	movq	%rax, %r14
     6a0:      	cmpq	$0x1a, %rax
     6a4:      	jne	0x1f6 <<toyos_crypto::keccak::Sponge>::permute (.llvm.18235512069962108442)+0x1f6>
     6aa:      	movq	-0x40(%rbp), %rax
     6ae:      	movq	%rax, 0x8(%rbx)
     6b2:      	movq	-0xb0(%rbp), %rax
     6b9:      	movq	%rax, 0x10(%rbx)
     6bd:      	movq	-0x88(%rbp), %rax
     6c4:      	movq	%rax, 0x18(%rbx)
     6c8:      	movq	-0xc8(%rbp), %rax
     6cf:      	movq	%rax, 0x20(%rbx)
     6d3:      	movq	-0xb8(%rbp), %rax
     6da:      	movq	%rax, 0x28(%rbx)
     6de:      	movq	-0xa8(%rbp), %rax
     6e5:      	movq	%rax, 0x30(%rbx)
     6e9:      	movq	-0x90(%rbp), %rax
     6f0:      	movq	%rax, 0x38(%rbx)
     6f4:      	movq	-0x68(%rbp), %rax
     6f8:      	movq	%rax, 0x40(%rbx)
     6fc:      	movq	-0x48(%rbp), %rax
     700:      	movq	%rax, 0x48(%rbx)
     704:      	movq	-0xa0(%rbp), %rax
     70b:      	movq	%rax, 0x50(%rbx)
     70f:      	movq	-0x98(%rbp), %rax
     716:      	movq	%rax, 0x58(%rbx)
     71a:      	movq	-0x70(%rbp), %rax
     71e:      	movq	%rax, 0x60(%rbx)
     722:      	movq	-0x50(%rbp), %rax
     726:      	movq	%rax, 0x68(%rbx)
     72a:      	movq	%rdx, 0x70(%rbx)
     72e:      	movq	-0x80(%rbp), %rax
     732:      	movq	%rax, 0x78(%rbx)
     736:      	movq	-0x78(%rbp), %rax
     73a:      	movq	%rax, 0x80(%rbx)
     741:      	movq	%r10, 0x88(%rbx)
     748:      	movq	%r9, 0x90(%rbx)
     74f:      	movq	%r15, 0x98(%rbx)
     756:      	movq	-0x60(%rbp), %rax
     75a:      	movq	%rax, 0xa0(%rbx)
     761:      	movq	-0x58(%rbp), %rax
     765:      	movq	%rax, 0xa8(%rbx)
     76c:      	movq	%r13, 0xb0(%rbx)
     773:      	movq	%r12, 0xb8(%rbx)
     77a:      	movq	%r11, 0xc0(%rbx)
     781:      	movq	%rdi, (%rbx)
     784:      	movq	-0xe8(%rbp), %rax
     78b:      	movq	%rax, -0x190(%rbp)
     792:      	movq	-0x38(%rbp), %rax
     796:      	movq	%rax, -0x278(%rbp)
     79d:      	movq	-0x1f8(%rbp), %rax
     7a4:      	movq	%rax, -0x1b8(%rbp)
     7ab:      	movq	-0x1f0(%rbp), %rax
     7b2:      	movq	%rax, -0x2a0(%rbp)
     7b9:      	movq	-0xe0(%rbp), %rax
     7c0:      	movq	%rax, -0x298(%rbp)
     7c7:      	movq	-0xd8(%rbp), %rax
     7ce:      	movq	%rax, -0x248(%rbp)
     7d5:      	movq	-0x1e8(%rbp), %rax
     7dc:      	movq	%rax, -0x2b0(%rbp)
     7e3:      	movq	-0x1e0(%rbp), %rax
     7ea:      	movq	%rax, -0x270(%rbp)
     7f1:      	movq	-0x1d8(%rbp), %rax
     7f8:      	movq	%rax, -0x1b0(%rbp)
     7ff:      	movq	-0x210(%rbp), %rax
     806:      	movq	%rax, -0x178(%rbp)
     80d:      	movq	-0x208(%rbp), %rax
     814:      	movq	%rax, -0x170(%rbp)
     81b:      	movq	-0xd0(%rbp), %rax
     822:      	movq	%rax, -0x168(%rbp)
     829:      	movq	%rsi, -0x160(%rbp)
     830:      	movq	%rcx, -0x158(%rbp)
     837:      	movq	-0xc0(%rbp), %rax
     83e:      	movq	%rax, -0x1d0(%rbp)
     845:      	movq	-0x150(%rbp), %rax
     84c:      	movq	%rax, -0x188(%rbp)
     853:      	movq	-0x148(%rbp), %rax
     85a:      	movq	%rax, -0x268(%rbp)
     861:      	movq	-0x140(%rbp), %rax
     868:      	movq	%rax, -0x1a8(%rbp)
     86f:      	movq	-0x138(%rbp), %rax
     876:      	movq	%rax, -0x290(%rbp)
     87d:      	movq	-0x130(%rbp), %rax
     884:      	movq	%rax, -0x288(%rbp)
     88b:      	movq	-0x128(%rbp), %rax
     892:      	movq	%rax, -0x1c8(%rbp)
     899:      	movq	-0x120(%rbp), %rax
     8a0:      	movq	%rax, -0x180(%rbp)
     8a7:      	movq	-0x30(%rbp), %rax
     8ab:      	movq	%rax, -0x260(%rbp)
     8b2:      	movq	-0x118(%rbp), %rax
     8b9:      	movq	%rax, -0x1a0(%rbp)
     8c0:      	movq	-0x110(%rbp), %rax
     8c7:      	movq	%rax, -0x198(%rbp)
     8ce:      	movq	-0x108(%rbp), %rax
     8d5:      	movq	%rax, -0x280(%rbp)
     8dc:      	movq	-0x200(%rbp), %rax
     8e3:      	movq	%rax, -0x1c0(%rbp)
     8ea:      	movq	-0x100(%rbp), %rax
     8f1:      	movq	%rax, -0x2a8(%rbp)
     8f8:      	movq	-0xf8(%rbp), %rax
     8ff:      	movq	%rax, -0x258(%rbp)
     906:      	movq	-0xf0(%rbp), %rax
     90d:      	movq	%rax, -0x250(%rbp)
     914:      	movq	$0x0, -0x240(%rbp)
     91f:      	movq	$0x0, -0x238(%rbp)
     92a:      	movq	$0x0, -0x230(%rbp)
     935:      	movq	$0x0, -0x228(%rbp)
     940:      	movq	$0x0, -0x220(%rbp)
     94b:      	movq	$0x0, -0x178(%rbp)
     956:      	movq	$0x0, -0x170(%rbp)
     961:      	movq	$0x0, -0x168(%rbp)
     96c:      	movq	$0x0, -0x160(%rbp)
     977:      	movq	$0x0, -0x158(%rbp)
     982:      	movq	$0x0, -0x1d0(%rbp)
     98d:      	movq	$0x0, -0x1c8(%rbp)
     998:      	movq	$0x0, -0x1c0(%rbp)
     9a3:      	movq	$0x0, -0x1b8(%rbp)
     9ae:      	movq	$0x0, -0x1b0(%rbp)
     9b9:      	movq	$0x0, -0x1a8(%rbp)
     9c4:      	movq	$0x0, -0x1a0(%rbp)
     9cf:      	movq	$0x0, -0x198(%rbp)
     9da:      	movq	$0x0, -0x190(%rbp)
     9e5:      	movq	$0x0, -0x2b0(%rbp)
     9f0:      	movq	$0x0, -0x188(%rbp)
     9fb:      	movq	$0x0, -0x180(%rbp)
     a06:      	movq	$0x0, -0x2a8(%rbp)
     a11:      	movq	$0x0, -0x2a0(%rbp)
     a1c:      	movq	$0x0, -0x298(%rbp)
     a27:      	movq	$0x0, -0x290(%rbp)
     a32:      	movq	$0x0, -0x288(%rbp)
     a3d:      	movq	$0x0, -0x280(%rbp)
     a48:      	movq	$0x0, -0x278(%rbp)
     a53:      	movq	$0x0, -0x270(%rbp)
     a5e:      	movq	$0x0, -0x268(%rbp)
     a69:      	movq	$0x0, -0x260(%rbp)
     a74:      	movq	$0x0, -0x258(%rbp)
     a7f:      	movq	$0x0, -0x250(%rbp)
     a8a:      	movq	$0x0, -0x248(%rbp)
     a95:      	addq	$0x358, %rsp            # imm = 0x358
     a9c:      	popq	%rbx
     a9d:      	popq	%r12
     a9f:      	popq	%r13
     aa1:      	popq	%r14
     aa3:      	popq	%r15
     aa5:      	popq	%rbp
     aa6:      	retq

0000000000000000 <toyos_crypto::keccak::g>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%rbx
       9:      	subq	$0x118, %rsp            # imm = 0x118
      10:      	movq	%rdx, %r8
      13:      	movq	%rsi, %rcx
      16:      	movq	%rdi, %rbx
      19:      	xorps	%xmm0, %xmm0
      1c:      	movaps	%xmm0, -0x100(%rbp)
      23:      	movaps	%xmm0, -0x110(%rbp)
      2a:      	movaps	%xmm0, -0x120(%rbp)
      31:      	movaps	%xmm0, -0x130(%rbp)
      38:      	leaq	-0xf0(%rbp), %r14
      3f:      	movl	$0x48, %esi
      44:      	movq	%r14, %rdi
      47:      	movl	$0x6, %edx
      4c:      	callq	0x51 <toyos_crypto::keccak::g+0x51>
      51:      	xorl	%r15d, %r15d
      54:      	movq	-0x20(%rbp), %rax
      58:      	jmp	0xa0 <toyos_crypto::keccak::g+0xa0>
      5a:      	nopw	(%rax,%rax)
      60:      	movq	%r14, %rdi
      63:      	callq	0x68 <toyos_crypto::keccak::g+0x68>
      68:      	movq	$0x0, -0x20(%rbp)
      70:      	xorl	%edi, %edi
      72:      	xorl	%eax, %eax
      74:      	leaq	-0xf0(,%rdi,8), %rcx
      7c:      	addq	%rbp, %rcx
      7f:      	movl	%eax, %edx
      81:      	andl	$0x7, %edx
      84:      	movzbl	(%rdx,%rcx), %ecx
      88:      	movb	%cl, -0x130(%rbp,%r15)
      90:      	incq	%r15
      93:      	incq	%rax
      96:      	movq	%rax, -0x20(%rbp)
      9a:      	cmpq	$0x40, %r15
      9e:      	je	0xc8 <toyos_crypto::keccak::g+0xc8>
      a0:      	cmpq	-0x28(%rbp), %rax
      a4:      	je	0x60 <toyos_crypto::keccak::g+0x60>
      a6:      	movq	%rax, %rdi
      a9:      	shrq	$0x3, %rdi
      ad:      	cmpq	$0xc8, %rax
      b3:      	jb	0x74 <toyos_crypto::keccak::g+0x74>
      b5:      	leaq	(%rip), %rdx            # 0xbc <toyos_crypto::keccak::g+0xbc>
      bc:      	movl	$0x19, %esi
      c1:      	callq	0xc6 <toyos_crypto::keccak::g+0xc6>
      c6:      	ud2
      c8:      	movq	$0x0, -0xf0(%rbp)
      d3:      	movq	$0x0, -0xe8(%rbp)
      de:      	movq	$0x0, -0xe0(%rbp)
      e9:      	movq	$0x0, -0xd8(%rbp)
      f4:      	movq	$0x0, -0xd0(%rbp)
      ff:      	movq	$0x0, -0xc8(%rbp)
     10a:      	movq	$0x0, -0xc0(%rbp)
     115:      	movq	$0x0, -0xb8(%rbp)
     120:      	movq	$0x0, -0xb0(%rbp)
     12b:      	movq	$0x0, -0xa8(%rbp)
     136:      	movq	$0x0, -0xa0(%rbp)
     141:      	movq	$0x0, -0x98(%rbp)
     14c:      	movq	$0x0, -0x90(%rbp)
     157:      	movq	$0x0, -0x88(%rbp)
     162:      	movq	$0x0, -0x80(%rbp)
     16a:      	movq	$0x0, -0x78(%rbp)
     172:      	movq	$0x0, -0x70(%rbp)
     17a:      	movq	$0x0, -0x68(%rbp)
     182:      	movq	$0x0, -0x60(%rbp)
     18a:      	movq	$0x0, -0x58(%rbp)
     192:      	movq	$0x0, -0x50(%rbp)
     19a:      	movq	$0x0, -0x48(%rbp)
     1a2:      	movq	$0x0, -0x40(%rbp)
     1aa:      	movq	$0x0, -0x38(%rbp)
     1b2:      	movq	$0x0, -0x30(%rbp)
     1ba:      	movaps	-0x130(%rbp), %xmm0
     1c1:      	movaps	-0x120(%rbp), %xmm1
     1c8:      	movaps	-0x110(%rbp), %xmm2
     1cf:      	movaps	-0x100(%rbp), %xmm3
     1d6:      	movups	%xmm3, 0x30(%rbx)
     1da:      	movups	%xmm2, 0x20(%rbx)
     1de:      	movups	%xmm1, 0x10(%rbx)
     1e2:      	movups	%xmm0, (%rbx)
     1e5:      	movq	%rbx, %rax
     1e8:      	addq	$0x118, %rsp            # imm = 0x118
     1ef:      	popq	%rbx
     1f0:      	popq	%r14
     1f2:      	popq	%r15
     1f4:      	popq	%rbp
     1f5:      	retq
     1f6:      	movq	%rax, %rbx
     1f9:      	leaq	-0xf0(%rbp), %rdi
     200:      	callq	0x205 <toyos_crypto::keccak::g+0x205>
     205:      	movq	%rbx, %rdi
     208:      	callq	0x20d <toyos_crypto::keccak::g+0x20d>
     20d:      	callq	0x212 <toyos_crypto::keccak::g+0x212>

0000000000000000 <toyos_crypto::keccak::h>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%rbx
       9:      	subq	$0x108, %rsp            # imm = 0x108
      10:      	movq	%rdx, %r8
      13:      	movq	%rsi, %rcx
      16:      	movq	%rdi, %rbx
      19:      	xorps	%xmm0, %xmm0
      1c:      	movaps	%xmm0, -0x30(%rbp)
      20:      	movaps	%xmm0, -0x40(%rbp)
      24:      	leaq	-0x118(%rbp), %r14
      2b:      	movl	$0x88, %esi
      30:      	movq	%r14, %rdi
      33:      	movl	$0x6, %edx
      38:      	callq	0x3d <toyos_crypto::keccak::h+0x3d>
      3d:      	xorl	%r15d, %r15d
      40:      	movq	-0x48(%rbp), %rax
      44:      	jmp	0x8d <toyos_crypto::keccak::h+0x8d>
      46:      	nopw	%cs:(%rax,%rax)
      50:      	movq	%r14, %rdi
      53:      	callq	0x58 <toyos_crypto::keccak::h+0x58>
      58:      	movq	$0x0, -0x48(%rbp)
      60:      	xorl	%edi, %edi
      62:      	xorl	%eax, %eax
      64:      	leaq	-0x118(,%rdi,8), %rcx
      6c:      	addq	%rbp, %rcx
      6f:      	movl	%eax, %edx
      71:      	andl	$0x7, %edx
      74:      	movzbl	(%rdx,%rcx), %ecx
      78:      	movb	%cl, -0x40(%rbp,%r15)
      7d:      	incq	%r15
      80:      	incq	%rax
      83:      	movq	%rax, -0x48(%rbp)
      87:      	cmpq	$0x20, %r15
      8b:      	je	0xb5 <toyos_crypto::keccak::h+0xb5>
      8d:      	cmpq	-0x50(%rbp), %rax
      91:      	je	0x50 <toyos_crypto::keccak::h+0x50>
      93:      	movq	%rax, %rdi
      96:      	shrq	$0x3, %rdi
      9a:      	cmpq	$0xc8, %rax
      a0:      	jb	0x64 <toyos_crypto::keccak::h+0x64>
      a2:      	leaq	(%rip), %rdx            # 0xa9 <toyos_crypto::keccak::h+0xa9>
      a9:      	movl	$0x19, %esi
      ae:      	callq	0xb3 <toyos_crypto::keccak::h+0xb3>
      b3:      	ud2
      b5:      	movq	$0x0, -0x118(%rbp)
      c0:      	movq	$0x0, -0x110(%rbp)
      cb:      	movq	$0x0, -0x108(%rbp)
      d6:      	movq	$0x0, -0x100(%rbp)
      e1:      	movq	$0x0, -0xf8(%rbp)
      ec:      	movq	$0x0, -0xf0(%rbp)
      f7:      	movq	$0x0, -0xe8(%rbp)
     102:      	movq	$0x0, -0xe0(%rbp)
     10d:      	movq	$0x0, -0xd8(%rbp)
     118:      	movq	$0x0, -0xd0(%rbp)
     123:      	movq	$0x0, -0xc8(%rbp)
     12e:      	movq	$0x0, -0xc0(%rbp)
     139:      	movq	$0x0, -0xb8(%rbp)
     144:      	movq	$0x0, -0xb0(%rbp)
     14f:      	movq	$0x0, -0xa8(%rbp)
     15a:      	movq	$0x0, -0xa0(%rbp)
     165:      	movq	$0x0, -0x98(%rbp)
     170:      	movq	$0x0, -0x90(%rbp)
     17b:      	movq	$0x0, -0x88(%rbp)
     186:      	movq	$0x0, -0x80(%rbp)
     18e:      	movq	$0x0, -0x78(%rbp)
     196:      	movq	$0x0, -0x70(%rbp)
     19e:      	movq	$0x0, -0x68(%rbp)
     1a6:      	movq	$0x0, -0x60(%rbp)
     1ae:      	movq	$0x0, -0x58(%rbp)
     1b6:      	movaps	-0x40(%rbp), %xmm0
     1ba:      	movaps	-0x30(%rbp), %xmm1
     1be:      	movups	%xmm1, 0x10(%rbx)
     1c2:      	movups	%xmm0, (%rbx)
     1c5:      	movq	%rbx, %rax
     1c8:      	addq	$0x108, %rsp            # imm = 0x108
     1cf:      	popq	%rbx
     1d0:      	popq	%r14
     1d2:      	popq	%r15
     1d4:      	popq	%rbp
     1d5:      	retq
     1d6:      	movq	%rax, %rbx
     1d9:      	leaq	-0x118(%rbp), %rdi
     1e0:      	callq	0x1e5 <toyos_crypto::keccak::h+0x1e5>
     1e5:      	movq	%rbx, %rdi
     1e8:      	callq	0x1ed <toyos_crypto::keccak::h+0x1ed>
     1ed:      	callq	0x1f2 <toyos_crypto::keccak::h+0x1f2>

0000000000000000 <toyos_crypto::keccak::j>:
       0:      	pushq	%rbp
       1:      	movq	%rsp, %rbp
       4:      	pushq	%r15
       6:      	pushq	%r14
       8:      	pushq	%rbx
       9:      	subq	$0x108, %rsp            # imm = 0x108
      10:      	movq	%rdx, %r8
      13:      	movq	%rsi, %rcx
      16:      	movq	%rdi, %rbx
      19:      	xorps	%xmm0, %xmm0
      1c:      	movaps	%xmm0, -0x30(%rbp)
      20:      	movaps	%xmm0, -0x40(%rbp)
      24:      	leaq	-0x118(%rbp), %r14
      2b:      	movl	$0x88, %esi
      30:      	movq	%r14, %rdi
      33:      	movl	$0x1f, %edx
      38:      	callq	0x3d <toyos_crypto::keccak::j+0x3d>
      3d:      	xorl	%r15d, %r15d
      40:      	movq	-0x48(%rbp), %rax
      44:      	jmp	0x8d <toyos_crypto::keccak::j+0x8d>
      46:      	nopw	%cs:(%rax,%rax)
      50:      	movq	%r14, %rdi
      53:      	callq	0x58 <toyos_crypto::keccak::j+0x58>
      58:      	movq	$0x0, -0x48(%rbp)
      60:      	xorl	%edi, %edi
      62:      	xorl	%eax, %eax
      64:      	leaq	-0x118(,%rdi,8), %rcx
      6c:      	addq	%rbp, %rcx
      6f:      	movl	%eax, %edx
      71:      	andl	$0x7, %edx
      74:      	movzbl	(%rdx,%rcx), %ecx
      78:      	movb	%cl, -0x40(%rbp,%r15)
      7d:      	incq	%r15
      80:      	incq	%rax
      83:      	movq	%rax, -0x48(%rbp)
      87:      	cmpq	$0x20, %r15
      8b:      	je	0xb5 <toyos_crypto::keccak::j+0xb5>
      8d:      	cmpq	-0x50(%rbp), %rax
      91:      	je	0x50 <toyos_crypto::keccak::j+0x50>
      93:      	movq	%rax, %rdi
      96:      	shrq	$0x3, %rdi
      9a:      	cmpq	$0xc8, %rax
      a0:      	jb	0x64 <toyos_crypto::keccak::j+0x64>
      a2:      	leaq	(%rip), %rdx            # 0xa9 <toyos_crypto::keccak::j+0xa9>
      a9:      	movl	$0x19, %esi
      ae:      	callq	0xb3 <toyos_crypto::keccak::j+0xb3>
      b3:      	ud2
      b5:      	movq	$0x0, -0x118(%rbp)
      c0:      	movq	$0x0, -0x110(%rbp)
      cb:      	movq	$0x0, -0x108(%rbp)
      d6:      	movq	$0x0, -0x100(%rbp)
      e1:      	movq	$0x0, -0xf8(%rbp)
      ec:      	movq	$0x0, -0xf0(%rbp)
      f7:      	movq	$0x0, -0xe8(%rbp)
     102:      	movq	$0x0, -0xe0(%rbp)
     10d:      	movq	$0x0, -0xd8(%rbp)
     118:      	movq	$0x0, -0xd0(%rbp)
     123:      	movq	$0x0, -0xc8(%rbp)
     12e:      	movq	$0x0, -0xc0(%rbp)
     139:      	movq	$0x0, -0xb8(%rbp)
     144:      	movq	$0x0, -0xb0(%rbp)
     14f:      	movq	$0x0, -0xa8(%rbp)
     15a:      	movq	$0x0, -0xa0(%rbp)
     165:      	movq	$0x0, -0x98(%rbp)
     170:      	movq	$0x0, -0x90(%rbp)
     17b:      	movq	$0x0, -0x88(%rbp)
     186:      	movq	$0x0, -0x80(%rbp)
     18e:      	movq	$0x0, -0x78(%rbp)
     196:      	movq	$0x0, -0x70(%rbp)
     19e:      	movq	$0x0, -0x68(%rbp)
     1a6:      	movq	$0x0, -0x60(%rbp)
     1ae:      	movq	$0x0, -0x58(%rbp)
     1b6:      	movaps	-0x40(%rbp), %xmm0
     1ba:      	movaps	-0x30(%rbp), %xmm1
     1be:      	movups	%xmm1, 0x10(%rbx)
     1c2:      	movups	%xmm0, (%rbx)
     1c5:      	movq	%rbx, %rax
     1c8:      	addq	$0x108, %rsp            # imm = 0x108
     1cf:      	popq	%rbx
     1d0:      	popq	%r14
     1d2:      	popq	%r15
     1d4:      	popq	%rbp
     1d5:      	retq
     1d6:      	movq	%rax, %rbx
     1d9:      	leaq	-0x118(%rbp), %rdi
     1e0:      	callq	0x1e5 <toyos_crypto::keccak::j+0x1e5>
     1e5:      	movq	%rbx, %rdi
     1e8:      	callq	0x1ed <toyos_crypto::keccak::j+0x1ed>
     1ed:      	callq	0x1f2 <toyos_crypto::keccak::j+0x1f2>

~/.claude/jobs/2280e09e/tmp/scratchpad/agents/mlkem/target-rlib/x86_64-unknown-toyos/toyos/libtoyos_crypto.rlib(toyos_crypto-d55b0841b948afee.e9e023su5zr58yv99ezecp7gn.0z0t0v6.rcgu.o):	file format elf64-x86-64

