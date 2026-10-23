0000000000057a70 <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<sshserver::OsRandom>>:
   57a70:      	pushq	%rbp
   57a71:      	movq	%rsp, %rbp
   57a74:      	pushq	%r15
   57a76:      	pushq	%r14
   57a78:      	pushq	%r12
   57a7a:      	pushq	%rbx
   57a7b:      	subq	$0x930, %rsp            # imm = 0x930
   57a82:      	movq	%rsi, %r14
   57a85:      	movq	%rdi, %rbx
   57a88:      	xorps	%xmm0, %xmm0
   57a8b:      	movaps	%xmm0, -0x30(%rbp)
   57a8f:      	movaps	%xmm0, -0x40(%rbp)
   57a93:      	leaq	-0x40(%rbp), %r15
   57a97:      	movl	$0x20, %esi
   57a9c:      	movq	%r15, %rdi
   57a9f:      	callq	0x77780 <toyos_abi::syscall::random>
   57aa4:      	cmpq	$-0x1, %rax
   57aa8:      	je	0x57ab4 <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<sshserver::OsRandom>+0x44>
   57aaa:      	movw	$0x701, (%rbx)          # imm = 0x701
   57aaf:      	jmp	0x57bfc <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<sshserver::OsRandom>+0x18c>
   57ab4:      	movq	%r14, -0x510(%rbp)
   57abb:      	movq	$0x4a0, -0x508(%rbp)    # imm = 0x4A0
   57ac6:      	leaq	-0xb0(%rbp), %r12
   57acd:      	leaq	-0x510(%rbp), %rsi
   57ad4:      	movl	$0x1, %edx
   57ad9:      	movq	%r12, %rdi
   57adc:      	callq	0x99700 <toyos_crypto::keccak::h>
   57ae1:      	movq	%r15, -0x950(%rbp)
   57ae8:      	movq	$0x20, -0x948(%rbp)
   57af3:      	movq	%r12, -0x940(%rbp)
   57afa:      	movq	$0x20, -0x938(%rbp)
   57b05:      	leaq	-0x510(%rbp), %rdi
   57b0c:      	leaq	-0x950(%rbp), %rsi
   57b13:      	movl	$0x2, %edx
   57b18:      	callq	0x99550 <toyos_crypto::keccak::g>
   57b1d:      	movups	-0x510(%rbp), %xmm0
   57b24:      	movups	-0x500(%rbp), %xmm1
   57b2b:      	movups	-0x4f0(%rbp), %xmm2
   57b32:      	movups	-0x4e0(%rbp), %xmm3
   57b39:      	movaps	%xmm3, -0x60(%rbp)
   57b3d:      	movaps	%xmm2, -0x70(%rbp)
   57b41:      	movaps	%xmm1, -0x80(%rbp)
   57b45:      	movaps	%xmm0, -0x90(%rbp)
   57b4c:      	leaq	-0x70(%rbp), %r15
   57b50:      	leaq	-0x950(%rbp), %rdi
   57b57:      	leaq	-0x40(%rbp), %rdx
   57b5b:      	movq	%r14, %rsi
   57b5e:      	movq	%r15, %rcx
   57b61:      	callq	0x8d240 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>
   57b66:      	movaps	-0x90(%rbp), %xmm0
   57b6d:      	movaps	-0x80(%rbp), %xmm1
   57b71:      	movups	%xmm1, -0xc0(%rbp)
   57b78:      	movups	%xmm0, -0xd0(%rbp)
   57b7f:      	leaq	-0x510(%rbp), %r14
   57b86:      	leaq	-0x950(%rbp), %rsi
   57b8d:      	movl	$0x440, %edx            # imm = 0x440
   57b92:      	movq	%r14, %rdi
   57b95:      	callq	0x10be00 <memcpy>
   57b9a:      	leaq	0x1(%rbx), %rdi
   57b9e:      	movl	$0x460, %edx            # imm = 0x460
   57ba3:      	movq	%r14, %rsi
   57ba6:      	callq	0x10be00 <memcpy>
   57bab:      	movb	$0x0, (%rbx)
   57bae:      	xorps	%xmm0, %xmm0
   57bb1:      	movaps	%xmm0, -0x510(%rbp)
   57bb8:      	movaps	-0x510(%rbp), %xmm1
   57bbf:      	movaps	%xmm1, -0x90(%rbp)
   57bc6:      	movaps	%xmm0, -0x510(%rbp)
   57bcd:      	movaps	-0x510(%rbp), %xmm1
   57bd4:      	movaps	%xmm1, -0x80(%rbp)
   57bd8:      	movaps	%xmm0, -0x510(%rbp)
   57bdf:      	movaps	-0x510(%rbp), %xmm1
   57be6:      	movups	%xmm1, (%r15)
   57bea:      	movaps	%xmm0, -0x510(%rbp)
   57bf1:      	movaps	-0x510(%rbp), %xmm0
   57bf8:      	movaps	%xmm0, -0x60(%rbp)
   57bfc:      	xorps	%xmm0, %xmm0
   57bff:      	movaps	%xmm0, -0x510(%rbp)
   57c06:      	movaps	-0x510(%rbp), %xmm1
   57c0d:      	movaps	%xmm1, -0x40(%rbp)
   57c11:      	movaps	%xmm0, -0x510(%rbp)
   57c18:      	movaps	-0x510(%rbp), %xmm0
   57c1f:      	movaps	%xmm0, -0x30(%rbp)
   57c23:      	movq	%rbx, %rax
   57c26:      	addq	$0x930, %rsp            # imm = 0x930
   57c2d:      	popq	%rbx
   57c2e:      	popq	%r12
   57c30:      	popq	%r14
   57c32:      	popq	%r15
   57c34:      	popq	%rbp
   57c35:      	retq
   57c36:      	xorps	%xmm0, %xmm0
   57c39:      	movaps	%xmm0, -0x510(%rbp)
   57c40:      	movaps	-0x510(%rbp), %xmm1
   57c47:      	movaps	%xmm1, -0x90(%rbp)
   57c4e:      	movaps	%xmm0, -0x510(%rbp)
   57c55:      	movaps	-0x510(%rbp), %xmm1
   57c5c:      	movaps	%xmm1, -0x80(%rbp)
   57c60:      	movaps	%xmm0, -0x510(%rbp)
   57c67:      	movaps	-0x510(%rbp), %xmm1
   57c6e:      	movups	%xmm1, (%r15)
   57c72:      	movaps	%xmm0, -0x510(%rbp)
   57c79:      	movaps	-0x510(%rbp), %xmm0
   57c80:      	movaps	%xmm0, -0x60(%rbp)
   57c84:      	jmp	0x57c86 <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<sshserver::OsRandom>+0x216>
   57c86:      	xorps	%xmm0, %xmm0
   57c89:      	movaps	%xmm0, -0x50(%rbp)
   57c8d:      	movaps	-0x50(%rbp), %xmm1
   57c91:      	movaps	%xmm1, -0x40(%rbp)
   57c95:      	movaps	%xmm0, -0x50(%rbp)
   57c99:      	movaps	-0x50(%rbp), %xmm0
   57c9d:      	movaps	%xmm0, -0x30(%rbp)
   57ca1:      	movq	%rax, %rdi
   57ca4:      	callq	0x102010 <_Unwind_Resume>
   57ca9:      	int3
   57caa:      	int3
   57cab:      	int3
   57cac:      	int3
   57cad:      	int3
   57cae:      	int3
   57caf:      	int3

000000000008ce70 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>:
   8ce70:      	pushq	%rbp
   8ce71:      	movq	%rsp, %rbp
   8ce74:      	movq	0x10(%rdi), %rax
   8ce78:      	cmpq	0x8(%rdi), %rax
   8ce7c:      	ja	0x8cef5 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x85>
   8ce7e:      	testq	%rax, %rax
   8ce81:      	je	0x8cef3 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x83>
   8ce83:      	movq	(%rdi), %rcx
   8ce86:      	addq	$0xe, %rcx
   8ce8a:      	xorl	%edx, %edx
   8ce8c:      	nopl	(%rax)
   8ce90:      	xorl	%esi, %esi
   8ce92:      	nopw	%cs:(%rax,%rax)
   8cea0:      	movw	$0x0, -0xe(%rcx,%rsi)
   8cea7:      	movw	$0x0, -0xc(%rcx,%rsi)
   8ceae:      	movw	$0x0, -0xa(%rcx,%rsi)
   8ceb5:      	movw	$0x0, -0x8(%rcx,%rsi)
   8cebc:      	movw	$0x0, -0x6(%rcx,%rsi)
   8cec3:      	movw	$0x0, -0x4(%rcx,%rsi)
   8ceca:      	movw	$0x0, -0x2(%rcx,%rsi)
   8ced1:      	movw	$0x0, (%rcx,%rsi)
   8ced7:      	addq	$0x10, %rsi
   8cedb:      	cmpq	$0x200, %rsi            # imm = 0x200
   8cee2:      	jne	0x8cea0 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x30>
   8cee4:      	incq	%rdx
   8cee7:      	addq	$0x200, %rcx            # imm = 0x200
   8ceee:      	cmpq	%rax, %rdx
   8cef1:      	jne	0x8ce90 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x20>
   8cef3:      	popq	%rbp
   8cef4:      	retq
   8cef5:      	leaq	-0x70736(%rip), %rdi    # 0x1c7c6 <toyos_crypto::ed25519::B_ODD+0xf96>
   8cefc:      	leaq	0x82cfd(%rip), %rcx     # 0x10fc00 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x2c8>
   8cf03:      	movl	$0x1b5, %esi            # imm = 0x1B5
   8cf08:      	xorl	%edx, %edx
   8cf0a:      	callq	0x107240 <core::panicking::panic_nounwind_fmt>
   8cf0f:      	int3

000000000008cf10 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes>:
   8cf10:      	pushq	%rbp
   8cf11:      	movq	%rsp, %rbp
   8cf14:      	pushq	%r14
   8cf16:      	pushq	%rbx
   8cf17:      	subq	$0x200, %rsp            # imm = 0x200
   8cf1e:      	movq	%rdi, %rbx
   8cf21:      	cmpq	$0x4a0, %rdx            # imm = 0x4A0
   8cf28:      	jne	0x8cffe <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0xee>
   8cf2e:      	movq	%rsi, %r14
   8cf31:      	leaq	-0x210(%rbp), %rdi
   8cf38:      	movl	$0x180, %edx            # imm = 0x180
   8cf3d:      	callq	0x900b0 <<toyos_crypto::mlkem::Poly>::decode::<12>>
   8cf42:      	movl	$0x6, %eax
   8cf47:      	nopw	(%rax,%rax)
   8cf50:      	cmpq	$0x206, %rax            # imm = 0x206
   8cf56:      	je	0x8d012 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x102>
   8cf5c:      	cmpw	$0xd00, -0x216(%rbp,%rax) # imm = 0xD00
   8cf66:      	jg	0x8cf90 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
   8cf68:      	cmpw	$0xd00, -0x214(%rbp,%rax) # imm = 0xD00
   8cf72:      	jg	0x8cf90 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
   8cf74:      	cmpw	$0xd00, -0x212(%rbp,%rax) # imm = 0xD00
   8cf7e:      	jg	0x8cf90 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
   8cf80:      	cmpw	$0xd00, -0x210(%rbp,%rax) # imm = 0xD00
   8cf8a:      	leaq	0x8(%rax), %rax
   8cf8e:      	jle	0x8cf50 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x40>
   8cf90:      	movw	$0x201, (%rbx)          # imm = 0x201
   8cf95:      	xorl	%eax, %eax
   8cf97:      	nopw	(%rax,%rax)
   8cfa0:      	movw	$0x0, -0x210(%rbp,%rax)
   8cfaa:      	movw	$0x0, -0x20e(%rbp,%rax)
   8cfb4:      	movw	$0x0, -0x20c(%rbp,%rax)
   8cfbe:      	movw	$0x0, -0x20a(%rbp,%rax)
   8cfc8:      	movw	$0x0, -0x208(%rbp,%rax)
   8cfd2:      	movw	$0x0, -0x206(%rbp,%rax)
   8cfdc:      	movw	$0x0, -0x204(%rbp,%rax)
   8cfe6:      	movw	$0x0, -0x202(%rbp,%rax)
   8cff0:      	addq	$0x10, %rax
   8cff4:      	cmpq	$0x200, %rax            # imm = 0x200
   8cffa:      	jne	0x8cfa0 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x90>
   8cffc:      	jmp	0x8d003 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0xf3>
   8cffe:      	movw	$0x1, (%rbx)
   8d003:      	movq	%rbx, %rax
   8d006:      	addq	$0x200, %rsp            # imm = 0x200
   8d00d:      	popq	%rbx
   8d00e:      	popq	%r14
   8d010:      	popq	%rbp
   8d011:      	retq
   8d012:      	movl	$0xe, %eax
   8d017:      	nopw	(%rax,%rax)
   8d020:      	movw	$0x0, -0x21e(%rbp,%rax)
   8d02a:      	movw	$0x0, -0x21c(%rbp,%rax)
   8d034:      	movw	$0x0, -0x21a(%rbp,%rax)
   8d03e:      	movw	$0x0, -0x218(%rbp,%rax)
   8d048:      	movw	$0x0, -0x216(%rbp,%rax)
   8d052:      	movw	$0x0, -0x214(%rbp,%rax)
   8d05c:      	movw	$0x0, -0x212(%rbp,%rax)
   8d066:      	movw	$0x0, -0x210(%rbp,%rax)
   8d070:      	addq	$0x10, %rax
   8d074:      	cmpq	$0x20e, %rax            # imm = 0x20E
   8d07a:      	jne	0x8d020 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x110>
   8d07c:      	leaq	0x180(%r14), %rsi
   8d083:      	leaq	-0x210(%rbp), %rdi
   8d08a:      	movl	$0x180, %edx            # imm = 0x180
   8d08f:      	callq	0x900b0 <<toyos_crypto::mlkem::Poly>::decode::<12>>
   8d094:      	movl	$0x6, %eax
   8d099:      	nopl	(%rax)
   8d0a0:      	cmpq	$0x206, %rax            # imm = 0x206
   8d0a6:      	je	0x8d0ed <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x1dd>
   8d0a8:      	cmpw	$0xd00, -0x216(%rbp,%rax) # imm = 0xD00
   8d0b2:      	jg	0x8cf90 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
   8d0b8:      	cmpw	$0xd00, -0x214(%rbp,%rax) # imm = 0xD00
   8d0c2:      	jg	0x8cf90 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
   8d0c8:      	cmpw	$0xd00, -0x212(%rbp,%rax) # imm = 0xD00
   8d0d2:      	jg	0x8cf90 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
   8d0d8:      	cmpw	$0xd00, -0x210(%rbp,%rax) # imm = 0xD00
   8d0e2:      	leaq	0x8(%rax), %rax
   8d0e6:      	jle	0x8d0a0 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x190>
   8d0e8:      	jmp	0x8cf90 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
   8d0ed:      	movl	$0xe, %eax
   8d0f2:      	nopw	%cs:(%rax,%rax)
   8d100:      	movw	$0x0, -0x21e(%rbp,%rax)
   8d10a:      	movw	$0x0, -0x21c(%rbp,%rax)
   8d114:      	movw	$0x0, -0x21a(%rbp,%rax)
   8d11e:      	movw	$0x0, -0x218(%rbp,%rax)
   8d128:      	movw	$0x0, -0x216(%rbp,%rax)
   8d132:      	movw	$0x0, -0x214(%rbp,%rax)
   8d13c:      	movw	$0x0, -0x212(%rbp,%rax)
   8d146:      	movw	$0x0, -0x210(%rbp,%rax)
   8d150:      	addq	$0x10, %rax
   8d154:      	cmpq	$0x20e, %rax            # imm = 0x20E
   8d15a:      	jne	0x8d100 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x1f0>
   8d15c:      	leaq	0x300(%r14), %rsi
   8d163:      	leaq	-0x210(%rbp), %rdi
   8d16a:      	movl	$0x180, %edx            # imm = 0x180
   8d16f:      	callq	0x900b0 <<toyos_crypto::mlkem::Poly>::decode::<12>>
   8d174:      	xorl	%eax, %eax
   8d176:      	cmpq	$0x200, %rax            # imm = 0x200
   8d17c:      	je	0x8d1c3 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2b3>
   8d17e:      	cmpw	$0xd00, -0x210(%rbp,%rax) # imm = 0xD00
   8d188:      	jg	0x8cf90 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
   8d18e:      	cmpw	$0xd00, -0x20e(%rbp,%rax) # imm = 0xD00
   8d198:      	jg	0x8cf90 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
   8d19e:      	cmpw	$0xd00, -0x20c(%rbp,%rax) # imm = 0xD00
   8d1a8:      	jg	0x8cf90 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
   8d1ae:      	cmpw	$0xd00, -0x20a(%rbp,%rax) # imm = 0xD00
   8d1b8:      	leaq	0x8(%rax), %rax
   8d1bc:      	jle	0x8d176 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x266>
   8d1be:      	jmp	0x8cf90 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
   8d1c3:      	xorl	%eax, %eax
   8d1c5:      	movw	$0x0, -0x210(%rbp,%rax)
   8d1cf:      	movw	$0x0, -0x20e(%rbp,%rax)
   8d1d9:      	movw	$0x0, -0x20c(%rbp,%rax)
   8d1e3:      	movw	$0x0, -0x20a(%rbp,%rax)
   8d1ed:      	movw	$0x0, -0x208(%rbp,%rax)
   8d1f7:      	movw	$0x0, -0x206(%rbp,%rax)
   8d201:      	movw	$0x0, -0x204(%rbp,%rax)
   8d20b:      	movw	$0x0, -0x202(%rbp,%rax)
   8d215:      	addq	$0x10, %rax
   8d219:      	cmpq	$0x200, %rax            # imm = 0x200
   8d21f:      	jne	0x8d1c5 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2b5>
   8d221:      	leaq	0x1(%rbx), %rdi
   8d225:      	movl	$0x4a0, %edx            # imm = 0x4A0
   8d22a:      	movq	%r14, %rsi
   8d22d:      	callq	0x10be00 <memcpy>
   8d232:      	movb	$0x0, (%rbx)
   8d235:      	jmp	0x8d003 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0xf3>
   8d23a:      	int3
   8d23b:      	int3
   8d23c:      	int3
   8d23d:      	int3
   8d23e:      	int3
   8d23f:      	int3

