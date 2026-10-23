
stage/probe-full-7dcf12a5a:	file format elf64-x86-64

Disassembly of section .text:

000000000030dca0 <toyos_crypto::arch::x86_64::vaes512::powers>:
  30dca0:      	push	rbp
  30dca1:      	mov	rbp, rsp
  30dca4:      	and	rsp, -0x40
  30dca8:      	sub	rsp, 0x440
  30dcaf:      	mov	rax, rsi
  30dcb2:      	mov	rcx, qword ptr [rdi]
  30dcb5:      	mov	rdx, qword ptr [rdi + 0x8]
  30dcb9:      	vxorps	xmm0, xmm0, xmm0
  30dcbd:      	vmovups	zmmword ptr [rsp + 0xc0], zmm0
  30dcc5:      	vmovups	zmmword ptr [rsp + 0x90], zmm0
  30dcd0:      	vmovups	zmmword ptr [rsp + 0x50], zmm0
  30dcdb:      	bswap	rdx
  30dcde:      	bswap	rcx
  30dce1:      	vmovups	zmmword ptr [rsp + 0x10], zmm0
  30dcec:      	mov	rsi, rcx
  30dcef:      	shld	rsi, rdx, 0x1
  30dcf4:      	add	rdx, rdx
  30dcf7:      	sar	rcx, 0x3f
  30dcfb:      	movabs	rdi, -0x3e00000000000000
  30dd05:      	sub	rdx, rcx
  30dd08:      	and	rcx, rdi
  30dd0b:      	xor	rcx, rsi
  30dd0e:      	mov	qword ptr [rsp], rdx
  30dd12:      	mov	qword ptr [rsp + 0x8], rcx
  30dd17:      	mov	ecx, 0x1
  30dd1c:      	mov	edx, 0x10
  30dd21:      	xor	esi, esi
  30dd23:      	vmovq	xmm0, rdi
  30dd28:      	nop	dword ptr [rax + rax]
  30dd30:      	lea	rdi, [8*rcx]
  30dd38:      	and	rdi, -0x10
  30dd3c:      	mov	r8, rsi
  30dd3f:      	sub	r8, rdi
  30dd42:      	vmovdqa	xmm1, xmmword ptr [rsp + r8]
  30dd48:      	vmovdqa	xmm2, xmmword ptr [rsp + rdi]
  30dd4d:      	vpxorq	xmm3, xmm1, qword ptr [rsp + r8 + 0x8]{1to2}
  30dd55:      	vpclmulqdq	xmm4, xmm1, xmm2, 0x0
  30dd5b:      	vpclmulqdq	xmm1, xmm1, xmm2, 0x11
  30dd61:      	vpxorq	xmm2, xmm2, qword ptr [rsp + rdi + 0x8]{1to2}
  30dd69:      	vpclmulqdq	xmm2, xmm3, xmm2, 0x0
  30dd6f:      	vpternlogq	xmm2, xmm4, xmm1, 0x96 # xmm2 = xmm2 ^ xmm4 ^ xmm1
  30dd76:      	vpslldq	xmm3, xmm2, 0x8         # xmm3 = zero,zero,zero,zero,zero,zero,zero,zero,xmm2[0,1,2,3,4,5,6,7]
  30dd7b:      	vpxor	xmm3, xmm4, xmm3
  30dd7f:      	vpsrldq	xmm2, xmm2, 0x8         # xmm2 = xmm2[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero
  30dd84:      	vpshufd	xmm4, xmm3, 0x4e        # xmm4 = xmm3[2,3,0,1]
  30dd89:      	vpclmulqdq	xmm3, xmm3, xmm0, 0x0
  30dd8f:      	vpxor	xmm3, xmm3, xmm4
  30dd93:      	vpshufd	xmm4, xmm3, 0x4e        # xmm4 = xmm3[2,3,0,1]
  30dd98:      	vpclmulqdq	xmm3, xmm3, xmm0, 0x0
  30dd9e:      	vpxor	xmm2, xmm3, xmm2
  30dda2:      	vpternlogq	xmm2, xmm1, xmm4, 0x96 # xmm2 = xmm2 ^ xmm1 ^ xmm4
  30dda9:      	inc	rcx
  30ddac:      	vmovdqa	xmmword ptr [rsp + rdx], xmm2
  30ddb1:      	add	rdx, 0x10
  30ddb5:      	add	rsi, 0x10
  30ddb9:      	cmp	rdx, 0x100
  30ddc0:      	jne	0x30dd30 <toyos_crypto::arch::x86_64::vaes512::powers+0x90>
  30ddc6:      	vpxor	xmm0, xmm0, xmm0
  30ddca:      	vmovdqa64	zmmword ptr [rsp + 0x2c0], zmm0
  30ddd2:      	vmovdqa64	zmmword ptr [rsp + 0x280], zmm0
  30ddda:      	vmovdqa64	zmmword ptr [rsp + 0x240], zmm0
  30dde2:      	vmovdqa64	zmmword ptr [rsp + 0x200], zmm0
  30ddea:      	vmovdqa64	zmmword ptr [rsp + 0x1c0], zmm0
  30ddf2:      	vmovdqa64	zmmword ptr [rsp + 0x180], zmm0
  30ddfa:      	vmovdqa64	zmmword ptr [rsp + 0x140], zmm0
  30de02:      	vmovdqa	xmm1, xmmword ptr [rsp + 0xf0]
  30de0b:      	vinserti32x4	zmm2, zmm1, xmmword ptr [rsp + 0xe0], 0x1
  30de14:      	vinserti32x4	zmm2, zmm2, xmmword ptr [rsp + 0xd0], 0x2
  30de1d:      	vmovdqa64	zmmword ptr [rsp + 0x100], zmm0
  30de25:      	vinserti32x4	zmm0, zmm2, xmmword ptr [rsp + 0xc0], 0x3
  30de2e:      	vmovdqu	ymm2, ymmword ptr [rsp + 0xb0]
  30de37:      	vperm2i128	ymm2, ymm2, ymmword ptr [rsp + 0xa0], 0x20 # ymm2 = ymm2[0,1],mem[0,1]
  30de42:      	vinserti64x4	zmm2, zmm2, ymmword ptr [rsp + 0x90], 0x1
  30de4e:      	vmovdqa64	zmmword ptr [rsp + 0x300], zmm0
  30de56:      	vinserti32x4	zmm0, zmm2, xmmword ptr [rsp + 0x80], 0x3
  30de5f:      	vmovdqa64	zmmword ptr [rsp + 0x340], zmm0
  30de67:      	vmovdqu	ymm0, ymmword ptr [rsp + 0x30]
  30de6d:      	vmovdqu	ymm2, ymmword ptr [rsp + 0x70]
  30de73:      	vperm2i128	ymm2, ymm2, ymmword ptr [rsp + 0x60], 0x20 # ymm2 = ymm2[0,1],mem[0,1]
  30de7b:      	vinserti64x4	zmm2, zmm2, ymmword ptr [rsp + 0x50], 0x1
  30de87:      	vinserti32x4	zmm2, zmm2, xmmword ptr [rsp + 0x40], 0x3
  30de90:      	vperm2i128	ymm0, ymm0, ymmword ptr [rsp + 0x20], 0x20 # ymm0 = ymm0[0,1],mem[0,1]
  30de98:      	vinserti64x4	zmm0, zmm0, ymmword ptr [rsp + 0x10], 0x1
  30dea4:      	vmovdqa64	zmmword ptr [rsp + 0x380], zmm2
  30deac:      	vinserti32x4	zmm0, zmm0, xmmword ptr [rsp], 0x3
  30deb4:      	vmovdqa64	zmmword ptr [rsp + 0x3c0], zmm0
  30debc:      	vshufi64x2	zmm0, zmm1, zmm1, 0x0 # zmm0 = zmm1[0,1,0,1,0,1,0,1]
  30dec3:      	mov	ecx, 0x1c0
  30dec8:      	vpbroadcastq	zmm1, qword ptr [rip - 0x262ea2] # 0xab030 <sdallocx+0xab030>
  30ded2:      	nop	word ptr cs:[rax + rax]
  30dee0:      	vmovdqa64	zmm2, zmmword ptr [rsp + rcx + 0x200]
  30dee8:      	vpclmulqdq	zmm3, zmm2, zmm0, 0x0
  30deef:      	vpclmulqdq	zmm4, zmm2, zmm0, 0x11
  30def6:      	vpclmulqdq	zmm5, zmm2, zmm0, 0x1
  30defd:      	vpclmulqdq	zmm2, zmm2, zmm0, 0x10
  30df04:      	vpxorq	zmm2, zmm2, zmm5
  30df0a:      	vpslldq	zmm5, zmm2, 0x8         # zmm5 = zero,zero,zero,zero,zero,zero,zero,zero,zmm2[0,1,2,3,4,5,6,7],zero,zero,zero,zero,zero,zero,zero,zero,zmm2[16,17,18,19,20,21,22,23],zero,zero,zero,zero,zero,zero,zero,zero,zmm2[32,33,34,35,36,37,38,39],zero,zero,zero,zero,zero,zero,zero,zero,zmm2[48,49,50,51,52,53,54,55]
  30df11:      	vpxord	zmm3, zmm5, zmm3
  30df17:      	vpsrldq	zmm2, zmm2, 0x8         # zmm2 = zmm2[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero,zmm2[24,25,26,27,28,29,30,31],zero,zero,zero,zero,zero,zero,zero,zero,zmm2[40,41,42,43,44,45,46,47],zero,zero,zero,zero,zero,zero,zero,zero,zmm2[56,57,58,59,60,61,62,63],zero,zero,zero,zero,zero,zero,zero,zero
  30df1e:      	vpxorq	zmm2, zmm4, zmm2
  30df24:      	vpshufd	zmm4, zmm3, 0x4e        # zmm4 = zmm3[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30df2b:      	vpclmulqdq	zmm3, zmm3, zmm1, 0x0
  30df32:      	vpxorq	zmm3, zmm3, zmm4
  30df38:      	vpshufd	zmm4, zmm3, 0x4e        # zmm4 = zmm3[2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13]
  30df3f:      	vpclmulqdq	zmm3, zmm3, zmm1, 0x0
  30df46:      	vpternlogq	zmm3, zmm2, zmm4, 0x96 # zmm3 = zmm3 ^ zmm2 ^ zmm4
  30df4d:      	vmovdqa64	zmmword ptr [rsp + rcx + 0x100], zmm3
  30df55:      	add	rcx, -0x40
  30df59:      	cmp	rcx, -0x40
  30df5d:      	jne	0x30dee0 <toyos_crypto::arch::x86_64::vaes512::powers+0x240>
  30df5f:      	lea	rsi, [rsp + 0x100]
  30df67:      	mov	edx, 0x300
  30df6c:      	mov	rdi, rax
  30df6f:      	vzeroupper
  30df72:      	call	qword ptr [rip + 0x568f58] # 0x876ed0 <sdallocx+0x876ed0>
  30df78:      	mov	rsp, rbp
  30df7b:      	pop	rbp
  30df7c:      	ret
  30df7d:      	int3
  30df7e:      	int3
  30df7f:      	int3
