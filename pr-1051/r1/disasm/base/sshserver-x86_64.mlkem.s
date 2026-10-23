0000000000058d90 <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<sshserver::OsRandom>>:
   58d90:      	pushq	%rbp
   58d91:      	movq	%rsp, %rbp
   58d94:      	pushq	%r15
   58d96:      	pushq	%r14
   58d98:      	pushq	%r12
   58d9a:      	pushq	%rbx
   58d9b:      	subq	$0x930, %rsp            # imm = 0x930
   58da2:      	movq	%rsi, %r14
   58da5:      	movq	%rdi, %rbx
   58da8:      	xorps	%xmm0, %xmm0
   58dab:      	movaps	%xmm0, -0x30(%rbp)
   58daf:      	movaps	%xmm0, -0x40(%rbp)
   58db3:      	leaq	-0x40(%rbp), %r15
   58db7:      	movl	$0x20, %esi
   58dbc:      	movq	%r15, %rdi
   58dbf:      	callq	0x78ac0 <toyos_abi::syscall::random>
   58dc4:      	cmpq	$-0x1, %rax
   58dc8:      	je	0x58dd4 <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<sshserver::OsRandom>+0x44>
   58dca:      	movw	$0x701, (%rbx)          # imm = 0x701
   58dcf:      	jmp	0x58f1c <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<sshserver::OsRandom>+0x18c>
   58dd4:      	movq	%r14, -0x510(%rbp)
   58ddb:      	movq	$0x4a0, -0x508(%rbp)    # imm = 0x4A0
   58de6:      	leaq	-0xb0(%rbp), %r12
   58ded:      	leaq	-0x510(%rbp), %rsi
   58df4:      	movl	$0x1, %edx
   58df9:      	movq	%r12, %rdi
   58dfc:      	callq	0x9d090 <toyos_crypto::keccak::h>
   58e01:      	movq	%r15, -0x950(%rbp)
   58e08:      	movq	$0x20, -0x948(%rbp)
   58e13:      	movq	%r12, -0x940(%rbp)
   58e1a:      	movq	$0x20, -0x938(%rbp)
   58e25:      	leaq	-0x510(%rbp), %rdi
   58e2c:      	leaq	-0x950(%rbp), %rsi
   58e33:      	movl	$0x2, %edx
   58e38:      	callq	0x9ce70 <toyos_crypto::keccak::g>
   58e3d:      	movups	-0x510(%rbp), %xmm0
   58e44:      	movups	-0x500(%rbp), %xmm1
   58e4b:      	movups	-0x4f0(%rbp), %xmm2
   58e52:      	movups	-0x4e0(%rbp), %xmm3
   58e59:      	movaps	%xmm3, -0x60(%rbp)
   58e5d:      	movaps	%xmm2, -0x70(%rbp)
   58e61:      	movaps	%xmm1, -0x80(%rbp)
   58e65:      	movaps	%xmm0, -0x90(%rbp)
   58e6c:      	leaq	-0x70(%rbp), %r15
   58e70:      	leaq	-0x950(%rbp), %rdi
   58e77:      	leaq	-0x40(%rbp), %rdx
   58e7b:      	movq	%r14, %rsi
   58e7e:      	movq	%r15, %rcx
   58e81:      	callq	0x91240 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>
   58e86:      	movaps	-0x90(%rbp), %xmm0
   58e8d:      	movaps	-0x80(%rbp), %xmm1
   58e91:      	movups	%xmm1, -0xc0(%rbp)
   58e98:      	movups	%xmm0, -0xd0(%rbp)
   58e9f:      	leaq	-0x510(%rbp), %r14
   58ea6:      	leaq	-0x950(%rbp), %rsi
   58ead:      	movl	$0x440, %edx            # imm = 0x440
   58eb2:      	movq	%r14, %rdi
   58eb5:      	callq	0x10fcc0 <memcpy>
   58eba:      	leaq	0x1(%rbx), %rdi
   58ebe:      	movl	$0x460, %edx            # imm = 0x460
   58ec3:      	movq	%r14, %rsi
   58ec6:      	callq	0x10fcc0 <memcpy>
   58ecb:      	movb	$0x0, (%rbx)
   58ece:      	xorps	%xmm0, %xmm0
   58ed1:      	movaps	%xmm0, -0x510(%rbp)
   58ed8:      	movaps	-0x510(%rbp), %xmm1
   58edf:      	movaps	%xmm1, -0x90(%rbp)
   58ee6:      	movaps	%xmm0, -0x510(%rbp)
   58eed:      	movaps	-0x510(%rbp), %xmm1
   58ef4:      	movaps	%xmm1, -0x80(%rbp)
   58ef8:      	movaps	%xmm0, -0x510(%rbp)
   58eff:      	movaps	-0x510(%rbp), %xmm1
   58f06:      	movups	%xmm1, (%r15)
   58f0a:      	movaps	%xmm0, -0x510(%rbp)
   58f11:      	movaps	-0x510(%rbp), %xmm0
   58f18:      	movaps	%xmm0, -0x60(%rbp)
   58f1c:      	xorps	%xmm0, %xmm0
   58f1f:      	movaps	%xmm0, -0x510(%rbp)
   58f26:      	movaps	-0x510(%rbp), %xmm1
   58f2d:      	movaps	%xmm1, -0x40(%rbp)
   58f31:      	movaps	%xmm0, -0x510(%rbp)
   58f38:      	movaps	-0x510(%rbp), %xmm0
   58f3f:      	movaps	%xmm0, -0x30(%rbp)
   58f43:      	movq	%rbx, %rax
   58f46:      	addq	$0x930, %rsp            # imm = 0x930
   58f4d:      	popq	%rbx
   58f4e:      	popq	%r12
   58f50:      	popq	%r14
   58f52:      	popq	%r15
   58f54:      	popq	%rbp
   58f55:      	retq
   58f56:      	xorps	%xmm0, %xmm0
   58f59:      	movaps	%xmm0, -0x510(%rbp)
   58f60:      	movaps	-0x510(%rbp), %xmm1
   58f67:      	movaps	%xmm1, -0x90(%rbp)
   58f6e:      	movaps	%xmm0, -0x510(%rbp)
   58f75:      	movaps	-0x510(%rbp), %xmm1
   58f7c:      	movaps	%xmm1, -0x80(%rbp)
   58f80:      	movaps	%xmm0, -0x510(%rbp)
   58f87:      	movaps	-0x510(%rbp), %xmm1
   58f8e:      	movups	%xmm1, (%r15)
   58f92:      	movaps	%xmm0, -0x510(%rbp)
   58f99:      	movaps	-0x510(%rbp), %xmm0
   58fa0:      	movaps	%xmm0, -0x60(%rbp)
   58fa4:      	jmp	0x58fa6 <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<sshserver::OsRandom>+0x216>
   58fa6:      	xorps	%xmm0, %xmm0
   58fa9:      	movaps	%xmm0, -0x50(%rbp)
   58fad:      	movaps	-0x50(%rbp), %xmm1
   58fb1:      	movaps	%xmm1, -0x40(%rbp)
   58fb5:      	movaps	%xmm0, -0x50(%rbp)
   58fb9:      	movaps	-0x50(%rbp), %xmm0
   58fbd:      	movaps	%xmm0, -0x30(%rbp)
   58fc1:      	movq	%rax, %rdi
   58fc4:      	callq	0x105eb0 <_Unwind_Resume>
   58fc9:      	int3
   58fca:      	int3
   58fcb:      	int3
   58fcc:      	int3
   58fcd:      	int3
   58fce:      	int3
   58fcf:      	int3

0000000000090e50 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>:
   90e50:      	pushq	%rbp
   90e51:      	movq	%rsp, %rbp
   90e54:      	movq	0x10(%rdi), %rax
   90e58:      	cmpq	0x8(%rdi), %rax
   90e5c:      	ja	0x90ed5 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x85>
   90e5e:      	testq	%rax, %rax
   90e61:      	je	0x90ed3 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x83>
   90e63:      	movq	(%rdi), %rcx
   90e66:      	addq	$0xe, %rcx
   90e6a:      	xorl	%edx, %edx
   90e6c:      	nopl	(%rax)
   90e70:      	xorl	%esi, %esi
   90e72:      	nopw	%cs:(%rax,%rax)
   90e80:      	movw	$0x0, -0xe(%rcx,%rsi)
   90e87:      	movw	$0x0, -0xc(%rcx,%rsi)
   90e8e:      	movw	$0x0, -0xa(%rcx,%rsi)
   90e95:      	movw	$0x0, -0x8(%rcx,%rsi)
   90e9c:      	movw	$0x0, -0x6(%rcx,%rsi)
   90ea3:      	movw	$0x0, -0x4(%rcx,%rsi)
   90eaa:      	movw	$0x0, -0x2(%rcx,%rsi)
   90eb1:      	movw	$0x0, (%rcx,%rsi)
   90eb7:      	addq	$0x10, %rsi
   90ebb:      	cmpq	$0x200, %rsi            # imm = 0x200
   90ec2:      	jne	0x90e80 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x30>
   90ec4:      	incq	%rdx
   90ec7:      	addq	$0x200, %rcx            # imm = 0x200
   90ece:      	cmpq	%rax, %rdx
   90ed1:      	jne	0x90e70 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x20>
   90ed3:      	popq	%rbp
   90ed4:      	retq
   90ed5:      	leaq	-0x72ed8(%rip), %rdi    # 0x1e004 <toyos_crypto::ed25519::B_ODD+0x108c>
   90edc:      	leaq	0x82bad(%rip), %rcx     # 0x113a90 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x298>
   90ee3:      	movl	$0x1b5, %esi            # imm = 0x1B5
   90ee8:      	xorl	%edx, %edx
   90eea:      	callq	0x10b0e0 <core::panicking::panic_nounwind_fmt>
   90eef:      	int3

0000000000090ef0 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes>:
   90ef0:      	pushq	%rbp
   90ef1:      	movq	%rsp, %rbp
   90ef4:      	pushq	%r15
   90ef6:      	pushq	%r14
   90ef8:      	pushq	%r13
   90efa:      	pushq	%r12
   90efc:      	pushq	%rbx
   90efd:      	subq	$0x408, %rsp            # imm = 0x408
   90f04:      	movq	%rdi, %rbx
   90f07:      	cmpq	$0x4a0, %rdx            # imm = 0x4A0
   90f0e:      	jne	0x911af <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2bf>
   90f14:      	movq	%rsi, %r14
   90f17:      	xorl	%r13d, %r13d
   90f1a:      	leaq	-0x428(%rbp), %r15
   90f21:      	leaq	(%r14,%r13), %r12
   90f25:      	movl	$0x200, %edx            # imm = 0x200
   90f2a:      	movq	%r15, %rdi
   90f2d:      	xorl	%esi, %esi
   90f2f:      	callq	0x1101f0 <memset>
   90f34:      	xorl	%eax, %eax
   90f36:      	movq	%r15, %rdx
   90f39:      	nopl	(%rax)
   90f40:      	movq	%rax, %rcx
   90f43:      	shrq	$0x3, %rcx
   90f47:      	movzbl	(%r12,%rcx), %r9d
   90f4c:      	movl	%eax, %ecx
   90f4e:      	andb	$0x4, %cl
   90f51:      	movzbl	%cl, %esi
   90f54:      	xorl	%r8d, %r8d
   90f57:      	btl	%esi, %r9d
   90f5b:      	setb	%r8b
   90f5f:      	leal	0x1(%rsi), %ecx
   90f62:      	movl	%r9d, %r10d
   90f65:      	shrl	%cl, %r10d
   90f68:      	orw	(%rdx), %r8w
   90f6c:      	leal	0x2(%rsi), %ecx
   90f6f:      	movl	%r9d, %edi
   90f72:      	shrl	%cl, %edi
   90f74:      	addl	%r10d, %r10d
   90f77:      	andl	$0x2, %r10d
   90f7b:      	shll	$0x2, %edi
   90f7e:      	leal	0x3(%rsi), %ecx
   90f81:      	shrl	%cl, %r9d
   90f84:      	andl	$0x4, %edi
   90f87:      	orl	%r10d, %edi
   90f8a:      	shll	$0x3, %r9d
   90f8e:      	leaq	0x4(%rax), %rcx
   90f92:      	movq	%rcx, %r10
   90f95:      	shrq	$0x3, %r10
   90f99:      	movzbl	(%r12,%r10), %r10d
   90f9e:      	andb	$0x4, %cl
   90fa1:      	shrl	%cl, %r10d
   90fa4:      	andl	$0x8, %r9d
   90fa8:      	orl	%edi, %r9d
   90fab:      	shll	$0x4, %r10d
   90faf:      	leaq	0x5(%rax), %rcx
   90fb3:      	movq	%rcx, %rdi
   90fb6:      	shrq	$0x3, %rdi
   90fba:      	movzbl	(%r12,%rdi), %edi
   90fbf:      	andb	$0x5, %cl
   90fc2:      	shrl	%cl, %edi
   90fc4:      	andl	$0x10, %r10d
   90fc8:      	orl	%r9d, %r10d
   90fcb:      	shll	$0x5, %edi
   90fce:      	andl	$0x20, %edi
   90fd1:      	orl	%r10d, %edi
   90fd4:      	orl	%r8d, %edi
   90fd7:      	leaq	0x6(%rax), %rcx
   90fdb:      	movq	%rcx, %r8
   90fde:      	shrq	$0x3, %r8
   90fe2:      	movzbl	(%r12,%r8), %r8d
   90fe7:      	andb	$0x6, %cl
   90fea:      	shrl	%cl, %r8d
   90fed:      	leaq	0x7(%rax), %rcx
   90ff1:      	movq	%rcx, %r9
   90ff4:      	shrq	$0x3, %r9
   90ff8:      	movzbl	(%r12,%r9), %r9d
   90ffd:      	andb	$0x7, %cl
   91000:      	shrb	%cl, %r9b
   91003:      	shll	$0x6, %r8d
   91007:      	andl	$0x40, %r8d
   9100b:      	shlb	$0x7, %r9b
   9100f:      	movzbl	%r9b, %ecx
   91013:      	orl	%r8d, %ecx
   91016:      	leaq	0x8(%rax), %r8
   9101a:      	shrq	$0x3, %r8
   9101e:      	movzbl	(%r12,%r8), %r8d
   91023:      	xorl	%r9d, %r9d
   91026:      	btl	%esi, %r8d
   9102a:      	setb	%r9b
   9102e:      	shll	$0x8, %r9d
   91032:      	orl	%ecx, %r9d
   91035:      	leaq	0x9(%rax), %rcx
   91039:      	movq	%rcx, %rsi
   9103c:      	shrq	$0x3, %rsi
   91040:      	movzbl	(%r12,%rsi), %esi
   91045:      	andl	$0x5, %ecx
   91048:      	xorl	%r8d, %r8d
   9104b:      	btl	%ecx, %esi
   9104e:      	setb	%r8b
   91052:      	shll	$0x9, %r8d
   91056:      	orl	%r9d, %r8d
   91059:      	leaq	0xa(%rax), %rcx
   9105d:      	movq	%rcx, %rsi
   91060:      	shrq	$0x3, %rsi
   91064:      	movzbl	(%r12,%rsi), %esi
   91069:      	andl	$0x6, %ecx
   9106c:      	xorl	%r9d, %r9d
   9106f:      	btl	%ecx, %esi
   91072:      	setb	%r9b
   91076:      	shll	$0xa, %r9d
   9107a:      	orl	%r8d, %r9d
   9107d:      	orl	%edi, %r9d
   91080:      	leaq	0xb(%rax), %rcx
   91084:      	movq	%rcx, %rsi
   91087:      	shrq	$0x3, %rsi
   9108b:      	movzbl	(%r12,%rsi), %esi
   91090:      	andl	$0x7, %ecx
   91093:      	xorl	%edi, %edi
   91095:      	btl	%ecx, %esi
   91098:      	setb	%dil
   9109c:      	shll	$0xb, %edi
   9109f:      	orl	%r9d, %edi
   910a2:      	movw	%di, (%rdx)
   910a5:      	addq	$0x2, %rdx
   910a9:      	addq	$0xc, %rax
   910ad:      	cmpq	$0xc00, %rax            # imm = 0xC00
   910b3:      	jne	0x90f40 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x50>
   910b9:      	addq	$0x180, %r13            # imm = 0x180
   910c0:      	movl	$0x200, %edx            # imm = 0x200
   910c5:      	leaq	-0x228(%rbp), %rdi
   910cc:      	movq	%r15, %rsi
   910cf:      	callq	0x10fcc0 <memcpy>
   910d4:      	xorl	%eax, %eax
   910d6:      	nopw	%cs:(%rax,%rax)
   910e0:      	cmpq	$0x200, %rax            # imm = 0x200
   910e6:      	je	0x9112d <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x23d>
   910e8:      	cmpw	$0xd00, -0x228(%rbp,%rax) # imm = 0xD00
   910f2:      	ja	0x911b6 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2c6>
   910f8:      	cmpw	$0xd00, -0x226(%rbp,%rax) # imm = 0xD00
   91102:      	ja	0x911b6 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2c6>
   91108:      	cmpw	$0xd00, -0x224(%rbp,%rax) # imm = 0xD00
   91112:      	ja	0x911b6 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2c6>
   91118:      	cmpw	$0xd00, -0x222(%rbp,%rax) # imm = 0xD00
   91122:      	leaq	0x8(%rax), %rax
   91126:      	jbe	0x910e0 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x1f0>
   91128:      	jmp	0x911b6 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2c6>
   9112d:      	xorl	%eax, %eax
   9112f:      	nop
   91130:      	movw	$0x0, -0x228(%rbp,%rax)
   9113a:      	movw	$0x0, -0x226(%rbp,%rax)
   91144:      	movw	$0x0, -0x224(%rbp,%rax)
   9114e:      	movw	$0x0, -0x222(%rbp,%rax)
   91158:      	movw	$0x0, -0x220(%rbp,%rax)
   91162:      	movw	$0x0, -0x21e(%rbp,%rax)
   9116c:      	movw	$0x0, -0x21c(%rbp,%rax)
   91176:      	movw	$0x0, -0x21a(%rbp,%rax)
   91180:      	addq	$0x10, %rax
   91184:      	cmpq	$0x200, %rax            # imm = 0x200
   9118a:      	jne	0x91130 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x240>
   9118c:      	cmpq	$0x480, %r13            # imm = 0x480
   91193:      	jne	0x90f21 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x31>
   91199:      	leaq	0x1(%rbx), %rdi
   9119d:      	movl	$0x4a0, %edx            # imm = 0x4A0
   911a2:      	movq	%r14, %rsi
   911a5:      	callq	0x10fcc0 <memcpy>
   911aa:      	movb	$0x0, (%rbx)
   911ad:      	jmp	0x9121c <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x32c>
   911af:      	movw	$0x1, (%rbx)
   911b4:      	jmp	0x9121c <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x32c>
   911b6:      	movw	$0x201, (%rbx)          # imm = 0x201
   911bb:      	xorl	%eax, %eax
   911bd:      	nopl	(%rax)
   911c0:      	movw	$0x0, -0x228(%rbp,%rax)
   911ca:      	movw	$0x0, -0x226(%rbp,%rax)
   911d4:      	movw	$0x0, -0x224(%rbp,%rax)
   911de:      	movw	$0x0, -0x222(%rbp,%rax)
   911e8:      	movw	$0x0, -0x220(%rbp,%rax)
   911f2:      	movw	$0x0, -0x21e(%rbp,%rax)
   911fc:      	movw	$0x0, -0x21c(%rbp,%rax)
   91206:      	movw	$0x0, -0x21a(%rbp,%rax)
   91210:      	addq	$0x10, %rax
   91214:      	cmpq	$0x200, %rax            # imm = 0x200
   9121a:      	jne	0x911c0 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2d0>
   9121c:      	movq	%rbx, %rax
   9121f:      	addq	$0x408, %rsp            # imm = 0x408
   91226:      	popq	%rbx
   91227:      	popq	%r12
   91229:      	popq	%r13
   9122b:      	popq	%r14
   9122d:      	popq	%r15
   9122f:      	popq	%rbp
   91230:      	retq
   91231:      	int3
   91232:      	int3
   91233:      	int3
   91234:      	int3
   91235:      	int3
   91236:      	int3
   91237:      	int3
   91238:      	int3
   91239:      	int3
   9123a:      	int3
   9123b:      	int3
   9123c:      	int3
   9123d:      	int3
   9123e:      	int3
   9123f:      	int3