000000000008d240 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>:
   8d240:      	pushq	%rbp
   8d241:      	movq	%rsp, %rbp
   8d244:      	pushq	%r15
   8d246:      	pushq	%r14
   8d248:      	pushq	%r13
   8d24a:      	pushq	%r12
   8d24c:      	pushq	%rbx
   8d24d:      	subq	$0x1000, %rsp           # imm = 0x1000
   8d254:      	movq	$0x0, (%rsp)
   8d25c:      	subq	$0xc88, %rsp            # imm = 0xC88
   8d263:      	movq	%rdx, -0x60(%rbp)
   8d267:      	movq	%rsi, %r15
   8d26a:      	movq	%rdi, -0x58(%rbp)
   8d26e:      	leaq	-0x1270(%rbp), %rax
   8d275:      	movq	%rax, -0xc70(%rbp)
   8d27c:      	movq	$0x3, -0xc68(%rbp)
   8d287:      	xorl	%r14d, %r14d
   8d28a:      	leaq	-0xa70(%rbp), %rdi
   8d291:      	movq	%rcx, -0x38(%rbp)
   8d295:      	movq	%rcx, %rsi
   8d298:      	xorl	%edx, %edx
   8d29a:      	callq	0x8f1c0 <toyos_crypto::mlkem::noise>
   8d29f:      	xorl	%r14d, %r14d
   8d2a2:      	leaq	-0x1cb0(%rbp), %rdi
   8d2a9:      	leaq	-0xa70(%rbp), %rsi
   8d2b0:      	callq	0x8e840 <<toyos_crypto::mlkem::Poly>::ntt>
   8d2b5:      	leaq	-0x270(%rbp), %rbx
   8d2bc:      	leaq	-0x1cb0(%rbp), %rsi
   8d2c3:      	movl	$0x200, %edx            # imm = 0x200
   8d2c8:      	movq	%rbx, %rdi
   8d2cb:      	callq	0x10be00 <memcpy>
   8d2d0:      	leaq	-0x470(%rbp), %r14
   8d2d7:      	movl	$0x200, %edx            # imm = 0x200
   8d2dc:      	movq	%r14, %rdi
   8d2df:      	movq	%rbx, %rsi
   8d2e2:      	callq	0x10be00 <memcpy>
   8d2e7:      	leaq	-0x1870(%rbp), %rbx
   8d2ee:      	movl	$0x200, %edx            # imm = 0x200
   8d2f3:      	movq	%rbx, %rdi
   8d2f6:      	movq	%r14, %rsi
   8d2f9:      	callq	0x10be00 <memcpy>
   8d2fe:      	leaq	-0x1270(%rbp), %rdi
   8d305:      	movl	$0x200, %edx            # imm = 0x200
   8d30a:      	movq	%rbx, %rsi
   8d30d:      	callq	0x10be00 <memcpy>
   8d312:      	movl	$0x1, %r14d
   8d318:      	leaq	-0xa70(%rbp), %rdi
   8d31f:      	movq	-0x38(%rbp), %rsi
   8d323:      	movl	$0x1, %edx
   8d328:      	callq	0x8f1c0 <toyos_crypto::mlkem::noise>
   8d32d:      	leaq	-0x1cb0(%rbp), %rdi
   8d334:      	leaq	-0xa70(%rbp), %rsi
   8d33b:      	callq	0x8e840 <<toyos_crypto::mlkem::Poly>::ntt>
   8d340:      	leaq	-0x270(%rbp), %rbx
   8d347:      	leaq	-0x1cb0(%rbp), %rsi
   8d34e:      	movl	$0x200, %edx            # imm = 0x200
   8d353:      	movq	%rbx, %rdi
   8d356:      	callq	0x10be00 <memcpy>
   8d35b:      	leaq	-0x470(%rbp), %r14
   8d362:      	movl	$0x200, %edx            # imm = 0x200
   8d367:      	movq	%r14, %rdi
   8d36a:      	movq	%rbx, %rsi
   8d36d:      	callq	0x10be00 <memcpy>
   8d372:      	leaq	-0x1870(%rbp), %rbx
   8d379:      	movl	$0x200, %edx            # imm = 0x200
   8d37e:      	movq	%rbx, %rdi
   8d381:      	movq	%r14, %rsi
   8d384:      	callq	0x10be00 <memcpy>
   8d389:      	leaq	-0x1070(%rbp), %rdi
   8d390:      	movl	$0x200, %edx            # imm = 0x200
   8d395:      	movq	%rbx, %rsi
   8d398:      	callq	0x10be00 <memcpy>
   8d39d:      	movl	$0x2, %r14d
   8d3a3:      	leaq	-0xa70(%rbp), %rdi
   8d3aa:      	movq	-0x38(%rbp), %rsi
   8d3ae:      	movl	$0x2, %edx
   8d3b3:      	callq	0x8f1c0 <toyos_crypto::mlkem::noise>
   8d3b8:      	leaq	-0x1cb0(%rbp), %rdi
   8d3bf:      	leaq	-0xa70(%rbp), %rsi
   8d3c6:      	callq	0x8e840 <<toyos_crypto::mlkem::Poly>::ntt>
   8d3cb:      	movq	%r15, -0x68(%rbp)
   8d3cf:      	leaq	0x480(%r15), %r12
   8d3d6:      	leaq	-0x270(%rbp), %rbx
   8d3dd:      	leaq	-0x1cb0(%rbp), %rsi
   8d3e4:      	movl	$0x200, %edx            # imm = 0x200
   8d3e9:      	movq	%rbx, %rdi
   8d3ec:      	callq	0x10be00 <memcpy>
   8d3f1:      	leaq	-0x470(%rbp), %r14
   8d3f8:      	movl	$0x200, %edx            # imm = 0x200
   8d3fd:      	movq	%r14, %rdi
   8d400:      	movq	%rbx, %rsi
   8d403:      	callq	0x10be00 <memcpy>
   8d408:      	leaq	-0x1870(%rbp), %r15
   8d40f:      	movl	$0x200, %edx            # imm = 0x200
   8d414:      	movq	%r15, %rdi
   8d417:      	movq	%r14, %rsi
   8d41a:      	movq	%rbx, %r14
   8d41d:      	callq	0x10be00 <memcpy>
   8d422:      	leaq	-0xe70(%rbp), %rdi
   8d429:      	movl	$0x200, %edx            # imm = 0x200
   8d42e:      	movq	%r15, %rsi
   8d431:      	callq	0x10be00 <memcpy>
   8d436:      	leaq	-0x1870(%rbp), %rdi
   8d43d:      	movl	$0x600, %edx            # imm = 0x600
   8d442:      	leaq	-0x1270(%rbp), %r15
   8d449:      	movq	%r15, %rsi
   8d44c:      	callq	0x10be00 <memcpy>
   8d451:      	leaq	-0x1cb0(%rbp), %rdi
   8d458:      	movq	$0x0, -0x30(%rbp)
   8d460:      	movl	$0x440, %edx            # imm = 0x440
   8d465:      	xorl	%esi, %esi
   8d467:      	callq	0x10c330 <memset>
   8d46c:      	leaq	-0xc70(%rbp), %rbx
   8d473:      	leaq	-0xa70(%rbp), %r13
   8d47a:      	movq	%r12, -0x70(%rbp)
   8d47e:      	nop
   8d480:      	movq	%r15, -0x50(%rbp)
   8d484:      	movq	$0x3, -0x48(%rbp)
   8d48c:      	xorl	%r15d, %r15d
   8d48f:      	movq	%r14, %rdi
   8d492:      	movq	%r12, %rsi
   8d495:      	xorl	%edx, %edx
   8d497:      	movq	-0x30(%rbp), %rcx
   8d49b:      	callq	0x8f5e0 <toyos_crypto::mlkem::sample>
   8d4a0:      	movl	$0x200, %edx            # imm = 0x200
   8d4a5:      	leaq	-0x470(%rbp), %r15
   8d4ac:      	movq	%r15, %rdi
   8d4af:      	leaq	-0x270(%rbp), %r14
   8d4b6:      	movq	%r14, %rsi
   8d4b9:      	callq	0x10be00 <memcpy>
   8d4be:      	movl	$0x200, %edx            # imm = 0x200
   8d4c3:      	movq	%rbx, %rdi
   8d4c6:      	movq	%r15, %rsi
   8d4c9:      	callq	0x10be00 <memcpy>
   8d4ce:      	movl	$0x200, %edx            # imm = 0x200
   8d4d3:      	movq	%r13, %rdi
   8d4d6:      	movq	%rbx, %rsi
   8d4d9:      	callq	0x10be00 <memcpy>
   8d4de:      	movl	$0x200, %edx            # imm = 0x200
   8d4e3:      	leaq	-0x1270(%rbp), %rdi
   8d4ea:      	movq	%r13, %rsi
   8d4ed:      	callq	0x10be00 <memcpy>
   8d4f2:      	movl	$0x1, %r15d
   8d4f8:      	movl	$0x1, %edx
   8d4fd:      	movq	%r14, %rdi
   8d500:      	movq	%r12, %rsi
   8d503:      	movq	-0x30(%rbp), %rcx
   8d507:      	callq	0x8f5e0 <toyos_crypto::mlkem::sample>
   8d50c:      	movl	$0x200, %edx            # imm = 0x200
   8d511:      	leaq	-0x470(%rbp), %r15
   8d518:      	movq	%r15, %rdi
   8d51b:      	movq	%r14, %rsi
   8d51e:      	callq	0x10be00 <memcpy>
   8d523:      	movl	$0x200, %edx            # imm = 0x200
   8d528:      	movq	%rbx, %rdi
   8d52b:      	movq	%r15, %rsi
   8d52e:      	callq	0x10be00 <memcpy>
   8d533:      	movl	$0x200, %edx            # imm = 0x200
   8d538:      	movq	%r13, %rdi
   8d53b:      	movq	%rbx, %rsi
   8d53e:      	callq	0x10be00 <memcpy>
   8d543:      	movl	$0x200, %edx            # imm = 0x200
   8d548:      	leaq	-0x1070(%rbp), %rdi
   8d54f:      	movq	%r13, %rsi
   8d552:      	callq	0x10be00 <memcpy>
   8d557:      	movl	$0x2, %r15d
   8d55d:      	movl	$0x2, %edx
   8d562:      	movq	%r14, %rdi
   8d565:      	movq	%r12, %rsi
   8d568:      	movq	-0x30(%rbp), %rcx
   8d56c:      	callq	0x8f5e0 <toyos_crypto::mlkem::sample>
   8d571:      	movq	-0x30(%rbp), %r14
   8d575:      	movl	$0x200, %edx            # imm = 0x200
   8d57a:      	leaq	-0x470(%rbp), %r15
   8d581:      	movq	%r15, %rdi
   8d584:      	leaq	-0x270(%rbp), %r12
   8d58b:      	movq	%r12, %rsi
   8d58e:      	callq	0x10be00 <memcpy>
   8d593:      	movl	$0x200, %edx            # imm = 0x200
   8d598:      	movq	%rbx, %rdi
   8d59b:      	movq	%r15, %rsi
   8d59e:      	callq	0x10be00 <memcpy>
   8d5a3:      	movl	$0x200, %edx            # imm = 0x200
   8d5a8:      	movq	%r13, %rdi
   8d5ab:      	movq	%rbx, %rsi
   8d5ae:      	callq	0x10be00 <memcpy>
   8d5b3:      	movl	$0x200, %edx            # imm = 0x200
   8d5b8:      	leaq	-0xe70(%rbp), %rdi
   8d5bf:      	movq	%r13, %rsi
   8d5c2:      	callq	0x10be00 <memcpy>
   8d5c7:      	movl	$0x600, %edx            # imm = 0x600
   8d5cc:      	movq	%r13, %rdi
   8d5cf:      	leaq	-0x1270(%rbp), %r15
   8d5d6:      	movq	%r15, %rsi
   8d5d9:      	callq	0x10be00 <memcpy>
   8d5de:      	movq	%r15, %rdi
   8d5e1:      	movq	%r13, %rsi
   8d5e4:      	leaq	-0x1870(%rbp), %rdx
   8d5eb:      	callq	0x8eeb0 <toyos_crypto::mlkem::dot>
   8d5f0:      	movq	%r12, %rdi
   8d5f3:      	movq	%r15, %rsi
   8d5f6:      	callq	0x8ebb0 <<toyos_crypto::mlkem::Poly>::inverse>
   8d5fb:      	leal	0x3(%r14), %eax
   8d5ff:      	movzbl	%al, %edx
   8d602:      	movq	%r15, %rdi
   8d605:      	movq	-0x38(%rbp), %rsi
   8d609:      	callq	0x8f1c0 <toyos_crypto::mlkem::noise>
   8d60e:      	leaq	-0x470(%rbp), %rdi
   8d615:      	movq	%r12, %rsi
   8d618:      	movq	%r15, %rdx
   8d61b:      	callq	0x8eaa0 <<toyos_crypto::mlkem::Poly>::plus>
   8d620:      	leaq	0x1(%r14), %r15
   8d624:      	xorl	%eax, %eax
   8d626:      	leaq	-0x470(%rbp), %rsi
   8d62d:      	nopl	(%rax)
   8d630:      	movswl	-0x470(%rbp,%rax), %ecx
   8d638:      	imull	$0x4ebf, %ecx, %edx     # imm = 0x4EBF
   8d63e:      	addl	$0x2000000, %edx        # imm = 0x2000000
   8d644:      	sarl	$0x1a, %edx
   8d647:      	imull	$0xfffff2ff, %edx, %edx # imm = 0xFFFFF2FF
   8d64d:      	addl	%ecx, %edx
   8d64f:      	movswl	%dx, %ecx
   8d652:      	movl	%ecx, %edx
   8d654:      	shrl	$0xf, %edx
   8d657:      	andl	$0xd01, %edx            # imm = 0xD01
   8d65d:      	addw	%dx, %cx
   8d660:      	jo	0x8df91 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd51>
   8d666:      	movswl	%cx, %ecx
   8d669:      	shll	$0xa, %ecx
   8d66c:      	cmpl	$0xfffff97f, %ecx       # imm = 0xFFFFF97F
   8d672:      	ja	0x8df9f <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd5f>
   8d678:      	addl	$0x680, %ecx            # imm = 0x680
   8d67e:      	imulq	$0x275f6f, %rcx, %rcx   # imm = 0x275F6F
   8d685:      	shrq	$0x21, %rcx
   8d689:      	andl	$0x3ff, %ecx            # imm = 0x3FF
   8d68f:      	movw	%cx, -0x470(%rbp,%rax)
   8d697:      	addq	$0x2, %rax
   8d69b:      	cmpq	$0x200, %rax            # imm = 0x200
   8d6a1:      	jne	0x8d630 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3f0>
   8d6a3:      	movl	$0x200, %edx            # imm = 0x200
   8d6a8:      	movq	%r12, %rdi
   8d6ab:      	callq	0x10be00 <memcpy>
   8d6b0:      	leaq	(%r14,%r14,4), %rax
   8d6b4:      	shlq	$0x6, %rax
   8d6b8:      	leaq	(%rax,%rbp), %rsi
   8d6bc:      	addq	$-0x1cb0, %rsi          # imm = 0xE350
   8d6c3:      	movl	$0x140, %edx            # imm = 0x140
   8d6c8:      	movq	%r12, %r14
   8d6cb:      	movq	%r12, %rdi
   8d6ce:      	callq	0x90420 <<toyos_crypto::mlkem::Poly>::encode::<10>>
   8d6d3:      	xorl	%eax, %eax
   8d6d5:      	movq	-0x70(%rbp), %r12
   8d6d9:      	leaq	-0xa70(%rbp), %r13
   8d6e0:      	movw	$0x0, -0x270(%rbp,%rax)
   8d6ea:      	movw	$0x0, -0x26e(%rbp,%rax)
   8d6f4:      	movw	$0x0, -0x26c(%rbp,%rax)
   8d6fe:      	movw	$0x0, -0x26a(%rbp,%rax)
   8d708:      	movw	$0x0, -0x268(%rbp,%rax)
   8d712:      	movw	$0x0, -0x266(%rbp,%rax)
   8d71c:      	movw	$0x0, -0x264(%rbp,%rax)
   8d726:      	movw	$0x0, -0x262(%rbp,%rax)
   8d730:      	addq	$0x10, %rax
   8d734:      	cmpq	$0x200, %rax            # imm = 0x200
   8d73a:      	jne	0x8d6e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4a0>
   8d73c:      	xorl	%eax, %eax
   8d73e:      	nop
   8d740:      	movw	$0x0, -0x1270(%rbp,%rax)
   8d74a:      	movw	$0x0, -0x126e(%rbp,%rax)
   8d754:      	movw	$0x0, -0x126c(%rbp,%rax)
   8d75e:      	movw	$0x0, -0x126a(%rbp,%rax)
   8d768:      	movw	$0x0, -0x1268(%rbp,%rax)
   8d772:      	movw	$0x0, -0x1266(%rbp,%rax)
   8d77c:      	movw	$0x0, -0x1264(%rbp,%rax)
   8d786:      	movw	$0x0, -0x1262(%rbp,%rax)
   8d790:      	addq	$0x10, %rax
   8d794:      	cmpq	$0x200, %rax            # imm = 0x200
   8d79a:      	jne	0x8d740 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x500>
   8d79c:      	xorl	%eax, %eax
   8d79e:      	nop
   8d7a0:      	movw	$0x0, -0xa70(%rbp,%rax)
   8d7aa:      	movw	$0x0, -0xa6e(%rbp,%rax)
   8d7b4:      	movw	$0x0, -0xa6c(%rbp,%rax)
   8d7be:      	movw	$0x0, -0xa6a(%rbp,%rax)
   8d7c8:      	movw	$0x0, -0xa68(%rbp,%rax)
   8d7d2:      	movw	$0x0, -0xa66(%rbp,%rax)
   8d7dc:      	movw	$0x0, -0xa64(%rbp,%rax)
   8d7e6:      	movw	$0x0, -0xa62(%rbp,%rax)
   8d7f0:      	addq	$0x10, %rax
   8d7f4:      	cmpq	$0x200, %rax            # imm = 0x200
   8d7fa:      	jne	0x8d7a0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x560>
   8d7fc:      	xorl	%eax, %eax
   8d7fe:      	nop
   8d800:      	movw	$0x0, -0x870(%rbp,%rax)
   8d80a:      	movw	$0x0, -0x86e(%rbp,%rax)
   8d814:      	movw	$0x0, -0x86c(%rbp,%rax)
   8d81e:      	movw	$0x0, -0x86a(%rbp,%rax)
   8d828:      	movw	$0x0, -0x868(%rbp,%rax)
   8d832:      	movw	$0x0, -0x866(%rbp,%rax)
   8d83c:      	movw	$0x0, -0x864(%rbp,%rax)
   8d846:      	movw	$0x0, -0x862(%rbp,%rax)
   8d850:      	addq	$0x10, %rax
   8d854:      	cmpq	$0x200, %rax            # imm = 0x200
   8d85a:      	jne	0x8d800 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5c0>
   8d85c:      	xorl	%eax, %eax
   8d85e:      	nop
   8d860:      	movw	$0x0, -0x670(%rbp,%rax)
   8d86a:      	movw	$0x0, -0x66e(%rbp,%rax)
   8d874:      	movw	$0x0, -0x66c(%rbp,%rax)
   8d87e:      	movw	$0x0, -0x66a(%rbp,%rax)
   8d888:      	movw	$0x0, -0x668(%rbp,%rax)
   8d892:      	movw	$0x0, -0x666(%rbp,%rax)
   8d89c:      	movw	$0x0, -0x664(%rbp,%rax)
   8d8a6:      	movw	$0x0, -0x662(%rbp,%rax)
   8d8b0:      	addq	$0x10, %rax
   8d8b4:      	cmpq	$0x200, %rax            # imm = 0x200
   8d8ba:      	jne	0x8d860 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x620>
   8d8bc:      	movq	%r15, -0x30(%rbp)
   8d8c0:      	cmpq	$0x3, %r15
   8d8c4:      	leaq	-0x1270(%rbp), %r15
   8d8cb:      	jne	0x8d480 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x240>
   8d8d1:      	movq	%r15, -0x50(%rbp)
   8d8d5:      	movq	$0x3, -0x48(%rbp)
   8d8dd:      	xorl	%r14d, %r14d
   8d8e0:      	leaq	-0x270(%rbp), %rdi
   8d8e7:      	movl	$0x180, %edx            # imm = 0x180
   8d8ec:      	movq	-0x68(%rbp), %r12
   8d8f0:      	movq	%r12, %rsi
   8d8f3:      	callq	0x900b0 <<toyos_crypto::mlkem::Poly>::decode::<12>>
   8d8f8:      	leaq	-0x470(%rbp), %r14
   8d8ff:      	leaq	-0x270(%rbp), %rbx
   8d906:      	movl	$0x200, %edx            # imm = 0x200
   8d90b:      	movq	%r14, %rdi
   8d90e:      	movq	%rbx, %rsi
   8d911:      	callq	0x10be00 <memcpy>
   8d916:      	leaq	-0xc70(%rbp), %r15
   8d91d:      	movl	$0x200, %edx            # imm = 0x200
   8d922:      	movq	%r15, %rdi
   8d925:      	movq	%r14, %rsi
   8d928:      	callq	0x10be00 <memcpy>
   8d92d:      	leaq	-0xa70(%rbp), %r14
   8d934:      	movl	$0x200, %edx            # imm = 0x200
   8d939:      	movq	%r14, %rdi
   8d93c:      	movq	%r15, %rsi
   8d93f:      	callq	0x10be00 <memcpy>
   8d944:      	leaq	-0x1270(%rbp), %rdi
   8d94b:      	movl	$0x200, %edx            # imm = 0x200
   8d950:      	movq	%r14, %rsi
   8d953:      	callq	0x10be00 <memcpy>
   8d958:      	leaq	0x180(%r12), %rsi
   8d960:      	movl	$0x1, %r14d
   8d966:      	movl	$0x180, %edx            # imm = 0x180
   8d96b:      	movq	%rbx, %rdi
   8d96e:      	callq	0x900b0 <<toyos_crypto::mlkem::Poly>::decode::<12>>
   8d973:      	leaq	-0x470(%rbp), %r14
   8d97a:      	movl	$0x200, %edx            # imm = 0x200
   8d97f:      	movq	%r14, %rdi
   8d982:      	movq	%rbx, %rsi
   8d985:      	callq	0x10be00 <memcpy>
   8d98a:      	movl	$0x200, %edx            # imm = 0x200
   8d98f:      	movq	%r15, %rdi
   8d992:      	movq	%r14, %rsi
   8d995:      	callq	0x10be00 <memcpy>
   8d99a:      	leaq	-0xa70(%rbp), %r14
   8d9a1:      	movl	$0x200, %edx            # imm = 0x200
   8d9a6:      	movq	%r14, %rdi
   8d9a9:      	movq	%r15, %rsi
   8d9ac:      	callq	0x10be00 <memcpy>
   8d9b1:      	leaq	-0x1070(%rbp), %rdi
   8d9b8:      	movl	$0x200, %edx            # imm = 0x200
   8d9bd:      	movq	%r14, %rsi
   8d9c0:      	callq	0x10be00 <memcpy>
   8d9c5:      	addq	$0x300, %r12            # imm = 0x300
   8d9cc:      	movl	$0x2, %r14d
   8d9d2:      	movl	$0x180, %edx            # imm = 0x180
   8d9d7:      	movq	%rbx, %rdi
   8d9da:      	movq	%r12, %rsi
   8d9dd:      	callq	0x900b0 <<toyos_crypto::mlkem::Poly>::decode::<12>>
   8d9e2:      	leaq	-0x470(%rbp), %rbx
   8d9e9:      	leaq	-0x270(%rbp), %rsi
   8d9f0:      	movl	$0x200, %edx            # imm = 0x200
   8d9f5:      	movq	%rbx, %rdi
   8d9f8:      	callq	0x10be00 <memcpy>
   8d9fd:      	leaq	-0xc70(%rbp), %r14
   8da04:      	movl	$0x200, %edx            # imm = 0x200
   8da09:      	movq	%r14, %rdi
   8da0c:      	movq	%rbx, %rsi
   8da0f:      	callq	0x10be00 <memcpy>
   8da14:      	leaq	-0xa70(%rbp), %rbx
   8da1b:      	movl	$0x200, %edx            # imm = 0x200
   8da20:      	movq	%rbx, %rdi
   8da23:      	movq	%r14, %rsi
   8da26:      	callq	0x10be00 <memcpy>
   8da2b:      	leaq	-0xe70(%rbp), %rdi
   8da32:      	movl	$0x200, %edx            # imm = 0x200
   8da37:      	movq	%rbx, %rsi
   8da3a:      	callq	0x10be00 <memcpy>
   8da3f:      	leaq	-0x1270(%rbp), %rsi
   8da46:      	movl	$0x600, %edx            # imm = 0x600
   8da4b:      	movq	%rbx, %rdi
   8da4e:      	callq	0x10be00 <memcpy>
   8da53:      	leaq	-0x1270(%rbp), %rdi
   8da5a:      	leaq	-0x1870(%rbp), %rdx
   8da61:      	movq	%rbx, %rsi
   8da64:      	callq	0x8eeb0 <toyos_crypto::mlkem::dot>
   8da69:      	leaq	-0x270(%rbp), %rdi
   8da70:      	leaq	-0x1270(%rbp), %rsi
   8da77:      	callq	0x8ebb0 <<toyos_crypto::mlkem::Poly>::inverse>
   8da7c:      	leaq	-0x470(%rbp), %rdi
   8da83:      	movq	-0x38(%rbp), %rsi
   8da87:      	movl	$0x6, %edx
   8da8c:      	callq	0x8f1c0 <toyos_crypto::mlkem::noise>
   8da91:      	leaq	-0xc70(%rbp), %rdi
   8da98:      	leaq	-0x270(%rbp), %rsi
   8da9f:      	leaq	-0x470(%rbp), %rdx
   8daa6:      	callq	0x8eaa0 <<toyos_crypto::mlkem::Poly>::plus>
   8daab:      	leaq	-0x1270(%rbp), %rdi
   8dab2:      	movl	$0x20, %edx
   8dab7:      	movq	-0x60(%rbp), %rsi
   8dabb:      	callq	0x8fed0 <<toyos_crypto::mlkem::Poly>::decode::<1>>
   8dac0:      	movl	$0x2, %ecx
   8dac5:      	movl	$0xd01, %esi            # imm = 0xD01
   8daca:      	nopw	(%rax,%rax)
   8dad0:      	movswl	-0x1272(%rbp,%rcx), %eax
   8dad8:      	mull	%esi
   8dada:      	jo	0x8dfad <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd6d>
   8dae0:      	incl	%eax
   8dae2:      	shrl	%eax
   8dae4:      	movw	%ax, -0x1272(%rbp,%rcx)
   8daec:      	movswl	-0x1270(%rbp,%rcx), %eax
   8daf4:      	mull	%esi
   8daf6:      	jo	0x8dfad <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd6d>
   8dafc:      	incl	%eax
   8dafe:      	shrl	%eax
   8db00:      	movw	%ax, -0x1270(%rbp,%rcx)
   8db08:      	addq	$0x4, %rcx
   8db0c:      	cmpq	$0x202, %rcx            # imm = 0x202
   8db13:      	jne	0x8dad0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x890>
   8db15:      	leaq	-0x270(%rbp), %rbx
   8db1c:      	leaq	-0x1270(%rbp), %rsi
   8db23:      	movl	$0x200, %edx            # imm = 0x200
   8db28:      	movq	%rbx, %rdi
   8db2b:      	callq	0x10be00 <memcpy>
   8db30:      	leaq	-0x1270(%rbp), %rdi
   8db37:      	leaq	-0xc70(%rbp), %rsi
   8db3e:      	movq	%rbx, %rdx
   8db41:      	callq	0x8eaa0 <<toyos_crypto::mlkem::Poly>::plus>
   8db46:      	xorl	%eax, %eax
   8db48:      	nopl	(%rax,%rax)
   8db50:      	movswl	-0x1270(%rbp,%rax), %ecx
   8db58:      	imull	$0x4ebf, %ecx, %edx     # imm = 0x4EBF
   8db5e:      	addl	$0x2000000, %edx        # imm = 0x2000000
   8db64:      	sarl	$0x1a, %edx
   8db67:      	imull	$0xfffff2ff, %edx, %edx # imm = 0xFFFFF2FF
   8db6d:      	addl	%ecx, %edx
   8db6f:      	movswl	%dx, %ecx
   8db72:      	movl	%ecx, %edx
   8db74:      	shrl	$0xf, %edx
   8db77:      	andl	$0xd01, %edx            # imm = 0xD01
   8db7d:      	addw	%dx, %cx
   8db80:      	jo	0x8dfbb <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd7b>
   8db86:      	movswl	%cx, %ecx
   8db89:      	shll	$0x4, %ecx
   8db8c:      	cmpl	$0xfffff97f, %ecx       # imm = 0xFFFFF97F
   8db92:      	ja	0x8dfc9 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd89>
   8db98:      	addl	$0x680, %ecx            # imm = 0x680
   8db9e:      	imulq	$0x275f6f, %rcx, %rcx   # imm = 0x275F6F
   8dba5:      	shrq	$0x21, %rcx
   8dba9:      	andl	$0xf, %ecx
   8dbac:      	movw	%cx, -0x1270(%rbp,%rax)
   8dbb4:      	addq	$0x2, %rax
   8dbb8:      	cmpq	$0x200, %rax            # imm = 0x200
   8dbbe:      	jne	0x8db50 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x910>
   8dbc0:      	leaq	-0xc70(%rbp), %rbx
   8dbc7:      	leaq	-0x1270(%rbp), %rsi
   8dbce:      	movl	$0x200, %edx            # imm = 0x200
   8dbd3:      	movq	%rbx, %rdi
   8dbd6:      	callq	0x10be00 <memcpy>
   8dbdb:      	leaq	-0x18f0(%rbp), %rsi
   8dbe2:      	movl	$0x80, %edx
   8dbe7:      	movq	%rbx, %rdi
   8dbea:      	callq	0x902b0 <<toyos_crypto::mlkem::Poly>::encode::<4>>
   8dbef:      	xorl	%eax, %eax
   8dbf1:      	movq	-0x58(%rbp), %rbx
   8dbf5:      	nopw	%cs:(%rax,%rax)
   8dc00:      	movw	$0x0, -0xc70(%rbp,%rax)
   8dc0a:      	movw	$0x0, -0xc6e(%rbp,%rax)
   8dc14:      	movw	$0x0, -0xc6c(%rbp,%rax)
   8dc1e:      	movw	$0x0, -0xc6a(%rbp,%rax)
   8dc28:      	movw	$0x0, -0xc68(%rbp,%rax)
   8dc32:      	movw	$0x0, -0xc66(%rbp,%rax)
   8dc3c:      	movw	$0x0, -0xc64(%rbp,%rax)
   8dc46:      	movw	$0x0, -0xc62(%rbp,%rax)
   8dc50:      	addq	$0x10, %rax
   8dc54:      	cmpq	$0x200, %rax            # imm = 0x200
   8dc5a:      	jne	0x8dc00 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9c0>
   8dc5c:      	xorl	%eax, %eax
   8dc5e:      	nop
   8dc60:      	movw	$0x0, -0x270(%rbp,%rax)
   8dc6a:      	movw	$0x0, -0x26e(%rbp,%rax)
   8dc74:      	movw	$0x0, -0x26c(%rbp,%rax)
   8dc7e:      	movw	$0x0, -0x26a(%rbp,%rax)
   8dc88:      	movw	$0x0, -0x268(%rbp,%rax)
   8dc92:      	movw	$0x0, -0x266(%rbp,%rax)
   8dc9c:      	movw	$0x0, -0x264(%rbp,%rax)
   8dca6:      	movw	$0x0, -0x262(%rbp,%rax)
   8dcb0:      	addq	$0x10, %rax
   8dcb4:      	cmpq	$0x200, %rax            # imm = 0x200
   8dcba:      	jne	0x8dc60 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa20>
   8dcbc:      	xorl	%eax, %eax
   8dcbe:      	nop
   8dcc0:      	movw	$0x0, -0x470(%rbp,%rax)
   8dcca:      	movw	$0x0, -0x46e(%rbp,%rax)
   8dcd4:      	movw	$0x0, -0x46c(%rbp,%rax)
   8dcde:      	movw	$0x0, -0x46a(%rbp,%rax)
   8dce8:      	movw	$0x0, -0x468(%rbp,%rax)
   8dcf2:      	movw	$0x0, -0x466(%rbp,%rax)
   8dcfc:      	movw	$0x0, -0x464(%rbp,%rax)
   8dd06:      	movw	$0x0, -0x462(%rbp,%rax)
   8dd10:      	addq	$0x10, %rax
   8dd14:      	cmpq	$0x200, %rax            # imm = 0x200
   8dd1a:      	jne	0x8dcc0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa80>
   8dd1c:      	leaq	-0x1cb0(%rbp), %rsi
   8dd23:      	movl	$0x440, %edx            # imm = 0x440
   8dd28:      	movq	%rbx, %rdi
   8dd2b:      	callq	0x10be00 <memcpy>
   8dd30:      	xorl	%eax, %eax
   8dd32:      	nopw	%cs:(%rax,%rax)
   8dd40:      	movw	$0x0, -0xa70(%rbp,%rax)
   8dd4a:      	movw	$0x0, -0xa6e(%rbp,%rax)
   8dd54:      	movw	$0x0, -0xa6c(%rbp,%rax)
   8dd5e:      	movw	$0x0, -0xa6a(%rbp,%rax)
   8dd68:      	movw	$0x0, -0xa68(%rbp,%rax)
   8dd72:      	movw	$0x0, -0xa66(%rbp,%rax)
   8dd7c:      	movw	$0x0, -0xa64(%rbp,%rax)
   8dd86:      	movw	$0x0, -0xa62(%rbp,%rax)
   8dd90:      	addq	$0x10, %rax
   8dd94:      	cmpq	$0x200, %rax            # imm = 0x200
   8dd9a:      	jne	0x8dd40 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb00>
   8dd9c:      	xorl	%eax, %eax
   8dd9e:      	nop
   8dda0:      	movw	$0x0, -0x870(%rbp,%rax)
   8ddaa:      	movw	$0x0, -0x86e(%rbp,%rax)
   8ddb4:      	movw	$0x0, -0x86c(%rbp,%rax)
   8ddbe:      	movw	$0x0, -0x86a(%rbp,%rax)
   8ddc8:      	movw	$0x0, -0x868(%rbp,%rax)
   8ddd2:      	movw	$0x0, -0x866(%rbp,%rax)
   8dddc:      	movw	$0x0, -0x864(%rbp,%rax)
   8dde6:      	movw	$0x0, -0x862(%rbp,%rax)
   8ddf0:      	addq	$0x10, %rax
   8ddf4:      	cmpq	$0x200, %rax            # imm = 0x200
   8ddfa:      	jne	0x8dda0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb60>
   8ddfc:      	xorl	%eax, %eax
   8ddfe:      	nop
   8de00:      	movw	$0x0, -0x670(%rbp,%rax)
   8de0a:      	movw	$0x0, -0x66e(%rbp,%rax)
   8de14:      	movw	$0x0, -0x66c(%rbp,%rax)
   8de1e:      	movw	$0x0, -0x66a(%rbp,%rax)
   8de28:      	movw	$0x0, -0x668(%rbp,%rax)
   8de32:      	movw	$0x0, -0x666(%rbp,%rax)
   8de3c:      	movw	$0x0, -0x664(%rbp,%rax)
   8de46:      	movw	$0x0, -0x662(%rbp,%rax)
   8de50:      	addq	$0x10, %rax
   8de54:      	cmpq	$0x200, %rax            # imm = 0x200
   8de5a:      	jne	0x8de00 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbc0>
   8de5c:      	xorl	%eax, %eax
   8de5e:      	nop
   8de60:      	movw	$0x0, -0x1870(%rbp,%rax)
   8de6a:      	movw	$0x0, -0x186e(%rbp,%rax)
   8de74:      	movw	$0x0, -0x186c(%rbp,%rax)
   8de7e:      	movw	$0x0, -0x186a(%rbp,%rax)
   8de88:      	movw	$0x0, -0x1868(%rbp,%rax)
   8de92:      	movw	$0x0, -0x1866(%rbp,%rax)
   8de9c:      	movw	$0x0, -0x1864(%rbp,%rax)
   8dea6:      	movw	$0x0, -0x1862(%rbp,%rax)
   8deb0:      	addq	$0x10, %rax
   8deb4:      	cmpq	$0x200, %rax            # imm = 0x200
   8deba:      	jne	0x8de60 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc20>
   8debc:      	xorl	%eax, %eax
   8debe:      	nop
   8dec0:      	movw	$0x0, -0x1670(%rbp,%rax)
   8deca:      	movw	$0x0, -0x166e(%rbp,%rax)
   8ded4:      	movw	$0x0, -0x166c(%rbp,%rax)
   8dede:      	movw	$0x0, -0x166a(%rbp,%rax)
   8dee8:      	movw	$0x0, -0x1668(%rbp,%rax)
   8def2:      	movw	$0x0, -0x1666(%rbp,%rax)
   8defc:      	movw	$0x0, -0x1664(%rbp,%rax)
   8df06:      	movw	$0x0, -0x1662(%rbp,%rax)
   8df10:      	addq	$0x10, %rax
   8df14:      	cmpq	$0x200, %rax            # imm = 0x200
   8df1a:      	jne	0x8dec0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc80>
   8df1c:      	xorl	%eax, %eax
   8df1e:      	nop
   8df20:      	movw	$0x0, -0x1470(%rbp,%rax)
   8df2a:      	movw	$0x0, -0x146e(%rbp,%rax)
   8df34:      	movw	$0x0, -0x146c(%rbp,%rax)
   8df3e:      	movw	$0x0, -0x146a(%rbp,%rax)
   8df48:      	movw	$0x0, -0x1468(%rbp,%rax)
   8df52:      	movw	$0x0, -0x1466(%rbp,%rax)
   8df5c:      	movw	$0x0, -0x1464(%rbp,%rax)
   8df66:      	movw	$0x0, -0x1462(%rbp,%rax)
   8df70:      	addq	$0x10, %rax
   8df74:      	cmpq	$0x200, %rax            # imm = 0x200
   8df7a:      	jne	0x8df20 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xce0>
   8df7c:      	movq	%rbx, %rax
   8df7f:      	addq	$0x1c88, %rsp           # imm = 0x1C88
   8df86:      	popq	%rbx
   8df87:      	popq	%r12
   8df89:      	popq	%r13
   8df8b:      	popq	%r14
   8df8d:      	popq	%r15
   8df8f:      	popq	%rbp
   8df90:      	retq
   8df91:      	leaq	0x81c50(%rip), %rdi     # 0x10fbe8 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x2b0>
   8df98:      	callq	0x107fd0 <core::panicking::panic_const::panic_const_add_overflow>
   8df9d:      	jmp	0x8dfd5 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd95>
   8df9f:      	leaq	0x81bca(%rip), %rdi     # 0x10fb70 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x238>
   8dfa6:      	callq	0x107fd0 <core::panicking::panic_const::panic_const_add_overflow>
   8dfab:      	jmp	0x8dfd5 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd95>
   8dfad:      	leaq	0x81b14(%rip), %rdi     # 0x10fac8 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x190>
   8dfb4:      	callq	0x107ff0 <core::panicking::panic_const::panic_const_mul_overflow>
   8dfb9:      	jmp	0x8dfd5 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd95>
   8dfbb:      	leaq	0x81c26(%rip), %rdi     # 0x10fbe8 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x2b0>
   8dfc2:      	callq	0x107fd0 <core::panicking::panic_const::panic_const_add_overflow>
   8dfc7:      	jmp	0x8dfd5 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd95>
   8dfc9:      	leaq	0x81ba0(%rip), %rdi     # 0x10fb70 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x238>
   8dfd0:      	callq	0x107fd0 <core::panicking::panic_const::panic_const_add_overflow>
   8dfd5:      	ud2
   8dfd7:      	xorl	%ecx, %ecx
   8dfd9:      	nopl	(%rax)
   8dfe0:      	movw	$0x0, -0xc70(%rbp,%rcx)
   8dfea:      	movw	$0x0, -0xc6e(%rbp,%rcx)
   8dff4:      	movw	$0x0, -0xc6c(%rbp,%rcx)
   8dffe:      	movw	$0x0, -0xc6a(%rbp,%rcx)
   8e008:      	movw	$0x0, -0xc68(%rbp,%rcx)
   8e012:      	movw	$0x0, -0xc66(%rbp,%rcx)
   8e01c:      	movw	$0x0, -0xc64(%rbp,%rcx)
   8e026:      	movw	$0x0, -0xc62(%rbp,%rcx)
   8e030:      	addq	$0x10, %rcx
   8e034:      	cmpq	$0x200, %rcx            # imm = 0x200
   8e03b:      	jne	0x8dfe0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xda0>
   8e03d:      	jmp	0x8e23d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xffd>
   8e042:      	jmp	0x8e23d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xffd>
   8e047:      	jmp	0x8e30d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x10cd>
   8e04c:      	jmp	0x8e36d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x112d>
   8e051:      	xorl	%ecx, %ecx
   8e053:      	nopw	%cs:(%rax,%rax)
   8e060:      	movw	$0x0, -0x270(%rbp,%rcx)
   8e06a:      	movw	$0x0, -0x26e(%rbp,%rcx)
   8e074:      	movw	$0x0, -0x26c(%rbp,%rcx)
   8e07e:      	movw	$0x0, -0x26a(%rbp,%rcx)
   8e088:      	movw	$0x0, -0x268(%rbp,%rcx)
   8e092:      	movw	$0x0, -0x266(%rbp,%rcx)
   8e09c:      	movw	$0x0, -0x264(%rbp,%rcx)
   8e0a6:      	movw	$0x0, -0x262(%rbp,%rcx)
   8e0b0:      	addq	$0x10, %rcx
   8e0b4:      	cmpq	$0x200, %rcx            # imm = 0x200
   8e0bb:      	jne	0x8e060 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xe20>
   8e0bd:      	jmp	0x8e0bf <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xe7f>
   8e0bf:      	movq	%rax, %rdi
   8e0c2:      	jmp	0x8e3dc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x119c>
   8e0c7:      	movq	%rax, %rbx
   8e0ca:      	movq	%r14, -0x40(%rbp)
   8e0ce:      	jmp	0x8e510 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12d0>
   8e0d3:      	movq	%rax, %rbx
   8e0d6:      	movq	%r14, -0xc60(%rbp)
   8e0dd:      	leaq	-0xc70(%rbp), %rdi
   8e0e4:      	callq	0x8ce70 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>
   8e0e9:      	movq	%rbx, %rdi
   8e0ec:      	callq	0x102010 <_Unwind_Resume>
   8e0f1:      	xorl	%ecx, %ecx
   8e0f3:      	nopw	%cs:(%rax,%rax)
   8e100:      	movw	$0x0, -0x270(%rbp,%rcx)
   8e10a:      	movw	$0x0, -0x26e(%rbp,%rcx)
   8e114:      	movw	$0x0, -0x26c(%rbp,%rcx)
   8e11e:      	movw	$0x0, -0x26a(%rbp,%rcx)
   8e128:      	movw	$0x0, -0x268(%rbp,%rcx)
   8e132:      	movw	$0x0, -0x266(%rbp,%rcx)
   8e13c:      	movw	$0x0, -0x264(%rbp,%rcx)
   8e146:      	movw	$0x0, -0x262(%rbp,%rcx)
   8e150:      	addq	$0x10, %rcx
   8e154:      	cmpq	$0x200, %rcx            # imm = 0x200
   8e15b:      	jne	0x8e100 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xec0>
   8e15d:      	jmp	0x8e1d2 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xf92>
   8e15f:      	xorl	%ecx, %ecx
   8e161:      	nopw	%cs:(%rax,%rax)
   8e170:      	movw	$0x0, -0x270(%rbp,%rcx)
   8e17a:      	movw	$0x0, -0x26e(%rbp,%rcx)
   8e184:      	movw	$0x0, -0x26c(%rbp,%rcx)
   8e18e:      	movw	$0x0, -0x26a(%rbp,%rcx)
   8e198:      	movw	$0x0, -0x268(%rbp,%rcx)
   8e1a2:      	movw	$0x0, -0x266(%rbp,%rcx)
   8e1ac:      	movw	$0x0, -0x264(%rbp,%rcx)
   8e1b6:      	movw	$0x0, -0x262(%rbp,%rcx)
   8e1c0:      	addq	$0x10, %rcx
   8e1c4:      	cmpq	$0x200, %rcx            # imm = 0x200
   8e1cb:      	jne	0x8e170 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xf30>
   8e1cd:      	jmp	0x8e501 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12c1>
   8e1d2:      	movq	%rax, %rdi
   8e1d5:      	jmp	0x8e58c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x134c>
   8e1da:      	xorl	%ecx, %ecx
   8e1dc:      	nopl	(%rax)
   8e1e0:      	movw	$0x0, -0x1270(%rbp,%rcx)
   8e1ea:      	movw	$0x0, -0x126e(%rbp,%rcx)
   8e1f4:      	movw	$0x0, -0x126c(%rbp,%rcx)
   8e1fe:      	movw	$0x0, -0x126a(%rbp,%rcx)
   8e208:      	movw	$0x0, -0x1268(%rbp,%rcx)
   8e212:      	movw	$0x0, -0x1266(%rbp,%rcx)
   8e21c:      	movw	$0x0, -0x1264(%rbp,%rcx)
   8e226:      	movw	$0x0, -0x1262(%rbp,%rcx)
   8e230:      	addq	$0x10, %rcx
   8e234:      	cmpq	$0x200, %rcx            # imm = 0x200
   8e23b:      	jne	0x8e1e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xfa0>
   8e23d:      	xorl	%ecx, %ecx
   8e23f:      	nop
   8e240:      	movw	$0x0, -0x270(%rbp,%rcx)
   8e24a:      	movw	$0x0, -0x26e(%rbp,%rcx)
   8e254:      	movw	$0x0, -0x26c(%rbp,%rcx)
   8e25e:      	movw	$0x0, -0x26a(%rbp,%rcx)
   8e268:      	movw	$0x0, -0x268(%rbp,%rcx)
   8e272:      	movw	$0x0, -0x266(%rbp,%rcx)
   8e27c:      	movw	$0x0, -0x264(%rbp,%rcx)
   8e286:      	movw	$0x0, -0x262(%rbp,%rcx)
   8e290:      	addq	$0x10, %rcx
   8e294:      	cmpq	$0x200, %rcx            # imm = 0x200
   8e29b:      	jne	0x8e240 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1000>
   8e29d:      	jmp	0x8e36d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x112d>
   8e2a2:      	xorl	%ecx, %ecx
   8e2a4:      	nopw	%cs:(%rax,%rax)
   8e2b0:      	movw	$0x0, -0x1270(%rbp,%rcx)
   8e2ba:      	movw	$0x0, -0x126e(%rbp,%rcx)
   8e2c4:      	movw	$0x0, -0x126c(%rbp,%rcx)
   8e2ce:      	movw	$0x0, -0x126a(%rbp,%rcx)
   8e2d8:      	movw	$0x0, -0x1268(%rbp,%rcx)
   8e2e2:      	movw	$0x0, -0x1266(%rbp,%rcx)
   8e2ec:      	movw	$0x0, -0x1264(%rbp,%rcx)
   8e2f6:      	movw	$0x0, -0x1262(%rbp,%rcx)
   8e300:      	addq	$0x10, %rcx
   8e304:      	cmpq	$0x200, %rcx            # imm = 0x200
   8e30b:      	jne	0x8e2b0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1070>
   8e30d:      	xorl	%ecx, %ecx
   8e30f:      	nop
   8e310:      	movw	$0x0, -0xc70(%rbp,%rcx)
   8e31a:      	movw	$0x0, -0xc6e(%rbp,%rcx)
   8e324:      	movw	$0x0, -0xc6c(%rbp,%rcx)
   8e32e:      	movw	$0x0, -0xc6a(%rbp,%rcx)
   8e338:      	movw	$0x0, -0xc68(%rbp,%rcx)
   8e342:      	movw	$0x0, -0xc66(%rbp,%rcx)
   8e34c:      	movw	$0x0, -0xc64(%rbp,%rcx)
   8e356:      	movw	$0x0, -0xc62(%rbp,%rcx)
   8e360:      	addq	$0x10, %rcx
   8e364:      	cmpq	$0x200, %rcx            # imm = 0x200
   8e36b:      	jne	0x8e310 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x10d0>
   8e36d:      	movq	%rax, %rdi
   8e370:      	xorl	%eax, %eax
   8e372:      	nopw	%cs:(%rax,%rax)
   8e380:      	movw	$0x0, -0x470(%rbp,%rax)
   8e38a:      	movw	$0x0, -0x46e(%rbp,%rax)
   8e394:      	movw	$0x0, -0x46c(%rbp,%rax)
   8e39e:      	movw	$0x0, -0x46a(%rbp,%rax)
   8e3a8:      	movw	$0x0, -0x468(%rbp,%rax)
   8e3b2:      	movw	$0x0, -0x466(%rbp,%rax)
   8e3bc:      	movw	$0x0, -0x464(%rbp,%rax)
   8e3c6:      	movw	$0x0, -0x462(%rbp,%rax)
   8e3d0:      	addq	$0x10, %rax
   8e3d4:      	cmpq	$0x200, %rax            # imm = 0x200
   8e3da:      	jne	0x8e380 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1140>
   8e3dc:      	xorl	%eax, %eax
   8e3de:      	nop
   8e3e0:      	movw	$0x0, -0xa70(%rbp,%rax)
   8e3ea:      	movw	$0x0, -0xa6e(%rbp,%rax)
   8e3f4:      	movw	$0x0, -0xa6c(%rbp,%rax)
   8e3fe:      	movw	$0x0, -0xa6a(%rbp,%rax)
   8e408:      	movw	$0x0, -0xa68(%rbp,%rax)
   8e412:      	movw	$0x0, -0xa66(%rbp,%rax)
   8e41c:      	movw	$0x0, -0xa64(%rbp,%rax)
   8e426:      	movw	$0x0, -0xa62(%rbp,%rax)
   8e430:      	addq	$0x10, %rax
   8e434:      	cmpq	$0x200, %rax            # imm = 0x200
   8e43a:      	jne	0x8e3e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x11a0>
   8e43c:      	xorl	%eax, %eax
   8e43e:      	nop
   8e440:      	movw	$0x0, -0x870(%rbp,%rax)
   8e44a:      	movw	$0x0, -0x86e(%rbp,%rax)
   8e454:      	movw	$0x0, -0x86c(%rbp,%rax)
   8e45e:      	movw	$0x0, -0x86a(%rbp,%rax)
   8e468:      	movw	$0x0, -0x868(%rbp,%rax)
   8e472:      	movw	$0x0, -0x866(%rbp,%rax)
   8e47c:      	movw	$0x0, -0x864(%rbp,%rax)
   8e486:      	movw	$0x0, -0x862(%rbp,%rax)
   8e490:      	addq	$0x10, %rax
   8e494:      	cmpq	$0x200, %rax            # imm = 0x200
   8e49a:      	jne	0x8e440 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1200>
   8e49c:      	xorl	%eax, %eax
   8e49e:      	nop
   8e4a0:      	movw	$0x0, -0x670(%rbp,%rax)
   8e4aa:      	movw	$0x0, -0x66e(%rbp,%rax)
   8e4b4:      	movw	$0x0, -0x66c(%rbp,%rax)
   8e4be:      	movw	$0x0, -0x66a(%rbp,%rax)
   8e4c8:      	movw	$0x0, -0x668(%rbp,%rax)
   8e4d2:      	movw	$0x0, -0x666(%rbp,%rax)
   8e4dc:      	movw	$0x0, -0x664(%rbp,%rax)
   8e4e6:      	movw	$0x0, -0x662(%rbp,%rax)
   8e4f0:      	addq	$0x10, %rax
   8e4f4:      	cmpq	$0x200, %rax            # imm = 0x200
   8e4fa:      	jne	0x8e4a0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1260>
   8e4fc:      	jmp	0x8e70c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x14cc>
   8e501:      	movq	%rax, %rdi
   8e504:      	jmp	0x8e5ec <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x13ac>
   8e509:      	movq	%rax, %rbx
   8e50c:      	movq	%r15, -0x40(%rbp)
   8e510:      	leaq	-0x50(%rbp), %rdi
   8e514:      	callq	0x8ce70 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>
   8e519:      	movq	%rbx, %rdi
   8e51c:      	jmp	0x8e70c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x14cc>
   8e521:      	movq	%rax, %rdi
   8e524:      	xorl	%eax, %eax
   8e526:      	nopw	%cs:(%rax,%rax)
   8e530:      	movw	$0x0, -0x470(%rbp,%rax)
   8e53a:      	movw	$0x0, -0x46e(%rbp,%rax)
   8e544:      	movw	$0x0, -0x46c(%rbp,%rax)
   8e54e:      	movw	$0x0, -0x46a(%rbp,%rax)
   8e558:      	movw	$0x0, -0x468(%rbp,%rax)
   8e562:      	movw	$0x0, -0x466(%rbp,%rax)
   8e56c:      	movw	$0x0, -0x464(%rbp,%rax)
   8e576:      	movw	$0x0, -0x462(%rbp,%rax)
   8e580:      	addq	$0x10, %rax
   8e584:      	cmpq	$0x200, %rax            # imm = 0x200
   8e58a:      	jne	0x8e530 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12f0>
   8e58c:      	xorl	%eax, %eax
   8e58e:      	nop
   8e590:      	movw	$0x0, -0x1270(%rbp,%rax)
   8e59a:      	movw	$0x0, -0x126e(%rbp,%rax)
   8e5a4:      	movw	$0x0, -0x126c(%rbp,%rax)
   8e5ae:      	movw	$0x0, -0x126a(%rbp,%rax)
   8e5b8:      	movw	$0x0, -0x1268(%rbp,%rax)
   8e5c2:      	movw	$0x0, -0x1266(%rbp,%rax)
   8e5cc:      	movw	$0x0, -0x1264(%rbp,%rax)
   8e5d6:      	movw	$0x0, -0x1262(%rbp,%rax)
   8e5e0:      	addq	$0x10, %rax
   8e5e4:      	cmpq	$0x200, %rax            # imm = 0x200
   8e5ea:      	jne	0x8e590 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1350>
   8e5ec:      	xorl	%eax, %eax
   8e5ee:      	nop
   8e5f0:      	movw	$0x0, -0xa70(%rbp,%rax)
   8e5fa:      	movw	$0x0, -0xa6e(%rbp,%rax)
   8e604:      	movw	$0x0, -0xa6c(%rbp,%rax)
   8e60e:      	movw	$0x0, -0xa6a(%rbp,%rax)
   8e618:      	movw	$0x0, -0xa68(%rbp,%rax)
   8e622:      	movw	$0x0, -0xa66(%rbp,%rax)
   8e62c:      	movw	$0x0, -0xa64(%rbp,%rax)
   8e636:      	movw	$0x0, -0xa62(%rbp,%rax)
   8e640:      	addq	$0x10, %rax
   8e644:      	cmpq	$0x200, %rax            # imm = 0x200
   8e64a:      	jne	0x8e5f0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x13b0>
   8e64c:      	xorl	%eax, %eax
   8e64e:      	nop
   8e650:      	movw	$0x0, -0x870(%rbp,%rax)
   8e65a:      	movw	$0x0, -0x86e(%rbp,%rax)
   8e664:      	movw	$0x0, -0x86c(%rbp,%rax)
   8e66e:      	movw	$0x0, -0x86a(%rbp,%rax)
   8e678:      	movw	$0x0, -0x868(%rbp,%rax)
   8e682:      	movw	$0x0, -0x866(%rbp,%rax)
   8e68c:      	movw	$0x0, -0x864(%rbp,%rax)
   8e696:      	movw	$0x0, -0x862(%rbp,%rax)
   8e6a0:      	addq	$0x10, %rax
   8e6a4:      	cmpq	$0x200, %rax            # imm = 0x200
   8e6aa:      	jne	0x8e650 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1410>
   8e6ac:      	xorl	%eax, %eax
   8e6ae:      	nop
   8e6b0:      	movw	$0x0, -0x670(%rbp,%rax)
   8e6ba:      	movw	$0x0, -0x66e(%rbp,%rax)
   8e6c4:      	movw	$0x0, -0x66c(%rbp,%rax)
   8e6ce:      	movw	$0x0, -0x66a(%rbp,%rax)
   8e6d8:      	movw	$0x0, -0x668(%rbp,%rax)
   8e6e2:      	movw	$0x0, -0x666(%rbp,%rax)
   8e6ec:      	movw	$0x0, -0x664(%rbp,%rax)
   8e6f6:      	movw	$0x0, -0x662(%rbp,%rax)
   8e700:      	addq	$0x10, %rax
   8e704:      	cmpq	$0x200, %rax            # imm = 0x200
   8e70a:      	jne	0x8e6b0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1470>
   8e70c:      	xorl	%eax, %eax
   8e70e:      	nop
   8e710:      	movw	$0x0, -0x1870(%rbp,%rax)
   8e71a:      	movw	$0x0, -0x186e(%rbp,%rax)
   8e724:      	movw	$0x0, -0x186c(%rbp,%rax)
   8e72e:      	movw	$0x0, -0x186a(%rbp,%rax)
   8e738:      	movw	$0x0, -0x1868(%rbp,%rax)
   8e742:      	movw	$0x0, -0x1866(%rbp,%rax)
   8e74c:      	movw	$0x0, -0x1864(%rbp,%rax)
   8e756:      	movw	$0x0, -0x1862(%rbp,%rax)
   8e760:      	addq	$0x10, %rax
   8e764:      	cmpq	$0x200, %rax            # imm = 0x200
   8e76a:      	jne	0x8e710 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x14d0>
   8e76c:      	xorl	%eax, %eax
   8e76e:      	nop
   8e770:      	movw	$0x0, -0x1670(%rbp,%rax)
   8e77a:      	movw	$0x0, -0x166e(%rbp,%rax)
   8e784:      	movw	$0x0, -0x166c(%rbp,%rax)
   8e78e:      	movw	$0x0, -0x166a(%rbp,%rax)
   8e798:      	movw	$0x0, -0x1668(%rbp,%rax)
   8e7a2:      	movw	$0x0, -0x1666(%rbp,%rax)
   8e7ac:      	movw	$0x0, -0x1664(%rbp,%rax)
   8e7b6:      	movw	$0x0, -0x1662(%rbp,%rax)
   8e7c0:      	addq	$0x10, %rax
   8e7c4:      	cmpq	$0x200, %rax            # imm = 0x200
   8e7ca:      	jne	0x8e770 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1530>
   8e7cc:      	xorl	%eax, %eax
   8e7ce:      	nop
   8e7d0:      	movw	$0x0, -0x1470(%rbp,%rax)
   8e7da:      	movw	$0x0, -0x146e(%rbp,%rax)
   8e7e4:      	movw	$0x0, -0x146c(%rbp,%rax)
   8e7ee:      	movw	$0x0, -0x146a(%rbp,%rax)
   8e7f8:      	movw	$0x0, -0x1468(%rbp,%rax)
   8e802:      	movw	$0x0, -0x1466(%rbp,%rax)
   8e80c:      	movw	$0x0, -0x1464(%rbp,%rax)
   8e816:      	movw	$0x0, -0x1462(%rbp,%rax)
   8e820:      	addq	$0x10, %rax
   8e824:      	cmpq	$0x200, %rax            # imm = 0x200
   8e82a:      	jne	0x8e7d0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1590>
   8e82c:      	callq	0x102010 <_Unwind_Resume>
   8e831:      	int3
   8e832:      	int3
   8e833:      	int3
   8e834:      	int3
   8e835:      	int3
   8e836:      	int3
   8e837:      	int3
   8e838:      	int3
   8e839:      	int3
   8e83a:      	int3
   8e83b:      	int3
   8e83c:      	int3
   8e83d:      	int3
   8e83e:      	int3
   8e83f:      	int3

