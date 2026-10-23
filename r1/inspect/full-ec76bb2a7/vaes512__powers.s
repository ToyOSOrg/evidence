
stage/probe-full-ec76bb2a7:	file format elf64-x86-64

Disassembly of section .text:

000000000030dc50 <toyos_crypto::arch::x86_64::vaes512::powers>:
  30dc50:      	push	rbp
  30dc51:      	mov	rbp, rsp
  30dc54:      	push	rbx
  30dc55:      	sub	rsp, 0x28
  30dc59:      	mov	rbx, rsi
  30dc5c:      	call	0x2ff8a0 <toyos_crypto::arch::x86_64::aesni::powers>
  30dc61:      	vbroadcasti32x4	zmm0, xmmword ptr [rbx + 0x200] # zmm0 = mem[0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3]
  30dc68:      	mov	qword ptr [rbp - 0x18], 0x10
  30dc70:      	mov	qword ptr [rbp - 0x10], 0x0
  30dc78:      	xor	ecx, ecx
  30dc7a:      	vpbroadcastq	zmm1, qword ptr [rip - 0x262c54] # 0xab030 <sdallocx+0xab030>
  30dc84:      	xor	eax, eax
  30dc86:      	mov	rdx, qword ptr [rbp + 8*rax - 0x18]
  30dc8b:      	cmp	rdx, -0x11
  30dc8f:      	ja	0x30ddbc <toyos_crypto::arch::x86_64::vaes512::powers+0x16c>
  30dc95:      	lea	rdi, [rdx + 0x10]
  30dc99:      	mov	rax, rdx
  30dc9c:      	shr	rax, 0x2
  30dca0:      	cmp	rax, 0xc
  30dca4:      	mov	esi, 0xc
  30dca9:      	cmovb	rsi, rax
  30dcad:      	add	rsi, -0xc
  30dcb1:      	mov	r8, rax
  30dcb4:      	shl	r8, 0x6
  30dcb8:      	add	rdx, 0xc
  30dcbc:      	mov	r9, rdi
  30dcbf:      	shl	r9, 0x4
  30dcc3:      	and	r9, -0x40
  30dcc7:      	mov	r11, rbx
  30dcca:      	xor	r10d, r10d
  30dccd:      	nop	dword ptr [rax]
  30dcd0:      	add	rdx, 0x4
  30dcd4:      	cmp	rdx, 0x30
  30dcd8:      	jae	0x30dd85 <toyos_crypto::arch::x86_64::vaes512::powers+0x135>
  30dcde:      	cmp	rsi, r10
  30dce1:      	je	0x30dda1 <toyos_crypto::arch::x86_64::vaes512::powers+0x151>
  30dce7:      	dec	r10
  30dcea:      	vmovdqu64	zmm2, zmmword ptr [r11 + r9]
  30dcf1:      	vpclmulqdq	zmm3, zmm2, zmm0, 0x11
  30dcf8:      	vpclmulqdq	zmm4, zmm2, zmm0, 0x10
  30dcff:      	vpclmulqdq	zmm5, zmm2, zmm0, 0x1
  30dd06:      	vpxorq	zmm4, zmm5, zmm4
  30dd0c:      	vpsrldq	zmm5, zmm4, 0x8         # zmm5 = zmm4[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero,zmm4[24,25,26,27,28,29,30,31],zero,zero,zero,zero,zero,zero,zero,zero,zmm4[40,41,42,43,44,45,46,47],zero,zero,zero,zero,zero,zero,zero,zero,zmm4[56,57,58,59,60,61,62,63],zero,zero,zero,zero,zero,zero,zero,zero
  30dd13:      	vpxorq	zmm3, zmm3, zmm5
  30dd19:      	vpclmulqdq	zmm2, zmm2, zmm0, 0x0
  30dd20:      	vpslldq	zmm4, zmm4, 0x8         # zmm4 = zero,zero,zero,zero,zero,zero,zero,zero,zmm4[0,1,2,3,4,5,6,7],zero,zero,zero,zero,zero,zero,zero,zero,zmm4[16,17,18,19,20,21,22,23],zero,zero,zero,zero,zero,zero,zero,zero,zmm4[32,33,34,35,36,37,38,39],zero,zero,zero,zero,zero,zero,zero,zero,zmm4[48,49,50,51,52,53,54,55]
  30dd27:      	vpxord	zmm2, zmm4, zmm2
  30dd2d:      	vpshufd	zmm4, zmm2, 0x4e        # zmm4 = zmm2[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30dd34:      	vpclmulqdq	zmm2, zmm2, zmm1, 0x0
  30dd3b:      	vpxorq	zmm2, zmm2, zmm4
  30dd41:      	vpshufd	zmm4, zmm2, 0x4e        # zmm4 = zmm2[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30dd48:      	vpclmulqdq	zmm2, zmm2, zmm1, 0x0
  30dd4f:      	vpternlogq	zmm2, zmm3, zmm4, 0x96 # zmm2 = zmm2 ^ zmm3 ^ zmm4
  30dd56:      	vmovdqu64	zmmword ptr [r11 + r8], zmm2
  30dd5d:      	add	r11, 0x40
  30dd61:      	cmp	r10, -0x4
  30dd65:      	jne	0x30dcd0 <toyos_crypto::arch::x86_64::vaes512::powers+0x80>
  30dd6b:      	mov	eax, 0x1
  30dd70:      	test	cl, 0x1
  30dd73:      	mov	cl, 0x1
  30dd75:      	je	0x30dc86 <toyos_crypto::arch::x86_64::vaes512::powers+0x36>
  30dd7b:      	add	rsp, 0x28
  30dd7f:      	pop	rbx
  30dd80:      	pop	rbp
  30dd81:      	vzeroupper
  30dd84:      	ret
  30dd85:      	shr	rdi, 0x2
  30dd89:      	sub	rdi, r10
  30dd8c:      	lea	rdx, [rip + 0x4f7b2d]   # 0x8058c0 <anon.f91301331f2ac3e3eb2ad538a87aa794.7.llvm.3388403078394314149>
  30dd93:      	mov	esi, 0xc
  30dd98:      	vzeroupper
  30dd9b:      	call	qword ptr [rip + 0x5699df] # 0x877780 <sdallocx+0x877780>
  30dda1:      	sub	rax, r10
  30dda4:      	lea	rdx, [rip + 0x4f7afd]   # 0x8058a8 <anon.f91301331f2ac3e3eb2ad538a87aa794.6.llvm.3388403078394314149>
  30ddab:      	mov	esi, 0xc
  30ddb0:      	mov	rdi, rax
  30ddb3:      	vzeroupper
  30ddb6:      	call	qword ptr [rip + 0x5699c4] # 0x877780 <sdallocx+0x877780>
  30ddbc:      	lea	rdi, [rip + 0x4f7acd]   # 0x805890 <anon.f91301331f2ac3e3eb2ad538a87aa794.5.llvm.3388403078394314149>
  30ddc3:      	vzeroupper
  30ddc6:      	call	qword ptr [rip + 0x56a76c] # 0x878538 <sdallocx+0x878538>
  30ddcc:      	int3
  30ddcd:      	int3
  30ddce:      	int3
  30ddcf:      	int3