0000000000091240 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>:
   91240:      	pushq	%rbp
   91241:      	movq	%rsp, %rbp
   91244:      	pushq	%r15
   91246:      	pushq	%r14
   91248:      	pushq	%r13
   9124a:      	pushq	%r12
   9124c:      	pushq	%rbx
   9124d:      	subq	$0x1000, %rsp           # imm = 0x1000
   91254:      	movq	$0x0, (%rsp)
   9125c:      	subq	$0xa38, %rsp            # imm = 0xA38
   91263:      	movq	%rdx, -0x58(%rbp)
   91267:      	movq	%rsi, -0x48(%rbp)
   9126b:      	movq	%rdi, %r15
   9126e:      	leaq	-0x1a60(%rbp), %rax
   91275:      	movq	%rax, -0x860(%rbp)
   9127c:      	movq	$0x3, -0x858(%rbp)
   91287:      	xorl	%r14d, %r14d
   9128a:      	leaq	-0x1060(%rbp), %rdi
   91291:      	movq	%rcx, -0x38(%rbp)
   91295:      	movq	%rcx, %rsi
   91298:      	xorl	%edx, %edx
   9129a:      	callq	0x93a30 <toyos_crypto::mlkem::noise>
   9129f:      	xorl	%r14d, %r14d
   912a2:      	leaq	-0x660(%rbp), %rdi
   912a9:      	leaq	-0x1060(%rbp), %rsi
   912b0:      	callq	0x92ef0 <<toyos_crypto::mlkem::Poly>::ntt>
   912b5:      	leaq	-0x260(%rbp), %rbx
   912bc:      	leaq	-0x660(%rbp), %rsi
   912c3:      	movl	$0x200, %edx            # imm = 0x200
   912c8:      	movq	%rbx, %rdi
   912cb:      	callq	0x10fcc0 <memcpy>
   912d0:      	leaq	-0xa60(%rbp), %r14
   912d7:      	movl	$0x200, %edx            # imm = 0x200
   912dc:      	movq	%r14, %rdi
   912df:      	movq	%rbx, %rsi
   912e2:      	callq	0x10fcc0 <memcpy>
   912e7:      	leaq	-0x460(%rbp), %rbx
   912ee:      	movl	$0x200, %edx            # imm = 0x200
   912f3:      	movq	%rbx, %rdi
   912f6:      	movq	%r14, %rsi
   912f9:      	callq	0x10fcc0 <memcpy>
   912fe:      	leaq	-0x1a60(%rbp), %rdi
   91305:      	movl	$0x200, %edx            # imm = 0x200
   9130a:      	movq	%rbx, %rsi
   9130d:      	callq	0x10fcc0 <memcpy>
   91312:      	movl	$0x1, %r14d
   91318:      	leaq	-0x1060(%rbp), %rdi
   9131f:      	movq	-0x38(%rbp), %rsi
   91323:      	movl	$0x1, %edx
   91328:      	callq	0x93a30 <toyos_crypto::mlkem::noise>
   9132d:      	leaq	-0x660(%rbp), %rdi
   91334:      	leaq	-0x1060(%rbp), %rsi
   9133b:      	callq	0x92ef0 <<toyos_crypto::mlkem::Poly>::ntt>
   91340:      	leaq	-0x260(%rbp), %rbx
   91347:      	leaq	-0x660(%rbp), %rsi
   9134e:      	movl	$0x200, %edx            # imm = 0x200
   91353:      	movq	%rbx, %rdi
   91356:      	callq	0x10fcc0 <memcpy>
   9135b:      	leaq	-0xa60(%rbp), %r14
   91362:      	movl	$0x200, %edx            # imm = 0x200
   91367:      	movq	%r14, %rdi
   9136a:      	movq	%rbx, %rsi
   9136d:      	callq	0x10fcc0 <memcpy>
   91372:      	leaq	-0x460(%rbp), %rbx
   91379:      	movl	$0x200, %edx            # imm = 0x200
   9137e:      	movq	%rbx, %rdi
   91381:      	movq	%r14, %rsi
   91384:      	callq	0x10fcc0 <memcpy>
   91389:      	leaq	-0x1860(%rbp), %rdi
   91390:      	movl	$0x200, %edx            # imm = 0x200
   91395:      	movq	%rbx, %rsi
   91398:      	callq	0x10fcc0 <memcpy>
   9139d:      	movl	$0x2, %r14d
   913a3:      	leaq	-0x1060(%rbp), %rdi
   913aa:      	movq	-0x38(%rbp), %rsi
   913ae:      	movl	$0x2, %edx
   913b3:      	callq	0x93a30 <toyos_crypto::mlkem::noise>
   913b8:      	leaq	-0x660(%rbp), %rdi
   913bf:      	leaq	-0x1060(%rbp), %rsi
   913c6:      	callq	0x92ef0 <<toyos_crypto::mlkem::Poly>::ntt>
   913cb:      	movq	%r15, -0x50(%rbp)
   913cf:      	movq	-0x48(%rbp), %rax
   913d3:      	addq	$0x480, %rax            # imm = 0x480
   913d9:      	movq	%rax, -0x40(%rbp)
   913dd:      	leaq	-0x260(%rbp), %rbx
   913e4:      	leaq	-0x660(%rbp), %rsi
   913eb:      	movl	$0x200, %edx            # imm = 0x200
   913f0:      	movq	%rbx, %rdi
   913f3:      	callq	0x10fcc0 <memcpy>
   913f8:      	leaq	-0xa60(%rbp), %r14
   913ff:      	movl	$0x200, %edx            # imm = 0x200
   91404:      	movq	%r14, %rdi
   91407:      	movq	%rbx, %rsi
   9140a:      	callq	0x10fcc0 <memcpy>
   9140f:      	leaq	-0x460(%rbp), %r12
   91416:      	movl	$0x200, %edx            # imm = 0x200
   9141b:      	movq	%r12, %rdi
   9141e:      	movq	%r14, %rsi
   91421:      	callq	0x10fcc0 <memcpy>
   91426:      	leaq	-0x1660(%rbp), %rdi
   9142d:      	movl	$0x200, %edx            # imm = 0x200
   91432:      	movq	%r12, %rsi
   91435:      	callq	0x10fcc0 <memcpy>
   9143a:      	leaq	-0x1060(%rbp), %rdi
   91441:      	leaq	-0x1a60(%rbp), %rsi
   91448:      	movl	$0x600, %edx            # imm = 0x600
   9144d:      	callq	0x10fcc0 <memcpy>
   91452:      	leaq	-0x1a60(%rbp), %rdi
   91459:      	xorl	%r14d, %r14d
   9145c:      	movl	$0x440, %edx            # imm = 0x440
   91461:      	xorl	%esi, %esi
   91463:      	callq	0x1101f0 <memset>
   91468:      	movl	$0x9d7dbb41, %ebx       # imm = 0x9D7DBB41
   9146d:      	nopl	(%rax)
   91470:      	movq	%r14, -0x30(%rbp)
   91474:      	leaq	0x1(%r14), %rax
   91478:      	movq	%rax, -0x60(%rbp)
   9147c:      	movl	$0x200, %edx            # imm = 0x200
   91481:      	leaq	-0x860(%rbp), %rdi
   91488:      	xorl	%esi, %esi
   9148a:      	callq	0x1101f0 <memset>
   9148f:      	xorl	%r15d, %r15d
   91492:      	xorl	%r13d, %r13d
   91495:      	nopw	%cs:(%rax,%rax)
   914a0:      	leaq	-0x660(%rbp), %rdi
   914a7:      	movq	-0x40(%rbp), %rsi
   914ab:      	movq	%r15, %rdx
   914ae:      	movq	-0x30(%rbp), %rcx
   914b2:      	callq	0x93fc0 <toyos_crypto::mlkem::sample>
   914b7:      	leaq	-0x1060(,%r13), %r14
   914bf:      	addq	%rbp, %r14
   914c2:      	addq	$0x200, %r13            # imm = 0x200
   914c9:      	incq	%r15
   914cc:      	movl	$0x200, %edx            # imm = 0x200
   914d1:      	movq	%r12, %rdi
   914d4:      	xorl	%esi, %esi
   914d6:      	callq	0x1101f0 <memset>
   914db:      	xorl	%eax, %eax
   914dd:      	jmp	0x91608 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3c8>
   914e2:      	nopw	%cs:(%rax,%rax)
   914f0:      	movzwl	-0x660(%rbp,%rax,4), %edi
   914f8:      	movzwl	(%r14,%rax,4), %edx
   914fd:      	movl	%edx, %r9d
   91500:      	imull	%edi, %r9d
   91504:      	imulq	$0x3afb7681, %r9, %rsi  # imm = 0x3AFB7681
   9150b:      	shrq	$0x20, %rsi
   9150f:      	movl	%r9d, %r8d
   91512:      	subl	%esi, %r8d
   91515:      	shrl	%r8d
   91518:      	addl	%esi, %r8d
   9151b:      	shrl	$0xb, %r8d
   9151f:      	imull	$0xd01, %r8d, %esi      # imm = 0xD01
   91526:      	subl	%esi, %r9d
   91529:      	movzwl	-0x65e(%rbp,%rax,4), %r8d
   91532:      	movzwl	0x2(%r14,%rax,4), %esi
   91538:      	movl	%esi, %r10d
   9153b:      	imull	%r8d, %r10d
   9153f:      	imulq	$0x3afb7681, %r10, %r11 # imm = 0x3AFB7681
   91546:      	shrq	$0x20, %r11
   9154a:      	movl	%r10d, %r12d
   9154d:      	subl	%r11d, %r12d
   91550:      	shrl	%r12d
   91553:      	addl	%r11d, %r12d
   91556:      	shrl	$0xb, %r12d
   9155a:      	imull	$0xd01, %r12d, %r11d    # imm = 0xD01
   91561:      	subl	%r11d, %r10d
   91564:      	movzwl	%cx, %ecx
   91567:      	imull	%r10d, %ecx
   9156b:      	imulq	$0x13afb769, %rcx, %r10 # imm = 0x13AFB769
   91572:      	shrq	$0x28, %r10
   91576:      	imull	$0xd01, %r10d, %r10d    # imm = 0xD01
   9157d:      	subl	%r10d, %ecx
   91580:      	addl	%r9d, %ecx
   91583:      	leal	-0xd01(%rcx), %r9d
   9158a:      	cmpl	$0xd01, %ecx            # imm = 0xD01
   91590:      	cmovbl	%ecx, %r9d
   91594:      	movw	%r9w, -0x460(%rbp,%rax,4)
   9159d:      	imull	%edi, %esi
   915a0:      	imulq	$0x3afb7681, %rsi, %rcx # imm = 0x3AFB7681
   915a7:      	shrq	$0x20, %rcx
   915ab:      	movl	%esi, %edi
   915ad:      	subl	%ecx, %edi
   915af:      	shrl	%edi
   915b1:      	addl	%ecx, %edi
   915b3:      	shrl	$0xb, %edi
   915b6:      	imull	$0xd01, %edi, %ecx      # imm = 0xD01
   915bc:      	subl	%ecx, %esi
   915be:      	imull	%r8d, %edx
   915c2:      	imulq	$0x3afb7681, %rdx, %rcx # imm = 0x3AFB7681
   915c9:      	shrq	$0x20, %rcx
   915cd:      	movl	%edx, %edi
   915cf:      	subl	%ecx, %edi
   915d1:      	shrl	%edi
   915d3:      	addl	%ecx, %edi
   915d5:      	shrl	$0xb, %edi
   915d8:      	imull	$0xd01, %edi, %ecx      # imm = 0xD01
   915de:      	subl	%ecx, %edx
   915e0:      	addl	%esi, %edx
   915e2:      	leal	-0xd01(%rdx), %ecx
   915e8:      	cmpl	$0xd01, %edx            # imm = 0xD01
   915ee:      	cmovbl	%edx, %ecx
   915f1:      	movw	%cx, -0x45e(%rbp,%rax,4)
   915f9:      	incq	%rax
   915fc:      	cmpq	$0x80, %rax
   91602:      	je	0x916a0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x460>
   91608:      	movl	%eax, %ecx
   9160a:      	rolb	$0x4, %cl
   9160d:      	orb	$0x8, %cl
   91610:      	movl	%ecx, %edx
   91612:      	andb	$0x33, %dl
   91615:      	shlb	$0x2, %dl
   91618:      	shrb	$0x2, %cl
   9161b:      	andb	$0x33, %cl
   9161e:      	orb	%dl, %cl
   91620:      	movl	%ecx, %edx
   91622:      	andb	$0x55, %dl
   91625:      	addb	%dl, %dl
   91627:      	shrb	%cl
   91629:      	andb	$0x55, %cl
   9162c:      	orb	%dl, %cl
   9162e:      	movzbl	%cl, %edx
   91631:      	movw	$0x1, %cx
   91635:      	movw	$0x11, %si
   91639:      	jmp	0x9165e <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x41e>
   9163b:      	nopl	(%rax,%rax)
   91640:      	imull	%esi, %esi
   91643:      	movq	%rsi, %rdi
   91646:      	imulq	%rbx, %rdi
   9164a:      	shrq	$0x2b, %rdi
   9164e:      	imull	$0xd01, %edi, %edi      # imm = 0xD01
   91654:      	subl	%edi, %esi
   91656:      	shrl	%edx
   91658:      	je	0x914f0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x2b0>
   9165e:      	movzwl	%si, %esi
   91661:      	testb	$0x1, %dl
   91664:      	je	0x91640 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x400>
   91666:      	movzwl	%cx, %ecx
   91669:      	imull	%esi, %ecx
   9166c:      	imulq	$0x3afb7681, %rcx, %rdi # imm = 0x3AFB7681
   91673:      	shrq	$0x20, %rdi
   91677:      	movl	%ecx, %r8d
   9167a:      	subl	%edi, %r8d
   9167d:      	shrl	%r8d
   91680:      	addl	%edi, %r8d
   91683:      	shrl	$0xb, %r8d
   91687:      	imull	$0xd01, %r8d, %edi      # imm = 0xD01
   9168e:      	subl	%edi, %ecx
   91690:      	jmp	0x91640 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x400>
   91692:      	nopw	%cs:(%rax,%rax)
   916a0:      	movl	$0x200, %edx            # imm = 0x200
   916a5:      	leaq	-0x260(%rbp), %rdi
   916ac:      	leaq	-0x460(%rbp), %r12
   916b3:      	movq	%r12, %rsi
   916b6:      	callq	0x10fcc0 <memcpy>
   916bb:      	xorl	%eax, %eax
   916bd:      	movdqa	-0x86bb5(%rip), %xmm4   # 0xab10 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x300>
   916c5:      	movdqa	-0x86a7d(%rip), %xmm5   # 0xac50 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x440>
   916cd:      	pxor	%xmm6, %xmm6
   916d1:      	nopw	%cs:(%rax,%rax)
   916e0:      	movdqu	-0x860(%rbp,%rax,2), %xmm2
   916e9:      	movdqu	-0x260(%rbp,%rax,2), %xmm0
   916f2:      	movdqa	%xmm2, %xmm3
   916f6:      	punpckhwd	%xmm6, %xmm3    # xmm3 = xmm3[4],xmm6[4],xmm3[5],xmm6[5],xmm3[6],xmm6[6],xmm3[7],xmm6[7]
   916fa:      	punpcklwd	%xmm6, %xmm2    # xmm2 = xmm2[0],xmm6[0],xmm2[1],xmm6[1],xmm2[2],xmm6[2],xmm2[3],xmm6[3]
   916fe:      	movdqa	%xmm0, %xmm1
   91702:      	punpckhwd	%xmm6, %xmm1    # xmm1 = xmm1[4],xmm6[4],xmm1[5],xmm6[5],xmm1[6],xmm6[6],xmm1[7],xmm6[7]
   91706:      	paddd	%xmm3, %xmm1
   9170a:      	punpcklwd	%xmm6, %xmm0    # xmm0 = xmm0[0],xmm6[0],xmm0[1],xmm6[1],xmm0[2],xmm6[2],xmm0[3],xmm6[3]
   9170e:      	paddd	%xmm2, %xmm0
   91712:      	movdqa	%xmm1, %xmm2
   91716:      	pmuludq	%xmm4, %xmm2
   9171a:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
   9171f:      	pshufd	$0xf5, %xmm1, %xmm3     # xmm3 = xmm1[1,1,3,3]
   91724:      	pmuludq	%xmm4, %xmm3
   91728:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   9172d:      	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
   91731:      	pmaddwd	%xmm5, %xmm2
   91735:      	psubd	%xmm2, %xmm1
   91739:      	movdqa	%xmm0, %xmm2
   9173d:      	pmuludq	%xmm4, %xmm2
   91741:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
   91746:      	pshufd	$0xf5, %xmm0, %xmm3     # xmm3 = xmm0[1,1,3,3]
   9174b:      	pmuludq	%xmm4, %xmm3
   9174f:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   91754:      	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
   91758:      	pmaddwd	%xmm5, %xmm2
   9175c:      	psubd	%xmm2, %xmm0
   91760:      	packssdw	%xmm1, %xmm0
   91764:      	movdqu	%xmm0, -0x460(%rbp,%rax,2)
   9176d:      	addq	$0x8, %rax
   91771:      	cmpq	$0x100, %rax            # imm = 0x100
   91777:      	jne	0x916e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4a0>
   9177d:      	movl	$0x200, %edx            # imm = 0x200
   91782:      	leaq	-0xa60(%rbp), %r14
   91789:      	movq	%r14, %rdi
   9178c:      	movq	%r12, %rsi
   9178f:      	callq	0x10fcc0 <memcpy>
   91794:      	movl	$0xe, %eax
   91799:      	nopl	(%rax)
   917a0:      	movw	$0x0, -0x86e(%rbp,%rax)
   917aa:      	movw	$0x0, -0x86c(%rbp,%rax)
   917b4:      	movw	$0x0, -0x86a(%rbp,%rax)
   917be:      	movw	$0x0, -0x868(%rbp,%rax)
   917c8:      	movw	$0x0, -0x866(%rbp,%rax)
   917d2:      	movw	$0x0, -0x864(%rbp,%rax)
   917dc:      	movw	$0x0, -0x862(%rbp,%rax)
   917e6:      	movw	$0x0, -0x860(%rbp,%rax)
   917f0:      	addq	$0x10, %rax
   917f4:      	cmpq	$0x20e, %rax            # imm = 0x20E
   917fa:      	jne	0x917a0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x560>
   917fc:      	movl	$0x200, %edx            # imm = 0x200
   91801:      	leaq	-0x860(%rbp), %rdi
   91808:      	movq	%r14, %rsi
   9180b:      	callq	0x10fcc0 <memcpy>
   91810:      	xorl	%eax, %eax
   91812:      	nopw	%cs:(%rax,%rax)
   91820:      	movw	$0x0, -0x260(%rbp,%rax)
   9182a:      	movw	$0x0, -0x25e(%rbp,%rax)
   91834:      	movw	$0x0, -0x25c(%rbp,%rax)
   9183e:      	movw	$0x0, -0x25a(%rbp,%rax)
   91848:      	movw	$0x0, -0x258(%rbp,%rax)
   91852:      	movw	$0x0, -0x256(%rbp,%rax)
   9185c:      	movw	$0x0, -0x254(%rbp,%rax)
   91866:      	movw	$0x0, -0x252(%rbp,%rax)
   91870:      	addq	$0x10, %rax
   91874:      	cmpq	$0x200, %rax            # imm = 0x200
   9187a:      	jne	0x91820 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5e0>
   9187c:      	xorl	%eax, %eax
   9187e:      	nop
   91880:      	movw	$0x0, -0x660(%rbp,%rax)
   9188a:      	movw	$0x0, -0x65e(%rbp,%rax)
   91894:      	movw	$0x0, -0x65c(%rbp,%rax)
   9189e:      	movw	$0x0, -0x65a(%rbp,%rax)
   918a8:      	movw	$0x0, -0x658(%rbp,%rax)
   918b2:      	movw	$0x0, -0x656(%rbp,%rax)
   918bc:      	movw	$0x0, -0x654(%rbp,%rax)
   918c6:      	movw	$0x0, -0x652(%rbp,%rax)
   918d0:      	addq	$0x10, %rax
   918d4:      	cmpq	$0x200, %rax            # imm = 0x200
   918da:      	jne	0x91880 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x640>
   918dc:      	cmpq	$0x600, %r13            # imm = 0x600
   918e3:      	jne	0x914a0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x260>
   918e9:      	movl	$0x200, %edx            # imm = 0x200
   918ee:      	movq	%r12, %rdi
   918f1:      	leaq	-0x860(%rbp), %rsi
   918f8:      	callq	0x10fcc0 <memcpy>
   918fd:      	leaq	-0x260(%rbp), %rdi
   91904:      	movq	%r12, %rsi
   91907:      	callq	0x936a0 <<toyos_crypto::mlkem::Poly>::inverse>
   9190c:      	movq	-0x30(%rbp), %r15
   91910:      	leal	0x3(%r15), %eax
   91914:      	movzbl	%al, %edx
   91917:      	leaq	-0x660(%rbp), %rdi
   9191e:      	movq	-0x38(%rbp), %rsi
   91922:      	callq	0x93a30 <toyos_crypto::mlkem::noise>
   91927:      	xorl	%eax, %eax
   91929:      	movdqa	-0x86e21(%rip), %xmm4   # 0xab10 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x300>
   91931:      	movdqa	-0x86ce9(%rip), %xmm5   # 0xac50 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x440>
   91939:      	pxor	%xmm6, %xmm6
   9193d:      	nopl	(%rax)
   91940:      	movdqu	-0x260(%rbp,%rax,2), %xmm2
   91949:      	movdqu	-0x660(%rbp,%rax,2), %xmm0
   91952:      	movdqa	%xmm2, %xmm3
   91956:      	punpckhwd	%xmm6, %xmm3    # xmm3 = xmm3[4],xmm6[4],xmm3[5],xmm6[5],xmm3[6],xmm6[6],xmm3[7],xmm6[7]
   9195a:      	punpcklwd	%xmm6, %xmm2    # xmm2 = xmm2[0],xmm6[0],xmm2[1],xmm6[1],xmm2[2],xmm6[2],xmm2[3],xmm6[3]
   9195e:      	movdqa	%xmm0, %xmm1
   91962:      	punpckhwd	%xmm6, %xmm1    # xmm1 = xmm1[4],xmm6[4],xmm1[5],xmm6[5],xmm1[6],xmm6[6],xmm1[7],xmm6[7]
   91966:      	paddd	%xmm3, %xmm1
   9196a:      	punpcklwd	%xmm6, %xmm0    # xmm0 = xmm0[0],xmm6[0],xmm0[1],xmm6[1],xmm0[2],xmm6[2],xmm0[3],xmm6[3]
   9196e:      	paddd	%xmm2, %xmm0
   91972:      	movdqa	%xmm1, %xmm2
   91976:      	pmuludq	%xmm4, %xmm2
   9197a:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
   9197f:      	pshufd	$0xf5, %xmm1, %xmm3     # xmm3 = xmm1[1,1,3,3]
   91984:      	pmuludq	%xmm4, %xmm3
   91988:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   9198d:      	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
   91991:      	pmaddwd	%xmm5, %xmm2
   91995:      	psubd	%xmm2, %xmm1
   91999:      	movdqa	%xmm0, %xmm2
   9199d:      	pmuludq	%xmm4, %xmm2
   919a1:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
   919a6:      	pshufd	$0xf5, %xmm0, %xmm3     # xmm3 = xmm0[1,1,3,3]
   919ab:      	pmuludq	%xmm4, %xmm3
   919af:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   919b4:      	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
   919b8:      	pmaddwd	%xmm5, %xmm2
   919bc:      	psubd	%xmm2, %xmm0
   919c0:      	packssdw	%xmm1, %xmm0
   919c4:      	movdqu	%xmm0, -0x460(%rbp,%rax,2)
   919cd:      	addq	$0x8, %rax
   919d1:      	cmpq	$0x100, %rax            # imm = 0x100
   919d7:      	jne	0x91940 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x700>
   919dd:      	movl	$0x200, %edx            # imm = 0x200
   919e2:      	movq	%r14, %rdi
   919e5:      	movq	%r12, %rsi
   919e8:      	callq	0x10fcc0 <memcpy>
   919ed:      	pxor	%xmm4, %xmm4
   919f1:      	xorl	%eax, %eax
   919f3:      	movdqa	-0x870ab(%rip), %xmm3   # 0xa950 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x140>
   919fb:      	movdqa	-0x87193(%rip), %xmm5   # 0xa870 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x60>
   91a03:      	movdqa	-0x8703b(%rip), %xmm6   # 0xa9d0 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x1c0>
   91a0b:      	nopl	(%rax,%rax)
   91a10:      	movdqu	-0xa60(%rbp,%rax,2), %xmm0
   91a19:      	movdqa	%xmm0, %xmm1
   91a1d:      	punpcklwd	%xmm4, %xmm1    # xmm1 = xmm1[0],xmm4[0],xmm1[1],xmm4[1],xmm1[2],xmm4[2],xmm1[3],xmm4[3]
   91a21:      	punpckhwd	%xmm4, %xmm0    # xmm0 = xmm0[4],xmm4[4],xmm0[5],xmm4[5],xmm0[6],xmm4[6],xmm0[7],xmm4[7]
   91a25:      	pslld	$0xa, %xmm0
   91a2a:      	pslld	$0xa, %xmm1
   91a2f:      	paddd	%xmm3, %xmm1
   91a33:      	paddd	%xmm3, %xmm0
   91a37:      	pshufd	$0xf5, %xmm0, %xmm2     # xmm2 = xmm0[1,1,3,3]
   91a3c:      	pmuludq	%xmm5, %xmm0
   91a40:      	pshufd	$0xed, %xmm0, %xmm0     # xmm0 = xmm0[1,3,2,3]
   91a45:      	pmuludq	%xmm5, %xmm2
   91a49:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
   91a4e:      	punpckldq	%xmm2, %xmm0    # xmm0 = xmm0[0],xmm2[0],xmm0[1],xmm2[1]
   91a52:      	psrld	$0x7, %xmm0
   91a57:      	pshufd	$0xf5, %xmm1, %xmm2     # xmm2 = xmm1[1,1,3,3]
   91a5c:      	pmuludq	%xmm5, %xmm1
   91a60:      	pshufd	$0xed, %xmm1, %xmm1     # xmm1 = xmm1[1,3,2,3]
   91a65:      	pmuludq	%xmm5, %xmm2
   91a69:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
   91a6e:      	punpckldq	%xmm2, %xmm1    # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
   91a72:      	psrld	$0x7, %xmm1
   91a77:      	packssdw	%xmm0, %xmm1
   91a7b:      	pand	%xmm6, %xmm1
   91a7f:      	movdqu	%xmm1, -0xa60(%rbp,%rax,2)
   91a88:      	addq	$0x8, %rax
   91a8c:      	cmpq	$0x100, %rax            # imm = 0x100
   91a92:      	jne	0x91a10 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7d0>
   91a98:      	movl	$0x200, %edx            # imm = 0x200
   91a9d:      	movq	%r12, %rdi
   91aa0:      	movq	%r14, %rsi
   91aa3:      	callq	0x10fcc0 <memcpy>
   91aa8:      	leaq	(%r15,%r15,4), %rax
   91aac:      	shlq	$0x6, %rax
   91ab0:      	leaq	(%rax,%rbp), %rdx
   91ab4:      	addq	$-0x1a60, %rdx          # imm = 0xE5A0
   91abb:      	movl	$0xa, %esi
   91ac0:      	movl	$0x140, %ecx            # imm = 0x140
   91ac5:      	movq	%r12, %rdi
   91ac8:      	callq	0x93560 <<toyos_crypto::mlkem::Poly>::encode>
   91acd:      	xorl	%eax, %eax
   91acf:      	nop
   91ad0:      	movw	$0x0, -0x460(%rbp,%rax)
   91ada:      	movw	$0x0, -0x45e(%rbp,%rax)
   91ae4:      	movw	$0x0, -0x45c(%rbp,%rax)
   91aee:      	movw	$0x0, -0x45a(%rbp,%rax)
   91af8:      	movw	$0x0, -0x458(%rbp,%rax)
   91b02:      	movw	$0x0, -0x456(%rbp,%rax)
   91b0c:      	movw	$0x0, -0x454(%rbp,%rax)
   91b16:      	movw	$0x0, -0x452(%rbp,%rax)
   91b20:      	addq	$0x10, %rax
   91b24:      	cmpq	$0x200, %rax            # imm = 0x200
   91b2a:      	jne	0x91ad0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x890>
   91b2c:      	xorl	%eax, %eax
   91b2e:      	nop
   91b30:      	movw	$0x0, -0x660(%rbp,%rax)
   91b3a:      	movw	$0x0, -0x65e(%rbp,%rax)
   91b44:      	movw	$0x0, -0x65c(%rbp,%rax)
   91b4e:      	movw	$0x0, -0x65a(%rbp,%rax)
   91b58:      	movw	$0x0, -0x658(%rbp,%rax)
   91b62:      	movw	$0x0, -0x656(%rbp,%rax)
   91b6c:      	movw	$0x0, -0x654(%rbp,%rax)
   91b76:      	movw	$0x0, -0x652(%rbp,%rax)
   91b80:      	addq	$0x10, %rax
   91b84:      	cmpq	$0x200, %rax            # imm = 0x200
   91b8a:      	jne	0x91b30 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x8f0>
   91b8c:      	xorl	%eax, %eax
   91b8e:      	nop
   91b90:      	movw	$0x0, -0x260(%rbp,%rax)
   91b9a:      	movw	$0x0, -0x25e(%rbp,%rax)
   91ba4:      	movw	$0x0, -0x25c(%rbp,%rax)
   91bae:      	movw	$0x0, -0x25a(%rbp,%rax)
   91bb8:      	movw	$0x0, -0x258(%rbp,%rax)
   91bc2:      	movw	$0x0, -0x256(%rbp,%rax)
   91bcc:      	movw	$0x0, -0x254(%rbp,%rax)
   91bd6:      	movw	$0x0, -0x252(%rbp,%rax)
   91be0:      	addq	$0x10, %rax
   91be4:      	cmpq	$0x200, %rax            # imm = 0x200
   91bea:      	jne	0x91b90 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x950>
   91bec:      	movq	-0x60(%rbp), %rax
   91bf0:      	movq	%rax, %r14
   91bf3:      	cmpq	$0x3, %rax
   91bf7:      	jne	0x91470 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x230>
   91bfd:      	leaq	-0x1460(%rbp), %rdi
   91c04:      	movq	$0x0, -0x30(%rbp)
   91c0c:      	movl	$0x200, %edx            # imm = 0x200
   91c11:      	xorl	%esi, %esi
   91c13:      	callq	0x1101f0 <memset>
   91c18:      	movl	$0x9d7dbb41, %r15d      # imm = 0x9D7DBB41
   91c1e:      	leaq	-0xa60(%rbp), %rbx
   91c25:      	xorl	%eax, %eax
   91c27:      	nopw	(%rax,%rax)
   91c30:      	movq	%r12, %r14
   91c33:      	leaq	(%rax,%rbp), %r12
   91c37:      	addq	$-0x1060, %r12          # imm = 0xEFA0
   91c3e:      	addq	$0x200, %rax            # imm = 0x200
   91c44:      	movq	%rax, -0x40(%rbp)
   91c48:      	movq	-0x30(%rbp), %rax
   91c4c:      	leaq	(%rax,%rax,2), %r13
   91c50:      	incq	%rax
   91c53:      	movq	%rax, -0x30(%rbp)
   91c57:      	shlq	$0x7, %r13
   91c5b:      	addq	-0x48(%rbp), %r13
   91c5f:      	movl	$0x200, %edx            # imm = 0x200
   91c64:      	movq	%r14, %rdi
   91c67:      	xorl	%esi, %esi
   91c69:      	callq	0x1101f0 <memset>
   91c6e:      	xorl	%eax, %eax
   91c70:      	movq	%rax, %rcx
   91c73:      	shrq	$0x3, %rcx
   91c77:      	movzbl	(%r13,%rcx), %r9d
   91c7d:      	movl	%eax, %ecx
   91c7f:      	andb	$0x4, %cl
   91c82:      	movzbl	%cl, %esi
   91c85:      	xorl	%r8d, %r8d
   91c88:      	btl	%esi, %r9d
   91c8c:      	setb	%r8b
   91c90:      	leal	0x1(%rsi), %ecx
   91c93:      	movl	%r9d, %r10d
   91c96:      	shrl	%cl, %r10d
   91c99:      	orw	(%r14), %r8w
   91c9d:      	leal	0x2(%rsi), %ecx
   91ca0:      	movl	%r9d, %edi
   91ca3:      	shrl	%cl, %edi
   91ca5:      	addl	%r10d, %r10d
   91ca8:      	andl	$0x2, %r10d
   91cac:      	shll	$0x2, %edi
   91caf:      	leal	0x3(%rsi), %ecx
   91cb2:      	shrl	%cl, %r9d
   91cb5:      	andl	$0x4, %edi
   91cb8:      	orl	%r10d, %edi
   91cbb:      	shll	$0x3, %r9d
   91cbf:      	leaq	0x4(%rax), %rcx
   91cc3:      	movq	%rcx, %r10
   91cc6:      	shrq	$0x3, %r10
   91cca:      	movzbl	(%r13,%r10), %r10d
   91cd0:      	andb	$0x4, %cl
   91cd3:      	shrl	%cl, %r10d
   91cd6:      	andl	$0x8, %r9d
   91cda:      	orl	%edi, %r9d
   91cdd:      	shll	$0x4, %r10d
   91ce1:      	leaq	0x5(%rax), %rcx
   91ce5:      	movq	%rcx, %rdi
   91ce8:      	shrq	$0x3, %rdi
   91cec:      	movzbl	(%r13,%rdi), %edi
   91cf2:      	andb	$0x5, %cl
   91cf5:      	shrl	%cl, %edi
   91cf7:      	andl	$0x10, %r10d
   91cfb:      	orl	%r9d, %r10d
   91cfe:      	shll	$0x5, %edi
   91d01:      	andl	$0x20, %edi
   91d04:      	orl	%r10d, %edi
   91d07:      	orl	%r8d, %edi
   91d0a:      	leaq	0x6(%rax), %rcx
   91d0e:      	movq	%rcx, %r8
   91d11:      	shrq	$0x3, %r8
   91d15:      	movzbl	(%r13,%r8), %r8d
   91d1b:      	andb	$0x6, %cl
   91d1e:      	shrl	%cl, %r8d
   91d21:      	leaq	0x7(%rax), %rcx
   91d25:      	movq	%rcx, %r9
   91d28:      	shrq	$0x3, %r9
   91d2c:      	movzbl	(%r13,%r9), %r9d
   91d32:      	andb	$0x7, %cl
   91d35:      	shrb	%cl, %r9b
   91d38:      	shll	$0x6, %r8d
   91d3c:      	andl	$0x40, %r8d
   91d40:      	shlb	$0x7, %r9b
   91d44:      	movzbl	%r9b, %ecx
   91d48:      	orl	%r8d, %ecx
   91d4b:      	leaq	0x8(%rax), %r8
   91d4f:      	shrq	$0x3, %r8
   91d53:      	movzbl	(%r13,%r8), %r8d
   91d59:      	xorl	%r9d, %r9d
   91d5c:      	btl	%esi, %r8d
   91d60:      	setb	%r9b
   91d64:      	shll	$0x8, %r9d
   91d68:      	orl	%ecx, %r9d
   91d6b:      	leaq	0x9(%rax), %rcx
   91d6f:      	movq	%rcx, %rsi
   91d72:      	shrq	$0x3, %rsi
   91d76:      	movzbl	(%r13,%rsi), %esi
   91d7c:      	andl	$0x5, %ecx
   91d7f:      	xorl	%r8d, %r8d
   91d82:      	btl	%ecx, %esi
   91d85:      	setb	%r8b
   91d89:      	shll	$0x9, %r8d
   91d8d:      	orl	%r9d, %r8d
   91d90:      	leaq	0xa(%rax), %rcx
   91d94:      	movq	%rcx, %rsi
   91d97:      	shrq	$0x3, %rsi
   91d9b:      	movzbl	(%r13,%rsi), %esi
   91da1:      	andl	$0x6, %ecx
   91da4:      	xorl	%r9d, %r9d
   91da7:      	btl	%ecx, %esi
   91daa:      	setb	%r9b
   91dae:      	shll	$0xa, %r9d
   91db2:      	orl	%r8d, %r9d
   91db5:      	orl	%edi, %r9d
   91db8:      	leaq	0xb(%rax), %rcx
   91dbc:      	movq	%rcx, %rsi
   91dbf:      	shrq	$0x3, %rsi
   91dc3:      	movzbl	(%r13,%rsi), %esi
   91dc9:      	andl	$0x7, %ecx
   91dcc:      	xorl	%edi, %edi
   91dce:      	btl	%ecx, %esi
   91dd1:      	setb	%dil
   91dd5:      	shll	$0xb, %edi
   91dd8:      	orl	%r9d, %edi
   91ddb:      	movw	%di, (%r14)
   91ddf:      	addq	$0x2, %r14
   91de3:      	addq	$0xc, %rax
   91de7:      	cmpq	$0xc00, %rax            # imm = 0xC00
   91ded:      	jne	0x91c70 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa30>
   91df3:      	movl	$0x200, %edx            # imm = 0x200
   91df8:      	leaq	-0x660(%rbp), %rdi
   91dff:      	leaq	-0x460(%rbp), %r14
   91e06:      	movq	%r14, %rsi
   91e09:      	callq	0x10fcc0 <memcpy>
   91e0e:      	movl	$0x200, %edx            # imm = 0x200
   91e13:      	movq	%r14, %rdi
   91e16:      	xorl	%esi, %esi
   91e18:      	callq	0x1101f0 <memset>
   91e1d:      	xorl	%eax, %eax
   91e1f:      	jmp	0x91f48 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd08>
   91e24:      	nopw	%cs:(%rax,%rax)
   91e30:      	movzwl	-0x660(%rbp,%rax,4), %edi
   91e38:      	movzwl	(%r12,%rax,4), %edx
   91e3d:      	movl	%edx, %r9d
   91e40:      	imull	%edi, %r9d
   91e44:      	imulq	$0x3afb7681, %r9, %rsi  # imm = 0x3AFB7681
   91e4b:      	shrq	$0x20, %rsi
   91e4f:      	movl	%r9d, %r8d
   91e52:      	subl	%esi, %r8d
   91e55:      	shrl	%r8d
   91e58:      	addl	%esi, %r8d
   91e5b:      	shrl	$0xb, %r8d
   91e5f:      	imull	$0xd01, %r8d, %esi      # imm = 0xD01
   91e66:      	subl	%esi, %r9d
   91e69:      	movzwl	-0x65e(%rbp,%rax,4), %r8d
   91e72:      	movzwl	0x2(%r12,%rax,4), %esi
   91e78:      	movl	%esi, %r10d
   91e7b:      	imull	%r8d, %r10d
   91e7f:      	imulq	$0x3afb7681, %r10, %r11 # imm = 0x3AFB7681
   91e86:      	shrq	$0x20, %r11
   91e8a:      	movl	%r10d, %r13d
   91e8d:      	subl	%r11d, %r13d
   91e90:      	shrl	%r13d
   91e93:      	addl	%r11d, %r13d
   91e96:      	shrl	$0xb, %r13d
   91e9a:      	imull	$0xd01, %r13d, %r11d    # imm = 0xD01
   91ea1:      	subl	%r11d, %r10d
   91ea4:      	movzwl	%cx, %ecx
   91ea7:      	imull	%r10d, %ecx
   91eab:      	imulq	$0x13afb769, %rcx, %r10 # imm = 0x13AFB769
   91eb2:      	shrq	$0x28, %r10
   91eb6:      	imull	$0xd01, %r10d, %r10d    # imm = 0xD01
   91ebd:      	subl	%r10d, %ecx
   91ec0:      	addl	%r9d, %ecx
   91ec3:      	leal	-0xd01(%rcx), %r9d
   91eca:      	cmpl	$0xd01, %ecx            # imm = 0xD01
   91ed0:      	cmovbl	%ecx, %r9d
   91ed4:      	movw	%r9w, -0x460(%rbp,%rax,4)
   91edd:      	imull	%edi, %esi
   91ee0:      	imulq	$0x3afb7681, %rsi, %rcx # imm = 0x3AFB7681
   91ee7:      	shrq	$0x20, %rcx
   91eeb:      	movl	%esi, %edi
   91eed:      	subl	%ecx, %edi
   91eef:      	shrl	%edi
   91ef1:      	addl	%ecx, %edi
   91ef3:      	shrl	$0xb, %edi
   91ef6:      	imull	$0xd01, %edi, %ecx      # imm = 0xD01
   91efc:      	subl	%ecx, %esi
   91efe:      	imull	%r8d, %edx
   91f02:      	imulq	$0x3afb7681, %rdx, %rcx # imm = 0x3AFB7681
   91f09:      	shrq	$0x20, %rcx
   91f0d:      	movl	%edx, %edi
   91f0f:      	subl	%ecx, %edi
   91f11:      	shrl	%edi
   91f13:      	addl	%ecx, %edi
   91f15:      	shrl	$0xb, %edi
   91f18:      	imull	$0xd01, %edi, %ecx      # imm = 0xD01
   91f1e:      	subl	%ecx, %edx
   91f20:      	addl	%esi, %edx
   91f22:      	leal	-0xd01(%rdx), %ecx
   91f28:      	cmpl	$0xd01, %edx            # imm = 0xD01
   91f2e:      	cmovbl	%edx, %ecx
   91f31:      	movw	%cx, -0x45e(%rbp,%rax,4)
   91f39:      	incq	%rax
   91f3c:      	cmpq	$0x80, %rax
   91f42:      	je	0x91fe0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xda0>
   91f48:      	movl	%eax, %ecx
   91f4a:      	rolb	$0x4, %cl
   91f4d:      	orb	$0x8, %cl
   91f50:      	movl	%ecx, %edx
   91f52:      	andb	$0x33, %dl
   91f55:      	shlb	$0x2, %dl
   91f58:      	shrb	$0x2, %cl
   91f5b:      	andb	$0x33, %cl
   91f5e:      	orb	%dl, %cl
   91f60:      	movl	%ecx, %edx
   91f62:      	andb	$0x55, %dl
   91f65:      	addb	%dl, %dl
   91f67:      	shrb	%cl
   91f69:      	andb	$0x55, %cl
   91f6c:      	orb	%dl, %cl
   91f6e:      	movzbl	%cl, %edx
   91f71:      	movw	$0x1, %cx
   91f75:      	movw	$0x11, %si
   91f79:      	jmp	0x91f9e <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd5e>
   91f7b:      	nopl	(%rax,%rax)
   91f80:      	imull	%esi, %esi
   91f83:      	movq	%rsi, %rdi
   91f86:      	imulq	%r15, %rdi
   91f8a:      	shrq	$0x2b, %rdi
   91f8e:      	imull	$0xd01, %edi, %edi      # imm = 0xD01
   91f94:      	subl	%edi, %esi
   91f96:      	shrl	%edx
   91f98:      	je	0x91e30 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbf0>
   91f9e:      	movzwl	%si, %esi
   91fa1:      	testb	$0x1, %dl
   91fa4:      	je	0x91f80 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd40>
   91fa6:      	movzwl	%cx, %ecx
   91fa9:      	imull	%esi, %ecx
   91fac:      	imulq	$0x3afb7681, %rcx, %rdi # imm = 0x3AFB7681
   91fb3:      	shrq	$0x20, %rdi
   91fb7:      	movl	%ecx, %r8d
   91fba:      	subl	%edi, %r8d
   91fbd:      	shrl	%r8d
   91fc0:      	addl	%edi, %r8d
   91fc3:      	shrl	$0xb, %r8d
   91fc7:      	imull	$0xd01, %r8d, %edi      # imm = 0xD01
   91fce:      	subl	%edi, %ecx
   91fd0:      	jmp	0x91f80 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd40>
   91fd2:      	nopw	%cs:(%rax,%rax)
   91fe0:      	movl	$0x200, %edx            # imm = 0x200
   91fe5:      	leaq	-0x260(%rbp), %rdi
   91fec:      	leaq	-0x460(%rbp), %r12
   91ff3:      	movq	%r12, %rsi
   91ff6:      	callq	0x10fcc0 <memcpy>
   91ffb:      	xorl	%eax, %eax
   91ffd:      	movdqa	-0x874f5(%rip), %xmm4   # 0xab10 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x300>
   92005:      	movdqa	-0x873bd(%rip), %xmm5   # 0xac50 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x440>
   9200d:      	pxor	%xmm6, %xmm6
   92011:      	nopw	%cs:(%rax,%rax)
   92020:      	movdqu	-0x1460(%rbp,%rax,2), %xmm2
   92029:      	movdqu	-0x260(%rbp,%rax,2), %xmm0
   92032:      	movdqa	%xmm2, %xmm3
   92036:      	punpckhwd	%xmm6, %xmm3    # xmm3 = xmm3[4],xmm6[4],xmm3[5],xmm6[5],xmm3[6],xmm6[6],xmm3[7],xmm6[7]
   9203a:      	punpcklwd	%xmm6, %xmm2    # xmm2 = xmm2[0],xmm6[0],xmm2[1],xmm6[1],xmm2[2],xmm6[2],xmm2[3],xmm6[3]
   9203e:      	movdqa	%xmm0, %xmm1
   92042:      	punpckhwd	%xmm6, %xmm1    # xmm1 = xmm1[4],xmm6[4],xmm1[5],xmm6[5],xmm1[6],xmm6[6],xmm1[7],xmm6[7]
   92046:      	paddd	%xmm3, %xmm1
   9204a:      	punpcklwd	%xmm6, %xmm0    # xmm0 = xmm0[0],xmm6[0],xmm0[1],xmm6[1],xmm0[2],xmm6[2],xmm0[3],xmm6[3]
   9204e:      	paddd	%xmm2, %xmm0
   92052:      	movdqa	%xmm1, %xmm2
   92056:      	pmuludq	%xmm4, %xmm2
   9205a:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
   9205f:      	pshufd	$0xf5, %xmm1, %xmm3     # xmm3 = xmm1[1,1,3,3]
   92064:      	pmuludq	%xmm4, %xmm3
   92068:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   9206d:      	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
   92071:      	pmaddwd	%xmm5, %xmm2
   92075:      	psubd	%xmm2, %xmm1
   92079:      	movdqa	%xmm0, %xmm2
   9207d:      	pmuludq	%xmm4, %xmm2
   92081:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
   92086:      	pshufd	$0xf5, %xmm0, %xmm3     # xmm3 = xmm0[1,1,3,3]
   9208b:      	pmuludq	%xmm4, %xmm3
   9208f:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   92094:      	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
   92098:      	pmaddwd	%xmm5, %xmm2
   9209c:      	psubd	%xmm2, %xmm0
   920a0:      	packssdw	%xmm1, %xmm0
   920a4:      	movdqu	%xmm0, -0x460(%rbp,%rax,2)
   920ad:      	addq	$0x8, %rax
   920b1:      	cmpq	$0x100, %rax            # imm = 0x100
   920b7:      	jne	0x92020 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xde0>
   920bd:      	movl	$0x200, %edx            # imm = 0x200
   920c2:      	movq	%rbx, %rdi
   920c5:      	movq	%r12, %rsi
   920c8:      	callq	0x10fcc0 <memcpy>
   920cd:      	movl	$0xe, %eax
   920d2:      	nopw	%cs:(%rax,%rax)
   920e0:      	movw	$0x0, -0x146e(%rbp,%rax)
   920ea:      	movw	$0x0, -0x146c(%rbp,%rax)
   920f4:      	movw	$0x0, -0x146a(%rbp,%rax)
   920fe:      	movw	$0x0, -0x1468(%rbp,%rax)
   92108:      	movw	$0x0, -0x1466(%rbp,%rax)
   92112:      	movw	$0x0, -0x1464(%rbp,%rax)
   9211c:      	movw	$0x0, -0x1462(%rbp,%rax)
   92126:      	movw	$0x0, -0x1460(%rbp,%rax)
   92130:      	addq	$0x10, %rax
   92134:      	cmpq	$0x20e, %rax            # imm = 0x20E
   9213a:      	jne	0x920e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xea0>
   9213c:      	movl	$0x200, %edx            # imm = 0x200
   92141:      	leaq	-0x1460(%rbp), %rdi
   92148:      	movq	%rbx, %rsi
   9214b:      	callq	0x10fcc0 <memcpy>
   92150:      	xorl	%eax, %eax
   92152:      	nopw	%cs:(%rax,%rax)
   92160:      	movw	$0x0, -0x260(%rbp,%rax)
   9216a:      	movw	$0x0, -0x25e(%rbp,%rax)
   92174:      	movw	$0x0, -0x25c(%rbp,%rax)
   9217e:      	movw	$0x0, -0x25a(%rbp,%rax)
   92188:      	movw	$0x0, -0x258(%rbp,%rax)
   92192:      	movw	$0x0, -0x256(%rbp,%rax)
   9219c:      	movw	$0x0, -0x254(%rbp,%rax)
   921a6:      	movw	$0x0, -0x252(%rbp,%rax)
   921b0:      	addq	$0x10, %rax
   921b4:      	cmpq	$0x200, %rax            # imm = 0x200
   921ba:      	jne	0x92160 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xf20>
   921bc:      	xorl	%eax, %eax
   921be:      	nop
   921c0:      	movw	$0x0, -0x660(%rbp,%rax)
   921ca:      	movw	$0x0, -0x65e(%rbp,%rax)
   921d4:      	movw	$0x0, -0x65c(%rbp,%rax)
   921de:      	movw	$0x0, -0x65a(%rbp,%rax)
   921e8:      	movw	$0x0, -0x658(%rbp,%rax)
   921f2:      	movw	$0x0, -0x656(%rbp,%rax)
   921fc:      	movw	$0x0, -0x654(%rbp,%rax)
   92206:      	movw	$0x0, -0x652(%rbp,%rax)
   92210:      	addq	$0x10, %rax
   92214:      	cmpq	$0x200, %rax            # imm = 0x200
   9221a:      	jne	0x921c0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xf80>
   9221c:      	movq	-0x40(%rbp), %rax
   92220:      	cmpq	$0x600, %rax            # imm = 0x600
   92226:      	jne	0x91c30 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9f0>
   9222c:      	leaq	-0x460(%rbp), %rbx
   92233:      	leaq	-0x1460(%rbp), %rsi
   9223a:      	movl	$0x200, %edx            # imm = 0x200
   9223f:      	movq	%rbx, %rdi
   92242:      	callq	0x10fcc0 <memcpy>
   92247:      	leaq	-0x860(%rbp), %rdi
   9224e:      	movq	%rbx, %rsi
   92251:      	callq	0x936a0 <<toyos_crypto::mlkem::Poly>::inverse>
   92256:      	leaq	-0xa60(%rbp), %rdi
   9225d:      	movq	-0x38(%rbp), %rsi
   92261:      	movl	$0x6, %edx
   92266:      	callq	0x93a30 <toyos_crypto::mlkem::noise>
   9226b:      	movq	-0x50(%rbp), %r14
   9226f:      	xorl	%eax, %eax
   92271:      	pxor	%xmm0, %xmm0
   92275:      	movdqa	-0x8776d(%rip), %xmm5   # 0xab10 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x300>
   9227d:      	movdqa	-0x87635(%rip), %xmm6   # 0xac50 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x440>
   92285:      	nopw	%cs:(%rax,%rax)
   92290:      	movdqu	-0x860(%rbp,%rax,2), %xmm3
   92299:      	movdqu	-0xa60(%rbp,%rax,2), %xmm1
   922a2:      	movdqa	%xmm3, %xmm4
   922a6:      	punpckhwd	%xmm0, %xmm4    # xmm4 = xmm4[4],xmm0[4],xmm4[5],xmm0[5],xmm4[6],xmm0[6],xmm4[7],xmm0[7]
   922aa:      	punpcklwd	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3]
   922ae:      	movdqa	%xmm1, %xmm2
   922b2:      	punpckhwd	%xmm0, %xmm2    # xmm2 = xmm2[4],xmm0[4],xmm2[5],xmm0[5],xmm2[6],xmm0[6],xmm2[7],xmm0[7]
   922b6:      	paddd	%xmm4, %xmm2
   922ba:      	punpcklwd	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3]
   922be:      	paddd	%xmm3, %xmm1
   922c2:      	movdqa	%xmm2, %xmm3
   922c6:      	pmuludq	%xmm5, %xmm3
   922ca:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   922cf:      	pshufd	$0xf5, %xmm2, %xmm4     # xmm4 = xmm2[1,1,3,3]
   922d4:      	pmuludq	%xmm5, %xmm4
   922d8:      	pshufd	$0xed, %xmm4, %xmm4     # xmm4 = xmm4[1,3,2,3]
   922dd:      	punpckldq	%xmm4, %xmm3    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
   922e1:      	pmaddwd	%xmm6, %xmm3
   922e5:      	psubd	%xmm3, %xmm2
   922e9:      	movdqa	%xmm1, %xmm3
   922ed:      	pmuludq	%xmm5, %xmm3
   922f1:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   922f6:      	pshufd	$0xf5, %xmm1, %xmm4     # xmm4 = xmm1[1,1,3,3]
   922fb:      	pmuludq	%xmm5, %xmm4
   922ff:      	pshufd	$0xed, %xmm4, %xmm4     # xmm4 = xmm4[1,3,2,3]
   92304:      	punpckldq	%xmm4, %xmm3    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
   92308:      	pmaddwd	%xmm6, %xmm3
   9230c:      	psubd	%xmm3, %xmm1
   92310:      	packssdw	%xmm2, %xmm1
   92314:      	movdqu	%xmm1, -0x460(%rbp,%rax,2)
   9231d:      	addq	$0x8, %rax
   92321:      	cmpq	$0x100, %rax            # imm = 0x100
   92327:      	jne	0x92290 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1050>
   9232d:      	leaq	-0x1260(%rbp), %rdi
   92334:      	leaq	-0x460(%rbp), %rsi
   9233b:      	movl	$0x200, %edx            # imm = 0x200
   92340:      	callq	0x10fcc0 <memcpy>
   92345:      	leaq	-0x460(%rbp), %rdi
   9234c:      	xorl	%ebx, %ebx
   9234e:      	movl	$0x200, %edx            # imm = 0x200
   92353:      	xorl	%esi, %esi
   92355:      	callq	0x1101f0 <memset>
   9235a:      	movq	-0x879c2(%rip), %xmm0   # 0xa9a0 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x190>
   92362:      	movq	-0x87b9a(%rip), %xmm1   # 0xa7d0 <anon.06a5d9ca6d216076d14f4792906d843c.6.llvm.5360783310085923784+0x333>
   9236a:      	pxor	%xmm2, %xmm2
   9236e:      	movdqa	-0x87c76(%rip), %xmm3   # 0xa700 <anon.06a5d9ca6d216076d14f4792906d843c.6.llvm.5360783310085923784+0x263>
   92376:      	movdqa	-0x8763e(%rip), %xmm4   # 0xad40 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x530>
   9237e:      	movdqa	-0x87c76(%rip), %xmm5   # 0xa710 <anon.06a5d9ca6d216076d14f4792906d843c.6.llvm.5360783310085923784+0x273>
   92386:      	movdqa	-0x87cde(%rip), %xmm6   # 0xa6b0 <anon.06a5d9ca6d216076d14f4792906d843c.6.llvm.5360783310085923784+0x213>
   9238e:      	movq	-0x58(%rbp), %rcx
   92392:      	nopw	%cs:(%rax,%rax)
   923a0:      	movzbl	(%rcx), %eax
   923a3:      	movd	%eax, %xmm7
   923a7:      	punpcklbw	%xmm7, %xmm7    # xmm7 = xmm7[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
   923ab:      	pshuflw	$0x0, %xmm7, %xmm7      # xmm7 = xmm7[0,0,0,0,4,5,6,7]
   923b0:      	movdqa	%xmm0, %xmm8
   923b5:      	psllw	$0x5, %xmm8
   923bb:      	pand	%xmm1, %xmm8
   923c0:      	pxor	%xmm9, %xmm9
   923c5:      	pcmpgtb	%xmm8, %xmm9
   923ca:      	movdqa	%xmm9, %xmm10
   923cf:      	pandn	%xmm7, %xmm10
   923d4:      	psrlw	$0x4, %xmm7
   923d9:      	pand	%xmm9, %xmm7
   923de:      	pand	%xmm3, %xmm7
   923e2:      	por	%xmm10, %xmm7
   923e7:      	paddb	%xmm8, %xmm8
   923ec:      	pxor	%xmm9, %xmm9
   923f1:      	pcmpgtb	%xmm8, %xmm9
   923f6:      	movdqa	%xmm9, %xmm10
   923fb:      	pandn	%xmm7, %xmm10
   92400:      	psrlw	$0x2, %xmm7
   92405:      	pand	%xmm9, %xmm7
   9240a:      	pand	%xmm4, %xmm7
   9240e:      	por	%xmm10, %xmm7
   92413:      	paddb	%xmm8, %xmm8
   92418:      	pxor	%xmm9, %xmm9
   9241d:      	pcmpgtb	%xmm8, %xmm9
   92422:      	movdqa	%xmm9, %xmm8
   92427:      	pandn	%xmm7, %xmm8
   9242c:      	psrlw	$0x1, %xmm7
   92431:      	pand	%xmm9, %xmm7
   92436:      	por	%xmm8, %xmm7
   9243b:      	pand	%xmm5, %xmm7
   9243f:      	punpcklbw	%xmm2, %xmm7    # xmm7 = xmm7[0],xmm2[0],xmm7[1],xmm2[1],xmm7[2],xmm2[2],xmm7[3],xmm2[3],xmm7[4],xmm2[4],xmm7[5],xmm2[5],xmm7[6],xmm2[6],xmm7[7],xmm2[7]
   92443:      	movdqu	-0x460(%rbp,%rbx,2), %xmm8
   9244d:      	por	%xmm7, %xmm8
   92452:      	movdqu	%xmm8, -0x460(%rbp,%rbx,2)
   9245c:      	addq	$0x8, %rbx
   92460:      	paddb	%xmm6, %xmm0
   92464:      	incq	%rcx
   92467:      	cmpq	$0x100, %rbx            # imm = 0x100
   9246e:      	jne	0x923a0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1160>
   92474:      	leaq	-0x660(%rbp), %rdi
   9247b:      	leaq	-0x460(%rbp), %rsi
   92482:      	movl	$0x200, %edx            # imm = 0x200
   92487:      	callq	0x10fcc0 <memcpy>
   9248c:      	xorl	%eax, %eax
   9248e:      	movdqa	-0x87896(%rip), %xmm0   # 0xac00 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x3f0>
   92496:      	pcmpeqd	%xmm1, %xmm1
   9249a:      	nopw	(%rax,%rax)
   924a0:      	movdqu	-0x660(%rbp,%rax,2), %xmm2
   924a9:      	movdqa	%xmm2, %xmm3
   924ad:      	pmulhuw	%xmm0, %xmm3
   924b1:      	pmullw	%xmm0, %xmm2
   924b5:      	movdqa	%xmm2, %xmm4
   924b9:      	punpckhwd	%xmm3, %xmm4    # xmm4 = xmm4[4],xmm3[4],xmm4[5],xmm3[5],xmm4[6],xmm3[6],xmm4[7],xmm3[7]
   924bd:      	punpcklwd	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1],xmm2[2],xmm3[2],xmm2[3],xmm3[3]
   924c1:      	psubd	%xmm1, %xmm2
   924c5:      	psubd	%xmm1, %xmm4
   924c9:      	pslld	$0xf, %xmm4
   924ce:      	psrad	$0x10, %xmm4
   924d3:      	pslld	$0xf, %xmm2
   924d8:      	psrad	$0x10, %xmm2
   924dd:      	packssdw	%xmm4, %xmm2
   924e1:      	movdqu	%xmm2, -0x660(%rbp,%rax,2)
   924ea:      	addq	$0x8, %rax
   924ee:      	cmpq	$0x100, %rax            # imm = 0x100
   924f4:      	jne	0x924a0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1260>
   924f6:      	leaq	-0x260(%rbp), %rdi
   924fd:      	leaq	-0x660(%rbp), %rsi
   92504:      	movl	$0x200, %edx            # imm = 0x200
   92509:      	callq	0x10fcc0 <memcpy>
   9250e:      	xorl	%eax, %eax
   92510:      	pxor	%xmm0, %xmm0
   92514:      	movdqa	-0x87a0c(%rip), %xmm6   # 0xab10 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x300>
   9251c:      	movdqa	-0x878d4(%rip), %xmm5   # 0xac50 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x440>
   92524:      	nopw	%cs:(%rax,%rax)
   92530:      	movdqu	-0x1260(%rbp,%rax,2), %xmm3
   92539:      	movdqu	-0x260(%rbp,%rax,2), %xmm1
   92542:      	movdqa	%xmm3, %xmm4
   92546:      	punpckhwd	%xmm0, %xmm4    # xmm4 = xmm4[4],xmm0[4],xmm4[5],xmm0[5],xmm4[6],xmm0[6],xmm4[7],xmm0[7]
   9254a:      	punpcklwd	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3]
   9254e:      	movdqa	%xmm1, %xmm2
   92552:      	punpckhwd	%xmm0, %xmm2    # xmm2 = xmm2[4],xmm0[4],xmm2[5],xmm0[5],xmm2[6],xmm0[6],xmm2[7],xmm0[7]
   92556:      	paddd	%xmm4, %xmm2
   9255a:      	punpcklwd	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3]
   9255e:      	paddd	%xmm3, %xmm1
   92562:      	movdqa	%xmm2, %xmm3
   92566:      	pmuludq	%xmm6, %xmm3
   9256a:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   9256f:      	pshufd	$0xf5, %xmm2, %xmm4     # xmm4 = xmm2[1,1,3,3]
   92574:      	pmuludq	%xmm6, %xmm4
   92578:      	pshufd	$0xed, %xmm4, %xmm4     # xmm4 = xmm4[1,3,2,3]
   9257d:      	punpckldq	%xmm4, %xmm3    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
   92581:      	pmaddwd	%xmm5, %xmm3
   92585:      	psubd	%xmm3, %xmm2
   92589:      	movdqa	%xmm1, %xmm3
   9258d:      	pmuludq	%xmm6, %xmm3
   92591:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   92596:      	pshufd	$0xf5, %xmm1, %xmm4     # xmm4 = xmm1[1,1,3,3]
   9259b:      	pmuludq	%xmm6, %xmm4
   9259f:      	pshufd	$0xed, %xmm4, %xmm4     # xmm4 = xmm4[1,3,2,3]
   925a4:      	punpckldq	%xmm4, %xmm3    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
   925a8:      	pmaddwd	%xmm5, %xmm3
   925ac:      	psubd	%xmm3, %xmm1
   925b0:      	packssdw	%xmm2, %xmm1
   925b4:      	movdqu	%xmm1, -0x460(%rbp,%rax,2)
   925bd:      	addq	$0x8, %rax
   925c1:      	cmpq	$0x100, %rax            # imm = 0x100
   925c7:      	jne	0x92530 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12f0>
   925cd:      	leaq	-0x660(%rbp), %rdi
   925d4:      	leaq	-0x460(%rbp), %rsi
   925db:      	movl	$0x200, %edx            # imm = 0x200
   925e0:      	callq	0x10fcc0 <memcpy>
   925e5:      	movdqa	-0x87add(%rip), %xmm6   # 0xab10 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x300>
   925ed:      	xorl	%eax, %eax
   925ef:      	pxor	%xmm0, %xmm0
   925f3:      	movdqa	-0x87c1b(%rip), %xmm1   # 0xa9e0 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x1d0>
   925fb:      	movdqa	-0x87cb3(%rip), %xmm5   # 0xa950 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x140>
   92603:      	nopw	%cs:(%rax,%rax)
   92610:      	movdqu	-0x660(%rbp,%rax,2), %xmm2
   92619:      	movdqa	%xmm2, %xmm3
   9261d:      	punpcklwd	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3]
   92621:      	punpckhwd	%xmm0, %xmm2    # xmm2 = xmm2[4],xmm0[4],xmm2[5],xmm0[5],xmm2[6],xmm0[6],xmm2[7],xmm0[7]
   92625:      	pslld	$0x4, %xmm2
   9262a:      	pslld	$0x4, %xmm3
   9262f:      	paddd	%xmm5, %xmm3
   92633:      	paddd	%xmm5, %xmm2
   92637:      	pshufd	$0xf5, %xmm2, %xmm4     # xmm4 = xmm2[1,1,3,3]
   9263c:      	pmuludq	%xmm6, %xmm2
   92640:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
   92645:      	pmuludq	%xmm6, %xmm4
   92649:      	pshufd	$0xed, %xmm4, %xmm4     # xmm4 = xmm4[1,3,2,3]
   9264e:      	punpckldq	%xmm4, %xmm2    # xmm2 = xmm2[0],xmm4[0],xmm2[1],xmm4[1]
   92652:      	pshufd	$0xf5, %xmm3, %xmm4     # xmm4 = xmm3[1,1,3,3]
   92657:      	pmuludq	%xmm6, %xmm3
   9265b:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   92660:      	pmuludq	%xmm6, %xmm4
   92664:      	pshufd	$0xed, %xmm4, %xmm4     # xmm4 = xmm4[1,3,2,3]
   92669:      	punpckldq	%xmm4, %xmm3    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
   9266d:      	packssdw	%xmm2, %xmm3
   92671:      	pand	%xmm1, %xmm3
   92675:      	movdqu	%xmm3, -0x660(%rbp,%rax,2)
   9267e:      	addq	$0x8, %rax
   92682:      	cmpq	$0x100, %rax            # imm = 0x100
   92688:      	jne	0x92610 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x13d0>
   9268a:      	leaq	-0x460(%rbp), %rbx
   92691:      	leaq	-0x660(%rbp), %rsi
   92698:      	movl	$0x200, %edx            # imm = 0x200
   9269d:      	movq	%rbx, %rdi
   926a0:      	callq	0x10fcc0 <memcpy>
   926a5:      	leaq	-0x16a0(%rbp), %rdx
   926ac:      	movl	$0x4, %esi
   926b1:      	movl	$0x80, %ecx
   926b6:      	movq	%rbx, %rdi
   926b9:      	callq	0x93560 <<toyos_crypto::mlkem::Poly>::encode>
   926be:      	xorl	%eax, %eax
   926c0:      	movw	$0x0, -0x460(%rbp,%rax)
   926ca:      	movw	$0x0, -0x45e(%rbp,%rax)
   926d4:      	movw	$0x0, -0x45c(%rbp,%rax)
   926de:      	movw	$0x0, -0x45a(%rbp,%rax)
   926e8:      	movw	$0x0, -0x458(%rbp,%rax)
   926f2:      	movw	$0x0, -0x456(%rbp,%rax)
   926fc:      	movw	$0x0, -0x454(%rbp,%rax)
   92706:      	movw	$0x0, -0x452(%rbp,%rax)
   92710:      	addq	$0x10, %rax
   92714:      	cmpq	$0x200, %rax            # imm = 0x200
   9271a:      	jne	0x926c0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1480>
   9271c:      	xorl	%eax, %eax
   9271e:      	nop
   92720:      	movw	$0x0, -0x260(%rbp,%rax)
   9272a:      	movw	$0x0, -0x25e(%rbp,%rax)
   92734:      	movw	$0x0, -0x25c(%rbp,%rax)
   9273e:      	movw	$0x0, -0x25a(%rbp,%rax)
   92748:      	movw	$0x0, -0x258(%rbp,%rax)
   92752:      	movw	$0x0, -0x256(%rbp,%rax)
   9275c:      	movw	$0x0, -0x254(%rbp,%rax)
   92766:      	movw	$0x0, -0x252(%rbp,%rax)
   92770:      	addq	$0x10, %rax
   92774:      	cmpq	$0x200, %rax            # imm = 0x200
   9277a:      	jne	0x92720 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x14e0>
   9277c:      	xorl	%eax, %eax
   9277e:      	nop
   92780:      	movw	$0x0, -0x1260(%rbp,%rax)
   9278a:      	movw	$0x0, -0x125e(%rbp,%rax)
   92794:      	movw	$0x0, -0x125c(%rbp,%rax)
   9279e:      	movw	$0x0, -0x125a(%rbp,%rax)
   927a8:      	movw	$0x0, -0x1258(%rbp,%rax)
   927b2:      	movw	$0x0, -0x1256(%rbp,%rax)
   927bc:      	movw	$0x0, -0x1254(%rbp,%rax)
   927c6:      	movw	$0x0, -0x1252(%rbp,%rax)
   927d0:      	addq	$0x10, %rax
   927d4:      	cmpq	$0x200, %rax            # imm = 0x200
   927da:      	jne	0x92780 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1540>
   927dc:      	xorl	%eax, %eax
   927de:      	nop
   927e0:      	movw	$0x0, -0xa60(%rbp,%rax)
   927ea:      	movw	$0x0, -0xa5e(%rbp,%rax)
   927f4:      	movw	$0x0, -0xa5c(%rbp,%rax)
   927fe:      	movw	$0x0, -0xa5a(%rbp,%rax)
   92808:      	movw	$0x0, -0xa58(%rbp,%rax)
   92812:      	movw	$0x0, -0xa56(%rbp,%rax)
   9281c:      	movw	$0x0, -0xa54(%rbp,%rax)
   92826:      	movw	$0x0, -0xa52(%rbp,%rax)
   92830:      	addq	$0x10, %rax
   92834:      	cmpq	$0x200, %rax            # imm = 0x200
   9283a:      	jne	0x927e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x15a0>
   9283c:      	xorl	%eax, %eax
   9283e:      	nop
   92840:      	movw	$0x0, -0x860(%rbp,%rax)
   9284a:      	movw	$0x0, -0x85e(%rbp,%rax)
   92854:      	movw	$0x0, -0x85c(%rbp,%rax)
   9285e:      	movw	$0x0, -0x85a(%rbp,%rax)
   92868:      	movw	$0x0, -0x858(%rbp,%rax)
   92872:      	movw	$0x0, -0x856(%rbp,%rax)
   9287c:      	movw	$0x0, -0x854(%rbp,%rax)
   92886:      	movw	$0x0, -0x852(%rbp,%rax)
   92890:      	addq	$0x10, %rax
   92894:      	cmpq	$0x200, %rax            # imm = 0x200
   9289a:      	jne	0x92840 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1600>
   9289c:      	leaq	-0x1a60(%rbp), %rsi
   928a3:      	movl	$0x440, %edx            # imm = 0x440
   928a8:      	movq	%r14, %rdi
   928ab:      	callq	0x10fcc0 <memcpy>
   928b0:      	xorl	%eax, %eax
   928b2:      	nopw	%cs:(%rax,%rax)
   928c0:      	movw	$0x0, -0x1060(%rbp,%rax)
   928ca:      	movw	$0x0, -0x105e(%rbp,%rax)
   928d4:      	movw	$0x0, -0x105c(%rbp,%rax)
   928de:      	movw	$0x0, -0x105a(%rbp,%rax)
   928e8:      	movw	$0x0, -0x1058(%rbp,%rax)
   928f2:      	movw	$0x0, -0x1056(%rbp,%rax)
   928fc:      	movw	$0x0, -0x1054(%rbp,%rax)
   92906:      	movw	$0x0, -0x1052(%rbp,%rax)
   92910:      	addq	$0x10, %rax
   92914:      	cmpq	$0x200, %rax            # imm = 0x200
   9291a:      	jne	0x928c0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1680>
   9291c:      	xorl	%eax, %eax
   9291e:      	nop
   92920:      	movw	$0x0, -0xe60(%rbp,%rax)
   9292a:      	movw	$0x0, -0xe5e(%rbp,%rax)
   92934:      	movw	$0x0, -0xe5c(%rbp,%rax)
   9293e:      	movw	$0x0, -0xe5a(%rbp,%rax)
   92948:      	movw	$0x0, -0xe58(%rbp,%rax)
   92952:      	movw	$0x0, -0xe56(%rbp,%rax)
   9295c:      	movw	$0x0, -0xe54(%rbp,%rax)
   92966:      	movw	$0x0, -0xe52(%rbp,%rax)
   92970:      	addq	$0x10, %rax
   92974:      	cmpq	$0x200, %rax            # imm = 0x200
   9297a:      	jne	0x92920 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x16e0>
   9297c:      	xorl	%eax, %eax
   9297e:      	nop
   92980:      	movw	$0x0, -0xc60(%rbp,%rax)
   9298a:      	movw	$0x0, -0xc5e(%rbp,%rax)
   92994:      	movw	$0x0, -0xc5c(%rbp,%rax)
   9299e:      	movw	$0x0, -0xc5a(%rbp,%rax)
   929a8:      	movw	$0x0, -0xc58(%rbp,%rax)
   929b2:      	movw	$0x0, -0xc56(%rbp,%rax)
   929bc:      	movw	$0x0, -0xc54(%rbp,%rax)
   929c6:      	movw	$0x0, -0xc52(%rbp,%rax)
   929d0:      	addq	$0x10, %rax
   929d4:      	cmpq	$0x200, %rax            # imm = 0x200
   929da:      	jne	0x92980 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1740>
   929dc:      	movq	%r14, %rax
   929df:      	addq	$0x1a38, %rsp           # imm = 0x1A38
   929e6:      	popq	%rbx
   929e7:      	popq	%r12
   929e9:      	popq	%r13
   929eb:      	popq	%r14
   929ed:      	popq	%r15
   929ef:      	popq	%rbp
   929f0:      	retq
   929f1:      	xorl	%ecx, %ecx
   929f3:      	nopw	%cs:(%rax,%rax)
   92a00:      	movw	$0x0, -0x460(%rbp,%rcx)
   92a0a:      	movw	$0x0, -0x45e(%rbp,%rcx)
   92a14:      	movw	$0x0, -0x45c(%rbp,%rcx)
   92a1e:      	movw	$0x0, -0x45a(%rbp,%rcx)
   92a28:      	movw	$0x0, -0x458(%rbp,%rcx)
   92a32:      	movw	$0x0, -0x456(%rbp,%rcx)
   92a3c:      	movw	$0x0, -0x454(%rbp,%rcx)
   92a46:      	movw	$0x0, -0x452(%rbp,%rcx)
   92a50:      	addq	$0x10, %rcx
   92a54:      	cmpq	$0x200, %rcx            # imm = 0x200
   92a5b:      	jne	0x92a00 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x17c0>
   92a5d:      	xorl	%ecx, %ecx
   92a5f:      	nop
   92a60:      	movw	$0x0, -0x260(%rbp,%rcx)
   92a6a:      	movw	$0x0, -0x25e(%rbp,%rcx)
   92a74:      	movw	$0x0, -0x25c(%rbp,%rcx)
   92a7e:      	movw	$0x0, -0x25a(%rbp,%rcx)
   92a88:      	movw	$0x0, -0x258(%rbp,%rcx)
   92a92:      	movw	$0x0, -0x256(%rbp,%rcx)
   92a9c:      	movw	$0x0, -0x254(%rbp,%rcx)
   92aa6:      	movw	$0x0, -0x252(%rbp,%rcx)
   92ab0:      	addq	$0x10, %rcx
   92ab4:      	cmpq	$0x200, %rcx            # imm = 0x200
   92abb:      	jne	0x92a60 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1820>
   92abd:      	xorl	%ecx, %ecx
   92abf:      	nop
   92ac0:      	movw	$0x0, -0x1260(%rbp,%rcx)
   92aca:      	movw	$0x0, -0x125e(%rbp,%rcx)
   92ad4:      	movw	$0x0, -0x125c(%rbp,%rcx)
   92ade:      	movw	$0x0, -0x125a(%rbp,%rcx)
   92ae8:      	movw	$0x0, -0x1258(%rbp,%rcx)
   92af2:      	movw	$0x0, -0x1256(%rbp,%rcx)
   92afc:      	movw	$0x0, -0x1254(%rbp,%rcx)
   92b06:      	movw	$0x0, -0x1252(%rbp,%rcx)
   92b10:      	addq	$0x10, %rcx
   92b14:      	cmpq	$0x200, %rcx            # imm = 0x200
   92b1b:      	jne	0x92ac0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1880>
   92b1d:      	xorl	%ecx, %ecx
   92b1f:      	nop
   92b20:      	movw	$0x0, -0xa60(%rbp,%rcx)
   92b2a:      	movw	$0x0, -0xa5e(%rbp,%rcx)
   92b34:      	movw	$0x0, -0xa5c(%rbp,%rcx)
   92b3e:      	movw	$0x0, -0xa5a(%rbp,%rcx)
   92b48:      	movw	$0x0, -0xa58(%rbp,%rcx)
   92b52:      	movw	$0x0, -0xa56(%rbp,%rcx)
   92b5c:      	movw	$0x0, -0xa54(%rbp,%rcx)
   92b66:      	movw	$0x0, -0xa52(%rbp,%rcx)
   92b70:      	addq	$0x10, %rcx
   92b74:      	cmpq	$0x200, %rcx            # imm = 0x200
   92b7b:      	jne	0x92b20 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x18e0>
   92b7d:      	jmp	0x92b7f <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x193f>
   92b7f:      	xorl	%ecx, %ecx
   92b81:      	nopw	%cs:(%rax,%rax)
   92b90:      	movw	$0x0, -0x860(%rbp,%rcx)
   92b9a:      	movw	$0x0, -0x85e(%rbp,%rcx)
   92ba4:      	movw	$0x0, -0x85c(%rbp,%rcx)
   92bae:      	movw	$0x0, -0x85a(%rbp,%rcx)
   92bb8:      	movw	$0x0, -0x858(%rbp,%rcx)
   92bc2:      	movw	$0x0, -0x856(%rbp,%rcx)
   92bcc:      	movw	$0x0, -0x854(%rbp,%rcx)
   92bd6:      	movw	$0x0, -0x852(%rbp,%rcx)
   92be0:      	addq	$0x10, %rcx
   92be4:      	cmpq	$0x200, %rcx            # imm = 0x200
   92beb:      	jne	0x92b90 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1950>
   92bed:      	jmp	0x92d4d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1b0d>
   92bf2:      	jmp	0x92d4f <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1b0f>
   92bf7:      	movq	%rax, %rbx
   92bfa:      	movq	%r14, -0x850(%rbp)
   92c01:      	leaq	-0x860(%rbp), %rdi
   92c08:      	callq	0x90e50 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>
   92c0d:      	movq	%rbx, %rdi
   92c10:      	callq	0x105eb0 <_Unwind_Resume>
   92c15:      	xorl	%ecx, %ecx
   92c17:      	nopw	(%rax,%rax)
   92c20:      	movw	$0x0, -0x460(%rbp,%rcx)
   92c2a:      	movw	$0x0, -0x45e(%rbp,%rcx)
   92c34:      	movw	$0x0, -0x45c(%rbp,%rcx)
   92c3e:      	movw	$0x0, -0x45a(%rbp,%rcx)
   92c48:      	movw	$0x0, -0x458(%rbp,%rcx)
   92c52:      	movw	$0x0, -0x456(%rbp,%rcx)
   92c5c:      	movw	$0x0, -0x454(%rbp,%rcx)
   92c66:      	movw	$0x0, -0x452(%rbp,%rcx)
   92c70:      	addq	$0x10, %rcx
   92c74:      	cmpq	$0x200, %rcx            # imm = 0x200
   92c7b:      	jne	0x92c20 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x19e0>
   92c7d:      	xorl	%ecx, %ecx
   92c7f:      	nop
   92c80:      	movw	$0x0, -0x660(%rbp,%rcx)
   92c8a:      	movw	$0x0, -0x65e(%rbp,%rcx)
   92c94:      	movw	$0x0, -0x65c(%rbp,%rcx)
   92c9e:      	movw	$0x0, -0x65a(%rbp,%rcx)
   92ca8:      	movw	$0x0, -0x658(%rbp,%rcx)
   92cb2:      	movw	$0x0, -0x656(%rbp,%rcx)
   92cbc:      	movw	$0x0, -0x654(%rbp,%rcx)
   92cc6:      	movw	$0x0, -0x652(%rbp,%rcx)
   92cd0:      	addq	$0x10, %rcx
   92cd4:      	cmpq	$0x200, %rcx            # imm = 0x200
   92cdb:      	jne	0x92c80 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1a40>
   92cdd:      	jmp	0x92cdf <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1a9f>
   92cdf:      	xorl	%ecx, %ecx
   92ce1:      	nopw	%cs:(%rax,%rax)
   92cf0:      	movw	$0x0, -0x260(%rbp,%rcx)
   92cfa:      	movw	$0x0, -0x25e(%rbp,%rcx)
   92d04:      	movw	$0x0, -0x25c(%rbp,%rcx)
   92d0e:      	movw	$0x0, -0x25a(%rbp,%rcx)
   92d18:      	movw	$0x0, -0x258(%rbp,%rcx)
   92d22:      	movw	$0x0, -0x256(%rbp,%rcx)
   92d2c:      	movw	$0x0, -0x254(%rbp,%rcx)
   92d36:      	movw	$0x0, -0x252(%rbp,%rcx)
   92d40:      	addq	$0x10, %rcx
   92d44:      	cmpq	$0x200, %rcx            # imm = 0x200
   92d4b:      	jne	0x92cf0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1ab0>
   92d4d:      	jmp	0x92d4f <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1b0f>
   92d4f:      	movq	%rax, %rdi
   92d52:      	jmp	0x92dbc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1b7c>
   92d54:      	movq	%rax, %rdi
   92d57:      	xorl	%eax, %eax
   92d59:      	nopl	(%rax)
   92d60:      	movw	$0x0, -0x860(%rbp,%rax)
   92d6a:      	movw	$0x0, -0x85e(%rbp,%rax)
   92d74:      	movw	$0x0, -0x85c(%rbp,%rax)
   92d7e:      	movw	$0x0, -0x85a(%rbp,%rax)
   92d88:      	movw	$0x0, -0x858(%rbp,%rax)
   92d92:      	movw	$0x0, -0x856(%rbp,%rax)
   92d9c:      	movw	$0x0, -0x854(%rbp,%rax)
   92da6:      	movw	$0x0, -0x852(%rbp,%rax)
   92db0:      	addq	$0x10, %rax
   92db4:      	cmpq	$0x200, %rax            # imm = 0x200
   92dba:      	jne	0x92d60 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1b20>
   92dbc:      	xorl	%eax, %eax
   92dbe:      	nop
   92dc0:      	movw	$0x0, -0x1060(%rbp,%rax)
   92dca:      	movw	$0x0, -0x105e(%rbp,%rax)
   92dd4:      	movw	$0x0, -0x105c(%rbp,%rax)
   92dde:      	movw	$0x0, -0x105a(%rbp,%rax)
   92de8:      	movw	$0x0, -0x1058(%rbp,%rax)
   92df2:      	movw	$0x0, -0x1056(%rbp,%rax)
   92dfc:      	movw	$0x0, -0x1054(%rbp,%rax)
   92e06:      	movw	$0x0, -0x1052(%rbp,%rax)
   92e10:      	addq	$0x10, %rax
   92e14:      	cmpq	$0x200, %rax            # imm = 0x200
   92e1a:      	jne	0x92dc0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1b80>
   92e1c:      	xorl	%eax, %eax
   92e1e:      	nop
   92e20:      	movw	$0x0, -0xe60(%rbp,%rax)
   92e2a:      	movw	$0x0, -0xe5e(%rbp,%rax)
   92e34:      	movw	$0x0, -0xe5c(%rbp,%rax)
   92e3e:      	movw	$0x0, -0xe5a(%rbp,%rax)
   92e48:      	movw	$0x0, -0xe58(%rbp,%rax)
   92e52:      	movw	$0x0, -0xe56(%rbp,%rax)
   92e5c:      	movw	$0x0, -0xe54(%rbp,%rax)
   92e66:      	movw	$0x0, -0xe52(%rbp,%rax)
   92e70:      	addq	$0x10, %rax
   92e74:      	cmpq	$0x200, %rax            # imm = 0x200
   92e7a:      	jne	0x92e20 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1be0>
   92e7c:      	xorl	%eax, %eax
   92e7e:      	nop
   92e80:      	movw	$0x0, -0xc60(%rbp,%rax)
   92e8a:      	movw	$0x0, -0xc5e(%rbp,%rax)
   92e94:      	movw	$0x0, -0xc5c(%rbp,%rax)
   92e9e:      	movw	$0x0, -0xc5a(%rbp,%rax)
   92ea8:      	movw	$0x0, -0xc58(%rbp,%rax)
   92eb2:      	movw	$0x0, -0xc56(%rbp,%rax)
   92ebc:      	movw	$0x0, -0xc54(%rbp,%rax)
   92ec6:      	movw	$0x0, -0xc52(%rbp,%rax)
   92ed0:      	addq	$0x10, %rax
   92ed4:      	cmpq	$0x200, %rax            # imm = 0x200
   92eda:      	jne	0x92e80 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1c40>
   92edc:      	callq	0x105eb0 <_Unwind_Resume>
   92ee1:      	int3
   92ee2:      	int3
   92ee3:      	int3
   92ee4:      	int3
   92ee5:      	int3
   92ee6:      	int3
   92ee7:      	int3
   92ee8:      	int3
   92ee9:      	int3
   92eea:      	int3
   92eeb:      	int3
   92eec:      	int3
   92eed:      	int3
   92eee:      	int3
   92eef:      	int3