000000000008e840 <<toyos_crypto::mlkem::Poly>::ntt>:
   8e840:      	pushq	%rbp
   8e841:      	movq	%rsp, %rbp
   8e844:      	pushq	%r15
   8e846:      	pushq	%r14
   8e848:      	pushq	%r13
   8e84a:      	pushq	%r12
   8e84c:      	pushq	%rbx
   8e84d:      	subq	$0x58, %rsp
   8e851:      	movq	%rsi, %rbx
   8e854:      	movq	%rdi, -0x30(%rbp)
   8e858:      	movl	$0x8, %eax
   8e85d:      	leaq	-0x7229c(%rip), %r14    # 0x1c5c8 <toyos_crypto::ed25519::B_ODD+0xd98>
   8e864:      	jmp	0x8e886 <<toyos_crypto::mlkem::Poly>::ntt+0x46>
   8e866:      	nopw	%cs:(%rax,%rax)
   8e870:      	leaq	-0x721b1(%rip), %r14    # 0x1c6c6 <toyos_crypto::ed25519::B_ODD+0xe96>
   8e877:      	cmpq	$0x2, -0x38(%rbp)
   8e87c:      	movq	-0x40(%rbp), %rax
   8e880:      	jbe	0x8e97e <<toyos_crypto::mlkem::Poly>::ntt+0x13e>
   8e886:      	movq	%rax, -0x38(%rbp)
   8e88a:      	leaq	-0x1(%rax), %rcx
   8e88e:      	movl	$0x1, %edx
   8e893:      	shlq	%cl, %rdx
   8e896:      	movl	$0x2, %edi
   8e89b:      	movq	%rcx, -0x40(%rbp)
   8e89f:      	shlq	%cl, %rdi
   8e8a2:      	movl	%edi, %r12d
   8e8a5:      	negl	%r12d
   8e8a8:      	andl	$0x100, %r12d           # imm = 0x100
   8e8af:      	movq	%rbx, %r13
   8e8b2:      	cmpq	%r12, %rdi
   8e8b5:      	movq	%rdx, -0x50(%rbp)
   8e8b9:      	movq	%rdi, -0x48(%rbp)
   8e8bd:      	jbe	0x8e8e4 <<toyos_crypto::mlkem::Poly>::ntt+0xa4>
   8e8bf:      	jmp	0x8e877 <<toyos_crypto::mlkem::Poly>::ntt+0x37>
   8e8c1:      	nopw	%cs:(%rax,%rax)
   8e8d0:      	movq	-0x48(%rbp), %rdi
   8e8d4:      	subq	%rdi, %r12
   8e8d7:      	addq	$0x2, %r14
   8e8db:      	cmpq	%r12, %rdi
   8e8de:      	movq	-0x50(%rbp), %rdx
   8e8e2:      	ja	0x8e877 <<toyos_crypto::mlkem::Poly>::ntt+0x37>
   8e8e4:      	leaq	-0x72225(%rip), %rax    # 0x1c6c6 <toyos_crypto::ed25519::B_ODD+0xe96>
   8e8eb:      	cmpq	%rax, %r14
   8e8ee:      	je	0x8e870 <<toyos_crypto::mlkem::Poly>::ntt+0x30>
   8e8f0:      	cmpq	%rdi, %rdx
   8e8f3:      	ja	0x8ea12 <<toyos_crypto::mlkem::Poly>::ntt+0x1d2>
   8e8f9:      	movq	%r13, %rsi
   8e8fc:      	leaq	(%r13,%rdi,2), %r13
   8e901:      	movswl	(%r14), %r15d
   8e905:      	leaq	(%rsi,%rdx,2), %rcx
   8e909:      	leaq	-0x80(%rbp), %rdi
   8e90d:      	movq	%rcx, %rdx
   8e910:      	movq	%r13, %r8
   8e913:      	callq	0x8fe20 <<core::iter::adapters::zip::Zip<core::slice::iter::IterMut<i16>, core::slice::iter::Iter<i16>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::IterMut<i16>, core::slice::iter::Iter<i16>>>::new>
   8e918:      	movq	-0x60(%rbp), %rax
   8e91c:      	movq	-0x58(%rbp), %rcx
   8e920:      	cmpq	%rcx, %rax
   8e923:      	jae	0x8e8d0 <<toyos_crypto::mlkem::Poly>::ntt+0x90>
   8e925:      	movq	-0x80(%rbp), %rdx
   8e929:      	movq	-0x70(%rbp), %rsi
   8e92d:      	nopl	(%rax)
   8e930:      	movswl	(%rsi,%rax,2), %r8d
   8e935:      	imull	%r15d, %r8d
   8e939:      	imull	$0xf3010000, %r8d, %edi # imm = 0xF3010000
   8e940:      	sarl	$0x10, %edi
   8e943:      	imull	$0xfffff2ff, %edi, %edi # imm = 0xFFFFF2FF
   8e949:      	addl	%r8d, %edi
   8e94c:      	shrl	$0x10, %edi
   8e94f:      	movzwl	(%rdx,%rax,2), %r8d
   8e954:      	subw	%di, %r8w
   8e958:      	jo	0x8ea2c <<toyos_crypto::mlkem::Poly>::ntt+0x1ec>
   8e95e:      	movw	%r8w, (%rsi,%rax,2)
   8e963:      	addw	(%rdx,%rax,2), %di
   8e967:      	jo	0x8ea3a <<toyos_crypto::mlkem::Poly>::ntt+0x1fa>
   8e96d:      	movw	%di, (%rdx,%rax,2)
   8e971:      	incq	%rax
   8e974:      	cmpq	%rax, %rcx
   8e977:      	jne	0x8e930 <<toyos_crypto::mlkem::Poly>::ntt+0xf0>
   8e979:      	jmp	0x8e8d0 <<toyos_crypto::mlkem::Poly>::ntt+0x90>
   8e97e:      	xorl	%eax, %eax
   8e980:      	movdqa	-0x83ec8(%rip), %xmm0   # 0xaac0 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x1f0>
   8e988:      	movdqa	-0x83f60(%rip), %xmm1   # 0xaa30 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x160>
   8e990:      	movdqa	-0x83c48(%rip), %xmm2   # 0xad50 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x480>
   8e998:      	nopl	(%rax,%rax)
   8e9a0:      	movdqu	(%rbx,%rax,2), %xmm3
   8e9a5:      	movdqa	%xmm3, %xmm4
   8e9a9:      	punpcklwd	%xmm4, %xmm4    # xmm4 = xmm4[0,0,1,1,2,2,3,3]
   8e9ad:      	movdqa	%xmm3, %xmm5
   8e9b1:      	punpckhwd	%xmm5, %xmm5    # xmm5 = xmm5[4,4,5,5,6,6,7,7]
   8e9b5:      	pmaddwd	%xmm0, %xmm5
   8e9b9:      	pmaddwd	%xmm0, %xmm4
   8e9bd:      	paddd	%xmm1, %xmm4
   8e9c1:      	paddd	%xmm1, %xmm5
   8e9c5:      	psrad	$0x1a, %xmm5
   8e9ca:      	psrad	$0x1a, %xmm4
   8e9cf:      	packssdw	%xmm5, %xmm4
   8e9d3:      	pmullw	%xmm2, %xmm4
   8e9d7:      	paddw	%xmm3, %xmm4
   8e9db:      	movdqu	%xmm4, (%rbx,%rax,2)
   8e9e0:      	addq	$0x8, %rax
   8e9e4:      	cmpq	$0x100, %rax            # imm = 0x100
   8e9ea:      	jne	0x8e9a0 <<toyos_crypto::mlkem::Poly>::ntt+0x160>
   8e9ec:      	movl	$0x200, %edx            # imm = 0x200
   8e9f1:      	movq	-0x30(%rbp), %r14
   8e9f5:      	movq	%r14, %rdi
   8e9f8:      	movq	%rbx, %rsi
   8e9fb:      	callq	0x10be00 <memcpy>
   8ea00:      	movq	%r14, %rax
   8ea03:      	addq	$0x58, %rsp
   8ea07:      	popq	%rbx
   8ea08:      	popq	%r12
   8ea0a:      	popq	%r13
   8ea0c:      	popq	%r14
   8ea0e:      	popq	%r15
   8ea10:      	popq	%rbp
   8ea11:      	retq
   8ea12:      	leaq	-0x7245d(%rip), %rdi    # 0x1c5bc <toyos_crypto::ed25519::B_ODD+0xd8c>
   8ea19:      	leaq	0x810c0(%rip), %rdx     # 0x10fae0 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x1a8>
   8ea20:      	movl	$0x13, %esi
   8ea25:      	callq	0x107400 <core::panicking::panic_fmt>
   8ea2a:      	jmp	0x8ea46 <<toyos_crypto::mlkem::Poly>::ntt+0x206>
   8ea2c:      	leaq	0x810c5(%rip), %rdi     # 0x10faf8 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x1c0>
   8ea33:      	callq	0x108030 <core::panicking::panic_const::panic_const_sub_overflow>
   8ea38:      	jmp	0x8ea46 <<toyos_crypto::mlkem::Poly>::ntt+0x206>
   8ea3a:      	leaq	0x810cf(%rip), %rdi     # 0x10fb10 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x1d8>
   8ea41:      	callq	0x107fd0 <core::panicking::panic_const::panic_const_add_overflow>
   8ea46:      	ud2
   8ea48:      	jmp	0x8ea4a <<toyos_crypto::mlkem::Poly>::ntt+0x20a>
   8ea4a:      	xorl	%ecx, %ecx
   8ea4c:      	nopl	(%rax)
   8ea50:      	movw	$0x0, (%rbx,%rcx)
   8ea56:      	movw	$0x0, 0x2(%rbx,%rcx)
   8ea5d:      	movw	$0x0, 0x4(%rbx,%rcx)
   8ea64:      	movw	$0x0, 0x6(%rbx,%rcx)
   8ea6b:      	movw	$0x0, 0x8(%rbx,%rcx)
   8ea72:      	movw	$0x0, 0xa(%rbx,%rcx)
   8ea79:      	movw	$0x0, 0xc(%rbx,%rcx)
   8ea80:      	movw	$0x0, 0xe(%rbx,%rcx)
   8ea87:      	addq	$0x10, %rcx
   8ea8b:      	cmpq	$0x200, %rcx            # imm = 0x200
   8ea92:      	jne	0x8ea50 <<toyos_crypto::mlkem::Poly>::ntt+0x210>
   8ea94:      	movq	%rax, %rdi
   8ea97:      	callq	0x102010 <_Unwind_Resume>
   8ea9c:      	int3
   8ea9d:      	int3
   8ea9e:      	int3
   8ea9f:      	int3

