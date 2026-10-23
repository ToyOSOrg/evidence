
stage/probe-full-ec76bb2a7:	file format elf64-x86-64

Disassembly of section .text:

00000000002ffad0 <toyos_crypto::arch::x86_64::aesni::encrypt>:
  2ffad0:      	push	rbp
  2ffad1:      	mov	rbp, rsp
  2ffad4:      	movdqu	xmm11, xmmword ptr [rdi]
  2ffad9:      	movdqu	xmm10, xmmword ptr [rdi + 0x10]
  2ffadf:      	movdqu	xmm9, xmmword ptr [rdi + 0x20]
  2ffae5:      	movdqu	xmm8, xmmword ptr [rdi + 0x30]
  2ffaeb:      	movdqu	xmm7, xmmword ptr [rdi + 0x40]
  2ffaf0:      	movdqu	xmm6, xmmword ptr [rdi + 0x50]
  2ffaf5:      	movdqu	xmm5, xmmword ptr [rdi + 0x60]
  2ffafa:      	movdqu	xmm4, xmmword ptr [rdi + 0x70]
  2ffaff:      	movdqu	xmm3, xmmword ptr [rdi + 0x80]
  2ffb07:      	movdqu	xmm2, xmmword ptr [rdi + 0x90]
  2ffb0f:      	movdqu	xmm1, xmmword ptr [rdi + 0xa0]
  2ffb17:      	movdqu	xmm0, xmmword ptr [rdx]
  2ffb1b:      	pxor	xmm0, xmm11
  2ffb20:      	cmp	rsi, 0xa
  2ffb24:      	jne	0x2ffb5d <toyos_crypto::arch::x86_64::aesni::encrypt+0x8d>
  2ffb26:      	aesenc	xmm0, xmm10
  2ffb2c:      	aesenc	xmm0, xmm9
  2ffb32:      	aesenc	xmm0, xmm8
  2ffb38:      	aesenc	xmm0, xmm7
  2ffb3d:      	aesenc	xmm0, xmm6
  2ffb42:      	aesenc	xmm0, xmm5
  2ffb47:      	aesenc	xmm0, xmm4
  2ffb4c:      	aesenc	xmm0, xmm3
  2ffb51:      	aesenc	xmm0, xmm2
  2ffb56:      	aesenclast	xmm0, xmm1
  2ffb5b:      	jmp	0x2ffbce <toyos_crypto::arch::x86_64::aesni::encrypt+0xfe>
  2ffb5d:      	movdqu	xmm11, xmmword ptr [rdi + 0xb0]
  2ffb66:      	movdqu	xmm12, xmmword ptr [rdi + 0xc0]
  2ffb6f:      	movdqu	xmm13, xmmword ptr [rdi + 0xd0]
  2ffb78:      	movdqu	xmm14, xmmword ptr [rdi + 0xe0]
  2ffb81:      	aesenc	xmm0, xmm10
  2ffb87:      	aesenc	xmm0, xmm9
  2ffb8d:      	aesenc	xmm0, xmm8
  2ffb93:      	aesenc	xmm0, xmm7
  2ffb98:      	aesenc	xmm0, xmm6
  2ffb9d:      	aesenc	xmm0, xmm5
  2ffba2:      	aesenc	xmm0, xmm4
  2ffba7:      	aesenc	xmm0, xmm3
  2ffbac:      	aesenc	xmm0, xmm2
  2ffbb1:      	aesenc	xmm0, xmm1
  2ffbb6:      	aesenc	xmm0, xmm11
  2ffbbc:      	aesenc	xmm0, xmm12
  2ffbc2:      	aesenc	xmm0, xmm13
  2ffbc8:      	aesenclast	xmm0, xmm14
  2ffbce:      	movdqu	xmmword ptr [rdx], xmm0
  2ffbd2:      	pop	rbp
  2ffbd3:      	ret
  2ffbd4:      	int3
  2ffbd5:      	int3
  2ffbd6:      	int3
  2ffbd7:      	int3
  2ffbd8:      	int3
  2ffbd9:      	int3
  2ffbda:      	int3
  2ffbdb:      	int3
  2ffbdc:      	int3
  2ffbdd:      	int3
  2ffbde:      	int3
  2ffbdf:      	int3
