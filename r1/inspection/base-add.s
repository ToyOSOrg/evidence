       0:      	push	rbp
       1:      	push	r15
       3:      	push	r14
       5:      	push	r13
       7:      	push	r12
       9:      	push	rbx
       a:      	sub	rsp, 0x1d8
      11:      	mov	r12, rdx
      14:      	mov	r13, rsi
      17:      	mov	qword ptr [rsp + 0x1b0], rdi
      1f:      	mov	r15, qword ptr [rip]    # 0x26 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x26>
      26:      	mov	eax, dword ptr [r15]
      29:      	test	eax, eax
      2b:      	jns	0x29bf <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x29bf>
      31:      	lea	rsi, [r13 + 0x40]
      35:      	not	eax
      37:      	test	eax, 0x820
      3c:      	mov	qword ptr [rsp + 0x68], rsi
      41:      	jne	0x1db <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x1db>
      47:      	mov	rax, rsi
      4a:      	mov	rdx, qword ptr [rax]
      4d:      	mulx	rdi, rsi, qword ptr [rax + 0x8]
      53:      	mulx	r8, rbp, qword ptr [rax + 0x10]
      59:      	add	rdi, rbp
      5c:      	mulx	r9, rbp, qword ptr [rax + 0x18]
      62:      	adc	r8, rbp
      65:      	adc	r9, 0x0
      69:      	mov	rdx, qword ptr [rax + 0x8]
      6d:      	mulx	r14, rbp, qword ptr [rax + 0x10]
      73:      	add	r8, rbp
      76:      	adc	r9, r14
      79:      	mulx	r10, rbp, qword ptr [rax + 0x18]
      7f:      	adc	r10, 0x0
      83:      	add	r9, rbp
      86:      	adc	r10, 0x0
      8a:      	mov	rdx, qword ptr [rax + 0x10]
      8e:      	mulx	r11, rbp, qword ptr [rax + 0x18]
      94:      	add	r10, rbp
      97:      	adc	r11, 0x0
      9b:      	xor	ebx, ebx
      9d:      	add	rsi, rsi
      a0:      	adc	rdi, rdi
      a3:      	adc	r8, r8
      a6:      	adc	r9, r9
      a9:      	adc	r10, r10
      ac:      	adc	r11, r11
      af:      	adc	rbx, 0x0
      b3:      	mov	rdx, qword ptr [rax]
      b6:      	mulx	r14, rcx, rdx
      bb:      	add	rsi, r14
      be:      	mov	rdx, qword ptr [rax + 0x8]
      c2:      	mulx	r14, rbp, rdx
      c7:      	adc	rdi, rbp
      ca:      	adc	r8, r14
      cd:      	mov	rdx, qword ptr [rax + 0x10]
      d1:      	mulx	r14, rbp, rdx
      d6:      	adc	r9, rbp
      d9:      	adc	r10, r14
      dc:      	mov	rdx, qword ptr [rax + 0x18]
      e0:      	mulx	r14, rbp, rdx
      e5:      	adc	r11, rbp
      e8:      	adc	rbx, r14
      eb:      	movabs	rax, -0xffffffff
      f5:      	mov	rdx, rcx
      f8:      	mulx	r14, rbp, rax
      fd:      	shl	rdx, 0x20
     101:      	shr	rcx, 0x20
     105:      	add	rsi, rdx
     108:      	adc	rdi, rcx
     10b:      	adc	r8, rbp
     10e:      	adc	r9, r14
     111:      	adc	r10, 0x0
     115:      	adc	r11, 0x0
     119:      	adc	rbx, 0x0
     11d:      	mov	ecx, 0x0
     122:      	adc	rcx, 0x0
     126:      	mov	rdx, rsi
     129:      	mulx	r14, rbp, rax
     12e:      	shl	rdx, 0x20
     132:      	shr	rsi, 0x20
     136:      	add	rdi, rdx
     139:      	adc	r8, rsi
     13c:      	adc	r9, rbp
     13f:      	adc	r10, r14
     142:      	adc	r11, 0x0
     146:      	adc	rbx, 0x0
     14a:      	adc	rcx, 0x0
     14e:      	mov	rdx, rdi
     151:      	mulx	r14, rbp, rax
     156:      	shl	rdx, 0x20
     15a:      	shr	rdi, 0x20
     15e:      	add	r8, rdx
     161:      	adc	r9, rdi
     164:      	adc	r10, rbp
     167:      	adc	r11, r14
     16a:      	adc	rbx, 0x0
     16e:      	adc	rcx, 0x0
     172:      	mov	rdx, r8
     175:      	mulx	r14, rbp, rax
     17a:      	shl	rdx, 0x20
     17e:      	shr	r8, 0x20
     182:      	add	r9, rdx
     185:      	adc	r10, r8
     188:      	adc	r11, rbp
     18b:      	adc	rbx, r14
     18e:      	adc	rcx, 0x0
     192:      	mov	rsi, r9
     195:      	mov	rdi, r10
     198:      	mov	r8, r11
     19b:      	mov	rdx, rbx
     19e:      	mov	ebp, 0xffffffff
     1a3:      	sub	rsi, -0x1
     1a7:      	sbb	rdi, rbp
     1aa:      	sbb	r8, 0x0
     1ae:      	sbb	rdx, rax
     1b1:      	sbb	rcx, 0x0
     1b5:      	cmovae	r9, rsi
     1b9:      	cmovae	r10, rdi
     1bd:      	cmovae	r11, r8
     1c1:      	cmovae	rbx, rdx
     1c5:      	mov	qword ptr [rsp + 0x8], r9
     1ca:      	mov	qword ptr [rsp + 0x10], r10
     1cf:      	mov	qword ptr [rsp + 0x18], r11
     1d4:      	mov	qword ptr [rsp + 0x20], rbx
     1d9:      	jmp	0x1e6 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x1e6>
     1db:      	lea	rdi, [rsp + 0x8]
     1e0:      	call	qword ptr [rip]         # 0x1e6 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x1e6>
     1e6:      	mov	rax, qword ptr [rsp + 0x8]
     1eb:      	mov	rcx, qword ptr [rsp + 0x10]
     1f0:      	mov	rdx, qword ptr [rsp + 0x18]
     1f5:      	mov	qword ptr [rsp + 0x150], rdx
     1fd:      	mov	rdx, qword ptr [rsp + 0x20]
     202:      	mov	qword ptr [rsp + 0x158], rdx
     20a:      	mov	qword ptr [rsp + 0x140], rax
     212:      	mov	qword ptr [rsp + 0x148], rcx
     21a:      	mov	eax, dword ptr [r15]
     21d:      	test	eax, eax
     21f:      	jns	0x29ca <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x29ca>
     225:      	lea	rsi, [r12 + 0x40]
     22a:      	not	eax
     22c:      	test	eax, 0x820
     231:      	mov	qword ptr [rsp + 0xb8], rsi
     239:      	jne	0x3d3 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x3d3>
     23f:      	mov	rax, rsi
     242:      	mov	rdx, qword ptr [rax]
     245:      	mulx	rdi, rsi, qword ptr [rax + 0x8]
     24b:      	mulx	r8, rbp, qword ptr [rax + 0x10]
     251:      	add	rdi, rbp
     254:      	mulx	r9, rbp, qword ptr [rax + 0x18]
     25a:      	adc	r8, rbp
     25d:      	adc	r9, 0x0
     261:      	mov	rdx, qword ptr [rax + 0x8]
     265:      	mulx	r14, rbp, qword ptr [rax + 0x10]
     26b:      	add	r8, rbp
     26e:      	adc	r9, r14
     271:      	mulx	r10, rbp, qword ptr [rax + 0x18]
     277:      	adc	r10, 0x0
     27b:      	add	r9, rbp
     27e:      	adc	r10, 0x0
     282:      	mov	rdx, qword ptr [rax + 0x10]
     286:      	mulx	r11, rbp, qword ptr [rax + 0x18]
     28c:      	add	r10, rbp
     28f:      	adc	r11, 0x0
     293:      	xor	ebx, ebx
     295:      	add	rsi, rsi
     298:      	adc	rdi, rdi
     29b:      	adc	r8, r8
     29e:      	adc	r9, r9
     2a1:      	adc	r10, r10
     2a4:      	adc	r11, r11
     2a7:      	adc	rbx, 0x0
     2ab:      	mov	rdx, qword ptr [rax]
     2ae:      	mulx	r14, rcx, rdx
     2b3:      	add	rsi, r14
     2b6:      	mov	rdx, qword ptr [rax + 0x8]
     2ba:      	mulx	r14, rbp, rdx
     2bf:      	adc	rdi, rbp
     2c2:      	adc	r8, r14
     2c5:      	mov	rdx, qword ptr [rax + 0x10]
     2c9:      	mulx	r14, rbp, rdx
     2ce:      	adc	r9, rbp
     2d1:      	adc	r10, r14
     2d4:      	mov	rdx, qword ptr [rax + 0x18]
     2d8:      	mulx	r14, rbp, rdx
     2dd:      	adc	r11, rbp
     2e0:      	adc	rbx, r14
     2e3:      	movabs	rax, -0xffffffff
     2ed:      	mov	rdx, rcx
     2f0:      	mulx	r14, rbp, rax
     2f5:      	shl	rdx, 0x20
     2f9:      	shr	rcx, 0x20
     2fd:      	add	rsi, rdx
     300:      	adc	rdi, rcx
     303:      	adc	r8, rbp
     306:      	adc	r9, r14
     309:      	adc	r10, 0x0
     30d:      	adc	r11, 0x0
     311:      	adc	rbx, 0x0
     315:      	mov	ecx, 0x0
     31a:      	adc	rcx, 0x0
     31e:      	mov	rdx, rsi
     321:      	mulx	r14, rbp, rax
     326:      	shl	rdx, 0x20
     32a:      	shr	rsi, 0x20
     32e:      	add	rdi, rdx
     331:      	adc	r8, rsi
     334:      	adc	r9, rbp
     337:      	adc	r10, r14
     33a:      	adc	r11, 0x0
     33e:      	adc	rbx, 0x0
     342:      	adc	rcx, 0x0
     346:      	mov	rdx, rdi
     349:      	mulx	r14, rbp, rax
     34e:      	shl	rdx, 0x20
     352:      	shr	rdi, 0x20
     356:      	add	r8, rdx
     359:      	adc	r9, rdi
     35c:      	adc	r10, rbp
     35f:      	adc	r11, r14
     362:      	adc	rbx, 0x0
     366:      	adc	rcx, 0x0
     36a:      	mov	rdx, r8
     36d:      	mulx	r14, rbp, rax
     372:      	shl	rdx, 0x20
     376:      	shr	r8, 0x20
     37a:      	add	r9, rdx
     37d:      	adc	r10, r8
     380:      	adc	r11, rbp
     383:      	adc	rbx, r14
     386:      	adc	rcx, 0x0
     38a:      	mov	rsi, r9
     38d:      	mov	rdi, r10
     390:      	mov	r8, r11
     393:      	mov	rdx, rbx
     396:      	mov	ebp, 0xffffffff
     39b:      	sub	rsi, -0x1
     39f:      	sbb	rdi, rbp
     3a2:      	sbb	r8, 0x0
     3a6:      	sbb	rdx, rax
     3a9:      	sbb	rcx, 0x0
     3ad:      	cmovae	r9, rsi
     3b1:      	cmovae	r10, rdi
     3b5:      	cmovae	r11, r8
     3b9:      	cmovae	rbx, rdx
     3bd:      	mov	qword ptr [rsp + 0x8], r9
     3c2:      	mov	qword ptr [rsp + 0x10], r10
     3c7:      	mov	qword ptr [rsp + 0x18], r11
     3cc:      	mov	qword ptr [rsp + 0x20], rbx
     3d1:      	jmp	0x3de <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x3de>
     3d3:      	lea	rdi, [rsp + 0x8]
     3d8:      	call	qword ptr [rip]         # 0x3de <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x3de>
     3de:      	mov	rax, qword ptr [rsp + 0x8]
     3e3:      	mov	rcx, qword ptr [rsp + 0x10]
     3e8:      	mov	rdx, qword ptr [rsp + 0x18]
     3ed:      	mov	qword ptr [rsp + 0x170], rdx
     3f5:      	mov	rdx, qword ptr [rsp + 0x20]
     3fa:      	mov	qword ptr [rsp + 0x178], rdx
     402:      	mov	qword ptr [rsp + 0x160], rax
     40a:      	mov	qword ptr [rsp + 0x168], rcx
     412:      	mov	eax, dword ptr [r15]
     415:      	test	eax, eax
     417:      	jns	0x29d5 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x29d5>
     41d:      	not	eax
     41f:      	test	eax, 0x820
     424:      	jne	0x648 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x648>
     42a:      	lea	rax, [rsp + 0x160]
     432:      	movabs	rcx, -0xffffffff
     43c:      	mov	rdx, qword ptr [r13]
     440:      	mulx	rdi, rsi, qword ptr [rax]
     445:      	mulx	r8, rbx, qword ptr [rax + 0x8]
     44b:      	add	rdi, rbx
     44e:      	mulx	r9, rbx, qword ptr [rax + 0x10]
     454:      	adc	r8, rbx
     457:      	mulx	r10, rbx, qword ptr [rax + 0x18]
     45d:      	adc	r9, rbx
     460:      	adc	r10, 0x0
     464:      	xor	r11d, r11d
     467:      	mov	rdx, rsi
     46a:      	mulx	rbp, rbx, rcx
     46f:      	shl	rdx, 0x20
     473:      	shr	rsi, 0x20
     477:      	add	rdi, rdx
     47a:      	adc	r8, rsi
     47d:      	adc	r9, rbx
     480:      	adc	r10, rbp
     483:      	adc	r11, 0x0
     487:      	mov	rdx, qword ptr [r13 + 0x8]
     48b:      	xor	esi, esi
     48d:      	mulx	rbp, rbx, qword ptr [rax]
     492:      	adcx	rdi, rbx
     498:      	adox	r8, rbp
     49e:      	mulx	rbp, rbx, qword ptr [rax + 0x8]
     4a4:      	adcx	r8, rbx
     4aa:      	adox	r9, rbp
     4b0:      	mulx	rbp, rbx, qword ptr [rax + 0x10]
     4b6:      	adcx	r9, rbx
     4bc:      	adox	r10, rbp
     4c2:      	mulx	rbp, rbx, qword ptr [rax + 0x18]
     4c8:      	adcx	r10, rbx
     4ce:      	adox	r11, rbp
     4d4:      	adcx	r11, rsi
     4da:      	adox	rsi, rsi
     4e0:      	adc	rsi, 0x0
     4e4:      	mov	rdx, rdi
     4e7:      	mulx	rbp, rbx, rcx
     4ec:      	shl	rdx, 0x20
     4f0:      	shr	rdi, 0x20
     4f4:      	add	r8, rdx
     4f7:      	adc	r9, rdi
     4fa:      	adc	r10, rbx
     4fd:      	adc	r11, rbp
     500:      	adc	rsi, 0x0
     504:      	mov	rdx, qword ptr [r13 + 0x10]
     508:      	xor	edi, edi
     50a:      	mulx	rbp, rbx, qword ptr [rax]
     50f:      	adcx	r8, rbx
     515:      	adox	r9, rbp
     51b:      	mulx	rbp, rbx, qword ptr [rax + 0x8]
     521:      	adcx	r9, rbx
     527:      	adox	r10, rbp
     52d:      	mulx	rbp, rbx, qword ptr [rax + 0x10]
     533:      	adcx	r10, rbx
     539:      	adox	r11, rbp
     53f:      	mulx	rbp, rbx, qword ptr [rax + 0x18]
     545:      	adcx	r11, rbx
     54b:      	adox	rsi, rbp
     551:      	adcx	rsi, rdi
     557:      	adox	rdi, rdi
     55d:      	adc	rdi, 0x0
     561:      	mov	rdx, r8
     564:      	mulx	rbp, rbx, rcx
     569:      	shl	rdx, 0x20
     56d:      	shr	r8, 0x20
     571:      	add	r9, rdx
     574:      	adc	r10, r8
     577:      	adc	r11, rbx
     57a:      	adc	rsi, rbp
     57d:      	adc	rdi, 0x0
     581:      	mov	rdx, qword ptr [r13 + 0x18]
     585:      	xor	r8d, r8d
     588:      	mulx	rbp, rbx, qword ptr [rax]
     58d:      	adcx	r9, rbx
     593:      	adox	r10, rbp
     599:      	mulx	rbp, rbx, qword ptr [rax + 0x8]
     59f:      	adcx	r10, rbx
     5a5:      	adox	r11, rbp
     5ab:      	mulx	rbp, rbx, qword ptr [rax + 0x10]
     5b1:      	adcx	r11, rbx
     5b7:      	adox	rsi, rbp
     5bd:      	mulx	rbp, rbx, qword ptr [rax + 0x18]
     5c3:      	adcx	rsi, rbx
     5c9:      	adox	rdi, rbp
     5cf:      	adcx	rdi, r8
     5d5:      	adox	r8, r8
     5db:      	adc	r8, 0x0
     5df:      	mov	rdx, r9
     5e2:      	mulx	rbp, rbx, rcx
     5e7:      	shl	rdx, 0x20
     5eb:      	shr	r9, 0x20
     5ef:      	add	r10, rdx
     5f2:      	adc	r11, r9
     5f5:      	adc	rsi, rbx
     5f8:      	adc	rdi, rbp
     5fb:      	adc	r8, 0x0
     5ff:      	mov	r9, r10
     602:      	mov	rbx, r11
     605:      	mov	rbp, rsi
     608:      	mov	rdx, rdi
     60b:      	mov	eax, 0xffffffff
     610:      	sub	r9, -0x1
     614:      	sbb	rbx, rax
     617:      	sbb	rbp, 0x0
     61b:      	sbb	rdx, rcx
     61e:      	sbb	r8, 0x0
     622:      	cmovae	r10, r9
     626:      	cmovae	r11, rbx
     62a:      	cmovae	rsi, rbp
     62e:      	cmovae	rdi, rdx
     632:      	mov	qword ptr [rsp + 0x8], r10
     637:      	mov	qword ptr [rsp + 0x10], r11
     63c:      	mov	qword ptr [rsp + 0x18], rsi
     641:      	mov	qword ptr [rsp + 0x20], rdi
     646:      	jmp	0x65e <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x65e>
     648:      	lea	rdi, [rsp + 0x8]
     64d:      	lea	rdx, [rsp + 0x160]
     655:      	mov	rsi, r13
     658:      	call	qword ptr [rip]         # 0x65e <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x65e>
     65e:      	mov	rax, qword ptr [rsp + 0x8]
     663:      	mov	rcx, qword ptr [rsp + 0x10]
     668:      	mov	rdx, qword ptr [rsp + 0x18]
     66d:      	mov	qword ptr [rsp + 0xf0], rdx
     675:      	mov	rdx, qword ptr [rsp + 0x20]
     67a:      	mov	qword ptr [rsp + 0xf8], rdx
     682:      	mov	qword ptr [rsp + 0xe0], rax
     68a:      	mov	qword ptr [rsp + 0xe8], rcx
     692:      	mov	eax, dword ptr [r15]
     695:      	test	eax, eax
     697:      	jns	0x29e0 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x29e0>
     69d:      	not	eax
     69f:      	test	eax, 0x820
     6a4:      	jne	0x8c1 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x8c1>
     6aa:      	lea	rax, [rsp + 0x140]
     6b2:      	movabs	rcx, -0xffffffff
     6bc:      	mov	rdx, qword ptr [r12]
     6c0:      	mulx	rbp, r14, qword ptr [rax]
     6c5:      	mulx	rsi, r8, qword ptr [rax + 0x8]
     6cb:      	add	rbp, r8
     6ce:      	mulx	rdi, r8, qword ptr [rax + 0x10]
     6d4:      	adc	rsi, r8
     6d7:      	mulx	r11, r8, qword ptr [rax + 0x18]
     6dd:      	adc	rdi, r8
     6e0:      	adc	r11, 0x0
     6e4:      	xor	r10d, r10d
     6e7:      	mov	rdx, r14
     6ea:      	mulx	r9, r8, rcx
     6ef:      	shl	rdx, 0x20
     6f3:      	shr	r14, 0x20
     6f7:      	add	rbp, rdx
     6fa:      	adc	rsi, r14
     6fd:      	adc	rdi, r8
     700:      	adc	r11, r9
     703:      	adc	r10, 0x0
     707:      	mov	rdx, qword ptr [r12 + 0x8]
     70c:      	xor	r14d, r14d
     70f:      	mulx	r9, r8, qword ptr [rax]
     714:      	adcx	rbp, r8
     71a:      	adox	rsi, r9
     720:      	mulx	r9, r8, qword ptr [rax + 0x8]
     726:      	adcx	rsi, r8
     72c:      	adox	rdi, r9
     732:      	mulx	r9, r8, qword ptr [rax + 0x10]
     738:      	adcx	rdi, r8
     73e:      	adox	r11, r9
     744:      	mulx	r9, r8, qword ptr [rax + 0x18]
     74a:      	adcx	r11, r8
     750:      	adox	r10, r9
     756:      	adcx	r10, r14
     75c:      	adox	r14, r14
     762:      	adc	r14, 0x0
     766:      	mov	rdx, rbp
     769:      	mulx	r9, r8, rcx
     76e:      	shl	rdx, 0x20
     772:      	shr	rbp, 0x20
     776:      	add	rsi, rdx
     779:      	adc	rdi, rbp
     77c:      	adc	r11, r8
     77f:      	adc	r10, r9
     782:      	adc	r14, 0x0
     786:      	mov	rdx, qword ptr [r12 + 0x10]
     78b:      	xor	ebp, ebp
     78d:      	mulx	r9, r8, qword ptr [rax]
     792:      	adcx	rsi, r8
     798:      	adox	rdi, r9
     79e:      	mulx	r9, r8, qword ptr [rax + 0x8]
     7a4:      	adcx	rdi, r8
     7aa:      	adox	r11, r9
     7b0:      	mulx	r9, r8, qword ptr [rax + 0x10]
     7b6:      	adcx	r11, r8
     7bc:      	adox	r10, r9
     7c2:      	mulx	r9, r8, qword ptr [rax + 0x18]
     7c8:      	adcx	r10, r8
     7ce:      	adox	r14, r9
     7d4:      	adcx	r14, rbp
     7da:      	adox	rbp, rbp
     7e0:      	adc	rbp, 0x0
     7e4:      	mov	rdx, rsi
     7e7:      	mulx	r9, r8, rcx
     7ec:      	shl	rdx, 0x20
     7f0:      	shr	rsi, 0x20
     7f4:      	add	rdi, rdx
     7f7:      	adc	r11, rsi
     7fa:      	adc	r10, r8
     7fd:      	adc	r14, r9
     800:      	adc	rbp, 0x0
     804:      	mov	rdx, qword ptr [r12 + 0x18]
     809:      	xor	esi, esi
     80b:      	mulx	r9, r8, qword ptr [rax]
     810:      	adcx	rdi, r8
     816:      	adox	r11, r9
     81c:      	mulx	r9, r8, qword ptr [rax + 0x8]
     822:      	adcx	r11, r8
     828:      	adox	r10, r9
     82e:      	mulx	r9, r8, qword ptr [rax + 0x10]
     834:      	adcx	r10, r8
     83a:      	adox	r14, r9
     840:      	mulx	r9, r8, qword ptr [rax + 0x18]
     846:      	adcx	r14, r8
     84c:      	adox	rbp, r9
     852:      	adcx	rbp, rsi
     858:      	adox	rsi, rsi
     85e:      	adc	rsi, 0x0
     862:      	mov	rdx, rdi
     865:      	mulx	r9, r8, rcx
     86a:      	shl	rdx, 0x20
     86e:      	shr	rdi, 0x20
     872:      	add	r11, rdx
     875:      	adc	r10, rdi
     878:      	adc	r14, r8
     87b:      	adc	rbp, r9
     87e:      	adc	rsi, 0x0
     882:      	mov	rdi, r11
     885:      	mov	r8, r10
     888:      	mov	r9, r14
     88b:      	mov	rdx, rbp
     88e:      	mov	eax, 0xffffffff
     893:      	sub	rdi, -0x1
     897:      	sbb	r8, rax
     89a:      	sbb	r9, 0x0
     89e:      	sbb	rdx, rcx
     8a1:      	sbb	rsi, 0x0
     8a5:      	cmovae	r11, rdi
     8a9:      	cmovae	r10, r8
     8ad:      	cmovae	r14, r9
     8b1:      	cmovae	rbp, rdx
     8b5:      	mov	qword ptr [rsp + 0x38], r11
     8ba:      	mov	qword ptr [rsp + 0x28], r10
     8bf:      	jmp	0x8f5 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x8f5>
     8c1:      	lea	rdi, [rsp + 0x8]
     8c6:      	lea	rdx, [rsp + 0x140]
     8ce:      	mov	rsi, r12
     8d1:      	call	qword ptr [rip]         # 0x8d7 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x8d7>
     8d7:      	mov	rax, qword ptr [rsp + 0x8]
     8dc:      	mov	qword ptr [rsp + 0x38], rax
     8e1:      	mov	rax, qword ptr [rsp + 0x10]
     8e6:      	mov	qword ptr [rsp + 0x28], rax
     8eb:      	mov	r14, qword ptr [rsp + 0x18]
     8f0:      	mov	rbp, qword ptr [rsp + 0x20]
     8f5:      	mov	eax, dword ptr [r15]
     8f8:      	test	eax, eax
     8fa:      	jns	0x29eb <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x29eb>
     900:      	not	eax
     902:      	test	eax, 0x820
     907:      	jne	0xb55 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0xb55>
     90d:      	lea	rax, [rsp + 0x160]
     915:      	movabs	rcx, -0xffffffff
     91f:      	mov	qword ptr [rsp + 0x30], r13
     924:      	mov	r13, r14
     927:      	mov	r14, rbp
     92a:      	mov	rbp, r12
     92d:      	add	r12, 0x40
     931:      	mov	rdx, qword ptr [r12]
     935:      	mulx	rdi, rsi, qword ptr [rax]
     93a:      	mulx	r8, rbx, qword ptr [rax + 0x8]
     940:      	add	rdi, rbx
     943:      	mulx	r9, rbx, qword ptr [rax + 0x10]
     949:      	adc	r8, rbx
     94c:      	mulx	r10, rbx, qword ptr [rax + 0x18]
     952:      	adc	r9, rbx
     955:      	adc	r10, 0x0
     959:      	xor	r11d, r11d
     95c:      	mov	rdx, rsi
     95f:      	mulx	r15, rbx, rcx
     964:      	shl	rdx, 0x20
     968:      	shr	rsi, 0x20
     96c:      	add	rdi, rdx
     96f:      	adc	r8, rsi
     972:      	adc	r9, rbx
     975:      	adc	r10, r15
     978:      	adc	r11, 0x0
     97c:      	mov	rdx, qword ptr [r12 + 0x8]
     981:      	xor	esi, esi
     983:      	mulx	r15, rbx, qword ptr [rax]
     988:      	adcx	rdi, rbx
     98e:      	adox	r8, r15
     994:      	mulx	r15, rbx, qword ptr [rax + 0x8]
     99a:      	adcx	r8, rbx
     9a0:      	adox	r9, r15
     9a6:      	mulx	r15, rbx, qword ptr [rax + 0x10]
     9ac:      	adcx	r9, rbx
     9b2:      	adox	r10, r15
     9b8:      	mulx	r15, rbx, qword ptr [rax + 0x18]
     9be:      	adcx	r10, rbx
     9c4:      	adox	r11, r15
     9ca:      	adcx	r11, rsi
     9d0:      	adox	rsi, rsi
     9d6:      	adc	rsi, 0x0
     9da:      	mov	rdx, rdi
     9dd:      	mulx	r15, rbx, rcx
     9e2:      	shl	rdx, 0x20
     9e6:      	shr	rdi, 0x20
     9ea:      	add	r8, rdx
     9ed:      	adc	r9, rdi
     9f0:      	adc	r10, rbx
     9f3:      	adc	r11, r15
     9f6:      	adc	rsi, 0x0
     9fa:      	mov	rdx, qword ptr [r12 + 0x10]
     9ff:      	xor	edi, edi
     a01:      	mulx	r15, rbx, qword ptr [rax]
     a06:      	adcx	r8, rbx
     a0c:      	adox	r9, r15
     a12:      	mulx	r15, rbx, qword ptr [rax + 0x8]
     a18:      	adcx	r9, rbx
     a1e:      	adox	r10, r15
     a24:      	mulx	r15, rbx, qword ptr [rax + 0x10]
     a2a:      	adcx	r10, rbx
     a30:      	adox	r11, r15
     a36:      	mulx	r15, rbx, qword ptr [rax + 0x18]
     a3c:      	adcx	r11, rbx
     a42:      	adox	rsi, r15
     a48:      	adcx	rsi, rdi
     a4e:      	adox	rdi, rdi
     a54:      	adc	rdi, 0x0
     a58:      	mov	rdx, r8
     a5b:      	mulx	r15, rbx, rcx
     a60:      	shl	rdx, 0x20
     a64:      	shr	r8, 0x20
     a68:      	add	r9, rdx
     a6b:      	adc	r10, r8
     a6e:      	adc	r11, rbx
     a71:      	adc	rsi, r15
     a74:      	adc	rdi, 0x0
     a78:      	mov	rdx, qword ptr [r12 + 0x18]
     a7d:      	xor	r8d, r8d
     a80:      	mulx	r15, rbx, qword ptr [rax]
     a85:      	adcx	r9, rbx
     a8b:      	adox	r10, r15
     a91:      	mulx	r15, rbx, qword ptr [rax + 0x8]
     a97:      	adcx	r10, rbx
     a9d:      	adox	r11, r15
     aa3:      	mulx	r15, rbx, qword ptr [rax + 0x10]
     aa9:      	adcx	r11, rbx
     aaf:      	adox	rsi, r15
     ab5:      	mulx	r15, rbx, qword ptr [rax + 0x18]
     abb:      	adcx	rsi, rbx
     ac1:      	adox	rdi, r15
     ac7:      	adcx	rdi, r8
     acd:      	adox	r8, r8
     ad3:      	adc	r8, 0x0
     ad7:      	mov	rdx, r9
     ada:      	mulx	r15, rbx, rcx
     adf:      	shl	rdx, 0x20
     ae3:      	shr	r9, 0x20
     ae7:      	add	r10, rdx
     aea:      	adc	r11, r9
     aed:      	adc	rsi, rbx
     af0:      	adc	rdi, r15
     af3:      	adc	r8, 0x0
     af7:      	mov	r9, r10
     afa:      	mov	rbx, r11
     afd:      	mov	r15, rsi
     b00:      	mov	rdx, rdi
     b03:      	mov	eax, 0xffffffff
     b08:      	sub	r9, -0x1
     b0c:      	sbb	rbx, rax
     b0f:      	sbb	r15, 0x0
     b13:      	sbb	rdx, rcx
     b16:      	sbb	r8, 0x0
     b1a:      	cmovae	r10, r9
     b1e:      	cmovae	r11, rbx
     b22:      	cmovae	rsi, r15
     b26:      	cmovae	rdi, rdx
     b2a:      	mov	r12, rbp
     b2d:      	mov	rbp, r14
     b30:      	mov	r14, r13
     b33:      	mov	r13, qword ptr [rsp + 0x30]
     b38:      	mov	r15, qword ptr [rip]    # 0xb3f <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0xb3f>
     b3f:      	mov	qword ptr [rsp + 0x8], r10
     b44:      	mov	qword ptr [rsp + 0x10], r11
     b49:      	mov	qword ptr [rsp + 0x18], rsi
     b4e:      	mov	qword ptr [rsp + 0x20], rdi
     b53:      	jmp	0xb6d <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0xb6d>
     b55:      	lea	rdi, [rsp + 0x8]
     b5a:      	lea	rdx, [rsp + 0x160]
     b62:      	lea	rsi, [r12 + 0x40]
     b67:      	call	qword ptr [rip]         # 0xb6d <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0xb6d>
     b6d:      	mov	rax, qword ptr [rsp + 0x8]
     b72:      	mov	rcx, qword ptr [rsp + 0x10]
     b77:      	mov	rdx, qword ptr [rsp + 0x18]
     b7c:      	mov	qword ptr [rsp + 0x50], rdx
     b81:      	mov	rdx, qword ptr [rsp + 0x20]
     b86:      	mov	qword ptr [rsp + 0x58], rdx
     b8b:      	mov	qword ptr [rsp + 0x40], rax
     b90:      	mov	qword ptr [rsp + 0x48], rcx
     b95:      	mov	eax, dword ptr [r15]
     b98:      	test	eax, eax
     b9a:      	jns	0x29f6 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x29f6>
     ba0:      	add	r13, 0x20
     ba4:      	not	eax
     ba6:      	test	eax, 0x820
     bab:      	jne	0xdd3 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0xdd3>
     bb1:      	lea	rax, [rsp + 0x40]
     bb6:      	movabs	rcx, -0xffffffff
     bc0:      	mov	rdx, qword ptr [r13]
     bc4:      	mulx	rdi, rsi, qword ptr [rax]
     bc9:      	mulx	r8, rbx, qword ptr [rax + 0x8]
     bcf:      	add	rdi, rbx
     bd2:      	mulx	r9, rbx, qword ptr [rax + 0x10]
     bd8:      	adc	r8, rbx
     bdb:      	mulx	r10, rbx, qword ptr [rax + 0x18]
     be1:      	adc	r9, rbx
     be4:      	adc	r10, 0x0
     be8:      	xor	r11d, r11d
     beb:      	mov	rdx, rsi
     bee:      	mulx	r15, rbx, rcx
     bf3:      	shl	rdx, 0x20
     bf7:      	shr	rsi, 0x20
     bfb:      	add	rdi, rdx
     bfe:      	adc	r8, rsi
     c01:      	adc	r9, rbx
     c04:      	adc	r10, r15
     c07:      	adc	r11, 0x0
     c0b:      	mov	rdx, qword ptr [r13 + 0x8]
     c0f:      	xor	esi, esi
     c11:      	mulx	r15, rbx, qword ptr [rax]
     c16:      	adcx	rdi, rbx
     c1c:      	adox	r8, r15
     c22:      	mulx	r15, rbx, qword ptr [rax + 0x8]
     c28:      	adcx	r8, rbx
     c2e:      	adox	r9, r15
     c34:      	mulx	r15, rbx, qword ptr [rax + 0x10]
     c3a:      	adcx	r9, rbx
     c40:      	adox	r10, r15
     c46:      	mulx	r15, rbx, qword ptr [rax + 0x18]
     c4c:      	adcx	r10, rbx
     c52:      	adox	r11, r15
     c58:      	adcx	r11, rsi
     c5e:      	adox	rsi, rsi
     c64:      	adc	rsi, 0x0
     c68:      	mov	rdx, rdi
     c6b:      	mulx	r15, rbx, rcx
     c70:      	shl	rdx, 0x20
     c74:      	shr	rdi, 0x20
     c78:      	add	r8, rdx
     c7b:      	adc	r9, rdi
     c7e:      	adc	r10, rbx
     c81:      	adc	r11, r15
     c84:      	adc	rsi, 0x0
     c88:      	mov	rdx, qword ptr [r13 + 0x10]
     c8c:      	xor	edi, edi
     c8e:      	mulx	r15, rbx, qword ptr [rax]
     c93:      	adcx	r8, rbx
     c99:      	adox	r9, r15
     c9f:      	mulx	r15, rbx, qword ptr [rax + 0x8]
     ca5:      	adcx	r9, rbx
     cab:      	adox	r10, r15
     cb1:      	mulx	r15, rbx, qword ptr [rax + 0x10]
     cb7:      	adcx	r10, rbx
     cbd:      	adox	r11, r15
     cc3:      	mulx	r15, rbx, qword ptr [rax + 0x18]
     cc9:      	adcx	r11, rbx
     ccf:      	adox	rsi, r15
     cd5:      	adcx	rsi, rdi
     cdb:      	adox	rdi, rdi
     ce1:      	adc	rdi, 0x0
     ce5:      	mov	rdx, r8
     ce8:      	mulx	r15, rbx, rcx
     ced:      	shl	rdx, 0x20
     cf1:      	shr	r8, 0x20
     cf5:      	add	r9, rdx
     cf8:      	adc	r10, r8
     cfb:      	adc	r11, rbx
     cfe:      	adc	rsi, r15
     d01:      	adc	rdi, 0x0
     d05:      	mov	rdx, qword ptr [r13 + 0x18]
     d09:      	xor	r8d, r8d
     d0c:      	mulx	r15, rbx, qword ptr [rax]
     d11:      	adcx	r9, rbx
     d17:      	adox	r10, r15
     d1d:      	mulx	r15, rbx, qword ptr [rax + 0x8]
     d23:      	adcx	r10, rbx
     d29:      	adox	r11, r15
     d2f:      	mulx	r15, rbx, qword ptr [rax + 0x10]
     d35:      	adcx	r11, rbx
     d3b:      	adox	rsi, r15
     d41:      	mulx	r15, rbx, qword ptr [rax + 0x18]
     d47:      	adcx	rsi, rbx
     d4d:      	adox	rdi, r15
     d53:      	adcx	rdi, r8
     d59:      	adox	r8, r8
     d5f:      	adc	r8, 0x0
     d63:      	mov	rdx, r9
     d66:      	mulx	r15, rbx, rcx
     d6b:      	shl	rdx, 0x20
     d6f:      	shr	r9, 0x20
     d73:      	add	r10, rdx
     d76:      	adc	r11, r9
     d79:      	adc	rsi, rbx
     d7c:      	adc	rdi, r15
     d7f:      	adc	r8, 0x0
     d83:      	mov	r9, r10
     d86:      	mov	rbx, r11
     d89:      	mov	r15, rsi
     d8c:      	mov	rdx, rdi
     d8f:      	mov	eax, 0xffffffff
     d94:      	sub	r9, -0x1
     d98:      	sbb	rbx, rax
     d9b:      	sbb	r15, 0x0
     d9f:      	sbb	rdx, rcx
     da2:      	sbb	r8, 0x0
     da6:      	cmovae	r10, r9
     daa:      	cmovae	r11, rbx
     dae:      	cmovae	rsi, r15
     db2:      	cmovae	rdi, rdx
     db6:      	mov	r15, qword ptr [rip]    # 0xdbd <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0xdbd>
     dbd:      	mov	qword ptr [rsp + 0x8], r10
     dc2:      	mov	qword ptr [rsp + 0x10], r11
     dc7:      	mov	qword ptr [rsp + 0x18], rsi
     dcc:      	mov	qword ptr [rsp + 0x20], rdi
     dd1:      	jmp	0xde6 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0xde6>
     dd3:      	lea	rdi, [rsp + 0x8]
     dd8:      	lea	rdx, [rsp + 0x40]
     ddd:      	mov	rsi, r13
     de0:      	call	qword ptr [rip]         # 0xde6 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0xde6>
     de6:      	mov	rax, qword ptr [rsp + 0x8]
     deb:      	mov	rcx, qword ptr [rsp + 0x10]
     df0:      	mov	rdx, qword ptr [rsp + 0x18]
     df5:      	mov	qword ptr [rsp + 0x110], rdx
     dfd:      	mov	rdx, qword ptr [rsp + 0x20]
     e02:      	mov	qword ptr [rsp + 0x118], rdx
     e0a:      	mov	qword ptr [rsp + 0x100], rax
     e12:      	mov	qword ptr [rsp + 0x108], rcx
     e1a:      	mov	eax, dword ptr [r15]
     e1d:      	test	eax, eax
     e1f:      	jns	0x2a01 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2a01>
     e25:      	not	eax
     e27:      	test	eax, 0x820
     e2c:      	jne	0x105c <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x105c>
     e32:      	lea	rax, [rsp + 0x140]
     e3a:      	movabs	rcx, -0xffffffff
     e44:      	mov	r13, qword ptr [rsp + 0x68]
     e49:      	mov	rdx, qword ptr [r13]
     e4d:      	mulx	rdi, rsi, qword ptr [rax]
     e52:      	mulx	r8, rbx, qword ptr [rax + 0x8]
     e58:      	add	rdi, rbx
     e5b:      	mulx	r9, rbx, qword ptr [rax + 0x10]
     e61:      	adc	r8, rbx
     e64:      	mulx	r10, rbx, qword ptr [rax + 0x18]
     e6a:      	adc	r9, rbx
     e6d:      	adc	r10, 0x0
     e71:      	xor	r11d, r11d
     e74:      	mov	rdx, rsi
     e77:      	mulx	r15, rbx, rcx
     e7c:      	shl	rdx, 0x20
     e80:      	shr	rsi, 0x20
     e84:      	add	rdi, rdx
     e87:      	adc	r8, rsi
     e8a:      	adc	r9, rbx
     e8d:      	adc	r10, r15
     e90:      	adc	r11, 0x0
     e94:      	mov	rdx, qword ptr [r13 + 0x8]
     e98:      	xor	esi, esi
     e9a:      	mulx	r15, rbx, qword ptr [rax]
     e9f:      	adcx	rdi, rbx
     ea5:      	adox	r8, r15
     eab:      	mulx	r15, rbx, qword ptr [rax + 0x8]
     eb1:      	adcx	r8, rbx
     eb7:      	adox	r9, r15
     ebd:      	mulx	r15, rbx, qword ptr [rax + 0x10]
     ec3:      	adcx	r9, rbx
     ec9:      	adox	r10, r15
     ecf:      	mulx	r15, rbx, qword ptr [rax + 0x18]
     ed5:      	adcx	r10, rbx
     edb:      	adox	r11, r15
     ee1:      	adcx	r11, rsi
     ee7:      	adox	rsi, rsi
     eed:      	adc	rsi, 0x0
     ef1:      	mov	rdx, rdi
     ef4:      	mulx	r15, rbx, rcx
     ef9:      	shl	rdx, 0x20
     efd:      	shr	rdi, 0x20
     f01:      	add	r8, rdx
     f04:      	adc	r9, rdi
     f07:      	adc	r10, rbx
     f0a:      	adc	r11, r15
     f0d:      	adc	rsi, 0x0
     f11:      	mov	rdx, qword ptr [r13 + 0x10]
     f15:      	xor	edi, edi
     f17:      	mulx	r15, rbx, qword ptr [rax]
     f1c:      	adcx	r8, rbx
     f22:      	adox	r9, r15
     f28:      	mulx	r15, rbx, qword ptr [rax + 0x8]
     f2e:      	adcx	r9, rbx
     f34:      	adox	r10, r15
     f3a:      	mulx	r15, rbx, qword ptr [rax + 0x10]
     f40:      	adcx	r10, rbx
     f46:      	adox	r11, r15
     f4c:      	mulx	r15, rbx, qword ptr [rax + 0x18]
     f52:      	adcx	r11, rbx
     f58:      	adox	rsi, r15
     f5e:      	adcx	rsi, rdi
     f64:      	adox	rdi, rdi
     f6a:      	adc	rdi, 0x0
     f6e:      	mov	rdx, r8
     f71:      	mulx	r15, rbx, rcx
     f76:      	shl	rdx, 0x20
     f7a:      	shr	r8, 0x20
     f7e:      	add	r9, rdx
     f81:      	adc	r10, r8
     f84:      	adc	r11, rbx
     f87:      	adc	rsi, r15
     f8a:      	adc	rdi, 0x0
     f8e:      	mov	rdx, qword ptr [r13 + 0x18]
     f92:      	xor	r8d, r8d
     f95:      	mulx	r15, rbx, qword ptr [rax]
     f9a:      	adcx	r9, rbx
     fa0:      	adox	r10, r15
     fa6:      	mulx	r15, rbx, qword ptr [rax + 0x8]
     fac:      	adcx	r10, rbx
     fb2:      	adox	r11, r15
     fb8:      	mulx	r15, rbx, qword ptr [rax + 0x10]
     fbe:      	adcx	r11, rbx
     fc4:      	adox	rsi, r15
     fca:      	mulx	r15, rbx, qword ptr [rax + 0x18]
     fd0:      	adcx	rsi, rbx
     fd6:      	adox	rdi, r15
     fdc:      	adcx	rdi, r8
     fe2:      	adox	r8, r8
     fe8:      	adc	r8, 0x0
     fec:      	mov	rdx, r9
     fef:      	mulx	r15, rbx, rcx
     ff4:      	shl	rdx, 0x20
     ff8:      	shr	r9, 0x20
     ffc:      	add	r10, rdx
     fff:      	adc	r11, r9
    1002:      	adc	rsi, rbx
    1005:      	adc	rdi, r15
    1008:      	adc	r8, 0x0
    100c:      	mov	r9, r10
    100f:      	mov	rbx, r11
    1012:      	mov	r15, rsi
    1015:      	mov	rdx, rdi
    1018:      	mov	eax, 0xffffffff
    101d:      	sub	r9, -0x1
    1021:      	sbb	rbx, rax
    1024:      	sbb	r15, 0x0
    1028:      	sbb	rdx, rcx
    102b:      	sbb	r8, 0x0
    102f:      	cmovae	r10, r9
    1033:      	cmovae	r11, rbx
    1037:      	cmovae	rsi, r15
    103b:      	cmovae	rdi, rdx
    103f:      	mov	r15, qword ptr [rip]    # 0x1046 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x1046>
    1046:      	mov	qword ptr [rsp + 0x8], r10
    104b:      	mov	qword ptr [rsp + 0x10], r11
    1050:      	mov	qword ptr [rsp + 0x18], rsi
    1055:      	mov	qword ptr [rsp + 0x20], rdi
    105a:      	jmp	0x1074 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x1074>
    105c:      	lea	rdi, [rsp + 0x8]
    1061:      	lea	rdx, [rsp + 0x140]
    1069:      	mov	rsi, qword ptr [rsp + 0x68]
    106e:      	call	qword ptr [rip]         # 0x1074 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x1074>
    1074:      	mov	rax, qword ptr [rsp + 0x8]
    1079:      	mov	rcx, qword ptr [rsp + 0x10]
    107e:      	mov	rdx, qword ptr [rsp + 0x18]
    1083:      	mov	qword ptr [rsp + 0x50], rdx
    1088:      	mov	rdx, qword ptr [rsp + 0x20]
    108d:      	mov	qword ptr [rsp + 0x58], rdx
    1092:      	mov	qword ptr [rsp + 0x40], rax
    1097:      	mov	qword ptr [rsp + 0x48], rcx
    109c:      	mov	eax, dword ptr [r15]
    109f:      	test	eax, eax
    10a1:      	jns	0x2a0c <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2a0c>
    10a7:      	add	r12, 0x20
    10ab:      	not	eax
    10ad:      	test	eax, 0x820
    10b2:      	jne	0x12c9 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x12c9>
    10b8:      	lea	r8, [rsp + 0x40]
    10bd:      	movabs	r9, -0xffffffff
    10c7:      	mov	rdx, qword ptr [r12]
    10cb:      	mulx	rcx, rax, qword ptr [r8]
    10d0:      	mulx	r10, rbx, qword ptr [r8 + 0x8]
    10d6:      	add	rcx, rbx
    10d9:      	mulx	r11, rbx, qword ptr [r8 + 0x10]
    10df:      	adc	r10, rbx
    10e2:      	mulx	rdi, rbx, qword ptr [r8 + 0x18]
    10e8:      	adc	r11, rbx
    10eb:      	adc	rdi, 0x0
    10ef:      	xor	esi, esi
    10f1:      	mov	rdx, rax
    10f4:      	mulx	r15, rbx, r9
    10f9:      	shl	rdx, 0x20
    10fd:      	shr	rax, 0x20
    1101:      	add	rcx, rdx
    1104:      	adc	r10, rax
    1107:      	adc	r11, rbx
    110a:      	adc	rdi, r15
    110d:      	adc	rsi, 0x0
    1111:      	mov	rdx, qword ptr [r12 + 0x8]
    1116:      	xor	eax, eax
    1118:      	mulx	r15, rbx, qword ptr [r8]
    111d:      	adcx	rcx, rbx
    1123:      	adox	r10, r15
    1129:      	mulx	r15, rbx, qword ptr [r8 + 0x8]
    112f:      	adcx	r10, rbx
    1135:      	adox	r11, r15
    113b:      	mulx	r15, rbx, qword ptr [r8 + 0x10]
    1141:      	adcx	r11, rbx
    1147:      	adox	rdi, r15
    114d:      	mulx	r15, rbx, qword ptr [r8 + 0x18]
    1153:      	adcx	rdi, rbx
    1159:      	adox	rsi, r15
    115f:      	adcx	rsi, rax
    1165:      	adox	rax, rax
    116b:      	adc	rax, 0x0
    116f:      	mov	rdx, rcx
    1172:      	mulx	r15, rbx, r9
    1177:      	shl	rdx, 0x20
    117b:      	shr	rcx, 0x20
    117f:      	add	r10, rdx
    1182:      	adc	r11, rcx
    1185:      	adc	rdi, rbx
    1188:      	adc	rsi, r15
    118b:      	adc	rax, 0x0
    118f:      	mov	rdx, qword ptr [r12 + 0x10]
    1194:      	xor	ecx, ecx
    1196:      	mulx	r15, rbx, qword ptr [r8]
    119b:      	adcx	r10, rbx
    11a1:      	adox	r11, r15
    11a7:      	mulx	r15, rbx, qword ptr [r8 + 0x8]
    11ad:      	adcx	r11, rbx
    11b3:      	adox	rdi, r15
    11b9:      	mulx	r15, rbx, qword ptr [r8 + 0x10]
    11bf:      	adcx	rdi, rbx
    11c5:      	adox	rsi, r15
    11cb:      	mulx	r15, rbx, qword ptr [r8 + 0x18]
    11d1:      	adcx	rsi, rbx
    11d7:      	adox	rax, r15
    11dd:      	adcx	rax, rcx
    11e3:      	adox	rcx, rcx
    11e9:      	adc	rcx, 0x0
    11ed:      	mov	rdx, r10
    11f0:      	mulx	r15, rbx, r9
    11f5:      	shl	rdx, 0x20
    11f9:      	shr	r10, 0x20
    11fd:      	add	r11, rdx
    1200:      	adc	rdi, r10
    1203:      	adc	rsi, rbx
    1206:      	adc	rax, r15
    1209:      	adc	rcx, 0x0
    120d:      	mov	rdx, qword ptr [r12 + 0x18]
    1212:      	xor	r10d, r10d
    1215:      	mulx	r15, rbx, qword ptr [r8]
    121a:      	adcx	r11, rbx
    1220:      	adox	rdi, r15
    1226:      	mulx	r15, rbx, qword ptr [r8 + 0x8]
    122c:      	adcx	rdi, rbx
    1232:      	adox	rsi, r15
    1238:      	mulx	r15, rbx, qword ptr [r8 + 0x10]
    123e:      	adcx	rsi, rbx
    1244:      	adox	rax, r15
    124a:      	mulx	r15, rbx, qword ptr [r8 + 0x18]
    1250:      	adcx	rax, rbx
    1256:      	adox	rcx, r15
    125c:      	adcx	rcx, r10
    1262:      	adox	r10, r10
    1268:      	adc	r10, 0x0
    126c:      	mov	rdx, r11
    126f:      	mulx	r15, rbx, r9
    1274:      	shl	rdx, 0x20
    1278:      	shr	r11, 0x20
    127c:      	add	rdi, rdx
    127f:      	adc	rsi, r11
    1282:      	adc	rax, rbx
    1285:      	adc	rcx, r15
    1288:      	adc	r10, 0x0
    128c:      	mov	r11, rdi
    128f:      	mov	rbx, rsi
    1292:      	mov	r15, rax
    1295:      	mov	rdx, rcx
    1298:      	mov	r8d, 0xffffffff
    129e:      	sub	r11, -0x1
    12a2:      	sbb	rbx, r8
    12a5:      	sbb	r15, 0x0
    12a9:      	sbb	rdx, r9
    12ac:      	sbb	r10, 0x0
    12b0:      	cmovae	rdi, r11
    12b4:      	cmovae	rsi, rbx
    12b8:      	cmovae	rax, r15
    12bc:      	cmovae	rcx, rdx
    12c0:      	mov	r15, qword ptr [rip]    # 0x12c7 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x12c7>
    12c7:      	jmp	0x12f0 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x12f0>
    12c9:      	lea	rdi, [rsp + 0x8]
    12ce:      	lea	rdx, [rsp + 0x40]
    12d3:      	mov	rsi, r12
    12d6:      	call	qword ptr [rip]         # 0x12dc <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x12dc>
    12dc:      	mov	rdi, qword ptr [rsp + 0x8]
    12e1:      	mov	rsi, qword ptr [rsp + 0x10]
    12e6:      	mov	rax, qword ptr [rsp + 0x18]
    12eb:      	mov	rcx, qword ptr [rsp + 0x20]
    12f0:      	mov	rbx, qword ptr [rsp + 0x38]
    12f5:      	sub	rbx, qword ptr [rsp + 0xe0]
    12fd:      	mov	r11, qword ptr [rsp + 0x28]
    1302:      	sbb	r11, qword ptr [rsp + 0xe8]
    130a:      	sbb	r14, qword ptr [rsp + 0xf0]
    1312:      	setb	dl
    1315:      	movzx	edx, dl
    1318:      	mov	r8, rdx
    131b:      	neg	r8
    131e:      	sub	rbp, qword ptr [rsp + 0xf8]
    1326:      	movabs	r12, -0xffffffff
    1330:      	setb	r9b
    1334:      	sete	r10b
    1338:      	and	dl, r10b
    133b:      	or	dl, r9b
    133e:      	movzx	edx, dl
    1341:      	mov	r9, rbx
    1344:      	sub	r9, rdx
    1347:      	neg	rdx
    134a:      	mov	r10d, edx
    134d:      	and	rdx, r12
    1350:      	cmp	r9, rbx
    1353:      	adc	r10, r11
    1356:      	adc	r14, 0x0
    135a:      	lea	rdx, [rbp + rdx]
    135f:      	adc	rdx, r8
    1362:      	sub	rdi, qword ptr [rsp + 0x100]
    136a:      	sbb	rsi, qword ptr [rsp + 0x108]
    1372:      	sbb	rax, qword ptr [rsp + 0x110]
    137a:      	mov	qword ptr [rsp + 0x70], r9
    137f:      	mov	qword ptr [rsp + 0x78], r10
    1384:      	setb	r8b
    1388:      	movzx	r9d, r8b
    138c:      	mov	r8, r9
    138f:      	neg	r8
    1392:      	sub	rcx, qword ptr [rsp + 0x118]
    139a:      	mov	qword ptr [rsp + 0x80], r14
    13a2:      	setb	r10b
    13a6:      	sete	r11b
    13aa:      	and	r9b, r11b
    13ad:      	or	r9b, r10b
    13b0:      	movzx	r9d, r9b
    13b4:      	mov	r10, rdi
    13b7:      	sub	r10, r9
    13ba:      	neg	r9
    13bd:      	mov	r11d, r9d
    13c0:      	and	r9, r12
    13c3:      	cmp	r10, rdi
    13c6:      	adc	r11, rsi
    13c9:      	mov	qword ptr [rsp + 0x88], rdx
    13d1:      	adc	rax, 0x0
    13d5:      	lea	rcx, [rcx + r9]
    13d9:      	adc	rcx, r8
    13dc:      	mov	qword ptr [rsp + 0xc0], r10
    13e4:      	mov	qword ptr [rsp + 0xc8], r11
    13ec:      	mov	qword ptr [rsp + 0xd0], rax
    13f4:      	mov	qword ptr [rsp + 0xd8], rcx
    13fc:      	mov	eax, dword ptr [r15]
    13ff:      	test	eax, eax
    1401:      	jns	0x2a17 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2a17>
    1407:      	not	eax
    1409:      	test	eax, 0x820
    140e:      	jne	0x15aa <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x15aa>
    1414:      	lea	rax, [rsp + 0x70]
    1419:      	mov	rdx, qword ptr [rax]
    141c:      	mulx	rdi, rsi, qword ptr [rax + 0x8]
    1422:      	mulx	r8, rbp, qword ptr [rax + 0x10]
    1428:      	add	rdi, rbp
    142b:      	mulx	r9, rbp, qword ptr [rax + 0x18]
    1431:      	adc	r8, rbp
    1434:      	adc	r9, 0x0
    1438:      	mov	rdx, qword ptr [rax + 0x8]
    143c:      	mulx	r14, rbp, qword ptr [rax + 0x10]
    1442:      	add	r8, rbp
    1445:      	adc	r9, r14
    1448:      	mulx	r10, rbp, qword ptr [rax + 0x18]
    144e:      	adc	r10, 0x0
    1452:      	add	r9, rbp
    1455:      	adc	r10, 0x0
    1459:      	mov	rdx, qword ptr [rax + 0x10]
    145d:      	mulx	r11, rbp, qword ptr [rax + 0x18]
    1463:      	add	r10, rbp
    1466:      	adc	r11, 0x0
    146a:      	xor	ebx, ebx
    146c:      	add	rsi, rsi
    146f:      	adc	rdi, rdi
    1472:      	adc	r8, r8
    1475:      	adc	r9, r9
    1478:      	adc	r10, r10
    147b:      	adc	r11, r11
    147e:      	adc	rbx, 0x0
    1482:      	mov	rdx, qword ptr [rax]
    1485:      	mulx	r14, rcx, rdx
    148a:      	add	rsi, r14
    148d:      	mov	rdx, qword ptr [rax + 0x8]
    1491:      	mulx	r14, rbp, rdx
    1496:      	adc	rdi, rbp
    1499:      	adc	r8, r14
    149c:      	mov	rdx, qword ptr [rax + 0x10]
    14a0:      	mulx	r14, rbp, rdx
    14a5:      	adc	r9, rbp
    14a8:      	adc	r10, r14
    14ab:      	mov	rdx, qword ptr [rax + 0x18]
    14af:      	mulx	r14, rbp, rdx
    14b4:      	adc	r11, rbp
    14b7:      	adc	rbx, r14
    14ba:      	movabs	rax, -0xffffffff
    14c4:      	mov	rdx, rcx
    14c7:      	mulx	r14, rbp, rax
    14cc:      	shl	rdx, 0x20
    14d0:      	shr	rcx, 0x20
    14d4:      	add	rsi, rdx
    14d7:      	adc	rdi, rcx
    14da:      	adc	r8, rbp
    14dd:      	adc	r9, r14
    14e0:      	adc	r10, 0x0
    14e4:      	adc	r11, 0x0
    14e8:      	adc	rbx, 0x0
    14ec:      	mov	ecx, 0x0
    14f1:      	adc	rcx, 0x0
    14f5:      	mov	rdx, rsi
    14f8:      	mulx	r14, rbp, rax
    14fd:      	shl	rdx, 0x20
    1501:      	shr	rsi, 0x20
    1505:      	add	rdi, rdx
    1508:      	adc	r8, rsi
    150b:      	adc	r9, rbp
    150e:      	adc	r10, r14
    1511:      	adc	r11, 0x0
    1515:      	adc	rbx, 0x0
    1519:      	adc	rcx, 0x0
    151d:      	mov	rdx, rdi
    1520:      	mulx	r14, rbp, rax
    1525:      	shl	rdx, 0x20
    1529:      	shr	rdi, 0x20
    152d:      	add	r8, rdx
    1530:      	adc	r9, rdi
    1533:      	adc	r10, rbp
    1536:      	adc	r11, r14
    1539:      	adc	rbx, 0x0
    153d:      	adc	rcx, 0x0
    1541:      	mov	rdx, r8
    1544:      	mulx	r14, rbp, rax
    1549:      	shl	rdx, 0x20
    154d:      	shr	r8, 0x20
    1551:      	add	r9, rdx
    1554:      	adc	r10, r8
    1557:      	adc	r11, rbp
    155a:      	adc	rbx, r14
    155d:      	adc	rcx, 0x0
    1561:      	mov	rsi, r9
    1564:      	mov	rdi, r10
    1567:      	mov	r8, r11
    156a:      	mov	rdx, rbx
    156d:      	mov	ebp, 0xffffffff
    1572:      	sub	rsi, -0x1
    1576:      	sbb	rdi, rbp
    1579:      	sbb	r8, 0x0
    157d:      	sbb	rdx, rax
    1580:      	sbb	rcx, 0x0
    1584:      	cmovae	r9, rsi
    1588:      	cmovae	r10, rdi
    158c:      	cmovae	r11, r8
    1590:      	cmovae	rbx, rdx
    1594:      	mov	qword ptr [rsp + 0x8], r9
    1599:      	mov	qword ptr [rsp + 0x10], r10
    159e:      	mov	qword ptr [rsp + 0x18], r11
    15a3:      	mov	qword ptr [rsp + 0x20], rbx
    15a8:      	jmp	0x15ba <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x15ba>
    15aa:      	lea	rdi, [rsp + 0x8]
    15af:      	lea	rsi, [rsp + 0x70]
    15b4:      	call	qword ptr [rip]         # 0x15ba <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x15ba>
    15ba:      	mov	rax, qword ptr [rsp + 0x8]
    15bf:      	mov	rcx, qword ptr [rsp + 0x10]
    15c4:      	mov	rdx, qword ptr [rsp + 0x18]
    15c9:      	mov	qword ptr [rsp + 0x190], rdx
    15d1:      	mov	rdx, qword ptr [rsp + 0x20]
    15d6:      	mov	qword ptr [rsp + 0x198], rdx
    15de:      	mov	qword ptr [rsp + 0x180], rax
    15e6:      	mov	qword ptr [rsp + 0x188], rcx
    15ee:      	mov	eax, dword ptr [r15]
    15f1:      	test	eax, eax
    15f3:      	jns	0x2a22 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2a22>
    15f9:      	not	eax
    15fb:      	test	eax, 0x820
    1600:      	jne	0x1828 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x1828>
    1606:      	lea	rax, [rsp + 0x70]
    160b:      	lea	rcx, [rsp + 0x180]
    1613:      	movabs	rsi, -0xffffffff
    161d:      	mov	rdx, qword ptr [rax]
    1620:      	mulx	r8, rdi, qword ptr [rcx]
    1625:      	mulx	r9, rbp, qword ptr [rcx + 0x8]
    162b:      	add	r8, rbp
    162e:      	mulx	r10, rbp, qword ptr [rcx + 0x10]
    1634:      	adc	r9, rbp
    1637:      	mulx	r11, rbp, qword ptr [rcx + 0x18]
    163d:      	adc	r10, rbp
    1640:      	adc	r11, 0x0
    1644:      	xor	ebx, ebx
    1646:      	mov	rdx, rdi
    1649:      	mulx	r14, rbp, rsi
    164e:      	shl	rdx, 0x20
    1652:      	shr	rdi, 0x20
    1656:      	add	r8, rdx
    1659:      	adc	r9, rdi
    165c:      	adc	r10, rbp
    165f:      	adc	r11, r14
    1662:      	adc	rbx, 0x0
    1666:      	mov	rdx, qword ptr [rax + 0x8]
    166a:      	xor	edi, edi
    166c:      	mulx	r14, rbp, qword ptr [rcx]
    1671:      	adcx	r8, rbp
    1677:      	adox	r9, r14
    167d:      	mulx	r14, rbp, qword ptr [rcx + 0x8]
    1683:      	adcx	r9, rbp
    1689:      	adox	r10, r14
    168f:      	mulx	r14, rbp, qword ptr [rcx + 0x10]
    1695:      	adcx	r10, rbp
    169b:      	adox	r11, r14
    16a1:      	mulx	r14, rbp, qword ptr [rcx + 0x18]
    16a7:      	adcx	r11, rbp
    16ad:      	adox	rbx, r14
    16b3:      	adcx	rbx, rdi
    16b9:      	adox	rdi, rdi
    16bf:      	adc	rdi, 0x0
    16c3:      	mov	rdx, r8
    16c6:      	mulx	r14, rbp, rsi
    16cb:      	shl	rdx, 0x20
    16cf:      	shr	r8, 0x20
    16d3:      	add	r9, rdx
    16d6:      	adc	r10, r8
    16d9:      	adc	r11, rbp
    16dc:      	adc	rbx, r14
    16df:      	adc	rdi, 0x0
    16e3:      	mov	rdx, qword ptr [rax + 0x10]
    16e7:      	xor	r8d, r8d
    16ea:      	mulx	r14, rbp, qword ptr [rcx]
    16ef:      	adcx	r9, rbp
    16f5:      	adox	r10, r14
    16fb:      	mulx	r14, rbp, qword ptr [rcx + 0x8]
    1701:      	adcx	r10, rbp
    1707:      	adox	r11, r14
    170d:      	mulx	r14, rbp, qword ptr [rcx + 0x10]
    1713:      	adcx	r11, rbp
    1719:      	adox	rbx, r14
    171f:      	mulx	r14, rbp, qword ptr [rcx + 0x18]
    1725:      	adcx	rbx, rbp
    172b:      	adox	rdi, r14
    1731:      	adcx	rdi, r8
    1737:      	adox	r8, r8
    173d:      	adc	r8, 0x0
    1741:      	mov	rdx, r9
    1744:      	mulx	r14, rbp, rsi
    1749:      	shl	rdx, 0x20
    174d:      	shr	r9, 0x20
    1751:      	add	r10, rdx
    1754:      	adc	r11, r9
    1757:      	adc	rbx, rbp
    175a:      	adc	rdi, r14
    175d:      	adc	r8, 0x0
    1761:      	mov	rdx, qword ptr [rax + 0x18]
    1765:      	xor	r9d, r9d
    1768:      	mulx	r14, rbp, qword ptr [rcx]
    176d:      	adcx	r10, rbp
    1773:      	adox	r11, r14
    1779:      	mulx	r14, rbp, qword ptr [rcx + 0x8]
    177f:      	adcx	r11, rbp
    1785:      	adox	rbx, r14
    178b:      	mulx	r14, rbp, qword ptr [rcx + 0x10]
    1791:      	adcx	rbx, rbp
    1797:      	adox	rdi, r14
    179d:      	mulx	r14, rbp, qword ptr [rcx + 0x18]
    17a3:      	adcx	rdi, rbp
    17a9:      	adox	r8, r14
    17af:      	adcx	r8, r9
    17b5:      	adox	r9, r9
    17bb:      	adc	r9, 0x0
    17bf:      	mov	rdx, r10
    17c2:      	mulx	r14, rbp, rsi
    17c7:      	shl	rdx, 0x20
    17cb:      	shr	r10, 0x20
    17cf:      	add	r11, rdx
    17d2:      	adc	rbx, r10
    17d5:      	adc	rdi, rbp
    17d8:      	adc	r8, r14
    17db:      	adc	r9, 0x0
    17df:      	mov	r10, r11
    17e2:      	mov	rbp, rbx
    17e5:      	mov	r14, rdi
    17e8:      	mov	rdx, r8
    17eb:      	mov	ecx, 0xffffffff
    17f0:      	sub	r10, -0x1
    17f4:      	sbb	rbp, rcx
    17f7:      	sbb	r14, 0x0
    17fb:      	sbb	rdx, rsi
    17fe:      	sbb	r9, 0x0
    1802:      	cmovae	r11, r10
    1806:      	cmovae	rbx, rbp
    180a:      	cmovae	rdi, r14
    180e:      	cmovae	r8, rdx
    1812:      	mov	qword ptr [rsp + 0x8], r11
    1817:      	mov	qword ptr [rsp + 0x10], rbx
    181c:      	mov	qword ptr [rsp + 0x18], rdi
    1821:      	mov	qword ptr [rsp + 0x20], r8
    1826:      	jmp	0x1840 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x1840>
    1828:      	lea	rdi, [rsp + 0x8]
    182d:      	lea	rsi, [rsp + 0x70]
    1832:      	lea	rdx, [rsp + 0x180]
    183a:      	call	qword ptr [rip]         # 0x1840 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x1840>
    1840:      	mov	rax, qword ptr [rsp + 0x8]
    1845:      	mov	rcx, qword ptr [rsp + 0x10]
    184a:      	mov	rdx, qword ptr [rsp + 0x18]
    184f:      	mov	qword ptr [rsp + 0x130], rdx
    1857:      	mov	rdx, qword ptr [rsp + 0x20]
    185c:      	mov	qword ptr [rsp + 0x138], rdx
    1864:      	mov	qword ptr [rsp + 0x120], rax
    186c:      	mov	qword ptr [rsp + 0x128], rcx
    1874:      	mov	eax, dword ptr [r15]
    1877:      	test	eax, eax
    1879:      	jns	0x2a2d <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2a2d>
    187f:      	not	eax
    1881:      	test	eax, 0x820
    1886:      	jne	0x1aa7 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x1aa7>
    188c:      	lea	rax, [rsp + 0xe0]
    1894:      	lea	rcx, [rsp + 0x180]
    189c:      	movabs	rsi, -0xffffffff
    18a6:      	mov	rdx, qword ptr [rax]
    18a9:      	mulx	r14, r12, qword ptr [rcx]
    18ae:      	mulx	rdi, r9, qword ptr [rcx + 0x8]
    18b4:      	add	r14, r9
    18b7:      	mulx	r8, r9, qword ptr [rcx + 0x10]
    18bd:      	adc	rdi, r9
    18c0:      	mulx	r11, r9, qword ptr [rcx + 0x18]
    18c6:      	adc	r8, r9
    18c9:      	adc	r11, 0x0
    18cd:      	xor	ebx, ebx
    18cf:      	mov	rdx, r12
    18d2:      	mulx	r10, r9, rsi
    18d7:      	shl	rdx, 0x20
    18db:      	shr	r12, 0x20
    18df:      	add	r14, rdx
    18e2:      	adc	rdi, r12
    18e5:      	adc	r8, r9
    18e8:      	adc	r11, r10
    18eb:      	adc	rbx, 0x0
    18ef:      	mov	rdx, qword ptr [rax + 0x8]
    18f3:      	xor	r12d, r12d
    18f6:      	mulx	r10, r9, qword ptr [rcx]
    18fb:      	adcx	r14, r9
    1901:      	adox	rdi, r10
    1907:      	mulx	r10, r9, qword ptr [rcx + 0x8]
    190d:      	adcx	rdi, r9
    1913:      	adox	r8, r10
    1919:      	mulx	r10, r9, qword ptr [rcx + 0x10]
    191f:      	adcx	r8, r9
    1925:      	adox	r11, r10
    192b:      	mulx	r10, r9, qword ptr [rcx + 0x18]
    1931:      	adcx	r11, r9
    1937:      	adox	rbx, r10
    193d:      	adcx	rbx, r12
    1943:      	adox	r12, r12
    1949:      	adc	r12, 0x0
    194d:      	mov	rdx, r14
    1950:      	mulx	r10, r9, rsi
    1955:      	shl	rdx, 0x20
    1959:      	shr	r14, 0x20
    195d:      	add	rdi, rdx
    1960:      	adc	r8, r14
    1963:      	adc	r11, r9
    1966:      	adc	rbx, r10
    1969:      	adc	r12, 0x0
    196d:      	mov	rdx, qword ptr [rax + 0x10]
    1971:      	xor	r14d, r14d
    1974:      	mulx	r10, r9, qword ptr [rcx]
    1979:      	adcx	rdi, r9
    197f:      	adox	r8, r10
    1985:      	mulx	r10, r9, qword ptr [rcx + 0x8]
    198b:      	adcx	r8, r9
    1991:      	adox	r11, r10
    1997:      	mulx	r10, r9, qword ptr [rcx + 0x10]
    199d:      	adcx	r11, r9
    19a3:      	adox	rbx, r10
    19a9:      	mulx	r10, r9, qword ptr [rcx + 0x18]
    19af:      	adcx	rbx, r9
    19b5:      	adox	r12, r10
    19bb:      	adcx	r12, r14
    19c1:      	adox	r14, r14
    19c7:      	adc	r14, 0x0
    19cb:      	mov	rdx, rdi
    19ce:      	mulx	r10, r9, rsi
    19d3:      	shl	rdx, 0x20
    19d7:      	shr	rdi, 0x20
    19db:      	add	r8, rdx
    19de:      	adc	r11, rdi
    19e1:      	adc	rbx, r9
    19e4:      	adc	r12, r10
    19e7:      	adc	r14, 0x0
    19eb:      	mov	rdx, qword ptr [rax + 0x18]
    19ef:      	xor	edi, edi
    19f1:      	mulx	r10, r9, qword ptr [rcx]
    19f6:      	adcx	r8, r9
    19fc:      	adox	r11, r10
    1a02:      	mulx	r10, r9, qword ptr [rcx + 0x8]
    1a08:      	adcx	r11, r9
    1a0e:      	adox	rbx, r10
    1a14:      	mulx	r10, r9, qword ptr [rcx + 0x10]
    1a1a:      	adcx	rbx, r9
    1a20:      	adox	r12, r10
    1a26:      	mulx	r10, r9, qword ptr [rcx + 0x18]
    1a2c:      	adcx	r12, r9
    1a32:      	adox	r14, r10
    1a38:      	adcx	r14, rdi
    1a3e:      	adox	rdi, rdi
    1a44:      	adc	rdi, 0x0
    1a48:      	mov	rdx, r8
    1a4b:      	mulx	r10, r9, rsi
    1a50:      	shl	rdx, 0x20
    1a54:      	shr	r8, 0x20
    1a58:      	add	r11, rdx
    1a5b:      	adc	rbx, r8
    1a5e:      	adc	r12, r9
    1a61:      	adc	r14, r10
    1a64:      	adc	rdi, 0x0
    1a68:      	mov	r8, r11
    1a6b:      	mov	r9, rbx
    1a6e:      	mov	r10, r12
    1a71:      	mov	rdx, r14
    1a74:      	mov	ecx, 0xffffffff
    1a79:      	sub	r8, -0x1
    1a7d:      	sbb	r9, rcx
    1a80:      	sbb	r10, 0x0
    1a84:      	sbb	rdx, rsi
    1a87:      	sbb	rdi, 0x0
    1a8b:      	cmovae	r11, r8
    1a8f:      	cmovae	rbx, r9
    1a93:      	cmovae	r12, r10
    1a97:      	cmovae	r14, rdx
    1a9b:      	mov	qword ptr [rsp + 0x28], r14
    1aa0:      	mov	qword ptr [rsp + 0x30], r11
    1aa5:      	jmp	0x1ae0 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x1ae0>
    1aa7:      	lea	rdi, [rsp + 0x8]
    1aac:      	lea	rsi, [rsp + 0xe0]
    1ab4:      	lea	rdx, [rsp + 0x180]
    1abc:      	call	qword ptr [rip]         # 0x1ac2 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x1ac2>
    1ac2:      	mov	rax, qword ptr [rsp + 0x8]
    1ac7:      	mov	qword ptr [rsp + 0x30], rax
    1acc:      	mov	rbx, qword ptr [rsp + 0x10]
    1ad1:      	mov	r12, qword ptr [rsp + 0x18]
    1ad6:      	mov	rax, qword ptr [rsp + 0x20]
    1adb:      	mov	qword ptr [rsp + 0x28], rax
    1ae0:      	mov	eax, dword ptr [r15]
    1ae3:      	test	eax, eax
    1ae5:      	jns	0x2a38 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2a38>
    1aeb:      	not	eax
    1aed:      	test	eax, 0x820
    1af2:      	jne	0x1c7e <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x1c7e>
    1af8:      	lea	rax, [rsp + 0xc0]
    1b00:      	mov	rdx, qword ptr [rax]
    1b03:      	mulx	r10, r9, qword ptr [rax + 0x8]
    1b09:      	mulx	r11, r14, qword ptr [rax + 0x10]
    1b0f:      	add	r10, r14
    1b12:      	mulx	r8, r14, qword ptr [rax + 0x18]
    1b18:      	adc	r11, r14
    1b1b:      	adc	r8, 0x0
    1b1f:      	mov	rdx, qword ptr [rax + 0x8]
    1b23:      	mulx	r15, r14, qword ptr [rax + 0x10]
    1b29:      	add	r11, r14
    1b2c:      	adc	r8, r15
    1b2f:      	mulx	rdi, r14, qword ptr [rax + 0x18]
    1b35:      	adc	rdi, 0x0
    1b39:      	add	r8, r14
    1b3c:      	adc	rdi, 0x0
    1b40:      	mov	rdx, qword ptr [rax + 0x10]
    1b44:      	mulx	r13, r14, qword ptr [rax + 0x18]
    1b4a:      	add	rdi, r14
    1b4d:      	adc	r13, 0x0
    1b51:      	xor	esi, esi
    1b53:      	add	r9, r9
    1b56:      	adc	r10, r10
    1b59:      	adc	r11, r11
    1b5c:      	adc	r8, r8
    1b5f:      	adc	rdi, rdi
    1b62:      	adc	r13, r13
    1b65:      	adc	rsi, 0x0
    1b69:      	mov	rdx, qword ptr [rax]
    1b6c:      	mulx	r15, rcx, rdx
    1b71:      	add	r9, r15
    1b74:      	mov	rdx, qword ptr [rax + 0x8]
    1b78:      	mulx	r15, r14, rdx
    1b7d:      	adc	r10, r14
    1b80:      	adc	r11, r15
    1b83:      	mov	rdx, qword ptr [rax + 0x10]
    1b87:      	mulx	r15, r14, rdx
    1b8c:      	adc	r8, r14
    1b8f:      	adc	rdi, r15
    1b92:      	mov	rdx, qword ptr [rax + 0x18]
    1b96:      	mulx	r15, r14, rdx
    1b9b:      	adc	r13, r14
    1b9e:      	adc	rsi, r15
    1ba1:      	movabs	rax, -0xffffffff
    1bab:      	mov	rdx, rcx
    1bae:      	mulx	r15, r14, rax
    1bb3:      	shl	rdx, 0x20
    1bb7:      	shr	rcx, 0x20
    1bbb:      	add	r9, rdx
    1bbe:      	adc	r10, rcx
    1bc1:      	adc	r11, r14
    1bc4:      	adc	r8, r15
    1bc7:      	adc	rdi, 0x0
    1bcb:      	adc	r13, 0x0
    1bcf:      	adc	rsi, 0x0
    1bd3:      	mov	ecx, 0x0
    1bd8:      	adc	rcx, 0x0
    1bdc:      	mov	rdx, r9
    1bdf:      	mulx	r15, r14, rax
    1be4:      	shl	rdx, 0x20
    1be8:      	shr	r9, 0x20
    1bec:      	add	r10, rdx
    1bef:      	adc	r11, r9
    1bf2:      	adc	r8, r14
    1bf5:      	adc	rdi, r15
    1bf8:      	adc	r13, 0x0
    1bfc:      	adc	rsi, 0x0
    1c00:      	adc	rcx, 0x0
    1c04:      	mov	rdx, r10
    1c07:      	mulx	r15, r14, rax
    1c0c:      	shl	rdx, 0x20
    1c10:      	shr	r10, 0x20
    1c14:      	add	r11, rdx
    1c17:      	adc	r8, r10
    1c1a:      	adc	rdi, r14
    1c1d:      	adc	r13, r15
    1c20:      	adc	rsi, 0x0
    1c24:      	adc	rcx, 0x0
    1c28:      	mov	rdx, r11
    1c2b:      	mulx	r15, r14, rax
    1c30:      	shl	rdx, 0x20
    1c34:      	shr	r11, 0x20
    1c38:      	add	r8, rdx
    1c3b:      	adc	rdi, r11
    1c3e:      	adc	r13, r14
    1c41:      	adc	rsi, r15
    1c44:      	adc	rcx, 0x0
    1c48:      	mov	r9, r8
    1c4b:      	mov	r10, rdi
    1c4e:      	mov	r11, r13
    1c51:      	mov	rdx, rsi
    1c54:      	mov	r14d, 0xffffffff
    1c5a:      	sub	r9, -0x1
    1c5e:      	sbb	r10, r14
    1c61:      	sbb	r11, 0x0
    1c65:      	sbb	rdx, rax
    1c68:      	sbb	rcx, 0x0
    1c6c:      	cmovae	r8, r9
    1c70:      	cmovae	rdi, r10
    1c74:      	cmovae	r13, r11
    1c78:      	cmovae	rsi, rdx
    1c7c:      	jmp	0x1ca5 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x1ca5>
    1c7e:      	lea	rdi, [rsp + 0x8]
    1c83:      	lea	rsi, [rsp + 0xc0]
    1c8b:      	call	qword ptr [rip]         # 0x1c91 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x1c91>
    1c91:      	mov	r8, qword ptr [rsp + 0x8]
    1c96:      	mov	rdi, qword ptr [rsp + 0x10]
    1c9b:      	mov	r13, qword ptr [rsp + 0x18]
    1ca0:      	mov	rsi, qword ptr [rsp + 0x20]
    1ca5:      	sub	r8, qword ptr [rsp + 0x120]
    1cad:      	sbb	rdi, qword ptr [rsp + 0x128]
    1cb5:      	sbb	r13, qword ptr [rsp + 0x130]
    1cbd:      	setb	al
    1cc0:      	movzx	eax, al
    1cc3:      	mov	r9, rax
    1cc6:      	neg	r9
    1cc9:      	sub	rsi, qword ptr [rsp + 0x138]
    1cd1:      	setb	cl
    1cd4:      	sete	dl
    1cd7:      	and	al, dl
    1cd9:      	or	al, cl
    1cdb:      	movzx	edx, al
    1cde:      	mov	rcx, r8
    1ce1:      	sub	rcx, rdx
    1ce4:      	neg	rdx
    1ce7:      	mov	eax, edx
    1ce9:      	movabs	r10, -0xffffffff
    1cf3:      	and	rdx, r10
    1cf6:      	cmp	rcx, r8
    1cf9:      	adc	rax, rdi
    1cfc:      	mov	qword ptr [rsp + 0x60], rax
    1d01:      	adc	r13, 0x0
    1d05:      	mov	qword ptr [rsp + 0x38], r13
    1d0a:      	lea	rdx, [rsi + rdx]
    1d0e:      	adc	rdx, r9
    1d11:      	mov	r13, rbx
    1d14:      	mov	r9, rbx
    1d17:      	mov	rbx, qword ptr [rsp + 0x30]
    1d1c:      	shld	r9, rbx, 0x1
    1d21:      	mov	r8, r12
    1d24:      	shld	r8, r13, 0x1
    1d29:      	mov	rbp, qword ptr [rsp + 0x28]
    1d2e:      	mov	rdi, rbp
    1d31:      	mov	qword ptr [rsp + 0x28], rbp
    1d36:      	shld	rdi, r12, 0x1
    1d3b:      	lea	r15, [rbx + rbx]
    1d3f:      	lea	rsi, [r10 - 0x1]
    1d43:      	xor	r14d, r14d
    1d46:      	mov	r10, r9
    1d49:      	shr	r10, 0x20
    1d4d:      	sete	r14b
    1d51:      	mov	r11d, 0xffffffff
    1d57:      	add	r11, rdi
    1d5a:      	cmp	rdi, rsi
    1d5d:      	seta	sil
    1d61:      	mov	r10, r8
    1d64:      	sub	r10, r14
    1d67:      	sbb	r11, 0x0
    1d6b:      	setae	r14b
    1d6f:      	and	r14b, sil
    1d72:      	shr	rbp, 0x3f
    1d76:      	movzx	esi, r14b
    1d7a:      	or	rsi, rbp
    1d7d:      	mov	r14, rsi
    1d80:      	neg	r14
    1d83:      	dec	rsi
    1d86:      	and	r15, rsi
    1d89:      	lea	rbp, [2*rbx + 0x1]
    1d91:      	and	rbp, r14
    1d94:      	or	rbp, r15
    1d97:      	movabs	rax, -0xffffffff
    1da1:      	lea	r15, [r9 + rax]
    1da5:      	dec	r15
    1da8:      	and	r9, rsi
    1dab:      	and	r15, r14
    1dae:      	or	r15, r9
    1db1:      	and	r8, rsi
    1db4:      	and	r10, r14
    1db7:      	or	r10, r8
    1dba:      	and	rsi, rdi
    1dbd:      	and	r14, r11
    1dc0:      	or	r14, rsi
    1dc3:      	sub	rcx, rbp
    1dc6:      	mov	rbp, qword ptr [rsp + 0x38]
    1dcb:      	mov	rax, qword ptr [rsp + 0x60]
    1dd0:      	sbb	rax, r15
    1dd3:      	sbb	rbp, r10
    1dd6:      	setb	sil
    1dda:      	movzx	edi, sil
    1dde:      	mov	rsi, rdi
    1de1:      	neg	rsi
    1de4:      	cmp	rdx, r14
    1de7:      	setb	r8b
    1deb:      	sete	r9b
    1def:      	and	dil, r9b
    1df2:      	or	dil, r8b
    1df5:      	movzx	edi, dil
    1df9:      	mov	r8, rcx
    1dfc:      	sub	r8, rdi
    1dff:      	neg	rdi
    1e02:      	mov	r15, rdi
    1e05:      	movabs	r9, -0xffffffff
    1e0f:      	and	r15, r9
    1e12:      	sub	r15, r14
    1e15:      	mov	edi, edi
    1e17:      	add	r15, rdx
    1e1a:      	cmp	r8, rcx
    1e1d:      	adc	rdi, rax
    1e20:      	adc	rbp, 0x0
    1e24:      	adc	r15, rsi
    1e27:      	mov	qword ptr [rsp + 0x38], r8
    1e2c:      	sub	rbx, r8
    1e2f:      	mov	qword ptr [rsp + 0x30], rdi
    1e34:      	sbb	r13, rdi
    1e37:      	sbb	r12, rbp
    1e3a:      	setb	al
    1e3d:      	movzx	ecx, al
    1e40:      	mov	rax, rcx
    1e43:      	neg	rax
    1e46:      	mov	rdi, qword ptr [rsp + 0x28]
    1e4b:      	cmp	rdi, r15
    1e4e:      	setb	dl
    1e51:      	sete	sil
    1e55:      	and	cl, sil
    1e58:      	or	cl, dl
    1e5a:      	movzx	ecx, cl
    1e5d:      	mov	rdx, rbx
    1e60:      	sub	rdx, rcx
    1e63:      	neg	rcx
    1e66:      	mov	rsi, rcx
    1e69:      	and	rsi, r9
    1e6c:      	add	rsi, rdi
    1e6f:      	sub	rsi, r15
    1e72:      	cmp	rdx, rbx
    1e75:      	mov	ecx, ecx
    1e77:      	adc	rcx, r13
    1e7a:      	adc	r12, 0x0
    1e7e:      	adc	rsi, rax
    1e81:      	mov	qword ptr [rsp + 0x40], rdx
    1e86:      	mov	qword ptr [rsp + 0x48], rcx
    1e8b:      	mov	qword ptr [rsp + 0x50], r12
    1e90:      	mov	qword ptr [rsp + 0x58], rsi
    1e95:      	mov	rax, qword ptr [rip]    # 0x1e9c <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x1e9c>
    1e9c:      	mov	eax, dword ptr [rax]
    1e9e:      	test	eax, eax
    1ea0:      	jns	0x2a43 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2a43>
    1ea6:      	not	eax
    1ea8:      	test	eax, 0x820
    1ead:      	jne	0x20d3 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x20d3>
    1eb3:      	lea	rax, [rsp + 0xc0]
    1ebb:      	lea	rcx, [rsp + 0x40]
    1ec0:      	movabs	rsi, -0xffffffff
    1eca:      	mov	rdx, qword ptr [rax]
    1ecd:      	mulx	r14, rbx, qword ptr [rcx]
    1ed2:      	mulx	rdi, r9, qword ptr [rcx + 0x8]
    1ed8:      	add	r14, r9
    1edb:      	mulx	r8, r9, qword ptr [rcx + 0x10]
    1ee1:      	adc	rdi, r9
    1ee4:      	mulx	r12, r9, qword ptr [rcx + 0x18]
    1eea:      	adc	r8, r9
    1eed:      	adc	r12, 0x0
    1ef1:      	xor	r11d, r11d
    1ef4:      	mov	rdx, rbx
    1ef7:      	mulx	r10, r9, rsi
    1efc:      	shl	rdx, 0x20
    1f00:      	shr	rbx, 0x20
    1f04:      	add	r14, rdx
    1f07:      	adc	rdi, rbx
    1f0a:      	adc	r8, r9
    1f0d:      	adc	r12, r10
    1f10:      	adc	r11, 0x0
    1f14:      	mov	rdx, qword ptr [rax + 0x8]
    1f18:      	xor	ebx, ebx
    1f1a:      	mulx	r10, r9, qword ptr [rcx]
    1f1f:      	adcx	r14, r9
    1f25:      	adox	rdi, r10
    1f2b:      	mulx	r10, r9, qword ptr [rcx + 0x8]
    1f31:      	adcx	rdi, r9
    1f37:      	adox	r8, r10
    1f3d:      	mulx	r10, r9, qword ptr [rcx + 0x10]
    1f43:      	adcx	r8, r9
    1f49:      	adox	r12, r10
    1f4f:      	mulx	r10, r9, qword ptr [rcx + 0x18]
    1f55:      	adcx	r12, r9
    1f5b:      	adox	r11, r10
    1f61:      	adcx	r11, rbx
    1f67:      	adox	rbx, rbx
    1f6d:      	adc	rbx, 0x0
    1f71:      	mov	rdx, r14
    1f74:      	mulx	r10, r9, rsi
    1f79:      	shl	rdx, 0x20
    1f7d:      	shr	r14, 0x20
    1f81:      	add	rdi, rdx
    1f84:      	adc	r8, r14
    1f87:      	adc	r12, r9
    1f8a:      	adc	r11, r10
    1f8d:      	adc	rbx, 0x0
    1f91:      	mov	rdx, qword ptr [rax + 0x10]
    1f95:      	xor	r14d, r14d
    1f98:      	mulx	r10, r9, qword ptr [rcx]
    1f9d:      	adcx	rdi, r9
    1fa3:      	adox	r8, r10
    1fa9:      	mulx	r10, r9, qword ptr [rcx + 0x8]
    1faf:      	adcx	r8, r9
    1fb5:      	adox	r12, r10
    1fbb:      	mulx	r10, r9, qword ptr [rcx + 0x10]
    1fc1:      	adcx	r12, r9
    1fc7:      	adox	r11, r10
    1fcd:      	mulx	r10, r9, qword ptr [rcx + 0x18]
    1fd3:      	adcx	r11, r9
    1fd9:      	adox	rbx, r10
    1fdf:      	adcx	rbx, r14
    1fe5:      	adox	r14, r14
    1feb:      	adc	r14, 0x0
    1fef:      	mov	rdx, rdi
    1ff2:      	mulx	r10, r9, rsi
    1ff7:      	shl	rdx, 0x20
    1ffb:      	shr	rdi, 0x20
    1fff:      	add	r8, rdx
    2002:      	adc	r12, rdi
    2005:      	adc	r11, r9
    2008:      	adc	rbx, r10
    200b:      	adc	r14, 0x0
    200f:      	mov	rdx, qword ptr [rax + 0x18]
    2013:      	xor	edi, edi
    2015:      	mulx	r10, r9, qword ptr [rcx]
    201a:      	adcx	r8, r9
    2020:      	adox	r12, r10
    2026:      	mulx	r10, r9, qword ptr [rcx + 0x8]
    202c:      	adcx	r12, r9
    2032:      	adox	r11, r10
    2038:      	mulx	r10, r9, qword ptr [rcx + 0x10]
    203e:      	adcx	r11, r9
    2044:      	adox	rbx, r10
    204a:      	mulx	r10, r9, qword ptr [rcx + 0x18]
    2050:      	adcx	rbx, r9
    2056:      	adox	r14, r10
    205c:      	adcx	r14, rdi
    2062:      	adox	rdi, rdi
    2068:      	adc	rdi, 0x0
    206c:      	mov	rdx, r8
    206f:      	mulx	r10, r9, rsi
    2074:      	shl	rdx, 0x20
    2078:      	shr	r8, 0x20
    207c:      	add	r12, rdx
    207f:      	adc	r11, r8
    2082:      	adc	rbx, r9
    2085:      	adc	r14, r10
    2088:      	adc	rdi, 0x0
    208c:      	mov	r8, r12
    208f:      	mov	r9, r11
    2092:      	mov	r10, rbx
    2095:      	mov	rdx, r14
    2098:      	mov	ecx, 0xffffffff
    209d:      	sub	r8, -0x1
    20a1:      	sbb	r9, rcx
    20a4:      	sbb	r10, 0x0
    20a8:      	sbb	rdx, rsi
    20ab:      	sbb	rdi, 0x0
    20af:      	cmovae	r12, r8
    20b3:      	cmovae	r11, r9
    20b7:      	cmovae	rbx, r10
    20bb:      	cmovae	r14, rdx
    20bf:      	mov	qword ptr [rsp + 0x90], rbx
    20c7:      	mov	qword ptr [rsp + 0x60], r12
    20cc:      	mov	qword ptr [rsp + 0x28], r11
    20d1:      	jmp	0x2111 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2111>
    20d3:      	lea	rdi, [rsp + 0x8]
    20d8:      	lea	rsi, [rsp + 0xc0]
    20e0:      	lea	rdx, [rsp + 0x40]
    20e5:      	call	qword ptr [rip]         # 0x20eb <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x20eb>
    20eb:      	mov	rax, qword ptr [rsp + 0x8]
    20f0:      	mov	qword ptr [rsp + 0x60], rax
    20f5:      	mov	rax, qword ptr [rsp + 0x10]
    20fa:      	mov	qword ptr [rsp + 0x28], rax
    20ff:      	mov	rax, qword ptr [rsp + 0x18]
    2104:      	mov	qword ptr [rsp + 0x90], rax
    210c:      	mov	r14, qword ptr [rsp + 0x20]
    2111:      	mov	rax, qword ptr [rip]    # 0x2118 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2118>
    2118:      	mov	eax, dword ptr [rax]
    211a:      	test	eax, eax
    211c:      	jns	0x2a4e <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2a4e>
    2122:      	not	eax
    2124:      	test	eax, 0x820
    2129:      	jne	0x2368 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2368>
    212f:      	lea	rcx, [rsp + 0x120]
    2137:      	movabs	rsi, -0xffffffff
    2141:      	mov	rbx, rbp
    2144:      	lea	rbp, [rsp + 0x100]
    214c:      	mov	rdx, qword ptr [rbp]
    2150:      	mulx	r11, r12, qword ptr [rcx]
    2155:      	mulx	rdi, r9, qword ptr [rcx + 0x8]
    215b:      	add	r11, r9
    215e:      	mulx	r8, r9, qword ptr [rcx + 0x10]
    2164:      	adc	rdi, r9
    2167:      	mulx	rax, r9, qword ptr [rcx + 0x18]
    216d:      	adc	r8, r9
    2170:      	adc	rax, 0x0
    2174:      	xor	r13d, r13d
    2177:      	mov	rdx, r12
    217a:      	mulx	r10, r9, rsi
    217f:      	shl	rdx, 0x20
    2183:      	shr	r12, 0x20
    2187:      	add	r11, rdx
    218a:      	adc	rdi, r12
    218d:      	adc	r8, r9
    2190:      	adc	rax, r10
    2193:      	adc	r13, 0x0
    2197:      	mov	rdx, qword ptr [rbp + 0x8]
    219b:      	xor	r12d, r12d
    219e:      	mulx	r10, r9, qword ptr [rcx]
    21a3:      	adcx	r11, r9
    21a9:      	adox	rdi, r10
    21af:      	mulx	r10, r9, qword ptr [rcx + 0x8]
    21b5:      	adcx	rdi, r9
    21bb:      	adox	r8, r10
    21c1:      	mulx	r10, r9, qword ptr [rcx + 0x10]
    21c7:      	adcx	r8, r9
    21cd:      	adox	rax, r10
    21d3:      	mulx	r10, r9, qword ptr [rcx + 0x18]
    21d9:      	adcx	rax, r9
    21df:      	adox	r13, r10
    21e5:      	adcx	r13, r12
    21eb:      	adox	r12, r12
    21f1:      	adc	r12, 0x0
    21f5:      	mov	rdx, r11
    21f8:      	mulx	r10, r9, rsi
    21fd:      	shl	rdx, 0x20
    2201:      	shr	r11, 0x20
    2205:      	add	rdi, rdx
    2208:      	adc	r8, r11
    220b:      	adc	rax, r9
    220e:      	adc	r13, r10
    2211:      	adc	r12, 0x0
    2215:      	mov	rdx, qword ptr [rbp + 0x10]
    2219:      	xor	r11d, r11d
    221c:      	mulx	r10, r9, qword ptr [rcx]
    2221:      	adcx	rdi, r9
    2227:      	adox	r8, r10
    222d:      	mulx	r10, r9, qword ptr [rcx + 0x8]
    2233:      	adcx	r8, r9
    2239:      	adox	rax, r10
    223f:      	mulx	r10, r9, qword ptr [rcx + 0x10]
    2245:      	adcx	rax, r9
    224b:      	adox	r13, r10
    2251:      	mulx	r10, r9, qword ptr [rcx + 0x18]
    2257:      	adcx	r13, r9
    225d:      	adox	r12, r10
    2263:      	adcx	r12, r11
    2269:      	adox	r11, r11
    226f:      	adc	r11, 0x0
    2273:      	mov	rdx, rdi
    2276:      	mulx	r10, r9, rsi
    227b:      	shl	rdx, 0x20
    227f:      	shr	rdi, 0x20
    2283:      	add	r8, rdx
    2286:      	adc	rax, rdi
    2289:      	adc	r13, r9
    228c:      	adc	r12, r10
    228f:      	adc	r11, 0x0
    2293:      	mov	rdx, qword ptr [rbp + 0x18]
    2297:      	xor	edi, edi
    2299:      	mulx	r10, r9, qword ptr [rcx]
    229e:      	adcx	r8, r9
    22a4:      	adox	rax, r10
    22aa:      	mulx	r10, r9, qword ptr [rcx + 0x8]
    22b0:      	adcx	rax, r9
    22b6:      	adox	r13, r10
    22bc:      	mulx	r10, r9, qword ptr [rcx + 0x10]
    22c2:      	adcx	r13, r9
    22c8:      	adox	r12, r10
    22ce:      	mulx	r10, r9, qword ptr [rcx + 0x18]
    22d4:      	adcx	r12, r9
    22da:      	adox	r11, r10
    22e0:      	adcx	r11, rdi
    22e6:      	adox	rdi, rdi
    22ec:      	adc	rdi, 0x0
    22f0:      	mov	rdx, r8
    22f3:      	mulx	r10, r9, rsi
    22f8:      	shl	rdx, 0x20
    22fc:      	shr	r8, 0x20
    2300:      	add	rax, rdx
    2303:      	adc	r13, r8
    2306:      	adc	r12, r9
    2309:      	adc	r11, r10
    230c:      	adc	rdi, 0x0
    2310:      	mov	r8, rax
    2313:      	mov	r9, r13
    2316:      	mov	r10, r12
    2319:      	mov	rdx, r11
    231c:      	mov	ecx, 0xffffffff
    2321:      	sub	r8, -0x1
    2325:      	sbb	r9, rcx
    2328:      	sbb	r10, 0x0
    232c:      	sbb	rdx, rsi
    232f:      	sbb	rdi, 0x0
    2333:      	cmovae	rax, r8
    2337:      	cmovae	r13, r9
    233b:      	cmovae	r12, r10
    233f:      	cmovae	r11, rdx
    2343:      	mov	rbp, rbx
    2346:      	mov	qword ptr [rsp + 0x98], rax
    234e:      	mov	qword ptr [rsp + 0xa0], r13
    2356:      	mov	qword ptr [rsp + 0xa8], r12
    235e:      	mov	qword ptr [rsp + 0xb0], r11
    2366:      	jmp	0x23b7 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x23b7>
    2368:      	lea	rdi, [rsp + 0x8]
    236d:      	lea	rsi, [rsp + 0x100]
    2375:      	lea	rdx, [rsp + 0x120]
    237d:      	call	qword ptr [rip]         # 0x2383 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2383>
    2383:      	mov	rax, qword ptr [rsp + 0x8]
    2388:      	mov	qword ptr [rsp + 0x98], rax
    2390:      	mov	rax, qword ptr [rsp + 0x10]
    2395:      	mov	qword ptr [rsp + 0xa0], rax
    239d:      	mov	rax, qword ptr [rsp + 0x18]
    23a2:      	mov	qword ptr [rsp + 0xa8], rax
    23aa:      	mov	rax, qword ptr [rsp + 0x20]
    23af:      	mov	qword ptr [rsp + 0xb0], rax
    23b7:      	mov	rax, qword ptr [rip]    # 0x23be <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x23be>
    23be:      	mov	eax, dword ptr [rax]
    23c0:      	test	eax, eax
    23c2:      	jns	0x2a59 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2a59>
    23c8:      	not	eax
    23ca:      	test	eax, 0x820
    23cf:      	jne	0x2611 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2611>
    23d5:      	movabs	rax, -0xffffffff
    23df:      	mov	r13, qword ptr [rsp + 0x68]
    23e4:      	mov	qword ptr [rsp + 0x1a8], r15
    23ec:      	mov	rbx, rbp
    23ef:      	mov	rbp, qword ptr [rsp + 0xb8]
    23f7:      	mov	rdx, qword ptr [r13]
    23fb:      	mulx	rsi, rcx, qword ptr [rbp]
    2401:      	mulx	rdi, r11, qword ptr [rbp + 0x8]
    2407:      	add	rsi, r11
    240a:      	mulx	r8, r11, qword ptr [rbp + 0x10]
    2410:      	adc	rdi, r11
    2413:      	mulx	r9, r11, qword ptr [rbp + 0x18]
    2419:      	adc	r8, r11
    241c:      	adc	r9, 0x0
    2420:      	xor	r10d, r10d
    2423:      	mov	rdx, rcx
    2426:      	mulx	r12, r11, rax
    242b:      	shl	rdx, 0x20
    242f:      	shr	rcx, 0x20
    2433:      	add	rsi, rdx
    2436:      	adc	rdi, rcx
    2439:      	adc	r8, r11
    243c:      	adc	r9, r12
    243f:      	adc	r10, 0x0
    2443:      	mov	rdx, qword ptr [r13 + 0x8]
    2447:      	xor	ecx, ecx
    2449:      	mulx	r12, r11, qword ptr [rbp]
    244f:      	adcx	rsi, r11
    2455:      	adox	rdi, r12
    245b:      	mulx	r12, r11, qword ptr [rbp + 0x8]
    2461:      	adcx	rdi, r11
    2467:      	adox	r8, r12
    246d:      	mulx	r12, r11, qword ptr [rbp + 0x10]
    2473:      	adcx	r8, r11
    2479:      	adox	r9, r12
    247f:      	mulx	r12, r11, qword ptr [rbp + 0x18]
    2485:      	adcx	r9, r11
    248b:      	adox	r10, r12
    2491:      	adcx	r10, rcx
    2497:      	adox	rcx, rcx
    249d:      	adc	rcx, 0x0
    24a1:      	mov	rdx, rsi
    24a4:      	mulx	r12, r11, rax
    24a9:      	shl	rdx, 0x20
    24ad:      	shr	rsi, 0x20
    24b1:      	add	rdi, rdx
    24b4:      	adc	r8, rsi
    24b7:      	adc	r9, r11
    24ba:      	adc	r10, r12
    24bd:      	adc	rcx, 0x0
    24c1:      	mov	rdx, qword ptr [r13 + 0x10]
    24c5:      	xor	esi, esi
    24c7:      	mulx	r12, r11, qword ptr [rbp]
    24cd:      	adcx	rdi, r11
    24d3:      	adox	r8, r12
    24d9:      	mulx	r12, r11, qword ptr [rbp + 0x8]
    24df:      	adcx	r8, r11
    24e5:      	adox	r9, r12
    24eb:      	mulx	r12, r11, qword ptr [rbp + 0x10]
    24f1:      	adcx	r9, r11
    24f7:      	adox	r10, r12
    24fd:      	mulx	r12, r11, qword ptr [rbp + 0x18]
    2503:      	adcx	r10, r11
    2509:      	adox	rcx, r12
    250f:      	adcx	rcx, rsi
    2515:      	adox	rsi, rsi
    251b:      	adc	rsi, 0x0
    251f:      	mov	rdx, rdi
    2522:      	mulx	r12, r11, rax
    2527:      	shl	rdx, 0x20
    252b:      	shr	rdi, 0x20
    252f:      	add	r8, rdx
    2532:      	adc	r9, rdi
    2535:      	adc	r10, r11
    2538:      	adc	rcx, r12
    253b:      	adc	rsi, 0x0
    253f:      	mov	rdx, qword ptr [r13 + 0x18]
    2543:      	xor	edi, edi
    2545:      	mulx	r12, r11, qword ptr [rbp]
    254b:      	adcx	r8, r11
    2551:      	adox	r9, r12
    2557:      	mulx	r12, r11, qword ptr [rbp + 0x8]
    255d:      	adcx	r9, r11
    2563:      	adox	r10, r12
    2569:      	mulx	r12, r11, qword ptr [rbp + 0x10]
    256f:      	adcx	r10, r11
    2575:      	adox	rcx, r12
    257b:      	mulx	r12, r11, qword ptr [rbp + 0x18]
    2581:      	adcx	rcx, r11
    2587:      	adox	rsi, r12
    258d:      	adcx	rsi, rdi
    2593:      	adox	rdi, rdi
    2599:      	adc	rdi, 0x0
    259d:      	mov	rdx, r8
    25a0:      	mulx	r12, r11, rax
    25a5:      	shl	rdx, 0x20
    25a9:      	shr	r8, 0x20
    25ad:      	add	r9, rdx
    25b0:      	adc	r10, r8
    25b3:      	adc	rcx, r11
    25b6:      	adc	rsi, r12
    25b9:      	adc	rdi, 0x0
    25bd:      	mov	r8, r9
    25c0:      	mov	r11, r10
    25c3:      	mov	r12, rcx
    25c6:      	mov	rdx, rsi
    25c9:      	mov	ebp, 0xffffffff
    25ce:      	sub	r8, -0x1
    25d2:      	sbb	r11, rbp
    25d5:      	sbb	r12, 0x0
    25d9:      	sbb	rdx, rax
    25dc:      	sbb	rdi, 0x0
    25e0:      	cmovae	r9, r8
    25e4:      	cmovae	r10, r11
    25e8:      	cmovae	rcx, r12
    25ec:      	cmovae	rsi, rdx
    25f0:      	mov	rbp, rbx
    25f3:      	mov	r15, qword ptr [rsp + 0x1a8]
    25fb:      	mov	qword ptr [rsp + 0x8], r9
    2600:      	mov	qword ptr [rsp + 0x10], r10
    2605:      	mov	qword ptr [rsp + 0x18], rcx
    260a:      	mov	qword ptr [rsp + 0x20], rsi
    260f:      	jmp	0x2629 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2629>
    2611:      	lea	rdi, [rsp + 0x8]
    2616:      	mov	rsi, qword ptr [rsp + 0x68]
    261b:      	mov	rdx, qword ptr [rsp + 0xb8]
    2623:      	call	qword ptr [rip]         # 0x2629 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2629>
    2629:      	mov	rax, qword ptr [rsp + 0x8]
    262e:      	mov	rcx, qword ptr [rsp + 0x10]
    2633:      	mov	rdx, qword ptr [rsp + 0x18]
    2638:      	mov	qword ptr [rsp + 0x50], rdx
    263d:      	mov	rdx, qword ptr [rsp + 0x20]
    2642:      	mov	qword ptr [rsp + 0x58], rdx
    2647:      	mov	qword ptr [rsp + 0x40], rax
    264c:      	mov	qword ptr [rsp + 0x48], rcx
    2651:      	mov	rax, qword ptr [rip]    # 0x2658 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2658>
    2658:      	mov	eax, dword ptr [rax]
    265a:      	test	eax, eax
    265c:      	jns	0x2a64 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2a64>
    2662:      	not	eax
    2664:      	test	eax, 0x820
    2669:      	jne	0x289b <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x289b>
    266f:      	lea	rbx, [rsp + 0x70]
    2674:      	lea	rcx, [rsp + 0x40]
    2679:      	movabs	rsi, -0xffffffff
    2683:      	mov	rdx, qword ptr [rbx]
    2686:      	mulx	r8, rdi, qword ptr [rcx]
    268b:      	mulx	r9, rax, qword ptr [rcx + 0x8]
    2691:      	add	r8, rax
    2694:      	mulx	r10, rax, qword ptr [rcx + 0x10]
    269a:      	adc	r9, rax
    269d:      	mulx	r11, rax, qword ptr [rcx + 0x18]
    26a3:      	adc	r10, rax
    26a6:      	adc	r11, 0x0
    26aa:      	xor	r12d, r12d
    26ad:      	mov	rdx, rdi
    26b0:      	mulx	r13, rax, rsi
    26b5:      	shl	rdx, 0x20
    26b9:      	shr	rdi, 0x20
    26bd:      	add	r8, rdx
    26c0:      	adc	r9, rdi
    26c3:      	adc	r10, rax
    26c6:      	adc	r11, r13
    26c9:      	adc	r12, 0x0
    26cd:      	mov	rdx, qword ptr [rbx + 0x8]
    26d1:      	xor	edi, edi
    26d3:      	mulx	r13, rax, qword ptr [rcx]
    26d8:      	adcx	r8, rax
    26de:      	adox	r9, r13
    26e4:      	mulx	r13, rax, qword ptr [rcx + 0x8]
    26ea:      	adcx	r9, rax
    26f0:      	adox	r10, r13
    26f6:      	mulx	r13, rax, qword ptr [rcx + 0x10]
    26fc:      	adcx	r10, rax
    2702:      	adox	r11, r13
    2708:      	mulx	r13, rax, qword ptr [rcx + 0x18]
    270e:      	adcx	r11, rax
    2714:      	adox	r12, r13
    271a:      	adcx	r12, rdi
    2720:      	adox	rdi, rdi
    2726:      	adc	rdi, 0x0
    272a:      	mov	rdx, r8
    272d:      	mulx	r13, rax, rsi
    2732:      	shl	rdx, 0x20
    2736:      	shr	r8, 0x20
    273a:      	add	r9, rdx
    273d:      	adc	r10, r8
    2740:      	adc	r11, rax
    2743:      	adc	r12, r13
    2746:      	adc	rdi, 0x0
    274a:      	mov	rdx, qword ptr [rbx + 0x10]
    274e:      	xor	r8d, r8d
    2751:      	mulx	r13, rax, qword ptr [rcx]
    2756:      	adcx	r9, rax
    275c:      	adox	r10, r13
    2762:      	mulx	r13, rax, qword ptr [rcx + 0x8]
    2768:      	adcx	r10, rax
    276e:      	adox	r11, r13
    2774:      	mulx	r13, rax, qword ptr [rcx + 0x10]
    277a:      	adcx	r11, rax
    2780:      	adox	r12, r13
    2786:      	mulx	r13, rax, qword ptr [rcx + 0x18]
    278c:      	adcx	r12, rax
    2792:      	adox	rdi, r13
    2798:      	adcx	rdi, r8
    279e:      	adox	r8, r8
    27a4:      	adc	r8, 0x0
    27a8:      	mov	rdx, r9
    27ab:      	mulx	r13, rax, rsi
    27b0:      	shl	rdx, 0x20
    27b4:      	shr	r9, 0x20
    27b8:      	add	r10, rdx
    27bb:      	adc	r11, r9
    27be:      	adc	r12, rax
    27c1:      	adc	rdi, r13
    27c4:      	adc	r8, 0x0
    27c8:      	mov	rdx, qword ptr [rbx + 0x18]
    27cc:      	xor	r9d, r9d
    27cf:      	mulx	r13, rax, qword ptr [rcx]
    27d4:      	adcx	r10, rax
    27da:      	adox	r11, r13
    27e0:      	mulx	r13, rax, qword ptr [rcx + 0x8]
    27e6:      	adcx	r11, rax
    27ec:      	adox	r12, r13
    27f2:      	mulx	r13, rax, qword ptr [rcx + 0x10]
    27f8:      	adcx	r12, rax
    27fe:      	adox	rdi, r13
    2804:      	mulx	r13, rax, qword ptr [rcx + 0x18]
    280a:      	adcx	rdi, rax
    2810:      	adox	r8, r13
    2816:      	adcx	r8, r9
    281c:      	adox	r9, r9
    2822:      	adc	r9, 0x0
    2826:      	mov	rdx, r10
    2829:      	mulx	r13, rax, rsi
    282e:      	shl	rdx, 0x20
    2832:      	shr	r10, 0x20
    2836:      	add	r11, rdx
    2839:      	adc	r12, r10
    283c:      	adc	rdi, rax
    283f:      	adc	r8, r13
    2842:      	adc	r9, 0x0
    2846:      	mov	r10, r11
    2849:      	mov	rax, r12
    284c:      	mov	r13, rdi
    284f:      	mov	rdx, r8
    2852:      	mov	ecx, 0xffffffff
    2857:      	sub	r10, -0x1
    285b:      	sbb	rax, rcx
    285e:      	sbb	r13, 0x0
    2862:      	sbb	rdx, rsi
    2865:      	sbb	r9, 0x0
    2869:      	cmovae	r11, r10
    286d:      	cmovae	r12, rax
    2871:      	cmovae	rdi, r13
    2875:      	cmovae	r8, rdx
    2879:      	mov	qword ptr [rsp + 0x1b8], r11
    2881:      	mov	qword ptr [rsp + 0x1c0], r12
    2889:      	mov	qword ptr [rsp + 0x1c8], rdi
    2891:      	mov	qword ptr [rsp + 0x1d0], r8
    2899:      	jmp	0x28b3 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x28b3>
    289b:      	lea	rdi, [rsp + 0x1b8]
    28a3:      	lea	rsi, [rsp + 0x70]
    28a8:      	lea	rdx, [rsp + 0x40]
    28ad:      	call	qword ptr [rip]         # 0x28b3 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x28b3>
    28b3:      	movabs	r8, -0xffffffff
    28bd:      	mov	r9, qword ptr [rsp + 0x60]
    28c2:      	sub	r9, qword ptr [rsp + 0x98]
    28ca:      	mov	rsi, qword ptr [rsp + 0x28]
    28cf:      	sbb	rsi, qword ptr [rsp + 0xa0]
    28d7:      	mov	r10, qword ptr [rsp + 0x90]
    28df:      	sbb	r10, qword ptr [rsp + 0xa8]
    28e7:      	setb	al
    28ea:      	sub	r14, qword ptr [rsp + 0xb0]
    28f2:      	setb	cl
    28f5:      	movzx	eax, al
    28f8:      	sete	dl
    28fb:      	sub	r14, rax
    28fe:      	and	al, dl
    2900:      	or	al, cl
    2902:      	movzx	ecx, al
    2905:      	mov	rdi, r9
    2908:      	sub	rdi, rcx
    290b:      	neg	rcx
    290e:      	and	r8, rcx
    2911:      	mov	ecx, ecx
    2913:      	cmp	rdi, r9
    2916:      	adc	rcx, rsi
    2919:      	adc	r10, 0x0
    291d:      	adc	r8, r14
    2920:      	mov	rdx, qword ptr [rsp + 0x78]
    2925:      	or	rdx, qword ptr [rsp + 0x70]
    292a:      	or	rdx, qword ptr [rsp + 0x80]
    2932:      	or	rdx, qword ptr [rsp + 0x88]
    293a:      	or	rdx, qword ptr [rsp + 0xc0]
    2942:      	or	rdx, qword ptr [rsp + 0xc8]
    294a:      	or	rdx, qword ptr [rsp + 0xd0]
    2952:      	xor	esi, esi
    2954:      	or	rdx, qword ptr [rsp + 0xd8]
    295c:      	sete	sil
    2960:      	mov	rax, qword ptr [rsp + 0x1b0]
    2968:      	mov	rdx, qword ptr [rsp + 0x38]
    296d:      	mov	qword ptr [rax], rdx
    2970:      	mov	rdx, qword ptr [rsp + 0x30]
    2975:      	mov	qword ptr [rax + 0x8], rdx
    2979:      	mov	qword ptr [rax + 0x10], rbp
    297d:      	mov	qword ptr [rax + 0x18], r15
    2981:      	mov	qword ptr [rax + 0x20], rdi
    2985:      	mov	qword ptr [rax + 0x28], rcx
    2989:      	mov	qword ptr [rax + 0x30], r10
    298d:      	mov	qword ptr [rax + 0x38], r8
    2991:      	movups	xmm0, xmmword ptr [rsp + 0x1b8]
    2999:      	movups	xmm1, xmmword ptr [rsp + 0x1c8]
    29a1:      	movups	xmmword ptr [rax + 0x40], xmm0
    29a5:      	movups	xmmword ptr [rax + 0x50], xmm1
    29a9:      	mov	qword ptr [rax + 0x60], rsi
    29ad:      	add	rsp, 0x1d8
    29b4:      	pop	rbx
    29b5:      	pop	r12
    29b7:      	pop	r13
    29b9:      	pop	r14
    29bb:      	pop	r15
    29bd:      	pop	rbp
    29be:      	ret
    29bf:      	call	qword ptr [rip]         # 0x29c5 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x29c5>
    29c5:      	jmp	0x31 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x31>
    29ca:      	call	qword ptr [rip]         # 0x29d0 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x29d0>
    29d0:      	jmp	0x225 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x225>
    29d5:      	call	qword ptr [rip]         # 0x29db <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x29db>
    29db:      	jmp	0x41d <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x41d>
    29e0:      	call	qword ptr [rip]         # 0x29e6 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x29e6>
    29e6:      	jmp	0x69d <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x69d>
    29eb:      	call	qword ptr [rip]         # 0x29f1 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x29f1>
    29f1:      	jmp	0x900 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x900>
    29f6:      	call	qword ptr [rip]         # 0x29fc <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x29fc>
    29fc:      	jmp	0xba0 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0xba0>
    2a01:      	call	qword ptr [rip]         # 0x2a07 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2a07>
    2a07:      	jmp	0xe25 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0xe25>
    2a0c:      	call	qword ptr [rip]         # 0x2a12 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2a12>
    2a12:      	jmp	0x10a7 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x10a7>
    2a17:      	call	qword ptr [rip]         # 0x2a1d <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2a1d>
    2a1d:      	jmp	0x1407 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x1407>
    2a22:      	call	qword ptr [rip]         # 0x2a28 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2a28>
    2a28:      	jmp	0x15f9 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x15f9>
    2a2d:      	call	qword ptr [rip]         # 0x2a33 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2a33>
    2a33:      	jmp	0x187f <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x187f>
    2a38:      	call	qword ptr [rip]         # 0x2a3e <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2a3e>
    2a3e:      	jmp	0x1aeb <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x1aeb>
    2a43:      	call	qword ptr [rip]         # 0x2a49 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2a49>
    2a49:      	jmp	0x1ea6 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x1ea6>
    2a4e:      	call	qword ptr [rip]         # 0x2a54 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2a54>
    2a54:      	jmp	0x2122 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2122>
    2a59:      	call	qword ptr [rip]         # 0x2a5f <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2a5f>
    2a5f:      	jmp	0x23c8 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x23c8>
    2a64:      	call	qword ptr [rip]         # 0x2a6a <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2a6a>
    2a6a:      	jmp	0x2662 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::add_incomplete+0x2662>