000000000008eaa0 <<toyos_crypto::mlkem::Poly>::plus>:
   8eaa0:      	pushq	%rbp
   8eaa1:      	movq	%rsp, %rbp
   8eaa4:      	pushq	%r15
   8eaa6:      	pushq	%r14
   8eaa8:      	pushq	%rbx
   8eaa9:      	pushq	%rax
   8eaaa:      	movq	%rdx, %r15
   8eaad:      	movq	%rsi, %rbx
   8eab0:      	movq	%rdi, %r14
   8eab3:      	leaq	0x200(%rsi), %rdi
   8eaba:      	callq	0x108930 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   8eabf:      	testb	%al, %al
   8eac1:      	je	0x8eb2b <<toyos_crypto::mlkem::Poly>::plus+0x8b>
   8eac3:      	leaq	0x200(%r15), %rdi
   8eaca:      	movq	%r15, %rsi
   8eacd:      	callq	0x108930 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   8ead2:      	testb	%al, %al
   8ead4:      	je	0x8eb2b <<toyos_crypto::mlkem::Poly>::plus+0x8b>
   8ead6:      	movl	$0x1, %eax
   8eadb:      	nopl	(%rax,%rax)
   8eae0:      	movzwl	-0x2(%rbx,%rax,2), %ecx
   8eae5:      	addw	-0x2(%r15,%rax,2), %cx
   8eaeb:      	jo	0x8eb45 <<toyos_crypto::mlkem::Poly>::plus+0xa5>
   8eaed:      	movw	%cx, -0x2(%rbx,%rax,2)
   8eaf2:      	movzwl	(%rbx,%rax,2), %ecx
   8eaf6:      	addw	(%r15,%rax,2), %cx
   8eafb:      	jo	0x8eb45 <<toyos_crypto::mlkem::Poly>::plus+0xa5>
   8eafd:      	movw	%cx, (%rbx,%rax,2)
   8eb01:      	addq	$0x2, %rax
   8eb05:      	cmpq	$0x101, %rax            # imm = 0x101
   8eb0b:      	jne	0x8eae0 <<toyos_crypto::mlkem::Poly>::plus+0x40>
   8eb0d:      	movl	$0x200, %edx            # imm = 0x200
   8eb12:      	movq	%r14, %rdi
   8eb15:      	movq	%rbx, %rsi
   8eb18:      	callq	0x10be00 <memcpy>
   8eb1d:      	movq	%r14, %rax
   8eb20:      	addq	$0x8, %rsp
   8eb24:      	popq	%rbx
   8eb25:      	popq	%r14
   8eb27:      	popq	%r15
   8eb29:      	popq	%rbp
   8eb2a:      	retq
   8eb2b:      	leaq	-0x72292(%rip), %rdi    # 0x1c8a0 <anon.5391260ae5ca5c88418eb2dc579b1d1e.0.llvm.7938252219715782758>
   8eb32:      	leaq	0x81127(%rip), %rcx     # 0x10fc60 <anon.5391260ae5ca5c88418eb2dc579b1d1e.2.llvm.7938252219715782758>
   8eb39:      	movl	$0x193, %esi            # imm = 0x193
   8eb3e:      	xorl	%edx, %edx
   8eb40:      	callq	0x107240 <core::panicking::panic_nounwind_fmt>
   8eb45:      	leaq	0x80fdc(%rip), %rdi     # 0x10fb28 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x1f0>
   8eb4c:      	callq	0x107fd0 <core::panicking::panic_const::panic_const_add_overflow>
   8eb51:      	ud2
   8eb53:      	callq	0x10735f <core::panicking::panic_cannot_unwind>
   8eb58:      	callq	0x10735f <core::panicking::panic_cannot_unwind>
   8eb5d:      	xorl	%ecx, %ecx
   8eb5f:      	nop
   8eb60:      	movw	$0x0, (%rbx,%rcx)
   8eb66:      	movw	$0x0, 0x2(%rbx,%rcx)
   8eb6d:      	movw	$0x0, 0x4(%rbx,%rcx)
   8eb74:      	movw	$0x0, 0x6(%rbx,%rcx)
   8eb7b:      	movw	$0x0, 0x8(%rbx,%rcx)
   8eb82:      	movw	$0x0, 0xa(%rbx,%rcx)
   8eb89:      	movw	$0x0, 0xc(%rbx,%rcx)
   8eb90:      	movw	$0x0, 0xe(%rbx,%rcx)
   8eb97:      	addq	$0x10, %rcx
   8eb9b:      	cmpq	$0x200, %rcx            # imm = 0x200
   8eba2:      	jne	0x8eb60 <<toyos_crypto::mlkem::Poly>::plus+0xc0>
   8eba4:      	movq	%rax, %rdi
   8eba7:      	callq	0x102010 <_Unwind_Resume>
   8ebac:      	int3
   8ebad:      	int3
   8ebae:      	int3
   8ebaf:      	int3

000000000008ebb0 <<toyos_crypto::mlkem::Poly>::inverse>:
   8ebb0:      	pushq	%rbp
   8ebb1:      	movq	%rsp, %rbp
   8ebb4:      	pushq	%r15
   8ebb6:      	pushq	%r14
   8ebb8:      	pushq	%r13
   8ebba:      	pushq	%r12
   8ebbc:      	pushq	%rbx
   8ebbd:      	subq	$0x228, %rsp            # imm = 0x228
   8ebc4:      	movq	%rsi, %r14
   8ebc7:      	movq	%rdi, -0x30(%rbp)
   8ebcb:      	movl	$0x1, %ecx
   8ebd0:      	leaq	-0x72511(%rip), %rbx    # 0x1c6c6 <toyos_crypto::ed25519::B_ODD+0xe96>
   8ebd7:      	jmp	0x8ebf8 <<toyos_crypto::mlkem::Poly>::inverse+0x48>
   8ebd9:      	nopl	(%rax)
   8ebe0:      	leaq	-0x7261f(%rip), %rbx    # 0x1c5c8 <toyos_crypto::ed25519::B_ODD+0xd98>
   8ebe7:      	movq	-0x38(%rbp), %rcx
   8ebeb:      	incq	%rcx
   8ebee:      	cmpq	$0x8, %rcx
   8ebf2:      	je	0x8ed1a <<toyos_crypto::mlkem::Poly>::inverse+0x16a>
   8ebf8:      	movl	$0x1, %eax
   8ebfd:      	shlq	%cl, %rax
   8ec00:      	movq	%rax, -0x48(%rbp)
   8ec04:      	movl	$0x2, %edx
   8ec09:      	movq	%rcx, -0x38(%rbp)
   8ec0d:      	shlq	%cl, %rdx
   8ec10:      	movl	%edx, %r15d
   8ec13:      	negl	%r15d
   8ec16:      	andl	$0x100, %r15d           # imm = 0x100
   8ec1d:      	movq	%r14, %r13
   8ec20:      	cmpq	%r15, %rdx
   8ec23:      	movq	%rdx, -0x40(%rbp)
   8ec27:      	jbe	0x8ec40 <<toyos_crypto::mlkem::Poly>::inverse+0x90>
   8ec29:      	jmp	0x8ebe7 <<toyos_crypto::mlkem::Poly>::inverse+0x37>
   8ec2b:      	nopl	(%rax,%rax)
   8ec30:      	movq	-0x40(%rbp), %rdx
   8ec34:      	subq	%rdx, %r15
   8ec37:      	addq	$-0x2, %rbx
   8ec3b:      	cmpq	%r15, %rdx
   8ec3e:      	ja	0x8ebe7 <<toyos_crypto::mlkem::Poly>::inverse+0x37>
   8ec40:      	leaq	-0x7267f(%rip), %rax    # 0x1c5c8 <toyos_crypto::ed25519::B_ODD+0xd98>
   8ec47:      	cmpq	%rax, %rbx
   8ec4a:      	je	0x8ebe0 <<toyos_crypto::mlkem::Poly>::inverse+0x30>
   8ec4c:      	movq	%r13, %rsi
   8ec4f:      	leaq	(%r13,%rdx,2), %r13
   8ec54:      	movswl	-0x2(%rbx), %r12d
   8ec59:      	movq	-0x48(%rbp), %rax
   8ec5d:      	leaq	(%rsi,%rax,2), %rcx
   8ec61:      	leaq	-0x248(%rbp), %rdi
   8ec68:      	movq	%rcx, %rdx
   8ec6b:      	movq	%r13, %r8
   8ec6e:      	callq	0x8fe20 <<core::iter::adapters::zip::Zip<core::slice::iter::IterMut<i16>, core::slice::iter::Iter<i16>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::IterMut<i16>, core::slice::iter::Iter<i16>>>::new>
   8ec73:      	movq	-0x228(%rbp), %rax
   8ec7a:      	movq	-0x220(%rbp), %rcx
   8ec81:      	cmpq	%rcx, %rax
   8ec84:      	jae	0x8ec30 <<toyos_crypto::mlkem::Poly>::inverse+0x80>
   8ec86:      	movq	-0x248(%rbp), %rdx
   8ec8d:      	movq	-0x238(%rbp), %rsi
   8ec94:      	nopw	%cs:(%rax,%rax)
   8eca0:      	movzwl	(%rdx,%rax,2), %edi
   8eca4:      	movzwl	(%rsi,%rax,2), %r8d
   8eca9:      	addw	%di, %r8w
   8ecad:      	jo	0x8ee2d <<toyos_crypto::mlkem::Poly>::inverse+0x27d>
   8ecb3:      	movswl	%r8w, %r9d
   8ecb7:      	imull	$0x4ebf, %r9d, %r9d     # imm = 0x4EBF
   8ecbe:      	addl	$0x2000000, %r9d        # imm = 0x2000000
   8ecc5:      	sarl	$0x1a, %r9d
   8ecc9:      	imull	$0xfffff2ff, %r9d, %r9d # imm = 0xFFFFF2FF
   8ecd0:      	addl	%r8d, %r9d
   8ecd3:      	movw	%r9w, (%rdx,%rax,2)
   8ecd8:      	movzwl	(%rsi,%rax,2), %r8d
   8ecdd:      	subw	%di, %r8w
   8ece1:      	jo	0x8ee3b <<toyos_crypto::mlkem::Poly>::inverse+0x28b>
   8ece7:      	movswl	%r8w, %edi
   8eceb:      	imull	%r12d, %edi
   8ecef:      	imull	$0xf3010000, %edi, %r8d # imm = 0xF3010000
   8ecf6:      	sarl	$0x10, %r8d
   8ecfa:      	imull	$0xfffff2ff, %r8d, %r8d # imm = 0xFFFFF2FF
   8ed01:      	addl	%edi, %r8d
   8ed04:      	shrl	$0x10, %r8d
   8ed08:      	movw	%r8w, (%rsi,%rax,2)
   8ed0d:      	incq	%rax
   8ed10:      	cmpq	%rax, %rcx
   8ed13:      	jne	0x8eca0 <<toyos_crypto::mlkem::Poly>::inverse+0xf0>
   8ed15:      	jmp	0x8ec30 <<toyos_crypto::mlkem::Poly>::inverse+0x80>
   8ed1a:      	leaq	-0x248(%rbp), %rdi
   8ed21:      	movl	$0x200, %edx            # imm = 0x200
   8ed26:      	movq	%r14, %rsi
   8ed29:      	callq	0x10be00 <memcpy>
   8ed2e:      	xorl	%eax, %eax
   8ed30:      	movdqa	-0x84188(%rip), %xmm0   # 0xabb0 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x2e0>
   8ed38:      	movdqa	-0x84040(%rip), %xmm1   # 0xad00 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x430>
   8ed40:      	movdqu	-0x248(%rbp,%rax,2), %xmm3
   8ed49:      	punpckhwd	%xmm3, %xmm2    # xmm2 = xmm2[4],xmm3[4],xmm2[5],xmm3[5],xmm2[6],xmm3[6],xmm2[7],xmm3[7]
   8ed4d:      	psrad	$0x10, %xmm2
   8ed52:      	punpcklwd	%xmm3, %xmm3    # xmm3 = xmm3[0,0,1,1,2,2,3,3]
   8ed56:      	psrad	$0x10, %xmm3
   8ed5b:      	movdqa	%xmm3, %xmm4
   8ed5f:      	pmuludq	%xmm0, %xmm4
   8ed63:      	pshufd	$0xe8, %xmm4, %xmm4     # xmm4 = xmm4[0,2,2,3]
   8ed68:      	pshufd	$0xf5, %xmm3, %xmm5     # xmm5 = xmm3[1,1,3,3]
   8ed6d:      	pmuludq	%xmm0, %xmm5
   8ed71:      	pshufd	$0xe8, %xmm5, %xmm5     # xmm5 = xmm5[0,2,2,3]
   8ed76:      	punpckldq	%xmm5, %xmm4    # xmm4 = xmm4[0],xmm5[0],xmm4[1],xmm5[1]
   8ed7a:      	movdqa	%xmm2, %xmm5
   8ed7e:      	pmuludq	%xmm0, %xmm5
   8ed82:      	pshufd	$0xe8, %xmm5, %xmm5     # xmm5 = xmm5[0,2,2,3]
   8ed87:      	pshufd	$0xf5, %xmm2, %xmm6     # xmm6 = xmm2[1,1,3,3]
   8ed8c:      	pmuludq	%xmm0, %xmm6
   8ed90:      	pshufd	$0xe8, %xmm6, %xmm6     # xmm6 = xmm6[0,2,2,3]
   8ed95:      	punpckldq	%xmm6, %xmm5    # xmm5 = xmm5[0],xmm6[0],xmm5[1],xmm6[1]
   8ed99:      	psrld	$0x10, %xmm5
   8ed9e:      	psrld	$0x10, %xmm4
   8eda3:      	pshuflw	$0xe8, %xmm4, %xmm4     # xmm4 = xmm4[0,2,2,3,4,5,6,7]
   8eda8:      	pshufhw	$0xe8, %xmm4, %xmm4     # xmm4 = xmm4[0,1,2,3,4,6,6,7]
   8edad:      	pshufd	$0xe8, %xmm4, %xmm4     # xmm4 = xmm4[0,2,2,3]
   8edb2:      	packssdw	%xmm3, %xmm3
   8edb6:      	punpcklwd	%xmm3, %xmm4    # xmm4 = xmm4[0],xmm3[0],xmm4[1],xmm3[1],xmm4[2],xmm3[2],xmm4[3],xmm3[3]
   8edba:      	pmaddwd	%xmm1, %xmm4
   8edbe:      	pshuflw	$0xe8, %xmm5, %xmm3     # xmm3 = xmm5[0,2,2,3,4,5,6,7]
   8edc3:      	pshufhw	$0xe8, %xmm3, %xmm3     # xmm3 = xmm3[0,1,2,3,4,6,6,7]
   8edc8:      	pshufd	$0xe8, %xmm3, %xmm3     # xmm3 = xmm3[0,2,2,3]
   8edcd:      	packssdw	%xmm2, %xmm2
   8edd1:      	punpcklwd	%xmm2, %xmm3    # xmm3 = xmm3[0],xmm2[0],xmm3[1],xmm2[1],xmm3[2],xmm2[2],xmm3[3],xmm2[3]
   8edd5:      	pmaddwd	%xmm1, %xmm3
   8edd9:      	psrad	$0x10, %xmm3
   8edde:      	psrad	$0x10, %xmm4
   8ede3:      	packssdw	%xmm3, %xmm4
   8ede7:      	movdqu	%xmm4, -0x248(%rbp,%rax,2)
   8edf0:      	addq	$0x8, %rax
   8edf4:      	cmpq	$0x100, %rax            # imm = 0x100
   8edfa:      	jne	0x8ed40 <<toyos_crypto::mlkem::Poly>::inverse+0x190>
   8ee00:      	leaq	-0x248(%rbp), %rsi
   8ee07:      	movl	$0x200, %edx            # imm = 0x200
   8ee0c:      	movq	-0x30(%rbp), %rbx
   8ee10:      	movq	%rbx, %rdi
   8ee13:      	callq	0x10be00 <memcpy>
   8ee18:      	movq	%rbx, %rax
   8ee1b:      	addq	$0x228, %rsp            # imm = 0x228
   8ee22:      	popq	%rbx
   8ee23:      	popq	%r12
   8ee25:      	popq	%r13
   8ee27:      	popq	%r14
   8ee29:      	popq	%r15
   8ee2b:      	popq	%rbp
   8ee2c:      	retq
   8ee2d:      	leaq	0x80d0c(%rip), %rdi     # 0x10fb40 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x208>
   8ee34:      	callq	0x107fd0 <core::panicking::panic_const::panic_const_add_overflow>
   8ee39:      	jmp	0x8ee47 <<toyos_crypto::mlkem::Poly>::inverse+0x297>
   8ee3b:      	leaq	0x80d16(%rip), %rdi     # 0x10fb58 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x220>
   8ee42:      	callq	0x108030 <core::panicking::panic_const::panic_const_sub_overflow>
   8ee47:      	ud2
   8ee49:      	jmp	0x8ee4b <<toyos_crypto::mlkem::Poly>::inverse+0x29b>
   8ee4b:      	xorl	%ecx, %ecx
   8ee4d:      	nopl	(%rax)
   8ee50:      	movw	$0x0, (%r14,%rcx)
   8ee57:      	movw	$0x0, 0x2(%r14,%rcx)
   8ee5f:      	movw	$0x0, 0x4(%r14,%rcx)
   8ee67:      	movw	$0x0, 0x6(%r14,%rcx)
   8ee6f:      	movw	$0x0, 0x8(%r14,%rcx)
   8ee77:      	movw	$0x0, 0xa(%r14,%rcx)
   8ee7f:      	movw	$0x0, 0xc(%r14,%rcx)
   8ee87:      	movw	$0x0, 0xe(%r14,%rcx)
   8ee8f:      	addq	$0x10, %rcx
   8ee93:      	cmpq	$0x200, %rcx            # imm = 0x200
   8ee9a:      	jne	0x8ee50 <<toyos_crypto::mlkem::Poly>::inverse+0x2a0>
   8ee9c:      	movq	%rax, %rdi
   8ee9f:      	callq	0x102010 <_Unwind_Resume>
   8eea4:      	int3
   8eea5:      	int3
   8eea6:      	int3
   8eea7:      	int3
   8eea8:      	int3
   8eea9:      	int3
   8eeaa:      	int3
   8eeab:      	int3
   8eeac:      	int3
   8eead:      	int3
   8eeae:      	int3
   8eeaf:      	int3

