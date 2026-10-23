0000000000000000 <__RINvNtNtCsb9t97VbgJUo_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P256FieldKj4_EB6_>:
       0:	sub	sp, sp, #0xf0
       4:	stp	x28, x27, [sp, #144]
       8:	stp	x26, x25, [sp, #160]
       c:	stp	x24, x23, [sp, #176]
      10:	stp	x22, x21, [sp, #192]
      14:	stp	x20, x19, [sp, #208]
      18:	stp	x29, x30, [sp, #224]
      1c:	add	x29, sp, #0xe0
      20:	str	x8, [sp, #8]
      24:	mov	x12, #0x0                   	// #0
      28:	mov	x5, #0x0                   	// #0
      2c:	mov	x14, #0x0                   	// #0
      30:	mov	x3, #0x0                   	// #0
      34:	mov	x2, #0x0                   	// #0
      38:	mov	x20, #0x0                   	// #0
      3c:	mov	x27, #0x0                   	// #0
      40:	ldp	x8, x9, [x0]
      44:	extr	x10, x9, x8, #62
      48:	and	x28, x8, #0x3fffffffffffffff
      4c:	and	x23, x10, #0x3fffffffffffffff
      50:	ldp	x8, x10, [x0, #16]
      54:	extr	x9, x8, x9, #60
      58:	and	x21, x9, #0x3fffffffffffffff
      5c:	extr	x8, x10, x8, #58
      60:	and	x19, x8, #0x3fffffffffffffff
      64:	lsr	x6, x10, #56
      68:	ldp	x24, x10, [x1]
      6c:	ldp	x8, x9, [x1, #16]
      70:	extr	x4, x9, x8, #58
      74:	lsr	x7, x9, #56
      78:	mov	x13, #0xffffffffffffffff    	// #-1
      7c:	mov	w11, #0xff                  	// #255
      80:	mov	x1, #0x3fffffc000000000    	// #4611685743549480960
      84:	movk	x1, #0x40
      88:	mov	x30, #0x3ffffffff           	// #17179869183
      8c:	mov	x9, #0x3fffffffffffffff    	// #4611686018427387903
      90:	extr	x8, x8, x10, #60
      94:	extr	x15, x10, x24, #62
      98:	stp	x11, x1, [sp, #88]
      9c:	str	x6, [sp, #112]
      a0:	stp	x5, x14, [x29, #-104]
      a4:	mov	x1, #0x0                   	// #0
      a8:	mov	x0, #0x0                   	// #0
      ac:	and	x11, x24, #0x3fffffffffffffff
      b0:	and	x26, x15, #0x3fffffffffffffff
      b4:	and	x8, x8, #0x3fffffffffffffff
      b8:	str	x8, [sp, #104]
      bc:	and	x25, x4, #0x3fffffffffffffff
      c0:	mov	w8, #0x3e                  	// #62
      c4:	mov	x10, x9
      c8:	mov	x14, x28
      cc:	mov	w5, #0x1                   	// #1
      d0:	mov	w4, #0x1                   	// #1
      d4:	sbfx	x15, x14, #0, #1
      d8:	asr	x16, x13, #63
      dc:	and	x17, x16, x15
      e0:	and	x6, x15, x10
      e4:	and	x22, x17, x10, lsl #1
      e8:	add	x14, x6, x14
      ec:	sub	x14, x14, x22
      f0:	eor	x6, x16, x5
      f4:	and	x6, x6, x15
      f8:	sub	x6, x6, x17
      fc:	add	x0, x6, x0
     100:	eor	x16, x16, x1
     104:	and	x15, x16, x15
     108:	sub	x15, x15, x17
     10c:	add	x4, x15, x4
     110:	and	x15, x14, x17
     114:	add	x10, x15, x10
     118:	lsr	x14, x14, #1
     11c:	and	x15, x0, x17
     120:	add	x15, x15, x5
     124:	lsl	x5, x15, #1
     128:	and	x15, x4, x17
     12c:	add	x15, x15, x1
     130:	lsl	x1, x15, #1
     134:	eor	x13, x17, x13
     138:	mvn	x15, x17
     13c:	add	x13, x13, x15
     140:	subs	w8, w8, #0x1
     144:	b.ne	d4 <__RINvNtNtCsb9t97VbgJUo_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P256FieldKj4_EB6_+0xd4>  // b.any
     148:	asr	x24, x1, #63
     14c:	umulh	x8, x1, x28
     150:	madd	x10, x24, x28, x8
     154:	mul	x14, x1, x28
     158:	asr	x8, x5, #63
     15c:	umulh	x15, x5, x9
     160:	madd	x15, x8, x9, x15
     164:	mul	x16, x5, x9
     168:	adds	x16, x16, x14
     16c:	adc	x17, x15, x10
     170:	asr	x15, x4, #63
     174:	umulh	x10, x4, x28
     178:	madd	x10, x15, x28, x10
     17c:	mul	x14, x4, x28
     180:	asr	x28, x0, #63
     184:	umulh	x6, x0, x9
     188:	madd	x6, x28, x9, x6
     18c:	mul	x9, x0, x9
     190:	adds	x22, x9, x14
     194:	orr	x9, x16, x22
     198:	adc	x10, x6, x10
     19c:	tst	x9, #0x3fffffffffffffff
     1a0:	b.ne	760 <__RINvNtNtCsb9t97VbgJUo_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P256FieldKj4_EB6_+0x760>  // b.any
     1a4:	stp	x26, x2, [sp, #48]
     1a8:	mov	x26, x19
     1ac:	stp	x25, x3, [sp, #72]
     1b0:	asr	x9, x2, #63
     1b4:	asr	x14, x7, #63
     1b8:	and	x6, x9, x5
     1bc:	and	x25, x14, x1
     1c0:	add	x6, x25, x6
     1c4:	and	x9, x9, x0
     1c8:	and	x14, x14, x4
     1cc:	add	x9, x14, x9
     1d0:	smulh	x14, x11, x1
     1d4:	mul	x25, x11, x1
     1d8:	str	x7, [sp, #64]
     1dc:	umulh	x7, x12, x5
     1e0:	madd	x7, x12, x8, x7
     1e4:	mul	x2, x12, x5
     1e8:	adds	x2, x25, x2
     1ec:	sub	x25, x6, x2
     1f0:	adc	x7, x14, x7
     1f4:	smulh	x14, x11, x4
     1f8:	mul	x11, x11, x4
     1fc:	umulh	x3, x12, x0
     200:	madd	x3, x12, x28, x3
     204:	mul	x12, x12, x0
     208:	adds	x11, x11, x12
     20c:	sub	x19, x9, x11
     210:	adc	x3, x14, x3
     214:	and	x12, x25, #0x3fffffffffffffff
     218:	sub	x12, x6, x12
     21c:	and	x14, x19, #0x3fffffffffffffff
     220:	sub	x25, x9, x14
     224:	lsl	x9, x12, #62
     228:	mov	x19, #0x3fffffffffffffff    	// #4611686018427387903
     22c:	smulh	x6, x12, x19
     230:	sub	x9, x9, x12
     234:	adds	x14, x9, x2
     238:	adc	x9, x6, x7
     23c:	lsl	x2, x25, #62
     240:	smulh	x6, x25, x19
     244:	sub	x2, x2, x25
     248:	adds	x11, x2, x11
     24c:	adc	x6, x6, x3
     250:	orr	x2, x14, x11
     254:	tst	x2, #0x3fffffffffffffff
     258:	b.ne	778 <__RINvNtNtCsb9t97VbgJUo_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P256FieldKj4_EB6_+0x778>  // b.any
     25c:	add	x27, x27, #0x1
     260:	extr	x16, x17, x16, #62
     264:	mul	x2, x30, x5
     268:	adds	x16, x2, x16
     26c:	umulh	x2, x30, x5
     270:	madd	x2, x30, x8, x2
     274:	asr	x17, x17, #62
     278:	adc	x17, x2, x17
     27c:	mul	x2, x23, x1
     280:	adds	x2, x16, x2
     284:	str	x2, [sp, #40]
     288:	umulh	x16, x23, x1
     28c:	madd	x16, x23, x24, x16
     290:	adc	x16, x17, x16
     294:	mul	x17, x20, x5
     298:	extr	x2, x16, x2, #62
     29c:	adds	x17, x17, x2
     2a0:	umulh	x2, x20, x5
     2a4:	madd	x2, x20, x8, x2
     2a8:	asr	x16, x16, #62
     2ac:	adc	x16, x2, x16
     2b0:	mul	x2, x21, x1
     2b4:	adds	x2, x17, x2
     2b8:	str	x2, [sp, #32]
     2bc:	umulh	x17, x21, x1
     2c0:	madd	x17, x21, x24, x17
     2c4:	adc	x16, x16, x17
     2c8:	extr	x17, x16, x2, #62
     2cc:	ldr	x19, [sp, #96]
     2d0:	mul	x2, x19, x5
     2d4:	adds	x17, x2, x17
     2d8:	umulh	x2, x19, x5
     2dc:	madd	x2, x19, x8, x2
     2e0:	asr	x16, x16, #62
     2e4:	adc	x16, x2, x16
     2e8:	mov	x7, x26
     2ec:	umulh	x2, x26, x1
     2f0:	madd	x2, x26, x24, x2
     2f4:	mul	x3, x26, x1
     2f8:	adds	x26, x17, x3
     2fc:	adc	x16, x16, x2
     300:	ldr	x24, [sp, #88]
     304:	mul	x17, x24, x5
     308:	extr	x2, x16, x26, #62
     30c:	adds	x17, x17, x2
     310:	asr	x16, x16, #62
     314:	smulh	x2, x24, x5
     318:	adc	x16, x2, x16
     31c:	ldr	x3, [sp, #112]
     320:	mul	x2, x3, x1
     324:	adds	x17, x17, x2
     328:	str	x17, [sp, #24]
     32c:	smulh	x17, x3, x1
     330:	adc	x16, x16, x17
     334:	str	x16, [sp, #16]
     338:	umulh	x16, x30, x0
     33c:	madd	x16, x30, x28, x16
     340:	mul	x17, x30, x0
     344:	extr	x2, x10, x22, #62
     348:	adds	x17, x17, x2
     34c:	asr	x10, x10, #62
     350:	adc	x10, x16, x10
     354:	umulh	x16, x23, x4
     358:	madd	x16, x23, x15, x16
     35c:	mul	x2, x23, x4
     360:	adds	x30, x17, x2
     364:	adc	x10, x10, x16
     368:	umulh	x16, x20, x0
     36c:	madd	x16, x20, x28, x16
     370:	mul	x17, x20, x0
     374:	extr	x2, x10, x30, #62
     378:	adds	x17, x17, x2
     37c:	asr	x10, x10, #62
     380:	adc	x10, x16, x10
     384:	umulh	x16, x21, x4
     388:	madd	x16, x21, x15, x16
     38c:	mul	x2, x21, x4
     390:	adds	x20, x17, x2
     394:	adc	x10, x10, x16
     398:	umulh	x16, x19, x0
     39c:	madd	x16, x19, x28, x16
     3a0:	mul	x17, x19, x0
     3a4:	extr	x2, x10, x20, #62
     3a8:	adds	x17, x17, x2
     3ac:	asr	x10, x10, #62
     3b0:	adc	x10, x16, x10
     3b4:	umulh	x16, x7, x4
     3b8:	madd	x15, x7, x15, x16
     3bc:	mul	x16, x7, x4
     3c0:	adds	x21, x17, x16
     3c4:	adc	x10, x10, x15
     3c8:	mul	x15, x24, x0
     3cc:	extr	x16, x10, x21, #62
     3d0:	adds	x15, x15, x16
     3d4:	smulh	x16, x24, x0
     3d8:	asr	x10, x10, #62
     3dc:	adc	x10, x16, x10
     3e0:	mul	x16, x3, x4
     3e4:	adds	x19, x15, x16
     3e8:	smulh	x15, x3, x4
     3ec:	adc	x7, x10, x15
     3f0:	extr	x10, x6, x11, #62
     3f4:	asr	x11, x6, #62
     3f8:	extr	x14, x9, x14, #62
     3fc:	asr	x9, x9, #62
     400:	ldur	x16, [x29, #-104]
     404:	mul	x15, x16, x5
     408:	adds	x14, x15, x14
     40c:	umulh	x15, x16, x5
     410:	madd	x15, x16, x8, x15
     414:	adc	x9, x15, x9
     418:	ldr	x17, [sp, #48]
     41c:	mul	x15, x17, x1
     420:	adds	x14, x14, x15
     424:	smulh	x15, x17, x1
     428:	adc	x9, x9, x15
     42c:	lsl	x15, x12, #34
     430:	sub	x15, x15, x12
     434:	adds	x14, x14, x15
     438:	mov	x2, #0x3ffffffff           	// #17179869183
     43c:	smulh	x15, x12, x2
     440:	adc	x9, x9, x15
     444:	umulh	x15, x16, x0
     448:	madd	x15, x16, x28, x15
     44c:	mul	x16, x16, x0
     450:	adds	x10, x16, x10
     454:	smulh	x16, x17, x4
     458:	mul	x17, x17, x4
     45c:	adc	x11, x15, x11
     460:	smulh	x15, x25, x2
     464:	adds	x10, x10, x17
     468:	lsl	x17, x25, #34
     46c:	adc	x11, x11, x16
     470:	sub	x16, x17, x25
     474:	adds	x24, x10, x16
     478:	adc	x11, x11, x15
     47c:	extr	x15, x11, x24, #62
     480:	asr	x10, x9, #62
     484:	extr	x9, x9, x14, #62
     488:	ldur	x17, [x29, #-96]
     48c:	mul	x16, x17, x5
     490:	adds	x9, x16, x9
     494:	umulh	x16, x17, x5
     498:	madd	x16, x17, x8, x16
     49c:	adc	x16, x16, x10
     4a0:	ldr	x2, [sp, #104]
     4a4:	mul	x10, x2, x1
     4a8:	adds	x10, x9, x10
     4ac:	smulh	x9, x2, x1
     4b0:	adc	x9, x16, x9
     4b4:	umulh	x16, x17, x0
     4b8:	madd	x16, x17, x28, x16
     4bc:	mul	x17, x17, x0
     4c0:	adds	x15, x17, x15
     4c4:	asr	x11, x11, #62
     4c8:	adc	x11, x16, x11
     4cc:	smulh	x16, x2, x4
     4d0:	mul	x17, x2, x4
     4d4:	adds	x15, x15, x17
     4d8:	adc	x16, x11, x16
     4dc:	extr	x11, x9, x10, #62
     4e0:	ldp	x6, x2, [sp, #72]
     4e4:	umulh	x17, x2, x5
     4e8:	madd	x8, x2, x8, x17
     4ec:	mul	x17, x2, x5
     4f0:	adds	x11, x17, x11
     4f4:	asr	x9, x9, #62
     4f8:	adc	x8, x8, x9
     4fc:	mul	x9, x6, x1
     500:	adds	x9, x11, x9
     504:	smulh	x11, x6, x1
     508:	adc	x8, x8, x11
     50c:	mov	x3, #0x3fffffc000000000    	// #4611685743549480960
     510:	movk	x3, #0x40
     514:	mul	x11, x12, x3
     518:	adds	x11, x9, x11
     51c:	smulh	x9, x12, x3
     520:	adc	x9, x8, x9
     524:	umulh	x8, x2, x0
     528:	madd	x8, x2, x28, x8
     52c:	extr	x17, x16, x15, #62
     530:	mul	x2, x2, x0
     534:	adds	x17, x2, x17
     538:	asr	x16, x16, #62
     53c:	adc	x8, x8, x16
     540:	mul	x16, x6, x4
     544:	adds	x16, x17, x16
     548:	extr	x17, x9, x11, #62
     54c:	smulh	x2, x6, x4
     550:	adc	x2, x8, x2
     554:	mul	x8, x25, x3
     558:	adds	x8, x16, x8
     55c:	smulh	x16, x25, x3
     560:	adc	x16, x2, x16
     564:	ldr	x6, [sp, #56]
     568:	mul	x2, x6, x5
     56c:	adds	x17, x2, x17
     570:	asr	x9, x9, #62
     574:	smulh	x2, x6, x5
     578:	adc	x9, x2, x9
     57c:	ldr	x5, [sp, #64]
     580:	mul	x2, x5, x1
     584:	adds	x17, x17, x2
     588:	smulh	x1, x5, x1
     58c:	adc	x9, x9, x1
     590:	lsl	x1, x12, #8
     594:	sub	x1, x1, x12
     598:	adds	x17, x17, x1
     59c:	extr	x1, x16, x8, #62
     5a0:	mov	w3, #0xff                  	// #255
     5a4:	smulh	x12, x12, x3
     5a8:	adc	x2, x9, x12
     5ac:	mul	x9, x6, x0
     5b0:	adds	x9, x9, x1
     5b4:	smulh	x12, x6, x0
     5b8:	asr	x16, x16, #62
     5bc:	adc	x12, x12, x16
     5c0:	mul	x16, x5, x4
     5c4:	adds	x9, x9, x16
     5c8:	smulh	x16, x5, x4
     5cc:	adc	x0, x12, x16
     5d0:	lsl	x12, x25, #8
     5d4:	sub	x12, x12, x25
     5d8:	adds	x4, x9, x12
     5dc:	ldp	x12, x9, [sp, #16]
     5e0:	extr	x16, x12, x9, #62
     5e4:	extr	x6, x7, x19, #62
     5e8:	and	x19, x19, #0x3fffffffffffffff
     5ec:	and	x21, x21, #0x3fffffffffffffff
     5f0:	and	x23, x20, #0x3fffffffffffffff
     5f4:	and	x28, x30, #0x3fffffffffffffff
     5f8:	and	x1, x9, #0x3fffffffffffffff
     5fc:	and	x20, x26, #0x3fffffffffffffff
     600:	ldr	x9, [sp, #32]
     604:	and	x30, x9, #0x3fffffffffffffff
     608:	ldr	x9, [sp, #40]
     60c:	and	x9, x9, #0x3fffffffffffffff
     610:	and	x12, x14, #0x3fffffffffffffff
     614:	and	x5, x10, #0x3fffffffffffffff
     618:	and	x14, x11, #0x3fffffffffffffff
     61c:	smulh	x10, x25, x3
     620:	adc	x10, x0, x10
     624:	and	x3, x17, #0x3fffffffffffffff
     628:	extr	x7, x10, x4, #62
     62c:	extr	x2, x2, x17, #62
     630:	mov	x11, x16
     634:	cmp	x27, #0xc
     638:	b.ne	98 <__RINvNtNtCsb9t97VbgJUo_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P256FieldKj4_EB6_+0x98>  // b.any
     63c:	orr	x8, x23, x28
     640:	orr	x8, x21, x8
     644:	orr	x8, x19, x8
     648:	orr	x8, x8, x6
     64c:	stur	x8, [x29, #-88]
     650:	cbnz	x8, 790 <__RINvNtNtCsb9t97VbgJUo_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P256FieldKj4_EB6_+0x790>
     654:	asr	x8, x2, #63
     658:	and	x9, x8, #0x3fffffffffffffff
     65c:	add	x9, x12, x9
     660:	and	x10, x9, #0x3fffffffffffffff
     664:	add	x9, x5, x9, lsr #62
     668:	and	x11, x8, #0x3ffffffff
     66c:	add	x9, x9, x11
     670:	and	x11, x9, #0x3fffffffffffffff
     674:	add	x9, x14, x9, lsr #62
     678:	and	x12, x9, #0x3fffffffffffffff
     67c:	add	x9, x3, x9, lsr #62
     680:	mov	x15, #0x3fffffc000000000    	// #4611685743549480960
     684:	movk	x15, #0x40
     688:	and	x13, x8, x15
     68c:	add	x9, x9, x13
     690:	and	x13, x9, #0x3fffffffffffffff
     694:	add	x9, x2, x9, lsr #62
     698:	add	x8, x9, w8, uxtb
     69c:	asr	x9, x16, #63
     6a0:	eor	x10, x10, x9
     6a4:	sub	x10, x10, x9
     6a8:	and	x14, x10, #0x3fffffffffffffff
     6ac:	eor	x11, x11, x9
     6b0:	sub	x11, x11, x9
     6b4:	add	x10, x11, x10, asr #62
     6b8:	and	x11, x10, #0x3fffffffffffffff
     6bc:	eor	x12, x12, x9
     6c0:	sub	x12, x12, x9
     6c4:	add	x10, x12, x10, asr #62
     6c8:	and	x12, x10, #0x3fffffffffffffff
     6cc:	eor	x13, x13, x9
     6d0:	sub	x13, x13, x9
     6d4:	add	x10, x13, x10, asr #62
     6d8:	and	x13, x10, #0x3fffffffffffffff
     6dc:	eor	x8, x8, x9
     6e0:	sub	x8, x8, x9
     6e4:	add	x8, x8, x10, asr #62
     6e8:	asr	x9, x8, #63
     6ec:	and	x10, x9, #0x3fffffffffffffff
     6f0:	add	x10, x14, x10
     6f4:	add	x11, x11, x10, lsr #62
     6f8:	and	x14, x9, #0x3ffffffff
     6fc:	add	x11, x11, x14
     700:	add	x12, x12, x11, lsr #62
     704:	add	x13, x13, x12, lsr #62
     708:	and	x14, x9, x15
     70c:	add	x14, x13, x14
     710:	add	x8, x8, x14, lsr #62
     714:	lsr	x14, x14, #6
     718:	add	w8, w8, w9
     71c:	bfi	x14, x8, #56, #8
     720:	lsr	x8, x12, #4
     724:	lsr	x9, x11, #2
     728:	bfi	x9, x12, #60, #4
     72c:	bfi	x10, x11, #62, #2
     730:	ldr	x11, [sp, #8]
     734:	stp	x10, x9, [x11]
     738:	bfi	x8, x13, #58, #6
     73c:	stp	x8, x14, [x11, #16]
     740:	ldp	x29, x30, [sp, #224]
     744:	ldp	x20, x19, [sp, #208]
     748:	ldp	x22, x21, [sp, #192]
     74c:	ldp	x24, x23, [sp, #176]
     750:	ldp	x26, x25, [sp, #160]
     754:	ldp	x28, x27, [sp, #144]
     758:	add	sp, sp, #0xf0
     75c:	ret
     760:	adrp	x0, 26df <l_anon.ad64d6a0a756f21eb8108aa1092e37cb.11>
     764:	add	x0, x0, #0x0
     768:	adrp	x2, 2778 <l_anon.ad64d6a0a756f21eb8108aa1092e37cb.12>
     76c:	add	x2, x2, #0x0
     770:	mov	w1, #0x40                  	// #64
     774:	bl	0 <__RNvNtCs8Mbv00yxnRz_4core9panicking5panic>
     778:	adrp	x0, 271f <l_anon.ad64d6a0a756f21eb8108aa1092e37cb.13>
     77c:	add	x0, x0, #0x0
     780:	adrp	x2, 2790 <l_anon.ad64d6a0a756f21eb8108aa1092e37cb.14>
     784:	add	x2, x2, #0x0
     788:	mov	w1, #0x40                  	// #64
     78c:	bl	0 <__RNvNtCs8Mbv00yxnRz_4core9panicking5panic>
     790:	adrp	x2, 26c0 <l_anon.ad64d6a0a756f21eb8108aa1092e37cb.3>
     794:	add	x2, x2, #0x0
     798:	adrp	x3, 26c8 <l_anon.ad64d6a0a756f21eb8108aa1092e37cb.4>
     79c:	add	x3, x3, #0x0
     7a0:	adrp	x5, 2760 <l_anon.ad64d6a0a756f21eb8108aa1092e37cb.5>
     7a4:	add	x5, x5, #0x0
     7a8:	sub	x1, x29, #0x58
     7ac:	mov	w0, #0x0                   	// #0
     7b0:	mov	w4, #0x2f                  	// #47
     7b4:	bl	0 <__RINvNtCs8Mbv00yxnRz_4core9panicking13assert_failedxxECsb9t97VbgJUo_12toyos_crypto>
