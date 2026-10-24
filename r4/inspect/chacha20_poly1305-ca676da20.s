
crypto-oracles-ca676da20: file format elf64-x86-64

Disassembly of section .text:

0000000000303bc0 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305>:
  303bc0:      	pushq	%rbp
  303bc1:      	movq	%rsp, %rbp
  303bc4:      	pushq	%r15
  303bc6:      	pushq	%r14
  303bc8:      	pushq	%r13
  303bca:      	pushq	%r12
  303bcc:      	pushq	%rbx
  303bcd:      	andq	$-0x20, %rsp
  303bd1:      	subq	$0x620, %rsp            # imm = 0x620
  303bd8:      	movq	%r9, %rbx
  303bdb:      	movq	%r8, 0x100(%rsp)
  303be3:      	movq	%rsi, %r9
  303be6:      	movq	%rdi, %r12
  303be9:      	movq	0x18(%rbp), %rdi
  303bed:      	movzbl	0x28(%rbp), %r13d
  303bf2:      	movq	(%rcx), %rsi
  303bf5:      	movl	%ebx, %ecx
  303bf7:      	negl	%ecx
  303bf9:      	andl	$0xf, %ecx
  303bfc:      	xorl	%eax, %eax
  303bfe:      	testb	%r13b, %r13b
  303c01:      	cmovneq	%rax, %rcx
  303c05:      	movq	%rcx, 0x68(%rsp)
  303c0a:      	vxorps	%xmm0, %xmm0, %xmm0
  303c0e:      	vmovups	%ymm0, 0x5e0(%rsp)
  303c17:      	vmovups	%ymm0, 0x5c0(%rsp)
  303c20:      	vmovups	%ymm0, 0x5a0(%rsp)
  303c29:      	vmovups	%ymm0, 0x580(%rsp)
  303c32:      	vmovups	%ymm0, 0x560(%rsp)
  303c3b:      	vmovups	%ymm0, 0x540(%rsp)
  303c44:      	vmovups	%ymm0, 0x520(%rsp)
  303c4d:      	vmovups	%ymm0, 0x500(%rsp)
  303c56:      	vmovups	%ymm0, 0x4e0(%rsp)
  303c5f:      	vmovups	%ymm0, 0x4c0(%rsp)
  303c68:      	vmovups	%ymm0, 0x4a0(%rsp)
  303c71:      	vmovups	%ymm0, 0x480(%rsp)
  303c7a:      	vmovups	%ymm0, 0x460(%rsp)
  303c83:      	vmovups	%ymm0, 0x440(%rsp)
  303c8c:      	vmovups	%ymm0, 0x420(%rsp)
  303c95:      	cmpq	$0x1c0, %rdi            # imm = 0x1C0
  303c9c:      	movl	$0x1c0, %eax            # imm = 0x1C0
  303ca1:      	cmovbq	%rdi, %rax
  303ca5:      	movl	$0x40, %ecx
  303caa:      	cmovbeq	%rax, %rcx
  303cae:      	vmovups	%ymm0, 0x400(%rsp)
  303cb7:      	cmpb	$0x0, 0x20(%rbp)
  303cbb:      	cmovneq	%rax, %rcx
  303cbf:      	movq	%rcx, %r15
  303cc2:      	leaq	0x40(%rcx), %rcx
  303cc6:      	vxorps	%xmm0, %xmm0, %xmm0
  303cca:      	vmovaps	%xmm0, 0x40(%rsp)
  303cd0:      	movq	$0x0, 0x50(%rsp)
  303cd9:      	vmovups	%xmm0, 0x78(%rsp)
  303cdf:      	movq	$0x0, 0x88(%rsp)
  303ceb:      	leaq	0x40(%rsp), %r14
  303cf0:      	movq	%r14, 0x70(%rsp)
  303cf5:      	leaq	0x400(%rsp), %r10
  303cfd:      	leaq	0x70(%rsp), %rax
  303d02:      	movl	$0x1, %r8d
  303d08:      	movq	%r9, 0xf0(%rsp)
  303d10:      	movq	%r9, %rdi
  303d13:      	movq	%rsi, 0xe8(%rsp)
  303d1b:      	movq	%rdx, 0x160(%rsp)
  303d23:      	xorl	%r9d, %r9d
  303d26:      	pushq	%r10
  303d28:      	pushq	%rax
  303d29:      	vzeroupper
  303d2c:      	callq	0x306c40 <toyos_crypto::arch::x86_64::chacha::avx2::keystream>
  303d31:      	vpxor	%xmm1, %xmm1, %xmm1
  303d35:      	addq	$0x10, %rsp
  303d39:      	movq	0x400(%rsp), %rax
  303d41:      	movq	0x408(%rsp), %rcx
  303d49:      	vmovdqa	%xmm1, 0x40(%rsp)
  303d4f:      	leaq	0x410(%rsp), %rdx
  303d57:      	movq	%rdx, %rsi
  303d5a:      	subq	%r14, %rsi
  303d5d:      	subq	%rdx, %r14
  303d60:      	cmovbq	%rsi, %r14
  303d64:      	cmpq	$0x10, %r14
  303d68:      	jb	0x30539d <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x17dd>
  303d6e:      	movabsq	$0xffffffc0fffffff, %rsi # imm = 0xFFFFFFC0FFFFFFF
  303d78:      	andq	%rsi, %rax
  303d7b:      	movabsq	$0xffffffc0ffffffc, %rsi # imm = 0xFFFFFFC0FFFFFFC
  303d85:      	andq	%rsi, %rcx
  303d88:      	movq	%rcx, %rsi
  303d8b:      	shrq	$0x2, %rsi
  303d8f:      	addq	%rcx, %rsi
  303d92:      	vmovdqu	%xmm1, 0xa8(%rsp)
  303d9b:      	movq	$0x0, 0xb8(%rsp)
  303da7:      	vmovdqu	(%rdx), %xmm0
  303dab:      	vmovdqa	%xmm0, 0x70(%rsp)
  303db1:      	movq	%rax, 0x90(%rsp)
  303db9:      	movq	%rcx, 0x98(%rsp)
  303dc1:      	movq	%rsi, 0xa0(%rsp)
  303dc9:      	vmovdqa	%xmm1, 0x80(%rsp)
  303dd2:      	movq	$0x0, 0xc0(%rsp)
  303dde:      	testb	%r13b, %r13b
  303de1:      	je	0x303dfa <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x23a>
  303de3:      	leaq	0x70(%rsp), %rdi
  303de8:      	movq	0x100(%rsp), %rsi
  303df0:      	movq	%rbx, %rdx
  303df3:      	callq	0x307aa0 <<toyos_crypto::poly1305::Poly1305>::update_padded>
  303df8:      	jmp	0x303e0f <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x24f>
  303dfa:      	leaq	0x70(%rsp), %rdi
  303dff:      	movq	0x100(%rsp), %rsi
  303e07:      	movq	%rbx, %rdx
  303e0a:      	callq	0x3080c0 <<toyos_crypto::poly1305::Poly1305>::update>
  303e0f:      	xorl	%ebx, %ebx
  303e11:      	cmpb	$0x0, 0x20(%rbp)
  303e15:      	jne	0x303e4f <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x28f>
  303e17:      	movq	%r15, %rax
  303e1a:      	subq	0x68(%rsp), %rax
  303e1f:      	cmovaeq	%rax, %rbx
  303e23:      	testb	$0xf, %bl
  303e26:      	je	0x303e3f <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x27f>
  303e28:      	movl	%ebx, %eax
  303e2a:      	andl	$0x1f0, %eax            # imm = 0x1F0
  303e2f:      	addq	$0x10, %rax
  303e33:      	cmpq	%rbx, %rax
  303e36:      	movq	%rax, %rbx
  303e39:      	jb	0x3053ec <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x182c>
  303e3f:      	addq	0x68(%rsp), %rbx
  303e44:      	movq	0x18(%rbp), %rax
  303e48:      	cmpq	%rbx, %rax
  303e4b:      	cmovbq	%rax, %rbx
  303e4f:      	movq	0x10(%rbp), %rsi
  303e53:      	testb	%r13b, %r13b
  303e56:      	je	0x303e67 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x2a7>
  303e58:      	leaq	0x70(%rsp), %rdi
  303e5d:      	movq	%rbx, %rdx
  303e60:      	callq	0x307aa0 <<toyos_crypto::poly1305::Poly1305>::update_padded>
  303e65:      	jmp	0x303e74 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x2b4>
  303e67:      	leaq	0x70(%rsp), %rdi
  303e6c:      	movq	%rbx, %rdx
  303e6f:      	callq	0x3080c0 <<toyos_crypto::poly1305::Poly1305>::update>
  303e74:      	leaq	0x440(%rsp), %rdx
  303e7c:      	movl	$0x1c0, %ecx            # imm = 0x1C0
  303e81:      	movq	0x10(%rbp), %rdi
  303e85:      	movq	%r15, %rsi
  303e88:      	callq	0x3038d0 <toyos_crypto::block::xor>
  303e8d:      	cmpb	$0x0, 0x20(%rbp)
  303e91:      	je	0x303ecc <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x30c>
  303e93:      	movq	0x18(%rbp), %rax
  303e97:      	movq	0x68(%rsp), %rbx
  303e9c:      	cmpq	%rbx, %rax
  303e9f:      	cmovbq	%rax, %rbx
  303ea3:      	testb	%r13b, %r13b
  303ea6:      	je	0x303ebb <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x2fb>
  303ea8:      	leaq	0x70(%rsp), %rdi
  303ead:      	movq	0x10(%rbp), %rsi
  303eb1:      	movq	%rbx, %rdx
  303eb4:      	callq	0x307aa0 <<toyos_crypto::poly1305::Poly1305>::update_padded>
  303eb9:      	jmp	0x303ecc <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x30c>
  303ebb:      	leaq	0x70(%rsp), %rdi
  303ec0:      	movq	0x10(%rbp), %rsi
  303ec4:      	movq	%rbx, %rdx
  303ec7:      	callq	0x3080c0 <<toyos_crypto::poly1305::Poly1305>::update>
  303ecc:      	cmpq	0x18(%rbp), %r15
  303ed0:      	jae	0x3051ea <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x162a>
  303ed6:      	movq	%r12, 0x188(%rsp)
  303ede:      	cmpq	$0x0, 0xc0(%rsp)
  303ee7:      	movq	0x10(%rbp), %rsi
  303eeb:      	jne	0x3053fe <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x183e>
  303ef1:      	movq	0x90(%rsp), %r12
  303ef9:      	movq	0x98(%rsp), %r11
  303f01:      	movq	0xa0(%rsp), %r13
  303f09:      	leaq	0xa8(%rsp), %rcx
  303f11:      	movq	0x10(%rcx), %rax
  303f15:      	movq	%rax, 0x30(%rsp)
  303f1a:      	vmovups	(%rcx), %xmm0
  303f1e:      	vmovaps	%xmm0, 0x20(%rsp)
  303f24:      	movq	%r15, %rax
  303f27:      	shrq	$0x6, %rax
  303f2b:      	movq	0x160(%rsp), %rcx
  303f33:      	leaq	(%rcx,%rax), %rdx
  303f37:      	incq	%rdx
  303f3a:      	movq	0xf0(%rsp), %rax
  303f42:      	vbroadcastss	(%rax), %ymm0
  303f47:      	vmovaps	%ymm0, 0x380(%rsp)
  303f50:      	vbroadcastss	0x4(%rax), %ymm0
  303f56:      	vmovaps	%ymm0, 0x360(%rsp)
  303f5f:      	vmovddup	0x8(%rax), %xmm0        # xmm0 = mem[0,0]
  303f64:      	vbroadcastss	0xc(%rax), %ymm1
  303f6a:      	vmovaps	%ymm1, 0x340(%rsp)
  303f73:      	vbroadcastss	0x10(%rax), %ymm1
  303f79:      	vmovaps	%ymm1, 0x320(%rsp)
  303f82:      	vbroadcastss	0x14(%rax), %ymm1
  303f88:      	vmovaps	%ymm1, 0x300(%rsp)
  303f91:      	vpbroadcastd	0x18(%rax), %ymm1
  303f97:      	vmovdqa	%ymm1, 0x2e0(%rsp)
  303fa0:      	vbroadcastss	%xmm0, %ymm0
  303fa5:      	vmovaps	%ymm0, 0x2c0(%rsp)
  303fae:      	vbroadcastss	0x1c(%rax), %ymm0
  303fb4:      	vmovaps	%ymm0, 0x2a0(%rsp)
  303fbd:      	movq	0xe8(%rsp), %rax
  303fc5:      	vmovd	%eax, %xmm0
  303fc9:      	vpbroadcastd	%xmm0, %ymm0
  303fce:      	vmovdqa	%ymm0, 0x280(%rsp)
  303fd7:      	shrq	$0x20, %rax
  303fdb:      	vmovd	%eax, %xmm0
  303fdf:      	vpbroadcastd	%xmm0, %ymm0
  303fe4:      	vmovdqa	%ymm0, 0x260(%rsp)
  303fed:      	leaq	0x1e0(%rsi), %rax
  303ff4:      	movq	%rax, 0x190(%rsp)
  303ffc:      	leaq	0x50310d(%rip), %rax    # 0x807110 <anon.82512870eb8e0132f6a040156ea4d9cc.5.llvm.900034671349249464+0xf0>
  304003:      	movq	%rax, 0xe0(%rsp)
  30400b:      	vbroadcastss	-0x225cf8(%rip), %ymm0 # 0xde31c <kbrainpoolP224r1MontA+0xfbc>
  304014:      	vmovaps	%ymm0, 0x240(%rsp)
  30401d:      	vpbroadcastd	-0x225cb6(%rip), %ymm0 # 0xde370 <anon.9b5b727f87a45422a003fa990acdeb8e.70.llvm.17782113661035556056+0x1c>
  304026:      	vmovdqa	%ymm0, 0x220(%rsp)
  30402f:      	movq	0x18(%rbp), %r14
  304033:      	movq	%r11, 0x18(%rsp)
  304038:      	jmp	0x30411d <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x55d>
  30403d:      	movq	(%r10), %rdi
  304040:      	movq	0x8(%r10), %rsi
  304044:      	addq	%r9, %rdi
  304047:      	adcq	%r8, %rsi
  30404a:      	adcq	$0x1, %rax
  30404e:      	movq	%rdi, %rdx
  304051:      	mulxq	%r12, %r9, %r8
  304056:      	movq	%rsi, %rdx
  304059:      	mulxq	%r13, %rcx, %r10
  30405e:      	addq	%r9, %rcx
  304061:      	adcq	%r8, %r10
  304064:      	movq	%rdi, %rdx
  304067:      	mulxq	%r11, %r8, %rdi
  30406c:      	movq	%rsi, %rdx
  30406f:      	mulxq	%r12, %rsi, %r9
  304074:      	movq	%rax, %rdx
  304077:      	mulxq	%r13, %r11, %rdx
  30407c:      	addq	%r8, %rsi
  30407f:      	adcq	%rdi, %r9
  304082:      	addq	%r10, %rsi
  304085:      	adcq	$0x0, %r9
  304089:      	addq	%r11, %rsi
  30408c:      	adcq	%rdx, %r9
  30408f:      	imulq	%r12, %rax
  304093:      	addq	%r9, %rax
  304096:      	movq	%rax, %rdx
  304099:      	shrq	$0x2, %rdx
  30409d:      	leaq	(%rdx,%rdx,4), %rdx
  3040a1:      	andl	$0x3, %eax
  3040a4:      	addq	%rcx, %rdx
  3040a7:      	adcq	$0x0, %rsi
  3040ab:      	adcq	$0x0, %rax
  3040af:      	movq	%rdx, 0x20(%rsp)
  3040b4:      	movq	%rsi, 0x28(%rsp)
  3040b9:      	movq	%rax, 0x30(%rsp)
  3040be:      	movq	0xd8(%rsp), %rdi
  3040c6:      	movq	0x10(%rbp), %rbx
  3040ca:      	addq	%rbx, %rdi
  3040cd:      	movl	$0x200, %ecx            # imm = 0x200
  3040d2:      	movq	0x100(%rsp), %rsi
  3040da:      	leaq	0x400(%rsp), %rdx
  3040e2:      	callq	0x3038d0 <toyos_crypto::block::xor>
  3040e7:      	movq	%rbx, %rsi
  3040ea:      	movq	0x18(%rbp), %r14
  3040ee:      	movq	0x18(%rsp), %r11
  3040f3:      	movq	0x10(%rsp), %rax
  3040f8:      	movq	0x1a8(%rsp), %rdx
  304100:      	addq	$0x8, %rdx
  304104:      	movq	0x1a0(%rsp), %r15
  30410c:      	movq	%rax, %rbx
  30410f:      	cmpq	%r14, 0xd0(%rsp)
  304117:      	jae	0x3051f4 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x1634>
  30411d:      	leaq	0x200(%r15), %rax
  304124:      	cmpq	%r14, %rax
  304127:      	movq	%rax, 0xd0(%rsp)
  30412f:      	cmovbq	%rax, %r14
  304133:      	movq	%r15, 0xd8(%rsp)
  30413b:      	cmpb	$0x0, 0x20(%rbp)
  30413f:      	jne	0x304189 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x5c9>
  304141:      	movq	%r14, %rax
  304144:      	subq	0x68(%rsp), %rax
  304149:      	movl	$0x0, %r15d
  30414f:      	cmovaeq	%rax, %r15
  304153:      	testb	$0xf, %r15b
  304157:      	je	0x304179 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x5b9>
  304159:      	movq	%r15, %rax
  30415c:      	movabsq	$0x7ffffffffffffff0, %rcx # imm = 0x7FFFFFFFFFFFFFF0
  304166:      	andq	%rcx, %rax
  304169:      	addq	$0x10, %rax
  30416d:      	cmpq	%r15, %rax
  304170:      	movq	%rax, %r15
  304173:      	jb	0x3053ec <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x182c>
  304179:      	addq	0x68(%rsp), %r15
  30417e:      	movq	0x18(%rbp), %rax
  304182:      	cmpq	%r15, %rax
  304185:      	cmovbq	%rax, %r15
  304189:      	movq	%r15, %r8
  30418c:      	subq	%rbx, %r8
  30418f:      	jb	0x3053d9 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x1819>
  304195:      	movq	%r8, %rdi
  304198:      	andq	$-0x10, %rdi
  30419c:      	addq	%rbx, %rdi
  30419f:      	jb	0x3053b8 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x17f8>
  3041a5:      	cmpb	$0x0, 0x20(%rbp)
  3041a9:      	movq	%r15, %rcx
  3041ac:      	cmovneq	%rdi, %rcx
  3041b0:      	movq	0xd8(%rsp), %rax
  3041b8:      	cmpq	$-0x201, %rax           # imm = 0xFDFF
  3041be:      	ja	0x3053ca <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x180a>
  3041c4:      	movq	%r14, %r10
  3041c7:      	subq	%rax, %r10
  3041ca:      	cmpq	$0x200, %r10            # imm = 0x200
  3041d1:      	movq	%rcx, 0x10(%rsp)
  3041d6:      	movq	%rdx, 0x1a8(%rsp)
  3041de:      	movq	%r14, 0x1a0(%rsp)
  3041e6:      	jne	0x304780 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0xbc0>
  3041ec:      	movq	0x18(%rbp), %r14
  3041f0:      	movq	%rdi, 0xf8(%rsp)
  3041f8:      	cmpq	%r14, %rdi
  3041fb:      	ja	0x305309 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x1749>
  304201:      	leaq	(%rsi,%rbx), %r9
  304205:      	movq	%r8, 0x198(%rsp)
  30420d:      	shrq	$0x4, %r8
  304211:      	movq	%rdx, %rax
  304214:      	leaq	0x1(%rdx), %rcx
  304218:      	vmovd	%edx, %xmm0
  30421c:      	vpinsrd	$0x1, %ecx, %xmm0, %xmm0
  304222:      	shrq	$0x20, %rax
  304226:      	shrq	$0x20, %rcx
  30422a:      	movq	%rdx, %rdi
  30422d:      	addq	$0x2, %rdx
  304231:      	leaq	0x4(%rdi), %rsi
  304235:      	vmovd	%esi, %xmm1
  304239:      	shrq	$0x20, %rsi
  30423d:      	vmovd	%esi, %xmm2
  304241:      	leaq	0x5(%rdi), %rsi
  304245:      	vpinsrd	$0x1, %esi, %xmm1, %xmm1
  30424b:      	shrq	$0x20, %rsi
  30424f:      	vpinsrd	$0x1, %esi, %xmm2, %xmm2
  304255:      	leaq	0x6(%rdi), %rsi
  304259:      	vpinsrd	$0x2, %esi, %xmm1, %xmm1
  30425f:      	shrq	$0x20, %rsi
  304263:      	vpinsrd	$0x2, %esi, %xmm2, %xmm2
  304269:      	leaq	0x7(%rdi), %rsi
  30426d:      	vpinsrd	$0x3, %esi, %xmm1, %xmm1
  304273:      	shrq	$0x20, %rsi
  304277:      	vpinsrd	$0x2, %edx, %xmm0, %xmm0
  30427d:      	vpinsrd	$0x3, %esi, %xmm2, %xmm2
  304283:      	leaq	0x3(%rdi), %rsi
  304287:      	vpinsrd	$0x3, %esi, %xmm0, %xmm0
  30428d:      	shrq	$0x20, %rdx
  304291:      	shrq	$0x20, %rsi
  304295:      	vmovd	%eax, %xmm3
  304299:      	vpinsrd	$0x1, %ecx, %xmm3, %xmm3
  30429f:      	vpinsrd	$0x2, %edx, %xmm3, %xmm3
  3042a5:      	vinserti128	$0x1, %xmm1, %ymm0, %ymm4
  3042ab:      	vpinsrd	$0x3, %esi, %xmm3, %xmm0
  3042b1:      	vinserti128	$0x1, %xmm2, %ymm0, %ymm2
  3042b7:      	vmovaps	-0x22705f(%rip), %ymm0  # 0xdd260 <kbrainpoolP256r1FieldR+0x60>
  3042bf:      	vmovaps	%ymm0, 0x3e0(%rsp)
  3042c8:      	movq	0x20(%rsp), %rsi
  3042cd:      	movq	0x28(%rsp), %rax
  3042d2:      	vpbroadcastd	-0x225fab(%rip), %ymm9 # 0xde330 <kbrainpoolP224r1MontA+0xfd0>
  3042db:      	vpbroadcastd	-0x225f88(%rip), %ymm10 # 0xde35c <anon.9b5b727f87a45422a003fa990acdeb8e.70.llvm.17782113661035556056+0x8>
  3042e4:      	movq	0x30(%rsp), %rcx
  3042e9:      	vmovdqa	%ymm4, 0x3c0(%rsp)
  3042f2:      	vmovdqa	%ymm2, 0x3a0(%rsp)
  3042fb:      	vmovdqa	0x280(%rsp), %ymm7
  304304:      	vmovaps	0x260(%rsp), %ymm0
  30430d:      	vmovaps	%ymm0, 0x100(%rsp)
  304316:      	vmovaps	0x2a0(%rsp), %ymm0
  30431f:      	vmovaps	%ymm0, 0x160(%rsp)
  304328:      	vmovaps	0x340(%rsp), %ymm0
  304331:      	vmovaps	%ymm0, 0x200(%rsp)
  30433a:      	vmovaps	0x2e0(%rsp), %ymm0
  304343:      	vmovaps	%ymm0, 0x1e0(%rsp)
  30434c:      	vmovdqa	0x2c0(%rsp), %ymm6
  304355:      	vmovdqa	0x300(%rsp), %ymm13
  30435e:      	vmovdqa	0x360(%rsp), %ymm8
  304367:      	vmovdqa	0x220(%rsp), %ymm11
  304370:      	xorl	%edx, %edx
  304372:      	vmovdqa	0x320(%rsp), %ymm14
  30437b:      	vmovdqa	0x380(%rsp), %ymm1
  304384:      	vmovdqa	0x240(%rsp), %ymm12
  30438d:      	movq	%rbx, 0x1b8(%rsp)
  304395:      	movq	%r8, 0x1b0(%rsp)
  30439d:      	jmp	0x304685 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0xac5>
  3043a2:      	nopw	%cs:(%rax,%rax)
  3043b0:      	vmovdqa	0x100(%rsp), %ymm0
  3043b9:      	vmovdqa	0x1e0(%rsp), %ymm5
  3043c2:      	vpaddd	%ymm1, %ymm12, %ymm12
  3043c6:      	vpxor	%ymm4, %ymm12, %ymm15
  3043ca:      	vmovdqa	0x3e0(%rsp), %ymm4
  3043d3:      	vpshufb	%ymm4, %ymm15, %ymm15
  3043d8:      	vpaddd	%ymm15, %ymm14, %ymm14
  3043dd:      	vpxor	%ymm1, %ymm14, %ymm1
  3043e1:      	vpsrld	$0x14, %ymm1, %ymm3
  3043e6:      	vpslld	$0xc, %ymm1, %ymm1
  3043eb:      	vpor	%ymm3, %ymm1, %ymm1
  3043ef:      	vpaddd	%ymm1, %ymm12, %ymm12
  3043f3:      	vpxor	%ymm12, %ymm15, %ymm3
  3043f8:      	vmovdqa	-0x227260(%rip), %ymm15 # 0xdd1a0 <kP256MontGY+0x40>
  304400:      	vpshufb	%ymm15, %ymm3, %ymm3
  304405:      	vmovdqa	%ymm3, 0x1c0(%rsp)
  30440e:      	vpaddd	%ymm3, %ymm14, %ymm14
  304412:      	vpxor	%ymm1, %ymm14, %ymm1
  304416:      	vpsrld	$0x19, %ymm1, %ymm3
  30441b:      	vpslld	$0x7, %ymm1, %ymm1
  304420:      	vpor	%ymm3, %ymm1, %ymm1
  304424:      	vmovdqa	%ymm1, 0x140(%rsp)
  30442d:      	vpaddd	%ymm8, %ymm11, %ymm3
  304432:      	vpxor	%ymm3, %ymm2, %ymm2
  304436:      	vpshufb	%ymm4, %ymm2, %ymm2
  30443b:      	vpaddd	%ymm2, %ymm13, %ymm13
  30443f:      	vpxor	%ymm8, %ymm13, %ymm8
  304444:      	vpsrld	$0x14, %ymm8, %ymm11
  30444a:      	vpslld	$0xc, %ymm8, %ymm8
  304450:      	vpor	%ymm11, %ymm8, %ymm8
  304455:      	vpaddd	%ymm3, %ymm8, %ymm11
  304459:      	vpxor	%ymm2, %ymm11, %ymm2
  30445d:      	vpshufb	%ymm15, %ymm2, %ymm2
  304462:      	vpaddd	%ymm2, %ymm13, %ymm1
  304466:      	vmovdqa	%ymm1, 0x120(%rsp)
  30446f:      	vpxor	%ymm1, %ymm8, %ymm3
  304473:      	vpsrld	$0x19, %ymm3, %ymm8
  304478:      	vpslld	$0x7, %ymm3, %ymm3
  30447d:      	vpor	%ymm3, %ymm8, %ymm8
  304481:      	vpaddd	%ymm6, %ymm9, %ymm3
  304485:      	vpxor	%ymm3, %ymm7, %ymm7
  304489:      	vpshufb	%ymm4, %ymm7, %ymm7
  30448e:      	vmovdqa	%ymm4, %ymm13
  304492:      	vpaddd	%ymm7, %ymm5, %ymm4
  304496:      	vpxor	%ymm6, %ymm4, %ymm6
  30449a:      	vpsrld	$0x14, %ymm6, %ymm9
  30449f:      	vpslld	$0xc, %ymm6, %ymm6
  3044a4:      	vpor	%ymm6, %ymm9, %ymm6
  3044a8:      	vpaddd	%ymm3, %ymm6, %ymm9
  3044ac:      	vpxor	%ymm7, %ymm9, %ymm3
  3044b0:      	vpshufb	%ymm15, %ymm3, %ymm7
  3044b5:      	vpaddd	%ymm7, %ymm4, %ymm3
  3044b9:      	vpxor	%ymm6, %ymm3, %ymm4
  3044bd:      	vpsrld	$0x19, %ymm4, %ymm6
  3044c2:      	vpslld	$0x7, %ymm4, %ymm4
  3044c7:      	vpor	%ymm6, %ymm4, %ymm6
  3044cb:      	vmovdqa	0x200(%rsp), %ymm1
  3044d4:      	vpaddd	%ymm1, %ymm10, %ymm4
  3044d8:      	vpxor	%ymm4, %ymm0, %ymm10
  3044dc:      	vpshufb	%ymm13, %ymm10, %ymm5
  3044e1:      	vpaddd	0x160(%rsp), %ymm5, %ymm0
  3044ea:      	vpxor	%ymm1, %ymm0, %ymm10
  3044ee:      	vpsrld	$0x14, %ymm10, %ymm1
  3044f4:      	vpslld	$0xc, %ymm10, %ymm10
  3044fa:      	vpor	%ymm1, %ymm10, %ymm1
  3044fe:      	vpaddd	%ymm4, %ymm1, %ymm10
  304502:      	vpxor	%ymm5, %ymm10, %ymm4
  304506:      	vpshufb	%ymm15, %ymm4, %ymm4
  30450b:      	vpaddd	%ymm4, %ymm0, %ymm0
  30450f:      	vpxor	%ymm1, %ymm0, %ymm1
  304513:      	vpsrld	$0x19, %ymm1, %ymm5
  304518:      	vpslld	$0x7, %ymm1, %ymm1
  30451d:      	vpor	%ymm5, %ymm1, %ymm5
  304521:      	vpaddd	%ymm12, %ymm8, %ymm1
  304526:      	vpxor	%ymm1, %ymm4, %ymm4
  30452a:      	vpshufb	%ymm13, %ymm4, %ymm4
  30452f:      	vpaddd	%ymm4, %ymm3, %ymm3
  304533:      	vpxor	%ymm3, %ymm8, %ymm8
  304537:      	vpsrld	$0x14, %ymm8, %ymm12
  30453d:      	vpslld	$0xc, %ymm8, %ymm8
  304543:      	vpor	%ymm12, %ymm8, %ymm8
  304548:      	vpaddd	%ymm1, %ymm8, %ymm12
  30454c:      	vpxor	%ymm4, %ymm12, %ymm1
  304550:      	vpshufb	%ymm15, %ymm1, %ymm1
  304555:      	vmovdqa	%ymm1, 0x100(%rsp)
  30455e:      	vpaddd	%ymm1, %ymm3, %ymm1
  304562:      	vmovdqa	%ymm1, 0x1e0(%rsp)
  30456b:      	vpxor	%ymm1, %ymm8, %ymm1
  30456f:      	vpsrld	$0x19, %ymm1, %ymm3
  304574:      	vpslld	$0x7, %ymm1, %ymm1
  304579:      	vpor	%ymm3, %ymm1, %ymm8
  30457d:      	vpaddd	%ymm6, %ymm11, %ymm1
  304581:      	vpxor	0x1c0(%rsp), %ymm1, %ymm3
  30458a:      	vpshufb	%ymm13, %ymm3, %ymm3
  30458f:      	vpaddd	%ymm3, %ymm0, %ymm0
  304593:      	vpxor	%ymm6, %ymm0, %ymm6
  304597:      	vpsrld	$0x14, %ymm6, %ymm11
  30459c:      	vpslld	$0xc, %ymm6, %ymm6
  3045a1:      	vpor	%ymm6, %ymm11, %ymm6
  3045a5:      	vpaddd	%ymm1, %ymm6, %ymm11
  3045a9:      	vpxor	%ymm3, %ymm11, %ymm1
  3045ad:      	vpshufb	%ymm15, %ymm1, %ymm4
  3045b2:      	vpaddd	%ymm4, %ymm0, %ymm0
  3045b6:      	vmovdqa	%ymm0, 0x160(%rsp)
  3045bf:      	vpxor	%ymm6, %ymm0, %ymm0
  3045c3:      	vpsrld	$0x19, %ymm0, %ymm1
  3045c8:      	vpslld	$0x7, %ymm0, %ymm0
  3045cd:      	vpor	%ymm1, %ymm0, %ymm6
  3045d1:      	vpaddd	%ymm5, %ymm9, %ymm0
  3045d5:      	vpxor	%ymm0, %ymm2, %ymm1
  3045d9:      	vpshufb	%ymm13, %ymm1, %ymm1
  3045de:      	vpaddd	%ymm1, %ymm14, %ymm3
  3045e2:      	vpxor	%ymm3, %ymm5, %ymm2
  3045e6:      	vpsrld	$0x14, %ymm2, %ymm5
  3045eb:      	vpslld	$0xc, %ymm2, %ymm2
  3045f0:      	vpor	%ymm5, %ymm2, %ymm5
  3045f4:      	vpaddd	%ymm0, %ymm5, %ymm9
  3045f8:      	vpxor	%ymm1, %ymm9, %ymm0
  3045fc:      	vpshufb	%ymm15, %ymm0, %ymm2
  304601:      	vpaddd	%ymm2, %ymm3, %ymm14
  304605:      	vpxor	%ymm5, %ymm14, %ymm0
  304609:      	vpsrld	$0x19, %ymm0, %ymm1
  30460e:      	vpslld	$0x7, %ymm0, %ymm0
  304613:      	vpor	%ymm1, %ymm0, %ymm0
  304617:      	vmovdqa	%ymm0, 0x200(%rsp)
  304620:      	vmovdqa	0x140(%rsp), %ymm5
  304629:      	vpaddd	%ymm5, %ymm10, %ymm0
  30462d:      	vpxor	%ymm0, %ymm7, %ymm1
  304631:      	vpshufb	%ymm13, %ymm1, %ymm1
  304636:      	vpaddd	0x120(%rsp), %ymm1, %ymm3
  30463f:      	vpxor	%ymm5, %ymm3, %ymm5
  304643:      	vpsrld	$0x14, %ymm5, %ymm7
  304648:      	vpslld	$0xc, %ymm5, %ymm5
  30464d:      	vpor	%ymm7, %ymm5, %ymm5
  304651:      	vpaddd	%ymm0, %ymm5, %ymm10
  304655:      	vpxor	%ymm1, %ymm10, %ymm0
  304659:      	vpshufb	%ymm15, %ymm0, %ymm7
  30465e:      	vpaddd	%ymm7, %ymm3, %ymm13
  304662:      	vpxor	%ymm5, %ymm13, %ymm0
  304666:      	vpsrld	$0x19, %ymm0, %ymm1
  30466b:      	vpslld	$0x7, %ymm0, %ymm0
  304670:      	vpor	%ymm1, %ymm0, %ymm1
  304674:      	incq	%rdx
  304677:      	addq	$0x30, %r9
  30467b:      	cmpq	$0xa, %rdx
  30467f:      	je	0x304880 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0xcc0>
  304685:      	leaq	(%rdx,%rdx,2), %r11
  304689:      	leaq	(%rdx,%rdx,2), %r15
  30468d:      	addq	$0x3, %r15
  304691:      	cmpq	%r15, %r8
  304694:      	cmovbq	%r8, %r15
  304698:      	cmpq	%r11, %r8
  30469b:      	jbe	0x3043b0 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x7f0>
  3046a1:      	movq	%rdx, 0x120(%rsp)
  3046a9:      	movq	%r9, 0x140(%rsp)
  3046b1:      	movq	%r9, %r8
  3046b4:      	movq	0x18(%rsp), %r10
  3046b9:      	vmovdqa	0x100(%rsp), %ymm0
  3046c2:      	vmovdqa	0x1e0(%rsp), %ymm5
  3046cb:      	nopl	(%rax,%rax)
  3046d0:      	incq	%r11
  3046d3:      	addq	(%r8), %rsi
  3046d6:      	adcq	0x8(%r8), %rax
  3046da:      	adcq	$0x1, %rcx
  3046de:      	movq	%rsi, %rdx
  3046e1:      	mulxq	%r12, %r9, %rdi
  3046e6:      	movq	%rax, %rdx
  3046e9:      	mulxq	%r13, %rbx, %r14
  3046ee:      	addq	%r9, %rbx
  3046f1:      	adcq	%rdi, %r14
  3046f4:      	movq	%rsi, %rdx
  3046f7:      	mulxq	%r10, %rdi, %rsi
  3046fc:      	movq	%rax, %rdx
  3046ff:      	mulxq	%r12, %rax, %r9
  304704:      	addq	%rdi, %rax
  304707:      	adcq	%rsi, %r9
  30470a:      	movq	%rcx, %rdx
  30470d:      	mulxq	%r13, %rsi, %rdx
  304712:      	addq	%r14, %rax
  304715:      	adcq	$0x0, %r9
  304719:      	addq	%rsi, %rax
  30471c:      	adcq	%rdx, %r9
  30471f:      	imulq	%r12, %rcx
  304723:      	addq	%r9, %rcx
  304726:      	movq	%rcx, %rdx
  304729:      	shrq	$0x2, %rdx
  30472d:      	leaq	(%rdx,%rdx,4), %rsi
  304731:      	andl	$0x3, %ecx
  304734:      	addq	%rbx, %rsi
  304737:      	adcq	$0x0, %rax
  30473b:      	adcq	$0x0, %rcx
  30473f:      	addq	$0x10, %r8
  304743:      	cmpq	%r15, %r11
  304746:      	jb	0x3046d0 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0xb10>
  304748:      	movq	%rsi, 0x20(%rsp)
  30474d:      	movq	%rax, 0x28(%rsp)
  304752:      	movq	%rcx, 0x30(%rsp)
  304757:      	movq	0x1b8(%rsp), %rbx
  30475f:      	movq	0x1b0(%rsp), %r8
  304767:      	movq	0x140(%rsp), %r9
  30476f:      	movq	0x120(%rsp), %rdx
  304777:      	jmp	0x3043c2 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x802>
  30477c:      	nopl	(%rax)
  304780:      	movq	%r8, %r9
  304783:      	movq	%rbx, %r8
  304786:      	movq	%rdi, %rbx
  304789:      	cmpq	0x18(%rbp), %rdi
  30478d:      	ja	0x30531a <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x175a>
  304793:      	addq	%rsi, %r8
  304796:      	shrq	$0x4, %r9
  30479a:      	leaq	0x20(%rsp), %rax
  30479f:      	movq	%rax, 0x40(%rsp)
  3047a4:      	movq	%r12, 0x48(%rsp)
  3047a9:      	movq	%r11, 0x50(%rsp)
  3047ae:      	movq	%r13, 0x58(%rsp)
  3047b3:      	movq	0xf0(%rsp), %rdi
  3047bb:      	movq	0xe8(%rsp), %rsi
  3047c3:      	movq	%r10, 0x100(%rsp)
  3047cb:      	movq	%r10, %rcx
  3047ce:      	leaq	0x400(%rsp), %rax
  3047d6:      	pushq	%rax
  3047d7:      	leaq	0x48(%rsp), %rax
  3047dc:      	pushq	%rax
  3047dd:      	vzeroupper
  3047e0:      	callq	0x306c40 <toyos_crypto::arch::x86_64::chacha::avx2::keystream>
  3047e5:      	addq	$0x10, %rsp
  3047e9:      	cmpb	$0x0, 0x20(%rbp)
  3047ed:      	jne	0x3040be <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x4fe>
  3047f3:      	cmpq	%rbx, %r15
  3047f6:      	jbe	0x3040be <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x4fe>
  3047fc:      	movq	0x18(%rbp), %r14
  304800:      	movq	0x10(%rsp), %rdx
  304805:      	cmpq	%r14, %rdx
  304808:      	ja	0x305341 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x1781>
  30480e:      	movq	0x20(%rsp), %r9
  304813:      	movq	0x28(%rsp), %r8
  304818:      	movq	0x30(%rsp), %rax
  30481d:      	subq	%rbx, %rdx
  304820:      	movq	0x10(%rbp), %rcx
  304824:      	leaq	(%rcx,%rbx), %r10
  304828:      	cmpb	$0x0, 0x28(%rbp)
  30482c:      	je	0x3049ee <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0xe2e>
  304832:      	cmpq	$0x10, %rdx
  304836:      	movq	0x18(%rsp), %r11
  30483b:      	ja	0x305370 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x17b0>
  304841:      	je	0x30403d <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x47d>
  304847:      	cmpq	$0x7, %rdx
  30484b:      	movl	$0x0, %r14d
  304851:      	jbe	0x304b3a <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0xf7a>
  304857:      	movq	0x10(%rsp), %rsi
  30485c:      	movq	-0x8(%rcx,%rsi), %rsi
  304861:      	shll	$0x3, %edx
  304864:      	movb	$-0x80, %cl
  304866:      	subb	%dl, %cl
  304868:      	shrdq	%cl, %r14, %rsi
  30486c:      	movq	(%r10), %rdi
  30486f:      	testb	$0x40, %cl
  304872:      	cmovneq	%r14, %rsi
  304876:      	jmp	0x304044 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x484>
  30487b:      	nopl	(%rax,%rax)
  304880:      	cmpq	$0x1f0, 0x198(%rsp)     # imm = 0x1F0
  30488c:      	movq	0x18(%rbp), %r14
  304890:      	movq	0xd8(%rsp), %r15
  304898:      	movq	0x18(%rsp), %r11
  30489d:      	jb	0x30495e <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0xd9e>
  3048a3:      	cmpq	$0x20, %r8
  3048a7:      	movl	$0x1f, %eax
  3048ac:      	cmovbq	%rax, %r8
  3048b0:      	movq	0x20(%rsp), %rsi
  3048b5:      	movq	0x28(%rsp), %rcx
  3048ba:      	movq	0x30(%rsp), %rax
  3048bf:      	addq	0x190(%rsp), %rbx
  3048c7:      	addq	$-0x1e, %r8
  3048cb:      	nopl	(%rax,%rax)
  3048d0:      	addq	(%rbx), %rsi
  3048d3:      	adcq	0x8(%rbx), %rcx
  3048d7:      	adcq	$0x1, %rax
  3048db:      	movq	%rsi, %rdx
  3048de:      	mulxq	%r12, %r9, %rdi
  3048e3:      	movq	%rcx, %rdx
  3048e6:      	movq	%r8, %r14
  3048e9:      	mulxq	%r13, %r8, %r10
  3048ee:      	addq	%r9, %r8
  3048f1:      	adcq	%rdi, %r10
  3048f4:      	movq	%rsi, %rdx
  3048f7:      	mulxq	%r11, %rdi, %rsi
  3048fc:      	movq	%rcx, %rdx
  3048ff:      	mulxq	%r12, %rcx, %r9
  304904:      	addq	%rdi, %rcx
  304907:      	adcq	%rsi, %r9
  30490a:      	movq	%rax, %rdx
  30490d:      	mulxq	%r13, %rsi, %rdx
  304912:      	addq	%r10, %rcx
  304915:      	adcq	$0x0, %r9
  304919:      	addq	%rsi, %rcx
  30491c:      	adcq	%rdx, %r9
  30491f:      	imulq	%r12, %rax
  304923:      	addq	%r9, %rax
  304926:      	movq	%rax, %rdx
  304929:      	shrq	$0x2, %rdx
  30492d:      	leaq	(%rdx,%rdx,4), %rsi
  304931:      	andl	$0x3, %eax
  304934:      	addq	%r8, %rsi
  304937:      	movq	%r14, %r8
  30493a:      	adcq	$0x0, %rcx
  30493e:      	adcq	$0x0, %rax
  304942:      	addq	$0x10, %rbx
  304946:      	decq	%r8
  304949:      	jne	0x3048d0 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0xd10>
  30494b:      	movq	%rsi, 0x20(%rsp)
  304950:      	movq	%rcx, 0x28(%rsp)
  304955:      	movq	%rax, 0x30(%rsp)
  30495a:      	movq	0x18(%rbp), %r14
  30495e:      	movq	0x10(%rsp), %rax
  304963:      	movq	%rax, %rdx
  304966:      	movq	0xf8(%rsp), %rdi
  30496e:      	subq	%rdi, %rdx
  304971:      	jbe	0x304d89 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x11c9>
  304977:      	cmpq	%r14, %rax
  30497a:      	movq	0x10(%rbp), %rcx
  30497e:      	ja	0x30534d <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x178d>
  304984:      	movq	0x20(%rsp), %r9
  304989:      	movq	0x28(%rsp), %rbx
  30498e:      	movq	0x30(%rsp), %rax
  304993:      	addq	%rcx, %rdi
  304996:      	cmpb	$0x0, 0x28(%rbp)
  30499a:      	je	0x3049b7 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0xdf7>
  30499c:      	cmpq	$0x10, %rdx
  3049a0:      	ja	0x305370 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x17b0>
  3049a6:      	jne	0x304a11 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0xe51>
  3049a8:      	movq	%rdi, %rcx
  3049ab:      	movq	(%rdi), %rdi
  3049ae:      	movq	0x8(%rcx), %rsi
  3049b2:      	jmp	0x304c19 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x1059>
  3049b7:      	cmpq	$0x11, %rdx
  3049bb:      	jae	0x305370 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x17b0>
  3049c1:      	cmpq	$0x10, %rdx
  3049c5:      	movq	%rbx, 0x140(%rsp)
  3049cd:      	movq	%r9, 0x120(%rsp)
  3049d5:      	jne	0x304a41 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0xe81>
  3049d7:      	movq	(%rdi), %rcx
  3049da:      	movq	%rcx, 0x1c0(%rsp)
  3049e2:      	movq	0x8(%rdi), %r10
  3049e6:      	xorl	%r9d, %r9d
  3049e9:      	jmp	0x304c8d <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x10cd>
  3049ee:      	cmpq	$0x10, %rdx
  3049f2:      	ja	0x305370 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x17b0>
  3049f8:      	movq	%r8, 0x160(%rsp)
  304a00:      	jne	0x304a7f <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0xebf>
  304a02:      	movq	(%r10), %r11
  304a05:      	movq	0x8(%r10), %r14
  304a09:      	xorl	%r15d, %r15d
  304a0c:      	jmp	0x305168 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x15a8>
  304a11:      	cmpq	$0x7, %rdx
  304a15:      	jbe	0x304ab8 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0xef8>
  304a1b:      	movq	0x10(%rsp), %rsi
  304a20:      	movq	-0x8(%rcx,%rsi), %rsi
  304a25:      	shll	$0x3, %edx
  304a28:      	movb	$-0x80, %cl
  304a2a:      	subb	%dl, %cl
  304a2c:      	xorl	%edx, %edx
  304a2e:      	shrdq	%cl, %rdx, %rsi
  304a32:      	movq	(%rdi), %rdi
  304a35:      	testb	$0x40, %cl
  304a38:      	cmovneq	%rdx, %rsi
  304a3c:      	jmp	0x304c19 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x1059>
  304a41:      	cmpq	$0x7, %rdx
  304a45:      	jbe	0x304af3 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0xf33>
  304a4b:      	movq	0x10(%rsp), %rsi
  304a50:      	movq	-0x8(%rcx,%rsi), %r10
  304a55:      	leal	(,%rdx,8), %esi
  304a5c:      	movb	$-0x80, %cl
  304a5e:      	subb	%sil, %cl
  304a61:      	xorl	%r9d, %r9d
  304a64:      	shrdq	%cl, %r9, %r10
  304a68:      	movq	(%rdi), %rsi
  304a6b:      	movq	%rsi, 0x1c0(%rsp)
  304a73:      	testb	$0x40, %cl
  304a76:      	cmovneq	%r9, %r10
  304a7a:      	jmp	0x304c8d <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x10cd>
  304a7f:      	cmpq	$0x7, %rdx
  304a83:      	movl	$0x0, %r15d
  304a89:      	jbe	0x304b70 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0xfb0>
  304a8f:      	movq	0x10(%rsp), %rsi
  304a94:      	movq	-0x8(%rcx,%rsi), %r14
  304a99:      	leal	(,%rdx,8), %esi
  304aa0:      	movb	$-0x80, %cl
  304aa2:      	subb	%sil, %cl
  304aa5:      	shrdq	%cl, %r15, %r14
  304aa9:      	movq	(%r10), %r11
  304aac:      	testb	$0x40, %cl
  304aaf:      	cmovneq	%r15, %r14
  304ab3:      	jmp	0x305168 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x15a8>
  304ab8:      	cmpq	$0x4, %rdx
  304abc:      	jb	0x304bad <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0xfed>
  304ac2:      	movq	0x10(%rsp), %rsi
  304ac7:      	movq	%rdi, %r8
  304aca:      	movl	-0x4(%rcx,%rsi), %edi
  304ace:      	shll	$0x3, %edx
  304ad1:      	movb	$0x40, %cl
  304ad3:      	subb	%dl, %cl
  304ad5:      	xorl	%edx, %edx
  304ad7:      	shrdq	%cl, %rdx, %rdi
  304adb:      	testb	$0x40, %cl
  304ade:      	cmovneq	%rdx, %rdi
  304ae2:      	movl	(%r8), %ecx
  304ae5:      	shlq	$0x20, %rdi
  304ae9:      	orq	%rcx, %rdi
  304aec:      	xorl	%esi, %esi
  304aee:      	jmp	0x304c19 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x1059>
  304af3:      	cmpq	$0x4, %rdx
  304af7:      	jb	0x304c28 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x1068>
  304afd:      	movq	0x10(%rsp), %rsi
  304b02:      	movl	-0x4(%rcx,%rsi), %r8d
  304b07:      	leal	(,%rdx,8), %esi
  304b0e:      	movb	$0x40, %cl
  304b10:      	subb	%sil, %cl
  304b13:      	xorl	%r9d, %r9d
  304b16:      	shrdq	%cl, %r9, %r8
  304b1a:      	testb	$0x40, %cl
  304b1d:      	cmovneq	%r9, %r8
  304b21:      	movl	(%rdi), %ecx
  304b23:      	shlq	$0x20, %r8
  304b27:      	orq	%rcx, %r8
  304b2a:      	movq	%r8, 0x1c0(%rsp)
  304b32:      	xorl	%r10d, %r10d
  304b35:      	jmp	0x304c8d <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x10cd>
  304b3a:      	cmpq	$0x3, %rdx
  304b3e:      	jbe	0x30508c <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x14cc>
  304b44:      	movq	0x10(%rsp), %rsi
  304b49:      	movl	-0x4(%rcx,%rsi), %edi
  304b4d:      	shll	$0x3, %edx
  304b50:      	movb	$0x40, %cl
  304b52:      	subb	%dl, %cl
  304b54:      	shrdq	%cl, %r14, %rdi
  304b58:      	testb	$0x40, %cl
  304b5b:      	cmovneq	%r14, %rdi
  304b5f:      	movl	(%r10), %ecx
  304b62:      	shlq	$0x20, %rdi
  304b66:      	orq	%rcx, %rdi
  304b69:      	xorl	%esi, %esi
  304b6b:      	jmp	0x304044 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x484>
  304b70:      	cmpq	$0x3, %rdx
  304b74:      	jbe	0x305100 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x1540>
  304b7a:      	movq	0x10(%rsp), %rsi
  304b7f:      	movl	-0x4(%rcx,%rsi), %r11d
  304b84:      	leal	(,%rdx,8), %esi
  304b8b:      	movb	$0x40, %cl
  304b8d:      	subb	%sil, %cl
  304b90:      	shrdq	%cl, %r15, %r11
  304b94:      	testb	$0x40, %cl
  304b97:      	cmovneq	%r15, %r11
  304b9b:      	movl	(%r10), %ecx
  304b9e:      	shlq	$0x20, %r11
  304ba2:      	orq	%rcx, %r11
  304ba5:      	xorl	%r14d, %r14d
  304ba8:      	jmp	0x305168 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x15a8>
  304bad:      	movq	%rdx, %rcx
  304bb0:      	shrq	%rcx
  304bb3:      	movzbl	(%rdi,%rcx), %esi
  304bb7:      	shll	$0x3, %ecx
  304bba:      	xorl	%r11d, %r11d
  304bbd:      	shldq	%cl, %rsi, %r11
  304bc1:      	shlxq	%rcx, %rsi, %r10
  304bc6:      	testb	$0x40, %cl
  304bc9:      	cmovneq	%r10, %r11
  304bcd:      	movl	$0x0, %ecx
  304bd2:      	cmovneq	%rcx, %r10
  304bd6:      	movq	%r9, %r8
  304bd9:      	movq	%rdi, %r9
  304bdc:      	movzbl	-0x1(%rdi,%rdx), %edi
  304be1:      	decq	%rdx
  304be4:      	shll	$0x3, %edx
  304be7:      	xorl	%esi, %esi
  304be9:      	movl	%edx, %ecx
  304beb:      	shldq	%cl, %rdi, %rsi
  304bef:      	shlxq	%rdx, %rdi, %rdi
  304bf4:      	testb	$0x40, %dl
  304bf7:      	cmovneq	%rdi, %rsi
  304bfb:      	movl	$0x0, %ecx
  304c00:      	cmovneq	%rcx, %rdi
  304c04:      	movzbl	(%r9), %ecx
  304c08:      	movq	%r8, %r9
  304c0b:      	orq	%r11, %rsi
  304c0e:      	movq	0x18(%rsp), %r11
  304c13:      	orq	%rcx, %rdi
  304c16:      	orq	%r10, %rdi
  304c19:      	addq	%r9, %rdi
  304c1c:      	adcq	%rbx, %rsi
  304c1f:      	adcq	$0x1, %rax
  304c23:      	jmp	0x304d13 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x1153>
  304c28:      	movq	%rdx, %rcx
  304c2b:      	shrq	%rcx
  304c2e:      	movzbl	(%rdi,%rcx), %esi
  304c32:      	shll	$0x3, %ecx
  304c35:      	movq	%rdi, %r11
  304c38:      	xorl	%edi, %edi
  304c3a:      	shldq	%cl, %rsi, %rdi
  304c3e:      	shlxq	%rcx, %rsi, %rsi
  304c43:      	testb	$0x40, %cl
  304c46:      	cmovneq	%rsi, %rdi
  304c4a:      	movl	$0x0, %r9d
  304c50:      	cmovneq	%r9, %rsi
  304c54:      	leaq	-0x1(%rdx), %rcx
  304c58:      	movzbl	-0x1(%r11,%rdx), %r8d
  304c5e:      	shll	$0x3, %ecx
  304c61:      	xorl	%r10d, %r10d
  304c64:      	shldq	%cl, %r8, %r10
  304c68:      	shlxq	%rcx, %r8, %r8
  304c6d:      	testb	$0x40, %cl
  304c70:      	cmovneq	%r8, %r10
  304c74:      	cmovneq	%r9, %r8
  304c78:      	movzbl	(%r11), %ecx
  304c7c:      	orq	%rdi, %r10
  304c7f:      	orq	%rcx, %r8
  304c82:      	orq	%rsi, %r8
  304c85:      	movq	%r8, 0x1c0(%rsp)
  304c8d:      	leal	(,%rdx,8), %ecx
  304c94:      	movq	$-0x1, %rsi
  304c9b:      	shldq	%cl, %rsi, %rsi
  304c9f:      	xorl	%ebx, %ebx
  304ca1:      	movl	$0x1, %r11d
  304ca7:      	shldq	%cl, %r11, %rbx
  304cab:      	movq	$-0x1, %r8
  304cb2:      	shlxq	%rcx, %r8, %rdi
  304cb7:      	testb	$0x40, %cl
  304cba:      	cmovneq	%rdi, %rsi
  304cbe:      	cmovneq	%r9, %rdi
  304cc2:      	shlxq	%rcx, %r11, %rcx
  304cc7:      	cmovneq	%rcx, %rbx
  304ccb:      	cmovneq	%r9, %rcx
  304ccf:      	cmpq	$0x10, %rdx
  304cd3:      	notq	%rsi
  304cd6:      	notq	%rdi
  304cd9:      	cmoveq	%r8, %rsi
  304cdd:      	cmoveq	%r8, %rdi
  304ce1:      	cmoveq	%r9, %rbx
  304ce5:      	cmoveq	%r9, %rcx
  304ce9:      	andq	%r10, %rsi
  304cec:      	orq	%rbx, %rsi
  304cef:      	andq	0x1c0(%rsp), %rdi
  304cf7:      	orq	%rcx, %rdi
  304cfa:      	addq	0x120(%rsp), %rdi
  304d02:      	adcq	0x140(%rsp), %rsi
  304d0a:      	adcq	$0x0, %rax
  304d0e:      	movq	0x18(%rsp), %r11
  304d13:      	movq	%rdi, %rdx
  304d16:      	mulxq	%r12, %r9, %r8
  304d1b:      	movq	%rsi, %rdx
  304d1e:      	mulxq	%r13, %rcx, %r10
  304d23:      	addq	%r9, %rcx
  304d26:      	adcq	%r8, %r10
  304d29:      	movq	%rdi, %rdx
  304d2c:      	mulxq	%r11, %r8, %rdi
  304d31:      	movq	%rsi, %rdx
  304d34:      	mulxq	%r12, %rsi, %r9
  304d39:      	movq	%rax, %rdx
  304d3c:      	mulxq	%r13, %r11, %rdx
  304d41:      	addq	%r8, %rsi
  304d44:      	adcq	%rdi, %r9
  304d47:      	addq	%r11, %rsi
  304d4a:      	movq	0x18(%rsp), %r11
  304d4f:      	adcq	%rdx, %r9
  304d52:      	imulq	%r12, %rax
  304d56:      	addq	%r10, %rsi
  304d59:      	adcq	%r9, %rax
  304d5c:      	movq	%rax, %rdx
  304d5f:      	shrq	$0x2, %rdx
  304d63:      	leaq	(%rdx,%rdx,4), %rdx
  304d67:      	andl	$0x3, %eax
  304d6a:      	addq	%rcx, %rdx
  304d6d:      	adcq	$0x0, %rsi
  304d71:      	adcq	$0x0, %rax
  304d75:      	movq	%rdx, 0x20(%rsp)
  304d7a:      	movq	%rsi, 0x28(%rsp)
  304d7f:      	movq	%rax, 0x30(%rsp)
  304d84:      	movq	0x10(%rsp), %rax
  304d89:      	cmpq	%r14, 0xd0(%rsp)
  304d91:      	movq	0x10(%rbp), %rsi
  304d95:      	ja	0x30532d <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x176d>
  304d9b:      	vpaddd	0x3a0(%rsp), %ymm2, %ymm0
  304da4:      	vpaddd	0x3c0(%rsp), %ymm4, %ymm15
  304dad:      	vpbroadcastd	-0x226a5a(%rip), %ymm2 # 0xde35c <anon.9b5b727f87a45422a003fa990acdeb8e.70.llvm.17782113661035556056+0x8>
  304db6:      	vpaddd	%ymm2, %ymm10, %ymm2
  304dba:      	vpbroadcastd	-0x226a93(%rip), %ymm3 # 0xde330 <kbrainpoolP224r1MontA+0xfd0>
  304dc3:      	vpaddd	%ymm3, %ymm9, %ymm3
  304dc7:      	vpaddd	0x220(%rsp), %ymm11, %ymm5
  304dd0:      	vpaddd	0x240(%rsp), %ymm12, %ymm9
  304dd9:      	vpunpckldq	%ymm5, %ymm9, %ymm12 # ymm12 = ymm9[0],ymm5[0],ymm9[1],ymm5[1],ymm9[4],ymm5[4],ymm9[5],ymm5[5]
  304ddd:      	vpunpckhdq	%ymm5, %ymm9, %ymm4 # ymm4 = ymm9[2],ymm5[2],ymm9[3],ymm5[3],ymm9[6],ymm5[6],ymm9[7],ymm5[7]
  304de1:      	vmovdqa	%ymm4, 0x140(%rsp)
  304dea:      	vpunpckldq	%ymm2, %ymm3, %ymm5 # ymm5 = ymm3[0],ymm2[0],ymm3[1],ymm2[1],ymm3[4],ymm2[4],ymm3[5],ymm2[5]
  304dee:      	vpunpckhdq	%ymm2, %ymm3, %ymm2 # ymm2 = ymm3[2],ymm2[2],ymm3[3],ymm2[3],ymm3[6],ymm2[6],ymm3[7],ymm2[7]
  304df2:      	vmovdqa	%ymm2, 0x120(%rsp)
  304dfb:      	vpunpcklqdq	%ymm5, %ymm12, %ymm11 # ymm11 = ymm12[0],ymm5[0],ymm12[2],ymm5[2]
  304dff:      	vpunpckhqdq	%ymm5, %ymm12, %ymm9 # ymm9 = ymm12[1],ymm5[1],ymm12[3],ymm5[3]
  304e03:      	vpaddd	0x360(%rsp), %ymm8, %ymm3
  304e0c:      	vpaddd	0x380(%rsp), %ymm1, %ymm1
  304e15:      	vpunpckldq	%ymm3, %ymm1, %ymm8 # ymm8 = ymm1[0],ymm3[0],ymm1[1],ymm3[1],ymm1[4],ymm3[4],ymm1[5],ymm3[5]
  304e19:      	vpunpckhdq	%ymm3, %ymm1, %ymm10 # ymm10 = ymm1[2],ymm3[2],ymm1[3],ymm3[3],ymm1[6],ymm3[6],ymm1[7],ymm3[7]
  304e1d:      	vmovdqa	0x200(%rsp), %ymm1
  304e26:      	vpaddd	0x340(%rsp), %ymm1, %ymm3
  304e2f:      	vpaddd	0x2c0(%rsp), %ymm6, %ymm5
  304e38:      	vpunpckldq	%ymm3, %ymm5, %ymm6 # ymm6 = ymm5[0],ymm3[0],ymm5[1],ymm3[1],ymm5[4],ymm3[4],ymm5[5],ymm3[5]
  304e3c:      	vpunpckhdq	%ymm3, %ymm5, %ymm5 # ymm5 = ymm5[2],ymm3[2],ymm5[3],ymm3[3],ymm5[6],ymm3[6],ymm5[7],ymm3[7]
  304e40:      	vpunpcklqdq	%ymm6, %ymm8, %ymm12 # ymm12 = ymm8[0],ymm6[0],ymm8[2],ymm6[2]
  304e44:      	vpunpckhqdq	%ymm6, %ymm8, %ymm8 # ymm8 = ymm8[1],ymm6[1],ymm8[3],ymm6[3]
  304e48:      	vpaddd	0x300(%rsp), %ymm13, %ymm3
  304e51:      	vpaddd	0x320(%rsp), %ymm14, %ymm6
  304e5a:      	vpunpckldq	%ymm3, %ymm6, %ymm13 # ymm13 = ymm6[0],ymm3[0],ymm6[1],ymm3[1],ymm6[4],ymm3[4],ymm6[5],ymm3[5]
  304e5e:      	vpunpckhdq	%ymm3, %ymm6, %ymm6 # ymm6 = ymm6[2],ymm3[2],ymm6[3],ymm3[3],ymm6[6],ymm3[6],ymm6[7],ymm3[7]
  304e62:      	vmovdqa	0x160(%rsp), %ymm1
  304e6b:      	vpaddd	0x2a0(%rsp), %ymm1, %ymm3
  304e74:      	vmovdqa	0x1e0(%rsp), %ymm1
  304e7d:      	vpaddd	0x2e0(%rsp), %ymm1, %ymm4
  304e86:      	vpunpckldq	%ymm3, %ymm4, %ymm14 # ymm14 = ymm4[0],ymm3[0],ymm4[1],ymm3[1],ymm4[4],ymm3[4],ymm4[5],ymm3[5]
  304e8a:      	vpunpckhdq	%ymm3, %ymm4, %ymm3 # ymm3 = ymm4[2],ymm3[2],ymm4[3],ymm3[3],ymm4[6],ymm3[6],ymm4[7],ymm3[7]
  304e8e:      	vpunpcklqdq	%ymm14, %ymm13, %ymm4 # ymm4 = ymm13[0],ymm14[0],ymm13[2],ymm14[2]
  304e93:      	vpunpckhqdq	%ymm14, %ymm13, %ymm13 # ymm13 = ymm13[1],ymm14[1],ymm13[3],ymm14[3]
  304e98:      	vpunpckldq	%ymm0, %ymm15, %ymm14 # ymm14 = ymm15[0],ymm0[0],ymm15[1],ymm0[1],ymm15[4],ymm0[4],ymm15[5],ymm0[5]
  304e9c:      	vpunpckhdq	%ymm0, %ymm15, %ymm2 # ymm2 = ymm15[2],ymm0[2],ymm15[3],ymm0[3],ymm15[6],ymm0[6],ymm15[7],ymm0[7]
  304ea0:      	vmovdqa	0x100(%rsp), %ymm0
  304ea9:      	vpaddd	0x260(%rsp), %ymm0, %ymm15
  304eb2:      	vpaddd	0x280(%rsp), %ymm7, %ymm7
  304ebb:      	vpunpckldq	%ymm15, %ymm7, %ymm0 # ymm0 = ymm7[0],ymm15[0],ymm7[1],ymm15[1],ymm7[4],ymm15[4],ymm7[5],ymm15[5]
  304ec0:      	vpunpckhdq	%ymm15, %ymm7, %ymm7 # ymm7 = ymm7[2],ymm15[2],ymm7[3],ymm15[3],ymm7[6],ymm15[6],ymm7[7],ymm15[7]
  304ec5:      	vpunpcklqdq	%ymm0, %ymm14, %ymm15 # ymm15 = ymm14[0],ymm0[0],ymm14[2],ymm0[2]
  304ec9:      	vpunpckhqdq	%ymm0, %ymm14, %ymm0 # ymm0 = ymm14[1],ymm0[1],ymm14[3],ymm0[3]
  304ecd:      	vinserti128	$0x1, %xmm12, %ymm11, %ymm14
  304ed3:      	vpxor	(%rsi,%r15), %ymm14, %ymm14
  304ed9:      	vperm2i128	$0x31, %ymm15, %ymm4, %ymm1 # ymm1 = ymm4[2,3],ymm15[2,3]
  304edf:      	vinserti128	$0x1, %xmm15, %ymm4, %ymm4
  304ee5:      	vmovdqu	%ymm14, (%rsi,%r15)
  304eeb:      	vpxor	0x20(%rsi,%r15), %ymm4, %ymm4
  304ef2:      	vperm2i128	$0x31, %ymm12, %ymm11, %ymm11 # ymm11 = ymm11[2,3],ymm12[2,3]
  304ef8:      	vmovdqu	%ymm4, 0x20(%rsi,%r15)
  304eff:      	vpxor	0x100(%rsi,%r15), %ymm11, %ymm4
  304f09:      	vmovdqu	%ymm4, 0x100(%rsi,%r15)
  304f13:      	vmovdqa	0x140(%rsp), %ymm12
  304f1c:      	vmovdqa	0x120(%rsp), %ymm14
  304f25:      	vpunpcklqdq	%ymm14, %ymm12, %ymm4 # ymm4 = ymm12[0],ymm14[0],ymm12[2],ymm14[2]
  304f2a:      	vpxor	0x120(%rsi,%r15), %ymm1, %ymm1
  304f34:      	vmovdqu	%ymm1, 0x120(%rsi,%r15)
  304f3e:      	vperm2i128	$0x31, %ymm0, %ymm13, %ymm1 # ymm1 = ymm13[2,3],ymm0[2,3]
  304f44:      	vinserti128	$0x1, %xmm0, %ymm13, %ymm0
  304f4a:      	vperm2i128	$0x31, %ymm8, %ymm9, %ymm11 # ymm11 = ymm9[2,3],ymm8[2,3]
  304f50:      	vinserti128	$0x1, %xmm8, %ymm9, %ymm8
  304f56:      	vpunpcklqdq	%ymm5, %ymm10, %ymm9 # ymm9 = ymm10[0],ymm5[0],ymm10[2],ymm5[2]
  304f5a:      	vpxor	0x40(%rsi,%r15), %ymm8, %ymm8
  304f61:      	vmovdqu	%ymm8, 0x40(%rsi,%r15)
  304f68:      	vpunpcklqdq	%ymm3, %ymm6, %ymm8 # ymm8 = ymm6[0],ymm3[0],ymm6[2],ymm3[2]
  304f6c:      	vpxor	0x60(%rsi,%r15), %ymm0, %ymm0
  304f73:      	vmovdqu	%ymm0, 0x60(%rsi,%r15)
  304f7a:      	vpunpcklqdq	%ymm7, %ymm2, %ymm0 # ymm0 = ymm2[0],ymm7[0],ymm2[2],ymm7[2]
  304f7e:      	vpxor	0x140(%rsi,%r15), %ymm11, %ymm11
  304f88:      	vmovdqu	%ymm11, 0x140(%rsi,%r15)
  304f92:      	vpxor	0x160(%rsi,%r15), %ymm1, %ymm1
  304f9c:      	vmovdqu	%ymm1, 0x160(%rsi,%r15)
  304fa6:      	vperm2i128	$0x31, %ymm0, %ymm8, %ymm1 # ymm1 = ymm8[2,3],ymm0[2,3]
  304fac:      	vinserti128	$0x1, %xmm9, %ymm4, %ymm11
  304fb2:      	vpxor	0x80(%rsi,%r15), %ymm11, %ymm11
  304fbc:      	vinserti128	$0x1, %xmm0, %ymm8, %ymm0
  304fc2:      	vmovdqu	%ymm11, 0x80(%rsi,%r15)
  304fcc:      	vpxor	0xa0(%rsi,%r15), %ymm0, %ymm0
  304fd6:      	vperm2i128	$0x31, %ymm9, %ymm4, %ymm4 # ymm4 = ymm4[2,3],ymm9[2,3]
  304fdc:      	vmovdqu	%ymm0, 0xa0(%rsi,%r15)
  304fe6:      	vpxor	0x180(%rsi,%r15), %ymm4, %ymm0
  304ff0:      	vmovdqu	%ymm0, 0x180(%rsi,%r15)
  304ffa:      	vpxor	0x1a0(%rsi,%r15), %ymm1, %ymm0
  305004:      	vmovdqu	%ymm0, 0x1a0(%rsi,%r15)
  30500e:      	vpunpckhqdq	%ymm7, %ymm2, %ymm0 # ymm0 = ymm2[1],ymm7[1],ymm2[3],ymm7[3]
  305012:      	vpunpckhqdq	%ymm3, %ymm6, %ymm1 # ymm1 = ymm6[1],ymm3[1],ymm6[3],ymm3[3]
  305016:      	vpunpckhqdq	%ymm5, %ymm10, %ymm2 # ymm2 = ymm10[1],ymm5[1],ymm10[3],ymm5[3]
  30501a:      	vpunpckhqdq	%ymm14, %ymm12, %ymm3 # ymm3 = ymm12[1],ymm14[1],ymm12[3],ymm14[3]
  30501f:      	vperm2i128	$0x31, %ymm0, %ymm1, %ymm4 # ymm4 = ymm1[2,3],ymm0[2,3]
  305025:      	vinserti128	$0x1, %xmm2, %ymm3, %ymm5
  30502b:      	vpxor	0xc0(%rsi,%r15), %ymm5, %ymm5
  305035:      	vinserti128	$0x1, %xmm0, %ymm1, %ymm0
  30503b:      	vmovdqu	%ymm5, 0xc0(%rsi,%r15)
  305045:      	vpxor	0xe0(%rsi,%r15), %ymm0, %ymm0
  30504f:      	vperm2i128	$0x31, %ymm2, %ymm3, %ymm1 # ymm1 = ymm3[2,3],ymm2[2,3]
  305055:      	vmovdqu	%ymm0, 0xe0(%rsi,%r15)
  30505f:      	vpxor	0x1c0(%rsi,%r15), %ymm1, %ymm0
  305069:      	vmovdqu	%ymm0, 0x1c0(%rsi,%r15)
  305073:      	vpxor	0x1e0(%rsi,%r15), %ymm4, %ymm0
  30507d:      	vmovdqu	%ymm0, 0x1e0(%rsi,%r15)
  305087:      	jmp	0x3040f8 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x538>
  30508c:      	movl	$0x0, %edi
  305091:      	movl	$0x0, %esi
  305096:      	cmpq	%rbx, 0x10(%rsp)
  30509b:      	je	0x304044 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x484>
  3050a1:      	movq	%rdx, %rcx
  3050a4:      	shrq	%rcx
  3050a7:      	movzbl	(%r10,%rcx), %esi
  3050ac:      	shll	$0x3, %ecx
  3050af:      	xorl	%ebx, %ebx
  3050b1:      	shldq	%cl, %rsi, %rbx
  3050b5:      	shlxq	%rcx, %rsi, %r11
  3050ba:      	testb	$0x40, %cl
  3050bd:      	cmovneq	%r11, %rbx
  3050c1:      	cmovneq	%r14, %r11
  3050c5:      	movzbl	-0x1(%r10,%rdx), %edi
  3050cb:      	decq	%rdx
  3050ce:      	shll	$0x3, %edx
  3050d1:      	xorl	%esi, %esi
  3050d3:      	movl	%edx, %ecx
  3050d5:      	shldq	%cl, %rdi, %rsi
  3050d9:      	shlxq	%rdx, %rdi, %rdi
  3050de:      	testb	$0x40, %dl
  3050e1:      	cmovneq	%rdi, %rsi
  3050e5:      	cmovneq	%r14, %rdi
  3050e9:      	movzbl	(%r10), %ecx
  3050ed:      	orq	%rbx, %rsi
  3050f0:      	orq	%rcx, %rdi
  3050f3:      	orq	%r11, %rdi
  3050f6:      	movq	0x18(%rsp), %r11
  3050fb:      	jmp	0x304044 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x484>
  305100:      	movl	$0x0, %r11d
  305106:      	movl	$0x0, %r14d
  30510c:      	cmpq	%rbx, 0x10(%rsp)
  305111:      	je	0x305168 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x15a8>
  305113:      	movq	%rdx, %rcx
  305116:      	shrq	%rcx
  305119:      	movzbl	(%r10,%rcx), %esi
  30511e:      	shll	$0x3, %ecx
  305121:      	xorl	%edi, %edi
  305123:      	shldq	%cl, %rsi, %rdi
  305127:      	shlxq	%rcx, %rsi, %rsi
  30512c:      	testb	$0x40, %cl
  30512f:      	cmovneq	%rsi, %rdi
  305133:      	cmovneq	%r15, %rsi
  305137:      	leaq	-0x1(%rdx), %rcx
  30513b:      	movzbl	-0x1(%r10,%rdx), %r11d
  305141:      	shll	$0x3, %ecx
  305144:      	xorl	%r14d, %r14d
  305147:      	shldq	%cl, %r11, %r14
  30514b:      	shlxq	%rcx, %r11, %r11
  305150:      	testb	$0x40, %cl
  305153:      	cmovneq	%r11, %r14
  305157:      	cmovneq	%r15, %r11
  30515b:      	movzbl	(%r10), %ecx
  30515f:      	orq	%rdi, %r14
  305162:      	orq	%rcx, %r11
  305165:      	orq	%rsi, %r11
  305168:      	leal	(,%rdx,8), %ecx
  30516f:      	movq	$-0x1, %rsi
  305176:      	shldq	%cl, %rsi, %rsi
  30517a:      	xorl	%r10d, %r10d
  30517d:      	movl	$0x1, %r8d
  305183:      	shldq	%cl, %r8, %r10
  305187:      	movq	$-0x1, %rbx
  30518e:      	shlxq	%rcx, %rbx, %rdi
  305193:      	testb	$0x40, %cl
  305196:      	cmovneq	%rdi, %rsi
  30519a:      	cmovneq	%r15, %rdi
  30519e:      	shlxq	%rcx, %r8, %rcx
  3051a3:      	cmovneq	%rcx, %r10
  3051a7:      	cmovneq	%r15, %rcx
  3051ab:      	cmpq	$0x10, %rdx
  3051af:      	notq	%rsi
  3051b2:      	notq	%rdi
  3051b5:      	cmoveq	%rbx, %rsi
  3051b9:      	cmoveq	%rbx, %rdi
  3051bd:      	cmoveq	%r15, %r10
  3051c1:      	cmoveq	%r15, %rcx
  3051c5:      	andq	%r14, %rsi
  3051c8:      	orq	%r10, %rsi
  3051cb:      	andq	%r11, %rdi
  3051ce:      	orq	%rcx, %rdi
  3051d1:      	addq	%r9, %rdi
  3051d4:      	adcq	0x160(%rsp), %rsi
  3051dc:      	adcq	$0x0, %rax
  3051e0:      	movq	0x18(%rsp), %r11
  3051e5:      	jmp	0x30404e <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x48e>
  3051ea:      	movq	0x18(%rbp), %r14
  3051ee:      	movq	0x10(%rbp), %rsi
  3051f2:      	jmp	0x305239 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x1679>
  3051f4:      	cmpq	$0x0, 0xc0(%rsp)
  3051fd:      	movzbl	0x28(%rbp), %r13d
  305202:      	jne	0x305407 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x1847>
  305208:      	movq	0x30(%rsp), %rax
  30520d:      	leaq	0xa8(%rsp), %rcx
  305215:      	movq	%rax, 0x10(%rcx)
  305219:      	vmovdqa	0x20(%rsp), %xmm0
  30521f:      	vmovdqu	%xmm0, (%rcx)
  305223:      	movq	0x10(%rsp), %rbx
  305228:      	cmpq	%r14, %rbx
  30522b:      	movq	0x188(%rsp), %r12
  305233:      	ja	0x305391 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x17d1>
  305239:      	subq	%rbx, %r14
  30523c:      	addq	%rbx, %rsi
  30523f:      	testb	%r13b, %r13b
  305242:      	je	0x305256 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x1696>
  305244:      	leaq	0x70(%rsp), %rdi
  305249:      	movq	%r14, %rdx
  30524c:      	vzeroupper
  30524f:      	callq	0x307aa0 <<toyos_crypto::poly1305::Poly1305>::update_padded>
  305254:      	jmp	0x305266 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x16a6>
  305256:      	leaq	0x70(%rsp), %rdi
  30525b:      	movq	%r14, %rdx
  30525e:      	vzeroupper
  305261:      	callq	0x3080c0 <<toyos_crypto::poly1305::Poly1305>::update>
  305266:      	vmovups	0x70(%rsp), %ymm0
  30526c:      	vmovups	0x90(%rsp), %ymm1
  305275:      	vmovups	0xa8(%rsp), %ymm2
  30527e:      	vmovups	%ymm2, 0x38(%r12)
  305285:      	vmovups	%ymm1, 0x20(%r12)
  30528c:      	vmovups	%ymm0, (%r12)
  305292:      	leaq	0x430(%rsp), %rax
  30529a:      	xorl	%ecx, %ecx
  30529c:      	vxorps	%xmm0, %xmm0, %xmm0
  3052a0:      	vmovaps	%xmm0, 0x70(%rsp)
  3052a6:      	vmovaps	0x70(%rsp), %xmm1
  3052ac:      	vmovups	%xmm1, -0x30(%rax,%rcx)
  3052b2:      	vmovaps	%xmm0, 0x70(%rsp)
  3052b8:      	vmovaps	0x70(%rsp), %xmm1
  3052be:      	vmovups	%xmm1, -0x20(%rax,%rcx)
  3052c4:      	vmovaps	%xmm0, 0x70(%rsp)
  3052ca:      	vmovaps	0x70(%rsp), %xmm1
  3052d0:      	vmovups	%xmm1, -0x10(%rax,%rcx)
  3052d6:      	vmovaps	%xmm0, 0x70(%rsp)
  3052dc:      	vmovaps	0x70(%rsp), %xmm1
  3052e2:      	vmovups	%xmm1, (%rax,%rcx)
  3052e7:      	addq	$0x40, %rcx
  3052eb:      	cmpq	$0x200, %rcx            # imm = 0x200
  3052f2:      	jne	0x3052a0 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x16e0>
  3052f4:      	movq	%r12, %rax
  3052f7:      	leaq	-0x28(%rbp), %rsp
  3052fb:      	popq	%rbx
  3052fc:      	popq	%r12
  3052fe:      	popq	%r13
  305300:      	popq	%r14
  305302:      	popq	%r15
  305304:      	popq	%rbp
  305305:      	vzeroupper
  305308:      	retq
  305309:      	leaq	0x501e90(%rip), %rcx    # 0x8071a0 <anon.82512870eb8e0132f6a040156ea4d9cc.5.llvm.900034671349249464+0x180>
  305310:      	movq	0xf8(%rsp), %rsi
  305318:      	jmp	0x30535c <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x179c>
  30531a:      	movq	0x18(%rbp), %r14
  30531e:      	leaq	0x501e33(%rip), %rcx    # 0x807158 <anon.82512870eb8e0132f6a040156ea4d9cc.5.llvm.900034671349249464+0x138>
  305325:      	movq	%rbx, %rsi
  305328:      	movq	%r8, %rbx
  30532b:      	jmp	0x30535c <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x179c>
  30532d:      	movq	%r15, %rbx
  305330:      	movq	0xd0(%rsp), %rsi
  305338:      	leaq	0x501e91(%rip), %rcx    # 0x8071d0 <anon.82512870eb8e0132f6a040156ea4d9cc.5.llvm.900034671349249464+0x1b0>
  30533f:      	jmp	0x30535c <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x179c>
  305341:      	movq	%rdx, %rsi
  305344:      	leaq	0x501e25(%rip), %rcx    # 0x807170 <anon.82512870eb8e0132f6a040156ea4d9cc.5.llvm.900034671349249464+0x150>
  30534b:      	jmp	0x30535c <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x179c>
  30534d:      	movq	%rdi, %rbx
  305350:      	movq	0x10(%rsp), %rsi
  305355:      	leaq	0x501e5c(%rip), %rcx    # 0x8071b8 <anon.82512870eb8e0132f6a040156ea4d9cc.5.llvm.900034671349249464+0x198>
  30535c:      	movq	%rbx, %rdi
  30535f:      	movq	%r14, %rdx
  305362:      	vzeroupper
  305365:      	callq	*0x573eb5(%rip)         # 0x879220 <sdallocx+0x879220>
  30536b:      	jmp	0x305423 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x1863>
  305370:      	leaq	-0x1f1657(%rip), %rdi   # 0x113d20 <anon.8939df2432453ca20e81ebdf34edf285.11.llvm.7823267031421506494+0x138>
  305377:      	leaq	0x501d4a(%rip), %rdx    # 0x8070c8 <anon.82512870eb8e0132f6a040156ea4d9cc.5.llvm.900034671349249464+0xa8>
  30537e:      	movl	$0x19, %esi
  305383:      	vzeroupper
  305386:      	callq	*0x5741bc(%rip)         # 0x879548 <sdallocx+0x879548>
  30538c:      	jmp	0x305423 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x1863>
  305391:      	leaq	0x501d48(%rip), %rcx    # 0x8070e0 <anon.82512870eb8e0132f6a040156ea4d9cc.5.llvm.900034671349249464+0xc0>
  305398:      	movq	%r14, %rsi
  30539b:      	jmp	0x30535c <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x179c>
  30539d:      	leaq	-0x1f9001(%rip), %rdi   # 0x10c3a3 <anon.c56c1341f9eca924452ad7ec8b6629da.5.llvm.9545940554084088979>
  3053a4:      	leaq	0x5016d5(%rip), %rcx    # 0x806a80 <anon.c56c1341f9eca924452ad7ec8b6629da.1.llvm.9545940554084088979>
  3053ab:      	movl	$0x237, %esi            # imm = 0x237
  3053b0:      	xorl	%edx, %edx
  3053b2:      	callq	*0x574d30(%rip)         # 0x87a0e8 <sdallocx+0x87a0e8>
  3053b8:      	leaq	0x501d69(%rip), %rdi    # 0x807128 <anon.82512870eb8e0132f6a040156ea4d9cc.5.llvm.900034671349249464+0x108>
  3053bf:      	vzeroupper
  3053c2:      	callq	*0x574d18(%rip)         # 0x87a0e0 <sdallocx+0x87a0e0>
  3053c8:      	jmp	0x305423 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x1863>
  3053ca:      	leaq	0x501d6f(%rip), %rax    # 0x807140 <anon.82512870eb8e0132f6a040156ea4d9cc.5.llvm.900034671349249464+0x120>
  3053d1:      	movq	%rax, 0xe0(%rsp)
  3053d9:      	movq	0xe0(%rsp), %rdi
  3053e1:      	vzeroupper
  3053e4:      	callq	*0x574d0e(%rip)         # 0x87a0f8 <sdallocx+0x87a0f8>
  3053ea:      	jmp	0x305423 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x1863>
  3053ec:      	leaq	0x501c8d(%rip), %rdi    # 0x807080 <anon.82512870eb8e0132f6a040156ea4d9cc.5.llvm.900034671349249464+0x60>
  3053f3:      	vzeroupper
  3053f6:      	callq	*0x574ce4(%rip)         # 0x87a0e0 <sdallocx+0x87a0e0>
  3053fc:      	jmp	0x305423 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x1863>
  3053fe:      	leaq	0x501d83(%rip), %rdx    # 0x807188 <anon.82512870eb8e0132f6a040156ea4d9cc.5.llvm.900034671349249464+0x168>
  305405:      	jmp	0x30540e <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x184e>
  305407:      	leaq	0x501cea(%rip), %rdx    # 0x8070f8 <anon.82512870eb8e0132f6a040156ea4d9cc.5.llvm.900034671349249464+0xd8>
  30540e:      	leaq	-0x1f16dc(%rip), %rdi   # 0x113d39 <anon.8939df2432453ca20e81ebdf34edf285.11.llvm.7823267031421506494+0x151>
  305415:      	movl	$0x91, %esi
  30541a:      	vzeroupper
  30541d:      	callq	*0x573f25(%rip)         # 0x879348 <sdallocx+0x879348>
  305423:      	ud2
  305425:      	jmp	0x305427 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x1867>
  305427:      	leaq	0x90(%rsp), %rcx
  30542f:      	vpxor	%xmm0, %xmm0, %xmm0
  305433:      	vmovdqa	%xmm0, 0x40(%rsp)
  305439:      	vmovaps	0x40(%rsp), %xmm1
  30543f:      	vmovups	%xmm1, (%rcx)
  305443:      	movb	$0x0, 0xa0(%rsp)
  30544b:      	movb	$0x0, 0xa1(%rsp)
  305453:      	movb	$0x0, 0xa2(%rsp)
  30545b:      	movb	$0x0, 0xa3(%rsp)
  305463:      	movb	$0x0, 0xa4(%rsp)
  30546b:      	movb	$0x0, 0xa5(%rsp)
  305473:      	movb	$0x0, 0xa6(%rsp)
  30547b:      	movb	$0x0, 0xa7(%rsp)
  305483:      	vmovdqa	%xmm0, 0x40(%rsp)
  305489:      	vmovaps	0x40(%rsp), %xmm1
  30548f:      	leaq	0xa8(%rsp), %rdx
  305497:      	vmovups	%xmm1, (%rdx)
  30549b:      	movb	$0x0, 0xb8(%rsp)
  3054a3:      	movb	$0x0, 0xb9(%rsp)
  3054ab:      	movb	$0x0, 0xba(%rsp)
  3054b3:      	movb	$0x0, 0xbb(%rsp)
  3054bb:      	movb	$0x0, 0xbc(%rsp)
  3054c3:      	movb	$0x0, 0xbd(%rsp)
  3054cb:      	movb	$0x0, 0xbe(%rsp)
  3054d3:      	movb	$0x0, 0xbf(%rsp)
  3054db:      	vmovdqa	%xmm0, 0x40(%rsp)
  3054e1:      	vmovaps	0x40(%rsp), %xmm1
  3054e7:      	vmovups	%xmm1, -0x10(%rcx)
  3054ec:      	vmovdqa	%xmm0, 0x40(%rsp)
  3054f2:      	vmovaps	0x40(%rsp), %xmm1
  3054f8:      	vmovaps	%xmm1, 0x70(%rsp)
  3054fe:      	leaq	0x430(%rsp), %rcx
  305506:      	xorl	%edx, %edx
  305508:      	nopl	(%rax,%rax)
  305510:      	vmovdqa	%xmm0, 0x40(%rsp)
  305516:      	vmovaps	0x40(%rsp), %xmm1
  30551c:      	vmovups	%xmm1, -0x30(%rcx,%rdx)
  305522:      	vmovdqa	%xmm0, 0x40(%rsp)
  305528:      	vmovaps	0x40(%rsp), %xmm1
  30552e:      	vmovups	%xmm1, -0x20(%rcx,%rdx)
  305534:      	vmovdqa	%xmm0, 0x40(%rsp)
  30553a:      	vmovaps	0x40(%rsp), %xmm1
  305540:      	vmovups	%xmm1, -0x10(%rcx,%rdx)
  305546:      	vmovdqa	%xmm0, 0x40(%rsp)
  30554c:      	vmovaps	0x40(%rsp), %xmm1
  305552:      	vmovups	%xmm1, (%rcx,%rdx)
  305557:      	addq	$0x40, %rdx
  30555b:      	cmpq	$0x200, %rdx            # imm = 0x200
  305562:      	jne	0x305510 <toyos_crypto::arch::x86_64::chacha::avx2::chacha20_poly1305+0x1950>
  305564:      	movq	%rax, %rdi
  305567:      	callq	0x7dafe0 <_Unwind_Resume>
  30556c:      	int3
  30556d:      	int3
  30556e:      	int3
  30556f:      	int3

