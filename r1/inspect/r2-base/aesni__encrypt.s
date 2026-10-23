
stage/probe-base-02301e02b:	file format elf64-x86-64

Disassembly of section .text:

00000000002ff5b0 <toyos_crypto::arch::x86_64::aesni::encrypt>:
  2ff5b0:      	push	rbp
  2ff5b1:      	mov	rbp, rsp
  2ff5b4:      	movdqu	xmm11, xmmword ptr [rdi]
  2ff5b9:      	movdqu	xmm10, xmmword ptr [rdi + 0x10]
  2ff5bf:      	movdqu	xmm9, xmmword ptr [rdi + 0x20]
  2ff5c5:      	movdqu	xmm8, xmmword ptr [rdi + 0x30]
  2ff5cb:      	movdqu	xmm7, xmmword ptr [rdi + 0x40]
  2ff5d0:      	movdqu	xmm6, xmmword ptr [rdi + 0x50]
  2ff5d5:      	movdqu	xmm5, xmmword ptr [rdi + 0x60]
  2ff5da:      	movdqu	xmm4, xmmword ptr [rdi + 0x70]
  2ff5df:      	movdqu	xmm3, xmmword ptr [rdi + 0x80]
  2ff5e7:      	movdqu	xmm2, xmmword ptr [rdi + 0x90]
  2ff5ef:      	movdqu	xmm1, xmmword ptr [rdi + 0xa0]
  2ff5f7:      	movdqu	xmm0, xmmword ptr [rdx]
  2ff5fb:      	pxor	xmm0, xmm11
  2ff600:      	cmp	rsi, 0xa
  2ff604:      	jne	0x2ff63d <toyos_crypto::arch::x86_64::aesni::encrypt+0x8d>
  2ff606:      	aesenc	xmm0, xmm10
  2ff60c:      	aesenc	xmm0, xmm9
  2ff612:      	aesenc	xmm0, xmm8
  2ff618:      	aesenc	xmm0, xmm7
  2ff61d:      	aesenc	xmm0, xmm6
  2ff622:      	aesenc	xmm0, xmm5
  2ff627:      	aesenc	xmm0, xmm4
  2ff62c:      	aesenc	xmm0, xmm3
  2ff631:      	aesenc	xmm0, xmm2
  2ff636:      	aesenclast	xmm0, xmm1
  2ff63b:      	jmp	0x2ff6ae <toyos_crypto::arch::x86_64::aesni::encrypt+0xfe>
  2ff63d:      	movdqu	xmm11, xmmword ptr [rdi + 0xb0]
  2ff646:      	movdqu	xmm12, xmmword ptr [rdi + 0xc0]
  2ff64f:      	movdqu	xmm13, xmmword ptr [rdi + 0xd0]
  2ff658:      	movdqu	xmm14, xmmword ptr [rdi + 0xe0]
  2ff661:      	aesenc	xmm0, xmm10
  2ff667:      	aesenc	xmm0, xmm9
  2ff66d:      	aesenc	xmm0, xmm8
  2ff673:      	aesenc	xmm0, xmm7
  2ff678:      	aesenc	xmm0, xmm6
  2ff67d:      	aesenc	xmm0, xmm5
  2ff682:      	aesenc	xmm0, xmm4
  2ff687:      	aesenc	xmm0, xmm3
  2ff68c:      	aesenc	xmm0, xmm2
  2ff691:      	aesenc	xmm0, xmm1
  2ff696:      	aesenc	xmm0, xmm11
  2ff69c:      	aesenc	xmm0, xmm12
  2ff6a2:      	aesenc	xmm0, xmm13
  2ff6a8:      	aesenclast	xmm0, xmm14
  2ff6ae:      	movdqu	xmmword ptr [rdx], xmm0
  2ff6b2:      	pop	rbp
  2ff6b3:      	ret
  2ff6b4:      	int3
  2ff6b5:      	int3
  2ff6b6:      	int3
  2ff6b7:      	int3
  2ff6b8:      	int3
  2ff6b9:      	int3
  2ff6ba:      	int3
  2ff6bb:      	int3
  2ff6bc:      	int3
  2ff6bd:      	int3
  2ff6be:      	int3
  2ff6bf:      	int3