0000000000092ef0 <<toyos_crypto::mlkem::Poly>::ntt>:
   92ef0:      	pushq	%rbp
   92ef1:      	movq	%rsp, %rbp
   92ef4:      	pushq	%r15
   92ef6:      	pushq	%r14
   92ef8:      	pushq	%r13
   92efa:      	pushq	%r12
   92efc:      	pushq	%rbx
   92efd:      	subq	$0x58, %rsp
   92f01:      	movq	%rsi, %rbx
   92f04:      	movq	%rdi, -0x50(%rbp)
   92f08:      	movl	$0x80, %esi
   92f0d:      	movl	$0x1, %eax
   92f12:      	movq	%rax, -0x30(%rbp)
   92f16:      	movdqa	-0x8836e(%rip), %xmm0   # 0xabb0 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x3a0>
   92f1e:      	movdqa	-0x882d6(%rip), %xmm1   # 0xac50 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x440>
   92f26:      	pxor	%xmm2, %xmm2
   92f2a:      	movdqa	-0x88422(%rip), %xmm3   # 0xab10 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x300>
   92f32:      	jmp	0x92f5b <<toyos_crypto::mlkem::Poly>::ntt+0x6b>
   92f34:      	nopw	%cs:(%rax,%rax)
   92f40:      	movq	-0x58(%rbp), %rax
   92f44:      	movq	%rax, -0x30(%rbp)
   92f48:      	movq	%rsi, %rax
   92f4b:      	shrq	%rax
   92f4e:      	cmpq	$0x3, %rsi
   92f52:      	movq	%rax, %rsi
   92f55:      	jbe	0x934bf <<toyos_crypto::mlkem::Poly>::ntt+0x5cf>
   92f5b:      	leaq	(%rsi,%rsi), %rdx
   92f5f:      	tzcntq	%rdx, %rcx
   92f64:      	movl	$0x100, %r15d           # imm = 0x100
   92f6a:      	shrq	%cl, %r15
   92f6d:      	leal	-0x1(%rdx), %eax
   92f70:      	btl	$0x8, %eax
   92f74:      	adcq	$0x0, %r15
   92f78:      	je	0x92f48 <<toyos_crypto::mlkem::Poly>::ntt+0x58>
   92f7a:      	movq	-0x30(%rbp), %rax
   92f7e:      	addq	%r15, %rax
   92f81:      	movq	%rax, -0x58(%rbp)
   92f85:      	movq	%rdx, %rax
   92f88:      	negq	%rax
   92f8b:      	movq	%rax, -0x68(%rbp)
   92f8f:      	leaq	(%rbx,%rdx), %r13
   92f93:      	leaq	(%rbx,%rdx), %rax
   92f97:      	addq	$0x2, %rax
   92f9b:      	movq	%rax, -0x60(%rbp)
   92f9f:      	leaq	(%rbx,%rsi,2), %rcx
   92fa3:      	movq	%rsi, %rdi
   92fa6:      	negq	%rdi
   92fa9:      	movq	%rbx, %r14
   92fac:      	xorl	%r10d, %r10d
   92faf:      	movq	%rsi, %rax
   92fb2:      	movq	$0x0, -0x40(%rbp)
   92fba:      	nopw	(%rax,%rax)
   92fc0:      	cmpq	$0x101, %rax            # imm = 0x101
   92fc6:      	movl	$0x100, %r9d            # imm = 0x100
   92fcc:      	cmovaeq	%rax, %r9
   92fd0:      	movq	%rdi, -0x78(%rbp)
   92fd4:      	addq	%r9, %rdi
   92fd7:      	leaq	-0x1(%rsi), %r8
   92fdb:      	cmpq	%r8, %rdi
   92fde:      	cmovaeq	%r8, %rdi
   92fe2:      	movq	-0x68(%rbp), %rdx
   92fe6:      	movq	%r10, -0x48(%rbp)
   92fea:      	imulq	%r10, %rdx
   92fee:      	subq	%rsi, %rdx
   92ff1:      	addq	%r9, %rdx
   92ff4:      	cmpq	%r8, %rdx
   92ff7:      	movq	%r8, %r10
   92ffa:      	cmovbq	%rdx, %r10
   92ffe:      	cmovaeq	%r8, %rdx
   93002:      	movq	-0x30(%rbp), %r8
   93006:      	movl	%r8d, %r9d
   93009:      	rolb	$0x4, %r9b
   9300d:      	movl	%r9d, %r11d
   93010:      	andb	$0x33, %r11b
   93014:      	shlb	$0x2, %r11b
   93018:      	shrb	$0x2, %r9b
   9301c:      	andb	$0x33, %r9b
   93020:      	orb	%r11b, %r9b
   93023:      	movl	%r9d, %r11d
   93026:      	andb	$0x55, %r11b
   9302a:      	addb	%r11b, %r11b
   9302d:      	shrb	%r9b
   93030:      	andb	$0x54, %r9b
   93034:      	orb	%r11b, %r9b
   93037:      	shrb	%r9b
   9303a:      	movq	%rdi, -0x70(%rbp)
   9303e:      	je	0x930d0 <<toyos_crypto::mlkem::Poly>::ntt+0x1e0>
   93044:      	movq	%r15, -0x38(%rbp)
   93048:      	movzbl	%r9b, %r12d
   9304c:      	movw	$0x1, %r9w
   93051:      	movw	$0x11, %r11w
   93056:      	jmp	0x93084 <<toyos_crypto::mlkem::Poly>::ntt+0x194>
   93058:      	nopl	(%rax,%rax)
   93060:      	imull	%r11d, %r11d
   93064:      	movq	%r11, %r8
   93067:      	movl	$0x9d7dbb41, %r15d      # imm = 0x9D7DBB41
   9306d:      	imulq	%r15, %r8
   93071:      	shrq	$0x2b, %r8
   93075:      	imull	$0xd01, %r8d, %r8d      # imm = 0xD01
   9307c:      	subl	%r8d, %r11d
   9307f:      	shrl	%r12d
   93082:      	je	0x930c0 <<toyos_crypto::mlkem::Poly>::ntt+0x1d0>
   93084:      	movzwl	%r11w, %r11d
   93088:      	testb	$0x1, %r12b
   9308c:      	je	0x93060 <<toyos_crypto::mlkem::Poly>::ntt+0x170>
   9308e:      	movzwl	%r9w, %r9d
   93092:      	imull	%r11d, %r9d
   93096:      	imulq	$0x3afb7681, %r9, %r15  # imm = 0x3AFB7681
   9309d:      	shrq	$0x20, %r15
   930a1:      	movl	%r9d, %r8d
   930a4:      	subl	%r15d, %r8d
   930a7:      	shrl	%r8d
   930aa:      	addl	%r15d, %r8d
   930ad:      	shrl	$0xb, %r8d
   930b1:      	imull	$0xd01, %r8d, %r8d      # imm = 0xD01
   930b8:      	subl	%r8d, %r9d
   930bb:      	jmp	0x93060 <<toyos_crypto::mlkem::Poly>::ntt+0x170>
   930bd:      	nopl	(%rax)
   930c0:      	movzwl	%r9w, %r12d
   930c4:      	movq	-0x38(%rbp), %r15
   930c8:      	jmp	0x930d6 <<toyos_crypto::mlkem::Poly>::ntt+0x1e6>
   930ca:      	nopw	(%rax,%rax)
   930d0:      	movl	$0x1, %r12d
   930d6:      	incq	-0x30(%rbp)
   930da:      	movq	-0x40(%rbp), %rdi
   930de:      	je	0x934f8 <<toyos_crypto::mlkem::Poly>::ntt+0x608>
   930e4:      	movq	%rdi, %r9
   930e7:      	cmpq	$0x7, %r10
   930eb:      	jbe	0x933e3 <<toyos_crypto::mlkem::Poly>::ntt+0x4f3>
   930f1:      	leaq	(,%rsi,4), %r9
   930f9:      	imulq	-0x48(%rbp), %r9
   930fe:      	leaq	(%rbx,%r9), %r11
   93102:      	movq	%r10, -0x38(%rbp)
   93106:      	movq	%r15, %r10
   93109:      	leaq	(%r11,%rdx,2), %r15
   9310d:      	addq	$0x2, %r15
   93111:      	leaq	(%r9,%r13), %r8
   93115:      	cmpq	%r15, %r8
   93118:      	movq	%r10, %r15
   9311b:      	movq	-0x38(%rbp), %r10
   9311f:      	jae	0x93135 <<toyos_crypto::mlkem::Poly>::ntt+0x245>
   93121:      	addq	-0x60(%rbp), %r9
   93125:      	leaq	(%r9,%rdx,2), %rdx
   93129:      	movq	%rdi, %r9
   9312c:      	cmpq	%rdx, %r11
   9312f:      	jb	0x933e3 <<toyos_crypto::mlkem::Poly>::ntt+0x4f3>
   93135:      	incq	%r10
   93138:      	movl	%r10d, %edx
   9313b:      	andl	$0x7, %edx
   9313e:      	movl	$0x8, %r8d
   93144:      	cmoveq	%r8, %rdx
   93148:      	subq	%rdx, %r10
   9314b:      	movq	%r10, %r9
   9314e:      	addq	%rdi, %r9
   93151:      	movd	%r12d, %xmm4
   93156:      	pshufd	$0x0, %xmm4, %xmm4      # xmm4 = xmm4[0,0,0,0]
   9315b:      	movq	-0x70(%rbp), %rdi
   9315f:      	subq	%rdx, %rdi
   93162:      	incq	%rdi
   93165:      	pslld	$0x10, %xmm4
   9316a:      	psrad	$0x10, %xmm4
   9316f:      	packssdw	%xmm4, %xmm4
   93173:      	xorl	%r10d, %r10d
   93176:      	nopw	%cs:(%rax,%rax)
   93180:      	movdqu	(%rcx,%r10,2), %xmm5
   93186:      	movdqa	%xmm4, %xmm7
   9318a:      	pmulhuw	%xmm5, %xmm7
   9318e:      	pmullw	%xmm4, %xmm5
   93192:      	movdqa	%xmm5, %xmm6
   93196:      	punpcklwd	%xmm7, %xmm6    # xmm6 = xmm6[0],xmm7[0],xmm6[1],xmm7[1],xmm6[2],xmm7[2],xmm6[3],xmm7[3]
   9319a:      	punpckhwd	%xmm7, %xmm5    # xmm5 = xmm5[4],xmm7[4],xmm5[5],xmm7[5],xmm5[6],xmm7[6],xmm5[7],xmm7[7]
   9319e:      	movdqa	%xmm5, %xmm7
   931a2:      	pmuludq	%xmm0, %xmm7
   931a6:      	pshufd	$0xed, %xmm7, %xmm7     # xmm7 = xmm7[1,3,2,3]
   931ab:      	pshufd	$0xf5, %xmm5, %xmm8     # xmm8 = xmm5[1,1,3,3]
   931b1:      	pmuludq	%xmm0, %xmm8
   931b6:      	pshufd	$0xed, %xmm8, %xmm8     # xmm8 = xmm8[1,3,2,3]
   931bc:      	punpckldq	%xmm8, %xmm7    # xmm7 = xmm7[0],xmm8[0],xmm7[1],xmm8[1]
   931c1:      	movdqa	%xmm5, %xmm8
   931c6:      	psubd	%xmm7, %xmm8
   931cb:      	psrld	$0x1, %xmm8
   931d1:      	paddd	%xmm7, %xmm8
   931d6:      	psrld	$0xb, %xmm8
   931dc:      	pshufd	$0xf5, %xmm8, %xmm7     # xmm7 = xmm8[1,1,3,3]
   931e2:      	pmuludq	%xmm1, %xmm8
   931e7:      	pshufd	$0xe8, %xmm8, %xmm8     # xmm8 = xmm8[0,2,2,3]
   931ed:      	pmuludq	%xmm1, %xmm7
   931f1:      	pshufd	$0xe8, %xmm7, %xmm7     # xmm7 = xmm7[0,2,2,3]
   931f6:      	punpckldq	%xmm7, %xmm8    # xmm8 = xmm8[0],xmm7[0],xmm8[1],xmm7[1]
   931fb:      	psubd	%xmm8, %xmm5
   93200:      	movdqa	%xmm6, %xmm7
   93204:      	pmuludq	%xmm0, %xmm7
   93208:      	pshufd	$0xed, %xmm7, %xmm7     # xmm7 = xmm7[1,3,2,3]
   9320d:      	pshufd	$0xf5, %xmm6, %xmm8     # xmm8 = xmm6[1,1,3,3]
   93213:      	pmuludq	%xmm0, %xmm8
   93218:      	pshufd	$0xed, %xmm8, %xmm8     # xmm8 = xmm8[1,3,2,3]
   9321e:      	punpckldq	%xmm8, %xmm7    # xmm7 = xmm7[0],xmm8[0],xmm7[1],xmm8[1]
   93223:      	movdqa	%xmm6, %xmm8
   93228:      	psubd	%xmm7, %xmm8
   9322d:      	psrld	$0x1, %xmm8
   93233:      	paddd	%xmm7, %xmm8
   93238:      	psrld	$0xb, %xmm8
   9323e:      	pshufd	$0xf5, %xmm8, %xmm7     # xmm7 = xmm8[1,1,3,3]
   93244:      	pmuludq	%xmm1, %xmm8
   93249:      	pshufd	$0xe8, %xmm8, %xmm8     # xmm8 = xmm8[0,2,2,3]
   9324f:      	pmuludq	%xmm1, %xmm7
   93253:      	pshufd	$0xe8, %xmm7, %xmm7     # xmm7 = xmm7[0,2,2,3]
   93258:      	punpckldq	%xmm7, %xmm8    # xmm8 = xmm8[0],xmm7[0],xmm8[1],xmm7[1]
   9325d:      	psubd	%xmm8, %xmm6
   93262:      	movdqu	(%r14,%r10,2), %xmm7
   93268:      	movdqa	%xmm7, %xmm8
   9326d:      	punpckhwd	%xmm2, %xmm8    # xmm8 = xmm8[4],xmm2[4],xmm8[5],xmm2[5],xmm8[6],xmm2[6],xmm8[7],xmm2[7]
   93272:      	punpcklwd	%xmm2, %xmm7    # xmm7 = xmm7[0],xmm2[0],xmm7[1],xmm2[1],xmm7[2],xmm2[2],xmm7[3],xmm2[3]
   93276:      	movdqa	%xmm7, %xmm9
   9327b:      	psubd	%xmm6, %xmm9
   93280:      	paddd	%xmm1, %xmm9
   93285:      	movdqa	%xmm8, %xmm10
   9328a:      	psubd	%xmm5, %xmm10
   9328f:      	paddd	%xmm1, %xmm10
   93294:      	movdqa	%xmm10, %xmm11
   93299:      	pmuludq	%xmm0, %xmm11
   9329e:      	pshufd	$0xed, %xmm11, %xmm11   # xmm11 = xmm11[1,3,2,3]
   932a4:      	pshufd	$0xf5, %xmm10, %xmm12   # xmm12 = xmm10[1,1,3,3]
   932aa:      	pmuludq	%xmm0, %xmm12
   932af:      	pshufd	$0xed, %xmm12, %xmm12   # xmm12 = xmm12[1,3,2,3]
   932b5:      	punpckldq	%xmm12, %xmm11  # xmm11 = xmm11[0],xmm12[0],xmm11[1],xmm12[1]
   932ba:      	movdqa	%xmm10, %xmm12
   932bf:      	psubd	%xmm11, %xmm12
   932c4:      	psrld	$0x1, %xmm12
   932ca:      	paddd	%xmm11, %xmm12
   932cf:      	psrld	$0xb, %xmm12
   932d5:      	pshufd	$0xf5, %xmm12, %xmm11   # xmm11 = xmm12[1,1,3,3]
   932db:      	pmuludq	%xmm1, %xmm12
   932e0:      	pshufd	$0xe8, %xmm12, %xmm12   # xmm12 = xmm12[0,2,2,3]
   932e6:      	pmuludq	%xmm1, %xmm11
   932eb:      	pshufd	$0xe8, %xmm11, %xmm11   # xmm11 = xmm11[0,2,2,3]
   932f1:      	punpckldq	%xmm11, %xmm12  # xmm12 = xmm12[0],xmm11[0],xmm12[1],xmm11[1]
   932f6:      	psubd	%xmm12, %xmm10
   932fb:      	movdqa	%xmm9, %xmm11
   93300:      	pmuludq	%xmm0, %xmm11
   93305:      	pshufd	$0xed, %xmm11, %xmm11   # xmm11 = xmm11[1,3,2,3]
   9330b:      	pshufd	$0xf5, %xmm9, %xmm12    # xmm12 = xmm9[1,1,3,3]
   93311:      	pmuludq	%xmm0, %xmm12
   93316:      	pshufd	$0xed, %xmm12, %xmm12   # xmm12 = xmm12[1,3,2,3]
   9331c:      	punpckldq	%xmm12, %xmm11  # xmm11 = xmm11[0],xmm12[0],xmm11[1],xmm12[1]
   93321:      	movdqa	%xmm9, %xmm12
   93326:      	psubd	%xmm11, %xmm12
   9332b:      	psrld	$0x1, %xmm12
   93331:      	paddd	%xmm11, %xmm12
   93336:      	psrld	$0xb, %xmm12
   9333c:      	pshufd	$0xf5, %xmm12, %xmm11   # xmm11 = xmm12[1,1,3,3]
   93342:      	pmuludq	%xmm1, %xmm12
   93347:      	pshufd	$0xe8, %xmm12, %xmm12   # xmm12 = xmm12[0,2,2,3]
   9334d:      	pmuludq	%xmm1, %xmm11
   93352:      	pshufd	$0xe8, %xmm11, %xmm11   # xmm11 = xmm11[0,2,2,3]
   93358:      	punpckldq	%xmm11, %xmm12  # xmm12 = xmm12[0],xmm11[0],xmm12[1],xmm11[1]
   9335d:      	psubd	%xmm12, %xmm9
   93362:      	packssdw	%xmm10, %xmm9
   93367:      	movdqu	%xmm9, (%rcx,%r10,2)
   9336d:      	paddd	%xmm6, %xmm7
   93371:      	paddd	%xmm5, %xmm8
   93376:      	movdqa	%xmm8, %xmm5
   9337b:      	pmuludq	%xmm3, %xmm5
   9337f:      	pshufd	$0xed, %xmm5, %xmm5     # xmm5 = xmm5[1,3,2,3]
   93384:      	pshufd	$0xf5, %xmm8, %xmm6     # xmm6 = xmm8[1,1,3,3]
   9338a:      	pmuludq	%xmm3, %xmm6
   9338e:      	pshufd	$0xed, %xmm6, %xmm6     # xmm6 = xmm6[1,3,2,3]
   93393:      	punpckldq	%xmm6, %xmm5    # xmm5 = xmm5[0],xmm6[0],xmm5[1],xmm6[1]
   93397:      	pmaddwd	%xmm1, %xmm5
   9339b:      	psubd	%xmm5, %xmm8
   933a0:      	movdqa	%xmm7, %xmm5
   933a4:      	pmuludq	%xmm3, %xmm5
   933a8:      	pshufd	$0xed, %xmm5, %xmm5     # xmm5 = xmm5[1,3,2,3]
   933ad:      	pshufd	$0xf5, %xmm7, %xmm6     # xmm6 = xmm7[1,1,3,3]
   933b2:      	pmuludq	%xmm3, %xmm6
   933b6:      	pshufd	$0xed, %xmm6, %xmm6     # xmm6 = xmm6[1,3,2,3]
   933bb:      	punpckldq	%xmm6, %xmm5    # xmm5 = xmm5[0],xmm6[0],xmm5[1],xmm6[1]
   933bf:      	pmaddwd	%xmm1, %xmm5
   933c3:      	psubd	%xmm5, %xmm7
   933c7:      	packssdw	%xmm8, %xmm7
   933cc:      	movdqu	%xmm7, (%r14,%r10,2)
   933d2:      	addq	$0x8, %r10
   933d6:      	cmpq	%r10, %rdi
   933d9:      	jne	0x93180 <<toyos_crypto::mlkem::Poly>::ntt+0x290>
   933df:      	movq	-0x40(%rbp), %rdi
   933e3:      	leaq	(%rsi,%rsi), %r11
   933e7:      	addq	%r11, %rdi
   933ea:      	movq	%rdi, -0x40(%rbp)
   933ee:      	decq	%r15
   933f1:      	nopw	%cs:(%rax,%rax)
   93400:      	leaq	(%rsi,%r9), %rdi
   93404:      	cmpq	$0x100, %rdi            # imm = 0x100
   9340b:      	jae	0x934e5 <<toyos_crypto::mlkem::Poly>::ntt+0x5f5>
   93411:      	movzwl	(%r13,%r9,2), %edx
   93417:      	imull	%r12d, %edx
   9341b:      	imulq	$0x3afb7681, %rdx, %rdi # imm = 0x3AFB7681
   93422:      	shrq	$0x20, %rdi
   93426:      	movl	%edx, %r8d
   93429:      	subl	%edi, %r8d
   9342c:      	shrl	%r8d
   9342f:      	addl	%edi, %r8d
   93432:      	shrl	$0xb, %r8d
   93436:      	imull	$0xd01, %r8d, %edi      # imm = 0xD01
   9343d:      	subl	%edi, %edx
   9343f:      	movzwl	(%rbx,%r9,2), %edi
   93444:      	movl	%edi, %r8d
   93447:      	subl	%edx, %r8d
   9344a:      	addl	$0xd01, %r8d            # imm = 0xD01
   93451:      	imulq	$0x13afb8, %r8, %r10    # imm = 0x13AFB8
   93458:      	shrq	$0x20, %r10
   9345c:      	imull	$0xd01, %r10d, %r10d    # imm = 0xD01
   93463:      	subl	%r10d, %r8d
   93466:      	movw	%r8w, (%r13,%r9,2)
   9346c:      	addl	%edi, %edx
   9346e:      	imulq	$0x13afb8, %rdx, %rdi   # imm = 0x13AFB8
   93475:      	shrq	$0x20, %rdi
   93479:      	imull	$0xd01, %edi, %edi      # imm = 0xD01
   9347f:      	subl	%edi, %edx
   93481:      	movw	%dx, (%rbx,%r9,2)
   93486:      	incq	%r9
   93489:      	cmpq	%r9, %rax
   9348c:      	jne	0x93400 <<toyos_crypto::mlkem::Poly>::ntt+0x510>
   93492:      	addq	%r11, %rax
   93495:      	movq	-0x48(%rbp), %r10
   93499:      	incq	%r10
   9349c:      	movq	-0x78(%rbp), %rdi
   934a0:      	subq	%r11, %rdi
   934a3:      	leaq	(,%rsi,4), %rdx
   934ab:      	addq	%rdx, %rcx
   934ae:      	addq	%rdx, %r14
   934b1:      	testq	%r15, %r15
   934b4:      	jne	0x92fc0 <<toyos_crypto::mlkem::Poly>::ntt+0xd0>
   934ba:      	jmp	0x92f40 <<toyos_crypto::mlkem::Poly>::ntt+0x50>
   934bf:      	movl	$0x200, %edx            # imm = 0x200
   934c4:      	movq	-0x50(%rbp), %r14
   934c8:      	movq	%r14, %rdi
   934cb:      	movq	%rbx, %rsi
   934ce:      	callq	0x10fcc0 <memcpy>
   934d3:      	movq	%r14, %rax
   934d6:      	addq	$0x58, %rsp
   934da:      	popq	%rbx
   934db:      	popq	%r12
   934dd:      	popq	%r13
   934df:      	popq	%r14
   934e1:      	popq	%r15
   934e3:      	popq	%rbp
   934e4:      	retq
   934e5:      	leaq	0x804b4(%rip), %rdx     # 0x1139a0 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x1a8>
   934ec:      	movl	$0x100, %esi            # imm = 0x100
   934f1:      	callq	0x10b09d <core::panicking::panic_bounds_check>
   934f6:      	jmp	0x93504 <<toyos_crypto::mlkem::Poly>::ntt+0x614>
   934f8:      	leaq	0x80489(%rip), %rdi     # 0x113988 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x190>
   934ff:      	callq	0x10be70 <core::panicking::panic_const::panic_const_add_overflow>
   93504:      	ud2
   93506:      	xorl	%ecx, %ecx
   93508:      	nopl	(%rax,%rax)
   93510:      	movw	$0x0, (%rbx,%rcx)
   93516:      	movw	$0x0, 0x2(%rbx,%rcx)
   9351d:      	movw	$0x0, 0x4(%rbx,%rcx)
   93524:      	movw	$0x0, 0x6(%rbx,%rcx)
   9352b:      	movw	$0x0, 0x8(%rbx,%rcx)
   93532:      	movw	$0x0, 0xa(%rbx,%rcx)
   93539:      	movw	$0x0, 0xc(%rbx,%rcx)
   93540:      	movw	$0x0, 0xe(%rbx,%rcx)
   93547:      	addq	$0x10, %rcx
   9354b:      	cmpq	$0x200, %rcx            # imm = 0x200
   93552:      	jne	0x93510 <<toyos_crypto::mlkem::Poly>::ntt+0x620>
   93554:      	movq	%rax, %rdi
   93557:      	callq	0x105eb0 <_Unwind_Resume>
   9355c:      	int3
   9355d:      	int3
   9355e:      	int3
   9355f:      	int3

