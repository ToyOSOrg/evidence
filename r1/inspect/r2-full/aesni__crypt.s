
stage/probe-full-7dcf12a5a:	file format elf64-x86-64

Disassembly of section .text:

00000000002ff3a0 <toyos_crypto::arch::x86_64::aesni::crypt>:
  2ff3a0:      	push	rbp
  2ff3a1:      	mov	rbp, rsp
  2ff3a4:      	mov	rax, r9
  2ff3a7:      	movzx	r10d, byte ptr [rbp + 0x18]
  2ff3ac:      	mov	r9, qword ptr [rbp + 0x10]
  2ff3b0:      	cmp	rsi, 0xa
  2ff3b4:      	jne	0x2ff3cd <toyos_crypto::arch::x86_64::aesni::crypt+0x2d>
  2ff3b6:      	mov	rsi, rdx
  2ff3b9:      	mov	rdx, rcx
  2ff3bc:      	mov	rcx, r8
  2ff3bf:      	mov	r8, rax
  2ff3c2:      	test	r10b, r10b
  2ff3c5:      	je	0x2ff3e4 <toyos_crypto::arch::x86_64::aesni::crypt+0x44>
  2ff3c7:      	pop	rbp
  2ff3c8:      	jmp	0x311b00 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, true>>
  2ff3cd:      	mov	rsi, rdx
  2ff3d0:      	mov	rdx, rcx
  2ff3d3:      	mov	rcx, r8
  2ff3d6:      	mov	r8, rax
  2ff3d9:      	test	r10b, r10b
  2ff3dc:      	je	0x2ff3ea <toyos_crypto::arch::x86_64::aesni::crypt+0x4a>
  2ff3de:      	pop	rbp
  2ff3df:      	jmp	0x313010 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, true>>
  2ff3e4:      	pop	rbp
  2ff3e5:      	jmp	0x310cd0 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, false>>
  2ff3ea:      	pop	rbp
  2ff3eb:      	jmp	0x3123d0 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, false>>
