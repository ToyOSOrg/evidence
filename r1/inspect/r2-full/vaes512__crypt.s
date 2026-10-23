
stage/probe-full-7dcf12a5a:	file format elf64-x86-64

Disassembly of section .text:

000000000030dc50 <toyos_crypto::arch::x86_64::vaes512::crypt>:
  30dc50:      	push	rbp
  30dc51:      	mov	rbp, rsp
  30dc54:      	mov	rax, r9
  30dc57:      	movzx	r10d, byte ptr [rbp + 0x18]
  30dc5c:      	mov	r9, qword ptr [rbp + 0x10]
  30dc60:      	cmp	rsi, 0xa
  30dc64:      	jne	0x30dc7d <toyos_crypto::arch::x86_64::vaes512::crypt+0x2d>
  30dc66:      	mov	rsi, rdx
  30dc69:      	mov	rdx, rcx
  30dc6c:      	mov	rcx, r8
  30dc6f:      	mov	r8, rax
  30dc72:      	test	r10b, r10b
  30dc75:      	je	0x30dc94 <toyos_crypto::arch::x86_64::vaes512::crypt+0x44>
  30dc77:      	pop	rbp
  30dc78:      	jmp	0x30e740 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, true>>
  30dc7d:      	mov	rsi, rdx
  30dc80:      	mov	rdx, rcx
  30dc83:      	mov	rcx, r8
  30dc86:      	mov	r8, rax
  30dc89:      	test	r10b, r10b
  30dc8c:      	je	0x30dc9a <toyos_crypto::arch::x86_64::vaes512::crypt+0x4a>
  30dc8e:      	pop	rbp
  30dc8f:      	jmp	0x30f580 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, true>>
  30dc94:      	pop	rbp
  30dc95:      	jmp	0x30df80 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<10, false>>
  30dc9a:      	pop	rbp
  30dc9b:      	jmp	0x30ed50 <toyos_crypto::arch::x86_64::vaes512::crypt_body::<14, false>>
