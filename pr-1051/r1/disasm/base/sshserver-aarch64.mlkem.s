000000000007d4bc <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<sshserver::OsRandom>>:
   7d4bc:      	stp	x29, x30, [sp, #-0x30]!
   7d4c0:      	stp	x28, x21, [sp, #0x10]
   7d4c4:      	stp	x20, x19, [sp, #0x20]
   7d4c8:      	mov	x29, sp
   7d4cc:      	sub	sp, sp, #0x930
   7d4d0:      	movi	v0.2d, #0000000000000000
   7d4d4:      	mov	x20, x0
   7d4d8:      	mov	x19, x8
   7d4dc:      	str	xzr, [sp]
   7d4e0:      	stp	q0, q0, [sp]
   7d4e4:      	mov	x0, sp
   7d4e8:      	mov	w1, #0x20               // =32
   7d4ec:      	bl	0x85b68 <toyos_abi::syscall::random>
   7d4f0:      	cmn	x0, #0x1
   7d4f4:      	b.eq	0x7d504 <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<sshserver::OsRandom>+0x48>
   7d4f8:      	mov	w8, #0x701              // =1793
   7d4fc:      	strh	w8, [x19]
   7d500:      	b	0x7d5e4 <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<sshserver::OsRandom>+0x128>
   7d504:      	mov	w8, #0x4a0              // =1184
   7d508:      	str	x20, [sp, #0x4c0]
   7d50c:      	str	x8, [sp, #0x4c8]
   7d510:      	add	x8, sp, #0x20
   7d514:      	add	x0, sp, #0x4c0
   7d518:      	mov	w1, #0x1                // =1
   7d51c:      	add	x21, sp, #0x20
   7d520:      	bl	0x9fe04 <toyos_crypto::keccak::h>
   7d524:      	mov	x8, sp
   7d528:      	mov	w9, #0x20               // =32
   7d52c:      	stp	x8, x9, [sp, #0x80]
   7d530:      	stp	x21, x9, [sp, #0x90]
   7d534:      	add	x8, sp, #0x4c0
   7d538:      	add	x0, sp, #0x80
   7d53c:      	mov	w1, #0x2                // =2
   7d540:      	bl	0x9fca4 <toyos_crypto::keccak::g>
   7d544:      	ldr	q0, [sp, #0x4c0]
   7d548:      	ldr	q1, [sp, #0x4d0]
   7d54c:      	add	x21, sp, #0x40
   7d550:      	ldr	q2, [sp, #0x4f0]
   7d554:      	stp	q0, q1, [sp, #0x40]
   7d558:      	ldr	q0, [sp, #0x4e0]
   7d55c:      	stp	q0, q2, [sp, #0x60]
   7d560:      	add	x8, sp, #0x80
   7d564:      	mov	x1, sp
   7d568:      	add	x2, x21, #0x20
   7d56c:      	mov	x0, x20
   7d570:      	bl	0x9bc14 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>
   7d574:      	add	x0, sp, #0x4c0
   7d578:      	add	x1, sp, #0x80
   7d57c:      	mov	w2, #0x440              // =1088
   7d580:      	bl	0x1065e8 <memcpy>
   7d584:      	ldp	q0, q1, [sp, #0x40]
   7d588:      	add	x0, x19, #0x1
   7d58c:      	add	x1, sp, #0x4c0
   7d590:      	mov	w2, #0x460              // =1120
   7d594:      	str	q0, [sp, #0x900]
   7d598:      	str	q1, [sp, #0x910]
   7d59c:      	bl	0x1065e8 <memcpy>
   7d5a0:      	strb	wzr, [x19]
   7d5a4:      	str	xzr, [sp, #0x4c8]
   7d5a8:      	str	xzr, [sp, #0x4c0]
   7d5ac:      	ldr	q0, [sp, #0x4c0]
   7d5b0:      	str	q0, [sp, #0x40]
   7d5b4:      	str	xzr, [sp, #0x4c8]
   7d5b8:      	str	xzr, [sp, #0x4c0]
   7d5bc:      	ldr	q0, [sp, #0x4c0]
   7d5c0:      	str	q0, [sp, #0x50]
   7d5c4:      	str	xzr, [sp, #0x4c8]
   7d5c8:      	str	xzr, [sp, #0x4c0]
   7d5cc:      	ldr	q0, [sp, #0x4c0]
   7d5d0:      	stur	q0, [x21, #0x20]
   7d5d4:      	str	xzr, [sp, #0x4c8]
   7d5d8:      	str	xzr, [sp, #0x4c0]
   7d5dc:      	ldr	q0, [sp, #0x4c0]
   7d5e0:      	str	q0, [sp, #0x70]
   7d5e4:      	str	xzr, [sp, #0x4c8]
   7d5e8:      	str	xzr, [sp, #0x4c0]
   7d5ec:      	ldr	q0, [sp, #0x4c0]
   7d5f0:      	str	q0, [sp]
   7d5f4:      	str	xzr, [sp, #0x4c8]
   7d5f8:      	str	xzr, [sp, #0x4c0]
   7d5fc:      	ldr	q0, [sp, #0x4c0]
   7d600:      	str	q0, [sp, #0x10]
   7d604:      	add	sp, sp, #0x930
   7d608:      	ldp	x20, x19, [sp, #0x20]
   7d60c:      	ldp	x28, x21, [sp, #0x10]
   7d610:      	ldp	x29, x30, [sp], #0x30
   7d614:      	ret
   7d618:      	str	xzr, [sp, #0x4c8]
   7d61c:      	str	xzr, [sp, #0x4c0]
   7d620:      	ldr	q0, [sp, #0x4c0]
   7d624:      	str	q0, [sp, #0x40]
   7d628:      	str	xzr, [sp, #0x4c8]
   7d62c:      	str	xzr, [sp, #0x4c0]
   7d630:      	ldr	q0, [sp, #0x4c0]
   7d634:      	str	q0, [sp, #0x50]
   7d638:      	str	xzr, [sp, #0x4c8]
   7d63c:      	str	xzr, [sp, #0x4c0]
   7d640:      	ldr	q0, [sp, #0x4c0]
   7d644:      	stur	q0, [x21, #0x20]
   7d648:      	str	xzr, [sp, #0x4c8]
   7d64c:      	str	xzr, [sp, #0x4c0]
   7d650:      	ldr	q0, [sp, #0x4c0]
   7d654:      	str	q0, [sp, #0x70]
   7d658:      	b	0x7d65c <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<sshserver::OsRandom>+0x1a0>
   7d65c:      	stp	xzr, xzr, [x29, #-0x10]
   7d660:      	ldur	q0, [x29, #-0x10]
   7d664:      	str	q0, [sp]
   7d668:      	stp	xzr, xzr, [x29, #-0x10]
   7d66c:      	ldur	q0, [x29, #-0x10]
   7d670:      	str	q0, [sp, #0x10]
   7d674:      	bl	0xfbd80 <_Unwind_Resume>

000000000009b930 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>:
   9b930:      	stp	x29, x30, [sp, #-0x10]!
   9b934:      	mov	x29, sp
   9b938:      	ldp	x9, x8, [x0, #0x8]
   9b93c:      	cmp	x8, x9
   9b940:      	b.hi	0x9b980 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x50>
   9b944:      	cbz	x8, 0x9b978 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x48>
   9b948:      	ldr	x9, [x0]
   9b94c:      	mov	x10, xzr
   9b950:      	mov	x11, xzr
   9b954:      	mov	x12, x11
   9b958:      	add	x11, x11, #0x2
   9b95c:      	cmp	x11, #0x200
   9b960:      	strh	wzr, [x9, x12]
   9b964:      	b.ne	0x9b954 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x24>
   9b968:      	add	x10, x10, #0x1
   9b96c:      	add	x9, x9, #0x200
   9b970:      	cmp	x10, x8
   9b974:      	b.ne	0x9b950 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x20>
   9b978:      	ldp	x29, x30, [sp], #0x10
   9b97c:      	ret
   9b980:      	nop
   9b984:      	adr	x0, 0x284fc <toyos_crypto::ed25519::B_ODD+0x11a4>
   9b988:      	nop
   9b98c:      	adr	x3, 0x1192b0 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x2b0>
   9b990:      	mov	w1, #0x1b5              // =437
   9b994:      	mov	w2, wzr
   9b998:      	bl	0x101330 <core::panicking::panic_nounwind_fmt>

000000000009b99c <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes>:
   9b99c:      	stp	x29, x30, [sp, #-0x40]!
   9b9a0:      	stp	x28, x23, [sp, #0x10]
   9b9a4:      	stp	x22, x21, [sp, #0x20]
   9b9a8:      	stp	x20, x19, [sp, #0x30]
   9b9ac:      	mov	x29, sp
   9b9b0:      	sub	sp, sp, #0x400
   9b9b4:      	cmp	x1, #0x4a0
   9b9b8:      	mov	x19, x8
   9b9bc:      	b.ne	0x9bbcc <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x230>
   9b9c0:      	movi	v0.2d, #0000000000000000
   9b9c4:      	mov	x20, x0
   9b9c8:      	mov	x21, xzr
   9b9cc:      	mov	w22, #0x5               // =5
   9b9d0:      	mov	x23, sp
   9b9d4:      	mov	x8, xzr
   9b9d8:      	add	x9, x20, x21
   9b9dc:      	add	x10, sp, #0x200
   9b9e0:      	stp	q0, q0, [sp, #0x200]
   9b9e4:      	stp	q0, q0, [sp, #0x220]
   9b9e8:      	stp	q0, q0, [sp, #0x240]
   9b9ec:      	stp	q0, q0, [sp, #0x260]
   9b9f0:      	stp	q0, q0, [sp, #0x280]
   9b9f4:      	stp	q0, q0, [sp, #0x2a0]
   9b9f8:      	stp	q0, q0, [sp, #0x2c0]
   9b9fc:      	stp	q0, q0, [sp, #0x2e0]
   9ba00:      	stp	q0, q0, [sp, #0x300]
   9ba04:      	stp	q0, q0, [sp, #0x320]
   9ba08:      	stp	q0, q0, [sp, #0x340]
   9ba0c:      	stp	q0, q0, [sp, #0x360]
   9ba10:      	stp	q0, q0, [sp, #0x380]
   9ba14:      	stp	q0, q0, [sp, #0x3a0]
   9ba18:      	stp	q0, q0, [sp, #0x3c0]
   9ba1c:      	stp	q0, q0, [sp, #0x3e0]
   9ba20:      	lsr	x12, x8, #3
   9ba24:      	and	w14, w8, #0x4
   9ba28:      	and	x11, x8, #0x4
   9ba2c:      	orr	w18, w14, #0x1
   9ba30:      	orr	w0, w14, #0x2
   9ba34:      	orr	w14, w14, #0x3
   9ba38:      	ldrb	w12, [x9, x12]
   9ba3c:      	ldrh	w13, [x10]
   9ba40:      	add	x15, x8, #0x4
   9ba44:      	add	x16, x8, #0x5
   9ba48:      	add	x17, x8, #0x6
   9ba4c:      	add	x3, x8, #0xb
   9ba50:      	lsr	w1, w12, w11
   9ba54:      	lsr	w18, w12, w18
   9ba58:      	lsr	w0, w12, w0
   9ba5c:      	lsr	w12, w12, w14
   9ba60:      	lsr	x14, x15, #3
   9ba64:      	lsr	x2, x16, #3
   9ba68:      	and	w1, w1, #0x1
   9ba6c:      	ubfiz	w18, w18, #1, #1
   9ba70:      	ubfiz	w0, w0, #2, #1
   9ba74:      	ubfiz	w12, w12, #3, #1
   9ba78:      	orr	w13, w13, w1
   9ba7c:      	lsr	x1, x17, #3
   9ba80:      	orr	w13, w13, w18
   9ba84:      	ldrb	w14, [x9, x14]
   9ba88:      	ldrb	w18, [x9, x2]
   9ba8c:      	orr	w12, w0, w12
   9ba90:      	add	x0, x8, #0x7
   9ba94:      	and	x15, x15, #0x4
   9ba98:      	orr	w12, w13, w12
   9ba9c:      	ldrb	w13, [x9, x1]
   9baa0:      	add	x1, x8, #0x8
   9baa4:      	and	x16, x16, x22
   9baa8:      	lsr	x2, x0, #3
   9baac:      	lsr	x1, x1, #3
   9bab0:      	and	x17, x17, #0x6
   9bab4:      	lsr	w14, w14, w15
   9bab8:      	lsr	w15, w18, w16
   9babc:      	add	x18, x8, #0x9
   9bac0:      	lsr	w13, w13, w17
   9bac4:      	ldrb	w16, [x9, x2]
   9bac8:      	ldrb	w17, [x9, x1]
   9bacc:      	lsr	x1, x18, #3
   9bad0:      	add	x2, x8, #0xa
   9bad4:      	lsr	x4, x2, #3
   9bad8:      	and	x0, x0, #0x7
   9badc:      	lsr	x5, x3, #3
   9bae0:      	lsr	w11, w17, w11
   9bae4:      	ldrb	w17, [x9, x1]
   9bae8:      	lsr	w16, w16, w0
   9baec:      	and	x18, x18, x22
   9baf0:      	ldrb	w0, [x9, x4]
   9baf4:      	ldrb	w1, [x9, x5]
   9baf8:      	lsr	w17, w17, w18
   9bafc:      	and	x18, x2, #0x6
   9bb00:      	and	x2, x3, #0x7
   9bb04:      	lsr	w18, w0, w18
   9bb08:      	lsr	w0, w1, w2
   9bb0c:      	ubfiz	w14, w14, #4, #1
   9bb10:      	ubfiz	w15, w15, #5, #1
   9bb14:      	ubfiz	w13, w13, #6, #1
   9bb18:      	ubfiz	w16, w16, #7, #1
   9bb1c:      	ubfiz	w11, w11, #8, #1
   9bb20:      	ubfiz	w17, w17, #9, #1
   9bb24:      	ubfiz	w18, w18, #10, #1
   9bb28:      	orr	w14, w14, w15
   9bb2c:      	orr	w13, w13, w16
   9bb30:      	ubfiz	w15, w0, #11, #1
   9bb34:      	orr	w12, w12, w14
   9bb38:      	orr	w11, w11, w13
   9bb3c:      	orr	w13, w18, w17
   9bb40:      	orr	w11, w11, w12
   9bb44:      	orr	w12, w15, w13
   9bb48:      	add	x8, x8, #0xc
   9bb4c:      	orr	w11, w12, w11
   9bb50:      	cmp	x8, #0xc00
   9bb54:      	strh	w11, [x10], #0x2
   9bb58:      	b.ne	0x9ba20 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x84>
   9bb5c:      	mov	x0, sp
   9bb60:      	add	x1, sp, #0x200
   9bb64:      	mov	w2, #0x200              // =512
   9bb68:      	add	x21, x21, #0x180
   9bb6c:      	bl	0x1065e8 <memcpy>
   9bb70:      	mov	x8, xzr
   9bb74:      	cmp	x8, #0x200
   9bb78:      	b.eq	0x9bb90 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x1f4>
   9bb7c:      	ldrh	w9, [x23, x8]
   9bb80:      	add	x8, x8, #0x2
   9bb84:      	cmp	w9, #0xd00
   9bb88:      	b.ls	0x9bb74 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x1d8>
   9bb8c:      	b	0x9bbd8 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x23c>
   9bb90:      	mov	x8, xzr
   9bb94:      	mov	x9, x8
   9bb98:      	add	x8, x8, #0x2
   9bb9c:      	cmp	x8, #0x200
   9bba0:      	strh	wzr, [x23, x9]
   9bba4:      	b.ne	0x9bb94 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x1f8>
   9bba8:      	movi	v0.2d, #0000000000000000
   9bbac:      	cmp	x21, #0x480
   9bbb0:      	b.ne	0x9b9d4 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x38>
   9bbb4:      	add	x0, x19, #0x1
   9bbb8:      	mov	x1, x20
   9bbbc:      	mov	w2, #0x4a0              // =1184
   9bbc0:      	bl	0x1065e8 <memcpy>
   9bbc4:      	strb	wzr, [x19]
   9bbc8:      	b	0x9bbfc <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x260>
   9bbcc:      	mov	w8, #0x1                // =1
   9bbd0:      	strh	w8, [x19]
   9bbd4:      	b	0x9bbfc <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x260>
   9bbd8:      	mov	w9, #0x201              // =513
   9bbdc:      	mov	x8, xzr
   9bbe0:      	strh	w9, [x19]
   9bbe4:      	mov	x9, sp
   9bbe8:      	mov	x10, x8
   9bbec:      	add	x8, x8, #0x2
   9bbf0:      	cmp	x8, #0x200
   9bbf4:      	strh	wzr, [x9, x10]
   9bbf8:      	b.ne	0x9bbe8 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x24c>
   9bbfc:      	add	sp, sp, #0x400
   9bc00:      	ldp	x20, x19, [sp, #0x30]
   9bc04:      	ldp	x22, x21, [sp, #0x20]
   9bc08:      	ldp	x28, x23, [sp, #0x10]
   9bc0c:      	ldp	x29, x30, [sp], #0x40
   9bc10:      	ret

000000000009bc14 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>:
   9bc14:      	str	d12, [sp, #-0x90]!
   9bc18:      	stp	d11, d10, [sp, #0x10]
   9bc1c:      	stp	d9, d8, [sp, #0x20]
   9bc20:      	stp	x29, x30, [sp, #0x30]
   9bc24:      	stp	x28, x27, [sp, #0x40]
   9bc28:      	stp	x26, x25, [sp, #0x50]
   9bc2c:      	stp	x24, x23, [sp, #0x60]
   9bc30:      	stp	x22, x21, [sp, #0x70]
   9bc34:      	stp	x20, x19, [sp, #0x80]
   9bc38:      	add	x29, sp, #0x30
   9bc3c:      	sub	sp, sp, #0x1, lsl #12   // =0x1000
   9bc40:      	str	xzr, [sp]
   9bc44:      	sub	sp, sp, #0xa70
   9bc48:      	mov	x21, x1
   9bc4c:      	mov	x19, x8
   9bc50:      	add	x8, sp, #0xc60
   9bc54:      	mov	w9, #0x3                // =3
   9bc58:      	str	xzr, [sp]
   9bc5c:      	str	x0, [sp, #0x58]
   9bc60:      	str	x8, [sp, #0xa60]
   9bc64:      	str	x9, [sp, #0xa68]
   9bc68:      	add	x8, sp, #0x60
   9bc6c:      	mov	x0, x2
   9bc70:      	mov	w1, wzr
   9bc74:      	str	x2, [sp, #0x30]
   9bc78:      	mov	x20, xzr
   9bc7c:      	bl	0x9d658 <toyos_crypto::mlkem::noise>
   9bc80:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9bc84:      	add	x0, sp, #0x60
   9bc88:      	mov	x20, xzr
   9bc8c:      	add	x8, x8, #0x660
   9bc90:      	bl	0x9cf24 <<toyos_crypto::mlkem::Poly>::ntt>
   9bc94:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9bc98:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9bc9c:      	mov	w2, #0x200              // =512
   9bca0:      	add	x0, x0, #0x460
   9bca4:      	add	x1, x1, #0x660
   9bca8:      	bl	0x1065e8 <memcpy>
   9bcac:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9bcb0:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9bcb4:      	mov	w2, #0x200              // =512
   9bcb8:      	add	x0, x0, #0x260
   9bcbc:      	add	x1, x1, #0x460
   9bcc0:      	bl	0x1065e8 <memcpy>
   9bcc4:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9bcc8:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9bccc:      	mov	w2, #0x200              // =512
   9bcd0:      	add	x0, x0, #0x860
   9bcd4:      	add	x1, x1, #0x260
   9bcd8:      	bl	0x1065e8 <memcpy>
   9bcdc:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9bce0:      	add	x0, sp, #0xc60
   9bce4:      	mov	w2, #0x200              // =512
   9bce8:      	add	x1, x1, #0x860
   9bcec:      	bl	0x1065e8 <memcpy>
   9bcf0:      	mov	w20, #0x1               // =1
   9bcf4:      	ldr	x0, [sp, #0x30]
   9bcf8:      	add	x8, sp, #0x60
   9bcfc:      	mov	w1, #0x1                // =1
   9bd00:      	bl	0x9d658 <toyos_crypto::mlkem::noise>
   9bd04:      	mov	w20, #0x1               // =1
   9bd08:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9bd0c:      	add	x0, sp, #0x60
   9bd10:      	add	x8, x8, #0x660
   9bd14:      	bl	0x9cf24 <<toyos_crypto::mlkem::Poly>::ntt>
   9bd18:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9bd1c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9bd20:      	mov	w2, #0x200              // =512
   9bd24:      	add	x0, x0, #0x460
   9bd28:      	add	x1, x1, #0x660
   9bd2c:      	bl	0x1065e8 <memcpy>
   9bd30:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9bd34:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9bd38:      	mov	w2, #0x200              // =512
   9bd3c:      	add	x0, x0, #0x260
   9bd40:      	add	x1, x1, #0x460
   9bd44:      	bl	0x1065e8 <memcpy>
   9bd48:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9bd4c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9bd50:      	mov	w2, #0x200              // =512
   9bd54:      	add	x0, x0, #0x860
   9bd58:      	add	x1, x1, #0x260
   9bd5c:      	bl	0x1065e8 <memcpy>
   9bd60:      	add	x8, sp, #0xc60
   9bd64:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9bd68:      	mov	w2, #0x200              // =512
   9bd6c:      	add	x0, x8, #0x200
   9bd70:      	add	x1, x1, #0x860
   9bd74:      	bl	0x1065e8 <memcpy>
   9bd78:      	mov	w20, #0x2               // =2
   9bd7c:      	ldr	x0, [sp, #0x30]
   9bd80:      	add	x8, sp, #0x60
   9bd84:      	mov	w1, #0x2                // =2
   9bd88:      	bl	0x9d658 <toyos_crypto::mlkem::noise>
   9bd8c:      	mov	w20, #0x2               // =2
   9bd90:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9bd94:      	add	x0, sp, #0x60
   9bd98:      	add	x25, sp, #0x1, lsl #12  // =0x1000
   9bd9c:      	add	x8, x8, #0x660
   9bda0:      	add	x25, x25, #0x660
   9bda4:      	bl	0x9cf24 <<toyos_crypto::mlkem::Poly>::ntt>
   9bda8:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9bdac:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9bdb0:      	mov	w2, #0x200              // =512
   9bdb4:      	add	x0, x0, #0x460
   9bdb8:      	add	x1, x1, #0x660
   9bdbc:      	add	x27, sp, #0x1, lsl #12  // =0x1000
   9bdc0:      	stp	x21, x19, [sp]
   9bdc4:      	add	x27, x27, #0x460
   9bdc8:      	bl	0x1065e8 <memcpy>
   9bdcc:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9bdd0:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9bdd4:      	mov	w2, #0x200              // =512
   9bdd8:      	add	x0, x0, #0x260
   9bddc:      	add	x1, x1, #0x460
   9bde0:      	bl	0x1065e8 <memcpy>
   9bde4:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9bde8:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9bdec:      	mov	w2, #0x200              // =512
   9bdf0:      	add	x0, x0, #0x860
   9bdf4:      	add	x1, x1, #0x260
   9bdf8:      	add	x19, sp, #0x1, lsl #12  // =0x1000
   9bdfc:      	add	x19, x19, #0x860
   9be00:      	bl	0x1065e8 <memcpy>
   9be04:      	add	x8, sp, #0xc60
   9be08:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9be0c:      	mov	w2, #0x200              // =512
   9be10:      	add	x0, x8, #0x400
   9be14:      	add	x1, x1, #0x860
   9be18:      	bl	0x1065e8 <memcpy>
   9be1c:      	add	x0, sp, #0x60
   9be20:      	add	x1, sp, #0xc60
   9be24:      	mov	w2, #0x600              // =1536
   9be28:      	bl	0x1065e8 <memcpy>
   9be2c:      	add	x0, sp, #0xc60
   9be30:      	mov	w1, wzr
   9be34:      	mov	w2, #0x440              // =1088
   9be38:      	bl	0x1065d8 <memset>
   9be3c:      	mov	w21, #0xd01             // =3329
   9be40:      	mov	w8, #0xafb8             // =44984
   9be44:      	mov	w10, #0xdbb5            // =56245
   9be48:      	movk	w8, #0x13, lsl #16
   9be4c:      	dup	v8.4h, w21
   9be50:      	mov	w9, #0x680              // =1664
   9be54:      	movk	w10, #0x9d7, lsl #16
   9be58:      	dup	v0.4s, w8
   9be5c:      	dup	v2.4s, w9
   9be60:      	dup	v1.4s, w10
   9be64:      	mov	w20, #0xbb41            // =47937
   9be68:      	mov	w22, #0x7681            // =30337
   9be6c:      	mov	x2, xzr
   9be70:      	movk	w20, #0x9d7d, lsl #16
   9be74:      	movk	w22, #0x3afb, lsl #16
   9be78:      	mov	w26, #0xf2ff            // =62207
   9be7c:      	add	x28, sp, #0xa60
   9be80:      	str	q0, [sp, #0x40]
   9be84:      	stp	q1, q2, [sp, #0x10]
   9be88:      	movi	v0.2d, #0000000000000000
   9be8c:      	mov	x24, xzr
   9be90:      	mov	x23, xzr
   9be94:      	add	x8, x2, #0x1
   9be98:      	stur	x2, [x29, #-0x28]
   9be9c:      	str	x8, [sp, #0x38]
   9bea0:      	str	q0, [sp, #0xc50]
   9bea4:      	str	q0, [sp, #0xc40]
   9bea8:      	str	q0, [sp, #0xc30]
   9beac:      	str	q0, [sp, #0xc20]
   9beb0:      	str	q0, [sp, #0xc10]
   9beb4:      	str	q0, [sp, #0xc00]
   9beb8:      	str	q0, [sp, #0xbf0]
   9bebc:      	str	q0, [sp, #0xbe0]
   9bec0:      	str	q0, [sp, #0xbd0]
   9bec4:      	str	q0, [sp, #0xbc0]
   9bec8:      	str	q0, [sp, #0xbb0]
   9becc:      	str	q0, [sp, #0xba0]
   9bed0:      	str	q0, [sp, #0xb90]
   9bed4:      	str	q0, [sp, #0xb80]
   9bed8:      	str	q0, [sp, #0xb70]
   9bedc:      	str	q0, [sp, #0xb60]
   9bee0:      	str	q0, [sp, #0xb50]
   9bee4:      	str	q0, [sp, #0xb40]
   9bee8:      	str	q0, [sp, #0xb30]
   9beec:      	str	q0, [sp, #0xb20]
   9bef0:      	str	q0, [sp, #0xb10]
   9bef4:      	str	q0, [sp, #0xb00]
   9bef8:      	str	q0, [sp, #0xaf0]
   9befc:      	str	q0, [sp, #0xae0]
   9bf00:      	str	q0, [sp, #0xad0]
   9bf04:      	str	q0, [sp, #0xac0]
   9bf08:      	str	q0, [sp, #0xab0]
   9bf0c:      	str	q0, [sp, #0xaa0]
   9bf10:      	str	q0, [sp, #0xa90]
   9bf14:      	str	q0, [sp, #0xa80]
   9bf18:      	str	q0, [sp, #0xa70]
   9bf1c:      	str	q0, [sp, #0xa60]
   9bf20:      	ldr	x9, [sp, #0x58]
   9bf24:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9bf28:      	mov	x1, x24
   9bf2c:      	add	x8, x8, #0x660
   9bf30:      	add	x0, x9, #0x480
   9bf34:      	bl	0x9d938 <toyos_crypto::mlkem::sample>
   9bf38:      	movi	v0.2d, #0000000000000000
   9bf3c:      	add	x9, sp, #0x60
   9bf40:      	mov	x8, xzr
   9bf44:      	add	x9, x9, x23
   9bf48:      	add	x23, x23, #0x200
   9bf4c:      	add	x24, x24, #0x1
   9bf50:      	str	q0, [sp, #0x1a50]
   9bf54:      	str	q0, [sp, #0x1a40]
   9bf58:      	str	q0, [sp, #0x1a30]
   9bf5c:      	str	q0, [sp, #0x1a20]
   9bf60:      	str	q0, [sp, #0x1a10]
   9bf64:      	str	q0, [sp, #0x1a00]
   9bf68:      	str	q0, [sp, #0x19f0]
   9bf6c:      	str	q0, [sp, #0x19e0]
   9bf70:      	str	q0, [sp, #0x19d0]
   9bf74:      	str	q0, [sp, #0x19c0]
   9bf78:      	str	q0, [sp, #0x19b0]
   9bf7c:      	str	q0, [sp, #0x19a0]
   9bf80:      	str	q0, [sp, #0x1990]
   9bf84:      	str	q0, [sp, #0x1980]
   9bf88:      	str	q0, [sp, #0x1970]
   9bf8c:      	str	q0, [sp, #0x1960]
   9bf90:      	str	q0, [sp, #0x1950]
   9bf94:      	str	q0, [sp, #0x1940]
   9bf98:      	str	q0, [sp, #0x1930]
   9bf9c:      	str	q0, [sp, #0x1920]
   9bfa0:      	str	q0, [sp, #0x1910]
   9bfa4:      	str	q0, [sp, #0x1900]
   9bfa8:      	str	q0, [sp, #0x18f0]
   9bfac:      	str	q0, [sp, #0x18e0]
   9bfb0:      	str	q0, [sp, #0x18d0]
   9bfb4:      	str	q0, [sp, #0x18c0]
   9bfb8:      	str	q0, [sp, #0x18b0]
   9bfbc:      	str	q0, [sp, #0x18a0]
   9bfc0:      	str	q0, [sp, #0x1890]
   9bfc4:      	str	q0, [sp, #0x1880]
   9bfc8:      	str	q0, [sp, #0x1870]
   9bfcc:      	str	q0, [sp, #0x1860]
   9bfd0:      	b	0x9c0b0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x49c>
   9bfd4:      	mov	w11, #0x2               // =2
   9bfd8:      	bfi	x11, x8, #2, #62
   9bfdc:      	ldrh	w13, [x25, x11]
   9bfe0:      	ldrh	w14, [x9, x11]
   9bfe4:      	mul	w15, w14, w13
   9bfe8:      	umull	x12, w15, w22
   9bfec:      	lsr	x12, x12, #32
   9bff0:      	sub	w16, w15, w12
   9bff4:      	add	w16, w12, w16, lsr #1
   9bff8:      	lsl	x12, x8, #2
   9bffc:      	add	x8, x8, #0x1
   9c000:      	lsr	w16, w16, #11
   9c004:      	ldrh	w17, [x25, x12]
   9c008:      	ldrh	w18, [x9, x12]
   9c00c:      	msub	w15, w16, w21, w15
   9c010:      	mul	w16, w18, w17
   9c014:      	mul	w14, w14, w17
   9c018:      	mul	w10, w15, w10
   9c01c:      	mul	w13, w13, w18
   9c020:      	umull	x15, w16, w22
   9c024:      	umull	x17, w10, w22
   9c028:      	umull	x18, w14, w22
   9c02c:      	umull	x0, w13, w22
   9c030:      	lsr	x15, x15, #32
   9c034:      	lsr	x17, x17, #32
   9c038:      	lsr	x18, x18, #32
   9c03c:      	sub	w1, w16, w15
   9c040:      	lsr	x0, x0, #32
   9c044:      	add	w15, w15, w1, lsr #1
   9c048:      	sub	w1, w10, w17
   9c04c:      	add	w17, w17, w1, lsr #1
   9c050:      	sub	w1, w14, w18
   9c054:      	add	w18, w18, w1, lsr #1
   9c058:      	sub	w1, w13, w0
   9c05c:      	lsr	w15, w15, #11
   9c060:      	add	w0, w0, w1, lsr #1
   9c064:      	lsr	w17, w17, #11
   9c068:      	lsr	w18, w18, #11
   9c06c:      	msub	w15, w15, w21, w16
   9c070:      	lsr	w16, w0, #11
   9c074:      	msub	w10, w17, w21, w10
   9c078:      	msub	w14, w18, w21, w14
   9c07c:      	msub	w13, w16, w21, w13
   9c080:      	add	w10, w10, w15
   9c084:      	add	w15, w10, w26
   9c088:      	cmp	w10, #0xd01
   9c08c:      	add	w13, w14, w13
   9c090:      	csel	w10, w10, w15, lo
   9c094:      	strh	w10, [x19, x12]
   9c098:      	add	w14, w13, w26
   9c09c:      	cmp	w13, #0xd01
   9c0a0:      	csel	w10, w13, w14, lo
   9c0a4:      	cmp	x8, #0x80
   9c0a8:      	strh	w10, [x19, x11]
   9c0ac:      	b.eq	0x9c104 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4f0>
   9c0b0:      	orr	w10, w8, #0x80
   9c0b4:      	mov	w12, #0x11              // =17
   9c0b8:      	rbit	w10, w10
   9c0bc:      	lsr	w11, w10, #24
   9c0c0:      	mov	w10, #0x1               // =1
   9c0c4:      	b	0x9c0e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4cc>
   9c0c8:      	mul	w12, w12, w12
   9c0cc:      	lsr	w11, w11, #1
   9c0d0:      	umull	x13, w12, w20
   9c0d4:      	lsr	x13, x13, #43
   9c0d8:      	msub	w12, w13, w21, w12
   9c0dc:      	cbz	w11, 0x9bfd4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3c0>
   9c0e0:      	tbz	w11, #0x0, 0x9c0c8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4b4>
   9c0e4:      	mul	w10, w10, w12
   9c0e8:      	umull	x13, w10, w22
   9c0ec:      	lsr	x13, x13, #32
   9c0f0:      	sub	w14, w10, w13
   9c0f4:      	add	w13, w13, w14, lsr #1
   9c0f8:      	lsr	w13, w13, #11
   9c0fc:      	msub	w10, w13, w21, w10
   9c100:      	b	0x9c0c8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4b4>
   9c104:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c108:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c10c:      	mov	w2, #0x200              // =512
   9c110:      	add	x0, x0, #0x460
   9c114:      	add	x1, x1, #0x860
   9c118:      	bl	0x1065e8 <memcpy>
   9c11c:      	ldr	q6, [sp, #0x40]
   9c120:      	mov	x8, xzr
   9c124:      	ldr	q0, [x28, x8]
   9c128:      	ldr	q1, [x27, x8]
   9c12c:      	uaddl2	v2.4s, v1.8h, v0.8h
   9c130:      	uaddl	v0.4s, v1.4h, v0.4h
   9c134:      	umull2	v1.2d, v2.4s, v6.4s
   9c138:      	umull	v3.2d, v2.2s, v6.2s
   9c13c:      	umull2	v4.2d, v0.4s, v6.4s
   9c140:      	umull	v5.2d, v0.2s, v6.2s
   9c144:      	uzp2	v1.4s, v3.4s, v1.4s
   9c148:      	uzp2	v3.4s, v5.4s, v4.4s
   9c14c:      	xtn	v1.4h, v1.4s
   9c150:      	xtn	v3.4h, v3.4s
   9c154:      	umlsl	v2.4s, v1.4h, v8.4h
   9c158:      	umlsl	v0.4s, v3.4h, v8.4h
   9c15c:      	uzp1	v0.8h, v0.8h, v2.8h
   9c160:      	str	q0, [x19, x8]
   9c164:      	add	x8, x8, #0x10
   9c168:      	cmp	x8, #0x200
   9c16c:      	b.ne	0x9c124 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x510>
   9c170:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c174:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c178:      	mov	w2, #0x200              // =512
   9c17c:      	add	x0, x0, #0x260
   9c180:      	add	x1, x1, #0x860
   9c184:      	bl	0x1065e8 <memcpy>
   9c188:      	mov	x8, xzr
   9c18c:      	mov	x9, x8
   9c190:      	add	x8, x8, #0x2
   9c194:      	cmp	x8, #0x200
   9c198:      	strh	wzr, [x28, x9]
   9c19c:      	b.ne	0x9c18c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x578>
   9c1a0:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c1a4:      	add	x0, sp, #0xa60
   9c1a8:      	mov	w2, #0x200              // =512
   9c1ac:      	add	x1, x1, #0x260
   9c1b0:      	bl	0x1065e8 <memcpy>
   9c1b4:      	mov	x8, xzr
   9c1b8:      	mov	x9, x8
   9c1bc:      	add	x8, x8, #0x2
   9c1c0:      	cmp	x8, #0x200
   9c1c4:      	strh	wzr, [x27, x9]
   9c1c8:      	b.ne	0x9c1b8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5a4>
   9c1cc:      	ldur	x2, [x29, #-0x28]
   9c1d0:      	mov	x8, xzr
   9c1d4:      	mov	x9, x8
   9c1d8:      	add	x8, x8, #0x2
   9c1dc:      	cmp	x8, #0x200
   9c1e0:      	strh	wzr, [x25, x9]
   9c1e4:      	b.ne	0x9c1d4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5c0>
   9c1e8:      	cmp	x23, #0x600
   9c1ec:      	b.ne	0x9bf20 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x30c>
   9c1f0:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c1f4:      	add	x1, sp, #0xa60
   9c1f8:      	mov	w2, #0x200              // =512
   9c1fc:      	add	x0, x0, #0x860
   9c200:      	bl	0x1065e8 <memcpy>
   9c204:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9c208:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c20c:      	add	x8, x8, #0x460
   9c210:      	add	x0, x0, #0x860
   9c214:      	bl	0x9d3fc <<toyos_crypto::mlkem::Poly>::inverse>
   9c218:      	ldur	x9, [x29, #-0x28]
   9c21c:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9c220:      	ldr	x0, [sp, #0x30]
   9c224:      	add	x8, x8, #0x660
   9c228:      	add	w1, w9, #0x3
   9c22c:      	bl	0x9d658 <toyos_crypto::mlkem::noise>
   9c230:      	add	x23, sp, #0x1, lsl #12  // =0x1000
   9c234:      	add	x23, x23, #0x260
   9c238:      	ldr	q6, [sp, #0x40]
   9c23c:      	mov	x8, xzr
   9c240:      	ldr	q0, [x27, x8]
   9c244:      	ldr	q1, [x25, x8]
   9c248:      	uaddl2	v2.4s, v1.8h, v0.8h
   9c24c:      	uaddl	v0.4s, v1.4h, v0.4h
   9c250:      	umull2	v1.2d, v2.4s, v6.4s
   9c254:      	umull	v3.2d, v2.2s, v6.2s
   9c258:      	umull2	v4.2d, v0.4s, v6.4s
   9c25c:      	umull	v5.2d, v0.2s, v6.2s
   9c260:      	uzp2	v1.4s, v3.4s, v1.4s
   9c264:      	uzp2	v3.4s, v5.4s, v4.4s
   9c268:      	xtn	v1.4h, v1.4s
   9c26c:      	xtn	v3.4h, v3.4s
   9c270:      	umlsl	v2.4s, v1.4h, v8.4h
   9c274:      	umlsl	v0.4s, v3.4h, v8.4h
   9c278:      	uzp1	v0.8h, v0.8h, v2.8h
   9c27c:      	str	q0, [x19, x8]
   9c280:      	add	x8, x8, #0x10
   9c284:      	cmp	x8, #0x200
   9c288:      	b.ne	0x9c240 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x62c>
   9c28c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c290:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c294:      	mov	w2, #0x200              // =512
   9c298:      	add	x0, x0, #0x260
   9c29c:      	add	x1, x1, #0x860
   9c2a0:      	bl	0x1065e8 <memcpy>
   9c2a4:      	ldp	q5, q4, [sp, #0x10]
   9c2a8:      	mov	x8, xzr
   9c2ac:      	ldr	q0, [x23, x8]
   9c2b0:      	ushll	v1.4s, v0.4h, #0xa
   9c2b4:      	ushll2	v0.4s, v0.8h, #0xa
   9c2b8:      	add	v1.4s, v1.4s, v4.4s
   9c2bc:      	add	v0.4s, v0.4s, v4.4s
   9c2c0:      	umull2	v2.2d, v1.4s, v5.4s
   9c2c4:      	umull	v1.2d, v1.2s, v5.2s
   9c2c8:      	umull2	v3.2d, v0.4s, v5.4s
   9c2cc:      	umull	v0.2d, v0.2s, v5.2s
   9c2d0:      	uzp2	v1.4s, v1.4s, v2.4s
   9c2d4:      	uzp2	v0.4s, v0.4s, v3.4s
   9c2d8:      	shrn	v1.4h, v1.4s, #0x7
   9c2dc:      	shrn2	v1.8h, v0.4s, #0x7
   9c2e0:      	bic	v1.8h, #0xfc, lsl #8
   9c2e4:      	str	q1, [x23, x8]
   9c2e8:      	add	x8, x8, #0x10
   9c2ec:      	cmp	x8, #0x200
   9c2f0:      	b.ne	0x9c2ac <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x698>
   9c2f4:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c2f8:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c2fc:      	mov	w2, #0x200              // =512
   9c300:      	add	x0, x0, #0x860
   9c304:      	add	x1, x1, #0x260
   9c308:      	bl	0x1065e8 <memcpy>
   9c30c:      	ldur	x10, [x29, #-0x28]
   9c310:      	mov	w9, #0x140              // =320
   9c314:      	add	x8, sp, #0xc60
   9c318:      	madd	x2, x10, x9, x8
   9c31c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c320:      	mov	w1, #0xa                // =10
   9c324:      	mov	w3, #0x140              // =320
   9c328:      	add	x0, x0, #0x860
   9c32c:      	bl	0x9d2b8 <<toyos_crypto::mlkem::Poly>::encode>
   9c330:      	mov	x8, xzr
   9c334:      	mov	x9, x8
   9c338:      	add	x8, x8, #0x2
   9c33c:      	cmp	x8, #0x200
   9c340:      	strh	wzr, [x19, x9]
   9c344:      	b.ne	0x9c334 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x720>
   9c348:      	mov	x8, xzr
   9c34c:      	mov	x9, x8
   9c350:      	add	x8, x8, #0x2
   9c354:      	cmp	x8, #0x200
   9c358:      	strh	wzr, [x25, x9]
   9c35c:      	b.ne	0x9c34c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x738>
   9c360:      	mov	x8, xzr
   9c364:      	mov	x9, x8
   9c368:      	add	x8, x8, #0x2
   9c36c:      	cmp	x8, #0x200
   9c370:      	strh	wzr, [x27, x9]
   9c374:      	b.ne	0x9c364 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x750>
   9c378:      	ldr	x2, [sp, #0x38]
   9c37c:      	cmp	x2, #0x3
   9c380:      	b.ne	0x9be88 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x274>
   9c384:      	adrp	x8, 0x16000 <anon.7bb8b5ff289d4207669f9c18202c7170.7.llvm.7684364067831485864+0x309>
   9c388:      	mov	w24, #0xd01             // =3329
   9c38c:      	movi	v0.2d, #0000000000000000
   9c390:      	ldr	d9, [x8, #0x3b8]
   9c394:      	adrp	x8, 0x16000 <anon.7bb8b5ff289d4207669f9c18202c7170.7.llvm.7684364067831485864+0x309>
   9c398:      	movi	v8.4h, #0x7
   9c39c:      	ldr	d10, [x8, #0x320]
   9c3a0:      	mov	w8, #0xafb8             // =44984
   9c3a4:      	dup	v12.4h, w24
   9c3a8:      	movk	w8, #0x13, lsl #16
   9c3ac:      	adrp	x9, 0x16000 <anon.7bb8b5ff289d4207669f9c18202c7170.7.llvm.7684364067831485864+0x309>
   9c3b0:      	add	x23, sp, #0x1, lsl #12  // =0x1000
   9c3b4:      	dup	v1.4s, w8
   9c3b8:      	ldr	d11, [x9, #0x3c0]
   9c3bc:      	add	x25, sp, #0x1, lsl #12  // =0x1000
   9c3c0:      	mov	w26, #0xbb41            // =47937
   9c3c4:      	mov	w27, #0x7681            // =30337
   9c3c8:      	add	x21, sp, #0x1, lsl #12  // =0x1000
   9c3cc:      	mov	x10, xzr
   9c3d0:      	mov	x19, xzr
   9c3d4:      	add	x23, x23, #0x660
   9c3d8:      	add	x25, x25, #0x860
   9c3dc:      	movk	w26, #0x9d7d, lsl #16
   9c3e0:      	movk	w27, #0x3afb, lsl #16
   9c3e4:      	mov	w28, #0xf2ff            // =62207
   9c3e8:      	add	x21, x21, #0x460
   9c3ec:      	add	x22, sp, #0x660
   9c3f0:      	str	q0, [sp, #0x850]
   9c3f4:      	str	q0, [sp, #0x840]
   9c3f8:      	str	q0, [sp, #0x830]
   9c3fc:      	str	q0, [sp, #0x820]
   9c400:      	str	q0, [sp, #0x810]
   9c404:      	str	q0, [sp, #0x800]
   9c408:      	str	q0, [sp, #0x7f0]
   9c40c:      	str	q0, [sp, #0x7e0]
   9c410:      	str	q0, [sp, #0x7d0]
   9c414:      	str	q0, [sp, #0x7c0]
   9c418:      	str	q0, [sp, #0x7b0]
   9c41c:      	str	q0, [sp, #0x7a0]
   9c420:      	str	q0, [sp, #0x790]
   9c424:      	str	q0, [sp, #0x780]
   9c428:      	str	q0, [sp, #0x770]
   9c42c:      	str	q0, [sp, #0x760]
   9c430:      	str	q0, [sp, #0x750]
   9c434:      	str	q0, [sp, #0x740]
   9c438:      	str	q0, [sp, #0x730]
   9c43c:      	str	q0, [sp, #0x720]
   9c440:      	str	q0, [sp, #0x710]
   9c444:      	str	q0, [sp, #0x700]
   9c448:      	str	q0, [sp, #0x6f0]
   9c44c:      	str	q0, [sp, #0x6e0]
   9c450:      	str	q0, [sp, #0x6d0]
   9c454:      	str	q0, [sp, #0x6c0]
   9c458:      	str	q0, [sp, #0x6b0]
   9c45c:      	str	q0, [sp, #0x6a0]
   9c460:      	str	q0, [sp, #0x690]
   9c464:      	str	q0, [sp, #0x680]
   9c468:      	str	q0, [sp, #0x670]
   9c46c:      	str	q0, [sp, #0x660]
   9c470:      	str	q1, [sp, #0x40]
   9c474:      	ldr	x9, [sp, #0x58]
   9c478:      	mov	w11, #0x180             // =384
   9c47c:      	movi	v0.2d, #0000000000000000
   9c480:      	madd	x9, x10, x11, x9
   9c484:      	add	x10, x10, #0x1
   9c488:      	add	x11, sp, #0x60
   9c48c:      	stur	x10, [x29, #-0x28]
   9c490:      	add	x10, sp, #0x1, lsl #12  // =0x1000
   9c494:      	mov	x8, xzr
   9c498:      	add	x20, x11, x19
   9c49c:      	add	x19, x19, #0x200
   9c4a0:      	add	x10, x10, #0x860
   9c4a4:      	str	q0, [sp, #0x1a50]
   9c4a8:      	str	q0, [sp, #0x1a40]
   9c4ac:      	str	q0, [sp, #0x1a30]
   9c4b0:      	str	q0, [sp, #0x1a20]
   9c4b4:      	str	q0, [sp, #0x1a10]
   9c4b8:      	str	q0, [sp, #0x1a00]
   9c4bc:      	str	q0, [sp, #0x19f0]
   9c4c0:      	str	q0, [sp, #0x19e0]
   9c4c4:      	str	q0, [sp, #0x19d0]
   9c4c8:      	str	q0, [sp, #0x19c0]
   9c4cc:      	str	q0, [sp, #0x19b0]
   9c4d0:      	str	q0, [sp, #0x19a0]
   9c4d4:      	str	q0, [sp, #0x1990]
   9c4d8:      	str	q0, [sp, #0x1980]
   9c4dc:      	str	q0, [sp, #0x1970]
   9c4e0:      	str	q0, [sp, #0x1960]
   9c4e4:      	str	q0, [sp, #0x1950]
   9c4e8:      	str	q0, [sp, #0x1940]
   9c4ec:      	str	q0, [sp, #0x1930]
   9c4f0:      	str	q0, [sp, #0x1920]
   9c4f4:      	str	q0, [sp, #0x1910]
   9c4f8:      	str	q0, [sp, #0x1900]
   9c4fc:      	str	q0, [sp, #0x18f0]
   9c500:      	str	q0, [sp, #0x18e0]
   9c504:      	str	q0, [sp, #0x18d0]
   9c508:      	str	q0, [sp, #0x18c0]
   9c50c:      	str	q0, [sp, #0x18b0]
   9c510:      	str	q0, [sp, #0x18a0]
   9c514:      	str	q0, [sp, #0x1890]
   9c518:      	str	q0, [sp, #0x1880]
   9c51c:      	str	q0, [sp, #0x1870]
   9c520:      	str	q0, [sp, #0x1860]
   9c524:      	fmov	s0, w8
   9c528:      	add	w11, w8, #0x1
   9c52c:      	add	x12, x8, #0x4
   9c530:      	fmov	s1, w12
   9c534:      	add	w13, w8, #0x5
   9c538:      	add	w14, w8, #0x6
   9c53c:      	add	w15, w8, #0xa
   9c540:      	lsr	x12, x12, #3
   9c544:      	mov	v0.h[1], w11
   9c548:      	add	x11, x8, #0x8
   9c54c:      	fmov	s2, w11
   9c550:      	mov	v1.h[1], w13
   9c554:      	add	w13, w8, #0x9
   9c558:      	lsr	x11, x11, #3
   9c55c:      	ldrb	w12, [x9, x12]
   9c560:      	mov	v2.h[1], w13
   9c564:      	add	w13, w8, #0x2
   9c568:      	ldrb	w11, [x9, x11]
   9c56c:      	mov	v0.h[2], w13
   9c570:      	mov	v1.h[2], w14
   9c574:      	add	w14, w8, #0x3
   9c578:      	lsr	x13, x8, #3
   9c57c:      	dup	v4.4h, w12
   9c580:      	dup	v5.4h, w11
   9c584:      	mov	v2.h[2], w15
   9c588:      	sub	w15, w8, #0x1
   9c58c:      	ldrb	w13, [x9, x13]
   9c590:      	mov	v0.h[3], w14
   9c594:      	add	w14, w8, #0xb
   9c598:      	mov	v1.h[3], w15
   9c59c:      	dup	v3.4h, w13
   9c5a0:      	bic	v4.4h, #0xff, lsl #8
   9c5a4:      	bic	v5.4h, #0xff, lsl #8
   9c5a8:      	add	x8, x8, #0xc
   9c5ac:      	mov	v2.h[3], w14
   9c5b0:      	cmp	x8, #0xc00
   9c5b4:      	and	v0.8b, v0.8b, v8.8b
   9c5b8:      	and	v1.8b, v1.8b, v8.8b
   9c5bc:      	bic	v3.4h, #0xff, lsl #8
   9c5c0:      	and	v2.8b, v2.8b, v8.8b
   9c5c4:      	neg	v0.4h, v0.4h
   9c5c8:      	neg	v1.4h, v1.4h
   9c5cc:      	neg	v2.4h, v2.4h
   9c5d0:      	ushl	v0.4h, v3.4h, v0.4h
   9c5d4:      	ushl	v1.4h, v4.4h, v1.4h
   9c5d8:      	ldr	h3, [x10]
   9c5dc:      	ushl	v2.4h, v5.4h, v2.4h
   9c5e0:      	bic	v0.4h, #0xfe
   9c5e4:      	bic	v1.4h, #0xfe
   9c5e8:      	bic	v2.4h, #0xfe
   9c5ec:      	ushl	v0.4h, v0.4h, v9.4h
   9c5f0:      	ushl	v1.4h, v1.4h, v10.4h
   9c5f4:      	ushl	v2.4h, v2.4h, v11.4h
   9c5f8:      	orr	v0.8b, v0.8b, v3.8b
   9c5fc:      	orr	v1.8b, v2.8b, v1.8b
   9c600:      	orr	v0.8b, v1.8b, v0.8b
   9c604:      	fmov	x11, d0
   9c608:      	lsr	x12, x11, #32
   9c60c:      	orr	w11, w11, w12
   9c610:      	orr	w11, w11, w11, lsr #16
   9c614:      	strh	w11, [x10], #0x2
   9c618:      	b.ne	0x9c524 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x910>
   9c61c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c620:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c624:      	mov	w2, #0x200              // =512
   9c628:      	add	x0, x0, #0x660
   9c62c:      	add	x1, x1, #0x860
   9c630:      	bl	0x1065e8 <memcpy>
   9c634:      	movi	v0.2d, #0000000000000000
   9c638:      	mov	x8, xzr
   9c63c:      	str	q0, [sp, #0x1a50]
   9c640:      	str	q0, [sp, #0x1a40]
   9c644:      	str	q0, [sp, #0x1a30]
   9c648:      	str	q0, [sp, #0x1a20]
   9c64c:      	str	q0, [sp, #0x1a10]
   9c650:      	str	q0, [sp, #0x1a00]
   9c654:      	str	q0, [sp, #0x19f0]
   9c658:      	str	q0, [sp, #0x19e0]
   9c65c:      	str	q0, [sp, #0x19d0]
   9c660:      	str	q0, [sp, #0x19c0]
   9c664:      	str	q0, [sp, #0x19b0]
   9c668:      	str	q0, [sp, #0x19a0]
   9c66c:      	str	q0, [sp, #0x1990]
   9c670:      	str	q0, [sp, #0x1980]
   9c674:      	str	q0, [sp, #0x1970]
   9c678:      	str	q0, [sp, #0x1960]
   9c67c:      	str	q0, [sp, #0x1950]
   9c680:      	str	q0, [sp, #0x1940]
   9c684:      	str	q0, [sp, #0x1930]
   9c688:      	str	q0, [sp, #0x1920]
   9c68c:      	str	q0, [sp, #0x1910]
   9c690:      	str	q0, [sp, #0x1900]
   9c694:      	str	q0, [sp, #0x18f0]
   9c698:      	str	q0, [sp, #0x18e0]
   9c69c:      	str	q0, [sp, #0x18d0]
   9c6a0:      	str	q0, [sp, #0x18c0]
   9c6a4:      	str	q0, [sp, #0x18b0]
   9c6a8:      	str	q0, [sp, #0x18a0]
   9c6ac:      	str	q0, [sp, #0x1890]
   9c6b0:      	str	q0, [sp, #0x1880]
   9c6b4:      	str	q0, [sp, #0x1870]
   9c6b8:      	str	q0, [sp, #0x1860]
   9c6bc:      	b	0x9c79c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb88>
   9c6c0:      	mov	w10, #0x2               // =2
   9c6c4:      	bfi	x10, x8, #2, #62
   9c6c8:      	ldrh	w12, [x23, x10]
   9c6cc:      	ldrh	w13, [x20, x10]
   9c6d0:      	mul	w14, w13, w12
   9c6d4:      	umull	x11, w14, w27
   9c6d8:      	lsr	x11, x11, #32
   9c6dc:      	sub	w15, w14, w11
   9c6e0:      	add	w15, w11, w15, lsr #1
   9c6e4:      	lsl	x11, x8, #2
   9c6e8:      	add	x8, x8, #0x1
   9c6ec:      	lsr	w15, w15, #11
   9c6f0:      	ldrh	w16, [x23, x11]
   9c6f4:      	ldrh	w17, [x20, x11]
   9c6f8:      	msub	w14, w15, w24, w14
   9c6fc:      	mul	w15, w17, w16
   9c700:      	mul	w13, w13, w16
   9c704:      	mul	w9, w14, w9
   9c708:      	mul	w12, w12, w17
   9c70c:      	umull	x14, w15, w27
   9c710:      	umull	x16, w9, w27
   9c714:      	umull	x17, w13, w27
   9c718:      	umull	x18, w12, w27
   9c71c:      	lsr	x14, x14, #32
   9c720:      	lsr	x16, x16, #32
   9c724:      	lsr	x17, x17, #32
   9c728:      	sub	w0, w15, w14
   9c72c:      	lsr	x18, x18, #32
   9c730:      	add	w14, w14, w0, lsr #1
   9c734:      	sub	w0, w9, w16
   9c738:      	add	w16, w16, w0, lsr #1
   9c73c:      	sub	w0, w13, w17
   9c740:      	add	w17, w17, w0, lsr #1
   9c744:      	sub	w0, w12, w18
   9c748:      	lsr	w14, w14, #11
   9c74c:      	add	w18, w18, w0, lsr #1
   9c750:      	lsr	w16, w16, #11
   9c754:      	lsr	w17, w17, #11
   9c758:      	msub	w14, w14, w24, w15
   9c75c:      	lsr	w15, w18, #11
   9c760:      	msub	w9, w16, w24, w9
   9c764:      	msub	w13, w17, w24, w13
   9c768:      	msub	w12, w15, w24, w12
   9c76c:      	add	w9, w9, w14
   9c770:      	add	w14, w9, w28
   9c774:      	cmp	w9, #0xd01
   9c778:      	add	w12, w13, w12
   9c77c:      	csel	w9, w9, w14, lo
   9c780:      	strh	w9, [x25, x11]
   9c784:      	add	w13, w12, w28
   9c788:      	cmp	w12, #0xd01
   9c78c:      	csel	w9, w12, w13, lo
   9c790:      	cmp	x8, #0x80
   9c794:      	strh	w9, [x25, x10]
   9c798:      	b.eq	0x9c7f0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbdc>
   9c79c:      	orr	w9, w8, #0x80
   9c7a0:      	mov	w11, #0x11              // =17
   9c7a4:      	rbit	w9, w9
   9c7a8:      	lsr	w10, w9, #24
   9c7ac:      	mov	w9, #0x1                // =1
   9c7b0:      	b	0x9c7cc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbb8>
   9c7b4:      	mul	w11, w11, w11
   9c7b8:      	lsr	w10, w10, #1
   9c7bc:      	umull	x12, w11, w26
   9c7c0:      	lsr	x12, x12, #43
   9c7c4:      	msub	w11, w12, w24, w11
   9c7c8:      	cbz	w10, 0x9c6c0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xaac>
   9c7cc:      	tbz	w10, #0x0, 0x9c7b4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xba0>
   9c7d0:      	mul	w9, w9, w11
   9c7d4:      	umull	x12, w9, w27
   9c7d8:      	lsr	x12, x12, #32
   9c7dc:      	sub	w13, w9, w12
   9c7e0:      	add	w12, w12, w13, lsr #1
   9c7e4:      	lsr	w12, w12, #11
   9c7e8:      	msub	w9, w12, w24, w9
   9c7ec:      	b	0x9c7b4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xba0>
   9c7f0:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c7f4:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c7f8:      	mov	w2, #0x200              // =512
   9c7fc:      	add	x0, x0, #0x460
   9c800:      	add	x1, x1, #0x860
   9c804:      	bl	0x1065e8 <memcpy>
   9c808:      	ldr	q6, [sp, #0x40]
   9c80c:      	mov	x8, xzr
   9c810:      	ldr	q0, [x22, x8]
   9c814:      	ldr	q1, [x21, x8]
   9c818:      	uaddl2	v2.4s, v1.8h, v0.8h
   9c81c:      	uaddl	v0.4s, v1.4h, v0.4h
   9c820:      	umull2	v1.2d, v2.4s, v6.4s
   9c824:      	umull	v3.2d, v2.2s, v6.2s
   9c828:      	umull2	v4.2d, v0.4s, v6.4s
   9c82c:      	umull	v5.2d, v0.2s, v6.2s
   9c830:      	uzp2	v1.4s, v3.4s, v1.4s
   9c834:      	uzp2	v3.4s, v5.4s, v4.4s
   9c838:      	xtn	v1.4h, v1.4s
   9c83c:      	xtn	v3.4h, v3.4s
   9c840:      	umlsl	v2.4s, v1.4h, v12.4h
   9c844:      	umlsl	v0.4s, v3.4h, v12.4h
   9c848:      	uzp1	v0.8h, v0.8h, v2.8h
   9c84c:      	str	q0, [x25, x8]
   9c850:      	add	x8, x8, #0x10
   9c854:      	cmp	x8, #0x200
   9c858:      	b.ne	0x9c810 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbfc>
   9c85c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c860:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c864:      	mov	w2, #0x200              // =512
   9c868:      	add	x0, x0, #0x260
   9c86c:      	add	x1, x1, #0x860
   9c870:      	bl	0x1065e8 <memcpy>
   9c874:      	mov	x8, xzr
   9c878:      	mov	x9, x8
   9c87c:      	add	x8, x8, #0x2
   9c880:      	cmp	x8, #0x200
   9c884:      	strh	wzr, [x22, x9]
   9c888:      	b.ne	0x9c878 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc64>
   9c88c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c890:      	add	x0, sp, #0x660
   9c894:      	mov	w2, #0x200              // =512
   9c898:      	add	x1, x1, #0x260
   9c89c:      	bl	0x1065e8 <memcpy>
   9c8a0:      	mov	x8, xzr
   9c8a4:      	mov	x9, x8
   9c8a8:      	add	x8, x8, #0x2
   9c8ac:      	cmp	x8, #0x200
   9c8b0:      	strh	wzr, [x21, x9]
   9c8b4:      	b.ne	0x9c8a4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc90>
   9c8b8:      	ldur	x10, [x29, #-0x28]
   9c8bc:      	mov	x8, xzr
   9c8c0:      	mov	x9, x8
   9c8c4:      	add	x8, x8, #0x2
   9c8c8:      	cmp	x8, #0x200
   9c8cc:      	strh	wzr, [x23, x9]
   9c8d0:      	b.ne	0x9c8c0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xcac>
   9c8d4:      	cmp	x19, #0x600
   9c8d8:      	b.ne	0x9c474 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x860>
   9c8dc:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c8e0:      	add	x1, sp, #0x660
   9c8e4:      	mov	w2, #0x200              // =512
   9c8e8:      	add	x0, x0, #0x860
   9c8ec:      	bl	0x1065e8 <memcpy>
   9c8f0:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c8f4:      	add	x8, sp, #0xa60
   9c8f8:      	add	x0, x0, #0x860
   9c8fc:      	bl	0x9d3fc <<toyos_crypto::mlkem::Poly>::inverse>
   9c900:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9c904:      	ldr	x0, [sp, #0x30]
   9c908:      	mov	w1, #0x6                // =6
   9c90c:      	add	x8, x8, #0x260
   9c910:      	add	x19, sp, #0x1, lsl #12  // =0x1000
   9c914:      	add	x19, x19, #0x260
   9c918:      	bl	0x9d658 <toyos_crypto::mlkem::noise>
   9c91c:      	ldp	x21, x20, [sp]
   9c920:      	mov	w9, #0xd01              // =3329
   9c924:      	mov	w10, #0xafb8            // =44984
   9c928:      	mov	x8, xzr
   9c92c:      	movk	w10, #0x13, lsl #16
   9c930:      	dup	v0.4h, w9
   9c934:      	add	x9, sp, #0xa60
   9c938:      	dup	v1.4s, w10
   9c93c:      	add	x10, sp, #0x1, lsl #12  // =0x1000
   9c940:      	add	x10, x10, #0x860
   9c944:      	ldr	q2, [x9, x8]
   9c948:      	ldr	q3, [x19, x8]
   9c94c:      	uaddl2	v4.4s, v3.8h, v2.8h
   9c950:      	uaddl	v2.4s, v3.4h, v2.4h
   9c954:      	umull2	v3.2d, v4.4s, v1.4s
   9c958:      	umull	v5.2d, v4.2s, v1.2s
   9c95c:      	umull2	v6.2d, v2.4s, v1.4s
   9c960:      	umull	v7.2d, v2.2s, v1.2s
   9c964:      	uzp2	v3.4s, v5.4s, v3.4s
   9c968:      	uzp2	v5.4s, v7.4s, v6.4s
   9c96c:      	xtn	v3.4h, v3.4s
   9c970:      	xtn	v5.4h, v5.4s
   9c974:      	umlsl	v4.4s, v3.4h, v0.4h
   9c978:      	umlsl	v2.4s, v5.4h, v0.4h
   9c97c:      	uzp1	v2.8h, v2.8h, v4.8h
   9c980:      	str	q2, [x10, x8]
   9c984:      	add	x8, x8, #0x10
   9c988:      	cmp	x8, #0x200
   9c98c:      	b.ne	0x9c944 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd30>
   9c990:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c994:      	add	x0, sp, #0x860
   9c998:      	mov	w2, #0x200              // =512
   9c99c:      	add	x1, x1, #0x860
   9c9a0:      	add	x19, sp, #0x1, lsl #12  // =0x1000
   9c9a4:      	add	x19, x19, #0x860
   9c9a8:      	bl	0x1065e8 <memcpy>
   9c9ac:      	movi	v4.2d, #0000000000000000
   9c9b0:      	movi	v0.8b, #0x7
   9c9b4:      	adrp	x9, 0x16000 <anon.7bb8b5ff289d4207669f9c18202c7170.7.llvm.7684364067831485864+0x309>
   9c9b8:      	movi	v1.8b, #0x1
   9c9bc:      	movi	v2.8b, #0x10
   9c9c0:      	ldr	d3, [x9, #0x330]
   9c9c4:      	mov	x8, xzr
   9c9c8:      	add	x9, x21, #0x1
   9c9cc:      	str	q4, [sp, #0x1a50]
   9c9d0:      	str	q4, [sp, #0x1a40]
   9c9d4:      	str	q4, [sp, #0x1a30]
   9c9d8:      	str	q4, [sp, #0x1a20]
   9c9dc:      	str	q4, [sp, #0x1a10]
   9c9e0:      	str	q4, [sp, #0x1a00]
   9c9e4:      	str	q4, [sp, #0x19f0]
   9c9e8:      	str	q4, [sp, #0x19e0]
   9c9ec:      	str	q4, [sp, #0x19d0]
   9c9f0:      	str	q4, [sp, #0x19c0]
   9c9f4:      	str	q4, [sp, #0x19b0]
   9c9f8:      	str	q4, [sp, #0x19a0]
   9c9fc:      	str	q4, [sp, #0x1990]
   9ca00:      	str	q4, [sp, #0x1980]
   9ca04:      	str	q4, [sp, #0x1970]
   9ca08:      	str	q4, [sp, #0x1960]
   9ca0c:      	str	q4, [sp, #0x1950]
   9ca10:      	str	q4, [sp, #0x1940]
   9ca14:      	str	q4, [sp, #0x1930]
   9ca18:      	str	q4, [sp, #0x1920]
   9ca1c:      	str	q4, [sp, #0x1910]
   9ca20:      	str	q4, [sp, #0x1900]
   9ca24:      	str	q4, [sp, #0x18f0]
   9ca28:      	str	q4, [sp, #0x18e0]
   9ca2c:      	str	q4, [sp, #0x18d0]
   9ca30:      	str	q4, [sp, #0x18c0]
   9ca34:      	str	q4, [sp, #0x18b0]
   9ca38:      	str	q4, [sp, #0x18a0]
   9ca3c:      	str	q4, [sp, #0x1890]
   9ca40:      	str	q4, [sp, #0x1880]
   9ca44:      	str	q4, [sp, #0x1870]
   9ca48:      	str	q4, [sp, #0x1860]
   9ca4c:      	and	v4.8b, v3.8b, v0.8b
   9ca50:      	sub	x10, x9, #0x1
   9ca54:      	ld1r	{ v6.8b }, [x9]
   9ca58:      	ld1r	{ v5.8b }, [x10]
   9ca5c:      	add	x10, x19, x8
   9ca60:      	add	v3.8b, v3.8b, v2.8b
   9ca64:      	add	x8, x8, #0x20
   9ca68:      	add	x9, x9, #0x2
   9ca6c:      	neg	v4.8b, v4.8b
   9ca70:      	cmp	x8, #0x200
   9ca74:      	ushl	v5.8b, v5.8b, v4.8b
   9ca78:      	ushl	v4.8b, v6.8b, v4.8b
   9ca7c:      	ldp	q6, q7, [x10]
   9ca80:      	and	v5.8b, v5.8b, v1.8b
   9ca84:      	and	v4.8b, v4.8b, v1.8b
   9ca88:      	ushll	v5.8h, v5.8b, #0x0
   9ca8c:      	ushll	v4.8h, v4.8b, #0x0
   9ca90:      	orr	v5.16b, v6.16b, v5.16b
   9ca94:      	orr	v4.16b, v7.16b, v4.16b
   9ca98:      	stp	q5, q4, [x10]
   9ca9c:      	b.ne	0x9ca4c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xe38>
   9caa0:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9caa4:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9caa8:      	mov	w2, #0x200              // =512
   9caac:      	add	x0, x0, #0x660
   9cab0:      	add	x1, x1, #0x860
   9cab4:      	add	x19, sp, #0x1, lsl #12  // =0x1000
   9cab8:      	add	x19, x19, #0x660
   9cabc:      	bl	0x1065e8 <memcpy>
   9cac0:      	mov	w8, #0xd01              // =3329
   9cac4:      	movi	v0.2d, #0000000000000000
   9cac8:      	dup	v1.8h, w8
   9cacc:      	mov	x8, xzr
   9cad0:      	add	x9, x19, x8
   9cad4:      	add	x8, x8, #0x20
   9cad8:      	ldp	q2, q3, [x9]
   9cadc:      	cmp	x8, #0x200
   9cae0:      	umull	v4.4s, v2.4h, v1.4h
   9cae4:      	umull2	v2.4s, v2.8h, v1.8h
   9cae8:      	umull	v5.4s, v3.4h, v1.4h
   9caec:      	umull2	v3.4s, v3.8h, v1.8h
   9caf0:      	urhadd	v2.4s, v2.4s, v0.4s
   9caf4:      	urhadd	v4.4s, v4.4s, v0.4s
   9caf8:      	urhadd	v5.4s, v5.4s, v0.4s
   9cafc:      	urhadd	v3.4s, v3.4s, v0.4s
   9cb00:      	uzp1	v2.8h, v4.8h, v2.8h
   9cb04:      	uzp1	v3.8h, v5.8h, v3.8h
   9cb08:      	stp	q2, q3, [x9]
   9cb0c:      	b.ne	0x9cad0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xebc>
   9cb10:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9cb14:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9cb18:      	mov	w2, #0x200              // =512
   9cb1c:      	add	x0, x0, #0x460
   9cb20:      	add	x1, x1, #0x660
   9cb24:      	add	x19, sp, #0x1, lsl #12  // =0x1000
   9cb28:      	add	x19, x19, #0x460
   9cb2c:      	bl	0x1065e8 <memcpy>
   9cb30:      	mov	w9, #0xd01              // =3329
   9cb34:      	mov	w10, #0xafb8            // =44984
   9cb38:      	mov	x8, xzr
   9cb3c:      	movk	w10, #0x13, lsl #16
   9cb40:      	dup	v0.4h, w9
   9cb44:      	add	x9, sp, #0x860
   9cb48:      	dup	v1.4s, w10
   9cb4c:      	add	x10, sp, #0x1, lsl #12  // =0x1000
   9cb50:      	add	x10, x10, #0x860
   9cb54:      	ldr	q2, [x9, x8]
   9cb58:      	ldr	q3, [x19, x8]
   9cb5c:      	uaddl2	v4.4s, v3.8h, v2.8h
   9cb60:      	uaddl	v2.4s, v3.4h, v2.4h
   9cb64:      	umull2	v3.2d, v4.4s, v1.4s
   9cb68:      	umull	v5.2d, v4.2s, v1.2s
   9cb6c:      	umull2	v6.2d, v2.4s, v1.4s
   9cb70:      	umull	v7.2d, v2.2s, v1.2s
   9cb74:      	uzp2	v3.4s, v5.4s, v3.4s
   9cb78:      	uzp2	v5.4s, v7.4s, v6.4s
   9cb7c:      	xtn	v3.4h, v3.4s
   9cb80:      	xtn	v5.4h, v5.4s
   9cb84:      	umlsl	v4.4s, v3.4h, v0.4h
   9cb88:      	umlsl	v2.4s, v5.4h, v0.4h
   9cb8c:      	uzp1	v2.8h, v2.8h, v4.8h
   9cb90:      	str	q2, [x10, x8]
   9cb94:      	add	x8, x8, #0x10
   9cb98:      	cmp	x8, #0x200
   9cb9c:      	b.ne	0x9cb54 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xf40>
   9cba0:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9cba4:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9cba8:      	mov	w2, #0x200              // =512
   9cbac:      	add	x0, x0, #0x660
   9cbb0:      	add	x1, x1, #0x860
   9cbb4:      	add	x19, sp, #0x1, lsl #12  // =0x1000
   9cbb8:      	add	x19, x19, #0x660
   9cbbc:      	bl	0x1065e8 <memcpy>
   9cbc0:      	mov	w9, #0xafb8             // =44984
   9cbc4:      	mov	w8, #0x680              // =1664
   9cbc8:      	movi	v0.8h, #0xf
   9cbcc:      	movk	w9, #0x13, lsl #16
   9cbd0:      	dup	v1.4s, w8
   9cbd4:      	mov	x8, xzr
   9cbd8:      	dup	v2.4s, w9
   9cbdc:      	ldr	q3, [x19, x8]
   9cbe0:      	ushll2	v4.4s, v3.8h, #0x4
   9cbe4:      	ushll	v3.4s, v3.4h, #0x4
   9cbe8:      	add	v4.4s, v4.4s, v1.4s
   9cbec:      	add	v3.4s, v3.4s, v1.4s
   9cbf0:      	umull2	v5.2d, v4.4s, v2.4s
   9cbf4:      	umull	v4.2d, v4.2s, v2.2s
   9cbf8:      	umull2	v6.2d, v3.4s, v2.4s
   9cbfc:      	umull	v3.2d, v3.2s, v2.2s
   9cc00:      	uzp2	v4.4s, v4.4s, v5.4s
   9cc04:      	uzp2	v3.4s, v3.4s, v6.4s
   9cc08:      	uzp1	v3.8h, v3.8h, v4.8h
   9cc0c:      	and	v3.16b, v3.16b, v0.16b
   9cc10:      	str	q3, [x19, x8]
   9cc14:      	add	x8, x8, #0x10
   9cc18:      	cmp	x8, #0x200
   9cc1c:      	b.ne	0x9cbdc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xfc8>
   9cc20:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9cc24:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9cc28:      	mov	w2, #0x200              // =512
   9cc2c:      	add	x0, x0, #0x860
   9cc30:      	add	x1, x1, #0x660
   9cc34:      	add	x19, sp, #0x1, lsl #12  // =0x1000
   9cc38:      	add	x19, x19, #0x860
   9cc3c:      	bl	0x1065e8 <memcpy>
   9cc40:      	add	x8, sp, #0xc60
   9cc44:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9cc48:      	add	x2, x8, #0x3c0
   9cc4c:      	mov	w1, #0x4                // =4
   9cc50:      	add	x0, x0, #0x860
   9cc54:      	mov	w3, #0x80               // =128
   9cc58:      	bl	0x9d2b8 <<toyos_crypto::mlkem::Poly>::encode>
   9cc5c:      	mov	x8, xzr
   9cc60:      	mov	x9, x8
   9cc64:      	add	x8, x8, #0x2
   9cc68:      	cmp	x8, #0x200
   9cc6c:      	strh	wzr, [x19, x9]
   9cc70:      	b.ne	0x9cc60 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x104c>
   9cc74:      	add	x9, sp, #0x1, lsl #12   // =0x1000
   9cc78:      	mov	x8, xzr
   9cc7c:      	add	x9, x9, #0x460
   9cc80:      	mov	x10, x8
   9cc84:      	add	x8, x8, #0x2
   9cc88:      	cmp	x8, #0x200
   9cc8c:      	strh	wzr, [x9, x10]
   9cc90:      	b.ne	0x9cc80 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x106c>
   9cc94:      	mov	x8, xzr
   9cc98:      	add	x9, sp, #0x860
   9cc9c:      	mov	x10, x8
   9cca0:      	add	x8, x8, #0x2
   9cca4:      	cmp	x8, #0x200
   9cca8:      	strh	wzr, [x9, x10]
   9ccac:      	b.ne	0x9cc9c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1088>
   9ccb0:      	add	x9, sp, #0x1, lsl #12   // =0x1000
   9ccb4:      	mov	x8, xzr
   9ccb8:      	add	x9, x9, #0x260
   9ccbc:      	mov	x10, x8
   9ccc0:      	add	x8, x8, #0x2
   9ccc4:      	cmp	x8, #0x200
   9ccc8:      	strh	wzr, [x9, x10]
   9cccc:      	b.ne	0x9ccbc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x10a8>
   9ccd0:      	mov	x8, xzr
   9ccd4:      	add	x9, sp, #0xa60
   9ccd8:      	mov	x10, x8
   9ccdc:      	add	x8, x8, #0x2
   9cce0:      	cmp	x8, #0x200
   9cce4:      	strh	wzr, [x9, x10]
   9cce8:      	b.ne	0x9ccd8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x10c4>
   9ccec:      	add	x1, sp, #0xc60
   9ccf0:      	mov	x0, x20
   9ccf4:      	mov	w2, #0x440              // =1088
   9ccf8:      	bl	0x1065e8 <memcpy>
   9ccfc:      	mov	x8, xzr
   9cd00:      	add	x9, sp, #0x60
   9cd04:      	mov	x10, x8
   9cd08:      	add	x8, x8, #0x2
   9cd0c:      	cmp	x8, #0x200
   9cd10:      	strh	wzr, [x9, x10]
   9cd14:      	b.ne	0x9cd04 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x10f0>
   9cd18:      	add	x9, sp, #0x60
   9cd1c:      	mov	x8, xzr
   9cd20:      	add	x9, x9, #0x200
   9cd24:      	mov	x10, x8
   9cd28:      	add	x8, x8, #0x2
   9cd2c:      	cmp	x8, #0x200
   9cd30:      	strh	wzr, [x9, x10]
   9cd34:      	b.ne	0x9cd24 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1110>
   9cd38:      	add	x9, sp, #0x60
   9cd3c:      	mov	x8, xzr
   9cd40:      	add	x9, x9, #0x400
   9cd44:      	mov	x10, x8
   9cd48:      	add	x8, x8, #0x2
   9cd4c:      	cmp	x8, #0x200
   9cd50:      	strh	wzr, [x9, x10]
   9cd54:      	b.ne	0x9cd44 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1130>
   9cd58:      	add	sp, sp, #0x1, lsl #12   // =0x1000
   9cd5c:      	add	sp, sp, #0xa70
   9cd60:      	ldp	x20, x19, [sp, #0x80]
   9cd64:      	ldp	x22, x21, [sp, #0x70]
   9cd68:      	ldp	x24, x23, [sp, #0x60]
   9cd6c:      	ldp	x26, x25, [sp, #0x50]
   9cd70:      	ldp	x28, x27, [sp, #0x40]
   9cd74:      	ldp	x29, x30, [sp, #0x30]
   9cd78:      	ldp	d9, d8, [sp, #0x20]
   9cd7c:      	ldp	d11, d10, [sp, #0x10]
   9cd80:      	ldr	d12, [sp], #0x90
   9cd84:      	ret
   9cd88:      	mov	x8, xzr
   9cd8c:      	mov	x9, x8
   9cd90:      	add	x8, x8, #0x2
   9cd94:      	cmp	x8, #0x200
   9cd98:      	strh	wzr, [x19, x9]
   9cd9c:      	b.ne	0x9cd8c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1178>
   9cda0:      	add	x9, sp, #0x1, lsl #12   // =0x1000
   9cda4:      	mov	x8, xzr
   9cda8:      	add	x9, x9, #0x460
   9cdac:      	mov	x10, x8
   9cdb0:      	add	x8, x8, #0x2
   9cdb4:      	cmp	x8, #0x200
   9cdb8:      	strh	wzr, [x9, x10]
   9cdbc:      	b.ne	0x9cdac <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1198>
   9cdc0:      	mov	x8, xzr
   9cdc4:      	add	x9, sp, #0x860
   9cdc8:      	mov	x10, x8
   9cdcc:      	add	x8, x8, #0x2
   9cdd0:      	cmp	x8, #0x200
   9cdd4:      	strh	wzr, [x9, x10]
   9cdd8:      	b.ne	0x9cdc8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x11b4>
   9cddc:      	add	x9, sp, #0x1, lsl #12   // =0x1000
   9cde0:      	mov	x8, xzr
   9cde4:      	add	x9, x9, #0x260
   9cde8:      	mov	x10, x8
   9cdec:      	add	x8, x8, #0x2
   9cdf0:      	cmp	x8, #0x200
   9cdf4:      	strh	wzr, [x9, x10]
   9cdf8:      	b.ne	0x9cde8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x11d4>
   9cdfc:      	b	0x9ce00 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x11ec>
   9ce00:      	mov	x8, xzr
   9ce04:      	add	x9, sp, #0xa60
   9ce08:      	mov	x10, x8
   9ce0c:      	add	x8, x8, #0x2
   9ce10:      	cmp	x8, #0x200
   9ce14:      	strh	wzr, [x9, x10]
   9ce18:      	b.ne	0x9ce08 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x11f4>
   9ce1c:      	b	0x9cec4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12b0>
   9ce20:      	b	0x9cec4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12b0>
   9ce24:      	mov	x19, x0
   9ce28:      	add	x0, sp, #0xa60
   9ce2c:      	str	x20, [sp, #0xa70]
   9ce30:      	bl	0x9b930 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>
   9ce34:      	mov	x0, x19
   9ce38:      	bl	0xfbd80 <_Unwind_Resume>
   9ce3c:      	add	x9, sp, #0x1, lsl #12   // =0x1000
   9ce40:      	mov	x8, xzr
   9ce44:      	add	x9, x9, #0x860
   9ce48:      	mov	x10, x8
   9ce4c:      	add	x8, x8, #0x2
   9ce50:      	cmp	x8, #0x200
   9ce54:      	strh	wzr, [x9, x10]
   9ce58:      	b.ne	0x9ce48 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1234>
   9ce5c:      	add	x9, sp, #0x1, lsl #12   // =0x1000
   9ce60:      	mov	x8, xzr
   9ce64:      	add	x9, x9, #0x660
   9ce68:      	mov	x10, x8
   9ce6c:      	add	x8, x8, #0x2
   9ce70:      	cmp	x8, #0x200
   9ce74:      	strh	wzr, [x9, x10]
   9ce78:      	b.ne	0x9ce68 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1254>
   9ce7c:      	b	0x9ce80 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x126c>
   9ce80:      	add	x9, sp, #0x1, lsl #12   // =0x1000
   9ce84:      	mov	x8, xzr
   9ce88:      	add	x9, x9, #0x460
   9ce8c:      	mov	x10, x8
   9ce90:      	add	x8, x8, #0x2
   9ce94:      	cmp	x8, #0x200
   9ce98:      	strh	wzr, [x9, x10]
   9ce9c:      	b.ne	0x9ce8c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1278>
   9cea0:      	b	0x9cec4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12b0>
   9cea4:      	b	0x9cec4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12b0>
   9cea8:      	mov	x8, xzr
   9ceac:      	add	x9, sp, #0xa60
   9ceb0:      	mov	x10, x8
   9ceb4:      	add	x8, x8, #0x2
   9ceb8:      	cmp	x8, #0x200
   9cebc:      	strh	wzr, [x9, x10]
   9cec0:      	b.ne	0x9ceb0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x129c>
   9cec4:      	mov	x8, xzr
   9cec8:      	add	x9, sp, #0x60
   9cecc:      	mov	x10, x8
   9ced0:      	add	x8, x8, #0x2
   9ced4:      	cmp	x8, #0x200
   9ced8:      	strh	wzr, [x9, x10]
   9cedc:      	b.ne	0x9cecc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12b8>
   9cee0:      	add	x9, sp, #0x60
   9cee4:      	mov	x8, xzr
   9cee8:      	add	x9, x9, #0x200
   9ceec:      	mov	x10, x8
   9cef0:      	add	x8, x8, #0x2
   9cef4:      	cmp	x8, #0x200
   9cef8:      	strh	wzr, [x9, x10]
   9cefc:      	b.ne	0x9ceec <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12d8>
   9cf00:      	add	x9, sp, #0x60
   9cf04:      	mov	x8, xzr
   9cf08:      	add	x9, x9, #0x400
   9cf0c:      	mov	x10, x8
   9cf10:      	add	x8, x8, #0x2
   9cf14:      	cmp	x8, #0x200
   9cf18:      	strh	wzr, [x9, x10]
   9cf1c:      	b.ne	0x9cf0c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12f8>
   9cf20:      	bl	0xfbd80 <_Unwind_Resume>

000000000009cf24 <<toyos_crypto::mlkem::Poly>::ntt>:
   9cf24:      	sub	sp, sp, #0x70
   9cf28:      	stp	x29, x30, [sp, #0x10]
   9cf2c:      	stp	x28, x27, [sp, #0x20]
   9cf30:      	stp	x26, x25, [sp, #0x30]
   9cf34:      	stp	x24, x23, [sp, #0x40]
   9cf38:      	stp	x22, x21, [sp, #0x50]
   9cf3c:      	stp	x20, x19, [sp, #0x60]
   9cf40:      	add	x29, sp, #0x10
   9cf44:      	mov	w9, #0x7681             // =30337
   9cf48:      	mov	w11, #0xafb8            // =44984
   9cf4c:      	mov	w10, #0xd01             // =3329
   9cf50:      	movk	w9, #0x3afb, lsl #16
   9cf54:      	movk	w11, #0x13, lsl #16
   9cf58:      	dup	v1.4s, w10
   9cf5c:      	dup	v0.4s, w9
   9cf60:      	dup	v2.4s, w11
   9cf64:      	mov	w16, #0xbb41            // =47937
   9cf68:      	mov	x19, x0
   9cf6c:      	mov	w12, #0x80              // =128
   9cf70:      	mov	w14, #0x1               // =1
   9cf74:      	mov	w13, #0x100             // =256
   9cf78:      	mov	w15, #0x8               // =8
   9cf7c:      	movk	w16, #0x9d7d, lsl #16
   9cf80:      	str	x8, [sp, #0x8]
   9cf84:      	b	0x9cf9c <<toyos_crypto::mlkem::Poly>::ntt+0x78>
   9cf88:      	mov	x14, x8
   9cf8c:      	lsr	x8, x12, #1
   9cf90:      	cmp	x12, #0x3
   9cf94:      	mov	x12, x8
   9cf98:      	b.ls	0x9d24c <<toyos_crypto::mlkem::Poly>::ntt+0x328>
   9cf9c:      	lsl	x17, x12, #1
   9cfa0:      	rbit	x18, x17
   9cfa4:      	sub	w0, w17, #0x1
   9cfa8:      	ubfx	x0, x0, #8, #1
   9cfac:      	clz	x18, x18
   9cfb0:      	lsr	x18, x13, x18
   9cfb4:      	adds	x18, x0, x18
   9cfb8:      	b.eq	0x9cf8c <<toyos_crypto::mlkem::Poly>::ntt+0x68>
   9cfbc:      	lsl	x4, x12, #2
   9cfc0:      	add	x5, x19, x17
   9cfc4:      	neg	x6, x12, lsl #1
   9cfc8:      	mov	x1, xzr
   9cfcc:      	mov	x2, xzr
   9cfd0:      	add	x8, x18, x14
   9cfd4:      	sub	x7, x12, #0x1
   9cfd8:      	add	x20, x5, #0x2
   9cfdc:      	neg	x21, x12
   9cfe0:      	mov	x22, x19
   9cfe4:      	mov	x23, x12
   9cfe8:      	neg	x0, x12
   9cfec:      	cmp	x23, #0x100
   9cff0:      	rbit	w26, w14
   9cff4:      	madd	x0, x6, x1, x0
   9cff8:      	csel	x24, x23, x13, hi
   9cffc:      	add	x25, x24, x21
   9d000:      	cmp	x25, x7
   9d004:      	csel	x25, x25, x7, lo
   9d008:      	add	x24, x24, x0
   9d00c:      	lsr	w0, w26, #25
   9d010:      	cmp	x24, x7
   9d014:      	csel	x26, x24, x7, lo
   9d018:      	cmp	x24, x7
   9d01c:      	csel	x27, x24, x7, lo
   9d020:      	mov	w24, #0x1               // =1
   9d024:      	cbz	w0, 0x9d06c <<toyos_crypto::mlkem::Poly>::ntt+0x148>
   9d028:      	mov	w28, #0x11              // =17
   9d02c:      	b	0x9d048 <<toyos_crypto::mlkem::Poly>::ntt+0x124>
   9d030:      	mul	w3, w28, w28
   9d034:      	lsr	w0, w0, #1
   9d038:      	umull	x28, w3, w16
   9d03c:      	lsr	x28, x28, #43
   9d040:      	msub	w28, w28, w10, w3
   9d044:      	cbz	w0, 0x9d06c <<toyos_crypto::mlkem::Poly>::ntt+0x148>
   9d048:      	tbz	w0, #0x0, 0x9d030 <<toyos_crypto::mlkem::Poly>::ntt+0x10c>
   9d04c:      	mul	w24, w24, w28
   9d050:      	umull	x30, w24, w9
   9d054:      	lsr	x30, x30, #32
   9d058:      	sub	w3, w24, w30
   9d05c:      	add	w3, w30, w3, lsr #1
   9d060:      	lsr	w3, w3, #11
   9d064:      	msub	w24, w3, w10, w24
   9d068:      	b	0x9d030 <<toyos_crypto::mlkem::Poly>::ntt+0x10c>
   9d06c:      	adds	x14, x14, #0x1
   9d070:      	b.hs	0x9d28c <<toyos_crypto::mlkem::Poly>::ntt+0x368>
   9d074:      	cmp	x26, #0x7
   9d078:      	mov	x0, x2
   9d07c:      	b.ls	0x9d1b8 <<toyos_crypto::mlkem::Poly>::ntt+0x294>
   9d080:      	mul	x0, x4, x1
   9d084:      	lsl	x27, x27, #1
   9d088:      	add	x28, x19, x0
   9d08c:      	add	x30, x5, x0
   9d090:      	add	x3, x28, x27
   9d094:      	add	x3, x3, #0x2
   9d098:      	cmp	x30, x3
   9d09c:      	b.hs	0x9d0b4 <<toyos_crypto::mlkem::Poly>::ntt+0x190>
   9d0a0:      	add	x0, x20, x0
   9d0a4:      	add	x0, x0, x27
   9d0a8:      	cmp	x28, x0
   9d0ac:      	mov	x0, x2
   9d0b0:      	b.lo	0x9d1b8 <<toyos_crypto::mlkem::Poly>::ntt+0x294>
   9d0b4:      	add	x0, x26, #0x1
   9d0b8:      	fmov	s3, w24
   9d0bc:      	mov	x26, x22
   9d0c0:      	ands	x3, x0, #0x7
   9d0c4:      	csel	x3, x15, x3, eq
   9d0c8:      	sub	x0, x0, x3
   9d0cc:      	sub	x3, x25, x3
   9d0d0:      	add	x0, x2, x0
   9d0d4:      	add	x25, x3, #0x1
   9d0d8:      	ldr	q4, [x26, x17]
   9d0dc:      	subs	x25, x25, #0x8
   9d0e0:      	ushll2	v5.4s, v4.8h, #0x0
   9d0e4:      	ushll	v4.4s, v4.4h, #0x0
   9d0e8:      	mul	v5.4s, v5.4s, v3.s[0]
   9d0ec:      	mul	v4.4s, v4.4s, v3.s[0]
   9d0f0:      	umull2	v6.2d, v5.4s, v0.4s
   9d0f4:      	umull	v7.2d, v5.2s, v0.2s
   9d0f8:      	umull2	v16.2d, v4.4s, v0.4s
   9d0fc:      	umull	v17.2d, v4.2s, v0.2s
   9d100:      	uzp2	v6.4s, v7.4s, v6.4s
   9d104:      	uzp2	v7.4s, v17.4s, v16.4s
   9d108:      	sub	v16.4s, v5.4s, v6.4s
   9d10c:      	sub	v17.4s, v4.4s, v7.4s
   9d110:      	usra	v6.4s, v16.4s, #0x1
   9d114:      	ldr	q16, [x26]
   9d118:      	usra	v7.4s, v17.4s, #0x1
   9d11c:      	ushr	v6.4s, v6.4s, #0xb
   9d120:      	ushr	v7.4s, v7.4s, #0xb
   9d124:      	mls	v5.4s, v6.4s, v1.4s
   9d128:      	ushll2	v6.4s, v16.8h, #0x0
   9d12c:      	mls	v4.4s, v7.4s, v1.4s
   9d130:      	ushll	v7.4s, v16.4h, #0x0
   9d134:      	sub	v6.4s, v6.4s, v5.4s
   9d138:      	uaddw2	v5.4s, v5.4s, v16.8h
   9d13c:      	sub	v7.4s, v7.4s, v4.4s
   9d140:      	uaddw	v4.4s, v4.4s, v16.4h
   9d144:      	add	v6.4s, v6.4s, v1.4s
   9d148:      	umull2	v16.2d, v5.4s, v2.4s
   9d14c:      	add	v7.4s, v7.4s, v1.4s
   9d150:      	umull2	v22.2d, v4.4s, v2.4s
   9d154:      	umull	v23.2d, v4.2s, v2.2s
   9d158:      	umull2	v17.2d, v6.4s, v0.4s
   9d15c:      	umull	v18.2d, v6.2s, v0.2s
   9d160:      	umull2	v19.2d, v7.4s, v0.4s
   9d164:      	umull	v20.2d, v7.2s, v0.2s
   9d168:      	uzp2	v17.4s, v18.4s, v17.4s
   9d16c:      	uzp2	v18.4s, v20.4s, v19.4s
   9d170:      	umull	v19.2d, v5.2s, v2.2s
   9d174:      	sub	v20.4s, v6.4s, v17.4s
   9d178:      	sub	v21.4s, v7.4s, v18.4s
   9d17c:      	uzp2	v16.4s, v19.4s, v16.4s
   9d180:      	uzp2	v19.4s, v23.4s, v22.4s
   9d184:      	usra	v17.4s, v20.4s, #0x1
   9d188:      	usra	v18.4s, v21.4s, #0x1
   9d18c:      	mls	v5.4s, v16.4s, v1.4s
   9d190:      	mls	v4.4s, v19.4s, v1.4s
   9d194:      	ushr	v17.4s, v17.4s, #0xb
   9d198:      	ushr	v18.4s, v18.4s, #0xb
   9d19c:      	mls	v6.4s, v17.4s, v1.4s
   9d1a0:      	uzp1	v4.8h, v4.8h, v5.8h
   9d1a4:      	mls	v7.4s, v18.4s, v1.4s
   9d1a8:      	uzp1	v5.8h, v7.8h, v6.8h
   9d1ac:      	str	q5, [x26, x17]
   9d1b0:      	str	q4, [x26], #0x10
   9d1b4:      	b.ne	0x9d0d8 <<toyos_crypto::mlkem::Poly>::ntt+0x1b4>
   9d1b8:      	lsl	x25, x0, #1
   9d1bc:      	add	x2, x2, x17
   9d1c0:      	sub	x18, x18, #0x1
   9d1c4:      	sub	x26, x23, x0
   9d1c8:      	add	x0, x12, x0
   9d1cc:      	cmp	x0, #0x100
   9d1d0:      	b.hs	0x9d278 <<toyos_crypto::mlkem::Poly>::ntt+0x354>
   9d1d4:      	ldrh	w3, [x19, x0, lsl #1]
   9d1d8:      	subs	x26, x26, #0x1
   9d1dc:      	mul	w3, w24, w3
   9d1e0:      	umull	x27, w3, w9
   9d1e4:      	lsr	x27, x27, #32
   9d1e8:      	sub	w28, w3, w27
   9d1ec:      	add	w27, w27, w28, lsr #1
   9d1f0:      	lsr	w27, w27, #11
   9d1f4:      	msub	w3, w27, w10, w3
   9d1f8:      	ldrh	w27, [x19, x25]
   9d1fc:      	sub	w28, w27, w3
   9d200:      	add	w3, w3, w27
   9d204:      	add	w28, w28, #0xd01
   9d208:      	umull	x30, w3, w11
   9d20c:      	umull	x27, w28, w11
   9d210:      	lsr	x30, x30, #32
   9d214:      	lsr	x27, x27, #32
   9d218:      	msub	w3, w30, w10, w3
   9d21c:      	msub	w27, w27, w10, w28
   9d220:      	strh	w27, [x19, x0, lsl #1]
   9d224:      	add	x0, x0, #0x1
   9d228:      	strh	w3, [x19, x25]
   9d22c:      	add	x25, x25, #0x2
   9d230:      	b.ne	0x9d1cc <<toyos_crypto::mlkem::Poly>::ntt+0x2a8>
   9d234:      	add	x23, x23, x17
   9d238:      	add	x1, x1, #0x1
   9d23c:      	sub	x21, x21, x17
   9d240:      	add	x22, x22, x4
   9d244:      	cbnz	x18, 0x9cfe8 <<toyos_crypto::mlkem::Poly>::ntt+0xc4>
   9d248:      	b	0x9cf88 <<toyos_crypto::mlkem::Poly>::ntt+0x64>
   9d24c:      	ldr	x0, [sp, #0x8]
   9d250:      	mov	x1, x19
   9d254:      	mov	w2, #0x200              // =512
   9d258:      	ldp	x20, x19, [sp, #0x60]
   9d25c:      	ldp	x22, x21, [sp, #0x50]
   9d260:      	ldp	x24, x23, [sp, #0x40]
   9d264:      	ldp	x26, x25, [sp, #0x30]
   9d268:      	ldp	x28, x27, [sp, #0x20]
   9d26c:      	ldp	x29, x30, [sp, #0x10]
   9d270:      	add	sp, sp, #0x70
   9d274:      	b	0x1065e8 <memcpy>
   9d278:      	nop
   9d27c:      	adr	x2, 0x1191c0 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x1c0>
   9d280:      	mov	w1, #0x100              // =256
   9d284:      	bl	0x1012f8 <core::panicking::panic_bounds_check>
   9d288:      	b	0x9d298 <<toyos_crypto::mlkem::Poly>::ntt+0x374>
   9d28c:      	nop
   9d290:      	adr	x0, 0x1191a8 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x1a8>
   9d294:      	bl	0x1022d4 <core::panicking::panic_const::panic_const_add_overflow>
   9d298:      	brk	#0x1
   9d29c:      	mov	x8, xzr
   9d2a0:      	mov	x9, x8
   9d2a4:      	add	x8, x8, #0x2
   9d2a8:      	cmp	x8, #0x200
   9d2ac:      	strh	wzr, [x19, x9]
   9d2b0:      	b.ne	0x9d2a0 <<toyos_crypto::mlkem::Poly>::ntt+0x37c>
   9d2b4:      	bl	0xfbd80 <_Unwind_Resume>

000000000009d2b8 <<toyos_crypto::mlkem::Poly>::encode>:
   9d2b8:      	sub	sp, sp, #0x40
   9d2bc:      	stp	x29, x30, [sp, #0x10]
   9d2c0:      	stp	x22, x21, [sp, #0x20]
   9d2c4:      	stp	x20, x19, [sp, #0x30]
   9d2c8:      	add	x29, sp, #0x10
   9d2cc:      	lsr	x8, x1, #59
   9d2d0:      	str	x3, [sp]
   9d2d4:      	cbnz	x8, 0x9d3f0 <<toyos_crypto::mlkem::Poly>::encode+0x138>
   9d2d8:      	lsl	x8, x1, #5
   9d2dc:      	mov	x19, x3
   9d2e0:      	mov	x21, x1
   9d2e4:      	cmp	x3, x8
   9d2e8:      	str	x8, [sp, #0x8]
   9d2ec:      	b.ne	0x9d3c8 <<toyos_crypto::mlkem::Poly>::encode+0x110>
   9d2f0:      	mov	x20, x2
   9d2f4:      	mov	x22, x0
   9d2f8:      	mov	x0, x2
   9d2fc:      	mov	x1, x19
   9d300:      	mov	w2, wzr
   9d304:      	bl	0x1034b8 <<[i8] as core::slice::specialize::SpecFill<i8>>::spec_fill>
   9d308:      	mov	x8, xzr
   9d30c:      	mov	x9, xzr
   9d310:      	b	0x9d324 <<toyos_crypto::mlkem::Poly>::encode+0x6c>
   9d314:      	add	x9, x9, #0x1
   9d318:      	add	x8, x8, x21
   9d31c:      	cmp	x9, #0x100
   9d320:      	b.eq	0x9d38c <<toyos_crypto::mlkem::Poly>::encode+0xd4>
   9d324:      	cbz	x21, 0x9d314 <<toyos_crypto::mlkem::Poly>::encode+0x5c>
   9d328:      	umulh	x10, x9, x21
   9d32c:      	cmp	xzr, x10
   9d330:      	b.ne	0x9d3e4 <<toyos_crypto::mlkem::Poly>::encode+0x12c>
   9d334:      	mul	x10, x9, x21
   9d338:      	mov	x11, xzr
   9d33c:      	add	x12, x8, x11
   9d340:      	cmp	x12, x10
   9d344:      	b.lo	0x9d3ac <<toyos_crypto::mlkem::Poly>::encode+0xf4>
   9d348:      	cmp	x11, #0x10
   9d34c:      	b.eq	0x9d3a0 <<toyos_crypto::mlkem::Poly>::encode+0xe8>
   9d350:      	lsr	x0, x12, #3
   9d354:      	cmp	x0, x19
   9d358:      	b.hs	0x9d3b8 <<toyos_crypto::mlkem::Poly>::encode+0x100>
   9d35c:      	ldrh	w13, [x22, x9, lsl #1]
   9d360:      	and	x12, x12, #0x7
   9d364:      	lsr	w13, w13, w11
   9d368:      	add	x11, x11, #0x1
   9d36c:      	cmp	x21, x11
   9d370:      	and	w13, w13, #0x1
   9d374:      	lsl	w12, w13, w12
   9d378:      	ldrb	w13, [x20, x0]
   9d37c:      	orr	w12, w12, w13
   9d380:      	strb	w12, [x20, x0]
   9d384:      	b.ne	0x9d33c <<toyos_crypto::mlkem::Poly>::encode+0x84>
   9d388:      	b	0x9d314 <<toyos_crypto::mlkem::Poly>::encode+0x5c>
   9d38c:      	ldp	x20, x19, [sp, #0x30]
   9d390:      	ldp	x22, x21, [sp, #0x20]
   9d394:      	ldp	x29, x30, [sp, #0x10]
   9d398:      	add	sp, sp, #0x40
   9d39c:      	ret
   9d3a0:      	nop
   9d3a4:      	adr	x0, 0x119220 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x220>
   9d3a8:      	bl	0x102328 <core::panicking::panic_const::panic_const_shr_overflow>
   9d3ac:      	nop
   9d3b0:      	adr	x0, 0x119208 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x208>
   9d3b4:      	bl	0x1022d4 <core::panicking::panic_const::panic_const_add_overflow>
   9d3b8:      	nop
   9d3bc:      	adr	x2, 0x119238 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x238>
   9d3c0:      	mov	x1, x19
   9d3c4:      	bl	0x1012f8 <core::panicking::panic_bounds_check>
   9d3c8:      	nop
   9d3cc:      	adr	x5, 0x1191f0 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x1f0>
   9d3d0:      	mov	x1, sp
   9d3d4:      	add	x2, sp, #0x8
   9d3d8:      	mov	w0, wzr
   9d3dc:      	mov	x3, xzr
   9d3e0:      	bl	0xfe124 <core::panicking::assert_failed::<usize, usize>>
   9d3e4:      	nop
   9d3e8:      	adr	x0, 0x119208 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x208>
   9d3ec:      	bl	0x1022f0 <core::panicking::panic_const::panic_const_mul_overflow>
   9d3f0:      	nop
   9d3f4:      	adr	x0, 0x1191d8 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x1d8>
   9d3f8:      	bl	0x1022f0 <core::panicking::panic_const::panic_const_mul_overflow>

000000000009d3fc <<toyos_crypto::mlkem::Poly>::inverse>:
   9d3fc:      	stp	x29, x30, [sp, #-0x40]!
   9d400:      	str	x23, [sp, #0x10]
   9d404:      	stp	x22, x21, [sp, #0x20]
   9d408:      	stp	x20, x19, [sp, #0x30]
   9d40c:      	mov	x29, sp
   9d410:      	mov	w13, #0xafb8            // =44984
   9d414:      	mov	w15, #0x7681            // =30337
   9d418:      	mov	w16, #0xbb41            // =47937
   9d41c:      	mov	x19, x0
   9d420:      	mov	w9, #0x2                // =2
   9d424:      	mov	w11, #0x7f              // =127
   9d428:      	mov	w12, #0x100             // =256
   9d42c:      	nop
   9d430:      	adr	x2, 0x119268 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x268>
   9d434:      	nop
   9d438:      	adr	x10, 0x119280 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x280>
   9d43c:      	movk	w13, #0x13, lsl #16
   9d440:      	mov	w14, #0xd01             // =3329
   9d444:      	movk	w15, #0x3afb, lsl #16
   9d448:      	movk	w16, #0x9d7d, lsl #16
   9d44c:      	b	0x9d460 <<toyos_crypto::mlkem::Poly>::inverse+0x64>
   9d450:      	mov	x11, x1
   9d454:      	cmp	x9, #0x41
   9d458:      	mov	x9, x17
   9d45c:      	b.hs	0x9d580 <<toyos_crypto::mlkem::Poly>::inverse+0x184>
   9d460:      	lsl	x17, x9, #1
   9d464:      	rbit	w18, w17
   9d468:      	sub	w0, w17, #0x1
   9d46c:      	ubfx	x0, x0, #8, #1
   9d470:      	clz	w18, w18
   9d474:      	lsr	w18, w12, w18
   9d478:      	adds	x18, x0, x18
   9d47c:      	b.eq	0x9d454 <<toyos_crypto::mlkem::Poly>::inverse+0x58>
   9d480:      	mov	x0, xzr
   9d484:      	sub	x1, x11, x18
   9d488:      	mov	x3, x9
   9d48c:      	rbit	w4, w11
   9d490:      	lsr	w5, w4, #25
   9d494:      	cbz	w5, 0x9d4e0 <<toyos_crypto::mlkem::Poly>::inverse+0xe4>
   9d498:      	mov	w4, #0x1                // =1
   9d49c:      	mov	w6, #0x11               // =17
   9d4a0:      	b	0x9d4bc <<toyos_crypto::mlkem::Poly>::inverse+0xc0>
   9d4a4:      	mul	w6, w6, w6
   9d4a8:      	lsr	w5, w5, #1
   9d4ac:      	umull	x7, w6, w16
   9d4b0:      	lsr	x7, x7, #43
   9d4b4:      	msub	w6, w7, w14, w6
   9d4b8:      	cbz	w5, 0x9d4e4 <<toyos_crypto::mlkem::Poly>::inverse+0xe8>
   9d4bc:      	tbz	w5, #0x0, 0x9d4a4 <<toyos_crypto::mlkem::Poly>::inverse+0xa8>
   9d4c0:      	mul	w4, w4, w6
   9d4c4:      	umull	x7, w4, w15
   9d4c8:      	lsr	x7, x7, #32
   9d4cc:      	sub	w20, w4, w7
   9d4d0:      	add	w7, w7, w20, lsr #1
   9d4d4:      	lsr	w7, w7, #11
   9d4d8:      	msub	w4, w7, w14, w4
   9d4dc:      	b	0x9d4a4 <<toyos_crypto::mlkem::Poly>::inverse+0xa8>
   9d4e0:      	mov	w4, #0x1                // =1
   9d4e4:      	cbz	x11, 0x9d62c <<toyos_crypto::mlkem::Poly>::inverse+0x230>
   9d4e8:      	add	x5, x0, x17
   9d4ec:      	sub	x18, x18, #0x1
   9d4f0:      	sub	x11, x11, #0x1
   9d4f4:      	mov	x7, x9
   9d4f8:      	mov	x6, x3
   9d4fc:      	cmp	x0, #0xff
   9d500:      	b.hi	0x9d620 <<toyos_crypto::mlkem::Poly>::inverse+0x224>
   9d504:      	cmp	x6, #0x100
   9d508:      	b.hs	0x9d618 <<toyos_crypto::mlkem::Poly>::inverse+0x21c>
   9d50c:      	ldrh	w20, [x19, x0, lsl #1]
   9d510:      	ldrh	w21, [x19, x6, lsl #1]
   9d514:      	add	w22, w21, w20
   9d518:      	add	w21, w21, #0xd01
   9d51c:      	umull	x23, w22, w13
   9d520:      	subs	w20, w21, w20
   9d524:      	lsr	x23, x23, #32
   9d528:      	msub	w22, w23, w14, w22
   9d52c:      	strh	w22, [x19, x0, lsl #1]
   9d530:      	b.lo	0x9d608 <<toyos_crypto::mlkem::Poly>::inverse+0x20c>
   9d534:      	umull	x21, w20, w13
   9d538:      	subs	x7, x7, #0x1
   9d53c:      	add	x0, x0, #0x1
   9d540:      	lsr	x21, x21, #32
   9d544:      	msub	w20, w21, w14, w20
   9d548:      	mul	w20, w20, w4
   9d54c:      	umull	x21, w20, w15
   9d550:      	lsr	x21, x21, #32
   9d554:      	sub	w22, w20, w21
   9d558:      	add	w21, w21, w22, lsr #1
   9d55c:      	lsr	w21, w21, #11
   9d560:      	msub	w20, w21, w14, w20
   9d564:      	strh	w20, [x19, x6, lsl #1]
   9d568:      	add	x6, x6, #0x1
   9d56c:      	b.ne	0x9d4fc <<toyos_crypto::mlkem::Poly>::inverse+0x100>
   9d570:      	add	x3, x3, x17
   9d574:      	mov	x0, x5
   9d578:      	cbnz	x18, 0x9d48c <<toyos_crypto::mlkem::Poly>::inverse+0x90>
   9d57c:      	b	0x9d450 <<toyos_crypto::mlkem::Poly>::inverse+0x54>
   9d580:      	mov	w10, #0xb769            // =46953
   9d584:      	mov	w9, #0xce7              // =3303
   9d588:      	mov	w11, #0xd01             // =3329
   9d58c:      	movk	w10, #0x13af, lsl #16
   9d590:      	dup	v0.8h, w9
   9d594:      	dup	v2.4s, w11
   9d598:      	dup	v1.4s, w10
   9d59c:      	mov	x9, xzr
   9d5a0:      	ldr	q3, [x19, x9]
   9d5a4:      	umull2	v4.4s, v3.8h, v0.8h
   9d5a8:      	umull	v3.4s, v3.4h, v0.4h
   9d5ac:      	umull2	v5.2d, v4.4s, v1.4s
   9d5b0:      	umull	v6.2d, v4.2s, v1.2s
   9d5b4:      	umull2	v7.2d, v3.4s, v1.4s
   9d5b8:      	umull	v16.2d, v3.2s, v1.2s
   9d5bc:      	uzp2	v5.4s, v6.4s, v5.4s
   9d5c0:      	uzp2	v6.4s, v16.4s, v7.4s
   9d5c4:      	ushr	v5.4s, v5.4s, #0x8
   9d5c8:      	ushr	v6.4s, v6.4s, #0x8
   9d5cc:      	mls	v4.4s, v5.4s, v2.4s
   9d5d0:      	mls	v3.4s, v6.4s, v2.4s
   9d5d4:      	uzp1	v3.8h, v3.8h, v4.8h
   9d5d8:      	str	q3, [x19, x9]
   9d5dc:      	add	x9, x9, #0x10
   9d5e0:      	cmp	x9, #0x200
   9d5e4:      	b.ne	0x9d5a0 <<toyos_crypto::mlkem::Poly>::inverse+0x1a4>
   9d5e8:      	mov	x0, x8
   9d5ec:      	mov	x1, x19
   9d5f0:      	mov	w2, #0x200              // =512
   9d5f4:      	ldp	x20, x19, [sp, #0x30]
   9d5f8:      	ldr	x23, [sp, #0x10]
   9d5fc:      	ldp	x22, x21, [sp, #0x20]
   9d600:      	ldp	x29, x30, [sp], #0x40
   9d604:      	b	0x1065e8 <memcpy>
   9d608:      	nop
   9d60c:      	adr	x0, 0x119298 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x298>
   9d610:      	bl	0x102344 <core::panicking::panic_const::panic_const_sub_overflow>
   9d614:      	b	0x9d638 <<toyos_crypto::mlkem::Poly>::inverse+0x23c>
   9d618:      	mov	x0, x6
   9d61c:      	mov	x2, x10
   9d620:      	mov	w1, #0x100              // =256
   9d624:      	bl	0x1012f8 <core::panicking::panic_bounds_check>
   9d628:      	b	0x9d638 <<toyos_crypto::mlkem::Poly>::inverse+0x23c>
   9d62c:      	nop
   9d630:      	adr	x0, 0x119250 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x250>
   9d634:      	bl	0x102344 <core::panicking::panic_const::panic_const_sub_overflow>
   9d638:      	brk	#0x1
   9d63c:      	mov	x8, xzr
   9d640:      	mov	x9, x8
   9d644:      	add	x8, x8, #0x2
   9d648:      	cmp	x8, #0x200
   9d64c:      	strh	wzr, [x19, x9]
   9d650:      	b.ne	0x9d640 <<toyos_crypto::mlkem::Poly>::inverse+0x244>
   9d654:      	bl	0xfbd80 <_Unwind_Resume>

000000000009d658 <toyos_crypto::mlkem::noise>:
   9d658:      	stp	x29, x30, [sp, #-0x40]!
   9d65c:      	str	x28, [sp, #0x10]
   9d660:      	stp	x22, x21, [sp, #0x20]
   9d664:      	stp	x20, x19, [sp, #0x30]
   9d668:      	mov	x29, sp
   9d66c:      	sub	sp, sp, #0x2a0
   9d670:      	movi	v0.2d, #0000000000000000
   9d674:      	mov	x19, x8
   9d678:      	mov	w8, #0x20               // =32
   9d67c:      	stp	x0, x8, [sp, #0x80]
   9d680:      	add	x8, x29, #0x1c
   9d684:      	mov	w9, #0x1                // =1
   9d688:      	strb	w1, [x29, #0x1c]
   9d68c:      	stp	x8, x9, [sp, #0x90]
   9d690:      	stp	q0, q0, [sp]
   9d694:      	stp	q0, q0, [sp, #0x20]
   9d698:      	stp	q0, q0, [sp, #0x40]
   9d69c:      	stp	q0, q0, [sp, #0x60]
   9d6a0:      	add	x8, sp, #0xa0
   9d6a4:      	add	x2, sp, #0x80
   9d6a8:      	mov	w0, #0x88               // =136
   9d6ac:      	mov	w1, #0x1f               // =31
   9d6b0:      	mov	w3, #0x2                // =2
   9d6b4:      	add	x20, sp, #0xa0
   9d6b8:      	bl	0x9f514 <<toyos_crypto::keccak::Sponge>::new>
   9d6bc:      	ldr	x8, [sp, #0x170]
   9d6c0:      	mov	x22, xzr
   9d6c4:      	mov	x21, sp
   9d6c8:      	b	0x9d700 <toyos_crypto::mlkem::noise+0xa8>
   9d6cc:      	lsr	x0, x8, #3
   9d6d0:      	cmp	x8, #0xc8
   9d6d4:      	b.hs	0x9d8f8 <toyos_crypto::mlkem::noise+0x2a0>
   9d6d8:      	ldr	x9, [x20, x0, lsl #3]
   9d6dc:      	ubfiz	x10, x8, #3, #3
   9d6e0:      	add	x11, x22, #0x1
   9d6e4:      	add	x8, x8, #0x1
   9d6e8:      	cmp	x11, #0x80
   9d6ec:      	lsr	x9, x9, x10
   9d6f0:      	str	x8, [sp, #0x170]
   9d6f4:      	strb	w9, [x21, x22]
   9d6f8:      	mov	x22, x11
   9d6fc:      	b.eq	0x9d724 <toyos_crypto::mlkem::noise+0xcc>
   9d700:      	ldr	x9, [sp, #0x168]
   9d704:      	cmp	x8, x9
   9d708:      	b.ne	0x9d6cc <toyos_crypto::mlkem::noise+0x74>
   9d70c:      	add	x0, sp, #0xa0
   9d710:      	bl	0x9f758 <<toyos_crypto::keccak::Sponge>::permute (.llvm.17604454750795214172)>
   9d714:      	mov	x0, xzr
   9d718:      	mov	x8, xzr
   9d71c:      	str	xzr, [sp, #0x170]
   9d720:      	b	0x9d6d8 <toyos_crypto::mlkem::noise+0x80>
   9d724:      	movi	v5.2d, #0000000000000000
   9d728:      	mov	w9, #0xd01              // =3329
   9d72c:      	movi	d0, #0x0000ff000000ff
   9d730:      	movi	v1.2s, #0x2
   9d734:      	movi	v2.2s, #0x4
   9d738:      	str	xzr, [sp, #0xa0]
   9d73c:      	dup	v3.2s, w9
   9d740:      	movi	v4.2s, #0x1, lsl #16
   9d744:      	adrp	x9, 0x16000 <anon.7bb8b5ff289d4207669f9c18202c7170.7.llvm.7684364067831485864+0x309>
   9d748:      	str	xzr, [sp, #0xa8]
   9d74c:      	mov	x8, xzr
   9d750:      	mov	x10, sp
   9d754:      	str	xzr, [sp, #0xb0]
   9d758:      	add	x11, sp, #0xa0
   9d75c:      	str	xzr, [sp, #0xb8]
   9d760:      	str	xzr, [sp, #0xc0]
   9d764:      	str	xzr, [sp, #0xc8]
   9d768:      	str	xzr, [sp, #0xd0]
   9d76c:      	str	xzr, [sp, #0xd8]
   9d770:      	str	xzr, [sp, #0xe0]
   9d774:      	str	xzr, [sp, #0xe8]
   9d778:      	str	xzr, [sp, #0xf0]
   9d77c:      	str	xzr, [sp, #0xf8]
   9d780:      	str	xzr, [sp, #0x100]
   9d784:      	str	xzr, [sp, #0x108]
   9d788:      	str	xzr, [sp, #0x110]
   9d78c:      	str	xzr, [sp, #0x118]
   9d790:      	str	xzr, [sp, #0x120]
   9d794:      	str	xzr, [sp, #0x128]
   9d798:      	str	xzr, [sp, #0x130]
   9d79c:      	str	xzr, [sp, #0x138]
   9d7a0:      	str	xzr, [sp, #0x140]
   9d7a4:      	str	xzr, [sp, #0x148]
   9d7a8:      	str	xzr, [sp, #0x150]
   9d7ac:      	str	xzr, [sp, #0x158]
   9d7b0:      	str	xzr, [sp, #0x160]
   9d7b4:      	stp	q5, q5, [sp, #0xa0]
   9d7b8:      	stp	q5, q5, [sp, #0xc0]
   9d7bc:      	stp	q5, q5, [sp, #0xe0]
   9d7c0:      	stp	q5, q5, [sp, #0x100]
   9d7c4:      	stp	q5, q5, [sp, #0x120]
   9d7c8:      	stp	q5, q5, [sp, #0x140]
   9d7cc:      	stp	q5, q5, [sp, #0x160]
   9d7d0:      	stp	q5, q5, [sp, #0x180]
   9d7d4:      	stp	q5, q5, [sp, #0x1a0]
   9d7d8:      	stp	q5, q5, [sp, #0x1c0]
   9d7dc:      	stp	q5, q5, [sp, #0x1e0]
   9d7e0:      	stp	q5, q5, [sp, #0x200]
   9d7e4:      	stp	q5, q5, [sp, #0x220]
   9d7e8:      	stp	q5, q5, [sp, #0x240]
   9d7ec:      	stp	q5, q5, [sp, #0x260]
   9d7f0:      	stp	q5, q5, [sp, #0x280]
   9d7f4:      	ldr	d5, [x9, #0x368]
   9d7f8:      	mov	w9, #0x100              // =256
   9d7fc:      	ldrb	w12, [x10, x8]
   9d800:      	shl	v6.2s, v5.2s, #0x2
   9d804:      	add	v5.2s, v5.2s, v1.2s
   9d808:      	subs	x9, x9, #0x2
   9d80c:      	dup	v7.2s, w12
   9d810:      	add	x12, x11, x8, lsl #2
   9d814:      	add	x8, x8, #0x1
   9d818:      	and	v6.8b, v6.8b, v2.8b
   9d81c:      	and	v7.8b, v7.8b, v0.8b
   9d820:      	neg	v6.2s, v6.2s
   9d824:      	ushl	v6.2s, v7.2s, v6.2s
   9d828:      	ushr	v7.2s, v6.2s, #0x1
   9d82c:      	ushr	v16.2s, v6.2s, #0x2
   9d830:      	ushr	v17.2s, v6.2s, #0x3
   9d834:      	bic	v6.2s, #0xfe
   9d838:      	bic	v7.2s, #0x7e
   9d83c:      	bic	v16.2s, #0x3e
   9d840:      	bic	v17.2s, #0x1e
   9d844:      	add	v6.2s, v7.2s, v6.2s
   9d848:      	add	v7.2s, v16.2s, v17.2s
   9d84c:      	sub	v6.2s, v6.2s, v7.2s
   9d850:      	add	v7.2s, v6.2s, v3.2s
   9d854:      	add	v6.2s, v6.2s, v4.2s
   9d858:      	cmhi	v16.2s, v3.2s, v7.2s
   9d85c:      	bit	v6.8b, v7.8b, v16.8b
   9d860:      	mov	s7, v6.s[1]
   9d864:      	str	h6, [x12]
   9d868:      	str	h7, [x12, #0x2]
   9d86c:      	b.ne	0x9d7fc <toyos_crypto::mlkem::noise+0x1a4>
   9d870:      	add	x1, sp, #0xa0
   9d874:      	mov	x0, x19
   9d878:      	mov	w2, #0x200              // =512
   9d87c:      	bl	0x1065e8 <memcpy>
   9d880:      	stp	xzr, xzr, [sp, #0xa0]
   9d884:      	ldr	q0, [sp, #0xa0]
   9d888:      	str	q0, [sp]
   9d88c:      	stp	xzr, xzr, [sp, #0xa0]
   9d890:      	ldr	q0, [sp, #0xa0]
   9d894:      	str	q0, [sp, #0x10]
   9d898:      	stp	xzr, xzr, [sp, #0xa0]
   9d89c:      	ldr	q0, [sp, #0xa0]
   9d8a0:      	str	q0, [sp, #0x20]
   9d8a4:      	stp	xzr, xzr, [sp, #0xa0]
   9d8a8:      	ldr	q0, [sp, #0xa0]
   9d8ac:      	str	q0, [sp, #0x30]
   9d8b0:      	stp	xzr, xzr, [sp, #0xa0]
   9d8b4:      	ldr	q0, [sp, #0xa0]
   9d8b8:      	str	q0, [sp, #0x40]
   9d8bc:      	stp	xzr, xzr, [sp, #0xa0]
   9d8c0:      	ldr	q0, [sp, #0xa0]
   9d8c4:      	str	q0, [sp, #0x50]
   9d8c8:      	stp	xzr, xzr, [sp, #0xa0]
   9d8cc:      	ldr	q0, [sp, #0xa0]
   9d8d0:      	str	q0, [sp, #0x60]
   9d8d4:      	stp	xzr, xzr, [sp, #0xa0]
   9d8d8:      	ldr	q0, [sp, #0xa0]
   9d8dc:      	str	q0, [sp, #0x70]
   9d8e0:      	add	sp, sp, #0x2a0
   9d8e4:      	ldp	x20, x19, [sp, #0x30]
   9d8e8:      	ldr	x28, [sp, #0x10]
   9d8ec:      	ldp	x22, x21, [sp, #0x20]
   9d8f0:      	ldp	x29, x30, [sp], #0x40
   9d8f4:      	ret
   9d8f8:      	nop
   9d8fc:      	adr	x2, 0x1193e8 <anon.d126a1c03a02b7f85a0a23db829417bf.8.llvm.17604454750795214172>
   9d900:      	mov	w1, #0x19               // =25
   9d904:      	bl	0x1012f8 <core::panicking::panic_bounds_check>
   9d908:      	brk	#0x1
   9d90c:      	mov	x19, x0
   9d910:      	b	0x9d924 <toyos_crypto::mlkem::noise+0x2cc>
   9d914:      	b	0x9d918 <toyos_crypto::mlkem::noise+0x2c0>
   9d918:      	mov	x19, x0
   9d91c:      	add	x0, sp, #0xa0
   9d920:      	bl	0xa0260 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   9d924:      	mov	x0, sp
   9d928:      	bl	0xa0050 <core::ptr::drop_glue::<toyos_crypto::secret::Secret<8, [u8; 16]>>>
   9d92c:      	mov	x0, x19
   9d930:      	bl	0xfbd80 <_Unwind_Resume>
   9d934:      	bl	0x1012e0 <core::panicking::panic_in_cleanup>

000000000009d938 <toyos_crypto::mlkem::sample>:
   9d938:      	stp	x29, x30, [sp, #-0x60]!
   9d93c:      	str	x28, [sp, #0x10]
   9d940:      	stp	x26, x25, [sp, #0x20]
   9d944:      	stp	x24, x23, [sp, #0x30]
   9d948:      	stp	x22, x21, [sp, #0x40]
   9d94c:      	stp	x20, x19, [sp, #0x50]
   9d950:      	mov	x29, sp
   9d954:      	sub	sp, sp, #0x2e0
   9d958:      	mov	x19, x8
   9d95c:      	mov	w8, #0x20               // =32
   9d960:      	mov	w9, #0x2                // =2
   9d964:      	stp	x0, x8, [sp, #0xe0]
   9d968:      	add	x8, x29, #0x1c
   9d96c:      	mov	w0, #0xa8               // =168
   9d970:      	strb	w2, [x29, #0x1c]
   9d974:      	add	x2, sp, #0xe0
   9d978:      	mov	w3, #0x2                // =2
   9d97c:      	strb	w1, [x29, #0x1d]
   9d980:      	mov	w1, #0x1f               // =31
   9d984:      	add	x20, sp, #0x8
   9d988:      	stp	x8, x9, [sp, #0xf0]
   9d98c:      	add	x8, sp, #0x8
   9d990:      	add	x21, sp, #0xe0
   9d994:      	bl	0x9f514 <<toyos_crypto::keccak::Sponge>::new>
   9d998:      	movi	v0.2d, #0000000000000000
   9d99c:      	ldr	x23, [sp, #0xd8]
   9d9a0:      	mov	x22, xzr
   9d9a4:      	stp	q0, q0, [sp, #0xe0]
   9d9a8:      	stp	q0, q0, [sp, #0x100]
   9d9ac:      	stp	q0, q0, [sp, #0x120]
   9d9b0:      	stp	q0, q0, [sp, #0x140]
   9d9b4:      	stp	q0, q0, [sp, #0x160]
   9d9b8:      	stp	q0, q0, [sp, #0x180]
   9d9bc:      	stp	q0, q0, [sp, #0x1a0]
   9d9c0:      	stp	q0, q0, [sp, #0x1c0]
   9d9c4:      	stp	q0, q0, [sp, #0x1e0]
   9d9c8:      	stp	q0, q0, [sp, #0x200]
   9d9cc:      	stp	q0, q0, [sp, #0x220]
   9d9d0:      	stp	q0, q0, [sp, #0x240]
   9d9d4:      	stp	q0, q0, [sp, #0x260]
   9d9d8:      	stp	q0, q0, [sp, #0x280]
   9d9dc:      	stp	q0, q0, [sp, #0x2a0]
   9d9e0:      	stp	q0, q0, [sp, #0x2c0]
   9d9e4:      	b	0x9d9f0 <toyos_crypto::mlkem::sample+0xb8>
   9d9e8:      	cmp	x22, #0x100
   9d9ec:      	b.hs	0x9daf8 <toyos_crypto::mlkem::sample+0x1c0>
   9d9f0:      	ldr	x8, [sp, #0xd0]
   9d9f4:      	cmp	x23, x8
   9d9f8:      	b.ne	0x9da18 <toyos_crypto::mlkem::sample+0xe0>
   9d9fc:      	add	x0, sp, #0x8
   9da00:      	bl	0x9f758 <<toyos_crypto::keccak::Sponge>::permute (.llvm.17604454750795214172)>
   9da04:      	ldr	x8, [sp, #0xd0]
   9da08:      	mov	x0, xzr
   9da0c:      	mov	x23, xzr
   9da10:      	str	xzr, [sp, #0xd8]
   9da14:      	b	0x9da24 <toyos_crypto::mlkem::sample+0xec>
   9da18:      	lsr	x0, x23, #3
   9da1c:      	cmp	x23, #0xc8
   9da20:      	b.hs	0x9db8c <toyos_crypto::mlkem::sample+0x254>
   9da24:      	add	x25, x23, #0x1
   9da28:      	ldr	x24, [x20, x0, lsl #3]
   9da2c:      	cmp	x25, x8
   9da30:      	str	x25, [sp, #0xd8]
   9da34:      	b.ne	0x9da54 <toyos_crypto::mlkem::sample+0x11c>
   9da38:      	add	x0, sp, #0x8
   9da3c:      	bl	0x9f758 <<toyos_crypto::keccak::Sponge>::permute (.llvm.17604454750795214172)>
   9da40:      	ldr	x8, [sp, #0xd0]
   9da44:      	mov	x0, xzr
   9da48:      	mov	x25, xzr
   9da4c:      	str	xzr, [sp, #0xd8]
   9da50:      	b	0x9da60 <toyos_crypto::mlkem::sample+0x128>
   9da54:      	lsr	x0, x25, #3
   9da58:      	cmp	x23, #0xc7
   9da5c:      	b.hs	0x9db8c <toyos_crypto::mlkem::sample+0x254>
   9da60:      	add	x9, x25, #0x1
   9da64:      	ldr	x26, [x20, x0, lsl #3]
   9da68:      	cmp	x9, x8
   9da6c:      	str	x9, [sp, #0xd8]
   9da70:      	b.ne	0x9da8c <toyos_crypto::mlkem::sample+0x154>
   9da74:      	add	x0, sp, #0x8
   9da78:      	bl	0x9f758 <<toyos_crypto::keccak::Sponge>::permute (.llvm.17604454750795214172)>
   9da7c:      	mov	x0, xzr
   9da80:      	mov	x9, xzr
   9da84:      	str	xzr, [sp, #0xd8]
   9da88:      	b	0x9da98 <toyos_crypto::mlkem::sample+0x160>
   9da8c:      	lsr	x0, x9, #3
   9da90:      	cmp	x25, #0xc7
   9da94:      	b.hs	0x9db8c <toyos_crypto::mlkem::sample+0x254>
   9da98:      	ubfiz	x8, x23, #3, #3
   9da9c:      	ubfiz	x10, x25, #3, #3
   9daa0:      	add	x23, x9, #0x1
   9daa4:      	lsr	x11, x24, x8
   9daa8:      	lsr	x8, x26, x10
   9daac:      	ldr	x10, [x20, x0, lsl #3]
   9dab0:      	str	x23, [sp, #0xd8]
   9dab4:      	and	w11, w11, #0xff
   9dab8:      	bfi	w11, w8, #8, #4
   9dabc:      	cmp	w11, #0xd01
   9dac0:      	b.hs	0x9dacc <toyos_crypto::mlkem::sample+0x194>
   9dac4:      	strh	w11, [x21, x22, lsl #1]
   9dac8:      	add	x22, x22, #0x1
   9dacc:      	ubfiz	x9, x9, #3, #3
   9dad0:      	ubfx	w8, w8, #4, #4
   9dad4:      	lsr	x9, x10, x9
   9dad8:      	bfi	w8, w9, #4, #8
   9dadc:      	cmp	w8, #0xd00
   9dae0:      	b.hi	0x9d9e8 <toyos_crypto::mlkem::sample+0xb0>
   9dae4:      	cmp	x22, #0xff
   9dae8:      	b.hi	0x9d9e8 <toyos_crypto::mlkem::sample+0xb0>
   9daec:      	strh	w8, [x21, x22, lsl #1]
   9daf0:      	add	x22, x22, #0x1
   9daf4:      	b	0x9d9e8 <toyos_crypto::mlkem::sample+0xb0>
   9daf8:      	add	x1, sp, #0xe0
   9dafc:      	mov	x0, x19
   9db00:      	mov	w2, #0x200              // =512
   9db04:      	bl	0x1065e8 <memcpy>
   9db08:      	str	xzr, [sp, #0x8]
   9db0c:      	str	xzr, [sp, #0x10]
   9db10:      	str	xzr, [sp, #0x18]
   9db14:      	str	xzr, [sp, #0x20]
   9db18:      	str	xzr, [sp, #0x28]
   9db1c:      	str	xzr, [sp, #0x30]
   9db20:      	str	xzr, [sp, #0x38]
   9db24:      	str	xzr, [sp, #0x40]
   9db28:      	str	xzr, [sp, #0x48]
   9db2c:      	str	xzr, [sp, #0x50]
   9db30:      	str	xzr, [sp, #0x58]
   9db34:      	str	xzr, [sp, #0x60]
   9db38:      	str	xzr, [sp, #0x68]
   9db3c:      	str	xzr, [sp, #0x70]
   9db40:      	str	xzr, [sp, #0x78]
   9db44:      	str	xzr, [sp, #0x80]
   9db48:      	str	xzr, [sp, #0x88]
   9db4c:      	str	xzr, [sp, #0x90]
   9db50:      	str	xzr, [sp, #0x98]
   9db54:      	str	xzr, [sp, #0xa0]
   9db58:      	str	xzr, [sp, #0xa8]
   9db5c:      	str	xzr, [sp, #0xb0]
   9db60:      	str	xzr, [sp, #0xb8]
   9db64:      	str	xzr, [sp, #0xc0]
   9db68:      	str	xzr, [sp, #0xc8]
   9db6c:      	add	sp, sp, #0x2e0
   9db70:      	ldp	x20, x19, [sp, #0x50]
   9db74:      	ldr	x28, [sp, #0x10]
   9db78:      	ldp	x22, x21, [sp, #0x40]
   9db7c:      	ldp	x24, x23, [sp, #0x30]
   9db80:      	ldp	x26, x25, [sp, #0x20]
   9db84:      	ldp	x29, x30, [sp], #0x60
   9db88:      	ret
   9db8c:      	nop
   9db90:      	adr	x2, 0x1193e8 <anon.d126a1c03a02b7f85a0a23db829417bf.8.llvm.17604454750795214172>
   9db94:      	mov	w1, #0x19               // =25
   9db98:      	bl	0x1012f8 <core::panicking::panic_bounds_check>
   9db9c:      	brk	#0x1
   9dba0:      	b	0x9dba4 <toyos_crypto::mlkem::sample+0x26c>
   9dba4:      	mov	x19, x0
   9dba8:      	mov	x8, xzr
   9dbac:      	add	x9, sp, #0xe0
   9dbb0:      	mov	x10, x8
   9dbb4:      	add	x8, x8, #0x2
   9dbb8:      	cmp	x8, #0x200
   9dbbc:      	strh	wzr, [x9, x10]
   9dbc0:      	b.ne	0x9dbb0 <toyos_crypto::mlkem::sample+0x278>
   9dbc4:      	add	x0, sp, #0x8
   9dbc8:      	bl	0xa0260 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   9dbcc:      	mov	x0, x19
   9dbd0:      	bl	0xfbd80 <_Unwind_Resume>
   9dbd4:      	bl	0x1012e0 <core::panicking::panic_in_cleanup>

000000000009f514 <<toyos_crypto::keccak::Sponge>::new>:
   9f514:      	sub	sp, sp, #0x140
   9f518:      	stp	x29, x30, [sp, #0xe0]
   9f51c:      	stp	x28, x27, [sp, #0xf0]
   9f520:      	stp	x26, x25, [sp, #0x100]
   9f524:      	stp	x24, x23, [sp, #0x110]
   9f528:      	stp	x22, x21, [sp, #0x120]
   9f52c:      	stp	x20, x19, [sp, #0x130]
   9f530:      	add	x29, sp, #0xe0
   9f534:      	mov	x22, x2
   9f538:      	mov	w21, w1
   9f53c:      	mov	x20, x0
   9f540:      	cmp	x0, #0x48
   9f544:      	mov	x19, x8
   9f548:      	b.eq	0x9f55c <<toyos_crypto::keccak::Sponge>::new+0x48>
   9f54c:      	cmp	x20, #0x88
   9f550:      	b.eq	0x9f55c <<toyos_crypto::keccak::Sponge>::new+0x48>
   9f554:      	cmp	x20, #0xa8
   9f558:      	b.ne	0x9f728 <<toyos_crypto::keccak::Sponge>::new+0x214>
   9f55c:      	movi	v0.2d, #0000000000000000
   9f560:      	stp	xzr, x20, [sp, #0xc0]
   9f564:      	str	xzr, [sp, #0xd0]
   9f568:      	stp	q0, q0, [sp]
   9f56c:      	stp	q0, q0, [sp, #0x20]
   9f570:      	stp	q0, q0, [sp, #0x40]
   9f574:      	stp	q0, q0, [sp, #0x60]
   9f578:      	stp	q0, q0, [sp, #0x80]
   9f57c:      	stp	q0, q0, [sp, #0xa0]
   9f580:      	cbz	x3, 0x9f660 <<toyos_crypto::keccak::Sponge>::new+0x14c>
   9f584:      	mov	x8, xzr
   9f588:      	add	x24, x22, x3, lsl #4
   9f58c:      	nop
   9f590:      	adr	x23, 0x1193b8 <anon.49a2fafc0cb8ebcfa0fea1018724d114.9.llvm.15028750401266101212+0x78>
   9f594:      	mov	x25, sp
   9f598:      	b	0x9f5a8 <<toyos_crypto::keccak::Sponge>::new+0x94>
   9f59c:      	add	x22, x22, #0x10
   9f5a0:      	cmp	x22, x24
   9f5a4:      	b.eq	0x9f618 <<toyos_crypto::keccak::Sponge>::new+0x104>
   9f5a8:      	ldr	x26, [x22, #0x8]
   9f5ac:      	cbz	x26, 0x9f59c <<toyos_crypto::keccak::Sponge>::new+0x88>
   9f5b0:      	ldr	x27, [x22]
   9f5b4:      	b	0x9f5c4 <<toyos_crypto::keccak::Sponge>::new+0xb0>
   9f5b8:      	subs	x26, x26, #0x1
   9f5bc:      	add	x27, x27, #0x1
   9f5c0:      	b.eq	0x9f59c <<toyos_crypto::keccak::Sponge>::new+0x88>
   9f5c4:      	lsr	x0, x8, #3
   9f5c8:      	cmp	x8, #0xc7
   9f5cc:      	b.hi	0x9f708 <<toyos_crypto::keccak::Sponge>::new+0x1f4>
   9f5d0:      	ubfiz	x8, x8, #3, #3
   9f5d4:      	ldrb	w9, [x27]
   9f5d8:      	lsl	x8, x9, x8
   9f5dc:      	ldr	x9, [x25, x0, lsl #3]
   9f5e0:      	eor	x8, x8, x9
   9f5e4:      	str	x8, [x25, x0, lsl #3]
   9f5e8:      	ldr	x8, [sp, #0xd0]
   9f5ec:      	cmn	x8, #0x1
   9f5f0:      	b.eq	0x9f6f0 <<toyos_crypto::keccak::Sponge>::new+0x1dc>
   9f5f4:      	add	x8, x8, #0x1
   9f5f8:      	cmp	x8, x20
   9f5fc:      	str	x8, [sp, #0xd0]
   9f600:      	b.ne	0x9f5b8 <<toyos_crypto::keccak::Sponge>::new+0xa4>
   9f604:      	mov	x0, sp
   9f608:      	bl	0x9f758 <<toyos_crypto::keccak::Sponge>::permute (.llvm.17604454750795214172)>
   9f60c:      	mov	x8, xzr
   9f610:      	str	xzr, [sp, #0xd0]
   9f614:      	b	0x9f5b8 <<toyos_crypto::keccak::Sponge>::new+0xa4>
   9f618:      	lsr	x0, x8, #3
   9f61c:      	cmp	x8, #0xc8
   9f620:      	b.hs	0x9f700 <<toyos_crypto::keccak::Sponge>::new+0x1ec>
   9f624:      	ubfiz	x8, x8, #3, #3
   9f628:      	mov	x9, sp
   9f62c:      	and	x10, x21, #0xff
   9f630:      	ldr	x11, [x9, x0, lsl #3]
   9f634:      	lsl	x8, x10, x8
   9f638:      	eor	x8, x8, x11
   9f63c:      	str	x8, [x9, x0, lsl #3]
   9f640:      	cbz	x20, 0x9f718 <<toyos_crypto::keccak::Sponge>::new+0x204>
   9f644:      	sub	x8, x20, #0x1
   9f648:      	cmp	x20, #0xc9
   9f64c:      	lsr	x0, x8, #3
   9f650:      	b.lo	0x9f670 <<toyos_crypto::keccak::Sponge>::new+0x15c>
   9f654:      	nop
   9f658:      	adr	x23, 0x1193a0 <anon.49a2fafc0cb8ebcfa0fea1018724d114.9.llvm.15028750401266101212+0x60>
   9f65c:      	b	0x9f708 <<toyos_crypto::keccak::Sponge>::new+0x1f4>
   9f660:      	sub	x8, x20, #0x1
   9f664:      	and	x9, x21, #0xff
   9f668:      	lsr	x0, x8, #3
   9f66c:      	str	x9, [sp]
   9f670:      	ubfiz	x8, x8, #3, #3
   9f674:      	mov	w9, #0x80               // =128
   9f678:      	mov	x10, sp
   9f67c:      	lsl	x8, x9, x8
   9f680:      	ldr	x9, [x10, x0, lsl #3]
   9f684:      	eor	x8, x9, x8
   9f688:      	str	x8, [x10, x0, lsl #3]
   9f68c:      	mov	x0, sp
   9f690:      	bl	0x9f758 <<toyos_crypto::keccak::Sponge>::permute (.llvm.17604454750795214172)>
   9f694:      	ldp	q0, q1, [sp, #0xa0]
   9f698:      	ldr	q2, [sp, #0xc0]
   9f69c:      	str	xzr, [x19, #0xd0]
   9f6a0:      	str	q2, [x19, #0xc0]
   9f6a4:      	stp	q0, q1, [x19, #0xa0]
   9f6a8:      	ldp	q0, q1, [sp, #0x60]
   9f6ac:      	stp	q0, q1, [x19, #0x60]
   9f6b0:      	ldp	q2, q0, [sp, #0x80]
   9f6b4:      	stp	q2, q0, [x19, #0x80]
   9f6b8:      	ldp	q1, q0, [sp, #0x20]
   9f6bc:      	stp	q1, q0, [x19, #0x20]
   9f6c0:      	ldp	q2, q0, [sp, #0x40]
   9f6c4:      	stp	q2, q0, [x19, #0x40]
   9f6c8:      	ldp	q1, q0, [sp]
   9f6cc:      	stp	q1, q0, [x19]
   9f6d0:      	ldp	x20, x19, [sp, #0x130]
   9f6d4:      	ldp	x22, x21, [sp, #0x120]
   9f6d8:      	ldp	x24, x23, [sp, #0x110]
   9f6dc:      	ldp	x26, x25, [sp, #0x100]
   9f6e0:      	ldp	x28, x27, [sp, #0xf0]
   9f6e4:      	ldp	x29, x30, [sp, #0xe0]
   9f6e8:      	add	sp, sp, #0x140
   9f6ec:      	ret
   9f6f0:      	nop
   9f6f4:      	adr	x0, 0x1193d0 <anon.49a2fafc0cb8ebcfa0fea1018724d114.9.llvm.15028750401266101212+0x90>
   9f6f8:      	bl	0x1022d4 <core::panicking::panic_const::panic_const_add_overflow>
   9f6fc:      	b	0x9f724 <<toyos_crypto::keccak::Sponge>::new+0x210>
   9f700:      	nop
   9f704:      	adr	x23, 0x119370 <anon.49a2fafc0cb8ebcfa0fea1018724d114.9.llvm.15028750401266101212+0x30>
   9f708:      	mov	w1, #0x19               // =25
   9f70c:      	mov	x2, x23
   9f710:      	bl	0x1012f8 <core::panicking::panic_bounds_check>
   9f714:      	b	0x9f724 <<toyos_crypto::keccak::Sponge>::new+0x210>
   9f718:      	nop
   9f71c:      	adr	x0, 0x119388 <anon.49a2fafc0cb8ebcfa0fea1018724d114.9.llvm.15028750401266101212+0x48>
   9f720:      	bl	0x102344 <core::panicking::panic_const::panic_const_sub_overflow>
   9f724:      	brk	#0x1
   9f728:      	nop
   9f72c:      	adr	x0, 0x285d6 <toyos_crypto::ed25519::B_ODD+0x127e>
   9f730:      	nop
   9f734:      	adr	x2, 0x119358 <anon.49a2fafc0cb8ebcfa0fea1018724d114.9.llvm.15028750401266101212+0x18>
   9f738:      	mov	w1, #0x30               // =48
   9f73c:      	bl	0x101498 <core::panicking::panic>
   9f740:      	mov	x19, x0
   9f744:      	mov	x0, sp
   9f748:      	bl	0xa0260 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   9f74c:      	mov	x0, x19
   9f750:      	bl	0xfbd80 <_Unwind_Resume>
   9f754:      	bl	0x1012e0 <core::panicking::panic_in_cleanup>

000000000009f758 <<toyos_crypto::keccak::Sponge>::permute (.llvm.17604454750795214172)>:
   9f758:      	stp	x29, x30, [sp, #-0x60]!
   9f75c:      	stp	x28, x27, [sp, #0x10]
   9f760:      	stp	x26, x25, [sp, #0x20]
   9f764:      	stp	x24, x23, [sp, #0x30]
   9f768:      	stp	x22, x21, [sp, #0x40]
   9f76c:      	stp	x20, x19, [sp, #0x50]
   9f770:      	mov	x29, sp
   9f774:      	sub	sp, sp, #0x300
   9f778:      	nop
   9f77c:      	adr	x8, 0x28608 <toyos_crypto::ed25519::B_ODD+0x12b0>
   9f780:      	sub	x9, x29, #0xd8
   9f784:      	ldp	q0, q1, [x8, #0x80]
   9f788:      	ldr	x19, [x0, #0xc0]
   9f78c:      	ldp	x1, x10, [x0]
   9f790:      	mov	w13, #0x10              // =16
   9f794:      	ldp	x16, x4, [x0, #0x50]
   9f798:      	stp	xzr, xzr, [sp, #0x128]
   9f79c:      	stp	q0, q1, [x9, #0x90]
   9f7a0:      	ldp	q2, q0, [x8, #0xa0]
   9f7a4:      	ldp	x7, x20, [x0, #0x80]
   9f7a8:      	stp	xzr, xzr, [sp, #0x118]
   9f7ac:      	stp	xzr, xzr, [sp, #0x150]
   9f7b0:      	ldp	x23, x6, [x0, #0xb0]
   9f7b4:      	stp	q2, q0, [x9, #0xb0]
   9f7b8:      	ldp	q1, q0, [x8, #0x40]
   9f7bc:      	stp	xzr, xzr, [sp, #0x140]
   9f7c0:      	str	xzr, [sp, #0x138]
   9f7c4:      	stp	q1, q0, [x9, #0x50]
   9f7c8:      	ldp	q2, q0, [x8, #0x60]
   9f7cc:      	stp	xzr, xzr, [x29, #-0xe8]
   9f7d0:      	stp	xzr, xzr, [x29, #-0xf8]
   9f7d4:      	stp	q2, q0, [x9, #0x70]
   9f7d8:      	ldp	q1, q0, [x8]
   9f7dc:      	stur	xzr, [x29, #-0x100]
   9f7e0:      	stp	xzr, xzr, [sp, #0x1f0]
   9f7e4:      	stp	q1, q0, [x9, #0x10]
   9f7e8:      	ldp	q2, q0, [x8, #0x20]
   9f7ec:      	ldp	x8, x3, [x0, #0xa0]
   9f7f0:      	stp	xzr, xzr, [sp, #0x1e0]
   9f7f4:      	stp	xzr, xzr, [sp, #0x1c8]
   9f7f8:      	str	q2, [x9, #0x30]
   9f7fc:      	stp	x8, xzr, [sp, #0x108]
   9f800:      	ldp	x21, x8, [x0, #0x30]
   9f804:      	str	q0, [x9, #0x40]
   9f808:      	stp	x8, x10, [sp, #0xe8]
   9f80c:      	ldp	x11, x8, [x0, #0x60]
   9f810:      	ldp	x10, x17, [x0, #0x10]
   9f814:      	stp	x8, x11, [sp, #0xf8]
   9f818:      	ldp	x8, x15, [x0, #0x20]
   9f81c:      	stp	x8, x10, [sp, #0xb8]
   9f820:      	ldp	x10, x8, [x0, #0x40]
   9f824:      	stp	x10, x8, [sp, #0xc8]
   9f828:      	ldp	x10, x26, [x0, #0x70]
   9f82c:      	ldp	x14, x8, [x0, #0x90]
   9f830:      	stp	x8, x10, [sp, #0xd8]
   9f834:      	ldp	x27, x8, [sp, #0x100]
   9f838:      	eor	x9, x16, x15
   9f83c:      	ldr	x18, [sp, #0xe8]
   9f840:      	eor	x10, x7, x3
   9f844:      	eor	x11, x4, x21
   9f848:      	mov	x25, x26
   9f84c:      	stp	x6, x23, [sp, #0xa0]
   9f850:      	ldr	x30, [sp, #0xf8]
   9f854:      	eor	x8, x26, x8
   9f858:      	ldp	x22, x24, [sp, #0xb8]
   9f85c:      	eor	x8, x8, x9
   9f860:      	eor	x9, x10, x11
   9f864:      	eor	x10, x20, x23
   9f868:      	eor	x11, x27, x18
   9f86c:      	mov	x23, x15
   9f870:      	stp	x3, x13, [sp, #0x88]
   9f874:      	eor	x10, x10, x11
   9f878:      	mov	x11, x6
   9f87c:      	mov	x6, x14
   9f880:      	eor	x11, x14, x11
   9f884:      	ldp	x14, x2, [sp, #0xc8]
   9f888:      	ldp	x26, x15, [sp, #0xd8]
   9f88c:      	str	x19, [sp, #0x98]
   9f890:      	mov	x5, x4
   9f894:      	mov	x4, x16
   9f898:      	eor	x8, x8, x1
   9f89c:      	eor	x12, x30, x14
   9f8a0:      	eor	x10, x10, x24
   9f8a4:      	eor	x3, x26, x19
   9f8a8:      	eor	x16, x15, x2
   9f8ac:      	ldr	x19, [sp, #0xf0]
   9f8b0:      	eor	x11, x11, x12
   9f8b4:      	eor	x12, x3, x16
   9f8b8:      	mov	x16, x17
   9f8bc:      	eor	x9, x9, x19
   9f8c0:      	eor	x11, x11, x17
   9f8c4:      	eor	x12, x12, x22
   9f8c8:      	eor	x28, x12, x9, ror #63
   9f8cc:      	eor	x17, x8, x10, ror #63
   9f8d0:      	eor	x3, x9, x11, ror #63
   9f8d4:      	sub	x9, x29, #0xd8
   9f8d8:      	eor	x12, x10, x12, ror #63
   9f8dc:      	eor	x10, x11, x8, ror #63
   9f8e0:      	ldr	x9, [x9, x13]
   9f8e4:      	eor	x8, x17, x19
   9f8e8:      	eor	x13, x28, x1
   9f8ec:      	stp	x12, x3, [sp, #0x48]
   9f8f0:      	str	x9, [sp, #0xb0]
   9f8f4:      	eor	x9, x3, x24
   9f8f8:      	ror	x24, x8, #0x3f
   9f8fc:      	eor	x8, x12, x16
   9f900:      	ror	x11, x9, #0x2
   9f904:      	eor	x9, x28, x23
   9f908:      	ror	x16, x8, #0x24
   9f90c:      	eor	x8, x10, x22
   9f910:      	ror	x23, x9, #0x1c
   9f914:      	ror	x22, x8, #0x25
   9f918:      	eor	x8, x17, x21
   9f91c:      	eor	x9, x12, x14
   9f920:      	ror	x19, x8, #0x14
   9f924:      	eor	x8, x3, x18
   9f928:      	stp	x11, x23, [sp, #0x20]
   9f92c:      	ror	x18, x8, #0x3a
   9f930:      	eor	x8, x10, x2
   9f934:      	ror	x11, x9, #0x9
   9f938:      	ror	x1, x8, #0x2c
   9f93c:      	eor	x8, x28, x4
   9f940:      	eor	x9, x17, x5
   9f944:      	ror	x4, x8, #0x3d
   9f948:      	eor	x8, x3, x27
   9f94c:      	ror	x2, x9, #0x36
   9f950:      	ror	x21, x8, #0x15
   9f954:      	eor	x8, x12, x30
   9f958:      	eor	x9, x10, x15
   9f95c:      	ror	x5, x8, #0x27
   9f960:      	ror	x8, x9, #0x19
   9f964:      	eor	x9, x3, x20
   9f968:      	ror	x27, x9, #0x31
   9f96c:      	eor	x9, x10, x26
   9f970:      	str	x28, [sp, #0x78]
   9f974:      	stp	x8, x11, [sp, #0x10]
   9f978:      	ldr	x11, [sp, #0x108]
   9f97c:      	eor	x8, x28, x25
   9f980:      	ror	x15, x8, #0x17
   9f984:      	eor	x8, x17, x7
   9f988:      	stp	x10, x21, [sp, #0x38]
   9f98c:      	eor	x11, x28, x11
   9f990:      	ror	x25, x8, #0x13
   9f994:      	eor	x8, x12, x6
   9f998:      	ror	x30, x11, #0x2e
   9f99c:      	ldp	x14, x11, [sp, #0xa0]
   9f9a0:      	ror	x28, x9, #0x38
   9f9a4:      	ldr	x9, [sp, #0x88]
   9f9a8:      	ror	x8, x8, #0x2b
   9f9ac:      	str	x17, [sp, #0x68]
   9f9b0:      	bic	x7, x25, x4
   9f9b4:      	eor	x12, x12, x14
   9f9b8:      	ldr	x14, [sp, #0x98]
   9f9bc:      	eor	x9, x17, x9
   9f9c0:      	bic	x17, x21, x19
   9f9c4:      	eor	x11, x3, x11
   9f9c8:      	str	x19, [sp, #0x88]
   9f9cc:      	eor	x14, x10, x14
   9f9d0:      	ldr	x10, [sp, #0xb0]
   9f9d4:      	str	x13, [sp, #0xb0]
   9f9d8:      	ror	x11, x11, #0x3
   9f9dc:      	stp	x16, x24, [sp, #0xa0]
   9f9e0:      	ror	x12, x12, #0x8
   9f9e4:      	eor	x6, x10, x13
   9f9e8:      	ror	x10, x14, #0x32
   9f9ec:      	str	x4, [sp, #0x60]
   9f9f0:      	eor	x14, x17, x6
   9f9f4:      	bic	x6, x19, x13
   9f9f8:      	str	x5, [sp, #0x30]
   9f9fc:      	str	x14, [sp, #0x8]
   9fa00:      	bic	x14, x8, x21
   9fa04:      	bic	x17, x13, x10
   9fa08:      	eor	x14, x19, x14
   9fa0c:      	bic	x19, x11, x25
   9fa10:      	str	x18, [sp, #0x80]
   9fa14:      	str	x14, [sp, #0xf0]
   9fa18:      	bic	x14, x10, x8
   9fa1c:      	ror	x9, x9, #0x3e
   9fa20:      	eor	x13, x14, x21
   9fa24:      	eor	x21, x7, x1
   9fa28:      	bic	x7, x1, x16
   9fa2c:      	str	x13, [sp, #0xc0]
   9fa30:      	eor	x13, x17, x8
   9fa34:      	eor	x14, x19, x4
   9fa38:      	str	x13, [sp]
   9fa3c:      	eor	x13, x6, x10
   9fa40:      	bic	x6, x4, x1
   9fa44:      	eor	x3, x6, x16
   9fa48:      	bic	x6, x16, x11
   9fa4c:      	str	x13, [sp, #0xb8]
   9fa50:      	eor	x13, x25, x6
   9fa54:      	bic	x19, x5, x18
   9fa58:      	str	x14, [sp, #0xe8]
   9fa5c:      	str	x13, [sp, #0xc8]
   9fa60:      	eor	x13, x7, x11
   9fa64:      	bic	x7, x30, x28
   9fa68:      	eor	x16, x24, x19
   9fa6c:      	bic	x6, x28, x5
   9fa70:      	bic	x19, x24, x30
   9fa74:      	eor	x14, x7, x5
   9fa78:      	eor	x4, x6, x18
   9fa7c:      	bic	x6, x18, x24
   9fa80:      	str	x14, [sp, #0x100]
   9fa84:      	eor	x14, x19, x28
   9fa88:      	bic	x7, x2, x23
   9fa8c:      	ldp	x5, x18, [sp, #0x10]
   9fa90:      	str	x14, [sp, #0xf8]
   9fa94:      	bic	x19, x27, x2
   9fa98:      	eor	x14, x6, x30
   9fa9c:      	ldr	x24, [sp, #0x20]
   9faa0:      	str	x14, [sp, #0xe0]
   9faa4:      	eor	x26, x7, x22
   9faa8:      	eor	x7, x19, x23
   9faac:      	bic	x6, x12, x27
   9fab0:      	bic	x14, x22, x12
   9fab4:      	bic	x19, x23, x22
   9fab8:      	str	x1, [sp, #0x70]
   9fabc:      	eor	x20, x2, x6
   9fac0:      	eor	x1, x14, x27
   9fac4:      	str	x2, [sp, #0x58]
   9fac8:      	eor	x14, x19, x12
   9facc:      	bic	x6, x5, x18
   9fad0:      	mov	x2, x15
   9fad4:      	bic	x15, x15, x5
   9fad8:      	str	x13, [sp, #0xd0]
   9fadc:      	ldr	x13, [sp, #0x90]
   9fae0:      	str	x14, [sp, #0xd8]
   9fae4:      	eor	x14, x6, x24
   9fae8:      	eor	x17, x15, x18
   9faec:      	bic	x19, x9, x2
   9faf0:      	bic	x15, x18, x24
   9faf4:      	str	x14, [sp, #0x108]
   9faf8:      	eor	x23, x19, x5
   9fafc:      	mov	x14, x1
   9fb00:      	eor	x19, x9, x15
   9fb04:      	mov	x15, x3
   9fb08:      	mov	x3, x17
   9fb0c:      	ldp	x17, x1, [sp]
   9fb10:      	add	x13, x13, #0x8
   9fb14:      	bic	x6, x24, x9
   9fb18:      	cmp	x13, #0xd0
   9fb1c:      	str	x22, [sp, #0x98]
   9fb20:      	eor	x6, x6, x2
   9fb24:      	b.ne	0x9f834 <<toyos_crypto::keccak::Sponge>::permute (.llvm.17604454750795214172)+0xdc>
   9fb28:      	stp	x10, x8, [x29, #-0x100]
   9fb2c:      	ldr	x8, [sp, #0xf0]
   9fb30:      	str	x9, [sp, #0x160]
   9fb34:      	stp	x1, x8, [x0]
   9fb38:      	ldp	x8, x9, [sp, #0xb8]
   9fb3c:      	stp	x11, x25, [sp, #0x1d8]
   9fb40:      	stp	x12, x27, [sp, #0x188]
   9fb44:      	stp	x8, x15, [x0, #0x20]
   9fb48:      	ldr	x8, [sp, #0xe8]
   9fb4c:      	stp	x9, x17, [x0, #0x10]
   9fb50:      	stp	x21, x8, [x0, #0x30]
   9fb54:      	ldp	x9, x8, [sp, #0xc8]
   9fb58:      	stp	x30, x28, [sp, #0x1b0]
   9fb5c:      	stp	x16, x4, [x0, #0x50]
   9fb60:      	stp	x9, x8, [x0, #0x40]
   9fb64:      	ldp	x8, x9, [sp, #0xf8]
   9fb68:      	stp	x7, x20, [x0, #0x80]
   9fb6c:      	stp	x23, x6, [x0, #0xb0]
   9fb70:      	stp	x9, x8, [x0, #0x60]
   9fb74:      	ldp	x8, x9, [sp, #0xd8]
   9fb78:      	str	x19, [x0, #0xc0]
   9fb7c:      	stp	x18, x24, [sp, #0x178]
   9fb80:      	stp	x14, x8, [x0, #0x90]
   9fb84:      	ldr	x8, [sp, #0x108]
   9fb88:      	stp	x9, x26, [x0, #0x70]
   9fb8c:      	ldr	x9, [sp, #0x78]
   9fb90:      	stp	x8, x3, [x0, #0xa0]
   9fb94:      	ldr	x8, [sp, #0x68]
   9fb98:      	stp	x2, x5, [sp, #0x168]
   9fb9c:      	stp	x8, x9, [sp, #0x150]
   9fba0:      	ldp	x8, x9, [sp, #0x48]
   9fba4:      	stp	x8, x9, [sp, #0x140]
   9fba8:      	ldr	x8, [sp, #0x38]
   9fbac:      	ldp	x10, x9, [sp, #0xa8]
   9fbb0:      	str	x8, [sp, #0x138]
   9fbb4:      	ldp	x8, x11, [sp, #0x98]
   9fbb8:      	str	x8, [sp, #0x1a8]
   9fbbc:      	ldr	x8, [sp, #0x28]
   9fbc0:      	str	x8, [sp, #0x1a0]
   9fbc4:      	ldr	x8, [sp, #0x88]
   9fbc8:      	stp	x8, x9, [x29, #-0xe8]
   9fbcc:      	ldr	x8, [sp, #0x80]
   9fbd0:      	stp	x8, x10, [sp, #0x1c8]
   9fbd4:      	ldr	x8, [sp, #0x70]
   9fbd8:      	stp	x8, x11, [sp, #0x1f0]
   9fbdc:      	ldp	x8, x9, [sp, #0x58]
   9fbe0:      	str	x8, [sp, #0x198]
   9fbe4:      	ldr	x8, [sp, #0x40]
   9fbe8:      	str	x9, [sp, #0x1e8]
   9fbec:      	stur	x8, [x29, #-0xf0]
   9fbf0:      	ldr	x8, [sp, #0x30]
   9fbf4:      	str	x8, [sp, #0x1c0]
   9fbf8:      	str	xzr, [sp, #0x130]
   9fbfc:      	str	xzr, [sp, #0x128]
   9fc00:      	str	xzr, [sp, #0x120]
   9fc04:      	str	xzr, [sp, #0x118]
   9fc08:      	str	xzr, [sp, #0x110]
   9fc0c:      	str	xzr, [sp, #0x158]
   9fc10:      	str	xzr, [sp, #0x150]
   9fc14:      	str	xzr, [sp, #0x148]
   9fc18:      	str	xzr, [sp, #0x140]
   9fc1c:      	str	xzr, [sp, #0x138]
   9fc20:      	stur	xzr, [x29, #-0xe0]
   9fc24:      	stur	xzr, [x29, #-0xe8]
   9fc28:      	stur	xzr, [x29, #-0xf0]
   9fc2c:      	stur	xzr, [x29, #-0xf8]
   9fc30:      	stur	xzr, [x29, #-0x100]
   9fc34:      	str	xzr, [sp, #0x1f8]
   9fc38:      	str	xzr, [sp, #0x1f0]
   9fc3c:      	str	xzr, [sp, #0x1e8]
   9fc40:      	str	xzr, [sp, #0x1e0]
   9fc44:      	str	xzr, [sp, #0x1d8]
   9fc48:      	str	xzr, [sp, #0x1d0]
   9fc4c:      	str	xzr, [sp, #0x1c8]
   9fc50:      	str	xzr, [sp, #0x1c0]
   9fc54:      	str	xzr, [sp, #0x1b8]
   9fc58:      	str	xzr, [sp, #0x1b0]
   9fc5c:      	str	xzr, [sp, #0x1a8]
   9fc60:      	str	xzr, [sp, #0x1a0]
   9fc64:      	str	xzr, [sp, #0x198]
   9fc68:      	str	xzr, [sp, #0x190]
   9fc6c:      	str	xzr, [sp, #0x188]
   9fc70:      	str	xzr, [sp, #0x180]
   9fc74:      	str	xzr, [sp, #0x178]
   9fc78:      	str	xzr, [sp, #0x170]
   9fc7c:      	str	xzr, [sp, #0x168]
   9fc80:      	str	xzr, [sp, #0x160]
   9fc84:      	add	sp, sp, #0x300
   9fc88:      	ldp	x20, x19, [sp, #0x50]
   9fc8c:      	ldp	x22, x21, [sp, #0x40]
   9fc90:      	ldp	x24, x23, [sp, #0x30]
   9fc94:      	ldp	x26, x25, [sp, #0x20]
   9fc98:      	ldp	x28, x27, [sp, #0x10]
   9fc9c:      	ldp	x29, x30, [sp], #0x60
   9fca0:      	ret

000000000009fca4 <toyos_crypto::keccak::g>:
   9fca4:      	sub	sp, sp, #0x160
   9fca8:      	stp	x29, x30, [sp, #0x120]
   9fcac:      	str	x28, [sp, #0x130]
   9fcb0:      	stp	x22, x21, [sp, #0x140]
   9fcb4:      	stp	x20, x19, [sp, #0x150]
   9fcb8:      	add	x29, sp, #0x120
   9fcbc:      	movi	v0.2d, #0000000000000000
   9fcc0:      	mov	x3, x1
   9fcc4:      	mov	x2, x0
   9fcc8:      	mov	x19, x8
   9fccc:      	add	x8, sp, #0x48
   9fcd0:      	mov	w0, #0x48               // =72
   9fcd4:      	mov	w1, #0x6                // =6
   9fcd8:      	add	x20, sp, #0x48
   9fcdc:      	stp	q0, q0, [sp]
   9fce0:      	stp	q0, q0, [sp, #0x20]
   9fce4:      	bl	0x9f514 <<toyos_crypto::keccak::Sponge>::new>
   9fce8:      	ldr	x8, [sp, #0x118]
   9fcec:      	mov	x22, xzr
   9fcf0:      	mov	x21, sp
   9fcf4:      	b	0x9fd34 <toyos_crypto::keccak::g+0x90>
   9fcf8:      	add	x0, sp, #0x48
   9fcfc:      	bl	0x9f758 <<toyos_crypto::keccak::Sponge>::permute (.llvm.17604454750795214172)>
   9fd00:      	mov	x0, xzr
   9fd04:      	mov	x8, xzr
   9fd08:      	str	xzr, [sp, #0x118]
   9fd0c:      	ldr	x9, [x20, x0, lsl #3]
   9fd10:      	ubfiz	x10, x8, #3, #3
   9fd14:      	add	x11, x22, #0x1
   9fd18:      	add	x8, x8, #0x1
   9fd1c:      	cmp	x11, #0x40
   9fd20:      	lsr	x9, x9, x10
   9fd24:      	str	x8, [sp, #0x118]
   9fd28:      	strb	w9, [x21, x22]
   9fd2c:      	mov	x22, x11
   9fd30:      	b.eq	0x9fd60 <toyos_crypto::keccak::g+0xbc>
   9fd34:      	ldr	x9, [sp, #0x110]
   9fd38:      	cmp	x8, x9
   9fd3c:      	b.eq	0x9fcf8 <toyos_crypto::keccak::g+0x54>
   9fd40:      	lsr	x0, x8, #3
   9fd44:      	cmp	x8, #0xc8
   9fd48:      	b.lo	0x9fd0c <toyos_crypto::keccak::g+0x68>
   9fd4c:      	nop
   9fd50:      	adr	x2, 0x1193e8 <anon.d126a1c03a02b7f85a0a23db829417bf.8.llvm.17604454750795214172>
   9fd54:      	mov	w1, #0x19               // =25
   9fd58:      	bl	0x1012f8 <core::panicking::panic_bounds_check>
   9fd5c:      	brk	#0x1
   9fd60:      	str	xzr, [sp, #0x48]
   9fd64:      	str	xzr, [sp, #0x50]
   9fd68:      	str	xzr, [sp, #0x58]
   9fd6c:      	str	xzr, [sp, #0x60]
   9fd70:      	str	xzr, [sp, #0x68]
   9fd74:      	str	xzr, [sp, #0x70]
   9fd78:      	str	xzr, [sp, #0x78]
   9fd7c:      	str	xzr, [sp, #0x80]
   9fd80:      	str	xzr, [sp, #0x88]
   9fd84:      	str	xzr, [sp, #0x90]
   9fd88:      	str	xzr, [sp, #0x98]
   9fd8c:      	str	xzr, [sp, #0xa0]
   9fd90:      	str	xzr, [sp, #0xa8]
   9fd94:      	str	xzr, [sp, #0xb0]
   9fd98:      	str	xzr, [sp, #0xb8]
   9fd9c:      	str	xzr, [sp, #0xc0]
   9fda0:      	str	xzr, [sp, #0xc8]
   9fda4:      	str	xzr, [sp, #0xd0]
   9fda8:      	str	xzr, [sp, #0xd8]
   9fdac:      	str	xzr, [sp, #0xe0]
   9fdb0:      	str	xzr, [sp, #0xe8]
   9fdb4:      	str	xzr, [sp, #0xf0]
   9fdb8:      	str	xzr, [sp, #0xf8]
   9fdbc:      	str	xzr, [sp, #0x100]
   9fdc0:      	str	xzr, [sp, #0x108]
   9fdc4:      	ldp	q0, q1, [sp]
   9fdc8:      	stp	q0, q1, [x19]
   9fdcc:      	ldp	q2, q0, [sp, #0x20]
   9fdd0:      	stp	q2, q0, [x19, #0x20]
   9fdd4:      	ldp	x20, x19, [sp, #0x150]
   9fdd8:      	ldr	x28, [sp, #0x130]
   9fddc:      	ldp	x22, x21, [sp, #0x140]
   9fde0:      	ldp	x29, x30, [sp, #0x120]
   9fde4:      	add	sp, sp, #0x160
   9fde8:      	ret
   9fdec:      	mov	x19, x0
   9fdf0:      	add	x0, sp, #0x48
   9fdf4:      	bl	0xa0260 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   9fdf8:      	mov	x0, x19
   9fdfc:      	bl	0xfbd80 <_Unwind_Resume>
   9fe00:      	bl	0x1012e0 <core::panicking::panic_in_cleanup>

000000000009fe04 <toyos_crypto::keccak::h>:
   9fe04:      	sub	sp, sp, #0x140
   9fe08:      	stp	x29, x30, [sp, #0x100]
   9fe0c:      	str	x28, [sp, #0x110]
   9fe10:      	stp	x22, x21, [sp, #0x120]
   9fe14:      	stp	x20, x19, [sp, #0x130]
   9fe18:      	add	x29, sp, #0x100
   9fe1c:      	movi	v0.2d, #0000000000000000
   9fe20:      	mov	x3, x1
   9fe24:      	mov	x2, x0
   9fe28:      	mov	x19, x8
   9fe2c:      	add	x8, sp, #0x28
   9fe30:      	mov	w0, #0x88               // =136
   9fe34:      	mov	w1, #0x6                // =6
   9fe38:      	add	x20, sp, #0x28
   9fe3c:      	stp	q0, q0, [sp]
   9fe40:      	bl	0x9f514 <<toyos_crypto::keccak::Sponge>::new>
   9fe44:      	ldr	x8, [sp, #0xf8]
   9fe48:      	mov	x22, xzr
   9fe4c:      	mov	x21, sp
   9fe50:      	b	0x9fe90 <toyos_crypto::keccak::h+0x8c>
   9fe54:      	add	x0, sp, #0x28
   9fe58:      	bl	0x9f758 <<toyos_crypto::keccak::Sponge>::permute (.llvm.17604454750795214172)>
   9fe5c:      	mov	x0, xzr
   9fe60:      	mov	x8, xzr
   9fe64:      	str	xzr, [sp, #0xf8]
   9fe68:      	ldr	x9, [x20, x0, lsl #3]
   9fe6c:      	ubfiz	x10, x8, #3, #3
   9fe70:      	add	x11, x22, #0x1
   9fe74:      	add	x8, x8, #0x1
   9fe78:      	cmp	x11, #0x20
   9fe7c:      	lsr	x9, x9, x10
   9fe80:      	str	x8, [sp, #0xf8]
   9fe84:      	strb	w9, [x21, x22]
   9fe88:      	mov	x22, x11
   9fe8c:      	b.eq	0x9febc <toyos_crypto::keccak::h+0xb8>
   9fe90:      	ldr	x9, [sp, #0xf0]
   9fe94:      	cmp	x8, x9
   9fe98:      	b.eq	0x9fe54 <toyos_crypto::keccak::h+0x50>
   9fe9c:      	lsr	x0, x8, #3
   9fea0:      	cmp	x8, #0xc8
   9fea4:      	b.lo	0x9fe68 <toyos_crypto::keccak::h+0x64>
   9fea8:      	nop
   9feac:      	adr	x2, 0x1193e8 <anon.d126a1c03a02b7f85a0a23db829417bf.8.llvm.17604454750795214172>
   9feb0:      	mov	w1, #0x19               // =25
   9feb4:      	bl	0x1012f8 <core::panicking::panic_bounds_check>
   9feb8:      	brk	#0x1
   9febc:      	str	xzr, [sp, #0x28]
   9fec0:      	str	xzr, [sp, #0x30]
   9fec4:      	str	xzr, [sp, #0x38]
   9fec8:      	str	xzr, [sp, #0x40]
   9fecc:      	str	xzr, [sp, #0x48]
   9fed0:      	str	xzr, [sp, #0x50]
   9fed4:      	str	xzr, [sp, #0x58]
   9fed8:      	str	xzr, [sp, #0x60]
   9fedc:      	str	xzr, [sp, #0x68]
   9fee0:      	str	xzr, [sp, #0x70]
   9fee4:      	str	xzr, [sp, #0x78]
   9fee8:      	str	xzr, [sp, #0x80]
   9feec:      	str	xzr, [sp, #0x88]
   9fef0:      	str	xzr, [sp, #0x90]
   9fef4:      	str	xzr, [sp, #0x98]
   9fef8:      	str	xzr, [sp, #0xa0]
   9fefc:      	str	xzr, [sp, #0xa8]
   9ff00:      	str	xzr, [sp, #0xb0]
   9ff04:      	str	xzr, [sp, #0xb8]
   9ff08:      	str	xzr, [sp, #0xc0]
   9ff0c:      	str	xzr, [sp, #0xc8]
   9ff10:      	str	xzr, [sp, #0xd0]
   9ff14:      	str	xzr, [sp, #0xd8]
   9ff18:      	str	xzr, [sp, #0xe0]
   9ff1c:      	str	xzr, [sp, #0xe8]
   9ff20:      	ldp	q0, q1, [sp]
   9ff24:      	stp	q0, q1, [x19]
   9ff28:      	ldp	x20, x19, [sp, #0x130]
   9ff2c:      	ldr	x28, [sp, #0x110]
   9ff30:      	ldp	x22, x21, [sp, #0x120]
   9ff34:      	ldp	x29, x30, [sp, #0x100]
   9ff38:      	add	sp, sp, #0x140
   9ff3c:      	ret
   9ff40:      	mov	x19, x0
   9ff44:      	add	x0, sp, #0x28
   9ff48:      	bl	0xa0260 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   9ff4c:      	mov	x0, x19
   9ff50:      	bl	0xfbd80 <_Unwind_Resume>
   9ff54:      	bl	0x1012e0 <core::panicking::panic_in_cleanup>

00000000000a0260 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>:
   a0260:      	stp	x29, x30, [sp, #-0x10]!
   a0264:      	mov	x29, sp
   a0268:      	str	xzr, [x0]
   a026c:      	str	xzr, [x0, #0x8]
   a0270:      	str	xzr, [x0, #0x10]
   a0274:      	str	xzr, [x0, #0x18]
   a0278:      	str	xzr, [x0, #0x20]
   a027c:      	str	xzr, [x0, #0x28]
   a0280:      	str	xzr, [x0, #0x30]
   a0284:      	str	xzr, [x0, #0x38]
   a0288:      	str	xzr, [x0, #0x40]
   a028c:      	str	xzr, [x0, #0x48]
   a0290:      	str	xzr, [x0, #0x50]
   a0294:      	str	xzr, [x0, #0x58]
   a0298:      	str	xzr, [x0, #0x60]
   a029c:      	str	xzr, [x0, #0x68]
   a02a0:      	str	xzr, [x0, #0x70]
   a02a4:      	str	xzr, [x0, #0x78]
   a02a8:      	str	xzr, [x0, #0x80]
   a02ac:      	str	xzr, [x0, #0x88]
   a02b0:      	str	xzr, [x0, #0x90]
   a02b4:      	str	xzr, [x0, #0x98]
   a02b8:      	str	xzr, [x0, #0xa0]
   a02bc:      	str	xzr, [x0, #0xa8]
   a02c0:      	str	xzr, [x0, #0xb0]
   a02c4:      	str	xzr, [x0, #0xb8]
   a02c8:      	str	xzr, [x0, #0xc0]
   a02cc:      	ldp	x29, x30, [sp], #0x10
   a02d0:      	ret

