
stage/probe-full-ec76bb2a7:	file format elf64-x86-64

Disassembly of section .text:

00000000002ff360 <toyos_crypto::arch::x86_64::aesni::crypt>:
  2ff360:      	push	rbp
  2ff361:      	mov	rbp, rsp
  2ff364:      	mov	rax, r9
  2ff367:      	movzx	r10d, byte ptr [rbp + 0x18]
  2ff36c:      	mov	r9, qword ptr [rbp + 0x10]
  2ff370:      	cmp	rsi, 0xa
  2ff374:      	jne	0x2ff38d <toyos_crypto::arch::x86_64::aesni::crypt+0x2d>
  2ff376:      	mov	rsi, rdx
  2ff379:      	mov	rdx, rcx
  2ff37c:      	mov	rcx, r8
  2ff37f:      	mov	r8, rax
  2ff382:      	test	r10b, r10b
  2ff385:      	je	0x2ff3a4 <toyos_crypto::arch::x86_64::aesni::crypt+0x44>
  2ff387:      	pop	rbp
  2ff388:      	jmp	0x311990 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, true>>
  2ff38d:      	mov	rsi, rdx
  2ff390:      	mov	rdx, rcx
  2ff393:      	mov	rcx, r8
  2ff396:      	mov	r8, rax
  2ff399:      	test	r10b, r10b
  2ff39c:      	je	0x2ff3aa <toyos_crypto::arch::x86_64::aesni::crypt+0x4a>
  2ff39e:      	pop	rbp
  2ff39f:      	jmp	0x313340 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, true>>
  2ff3a4:      	pop	rbp
  2ff3a5:      	jmp	0x310b90 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<10, false>>
  2ff3aa:      	pop	rbp
  2ff3ab:      	jmp	0x312240 <toyos_crypto::arch::x86_64::aesni::crypt_rounds::<14, false>>
