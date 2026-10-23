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
       0:      	stp	x29, x30, [sp, #-0x40]!
       4:      	stp	x28, x23, [sp, #0x10]
       8:      	stp	x22, x21, [sp, #0x20]
       c:      	stp	x20, x19, [sp, #0x30]
      10:      	mov	x29, sp
      14:      	sub	sp, sp, #0x400
      18:      	cmp	x1, #0x4a0
      1c:      	mov	x19, x8
      20:      	b.ne	0x230 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x230>
      24:      	movi	v0.2d, #0000000000000000
      28:      	mov	x20, x0
      2c:      	mov	x21, xzr
      30:      	mov	w22, #0x5               // =5
      34:      	mov	x23, sp
      38:      	mov	x8, xzr
      3c:      	add	x9, x20, x21
      40:      	add	x10, sp, #0x200
      44:      	stp	q0, q0, [sp, #0x200]
      48:      	stp	q0, q0, [sp, #0x220]
      4c:      	stp	q0, q0, [sp, #0x240]
      50:      	stp	q0, q0, [sp, #0x260]
      54:      	stp	q0, q0, [sp, #0x280]
      58:      	stp	q0, q0, [sp, #0x2a0]
      5c:      	stp	q0, q0, [sp, #0x2c0]
      60:      	stp	q0, q0, [sp, #0x2e0]
      64:      	stp	q0, q0, [sp, #0x300]
      68:      	stp	q0, q0, [sp, #0x320]
      6c:      	stp	q0, q0, [sp, #0x340]
      70:      	stp	q0, q0, [sp, #0x360]
      74:      	stp	q0, q0, [sp, #0x380]
      78:      	stp	q0, q0, [sp, #0x3a0]
      7c:      	stp	q0, q0, [sp, #0x3c0]
      80:      	stp	q0, q0, [sp, #0x3e0]
      84:      	lsr	x12, x8, #3
      88:      	and	w14, w8, #0x4
      8c:      	and	x11, x8, #0x4
      90:      	orr	w18, w14, #0x1
      94:      	orr	w0, w14, #0x2
      98:      	orr	w14, w14, #0x3
      9c:      	ldrb	w12, [x9, x12]
      a0:      	ldrh	w13, [x10]
      a4:      	add	x15, x8, #0x4
      a8:      	add	x16, x8, #0x5
      ac:      	add	x17, x8, #0x6
      b0:      	add	x3, x8, #0xb
      b4:      	lsr	w1, w12, w11
      b8:      	lsr	w18, w12, w18
      bc:      	lsr	w0, w12, w0
      c0:      	lsr	w12, w12, w14
      c4:      	lsr	x14, x15, #3
      c8:      	lsr	x2, x16, #3
      cc:      	and	w1, w1, #0x1
      d0:      	ubfiz	w18, w18, #1, #1
      d4:      	ubfiz	w0, w0, #2, #1
      d8:      	ubfiz	w12, w12, #3, #1
      dc:      	orr	w13, w13, w1
      e0:      	lsr	x1, x17, #3
      e4:      	orr	w13, w13, w18
      e8:      	ldrb	w14, [x9, x14]
      ec:      	ldrb	w18, [x9, x2]
      f0:      	orr	w12, w0, w12
      f4:      	add	x0, x8, #0x7
      f8:      	and	x15, x15, #0x4
      fc:      	orr	w12, w13, w12
     100:      	ldrb	w13, [x9, x1]
     104:      	add	x1, x8, #0x8
     108:      	and	x16, x16, x22
     10c:      	lsr	x2, x0, #3
     110:      	lsr	x1, x1, #3
     114:      	and	x17, x17, #0x6
     118:      	lsr	w14, w14, w15
     11c:      	lsr	w15, w18, w16
     120:      	add	x18, x8, #0x9
     124:      	lsr	w13, w13, w17
     128:      	ldrb	w16, [x9, x2]
     12c:      	ldrb	w17, [x9, x1]
     130:      	lsr	x1, x18, #3
     134:      	add	x2, x8, #0xa
     138:      	lsr	x4, x2, #3
     13c:      	and	x0, x0, #0x7
     140:      	lsr	x5, x3, #3
     144:      	lsr	w11, w17, w11
     148:      	ldrb	w17, [x9, x1]
     14c:      	lsr	w16, w16, w0
     150:      	and	x18, x18, x22
     154:      	ldrb	w0, [x9, x4]
     158:      	ldrb	w1, [x9, x5]
     15c:      	lsr	w17, w17, w18
     160:      	and	x18, x2, #0x6
     164:      	and	x2, x3, #0x7
     168:      	lsr	w18, w0, w18
     16c:      	lsr	w0, w1, w2
     170:      	ubfiz	w14, w14, #4, #1
     174:      	ubfiz	w15, w15, #5, #1
     178:      	ubfiz	w13, w13, #6, #1
     17c:      	ubfiz	w16, w16, #7, #1
     180:      	ubfiz	w11, w11, #8, #1
     184:      	ubfiz	w17, w17, #9, #1
     188:      	ubfiz	w18, w18, #10, #1
     18c:      	orr	w14, w14, w15
     190:      	orr	w13, w13, w16
     194:      	ubfiz	w15, w0, #11, #1
     198:      	orr	w12, w12, w14
     19c:      	orr	w11, w11, w13
     1a0:      	orr	w13, w18, w17
     1a4:      	orr	w11, w11, w12
     1a8:      	orr	w12, w15, w13
     1ac:      	add	x8, x8, #0xc
     1b0:      	orr	w11, w12, w11
     1b4:      	cmp	x8, #0xc00
     1b8:      	strh	w11, [x10], #0x2
     1bc:      	b.ne	0x84 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x84>
     1c0:      	mov	x0, sp
     1c4:      	add	x1, sp, #0x200
     1c8:      	mov	w2, #0x200              // =512
     1cc:      	add	x21, x21, #0x180
     1d0:      	bl	0x1d0 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x1d0>
     1d4:      	mov	x8, xzr
     1d8:      	cmp	x8, #0x200
     1dc:      	b.eq	0x1f4 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x1f4>
     1e0:      	ldrh	w9, [x23, x8]
     1e4:      	add	x8, x8, #0x2
     1e8:      	cmp	w9, #0xd00
     1ec:      	b.ls	0x1d8 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x1d8>
     1f0:      	b	0x23c <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x23c>
     1f4:      	mov	x8, xzr
     1f8:      	mov	x9, x8
     1fc:      	add	x8, x8, #0x2
     200:      	cmp	x8, #0x200
     204:      	strh	wzr, [x23, x9]
     208:      	b.ne	0x1f8 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x1f8>
     20c:      	movi	v0.2d, #0000000000000000
     210:      	cmp	x21, #0x480
     214:      	b.ne	0x38 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x38>
     218:      	add	x0, x19, #0x1
     21c:      	mov	x1, x20
     220:      	mov	w2, #0x4a0              // =1184
     224:      	bl	0x224 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x224>
     228:      	strb	wzr, [x19]
     22c:      	b	0x260 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x260>
     230:      	mov	w8, #0x1                // =1
     234:      	strh	w8, [x19]
     238:      	b	0x260 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x260>
     23c:      	mov	w9, #0x201              // =513
     240:      	mov	x8, xzr
     244:      	strh	w9, [x19]
     248:      	mov	x9, sp
     24c:      	mov	x10, x8
     250:      	add	x8, x8, #0x2
     254:      	cmp	x8, #0x200
     258:      	strh	wzr, [x9, x10]
     25c:      	b.ne	0x24c <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x24c>
     260:      	add	sp, sp, #0x400
     264:      	ldp	x20, x19, [sp, #0x30]
     268:      	ldp	x22, x21, [sp, #0x20]
     26c:      	ldp	x28, x23, [sp, #0x10]
     270:      	ldp	x29, x30, [sp], #0x40
     274:      	ret

0000000000000000 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>:
       0:      	str	d12, [sp, #-0x90]!
       4:      	stp	d11, d10, [sp, #0x10]
       8:      	stp	d9, d8, [sp, #0x20]
       c:      	stp	x29, x30, [sp, #0x30]
      10:      	stp	x28, x27, [sp, #0x40]
      14:      	stp	x26, x25, [sp, #0x50]
      18:      	stp	x24, x23, [sp, #0x60]
      1c:      	stp	x22, x21, [sp, #0x70]
      20:      	stp	x20, x19, [sp, #0x80]
      24:      	add	x29, sp, #0x30
      28:      	sub	sp, sp, #0x1, lsl #12   // =0x1000
      2c:      	str	xzr, [sp]
      30:      	sub	sp, sp, #0xa70
      34:      	mov	x21, x1
      38:      	mov	x19, x8
      3c:      	add	x8, sp, #0xc60
      40:      	mov	w9, #0x3                // =3
      44:      	str	xzr, [sp]
      48:      	str	x0, [sp, #0x58]
      4c:      	str	x8, [sp, #0xa60]
      50:      	str	x9, [sp, #0xa68]
      54:      	add	x8, sp, #0x60
      58:      	mov	x0, x2
      5c:      	mov	w1, wzr
      60:      	str	x2, [sp, #0x30]
      64:      	mov	x20, xzr
      68:      	bl	0x68 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x68>
      6c:      	add	x8, sp, #0x1, lsl #12   // =0x1000
      70:      	add	x0, sp, #0x60
      74:      	mov	x20, xzr
      78:      	add	x8, x8, #0x660
      7c:      	bl	0x7c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7c>
      80:      	add	x0, sp, #0x1, lsl #12   // =0x1000
      84:      	add	x1, sp, #0x1, lsl #12   // =0x1000
      88:      	mov	w2, #0x200              // =512
      8c:      	add	x0, x0, #0x460
      90:      	add	x1, x1, #0x660
      94:      	bl	0x94 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x94>
      98:      	add	x0, sp, #0x1, lsl #12   // =0x1000
      9c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
      a0:      	mov	w2, #0x200              // =512
      a4:      	add	x0, x0, #0x260
      a8:      	add	x1, x1, #0x460
      ac:      	bl	0xac <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xac>
      b0:      	add	x0, sp, #0x1, lsl #12   // =0x1000
      b4:      	add	x1, sp, #0x1, lsl #12   // =0x1000
      b8:      	mov	w2, #0x200              // =512
      bc:      	add	x0, x0, #0x860
      c0:      	add	x1, x1, #0x260
      c4:      	bl	0xc4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc4>
      c8:      	add	x1, sp, #0x1, lsl #12   // =0x1000
      cc:      	add	x0, sp, #0xc60
      d0:      	mov	w2, #0x200              // =512
      d4:      	add	x1, x1, #0x860
      d8:      	bl	0xd8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd8>
      dc:      	mov	w20, #0x1               // =1
      e0:      	ldr	x0, [sp, #0x30]
      e4:      	add	x8, sp, #0x60
      e8:      	mov	w1, #0x1                // =1
      ec:      	bl	0xec <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xec>
      f0:      	mov	w20, #0x1               // =1
      f4:      	add	x8, sp, #0x1, lsl #12   // =0x1000
      f8:      	add	x0, sp, #0x60
      fc:      	add	x8, x8, #0x660
     100:      	bl	0x100 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x100>
     104:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     108:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     10c:      	mov	w2, #0x200              // =512
     110:      	add	x0, x0, #0x460
     114:      	add	x1, x1, #0x660
     118:      	bl	0x118 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x118>
     11c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     120:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     124:      	mov	w2, #0x200              // =512
     128:      	add	x0, x0, #0x260
     12c:      	add	x1, x1, #0x460
     130:      	bl	0x130 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x130>
     134:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     138:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     13c:      	mov	w2, #0x200              // =512
     140:      	add	x0, x0, #0x860
     144:      	add	x1, x1, #0x260
     148:      	bl	0x148 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x148>
     14c:      	add	x8, sp, #0xc60
     150:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     154:      	mov	w2, #0x200              // =512
     158:      	add	x0, x8, #0x200
     15c:      	add	x1, x1, #0x860
     160:      	bl	0x160 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x160>
     164:      	mov	w20, #0x2               // =2
     168:      	ldr	x0, [sp, #0x30]
     16c:      	add	x8, sp, #0x60
     170:      	mov	w1, #0x2                // =2
     174:      	bl	0x174 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x174>
     178:      	mov	w20, #0x2               // =2
     17c:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     180:      	add	x0, sp, #0x60
     184:      	add	x25, sp, #0x1, lsl #12  // =0x1000
     188:      	add	x8, x8, #0x660
     18c:      	add	x25, x25, #0x660
     190:      	bl	0x190 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x190>
     194:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     198:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     19c:      	mov	w2, #0x200              // =512
     1a0:      	add	x0, x0, #0x460
     1a4:      	add	x1, x1, #0x660
     1a8:      	add	x27, sp, #0x1, lsl #12  // =0x1000
     1ac:      	stp	x21, x19, [sp]
     1b0:      	add	x27, x27, #0x460
     1b4:      	bl	0x1b4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1b4>
     1b8:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     1bc:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     1c0:      	mov	w2, #0x200              // =512
     1c4:      	add	x0, x0, #0x260
     1c8:      	add	x1, x1, #0x460
     1cc:      	bl	0x1cc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1cc>
     1d0:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     1d4:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     1d8:      	mov	w2, #0x200              // =512
     1dc:      	add	x0, x0, #0x860
     1e0:      	add	x1, x1, #0x260
     1e4:      	add	x19, sp, #0x1, lsl #12  // =0x1000
     1e8:      	add	x19, x19, #0x860
     1ec:      	bl	0x1ec <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1ec>
     1f0:      	add	x8, sp, #0xc60
     1f4:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     1f8:      	mov	w2, #0x200              // =512
     1fc:      	add	x0, x8, #0x400
     200:      	add	x1, x1, #0x860
     204:      	bl	0x204 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x204>
     208:      	add	x0, sp, #0x60
     20c:      	add	x1, sp, #0xc60
     210:      	mov	w2, #0x600              // =1536
     214:      	bl	0x214 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x214>
     218:      	add	x0, sp, #0xc60
     21c:      	mov	w1, wzr
     220:      	mov	w2, #0x440              // =1088
     224:      	bl	0x224 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x224>
     228:      	mov	w21, #0xd01             // =3329
     22c:      	mov	w8, #0xafb8             // =44984
     230:      	mov	w10, #0xdbb5            // =56245
     234:      	movk	w8, #0x13, lsl #16
     238:      	dup	v8.4h, w21
     23c:      	mov	w9, #0x680              // =1664
     240:      	movk	w10, #0x9d7, lsl #16
     244:      	dup	v0.4s, w8
     248:      	dup	v2.4s, w9
     24c:      	dup	v1.4s, w10
     250:      	mov	w20, #0xbb41            // =47937
     254:      	mov	w22, #0x7681            // =30337
     258:      	mov	x2, xzr
     25c:      	movk	w20, #0x9d7d, lsl #16
     260:      	movk	w22, #0x3afb, lsl #16
     264:      	mov	w26, #0xf2ff            // =62207
     268:      	add	x28, sp, #0xa60
     26c:      	str	q0, [sp, #0x40]
     270:      	stp	q1, q2, [sp, #0x10]
     274:      	movi	v0.2d, #0000000000000000
     278:      	mov	x24, xzr
     27c:      	mov	x23, xzr
     280:      	add	x8, x2, #0x1
     284:      	stur	x2, [x29, #-0x28]
     288:      	str	x8, [sp, #0x38]
     28c:      	str	q0, [sp, #0xc50]
     290:      	str	q0, [sp, #0xc40]
     294:      	str	q0, [sp, #0xc30]
     298:      	str	q0, [sp, #0xc20]
     29c:      	str	q0, [sp, #0xc10]
     2a0:      	str	q0, [sp, #0xc00]
     2a4:      	str	q0, [sp, #0xbf0]
     2a8:      	str	q0, [sp, #0xbe0]
     2ac:      	str	q0, [sp, #0xbd0]
     2b0:      	str	q0, [sp, #0xbc0]
     2b4:      	str	q0, [sp, #0xbb0]
     2b8:      	str	q0, [sp, #0xba0]
     2bc:      	str	q0, [sp, #0xb90]
     2c0:      	str	q0, [sp, #0xb80]
     2c4:      	str	q0, [sp, #0xb70]
     2c8:      	str	q0, [sp, #0xb60]
     2cc:      	str	q0, [sp, #0xb50]
     2d0:      	str	q0, [sp, #0xb40]
     2d4:      	str	q0, [sp, #0xb30]
     2d8:      	str	q0, [sp, #0xb20]
     2dc:      	str	q0, [sp, #0xb10]
     2e0:      	str	q0, [sp, #0xb00]
     2e4:      	str	q0, [sp, #0xaf0]
     2e8:      	str	q0, [sp, #0xae0]
     2ec:      	str	q0, [sp, #0xad0]
     2f0:      	str	q0, [sp, #0xac0]
     2f4:      	str	q0, [sp, #0xab0]
     2f8:      	str	q0, [sp, #0xaa0]
     2fc:      	str	q0, [sp, #0xa90]
     300:      	str	q0, [sp, #0xa80]
     304:      	str	q0, [sp, #0xa70]
     308:      	str	q0, [sp, #0xa60]
     30c:      	ldr	x9, [sp, #0x58]
     310:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     314:      	mov	x1, x24
     318:      	add	x8, x8, #0x660
     31c:      	add	x0, x9, #0x480
     320:      	bl	0x320 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x320>
     324:      	movi	v0.2d, #0000000000000000
     328:      	add	x9, sp, #0x60
     32c:      	mov	x8, xzr
     330:      	add	x9, x9, x23
     334:      	add	x23, x23, #0x200
     338:      	add	x24, x24, #0x1
     33c:      	str	q0, [sp, #0x1a50]
     340:      	str	q0, [sp, #0x1a40]
     344:      	str	q0, [sp, #0x1a30]
     348:      	str	q0, [sp, #0x1a20]
     34c:      	str	q0, [sp, #0x1a10]
     350:      	str	q0, [sp, #0x1a00]
     354:      	str	q0, [sp, #0x19f0]
     358:      	str	q0, [sp, #0x19e0]
     35c:      	str	q0, [sp, #0x19d0]
     360:      	str	q0, [sp, #0x19c0]
     364:      	str	q0, [sp, #0x19b0]
     368:      	str	q0, [sp, #0x19a0]
     36c:      	str	q0, [sp, #0x1990]
     370:      	str	q0, [sp, #0x1980]
     374:      	str	q0, [sp, #0x1970]
     378:      	str	q0, [sp, #0x1960]
     37c:      	str	q0, [sp, #0x1950]
     380:      	str	q0, [sp, #0x1940]
     384:      	str	q0, [sp, #0x1930]
     388:      	str	q0, [sp, #0x1920]
     38c:      	str	q0, [sp, #0x1910]
     390:      	str	q0, [sp, #0x1900]
     394:      	str	q0, [sp, #0x18f0]
     398:      	str	q0, [sp, #0x18e0]
     39c:      	str	q0, [sp, #0x18d0]
     3a0:      	str	q0, [sp, #0x18c0]
     3a4:      	str	q0, [sp, #0x18b0]
     3a8:      	str	q0, [sp, #0x18a0]
     3ac:      	str	q0, [sp, #0x1890]
     3b0:      	str	q0, [sp, #0x1880]
     3b4:      	str	q0, [sp, #0x1870]
     3b8:      	str	q0, [sp, #0x1860]
     3bc:      	b	0x49c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x49c>
     3c0:      	mov	w11, #0x2               // =2
     3c4:      	bfi	x11, x8, #2, #62
     3c8:      	ldrh	w13, [x25, x11]
     3cc:      	ldrh	w14, [x9, x11]
     3d0:      	mul	w15, w14, w13
     3d4:      	umull	x12, w15, w22
     3d8:      	lsr	x12, x12, #32
     3dc:      	sub	w16, w15, w12
     3e0:      	add	w16, w12, w16, lsr #1
     3e4:      	lsl	x12, x8, #2
     3e8:      	add	x8, x8, #0x1
     3ec:      	lsr	w16, w16, #11
     3f0:      	ldrh	w17, [x25, x12]
     3f4:      	ldrh	w18, [x9, x12]
     3f8:      	msub	w15, w16, w21, w15
     3fc:      	mul	w16, w18, w17
     400:      	mul	w14, w14, w17
     404:      	mul	w10, w15, w10
     408:      	mul	w13, w13, w18
     40c:      	umull	x15, w16, w22
     410:      	umull	x17, w10, w22
     414:      	umull	x18, w14, w22
     418:      	umull	x0, w13, w22
     41c:      	lsr	x15, x15, #32
     420:      	lsr	x17, x17, #32
     424:      	lsr	x18, x18, #32
     428:      	sub	w1, w16, w15
     42c:      	lsr	x0, x0, #32
     430:      	add	w15, w15, w1, lsr #1
     434:      	sub	w1, w10, w17
     438:      	add	w17, w17, w1, lsr #1
     43c:      	sub	w1, w14, w18
     440:      	add	w18, w18, w1, lsr #1
     444:      	sub	w1, w13, w0
     448:      	lsr	w15, w15, #11
     44c:      	add	w0, w0, w1, lsr #1
     450:      	lsr	w17, w17, #11
     454:      	lsr	w18, w18, #11
     458:      	msub	w15, w15, w21, w16
     45c:      	lsr	w16, w0, #11
     460:      	msub	w10, w17, w21, w10
     464:      	msub	w14, w18, w21, w14
     468:      	msub	w13, w16, w21, w13
     46c:      	add	w10, w10, w15
     470:      	add	w15, w10, w26
     474:      	cmp	w10, #0xd01
     478:      	add	w13, w14, w13
     47c:      	csel	w10, w10, w15, lo
     480:      	strh	w10, [x19, x12]
     484:      	add	w14, w13, w26
     488:      	cmp	w13, #0xd01
     48c:      	csel	w10, w13, w14, lo
     490:      	cmp	x8, #0x80
     494:      	strh	w10, [x19, x11]
     498:      	b.eq	0x4f0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4f0>
     49c:      	orr	w10, w8, #0x80
     4a0:      	mov	w12, #0x11              // =17
     4a4:      	rbit	w10, w10
     4a8:      	lsr	w11, w10, #24
     4ac:      	mov	w10, #0x1               // =1
     4b0:      	b	0x4cc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4cc>
     4b4:      	mul	w12, w12, w12
     4b8:      	lsr	w11, w11, #1
     4bc:      	umull	x13, w12, w20
     4c0:      	lsr	x13, x13, #43
     4c4:      	msub	w12, w13, w21, w12
     4c8:      	cbz	w11, 0x3c0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3c0>
     4cc:      	tbz	w11, #0x0, 0x4b4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4b4>
     4d0:      	mul	w10, w10, w12
     4d4:      	umull	x13, w10, w22
     4d8:      	lsr	x13, x13, #32
     4dc:      	sub	w14, w10, w13
     4e0:      	add	w13, w13, w14, lsr #1
     4e4:      	lsr	w13, w13, #11
     4e8:      	msub	w10, w13, w21, w10
     4ec:      	b	0x4b4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4b4>
     4f0:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     4f4:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     4f8:      	mov	w2, #0x200              // =512
     4fc:      	add	x0, x0, #0x460
     500:      	add	x1, x1, #0x860
     504:      	bl	0x504 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x504>
     508:      	ldr	q6, [sp, #0x40]
     50c:      	mov	x8, xzr
     510:      	ldr	q0, [x28, x8]
     514:      	ldr	q1, [x27, x8]
     518:      	uaddl2	v2.4s, v1.8h, v0.8h
     51c:      	uaddl	v0.4s, v1.4h, v0.4h
     520:      	umull2	v1.2d, v2.4s, v6.4s
     524:      	umull	v3.2d, v2.2s, v6.2s
     528:      	umull2	v4.2d, v0.4s, v6.4s
     52c:      	umull	v5.2d, v0.2s, v6.2s
     530:      	uzp2	v1.4s, v3.4s, v1.4s
     534:      	uzp2	v3.4s, v5.4s, v4.4s
     538:      	xtn	v1.4h, v1.4s
     53c:      	xtn	v3.4h, v3.4s
     540:      	umlsl	v2.4s, v1.4h, v8.4h
     544:      	umlsl	v0.4s, v3.4h, v8.4h
     548:      	uzp1	v0.8h, v0.8h, v2.8h
     54c:      	str	q0, [x19, x8]
     550:      	add	x8, x8, #0x10
     554:      	cmp	x8, #0x200
     558:      	b.ne	0x510 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x510>
     55c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     560:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     564:      	mov	w2, #0x200              // =512
     568:      	add	x0, x0, #0x260
     56c:      	add	x1, x1, #0x860
     570:      	bl	0x570 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x570>
     574:      	mov	x8, xzr
     578:      	mov	x9, x8
     57c:      	add	x8, x8, #0x2
     580:      	cmp	x8, #0x200
     584:      	strh	wzr, [x28, x9]
     588:      	b.ne	0x578 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x578>
     58c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     590:      	add	x0, sp, #0xa60
     594:      	mov	w2, #0x200              // =512
     598:      	add	x1, x1, #0x260
     59c:      	bl	0x59c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x59c>
     5a0:      	mov	x8, xzr
     5a4:      	mov	x9, x8
     5a8:      	add	x8, x8, #0x2
     5ac:      	cmp	x8, #0x200
     5b0:      	strh	wzr, [x27, x9]
     5b4:      	b.ne	0x5a4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5a4>
     5b8:      	ldur	x2, [x29, #-0x28]
     5bc:      	mov	x8, xzr
     5c0:      	mov	x9, x8
     5c4:      	add	x8, x8, #0x2
     5c8:      	cmp	x8, #0x200
     5cc:      	strh	wzr, [x25, x9]
     5d0:      	b.ne	0x5c0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5c0>
     5d4:      	cmp	x23, #0x600
     5d8:      	b.ne	0x30c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x30c>
     5dc:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     5e0:      	add	x1, sp, #0xa60
     5e4:      	mov	w2, #0x200              // =512
     5e8:      	add	x0, x0, #0x860
     5ec:      	bl	0x5ec <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5ec>
     5f0:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     5f4:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     5f8:      	add	x8, x8, #0x460
     5fc:      	add	x0, x0, #0x860
     600:      	bl	0x600 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x600>
     604:      	ldur	x9, [x29, #-0x28]
     608:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     60c:      	ldr	x0, [sp, #0x30]
     610:      	add	x8, x8, #0x660
     614:      	add	w1, w9, #0x3
     618:      	bl	0x618 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x618>
     61c:      	add	x23, sp, #0x1, lsl #12  // =0x1000
     620:      	add	x23, x23, #0x260
     624:      	ldr	q6, [sp, #0x40]
     628:      	mov	x8, xzr
     62c:      	ldr	q0, [x27, x8]
     630:      	ldr	q1, [x25, x8]
     634:      	uaddl2	v2.4s, v1.8h, v0.8h
     638:      	uaddl	v0.4s, v1.4h, v0.4h
     63c:      	umull2	v1.2d, v2.4s, v6.4s
     640:      	umull	v3.2d, v2.2s, v6.2s
     644:      	umull2	v4.2d, v0.4s, v6.4s
     648:      	umull	v5.2d, v0.2s, v6.2s
     64c:      	uzp2	v1.4s, v3.4s, v1.4s
     650:      	uzp2	v3.4s, v5.4s, v4.4s
     654:      	xtn	v1.4h, v1.4s
     658:      	xtn	v3.4h, v3.4s
     65c:      	umlsl	v2.4s, v1.4h, v8.4h
     660:      	umlsl	v0.4s, v3.4h, v8.4h
     664:      	uzp1	v0.8h, v0.8h, v2.8h
     668:      	str	q0, [x19, x8]
     66c:      	add	x8, x8, #0x10
     670:      	cmp	x8, #0x200
     674:      	b.ne	0x62c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x62c>
     678:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     67c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     680:      	mov	w2, #0x200              // =512
     684:      	add	x0, x0, #0x260
     688:      	add	x1, x1, #0x860
     68c:      	bl	0x68c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x68c>
     690:      	ldp	q5, q4, [sp, #0x10]
     694:      	mov	x8, xzr
     698:      	ldr	q0, [x23, x8]
     69c:      	ushll	v1.4s, v0.4h, #0xa
     6a0:      	ushll2	v0.4s, v0.8h, #0xa
     6a4:      	add	v1.4s, v1.4s, v4.4s
     6a8:      	add	v0.4s, v0.4s, v4.4s
     6ac:      	umull2	v2.2d, v1.4s, v5.4s
     6b0:      	umull	v1.2d, v1.2s, v5.2s
     6b4:      	umull2	v3.2d, v0.4s, v5.4s
     6b8:      	umull	v0.2d, v0.2s, v5.2s
     6bc:      	uzp2	v1.4s, v1.4s, v2.4s
     6c0:      	uzp2	v0.4s, v0.4s, v3.4s
     6c4:      	shrn	v1.4h, v1.4s, #0x7
     6c8:      	shrn2	v1.8h, v0.4s, #0x7
     6cc:      	bic	v1.8h, #0xfc, lsl #8
     6d0:      	str	q1, [x23, x8]
     6d4:      	add	x8, x8, #0x10
     6d8:      	cmp	x8, #0x200
     6dc:      	b.ne	0x698 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x698>
     6e0:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     6e4:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     6e8:      	mov	w2, #0x200              // =512
     6ec:      	add	x0, x0, #0x860
     6f0:      	add	x1, x1, #0x260
     6f4:      	bl	0x6f4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x6f4>
     6f8:      	ldur	x10, [x29, #-0x28]
     6fc:      	mov	w9, #0x140              // =320
     700:      	add	x8, sp, #0xc60
     704:      	madd	x2, x10, x9, x8
     708:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     70c:      	mov	w1, #0xa                // =10
     710:      	mov	w3, #0x140              // =320
     714:      	add	x0, x0, #0x860
     718:      	bl	0x718 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x718>
     71c:      	mov	x8, xzr
     720:      	mov	x9, x8
     724:      	add	x8, x8, #0x2
     728:      	cmp	x8, #0x200
     72c:      	strh	wzr, [x19, x9]
     730:      	b.ne	0x720 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x720>
     734:      	mov	x8, xzr
     738:      	mov	x9, x8
     73c:      	add	x8, x8, #0x2
     740:      	cmp	x8, #0x200
     744:      	strh	wzr, [x25, x9]
     748:      	b.ne	0x738 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x738>
     74c:      	mov	x8, xzr
     750:      	mov	x9, x8
     754:      	add	x8, x8, #0x2
     758:      	cmp	x8, #0x200
     75c:      	strh	wzr, [x27, x9]
     760:      	b.ne	0x750 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x750>
     764:      	ldr	x2, [sp, #0x38]
     768:      	cmp	x2, #0x3
     76c:      	b.ne	0x274 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x274>
     770:      	adrp	x8, 0x0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>
     774:      	mov	w24, #0xd01             // =3329
     778:      	movi	v0.2d, #0000000000000000
     77c:      	ldr	d9, [x8]
     780:      	adrp	x8, 0x0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>
     784:      	movi	v8.4h, #0x7
     788:      	ldr	d10, [x8]
     78c:      	mov	w8, #0xafb8             // =44984
     790:      	dup	v12.4h, w24
     794:      	movk	w8, #0x13, lsl #16
     798:      	adrp	x9, 0x0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>
     79c:      	add	x23, sp, #0x1, lsl #12  // =0x1000
     7a0:      	dup	v1.4s, w8
     7a4:      	ldr	d11, [x9]
     7a8:      	add	x25, sp, #0x1, lsl #12  // =0x1000
     7ac:      	mov	w26, #0xbb41            // =47937
     7b0:      	mov	w27, #0x7681            // =30337
     7b4:      	add	x21, sp, #0x1, lsl #12  // =0x1000
     7b8:      	mov	x10, xzr
     7bc:      	mov	x19, xzr
     7c0:      	add	x23, x23, #0x660
     7c4:      	add	x25, x25, #0x860
     7c8:      	movk	w26, #0x9d7d, lsl #16
     7cc:      	movk	w27, #0x3afb, lsl #16
     7d0:      	mov	w28, #0xf2ff            // =62207
     7d4:      	add	x21, x21, #0x460
     7d8:      	add	x22, sp, #0x660
     7dc:      	str	q0, [sp, #0x850]
     7e0:      	str	q0, [sp, #0x840]
     7e4:      	str	q0, [sp, #0x830]
     7e8:      	str	q0, [sp, #0x820]
     7ec:      	str	q0, [sp, #0x810]
     7f0:      	str	q0, [sp, #0x800]
     7f4:      	str	q0, [sp, #0x7f0]
     7f8:      	str	q0, [sp, #0x7e0]
     7fc:      	str	q0, [sp, #0x7d0]
     800:      	str	q0, [sp, #0x7c0]
     804:      	str	q0, [sp, #0x7b0]
     808:      	str	q0, [sp, #0x7a0]
     80c:      	str	q0, [sp, #0x790]
     810:      	str	q0, [sp, #0x780]
     814:      	str	q0, [sp, #0x770]
     818:      	str	q0, [sp, #0x760]
     81c:      	str	q0, [sp, #0x750]
     820:      	str	q0, [sp, #0x740]
     824:      	str	q0, [sp, #0x730]
     828:      	str	q0, [sp, #0x720]
     82c:      	str	q0, [sp, #0x710]
     830:      	str	q0, [sp, #0x700]
     834:      	str	q0, [sp, #0x6f0]
     838:      	str	q0, [sp, #0x6e0]
     83c:      	str	q0, [sp, #0x6d0]
     840:      	str	q0, [sp, #0x6c0]
     844:      	str	q0, [sp, #0x6b0]
     848:      	str	q0, [sp, #0x6a0]
     84c:      	str	q0, [sp, #0x690]
     850:      	str	q0, [sp, #0x680]
     854:      	str	q0, [sp, #0x670]
     858:      	str	q0, [sp, #0x660]
     85c:      	str	q1, [sp, #0x40]
     860:      	ldr	x9, [sp, #0x58]
     864:      	mov	w11, #0x180             // =384
     868:      	movi	v0.2d, #0000000000000000
     86c:      	madd	x9, x10, x11, x9
     870:      	add	x10, x10, #0x1
     874:      	add	x11, sp, #0x60
     878:      	stur	x10, [x29, #-0x28]
     87c:      	add	x10, sp, #0x1, lsl #12  // =0x1000
     880:      	mov	x8, xzr
     884:      	add	x20, x11, x19
     888:      	add	x19, x19, #0x200
     88c:      	add	x10, x10, #0x860
     890:      	str	q0, [sp, #0x1a50]
     894:      	str	q0, [sp, #0x1a40]
     898:      	str	q0, [sp, #0x1a30]
     89c:      	str	q0, [sp, #0x1a20]
     8a0:      	str	q0, [sp, #0x1a10]
     8a4:      	str	q0, [sp, #0x1a00]
     8a8:      	str	q0, [sp, #0x19f0]
     8ac:      	str	q0, [sp, #0x19e0]
     8b0:      	str	q0, [sp, #0x19d0]
     8b4:      	str	q0, [sp, #0x19c0]
     8b8:      	str	q0, [sp, #0x19b0]
     8bc:      	str	q0, [sp, #0x19a0]
     8c0:      	str	q0, [sp, #0x1990]
     8c4:      	str	q0, [sp, #0x1980]
     8c8:      	str	q0, [sp, #0x1970]
     8cc:      	str	q0, [sp, #0x1960]
     8d0:      	str	q0, [sp, #0x1950]
     8d4:      	str	q0, [sp, #0x1940]
     8d8:      	str	q0, [sp, #0x1930]
     8dc:      	str	q0, [sp, #0x1920]
     8e0:      	str	q0, [sp, #0x1910]
     8e4:      	str	q0, [sp, #0x1900]
     8e8:      	str	q0, [sp, #0x18f0]
     8ec:      	str	q0, [sp, #0x18e0]
     8f0:      	str	q0, [sp, #0x18d0]
     8f4:      	str	q0, [sp, #0x18c0]
     8f8:      	str	q0, [sp, #0x18b0]
     8fc:      	str	q0, [sp, #0x18a0]
     900:      	str	q0, [sp, #0x1890]
     904:      	str	q0, [sp, #0x1880]
     908:      	str	q0, [sp, #0x1870]
     90c:      	str	q0, [sp, #0x1860]
     910:      	fmov	s0, w8
     914:      	add	w11, w8, #0x1
     918:      	add	x12, x8, #0x4
     91c:      	fmov	s1, w12
     920:      	add	w13, w8, #0x5
     924:      	add	w14, w8, #0x6
     928:      	add	w15, w8, #0xa
     92c:      	lsr	x12, x12, #3
     930:      	mov	v0.h[1], w11
     934:      	add	x11, x8, #0x8
     938:      	fmov	s2, w11
     93c:      	mov	v1.h[1], w13
     940:      	add	w13, w8, #0x9
     944:      	lsr	x11, x11, #3
     948:      	ldrb	w12, [x9, x12]
     94c:      	mov	v2.h[1], w13
     950:      	add	w13, w8, #0x2
     954:      	ldrb	w11, [x9, x11]
     958:      	mov	v0.h[2], w13
     95c:      	mov	v1.h[2], w14
     960:      	add	w14, w8, #0x3
     964:      	lsr	x13, x8, #3
     968:      	dup	v4.4h, w12
     96c:      	dup	v5.4h, w11
     970:      	mov	v2.h[2], w15
     974:      	sub	w15, w8, #0x1
     978:      	ldrb	w13, [x9, x13]
     97c:      	mov	v0.h[3], w14
     980:      	add	w14, w8, #0xb
     984:      	mov	v1.h[3], w15
     988:      	dup	v3.4h, w13
     98c:      	bic	v4.4h, #0xff, lsl #8
     990:      	bic	v5.4h, #0xff, lsl #8
     994:      	add	x8, x8, #0xc
     998:      	mov	v2.h[3], w14
     99c:      	cmp	x8, #0xc00
     9a0:      	and	v0.8b, v0.8b, v8.8b
     9a4:      	and	v1.8b, v1.8b, v8.8b
     9a8:      	bic	v3.4h, #0xff, lsl #8
     9ac:      	and	v2.8b, v2.8b, v8.8b
     9b0:      	neg	v0.4h, v0.4h
     9b4:      	neg	v1.4h, v1.4h
     9b8:      	neg	v2.4h, v2.4h
     9bc:      	ushl	v0.4h, v3.4h, v0.4h
     9c0:      	ushl	v1.4h, v4.4h, v1.4h
     9c4:      	ldr	h3, [x10]
     9c8:      	ushl	v2.4h, v5.4h, v2.4h
     9cc:      	bic	v0.4h, #0xfe
     9d0:      	bic	v1.4h, #0xfe
     9d4:      	bic	v2.4h, #0xfe
     9d8:      	ushl	v0.4h, v0.4h, v9.4h
     9dc:      	ushl	v1.4h, v1.4h, v10.4h
     9e0:      	ushl	v2.4h, v2.4h, v11.4h
     9e4:      	orr	v0.8b, v0.8b, v3.8b
     9e8:      	orr	v1.8b, v2.8b, v1.8b
     9ec:      	orr	v0.8b, v1.8b, v0.8b
     9f0:      	fmov	x11, d0
     9f4:      	lsr	x12, x11, #32
     9f8:      	orr	w11, w11, w12
     9fc:      	orr	w11, w11, w11, lsr #16
     a00:      	strh	w11, [x10], #0x2
     a04:      	b.ne	0x910 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x910>
     a08:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     a0c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     a10:      	mov	w2, #0x200              // =512
     a14:      	add	x0, x0, #0x660
     a18:      	add	x1, x1, #0x860
     a1c:      	bl	0xa1c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa1c>
     a20:      	movi	v0.2d, #0000000000000000
     a24:      	mov	x8, xzr
     a28:      	str	q0, [sp, #0x1a50]
     a2c:      	str	q0, [sp, #0x1a40]
     a30:      	str	q0, [sp, #0x1a30]
     a34:      	str	q0, [sp, #0x1a20]
     a38:      	str	q0, [sp, #0x1a10]
     a3c:      	str	q0, [sp, #0x1a00]
     a40:      	str	q0, [sp, #0x19f0]
     a44:      	str	q0, [sp, #0x19e0]
     a48:      	str	q0, [sp, #0x19d0]
     a4c:      	str	q0, [sp, #0x19c0]
     a50:      	str	q0, [sp, #0x19b0]
     a54:      	str	q0, [sp, #0x19a0]
     a58:      	str	q0, [sp, #0x1990]
     a5c:      	str	q0, [sp, #0x1980]
     a60:      	str	q0, [sp, #0x1970]
     a64:      	str	q0, [sp, #0x1960]
     a68:      	str	q0, [sp, #0x1950]
     a6c:      	str	q0, [sp, #0x1940]
     a70:      	str	q0, [sp, #0x1930]
     a74:      	str	q0, [sp, #0x1920]
     a78:      	str	q0, [sp, #0x1910]
     a7c:      	str	q0, [sp, #0x1900]
     a80:      	str	q0, [sp, #0x18f0]
     a84:      	str	q0, [sp, #0x18e0]
     a88:      	str	q0, [sp, #0x18d0]
     a8c:      	str	q0, [sp, #0x18c0]
     a90:      	str	q0, [sp, #0x18b0]
     a94:      	str	q0, [sp, #0x18a0]
     a98:      	str	q0, [sp, #0x1890]
     a9c:      	str	q0, [sp, #0x1880]
     aa0:      	str	q0, [sp, #0x1870]
     aa4:      	str	q0, [sp, #0x1860]
     aa8:      	b	0xb88 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb88>
     aac:      	mov	w10, #0x2               // =2
     ab0:      	bfi	x10, x8, #2, #62
     ab4:      	ldrh	w12, [x23, x10]
     ab8:      	ldrh	w13, [x20, x10]
     abc:      	mul	w14, w13, w12
     ac0:      	umull	x11, w14, w27
     ac4:      	lsr	x11, x11, #32
     ac8:      	sub	w15, w14, w11
     acc:      	add	w15, w11, w15, lsr #1
     ad0:      	lsl	x11, x8, #2
     ad4:      	add	x8, x8, #0x1
     ad8:      	lsr	w15, w15, #11
     adc:      	ldrh	w16, [x23, x11]
     ae0:      	ldrh	w17, [x20, x11]
     ae4:      	msub	w14, w15, w24, w14
     ae8:      	mul	w15, w17, w16
     aec:      	mul	w13, w13, w16
     af0:      	mul	w9, w14, w9
     af4:      	mul	w12, w12, w17
     af8:      	umull	x14, w15, w27
     afc:      	umull	x16, w9, w27
     b00:      	umull	x17, w13, w27
     b04:      	umull	x18, w12, w27
     b08:      	lsr	x14, x14, #32
     b0c:      	lsr	x16, x16, #32
     b10:      	lsr	x17, x17, #32
     b14:      	sub	w0, w15, w14
     b18:      	lsr	x18, x18, #32
     b1c:      	add	w14, w14, w0, lsr #1
     b20:      	sub	w0, w9, w16
     b24:      	add	w16, w16, w0, lsr #1
     b28:      	sub	w0, w13, w17
     b2c:      	add	w17, w17, w0, lsr #1
     b30:      	sub	w0, w12, w18
     b34:      	lsr	w14, w14, #11
     b38:      	add	w18, w18, w0, lsr #1
     b3c:      	lsr	w16, w16, #11
     b40:      	lsr	w17, w17, #11
     b44:      	msub	w14, w14, w24, w15
     b48:      	lsr	w15, w18, #11
     b4c:      	msub	w9, w16, w24, w9
     b50:      	msub	w13, w17, w24, w13
     b54:      	msub	w12, w15, w24, w12
     b58:      	add	w9, w9, w14
     b5c:      	add	w14, w9, w28
     b60:      	cmp	w9, #0xd01
     b64:      	add	w12, w13, w12
     b68:      	csel	w9, w9, w14, lo
     b6c:      	strh	w9, [x25, x11]
     b70:      	add	w13, w12, w28
     b74:      	cmp	w12, #0xd01
     b78:      	csel	w9, w12, w13, lo
     b7c:      	cmp	x8, #0x80
     b80:      	strh	w9, [x25, x10]
     b84:      	b.eq	0xbdc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbdc>
     b88:      	orr	w9, w8, #0x80
     b8c:      	mov	w11, #0x11              // =17
     b90:      	rbit	w9, w9
     b94:      	lsr	w10, w9, #24
     b98:      	mov	w9, #0x1                // =1
     b9c:      	b	0xbb8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbb8>
     ba0:      	mul	w11, w11, w11
     ba4:      	lsr	w10, w10, #1
     ba8:      	umull	x12, w11, w26
     bac:      	lsr	x12, x12, #43
     bb0:      	msub	w11, w12, w24, w11
     bb4:      	cbz	w10, 0xaac <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xaac>
     bb8:      	tbz	w10, #0x0, 0xba0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xba0>
     bbc:      	mul	w9, w9, w11
     bc0:      	umull	x12, w9, w27
     bc4:      	lsr	x12, x12, #32
     bc8:      	sub	w13, w9, w12
     bcc:      	add	w12, w12, w13, lsr #1
     bd0:      	lsr	w12, w12, #11
     bd4:      	msub	w9, w12, w24, w9
     bd8:      	b	0xba0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xba0>
     bdc:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     be0:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     be4:      	mov	w2, #0x200              // =512
     be8:      	add	x0, x0, #0x460
     bec:      	add	x1, x1, #0x860
     bf0:      	bl	0xbf0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbf0>
     bf4:      	ldr	q6, [sp, #0x40]
     bf8:      	mov	x8, xzr
     bfc:      	ldr	q0, [x22, x8]
     c00:      	ldr	q1, [x21, x8]
     c04:      	uaddl2	v2.4s, v1.8h, v0.8h
     c08:      	uaddl	v0.4s, v1.4h, v0.4h
     c0c:      	umull2	v1.2d, v2.4s, v6.4s
     c10:      	umull	v3.2d, v2.2s, v6.2s
     c14:      	umull2	v4.2d, v0.4s, v6.4s
     c18:      	umull	v5.2d, v0.2s, v6.2s
     c1c:      	uzp2	v1.4s, v3.4s, v1.4s
     c20:      	uzp2	v3.4s, v5.4s, v4.4s
     c24:      	xtn	v1.4h, v1.4s
     c28:      	xtn	v3.4h, v3.4s
     c2c:      	umlsl	v2.4s, v1.4h, v12.4h
     c30:      	umlsl	v0.4s, v3.4h, v12.4h
     c34:      	uzp1	v0.8h, v0.8h, v2.8h
     c38:      	str	q0, [x25, x8]
     c3c:      	add	x8, x8, #0x10
     c40:      	cmp	x8, #0x200
     c44:      	b.ne	0xbfc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbfc>
     c48:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     c4c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     c50:      	mov	w2, #0x200              // =512
     c54:      	add	x0, x0, #0x260
     c58:      	add	x1, x1, #0x860
     c5c:      	bl	0xc5c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc5c>
     c60:      	mov	x8, xzr
     c64:      	mov	x9, x8
     c68:      	add	x8, x8, #0x2
     c6c:      	cmp	x8, #0x200
     c70:      	strh	wzr, [x22, x9]
     c74:      	b.ne	0xc64 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc64>
     c78:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     c7c:      	add	x0, sp, #0x660
     c80:      	mov	w2, #0x200              // =512
     c84:      	add	x1, x1, #0x260
     c88:      	bl	0xc88 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc88>
     c8c:      	mov	x8, xzr
     c90:      	mov	x9, x8
     c94:      	add	x8, x8, #0x2
     c98:      	cmp	x8, #0x200
     c9c:      	strh	wzr, [x21, x9]
     ca0:      	b.ne	0xc90 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc90>
     ca4:      	ldur	x10, [x29, #-0x28]
     ca8:      	mov	x8, xzr
     cac:      	mov	x9, x8
     cb0:      	add	x8, x8, #0x2
     cb4:      	cmp	x8, #0x200
     cb8:      	strh	wzr, [x23, x9]
     cbc:      	b.ne	0xcac <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xcac>
     cc0:      	cmp	x19, #0x600
     cc4:      	b.ne	0x860 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x860>
     cc8:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     ccc:      	add	x1, sp, #0x660
     cd0:      	mov	w2, #0x200              // =512
     cd4:      	add	x0, x0, #0x860
     cd8:      	bl	0xcd8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xcd8>
     cdc:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     ce0:      	add	x8, sp, #0xa60
     ce4:      	add	x0, x0, #0x860
     ce8:      	bl	0xce8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xce8>
     cec:      	add	x8, sp, #0x1, lsl #12   // =0x1000
     cf0:      	ldr	x0, [sp, #0x30]
     cf4:      	mov	w1, #0x6                // =6
     cf8:      	add	x8, x8, #0x260
     cfc:      	add	x19, sp, #0x1, lsl #12  // =0x1000
     d00:      	add	x19, x19, #0x260
     d04:      	bl	0xd04 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd04>
     d08:      	ldp	x21, x20, [sp]
     d0c:      	mov	w9, #0xd01              // =3329
     d10:      	mov	w10, #0xafb8            // =44984
     d14:      	mov	x8, xzr
     d18:      	movk	w10, #0x13, lsl #16
     d1c:      	dup	v0.4h, w9
     d20:      	add	x9, sp, #0xa60
     d24:      	dup	v1.4s, w10
     d28:      	add	x10, sp, #0x1, lsl #12  // =0x1000
     d2c:      	add	x10, x10, #0x860
     d30:      	ldr	q2, [x9, x8]
     d34:      	ldr	q3, [x19, x8]
     d38:      	uaddl2	v4.4s, v3.8h, v2.8h
     d3c:      	uaddl	v2.4s, v3.4h, v2.4h
     d40:      	umull2	v3.2d, v4.4s, v1.4s
     d44:      	umull	v5.2d, v4.2s, v1.2s
     d48:      	umull2	v6.2d, v2.4s, v1.4s
     d4c:      	umull	v7.2d, v2.2s, v1.2s
     d50:      	uzp2	v3.4s, v5.4s, v3.4s
     d54:      	uzp2	v5.4s, v7.4s, v6.4s
     d58:      	xtn	v3.4h, v3.4s
     d5c:      	xtn	v5.4h, v5.4s
     d60:      	umlsl	v4.4s, v3.4h, v0.4h
     d64:      	umlsl	v2.4s, v5.4h, v0.4h
     d68:      	uzp1	v2.8h, v2.8h, v4.8h
     d6c:      	str	q2, [x10, x8]
     d70:      	add	x8, x8, #0x10
     d74:      	cmp	x8, #0x200
     d78:      	b.ne	0xd30 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd30>
     d7c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     d80:      	add	x0, sp, #0x860
     d84:      	mov	w2, #0x200              // =512
     d88:      	add	x1, x1, #0x860
     d8c:      	add	x19, sp, #0x1, lsl #12  // =0x1000
     d90:      	add	x19, x19, #0x860
     d94:      	bl	0xd94 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd94>
     d98:      	movi	v4.2d, #0000000000000000
     d9c:      	movi	v0.8b, #0x7
     da0:      	adrp	x9, 0x0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>
     da4:      	movi	v1.8b, #0x1
     da8:      	movi	v2.8b, #0x10
     dac:      	ldr	d3, [x9]
     db0:      	mov	x8, xzr
     db4:      	add	x9, x21, #0x1
     db8:      	str	q4, [sp, #0x1a50]
     dbc:      	str	q4, [sp, #0x1a40]
     dc0:      	str	q4, [sp, #0x1a30]
     dc4:      	str	q4, [sp, #0x1a20]
     dc8:      	str	q4, [sp, #0x1a10]
     dcc:      	str	q4, [sp, #0x1a00]
     dd0:      	str	q4, [sp, #0x19f0]
     dd4:      	str	q4, [sp, #0x19e0]
     dd8:      	str	q4, [sp, #0x19d0]
     ddc:      	str	q4, [sp, #0x19c0]
     de0:      	str	q4, [sp, #0x19b0]
     de4:      	str	q4, [sp, #0x19a0]
     de8:      	str	q4, [sp, #0x1990]
     dec:      	str	q4, [sp, #0x1980]
     df0:      	str	q4, [sp, #0x1970]
     df4:      	str	q4, [sp, #0x1960]
     df8:      	str	q4, [sp, #0x1950]
     dfc:      	str	q4, [sp, #0x1940]
     e00:      	str	q4, [sp, #0x1930]
     e04:      	str	q4, [sp, #0x1920]
     e08:      	str	q4, [sp, #0x1910]
     e0c:      	str	q4, [sp, #0x1900]
     e10:      	str	q4, [sp, #0x18f0]
     e14:      	str	q4, [sp, #0x18e0]
     e18:      	str	q4, [sp, #0x18d0]
     e1c:      	str	q4, [sp, #0x18c0]
     e20:      	str	q4, [sp, #0x18b0]
     e24:      	str	q4, [sp, #0x18a0]
     e28:      	str	q4, [sp, #0x1890]
     e2c:      	str	q4, [sp, #0x1880]
     e30:      	str	q4, [sp, #0x1870]
     e34:      	str	q4, [sp, #0x1860]
     e38:      	and	v4.8b, v3.8b, v0.8b
     e3c:      	sub	x10, x9, #0x1
     e40:      	ld1r	{ v6.8b }, [x9]
     e44:      	ld1r	{ v5.8b }, [x10]
     e48:      	add	x10, x19, x8
     e4c:      	add	v3.8b, v3.8b, v2.8b
     e50:      	add	x8, x8, #0x20
     e54:      	add	x9, x9, #0x2
     e58:      	neg	v4.8b, v4.8b
     e5c:      	cmp	x8, #0x200
     e60:      	ushl	v5.8b, v5.8b, v4.8b
     e64:      	ushl	v4.8b, v6.8b, v4.8b
     e68:      	ldp	q6, q7, [x10]
     e6c:      	and	v5.8b, v5.8b, v1.8b
     e70:      	and	v4.8b, v4.8b, v1.8b
     e74:      	ushll	v5.8h, v5.8b, #0x0
     e78:      	ushll	v4.8h, v4.8b, #0x0
     e7c:      	orr	v5.16b, v6.16b, v5.16b
     e80:      	orr	v4.16b, v7.16b, v4.16b
     e84:      	stp	q5, q4, [x10]
     e88:      	b.ne	0xe38 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xe38>
     e8c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     e90:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     e94:      	mov	w2, #0x200              // =512
     e98:      	add	x0, x0, #0x660
     e9c:      	add	x1, x1, #0x860
     ea0:      	add	x19, sp, #0x1, lsl #12  // =0x1000
     ea4:      	add	x19, x19, #0x660
     ea8:      	bl	0xea8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xea8>
     eac:      	mov	w8, #0xd01              // =3329
     eb0:      	movi	v0.2d, #0000000000000000
     eb4:      	dup	v1.8h, w8
     eb8:      	mov	x8, xzr
     ebc:      	add	x9, x19, x8
     ec0:      	add	x8, x8, #0x20
     ec4:      	ldp	q2, q3, [x9]
     ec8:      	cmp	x8, #0x200
     ecc:      	umull	v4.4s, v2.4h, v1.4h
     ed0:      	umull2	v2.4s, v2.8h, v1.8h
     ed4:      	umull	v5.4s, v3.4h, v1.4h
     ed8:      	umull2	v3.4s, v3.8h, v1.8h
     edc:      	urhadd	v2.4s, v2.4s, v0.4s
     ee0:      	urhadd	v4.4s, v4.4s, v0.4s
     ee4:      	urhadd	v5.4s, v5.4s, v0.4s
     ee8:      	urhadd	v3.4s, v3.4s, v0.4s
     eec:      	uzp1	v2.8h, v4.8h, v2.8h
     ef0:      	uzp1	v3.8h, v5.8h, v3.8h
     ef4:      	stp	q2, q3, [x9]
     ef8:      	b.ne	0xebc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xebc>
     efc:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     f00:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     f04:      	mov	w2, #0x200              // =512
     f08:      	add	x0, x0, #0x460
     f0c:      	add	x1, x1, #0x660
     f10:      	add	x19, sp, #0x1, lsl #12  // =0x1000
     f14:      	add	x19, x19, #0x460
     f18:      	bl	0xf18 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xf18>
     f1c:      	mov	w9, #0xd01              // =3329
     f20:      	mov	w10, #0xafb8            // =44984
     f24:      	mov	x8, xzr
     f28:      	movk	w10, #0x13, lsl #16
     f2c:      	dup	v0.4h, w9
     f30:      	add	x9, sp, #0x860
     f34:      	dup	v1.4s, w10
     f38:      	add	x10, sp, #0x1, lsl #12  // =0x1000
     f3c:      	add	x10, x10, #0x860
     f40:      	ldr	q2, [x9, x8]
     f44:      	ldr	q3, [x19, x8]
     f48:      	uaddl2	v4.4s, v3.8h, v2.8h
     f4c:      	uaddl	v2.4s, v3.4h, v2.4h
     f50:      	umull2	v3.2d, v4.4s, v1.4s
     f54:      	umull	v5.2d, v4.2s, v1.2s
     f58:      	umull2	v6.2d, v2.4s, v1.4s
     f5c:      	umull	v7.2d, v2.2s, v1.2s
     f60:      	uzp2	v3.4s, v5.4s, v3.4s
     f64:      	uzp2	v5.4s, v7.4s, v6.4s
     f68:      	xtn	v3.4h, v3.4s
     f6c:      	xtn	v5.4h, v5.4s
     f70:      	umlsl	v4.4s, v3.4h, v0.4h
     f74:      	umlsl	v2.4s, v5.4h, v0.4h
     f78:      	uzp1	v2.8h, v2.8h, v4.8h
     f7c:      	str	q2, [x10, x8]
     f80:      	add	x8, x8, #0x10
     f84:      	cmp	x8, #0x200
     f88:      	b.ne	0xf40 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xf40>
     f8c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
     f90:      	add	x1, sp, #0x1, lsl #12   // =0x1000
     f94:      	mov	w2, #0x200              // =512
     f98:      	add	x0, x0, #0x660
     f9c:      	add	x1, x1, #0x860
     fa0:      	add	x19, sp, #0x1, lsl #12  // =0x1000
     fa4:      	add	x19, x19, #0x660
     fa8:      	bl	0xfa8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xfa8>
     fac:      	mov	w9, #0xafb8             // =44984
     fb0:      	mov	w8, #0x680              // =1664
     fb4:      	movi	v0.8h, #0xf
     fb8:      	movk	w9, #0x13, lsl #16
     fbc:      	dup	v1.4s, w8
     fc0:      	mov	x8, xzr
     fc4:      	dup	v2.4s, w9
     fc8:      	ldr	q3, [x19, x8]
     fcc:      	ushll2	v4.4s, v3.8h, #0x4
     fd0:      	ushll	v3.4s, v3.4h, #0x4
     fd4:      	add	v4.4s, v4.4s, v1.4s
     fd8:      	add	v3.4s, v3.4s, v1.4s
     fdc:      	umull2	v5.2d, v4.4s, v2.4s
     fe0:      	umull	v4.2d, v4.2s, v2.2s
     fe4:      	umull2	v6.2d, v3.4s, v2.4s
     fe8:      	umull	v3.2d, v3.2s, v2.2s
     fec:      	uzp2	v4.4s, v4.4s, v5.4s
     ff0:      	uzp2	v3.4s, v3.4s, v6.4s
     ff4:      	uzp1	v3.8h, v3.8h, v4.8h
     ff8:      	and	v3.16b, v3.16b, v0.16b
     ffc:      	str	q3, [x19, x8]
    1000:      	add	x8, x8, #0x10
    1004:      	cmp	x8, #0x200
    1008:      	b.ne	0xfc8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xfc8>
    100c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
    1010:      	add	x1, sp, #0x1, lsl #12   // =0x1000
    1014:      	mov	w2, #0x200              // =512
    1018:      	add	x0, x0, #0x860
    101c:      	add	x1, x1, #0x660
    1020:      	add	x19, sp, #0x1, lsl #12  // =0x1000
    1024:      	add	x19, x19, #0x860
    1028:      	bl	0x1028 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1028>
    102c:      	add	x8, sp, #0xc60
    1030:      	add	x0, sp, #0x1, lsl #12   // =0x1000
    1034:      	add	x2, x8, #0x3c0
    1038:      	mov	w1, #0x4                // =4
    103c:      	add	x0, x0, #0x860
    1040:      	mov	w3, #0x80               // =128
    1044:      	bl	0x1044 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1044>
    1048:      	mov	x8, xzr
    104c:      	mov	x9, x8
    1050:      	add	x8, x8, #0x2
    1054:      	cmp	x8, #0x200
    1058:      	strh	wzr, [x19, x9]
    105c:      	b.ne	0x104c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x104c>
    1060:      	add	x9, sp, #0x1, lsl #12   // =0x1000
    1064:      	mov	x8, xzr
    1068:      	add	x9, x9, #0x460
    106c:      	mov	x10, x8
    1070:      	add	x8, x8, #0x2
    1074:      	cmp	x8, #0x200
    1078:      	strh	wzr, [x9, x10]
    107c:      	b.ne	0x106c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x106c>
    1080:      	mov	x8, xzr
    1084:      	add	x9, sp, #0x860
    1088:      	mov	x10, x8
    108c:      	add	x8, x8, #0x2
    1090:      	cmp	x8, #0x200
    1094:      	strh	wzr, [x9, x10]
    1098:      	b.ne	0x1088 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1088>
    109c:      	add	x9, sp, #0x1, lsl #12   // =0x1000
    10a0:      	mov	x8, xzr
    10a4:      	add	x9, x9, #0x260
    10a8:      	mov	x10, x8
    10ac:      	add	x8, x8, #0x2
    10b0:      	cmp	x8, #0x200
    10b4:      	strh	wzr, [x9, x10]
    10b8:      	b.ne	0x10a8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x10a8>
    10bc:      	mov	x8, xzr
    10c0:      	add	x9, sp, #0xa60
    10c4:      	mov	x10, x8
    10c8:      	add	x8, x8, #0x2
    10cc:      	cmp	x8, #0x200
    10d0:      	strh	wzr, [x9, x10]
    10d4:      	b.ne	0x10c4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x10c4>
    10d8:      	add	x1, sp, #0xc60
    10dc:      	mov	x0, x20
    10e0:      	mov	w2, #0x440              // =1088
    10e4:      	bl	0x10e4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x10e4>
    10e8:      	mov	x8, xzr
    10ec:      	add	x9, sp, #0x60
    10f0:      	mov	x10, x8
    10f4:      	add	x8, x8, #0x2
    10f8:      	cmp	x8, #0x200
    10fc:      	strh	wzr, [x9, x10]
    1100:      	b.ne	0x10f0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x10f0>
    1104:      	add	x9, sp, #0x60
    1108:      	mov	x8, xzr
    110c:      	add	x9, x9, #0x200
    1110:      	mov	x10, x8
    1114:      	add	x8, x8, #0x2
    1118:      	cmp	x8, #0x200
    111c:      	strh	wzr, [x9, x10]
    1120:      	b.ne	0x1110 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1110>
    1124:      	add	x9, sp, #0x60
    1128:      	mov	x8, xzr
    112c:      	add	x9, x9, #0x400
    1130:      	mov	x10, x8
    1134:      	add	x8, x8, #0x2
    1138:      	cmp	x8, #0x200
    113c:      	strh	wzr, [x9, x10]
    1140:      	b.ne	0x1130 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1130>
    1144:      	add	sp, sp, #0x1, lsl #12   // =0x1000
    1148:      	add	sp, sp, #0xa70
    114c:      	ldp	x20, x19, [sp, #0x80]
    1150:      	ldp	x22, x21, [sp, #0x70]
    1154:      	ldp	x24, x23, [sp, #0x60]
    1158:      	ldp	x26, x25, [sp, #0x50]
    115c:      	ldp	x28, x27, [sp, #0x40]
    1160:      	ldp	x29, x30, [sp, #0x30]
    1164:      	ldp	d9, d8, [sp, #0x20]
    1168:      	ldp	d11, d10, [sp, #0x10]
    116c:      	ldr	d12, [sp], #0x90
    1170:      	ret
    1174:      	mov	x8, xzr
    1178:      	mov	x9, x8
    117c:      	add	x8, x8, #0x2
    1180:      	cmp	x8, #0x200
    1184:      	strh	wzr, [x19, x9]
    1188:      	b.ne	0x1178 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1178>
    118c:      	add	x9, sp, #0x1, lsl #12   // =0x1000
    1190:      	mov	x8, xzr
    1194:      	add	x9, x9, #0x460
    1198:      	mov	x10, x8
    119c:      	add	x8, x8, #0x2
    11a0:      	cmp	x8, #0x200
    11a4:      	strh	wzr, [x9, x10]
    11a8:      	b.ne	0x1198 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1198>
    11ac:      	mov	x8, xzr
    11b0:      	add	x9, sp, #0x860
    11b4:      	mov	x10, x8
    11b8:      	add	x8, x8, #0x2
    11bc:      	cmp	x8, #0x200
    11c0:      	strh	wzr, [x9, x10]
    11c4:      	b.ne	0x11b4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x11b4>
    11c8:      	add	x9, sp, #0x1, lsl #12   // =0x1000
    11cc:      	mov	x8, xzr
    11d0:      	add	x9, x9, #0x260
    11d4:      	mov	x10, x8
    11d8:      	add	x8, x8, #0x2
    11dc:      	cmp	x8, #0x200
    11e0:      	strh	wzr, [x9, x10]
    11e4:      	b.ne	0x11d4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x11d4>
    11e8:      	b	0x11ec <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x11ec>
    11ec:      	mov	x8, xzr
    11f0:      	add	x9, sp, #0xa60
    11f4:      	mov	x10, x8
    11f8:      	add	x8, x8, #0x2
    11fc:      	cmp	x8, #0x200
    1200:      	strh	wzr, [x9, x10]
    1204:      	b.ne	0x11f4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x11f4>
    1208:      	b	0x12b0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12b0>
    120c:      	b	0x12b0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12b0>
    1210:      	mov	x19, x0
    1214:      	add	x0, sp, #0xa60
    1218:      	str	x20, [sp, #0xa70]
    121c:      	bl	0x121c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x121c>
    1220:      	mov	x0, x19
    1224:      	bl	0x1224 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1224>
    1228:      	add	x9, sp, #0x1, lsl #12   // =0x1000
    122c:      	mov	x8, xzr
    1230:      	add	x9, x9, #0x860
    1234:      	mov	x10, x8
    1238:      	add	x8, x8, #0x2
    123c:      	cmp	x8, #0x200
    1240:      	strh	wzr, [x9, x10]
    1244:      	b.ne	0x1234 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1234>
    1248:      	add	x9, sp, #0x1, lsl #12   // =0x1000
    124c:      	mov	x8, xzr
    1250:      	add	x9, x9, #0x660
    1254:      	mov	x10, x8
    1258:      	add	x8, x8, #0x2
    125c:      	cmp	x8, #0x200
    1260:      	strh	wzr, [x9, x10]
    1264:      	b.ne	0x1254 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1254>
    1268:      	b	0x126c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x126c>
    126c:      	add	x9, sp, #0x1, lsl #12   // =0x1000
    1270:      	mov	x8, xzr
    1274:      	add	x9, x9, #0x460
    1278:      	mov	x10, x8
    127c:      	add	x8, x8, #0x2
    1280:      	cmp	x8, #0x200
    1284:      	strh	wzr, [x9, x10]
    1288:      	b.ne	0x1278 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1278>
    128c:      	b	0x12b0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12b0>
    1290:      	b	0x12b0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12b0>
    1294:      	mov	x8, xzr
    1298:      	add	x9, sp, #0xa60
    129c:      	mov	x10, x8
    12a0:      	add	x8, x8, #0x2
    12a4:      	cmp	x8, #0x200
    12a8:      	strh	wzr, [x9, x10]
    12ac:      	b.ne	0x129c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x129c>
    12b0:      	mov	x8, xzr
    12b4:      	add	x9, sp, #0x60
    12b8:      	mov	x10, x8
    12bc:      	add	x8, x8, #0x2
    12c0:      	cmp	x8, #0x200
    12c4:      	strh	wzr, [x9, x10]
    12c8:      	b.ne	0x12b8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12b8>
    12cc:      	add	x9, sp, #0x60
    12d0:      	mov	x8, xzr
    12d4:      	add	x9, x9, #0x200
    12d8:      	mov	x10, x8
    12dc:      	add	x8, x8, #0x2
    12e0:      	cmp	x8, #0x200
    12e4:      	strh	wzr, [x9, x10]
    12e8:      	b.ne	0x12d8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12d8>
    12ec:      	add	x9, sp, #0x60
    12f0:      	mov	x8, xzr
    12f4:      	add	x9, x9, #0x400
    12f8:      	mov	x10, x8
    12fc:      	add	x8, x8, #0x2
    1300:      	cmp	x8, #0x200
    1304:      	strh	wzr, [x9, x10]
    1308:      	b.ne	0x12f8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12f8>
    130c:      	bl	0x130c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x130c>

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
       0:      	stp	d15, d14, [sp, #-0xa0]!
       4:      	stp	d13, d12, [sp, #0x10]
       8:      	stp	d11, d10, [sp, #0x20]
       c:      	stp	d9, d8, [sp, #0x30]
      10:      	stp	x29, x30, [sp, #0x40]
      14:      	stp	x28, x27, [sp, #0x50]
      18:      	stp	x26, x25, [sp, #0x60]
      1c:      	stp	x24, x23, [sp, #0x70]
      20:      	stp	x22, x21, [sp, #0x80]
      24:      	stp	x20, x19, [sp, #0x90]
      28:      	add	x29, sp, #0x40
      2c:      	sub	sp, sp, #0xce0
      30:      	mov	x23, x0
      34:      	cmp	x2, #0x440
      38:      	str	xzr, [sp]
      3c:      	b.ne	0xc20 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xc20>
      40:      	str	x8, [sp, #0x8]
      44:      	mov	w27, #0xd01             // =3329
      48:      	mov	w8, #0xafb8             // =44984
      4c:      	movi	v0.2d, #0000000000000000
      50:      	movk	w8, #0x13, lsl #16
      54:      	dup	v8.4h, w27
      58:      	dup	v1.8h, w27
      5c:      	dup	v2.4s, w8
      60:      	mov	w28, #0xbb41            // =47937
      64:      	mov	w20, #0x7681            // =30337
      68:      	mov	x10, xzr
      6c:      	mov	x22, xzr
      70:      	add	x25, sp, #0x670
      74:      	add	x26, sp, #0x890
      78:      	movk	w28, #0x9d7d, lsl #16
      7c:      	movk	w20, #0x3afb, lsl #16
      80:      	mov	w24, #0xf2ff            // =62207
      84:      	add	x21, sp, #0x470
      88:      	add	x19, sp, #0x50
      8c:      	str	x1, [sp, #0x40]
      90:      	stp	q2, q1, [sp, #0x10]
      94:      	stp	q0, q0, [sp, #0x50]
      98:      	stp	q0, q0, [sp, #0x70]
      9c:      	stp	q0, q0, [sp, #0x90]
      a0:      	stp	q0, q0, [sp, #0xb0]
      a4:      	stp	q0, q0, [sp, #0xd0]
      a8:      	stp	q0, q0, [sp, #0xf0]
      ac:      	stp	q0, q0, [sp, #0x110]
      b0:      	stp	q0, q0, [sp, #0x130]
      b4:      	stp	q0, q0, [sp, #0x150]
      b8:      	stp	q0, q0, [sp, #0x170]
      bc:      	stp	q0, q0, [sp, #0x190]
      c0:      	stp	q0, q0, [sp, #0x1b0]
      c4:      	stp	q0, q0, [sp, #0x1d0]
      c8:      	stp	q0, q0, [sp, #0x1f0]
      cc:      	stp	q0, q0, [sp, #0x210]
      d0:      	stp	q0, q0, [sp, #0x230]
      d4:      	str	x23, [sp, #0x38]
      d8:      	ldr	x9, [sp, #0x40]
      dc:      	mov	w11, #0x140             // =320
      e0:      	movi	v0.2d, #0000000000000000
      e4:      	madd	x9, x10, x11, x9
      e8:      	add	x10, x10, #0x1
      ec:      	mov	x8, xzr
      f0:      	add	x23, x23, x22
      f4:      	add	x22, x22, #0x200
      f8:      	str	x10, [sp, #0x48]
      fc:      	add	x10, sp, #0x890
     100:      	str	q0, [sp, #0xa80]
     104:      	str	q0, [sp, #0xa70]
     108:      	str	q0, [sp, #0xa60]
     10c:      	str	q0, [sp, #0xa50]
     110:      	str	q0, [sp, #0xa40]
     114:      	str	q0, [sp, #0xa30]
     118:      	str	q0, [sp, #0xa20]
     11c:      	str	q0, [sp, #0xa10]
     120:      	str	q0, [sp, #0xa00]
     124:      	str	q0, [sp, #0x9f0]
     128:      	str	q0, [sp, #0x9e0]
     12c:      	str	q0, [sp, #0x9d0]
     130:      	str	q0, [sp, #0x9c0]
     134:      	str	q0, [sp, #0x9b0]
     138:      	str	q0, [sp, #0x9a0]
     13c:      	str	q0, [sp, #0x990]
     140:      	str	q0, [sp, #0x980]
     144:      	str	q0, [sp, #0x970]
     148:      	str	q0, [sp, #0x960]
     14c:      	str	q0, [sp, #0x950]
     150:      	str	q0, [sp, #0x940]
     154:      	str	q0, [sp, #0x930]
     158:      	str	q0, [sp, #0x920]
     15c:      	str	q0, [sp, #0x910]
     160:      	str	q0, [sp, #0x900]
     164:      	str	q0, [sp, #0x8f0]
     168:      	str	q0, [sp, #0x8e0]
     16c:      	str	q0, [sp, #0x8d0]
     170:      	str	q0, [sp, #0x8c0]
     174:      	str	q0, [sp, #0x8b0]
     178:      	str	q0, [sp, #0x8a0]
     17c:      	str	q0, [sp, #0x890]
     180:      	lsr	x12, x8, #3
     184:      	add	x15, x8, #0x2
     188:      	and	w13, w8, #0x6
     18c:      	add	x16, x8, #0x3
     190:      	lsr	x17, x15, #3
     194:      	and	x11, x8, #0x6
     198:      	ldrb	w12, [x9, x12]
     19c:      	add	x18, x8, #0x4
     1a0:      	orr	w13, w13, #0x1
     1a4:      	lsr	x0, x16, #3
     1a8:      	ldrb	w17, [x9, x17]
     1ac:      	lsr	x2, x18, #3
     1b0:      	lsr	w1, w12, w11
     1b4:      	lsr	w12, w12, w13
     1b8:      	ldrh	w14, [x10]
     1bc:      	and	x15, x15, #0x6
     1c0:      	ldrb	w0, [x9, x0]
     1c4:      	and	x13, x16, #0x7
     1c8:      	lsr	w15, w17, w15
     1cc:      	and	w16, w1, #0x1
     1d0:      	ubfiz	w12, w12, #1, #1
     1d4:      	ldrb	w17, [x9, x2]
     1d8:      	lsr	w13, w0, w13
     1dc:      	orr	w14, w14, w16
     1e0:      	and	x16, x18, #0x6
     1e4:      	add	x18, x8, #0x5
     1e8:      	add	x0, x8, #0x6
     1ec:      	orr	w12, w14, w12
     1f0:      	lsr	x14, x18, #3
     1f4:      	lsr	w16, w17, w16
     1f8:      	lsr	x17, x0, #3
     1fc:      	add	x1, x8, #0x7
     200:      	add	x3, x8, #0x8
     204:      	lsr	x2, x1, #3
     208:      	add	x4, x8, #0x9
     20c:      	ldrb	w14, [x9, x14]
     210:      	ldrb	w17, [x9, x17]
     214:      	lsr	x3, x3, #3
     218:      	lsr	x5, x4, #3
     21c:      	and	x18, x18, #0x7
     220:      	and	x0, x0, #0x6
     224:      	ldrb	w2, [x9, x2]
     228:      	and	x1, x1, #0x7
     22c:      	ldrb	w3, [x9, x3]
     230:      	lsr	w14, w14, w18
     234:      	lsr	w17, w17, w0
     238:      	ldrb	w0, [x9, x5]
     23c:      	lsr	w18, w2, w1
     240:      	ubfiz	w15, w15, #2, #1
     244:      	and	x1, x4, #0x7
     248:      	lsr	w11, w3, w11
     24c:      	ubfiz	w13, w13, #3, #1
     250:      	ubfiz	w16, w16, #4, #1
     254:      	lsr	w0, w0, w1
     258:      	ubfiz	w14, w14, #5, #1
     25c:      	ubfiz	w17, w17, #6, #1
     260:      	orr	w12, w12, w15
     264:      	ubfiz	w15, w18, #7, #1
     268:      	orr	w13, w13, w16
     26c:      	ubfiz	w11, w11, #8, #1
     270:      	orr	w14, w14, w17
     274:      	ubfiz	w16, w0, #9, #1
     278:      	orr	w12, w12, w13
     27c:      	orr	w13, w14, w15
     280:      	add	x8, x8, #0xa
     284:      	orr	w12, w12, w13
     288:      	orr	w11, w16, w11
     28c:      	cmp	x8, #0xa00
     290:      	orr	w11, w11, w12
     294:      	strh	w11, [x10], #0x2
     298:      	b.ne	0x180 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x180>
     29c:      	add	x0, sp, #0x670
     2a0:      	add	x1, sp, #0x890
     2a4:      	mov	w2, #0x200              // =512
     2a8:      	bl	0x2a8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x2a8>
     2ac:      	ldr	q4, [sp, #0x20]
     2b0:      	mov	x8, xzr
     2b4:      	add	x9, x25, x8
     2b8:      	add	x8, x8, #0x20
     2bc:      	ldp	q0, q1, [x9]
     2c0:      	cmp	x8, #0x200
     2c4:      	umull	v2.4s, v0.4h, v4.4h
     2c8:      	umull	v3.4s, v1.4h, v4.4h
     2cc:      	umull2	v0.4s, v0.8h, v4.8h
     2d0:      	umull2	v1.4s, v1.8h, v4.8h
     2d4:      	rshrn	v2.4h, v2.4s, #0xa
     2d8:      	rshrn	v3.4h, v3.4s, #0xa
     2dc:      	rshrn2	v2.8h, v0.4s, #0xa
     2e0:      	rshrn2	v3.8h, v1.4s, #0xa
     2e4:      	stp	q2, q3, [x9]
     2e8:      	b.ne	0x2b4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x2b4>
     2ec:      	add	x0, sp, #0x890
     2f0:      	add	x1, sp, #0x670
     2f4:      	mov	w2, #0x200              // =512
     2f8:      	bl	0x2f8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x2f8>
     2fc:      	add	x8, sp, #0x670
     300:      	add	x0, sp, #0x890
     304:      	bl	0x304 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x304>
     308:      	movi	v0.2d, #0000000000000000
     30c:      	mov	x8, xzr
     310:      	str	q0, [sp, #0xa80]
     314:      	str	q0, [sp, #0xa70]
     318:      	str	q0, [sp, #0xa60]
     31c:      	str	q0, [sp, #0xa50]
     320:      	str	q0, [sp, #0xa40]
     324:      	str	q0, [sp, #0xa30]
     328:      	str	q0, [sp, #0xa20]
     32c:      	str	q0, [sp, #0xa10]
     330:      	str	q0, [sp, #0xa00]
     334:      	str	q0, [sp, #0x9f0]
     338:      	str	q0, [sp, #0x9e0]
     33c:      	str	q0, [sp, #0x9d0]
     340:      	str	q0, [sp, #0x9c0]
     344:      	str	q0, [sp, #0x9b0]
     348:      	str	q0, [sp, #0x9a0]
     34c:      	str	q0, [sp, #0x990]
     350:      	str	q0, [sp, #0x980]
     354:      	str	q0, [sp, #0x970]
     358:      	str	q0, [sp, #0x960]
     35c:      	str	q0, [sp, #0x950]
     360:      	str	q0, [sp, #0x940]
     364:      	str	q0, [sp, #0x930]
     368:      	str	q0, [sp, #0x920]
     36c:      	str	q0, [sp, #0x910]
     370:      	str	q0, [sp, #0x900]
     374:      	str	q0, [sp, #0x8f0]
     378:      	str	q0, [sp, #0x8e0]
     37c:      	str	q0, [sp, #0x8d0]
     380:      	str	q0, [sp, #0x8c0]
     384:      	str	q0, [sp, #0x8b0]
     388:      	str	q0, [sp, #0x8a0]
     38c:      	str	q0, [sp, #0x890]
     390:      	b	0x470 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x470>
     394:      	mov	w10, #0x2               // =2
     398:      	bfi	x10, x8, #2, #62
     39c:      	ldrh	w12, [x23, x10]
     3a0:      	ldrh	w13, [x25, x10]
     3a4:      	mul	w14, w13, w12
     3a8:      	umull	x11, w14, w20
     3ac:      	lsr	x11, x11, #32
     3b0:      	sub	w15, w14, w11
     3b4:      	add	w15, w11, w15, lsr #1
     3b8:      	lsl	x11, x8, #2
     3bc:      	add	x8, x8, #0x1
     3c0:      	lsr	w15, w15, #11
     3c4:      	ldrh	w16, [x23, x11]
     3c8:      	ldrh	w17, [x25, x11]
     3cc:      	msub	w14, w15, w27, w14
     3d0:      	mul	w15, w17, w16
     3d4:      	mul	w13, w13, w16
     3d8:      	mul	w9, w14, w9
     3dc:      	mul	w12, w12, w17
     3e0:      	umull	x14, w15, w20
     3e4:      	umull	x16, w9, w20
     3e8:      	umull	x17, w13, w20
     3ec:      	umull	x18, w12, w20
     3f0:      	lsr	x14, x14, #32
     3f4:      	lsr	x16, x16, #32
     3f8:      	lsr	x17, x17, #32
     3fc:      	sub	w0, w15, w14
     400:      	lsr	x18, x18, #32
     404:      	add	w14, w14, w0, lsr #1
     408:      	sub	w0, w9, w16
     40c:      	add	w16, w16, w0, lsr #1
     410:      	sub	w0, w13, w17
     414:      	add	w17, w17, w0, lsr #1
     418:      	sub	w0, w12, w18
     41c:      	lsr	w14, w14, #11
     420:      	add	w18, w18, w0, lsr #1
     424:      	lsr	w16, w16, #11
     428:      	lsr	w17, w17, #11
     42c:      	msub	w14, w14, w27, w15
     430:      	lsr	w15, w18, #11
     434:      	msub	w9, w16, w27, w9
     438:      	msub	w13, w17, w27, w13
     43c:      	msub	w12, w15, w27, w12
     440:      	add	w9, w9, w14
     444:      	add	w14, w9, w24
     448:      	cmp	w9, #0xd01
     44c:      	add	w12, w13, w12
     450:      	csel	w9, w9, w14, lo
     454:      	strh	w9, [x26, x11]
     458:      	add	w13, w12, w24
     45c:      	cmp	w12, #0xd01
     460:      	csel	w9, w12, w13, lo
     464:      	cmp	x8, #0x80
     468:      	strh	w9, [x26, x10]
     46c:      	b.eq	0x4c4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x4c4>
     470:      	orr	w9, w8, #0x80
     474:      	mov	w11, #0x11              // =17
     478:      	rbit	w9, w9
     47c:      	lsr	w10, w9, #24
     480:      	mov	w9, #0x1                // =1
     484:      	b	0x4a0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x4a0>
     488:      	mul	w11, w11, w11
     48c:      	lsr	w10, w10, #1
     490:      	umull	x12, w11, w28
     494:      	lsr	x12, x12, #43
     498:      	msub	w11, w12, w27, w11
     49c:      	cbz	w10, 0x394 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x394>
     4a0:      	tbz	w10, #0x0, 0x488 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x488>
     4a4:      	mul	w9, w9, w11
     4a8:      	umull	x12, w9, w20
     4ac:      	lsr	x12, x12, #32
     4b0:      	sub	w13, w9, w12
     4b4:      	add	w12, w12, w13, lsr #1
     4b8:      	lsr	w12, w12, #11
     4bc:      	msub	w9, w12, w27, w9
     4c0:      	b	0x488 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x488>
     4c4:      	add	x0, sp, #0x470
     4c8:      	add	x1, sp, #0x890
     4cc:      	mov	w2, #0x200              // =512
     4d0:      	bl	0x4d0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x4d0>
     4d4:      	ldr	q6, [sp, #0x10]
     4d8:      	mov	x8, xzr
     4dc:      	ldr	q0, [x19, x8]
     4e0:      	ldr	q1, [x21, x8]
     4e4:      	uaddl2	v2.4s, v1.8h, v0.8h
     4e8:      	uaddl	v0.4s, v1.4h, v0.4h
     4ec:      	umull2	v1.2d, v2.4s, v6.4s
     4f0:      	umull	v3.2d, v2.2s, v6.2s
     4f4:      	umull2	v4.2d, v0.4s, v6.4s
     4f8:      	umull	v5.2d, v0.2s, v6.2s
     4fc:      	uzp2	v1.4s, v3.4s, v1.4s
     500:      	uzp2	v3.4s, v5.4s, v4.4s
     504:      	xtn	v1.4h, v1.4s
     508:      	xtn	v3.4h, v3.4s
     50c:      	umlsl	v2.4s, v1.4h, v8.4h
     510:      	umlsl	v0.4s, v3.4h, v8.4h
     514:      	uzp1	v0.8h, v0.8h, v2.8h
     518:      	str	q0, [x26, x8]
     51c:      	add	x8, x8, #0x10
     520:      	cmp	x8, #0x200
     524:      	b.ne	0x4dc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x4dc>
     528:      	add	x0, sp, #0x270
     52c:      	add	x1, sp, #0x890
     530:      	mov	w2, #0x200              // =512
     534:      	bl	0x534 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x534>
     538:      	ldr	x23, [sp, #0x38]
     53c:      	mov	x8, xzr
     540:      	mov	x9, x8
     544:      	add	x8, x8, #0x2
     548:      	cmp	x8, #0x200
     54c:      	strh	wzr, [x19, x9]
     550:      	b.ne	0x540 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x540>
     554:      	add	x0, sp, #0x50
     558:      	add	x1, sp, #0x270
     55c:      	mov	w2, #0x200              // =512
     560:      	bl	0x560 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x560>
     564:      	mov	x8, xzr
     568:      	mov	x9, x8
     56c:      	add	x8, x8, #0x2
     570:      	cmp	x8, #0x200
     574:      	strh	wzr, [x21, x9]
     578:      	b.ne	0x568 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x568>
     57c:      	ldr	x10, [sp, #0x48]
     580:      	mov	x8, xzr
     584:      	mov	x9, x8
     588:      	add	x8, x8, #0x2
     58c:      	cmp	x8, #0x200
     590:      	strh	wzr, [x25, x9]
     594:      	b.ne	0x584 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x584>
     598:      	cmp	x22, #0x600
     59c:      	b.ne	0xd8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xd8>
     5a0:      	movi	v4.2d, #0000000000000000
     5a4:      	movi	d0, #0x0000ff000000ff
     5a8:      	mov	w9, #0x2                // =2
     5ac:      	movi	v1.2s, #0x4
     5b0:      	adrp	x10, 0x0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>
     5b4:      	dup	v2.2d, x9
     5b8:      	ldr	q3, [x10]
     5bc:      	ldr	x22, [sp, #0x40]
     5c0:      	mov	x8, xzr
     5c4:      	mov	w9, #0x3c0              // =960
     5c8:      	add	x10, sp, #0x890
     5cc:      	stp	q4, q4, [sp, #0x250]
     5d0:      	str	q4, [sp, #0xa80]
     5d4:      	str	q4, [sp, #0xa70]
     5d8:      	str	q4, [sp, #0xa60]
     5dc:      	str	q4, [sp, #0xa50]
     5e0:      	str	q4, [sp, #0xa40]
     5e4:      	str	q4, [sp, #0xa30]
     5e8:      	str	q4, [sp, #0xa20]
     5ec:      	str	q4, [sp, #0xa10]
     5f0:      	str	q4, [sp, #0xa00]
     5f4:      	str	q4, [sp, #0x9f0]
     5f8:      	str	q4, [sp, #0x9e0]
     5fc:      	str	q4, [sp, #0x9d0]
     600:      	str	q4, [sp, #0x9c0]
     604:      	str	q4, [sp, #0x9b0]
     608:      	str	q4, [sp, #0x9a0]
     60c:      	str	q4, [sp, #0x990]
     610:      	str	q4, [sp, #0x980]
     614:      	str	q4, [sp, #0x970]
     618:      	str	q4, [sp, #0x960]
     61c:      	str	q4, [sp, #0x950]
     620:      	str	q4, [sp, #0x940]
     624:      	str	q4, [sp, #0x930]
     628:      	str	q4, [sp, #0x920]
     62c:      	str	q4, [sp, #0x910]
     630:      	str	q4, [sp, #0x900]
     634:      	str	q4, [sp, #0x8f0]
     638:      	str	q4, [sp, #0x8e0]
     63c:      	str	q4, [sp, #0x8d0]
     640:      	str	q4, [sp, #0x8c0]
     644:      	str	q4, [sp, #0x8b0]
     648:      	str	q4, [sp, #0x8a0]
     64c:      	str	q4, [sp, #0x890]
     650:      	xtn	v4.2s, v3.2d
     654:      	ldrb	w11, [x22, x9]
     658:      	add	v3.2d, v3.2d, v2.2d
     65c:      	add	x9, x9, #0x1
     660:      	dup	v5.2s, w11
     664:      	add	x11, x10, x8
     668:      	add	x8, x8, #0x4
     66c:      	cmp	x8, #0x200
     670:      	shl	v4.2s, v4.2s, #0x2
     674:      	and	v5.8b, v5.8b, v0.8b
     678:      	and	v4.8b, v4.8b, v1.8b
     67c:      	fmov	d6, d4
     680:      	fmov	d7, d4
     684:      	neg	v16.2s, v4.2s
     688:      	orr	v4.2s, #0x3
     68c:      	ushl	v16.2s, v5.2s, v16.2s
     690:      	orr	v6.2s, #0x1
     694:      	orr	v7.2s, #0x2
     698:      	neg	v4.2s, v4.2s
     69c:      	bic	v16.2s, #0xfe
     6a0:      	neg	v6.2s, v6.2s
     6a4:      	neg	v7.2s, v7.2s
     6a8:      	ushl	v4.2s, v5.2s, v4.2s
     6ac:      	ushl	v6.2s, v5.2s, v6.2s
     6b0:      	ushl	v7.2s, v5.2s, v7.2s
     6b4:      	ldr	s5, [x11]
     6b8:      	shl	v4.2s, v4.2s, #0x3
     6bc:      	ushll	v5.4s, v5.4h, #0x0
     6c0:      	add	v6.2s, v6.2s, v6.2s
     6c4:      	shl	v7.2s, v7.2s, #0x2
     6c8:      	bic	v4.2s, #0xf0
     6cc:      	orr	v5.8b, v5.8b, v16.8b
     6d0:      	bic	v6.2s, #0xfc
     6d4:      	bic	v7.2s, #0xf8
     6d8:      	orr	v5.8b, v5.8b, v6.8b
     6dc:      	orr	v4.8b, v7.8b, v4.8b
     6e0:      	orr	v4.8b, v5.8b, v4.8b
     6e4:      	mov	s5, v4.s[1]
     6e8:      	str	h4, [x11]
     6ec:      	str	h5, [x11, #0x2]
     6f0:      	b.ne	0x650 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x650>
     6f4:      	add	x0, sp, #0x670
     6f8:      	add	x1, sp, #0x890
     6fc:      	mov	w2, #0x200              // =512
     700:      	add	x19, sp, #0x670
     704:      	bl	0x704 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x704>
     708:      	mov	w8, #0xd01              // =3329
     70c:      	dup	v0.8h, w8
     710:      	mov	x8, xzr
     714:      	add	x9, x19, x8
     718:      	add	x8, x8, #0x20
     71c:      	ldp	q1, q2, [x9]
     720:      	cmp	x8, #0x200
     724:      	umull	v3.4s, v1.4h, v0.4h
     728:      	umull	v4.4s, v2.4h, v0.4h
     72c:      	umull2	v1.4s, v1.8h, v0.8h
     730:      	umull2	v2.4s, v2.8h, v0.8h
     734:      	rshrn	v3.4h, v3.4s, #0x4
     738:      	rshrn	v4.4h, v4.4s, #0x4
     73c:      	rshrn2	v3.8h, v1.4s, #0x4
     740:      	rshrn2	v4.8h, v2.4s, #0x4
     744:      	stp	q3, q4, [x9]
     748:      	b.ne	0x714 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x714>
     74c:      	add	x0, sp, #0x470
     750:      	add	x1, sp, #0x670
     754:      	mov	w2, #0x200              // =512
     758:      	add	x19, sp, #0x470
     75c:      	bl	0x75c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x75c>
     760:      	add	x0, sp, #0x890
     764:      	add	x1, sp, #0x50
     768:      	mov	w2, #0x200              // =512
     76c:      	add	x20, sp, #0x890
     770:      	bl	0x770 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x770>
     774:      	add	x8, sp, #0x670
     778:      	add	x0, sp, #0x890
     77c:      	add	x21, sp, #0x670
     780:      	bl	0x780 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x780>
     784:      	mov	w9, #0xafb8             // =44984
     788:      	mov	x8, xzr
     78c:      	mov	w10, #0xd01             // =3329
     790:      	movk	w9, #0x13, lsl #16
     794:      	ldrh	w11, [x19, x8]
     798:      	ldrh	w12, [x21, x8]
     79c:      	add	w11, w11, #0xd01
     7a0:      	subs	w11, w11, w12
     7a4:      	b.lo	0xcdc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xcdc>
     7a8:      	umull	x12, w11, w9
     7ac:      	lsr	x12, x12, #32
     7b0:      	msub	w11, w12, w10, w11
     7b4:      	strh	w11, [x20, x8]
     7b8:      	add	x8, x8, #0x2
     7bc:      	cmp	x8, #0x200
     7c0:      	b.ne	0x794 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x794>
     7c4:      	add	x0, sp, #0x270
     7c8:      	add	x1, sp, #0x890
     7cc:      	mov	w2, #0x200              // =512
     7d0:      	add	x19, sp, #0x270
     7d4:      	bl	0x7d4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x7d4>
     7d8:      	mov	w9, #0xafb8             // =44984
     7dc:      	mov	w8, #0x680              // =1664
     7e0:      	movk	w9, #0x13, lsl #16
     7e4:      	dup	v0.4s, w8
     7e8:      	mov	x8, xzr
     7ec:      	dup	v1.4s, w9
     7f0:      	ldr	q2, [x19, x8]
     7f4:      	ushll2	v3.4s, v2.8h, #0x1
     7f8:      	ushll	v2.4s, v2.4h, #0x1
     7fc:      	add	v3.4s, v3.4s, v0.4s
     800:      	add	v2.4s, v2.4s, v0.4s
     804:      	umull2	v4.2d, v3.4s, v1.4s
     808:      	umull	v3.2d, v3.2s, v1.2s
     80c:      	umull2	v5.2d, v2.4s, v1.4s
     810:      	umull	v2.2d, v2.2s, v1.2s
     814:      	uzp2	v3.4s, v3.4s, v4.4s
     818:      	uzp2	v2.4s, v2.4s, v5.4s
     81c:      	uzp1	v2.8h, v2.8h, v3.8h
     820:      	bic	v2.8h, #0x7e
     824:      	str	q2, [x19, x8]
     828:      	add	x8, x8, #0x10
     82c:      	cmp	x8, #0x200
     830:      	b.ne	0x7f0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x7f0>
     834:      	add	x0, sp, #0x890
     838:      	add	x1, sp, #0x270
     83c:      	mov	w2, #0x200              // =512
     840:      	add	x19, sp, #0x890
     844:      	bl	0x844 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x844>
     848:      	add	x0, sp, #0x890
     84c:      	add	x2, sp, #0x250
     850:      	mov	w1, #0x1                // =1
     854:      	mov	w3, #0x20               // =32
     858:      	bl	0x858 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x858>
     85c:      	mov	x8, xzr
     860:      	mov	x9, x8
     864:      	add	x8, x8, #0x2
     868:      	cmp	x8, #0x200
     86c:      	strh	wzr, [x19, x9]
     870:      	b.ne	0x860 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x860>
     874:      	mov	x8, xzr
     878:      	add	x9, sp, #0x670
     87c:      	mov	x10, x8
     880:      	add	x8, x8, #0x2
     884:      	cmp	x8, #0x200
     888:      	strh	wzr, [x9, x10]
     88c:      	b.ne	0x87c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x87c>
     890:      	mov	x8, xzr
     894:      	add	x9, sp, #0x470
     898:      	mov	x10, x8
     89c:      	add	x8, x8, #0x2
     8a0:      	cmp	x8, #0x200
     8a4:      	strh	wzr, [x9, x10]
     8a8:      	b.ne	0x898 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x898>
     8ac:      	add	x8, sp, #0x250
     8b0:      	mov	w9, #0x20               // =32
     8b4:      	str	x8, [sp, #0x470]
     8b8:      	add	x8, x23, #0xaa0
     8bc:      	str	x9, [sp, #0x478]
     8c0:      	str	x8, [sp, #0x480]
     8c4:      	str	x9, [sp, #0x488]
     8c8:      	add	x8, sp, #0x890
     8cc:      	add	x0, sp, #0x470
     8d0:      	mov	w1, #0x2                // =2
     8d4:      	bl	0x8d4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x8d4>
     8d8:      	ldr	q0, [sp, #0x890]
     8dc:      	ldr	q1, [sp, #0x8a0]
     8e0:      	mov	w8, #0x20               // =32
     8e4:      	ldr	q2, [sp, #0x8c0]
     8e8:      	add	x19, x23, #0xac0
     8ec:      	str	x8, [sp, #0x898]
     8f0:      	str	q0, [sp, #0x670]
     8f4:      	ldr	q0, [sp, #0x8b0]
     8f8:      	mov	w8, #0x440              // =1088
     8fc:      	str	q1, [sp, #0x680]
     900:      	str	q0, [sp, #0x690]
     904:      	str	q2, [sp, #0x6a0]
     908:      	str	x19, [sp, #0x890]
     90c:      	str	x22, [sp, #0x8a0]
     910:      	str	x8, [sp, #0x8a8]
     914:      	add	x8, sp, #0x470
     918:      	add	x0, sp, #0x890
     91c:      	mov	w1, #0x2                // =2
     920:      	bl	0x920 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x920>
     924:      	ldr	q0, [sp, #0x470]
     928:      	ldr	q1, [sp, #0x480]
     92c:      	add	x20, sp, #0x670
     930:      	str	q0, [sp, #0x880]
     934:      	str	q1, [sp, #0x870]
     938:      	add	x8, sp, #0x890
     93c:      	add	x0, x23, #0x600
     940:      	add	x1, sp, #0x250
     944:      	add	x2, x20, #0x20
     948:      	add	x21, sp, #0x890
     94c:      	bl	0x94c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x94c>
     950:      	add	x0, x22, #0x440
     954:      	mov	x1, x22
     958:      	bl	0x958 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x958>
     95c:      	tbz	w0, #0x0, 0xcc0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xcc0>
     960:      	add	x0, x21, #0x440
     964:      	add	x1, sp, #0x890
     968:      	bl	0x968 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x968>
     96c:      	cbz	w0, 0xcc0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xcc0>
     970:      	movi	v0.2d, #0000000000000000
     974:      	movi	v2.2d, #0000000000000000
     978:      	add	x8, sp, #0x890
     97c:      	movi	v6.2d, #0000000000000000
     980:      	movi	v1.2d, #0000000000000000
     984:      	add	x8, x8, #0x10
     988:      	movi	v17.2d, #0000000000000000
     98c:      	movi	v4.2d, #0000000000000000
     990:      	add	x9, x22, #0x10
     994:      	movi	v5.2d, #0000000000000000
     998:      	movi	v3.2d, #0000000000000000
     99c:      	mov	w10, #0x440             // =1088
     9a0:      	movi	v21.2d, #0000000000000000
     9a4:      	movi	v16.2d, #0000000000000000
     9a8:      	movi	v7.2d, #0000000000000000
     9ac:      	movi	v22.2d, #0000000000000000
     9b0:      	movi	v19.2d, #0000000000000000
     9b4:      	movi	v20.2d, #0000000000000000
     9b8:      	movi	v18.2d, #0000000000000000
     9bc:      	movi	v23.2d, #0000000000000000
     9c0:      	ldp	q24, q27, [x8, #-0x10]
     9c4:      	subs	x10, x10, #0x20
     9c8:      	ldp	q25, q26, [x9, #-0x10]
     9cc:      	add	x8, x8, #0x20
     9d0:      	add	x9, x9, #0x20
     9d4:      	eor	v24.16b, v24.16b, v25.16b
     9d8:      	eor	v25.16b, v27.16b, v26.16b
     9dc:      	ushll	v26.8h, v24.8b, #0x0
     9e0:      	ushll2	v24.8h, v24.16b, #0x0
     9e4:      	ushll	v27.8h, v25.8b, #0x0
     9e8:      	ushll2	v25.8h, v25.16b, #0x0
     9ec:      	ushll	v28.4s, v26.4h, #0x0
     9f0:      	ushll2	v26.4s, v26.8h, #0x0
     9f4:      	ushll	v29.4s, v24.4h, #0x0
     9f8:      	ushll2	v24.4s, v24.8h, #0x0
     9fc:      	ushll	v30.4s, v27.4h, #0x0
     a00:      	ushll2	v27.4s, v27.8h, #0x0
     a04:      	ushll	v31.4s, v25.4h, #0x0
     a08:      	ushll2	v25.4s, v25.8h, #0x0
     a0c:      	ushll	v8.2d, v28.2s, #0x0
     a10:      	ushll2	v28.2d, v28.4s, #0x0
     a14:      	ushll	v9.2d, v26.2s, #0x0
     a18:      	ushll	v10.2d, v29.2s, #0x0
     a1c:      	ushll2	v11.2d, v24.4s, #0x0
     a20:      	ushll2	v26.2d, v26.4s, #0x0
     a24:      	ushll2	v29.2d, v29.4s, #0x0
     a28:      	ushll	v24.2d, v24.2s, #0x0
     a2c:      	ushll	v12.2d, v30.2s, #0x0
     a30:      	ushll2	v30.2d, v30.4s, #0x0
     a34:      	ushll	v13.2d, v27.2s, #0x0
     a38:      	ushll	v14.2d, v31.2s, #0x0
     a3c:      	ushll2	v15.2d, v25.4s, #0x0
     a40:      	ushll2	v27.2d, v27.4s, #0x0
     a44:      	ushll2	v31.2d, v31.4s, #0x0
     a48:      	ushll	v25.2d, v25.2s, #0x0
     a4c:      	orr	v3.16b, v3.16b, v24.16b
     a50:      	orr	v5.16b, v5.16b, v29.16b
     a54:      	orr	v17.16b, v17.16b, v26.16b
     a58:      	orr	v21.16b, v21.16b, v11.16b
     a5c:      	orr	v4.16b, v4.16b, v10.16b
     a60:      	orr	v1.16b, v1.16b, v9.16b
     a64:      	orr	v6.16b, v6.16b, v28.16b
     a68:      	orr	v2.16b, v2.16b, v8.16b
     a6c:      	orr	v18.16b, v18.16b, v25.16b
     a70:      	orr	v20.16b, v20.16b, v31.16b
     a74:      	orr	v22.16b, v22.16b, v27.16b
     a78:      	orr	v23.16b, v23.16b, v15.16b
     a7c:      	orr	v19.16b, v19.16b, v14.16b
     a80:      	orr	v7.16b, v7.16b, v13.16b
     a84:      	orr	v0.16b, v0.16b, v30.16b
     a88:      	orr	v16.16b, v16.16b, v12.16b
     a8c:      	b.ne	0x9c0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x9c0>
     a90:      	orr	v17.16b, v22.16b, v17.16b
     a94:      	orr	v21.16b, v23.16b, v21.16b
     a98:      	mov	x8, xzr
     a9c:      	orr	v0.16b, v0.16b, v6.16b
     aa0:      	orr	v2.16b, v16.16b, v2.16b
     aa4:      	add	x10, sp, #0x890
     aa8:      	orr	v4.16b, v19.16b, v4.16b
     aac:      	orr	v5.16b, v20.16b, v5.16b
     ab0:      	orr	v1.16b, v7.16b, v1.16b
     ab4:      	orr	v3.16b, v18.16b, v3.16b
     ab8:      	orr	v2.16b, v2.16b, v4.16b
     abc:      	orr	v0.16b, v0.16b, v5.16b
     ac0:      	orr	v1.16b, v1.16b, v3.16b
     ac4:      	orr	v3.16b, v17.16b, v21.16b
     ac8:      	orr	v1.16b, v2.16b, v1.16b
     acc:      	orr	v0.16b, v0.16b, v3.16b
     ad0:      	orr	v0.16b, v1.16b, v0.16b
     ad4:      	ext	v1.16b, v0.16b, v0.16b, #0x8
     ad8:      	orr	v0.8b, v0.8b, v1.8b
     adc:      	fmov	x9, d0
     ae0:      	mov	x11, x8
     ae4:      	add	x8, x8, #0x1
     ae8:      	cmp	x8, #0x440
     aec:      	strb	wzr, [x10, x11]
     af0:      	b.ne	0xae0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xae0>
     af4:      	cmp	x9, #0x0
     af8:      	ldr	q2, [sp, #0x880]
     afc:      	ldr	q3, [sp, #0x670]
     b00:      	cset	w9, gt
     b04:      	ldr	q4, [sp, #0x680]
     b08:      	ldr	q5, [sp, #0x870]
     b0c:      	neg	w10, w9
     b10:      	str	xzr, [sp, #0x898]
     b14:      	sub	w9, w9, #0x1
     b18:      	dup	v0.16b, w10
     b1c:      	str	xzr, [sp, #0x890]
     b20:      	dup	v1.16b, w9
     b24:      	ldr	x9, [sp, #0x8]
     b28:      	mov	x8, xzr
     b2c:      	and	v2.16b, v2.16b, v0.16b
     b30:      	and	v0.16b, v5.16b, v0.16b
     b34:      	strb	wzr, [x9]
     b38:      	and	v3.16b, v1.16b, v3.16b
     b3c:      	and	v1.16b, v1.16b, v4.16b
     b40:      	orr	v2.16b, v2.16b, v3.16b
     b44:      	orr	v0.16b, v0.16b, v1.16b
     b48:      	stur	q2, [x9, #0x1]
     b4c:      	stur	q0, [x9, #0x11]
     b50:      	ldr	q0, [sp, #0x890]
     b54:      	str	q0, [sp, #0x880]
     b58:      	str	xzr, [sp, #0x898]
     b5c:      	str	xzr, [sp, #0x890]
     b60:      	ldr	q0, [sp, #0x890]
     b64:      	str	q0, [sp, #0x870]
     b68:      	str	xzr, [sp, #0x898]
     b6c:      	str	xzr, [sp, #0x890]
     b70:      	ldr	q0, [sp, #0x890]
     b74:      	str	q0, [sp, #0x670]
     b78:      	str	xzr, [sp, #0x898]
     b7c:      	str	xzr, [sp, #0x890]
     b80:      	ldr	q0, [sp, #0x890]
     b84:      	str	q0, [sp, #0x680]
     b88:      	str	xzr, [sp, #0x898]
     b8c:      	str	xzr, [sp, #0x890]
     b90:      	ldr	q0, [sp, #0x890]
     b94:      	stur	q0, [x20, #0x20]
     b98:      	str	xzr, [sp, #0x898]
     b9c:      	str	xzr, [sp, #0x890]
     ba0:      	ldr	q0, [sp, #0x890]
     ba4:      	str	q0, [sp, #0x6a0]
     ba8:      	str	xzr, [sp, #0x898]
     bac:      	str	xzr, [sp, #0x890]
     bb0:      	ldr	q0, [sp, #0x890]
     bb4:      	str	q0, [sp, #0x250]
     bb8:      	str	xzr, [sp, #0x898]
     bbc:      	str	xzr, [sp, #0x890]
     bc0:      	ldr	q0, [sp, #0x890]
     bc4:      	str	q0, [sp, #0x260]
     bc8:      	mov	x9, x8
     bcc:      	add	x8, x8, #0x2
     bd0:      	cmp	x8, #0x200
     bd4:      	strh	wzr, [x23, x9]
     bd8:      	b.ne	0xbc8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xbc8>
     bdc:      	mov	x8, xzr
     be0:      	add	x9, x23, #0x200
     be4:      	strh	wzr, [x9, x8]
     be8:      	add	x8, x8, #0x2
     bec:      	cmp	x8, #0x200
     bf0:      	b.ne	0xbe4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xbe4>
     bf4:      	mov	x8, xzr
     bf8:      	add	x9, x23, #0x400
     bfc:      	strh	wzr, [x9, x8]
     c00:      	add	x8, x8, #0x2
     c04:      	cmp	x8, #0x200
     c08:      	b.ne	0xbfc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xbfc>
     c0c:      	str	xzr, [sp, #0x898]
     c10:      	str	xzr, [sp, #0x890]
     c14:      	ldr	q0, [sp, #0x890]
     c18:      	str	q0, [x19]
     c1c:      	b	0xc80 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xc80>
     c20:      	mov	x10, xzr
     c24:      	mov	w9, #0x1                // =1
     c28:      	strh	w9, [x8]
     c2c:      	mov	x9, x10
     c30:      	add	x10, x10, #0x2
     c34:      	cmp	x10, #0x200
     c38:      	strh	wzr, [x23, x9]
     c3c:      	b.ne	0xc2c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xc2c>
     c40:      	mov	x8, xzr
     c44:      	add	x9, x23, #0x200
     c48:      	strh	wzr, [x9, x8]
     c4c:      	add	x8, x8, #0x2
     c50:      	cmp	x8, #0x200
     c54:      	b.ne	0xc48 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xc48>
     c58:      	mov	x8, xzr
     c5c:      	add	x9, x23, #0x400
     c60:      	strh	wzr, [x9, x8]
     c64:      	add	x8, x8, #0x2
     c68:      	cmp	x8, #0x200
     c6c:      	b.ne	0xc60 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xc60>
     c70:      	str	xzr, [sp, #0x898]
     c74:      	str	xzr, [sp, #0x890]
     c78:      	ldr	q0, [sp, #0x890]
     c7c:      	str	q0, [x23, #0xac0]
     c80:      	str	xzr, [sp, #0x898]
     c84:      	str	xzr, [sp, #0x890]
     c88:      	ldr	q0, [sp, #0x890]
     c8c:      	str	q0, [x23, #0xad0]
     c90:      	add	sp, sp, #0xce0
     c94:      	ldp	x20, x19, [sp, #0x90]
     c98:      	ldp	x22, x21, [sp, #0x80]
     c9c:      	ldp	x24, x23, [sp, #0x70]
     ca0:      	ldp	x26, x25, [sp, #0x60]
     ca4:      	ldp	x28, x27, [sp, #0x50]
     ca8:      	ldp	x29, x30, [sp, #0x40]
     cac:      	ldp	d9, d8, [sp, #0x30]
     cb0:      	ldp	d11, d10, [sp, #0x20]
     cb4:      	ldp	d13, d12, [sp, #0x10]
     cb8:      	ldp	d15, d14, [sp], #0xa0
     cbc:      	ret
     cc0:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>
     cc4:      	add	x0, x0, #0x0
     cc8:      	adrp	x3, 0x0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>
     ccc:      	add	x3, x3, #0x0
     cd0:      	mov	w1, #0x193              // =403
     cd4:      	mov	w2, wzr
     cd8:      	bl	0xcd8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xcd8>
     cdc:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>
     ce0:      	add	x0, x0, #0x0
     ce4:      	bl	0xce4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xce4>
     ce8:      	brk	#0x1
     cec:      	bl	0xcec <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xcec>
     cf0:      	bl	0xcf0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xcf0>
     cf4:      	str	xzr, [sp, #0x478]
     cf8:      	mov	x20, x0
     cfc:      	str	xzr, [sp, #0x470]
     d00:      	ldr	q0, [sp, #0x470]
     d04:      	str	q0, [sp, #0x880]
     d08:      	str	xzr, [sp, #0x478]
     d0c:      	str	xzr, [sp, #0x470]
     d10:      	ldr	q0, [sp, #0x470]
     d14:      	str	q0, [sp, #0x870]
     d18:      	b	0xd20 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xd20>
     d1c:      	mov	x20, x0
     d20:      	str	xzr, [sp, #0x278]
     d24:      	str	xzr, [sp, #0x270]
     d28:      	ldr	q0, [sp, #0x270]
     d2c:      	str	q0, [sp, #0x670]
     d30:      	str	xzr, [sp, #0x278]
     d34:      	str	xzr, [sp, #0x270]
     d38:      	ldr	q0, [sp, #0x270]
     d3c:      	str	q0, [sp, #0x680]
     d40:      	str	xzr, [sp, #0x278]
     d44:      	str	xzr, [sp, #0x270]
     d48:      	ldr	q0, [sp, #0x270]
     d4c:      	str	q0, [sp, #0x690]
     d50:      	str	xzr, [sp, #0x278]
     d54:      	str	xzr, [sp, #0x270]
     d58:      	ldr	q0, [sp, #0x270]
     d5c:      	str	q0, [sp, #0x6a0]
     d60:      	b	0xdd0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xdd0>
     d64:      	mov	x20, x0
     d68:      	b	0xdd0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xdd0>
     d6c:      	mov	x20, x0
     d70:      	mov	x8, xzr
     d74:      	mov	x9, x8
     d78:      	add	x8, x8, #0x2
     d7c:      	cmp	x8, #0x200
     d80:      	strh	wzr, [x19, x9]
     d84:      	b.ne	0xd74 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xd74>
     d88:      	b	0xd98 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xd98>
     d8c:      	mov	x20, x0
     d90:      	b	0xdb4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xdb4>
     d94:      	mov	x20, x0
     d98:      	mov	x8, xzr
     d9c:      	add	x9, sp, #0x670
     da0:      	mov	x10, x8
     da4:      	add	x8, x8, #0x2
     da8:      	cmp	x8, #0x200
     dac:      	strh	wzr, [x9, x10]
     db0:      	b.ne	0xda0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xda0>
     db4:      	mov	x8, xzr
     db8:      	add	x9, sp, #0x470
     dbc:      	mov	x10, x8
     dc0:      	add	x8, x8, #0x2
     dc4:      	cmp	x8, #0x200
     dc8:      	strh	wzr, [x9, x10]
     dcc:      	b.ne	0xdbc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xdbc>
     dd0:      	str	xzr, [sp, #0x278]
     dd4:      	str	xzr, [sp, #0x270]
     dd8:      	ldr	q0, [sp, #0x270]
     ddc:      	str	q0, [sp, #0x250]
     de0:      	str	xzr, [sp, #0x278]
     de4:      	str	xzr, [sp, #0x270]
     de8:      	ldr	q0, [sp, #0x270]
     dec:      	str	q0, [sp, #0x260]
     df0:      	b	0xe14 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xe14>
     df4:      	mov	x20, x0
     df8:      	mov	x8, xzr
     dfc:      	add	x9, sp, #0x50
     e00:      	mov	x10, x8
     e04:      	add	x8, x8, #0x2
     e08:      	cmp	x8, #0x200
     e0c:      	strh	wzr, [x9, x10]
     e10:      	b.ne	0xe00 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xe00>
     e14:      	ldr	x0, [sp, #0x38]
     e18:      	bl	0xe18 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xe18>
     e1c:      	mov	x0, x20
     e20:      	bl	0xe20 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xe20>
     e24:      	bl	0xe24 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xe24>

0000000000000000 <<toyos_crypto::mlkem::Poly>::ntt>:
       0:      	sub	sp, sp, #0x70
       4:      	stp	x29, x30, [sp, #0x10]
       8:      	stp	x28, x27, [sp, #0x20]
       c:      	stp	x26, x25, [sp, #0x30]
      10:      	stp	x24, x23, [sp, #0x40]
      14:      	stp	x22, x21, [sp, #0x50]
      18:      	stp	x20, x19, [sp, #0x60]
      1c:      	add	x29, sp, #0x10
      20:      	mov	w9, #0x7681             // =30337
      24:      	mov	w11, #0xafb8            // =44984
      28:      	mov	w10, #0xd01             // =3329
      2c:      	movk	w9, #0x3afb, lsl #16
      30:      	movk	w11, #0x13, lsl #16
      34:      	dup	v1.4s, w10
      38:      	dup	v0.4s, w9
      3c:      	dup	v2.4s, w11
      40:      	mov	w16, #0xbb41            // =47937
      44:      	mov	x19, x0
      48:      	mov	w12, #0x80              // =128
      4c:      	mov	w14, #0x1               // =1
      50:      	mov	w13, #0x100             // =256
      54:      	mov	w15, #0x8               // =8
      58:      	movk	w16, #0x9d7d, lsl #16
      5c:      	str	x8, [sp, #0x8]
      60:      	b	0x78 <<toyos_crypto::mlkem::Poly>::ntt+0x78>
      64:      	mov	x14, x8
      68:      	lsr	x8, x12, #1
      6c:      	cmp	x12, #0x3
      70:      	mov	x12, x8
      74:      	b.ls	0x328 <<toyos_crypto::mlkem::Poly>::ntt+0x328>
      78:      	lsl	x17, x12, #1
      7c:      	rbit	x18, x17
      80:      	sub	w0, w17, #0x1
      84:      	ubfx	x0, x0, #8, #1
      88:      	clz	x18, x18
      8c:      	lsr	x18, x13, x18
      90:      	adds	x18, x0, x18
      94:      	b.eq	0x68 <<toyos_crypto::mlkem::Poly>::ntt+0x68>
      98:      	lsl	x4, x12, #2
      9c:      	add	x5, x19, x17
      a0:      	neg	x6, x12, lsl #1
      a4:      	mov	x1, xzr
      a8:      	mov	x2, xzr
      ac:      	add	x8, x18, x14
      b0:      	sub	x7, x12, #0x1
      b4:      	add	x20, x5, #0x2
      b8:      	neg	x21, x12
      bc:      	mov	x22, x19
      c0:      	mov	x23, x12
      c4:      	neg	x0, x12
      c8:      	cmp	x23, #0x100
      cc:      	rbit	w26, w14
      d0:      	madd	x0, x6, x1, x0
      d4:      	csel	x24, x23, x13, hi
      d8:      	add	x25, x24, x21
      dc:      	cmp	x25, x7
      e0:      	csel	x25, x25, x7, lo
      e4:      	add	x24, x24, x0
      e8:      	lsr	w0, w26, #25
      ec:      	cmp	x24, x7
      f0:      	csel	x26, x24, x7, lo
      f4:      	cmp	x24, x7
      f8:      	csel	x27, x24, x7, lo
      fc:      	mov	w24, #0x1               // =1
     100:      	cbz	w0, 0x148 <<toyos_crypto::mlkem::Poly>::ntt+0x148>
     104:      	mov	w28, #0x11              // =17
     108:      	b	0x124 <<toyos_crypto::mlkem::Poly>::ntt+0x124>
     10c:      	mul	w3, w28, w28
     110:      	lsr	w0, w0, #1
     114:      	umull	x28, w3, w16
     118:      	lsr	x28, x28, #43
     11c:      	msub	w28, w28, w10, w3
     120:      	cbz	w0, 0x148 <<toyos_crypto::mlkem::Poly>::ntt+0x148>
     124:      	tbz	w0, #0x0, 0x10c <<toyos_crypto::mlkem::Poly>::ntt+0x10c>
     128:      	mul	w24, w24, w28
     12c:      	umull	x30, w24, w9
     130:      	lsr	x30, x30, #32
     134:      	sub	w3, w24, w30
     138:      	add	w3, w30, w3, lsr #1
     13c:      	lsr	w3, w3, #11
     140:      	msub	w24, w3, w10, w24
     144:      	b	0x10c <<toyos_crypto::mlkem::Poly>::ntt+0x10c>
     148:      	adds	x14, x14, #0x1
     14c:      	b.hs	0x368 <<toyos_crypto::mlkem::Poly>::ntt+0x368>
     150:      	cmp	x26, #0x7
     154:      	mov	x0, x2
     158:      	b.ls	0x294 <<toyos_crypto::mlkem::Poly>::ntt+0x294>
     15c:      	mul	x0, x4, x1
     160:      	lsl	x27, x27, #1
     164:      	add	x28, x19, x0
     168:      	add	x30, x5, x0
     16c:      	add	x3, x28, x27
     170:      	add	x3, x3, #0x2
     174:      	cmp	x30, x3
     178:      	b.hs	0x190 <<toyos_crypto::mlkem::Poly>::ntt+0x190>
     17c:      	add	x0, x20, x0
     180:      	add	x0, x0, x27
     184:      	cmp	x28, x0
     188:      	mov	x0, x2
     18c:      	b.lo	0x294 <<toyos_crypto::mlkem::Poly>::ntt+0x294>
     190:      	add	x0, x26, #0x1
     194:      	fmov	s3, w24
     198:      	mov	x26, x22
     19c:      	ands	x3, x0, #0x7
     1a0:      	csel	x3, x15, x3, eq
     1a4:      	sub	x0, x0, x3
     1a8:      	sub	x3, x25, x3
     1ac:      	add	x0, x2, x0
     1b0:      	add	x25, x3, #0x1
     1b4:      	ldr	q4, [x26, x17]
     1b8:      	subs	x25, x25, #0x8
     1bc:      	ushll2	v5.4s, v4.8h, #0x0
     1c0:      	ushll	v4.4s, v4.4h, #0x0
     1c4:      	mul	v5.4s, v5.4s, v3.s[0]
     1c8:      	mul	v4.4s, v4.4s, v3.s[0]
     1cc:      	umull2	v6.2d, v5.4s, v0.4s
     1d0:      	umull	v7.2d, v5.2s, v0.2s
     1d4:      	umull2	v16.2d, v4.4s, v0.4s
     1d8:      	umull	v17.2d, v4.2s, v0.2s
     1dc:      	uzp2	v6.4s, v7.4s, v6.4s
     1e0:      	uzp2	v7.4s, v17.4s, v16.4s
     1e4:      	sub	v16.4s, v5.4s, v6.4s
     1e8:      	sub	v17.4s, v4.4s, v7.4s
     1ec:      	usra	v6.4s, v16.4s, #0x1
     1f0:      	ldr	q16, [x26]
     1f4:      	usra	v7.4s, v17.4s, #0x1
     1f8:      	ushr	v6.4s, v6.4s, #0xb
     1fc:      	ushr	v7.4s, v7.4s, #0xb
     200:      	mls	v5.4s, v6.4s, v1.4s
     204:      	ushll2	v6.4s, v16.8h, #0x0
     208:      	mls	v4.4s, v7.4s, v1.4s
     20c:      	ushll	v7.4s, v16.4h, #0x0
     210:      	sub	v6.4s, v6.4s, v5.4s
     214:      	uaddw2	v5.4s, v5.4s, v16.8h
     218:      	sub	v7.4s, v7.4s, v4.4s
     21c:      	uaddw	v4.4s, v4.4s, v16.4h
     220:      	add	v6.4s, v6.4s, v1.4s
     224:      	umull2	v16.2d, v5.4s, v2.4s
     228:      	add	v7.4s, v7.4s, v1.4s
     22c:      	umull2	v22.2d, v4.4s, v2.4s
     230:      	umull	v23.2d, v4.2s, v2.2s
     234:      	umull2	v17.2d, v6.4s, v0.4s
     238:      	umull	v18.2d, v6.2s, v0.2s
     23c:      	umull2	v19.2d, v7.4s, v0.4s
     240:      	umull	v20.2d, v7.2s, v0.2s
     244:      	uzp2	v17.4s, v18.4s, v17.4s
     248:      	uzp2	v18.4s, v20.4s, v19.4s
     24c:      	umull	v19.2d, v5.2s, v2.2s
     250:      	sub	v20.4s, v6.4s, v17.4s
     254:      	sub	v21.4s, v7.4s, v18.4s
     258:      	uzp2	v16.4s, v19.4s, v16.4s
     25c:      	uzp2	v19.4s, v23.4s, v22.4s
     260:      	usra	v17.4s, v20.4s, #0x1
     264:      	usra	v18.4s, v21.4s, #0x1
     268:      	mls	v5.4s, v16.4s, v1.4s
     26c:      	mls	v4.4s, v19.4s, v1.4s
     270:      	ushr	v17.4s, v17.4s, #0xb
     274:      	ushr	v18.4s, v18.4s, #0xb
     278:      	mls	v6.4s, v17.4s, v1.4s
     27c:      	uzp1	v4.8h, v4.8h, v5.8h
     280:      	mls	v7.4s, v18.4s, v1.4s
     284:      	uzp1	v5.8h, v7.8h, v6.8h
     288:      	str	q5, [x26, x17]
     28c:      	str	q4, [x26], #0x10
     290:      	b.ne	0x1b4 <<toyos_crypto::mlkem::Poly>::ntt+0x1b4>
     294:      	lsl	x25, x0, #1
     298:      	add	x2, x2, x17
     29c:      	sub	x18, x18, #0x1
     2a0:      	sub	x26, x23, x0
     2a4:      	add	x0, x12, x0
     2a8:      	cmp	x0, #0x100
     2ac:      	b.hs	0x354 <<toyos_crypto::mlkem::Poly>::ntt+0x354>
     2b0:      	ldrh	w3, [x19, x0, lsl #1]
     2b4:      	subs	x26, x26, #0x1
     2b8:      	mul	w3, w24, w3
     2bc:      	umull	x27, w3, w9
     2c0:      	lsr	x27, x27, #32
     2c4:      	sub	w28, w3, w27
     2c8:      	add	w27, w27, w28, lsr #1
     2cc:      	lsr	w27, w27, #11
     2d0:      	msub	w3, w27, w10, w3
     2d4:      	ldrh	w27, [x19, x25]
     2d8:      	sub	w28, w27, w3
     2dc:      	add	w3, w3, w27
     2e0:      	add	w28, w28, #0xd01
     2e4:      	umull	x30, w3, w11
     2e8:      	umull	x27, w28, w11
     2ec:      	lsr	x30, x30, #32
     2f0:      	lsr	x27, x27, #32
     2f4:      	msub	w3, w30, w10, w3
     2f8:      	msub	w27, w27, w10, w28
     2fc:      	strh	w27, [x19, x0, lsl #1]
     300:      	add	x0, x0, #0x1
     304:      	strh	w3, [x19, x25]
     308:      	add	x25, x25, #0x2
     30c:      	b.ne	0x2a8 <<toyos_crypto::mlkem::Poly>::ntt+0x2a8>
     310:      	add	x23, x23, x17
     314:      	add	x1, x1, #0x1
     318:      	sub	x21, x21, x17
     31c:      	add	x22, x22, x4
     320:      	cbnz	x18, 0xc4 <<toyos_crypto::mlkem::Poly>::ntt+0xc4>
     324:      	b	0x64 <<toyos_crypto::mlkem::Poly>::ntt+0x64>
     328:      	ldr	x0, [sp, #0x8]
     32c:      	mov	x1, x19
     330:      	mov	w2, #0x200              // =512
     334:      	ldp	x20, x19, [sp, #0x60]
     338:      	ldp	x22, x21, [sp, #0x50]
     33c:      	ldp	x24, x23, [sp, #0x40]
     340:      	ldp	x26, x25, [sp, #0x30]
     344:      	ldp	x28, x27, [sp, #0x20]
     348:      	ldp	x29, x30, [sp, #0x10]
     34c:      	add	sp, sp, #0x70
     350:      	b	0x350 <<toyos_crypto::mlkem::Poly>::ntt+0x350>
     354:      	adrp	x2, 0x0 <<toyos_crypto::mlkem::Poly>::ntt>
     358:      	add	x2, x2, #0x0
     35c:      	mov	w1, #0x100              // =256
     360:      	bl	0x360 <<toyos_crypto::mlkem::Poly>::ntt+0x360>
     364:      	b	0x374 <<toyos_crypto::mlkem::Poly>::ntt+0x374>
     368:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::ntt>
     36c:      	add	x0, x0, #0x0
     370:      	bl	0x370 <<toyos_crypto::mlkem::Poly>::ntt+0x370>
     374:      	brk	#0x1
     378:      	mov	x8, xzr
     37c:      	mov	x9, x8
     380:      	add	x8, x8, #0x2
     384:      	cmp	x8, #0x200
     388:      	strh	wzr, [x19, x9]
     38c:      	b.ne	0x37c <<toyos_crypto::mlkem::Poly>::ntt+0x37c>
     390:      	bl	0x390 <<toyos_crypto::mlkem::Poly>::ntt+0x390>

0000000000000000 <<toyos_crypto::mlkem::Poly>::plus>:
       0:      	stp	x29, x30, [sp, #-0x20]!
       4:      	str	x28, [sp, #0x10]
       8:      	mov	x29, sp
       c:      	sub	sp, sp, #0x200
      10:      	mov	w10, #0xd01             // =3329
      14:      	mov	w11, #0xafb8            // =44984
      18:      	mov	x9, x0
      1c:      	movk	w11, #0x13, lsl #16
      20:      	dup	v0.4h, w10
      24:      	mov	x0, x8
      28:      	dup	v1.4s, w11
      2c:      	mov	x8, xzr
      30:      	mov	x10, sp
      34:      	ldr	q2, [x9, x8]
      38:      	ldr	q3, [x1, x8]
      3c:      	uaddl2	v4.4s, v3.8h, v2.8h
      40:      	uaddl	v2.4s, v3.4h, v2.4h
      44:      	umull2	v3.2d, v4.4s, v1.4s
      48:      	umull	v5.2d, v4.2s, v1.2s
      4c:      	umull2	v6.2d, v2.4s, v1.4s
      50:      	umull	v7.2d, v2.2s, v1.2s
      54:      	uzp2	v3.4s, v5.4s, v3.4s
      58:      	uzp2	v5.4s, v7.4s, v6.4s
      5c:      	xtn	v3.4h, v3.4s
      60:      	xtn	v5.4h, v5.4s
      64:      	umlsl	v4.4s, v3.4h, v0.4h
      68:      	umlsl	v2.4s, v5.4h, v0.4h
      6c:      	uzp1	v2.8h, v2.8h, v4.8h
      70:      	str	q2, [x10, x8]
      74:      	add	x8, x8, #0x10
      78:      	cmp	x8, #0x200
      7c:      	b.ne	0x34 <<toyos_crypto::mlkem::Poly>::plus+0x34>
      80:      	mov	x1, sp
      84:      	mov	w2, #0x200              // =512
      88:      	bl	0x88 <<toyos_crypto::mlkem::Poly>::plus+0x88>
      8c:      	add	sp, sp, #0x200
      90:      	ldr	x28, [sp, #0x10]
      94:      	ldp	x29, x30, [sp], #0x20
      98:      	ret

0000000000000000 <<toyos_crypto::mlkem::Poly>::encode>:
       0:      	sub	sp, sp, #0x40
       4:      	stp	x29, x30, [sp, #0x10]
       8:      	stp	x22, x21, [sp, #0x20]
       c:      	stp	x20, x19, [sp, #0x30]
      10:      	add	x29, sp, #0x10
      14:      	lsr	x8, x1, #59
      18:      	str	x3, [sp]
      1c:      	cbnz	x8, 0x138 <<toyos_crypto::mlkem::Poly>::encode+0x138>
      20:      	lsl	x8, x1, #5
      24:      	mov	x19, x3
      28:      	mov	x21, x1
      2c:      	cmp	x3, x8
      30:      	str	x8, [sp, #0x8]
      34:      	b.ne	0x110 <<toyos_crypto::mlkem::Poly>::encode+0x110>
      38:      	mov	x20, x2
      3c:      	mov	x22, x0
      40:      	mov	x0, x2
      44:      	mov	x1, x19
      48:      	mov	w2, wzr
      4c:      	bl	0x4c <<toyos_crypto::mlkem::Poly>::encode+0x4c>
      50:      	mov	x8, xzr
      54:      	mov	x9, xzr
      58:      	b	0x6c <<toyos_crypto::mlkem::Poly>::encode+0x6c>
      5c:      	add	x9, x9, #0x1
      60:      	add	x8, x8, x21
      64:      	cmp	x9, #0x100
      68:      	b.eq	0xd4 <<toyos_crypto::mlkem::Poly>::encode+0xd4>
      6c:      	cbz	x21, 0x5c <<toyos_crypto::mlkem::Poly>::encode+0x5c>
      70:      	umulh	x10, x9, x21
      74:      	cmp	xzr, x10
      78:      	b.ne	0x12c <<toyos_crypto::mlkem::Poly>::encode+0x12c>
      7c:      	mul	x10, x9, x21
      80:      	mov	x11, xzr
      84:      	add	x12, x8, x11
      88:      	cmp	x12, x10
      8c:      	b.lo	0xf4 <<toyos_crypto::mlkem::Poly>::encode+0xf4>
      90:      	cmp	x11, #0x10
      94:      	b.eq	0xe8 <<toyos_crypto::mlkem::Poly>::encode+0xe8>
      98:      	lsr	x0, x12, #3
      9c:      	cmp	x0, x19
      a0:      	b.hs	0x100 <<toyos_crypto::mlkem::Poly>::encode+0x100>
      a4:      	ldrh	w13, [x22, x9, lsl #1]
      a8:      	and	x12, x12, #0x7
      ac:      	lsr	w13, w13, w11
      b0:      	add	x11, x11, #0x1
      b4:      	cmp	x21, x11
      b8:      	and	w13, w13, #0x1
      bc:      	lsl	w12, w13, w12
      c0:      	ldrb	w13, [x20, x0]
      c4:      	orr	w12, w12, w13
      c8:      	strb	w12, [x20, x0]
      cc:      	b.ne	0x84 <<toyos_crypto::mlkem::Poly>::encode+0x84>
      d0:      	b	0x5c <<toyos_crypto::mlkem::Poly>::encode+0x5c>
      d4:      	ldp	x20, x19, [sp, #0x30]
      d8:      	ldp	x22, x21, [sp, #0x20]
      dc:      	ldp	x29, x30, [sp, #0x10]
      e0:      	add	sp, sp, #0x40
      e4:      	ret
      e8:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::encode>
      ec:      	add	x0, x0, #0x0
      f0:      	bl	0xf0 <<toyos_crypto::mlkem::Poly>::encode+0xf0>
      f4:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::encode>
      f8:      	add	x0, x0, #0x0
      fc:      	bl	0xfc <<toyos_crypto::mlkem::Poly>::encode+0xfc>
     100:      	adrp	x2, 0x0 <<toyos_crypto::mlkem::Poly>::encode>
     104:      	add	x2, x2, #0x0
     108:      	mov	x1, x19
     10c:      	bl	0x10c <<toyos_crypto::mlkem::Poly>::encode+0x10c>
     110:      	adrp	x5, 0x0 <<toyos_crypto::mlkem::Poly>::encode>
     114:      	add	x5, x5, #0x0
     118:      	mov	x1, sp
     11c:      	add	x2, sp, #0x8
     120:      	mov	w0, wzr
     124:      	mov	x3, xzr
     128:      	bl	0x128 <<toyos_crypto::mlkem::Poly>::encode+0x128>
     12c:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::encode>
     130:      	add	x0, x0, #0x0
     134:      	bl	0x134 <<toyos_crypto::mlkem::Poly>::encode+0x134>
     138:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::encode>
     13c:      	add	x0, x0, #0x0
     140:      	bl	0x140 <<toyos_crypto::mlkem::Poly>::encode+0x140>

0000000000000000 <<toyos_crypto::mlkem::Poly>::inverse>:
       0:      	stp	x29, x30, [sp, #-0x40]!
       4:      	str	x23, [sp, #0x10]
       8:      	stp	x22, x21, [sp, #0x20]
       c:      	stp	x20, x19, [sp, #0x30]
      10:      	mov	x29, sp
      14:      	mov	w13, #0xafb8            // =44984
      18:      	mov	w15, #0x7681            // =30337
      1c:      	mov	w16, #0xbb41            // =47937
      20:      	mov	x19, x0
      24:      	mov	w9, #0x2                // =2
      28:      	mov	w11, #0x7f              // =127
      2c:      	mov	w12, #0x100             // =256
      30:      	adrp	x2, 0x0 <<toyos_crypto::mlkem::Poly>::inverse>
      34:      	add	x2, x2, #0x0
      38:      	adrp	x10, 0x0 <<toyos_crypto::mlkem::Poly>::inverse>
      3c:      	add	x10, x10, #0x0
      40:      	movk	w13, #0x13, lsl #16
      44:      	mov	w14, #0xd01             // =3329
      48:      	movk	w15, #0x3afb, lsl #16
      4c:      	movk	w16, #0x9d7d, lsl #16
      50:      	b	0x64 <<toyos_crypto::mlkem::Poly>::inverse+0x64>
      54:      	mov	x11, x1
      58:      	cmp	x9, #0x41
      5c:      	mov	x9, x17
      60:      	b.hs	0x184 <<toyos_crypto::mlkem::Poly>::inverse+0x184>
      64:      	lsl	x17, x9, #1
      68:      	rbit	w18, w17
      6c:      	sub	w0, w17, #0x1
      70:      	ubfx	x0, x0, #8, #1
      74:      	clz	w18, w18
      78:      	lsr	w18, w12, w18
      7c:      	adds	x18, x0, x18
      80:      	b.eq	0x58 <<toyos_crypto::mlkem::Poly>::inverse+0x58>
      84:      	mov	x0, xzr
      88:      	sub	x1, x11, x18
      8c:      	mov	x3, x9
      90:      	rbit	w4, w11
      94:      	lsr	w5, w4, #25
      98:      	cbz	w5, 0xe4 <<toyos_crypto::mlkem::Poly>::inverse+0xe4>
      9c:      	mov	w4, #0x1                // =1
      a0:      	mov	w6, #0x11               // =17
      a4:      	b	0xc0 <<toyos_crypto::mlkem::Poly>::inverse+0xc0>
      a8:      	mul	w6, w6, w6
      ac:      	lsr	w5, w5, #1
      b0:      	umull	x7, w6, w16
      b4:      	lsr	x7, x7, #43
      b8:      	msub	w6, w7, w14, w6
      bc:      	cbz	w5, 0xe8 <<toyos_crypto::mlkem::Poly>::inverse+0xe8>
      c0:      	tbz	w5, #0x0, 0xa8 <<toyos_crypto::mlkem::Poly>::inverse+0xa8>
      c4:      	mul	w4, w4, w6
      c8:      	umull	x7, w4, w15
      cc:      	lsr	x7, x7, #32
      d0:      	sub	w20, w4, w7
      d4:      	add	w7, w7, w20, lsr #1
      d8:      	lsr	w7, w7, #11
      dc:      	msub	w4, w7, w14, w4
      e0:      	b	0xa8 <<toyos_crypto::mlkem::Poly>::inverse+0xa8>
      e4:      	mov	w4, #0x1                // =1
      e8:      	cbz	x11, 0x230 <<toyos_crypto::mlkem::Poly>::inverse+0x230>
      ec:      	add	x5, x0, x17
      f0:      	sub	x18, x18, #0x1
      f4:      	sub	x11, x11, #0x1
      f8:      	mov	x7, x9
      fc:      	mov	x6, x3
     100:      	cmp	x0, #0xff
     104:      	b.hi	0x224 <<toyos_crypto::mlkem::Poly>::inverse+0x224>
     108:      	cmp	x6, #0x100
     10c:      	b.hs	0x21c <<toyos_crypto::mlkem::Poly>::inverse+0x21c>
     110:      	ldrh	w20, [x19, x0, lsl #1]
     114:      	ldrh	w21, [x19, x6, lsl #1]
     118:      	add	w22, w21, w20
     11c:      	add	w21, w21, #0xd01
     120:      	umull	x23, w22, w13
     124:      	subs	w20, w21, w20
     128:      	lsr	x23, x23, #32
     12c:      	msub	w22, w23, w14, w22
     130:      	strh	w22, [x19, x0, lsl #1]
     134:      	b.lo	0x20c <<toyos_crypto::mlkem::Poly>::inverse+0x20c>
     138:      	umull	x21, w20, w13
     13c:      	subs	x7, x7, #0x1
     140:      	add	x0, x0, #0x1
     144:      	lsr	x21, x21, #32
     148:      	msub	w20, w21, w14, w20
     14c:      	mul	w20, w20, w4
     150:      	umull	x21, w20, w15
     154:      	lsr	x21, x21, #32
     158:      	sub	w22, w20, w21
     15c:      	add	w21, w21, w22, lsr #1
     160:      	lsr	w21, w21, #11
     164:      	msub	w20, w21, w14, w20
     168:      	strh	w20, [x19, x6, lsl #1]
     16c:      	add	x6, x6, #0x1
     170:      	b.ne	0x100 <<toyos_crypto::mlkem::Poly>::inverse+0x100>
     174:      	add	x3, x3, x17
     178:      	mov	x0, x5
     17c:      	cbnz	x18, 0x90 <<toyos_crypto::mlkem::Poly>::inverse+0x90>
     180:      	b	0x54 <<toyos_crypto::mlkem::Poly>::inverse+0x54>
     184:      	mov	w10, #0xb769            // =46953
     188:      	mov	w9, #0xce7              // =3303
     18c:      	mov	w11, #0xd01             // =3329
     190:      	movk	w10, #0x13af, lsl #16
     194:      	dup	v0.8h, w9
     198:      	dup	v2.4s, w11
     19c:      	dup	v1.4s, w10
     1a0:      	mov	x9, xzr
     1a4:      	ldr	q3, [x19, x9]
     1a8:      	umull2	v4.4s, v3.8h, v0.8h
     1ac:      	umull	v3.4s, v3.4h, v0.4h
     1b0:      	umull2	v5.2d, v4.4s, v1.4s
     1b4:      	umull	v6.2d, v4.2s, v1.2s
     1b8:      	umull2	v7.2d, v3.4s, v1.4s
     1bc:      	umull	v16.2d, v3.2s, v1.2s
     1c0:      	uzp2	v5.4s, v6.4s, v5.4s
     1c4:      	uzp2	v6.4s, v16.4s, v7.4s
     1c8:      	ushr	v5.4s, v5.4s, #0x8
     1cc:      	ushr	v6.4s, v6.4s, #0x8
     1d0:      	mls	v4.4s, v5.4s, v2.4s
     1d4:      	mls	v3.4s, v6.4s, v2.4s
     1d8:      	uzp1	v3.8h, v3.8h, v4.8h
     1dc:      	str	q3, [x19, x9]
     1e0:      	add	x9, x9, #0x10
     1e4:      	cmp	x9, #0x200
     1e8:      	b.ne	0x1a4 <<toyos_crypto::mlkem::Poly>::inverse+0x1a4>
     1ec:      	mov	x0, x8
     1f0:      	mov	x1, x19
     1f4:      	mov	w2, #0x200              // =512
     1f8:      	ldp	x20, x19, [sp, #0x30]
     1fc:      	ldr	x23, [sp, #0x10]
     200:      	ldp	x22, x21, [sp, #0x20]
     204:      	ldp	x29, x30, [sp], #0x40
     208:      	b	0x208 <<toyos_crypto::mlkem::Poly>::inverse+0x208>
     20c:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::inverse>
     210:      	add	x0, x0, #0x0
     214:      	bl	0x214 <<toyos_crypto::mlkem::Poly>::inverse+0x214>
     218:      	b	0x23c <<toyos_crypto::mlkem::Poly>::inverse+0x23c>
     21c:      	mov	x0, x6
     220:      	mov	x2, x10
     224:      	mov	w1, #0x100              // =256
     228:      	bl	0x228 <<toyos_crypto::mlkem::Poly>::inverse+0x228>
     22c:      	b	0x23c <<toyos_crypto::mlkem::Poly>::inverse+0x23c>
     230:      	adrp	x0, 0x0 <<toyos_crypto::mlkem::Poly>::inverse>
     234:      	add	x0, x0, #0x0
     238:      	bl	0x238 <<toyos_crypto::mlkem::Poly>::inverse+0x238>
     23c:      	brk	#0x1
     240:      	mov	x8, xzr
     244:      	mov	x9, x8
     248:      	add	x8, x8, #0x2
     24c:      	cmp	x8, #0x200
     250:      	strh	wzr, [x19, x9]
     254:      	b.ne	0x244 <<toyos_crypto::mlkem::Poly>::inverse+0x244>
     258:      	bl	0x258 <<toyos_crypto::mlkem::Poly>::inverse+0x258>

0000000000000000 <<toyos_crypto::mlkem::Poly>::product>:
       0:      	stp	x29, x30, [sp, #-0x20]!
       4:      	stp	x28, x19, [sp, #0x10]
       8:      	mov	x29, sp
       c:      	sub	sp, sp, #0x200
      10:      	movi	v0.2d, #0000000000000000
      14:      	mov	w10, #0xbb41            // =47937
      18:      	mov	w12, #0x7681            // =30337
      1c:      	mov	x9, x0
      20:      	mov	x0, x8
      24:      	mov	x8, xzr
      28:      	movk	w10, #0x9d7d, lsl #16
      2c:      	mov	w11, #0xd01             // =3329
      30:      	movk	w12, #0x3afb, lsl #16
      34:      	mov	w13, #0xf2ff            // =62207
      38:      	mov	x14, sp
      3c:      	stp	q0, q0, [sp]
      40:      	stp	q0, q0, [sp, #0x20]
      44:      	stp	q0, q0, [sp, #0x40]
      48:      	stp	q0, q0, [sp, #0x60]
      4c:      	stp	q0, q0, [sp, #0x80]
      50:      	stp	q0, q0, [sp, #0xa0]
      54:      	stp	q0, q0, [sp, #0xc0]
      58:      	stp	q0, q0, [sp, #0xe0]
      5c:      	stp	q0, q0, [sp, #0x100]
      60:      	stp	q0, q0, [sp, #0x120]
      64:      	stp	q0, q0, [sp, #0x140]
      68:      	stp	q0, q0, [sp, #0x160]
      6c:      	stp	q0, q0, [sp, #0x180]
      70:      	stp	q0, q0, [sp, #0x1a0]
      74:      	stp	q0, q0, [sp, #0x1c0]
      78:      	stp	q0, q0, [sp, #0x1e0]
      7c:      	b	0x15c <<toyos_crypto::mlkem::Poly>::product+0x15c>
      80:      	mov	w16, #0x2               // =2
      84:      	bfi	x16, x8, #2, #62
      88:      	ldrh	w18, [x9, x16]
      8c:      	ldrh	w2, [x1, x16]
      90:      	mul	w3, w2, w18
      94:      	umull	x17, w3, w12
      98:      	lsr	x17, x17, #32
      9c:      	sub	w4, w3, w17
      a0:      	add	w4, w17, w4, lsr #1
      a4:      	lsl	x17, x8, #2
      a8:      	add	x8, x8, #0x1
      ac:      	lsr	w4, w4, #11
      b0:      	ldrh	w5, [x9, x17]
      b4:      	ldrh	w6, [x1, x17]
      b8:      	msub	w3, w4, w11, w3
      bc:      	mul	w4, w6, w5
      c0:      	mul	w2, w2, w5
      c4:      	mul	w15, w3, w15
      c8:      	mul	w18, w18, w6
      cc:      	umull	x3, w4, w12
      d0:      	umull	x5, w15, w12
      d4:      	umull	x6, w2, w12
      d8:      	umull	x7, w18, w12
      dc:      	lsr	x3, x3, #32
      e0:      	lsr	x5, x5, #32
      e4:      	lsr	x6, x6, #32
      e8:      	sub	w19, w4, w3
      ec:      	lsr	x7, x7, #32
      f0:      	add	w3, w3, w19, lsr #1
      f4:      	sub	w19, w15, w5
      f8:      	add	w5, w5, w19, lsr #1
      fc:      	sub	w19, w2, w6
     100:      	add	w6, w6, w19, lsr #1
     104:      	sub	w19, w18, w7
     108:      	lsr	w3, w3, #11
     10c:      	add	w7, w7, w19, lsr #1
     110:      	lsr	w5, w5, #11
     114:      	lsr	w6, w6, #11
     118:      	msub	w3, w3, w11, w4
     11c:      	lsr	w4, w7, #11
     120:      	msub	w15, w5, w11, w15
     124:      	msub	w2, w6, w11, w2
     128:      	msub	w18, w4, w11, w18
     12c:      	add	w15, w15, w3
     130:      	add	w3, w15, w13
     134:      	cmp	w15, #0xd01
     138:      	add	w18, w2, w18
     13c:      	csel	w15, w15, w3, lo
     140:      	strh	w15, [x14, x17]
     144:      	add	w2, w18, w13
     148:      	cmp	w18, #0xd01
     14c:      	csel	w15, w18, w2, lo
     150:      	cmp	x8, #0x80
     154:      	strh	w15, [x14, x16]
     158:      	b.eq	0x1b0 <<toyos_crypto::mlkem::Poly>::product+0x1b0>
     15c:      	orr	w15, w8, #0x80
     160:      	mov	w17, #0x11              // =17
     164:      	rbit	w15, w15
     168:      	lsr	w16, w15, #24
     16c:      	mov	w15, #0x1               // =1
     170:      	b	0x18c <<toyos_crypto::mlkem::Poly>::product+0x18c>
     174:      	mul	w17, w17, w17
     178:      	lsr	w16, w16, #1
     17c:      	umull	x18, w17, w10
     180:      	lsr	x18, x18, #43
     184:      	msub	w17, w18, w11, w17
     188:      	cbz	w16, 0x80 <<toyos_crypto::mlkem::Poly>::product+0x80>
     18c:      	tbz	w16, #0x0, 0x174 <<toyos_crypto::mlkem::Poly>::product+0x174>
     190:      	mul	w15, w15, w17
     194:      	umull	x18, w15, w12
     198:      	lsr	x18, x18, #32
     19c:      	sub	w2, w15, w18
     1a0:      	add	w18, w18, w2, lsr #1
     1a4:      	lsr	w18, w18, #11
     1a8:      	msub	w15, w18, w11, w15
     1ac:      	b	0x174 <<toyos_crypto::mlkem::Poly>::product+0x174>
     1b0:      	mov	x1, sp
     1b4:      	mov	w2, #0x200              // =512
     1b8:      	bl	0x1b8 <<toyos_crypto::mlkem::Poly>::product+0x1b8>
     1bc:      	add	sp, sp, #0x200
     1c0:      	ldp	x28, x19, [sp, #0x10]
     1c4:      	ldp	x29, x30, [sp], #0x20
     1c8:      	ret

0000000000000000 <toyos_crypto::mlkem::noise>:
       0:      	stp	x29, x30, [sp, #-0x40]!
       4:      	str	x28, [sp, #0x10]
       8:      	stp	x22, x21, [sp, #0x20]
       c:      	stp	x20, x19, [sp, #0x30]
      10:      	mov	x29, sp
      14:      	sub	sp, sp, #0x2a0
      18:      	movi	v0.2d, #0000000000000000
      1c:      	mov	x19, x8
      20:      	mov	w8, #0x20               // =32
      24:      	stp	x0, x8, [sp, #0x80]
      28:      	add	x8, x29, #0x1c
      2c:      	mov	w9, #0x1                // =1
      30:      	strb	w1, [x29, #0x1c]
      34:      	stp	x8, x9, [sp, #0x90]
      38:      	stp	q0, q0, [sp]
      3c:      	stp	q0, q0, [sp, #0x20]
      40:      	stp	q0, q0, [sp, #0x40]
      44:      	stp	q0, q0, [sp, #0x60]
      48:      	add	x8, sp, #0xa0
      4c:      	add	x2, sp, #0x80
      50:      	mov	w0, #0x88               // =136
      54:      	mov	w1, #0x1f               // =31
      58:      	mov	w3, #0x2                // =2
      5c:      	add	x20, sp, #0xa0
      60:      	bl	0x60 <toyos_crypto::mlkem::noise+0x60>
      64:      	ldr	x8, [sp, #0x170]
      68:      	mov	x22, xzr
      6c:      	mov	x21, sp
      70:      	b	0xa8 <toyos_crypto::mlkem::noise+0xa8>
      74:      	lsr	x0, x8, #3
      78:      	cmp	x8, #0xc8
      7c:      	b.hs	0x2a0 <toyos_crypto::mlkem::noise+0x2a0>
      80:      	ldr	x9, [x20, x0, lsl #3]
      84:      	ubfiz	x10, x8, #3, #3
      88:      	add	x11, x22, #0x1
      8c:      	add	x8, x8, #0x1
      90:      	cmp	x11, #0x80
      94:      	lsr	x9, x9, x10
      98:      	str	x8, [sp, #0x170]
      9c:      	strb	w9, [x21, x22]
      a0:      	mov	x22, x11
      a4:      	b.eq	0xcc <toyos_crypto::mlkem::noise+0xcc>
      a8:      	ldr	x9, [sp, #0x168]
      ac:      	cmp	x8, x9
      b0:      	b.ne	0x74 <toyos_crypto::mlkem::noise+0x74>
      b4:      	add	x0, sp, #0xa0
      b8:      	bl	0xb8 <toyos_crypto::mlkem::noise+0xb8>
      bc:      	mov	x0, xzr
      c0:      	mov	x8, xzr
      c4:      	str	xzr, [sp, #0x170]
      c8:      	b	0x80 <toyos_crypto::mlkem::noise+0x80>
      cc:      	movi	v5.2d, #0000000000000000
      d0:      	mov	w9, #0xd01              // =3329
      d4:      	movi	d0, #0x0000ff000000ff
      d8:      	movi	v1.2s, #0x2
      dc:      	movi	v2.2s, #0x4
      e0:      	str	xzr, [sp, #0xa0]
      e4:      	dup	v3.2s, w9
      e8:      	movi	v4.2s, #0x1, lsl #16
      ec:      	adrp	x9, 0x0 <toyos_crypto::mlkem::noise>
      f0:      	str	xzr, [sp, #0xa8]
      f4:      	mov	x8, xzr
      f8:      	mov	x10, sp
      fc:      	str	xzr, [sp, #0xb0]
     100:      	add	x11, sp, #0xa0
     104:      	str	xzr, [sp, #0xb8]
     108:      	str	xzr, [sp, #0xc0]
     10c:      	str	xzr, [sp, #0xc8]
     110:      	str	xzr, [sp, #0xd0]
     114:      	str	xzr, [sp, #0xd8]
     118:      	str	xzr, [sp, #0xe0]
     11c:      	str	xzr, [sp, #0xe8]
     120:      	str	xzr, [sp, #0xf0]
     124:      	str	xzr, [sp, #0xf8]
     128:      	str	xzr, [sp, #0x100]
     12c:      	str	xzr, [sp, #0x108]
     130:      	str	xzr, [sp, #0x110]
     134:      	str	xzr, [sp, #0x118]
     138:      	str	xzr, [sp, #0x120]
     13c:      	str	xzr, [sp, #0x128]
     140:      	str	xzr, [sp, #0x130]
     144:      	str	xzr, [sp, #0x138]
     148:      	str	xzr, [sp, #0x140]
     14c:      	str	xzr, [sp, #0x148]
     150:      	str	xzr, [sp, #0x150]
     154:      	str	xzr, [sp, #0x158]
     158:      	str	xzr, [sp, #0x160]
     15c:      	stp	q5, q5, [sp, #0xa0]
     160:      	stp	q5, q5, [sp, #0xc0]
     164:      	stp	q5, q5, [sp, #0xe0]
     168:      	stp	q5, q5, [sp, #0x100]
     16c:      	stp	q5, q5, [sp, #0x120]
     170:      	stp	q5, q5, [sp, #0x140]
     174:      	stp	q5, q5, [sp, #0x160]
     178:      	stp	q5, q5, [sp, #0x180]
     17c:      	stp	q5, q5, [sp, #0x1a0]
     180:      	stp	q5, q5, [sp, #0x1c0]
     184:      	stp	q5, q5, [sp, #0x1e0]
     188:      	stp	q5, q5, [sp, #0x200]
     18c:      	stp	q5, q5, [sp, #0x220]
     190:      	stp	q5, q5, [sp, #0x240]
     194:      	stp	q5, q5, [sp, #0x260]
     198:      	stp	q5, q5, [sp, #0x280]
     19c:      	ldr	d5, [x9]
     1a0:      	mov	w9, #0x100              // =256
     1a4:      	ldrb	w12, [x10, x8]
     1a8:      	shl	v6.2s, v5.2s, #0x2
     1ac:      	add	v5.2s, v5.2s, v1.2s
     1b0:      	subs	x9, x9, #0x2
     1b4:      	dup	v7.2s, w12
     1b8:      	add	x12, x11, x8, lsl #2
     1bc:      	add	x8, x8, #0x1
     1c0:      	and	v6.8b, v6.8b, v2.8b
     1c4:      	and	v7.8b, v7.8b, v0.8b
     1c8:      	neg	v6.2s, v6.2s
     1cc:      	ushl	v6.2s, v7.2s, v6.2s
     1d0:      	ushr	v7.2s, v6.2s, #0x1
     1d4:      	ushr	v16.2s, v6.2s, #0x2
     1d8:      	ushr	v17.2s, v6.2s, #0x3
     1dc:      	bic	v6.2s, #0xfe
     1e0:      	bic	v7.2s, #0x7e
     1e4:      	bic	v16.2s, #0x3e
     1e8:      	bic	v17.2s, #0x1e
     1ec:      	add	v6.2s, v7.2s, v6.2s
     1f0:      	add	v7.2s, v16.2s, v17.2s
     1f4:      	sub	v6.2s, v6.2s, v7.2s
     1f8:      	add	v7.2s, v6.2s, v3.2s
     1fc:      	add	v6.2s, v6.2s, v4.2s
     200:      	cmhi	v16.2s, v3.2s, v7.2s
     204:      	bit	v6.8b, v7.8b, v16.8b
     208:      	mov	s7, v6.s[1]
     20c:      	str	h6, [x12]
     210:      	str	h7, [x12, #0x2]
     214:      	b.ne	0x1a4 <toyos_crypto::mlkem::noise+0x1a4>
     218:      	add	x1, sp, #0xa0
     21c:      	mov	x0, x19
     220:      	mov	w2, #0x200              // =512
     224:      	bl	0x224 <toyos_crypto::mlkem::noise+0x224>
     228:      	stp	xzr, xzr, [sp, #0xa0]
     22c:      	ldr	q0, [sp, #0xa0]
     230:      	str	q0, [sp]
     234:      	stp	xzr, xzr, [sp, #0xa0]
     238:      	ldr	q0, [sp, #0xa0]
     23c:      	str	q0, [sp, #0x10]
     240:      	stp	xzr, xzr, [sp, #0xa0]
     244:      	ldr	q0, [sp, #0xa0]
     248:      	str	q0, [sp, #0x20]
     24c:      	stp	xzr, xzr, [sp, #0xa0]
     250:      	ldr	q0, [sp, #0xa0]
     254:      	str	q0, [sp, #0x30]
     258:      	stp	xzr, xzr, [sp, #0xa0]
     25c:      	ldr	q0, [sp, #0xa0]
     260:      	str	q0, [sp, #0x40]
     264:      	stp	xzr, xzr, [sp, #0xa0]
     268:      	ldr	q0, [sp, #0xa0]
     26c:      	str	q0, [sp, #0x50]
     270:      	stp	xzr, xzr, [sp, #0xa0]
     274:      	ldr	q0, [sp, #0xa0]
     278:      	str	q0, [sp, #0x60]
     27c:      	stp	xzr, xzr, [sp, #0xa0]
     280:      	ldr	q0, [sp, #0xa0]
     284:      	str	q0, [sp, #0x70]
     288:      	add	sp, sp, #0x2a0
     28c:      	ldp	x20, x19, [sp, #0x30]
     290:      	ldr	x28, [sp, #0x10]
     294:      	ldp	x22, x21, [sp, #0x20]
     298:      	ldp	x29, x30, [sp], #0x40
     29c:      	ret
     2a0:      	adrp	x2, 0x0 <toyos_crypto::mlkem::noise>
     2a4:      	add	x2, x2, #0x0
     2a8:      	mov	w1, #0x19               // =25
     2ac:      	bl	0x2ac <toyos_crypto::mlkem::noise+0x2ac>
     2b0:      	brk	#0x1
     2b4:      	mov	x19, x0
     2b8:      	b	0x2cc <toyos_crypto::mlkem::noise+0x2cc>
     2bc:      	b	0x2c0 <toyos_crypto::mlkem::noise+0x2c0>
     2c0:      	mov	x19, x0
     2c4:      	add	x0, sp, #0xa0
     2c8:      	bl	0x2c8 <toyos_crypto::mlkem::noise+0x2c8>
     2cc:      	mov	x0, sp
     2d0:      	bl	0x2d0 <toyos_crypto::mlkem::noise+0x2d0>
     2d4:      	mov	x0, x19
     2d8:      	bl	0x2d8 <toyos_crypto::mlkem::noise+0x2d8>
     2dc:      	bl	0x2dc <toyos_crypto::mlkem::noise+0x2dc>

0000000000000000 <toyos_crypto::mlkem::sample>:
       0:      	stp	x29, x30, [sp, #-0x60]!
       4:      	str	x28, [sp, #0x10]
       8:      	stp	x26, x25, [sp, #0x20]
       c:      	stp	x24, x23, [sp, #0x30]
      10:      	stp	x22, x21, [sp, #0x40]
      14:      	stp	x20, x19, [sp, #0x50]
      18:      	mov	x29, sp
      1c:      	sub	sp, sp, #0x2e0
      20:      	mov	x19, x8
      24:      	mov	w8, #0x20               // =32
      28:      	mov	w9, #0x2                // =2
      2c:      	stp	x0, x8, [sp, #0xe0]
      30:      	add	x8, x29, #0x1c
      34:      	mov	w0, #0xa8               // =168
      38:      	strb	w2, [x29, #0x1c]
      3c:      	add	x2, sp, #0xe0
      40:      	mov	w3, #0x2                // =2
      44:      	strb	w1, [x29, #0x1d]
      48:      	mov	w1, #0x1f               // =31
      4c:      	add	x20, sp, #0x8
      50:      	stp	x8, x9, [sp, #0xf0]
      54:      	add	x8, sp, #0x8
      58:      	add	x21, sp, #0xe0
      5c:      	bl	0x5c <toyos_crypto::mlkem::sample+0x5c>
      60:      	movi	v0.2d, #0000000000000000
      64:      	ldr	x23, [sp, #0xd8]
      68:      	mov	x22, xzr
      6c:      	stp	q0, q0, [sp, #0xe0]
      70:      	stp	q0, q0, [sp, #0x100]
      74:      	stp	q0, q0, [sp, #0x120]
      78:      	stp	q0, q0, [sp, #0x140]
      7c:      	stp	q0, q0, [sp, #0x160]
      80:      	stp	q0, q0, [sp, #0x180]
      84:      	stp	q0, q0, [sp, #0x1a0]
      88:      	stp	q0, q0, [sp, #0x1c0]
      8c:      	stp	q0, q0, [sp, #0x1e0]
      90:      	stp	q0, q0, [sp, #0x200]
      94:      	stp	q0, q0, [sp, #0x220]
      98:      	stp	q0, q0, [sp, #0x240]
      9c:      	stp	q0, q0, [sp, #0x260]
      a0:      	stp	q0, q0, [sp, #0x280]
      a4:      	stp	q0, q0, [sp, #0x2a0]
      a8:      	stp	q0, q0, [sp, #0x2c0]
      ac:      	b	0xb8 <toyos_crypto::mlkem::sample+0xb8>
      b0:      	cmp	x22, #0x100
      b4:      	b.hs	0x1c0 <toyos_crypto::mlkem::sample+0x1c0>
      b8:      	ldr	x8, [sp, #0xd0]
      bc:      	cmp	x23, x8
      c0:      	b.ne	0xe0 <toyos_crypto::mlkem::sample+0xe0>
      c4:      	add	x0, sp, #0x8
      c8:      	bl	0xc8 <toyos_crypto::mlkem::sample+0xc8>
      cc:      	ldr	x8, [sp, #0xd0]
      d0:      	mov	x0, xzr
      d4:      	mov	x23, xzr
      d8:      	str	xzr, [sp, #0xd8]
      dc:      	b	0xec <toyos_crypto::mlkem::sample+0xec>
      e0:      	lsr	x0, x23, #3
      e4:      	cmp	x23, #0xc8
      e8:      	b.hs	0x254 <toyos_crypto::mlkem::sample+0x254>
      ec:      	add	x25, x23, #0x1
      f0:      	ldr	x24, [x20, x0, lsl #3]
      f4:      	cmp	x25, x8
      f8:      	str	x25, [sp, #0xd8]
      fc:      	b.ne	0x11c <toyos_crypto::mlkem::sample+0x11c>
     100:      	add	x0, sp, #0x8
     104:      	bl	0x104 <toyos_crypto::mlkem::sample+0x104>
     108:      	ldr	x8, [sp, #0xd0]
     10c:      	mov	x0, xzr
     110:      	mov	x25, xzr
     114:      	str	xzr, [sp, #0xd8]
     118:      	b	0x128 <toyos_crypto::mlkem::sample+0x128>
     11c:      	lsr	x0, x25, #3
     120:      	cmp	x23, #0xc7
     124:      	b.hs	0x254 <toyos_crypto::mlkem::sample+0x254>
     128:      	add	x9, x25, #0x1
     12c:      	ldr	x26, [x20, x0, lsl #3]
     130:      	cmp	x9, x8
     134:      	str	x9, [sp, #0xd8]
     138:      	b.ne	0x154 <toyos_crypto::mlkem::sample+0x154>
     13c:      	add	x0, sp, #0x8
     140:      	bl	0x140 <toyos_crypto::mlkem::sample+0x140>
     144:      	mov	x0, xzr
     148:      	mov	x9, xzr
     14c:      	str	xzr, [sp, #0xd8]
     150:      	b	0x160 <toyos_crypto::mlkem::sample+0x160>
     154:      	lsr	x0, x9, #3
     158:      	cmp	x25, #0xc7
     15c:      	b.hs	0x254 <toyos_crypto::mlkem::sample+0x254>
     160:      	ubfiz	x8, x23, #3, #3
     164:      	ubfiz	x10, x25, #3, #3
     168:      	add	x23, x9, #0x1
     16c:      	lsr	x11, x24, x8
     170:      	lsr	x8, x26, x10
     174:      	ldr	x10, [x20, x0, lsl #3]
     178:      	str	x23, [sp, #0xd8]
     17c:      	and	w11, w11, #0xff
     180:      	bfi	w11, w8, #8, #4
     184:      	cmp	w11, #0xd01
     188:      	b.hs	0x194 <toyos_crypto::mlkem::sample+0x194>
     18c:      	strh	w11, [x21, x22, lsl #1]
     190:      	add	x22, x22, #0x1
     194:      	ubfiz	x9, x9, #3, #3
     198:      	ubfx	w8, w8, #4, #4
     19c:      	lsr	x9, x10, x9
     1a0:      	bfi	w8, w9, #4, #8
     1a4:      	cmp	w8, #0xd00
     1a8:      	b.hi	0xb0 <toyos_crypto::mlkem::sample+0xb0>
     1ac:      	cmp	x22, #0xff
     1b0:      	b.hi	0xb0 <toyos_crypto::mlkem::sample+0xb0>
     1b4:      	strh	w8, [x21, x22, lsl #1]
     1b8:      	add	x22, x22, #0x1
     1bc:      	b	0xb0 <toyos_crypto::mlkem::sample+0xb0>
     1c0:      	add	x1, sp, #0xe0
     1c4:      	mov	x0, x19
     1c8:      	mov	w2, #0x200              // =512
     1cc:      	bl	0x1cc <toyos_crypto::mlkem::sample+0x1cc>
     1d0:      	str	xzr, [sp, #0x8]
     1d4:      	str	xzr, [sp, #0x10]
     1d8:      	str	xzr, [sp, #0x18]
     1dc:      	str	xzr, [sp, #0x20]
     1e0:      	str	xzr, [sp, #0x28]
     1e4:      	str	xzr, [sp, #0x30]
     1e8:      	str	xzr, [sp, #0x38]
     1ec:      	str	xzr, [sp, #0x40]
     1f0:      	str	xzr, [sp, #0x48]
     1f4:      	str	xzr, [sp, #0x50]
     1f8:      	str	xzr, [sp, #0x58]
     1fc:      	str	xzr, [sp, #0x60]
     200:      	str	xzr, [sp, #0x68]
     204:      	str	xzr, [sp, #0x70]
     208:      	str	xzr, [sp, #0x78]
     20c:      	str	xzr, [sp, #0x80]
     210:      	str	xzr, [sp, #0x88]
     214:      	str	xzr, [sp, #0x90]
     218:      	str	xzr, [sp, #0x98]
     21c:      	str	xzr, [sp, #0xa0]
     220:      	str	xzr, [sp, #0xa8]
     224:      	str	xzr, [sp, #0xb0]
     228:      	str	xzr, [sp, #0xb8]
     22c:      	str	xzr, [sp, #0xc0]
     230:      	str	xzr, [sp, #0xc8]
     234:      	add	sp, sp, #0x2e0
     238:      	ldp	x20, x19, [sp, #0x50]
     23c:      	ldr	x28, [sp, #0x10]
     240:      	ldp	x22, x21, [sp, #0x40]
     244:      	ldp	x24, x23, [sp, #0x30]
     248:      	ldp	x26, x25, [sp, #0x20]
     24c:      	ldp	x29, x30, [sp], #0x60
     250:      	ret
     254:      	adrp	x2, 0x0 <toyos_crypto::mlkem::sample>
     258:      	add	x2, x2, #0x0
     25c:      	mov	w1, #0x19               // =25
     260:      	bl	0x260 <toyos_crypto::mlkem::sample+0x260>
     264:      	brk	#0x1
     268:      	b	0x26c <toyos_crypto::mlkem::sample+0x26c>
     26c:      	mov	x19, x0
     270:      	mov	x8, xzr
     274:      	add	x9, sp, #0xe0
     278:      	mov	x10, x8
     27c:      	add	x8, x8, #0x2
     280:      	cmp	x8, #0x200
     284:      	strh	wzr, [x9, x10]
     288:      	b.ne	0x278 <toyos_crypto::mlkem::sample+0x278>
     28c:      	add	x0, sp, #0x8
     290:      	bl	0x290 <toyos_crypto::mlkem::sample+0x290>
     294:      	mov	x0, x19
     298:      	bl	0x298 <toyos_crypto::mlkem::sample+0x298>
     29c:      	bl	0x29c <toyos_crypto::mlkem::sample+0x29c>

~/.claude/jobs/2280e09e/tmp/scratchpad/agents/mlkem/target-rlib/aarch64-unknown-toyos/toyos/libtoyos_crypto.rlib(toyos_crypto-4ee49e0b7450663d.9f6k7mhywuwm5c8obfrgk4gd2.1wsqjhz.rcgu.o):	file format elf64-littleaarch64

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
      44:      	b.ne	0x214 <<toyos_crypto::keccak::Sponge>::new+0x214>
      48:      	movi	v0.2d, #0000000000000000
      4c:      	stp	xzr, x20, [sp, #0xc0]
      50:      	str	xzr, [sp, #0xd0]
      54:      	stp	q0, q0, [sp]
      58:      	stp	q0, q0, [sp, #0x20]
      5c:      	stp	q0, q0, [sp, #0x40]
      60:      	stp	q0, q0, [sp, #0x60]
      64:      	stp	q0, q0, [sp, #0x80]
      68:      	stp	q0, q0, [sp, #0xa0]
      6c:      	cbz	x3, 0x14c <<toyos_crypto::keccak::Sponge>::new+0x14c>
      70:      	mov	x8, xzr
      74:      	add	x24, x22, x3, lsl #4
      78:      	adrp	x23, 0x0 <<toyos_crypto::keccak::Sponge>::new>
      7c:      	add	x23, x23, #0x0
      80:      	mov	x25, sp
      84:      	b	0x94 <<toyos_crypto::keccak::Sponge>::new+0x94>
      88:      	add	x22, x22, #0x10
      8c:      	cmp	x22, x24
      90:      	b.eq	0x104 <<toyos_crypto::keccak::Sponge>::new+0x104>
      94:      	ldr	x26, [x22, #0x8]
      98:      	cbz	x26, 0x88 <<toyos_crypto::keccak::Sponge>::new+0x88>
      9c:      	ldr	x27, [x22]
      a0:      	b	0xb0 <<toyos_crypto::keccak::Sponge>::new+0xb0>
      a4:      	subs	x26, x26, #0x1
      a8:      	add	x27, x27, #0x1
      ac:      	b.eq	0x88 <<toyos_crypto::keccak::Sponge>::new+0x88>
      b0:      	lsr	x0, x8, #3
      b4:      	cmp	x8, #0xc7
      b8:      	b.hi	0x1f4 <<toyos_crypto::keccak::Sponge>::new+0x1f4>
      bc:      	ubfiz	x8, x8, #3, #3
      c0:      	ldrb	w9, [x27]
      c4:      	lsl	x8, x9, x8
      c8:      	ldr	x9, [x25, x0, lsl #3]
      cc:      	eor	x8, x8, x9
      d0:      	str	x8, [x25, x0, lsl #3]
      d4:      	ldr	x8, [sp, #0xd0]
      d8:      	cmn	x8, #0x1
      dc:      	b.eq	0x1dc <<toyos_crypto::keccak::Sponge>::new+0x1dc>
      e0:      	add	x8, x8, #0x1
      e4:      	cmp	x8, x20
      e8:      	str	x8, [sp, #0xd0]
      ec:      	b.ne	0xa4 <<toyos_crypto::keccak::Sponge>::new+0xa4>
      f0:      	mov	x0, sp
      f4:      	bl	0xf4 <<toyos_crypto::keccak::Sponge>::new+0xf4>
      f8:      	mov	x8, xzr
      fc:      	str	xzr, [sp, #0xd0]
     100:      	b	0xa4 <<toyos_crypto::keccak::Sponge>::new+0xa4>
     104:      	lsr	x0, x8, #3
     108:      	cmp	x8, #0xc8
     10c:      	b.hs	0x1ec <<toyos_crypto::keccak::Sponge>::new+0x1ec>
     110:      	ubfiz	x8, x8, #3, #3
     114:      	mov	x9, sp
     118:      	and	x10, x21, #0xff
     11c:      	ldr	x11, [x9, x0, lsl #3]
     120:      	lsl	x8, x10, x8
     124:      	eor	x8, x8, x11
     128:      	str	x8, [x9, x0, lsl #3]
     12c:      	cbz	x20, 0x204 <<toyos_crypto::keccak::Sponge>::new+0x204>
     130:      	sub	x8, x20, #0x1
     134:      	cmp	x20, #0xc9
     138:      	lsr	x0, x8, #3
     13c:      	b.lo	0x15c <<toyos_crypto::keccak::Sponge>::new+0x15c>
     140:      	adrp	x23, 0x0 <<toyos_crypto::keccak::Sponge>::new>
     144:      	add	x23, x23, #0x0
     148:      	b	0x1f4 <<toyos_crypto::keccak::Sponge>::new+0x1f4>
     14c:      	sub	x8, x20, #0x1
     150:      	and	x9, x21, #0xff
     154:      	lsr	x0, x8, #3
     158:      	str	x9, [sp]
     15c:      	ubfiz	x8, x8, #3, #3
     160:      	mov	w9, #0x80               // =128
     164:      	mov	x10, sp
     168:      	lsl	x8, x9, x8
     16c:      	ldr	x9, [x10, x0, lsl #3]
     170:      	eor	x8, x9, x8
     174:      	str	x8, [x10, x0, lsl #3]
     178:      	mov	x0, sp
     17c:      	bl	0x17c <<toyos_crypto::keccak::Sponge>::new+0x17c>
     180:      	ldp	q0, q1, [sp, #0xa0]
     184:      	ldr	q2, [sp, #0xc0]
     188:      	str	xzr, [x19, #0xd0]
     18c:      	str	q2, [x19, #0xc0]
     190:      	stp	q0, q1, [x19, #0xa0]
     194:      	ldp	q0, q1, [sp, #0x60]
     198:      	stp	q0, q1, [x19, #0x60]
     19c:      	ldp	q2, q0, [sp, #0x80]
     1a0:      	stp	q2, q0, [x19, #0x80]
     1a4:      	ldp	q1, q0, [sp, #0x20]
     1a8:      	stp	q1, q0, [x19, #0x20]
     1ac:      	ldp	q2, q0, [sp, #0x40]
     1b0:      	stp	q2, q0, [x19, #0x40]
     1b4:      	ldp	q1, q0, [sp]
     1b8:      	stp	q1, q0, [x19]
     1bc:      	ldp	x20, x19, [sp, #0x130]
     1c0:      	ldp	x22, x21, [sp, #0x120]
     1c4:      	ldp	x24, x23, [sp, #0x110]
     1c8:      	ldp	x26, x25, [sp, #0x100]
     1cc:      	ldp	x28, x27, [sp, #0xf0]
     1d0:      	ldp	x29, x30, [sp, #0xe0]
     1d4:      	add	sp, sp, #0x140
     1d8:      	ret
     1dc:      	adrp	x0, 0x0 <<toyos_crypto::keccak::Sponge>::new>
     1e0:      	add	x0, x0, #0x0
     1e4:      	bl	0x1e4 <<toyos_crypto::keccak::Sponge>::new+0x1e4>
     1e8:      	b	0x210 <<toyos_crypto::keccak::Sponge>::new+0x210>
     1ec:      	adrp	x23, 0x0 <<toyos_crypto::keccak::Sponge>::new>
     1f0:      	add	x23, x23, #0x0
     1f4:      	mov	w1, #0x19               // =25
     1f8:      	mov	x2, x23
     1fc:      	bl	0x1fc <<toyos_crypto::keccak::Sponge>::new+0x1fc>
     200:      	b	0x210 <<toyos_crypto::keccak::Sponge>::new+0x210>
     204:      	adrp	x0, 0x0 <<toyos_crypto::keccak::Sponge>::new>
     208:      	add	x0, x0, #0x0
     20c:      	bl	0x20c <<toyos_crypto::keccak::Sponge>::new+0x20c>
     210:      	brk	#0x1
     214:      	adrp	x0, 0x0 <<toyos_crypto::keccak::Sponge>::new>
     218:      	add	x0, x0, #0x0
     21c:      	adrp	x2, 0x0 <<toyos_crypto::keccak::Sponge>::new>
     220:      	add	x2, x2, #0x0
     224:      	mov	w1, #0x30               // =48
     228:      	bl	0x228 <<toyos_crypto::keccak::Sponge>::new+0x228>
     22c:      	mov	x19, x0
     230:      	mov	x0, sp
     234:      	bl	0x234 <<toyos_crypto::keccak::Sponge>::new+0x234>
     238:      	mov	x0, x19
     23c:      	bl	0x23c <<toyos_crypto::keccak::Sponge>::new+0x23c>
     240:      	bl	0x240 <<toyos_crypto::keccak::Sponge>::new+0x240>

0000000000000000 <<toyos_crypto::keccak::Sponge>::read>:
       0:      	stp	x29, x30, [sp, #-0x30]!
       4:      	str	x21, [sp, #0x10]
       8:      	stp	x20, x19, [sp, #0x20]
       c:      	mov	x29, sp
      10:      	cbz	x2, 0x84 <<toyos_crypto::keccak::Sponge>::read+0x84>
      14:      	ldr	x8, [x0, #0xd0]
      18:      	mov	x19, x2
      1c:      	mov	x21, x1
      20:      	mov	x20, x0
      24:      	b	0x5c <<toyos_crypto::keccak::Sponge>::read+0x5c>
      28:      	mov	x0, x20
      2c:      	bl	0x2c <<toyos_crypto::keccak::Sponge>::read+0x2c>
      30:      	mov	x0, xzr
      34:      	mov	x8, xzr
      38:      	str	xzr, [x20, #0xd0]
      3c:      	ldr	x9, [x20, x0, lsl #3]
      40:      	ubfiz	x10, x8, #3, #3
      44:      	add	x8, x8, #0x1
      48:      	subs	x19, x19, #0x1
      4c:      	str	x8, [x20, #0xd0]
      50:      	lsr	x9, x9, x10
      54:      	strb	w9, [x21], #0x1
      58:      	b.eq	0x84 <<toyos_crypto::keccak::Sponge>::read+0x84>
      5c:      	ldr	x9, [x20, #0xc8]
      60:      	cmp	x8, x9
      64:      	b.eq	0x28 <<toyos_crypto::keccak::Sponge>::read+0x28>
      68:      	lsr	x0, x8, #3
      6c:      	cmp	x8, #0xc8
      70:      	b.lo	0x3c <<toyos_crypto::keccak::Sponge>::read+0x3c>
      74:      	adrp	x2, 0x0 <<toyos_crypto::keccak::Sponge>::read>
      78:      	add	x2, x2, #0x0
      7c:      	mov	w1, #0x19               // =25
      80:      	bl	0x80 <<toyos_crypto::keccak::Sponge>::read+0x80>
      84:      	ldp	x20, x19, [sp, #0x20]
      88:      	ldr	x21, [sp, #0x10]
      8c:      	ldp	x29, x30, [sp], #0x30
      90:      	ret

0000000000000000 <<toyos_crypto::keccak::Sponge>::permute (.llvm.3804133136662572463)>:
       0:      	stp	x29, x30, [sp, #-0x60]!
       4:      	stp	x28, x27, [sp, #0x10]
       8:      	stp	x26, x25, [sp, #0x20]
       c:      	stp	x24, x23, [sp, #0x30]
      10:      	stp	x22, x21, [sp, #0x40]
      14:      	stp	x20, x19, [sp, #0x50]
      18:      	mov	x29, sp
      1c:      	sub	sp, sp, #0x300
      20:      	adrp	x8, 0x0 <<toyos_crypto::keccak::Sponge>::permute (.llvm.3804133136662572463)>
      24:      	add	x8, x8, #0x0
      28:      	sub	x9, x29, #0xd8
      2c:      	ldp	q0, q1, [x8, #0x80]
      30:      	ldr	x19, [x0, #0xc0]
      34:      	ldp	x1, x10, [x0]
      38:      	mov	w13, #0x10              // =16
      3c:      	ldp	x16, x4, [x0, #0x50]
      40:      	stp	xzr, xzr, [sp, #0x128]
      44:      	stp	q0, q1, [x9, #0x90]
      48:      	ldp	q2, q0, [x8, #0xa0]
      4c:      	ldp	x7, x20, [x0, #0x80]
      50:      	stp	xzr, xzr, [sp, #0x118]
      54:      	stp	xzr, xzr, [sp, #0x150]
      58:      	ldp	x23, x6, [x0, #0xb0]
      5c:      	stp	q2, q0, [x9, #0xb0]
      60:      	ldp	q1, q0, [x8, #0x40]
      64:      	stp	xzr, xzr, [sp, #0x140]
      68:      	str	xzr, [sp, #0x138]
      6c:      	stp	q1, q0, [x9, #0x50]
      70:      	ldp	q2, q0, [x8, #0x60]
      74:      	stp	xzr, xzr, [x29, #-0xe8]
      78:      	stp	xzr, xzr, [x29, #-0xf8]
      7c:      	stp	q2, q0, [x9, #0x70]
      80:      	ldp	q1, q0, [x8]
      84:      	stur	xzr, [x29, #-0x100]
      88:      	stp	xzr, xzr, [sp, #0x1f0]
      8c:      	stp	q1, q0, [x9, #0x10]
      90:      	ldp	q2, q0, [x8, #0x20]
      94:      	ldp	x8, x3, [x0, #0xa0]
      98:      	stp	xzr, xzr, [sp, #0x1e0]
      9c:      	stp	xzr, xzr, [sp, #0x1c8]
      a0:      	str	q2, [x9, #0x30]
      a4:      	stp	x8, xzr, [sp, #0x108]
      a8:      	ldp	x21, x8, [x0, #0x30]
      ac:      	str	q0, [x9, #0x40]
      b0:      	stp	x8, x10, [sp, #0xe8]
      b4:      	ldp	x11, x8, [x0, #0x60]
      b8:      	ldp	x10, x17, [x0, #0x10]
      bc:      	stp	x8, x11, [sp, #0xf8]
      c0:      	ldp	x8, x15, [x0, #0x20]
      c4:      	stp	x8, x10, [sp, #0xb8]
      c8:      	ldp	x10, x8, [x0, #0x40]
      cc:      	stp	x10, x8, [sp, #0xc8]
      d0:      	ldp	x10, x26, [x0, #0x70]
      d4:      	ldp	x14, x8, [x0, #0x90]
      d8:      	stp	x8, x10, [sp, #0xd8]
      dc:      	ldp	x27, x8, [sp, #0x100]
      e0:      	eor	x9, x16, x15
      e4:      	ldr	x18, [sp, #0xe8]
      e8:      	eor	x10, x7, x3
      ec:      	eor	x11, x4, x21
      f0:      	mov	x25, x26
      f4:      	stp	x6, x23, [sp, #0xa0]
      f8:      	ldr	x30, [sp, #0xf8]
      fc:      	eor	x8, x26, x8
     100:      	ldp	x22, x24, [sp, #0xb8]
     104:      	eor	x8, x8, x9
     108:      	eor	x9, x10, x11
     10c:      	eor	x10, x20, x23
     110:      	eor	x11, x27, x18
     114:      	mov	x23, x15
     118:      	stp	x3, x13, [sp, #0x88]
     11c:      	eor	x10, x10, x11
     120:      	mov	x11, x6
     124:      	mov	x6, x14
     128:      	eor	x11, x14, x11
     12c:      	ldp	x14, x2, [sp, #0xc8]
     130:      	ldp	x26, x15, [sp, #0xd8]
     134:      	str	x19, [sp, #0x98]
     138:      	mov	x5, x4
     13c:      	mov	x4, x16
     140:      	eor	x8, x8, x1
     144:      	eor	x12, x30, x14
     148:      	eor	x10, x10, x24
     14c:      	eor	x3, x26, x19
     150:      	eor	x16, x15, x2
     154:      	ldr	x19, [sp, #0xf0]
     158:      	eor	x11, x11, x12
     15c:      	eor	x12, x3, x16
     160:      	mov	x16, x17
     164:      	eor	x9, x9, x19
     168:      	eor	x11, x11, x17
     16c:      	eor	x12, x12, x22
     170:      	eor	x28, x12, x9, ror #63
     174:      	eor	x17, x8, x10, ror #63
     178:      	eor	x3, x9, x11, ror #63
     17c:      	sub	x9, x29, #0xd8
     180:      	eor	x12, x10, x12, ror #63
     184:      	eor	x10, x11, x8, ror #63
     188:      	ldr	x9, [x9, x13]
     18c:      	eor	x8, x17, x19
     190:      	eor	x13, x28, x1
     194:      	stp	x12, x3, [sp, #0x48]
     198:      	str	x9, [sp, #0xb0]
     19c:      	eor	x9, x3, x24
     1a0:      	ror	x24, x8, #0x3f
     1a4:      	eor	x8, x12, x16
     1a8:      	ror	x11, x9, #0x2
     1ac:      	eor	x9, x28, x23
     1b0:      	ror	x16, x8, #0x24
     1b4:      	eor	x8, x10, x22
     1b8:      	ror	x23, x9, #0x1c
     1bc:      	ror	x22, x8, #0x25
     1c0:      	eor	x8, x17, x21
     1c4:      	eor	x9, x12, x14
     1c8:      	ror	x19, x8, #0x14
     1cc:      	eor	x8, x3, x18
     1d0:      	stp	x11, x23, [sp, #0x20]
     1d4:      	ror	x18, x8, #0x3a
     1d8:      	eor	x8, x10, x2
     1dc:      	ror	x11, x9, #0x9
     1e0:      	ror	x1, x8, #0x2c
     1e4:      	eor	x8, x28, x4
     1e8:      	eor	x9, x17, x5
     1ec:      	ror	x4, x8, #0x3d
     1f0:      	eor	x8, x3, x27
     1f4:      	ror	x2, x9, #0x36
     1f8:      	ror	x21, x8, #0x15
     1fc:      	eor	x8, x12, x30
     200:      	eor	x9, x10, x15
     204:      	ror	x5, x8, #0x27
     208:      	ror	x8, x9, #0x19
     20c:      	eor	x9, x3, x20
     210:      	ror	x27, x9, #0x31
     214:      	eor	x9, x10, x26
     218:      	str	x28, [sp, #0x78]
     21c:      	stp	x8, x11, [sp, #0x10]
     220:      	ldr	x11, [sp, #0x108]
     224:      	eor	x8, x28, x25
     228:      	ror	x15, x8, #0x17
     22c:      	eor	x8, x17, x7
     230:      	stp	x10, x21, [sp, #0x38]
     234:      	eor	x11, x28, x11
     238:      	ror	x25, x8, #0x13
     23c:      	eor	x8, x12, x6
     240:      	ror	x30, x11, #0x2e
     244:      	ldp	x14, x11, [sp, #0xa0]
     248:      	ror	x28, x9, #0x38
     24c:      	ldr	x9, [sp, #0x88]
     250:      	ror	x8, x8, #0x2b
     254:      	str	x17, [sp, #0x68]
     258:      	bic	x7, x25, x4
     25c:      	eor	x12, x12, x14
     260:      	ldr	x14, [sp, #0x98]
     264:      	eor	x9, x17, x9
     268:      	bic	x17, x21, x19
     26c:      	eor	x11, x3, x11
     270:      	str	x19, [sp, #0x88]
     274:      	eor	x14, x10, x14
     278:      	ldr	x10, [sp, #0xb0]
     27c:      	str	x13, [sp, #0xb0]
     280:      	ror	x11, x11, #0x3
     284:      	stp	x16, x24, [sp, #0xa0]
     288:      	ror	x12, x12, #0x8
     28c:      	eor	x6, x10, x13
     290:      	ror	x10, x14, #0x32
     294:      	str	x4, [sp, #0x60]
     298:      	eor	x14, x17, x6
     29c:      	bic	x6, x19, x13
     2a0:      	str	x5, [sp, #0x30]
     2a4:      	str	x14, [sp, #0x8]
     2a8:      	bic	x14, x8, x21
     2ac:      	bic	x17, x13, x10
     2b0:      	eor	x14, x19, x14
     2b4:      	bic	x19, x11, x25
     2b8:      	str	x18, [sp, #0x80]
     2bc:      	str	x14, [sp, #0xf0]
     2c0:      	bic	x14, x10, x8
     2c4:      	ror	x9, x9, #0x3e
     2c8:      	eor	x13, x14, x21
     2cc:      	eor	x21, x7, x1
     2d0:      	bic	x7, x1, x16
     2d4:      	str	x13, [sp, #0xc0]
     2d8:      	eor	x13, x17, x8
     2dc:      	eor	x14, x19, x4
     2e0:      	str	x13, [sp]
     2e4:      	eor	x13, x6, x10
     2e8:      	bic	x6, x4, x1
     2ec:      	eor	x3, x6, x16
     2f0:      	bic	x6, x16, x11
     2f4:      	str	x13, [sp, #0xb8]
     2f8:      	eor	x13, x25, x6
     2fc:      	bic	x19, x5, x18
     300:      	str	x14, [sp, #0xe8]
     304:      	str	x13, [sp, #0xc8]
     308:      	eor	x13, x7, x11
     30c:      	bic	x7, x30, x28
     310:      	eor	x16, x24, x19
     314:      	bic	x6, x28, x5
     318:      	bic	x19, x24, x30
     31c:      	eor	x14, x7, x5
     320:      	eor	x4, x6, x18
     324:      	bic	x6, x18, x24
     328:      	str	x14, [sp, #0x100]
     32c:      	eor	x14, x19, x28
     330:      	bic	x7, x2, x23
     334:      	ldp	x5, x18, [sp, #0x10]
     338:      	str	x14, [sp, #0xf8]
     33c:      	bic	x19, x27, x2
     340:      	eor	x14, x6, x30
     344:      	ldr	x24, [sp, #0x20]
     348:      	str	x14, [sp, #0xe0]
     34c:      	eor	x26, x7, x22
     350:      	eor	x7, x19, x23
     354:      	bic	x6, x12, x27
     358:      	bic	x14, x22, x12
     35c:      	bic	x19, x23, x22
     360:      	str	x1, [sp, #0x70]
     364:      	eor	x20, x2, x6
     368:      	eor	x1, x14, x27
     36c:      	str	x2, [sp, #0x58]
     370:      	eor	x14, x19, x12
     374:      	bic	x6, x5, x18
     378:      	mov	x2, x15
     37c:      	bic	x15, x15, x5
     380:      	str	x13, [sp, #0xd0]
     384:      	ldr	x13, [sp, #0x90]
     388:      	str	x14, [sp, #0xd8]
     38c:      	eor	x14, x6, x24
     390:      	eor	x17, x15, x18
     394:      	bic	x19, x9, x2
     398:      	bic	x15, x18, x24
     39c:      	str	x14, [sp, #0x108]
     3a0:      	eor	x23, x19, x5
     3a4:      	mov	x14, x1
     3a8:      	eor	x19, x9, x15
     3ac:      	mov	x15, x3
     3b0:      	mov	x3, x17
     3b4:      	ldp	x17, x1, [sp]
     3b8:      	add	x13, x13, #0x8
     3bc:      	bic	x6, x24, x9
     3c0:      	cmp	x13, #0xd0
     3c4:      	str	x22, [sp, #0x98]
     3c8:      	eor	x6, x6, x2
     3cc:      	b.ne	0xdc <<toyos_crypto::keccak::Sponge>::permute (.llvm.3804133136662572463)+0xdc>
     3d0:      	stp	x10, x8, [x29, #-0x100]
     3d4:      	ldr	x8, [sp, #0xf0]
     3d8:      	str	x9, [sp, #0x160]
     3dc:      	stp	x1, x8, [x0]
     3e0:      	ldp	x8, x9, [sp, #0xb8]
     3e4:      	stp	x11, x25, [sp, #0x1d8]
     3e8:      	stp	x12, x27, [sp, #0x188]
     3ec:      	stp	x8, x15, [x0, #0x20]
     3f0:      	ldr	x8, [sp, #0xe8]
     3f4:      	stp	x9, x17, [x0, #0x10]
     3f8:      	stp	x21, x8, [x0, #0x30]
     3fc:      	ldp	x9, x8, [sp, #0xc8]
     400:      	stp	x30, x28, [sp, #0x1b0]
     404:      	stp	x16, x4, [x0, #0x50]
     408:      	stp	x9, x8, [x0, #0x40]
     40c:      	ldp	x8, x9, [sp, #0xf8]
     410:      	stp	x7, x20, [x0, #0x80]
     414:      	stp	x23, x6, [x0, #0xb0]
     418:      	stp	x9, x8, [x0, #0x60]
     41c:      	ldp	x8, x9, [sp, #0xd8]
     420:      	str	x19, [x0, #0xc0]
     424:      	stp	x18, x24, [sp, #0x178]
     428:      	stp	x14, x8, [x0, #0x90]
     42c:      	ldr	x8, [sp, #0x108]
     430:      	stp	x9, x26, [x0, #0x70]
     434:      	ldr	x9, [sp, #0x78]
     438:      	stp	x8, x3, [x0, #0xa0]
     43c:      	ldr	x8, [sp, #0x68]
     440:      	stp	x2, x5, [sp, #0x168]
     444:      	stp	x8, x9, [sp, #0x150]
     448:      	ldp	x8, x9, [sp, #0x48]
     44c:      	stp	x8, x9, [sp, #0x140]
     450:      	ldr	x8, [sp, #0x38]
     454:      	ldp	x10, x9, [sp, #0xa8]
     458:      	str	x8, [sp, #0x138]
     45c:      	ldp	x8, x11, [sp, #0x98]
     460:      	str	x8, [sp, #0x1a8]
     464:      	ldr	x8, [sp, #0x28]
     468:      	str	x8, [sp, #0x1a0]
     46c:      	ldr	x8, [sp, #0x88]
     470:      	stp	x8, x9, [x29, #-0xe8]
     474:      	ldr	x8, [sp, #0x80]
     478:      	stp	x8, x10, [sp, #0x1c8]
     47c:      	ldr	x8, [sp, #0x70]
     480:      	stp	x8, x11, [sp, #0x1f0]
     484:      	ldp	x8, x9, [sp, #0x58]
     488:      	str	x8, [sp, #0x198]
     48c:      	ldr	x8, [sp, #0x40]
     490:      	str	x9, [sp, #0x1e8]
     494:      	stur	x8, [x29, #-0xf0]
     498:      	ldr	x8, [sp, #0x30]
     49c:      	str	x8, [sp, #0x1c0]
     4a0:      	str	xzr, [sp, #0x130]
     4a4:      	str	xzr, [sp, #0x128]
     4a8:      	str	xzr, [sp, #0x120]
     4ac:      	str	xzr, [sp, #0x118]
     4b0:      	str	xzr, [sp, #0x110]
     4b4:      	str	xzr, [sp, #0x158]
     4b8:      	str	xzr, [sp, #0x150]
     4bc:      	str	xzr, [sp, #0x148]
     4c0:      	str	xzr, [sp, #0x140]
     4c4:      	str	xzr, [sp, #0x138]
     4c8:      	stur	xzr, [x29, #-0xe0]
     4cc:      	stur	xzr, [x29, #-0xe8]
     4d0:      	stur	xzr, [x29, #-0xf0]
     4d4:      	stur	xzr, [x29, #-0xf8]
     4d8:      	stur	xzr, [x29, #-0x100]
     4dc:      	str	xzr, [sp, #0x1f8]
     4e0:      	str	xzr, [sp, #0x1f0]
     4e4:      	str	xzr, [sp, #0x1e8]
     4e8:      	str	xzr, [sp, #0x1e0]
     4ec:      	str	xzr, [sp, #0x1d8]
     4f0:      	str	xzr, [sp, #0x1d0]
     4f4:      	str	xzr, [sp, #0x1c8]
     4f8:      	str	xzr, [sp, #0x1c0]
     4fc:      	str	xzr, [sp, #0x1b8]
     500:      	str	xzr, [sp, #0x1b0]
     504:      	str	xzr, [sp, #0x1a8]
     508:      	str	xzr, [sp, #0x1a0]
     50c:      	str	xzr, [sp, #0x198]
     510:      	str	xzr, [sp, #0x190]
     514:      	str	xzr, [sp, #0x188]
     518:      	str	xzr, [sp, #0x180]
     51c:      	str	xzr, [sp, #0x178]
     520:      	str	xzr, [sp, #0x170]
     524:      	str	xzr, [sp, #0x168]
     528:      	str	xzr, [sp, #0x160]
     52c:      	add	sp, sp, #0x300
     530:      	ldp	x20, x19, [sp, #0x50]
     534:      	ldp	x22, x21, [sp, #0x40]
     538:      	ldp	x24, x23, [sp, #0x30]
     53c:      	ldp	x26, x25, [sp, #0x20]
     540:      	ldp	x28, x27, [sp, #0x10]
     544:      	ldp	x29, x30, [sp], #0x60
     548:      	ret

0000000000000000 <toyos_crypto::keccak::g>:
       0:      	sub	sp, sp, #0x160
       4:      	stp	x29, x30, [sp, #0x120]
       8:      	str	x28, [sp, #0x130]
       c:      	stp	x22, x21, [sp, #0x140]
      10:      	stp	x20, x19, [sp, #0x150]
      14:      	add	x29, sp, #0x120
      18:      	movi	v0.2d, #0000000000000000
      1c:      	mov	x3, x1
      20:      	mov	x2, x0
      24:      	mov	x19, x8
      28:      	add	x8, sp, #0x48
      2c:      	mov	w0, #0x48               // =72
      30:      	mov	w1, #0x6                // =6
      34:      	add	x20, sp, #0x48
      38:      	stp	q0, q0, [sp]
      3c:      	stp	q0, q0, [sp, #0x20]
      40:      	bl	0x40 <toyos_crypto::keccak::g+0x40>
      44:      	ldr	x8, [sp, #0x118]
      48:      	mov	x22, xzr
      4c:      	mov	x21, sp
      50:      	b	0x90 <toyos_crypto::keccak::g+0x90>
      54:      	add	x0, sp, #0x48
      58:      	bl	0x58 <toyos_crypto::keccak::g+0x58>
      5c:      	mov	x0, xzr
      60:      	mov	x8, xzr
      64:      	str	xzr, [sp, #0x118]
      68:      	ldr	x9, [x20, x0, lsl #3]
      6c:      	ubfiz	x10, x8, #3, #3
      70:      	add	x11, x22, #0x1
      74:      	add	x8, x8, #0x1
      78:      	cmp	x11, #0x40
      7c:      	lsr	x9, x9, x10
      80:      	str	x8, [sp, #0x118]
      84:      	strb	w9, [x21, x22]
      88:      	mov	x22, x11
      8c:      	b.eq	0xbc <toyos_crypto::keccak::g+0xbc>
      90:      	ldr	x9, [sp, #0x110]
      94:      	cmp	x8, x9
      98:      	b.eq	0x54 <toyos_crypto::keccak::g+0x54>
      9c:      	lsr	x0, x8, #3
      a0:      	cmp	x8, #0xc8
      a4:      	b.lo	0x68 <toyos_crypto::keccak::g+0x68>
      a8:      	adrp	x2, 0x0 <toyos_crypto::keccak::g>
      ac:      	add	x2, x2, #0x0
      b0:      	mov	w1, #0x19               // =25
      b4:      	bl	0xb4 <toyos_crypto::keccak::g+0xb4>
      b8:      	brk	#0x1
      bc:      	str	xzr, [sp, #0x48]
      c0:      	str	xzr, [sp, #0x50]
      c4:      	str	xzr, [sp, #0x58]
      c8:      	str	xzr, [sp, #0x60]
      cc:      	str	xzr, [sp, #0x68]
      d0:      	str	xzr, [sp, #0x70]
      d4:      	str	xzr, [sp, #0x78]
      d8:      	str	xzr, [sp, #0x80]
      dc:      	str	xzr, [sp, #0x88]
      e0:      	str	xzr, [sp, #0x90]
      e4:      	str	xzr, [sp, #0x98]
      e8:      	str	xzr, [sp, #0xa0]
      ec:      	str	xzr, [sp, #0xa8]
      f0:      	str	xzr, [sp, #0xb0]
      f4:      	str	xzr, [sp, #0xb8]
      f8:      	str	xzr, [sp, #0xc0]
      fc:      	str	xzr, [sp, #0xc8]
     100:      	str	xzr, [sp, #0xd0]
     104:      	str	xzr, [sp, #0xd8]
     108:      	str	xzr, [sp, #0xe0]
     10c:      	str	xzr, [sp, #0xe8]
     110:      	str	xzr, [sp, #0xf0]
     114:      	str	xzr, [sp, #0xf8]
     118:      	str	xzr, [sp, #0x100]
     11c:      	str	xzr, [sp, #0x108]
     120:      	ldp	q0, q1, [sp]
     124:      	stp	q0, q1, [x19]
     128:      	ldp	q2, q0, [sp, #0x20]
     12c:      	stp	q2, q0, [x19, #0x20]
     130:      	ldp	x20, x19, [sp, #0x150]
     134:      	ldr	x28, [sp, #0x130]
     138:      	ldp	x22, x21, [sp, #0x140]
     13c:      	ldp	x29, x30, [sp, #0x120]
     140:      	add	sp, sp, #0x160
     144:      	ret
     148:      	mov	x19, x0
     14c:      	add	x0, sp, #0x48
     150:      	bl	0x150 <toyos_crypto::keccak::g+0x150>
     154:      	mov	x0, x19
     158:      	bl	0x158 <toyos_crypto::keccak::g+0x158>
     15c:      	bl	0x15c <toyos_crypto::keccak::g+0x15c>

0000000000000000 <toyos_crypto::keccak::h>:
       0:      	sub	sp, sp, #0x140
       4:      	stp	x29, x30, [sp, #0x100]
       8:      	str	x28, [sp, #0x110]
       c:      	stp	x22, x21, [sp, #0x120]
      10:      	stp	x20, x19, [sp, #0x130]
      14:      	add	x29, sp, #0x100
      18:      	movi	v0.2d, #0000000000000000
      1c:      	mov	x3, x1
      20:      	mov	x2, x0
      24:      	mov	x19, x8
      28:      	add	x8, sp, #0x28
      2c:      	mov	w0, #0x88               // =136
      30:      	mov	w1, #0x6                // =6
      34:      	add	x20, sp, #0x28
      38:      	stp	q0, q0, [sp]
      3c:      	bl	0x3c <toyos_crypto::keccak::h+0x3c>
      40:      	ldr	x8, [sp, #0xf8]
      44:      	mov	x22, xzr
      48:      	mov	x21, sp
      4c:      	b	0x8c <toyos_crypto::keccak::h+0x8c>
      50:      	add	x0, sp, #0x28
      54:      	bl	0x54 <toyos_crypto::keccak::h+0x54>
      58:      	mov	x0, xzr
      5c:      	mov	x8, xzr
      60:      	str	xzr, [sp, #0xf8]
      64:      	ldr	x9, [x20, x0, lsl #3]
      68:      	ubfiz	x10, x8, #3, #3
      6c:      	add	x11, x22, #0x1
      70:      	add	x8, x8, #0x1
      74:      	cmp	x11, #0x20
      78:      	lsr	x9, x9, x10
      7c:      	str	x8, [sp, #0xf8]
      80:      	strb	w9, [x21, x22]
      84:      	mov	x22, x11
      88:      	b.eq	0xb8 <toyos_crypto::keccak::h+0xb8>
      8c:      	ldr	x9, [sp, #0xf0]
      90:      	cmp	x8, x9
      94:      	b.eq	0x50 <toyos_crypto::keccak::h+0x50>
      98:      	lsr	x0, x8, #3
      9c:      	cmp	x8, #0xc8
      a0:      	b.lo	0x64 <toyos_crypto::keccak::h+0x64>
      a4:      	adrp	x2, 0x0 <toyos_crypto::keccak::h>
      a8:      	add	x2, x2, #0x0
      ac:      	mov	w1, #0x19               // =25
      b0:      	bl	0xb0 <toyos_crypto::keccak::h+0xb0>
      b4:      	brk	#0x1
      b8:      	str	xzr, [sp, #0x28]
      bc:      	str	xzr, [sp, #0x30]
      c0:      	str	xzr, [sp, #0x38]
      c4:      	str	xzr, [sp, #0x40]
      c8:      	str	xzr, [sp, #0x48]
      cc:      	str	xzr, [sp, #0x50]
      d0:      	str	xzr, [sp, #0x58]
      d4:      	str	xzr, [sp, #0x60]
      d8:      	str	xzr, [sp, #0x68]
      dc:      	str	xzr, [sp, #0x70]
      e0:      	str	xzr, [sp, #0x78]
      e4:      	str	xzr, [sp, #0x80]
      e8:      	str	xzr, [sp, #0x88]
      ec:      	str	xzr, [sp, #0x90]
      f0:      	str	xzr, [sp, #0x98]
      f4:      	str	xzr, [sp, #0xa0]
      f8:      	str	xzr, [sp, #0xa8]
      fc:      	str	xzr, [sp, #0xb0]
     100:      	str	xzr, [sp, #0xb8]
     104:      	str	xzr, [sp, #0xc0]
     108:      	str	xzr, [sp, #0xc8]
     10c:      	str	xzr, [sp, #0xd0]
     110:      	str	xzr, [sp, #0xd8]
     114:      	str	xzr, [sp, #0xe0]
     118:      	str	xzr, [sp, #0xe8]
     11c:      	ldp	q0, q1, [sp]
     120:      	stp	q0, q1, [x19]
     124:      	ldp	x20, x19, [sp, #0x130]
     128:      	ldr	x28, [sp, #0x110]
     12c:      	ldp	x22, x21, [sp, #0x120]
     130:      	ldp	x29, x30, [sp, #0x100]
     134:      	add	sp, sp, #0x140
     138:      	ret
     13c:      	mov	x19, x0
     140:      	add	x0, sp, #0x28
     144:      	bl	0x144 <toyos_crypto::keccak::h+0x144>
     148:      	mov	x0, x19
     14c:      	bl	0x14c <toyos_crypto::keccak::h+0x14c>
     150:      	bl	0x150 <toyos_crypto::keccak::h+0x150>

0000000000000000 <toyos_crypto::keccak::j>:
       0:      	sub	sp, sp, #0x140
       4:      	stp	x29, x30, [sp, #0x100]
       8:      	str	x28, [sp, #0x110]
       c:      	stp	x22, x21, [sp, #0x120]
      10:      	stp	x20, x19, [sp, #0x130]
      14:      	add	x29, sp, #0x100
      18:      	movi	v0.2d, #0000000000000000
      1c:      	mov	x3, x1
      20:      	mov	x2, x0
      24:      	mov	x19, x8
      28:      	add	x8, sp, #0x28
      2c:      	mov	w0, #0x88               // =136
      30:      	mov	w1, #0x1f               // =31
      34:      	add	x20, sp, #0x28
      38:      	stp	q0, q0, [sp]
      3c:      	bl	0x3c <toyos_crypto::keccak::j+0x3c>
      40:      	ldr	x8, [sp, #0xf8]
      44:      	mov	x22, xzr
      48:      	mov	x21, sp
      4c:      	b	0x8c <toyos_crypto::keccak::j+0x8c>
      50:      	add	x0, sp, #0x28
      54:      	bl	0x54 <toyos_crypto::keccak::j+0x54>
      58:      	mov	x0, xzr
      5c:      	mov	x8, xzr
      60:      	str	xzr, [sp, #0xf8]
      64:      	ldr	x9, [x20, x0, lsl #3]
      68:      	ubfiz	x10, x8, #3, #3
      6c:      	add	x11, x22, #0x1
      70:      	add	x8, x8, #0x1
      74:      	cmp	x11, #0x20
      78:      	lsr	x9, x9, x10
      7c:      	str	x8, [sp, #0xf8]
      80:      	strb	w9, [x21, x22]
      84:      	mov	x22, x11
      88:      	b.eq	0xb8 <toyos_crypto::keccak::j+0xb8>
      8c:      	ldr	x9, [sp, #0xf0]
      90:      	cmp	x8, x9
      94:      	b.eq	0x50 <toyos_crypto::keccak::j+0x50>
      98:      	lsr	x0, x8, #3
      9c:      	cmp	x8, #0xc8
      a0:      	b.lo	0x64 <toyos_crypto::keccak::j+0x64>
      a4:      	adrp	x2, 0x0 <toyos_crypto::keccak::j>
      a8:      	add	x2, x2, #0x0
      ac:      	mov	w1, #0x19               // =25
      b0:      	bl	0xb0 <toyos_crypto::keccak::j+0xb0>
      b4:      	brk	#0x1
      b8:      	str	xzr, [sp, #0x28]
      bc:      	str	xzr, [sp, #0x30]
      c0:      	str	xzr, [sp, #0x38]
      c4:      	str	xzr, [sp, #0x40]
      c8:      	str	xzr, [sp, #0x48]
      cc:      	str	xzr, [sp, #0x50]
      d0:      	str	xzr, [sp, #0x58]
      d4:      	str	xzr, [sp, #0x60]
      d8:      	str	xzr, [sp, #0x68]
      dc:      	str	xzr, [sp, #0x70]
      e0:      	str	xzr, [sp, #0x78]
      e4:      	str	xzr, [sp, #0x80]
      e8:      	str	xzr, [sp, #0x88]
      ec:      	str	xzr, [sp, #0x90]
      f0:      	str	xzr, [sp, #0x98]
      f4:      	str	xzr, [sp, #0xa0]
      f8:      	str	xzr, [sp, #0xa8]
      fc:      	str	xzr, [sp, #0xb0]
     100:      	str	xzr, [sp, #0xb8]
     104:      	str	xzr, [sp, #0xc0]
     108:      	str	xzr, [sp, #0xc8]
     10c:      	str	xzr, [sp, #0xd0]
     110:      	str	xzr, [sp, #0xd8]
     114:      	str	xzr, [sp, #0xe0]
     118:      	str	xzr, [sp, #0xe8]
     11c:      	ldp	q0, q1, [sp]
     120:      	stp	q0, q1, [x19]
     124:      	ldp	x20, x19, [sp, #0x130]
     128:      	ldr	x28, [sp, #0x110]
     12c:      	ldp	x22, x21, [sp, #0x120]
     130:      	ldp	x29, x30, [sp, #0x100]
     134:      	add	sp, sp, #0x140
     138:      	ret
     13c:      	mov	x19, x0
     140:      	add	x0, sp, #0x28
     144:      	bl	0x144 <toyos_crypto::keccak::j+0x144>
     148:      	mov	x0, x19
     14c:      	bl	0x14c <toyos_crypto::keccak::j+0x14c>
     150:      	bl	0x150 <toyos_crypto::keccak::j+0x150>

~/.claude/jobs/2280e09e/tmp/scratchpad/agents/mlkem/target-rlib/aarch64-unknown-toyos/toyos/libtoyos_crypto.rlib(toyos_crypto-4ee49e0b7450663d.bch0gigm1s8zea5225mv2fk7t.1wsqjhz.rcgu.o):	file format elf64-littleaarch64

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