0000000000306c40 <toyos_crypto::arch::x86_64::chacha::avx2::keystream>:
  306c40:      	pushq	%rbp
  306c41:      	movq	%rsp, %rbp
  306c44:      	pushq	%r15
  306c46:      	pushq	%r14
  306c48:      	pushq	%r13
  306c4a:      	pushq	%r12
  306c4c:      	pushq	%rbx
  306c4d:      	andq	$-0x20, %rsp
  306c51:      	subq	$0x2c0, %rsp            # imm = 0x2C0
  306c58:      	movq	%r8, %r12
  306c5b:      	movq	0x10(%rbp), %rax
  306c5f:      	movq	(%rax), %r8
  306c62:      	movq	%r8, 0x10(%rsp)
  306c67:      	movq	0x8(%rax), %r11
  306c6b:      	movq	0x10(%rax), %rbx
  306c6f:      	movq	0x18(%rax), %r14
  306c73:      	leaq	0x1(%rdx), %rax
  306c77:      	cmpq	$0x100, %rcx            # imm = 0x100
  306c7e:      	movq	%r9, 0x18(%rsp)
  306c83:      	movq	%r12, 0x78(%rsp)
  306c88:      	jbe	0x3071e4 <toyos_crypto::arch::x86_64::chacha::avx2::keystream+0x5a4>
  306c8e:      	movq	%rdx, %rcx
  306c91:      	leaq	0x2(%rdx), %r8
  306c95:      	vmovd	%edx, %xmm0
  306c99:      	leaq	0x4(%rdx), %r10
  306c9d:      	vmovd	%r10d, %xmm1
  306ca2:      	shrq	$0x20, %r10
  306ca6:      	vmovd	%r10d, %xmm2
  306cab:      	leaq	0x5(%rdx), %r10
  306caf:      	vpinsrd	$0x1, %r10d, %xmm1, %xmm1
  306cb5:      	shrq	$0x20, %r10
  306cb9:      	vpinsrd	$0x1, %r10d, %xmm2, %xmm2
  306cbf:      	leaq	0x6(%rdx), %r10
  306cc3:      	vpinsrd	$0x2, %r10d, %xmm1, %xmm1
  306cc9:      	shrq	$0x20, %r10
  306ccd:      	vpinsrd	$0x2, %r10d, %xmm2, %xmm2
  306cd3:      	leaq	0x3(%rdx), %r10
  306cd7:      	addq	$0x7, %rdx
  306cdb:      	vpinsrd	$0x3, %edx, %xmm1, %xmm1
  306ce1:      	shrq	$0x20, %rdx
  306ce5:      	vpinsrd	$0x3, %edx, %xmm2, %xmm2
  306ceb:      	shrq	$0x20, %rcx
  306cef:      	vmovd	%ecx, %xmm3
  306cf3:      	vpinsrd	$0x1, %eax, %xmm0, %xmm0
  306cf9:      	shrq	$0x20, %rax
  306cfd:      	vpinsrd	$0x1, %eax, %xmm3, %xmm3
  306d03:      	vpinsrd	$0x2, %r8d, %xmm0, %xmm0
  306d09:      	shrq	$0x20, %r8
  306d0d:      	vpinsrd	$0x2, %r8d, %xmm3, %xmm3
  306d13:      	vpinsrd	$0x3, %r10d, %xmm0, %xmm0
  306d19:      	shrq	$0x20, %r10
  306d1d:      	vpinsrd	$0x3, %r10d, %xmm3, %xmm3
  306d23:      	vinserti128	$0x1, %xmm1, %ymm0, %ymm9
  306d29:      	vpbroadcastd	(%rdi), %ymm14
  306d2e:      	vpbroadcastd	0x4(%rdi), %ymm5
  306d34:      	vinserti128	$0x1, %xmm2, %ymm3, %ymm7
  306d3a:      	vpbroadcastq	0x8(%rdi), %xmm0
  306d40:      	vpbroadcastd	%xmm0, %ymm4
  306d45:      	vpbroadcastd	0xc(%rdi), %ymm2
  306d4b:      	vpbroadcastd	0x10(%rdi), %ymm13
  306d51:      	vpbroadcastd	0x14(%rdi), %ymm11
  306d57:      	vpbroadcastd	0x18(%rdi), %ymm8
  306d5d:      	vbroadcastss	0x1c(%rdi), %ymm12
  306d63:      	vmovd	%esi, %xmm0
  306d67:      	vpbroadcastd	%xmm0, %ymm10
  306d6c:      	shrq	$0x20, %rsi
  306d70:      	vmovd	%esi, %xmm0
  306d74:      	vpbroadcastd	%xmm0, %ymm15
  306d79:      	vmovaps	-0x229b21(%rip), %ymm1  # 0xdd260 <kbrainpoolP256r1FieldR+0x60>
  306d81:      	vpbroadcastd	-0x228a6e(%rip), %ymm0 # 0xde31c <kbrainpoolP224r1MontA+0xfbc>
  306d8a:      	vpbroadcastd	-0x228a23(%rip), %ymm3 # 0xde370 <anon.9b5b727f87a45422a003fa990acdeb8e.70.llvm.17782113661035556056+0x1c>
  306d93:      	vmovaps	%ymm1, 0x240(%rsp)
  306d9c:      	vpbroadcastd	-0x228a75(%rip), %ymm1 # 0xde330 <kbrainpoolP224r1MontA+0xfd0>
  306da5:      	xorl	%eax, %eax
  306da7:      	vpbroadcastd	-0x228a54(%rip), %ymm6 # 0xde35c <anon.9b5b727f87a45422a003fa990acdeb8e.70.llvm.17782113661035556056+0x8>
  306db0:      	vmovdqa	%ymm15, 0xc0(%rsp)
  306db9:      	vmovdqa	%ymm15, 0x40(%rsp)
  306dbf:      	vmovdqa	%ymm10, 0xe0(%rsp)
  306dc8:      	vmovdqa	%ymm7, 0x200(%rsp)
  306dd1:      	vmovdqa	%ymm9, 0x220(%rsp)
  306dda:      	vmovaps	%ymm12, 0x100(%rsp)
  306de3:      	vmovaps	%ymm12, 0x20(%rsp)
  306de9:      	vmovdqa	%ymm2, 0x180(%rsp)
  306df2:      	vmovdqa	%ymm2, %ymm12
  306df6:      	vmovdqa	%ymm8, 0x120(%rsp)
  306dff:      	vmovdqa	%ymm4, 0x1a0(%rsp)
  306e08:      	vmovdqa	%ymm11, 0x140(%rsp)
  306e11:      	vmovdqa	%ymm5, 0x1c0(%rsp)
  306e1a:      	vmovdqa	%ymm5, %ymm2
  306e1e:      	vmovdqa	%ymm13, 0x160(%rsp)
  306e27:      	vmovdqa	%ymm14, 0x1e0(%rsp)
  306e30:      	jmp	0x307100 <toyos_crypto::arch::x86_64::chacha::avx2::keystream+0x4c0>
  306e35:      	nopw	%cs:(%rax,%rax)
  306e40:      	vpaddd	%ymm0, %ymm14, %ymm0
  306e44:      	vpxor	%ymm0, %ymm9, %ymm9
  306e48:      	vmovdqa	0x240(%rsp), %ymm5
  306e51:      	vpshufb	%ymm5, %ymm9, %ymm9
  306e56:      	vpaddd	%ymm9, %ymm13, %ymm13
  306e5b:      	vpxor	%ymm14, %ymm13, %ymm14
  306e60:      	vpsrld	$0x14, %ymm14, %ymm15
  306e66:      	vpslld	$0xc, %ymm14, %ymm14
  306e6c:      	vpor	%ymm15, %ymm14, %ymm14
  306e71:      	vpaddd	%ymm0, %ymm14, %ymm0
  306e75:      	vmovdqa	%ymm0, 0x260(%rsp)
  306e7e:      	vpxor	%ymm0, %ymm9, %ymm9
  306e82:      	vmovdqa	-0x229cea(%rip), %ymm0  # 0xdd1a0 <kP256MontGY+0x40>
  306e8a:      	vpshufb	%ymm0, %ymm9, %ymm9
  306e8f:      	vpaddd	%ymm9, %ymm13, %ymm13
  306e94:      	vmovdqa	%ymm13, 0x280(%rsp)
  306e9d:      	vpxor	%ymm14, %ymm13, %ymm14
  306ea2:      	vpsrld	$0x19, %ymm14, %ymm15
  306ea8:      	vpslld	$0x7, %ymm14, %ymm14
  306eae:      	vpor	%ymm15, %ymm14, %ymm13
  306eb3:      	vmovdqa	%ymm13, 0xa0(%rsp)
  306ebc:      	vpaddd	%ymm2, %ymm3, %ymm3
  306ec0:      	vpxor	%ymm3, %ymm7, %ymm7
  306ec4:      	vpshufb	%ymm5, %ymm7, %ymm7
  306ec9:      	vpaddd	%ymm7, %ymm11, %ymm11
  306ecd:      	vpxor	%ymm2, %ymm11, %ymm2
  306ed1:      	vpsrld	$0x14, %ymm2, %ymm15
  306ed6:      	vpslld	$0xc, %ymm2, %ymm2
  306edb:      	vpor	%ymm2, %ymm15, %ymm2
  306edf:      	vpaddd	%ymm3, %ymm2, %ymm3
  306ee3:      	vpxor	%ymm3, %ymm7, %ymm7
  306ee7:      	vpshufb	%ymm0, %ymm7, %ymm13
  306eec:      	vpaddd	%ymm13, %ymm11, %ymm7
  306ef1:      	vmovdqa	%ymm7, 0x80(%rsp)
  306efa:      	vpxor	%ymm2, %ymm7, %ymm2
  306efe:      	vpsrld	$0x19, %ymm2, %ymm15
  306f03:      	vpslld	$0x7, %ymm2, %ymm2
  306f08:      	vpor	%ymm2, %ymm15, %ymm2
  306f0c:      	vpaddd	%ymm4, %ymm1, %ymm1
  306f10:      	vpxor	%ymm1, %ymm10, %ymm10
  306f14:      	vpshufb	%ymm5, %ymm10, %ymm10
  306f19:      	vpaddd	%ymm10, %ymm8, %ymm8
  306f1e:      	vpxor	%ymm4, %ymm8, %ymm4
  306f22:      	vpsrld	$0x14, %ymm4, %ymm15
  306f27:      	vpslld	$0xc, %ymm4, %ymm4
  306f2c:      	vpor	%ymm4, %ymm15, %ymm4
  306f30:      	vpaddd	%ymm1, %ymm4, %ymm7
  306f34:      	vpxor	%ymm7, %ymm10, %ymm10
  306f38:      	vmovdqa	%ymm0, %ymm14
  306f3c:      	vpshufb	%ymm0, %ymm10, %ymm11
  306f41:      	vpaddd	%ymm11, %ymm8, %ymm8
  306f46:      	vpxor	%ymm4, %ymm8, %ymm4
  306f4a:      	vpsrld	$0x19, %ymm4, %ymm15
  306f4f:      	vpslld	$0x7, %ymm4, %ymm4
  306f54:      	vpor	%ymm4, %ymm15, %ymm4
  306f58:      	vpaddd	%ymm6, %ymm12, %ymm6
  306f5c:      	vpxor	0x40(%rsp), %ymm6, %ymm15
  306f62:      	vmovdqa	%ymm5, %ymm10
  306f66:      	vpshufb	%ymm5, %ymm15, %ymm15
  306f6b:      	vpaddd	0x20(%rsp), %ymm15, %ymm5
  306f71:      	vpxor	%ymm5, %ymm12, %ymm12
  306f75:      	vpsrld	$0x14, %ymm12, %ymm0
  306f7b:      	vpslld	$0xc, %ymm12, %ymm12
  306f81:      	vpor	%ymm0, %ymm12, %ymm0
  306f85:      	vpaddd	%ymm6, %ymm0, %ymm6
  306f89:      	vpxor	%ymm6, %ymm15, %ymm12
  306f8d:      	vpshufb	%ymm14, %ymm12, %ymm12
  306f92:      	vpaddd	%ymm5, %ymm12, %ymm15
  306f96:      	vpxor	%ymm0, %ymm15, %ymm0
  306f9a:      	vpsrld	$0x19, %ymm0, %ymm5
  306f9f:      	vpslld	$0x7, %ymm0, %ymm0
  306fa4:      	vpor	%ymm5, %ymm0, %ymm5
  306fa8:      	vpaddd	0x260(%rsp), %ymm2, %ymm0
  306fb1:      	vpxor	%ymm0, %ymm12, %ymm12
  306fb5:      	vpshufb	%ymm10, %ymm12, %ymm12
  306fba:      	vpaddd	%ymm12, %ymm8, %ymm8
  306fbf:      	vpxor	%ymm2, %ymm8, %ymm2
  306fc3:      	vpsrld	$0x14, %ymm2, %ymm1
  306fc8:      	vpslld	$0xc, %ymm2, %ymm2
  306fcd:      	vpor	%ymm1, %ymm2, %ymm1
  306fd1:      	vpaddd	%ymm0, %ymm1, %ymm0
  306fd5:      	vpxor	%ymm0, %ymm12, %ymm2
  306fd9:      	vpshufb	%ymm14, %ymm2, %ymm2
  306fde:      	vmovdqa	%ymm2, 0x40(%rsp)
  306fe4:      	vpaddd	%ymm2, %ymm8, %ymm8
  306fe8:      	vpxor	%ymm1, %ymm8, %ymm1
  306fec:      	vpsrld	$0x19, %ymm1, %ymm2
  306ff1:      	vpslld	$0x7, %ymm1, %ymm1
  306ff6:      	vpor	%ymm2, %ymm1, %ymm2
  306ffa:      	vpaddd	%ymm3, %ymm4, %ymm1
  306ffe:      	vpxor	%ymm1, %ymm9, %ymm3
  307002:      	vpshufb	%ymm10, %ymm3, %ymm9
  307007:      	vpaddd	%ymm9, %ymm15, %ymm12
  30700c:      	vpxor	%ymm4, %ymm12, %ymm3
  307010:      	vpsrld	$0x14, %ymm3, %ymm4
  307015:      	vpslld	$0xc, %ymm3, %ymm3
  30701a:      	vpor	%ymm4, %ymm3, %ymm4
  30701e:      	vpaddd	%ymm1, %ymm4, %ymm3
  307022:      	vpxor	%ymm3, %ymm9, %ymm1
  307026:      	vpshufb	%ymm14, %ymm1, %ymm9
  30702b:      	vpaddd	%ymm9, %ymm12, %ymm1
  307030:      	vmovdqa	%ymm1, 0x20(%rsp)
  307036:      	vpxor	%ymm4, %ymm1, %ymm1
  30703a:      	vpsrld	$0x19, %ymm1, %ymm4
  30703f:      	vpslld	$0x7, %ymm1, %ymm1
  307044:      	vpor	%ymm4, %ymm1, %ymm4
  307048:      	vpaddd	%ymm7, %ymm5, %ymm1
  30704c:      	vpxor	%ymm1, %ymm13, %ymm7
  307050:      	vpshufb	%ymm10, %ymm7, %ymm7
  307055:      	vpaddd	0x280(%rsp), %ymm7, %ymm12
  30705e:      	vpxor	%ymm5, %ymm12, %ymm5
  307062:      	vpsrld	$0x14, %ymm5, %ymm13
  307067:      	vpslld	$0xc, %ymm5, %ymm5
  30706c:      	vpor	%ymm5, %ymm13, %ymm5
  307070:      	vpaddd	%ymm1, %ymm5, %ymm1
  307074:      	vpxor	%ymm1, %ymm7, %ymm7
  307078:      	vpshufb	%ymm14, %ymm7, %ymm7
  30707d:      	vpaddd	%ymm7, %ymm12, %ymm13
  307081:      	vpxor	%ymm5, %ymm13, %ymm5
  307085:      	vpsrld	$0x19, %ymm5, %ymm12
  30708a:      	vpslld	$0x7, %ymm5, %ymm5
  30708f:      	vpor	%ymm5, %ymm12, %ymm15
  307093:      	vmovdqa	0xa0(%rsp), %ymm12
  30709c:      	vpaddd	%ymm6, %ymm12, %ymm5
  3070a0:      	vpxor	%ymm5, %ymm11, %ymm6
  3070a4:      	vpshufb	%ymm10, %ymm6, %ymm10
  3070a9:      	vpaddd	0x80(%rsp), %ymm10, %ymm11
  3070b2:      	vpxor	%ymm12, %ymm11, %ymm6
  3070b7:      	vpsrld	$0x14, %ymm6, %ymm12
  3070bc:      	vpslld	$0xc, %ymm6, %ymm6
  3070c1:      	vpor	%ymm6, %ymm12, %ymm12
  3070c5:      	vpaddd	%ymm5, %ymm12, %ymm6
  3070c9:      	vpxor	%ymm6, %ymm10, %ymm5
  3070cd:      	vpshufb	%ymm14, %ymm5, %ymm10
  3070d2:      	vpaddd	%ymm10, %ymm11, %ymm11
  3070d7:      	vpxor	%ymm12, %ymm11, %ymm5
  3070dc:      	vpsrld	$0x19, %ymm5, %ymm12
  3070e1:      	vpslld	$0x7, %ymm5, %ymm5
  3070e6:      	vpor	%ymm5, %ymm12, %ymm14
  3070ea:      	vmovdqa	%ymm15, %ymm12
  3070ef:      	incq	%rax
  3070f2:      	addq	$0x30, %r12
  3070f6:      	cmpq	$0xa, %rax
  3070fa:      	je	0x3073ec <toyos_crypto::arch::x86_64::chacha::avx2::keystream+0x7ac>
  307100:      	leaq	(%rax,%rax,2), %r13
  307104:      	leaq	(%rax,%rax,2), %r15
  307108:      	addq	$0x3, %r15
  30710c:      	cmpq	%r15, %r9
  30710f:      	cmovbq	%r9, %r15
  307113:      	cmpq	%r13, %r9
  307116:      	jbe	0x306e40 <toyos_crypto::arch::x86_64::chacha::avx2::keystream+0x200>
  30711c:      	movq	%rax, 0xa0(%rsp)
  307124:      	movq	0x10(%rsp), %rax
  307129:      	movq	(%rax), %rsi
  30712c:      	movq	0x8(%rax), %rcx
  307130:      	movq	0x10(%rax), %rax
  307134:      	movq	%r12, 0x80(%rsp)
  30713c:      	nopl	(%rax)
  307140:      	incq	%r13
  307143:      	addq	(%r12), %rsi
  307147:      	adcq	0x8(%r12), %rcx
  30714c:      	adcq	$0x1, %rax
  307150:      	movq	%rsi, %rdx
  307153:      	mulxq	%r11, %r9, %r8
  307158:      	movq	%rcx, %rdx
  30715b:      	mulxq	%r14, %r10, %rdi
  307160:      	addq	%r9, %r10
  307163:      	adcq	%r8, %rdi
  307166:      	movq	%rsi, %rdx
  307169:      	mulxq	%rbx, %r8, %rsi
  30716e:      	movq	%rcx, %rdx
  307171:      	mulxq	%r11, %rcx, %r9
  307176:      	addq	%r8, %rcx
  307179:      	adcq	%rsi, %r9
  30717c:      	movq	%rax, %rdx
  30717f:      	mulxq	%r14, %rsi, %rdx
  307184:      	addq	%rdi, %rcx
  307187:      	adcq	$0x0, %r9
  30718b:      	addq	%rsi, %rcx
  30718e:      	adcq	%rdx, %r9
  307191:      	imulq	%r11, %rax
  307195:      	addq	%r9, %rax
  307198:      	movq	%rax, %rdx
  30719b:      	shrq	$0x2, %rdx
  30719f:      	leaq	(%rdx,%rdx,4), %rsi
  3071a3:      	andl	$0x3, %eax
  3071a6:      	addq	%r10, %rsi
  3071a9:      	adcq	$0x0, %rcx
  3071ad:      	adcq	$0x0, %rax
  3071b1:      	addq	$0x10, %r12
  3071b5:      	cmpq	%r15, %r13
  3071b8:      	jb	0x307140 <toyos_crypto::arch::x86_64::chacha::avx2::keystream+0x500>
  3071ba:      	movq	0x10(%rsp), %rdx
  3071bf:      	movq	%rsi, (%rdx)
  3071c2:      	movq	%rcx, 0x8(%rdx)
  3071c6:      	movq	%rax, 0x10(%rdx)
  3071ca:      	movq	0x18(%rsp), %r9
  3071cf:      	movq	0xa0(%rsp), %rax
  3071d7:      	movq	0x80(%rsp), %r12
  3071df:      	jmp	0x306e40 <toyos_crypto::arch::x86_64::chacha::avx2::keystream+0x200>
  3071e4:      	vbroadcasti128	(%rdi), %ymm0   # ymm0 = mem[0,1,0,1]
  3071e9:      	vbroadcasti128	0x10(%rdi), %ymm1 # ymm1 = mem[0,1,0,1]
  3071ef:      	vmovq	%rsi, %xmm3
  3071f4:      	vmovq	%rax, %xmm2
  3071f9:      	vpunpcklqdq	%xmm3, %xmm2, %xmm2 # xmm2 = xmm2[0],xmm3[0]
  3071fd:      	vmovq	%rdx, %xmm4
  307202:      	vpunpcklqdq	%xmm3, %xmm4, %xmm4 # xmm4 = xmm4[0],xmm3[0]
  307206:      	vinserti128	$0x1, %xmm2, %ymm4, %ymm2
  30720c:      	cmpq	$0x81, %rcx
  307213:      	jae	0x30761a <toyos_crypto::arch::x86_64::chacha::avx2::keystream+0x9da>
  307219:      	vmovaps	-0x229fc1(%rip), %ymm3  # 0xdd260 <kbrainpoolP256r1FieldR+0x60>
  307221:      	vmovdqa	-0x229f49(%rip), %ymm5  # 0xdd2e0 <anon.8939df2432453ca20e81ebdf34edf285.6.llvm.7823267031421506494+0x40>
  307229:      	xorl	%eax, %eax
  30722b:      	vmovdqa	-0x22a093(%rip), %ymm4  # 0xdd1a0 <kP256MontGY+0x40>
  307233:      	movq	%r12, %r8
  307236:      	vmovdqa	%ymm2, %ymm8
  30723a:      	vmovdqa	%ymm1, %ymm6
  30723e:      	vmovdqa	%ymm0, %ymm7
  307242:      	jmp	0x30730d <toyos_crypto::arch::x86_64::chacha::avx2::keystream+0x6cd>
  307247:      	nopw	(%rax,%rax)
  307250:      	incq	%rax
  307253:      	vpaddd	%ymm7, %ymm5, %ymm5
  307257:      	vpxor	%ymm5, %ymm8, %ymm8
  30725b:      	vpshufb	%ymm3, %ymm8, %ymm8
  307260:      	vpaddd	%ymm6, %ymm8, %ymm6
  307264:      	vpxor	%ymm7, %ymm6, %ymm7
  307268:      	vpsrld	$0x14, %ymm7, %ymm9
  30726d:      	vpslld	$0xc, %ymm7, %ymm7
  307272:      	vpor	%ymm7, %ymm9, %ymm7
  307276:      	vpaddd	%ymm5, %ymm7, %ymm5
  30727a:      	vpxor	%ymm5, %ymm8, %ymm8
  30727e:      	vpshufb	%ymm4, %ymm8, %ymm8
  307283:      	vpaddd	%ymm6, %ymm8, %ymm6
  307287:      	vpxor	%ymm7, %ymm6, %ymm7
  30728b:      	vpsrld	$0x19, %ymm7, %ymm9
  307290:      	vpslld	$0x7, %ymm7, %ymm7
  307295:      	vpor	%ymm7, %ymm9, %ymm7
  307299:      	vpshufd	$0x39, %ymm7, %ymm7     # ymm7 = ymm7[1,2,3,0,5,6,7,4]
  30729e:      	vpshufd	$0x4e, %ymm6, %ymm6     # ymm6 = ymm6[2,3,0,1,6,7,4,5]
  3072a3:      	vpshufd	$0x93, %ymm8, %ymm8     # ymm8 = ymm8[3,0,1,2,7,4,5,6]
  3072a9:      	vpaddd	%ymm5, %ymm7, %ymm5
  3072ad:      	vpxor	%ymm5, %ymm8, %ymm8
  3072b1:      	vpshufb	%ymm3, %ymm8, %ymm8
  3072b6:      	vpaddd	%ymm6, %ymm8, %ymm6
  3072ba:      	vpxor	%ymm6, %ymm7, %ymm7
  3072be:      	vpsrld	$0x14, %ymm7, %ymm9
  3072c3:      	vpslld	$0xc, %ymm7, %ymm7
  3072c8:      	vpor	%ymm7, %ymm9, %ymm7
  3072cc:      	vpaddd	%ymm5, %ymm7, %ymm5
  3072d0:      	vpxor	%ymm5, %ymm8, %ymm8
  3072d4:      	vpshufb	%ymm4, %ymm8, %ymm8
  3072d9:      	vpaddd	%ymm6, %ymm8, %ymm6
  3072dd:      	vpxor	%ymm7, %ymm6, %ymm7
  3072e1:      	vpsrld	$0x19, %ymm7, %ymm9
  3072e6:      	vpslld	$0x7, %ymm7, %ymm7
  3072eb:      	vpor	%ymm7, %ymm9, %ymm7
  3072ef:      	vpshufd	$0x93, %ymm7, %ymm7     # ymm7 = ymm7[3,0,1,2,7,4,5,6]
  3072f4:      	vpshufd	$0x4e, %ymm6, %ymm6     # ymm6 = ymm6[2,3,0,1,6,7,4,5]
  3072f9:      	vpshufd	$0x39, %ymm8, %ymm8     # ymm8 = ymm8[1,2,3,0,5,6,7,4]
  3072ff:      	addq	$0x30, %r8
  307303:      	cmpq	$0xa, %rax
  307307:      	je	0x3078ed <toyos_crypto::arch::x86_64::chacha::avx2::keystream+0xcad>
  30730d:      	leaq	(%rax,%rax,2), %r13
  307311:      	leaq	(%rax,%rax,2), %r15
  307315:      	addq	$0x3, %r15
  307319:      	cmpq	%r15, %r9
  30731c:      	cmovbq	%r9, %r15
  307320:      	cmpq	%r13, %r9
  307323:      	jbe	0x307250 <toyos_crypto::arch::x86_64::chacha::avx2::keystream+0x610>
  307329:      	movq	%rax, 0x40(%rsp)
  30732e:      	movq	0x10(%rsp), %rax
  307333:      	movq	(%rax), %rsi
  307336:      	movq	0x8(%rax), %rcx
  30733a:      	movq	0x10(%rax), %rax
  30733e:      	movq	%r8, 0x20(%rsp)
  307343:      	nopw	%cs:(%rax,%rax)
  307350:      	incq	%r13
  307353:      	addq	(%r8), %rsi
  307356:      	adcq	0x8(%r8), %rcx
  30735a:      	adcq	$0x1, %rax
  30735e:      	movq	%rsi, %rdx
  307361:      	mulxq	%r11, %r12, %r9
  307366:      	movq	%rcx, %rdx
  307369:      	mulxq	%r14, %r10, %rdi
  30736e:      	addq	%r12, %r10
  307371:      	adcq	%r9, %rdi
  307374:      	movq	%rsi, %rdx
  307377:      	mulxq	%rbx, %r9, %rsi
  30737c:      	movq	%rcx, %rdx
  30737f:      	mulxq	%r11, %rcx, %r12
  307384:      	addq	%r9, %rcx
  307387:      	adcq	%rsi, %r12
  30738a:      	movq	%rax, %rdx
  30738d:      	mulxq	%r14, %rsi, %rdx
  307392:      	addq	%rdi, %rcx
  307395:      	adcq	$0x0, %r12
  307399:      	addq	%rsi, %rcx
  30739c:      	adcq	%rdx, %r12
  30739f:      	imulq	%r11, %rax
  3073a3:      	addq	%r12, %rax
  3073a6:      	movq	%rax, %rdx
  3073a9:      	shrq	$0x2, %rdx
  3073ad:      	leaq	(%rdx,%rdx,4), %rsi
  3073b1:      	andl	$0x3, %eax
  3073b4:      	addq	%r10, %rsi
  3073b7:      	adcq	$0x0, %rcx
  3073bb:      	adcq	$0x0, %rax
  3073bf:      	addq	$0x10, %r8
  3073c3:      	cmpq	%r15, %r13
  3073c6:      	jb	0x307350 <toyos_crypto::arch::x86_64::chacha::avx2::keystream+0x710>
  3073c8:      	movq	0x10(%rsp), %rdx
  3073cd:      	movq	%rsi, (%rdx)
  3073d0:      	movq	%rcx, 0x8(%rdx)
  3073d4:      	movq	%rax, 0x10(%rdx)
  3073d8:      	movq	0x18(%rsp), %r9
  3073dd:      	movq	0x40(%rsp), %rax
  3073e2:      	movq	0x20(%rsp), %r8
  3073e7:      	jmp	0x307250 <toyos_crypto::arch::x86_64::chacha::avx2::keystream+0x610>
  3073ec:      	vpbroadcastd	-0x2290d9(%rip), %ymm5 # 0xde31c <kbrainpoolP224r1MontA+0xfbc>
  3073f5:      	vpaddd	%ymm5, %ymm0, %ymm15
  3073f9:      	vpbroadcastd	-0x229092(%rip), %ymm5 # 0xde370 <anon.9b5b727f87a45422a003fa990acdeb8e.70.llvm.17782113661035556056+0x1c>
  307402:      	vpaddd	%ymm5, %ymm3, %ymm3
  307406:      	vpbroadcastd	-0x2290df(%rip), %ymm5 # 0xde330 <kbrainpoolP224r1MontA+0xfd0>
  30740f:      	vpaddd	%ymm5, %ymm1, %ymm1
  307413:      	vpbroadcastd	-0x2290c0(%rip), %ymm5 # 0xde35c <anon.9b5b727f87a45422a003fa990acdeb8e.70.llvm.17782113661035556056+0x8>
  30741c:      	vpaddd	%ymm5, %ymm6, %ymm5
  307420:      	vpaddd	0x1e0(%rsp), %ymm14, %ymm6
  307429:      	vpaddd	0x1c0(%rsp), %ymm2, %ymm2
  307432:      	vpaddd	0x1a0(%rsp), %ymm4, %ymm4
  30743b:      	vpaddd	0x180(%rsp), %ymm12, %ymm12
  307444:      	vpaddd	0x160(%rsp), %ymm13, %ymm13
  30744d:      	vpaddd	0x140(%rsp), %ymm11, %ymm11
  307456:      	vpaddd	0x120(%rsp), %ymm8, %ymm14
  30745f:      	vmovdqa	0x20(%rsp), %ymm0
  307465:      	vpaddd	0x100(%rsp), %ymm0, %ymm8
  30746e:      	vpaddd	0x220(%rsp), %ymm9, %ymm0
  307477:      	vmovdqa	%ymm0, 0x20(%rsp)
  30747d:      	vpaddd	0x200(%rsp), %ymm7, %ymm7
  307486:      	vpaddd	0xe0(%rsp), %ymm10, %ymm10
  30748f:      	vmovdqa	0x40(%rsp), %ymm0
  307495:      	vpaddd	0xc0(%rsp), %ymm0, %ymm9
  30749e:      	vpunpckldq	%ymm3, %ymm15, %ymm0 # ymm0 = ymm15[0],ymm3[0],ymm15[1],ymm3[1],ymm15[4],ymm3[4],ymm15[5],ymm3[5]
  3074a2:      	vpunpckhdq	%ymm3, %ymm15, %ymm3 # ymm3 = ymm15[2],ymm3[2],ymm15[3],ymm3[3],ymm15[6],ymm3[6],ymm15[7],ymm3[7]
  3074a6:      	vmovdqa	%ymm3, 0x40(%rsp)
  3074ac:      	vpunpckldq	%ymm5, %ymm1, %ymm3 # ymm3 = ymm1[0],ymm5[0],ymm1[1],ymm5[1],ymm1[4],ymm5[4],ymm1[5],ymm5[5]
  3074b0:      	vpunpckhdq	%ymm5, %ymm1, %ymm1 # ymm1 = ymm1[2],ymm5[2],ymm1[3],ymm5[3],ymm1[6],ymm5[6],ymm1[7],ymm5[7]
  3074b4:      	vpunpcklqdq	%ymm3, %ymm0, %ymm15 # ymm15 = ymm0[0],ymm3[0],ymm0[2],ymm3[2]
  3074b8:      	vpunpckhqdq	%ymm3, %ymm0, %ymm0 # ymm0 = ymm0[1],ymm3[1],ymm0[3],ymm3[3]
  3074bc:      	vpunpckldq	%ymm2, %ymm6, %ymm5 # ymm5 = ymm6[0],ymm2[0],ymm6[1],ymm2[1],ymm6[4],ymm2[4],ymm6[5],ymm2[5]
  3074c0:      	vpunpckhdq	%ymm2, %ymm6, %ymm2 # ymm2 = ymm6[2],ymm2[2],ymm6[3],ymm2[3],ymm6[6],ymm2[6],ymm6[7],ymm2[7]
  3074c4:      	vpunpckldq	%ymm12, %ymm4, %ymm6 # ymm6 = ymm4[0],ymm12[0],ymm4[1],ymm12[1],ymm4[4],ymm12[4],ymm4[5],ymm12[5]
  3074c9:      	vpunpckhdq	%ymm12, %ymm4, %ymm3 # ymm3 = ymm4[2],ymm12[2],ymm4[3],ymm12[3],ymm4[6],ymm12[6],ymm4[7],ymm12[7]
  3074ce:      	vpunpcklqdq	%ymm6, %ymm5, %ymm12 # ymm12 = ymm5[0],ymm6[0],ymm5[2],ymm6[2]
  3074d2:      	vpunpckhqdq	%ymm6, %ymm5, %ymm4 # ymm4 = ymm5[1],ymm6[1],ymm5[3],ymm6[3]
  3074d6:      	vpunpckldq	%ymm11, %ymm13, %ymm6 # ymm6 = ymm13[0],ymm11[0],ymm13[1],ymm11[1],ymm13[4],ymm11[4],ymm13[5],ymm11[5]
  3074db:      	vpunpckhdq	%ymm11, %ymm13, %ymm11 # ymm11 = ymm13[2],ymm11[2],ymm13[3],ymm11[3],ymm13[6],ymm11[6],ymm13[7],ymm11[7]
  3074e0:      	vpunpckldq	%ymm8, %ymm14, %ymm13 # ymm13 = ymm14[0],ymm8[0],ymm14[1],ymm8[1],ymm14[4],ymm8[4],ymm14[5],ymm8[5]
  3074e5:      	vpunpckhdq	%ymm8, %ymm14, %ymm5 # ymm5 = ymm14[2],ymm8[2],ymm14[3],ymm8[3],ymm14[6],ymm8[6],ymm14[7],ymm8[7]
  3074ea:      	vpunpcklqdq	%ymm13, %ymm6, %ymm8 # ymm8 = ymm6[0],ymm13[0],ymm6[2],ymm13[2]
  3074ef:      	vpunpckhqdq	%ymm13, %ymm6, %ymm13 # ymm13 = ymm6[1],ymm13[1],ymm6[3],ymm13[3]
  3074f4:      	vmovdqa	0x20(%rsp), %ymm6
  3074fa:      	vpunpckldq	%ymm7, %ymm6, %ymm14 # ymm14 = ymm6[0],ymm7[0],ymm6[1],ymm7[1],ymm6[4],ymm7[4],ymm6[5],ymm7[5]
  3074fe:      	vpunpckhdq	%ymm7, %ymm6, %ymm6 # ymm6 = ymm6[2],ymm7[2],ymm6[3],ymm7[3],ymm6[6],ymm7[6],ymm6[7],ymm7[7]
  307502:      	vpunpckldq	%ymm9, %ymm10, %ymm7 # ymm7 = ymm10[0],ymm9[0],ymm10[1],ymm9[1],ymm10[4],ymm9[4],ymm10[5],ymm9[5]
  307507:      	vpunpckhdq	%ymm9, %ymm10, %ymm9 # ymm9 = ymm10[2],ymm9[2],ymm10[3],ymm9[3],ymm10[6],ymm9[6],ymm10[7],ymm9[7]
  30750c:      	vpunpcklqdq	%ymm7, %ymm14, %ymm10 # ymm10 = ymm14[0],ymm7[0],ymm14[2],ymm7[2]
  307510:      	vpunpckhqdq	%ymm7, %ymm14, %ymm7 # ymm7 = ymm14[1],ymm7[1],ymm14[3],ymm7[3]
  307514:      	vperm2i128	$0x31, %ymm12, %ymm15, %ymm14 # ymm14 = ymm15[2,3],ymm12[2,3]
  30751a:      	vinserti128	$0x1, %xmm12, %ymm15, %ymm12
  307520:      	movq	0x18(%rbp), %rdx
  307524:      	vmovdqu	%ymm12, (%rdx)
  307528:      	vperm2i128	$0x31, %ymm10, %ymm8, %ymm12 # ymm12 = ymm8[2,3],ymm10[2,3]
  30752e:      	vinserti128	$0x1, %xmm10, %ymm8, %ymm8
  307534:      	vmovdqu	%ymm8, 0x20(%rdx)
  307539:      	vmovdqu	%ymm14, 0x100(%rdx)
  307541:      	vmovdqu	%ymm12, 0x120(%rdx)
  307549:      	vperm2i128	$0x31, %ymm4, %ymm0, %ymm8 # ymm8 = ymm0[2,3],ymm4[2,3]
  30754f:      	vinserti128	$0x1, %xmm4, %ymm0, %ymm0
  307555:      	vmovdqu	%ymm0, 0x40(%rdx)
  30755a:      	vperm2i128	$0x31, %ymm7, %ymm13, %ymm0 # ymm0 = ymm13[2,3],ymm7[2,3]
  307560:      	vinserti128	$0x1, %xmm7, %ymm13, %ymm4
  307566:      	vmovdqa	0x40(%rsp), %ymm10
  30756c:      	vpunpcklqdq	%ymm1, %ymm10, %ymm7 # ymm7 = ymm10[0],ymm1[0],ymm10[2],ymm1[2]
  307570:      	vmovdqu	%ymm4, 0x60(%rdx)
  307575:      	vpunpcklqdq	%ymm3, %ymm2, %ymm4 # ymm4 = ymm2[0],ymm3[0],ymm2[2],ymm3[2]
  307579:      	vmovdqu	%ymm8, 0x140(%rdx)
  307581:      	vpunpcklqdq	%ymm5, %ymm11, %ymm8 # ymm8 = ymm11[0],ymm5[0],ymm11[2],ymm5[2]
  307585:      	vmovdqu	%ymm0, 0x160(%rdx)
  30758d:      	vperm2i128	$0x31, %ymm4, %ymm7, %ymm0 # ymm0 = ymm7[2,3],ymm4[2,3]
  307593:      	vinserti128	$0x1, %xmm4, %ymm7, %ymm4
  307599:      	vpunpcklqdq	%ymm9, %ymm6, %ymm7 # ymm7 = ymm6[0],ymm9[0],ymm6[2],ymm9[2]
  30759e:      	vmovdqu	%ymm4, 0x80(%rdx)
  3075a6:      	vperm2i128	$0x31, %ymm7, %ymm8, %ymm4 # ymm4 = ymm8[2,3],ymm7[2,3]
  3075ac:      	vinserti128	$0x1, %xmm7, %ymm8, %ymm7
  3075b2:      	vmovdqu	%ymm7, 0xa0(%rdx)
  3075ba:      	vmovdqu	%ymm0, 0x180(%rdx)
  3075c2:      	vmovdqu	%ymm4, 0x1a0(%rdx)
  3075ca:      	vpunpckhqdq	%ymm9, %ymm6, %ymm4 # ymm4 = ymm6[1],ymm9[1],ymm6[3],ymm9[3]
  3075cf:      	vpunpckhqdq	%ymm5, %ymm11, %ymm5 # ymm5 = ymm11[1],ymm5[1],ymm11[3],ymm5[3]
  3075d3:      	vpunpckhqdq	%ymm3, %ymm2, %ymm0 # ymm0 = ymm2[1],ymm3[1],ymm2[3],ymm3[3]
  3075d7:      	vpunpckhqdq	%ymm1, %ymm10, %ymm1 # ymm1 = ymm10[1],ymm1[1],ymm10[3],ymm1[3]
  3075db:      	vperm2i128	$0x31, %ymm0, %ymm1, %ymm2 # ymm2 = ymm1[2,3],ymm0[2,3]
  3075e1:      	vinserti128	$0x1, %xmm0, %ymm1, %ymm0
  3075e7:      	vmovdqu	%ymm0, 0xc0(%rdx)
  3075ef:      	vperm2i128	$0x31, %ymm4, %ymm5, %ymm0 # ymm0 = ymm5[2,3],ymm4[2,3]
  3075f5:      	vinserti128	$0x1, %xmm4, %ymm5, %ymm1
  3075fb:      	vmovdqu	%ymm1, 0xe0(%rdx)
  307603:      	vmovdqu	%ymm2, 0x1c0(%rdx)
  30760b:      	movl	$0x1f0, %eax            # imm = 0x1F0
  307610:      	movl	$0x1e0, %ecx            # imm = 0x1E0
  307615:      	jmp	0x3079cc <toyos_crypto::arch::x86_64::chacha::avx2::keystream+0xd8c>
  30761a:      	leaq	0x2(%rdx), %rax
  30761e:      	addq	$0x3, %rdx
  307622:      	vmovq	%rdx, %xmm4
  307627:      	vpunpcklqdq	%xmm3, %xmm4, %xmm4 # xmm4 = xmm4[0],xmm3[0]
  30762b:      	vmovq	%rax, %xmm5
  307630:      	vpunpcklqdq	%xmm3, %xmm5, %xmm3 # xmm3 = xmm5[0],xmm3[0]
  307634:      	vinserti128	$0x1, %xmm4, %ymm3, %ymm3
  30763a:      	vmovaps	-0x22a3e2(%rip), %ymm4  # 0xdd260 <kbrainpoolP256r1FieldR+0x60>
  307642:      	vmovdqa	-0x22a36a(%rip), %ymm6  # 0xdd2e0 <anon.8939df2432453ca20e81ebdf34edf285.6.llvm.7823267031421506494+0x40>
  30764a:      	xorl	%eax, %eax
  30764c:      	vmovdqa	-0x22a4b4(%rip), %ymm5  # 0xdd1a0 <kP256MontGY+0x40>
  307654:      	movq	%r12, %r8
  307657:      	vmovdqa	%ymm3, %ymm9
  30765b:      	vmovdqa	%ymm1, %ymm8
  30765f:      	vmovdqa	%ymm0, %ymm7
  307663:      	vmovdqa	%ymm2, %ymm13
  307667:      	vmovdqa	%ymm1, %ymm11
  30766b:      	vmovdqa	%ymm0, %ymm12
  30766f:      	vmovdqa	%ymm6, %ymm10
  307673:      	jmp	0x30782e <toyos_crypto::arch::x86_64::chacha::avx2::keystream+0xbee>
  307678:      	nopl	(%rax,%rax)
  307680:      	movq	0x10(%rsp), %rdx
  307685:      	movq	%rsi, (%rdx)
  307688:      	movq	%rcx, 0x8(%rdx)
  30768c:      	movq	%rax, 0x10(%rdx)
  307690:      	movq	0x18(%rsp), %r9
  307695:      	movq	0x40(%rsp), %rax
  30769a:      	movq	0x20(%rsp), %r8
  30769f:      	vpaddd	%ymm12, %ymm10, %ymm10
  3076a4:      	vpxor	%ymm10, %ymm13, %ymm13
  3076a9:      	vpshufb	%ymm4, %ymm13, %ymm13
  3076ae:      	vpaddd	%ymm13, %ymm11, %ymm11
  3076b3:      	vpxor	%ymm12, %ymm11, %ymm12
  3076b8:      	vpsrld	$0x14, %ymm12, %ymm14
  3076be:      	vpslld	$0xc, %ymm12, %ymm12
  3076c4:      	vpor	%ymm14, %ymm12, %ymm12
  3076c9:      	vpaddd	%ymm10, %ymm12, %ymm10
  3076ce:      	vpxor	%ymm10, %ymm13, %ymm13
  3076d3:      	vpshufb	%ymm5, %ymm13, %ymm13
  3076d8:      	vpaddd	%ymm13, %ymm11, %ymm11
  3076dd:      	vpxor	%ymm12, %ymm11, %ymm12
  3076e2:      	vpsrld	$0x19, %ymm12, %ymm14
  3076e8:      	vpslld	$0x7, %ymm12, %ymm12
  3076ee:      	vpor	%ymm14, %ymm12, %ymm12
  3076f3:      	vpshufd	$0x39, %ymm12, %ymm12   # ymm12 = ymm12[1,2,3,0,5,6,7,4]
  3076f9:      	vpshufd	$0x4e, %ymm11, %ymm11   # ymm11 = ymm11[2,3,0,1,6,7,4,5]
  3076ff:      	vpshufd	$0x93, %ymm13, %ymm13   # ymm13 = ymm13[3,0,1,2,7,4,5,6]
  307705:      	vpaddd	%ymm7, %ymm6, %ymm6
  307709:      	vpxor	%ymm6, %ymm9, %ymm9
  30770d:      	vpshufb	%ymm4, %ymm9, %ymm9
  307712:      	vpaddd	%ymm9, %ymm8, %ymm8
  307717:      	vpxor	%ymm7, %ymm8, %ymm7
  30771b:      	vpsrld	$0x14, %ymm7, %ymm14
  307720:      	vpslld	$0xc, %ymm7, %ymm7
  307725:      	vpor	%ymm7, %ymm14, %ymm7
  307729:      	vpaddd	%ymm6, %ymm7, %ymm6
  30772d:      	vpxor	%ymm6, %ymm9, %ymm9
  307731:      	vpshufb	%ymm5, %ymm9, %ymm9
  307736:      	vpaddd	%ymm9, %ymm8, %ymm8
  30773b:      	vpxor	%ymm7, %ymm8, %ymm7
  30773f:      	vpsrld	$0x19, %ymm7, %ymm14
  307744:      	vpslld	$0x7, %ymm7, %ymm7
  307749:      	vpor	%ymm7, %ymm14, %ymm7
  30774d:      	vpshufd	$0x39, %ymm7, %ymm7     # ymm7 = ymm7[1,2,3,0,5,6,7,4]
  307752:      	vpshufd	$0x4e, %ymm8, %ymm8     # ymm8 = ymm8[2,3,0,1,6,7,4,5]
  307758:      	vpshufd	$0x93, %ymm9, %ymm9     # ymm9 = ymm9[3,0,1,2,7,4,5,6]
  30775e:      	vpaddd	%ymm10, %ymm12, %ymm10
  307763:      	vpxor	%ymm13, %ymm10, %ymm13
  307768:      	vpshufb	%ymm4, %ymm13, %ymm13
  30776d:      	vpaddd	%ymm13, %ymm11, %ymm11
  307772:      	vpxor	%ymm11, %ymm12, %ymm12
  307777:      	vpsrld	$0x14, %ymm12, %ymm14
  30777d:      	vpslld	$0xc, %ymm12, %ymm12
  307783:      	vpor	%ymm14, %ymm12, %ymm12
  307788:      	vpaddd	%ymm10, %ymm12, %ymm10
  30778d:      	vpxor	%ymm10, %ymm13, %ymm13
  307792:      	vpshufb	%ymm5, %ymm13, %ymm13
  307797:      	vpaddd	%ymm13, %ymm11, %ymm11
  30779c:      	vpxor	%ymm12, %ymm11, %ymm12
  3077a1:      	vpsrld	$0x19, %ymm12, %ymm14
  3077a7:      	vpslld	$0x7, %ymm12, %ymm12
  3077ad:      	vpor	%ymm14, %ymm12, %ymm12
  3077b2:      	vpshufd	$0x93, %ymm12, %ymm12   # ymm12 = ymm12[3,0,1,2,7,4,5,6]
  3077b8:      	vpshufd	$0x4e, %ymm11, %ymm11   # ymm11 = ymm11[2,3,0,1,6,7,4,5]
  3077be:      	vpshufd	$0x39, %ymm13, %ymm13   # ymm13 = ymm13[1,2,3,0,5,6,7,4]
  3077c4:      	vpaddd	%ymm6, %ymm7, %ymm6
  3077c8:      	vpxor	%ymm6, %ymm9, %ymm9
  3077cc:      	vpshufb	%ymm4, %ymm9, %ymm9
  3077d1:      	vpaddd	%ymm9, %ymm8, %ymm8
  3077d6:      	vpxor	%ymm7, %ymm8, %ymm7
  3077da:      	vpsrld	$0x14, %ymm7, %ymm14
  3077df:      	vpslld	$0xc, %ymm7, %ymm7
  3077e4:      	vpor	%ymm7, %ymm14, %ymm7
  3077e8:      	vpaddd	%ymm6, %ymm7, %ymm6
  3077ec:      	vpxor	%ymm6, %ymm9, %ymm9
  3077f0:      	vpshufb	%ymm5, %ymm9, %ymm9
  3077f5:      	vpaddd	%ymm9, %ymm8, %ymm8
  3077fa:      	vpxor	%ymm7, %ymm8, %ymm7
  3077fe:      	vpsrld	$0x19, %ymm7, %ymm14
  307803:      	vpslld	$0x7, %ymm7, %ymm7
  307808:      	vpor	%ymm7, %ymm14, %ymm7
  30780c:      	vpshufd	$0x93, %ymm7, %ymm7     # ymm7 = ymm7[3,0,1,2,7,4,5,6]
  307811:      	vpshufd	$0x4e, %ymm8, %ymm8     # ymm8 = ymm8[2,3,0,1,6,7,4,5]
  307817:      	vpshufd	$0x39, %ymm9, %ymm9     # ymm9 = ymm9[1,2,3,0,5,6,7,4]
  30781d:      	incq	%rax
  307820:      	addq	$0x30, %r8
  307824:      	cmpq	$0xa, %rax
  307828:      	je	0x30793a <toyos_crypto::arch::x86_64::chacha::avx2::keystream+0xcfa>
  30782e:      	leaq	(%rax,%rax,2), %r13
  307832:      	leaq	(%rax,%rax,2), %r15
  307836:      	addq	$0x3, %r15
  30783a:      	cmpq	%r15, %r9
  30783d:      	cmovbq	%r9, %r15
  307841:      	cmpq	%r13, %r9
  307844:      	jbe	0x30769f <toyos_crypto::arch::x86_64::chacha::avx2::keystream+0xa5f>
  30784a:      	movq	%rax, 0x40(%rsp)
  30784f:      	movq	0x10(%rsp), %rax
  307854:      	movq	(%rax), %rsi
  307857:      	movq	0x8(%rax), %rcx
  30785b:      	movq	0x10(%rax), %rax
  30785f:      	movq	%r8, 0x20(%rsp)
  307864:      	nopw	%cs:(%rax,%rax)
  307870:      	incq	%r13
  307873:      	addq	(%r8), %rsi
  307876:      	adcq	0x8(%r8), %rcx
  30787a:      	adcq	$0x1, %rax
  30787e:      	movq	%rsi, %rdx
  307881:      	mulxq	%r11, %r12, %r9
  307886:      	movq	%rcx, %rdx
  307889:      	mulxq	%r14, %r10, %rdi
  30788e:      	addq	%r12, %r10
  307891:      	adcq	%r9, %rdi
  307894:      	movq	%rsi, %rdx
  307897:      	mulxq	%rbx, %r9, %rsi
  30789c:      	movq	%rcx, %rdx
  30789f:      	mulxq	%r11, %rcx, %r12
  3078a4:      	addq	%r9, %rcx
  3078a7:      	adcq	%rsi, %r12
  3078aa:      	movq	%rax, %rdx
  3078ad:      	mulxq	%r14, %rsi, %rdx
  3078b2:      	addq	%rdi, %rcx
  3078b5:      	adcq	$0x0, %r12
  3078b9:      	addq	%rsi, %rcx
  3078bc:      	adcq	%rdx, %r12
  3078bf:      	imulq	%r11, %rax
  3078c3:      	addq	%r12, %rax
  3078c6:      	movq	%rax, %rdx
  3078c9:      	shrq	$0x2, %rdx
  3078cd:      	leaq	(%rdx,%rdx,4), %rsi
  3078d1:      	andl	$0x3, %eax
  3078d4:      	addq	%r10, %rsi
  3078d7:      	adcq	$0x0, %rcx
  3078db:      	adcq	$0x0, %rax
  3078df:      	addq	$0x10, %r8
  3078e3:      	cmpq	%r15, %r13
  3078e6:      	jb	0x307870 <toyos_crypto::arch::x86_64::chacha::avx2::keystream+0xc30>
  3078e8:      	jmp	0x307680 <toyos_crypto::arch::x86_64::chacha::avx2::keystream+0xa40>
  3078ed:      	vpaddd	-0x22a615(%rip), %ymm5, %ymm3 # 0xdd2e0 <anon.8939df2432453ca20e81ebdf34edf285.6.llvm.7823267031421506494+0x40>
  3078f5:      	vpaddd	%ymm0, %ymm7, %ymm0
  3078f9:      	vpaddd	%ymm1, %ymm6, %ymm1
  3078fd:      	vpaddd	%ymm2, %ymm8, %ymm2
  307901:      	vperm2i128	$0x31, %ymm0, %ymm3, %ymm4 # ymm4 = ymm3[2,3],ymm0[2,3]
  307907:      	vinserti128	$0x1, %xmm0, %ymm3, %ymm0
  30790d:      	movq	0x18(%rbp), %rdx
  307911:      	vmovdqu	%ymm0, (%rdx)
  307915:      	vinserti128	$0x1, %xmm2, %ymm1, %ymm0
  30791b:      	vmovdqu	%ymm0, 0x20(%rdx)
  307920:      	vmovdqu	%ymm4, 0x40(%rdx)
  307925:      	vperm2i128	$0x31, %ymm2, %ymm1, %ymm0 # ymm0 = ymm1[2,3],ymm2[2,3]
  30792b:      	movl	$0x70, %eax
  307930:      	movl	$0x60, %ecx
  307935:      	jmp	0x3079cc <toyos_crypto::arch::x86_64::chacha::avx2::keystream+0xd8c>
  30793a:      	vbroadcasti128	-0x25c373(%rip), %ymm4 # ymm4 = mem[0,1,0,1]
                                                # 0xab5d0 <anon.8f05f5ce7f0f4279f4e4ff868a9a7cdb.1.llvm.15570882130572041406>
  307943:      	vpaddd	%ymm4, %ymm10, %ymm5
  307947:      	vpaddd	%ymm0, %ymm12, %ymm10
  30794b:      	vpaddd	%ymm1, %ymm11, %ymm11
  30794f:      	vpaddd	%ymm2, %ymm13, %ymm2
  307953:      	vperm2i128	$0x31, %ymm10, %ymm5, %ymm12 # ymm12 = ymm5[2,3],ymm10[2,3]
  307959:      	vinserti128	$0x1, %xmm10, %ymm5, %ymm5
  30795f:      	movq	0x18(%rbp), %rdx
  307963:      	vmovdqu	%ymm5, (%rdx)
  307967:      	vinserti128	$0x1, %xmm2, %ymm11, %ymm5
  30796d:      	vmovdqu	%ymm5, 0x20(%rdx)
  307972:      	vmovdqu	%ymm12, 0x40(%rdx)
  307977:      	vperm2i128	$0x31, %ymm2, %ymm11, %ymm2 # ymm2 = ymm11[2,3],ymm2[2,3]
  30797d:      	vpaddd	%ymm3, %ymm9, %ymm3
  307981:      	vpaddd	%ymm1, %ymm8, %ymm1
  307985:      	vpaddd	%ymm0, %ymm7, %ymm0
  307989:      	vpaddd	%ymm4, %ymm6, %ymm4
  30798d:      	vmovdqu	%ymm2, 0x60(%rdx)
  307992:      	vperm2i128	$0x31, %ymm0, %ymm4, %ymm2 # ymm2 = ymm4[2,3],ymm0[2,3]
  307998:      	vinserti128	$0x1, %xmm0, %ymm4, %ymm0
  30799e:      	vmovdqu	%ymm0, 0x80(%rdx)
  3079a6:      	vinserti128	$0x1, %xmm3, %ymm1, %ymm0
  3079ac:      	vmovdqu	%ymm0, 0xa0(%rdx)
  3079b4:      	vmovdqu	%ymm2, 0xc0(%rdx)
  3079bc:      	vperm2i128	$0x31, %ymm3, %ymm1, %ymm0 # ymm0 = ymm1[2,3],ymm3[2,3]
  3079c2:      	movl	$0xf0, %eax
  3079c7:      	movl	$0xe0, %ecx
  3079cc:      	vmovdqu	%xmm0, (%rdx,%rcx)
  3079d1:      	vextracti128	$0x1, %ymm0, (%rdx,%rax)
  3079d8:      	cmpq	$0x1f, %r9
  3079dc:      	jb	0x307a88 <toyos_crypto::arch::x86_64::chacha::avx2::keystream+0xe48>
  3079e2:      	movq	0x10(%rsp), %rax
  3079e7:      	movq	(%rax), %rsi
  3079ea:      	movq	0x8(%rax), %rcx
  3079ee:      	movq	0x10(%rax), %rax
  3079f2:      	shlq	$0x4, %r9
  3079f6:      	movl	$0x1e0, %edi            # imm = 0x1E0
  3079fb:      	movq	0x78(%rsp), %r13
  307a00:      	addq	(%r13,%rdi), %rsi
  307a05:      	adcq	0x8(%r13,%rdi), %rcx
  307a0a:      	adcq	$0x1, %rax
  307a0e:      	movq	%rsi, %rdx
  307a11:      	mulxq	%r11, %r10, %r12
  307a16:      	movq	%rcx, %rdx
  307a19:      	mulxq	%r14, %r8, %r15
  307a1e:      	addq	%r10, %r8
  307a21:      	adcq	%r12, %r15
  307a24:      	movq	%rsi, %rdx
  307a27:      	mulxq	%rbx, %r12, %rsi
  307a2c:      	movq	%rcx, %rdx
  307a2f:      	mulxq	%r11, %rcx, %r10
  307a34:      	addq	%r12, %rcx
  307a37:      	adcq	%rsi, %r10
  307a3a:      	movq	%rax, %rdx
  307a3d:      	mulxq	%r14, %rsi, %rdx
  307a42:      	addq	%r15, %rcx
  307a45:      	adcq	$0x0, %r10
  307a49:      	addq	%rsi, %rcx
  307a4c:      	adcq	%rdx, %r10
  307a4f:      	imulq	%r11, %rax
  307a53:      	addq	%r10, %rax
  307a56:      	movq	%rax, %rdx
  307a59:      	shrq	$0x2, %rdx
  307a5d:      	leaq	(%rdx,%rdx,4), %rsi
  307a61:      	andl	$0x3, %eax
  307a64:      	addq	%r8, %rsi
  307a67:      	adcq	$0x0, %rcx
  307a6b:      	adcq	$0x0, %rax
  307a6f:      	addq	$0x10, %rdi
  307a73:      	cmpq	%rdi, %r9
  307a76:      	jne	0x307a00 <toyos_crypto::arch::x86_64::chacha::avx2::keystream+0xdc0>
  307a78:      	movq	0x10(%rsp), %rdx
  307a7d:      	movq	%rsi, (%rdx)
  307a80:      	movq	%rcx, 0x8(%rdx)
  307a84:      	movq	%rax, 0x10(%rdx)
  307a88:      	leaq	-0x28(%rbp), %rsp
  307a8c:      	popq	%rbx
  307a8d:      	popq	%r12
  307a8f:      	popq	%r13
  307a91:      	popq	%r14
  307a93:      	popq	%r15
  307a95:      	popq	%rbp
  307a96:      	vzeroupper
  307a99:      	retq
  307a9a:      	int3
  307a9b:      	int3
  307a9c:      	int3
  307a9d:      	int3
  307a9e:      	int3
  307a9f:      	int3
