
toyos/crypto_parity:	file format elf64-x86-64

Disassembly of section .text:

00000000000c5ff0 <toyos_crypto::secret::wipe>:
   c5ff0:      	push	rbp
   c5ff1:      	mov	rbp, rsp
   c5ff4:      	movabs	rdx, 0x7ffffffffffffff0
   c5ffe:      	and	rdx, rsi
   c6001:      	lea	rax, [rdi + rdx]
   c6005:      	mov	ecx, esi
   c6007:      	and	ecx, 0xf
   c600a:      	test	rdx, rdx
   c600d:      	je	0xc6088 <toyos_crypto::secret::wipe+0x98>
   c600f:      	lea	rdx, [rsi - 0x10]
   c6013:      	mov	r8d, edx
   c6016:      	not	r8d
   c6019:      	test	r8b, 0x30
   c601d:      	je	0xc6044 <toyos_crypto::secret::wipe+0x54>
   c601f:      	mov	r8d, edx
   c6022:      	shr	r8d, 0x4
   c6026:      	inc	r8d
   c6029:      	and	r8d, 0x3
   c602d:      	xorps	xmm0, xmm0
   c6030:      	movaps	xmmword ptr [rbp - 0x10], xmm0
   c6034:      	movaps	xmm1, xmmword ptr [rbp - 0x10]
   c6038:      	movups	xmmword ptr [rdi], xmm1
   c603b:      	add	rdi, 0x10
   c603f:      	dec	r8
   c6042:      	jne	0xc6030 <toyos_crypto::secret::wipe+0x40>
   c6044:      	cmp	rdx, 0x30
   c6048:      	jb	0xc6088 <toyos_crypto::secret::wipe+0x98>
   c604a:      	xorps	xmm0, xmm0
   c604d:      	nop	dword ptr [rax]
   c6050:      	movaps	xmmword ptr [rbp - 0x10], xmm0
   c6054:      	movaps	xmm1, xmmword ptr [rbp - 0x10]
   c6058:      	movups	xmmword ptr [rdi], xmm1
   c605b:      	movaps	xmmword ptr [rbp - 0x10], xmm0
   c605f:      	movaps	xmm1, xmmword ptr [rbp - 0x10]
   c6063:      	movups	xmmword ptr [rdi + 0x10], xmm1
   c6067:      	movaps	xmmword ptr [rbp - 0x10], xmm0
   c606b:      	movaps	xmm1, xmmword ptr [rbp - 0x10]
   c606f:      	movups	xmmword ptr [rdi + 0x20], xmm1
   c6073:      	movaps	xmmword ptr [rbp - 0x10], xmm0
   c6077:      	movaps	xmm1, xmmword ptr [rbp - 0x10]
   c607b:      	movups	xmmword ptr [rdi + 0x30], xmm1
   c607f:      	add	rdi, 0x40
   c6083:      	cmp	rdi, rax
   c6086:      	jne	0xc6050 <toyos_crypto::secret::wipe+0x60>
   c6088:      	test	rcx, rcx
   c608b:      	je	0xc60e8 <toyos_crypto::secret::wipe+0xf8>
   c608d:      	mov	rdx, rax
   c6090:      	and	rsi, 0x7
   c6094:      	je	0xc60ab <toyos_crypto::secret::wipe+0xbb>
   c6096:      	mov	rdx, rax
   c6099:      	nop	dword ptr [rax]
   c60a0:      	mov	byte ptr [rdx], 0x0
   c60a3:      	inc	rdx
   c60a6:      	dec	rsi
   c60a9:      	jne	0xc60a0 <toyos_crypto::secret::wipe+0xb0>
   c60ab:      	cmp	ecx, 0x8
   c60ae:      	jb	0xc60e8 <toyos_crypto::secret::wipe+0xf8>
   c60b0:      	add	rax, rcx
   c60b3:      	nop	word ptr cs:[rax + rax]
   c60c0:      	mov	byte ptr [rdx], 0x0
   c60c3:      	mov	byte ptr [rdx + 0x1], 0x0
   c60c7:      	mov	byte ptr [rdx + 0x2], 0x0
   c60cb:      	mov	byte ptr [rdx + 0x3], 0x0
   c60cf:      	mov	byte ptr [rdx + 0x4], 0x0
   c60d3:      	mov	byte ptr [rdx + 0x5], 0x0
   c60d7:      	mov	byte ptr [rdx + 0x6], 0x0
   c60db:      	mov	byte ptr [rdx + 0x7], 0x0
   c60df:      	add	rdx, 0x8
   c60e3:      	cmp	rdx, rax
   c60e6:      	jne	0xc60c0 <toyos_crypto::secret::wipe+0xd0>
   c60e8:      	pop	rbp
   c60e9:      	ret
   c60ea:      	int3
   c60eb:      	int3
   c60ec:      	int3
   c60ed:      	int3
   c60ee:      	int3
   c60ef:      	int3
