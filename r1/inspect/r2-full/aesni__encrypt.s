
stage/probe-full-7dcf12a5a:	file format elf64-x86-64

Disassembly of section .text:

00000000002ffb20 <toyos_crypto::arch::x86_64::aesni::encrypt>:
  2ffb20:      	push	rbp
  2ffb21:      	mov	rbp, rsp
  2ffb24:      	movdqu	xmm11, xmmword ptr [rdi]
  2ffb29:      	movdqu	xmm10, xmmword ptr [rdi + 0x10]
  2ffb2f:      	movdqu	xmm9, xmmword ptr [rdi + 0x20]
  2ffb35:      	movdqu	xmm8, xmmword ptr [rdi + 0x30]
  2ffb3b:      	movdqu	xmm7, xmmword ptr [rdi + 0x40]
  2ffb40:      	movdqu	xmm6, xmmword ptr [rdi + 0x50]
  2ffb45:      	movdqu	xmm5, xmmword ptr [rdi + 0x60]
  2ffb4a:      	movdqu	xmm4, xmmword ptr [rdi + 0x70]
  2ffb4f:      	movdqu	xmm3, xmmword ptr [rdi + 0x80]
  2ffb57:      	movdqu	xmm2, xmmword ptr [rdi + 0x90]
  2ffb5f:      	movdqu	xmm1, xmmword ptr [rdi + 0xa0]
  2ffb67:      	movdqu	xmm0, xmmword ptr [rdx]
  2ffb6b:      	pxor	xmm0, xmm11
  2ffb70:      	cmp	rsi, 0xa
  2ffb74:      	jne	0x2ffbad <toyos_crypto::arch::x86_64::aesni::encrypt+0x8d>
  2ffb76:      	aesenc	xmm0, xmm10
  2ffb7c:      	aesenc	xmm0, xmm9
  2ffb82:      	aesenc	xmm0, xmm8
  2ffb88:      	aesenc	xmm0, xmm7
  2ffb8d:      	aesenc	xmm0, xmm6
  2ffb92:      	aesenc	xmm0, xmm5
  2ffb97:      	aesenc	xmm0, xmm4
  2ffb9c:      	aesenc	xmm0, xmm3
  2ffba1:      	aesenc	xmm0, xmm2
  2ffba6:      	aesenclast	xmm0, xmm1
  2ffbab:      	jmp	0x2ffc1e <toyos_crypto::arch::x86_64::aesni::encrypt+0xfe>
  2ffbad:      	movdqu	xmm11, xmmword ptr [rdi + 0xb0]
  2ffbb6:      	movdqu	xmm12, xmmword ptr [rdi + 0xc0]
  2ffbbf:      	movdqu	xmm13, xmmword ptr [rdi + 0xd0]
  2ffbc8:      	movdqu	xmm14, xmmword ptr [rdi + 0xe0]
  2ffbd1:      	aesenc	xmm0, xmm10
  2ffbd7:      	aesenc	xmm0, xmm9
  2ffbdd:      	aesenc	xmm0, xmm8
  2ffbe3:      	aesenc	xmm0, xmm7
  2ffbe8:      	aesenc	xmm0, xmm6
  2ffbed:      	aesenc	xmm0, xmm5
  2ffbf2:      	aesenc	xmm0, xmm4
  2ffbf7:      	aesenc	xmm0, xmm3
  2ffbfc:      	aesenc	xmm0, xmm2
  2ffc01:      	aesenc	xmm0, xmm1
  2ffc06:      	aesenc	xmm0, xmm11
  2ffc0c:      	aesenc	xmm0, xmm12
  2ffc12:      	aesenc	xmm0, xmm13
  2ffc18:      	aesenclast	xmm0, xmm14
  2ffc1e:      	movdqu	xmmword ptr [rdx], xmm0
  2ffc22:      	pop	rbp
  2ffc23:      	ret
  2ffc24:      	int3
  2ffc25:      	int3
  2ffc26:      	int3
  2ffc27:      	int3
  2ffc28:      	int3
  2ffc29:      	int3
  2ffc2a:      	int3
  2ffc2b:      	int3
  2ffc2c:      	int3
  2ffc2d:      	int3
  2ffc2e:      	int3
  2ffc2f:      	int3