000000000008eeb0 <toyos_crypto::mlkem::dot>:
   8eeb0:      	pushq	%rbp
   8eeb1:      	movq	%rsp, %rbp
   8eeb4:      	pushq	%r15
   8eeb6:      	pushq	%r14
   8eeb8:      	pushq	%r13
   8eeba:      	pushq	%r12
   8eebc:      	pushq	%rbx
   8eebd:      	subq	$0x228, %rsp            # imm = 0x228
   8eec4:      	movq	%rdx, %r14
   8eec7:      	movq	%rsi, %r15
   8eeca:      	movq	%rdi, -0x30(%rbp)
   8eece:      	leaq	-0x248(%rbp), %rdi
   8eed5:      	xorl	%ebx, %ebx
   8eed7:      	movl	$0x200, %edx            # imm = 0x200
   8eedc:      	xorl	%esi, %esi
   8eede:      	callq	0x10c330 <memset>
   8eee3:      	leaq	0x600(%r15), %rax
   8eeea:      	movq	%rax, -0x48(%rbp)
   8eeee:      	leaq	0x600(%r14), %rax
   8eef5:      	movq	%rax, -0x38(%rbp)
   8eef9:      	movq	%r14, -0x40(%rbp)
   8eefd:      	leaq	0x402(%r14), %r13
   8ef04:      	movq	%r15, %r12
   8ef07:      	leaq	0x402(%r15), %r14
   8ef0e:      	nop
   8ef10:      	leaq	-0x72851(%rip), %rax    # 0x1c6c6 <toyos_crypto::ed25519::B_ODD+0xe96>
   8ef17:      	movswl	(%rbx,%rax), %r15d
   8ef1c:      	movq	-0x48(%rbp), %rdi
   8ef20:      	movq	%r12, %rsi
   8ef23:      	callq	0x108930 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   8ef28:      	testb	%al, %al
   8ef2a:      	je	0x8f0f4 <toyos_crypto::mlkem::dot+0x244>
   8ef30:      	movq	-0x38(%rbp), %rdi
   8ef34:      	movq	-0x40(%rbp), %rsi
   8ef38:      	callq	0x108930 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   8ef3d:      	testb	%al, %al
   8ef3f:      	je	0x8f0f4 <toyos_crypto::mlkem::dot+0x244>
   8ef45:      	movswl	-0x402(%r14,%rbx,2), %ecx
   8ef4e:      	movswl	-0x400(%r14,%rbx,2), %edi
   8ef57:      	movswl	-0x402(%r13,%rbx,2), %edx
   8ef60:      	movswl	-0x400(%r13,%rbx,2), %esi
   8ef69:      	movl	%esi, %r8d
   8ef6c:      	imull	%ecx, %r8d
   8ef70:      	movl	%edx, %eax
   8ef72:      	imull	%edi, %eax
   8ef75:      	addl	%r8d, %eax
   8ef78:      	jo	0x8f10e <toyos_crypto::mlkem::dot+0x25e>
   8ef7e:      	imull	%edi, %esi
   8ef81:      	imull	$0xf3010000, %esi, %edi # imm = 0xF3010000
   8ef87:      	sarl	$0x10, %edi
   8ef8a:      	imull	$0xfffff2ff, %edi, %edi # imm = 0xFFFFF2FF
   8ef90:      	addl	%esi, %edi
   8ef92:      	sarl	$0x10, %edi
   8ef95:      	imull	%r15d, %edi
   8ef99:      	imull	%ecx, %edx
   8ef9c:      	addl	%edi, %edx
   8ef9e:      	movswl	-0x202(%r14,%rbx,2), %r9d
   8efa7:      	movswl	-0x200(%r14,%rbx,2), %edi
   8efb0:      	movswl	-0x202(%r13,%rbx,2), %esi
   8efb9:      	movswl	-0x200(%r13,%rbx,2), %r8d
   8efc2:      	movl	%esi, %r10d
   8efc5:      	imull	%r9d, %r10d
   8efc9:      	movl	%r8d, %r11d
   8efcc:      	imull	%edi, %r11d
   8efd0:      	imull	$0xf3010000, %r11d, %ecx # imm = 0xF3010000
   8efd7:      	sarl	$0x10, %ecx
   8efda:      	imull	$0xfffff2ff, %ecx, %ecx # imm = 0xFFFFF2FF
   8efe0:      	addl	%r11d, %ecx
   8efe3:      	sarl	$0x10, %ecx
   8efe6:      	imull	%r15d, %ecx
   8efea:      	addl	%r10d, %ecx
   8efed:      	addl	%edx, %ecx
   8efef:      	jo	0x8f120 <toyos_crypto::mlkem::dot+0x270>
   8eff5:      	imull	%r9d, %r8d
   8eff9:      	imull	%edi, %esi
   8effc:      	addl	%r8d, %esi
   8efff:      	jo	0x8f10e <toyos_crypto::mlkem::dot+0x25e>
   8f005:      	addl	%esi, %eax
   8f007:      	jo	0x8f117 <toyos_crypto::mlkem::dot+0x267>
   8f00d:      	movswl	-0x2(%r14,%rbx,2), %r8d
   8f013:      	movswl	(%r14,%rbx,2), %esi
   8f018:      	movswl	-0x2(%r13,%rbx,2), %edx
   8f01e:      	movswl	(%r13,%rbx,2), %edi
   8f024:      	movl	%edx, %r9d
   8f027:      	imull	%r8d, %r9d
   8f02b:      	movl	%edi, %r10d
   8f02e:      	imull	%esi, %r10d
   8f032:      	imull	$0xf3010000, %r10d, %r11d # imm = 0xF3010000
   8f039:      	sarl	$0x10, %r11d
   8f03d:      	imull	$0xfffff2ff, %r11d, %r11d # imm = 0xFFFFF2FF
   8f044:      	addl	%r10d, %r11d
   8f047:      	sarl	$0x10, %r11d
   8f04b:      	imull	%r15d, %r11d
   8f04f:      	addl	%r9d, %r11d
   8f052:      	addl	%r11d, %ecx
   8f055:      	jo	0x8f120 <toyos_crypto::mlkem::dot+0x270>
   8f05b:      	imull	%r8d, %edi
   8f05f:      	imull	%esi, %edx
   8f062:      	addl	%edi, %edx
   8f064:      	jo	0x8f10e <toyos_crypto::mlkem::dot+0x25e>
   8f06a:      	addl	%edx, %eax
   8f06c:      	jo	0x8f117 <toyos_crypto::mlkem::dot+0x267>
   8f072:      	imull	$0xf3010000, %ecx, %edx # imm = 0xF3010000
   8f078:      	sarl	$0x10, %edx
   8f07b:      	imull	$0xd01, %edx, %edx      # imm = 0xD01
   8f081:      	subl	%edx, %ecx
   8f083:      	jo	0x8f12e <toyos_crypto::mlkem::dot+0x27e>
   8f089:      	shrl	$0x10, %ecx
   8f08c:      	movw	%cx, -0x248(%rbp,%rbx,2)
   8f094:      	imull	$0xf3010000, %eax, %ecx # imm = 0xF3010000
   8f09a:      	sarl	$0x10, %ecx
   8f09d:      	imull	$0xd01, %ecx, %ecx      # imm = 0xD01
   8f0a3:      	subl	%ecx, %eax
   8f0a5:      	jo	0x8f12e <toyos_crypto::mlkem::dot+0x27e>
   8f0ab:      	shrl	$0x10, %eax
   8f0ae:      	movw	%ax, -0x246(%rbp,%rbx,2)
   8f0b6:      	addq	$0x2, %rbx
   8f0ba:      	cmpq	$0x100, %rbx            # imm = 0x100
   8f0c1:      	jne	0x8ef10 <toyos_crypto::mlkem::dot+0x60>
   8f0c7:      	movl	$0x200, %edx            # imm = 0x200
   8f0cc:      	movq	-0x30(%rbp), %rbx
   8f0d0:      	movq	%rbx, %rdi
   8f0d3:      	leaq	-0x248(%rbp), %rsi
   8f0da:      	callq	0x10be00 <memcpy>
   8f0df:      	movq	%rbx, %rax
   8f0e2:      	addq	$0x228, %rsp            # imm = 0x228
   8f0e9:      	popq	%rbx
   8f0ea:      	popq	%r12
   8f0ec:      	popq	%r13
   8f0ee:      	popq	%r14
   8f0f0:      	popq	%r15
   8f0f2:      	popq	%rbp
   8f0f3:      	retq
   8f0f4:      	leaq	-0x7285b(%rip), %rdi    # 0x1c8a0 <anon.5391260ae5ca5c88418eb2dc579b1d1e.0.llvm.7938252219715782758>
   8f0fb:      	leaq	0x80b5e(%rip), %rcx     # 0x10fc60 <anon.5391260ae5ca5c88418eb2dc579b1d1e.2.llvm.7938252219715782758>
   8f102:      	movl	$0x193, %esi            # imm = 0x193
   8f107:      	xorl	%edx, %edx
   8f109:      	callq	0x107240 <core::panicking::panic_nounwind_fmt>
   8f10e:      	leaq	0x80aa3(%rip), %rdi     # 0x10fbb8 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x280>
   8f115:      	jmp	0x8f127 <toyos_crypto::mlkem::dot+0x277>
   8f117:      	leaq	0x80ab2(%rip), %rdi     # 0x10fbd0 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x298>
   8f11e:      	jmp	0x8f127 <toyos_crypto::mlkem::dot+0x277>
   8f120:      	leaq	0x80a79(%rip), %rdi     # 0x10fba0 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x268>
   8f127:      	callq	0x107fd0 <core::panicking::panic_const::panic_const_add_overflow>
   8f12c:      	jmp	0x8f13a <toyos_crypto::mlkem::dot+0x28a>
   8f12e:      	leaq	0x80a53(%rip), %rdi     # 0x10fb88 <anon.dfd25031899a33fef52000a7a3d0eece.4.llvm.1398745484524544608+0x250>
   8f135:      	callq	0x108030 <core::panicking::panic_const::panic_const_sub_overflow>
   8f13a:      	ud2
   8f13c:      	callq	0x10735f <core::panicking::panic_cannot_unwind>
   8f141:      	callq	0x10735f <core::panicking::panic_cannot_unwind>
   8f146:      	xorl	%ecx, %ecx
   8f148:      	nopl	(%rax,%rax)
   8f150:      	movw	$0x0, -0x248(%rbp,%rcx)
   8f15a:      	movw	$0x0, -0x246(%rbp,%rcx)
   8f164:      	movw	$0x0, -0x244(%rbp,%rcx)
   8f16e:      	movw	$0x0, -0x242(%rbp,%rcx)
   8f178:      	movw	$0x0, -0x240(%rbp,%rcx)
   8f182:      	movw	$0x0, -0x23e(%rbp,%rcx)
   8f18c:      	movw	$0x0, -0x23c(%rbp,%rcx)
   8f196:      	movw	$0x0, -0x23a(%rbp,%rcx)
   8f1a0:      	addq	$0x10, %rcx
   8f1a4:      	cmpq	$0x200, %rcx            # imm = 0x200
   8f1ab:      	jne	0x8f150 <toyos_crypto::mlkem::dot+0x2a0>
   8f1ad:      	movq	%rax, %rdi
   8f1b0:      	callq	0x102010 <_Unwind_Resume>
   8f1b5:      	int3
   8f1b6:      	int3
   8f1b7:      	int3
   8f1b8:      	int3
   8f1b9:      	int3
   8f1ba:      	int3
   8f1bb:      	int3
   8f1bc:      	int3
   8f1bd:      	int3
   8f1be:      	int3
   8f1bf:      	int3

000000000008f1c0 <toyos_crypto::mlkem::noise>:
   8f1c0:      	pushq	%rbp
   8f1c1:      	movq	%rsp, %rbp
   8f1c4:      	pushq	%r15
   8f1c6:      	pushq	%r14
   8f1c8:      	pushq	%rbx
   8f1c9:      	subq	$0x2a8, %rsp            # imm = 0x2A8
   8f1d0:      	movq	%rdi, %rbx
   8f1d3:      	xorps	%xmm0, %xmm0
   8f1d6:      	movaps	%xmm0, -0x50(%rbp)
   8f1da:      	movaps	%xmm0, -0x60(%rbp)
   8f1de:      	movaps	%xmm0, -0x70(%rbp)
   8f1e2:      	movaps	%xmm0, -0x80(%rbp)
   8f1e6:      	movaps	%xmm0, -0x90(%rbp)
   8f1ed:      	movaps	%xmm0, -0xa0(%rbp)
   8f1f4:      	movaps	%xmm0, -0xb0(%rbp)
   8f1fb:      	movaps	%xmm0, -0xc0(%rbp)
   8f202:      	movb	%dl, -0x19(%rbp)
   8f205:      	movq	%rsi, -0x40(%rbp)
   8f209:      	movq	$0x20, -0x38(%rbp)
   8f211:      	leaq	-0x19(%rbp), %rax
   8f215:      	movq	%rax, -0x30(%rbp)
   8f219:      	movq	$0x1, -0x28(%rbp)
   8f221:      	leaq	-0x2c0(%rbp), %rdi
   8f228:      	leaq	-0x40(%rbp), %rcx
   8f22c:      	movl	$0x88, %esi
   8f231:      	movl	$0x2, %r8d
   8f237:      	movl	$0x1f, %edx
   8f23c:      	callq	0x99020 <<toyos_crypto::keccak::Sponge>::new>
   8f241:      	leaq	-0x2c0(%rbp), %rdi
   8f248:      	leaq	-0xc0(%rbp), %r14
   8f24f:      	movl	$0x80, %edx
   8f254:      	movq	%r14, %rsi
   8f257:      	callq	0x99400 <<toyos_crypto::keccak::Sponge>::read>
   8f25c:      	movq	$0x0, -0x2c0(%rbp)
   8f267:      	movq	$0x0, -0x2b8(%rbp)
   8f272:      	movq	$0x0, -0x2b0(%rbp)
   8f27d:      	movq	$0x0, -0x2a8(%rbp)
   8f288:      	movq	$0x0, -0x2a0(%rbp)
   8f293:      	movq	$0x0, -0x298(%rbp)
   8f29e:      	movq	$0x0, -0x290(%rbp)
   8f2a9:      	movq	$0x0, -0x288(%rbp)
   8f2b4:      	movq	$0x0, -0x280(%rbp)
   8f2bf:      	movq	$0x0, -0x278(%rbp)
   8f2ca:      	movq	$0x0, -0x270(%rbp)
   8f2d5:      	movq	$0x0, -0x268(%rbp)
   8f2e0:      	movq	$0x0, -0x260(%rbp)
   8f2eb:      	movq	$0x0, -0x258(%rbp)
   8f2f6:      	movq	$0x0, -0x250(%rbp)
   8f301:      	movq	$0x0, -0x248(%rbp)
   8f30c:      	movq	$0x0, -0x240(%rbp)
   8f317:      	movq	$0x0, -0x238(%rbp)
   8f322:      	movq	$0x0, -0x230(%rbp)
   8f32d:      	movq	$0x0, -0x228(%rbp)
   8f338:      	movq	$0x0, -0x220(%rbp)
   8f343:      	movq	$0x0, -0x218(%rbp)
   8f34e:      	movq	$0x0, -0x210(%rbp)
   8f359:      	movq	$0x0, -0x208(%rbp)
   8f364:      	movq	$0x0, -0x200(%rbp)
   8f36f:      	leaq	-0x2c0(%rbp), %rdi
   8f376:      	xorl	%r15d, %r15d
   8f379:      	movl	$0x200, %edx            # imm = 0x200
   8f37e:      	xorl	%esi, %esi
   8f380:      	callq	0x10c330 <memset>
   8f385:      	movd	-0x84bad(%rip), %xmm0   # 0xa7e0 <anon.304f3e18aaeeeb96385624560635dea3.4.llvm.1672722234689197564+0x80>
   8f38d:      	movd	-0x84515(%rip), %xmm1   # 0xae80 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x5b0>
   8f395:      	pxor	%xmm2, %xmm2
   8f399:      	movdqa	-0x84bd1(%rip), %xmm3   # 0xa7d0 <anon.304f3e18aaeeeb96385624560635dea3.4.llvm.1672722234689197564+0x70>
   8f3a1:      	movdqa	-0x84619(%rip), %xmm4   # 0xad90 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x4c0>
   8f3a9:      	movdqa	-0x84c21(%rip), %xmm5   # 0xa790 <anon.304f3e18aaeeeb96385624560635dea3.4.llvm.1672722234689197564+0x30>
   8f3b1:      	movdqa	-0x84b59(%rip), %xmm6   # 0xa860 <anon.304f3e18aaeeeb96385624560635dea3.4.llvm.1672722234689197564+0x100>
   8f3b9:      	movdqa	-0x84711(%rip), %xmm7   # 0xacb0 <anon.40f785f6b62e515e37e274aba7524aee.2.llvm.16563765542952341371+0x3e0>
   8f3c1:      	nopw	%cs:(%rax,%rax)
   8f3d0:      	movzbl	(%r14), %eax
   8f3d4:      	movd	%eax, %xmm8
   8f3d9:      	punpcklbw	%xmm8, %xmm8    # xmm8 = xmm8[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
   8f3de:      	movdqa	%xmm0, %xmm9
   8f3e3:      	psllw	$0x7, %xmm9
   8f3e9:      	pand	%xmm1, %xmm9
   8f3ee:      	pxor	%xmm10, %xmm10
   8f3f3:      	pcmpgtb	%xmm9, %xmm10
   8f3f8:      	movdqa	%xmm10, %xmm11
   8f3fd:      	pandn	%xmm8, %xmm11
   8f402:      	psrlw	$0x4, %xmm8
   8f408:      	pand	%xmm10, %xmm8
   8f40d:      	pand	%xmm3, %xmm8
   8f412:      	por	%xmm11, %xmm8
   8f417:      	paddb	%xmm9, %xmm9
   8f41c:      	pxor	%xmm10, %xmm10
   8f421:      	pcmpgtb	%xmm9, %xmm10
   8f426:      	movdqa	%xmm10, %xmm11
   8f42b:      	pandn	%xmm8, %xmm11
   8f430:      	psrlw	$0x2, %xmm8
   8f436:      	pand	%xmm10, %xmm8
   8f43b:      	pand	%xmm4, %xmm8
   8f440:      	por	%xmm11, %xmm8
   8f445:      	paddb	%xmm9, %xmm9
   8f44a:      	pxor	%xmm10, %xmm10
   8f44f:      	pcmpgtb	%xmm9, %xmm10
   8f454:      	movdqa	%xmm10, %xmm9
   8f459:      	pandn	%xmm8, %xmm9
   8f45e:      	psrlw	$0x1, %xmm8
   8f464:      	pand	%xmm10, %xmm8
   8f469:      	pand	%xmm5, %xmm8
   8f46e:      	por	%xmm9, %xmm8
   8f473:      	movdqa	%xmm8, %xmm9
   8f478:      	pand	%xmm6, %xmm9
   8f47d:      	movdqa	%xmm8, %xmm10
   8f482:      	psrlw	$0x1, %xmm10
   8f488:      	pand	%xmm6, %xmm10
   8f48d:      	paddb	%xmm9, %xmm10
   8f492:      	movdqa	%xmm8, %xmm9
   8f497:      	psrlw	$0x2, %xmm9
   8f49d:      	pand	%xmm6, %xmm9
   8f4a2:      	psrlw	$0x3, %xmm8
   8f4a8:      	pand	%xmm6, %xmm8
   8f4ad:      	paddb	%xmm9, %xmm8
   8f4b2:      	punpcklbw	%xmm2, %xmm10   # xmm10 = xmm10[0],xmm2[0],xmm10[1],xmm2[1],xmm10[2],xmm2[2],xmm10[3],xmm2[3],xmm10[4],xmm2[4],xmm10[5],xmm2[5],xmm10[6],xmm2[6],xmm10[7],xmm2[7]
   8f4b7:      	punpcklbw	%xmm2, %xmm8    # xmm8 = xmm8[0],xmm2[0],xmm8[1],xmm2[1],xmm8[2],xmm2[2],xmm8[3],xmm2[3],xmm8[4],xmm2[4],xmm8[5],xmm2[5],xmm8[6],xmm2[6],xmm8[7],xmm2[7]
   8f4bc:      	psubw	%xmm8, %xmm10
   8f4c1:      	movd	%xmm10, -0x2c0(%rbp,%r15,2)
   8f4cb:      	addq	$0x2, %r15
   8f4cf:      	paddb	%xmm7, %xmm0
   8f4d3:      	incq	%r14
   8f4d6:      	cmpq	$0x100, %r15            # imm = 0x100
   8f4dd:      	jne	0x8f3d0 <toyos_crypto::mlkem::noise+0x210>
   8f4e3:      	leaq	-0x2c0(%rbp), %rsi
   8f4ea:      	movl	$0x200, %edx            # imm = 0x200
   8f4ef:      	movq	%rbx, %rdi
   8f4f2:      	callq	0x10be00 <memcpy>
   8f4f7:      	pxor	%xmm0, %xmm0
   8f4fb:      	movdqa	%xmm0, -0x2c0(%rbp)
   8f503:      	movaps	-0x2c0(%rbp), %xmm1
   8f50a:      	movaps	%xmm1, -0xc0(%rbp)
   8f511:      	movdqa	%xmm0, -0x2c0(%rbp)
   8f519:      	movaps	-0x2c0(%rbp), %xmm1
   8f520:      	movaps	%xmm1, -0xb0(%rbp)
   8f527:      	movdqa	%xmm0, -0x2c0(%rbp)
   8f52f:      	movaps	-0x2c0(%rbp), %xmm1
   8f536:      	movaps	%xmm1, -0xa0(%rbp)
   8f53d:      	movdqa	%xmm0, -0x2c0(%rbp)
   8f545:      	movaps	-0x2c0(%rbp), %xmm1
   8f54c:      	movaps	%xmm1, -0x90(%rbp)
   8f553:      	movdqa	%xmm0, -0x2c0(%rbp)
   8f55b:      	movaps	-0x2c0(%rbp), %xmm1
   8f562:      	movaps	%xmm1, -0x80(%rbp)
   8f566:      	movdqa	%xmm0, -0x2c0(%rbp)
   8f56e:      	movaps	-0x2c0(%rbp), %xmm1
   8f575:      	movaps	%xmm1, -0x70(%rbp)
   8f579:      	movdqa	%xmm0, -0x2c0(%rbp)
   8f581:      	movaps	-0x2c0(%rbp), %xmm1
   8f588:      	movaps	%xmm1, -0x60(%rbp)
   8f58c:      	movdqa	%xmm0, -0x2c0(%rbp)
   8f594:      	movaps	-0x2c0(%rbp), %xmm0
   8f59b:      	movaps	%xmm0, -0x50(%rbp)
   8f59f:      	movq	%rbx, %rax
   8f5a2:      	addq	$0x2a8, %rsp            # imm = 0x2A8
   8f5a9:      	popq	%rbx
   8f5aa:      	popq	%r14
   8f5ac:      	popq	%r15
   8f5ae:      	popq	%rbp
   8f5af:      	retq
   8f5b0:      	movq	%rax, %rbx
   8f5b3:      	leaq	-0x2c0(%rbp), %rdi
   8f5ba:      	callq	0x8fb20 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   8f5bf:      	jmp	0x8f5c4 <toyos_crypto::mlkem::noise+0x404>
   8f5c1:      	movq	%rax, %rbx
   8f5c4:      	leaq	-0xc0(%rbp), %rdi
   8f5cb:      	callq	0x8f940 <core::ptr::drop_glue::<toyos_crypto::secret::Secret<8, [u8; 16]>>>
   8f5d0:      	movq	%rbx, %rdi
   8f5d3:      	callq	0x102010 <_Unwind_Resume>
   8f5d8:      	callq	0x1071ea <core::panicking::panic_in_cleanup>
   8f5dd:      	int3
   8f5de:      	int3
   8f5df:      	int3