0000000000093560 <<toyos_crypto::mlkem::Poly>::encode>:
   93560:      	pushq	%rbp
   93561:      	movq	%rsp, %rbp
   93564:      	pushq	%r15
   93566:      	pushq	%r14
   93568:      	pushq	%r13
   9356a:      	pushq	%r12
   9356c:      	pushq	%rbx
   9356d:      	subq	$0x18, %rsp
   93571:      	movq	%rcx, -0x30(%rbp)
   93575:      	movq	%rsi, %rax
   93578:      	shrq	$0x3b, %rax
   9357c:      	jne	0x93689 <<toyos_crypto::mlkem::Poly>::encode+0x129>
   93582:      	movq	%rcx, %rbx
   93585:      	movq	%rsi, %r15
   93588:      	movq	%rsi, %rax
   9358b:      	shlq	$0x5, %rax
   9358f:      	movq	%rax, -0x38(%rbp)
   93593:      	cmpq	%rax, %rcx
   93596:      	jne	0x93665 <<toyos_crypto::mlkem::Poly>::encode+0x105>
   9359c:      	movq	%rdx, %r14
   9359f:      	movq	%rdi, %r12
   935a2:      	xorl	%r13d, %r13d
   935a5:      	movq	%rdx, %rdi
   935a8:      	movq	%rbx, %rsi
   935ab:      	xorl	%edx, %edx
   935ad:      	callq	0x10d0d0 <<[i8] as core::slice::specialize::SpecFill<i8>>::spec_fill>
   935b2:      	xorl	%esi, %esi
   935b4:      	jmp	0x935cf <<toyos_crypto::mlkem::Poly>::encode+0x6f>
   935b6:      	nopw	%cs:(%rax,%rax)
   935c0:      	incq	%r13
   935c3:      	addq	%r15, %rsi
   935c6:      	cmpq	$0x100, %r13            # imm = 0x100
   935cd:      	je	0x9362f <<toyos_crypto::mlkem::Poly>::encode+0xcf>
   935cf:      	testq	%r15, %r15
   935d2:      	je	0x935c0 <<toyos_crypto::mlkem::Poly>::encode+0x60>
   935d4:      	movq	%r13, %rax
   935d7:      	mulq	%r15
   935da:      	jo	0x9367d <<toyos_crypto::mlkem::Poly>::encode+0x11d>
   935e0:      	xorl	%ecx, %ecx
   935e2:      	nopw	%cs:(%rax,%rax)
   935f0:      	leaq	(%rsi,%rcx), %rdi
   935f4:      	cmpq	%rax, %rdi
   935f7:      	jb	0x9364a <<toyos_crypto::mlkem::Poly>::encode+0xea>
   935f9:      	cmpq	$0x10, %rcx
   935fd:      	je	0x9363e <<toyos_crypto::mlkem::Poly>::encode+0xde>
   935ff:      	shrq	$0x3, %rdi
   93603:      	cmpq	%rbx, %rdi
   93606:      	jae	0x93656 <<toyos_crypto::mlkem::Poly>::encode+0xf6>
   93608:      	leaq	0x1(%rcx), %rdx
   9360c:      	movzwl	(%r12,%r13,2), %r8d
   93611:      	btl	%ecx, %r8d
   93615:      	setb	%r8b
   93619:      	addl	%esi, %ecx
   9361b:      	andb	$0x7, %cl
   9361e:      	shlb	%cl, %r8b
   93621:      	orb	%r8b, (%r14,%rdi)
   93625:      	movq	%rdx, %rcx
   93628:      	cmpq	%rdx, %r15
   9362b:      	jne	0x935f0 <<toyos_crypto::mlkem::Poly>::encode+0x90>
   9362d:      	jmp	0x935c0 <<toyos_crypto::mlkem::Poly>::encode+0x60>
   9362f:      	addq	$0x18, %rsp
   93633:      	popq	%rbx
   93634:      	popq	%r12
   93636:      	popq	%r13
   93638:      	popq	%r14
   9363a:      	popq	%r15
   9363c:      	popq	%rbp
   9363d:      	retq
   9363e:      	leaq	0x803bb(%rip), %rdi     # 0x113a00 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x208>
   93645:      	callq	0x10bed0 <core::panicking::panic_const::panic_const_shr_overflow>
   9364a:      	leaq	0x80397(%rip), %rdi     # 0x1139e8 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x1f0>
   93651:      	callq	0x10be70 <core::panicking::panic_const::panic_const_add_overflow>
   93656:      	leaq	0x803bb(%rip), %rdx     # 0x113a18 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x220>
   9365d:      	movq	%rbx, %rsi
   93660:      	callq	0x10b09d <core::panicking::panic_bounds_check>
   93665:      	leaq	0x80364(%rip), %r9      # 0x1139d0 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x1d8>
   9366c:      	leaq	-0x30(%rbp), %rsi
   93670:      	leaq	-0x38(%rbp), %rdx
   93674:      	xorl	%edi, %edi
   93676:      	xorl	%ecx, %ecx
   93678:      	callq	0x1081d7 <core::panicking::assert_failed::<usize, usize>>
   9367d:      	leaq	0x80364(%rip), %rdi     # 0x1139e8 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x1f0>
   93684:      	callq	0x10be90 <core::panicking::panic_const::panic_const_mul_overflow>
   93689:      	leaq	0x80328(%rip), %rdi     # 0x1139b8 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x1c0>
   93690:      	callq	0x10be90 <core::panicking::panic_const::panic_const_mul_overflow>
   93695:      	int3
   93696:      	int3
   93697:      	int3
   93698:      	int3
   93699:      	int3
   9369a:      	int3
   9369b:      	int3
   9369c:      	int3
   9369d:      	int3
   9369e:      	int3
   9369f:      	int3

