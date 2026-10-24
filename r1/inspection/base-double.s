0000000000000000 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double>:
       0:      	push	rbp
       1:      	push	r15
       3:      	push	r14
       5:      	push	r13
       7:      	push	r12
       9:      	push	rbx
       a:      	sub	rsp, 0x138
      11:      	mov	r12, rsi
      14:      	mov	qword ptr [rsp + 0x130], rdi
      1c:      	mov	r15, qword ptr [rip]    # 0x23 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x23>
		000000000000001f:  R_X86_64_GOTPCREL	toyos_crypto::arch::x86_64::FEATURES-0x4
      23:      	mov	eax, dword ptr [r15]
      26:      	test	eax, eax
      28:      	jns	0x1aa6 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1aa6>
      2e:      	lea	rsi, [r12 + 0x40]
      33:      	not	eax
      35:      	test	eax, 0x820
      3a:      	jne	0x1e0 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1e0>
      40:      	mov	rdx, qword ptr [rsi]
      43:      	mulx	rdi, rcx, qword ptr [rsi + 0x8]
      49:      	mulx	r8, r9, qword ptr [rsi + 0x10]
      4f:      	add	rdi, r9
      52:      	mulx	r15, r9, qword ptr [rsi + 0x18]
      58:      	adc	r8, r9
      5b:      	adc	r15, 0x0
      5f:      	mov	rdx, qword ptr [rsi + 0x8]
      63:      	mulx	r10, r9, qword ptr [rsi + 0x10]
      69:      	add	r8, r9
      6c:      	adc	r15, r10
      6f:      	mulx	r14, r9, qword ptr [rsi + 0x18]
      75:      	adc	r14, 0x0
      79:      	add	r15, r9
      7c:      	adc	r14, 0x0
      80:      	mov	rdx, qword ptr [rsi + 0x10]
      84:      	mulx	rbx, r9, qword ptr [rsi + 0x18]
      8a:      	add	r14, r9
      8d:      	adc	rbx, 0x0
      91:      	xor	r11d, r11d
      94:      	add	rcx, rcx
      97:      	adc	rdi, rdi
      9a:      	adc	r8, r8
      9d:      	adc	r15, r15
      a0:      	adc	r14, r14
      a3:      	adc	rbx, rbx
      a6:      	adc	r11, 0x0
      aa:      	mov	rdx, qword ptr [rsi]
      ad:      	mulx	r10, rax, rdx
      b2:      	add	rcx, r10
      b5:      	mov	rdx, qword ptr [rsi + 0x8]
      b9:      	mulx	r10, r9, rdx
      be:      	adc	rdi, r9
      c1:      	adc	r8, r10
      c4:      	mov	rdx, qword ptr [rsi + 0x10]
      c8:      	mulx	r10, r9, rdx
      cd:      	adc	r15, r9
      d0:      	adc	r14, r10
      d3:      	mov	rdx, qword ptr [rsi + 0x18]
      d7:      	mulx	r10, r9, rdx
      dc:      	adc	rbx, r9
      df:      	adc	r11, r10
      e2:      	movabs	rsi, -0xffffffff
      ec:      	mov	rdx, rax
      ef:      	mulx	r10, r9, rsi
      f4:      	shl	rdx, 0x20
      f8:      	shr	rax, 0x20
      fc:      	add	rcx, rdx
      ff:      	adc	rdi, rax
     102:      	adc	r8, r9
     105:      	adc	r15, r10
     108:      	adc	r14, 0x0
     10c:      	adc	rbx, 0x0
     110:      	adc	r11, 0x0
     114:      	mov	eax, 0x0
     119:      	adc	rax, 0x0
     11d:      	mov	rdx, rcx
     120:      	mulx	r10, r9, rsi
     125:      	shl	rdx, 0x20
     129:      	shr	rcx, 0x20
     12d:      	add	rdi, rdx
     130:      	adc	r8, rcx
     133:      	adc	r15, r9
     136:      	adc	r14, r10
     139:      	adc	rbx, 0x0
     13d:      	adc	r11, 0x0
     141:      	adc	rax, 0x0
     145:      	mov	rdx, rdi
     148:      	mulx	r10, r9, rsi
     14d:      	shl	rdx, 0x20
     151:      	shr	rdi, 0x20
     155:      	add	r8, rdx
     158:      	adc	r15, rdi
     15b:      	adc	r14, r9
     15e:      	adc	rbx, r10
     161:      	adc	r11, 0x0
     165:      	adc	rax, 0x0
     169:      	mov	rdx, r8
     16c:      	mulx	r10, r9, rsi
     171:      	shl	rdx, 0x20
     175:      	shr	r8, 0x20
     179:      	add	r15, rdx
     17c:      	adc	r14, r8
     17f:      	adc	rbx, r9
     182:      	adc	r11, r10
     185:      	adc	rax, 0x0
     189:      	mov	rcx, r15
     18c:      	mov	rdi, r14
     18f:      	mov	r8, rbx
     192:      	mov	rdx, r11
     195:      	mov	r9d, 0xffffffff
     19b:      	sub	rcx, -0x1
     19f:      	sbb	rdi, r9
     1a2:      	sbb	r8, 0x0
     1a6:      	sbb	rdx, rsi
     1a9:      	sbb	rax, 0x0
     1ad:      	cmovae	r15, rcx
     1b1:      	cmovae	r14, rdi
     1b5:      	cmovae	rbx, r8
     1b9:      	cmovae	r11, rdx
     1bd:      	mov	qword ptr [rsp + 0x58], r15
     1c2:      	mov	r15, qword ptr [rip]    # 0x1c9 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1c9>
		00000000000001c5:  R_X86_64_GOTPCREL	toyos_crypto::arch::x86_64::FEATURES-0x4
     1c9:      	mov	qword ptr [rsp + 0x40], r14
     1ce:      	mov	qword ptr [rsp + 0x80], rbx
     1d6:      	mov	qword ptr [rsp + 0x88], r11
     1de:      	jmp	0x219 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x219>
     1e0:      	lea	rdi, [rsp + 0x8]
     1e5:      	call	qword ptr [rip]         # 0x1eb <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1eb>
		00000000000001e7:  R_X86_64_GOTPCREL	toyos_crypto::montgomery::p256::square_portable::<4>-0x4
     1eb:      	mov	rax, qword ptr [rsp + 0x8]
     1f0:      	mov	qword ptr [rsp + 0x58], rax
     1f5:      	mov	rax, qword ptr [rsp + 0x10]
     1fa:      	mov	qword ptr [rsp + 0x40], rax
     1ff:      	mov	rax, qword ptr [rsp + 0x18]
     204:      	mov	qword ptr [rsp + 0x80], rax
     20c:      	mov	rax, qword ptr [rsp + 0x20]
     211:      	mov	qword ptr [rsp + 0x88], rax
     219:      	mov	eax, dword ptr [r15]
     21c:      	test	eax, eax
     21e:      	jns	0x1ab1 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1ab1>
     224:      	lea	rsi, [r12 + 0x20]
     229:      	not	eax
     22b:      	test	eax, 0x820
     230:      	jne	0x3c7 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x3c7>
     236:      	mov	rdx, qword ptr [rsi]
     239:      	mulx	rdi, rcx, qword ptr [rsi + 0x8]
     23f:      	mulx	r8, rbp, qword ptr [rsi + 0x10]
     245:      	add	rdi, rbp
     248:      	mulx	r9, rbp, qword ptr [rsi + 0x18]
     24e:      	adc	r8, rbp
     251:      	adc	r9, 0x0
     255:      	mov	rdx, qword ptr [rsi + 0x8]
     259:      	mulx	r14, rbp, qword ptr [rsi + 0x10]
     25f:      	add	r8, rbp
     262:      	adc	r9, r14
     265:      	mulx	r10, rbp, qword ptr [rsi + 0x18]
     26b:      	adc	r10, 0x0
     26f:      	add	r9, rbp
     272:      	adc	r10, 0x0
     276:      	mov	rdx, qword ptr [rsi + 0x10]
     27a:      	mulx	r11, rbp, qword ptr [rsi + 0x18]
     280:      	add	r10, rbp
     283:      	adc	r11, 0x0
     287:      	xor	ebx, ebx
     289:      	add	rcx, rcx
     28c:      	adc	rdi, rdi
     28f:      	adc	r8, r8
     292:      	adc	r9, r9
     295:      	adc	r10, r10
     298:      	adc	r11, r11
     29b:      	adc	rbx, 0x0
     29f:      	mov	rdx, qword ptr [rsi]
     2a2:      	mulx	r14, rax, rdx
     2a7:      	add	rcx, r14
     2aa:      	mov	rdx, qword ptr [rsi + 0x8]
     2ae:      	mulx	r14, rbp, rdx
     2b3:      	adc	rdi, rbp
     2b6:      	adc	r8, r14
     2b9:      	mov	rdx, qword ptr [rsi + 0x10]
     2bd:      	mulx	r14, rbp, rdx
     2c2:      	adc	r9, rbp
     2c5:      	adc	r10, r14
     2c8:      	mov	rdx, qword ptr [rsi + 0x18]
     2cc:      	mulx	r14, rbp, rdx
     2d1:      	adc	r11, rbp
     2d4:      	adc	rbx, r14
     2d7:      	movabs	rsi, -0xffffffff
     2e1:      	mov	rdx, rax
     2e4:      	mulx	r14, rbp, rsi
     2e9:      	shl	rdx, 0x20
     2ed:      	shr	rax, 0x20
     2f1:      	add	rcx, rdx
     2f4:      	adc	rdi, rax
     2f7:      	adc	r8, rbp
     2fa:      	adc	r9, r14
     2fd:      	adc	r10, 0x0
     301:      	adc	r11, 0x0
     305:      	adc	rbx, 0x0
     309:      	mov	eax, 0x0
     30e:      	adc	rax, 0x0
     312:      	mov	rdx, rcx
     315:      	mulx	r14, rbp, rsi
     31a:      	shl	rdx, 0x20
     31e:      	shr	rcx, 0x20
     322:      	add	rdi, rdx
     325:      	adc	r8, rcx
     328:      	adc	r9, rbp
     32b:      	adc	r10, r14
     32e:      	adc	r11, 0x0
     332:      	adc	rbx, 0x0
     336:      	adc	rax, 0x0
     33a:      	mov	rdx, rdi
     33d:      	mulx	r14, rbp, rsi
     342:      	shl	rdx, 0x20
     346:      	shr	rdi, 0x20
     34a:      	add	r8, rdx
     34d:      	adc	r9, rdi
     350:      	adc	r10, rbp
     353:      	adc	r11, r14
     356:      	adc	rbx, 0x0
     35a:      	adc	rax, 0x0
     35e:      	mov	rdx, r8
     361:      	mulx	r14, rbp, rsi
     366:      	shl	rdx, 0x20
     36a:      	shr	r8, 0x20
     36e:      	add	r9, rdx
     371:      	adc	r10, r8
     374:      	adc	r11, rbp
     377:      	adc	rbx, r14
     37a:      	adc	rax, 0x0
     37e:      	mov	rcx, r9
     381:      	mov	rdi, r10
     384:      	mov	r8, r11
     387:      	mov	rdx, rbx
     38a:      	mov	ebp, 0xffffffff
     38f:      	sub	rcx, -0x1
     393:      	sbb	rdi, rbp
     396:      	sbb	r8, 0x0
     39a:      	sbb	rdx, rsi
     39d:      	sbb	rax, 0x0
     3a1:      	cmovae	r9, rcx
     3a5:      	cmovae	r10, rdi
     3a9:      	cmovae	r11, r8
     3ad:      	cmovae	rbx, rdx
     3b1:      	mov	qword ptr [rsp + 0x8], r9
     3b6:      	mov	qword ptr [rsp + 0x10], r10
     3bb:      	mov	qword ptr [rsp + 0x18], r11
     3c0:      	mov	qword ptr [rsp + 0x20], rbx
     3c5:      	jmp	0x3d2 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x3d2>
     3c7:      	lea	rdi, [rsp + 0x8]
     3cc:      	call	qword ptr [rip]         # 0x3d2 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x3d2>
		00000000000003ce:  R_X86_64_GOTPCREL	toyos_crypto::montgomery::p256::square_portable::<4>-0x4
     3d2:      	mov	rax, qword ptr [rsp + 0x8]
     3d7:      	mov	rcx, qword ptr [rsp + 0x10]
     3dc:      	mov	rdx, qword ptr [rsp + 0x18]
     3e1:      	mov	qword ptr [rsp + 0xc0], rdx
     3e9:      	mov	rdx, qword ptr [rsp + 0x20]
     3ee:      	mov	qword ptr [rsp + 0xc8], rdx
     3f6:      	mov	qword ptr [rsp + 0xb0], rax
     3fe:      	mov	qword ptr [rsp + 0xb8], rcx
     406:      	mov	eax, dword ptr [r15]
     409:      	test	eax, eax
     40b:      	jns	0x1abc <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1abc>
     411:      	not	eax
     413:      	test	eax, 0x820
     418:      	jne	0x63f <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x63f>
     41e:      	lea	rax, [rsp + 0xb0]
     426:      	movabs	rcx, -0xffffffff
     430:      	mov	rdx, qword ptr [r12]
     434:      	mulx	rbx, r10, qword ptr [rax]
     439:      	mulx	rsi, r8, qword ptr [rax + 0x8]
     43f:      	add	rbx, r8
     442:      	mulx	rdi, r8, qword ptr [rax + 0x10]
     448:      	adc	rsi, r8
     44b:      	mulx	r14, r8, qword ptr [rax + 0x18]
     451:      	adc	rdi, r8
     454:      	adc	r14, 0x0
     458:      	xor	r11d, r11d
     45b:      	mov	rdx, r10
     45e:      	mulx	r9, r8, rcx
     463:      	shl	rdx, 0x20
     467:      	shr	r10, 0x20
     46b:      	add	rbx, rdx
     46e:      	adc	rsi, r10
     471:      	adc	rdi, r8
     474:      	adc	r14, r9
     477:      	adc	r11, 0x0
     47b:      	mov	rdx, qword ptr [r12 + 0x8]
     480:      	xor	r10d, r10d
     483:      	mulx	r9, r8, qword ptr [rax]
     488:      	adcx	rbx, r8
     48e:      	adox	rsi, r9
     494:      	mulx	r9, r8, qword ptr [rax + 0x8]
     49a:      	adcx	rsi, r8
     4a0:      	adox	rdi, r9
     4a6:      	mulx	r9, r8, qword ptr [rax + 0x10]
     4ac:      	adcx	rdi, r8
     4b2:      	adox	r14, r9
     4b8:      	mulx	r9, r8, qword ptr [rax + 0x18]
     4be:      	adcx	r14, r8
     4c4:      	adox	r11, r9
     4ca:      	adcx	r11, r10
     4d0:      	adox	r10, r10
     4d6:      	adc	r10, 0x0
     4da:      	mov	rdx, rbx
     4dd:      	mulx	r9, r8, rcx
     4e2:      	shl	rdx, 0x20
     4e6:      	shr	rbx, 0x20
     4ea:      	add	rsi, rdx
     4ed:      	adc	rdi, rbx
     4f0:      	adc	r14, r8
     4f3:      	adc	r11, r9
     4f6:      	adc	r10, 0x0
     4fa:      	mov	rdx, qword ptr [r12 + 0x10]
     4ff:      	xor	ebx, ebx
     501:      	mulx	r9, r8, qword ptr [rax]
     506:      	adcx	rsi, r8
     50c:      	adox	rdi, r9
     512:      	mulx	r9, r8, qword ptr [rax + 0x8]
     518:      	adcx	rdi, r8
     51e:      	adox	r14, r9
     524:      	mulx	r9, r8, qword ptr [rax + 0x10]
     52a:      	adcx	r14, r8
     530:      	adox	r11, r9
     536:      	mulx	r9, r8, qword ptr [rax + 0x18]
     53c:      	adcx	r11, r8
     542:      	adox	r10, r9
     548:      	adcx	r10, rbx
     54e:      	adox	rbx, rbx
     554:      	adc	rbx, 0x0
     558:      	mov	rdx, rsi
     55b:      	mulx	r9, r8, rcx
     560:      	shl	rdx, 0x20
     564:      	shr	rsi, 0x20
     568:      	add	rdi, rdx
     56b:      	adc	r14, rsi
     56e:      	adc	r11, r8
     571:      	adc	r10, r9
     574:      	adc	rbx, 0x0
     578:      	mov	rdx, qword ptr [r12 + 0x18]
     57d:      	xor	esi, esi
     57f:      	mulx	r9, r8, qword ptr [rax]
     584:      	adcx	rdi, r8
     58a:      	adox	r14, r9
     590:      	mulx	r9, r8, qword ptr [rax + 0x8]
     596:      	adcx	r14, r8
     59c:      	adox	r11, r9
     5a2:      	mulx	r9, r8, qword ptr [rax + 0x10]
     5a8:      	adcx	r11, r8
     5ae:      	adox	r10, r9
     5b4:      	mulx	r9, r8, qword ptr [rax + 0x18]
     5ba:      	adcx	r10, r8
     5c0:      	adox	rbx, r9
     5c6:      	adcx	rbx, rsi
     5cc:      	adox	rsi, rsi
     5d2:      	adc	rsi, 0x0
     5d6:      	mov	rdx, rdi
     5d9:      	mulx	r9, r8, rcx
     5de:      	shl	rdx, 0x20
     5e2:      	shr	rdi, 0x20
     5e6:      	add	r14, rdx
     5e9:      	adc	r11, rdi
     5ec:      	adc	r10, r8
     5ef:      	adc	rbx, r9
     5f2:      	adc	rsi, 0x0
     5f6:      	mov	rdi, r14
     5f9:      	mov	r8, r11
     5fc:      	mov	r9, r10
     5ff:      	mov	rdx, rbx
     602:      	mov	eax, 0xffffffff
     607:      	sub	rdi, -0x1
     60b:      	sbb	r8, rax
     60e:      	sbb	r9, 0x0
     612:      	sbb	rdx, rcx
     615:      	sbb	rsi, 0x0
     619:      	cmovae	r14, rdi
     61d:      	cmovae	r11, r8
     621:      	cmovae	r10, r9
     625:      	cmovae	rbx, rdx
     629:      	mov	qword ptr [rsp + 0x48], r14
     62e:      	mov	qword ptr [rsp + 0x50], rbx
     633:      	mov	qword ptr [rsp + 0x28], r11
     638:      	mov	qword ptr [rsp + 0x30], r10
     63d:      	jmp	0x67d <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x67d>
     63f:      	lea	rdi, [rsp + 0x8]
     644:      	lea	rdx, [rsp + 0xb0]
     64c:      	mov	rsi, r12
     64f:      	call	qword ptr [rip]         # 0x655 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x655>
		0000000000000651:  R_X86_64_GOTPCREL	toyos_crypto::montgomery::p256::mul_portable::<4>-0x4
     655:      	mov	rax, qword ptr [rsp + 0x8]
     65a:      	mov	qword ptr [rsp + 0x48], rax
     65f:      	mov	rax, qword ptr [rsp + 0x10]
     664:      	mov	qword ptr [rsp + 0x28], rax
     669:      	mov	rax, qword ptr [rsp + 0x18]
     66e:      	mov	qword ptr [rsp + 0x30], rax
     673:      	mov	rax, qword ptr [rsp + 0x20]
     678:      	mov	qword ptr [rsp + 0x50], rax
     67d:      	mov	rdx, qword ptr [r12]
     681:      	mov	rcx, qword ptr [r12 + 0x8]
     686:      	mov	r9, rdx
     689:      	sub	r9, qword ptr [rsp + 0x58]
     68e:      	mov	r8, rcx
     691:      	sbb	r8, qword ptr [rsp + 0x40]
     696:      	mov	rax, qword ptr [r12 + 0x10]
     69b:      	mov	rdi, rax
     69e:      	mov	r15, qword ptr [rsp + 0x80]
     6a6:      	sbb	rdi, r15
     6a9:      	movabs	r13, -0x100000000
     6b3:      	setb	sil
     6b7:      	movzx	r11d, sil
     6bb:      	mov	r10, r11
     6be:      	neg	r10
     6c1:      	mov	qword ptr [rsp + 0x38], r12
     6c6:      	mov	rsi, qword ptr [r12 + 0x18]
     6cb:      	mov	r14, rsi
     6ce:      	mov	rbx, qword ptr [rsp + 0x88]
     6d6:      	sub	r14, rbx
     6d9:      	setb	bpl
     6dd:      	sete	r12b
     6e1:      	and	r11b, r12b
     6e4:      	or	r11b, bpl
     6e7:      	movzx	r11d, r11b
     6eb:      	mov	r12, r9
     6ee:      	sub	r12, r11
     6f1:      	neg	r11
     6f4:      	lea	rbp, [r13 + 0x1]
     6f8:      	mov	r13, r11
     6fb:      	and	r13, rbp
     6fe:      	cmp	r12, r9
     701:      	mov	r9d, r11d
     704:      	adc	r9, r8
     707:      	adc	rdi, 0x0
     70b:      	lea	r8, [r14 + r13]
     70f:      	adc	r8, r10
     712:      	mov	qword ptr [rsp + 0x90], r12
     71a:      	mov	qword ptr [rsp + 0x98], r9
     722:      	mov	qword ptr [rsp + 0xa0], rdi
     72a:      	mov	qword ptr [rsp + 0xa8], r8
     732:      	add	rdx, qword ptr [rsp + 0x58]
     737:      	adc	rcx, qword ptr [rsp + 0x40]
     73c:      	adc	rax, r15
     73f:      	adc	rsi, rbx
     742:      	setb	r11b
     746:      	xor	r9d, r9d
     749:      	mov	rdi, rdx
     74c:      	inc	rdi
     74f:      	setne	r9b
     753:      	movabs	rbx, -0x100000000
     75d:      	lea	r8, [rcx + rbx]
     761:      	inc	r8
     764:      	mov	r14d, 0xffffffff
     76a:      	cmp	rcx, r14
     76d:      	setb	r10b
     771:      	sub	r8, r9
     774:      	setb	r9b
     778:      	or	r9b, r10b
     77b:      	cmp	rsi, rbx
     77e:      	seta	bpl
     782:      	movzx	r10d, r9b
     786:      	mov	r9, rax
     789:      	sub	r9, r10
     78c:      	lea	r10, [rsi + r14]
     790:      	sbb	r10, 0x0
     794:      	setae	r14b
     798:      	and	r14b, bpl
     79b:      	or	r14b, r11b
     79e:      	movzx	r11d, r14b
     7a2:      	mov	r14, r11
     7a5:      	neg	r14
     7a8:      	dec	r11
     7ab:      	and	rdx, r11
     7ae:      	and	rdi, r14
     7b1:      	or	rdi, rdx
     7b4:      	and	rcx, r11
     7b7:      	and	r8, r14
     7ba:      	or	r8, rcx
     7bd:      	and	rax, r11
     7c0:      	and	r9, r14
     7c3:      	or	r9, rax
     7c6:      	and	r11, rsi
     7c9:      	and	r14, r10
     7cc:      	or	r14, r11
     7cf:      	mov	qword ptr [rsp + 0x60], rdi
     7d4:      	mov	qword ptr [rsp + 0x68], r8
     7d9:      	mov	qword ptr [rsp + 0x70], r9
     7de:      	mov	qword ptr [rsp + 0x78], r14
     7e3:      	mov	rax, qword ptr [rip]    # 0x7ea <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x7ea>
		00000000000007e6:  R_X86_64_GOTPCREL	toyos_crypto::arch::x86_64::FEATURES-0x4
     7ea:      	mov	eax, dword ptr [rax]
     7ec:      	test	eax, eax
     7ee:      	jns	0x1ac7 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1ac7>
     7f4:      	not	eax
     7f6:      	test	eax, 0x820
     7fb:      	jne	0xa0f <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0xa0f>
     801:      	lea	rax, [rsp + 0x90]
     809:      	lea	rcx, [rsp + 0x60]
     80e:      	movabs	r10, -0xffffffff
     818:      	mov	rdx, qword ptr [rax]
     81b:      	mulx	rsi, rdi, qword ptr [rcx]
     820:      	mulx	r11, r14, qword ptr [rcx + 0x8]
     826:      	add	rsi, r14
     829:      	mulx	rbp, r14, qword ptr [rcx + 0x10]
     82f:      	adc	r11, r14
     832:      	mulx	r9, r14, qword ptr [rcx + 0x18]
     838:      	adc	rbp, r14
     83b:      	adc	r9, 0x0
     83f:      	xor	r8d, r8d
     842:      	mov	rdx, rdi
     845:      	mulx	r12, r14, r10
     84a:      	shl	rdx, 0x20
     84e:      	shr	rdi, 0x20
     852:      	add	rsi, rdx
     855:      	adc	r11, rdi
     858:      	adc	rbp, r14
     85b:      	adc	r9, r12
     85e:      	adc	r8, 0x0
     862:      	mov	rdx, qword ptr [rax + 0x8]
     866:      	xor	edi, edi
     868:      	mulx	r12, r14, qword ptr [rcx]
     86d:      	adcx	rsi, r14
     873:      	adox	r11, r12
     879:      	mulx	r12, r14, qword ptr [rcx + 0x8]
     87f:      	adcx	r11, r14
     885:      	adox	rbp, r12
     88b:      	mulx	r12, r14, qword ptr [rcx + 0x10]
     891:      	adcx	rbp, r14
     897:      	adox	r9, r12
     89d:      	mulx	r12, r14, qword ptr [rcx + 0x18]
     8a3:      	adcx	r9, r14
     8a9:      	adox	r8, r12
     8af:      	adcx	r8, rdi
     8b5:      	adox	rdi, rdi
     8bb:      	adc	rdi, 0x0
     8bf:      	mov	rdx, rsi
     8c2:      	mulx	r12, r14, r10
     8c7:      	shl	rdx, 0x20
     8cb:      	shr	rsi, 0x20
     8cf:      	add	r11, rdx
     8d2:      	adc	rbp, rsi
     8d5:      	adc	r9, r14
     8d8:      	adc	r8, r12
     8db:      	adc	rdi, 0x0
     8df:      	mov	rdx, qword ptr [rax + 0x10]
     8e3:      	xor	esi, esi
     8e5:      	mulx	r12, r14, qword ptr [rcx]
     8ea:      	adcx	r11, r14
     8f0:      	adox	rbp, r12
     8f6:      	mulx	r12, r14, qword ptr [rcx + 0x8]
     8fc:      	adcx	rbp, r14
     902:      	adox	r9, r12
     908:      	mulx	r12, r14, qword ptr [rcx + 0x10]
     90e:      	adcx	r9, r14
     914:      	adox	r8, r12
     91a:      	mulx	r12, r14, qword ptr [rcx + 0x18]
     920:      	adcx	r8, r14
     926:      	adox	rdi, r12
     92c:      	adcx	rdi, rsi
     932:      	adox	rsi, rsi
     938:      	adc	rsi, 0x0
     93c:      	mov	rdx, r11
     93f:      	mulx	r12, r14, r10
     944:      	shl	rdx, 0x20
     948:      	shr	r11, 0x20
     94c:      	add	rbp, rdx
     94f:      	adc	r9, r11
     952:      	adc	r8, r14
     955:      	adc	rdi, r12
     958:      	adc	rsi, 0x0
     95c:      	mov	rdx, qword ptr [rax + 0x18]
     960:      	xor	r11d, r11d
     963:      	mulx	r12, r14, qword ptr [rcx]
     968:      	adcx	rbp, r14
     96e:      	adox	r9, r12
     974:      	mulx	r12, r14, qword ptr [rcx + 0x8]
     97a:      	adcx	r9, r14
     980:      	adox	r8, r12
     986:      	mulx	r12, r14, qword ptr [rcx + 0x10]
     98c:      	adcx	r8, r14
     992:      	adox	rdi, r12
     998:      	mulx	r12, r14, qword ptr [rcx + 0x18]
     99e:      	adcx	rdi, r14
     9a4:      	adox	rsi, r12
     9aa:      	adcx	rsi, r11
     9b0:      	adox	r11, r11
     9b6:      	adc	r11, 0x0
     9ba:      	mov	rdx, rbp
     9bd:      	mulx	r12, r14, r10
     9c2:      	shl	rdx, 0x20
     9c6:      	shr	rbp, 0x20
     9ca:      	add	r9, rdx
     9cd:      	adc	r8, rbp
     9d0:      	adc	rdi, r14
     9d3:      	adc	rsi, r12
     9d6:      	adc	r11, 0x0
     9da:      	mov	rbp, r9
     9dd:      	mov	r14, r8
     9e0:      	mov	r12, rdi
     9e3:      	mov	rdx, rsi
     9e6:      	mov	ecx, 0xffffffff
     9eb:      	sub	rbp, -0x1
     9ef:      	sbb	r14, rcx
     9f2:      	sbb	r12, 0x0
     9f6:      	sbb	rdx, r10
     9f9:      	sbb	r11, 0x0
     9fd:      	cmovae	r9, rbp
     a01:      	cmovae	r8, r14
     a05:      	cmovae	rdi, r12
     a09:      	cmovae	rsi, rdx
     a0d:      	jmp	0xa3b <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0xa3b>
     a0f:      	lea	rdi, [rsp + 0x8]
     a14:      	lea	rsi, [rsp + 0x90]
     a1c:      	lea	rdx, [rsp + 0x60]
     a21:      	call	qword ptr [rip]         # 0xa27 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0xa27>
		0000000000000a23:  R_X86_64_GOTPCREL	toyos_crypto::montgomery::p256::mul_portable::<4>-0x4
     a27:      	mov	r9, qword ptr [rsp + 0x8]
     a2c:      	mov	r8, qword ptr [rsp + 0x10]
     a31:      	mov	rdi, qword ptr [rsp + 0x18]
     a36:      	mov	rsi, qword ptr [rsp + 0x20]
     a3b:      	mov	r12, r8
     a3e:      	shld	r12, r9, 0x1
     a43:      	mov	r14, rdi
     a46:      	shld	r14, r8, 0x1
     a4b:      	mov	r11, rsi
     a4e:      	shld	r11, rdi, 0x1
     a53:      	xor	ecx, ecx
     a55:      	mov	rax, r12
     a58:      	shr	rax, 0x20
     a5c:      	sete	cl
     a5f:      	mov	eax, 0xffffffff
     a64:      	lea	r13, [r11 + rax]
     a68:      	movabs	r15, -0x100000000
     a72:      	cmp	r11, r15
     a75:      	seta	dl
     a78:      	mov	rax, r14
     a7b:      	sub	rax, rcx
     a7e:      	sbb	r13, 0x0
     a82:      	setae	cl
     a85:      	and	cl, dl
     a87:      	mov	rdx, rsi
     a8a:      	shr	rdx, 0x3f
     a8e:      	movzx	ecx, cl
     a91:      	or	rcx, rdx
     a94:      	mov	rbp, rcx
     a97:      	neg	rbp
     a9a:      	dec	rcx
     a9d:      	lea	rdx, [r9 + r9]
     aa1:      	and	rdx, rcx
     aa4:      	lea	r10, [2*r9 + 0x1]
     aac:      	and	r10, rbp
     aaf:      	or	r10, rdx
     ab2:      	lea	rdx, [r12 + r15]
     ab6:      	and	r12, rcx
     ab9:      	and	rdx, rbp
     abc:      	or	rdx, r12
     abf:      	and	r14, rcx
     ac2:      	and	rax, rbp
     ac5:      	or	rax, r14
     ac8:      	and	rcx, r11
     acb:      	and	rbp, r13
     ace:      	or	rbp, rcx
     ad1:      	add	r10, r9
     ad4:      	adc	rdx, r8
     ad7:      	adc	rax, rdi
     ada:      	adc	rbp, rsi
     add:      	setb	r9b
     ae1:      	xor	ecx, ecx
     ae3:      	mov	rsi, r10
     ae6:      	inc	rsi
     ae9:      	setne	cl
     aec:      	lea	rdi, [r15 + rdx]
     af0:      	inc	rdi
     af3:      	mov	r8d, 0xffffffff
     af9:      	cmp	rdx, r8
     afc:      	setb	r8b
     b00:      	sub	rdi, rcx
     b03:      	setb	cl
     b06:      	or	cl, r8b
     b09:      	movzx	ecx, cl
     b0c:      	cmp	rbp, r15
     b0f:      	seta	r11b
     b13:      	mov	r8, rax
     b16:      	sub	r8, rcx
     b19:      	mov	ebx, 0xffffffff
     b1e:      	lea	rcx, [rbp + rbx]
     b23:      	sbb	rcx, 0x0
     b27:      	setae	r14b
     b2b:      	and	r14b, r11b
     b2e:      	or	r14b, r9b
     b31:      	movzx	r9d, r14b
     b35:      	mov	r11, r9
     b38:      	neg	r11
     b3b:      	dec	r9
     b3e:      	and	r10, r9
     b41:      	and	rsi, r11
     b44:      	or	rsi, r10
     b47:      	and	rdx, r9
     b4a:      	and	rdi, r11
     b4d:      	or	rdi, rdx
     b50:      	and	rax, r9
     b53:      	and	r8, r11
     b56:      	or	r8, rax
     b59:      	and	r9, rbp
     b5c:      	and	r11, rcx
     b5f:      	or	r11, r9
     b62:      	mov	qword ptr [rsp + 0x90], rsi
     b6a:      	mov	qword ptr [rsp + 0x98], rdi
     b72:      	mov	qword ptr [rsp + 0xa0], r8
     b7a:      	mov	qword ptr [rsp + 0xa8], r11
     b82:      	mov	rax, qword ptr [rsp + 0x48]
     b87:      	lea	rsi, [rax + rax]
     b8b:      	mov	r11, qword ptr [rsp + 0x50]
     b90:      	mov	rdx, r11
     b93:      	mov	r9, qword ptr [rsp + 0x30]
     b98:      	shld	rdx, r9, 0x1
     b9d:      	mov	r10, qword ptr [rsp + 0x28]
     ba2:      	shld	r9, r10, 0x1
     ba7:      	shld	r10, rax, 0x1
     bac:      	lea	rax, [2*rax + 0x1]
     bb4:      	xor	ecx, ecx
     bb6:      	mov	rdi, r10
     bb9:      	shr	rdi, 0x20
     bbd:      	sete	cl
     bc0:      	cmp	rdx, r15
     bc3:      	seta	r8b
     bc7:      	lea	r12, [r10 + r15]
     bcb:      	mov	r14, r9
     bce:      	sub	r14, rcx
     bd1:      	lea	rdi, [rdx + rbx]
     bd5:      	mov	r13d, 0xffffffff
     bdb:      	sbb	rdi, 0x0
     bdf:      	setae	cl
     be2:      	and	cl, r8b
     be5:      	shr	r11, 0x3f
     be9:      	movzx	r8d, cl
     bed:      	or	r8, r11
     bf0:      	mov	rcx, r8
     bf3:      	neg	rcx
     bf6:      	dec	r8
     bf9:      	and	rsi, r8
     bfc:      	and	rax, rcx
     bff:      	or	rax, rsi
     c02:      	and	r10, r8
     c05:      	and	r12, rcx
     c08:      	or	r12, r10
     c0b:      	and	r9, r8
     c0e:      	and	r14, rcx
     c11:      	or	r14, r9
     c14:      	and	r8, rdx
     c17:      	and	rcx, rdi
     c1a:      	or	rcx, r8
     c1d:      	mov	rdx, rcx
     c20:      	shld	rdx, r14, 0x1
     c25:      	shld	r14, r12, 0x1
     c2a:      	lea	r9, [rax + rax]
     c2e:      	shld	r12, rax, 0x1
     c33:      	lea	rbx, [r12 + r15]
     c37:      	xor	esi, esi
     c39:      	mov	rdi, r12
     c3c:      	shr	rdi, 0x20
     c40:      	sete	sil
     c44:      	cmp	rdx, r15
     c47:      	seta	dil
     c4b:      	mov	rbp, r14
     c4e:      	sub	rbp, rsi
     c51:      	lea	rsi, [rdx + r13]
     c55:      	sbb	rsi, 0x0
     c59:      	setae	r8b
     c5d:      	and	r8b, dil
     c60:      	shr	rcx, 0x3f
     c64:      	movzx	r15d, r8b
     c68:      	or	r15, rcx
     c6b:      	mov	r13, r15
     c6e:      	dec	r15
     c71:      	and	r9, r15
     c74:      	and	r12, r15
     c77:      	and	r14, r15
     c7a:      	and	r15, rdx
     c7d:      	lea	rcx, [2*rax + 0x1]
     c85:      	neg	r13
     c88:      	and	rcx, r13
     c8b:      	and	rbx, r13
     c8e:      	and	rbp, r13
     c91:      	and	r13, rsi
     c94:      	mov	rax, qword ptr [rip]    # 0xc9b <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0xc9b>
		0000000000000c97:  R_X86_64_GOTPCREL	toyos_crypto::arch::x86_64::FEATURES-0x4
     c9b:      	mov	eax, dword ptr [rax]
     c9d:      	test	eax, eax
     c9f:      	jns	0x1ad2 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1ad2>
     ca5:      	or	rcx, r9
     ca8:      	mov	qword ptr [rsp + 0x30], rcx
     cad:      	or	rbx, r12
     cb0:      	or	rbp, r14
     cb3:      	or	r13, r15
     cb6:      	not	eax
     cb8:      	test	eax, 0x820
     cbd:      	mov	r12, rbx
     cc0:      	jne	0xe4d <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0xe4d>
     cc6:      	lea	rdi, [rsp + 0x90]
     cce:      	mov	rdx, qword ptr [rdi]
     cd1:      	mulx	r10, r9, qword ptr [rdi + 0x8]
     cd7:      	mulx	r11, r14, qword ptr [rdi + 0x10]
     cdd:      	add	r10, r14
     ce0:      	mulx	rcx, r14, qword ptr [rdi + 0x18]
     ce6:      	adc	r11, r14
     ce9:      	adc	rcx, 0x0
     ced:      	mov	rdx, qword ptr [rdi + 0x8]
     cf1:      	mulx	r15, r14, qword ptr [rdi + 0x10]
     cf7:      	add	r11, r14
     cfa:      	adc	rcx, r15
     cfd:      	mulx	rax, r14, qword ptr [rdi + 0x18]
     d03:      	adc	rax, 0x0
     d07:      	add	rcx, r14
     d0a:      	adc	rax, 0x0
     d0e:      	mov	rdx, qword ptr [rdi + 0x10]
     d12:      	mulx	rbx, r14, qword ptr [rdi + 0x18]
     d18:      	add	rax, r14
     d1b:      	adc	rbx, 0x0
     d1f:      	xor	esi, esi
     d21:      	add	r9, r9
     d24:      	adc	r10, r10
     d27:      	adc	r11, r11
     d2a:      	adc	rcx, rcx
     d2d:      	adc	rax, rax
     d30:      	adc	rbx, rbx
     d33:      	adc	rsi, 0x0
     d37:      	mov	rdx, qword ptr [rdi]
     d3a:      	mulx	r15, r8, rdx
     d3f:      	add	r9, r15
     d42:      	mov	rdx, qword ptr [rdi + 0x8]
     d46:      	mulx	r15, r14, rdx
     d4b:      	adc	r10, r14
     d4e:      	adc	r11, r15
     d51:      	mov	rdx, qword ptr [rdi + 0x10]
     d55:      	mulx	r15, r14, rdx
     d5a:      	adc	rcx, r14
     d5d:      	adc	rax, r15
     d60:      	mov	rdx, qword ptr [rdi + 0x18]
     d64:      	mulx	r15, r14, rdx
     d69:      	adc	rbx, r14
     d6c:      	adc	rsi, r15
     d6f:      	movabs	rdi, -0xffffffff
     d79:      	mov	rdx, r8
     d7c:      	mulx	r15, r14, rdi
     d81:      	shl	rdx, 0x20
     d85:      	shr	r8, 0x20
     d89:      	add	r9, rdx
     d8c:      	adc	r10, r8
     d8f:      	adc	r11, r14
     d92:      	adc	rcx, r15
     d95:      	adc	rax, 0x0
     d99:      	adc	rbx, 0x0
     d9d:      	adc	rsi, 0x0
     da1:      	mov	r8d, 0x0
     da7:      	adc	r8, 0x0
     dab:      	mov	rdx, r9
     dae:      	mulx	r15, r14, rdi
     db3:      	shl	rdx, 0x20
     db7:      	shr	r9, 0x20
     dbb:      	add	r10, rdx
     dbe:      	adc	r11, r9
     dc1:      	adc	rcx, r14
     dc4:      	adc	rax, r15
     dc7:      	adc	rbx, 0x0
     dcb:      	adc	rsi, 0x0
     dcf:      	adc	r8, 0x0
     dd3:      	mov	rdx, r10
     dd6:      	mulx	r15, r14, rdi
     ddb:      	shl	rdx, 0x20
     ddf:      	shr	r10, 0x20
     de3:      	add	r11, rdx
     de6:      	adc	rcx, r10
     de9:      	adc	rax, r14
     dec:      	adc	rbx, r15
     def:      	adc	rsi, 0x0
     df3:      	adc	r8, 0x0
     df7:      	mov	rdx, r11
     dfa:      	mulx	r15, r14, rdi
     dff:      	shl	rdx, 0x20
     e03:      	shr	r11, 0x20
     e07:      	add	rcx, rdx
     e0a:      	adc	rax, r11
     e0d:      	adc	rbx, r14
     e10:      	adc	rsi, r15
     e13:      	adc	r8, 0x0
     e17:      	mov	r9, rcx
     e1a:      	mov	r10, rax
     e1d:      	mov	r11, rbx
     e20:      	mov	rdx, rsi
     e23:      	mov	r14d, 0xffffffff
     e29:      	sub	r9, -0x1
     e2d:      	sbb	r10, r14
     e30:      	sbb	r11, 0x0
     e34:      	sbb	rdx, rdi
     e37:      	sbb	r8, 0x0
     e3b:      	cmovae	rcx, r9
     e3f:      	cmovae	rax, r10
     e43:      	cmovae	rbx, r11
     e47:      	cmovae	rsi, rdx
     e4b:      	jmp	0xe74 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0xe74>
     e4d:      	lea	rdi, [rsp + 0x8]
     e52:      	lea	rsi, [rsp + 0x90]
     e5a:      	call	qword ptr [rip]         # 0xe60 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0xe60>
		0000000000000e5c:  R_X86_64_GOTPCREL	toyos_crypto::montgomery::p256::square_portable::<4>-0x4
     e60:      	mov	rcx, qword ptr [rsp + 0x8]
     e65:      	mov	rax, qword ptr [rsp + 0x10]
     e6a:      	mov	rbx, qword ptr [rsp + 0x18]
     e6f:      	mov	rsi, qword ptr [rsp + 0x20]
     e74:      	mov	r10, r12
     e77:      	mov	rdx, qword ptr [rsp + 0x30]
     e7c:      	shld	r10, rdx, 0x1
     e81:      	mov	r9, rbp
     e84:      	mov	qword ptr [rsp + 0x128], r12
     e8c:      	shld	r9, r12, 0x1
     e91:      	mov	r8, r13
     e94:      	mov	qword ptr [rsp + 0x120], rbp
     e9c:      	shld	r8, rbp, 0x1
     ea1:      	lea	r15, [rdx + rdx]
     ea5:      	lea	rdi, [2*rdx + 0x1]
     ead:      	xor	edx, edx
     eaf:      	mov	r11, r10
     eb2:      	shr	r11, 0x20
     eb6:      	sete	dl
     eb9:      	mov	r11d, 0xffffffff
     ebf:      	lea	r14, [r8 + r11]
     ec3:      	movabs	rbp, -0x100000000
     ecd:      	cmp	r8, rbp
     ed0:      	seta	r12b
     ed4:      	mov	r11, r9
     ed7:      	sub	r11, rdx
     eda:      	sbb	r14, 0x0
     ede:      	setae	dl
     ee1:      	and	dl, r12b
     ee4:      	mov	qword ptr [rsp + 0xf8], r13
     eec:      	shr	r13, 0x3f
     ef0:      	movzx	r12d, dl
     ef4:      	or	r12, r13
     ef7:      	mov	rdx, r12
     efa:      	neg	rdx
     efd:      	dec	r12
     f00:      	and	r15, r12
     f03:      	and	rdi, rdx
     f06:      	or	rdi, r15
     f09:      	lea	r15, [r10 + rbp]
     f0d:      	and	r10, r12
     f10:      	and	r15, rdx
     f13:      	or	r15, r10
     f16:      	and	r9, r12
     f19:      	and	r11, rdx
     f1c:      	or	r11, r9
     f1f:      	and	r12, r8
     f22:      	and	rdx, r14
     f25:      	or	rdx, r12
     f28:      	sub	rcx, rdi
     f2b:      	sbb	rax, r15
     f2e:      	sbb	rbx, r11
     f31:      	setb	dil
     f35:      	movzx	r8d, dil
     f39:      	mov	rdi, r8
     f3c:      	neg	rdi
     f3f:      	cmp	rsi, rdx
     f42:      	setb	r9b
     f46:      	sete	r10b
     f4a:      	and	r8b, r10b
     f4d:      	or	r8b, r9b
     f50:      	movzx	r8d, r8b
     f54:      	mov	r9, rcx
     f57:      	sub	r9, r8
     f5a:      	neg	r8
     f5d:      	mov	r11d, r8d
     f60:      	mov	r10, r8
     f63:      	lea	r8, [rbp + 0x1]
     f67:      	and	r10, r8
     f6a:      	add	r10, rsi
     f6d:      	sub	r10, rdx
     f70:      	mov	qword ptr [rsp + 0x50], r9
     f75:      	cmp	r9, rcx
     f78:      	adc	r11, rax
     f7b:      	mov	qword ptr [rsp + 0xf0], r11
     f83:      	adc	rbx, 0x0
     f87:      	adc	r10, rdi
     f8a:      	mov	qword ptr [rsp + 0x48], r10
     f8f:      	mov	rdx, qword ptr [rsp + 0x38]
     f94:      	mov	rdi, qword ptr [rdx + 0x40]
     f98:      	add	rdi, qword ptr [rdx + 0x20]
     f9c:      	mov	rsi, qword ptr [rdx + 0x48]
     fa0:      	adc	rsi, qword ptr [rdx + 0x28]
     fa4:      	mov	rax, qword ptr [rdx + 0x50]
     fa8:      	adc	rax, qword ptr [rdx + 0x30]
     fac:      	mov	rcx, qword ptr [rdx + 0x58]
     fb0:      	adc	rcx, qword ptr [rdx + 0x38]
     fb4:      	setb	r11b
     fb8:      	xor	r9d, r9d
     fbb:      	mov	rdx, rdi
     fbe:      	inc	rdx
     fc1:      	setne	r9b
     fc5:      	lea	r8, [rsi + rbp]
     fc9:      	inc	r8
     fcc:      	mov	r10d, 0xffffffff
     fd2:      	cmp	rsi, r10
     fd5:      	setb	r10b
     fd9:      	sub	r8, r9
     fdc:      	setb	r9b
     fe0:      	or	r9b, r10b
     fe3:      	cmp	rcx, rbp
     fe6:      	seta	r14b
     fea:      	movzx	r10d, r9b
     fee:      	mov	r9, rax
     ff1:      	sub	r9, r10
     ff4:      	mov	r10d, 0xffffffff
     ffa:      	lea	r10, [rcx + r10]
     ffe:      	sbb	r10, 0x0
    1002:      	setae	r15b
    1006:      	and	r15b, r14b
    1009:      	or	r15b, r11b
    100c:      	movzx	r11d, r15b
    1010:      	mov	r14, r11
    1013:      	neg	r14
    1016:      	dec	r11
    1019:      	and	rdi, r11
    101c:      	and	rdx, r14
    101f:      	or	rdx, rdi
    1022:      	and	rsi, r11
    1025:      	and	r8, r14
    1028:      	or	r8, rsi
    102b:      	and	rax, r11
    102e:      	and	r9, r14
    1031:      	or	r9, rax
    1034:      	and	r11, rcx
    1037:      	and	r14, r10
    103a:      	or	r14, r11
    103d:      	mov	qword ptr [rsp + 0x60], rdx
    1042:      	mov	qword ptr [rsp + 0x68], r8
    1047:      	mov	qword ptr [rsp + 0x70], r9
    104c:      	mov	qword ptr [rsp + 0x78], r14
    1051:      	mov	r15, qword ptr [rip]    # 0x1058 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1058>
		0000000000001054:  R_X86_64_GOTPCREL	toyos_crypto::arch::x86_64::FEATURES-0x4
    1058:      	mov	eax, dword ptr [r15]
    105b:      	test	eax, eax
    105d:      	mov	r14, rbx
    1060:      	jns	0x1af1 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1af1>
    1066:      	not	eax
    1068:      	test	eax, 0x820
    106d:      	jne	0x1214 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1214>
    1073:      	lea	rax, [rsp + 0x60]
    1078:      	mov	rdx, qword ptr [rax]
    107b:      	mulx	rdi, rsi, qword ptr [rax + 0x8]
    1081:      	mulx	r8, r9, qword ptr [rax + 0x10]
    1087:      	add	rdi, r9
    108a:      	mulx	rbx, r9, qword ptr [rax + 0x18]
    1090:      	adc	r8, r9
    1093:      	adc	rbx, 0x0
    1097:      	mov	rdx, qword ptr [rax + 0x8]
    109b:      	mulx	r10, r9, qword ptr [rax + 0x10]
    10a1:      	add	r8, r9
    10a4:      	adc	rbx, r10
    10a7:      	mulx	r13, r9, qword ptr [rax + 0x18]
    10ad:      	adc	r13, 0x0
    10b1:      	add	rbx, r9
    10b4:      	adc	r13, 0x0
    10b8:      	mov	rdx, qword ptr [rax + 0x10]
    10bc:      	mulx	r11, r9, qword ptr [rax + 0x18]
    10c2:      	add	r13, r9
    10c5:      	adc	r11, 0x0
    10c9:      	xor	r12d, r12d
    10cc:      	add	rsi, rsi
    10cf:      	adc	rdi, rdi
    10d2:      	adc	r8, r8
    10d5:      	adc	rbx, rbx
    10d8:      	adc	r13, r13
    10db:      	adc	r11, r11
    10de:      	adc	r12, 0x0
    10e2:      	mov	rdx, qword ptr [rax]
    10e5:      	mulx	r10, rcx, rdx
    10ea:      	add	rsi, r10
    10ed:      	mov	rdx, qword ptr [rax + 0x8]
    10f1:      	mulx	r10, r9, rdx
    10f6:      	adc	rdi, r9
    10f9:      	adc	r8, r10
    10fc:      	mov	rdx, qword ptr [rax + 0x10]
    1100:      	mulx	r10, r9, rdx
    1105:      	adc	rbx, r9
    1108:      	adc	r13, r10
    110b:      	mov	rdx, qword ptr [rax + 0x18]
    110f:      	mulx	r10, r9, rdx
    1114:      	adc	r11, r9
    1117:      	adc	r12, r10
    111a:      	movabs	rax, -0xffffffff
    1124:      	mov	rdx, rcx
    1127:      	mulx	r10, r9, rax
    112c:      	shl	rdx, 0x20
    1130:      	shr	rcx, 0x20
    1134:      	add	rsi, rdx
    1137:      	adc	rdi, rcx
    113a:      	adc	r8, r9
    113d:      	adc	rbx, r10
    1140:      	adc	r13, 0x0
    1144:      	adc	r11, 0x0
    1148:      	adc	r12, 0x0
    114c:      	mov	ecx, 0x0
    1151:      	adc	rcx, 0x0
    1155:      	mov	rdx, rsi
    1158:      	mulx	r10, r9, rax
    115d:      	shl	rdx, 0x20
    1161:      	shr	rsi, 0x20
    1165:      	add	rdi, rdx
    1168:      	adc	r8, rsi
    116b:      	adc	rbx, r9
    116e:      	adc	r13, r10
    1171:      	adc	r11, 0x0
    1175:      	adc	r12, 0x0
    1179:      	adc	rcx, 0x0
    117d:      	mov	rdx, rdi
    1180:      	mulx	r10, r9, rax
    1185:      	shl	rdx, 0x20
    1189:      	shr	rdi, 0x20
    118d:      	add	r8, rdx
    1190:      	adc	rbx, rdi
    1193:      	adc	r13, r9
    1196:      	adc	r11, r10
    1199:      	adc	r12, 0x0
    119d:      	adc	rcx, 0x0
    11a1:      	mov	rdx, r8
    11a4:      	mulx	r10, r9, rax
    11a9:      	shl	rdx, 0x20
    11ad:      	shr	r8, 0x20
    11b1:      	add	rbx, rdx
    11b4:      	adc	r13, r8
    11b7:      	adc	r11, r9
    11ba:      	adc	r12, r10
    11bd:      	adc	rcx, 0x0
    11c1:      	mov	rsi, rbx
    11c4:      	mov	rdi, r13
    11c7:      	mov	r8, r11
    11ca:      	mov	rdx, r12
    11cd:      	mov	r9d, 0xffffffff
    11d3:      	sub	rsi, -0x1
    11d7:      	sbb	rdi, r9
    11da:      	sbb	r8, 0x0
    11de:      	sbb	rdx, rax
    11e1:      	sbb	rcx, 0x0
    11e5:      	cmovae	rbx, rsi
    11e9:      	cmovae	r13, rdi
    11ed:      	cmovae	r11, r8
    11f1:      	cmovae	r12, rdx
    11f5:      	mov	qword ptr [rsp + 0xd8], rbx
    11fd:      	mov	qword ptr [rsp + 0xe0], r13
    1205:      	mov	qword ptr [rsp + 0xe8], r12
    120d:      	mov	qword ptr [rsp + 0x38], r11
    1212:      	jmp	0x1255 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1255>
    1214:      	lea	rdi, [rsp + 0x8]
    1219:      	lea	rsi, [rsp + 0x60]
    121e:      	call	qword ptr [rip]         # 0x1224 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1224>
		0000000000001220:  R_X86_64_GOTPCREL	toyos_crypto::montgomery::p256::square_portable::<4>-0x4
    1224:      	mov	rax, qword ptr [rsp + 0x8]
    1229:      	mov	qword ptr [rsp + 0xd8], rax
    1231:      	mov	rax, qword ptr [rsp + 0x10]
    1236:      	mov	qword ptr [rsp + 0xe0], rax
    123e:      	mov	rax, qword ptr [rsp + 0x18]
    1243:      	mov	qword ptr [rsp + 0x38], rax
    1248:      	mov	rax, qword ptr [rsp + 0x20]
    124d:      	mov	qword ptr [rsp + 0xe8], rax
    1255:      	mov	rax, qword ptr [rsp + 0xb0]
    125d:      	mov	qword ptr [rsp + 0x100], rax
    1265:      	mov	rax, qword ptr [rsp + 0xb8]
    126d:      	mov	qword ptr [rsp + 0x108], rax
    1275:      	mov	rax, qword ptr [rsp + 0xc0]
    127d:      	mov	qword ptr [rsp + 0x110], rax
    1285:      	mov	rax, qword ptr [rsp + 0xc8]
    128d:      	mov	qword ptr [rsp + 0x118], rax
    1295:      	mov	eax, dword ptr [r15]
    1298:      	test	eax, eax
    129a:      	jns	0x1afc <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1afc>
    12a0:      	mov	qword ptr [rsp + 0x28], r14
    12a5:      	not	eax
    12a7:      	test	eax, 0x820
    12ac:      	jne	0x1441 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1441>
    12b2:      	lea	rax, [rsp + 0xb0]
    12ba:      	mov	rdx, qword ptr [rax]
    12bd:      	mulx	rdi, rsi, qword ptr [rax + 0x8]
    12c3:      	mulx	r8, r9, qword ptr [rax + 0x10]
    12c9:      	add	rdi, r9
    12cc:      	mulx	r11, r9, qword ptr [rax + 0x18]
    12d2:      	adc	r8, r9
    12d5:      	adc	r11, 0x0
    12d9:      	mov	rdx, qword ptr [rax + 0x8]
    12dd:      	mulx	r10, r9, qword ptr [rax + 0x10]
    12e3:      	add	r8, r9
    12e6:      	adc	r11, r10
    12e9:      	mulx	r12, r9, qword ptr [rax + 0x18]
    12ef:      	adc	r12, 0x0
    12f3:      	add	r11, r9
    12f6:      	adc	r12, 0x0
    12fa:      	mov	rdx, qword ptr [rax + 0x10]
    12fe:      	mulx	r14, r9, qword ptr [rax + 0x18]
    1304:      	add	r12, r9
    1307:      	adc	r14, 0x0
    130b:      	xor	r13d, r13d
    130e:      	add	rsi, rsi
    1311:      	adc	rdi, rdi
    1314:      	adc	r8, r8
    1317:      	adc	r11, r11
    131a:      	adc	r12, r12
    131d:      	adc	r14, r14
    1320:      	adc	r13, 0x0
    1324:      	mov	rdx, qword ptr [rax]
    1327:      	mulx	r10, rcx, rdx
    132c:      	add	rsi, r10
    132f:      	mov	rdx, qword ptr [rax + 0x8]
    1333:      	mulx	r10, r9, rdx
    1338:      	adc	rdi, r9
    133b:      	adc	r8, r10
    133e:      	mov	rdx, qword ptr [rax + 0x10]
    1342:      	mulx	r10, r9, rdx
    1347:      	adc	r11, r9
    134a:      	adc	r12, r10
    134d:      	mov	rdx, qword ptr [rax + 0x18]
    1351:      	mulx	r10, r9, rdx
    1356:      	adc	r14, r9
    1359:      	adc	r13, r10
    135c:      	movabs	rax, -0xffffffff
    1366:      	mov	rdx, rcx
    1369:      	mulx	r10, r9, rax
    136e:      	shl	rdx, 0x20
    1372:      	shr	rcx, 0x20
    1376:      	add	rsi, rdx
    1379:      	adc	rdi, rcx
    137c:      	adc	r8, r9
    137f:      	adc	r11, r10
    1382:      	adc	r12, 0x0
    1386:      	adc	r14, 0x0
    138a:      	adc	r13, 0x0
    138e:      	mov	ecx, 0x0
    1393:      	adc	rcx, 0x0
    1397:      	mov	rdx, rsi
    139a:      	mulx	r10, r9, rax
    139f:      	shl	rdx, 0x20
    13a3:      	shr	rsi, 0x20
    13a7:      	add	rdi, rdx
    13aa:      	adc	r8, rsi
    13ad:      	adc	r11, r9
    13b0:      	adc	r12, r10
    13b3:      	adc	r14, 0x0
    13b7:      	adc	r13, 0x0
    13bb:      	adc	rcx, 0x0
    13bf:      	mov	rdx, rdi
    13c2:      	mulx	r10, r9, rax
    13c7:      	shl	rdx, 0x20
    13cb:      	shr	rdi, 0x20
    13cf:      	add	r8, rdx
    13d2:      	adc	r11, rdi
    13d5:      	adc	r12, r9
    13d8:      	adc	r14, r10
    13db:      	adc	r13, 0x0
    13df:      	adc	rcx, 0x0
    13e3:      	mov	rdx, r8
    13e6:      	mulx	r10, r9, rax
    13eb:      	shl	rdx, 0x20
    13ef:      	shr	r8, 0x20
    13f3:      	add	r11, rdx
    13f6:      	adc	r12, r8
    13f9:      	adc	r14, r9
    13fc:      	adc	r13, r10
    13ff:      	adc	rcx, 0x0
    1403:      	mov	rsi, r11
    1406:      	mov	rdi, r12
    1409:      	mov	r8, r14
    140c:      	mov	rdx, r13
    140f:      	mov	r9d, 0xffffffff
    1415:      	sub	rsi, -0x1
    1419:      	sbb	rdi, r9
    141c:      	sbb	r8, 0x0
    1420:      	sbb	rdx, rax
    1423:      	sbb	rcx, 0x0
    1427:      	cmovae	r11, rsi
    142b:      	cmovae	r12, rdi
    142f:      	cmovae	r14, r8
    1433:      	cmovae	r13, rdx
    1437:      	mov	qword ptr [rsp + 0xd0], r11
    143f:      	jmp	0x1470 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1470>
    1441:      	lea	rdi, [rsp + 0x8]
    1446:      	lea	rsi, [rsp + 0xb0]
    144e:      	call	qword ptr [rip]         # 0x1454 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1454>
		0000000000001450:  R_X86_64_GOTPCREL	toyos_crypto::montgomery::p256::square_portable::<4>-0x4
    1454:      	mov	rax, qword ptr [rsp + 0x8]
    1459:      	mov	qword ptr [rsp + 0xd0], rax
    1461:      	mov	r12, qword ptr [rsp + 0x10]
    1466:      	mov	r14, qword ptr [rsp + 0x18]
    146b:      	mov	r13, qword ptr [rsp + 0x20]
    1470:      	mov	r8, qword ptr [rsp + 0x30]
    1475:      	sub	r8, qword ptr [rsp + 0x50]
    147a:      	mov	rdi, qword ptr [rsp + 0x128]
    1482:      	sbb	rdi, qword ptr [rsp + 0xf0]
    148a:      	mov	rbx, qword ptr [rsp + 0x120]
    1492:      	sbb	rbx, qword ptr [rsp + 0x28]
    1497:      	setb	al
    149a:      	mov	rbp, qword ptr [rsp + 0xf8]
    14a2:      	sub	rbp, qword ptr [rsp + 0x48]
    14a7:      	setb	cl
    14aa:      	movzx	eax, al
    14ad:      	sete	dl
    14b0:      	sub	rbp, rax
    14b3:      	and	al, dl
    14b5:      	or	al, cl
    14b7:      	movzx	eax, al
    14ba:      	mov	rcx, r8
    14bd:      	sub	rcx, rax
    14c0:      	neg	rax
    14c3:      	mov	edx, eax
    14c5:      	movabs	rsi, -0x100000000
    14cf:      	inc	rsi
    14d2:      	and	rax, rsi
    14d5:      	cmp	rcx, r8
    14d8:      	adc	rdx, rdi
    14db:      	adc	rbx, 0x0
    14df:      	adc	rax, rbp
    14e2:      	mov	qword ptr [rsp + 0x60], rcx
    14e7:      	mov	qword ptr [rsp + 0x68], rdx
    14ec:      	mov	qword ptr [rsp + 0x70], rbx
    14f1:      	mov	qword ptr [rsp + 0x78], rax
    14f6:      	mov	eax, dword ptr [r15]
    14f9:      	test	eax, eax
    14fb:      	jns	0x1b07 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1b07>
    1501:      	not	eax
    1503:      	test	eax, 0x820
    1508:      	jne	0x1730 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1730>
    150e:      	lea	rax, [rsp + 0x90]
    1516:      	lea	rcx, [rsp + 0x60]
    151b:      	movabs	rsi, -0xffffffff
    1525:      	mov	rdx, qword ptr [rax]
    1528:      	mulx	r8, rdi, qword ptr [rcx]
    152d:      	mulx	r9, rbp, qword ptr [rcx + 0x8]
    1533:      	add	r8, rbp
    1536:      	mulx	r10, rbp, qword ptr [rcx + 0x10]
    153c:      	adc	r9, rbp
    153f:      	mulx	r11, rbp, qword ptr [rcx + 0x18]
    1545:      	adc	r10, rbp
    1548:      	adc	r11, 0x0
    154c:      	xor	ebx, ebx
    154e:      	mov	rdx, rdi
    1551:      	mulx	r15, rbp, rsi
    1556:      	shl	rdx, 0x20
    155a:      	shr	rdi, 0x20
    155e:      	add	r8, rdx
    1561:      	adc	r9, rdi
    1564:      	adc	r10, rbp
    1567:      	adc	r11, r15
    156a:      	adc	rbx, 0x0
    156e:      	mov	rdx, qword ptr [rax + 0x8]
    1572:      	xor	edi, edi
    1574:      	mulx	r15, rbp, qword ptr [rcx]
    1579:      	adcx	r8, rbp
    157f:      	adox	r9, r15
    1585:      	mulx	r15, rbp, qword ptr [rcx + 0x8]
    158b:      	adcx	r9, rbp
    1591:      	adox	r10, r15
    1597:      	mulx	r15, rbp, qword ptr [rcx + 0x10]
    159d:      	adcx	r10, rbp
    15a3:      	adox	r11, r15
    15a9:      	mulx	r15, rbp, qword ptr [rcx + 0x18]
    15af:      	adcx	r11, rbp
    15b5:      	adox	rbx, r15
    15bb:      	adcx	rbx, rdi
    15c1:      	adox	rdi, rdi
    15c7:      	adc	rdi, 0x0
    15cb:      	mov	rdx, r8
    15ce:      	mulx	r15, rbp, rsi
    15d3:      	shl	rdx, 0x20
    15d7:      	shr	r8, 0x20
    15db:      	add	r9, rdx
    15de:      	adc	r10, r8
    15e1:      	adc	r11, rbp
    15e4:      	adc	rbx, r15
    15e7:      	adc	rdi, 0x0
    15eb:      	mov	rdx, qword ptr [rax + 0x10]
    15ef:      	xor	r8d, r8d
    15f2:      	mulx	r15, rbp, qword ptr [rcx]
    15f7:      	adcx	r9, rbp
    15fd:      	adox	r10, r15
    1603:      	mulx	r15, rbp, qword ptr [rcx + 0x8]
    1609:      	adcx	r10, rbp
    160f:      	adox	r11, r15
    1615:      	mulx	r15, rbp, qword ptr [rcx + 0x10]
    161b:      	adcx	r11, rbp
    1621:      	adox	rbx, r15
    1627:      	mulx	r15, rbp, qword ptr [rcx + 0x18]
    162d:      	adcx	rbx, rbp
    1633:      	adox	rdi, r15
    1639:      	adcx	rdi, r8
    163f:      	adox	r8, r8
    1645:      	adc	r8, 0x0
    1649:      	mov	rdx, r9
    164c:      	mulx	r15, rbp, rsi
    1651:      	shl	rdx, 0x20
    1655:      	shr	r9, 0x20
    1659:      	add	r10, rdx
    165c:      	adc	r11, r9
    165f:      	adc	rbx, rbp
    1662:      	adc	rdi, r15
    1665:      	adc	r8, 0x0
    1669:      	mov	rdx, qword ptr [rax + 0x18]
    166d:      	xor	r9d, r9d
    1670:      	mulx	r15, rbp, qword ptr [rcx]
    1675:      	adcx	r10, rbp
    167b:      	adox	r11, r15
    1681:      	mulx	r15, rbp, qword ptr [rcx + 0x8]
    1687:      	adcx	r11, rbp
    168d:      	adox	rbx, r15
    1693:      	mulx	r15, rbp, qword ptr [rcx + 0x10]
    1699:      	adcx	rbx, rbp
    169f:      	adox	rdi, r15
    16a5:      	mulx	r15, rbp, qword ptr [rcx + 0x18]
    16ab:      	adcx	rdi, rbp
    16b1:      	adox	r8, r15
    16b7:      	adcx	r8, r9
    16bd:      	adox	r9, r9
    16c3:      	adc	r9, 0x0
    16c7:      	mov	rdx, r10
    16ca:      	mulx	r15, rbp, rsi
    16cf:      	shl	rdx, 0x20
    16d3:      	shr	r10, 0x20
    16d7:      	add	r11, rdx
    16da:      	adc	rbx, r10
    16dd:      	adc	rdi, rbp
    16e0:      	adc	r8, r15
    16e3:      	adc	r9, 0x0
    16e7:      	mov	r10, r11
    16ea:      	mov	rbp, rbx
    16ed:      	mov	r15, rdi
    16f0:      	mov	rdx, r8
    16f3:      	mov	ecx, 0xffffffff
    16f8:      	sub	r10, -0x1
    16fc:      	sbb	rbp, rcx
    16ff:      	sbb	r15, 0x0
    1703:      	sbb	rdx, rsi
    1706:      	sbb	r9, 0x0
    170a:      	cmovae	r11, r10
    170e:      	cmovae	rbx, rbp
    1712:      	cmovae	rdi, r15
    1716:      	cmovae	r8, rdx
    171a:      	mov	qword ptr [rsp + 0x8], r11
    171f:      	mov	qword ptr [rsp + 0x10], rbx
    1724:      	mov	qword ptr [rsp + 0x18], rdi
    1729:      	mov	qword ptr [rsp + 0x20], r8
    172e:      	jmp	0x1748 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1748>
    1730:      	lea	rdi, [rsp + 0x8]
    1735:      	lea	rsi, [rsp + 0x90]
    173d:      	lea	rdx, [rsp + 0x60]
    1742:      	call	qword ptr [rip]         # 0x1748 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1748>
		0000000000001744:  R_X86_64_GOTPCREL	toyos_crypto::montgomery::p256::mul_portable::<4>-0x4
    1748:      	mov	rax, r13
    174b:      	shld	rax, r14, 0x1
    1750:      	shr	r13, 0x3f
    1754:      	movabs	rbp, -0x100000000
    175e:      	cmp	rax, rbp
    1761:      	seta	cl
    1764:      	shld	r14, r12, 0x1
    1769:      	mov	r9, qword ptr [rsp + 0xd0]
    1771:      	shld	r12, r9, 0x1
    1776:      	xor	edx, edx
    1778:      	mov	rsi, r12
    177b:      	shr	rsi, 0x20
    177f:      	sete	dl
    1782:      	mov	r8, r14
    1785:      	sub	r8, rdx
    1788:      	mov	edx, 0xffffffff
    178d:      	lea	rdi, [rax + rdx]
    1791:      	sbb	rdi, 0x0
    1795:      	setae	dl
    1798:      	and	dl, cl
    179a:      	movzx	ecx, dl
    179d:      	or	rcx, r13
    17a0:      	lea	rdx, [rcx - 0x1]
    17a4:      	and	rax, rdx
    17a7:      	neg	rcx
    17aa:      	and	rdi, rcx
    17ad:      	or	rdi, rax
    17b0:      	and	r14, rdx
    17b3:      	and	r8, rcx
    17b6:      	or	r8, r14
    17b9:      	lea	rax, [r9 + r9]
    17bd:      	and	rax, rdx
    17c0:      	and	rdx, r12
    17c3:      	add	r12, rbp
    17c6:      	and	r12, rcx
    17c9:      	or	r12, rdx
    17cc:      	lea	r15, [2*r9 + 0x1]
    17d4:      	and	r15, rcx
    17d7:      	or	r15, rax
    17da:      	mov	r10, qword ptr [rsp + 0xd8]
    17e2:      	sub	r10, qword ptr [rsp + 0x100]
    17ea:      	mov	r14, qword ptr [rsp + 0xe0]
    17f2:      	sbb	r14, qword ptr [rsp + 0x108]
    17fa:      	mov	rax, qword ptr [rsp + 0x38]
    17ff:      	sbb	rax, qword ptr [rsp + 0x110]
    1807:      	mov	rbx, rax
    180a:      	setb	al
    180d:      	mov	r11, qword ptr [rsp + 0xe8]
    1815:      	sub	r11, qword ptr [rsp + 0x118]
    181d:      	setb	cl
    1820:      	movzx	eax, al
    1823:      	sete	dl
    1826:      	sub	r11, rax
    1829:      	and	al, dl
    182b:      	or	al, cl
    182d:      	movzx	eax, al
    1830:      	mov	rdx, r10
    1833:      	sub	rdx, rax
    1836:      	neg	rax
    1839:      	mov	r9, rax
    183c:      	lea	r13, [rbp + 0x1]
    1840:      	and	r9, r13
    1843:      	cmp	rdx, r10
    1846:      	mov	r10d, eax
    1849:      	adc	r10, r14
    184c:      	mov	rcx, rbx
    184f:      	adc	rcx, 0x0
    1853:      	adc	r9, r11
    1856:      	sub	rdx, qword ptr [rsp + 0x58]
    185b:      	sbb	r10, qword ptr [rsp + 0x40]
    1860:      	sbb	rcx, qword ptr [rsp + 0x80]
    1868:      	setb	al
    186b:      	movzx	eax, al
    186e:      	mov	r11, rax
    1871:      	neg	r11
    1874:      	mov	r14, qword ptr [rsp + 0x88]
    187c:      	cmp	r9, r14
    187f:      	setb	sil
    1883:      	sete	bl
    1886:      	and	al, bl
    1888:      	or	al, sil
    188b:      	movzx	ebx, al
    188e:      	mov	rax, rdx
    1891:      	sub	rax, rbx
    1894:      	mov	rsi, rax
    1897:      	mov	qword ptr [rsp + 0x40], rax
    189c:      	neg	rbx
    189f:      	mov	rax, rbx
    18a2:      	and	rax, r13
    18a5:      	sub	rax, r14
    18a8:      	add	rax, r9
    18ab:      	cmp	rsi, rdx
    18ae:      	mov	edx, ebx
    18b0:      	adc	rdx, r10
    18b3:      	adc	rcx, 0x0
    18b7:      	mov	qword ptr [rsp + 0x38], rcx
    18bc:      	adc	rax, r11
    18bf:      	mov	rcx, rax
    18c2:      	mov	r11, rdi
    18c5:      	shld	r11, r8, 0x1
    18ca:      	shld	r8, r12, 0x1
    18cf:      	shld	r12, r15, 0x1
    18d4:      	xor	r10d, r10d
    18d7:      	mov	r9, r12
    18da:      	shr	r9, 0x20
    18de:      	sete	r10b
    18e2:      	mov	rax, rbp
    18e5:      	cmp	r11, rbp
    18e8:      	seta	bpl
    18ec:      	mov	r9, r8
    18ef:      	sub	r9, r10
    18f2:      	mov	esi, 0xffffffff
    18f7:      	lea	rbx, [r11 + rsi]
    18fb:      	sbb	rbx, 0x0
    18ff:      	setae	r10b
    1903:      	and	r10b, bpl
    1906:      	shr	rdi, 0x3f
    190a:      	movzx	r14d, r10b
    190e:      	or	r14, rdi
    1911:      	mov	r10, r14
    1914:      	neg	r10
    1917:      	dec	r14
    191a:      	lea	rdi, [r12 + rax]
    191e:      	mov	rbp, rax
    1921:      	and	r12, r14
    1924:      	and	rdi, r10
    1927:      	or	rdi, r12
    192a:      	and	r8, r14
    192d:      	and	r9, r10
    1930:      	or	r9, r8
    1933:      	mov	rax, r15
    1936:      	add	r15, r15
    1939:      	and	r15, r14
    193c:      	and	r14, r11
    193f:      	lea	rsi, [2*rax + 0x1]
    1947:      	and	rsi, r10
    194a:      	and	r10, rbx
    194d:      	or	r10, r14
    1950:      	mov	r8, r10
    1953:      	shld	r8, r9, 0x1
    1958:      	shld	r9, rdi, 0x1
    195d:      	or	rsi, r15
    1960:      	shld	rdi, rsi, 0x1
    1965:      	xor	ebx, ebx
    1967:      	mov	r11, rdi
    196a:      	shr	r11, 0x20
    196e:      	sete	bl
    1971:      	mov	eax, 0xffffffff
    1976:      	add	rax, r8
    1979:      	mov	r15, rbp
    197c:      	cmp	r8, rbp
    197f:      	seta	bpl
    1983:      	mov	r11, r9
    1986:      	sub	r11, rbx
    1989:      	sbb	rax, 0x0
    198d:      	setae	bl
    1990:      	and	bl, bpl
    1993:      	shr	r10, 0x3f
    1997:      	movzx	ebx, bl
    199a:      	or	rbx, r10
    199d:      	lea	r14, [rsi + rsi]
    19a1:      	lea	r10, [2*rsi + 0x1]
    19a9:      	mov	rsi, rbx
    19ac:      	neg	rsi
    19af:      	dec	rbx
    19b2:      	and	r14, rbx
    19b5:      	and	r10, rsi
    19b8:      	or	r10, r14
    19bb:      	lea	r14, [rdi + r15]
    19bf:      	and	rdi, rbx
    19c2:      	and	r14, rsi
    19c5:      	or	r14, rdi
    19c8:      	and	r9, rbx
    19cb:      	and	r11, rsi
    19ce:      	or	r11, r9
    19d1:      	and	rbx, r8
    19d4:      	and	rsi, rax
    19d7:      	or	rsi, rbx
    19da:      	mov	r9, qword ptr [rsp + 0x8]
    19df:      	sub	r9, r10
    19e2:      	mov	r8, qword ptr [rsp + 0x10]
    19e7:      	sbb	r8, r14
    19ea:      	mov	rdi, qword ptr [rsp + 0x18]
    19ef:      	sbb	rdi, r11
    19f2:      	setb	r10b
    19f6:      	movzx	r11d, r10b
    19fa:      	mov	r10, r11
    19fd:      	neg	r10
    1a00:      	mov	rbx, qword ptr [rsp + 0x20]
    1a05:      	cmp	rbx, rsi
    1a08:      	setb	bpl
    1a0c:      	sete	r14b
    1a10:      	and	r11b, r14b
    1a13:      	or	r11b, bpl
    1a16:      	movzx	r11d, r11b
    1a1a:      	mov	r14, r9
    1a1d:      	sub	r14, r11
    1a20:      	neg	r11
    1a23:      	and	r13, r11
    1a26:      	add	r13, rbx
    1a29:      	sub	r13, rsi
    1a2c:      	cmp	r14, r9
    1a2f:      	mov	esi, r11d
    1a32:      	adc	rsi, r8
    1a35:      	adc	rdi, 0x0
    1a39:      	adc	r13, r10
    1a3c:      	mov	rax, qword ptr [rsp + 0x130]
    1a44:      	mov	r8, qword ptr [rsp + 0x50]
    1a49:      	mov	qword ptr [rax], r8
    1a4c:      	mov	r8, qword ptr [rsp + 0xf0]
    1a54:      	mov	qword ptr [rax + 0x8], r8
    1a58:      	mov	r8, qword ptr [rsp + 0x28]
    1a5d:      	mov	qword ptr [rax + 0x10], r8
    1a61:      	mov	r8, qword ptr [rsp + 0x48]
    1a66:      	mov	qword ptr [rax + 0x18], r8
    1a6a:      	mov	qword ptr [rax + 0x20], r14
    1a6e:      	mov	qword ptr [rax + 0x28], rsi
    1a72:      	mov	qword ptr [rax + 0x30], rdi
    1a76:      	mov	qword ptr [rax + 0x38], r13
    1a7a:      	mov	rsi, qword ptr [rsp + 0x40]
    1a7f:      	mov	qword ptr [rax + 0x40], rsi
    1a83:      	mov	qword ptr [rax + 0x48], rdx
    1a87:      	mov	rdx, qword ptr [rsp + 0x38]
    1a8c:      	mov	qword ptr [rax + 0x50], rdx
    1a90:      	mov	qword ptr [rax + 0x58], rcx
    1a94:      	add	rsp, 0x138
    1a9b:      	pop	rbx
    1a9c:      	pop	r12
    1a9e:      	pop	r13
    1aa0:      	pop	r14
    1aa2:      	pop	r15
    1aa4:      	pop	rbp
    1aa5:      	ret
    1aa6:      	call	qword ptr [rip]         # 0x1aac <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1aac>
		0000000000001aa8:  R_X86_64_GOTPCREL	toyos_crypto::arch::x86_64::first_features-0x4
    1aac:      	jmp	0x2e <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x2e>
    1ab1:      	call	qword ptr [rip]         # 0x1ab7 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1ab7>
		0000000000001ab3:  R_X86_64_GOTPCREL	toyos_crypto::arch::x86_64::first_features-0x4
    1ab7:      	jmp	0x224 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x224>
    1abc:      	call	qword ptr [rip]         # 0x1ac2 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1ac2>
		0000000000001abe:  R_X86_64_GOTPCREL	toyos_crypto::arch::x86_64::first_features-0x4
    1ac2:      	jmp	0x411 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x411>
    1ac7:      	call	qword ptr [rip]         # 0x1acd <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1acd>
		0000000000001ac9:  R_X86_64_GOTPCREL	toyos_crypto::arch::x86_64::first_features-0x4
    1acd:      	jmp	0x7f4 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x7f4>
    1ad2:      	mov	qword ptr [rsp + 0x30], rcx
    1ad7:      	mov	qword ptr [rsp + 0x28], r9
    1adc:      	call	qword ptr [rip]         # 0x1ae2 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1ae2>
		0000000000001ade:  R_X86_64_GOTPCREL	toyos_crypto::arch::x86_64::first_features-0x4
    1ae2:      	mov	r9, qword ptr [rsp + 0x28]
    1ae7:      	mov	rcx, qword ptr [rsp + 0x30]
    1aec:      	jmp	0xca5 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0xca5>
    1af1:      	call	qword ptr [rip]         # 0x1af7 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1af7>
		0000000000001af3:  R_X86_64_GOTPCREL	toyos_crypto::arch::x86_64::first_features-0x4
    1af7:      	jmp	0x1066 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1066>
    1afc:      	call	qword ptr [rip]         # 0x1b02 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1b02>
		0000000000001afe:  R_X86_64_GOTPCREL	toyos_crypto::arch::x86_64::first_features-0x4
    1b02:      	jmp	0x12a0 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x12a0>
    1b07:      	call	qword ptr [rip]         # 0x1b0d <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1b0d>
		0000000000001b09:  R_X86_64_GOTPCREL	toyos_crypto::arch::x86_64::first_features-0x4
    1b0d:      	jmp	0x1501 <<toyos_crypto::nist::Point<toyos_crypto::nist::P256, 4>>::double+0x1501>