000000000008f5e0 <toyos_crypto::mlkem::sample>:
   8f5e0:      	pushq	%rbp
   8f5e1:      	movq	%rsp, %rbp
   8f5e4:      	pushq	%r15
   8f5e6:      	pushq	%r14
   8f5e8:      	pushq	%r12
   8f5ea:      	pushq	%rbx
   8f5eb:      	subq	$0x380, %rsp            # imm = 0x380
   8f5f2:      	movq	%rdi, %rbx
   8f5f5:      	movb	%cl, -0x1a0(%rbp)
   8f5fb:      	movb	%dl, -0x19f(%rbp)
   8f601:      	movq	%rsi, -0x3a0(%rbp)
   8f608:      	movq	$0x20, -0x398(%rbp)
   8f613:      	leaq	-0x1a0(%rbp), %r14
   8f61a:      	movq	%r14, -0x390(%rbp)
   8f621:      	movq	$0x2, -0x388(%rbp)
   8f62c:      	leaq	-0xf8(%rbp), %r15
   8f633:      	leaq	-0x3a0(%rbp), %rcx
   8f63a:      	movl	$0xa8, %esi
   8f63f:      	movl	$0x2, %r8d
   8f645:      	movq	%r15, %rdi
   8f648:      	movl	$0x1f, %edx
   8f64d:      	callq	0x99020 <<toyos_crypto::keccak::Sponge>::new>
   8f652:      	leaq	-0x3a0(%rbp), %rdi
   8f659:      	xorl	%r12d, %r12d
   8f65c:      	movl	$0x200, %edx            # imm = 0x200
   8f661:      	xorl	%esi, %esi
   8f663:      	callq	0x10c330 <memset>
   8f668:      	xorps	%xmm0, %xmm0
   8f66b:      	movaps	%xmm0, -0x110(%rbp)
   8f672:      	movaps	%xmm0, -0x120(%rbp)
   8f679:      	movaps	%xmm0, -0x130(%rbp)
   8f680:      	movaps	%xmm0, -0x140(%rbp)
   8f687:      	movaps	%xmm0, -0x150(%rbp)
   8f68e:      	movaps	%xmm0, -0x160(%rbp)
   8f695:      	movaps	%xmm0, -0x170(%rbp)
   8f69c:      	movaps	%xmm0, -0x180(%rbp)
   8f6a3:      	movaps	%xmm0, -0x190(%rbp)
   8f6aa:      	movaps	%xmm0, -0x1a0(%rbp)
   8f6b1:      	movq	$0x0, -0x100(%rbp)
   8f6bc:      	jmp	0x8f6cd <toyos_crypto::mlkem::sample+0xed>
   8f6be:      	nop
   8f6c0:      	cmpq	$0x100, %r12            # imm = 0x100
   8f6c7:      	jae	0x8f765 <toyos_crypto::mlkem::sample+0x185>
   8f6cd:      	movl	$0xa8, %edx
   8f6d2:      	movq	%r15, %rdi
   8f6d5:      	movq	%r14, %rsi
   8f6d8:      	callq	0x99400 <<toyos_crypto::keccak::Sponge>::read>
   8f6dd:      	movl	$0x2, %eax
   8f6e2:      	jmp	0x8f6fc <toyos_crypto::mlkem::sample+0x11c>
   8f6e4:      	nopw	%cs:(%rax,%rax)
   8f6f0:      	addq	$0x3, %rax
   8f6f4:      	cmpq	$0xaa, %rax
   8f6fa:      	je	0x8f6c0 <toyos_crypto::mlkem::sample+0xe0>
   8f6fc:      	movzbl	-0x1a2(%rbp,%rax), %esi
   8f704:      	movzbl	-0x1a1(%rbp,%rax), %ecx
   8f70c:      	movl	%ecx, %edx
   8f70e:      	andl	$0xf, %edx
   8f711:      	shll	$0x8, %edx
   8f714:      	orl	%esi, %edx
   8f716:      	cmpl	$0xd00, %edx            # imm = 0xD00
   8f71c:      	ja	0x8f733 <toyos_crypto::mlkem::sample+0x153>
   8f71e:      	cmpq	$0x100, %r12            # imm = 0x100
   8f725:      	jae	0x8f733 <toyos_crypto::mlkem::sample+0x153>
   8f727:      	movw	%dx, -0x3a0(%rbp,%r12,2)
   8f730:      	incq	%r12
   8f733:      	movzbl	-0x1a0(%rbp,%rax), %edx
   8f73b:      	shrl	$0x4, %ecx
   8f73e:      	shll	$0x4, %edx
   8f741:      	orl	%ecx, %edx
   8f743:      	movzwl	%dx, %ecx
   8f746:      	cmpl	$0xd00, %ecx            # imm = 0xD00
   8f74c:      	ja	0x8f6f0 <toyos_crypto::mlkem::sample+0x110>
   8f74e:      	cmpq	$0xff, %r12
   8f755:      	ja	0x8f6f0 <toyos_crypto::mlkem::sample+0x110>
   8f757:      	movw	%dx, -0x3a0(%rbp,%r12,2)
   8f760:      	incq	%r12
   8f763:      	jmp	0x8f6f0 <toyos_crypto::mlkem::sample+0x110>
   8f765:      	leaq	-0x3a0(%rbp), %rsi
   8f76c:      	movl	$0x200, %edx            # imm = 0x200
   8f771:      	movq	%rbx, %rdi
   8f774:      	callq	0x10be00 <memcpy>
   8f779:      	movq	$0x0, -0xf8(%rbp)
   8f784:      	movq	$0x0, -0xf0(%rbp)
   8f78f:      	movq	$0x0, -0xe8(%rbp)
   8f79a:      	movq	$0x0, -0xe0(%rbp)
   8f7a5:      	movq	$0x0, -0xd8(%rbp)
   8f7b0:      	movq	$0x0, -0xd0(%rbp)
   8f7bb:      	movq	$0x0, -0xc8(%rbp)
   8f7c6:      	movq	$0x0, -0xc0(%rbp)
   8f7d1:      	movq	$0x0, -0xb8(%rbp)
   8f7dc:      	movq	$0x0, -0xb0(%rbp)
   8f7e7:      	movq	$0x0, -0xa8(%rbp)
   8f7f2:      	movq	$0x0, -0xa0(%rbp)
   8f7fd:      	movq	$0x0, -0x98(%rbp)
   8f808:      	movq	$0x0, -0x90(%rbp)
   8f813:      	movq	$0x0, -0x88(%rbp)
   8f81e:      	movq	$0x0, -0x80(%rbp)
   8f826:      	movq	$0x0, -0x78(%rbp)
   8f82e:      	movq	$0x0, -0x70(%rbp)
   8f836:      	movq	$0x0, -0x68(%rbp)
   8f83e:      	movq	$0x0, -0x60(%rbp)
   8f846:      	movq	$0x0, -0x58(%rbp)
   8f84e:      	movq	$0x0, -0x50(%rbp)
   8f856:      	movq	$0x0, -0x48(%rbp)
   8f85e:      	movq	$0x0, -0x40(%rbp)
   8f866:      	movq	$0x0, -0x38(%rbp)
   8f86e:      	movq	%rbx, %rax
   8f871:      	addq	$0x380, %rsp            # imm = 0x380
   8f878:      	popq	%rbx
   8f879:      	popq	%r12
   8f87b:      	popq	%r14
   8f87d:      	popq	%r15
   8f87f:      	popq	%rbp
   8f880:      	retq
   8f881:      	movq	%rax, %rbx
   8f884:      	xorl	%eax, %eax
   8f886:      	nopw	%cs:(%rax,%rax)
   8f890:      	movw	$0x0, -0x3a0(%rbp,%rax)
   8f89a:      	movw	$0x0, -0x39e(%rbp,%rax)
   8f8a4:      	movw	$0x0, -0x39c(%rbp,%rax)
   8f8ae:      	movw	$0x0, -0x39a(%rbp,%rax)
   8f8b8:      	movw	$0x0, -0x398(%rbp,%rax)
   8f8c2:      	movw	$0x0, -0x396(%rbp,%rax)
   8f8cc:      	movw	$0x0, -0x394(%rbp,%rax)
   8f8d6:      	movw	$0x0, -0x392(%rbp,%rax)
   8f8e0:      	addq	$0x10, %rax
   8f8e4:      	cmpq	$0x200, %rax            # imm = 0x200
   8f8ea:      	jne	0x8f890 <toyos_crypto::mlkem::sample+0x2b0>
   8f8ec:      	leaq	-0xf8(%rbp), %rdi
   8f8f3:      	callq	0x8fb20 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   8f8f8:      	movq	%rbx, %rdi
   8f8fb:      	callq	0x102010 <_Unwind_Resume>
   8f900:      	callq	0x1071ea <core::panicking::panic_in_cleanup>
   8f905:      	int3
   8f906:      	int3
   8f907:      	int3
   8f908:      	int3
   8f909:      	int3
   8f90a:      	int3
   8f90b:      	int3
   8f90c:      	int3
   8f90d:      	int3
   8f90e:      	int3
   8f90f:      	int3

000000000008fb20 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>:
   8fb20:      	pushq	%rbp
   8fb21:      	movq	%rsp, %rbp
   8fb24:      	movq	$0x0, (%rdi)
   8fb2b:      	movq	$0x0, 0x8(%rdi)
   8fb33:      	movq	$0x0, 0x10(%rdi)
   8fb3b:      	movq	$0x0, 0x18(%rdi)
   8fb43:      	movq	$0x0, 0x20(%rdi)
   8fb4b:      	movq	$0x0, 0x28(%rdi)
   8fb53:      	movq	$0x0, 0x30(%rdi)
   8fb5b:      	movq	$0x0, 0x38(%rdi)
   8fb63:      	movq	$0x0, 0x40(%rdi)
   8fb6b:      	movq	$0x0, 0x48(%rdi)
   8fb73:      	movq	$0x0, 0x50(%rdi)
   8fb7b:      	movq	$0x0, 0x58(%rdi)
   8fb83:      	movq	$0x0, 0x60(%rdi)
   8fb8b:      	movq	$0x0, 0x68(%rdi)
   8fb93:      	movq	$0x0, 0x70(%rdi)
   8fb9b:      	movq	$0x0, 0x78(%rdi)
   8fba3:      	movq	$0x0, 0x80(%rdi)
   8fbae:      	movq	$0x0, 0x88(%rdi)
   8fbb9:      	movq	$0x0, 0x90(%rdi)
   8fbc4:      	movq	$0x0, 0x98(%rdi)
   8fbcf:      	movq	$0x0, 0xa0(%rdi)
   8fbda:      	movq	$0x0, 0xa8(%rdi)
   8fbe5:      	movq	$0x0, 0xb0(%rdi)
   8fbf0:      	movq	$0x0, 0xb8(%rdi)
   8fbfb:      	movq	$0x0, 0xc0(%rdi)
   8fc06:      	popq	%rbp
   8fc07:      	retq
   8fc08:      	int3
   8fc09:      	int3
   8fc0a:      	int3
   8fc0b:      	int3
   8fc0c:      	int3
   8fc0d:      	int3
   8fc0e:      	int3
   8fc0f:      	int3

000000000008fed0 <<toyos_crypto::mlkem::Poly>::decode::<1>>:
   8fed0:      	pushq	%rbp
   8fed1:      	movq	%rsp, %rbp
   8fed4:      	pushq	%r15
   8fed6:      	pushq	%r14
   8fed8:      	pushq	%rbx
   8fed9:      	subq	$0x218, %rsp            # imm = 0x218
   8fee0:      	movq	%rdx, -0x230(%rbp)
   8fee7:      	cmpq	$0x20, %rdx
   8feeb:      	jne	0x9007b <<toyos_crypto::mlkem::Poly>::decode::<1>+0x1ab>
   8fef1:      	movq	%rsi, %r14
   8fef4:      	movq	%rdi, %rbx
   8fef7:      	leaq	-0x230(%rbp), %r15
   8fefe:      	movl	$0x200, %edx            # imm = 0x200
   8ff03:      	movq	%r15, %rdi
   8ff06:      	xorl	%esi, %esi
   8ff08:      	callq	0x10c330 <memset>
   8ff0d:      	leaq	-0x30(%rbp), %rdi
   8ff11:      	movq	%r15, %rsi
   8ff14:      	callq	0x108930 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   8ff19:      	testb	%al, %al
   8ff1b:      	je	0x90061 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x191>
   8ff21:      	leaq	0x20(%r14), %rdi
   8ff25:      	movq	%r14, %rsi
   8ff28:      	callq	0x108930 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   8ff2d:      	testb	%al, %al
   8ff2f:      	je	0x90061 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x191>
   8ff35:      	leaq	-0x30(%rbp), %rax
   8ff39:      	movq	%r14, %rcx
   8ff3c:      	subq	%rax, %rcx
   8ff3f:      	movq	%rax, %rdx
   8ff42:      	subq	%r14, %rdx
   8ff45:      	movl	$0xe, %esi
   8ff4a:      	xorps	%xmm0, %xmm0
   8ff4d:      	nopl	(%rax)
   8ff50:      	movaps	%xmm0, -0x30(%rbp)
   8ff54:      	cmpq	%rax, %r14
   8ff57:      	movq	%rcx, %rdi
   8ff5a:      	cmovbq	%rdx, %rdi
   8ff5e:      	testq	%rdi, %rdi
   8ff61:      	je	0x90047 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x177>
   8ff67:      	movzbl	(%r14), %edi
   8ff6b:      	movb	%dil, -0x30(%rbp)
   8ff6f:      	movzwl	-0x30(%rbp), %edi
   8ff73:      	movl	%edi, %r8d
   8ff76:      	andl	$0x1, %r8d
   8ff7a:      	movw	%r8w, -0x23e(%rbp,%rsi)
   8ff83:      	movl	%edi, %r8d
   8ff86:      	shrl	%r8d
   8ff89:      	andl	$0x1, %r8d
   8ff8d:      	movw	%r8w, -0x23c(%rbp,%rsi)
   8ff96:      	movl	%edi, %r8d
   8ff99:      	shrl	$0x2, %r8d
   8ff9d:      	andl	$0x1, %r8d
   8ffa1:      	movw	%r8w, -0x23a(%rbp,%rsi)
   8ffaa:      	movl	%edi, %r8d
   8ffad:      	shrl	$0x3, %r8d
   8ffb1:      	andl	$0x1, %r8d
   8ffb5:      	movw	%r8w, -0x238(%rbp,%rsi)
   8ffbe:      	movl	%edi, %r8d
   8ffc1:      	shrl	$0x4, %r8d
   8ffc5:      	andl	$0x1, %r8d
   8ffc9:      	movw	%r8w, -0x236(%rbp,%rsi)
   8ffd2:      	movl	%edi, %r8d
   8ffd5:      	shrl	$0x5, %r8d
   8ffd9:      	andl	$0x1, %r8d
   8ffdd:      	movw	%r8w, -0x234(%rbp,%rsi)
   8ffe6:      	movl	%edi, %r8d
   8ffe9:      	shrl	$0x6, %r8d
   8ffed:      	andl	$0x1, %r8d
   8fff1:      	movw	%r8w, -0x232(%rbp,%rsi)
   8fffa:      	shrl	$0x7, %edi
   8fffd:      	andl	$0x1, %edi
   90000:      	movw	%di, -0x230(%rbp,%rsi)
   90008:      	addq	$0x10, %rsi
   9000c:      	incq	%r14
   9000f:      	incq	%rcx
   90012:      	decq	%rdx
   90015:      	cmpq	$0x20e, %rsi            # imm = 0x20E
   9001c:      	jne	0x8ff50 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x80>
   90022:      	leaq	-0x230(%rbp), %rsi
   90029:      	movl	$0x200, %edx            # imm = 0x200
   9002e:      	movq	%rbx, %rdi
   90031:      	callq	0x10be00 <memcpy>
   90036:      	movq	%rbx, %rax
   90039:      	addq	$0x218, %rsp            # imm = 0x218
   90040:      	popq	%rbx
   90041:      	popq	%r14
   90043:      	popq	%r15
   90045:      	popq	%rbp
   90046:      	retq
   90047:      	leaq	-0x72e4e(%rip), %rdi    # 0x1d200 <anon.bc8b8ca25d94c626fb9e0c8789ac987b.5.llvm.14372351224960019845>
   9004e:      	leaq	0x7ff2b(%rip), %rcx     # 0x10ff80 <anon.bc8b8ca25d94c626fb9e0c8789ac987b.1.llvm.14372351224960019845>
   90055:      	movl	$0x237, %esi            # imm = 0x237
   9005a:      	xorl	%edx, %edx
   9005c:      	callq	0x107240 <core::panicking::panic_nounwind_fmt>
   90061:      	leaq	-0x737c8(%rip), %rdi    # 0x1c8a0 <anon.5391260ae5ca5c88418eb2dc579b1d1e.0.llvm.7938252219715782758>
   90068:      	leaq	0x7fbf1(%rip), %rcx     # 0x10fc60 <anon.5391260ae5ca5c88418eb2dc579b1d1e.2.llvm.7938252219715782758>
   9006f:      	movl	$0x193, %esi            # imm = 0x193
   90074:      	xorl	%edx, %edx
   90076:      	callq	0x107240 <core::panicking::panic_nounwind_fmt>
   9007b:      	leaq	-0x85992(%rip), %rdx    # 0xa6f0 <anon.304f3e18aaeeeb96385624560635dea3.1.llvm.1672722234689197564>
   90082:      	leaq	0x7fb8f(%rip), %r9      # 0x10fc18 <anon.304f3e18aaeeeb96385624560635dea3.2.llvm.1672722234689197564>
   90089:      	leaq	-0x230(%rbp), %rsi
   90090:      	xorl	%edi, %edi
   90092:      	xorl	%ecx, %ecx
   90094:      	callq	0x104337 <core::panicking::assert_failed::<usize, usize>>
   90099:      	callq	0x10735f <core::panicking::panic_cannot_unwind>
   9009e:      	callq	0x10735f <core::panicking::panic_cannot_unwind>
   900a3:      	int3
   900a4:      	int3
   900a5:      	int3
   900a6:      	int3
   900a7:      	int3
   900a8:      	int3
   900a9:      	int3
   900aa:      	int3
   900ab:      	int3
   900ac:      	int3
   900ad:      	int3
   900ae:      	int3
   900af:      	int3

00000000000900b0 <<toyos_crypto::mlkem::Poly>::decode::<12>>:
   900b0:      	pushq	%rbp
   900b1:      	movq	%rsp, %rbp
   900b4:      	pushq	%r15
   900b6:      	pushq	%r14
   900b8:      	pushq	%rbx
   900b9:      	subq	$0x218, %rsp            # imm = 0x218
   900c0:      	movq	%rdx, -0x230(%rbp)
   900c7:      	cmpq	$0x180, %rdx            # imm = 0x180
   900ce:      	jne	0x90285 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1d5>
   900d4:      	movq	%rsi, %r14
   900d7:      	movq	%rdi, %rbx
   900da:      	leaq	-0x230(%rbp), %r15
   900e1:      	movl	$0x200, %edx            # imm = 0x200
   900e6:      	movq	%r15, %rdi
   900e9:      	xorl	%esi, %esi
   900eb:      	callq	0x10c330 <memset>
   900f0:      	leaq	-0x30(%rbp), %rdi
   900f4:      	movq	%r15, %rsi
   900f7:      	callq	0x108930 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   900fc:      	testb	%al, %al
   900fe:      	je	0x9026b <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1bb>
   90104:      	leaq	0x180(%r14), %rdi
   9010b:      	movq	%r14, %rsi
   9010e:      	callq	0x108930 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   90113:      	testb	%al, %al
   90115:      	je	0x9026b <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1bb>
   9011b:      	leaq	-0x30(%rbp), %rax
   9011f:      	movq	%r14, %rcx
   90122:      	subq	%rax, %rcx
   90125:      	movq	%rax, %rdx
   90128:      	subq	%r14, %rdx
   9012b:      	movl	$0xe, %esi
   90130:      	xorps	%xmm0, %xmm0
   90133:      	nopw	%cs:(%rax,%rax)
   90140:      	movaps	%xmm0, -0x30(%rbp)
   90144:      	cmpq	%rax, %r14
   90147:      	movq	%rcx, %rdi
   9014a:      	cmovbq	%rdx, %rdi
   9014e:      	cmpq	$0xb, %rdi
   90152:      	jbe	0x90251 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1a1>
   90158:      	movq	(%r14), %r8
   9015b:      	movq	%r8, -0x30(%rbp)
   9015f:      	movl	0x8(%r14), %edi
   90163:      	movl	%edi, -0x28(%rbp)
   90166:      	movl	%r8d, %r9d
   90169:      	andl	$0xfff, %r9d            # imm = 0xFFF
   90170:      	movw	%r9w, -0x23e(%rbp,%rsi)
   90179:      	movl	%r8d, %r9d
   9017c:      	shrl	$0xc, %r9d
   90180:      	andl	$0xfff, %r9d            # imm = 0xFFF
   90187:      	movw	%r9w, -0x23c(%rbp,%rsi)
   90190:      	movzwl	-0x2d(%rbp), %r9d
   90195:      	andl	$0xfff, %r9d            # imm = 0xFFF
   9019c:      	movw	%r9w, -0x23a(%rbp,%rsi)
   901a5:      	movq	%r8, %r9
   901a8:      	shrq	$0x24, %r9
   901ac:      	andl	$0xfff, %r9d            # imm = 0xFFF
   901b3:      	movw	%r9w, -0x238(%rbp,%rsi)
   901bc:      	movzwl	-0x2a(%rbp), %r9d
   901c1:      	andl	$0xfff, %r9d            # imm = 0xFFF
   901c8:      	movw	%r9w, -0x236(%rbp,%rsi)
   901d1:      	movl	%edi, %r9d
   901d4:      	shll	$0x4, %r9d
   901d8:      	shrq	$0x3c, %r8
   901dc:      	orl	%r9d, %r8d
   901df:      	andl	$0xfff, %r8d            # imm = 0xFFF
   901e6:      	movw	%r8w, -0x234(%rbp,%rsi)
   901ef:      	movzwl	-0x27(%rbp), %r8d
   901f4:      	andl	$0xfff, %r8d            # imm = 0xFFF
   901fb:      	movw	%r8w, -0x232(%rbp,%rsi)
   90204:      	shrl	$0x14, %edi
   90207:      	movw	%di, -0x230(%rbp,%rsi)
   9020f:      	addq	$0x10, %rsi
   90213:      	addq	$0xc, %r14
   90217:      	addq	$0xc, %rcx
   9021b:      	addq	$-0xc, %rdx
   9021f:      	cmpq	$0x20e, %rsi            # imm = 0x20E
   90226:      	jne	0x90140 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x90>
   9022c:      	leaq	-0x230(%rbp), %rsi
   90233:      	movl	$0x200, %edx            # imm = 0x200
   90238:      	movq	%rbx, %rdi
   9023b:      	callq	0x10be00 <memcpy>
   90240:      	movq	%rbx, %rax
   90243:      	addq	$0x218, %rsp            # imm = 0x218
   9024a:      	popq	%rbx
   9024b:      	popq	%r14
   9024d:      	popq	%r15
   9024f:      	popq	%rbp
   90250:      	retq
   90251:      	leaq	-0x73058(%rip), %rdi    # 0x1d200 <anon.bc8b8ca25d94c626fb9e0c8789ac987b.5.llvm.14372351224960019845>
   90258:      	leaq	0x7fd21(%rip), %rcx     # 0x10ff80 <anon.bc8b8ca25d94c626fb9e0c8789ac987b.1.llvm.14372351224960019845>
   9025f:      	movl	$0x237, %esi            # imm = 0x237
   90264:      	xorl	%edx, %edx
   90266:      	callq	0x107240 <core::panicking::panic_nounwind_fmt>
   9026b:      	leaq	-0x739d2(%rip), %rdi    # 0x1c8a0 <anon.5391260ae5ca5c88418eb2dc579b1d1e.0.llvm.7938252219715782758>
   90272:      	leaq	0x7f9e7(%rip), %rcx     # 0x10fc60 <anon.5391260ae5ca5c88418eb2dc579b1d1e.2.llvm.7938252219715782758>
   90279:      	movl	$0x193, %esi            # imm = 0x193
   9027e:      	xorl	%edx, %edx
   90280:      	callq	0x107240 <core::panicking::panic_nounwind_fmt>
   90285:      	leaq	-0x85b44(%rip), %rdx    # 0xa748 <anon.304f3e18aaeeeb96385624560635dea3.6.llvm.1672722234689197564>
   9028c:      	leaq	0x7f985(%rip), %r9      # 0x10fc18 <anon.304f3e18aaeeeb96385624560635dea3.2.llvm.1672722234689197564>
   90293:      	leaq	-0x230(%rbp), %rsi
   9029a:      	xorl	%edi, %edi
   9029c:      	xorl	%ecx, %ecx
   9029e:      	callq	0x104337 <core::panicking::assert_failed::<usize, usize>>
   902a3:      	callq	0x10735f <core::panicking::panic_cannot_unwind>
   902a8:      	callq	0x10735f <core::panicking::panic_cannot_unwind>
   902ad:      	int3
   902ae:      	int3
   902af:      	int3

00000000000902b0 <<toyos_crypto::mlkem::Poly>::encode::<4>>:
   902b0:      	pushq	%rbp
   902b1:      	movq	%rsp, %rbp
   902b4:      	pushq	%r14
   902b6:      	pushq	%rbx
   902b7:      	subq	$0x10, %rsp
   902bb:      	movq	%rdx, -0x20(%rbp)
   902bf:      	cmpq	$0x80, %rdx
   902c6:      	jne	0x903f6 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x146>
   902cc:      	movq	%rsi, %rbx
   902cf:      	movq	%rdi, %r14
   902d2:      	addq	$0x200, %rdi            # imm = 0x200
   902d9:      	movq	%r14, %rsi
   902dc:      	callq	0x108930 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   902e1:      	testb	%al, %al
   902e3:      	je	0x903dc <<toyos_crypto::mlkem::Poly>::encode::<4>+0x12c>
   902e9:      	leaq	0x80(%rbx), %rdi
   902f0:      	movq	%rbx, %rsi
   902f3:      	callq	0x108930 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   902f8:      	testb	%al, %al
   902fa:      	je	0x903dc <<toyos_crypto::mlkem::Poly>::encode::<4>+0x12c>
   90300:      	leaq	-0x20(%rbp), %rax
   90304:      	movq	%rax, %rcx
   90307:      	subq	%rbx, %rcx
   9030a:      	movq	%rbx, %rdx
   9030d:      	subq	%rax, %rdx
   90310:      	xorl	%esi, %esi
   90312:      	nopw	%cs:(%rax,%rax)
   90320:      	leaq	(%rbx,%rsi), %rdi
   90324:      	movzwl	(%r14,%rsi,4), %r8d
   90329:      	movzwl	0x2(%r14,%rsi,4), %r9d
   9032f:      	shll	$0x4, %r9d
   90333:      	orq	%r8, %r9
   90336:      	movzwl	0x4(%r14,%rsi,4), %r8d
   9033c:      	shll	$0x8, %r8d
   90340:      	movzwl	0x6(%r14,%rsi,4), %r10d
   90346:      	shll	$0xc, %r10d
   9034a:      	orq	%r8, %r10
   9034d:      	orq	%r9, %r10
   90350:      	movzwl	0x8(%r14,%rsi,4), %r8d
   90356:      	shll	$0x10, %r8d
   9035a:      	movzwl	0xa(%r14,%rsi,4), %r9d
   90360:      	shlq	$0x14, %r9
   90364:      	orq	%r8, %r9
   90367:      	movzwl	0xc(%r14,%rsi,4), %r11d
   9036d:      	shlq	$0x18, %r11
   90371:      	orq	%r9, %r11
   90374:      	orq	%r10, %r11
   90377:      	movzwl	0xe(%r14,%rsi,4), %r8d
   9037d:      	shlq	$0x1c, %r8
   90381:      	orq	%r11, %r8
   90384:      	movq	%r8, -0x20(%rbp)
   90388:      	movq	$0x0, -0x18(%rbp)
   90390:      	leaq	(%rdx,%rsi), %r9
   90394:      	cmpq	%rdi, %rax
   90397:      	cmovaeq	%rcx, %r9
   9039b:      	cmpq	$0x3, %r9
   9039f:      	jbe	0x903c2 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x112>
   903a1:      	movl	%r8d, (%rdi)
   903a4:      	addq	$0x4, %rsi
   903a8:      	addq	$-0x4, %rcx
   903ac:      	cmpq	$0x80, %rsi
   903b3:      	jne	0x90320 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x70>
   903b9:      	addq	$0x10, %rsp
   903bd:      	popq	%rbx
   903be:      	popq	%r14
   903c0:      	popq	%rbp
   903c1:      	retq
   903c2:      	leaq	-0x731c9(%rip), %rdi    # 0x1d200 <anon.bc8b8ca25d94c626fb9e0c8789ac987b.5.llvm.14372351224960019845>
   903c9:      	leaq	0x7fbb0(%rip), %rcx     # 0x10ff80 <anon.bc8b8ca25d94c626fb9e0c8789ac987b.1.llvm.14372351224960019845>
   903d0:      	movl	$0x237, %esi            # imm = 0x237
   903d5:      	xorl	%edx, %edx
   903d7:      	callq	0x107240 <core::panicking::panic_nounwind_fmt>
   903dc:      	leaq	-0x73b43(%rip), %rdi    # 0x1c8a0 <anon.5391260ae5ca5c88418eb2dc579b1d1e.0.llvm.7938252219715782758>
   903e3:      	leaq	0x7f876(%rip), %rcx     # 0x10fc60 <anon.5391260ae5ca5c88418eb2dc579b1d1e.2.llvm.7938252219715782758>
   903ea:      	movl	$0x193, %esi            # imm = 0x193
   903ef:      	xorl	%edx, %edx
   903f1:      	callq	0x107240 <core::panicking::panic_nounwind_fmt>
   903f6:      	leaq	-0x85c9d(%rip), %rdx    # 0xa760 <anon.304f3e18aaeeeb96385624560635dea3.4.llvm.1672722234689197564>
   903fd:      	leaq	0x7f82c(%rip), %r9      # 0x10fc30 <anon.304f3e18aaeeeb96385624560635dea3.7.llvm.1672722234689197564>
   90404:      	leaq	-0x20(%rbp), %rsi
   90408:      	xorl	%edi, %edi
   9040a:      	xorl	%ecx, %ecx
   9040c:      	callq	0x104337 <core::panicking::assert_failed::<usize, usize>>
   90411:      	callq	0x10735f <core::panicking::panic_cannot_unwind>
   90416:      	callq	0x10735f <core::panicking::panic_cannot_unwind>
   9041b:      	int3
   9041c:      	int3
   9041d:      	int3
   9041e:      	int3
   9041f:      	int3

