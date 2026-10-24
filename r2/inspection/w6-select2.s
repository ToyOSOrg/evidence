       0:      	mov	rax, rdi
       3:      	vlddqu	ymm1, ymmword ptr [rsi]
       7:      	vlddqu	ymm0, ymmword ptr [rsi + 0x20]
       c:      	vmovq	xmm2, rdx
      11:      	vpbroadcastq	ymm2, xmm2
      16:      	add	rsi, 0x40
      1a:      	vpbroadcastq	ymm3, qword ptr [rip] # 0x23 <toyos_crypto::arch::x86_64::p256::select::<toyos_crypto::nist::Affine<toyos_crypto::nist::P256, 4, toyos_crypto::nist::P256Field>, 2, <toyos_crypto::nist::Affine<toyos_crypto::nist::P256, 4, toyos_crypto::arch::x86_64::P256Kernels>>::lookup::{closure#0}>+0x23>
      23:      	mov	ecx, 0xf
      28:      	vpcmpeqd	ymm4, ymm4, ymm4
      2c:      	nop	dword ptr [rax]
      30:      	vpcmpeqq	ymm5, ymm2, ymm3
      35:      	vandnpd	ymm1, ymm5, ymm1
      39:      	vlddqu	ymm6, ymmword ptr [rsi]
      3d:      	vandpd	ymm6, ymm5, ymm6
      41:      	vorpd	ymm1, ymm6, ymm1
      45:      	vandnpd	ymm0, ymm5, ymm0
      49:      	vlddqu	ymm6, ymmword ptr [rsi + 0x20]
      4e:      	vandpd	ymm5, ymm5, ymm6
      52:      	vorpd	ymm0, ymm5, ymm0
      56:      	vpsubq	ymm3, ymm3, ymm4
      5a:      	add	rsi, 0x40
      5e:      	dec	rcx
      61:      	jne	0x30 <toyos_crypto::arch::x86_64::p256::select::<toyos_crypto::nist::Affine<toyos_crypto::nist::P256, 4, toyos_crypto::nist::P256Field>, 2, <toyos_crypto::nist::Affine<toyos_crypto::nist::P256, 4, toyos_crypto::arch::x86_64::P256Kernels>>::lookup::{closure#0}>+0x30>
      63:      	vmovupd	ymmword ptr [rax], ymm1
      67:      	vmovupd	ymmword ptr [rax + 0x20], ymm0
      6c:      	vzeroupper
      6f:      	ret
