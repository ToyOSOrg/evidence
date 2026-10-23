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
      1c:      	b.ne	0x174 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x174>
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
      7c:      	tbz	w0, #0x0, 0x158 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x158>
      80:      	add	x0, x20, #0x20
      84:      	mov	x1, x20
      88:      	bl	0x88 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x88>
      8c:      	cbz	w0, 0x158 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x158>
      90:      	sub	x9, x29, #0x10
      94:      	mov	x8, xzr
      98:      	mov	x12, sp
      9c:      	sub	x10, x9, x20
      a0:      	sub	x11, x20, x9
      a4:      	cmp	x20, x9
      a8:      	stp	xzr, xzr, [x29, #-0x10]
      ac:      	csel	x13, x10, x11, lo
      b0:      	cbz	x13, 0x13c <<toyos_crypto::mlkem::Poly>::decode::<1>+0x13c>
      b4:      	ldrb	w13, [x20], #0x1
      b8:      	add	x14, x12, x8
      bc:      	add	x8, x8, #0x10
      c0:      	sub	x10, x10, #0x1
      c4:      	add	x11, x11, #0x1
      c8:      	sturb	w13, [x29, #-0x10]
      cc:      	cmp	x8, #0x200
      d0:      	ldurh	w13, [x29, #-0x10]
      d4:      	and	w15, w13, #0x1
      d8:      	ubfx	w16, w13, #1, #1
      dc:      	strh	w15, [x14]
      e0:      	ubfx	w15, w13, #2, #1
      e4:      	strh	w16, [x14, #0x2]
      e8:      	ubfx	w16, w13, #3, #1
      ec:      	strh	w15, [x14, #0x4]
      f0:      	ubfx	w15, w13, #4, #1
      f4:      	strh	w16, [x14, #0x6]
      f8:      	ubfx	w16, w13, #5, #1
      fc:      	strh	w15, [x14, #0x8]
     100:      	ubfx	w15, w13, #6, #1
     104:      	ubfx	w13, w13, #7, #1
     108:      	strh	w16, [x14, #0xa]
     10c:      	strh	w15, [x14, #0xc]
     110:      	strh	w13, [x14, #0xe]
     114:      	b.ne	0xa4 <<toyos_crypto::mlkem::Poly>::decode::<1>+0xa4>
     118:      	mov	x1, sp
     11c:      	mov	x0, x19
     120:      	mov	w2, #0x200              // =512
     124:      	bl	0x124 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x124>
     128:      	add	sp, sp, #0x210
     12c:      	ldp	x20, x19, [sp, #0x20]
     130:      	ldr	x28, [sp, #0x10]
     134:      	ldp	x29, x30, [sp], #0x30
     138:      	ret
     13c:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<1>>
     140:      	add	x0, x0, #0x0
     144:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<1>>
     148:      	add	x3, x3, #0x0
     14c:      	mov	w1, #0x237              // =567
     150:      	mov	w2, wzr
     154:      	bl	0x154 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x154>
     158:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<1>>
     15c:      	add	x0, x0, #0x0
     160:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<1>>
     164:      	add	x3, x3, #0x0
     168:      	mov	w1, #0x193              // =403
     16c:      	mov	w2, wzr
     170:      	bl	0x170 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x170>
     174:      	adrp	x2, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<1>>
     178:      	add	x2, x2, #0x0
     17c:      	adrp	x5, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<1>>
     180:      	add	x5, x5, #0x0
     184:      	mov	x1, sp
     188:      	mov	w0, wzr
     18c:      	mov	x3, xzr
     190:      	bl	0x190 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x190>
     194:      	bl	0x194 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x194>
     198:      	bl	0x198 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x198>

0000000000000000 <<toyos_crypto::mlkem::Poly>::decode::<4>>:
       0:      	stp	x29, x30, [sp, #-0x30]!
       4:      	str	x28, [sp, #0x10]
       8:      	stp	x20, x19, [sp, #0x20]
       c:      	mov	x29, sp
      10:      	sub	sp, sp, #0x210
      14:      	cmp	x1, #0x80
      18:      	str	x1, [sp]
      1c:      	b.ne	0x170 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x170>
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
      7c:      	tbz	w0, #0x0, 0x154 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x154>
      80:      	add	x0, x20, #0x80
      84:      	mov	x1, x20
      88:      	bl	0x88 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x88>
      8c:      	cbz	w0, 0x154 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x154>
      90:      	sub	x9, x29, #0x10
      94:      	mov	x8, xzr
      98:      	mov	x12, sp
      9c:      	sub	x10, x9, x20
      a0:      	sub	x11, x20, x9
      a4:      	cmp	x20, x9
      a8:      	stp	xzr, xzr, [x29, #-0x10]
      ac:      	csel	x13, x10, x11, lo
      b0:      	cmp	x13, #0x3
      b4:      	b.ls	0x138 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x138>
      b8:      	ldr	w13, [x20], #0x4
      bc:      	add	x14, x12, x8
      c0:      	add	x8, x8, #0x10
      c4:      	sub	x10, x10, #0x4
      c8:      	add	x11, x11, #0x4
      cc:      	and	w15, w13, #0xf
      d0:      	ubfx	w16, w13, #4, #4
      d4:      	cmp	x8, #0x200
      d8:      	strh	w15, [x14]
      dc:      	ubfx	w15, w13, #8, #4
      e0:      	strh	w16, [x14, #0x2]
      e4:      	ubfx	w16, w13, #12, #4
      e8:      	strh	w15, [x14, #0x4]
      ec:      	ubfx	w15, w13, #16, #4
      f0:      	strh	w16, [x14, #0x6]
      f4:      	ubfx	w16, w13, #20, #4
      f8:      	strh	w15, [x14, #0x8]
      fc:      	ubfx	w15, w13, #24, #4
     100:      	lsr	w13, w13, #28
     104:      	strh	w16, [x14, #0xa]
     108:      	strh	w15, [x14, #0xc]
     10c:      	strh	w13, [x14, #0xe]
     110:      	b.ne	0xa4 <<toyos_crypto::mlkem::Poly>::decode::<4>+0xa4>
     114:      	mov	x1, sp
     118:      	mov	x0, x19
     11c:      	mov	w2, #0x200              // =512
     120:      	bl	0x120 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x120>
     124:      	add	sp, sp, #0x210
     128:      	ldp	x20, x19, [sp, #0x20]
     12c:      	ldr	x28, [sp, #0x10]
     130:      	ldp	x29, x30, [sp], #0x30
     134:      	ret
     138:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<4>>
     13c:      	add	x0, x0, #0x0
     140:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<4>>
     144:      	add	x3, x3, #0x0
     148:      	mov	w1, #0x237              // =567
     14c:      	mov	w2, wzr
     150:      	bl	0x150 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x150>
     154:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<4>>
     158:      	add	x0, x0, #0x0
     15c:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<4>>
     160:      	add	x3, x3, #0x0
     164:      	mov	w1, #0x193              // =403
     168:      	mov	w2, wzr
     16c:      	bl	0x16c <<toyos_crypto::mlkem::Poly>::decode::<4>+0x16c>
     170:      	adrp	x2, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<4>>
     174:      	add	x2, x2, #0x0
     178:      	adrp	x5, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<4>>
     17c:      	add	x5, x5, #0x0
     180:      	mov	x1, sp
     184:      	mov	w0, wzr
     188:      	mov	x3, xzr
     18c:      	bl	0x18c <<toyos_crypto::mlkem::Poly>::decode::<4>+0x18c>
     190:      	bl	0x190 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x190>
     194:      	bl	0x194 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x194>

0000000000000000 <<toyos_crypto::mlkem::Poly>::decode::<10>>:
       0:      	stp	x29, x30, [sp, #-0x30]!
       4:      	str	x28, [sp, #0x10]
       8:      	stp	x20, x19, [sp, #0x20]
       c:      	mov	x29, sp
      10:      	sub	sp, sp, #0x210
      14:      	cmp	x1, #0x140
      18:      	str	x1, [sp]
      1c:      	b.ne	0x180 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x180>
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
      7c:      	tbz	w0, #0x0, 0x164 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x164>
      80:      	add	x0, x20, #0x140
      84:      	mov	x1, x20
      88:      	bl	0x88 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x88>
      8c:      	cbz	w0, 0x164 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x164>
      90:      	sub	x9, x29, #0x10
      94:      	mov	x8, xzr
      98:      	mov	x12, sp
      9c:      	sub	x10, x9, x20
      a0:      	sub	x11, x20, x9
      a4:      	cmp	x20, x9
      a8:      	stp	xzr, xzr, [x29, #-0x10]
      ac:      	csel	x13, x10, x11, lo
      b0:      	cmp	x13, #0x9
      b4:      	b.ls	0x148 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x148>
      b8:      	ldrh	w13, [x20, #0x8]
      bc:      	ldr	x14, [x20], #0xa
      c0:      	add	x15, x12, x8
      c4:      	add	x8, x8, #0x10
      c8:      	sub	x10, x10, #0xa
      cc:      	ubfx	w17, w14, #20, #10
      d0:      	sturh	w13, [x29, #-0x8]
      d4:      	and	w13, w14, #0x3ff
      d8:      	ubfx	w16, w14, #10, #10
      dc:      	strh	w13, [x15]
      e0:      	ubfx	x13, x14, #30, #10
      e4:      	strh	w17, [x15, #0x4]
      e8:      	ldur	x17, [x29, #-0x8]
      ec:      	cmp	x8, #0x200
      f0:      	strh	w16, [x15, #0x2]
      f4:      	ubfx	x16, x14, #40, #10
      f8:      	add	x11, x11, #0xa
      fc:      	strh	w13, [x15, #0x6]
     100:      	ubfx	x13, x14, #50, #10
     104:      	extr	x14, x17, x14, #0x3c
     108:      	strh	w16, [x15, #0x8]
     10c:      	ubfx	w16, w17, #6, #10
     110:      	strh	w13, [x15, #0xa]
     114:      	and	w13, w14, #0x3ff
     118:      	strh	w16, [x15, #0xe]
     11c:      	strh	w13, [x15, #0xc]
     120:      	b.ne	0xa4 <<toyos_crypto::mlkem::Poly>::decode::<10>+0xa4>
     124:      	mov	x1, sp
     128:      	mov	x0, x19
     12c:      	mov	w2, #0x200              // =512
     130:      	bl	0x130 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x130>
     134:      	add	sp, sp, #0x210
     138:      	ldp	x20, x19, [sp, #0x20]
     13c:      	ldr	x28, [sp, #0x10]
     140:      	ldp	x29, x30, [sp], #0x30
     144:      	ret
     148:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<10>>
     14c:      	add	x0, x0, #0x0
     150:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<10>>
     154:      	add	x3, x3, #0x0
     158:      	mov	w1, #0x237              // =567
     15c:      	mov	w2, wzr
     160:      	bl	0x160 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x160>
     164:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<10>>
     168:      	add	x0, x0, #0x0
     16c:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<10>>
     170:      	add	x3, x3, #0x0
     174:      	mov	w1, #0x193              // =403
     178:      	mov	w2, wzr
     17c:      	bl	0x17c <<toyos_crypto::mlkem::Poly>::decode::<10>+0x17c>
     180:      	adrp	x2, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<10>>
     184:      	add	x2, x2, #0x0
     188:      	adrp	x5, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<10>>
     18c:      	add	x5, x5, #0x0
     190:      	mov	x1, sp
     194:      	mov	w0, wzr
     198:      	mov	x3, xzr
     19c:      	bl	0x19c <<toyos_crypto::mlkem::Poly>::decode::<10>+0x19c>
     1a0:      	bl	0x1a0 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1a0>
     1a4:      	bl	0x1a4 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1a4>

0000000000000000 <<toyos_crypto::mlkem::Poly>::decode::<12>>:
       0:      	stp	x29, x30, [sp, #-0x30]!
       4:      	str	x28, [sp, #0x10]
       8:      	stp	x20, x19, [sp, #0x20]
       c:      	mov	x29, sp
      10:      	sub	sp, sp, #0x210
      14:      	cmp	x1, #0x180
      18:      	str	x1, [sp]
      1c:      	b.ne	0x180 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x180>
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
      7c:      	tbz	w0, #0x0, 0x164 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x164>
      80:      	add	x0, x20, #0x180
      84:      	mov	x1, x20
      88:      	bl	0x88 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x88>
      8c:      	cbz	w0, 0x164 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x164>
      90:      	sub	x9, x29, #0x10
      94:      	mov	x8, xzr
      98:      	mov	x12, sp
      9c:      	sub	x10, x9, x20
      a0:      	sub	x11, x20, x9
      a4:      	cmp	x20, x9
      a8:      	stp	xzr, xzr, [x29, #-0x10]
      ac:      	csel	x13, x10, x11, lo
      b0:      	cmp	x13, #0xb
      b4:      	b.ls	0x148 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x148>
      b8:      	ldr	w13, [x20, #0x8]
      bc:      	ldr	x14, [x20], #0xc
      c0:      	add	x15, x12, x8
      c4:      	add	x8, x8, #0x10
      c8:      	sub	x10, x10, #0xc
      cc:      	ubfx	w16, w14, #12, #12
      d0:      	stur	w13, [x29, #-0x8]
      d4:      	and	w13, w14, #0xfff
      d8:      	ubfx	x17, x14, #24, #12
      dc:      	strh	w13, [x15]
      e0:      	ubfx	x13, x14, #36, #12
      e4:      	strh	w16, [x15, #0x2]
      e8:      	ldur	x16, [x29, #-0x8]
      ec:      	cmp	x8, #0x200
      f0:      	strh	w17, [x15, #0x4]
      f4:      	ubfx	x17, x14, #48, #12
      f8:      	add	x11, x11, #0xc
      fc:      	strh	w13, [x15, #0x6]
     100:      	ubfx	w13, w16, #8, #12
     104:      	extr	x14, x16, x14, #0x3c
     108:      	lsr	w16, w16, #20
     10c:      	strh	w17, [x15, #0x8]
     110:      	strh	w13, [x15, #0xc]
     114:      	and	w13, w14, #0xfff
     118:      	strh	w16, [x15, #0xe]
     11c:      	strh	w13, [x15, #0xa]
     120:      	b.ne	0xa4 <<toyos_crypto::mlkem::Poly>::decode::<12>+0xa4>
     124:      	mov	x1, sp
     128:      	mov	x0, x19
     12c:      	mov	w2, #0x200              // =512
     130:      	bl	0x130 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x130>
     134:      	add	sp, sp, #0x210
     138:      	ldp	x20, x19, [sp, #0x20]
     13c:      	ldr	x28, [sp, #0x10]
     140:      	ldp	x29, x30, [sp], #0x30
     144:      	ret
     148:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<12>>
     14c:      	add	x0, x0, #0x0
     150:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<12>>
     154:      	add	x3, x3, #0x0
     158:      	mov	w1, #0x237              // =567
     15c:      	mov	w2, wzr
     160:      	bl	0x160 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x160>
     164:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<12>>
     168:      	add	x0, x0, #0x0
     16c:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<12>>
     170:      	add	x3, x3, #0x0
     174:      	mov	w1, #0x193              // =403
     178:      	mov	w2, wzr
     17c:      	bl	0x17c <<toyos_crypto::mlkem::Poly>::decode::<12>+0x17c>
     180:      	adrp	x2, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<12>>
     184:      	add	x2, x2, #0x0
     188:      	adrp	x5, 0x0 <<toyos_crypto::mlkem::Poly>::decode::<12>>
     18c:      	add	x5, x5, #0x0
     190:      	mov	x1, sp
     194:      	mov	w0, wzr
     198:      	mov	x3, xzr
     19c:      	bl	0x19c <<toyos_crypto::mlkem::Poly>::decode::<12>+0x19c>
     1a0:      	bl	0x1a0 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1a0>
     1a4:      	bl	0x1a4 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1a4>

0000000000000000 <<toyos_crypto::mlkem::Poly>::encode::<1>>:
       0:      	sub	sp, sp, #0x30
       4:      	stp	x29, x30, [sp, #0x10]
       8:      	stp	x20, x19, [sp, #0x20]
       c:      	add	x29, sp, #0x10
      10:      	cmp	x2, #0x20
      14:      	str	x2, [sp]
      18:      	b.ne	0x108 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x108>
      1c:      	mov	x20, x0
      20:      	mov	x19, x1
      24:      	add	x0, x0, #0x200
      28:      	mov	x1, x20
      2c:      	bl	0x2c <<toyos_crypto::mlkem::Poly>::encode::<1>+0x2c>
      30:      	tbz	w0, #0x0, 0xec <<toyos_crypto::mlkem::Poly>::encode::<1>+0xec>
      34:      	add	x0, x19, #0x20
      38:      	mov	x1, x19
      3c:      	bl	0x3c <<toyos_crypto::mlkem::Poly>::encode::<1>+0x3c>
      40:      	cbz	w0, 0xec <<toyos_crypto::mlkem::Poly>::encode::<1>+0xec>
      44:      	mov	x8, sp
      48:      	add	x11, x20, #0x8
      4c:      	mov	w12, #0x200             // =512
      50:      	sub	x9, x19, x8
      54:      	sub	x10, x8, x19
      58:      	ldrh	w13, [x11]
      5c:      	ldrh	w14, [x11, #0x2]
      60:      	cmp	x8, x19
      64:      	ldurh	w15, [x11, #-0x2]
      68:      	lsl	x13, x13, #4
      6c:      	orr	x13, x13, x14, lsl #5
      70:      	ldurh	w14, [x11, #-0x4]
      74:      	orr	x13, x13, x15, lsl #3
      78:      	ldurh	w15, [x11, #-0x8]
      7c:      	orr	x13, x13, x14, lsl #2
      80:      	ldurh	w14, [x11, #-0x6]
      84:      	orr	x13, x13, x15
      88:      	ldrh	w15, [x11, #0x4]
      8c:      	orr	x13, x13, x14, lsl #1
      90:      	ldrh	w14, [x11, #0x6]
      94:      	orr	x13, x13, x15, lsl #6
      98:      	orr	x13, x13, x14, lsl #7
      9c:      	csel	x14, x9, x10, lo
      a0:      	stp	x13, xzr, [sp]
      a4:      	cbz	x14, 0xd0 <<toyos_crypto::mlkem::Poly>::encode::<1>+0xd0>
      a8:      	sub	x12, x12, #0x10
      ac:      	add	x11, x11, #0x10
      b0:      	add	x9, x9, #0x1
      b4:      	sub	x10, x10, #0x1
      b8:      	strb	w13, [x19], #0x1
      bc:      	cbnz	x12, 0x58 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x58>
      c0:      	ldp	x20, x19, [sp, #0x20]
      c4:      	ldp	x29, x30, [sp, #0x10]
      c8:      	add	sp, sp, #0x30
      cc:      	ret
      d0:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<1>>
      d4:      	add	x0, x0, #0x0
      d8:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<1>>
      dc:      	add	x3, x3, #0x0
      e0:      	mov	w1, #0x237              // =567
      e4:      	mov	w2, wzr
      e8:      	bl	0xe8 <<toyos_crypto::mlkem::Poly>::encode::<1>+0xe8>
      ec:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<1>>
      f0:      	add	x0, x0, #0x0
      f4:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<1>>
      f8:      	add	x3, x3, #0x0
      fc:      	mov	w1, #0x193              // =403
     100:      	mov	w2, wzr
     104:      	bl	0x104 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x104>
     108:      	adrp	x2, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<1>>
     10c:      	add	x2, x2, #0x0
     110:      	adrp	x5, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<1>>
     114:      	add	x5, x5, #0x0
     118:      	mov	x1, sp
     11c:      	mov	w0, wzr
     120:      	mov	x3, xzr
     124:      	bl	0x124 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x124>
     128:      	bl	0x128 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x128>
     12c:      	bl	0x12c <<toyos_crypto::mlkem::Poly>::encode::<1>+0x12c>

0000000000000000 <<toyos_crypto::mlkem::Poly>::encode::<4>>:
       0:      	sub	sp, sp, #0x30
       4:      	stp	x29, x30, [sp, #0x10]
       8:      	stp	x20, x19, [sp, #0x20]
       c:      	add	x29, sp, #0x10
      10:      	cmp	x2, #0x80
      14:      	str	x2, [sp]
      18:      	b.ne	0x108 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x108>
      1c:      	mov	x20, x0
      20:      	mov	x19, x1
      24:      	add	x0, x0, #0x200
      28:      	mov	x1, x20
      2c:      	bl	0x2c <<toyos_crypto::mlkem::Poly>::encode::<4>+0x2c>
      30:      	tbz	w0, #0x0, 0xec <<toyos_crypto::mlkem::Poly>::encode::<4>+0xec>
      34:      	add	x0, x19, #0x80
      38:      	mov	x1, x19
      3c:      	bl	0x3c <<toyos_crypto::mlkem::Poly>::encode::<4>+0x3c>
      40:      	cbz	w0, 0xec <<toyos_crypto::mlkem::Poly>::encode::<4>+0xec>
      44:      	mov	x8, sp
      48:      	add	x11, x20, #0x8
      4c:      	mov	w12, #0x20              // =32
      50:      	sub	x9, x19, x8
      54:      	sub	x10, x8, x19
      58:      	ldurh	w13, [x11, #-0x8]
      5c:      	ldurh	w14, [x11, #-0x6]
      60:      	cmp	x8, x19
      64:      	orr	x13, x13, x14, lsl #4
      68:      	ldurh	w14, [x11, #-0x4]
      6c:      	orr	x13, x13, x14, lsl #8
      70:      	ldurh	w14, [x11, #-0x2]
      74:      	orr	x13, x13, x14, lsl #12
      78:      	ldrh	w14, [x11]
      7c:      	orr	x13, x13, x14, lsl #16
      80:      	ldrh	w14, [x11, #0x2]
      84:      	orr	x13, x13, x14, lsl #20
      88:      	ldrh	w14, [x11, #0x4]
      8c:      	orr	x13, x13, x14, lsl #24
      90:      	ldrh	w14, [x11, #0x6]
      94:      	orr	x13, x13, x14, lsl #28
      98:      	csel	x14, x9, x10, lo
      9c:      	cmp	x14, #0x3
      a0:      	stp	x13, xzr, [sp]
      a4:      	b.ls	0xd0 <<toyos_crypto::mlkem::Poly>::encode::<4>+0xd0>
      a8:      	sub	x12, x12, #0x1
      ac:      	add	x11, x11, #0x10
      b0:      	add	x9, x9, #0x4
      b4:      	sub	x10, x10, #0x4
      b8:      	str	w13, [x19], #0x4
      bc:      	cbnz	x12, 0x58 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x58>
      c0:      	ldp	x20, x19, [sp, #0x20]
      c4:      	ldp	x29, x30, [sp, #0x10]
      c8:      	add	sp, sp, #0x30
      cc:      	ret
      d0:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<4>>
      d4:      	add	x0, x0, #0x0
      d8:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<4>>
      dc:      	add	x3, x3, #0x0
      e0:      	mov	w1, #0x237              // =567
      e4:      	mov	w2, wzr
      e8:      	bl	0xe8 <<toyos_crypto::mlkem::Poly>::encode::<4>+0xe8>
      ec:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<4>>
      f0:      	add	x0, x0, #0x0
      f4:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<4>>
      f8:      	add	x3, x3, #0x0
      fc:      	mov	w1, #0x193              // =403
     100:      	mov	w2, wzr
     104:      	bl	0x104 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x104>
     108:      	adrp	x2, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<4>>
     10c:      	add	x2, x2, #0x0
     110:      	adrp	x5, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<4>>
     114:      	add	x5, x5, #0x0
     118:      	mov	x1, sp
     11c:      	mov	w0, wzr
     120:      	mov	x3, xzr
     124:      	bl	0x124 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x124>
     128:      	bl	0x128 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x128>
     12c:      	bl	0x12c <<toyos_crypto::mlkem::Poly>::encode::<4>+0x12c>

0000000000000000 <<toyos_crypto::mlkem::Poly>::encode::<10>>:
       0:      	sub	sp, sp, #0x30
       4:      	stp	x29, x30, [sp, #0x10]
       8:      	stp	x20, x19, [sp, #0x20]
       c:      	add	x29, sp, #0x10
      10:      	cmp	x2, #0x140
      14:      	str	x2, [sp]
      18:      	b.ne	0x120 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x120>
      1c:      	mov	x20, x0
      20:      	mov	x19, x1
      24:      	add	x0, x0, #0x200
      28:      	mov	x1, x20
      2c:      	bl	0x2c <<toyos_crypto::mlkem::Poly>::encode::<10>+0x2c>
      30:      	tbz	w0, #0x0, 0x104 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x104>
      34:      	add	x0, x19, #0x140
      38:      	mov	x1, x19
      3c:      	bl	0x3c <<toyos_crypto::mlkem::Poly>::encode::<10>+0x3c>
      40:      	cbz	w0, 0x104 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x104>
      44:      	mov	x8, sp
      48:      	add	x11, x20, #0x8
      4c:      	mov	w12, #0x20              // =32
      50:      	sub	x9, x19, x8
      54:      	sub	x10, x8, x19
      58:      	ldurh	w13, [x11, #-0x8]
      5c:      	ldurh	w14, [x11, #-0x6]
      60:      	cmp	x8, x19
      64:      	ldrh	w15, [x11, #0x2]
      68:      	ldrh	w17, [x11, #0x4]
      6c:      	orr	x13, x13, x14, lsl #10
      70:      	ldurh	w14, [x11, #-0x4]
      74:      	lsr	x16, x15, #14
      78:      	orr	x13, x13, x14, lsl #20
      7c:      	ldurh	w14, [x11, #-0x2]
      80:      	orr	x13, x13, x14, lsl #30
      84:      	ldrh	w14, [x11]
      88:      	orr	x13, x13, x14, lsl #40
      8c:      	orr	x14, x16, x17, lsr #4
      90:      	ldrh	w16, [x11, #0x6]
      94:      	orr	x13, x13, x15, lsl #50
      98:      	orr	x14, x14, x16, lsl #6
      9c:      	csel	x15, x9, x10, lo
      a0:      	cmp	x15, #0x9
      a4:      	orr	x13, x13, x17, lsl #60
      a8:      	stp	x13, x14, [sp]
      ac:      	b.ls	0xe8 <<toyos_crypto::mlkem::Poly>::encode::<10>+0xe8>
      b0:      	ldr	x13, [sp]
      b4:      	ldrh	w14, [sp, #0x8]
      b8:      	add	x11, x11, #0x10
      bc:      	sub	x12, x12, #0x1
      c0:      	add	x9, x9, #0xa
      c4:      	sub	x10, x10, #0xa
      c8:      	str	x13, [x19]
      cc:      	strh	w14, [x19, #0x8]
      d0:      	add	x19, x19, #0xa
      d4:      	cbnz	x12, 0x58 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x58>
      d8:      	ldp	x20, x19, [sp, #0x20]
      dc:      	ldp	x29, x30, [sp, #0x10]
      e0:      	add	sp, sp, #0x30
      e4:      	ret
      e8:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<10>>
      ec:      	add	x0, x0, #0x0
      f0:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<10>>
      f4:      	add	x3, x3, #0x0
      f8:      	mov	w1, #0x237              // =567
      fc:      	mov	w2, wzr
     100:      	bl	0x100 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x100>
     104:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<10>>
     108:      	add	x0, x0, #0x0
     10c:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<10>>
     110:      	add	x3, x3, #0x0
     114:      	mov	w1, #0x193              // =403
     118:      	mov	w2, wzr
     11c:      	bl	0x11c <<toyos_crypto::mlkem::Poly>::encode::<10>+0x11c>
     120:      	adrp	x2, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<10>>
     124:      	add	x2, x2, #0x0
     128:      	adrp	x5, 0x0 <<toyos_crypto::mlkem::Poly>::encode::<10>>
     12c:      	add	x5, x5, #0x0
     130:      	mov	x1, sp
     134:      	mov	w0, wzr
     138:      	mov	x3, xzr
     13c:      	bl	0x13c <<toyos_crypto::mlkem::Poly>::encode::<10>+0x13c>
     140:      	bl	0x140 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x140>
     144:      	bl	0x144 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x144>

0000000000000000 <<&[toyos_crypto::mlkem::Poly; 3] as core::iter::traits::collect::IntoIterator>::into_iter>:
       0:      	stp	x29, x30, [sp, #-0x10]!
       4:      	mov	x29, sp
       8:      	add	x1, x0, #0x600
       c:      	ldp	x29, x30, [sp], #0x10
      10:      	ret

~/.claude/jobs/2280e09e/tmp/scratchpad/agents/mlkem/target-rlib/aarch64-unknown-toyos/toyos/libtoyos_crypto.rlib(toyos_crypto-4ee49e0b7450663d.2n6og7u0h10lomjwz9hpxjcha.1bg9n4i.rcgu.o):	file format elf64-littleaarch64

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
      24:      	sub	sp, sp, #0xe90
      28:      	str	xzr, [sp]
      2c:      	mov	w9, #0x3                // =3
      30:      	stp	x8, x1, [sp, #0x8]
      34:      	add	x8, sp, #0x1, lsl #12   // =0x1000
      38:      	add	x8, x8, #0x288
      3c:      	stp	x0, x2, [sp, #0x20]
      40:      	str	x8, [sp, #0x1888]
      44:      	str	x9, [sp, #0x1890]
      48:      	add	x8, sp, #0xa70
      4c:      	mov	x0, x2
      50:      	mov	w1, wzr
      54:      	mov	x20, xzr
      58:      	bl	0x58 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x58>
      5c:      	add	x8, sp, #0x630
      60:      	add	x0, sp, #0xa70
      64:      	mov	x20, xzr
      68:      	bl	0x68 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x68>
      6c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
      70:      	add	x1, sp, #0x630
      74:      	mov	w2, #0x200              // =512
      78:      	add	x0, x0, #0xc88
      7c:      	bl	0x7c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7c>
      80:      	add	x0, sp, #0x1, lsl #12   // =0x1000
      84:      	add	x1, sp, #0x1, lsl #12   // =0x1000
      88:      	mov	w2, #0x200              // =512
      8c:      	add	x0, x0, #0xa88
      90:      	add	x1, x1, #0xc88
      94:      	bl	0x94 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x94>
      98:      	add	x1, sp, #0x1, lsl #12   // =0x1000
      9c:      	add	x0, sp, #0x30
      a0:      	mov	w2, #0x200              // =512
      a4:      	add	x1, x1, #0xa88
      a8:      	bl	0xa8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa8>
      ac:      	add	x0, sp, #0x1, lsl #12   // =0x1000
      b0:      	add	x1, sp, #0x30
      b4:      	mov	w2, #0x200              // =512
      b8:      	add	x0, x0, #0x288
      bc:      	bl	0xbc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbc>
      c0:      	mov	w20, #0x1               // =1
      c4:      	ldr	x0, [sp, #0x28]
      c8:      	add	x8, sp, #0xa70
      cc:      	mov	w1, #0x1                // =1
      d0:      	bl	0xd0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd0>
      d4:      	mov	w20, #0x1               // =1
      d8:      	add	x8, sp, #0x630
      dc:      	add	x0, sp, #0xa70
      e0:      	bl	0xe0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xe0>
      e4:      	add	x0, sp, #0x1, lsl #12   // =0x1000
      e8:      	add	x1, sp, #0x630
      ec:      	mov	w2, #0x200              // =512
      f0:      	add	x0, x0, #0xc88
      f4:      	bl	0xf4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xf4>
      f8:      	add	x0, sp, #0x1, lsl #12   // =0x1000
      fc:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     100:      	mov	w2, #0x200              // =512
     104:      	add	x0, x0, #0xa88
     108:      	add	x1, x1, #0xc88
     10c:      	bl	0x10c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x10c>
     110:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     114:      	add	x0, sp, #0x30
     118:      	mov	w2, #0x200              // =512
     11c:      	add	x1, x1, #0xa88
     120:      	bl	0x120 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x120>
     124:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     128:      	add	x1, sp, #0x30
     12c:      	mov	w2, #0x200              // =512
     130:      	add	x8, x8, #0x288
     134:      	add	x0, x8, #0x200
     138:      	bl	0x138 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x138>
     13c:      	mov	w20, #0x2               // =2
     140:      	ldr	x0, [sp, #0x28]
     144:      	add	x8, sp, #0xa70
     148:      	mov	w1, #0x2                // =2
     14c:      	bl	0x14c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x14c>
     150:      	mov	w20, #0x2               // =2
     154:      	add	x8, sp, #0x630
     158:      	add	x0, sp, #0xa70
     15c:      	add	x21, sp, #0xa70
     160:      	bl	0x160 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x160>
     164:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     168:      	add	x1, sp, #0x630
     16c:      	mov	w2, #0x200              // =512
     170:      	add	x0, x0, #0xc88
     174:      	bl	0x174 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x174>
     178:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     17c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     180:      	mov	w2, #0x200              // =512
     184:      	add	x0, x0, #0xa88
     188:      	add	x1, x1, #0xc88
     18c:      	add	x28, sp, #0x1, lsl #12  // =0x1000
     190:      	add	x28, x28, #0xa88
     194:      	bl	0x194 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x194>
     198:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     19c:      	add	x0, sp, #0x30
     1a0:      	mov	w2, #0x200              // =512
     1a4:      	add	x1, x1, #0xa88
     1a8:      	bl	0x1a8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1a8>
     1ac:      	add	x19, sp, #0x1, lsl #12  // =0x1000
     1b0:      	add	x1, sp, #0x30
     1b4:      	mov	w2, #0x200              // =512
     1b8:      	add	x19, x19, #0x288
     1bc:      	add	x0, x19, #0x400
     1c0:      	bl	0x1c0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1c0>
     1c4:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     1c8:      	add	x0, sp, #0x30
     1cc:      	mov	w2, #0x600              // =1536
     1d0:      	add	x1, x1, #0x288
     1d4:      	bl	0x1d4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1d4>
     1d8:      	add	x0, sp, #0x630
     1dc:      	mov	w1, wzr
     1e0:      	mov	w2, #0x440              // =1088
     1e4:      	bl	0x1e4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1e4>
     1e8:      	mov	x20, xzr
     1ec:      	add	x10, x21, #0x200
     1f0:      	add	x25, x21, #0x400
     1f4:      	mov	w21, #0x4ebf            // =20159
     1f8:      	mov	w22, #0x2000000         // =33554432
     1fc:      	mov	w24, #-0xd01            // =-3329
     200:      	mov	w23, #0xd01             // =3329
     204:      	str	x10, [sp, #0x18]
     208:      	mov	w8, #0x3                // =3
     20c:      	str	x19, [sp, #0x1070]
     210:      	str	x8, [sp, #0x1078]
     214:      	ldr	x27, [sp, #0x20]
     218:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     21c:      	mov	x1, xzr
     220:      	add	x8, x8, #0xa88
     224:      	mov	x2, x20
     228:      	mov	x26, xzr
     22c:      	add	x0, x27, #0x480
     230:      	bl	0x230 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x230>
     234:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     238:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     23c:      	mov	w2, #0x200              // =512
     240:      	add	x0, x0, #0x888
     244:      	add	x1, x1, #0xa88
     248:      	bl	0x248 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x248>
     24c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     250:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     254:      	mov	w2, #0x200              // =512
     258:      	add	x0, x0, #0x88
     25c:      	add	x1, x1, #0x888
     260:      	bl	0x260 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x260>
     264:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     268:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     26c:      	mov	w2, #0x200              // =512
     270:      	add	x0, x0, #0xc88
     274:      	add	x1, x1, #0x88
     278:      	bl	0x278 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x278>
     27c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     280:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     284:      	mov	w2, #0x200              // =512
     288:      	add	x0, x0, #0x288
     28c:      	add	x1, x1, #0xc88
     290:      	bl	0x290 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x290>
     294:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     298:      	add	x0, x27, #0x480
     29c:      	mov	w1, #0x1                // =1
     2a0:      	add	x8, x8, #0xa88
     2a4:      	mov	x2, x20
     2a8:      	mov	w26, #0x1               // =1
     2ac:      	bl	0x2ac <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x2ac>
     2b0:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     2b4:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     2b8:      	mov	w2, #0x200              // =512
     2bc:      	add	x0, x0, #0x888
     2c0:      	add	x1, x1, #0xa88
     2c4:      	bl	0x2c4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x2c4>
     2c8:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     2cc:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     2d0:      	mov	w2, #0x200              // =512
     2d4:      	add	x0, x0, #0x88
     2d8:      	add	x1, x1, #0x888
     2dc:      	bl	0x2dc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x2dc>
     2e0:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     2e4:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     2e8:      	mov	w2, #0x200              // =512
     2ec:      	add	x0, x0, #0xc88
     2f0:      	add	x1, x1, #0x88
     2f4:      	bl	0x2f4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x2f4>
     2f8:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     2fc:      	add	x0, x19, #0x200
     300:      	mov	w2, #0x200              // =512
     304:      	add	x1, x1, #0xc88
     308:      	bl	0x308 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x308>
     30c:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     310:      	add	x0, x27, #0x480
     314:      	mov	w1, #0x2                // =2
     318:      	add	x8, x8, #0xa88
     31c:      	mov	x2, x20
     320:      	mov	w26, #0x2               // =2
     324:      	bl	0x324 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x324>
     328:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     32c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     330:      	mov	w2, #0x200              // =512
     334:      	add	x0, x0, #0x888
     338:      	add	x1, x1, #0xa88
     33c:      	mov	x26, x20
     340:      	bl	0x340 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x340>
     344:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     348:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     34c:      	mov	w2, #0x200              // =512
     350:      	add	x0, x0, #0x88
     354:      	add	x1, x1, #0x888
     358:      	bl	0x358 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x358>
     35c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     360:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     364:      	mov	w2, #0x200              // =512
     368:      	add	x0, x0, #0xc88
     36c:      	add	x1, x1, #0x88
     370:      	bl	0x370 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x370>
     374:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     378:      	add	x0, x19, #0x400
     37c:      	mov	w2, #0x200              // =512
     380:      	add	x1, x1, #0xc88
     384:      	bl	0x384 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x384>
     388:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     38c:      	add	x0, sp, #0xa70
     390:      	mov	w2, #0x600              // =1536
     394:      	add	x1, x1, #0x288
     398:      	bl	0x398 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x398>
     39c:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     3a0:      	add	x0, sp, #0xa70
     3a4:      	add	x1, sp, #0x30
     3a8:      	add	x8, x8, #0x288
     3ac:      	bl	0x3ac <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3ac>
     3b0:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     3b4:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     3b8:      	add	x8, x8, #0xc88
     3bc:      	add	x0, x0, #0x288
     3c0:      	bl	0x3c0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3c0>
     3c4:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     3c8:      	ldr	x0, [sp, #0x28]
     3cc:      	add	w1, w26, #0x3
     3d0:      	add	x8, x8, #0x288
     3d4:      	bl	0x3d4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3d4>
     3d8:      	mov	w20, #0x5f6f            // =24431
     3dc:      	add	x27, sp, #0xa70
     3e0:      	movk	w20, #0x27, lsl #16
     3e4:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     3e8:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     3ec:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     3f0:      	add	x8, x8, #0xa88
     3f4:      	add	x0, x0, #0xc88
     3f8:      	add	x1, x1, #0x288
     3fc:      	bl	0x3fc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3fc>
     400:      	mov	x8, xzr
     404:      	ldrsh	w9, [x28, x8]
     408:      	madd	w10, w9, w21, w22
     40c:      	asr	w10, w10, #26
     410:      	madd	w9, w10, w24, w9
     414:      	sxth	w9, w9
     418:      	and	w10, w23, w9, lsr #15
     41c:      	add	w9, w9, w10
     420:      	sxth	w10, w9
     424:      	cmp	w10, w9
     428:      	b.ne	0x970 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x970>
     42c:      	sbfiz	w9, w9, #10, #16
     430:      	cmn	w9, #0x681
     434:      	b.hi	0x980 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x980>
     438:      	add	w9, w9, #0x680
     43c:      	add	x10, x8, #0x2
     440:      	umull	x9, w20, w9
     444:      	cmp	x10, #0x200
     448:      	ubfx	x9, x9, #33, #10
     44c:      	strh	w9, [x28, x8]
     450:      	mov	x8, x10
     454:      	b.ne	0x404 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x404>
     458:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     45c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     460:      	mov	w2, #0x200              // =512
     464:      	add	x0, x0, #0xc88
     468:      	add	x1, x1, #0xa88
     46c:      	add	x20, x26, #0x1
     470:      	bl	0x470 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x470>
     474:      	mov	w9, #0x140              // =320
     478:      	add	x8, sp, #0x630
     47c:      	madd	x1, x26, x9, x8
     480:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     484:      	mov	w2, #0x140              // =320
     488:      	add	x0, x0, #0xc88
     48c:      	bl	0x48c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x48c>
     490:      	add	x10, sp, #0x1, lsl #12  // =0x1000
     494:      	mov	x8, xzr
     498:      	add	x10, x10, #0xc88
     49c:      	mov	x9, x8
     4a0:      	add	x8, x8, #0x2
     4a4:      	cmp	x8, #0x200
     4a8:      	strh	wzr, [x10, x9]
     4ac:      	b.ne	0x49c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x49c>
     4b0:      	mov	x8, xzr
     4b4:      	mov	x9, x8
     4b8:      	add	x8, x8, #0x2
     4bc:      	cmp	x8, #0x200
     4c0:      	strh	wzr, [x19, x9]
     4c4:      	b.ne	0x4b4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4b4>
     4c8:      	ldr	x10, [sp, #0x18]
     4cc:      	mov	x8, xzr
     4d0:      	mov	x9, x8
     4d4:      	add	x8, x8, #0x2
     4d8:      	cmp	x8, #0x200
     4dc:      	strh	wzr, [x27, x9]
     4e0:      	b.ne	0x4d0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4d0>
     4e4:      	mov	x8, xzr
     4e8:      	mov	x9, x8
     4ec:      	add	x8, x8, #0x2
     4f0:      	cmp	x8, #0x200
     4f4:      	strh	wzr, [x10, x9]
     4f8:      	b.ne	0x4e8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4e8>
     4fc:      	mov	x8, xzr
     500:      	mov	x9, x8
     504:      	add	x8, x8, #0x2
     508:      	cmp	x8, #0x200
     50c:      	strh	wzr, [x25, x9]
     510:      	b.ne	0x500 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x500>
     514:      	cmp	x20, #0x3
     518:      	b.ne	0x208 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x208>
     51c:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     520:      	mov	w9, #0x3                // =3
     524:      	add	x8, x8, #0x288
     528:      	str	x9, [sp, #0x1090]
     52c:      	str	x8, [sp, #0x1088]
     530:      	ldr	x21, [sp, #0x20]
     534:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     538:      	mov	w1, #0x180              // =384
     53c:      	add	x8, x8, #0xc88
     540:      	mov	x20, xzr
     544:      	mov	x0, x21
     548:      	bl	0x548 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x548>
     54c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     550:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     554:      	mov	w2, #0x200              // =512
     558:      	add	x0, x0, #0xa88
     55c:      	add	x1, x1, #0xc88
     560:      	bl	0x560 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x560>
     564:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     568:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     56c:      	mov	w2, #0x200              // =512
     570:      	add	x0, x0, #0x888
     574:      	add	x1, x1, #0xa88
     578:      	bl	0x578 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x578>
     57c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     580:      	add	x0, sp, #0xa70
     584:      	mov	w2, #0x200              // =512
     588:      	add	x1, x1, #0x888
     58c:      	bl	0x58c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x58c>
     590:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     594:      	add	x1, sp, #0xa70
     598:      	mov	w2, #0x200              // =512
     59c:      	add	x0, x0, #0x288
     5a0:      	add	x19, sp, #0x1, lsl #12  // =0x1000
     5a4:      	add	x19, x19, #0x288
     5a8:      	bl	0x5a8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5a8>
     5ac:      	mov	w20, #0x1               // =1
     5b0:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     5b4:      	add	x0, x21, #0x180
     5b8:      	mov	w1, #0x180              // =384
     5bc:      	add	x8, x8, #0xc88
     5c0:      	bl	0x5c0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5c0>
     5c4:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     5c8:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     5cc:      	mov	w2, #0x200              // =512
     5d0:      	add	x0, x0, #0xa88
     5d4:      	add	x1, x1, #0xc88
     5d8:      	bl	0x5d8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5d8>
     5dc:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     5e0:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     5e4:      	mov	w2, #0x200              // =512
     5e8:      	add	x0, x0, #0x888
     5ec:      	add	x1, x1, #0xa88
     5f0:      	bl	0x5f0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5f0>
     5f4:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     5f8:      	add	x0, sp, #0xa70
     5fc:      	mov	w2, #0x200              // =512
     600:      	add	x1, x1, #0x888
     604:      	bl	0x604 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x604>
     608:      	add	x0, x19, #0x200
     60c:      	add	x1, sp, #0xa70
     610:      	mov	w2, #0x200              // =512
     614:      	bl	0x614 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x614>
     618:      	mov	w20, #0x2               // =2
     61c:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     620:      	add	x0, x21, #0x300
     624:      	mov	w1, #0x180              // =384
     628:      	add	x8, x8, #0xc88
     62c:      	bl	0x62c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x62c>
     630:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     634:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     638:      	mov	w2, #0x200              // =512
     63c:      	add	x0, x0, #0xa88
     640:      	add	x1, x1, #0xc88
     644:      	bl	0x644 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x644>
     648:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     64c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     650:      	mov	w2, #0x200              // =512
     654:      	add	x0, x0, #0x888
     658:      	add	x1, x1, #0xa88
     65c:      	bl	0x65c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x65c>
     660:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     664:      	add	x0, sp, #0xa70
     668:      	mov	w2, #0x200              // =512
     66c:      	add	x1, x1, #0x888
     670:      	bl	0x670 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x670>
     674:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     678:      	add	x1, sp, #0xa70
     67c:      	mov	w2, #0x200              // =512
     680:      	add	x8, x8, #0x288
     684:      	add	x0, x8, #0x400
     688:      	bl	0x688 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x688>
     68c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     690:      	add	x0, sp, #0xa70
     694:      	mov	w2, #0x600              // =1536
     698:      	add	x1, x1, #0x288
     69c:      	bl	0x69c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x69c>
     6a0:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     6a4:      	add	x0, sp, #0xa70
     6a8:      	add	x1, sp, #0x30
     6ac:      	add	x8, x8, #0x288
     6b0:      	bl	0x6b0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x6b0>
     6b4:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     6b8:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     6bc:      	add	x8, x8, #0xc88
     6c0:      	add	x0, x0, #0x288
     6c4:      	bl	0x6c4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x6c4>
     6c8:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     6cc:      	ldr	x0, [sp, #0x28]
     6d0:      	mov	w1, #0x6                // =6
     6d4:      	add	x8, x8, #0xa88
     6d8:      	bl	0x6d8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x6d8>
     6dc:      	mov	w20, #0x5f6f            // =24431
     6e0:      	movk	w20, #0x27, lsl #16
     6e4:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     6e8:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     6ec:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     6f0:      	add	x8, x8, #0x888
     6f4:      	add	x0, x0, #0xc88
     6f8:      	add	x1, x1, #0xa88
     6fc:      	bl	0x6fc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x6fc>
     700:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     704:      	ldr	x0, [sp, #0x10]
     708:      	mov	w1, #0x20               // =32
     70c:      	add	x8, x8, #0x288
     710:      	add	x19, sp, #0x1, lsl #12  // =0x1000
     714:      	add	x19, x19, #0x288
     718:      	bl	0x718 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x718>
     71c:      	mov	x8, xzr
     720:      	mov	w9, #0xd01              // =3329
     724:      	ldrsh	w10, [x19, x8]
     728:      	umull	x10, w10, w9
     72c:      	tst	x10, #0xffffffff00000000
     730:      	b.ne	0x990 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x990>
     734:      	add	w10, w10, #0x1
     738:      	add	x11, x8, #0x2
     73c:      	lsr	w10, w10, #1
     740:      	cmp	x11, #0x200
     744:      	strh	w10, [x19, x8]
     748:      	mov	x8, x11
     74c:      	b.ne	0x724 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x724>
     750:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     754:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     758:      	mov	w2, #0x200              // =512
     75c:      	add	x0, x0, #0xc88
     760:      	add	x1, x1, #0x288
     764:      	bl	0x764 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x764>
     768:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     76c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     770:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     774:      	add	x8, x8, #0x288
     778:      	add	x0, x0, #0x888
     77c:      	add	x1, x1, #0xc88
     780:      	add	x19, sp, #0x1, lsl #12  // =0x1000
     784:      	add	x19, x19, #0x288
     788:      	bl	0x788 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x788>
     78c:      	mov	x8, xzr
     790:      	mov	w9, #0x4ebf             // =20159
     794:      	mov	w10, #0x2000000         // =33554432
     798:      	mov	w11, #-0xd01            // =-3329
     79c:      	mov	w12, #0xd01             // =3329
     7a0:      	ldrsh	w13, [x19, x8]
     7a4:      	madd	w14, w13, w9, w10
     7a8:      	asr	w14, w14, #26
     7ac:      	madd	w13, w14, w11, w13
     7b0:      	sxth	w13, w13
     7b4:      	and	w14, w12, w13, lsr #15
     7b8:      	add	w13, w13, w14
     7bc:      	sxth	w14, w13
     7c0:      	cmp	w14, w13
     7c4:      	b.ne	0x9a0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9a0>
     7c8:      	sbfiz	w13, w13, #4, #16
     7cc:      	cmn	w13, #0x681
     7d0:      	b.hi	0x9b0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9b0>
     7d4:      	add	w13, w13, #0x680
     7d8:      	add	x14, x8, #0x2
     7dc:      	umull	x13, w20, w13
     7e0:      	cmp	x14, #0x200
     7e4:      	ubfx	x13, x13, #33, #4
     7e8:      	strh	w13, [x19, x8]
     7ec:      	mov	x8, x14
     7f0:      	b.ne	0x7a0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7a0>
     7f4:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     7f8:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     7fc:      	mov	w2, #0x200              // =512
     800:      	add	x0, x0, #0x888
     804:      	add	x1, x1, #0x288
     808:      	add	x19, sp, #0x1, lsl #12  // =0x1000
     80c:      	add	x19, x19, #0x888
     810:      	bl	0x810 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x810>
     814:      	add	x8, sp, #0x630
     818:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     81c:      	add	x1, x8, #0x3c0
     820:      	mov	w2, #0x80               // =128
     824:      	add	x0, x0, #0x888
     828:      	bl	0x828 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x828>
     82c:      	mov	x8, xzr
     830:      	mov	x9, x8
     834:      	add	x8, x8, #0x2
     838:      	cmp	x8, #0x200
     83c:      	strh	wzr, [x19, x9]
     840:      	b.ne	0x830 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x830>
     844:      	add	x9, sp, #0x1, lsl #12   // =0x1000
     848:      	mov	x8, xzr
     84c:      	add	x9, x9, #0xc88
     850:      	mov	x10, x8
     854:      	add	x8, x8, #0x2
     858:      	cmp	x8, #0x200
     85c:      	strh	wzr, [x9, x10]
     860:      	b.ne	0x850 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x850>
     864:      	add	x9, sp, #0x1, lsl #12   // =0x1000
     868:      	mov	x8, xzr
     86c:      	add	x9, x9, #0xa88
     870:      	mov	x10, x8
     874:      	add	x8, x8, #0x2
     878:      	cmp	x8, #0x200
     87c:      	strh	wzr, [x9, x10]
     880:      	b.ne	0x870 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x870>
     884:      	ldr	x0, [sp, #0x8]
     888:      	add	x1, sp, #0x630
     88c:      	mov	w2, #0x440              // =1088
     890:      	bl	0x890 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x890>
     894:      	mov	x8, xzr
     898:      	add	x9, sp, #0xa70
     89c:      	mov	x10, x8
     8a0:      	add	x8, x8, #0x2
     8a4:      	cmp	x8, #0x200
     8a8:      	strh	wzr, [x9, x10]
     8ac:      	b.ne	0x89c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x89c>
     8b0:      	add	x9, sp, #0xa70
     8b4:      	mov	x8, xzr
     8b8:      	add	x9, x9, #0x200
     8bc:      	mov	x10, x8
     8c0:      	add	x8, x8, #0x2
     8c4:      	cmp	x8, #0x200
     8c8:      	strh	wzr, [x9, x10]
     8cc:      	b.ne	0x8bc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x8bc>
     8d0:      	add	x9, sp, #0xa70
     8d4:      	mov	x8, xzr
     8d8:      	add	x9, x9, #0x400
     8dc:      	mov	x10, x8
     8e0:      	add	x8, x8, #0x2
     8e4:      	cmp	x8, #0x200
     8e8:      	strh	wzr, [x9, x10]
     8ec:      	b.ne	0x8dc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x8dc>
     8f0:      	mov	x8, xzr
     8f4:      	add	x9, sp, #0x30
     8f8:      	mov	x10, x8
     8fc:      	add	x8, x8, #0x2
     900:      	cmp	x8, #0x200
     904:      	strh	wzr, [x9, x10]
     908:      	b.ne	0x8f8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x8f8>
     90c:      	add	x9, sp, #0x30
     910:      	mov	x8, xzr
     914:      	add	x9, x9, #0x200
     918:      	mov	x10, x8
     91c:      	add	x8, x8, #0x2
     920:      	cmp	x8, #0x200
     924:      	strh	wzr, [x9, x10]
     928:      	b.ne	0x918 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x918>
     92c:      	add	x9, sp, #0x30
     930:      	mov	x8, xzr
     934:      	add	x9, x9, #0x400
     938:      	mov	x10, x8
     93c:      	add	x8, x8, #0x2
     940:      	cmp	x8, #0x200
     944:      	strh	wzr, [x9, x10]
     948:      	b.ne	0x938 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x938>
     94c:      	add	sp, sp, #0x1, lsl #12   // =0x1000
     950:      	add	sp, sp, #0xe90
     954:      	ldp	x20, x19, [sp, #0x50]
     958:      	ldp	x22, x21, [sp, #0x40]
     95c:      	ldp	x24, x23, [sp, #0x30]
     960:      	ldp	x26, x25, [sp, #0x20]
     964:      	ldp	x28, x27, [sp, #0x10]
     968:      	ldp	x29, x30, [sp], #0x60
     96c:      	ret
     970:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>
     974:      	add	x0, x0, #0x0
     978:      	bl	0x978 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x978>
     97c:      	b	0x9bc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9bc>
     980:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>
     984:      	add	x0, x0, #0x0
     988:      	bl	0x988 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x988>
     98c:      	b	0x9bc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9bc>
     990:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>
     994:      	add	x0, x0, #0x0
     998:      	bl	0x998 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x998>
     99c:      	b	0x9bc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9bc>
     9a0:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>
     9a4:      	add	x0, x0, #0x0
     9a8:      	bl	0x9a8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9a8>
     9ac:      	b	0x9bc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9bc>
     9b0:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>
     9b4:      	add	x0, x0, #0x0
     9b8:      	bl	0x9b8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9b8>
     9bc:      	brk	#0x1
     9c0:      	mov	x8, xzr
     9c4:      	mov	x9, x8
     9c8:      	add	x8, x8, #0x2
     9cc:      	cmp	x8, #0x200
     9d0:      	strh	wzr, [x19, x9]
     9d4:      	b.ne	0x9c4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9c4>
     9d8:      	b	0xaf0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xaf0>
     9dc:      	b	0xaf0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xaf0>
     9e0:      	b	0xa60 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa60>
     9e4:      	b	0xb10 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb10>
     9e8:      	add	x9, sp, #0x1, lsl #12   // =0x1000
     9ec:      	mov	x8, xzr
     9f0:      	add	x9, x9, #0xc88
     9f4:      	mov	x10, x8
     9f8:      	add	x8, x8, #0x2
     9fc:      	cmp	x8, #0x200
     a00:      	strh	wzr, [x9, x10]
     a04:      	b.ne	0x9f4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9f4>
     a08:      	b	0xb30 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb30>
     a0c:      	b	0xb30 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb30>
     a10:      	mov	x19, x0
     a14:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     a18:      	str	x20, [sp, #0x1098]
     a1c:      	add	x0, x0, #0x88
     a20:      	b	0xba4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xba4>
     a24:      	mov	x19, x0
     a28:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     a2c:      	str	x20, [sp, #0x1898]
     a30:      	add	x0, x0, #0x888
     a34:      	bl	0xa34 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa34>
     a38:      	mov	x0, x19
     a3c:      	bl	0xa3c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa3c>
     a40:      	add	x9, sp, #0x1, lsl #12   // =0x1000
     a44:      	mov	x8, xzr
     a48:      	add	x9, x9, #0x288
     a4c:      	mov	x10, x8
     a50:      	add	x8, x8, #0x2
     a54:      	cmp	x8, #0x200
     a58:      	strh	wzr, [x9, x10]
     a5c:      	b.ne	0xa4c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa4c>
     a60:      	add	x9, sp, #0x1, lsl #12   // =0x1000
     a64:      	mov	x8, xzr
     a68:      	add	x9, x9, #0x888
     a6c:      	mov	x10, x8
     a70:      	add	x8, x8, #0x2
     a74:      	cmp	x8, #0x200
     a78:      	strh	wzr, [x9, x10]
     a7c:      	b.ne	0xa6c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa6c>
     a80:      	b	0xb10 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb10>
     a84:      	add	x9, sp, #0x1, lsl #12   // =0x1000
     a88:      	mov	x8, xzr
     a8c:      	add	x9, x9, #0xc88
     a90:      	mov	x10, x8
     a94:      	add	x8, x8, #0x2
     a98:      	cmp	x8, #0x200
     a9c:      	strh	wzr, [x9, x10]
     aa0:      	b.ne	0xa90 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa90>
     aa4:      	b	0xbd0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbd0>
     aa8:      	add	x9, sp, #0x1, lsl #12   // =0x1000
     aac:      	mov	x8, xzr
     ab0:      	add	x9, x9, #0xc88
     ab4:      	mov	x10, x8
     ab8:      	add	x8, x8, #0x2
     abc:      	cmp	x8, #0x200
     ac0:      	strh	wzr, [x9, x10]
     ac4:      	b.ne	0xab4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xab4>
     ac8:      	b	0xbf0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbf0>
     acc:      	b	0xbd0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbd0>
     ad0:      	add	x9, sp, #0x1, lsl #12   // =0x1000
     ad4:      	mov	x8, xzr
     ad8:      	add	x9, x9, #0x288
     adc:      	mov	x10, x8
     ae0:      	add	x8, x8, #0x2
     ae4:      	cmp	x8, #0x200
     ae8:      	strh	wzr, [x9, x10]
     aec:      	b.ne	0xadc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xadc>
     af0:      	add	x9, sp, #0x1, lsl #12   // =0x1000
     af4:      	mov	x8, xzr
     af8:      	add	x9, x9, #0xc88
     afc:      	mov	x10, x8
     b00:      	add	x8, x8, #0x2
     b04:      	cmp	x8, #0x200
     b08:      	strh	wzr, [x9, x10]
     b0c:      	b.ne	0xafc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xafc>
     b10:      	add	x9, sp, #0x1, lsl #12   // =0x1000
     b14:      	mov	x8, xzr
     b18:      	add	x9, x9, #0xa88
     b1c:      	mov	x10, x8
     b20:      	add	x8, x8, #0x2
     b24:      	cmp	x8, #0x200
     b28:      	strh	wzr, [x9, x10]
     b2c:      	b.ne	0xb1c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb1c>
     b30:      	mov	x8, xzr
     b34:      	add	x9, sp, #0xa70
     b38:      	mov	x10, x8
     b3c:      	add	x8, x8, #0x2
     b40:      	cmp	x8, #0x200
     b44:      	strh	wzr, [x9, x10]
     b48:      	b.ne	0xb38 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb38>
     b4c:      	add	x9, sp, #0xa70
     b50:      	mov	x8, xzr
     b54:      	add	x9, x9, #0x200
     b58:      	mov	x10, x8
     b5c:      	add	x8, x8, #0x2
     b60:      	cmp	x8, #0x200
     b64:      	strh	wzr, [x9, x10]
     b68:      	b.ne	0xb58 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb58>
     b6c:      	add	x9, sp, #0xa70
     b70:      	mov	x8, xzr
     b74:      	add	x9, x9, #0x400
     b78:      	mov	x10, x8
     b7c:      	add	x8, x8, #0x2
     b80:      	cmp	x8, #0x200
     b84:      	strh	wzr, [x9, x10]
     b88:      	b.ne	0xb78 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb78>
     b8c:      	b	0xc4c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc4c>
     b90:      	b	0xbf0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbf0>
     b94:      	mov	x19, x0
     b98:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     b9c:      	str	x26, [sp, #0x1080]
     ba0:      	add	x0, x0, #0x70
     ba4:      	bl	0xba4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xba4>
     ba8:      	mov	x0, x19
     bac:      	b	0xc4c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc4c>
     bb0:      	add	x9, sp, #0x1, lsl #12   // =0x1000
     bb4:      	mov	x8, xzr
     bb8:      	add	x9, x9, #0xa88
     bbc:      	mov	x10, x8
     bc0:      	add	x8, x8, #0x2
     bc4:      	cmp	x8, #0x200
     bc8:      	strh	wzr, [x9, x10]
     bcc:      	b.ne	0xbbc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbbc>
     bd0:      	add	x9, sp, #0x1, lsl #12   // =0x1000
     bd4:      	mov	x8, xzr
     bd8:      	add	x9, x9, #0x288
     bdc:      	mov	x10, x8
     be0:      	add	x8, x8, #0x2
     be4:      	cmp	x8, #0x200
     be8:      	strh	wzr, [x9, x10]
     bec:      	b.ne	0xbdc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbdc>
     bf0:      	mov	x8, xzr
     bf4:      	add	x9, sp, #0xa70
     bf8:      	mov	x10, x8
     bfc:      	add	x8, x8, #0x2
     c00:      	cmp	x8, #0x200
     c04:      	strh	wzr, [x9, x10]
     c08:      	b.ne	0xbf8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbf8>
     c0c:      	add	x9, sp, #0xa70
     c10:      	mov	x8, xzr
     c14:      	add	x9, x9, #0x200
     c18:      	mov	x10, x8
     c1c:      	add	x8, x8, #0x2
     c20:      	cmp	x8, #0x200
     c24:      	strh	wzr, [x9, x10]
     c28:      	b.ne	0xc18 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc18>
     c2c:      	add	x9, sp, #0xa70
     c30:      	mov	x8, xzr
     c34:      	add	x9, x9, #0x400
     c38:      	mov	x10, x8
     c3c:      	add	x8, x8, #0x2
     c40:      	cmp	x8, #0x200
     c44:      	strh	wzr, [x9, x10]
     c48:      	b.ne	0xc38 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc38>
     c4c:      	mov	x8, xzr
     c50:      	add	x9, sp, #0x30
     c54:      	mov	x10, x8
     c58:      	add	x8, x8, #0x2
     c5c:      	cmp	x8, #0x200
     c60:      	strh	wzr, [x9, x10]
     c64:      	b.ne	0xc54 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc54>
     c68:      	add	x9, sp, #0x30
     c6c:      	mov	x8, xzr
     c70:      	add	x9, x9, #0x200
     c74:      	mov	x10, x8
     c78:      	add	x8, x8, #0x2
     c7c:      	cmp	x8, #0x200
     c80:      	strh	wzr, [x9, x10]
     c84:      	b.ne	0xc74 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc74>
     c88:      	add	x9, sp, #0x30
     c8c:      	mov	x8, xzr
     c90:      	add	x9, x9, #0x400
     c94:      	mov	x10, x8
     c98:      	add	x8, x8, #0x2
     c9c:      	cmp	x8, #0x200
     ca0:      	strh	wzr, [x9, x10]
     ca4:      	b.ne	0xc94 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc94>
     ca8:      	bl	0xca8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xca8>

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
      3c:      	b.ne	0x7a0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x7a0>
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
      80:      	b.ne	0x85c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x85c>
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
     110:      	b.ne	0x860 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x860>
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
     1a4:      	b.ne	0x860 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x860>
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
     24c:      	b.ne	0x874 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x874>
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
     2b0:      	tbz	w0, #0x0, 0x840 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x840>
     2b4:      	add	x0, x23, #0x200
     2b8:      	add	x1, sp, #0xe40
     2bc:      	bl	0x2bc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x2bc>
     2c0:      	cbz	w0, 0x840 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x840>
     2c4:      	mov	x8, xzr
     2c8:      	add	x9, sp, #0xe40
     2cc:      	add	x10, sp, #0xc40
     2d0:      	ldrsh	w11, [x9, x8]
     2d4:      	ldrsh	w12, [x10, x8]
     2d8:      	sub	w11, w12, w11
     2dc:      	sxth	w12, w11
     2e0:      	cmp	w12, w11
     2e4:      	b.ne	0x884 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x884>
     2e8:      	strh	w11, [x10, x8]
     2ec:      	add	x8, x8, #0x2
     2f0:      	cmp	x8, #0x200
     2f4:      	b.ne	0x2d0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x2d0>
     2f8:      	add	x0, sp, #0x640
     2fc:      	add	x1, sp, #0xc40
     300:      	mov	w2, #0x200              // =512
     304:      	add	x22, sp, #0x640
     308:      	bl	0x308 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x308>
     30c:      	mov	w13, #0x5f6f            // =24431
     310:      	mov	x8, xzr
     314:      	mov	w9, #0x4ebf             // =20159
     318:      	mov	w10, #0x2000000         // =33554432
     31c:      	mov	w11, #-0xd01            // =-3329
     320:      	mov	w12, #0xd01             // =3329
     324:      	movk	w13, #0x27, lsl #16
     328:      	ldrsh	w14, [x22, x8]
     32c:      	madd	w15, w14, w9, w10
     330:      	asr	w15, w15, #26
     334:      	madd	w14, w15, w11, w14
     338:      	sxth	w14, w14
     33c:      	and	w15, w12, w14, lsr #15
     340:      	add	w14, w14, w15
     344:      	sxth	w15, w14
     348:      	cmp	w15, w14
     34c:      	b.ne	0x894 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x894>
     350:      	sbfiz	w14, w14, #1, #16
     354:      	cmn	w14, #0x681
     358:      	b.hi	0x8a4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x8a4>
     35c:      	add	w14, w14, #0x680
     360:      	add	x15, x8, #0x2
     364:      	umull	x14, w14, w13
     368:      	cmp	x15, #0x200
     36c:      	ubfx	x14, x14, #33, #1
     370:      	strh	w14, [x22, x8]
     374:      	mov	x8, x15
     378:      	b.ne	0x328 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x328>
     37c:      	add	x0, sp, #0xc40
     380:      	add	x1, sp, #0x640
     384:      	mov	w2, #0x200              // =512
     388:      	add	x22, sp, #0xc40
     38c:      	bl	0x38c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x38c>
     390:      	add	x0, sp, #0xc40
     394:      	add	x1, sp, #0x600
     398:      	mov	w2, #0x20               // =32
     39c:      	bl	0x39c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x39c>
     3a0:      	mov	x8, xzr
     3a4:      	mov	x9, x8
     3a8:      	add	x8, x8, #0x2
     3ac:      	cmp	x8, #0x200
     3b0:      	strh	wzr, [x22, x9]
     3b4:      	b.ne	0x3a4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x3a4>
     3b8:      	mov	x8, xzr
     3bc:      	add	x9, sp, #0xe40
     3c0:      	mov	x10, x8
     3c4:      	add	x8, x8, #0x2
     3c8:      	cmp	x8, #0x200
     3cc:      	strh	wzr, [x9, x10]
     3d0:      	b.ne	0x3c0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x3c0>
     3d4:      	add	x8, sp, #0x600
     3d8:      	mov	w9, #0x20               // =32
     3dc:      	str	x8, [sp, #0xc40]
     3e0:      	add	x8, x19, #0xaa0
     3e4:      	str	x9, [sp, #0xc48]
     3e8:      	str	x8, [sp, #0xc50]
     3ec:      	str	x9, [sp, #0xc58]
     3f0:      	add	x8, sp, #0x640
     3f4:      	add	x0, sp, #0xc40
     3f8:      	mov	w1, #0x2                // =2
     3fc:      	bl	0x3fc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x3fc>
     400:      	ldr	q0, [sp, #0x640]
     404:      	ldr	q1, [sp, #0x650]
     408:      	mov	w8, #0x20               // =32
     40c:      	ldr	q2, [sp, #0x670]
     410:      	add	x22, x19, #0xac0
     414:      	str	x8, [sp, #0x648]
     418:      	str	q0, [sp, #0xe40]
     41c:      	ldr	q0, [sp, #0x660]
     420:      	mov	w8, #0x440              // =1088
     424:      	str	q1, [sp, #0xe50]
     428:      	str	q0, [sp, #0xe60]
     42c:      	str	q2, [sp, #0xe70]
     430:      	str	x22, [sp, #0x640]
     434:      	str	x21, [sp, #0x650]
     438:      	str	x8, [sp, #0x658]
     43c:      	add	x8, sp, #0xc40
     440:      	add	x0, sp, #0x640
     444:      	mov	w1, #0x2                // =2
     448:      	bl	0x448 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x448>
     44c:      	ldr	q0, [sp, #0xc40]
     450:      	ldr	q1, [sp, #0xc50]
     454:      	add	x23, sp, #0xe40
     458:      	str	q0, [sp, #0x630]
     45c:      	str	q1, [sp, #0x620]
     460:      	add	x8, sp, #0x640
     464:      	add	x0, x19, #0x600
     468:      	add	x1, sp, #0x600
     46c:      	add	x2, x23, #0x20
     470:      	add	x24, sp, #0x640
     474:      	bl	0x474 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x474>
     478:      	add	x0, x21, #0x440
     47c:      	mov	x1, x21
     480:      	bl	0x480 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x480>
     484:      	tbz	w0, #0x0, 0x840 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x840>
     488:      	add	x0, x24, #0x440
     48c:      	add	x1, sp, #0x640
     490:      	bl	0x490 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x490>
     494:      	cbz	w0, 0x840 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x840>
     498:      	movi	v0.2d, #0000000000000000
     49c:      	movi	v2.2d, #0000000000000000
     4a0:      	add	x8, sp, #0x640
     4a4:      	movi	v6.2d, #0000000000000000
     4a8:      	movi	v1.2d, #0000000000000000
     4ac:      	add	x8, x8, #0x10
     4b0:      	movi	v17.2d, #0000000000000000
     4b4:      	movi	v4.2d, #0000000000000000
     4b8:      	add	x9, x21, #0x10
     4bc:      	movi	v5.2d, #0000000000000000
     4c0:      	movi	v3.2d, #0000000000000000
     4c4:      	mov	w10, #0x440             // =1088
     4c8:      	movi	v21.2d, #0000000000000000
     4cc:      	movi	v16.2d, #0000000000000000
     4d0:      	movi	v7.2d, #0000000000000000
     4d4:      	movi	v22.2d, #0000000000000000
     4d8:      	movi	v19.2d, #0000000000000000
     4dc:      	movi	v20.2d, #0000000000000000
     4e0:      	movi	v18.2d, #0000000000000000
     4e4:      	movi	v23.2d, #0000000000000000
     4e8:      	ldp	q24, q27, [x8, #-0x10]
     4ec:      	subs	x10, x10, #0x20
     4f0:      	ldp	q25, q26, [x9, #-0x10]
     4f4:      	add	x8, x8, #0x20
     4f8:      	add	x9, x9, #0x20
     4fc:      	eor	v24.16b, v24.16b, v25.16b
     500:      	eor	v25.16b, v27.16b, v26.16b
     504:      	ushll	v26.8h, v24.8b, #0x0
     508:      	ushll2	v24.8h, v24.16b, #0x0
     50c:      	ushll	v27.8h, v25.8b, #0x0
     510:      	ushll2	v25.8h, v25.16b, #0x0
     514:      	ushll	v28.4s, v26.4h, #0x0
     518:      	ushll2	v26.4s, v26.8h, #0x0
     51c:      	ushll	v29.4s, v24.4h, #0x0
     520:      	ushll2	v24.4s, v24.8h, #0x0
     524:      	ushll	v30.4s, v27.4h, #0x0
     528:      	ushll2	v27.4s, v27.8h, #0x0
     52c:      	ushll	v31.4s, v25.4h, #0x0
     530:      	ushll2	v25.4s, v25.8h, #0x0
     534:      	ushll	v8.2d, v28.2s, #0x0
     538:      	ushll2	v28.2d, v28.4s, #0x0
     53c:      	ushll	v9.2d, v26.2s, #0x0
     540:      	ushll	v10.2d, v29.2s, #0x0
     544:      	ushll2	v11.2d, v24.4s, #0x0
     548:      	ushll2	v26.2d, v26.4s, #0x0
     54c:      	ushll2	v29.2d, v29.4s, #0x0
     550:      	ushll	v24.2d, v24.2s, #0x0
     554:      	ushll	v12.2d, v30.2s, #0x0
     558:      	ushll2	v30.2d, v30.4s, #0x0
     55c:      	ushll	v13.2d, v27.2s, #0x0
     560:      	ushll	v14.2d, v31.2s, #0x0
     564:      	ushll2	v15.2d, v25.4s, #0x0
     568:      	ushll2	v27.2d, v27.4s, #0x0
     56c:      	ushll2	v31.2d, v31.4s, #0x0
     570:      	ushll	v25.2d, v25.2s, #0x0
     574:      	orr	v3.16b, v3.16b, v24.16b
     578:      	orr	v5.16b, v5.16b, v29.16b
     57c:      	orr	v17.16b, v17.16b, v26.16b
     580:      	orr	v21.16b, v21.16b, v11.16b
     584:      	orr	v4.16b, v4.16b, v10.16b
     588:      	orr	v1.16b, v1.16b, v9.16b
     58c:      	orr	v6.16b, v6.16b, v28.16b
     590:      	orr	v2.16b, v2.16b, v8.16b
     594:      	orr	v18.16b, v18.16b, v25.16b
     598:      	orr	v20.16b, v20.16b, v31.16b
     59c:      	orr	v22.16b, v22.16b, v27.16b
     5a0:      	orr	v23.16b, v23.16b, v15.16b
     5a4:      	orr	v19.16b, v19.16b, v14.16b
     5a8:      	orr	v7.16b, v7.16b, v13.16b
     5ac:      	orr	v0.16b, v0.16b, v30.16b
     5b0:      	orr	v16.16b, v16.16b, v12.16b
     5b4:      	b.ne	0x4e8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x4e8>
     5b8:      	orr	v17.16b, v22.16b, v17.16b
     5bc:      	orr	v21.16b, v23.16b, v21.16b
     5c0:      	mov	x8, xzr
     5c4:      	orr	v0.16b, v0.16b, v6.16b
     5c8:      	orr	v2.16b, v16.16b, v2.16b
     5cc:      	add	x10, sp, #0x640
     5d0:      	orr	v4.16b, v19.16b, v4.16b
     5d4:      	orr	v5.16b, v20.16b, v5.16b
     5d8:      	orr	v1.16b, v7.16b, v1.16b
     5dc:      	orr	v3.16b, v18.16b, v3.16b
     5e0:      	orr	v2.16b, v2.16b, v4.16b
     5e4:      	orr	v0.16b, v0.16b, v5.16b
     5e8:      	orr	v1.16b, v1.16b, v3.16b
     5ec:      	orr	v3.16b, v17.16b, v21.16b
     5f0:      	orr	v1.16b, v2.16b, v1.16b
     5f4:      	orr	v0.16b, v0.16b, v3.16b
     5f8:      	orr	v0.16b, v1.16b, v0.16b
     5fc:      	ext	v1.16b, v0.16b, v0.16b, #0x8
     600:      	orr	v0.8b, v0.8b, v1.8b
     604:      	fmov	x9, d0
     608:      	mov	x11, x8
     60c:      	add	x8, x8, #0x1
     610:      	cmp	x8, #0x440
     614:      	strb	wzr, [x10, x11]
     618:      	b.ne	0x608 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x608>
     61c:      	cmp	x9, #0x0
     620:      	ldr	q2, [sp, #0x630]
     624:      	ldr	q3, [sp, #0xe40]
     628:      	cset	w9, gt
     62c:      	ldr	q4, [sp, #0xe50]
     630:      	ldr	q5, [sp, #0x620]
     634:      	neg	w10, w9
     638:      	strb	wzr, [x20]
     63c:      	sub	w9, w9, #0x1
     640:      	dup	v0.16b, w10
     644:      	str	xzr, [sp, #0x648]
     648:      	dup	v1.16b, w9
     64c:      	str	xzr, [sp, #0x640]
     650:      	mov	x8, xzr
     654:      	mov	x9, sp
     658:      	and	v2.16b, v2.16b, v0.16b
     65c:      	and	v0.16b, v5.16b, v0.16b
     660:      	and	v3.16b, v1.16b, v3.16b
     664:      	and	v1.16b, v1.16b, v4.16b
     668:      	orr	v2.16b, v2.16b, v3.16b
     66c:      	orr	v0.16b, v0.16b, v1.16b
     670:      	stur	q2, [x20, #0x1]
     674:      	stur	q0, [x20, #0x11]
     678:      	ldr	q0, [sp, #0x640]
     67c:      	str	q0, [sp, #0x630]
     680:      	str	xzr, [sp, #0x648]
     684:      	str	xzr, [sp, #0x640]
     688:      	ldr	q0, [sp, #0x640]
     68c:      	str	q0, [sp, #0x620]
     690:      	str	xzr, [sp, #0x648]
     694:      	str	xzr, [sp, #0x640]
     698:      	ldr	q0, [sp, #0x640]
     69c:      	str	q0, [sp, #0xe40]
     6a0:      	str	xzr, [sp, #0x648]
     6a4:      	str	xzr, [sp, #0x640]
     6a8:      	ldr	q0, [sp, #0x640]
     6ac:      	str	q0, [sp, #0xe50]
     6b0:      	str	xzr, [sp, #0x648]
     6b4:      	str	xzr, [sp, #0x640]
     6b8:      	ldr	q0, [sp, #0x640]
     6bc:      	stur	q0, [x23, #0x20]
     6c0:      	str	xzr, [sp, #0x648]
     6c4:      	str	xzr, [sp, #0x640]
     6c8:      	ldr	q0, [sp, #0x640]
     6cc:      	str	q0, [sp, #0xe70]
     6d0:      	str	xzr, [sp, #0x648]
     6d4:      	str	xzr, [sp, #0x640]
     6d8:      	ldr	q0, [sp, #0x640]
     6dc:      	str	q0, [sp, #0x600]
     6e0:      	str	xzr, [sp, #0x648]
     6e4:      	str	xzr, [sp, #0x640]
     6e8:      	ldr	q0, [sp, #0x640]
     6ec:      	str	q0, [sp, #0x610]
     6f0:      	mov	x10, x8
     6f4:      	add	x8, x8, #0x2
     6f8:      	cmp	x8, #0x200
     6fc:      	strh	wzr, [x9, x10]
     700:      	b.ne	0x6f0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x6f0>
     704:      	mov	x9, sp
     708:      	mov	x8, xzr
     70c:      	add	x9, x9, #0x200
     710:      	mov	x10, x8
     714:      	add	x8, x8, #0x2
     718:      	cmp	x8, #0x200
     71c:      	strh	wzr, [x9, x10]
     720:      	b.ne	0x710 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x710>
     724:      	mov	x9, sp
     728:      	mov	x8, xzr
     72c:      	add	x9, x9, #0x400
     730:      	mov	x10, x8
     734:      	add	x8, x8, #0x2
     738:      	cmp	x8, #0x200
     73c:      	strh	wzr, [x9, x10]
     740:      	b.ne	0x730 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x730>
     744:      	mov	x8, xzr
     748:      	mov	x9, x8
     74c:      	add	x8, x8, #0x2
     750:      	cmp	x8, #0x200
     754:      	strh	wzr, [x19, x9]
     758:      	b.ne	0x748 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x748>
     75c:      	mov	x8, xzr
     760:      	add	x9, x19, #0x200
     764:      	strh	wzr, [x9, x8]
     768:      	add	x8, x8, #0x2
     76c:      	cmp	x8, #0x200
     770:      	b.ne	0x764 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x764>
     774:      	mov	x8, xzr
     778:      	add	x9, x19, #0x400
     77c:      	strh	wzr, [x9, x8]
     780:      	add	x8, x8, #0x2
     784:      	cmp	x8, #0x200
     788:      	b.ne	0x77c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x77c>
     78c:      	str	xzr, [sp, #0x648]
     790:      	str	xzr, [sp, #0x640]
     794:      	ldr	q0, [sp, #0x640]
     798:      	str	q0, [x22]
     79c:      	b	0x800 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x800>
     7a0:      	mov	x8, xzr
     7a4:      	mov	w9, #0x1                // =1
     7a8:      	strh	w9, [x20]
     7ac:      	mov	x9, x8
     7b0:      	add	x8, x8, #0x2
     7b4:      	cmp	x8, #0x200
     7b8:      	strh	wzr, [x19, x9]
     7bc:      	b.ne	0x7ac <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x7ac>
     7c0:      	mov	x8, xzr
     7c4:      	add	x9, x19, #0x200
     7c8:      	strh	wzr, [x9, x8]
     7cc:      	add	x8, x8, #0x2
     7d0:      	cmp	x8, #0x200
     7d4:      	b.ne	0x7c8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x7c8>
     7d8:      	mov	x8, xzr
     7dc:      	add	x9, x19, #0x400
     7e0:      	strh	wzr, [x9, x8]
     7e4:      	add	x8, x8, #0x2
     7e8:      	cmp	x8, #0x200
     7ec:      	b.ne	0x7e0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x7e0>
     7f0:      	str	xzr, [sp, #0x648]
     7f4:      	str	xzr, [sp, #0x640]
     7f8:      	ldr	q0, [sp, #0x640]
     7fc:      	str	q0, [x19, #0xac0]
     800:      	str	xzr, [sp, #0x648]
     804:      	str	xzr, [sp, #0x640]
     808:      	ldr	q0, [sp, #0x640]
     80c:      	str	q0, [x19, #0xad0]
     810:      	add	sp, sp, #0x1, lsl #12   // =0x1000
     814:      	add	sp, sp, #0x50
     818:      	ldp	x20, x19, [sp, #0x80]
     81c:      	ldr	x28, [sp, #0x50]
     820:      	ldp	x22, x21, [sp, #0x70]
     824:      	ldp	x24, x23, [sp, #0x60]
     828:      	ldp	x29, x30, [sp, #0x40]
     82c:      	ldp	d9, d8, [sp, #0x30]
     830:      	ldp	d11, d10, [sp, #0x20]
     834:      	ldp	d13, d12, [sp, #0x10]
     838:      	ldp	d15, d14, [sp], #0x90
     83c:      	ret
     840:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>
     844:      	add	x0, x0, #0x0
     848:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>
     84c:      	add	x3, x3, #0x0
     850:      	mov	w1, #0x193              // =403
     854:      	mov	w2, wzr
     858:      	bl	0x858 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x858>
     85c:      	mov	x8, xzr
     860:      	str	x8, [sp, #0x610]
     864:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>
     868:      	add	x0, x0, #0x0
     86c:      	bl	0x86c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x86c>
     870:      	b	0x8b0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x8b0>
     874:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>
     878:      	add	x0, x0, #0x0
     87c:      	bl	0x87c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x87c>
     880:      	b	0x8b0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x8b0>
     884:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>
     888:      	add	x0, x0, #0x0
     88c:      	bl	0x88c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x88c>
     890:      	b	0x8b0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x8b0>
     894:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>
     898:      	add	x0, x0, #0x0
     89c:      	bl	0x89c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x89c>
     8a0:      	b	0x8b0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x8b0>
     8a4:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>
     8a8:      	add	x0, x0, #0x0
     8ac:      	bl	0x8ac <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x8ac>
     8b0:      	brk	#0x1
     8b4:      	bl	0x8b4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x8b4>
     8b8:      	bl	0x8b8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x8b8>
     8bc:      	str	xzr, [sp, #0xc48]
     8c0:      	mov	x20, x0
     8c4:      	str	xzr, [sp, #0xc40]
     8c8:      	ldr	q0, [sp, #0xc40]
     8cc:      	str	q0, [sp, #0x630]
     8d0:      	str	xzr, [sp, #0xc48]
     8d4:      	str	xzr, [sp, #0xc40]
     8d8:      	ldr	q0, [sp, #0xc40]
     8dc:      	str	q0, [sp, #0x620]
     8e0:      	b	0x8e8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x8e8>
     8e4:      	mov	x20, x0
     8e8:      	stp	xzr, xzr, [x29, #-0x50]
     8ec:      	ldur	q0, [x29, #-0x50]
     8f0:      	str	q0, [sp, #0xe40]
     8f4:      	stp	xzr, xzr, [x29, #-0x50]
     8f8:      	ldur	q0, [x29, #-0x50]
     8fc:      	str	q0, [sp, #0xe50]
     900:      	stp	xzr, xzr, [x29, #-0x50]
     904:      	ldur	q0, [x29, #-0x50]
     908:      	str	q0, [sp, #0xe60]
     90c:      	stp	xzr, xzr, [x29, #-0x50]
     910:      	ldur	q0, [x29, #-0x50]
     914:      	str	q0, [sp, #0xe70]
     918:      	b	0x9fc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x9fc>
     91c:      	mov	x20, x0
     920:      	mov	x8, xzr
     924:      	mov	x9, x8
     928:      	add	x8, x8, #0x2
     92c:      	cmp	x8, #0x200
     930:      	strh	wzr, [x22, x9]
     934:      	b.ne	0x924 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x924>
     938:      	b	0x9e0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x9e0>
     93c:      	bl	0x93c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x93c>
     940:      	bl	0x940 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x940>
     944:      	mov	x20, x0
     948:      	b	0x9fc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x9fc>
     94c:      	mov	x20, x0
     950:      	mov	x8, xzr
     954:      	mov	x9, x8
     958:      	add	x8, x8, #0x2
     95c:      	cmp	x8, #0x200
     960:      	strh	wzr, [x22, x9]
     964:      	b.ne	0x954 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x954>
     968:      	b	0x9fc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x9fc>
     96c:      	mov	x20, x0
     970:      	str	x22, [sp, #0x610]
     974:      	b	0xa94 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xa94>
     978:      	mov	x20, x0
     97c:      	mov	x8, xzr
     980:      	add	x9, sp, #0xc40
     984:      	mov	x10, x8
     988:      	add	x8, x8, #0x2
     98c:      	cmp	x8, #0x200
     990:      	strh	wzr, [x9, x10]
     994:      	b.ne	0x984 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x984>
     998:      	b	0x9e0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x9e0>
     99c:      	mov	x20, x0
     9a0:      	mov	x8, xzr
     9a4:      	add	x9, sp, #0x640
     9a8:      	mov	x10, x8
     9ac:      	add	x8, x8, #0x2
     9b0:      	cmp	x8, #0x200
     9b4:      	strh	wzr, [x9, x10]
     9b8:      	b.ne	0x9a8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x9a8>
     9bc:      	b	0x9fc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x9fc>
     9c0:      	mov	x20, x0
     9c4:      	mov	x8, xzr
     9c8:      	add	x9, sp, #0x640
     9cc:      	mov	x10, x8
     9d0:      	add	x8, x8, #0x2
     9d4:      	cmp	x8, #0x200
     9d8:      	strh	wzr, [x9, x10]
     9dc:      	b.ne	0x9cc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x9cc>
     9e0:      	mov	x8, xzr
     9e4:      	add	x9, sp, #0xe40
     9e8:      	mov	x10, x8
     9ec:      	add	x8, x8, #0x2
     9f0:      	cmp	x8, #0x200
     9f4:      	strh	wzr, [x9, x10]
     9f8:      	b.ne	0x9e8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x9e8>
     9fc:      	stp	xzr, xzr, [x29, #-0x50]
     a00:      	mov	x8, xzr
     a04:      	mov	x9, sp
     a08:      	ldur	q0, [x29, #-0x50]
     a0c:      	str	q0, [sp, #0x600]
     a10:      	stp	xzr, xzr, [x29, #-0x50]
     a14:      	ldur	q0, [x29, #-0x50]
     a18:      	str	q0, [sp, #0x610]
     a1c:      	mov	x10, x8
     a20:      	add	x8, x8, #0x2
     a24:      	cmp	x8, #0x200
     a28:      	strh	wzr, [x9, x10]
     a2c:      	b.ne	0xa1c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xa1c>
     a30:      	mov	x9, sp
     a34:      	mov	x8, xzr
     a38:      	add	x9, x9, #0x200
     a3c:      	mov	x10, x8
     a40:      	add	x8, x8, #0x2
     a44:      	cmp	x8, #0x200
     a48:      	strh	wzr, [x9, x10]
     a4c:      	b.ne	0xa3c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xa3c>
     a50:      	mov	x9, sp
     a54:      	mov	x8, xzr
     a58:      	add	x9, x9, #0x400
     a5c:      	mov	x10, x8
     a60:      	add	x8, x8, #0x2
     a64:      	cmp	x8, #0x200
     a68:      	strh	wzr, [x9, x10]
     a6c:      	b.ne	0xa5c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xa5c>
     a70:      	b	0xa9c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xa9c>
     a74:      	mov	x20, x0
     a78:      	mov	x8, xzr
     a7c:      	mov	x9, sp
     a80:      	mov	x10, x8
     a84:      	add	x8, x8, #0x2
     a88:      	cmp	x8, #0x200
     a8c:      	strh	wzr, [x9, x10]
     a90:      	b.ne	0xa80 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xa80>
     a94:      	add	x0, sp, #0x600
     a98:      	bl	0xa98 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xa98>
     a9c:      	mov	x0, x19
     aa0:      	bl	0xaa0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xaa0>
     aa4:      	mov	x0, x20
     aa8:      	bl	0xaa8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xaa8>
     aac:      	bl	0xaac <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xaac>

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

~/.claude/jobs/2280e09e/tmp/scratchpad/agents/mlkem/target-rlib/aarch64-unknown-toyos/toyos/libtoyos_crypto.rlib(toyos_crypto-4ee49e0b7450663d.9f6k7mhywuwm5c8obfrgk4gd2.1bg9n4i.rcgu.o):	file format elf64-littleaarch64

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

0000000000000000 <toyos_crypto::keccak::permute (.llvm.12599588404557843440)>:
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
     27c:      	adrp	x11, 0x0 <toyos_crypto::keccak::permute (.llvm.12599588404557843440)>
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
     2dc:      	b.ne	0x64 <toyos_crypto::keccak::permute (.llvm.12599588404557843440)+0x64>
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

~/.claude/jobs/2280e09e/tmp/scratchpad/agents/mlkem/target-rlib/aarch64-unknown-toyos/toyos/libtoyos_crypto.rlib(toyos_crypto-4ee49e0b7450663d.bch0gigm1s8zea5225mv2fk7t.1bg9n4i.rcgu.o):	file format elf64-littleaarch64

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

