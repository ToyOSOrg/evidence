       0:      	push	rbp
       1:      	push	r15
       3:      	push	r14
       5:      	push	r13
       7:      	push	r12
       9:      	push	rbx
       a:      	sub	rsp, 0xa8
      11:      	mov	qword ptr [rsp + 0x80], rdi
      19:      	mov	rcx, qword ptr [rsi + 0x40]
      1d:      	mov	qword ptr [rsp - 0x78], rcx
      22:      	mov	r8, qword ptr [rsi + 0x48]
      26:      	mov	qword ptr [rsp - 0x28], r8
      2b:      	mov	rdi, qword ptr [rsi + 0x50]
      2f:      	mov	qword ptr [rsp - 0x20], rdi
      34:      	mov	r9, qword ptr [rsi + 0x58]
      38:      	mov	qword ptr [rsp - 0x30], r9
      3d:      	mov	rdx, rcx
      40:      	mulx	r11, r10, r8
      45:      	mulx	rbx, rbp, rdi
      4a:      	add	r11, rbp
      4d:      	mulx	r13, rbp, r9
      52:      	adc	rbx, rbp
      55:      	adc	r13, 0x0
      59:      	mov	rdx, r8
      5c:      	mulx	r14, rbp, rdi
      61:      	add	rbx, rbp
      64:      	adc	r13, r14
      67:      	mulx	r12, rbp, r9
      6c:      	adc	r12, 0x0
      70:      	add	r13, rbp
      73:      	adc	r12, 0x0
      77:      	mov	rdx, rdi
      7a:      	mulx	rax, rbp, r9
      7f:      	add	r12, rbp
      82:      	adc	rax, 0x0
      86:      	xor	r15d, r15d
      89:      	add	r10, r10
      8c:      	adc	r11, r11
      8f:      	adc	rbx, rbx
      92:      	adc	r13, r13
      95:      	adc	r12, r12
      98:      	adc	rax, rax
      9b:      	adc	r15, 0x0
      9f:      	mov	rdx, rcx
      a2:      	mulx	r14, rcx, rdx
      a7:      	add	r10, r14
      aa:      	mov	rdx, r8
      ad:      	mulx	r14, rbp, rdx
      b2:      	adc	r11, rbp
      b5:      	adc	rbx, r14
      b8:      	mov	rdx, rdi
      bb:      	mulx	r14, rbp, rdx
      c0:      	adc	r13, rbp
      c3:      	adc	r12, r14
      c6:      	mov	rdx, r9
      c9:      	mulx	r14, rbp, rdx
      ce:      	adc	rax, rbp
      d1:      	adc	r15, r14
      d4:      	mov	rbp, rcx
      d7:      	shl	rbp, 0x20
      db:      	mov	r14, rcx
      de:      	shr	r14, 0x20
      e2:      	mov	rdx, rcx
      e5:      	sub	rcx, rbp
      e8:      	sbb	rdx, r14
      eb:      	add	r10, rbp
      ee:      	adc	r11, r14
      f1:      	adc	rbx, rcx
      f4:      	adc	r13, rdx
      f7:      	adc	r12, 0x0
      fb:      	adc	rax, 0x0
      ff:      	adc	r15, 0x0
     103:      	mov	ecx, 0x0
     108:      	adc	rcx, 0x0
     10c:      	mov	rbp, r10
     10f:      	shl	rbp, 0x20
     113:      	mov	r14, r10
     116:      	shr	r14, 0x20
     11a:      	mov	rdx, r10
     11d:      	sub	r10, rbp
     120:      	sbb	rdx, r14
     123:      	add	r11, rbp
     126:      	adc	rbx, r14
     129:      	adc	r13, r10
     12c:      	adc	r12, rdx
     12f:      	adc	rax, 0x0
     133:      	adc	r15, 0x0
     137:      	adc	rcx, 0x0
     13b:      	mov	rbp, r11
     13e:      	shl	rbp, 0x20
     142:      	mov	r14, r11
     145:      	shr	r14, 0x20
     149:      	mov	rdx, r11
     14c:      	sub	r11, rbp
     14f:      	sbb	rdx, r14
     152:      	add	rbx, rbp
     155:      	adc	r13, r14
     158:      	adc	r12, r11
     15b:      	adc	rax, rdx
     15e:      	adc	r15, 0x0
     162:      	adc	rcx, 0x0
     166:      	mov	rbp, rbx
     169:      	shl	rbp, 0x20
     16d:      	mov	r14, rbx
     170:      	shr	r14, 0x20
     174:      	mov	rdx, rbx
     177:      	sub	rbx, rbp
     17a:      	sbb	rdx, r14
     17d:      	add	r13, rbp
     180:      	adc	r12, r14
     183:      	adc	rax, rbx
     186:      	adc	r15, rdx
     189:      	adc	rcx, 0x0
     18d:      	mov	r8, r13
     190:      	mov	rdi, r12
     193:      	mov	r9, rax
     196:      	mov	rdx, r15
     199:      	mov	ebp, 0xffffffff
     19e:      	movabs	r14, -0xffffffff
     1a8:      	sub	r8, -0x1
     1ac:      	sbb	rdi, rbp
     1af:      	sbb	r9, 0x0
     1b3:      	sbb	rdx, r14
     1b6:      	sbb	rcx, 0x0
     1ba:      	cmovae	r13, r8
     1be:      	cmovae	r12, rdi
     1c2:      	cmovae	rax, r9
     1c6:      	cmovae	r15, rdx
     1ca:      	mov	qword ptr [rsp - 0x50], r13
     1cf:      	mov	qword ptr [rsp - 0x60], r12
     1d4:      	mov	qword ptr [rsp + 0x18], r15
     1d9:      	mov	qword ptr [rsp - 0x58], rax
     1de:      	mov	rcx, qword ptr [rsi + 0x20]
     1e2:      	mov	qword ptr [rsp + 0x60], rcx
     1e7:      	mov	r8, qword ptr [rsi + 0x28]
     1eb:      	mov	qword ptr [rsp + 0x48], r8
     1f0:      	mov	rdi, qword ptr [rsi + 0x30]
     1f4:      	mov	qword ptr [rsp + 0x58], rdi
     1f9:      	mov	r9, qword ptr [rsi + 0x38]
     1fd:      	mov	qword ptr [rsp + 0x50], r9
     202:      	mov	rdx, rcx
     205:      	mulx	r11, r10, r8
     20a:      	mulx	rbx, rbp, rdi
     20f:      	add	r11, rbp
     212:      	mulx	rax, rbp, r9
     217:      	adc	rbx, rbp
     21a:      	adc	rax, 0x0
     21e:      	mov	rdx, r8
     221:      	mulx	r14, rbp, rdi
     226:      	add	rbx, rbp
     229:      	adc	rax, r14
     22c:      	mulx	r15, rbp, r9
     231:      	adc	r15, 0x0
     235:      	add	rax, rbp
     238:      	adc	r15, 0x0
     23c:      	mov	rdx, rdi
     23f:      	mulx	r12, rbp, r9
     244:      	add	r15, rbp
     247:      	adc	r12, 0x0
     24b:      	xor	r13d, r13d
     24e:      	add	r10, r10
     251:      	adc	r11, r11
     254:      	adc	rbx, rbx
     257:      	adc	rax, rax
     25a:      	adc	r15, r15
     25d:      	adc	r12, r12
     260:      	adc	r13, 0x0
     264:      	mov	rdx, rcx
     267:      	mulx	r14, rcx, rdx
     26c:      	add	r10, r14
     26f:      	mov	rdx, r8
     272:      	mulx	r14, rbp, rdx
     277:      	adc	r11, rbp
     27a:      	adc	rbx, r14
     27d:      	mov	rdx, rdi
     280:      	mulx	r14, rbp, rdx
     285:      	adc	rax, rbp
     288:      	adc	r15, r14
     28b:      	mov	rdx, r9
     28e:      	mulx	r14, rbp, rdx
     293:      	adc	r12, rbp
     296:      	adc	r13, r14
     299:      	mov	rbp, rcx
     29c:      	shl	rbp, 0x20
     2a0:      	mov	r14, rcx
     2a3:      	shr	r14, 0x20
     2a7:      	mov	rdx, rcx
     2aa:      	sub	rcx, rbp
     2ad:      	sbb	rdx, r14
     2b0:      	add	r10, rbp
     2b3:      	adc	r11, r14
     2b6:      	adc	rbx, rcx
     2b9:      	adc	rax, rdx
     2bc:      	adc	r15, 0x0
     2c0:      	adc	r12, 0x0
     2c4:      	adc	r13, 0x0
     2c8:      	mov	ecx, 0x0
     2cd:      	adc	rcx, 0x0
     2d1:      	mov	rbp, r10
     2d4:      	shl	rbp, 0x20
     2d8:      	mov	r14, r10
     2db:      	shr	r14, 0x20
     2df:      	mov	rdx, r10
     2e2:      	sub	r10, rbp
     2e5:      	sbb	rdx, r14
     2e8:      	add	r11, rbp
     2eb:      	adc	rbx, r14
     2ee:      	adc	rax, r10
     2f1:      	adc	r15, rdx
     2f4:      	adc	r12, 0x0
     2f8:      	adc	r13, 0x0
     2fc:      	adc	rcx, 0x0
     300:      	mov	rbp, r11
     303:      	shl	rbp, 0x20
     307:      	mov	r14, r11
     30a:      	shr	r14, 0x20
     30e:      	mov	rdx, r11
     311:      	sub	r11, rbp
     314:      	sbb	rdx, r14
     317:      	add	rbx, rbp
     31a:      	adc	rax, r14
     31d:      	adc	r15, r11
     320:      	adc	r12, rdx
     323:      	adc	r13, 0x0
     327:      	adc	rcx, 0x0
     32b:      	mov	rbp, rbx
     32e:      	shl	rbp, 0x20
     332:      	mov	r14, rbx
     335:      	shr	r14, 0x20
     339:      	mov	rdx, rbx
     33c:      	sub	rbx, rbp
     33f:      	sbb	rdx, r14
     342:      	add	rax, rbp
     345:      	adc	r15, r14
     348:      	adc	r12, rbx
     34b:      	adc	r13, rdx
     34e:      	adc	rcx, 0x0
     352:      	mov	r8, rax
     355:      	mov	rdi, r15
     358:      	mov	r9, r12
     35b:      	mov	rdx, r13
     35e:      	mov	ebp, 0xffffffff
     363:      	movabs	r14, -0xffffffff
     36d:      	sub	r8, -0x1
     371:      	sbb	rdi, rbp
     374:      	sbb	r9, 0x0
     378:      	sbb	rdx, r14
     37b:      	sbb	rcx, 0x0
     37f:      	cmovae	rax, r8
     383:      	cmovae	r15, rdi
     387:      	cmovae	r12, r9
     38b:      	cmovae	r13, rdx
     38f:      	mov	qword ptr [rsp + 0x68], r13
     394:      	mov	qword ptr [rsp + 0x70], r15
     399:      	mov	qword ptr [rsp + 0x78], r12
     39e:      	mov	qword ptr [rsp + 0x88], rax
     3a6:      	mov	rdx, rax
     3a9:      	mov	qword ptr [rsp + 0x40], rax
     3ae:      	mov	qword ptr [rsp + 0x90], r15
     3b6:      	mov	qword ptr [rsp + 0x98], r12
     3be:      	mov	qword ptr [rsp + 0xa0], r13
     3c6:      	mov	rbp, qword ptr [rsi]
     3c9:      	mov	qword ptr [rsp - 0x68], rbp
     3ce:      	mov	r10, qword ptr [rsi + 0x8]
     3d2:      	mov	qword ptr [rsp - 0x80], r10
     3d7:      	mov	rdi, qword ptr [rsi + 0x10]
     3db:      	mov	rcx, qword ptr [rsi + 0x18]
     3df:      	mov	qword ptr [rsp - 0x70], rcx
     3e4:      	mov	r12, rdi
     3e7:      	lea	rsi, [rsp + 0x88]
     3ef:      	mulx	rbx, r11, rbp
     3f4:      	mulx	r14, rax, r10
     3f9:      	add	rbx, rax
     3fc:      	mulx	r8, rax, r12
     401:      	adc	r14, rax
     404:      	mulx	r15, rax, rcx
     409:      	adc	r8, rax
     40c:      	adc	r15, 0x0
     410:      	xor	r9d, r9d
     413:      	mov	rax, r11
     416:      	shl	rax, 0x20
     41a:      	mov	r13, r11
     41d:      	shr	r13, 0x20
     421:      	mov	rdx, r11
     424:      	sub	r11, rax
     427:      	sbb	rdx, r13
     42a:      	add	rbx, rax
     42d:      	adc	r14, r13
     430:      	adc	r8, r11
     433:      	adc	r15, rdx
     436:      	adc	r9, 0x0
     43a:      	mov	rdx, qword ptr [rsi + 0x8]
     43e:      	xor	r11d, r11d
     441:      	mulx	r13, rax, rbp
     446:      	adcx	rbx, rax
     44c:      	adox	r14, r13
     452:      	mulx	r13, rax, r10
     457:      	adcx	r14, rax
     45d:      	adox	r8, r13
     463:      	mulx	r13, rax, r12
     468:      	adcx	r8, rax
     46e:      	adox	r15, r13
     474:      	mulx	r13, rax, rcx
     479:      	adcx	r15, rax
     47f:      	adox	r9, r13
     485:      	adcx	r9, r11
     48b:      	adox	r11, r11
     491:      	adc	r11, 0x0
     495:      	mov	rax, rbx
     498:      	shl	rax, 0x20
     49c:      	mov	r13, rbx
     49f:      	shr	r13, 0x20
     4a3:      	mov	rdx, rbx
     4a6:      	sub	rbx, rax
     4a9:      	sbb	rdx, r13
     4ac:      	add	r14, rax
     4af:      	adc	r8, r13
     4b2:      	adc	r15, rbx
     4b5:      	adc	r9, rdx
     4b8:      	adc	r11, 0x0
     4bc:      	mov	rdx, qword ptr [rsi + 0x10]
     4c0:      	xor	ebx, ebx
     4c2:      	mulx	r13, rax, rbp
     4c7:      	adcx	r14, rax
     4cd:      	adox	r8, r13
     4d3:      	mulx	r13, rax, r10
     4d8:      	adcx	r8, rax
     4de:      	adox	r15, r13
     4e4:      	mulx	r13, rax, r12
     4e9:      	adcx	r15, rax
     4ef:      	adox	r9, r13
     4f5:      	mulx	r13, rax, rcx
     4fa:      	adcx	r9, rax
     500:      	adox	r11, r13
     506:      	adcx	r11, rbx
     50c:      	adox	rbx, rbx
     512:      	adc	rbx, 0x0
     516:      	mov	rax, r14
     519:      	shl	rax, 0x20
     51d:      	mov	r13, r14
     520:      	shr	r13, 0x20
     524:      	mov	rdx, r14
     527:      	sub	r14, rax
     52a:      	sbb	rdx, r13
     52d:      	add	r8, rax
     530:      	adc	r15, r13
     533:      	adc	r9, r14
     536:      	adc	r11, rdx
     539:      	adc	rbx, 0x0
     53d:      	mov	rdx, qword ptr [rsi + 0x18]
     541:      	xor	r14d, r14d
     544:      	mulx	r13, rax, rbp
     549:      	adcx	r8, rax
     54f:      	adox	r15, r13
     555:      	mulx	r13, rax, r10
     55a:      	adcx	r15, rax
     560:      	adox	r9, r13
     566:      	mulx	r13, rax, r12
     56b:      	adcx	r9, rax
     571:      	adox	r11, r13
     577:      	mulx	r13, rax, rcx
     57c:      	adcx	r11, rax
     582:      	adox	rbx, r13
     588:      	adcx	rbx, r14
     58e:      	adox	r14, r14
     594:      	adc	r14, 0x0
     598:      	mov	rax, r8
     59b:      	shl	rax, 0x20
     59f:      	mov	r13, r8
     5a2:      	shr	r13, 0x20
     5a6:      	mov	rdx, r8
     5a9:      	sub	r8, rax
     5ac:      	sbb	rdx, r13
     5af:      	add	r15, rax
     5b2:      	adc	r9, r13
     5b5:      	adc	r11, r8
     5b8:      	adc	rbx, rdx
     5bb:      	adc	r14, 0x0
     5bf:      	mov	rbp, r15
     5c2:      	mov	r10, r9
     5c5:      	mov	r12, r11
     5c8:      	mov	rcx, rbx
     5cb:      	mov	eax, 0xffffffff
     5d0:      	movabs	r13, -0xffffffff
     5da:      	sub	rbp, -0x1
     5de:      	sbb	r10, rax
     5e1:      	sbb	r12, 0x0
     5e5:      	sbb	rcx, r13
     5e8:      	sbb	r14, 0x0
     5ec:      	cmovb	rbp, r15
     5f0:      	cmovb	r10, r9
     5f4:      	cmovb	r12, r11
     5f8:      	cmovb	rcx, rbx
     5fc:      	mov	qword ptr [rsp - 0x48], rcx
     601:      	mov	qword ptr [rsp - 0x40], r12
     606:      	mov	qword ptr [rsp - 0x38], r10
     60b:      	mov	qword ptr [rsp - 0x18], rbp
     610:      	mov	rsi, qword ptr [rsp - 0x70]
     615:      	mov	r8, rsi
     618:      	mov	rcx, qword ptr [rsp - 0x50]
     61d:      	mov	rax, rcx
     620:      	mov	r10, qword ptr [rsp - 0x68]
     625:      	mov	r11, r10
     628:      	mov	rbx, rdi
     62b:      	mov	r15, qword ptr [rsp - 0x60]
     630:      	mov	rdx, r15
     633:      	mov	r13, qword ptr [rsp + 0x18]
     638:      	mov	r9, r13
     63b:      	mov	r12, qword ptr [rsp - 0x80]
     640:      	mov	r14, r12
     643:      	mov	rbp, qword ptr [rsp - 0x58]
     648:      	sub	r11, rax
     64b:      	sbb	r14, rdx
     64e:      	sbb	rbx, rbp
     651:      	sbb	r8, r9
     654:      	sbb	rax, rax
     657:      	mov	rdx, rax
     65a:      	shr	rdx, 0x20
     65e:      	mov	r9, rax
     661:      	shl	r9, 0x20
     665:      	sub	r9, rax
     668:      	add	r11, rax
     66b:      	adc	r14, rdx
     66e:      	adc	rbx, 0x0
     672:      	adc	r8, r9
     675:      	mov	rax, rcx
     678:      	mov	rdx, rbp
     67b:      	mov	r9, r15
     67e:      	mov	r15, r13
     681:      	xor	r13d, r13d
     684:      	add	r10, rax
     687:      	adc	r12, r9
     68a:      	adc	rdi, rdx
     68d:      	adc	rsi, r15
     690:      	adc	r13, 0x0
     694:      	mov	rax, r10
     697:      	mov	r9, r12
     69a:      	mov	rdx, rdi
     69d:      	mov	r15, rsi
     6a0:      	mov	ebp, 0xffffffff
     6a5:      	movabs	rcx, -0xffffffff
     6af:      	sub	rax, -0x1
     6b3:      	sbb	r9, rbp
     6b6:      	sbb	rdx, 0x0
     6ba:      	sbb	r15, rcx
     6bd:      	sbb	r13, 0x0
     6c1:      	cmovae	r10, rax
     6c5:      	cmovae	r12, r9
     6c9:      	cmovae	rdi, rdx
     6cd:      	cmovae	rsi, r15
     6d1:      	mov	qword ptr [rsp + 0x20], r10
     6d6:      	mov	rdx, r10
     6d9:      	mov	qword ptr [rsp + 0x28], r12
     6de:      	mov	qword ptr [rsp + 0x30], rdi
     6e3:      	mov	qword ptr [rsp + 0x38], rsi
     6e8:      	lea	rax, [rsp + 0x20]
     6ed:      	mulx	rsi, rcx, r11
     6f2:      	mulx	rdi, r15, r14
     6f7:      	add	rsi, r15
     6fa:      	mulx	r9, r15, rbx
     6ff:      	adc	rdi, r15
     702:      	mulx	r10, r15, r8
     707:      	adc	r9, r15
     70a:      	adc	r10, 0x0
     70e:      	xor	ebp, ebp
     710:      	mov	r15, rcx
     713:      	shl	r15, 0x20
     717:      	mov	r12, rcx
     71a:      	shr	r12, 0x20
     71e:      	mov	rdx, rcx
     721:      	sub	rcx, r15
     724:      	sbb	rdx, r12
     727:      	add	rsi, r15
     72a:      	adc	rdi, r12
     72d:      	adc	r9, rcx
     730:      	adc	r10, rdx
     733:      	adc	rbp, 0x0
     737:      	mov	rdx, qword ptr [rax + 0x8]
     73b:      	xor	ecx, ecx
     73d:      	mulx	r12, r15, r11
     742:      	adcx	rsi, r15
     748:      	adox	rdi, r12
     74e:      	mulx	r12, r15, r14
     753:      	adcx	rdi, r15
     759:      	adox	r9, r12
     75f:      	mulx	r12, r15, rbx
     764:      	adcx	r9, r15
     76a:      	adox	r10, r12
     770:      	mulx	r12, r15, r8
     775:      	adcx	r10, r15
     77b:      	adox	rbp, r12
     781:      	adcx	rbp, rcx
     787:      	adox	rcx, rcx
     78d:      	adc	rcx, 0x0
     791:      	mov	r15, rsi
     794:      	shl	r15, 0x20
     798:      	mov	r12, rsi
     79b:      	shr	r12, 0x20
     79f:      	mov	rdx, rsi
     7a2:      	sub	rsi, r15
     7a5:      	sbb	rdx, r12
     7a8:      	add	rdi, r15
     7ab:      	adc	r9, r12
     7ae:      	adc	r10, rsi
     7b1:      	adc	rbp, rdx
     7b4:      	adc	rcx, 0x0
     7b8:      	mov	rdx, qword ptr [rax + 0x10]
     7bc:      	xor	esi, esi
     7be:      	mulx	r12, r15, r11
     7c3:      	adcx	rdi, r15
     7c9:      	adox	r9, r12
     7cf:      	mulx	r12, r15, r14
     7d4:      	adcx	r9, r15
     7da:      	adox	r10, r12
     7e0:      	mulx	r12, r15, rbx
     7e5:      	adcx	r10, r15
     7eb:      	adox	rbp, r12
     7f1:      	mulx	r12, r15, r8
     7f6:      	adcx	rbp, r15
     7fc:      	adox	rcx, r12
     802:      	adcx	rcx, rsi
     808:      	adox	rsi, rsi
     80e:      	adc	rsi, 0x0
     812:      	mov	r15, rdi
     815:      	shl	r15, 0x20
     819:      	mov	r12, rdi
     81c:      	shr	r12, 0x20
     820:      	mov	rdx, rdi
     823:      	sub	rdi, r15
     826:      	sbb	rdx, r12
     829:      	add	r9, r15
     82c:      	adc	r10, r12
     82f:      	adc	rbp, rdi
     832:      	adc	rcx, rdx
     835:      	adc	rsi, 0x0
     839:      	mov	rdx, qword ptr [rax + 0x18]
     83d:      	xor	edi, edi
     83f:      	mulx	r12, r15, r11
     844:      	adcx	r9, r15
     84a:      	adox	r10, r12
     850:      	mulx	r12, r15, r14
     855:      	adcx	r10, r15
     85b:      	adox	rbp, r12
     861:      	mulx	r12, r15, rbx
     866:      	adcx	rbp, r15
     86c:      	adox	rcx, r12
     872:      	mulx	r12, r15, r8
     877:      	adcx	rcx, r15
     87d:      	adox	rsi, r12
     883:      	adcx	rsi, rdi
     889:      	adox	rdi, rdi
     88f:      	adc	rdi, 0x0
     893:      	mov	r15, r9
     896:      	shl	r15, 0x20
     89a:      	mov	r12, r9
     89d:      	shr	r12, 0x20
     8a1:      	mov	rdx, r9
     8a4:      	sub	r9, r15
     8a7:      	sbb	rdx, r12
     8aa:      	add	r10, r15
     8ad:      	adc	rbp, r12
     8b0:      	adc	rcx, r9
     8b3:      	adc	rsi, rdx
     8b6:      	adc	rdi, 0x0
     8ba:      	mov	r11, r10
     8bd:      	mov	r14, rbp
     8c0:      	mov	rbx, rcx
     8c3:      	mov	r8, rsi
     8c6:      	mov	r15d, 0xffffffff
     8cc:      	movabs	r12, -0xffffffff
     8d6:      	sub	r11, -0x1
     8da:      	sbb	r14, r15
     8dd:      	sbb	rbx, 0x0
     8e1:      	sbb	r8, r12
     8e4:      	sbb	rdi, 0x0
     8e8:      	cmovb	r11, r10
     8ec:      	cmovb	r14, rbp
     8f0:      	cmovb	rbx, rcx
     8f4:      	cmovb	r8, rsi
     8f8:      	mov	rdi, r11
     8fb:      	mov	rsi, rbx
     8fe:      	mov	r12, r14
     901:      	mov	r10, r8
     904:      	xor	ebp, ebp
     906:      	add	rdi, rdi
     909:      	adc	r12, r12
     90c:      	adc	rsi, rsi
     90f:      	adc	r10, r10
     912:      	adc	rbp, 0x0
     916:      	mov	rax, rdi
     919:      	mov	rcx, r12
     91c:      	mov	rdx, rsi
     91f:      	mov	r9, r10
     922:      	mov	r15d, 0xffffffff
     928:      	movabs	r13, -0xffffffff
     932:      	sub	rax, -0x1
     936:      	sbb	rcx, r15
     939:      	sbb	rdx, 0x0
     93d:      	sbb	r9, r13
     940:      	sbb	rbp, 0x0
     944:      	cmovae	rdi, rax
     948:      	cmovae	r12, rcx
     94c:      	cmovae	rsi, rdx
     950:      	cmovae	r10, r9
     954:      	xor	eax, eax
     956:      	add	rdi, r11
     959:      	adc	r12, r14
     95c:      	adc	rsi, rbx
     95f:      	adc	r10, r8
     962:      	adc	rax, 0x0
     966:      	mov	r11, rdi
     969:      	mov	r14, r12
     96c:      	mov	rbx, rsi
     96f:      	mov	r8, r10
     972:      	mov	ecx, 0xffffffff
     977:      	movabs	rdx, -0xffffffff
     981:      	sub	r11, -0x1
     985:      	sbb	r14, rcx
     988:      	sbb	rbx, 0x0
     98c:      	sbb	r8, rdx
     98f:      	sbb	rax, 0x0
     993:      	cmovae	rdi, r11
     997:      	cmovae	r12, r14
     99b:      	cmovae	rsi, rbx
     99f:      	cmovae	r10, r8
     9a3:      	mov	qword ptr [rsp - 0x80], r12
     9a8:      	mov	qword ptr [rsp - 0x10], r10
     9ad:      	mov	rbp, rsi
     9b0:      	mov	qword ptr [rsp - 0x70], rsi
     9b5:      	mov	r12, rdi
     9b8:      	mov	qword ptr [rsp - 0x68], rdi
     9bd:      	mov	rdi, qword ptr [rsp - 0x48]
     9c2:      	mov	rsi, qword ptr [rsp - 0x40]
     9c7:      	mov	r14, qword ptr [rsp - 0x38]
     9cc:      	mov	r13, qword ptr [rsp - 0x18]
     9d1:      	xor	r9d, r9d
     9d4:      	add	r13, r13
     9d7:      	adc	r14, r14
     9da:      	adc	rsi, rsi
     9dd:      	adc	rdi, rdi
     9e0:      	adc	r9, 0x0
     9e4:      	mov	rax, r13
     9e7:      	mov	rcx, r14
     9ea:      	mov	rdx, rsi
     9ed:      	mov	r8, rdi
     9f0:      	mov	r11d, 0xffffffff
     9f6:      	movabs	rbx, -0xffffffff
     a00:      	sub	rax, -0x1
     a04:      	sbb	rcx, r11
     a07:      	sbb	rdx, 0x0
     a0b:      	sbb	r8, rbx
     a0e:      	sbb	r9, 0x0
     a12:      	cmovae	r13, rax
     a16:      	cmovae	r14, rcx
     a1a:      	cmovae	rsi, rdx
     a1e:      	cmovae	rdi, r8
     a22:      	xor	r9d, r9d
     a25:      	add	r13, r13
     a28:      	adc	r14, r14
     a2b:      	adc	rsi, rsi
     a2e:      	adc	rdi, rdi
     a31:      	adc	r9, 0x0
     a35:      	mov	rax, r13
     a38:      	mov	rcx, r14
     a3b:      	mov	rdx, rsi
     a3e:      	mov	r8, rdi
     a41:      	mov	r11d, 0xffffffff
     a47:      	movabs	rbx, -0xffffffff
     a51:      	sub	rax, -0x1
     a55:      	sbb	rcx, r11
     a58:      	sbb	rdx, 0x0
     a5c:      	sbb	r8, rbx
     a5f:      	sbb	r9, 0x0
     a63:      	cmovae	r13, rax
     a67:      	cmovae	r14, rcx
     a6b:      	cmovae	rsi, rdx
     a6f:      	cmovae	rdi, r8
     a73:      	mov	qword ptr [rsp - 0x48], rdi
     a78:      	mov	qword ptr [rsp - 0x40], rsi
     a7d:      	mov	qword ptr [rsp - 0x38], r14
     a82:      	mov	qword ptr [rsp - 0x18], r13
     a87:      	mov	rax, r10
     a8a:      	mov	rcx, r12
     a8d:      	mov	r8, rbp
     a90:      	mov	r9, qword ptr [rsp - 0x80]
     a95:      	mov	rdx, rcx
     a98:      	mulx	rbx, r11, r9
     a9d:      	mulx	rbp, r14, r8
     aa2:      	add	rbx, r14
     aa5:      	mulx	r12, r14, rax
     aaa:      	adc	rbp, r14
     aad:      	adc	r12, 0x0
     ab1:      	mov	rdx, r9
     ab4:      	mulx	r15, r14, r8
     ab9:      	add	rbp, r14
     abc:      	adc	r12, r15
     abf:      	mulx	r10, r14, rax
     ac4:      	adc	r10, 0x0
     ac8:      	add	r12, r14
     acb:      	adc	r10, 0x0
     acf:      	mov	rdx, r8
     ad2:      	mulx	rdi, r14, rax
     ad7:      	add	r10, r14
     ada:      	adc	rdi, 0x0
     ade:      	xor	esi, esi
     ae0:      	add	r11, r11
     ae3:      	adc	rbx, rbx
     ae6:      	adc	rbp, rbp
     ae9:      	adc	r12, r12
     aec:      	adc	r10, r10
     aef:      	adc	rdi, rdi
     af2:      	adc	rsi, 0x0
     af6:      	mov	rdx, rcx
     af9:      	mulx	r15, rcx, rdx
     afe:      	add	r11, r15
     b01:      	mov	rdx, r9
     b04:      	mulx	r15, r14, rdx
     b09:      	adc	rbx, r14
     b0c:      	adc	rbp, r15
     b0f:      	mov	rdx, r8
     b12:      	mulx	r15, r14, rdx
     b17:      	adc	r12, r14
     b1a:      	adc	r10, r15
     b1d:      	mov	rdx, rax
     b20:      	mulx	r15, r14, rdx
     b25:      	adc	rdi, r14
     b28:      	adc	rsi, r15
     b2b:      	mov	r14, rcx
     b2e:      	shl	r14, 0x20
     b32:      	mov	r15, rcx
     b35:      	shr	r15, 0x20
     b39:      	mov	rdx, rcx
     b3c:      	sub	rcx, r14
     b3f:      	sbb	rdx, r15
     b42:      	add	r11, r14
     b45:      	adc	rbx, r15
     b48:      	adc	rbp, rcx
     b4b:      	adc	r12, rdx
     b4e:      	adc	r10, 0x0
     b52:      	adc	rdi, 0x0
     b56:      	adc	rsi, 0x0
     b5a:      	mov	ecx, 0x0
     b5f:      	adc	rcx, 0x0
     b63:      	mov	r14, r11
     b66:      	shl	r14, 0x20
     b6a:      	mov	r15, r11
     b6d:      	shr	r15, 0x20
     b71:      	mov	rdx, r11
     b74:      	sub	r11, r14
     b77:      	sbb	rdx, r15
     b7a:      	add	rbx, r14
     b7d:      	adc	rbp, r15
     b80:      	adc	r12, r11
     b83:      	adc	r10, rdx
     b86:      	adc	rdi, 0x0
     b8a:      	adc	rsi, 0x0
     b8e:      	adc	rcx, 0x0
     b92:      	mov	r14, rbx
     b95:      	shl	r14, 0x20
     b99:      	mov	r15, rbx
     b9c:      	shr	r15, 0x20
     ba0:      	mov	rdx, rbx
     ba3:      	sub	rbx, r14
     ba6:      	sbb	rdx, r15
     ba9:      	add	rbp, r14
     bac:      	adc	r12, r15
     baf:      	adc	r10, rbx
     bb2:      	adc	rdi, rdx
     bb5:      	adc	rsi, 0x0
     bb9:      	adc	rcx, 0x0
     bbd:      	mov	r14, rbp
     bc0:      	shl	r14, 0x20
     bc4:      	mov	r15, rbp
     bc7:      	shr	r15, 0x20
     bcb:      	mov	rdx, rbp
     bce:      	sub	rbp, r14
     bd1:      	sbb	rdx, r15
     bd4:      	add	r12, r14
     bd7:      	adc	r10, r15
     bda:      	adc	rdi, rbp
     bdd:      	adc	rsi, rdx
     be0:      	adc	rcx, 0x0
     be4:      	mov	r9, r12
     be7:      	mov	r8, r10
     bea:      	mov	rax, rdi
     bed:      	mov	rdx, rsi
     bf0:      	mov	r14d, 0xffffffff
     bf6:      	movabs	r15, -0xffffffff
     c00:      	sub	r9, -0x1
     c04:      	sbb	r8, r14
     c07:      	sbb	rax, 0x0
     c0b:      	sbb	rdx, r15
     c0e:      	sbb	rcx, 0x0
     c12:      	cmovae	r12, r9
     c16:      	cmovae	r10, r8
     c1a:      	cmovae	rdi, rax
     c1e:      	cmovae	rsi, rdx
     c22:      	mov	rax, r13
     c25:      	mov	rcx, qword ptr [rsp - 0x40]
     c2a:      	mov	rdx, qword ptr [rsp - 0x38]
     c2f:      	mov	r8, qword ptr [rsp - 0x48]
     c34:      	xor	r14d, r14d
     c37:      	add	rax, rax
     c3a:      	adc	rdx, rdx
     c3d:      	adc	rcx, rcx
     c40:      	adc	r8, r8
     c43:      	adc	r14, 0x0
     c47:      	mov	r9, rax
     c4a:      	mov	r11, rdx
     c4d:      	mov	rbx, rcx
     c50:      	mov	rbp, r8
     c53:      	mov	r15d, 0xffffffff
     c59:      	movabs	r13, -0xffffffff
     c63:      	sub	r9, -0x1
     c67:      	sbb	r11, r15
     c6a:      	sbb	rbx, 0x0
     c6e:      	sbb	rbp, r13
     c71:      	sbb	r14, 0x0
     c75:      	cmovae	rax, r9
     c79:      	cmovae	rdx, r11
     c7d:      	cmovae	rcx, rbx
     c81:      	cmovae	r8, rbp
     c85:      	sub	r12, rax
     c88:      	sbb	r10, rdx
     c8b:      	sbb	rdi, rcx
     c8e:      	sbb	rsi, r8
     c91:      	sbb	rax, rax
     c94:      	mov	rdx, rax
     c97:      	shr	rdx, 0x20
     c9b:      	mov	r8, rax
     c9e:      	shl	r8, 0x20
     ca2:      	sub	r8, rax
     ca5:      	add	r12, rax
     ca8:      	adc	r10, rdx
     cab:      	adc	rdi, 0x0
     caf:      	adc	rsi, r8
     cb2:      	mov	qword ptr [rsp - 0x8], r12
     cb7:      	mov	qword ptr [rsp], rsi
     cbb:      	mov	qword ptr [rsp + 0x8], r10
     cc0:      	mov	qword ptr [rsp + 0x10], rdi
     cc5:      	mov	rsi, qword ptr [rsp + 0x48]
     cca:      	mov	rdi, qword ptr [rsp - 0x78]
     ccf:      	mov	r8, qword ptr [rsp - 0x20]
     cd4:      	mov	r9, qword ptr [rsp - 0x28]
     cd9:      	mov	r10, qword ptr [rsp - 0x30]
     cde:      	mov	rbx, qword ptr [rsp + 0x60]
     ce3:      	mov	r14, qword ptr [rsp + 0x58]
     ce8:      	mov	r15, qword ptr [rsp + 0x50]
     ced:      	xor	eax, eax
     cef:      	add	rbx, rdi
     cf2:      	adc	rsi, r9
     cf5:      	adc	r14, r8
     cf8:      	adc	r15, r10
     cfb:      	adc	rax, 0x0
     cff:      	mov	rdi, rbx
     d02:      	mov	r9, rsi
     d05:      	mov	r8, r14
     d08:      	mov	r10, r15
     d0b:      	mov	ecx, 0xffffffff
     d10:      	movabs	rdx, -0xffffffff
     d1a:      	sub	rdi, -0x1
     d1e:      	sbb	r9, rcx
     d21:      	sbb	r8, 0x0
     d25:      	sbb	r10, rdx
     d28:      	sbb	rax, 0x0
     d2c:      	cmovae	rbx, rdi
     d30:      	cmovae	rsi, r9
     d34:      	cmovae	r14, r8
     d38:      	cmovae	r15, r10
     d3c:      	mov	rdx, rbx
     d3f:      	mulx	rcx, rax, rsi
     d44:      	mulx	r8, r9, r14
     d49:      	add	rcx, r9
     d4c:      	mulx	rdi, r9, r15
     d51:      	adc	r8, r9
     d54:      	adc	rdi, 0x0
     d58:      	mov	rdx, rsi
     d5b:      	mulx	r11, r9, r14
     d60:      	add	r8, r9
     d63:      	adc	rdi, r11
     d66:      	mulx	r12, r9, r15
     d6b:      	adc	r12, 0x0
     d6f:      	add	rdi, r9
     d72:      	adc	r12, 0x0
     d76:      	mov	rdx, r14
     d79:      	mulx	rbp, r9, r15
     d7e:      	add	r12, r9
     d81:      	adc	rbp, 0x0
     d85:      	xor	r13d, r13d
     d88:      	add	rax, rax
     d8b:      	adc	rcx, rcx
     d8e:      	adc	r8, r8
     d91:      	adc	rdi, rdi
     d94:      	adc	r12, r12
     d97:      	adc	rbp, rbp
     d9a:      	adc	r13, 0x0
     d9e:      	mov	rdx, rbx
     da1:      	mulx	r11, rbx, rdx
     da6:      	add	rax, r11
     da9:      	mov	rdx, rsi
     dac:      	mulx	r11, r9, rdx
     db1:      	adc	rcx, r9
     db4:      	adc	r8, r11
     db7:      	mov	rdx, r14
     dba:      	mulx	r11, r9, rdx
     dbf:      	adc	rdi, r9
     dc2:      	adc	r12, r11
     dc5:      	mov	rdx, r15
     dc8:      	mulx	r11, r9, rdx
     dcd:      	adc	rbp, r9
     dd0:      	adc	r13, r11
     dd3:      	mov	r9, rbx
     dd6:      	shl	r9, 0x20
     dda:      	mov	r11, rbx
     ddd:      	shr	r11, 0x20
     de1:      	mov	rdx, rbx
     de4:      	sub	rbx, r9
     de7:      	sbb	rdx, r11
     dea:      	add	rax, r9
     ded:      	adc	rcx, r11
     df0:      	adc	r8, rbx
     df3:      	adc	rdi, rdx
     df6:      	adc	r12, 0x0
     dfa:      	adc	rbp, 0x0
     dfe:      	adc	r13, 0x0
     e02:      	mov	ebx, 0x0
     e07:      	adc	rbx, 0x0
     e0b:      	mov	r9, rax
     e0e:      	shl	r9, 0x20
     e12:      	mov	r11, rax
     e15:      	shr	r11, 0x20
     e19:      	mov	rdx, rax
     e1c:      	sub	rax, r9
     e1f:      	sbb	rdx, r11
     e22:      	add	rcx, r9
     e25:      	adc	r8, r11
     e28:      	adc	rdi, rax
     e2b:      	adc	r12, rdx
     e2e:      	adc	rbp, 0x0
     e32:      	adc	r13, 0x0
     e36:      	adc	rbx, 0x0
     e3a:      	mov	r9, rcx
     e3d:      	shl	r9, 0x20
     e41:      	mov	r11, rcx
     e44:      	shr	r11, 0x20
     e48:      	mov	rdx, rcx
     e4b:      	sub	rcx, r9
     e4e:      	sbb	rdx, r11
     e51:      	add	r8, r9
     e54:      	adc	rdi, r11
     e57:      	adc	r12, rcx
     e5a:      	adc	rbp, rdx
     e5d:      	adc	r13, 0x0
     e61:      	adc	rbx, 0x0
     e65:      	mov	r9, r8
     e68:      	shl	r9, 0x20
     e6c:      	mov	r11, r8
     e6f:      	shr	r11, 0x20
     e73:      	mov	rdx, r8
     e76:      	sub	r8, r9
     e79:      	sbb	rdx, r11
     e7c:      	add	rdi, r9
     e7f:      	adc	r12, r11
     e82:      	adc	rbp, r8
     e85:      	adc	r13, rdx
     e88:      	adc	rbx, 0x0
     e8c:      	mov	rsi, rdi
     e8f:      	mov	r14, r12
     e92:      	mov	r15, rbp
     e95:      	mov	rdx, r13
     e98:      	mov	r9d, 0xffffffff
     e9e:      	movabs	r11, -0xffffffff
     ea8:      	sub	rsi, -0x1
     eac:      	sbb	r14, r9
     eaf:      	sbb	r15, 0x0
     eb3:      	sbb	rdx, r11
     eb6:      	sbb	rbx, 0x0
     eba:      	cmovae	rdi, rsi
     ebe:      	cmovae	r12, r14
     ec2:      	cmovae	rbp, r15
     ec6:      	cmovae	r13, rdx
     eca:      	mov	qword ptr [rsp - 0x78], rdi
     ecf:      	mov	r10, qword ptr [rsp + 0x40]
     ed4:      	mov	rax, r10
     ed7:      	mov	rdi, qword ptr [rsp + 0x70]
     edc:      	mov	rcx, rdi
     edf:      	mov	rsi, qword ptr [rsp + 0x68]
     ee4:      	mov	rdx, rsi
     ee7:      	mov	rbx, qword ptr [rsp + 0x78]
     eec:      	mov	r9, qword ptr [rsp - 0x78]
     ef1:      	sub	r9, rax
     ef4:      	sbb	r12, rcx
     ef7:      	sbb	rbp, rbx
     efa:      	sbb	r13, rdx
     efd:      	sbb	rax, rax
     f00:      	mov	rcx, rax
     f03:      	shr	rcx, 0x20
     f07:      	mov	rdx, rax
     f0a:      	shl	rdx, 0x20
     f0e:      	sub	rdx, rax
     f11:      	add	r9, rax
     f14:      	adc	r12, rcx
     f17:      	adc	rbp, 0x0
     f1b:      	adc	r13, rdx
     f1e:      	mov	rax, qword ptr [rsp - 0x50]
     f23:      	mov	rcx, qword ptr [rsp - 0x58]
     f28:      	mov	rdx, qword ptr [rsp - 0x60]
     f2d:      	mov	r8, qword ptr [rsp + 0x18]
     f32:      	sub	r9, rax
     f35:      	sbb	r12, rdx
     f38:      	sbb	rbp, rcx
     f3b:      	sbb	r13, r8
     f3e:      	sbb	rax, rax
     f41:      	mov	rdx, rax
     f44:      	shr	rdx, 0x20
     f48:      	mov	r8, rax
     f4b:      	shl	r8, 0x20
     f4f:      	sub	r8, rax
     f52:      	add	r9, rax
     f55:      	adc	r12, rdx
     f58:      	adc	rbp, 0x0
     f5c:      	adc	r13, r8
     f5f:      	mov	qword ptr [rsp - 0x78], r9
     f64:      	mov	qword ptr [rsp - 0x30], r12
     f69:      	mov	qword ptr [rsp - 0x28], rbp
     f6e:      	mov	qword ptr [rsp - 0x20], r13
     f73:      	mov	rdx, r10
     f76:      	mulx	rcx, rax, rdi
     f7b:      	mulx	r9, rbp, rbx
     f80:      	add	rcx, rbp
     f83:      	mulx	r15, rbp, rsi
     f88:      	adc	r9, rbp
     f8b:      	adc	r15, 0x0
     f8f:      	mov	rdx, rdi
     f92:      	mulx	r13, rbp, rbx
     f97:      	add	r9, rbp
     f9a:      	adc	r15, r13
     f9d:      	mulx	r11, rbp, rsi
     fa2:      	adc	r11, 0x0
     fa6:      	add	r15, rbp
     fa9:      	adc	r11, 0x0
     fad:      	mov	rdx, rbx
     fb0:      	mulx	r8, rbp, rsi
     fb5:      	add	r11, rbp
     fb8:      	adc	r8, 0x0
     fbc:      	xor	r14d, r14d
     fbf:      	add	rax, rax
     fc2:      	adc	rcx, rcx
     fc5:      	adc	r9, r9
     fc8:      	adc	r15, r15
     fcb:      	adc	r11, r11
     fce:      	adc	r8, r8
     fd1:      	adc	r14, 0x0
     fd5:      	mov	rdx, r10
     fd8:      	mulx	r13, r10, rdx
     fdd:      	add	rax, r13
     fe0:      	mov	rdx, rdi
     fe3:      	mulx	r13, rbp, rdx
     fe8:      	adc	rcx, rbp
     feb:      	adc	r9, r13
     fee:      	mov	rdx, rbx
     ff1:      	mulx	r13, rbp, rdx
     ff6:      	adc	r15, rbp
     ff9:      	adc	r11, r13
     ffc:      	mov	rdx, rsi
     fff:      	mulx	r13, rbp, rdx
    1004:      	adc	r8, rbp
    1007:      	adc	r14, r13
    100a:      	mov	rbp, r10
    100d:      	shl	rbp, 0x20
    1011:      	mov	r13, r10
    1014:      	shr	r13, 0x20
    1018:      	mov	rdx, r10
    101b:      	sub	r10, rbp
    101e:      	sbb	rdx, r13
    1021:      	add	rax, rbp
    1024:      	adc	rcx, r13
    1027:      	adc	r9, r10
    102a:      	adc	r15, rdx
    102d:      	adc	r11, 0x0
    1031:      	adc	r8, 0x0
    1035:      	adc	r14, 0x0
    1039:      	mov	r10d, 0x0
    103f:      	adc	r10, 0x0
    1043:      	mov	rbp, rax
    1046:      	shl	rbp, 0x20
    104a:      	mov	r13, rax
    104d:      	shr	r13, 0x20
    1051:      	mov	rdx, rax
    1054:      	sub	rax, rbp
    1057:      	sbb	rdx, r13
    105a:      	add	rcx, rbp
    105d:      	adc	r9, r13
    1060:      	adc	r15, rax
    1063:      	adc	r11, rdx
    1066:      	adc	r8, 0x0
    106a:      	adc	r14, 0x0
    106e:      	adc	r10, 0x0
    1072:      	mov	rbp, rcx
    1075:      	shl	rbp, 0x20
    1079:      	mov	r13, rcx
    107c:      	shr	r13, 0x20
    1080:      	mov	rdx, rcx
    1083:      	sub	rcx, rbp
    1086:      	sbb	rdx, r13
    1089:      	add	r9, rbp
    108c:      	adc	r15, r13
    108f:      	adc	r11, rcx
    1092:      	adc	r8, rdx
    1095:      	adc	r14, 0x0
    1099:      	adc	r10, 0x0
    109d:      	mov	rbp, r9
    10a0:      	shl	rbp, 0x20
    10a4:      	mov	r13, r9
    10a7:      	shr	r13, 0x20
    10ab:      	mov	rdx, r9
    10ae:      	sub	r9, rbp
    10b1:      	sbb	rdx, r13
    10b4:      	add	r15, rbp
    10b7:      	adc	r11, r13
    10ba:      	adc	r8, r9
    10bd:      	adc	r14, rdx
    10c0:      	adc	r10, 0x0
    10c4:      	mov	rdi, r15
    10c7:      	mov	rbx, r11
    10ca:      	mov	rsi, r8
    10cd:      	mov	rdx, r14
    10d0:      	mov	ebp, 0xffffffff
    10d5:      	movabs	r13, -0xffffffff
    10df:      	sub	rdi, -0x1
    10e3:      	sbb	rbx, rbp
    10e6:      	sbb	rsi, 0x0
    10ea:      	sbb	rdx, r13
    10ed:      	sbb	r10, 0x0
    10f1:      	cmovae	r15, rdi
    10f5:      	cmovae	r11, rbx
    10f9:      	cmovae	r8, rsi
    10fd:      	cmovae	r14, rdx
    1101:      	xor	ebp, ebp
    1103:      	add	r15, r15
    1106:      	adc	r11, r11
    1109:      	adc	r8, r8
    110c:      	adc	r14, r14
    110f:      	adc	rbp, 0x0
    1113:      	mov	rax, r15
    1116:      	mov	rcx, r11
    1119:      	mov	rdx, r8
    111c:      	mov	r9, r14
    111f:      	mov	r13d, 0xffffffff
    1125:      	movabs	rbx, -0xffffffff
    112f:      	sub	rax, -0x1
    1133:      	sbb	rcx, r13
    1136:      	sbb	rdx, 0x0
    113a:      	sbb	r9, rbx
    113d:      	sbb	rbp, 0x0
    1141:      	cmovae	r15, rax
    1145:      	cmovae	r11, rcx
    1149:      	cmovae	r8, rdx
    114d:      	cmovae	r14, r9
    1151:      	mov	qword ptr [rsp - 0x60], r14
    1156:      	mov	qword ptr [rsp - 0x58], r11
    115b:      	mov	qword ptr [rsp - 0x50], r8
    1160:      	mov	rax, qword ptr [rsp - 0x8]
    1165:      	mov	rcx, qword ptr [rsp + 0x8]
    116a:      	mov	rdx, qword ptr [rsp]
    116e:      	mov	rsi, qword ptr [rsp - 0x18]
    1173:      	mov	rdi, qword ptr [rsp + 0x10]
    1178:      	mov	r8, qword ptr [rsp - 0x40]
    117d:      	mov	r9, qword ptr [rsp - 0x48]
    1182:      	mov	r10, qword ptr [rsp - 0x38]
    1187:      	sub	rsi, rax
    118a:      	sbb	r10, rcx
    118d:      	sbb	r8, rdi
    1190:      	sbb	r9, rdx
    1193:      	sbb	rax, rax
    1196:      	mov	rcx, rax
    1199:      	shr	rcx, 0x20
    119d:      	mov	rdx, rax
    11a0:      	shl	rdx, 0x20
    11a4:      	sub	rdx, rax
    11a7:      	add	rsi, rax
    11aa:      	adc	r10, rcx
    11ad:      	adc	r8, 0x0
    11b1:      	adc	r9, rdx
    11b4:      	mov	qword ptr [rsp + 0x20], rsi
    11b9:      	mov	rdx, rsi
    11bc:      	mov	qword ptr [rsp + 0x28], r10
    11c1:      	mov	qword ptr [rsp + 0x30], r8
    11c6:      	mov	qword ptr [rsp + 0x38], r9
    11cb:      	mov	r12, qword ptr [rsp - 0x68]
    11d0:      	mov	r10, qword ptr [rsp - 0x70]
    11d5:      	mov	r11, qword ptr [rsp - 0x10]
    11da:      	mov	r8, qword ptr [rsp - 0x80]
    11df:      	lea	r14, [rsp + 0x20]
    11e4:      	mulx	r9, rcx, r12
    11e9:      	mulx	rbx, rsi, r8
    11ee:      	add	r9, rsi
    11f1:      	mulx	rbp, rsi, r10
    11f6:      	adc	rbx, rsi
    11f9:      	mulx	r13, rsi, r11
    11fe:      	adc	rbp, rsi
    1201:      	adc	r13, 0x0
    1205:      	xor	eax, eax
    1207:      	mov	rsi, rcx
    120a:      	shl	rsi, 0x20
    120e:      	mov	rdi, rcx
    1211:      	shr	rdi, 0x20
    1215:      	mov	rdx, rcx
    1218:      	sub	rcx, rsi
    121b:      	sbb	rdx, rdi
    121e:      	add	r9, rsi
    1221:      	adc	rbx, rdi
    1224:      	adc	rbp, rcx
    1227:      	adc	r13, rdx
    122a:      	adc	rax, 0x0
    122e:      	mov	rdx, qword ptr [r14 + 0x8]
    1232:      	xor	ecx, ecx
    1234:      	mulx	rdi, rsi, r12
    1239:      	adcx	r9, rsi
    123f:      	adox	rbx, rdi
    1245:      	mulx	rdi, rsi, r8
    124a:      	adcx	rbx, rsi
    1250:      	adox	rbp, rdi
    1256:      	mulx	rdi, rsi, r10
    125b:      	adcx	rbp, rsi
    1261:      	adox	r13, rdi
    1267:      	mulx	rdi, rsi, r11
    126c:      	adcx	r13, rsi
    1272:      	adox	rax, rdi
    1278:      	adcx	rax, rcx
    127e:      	adox	rcx, rcx
    1284:      	adc	rcx, 0x0
    1288:      	mov	rsi, r9
    128b:      	shl	rsi, 0x20
    128f:      	mov	rdi, r9
    1292:      	shr	rdi, 0x20
    1296:      	mov	rdx, r9
    1299:      	sub	r9, rsi
    129c:      	sbb	rdx, rdi
    129f:      	add	rbx, rsi
    12a2:      	adc	rbp, rdi
    12a5:      	adc	r13, r9
    12a8:      	adc	rax, rdx
    12ab:      	adc	rcx, 0x0
    12af:      	mov	rdx, qword ptr [r14 + 0x10]
    12b3:      	xor	r9d, r9d
    12b6:      	mulx	rdi, rsi, r12
    12bb:      	adcx	rbx, rsi
    12c1:      	adox	rbp, rdi
    12c7:      	mulx	rdi, rsi, r8
    12cc:      	adcx	rbp, rsi
    12d2:      	adox	r13, rdi
    12d8:      	mulx	rdi, rsi, r10
    12dd:      	adcx	r13, rsi
    12e3:      	adox	rax, rdi
    12e9:      	mulx	rdi, rsi, r11
    12ee:      	adcx	rax, rsi
    12f4:      	adox	rcx, rdi
    12fa:      	adcx	rcx, r9
    1300:      	adox	r9, r9
    1306:      	adc	r9, 0x0
    130a:      	mov	rsi, rbx
    130d:      	shl	rsi, 0x20
    1311:      	mov	rdi, rbx
    1314:      	shr	rdi, 0x20
    1318:      	mov	rdx, rbx
    131b:      	sub	rbx, rsi
    131e:      	sbb	rdx, rdi
    1321:      	add	rbp, rsi
    1324:      	adc	r13, rdi
    1327:      	adc	rax, rbx
    132a:      	adc	rcx, rdx
    132d:      	adc	r9, 0x0
    1331:      	mov	rdx, qword ptr [r14 + 0x18]
    1335:      	xor	ebx, ebx
    1337:      	mulx	rdi, rsi, r12
    133c:      	adcx	rbp, rsi
    1342:      	adox	r13, rdi
    1348:      	mulx	rdi, rsi, r8
    134d:      	adcx	r13, rsi
    1353:      	adox	rax, rdi
    1359:      	mulx	rdi, rsi, r10
    135e:      	adcx	rax, rsi
    1364:      	adox	rcx, rdi
    136a:      	mulx	rdi, rsi, r11
    136f:      	adcx	rcx, rsi
    1375:      	adox	r9, rdi
    137b:      	adcx	r9, rbx
    1381:      	adox	rbx, rbx
    1387:      	adc	rbx, 0x0
    138b:      	mov	rsi, rbp
    138e:      	shl	rsi, 0x20
    1392:      	mov	rdi, rbp
    1395:      	shr	rdi, 0x20
    1399:      	mov	rdx, rbp
    139c:      	sub	rbp, rsi
    139f:      	sbb	rdx, rdi
    13a2:      	add	r13, rsi
    13a5:      	adc	rax, rdi
    13a8:      	adc	rcx, rbp
    13ab:      	adc	r9, rdx
    13ae:      	adc	rbx, 0x0
    13b2:      	mov	r12, r13
    13b5:      	mov	r8, rax
    13b8:      	mov	r10, rcx
    13bb:      	mov	r11, r9
    13be:      	mov	esi, 0xffffffff
    13c3:      	movabs	rdi, -0xffffffff
    13cd:      	sub	r12, -0x1
    13d1:      	sbb	r8, rsi
    13d4:      	sbb	r10, 0x0
    13d8:      	sbb	r11, rdi
    13db:      	sbb	rbx, 0x0
    13df:      	cmovb	r12, r13
    13e3:      	cmovb	r8, rax
    13e7:      	cmovb	r10, rcx
    13eb:      	cmovb	r11, r9
    13ef:      	mov	qword ptr [rsp - 0x80], r8
    13f4:      	mov	qword ptr [rsp - 0x10], r11
    13f9:      	mov	qword ptr [rsp - 0x70], r10
    13fe:      	mov	qword ptr [rsp - 0x68], r12
    1403:      	mov	r8, qword ptr [rsp - 0x58]
    1408:      	mov	r10, qword ptr [rsp - 0x50]
    140d:      	mov	r11, qword ptr [rsp - 0x60]
    1412:      	xor	edi, edi
    1414:      	add	r15, r15
    1417:      	adc	r8, r8
    141a:      	adc	r10, r10
    141d:      	adc	r11, r11
    1420:      	adc	rdi, 0x0
    1424:      	mov	rax, r15
    1427:      	mov	rcx, r8
    142a:      	mov	rdx, r10
    142d:      	mov	rsi, r11
    1430:      	mov	r9d, 0xffffffff
    1436:      	movabs	rbx, -0xffffffff
    1440:      	sub	rax, -0x1
    1444:      	sbb	rcx, r9
    1447:      	sbb	rdx, 0x0
    144b:      	sbb	rsi, rbx
    144e:      	sbb	rdi, 0x0
    1452:      	cmovae	r15, rax
    1456:      	cmovae	r8, rcx
    145a:      	cmovae	r10, rdx
    145e:      	cmovae	r11, rsi
    1462:      	xor	edi, edi
    1464:      	add	r15, r15
    1467:      	adc	r8, r8
    146a:      	adc	r10, r10
    146d:      	adc	r11, r11
    1470:      	adc	rdi, 0x0
    1474:      	mov	rax, r15
    1477:      	mov	rcx, r8
    147a:      	mov	rdx, r10
    147d:      	mov	rsi, r11
    1480:      	mov	r9d, 0xffffffff
    1486:      	movabs	rbx, -0xffffffff
    1490:      	sub	rax, -0x1
    1494:      	sbb	rcx, r9
    1497:      	sbb	rdx, 0x0
    149b:      	sbb	rsi, rbx
    149e:      	sbb	rdi, 0x0
    14a2:      	cmovae	r15, rax
    14a6:      	cmovae	r8, rcx
    14aa:      	cmovae	r10, rdx
    14ae:      	cmovae	r11, rsi
    14b2:      	mov	rcx, qword ptr [rsp - 0x70]
    14b7:      	mov	rdx, qword ptr [rsp - 0x68]
    14bc:      	mov	rsi, qword ptr [rsp - 0x10]
    14c1:      	mov	rdi, qword ptr [rsp - 0x80]
    14c6:      	sub	rdx, r15
    14c9:      	sbb	rdi, r8
    14cc:      	sbb	rcx, r10
    14cf:      	sbb	rsi, r11
    14d2:      	sbb	r15, r15
    14d5:      	mov	r8, r15
    14d8:      	shr	r8, 0x20
    14dc:      	mov	r11, r15
    14df:      	shl	r11, 0x20
    14e3:      	sub	r11, r15
    14e6:      	add	rdx, r15
    14e9:      	adc	rdi, r8
    14ec:      	adc	rcx, 0x0
    14f0:      	adc	rsi, r11
    14f3:      	mov	rax, qword ptr [rsp + 0x80]
    14fb:      	mov	r8, qword ptr [rsp - 0x8]
    1500:      	mov	qword ptr [rax], r8
    1503:      	mov	r8, qword ptr [rsp + 0x8]
    1508:      	mov	qword ptr [rax + 0x8], r8
    150c:      	mov	r8, qword ptr [rsp + 0x10]
    1511:      	mov	qword ptr [rax + 0x10], r8
    1515:      	mov	r8, qword ptr [rsp]
    1519:      	mov	qword ptr [rax + 0x18], r8
    151d:      	mov	qword ptr [rax + 0x20], rdx
    1521:      	mov	qword ptr [rax + 0x28], rdi
    1525:      	mov	qword ptr [rax + 0x30], rcx
    1529:      	mov	qword ptr [rax + 0x38], rsi
    152d:      	mov	rcx, qword ptr [rsp - 0x78]
    1532:      	mov	qword ptr [rax + 0x40], rcx
    1536:      	mov	rcx, qword ptr [rsp - 0x30]
    153b:      	mov	qword ptr [rax + 0x48], rcx
    153f:      	mov	rcx, qword ptr [rsp - 0x28]
    1544:      	mov	qword ptr [rax + 0x50], rcx
    1548:      	mov	rcx, qword ptr [rsp - 0x20]
    154d:      	mov	qword ptr [rax + 0x58], rcx
    1551:      	add	rsp, 0xa8
    1558:      	pop	rbx
    1559:      	pop	r12
    155b:      	pop	r13
    155d:      	pop	r14
    155f:      	pop	r15
    1561:      	pop	rbp
    1562:      	ret
