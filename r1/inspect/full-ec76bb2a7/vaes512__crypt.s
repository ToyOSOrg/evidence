
stage/probe-full-ec76bb2a7:	file format elf64-x86-64

Disassembly of section .text:

000000000030dc00 <toyos_crypto::arch::x86_64::vaes512::crypt>:
  30dc00:      	push	rbp
  30dc01:      	mov	rbp, rsp
  30dc04:      	mov	rax, r9
  30dc07:      	movzx	r10d, byte ptr [rbp + 0x18]
  30dc0c:      	mov	r9, qword ptr [rbp + 0x10]
  30dc10:      	cmp	rsi, 0xa
  30dc14:      	jne	0x30dc2d <toyos_crypto::arch::x86_64::vaes512::crypt+0x2d>
  30dc16:      	mov	rsi, rdx
  30dc19:      	mov	rdx, rcx
  30dc1c:      	mov	rcx, r8
  30dc1f:      	mov	r8, rax
  30dc22:      	test	r10b, r10b
  30dc25:      	je	0x30dc44 <toyos_crypto::arch::x86_64::vaes512::crypt+0x44>
  30dc27:      	pop	rbp
  30dc28:      	jmp	0x30e580 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>>
  30dc2d:      	mov	rsi, rdx
  30dc30:      	mov	rdx, rcx
  30dc33:      	mov	rcx, r8
  30dc36:      	mov	r8, rax
  30dc39:      	test	r10b, r10b
  30dc3c:      	je	0x30dc4a <toyos_crypto::arch::x86_64::vaes512::crypt+0x4a>
  30dc3e:      	pop	rbp
  30dc3f:      	jmp	0x30f400 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>>
  30dc44:      	pop	rbp
  30dc45:      	jmp	0x30ddd0 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>>
  30dc4a:      	pop	rbp
  30dc4b:      	jmp	0x30eb80 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>>