00000000000936a0 <<toyos_crypto::mlkem::Poly>::inverse>:
   936a0:      	pushq	%rbp
   936a1:      	movq	%rsp, %rbp
   936a4:      	pushq	%r15
   936a6:      	pushq	%r14
   936a8:      	pushq	%r13
   936aa:      	pushq	%r12
   936ac:      	pushq	%rbx
   936ad:      	subq	$0x18, %rsp
   936b1:      	movq	%rsi, %rbx
   936b4:      	movq	%rdi, -0x38(%rbp)
   936b8:      	movl	$0x2, %edx
   936bd:      	movl	$0x7f, %eax
   936c2:      	movl	$0x9d7dbb41, %esi       # imm = 0x9D7DBB41
   936c7:      	jmp	0x936da <<toyos_crypto::mlkem::Poly>::inverse+0x3a>
   936c9:      	nopl	(%rax)
   936d0:      	cmpq	$0x41, %r8
   936d4:      	jae	0x938ac <<toyos_crypto::mlkem::Poly>::inverse+0x20c>
   936da:      	movq	%rdx, %r8
   936dd:      	addq	%rdx, %rdx
   936e0:      	tzcntl	%edx, %ecx
   936e4:      	movl	$0x100, %edi            # imm = 0x100
   936e9:      	shrl	%cl, %edi
   936eb:      	leal	-0x1(%rdx), %ecx
   936ee:      	btl	$0x8, %ecx
   936f2:      	adcq	$0x0, %rdi
   936f6:      	movq	%rdi, -0x30(%rbp)
   936fa:      	je	0x936d0 <<toyos_crypto::mlkem::Poly>::inverse+0x30>
   936fc:      	leaq	(%rbx,%rdx), %rcx
   93700:      	movq	%rbx, %r11
   93703:      	movq	%r8, %r15
   93706:      	xorl	%r12d, %r12d
   93709:      	nopl	(%rax)
   93710:      	movl	%eax, %edi
   93712:      	rolb	$0x4, %dil
   93716:      	movl	%edi, %r10d
   93719:      	andb	$0x33, %r10b
   9371d:      	shlb	$0x2, %r10b
   93721:      	shrb	$0x2, %dil
   93725:      	andb	$0x33, %dil
   93729:      	orb	%r10b, %dil
   9372c:      	movl	%edi, %r10d
   9372f:      	andb	$0x55, %r10b
   93733:      	addb	%r10b, %r10b
   93736:      	shrb	%dil
   93739:      	andb	$0x54, %dil
   9373d:      	orb	%r10b, %dil
   93740:      	shrb	%dil
   93743:      	je	0x937c0 <<toyos_crypto::mlkem::Poly>::inverse+0x120>
   93745:      	movzbl	%dil, %r14d
   93749:      	movw	$0x1, %di
   9374d:      	movw	$0x11, %r13w
   93752:      	jmp	0x9377d <<toyos_crypto::mlkem::Poly>::inverse+0xdd>
   93754:      	nopw	%cs:(%rax,%rax)
   93760:      	imull	%r13d, %r13d
   93764:      	movq	%r13, %rdx
   93767:      	imulq	%rsi, %rdx
   9376b:      	shrq	$0x2b, %rdx
   9376f:      	imull	$0xd01, %edx, %edx      # imm = 0xD01
   93775:      	subl	%edx, %r13d
   93778:      	shrl	%r14d
   9377b:      	je	0x937b0 <<toyos_crypto::mlkem::Poly>::inverse+0x110>
   9377d:      	movzwl	%r13w, %r13d
   93781:      	testb	$0x1, %r14b
   93785:      	je	0x93760 <<toyos_crypto::mlkem::Poly>::inverse+0xc0>
   93787:      	movzwl	%di, %edi
   9378a:      	imull	%r13d, %edi
   9378e:      	imulq	$0x3afb7681, %rdi, %r10 # imm = 0x3AFB7681
   93795:      	shrq	$0x20, %r10
   93799:      	movl	%edi, %edx
   9379b:      	subl	%r10d, %edx
   9379e:      	shrl	%edx
   937a0:      	addl	%r10d, %edx
   937a3:      	shrl	$0xb, %edx
   937a6:      	imull	$0xd01, %edx, %edx      # imm = 0xD01
   937ac:      	subl	%edx, %edi
   937ae:      	jmp	0x93760 <<toyos_crypto::mlkem::Poly>::inverse+0xc0>
   937b0:      	movzwl	%di, %r14d
   937b4:      	subq	$0x1, %rax
   937b8:      	jae	0x937d0 <<toyos_crypto::mlkem::Poly>::inverse+0x130>
   937ba:      	jmp	0x939ca <<toyos_crypto::mlkem::Poly>::inverse+0x32a>
   937bf:      	nop
   937c0:      	movl	$0x1, %r14d
   937c6:      	subq	$0x1, %rax
   937ca:      	jb	0x939ca <<toyos_crypto::mlkem::Poly>::inverse+0x32a>
   937d0:      	leaq	(%r8,%r8), %rdx
   937d4:      	addq	%r12, %rdx
   937d7:      	movq	%rdx, -0x40(%rbp)
   937db:      	decq	-0x30(%rbp)
   937df:      	xorl	%r10d, %r10d
   937e2:      	nopw	%cs:(%rax,%rax)
   937f0:      	leaq	(%r12,%r10), %rdi
   937f4:      	cmpq	$0xff, %rdi
   937fb:      	ja	0x939b7 <<toyos_crypto::mlkem::Poly>::inverse+0x317>
   93801:      	leaq	(%r15,%r10), %rdi
   93805:      	cmpq	$0x100, %rdi            # imm = 0x100
   9380c:      	jae	0x939ae <<toyos_crypto::mlkem::Poly>::inverse+0x30e>
   93812:      	movzwl	(%r11,%r10,2), %edx
   93817:      	movzwl	(%rcx,%r10,2), %edi
   9381c:      	leal	(%rdi,%rdx), %r9d
   93820:      	imulq	$0x13afb8, %r9, %r13    # imm = 0x13AFB8
   93827:      	shrq	$0x20, %r13
   9382b:      	imull	$0xd01, %r13d, %r13d    # imm = 0xD01
   93832:      	subl	%r13d, %r9d
   93835:      	movw	%r9w, (%r11,%r10,2)
   9383a:      	addl	$0xd01, %edi            # imm = 0xD01
   93840:      	subl	%edx, %edi
   93842:      	jb	0x939a0 <<toyos_crypto::mlkem::Poly>::inverse+0x300>
   93848:      	imulq	$0x13afb8, %rdi, %rdx   # imm = 0x13AFB8
   9384f:      	shrq	$0x20, %rdx
   93853:      	imull	$0xd01, %edx, %edx      # imm = 0xD01
   93859:      	subl	%edx, %edi
   9385b:      	imull	%r14d, %edi
   9385f:      	imulq	$0x13afb769, %rdi, %rdx # imm = 0x13AFB769
   93866:      	shrq	$0x28, %rdx
   9386a:      	imull	$0xd01, %edx, %edx      # imm = 0xD01
   93870:      	subl	%edx, %edi
   93872:      	movw	%di, (%rcx,%r10,2)
   93877:      	incq	%r10
   9387a:      	cmpq	%r10, %r8
   9387d:      	jne	0x937f0 <<toyos_crypto::mlkem::Poly>::inverse+0x150>
   93883:      	leaq	(%r8,%r8), %rdx
   93887:      	addq	%rdx, %r15
   9388a:      	leaq	(,%r8,4), %rdi
   93892:      	addq	%rdi, %rcx
   93895:      	addq	%rdi, %r11
   93898:      	movq	-0x40(%rbp), %r12
   9389c:      	cmpq	$0x0, -0x30(%rbp)
   938a1:      	jne	0x93710 <<toyos_crypto::mlkem::Poly>::inverse+0x70>
   938a7:      	jmp	0x936d0 <<toyos_crypto::mlkem::Poly>::inverse+0x30>
   938ac:      	xorl	%eax, %eax
   938ae:      	movdqa	-0x88c56(%rip), %xmm0   # 0xac60 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x450>
   938b6:      	movdqa	-0x88cfe(%rip), %xmm1   # 0xabc0 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x3b0>
   938be:      	movdqa	-0x88c76(%rip), %xmm2   # 0xac50 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x440>
   938c6:      	nopw	%cs:(%rax,%rax)
   938d0:      	movdqu	(%rbx,%rax,2), %xmm3
   938d5:      	movdqa	%xmm3, %xmm5
   938d9:      	pmulhuw	%xmm0, %xmm5
   938dd:      	pmullw	%xmm0, %xmm3
   938e1:      	movdqa	%xmm3, %xmm4
   938e5:      	punpcklwd	%xmm5, %xmm4    # xmm4 = xmm4[0],xmm5[0],xmm4[1],xmm5[1],xmm4[2],xmm5[2],xmm4[3],xmm5[3]
   938e9:      	punpckhwd	%xmm5, %xmm3    # xmm3 = xmm3[4],xmm5[4],xmm3[5],xmm5[5],xmm3[6],xmm5[6],xmm3[7],xmm5[7]
   938ed:      	pshufd	$0xf5, %xmm3, %xmm5     # xmm5 = xmm3[1,1,3,3]
   938f2:      	pmuludq	%xmm1, %xmm5
   938f6:      	psrlq	$0x28, %xmm5
   938fb:      	pmuludq	%xmm2, %xmm5
   938ff:      	pshufd	$0xe8, %xmm5, %xmm5     # xmm5 = xmm5[0,2,2,3]
   93904:      	movdqa	%xmm3, %xmm6
   93908:      	pmuludq	%xmm1, %xmm6
   9390c:      	pshufd	$0xf5, %xmm6, %xmm6     # xmm6 = xmm6[1,1,3,3]
   93911:      	psrld	$0x8, %xmm6
   93916:      	pmuludq	%xmm2, %xmm6
   9391a:      	pshufd	$0xe8, %xmm6, %xmm6     # xmm6 = xmm6[0,2,2,3]
   9391f:      	punpckldq	%xmm5, %xmm6    # xmm6 = xmm6[0],xmm5[0],xmm6[1],xmm5[1]
   93923:      	psubd	%xmm6, %xmm3
   93927:      	pshufd	$0xf5, %xmm4, %xmm5     # xmm5 = xmm4[1,1,3,3]
   9392c:      	pmuludq	%xmm1, %xmm5
   93930:      	psrlq	$0x28, %xmm5
   93935:      	pmuludq	%xmm2, %xmm5
   93939:      	pshufd	$0xe8, %xmm5, %xmm5     # xmm5 = xmm5[0,2,2,3]
   9393e:      	movdqa	%xmm4, %xmm6
   93942:      	pmuludq	%xmm1, %xmm6
   93946:      	pshufd	$0xf5, %xmm6, %xmm6     # xmm6 = xmm6[1,1,3,3]
   9394b:      	psrld	$0x8, %xmm6
   93950:      	pmuludq	%xmm2, %xmm6
   93954:      	pshufd	$0xe8, %xmm6, %xmm6     # xmm6 = xmm6[0,2,2,3]
   93959:      	punpckldq	%xmm5, %xmm6    # xmm6 = xmm6[0],xmm5[0],xmm6[1],xmm5[1]
   9395d:      	psubd	%xmm6, %xmm4
   93961:      	packssdw	%xmm3, %xmm4
   93965:      	movdqu	%xmm4, (%rbx,%rax,2)
   9396a:      	addq	$0x8, %rax
   9396e:      	cmpq	$0x100, %rax            # imm = 0x100
   93974:      	jne	0x938d0 <<toyos_crypto::mlkem::Poly>::inverse+0x230>
   9397a:      	movl	$0x200, %edx            # imm = 0x200
   9397f:      	movq	-0x38(%rbp), %r14
   93983:      	movq	%r14, %rdi
   93986:      	movq	%rbx, %rsi
   93989:      	callq	0x10fcc0 <memcpy>
   9398e:      	movq	%r14, %rax
   93991:      	addq	$0x18, %rsp
   93995:      	popq	%rbx
   93996:      	popq	%r12
   93998:      	popq	%r13
   9399a:      	popq	%r14
   9399c:      	popq	%r15
   9399e:      	popq	%rbp
   9399f:      	retq
   939a0:      	leaq	0x800d1(%rip), %rdi     # 0x113a78 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x280>
   939a7:      	callq	0x10bef0 <core::panicking::panic_const::panic_const_sub_overflow>
   939ac:      	jmp	0x939d6 <<toyos_crypto::mlkem::Poly>::inverse+0x336>
   939ae:      	leaq	0x800ab(%rip), %rdx     # 0x113a60 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x268>
   939b5:      	jmp	0x939be <<toyos_crypto::mlkem::Poly>::inverse+0x31e>
   939b7:      	leaq	0x8008a(%rip), %rdx     # 0x113a48 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x250>
   939be:      	movl	$0x100, %esi            # imm = 0x100
   939c3:      	callq	0x10b09d <core::panicking::panic_bounds_check>
   939c8:      	jmp	0x939d6 <<toyos_crypto::mlkem::Poly>::inverse+0x336>
   939ca:      	leaq	0x8005f(%rip), %rdi     # 0x113a30 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x238>
   939d1:      	callq	0x10bef0 <core::panicking::panic_const::panic_const_sub_overflow>
   939d6:      	ud2
   939d8:      	xorl	%ecx, %ecx
   939da:      	nopw	(%rax,%rax)
   939e0:      	movw	$0x0, (%rbx,%rcx)
   939e6:      	movw	$0x0, 0x2(%rbx,%rcx)
   939ed:      	movw	$0x0, 0x4(%rbx,%rcx)
   939f4:      	movw	$0x0, 0x6(%rbx,%rcx)
   939fb:      	movw	$0x0, 0x8(%rbx,%rcx)
   93a02:      	movw	$0x0, 0xa(%rbx,%rcx)
   93a09:      	movw	$0x0, 0xc(%rbx,%rcx)
   93a10:      	movw	$0x0, 0xe(%rbx,%rcx)
   93a17:      	addq	$0x10, %rcx
   93a1b:      	cmpq	$0x200, %rcx            # imm = 0x200
   93a22:      	jne	0x939e0 <<toyos_crypto::mlkem::Poly>::inverse+0x340>
   93a24:      	movq	%rax, %rdi
   93a27:      	callq	0x105eb0 <_Unwind_Resume>
   93a2c:      	int3
   93a2d:      	int3
   93a2e:      	int3
   93a2f:      	int3

