       0:      	mov	rax, rdi
       3:      	vlddqu	ymm2, ymmword ptr [rsi]
       7:      	vlddqu	ymm1, ymmword ptr [rsi + 0x20]
       c:      	vlddqu	ymm0, ymmword ptr [rsi + 0x40]
      11:      	vmovq	xmm3, rdx
      16:      	vpbroadcastq	ymm3, xmm3
      1b:      	add	rsi, 0x60
      1f:      	vpbroadcastq	ymm4, qword ptr [rip] # 0x28 <toyos_crypto::arch::x86_64::p256::select::<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4, toyos_crypto::arch::x86_64::P256Kernels>, 3, <toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4, toyos_crypto::arch::x86_64::P256Kernels>>::lookup::{closure#0}>+0x28>
      28:      	mov	ecx, 0xf
      2d:      	vpcmpeqd	ymm5, ymm5, ymm5
      31:      	nop	word ptr cs:[rax + rax]
      40:      	vpcmpeqq	ymm6, ymm3, ymm4
      45:      	vandnpd	ymm2, ymm6, ymm2
      49:      	vlddqu	ymm7, ymmword ptr [rsi]
      4d:      	vandpd	ymm7, ymm6, ymm7
      51:      	vorpd	ymm2, ymm7, ymm2
      55:      	vandnpd	ymm1, ymm6, ymm1
      59:      	vlddqu	ymm7, ymmword ptr [rsi + 0x20]
      5e:      	vandpd	ymm7, ymm6, ymm7
      62:      	vorpd	ymm1, ymm7, ymm1
      66:      	vandnpd	ymm0, ymm6, ymm0
      6a:      	vlddqu	ymm7, ymmword ptr [rsi + 0x40]
      6f:      	vandpd	ymm6, ymm6, ymm7
      73:      	vorpd	ymm0, ymm6, ymm0
      77:      	vpsubq	ymm4, ymm4, ymm5
      7b:      	add	rsi, 0x60
      7f:      	dec	rcx
      82:      	jne	0x40 <toyos_crypto::arch::x86_64::p256::select::<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4, toyos_crypto::arch::x86_64::P256Kernels>, 3, <toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4, toyos_crypto::arch::x86_64::P256Kernels>>::lookup::{closure#0}>+0x40>
      84:      	vmovupd	ymmword ptr [rax], ymm2
      88:      	vmovupd	ymmword ptr [rax + 0x20], ymm1
      8d:      	vmovupd	ymmword ptr [rax + 0x40], ymm0
      92:      	vzeroupper
      95:      	ret