0000000000090420 <<toyos_crypto::mlkem::Poly>::encode::<10>>:
   90420:      	pushq	%rbp
   90421:      	movq	%rsp, %rbp
   90424:      	pushq	%r14
   90426:      	pushq	%rbx
   90427:      	subq	$0x10, %rsp
   9042b:      	movq	%rdx, -0x20(%rbp)
   9042f:      	cmpq	$0x140, %rdx            # imm = 0x140
   90436:      	jne	0x90581 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x161>
   9043c:      	movq	%rsi, %rbx
   9043f:      	movq	%rdi, %r14
   90442:      	addq	$0x200, %rdi            # imm = 0x200
   90449:      	movq	%r14, %rsi
   9044c:      	callq	0x108930 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   90451:      	testb	%al, %al
   90453:      	je	0x90567 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x147>
   90459:      	leaq	0x140(%rbx), %rdi
   90460:      	movq	%rbx, %rsi
   90463:      	callq	0x108930 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   90468:      	testb	%al, %al
   9046a:      	je	0x90567 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x147>
   90470:      	leaq	-0x20(%rbp), %rax
   90474:      	movq	%rax, %rcx
   90477:      	subq	%rbx, %rcx
   9047a:      	movq	%rbx, %rdx
   9047d:      	subq	%rax, %rdx
   90480:      	xorl	%esi, %esi
   90482:      	nopw	%cs:(%rax,%rax)
   90490:      	movzwl	(%r14,%rsi), %edi
   90495:      	movzwl	0x2(%r14,%rsi), %r8d
   9049b:      	shll	$0xa, %r8d
   9049f:      	orq	%rdi, %r8
   904a2:      	movzwl	0x4(%r14,%rsi), %r9d
   904a8:      	shlq	$0x14, %r9
   904ac:      	movzwl	0x6(%r14,%rsi), %edi
   904b2:      	shlq	$0x1e, %rdi
   904b6:      	orq	%r9, %rdi
   904b9:      	orq	%r8, %rdi
   904bc:      	movzwl	0x8(%r14,%rsi), %r8d
   904c2:      	shlq	$0x28, %r8
   904c6:      	movzwl	0xa(%r14,%rsi), %r9d
   904cc:      	movl	%r9d, %r10d
   904cf:      	shrl	$0xe, %r10d
   904d3:      	shlq	$0x32, %r9
   904d7:      	orq	%r8, %r9
   904da:      	movzwl	0xc(%r14,%rsi), %r8d
   904e0:      	movl	%r8d, %r11d
   904e3:      	shrl	$0x4, %r11d
   904e7:      	orl	%r10d, %r11d
   904ea:      	shlq	$0x3c, %r8
   904ee:      	orq	%r9, %r8
   904f1:      	orq	%rdi, %r8
   904f4:      	movzwl	0xe(%r14,%rsi), %edi
   904fa:      	shll	$0x6, %edi
   904fd:      	orl	%r11d, %edi
   90500:      	movq	%rdi, -0x18(%rbp)
   90504:      	movq	%r8, -0x20(%rbp)
   90508:      	cmpq	%rbx, %rax
   9050b:      	movq	%rcx, %rdi
   9050e:      	cmovbq	%rdx, %rdi
   90512:      	cmpq	$0x9, %rdi
   90516:      	jbe	0x9054d <<toyos_crypto::mlkem::Poly>::encode::<10>+0x12d>
   90518:      	movzwl	-0x18(%rbp), %edi
   9051c:      	movw	%di, 0x8(%rbx)
   90520:      	movq	-0x20(%rbp), %rdi
   90524:      	movq	%rdi, (%rbx)
   90527:      	addq	$0x10, %rsi
   9052b:      	addq	$0xa, %rbx
   9052f:      	addq	$-0xa, %rcx
   90533:      	addq	$0xa, %rdx
   90537:      	cmpq	$0x200, %rsi            # imm = 0x200
   9053e:      	jne	0x90490 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x70>
   90544:      	addq	$0x10, %rsp
   90548:      	popq	%rbx
   90549:      	popq	%r14
   9054b:      	popq	%rbp
   9054c:      	retq
   9054d:      	leaq	-0x73354(%rip), %rdi    # 0x1d200 <anon.bc8b8ca25d94c626fb9e0c8789ac987b.5.llvm.14372351224960019845>
   90554:      	leaq	0x7fa25(%rip), %rcx     # 0x10ff80 <anon.bc8b8ca25d94c626fb9e0c8789ac987b.1.llvm.14372351224960019845>
   9055b:      	movl	$0x237, %esi            # imm = 0x237
   90560:      	xorl	%edx, %edx
   90562:      	callq	0x107240 <core::panicking::panic_nounwind_fmt>
   90567:      	leaq	-0x73cce(%rip), %rdi    # 0x1c8a0 <anon.5391260ae5ca5c88418eb2dc579b1d1e.0.llvm.7938252219715782758>
   9056e:      	leaq	0x7f6eb(%rip), %rcx     # 0x10fc60 <anon.5391260ae5ca5c88418eb2dc579b1d1e.2.llvm.7938252219715782758>
   90575:      	movl	$0x193, %esi            # imm = 0x193
   9057a:      	xorl	%edx, %edx
   9057c:      	callq	0x107240 <core::panicking::panic_nounwind_fmt>
   90581:      	leaq	-0x85e80(%rip), %rdx    # 0xa708 <anon.304f3e18aaeeeb96385624560635dea3.5.llvm.1672722234689197564>
   90588:      	leaq	0x7f6a1(%rip), %r9      # 0x10fc30 <anon.304f3e18aaeeeb96385624560635dea3.7.llvm.1672722234689197564>
   9058f:      	leaq	-0x20(%rbp), %rsi
   90593:      	xorl	%edi, %edi
   90595:      	xorl	%ecx, %ecx
   90597:      	callq	0x104337 <core::panicking::assert_failed::<usize, usize>>
   9059c:      	callq	0x10735f <core::panicking::panic_cannot_unwind>
   905a1:      	callq	0x10735f <core::panicking::panic_cannot_unwind>
   905a6:      	int3
   905a7:      	int3
   905a8:      	int3
   905a9:      	int3
   905aa:      	int3
   905ab:      	int3
   905ac:      	int3
   905ad:      	int3
   905ae:      	int3
   905af:      	int3

0000000000099020 <<toyos_crypto::keccak::Sponge>::new>:
   99020:      	pushq	%rbp
   99021:      	movq	%rsp, %rbp
   99024:      	pushq	%r15
   99026:      	pushq	%r14
   99028:      	pushq	%r13
   9902a:      	pushq	%r12
   9902c:      	pushq	%rbx
   9902d:      	subq	$0x108, %rsp            # imm = 0x108
   99034:      	movq	%rcx, %r12
   99037:      	movq	%rdi, %r14
   9903a:      	cmpq	$0x48, %rsi
   9903e:      	je	0x99056 <<toyos_crypto::keccak::Sponge>::new+0x36>
   99040:      	cmpq	$0x88, %rsi
   99047:      	je	0x99056 <<toyos_crypto::keccak::Sponge>::new+0x36>
   99049:      	cmpq	$0xa8, %rsi
   99050:      	jne	0x992d0 <<toyos_crypto::keccak::Sponge>::new+0x2b0>
   99056:      	xorps	%xmm0, %xmm0
   99059:      	movaps	%xmm0, -0x80(%rbp)
   9905d:      	movaps	%xmm0, -0x90(%rbp)
   99064:      	movaps	%xmm0, -0xa0(%rbp)
   9906b:      	movaps	%xmm0, -0xb0(%rbp)
   99072:      	movaps	%xmm0, -0xc0(%rbp)
   99079:      	movaps	%xmm0, -0xd0(%rbp)
   99080:      	movaps	%xmm0, -0xe0(%rbp)
   99087:      	movaps	%xmm0, -0xf0(%rbp)
   9908e:      	movaps	%xmm0, -0x100(%rbp)
   99095:      	movaps	%xmm0, -0x110(%rbp)
   9909c:      	movaps	%xmm0, -0x120(%rbp)
   990a3:      	movaps	%xmm0, -0x130(%rbp)
   990aa:      	movq	$0x0, -0x70(%rbp)
   990b2:      	movq	%rsi, -0x68(%rbp)
   990b6:      	movq	$0x0, -0x60(%rbp)
   990be:      	testq	%r8, %r8
   990c1:      	je	0x99218 <<toyos_crypto::keccak::Sponge>::new+0x1f8>
   990c7:      	movl	%edx, -0x2c(%rbp)
   990ca:      	movq	%rsi, -0x40(%rbp)
   990ce:      	movq	%r14, -0x48(%rbp)
   990d2:      	shlq	$0x4, %r8
   990d6:      	addq	%r12, %r8
   990d9:      	movq	%r8, -0x50(%rbp)
   990dd:      	xorl	%ecx, %ecx
   990df:      	leaq	-0x130(%rbp), %r15
   990e6:      	leaq	0x76dd3(%rip), %rax     # 0x10fec0 <anon.68c3b30278565fbd7c0b87acd371f0b5.7.llvm.7827812676742230592+0x60>
   990ed:      	movq	%rax, -0x38(%rbp)
   990f1:      	jmp	0x9910e <<toyos_crypto::keccak::Sponge>::new+0xee>
   990f3:      	nopw	%cs:(%rax,%rax)
   99100:      	addq	$0x10, %r12
   99104:      	cmpq	-0x50(%rbp), %r12
   99108:      	je	0x991c9 <<toyos_crypto::keccak::Sponge>::new+0x1a9>
   9910e:      	movq	0x8(%r12), %rdx
   99113:      	testq	%rdx, %rdx
   99116:      	je	0x99100 <<toyos_crypto::keccak::Sponge>::new+0xe0>
   99118:      	movq	(%r12), %r14
   9911c:      	jmp	0x9912b <<toyos_crypto::keccak::Sponge>::new+0x10b>
   9911e:      	nop
   99120:      	addq	%rbx, %r14
   99123:      	movq	%r13, %rdx
   99126:      	testq	%r13, %r13
   99129:      	je	0x99100 <<toyos_crypto::keccak::Sponge>::new+0xe0>
   9912b:      	testb	$0x7, %cl
   9912e:      	jne	0x99160 <<toyos_crypto::keccak::Sponge>::new+0x140>
   99130:      	cmpq	$0x8, %rdx
   99134:      	jb	0x99160 <<toyos_crypto::keccak::Sponge>::new+0x140>
   99136:      	cmpq	$0xc7, %rcx
   9913d:      	ja	0x992a0 <<toyos_crypto::keccak::Sponge>::new+0x280>
   99143:      	movq	(%r14), %rax
   99146:      	xorq	%rax, -0x130(%rbp,%rcx)
   9914e:      	movl	$0x8, %ebx
   99153:      	jmp	0x9918b <<toyos_crypto::keccak::Sponge>::new+0x16b>
   99155:      	nopw	%cs:(%rax,%rax)
   99160:      	movq	%rcx, %rdi
   99163:      	shrq	$0x3, %rdi
   99167:      	cmpq	$0xc7, %rcx
   9916e:      	ja	0x992b2 <<toyos_crypto::keccak::Sponge>::new+0x292>
   99174:      	movzbl	(%r14), %eax
   99178:      	shll	$0x3, %ecx
   9917b:      	shlq	%cl, %rax
   9917e:      	xorq	%rax, -0x130(%rbp,%rdi,8)
   99186:      	movl	$0x1, %ebx
   9918b:      	movq	%rdx, %r13
   9918e:      	subq	%rbx, %r13
   99191:      	jb	0x9927e <<toyos_crypto::keccak::Sponge>::new+0x25e>
   99197:      	movq	-0x60(%rbp), %rcx
   9919b:      	addq	%rbx, %rcx
   9919e:      	jb	0x99292 <<toyos_crypto::keccak::Sponge>::new+0x272>
   991a4:      	movq	%rcx, -0x60(%rbp)
   991a8:      	cmpq	-0x68(%rbp), %rcx
   991ac:      	jne	0x99120 <<toyos_crypto::keccak::Sponge>::new+0x100>
   991b2:      	movq	%r15, %rdi
   991b5:      	callq	0x99890 <toyos_crypto::keccak::permute (.llvm.7827812676742230592)>
   991ba:      	movq	$0x0, -0x60(%rbp)
   991c2:      	xorl	%ecx, %ecx
   991c4:      	jmp	0x99120 <<toyos_crypto::keccak::Sponge>::new+0x100>
   991c9:      	movq	%rcx, %rdi
   991cc:      	shrq	$0x3, %rdi
   991d0:      	cmpq	$0xc7, %rcx
   991d7:      	ja	0x992b2 <<toyos_crypto::keccak::Sponge>::new+0x292>
   991dd:      	shll	$0x3, %ecx
   991e0:      	movzbl	-0x2c(%rbp), %eax
   991e4:      	shlq	%cl, %rax
   991e7:      	xorq	%rax, -0x130(%rbp,%rdi,8)
   991ef:      	movq	-0x40(%rbp), %rax
   991f3:      	testq	%rax, %rax
   991f6:      	movq	-0x48(%rbp), %r14
   991fa:      	je	0x992c2 <<toyos_crypto::keccak::Sponge>::new+0x2a2>
   99200:      	leaq	-0x1(%rax), %rcx
   99204:      	movq	%rcx, %rdi
   99207:      	shrq	$0x3, %rdi
   9920b:      	cmpq	$0xc9, %rax
   99211:      	jb	0x9922f <<toyos_crypto::keccak::Sponge>::new+0x20f>
   99213:      	jmp	0x992b2 <<toyos_crypto::keccak::Sponge>::new+0x292>
   99218:      	movzbl	%dl, %eax
   9921b:      	movq	%rax, -0x130(%rbp)
   99222:      	decq	%rsi
   99225:      	movq	%rsi, %rdi
   99228:      	shrq	$0x3, %rdi
   9922c:      	movq	%rsi, %rcx
   9922f:      	shll	$0x3, %ecx
   99232:      	movl	$0x80, %eax
   99237:      	shlq	%cl, %rax
   9923a:      	xorq	%rax, -0x130(%rbp,%rdi,8)
   99242:      	leaq	-0x130(%rbp), %rbx
   99249:      	movq	%rbx, %rdi
   9924c:      	callq	0x99890 <toyos_crypto::keccak::permute (.llvm.7827812676742230592)>
   99251:      	movq	$0x0, -0x60(%rbp)
   99259:      	movl	$0xd8, %edx
   9925e:      	movq	%r14, %rdi
   99261:      	movq	%rbx, %rsi
   99264:      	callq	0x10be00 <memcpy>
   99269:      	movq	%r14, %rax
   9926c:      	addq	$0x108, %rsp            # imm = 0x108
   99273:      	popq	%rbx
   99274:      	popq	%r12
   99276:      	popq	%r13
   99278:      	popq	%r14
   9927a:      	popq	%r15
   9927c:      	popq	%rbp
   9927d:      	retq
   9927e:      	leaq	0x76c0b(%rip), %rcx     # 0x10fe90 <anon.68c3b30278565fbd7c0b87acd371f0b5.7.llvm.7827812676742230592+0x30>
   99285:      	movq	%rbx, %rdi
   99288:      	movq	%rdx, %rsi
   9928b:      	callq	0x107cd0 <core::slice::index::slice_index_fail>
   99290:      	jmp	0x992ce <<toyos_crypto::keccak::Sponge>::new+0x2ae>
   99292:      	leaq	0x76c0f(%rip), %rdi     # 0x10fea8 <anon.68c3b30278565fbd7c0b87acd371f0b5.7.llvm.7827812676742230592+0x48>
   99299:      	callq	0x107fd0 <core::panicking::panic_const::panic_const_add_overflow>
   9929e:      	jmp	0x992ce <<toyos_crypto::keccak::Sponge>::new+0x2ae>
   992a0:      	shrq	$0x3, %rcx
   992a4:      	leaq	0x76bcd(%rip), %rax     # 0x10fe78 <anon.68c3b30278565fbd7c0b87acd371f0b5.7.llvm.7827812676742230592+0x18>
   992ab:      	movq	%rax, -0x38(%rbp)
   992af:      	movq	%rcx, %rdi
   992b2:      	movl	$0x19, %esi
   992b7:      	movq	-0x38(%rbp), %rdx
   992bb:      	callq	0x1071fd <core::panicking::panic_bounds_check>
   992c0:      	jmp	0x992ce <<toyos_crypto::keccak::Sponge>::new+0x2ae>
   992c2:      	leaq	0x76b4f(%rip), %rdi     # 0x10fe18 <anon.18dec02eb37b3d6a6a16fd3f8c2fbb91.4.llvm.14221192674057841295+0x120>
   992c9:      	callq	0x108030 <core::panicking::panic_const::panic_const_sub_overflow>
   992ce:      	ud2
   992d0:      	leaq	-0x7c25e(%rip), %rdi    # 0x1d079 <anon.68c3b30278565fbd7c0b87acd371f0b5.1.llvm.7827812676742230592+0x9>
   992d7:      	leaq	0x76b22(%rip), %rdx     # 0x10fe00 <anon.18dec02eb37b3d6a6a16fd3f8c2fbb91.4.llvm.14221192674057841295+0x108>
   992de:      	movl	$0x30, %esi
   992e3:      	callq	0x1073e0 <core::panicking::panic>
   992e8:      	movq	$0x0, -0x130(%rbp)
   992f3:      	movq	$0x0, -0x128(%rbp)
   992fe:      	movq	$0x0, -0x120(%rbp)
   99309:      	movq	$0x0, -0x118(%rbp)
   99314:      	movq	$0x0, -0x110(%rbp)
   9931f:      	movq	$0x0, -0x108(%rbp)
   9932a:      	movq	$0x0, -0x100(%rbp)
   99335:      	movq	$0x0, -0xf8(%rbp)
   99340:      	movq	$0x0, -0xf0(%rbp)
   9934b:      	movq	$0x0, -0xe8(%rbp)
   99356:      	movq	$0x0, -0xe0(%rbp)
   99361:      	movq	$0x0, -0xd8(%rbp)
   9936c:      	movq	$0x0, -0xd0(%rbp)
   99377:      	movq	$0x0, -0xc8(%rbp)
   99382:      	movq	$0x0, -0xc0(%rbp)
   9938d:      	movq	$0x0, -0xb8(%rbp)
   99398:      	movq	$0x0, -0xb0(%rbp)
   993a3:      	movq	$0x0, -0xa8(%rbp)
   993ae:      	movq	$0x0, -0xa0(%rbp)
   993b9:      	movq	$0x0, -0x98(%rbp)
   993c4:      	movq	$0x0, -0x90(%rbp)
   993cf:      	movq	$0x0, -0x88(%rbp)
   993da:      	movq	$0x0, -0x80(%rbp)
   993e2:      	movq	$0x0, -0x78(%rbp)
   993ea:      	movq	$0x0, -0x70(%rbp)
   993f2:      	movq	%rax, %rdi
   993f5:      	callq	0x102010 <_Unwind_Resume>
   993fa:      	int3
   993fb:      	int3
   993fc:      	int3
   993fd:      	int3
   993fe:      	int3
   993ff:      	int3

0000000000099400 <<toyos_crypto::keccak::Sponge>::read>:
   99400:      	pushq	%rbp
   99401:      	movq	%rsp, %rbp
   99404:      	pushq	%r15
   99406:      	pushq	%r14
   99408:      	pushq	%r13
   9940a:      	pushq	%r12
   9940c:      	pushq	%rbx
   9940d:      	subq	$0x18, %rsp
   99411:      	testq	%rdx, %rdx
   99414:      	je	0x994e7 <<toyos_crypto::keccak::Sponge>::read+0xe7>
   9941a:      	movq	%rdx, %rbx
   9941d:      	movq	%rsi, %r15
   99420:      	movq	%rdi, %rcx
   99423:      	movq	0xd0(%rdi), %r13
   9942a:      	movq	%rdi, -0x30(%rbp)
   9942e:      	nop
   99430:      	cmpq	0xc8(%rcx), %r13
   99437:      	jne	0x99453 <<toyos_crypto::keccak::Sponge>::read+0x53>
   99439:      	movq	%rcx, %rdi
   9943c:      	callq	0x99890 <toyos_crypto::keccak::permute (.llvm.7827812676742230592)>
   99441:      	movq	-0x30(%rbp), %rcx
   99445:      	movq	$0x0, 0xd0(%rcx)
   99450:      	xorl	%r13d, %r13d
   99453:      	movq	%r13, %rdi
   99456:      	andq	$0x7, %rdi
   9945a:      	movl	$0x1, %r12d
   99460:      	movl	$0x8, %eax
   99465:      	cmoveq	%rax, %r12
   99469:      	cmpq	$0x8, %rbx
   9946d:      	movl	$0x1, %eax
   99472:      	cmovbq	%rax, %r12
   99476:      	movq	%r13, %rax
   99479:      	shrq	$0x3, %rax
   9947d:      	cmpq	$0xc7, %r13
   99484:      	ja	0x99539 <<toyos_crypto::keccak::Sponge>::read+0x139>
   9948a:      	movq	(%rcx,%rax,8), %rax
   9948e:      	movq	%rax, -0x38(%rbp)
   99492:      	cmpq	%r12, %rbx
   99495:      	jb	0x99507 <<toyos_crypto::keccak::Sponge>::read+0x107>
   99497:      	leaq	(%r12,%rdi), %rsi
   9949b:      	cmpq	$0x9, %rsi
   9949f:      	jae	0x994f6 <<toyos_crypto::keccak::Sponge>::read+0xf6>
   994a1:      	leaq	(%rdi,%rbp), %rsi
   994a5:      	addq	$-0x38, %rsi
   994a9:      	movq	%rsi, %rax
   994ac:      	subq	%r15, %rax
   994af:      	movq	%r15, %rcx
   994b2:      	subq	%rsi, %rcx
   994b5:      	cmovbq	%rax, %rcx
   994b9:      	cmpq	%r12, %rcx
   994bc:      	jb	0x9951f <<toyos_crypto::keccak::Sponge>::read+0x11f>
   994be:      	leaq	(%r15,%r12), %r14
   994c2:      	movq	%r15, %rdi
   994c5:      	movq	%r12, %rdx
   994c8:      	callq	0x10be00 <memcpy>
   994cd:      	movq	-0x30(%rbp), %rcx
   994d1:      	addq	%r12, %r13
   994d4:      	movq	%r13, 0xd0(%rcx)
   994db:      	movq	%r14, %r15
   994de:      	subq	%r12, %rbx
   994e1:      	jne	0x99430 <<toyos_crypto::keccak::Sponge>::read+0x30>
   994e7:      	addq	$0x18, %rsp
   994eb:      	popq	%rbx
   994ec:      	popq	%r12
   994ee:      	popq	%r13
   994f0:      	popq	%r14
   994f2:      	popq	%r15
   994f4:      	popq	%rbp
   994f5:      	retq
   994f6:      	leaq	0x76963(%rip), %rcx     # 0x10fe60 <anon.68c3b30278565fbd7c0b87acd371f0b5.7.llvm.7827812676742230592>
   994fd:      	movl	$0x8, %edx
   99502:      	callq	0x107cd0 <core::slice::index::slice_index_fail>
   99507:      	leaq	-0x7c49e(%rip), %rdi    # 0x1d070 <anon.68c3b30278565fbd7c0b87acd371f0b5.1.llvm.7827812676742230592>
   9950e:      	leaq	0x76933(%rip), %rdx     # 0x10fe48 <anon.68c3b30278565fbd7c0b87acd371f0b5.6.llvm.7827812676742230592>
   99515:      	movl	$0x13, %esi
   9951a:      	callq	0x107400 <core::panicking::panic_fmt>
   9951f:      	leaq	-0x7c326(%rip), %rdi    # 0x1d200 <anon.bc8b8ca25d94c626fb9e0c8789ac987b.5.llvm.14372351224960019845>
   99526:      	leaq	0x76a53(%rip), %rcx     # 0x10ff80 <anon.bc8b8ca25d94c626fb9e0c8789ac987b.1.llvm.14372351224960019845>
   9952d:      	movl	$0x237, %esi            # imm = 0x237
   99532:      	xorl	%edx, %edx
   99534:      	callq	0x107240 <core::panicking::panic_nounwind_fmt>
   99539:      	leaq	0x768f0(%rip), %rdx     # 0x10fe30 <anon.68c3b30278565fbd7c0b87acd371f0b5.5.llvm.7827812676742230592>
   99540:      	movl	$0x19, %esi
   99545:      	movq	%rax, %rdi
   99548:      	callq	0x1071fd <core::panicking::panic_bounds_check>
   9954d:      	int3
   9954e:      	int3
   9954f:      	int3