0000000000093a30 <toyos_crypto::mlkem::noise>:
   93a30:      	pushq	%rbp
   93a31:      	movq	%rsp, %rbp
   93a34:      	pushq	%r15
   93a36:      	pushq	%r14
   93a38:      	pushq	%rbx
   93a39:      	subq	$0x2a8, %rsp            # imm = 0x2A8
   93a40:      	movq	%rdi, %rbx
   93a43:      	xorps	%xmm0, %xmm0
   93a46:      	movaps	%xmm0, -0x50(%rbp)
   93a4a:      	movaps	%xmm0, -0x60(%rbp)
   93a4e:      	movaps	%xmm0, -0x70(%rbp)
   93a52:      	movaps	%xmm0, -0x80(%rbp)
   93a56:      	movaps	%xmm0, -0x90(%rbp)
   93a5d:      	movaps	%xmm0, -0xa0(%rbp)
   93a64:      	movaps	%xmm0, -0xb0(%rbp)
   93a6b:      	movaps	%xmm0, -0xc0(%rbp)
   93a72:      	movb	%dl, -0x19(%rbp)
   93a75:      	movq	%rsi, -0x40(%rbp)
   93a79:      	movq	$0x20, -0x38(%rbp)
   93a81:      	leaq	-0x19(%rbp), %rax
   93a85:      	movq	%rax, -0x30(%rbp)
   93a89:      	movq	$0x1, -0x28(%rbp)
   93a91:      	leaq	-0x2c0(%rbp), %rdi
   93a98:      	leaq	-0x40(%rbp), %rcx
   93a9c:      	movl	$0x88, %esi
   93aa1:      	movl	$0x2, %r8d
   93aa7:      	movl	$0x1f, %edx
   93aac:      	callq	0x9c140 <<toyos_crypto::keccak::Sponge>::new>
   93ab1:      	movq	-0x1f0(%rbp), %rax
   93ab8:      	xorl	%r15d, %r15d
   93abb:      	leaq	-0x2c0(%rbp), %r14
   93ac2:      	jmp	0x93b15 <toyos_crypto::mlkem::noise+0xe5>
   93ac4:      	nopw	%cs:(%rax,%rax)
   93ad0:      	movq	%rax, %rdi
   93ad3:      	shrq	$0x3, %rdi
   93ad7:      	cmpq	$0xc8, %rax
   93add:      	jae	0x93f75 <toyos_crypto::mlkem::noise+0x545>
   93ae3:      	leaq	-0x2c0(,%rdi,8), %rcx
   93aeb:      	addq	%rbp, %rcx
   93aee:      	movl	%eax, %edx
   93af0:      	andl	$0x7, %edx
   93af3:      	movzbl	(%rdx,%rcx), %ecx
   93af7:      	movb	%cl, -0xc0(%rbp,%r15)
   93aff:      	incq	%r15
   93b02:      	incq	%rax
   93b05:      	movq	%rax, -0x1f0(%rbp)
   93b0c:      	cmpq	$0x80, %r15
   93b13:      	je	0x93b37 <toyos_crypto::mlkem::noise+0x107>
   93b15:      	cmpq	-0x1f8(%rbp), %rax
   93b1c:      	jne	0x93ad0 <toyos_crypto::mlkem::noise+0xa0>
   93b1e:      	movq	%r14, %rdi
   93b21:      	callq	0x9c3c0 <<toyos_crypto::keccak::Sponge>::permute (.llvm.2207912294309834671)>
   93b26:      	movq	$0x0, -0x1f0(%rbp)
   93b31:      	xorl	%edi, %edi
   93b33:      	xorl	%eax, %eax
   93b35:      	jmp	0x93ae3 <toyos_crypto::mlkem::noise+0xb3>
   93b37:      	movq	$0x0, -0x2c0(%rbp)
   93b42:      	movq	$0x0, -0x2b8(%rbp)
   93b4d:      	movq	$0x0, -0x2b0(%rbp)
   93b58:      	movq	$0x0, -0x2a8(%rbp)
   93b63:      	movq	$0x0, -0x2a0(%rbp)
   93b6e:      	movq	$0x0, -0x298(%rbp)
   93b79:      	movq	$0x0, -0x290(%rbp)
   93b84:      	movq	$0x0, -0x288(%rbp)
   93b8f:      	movq	$0x0, -0x280(%rbp)
   93b9a:      	movq	$0x0, -0x278(%rbp)
   93ba5:      	movq	$0x0, -0x270(%rbp)
   93bb0:      	movq	$0x0, -0x268(%rbp)
   93bbb:      	movq	$0x0, -0x260(%rbp)
   93bc6:      	movq	$0x0, -0x258(%rbp)
   93bd1:      	movq	$0x0, -0x250(%rbp)
   93bdc:      	movq	$0x0, -0x248(%rbp)
   93be7:      	movq	$0x0, -0x240(%rbp)
   93bf2:      	movq	$0x0, -0x238(%rbp)
   93bfd:      	movq	$0x0, -0x230(%rbp)
   93c08:      	movq	$0x0, -0x228(%rbp)
   93c13:      	movq	$0x0, -0x220(%rbp)
   93c1e:      	movq	$0x0, -0x218(%rbp)
   93c29:      	movq	$0x0, -0x210(%rbp)
   93c34:      	movq	$0x0, -0x208(%rbp)
   93c3f:      	movq	$0x0, -0x200(%rbp)
   93c4a:      	leaq	-0x2c0(%rbp), %rdi
   93c51:      	xorl	%r14d, %r14d
   93c54:      	movl	$0x200, %edx            # imm = 0x200
   93c59:      	xorl	%esi, %esi
   93c5b:      	callq	0x1101f0 <memset>
   93c60:      	movq	-0x892c8(%rip), %xmm0   # 0xa9a0 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x190>
   93c68:      	leaq	-0xbd(%rbp), %rax
   93c6f:      	pxor	%xmm2, %xmm2
   93c73:      	movdqa	-0x895bb(%rip), %xmm5   # 0xa6c0 <anon.06a5d9ca6d216076d14f4792906d843c.6.llvm.5360783310085923784+0x223>
   93c7b:      	movdqa	-0x89573(%rip), %xmm6   # 0xa710 <anon.06a5d9ca6d216076d14f4792906d843c.6.llvm.5360783310085923784+0x273>
   93c83:      	movdqa	-0x8903b(%rip), %xmm7   # 0xac50 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x440>
   93c8b:      	movdqa	-0x894a4(%rip), %xmm8   # 0xa7f0 <anon.06a5d9ca6d216076d14f4792906d843c.6.llvm.5360783310085923784+0x353>
   93c94:      	movdqa	-0x8901d(%rip), %xmm9   # 0xac80 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x470>
   93c9d:      	movdqa	-0x88fe5(%rip), %xmm3   # 0xacc0 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x4b0>
   93ca5:      	movdqa	-0x895fe(%rip), %xmm11  # 0xa6b0 <anon.06a5d9ca6d216076d14f4792906d843c.6.llvm.5360783310085923784+0x213>
   93cae:      	nop
   93cb0:      	movzbl	-0x3(%rax), %ecx
   93cb4:      	movzbl	-0x2(%rax), %edx
   93cb8:      	movzbl	-0x1(%rax), %esi
   93cbc:      	movl	%esi, %edi
   93cbe:      	shll	$0x8, %edi
   93cc1:      	movl	%ecx, %r8d
   93cc4:      	shll	$0x8, %r8d
   93cc8:      	orl	%esi, %edi
   93cca:      	orl	%ecx, %r8d
   93ccd:      	movl	%edx, %ecx
   93ccf:      	shll	$0x10, %ecx
   93cd2:      	orl	%r8d, %ecx
   93cd5:      	shll	$0x18, %edx
   93cd8:      	orl	%ecx, %edx
   93cda:      	movzbl	(%rax), %ecx
   93cdd:      	movd	%edx, %xmm12
   93ce2:      	movl	%ecx, %edx
   93ce4:      	shll	$0x8, %edx
   93ce7:      	pinsrw	$0x2, %edi, %xmm12
   93ced:      	movdqa	%xmm0, %xmm13
   93cf2:      	psllw	$0x7, %xmm13
   93cf8:      	pand	-0x89091(%rip), %xmm13  # 0xac70 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x460>
   93d01:      	orl	%ecx, %edx
   93d03:      	pxor	%xmm14, %xmm14
   93d08:      	pcmpgtb	%xmm13, %xmm14
   93d0d:      	pinsrw	$0x3, %edx, %xmm12
   93d13:      	movdqa	%xmm14, %xmm15
   93d18:      	pandn	%xmm12, %xmm15
   93d1d:      	psrlw	$0x4, %xmm12
   93d23:      	pand	%xmm14, %xmm12
   93d28:      	pand	-0x89631(%rip), %xmm12  # 0xa700 <anon.06a5d9ca6d216076d14f4792906d843c.6.llvm.5360783310085923784+0x263>
   93d31:      	paddb	%xmm13, %xmm13
   93d36:      	pxor	%xmm14, %xmm14
   93d3b:      	por	%xmm15, %xmm12
   93d40:      	pcmpgtb	%xmm13, %xmm14
   93d45:      	movdqa	%xmm14, %xmm15
   93d4a:      	pandn	%xmm12, %xmm15
   93d4f:      	psrlw	$0x2, %xmm12
   93d55:      	pand	%xmm14, %xmm12
   93d5a:      	pand	-0x89023(%rip), %xmm12  # 0xad40 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x530>
   93d63:      	paddb	%xmm13, %xmm13
   93d68:      	por	%xmm15, %xmm12
   93d6d:      	pxor	%xmm14, %xmm14
   93d72:      	pcmpgtb	%xmm13, %xmm14
   93d77:      	movdqa	%xmm14, %xmm13
   93d7c:      	pandn	%xmm12, %xmm13
   93d81:      	psrlw	$0x1, %xmm12
   93d87:      	pand	%xmm14, %xmm12
   93d8c:      	pand	%xmm5, %xmm12
   93d91:      	por	%xmm13, %xmm12
   93d96:      	movdqa	%xmm12, %xmm14
   93d9b:      	pand	%xmm6, %xmm14
   93da0:      	movdqa	%xmm12, %xmm13
   93da5:      	psrlw	$0x1, %xmm13
   93dab:      	pand	%xmm6, %xmm13
   93db0:      	paddb	%xmm14, %xmm13
   93db5:      	punpcklbw	%xmm2, %xmm13   # xmm13 = xmm13[0],xmm2[0],xmm13[1],xmm2[1],xmm13[2],xmm2[2],xmm13[3],xmm2[3],xmm13[4],xmm2[4],xmm13[5],xmm2[5],xmm13[6],xmm2[6],xmm13[7],xmm2[7]
   93dba:      	movdqa	%xmm13, %xmm14
   93dbf:      	movdqa	%xmm12, %xmm15
   93dc4:      	psrlw	$0x2, %xmm15
   93dca:      	pand	%xmm6, %xmm15
   93dcf:      	punpcklwd	%xmm2, %xmm13   # xmm13 = xmm13[0],xmm2[0],xmm13[1],xmm2[1],xmm13[2],xmm2[2],xmm13[3],xmm2[3]
   93dd4:      	psrlw	$0x3, %xmm12
   93dda:      	pand	%xmm6, %xmm12
   93ddf:      	paddb	%xmm15, %xmm12
   93de4:      	punpckhwd	%xmm2, %xmm14   # xmm14 = xmm14[4],xmm2[4],xmm14[5],xmm2[5],xmm14[6],xmm2[6],xmm14[7],xmm2[7]
   93de9:      	punpcklbw	%xmm2, %xmm12   # xmm12 = xmm12[0],xmm2[0],xmm12[1],xmm2[1],xmm12[2],xmm2[2],xmm12[3],xmm2[3],xmm12[4],xmm2[4],xmm12[5],xmm2[5],xmm12[6],xmm2[6],xmm12[7],xmm2[7]
   93dee:      	movdqa	%xmm12, %xmm15
   93df3:      	punpckhwd	%xmm2, %xmm15   # xmm15 = xmm15[4],xmm2[4],xmm15[5],xmm2[5],xmm15[6],xmm2[6],xmm15[7],xmm2[7]
   93df8:      	psubd	%xmm15, %xmm14
   93dfd:      	punpcklwd	%xmm2, %xmm12   # xmm12 = xmm12[0],xmm2[0],xmm12[1],xmm2[1],xmm12[2],xmm2[2],xmm12[3],xmm2[3]
   93e02:      	psubd	%xmm12, %xmm13
   93e07:      	movdqa	%xmm13, %xmm12
   93e0c:      	paddd	%xmm7, %xmm12
   93e11:      	movdqa	%xmm14, %xmm15
   93e16:      	paddd	%xmm7, %xmm15
   93e1b:      	movdqa	%xmm15, %xmm1
   93e20:      	pxor	%xmm9, %xmm1
   93e25:      	movdqa	%xmm3, %xmm10
   93e2a:      	movdqa	%xmm12, %xmm4
   93e2f:      	pxor	%xmm9, %xmm4
   93e34:      	pcmpgtd	%xmm1, %xmm10
   93e39:      	movdqa	%xmm3, %xmm1
   93e3d:      	pcmpgtd	%xmm4, %xmm1
   93e41:      	paddd	%xmm8, %xmm13
   93e46:      	pand	%xmm1, %xmm12
   93e4b:      	pandn	%xmm13, %xmm1
   93e50:      	por	%xmm12, %xmm1
   93e55:      	paddd	%xmm8, %xmm14
   93e5a:      	pand	%xmm10, %xmm15
   93e5f:      	pandn	%xmm14, %xmm10
   93e64:      	por	%xmm15, %xmm10
   93e69:      	pslld	$0x10, %xmm10
   93e6f:      	psrad	$0x10, %xmm10
   93e75:      	pslld	$0x10, %xmm1
   93e7a:      	psrad	$0x10, %xmm1
   93e7f:      	packssdw	%xmm10, %xmm1
   93e84:      	movdqu	%xmm1, -0x2c0(%rbp,%r14,2)
   93e8e:      	addq	$0x8, %r14
   93e92:      	paddb	%xmm11, %xmm0
   93e97:      	addq	$0x4, %rax
   93e9b:      	cmpq	$0x100, %r14            # imm = 0x100
   93ea2:      	jne	0x93cb0 <toyos_crypto::mlkem::noise+0x280>
   93ea8:      	leaq	-0x2c0(%rbp), %rsi
   93eaf:      	movl	$0x200, %edx            # imm = 0x200
   93eb4:      	movq	%rbx, %rdi
   93eb7:      	callq	0x10fcc0 <memcpy>
   93ebc:      	pxor	%xmm0, %xmm0
   93ec0:      	movdqa	%xmm0, -0x2c0(%rbp)
   93ec8:      	movaps	-0x2c0(%rbp), %xmm1
   93ecf:      	movaps	%xmm1, -0xc0(%rbp)
   93ed6:      	movdqa	%xmm0, -0x2c0(%rbp)
   93ede:      	movaps	-0x2c0(%rbp), %xmm1
   93ee5:      	movaps	%xmm1, -0xb0(%rbp)
   93eec:      	movdqa	%xmm0, -0x2c0(%rbp)
   93ef4:      	movaps	-0x2c0(%rbp), %xmm1
   93efb:      	movaps	%xmm1, -0xa0(%rbp)
   93f02:      	movdqa	%xmm0, -0x2c0(%rbp)
   93f0a:      	movaps	-0x2c0(%rbp), %xmm1
   93f11:      	movaps	%xmm1, -0x90(%rbp)
   93f18:      	movdqa	%xmm0, -0x2c0(%rbp)
   93f20:      	movaps	-0x2c0(%rbp), %xmm1
   93f27:      	movaps	%xmm1, -0x80(%rbp)
   93f2b:      	movdqa	%xmm0, -0x2c0(%rbp)
   93f33:      	movaps	-0x2c0(%rbp), %xmm1
   93f3a:      	movaps	%xmm1, -0x70(%rbp)
   93f3e:      	movdqa	%xmm0, -0x2c0(%rbp)
   93f46:      	movaps	-0x2c0(%rbp), %xmm1
   93f4d:      	movaps	%xmm1, -0x60(%rbp)
   93f51:      	movdqa	%xmm0, -0x2c0(%rbp)
   93f59:      	movaps	-0x2c0(%rbp), %xmm0
   93f60:      	movaps	%xmm0, -0x50(%rbp)
   93f64:      	movq	%rbx, %rax
   93f67:      	addq	$0x2a8, %rsp            # imm = 0x2A8
   93f6e:      	popq	%rbx
   93f6f:      	popq	%r14
   93f71:      	popq	%r15
   93f73:      	popq	%rbp
   93f74:      	retq
   93f75:      	leaq	0x7fd5c(%rip), %rdx     # 0x113cd8 <anon.68c3b30278565fbd7c0b87acd371f0b5.8.llvm.2207912294309834671>
   93f7c:      	movl	$0x19, %esi
   93f81:      	callq	0x10b09d <core::panicking::panic_bounds_check>
   93f86:      	ud2
   93f88:      	movq	%rax, %rbx
   93f8b:      	jmp	0x93f9e <toyos_crypto::mlkem::noise+0x56e>
   93f8d:      	jmp	0x93f8f <toyos_crypto::mlkem::noise+0x55f>
   93f8f:      	movq	%rax, %rbx
   93f92:      	leaq	-0x2c0(%rbp), %rdi
   93f99:      	callq	0x95500 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   93f9e:      	leaq	-0xc0(%rbp), %rdi
   93fa5:      	callq	0x95290 <core::ptr::drop_glue::<toyos_crypto::secret::Secret<8, [u8; 16]>>>
   93faa:      	movq	%rbx, %rdi
   93fad:      	callq	0x105eb0 <_Unwind_Resume>
   93fb2:      	callq	0x10b08a <core::panicking::panic_in_cleanup>
   93fb7:      	int3
   93fb8:      	int3
   93fb9:      	int3
   93fba:      	int3
   93fbb:      	int3
   93fbc:      	int3
   93fbd:      	int3
   93fbe:      	int3
   93fbf:      	int3

0000000000093fc0 <toyos_crypto::mlkem::sample>:
   93fc0:      	pushq	%rbp
   93fc1:      	movq	%rsp, %rbp
   93fc4:      	pushq	%r15
   93fc6:      	pushq	%r14
   93fc8:      	pushq	%r13
   93fca:      	pushq	%r12
   93fcc:      	pushq	%rbx
   93fcd:      	subq	$0x2e8, %rsp            # imm = 0x2E8
   93fd4:      	movq	%rdi, %rbx
   93fd7:      	movb	%cl, -0x2a(%rbp)
   93fda:      	movb	%dl, -0x29(%rbp)
   93fdd:      	movq	%rsi, -0x308(%rbp)
   93fe4:      	movq	$0x20, -0x300(%rbp)
   93fef:      	leaq	-0x2a(%rbp), %rax
   93ff3:      	movq	%rax, -0x2f8(%rbp)
   93ffa:      	movq	$0x2, -0x2f0(%rbp)
   94005:      	leaq	-0x108(%rbp), %r14
   9400c:      	leaq	-0x308(%rbp), %rcx
   94013:      	movl	$0xa8, %esi
   94018:      	movl	$0x2, %r8d
   9401e:      	movq	%r14, %rdi
   94021:      	movl	$0x1f, %edx
   94026:      	callq	0x9c140 <<toyos_crypto::keccak::Sponge>::new>
   9402b:      	leaq	-0x308(%rbp), %rdi
   94032:      	xorl	%r15d, %r15d
   94035:      	movl	$0x200, %edx            # imm = 0x200
   9403a:      	xorl	%esi, %esi
   9403c:      	callq	0x1101f0 <memset>
   94041:      	movq	-0x38(%rbp), %rax
   94045:      	jmp	0x9405d <toyos_crypto::mlkem::sample+0x9d>
   94047:      	nopw	(%rax,%rax)
   94050:      	cmpq	$0x100, %r15            # imm = 0x100
   94057:      	jae	0x941ac <toyos_crypto::mlkem::sample+0x1ec>
   9405d:      	movq	-0x40(%rbp), %rdx
   94061:      	cmpq	%rdx, %rax
   94064:      	jne	0x94080 <toyos_crypto::mlkem::sample+0xc0>
   94066:      	movq	%r14, %rdi
   94069:      	callq	0x9c3c0 <<toyos_crypto::keccak::Sponge>::permute (.llvm.2207912294309834671)>
   9406e:      	movq	$0x0, -0x38(%rbp)
   94076:      	movq	-0x40(%rbp), %rdx
   9407a:      	xorl	%edi, %edi
   9407c:      	xorl	%eax, %eax
   9407e:      	jmp	0x94093 <toyos_crypto::mlkem::sample+0xd3>
   94080:      	movq	%rax, %rdi
   94083:      	shrq	$0x3, %rdi
   94087:      	cmpq	$0xc8, %rax
   9408d:      	jae	0x942d0 <toyos_crypto::mlkem::sample+0x310>
   94093:      	movq	-0x108(%rbp,%rdi,8), %r12
   9409b:      	leal	(,%rax,8), %ecx
   940a2:      	shrq	%cl, %r12
   940a5:      	leaq	0x1(%rax), %rsi
   940a9:      	movq	%rsi, -0x38(%rbp)
   940ad:      	cmpq	%rdx, %rsi
   940b0:      	jne	0x940d0 <toyos_crypto::mlkem::sample+0x110>
   940b2:      	movq	%r14, %rdi
   940b5:      	callq	0x9c3c0 <<toyos_crypto::keccak::Sponge>::permute (.llvm.2207912294309834671)>
   940ba:      	movq	$0x0, -0x38(%rbp)
   940c2:      	movq	-0x40(%rbp), %rdx
   940c6:      	xorl	%edi, %edi
   940c8:      	xorl	%esi, %esi
   940ca:      	jmp	0x940e3 <toyos_crypto::mlkem::sample+0x123>
   940cc:      	nopl	(%rax)
   940d0:      	movq	%rsi, %rdi
   940d3:      	shrq	$0x3, %rdi
   940d7:      	cmpq	$0xc7, %rax
   940dd:      	jae	0x942d0 <toyos_crypto::mlkem::sample+0x310>
   940e3:      	movq	-0x108(%rbp,%rdi,8), %r13
   940eb:      	leal	(,%rsi,8), %ecx
   940f2:      	shrq	%cl, %r13
   940f5:      	leaq	0x1(%rsi), %rax
   940f9:      	movq	%rax, -0x38(%rbp)
   940fd:      	cmpq	%rdx, %rax
   94100:      	jne	0x94120 <toyos_crypto::mlkem::sample+0x160>
   94102:      	movq	%r14, %rdi
   94105:      	callq	0x9c3c0 <<toyos_crypto::keccak::Sponge>::permute (.llvm.2207912294309834671)>
   9410a:      	movq	$0x0, -0x38(%rbp)
   94112:      	xorl	%edi, %edi
   94114:      	xorl	%eax, %eax
   94116:      	jmp	0x94134 <toyos_crypto::mlkem::sample+0x174>
   94118:      	nopl	(%rax,%rax)
   94120:      	movq	%rax, %rdi
   94123:      	shrq	$0x3, %rdi
   94127:      	cmpq	$0xc7, %rsi
   9412e:      	jae	0x942d0 <toyos_crypto::mlkem::sample+0x310>
   94134:      	movq	-0x108(%rbp,%rdi,8), %rdx
   9413c:      	leal	(,%rax,8), %ecx
   94143:      	shrq	%cl, %rdx
   94146:      	incq	%rax
   94149:      	movq	%rax, -0x38(%rbp)
   9414d:      	movzbl	%r12b, %esi
   94151:      	movl	%r13d, %ecx
   94154:      	andl	$0xf, %ecx
   94157:      	shll	$0x8, %ecx
   9415a:      	orl	%esi, %ecx
   9415c:      	cmpl	$0xd01, %ecx            # imm = 0xD01
   94162:      	jae	0x94170 <toyos_crypto::mlkem::sample+0x1b0>
   94164:      	movw	%cx, -0x308(%rbp,%r15,2)
   9416d:      	incq	%r15
   94170:      	movzbl	%r13b, %esi
   94174:      	shrl	$0x4, %esi
   94177:      	movzbl	%dl, %ecx
   9417a:      	shll	$0x4, %ecx
   9417d:      	orl	%esi, %ecx
   9417f:      	movzwl	%cx, %edx
   94182:      	cmpl	$0xd00, %edx            # imm = 0xD00
   94188:      	ja	0x94050 <toyos_crypto::mlkem::sample+0x90>
   9418e:      	cmpq	$0xff, %r15
   94195:      	ja	0x94050 <toyos_crypto::mlkem::sample+0x90>
   9419b:      	movw	%cx, -0x308(%rbp,%r15,2)
   941a4:      	incq	%r15
   941a7:      	jmp	0x94050 <toyos_crypto::mlkem::sample+0x90>
   941ac:      	leaq	-0x308(%rbp), %rsi
   941b3:      	movl	$0x200, %edx            # imm = 0x200
   941b8:      	movq	%rbx, %rdi
   941bb:      	callq	0x10fcc0 <memcpy>
   941c0:      	movq	$0x0, -0x108(%rbp)
   941cb:      	movq	$0x0, -0x100(%rbp)
   941d6:      	movq	$0x0, -0xf8(%rbp)
   941e1:      	movq	$0x0, -0xf0(%rbp)
   941ec:      	movq	$0x0, -0xe8(%rbp)
   941f7:      	movq	$0x0, -0xe0(%rbp)
   94202:      	movq	$0x0, -0xd8(%rbp)
   9420d:      	movq	$0x0, -0xd0(%rbp)
   94218:      	movq	$0x0, -0xc8(%rbp)
   94223:      	movq	$0x0, -0xc0(%rbp)
   9422e:      	movq	$0x0, -0xb8(%rbp)
   94239:      	movq	$0x0, -0xb0(%rbp)
   94244:      	movq	$0x0, -0xa8(%rbp)
   9424f:      	movq	$0x0, -0xa0(%rbp)
   9425a:      	movq	$0x0, -0x98(%rbp)
   94265:      	movq	$0x0, -0x90(%rbp)
   94270:      	movq	$0x0, -0x88(%rbp)
   9427b:      	movq	$0x0, -0x80(%rbp)
   94283:      	movq	$0x0, -0x78(%rbp)
   9428b:      	movq	$0x0, -0x70(%rbp)
   94293:      	movq	$0x0, -0x68(%rbp)
   9429b:      	movq	$0x0, -0x60(%rbp)
   942a3:      	movq	$0x0, -0x58(%rbp)
   942ab:      	movq	$0x0, -0x50(%rbp)
   942b3:      	movq	$0x0, -0x48(%rbp)
   942bb:      	movq	%rbx, %rax
   942be:      	addq	$0x2e8, %rsp            # imm = 0x2E8
   942c5:      	popq	%rbx
   942c6:      	popq	%r12
   942c8:      	popq	%r13
   942ca:      	popq	%r14
   942cc:      	popq	%r15
   942ce:      	popq	%rbp
   942cf:      	retq
   942d0:      	leaq	0x7fa01(%rip), %rdx     # 0x113cd8 <anon.68c3b30278565fbd7c0b87acd371f0b5.8.llvm.2207912294309834671>
   942d7:      	movl	$0x19, %esi
   942dc:      	callq	0x10b09d <core::panicking::panic_bounds_check>
   942e1:      	ud2
   942e3:      	jmp	0x942e5 <toyos_crypto::mlkem::sample+0x325>
   942e5:      	movq	%rax, %rbx
   942e8:      	xorl	%eax, %eax
   942ea:      	nopw	(%rax,%rax)
   942f0:      	movw	$0x0, -0x308(%rbp,%rax)
   942fa:      	movw	$0x0, -0x306(%rbp,%rax)
   94304:      	movw	$0x0, -0x304(%rbp,%rax)
   9430e:      	movw	$0x0, -0x302(%rbp,%rax)
   94318:      	movw	$0x0, -0x300(%rbp,%rax)
   94322:      	movw	$0x0, -0x2fe(%rbp,%rax)
   9432c:      	movw	$0x0, -0x2fc(%rbp,%rax)
   94336:      	movw	$0x0, -0x2fa(%rbp,%rax)
   94340:      	addq	$0x10, %rax
   94344:      	cmpq	$0x200, %rax            # imm = 0x200
   9434a:      	jne	0x942f0 <toyos_crypto::mlkem::sample+0x330>
   9434c:      	leaq	-0x108(%rbp), %rdi
   94353:      	callq	0x95500 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   94358:      	movq	%rbx, %rdi
   9435b:      	callq	0x105eb0 <_Unwind_Resume>
   94360:      	callq	0x10b08a <core::panicking::panic_in_cleanup>
   94365:      	int3
   94366:      	int3
   94367:      	int3
   94368:      	int3
   94369:      	int3
   9436a:      	int3
   9436b:      	int3
   9436c:      	int3
   9436d:      	int3
   9436e:      	int3
   9436f:      	int3

