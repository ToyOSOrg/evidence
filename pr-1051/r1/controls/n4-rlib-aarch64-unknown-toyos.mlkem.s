0000000000000000 <<core::slice::iter::Iter<toyos_crypto::mlkem::Poly> as core::iter::adapters::zip::TrustedRandomAccessNoCoerce>::size>:
       0:      	stp	x29, x30, [sp, #-0x20]!
       4:      	stp	x20, x19, [sp, #0x10]
       8:      	mov	x29, sp
       c:      	ldp	x20, x19, [x0]
      10:      	mov	x0, x19
      14:      	mov	x1, x20
      18:      	bl	0x18 <<core::slice::iter::Iter<toyos_crypto::mlkem::Poly> as core::iter::adapters::zip::TrustedRandomAccessNoCoerce>::size+0x18>
      1c:      	tbz	w0, #0x0, 0x34 <<core::slice::iter::Iter<toyos_crypto::mlkem::Poly> as core::iter::adapters::zip::TrustedRandomAccessNoCoerce>::size+0x34>
      20:      	sub	x8, x19, x20
      24:      	lsr	x0, x8, #9
      28:      	ldp	x20, x19, [sp, #0x10]
      2c:      	ldp	x29, x30, [sp], #0x20
      30:      	ret
      34:      	adrp	x0, 0x0 <<core::slice::iter::Iter<toyos_crypto::mlkem::Poly> as core::iter::adapters::zip::TrustedRandomAccessNoCoerce>::size>
      38:      	add	x0, x0, #0x0
      3c:      	adrp	x3, 0x0 <<core::slice::iter::Iter<toyos_crypto::mlkem::Poly> as core::iter::adapters::zip::TrustedRandomAccessNoCoerce>::size>
      40:      	add	x3, x3, #0x0
      44:      	mov	w1, #0x193              // =403
      48:      	mov	w2, wzr
      4c:      	bl	0x4c <<core::slice::iter::Iter<toyos_crypto::mlkem::Poly> as core::iter::adapters::zip::TrustedRandomAccessNoCoerce>::size+0x4c>
      50:      	bl	0x50 <<core::slice::iter::Iter<toyos_crypto::mlkem::Poly> as core::iter::adapters::zip::TrustedRandomAccessNoCoerce>::size+0x50>

0000000000000000 <<toyos_crypto::mlkem::Poly>::decode::<1>>:
       0:      	stp	x29, x30, [sp, #-0x30]!
       4:      	str	x28, [sp, #0x10]
       8:      	stp	x20, x19, [sp, #0x20]
       c:      	mov	x29, sp
      10:      	sub	sp, sp, #0x210
      14:      	cmp	x1, #0x20
      18:      	str	x1, [sp]
      1c:      	b.ne	0x148 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x148>
      20:      	movi	v0.2d, #0000000000000000
      24:      	mov	x20, x0
      28:      	mov	x19, x8
      2c:      	mov	x8, sp
      30:      	stp	q0, q0, [sp]
      34:      	stp	q0, q0, [sp, #0x20]
      38:      	stp	q0, q0, [sp, #0x40]
      3c:      	stp	q0, q0, [sp, #0x60]
      40:      	stp	q0, q0, [sp, #0x80]
      44:      	stp	q0, q0, [sp, #0xa0]
      48:      	stp	q0, q0, [sp, #0xc0]
      4c:      	stp	q0, q0, [sp, #0xe0]
      50:      	stp	q0, q0, [sp, #0x100]
      54:      	stp	q0, q0, [sp, #0x120]
      58:      	stp	q0, q0, [sp, #0x140]
      5c:      	stp	q0, q0, [sp, #0x160]
      60:      	stp	q0, q0, [sp, #0x180]
      64:      	stp	q0, q0, [sp, #0x1a0]
      68:      	stp	q0, q0, [sp, #0x1c0]
      6c:      	stp	q0, q0, [sp, #0x1e0]
      70:      	add	x0, x8, #0x200
      74:      	mov	x1, sp
      78:      	bl	0x78 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x78>
      7c:      	cbz	w0, 0x168 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x168>
      80:      	sub	x9, x29, #0x10
      84:      	mov	x8, xzr
      88:      	mov	x12, sp
      8c:      	sub	x10, x20, x9
      90:      	sub	x11, x9, x20
      94:      	cmp	x20, x9
      98:      	stp	xzr, xzr, [x29, #-0x10]
      9c:      	csel	x13, x11, x10, lo
      a0:      	cbz	x13, 0x12c <<toyos_crypto::mlkem::Poly>::decode::<1>+0x12c>
      a4:      	ldrb	w13, [x20], #0x1
      a8:      	add	x14, x12, x8
      ac:      	add	x8, x8, #0x10
      b0:      	add	x10, x10, #0x1
      b4:      	sub	x11, x11, #0x1
      b8:      	sturb	w13, [x29, #-0x10]
      bc:      	cmp	x8, #0x200
      c0:      	ldurh	w13, [x29, #-0x10]
      c4:      	and	w15, w13, #0x1
      c8:      	ubfx	w16, w13, #1, #1
      cc:      	strh	w15, [x14]
      d0:      	ubfx	w15, w13, #2, #1
      d4:      	strh	w16, [x14, #0x2]
      d8:      	ubfx	w16, w13, #3, #1
      dc:      	strh	w15, [x14, #0x4]
      e0:      	ubfx	w15, w13, #4, #1
      e4:      	strh	w16, [x14, #0x6]
      e8:      	ubfx	w16, w13, #5, #1
      ec:      	strh	w15, [x14, #0x8]
      f0:      	ubfx	w15, w13, #6, #1
      f4:      	ubfx	w13, w13, #7, #1
      f8:      	strh	w16, [x14, #0xa]
      fc:      	strh	w15, [x14, #0xc]
     100:      	strh	w13, [x14, #0xe]
     104:      	b.ne	0x94 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x94>
     108:      	mov	x1, sp
     10c:      	mov	x0, x19
     110:      	mov	w2, #0x200              // =512
     114:      	bl	0x114 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x114>
     118:      	add	sp, sp, #0x210
     11c:      	ldp	x20, x19, [sp, #0x20]
     120:      	ldr	x28, [sp, #0x10]
     124:      	ldp	x29, x30, [sp], #0x30
     128:      	ret
     12c:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<1>>
     130:      	add	x0, x0, #0x0
     134:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<1>>
     138:      	add	x3, x3, #0x0
     13c:      	mov	w1, #0x237              // =567
     140:      	mov	w2, wzr
     144:      	bl	0x144 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x144>
     148:      	adrp	x2, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<1>>
     14c:      	add	x2, x2, #0x0
     150:      	adrp	x5, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<1>>
     154:      	add	x5, x5, #0x0
     158:      	mov	x1, sp
     15c:      	mov	w0, wzr
     160:      	mov	x3, xzr
     164:      	bl	0x164 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x164>
     168:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<1>>
     16c:      	add	x0, x0, #0x0
     170:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<1>>
     174:      	add	x3, x3, #0x0
     178:      	mov	w1, #0x193              // =403
     17c:      	mov	w2, wzr
     180:      	bl	0x180 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x180>
     184:      	bl	0x184 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x184>

0000000000000000 <<toyos_crypto::mlkem::Poly>::decode::<4>>:
       0:      	stp	x29, x30, [sp, #-0x30]!
       4:      	str	x28, [sp, #0x10]
       8:      	stp	x20, x19, [sp, #0x20]
       c:      	mov	x29, sp
      10:      	sub	sp, sp, #0x210
      14:      	cmp	x1, #0x80
      18:      	str	x1, [sp]
      1c:      	b.ne	0x144 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x144>
      20:      	movi	v0.2d, #0000000000000000
      24:      	mov	x20, x0
      28:      	mov	x19, x8
      2c:      	mov	x8, sp
      30:      	stp	q0, q0, [sp]
      34:      	stp	q0, q0, [sp, #0x20]
      38:      	stp	q0, q0, [sp, #0x40]
      3c:      	stp	q0, q0, [sp, #0x60]
      40:      	stp	q0, q0, [sp, #0x80]
      44:      	stp	q0, q0, [sp, #0xa0]
      48:      	stp	q0, q0, [sp, #0xc0]
      4c:      	stp	q0, q0, [sp, #0xe0]
      50:      	stp	q0, q0, [sp, #0x100]
      54:      	stp	q0, q0, [sp, #0x120]
      58:      	stp	q0, q0, [sp, #0x140]
      5c:      	stp	q0, q0, [sp, #0x160]
      60:      	stp	q0, q0, [sp, #0x180]
      64:      	stp	q0, q0, [sp, #0x1a0]
      68:      	stp	q0, q0, [sp, #0x1c0]
      6c:      	stp	q0, q0, [sp, #0x1e0]
      70:      	add	x0, x8, #0x200
      74:      	mov	x1, sp
      78:      	bl	0x78 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x78>
      7c:      	cbz	w0, 0x164 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x164>
      80:      	sub	x9, x29, #0x10
      84:      	mov	x8, xzr
      88:      	mov	x12, sp
      8c:      	sub	x10, x20, x9
      90:      	sub	x11, x9, x20
      94:      	cmp	x20, x9
      98:      	stp	xzr, xzr, [x29, #-0x10]
      9c:      	csel	x13, x11, x10, lo
      a0:      	cmp	x13, #0x3
      a4:      	b.ls	0x128 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x128>
      a8:      	ldr	w13, [x20], #0x4
      ac:      	add	x14, x12, x8
      b0:      	add	x8, x8, #0x10
      b4:      	add	x10, x10, #0x4
      b8:      	sub	x11, x11, #0x4
      bc:      	and	w15, w13, #0xf
      c0:      	ubfx	w16, w13, #4, #4
      c4:      	cmp	x8, #0x200
      c8:      	strh	w15, [x14]
      cc:      	ubfx	w15, w13, #8, #4
      d0:      	strh	w16, [x14, #0x2]
      d4:      	ubfx	w16, w13, #12, #4
      d8:      	strh	w15, [x14, #0x4]
      dc:      	ubfx	w15, w13, #16, #4
      e0:      	strh	w16, [x14, #0x6]
      e4:      	ubfx	w16, w13, #20, #4
      e8:      	strh	w15, [x14, #0x8]
      ec:      	ubfx	w15, w13, #24, #4
      f0:      	lsr	w13, w13, #28
      f4:      	strh	w16, [x14, #0xa]
      f8:      	strh	w15, [x14, #0xc]
      fc:      	strh	w13, [x14, #0xe]
     100:      	b.ne	0x94 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x94>
     104:      	mov	x1, sp
     108:      	mov	x0, x19
     10c:      	mov	w2, #0x200              // =512
     110:      	bl	0x110 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x110>
     114:      	add	sp, sp, #0x210
     118:      	ldp	x20, x19, [sp, #0x20]
     11c:      	ldr	x28, [sp, #0x10]
     120:      	ldp	x29, x30, [sp], #0x30
     124:      	ret
     128:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<4>>
     12c:      	add	x0, x0, #0x0
     130:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<4>>
     134:      	add	x3, x3, #0x0
     138:      	mov	w1, #0x237              // =567
     13c:      	mov	w2, wzr
     140:      	bl	0x140 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x140>
     144:      	adrp	x2, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<4>>
     148:      	add	x2, x2, #0x0
     14c:      	adrp	x5, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<4>>
     150:      	add	x5, x5, #0x0
     154:      	mov	x1, sp
     158:      	mov	w0, wzr
     15c:      	mov	x3, xzr
     160:      	bl	0x160 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x160>
     164:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<4>>
     168:      	add	x0, x0, #0x0
     16c:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<4>>
     170:      	add	x3, x3, #0x0
     174:      	mov	w1, #0x193              // =403
     178:      	mov	w2, wzr
     17c:      	bl	0x17c <<toyos_crypto::mlkem::Poly>::decode::<4>+0x17c>
     180:      	bl	0x180 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x180>

0000000000000000 <<toyos_crypto::mlkem::Poly>::decode::<10>>:
       0:      	stp	x29, x30, [sp, #-0x30]!
       4:      	str	x28, [sp, #0x10]
       8:      	stp	x20, x19, [sp, #0x20]
       c:      	mov	x29, sp
      10:      	sub	sp, sp, #0x210
      14:      	cmp	x1, #0x140
      18:      	str	x1, [sp]
      1c:      	b.ne	0x154 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x154>
      20:      	movi	v0.2d, #0000000000000000
      24:      	mov	x20, x0
      28:      	mov	x19, x8
      2c:      	mov	x8, sp
      30:      	stp	q0, q0, [sp]
      34:      	stp	q0, q0, [sp, #0x20]
      38:      	stp	q0, q0, [sp, #0x40]
      3c:      	stp	q0, q0, [sp, #0x60]
      40:      	stp	q0, q0, [sp, #0x80]
      44:      	stp	q0, q0, [sp, #0xa0]
      48:      	stp	q0, q0, [sp, #0xc0]
      4c:      	stp	q0, q0, [sp, #0xe0]
      50:      	stp	q0, q0, [sp, #0x100]
      54:      	stp	q0, q0, [sp, #0x120]
      58:      	stp	q0, q0, [sp, #0x140]
      5c:      	stp	q0, q0, [sp, #0x160]
      60:      	stp	q0, q0, [sp, #0x180]
      64:      	stp	q0, q0, [sp, #0x1a0]
      68:      	stp	q0, q0, [sp, #0x1c0]
      6c:      	stp	q0, q0, [sp, #0x1e0]
      70:      	add	x0, x8, #0x200
      74:      	mov	x1, sp
      78:      	bl	0x78 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x78>
      7c:      	cbz	w0, 0x174 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x174>
      80:      	sub	x9, x29, #0x10
      84:      	mov	x8, xzr
      88:      	mov	x12, sp
      8c:      	sub	x10, x20, x9
      90:      	sub	x11, x9, x20
      94:      	cmp	x20, x9
      98:      	stp	xzr, xzr, [x29, #-0x10]
      9c:      	csel	x13, x11, x10, lo
      a0:      	cmp	x13, #0x9
      a4:      	b.ls	0x138 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x138>
      a8:      	ldrh	w13, [x20, #0x8]
      ac:      	ldr	x14, [x20], #0xa
      b0:      	add	x15, x12, x8
      b4:      	add	x8, x8, #0x10
      b8:      	add	x10, x10, #0xa
      bc:      	ubfx	w17, w14, #20, #10
      c0:      	sturh	w13, [x29, #-0x8]
      c4:      	and	w13, w14, #0x3ff
      c8:      	ubfx	w16, w14, #10, #10
      cc:      	strh	w13, [x15]
      d0:      	ubfx	x13, x14, #30, #10
      d4:      	strh	w17, [x15, #0x4]
      d8:      	ldur	x17, [x29, #-0x8]
      dc:      	cmp	x8, #0x200
      e0:      	strh	w16, [x15, #0x2]
      e4:      	ubfx	x16, x14, #40, #10
      e8:      	sub	x11, x11, #0xa
      ec:      	strh	w13, [x15, #0x6]
      f0:      	ubfx	x13, x14, #50, #10
      f4:      	extr	x14, x17, x14, #0x3c
      f8:      	strh	w16, [x15, #0x8]
      fc:      	ubfx	w16, w17, #6, #10
     100:      	strh	w13, [x15, #0xa]
     104:      	and	w13, w14, #0x3ff
     108:      	strh	w16, [x15, #0xe]
     10c:      	strh	w13, [x15, #0xc]
     110:      	b.ne	0x94 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x94>
     114:      	mov	x1, sp
     118:      	mov	x0, x19
     11c:      	mov	w2, #0x200              // =512
     120:      	bl	0x120 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x120>
     124:      	add	sp, sp, #0x210
     128:      	ldp	x20, x19, [sp, #0x20]
     12c:      	ldr	x28, [sp, #0x10]
     130:      	ldp	x29, x30, [sp], #0x30
     134:      	ret
     138:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<10>>
     13c:      	add	x0, x0, #0x0
     140:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<10>>
     144:      	add	x3, x3, #0x0
     148:      	mov	w1, #0x237              // =567
     14c:      	mov	w2, wzr
     150:      	bl	0x150 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x150>
     154:      	adrp	x2, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<10>>
     158:      	add	x2, x2, #0x0
     15c:      	adrp	x5, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<10>>
     160:      	add	x5, x5, #0x0
     164:      	mov	x1, sp
     168:      	mov	w0, wzr
     16c:      	mov	x3, xzr
     170:      	bl	0x170 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x170>
     174:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<10>>
     178:      	add	x0, x0, #0x0
     17c:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<10>>
     180:      	add	x3, x3, #0x0
     184:      	mov	w1, #0x193              // =403
     188:      	mov	w2, wzr
     18c:      	bl	0x18c <<toyos_crypto::mlkem::Poly>::decode::<10>+0x18c>
     190:      	bl	0x190 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x190>

0000000000000000 <<toyos_crypto::mlkem::Poly>::decode::<12>>:
       0:      	stp	x29, x30, [sp, #-0x30]!
       4:      	str	x28, [sp, #0x10]
       8:      	stp	x20, x19, [sp, #0x20]
       c:      	mov	x29, sp
      10:      	sub	sp, sp, #0x210
      14:      	cmp	x1, #0x180
      18:      	str	x1, [sp]
      1c:      	b.ne	0x154 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x154>
      20:      	movi	v0.2d, #0000000000000000
      24:      	mov	x20, x0
      28:      	mov	x19, x8
      2c:      	mov	x8, sp
      30:      	stp	q0, q0, [sp]
      34:      	stp	q0, q0, [sp, #0x20]
      38:      	stp	q0, q0, [sp, #0x40]
      3c:      	stp	q0, q0, [sp, #0x60]
      40:      	stp	q0, q0, [sp, #0x80]
      44:      	stp	q0, q0, [sp, #0xa0]
      48:      	stp	q0, q0, [sp, #0xc0]
      4c:      	stp	q0, q0, [sp, #0xe0]
      50:      	stp	q0, q0, [sp, #0x100]
      54:      	stp	q0, q0, [sp, #0x120]
      58:      	stp	q0, q0, [sp, #0x140]
      5c:      	stp	q0, q0, [sp, #0x160]
      60:      	stp	q0, q0, [sp, #0x180]
      64:      	stp	q0, q0, [sp, #0x1a0]
      68:      	stp	q0, q0, [sp, #0x1c0]
      6c:      	stp	q0, q0, [sp, #0x1e0]
      70:      	add	x0, x8, #0x200
      74:      	mov	x1, sp
      78:      	bl	0x78 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x78>
      7c:      	cbz	w0, 0x174 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x174>
      80:      	sub	x9, x29, #0x10
      84:      	mov	x8, xzr
      88:      	mov	x12, sp
      8c:      	sub	x10, x20, x9
      90:      	sub	x11, x9, x20
      94:      	cmp	x20, x9
      98:      	stp	xzr, xzr, [x29, #-0x10]
      9c:      	csel	x13, x11, x10, lo
      a0:      	cmp	x13, #0xb
      a4:      	b.ls	0x138 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x138>
      a8:      	ldr	w13, [x20, #0x8]
      ac:      	ldr	x14, [x20], #0xc
      b0:      	add	x15, x12, x8
      b4:      	add	x8, x8, #0x10
      b8:      	add	x10, x10, #0xc
      bc:      	ubfx	w16, w14, #12, #12
      c0:      	stur	w13, [x29, #-0x8]
      c4:      	and	w13, w14, #0xfff
      c8:      	ubfx	x17, x14, #24, #12
      cc:      	strh	w13, [x15]
      d0:      	ubfx	x13, x14, #36, #12
      d4:      	strh	w16, [x15, #0x2]
      d8:      	ldur	x16, [x29, #-0x8]
      dc:      	cmp	x8, #0x200
      e0:      	strh	w17, [x15, #0x4]
      e4:      	ubfx	x17, x14, #48, #12
      e8:      	sub	x11, x11, #0xc
      ec:      	strh	w13, [x15, #0x6]
      f0:      	ubfx	w13, w16, #8, #12
      f4:      	extr	x14, x16, x14, #0x3c
      f8:      	lsr	w16, w16, #20
      fc:      	strh	w17, [x15, #0x8]
     100:      	strh	w13, [x15, #0xc]
     104:      	and	w13, w14, #0xfff
     108:      	strh	w16, [x15, #0xe]
     10c:      	strh	w13, [x15, #0xa]
     110:      	b.ne	0x94 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x94>
     114:      	mov	x1, sp
     118:      	mov	x0, x19
     11c:      	mov	w2, #0x200              // =512
     120:      	bl	0x120 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x120>
     124:      	add	sp, sp, #0x210
     128:      	ldp	x20, x19, [sp, #0x20]
     12c:      	ldr	x28, [sp, #0x10]
     130:      	ldp	x29, x30, [sp], #0x30
     134:      	ret
     138:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<12>>
     13c:      	add	x0, x0, #0x0
     140:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<12>>
     144:      	add	x3, x3, #0x0
     148:      	mov	w1, #0x237              // =567
     14c:      	mov	w2, wzr
     150:      	bl	0x150 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x150>
     154:      	adrp	x2, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<12>>
     158:      	add	x2, x2, #0x0
     15c:      	adrp	x5, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<12>>
     160:      	add	x5, x5, #0x0
     164:      	mov	x1, sp
     168:      	mov	w0, wzr
     16c:      	mov	x3, xzr
     170:      	bl	0x170 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x170>
     174:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<12>>
     178:      	add	x0, x0, #0x0
     17c:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<12>>
     180:      	add	x3, x3, #0x0
     184:      	mov	w1, #0x193              // =403
     188:      	mov	w2, wzr
     18c:      	bl	0x18c <<toyos_crypto::mlkem::Poly>::decode::<12>+0x18c>
     190:      	bl	0x190 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x190>

0000000000000000 <<toyos_crypto::mlkem::Poly>::encode::<1>>:
       0:      	sub	sp, sp, #0x30
       4:      	stp	x29, x30, [sp, #0x10]
       8:      	stp	x20, x19, [sp, #0x20]
       c:      	add	x29, sp, #0x10
      10:      	cmp	x2, #0x20
      14:      	str	x2, [sp]
      18:      	b.ne	0xdc <<toyos_crypto::mlkem::Poly>::encode::<1>+0xdc>
      1c:      	mov	x20, x0
      20:      	mov	x19, x1
      24:      	add	x0, x0, #0x200
      28:      	mov	x1, x20
      2c:      	bl	0x2c <<toyos_crypto::mlkem::Poly>::encode::<1>+0x2c>
      30:      	cbz	w0, 0xfc <<toyos_crypto::mlkem::Poly>::encode::<1>+0xfc>
      34:      	mov	x8, sp
      38:      	add	x11, x20, #0x8
      3c:      	mov	w12, #0x20              // =32
      40:      	sub	x9, x8, x19
      44:      	sub	x10, x19, x8
      48:      	ldrh	w13, [x11]
      4c:      	ldrh	w14, [x11, #0x2]
      50:      	cmp	x8, x19
      54:      	ldurh	w15, [x11, #-0x2]
      58:      	lsl	x13, x13, #4
      5c:      	orr	x13, x13, x14, lsl #5
      60:      	ldurh	w14, [x11, #-0x4]
      64:      	orr	x13, x13, x15, lsl #3
      68:      	ldurh	w15, [x11, #-0x8]
      6c:      	orr	x13, x13, x14, lsl #2
      70:      	ldurh	w14, [x11, #-0x6]
      74:      	orr	x13, x13, x15
      78:      	ldrh	w15, [x11, #0x4]
      7c:      	orr	x13, x13, x14, lsl #1
      80:      	ldrh	w14, [x11, #0x6]
      84:      	orr	x13, x13, x15, lsl #6
      88:      	orr	x13, x13, x14, lsl #7
      8c:      	csel	x14, x10, x9, lo
      90:      	stp	x13, xzr, [sp]
      94:      	cbz	x14, 0xc0 <<toyos_crypto::mlkem::Poly>::encode::<1>+0xc0>
      98:      	subs	x12, x12, #0x1
      9c:      	add	x11, x11, #0x10
      a0:      	sub	x9, x9, #0x1
      a4:      	add	x10, x10, #0x1
      a8:      	strb	w13, [x19], #0x1
      ac:      	b.ne	0x48 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x48>
      b0:      	ldp	x20, x19, [sp, #0x20]
      b4:      	ldp	x29, x30, [sp, #0x10]
      b8:      	add	sp, sp, #0x30
      bc:      	ret
      c0:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<1>>
      c4:      	add	x0, x0, #0x0
      c8:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<1>>
      cc:      	add	x3, x3, #0x0
      d0:      	mov	w1, #0x237              // =567
      d4:      	mov	w2, wzr
      d8:      	bl	0xd8 <<toyos_crypto::mlkem::Poly>::encode::<1>+0xd8>
      dc:      	adrp	x2, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<1>>
      e0:      	add	x2, x2, #0x0
      e4:      	adrp	x5, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<1>>
      e8:      	add	x5, x5, #0x0
      ec:      	mov	x1, sp
      f0:      	mov	w0, wzr
      f4:      	mov	x3, xzr
      f8:      	bl	0xf8 <<toyos_crypto::mlkem::Poly>::encode::<1>+0xf8>
      fc:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<1>>
     100:      	add	x0, x0, #0x0
     104:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<1>>
     108:      	add	x3, x3, #0x0
     10c:      	mov	w1, #0x193              // =403
     110:      	mov	w2, wzr
     114:      	bl	0x114 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x114>
     118:      	bl	0x118 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x118>

0000000000000000 <<toyos_crypto::mlkem::Poly>::encode::<4>>:
       0:      	sub	sp, sp, #0x30
       4:      	stp	x29, x30, [sp, #0x10]
       8:      	stp	x20, x19, [sp, #0x20]
       c:      	add	x29, sp, #0x10
      10:      	cmp	x2, #0x80
      14:      	str	x2, [sp]
      18:      	b.ne	0xdc <<toyos_crypto::mlkem::Poly>::encode::<4>+0xdc>
      1c:      	mov	x20, x0
      20:      	mov	x19, x1
      24:      	add	x0, x0, #0x200
      28:      	mov	x1, x20
      2c:      	bl	0x2c <<toyos_crypto::mlkem::Poly>::encode::<4>+0x2c>
      30:      	cbz	w0, 0xfc <<toyos_crypto::mlkem::Poly>::encode::<4>+0xfc>
      34:      	mov	x8, sp
      38:      	add	x11, x20, #0x8
      3c:      	mov	w12, #0x20              // =32
      40:      	sub	x9, x8, x19
      44:      	sub	x10, x19, x8
      48:      	ldurh	w13, [x11, #-0x8]
      4c:      	ldurh	w14, [x11, #-0x6]
      50:      	cmp	x8, x19
      54:      	orr	x13, x13, x14, lsl #4
      58:      	ldurh	w14, [x11, #-0x4]
      5c:      	orr	x13, x13, x14, lsl #8
      60:      	ldurh	w14, [x11, #-0x2]
      64:      	orr	x13, x13, x14, lsl #12
      68:      	ldrh	w14, [x11]
      6c:      	orr	x13, x13, x14, lsl #16
      70:      	ldrh	w14, [x11, #0x2]
      74:      	orr	x13, x13, x14, lsl #20
      78:      	ldrh	w14, [x11, #0x4]
      7c:      	orr	x13, x13, x14, lsl #24
      80:      	ldrh	w14, [x11, #0x6]
      84:      	orr	x13, x13, x14, lsl #28
      88:      	csel	x14, x10, x9, lo
      8c:      	cmp	x14, #0x3
      90:      	stp	x13, xzr, [sp]
      94:      	b.ls	0xc0 <<toyos_crypto::mlkem::Poly>::encode::<4>+0xc0>
      98:      	subs	x12, x12, #0x1
      9c:      	add	x11, x11, #0x10
      a0:      	sub	x9, x9, #0x4
      a4:      	add	x10, x10, #0x4
      a8:      	str	w13, [x19], #0x4
      ac:      	b.ne	0x48 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x48>
      b0:      	ldp	x20, x19, [sp, #0x20]
      b4:      	ldp	x29, x30, [sp, #0x10]
      b8:      	add	sp, sp, #0x30
      bc:      	ret
      c0:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<4>>
      c4:      	add	x0, x0, #0x0
      c8:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<4>>
      cc:      	add	x3, x3, #0x0
      d0:      	mov	w1, #0x237              // =567
      d4:      	mov	w2, wzr
      d8:      	bl	0xd8 <<toyos_crypto::mlkem::Poly>::encode::<4>+0xd8>
      dc:      	adrp	x2, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<4>>
      e0:      	add	x2, x2, #0x0
      e4:      	adrp	x5, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<4>>
      e8:      	add	x5, x5, #0x0
      ec:      	mov	x1, sp
      f0:      	mov	w0, wzr
      f4:      	mov	x3, xzr
      f8:      	bl	0xf8 <<toyos_crypto::mlkem::Poly>::encode::<4>+0xf8>
      fc:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<4>>
     100:      	add	x0, x0, #0x0
     104:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<4>>
     108:      	add	x3, x3, #0x0
     10c:      	mov	w1, #0x193              // =403
     110:      	mov	w2, wzr
     114:      	bl	0x114 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x114>
     118:      	bl	0x118 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x118>

0000000000000000 <<toyos_crypto::mlkem::Poly>::encode::<10>>:
       0:      	sub	sp, sp, #0x30
       4:      	stp	x29, x30, [sp, #0x10]
       8:      	stp	x20, x19, [sp, #0x20]
       c:      	add	x29, sp, #0x10
      10:      	cmp	x2, #0x140
      14:      	str	x2, [sp]
      18:      	b.ne	0xf4 <<toyos_crypto::mlkem::Poly>::encode::<10>+0xf4>
      1c:      	mov	x20, x0
      20:      	mov	x19, x1
      24:      	add	x0, x0, #0x200
      28:      	mov	x1, x20
      2c:      	bl	0x2c <<toyos_crypto::mlkem::Poly>::encode::<10>+0x2c>
      30:      	cbz	w0, 0x114 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x114>
      34:      	mov	x8, sp
      38:      	add	x11, x20, #0x8
      3c:      	mov	w12, #0x20              // =32
      40:      	sub	x9, x8, x19
      44:      	sub	x10, x19, x8
      48:      	ldurh	w13, [x11, #-0x8]
      4c:      	ldurh	w14, [x11, #-0x6]
      50:      	cmp	x8, x19
      54:      	ldrh	w15, [x11, #0x2]
      58:      	ldrh	w17, [x11, #0x4]
      5c:      	orr	x13, x13, x14, lsl #10
      60:      	ldurh	w14, [x11, #-0x4]
      64:      	lsr	x16, x15, #14
      68:      	orr	x13, x13, x14, lsl #20
      6c:      	ldurh	w14, [x11, #-0x2]
      70:      	orr	x13, x13, x14, lsl #30
      74:      	ldrh	w14, [x11]
      78:      	orr	x13, x13, x14, lsl #40
      7c:      	orr	x14, x16, x17, lsr #4
      80:      	ldrh	w16, [x11, #0x6]
      84:      	orr	x13, x13, x15, lsl #50
      88:      	orr	x14, x14, x16, lsl #6
      8c:      	csel	x15, x10, x9, lo
      90:      	cmp	x15, #0x9
      94:      	orr	x13, x13, x17, lsl #60
      98:      	stp	x13, x14, [sp]
      9c:      	b.ls	0xd8 <<toyos_crypto::mlkem::Poly>::encode::<10>+0xd8>
      a0:      	ldr	x13, [sp]
      a4:      	ldrh	w14, [sp, #0x8]
      a8:      	add	x11, x11, #0x10
      ac:      	subs	x12, x12, #0x1
      b0:      	sub	x9, x9, #0xa
      b4:      	add	x10, x10, #0xa
      b8:      	str	x13, [x19]
      bc:      	strh	w14, [x19, #0x8]
      c0:      	add	x19, x19, #0xa
      c4:      	b.ne	0x48 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x48>
      c8:      	ldp	x20, x19, [sp, #0x20]
      cc:      	ldp	x29, x30, [sp, #0x10]
      d0:      	add	sp, sp, #0x30
      d4:      	ret
      d8:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<10>>
      dc:      	add	x0, x0, #0x0
      e0:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<10>>
      e4:      	add	x3, x3, #0x0
      e8:      	mov	w1, #0x237              // =567
      ec:      	mov	w2, wzr
      f0:      	bl	0xf0 <<toyos_crypto::mlkem::Poly>::encode::<10>+0xf0>
      f4:      	adrp	x2, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<10>>
      f8:      	add	x2, x2, #0x0
      fc:      	adrp	x5, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<10>>
     100:      	add	x5, x5, #0x0
     104:      	mov	x1, sp
     108:      	mov	w0, wzr
     10c:      	mov	x3, xzr
     110:      	bl	0x110 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x110>
     114:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<10>>
     118:      	add	x0, x0, #0x0
     11c:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<10>>
     120:      	add	x3, x3, #0x0
     124:      	mov	w1, #0x193              // =403
     128:      	mov	w2, wzr
     12c:      	bl	0x12c <<toyos_crypto::mlkem::Poly>::encode::<10>+0x12c>
     130:      	bl	0x130 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x130>

0000000000000000 <<&[toyos_crypto::mlkem::Poly; 3] as core::iter::traits::collect::IntoIterator>::into_iter>:
       0:      	stp	x29, x30, [sp, #-0x10]!
       4:      	mov	x29, sp
       8:      	add	x1, x0, #0x600
       c:      	ldp	x29, x30, [sp], #0x10
      10:      	ret

~/.claude/jobs/2280e09e/tmp/scratchpad/agents/mlkem/target-rlib/aarch64-unknown-toyos/toyos/libtoyos_crypto.rlib(toyos_crypto-4ee49e0b7450663d.2n6og7u0h10lomjwz9hpxjcha.0vpx7cd.rcgu.o):	file format elf64-littleaarch64

0000000000000000 <<core::iter::adapters::zip::Zip<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>>>::new>:
       0:      	stp	x29, x30, [sp, #-0x40]!
       4:      	str	x23, [sp, #0x10]
       8:      	stp	x22, x21, [sp, #0x20]
       c:      	stp	x20, x19, [sp, #0x30]
      10:      	mov	x29, sp
      14:      	mov	x20, x3
      18:      	mov	x21, x2
      1c:      	mov	x22, x1
      20:      	mov	x23, x0
      24:      	mov	x19, x8
      28:      	mov	x0, x1
      2c:      	mov	x1, x23
      30:      	bl	0x30 <<core::iter::adapters::zip::Zip<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>>>::new+0x30>
      34:      	tbz	w0, #0x0, 0x80 <<core::iter::adapters::zip::Zip<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>>>::new+0x80>
      38:      	mov	x0, x20
      3c:      	mov	x1, x21
      40:      	bl	0x40 <<core::iter::adapters::zip::Zip<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>>>::new+0x40>
      44:      	tbz	w0, #0x0, 0x80 <<core::iter::adapters::zip::Zip<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>>>::new+0x80>
      48:      	sub	x8, x22, x23
      4c:      	sub	x9, x20, x21
      50:      	stp	x23, x22, [x19]
      54:      	lsr	x8, x8, #9
      58:      	lsr	x9, x9, #9
      5c:      	stp	x21, x20, [x19, #0x10]
      60:      	cmp	x9, x8
      64:      	csel	x8, x9, x8, lo
      68:      	stp	xzr, x8, [x19, #0x20]
      6c:      	ldp	x20, x19, [sp, #0x30]
      70:      	ldr	x23, [sp, #0x10]
      74:      	ldp	x22, x21, [sp, #0x20]
      78:      	ldp	x29, x30, [sp], #0x40
      7c:      	ret
      80:      	adrp	x0, 0x0 <<core::iter::adapters::zip::Zip<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>>>::new>
      84:      	add	x0, x0, #0x0
      88:      	adrp	x3, 0x0 <<core::iter::adapters::zip::Zip<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>>>::new>
      8c:      	add	x3, x3, #0x0
      90:      	mov	w1, #0x193              // =403
      94:      	mov	w2, wzr
      98:      	bl	0x98 <<core::iter::adapters::zip::Zip<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>>>::new+0x98>
      9c:      	bl	0x9c <<core::iter::adapters::zip::Zip<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>>>::new+0x9c>
      a0:      	bl	0xa0 <<core::iter::adapters::zip::Zip<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::Iter<toyos_crypto::mlkem::Poly>, core::slice::iter::Iter<toyos_crypto::mlkem::Poly>>>::new+0xa0>

0000000000000000 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>:
       0:      	stp	x29, x30, [sp, #-0x10]!
       4:      	mov	x29, sp
       8:      	ldp	x9, x8, [x0, #0x8]
       c:      	cmp	x8, x9
      10:      	b.hi	0x50 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x50>
      14:      	cbz	x8, 0x48 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x48>
      18:      	ldr	x9, [x0]
      1c:      	mov	x10, xzr
      20:      	mov	x11, xzr
      24:      	mov	x12, x11
      28:      	add	x11, x11, #0x2
      2c:      	cmp	x11, #0x200
      30:      	strh	wzr, [x9, x12]
      34:      	b.ne	0x24 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x24>
      38:      	add	x10, x10, #0x1
      3c:      	add	x9, x9, #0x200
      40:      	cmp	x10, x8
      44:      	b.ne	0x20 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x20>
      48:      	ldp	x29, x30, [sp], #0x10
      4c:      	ret
      50:      	adrp	x0, 0x0 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>
      54:      	add	x0, x0, #0x0
      58:      	adrp	x3, 0x0 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>
      5c:      	add	x3, x3, #0x0
      60:      	mov	w1, #0x1b5              // =437
      64:      	mov	w2, wzr
      68:      	bl	0x68 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x68>

0000000000000000 <<toyos_crypto::mlkem::SharedSecret>::as_bytes>:
       0:      	stp	x29, x30, [sp, #-0x10]!
       4:      	mov	x29, sp
       8:      	ldp	x29, x30, [sp], #0x10
       c:      	ret

0000000000000000 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes>:
       0:      	stp	x29, x30, [sp, #-0x30]!
       4:      	stp	x28, x21, [sp, #0x10]
       8:      	stp	x20, x19, [sp, #0x20]
       c:      	mov	x29, sp
      10:      	sub	sp, sp, #0x200
      14:      	cmp	x1, #0x4a0
      18:      	mov	x19, x8
      1c:      	b.ne	0x54 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x54>
      20:      	mov	x8, sp
      24:      	mov	w1, #0x180              // =384
      28:      	mov	x20, x0
      2c:      	mov	x21, sp
      30:      	bl	0x30 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x30>
      34:      	mov	x8, xzr
      38:      	cmp	x8, #0x200
      3c:      	b.eq	0x60 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x60>
      40:      	ldrsh	w9, [x21, x8]
      44:      	add	x8, x8, #0x2
      48:      	cmp	w9, #0xd00
      4c:      	b.le	0x38 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x38>
      50:      	b	0xfc <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0xfc>
      54:      	mov	w8, #0x1                // =1
      58:      	strh	w8, [x19]
      5c:      	b	0x120 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x120>
      60:      	mov	x8, xzr
      64:      	mov	x9, sp
      68:      	mov	x10, x8
      6c:      	add	x8, x8, #0x2
      70:      	cmp	x8, #0x200
      74:      	strh	wzr, [x9, x10]
      78:      	b.ne	0x68 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x68>
      7c:      	mov	x8, sp
      80:      	add	x0, x20, #0x180
      84:      	mov	w1, #0x180              // =384
      88:      	mov	x21, sp
      8c:      	bl	0x8c <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x8c>
      90:      	mov	x8, xzr
      94:      	cmp	x8, #0x200
      98:      	b.eq	0xb0 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0xb0>
      9c:      	ldrsh	w9, [x21, x8]
      a0:      	add	x8, x8, #0x2
      a4:      	cmp	w9, #0xd00
      a8:      	b.le	0x94 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x94>
      ac:      	b	0xfc <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0xfc>
      b0:      	mov	x8, xzr
      b4:      	mov	x9, sp
      b8:      	mov	x10, x8
      bc:      	add	x8, x8, #0x2
      c0:      	cmp	x8, #0x200
      c4:      	strh	wzr, [x9, x10]
      c8:      	b.ne	0xb8 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0xb8>
      cc:      	mov	x8, sp
      d0:      	add	x0, x20, #0x300
      d4:      	mov	w1, #0x180              // =384
      d8:      	mov	x21, sp
      dc:      	bl	0xdc <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0xdc>
      e0:      	mov	x8, xzr
      e4:      	cmp	x8, #0x200
      e8:      	b.eq	0x134 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x134>
      ec:      	ldrsh	w9, [x21, x8]
      f0:      	add	x8, x8, #0x2
      f4:      	cmp	w9, #0xd00
      f8:      	b.le	0xe4 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0xe4>
      fc:      	mov	w9, #0x201              // =513
     100:      	mov	x8, xzr
     104:      	strh	w9, [x19]
     108:      	mov	x9, sp
     10c:      	mov	x10, x8
     110:      	add	x8, x8, #0x2
     114:      	cmp	x8, #0x200
     118:      	strh	wzr, [x9, x10]
     11c:      	b.ne	0x10c <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x10c>
     120:      	add	sp, sp, #0x200
     124:      	ldp	x20, x19, [sp, #0x20]
     128:      	ldp	x28, x21, [sp, #0x10]
     12c:      	ldp	x29, x30, [sp], #0x30
     130:      	ret
     134:      	mov	x8, xzr
     138:      	mov	x9, sp
     13c:      	mov	x10, x8
     140:      	add	x8, x8, #0x2
     144:      	cmp	x8, #0x200
     148:      	strh	wzr, [x9, x10]
     14c:      	b.ne	0x13c <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x13c>
     150:      	add	x0, x19, #0x1
     154:      	mov	x1, x20
     158:      	mov	w2, #0x4a0              // =1184
     15c:      	bl	0x15c <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x15c>
     160:      	strb	wzr, [x19]
     164:      	b	0x120 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x120>

0000000000000000 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>:
       0:      	stp	x29, x30, [sp, #-0x60]!
       4:      	stp	x28, x27, [sp, #0x10]
       8:      	stp	x26, x25, [sp, #0x20]
       c:      	stp	x24, x23, [sp, #0x30]
      10:      	stp	x22, x21, [sp, #0x40]
      14:      	stp	x20, x19, [sp, #0x50]
      18:      	mov	x29, sp
      1c:      	sub	sp, sp, #0x1, lsl #12   // =0x1000
      20:      	str	xzr, [sp]
      24:      	sub	sp, sp, #0xe70
      28:      	str	xzr, [sp]
      2c:      	mov	x21, x2
      30:      	mov	x22, x0
      34:      	stp	x8, x1, [sp]
      38:      	add	x8, sp, #0x1, lsl #12   // =0x1000
      3c:      	mov	w9, #0x3                // =3
      40:      	add	x8, x8, #0x268
      44:      	str	x9, [sp, #0x1870]
      48:      	str	x8, [sp, #0x1868]
      4c:      	add	x8, sp, #0xa50
      50:      	mov	x0, x2
      54:      	mov	w1, wzr
      58:      	mov	x20, xzr
      5c:      	bl	0x5c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5c>
      60:      	add	x8, sp, #0x610
      64:      	add	x0, sp, #0xa50
      68:      	mov	x20, xzr
      6c:      	bl	0x6c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x6c>
      70:      	add	x0, sp, #0x1, lsl #12   // =0x1000
      74:      	add	x1, sp, #0x610
      78:      	mov	w2, #0x200              // =512
      7c:      	add	x0, x0, #0xc68
      80:      	bl	0x80 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x80>
      84:      	add	x0, sp, #0x1, lsl #12   // =0x1000
      88:      	add	x1, sp, #0x1, lsl #12   // =0x1000
      8c:      	mov	w2, #0x200              // =512
      90:      	add	x0, x0, #0xa68
      94:      	add	x1, x1, #0xc68
      98:      	bl	0x98 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x98>
      9c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
      a0:      	add	x0, sp, #0x10
      a4:      	mov	w2, #0x200              // =512
      a8:      	add	x1, x1, #0xa68
      ac:      	bl	0xac <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xac>
      b0:      	add	x0, sp, #0x1, lsl #12   // =0x1000
      b4:      	add	x1, sp, #0x10
      b8:      	mov	w2, #0x200              // =512
      bc:      	add	x0, x0, #0x268
      c0:      	bl	0xc0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc0>
      c4:      	mov	w20, #0x1               // =1
      c8:      	add	x8, sp, #0xa50
      cc:      	mov	x0, x21
      d0:      	mov	w1, #0x1                // =1
      d4:      	bl	0xd4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd4>
      d8:      	mov	w20, #0x1               // =1
      dc:      	add	x8, sp, #0x610
      e0:      	add	x0, sp, #0xa50
      e4:      	bl	0xe4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xe4>
      e8:      	add	x0, sp, #0x1, lsl #12   // =0x1000
      ec:      	add	x1, sp, #0x610
      f0:      	mov	w2, #0x200              // =512
      f4:      	add	x0, x0, #0xc68
      f8:      	bl	0xf8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xf8>
      fc:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     100:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     104:      	mov	w2, #0x200              // =512
     108:      	add	x0, x0, #0xa68
     10c:      	add	x1, x1, #0xc68
     110:      	bl	0x110 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x110>
     114:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     118:      	add	x0, sp, #0x10
     11c:      	mov	w2, #0x200              // =512
     120:      	add	x1, x1, #0xa68
     124:      	bl	0x124 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x124>
     128:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     12c:      	add	x1, sp, #0x10
     130:      	mov	w2, #0x200              // =512
     134:      	add	x8, x8, #0x268
     138:      	add	x0, x8, #0x200
     13c:      	bl	0x13c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x13c>
     140:      	mov	w20, #0x2               // =2
     144:      	add	x8, sp, #0xa50
     148:      	mov	x0, x21
     14c:      	mov	w1, #0x2                // =2
     150:      	bl	0x150 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x150>
     154:      	mov	w20, #0x2               // =2
     158:      	add	x8, sp, #0x610
     15c:      	add	x0, sp, #0xa50
     160:      	add	x25, sp, #0xa50
     164:      	bl	0x164 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x164>
     168:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     16c:      	add	x1, sp, #0x610
     170:      	mov	w2, #0x200              // =512
     174:      	add	x0, x0, #0xc68
     178:      	add	x26, sp, #0x1, lsl #12  // =0x1000
     17c:      	add	x26, x26, #0xc68
     180:      	bl	0x180 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x180>
     184:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     188:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     18c:      	mov	w2, #0x200              // =512
     190:      	add	x0, x0, #0xa68
     194:      	add	x1, x1, #0xc68
     198:      	bl	0x198 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x198>
     19c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     1a0:      	add	x0, sp, #0x10
     1a4:      	mov	w2, #0x200              // =512
     1a8:      	add	x1, x1, #0xa68
     1ac:      	bl	0x1ac <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1ac>
     1b0:      	add	x27, sp, #0x1, lsl #12  // =0x1000
     1b4:      	add	x1, sp, #0x10
     1b8:      	mov	w2, #0x200              // =512
     1bc:      	add	x27, x27, #0x268
     1c0:      	add	x0, x27, #0x400
     1c4:      	bl	0x1c4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1c4>
     1c8:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     1cc:      	add	x0, sp, #0x10
     1d0:      	mov	w2, #0x600              // =1536
     1d4:      	add	x1, x1, #0x268
     1d8:      	bl	0x1d8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1d8>
     1dc:      	add	x0, sp, #0x610
     1e0:      	mov	w1, wzr
     1e4:      	mov	w2, #0x440              // =1088
     1e8:      	bl	0x1e8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1e8>
     1ec:      	mov	x23, xzr
     1f0:      	add	x28, x25, #0x200
     1f4:      	add	x19, x25, #0x400
     1f8:      	mov	w24, #0x140             // =320
     1fc:      	mov	w8, #0x3                // =3
     200:      	str	x27, [sp, #0x1050]
     204:      	str	x8, [sp, #0x1058]
     208:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     20c:      	add	x0, x22, #0x480
     210:      	mov	x1, xzr
     214:      	add	x8, x8, #0xa68
     218:      	mov	x2, x23
     21c:      	mov	x20, xzr
     220:      	bl	0x220 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x220>
     224:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     228:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     22c:      	mov	w2, #0x200              // =512
     230:      	add	x0, x0, #0x868
     234:      	add	x1, x1, #0xa68
     238:      	bl	0x238 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x238>
     23c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     240:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     244:      	mov	w2, #0x200              // =512
     248:      	add	x0, x0, #0x68
     24c:      	add	x1, x1, #0x868
     250:      	bl	0x250 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x250>
     254:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     258:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     25c:      	mov	w2, #0x200              // =512
     260:      	add	x0, x0, #0xc68
     264:      	add	x1, x1, #0x68
     268:      	bl	0x268 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x268>
     26c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     270:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     274:      	mov	w2, #0x200              // =512
     278:      	add	x0, x0, #0x268
     27c:      	add	x1, x1, #0xc68
     280:      	bl	0x280 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x280>
     284:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     288:      	add	x0, x22, #0x480
     28c:      	mov	w1, #0x1                // =1
     290:      	add	x8, x8, #0xa68
     294:      	mov	x2, x23
     298:      	mov	w20, #0x1               // =1
     29c:      	bl	0x29c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x29c>
     2a0:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     2a4:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     2a8:      	mov	w2, #0x200              // =512
     2ac:      	add	x0, x0, #0x868
     2b0:      	add	x1, x1, #0xa68
     2b4:      	bl	0x2b4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x2b4>
     2b8:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     2bc:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     2c0:      	mov	w2, #0x200              // =512
     2c4:      	add	x0, x0, #0x68
     2c8:      	add	x1, x1, #0x868
     2cc:      	bl	0x2cc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x2cc>
     2d0:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     2d4:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     2d8:      	mov	w2, #0x200              // =512
     2dc:      	add	x0, x0, #0xc68
     2e0:      	add	x1, x1, #0x68
     2e4:      	bl	0x2e4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x2e4>
     2e8:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     2ec:      	add	x0, x27, #0x200
     2f0:      	mov	w2, #0x200              // =512
     2f4:      	add	x1, x1, #0xc68
     2f8:      	bl	0x2f8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x2f8>
     2fc:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     300:      	add	x0, x22, #0x480
     304:      	mov	w1, #0x2                // =2
     308:      	add	x8, x8, #0xa68
     30c:      	mov	x2, x23
     310:      	mov	w20, #0x2               // =2
     314:      	bl	0x314 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x314>
     318:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     31c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     320:      	mov	w2, #0x200              // =512
     324:      	add	x0, x0, #0x868
     328:      	add	x1, x1, #0xa68
     32c:      	bl	0x32c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x32c>
     330:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     334:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     338:      	mov	w2, #0x200              // =512
     33c:      	add	x0, x0, #0x68
     340:      	add	x1, x1, #0x868
     344:      	bl	0x344 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x344>
     348:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     34c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     350:      	mov	w2, #0x200              // =512
     354:      	add	x0, x0, #0xc68
     358:      	add	x1, x1, #0x68
     35c:      	bl	0x35c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x35c>
     360:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     364:      	add	x0, x27, #0x400
     368:      	mov	w2, #0x200              // =512
     36c:      	add	x1, x1, #0xc68
     370:      	bl	0x370 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x370>
     374:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     378:      	add	x0, sp, #0xa50
     37c:      	mov	w2, #0x600              // =1536
     380:      	add	x1, x1, #0x268
     384:      	bl	0x384 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x384>
     388:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     38c:      	add	x0, sp, #0xa50
     390:      	add	x1, sp, #0x10
     394:      	add	x8, x8, #0x268
     398:      	bl	0x398 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x398>
     39c:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     3a0:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     3a4:      	add	x8, x8, #0xc68
     3a8:      	add	x0, x0, #0x268
     3ac:      	bl	0x3ac <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3ac>
     3b0:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     3b4:      	add	w1, w23, #0x3
     3b8:      	mov	x0, x21
     3bc:      	add	x8, x8, #0x268
     3c0:      	bl	0x3c0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3c0>
     3c4:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     3c8:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     3cc:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     3d0:      	add	x8, x8, #0xa68
     3d4:      	add	x0, x0, #0xc68
     3d8:      	add	x1, x1, #0x268
     3dc:      	bl	0x3dc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3dc>
     3e0:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     3e4:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     3e8:      	mov	w1, #0xa                // =10
     3ec:      	add	x8, x8, #0xc68
     3f0:      	add	x0, x0, #0xa68
     3f4:      	bl	0x3f4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3f4>
     3f8:      	add	x8, sp, #0x610
     3fc:      	madd	x1, x23, x24, x8
     400:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     404:      	mov	w2, #0x140              // =320
     408:      	add	x0, x0, #0xc68
     40c:      	bl	0x40c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x40c>
     410:      	mov	x8, xzr
     414:      	add	x23, x23, #0x1
     418:      	mov	x9, x8
     41c:      	add	x8, x8, #0x2
     420:      	cmp	x8, #0x200
     424:      	strh	wzr, [x26, x9]
     428:      	b.ne	0x418 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x418>
     42c:      	mov	x8, xzr
     430:      	mov	x9, x8
     434:      	add	x8, x8, #0x2
     438:      	cmp	x8, #0x200
     43c:      	strh	wzr, [x27, x9]
     440:      	b.ne	0x430 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x430>
     444:      	mov	x8, xzr
     448:      	mov	x9, x8
     44c:      	add	x8, x8, #0x2
     450:      	cmp	x8, #0x200
     454:      	strh	wzr, [x25, x9]
     458:      	b.ne	0x448 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x448>
     45c:      	mov	x8, xzr
     460:      	mov	x9, x8
     464:      	add	x8, x8, #0x2
     468:      	cmp	x8, #0x200
     46c:      	strh	wzr, [x28, x9]
     470:      	b.ne	0x460 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x460>
     474:      	mov	x8, xzr
     478:      	mov	x9, x8
     47c:      	add	x8, x8, #0x2
     480:      	cmp	x8, #0x200
     484:      	strh	wzr, [x19, x9]
     488:      	b.ne	0x478 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x478>
     48c:      	cmp	x23, #0x3
     490:      	b.ne	0x1fc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1fc>
     494:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     498:      	mov	w9, #0x3                // =3
     49c:      	add	x8, x8, #0x268
     4a0:      	str	x9, [sp, #0x1070]
     4a4:      	str	x8, [sp, #0x1068]
     4a8:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     4ac:      	mov	x0, x22
     4b0:      	mov	w1, #0x180              // =384
     4b4:      	add	x8, x8, #0xc68
     4b8:      	mov	x20, xzr
     4bc:      	bl	0x4bc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4bc>
     4c0:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     4c4:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     4c8:      	mov	w2, #0x200              // =512
     4cc:      	add	x0, x0, #0xa68
     4d0:      	add	x1, x1, #0xc68
     4d4:      	bl	0x4d4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4d4>
     4d8:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     4dc:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     4e0:      	mov	w2, #0x200              // =512
     4e4:      	add	x0, x0, #0x868
     4e8:      	add	x1, x1, #0xa68
     4ec:      	bl	0x4ec <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4ec>
     4f0:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     4f4:      	add	x0, sp, #0xa50
     4f8:      	mov	w2, #0x200              // =512
     4fc:      	add	x1, x1, #0x868
     500:      	bl	0x500 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x500>
     504:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     508:      	add	x1, sp, #0xa50
     50c:      	mov	w2, #0x200              // =512
     510:      	add	x0, x0, #0x268
     514:      	add	x19, sp, #0x1, lsl #12  // =0x1000
     518:      	add	x19, x19, #0x268
     51c:      	bl	0x51c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x51c>
     520:      	mov	w20, #0x1               // =1
     524:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     528:      	add	x0, x22, #0x180
     52c:      	mov	w1, #0x180              // =384
     530:      	add	x8, x8, #0xc68
     534:      	bl	0x534 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x534>
     538:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     53c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     540:      	mov	w2, #0x200              // =512
     544:      	add	x0, x0, #0xa68
     548:      	add	x1, x1, #0xc68
     54c:      	bl	0x54c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x54c>
     550:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     554:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     558:      	mov	w2, #0x200              // =512
     55c:      	add	x0, x0, #0x868
     560:      	add	x1, x1, #0xa68
     564:      	bl	0x564 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x564>
     568:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     56c:      	add	x0, sp, #0xa50
     570:      	mov	w2, #0x200              // =512
     574:      	add	x1, x1, #0x868
     578:      	bl	0x578 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x578>
     57c:      	add	x0, x19, #0x200
     580:      	add	x1, sp, #0xa50
     584:      	mov	w2, #0x200              // =512
     588:      	bl	0x588 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x588>
     58c:      	mov	w20, #0x2               // =2
     590:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     594:      	add	x0, x22, #0x300
     598:      	mov	w1, #0x180              // =384
     59c:      	add	x8, x8, #0xc68
     5a0:      	bl	0x5a0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5a0>
     5a4:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     5a8:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     5ac:      	mov	w2, #0x200              // =512
     5b0:      	add	x0, x0, #0xa68
     5b4:      	add	x1, x1, #0xc68
     5b8:      	bl	0x5b8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5b8>
     5bc:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     5c0:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     5c4:      	mov	w2, #0x200              // =512
     5c8:      	add	x0, x0, #0x868
     5cc:      	add	x1, x1, #0xa68
     5d0:      	bl	0x5d0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5d0>
     5d4:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     5d8:      	add	x0, sp, #0xa50
     5dc:      	mov	w2, #0x200              // =512
     5e0:      	add	x1, x1, #0x868
     5e4:      	bl	0x5e4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5e4>
     5e8:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     5ec:      	add	x1, sp, #0xa50
     5f0:      	mov	w2, #0x200              // =512
     5f4:      	add	x8, x8, #0x268
     5f8:      	add	x0, x8, #0x400
     5fc:      	bl	0x5fc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5fc>
     600:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     604:      	add	x0, sp, #0xa50
     608:      	mov	w2, #0x600              // =1536
     60c:      	add	x1, x1, #0x268
     610:      	bl	0x610 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x610>
     614:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     618:      	add	x0, sp, #0xa50
     61c:      	add	x1, sp, #0x10
     620:      	add	x8, x8, #0x268
     624:      	bl	0x624 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x624>
     628:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     62c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     630:      	add	x8, x8, #0xc68
     634:      	add	x0, x0, #0x268
     638:      	bl	0x638 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x638>
     63c:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     640:      	mov	x0, x21
     644:      	mov	w1, #0x6                // =6
     648:      	add	x8, x8, #0xa68
     64c:      	bl	0x64c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x64c>
     650:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     654:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     658:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     65c:      	add	x8, x8, #0x868
     660:      	add	x0, x0, #0xc68
     664:      	add	x1, x1, #0xa68
     668:      	bl	0x668 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x668>
     66c:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     670:      	ldr	x0, [sp, #0x8]
     674:      	mov	w1, #0x20               // =32
     678:      	add	x8, x8, #0x268
     67c:      	add	x19, sp, #0x1, lsl #12  // =0x1000
     680:      	add	x19, x19, #0x268
     684:      	bl	0x684 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x684>
     688:      	mov	x8, xzr
     68c:      	mov	w9, #0xd01              // =3329
     690:      	ldrsh	w10, [x19, x8]
     694:      	umull	x10, w10, w9
     698:      	tst	x10, #0xffffffff00000000
     69c:      	b.ne	0x86c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x86c>
     6a0:      	add	w10, w10, #0x1
     6a4:      	add	x11, x8, #0x2
     6a8:      	lsr	w10, w10, #1
     6ac:      	cmp	x11, #0x200
     6b0:      	strh	w10, [x19, x8]
     6b4:      	mov	x8, x11
     6b8:      	b.ne	0x690 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x690>
     6bc:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     6c0:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     6c4:      	mov	w2, #0x200              // =512
     6c8:      	add	x0, x0, #0xc68
     6cc:      	add	x1, x1, #0x268
     6d0:      	bl	0x6d0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x6d0>
     6d4:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     6d8:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     6dc:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     6e0:      	add	x8, x8, #0x268
     6e4:      	add	x0, x0, #0x868
     6e8:      	add	x1, x1, #0xc68
     6ec:      	bl	0x6ec <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x6ec>
     6f0:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     6f4:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     6f8:      	mov	w1, #0x4                // =4
     6fc:      	add	x8, x8, #0x868
     700:      	add	x0, x0, #0x268
     704:      	bl	0x704 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x704>
     708:      	add	x8, sp, #0x610
     70c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     710:      	add	x1, x8, #0x3c0
     714:      	mov	w2, #0x80               // =128
     718:      	add	x0, x0, #0x868
     71c:      	add	x20, sp, #0x1, lsl #12  // =0x1000
     720:      	add	x20, x20, #0x868
     724:      	bl	0x724 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x724>
     728:      	mov	x8, xzr
     72c:      	mov	x9, x8
     730:      	add	x8, x8, #0x2
     734:      	cmp	x8, #0x200
     738:      	strh	wzr, [x20, x9]
     73c:      	b.ne	0x72c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x72c>
     740:      	add	x9, sp, #0x1, lsl #12   // =0x1000
     744:      	mov	x8, xzr
     748:      	add	x9, x9, #0xc68
     74c:      	mov	x10, x8
     750:      	add	x8, x8, #0x2
     754:      	cmp	x8, #0x200
     758:      	strh	wzr, [x9, x10]
     75c:      	b.ne	0x74c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x74c>
     760:      	add	x9, sp, #0x1, lsl #12   // =0x1000
     764:      	mov	x8, xzr
     768:      	add	x9, x9, #0xa68
     76c:      	mov	x10, x8
     770:      	add	x8, x8, #0x2
     774:      	cmp	x8, #0x200
     778:      	strh	wzr, [x9, x10]
     77c:      	b.ne	0x76c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x76c>
     780:      	ldr	x0, [sp]
     784:      	add	x1, sp, #0x610
     788:      	mov	w2, #0x440              // =1088
     78c:      	bl	0x78c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x78c>
     790:      	mov	x8, xzr
     794:      	add	x9, sp, #0xa50
     798:      	mov	x10, x8
     79c:      	add	x8, x8, #0x2
     7a0:      	cmp	x8, #0x200
     7a4:      	strh	wzr, [x9, x10]
     7a8:      	b.ne	0x798 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x798>
     7ac:      	add	x9, sp, #0xa50
     7b0:      	mov	x8, xzr
     7b4:      	add	x9, x9, #0x200
     7b8:      	mov	x10, x8
     7bc:      	add	x8, x8, #0x2
     7c0:      	cmp	x8, #0x200
     7c4:      	strh	wzr, [x9, x10]
     7c8:      	b.ne	0x7b8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7b8>
     7cc:      	add	x9, sp, #0xa50
     7d0:      	mov	x8, xzr
     7d4:      	add	x9, x9, #0x400
     7d8:      	mov	x10, x8
     7dc:      	add	x8, x8, #0x2
     7e0:      	cmp	x8, #0x200
     7e4:      	strh	wzr, [x9, x10]
     7e8:      	b.ne	0x7d8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7d8>
     7ec:      	mov	x8, xzr
     7f0:      	add	x9, sp, #0x10
     7f4:      	mov	x10, x8
     7f8:      	add	x8, x8, #0x2
     7fc:      	cmp	x8, #0x200
     800:      	strh	wzr, [x9, x10]
     804:      	b.ne	0x7f4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7f4>
     808:      	add	x9, sp, #0x10
     80c:      	mov	x8, xzr
     810:      	add	x9, x9, #0x200
     814:      	mov	x10, x8
     818:      	add	x8, x8, #0x2
     81c:      	cmp	x8, #0x200
     820:      	strh	wzr, [x9, x10]
     824:      	b.ne	0x814 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x814>
     828:      	add	x9, sp, #0x10
     82c:      	mov	x8, xzr
     830:      	add	x9, x9, #0x400
     834:      	mov	x10, x8
     838:      	add	x8, x8, #0x2
     83c:      	cmp	x8, #0x200
     840:      	strh	wzr, [x9, x10]
     844:      	b.ne	0x834 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x834>
     848:      	add	sp, sp, #0x1, lsl #12   // =0x1000
     84c:      	add	sp, sp, #0xe70
     850:      	ldp	x20, x19, [sp, #0x50]
     854:      	ldp	x22, x21, [sp, #0x40]
     858:      	ldp	x24, x23, [sp, #0x30]
     85c:      	ldp	x26, x25, [sp, #0x20]
     860:      	ldp	x28, x27, [sp, #0x10]
     864:      	ldp	x29, x30, [sp], #0x60
     868:      	ret
     86c:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>
     870:      	add	x0, x0, #0x0
     874:      	bl	0x874 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x874>
     878:      	brk	#0x1
     87c:      	mov	x19, x0
     880:      	mov	x8, xzr
     884:      	mov	x9, x8
     888:      	add	x8, x8, #0x2
     88c:      	cmp	x8, #0x200
     890:      	strh	wzr, [x20, x9]
     894:      	b.ne	0x884 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x884>
     898:      	b	0x8d8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x8d8>
     89c:      	mov	x19, x0
     8a0:      	b	0x958 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x958>
     8a4:      	mov	x19, x0
     8a8:      	b	0x978 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x978>
     8ac:      	add	x9, sp, #0x1, lsl #12   // =0x1000
     8b0:      	mov	x19, x0
     8b4:      	mov	x8, xzr
     8b8:      	add	x9, x9, #0xc68
     8bc:      	mov	x10, x8
     8c0:      	add	x8, x8, #0x2
     8c4:      	cmp	x8, #0x200
     8c8:      	strh	wzr, [x9, x10]
     8cc:      	b.ne	0x8bc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x8bc>
     8d0:      	b	0x998 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x998>
     8d4:      	mov	x19, x0
     8d8:      	add	x9, sp, #0x1, lsl #12   // =0x1000
     8dc:      	mov	x8, xzr
     8e0:      	add	x9, x9, #0xc68
     8e4:      	mov	x10, x8
     8e8:      	add	x8, x8, #0x2
     8ec:      	cmp	x8, #0x200
     8f0:      	strh	wzr, [x9, x10]
     8f4:      	b.ne	0x8e4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x8e4>
     8f8:      	b	0x978 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x978>
     8fc:      	mov	x19, x0
     900:      	b	0x998 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x998>
     904:      	mov	x19, x0
     908:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     90c:      	str	x20, [sp, #0x1078]
     910:      	add	x0, x0, #0x68
     914:      	b	0xae4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xae4>
     918:      	mov	x19, x0
     91c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     920:      	str	x20, [sp, #0x1878]
     924:      	add	x0, x0, #0x868
     928:      	bl	0x928 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x928>
     92c:      	mov	x0, x19
     930:      	bl	0x930 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x930>
     934:      	add	x9, sp, #0x1, lsl #12   // =0x1000
     938:      	mov	x19, x0
     93c:      	mov	x8, xzr
     940:      	add	x9, x9, #0x268
     944:      	mov	x10, x8
     948:      	add	x8, x8, #0x2
     94c:      	cmp	x8, #0x200
     950:      	strh	wzr, [x9, x10]
     954:      	b.ne	0x944 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x944>
     958:      	add	x9, sp, #0x1, lsl #12   // =0x1000
     95c:      	mov	x8, xzr
     960:      	add	x9, x9, #0x868
     964:      	mov	x10, x8
     968:      	add	x8, x8, #0x2
     96c:      	cmp	x8, #0x200
     970:      	strh	wzr, [x9, x10]
     974:      	b.ne	0x964 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x964>
     978:      	add	x9, sp, #0x1, lsl #12   // =0x1000
     97c:      	mov	x8, xzr
     980:      	add	x9, x9, #0xa68
     984:      	mov	x10, x8
     988:      	add	x8, x8, #0x2
     98c:      	cmp	x8, #0x200
     990:      	strh	wzr, [x9, x10]
     994:      	b.ne	0x984 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x984>
     998:      	mov	x8, xzr
     99c:      	add	x9, sp, #0xa50
     9a0:      	mov	x10, x8
     9a4:      	add	x8, x8, #0x2
     9a8:      	cmp	x8, #0x200
     9ac:      	strh	wzr, [x9, x10]
     9b0:      	b.ne	0x9a0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9a0>
     9b4:      	add	x9, sp, #0xa50
     9b8:      	mov	x8, xzr
     9bc:      	add	x9, x9, #0x200
     9c0:      	mov	x10, x8
     9c4:      	add	x8, x8, #0x2
     9c8:      	cmp	x8, #0x200
     9cc:      	strh	wzr, [x9, x10]
     9d0:      	b.ne	0x9c0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9c0>
     9d4:      	add	x9, sp, #0xa50
     9d8:      	mov	x8, xzr
     9dc:      	add	x9, x9, #0x400
     9e0:      	mov	x10, x8
     9e4:      	add	x8, x8, #0x2
     9e8:      	cmp	x8, #0x200
     9ec:      	strh	wzr, [x9, x10]
     9f0:      	b.ne	0x9e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9e0>
     9f4:      	b	0xad0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xad0>
     9f8:      	add	x9, sp, #0x1, lsl #12   // =0x1000
     9fc:      	mov	x19, x0
     a00:      	mov	x8, xzr
     a04:      	add	x9, x9, #0xc68
     a08:      	mov	x10, x8
     a0c:      	add	x8, x8, #0x2
     a10:      	cmp	x8, #0x200
     a14:      	strh	wzr, [x9, x10]
     a18:      	b.ne	0xa08 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa08>
     a1c:      	b	0xa74 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa74>
     a20:      	add	x9, sp, #0x1, lsl #12   // =0x1000
     a24:      	mov	x19, x0
     a28:      	mov	x8, xzr
     a2c:      	add	x9, x9, #0xc68
     a30:      	mov	x10, x8
     a34:      	add	x8, x8, #0x2
     a38:      	cmp	x8, #0x200
     a3c:      	strh	wzr, [x9, x10]
     a40:      	b.ne	0xa30 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa30>
     a44:      	b	0xa54 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa54>
     a48:      	mov	x19, x0
     a4c:      	b	0xa74 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa74>
     a50:      	mov	x19, x0
     a54:      	add	x9, sp, #0x1, lsl #12   // =0x1000
     a58:      	mov	x8, xzr
     a5c:      	add	x9, x9, #0x268
     a60:      	mov	x10, x8
     a64:      	add	x8, x8, #0x2
     a68:      	cmp	x8, #0x200
     a6c:      	strh	wzr, [x9, x10]
     a70:      	b.ne	0xa60 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa60>
     a74:      	mov	x8, xzr
     a78:      	add	x9, sp, #0xa50
     a7c:      	mov	x10, x8
     a80:      	add	x8, x8, #0x2
     a84:      	cmp	x8, #0x200
     a88:      	strh	wzr, [x9, x10]
     a8c:      	b.ne	0xa7c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa7c>
     a90:      	add	x9, sp, #0xa50
     a94:      	mov	x8, xzr
     a98:      	add	x9, x9, #0x200
     a9c:      	mov	x10, x8
     aa0:      	add	x8, x8, #0x2
     aa4:      	cmp	x8, #0x200
     aa8:      	strh	wzr, [x9, x10]
     aac:      	b.ne	0xa9c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa9c>
     ab0:      	add	x9, sp, #0xa50
     ab4:      	mov	x8, xzr
     ab8:      	add	x9, x9, #0x400
     abc:      	mov	x10, x8
     ac0:      	add	x8, x8, #0x2
     ac4:      	cmp	x8, #0x200
     ac8:      	strh	wzr, [x9, x10]
     acc:      	b.ne	0xabc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xabc>
     ad0:      	b	0xae8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xae8>
     ad4:      	mov	x19, x0
     ad8:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     adc:      	str	x20, [sp, #0x1060]
     ae0:      	add	x0, x0, #0x50
     ae4:      	bl	0xae4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xae4>
     ae8:      	mov	x8, xzr
     aec:      	add	x9, sp, #0x10
     af0:      	mov	x10, x8
     af4:      	add	x8, x8, #0x2
     af8:      	cmp	x8, #0x200
     afc:      	strh	wzr, [x9, x10]
     b00:      	b.ne	0xaf0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xaf0>
     b04:      	add	x9, sp, #0x10
     b08:      	mov	x8, xzr
     b0c:      	add	x9, x9, #0x200
     b10:      	mov	x10, x8
     b14:      	add	x8, x8, #0x2
     b18:      	cmp	x8, #0x200
     b1c:      	strh	wzr, [x9, x10]
     b20:      	b.ne	0xb10 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb10>
     b24:      	add	x9, sp, #0x10
     b28:      	mov	x8, xzr
     b2c:      	add	x9, x9, #0x400
     b30:      	mov	x10, x8
     b34:      	add	x8, x8, #0x2
     b38:      	cmp	x8, #0x200
     b3c:      	strh	wzr, [x9, x10]
     b40:      	b.ne	0xb30 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb30>
     b44:      	mov	x0, x19
     b48:      	bl	0xb48 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb48>

0000000000000000 <<toyos_crypto::mlkem::EncapsulationKey>::as_bytes>:
       0:      	stp	x29, x30, [sp, #-0x10]!
       4:      	mov	x29, sp
       8:      	ldp	x29, x30, [sp], #0x10
       c:      	ret

0000000000000000 <<toyos_crypto::mlkem::DecapsulationKey>::public_key>:
       0:      	stp	x29, x30, [sp, #-0x10]!
       4:      	mov	x29, sp
       8:      	add	x0, x0, #0x600
       c:      	ldp	x29, x30, [sp], #0x10
      10:      	ret

0000000000000000 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>:
       0:      	stp	d15, d14, [sp, #-0x90]!
       4:      	stp	d13, d12, [sp, #0x10]
       8:      	stp	d11, d10, [sp, #0x20]
       c:      	stp	d9, d8, [sp, #0x30]
      10:      	stp	x29, x30, [sp, #0x40]
      14:      	str	x28, [sp, #0x50]
      18:      	stp	x24, x23, [sp, #0x60]
      1c:      	stp	x22, x21, [sp, #0x70]
      20:      	stp	x20, x19, [sp, #0x80]
      24:      	add	x29, sp, #0x40
      28:      	sub	sp, sp, #0x1, lsl #12   // =0x1000
      2c:      	str	xzr, [sp], #-0x50
      30:      	mov	x19, x0
      34:      	cmp	x2, #0x440
      38:      	mov	x20, x8
      3c:      	b.ne	0x72c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x72c>
      40:      	mov	x21, x1
      44:      	add	x8, sp, #0x640
      48:      	mov	w9, #0x3                // =3
      4c:      	str	x8, [sp, #0x600]
      50:      	str	x9, [sp, #0x608]
      54:      	mov	x8, sp
      58:      	mov	x0, x1
      5c:      	mov	w1, #0x140              // =320
      60:      	mov	x22, xzr
      64:      	mov	x23, sp
      68:      	bl	0x68 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x68>
      6c:      	mov	x8, xzr
      70:      	mov	w9, #0xd01              // =3329
      74:      	ldrsh	w10, [x23, x8]
      78:      	umull	x10, w10, w9
      7c:      	tst	x10, #0xffffffff00000000
      80:      	b.ne	0x7e8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x7e8>
      84:      	add	w10, w10, #0x200
      88:      	add	x11, x8, #0x2
      8c:      	lsr	w10, w10, #10
      90:      	cmp	x11, #0x200
      94:      	strh	w10, [x23, x8]
      98:      	mov	x8, x11
      9c:      	b.ne	0x74 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x74>
      a0:      	add	x0, sp, #0xe40
      a4:      	mov	x1, sp
      a8:      	mov	w2, #0x200              // =512
      ac:      	bl	0xac <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xac>
      b0:      	add	x8, sp, #0xc40
      b4:      	add	x0, sp, #0xe40
      b8:      	mov	x22, xzr
      bc:      	bl	0xbc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xbc>
      c0:      	mov	x0, sp
      c4:      	add	x1, sp, #0xc40
      c8:      	mov	w2, #0x200              // =512
      cc:      	bl	0xcc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xcc>
      d0:      	add	x0, sp, #0x640
      d4:      	mov	x1, sp
      d8:      	mov	w2, #0x200              // =512
      dc:      	bl	0xdc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xdc>
      e0:      	mov	w22, #0x1               // =1
      e4:      	mov	x8, sp
      e8:      	add	x0, x21, #0x140
      ec:      	mov	w1, #0x140              // =320
      f0:      	mov	x23, sp
      f4:      	bl	0xf4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf4>
      f8:      	mov	x9, xzr
      fc:      	mov	w10, #0xd01             // =3329
     100:      	mov	w8, #0x1                // =1
     104:      	ldrsh	w11, [x23, x9]
     108:      	umull	x11, w11, w10
     10c:      	tst	x11, #0xffffffff00000000
     110:      	b.ne	0x7ec <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x7ec>
     114:      	add	w11, w11, #0x200
     118:      	add	x12, x9, #0x2
     11c:      	lsr	w11, w11, #10
     120:      	cmp	x12, #0x200
     124:      	strh	w11, [x23, x9]
     128:      	mov	x9, x12
     12c:      	b.ne	0x104 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x104>
     130:      	add	x0, sp, #0xe40
     134:      	mov	x1, sp
     138:      	mov	w2, #0x200              // =512
     13c:      	bl	0x13c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x13c>
     140:      	mov	w22, #0x1               // =1
     144:      	add	x8, sp, #0xc40
     148:      	add	x0, sp, #0xe40
     14c:      	bl	0x14c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x14c>
     150:      	mov	x0, sp
     154:      	add	x1, sp, #0xc40
     158:      	mov	w2, #0x200              // =512
     15c:      	bl	0x15c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x15c>
     160:      	add	x8, sp, #0x640
     164:      	mov	x1, sp
     168:      	mov	w2, #0x200              // =512
     16c:      	add	x0, x8, #0x200
     170:      	bl	0x170 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x170>
     174:      	mov	w22, #0x2               // =2
     178:      	mov	x8, sp
     17c:      	add	x0, x21, #0x280
     180:      	mov	w1, #0x140              // =320
     184:      	mov	x23, sp
     188:      	bl	0x188 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x188>
     18c:      	mov	x9, xzr
     190:      	mov	w10, #0xd01             // =3329
     194:      	mov	w8, #0x2                // =2
     198:      	ldrsh	w11, [x23, x9]
     19c:      	umull	x11, w11, w10
     1a0:      	tst	x11, #0xffffffff00000000
     1a4:      	b.ne	0x7ec <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x7ec>
     1a8:      	add	w11, w11, #0x200
     1ac:      	add	x12, x9, #0x2
     1b0:      	lsr	w11, w11, #10
     1b4:      	cmp	x12, #0x200
     1b8:      	strh	w11, [x23, x9]
     1bc:      	mov	x9, x12
     1c0:      	b.ne	0x198 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x198>
     1c4:      	add	x0, sp, #0xe40
     1c8:      	mov	x1, sp
     1cc:      	mov	w2, #0x200              // =512
     1d0:      	bl	0x1d0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1d0>
     1d4:      	mov	w22, #0x2               // =2
     1d8:      	add	x8, sp, #0xc40
     1dc:      	add	x0, sp, #0xe40
     1e0:      	bl	0x1e0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1e0>
     1e4:      	mov	x0, sp
     1e8:      	add	x1, sp, #0xc40
     1ec:      	mov	w2, #0x200              // =512
     1f0:      	bl	0x1f0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1f0>
     1f4:      	add	x8, sp, #0x640
     1f8:      	mov	x1, sp
     1fc:      	mov	w2, #0x200              // =512
     200:      	add	x0, x8, #0x400
     204:      	bl	0x204 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x204>
     208:      	mov	x0, sp
     20c:      	add	x1, sp, #0x640
     210:      	mov	w2, #0x600              // =1536
     214:      	bl	0x214 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x214>
     218:      	movi	v0.2d, #0000000000000000
     21c:      	str	q0, [sp, #0x610]
     220:      	str	q0, [sp, #0x600]
     224:      	add	x8, sp, #0x640
     228:      	add	x0, x21, #0x3c0
     22c:      	mov	w1, #0x80               // =128
     230:      	add	x22, sp, #0x640
     234:      	bl	0x234 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x234>
     238:      	mov	x8, xzr
     23c:      	mov	w9, #0xd01              // =3329
     240:      	ldrsh	w10, [x22, x8]
     244:      	umull	x10, w10, w9
     248:      	tst	x10, #0xffffffff00000000
     24c:      	b.ne	0x800 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x800>
     250:      	add	w10, w10, #0x8
     254:      	add	x11, x8, #0x2
     258:      	lsr	w10, w10, #4
     25c:      	cmp	x11, #0x200
     260:      	strh	w10, [x22, x8]
     264:      	mov	x8, x11
     268:      	b.ne	0x240 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x240>
     26c:      	add	x0, sp, #0xc40
     270:      	add	x1, sp, #0x640
     274:      	mov	w2, #0x200              // =512
     278:      	add	x22, sp, #0xc40
     27c:      	bl	0x27c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x27c>
     280:      	add	x8, sp, #0x640
     284:      	mov	x1, sp
     288:      	mov	x0, x19
     28c:      	bl	0x28c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x28c>
     290:      	add	x8, sp, #0xe40
     294:      	add	x0, sp, #0x640
     298:      	add	x23, sp, #0xe40
     29c:      	bl	0x29c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x29c>
     2a0:      	add	x8, sp, #0xc40
     2a4:      	add	x0, x8, #0x200
     2a8:      	add	x1, sp, #0xc40
     2ac:      	bl	0x2ac <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x2ac>
     2b0:      	tbz	w0, #0x0, 0x7cc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x7cc>
     2b4:      	add	x0, x23, #0x200
     2b8:      	add	x1, sp, #0xe40
     2bc:      	bl	0x2bc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x2bc>
     2c0:      	cbz	w0, 0x7cc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x7cc>
     2c4:      	mov	x8, xzr
     2c8:      	add	x9, sp, #0xe40
     2cc:      	add	x10, sp, #0xc40
     2d0:      	ldrsh	w11, [x9, x8]
     2d4:      	ldrsh	w12, [x10, x8]
     2d8:      	sub	w11, w12, w11
     2dc:      	sxth	w12, w11
     2e0:      	cmp	w12, w11
     2e4:      	b.ne	0x810 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x810>
     2e8:      	strh	w11, [x10, x8]
     2ec:      	add	x8, x8, #0x2
     2f0:      	cmp	x8, #0x200
     2f4:      	b.ne	0x2d0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x2d0>
     2f8:      	add	x0, sp, #0x640
     2fc:      	add	x1, sp, #0xc40
     300:      	mov	w2, #0x200              // =512
     304:      	bl	0x304 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x304>
     308:      	add	x8, sp, #0xc40
     30c:      	add	x0, sp, #0x640
     310:      	mov	w1, #0x1                // =1
     314:      	bl	0x314 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x314>
     318:      	add	x0, sp, #0xc40
     31c:      	add	x1, sp, #0x600
     320:      	mov	w2, #0x20               // =32
     324:      	add	x22, sp, #0xc40
     328:      	bl	0x328 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x328>
     32c:      	mov	x8, xzr
     330:      	mov	x9, x8
     334:      	add	x8, x8, #0x2
     338:      	cmp	x8, #0x200
     33c:      	strh	wzr, [x22, x9]
     340:      	b.ne	0x330 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x330>
     344:      	mov	x8, xzr
     348:      	add	x9, sp, #0xe40
     34c:      	mov	x10, x8
     350:      	add	x8, x8, #0x2
     354:      	cmp	x8, #0x200
     358:      	strh	wzr, [x9, x10]
     35c:      	b.ne	0x34c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x34c>
     360:      	add	x8, sp, #0x600
     364:      	mov	w9, #0x20               // =32
     368:      	str	x8, [sp, #0xc40]
     36c:      	add	x8, x19, #0xaa0
     370:      	str	x9, [sp, #0xc48]
     374:      	str	x8, [sp, #0xc50]
     378:      	str	x9, [sp, #0xc58]
     37c:      	add	x8, sp, #0x640
     380:      	add	x0, sp, #0xc40
     384:      	mov	w1, #0x2                // =2
     388:      	bl	0x388 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x388>
     38c:      	ldr	q0, [sp, #0x640]
     390:      	ldr	q1, [sp, #0x650]
     394:      	mov	w8, #0x20               // =32
     398:      	ldr	q2, [sp, #0x670]
     39c:      	add	x22, x19, #0xac0
     3a0:      	str	x8, [sp, #0x648]
     3a4:      	str	q0, [sp, #0xe40]
     3a8:      	ldr	q0, [sp, #0x660]
     3ac:      	mov	w8, #0x440              // =1088
     3b0:      	str	q1, [sp, #0xe50]
     3b4:      	str	q0, [sp, #0xe60]
     3b8:      	str	q2, [sp, #0xe70]
     3bc:      	str	x22, [sp, #0x640]
     3c0:      	str	x21, [sp, #0x650]
     3c4:      	str	x8, [sp, #0x658]
     3c8:      	add	x8, sp, #0xc40
     3cc:      	add	x0, sp, #0x640
     3d0:      	mov	w1, #0x2                // =2
     3d4:      	bl	0x3d4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x3d4>
     3d8:      	ldr	q0, [sp, #0xc40]
     3dc:      	ldr	q1, [sp, #0xc50]
     3e0:      	add	x23, sp, #0xe40
     3e4:      	str	q0, [sp, #0x630]
     3e8:      	str	q1, [sp, #0x620]
     3ec:      	add	x8, sp, #0x640
     3f0:      	add	x0, x19, #0x600
     3f4:      	add	x1, sp, #0x600
     3f8:      	add	x2, x23, #0x20
     3fc:      	add	x24, sp, #0x640
     400:      	bl	0x400 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x400>
     404:      	add	x0, x21, #0x440
     408:      	mov	x1, x21
     40c:      	bl	0x40c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x40c>
     410:      	tbz	w0, #0x0, 0x7cc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x7cc>
     414:      	add	x0, x24, #0x440
     418:      	add	x1, sp, #0x640
     41c:      	bl	0x41c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x41c>
     420:      	cbz	w0, 0x7cc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x7cc>
     424:      	movi	v0.2d, #0000000000000000
     428:      	movi	v2.2d, #0000000000000000
     42c:      	add	x8, sp, #0x640
     430:      	movi	v6.2d, #0000000000000000
     434:      	movi	v1.2d, #0000000000000000
     438:      	add	x8, x8, #0x10
     43c:      	movi	v17.2d, #0000000000000000
     440:      	movi	v4.2d, #0000000000000000
     444:      	add	x9, x21, #0x10
     448:      	movi	v5.2d, #0000000000000000
     44c:      	movi	v3.2d, #0000000000000000
     450:      	mov	w10, #0x440             // =1088
     454:      	movi	v21.2d, #0000000000000000
     458:      	movi	v16.2d, #0000000000000000
     45c:      	movi	v7.2d, #0000000000000000
     460:      	movi	v22.2d, #0000000000000000
     464:      	movi	v19.2d, #0000000000000000
     468:      	movi	v20.2d, #0000000000000000
     46c:      	movi	v18.2d, #0000000000000000
     470:      	movi	v23.2d, #0000000000000000
     474:      	ldp	q24, q27, [x8, #-0x10]
     478:      	subs	x10, x10, #0x20
     47c:      	ldp	q25, q26, [x9, #-0x10]
     480:      	add	x8, x8, #0x20
     484:      	add	x9, x9, #0x20
     488:      	eor	v24.16b, v24.16b, v25.16b
     48c:      	eor	v25.16b, v27.16b, v26.16b
     490:      	ushll	v26.8h, v24.8b, #0x0
     494:      	ushll2	v24.8h, v24.16b, #0x0
     498:      	ushll	v27.8h, v25.8b, #0x0
     49c:      	ushll2	v25.8h, v25.16b, #0x0
     4a0:      	ushll	v28.4s, v26.4h, #0x0
     4a4:      	ushll2	v26.4s, v26.8h, #0x0
     4a8:      	ushll	v29.4s, v24.4h, #0x0
     4ac:      	ushll2	v24.4s, v24.8h, #0x0
     4b0:      	ushll	v30.4s, v27.4h, #0x0
     4b4:      	ushll2	v27.4s, v27.8h, #0x0
     4b8:      	ushll	v31.4s, v25.4h, #0x0
     4bc:      	ushll2	v25.4s, v25.8h, #0x0
     4c0:      	ushll	v8.2d, v28.2s, #0x0
     4c4:      	ushll2	v28.2d, v28.4s, #0x0
     4c8:      	ushll	v9.2d, v26.2s, #0x0
     4cc:      	ushll	v10.2d, v29.2s, #0x0
     4d0:      	ushll2	v11.2d, v24.4s, #0x0
     4d4:      	ushll2	v26.2d, v26.4s, #0x0
     4d8:      	ushll2	v29.2d, v29.4s, #0x0
     4dc:      	ushll	v24.2d, v24.2s, #0x0
     4e0:      	ushll	v12.2d, v30.2s, #0x0
     4e4:      	ushll2	v30.2d, v30.4s, #0x0
     4e8:      	ushll	v13.2d, v27.2s, #0x0
     4ec:      	ushll	v14.2d, v31.2s, #0x0
     4f0:      	ushll2	v15.2d, v25.4s, #0x0
     4f4:      	ushll2	v27.2d, v27.4s, #0x0
     4f8:      	ushll2	v31.2d, v31.4s, #0x0
     4fc:      	ushll	v25.2d, v25.2s, #0x0
     500:      	orr	v3.16b, v3.16b, v24.16b
     504:      	orr	v5.16b, v5.16b, v29.16b
     508:      	orr	v17.16b, v17.16b, v26.16b
     50c:      	orr	v21.16b, v21.16b, v11.16b
     510:      	orr	v4.16b, v4.16b, v10.16b
     514:      	orr	v1.16b, v1.16b, v9.16b
     518:      	orr	v6.16b, v6.16b, v28.16b
     51c:      	orr	v2.16b, v2.16b, v8.16b
     520:      	orr	v18.16b, v18.16b, v25.16b
     524:      	orr	v20.16b, v20.16b, v31.16b
     528:      	orr	v22.16b, v22.16b, v27.16b
     52c:      	orr	v23.16b, v23.16b, v15.16b
     530:      	orr	v19.16b, v19.16b, v14.16b
     534:      	orr	v7.16b, v7.16b, v13.16b
     538:      	orr	v0.16b, v0.16b, v30.16b
     53c:      	orr	v16.16b, v16.16b, v12.16b
     540:      	b.ne	0x474 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x474>
     544:      	orr	v17.16b, v22.16b, v17.16b
     548:      	orr	v21.16b, v23.16b, v21.16b
     54c:      	mov	x8, xzr
     550:      	orr	v0.16b, v0.16b, v6.16b
     554:      	orr	v2.16b, v16.16b, v2.16b
     558:      	add	x10, sp, #0x640
     55c:      	orr	v4.16b, v19.16b, v4.16b
     560:      	orr	v5.16b, v20.16b, v5.16b
     564:      	orr	v1.16b, v7.16b, v1.16b
     568:      	orr	v3.16b, v18.16b, v3.16b
     56c:      	orr	v2.16b, v2.16b, v4.16b
     570:      	orr	v0.16b, v0.16b, v5.16b
     574:      	orr	v1.16b, v1.16b, v3.16b
     578:      	orr	v3.16b, v17.16b, v21.16b
     57c:      	orr	v1.16b, v2.16b, v1.16b
     580:      	orr	v0.16b, v0.16b, v3.16b
     584:      	orr	v0.16b, v1.16b, v0.16b
     588:      	ext	v1.16b, v0.16b, v0.16b, #0x8
     58c:      	orr	v0.8b, v0.8b, v1.8b
     590:      	fmov	x9, d0
     594:      	mov	x11, x8
     598:      	add	x8, x8, #0x1
     59c:      	cmp	x8, #0x440
     5a0:      	strb	wzr, [x10, x11]
     5a4:      	b.ne	0x594 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x594>
     5a8:      	cmp	x9, #0x0
     5ac:      	ldr	q2, [sp, #0x630]
     5b0:      	ldr	q3, [sp, #0xe40]
     5b4:      	cset	w9, gt
     5b8:      	ldr	q4, [sp, #0xe50]
     5bc:      	ldr	q5, [sp, #0x620]
     5c0:      	neg	w10, w9
     5c4:      	strb	wzr, [x20]
     5c8:      	sub	w9, w9, #0x1
     5cc:      	dup	v0.16b, w10
     5d0:      	str	xzr, [sp, #0x648]
     5d4:      	dup	v1.16b, w9
     5d8:      	str	xzr, [sp, #0x640]
     5dc:      	mov	x8, xzr
     5e0:      	mov	x9, sp
     5e4:      	and	v2.16b, v2.16b, v0.16b
     5e8:      	and	v0.16b, v5.16b, v0.16b
     5ec:      	and	v3.16b, v1.16b, v3.16b
     5f0:      	and	v1.16b, v1.16b, v4.16b
     5f4:      	orr	v2.16b, v2.16b, v3.16b
     5f8:      	orr	v0.16b, v0.16b, v1.16b
     5fc:      	stur	q2, [x20, #0x1]
     600:      	stur	q0, [x20, #0x11]
     604:      	ldr	q0, [sp, #0x640]
     608:      	str	q0, [sp, #0x630]
     60c:      	str	xzr, [sp, #0x648]
     610:      	str	xzr, [sp, #0x640]
     614:      	ldr	q0, [sp, #0x640]
     618:      	str	q0, [sp, #0x620]
     61c:      	str	xzr, [sp, #0x648]
     620:      	str	xzr, [sp, #0x640]
     624:      	ldr	q0, [sp, #0x640]
     628:      	str	q0, [sp, #0xe40]
     62c:      	str	xzr, [sp, #0x648]
     630:      	str	xzr, [sp, #0x640]
     634:      	ldr	q0, [sp, #0x640]
     638:      	str	q0, [sp, #0xe50]
     63c:      	str	xzr, [sp, #0x648]
     640:      	str	xzr, [sp, #0x640]
     644:      	ldr	q0, [sp, #0x640]
     648:      	stur	q0, [x23, #0x20]
     64c:      	str	xzr, [sp, #0x648]
     650:      	str	xzr, [sp, #0x640]
     654:      	ldr	q0, [sp, #0x640]
     658:      	str	q0, [sp, #0xe70]
     65c:      	str	xzr, [sp, #0x648]
     660:      	str	xzr, [sp, #0x640]
     664:      	ldr	q0, [sp, #0x640]
     668:      	str	q0, [sp, #0x600]
     66c:      	str	xzr, [sp, #0x648]
     670:      	str	xzr, [sp, #0x640]
     674:      	ldr	q0, [sp, #0x640]
     678:      	str	q0, [sp, #0x610]
     67c:      	mov	x10, x8
     680:      	add	x8, x8, #0x2
     684:      	cmp	x8, #0x200
     688:      	strh	wzr, [x9, x10]
     68c:      	b.ne	0x67c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x67c>
     690:      	mov	x9, sp
     694:      	mov	x8, xzr
     698:      	add	x9, x9, #0x200
     69c:      	mov	x10, x8
     6a0:      	add	x8, x8, #0x2
     6a4:      	cmp	x8, #0x200
     6a8:      	strh	wzr, [x9, x10]
     6ac:      	b.ne	0x69c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x69c>
     6b0:      	mov	x9, sp
     6b4:      	mov	x8, xzr
     6b8:      	add	x9, x9, #0x400
     6bc:      	mov	x10, x8
     6c0:      	add	x8, x8, #0x2
     6c4:      	cmp	x8, #0x200
     6c8:      	strh	wzr, [x9, x10]
     6cc:      	b.ne	0x6bc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x6bc>
     6d0:      	mov	x8, xzr
     6d4:      	mov	x9, x8
     6d8:      	add	x8, x8, #0x2
     6dc:      	cmp	x8, #0x200
     6e0:      	strh	wzr, [x19, x9]
     6e4:      	b.ne	0x6d4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x6d4>
     6e8:      	mov	x8, xzr
     6ec:      	add	x9, x19, #0x200
     6f0:      	strh	wzr, [x9, x8]
     6f4:      	add	x8, x8, #0x2
     6f8:      	cmp	x8, #0x200
     6fc:      	b.ne	0x6f0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x6f0>
     700:      	mov	x8, xzr
     704:      	add	x9, x19, #0x400
     708:      	strh	wzr, [x9, x8]
     70c:      	add	x8, x8, #0x2
     710:      	cmp	x8, #0x200
     714:      	b.ne	0x708 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x708>
     718:      	str	xzr, [sp, #0x648]
     71c:      	str	xzr, [sp, #0x640]
     720:      	ldr	q0, [sp, #0x640]
     724:      	str	q0, [x22]
     728:      	b	0x78c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x78c>
     72c:      	mov	x8, xzr
     730:      	mov	w9, #0x1                // =1
     734:      	strh	w9, [x20]
     738:      	mov	x9, x8
     73c:      	add	x8, x8, #0x2
     740:      	cmp	x8, #0x200
     744:      	strh	wzr, [x19, x9]
     748:      	b.ne	0x738 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x738>
     74c:      	mov	x8, xzr
     750:      	add	x9, x19, #0x200
     754:      	strh	wzr, [x9, x8]
     758:      	add	x8, x8, #0x2
     75c:      	cmp	x8, #0x200
     760:      	b.ne	0x754 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x754>
     764:      	mov	x8, xzr
     768:      	add	x9, x19, #0x400
     76c:      	strh	wzr, [x9, x8]
     770:      	add	x8, x8, #0x2
     774:      	cmp	x8, #0x200
     778:      	b.ne	0x76c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x76c>
     77c:      	str	xzr, [sp, #0x648]
     780:      	str	xzr, [sp, #0x640]
     784:      	ldr	q0, [sp, #0x640]
     788:      	str	q0, [x19, #0xac0]
     78c:      	str	xzr, [sp, #0x648]
     790:      	str	xzr, [sp, #0x640]
     794:      	ldr	q0, [sp, #0x640]
     798:      	str	q0, [x19, #0xad0]
     79c:      	add	sp, sp, #0x1, lsl #12   // =0x1000
     7a0:      	add	sp, sp, #0x50
     7a4:      	ldp	x20, x19, [sp, #0x80]
     7a8:      	ldr	x28, [sp, #0x50]
     7ac:      	ldp	x22, x21, [sp, #0x70]
     7b0:      	ldp	x24, x23, [sp, #0x60]
     7b4:      	ldp	x29, x30, [sp, #0x40]
     7b8:      	ldp	d9, d8, [sp, #0x30]
     7bc:      	ldp	d11, d10, [sp, #0x20]
     7c0:      	ldp	d13, d12, [sp, #0x10]
     7c4:      	ldp	d15, d14, [sp], #0x90
     7c8:      	ret
     7cc:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>
     7d0:      	add	x0, x0, #0x0
     7d4:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>
     7d8:      	add	x3, x3, #0x0
     7dc:      	mov	w1, #0x193              // =403
     7e0:      	mov	w2, wzr
     7e4:      	bl	0x7e4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x7e4>
     7e8:      	mov	x8, xzr
     7ec:      	str	x8, [sp, #0x610]
     7f0:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>
     7f4:      	add	x0, x0, #0x0
     7f8:      	bl	0x7f8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x7f8>
     7fc:      	b	0x81c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x81c>
     800:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>
     804:      	add	x0, x0, #0x0
     808:      	bl	0x808 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x808>
     80c:      	b	0x81c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x81c>
     810:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>
     814:      	add	x0, x0, #0x0
     818:      	bl	0x818 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x818>
     81c:      	brk	#0x1
     820:      	bl	0x820 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x820>
     824:      	bl	0x824 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x824>
     828:      	str	xzr, [sp, #0xc48]
     82c:      	mov	x20, x0
     830:      	str	xzr, [sp, #0xc40]
     834:      	ldr	q0, [sp, #0xc40]
     838:      	str	q0, [sp, #0x630]
     83c:      	str	xzr, [sp, #0xc48]
     840:      	str	xzr, [sp, #0xc40]
     844:      	ldr	q0, [sp, #0xc40]
     848:      	str	q0, [sp, #0x620]
     84c:      	b	0x854 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x854>
     850:      	mov	x20, x0
     854:      	stp	xzr, xzr, [x29, #-0x50]
     858:      	ldur	q0, [x29, #-0x50]
     85c:      	str	q0, [sp, #0xe40]
     860:      	stp	xzr, xzr, [x29, #-0x50]
     864:      	ldur	q0, [x29, #-0x50]
     868:      	str	q0, [sp, #0xe50]
     86c:      	stp	xzr, xzr, [x29, #-0x50]
     870:      	ldur	q0, [x29, #-0x50]
     874:      	str	q0, [sp, #0xe60]
     878:      	stp	xzr, xzr, [x29, #-0x50]
     87c:      	ldur	q0, [x29, #-0x50]
     880:      	str	q0, [sp, #0xe70]
     884:      	b	0x94c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x94c>
     888:      	mov	x20, x0
     88c:      	mov	x8, xzr
     890:      	mov	x9, x8
     894:      	add	x8, x8, #0x2
     898:      	cmp	x8, #0x200
     89c:      	strh	wzr, [x22, x9]
     8a0:      	b.ne	0x890 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x890>
     8a4:      	b	0x90c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x90c>
     8a8:      	mov	x20, x0
     8ac:      	b	0x90c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x90c>
     8b0:      	bl	0x8b0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x8b0>
     8b4:      	bl	0x8b4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x8b4>
     8b8:      	mov	x20, x0
     8bc:      	b	0x94c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x94c>
     8c0:      	mov	x20, x0
     8c4:      	mov	x8, xzr
     8c8:      	mov	x9, x8
     8cc:      	add	x8, x8, #0x2
     8d0:      	cmp	x8, #0x200
     8d4:      	strh	wzr, [x22, x9]
     8d8:      	b.ne	0x8c8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x8c8>
     8dc:      	b	0x94c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x94c>
     8e0:      	mov	x20, x0
     8e4:      	str	x22, [sp, #0x610]
     8e8:      	b	0x9e4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x9e4>
     8ec:      	mov	x20, x0
     8f0:      	mov	x8, xzr
     8f4:      	add	x9, sp, #0xc40
     8f8:      	mov	x10, x8
     8fc:      	add	x8, x8, #0x2
     900:      	cmp	x8, #0x200
     904:      	strh	wzr, [x9, x10]
     908:      	b.ne	0x8f8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x8f8>
     90c:      	mov	x8, xzr
     910:      	add	x9, sp, #0xe40
     914:      	mov	x10, x8
     918:      	add	x8, x8, #0x2
     91c:      	cmp	x8, #0x200
     920:      	strh	wzr, [x9, x10]
     924:      	b.ne	0x914 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x914>
     928:      	b	0x94c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x94c>
     92c:      	mov	x20, x0
     930:      	mov	x8, xzr
     934:      	add	x9, sp, #0x640
     938:      	mov	x10, x8
     93c:      	add	x8, x8, #0x2
     940:      	cmp	x8, #0x200
     944:      	strh	wzr, [x9, x10]
     948:      	b.ne	0x938 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x938>
     94c:      	stp	xzr, xzr, [x29, #-0x50]
     950:      	mov	x8, xzr
     954:      	mov	x9, sp
     958:      	ldur	q0, [x29, #-0x50]
     95c:      	str	q0, [sp, #0x600]
     960:      	stp	xzr, xzr, [x29, #-0x50]
     964:      	ldur	q0, [x29, #-0x50]
     968:      	str	q0, [sp, #0x610]
     96c:      	mov	x10, x8
     970:      	add	x8, x8, #0x2
     974:      	cmp	x8, #0x200
     978:      	strh	wzr, [x9, x10]
     97c:      	b.ne	0x96c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x96c>
     980:      	mov	x9, sp
     984:      	mov	x8, xzr
     988:      	add	x9, x9, #0x200
     98c:      	mov	x10, x8
     990:      	add	x8, x8, #0x2
     994:      	cmp	x8, #0x200
     998:      	strh	wzr, [x9, x10]
     99c:      	b.ne	0x98c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x98c>
     9a0:      	mov	x9, sp
     9a4:      	mov	x8, xzr
     9a8:      	add	x9, x9, #0x400
     9ac:      	mov	x10, x8
     9b0:      	add	x8, x8, #0x2
     9b4:      	cmp	x8, #0x200
     9b8:      	strh	wzr, [x9, x10]
     9bc:      	b.ne	0x9ac <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x9ac>
     9c0:      	b	0x9ec <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x9ec>
     9c4:      	mov	x20, x0
     9c8:      	mov	x8, xzr
     9cc:      	mov	x9, sp
     9d0:      	mov	x10, x8
     9d4:      	add	x8, x8, #0x2
     9d8:      	cmp	x8, #0x200
     9dc:      	strh	wzr, [x9, x10]
     9e0:      	b.ne	0x9d0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x9d0>
     9e4:      	add	x0, sp, #0x600
     9e8:      	bl	0x9e8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x9e8>
     9ec:      	mov	x0, x19
     9f0:      	bl	0x9f0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x9f0>
     9f4:      	mov	x0, x20
     9f8:      	bl	0x9f8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x9f8>
     9fc:      	bl	0x9fc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x9fc>

0000000000000000 <<toyos_crypto::mlkem::Poly>::ntt>:
       0:      	sub	sp, sp, #0xa0
       4:      	stp	x29, x30, [sp, #0x40]
       8:      	stp	x28, x27, [sp, #0x50]
       c:      	stp	x26, x25, [sp, #0x60]
      10:      	stp	x24, x23, [sp, #0x70]
      14:      	stp	x22, x21, [sp, #0x80]
      18:      	stp	x20, x19, [sp, #0x90]
      1c:      	add	x29, sp, #0x40
      20:      	mov	x19, x0
      24:      	mov	w22, #0x8               // =8
      28:      	adrp	x23, 0x0 <<toyos_crypto::mlkem::Poly>::ntt>
      2c:      	add	x23, x23, #0x0
      30:      	mov	w27, #-0xcff0000        // =-218038272
      34:      	mov	w28, #-0xd01            // =-3329
      38:      	str	x8, [sp]
      3c:      	b	0x54 <<toyos_crypto::mlkem::Poly>::ntt+0x54>
      40:      	sub	x8, x22, #0x1
      44:      	str	x8, [sp, #0x8]
      48:      	cmp	x22, #0x2
      4c:      	ldr	x22, [sp, #0x8]
      50:      	b.ls	0x14c <<toyos_crypto::mlkem::Poly>::ntt+0x14c>
      54:      	sub	x9, x22, #0x1
      58:      	mov	w8, #0x2                // =2
      5c:      	lsl	x24, x8, x9
      60:      	neg	w8, w24
      64:      	and	x26, x8, #0x100
      68:      	cmp	x24, x26
      6c:      	b.hi	0x40 <<toyos_crypto::mlkem::Poly>::ntt+0x40>
      70:      	sub	x9, x22, #0x1
      74:      	mov	w8, #0x1                // =1
      78:      	mov	x21, x19
      7c:      	str	x9, [sp, #0x8]
      80:      	sub	x9, x22, #0x1
      84:      	lsl	x20, x8, x9
      88:      	b	0x98 <<toyos_crypto::mlkem::Poly>::ntt+0x98>
      8c:      	sub	x26, x26, x24
      90:      	cmp	x24, x26
      94:      	b.hi	0x48 <<toyos_crypto::mlkem::Poly>::ntt+0x48>
      98:      	adrp	x8, 0x0 <<toyos_crypto::mlkem::Poly>::ntt>
      9c:      	add	x8, x8, #0x0
      a0:      	cmp	x23, x8
      a4:      	b.eq	0x140 <<toyos_crypto::mlkem::Poly>::ntt+0x140>
      a8:      	cmp	x20, x24
      ac:      	b.hi	0x1e0 <<toyos_crypto::mlkem::Poly>::ntt+0x1e0>
      b0:      	mov	x0, x21
      b4:      	add	x21, x21, x24, lsl #1
      b8:      	ldrsh	w25, [x23], #0x2
      bc:      	add	x1, x0, x20, lsl #1
      c0:      	add	x8, sp, #0x10
      c4:      	mov	x2, x1
      c8:      	mov	x3, x21
      cc:      	bl	0xcc <<toyos_crypto::mlkem::Poly>::ntt+0xcc>
      d0:      	ldp	x9, x8, [sp, #0x30]
      d4:      	subs	x8, x8, x9
      d8:      	b.ls	0x8c <<toyos_crypto::mlkem::Poly>::ntt+0x8c>
      dc:      	ldr	x10, [sp, #0x10]
      e0:      	ldr	x11, [sp, #0x20]
      e4:      	lsl	x12, x9, #1
      e8:      	add	x9, x11, x12
      ec:      	add	x10, x10, x12
      f0:      	ldrsh	w11, [x9]
      f4:      	mul	w11, w11, w25
      f8:      	mul	w12, w11, w27
      fc:      	asr	w12, w12, #16
     100:      	madd	w11, w12, w28, w11
     104:      	ldrsh	w12, [x10]
     108:      	sub	w12, w12, w11, asr #16
     10c:      	sxth	w13, w12
     110:      	cmp	w13, w12
     114:      	b.ne	0x1fc <<toyos_crypto::mlkem::Poly>::ntt+0x1fc>
     118:      	strh	w12, [x9], #0x2
     11c:      	ldrsh	w12, [x10]
     120:      	add	w11, w12, w11, asr #16
     124:      	sxth	w12, w11
     128:      	cmp	w12, w11
     12c:      	b.ne	0x20c <<toyos_crypto::mlkem::Poly>::ntt+0x20c>
     130:      	subs	x8, x8, #0x1
     134:      	strh	w11, [x10], #0x2
     138:      	b.ne	0xf0 <<toyos_crypto::mlkem::Poly>::ntt+0xf0>
     13c:      	b	0x8c <<toyos_crypto::mlkem::Poly>::ntt+0x8c>
     140:      	adrp	x23, 0x0 <<toyos_crypto::mlkem::Poly>::ntt>
     144:      	add	x23, x23, #0x0
     148:      	b	0x48 <<toyos_crypto::mlkem::Poly>::ntt+0x48>
     14c:      	mov	w8, #0x4ebf             // =20159
     150:      	mvni	v1.8h, #0xd, lsl #8
     154:      	dup	v0.8h, w8
     158:      	mov	x8, xzr
     15c:      	movi	v2.4s, #0x2, lsl #24
     160:      	movi	v3.4s, #0x2, lsl #24
     164:      	add	x9, x19, x8
     168:      	movi	v4.4s, #0x2, lsl #24
     16c:      	movi	v5.4s, #0x2, lsl #24
     170:      	add	x8, x8, #0x20
     174:      	ldp	q6, q7, [x9]
     178:      	cmp	x8, #0x200
     17c:      	smlal	v2.4s, v6.4h, v0.4h
     180:      	smlal2	v3.4s, v6.8h, v0.8h
     184:      	smlal	v4.4s, v7.4h, v0.4h
     188:      	smlal2	v5.4s, v7.8h, v0.8h
     18c:      	sshr	v3.4s, v3.4s, #0x1a
     190:      	sshr	v2.4s, v2.4s, #0x1a
     194:      	sshr	v4.4s, v4.4s, #0x1a
     198:      	sshr	v5.4s, v5.4s, #0x1a
     19c:      	uzp1	v2.8h, v2.8h, v3.8h
     1a0:      	uzp1	v3.8h, v4.8h, v5.8h
     1a4:      	mla	v6.8h, v2.8h, v1.8h
     1a8:      	mla	v7.8h, v3.8h, v1.8h
     1ac:      	stp	q6, q7, [x9]
     1b0:      	b.ne	0x15c <<toyos_crypto::mlkem::Poly>::ntt+0x15c>
     1b4:      	ldr	x0, [sp]
     1b8:      	mov	x1, x19
     1bc:      	mov	w2, #0x200              // =512
     1c0:      	ldp	x20, x19, [sp, #0x90]
     1c4:      	ldp	x22, x21, [sp, #0x80]
     1c8:      	ldp	x24, x23, [sp, #0x70]
     1cc:      	ldp	x26, x25, [sp, #0x60]
     1d0:      	ldp	x28, x27, [sp, #0x50]
     1d4:      	ldp	x29, x30, [sp, #0x40]
     1d8:      	add	sp, sp, #0xa0
     1dc:      	b	0x1dc <<toyos_crypto::mlkem::Poly>::ntt+0x1dc>
     1e0:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::ntt>
     1e4:      	add	x0, x0, #0x0
     1e8:      	adrp	x2, 0x0 <<toyos_crypto::mlkem::Poly>::ntt>
     1ec:      	add	x2, x2, #0x0
     1f0:      	mov	w1, #0x13               // =19
     1f4:      	bl	0x1f4 <<toyos_crypto::mlkem::Poly>::ntt+0x1f4>
     1f8:      	b	0x218 <<toyos_crypto::mlkem::Poly>::ntt+0x218>
     1fc:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::ntt>
     200:      	add	x0, x0, #0x0
     204:      	bl	0x204 <<toyos_crypto::mlkem::Poly>::ntt+0x204>
     208:      	b	0x218 <<toyos_crypto::mlkem::Poly>::ntt+0x218>
     20c:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::ntt>
     210:      	add	x0, x0, #0x0
     214:      	bl	0x214 <<toyos_crypto::mlkem::Poly>::ntt+0x214>
     218:      	brk	#0x1
     21c:      	b	0x220 <<toyos_crypto::mlkem::Poly>::ntt+0x220>
     220:      	mov	x8, xzr
     224:      	mov	x9, x8
     228:      	add	x8, x8, #0x2
     22c:      	cmp	x8, #0x200
     230:      	strh	wzr, [x19, x9]
     234:      	b.ne	0x224 <<toyos_crypto::mlkem::Poly>::ntt+0x224>
     238:      	bl	0x238 <<toyos_crypto::mlkem::Poly>::ntt+0x238>

0000000000000000 <<toyos_crypto::mlkem::Poly>::plus>:
       0:      	stp	x29, x30, [sp, #-0x30]!
       4:      	str	x21, [sp, #0x10]
       8:      	stp	x20, x19, [sp, #0x20]
       c:      	mov	x29, sp
      10:      	mov	x21, x1
      14:      	mov	x19, x0
      18:      	mov	x20, x8
      1c:      	add	x0, x0, #0x200
      20:      	mov	x1, x19
      24:      	bl	0x24 <<toyos_crypto::mlkem::Poly>::plus+0x24>
      28:      	tbz	w0, #0x0, 0x84 <<toyos_crypto::mlkem::Poly>::plus+0x84>
      2c:      	add	x0, x21, #0x200
      30:      	mov	x1, x21
      34:      	bl	0x34 <<toyos_crypto::mlkem::Poly>::plus+0x34>
      38:      	cbz	w0, 0x84 <<toyos_crypto::mlkem::Poly>::plus+0x84>
      3c:      	mov	x8, xzr
      40:      	ldrsh	w9, [x21, x8]
      44:      	ldrsh	w10, [x19, x8]
      48:      	add	w9, w10, w9
      4c:      	sxth	w10, w9
      50:      	cmp	w10, w9
      54:      	b.ne	0xa0 <<toyos_crypto::mlkem::Poly>::plus+0xa0>
      58:      	strh	w9, [x19, x8]
      5c:      	add	x8, x8, #0x2
      60:      	cmp	x8, #0x200
      64:      	b.ne	0x40 <<toyos_crypto::mlkem::Poly>::plus+0x40>
      68:      	mov	x0, x20
      6c:      	mov	x1, x19
      70:      	mov	w2, #0x200              // =512
      74:      	ldp	x20, x19, [sp, #0x20]
      78:      	ldr	x21, [sp, #0x10]
      7c:      	ldp	x29, x30, [sp], #0x30
      80:      	b	0x80 <<toyos_crypto::mlkem::Poly>::plus+0x80>
      84:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::plus>
      88:      	add	x0, x0, #0x0
      8c:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::plus>
      90:      	add	x3, x3, #0x0
      94:      	mov	w1, #0x193              // =403
      98:      	mov	w2, wzr
      9c:      	bl	0x9c <<toyos_crypto::mlkem::Poly>::plus+0x9c>
      a0:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::plus>
      a4:      	add	x0, x0, #0x0
      a8:      	bl	0xa8 <<toyos_crypto::mlkem::Poly>::plus+0xa8>
      ac:      	brk	#0x1
      b0:      	bl	0xb0 <<toyos_crypto::mlkem::Poly>::plus+0xb0>
      b4:      	bl	0xb4 <<toyos_crypto::mlkem::Poly>::plus+0xb4>
      b8:      	mov	x8, xzr
      bc:      	mov	x9, x8
      c0:      	add	x8, x8, #0x2
      c4:      	cmp	x8, #0x200
      c8:      	strh	wzr, [x19, x9]
      cc:      	b.ne	0xbc <<toyos_crypto::mlkem::Poly>::plus+0xbc>
      d0:      	bl	0xd0 <<toyos_crypto::mlkem::Poly>::plus+0xd0>

0000000000000000 <<toyos_crypto::mlkem::Poly>::zero>:
       0:      	stp	x29, x30, [sp, #-0x10]!
       4:      	mov	x29, sp
       8:      	movi	v0.2d, #0000000000000000
       c:      	stp	q0, q0, [x8, #0x20]
      10:      	stp	q0, q0, [x8, #0x40]
      14:      	stp	q0, q0, [x8, #0x60]
      18:      	stp	q0, q0, [x8, #0x80]
      1c:      	stp	q0, q0, [x8, #0xa0]
      20:      	stp	q0, q0, [x8, #0xc0]
      24:      	stp	q0, q0, [x8, #0xe0]
      28:      	stp	q0, q0, [x8, #0x100]
      2c:      	stp	q0, q0, [x8, #0x120]
      30:      	stp	q0, q0, [x8, #0x140]
      34:      	stp	q0, q0, [x8, #0x160]
      38:      	stp	q0, q0, [x8, #0x180]
      3c:      	stp	q0, q0, [x8, #0x1a0]
      40:      	stp	q0, q0, [x8, #0x1c0]
      44:      	stp	q0, q0, [x8, #0x1e0]
      48:      	stp	q0, q0, [x8]
      4c:      	ldp	x29, x30, [sp], #0x10
      50:      	ret

0000000000000000 <<toyos_crypto::mlkem::Poly>::scale>:
       0:      	stp	x29, x30, [sp, #-0x10]!
       4:      	mov	x29, sp
       8:      	mov	x9, x0
       c:      	mov	x0, x8
      10:      	mov	w8, #-0xcff0000         // =-218038272
      14:      	dup	v0.4s, w1
      18:      	dup	v1.4s, w8
      1c:      	mvni	v2.4h, #0xd, lsl #8
      20:      	mov	x8, xzr
      24:      	mul	v0.4s, v0.4s, v1.4s
      28:      	dup	v1.8h, w1
      2c:      	add	x10, x9, x8
      30:      	add	x8, x8, #0x20
      34:      	ldp	q3, q4, [x10]
      38:      	cmp	x8, #0x200
      3c:      	sshll	v5.4s, v3.4h, #0x0
      40:      	sshll	v6.4s, v4.4h, #0x0
      44:      	sshll2	v7.4s, v3.8h, #0x0
      48:      	sshll2	v16.4s, v4.8h, #0x0
      4c:      	smull	v17.4s, v1.4h, v3.4h
      50:      	smull	v18.4s, v1.4h, v4.4h
      54:      	smull2	v3.4s, v1.8h, v3.8h
      58:      	smull2	v4.4s, v1.8h, v4.8h
      5c:      	mul	v5.4s, v5.4s, v0.4s
      60:      	mul	v6.4s, v6.4s, v0.4s
      64:      	mul	v7.4s, v7.4s, v0.4s
      68:      	mul	v16.4s, v16.4s, v0.4s
      6c:      	shrn	v5.4h, v5.4s, #0x10
      70:      	shrn	v6.4h, v6.4s, #0x10
      74:      	shrn	v7.4h, v7.4s, #0x10
      78:      	shrn	v16.4h, v16.4s, #0x10
      7c:      	smull	v5.4s, v5.4h, v2.4h
      80:      	smull	v6.4s, v6.4h, v2.4h
      84:      	smull	v7.4s, v7.4h, v2.4h
      88:      	smull	v16.4s, v16.4h, v2.4h
      8c:      	addhn	v5.4h, v5.4s, v17.4s
      90:      	addhn	v6.4h, v6.4s, v18.4s
      94:      	addhn2	v5.8h, v7.4s, v3.4s
      98:      	addhn2	v6.8h, v16.4s, v4.4s
      9c:      	stp	q5, q6, [x10]
      a0:      	b.ne	0x2c <<toyos_crypto::mlkem::Poly>::scale+0x2c>
      a4:      	mov	x1, x9
      a8:      	mov	w2, #0x200              // =512
      ac:      	ldp	x29, x30, [sp], #0x10
      b0:      	b	0xb0 <<toyos_crypto::mlkem::Poly>::scale+0xb0>

0000000000000000 <<toyos_crypto::mlkem::Poly>::inverse>:
       0:      	stp	x29, x30, [sp, #-0x60]!
       4:      	stp	x28, x27, [sp, #0x10]
       8:      	stp	x26, x25, [sp, #0x20]
       c:      	stp	x24, x23, [sp, #0x30]
      10:      	stp	x22, x21, [sp, #0x40]
      14:      	stp	x20, x19, [sp, #0x50]
      18:      	mov	x29, sp
      1c:      	sub	sp, sp, #0x220
      20:      	mov	x20, x0
      24:      	adrp	x23, 0x0 <<toyos_crypto::mlkem::Poly>::inverse>
      28:      	add	x23, x23, #0x0
      2c:      	mov	w26, #0x4ebf            // =20159
      30:      	mov	w27, #0x2000000         // =33554432
      34:      	mov	w28, #-0xd01            // =-3329
      38:      	mov	w19, #-0xcff0000        // =-218038272
      3c:      	mov	w9, #0x1                // =1
      40:      	str	x8, [sp]
      44:      	b	0x60 <<toyos_crypto::mlkem::Poly>::inverse+0x60>
      48:      	adrp	x23, 0x0 <<toyos_crypto::mlkem::Poly>::inverse>
      4c:      	add	x23, x23, #0x0
      50:      	ldr	x9, [sp, #0x8]
      54:      	add	x9, x9, #0x1
      58:      	cmp	x9, #0x8
      5c:      	b.eq	0x150 <<toyos_crypto::mlkem::Poly>::inverse+0x150>
      60:      	mov	w8, #0x2                // =2
      64:      	str	x9, [sp, #0x8]
      68:      	lsl	x25, x8, x9
      6c:      	neg	w8, w25
      70:      	and	x24, x8, #0x100
      74:      	cmp	x25, x24
      78:      	b.hi	0x50 <<toyos_crypto::mlkem::Poly>::inverse+0x50>
      7c:      	mov	w8, #0x1                // =1
      80:      	mov	x21, x20
      84:      	lsl	x8, x8, x9
      88:      	str	x8, [sp, #0x10]
      8c:      	b	0x9c <<toyos_crypto::mlkem::Poly>::inverse+0x9c>
      90:      	sub	x24, x24, x25
      94:      	cmp	x25, x24
      98:      	b.hi	0x50 <<toyos_crypto::mlkem::Poly>::inverse+0x50>
      9c:      	adrp	x8, 0x0 <<toyos_crypto::mlkem::Poly>::inverse>
      a0:      	add	x8, x8, #0x0
      a4:      	cmp	x23, x8
      a8:      	b.eq	0x48 <<toyos_crypto::mlkem::Poly>::inverse+0x48>
      ac:      	ldr	x8, [sp, #0x10]
      b0:      	mov	x0, x21
      b4:      	add	x21, x21, x25, lsl #1
      b8:      	ldrsh	w22, [x23, #-0x2]!
      bc:      	add	x1, x0, x8, lsl #1
      c0:      	add	x8, sp, #0x18
      c4:      	mov	x2, x1
      c8:      	mov	x3, x21
      cc:      	bl	0xcc <<toyos_crypto::mlkem::Poly>::inverse+0xcc>
      d0:      	ldp	x9, x8, [sp, #0x38]
      d4:      	subs	x8, x8, x9
      d8:      	b.ls	0x90 <<toyos_crypto::mlkem::Poly>::inverse+0x90>
      dc:      	ldr	x10, [sp, #0x18]
      e0:      	ldr	x11, [sp, #0x28]
      e4:      	lsl	x12, x9, #1
      e8:      	add	x9, x11, x12
      ec:      	add	x10, x10, x12
      f0:      	ldrh	w11, [x10]
      f4:      	ldrsh	w12, [x9]
      f8:      	add	w12, w12, w11, sxth
      fc:      	sxth	w13, w12
     100:      	cmp	w13, w12
     104:      	b.ne	0x224 <<toyos_crypto::mlkem::Poly>::inverse+0x224>
     108:      	madd	w13, w13, w26, w27
     10c:      	asr	w13, w13, #26
     110:      	madd	w12, w13, w28, w12
     114:      	strh	w12, [x10], #0x2
     118:      	ldrsh	w12, [x9]
     11c:      	sub	w12, w12, w11, sxth
     120:      	sxth	w11, w12
     124:      	cmp	w11, w12
     128:      	b.ne	0x234 <<toyos_crypto::mlkem::Poly>::inverse+0x234>
     12c:      	mul	w11, w11, w22
     130:      	subs	x8, x8, #0x1
     134:      	mul	w12, w11, w19
     138:      	asr	w12, w12, #16
     13c:      	madd	w11, w12, w28, w11
     140:      	lsr	w11, w11, #16
     144:      	strh	w11, [x9], #0x2
     148:      	b.ne	0xf0 <<toyos_crypto::mlkem::Poly>::inverse+0xf0>
     14c:      	b	0x90 <<toyos_crypto::mlkem::Poly>::inverse+0x90>
     150:      	add	x0, sp, #0x18
     154:      	mov	x1, x20
     158:      	mov	w2, #0x200              // =512
     15c:      	add	x19, sp, #0x18
     160:      	bl	0x160 <<toyos_crypto::mlkem::Poly>::inverse+0x160>
     164:      	mov	w8, #0x5a1              // =1441
     168:      	mov	w9, #-0x275f0000        // =-660537344
     16c:      	mvni	v2.4h, #0xd, lsl #8
     170:      	dup	v0.8h, w8
     174:      	dup	v1.4s, w9
     178:      	mov	x8, xzr
     17c:      	add	x9, x19, x8
     180:      	add	x8, x8, #0x20
     184:      	ldp	q3, q4, [x9]
     188:      	cmp	x8, #0x200
     18c:      	ushll	v5.4s, v3.4h, #0x0
     190:      	ushll	v6.4s, v4.4h, #0x0
     194:      	ushll2	v7.4s, v3.8h, #0x0
     198:      	ushll2	v16.4s, v4.8h, #0x0
     19c:      	smull	v17.4s, v3.4h, v0.4h
     1a0:      	smull	v18.4s, v4.4h, v0.4h
     1a4:      	smull2	v3.4s, v3.8h, v0.8h
     1a8:      	smull2	v4.4s, v4.8h, v0.8h
     1ac:      	mul	v5.4s, v5.4s, v1.4s
     1b0:      	mul	v6.4s, v6.4s, v1.4s
     1b4:      	mul	v7.4s, v7.4s, v1.4s
     1b8:      	mul	v16.4s, v16.4s, v1.4s
     1bc:      	shrn	v5.4h, v5.4s, #0x10
     1c0:      	shrn	v6.4h, v6.4s, #0x10
     1c4:      	shrn	v7.4h, v7.4s, #0x10
     1c8:      	shrn	v16.4h, v16.4s, #0x10
     1cc:      	smull	v5.4s, v5.4h, v2.4h
     1d0:      	smull	v6.4s, v6.4h, v2.4h
     1d4:      	smull	v7.4s, v7.4h, v2.4h
     1d8:      	smull	v16.4s, v16.4h, v2.4h
     1dc:      	addhn	v5.4h, v5.4s, v17.4s
     1e0:      	addhn	v6.4h, v6.4s, v18.4s
     1e4:      	addhn2	v5.8h, v7.4s, v3.4s
     1e8:      	addhn2	v6.8h, v16.4s, v4.4s
     1ec:      	stp	q5, q6, [x9]
     1f0:      	b.ne	0x17c <<toyos_crypto::mlkem::Poly>::inverse+0x17c>
     1f4:      	ldr	x0, [sp]
     1f8:      	add	x1, sp, #0x18
     1fc:      	mov	w2, #0x200              // =512
     200:      	bl	0x200 <<toyos_crypto::mlkem::Poly>::inverse+0x200>
     204:      	add	sp, sp, #0x220
     208:      	ldp	x20, x19, [sp, #0x50]
     20c:      	ldp	x22, x21, [sp, #0x40]
     210:      	ldp	x24, x23, [sp, #0x30]
     214:      	ldp	x26, x25, [sp, #0x20]
     218:      	ldp	x28, x27, [sp, #0x10]
     21c:      	ldp	x29, x30, [sp], #0x60
     220:      	ret
     224:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::inverse>
     228:      	add	x0, x0, #0x0
     22c:      	bl	0x22c <<toyos_crypto::mlkem::Poly>::inverse+0x22c>
     230:      	b	0x240 <<toyos_crypto::mlkem::Poly>::inverse+0x240>
     234:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::inverse>
     238:      	add	x0, x0, #0x0
     23c:      	bl	0x23c <<toyos_crypto::mlkem::Poly>::inverse+0x23c>
     240:      	brk	#0x1
     244:      	b	0x248 <<toyos_crypto::mlkem::Poly>::inverse+0x248>
     248:      	mov	x8, xzr
     24c:      	mov	x9, x8
     250:      	add	x8, x8, #0x2
     254:      	cmp	x8, #0x200
     258:      	strh	wzr, [x20, x9]
     25c:      	b.ne	0x24c <<toyos_crypto::mlkem::Poly>::inverse+0x24c>
     260:      	bl	0x260 <<toyos_crypto::mlkem::Poly>::inverse+0x260>

0000000000000000 <<toyos_crypto::mlkem::Poly>::compress>:
       0:      	stp	x29, x30, [sp, #-0x20]!
       4:      	str	x19, [sp, #0x10]
       8:      	mov	x29, sp
       c:      	mov	w10, #-0x1              // =-1
      10:      	mov	x19, x0
      14:      	mov	x9, xzr
      18:      	lsl	w12, w10, w1
      1c:      	mov	w10, #0x4ebf            // =20159
      20:      	mov	w11, #0x2000000         // =33554432
      24:      	mov	w13, #-0xd01            // =-3329
      28:      	mov	w14, #0xd01             // =3329
      2c:      	add	x15, x29, #0x1c
      30:      	mvn	w12, w12
      34:      	ldrsh	w16, [x19, x9]
      38:      	madd	w17, w16, w10, w11
      3c:      	asr	w17, w17, #26
      40:      	madd	w16, w17, w13, w16
      44:      	sxth	w16, w16
      48:      	and	w17, w14, w16, lsr #15
      4c:      	add	w17, w16, w17
      50:      	sxth	w16, w17
      54:      	cmp	w16, w17
      58:      	b.ne	0xc0 <<toyos_crypto::mlkem::Poly>::compress+0xc0>
      5c:      	lsl	w16, w16, w1
      60:      	cmn	w16, #0x681
      64:      	b.hi	0xd0 <<toyos_crypto::mlkem::Poly>::compress+0xd0>
      68:      	str	w14, [x29, #0x1c]
      6c:      	ldr	w17, [x29, #0x1c]
      70:      	cbz	w17, 0xb0 <<toyos_crypto::mlkem::Poly>::compress+0xb0>
      74:      	add	w16, w16, #0x680
      78:      	udiv	w16, w16, w17
      7c:      	add	x17, x9, #0x2
      80:      	cmp	x17, #0x200
      84:      	and	w16, w16, w12
      88:      	strh	w16, [x19, x9]
      8c:      	mov	x9, x17
      90:      	b.ne	0x34 <<toyos_crypto::mlkem::Poly>::compress+0x34>
      94:      	mov	x0, x8
      98:      	mov	x1, x19
      9c:      	mov	w2, #0x200              // =512
      a0:      	bl	0xa0 <<toyos_crypto::mlkem::Poly>::compress+0xa0>
      a4:      	ldr	x19, [sp, #0x10]
      a8:      	ldp	x29, x30, [sp], #0x20
      ac:      	ret
      b0:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::compress>
      b4:      	add	x0, x0, #0x0
      b8:      	bl	0xb8 <<toyos_crypto::mlkem::Poly>::compress+0xb8>
      bc:      	b	0xdc <<toyos_crypto::mlkem::Poly>::compress+0xdc>
      c0:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::compress>
      c4:      	add	x0, x0, #0x0
      c8:      	bl	0xc8 <<toyos_crypto::mlkem::Poly>::compress+0xc8>
      cc:      	b	0xdc <<toyos_crypto::mlkem::Poly>::compress+0xdc>
      d0:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::compress>
      d4:      	add	x0, x0, #0x0
      d8:      	bl	0xd8 <<toyos_crypto::mlkem::Poly>::compress+0xd8>
      dc:      	brk	#0x1
      e0:      	mov	x8, xzr
      e4:      	mov	x9, x8
      e8:      	add	x8, x8, #0x2
      ec:      	cmp	x8, #0x200
      f0:      	strh	wzr, [x19, x9]
      f4:      	b.ne	0xe4 <<toyos_crypto::mlkem::Poly>::compress+0xe4>
      f8:      	bl	0xf8 <<toyos_crypto::mlkem::Poly>::compress+0xf8>

0000000000000000 <<toyos_crypto::mlkem::Poly>::canonical>:
       0:      	stp	x29, x30, [sp, #-0x20]!
       4:      	str	x19, [sp, #0x10]
       8:      	mov	x29, sp
       c:      	mov	x19, x0
      10:      	mov	x9, xzr
      14:      	mov	w10, #0x4ebf            // =20159
      18:      	mov	w11, #0x2000000         // =33554432
      1c:      	mov	w12, #-0xd01            // =-3329
      20:      	mov	w13, #0xd01             // =3329
      24:      	ldrsh	w14, [x19, x9]
      28:      	madd	w15, w14, w10, w11
      2c:      	asr	w15, w15, #26
      30:      	madd	w14, w15, w12, w14
      34:      	sxth	w14, w14
      38:      	and	w15, w13, w14, lsr #15
      3c:      	add	w14, w14, w15
      40:      	sxth	w15, w14
      44:      	cmp	w15, w14
      48:      	b.ne	0x78 <<toyos_crypto::mlkem::Poly>::canonical+0x78>
      4c:      	add	x15, x9, #0x2
      50:      	strh	w14, [x19, x9]
      54:      	cmp	x15, #0x200
      58:      	mov	x9, x15
      5c:      	b.ne	0x24 <<toyos_crypto::mlkem::Poly>::canonical+0x24>
      60:      	mov	x0, x8
      64:      	mov	x1, x19
      68:      	mov	w2, #0x200              // =512
      6c:      	ldr	x19, [sp, #0x10]
      70:      	ldp	x29, x30, [sp], #0x20
      74:      	b	0x74 <<toyos_crypto::mlkem::Poly>::canonical+0x74>
      78:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::canonical>
      7c:      	add	x0, x0, #0x0
      80:      	bl	0x80 <<toyos_crypto::mlkem::Poly>::canonical+0x80>
      84:      	brk	#0x1
      88:      	mov	x8, xzr
      8c:      	mov	x9, x8
      90:      	add	x8, x8, #0x2
      94:      	cmp	x8, #0x200
      98:      	strh	wzr, [x19, x9]
      9c:      	b.ne	0x8c <<toyos_crypto::mlkem::Poly>::canonical+0x8c>
      a0:      	bl	0xa0 <<toyos_crypto::mlkem::Poly>::canonical+0xa0>

0000000000000000 <toyos_crypto::mlkem::dot>:
       0:      	stp	x29, x30, [sp, #-0x60]!
       4:      	stp	x28, x27, [sp, #0x10]
       8:      	stp	x26, x25, [sp, #0x20]
       c:      	stp	x24, x23, [sp, #0x30]
      10:      	stp	x22, x21, [sp, #0x40]
      14:      	stp	x20, x19, [sp, #0x50]
      18:      	mov	x29, sp
      1c:      	sub	sp, sp, #0x210
      20:      	movi	v0.2d, #0000000000000000
      24:      	mov	x20, x1
      28:      	mov	x21, x0
      2c:      	mov	x19, x8
      30:      	mov	x23, xzr
      34:      	mov	w24, #-0xcff0000        // =-218038272
      38:      	adrp	x25, 0x0 <toyos_crypto::mlkem::dot>
      3c:      	add	x25, x25, #0x0
      40:      	mov	w28, #-0xd01            // =-3329
      44:      	mov	w26, #0xd01             // =3329
      48:      	mov	x27, sp
      4c:      	stp	q0, q0, [sp]
      50:      	stp	q0, q0, [sp, #0x20]
      54:      	stp	q0, q0, [sp, #0x40]
      58:      	stp	q0, q0, [sp, #0x60]
      5c:      	stp	q0, q0, [sp, #0x80]
      60:      	stp	q0, q0, [sp, #0xa0]
      64:      	stp	q0, q0, [sp, #0xc0]
      68:      	stp	q0, q0, [sp, #0xe0]
      6c:      	stp	q0, q0, [sp, #0x100]
      70:      	stp	q0, q0, [sp, #0x120]
      74:      	stp	q0, q0, [sp, #0x140]
      78:      	stp	q0, q0, [sp, #0x160]
      7c:      	stp	q0, q0, [sp, #0x180]
      80:      	stp	q0, q0, [sp, #0x1a0]
      84:      	stp	q0, q0, [sp, #0x1c0]
      88:      	stp	q0, q0, [sp, #0x1e0]
      8c:      	ldrsh	w22, [x25], #0x2
      90:      	add	x0, x21, #0x600
      94:      	mov	x1, x21
      98:      	bl	0x98 <toyos_crypto::mlkem::dot+0x98>
      9c:      	tbz	w0, #0x0, 0x20c <toyos_crypto::mlkem::dot+0x20c>
      a0:      	add	x0, x20, #0x600
      a4:      	mov	x1, x20
      a8:      	bl	0xa8 <toyos_crypto::mlkem::dot+0xa8>
      ac:      	tbz	w0, #0x0, 0x20c <toyos_crypto::mlkem::dot+0x20c>
      b0:      	add	x9, x21, x23
      b4:      	add	x10, x20, x23
      b8:      	ldrsh	w11, [x9]
      bc:      	ldrsh	w13, [x10, #0x2]
      c0:      	ldrsh	w14, [x9, #0x2]
      c4:      	ldrsh	w12, [x10]
      c8:      	mul	w8, w13, w11
      cc:      	mul	w15, w12, w14
      d0:      	adds	w8, w8, w15
      d4:      	b.vs	0x228 <toyos_crypto::mlkem::dot+0x228>
      d8:      	mul	w15, w13, w14
      dc:      	ldrsh	w13, [x9, #0x202]
      e0:      	ldrsh	w14, [x10, #0x202]
      e4:      	mul	w12, w12, w11
      e8:      	ldrsh	w11, [x9, #0x200]
      ec:      	ldrsh	w10, [x10, #0x200]
      f0:      	mul	w16, w14, w13
      f4:      	mul	w17, w15, w24
      f8:      	mul	w18, w16, w24
      fc:      	asr	w17, w17, #16
     100:      	madd	w15, w17, w28, w15
     104:      	asr	w17, w18, #16
     108:      	madd	w16, w17, w28, w16
     10c:      	asr	w15, w15, #16
     110:      	madd	w9, w15, w22, w12
     114:      	asr	w12, w16, #16
     118:      	mul	w15, w10, w11
     11c:      	madd	w12, w12, w22, w15
     120:      	adds	w9, w9, w12
     124:      	b.vs	0x240 <toyos_crypto::mlkem::dot+0x240>
     128:      	mul	w11, w14, w11
     12c:      	mul	w10, w10, w13
     130:      	adds	w10, w11, w10
     134:      	b.vs	0x228 <toyos_crypto::mlkem::dot+0x228>
     138:      	adds	w8, w8, w10
     13c:      	b.vs	0x234 <toyos_crypto::mlkem::dot+0x234>
     140:      	add	x12, x21, x23
     144:      	add	x13, x20, x23
     148:      	ldrsh	w10, [x12, #0x402]
     14c:      	ldrsh	w11, [x13, #0x402]
     150:      	ldrsh	w12, [x12, #0x400]
     154:      	ldrsh	w13, [x13, #0x400]
     158:      	mul	w14, w11, w10
     15c:      	mul	w15, w14, w24
     160:      	asr	w15, w15, #16
     164:      	madd	w14, w15, w28, w14
     168:      	mul	w15, w13, w12
     16c:      	asr	w14, w14, #16
     170:      	madd	w14, w14, w22, w15
     174:      	adds	w9, w9, w14
     178:      	b.vs	0x240 <toyos_crypto::mlkem::dot+0x240>
     17c:      	mul	w11, w11, w12
     180:      	mul	w10, w13, w10
     184:      	adds	w10, w11, w10
     188:      	b.vs	0x228 <toyos_crypto::mlkem::dot+0x228>
     18c:      	adds	w8, w8, w10
     190:      	b.vs	0x234 <toyos_crypto::mlkem::dot+0x234>
     194:      	mul	w10, w9, w24
     198:      	asr	w10, w10, #16
     19c:      	mul	w10, w10, w26
     1a0:      	subs	w9, w9, w10
     1a4:      	b.vs	0x250 <toyos_crypto::mlkem::dot+0x250>
     1a8:      	mul	w10, w8, w24
     1ac:      	lsr	w9, w9, #16
     1b0:      	strh	w9, [x27, x23]
     1b4:      	asr	w10, w10, #16
     1b8:      	mul	w10, w10, w26
     1bc:      	subs	w8, w8, w10
     1c0:      	b.vs	0x250 <toyos_crypto::mlkem::dot+0x250>
     1c4:      	lsr	w8, w8, #16
     1c8:      	add	x9, x27, x23
     1cc:      	add	x23, x23, #0x4
     1d0:      	cmp	x23, #0x200
     1d4:      	strh	w8, [x9, #0x2]
     1d8:      	b.ne	0x8c <toyos_crypto::mlkem::dot+0x8c>
     1dc:      	mov	x1, sp
     1e0:      	mov	x0, x19
     1e4:      	mov	w2, #0x200              // =512
     1e8:      	bl	0x1e8 <toyos_crypto::mlkem::dot+0x1e8>
     1ec:      	add	sp, sp, #0x210
     1f0:      	ldp	x20, x19, [sp, #0x50]
     1f4:      	ldp	x22, x21, [sp, #0x40]
     1f8:      	ldp	x24, x23, [sp, #0x30]
     1fc:      	ldp	x26, x25, [sp, #0x20]
     200:      	ldp	x28, x27, [sp, #0x10]
     204:      	ldp	x29, x30, [sp], #0x60
     208:      	ret
     20c:      	adrp	x0, 0x0 <toyos_crypto::mlkem::dot>
     210:      	add	x0, x0, #0x0
     214:      	adrp	x3, 0x0 <toyos_crypto::mlkem::dot>
     218:      	add	x3, x3, #0x0
     21c:      	mov	w1, #0x193              // =403
     220:      	mov	w2, wzr
     224:      	bl	0x224 <toyos_crypto::mlkem::dot+0x224>
     228:      	adrp	x0, 0x0 <toyos_crypto::mlkem::dot>
     22c:      	add	x0, x0, #0x0
     230:      	b	0x248 <toyos_crypto::mlkem::dot+0x248>
     234:      	adrp	x0, 0x0 <toyos_crypto::mlkem::dot>
     238:      	add	x0, x0, #0x0
     23c:      	b	0x248 <toyos_crypto::mlkem::dot+0x248>
     240:      	adrp	x0, 0x0 <toyos_crypto::mlkem::dot>
     244:      	add	x0, x0, #0x0
     248:      	bl	0x248 <toyos_crypto::mlkem::dot+0x248>
     24c:      	b	0x25c <toyos_crypto::mlkem::dot+0x25c>
     250:      	adrp	x0, 0x0 <toyos_crypto::mlkem::dot>
     254:      	add	x0, x0, #0x0
     258:      	bl	0x258 <toyos_crypto::mlkem::dot+0x258>
     25c:      	brk	#0x1
     260:      	bl	0x260 <toyos_crypto::mlkem::dot+0x260>
     264:      	bl	0x264 <toyos_crypto::mlkem::dot+0x264>
     268:      	mov	x8, xzr
     26c:      	mov	x9, sp
     270:      	mov	x10, x8
     274:      	add	x8, x8, #0x2
     278:      	cmp	x8, #0x200
     27c:      	strh	wzr, [x9, x10]
     280:      	b.ne	0x270 <toyos_crypto::mlkem::dot+0x270>
     284:      	bl	0x284 <toyos_crypto::mlkem::dot+0x284>

0000000000000000 <toyos_crypto::mlkem::noise>:
       0:      	stp	x29, x30, [sp, #-0x30]!
       4:      	stp	x28, x21, [sp, #0x10]
       8:      	stp	x20, x19, [sp, #0x20]
       c:      	mov	x29, sp
      10:      	sub	sp, sp, #0x2b0
      14:      	movi	v0.2d, #0000000000000000
      18:      	mov	x19, x8
      1c:      	mov	w8, #0x20               // =32
      20:      	stp	x0, x8, [sp, #0x88]
      24:      	add	x8, sp, #0xac
      28:      	mov	w9, #0x1                // =1
      2c:      	strb	w1, [sp, #0xac]
      30:      	stp	x8, x9, [sp, #0x98]
      34:      	stp	q0, q0, [sp]
      38:      	stp	q0, q0, [sp, #0x20]
      3c:      	stp	q0, q0, [sp, #0x40]
      40:      	stp	q0, q0, [sp, #0x60]
      44:      	add	x8, sp, #0xb0
      48:      	add	x2, sp, #0x88
      4c:      	mov	w0, #0x88               // =136
      50:      	mov	w1, #0x1f               // =31
      54:      	mov	w3, #0x2                // =2
      58:      	bl	0x58 <toyos_crypto::mlkem::noise+0x58>
      5c:      	add	x0, sp, #0xb0
      60:      	mov	x1, sp
      64:      	mov	w2, #0x80               // =128
      68:      	add	x20, sp, #0xb0
      6c:      	mov	x21, sp
      70:      	bl	0x70 <toyos_crypto::mlkem::noise+0x70>
      74:      	movi	v4.2d, #0000000000000000
      78:      	movi	d0, #0x0000ff000000ff
      7c:      	adrp	x9, 0x0 <toyos_crypto::mlkem::noise>
      80:      	movi	v1.2s, #0x2
      84:      	movi	v2.2s, #0x4
      88:      	ldr	d3, [x9]
      8c:      	mov	x8, xzr
      90:      	mov	w9, #0x100              // =256
      94:      	str	xzr, [sp, #0xb0]
      98:      	str	xzr, [sp, #0xb8]
      9c:      	str	xzr, [sp, #0xc0]
      a0:      	str	xzr, [sp, #0xc8]
      a4:      	str	xzr, [sp, #0xd0]
      a8:      	str	xzr, [sp, #0xd8]
      ac:      	str	xzr, [sp, #0xe0]
      b0:      	str	xzr, [sp, #0xe8]
      b4:      	str	xzr, [sp, #0xf0]
      b8:      	str	xzr, [sp, #0xf8]
      bc:      	str	xzr, [sp, #0x100]
      c0:      	str	xzr, [sp, #0x108]
      c4:      	str	xzr, [sp, #0x110]
      c8:      	str	xzr, [sp, #0x118]
      cc:      	str	xzr, [sp, #0x120]
      d0:      	str	xzr, [sp, #0x128]
      d4:      	str	xzr, [sp, #0x130]
      d8:      	str	xzr, [sp, #0x138]
      dc:      	str	xzr, [sp, #0x140]
      e0:      	str	xzr, [sp, #0x148]
      e4:      	str	xzr, [sp, #0x150]
      e8:      	str	xzr, [sp, #0x158]
      ec:      	str	xzr, [sp, #0x160]
      f0:      	str	xzr, [sp, #0x168]
      f4:      	str	xzr, [sp, #0x170]
      f8:      	stp	q4, q4, [sp, #0xb0]
      fc:      	stp	q4, q4, [sp, #0xd0]
     100:      	stp	q4, q4, [sp, #0xf0]
     104:      	stp	q4, q4, [sp, #0x110]
     108:      	stp	q4, q4, [sp, #0x130]
     10c:      	stp	q4, q4, [sp, #0x150]
     110:      	stp	q4, q4, [sp, #0x170]
     114:      	stp	q4, q4, [sp, #0x190]
     118:      	stp	q4, q4, [sp, #0x1b0]
     11c:      	stp	q4, q4, [sp, #0x1d0]
     120:      	stp	q4, q4, [sp, #0x1f0]
     124:      	stp	q4, q4, [sp, #0x210]
     128:      	stp	q4, q4, [sp, #0x230]
     12c:      	stp	q4, q4, [sp, #0x250]
     130:      	stp	q4, q4, [sp, #0x270]
     134:      	stp	q4, q4, [sp, #0x290]
     138:      	ldrb	w10, [x21, x8]
     13c:      	shl	v4.2s, v3.2s, #0x2
     140:      	add	v3.2s, v3.2s, v1.2s
     144:      	subs	x9, x9, #0x2
     148:      	dup	v5.2s, w10
     14c:      	add	x10, x20, x8, lsl #2
     150:      	add	x8, x8, #0x1
     154:      	and	v4.8b, v4.8b, v2.8b
     158:      	and	v5.8b, v5.8b, v0.8b
     15c:      	neg	v4.2s, v4.2s
     160:      	ushl	v4.2s, v5.2s, v4.2s
     164:      	ushr	v5.2s, v4.2s, #0x1
     168:      	ushr	v6.2s, v4.2s, #0x2
     16c:      	ushr	v7.2s, v4.2s, #0x3
     170:      	bic	v4.2s, #0xfe
     174:      	bic	v5.2s, #0x7e
     178:      	bic	v6.2s, #0x3e
     17c:      	bic	v7.2s, #0x1e
     180:      	add	v4.2s, v5.2s, v4.2s
     184:      	add	v5.2s, v6.2s, v7.2s
     188:      	sub	v4.2s, v4.2s, v5.2s
     18c:      	mov	s5, v4.s[1]
     190:      	str	h4, [x10]
     194:      	str	h5, [x10, #0x2]
     198:      	b.ne	0x138 <toyos_crypto::mlkem::noise+0x138>
     19c:      	add	x1, sp, #0xb0
     1a0:      	mov	x0, x19
     1a4:      	mov	w2, #0x200              // =512
     1a8:      	bl	0x1a8 <toyos_crypto::mlkem::noise+0x1a8>
     1ac:      	stp	xzr, xzr, [sp, #0xb0]
     1b0:      	ldr	q0, [sp, #0xb0]
     1b4:      	str	q0, [sp]
     1b8:      	stp	xzr, xzr, [sp, #0xb0]
     1bc:      	ldr	q0, [sp, #0xb0]
     1c0:      	str	q0, [sp, #0x10]
     1c4:      	stp	xzr, xzr, [sp, #0xb0]
     1c8:      	ldr	q0, [sp, #0xb0]
     1cc:      	str	q0, [sp, #0x20]
     1d0:      	stp	xzr, xzr, [sp, #0xb0]
     1d4:      	ldr	q0, [sp, #0xb0]
     1d8:      	str	q0, [sp, #0x30]
     1dc:      	stp	xzr, xzr, [sp, #0xb0]
     1e0:      	ldr	q0, [sp, #0xb0]
     1e4:      	str	q0, [sp, #0x40]
     1e8:      	stp	xzr, xzr, [sp, #0xb0]
     1ec:      	ldr	q0, [sp, #0xb0]
     1f0:      	str	q0, [sp, #0x50]
     1f4:      	stp	xzr, xzr, [sp, #0xb0]
     1f8:      	ldr	q0, [sp, #0xb0]
     1fc:      	str	q0, [sp, #0x60]
     200:      	stp	xzr, xzr, [sp, #0xb0]
     204:      	ldr	q0, [sp, #0xb0]
     208:      	str	q0, [sp, #0x70]
     20c:      	add	sp, sp, #0x2b0
     210:      	ldp	x20, x19, [sp, #0x20]
     214:      	ldp	x28, x21, [sp, #0x10]
     218:      	ldp	x29, x30, [sp], #0x30
     21c:      	ret
     220:      	mov	x19, x0
     224:      	add	x0, sp, #0xb0
     228:      	bl	0x228 <toyos_crypto::mlkem::noise+0x228>
     22c:      	b	0x234 <toyos_crypto::mlkem::noise+0x234>
     230:      	mov	x19, x0
     234:      	mov	x0, sp
     238:      	bl	0x238 <toyos_crypto::mlkem::noise+0x238>
     23c:      	mov	x0, x19
     240:      	bl	0x240 <toyos_crypto::mlkem::noise+0x240>
     244:      	bl	0x244 <toyos_crypto::mlkem::noise+0x244>

0000000000000000 <toyos_crypto::mlkem::sample>:
       0:      	stp	x29, x30, [sp, #-0x40]!
       4:      	str	x28, [sp, #0x10]
       8:      	stp	x22, x21, [sp, #0x20]
       c:      	stp	x20, x19, [sp, #0x30]
      10:      	mov	x29, sp
      14:      	sub	sp, sp, #0x390
      18:      	mov	x19, x8
      1c:      	mov	w8, #0x20               // =32
      20:      	sub	x22, x29, #0xb0
      24:      	stp	x0, x8, [sp, #0xe0]
      28:      	mov	w8, #0x2                // =2
      2c:      	mov	w0, #0xa8               // =168
      30:      	sturb	w2, [x29, #-0xb0]
      34:      	add	x2, sp, #0xe0
      38:      	mov	w3, #0x2                // =2
      3c:      	sturb	w1, [x29, #-0xaf]
      40:      	mov	w1, #0x1f               // =31
      44:      	add	x20, sp, #0xe0
      48:      	stp	x22, x8, [sp, #0xf0]
      4c:      	add	x8, sp, #0x8
      50:      	bl	0x50 <toyos_crypto::mlkem::sample+0x50>
      54:      	movi	v0.2d, #0000000000000000
      58:      	mov	x21, xzr
      5c:      	stur	xzr, [x29, #-0x10]
      60:      	orr	x22, x22, #0x2
      64:      	stp	q0, q0, [x20]
      68:      	stp	q0, q0, [x20, #0x20]
      6c:      	stp	q0, q0, [x20, #0x40]
      70:      	stp	q0, q0, [x20, #0x60]
      74:      	stp	q0, q0, [x20, #0x80]
      78:      	stp	q0, q0, [x20, #0xa0]
      7c:      	stp	q0, q0, [x20, #0xc0]
      80:      	stp	q0, q0, [x20, #0xe0]
      84:      	stp	q0, q0, [x20, #0x100]
      88:      	stp	q0, q0, [x20, #0x120]
      8c:      	stp	q0, q0, [x20, #0x140]
      90:      	stp	q0, q0, [x20, #0x160]
      94:      	stp	q0, q0, [x20, #0x180]
      98:      	stp	q0, q0, [x20, #0x1a0]
      9c:      	stp	q0, q0, [x20, #0x1c0]
      a0:      	stp	q0, q0, [x20, #0x1e0]
      a4:      	stp	q0, q0, [x20, #0x200]
      a8:      	stp	q0, q0, [x20, #0x220]
      ac:      	stp	q0, q0, [x20, #0x240]
      b0:      	stp	q0, q0, [x20, #0x260]
      b4:      	stp	q0, q0, [x20, #0x280]
      b8:      	b	0xc4 <toyos_crypto::mlkem::sample+0xc4>
      bc:      	cmp	x21, #0x100
      c0:      	b.hs	0x138 <toyos_crypto::mlkem::sample+0x138>
      c4:      	add	x0, sp, #0x8
      c8:      	sub	x1, x29, #0xb0
      cc:      	mov	w2, #0xa8               // =168
      d0:      	bl	0xd0 <toyos_crypto::mlkem::sample+0xd0>
      d4:      	mov	w8, #0xa8               // =168
      d8:      	mov	x9, x22
      dc:      	b	0xec <toyos_crypto::mlkem::sample+0xec>
      e0:      	subs	x8, x8, #0x3
      e4:      	add	x9, x9, #0x3
      e8:      	b.eq	0xbc <toyos_crypto::mlkem::sample+0xbc>
      ec:      	ldurb	w11, [x9, #-0x2]
      f0:      	ldurb	w10, [x9, #-0x1]
      f4:      	bfi	w11, w10, #8, #4
      f8:      	cmp	w11, #0xd00
      fc:      	b.hi	0x110 <toyos_crypto::mlkem::sample+0x110>
     100:      	cmp	x21, #0x100
     104:      	b.hs	0x110 <toyos_crypto::mlkem::sample+0x110>
     108:      	strh	w11, [x20, x21, lsl #1]
     10c:      	add	x21, x21, #0x1
     110:      	ldrb	w11, [x9]
     114:      	lsr	w10, w10, #4
     118:      	orr	w10, w10, w11, lsl #4
     11c:      	cmp	w10, #0xd00
     120:      	b.hi	0xe0 <toyos_crypto::mlkem::sample+0xe0>
     124:      	cmp	x21, #0xff
     128:      	b.hi	0xe0 <toyos_crypto::mlkem::sample+0xe0>
     12c:      	strh	w10, [x20, x21, lsl #1]
     130:      	add	x21, x21, #0x1
     134:      	b	0xe0 <toyos_crypto::mlkem::sample+0xe0>
     138:      	add	x1, sp, #0xe0
     13c:      	mov	x0, x19
     140:      	mov	w2, #0x200              // =512
     144:      	bl	0x144 <toyos_crypto::mlkem::sample+0x144>
     148:      	str	xzr, [sp, #0x8]
     14c:      	str	xzr, [sp, #0x10]
     150:      	str	xzr, [sp, #0x18]
     154:      	str	xzr, [sp, #0x20]
     158:      	str	xzr, [sp, #0x28]
     15c:      	str	xzr, [sp, #0x30]
     160:      	str	xzr, [sp, #0x38]
     164:      	str	xzr, [sp, #0x40]
     168:      	str	xzr, [sp, #0x48]
     16c:      	str	xzr, [sp, #0x50]
     170:      	str	xzr, [sp, #0x58]
     174:      	str	xzr, [sp, #0x60]
     178:      	str	xzr, [sp, #0x68]
     17c:      	str	xzr, [sp, #0x70]
     180:      	str	xzr, [sp, #0x78]
     184:      	str	xzr, [sp, #0x80]
     188:      	str	xzr, [sp, #0x88]
     18c:      	str	xzr, [sp, #0x90]
     190:      	str	xzr, [sp, #0x98]
     194:      	str	xzr, [sp, #0xa0]
     198:      	str	xzr, [sp, #0xa8]
     19c:      	str	xzr, [sp, #0xb0]
     1a0:      	str	xzr, [sp, #0xb8]
     1a4:      	str	xzr, [sp, #0xc0]
     1a8:      	str	xzr, [sp, #0xc8]
     1ac:      	add	sp, sp, #0x390
     1b0:      	ldp	x20, x19, [sp, #0x30]
     1b4:      	ldr	x28, [sp, #0x10]
     1b8:      	ldp	x22, x21, [sp, #0x20]
     1bc:      	ldp	x29, x30, [sp], #0x40
     1c0:      	ret
     1c4:      	mov	x19, x0
     1c8:      	mov	x8, xzr
     1cc:      	add	x9, sp, #0xe0
     1d0:      	mov	x10, x8
     1d4:      	add	x8, x8, #0x2
     1d8:      	cmp	x8, #0x200
     1dc:      	strh	wzr, [x9, x10]
     1e0:      	b.ne	0x1d0 <toyos_crypto::mlkem::sample+0x1d0>
     1e4:      	add	x0, sp, #0x8
     1e8:      	bl	0x1e8 <toyos_crypto::mlkem::sample+0x1e8>
     1ec:      	mov	x0, x19
     1f0:      	bl	0x1f0 <toyos_crypto::mlkem::sample+0x1f0>
     1f4:      	bl	0x1f4 <toyos_crypto::mlkem::sample+0x1f4>

~/.claude/jobs/2280e09e/tmp/scratchpad/agents/mlkem/target-rlib/aarch64-unknown-toyos/toyos/libtoyos_crypto.rlib(toyos_crypto-4ee49e0b7450663d.9f6k7mhywuwm5c8obfrgk4gd2.0vpx7cd.rcgu.o):	file format elf64-littleaarch64

0000000000000000 <<toyos_crypto::keccak::Sponge>::new>:
       0:      	sub	sp, sp, #0x140
       4:      	stp	x29, x30, [sp, #0xe0]
       8:      	stp	x28, x27, [sp, #0xf0]
       c:      	stp	x26, x25, [sp, #0x100]
      10:      	stp	x24, x23, [sp, #0x110]
      14:      	stp	x22, x21, [sp, #0x120]
      18:      	stp	x20, x19, [sp, #0x130]
      1c:      	add	x29, sp, #0xe0
      20:      	mov	x22, x2
      24:      	mov	w21, w1
      28:      	mov	x20, x0
      2c:      	cmp	x0, #0x48
      30:      	mov	x19, x8
      34:      	b.eq	0x48 <<toyos_crypto::keccak::Sponge>::new+0x48>
      38:      	cmp	x20, #0x88
      3c:      	b.eq	0x48 <<toyos_crypto::keccak::Sponge>::new+0x48>
      40:      	cmp	x20, #0xa8
      44:      	b.ne	0x274 <<toyos_crypto::keccak::Sponge>::new+0x274>
      48:      	movi	v0.2d, #0000000000000000
      4c:      	stp	xzr, x20, [sp, #0xc0]
      50:      	str	xzr, [sp, #0xd0]
      54:      	stp	q0, q0, [sp]
      58:      	stp	q0, q0, [sp, #0x20]
      5c:      	stp	q0, q0, [sp, #0x40]
      60:      	stp	q0, q0, [sp, #0x60]
      64:      	stp	q0, q0, [sp, #0x80]
      68:      	stp	q0, q0, [sp, #0xa0]
      6c:      	cbz	x3, 0x190 <<toyos_crypto::keccak::Sponge>::new+0x190>
      70:      	add	x25, x22, x3, lsl #4
      74:      	mov	x8, xzr
      78:      	mov	x26, sp
      7c:      	adrp	x23, 0x0 <<toyos_crypto::keccak::Sponge>::new>
      80:      	add	x23, x23, #0x0
      84:      	b	0x94 <<toyos_crypto::keccak::Sponge>::new+0x94>
      88:      	add	x22, x22, #0x10
      8c:      	cmp	x22, x25
      90:      	b.eq	0x148 <<toyos_crypto::keccak::Sponge>::new+0x148>
      94:      	ldr	x1, [x22, #0x8]
      98:      	cbz	x1, 0x88 <<toyos_crypto::keccak::Sponge>::new+0x88>
      9c:      	ldr	x27, [x22]
      a0:      	b	0xb0 <<toyos_crypto::keccak::Sponge>::new+0xb0>
      a4:      	add	x27, x27, x24
      a8:      	mov	x1, x28
      ac:      	cbz	x28, 0x88 <<toyos_crypto::keccak::Sponge>::new+0x88>
      b0:      	tst	x8, #0x7
      b4:      	b.ne	0xe8 <<toyos_crypto::keccak::Sponge>::new+0xe8>
      b8:      	cmp	x1, #0x8
      bc:      	b.lo	0xe8 <<toyos_crypto::keccak::Sponge>::new+0xe8>
      c0:      	cmp	x8, #0xc7
      c4:      	b.hi	0x248 <<toyos_crypto::keccak::Sponge>::new+0x248>
      c8:      	ldr	x9, [x27]
      cc:      	ldr	x10, [x26, x8]
      d0:      	mov	w24, #0x8               // =8
      d4:      	eor	x9, x10, x9
      d8:      	str	x9, [x26, x8]
      dc:      	subs	x28, x1, x24
      e0:      	b.hs	0x118 <<toyos_crypto::keccak::Sponge>::new+0x118>
      e4:      	b	0x220 <<toyos_crypto::keccak::Sponge>::new+0x220>
      e8:      	lsr	x0, x8, #3
      ec:      	cmp	x8, #0xc7
      f0:      	b.hi	0x254 <<toyos_crypto::keccak::Sponge>::new+0x254>
      f4:      	ldrb	w9, [x27]
      f8:      	ubfiz	x8, x8, #3, #3
      fc:      	mov	w24, #0x1               // =1
     100:      	lsl	x8, x9, x8
     104:      	ldr	x9, [x26, x0, lsl #3]
     108:      	eor	x8, x8, x9
     10c:      	str	x8, [x26, x0, lsl #3]
     110:      	subs	x28, x1, x24
     114:      	b.lo	0x220 <<toyos_crypto::keccak::Sponge>::new+0x220>
     118:      	ldr	x8, [sp, #0xd0]
     11c:      	adds	x8, x8, x24
     120:      	b.hs	0x238 <<toyos_crypto::keccak::Sponge>::new+0x238>
     124:      	ldr	x9, [sp, #0xc8]
     128:      	str	x8, [sp, #0xd0]
     12c:      	cmp	x8, x9
     130:      	b.ne	0xa4 <<toyos_crypto::keccak::Sponge>::new+0xa4>
     134:      	mov	x0, sp
     138:      	bl	0x138 <<toyos_crypto::keccak::Sponge>::new+0x138>
     13c:      	mov	x8, xzr
     140:      	str	xzr, [sp, #0xd0]
     144:      	b	0xa4 <<toyos_crypto::keccak::Sponge>::new+0xa4>
     148:      	lsr	x0, x8, #3
     14c:      	cmp	x8, #0xc7
     150:      	b.hi	0x184 <<toyos_crypto::keccak::Sponge>::new+0x184>
     154:      	ubfiz	x8, x8, #3, #3
     158:      	mov	x9, sp
     15c:      	and	x10, x21, #0xff
     160:      	ldr	x11, [x9, x0, lsl #3]
     164:      	lsl	x8, x10, x8
     168:      	eor	x8, x8, x11
     16c:      	str	x8, [x9, x0, lsl #3]
     170:      	cbz	x20, 0x264 <<toyos_crypto::keccak::Sponge>::new+0x264>
     174:      	sub	x8, x20, #0x1
     178:      	cmp	x20, #0xc9
     17c:      	lsr	x0, x8, #3
     180:      	b.lo	0x1a0 <<toyos_crypto::keccak::Sponge>::new+0x1a0>
     184:      	adrp	x23, 0x0 <<toyos_crypto::keccak::Sponge>::new>
     188:      	add	x23, x23, #0x0
     18c:      	b	0x254 <<toyos_crypto::keccak::Sponge>::new+0x254>
     190:      	sub	x8, x20, #0x1
     194:      	and	x9, x21, #0xff
     198:      	lsr	x0, x8, #3
     19c:      	str	x9, [sp]
     1a0:      	ubfiz	x8, x8, #3, #3
     1a4:      	mov	w9, #0x80               // =128
     1a8:      	mov	x10, sp
     1ac:      	lsl	x8, x9, x8
     1b0:      	ldr	x9, [x10, x0, lsl #3]
     1b4:      	eor	x8, x9, x8
     1b8:      	str	x8, [x10, x0, lsl #3]
     1bc:      	mov	x0, sp
     1c0:      	bl	0x1c0 <<toyos_crypto::keccak::Sponge>::new+0x1c0>
     1c4:      	ldp	q0, q1, [sp, #0xa0]
     1c8:      	ldr	q2, [sp, #0xc0]
     1cc:      	str	xzr, [x19, #0xd0]
     1d0:      	str	q2, [x19, #0xc0]
     1d4:      	stp	q0, q1, [x19, #0xa0]
     1d8:      	ldp	q0, q1, [sp, #0x60]
     1dc:      	stp	q0, q1, [x19, #0x60]
     1e0:      	ldp	q2, q0, [sp, #0x80]
     1e4:      	stp	q2, q0, [x19, #0x80]
     1e8:      	ldp	q1, q0, [sp, #0x20]
     1ec:      	stp	q1, q0, [x19, #0x20]
     1f0:      	ldp	q2, q0, [sp, #0x40]
     1f4:      	stp	q2, q0, [x19, #0x40]
     1f8:      	ldp	q1, q0, [sp]
     1fc:      	stp	q1, q0, [x19]
     200:      	ldp	x20, x19, [sp, #0x130]
     204:      	ldp	x22, x21, [sp, #0x120]
     208:      	ldp	x24, x23, [sp, #0x110]
     20c:      	ldp	x26, x25, [sp, #0x100]
     210:      	ldp	x28, x27, [sp, #0xf0]
     214:      	ldp	x29, x30, [sp, #0xe0]
     218:      	add	sp, sp, #0x140
     21c:      	ret
     220:      	adrp	x3, 0x0 <<toyos_crypto::keccak::Sponge>::new>
     224:      	add	x3, x3, #0x0
     228:      	mov	x0, x24
     22c:      	mov	x2, x1
     230:      	bl	0x230 <<toyos_crypto::keccak::Sponge>::new+0x230>
     234:      	b	0x270 <<toyos_crypto::keccak::Sponge>::new+0x270>
     238:      	adrp	x0, 0x0 <<toyos_crypto::keccak::Sponge>::new>
     23c:      	add	x0, x0, #0x0
     240:      	bl	0x240 <<toyos_crypto::keccak::Sponge>::new+0x240>
     244:      	b	0x270 <<toyos_crypto::keccak::Sponge>::new+0x270>
     248:      	lsr	x0, x8, #3
     24c:      	adrp	x23, 0x0 <<toyos_crypto::keccak::Sponge>::new>
     250:      	add	x23, x23, #0x0
     254:      	mov	w1, #0x19               // =25
     258:      	mov	x2, x23
     25c:      	bl	0x25c <<toyos_crypto::keccak::Sponge>::new+0x25c>
     260:      	b	0x270 <<toyos_crypto::keccak::Sponge>::new+0x270>
     264:      	adrp	x0, 0x0 <<toyos_crypto::keccak::Sponge>::new>
     268:      	add	x0, x0, #0x0
     26c:      	bl	0x26c <<toyos_crypto::keccak::Sponge>::new+0x26c>
     270:      	brk	#0x1
     274:      	adrp	x0, 0x0 <<toyos_crypto::keccak::Sponge>::new>
     278:      	add	x0, x0, #0x0
     27c:      	adrp	x2, 0x0 <<toyos_crypto::keccak::Sponge>::new>
     280:      	add	x2, x2, #0x0
     284:      	mov	w1, #0x30               // =48
     288:      	bl	0x288 <<toyos_crypto::keccak::Sponge>::new+0x288>
     28c:      	str	xzr, [sp]
     290:      	str	xzr, [sp, #0x8]
     294:      	str	xzr, [sp, #0x10]
     298:      	str	xzr, [sp, #0x18]
     29c:      	str	xzr, [sp, #0x20]
     2a0:      	str	xzr, [sp, #0x28]
     2a4:      	str	xzr, [sp, #0x30]
     2a8:      	str	xzr, [sp, #0x38]
     2ac:      	str	xzr, [sp, #0x40]
     2b0:      	str	xzr, [sp, #0x48]
     2b4:      	str	xzr, [sp, #0x50]
     2b8:      	str	xzr, [sp, #0x58]
     2bc:      	str	xzr, [sp, #0x60]
     2c0:      	str	xzr, [sp, #0x68]
     2c4:      	str	xzr, [sp, #0x70]
     2c8:      	str	xzr, [sp, #0x78]
     2cc:      	str	xzr, [sp, #0x80]
     2d0:      	str	xzr, [sp, #0x88]
     2d4:      	str	xzr, [sp, #0x90]
     2d8:      	str	xzr, [sp, #0x98]
     2dc:      	str	xzr, [sp, #0xa0]
     2e0:      	str	xzr, [sp, #0xa8]
     2e4:      	str	xzr, [sp, #0xb0]
     2e8:      	str	xzr, [sp, #0xb8]
     2ec:      	str	xzr, [sp, #0xc0]
     2f0:      	bl	0x2f0 <<toyos_crypto::keccak::Sponge>::new+0x2f0>

0000000000000000 <<toyos_crypto::keccak::Sponge>::read>:
       0:      	sub	sp, sp, #0x60
       4:      	stp	x29, x30, [sp, #0x10]
       8:      	stp	x26, x25, [sp, #0x20]
       c:      	stp	x24, x23, [sp, #0x30]
      10:      	stp	x22, x21, [sp, #0x40]
      14:      	stp	x20, x19, [sp, #0x50]
      18:      	add	x29, sp, #0x10
      1c:      	cbz	x2, 0xbc <<toyos_crypto::keccak::Sponge>::read+0xbc>
      20:      	ldr	x25, [x0, #0xd0]
      24:      	mov	x19, x2
      28:      	mov	x21, x1
      2c:      	mov	x20, x0
      30:      	mov	w23, #0x8               // =8
      34:      	add	x24, sp, #0x8
      38:      	ldr	x8, [x20, #0xc8]
      3c:      	cmp	x25, x8
      40:      	b.ne	0x54 <<toyos_crypto::keccak::Sponge>::read+0x54>
      44:      	mov	x0, x20
      48:      	bl	0x48 <<toyos_crypto::keccak::Sponge>::read+0x48>
      4c:      	mov	x25, xzr
      50:      	str	xzr, [x20, #0xd0]
      54:      	ands	x0, x25, #0x7
      58:      	lsr	x8, x25, #3
      5c:      	ccmp	x19, #0x7, #0x0, eq
      60:      	csinc	x22, x23, xzr, hi
      64:      	cmp	x25, #0xc7
      68:      	b.hi	0x11c <<toyos_crypto::keccak::Sponge>::read+0x11c>
      6c:      	ldr	x8, [x20, x8, lsl #3]
      70:      	subs	x19, x19, x22
      74:      	str	x8, [sp, #0x8]
      78:      	b.lo	0xe8 <<toyos_crypto::keccak::Sponge>::read+0xe8>
      7c:      	add	x1, x22, x0
      80:      	cmp	x1, #0x9
      84:      	b.hs	0xd8 <<toyos_crypto::keccak::Sponge>::read+0xd8>
      88:      	add	x1, x24, x0
      8c:      	subs	x8, x1, x21
      90:      	cneg	x8, x8, ls
      94:      	cmp	x8, x22
      98:      	b.lo	0x100 <<toyos_crypto::keccak::Sponge>::read+0x100>
      9c:      	mov	x0, x21
      a0:      	mov	x2, x22
      a4:      	add	x26, x21, x22
      a8:      	bl	0xa8 <<toyos_crypto::keccak::Sponge>::read+0xa8>
      ac:      	add	x25, x22, x25
      b0:      	mov	x21, x26
      b4:      	str	x25, [x20, #0xd0]
      b8:      	cbnz	x19, 0x38 <<toyos_crypto::keccak::Sponge>::read+0x38>
      bc:      	ldp	x20, x19, [sp, #0x50]
      c0:      	ldp	x22, x21, [sp, #0x40]
      c4:      	ldp	x24, x23, [sp, #0x30]
      c8:      	ldp	x26, x25, [sp, #0x20]
      cc:      	ldp	x29, x30, [sp, #0x10]
      d0:      	add	sp, sp, #0x60
      d4:      	ret
      d8:      	adrp	x3, 0x0 <<toyos_crypto::keccak::Sponge>::read>
      dc:      	add	x3, x3, #0x0
      e0:      	mov	w2, #0x8                // =8
      e4:      	bl	0xe4 <<toyos_crypto::keccak::Sponge>::read+0xe4>
      e8:      	adrp	x0, 0x0 <<toyos_crypto::keccak::Sponge>::read>
      ec:      	add	x0, x0, #0x0
      f0:      	adrp	x2, 0x0 <<toyos_crypto::keccak::Sponge>::read>
      f4:      	add	x2, x2, #0x0
      f8:      	mov	w1, #0x13               // =19
      fc:      	bl	0xfc <<toyos_crypto::keccak::Sponge>::read+0xfc>
     100:      	adrp	x0, 0x0 <<toyos_crypto::keccak::Sponge>::read>
     104:      	add	x0, x0, #0x0
     108:      	adrp	x3, 0x0 <<toyos_crypto::keccak::Sponge>::read>
     10c:      	add	x3, x3, #0x0
     110:      	mov	w1, #0x237              // =567
     114:      	mov	w2, wzr
     118:      	bl	0x118 <<toyos_crypto::keccak::Sponge>::read+0x118>
     11c:      	adrp	x2, 0x0 <<toyos_crypto::keccak::Sponge>::read>
     120:      	add	x2, x2, #0x0
     124:      	mov	x0, x8
     128:      	mov	w1, #0x19               // =25
     12c:      	bl	0x12c <<toyos_crypto::keccak::Sponge>::read+0x12c>

0000000000000000 <toyos_crypto::keccak::g>:
       0:      	sub	sp, sp, #0x140
       4:      	stp	x29, x30, [sp, #0x120]
       8:      	stp	x28, x19, [sp, #0x130]
       c:      	add	x29, sp, #0x120
      10:      	movi	v0.2d, #0000000000000000
      14:      	mov	x3, x1
      18:      	mov	x2, x0
      1c:      	mov	x19, x8
      20:      	add	x8, sp, #0x48
      24:      	mov	w0, #0x48               // =72
      28:      	mov	w1, #0x6                // =6
      2c:      	stp	q0, q0, [sp]
      30:      	stp	q0, q0, [sp, #0x20]
      34:      	bl	0x34 <toyos_crypto::keccak::g+0x34>
      38:      	add	x0, sp, #0x48
      3c:      	mov	x1, sp
      40:      	mov	w2, #0x40               // =64
      44:      	bl	0x44 <toyos_crypto::keccak::g+0x44>
      48:      	str	xzr, [sp, #0x48]
      4c:      	str	xzr, [sp, #0x50]
      50:      	str	xzr, [sp, #0x58]
      54:      	str	xzr, [sp, #0x60]
      58:      	str	xzr, [sp, #0x68]
      5c:      	str	xzr, [sp, #0x70]
      60:      	str	xzr, [sp, #0x78]
      64:      	str	xzr, [sp, #0x80]
      68:      	str	xzr, [sp, #0x88]
      6c:      	str	xzr, [sp, #0x90]
      70:      	str	xzr, [sp, #0x98]
      74:      	str	xzr, [sp, #0xa0]
      78:      	str	xzr, [sp, #0xa8]
      7c:      	str	xzr, [sp, #0xb0]
      80:      	str	xzr, [sp, #0xb8]
      84:      	str	xzr, [sp, #0xc0]
      88:      	str	xzr, [sp, #0xc8]
      8c:      	str	xzr, [sp, #0xd0]
      90:      	str	xzr, [sp, #0xd8]
      94:      	str	xzr, [sp, #0xe0]
      98:      	str	xzr, [sp, #0xe8]
      9c:      	str	xzr, [sp, #0xf0]
      a0:      	str	xzr, [sp, #0xf8]
      a4:      	str	xzr, [sp, #0x100]
      a8:      	str	xzr, [sp, #0x108]
      ac:      	ldp	q0, q1, [sp]
      b0:      	stp	q0, q1, [x19]
      b4:      	ldp	q2, q0, [sp, #0x20]
      b8:      	stp	q2, q0, [x19, #0x20]
      bc:      	ldp	x28, x19, [sp, #0x130]
      c0:      	ldp	x29, x30, [sp, #0x120]
      c4:      	add	sp, sp, #0x140
      c8:      	ret
      cc:      	mov	x19, x0
      d0:      	add	x0, sp, #0x48
      d4:      	bl	0xd4 <toyos_crypto::keccak::g+0xd4>
      d8:      	mov	x0, x19
      dc:      	bl	0xdc <toyos_crypto::keccak::g+0xdc>
      e0:      	bl	0xe0 <toyos_crypto::keccak::g+0xe0>

0000000000000000 <toyos_crypto::keccak::h>:
       0:      	sub	sp, sp, #0x120
       4:      	stp	x29, x30, [sp, #0x100]
       8:      	stp	x28, x19, [sp, #0x110]
       c:      	add	x29, sp, #0x100
      10:      	movi	v0.2d, #0000000000000000
      14:      	mov	x3, x1
      18:      	mov	x2, x0
      1c:      	mov	x19, x8
      20:      	add	x8, sp, #0x28
      24:      	mov	w0, #0x88               // =136
      28:      	mov	w1, #0x6                // =6
      2c:      	stp	q0, q0, [sp]
      30:      	bl	0x30 <toyos_crypto::keccak::h+0x30>
      34:      	add	x0, sp, #0x28
      38:      	mov	x1, sp
      3c:      	mov	w2, #0x20               // =32
      40:      	bl	0x40 <toyos_crypto::keccak::h+0x40>
      44:      	str	xzr, [sp, #0x28]
      48:      	str	xzr, [sp, #0x30]
      4c:      	str	xzr, [sp, #0x38]
      50:      	str	xzr, [sp, #0x40]
      54:      	str	xzr, [sp, #0x48]
      58:      	str	xzr, [sp, #0x50]
      5c:      	str	xzr, [sp, #0x58]
      60:      	str	xzr, [sp, #0x60]
      64:      	str	xzr, [sp, #0x68]
      68:      	str	xzr, [sp, #0x70]
      6c:      	str	xzr, [sp, #0x78]
      70:      	str	xzr, [sp, #0x80]
      74:      	str	xzr, [sp, #0x88]
      78:      	str	xzr, [sp, #0x90]
      7c:      	str	xzr, [sp, #0x98]
      80:      	str	xzr, [sp, #0xa0]
      84:      	str	xzr, [sp, #0xa8]
      88:      	str	xzr, [sp, #0xb0]
      8c:      	str	xzr, [sp, #0xb8]
      90:      	str	xzr, [sp, #0xc0]
      94:      	str	xzr, [sp, #0xc8]
      98:      	str	xzr, [sp, #0xd0]
      9c:      	str	xzr, [sp, #0xd8]
      a0:      	str	xzr, [sp, #0xe0]
      a4:      	str	xzr, [sp, #0xe8]
      a8:      	ldp	q0, q1, [sp]
      ac:      	stp	q0, q1, [x19]
      b0:      	ldp	x28, x19, [sp, #0x110]
      b4:      	ldp	x29, x30, [sp, #0x100]
      b8:      	add	sp, sp, #0x120
      bc:      	ret
      c0:      	mov	x19, x0
      c4:      	add	x0, sp, #0x28
      c8:      	bl	0xc8 <toyos_crypto::keccak::h+0xc8>
      cc:      	mov	x0, x19
      d0:      	bl	0xd0 <toyos_crypto::keccak::h+0xd0>
      d4:      	bl	0xd4 <toyos_crypto::keccak::h+0xd4>

0000000000000000 <toyos_crypto::keccak::j>:
       0:      	sub	sp, sp, #0x120
       4:      	stp	x29, x30, [sp, #0x100]
       8:      	stp	x28, x19, [sp, #0x110]
       c:      	add	x29, sp, #0x100
      10:      	movi	v0.2d, #0000000000000000
      14:      	mov	x3, x1
      18:      	mov	x2, x0
      1c:      	mov	x19, x8
      20:      	add	x8, sp, #0x28
      24:      	mov	w0, #0x88               // =136
      28:      	mov	w1, #0x1f               // =31
      2c:      	stp	q0, q0, [sp]
      30:      	bl	0x30 <toyos_crypto::keccak::j+0x30>
      34:      	add	x0, sp, #0x28
      38:      	mov	x1, sp
      3c:      	mov	w2, #0x20               // =32
      40:      	bl	0x40 <toyos_crypto::keccak::j+0x40>
      44:      	str	xzr, [sp, #0x28]
      48:      	str	xzr, [sp, #0x30]
      4c:      	str	xzr, [sp, #0x38]
      50:      	str	xzr, [sp, #0x40]
      54:      	str	xzr, [sp, #0x48]
      58:      	str	xzr, [sp, #0x50]
      5c:      	str	xzr, [sp, #0x58]
      60:      	str	xzr, [sp, #0x60]
      64:      	str	xzr, [sp, #0x68]
      68:      	str	xzr, [sp, #0x70]
      6c:      	str	xzr, [sp, #0x78]
      70:      	str	xzr, [sp, #0x80]
      74:      	str	xzr, [sp, #0x88]
      78:      	str	xzr, [sp, #0x90]
      7c:      	str	xzr, [sp, #0x98]
      80:      	str	xzr, [sp, #0xa0]
      84:      	str	xzr, [sp, #0xa8]
      88:      	str	xzr, [sp, #0xb0]
      8c:      	str	xzr, [sp, #0xb8]
      90:      	str	xzr, [sp, #0xc0]
      94:      	str	xzr, [sp, #0xc8]
      98:      	str	xzr, [sp, #0xd0]
      9c:      	str	xzr, [sp, #0xd8]
      a0:      	str	xzr, [sp, #0xe0]
      a4:      	str	xzr, [sp, #0xe8]
      a8:      	ldp	q0, q1, [sp]
      ac:      	stp	q0, q1, [x19]
      b0:      	ldp	x28, x19, [sp, #0x110]
      b4:      	ldp	x29, x30, [sp, #0x100]
      b8:      	add	sp, sp, #0x120
      bc:      	ret
      c0:      	mov	x19, x0
      c4:      	add	x0, sp, #0x28
      c8:      	bl	0xc8 <toyos_crypto::keccak::j+0xc8>
      cc:      	mov	x0, x19
      d0:      	bl	0xd0 <toyos_crypto::keccak::j+0xd0>
      d4:      	bl	0xd4 <toyos_crypto::keccak::j+0xd4>

0000000000000000 <toyos_crypto::keccak::permute (.llvm.14554226097406905790)>:
       0:      	sub	sp, sp, #0xd0
       4:      	stp	x29, x30, [sp, #0x70]
       8:      	stp	x28, x27, [sp, #0x80]
       c:      	stp	x26, x25, [sp, #0x90]
      10:      	stp	x24, x23, [sp, #0xa0]
      14:      	stp	x22, x21, [sp, #0xb0]
      18:      	stp	x20, x19, [sp, #0xc0]
      1c:      	add	x29, sp, #0x70
      20:      	ldp	x13, x10, [x0]
      24:      	mov	x8, xzr
      28:      	ldp	x9, x15, [x0, #0x10]
      2c:      	ldr	x11, [x0, #0xc0]
      30:      	ldp	x3, x2, [x0, #0x50]
      34:      	str	x0, [sp, #0x8]
      38:      	ldp	x16, x21, [x0, #0xa0]
      3c:      	stp	x9, x10, [x29, #-0x10]
      40:      	ldp	x23, x17, [x0, #0x30]
      44:      	ldp	x6, x4, [x0, #0x80]
      48:      	ldp	x7, x1, [x0, #0x60]
      4c:      	ldp	x19, x12, [x0, #0xb0]
      50:      	ldp	x18, x24, [x0, #0x20]
      54:      	ldp	x9, x28, [x0, #0x40]
      58:      	ldp	x5, x27, [x0, #0x70]
      5c:      	ldp	x22, x26, [x0, #0x90]
      60:      	stur	x9, [x29, #-0x18]
      64:      	stur	x8, [x29, #-0x20]
      68:      	mov	x8, x28
      6c:      	eor	x28, x27, x16
      70:      	eor	x30, x3, x24
      74:      	eor	x10, x6, x21
      78:      	eor	x9, x2, x23
      7c:      	stp	x5, x11, [sp, #0x10]
      80:      	eor	x28, x28, x30
      84:      	eor	x9, x10, x9
      88:      	eor	x10, x26, x11
      8c:      	eor	x30, x5, x8
      90:      	eor	x0, x4, x19
      94:      	eor	x11, x7, x17
      98:      	mov	x14, x24
      9c:      	mov	x24, x4
      a0:      	mov	x4, x17
      a4:      	mov	x17, x15
      a8:      	ldur	x15, [x29, #-0x8]
      ac:      	ldur	x5, [x29, #-0x18]
      b0:      	eor	x10, x10, x30
      b4:      	eor	x11, x0, x11
      b8:      	eor	x9, x9, x15
      bc:      	eor	x10, x10, x18
      c0:      	eor	x0, x22, x12
      c4:      	eor	x30, x1, x5
      c8:      	mov	x25, x22
      cc:      	mov	x22, x12
      d0:      	eor	x12, x10, x9, ror #63
      d4:      	eor	x0, x0, x30
      d8:      	mov	x20, x1
      dc:      	ldur	x1, [x29, #-0x10]
      e0:      	eor	x30, x0, x17
      e4:      	eor	x28, x28, x13
      e8:      	eor	x0, x12, x3
      ec:      	eor	x3, x12, x27
      f0:      	eor	x27, x9, x30, ror #63
      f4:      	eor	x11, x11, x1
      f8:      	eor	x13, x12, x13
      fc:      	eor	x14, x12, x14
     100:      	str	x13, [sp, #0x28]
     104:      	eor	x13, x28, x11, ror #63
     108:      	eor	x10, x11, x10, ror #63
     10c:      	eor	x11, x27, x4
     110:      	eor	x4, x30, x28, ror #63
     114:      	eor	x12, x12, x16
     118:      	stur	x3, [x29, #-0x28]
     11c:      	eor	x16, x13, x23
     120:      	eor	x9, x13, x2
     124:      	str	x12, [sp, #0x20]
     128:      	eor	x12, x13, x15
     12c:      	eor	x23, x13, x6
     130:      	eor	x21, x13, x21
     134:      	eor	x13, x27, x7
     138:      	eor	x7, x4, x18
     13c:      	ldp	x3, x18, [sp, #0x10]
     140:      	str	x9, [sp, #0x30]
     144:      	eor	x9, x27, x1
     148:      	eor	x15, x10, x5
     14c:      	eor	x2, x27, x19
     150:      	stur	x9, [x29, #-0x30]
     154:      	eor	x9, x27, x24
     158:      	eor	x27, x10, x17
     15c:      	str	x15, [sp, #0x38]
     160:      	eor	x15, x10, x20
     164:      	eor	x17, x10, x25
     168:      	eor	x30, x4, x18
     16c:      	eor	x25, x4, x3
     170:      	ror	x3, x15, #0x27
     174:      	ror	x15, x17, #0x2b
     178:      	ror	x17, x30, #0x32
     17c:      	eor	x28, x4, x26
     180:      	ror	x26, x14, #0x1c
     184:      	ror	x14, x16, #0x14
     188:      	ror	x13, x13, #0x15
     18c:      	bic	x19, x17, x15
     190:      	ror	x20, x7, #0x25
     194:      	eor	x1, x4, x8
     198:      	bic	x30, x13, x14
     19c:      	bic	x7, x15, x13
     1a0:      	eor	x13, x19, x13
     1a4:      	ldr	x19, [sp, #0x28]
     1a8:      	ror	x4, x12, #0x3f
     1ac:      	ror	x12, x27, #0x24
     1b0:      	ror	x2, x2, #0x3
     1b4:      	eor	x7, x14, x7
     1b8:      	ror	x5, x11, #0x3a
     1bc:      	ror	x11, x1, #0x2c
     1c0:      	ror	x1, x23, #0x13
     1c4:      	ldr	x18, [sp, #0x20]
     1c8:      	stp	x13, x7, [x29, #-0x10]
     1cc:      	bic	x13, x19, x17
     1d0:      	ror	x16, x0, #0x3d
     1d4:      	eor	x15, x13, x15
     1d8:      	bic	x13, x14, x19
     1dc:      	bic	x14, x12, x2
     1e0:      	ror	x6, x18, #0x2e
     1e4:      	eor	x18, x13, x17
     1e8:      	bic	x13, x2, x1
     1ec:      	eor	x14, x1, x14
     1f0:      	eor	x10, x10, x22
     1f4:      	eor	x17, x13, x16
     1f8:      	stur	x14, [x29, #-0x18]
     1fc:      	bic	x14, x1, x16
     200:      	bic	x13, x16, x11
     204:      	ror	x7, x28, #0x38
     208:      	ror	x10, x10, #0x8
     20c:      	eor	x24, x13, x12
     210:      	eor	x23, x14, x11
     214:      	bic	x11, x11, x12
     218:      	bic	x12, x4, x6
     21c:      	eor	x28, x11, x2
     220:      	bic	x11, x6, x7
     224:      	eor	x1, x12, x7
     228:      	bic	x12, x7, x3
     22c:      	ldr	x13, [sp, #0x30]
     230:      	ror	x9, x9, #0x31
     234:      	eor	x7, x11, x3
     238:      	bic	x11, x3, x5
     23c:      	eor	x2, x12, x5
     240:      	bic	x12, x20, x10
     244:      	ror	x13, x13, #0x36
     248:      	eor	x3, x4, x11
     24c:      	bic	x11, x5, x4
     250:      	eor	x22, x12, x9
     254:      	ldur	x8, [x29, #-0x20]
     258:      	ldp	x14, x12, [x29, #-0x30]
     25c:      	eor	x5, x11, x6
     260:      	bic	x11, x10, x9
     264:      	ldr	x16, [sp, #0x38]
     268:      	bic	x9, x9, x13
     26c:      	eor	x4, x13, x11
     270:      	bic	x11, x13, x26
     274:      	ror	x13, x21, #0x3e
     278:      	eor	x27, x11, x20
     27c:      	adrp	x11, 0x0 <toyos_crypto::keccak::permute (.llvm.14554226097406905790)>
     280:      	add	x11, x11, #0x0
     284:      	ror	x12, x12, #0x17
     288:      	eor	x6, x9, x26
     28c:      	bic	x9, x26, x20
     290:      	ldr	x11, [x11, x8]
     294:      	ror	x0, x16, #0x9
     298:      	ror	x21, x25, #0x19
     29c:      	ror	x14, x14, #0x2
     2a0:      	eor	x26, x9, x10
     2a4:      	bic	x9, x13, x12
     2a8:      	eor	x10, x11, x19
     2ac:      	bic	x11, x21, x0
     2b0:      	eor	x19, x9, x21
     2b4:      	bic	x9, x12, x21
     2b8:      	add	x8, x8, #0x8
     2bc:      	eor	x16, x11, x14
     2c0:      	eor	x21, x9, x0
     2c4:      	bic	x9, x0, x14
     2c8:      	bic	x11, x14, x13
     2cc:      	cmp	x8, #0xc0
     2d0:      	eor	x12, x11, x12
     2d4:      	eor	x11, x13, x9
     2d8:      	eor	x13, x10, x30
     2dc:      	b.ne	0x64 <toyos_crypto::keccak::permute (.llvm.14554226097406905790)+0x64>
     2e0:      	ldp	x9, x10, [x29, #-0x18]
     2e4:      	ldr	x8, [sp, #0x8]
     2e8:      	stp	x18, x24, [x8, #0x20]
     2ec:      	stp	x9, x28, [x8, #0x40]
     2f0:      	ldur	x9, [x29, #-0x8]
     2f4:      	stp	x10, x15, [x8, #0x10]
     2f8:      	stp	x23, x17, [x8, #0x30]
     2fc:      	stp	x3, x2, [x8, #0x50]
     300:      	stp	x7, x1, [x8, #0x60]
     304:      	stp	x5, x27, [x8, #0x70]
     308:      	stp	x6, x4, [x8, #0x80]
     30c:      	stp	x22, x26, [x8, #0x90]
     310:      	stp	x16, x21, [x8, #0xa0]
     314:      	stp	x19, x12, [x8, #0xb0]
     318:      	str	x11, [x8, #0xc0]
     31c:      	stp	x13, x9, [x8]
     320:      	ldp	x20, x19, [sp, #0xc0]
     324:      	ldp	x22, x21, [sp, #0xb0]
     328:      	ldp	x24, x23, [sp, #0xa0]
     32c:      	ldp	x26, x25, [sp, #0x90]
     330:      	ldp	x28, x27, [sp, #0x80]
     334:      	ldp	x29, x30, [sp, #0x70]
     338:      	add	sp, sp, #0xd0
     33c:      	ret

~/.claude/jobs/2280e09e/tmp/scratchpad/agents/mlkem/target-rlib/aarch64-unknown-toyos/toyos/libtoyos_crypto.rlib(toyos_crypto-4ee49e0b7450663d.bch0gigm1s8zea5225mv2fk7t.0vpx7cd.rcgu.o):	file format elf64-littleaarch64

0000000000000000 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>>:
       0:      	mov	x8, xzr
       4:      	mov	x9, x8
       8:      	add	x8, x8, #0x2
       c:      	cmp	x8, #0x200
      10:      	strh	wzr, [x0, x9]
      14:      	b.ne	0x4 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>+0x4>
      18:      	mov	x8, xzr
      1c:      	add	x9, x0, #0x200
      20:      	strh	wzr, [x9, x8]
      24:      	add	x8, x8, #0x2
      28:      	cmp	x8, #0x200
      2c:      	b.ne	0x20 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>+0x20>
      30:      	mov	x8, xzr
      34:      	add	x9, x0, #0x400
      38:      	strh	wzr, [x9, x8]
      3c:      	add	x8, x8, #0x2
      40:      	cmp	x8, #0x200
      44:      	b.ne	0x38 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>+0x38>
      48:      	sub	sp, sp, #0x20
      4c:      	stp	x29, x30, [sp, #0x10]
      50:      	add	x29, sp, #0x10
      54:      	stp	xzr, xzr, [sp]
      58:      	ldr	q0, [sp]
      5c:      	str	q0, [x0, #0xac0]
      60:      	stp	xzr, xzr, [sp]
      64:      	ldr	q0, [sp]
      68:      	str	q0, [x0, #0xad0]
      6c:      	ldp	x29, x30, [sp, #0x10]
      70:      	add	sp, sp, #0x20
      74:      	ret

0000000000000000 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>:
       0:      	stp	x29, x30, [sp, #-0x10]!
       4:      	mov	x29, sp
       8:      	mov	x8, xzr
       c:      	mov	x9, x8
      10:      	add	x8, x8, #0x2
      14:      	cmp	x8, #0x200
      18:      	strh	wzr, [x0, x9]
      1c:      	b.ne	0xc <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop+0xc>
      20:      	ldp	x29, x30, [sp], #0x10
      24:      	ret

0000000000000000 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>:
       0:      	stp	x29, x30, [sp, #-0x10]!
       4:      	mov	x29, sp
       8:      	str	xzr, [x0]
       c:      	str	xzr, [x0, #0x8]
      10:      	str	xzr, [x0, #0x10]
      14:      	str	xzr, [x0, #0x18]
      18:      	str	xzr, [x0, #0x20]
      1c:      	str	xzr, [x0, #0x28]
      20:      	str	xzr, [x0, #0x30]
      24:      	str	xzr, [x0, #0x38]
      28:      	str	xzr, [x0, #0x40]
      2c:      	str	xzr, [x0, #0x48]
      30:      	str	xzr, [x0, #0x50]
      34:      	str	xzr, [x0, #0x58]
      38:      	str	xzr, [x0, #0x60]
      3c:      	str	xzr, [x0, #0x68]
      40:      	str	xzr, [x0, #0x70]
      44:      	str	xzr, [x0, #0x78]
      48:      	str	xzr, [x0, #0x80]
      4c:      	str	xzr, [x0, #0x88]
      50:      	str	xzr, [x0, #0x90]
      54:      	str	xzr, [x0, #0x98]
      58:      	str	xzr, [x0, #0xa0]
      5c:      	str	xzr, [x0, #0xa8]
      60:      	str	xzr, [x0, #0xb0]
      64:      	str	xzr, [x0, #0xb8]
      68:      	str	xzr, [x0, #0xc0]
      6c:      	ldp	x29, x30, [sp], #0x10
      70:      	ret

