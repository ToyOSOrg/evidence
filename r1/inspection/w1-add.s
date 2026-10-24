       0:      	push	rbp
       1:      	push	r15
       3:      	push	r14
       5:      	push	r13
       7:      	push	r12
       9:      	push	rbx
       a:      	sub	rsp, 0x100
      11:      	mov	qword ptr [rsp - 0x8], rdx
      16:      	mov	qword ptr [rsp + 0x78], rdi
      1b:      	mov	rdi, qword ptr [rsi + 0x40]
      1f:      	mov	qword ptr [rsp + 0x60], rdi
      24:      	mov	rax, qword ptr [rsi + 0x48]
      28:      	mov	qword ptr [rsp + 0x70], rax
      2d:      	mov	r10, qword ptr [rsi + 0x50]
      31:      	mov	qword ptr [rsp + 0x58], r10
      36:      	mov	rcx, qword ptr [rsi + 0x58]
      3a:      	mov	qword ptr [rsp + 0x68], rcx
      3f:      	mov	rdx, rdi
      42:      	mulx	rbx, r11, rax
      47:      	mulx	rbp, r13, r10
      4c:      	add	rbx, r13
      4f:      	mulx	r8, r13, rcx
      54:      	adc	rbp, r13
      57:      	adc	r8, 0x0
      5b:      	mov	rdx, rax
      5e:      	mulx	r9, r13, r10
      63:      	add	rbp, r13
      66:      	adc	r8, r9
      69:      	mulx	r14, r13, rcx
      6e:      	adc	r14, 0x0
      72:      	add	r8, r13
      75:      	adc	r14, 0x0
      79:      	mov	rdx, r10
      7c:      	mulx	r15, r13, rcx
      81:      	add	r14, r13
      84:      	adc	r15, 0x0
      88:      	xor	r12d, r12d
      8b:      	add	r11, r11
      8e:      	adc	rbx, rbx
      91:      	adc	rbp, rbp
      94:      	adc	r8, r8
      97:      	adc	r14, r14
      9a:      	adc	r15, r15
      9d:      	adc	r12, 0x0
      a1:      	mov	rdx, rdi
      a4:      	mulx	r9, rdi, rdx
      a9:      	add	r11, r9
      ac:      	mov	rdx, rax
      af:      	mulx	r9, r13, rdx
      b4:      	adc	rbx, r13
      b7:      	adc	rbp, r9
      ba:      	mov	rdx, r10
      bd:      	mulx	r9, r13, rdx
      c2:      	adc	r8, r13
      c5:      	adc	r14, r9
      c8:      	mov	rdx, rcx
      cb:      	mulx	r9, r13, rdx
      d0:      	adc	r15, r13
      d3:      	adc	r12, r9
      d6:      	mov	r13, rdi
      d9:      	shl	r13, 0x20
      dd:      	mov	r9, rdi
      e0:      	shr	r9, 0x20
      e4:      	mov	rdx, rdi
      e7:      	sub	rdi, r13
      ea:      	sbb	rdx, r9
      ed:      	add	r11, r13
      f0:      	adc	rbx, r9
      f3:      	adc	rbp, rdi
      f6:      	adc	r8, rdx
      f9:      	adc	r14, 0x0
      fd:      	adc	r15, 0x0
     101:      	adc	r12, 0x0
     105:      	mov	edi, 0x0
     10a:      	adc	rdi, 0x0
     10e:      	mov	r13, r11
     111:      	shl	r13, 0x20
     115:      	mov	r9, r11
     118:      	shr	r9, 0x20
     11c:      	mov	rdx, r11
     11f:      	sub	r11, r13
     122:      	sbb	rdx, r9
     125:      	add	rbx, r13
     128:      	adc	rbp, r9
     12b:      	adc	r8, r11
     12e:      	adc	r14, rdx
     131:      	adc	r15, 0x0
     135:      	adc	r12, 0x0
     139:      	adc	rdi, 0x0
     13d:      	mov	r13, rbx
     140:      	shl	r13, 0x20
     144:      	mov	r9, rbx
     147:      	shr	r9, 0x20
     14b:      	mov	rdx, rbx
     14e:      	sub	rbx, r13
     151:      	sbb	rdx, r9
     154:      	add	rbp, r13
     157:      	adc	r8, r9
     15a:      	adc	r14, rbx
     15d:      	adc	r15, rdx
     160:      	adc	r12, 0x0
     164:      	adc	rdi, 0x0
     168:      	mov	r13, rbp
     16b:      	shl	r13, 0x20
     16f:      	mov	r9, rbp
     172:      	shr	r9, 0x20
     176:      	mov	rdx, rbp
     179:      	sub	rbp, r13
     17c:      	sbb	rdx, r9
     17f:      	add	r8, r13
     182:      	adc	r14, r9
     185:      	adc	r15, rbp
     188:      	adc	r12, rdx
     18b:      	adc	rdi, 0x0
     18f:      	mov	rax, r8
     192:      	mov	r10, r14
     195:      	mov	rcx, r15
     198:      	mov	rdx, r12
     19b:      	mov	r13d, 0xffffffff
     1a1:      	movabs	r9, -0xffffffff
     1ab:      	sub	rax, -0x1
     1af:      	sbb	r10, r13
     1b2:      	sbb	rcx, 0x0
     1b6:      	sbb	rdx, r9
     1b9:      	sbb	rdi, 0x0
     1bd:      	cmovae	r8, rax
     1c1:      	cmovae	r14, r10
     1c5:      	cmovae	r15, rcx
     1c9:      	cmovae	r12, rdx
     1cd:      	mov	qword ptr [rsp - 0x80], r12
     1d2:      	mov	qword ptr [rsp - 0x60], r8
     1d7:      	mov	qword ptr [rsp + 0x80], r8
     1df:      	mov	qword ptr [rsp + 0x88], r14
     1e7:      	mov	qword ptr [rsp + 0x90], r15
     1ef:      	mov	rax, qword ptr [rsp - 0x80]
     1f4:      	mov	qword ptr [rsp + 0x98], rax
     1fc:      	mov	r12, qword ptr [rsp - 0x8]
     201:      	mov	rdi, qword ptr [r12 + 0x40]
     206:      	mov	qword ptr [rsp + 0x50], rdi
     20b:      	mov	rax, qword ptr [r12 + 0x48]
     210:      	mov	qword ptr [rsp - 0x38], rax
     215:      	mov	r9, qword ptr [r12 + 0x50]
     21a:      	mov	qword ptr [rsp - 0x48], r9
     21f:      	mov	rcx, qword ptr [r12 + 0x58]
     224:      	mov	qword ptr [rsp - 0x40], rcx
     229:      	mov	rdx, rdi
     22c:      	mulx	rbx, r10, rax
     231:      	mulx	r14, rbp, r9
     236:      	add	rbx, rbp
     239:      	mulx	r11, rbp, rcx
     23e:      	adc	r14, rbp
     241:      	adc	r11, 0x0
     245:      	mov	rdx, rax
     248:      	mulx	r15, rbp, r9
     24d:      	add	r14, rbp
     250:      	adc	r11, r15
     253:      	mulx	r13, rbp, rcx
     258:      	adc	r13, 0x0
     25c:      	add	r11, rbp
     25f:      	adc	r13, 0x0
     263:      	mov	rdx, r9
     266:      	mulx	r8, rbp, rcx
     26b:      	add	r13, rbp
     26e:      	adc	r8, 0x0
     272:      	xor	r12d, r12d
     275:      	add	r10, r10
     278:      	adc	rbx, rbx
     27b:      	adc	r14, r14
     27e:      	adc	r11, r11
     281:      	adc	r13, r13
     284:      	adc	r8, r8
     287:      	adc	r12, 0x0
     28b:      	mov	rdx, rdi
     28e:      	mulx	r15, rdi, rdx
     293:      	add	r10, r15
     296:      	mov	rdx, rax
     299:      	mulx	r15, rbp, rdx
     29e:      	adc	rbx, rbp
     2a1:      	adc	r14, r15
     2a4:      	mov	rdx, r9
     2a7:      	mulx	r15, rbp, rdx
     2ac:      	adc	r11, rbp
     2af:      	adc	r13, r15
     2b2:      	mov	rdx, rcx
     2b5:      	mulx	r15, rbp, rdx
     2ba:      	adc	r8, rbp
     2bd:      	adc	r12, r15
     2c0:      	mov	rbp, rdi
     2c3:      	shl	rbp, 0x20
     2c7:      	mov	r15, rdi
     2ca:      	shr	r15, 0x20
     2ce:      	mov	rdx, rdi
     2d1:      	sub	rdi, rbp
     2d4:      	sbb	rdx, r15
     2d7:      	add	r10, rbp
     2da:      	adc	rbx, r15
     2dd:      	adc	r14, rdi
     2e0:      	adc	r11, rdx
     2e3:      	adc	r13, 0x0
     2e7:      	adc	r8, 0x0
     2eb:      	adc	r12, 0x0
     2ef:      	mov	edi, 0x0
     2f4:      	adc	rdi, 0x0
     2f8:      	mov	rbp, r10
     2fb:      	shl	rbp, 0x20
     2ff:      	mov	r15, r10
     302:      	shr	r15, 0x20
     306:      	mov	rdx, r10
     309:      	sub	r10, rbp
     30c:      	sbb	rdx, r15
     30f:      	add	rbx, rbp
     312:      	adc	r14, r15
     315:      	adc	r11, r10
     318:      	adc	r13, rdx
     31b:      	adc	r8, 0x0
     31f:      	adc	r12, 0x0
     323:      	adc	rdi, 0x0
     327:      	mov	rbp, rbx
     32a:      	shl	rbp, 0x20
     32e:      	mov	r15, rbx
     331:      	shr	r15, 0x20
     335:      	mov	rdx, rbx
     338:      	sub	rbx, rbp
     33b:      	sbb	rdx, r15
     33e:      	add	r14, rbp
     341:      	adc	r11, r15
     344:      	adc	r13, rbx
     347:      	adc	r8, rdx
     34a:      	adc	r12, 0x0
     34e:      	adc	rdi, 0x0
     352:      	mov	rbp, r14
     355:      	shl	rbp, 0x20
     359:      	mov	r15, r14
     35c:      	shr	r15, 0x20
     360:      	mov	rdx, r14
     363:      	sub	r14, rbp
     366:      	sbb	rdx, r15
     369:      	add	r11, rbp
     36c:      	adc	r13, r15
     36f:      	adc	r8, r14
     372:      	adc	r12, rdx
     375:      	adc	rdi, 0x0
     379:      	mov	rax, r11
     37c:      	mov	r9, r13
     37f:      	mov	rcx, r8
     382:      	mov	rdx, r12
     385:      	mov	ebp, 0xffffffff
     38a:      	movabs	r15, -0xffffffff
     394:      	sub	rax, -0x1
     398:      	sbb	r9, rbp
     39b:      	sbb	rcx, 0x0
     39f:      	sbb	rdx, r15
     3a2:      	sbb	rdi, 0x0
     3a6:      	cmovae	r11, rax
     3aa:      	cmovae	r13, r9
     3ae:      	cmovae	r8, rcx
     3b2:      	cmovae	r12, rdx
     3b6:      	mov	qword ptr [rsp - 0x68], r11
     3bb:      	mov	qword ptr [rsp + 0xa0], r11
     3c3:      	mov	qword ptr [rsp + 0xa8], r13
     3cb:      	mov	qword ptr [rsp + 0xb0], r8
     3d3:      	mov	qword ptr [rsp + 0xb8], r12
     3db:      	mov	rax, qword ptr [rsi]
     3de:      	mov	rcx, qword ptr [rsi + 0x8]
     3e2:      	mov	r10, qword ptr [rsi + 0x10]
     3e6:      	mov	r14, qword ptr [rsi + 0x18]
     3ea:      	mov	rdx, r11
     3ed:      	lea	r12, [rsp + 0xa0]
     3f5:      	mulx	r8, rdi, rax
     3fa:      	mulx	r9, r15, rcx
     3ff:      	add	r8, r15
     402:      	mulx	r11, r15, r10
     407:      	adc	r9, r15
     40a:      	mulx	rbx, r15, r14
     40f:      	adc	r11, r15
     412:      	adc	rbx, 0x0
     416:      	xor	ebp, ebp
     418:      	mov	r15, rdi
     41b:      	shl	r15, 0x20
     41f:      	mov	r13, rdi
     422:      	shr	r13, 0x20
     426:      	mov	rdx, rdi
     429:      	sub	rdi, r15
     42c:      	sbb	rdx, r13
     42f:      	add	r8, r15
     432:      	adc	r9, r13
     435:      	adc	r11, rdi
     438:      	adc	rbx, rdx
     43b:      	adc	rbp, 0x0
     43f:      	mov	rdx, qword ptr [r12 + 0x8]
     444:      	xor	edi, edi
     446:      	mulx	r13, r15, rax
     44b:      	adcx	r8, r15
     451:      	adox	r9, r13
     457:      	mulx	r13, r15, rcx
     45c:      	adcx	r9, r15
     462:      	adox	r11, r13
     468:      	mulx	r13, r15, r10
     46d:      	adcx	r11, r15
     473:      	adox	rbx, r13
     479:      	mulx	r13, r15, r14
     47e:      	adcx	rbx, r15
     484:      	adox	rbp, r13
     48a:      	adcx	rbp, rdi
     490:      	adox	rdi, rdi
     496:      	adc	rdi, 0x0
     49a:      	mov	r15, r8
     49d:      	shl	r15, 0x20
     4a1:      	mov	r13, r8
     4a4:      	shr	r13, 0x20
     4a8:      	mov	rdx, r8
     4ab:      	sub	r8, r15
     4ae:      	sbb	rdx, r13
     4b1:      	add	r9, r15
     4b4:      	adc	r11, r13
     4b7:      	adc	rbx, r8
     4ba:      	adc	rbp, rdx
     4bd:      	adc	rdi, 0x0
     4c1:      	mov	rdx, qword ptr [r12 + 0x10]
     4c6:      	xor	r8d, r8d
     4c9:      	mulx	r13, r15, rax
     4ce:      	adcx	r9, r15
     4d4:      	adox	r11, r13
     4da:      	mulx	r13, r15, rcx
     4df:      	adcx	r11, r15
     4e5:      	adox	rbx, r13
     4eb:      	mulx	r13, r15, r10
     4f0:      	adcx	rbx, r15
     4f6:      	adox	rbp, r13
     4fc:      	mulx	r13, r15, r14
     501:      	adcx	rbp, r15
     507:      	adox	rdi, r13
     50d:      	adcx	rdi, r8
     513:      	adox	r8, r8
     519:      	adc	r8, 0x0
     51d:      	mov	r15, r9
     520:      	shl	r15, 0x20
     524:      	mov	r13, r9
     527:      	shr	r13, 0x20
     52b:      	mov	rdx, r9
     52e:      	sub	r9, r15
     531:      	sbb	rdx, r13
     534:      	add	r11, r15
     537:      	adc	rbx, r13
     53a:      	adc	rbp, r9
     53d:      	adc	rdi, rdx
     540:      	adc	r8, 0x0
     544:      	mov	rdx, qword ptr [r12 + 0x18]
     549:      	xor	r9d, r9d
     54c:      	mulx	r13, r15, rax
     551:      	adcx	r11, r15
     557:      	adox	rbx, r13
     55d:      	mulx	r13, r15, rcx
     562:      	adcx	rbx, r15
     568:      	adox	rbp, r13
     56e:      	mulx	r13, r15, r10
     573:      	adcx	rbp, r15
     579:      	adox	rdi, r13
     57f:      	mulx	r13, r15, r14
     584:      	adcx	rdi, r15
     58a:      	adox	r8, r13
     590:      	adcx	r8, r9
     596:      	adox	r9, r9
     59c:      	adc	r9, 0x0
     5a0:      	mov	r15, r11
     5a3:      	shl	r15, 0x20
     5a7:      	mov	r13, r11
     5aa:      	shr	r13, 0x20
     5ae:      	mov	rdx, r11
     5b1:      	sub	r11, r15
     5b4:      	sbb	rdx, r13
     5b7:      	add	rbx, r15
     5ba:      	adc	rbp, r13
     5bd:      	adc	rdi, r11
     5c0:      	adc	r8, rdx
     5c3:      	adc	r9, 0x0
     5c7:      	mov	rax, rbx
     5ca:      	mov	rcx, rbp
     5cd:      	mov	r10, rdi
     5d0:      	mov	r14, r8
     5d3:      	mov	r15d, 0xffffffff
     5d9:      	movabs	r13, -0xffffffff
     5e3:      	sub	rax, -0x1
     5e7:      	sbb	rcx, r15
     5ea:      	sbb	r10, 0x0
     5ee:      	sbb	r14, r13
     5f1:      	sbb	r9, 0x0
     5f5:      	cmovb	rax, rbx
     5f9:      	cmovb	rcx, rbp
     5fd:      	cmovb	r10, rdi
     601:      	cmovb	r14, r8
     605:      	mov	qword ptr [rsp - 0x78], rax
     60a:      	mov	qword ptr [rsp - 0x80], r14
     60f:      	mov	qword ptr [rsp - 0x58], r10
     614:      	mov	qword ptr [rsp - 0x70], rcx
     619:      	mov	r12, qword ptr [rsp - 0x8]
     61e:      	mov	rax, qword ptr [r12]
     622:      	mov	r10, qword ptr [r12 + 0x8]
     627:      	mov	rdi, qword ptr [r12 + 0x10]
     62c:      	mov	r14, qword ptr [r12 + 0x18]
     631:      	lea	r12, [rsp + 0x80]
     639:      	mov	rdx, qword ptr [rsp - 0x60]
     63e:      	mulx	r9, r8, rax
     643:      	mulx	r11, r13, r10
     648:      	add	r9, r13
     64b:      	mulx	rbx, r13, rdi
     650:      	adc	r11, r13
     653:      	mulx	rbp, r13, r14
     658:      	adc	rbx, r13
     65b:      	adc	rbp, 0x0
     65f:      	xor	r15d, r15d
     662:      	mov	r13, r8
     665:      	shl	r13, 0x20
     669:      	mov	rcx, r8
     66c:      	shr	rcx, 0x20
     670:      	mov	rdx, r8
     673:      	sub	r8, r13
     676:      	sbb	rdx, rcx
     679:      	add	r9, r13
     67c:      	adc	r11, rcx
     67f:      	adc	rbx, r8
     682:      	adc	rbp, rdx
     685:      	adc	r15, 0x0
     689:      	mov	rdx, qword ptr [r12 + 0x8]
     68e:      	xor	r8d, r8d
     691:      	mulx	rcx, r13, rax
     696:      	adcx	r9, r13
     69c:      	adox	r11, rcx
     6a2:      	mulx	rcx, r13, r10
     6a7:      	adcx	r11, r13
     6ad:      	adox	rbx, rcx
     6b3:      	mulx	rcx, r13, rdi
     6b8:      	adcx	rbx, r13
     6be:      	adox	rbp, rcx
     6c4:      	mulx	rcx, r13, r14
     6c9:      	adcx	rbp, r13
     6cf:      	adox	r15, rcx
     6d5:      	adcx	r15, r8
     6db:      	adox	r8, r8
     6e1:      	adc	r8, 0x0
     6e5:      	mov	r13, r9
     6e8:      	shl	r13, 0x20
     6ec:      	mov	rcx, r9
     6ef:      	shr	rcx, 0x20
     6f3:      	mov	rdx, r9
     6f6:      	sub	r9, r13
     6f9:      	sbb	rdx, rcx
     6fc:      	add	r11, r13
     6ff:      	adc	rbx, rcx
     702:      	adc	rbp, r9
     705:      	adc	r15, rdx
     708:      	adc	r8, 0x0
     70c:      	mov	rdx, qword ptr [r12 + 0x10]
     711:      	xor	r9d, r9d
     714:      	mulx	rcx, r13, rax
     719:      	adcx	r11, r13
     71f:      	adox	rbx, rcx
     725:      	mulx	rcx, r13, r10
     72a:      	adcx	rbx, r13
     730:      	adox	rbp, rcx
     736:      	mulx	rcx, r13, rdi
     73b:      	adcx	rbp, r13
     741:      	adox	r15, rcx
     747:      	mulx	rcx, r13, r14
     74c:      	adcx	r15, r13
     752:      	adox	r8, rcx
     758:      	adcx	r8, r9
     75e:      	adox	r9, r9
     764:      	adc	r9, 0x0
     768:      	mov	r13, r11
     76b:      	shl	r13, 0x20
     76f:      	mov	rcx, r11
     772:      	shr	rcx, 0x20
     776:      	mov	rdx, r11
     779:      	sub	r11, r13
     77c:      	sbb	rdx, rcx
     77f:      	add	rbx, r13
     782:      	adc	rbp, rcx
     785:      	adc	r15, r11
     788:      	adc	r8, rdx
     78b:      	adc	r9, 0x0
     78f:      	mov	rdx, qword ptr [r12 + 0x18]
     794:      	xor	r11d, r11d
     797:      	mulx	rcx, r13, rax
     79c:      	adcx	rbx, r13
     7a2:      	adox	rbp, rcx
     7a8:      	mulx	rcx, r13, r10
     7ad:      	adcx	rbp, r13
     7b3:      	adox	r15, rcx
     7b9:      	mulx	rcx, r13, rdi
     7be:      	adcx	r15, r13
     7c4:      	adox	r8, rcx
     7ca:      	mulx	rcx, r13, r14
     7cf:      	adcx	r8, r13
     7d5:      	adox	r9, rcx
     7db:      	adcx	r9, r11
     7e1:      	adox	r11, r11
     7e7:      	adc	r11, 0x0
     7eb:      	mov	r13, rbx
     7ee:      	shl	r13, 0x20
     7f2:      	mov	rcx, rbx
     7f5:      	shr	rcx, 0x20
     7f9:      	mov	rdx, rbx
     7fc:      	sub	rbx, r13
     7ff:      	sbb	rdx, rcx
     802:      	add	rbp, r13
     805:      	adc	r15, rcx
     808:      	adc	r8, rbx
     80b:      	adc	r9, rdx
     80e:      	adc	r11, 0x0
     812:      	mov	rax, rbp
     815:      	mov	r10, r15
     818:      	mov	rdi, r8
     81b:      	mov	r14, r9
     81e:      	mov	r13d, 0xffffffff
     824:      	movabs	rcx, -0xffffffff
     82e:      	sub	rax, -0x1
     832:      	sbb	r10, r13
     835:      	sbb	rdi, 0x0
     839:      	sbb	r14, rcx
     83c:      	sbb	r11, 0x0
     840:      	cmovb	rax, rbp
     844:      	cmovb	r10, r15
     848:      	cmovb	rdi, r8
     84c:      	cmovb	r14, r9
     850:      	mov	qword ptr [rsp - 0x30], rdi
     855:      	mov	qword ptr [rsp - 0x28], rax
     85a:      	mov	qword ptr [rsp - 0x18], r14
     85f:      	mov	qword ptr [rsp - 0x10], r10
     864:      	mov	rdi, qword ptr [rsp + 0x50]
     869:      	mov	rdx, qword ptr [rsp - 0x68]
     86e:      	mov	r14, qword ptr [rsp - 0x38]
     873:      	mov	r12, qword ptr [rsp - 0x48]
     878:      	mov	rbx, qword ptr [rsp - 0x40]
     87d:      	lea	rax, [rsp + 0xa0]
     885:      	mulx	r8, rcx, rdi
     88a:      	mulx	r9, r13, r14
     88f:      	add	r8, r13
     892:      	mulx	r11, r13, r12
     897:      	adc	r9, r13
     89a:      	mulx	rbp, r13, rbx
     89f:      	adc	r11, r13
     8a2:      	adc	rbp, 0x0
     8a6:      	xor	r15d, r15d
     8a9:      	mov	r13, rcx
     8ac:      	shl	r13, 0x20
     8b0:      	mov	r10, rcx
     8b3:      	shr	r10, 0x20
     8b7:      	mov	rdx, rcx
     8ba:      	sub	rcx, r13
     8bd:      	sbb	rdx, r10
     8c0:      	add	r8, r13
     8c3:      	adc	r9, r10
     8c6:      	adc	r11, rcx
     8c9:      	adc	rbp, rdx
     8cc:      	adc	r15, 0x0
     8d0:      	mov	rdx, qword ptr [rax + 0x8]
     8d4:      	xor	ecx, ecx
     8d6:      	mulx	r10, r13, rdi
     8db:      	adcx	r8, r13
     8e1:      	adox	r9, r10
     8e7:      	mulx	r10, r13, r14
     8ec:      	adcx	r9, r13
     8f2:      	adox	r11, r10
     8f8:      	mulx	r10, r13, r12
     8fd:      	adcx	r11, r13
     903:      	adox	rbp, r10
     909:      	mulx	r10, r13, rbx
     90e:      	adcx	rbp, r13
     914:      	adox	r15, r10
     91a:      	adcx	r15, rcx
     920:      	adox	rcx, rcx
     926:      	adc	rcx, 0x0
     92a:      	mov	r13, r8
     92d:      	shl	r13, 0x20
     931:      	mov	r10, r8
     934:      	shr	r10, 0x20
     938:      	mov	rdx, r8
     93b:      	sub	r8, r13
     93e:      	sbb	rdx, r10
     941:      	add	r9, r13
     944:      	adc	r11, r10
     947:      	adc	rbp, r8
     94a:      	adc	r15, rdx
     94d:      	adc	rcx, 0x0
     951:      	mov	rdx, qword ptr [rax + 0x10]
     955:      	xor	r8d, r8d
     958:      	mulx	r10, r13, rdi
     95d:      	adcx	r9, r13
     963:      	adox	r11, r10
     969:      	mulx	r10, r13, r14
     96e:      	adcx	r11, r13
     974:      	adox	rbp, r10
     97a:      	mulx	r10, r13, r12
     97f:      	adcx	rbp, r13
     985:      	adox	r15, r10
     98b:      	mulx	r10, r13, rbx
     990:      	adcx	r15, r13
     996:      	adox	rcx, r10
     99c:      	adcx	rcx, r8
     9a2:      	adox	r8, r8
     9a8:      	adc	r8, 0x0
     9ac:      	mov	r13, r9
     9af:      	shl	r13, 0x20
     9b3:      	mov	r10, r9
     9b6:      	shr	r10, 0x20
     9ba:      	mov	rdx, r9
     9bd:      	sub	r9, r13
     9c0:      	sbb	rdx, r10
     9c3:      	add	r11, r13
     9c6:      	adc	rbp, r10
     9c9:      	adc	r15, r9
     9cc:      	adc	rcx, rdx
     9cf:      	adc	r8, 0x0
     9d3:      	mov	rdx, qword ptr [rax + 0x18]
     9d7:      	xor	r9d, r9d
     9da:      	mulx	r10, r13, rdi
     9df:      	adcx	r11, r13
     9e5:      	adox	rbp, r10
     9eb:      	mulx	r10, r13, r14
     9f0:      	adcx	rbp, r13
     9f6:      	adox	r15, r10
     9fc:      	mulx	r10, r13, r12
     a01:      	adcx	r15, r13
     a07:      	adox	rcx, r10
     a0d:      	mulx	r10, r13, rbx
     a12:      	adcx	rcx, r13
     a18:      	adox	r8, r10
     a1e:      	adcx	r8, r9
     a24:      	adox	r9, r9
     a2a:      	adc	r9, 0x0
     a2e:      	mov	r13, r11
     a31:      	shl	r13, 0x20
     a35:      	mov	r10, r11
     a38:      	shr	r10, 0x20
     a3c:      	mov	rdx, r11
     a3f:      	sub	r11, r13
     a42:      	sbb	rdx, r10
     a45:      	add	rbp, r13
     a48:      	adc	r15, r10
     a4b:      	adc	rcx, r11
     a4e:      	adc	r8, rdx
     a51:      	adc	r9, 0x0
     a55:      	mov	rdi, rbp
     a58:      	mov	r14, r15
     a5b:      	mov	r12, rcx
     a5e:      	mov	rbx, r8
     a61:      	mov	r13d, 0xffffffff
     a67:      	movabs	r10, -0xffffffff
     a71:      	sub	rdi, -0x1
     a75:      	sbb	r14, r13
     a78:      	sbb	r12, 0x0
     a7c:      	sbb	rbx, r10
     a7f:      	sbb	r9, 0x0
     a83:      	cmovb	rdi, rbp
     a87:      	cmovb	r14, r15
     a8b:      	cmovb	r12, rcx
     a8f:      	cmovb	rbx, r8
     a93:      	mov	qword ptr [rsp], rdi
     a97:      	mov	qword ptr [rsp + 0x8], r14
     a9c:      	mov	qword ptr [rsp + 0x10], r12
     aa1:      	mov	qword ptr [rsp + 0x18], rbx
     aa6:      	mov	rcx, qword ptr [rsi + 0x20]
     aaa:      	mov	r14, qword ptr [rsi + 0x28]
     aae:      	mov	r12, qword ptr [rsi + 0x30]
     ab2:      	mov	r13, qword ptr [rsi + 0x38]
     ab6:      	mov	rax, rsp
     ab9:      	mov	rdx, rdi
     abc:      	mulx	r8, rsi, rcx
     ac1:      	mulx	r9, rbp, r14
     ac6:      	add	r8, rbp
     ac9:      	mulx	r10, rbp, r12
     ace:      	adc	r9, rbp
     ad1:      	mulx	r11, rbp, r13
     ad6:      	adc	r10, rbp
     ad9:      	adc	r11, 0x0
     add:      	xor	ebx, ebx
     adf:      	mov	rbp, rsi
     ae2:      	shl	rbp, 0x20
     ae6:      	mov	r15, rsi
     ae9:      	shr	r15, 0x20
     aed:      	mov	rdx, rsi
     af0:      	sub	rsi, rbp
     af3:      	sbb	rdx, r15
     af6:      	add	r8, rbp
     af9:      	adc	r9, r15
     afc:      	adc	r10, rsi
     aff:      	adc	r11, rdx
     b02:      	adc	rbx, 0x0
     b06:      	mov	rdx, qword ptr [rax + 0x8]
     b0a:      	xor	esi, esi
     b0c:      	mulx	r15, rbp, rcx
     b11:      	adcx	r8, rbp
     b17:      	adox	r9, r15
     b1d:      	mulx	r15, rbp, r14
     b22:      	adcx	r9, rbp
     b28:      	adox	r10, r15
     b2e:      	mulx	r15, rbp, r12
     b33:      	adcx	r10, rbp
     b39:      	adox	r11, r15
     b3f:      	mulx	r15, rbp, r13
     b44:      	adcx	r11, rbp
     b4a:      	adox	rbx, r15
     b50:      	adcx	rbx, rsi
     b56:      	adox	rsi, rsi
     b5c:      	adc	rsi, 0x0
     b60:      	mov	rbp, r8
     b63:      	shl	rbp, 0x20
     b67:      	mov	r15, r8
     b6a:      	shr	r15, 0x20
     b6e:      	mov	rdx, r8
     b71:      	sub	r8, rbp
     b74:      	sbb	rdx, r15
     b77:      	add	r9, rbp
     b7a:      	adc	r10, r15
     b7d:      	adc	r11, r8
     b80:      	adc	rbx, rdx
     b83:      	adc	rsi, 0x0
     b87:      	mov	rdx, qword ptr [rax + 0x10]
     b8b:      	xor	r8d, r8d
     b8e:      	mulx	r15, rbp, rcx
     b93:      	adcx	r9, rbp
     b99:      	adox	r10, r15
     b9f:      	mulx	r15, rbp, r14
     ba4:      	adcx	r10, rbp
     baa:      	adox	r11, r15
     bb0:      	mulx	r15, rbp, r12
     bb5:      	adcx	r11, rbp
     bbb:      	adox	rbx, r15
     bc1:      	mulx	r15, rbp, r13
     bc6:      	adcx	rbx, rbp
     bcc:      	adox	rsi, r15
     bd2:      	adcx	rsi, r8
     bd8:      	adox	r8, r8
     bde:      	adc	r8, 0x0
     be2:      	mov	rbp, r9
     be5:      	shl	rbp, 0x20
     be9:      	mov	r15, r9
     bec:      	shr	r15, 0x20
     bf0:      	mov	rdx, r9
     bf3:      	sub	r9, rbp
     bf6:      	sbb	rdx, r15
     bf9:      	add	r10, rbp
     bfc:      	adc	r11, r15
     bff:      	adc	rbx, r9
     c02:      	adc	rsi, rdx
     c05:      	adc	r8, 0x0
     c09:      	mov	rdx, qword ptr [rax + 0x18]
     c0d:      	xor	r9d, r9d
     c10:      	mulx	r15, rbp, rcx
     c15:      	adcx	r10, rbp
     c1b:      	adox	r11, r15
     c21:      	mulx	r15, rbp, r14
     c26:      	adcx	r11, rbp
     c2c:      	adox	rbx, r15
     c32:      	mulx	r15, rbp, r12
     c37:      	adcx	rbx, rbp
     c3d:      	adox	rsi, r15
     c43:      	mulx	r15, rbp, r13
     c48:      	adcx	rsi, rbp
     c4e:      	adox	r8, r15
     c54:      	adcx	r8, r9
     c5a:      	adox	r9, r9
     c60:      	adc	r9, 0x0
     c64:      	mov	rbp, r10
     c67:      	shl	rbp, 0x20
     c6b:      	mov	r15, r10
     c6e:      	shr	r15, 0x20
     c72:      	mov	rdx, r10
     c75:      	sub	r10, rbp
     c78:      	sbb	rdx, r15
     c7b:      	add	r11, rbp
     c7e:      	adc	rbx, r15
     c81:      	adc	rsi, r10
     c84:      	adc	r8, rdx
     c87:      	adc	r9, 0x0
     c8b:      	mov	rcx, r11
     c8e:      	mov	r14, rbx
     c91:      	mov	r12, rsi
     c94:      	mov	r13, r8
     c97:      	mov	ebp, 0xffffffff
     c9c:      	movabs	r15, -0xffffffff
     ca6:      	sub	rcx, -0x1
     caa:      	sbb	r14, rbp
     cad:      	sbb	r12, 0x0
     cb1:      	sbb	r13, r15
     cb4:      	sbb	r9, 0x0
     cb8:      	cmovb	rcx, r11
     cbc:      	cmovb	r14, rbx
     cc0:      	cmovb	r12, rsi
     cc4:      	cmovb	r13, r8
     cc8:      	mov	qword ptr [rsp + 0x30], r14
     ccd:      	mov	qword ptr [rsp + 0x38], r12
     cd2:      	mov	qword ptr [rsp + 0x40], rcx
     cd7:      	mov	qword ptr [rsp + 0x48], r13
     cdc:      	mov	rcx, qword ptr [rsp + 0x70]
     ce1:      	mov	r8, qword ptr [rsp + 0x68]
     ce6:      	mov	rsi, qword ptr [rsp + 0x60]
     ceb:      	mov	r9, qword ptr [rsp + 0x58]
     cf0:      	mov	rdx, qword ptr [rsp - 0x60]
     cf5:      	lea	rax, [rsp + 0x80]
     cfd:      	mulx	r11, r10, rsi
     d02:      	mulx	rbx, r13, rcx
     d07:      	add	r11, r13
     d0a:      	mulx	rbp, r13, r9
     d0f:      	adc	rbx, r13
     d12:      	mulx	r15, r13, r8
     d17:      	adc	rbp, r13
     d1a:      	adc	r15, 0x0
     d1e:      	xor	r12d, r12d
     d21:      	mov	r13, r10
     d24:      	shl	r13, 0x20
     d28:      	mov	r14, r10
     d2b:      	shr	r14, 0x20
     d2f:      	mov	rdx, r10
     d32:      	sub	r10, r13
     d35:      	sbb	rdx, r14
     d38:      	add	r11, r13
     d3b:      	adc	rbx, r14
     d3e:      	adc	rbp, r10
     d41:      	adc	r15, rdx
     d44:      	adc	r12, 0x0
     d48:      	mov	rdx, qword ptr [rax + 0x8]
     d4c:      	xor	r10d, r10d
     d4f:      	mulx	r14, r13, rsi
     d54:      	adcx	r11, r13
     d5a:      	adox	rbx, r14
     d60:      	mulx	r14, r13, rcx
     d65:      	adcx	rbx, r13
     d6b:      	adox	rbp, r14
     d71:      	mulx	r14, r13, r9
     d76:      	adcx	rbp, r13
     d7c:      	adox	r15, r14
     d82:      	mulx	r14, r13, r8
     d87:      	adcx	r15, r13
     d8d:      	adox	r12, r14
     d93:      	adcx	r12, r10
     d99:      	adox	r10, r10
     d9f:      	adc	r10, 0x0
     da3:      	mov	r13, r11
     da6:      	shl	r13, 0x20
     daa:      	mov	r14, r11
     dad:      	shr	r14, 0x20
     db1:      	mov	rdx, r11
     db4:      	sub	r11, r13
     db7:      	sbb	rdx, r14
     dba:      	add	rbx, r13
     dbd:      	adc	rbp, r14
     dc0:      	adc	r15, r11
     dc3:      	adc	r12, rdx
     dc6:      	adc	r10, 0x0
     dca:      	mov	rdx, qword ptr [rax + 0x10]
     dce:      	xor	r11d, r11d
     dd1:      	mulx	r14, r13, rsi
     dd6:      	adcx	rbx, r13
     ddc:      	adox	rbp, r14
     de2:      	mulx	r14, r13, rcx
     de7:      	adcx	rbp, r13
     ded:      	adox	r15, r14
     df3:      	mulx	r14, r13, r9
     df8:      	adcx	r15, r13
     dfe:      	adox	r12, r14
     e04:      	mulx	r14, r13, r8
     e09:      	adcx	r12, r13
     e0f:      	adox	r10, r14
     e15:      	adcx	r10, r11
     e1b:      	adox	r11, r11
     e21:      	adc	r11, 0x0
     e25:      	mov	r13, rbx
     e28:      	shl	r13, 0x20
     e2c:      	mov	r14, rbx
     e2f:      	shr	r14, 0x20
     e33:      	mov	rdx, rbx
     e36:      	sub	rbx, r13
     e39:      	sbb	rdx, r14
     e3c:      	add	rbp, r13
     e3f:      	adc	r15, r14
     e42:      	adc	r12, rbx
     e45:      	adc	r10, rdx
     e48:      	adc	r11, 0x0
     e4c:      	mov	rdx, qword ptr [rax + 0x18]
     e50:      	xor	ebx, ebx
     e52:      	mulx	r14, r13, rsi
     e57:      	adcx	rbp, r13
     e5d:      	adox	r15, r14
     e63:      	mulx	r14, r13, rcx
     e68:      	adcx	r15, r13
     e6e:      	adox	r12, r14
     e74:      	mulx	r14, r13, r9
     e79:      	adcx	r12, r13
     e7f:      	adox	r10, r14
     e85:      	mulx	r14, r13, r8
     e8a:      	adcx	r10, r13
     e90:      	adox	r11, r14
     e96:      	adcx	r11, rbx
     e9c:      	adox	rbx, rbx
     ea2:      	adc	rbx, 0x0
     ea6:      	mov	r13, rbp
     ea9:      	shl	r13, 0x20
     ead:      	mov	r14, rbp
     eb0:      	shr	r14, 0x20
     eb4:      	mov	rdx, rbp
     eb7:      	sub	rbp, r13
     eba:      	sbb	rdx, r14
     ebd:      	add	r15, r13
     ec0:      	adc	r12, r14
     ec3:      	adc	r10, rbp
     ec6:      	adc	r11, rdx
     ec9:      	adc	rbx, 0x0
     ecd:      	mov	rsi, r15
     ed0:      	mov	rcx, r12
     ed3:      	mov	r9, r10
     ed6:      	mov	r8, r11
     ed9:      	mov	r13d, 0xffffffff
     edf:      	movabs	r14, -0xffffffff
     ee9:      	sub	rsi, -0x1
     eed:      	sbb	rcx, r13
     ef0:      	sbb	r9, 0x0
     ef4:      	sbb	r8, r14
     ef7:      	sbb	rbx, 0x0
     efb:      	cmovb	rsi, r15
     eff:      	cmovb	rcx, r12
     f03:      	cmovb	r9, r10
     f07:      	cmovb	r8, r11
     f0b:      	mov	qword ptr [rsp], rsi
     f0f:      	mov	qword ptr [rsp + 0x8], rcx
     f14:      	mov	qword ptr [rsp + 0x10], r9
     f19:      	mov	qword ptr [rsp + 0x18], r8
     f1e:      	mov	rdx, qword ptr [rsp - 0x8]
     f23:      	mov	r13, qword ptr [rdx + 0x20]
     f27:      	mov	rcx, qword ptr [rdx + 0x28]
     f2b:      	mov	rbp, qword ptr [rdx + 0x30]
     f2f:      	mov	r12, qword ptr [rdx + 0x38]
     f33:      	mov	rax, rsp
     f36:      	mov	rdx, rsi
     f39:      	mulx	r8, rsi, r13
     f3e:      	mulx	r9, r14, rcx
     f43:      	add	r8, r14
     f46:      	mulx	r10, r14, rbp
     f4b:      	adc	r9, r14
     f4e:      	mulx	r11, r14, r12
     f53:      	adc	r10, r14
     f56:      	adc	r11, 0x0
     f5a:      	xor	ebx, ebx
     f5c:      	mov	r14, rsi
     f5f:      	shl	r14, 0x20
     f63:      	mov	r15, rsi
     f66:      	shr	r15, 0x20
     f6a:      	mov	rdx, rsi
     f6d:      	sub	rsi, r14
     f70:      	sbb	rdx, r15
     f73:      	add	r8, r14
     f76:      	adc	r9, r15
     f79:      	adc	r10, rsi
     f7c:      	adc	r11, rdx
     f7f:      	adc	rbx, 0x0
     f83:      	mov	rdx, qword ptr [rax + 0x8]
     f87:      	xor	esi, esi
     f89:      	mulx	r15, r14, r13
     f8e:      	adcx	r8, r14
     f94:      	adox	r9, r15
     f9a:      	mulx	r15, r14, rcx
     f9f:      	adcx	r9, r14
     fa5:      	adox	r10, r15
     fab:      	mulx	r15, r14, rbp
     fb0:      	adcx	r10, r14
     fb6:      	adox	r11, r15
     fbc:      	mulx	r15, r14, r12
     fc1:      	adcx	r11, r14
     fc7:      	adox	rbx, r15
     fcd:      	adcx	rbx, rsi
     fd3:      	adox	rsi, rsi
     fd9:      	adc	rsi, 0x0
     fdd:      	mov	r14, r8
     fe0:      	shl	r14, 0x20
     fe4:      	mov	r15, r8
     fe7:      	shr	r15, 0x20
     feb:      	mov	rdx, r8
     fee:      	sub	r8, r14
     ff1:      	sbb	rdx, r15
     ff4:      	add	r9, r14
     ff7:      	adc	r10, r15
     ffa:      	adc	r11, r8
     ffd:      	adc	rbx, rdx
    1000:      	adc	rsi, 0x0
    1004:      	mov	rdx, qword ptr [rax + 0x10]
    1008:      	xor	r8d, r8d
    100b:      	mulx	r15, r14, r13
    1010:      	adcx	r9, r14
    1016:      	adox	r10, r15
    101c:      	mulx	r15, r14, rcx
    1021:      	adcx	r10, r14
    1027:      	adox	r11, r15
    102d:      	mulx	r15, r14, rbp
    1032:      	adcx	r11, r14
    1038:      	adox	rbx, r15
    103e:      	mulx	r15, r14, r12
    1043:      	adcx	rbx, r14
    1049:      	adox	rsi, r15
    104f:      	adcx	rsi, r8
    1055:      	adox	r8, r8
    105b:      	adc	r8, 0x0
    105f:      	mov	r14, r9
    1062:      	shl	r14, 0x20
    1066:      	mov	r15, r9
    1069:      	shr	r15, 0x20
    106d:      	mov	rdx, r9
    1070:      	sub	r9, r14
    1073:      	sbb	rdx, r15
    1076:      	add	r10, r14
    1079:      	adc	r11, r15
    107c:      	adc	rbx, r9
    107f:      	adc	rsi, rdx
    1082:      	adc	r8, 0x0
    1086:      	mov	rdx, qword ptr [rax + 0x18]
    108a:      	xor	r9d, r9d
    108d:      	mulx	r15, r14, r13
    1092:      	adcx	r10, r14
    1098:      	adox	r11, r15
    109e:      	mulx	r15, r14, rcx
    10a3:      	adcx	r11, r14
    10a9:      	adox	rbx, r15
    10af:      	mulx	r15, r14, rbp
    10b4:      	adcx	rbx, r14
    10ba:      	adox	rsi, r15
    10c0:      	mulx	r15, r14, r12
    10c5:      	adcx	rsi, r14
    10cb:      	adox	r8, r15
    10d1:      	adcx	r8, r9
    10d7:      	adox	r9, r9
    10dd:      	adc	r9, 0x0
    10e1:      	mov	r14, r10
    10e4:      	shl	r14, 0x20
    10e8:      	mov	r15, r10
    10eb:      	shr	r15, 0x20
    10ef:      	mov	rdx, r10
    10f2:      	sub	r10, r14
    10f5:      	sbb	rdx, r15
    10f8:      	add	r11, r14
    10fb:      	adc	rbx, r15
    10fe:      	adc	rsi, r10
    1101:      	adc	r8, rdx
    1104:      	adc	r9, 0x0
    1108:      	mov	r13, r11
    110b:      	mov	rcx, rbx
    110e:      	mov	rbp, rsi
    1111:      	mov	r12, r8
    1114:      	mov	r14d, 0xffffffff
    111a:      	movabs	r15, -0xffffffff
    1124:      	sub	r13, -0x1
    1128:      	sbb	rcx, r14
    112b:      	sbb	rbp, 0x0
    112f:      	sbb	r12, r15
    1132:      	sbb	r9, 0x0
    1136:      	cmovb	r13, r11
    113a:      	cmovb	rcx, rbx
    113e:      	cmovb	rbp, rsi
    1142:      	cmovb	r12, r8
    1146:      	mov	r9, rcx
    1149:      	mov	rcx, qword ptr [rsp - 0x70]
    114e:      	mov	rdx, qword ptr [rsp - 0x80]
    1153:      	mov	rsi, qword ptr [rsp - 0x78]
    1158:      	mov	rax, qword ptr [rsp - 0x28]
    115d:      	mov	rdi, qword ptr [rsp - 0x30]
    1162:      	mov	r8, qword ptr [rsp - 0x18]
    1167:      	mov	r11, qword ptr [rsp - 0x10]
    116c:      	mov	r10, qword ptr [rsp - 0x58]
    1171:      	sub	rax, rsi
    1174:      	sbb	r11, rcx
    1177:      	sbb	rdi, r10
    117a:      	sbb	r8, rdx
    117d:      	sbb	rsi, rsi
    1180:      	mov	rcx, rsi
    1183:      	shr	rcx, 0x20
    1187:      	mov	rdx, rsi
    118a:      	shl	rdx, 0x20
    118e:      	sub	rdx, rsi
    1191:      	add	rax, rsi
    1194:      	adc	r11, rcx
    1197:      	adc	rdi, 0x0
    119b:      	adc	r8, rdx
    119e:      	mov	qword ptr [rsp - 0x28], rax
    11a3:      	mov	qword ptr [rsp - 0x10], r11
    11a8:      	mov	qword ptr [rsp - 0x30], rdi
    11ad:      	mov	rcx, qword ptr [rsp + 0x30]
    11b2:      	mov	rdx, qword ptr [rsp + 0x48]
    11b7:      	mov	rsi, qword ptr [rsp + 0x40]
    11bc:      	mov	r10, qword ptr [rsp + 0x38]
    11c1:      	sub	r13, rsi
    11c4:      	sbb	r9, rcx
    11c7:      	sbb	rbp, r10
    11ca:      	sbb	r12, rdx
    11cd:      	sbb	rsi, rsi
    11d0:      	mov	rcx, rsi
    11d3:      	shr	rcx, 0x20
    11d7:      	mov	rdx, rsi
    11da:      	shl	rdx, 0x20
    11de:      	sub	rdx, rsi
    11e1:      	add	r13, rsi
    11e4:      	adc	r9, rcx
    11e7:      	adc	rbp, 0x0
    11eb:      	adc	r12, rdx
    11ee:      	mov	qword ptr [rsp - 0x48], r13
    11f3:      	mov	qword ptr [rsp - 0x40], r9
    11f8:      	mov	qword ptr [rsp - 0x38], rbp
    11fd:      	mov	qword ptr [rsp - 0x60], r12
    1202:      	mov	rcx, r8
    1205:      	mov	rbp, r8
    1208:      	mov	qword ptr [rsp - 0x18], r8
    120d:      	mov	r8, rax
    1210:      	mov	r9, rdi
    1213:      	mov	r10, r11
    1216:      	mov	rdx, r8
    1219:      	mulx	rbx, r11, r10
    121e:      	mulx	r14, rax, r9
    1223:      	add	rbx, rax
    1226:      	mulx	rsi, rax, rcx
    122b:      	adc	r14, rax
    122e:      	adc	rsi, 0x0
    1232:      	mov	rdx, r10
    1235:      	mulx	rdi, rax, r9
    123a:      	add	r14, rax
    123d:      	adc	rsi, rdi
    1240:      	mulx	r15, rax, rcx
    1245:      	adc	r15, 0x0
    1249:      	add	rsi, rax
    124c:      	adc	r15, 0x0
    1250:      	mov	rdx, r9
    1253:      	mulx	r13, rax, rcx
    1258:      	add	r15, rax
    125b:      	adc	r13, 0x0
    125f:      	xor	r12d, r12d
    1262:      	add	r11, r11
    1265:      	adc	rbx, rbx
    1268:      	adc	r14, r14
    126b:      	adc	rsi, rsi
    126e:      	adc	r15, r15
    1271:      	adc	r13, r13
    1274:      	adc	r12, 0x0
    1278:      	mov	rdx, r8
    127b:      	mulx	rdi, r8, rdx
    1280:      	add	r11, rdi
    1283:      	mov	rdx, r10
    1286:      	mulx	rdi, rax, rdx
    128b:      	adc	rbx, rax
    128e:      	adc	r14, rdi
    1291:      	mov	rdx, r9
    1294:      	mulx	rdi, rax, rdx
    1299:      	adc	rsi, rax
    129c:      	adc	r15, rdi
    129f:      	mov	rdx, rcx
    12a2:      	mulx	rdi, rax, rdx
    12a7:      	adc	r13, rax
    12aa:      	adc	r12, rdi
    12ad:      	mov	rax, r8
    12b0:      	shl	rax, 0x20
    12b4:      	mov	rdi, r8
    12b7:      	shr	rdi, 0x20
    12bb:      	mov	rdx, r8
    12be:      	sub	r8, rax
    12c1:      	sbb	rdx, rdi
    12c4:      	add	r11, rax
    12c7:      	adc	rbx, rdi
    12ca:      	adc	r14, r8
    12cd:      	adc	rsi, rdx
    12d0:      	adc	r15, 0x0
    12d4:      	adc	r13, 0x0
    12d8:      	adc	r12, 0x0
    12dc:      	mov	r8d, 0x0
    12e2:      	adc	r8, 0x0
    12e6:      	mov	rax, r11
    12e9:      	shl	rax, 0x20
    12ed:      	mov	rdi, r11
    12f0:      	shr	rdi, 0x20
    12f4:      	mov	rdx, r11
    12f7:      	sub	r11, rax
    12fa:      	sbb	rdx, rdi
    12fd:      	add	rbx, rax
    1300:      	adc	r14, rdi
    1303:      	adc	rsi, r11
    1306:      	adc	r15, rdx
    1309:      	adc	r13, 0x0
    130d:      	adc	r12, 0x0
    1311:      	adc	r8, 0x0
    1315:      	mov	rax, rbx
    1318:      	shl	rax, 0x20
    131c:      	mov	rdi, rbx
    131f:      	shr	rdi, 0x20
    1323:      	mov	rdx, rbx
    1326:      	sub	rbx, rax
    1329:      	sbb	rdx, rdi
    132c:      	add	r14, rax
    132f:      	adc	rsi, rdi
    1332:      	adc	r15, rbx
    1335:      	adc	r13, rdx
    1338:      	adc	r12, 0x0
    133c:      	adc	r8, 0x0
    1340:      	mov	rax, r14
    1343:      	shl	rax, 0x20
    1347:      	mov	rdi, r14
    134a:      	shr	rdi, 0x20
    134e:      	mov	rdx, r14
    1351:      	sub	r14, rax
    1354:      	sbb	rdx, rdi
    1357:      	add	rsi, rax
    135a:      	adc	r15, rdi
    135d:      	adc	r13, r14
    1360:      	adc	r12, rdx
    1363:      	adc	r8, 0x0
    1367:      	mov	r10, rsi
    136a:      	mov	r9, r15
    136d:      	mov	rcx, r13
    1370:      	mov	rdx, r12
    1373:      	mov	eax, 0xffffffff
    1378:      	movabs	rdi, -0xffffffff
    1382:      	sub	r10, -0x1
    1386:      	sbb	r9, rax
    1389:      	sbb	rcx, 0x0
    138d:      	sbb	rdx, rdi
    1390:      	sbb	r8, 0x0
    1394:      	cmovae	rsi, r10
    1398:      	cmovae	r15, r9
    139c:      	cmovae	r13, rcx
    13a0:      	cmovae	r12, rdx
    13a4:      	mov	qword ptr [rsp - 0x20], r15
    13a9:      	mov	qword ptr [rsp - 0x50], r13
    13ae:      	mov	qword ptr [rsp - 0x68], r12
    13b3:      	mov	qword ptr [rsp + 0xc0], rsi
    13bb:      	mov	rax, qword ptr [rsp - 0x20]
    13c0:      	mov	qword ptr [rsp + 0xc8], rax
    13c8:      	mov	rax, qword ptr [rsp - 0x50]
    13cd:      	mov	qword ptr [rsp + 0xd0], rax
    13d5:      	mov	rax, qword ptr [rsp - 0x68]
    13da:      	mov	qword ptr [rsp + 0xd8], rax
    13e2:      	mov	r9, qword ptr [rsp - 0x28]
    13e7:      	mov	r11, qword ptr [rsp - 0x30]
    13ec:      	mov	rcx, qword ptr [rsp - 0x10]
    13f1:      	mov	rdx, rsi
    13f4:      	lea	r13, [rsp + 0xc0]
    13fc:      	mulx	r8, rdi, r9
    1401:      	mulx	r10, r12, rcx
    1406:      	add	r8, r12
    1409:      	mulx	rbx, r12, r11
    140e:      	adc	r10, r12
    1411:      	mulx	r14, r12, rbp
    1416:      	adc	rbx, r12
    1419:      	adc	r14, 0x0
    141d:      	xor	r15d, r15d
    1420:      	mov	r12, rdi
    1423:      	shl	r12, 0x20
    1427:      	mov	rax, rdi
    142a:      	shr	rax, 0x20
    142e:      	mov	rdx, rdi
    1431:      	sub	rdi, r12
    1434:      	sbb	rdx, rax
    1437:      	add	r8, r12
    143a:      	adc	r10, rax
    143d:      	adc	rbx, rdi
    1440:      	adc	r14, rdx
    1443:      	adc	r15, 0x0
    1447:      	mov	rdx, qword ptr [r13 + 0x8]
    144b:      	xor	edi, edi
    144d:      	mulx	rax, r12, r9
    1452:      	adcx	r8, r12
    1458:      	adox	r10, rax
    145e:      	mulx	rax, r12, rcx
    1463:      	adcx	r10, r12
    1469:      	adox	rbx, rax
    146f:      	mulx	rax, r12, r11
    1474:      	adcx	rbx, r12
    147a:      	adox	r14, rax
    1480:      	mulx	rax, r12, rbp
    1485:      	adcx	r14, r12
    148b:      	adox	r15, rax
    1491:      	adcx	r15, rdi
    1497:      	adox	rdi, rdi
    149d:      	adc	rdi, 0x0
    14a1:      	mov	r12, r8
    14a4:      	shl	r12, 0x20
    14a8:      	mov	rax, r8
    14ab:      	shr	rax, 0x20
    14af:      	mov	rdx, r8
    14b2:      	sub	r8, r12
    14b5:      	sbb	rdx, rax
    14b8:      	add	r10, r12
    14bb:      	adc	rbx, rax
    14be:      	adc	r14, r8
    14c1:      	adc	r15, rdx
    14c4:      	adc	rdi, 0x0
    14c8:      	mov	rdx, qword ptr [r13 + 0x10]
    14cc:      	xor	r8d, r8d
    14cf:      	mulx	rax, r12, r9
    14d4:      	adcx	r10, r12
    14da:      	adox	rbx, rax
    14e0:      	mulx	rax, r12, rcx
    14e5:      	adcx	rbx, r12
    14eb:      	adox	r14, rax
    14f1:      	mulx	rax, r12, r11
    14f6:      	adcx	r14, r12
    14fc:      	adox	r15, rax
    1502:      	mulx	rax, r12, rbp
    1507:      	adcx	r15, r12
    150d:      	adox	rdi, rax
    1513:      	adcx	rdi, r8
    1519:      	adox	r8, r8
    151f:      	adc	r8, 0x0
    1523:      	mov	r12, r10
    1526:      	shl	r12, 0x20
    152a:      	mov	rax, r10
    152d:      	shr	rax, 0x20
    1531:      	mov	rdx, r10
    1534:      	sub	r10, r12
    1537:      	sbb	rdx, rax
    153a:      	add	rbx, r12
    153d:      	adc	r14, rax
    1540:      	adc	r15, r10
    1543:      	adc	rdi, rdx
    1546:      	adc	r8, 0x0
    154a:      	mov	rdx, qword ptr [r13 + 0x18]
    154e:      	xor	r10d, r10d
    1551:      	mulx	rax, r12, r9
    1556:      	adcx	rbx, r12
    155c:      	adox	r14, rax
    1562:      	mulx	rax, r12, rcx
    1567:      	adcx	r14, r12
    156d:      	adox	r15, rax
    1573:      	mulx	rax, r12, r11
    1578:      	adcx	r15, r12
    157e:      	adox	rdi, rax
    1584:      	mulx	rax, r12, rbp
    1589:      	adcx	rdi, r12
    158f:      	adox	r8, rax
    1595:      	adcx	r8, r10
    159b:      	adox	r10, r10
    15a1:      	adc	r10, 0x0
    15a5:      	mov	r12, rbx
    15a8:      	shl	r12, 0x20
    15ac:      	mov	rax, rbx
    15af:      	shr	rax, 0x20
    15b3:      	mov	rdx, rbx
    15b6:      	sub	rbx, r12
    15b9:      	sbb	rdx, rax
    15bc:      	add	r14, r12
    15bf:      	adc	r15, rax
    15c2:      	adc	rdi, rbx
    15c5:      	adc	r8, rdx
    15c8:      	adc	r10, 0x0
    15cc:      	mov	r9, r14
    15cf:      	mov	rcx, r15
    15d2:      	mov	r11, rdi
    15d5:      	mov	rbp, r8
    15d8:      	mov	r12d, 0xffffffff
    15de:      	movabs	rax, -0xffffffff
    15e8:      	sub	r9, -0x1
    15ec:      	sbb	rcx, r12
    15ef:      	sbb	r11, 0x0
    15f3:      	sbb	rbp, rax
    15f6:      	sbb	r10, 0x0
    15fa:      	cmovb	r9, r14
    15fe:      	cmovb	rcx, r15
    1602:      	cmovb	r11, rdi
    1606:      	cmovb	rbp, r8
    160a:      	mov	qword ptr [rsp + 0x20], rbp
    160f:      	mov	qword ptr [rsp + 0x28], r11
    1614:      	mov	qword ptr [rsp - 0x20], r9
    1619:      	mov	qword ptr [rsp + 0xe0], r9
    1621:      	mov	qword ptr [rsp + 0xe8], rcx
    1629:      	mov	qword ptr [rsp + 0xf0], r11
    1631:      	mov	qword ptr [rsp + 0xf8], rbp
    1639:      	mov	rdx, rsi
    163c:      	mov	r12, qword ptr [rsp - 0x70]
    1641:      	mov	r13, qword ptr [rsp - 0x58]
    1646:      	mov	r9, qword ptr [rsp - 0x80]
    164b:      	mov	r11, qword ptr [rsp - 0x78]
    1650:      	lea	rbp, [rsp + 0xc0]
    1658:      	mulx	rsi, rax, r11
    165d:      	mulx	rdi, r14, r12
    1662:      	add	rsi, r14
    1665:      	mulx	r8, r14, r13
    166a:      	adc	rdi, r14
    166d:      	mulx	r10, r14, r9
    1672:      	adc	r8, r14
    1675:      	adc	r10, 0x0
    1679:      	xor	ebx, ebx
    167b:      	mov	r14, rax
    167e:      	shl	r14, 0x20
    1682:      	mov	r15, rax
    1685:      	shr	r15, 0x20
    1689:      	mov	rdx, rax
    168c:      	sub	rax, r14
    168f:      	sbb	rdx, r15
    1692:      	add	rsi, r14
    1695:      	adc	rdi, r15
    1698:      	adc	r8, rax
    169b:      	adc	r10, rdx
    169e:      	adc	rbx, 0x0
    16a2:      	mov	rdx, qword ptr [rbp + 0x8]
    16a6:      	xor	eax, eax
    16a8:      	mulx	r15, r14, r11
    16ad:      	adcx	rsi, r14
    16b3:      	adox	rdi, r15
    16b9:      	mulx	r15, r14, r12
    16be:      	adcx	rdi, r14
    16c4:      	adox	r8, r15
    16ca:      	mulx	r15, r14, r13
    16cf:      	adcx	r8, r14
    16d5:      	adox	r10, r15
    16db:      	mulx	r15, r14, r9
    16e0:      	adcx	r10, r14
    16e6:      	adox	rbx, r15
    16ec:      	adcx	rbx, rax
    16f2:      	adox	rax, rax
    16f8:      	adc	rax, 0x0
    16fc:      	mov	r14, rsi
    16ff:      	shl	r14, 0x20
    1703:      	mov	r15, rsi
    1706:      	shr	r15, 0x20
    170a:      	mov	rdx, rsi
    170d:      	sub	rsi, r14
    1710:      	sbb	rdx, r15
    1713:      	add	rdi, r14
    1716:      	adc	r8, r15
    1719:      	adc	r10, rsi
    171c:      	adc	rbx, rdx
    171f:      	adc	rax, 0x0
    1723:      	mov	rdx, qword ptr [rbp + 0x10]
    1727:      	xor	esi, esi
    1729:      	mulx	r15, r14, r11
    172e:      	adcx	rdi, r14
    1734:      	adox	r8, r15
    173a:      	mulx	r15, r14, r12
    173f:      	adcx	r8, r14
    1745:      	adox	r10, r15
    174b:      	mulx	r15, r14, r13
    1750:      	adcx	r10, r14
    1756:      	adox	rbx, r15
    175c:      	mulx	r15, r14, r9
    1761:      	adcx	rbx, r14
    1767:      	adox	rax, r15
    176d:      	adcx	rax, rsi
    1773:      	adox	rsi, rsi
    1779:      	adc	rsi, 0x0
    177d:      	mov	r14, rdi
    1780:      	shl	r14, 0x20
    1784:      	mov	r15, rdi
    1787:      	shr	r15, 0x20
    178b:      	mov	rdx, rdi
    178e:      	sub	rdi, r14
    1791:      	sbb	rdx, r15
    1794:      	add	r8, r14
    1797:      	adc	r10, r15
    179a:      	adc	rbx, rdi
    179d:      	adc	rax, rdx
    17a0:      	adc	rsi, 0x0
    17a4:      	mov	rdx, qword ptr [rbp + 0x18]
    17a8:      	xor	edi, edi
    17aa:      	mulx	r15, r14, r11
    17af:      	adcx	r8, r14
    17b5:      	adox	r10, r15
    17bb:      	mulx	r15, r14, r12
    17c0:      	adcx	r10, r14
    17c6:      	adox	rbx, r15
    17cc:      	mulx	r15, r14, r13
    17d1:      	adcx	rbx, r14
    17d7:      	adox	rax, r15
    17dd:      	mulx	r15, r14, r9
    17e2:      	adcx	rax, r14
    17e8:      	adox	rsi, r15
    17ee:      	adcx	rsi, rdi
    17f4:      	adox	rdi, rdi
    17fa:      	adc	rdi, 0x0
    17fe:      	mov	r14, r8
    1801:      	shl	r14, 0x20
    1805:      	mov	r15, r8
    1808:      	shr	r15, 0x20
    180c:      	mov	rdx, r8
    180f:      	sub	r8, r14
    1812:      	sbb	rdx, r15
    1815:      	add	r10, r14
    1818:      	adc	rbx, r15
    181b:      	adc	rax, r8
    181e:      	adc	rsi, rdx
    1821:      	adc	rdi, 0x0
    1825:      	mov	r11, r10
    1828:      	mov	r12, rbx
    182b:      	mov	r13, rax
    182e:      	mov	r9, rsi
    1831:      	mov	r14d, 0xffffffff
    1837:      	movabs	r15, -0xffffffff
    1841:      	sub	r11, -0x1
    1845:      	sbb	r12, r14
    1848:      	sbb	r13, 0x0
    184c:      	sbb	r9, r15
    184f:      	sbb	rdi, 0x0
    1853:      	cmovb	r11, r10
    1857:      	cmovb	r12, rbx
    185b:      	cmovb	r13, rax
    185f:      	cmovb	r9, rsi
    1863:      	mov	qword ptr [rsp - 0x78], r11
    1868:      	mov	qword ptr [rsp - 0x80], r9
    186d:      	mov	qword ptr [rsp - 0x58], r13
    1872:      	mov	qword ptr [rsp - 0x70], r12
    1877:      	mov	rax, qword ptr [rsp - 0x38]
    187c:      	mov	rdi, qword ptr [rsp - 0x40]
    1881:      	mov	r8, qword ptr [rsp - 0x60]
    1886:      	mov	r10, qword ptr [rsp - 0x48]
    188b:      	mov	rdx, r10
    188e:      	mulx	rbx, r14, rdi
    1893:      	mulx	rsi, r12, rax
    1898:      	add	rbx, r12
    189b:      	mulx	r11, r12, r8
    18a0:      	adc	rsi, r12
    18a3:      	adc	r11, 0x0
    18a7:      	mov	rdx, rdi
    18aa:      	mulx	r15, r12, rax
    18af:      	add	rsi, r12
    18b2:      	adc	r11, r15
    18b5:      	mulx	rbp, r12, r8
    18ba:      	adc	rbp, 0x0
    18be:      	add	r11, r12
    18c1:      	adc	rbp, 0x0
    18c5:      	mov	rdx, rax
    18c8:      	mulx	r9, r12, r8
    18cd:      	add	rbp, r12
    18d0:      	adc	r9, 0x0
    18d4:      	xor	r13d, r13d
    18d7:      	add	r14, r14
    18da:      	adc	rbx, rbx
    18dd:      	adc	rsi, rsi
    18e0:      	adc	r11, r11
    18e3:      	adc	rbp, rbp
    18e6:      	adc	r9, r9
    18e9:      	adc	r13, 0x0
    18ed:      	mov	rdx, r10
    18f0:      	mulx	r15, r10, rdx
    18f5:      	add	r14, r15
    18f8:      	mov	rdx, rdi
    18fb:      	mulx	r15, r12, rdx
    1900:      	adc	rbx, r12
    1903:      	adc	rsi, r15
    1906:      	mov	rdx, rax
    1909:      	mulx	r15, r12, rdx
    190e:      	adc	r11, r12
    1911:      	adc	rbp, r15
    1914:      	mov	rdx, r8
    1917:      	mulx	r15, r12, rdx
    191c:      	adc	r9, r12
    191f:      	adc	r13, r15
    1922:      	mov	r12, r10
    1925:      	shl	r12, 0x20
    1929:      	mov	r15, r10
    192c:      	shr	r15, 0x20
    1930:      	mov	rdx, r10
    1933:      	sub	r10, r12
    1936:      	sbb	rdx, r15
    1939:      	add	r14, r12
    193c:      	adc	rbx, r15
    193f:      	adc	rsi, r10
    1942:      	adc	r11, rdx
    1945:      	adc	rbp, 0x0
    1949:      	adc	r9, 0x0
    194d:      	adc	r13, 0x0
    1951:      	mov	r10d, 0x0
    1957:      	adc	r10, 0x0
    195b:      	mov	r12, r14
    195e:      	shl	r12, 0x20
    1962:      	mov	r15, r14
    1965:      	shr	r15, 0x20
    1969:      	mov	rdx, r14
    196c:      	sub	r14, r12
    196f:      	sbb	rdx, r15
    1972:      	add	rbx, r12
    1975:      	adc	rsi, r15
    1978:      	adc	r11, r14
    197b:      	adc	rbp, rdx
    197e:      	adc	r9, 0x0
    1982:      	adc	r13, 0x0
    1986:      	adc	r10, 0x0
    198a:      	mov	r12, rbx
    198d:      	shl	r12, 0x20
    1991:      	mov	r15, rbx
    1994:      	shr	r15, 0x20
    1998:      	mov	rdx, rbx
    199b:      	sub	rbx, r12
    199e:      	sbb	rdx, r15
    19a1:      	add	rsi, r12
    19a4:      	adc	r11, r15
    19a7:      	adc	rbp, rbx
    19aa:      	adc	r9, rdx
    19ad:      	adc	r13, 0x0
    19b1:      	adc	r10, 0x0
    19b5:      	mov	r12, rsi
    19b8:      	shl	r12, 0x20
    19bc:      	mov	r15, rsi
    19bf:      	shr	r15, 0x20
    19c3:      	mov	rdx, rsi
    19c6:      	sub	rsi, r12
    19c9:      	sbb	rdx, r15
    19cc:      	add	r11, r12
    19cf:      	adc	rbp, r15
    19d2:      	adc	r9, rsi
    19d5:      	adc	r13, rdx
    19d8:      	adc	r10, 0x0
    19dc:      	mov	rdi, r11
    19df:      	mov	rax, rbp
    19e2:      	mov	r8, r9
    19e5:      	mov	rdx, r13
    19e8:      	mov	r12d, 0xffffffff
    19ee:      	movabs	r15, -0xffffffff
    19f8:      	sub	rdi, -0x1
    19fc:      	sbb	rax, r12
    19ff:      	sbb	r8, 0x0
    1a03:      	sbb	rdx, r15
    1a06:      	sbb	r10, 0x0
    1a0a:      	cmovae	r11, rdi
    1a0e:      	cmovae	rbp, rax
    1a12:      	cmovae	r9, r8
    1a16:      	cmovae	r13, rdx
    1a1a:      	mov	rax, qword ptr [rsp - 0x20]
    1a1f:      	mov	rdx, qword ptr [rsp + 0x28]
    1a24:      	mov	rsi, qword ptr [rsp + 0x20]
    1a29:      	sub	r11, rax
    1a2c:      	sbb	rbp, rcx
    1a2f:      	sbb	r9, rdx
    1a32:      	sbb	r13, rsi
    1a35:      	sbb	rax, rax
    1a38:      	mov	rcx, rax
    1a3b:      	shr	rcx, 0x20
    1a3f:      	mov	rsi, rax
    1a42:      	shl	rsi, 0x20
    1a46:      	sub	rsi, rax
    1a49:      	add	r11, rax
    1a4c:      	adc	rbp, rcx
    1a4f:      	adc	r9, 0x0
    1a53:      	adc	r13, rsi
    1a56:      	mov	qword ptr [rsp - 0x50], r9
    1a5b:      	mov	qword ptr [rsp - 0x68], r11
    1a60:      	mov	rax, qword ptr [rsp - 0x78]
    1a65:      	mov	r12, qword ptr [rsp - 0x58]
    1a6a:      	mov	rcx, r12
    1a6d:      	mov	r9, qword ptr [rsp - 0x70]
    1a72:      	mov	rdx, r9
    1a75:      	mov	rsi, qword ptr [rsp - 0x80]
    1a7a:      	xor	ebx, ebx
    1a7c:      	add	rax, rax
    1a7f:      	adc	rdx, rdx
    1a82:      	adc	rcx, rcx
    1a85:      	adc	rsi, rsi
    1a88:      	adc	rbx, 0x0
    1a8c:      	mov	rdi, rax
    1a8f:      	mov	r8, rdx
    1a92:      	mov	r10, rcx
    1a95:      	mov	r11, rsi
    1a98:      	mov	r14d, 0xffffffff
    1a9e:      	movabs	r15, -0xffffffff
    1aa8:      	sub	rdi, -0x1
    1aac:      	sbb	r8, r14
    1aaf:      	sbb	r10, 0x0
    1ab3:      	sbb	r11, r15
    1ab6:      	sbb	rbx, 0x0
    1aba:      	cmovae	rax, rdi
    1abe:      	cmovae	rdx, r8
    1ac2:      	cmovae	rcx, r10
    1ac6:      	cmovae	rsi, r11
    1aca:      	mov	r11, qword ptr [rsp - 0x50]
    1acf:      	mov	r8, qword ptr [rsp - 0x68]
    1ad4:      	sub	r8, rax
    1ad7:      	sbb	rbp, rdx
    1ada:      	sbb	r11, rcx
    1add:      	sbb	r13, rsi
    1ae0:      	sbb	rax, rax
    1ae3:      	mov	rdx, rax
    1ae6:      	shr	rdx, 0x20
    1aea:      	mov	rsi, rax
    1aed:      	shl	rsi, 0x20
    1af1:      	sub	rsi, rax
    1af4:      	add	r8, rax
    1af7:      	adc	rbp, rdx
    1afa:      	adc	r11, 0x0
    1afe:      	adc	r13, rsi
    1b01:      	mov	qword ptr [rsp - 0x50], r11
    1b06:      	mov	qword ptr [rsp - 0x68], r8
    1b0b:      	mov	qword ptr [rsp + 0x20], rbp
    1b10:      	mov	qword ptr [rsp + 0x28], r13
    1b15:      	mov	rdx, r8
    1b18:      	mov	rsi, qword ptr [rsp - 0x78]
    1b1d:      	mov	rdi, r9
    1b20:      	mov	r8, r12
    1b23:      	mov	r10, qword ptr [rsp - 0x80]
    1b28:      	sub	rsi, rdx
    1b2b:      	sbb	rdi, rbp
    1b2e:      	sbb	r8, r11
    1b31:      	sbb	r10, r13
    1b34:      	sbb	rdx, rdx
    1b37:      	mov	rbp, rdx
    1b3a:      	shr	rbp, 0x20
    1b3e:      	mov	r13, rdx
    1b41:      	shl	r13, 0x20
    1b45:      	sub	r13, rdx
    1b48:      	add	rsi, rdx
    1b4b:      	adc	rdi, rbp
    1b4e:      	adc	r8, 0x0
    1b52:      	adc	r10, r13
    1b55:      	mov	qword ptr [rsp], rsi
    1b59:      	mov	rdx, rsi
    1b5c:      	mov	qword ptr [rsp + 0x8], rdi
    1b61:      	mov	qword ptr [rsp + 0x10], r8
    1b66:      	mov	qword ptr [rsp + 0x18], r10
    1b6b:      	mov	rcx, qword ptr [rsp - 0x38]
    1b70:      	mov	r9, qword ptr [rsp - 0x48]
    1b75:      	mov	r14, rsp
    1b78:      	mov	r11, qword ptr [rsp - 0x40]
    1b7d:      	mov	r10, qword ptr [rsp - 0x60]
    1b82:      	mulx	rdi, rsi, r9
    1b87:      	mulx	r8, r13, r11
    1b8c:      	add	rdi, r13
    1b8f:      	mulx	rbx, r13, rcx
    1b94:      	adc	r8, r13
    1b97:      	mulx	r15, r13, r10
    1b9c:      	adc	rbx, r13
    1b9f:      	adc	r15, 0x0
    1ba3:      	xor	r12d, r12d
    1ba6:      	mov	r13, rsi
    1ba9:      	shl	r13, 0x20
    1bad:      	mov	rax, rsi
    1bb0:      	shr	rax, 0x20
    1bb4:      	mov	rdx, rsi
    1bb7:      	sub	rsi, r13
    1bba:      	sbb	rdx, rax
    1bbd:      	add	rdi, r13
    1bc0:      	adc	r8, rax
    1bc3:      	adc	rbx, rsi
    1bc6:      	adc	r15, rdx
    1bc9:      	adc	r12, 0x0
    1bcd:      	mov	rdx, qword ptr [r14 + 0x8]
    1bd1:      	xor	esi, esi
    1bd3:      	mulx	rax, r13, r9
    1bd8:      	adcx	rdi, r13
    1bde:      	adox	r8, rax
    1be4:      	mulx	rax, r13, r11
    1be9:      	adcx	r8, r13
    1bef:      	adox	rbx, rax
    1bf5:      	mulx	rax, r13, rcx
    1bfa:      	adcx	rbx, r13
    1c00:      	adox	r15, rax
    1c06:      	mulx	rax, r13, r10
    1c0b:      	adcx	r15, r13
    1c11:      	adox	r12, rax
    1c17:      	adcx	r12, rsi
    1c1d:      	adox	rsi, rsi
    1c23:      	adc	rsi, 0x0
    1c27:      	mov	r13, rdi
    1c2a:      	shl	r13, 0x20
    1c2e:      	mov	rax, rdi
    1c31:      	shr	rax, 0x20
    1c35:      	mov	rdx, rdi
    1c38:      	sub	rdi, r13
    1c3b:      	sbb	rdx, rax
    1c3e:      	add	r8, r13
    1c41:      	adc	rbx, rax
    1c44:      	adc	r15, rdi
    1c47:      	adc	r12, rdx
    1c4a:      	adc	rsi, 0x0
    1c4e:      	mov	rdx, qword ptr [r14 + 0x10]
    1c52:      	xor	edi, edi
    1c54:      	mulx	rax, r13, r9
    1c59:      	adcx	r8, r13
    1c5f:      	adox	rbx, rax
    1c65:      	mulx	rax, r13, r11
    1c6a:      	adcx	rbx, r13
    1c70:      	adox	r15, rax
    1c76:      	mulx	rax, r13, rcx
    1c7b:      	adcx	r15, r13
    1c81:      	adox	r12, rax
    1c87:      	mulx	rax, r13, r10
    1c8c:      	adcx	r12, r13
    1c92:      	adox	rsi, rax
    1c98:      	adcx	rsi, rdi
    1c9e:      	adox	rdi, rdi
    1ca4:      	adc	rdi, 0x0
    1ca8:      	mov	r13, r8
    1cab:      	shl	r13, 0x20
    1caf:      	mov	rax, r8
    1cb2:      	shr	rax, 0x20
    1cb6:      	mov	rdx, r8
    1cb9:      	sub	r8, r13
    1cbc:      	sbb	rdx, rax
    1cbf:      	add	rbx, r13
    1cc2:      	adc	r15, rax
    1cc5:      	adc	r12, r8
    1cc8:      	adc	rsi, rdx
    1ccb:      	adc	rdi, 0x0
    1ccf:      	mov	rdx, qword ptr [r14 + 0x18]
    1cd3:      	xor	r8d, r8d
    1cd6:      	mulx	rax, r13, r9
    1cdb:      	adcx	rbx, r13
    1ce1:      	adox	r15, rax
    1ce7:      	mulx	rax, r13, r11
    1cec:      	adcx	r15, r13
    1cf2:      	adox	r12, rax
    1cf8:      	mulx	rax, r13, rcx
    1cfd:      	adcx	r12, r13
    1d03:      	adox	rsi, rax
    1d09:      	mulx	rax, r13, r10
    1d0e:      	adcx	rsi, r13
    1d14:      	adox	rdi, rax
    1d1a:      	adcx	rdi, r8
    1d20:      	adox	r8, r8
    1d26:      	adc	r8, 0x0
    1d2a:      	mov	r13, rbx
    1d2d:      	shl	r13, 0x20
    1d31:      	mov	rax, rbx
    1d34:      	shr	rax, 0x20
    1d38:      	mov	rdx, rbx
    1d3b:      	sub	rbx, r13
    1d3e:      	sbb	rdx, rax
    1d41:      	add	r15, r13
    1d44:      	adc	r12, rax
    1d47:      	adc	rsi, rbx
    1d4a:      	adc	rdi, rdx
    1d4d:      	adc	r8, 0x0
    1d51:      	mov	r9, r15
    1d54:      	mov	r11, r12
    1d57:      	mov	rcx, rsi
    1d5a:      	mov	r10, rdi
    1d5d:      	mov	r13d, 0xffffffff
    1d63:      	movabs	rax, -0xffffffff
    1d6d:      	sub	r9, -0x1
    1d71:      	sbb	r11, r13
    1d74:      	sbb	rcx, 0x0
    1d78:      	sbb	r10, rax
    1d7b:      	sbb	r8, 0x0
    1d7f:      	cmovb	r9, r15
    1d83:      	cmovb	r11, r12
    1d87:      	cmovb	rcx, rsi
    1d8b:      	cmovb	r10, rdi
    1d8f:      	mov	qword ptr [rsp - 0x70], r10
    1d94:      	mov	qword ptr [rsp - 0x78], r9
    1d99:      	mov	qword ptr [rsp - 0x80], r11
    1d9e:      	mov	rax, rcx
    1da1:      	mov	rdx, qword ptr [rsp - 0x20]
    1da6:      	mov	rcx, qword ptr [rsp + 0x40]
    1dab:      	mov	r10, qword ptr [rsp + 0x38]
    1db0:      	mov	r14, qword ptr [rsp + 0x30]
    1db5:      	mov	rbp, qword ptr [rsp + 0x48]
    1dba:      	lea	r11, [rsp + 0xe0]
    1dc2:      	mulx	rdi, rsi, rcx
    1dc7:      	mulx	r8, r12, r14
    1dcc:      	add	rdi, r12
    1dcf:      	mulx	r9, r12, r10
    1dd4:      	adc	r8, r12
    1dd7:      	mulx	rbx, r12, rbp
    1ddc:      	adc	r9, r12
    1ddf:      	adc	rbx, 0x0
    1de3:      	xor	r15d, r15d
    1de6:      	mov	r12, rsi
    1de9:      	shl	r12, 0x20
    1ded:      	mov	r13, rsi
    1df0:      	shr	r13, 0x20
    1df4:      	mov	rdx, rsi
    1df7:      	sub	rsi, r12
    1dfa:      	sbb	rdx, r13
    1dfd:      	add	rdi, r12
    1e00:      	adc	r8, r13
    1e03:      	adc	r9, rsi
    1e06:      	adc	rbx, rdx
    1e09:      	adc	r15, 0x0
    1e0d:      	mov	rdx, qword ptr [r11 + 0x8]
    1e11:      	xor	esi, esi
    1e13:      	mulx	r13, r12, rcx
    1e18:      	adcx	rdi, r12
    1e1e:      	adox	r8, r13
    1e24:      	mulx	r13, r12, r14
    1e29:      	adcx	r8, r12
    1e2f:      	adox	r9, r13
    1e35:      	mulx	r13, r12, r10
    1e3a:      	adcx	r9, r12
    1e40:      	adox	rbx, r13
    1e46:      	mulx	r13, r12, rbp
    1e4b:      	adcx	rbx, r12
    1e51:      	adox	r15, r13
    1e57:      	adcx	r15, rsi
    1e5d:      	adox	rsi, rsi
    1e63:      	adc	rsi, 0x0
    1e67:      	mov	r12, rdi
    1e6a:      	shl	r12, 0x20
    1e6e:      	mov	r13, rdi
    1e71:      	shr	r13, 0x20
    1e75:      	mov	rdx, rdi
    1e78:      	sub	rdi, r12
    1e7b:      	sbb	rdx, r13
    1e7e:      	add	r8, r12
    1e81:      	adc	r9, r13
    1e84:      	adc	rbx, rdi
    1e87:      	adc	r15, rdx
    1e8a:      	adc	rsi, 0x0
    1e8e:      	mov	rdx, qword ptr [r11 + 0x10]
    1e92:      	xor	edi, edi
    1e94:      	mulx	r13, r12, rcx
    1e99:      	adcx	r8, r12
    1e9f:      	adox	r9, r13
    1ea5:      	mulx	r13, r12, r14
    1eaa:      	adcx	r9, r12
    1eb0:      	adox	rbx, r13
    1eb6:      	mulx	r13, r12, r10
    1ebb:      	adcx	rbx, r12
    1ec1:      	adox	r15, r13
    1ec7:      	mulx	r13, r12, rbp
    1ecc:      	adcx	r15, r12
    1ed2:      	adox	rsi, r13
    1ed8:      	adcx	rsi, rdi
    1ede:      	adox	rdi, rdi
    1ee4:      	adc	rdi, 0x0
    1ee8:      	mov	r12, r8
    1eeb:      	shl	r12, 0x20
    1eef:      	mov	r13, r8
    1ef2:      	shr	r13, 0x20
    1ef6:      	mov	rdx, r8
    1ef9:      	sub	r8, r12
    1efc:      	sbb	rdx, r13
    1eff:      	add	r9, r12
    1f02:      	adc	rbx, r13
    1f05:      	adc	r15, r8
    1f08:      	adc	rsi, rdx
    1f0b:      	adc	rdi, 0x0
    1f0f:      	mov	rdx, qword ptr [r11 + 0x18]
    1f13:      	xor	r8d, r8d
    1f16:      	mulx	r13, r12, rcx
    1f1b:      	adcx	r9, r12
    1f21:      	adox	rbx, r13
    1f27:      	mulx	r13, r12, r14
    1f2c:      	adcx	rbx, r12
    1f32:      	adox	r15, r13
    1f38:      	mulx	r13, r12, r10
    1f3d:      	adcx	r15, r12
    1f43:      	adox	rsi, r13
    1f49:      	mulx	r13, r12, rbp
    1f4e:      	adcx	rsi, r12
    1f54:      	adox	rdi, r13
    1f5a:      	adcx	rdi, r8
    1f60:      	adox	r8, r8
    1f66:      	adc	r8, 0x0
    1f6a:      	mov	r12, r9
    1f6d:      	shl	r12, 0x20
    1f71:      	mov	r13, r9
    1f74:      	shr	r13, 0x20
    1f78:      	mov	rdx, r9
    1f7b:      	sub	r9, r12
    1f7e:      	sbb	rdx, r13
    1f81:      	add	rbx, r12
    1f84:      	adc	r15, r13
    1f87:      	adc	rsi, r9
    1f8a:      	adc	rdi, rdx
    1f8d:      	adc	r8, 0x0
    1f91:      	mov	rcx, rbx
    1f94:      	mov	r14, r15
    1f97:      	mov	r10, rsi
    1f9a:      	mov	rbp, rdi
    1f9d:      	mov	r12d, 0xffffffff
    1fa3:      	movabs	r13, -0xffffffff
    1fad:      	sub	rcx, -0x1
    1fb1:      	sbb	r14, r12
    1fb4:      	sbb	r10, 0x0
    1fb8:      	sbb	rbp, r13
    1fbb:      	sbb	r8, 0x0
    1fbf:      	cmovb	rcx, rbx
    1fc3:      	cmovb	r14, r15
    1fc7:      	cmovb	r10, rsi
    1fcb:      	cmovb	rbp, rdi
    1fcf:      	mov	rdx, qword ptr [rsp - 0x80]
    1fd4:      	mov	rsi, qword ptr [rsp - 0x78]
    1fd9:      	mov	rdi, qword ptr [rsp - 0x70]
    1fde:      	sub	rsi, rcx
    1fe1:      	sbb	rdx, r14
    1fe4:      	sbb	rax, r10
    1fe7:      	sbb	rdi, rbp
    1fea:      	sbb	rcx, rcx
    1fed:      	mov	r14, rcx
    1ff0:      	shr	r14, 0x20
    1ff4:      	mov	rbp, rcx
    1ff7:      	shl	rbp, 0x20
    1ffb:      	sub	rbp, rcx
    1ffe:      	add	rsi, rcx
    2001:      	adc	rdx, r14
    2004:      	adc	rax, 0x0
    2008:      	adc	rdi, rbp
    200b:      	mov	qword ptr [rsp - 0x70], rdi
    2010:      	mov	qword ptr [rsp - 0x58], rax
    2015:      	mov	qword ptr [rsp - 0x78], rsi
    201a:      	mov	qword ptr [rsp - 0x80], rdx
    201f:      	mov	rax, qword ptr [rsp - 0x8]
    2024:      	add	rax, 0x40
    2028:      	mov	rdx, qword ptr [rsp + 0x50]
    202d:      	mov	rcx, qword ptr [rsp + 0x60]
    2032:      	mov	r10, qword ptr [rsp + 0x70]
    2037:      	mov	r14, qword ptr [rsp + 0x58]
    203c:      	mov	rbp, qword ptr [rsp + 0x68]
    2041:      	mulx	rdi, rsi, rcx
    2046:      	mulx	r8, r12, r10
    204b:      	add	rdi, r12
    204e:      	mulx	r9, r12, r14
    2053:      	adc	r8, r12
    2056:      	mulx	rbx, r12, rbp
    205b:      	adc	r9, r12
    205e:      	adc	rbx, 0x0
    2062:      	xor	r15d, r15d
    2065:      	mov	r12, rsi
    2068:      	shl	r12, 0x20
    206c:      	mov	r13, rsi
    206f:      	shr	r13, 0x20
    2073:      	mov	rdx, rsi
    2076:      	sub	rsi, r12
    2079:      	sbb	rdx, r13
    207c:      	add	rdi, r12
    207f:      	adc	r8, r13
    2082:      	adc	r9, rsi
    2085:      	adc	rbx, rdx
    2088:      	adc	r15, 0x0
    208c:      	mov	rdx, qword ptr [rax + 0x8]
    2090:      	xor	esi, esi
    2092:      	mulx	r13, r12, rcx
    2097:      	adcx	rdi, r12
    209d:      	adox	r8, r13
    20a3:      	mulx	r13, r12, r10
    20a8:      	adcx	r8, r12
    20ae:      	adox	r9, r13
    20b4:      	mulx	r13, r12, r14
    20b9:      	adcx	r9, r12
    20bf:      	adox	rbx, r13
    20c5:      	mulx	r13, r12, rbp
    20ca:      	adcx	rbx, r12
    20d0:      	adox	r15, r13
    20d6:      	adcx	r15, rsi
    20dc:      	adox	rsi, rsi
    20e2:      	adc	rsi, 0x0
    20e6:      	mov	r12, rdi
    20e9:      	shl	r12, 0x20
    20ed:      	mov	r13, rdi
    20f0:      	shr	r13, 0x20
    20f4:      	mov	rdx, rdi
    20f7:      	sub	rdi, r12
    20fa:      	sbb	rdx, r13
    20fd:      	add	r8, r12
    2100:      	adc	r9, r13
    2103:      	adc	rbx, rdi
    2106:      	adc	r15, rdx
    2109:      	adc	rsi, 0x0
    210d:      	mov	rdx, qword ptr [rax + 0x10]
    2111:      	xor	edi, edi
    2113:      	mulx	r13, r12, rcx
    2118:      	adcx	r8, r12
    211e:      	adox	r9, r13
    2124:      	mulx	r13, r12, r10
    2129:      	adcx	r9, r12
    212f:      	adox	rbx, r13
    2135:      	mulx	r13, r12, r14
    213a:      	adcx	rbx, r12
    2140:      	adox	r15, r13
    2146:      	mulx	r13, r12, rbp
    214b:      	adcx	r15, r12
    2151:      	adox	rsi, r13
    2157:      	adcx	rsi, rdi
    215d:      	adox	rdi, rdi
    2163:      	adc	rdi, 0x0
    2167:      	mov	r12, r8
    216a:      	shl	r12, 0x20
    216e:      	mov	r13, r8
    2171:      	shr	r13, 0x20
    2175:      	mov	rdx, r8
    2178:      	sub	r8, r12
    217b:      	sbb	rdx, r13
    217e:      	add	r9, r12
    2181:      	adc	rbx, r13
    2184:      	adc	r15, r8
    2187:      	adc	rsi, rdx
    218a:      	adc	rdi, 0x0
    218e:      	mov	rdx, qword ptr [rax + 0x18]
    2192:      	xor	r8d, r8d
    2195:      	mulx	r13, r12, rcx
    219a:      	adcx	r9, r12
    21a0:      	adox	rbx, r13
    21a6:      	mulx	r13, r12, r10
    21ab:      	adcx	rbx, r12
    21b1:      	adox	r15, r13
    21b7:      	mulx	r13, r12, r14
    21bc:      	adcx	r15, r12
    21c2:      	adox	rsi, r13
    21c8:      	mulx	r13, r12, rbp
    21cd:      	adcx	rsi, r12
    21d3:      	adox	rdi, r13
    21d9:      	adcx	rdi, r8
    21df:      	adox	r8, r8
    21e5:      	adc	r8, 0x0
    21e9:      	mov	r12, r9
    21ec:      	shl	r12, 0x20
    21f0:      	mov	r13, r9
    21f3:      	shr	r13, 0x20
    21f7:      	mov	rdx, r9
    21fa:      	sub	r9, r12
    21fd:      	sbb	rdx, r13
    2200:      	add	rbx, r12
    2203:      	adc	r15, r13
    2206:      	adc	rsi, r9
    2209:      	adc	rdi, rdx
    220c:      	adc	r8, 0x0
    2210:      	mov	rcx, rbx
    2213:      	mov	r10, r15
    2216:      	mov	r14, rsi
    2219:      	mov	rbp, rdi
    221c:      	mov	r12d, 0xffffffff
    2222:      	movabs	r13, -0xffffffff
    222c:      	sub	rcx, -0x1
    2230:      	sbb	r10, r12
    2233:      	sbb	r14, 0x0
    2237:      	sbb	rbp, r13
    223a:      	sbb	r8, 0x0
    223e:      	cmovb	rcx, rbx
    2242:      	cmovb	r10, r15
    2246:      	cmovb	r14, rsi
    224a:      	cmovb	rbp, rdi
    224e:      	mov	qword ptr [rsp], rcx
    2252:      	mov	rdx, rcx
    2255:      	mov	qword ptr [rsp + 0x8], r10
    225a:      	mov	qword ptr [rsp + 0x10], r14
    225f:      	mov	qword ptr [rsp + 0x18], rbp
    2264:      	mov	r11, qword ptr [rsp - 0x18]
    2269:      	mov	r13, qword ptr [rsp - 0x28]
    226e:      	mov	r9, qword ptr [rsp - 0x30]
    2273:      	mov	rax, qword ptr [rsp - 0x10]
    2278:      	mov	r8, rax
    227b:      	mov	r14, rsp
    227e:      	mulx	rbx, rdi, r13
    2283:      	mulx	r15, rcx, r8
    2288:      	add	rbx, rcx
    228b:      	mulx	r12, rcx, r9
    2290:      	adc	r15, rcx
    2293:      	mulx	rsi, rcx, r11
    2298:      	adc	r12, rcx
    229b:      	adc	rsi, 0x0
    229f:      	xor	ebp, ebp
    22a1:      	mov	rcx, rdi
    22a4:      	shl	rcx, 0x20
    22a8:      	mov	r10, rdi
    22ab:      	shr	r10, 0x20
    22af:      	mov	rdx, rdi
    22b2:      	sub	rdi, rcx
    22b5:      	sbb	rdx, r10
    22b8:      	add	rbx, rcx
    22bb:      	adc	r15, r10
    22be:      	adc	r12, rdi
    22c1:      	adc	rsi, rdx
    22c4:      	adc	rbp, 0x0
    22c8:      	mov	rdx, qword ptr [r14 + 0x8]
    22cc:      	xor	edi, edi
    22ce:      	mulx	r10, rcx, r13
    22d3:      	adcx	rbx, rcx
    22d9:      	adox	r15, r10
    22df:      	mulx	r10, rcx, r8
    22e4:      	adcx	r15, rcx
    22ea:      	adox	r12, r10
    22f0:      	mulx	r10, rcx, r9
    22f5:      	adcx	r12, rcx
    22fb:      	adox	rsi, r10
    2301:      	mulx	r10, rcx, r11
    2306:      	adcx	rsi, rcx
    230c:      	adox	rbp, r10
    2312:      	adcx	rbp, rdi
    2318:      	adox	rdi, rdi
    231e:      	adc	rdi, 0x0
    2322:      	mov	rcx, rbx
    2325:      	shl	rcx, 0x20
    2329:      	mov	r10, rbx
    232c:      	shr	r10, 0x20
    2330:      	mov	rdx, rbx
    2333:      	sub	rbx, rcx
    2336:      	sbb	rdx, r10
    2339:      	add	r15, rcx
    233c:      	adc	r12, r10
    233f:      	adc	rsi, rbx
    2342:      	adc	rbp, rdx
    2345:      	adc	rdi, 0x0
    2349:      	mov	rdx, qword ptr [r14 + 0x10]
    234d:      	xor	ebx, ebx
    234f:      	mulx	r10, rcx, r13
    2354:      	adcx	r15, rcx
    235a:      	adox	r12, r10
    2360:      	mulx	r10, rcx, r8
    2365:      	adcx	r12, rcx
    236b:      	adox	rsi, r10
    2371:      	mulx	r10, rcx, r9
    2376:      	adcx	rsi, rcx
    237c:      	adox	rbp, r10
    2382:      	mulx	r10, rcx, r11
    2387:      	adcx	rbp, rcx
    238d:      	adox	rdi, r10
    2393:      	adcx	rdi, rbx
    2399:      	adox	rbx, rbx
    239f:      	adc	rbx, 0x0
    23a3:      	mov	rcx, r15
    23a6:      	shl	rcx, 0x20
    23aa:      	mov	r10, r15
    23ad:      	shr	r10, 0x20
    23b1:      	mov	rdx, r15
    23b4:      	sub	r15, rcx
    23b7:      	sbb	rdx, r10
    23ba:      	add	r12, rcx
    23bd:      	adc	rsi, r10
    23c0:      	adc	rbp, r15
    23c3:      	adc	rdi, rdx
    23c6:      	adc	rbx, 0x0
    23ca:      	mov	rdx, qword ptr [r14 + 0x18]
    23ce:      	xor	r15d, r15d
    23d1:      	mulx	r10, rcx, r13
    23d6:      	adcx	r12, rcx
    23dc:      	adox	rsi, r10
    23e2:      	mulx	r10, rcx, r8
    23e7:      	adcx	rsi, rcx
    23ed:      	adox	rbp, r10
    23f3:      	mulx	r10, rcx, r9
    23f8:      	adcx	rbp, rcx
    23fe:      	adox	rdi, r10
    2404:      	mulx	r10, rcx, r11
    2409:      	adcx	rdi, rcx
    240f:      	adox	rbx, r10
    2415:      	adcx	rbx, r15
    241b:      	adox	r15, r15
    2421:      	adc	r15, 0x0
    2425:      	mov	rcx, r12
    2428:      	shl	rcx, 0x20
    242c:      	mov	r10, r12
    242f:      	shr	r10, 0x20
    2433:      	mov	rdx, r12
    2436:      	sub	r12, rcx
    2439:      	sbb	rdx, r10
    243c:      	add	rsi, rcx
    243f:      	adc	rbp, r10
    2442:      	adc	rdi, r12
    2445:      	adc	rbx, rdx
    2448:      	adc	r15, 0x0
    244c:      	mov	r13, rsi
    244f:      	mov	r8, rbp
    2452:      	mov	r9, rdi
    2455:      	mov	r11, rbx
    2458:      	mov	ecx, 0xffffffff
    245d:      	movabs	r10, -0xffffffff
    2467:      	sub	r13, -0x1
    246b:      	sbb	r8, rcx
    246e:      	sbb	r9, 0x0
    2472:      	sbb	r11, r10
    2475:      	sbb	r15, 0x0
    2479:      	cmovb	r13, rsi
    247d:      	cmovb	r8, rbp
    2481:      	cmovb	r9, rdi
    2485:      	cmovb	r11, rbx
    2489:      	or	rax, qword ptr [rsp - 0x28]
    248e:      	mov	rcx, rax
    2491:      	mov	rax, qword ptr [rsp - 0x30]
    2496:      	or	rax, qword ptr [rsp - 0x18]
    249b:      	or	rax, rcx
    249e:      	or	rax, qword ptr [rsp - 0x48]
    24a3:      	mov	rcx, qword ptr [rsp - 0x40]
    24a8:      	or	rcx, qword ptr [rsp - 0x38]
    24ad:      	or	rcx, rax
    24b0:      	mov	rax, rcx
    24b3:      	xor	ecx, ecx
    24b5:      	or	rax, qword ptr [rsp - 0x60]
    24ba:      	mov	rax, qword ptr [rsp + 0x78]
    24bf:      	mov	rdx, qword ptr [rsp - 0x68]
    24c4:      	mov	qword ptr [rax], rdx
    24c7:      	mov	rdx, qword ptr [rsp + 0x20]
    24cc:      	mov	qword ptr [rax + 0x8], rdx
    24d0:      	mov	rdx, qword ptr [rsp - 0x50]
    24d5:      	mov	qword ptr [rax + 0x10], rdx
    24d9:      	mov	rdx, qword ptr [rsp + 0x28]
    24de:      	mov	qword ptr [rax + 0x18], rdx
    24e2:      	mov	rdx, qword ptr [rsp - 0x78]
    24e7:      	mov	qword ptr [rax + 0x20], rdx
    24eb:      	mov	rdx, qword ptr [rsp - 0x80]
    24f0:      	mov	qword ptr [rax + 0x28], rdx
    24f4:      	mov	rdx, qword ptr [rsp - 0x58]
    24f9:      	mov	qword ptr [rax + 0x30], rdx
    24fd:      	mov	rdx, qword ptr [rsp - 0x70]
    2502:      	mov	qword ptr [rax + 0x38], rdx
    2506:      	mov	qword ptr [rax + 0x40], r13
    250a:      	mov	qword ptr [rax + 0x48], r8
    250e:      	mov	qword ptr [rax + 0x50], r9
    2512:      	mov	qword ptr [rax + 0x58], r11
    2516:      	sete	cl
    2519:      	mov	qword ptr [rax + 0x60], rcx
    251d:      	add	rsp, 0x100
    2524:      	pop	rbx
    2525:      	pop	r12
    2527:      	pop	r13
    2529:      	pop	r14
    252b:      	pop	r15
    252d:      	pop	rbp
    252e:      	ret