0000000000095500 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>:
   95500:      	pushq	%rbp
   95501:      	movq	%rsp, %rbp
   95504:      	movq	$0x0, (%rdi)
   9550b:      	movq	$0x0, 0x8(%rdi)
   95513:      	movq	$0x0, 0x10(%rdi)
   9551b:      	movq	$0x0, 0x18(%rdi)
   95523:      	movq	$0x0, 0x20(%rdi)
   9552b:      	movq	$0x0, 0x28(%rdi)
   95533:      	movq	$0x0, 0x30(%rdi)
   9553b:      	movq	$0x0, 0x38(%rdi)
   95543:      	movq	$0x0, 0x40(%rdi)
   9554b:      	movq	$0x0, 0x48(%rdi)
   95553:      	movq	$0x0, 0x50(%rdi)
   9555b:      	movq	$0x0, 0x58(%rdi)
   95563:      	movq	$0x0, 0x60(%rdi)
   9556b:      	movq	$0x0, 0x68(%rdi)
   95573:      	movq	$0x0, 0x70(%rdi)
   9557b:      	movq	$0x0, 0x78(%rdi)
   95583:      	movq	$0x0, 0x80(%rdi)
   9558e:      	movq	$0x0, 0x88(%rdi)
   95599:      	movq	$0x0, 0x90(%rdi)
   955a4:      	movq	$0x0, 0x98(%rdi)
   955af:      	movq	$0x0, 0xa0(%rdi)
   955ba:      	movq	$0x0, 0xa8(%rdi)
   955c5:      	movq	$0x0, 0xb0(%rdi)
   955d0:      	movq	$0x0, 0xb8(%rdi)
   955db:      	movq	$0x0, 0xc0(%rdi)
   955e6:      	popq	%rbp
   955e7:      	retq
   955e8:      	int3
   955e9:      	int3
   955ea:      	int3
   955eb:      	int3
   955ec:      	int3
   955ed:      	int3
   955ee:      	int3
   955ef:      	int3

000000000009c140 <<toyos_crypto::keccak::Sponge>::new>:
   9c140:      	pushq	%rbp
   9c141:      	movq	%rsp, %rbp
   9c144:      	pushq	%r15
   9c146:      	pushq	%r14
   9c148:      	pushq	%r13
   9c14a:      	pushq	%r12
   9c14c:      	pushq	%rbx
   9c14d:      	subq	$0xf8, %rsp
   9c154:      	movq	%rcx, %r13
   9c157:      	movq	%rsi, %r14
   9c15a:      	movq	%rdi, %rbx
   9c15d:      	cmpq	$0x48, %rsi
   9c161:      	je	0x9c179 <<toyos_crypto::keccak::Sponge>::new+0x39>
   9c163:      	cmpq	$0x88, %r14
   9c16a:      	je	0x9c179 <<toyos_crypto::keccak::Sponge>::new+0x39>
   9c16c:      	cmpq	$0xa8, %r14
   9c173:      	jne	0x9c37e <<toyos_crypto::keccak::Sponge>::new+0x23e>
   9c179:      	xorps	%xmm0, %xmm0
   9c17c:      	movaps	%xmm0, -0x70(%rbp)
   9c180:      	movaps	%xmm0, -0x80(%rbp)
   9c184:      	movaps	%xmm0, -0x90(%rbp)
   9c18b:      	movaps	%xmm0, -0xa0(%rbp)
   9c192:      	movaps	%xmm0, -0xb0(%rbp)
   9c199:      	movaps	%xmm0, -0xc0(%rbp)
   9c1a0:      	movaps	%xmm0, -0xd0(%rbp)
   9c1a7:      	movaps	%xmm0, -0xe0(%rbp)
   9c1ae:      	movaps	%xmm0, -0xf0(%rbp)
   9c1b5:      	movaps	%xmm0, -0x100(%rbp)
   9c1bc:      	movaps	%xmm0, -0x110(%rbp)
   9c1c3:      	movaps	%xmm0, -0x120(%rbp)
   9c1ca:      	movq	$0x0, -0x60(%rbp)
   9c1d2:      	movq	%r14, -0x58(%rbp)
   9c1d6:      	movq	$0x0, -0x50(%rbp)
   9c1de:      	testq	%r8, %r8
   9c1e1:      	je	0x9c2e1 <<toyos_crypto::keccak::Sponge>::new+0x1a1>
   9c1e7:      	movl	%edx, -0x34(%rbp)
   9c1ea:      	movq	%rbx, -0x40(%rbp)
   9c1ee:      	shlq	$0x4, %r8
   9c1f2:      	addq	%r13, %r8
   9c1f5:      	xorl	%ecx, %ecx
   9c1f7:      	leaq	0x77aaa(%rip), %rax     # 0x113ca8 <anon.18dec02eb37b3d6a6a16fd3f8c2fbb91.4.llvm.14221192674057841295+0x168>
   9c1fe:      	movq	%rax, -0x30(%rbp)
   9c202:      	movq	%r8, -0x48(%rbp)
   9c206:      	jmp	0x9c21d <<toyos_crypto::keccak::Sponge>::new+0xdd>
   9c208:      	nopl	(%rax,%rax)
   9c210:      	addq	$0x10, %r13
   9c214:      	movq	-0x48(%rbp), %r8
   9c218:      	cmpq	%r8, %r13
   9c21b:      	je	0x9c291 <<toyos_crypto::keccak::Sponge>::new+0x151>
   9c21d:      	movq	0x8(%r13), %rbx
   9c221:      	testq	%rbx, %rbx
   9c224:      	je	0x9c210 <<toyos_crypto::keccak::Sponge>::new+0xd0>
   9c226:      	movq	(%r13), %r12
   9c22a:      	xorl	%r15d, %r15d
   9c22d:      	jmp	0x9c238 <<toyos_crypto::keccak::Sponge>::new+0xf8>
   9c22f:      	nop
   9c230:      	incq	%r15
   9c233:      	cmpq	%r15, %rbx
   9c236:      	je	0x9c210 <<toyos_crypto::keccak::Sponge>::new+0xd0>
   9c238:      	movq	%rcx, %rdi
   9c23b:      	shrq	$0x3, %rdi
   9c23f:      	cmpq	$0xc7, %rcx
   9c246:      	ja	0x9c360 <<toyos_crypto::keccak::Sponge>::new+0x220>
   9c24c:      	shll	$0x3, %ecx
   9c24f:      	movzbl	(%r12,%r15), %eax
   9c254:      	shlq	%cl, %rax
   9c257:      	xorq	%rax, -0x120(%rbp,%rdi,8)
   9c25f:      	movq	-0x50(%rbp), %rcx
   9c263:      	cmpq	$-0x1, %rcx
   9c267:      	je	0x9c347 <<toyos_crypto::keccak::Sponge>::new+0x207>
   9c26d:      	incq	%rcx
   9c270:      	movq	%rcx, -0x50(%rbp)
   9c274:      	cmpq	%r14, %rcx
   9c277:      	jne	0x9c230 <<toyos_crypto::keccak::Sponge>::new+0xf0>
   9c279:      	leaq	-0x120(%rbp), %rdi
   9c280:      	callq	0x9c3c0 <<toyos_crypto::keccak::Sponge>::permute (.llvm.2207912294309834671)>
   9c285:      	movq	$0x0, -0x50(%rbp)
   9c28d:      	xorl	%ecx, %ecx
   9c28f:      	jmp	0x9c230 <<toyos_crypto::keccak::Sponge>::new+0xf0>
   9c291:      	movq	%rcx, %rdi
   9c294:      	shrq	$0x3, %rdi
   9c298:      	cmpq	$0xc8, %rcx
   9c29f:      	jae	0x9c355 <<toyos_crypto::keccak::Sponge>::new+0x215>
   9c2a5:      	shll	$0x3, %ecx
   9c2a8:      	movzbl	-0x34(%rbp), %eax
   9c2ac:      	shlq	%cl, %rax
   9c2af:      	xorq	%rax, -0x120(%rbp,%rdi,8)
   9c2b7:      	testq	%r14, %r14
   9c2ba:      	movq	-0x40(%rbp), %rbx
   9c2be:      	je	0x9c370 <<toyos_crypto::keccak::Sponge>::new+0x230>
   9c2c4:      	leaq	-0x1(%r14), %rcx
   9c2c8:      	movq	%rcx, %rdi
   9c2cb:      	shrq	$0x3, %rdi
   9c2cf:      	cmpq	$0xc9, %r14
   9c2d6:      	jb	0x9c2f8 <<toyos_crypto::keccak::Sponge>::new+0x1b8>
   9c2d8:      	leaq	0x779b1(%rip), %rax     # 0x113c90 <anon.18dec02eb37b3d6a6a16fd3f8c2fbb91.4.llvm.14221192674057841295+0x150>
   9c2df:      	jmp	0x9c35c <<toyos_crypto::keccak::Sponge>::new+0x21c>
   9c2e1:      	movzbl	%dl, %eax
   9c2e4:      	movq	%rax, -0x120(%rbp)
   9c2eb:      	decq	%r14
   9c2ee:      	movq	%r14, %rdi
   9c2f1:      	shrq	$0x3, %rdi
   9c2f5:      	movq	%r14, %rcx
   9c2f8:      	shll	$0x3, %ecx
   9c2fb:      	movl	$0x80, %eax
   9c300:      	shlq	%cl, %rax
   9c303:      	xorq	%rax, -0x120(%rbp,%rdi,8)
   9c30b:      	leaq	-0x120(%rbp), %r14
   9c312:      	movq	%r14, %rdi
   9c315:      	callq	0x9c3c0 <<toyos_crypto::keccak::Sponge>::permute (.llvm.2207912294309834671)>
   9c31a:      	movq	$0x0, -0x50(%rbp)
   9c322:      	movl	$0xd8, %edx
   9c327:      	movq	%rbx, %rdi
   9c32a:      	movq	%r14, %rsi
   9c32d:      	callq	0x10fcc0 <memcpy>
   9c332:      	movq	%rbx, %rax
   9c335:      	addq	$0xf8, %rsp
   9c33c:      	popq	%rbx
   9c33d:      	popq	%r12
   9c33f:      	popq	%r13
   9c341:      	popq	%r14
   9c343:      	popq	%r15
   9c345:      	popq	%rbp
   9c346:      	retq
   9c347:      	leaq	0x77972(%rip), %rdi     # 0x113cc0 <anon.18dec02eb37b3d6a6a16fd3f8c2fbb91.4.llvm.14221192674057841295+0x180>
   9c34e:      	callq	0x10be70 <core::panicking::panic_const::panic_const_add_overflow>
   9c353:      	jmp	0x9c37c <<toyos_crypto::keccak::Sponge>::new+0x23c>
   9c355:      	leaq	0x77904(%rip), %rax     # 0x113c60 <anon.18dec02eb37b3d6a6a16fd3f8c2fbb91.4.llvm.14221192674057841295+0x120>
   9c35c:      	movq	%rax, -0x30(%rbp)
   9c360:      	movl	$0x19, %esi
   9c365:      	movq	-0x30(%rbp), %rdx
   9c369:      	callq	0x10b09d <core::panicking::panic_bounds_check>
   9c36e:      	jmp	0x9c37c <<toyos_crypto::keccak::Sponge>::new+0x23c>
   9c370:      	leaq	0x77901(%rip), %rdi     # 0x113c78 <anon.18dec02eb37b3d6a6a16fd3f8c2fbb91.4.llvm.14221192674057841295+0x138>
   9c377:      	callq	0x10bef0 <core::panicking::panic_const::panic_const_sub_overflow>
   9c37c:      	ud2
   9c37e:      	leaq	-0x7db75(%rip), %rdi    # 0x1e810 <anon.404f0b2ad6fc0db54b2f19524fee3266.1.llvm.2168671797654744057+0x730>
   9c385:      	leaq	0x778bc(%rip), %rdx     # 0x113c48 <anon.18dec02eb37b3d6a6a16fd3f8c2fbb91.4.llvm.14221192674057841295+0x108>
   9c38c:      	movl	$0x30, %esi
   9c391:      	callq	0x10b280 <core::panicking::panic>
   9c396:      	movq	%rax, %rbx
   9c399:      	leaq	-0x120(%rbp), %rdi
   9c3a0:      	callq	0x95500 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   9c3a5:      	movq	%rbx, %rdi
   9c3a8:      	callq	0x105eb0 <_Unwind_Resume>
   9c3ad:      	callq	0x10b08a <core::panicking::panic_in_cleanup>
   9c3b2:      	int3
   9c3b3:      	int3
   9c3b4:      	int3
   9c3b5:      	int3
   9c3b6:      	int3
   9c3b7:      	int3
   9c3b8:      	int3
   9c3b9:      	int3
   9c3ba:      	int3
   9c3bb:      	int3
   9c3bc:      	int3
   9c3bd:      	int3
   9c3be:      	int3
   9c3bf:      	int3