0000000000099550 <toyos_crypto::keccak::g>:
   99550:      	pushq	%rbp
   99551:      	movq	%rsp, %rbp
   99554:      	pushq	%r14
   99556:      	pushq	%rbx
   99557:      	subq	$0x120, %rsp            # imm = 0x120
   9955e:      	movq	%rdx, %r8
   99561:      	movq	%rsi, %rcx
   99564:      	movq	%rdi, %rbx
   99567:      	xorps	%xmm0, %xmm0
   9956a:      	movaps	%xmm0, -0x20(%rbp)
   9956e:      	movaps	%xmm0, -0x30(%rbp)
   99572:      	movaps	%xmm0, -0x40(%rbp)
   99576:      	movaps	%xmm0, -0x50(%rbp)
   9957a:      	leaq	-0x128(%rbp), %r14
   99581:      	movl	$0x48, %esi
   99586:      	movq	%r14, %rdi
   99589:      	movl	$0x6, %edx
   9958e:      	callq	0x99020 <<toyos_crypto::keccak::Sponge>::new>
   99593:      	leaq	-0x50(%rbp), %rsi
   99597:      	movl	$0x40, %edx
   9959c:      	movq	%r14, %rdi
   9959f:      	callq	0x99400 <<toyos_crypto::keccak::Sponge>::read>
   995a4:      	movq	$0x0, -0x128(%rbp)
   995af:      	movq	$0x0, -0x120(%rbp)
   995ba:      	movq	$0x0, -0x118(%rbp)
   995c5:      	movq	$0x0, -0x110(%rbp)
   995d0:      	movq	$0x0, -0x108(%rbp)
   995db:      	movq	$0x0, -0x100(%rbp)
   995e6:      	movq	$0x0, -0xf8(%rbp)
   995f1:      	movq	$0x0, -0xf0(%rbp)
   995fc:      	movq	$0x0, -0xe8(%rbp)
   99607:      	movq	$0x0, -0xe0(%rbp)
   99612:      	movq	$0x0, -0xd8(%rbp)
   9961d:      	movq	$0x0, -0xd0(%rbp)
   99628:      	movq	$0x0, -0xc8(%rbp)
   99633:      	movq	$0x0, -0xc0(%rbp)
   9963e:      	movq	$0x0, -0xb8(%rbp)
   99649:      	movq	$0x0, -0xb0(%rbp)
   99654:      	movq	$0x0, -0xa8(%rbp)
   9965f:      	movq	$0x0, -0xa0(%rbp)
   9966a:      	movq	$0x0, -0x98(%rbp)
   99675:      	movq	$0x0, -0x90(%rbp)
   99680:      	movq	$0x0, -0x88(%rbp)
   9968b:      	movq	$0x0, -0x80(%rbp)
   99693:      	movq	$0x0, -0x78(%rbp)
   9969b:      	movq	$0x0, -0x70(%rbp)
   996a3:      	movq	$0x0, -0x68(%rbp)
   996ab:      	movaps	-0x50(%rbp), %xmm0
   996af:      	movaps	-0x40(%rbp), %xmm1
   996b3:      	movaps	-0x30(%rbp), %xmm2
   996b7:      	movaps	-0x20(%rbp), %xmm3
   996bb:      	movups	%xmm3, 0x30(%rbx)
   996bf:      	movups	%xmm2, 0x20(%rbx)
   996c3:      	movups	%xmm1, 0x10(%rbx)
   996c7:      	movups	%xmm0, (%rbx)
   996ca:      	movq	%rbx, %rax
   996cd:      	addq	$0x120, %rsp            # imm = 0x120
   996d4:      	popq	%rbx
   996d5:      	popq	%r14
   996d7:      	popq	%rbp
   996d8:      	retq
   996d9:      	movq	%rax, %rbx
   996dc:      	leaq	-0x128(%rbp), %rdi
   996e3:      	callq	0x8fb20 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   996e8:      	movq	%rbx, %rdi
   996eb:      	callq	0x102010 <_Unwind_Resume>
   996f0:      	callq	0x1071ea <core::panicking::panic_in_cleanup>
   996f5:      	int3
   996f6:      	int3
   996f7:      	int3
   996f8:      	int3
   996f9:      	int3
   996fa:      	int3
   996fb:      	int3
   996fc:      	int3
   996fd:      	int3
   996fe:      	int3
   996ff:      	int3

0000000000099700 <toyos_crypto::keccak::h>:
   99700:      	pushq	%rbp
   99701:      	movq	%rsp, %rbp
   99704:      	pushq	%r14
   99706:      	pushq	%rbx
   99707:      	subq	$0x100, %rsp            # imm = 0x100
   9970e:      	movq	%rdx, %r8
   99711:      	movq	%rsi, %rcx
   99714:      	movq	%rdi, %rbx
   99717:      	xorps	%xmm0, %xmm0
   9971a:      	movaps	%xmm0, -0x20(%rbp)
   9971e:      	movaps	%xmm0, -0x30(%rbp)
   99722:      	leaq	-0x108(%rbp), %r14
   99729:      	movl	$0x88, %esi
   9972e:      	movq	%r14, %rdi
   99731:      	movl	$0x6, %edx
   99736:      	callq	0x99020 <<toyos_crypto::keccak::Sponge>::new>
   9973b:      	leaq	-0x30(%rbp), %rsi
   9973f:      	movl	$0x20, %edx
   99744:      	movq	%r14, %rdi
   99747:      	callq	0x99400 <<toyos_crypto::keccak::Sponge>::read>
   9974c:      	movq	$0x0, -0x108(%rbp)
   99757:      	movq	$0x0, -0x100(%rbp)
   99762:      	movq	$0x0, -0xf8(%rbp)
   9976d:      	movq	$0x0, -0xf0(%rbp)
   99778:      	movq	$0x0, -0xe8(%rbp)
   99783:      	movq	$0x0, -0xe0(%rbp)
   9978e:      	movq	$0x0, -0xd8(%rbp)
   99799:      	movq	$0x0, -0xd0(%rbp)
   997a4:      	movq	$0x0, -0xc8(%rbp)
   997af:      	movq	$0x0, -0xc0(%rbp)
   997ba:      	movq	$0x0, -0xb8(%rbp)
   997c5:      	movq	$0x0, -0xb0(%rbp)
   997d0:      	movq	$0x0, -0xa8(%rbp)
   997db:      	movq	$0x0, -0xa0(%rbp)
   997e6:      	movq	$0x0, -0x98(%rbp)
   997f1:      	movq	$0x0, -0x90(%rbp)
   997fc:      	movq	$0x0, -0x88(%rbp)
   99807:      	movq	$0x0, -0x80(%rbp)
   9980f:      	movq	$0x0, -0x78(%rbp)
   99817:      	movq	$0x0, -0x70(%rbp)
   9981f:      	movq	$0x0, -0x68(%rbp)
   99827:      	movq	$0x0, -0x60(%rbp)
   9982f:      	movq	$0x0, -0x58(%rbp)
   99837:      	movq	$0x0, -0x50(%rbp)
   9983f:      	movq	$0x0, -0x48(%rbp)
   99847:      	movaps	-0x30(%rbp), %xmm0
   9984b:      	movaps	-0x20(%rbp), %xmm1
   9984f:      	movups	%xmm1, 0x10(%rbx)
   99853:      	movups	%xmm0, (%rbx)
   99856:      	movq	%rbx, %rax
   99859:      	addq	$0x100, %rsp            # imm = 0x100
   99860:      	popq	%rbx
   99861:      	popq	%r14
   99863:      	popq	%rbp
   99864:      	retq
   99865:      	movq	%rax, %rbx
   99868:      	leaq	-0x108(%rbp), %rdi
   9986f:      	callq	0x8fb20 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   99874:      	movq	%rbx, %rdi
   99877:      	callq	0x102010 <_Unwind_Resume>
   9987c:      	callq	0x1071ea <core::panicking::panic_in_cleanup>
   99881:      	int3
   99882:      	int3
   99883:      	int3
   99884:      	int3
   99885:      	int3
   99886:      	int3
   99887:      	int3
   99888:      	int3
   99889:      	int3
   9988a:      	int3
   9988b:      	int3
   9988c:      	int3
   9988d:      	int3
   9988e:      	int3
   9988f:      	int3

0000000000099890 <toyos_crypto::keccak::permute (.llvm.7827812676742230592)>:
   99890:      	pushq	%rbp
   99891:      	movq	%rsp, %rbp
   99894:      	pushq	%r15
   99896:      	pushq	%r14
   99898:      	pushq	%r13
   9989a:      	pushq	%r12
   9989c:      	pushq	%rbx
   9989d:      	subq	$0x60, %rsp
   998a1:      	movq	(%rdi), %rax
   998a4:      	movq	%rax, -0x50(%rbp)
   998a8:      	movq	0x8(%rdi), %rax
   998ac:      	movq	%rax, -0x98(%rbp)
   998b3:      	movq	0x28(%rdi), %rax
   998b7:      	movq	%rax, -0x48(%rbp)
   998bb:      	movq	0x50(%rdi), %rax
   998bf:      	movq	0x78(%rdi), %r15
   998c3:      	movq	0xa0(%rdi), %rcx
   998ca:      	movq	%rcx, -0x70(%rbp)
   998ce:      	movq	0x30(%rdi), %rbx
   998d2:      	movq	0x58(%rdi), %r13
   998d6:      	movq	0x80(%rdi), %rsi
   998dd:      	movq	0xa8(%rdi), %rcx
   998e4:      	movq	%rcx, -0x78(%rbp)
   998e8:      	movq	0x10(%rdi), %rcx
   998ec:      	movq	%rcx, -0xa0(%rbp)
   998f3:      	movq	0x38(%rdi), %r8
   998f7:      	movq	%r8, -0x60(%rbp)
   998fb:      	movq	0x60(%rdi), %r11
   998ff:      	movq	0x88(%rdi), %r10
   99906:      	movq	0xb0(%rdi), %rcx
   9990d:      	movq	%rcx, -0x90(%rbp)
   99914:      	movq	0x18(%rdi), %rcx
   99918:      	movq	%rcx, -0x58(%rbp)
   9991c:      	movq	0x40(%rdi), %r9
   99920:      	movq	0x68(%rdi), %rcx
   99924:      	movq	0x90(%rdi), %r12
   9992b:      	movq	0xb8(%rdi), %rdx
   99932:      	movq	%rdx, -0x88(%rbp)
   99939:      	movq	0x20(%rdi), %r8
   9993d:      	movq	%r8, -0x30(%rbp)
   99941:      	movq	0x48(%rdi), %r8
   99945:      	movq	%r8, -0x38(%rbp)
   99949:      	movq	0x70(%rdi), %rdx
   9994d:      	movq	%rdx, -0x80(%rbp)
   99951:      	movq	0x98(%rdi), %r8
   99958:      	movq	%rdi, -0xe8(%rbp)
   9995f:      	movq	0xc0(%rdi), %rdx
   99966:      	movq	%rdx, -0x40(%rbp)
   9996a:      	xorl	%edx, %edx
   9996c:      	nopl	(%rax)
   99970:      	movq	%rax, -0xc8(%rbp)
   99977:      	movq	%rsi, -0x68(%rbp)
   9997b:      	movq	%r10, -0xd8(%rbp)
   99982:      	movq	%rdx, -0x108(%rbp)
   99989:      	movq	%r15, %rdx
   9998c:      	xorq	-0x70(%rbp), %rdx
   99990:      	movq	%rax, %rdi
   99993:      	xorq	-0x48(%rbp), %rdi
   99997:      	xorq	%rdx, %rdi
   9999a:      	movq	%r8, %rdx
   9999d:      	movq	%r8, -0xd0(%rbp)
   999a4:      	movq	%rsi, %r8
   999a7:      	xorq	-0x78(%rbp), %r8
   999ab:      	movq	%r13, -0xe0(%rbp)
   999b2:      	movq	%r13, %rsi
   999b5:      	xorq	%rbx, %rsi
   999b8:      	xorq	%r8, %rsi
   999bb:      	movq	%r10, %r8
   999be:      	xorq	-0x90(%rbp), %r8
   999c5:      	movq	%r11, %r10
   999c8:      	xorq	-0x60(%rbp), %r10
   999cc:      	xorq	%r8, %r10
   999cf:      	movq	%r12, %r14
   999d2:      	xorq	-0x88(%rbp), %r14
   999d9:      	movq	%rcx, %rax
   999dc:      	xorq	%r9, %rax
   999df:      	xorq	%r14, %rax
   999e2:      	movq	%rdx, %r14
   999e5:      	xorq	-0x40(%rbp), %r14
   999e9:      	movq	-0x80(%rbp), %rdx
   999ed:      	xorq	-0x38(%rbp), %rdx
   999f1:      	xorq	%r14, %rdx
   999f4:      	movq	-0x50(%rbp), %r14
   999f8:      	xorq	%r14, %rdi
   999fb:      	movq	-0x98(%rbp), %r13
   99a02:      	xorq	%r13, %rsi
   99a05:      	xorq	-0x58(%rbp), %rax
   99a09:      	xorq	-0x30(%rbp), %rdx
   99a0d:      	movq	%rax, %r8
   99a10:      	rolq	%r8
   99a13:      	xorq	%rsi, %r8
   99a16:      	rolq	%rsi
   99a19:      	xorq	%rdx, %rsi
   99a1c:      	xorq	%rsi, %r14
   99a1f:      	movq	%r14, -0xc0(%rbp)
   99a26:      	xorq	%rsi, -0x48(%rbp)
   99a2a:      	xorq	%rsi, -0xc8(%rbp)
   99a31:      	xorq	%rsi, %r15
   99a34:      	xorq	-0x70(%rbp), %rsi
   99a38:      	movq	%rsi, -0x100(%rbp)
   99a3f:      	movq	-0xa0(%rbp), %r14
   99a46:      	xorq	%r14, %r10
   99a49:      	rolq	%rdx
   99a4c:      	xorq	%r10, %rdx
   99a4f:      	rolq	%r10
   99a52:      	xorq	%rdi, %r10
   99a55:      	xorq	%r10, %r13
   99a58:      	xorq	%r10, %rbx
   99a5b:      	xorq	%r10, -0xe0(%rbp)
   99a62:      	xorq	%r10, -0x68(%rbp)
   99a66:      	xorq	-0x78(%rbp), %r10
   99a6a:      	movq	%r10, -0xa8(%rbp)
   99a71:      	xorq	%r8, %r14
   99a74:      	xorq	%r8, -0x60(%rbp)
   99a78:      	xorq	%r8, %r11
   99a7b:      	xorq	%r8, -0xd8(%rbp)
   99a82:      	xorq	-0x90(%rbp), %r8
   99a89:      	movq	%r8, -0xf0(%rbp)
   99a90:      	xorq	%rdx, -0x58(%rbp)
   99a94:      	xorq	%rdx, %r9
   99a97:      	xorq	%rdx, %rcx
   99a9a:      	movq	%rcx, -0xf8(%rbp)
   99aa1:      	xorq	%rdx, %r12
   99aa4:      	xorq	-0x88(%rbp), %rdx
   99aab:      	movq	%rdx, -0xb8(%rbp)
   99ab2:      	rolq	%rdi
   99ab5:      	xorq	%rax, %rdi
   99ab8:      	movq	-0x30(%rbp), %rcx
   99abc:      	xorq	%rdi, %rcx
   99abf:      	movq	-0x38(%rbp), %rax
   99ac3:      	xorq	%rdi, %rax
   99ac6:      	movq	-0x80(%rbp), %r8
   99aca:      	xorq	%rdi, %r8
   99acd:      	xorq	%rdi, -0xd0(%rbp)
   99ad4:      	xorq	-0x40(%rbp), %rdi
   99ad8:      	movq	%r13, -0x38(%rbp)
   99adc:      	movq	%r14, %r13
   99adf:      	rolq	$0x3e, %r13
   99ae3:      	rolq	$0x2c, %rbx
   99ae7:      	rolq	$0x2b, %r11
   99aeb:      	rolq	$0x15, %r12
   99aef:      	movq	%rcx, -0xb0(%rbp)
   99af6:      	rolq	$0xe, %rdi
   99afa:      	movq	%rdi, -0x30(%rbp)
   99afe:      	movq	%rbx, %rcx
   99b01:      	notq	%rcx
   99b04:      	andq	%r11, %rcx
   99b07:      	movq	%rcx, -0x50(%rbp)
   99b0b:      	movq	%r12, %rdx
   99b0e:      	notq	%rdx
   99b11:      	andq	%rdi, %rdx
   99b14:      	xorq	%r11, %rdx
   99b17:      	movq	%rdx, -0xa0(%rbp)
   99b1e:      	notq	%r11
   99b21:      	andq	%r12, %r11
   99b24:      	xorq	%rbx, %r11
   99b27:      	movq	%r11, -0x98(%rbp)
   99b2e:      	movq	-0xc0(%rbp), %r11
   99b35:      	movq	%r11, %r10
   99b38:      	notq	%r10
   99b3b:      	andq	%rbx, %r10
   99b3e:      	rolq	$0x37, %r9
   99b42:      	movq	%r8, %rdx
   99b45:      	rolq	$0x27, %rdx
   99b49:      	rolq	$0x29, %r15
   99b4d:      	movq	-0xa8(%rbp), %r8
   99b54:      	rolq	$0x2, %r8
   99b58:      	movq	%r9, %rdi
   99b5b:      	notq	%rdi
   99b5e:      	andq	%rdx, %rdi
   99b61:      	xorq	%r13, %rdi
   99b64:      	movq	%rdi, -0x70(%rbp)
   99b68:      	movq	%r15, %rdi
   99b6b:      	notq	%rdi
   99b6e:      	movq	%r8, %r14
   99b71:      	movq	%r8, -0xa8(%rbp)
   99b78:      	andq	%r8, %rdi
   99b7b:      	xorq	%rdx, %rdi
   99b7e:      	movq	%rdi, -0x90(%rbp)
   99b85:      	notq	%rdx
   99b88:      	andq	%r15, %rdx
   99b8b:      	xorq	%r9, %rdx
   99b8e:      	movq	%rdx, -0x78(%rbp)
   99b92:      	notq	%r14
   99b95:      	andq	%r13, %r14
   99b98:      	notq	%r13
   99b9b:      	andq	%r9, %r13
   99b9e:      	movq	%r13, -0x40(%rbp)
   99ba2:      	movq	-0x58(%rbp), %rdx
   99ba6:      	rolq	$0x1c, %rdx
   99baa:      	movq	%rax, %r13
   99bad:      	rolq	$0x14, %r13
   99bb1:      	movq	-0xc8(%rbp), %rax
   99bb8:      	rolq	$0x3, %rax
   99bbc:      	movq	-0x68(%rbp), %r9
   99bc0:      	rolq	$0x2d, %r9
   99bc4:      	movq	-0xf0(%rbp), %rcx
   99bcb:      	rolq	$0x3d, %rcx
   99bcf:      	movq	-0x48(%rbp), %rsi
   99bd3:      	movq	%r13, %rdi
   99bd6:      	notq	%rdi
   99bd9:      	andq	%rax, %rdi
   99bdc:      	xorq	%rdx, %rdi
   99bdf:      	movq	%rdi, -0x48(%rbp)
   99be3:      	movq	%rax, %rbx
   99be6:      	notq	%rbx
   99be9:      	andq	%r9, %rbx
   99bec:      	movq	%r9, %rdi
   99bef:      	xorq	%r13, %rbx
   99bf2:      	movq	%rcx, %r9
   99bf5:      	notq	%r9
   99bf8:      	andq	%rdx, %r9
   99bfb:      	notq	%rdx
   99bfe:      	andq	%rdx, %r13
   99c01:      	movq	-0x30(%rbp), %r8
   99c05:      	movq	%r8, %rdx
   99c08:      	notq	%rdx
   99c0b:      	andq	%r11, %rdx
   99c0e:      	xorq	%r12, %rdx
   99c11:      	movq	%rdx, -0x58(%rbp)
   99c15:      	xorq	%r8, %r10
   99c18:      	movq	%r10, -0x30(%rbp)
   99c1c:      	movq	-0x60(%rbp), %r8
   99c20:      	movq	%rdi, %r10
   99c23:      	notq	%r10
   99c26:      	andq	%rcx, %r10
   99c29:      	xorq	%rax, %r10
   99c2c:      	movq	%r10, -0x60(%rbp)
   99c30:      	movq	-0x38(%rbp), %rdx
   99c34:      	rolq	%rdx
   99c37:      	movq	-0xb0(%rbp), %r11
   99c3e:      	rolq	$0x1b, %r11
   99c42:      	movq	%r11, -0xb0(%rbp)
   99c49:      	rolq	$0x24, %rsi
   99c4d:      	movq	%rsi, -0x68(%rbp)
   99c51:      	rolq	$0x6, %r8
   99c55:      	xorq	%rdi, %r9
   99c58:      	movq	-0xe0(%rbp), %rax
   99c5f:      	rolq	$0xa, %rax
   99c63:      	xorq	%rcx, %r13
   99c66:      	movq	%r13, -0x38(%rbp)
   99c6a:      	movq	-0xf8(%rbp), %r13
   99c71:      	rolq	$0x19, %r13
   99c75:      	movq	-0xd8(%rbp), %r10
   99c7c:      	rolq	$0xf, %r10
   99c80:      	movq	-0xd0(%rbp), %rdi
   99c87:      	rolq	$0x8, %rdi
   99c8b:      	xorq	%r15, %r14
   99c8e:      	movq	%r14, -0x88(%rbp)
   99c95:      	movq	-0xb8(%rbp), %rcx
   99c9c:      	rolq	$0x38, %rcx
   99ca0:      	movq	%rcx, -0xb8(%rbp)
   99ca7:      	movq	%rsi, %r15
   99caa:      	notq	%r15
   99cad:      	andq	%rax, %r15
   99cb0:      	movq	%rax, %rsi
   99cb3:      	notq	%rsi
   99cb6:      	andq	%r10, %rsi
   99cb9:      	movq	%rcx, %r12
   99cbc:      	notq	%r12
   99cbf:      	andq	%r11, %r12
   99cc2:      	xorq	%r10, %r12
   99cc5:      	notq	%r10
   99cc8:      	andq	%rcx, %r10
   99ccb:      	xorq	%rax, %r10
   99cce:      	movq	-0x100(%rbp), %r14
   99cd5:      	rolq	$0x12, %r14
   99cd9:      	movq	%r8, %rax
   99cdc:      	notq	%rax
   99cdf:      	andq	%r13, %rax
   99ce2:      	movq	%rdi, %r11
   99ce5:      	notq	%r11
   99ce8:      	andq	%r14, %r11
   99ceb:      	xorq	%r13, %r11
   99cee:      	notq	%r13
   99cf1:      	andq	%rdi, %r13
   99cf4:      	movq	%r14, %rcx
   99cf7:      	notq	%rcx
   99cfa:      	andq	%rdx, %rcx
   99cfd:      	xorq	%rdi, %rcx
   99d00:      	xorq	%rdx, %rax
   99d03:      	xorq	%r8, %r13
   99d06:      	notq	%rdx
   99d09:      	andq	%r8, %rdx
   99d0c:      	xorq	%r14, %rdx
   99d0f:      	movq	%rdx, -0x80(%rbp)
   99d13:      	movq	-0xb0(%rbp), %r8
   99d1a:      	xorq	%r8, %r15
   99d1d:      	movq	-0x68(%rbp), %rdx
   99d21:      	xorq	%rdx, %rsi
   99d24:      	notq	%r8
   99d27:      	andq	%rdx, %r8
   99d2a:      	xorq	-0xb8(%rbp), %r8
   99d31:      	movq	-0x40(%rbp), %rdx
   99d35:      	xorq	-0xa8(%rbp), %rdx
   99d3c:      	movq	%rdx, -0x40(%rbp)
   99d40:      	leaq	-0x7cc97(%rip), %rdx    # 0x1d0b0 <anon.68c3b30278565fbd7c0b87acd371f0b5.1.llvm.7827812676742230592+0x40>
   99d47:      	movq	-0x108(%rbp), %rdi
   99d4e:      	movq	-0x50(%rbp), %r14
   99d52:      	xorq	(%rdi,%rdx), %r14
   99d56:      	xorq	-0xc0(%rbp), %r14
   99d5d:      	movq	%r14, -0x50(%rbp)
   99d61:      	leaq	0x8(%rdi), %rdx
   99d65:      	cmpq	$0xc0, %rdx
   99d6c:      	jne	0x99970 <toyos_crypto::keccak::permute (.llvm.7827812676742230592)+0xe0>
   99d72:      	movq	-0xe8(%rbp), %r14
   99d79:      	movq	-0x98(%rbp), %rdx
   99d80:      	movq	%rdx, 0x8(%r14)
   99d84:      	movq	-0xa0(%rbp), %rdx
   99d8b:      	movq	%rdx, 0x10(%r14)
   99d8f:      	movq	-0x58(%rbp), %rdx
   99d93:      	movq	%rdx, 0x18(%r14)
   99d97:      	movq	-0x30(%rbp), %rdx
   99d9b:      	movq	%rdx, 0x20(%r14)
   99d9f:      	movq	-0x48(%rbp), %rdx
   99da3:      	movq	%rdx, 0x28(%r14)
   99da7:      	movq	%rbx, 0x30(%r14)
   99dab:      	movq	-0x60(%rbp), %rdi
   99daf:      	movq	%rdi, 0x38(%r14)
   99db3:      	movq	%r9, 0x40(%r14)
   99db7:      	movq	-0x38(%rbp), %rdi
   99dbb:      	movq	%rdi, 0x48(%r14)
   99dbf:      	movq	%rax, 0x50(%r14)
   99dc3:      	movq	%r13, 0x58(%r14)
   99dc7:      	movq	%r11, 0x60(%r14)
   99dcb:      	movq	%rcx, 0x68(%r14)
   99dcf:      	movq	-0x80(%rbp), %rax
   99dd3:      	movq	%rax, 0x70(%r14)
   99dd7:      	movq	%r15, 0x78(%r14)
   99ddb:      	movq	%rsi, 0x80(%r14)
   99de2:      	movq	%r10, 0x88(%r14)
   99de9:      	movq	%r12, 0x90(%r14)
   99df0:      	movq	%r8, 0x98(%r14)
   99df7:      	movq	-0x70(%rbp), %rax
   99dfb:      	movq	%rax, 0xa0(%r14)
   99e02:      	movq	-0x78(%rbp), %rax
   99e06:      	movq	%rax, 0xa8(%r14)
   99e0d:      	movq	-0x90(%rbp), %rax
   99e14:      	movq	%rax, 0xb0(%r14)
   99e1b:      	movq	-0x88(%rbp), %rax
   99e22:      	movq	%rax, 0xb8(%r14)
   99e29:      	movq	-0x40(%rbp), %rax
   99e2d:      	movq	%rax, 0xc0(%r14)
   99e34:      	movq	-0x50(%rbp), %rax
   99e38:      	movq	%rax, (%r14)
   99e3b:      	addq	$0x60, %rsp
   99e3f:      	popq	%rbx
   99e40:      	popq	%r12
   99e42:      	popq	%r13
   99e44:      	popq	%r14
   99e46:      	popq	%r15
   99e48:      	popq	%rbp
   99e49:      	retq
   99e4a:      	int3
   99e4b:      	int3
   99e4c:      	int3
   99e4d:      	int3
   99e4e:      	int3
   99e4f:      	int3