000000000009c3c0 <<toyos_crypto::keccak::Sponge>::permute (.llvm.2207912294309834671)>:
   9c3c0:      	pushq	%rbp
   9c3c1:      	movq	%rsp, %rbp
   9c3c4:      	pushq	%r15
   9c3c6:      	pushq	%r14
   9c3c8:      	pushq	%r13
   9c3ca:      	pushq	%r12
   9c3cc:      	pushq	%rbx
   9c3cd:      	subq	$0x358, %rsp            # imm = 0x358
   9c3d4:      	movq	%rdi, %rbx
   9c3d7:      	movq	$0x0, -0x240(%rbp)
   9c3e2:      	movq	$0x0, -0x238(%rbp)
   9c3ed:      	movq	$0x0, -0x230(%rbp)
   9c3f8:      	movq	$0x0, -0x228(%rbp)
   9c403:      	movq	$0x0, -0x220(%rbp)
   9c40e:      	movq	$0x0, -0x178(%rbp)
   9c419:      	movq	$0x0, -0x170(%rbp)
   9c424:      	movq	$0x0, -0x168(%rbp)
   9c42f:      	movq	$0x0, -0x160(%rbp)
   9c43a:      	movq	$0x0, -0x158(%rbp)
   9c445:      	movq	$0x0, -0x1d0(%rbp)
   9c450:      	movq	$0x0, -0x1c8(%rbp)
   9c45b:      	movq	$0x0, -0x1c0(%rbp)
   9c466:      	movq	$0x0, -0x1b8(%rbp)
   9c471:      	movq	$0x0, -0x1b0(%rbp)
   9c47c:      	movq	$0x0, -0x1a8(%rbp)
   9c487:      	movq	$0x0, -0x1a0(%rbp)
   9c492:      	movq	$0x0, -0x198(%rbp)
   9c49d:      	movq	$0x0, -0x190(%rbp)
   9c4a8:      	movq	$0x0, -0x188(%rbp)
   9c4b3:      	movq	$0x0, -0x180(%rbp)
   9c4be:      	leaq	-0x370(%rbp), %rdi
   9c4c5:      	leaq	-0x7dc8c(%rip), %rsi    # 0x1e840 <anon.404f0b2ad6fc0db54b2f19524fee3266.1.llvm.2168671797654744057+0x760>
   9c4cc:      	movl	$0xc0, %edx
   9c4d1:      	callq	0x10fcc0 <memcpy>
   9c4d6:      	movq	(%rbx), %rdi
   9c4d9:      	movq	0x8(%rbx), %rax
   9c4dd:      	movq	%rax, -0x40(%rbp)
   9c4e1:      	movq	0x28(%rbx), %rax
   9c4e5:      	movq	%rax, -0xb8(%rbp)
   9c4ec:      	movq	0x50(%rbx), %rax
   9c4f0:      	movq	%rax, -0xa0(%rbp)
   9c4f7:      	movq	0x78(%rbx), %rax
   9c4fb:      	movq	%rax, -0x80(%rbp)
   9c4ff:      	movq	0xa0(%rbx), %rax
   9c506:      	movq	%rax, -0x60(%rbp)
   9c50a:      	movq	0x30(%rbx), %rax
   9c50e:      	movq	%rax, -0xa8(%rbp)
   9c515:      	movq	0x58(%rbx), %rax
   9c519:      	movq	%rax, -0x98(%rbp)
   9c520:      	movq	0x80(%rbx), %rax
   9c527:      	movq	%rax, -0x78(%rbp)
   9c52b:      	movq	0xa8(%rbx), %rax
   9c532:      	movq	%rax, -0x58(%rbp)
   9c536:      	movq	0x10(%rbx), %rax
   9c53a:      	movq	%rax, -0xb0(%rbp)
   9c541:      	movq	0x38(%rbx), %rax
   9c545:      	movq	%rax, -0x90(%rbp)
   9c54c:      	movq	0x60(%rbx), %rax
   9c550:      	movq	%rax, -0x70(%rbp)
   9c554:      	movq	0x88(%rbx), %r10
   9c55b:      	movq	0xb0(%rbx), %r13
   9c562:      	movq	0x18(%rbx), %rax
   9c566:      	movq	%rax, -0x88(%rbp)
   9c56d:      	movq	0x40(%rbx), %rax
   9c571:      	movq	%rax, -0x68(%rbp)
   9c575:      	movq	0x68(%rbx), %rax
   9c579:      	movq	%rax, -0x50(%rbp)
   9c57d:      	movq	0x90(%rbx), %r9
   9c584:      	movq	0xb8(%rbx), %r12
   9c58b:      	movq	0x20(%rbx), %rax
   9c58f:      	movq	%rax, -0xc8(%rbp)
   9c596:      	movq	0x48(%rbx), %rax
   9c59a:      	movq	%rax, -0x48(%rbp)
   9c59e:      	movq	0x70(%rbx), %rdx
   9c5a2:      	movq	0x98(%rbx), %r15
   9c5a9:      	movq	0xc0(%rbx), %r11
   9c5b0:      	movl	$0x2, %r14d
   9c5b6:      	movq	%r14, -0x218(%rbp)
   9c5bd:      	movq	-0x80(%rbp), %rax
   9c5c1:      	xorq	-0x60(%rbp), %rax
   9c5c5:      	movq	-0xa0(%rbp), %rcx
   9c5cc:      	xorq	-0xb8(%rbp), %rcx
   9c5d3:      	xorq	%rax, %rcx
   9c5d6:      	movq	-0x78(%rbp), %rsi
   9c5da:      	xorq	-0x58(%rbp), %rsi
   9c5de:      	movq	-0x98(%rbp), %rax
   9c5e5:      	xorq	-0xa8(%rbp), %rax
   9c5ec:      	xorq	%rsi, %rax
   9c5ef:      	movq	%r10, -0x38(%rbp)
   9c5f3:      	xorq	%r13, %r10
   9c5f6:      	movq	-0x70(%rbp), %r14
   9c5fa:      	xorq	-0x90(%rbp), %r14
   9c601:      	xorq	%r10, %r14
   9c604:      	movq	%r9, %rsi
   9c607:      	xorq	%r12, %rsi
   9c60a:      	movq	%rdi, %r8
   9c60d:      	movq	%rdi, -0x30(%rbp)
   9c611:      	movq	-0x50(%rbp), %rdi
   9c615:      	xorq	-0x68(%rbp), %rdi
   9c619:      	xorq	%rsi, %rdi
   9c61c:      	movq	%r15, %r10
   9c61f:      	xorq	%r11, %r10
   9c622:      	movq	%rdx, %rsi
   9c625:      	xorq	-0x48(%rbp), %rsi
   9c629:      	xorq	%r10, %rsi
   9c62c:      	xorq	%r8, %rcx
   9c62f:      	xorq	-0x40(%rbp), %rax
   9c633:      	xorq	-0xb0(%rbp), %r14
   9c63a:      	xorq	-0x88(%rbp), %rdi
   9c641:      	movq	-0xc8(%rbp), %r8
   9c648:      	xorq	%r8, %rsi
   9c64b:      	movq	%rdi, %r10
   9c64e:      	rolq	%r10
   9c651:      	xorq	%rax, %r10
   9c654:      	movq	%r10, -0xd0(%rbp)
   9c65b:      	rolq	%rax
   9c65e:      	xorq	%rsi, %rax
   9c661:      	movq	%r14, %r10
   9c664:      	rolq	%r10
   9c667:      	xorq	%rcx, %r10
   9c66a:      	rolq	%rsi
   9c66d:      	rolq	%rcx
   9c670:      	xorq	%r14, %rsi
   9c673:      	xorq	%rdi, %rcx
   9c676:      	movq	-0x30(%rbp), %rdi
   9c67a:      	xorq	%rax, %rdi
   9c67d:      	movq	%rdi, -0xc0(%rbp)
   9c684:      	movq	-0x40(%rbp), %rdi
   9c688:      	xorq	%r10, %rdi
   9c68b:      	rolq	%rdi
   9c68e:      	movq	%rdi, -0x150(%rbp)
   9c695:      	movq	-0xd0(%rbp), %r14
   9c69c:      	movq	-0xb0(%rbp), %rdi
   9c6a3:      	xorq	%r14, %rdi
   9c6a6:      	rolq	$0x3e, %rdi
   9c6aa:      	movq	%rdi, -0x148(%rbp)
   9c6b1:      	movq	-0x88(%rbp), %rdi
   9c6b8:      	xorq	%rsi, %rdi
   9c6bb:      	rolq	$0x1c, %rdi
   9c6bf:      	movq	%rdi, -0x140(%rbp)
   9c6c6:      	xorq	%rcx, %r8
   9c6c9:      	rolq	$0x1b, %r8
   9c6cd:      	movq	%r8, -0x138(%rbp)
   9c6d4:      	movq	-0xb8(%rbp), %rdi
   9c6db:      	xorq	%rax, %rdi
   9c6de:      	rolq	$0x24, %rdi
   9c6e2:      	movq	%rdi, -0x130(%rbp)
   9c6e9:      	movq	-0xa8(%rbp), %rdi
   9c6f0:      	xorq	%r10, %rdi
   9c6f3:      	rolq	$0x2c, %rdi
   9c6f7:      	movq	%rdi, -0x128(%rbp)
   9c6fe:      	movq	-0x90(%rbp), %rdi
   9c705:      	xorq	%r14, %rdi
   9c708:      	movq	%r14, %r8
   9c70b:      	rolq	$0x6, %rdi
   9c70f:      	movq	%rdi, -0x120(%rbp)
   9c716:      	movq	-0x68(%rbp), %rdi
   9c71a:      	xorq	%rsi, %rdi
   9c71d:      	rolq	$0x37, %rdi
   9c721:      	movq	%rdi, -0x30(%rbp)
   9c725:      	movq	-0x48(%rbp), %rdi
   9c729:      	xorq	%rcx, %rdi
   9c72c:      	rolq	$0x14, %rdi
   9c730:      	movq	%rdi, -0x118(%rbp)
   9c737:      	movq	-0xa0(%rbp), %rdi
   9c73e:      	xorq	%rax, %rdi
   9c741:      	rolq	$0x3, %rdi
   9c745:      	movq	%rdi, -0x110(%rbp)
   9c74c:      	movq	-0x98(%rbp), %rdi
   9c753:      	xorq	%r10, %rdi
   9c756:      	rolq	$0xa, %rdi
   9c75a:      	movq	%rdi, -0x108(%rbp)
   9c761:      	movq	-0x70(%rbp), %r14
   9c765:      	xorq	%r8, %r14
   9c768:      	rolq	$0x2b, %r14
   9c76c:      	movq	-0x50(%rbp), %rdi
   9c770:      	xorq	%rsi, %rdi
   9c773:      	rolq	$0x19, %rdi
   9c777:      	movq	%rdi, -0x100(%rbp)
   9c77e:      	xorq	%rcx, %rdx
   9c781:      	rolq	$0x27, %rdx
   9c785:      	movq	%rdx, -0xf8(%rbp)
   9c78c:      	movq	-0x80(%rbp), %rdx
   9c790:      	xorq	%rax, %rdx
   9c793:      	rolq	$0x29, %rdx
   9c797:      	movq	%rdx, -0xf0(%rbp)
   9c79e:      	movq	-0x78(%rbp), %rdx
   9c7a2:      	xorq	%r10, %rdx
   9c7a5:      	rolq	$0x2d, %rdx
   9c7a9:      	movq	%rdx, -0xe8(%rbp)
   9c7b0:      	movq	-0x38(%rbp), %r8
   9c7b4:      	movq	-0xd0(%rbp), %rdx
   9c7bb:      	xorq	%rdx, %r8
   9c7be:      	rolq	$0xf, %r8
   9c7c2:      	movq	%r8, -0x38(%rbp)
   9c7c6:      	xorq	%rsi, %r9
   9c7c9:      	rolq	$0x15, %r9
   9c7cd:      	xorq	%rcx, %r15
   9c7d0:      	rolq	$0x8, %r15
   9c7d4:      	movq	%rax, -0x210(%rbp)
   9c7db:      	movq	-0x60(%rbp), %rdi
   9c7df:      	xorq	%rax, %rdi
   9c7e2:      	rolq	$0x12, %rdi
   9c7e6:      	movq	%rdi, -0xe0(%rbp)
   9c7ed:      	movq	%r10, -0x208(%rbp)
   9c7f4:      	movq	-0x58(%rbp), %rdi
   9c7f8:      	xorq	%r10, %rdi
   9c7fb:      	rolq	$0x2, %rdi
   9c7ff:      	movq	%rdi, -0xd8(%rbp)
   9c806:      	xorq	%rdx, %r13
   9c809:      	rolq	$0x3d, %r13
   9c80d:      	xorq	%rsi, %r12
   9c810:      	rolq	$0x38, %r12
   9c814:      	xorq	%rcx, %r11
   9c817:      	rolq	$0xe, %r11
   9c81b:      	movq	-0x128(%rbp), %r8
   9c822:      	movq	%r8, %rdi
   9c825:      	notq	%rdi
   9c828:      	andq	%r14, %rdi
   9c82b:      	movq	%r14, %rax
   9c82e:      	notq	%rax
   9c831:      	andq	%r9, %rax
   9c834:      	xorq	%r8, %rax
   9c837:      	movq	%r8, %r10
   9c83a:      	movq	%rax, -0x40(%rbp)
   9c83e:      	movq	%r9, %rax
   9c841:      	notq	%rax
   9c844:      	andq	%r11, %rax
   9c847:      	movq	%r14, -0x200(%rbp)
   9c84e:      	xorq	%r14, %rax
   9c851:      	movq	%rax, -0xb0(%rbp)
   9c858:      	movq	%r11, %rax
   9c85b:      	notq	%rax
   9c85e:      	movq	-0xc0(%rbp), %r8
   9c865:      	andq	%r8, %rax
   9c868:      	movq	%r9, -0x1f8(%rbp)
   9c86f:      	xorq	%r9, %rax
   9c872:      	movq	%rax, -0x88(%rbp)
   9c879:      	movq	%r8, %rax
   9c87c:      	notq	%rax
   9c87f:      	andq	%r10, %rax
   9c882:      	movq	%r11, -0x1d8(%rbp)
   9c889:      	xorq	%r11, %rax
   9c88c:      	movq	%rax, -0xc8(%rbp)
   9c893:      	movq	-0x118(%rbp), %r9
   9c89a:      	movq	%r9, %rax
   9c89d:      	notq	%rax
   9c8a0:      	movq	-0x110(%rbp), %r10
   9c8a7:      	andq	%r10, %rax
   9c8aa:      	movq	-0x140(%rbp), %r8
   9c8b1:      	xorq	%r8, %rax
   9c8b4:      	movq	%rax, -0xb8(%rbp)
   9c8bb:      	movq	%r10, %rax
   9c8be:      	notq	%rax
   9c8c1:      	movq	-0xe8(%rbp), %rdx
   9c8c8:      	andq	%rdx, %rax
   9c8cb:      	xorq	%r9, %rax
   9c8ce:      	movq	%rax, -0xa8(%rbp)
   9c8d5:      	movq	%rdx, %rax
   9c8d8:      	notq	%rax
   9c8db:      	andq	%r13, %rax
   9c8de:      	xorq	%r10, %rax
   9c8e1:      	movq	%rax, -0x90(%rbp)
   9c8e8:      	movq	%r13, %rax
   9c8eb:      	notq	%rax
   9c8ee:      	andq	%r8, %rax
   9c8f1:      	xorq	%rdx, %rax
   9c8f4:      	movq	%rax, -0x68(%rbp)
   9c8f8:      	movq	%r8, %rax
   9c8fb:      	notq	%rax
   9c8fe:      	andq	%r9, %rax
   9c901:      	movq	%r13, -0x1e8(%rbp)
   9c908:      	xorq	%r13, %rax
   9c90b:      	movq	%rax, -0x48(%rbp)
   9c90f:      	movq	-0x120(%rbp), %r8
   9c916:      	movq	%r8, %rax
   9c919:      	notq	%rax
   9c91c:      	movq	-0x100(%rbp), %r9
   9c923:      	andq	%r9, %rax
   9c926:      	movq	-0x150(%rbp), %rdx
   9c92d:      	xorq	%rdx, %rax
   9c930:      	movq	%rax, -0xa0(%rbp)
   9c937:      	movq	%r9, %rax
   9c93a:      	notq	%rax
   9c93d:      	andq	%r15, %rax
   9c940:      	xorq	%r8, %rax
   9c943:      	movq	%rax, -0x98(%rbp)
   9c94a:      	movq	%r15, %rax
   9c94d:      	notq	%rax
   9c950:      	movq	-0xe0(%rbp), %r10
   9c957:      	andq	%r10, %rax
   9c95a:      	xorq	%r9, %rax
   9c95d:      	movq	%rax, -0x70(%rbp)
   9c961:      	movq	%r10, %rax
   9c964:      	notq	%rax
   9c967:      	andq	%rdx, %rax
   9c96a:      	movq	%r15, -0x1f0(%rbp)
   9c971:      	xorq	%r15, %rax
   9c974:      	movq	%rax, -0x50(%rbp)
   9c978:      	notq	%rdx
   9c97b:      	andq	%r8, %rdx
   9c97e:      	xorq	%r10, %rdx
   9c981:      	movq	-0x130(%rbp), %r8
   9c988:      	movq	%r8, %rax
   9c98b:      	notq	%rax
   9c98e:      	movq	-0x108(%rbp), %r9
   9c995:      	andq	%r9, %rax
   9c998:      	movq	-0x138(%rbp), %r15
   9c99f:      	xorq	%r15, %rax
   9c9a2:      	movq	%rax, -0x80(%rbp)
   9c9a6:      	movq	%r9, %rax
   9c9a9:      	notq	%rax
   9c9ac:      	movq	-0x38(%rbp), %r11
   9c9b0:      	andq	%r11, %rax
   9c9b3:      	xorq	%r8, %rax
   9c9b6:      	movq	%rax, -0x78(%rbp)
   9c9ba:      	movq	%r11, %r10
   9c9bd:      	notq	%r10
   9c9c0:      	andq	%r12, %r10
   9c9c3:      	xorq	%r9, %r10
   9c9c6:      	movq	%r12, %r9
   9c9c9:      	notq	%r9
   9c9cc:      	andq	%r15, %r9
   9c9cf:      	xorq	%r11, %r9
   9c9d2:      	notq	%r15
   9c9d5:      	andq	%r8, %r15
   9c9d8:      	movq	%r12, -0x1e0(%rbp)
   9c9df:      	xorq	%r12, %r15
   9c9e2:      	movq	-0x30(%rbp), %r8
   9c9e6:      	movq	%r8, %rax
   9c9e9:      	notq	%rax
   9c9ec:      	movq	-0xf8(%rbp), %r14
   9c9f3:      	andq	%r14, %rax
   9c9f6:      	movq	-0x148(%rbp), %r11
   9c9fd:      	xorq	%r11, %rax
   9ca00:      	movq	%rax, -0x60(%rbp)
   9ca04:      	movq	%r14, %rax
   9ca07:      	notq	%rax
   9ca0a:      	movq	-0xf0(%rbp), %r13
   9ca11:      	andq	%r13, %rax
   9ca14:      	xorq	%r8, %rax
   9ca17:      	movq	%rax, -0x58(%rbp)
   9ca1b:      	movq	%r13, %rax
   9ca1e:      	notq	%r13
   9ca21:      	movq	-0xd8(%rbp), %r8
   9ca28:      	andq	%r8, %r13
   9ca2b:      	xorq	%r14, %r13
   9ca2e:      	movq	%r8, %r12
   9ca31:      	notq	%r12
   9ca34:      	andq	%r11, %r12
   9ca37:      	xorq	%rax, %r12
   9ca3a:      	notq	%r11
   9ca3d:      	andq	-0x30(%rbp), %r11
   9ca41:      	movq	-0x218(%rbp), %rax
   9ca48:      	xorq	-0x380(%rbp,%rax,8), %rdi
   9ca50:      	xorq	%r8, %r11
   9ca53:      	xorq	-0xc0(%rbp), %rdi
   9ca5a:      	incq	%rax
   9ca5d:      	movq	%rax, %r14
   9ca60:      	cmpq	$0x1a, %rax
   9ca64:      	jne	0x9c5b6 <<toyos_crypto::keccak::Sponge>::permute (.llvm.2207912294309834671)+0x1f6>
   9ca6a:      	movq	-0x40(%rbp), %rax
   9ca6e:      	movq	%rax, 0x8(%rbx)
   9ca72:      	movq	-0xb0(%rbp), %rax
   9ca79:      	movq	%rax, 0x10(%rbx)
   9ca7d:      	movq	-0x88(%rbp), %rax
   9ca84:      	movq	%rax, 0x18(%rbx)
   9ca88:      	movq	-0xc8(%rbp), %rax
   9ca8f:      	movq	%rax, 0x20(%rbx)
   9ca93:      	movq	-0xb8(%rbp), %rax
   9ca9a:      	movq	%rax, 0x28(%rbx)
   9ca9e:      	movq	-0xa8(%rbp), %rax
   9caa5:      	movq	%rax, 0x30(%rbx)
   9caa9:      	movq	-0x90(%rbp), %rax
   9cab0:      	movq	%rax, 0x38(%rbx)
   9cab4:      	movq	-0x68(%rbp), %rax
   9cab8:      	movq	%rax, 0x40(%rbx)
   9cabc:      	movq	-0x48(%rbp), %rax
   9cac0:      	movq	%rax, 0x48(%rbx)
   9cac4:      	movq	-0xa0(%rbp), %rax
   9cacb:      	movq	%rax, 0x50(%rbx)
   9cacf:      	movq	-0x98(%rbp), %rax
   9cad6:      	movq	%rax, 0x58(%rbx)
   9cada:      	movq	-0x70(%rbp), %rax
   9cade:      	movq	%rax, 0x60(%rbx)
   9cae2:      	movq	-0x50(%rbp), %rax
   9cae6:      	movq	%rax, 0x68(%rbx)
   9caea:      	movq	%rdx, 0x70(%rbx)
   9caee:      	movq	-0x80(%rbp), %rax
   9caf2:      	movq	%rax, 0x78(%rbx)
   9caf6:      	movq	-0x78(%rbp), %rax
   9cafa:      	movq	%rax, 0x80(%rbx)
   9cb01:      	movq	%r10, 0x88(%rbx)
   9cb08:      	movq	%r9, 0x90(%rbx)
   9cb0f:      	movq	%r15, 0x98(%rbx)
   9cb16:      	movq	-0x60(%rbp), %rax
   9cb1a:      	movq	%rax, 0xa0(%rbx)
   9cb21:      	movq	-0x58(%rbp), %rax
   9cb25:      	movq	%rax, 0xa8(%rbx)
   9cb2c:      	movq	%r13, 0xb0(%rbx)
   9cb33:      	movq	%r12, 0xb8(%rbx)
   9cb3a:      	movq	%r11, 0xc0(%rbx)
   9cb41:      	movq	%rdi, (%rbx)
   9cb44:      	movq	-0xe8(%rbp), %rax
   9cb4b:      	movq	%rax, -0x190(%rbp)
   9cb52:      	movq	-0x38(%rbp), %rax
   9cb56:      	movq	%rax, -0x278(%rbp)
   9cb5d:      	movq	-0x1f8(%rbp), %rax
   9cb64:      	movq	%rax, -0x1b8(%rbp)
   9cb6b:      	movq	-0x1f0(%rbp), %rax
   9cb72:      	movq	%rax, -0x2a0(%rbp)
   9cb79:      	movq	-0xe0(%rbp), %rax
   9cb80:      	movq	%rax, -0x298(%rbp)
   9cb87:      	movq	-0xd8(%rbp), %rax
   9cb8e:      	movq	%rax, -0x248(%rbp)
   9cb95:      	movq	-0x1e8(%rbp), %rax
   9cb9c:      	movq	%rax, -0x2b0(%rbp)
   9cba3:      	movq	-0x1e0(%rbp), %rax
   9cbaa:      	movq	%rax, -0x270(%rbp)
   9cbb1:      	movq	-0x1d8(%rbp), %rax
   9cbb8:      	movq	%rax, -0x1b0(%rbp)
   9cbbf:      	movq	-0x210(%rbp), %rax
   9cbc6:      	movq	%rax, -0x178(%rbp)
   9cbcd:      	movq	-0x208(%rbp), %rax
   9cbd4:      	movq	%rax, -0x170(%rbp)
   9cbdb:      	movq	-0xd0(%rbp), %rax
   9cbe2:      	movq	%rax, -0x168(%rbp)
   9cbe9:      	movq	%rsi, -0x160(%rbp)
   9cbf0:      	movq	%rcx, -0x158(%rbp)
   9cbf7:      	movq	-0xc0(%rbp), %rax
   9cbfe:      	movq	%rax, -0x1d0(%rbp)
   9cc05:      	movq	-0x150(%rbp), %rax
   9cc0c:      	movq	%rax, -0x188(%rbp)
   9cc13:      	movq	-0x148(%rbp), %rax
   9cc1a:      	movq	%rax, -0x268(%rbp)
   9cc21:      	movq	-0x140(%rbp), %rax
   9cc28:      	movq	%rax, -0x1a8(%rbp)
   9cc2f:      	movq	-0x138(%rbp), %rax
   9cc36:      	movq	%rax, -0x290(%rbp)
   9cc3d:      	movq	-0x130(%rbp), %rax
   9cc44:      	movq	%rax, -0x288(%rbp)
   9cc4b:      	movq	-0x128(%rbp), %rax
   9cc52:      	movq	%rax, -0x1c8(%rbp)
   9cc59:      	movq	-0x120(%rbp), %rax
   9cc60:      	movq	%rax, -0x180(%rbp)
   9cc67:      	movq	-0x30(%rbp), %rax
   9cc6b:      	movq	%rax, -0x260(%rbp)
   9cc72:      	movq	-0x118(%rbp), %rax
   9cc79:      	movq	%rax, -0x1a0(%rbp)
   9cc80:      	movq	-0x110(%rbp), %rax
   9cc87:      	movq	%rax, -0x198(%rbp)
   9cc8e:      	movq	-0x108(%rbp), %rax
   9cc95:      	movq	%rax, -0x280(%rbp)
   9cc9c:      	movq	-0x200(%rbp), %rax
   9cca3:      	movq	%rax, -0x1c0(%rbp)
   9ccaa:      	movq	-0x100(%rbp), %rax
   9ccb1:      	movq	%rax, -0x2a8(%rbp)
   9ccb8:      	movq	-0xf8(%rbp), %rax
   9ccbf:      	movq	%rax, -0x258(%rbp)
   9ccc6:      	movq	-0xf0(%rbp), %rax
   9cccd:      	movq	%rax, -0x250(%rbp)
   9ccd4:      	movq	$0x0, -0x240(%rbp)
   9ccdf:      	movq	$0x0, -0x238(%rbp)
   9ccea:      	movq	$0x0, -0x230(%rbp)
   9ccf5:      	movq	$0x0, -0x228(%rbp)
   9cd00:      	movq	$0x0, -0x220(%rbp)
   9cd0b:      	movq	$0x0, -0x178(%rbp)
   9cd16:      	movq	$0x0, -0x170(%rbp)
   9cd21:      	movq	$0x0, -0x168(%rbp)
   9cd2c:      	movq	$0x0, -0x160(%rbp)
   9cd37:      	movq	$0x0, -0x158(%rbp)
   9cd42:      	movq	$0x0, -0x1d0(%rbp)
   9cd4d:      	movq	$0x0, -0x1c8(%rbp)
   9cd58:      	movq	$0x0, -0x1c0(%rbp)
   9cd63:      	movq	$0x0, -0x1b8(%rbp)
   9cd6e:      	movq	$0x0, -0x1b0(%rbp)
   9cd79:      	movq	$0x0, -0x1a8(%rbp)
   9cd84:      	movq	$0x0, -0x1a0(%rbp)
   9cd8f:      	movq	$0x0, -0x198(%rbp)
   9cd9a:      	movq	$0x0, -0x190(%rbp)
   9cda5:      	movq	$0x0, -0x2b0(%rbp)
   9cdb0:      	movq	$0x0, -0x188(%rbp)
   9cdbb:      	movq	$0x0, -0x180(%rbp)
   9cdc6:      	movq	$0x0, -0x2a8(%rbp)
   9cdd1:      	movq	$0x0, -0x2a0(%rbp)
   9cddc:      	movq	$0x0, -0x298(%rbp)
   9cde7:      	movq	$0x0, -0x290(%rbp)
   9cdf2:      	movq	$0x0, -0x288(%rbp)
   9cdfd:      	movq	$0x0, -0x280(%rbp)
   9ce08:      	movq	$0x0, -0x278(%rbp)
   9ce13:      	movq	$0x0, -0x270(%rbp)
   9ce1e:      	movq	$0x0, -0x268(%rbp)
   9ce29:      	movq	$0x0, -0x260(%rbp)
   9ce34:      	movq	$0x0, -0x258(%rbp)
   9ce3f:      	movq	$0x0, -0x250(%rbp)
   9ce4a:      	movq	$0x0, -0x248(%rbp)
   9ce55:      	addq	$0x358, %rsp            # imm = 0x358
   9ce5c:      	popq	%rbx
   9ce5d:      	popq	%r12
   9ce5f:      	popq	%r13
   9ce61:      	popq	%r14
   9ce63:      	popq	%r15
   9ce65:      	popq	%rbp
   9ce66:      	retq
   9ce67:      	int3
   9ce68:      	int3
   9ce69:      	int3
   9ce6a:      	int3
   9ce6b:      	int3
   9ce6c:      	int3
   9ce6d:      	int3
   9ce6e:      	int3
   9ce6f:      	int3

000000000009ce70 <toyos_crypto::keccak::g>:
   9ce70:      	pushq	%rbp
   9ce71:      	movq	%rsp, %rbp
   9ce74:      	pushq	%r15
   9ce76:      	pushq	%r14
   9ce78:      	pushq	%rbx
   9ce79:      	subq	$0x118, %rsp            # imm = 0x118
   9ce80:      	movq	%rdx, %r8
   9ce83:      	movq	%rsi, %rcx
   9ce86:      	movq	%rdi, %rbx
   9ce89:      	xorps	%xmm0, %xmm0
   9ce8c:      	movaps	%xmm0, -0x100(%rbp)
   9ce93:      	movaps	%xmm0, -0x110(%rbp)
   9ce9a:      	movaps	%xmm0, -0x120(%rbp)
   9cea1:      	movaps	%xmm0, -0x130(%rbp)
   9cea8:      	leaq	-0xf0(%rbp), %r14
   9ceaf:      	movl	$0x48, %esi
   9ceb4:      	movq	%r14, %rdi
   9ceb7:      	movl	$0x6, %edx
   9cebc:      	callq	0x9c140 <<toyos_crypto::keccak::Sponge>::new>
   9cec1:      	xorl	%r15d, %r15d
   9cec4:      	movq	-0x20(%rbp), %rax
   9cec8:      	jmp	0x9cf10 <toyos_crypto::keccak::g+0xa0>
   9ceca:      	nopw	(%rax,%rax)
   9ced0:      	movq	%r14, %rdi
   9ced3:      	callq	0x9c3c0 <<toyos_crypto::keccak::Sponge>::permute (.llvm.2207912294309834671)>
   9ced8:      	movq	$0x0, -0x20(%rbp)
   9cee0:      	xorl	%edi, %edi
   9cee2:      	xorl	%eax, %eax
   9cee4:      	leaq	-0xf0(,%rdi,8), %rcx
   9ceec:      	addq	%rbp, %rcx
   9ceef:      	movl	%eax, %edx
   9cef1:      	andl	$0x7, %edx
   9cef4:      	movzbl	(%rdx,%rcx), %ecx
   9cef8:      	movb	%cl, -0x130(%rbp,%r15)
   9cf00:      	incq	%r15
   9cf03:      	incq	%rax
   9cf06:      	movq	%rax, -0x20(%rbp)
   9cf0a:      	cmpq	$0x40, %r15
   9cf0e:      	je	0x9cf38 <toyos_crypto::keccak::g+0xc8>
   9cf10:      	cmpq	-0x28(%rbp), %rax
   9cf14:      	je	0x9ced0 <toyos_crypto::keccak::g+0x60>
   9cf16:      	movq	%rax, %rdi
   9cf19:      	shrq	$0x3, %rdi
   9cf1d:      	cmpq	$0xc8, %rax
   9cf23:      	jb	0x9cee4 <toyos_crypto::keccak::g+0x74>
   9cf25:      	leaq	0x76dac(%rip), %rdx     # 0x113cd8 <anon.68c3b30278565fbd7c0b87acd371f0b5.8.llvm.2207912294309834671>
   9cf2c:      	movl	$0x19, %esi
   9cf31:      	callq	0x10b09d <core::panicking::panic_bounds_check>
   9cf36:      	ud2
   9cf38:      	movq	$0x0, -0xf0(%rbp)
   9cf43:      	movq	$0x0, -0xe8(%rbp)
   9cf4e:      	movq	$0x0, -0xe0(%rbp)
   9cf59:      	movq	$0x0, -0xd8(%rbp)
   9cf64:      	movq	$0x0, -0xd0(%rbp)
   9cf6f:      	movq	$0x0, -0xc8(%rbp)
   9cf7a:      	movq	$0x0, -0xc0(%rbp)
   9cf85:      	movq	$0x0, -0xb8(%rbp)
   9cf90:      	movq	$0x0, -0xb0(%rbp)
   9cf9b:      	movq	$0x0, -0xa8(%rbp)
   9cfa6:      	movq	$0x0, -0xa0(%rbp)
   9cfb1:      	movq	$0x0, -0x98(%rbp)
   9cfbc:      	movq	$0x0, -0x90(%rbp)
   9cfc7:      	movq	$0x0, -0x88(%rbp)
   9cfd2:      	movq	$0x0, -0x80(%rbp)
   9cfda:      	movq	$0x0, -0x78(%rbp)
   9cfe2:      	movq	$0x0, -0x70(%rbp)
   9cfea:      	movq	$0x0, -0x68(%rbp)
   9cff2:      	movq	$0x0, -0x60(%rbp)
   9cffa:      	movq	$0x0, -0x58(%rbp)
   9d002:      	movq	$0x0, -0x50(%rbp)
   9d00a:      	movq	$0x0, -0x48(%rbp)
   9d012:      	movq	$0x0, -0x40(%rbp)
   9d01a:      	movq	$0x0, -0x38(%rbp)
   9d022:      	movq	$0x0, -0x30(%rbp)
   9d02a:      	movaps	-0x130(%rbp), %xmm0
   9d031:      	movaps	-0x120(%rbp), %xmm1
   9d038:      	movaps	-0x110(%rbp), %xmm2
   9d03f:      	movaps	-0x100(%rbp), %xmm3
   9d046:      	movups	%xmm3, 0x30(%rbx)
   9d04a:      	movups	%xmm2, 0x20(%rbx)
   9d04e:      	movups	%xmm1, 0x10(%rbx)
   9d052:      	movups	%xmm0, (%rbx)
   9d055:      	movq	%rbx, %rax
   9d058:      	addq	$0x118, %rsp            # imm = 0x118
   9d05f:      	popq	%rbx
   9d060:      	popq	%r14
   9d062:      	popq	%r15
   9d064:      	popq	%rbp
   9d065:      	retq
   9d066:      	movq	%rax, %rbx
   9d069:      	leaq	-0xf0(%rbp), %rdi
   9d070:      	callq	0x95500 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   9d075:      	movq	%rbx, %rdi
   9d078:      	callq	0x105eb0 <_Unwind_Resume>
   9d07d:      	callq	0x10b08a <core::panicking::panic_in_cleanup>
   9d082:      	int3
   9d083:      	int3
   9d084:      	int3
   9d085:      	int3
   9d086:      	int3
   9d087:      	int3
   9d088:      	int3
   9d089:      	int3
   9d08a:      	int3
   9d08b:      	int3
   9d08c:      	int3
   9d08d:      	int3
   9d08e:      	int3
   9d08f:      	int3

000000000009d090 <toyos_crypto::keccak::h>:
   9d090:      	pushq	%rbp
   9d091:      	movq	%rsp, %rbp
   9d094:      	pushq	%r15
   9d096:      	pushq	%r14
   9d098:      	pushq	%rbx
   9d099:      	subq	$0x108, %rsp            # imm = 0x108
   9d0a0:      	movq	%rdx, %r8
   9d0a3:      	movq	%rsi, %rcx
   9d0a6:      	movq	%rdi, %rbx
   9d0a9:      	xorps	%xmm0, %xmm0
   9d0ac:      	movaps	%xmm0, -0x30(%rbp)
   9d0b0:      	movaps	%xmm0, -0x40(%rbp)
   9d0b4:      	leaq	-0x118(%rbp), %r14
   9d0bb:      	movl	$0x88, %esi
   9d0c0:      	movq	%r14, %rdi
   9d0c3:      	movl	$0x6, %edx
   9d0c8:      	callq	0x9c140 <<toyos_crypto::keccak::Sponge>::new>
   9d0cd:      	xorl	%r15d, %r15d
   9d0d0:      	movq	-0x48(%rbp), %rax
   9d0d4:      	jmp	0x9d11d <toyos_crypto::keccak::h+0x8d>
   9d0d6:      	nopw	%cs:(%rax,%rax)
   9d0e0:      	movq	%r14, %rdi
   9d0e3:      	callq	0x9c3c0 <<toyos_crypto::keccak::Sponge>::permute (.llvm.2207912294309834671)>
   9d0e8:      	movq	$0x0, -0x48(%rbp)
   9d0f0:      	xorl	%edi, %edi
   9d0f2:      	xorl	%eax, %eax
   9d0f4:      	leaq	-0x118(,%rdi,8), %rcx
   9d0fc:      	addq	%rbp, %rcx
   9d0ff:      	movl	%eax, %edx
   9d101:      	andl	$0x7, %edx
   9d104:      	movzbl	(%rdx,%rcx), %ecx
   9d108:      	movb	%cl, -0x40(%rbp,%r15)
   9d10d:      	incq	%r15
   9d110:      	incq	%rax
   9d113:      	movq	%rax, -0x48(%rbp)
   9d117:      	cmpq	$0x20, %r15
   9d11b:      	je	0x9d145 <toyos_crypto::keccak::h+0xb5>
   9d11d:      	cmpq	-0x50(%rbp), %rax
   9d121:      	je	0x9d0e0 <toyos_crypto::keccak::h+0x50>
   9d123:      	movq	%rax, %rdi
   9d126:      	shrq	$0x3, %rdi
   9d12a:      	cmpq	$0xc8, %rax
   9d130:      	jb	0x9d0f4 <toyos_crypto::keccak::h+0x64>
   9d132:      	leaq	0x76b9f(%rip), %rdx     # 0x113cd8 <anon.68c3b30278565fbd7c0b87acd371f0b5.8.llvm.2207912294309834671>
   9d139:      	movl	$0x19, %esi
   9d13e:      	callq	0x10b09d <core::panicking::panic_bounds_check>
   9d143:      	ud2
   9d145:      	movq	$0x0, -0x118(%rbp)
   9d150:      	movq	$0x0, -0x110(%rbp)
   9d15b:      	movq	$0x0, -0x108(%rbp)
   9d166:      	movq	$0x0, -0x100(%rbp)
   9d171:      	movq	$0x0, -0xf8(%rbp)
   9d17c:      	movq	$0x0, -0xf0(%rbp)
   9d187:      	movq	$0x0, -0xe8(%rbp)
   9d192:      	movq	$0x0, -0xe0(%rbp)
   9d19d:      	movq	$0x0, -0xd8(%rbp)
   9d1a8:      	movq	$0x0, -0xd0(%rbp)
   9d1b3:      	movq	$0x0, -0xc8(%rbp)
   9d1be:      	movq	$0x0, -0xc0(%rbp)
   9d1c9:      	movq	$0x0, -0xb8(%rbp)
   9d1d4:      	movq	$0x0, -0xb0(%rbp)
   9d1df:      	movq	$0x0, -0xa8(%rbp)
   9d1ea:      	movq	$0x0, -0xa0(%rbp)
   9d1f5:      	movq	$0x0, -0x98(%rbp)
   9d200:      	movq	$0x0, -0x90(%rbp)
   9d20b:      	movq	$0x0, -0x88(%rbp)
   9d216:      	movq	$0x0, -0x80(%rbp)
   9d21e:      	movq	$0x0, -0x78(%rbp)
   9d226:      	movq	$0x0, -0x70(%rbp)
   9d22e:      	movq	$0x0, -0x68(%rbp)
   9d236:      	movq	$0x0, -0x60(%rbp)
   9d23e:      	movq	$0x0, -0x58(%rbp)
   9d246:      	movaps	-0x40(%rbp), %xmm0
   9d24a:      	movaps	-0x30(%rbp), %xmm1
   9d24e:      	movups	%xmm1, 0x10(%rbx)
   9d252:      	movups	%xmm0, (%rbx)
   9d255:      	movq	%rbx, %rax
   9d258:      	addq	$0x108, %rsp            # imm = 0x108
   9d25f:      	popq	%rbx
   9d260:      	popq	%r14
   9d262:      	popq	%r15
   9d264:      	popq	%rbp
   9d265:      	retq
   9d266:      	movq	%rax, %rbx
   9d269:      	leaq	-0x118(%rbp), %rdi
   9d270:      	callq	0x95500 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   9d275:      	movq	%rbx, %rdi
   9d278:      	callq	0x105eb0 <_Unwind_Resume>
   9d27d:      	callq	0x10b08a <core::panicking::panic_in_cleanup>
   9d282:      	int3
   9d283:      	int3
   9d284:      	int3
   9d285:      	int3
   9d286:      	int3
   9d287:      	int3
   9d288:      	int3
   9d289:      	int3
   9d28a:      	int3
   9d28b:      	int3
   9d28c:      	int3
   9d28d:      	int3
   9d28e:      	int3
   9d28f:      	int3

