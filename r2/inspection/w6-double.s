       0:      	push	rbp
       1:      	push	r15
       3:      	push	r14
       5:      	push	r13
       7:      	push	r12
       9:      	push	rbx
       a:      	sub	rsp, 0xa8
      11:      	mov	qword ptr [rsp + 0x80], rdi
      19:      	mov	rcx, qword ptr [rsi + 0x40]
      1d:      	mov	qword ptr [rsp - 0x60], rcx
      22:      	mov	r8, qword ptr [rsi + 0x48]
      26:      	mov	qword ptr [rsp - 0x28], r8
      2b:      	mov	rdi, qword ptr [rsi + 0x50]
      2f:      	mov	qword ptr [rsp - 0x68], rdi
      34:      	mov	r9, qword ptr [rsi + 0x58]
      38:      	mov	qword ptr [rsp - 0x30], r9
      3d:      	mov	rdx, rcx
      40:      	mulx	r11, r10, r8
      45:      	mulx	rbx, rbp, rdi
      4a:      	add	r11, rbp
      4d:      	mulx	r15, rbp, r9
      52:      	adc	rbx, rbp
      55:      	adc	r15, 0x0
      59:      	mov	rdx, r8
      5c:      	mulx	r14, rbp, rdi
      61:      	add	rbx, rbp
      64:      	adc	r15, r14
      67:      	mulx	r13, rbp, r9
      6c:      	adc	r13, 0x0
      70:      	add	r15, rbp
      73:      	adc	r13, 0x0
      77:      	mov	rdx, rdi
      7a:      	mulx	rax, rbp, r9
      7f:      	add	r13, rbp
      82:      	adc	rax, 0x0
      86:      	xor	r12d, r12d
      89:      	add	r10, r10
      8c:      	adc	r11, r11
      8f:      	adc	rbx, rbx
      92:      	adc	r15, r15
      95:      	adc	r13, r13
      98:      	adc	rax, rax
      9b:      	adc	r12, 0x0
      9f:      	mov	rdx, rcx
      a2:      	mulx	r14, rcx, rdx
      a7:      	add	r10, r14
      aa:      	mov	rdx, r8
      ad:      	mulx	r14, rbp, rdx
      b2:      	adc	r11, rbp
      b5:      	adc	rbx, r14
      b8:      	mov	rdx, rdi
      bb:      	mulx	r14, rbp, rdx
      c0:      	adc	r15, rbp
      c3:      	adc	r13, r14
      c6:      	mov	rdx, r9
      c9:      	mulx	r14, rbp, rdx
      ce:      	adc	rax, rbp
      d1:      	adc	r12, r14
      d4:      	movabs	r8, -0xffffffff
      de:      	mov	rdx, rcx
      e1:      	mulx	r14, rbp, r8
      e6:      	shl	rdx, 0x20
      ea:      	shr	rcx, 0x20
      ee:      	add	r10, rdx
      f1:      	adc	r11, rcx
      f4:      	adc	rbx, rbp
      f7:      	adc	r15, r14
      fa:      	adc	r13, 0x0
      fe:      	adc	rax, 0x0
     102:      	adc	r12, 0x0
     106:      	mov	ecx, 0x0
     10b:      	adc	rcx, 0x0
     10f:      	mov	rdx, r10
     112:      	mulx	r14, rbp, r8
     117:      	shl	rdx, 0x20
     11b:      	shr	r10, 0x20
     11f:      	add	r11, rdx
     122:      	adc	rbx, r10
     125:      	adc	r15, rbp
     128:      	adc	r13, r14
     12b:      	adc	rax, 0x0
     12f:      	adc	r12, 0x0
     133:      	adc	rcx, 0x0
     137:      	mov	rdx, r11
     13a:      	mulx	r14, rbp, r8
     13f:      	shl	rdx, 0x20
     143:      	shr	r11, 0x20
     147:      	add	rbx, rdx
     14a:      	adc	r15, r11
     14d:      	adc	r13, rbp
     150:      	adc	rax, r14
     153:      	adc	r12, 0x0
     157:      	adc	rcx, 0x0
     15b:      	mov	rdx, rbx
     15e:      	mulx	r14, rbp, r8
     163:      	shl	rdx, 0x20
     167:      	shr	rbx, 0x20
     16b:      	add	r15, rdx
     16e:      	adc	r13, rbx
     171:      	adc	rax, rbp
     174:      	adc	r12, r14
     177:      	adc	rcx, 0x0
     17b:      	mov	rdi, r15
     17e:      	mov	r9, r13
     181:      	mov	r10, rax
     184:      	mov	rdx, r12
     187:      	mov	ebp, 0xffffffff
     18c:      	sub	rdi, -0x1
     190:      	sbb	r9, rbp
     193:      	sbb	r10, 0x0
     197:      	sbb	rdx, r8
     19a:      	sbb	rcx, 0x0
     19e:      	cmovae	r15, rdi
     1a2:      	cmovae	r13, r9
     1a6:      	cmovae	rax, r10
     1aa:      	cmovae	r12, rdx
     1ae:      	mov	qword ptr [rsp - 0x38], r13
     1b3:      	mov	qword ptr [rsp - 0x40], r12
     1b8:      	mov	qword ptr [rsp - 0x48], r15
     1bd:      	mov	qword ptr [rsp - 0x8], rax
     1c2:      	mov	rcx, qword ptr [rsi + 0x20]
     1c6:      	mov	qword ptr [rsp + 0x58], rcx
     1cb:      	mov	r8, qword ptr [rsi + 0x28]
     1cf:      	mov	qword ptr [rsp + 0x40], r8
     1d4:      	mov	rdi, qword ptr [rsi + 0x30]
     1d8:      	mov	qword ptr [rsp + 0x50], rdi
     1dd:      	mov	r9, qword ptr [rsi + 0x38]
     1e1:      	mov	qword ptr [rsp + 0x48], r9
     1e6:      	mov	rdx, rcx
     1e9:      	mulx	r11, r10, r8
     1ee:      	mulx	rbx, rbp, rdi
     1f3:      	add	r11, rbp
     1f6:      	mulx	rax, rbp, r9
     1fb:      	adc	rbx, rbp
     1fe:      	adc	rax, 0x0
     202:      	mov	rdx, r8
     205:      	mulx	r14, rbp, rdi
     20a:      	add	rbx, rbp
     20d:      	adc	rax, r14
     210:      	mulx	r12, rbp, r9
     215:      	adc	r12, 0x0
     219:      	add	rax, rbp
     21c:      	adc	r12, 0x0
     220:      	mov	rdx, rdi
     223:      	mulx	r13, rbp, r9
     228:      	add	r12, rbp
     22b:      	adc	r13, 0x0
     22f:      	xor	r15d, r15d
     232:      	add	r10, r10
     235:      	adc	r11, r11
     238:      	adc	rbx, rbx
     23b:      	adc	rax, rax
     23e:      	adc	r12, r12
     241:      	adc	r13, r13
     244:      	adc	r15, 0x0
     248:      	mov	rdx, rcx
     24b:      	mulx	r14, rcx, rdx
     250:      	add	r10, r14
     253:      	mov	rdx, r8
     256:      	mulx	r14, rbp, rdx
     25b:      	adc	r11, rbp
     25e:      	adc	rbx, r14
     261:      	mov	rdx, rdi
     264:      	mulx	r14, rbp, rdx
     269:      	adc	rax, rbp
     26c:      	adc	r12, r14
     26f:      	mov	rdx, r9
     272:      	mulx	r14, rbp, rdx
     277:      	adc	r13, rbp
     27a:      	adc	r15, r14
     27d:      	movabs	r8, -0xffffffff
     287:      	mov	rdx, rcx
     28a:      	mulx	r14, rbp, r8
     28f:      	shl	rdx, 0x20
     293:      	shr	rcx, 0x20
     297:      	add	r10, rdx
     29a:      	adc	r11, rcx
     29d:      	adc	rbx, rbp
     2a0:      	adc	rax, r14
     2a3:      	adc	r12, 0x0
     2a7:      	adc	r13, 0x0
     2ab:      	adc	r15, 0x0
     2af:      	mov	ecx, 0x0
     2b4:      	adc	rcx, 0x0
     2b8:      	mov	rdx, r10
     2bb:      	mulx	r14, rbp, r8
     2c0:      	shl	rdx, 0x20
     2c4:      	shr	r10, 0x20
     2c8:      	add	r11, rdx
     2cb:      	adc	rbx, r10
     2ce:      	adc	rax, rbp
     2d1:      	adc	r12, r14
     2d4:      	adc	r13, 0x0
     2d8:      	adc	r15, 0x0
     2dc:      	adc	rcx, 0x0
     2e0:      	mov	rdx, r11
     2e3:      	mulx	r14, rbp, r8
     2e8:      	shl	rdx, 0x20
     2ec:      	shr	r11, 0x20
     2f0:      	add	rbx, rdx
     2f3:      	adc	rax, r11
     2f6:      	adc	r12, rbp
     2f9:      	adc	r13, r14
     2fc:      	adc	r15, 0x0
     300:      	adc	rcx, 0x0
     304:      	mov	rdx, rbx
     307:      	mulx	r14, rbp, r8
     30c:      	shl	rdx, 0x20
     310:      	shr	rbx, 0x20
     314:      	add	rax, rdx
     317:      	adc	r12, rbx
     31a:      	adc	r13, rbp
     31d:      	adc	r15, r14
     320:      	adc	rcx, 0x0
     324:      	mov	rdi, rax
     327:      	mov	r9, r12
     32a:      	mov	r10, r13
     32d:      	mov	rdx, r15
     330:      	mov	ebp, 0xffffffff
     335:      	sub	rdi, -0x1
     339:      	sbb	r9, rbp
     33c:      	sbb	r10, 0x0
     340:      	sbb	rdx, r8
     343:      	sbb	rcx, 0x0
     347:      	cmovae	rax, rdi
     34b:      	cmovae	r12, r9
     34f:      	cmovae	r13, r10
     353:      	cmovae	r15, rdx
     357:      	mov	qword ptr [rsp + 0x60], r15
     35c:      	mov	qword ptr [rsp + 0x68], r12
     361:      	mov	qword ptr [rsp + 0x70], r13
     366:      	mov	qword ptr [rsp + 0x78], rax
     36b:      	mov	qword ptr [rsp + 0x88], rax
     373:      	mov	qword ptr [rsp + 0x90], r12
     37b:      	mov	qword ptr [rsp + 0x98], r13
     383:      	mov	qword ptr [rsp + 0xa0], r15
     38b:      	mov	rdx, qword ptr [rsi]
     38e:      	mov	qword ptr [rsp - 0x50], rdx
     393:      	mov	rdi, qword ptr [rsi + 0x8]
     397:      	mov	r8, qword ptr [rsi + 0x10]
     39b:      	mov	rsi, qword ptr [rsi + 0x18]
     39f:      	mov	r10, rdi
     3a2:      	lea	rax, [rsp + 0x88]
     3aa:      	movabs	rcx, -0xffffffff
     3b4:      	mulx	r15, r14, qword ptr [rax]
     3b9:      	mulx	rbp, r9, qword ptr [rax + 0x8]
     3bf:      	add	r15, r9
     3c2:      	mulx	r12, r9, qword ptr [rax + 0x10]
     3c8:      	adc	rbp, r9
     3cb:      	mulx	r11, r9, qword ptr [rax + 0x18]
     3d1:      	adc	r12, r9
     3d4:      	adc	r11, 0x0
     3d8:      	xor	ebx, ebx
     3da:      	mov	rdx, r14
     3dd:      	mulx	r13, r9, rcx
     3e2:      	shl	rdx, 0x20
     3e6:      	shr	r14, 0x20
     3ea:      	add	r15, rdx
     3ed:      	adc	rbp, r14
     3f0:      	adc	r12, r9
     3f3:      	adc	r11, r13
     3f6:      	adc	rbx, 0x0
     3fa:      	mov	rdx, r10
     3fd:      	xor	r14d, r14d
     400:      	mulx	r13, r9, qword ptr [rax]
     405:      	adcx	r15, r9
     40b:      	adox	rbp, r13
     411:      	mulx	r13, r9, qword ptr [rax + 0x8]
     417:      	adcx	rbp, r9
     41d:      	adox	r12, r13
     423:      	mulx	r13, r9, qword ptr [rax + 0x10]
     429:      	adcx	r12, r9
     42f:      	adox	r11, r13
     435:      	mulx	r13, r9, qword ptr [rax + 0x18]
     43b:      	adcx	r11, r9
     441:      	adox	rbx, r13
     447:      	adcx	rbx, r14
     44d:      	adox	r14, r14
     453:      	adc	r14, 0x0
     457:      	mov	rdx, r15
     45a:      	mulx	r13, r9, rcx
     45f:      	shl	rdx, 0x20
     463:      	shr	r15, 0x20
     467:      	add	rbp, rdx
     46a:      	adc	r12, r15
     46d:      	adc	r11, r9
     470:      	adc	rbx, r13
     473:      	adc	r14, 0x0
     477:      	mov	rdx, r8
     47a:      	xor	r15d, r15d
     47d:      	mulx	r13, r9, qword ptr [rax]
     482:      	adcx	rbp, r9
     488:      	adox	r12, r13
     48e:      	mulx	r13, r9, qword ptr [rax + 0x8]
     494:      	adcx	r12, r9
     49a:      	adox	r11, r13
     4a0:      	mulx	r13, r9, qword ptr [rax + 0x10]
     4a6:      	adcx	r11, r9
     4ac:      	adox	rbx, r13
     4b2:      	mulx	r13, r9, qword ptr [rax + 0x18]
     4b8:      	adcx	rbx, r9
     4be:      	adox	r14, r13
     4c4:      	adcx	r14, r15
     4ca:      	adox	r15, r15
     4d0:      	adc	r15, 0x0
     4d4:      	mov	rdx, rbp
     4d7:      	mulx	r13, r9, rcx
     4dc:      	shl	rdx, 0x20
     4e0:      	shr	rbp, 0x20
     4e4:      	add	r12, rdx
     4e7:      	adc	r11, rbp
     4ea:      	adc	rbx, r9
     4ed:      	adc	r14, r13
     4f0:      	adc	r15, 0x0
     4f4:      	mov	rdx, rsi
     4f7:      	xor	ebp, ebp
     4f9:      	mulx	r13, r9, qword ptr [rax]
     4fe:      	adcx	r12, r9
     504:      	adox	r11, r13
     50a:      	mulx	r13, r9, qword ptr [rax + 0x8]
     510:      	adcx	r11, r9
     516:      	adox	rbx, r13
     51c:      	mulx	r13, r9, qword ptr [rax + 0x10]
     522:      	adcx	rbx, r9
     528:      	adox	r14, r13
     52e:      	mulx	r13, r9, qword ptr [rax + 0x18]
     534:      	adcx	r14, r9
     53a:      	adox	r15, r13
     540:      	adcx	r15, rbp
     546:      	adox	rbp, rbp
     54c:      	adc	rbp, 0x0
     550:      	mov	rdx, r12
     553:      	mulx	r13, r9, rcx
     558:      	shl	rdx, 0x20
     55c:      	shr	r12, 0x20
     560:      	add	r11, rdx
     563:      	adc	rbx, r12
     566:      	adc	r14, r9
     569:      	adc	r15, r13
     56c:      	adc	rbp, 0x0
     570:      	mov	r12, r11
     573:      	mov	r9, rbx
     576:      	mov	r13, r14
     579:      	mov	rdx, r15
     57c:      	mov	r10d, 0xffffffff
     582:      	sub	r12, -0x1
     586:      	sbb	r9, r10
     589:      	sbb	r13, 0x0
     58d:      	sbb	rdx, rcx
     590:      	sbb	rbp, 0x0
     594:      	cmovae	r11, r12
     598:      	cmovae	rbx, r9
     59c:      	cmovae	r14, r13
     5a0:      	cmovae	r15, rdx
     5a4:      	mov	qword ptr [rsp - 0x80], r15
     5a9:      	mov	qword ptr [rsp - 0x78], r14
     5ae:      	mov	qword ptr [rsp - 0x58], rbx
     5b3:      	mov	qword ptr [rsp - 0x70], r11
     5b8:      	mov	rbx, qword ptr [rsp - 0x38]
     5bd:      	mov	r9, rbx
     5c0:      	mov	rcx, qword ptr [rsp - 0x50]
     5c5:      	mov	rdx, rcx
     5c8:      	mov	r14, qword ptr [rsp - 0x40]
     5cd:      	mov	r10, r14
     5d0:      	mov	r12, rdi
     5d3:      	mov	r13, rsi
     5d6:      	mov	r11, qword ptr [rsp - 0x48]
     5db:      	mov	rbp, r11
     5de:      	mov	rax, r8
     5e1:      	mov	r15, qword ptr [rsp - 0x8]
     5e6:      	sub	rdx, rbp
     5e9:      	sbb	r12, r9
     5ec:      	sbb	rax, r15
     5ef:      	sbb	r13, r10
     5f2:      	sbb	rbp, rbp
     5f5:      	mov	r9, rbp
     5f8:      	shr	r9, 0x20
     5fc:      	mov	r10, rbp
     5ff:      	shl	r10, 0x20
     603:      	sub	r10, rbp
     606:      	add	rdx, rbp
     609:      	adc	r12, r9
     60c:      	adc	rax, 0x0
     610:      	adc	r13, r10
     613:      	mov	r9, rbx
     616:      	mov	r10, r14
     619:      	mov	rbp, r11
     61c:      	mov	r11, r15
     61f:      	xor	ebx, ebx
     621:      	add	rcx, rbp
     624:      	adc	rdi, r9
     627:      	adc	r8, r11
     62a:      	adc	rsi, r10
     62d:      	adc	rbx, 0x0
     631:      	mov	rbp, rcx
     634:      	mov	r9, rdi
     637:      	mov	r11, r8
     63a:      	mov	r10, rsi
     63d:      	mov	r14d, 0xffffffff
     643:      	movabs	r15, -0xffffffff
     64d:      	sub	rbp, -0x1
     651:      	sbb	r9, r14
     654:      	sbb	r11, 0x0
     658:      	sbb	r10, r15
     65b:      	sbb	rbx, 0x0
     65f:      	cmovae	rcx, rbp
     663:      	cmovae	rdi, r9
     667:      	cmovae	r8, r11
     66b:      	cmovae	rsi, r10
     66f:      	mov	qword ptr [rsp], rcx
     673:      	mov	qword ptr [rsp + 0x8], rdi
     678:      	mov	qword ptr [rsp + 0x10], r8
     67d:      	mov	qword ptr [rsp + 0x18], rsi
     682:      	mov	rcx, rsp
     685:      	movabs	r15, -0xffffffff
     68f:      	mulx	r14, rbx, qword ptr [rcx]
     694:      	mulx	rsi, r8, qword ptr [rcx + 0x8]
     69a:      	add	r14, r8
     69d:      	mulx	rdi, r8, qword ptr [rcx + 0x10]
     6a3:      	adc	rsi, r8
     6a6:      	mulx	r10, r8, qword ptr [rcx + 0x18]
     6ac:      	adc	rdi, r8
     6af:      	adc	r10, 0x0
     6b3:      	xor	r11d, r11d
     6b6:      	mov	rdx, rbx
     6b9:      	mulx	r9, r8, r15
     6be:      	shl	rdx, 0x20
     6c2:      	shr	rbx, 0x20
     6c6:      	add	r14, rdx
     6c9:      	adc	rsi, rbx
     6cc:      	adc	rdi, r8
     6cf:      	adc	r10, r9
     6d2:      	adc	r11, 0x0
     6d6:      	mov	rdx, r12
     6d9:      	xor	ebx, ebx
     6db:      	mulx	r9, r8, qword ptr [rcx]
     6e0:      	adcx	r14, r8
     6e6:      	adox	rsi, r9
     6ec:      	mulx	r9, r8, qword ptr [rcx + 0x8]
     6f2:      	adcx	rsi, r8
     6f8:      	adox	rdi, r9
     6fe:      	mulx	r9, r8, qword ptr [rcx + 0x10]
     704:      	adcx	rdi, r8
     70a:      	adox	r10, r9
     710:      	mulx	r9, r8, qword ptr [rcx + 0x18]
     716:      	adcx	r10, r8
     71c:      	adox	r11, r9
     722:      	adcx	r11, rbx
     728:      	adox	rbx, rbx
     72e:      	adc	rbx, 0x0
     732:      	mov	rdx, r14
     735:      	mulx	r9, r8, r15
     73a:      	shl	rdx, 0x20
     73e:      	shr	r14, 0x20
     742:      	add	rsi, rdx
     745:      	adc	rdi, r14
     748:      	adc	r10, r8
     74b:      	adc	r11, r9
     74e:      	adc	rbx, 0x0
     752:      	mov	rdx, rax
     755:      	xor	r14d, r14d
     758:      	mulx	r9, r8, qword ptr [rcx]
     75d:      	adcx	rsi, r8
     763:      	adox	rdi, r9
     769:      	mulx	r9, r8, qword ptr [rcx + 0x8]
     76f:      	adcx	rdi, r8
     775:      	adox	r10, r9
     77b:      	mulx	r9, r8, qword ptr [rcx + 0x10]
     781:      	adcx	r10, r8
     787:      	adox	r11, r9
     78d:      	mulx	r9, r8, qword ptr [rcx + 0x18]
     793:      	adcx	r11, r8
     799:      	adox	rbx, r9
     79f:      	adcx	rbx, r14
     7a5:      	adox	r14, r14
     7ab:      	adc	r14, 0x0
     7af:      	mov	rdx, rsi
     7b2:      	mulx	r9, r8, r15
     7b7:      	shl	rdx, 0x20
     7bb:      	shr	rsi, 0x20
     7bf:      	add	rdi, rdx
     7c2:      	adc	r10, rsi
     7c5:      	adc	r11, r8
     7c8:      	adc	rbx, r9
     7cb:      	adc	r14, 0x0
     7cf:      	mov	rdx, r13
     7d2:      	xor	esi, esi
     7d4:      	mulx	r9, r8, qword ptr [rcx]
     7d9:      	adcx	rdi, r8
     7df:      	adox	r10, r9
     7e5:      	mulx	r9, r8, qword ptr [rcx + 0x8]
     7eb:      	adcx	r10, r8
     7f1:      	adox	r11, r9
     7f7:      	mulx	r9, r8, qword ptr [rcx + 0x10]
     7fd:      	adcx	r11, r8
     803:      	adox	rbx, r9
     809:      	mulx	r9, r8, qword ptr [rcx + 0x18]
     80f:      	adcx	rbx, r8
     815:      	adox	r14, r9
     81b:      	adcx	r14, rsi
     821:      	adox	rsi, rsi
     827:      	adc	rsi, 0x0
     82b:      	mov	rdx, rdi
     82e:      	mulx	r9, r8, r15
     833:      	shl	rdx, 0x20
     837:      	shr	rdi, 0x20
     83b:      	add	r10, rdx
     83e:      	adc	r11, rdi
     841:      	adc	rbx, r8
     844:      	adc	r14, r9
     847:      	adc	rsi, 0x0
     84b:      	mov	rdi, r10
     84e:      	mov	r8, r11
     851:      	mov	r9, rbx
     854:      	mov	rdx, r14
     857:      	mov	r12d, 0xffffffff
     85d:      	sub	rdi, -0x1
     861:      	sbb	r8, r12
     864:      	sbb	r9, 0x0
     868:      	sbb	rdx, r15
     86b:      	sbb	rsi, 0x0
     86f:      	cmovae	r10, rdi
     873:      	cmovae	r11, r8
     877:      	cmovae	rbx, r9
     87b:      	cmovae	r14, rdx
     87f:      	mov	rcx, r11
     882:      	mov	r15, r14
     885:      	mov	r12, r10
     888:      	mov	r13, rbx
     88b:      	xor	r8d, r8d
     88e:      	add	r12, r12
     891:      	adc	rcx, rcx
     894:      	adc	r13, r13
     897:      	adc	r15, r15
     89a:      	adc	r8, 0x0
     89e:      	mov	rax, r12
     8a1:      	mov	rdx, rcx
     8a4:      	mov	rsi, r13
     8a7:      	mov	rdi, r15
     8aa:      	mov	r9d, 0xffffffff
     8b0:      	movabs	rbp, -0xffffffff
     8ba:      	sub	rax, -0x1
     8be:      	sbb	rdx, r9
     8c1:      	sbb	rsi, 0x0
     8c5:      	sbb	rdi, rbp
     8c8:      	sbb	r8, 0x0
     8cc:      	cmovae	r12, rax
     8d0:      	cmovae	rcx, rdx
     8d4:      	cmovae	r13, rsi
     8d8:      	cmovae	r15, rdi
     8dc:      	mov	rdi, r12
     8df:      	mov	r12, r13
     8e2:      	xor	eax, eax
     8e4:      	add	rdi, r10
     8e7:      	adc	rcx, r11
     8ea:      	adc	r12, rbx
     8ed:      	adc	r15, r14
     8f0:      	adc	rax, 0x0
     8f4:      	mov	r10, rdi
     8f7:      	mov	r11, rcx
     8fa:      	mov	rbx, r12
     8fd:      	mov	r14, r15
     900:      	mov	edx, 0xffffffff
     905:      	movabs	rsi, -0xffffffff
     90f:      	sub	r10, -0x1
     913:      	sbb	r11, rdx
     916:      	sbb	rbx, 0x0
     91a:      	sbb	r14, rsi
     91d:      	sbb	rax, 0x0
     921:      	cmovae	rdi, r10
     925:      	cmovae	rcx, r11
     929:      	cmovae	r12, rbx
     92d:      	cmovae	r15, r14
     931:      	mov	qword ptr [rsp + 0x38], r12
     936:      	mov	qword ptr [rsp + 0x30], rcx
     93b:      	mov	rbp, rdi
     93e:      	mov	qword ptr [rsp + 0x20], rdi
     943:      	mov	r13, r15
     946:      	mov	qword ptr [rsp + 0x28], r15
     94b:      	mov	r11, qword ptr [rsp - 0x80]
     950:      	mov	rbx, qword ptr [rsp - 0x78]
     955:      	mov	r14, qword ptr [rsp - 0x58]
     95a:      	mov	r15, qword ptr [rsp - 0x70]
     95f:      	xor	r8d, r8d
     962:      	add	r15, r15
     965:      	adc	r14, r14
     968:      	adc	rbx, rbx
     96b:      	adc	r11, r11
     96e:      	adc	r8, 0x0
     972:      	mov	rax, r15
     975:      	mov	rdx, r14
     978:      	mov	rsi, rbx
     97b:      	mov	rdi, r11
     97e:      	mov	r9d, 0xffffffff
     984:      	movabs	r10, -0xffffffff
     98e:      	sub	rax, -0x1
     992:      	sbb	rdx, r9
     995:      	sbb	rsi, 0x0
     999:      	sbb	rdi, r10
     99c:      	sbb	r8, 0x0
     9a0:      	cmovae	r15, rax
     9a4:      	cmovae	r14, rdx
     9a8:      	cmovae	rbx, rsi
     9ac:      	cmovae	r11, rdi
     9b0:      	xor	r8d, r8d
     9b3:      	add	r15, r15
     9b6:      	adc	r14, r14
     9b9:      	adc	rbx, rbx
     9bc:      	adc	r11, r11
     9bf:      	adc	r8, 0x0
     9c3:      	mov	rax, r15
     9c6:      	mov	rdx, r14
     9c9:      	mov	rsi, rbx
     9cc:      	mov	rdi, r11
     9cf:      	mov	r9d, 0xffffffff
     9d5:      	movabs	r10, -0xffffffff
     9df:      	sub	rax, -0x1
     9e3:      	sbb	rdx, r9
     9e6:      	sbb	rsi, 0x0
     9ea:      	sbb	rdi, r10
     9ed:      	sbb	r8, 0x0
     9f1:      	cmovae	r15, rax
     9f5:      	cmovae	r14, rdx
     9f9:      	cmovae	rbx, rsi
     9fd:      	cmovae	r11, rdi
     a01:      	mov	qword ptr [rsp - 0x80], r11
     a06:      	mov	qword ptr [rsp - 0x78], rbx
     a0b:      	mov	qword ptr [rsp - 0x70], r15
     a10:      	mov	qword ptr [rsp - 0x58], r14
     a15:      	mov	rax, r12
     a18:      	mov	rsi, rcx
     a1b:      	mov	rdi, r13
     a1e:      	mov	r8, rbp
     a21:      	mov	rdx, r8
     a24:      	mulx	r10, r9, rsi
     a29:      	mulx	r11, rbx, rax
     a2e:      	add	r10, rbx
     a31:      	mulx	rcx, rbx, rdi
     a36:      	adc	r11, rbx
     a39:      	adc	rcx, 0x0
     a3d:      	mov	rdx, rsi
     a40:      	mulx	rbp, rbx, rax
     a45:      	add	r11, rbx
     a48:      	adc	rcx, rbp
     a4b:      	mulx	r13, rbx, rdi
     a50:      	adc	r13, 0x0
     a54:      	add	rcx, rbx
     a57:      	adc	r13, 0x0
     a5b:      	mov	rdx, rax
     a5e:      	mulx	r12, rbx, rdi
     a63:      	add	r13, rbx
     a66:      	adc	r12, 0x0
     a6a:      	xor	r15d, r15d
     a6d:      	add	r9, r9
     a70:      	adc	r10, r10
     a73:      	adc	r11, r11
     a76:      	adc	rcx, rcx
     a79:      	adc	r13, r13
     a7c:      	adc	r12, r12
     a7f:      	adc	r15, 0x0
     a83:      	mov	rdx, r8
     a86:      	mulx	rbp, r8, rdx
     a8b:      	add	r9, rbp
     a8e:      	mov	rdx, rsi
     a91:      	mulx	rbp, rbx, rdx
     a96:      	adc	r10, rbx
     a99:      	adc	r11, rbp
     a9c:      	mov	rdx, rax
     a9f:      	mulx	rbp, rbx, rdx
     aa4:      	adc	rcx, rbx
     aa7:      	adc	r13, rbp
     aaa:      	mov	rdx, rdi
     aad:      	mulx	rbp, rbx, rdx
     ab2:      	adc	r12, rbx
     ab5:      	adc	r15, rbp
     ab8:      	movabs	rsi, -0xffffffff
     ac2:      	mov	rdx, r8
     ac5:      	mulx	rbp, rbx, rsi
     aca:      	shl	rdx, 0x20
     ace:      	shr	r8, 0x20
     ad2:      	add	r9, rdx
     ad5:      	adc	r10, r8
     ad8:      	adc	r11, rbx
     adb:      	adc	rcx, rbp
     ade:      	adc	r13, 0x0
     ae2:      	adc	r12, 0x0
     ae6:      	adc	r15, 0x0
     aea:      	mov	r8d, 0x0
     af0:      	adc	r8, 0x0
     af4:      	mov	rdx, r9
     af7:      	mulx	rbp, rbx, rsi
     afc:      	shl	rdx, 0x20
     b00:      	shr	r9, 0x20
     b04:      	add	r10, rdx
     b07:      	adc	r11, r9
     b0a:      	adc	rcx, rbx
     b0d:      	adc	r13, rbp
     b10:      	adc	r12, 0x0
     b14:      	adc	r15, 0x0
     b18:      	adc	r8, 0x0
     b1c:      	mov	rdx, r10
     b1f:      	mulx	rbp, rbx, rsi
     b24:      	shl	rdx, 0x20
     b28:      	shr	r10, 0x20
     b2c:      	add	r11, rdx
     b2f:      	adc	rcx, r10
     b32:      	adc	r13, rbx
     b35:      	adc	r12, rbp
     b38:      	adc	r15, 0x0
     b3c:      	adc	r8, 0x0
     b40:      	mov	rdx, r11
     b43:      	mulx	rbp, rbx, rsi
     b48:      	shl	rdx, 0x20
     b4c:      	shr	r11, 0x20
     b50:      	add	rcx, rdx
     b53:      	adc	r13, r11
     b56:      	adc	r12, rbx
     b59:      	adc	r15, rbp
     b5c:      	adc	r8, 0x0
     b60:      	mov	rax, rcx
     b63:      	mov	rdi, r13
     b66:      	mov	r9, r12
     b69:      	mov	rdx, r15
     b6c:      	mov	ebx, 0xffffffff
     b71:      	sub	rax, -0x1
     b75:      	sbb	rdi, rbx
     b78:      	sbb	r9, 0x0
     b7c:      	sbb	rdx, rsi
     b7f:      	sbb	r8, 0x0
     b83:      	cmovae	rcx, rax
     b87:      	cmovae	r13, rdi
     b8b:      	cmovae	r12, r9
     b8f:      	cmovae	r15, rdx
     b93:      	mov	rax, r14
     b96:      	mov	rdx, qword ptr [rsp - 0x80]
     b9b:      	mov	rsi, qword ptr [rsp - 0x70]
     ba0:      	mov	rdi, qword ptr [rsp - 0x78]
     ba5:      	xor	ebx, ebx
     ba7:      	add	rsi, rsi
     baa:      	adc	rax, rax
     bad:      	adc	rdi, rdi
     bb0:      	adc	rdx, rdx
     bb3:      	adc	rbx, 0x0
     bb7:      	mov	r8, rsi
     bba:      	mov	r9, rax
     bbd:      	mov	r10, rdi
     bc0:      	mov	r11, rdx
     bc3:      	mov	ebp, 0xffffffff
     bc8:      	movabs	r14, -0xffffffff
     bd2:      	sub	r8, -0x1
     bd6:      	sbb	r9, rbp
     bd9:      	sbb	r10, 0x0
     bdd:      	sbb	r11, r14
     be0:      	sbb	rbx, 0x0
     be4:      	cmovae	rsi, r8
     be8:      	cmovae	rax, r9
     bec:      	cmovae	rdi, r10
     bf0:      	cmovae	rdx, r11
     bf4:      	sub	rcx, rsi
     bf7:      	sbb	r13, rax
     bfa:      	sbb	r12, rdi
     bfd:      	sbb	r15, rdx
     c00:      	sbb	rsi, rsi
     c03:      	mov	rax, rsi
     c06:      	shr	rax, 0x20
     c0a:      	mov	rdx, rsi
     c0d:      	shl	rdx, 0x20
     c11:      	sub	rdx, rsi
     c14:      	add	rcx, rsi
     c17:      	adc	r13, rax
     c1a:      	adc	r12, 0x0
     c1e:      	adc	r15, rdx
     c21:      	mov	qword ptr [rsp - 0x20], rcx
     c26:      	mov	qword ptr [rsp - 0x18], r13
     c2b:      	mov	qword ptr [rsp - 0x10], r12
     c30:      	mov	qword ptr [rsp - 0x50], r15
     c35:      	mov	r8, qword ptr [rsp + 0x40]
     c3a:      	mov	rdi, qword ptr [rsp - 0x60]
     c3f:      	mov	r9, qword ptr [rsp - 0x68]
     c44:      	mov	r10, qword ptr [rsp - 0x28]
     c49:      	mov	r11, qword ptr [rsp - 0x30]
     c4e:      	mov	r14, qword ptr [rsp + 0x58]
     c53:      	mov	r15, qword ptr [rsp + 0x50]
     c58:      	mov	r12, qword ptr [rsp + 0x48]
     c5d:      	xor	eax, eax
     c5f:      	add	r14, rdi
     c62:      	adc	r8, r10
     c65:      	adc	r15, r9
     c68:      	adc	r12, r11
     c6b:      	adc	rax, 0x0
     c6f:      	mov	rdi, r14
     c72:      	mov	r10, r8
     c75:      	mov	r9, r15
     c78:      	mov	r11, r12
     c7b:      	mov	edx, 0xffffffff
     c80:      	movabs	rsi, -0xffffffff
     c8a:      	sub	rdi, -0x1
     c8e:      	sbb	r10, rdx
     c91:      	sbb	r9, 0x0
     c95:      	sbb	r11, rsi
     c98:      	sbb	rax, 0x0
     c9c:      	cmovae	r14, rdi
     ca0:      	cmovae	r8, r10
     ca4:      	cmovae	r15, r9
     ca8:      	cmovae	r12, r11
     cac:      	mov	rdx, r14
     caf:      	mulx	rsi, rax, r8
     cb4:      	mulx	rdi, r11, r15
     cb9:      	add	rsi, r11
     cbc:      	mulx	r9, r11, r12
     cc1:      	adc	rdi, r11
     cc4:      	adc	r9, 0x0
     cc8:      	mov	rdx, r8
     ccb:      	mulx	rbx, r11, r15
     cd0:      	add	rdi, r11
     cd3:      	adc	r9, rbx
     cd6:      	mulx	r10, r11, r12
     cdb:      	adc	r10, 0x0
     cdf:      	add	r9, r11
     ce2:      	adc	r10, 0x0
     ce6:      	mov	rdx, r15
     ce9:      	mulx	r13, r11, r12
     cee:      	add	r10, r11
     cf1:      	adc	r13, 0x0
     cf5:      	xor	ecx, ecx
     cf7:      	add	rax, rax
     cfa:      	adc	rsi, rsi
     cfd:      	adc	rdi, rdi
     d00:      	adc	r9, r9
     d03:      	adc	r10, r10
     d06:      	adc	r13, r13
     d09:      	adc	rcx, 0x0
     d0d:      	mov	rdx, r14
     d10:      	mulx	rbx, r14, rdx
     d15:      	add	rax, rbx
     d18:      	mov	rdx, r8
     d1b:      	mulx	rbx, r11, rdx
     d20:      	adc	rsi, r11
     d23:      	adc	rdi, rbx
     d26:      	mov	rdx, r15
     d29:      	mulx	rbx, r11, rdx
     d2e:      	adc	r9, r11
     d31:      	adc	r10, rbx
     d34:      	mov	rdx, r12
     d37:      	mulx	rbx, r11, rdx
     d3c:      	adc	r13, r11
     d3f:      	adc	rcx, rbx
     d42:      	movabs	r8, -0xffffffff
     d4c:      	mov	rdx, r14
     d4f:      	mulx	rbx, r11, r8
     d54:      	shl	rdx, 0x20
     d58:      	shr	r14, 0x20
     d5c:      	add	rax, rdx
     d5f:      	adc	rsi, r14
     d62:      	adc	rdi, r11
     d65:      	adc	r9, rbx
     d68:      	adc	r10, 0x0
     d6c:      	adc	r13, 0x0
     d70:      	adc	rcx, 0x0
     d74:      	mov	r14d, 0x0
     d7a:      	adc	r14, 0x0
     d7e:      	mov	rdx, rax
     d81:      	mulx	rbx, r11, r8
     d86:      	shl	rdx, 0x20
     d8a:      	shr	rax, 0x20
     d8e:      	add	rsi, rdx
     d91:      	adc	rdi, rax
     d94:      	adc	r9, r11
     d97:      	adc	r10, rbx
     d9a:      	adc	r13, 0x0
     d9e:      	adc	rcx, 0x0
     da2:      	adc	r14, 0x0
     da6:      	mov	rdx, rsi
     da9:      	mulx	rbx, r11, r8
     dae:      	shl	rdx, 0x20
     db2:      	shr	rsi, 0x20
     db6:      	add	rdi, rdx
     db9:      	adc	r9, rsi
     dbc:      	adc	r10, r11
     dbf:      	adc	r13, rbx
     dc2:      	adc	rcx, 0x0
     dc6:      	adc	r14, 0x0
     dca:      	mov	rdx, rdi
     dcd:      	mulx	rbx, r11, r8
     dd2:      	shl	rdx, 0x20
     dd6:      	shr	rdi, 0x20
     dda:      	add	r9, rdx
     ddd:      	adc	r10, rdi
     de0:      	adc	r13, r11
     de3:      	adc	rcx, rbx
     de6:      	adc	r14, 0x0
     dea:      	mov	r15, r9
     ded:      	mov	r12, r10
     df0:      	mov	rax, r13
     df3:      	mov	rdx, rcx
     df6:      	mov	r11d, 0xffffffff
     dfc:      	sub	r15, -0x1
     e00:      	sbb	r12, r11
     e03:      	sbb	rax, 0x0
     e07:      	sbb	rdx, r8
     e0a:      	sbb	r14, 0x0
     e0e:      	cmovae	r9, r15
     e12:      	cmovae	r10, r12
     e16:      	cmovae	r13, rax
     e1a:      	cmovae	rcx, rdx
     e1e:      	mov	qword ptr [rsp - 0x60], r10
     e23:      	mov	qword ptr [rsp - 0x68], r9
     e28:      	mov	r9, qword ptr [rsp + 0x68]
     e2d:      	mov	rax, r9
     e30:      	mov	rbp, qword ptr [rsp + 0x60]
     e35:      	mov	rdx, rbp
     e38:      	mov	r8, qword ptr [rsp + 0x78]
     e3d:      	mov	rsi, r8
     e40:      	mov	r10, qword ptr [rsp + 0x70]
     e45:      	mov	rdi, rcx
     e48:      	mov	r11, qword ptr [rsp - 0x60]
     e4d:      	mov	rbx, qword ptr [rsp - 0x68]
     e52:      	sub	rbx, rsi
     e55:      	sbb	r11, rax
     e58:      	sbb	r13, r10
     e5b:      	sbb	rdi, rdx
     e5e:      	sbb	rsi, rsi
     e61:      	mov	rax, rsi
     e64:      	shr	rax, 0x20
     e68:      	mov	rdx, rsi
     e6b:      	shl	rdx, 0x20
     e6f:      	sub	rdx, rsi
     e72:      	add	rbx, rsi
     e75:      	adc	r11, rax
     e78:      	adc	r13, 0x0
     e7c:      	adc	rdi, rdx
     e7f:      	mov	rax, qword ptr [rsp - 0x38]
     e84:      	mov	rcx, qword ptr [rsp - 0x40]
     e89:      	mov	rdx, qword ptr [rsp - 0x48]
     e8e:      	mov	rsi, qword ptr [rsp - 0x8]
     e93:      	sub	rbx, rdx
     e96:      	sbb	r11, rax
     e99:      	sbb	r13, rsi
     e9c:      	sbb	rdi, rcx
     e9f:      	sbb	rdx, rdx
     ea2:      	mov	rax, rdx
     ea5:      	shr	rax, 0x20
     ea9:      	mov	rcx, rdx
     eac:      	shl	rcx, 0x20
     eb0:      	sub	rcx, rdx
     eb3:      	add	rbx, rdx
     eb6:      	adc	r11, rax
     eb9:      	adc	r13, 0x0
     ebd:      	adc	rdi, rcx
     ec0:      	mov	qword ptr [rsp - 0x68], rbx
     ec5:      	mov	qword ptr [rsp - 0x60], r11
     eca:      	mov	qword ptr [rsp - 0x30], r13
     ecf:      	mov	qword ptr [rsp - 0x28], rdi
     ed4:      	mov	rdx, r8
     ed7:      	mulx	r11, rax, r9
     edc:      	mulx	rbx, r14, r10
     ee1:      	add	r11, r14
     ee4:      	mulx	r13, r14, rbp
     ee9:      	adc	rbx, r14
     eec:      	adc	r13, 0x0
     ef0:      	mov	rdx, r9
     ef3:      	mulx	r15, r14, r10
     ef8:      	add	rbx, r14
     efb:      	adc	r13, r15
     efe:      	mulx	rdi, r14, rbp
     f03:      	adc	rdi, 0x0
     f07:      	add	r13, r14
     f0a:      	adc	rdi, 0x0
     f0e:      	mov	rdx, r10
     f11:      	mulx	rcx, r14, rbp
     f16:      	add	rdi, r14
     f19:      	adc	rcx, 0x0
     f1d:      	xor	esi, esi
     f1f:      	add	rax, rax
     f22:      	adc	r11, r11
     f25:      	adc	rbx, rbx
     f28:      	adc	r13, r13
     f2b:      	adc	rdi, rdi
     f2e:      	adc	rcx, rcx
     f31:      	adc	rsi, 0x0
     f35:      	mov	rdx, r8
     f38:      	mulx	r15, r8, rdx
     f3d:      	add	rax, r15
     f40:      	mov	rdx, r9
     f43:      	mulx	r15, r14, rdx
     f48:      	adc	r11, r14
     f4b:      	adc	rbx, r15
     f4e:      	mov	rdx, r10
     f51:      	mulx	r15, r14, rdx
     f56:      	adc	r13, r14
     f59:      	adc	rdi, r15
     f5c:      	mov	rdx, rbp
     f5f:      	mulx	r15, r14, rdx
     f64:      	adc	rcx, r14
     f67:      	adc	rsi, r15
     f6a:      	movabs	r9, -0xffffffff
     f74:      	mov	rdx, r8
     f77:      	mulx	r15, r14, r9
     f7c:      	shl	rdx, 0x20
     f80:      	shr	r8, 0x20
     f84:      	add	rax, rdx
     f87:      	adc	r11, r8
     f8a:      	adc	rbx, r14
     f8d:      	adc	r13, r15
     f90:      	adc	rdi, 0x0
     f94:      	adc	rcx, 0x0
     f98:      	adc	rsi, 0x0
     f9c:      	mov	r8d, 0x0
     fa2:      	adc	r8, 0x0
     fa6:      	mov	rdx, rax
     fa9:      	mulx	r15, r14, r9
     fae:      	shl	rdx, 0x20
     fb2:      	shr	rax, 0x20
     fb6:      	add	r11, rdx
     fb9:      	adc	rbx, rax
     fbc:      	adc	r13, r14
     fbf:      	adc	rdi, r15
     fc2:      	adc	rcx, 0x0
     fc6:      	adc	rsi, 0x0
     fca:      	adc	r8, 0x0
     fce:      	mov	rdx, r11
     fd1:      	mulx	r15, r14, r9
     fd6:      	shl	rdx, 0x20
     fda:      	shr	r11, 0x20
     fde:      	add	rbx, rdx
     fe1:      	adc	r13, r11
     fe4:      	adc	rdi, r14
     fe7:      	adc	rcx, r15
     fea:      	adc	rsi, 0x0
     fee:      	adc	r8, 0x0
     ff2:      	mov	rdx, rbx
     ff5:      	mulx	r15, r14, r9
     ffa:      	shl	rdx, 0x20
     ffe:      	shr	rbx, 0x20
    1002:      	add	r13, rdx
    1005:      	adc	rdi, rbx
    1008:      	adc	rcx, r14
    100b:      	adc	rsi, r15
    100e:      	adc	r8, 0x0
    1012:      	mov	r10, r13
    1015:      	mov	rbp, rdi
    1018:      	mov	rax, rcx
    101b:      	mov	rdx, rsi
    101e:      	mov	r14d, 0xffffffff
    1024:      	sub	r10, -0x1
    1028:      	sbb	rbp, r14
    102b:      	sbb	rax, 0x0
    102f:      	sbb	rdx, r9
    1032:      	sbb	r8, 0x0
    1036:      	cmovae	r13, r10
    103a:      	cmovae	rdi, rbp
    103e:      	cmovae	rcx, rax
    1042:      	cmovae	rsi, rdx
    1046:      	xor	r14d, r14d
    1049:      	add	r13, r13
    104c:      	adc	rdi, rdi
    104f:      	adc	rcx, rcx
    1052:      	adc	rsi, rsi
    1055:      	adc	r14, 0x0
    1059:      	mov	rax, r13
    105c:      	mov	rdx, rdi
    105f:      	mov	r11, rcx
    1062:      	mov	rbx, rsi
    1065:      	mov	r15d, 0xffffffff
    106b:      	movabs	rbp, -0xffffffff
    1075:      	sub	rax, -0x1
    1079:      	sbb	rdx, r15
    107c:      	sbb	r11, 0x0
    1080:      	sbb	rbx, rbp
    1083:      	sbb	r14, 0x0
    1087:      	cmovae	r13, rax
    108b:      	cmovae	rdi, rdx
    108f:      	cmovae	rcx, r11
    1093:      	cmovae	rsi, rbx
    1097:      	mov	qword ptr [rsp - 0x48], rdi
    109c:      	mov	qword ptr [rsp - 0x40], rcx
    10a1:      	mov	qword ptr [rsp - 0x38], rsi
    10a6:      	mov	rax, qword ptr [rsp - 0x18]
    10ab:      	mov	rdx, qword ptr [rsp - 0x50]
    10b0:      	mov	r11, qword ptr [rsp - 0x20]
    10b5:      	mov	rcx, qword ptr [rsp - 0x10]
    10ba:      	mov	r8, qword ptr [rsp - 0x80]
    10bf:      	mov	r9, qword ptr [rsp - 0x78]
    10c4:      	mov	r10, qword ptr [rsp - 0x58]
    10c9:      	mov	rbx, qword ptr [rsp - 0x70]
    10ce:      	sub	rbx, r11
    10d1:      	sbb	r10, rax
    10d4:      	sbb	r9, rcx
    10d7:      	sbb	r8, rdx
    10da:      	sbb	r11, r11
    10dd:      	mov	rax, r11
    10e0:      	shr	rax, 0x20
    10e4:      	mov	rdx, r11
    10e7:      	shl	rdx, 0x20
    10eb:      	sub	rdx, r11
    10ee:      	add	rbx, r11
    10f1:      	adc	r10, rax
    10f4:      	adc	r9, 0x0
    10f8:      	adc	r8, rdx
    10fb:      	mov	qword ptr [rsp], rbx
    10ff:      	mov	qword ptr [rsp + 0x8], r10
    1104:      	mov	qword ptr [rsp + 0x10], r9
    1109:      	mov	qword ptr [rsp + 0x18], r8
    110e:      	mov	rdx, qword ptr [rsp + 0x20]
    1113:      	movabs	r10, -0xffffffff
    111d:      	mov	rcx, qword ptr [rsp + 0x38]
    1122:      	mov	r11, qword ptr [rsp + 0x30]
    1127:      	mov	rbx, qword ptr [rsp + 0x28]
    112c:      	mov	r12, rsp
    112f:      	mulx	rsi, r14, qword ptr [r12]
    1135:      	mulx	rbp, r8, qword ptr [r12 + 0x8]
    113c:      	add	rsi, r8
    113f:      	mulx	rax, r8, qword ptr [r12 + 0x10]
    1146:      	adc	rbp, r8
    1149:      	mulx	rdi, r8, qword ptr [r12 + 0x18]
    1150:      	adc	rax, r8
    1153:      	adc	rdi, 0x0
    1157:      	xor	r15d, r15d
    115a:      	mov	rdx, r14
    115d:      	mulx	r9, r8, r10
    1162:      	shl	rdx, 0x20
    1166:      	shr	r14, 0x20
    116a:      	add	rsi, rdx
    116d:      	adc	rbp, r14
    1170:      	adc	rax, r8
    1173:      	adc	rdi, r9
    1176:      	adc	r15, 0x0
    117a:      	mov	rdx, r11
    117d:      	xor	r14d, r14d
    1180:      	mulx	r9, r8, qword ptr [r12]
    1186:      	adcx	rsi, r8
    118c:      	adox	rbp, r9
    1192:      	mulx	r9, r8, qword ptr [r12 + 0x8]
    1199:      	adcx	rbp, r8
    119f:      	adox	rax, r9
    11a5:      	mulx	r9, r8, qword ptr [r12 + 0x10]
    11ac:      	adcx	rax, r8
    11b2:      	adox	rdi, r9
    11b8:      	mulx	r9, r8, qword ptr [r12 + 0x18]
    11bf:      	adcx	rdi, r8
    11c5:      	adox	r15, r9
    11cb:      	adcx	r15, r14
    11d1:      	adox	r14, r14
    11d7:      	adc	r14, 0x0
    11db:      	mov	rdx, rsi
    11de:      	mulx	r9, r8, r10
    11e3:      	shl	rdx, 0x20
    11e7:      	shr	rsi, 0x20
    11eb:      	add	rbp, rdx
    11ee:      	adc	rax, rsi
    11f1:      	adc	rdi, r8
    11f4:      	adc	r15, r9
    11f7:      	adc	r14, 0x0
    11fb:      	mov	rdx, rcx
    11fe:      	xor	esi, esi
    1200:      	mulx	r9, r8, qword ptr [r12]
    1206:      	adcx	rbp, r8
    120c:      	adox	rax, r9
    1212:      	mulx	r9, r8, qword ptr [r12 + 0x8]
    1219:      	adcx	rax, r8
    121f:      	adox	rdi, r9
    1225:      	mulx	r9, r8, qword ptr [r12 + 0x10]
    122c:      	adcx	rdi, r8
    1232:      	adox	r15, r9
    1238:      	mulx	r9, r8, qword ptr [r12 + 0x18]
    123f:      	adcx	r15, r8
    1245:      	adox	r14, r9
    124b:      	adcx	r14, rsi
    1251:      	adox	rsi, rsi
    1257:      	adc	rsi, 0x0
    125b:      	mov	rdx, rbp
    125e:      	mulx	r9, r8, r10
    1263:      	shl	rdx, 0x20
    1267:      	shr	rbp, 0x20
    126b:      	add	rax, rdx
    126e:      	adc	rdi, rbp
    1271:      	adc	r15, r8
    1274:      	adc	r14, r9
    1277:      	adc	rsi, 0x0
    127b:      	mov	rdx, rbx
    127e:      	xor	ebp, ebp
    1280:      	mulx	r9, r8, qword ptr [r12]
    1286:      	adcx	rax, r8
    128c:      	adox	rdi, r9
    1292:      	mulx	r9, r8, qword ptr [r12 + 0x8]
    1299:      	adcx	rdi, r8
    129f:      	adox	r15, r9
    12a5:      	mulx	r9, r8, qword ptr [r12 + 0x10]
    12ac:      	adcx	r15, r8
    12b2:      	adox	r14, r9
    12b8:      	mulx	r9, r8, qword ptr [r12 + 0x18]
    12bf:      	adcx	r14, r8
    12c5:      	adox	rsi, r9
    12cb:      	adcx	rsi, rbp
    12d1:      	adox	rbp, rbp
    12d7:      	adc	rbp, 0x0
    12db:      	mov	rdx, rax
    12de:      	mulx	r9, r8, r10
    12e3:      	shl	rdx, 0x20
    12e7:      	shr	rax, 0x20
    12eb:      	add	rdi, rdx
    12ee:      	adc	r15, rax
    12f1:      	adc	r14, r8
    12f4:      	adc	rsi, r9
    12f7:      	adc	rbp, 0x0
    12fb:      	mov	rax, rdi
    12fe:      	mov	r8, r15
    1301:      	mov	r9, r14
    1304:      	mov	rdx, rsi
    1307:      	mov	r11d, 0xffffffff
    130d:      	sub	rax, -0x1
    1311:      	sbb	r8, r11
    1314:      	sbb	r9, 0x0
    1318:      	sbb	rdx, r10
    131b:      	sbb	rbp, 0x0
    131f:      	cmovae	rdi, rax
    1323:      	cmovae	r15, r8
    1327:      	cmovae	r14, r9
    132b:      	cmovae	rsi, rdx
    132f:      	mov	qword ptr [rsp - 0x58], rsi
    1334:      	mov	qword ptr [rsp - 0x80], rdi
    1339:      	mov	qword ptr [rsp - 0x78], r15
    133e:      	mov	qword ptr [rsp - 0x70], r14
    1343:      	mov	rdi, qword ptr [rsp - 0x40]
    1348:      	mov	rsi, qword ptr [rsp - 0x38]
    134d:      	mov	r11, qword ptr [rsp - 0x48]
    1352:      	xor	r9d, r9d
    1355:      	add	r13, r13
    1358:      	adc	r11, r11
    135b:      	adc	rdi, rdi
    135e:      	adc	rsi, rsi
    1361:      	adc	r9, 0x0
    1365:      	mov	rax, r13
    1368:      	mov	rcx, r11
    136b:      	mov	rdx, rdi
    136e:      	mov	r8, rsi
    1371:      	mov	ebp, 0xffffffff
    1376:      	movabs	r10, -0xffffffff
    1380:      	sub	rax, -0x1
    1384:      	sbb	rcx, rbp
    1387:      	sbb	rdx, 0x0
    138b:      	sbb	r8, r10
    138e:      	sbb	r9, 0x0
    1392:      	cmovae	r13, rax
    1396:      	cmovae	r11, rcx
    139a:      	cmovae	rdi, rdx
    139e:      	cmovae	rsi, r8
    13a2:      	xor	r9d, r9d
    13a5:      	add	r13, r13
    13a8:      	adc	r11, r11
    13ab:      	adc	rdi, rdi
    13ae:      	adc	rsi, rsi
    13b1:      	adc	r9, 0x0
    13b5:      	mov	rax, r13
    13b8:      	mov	rcx, r11
    13bb:      	mov	rdx, rdi
    13be:      	mov	r8, rsi
    13c1:      	mov	r10d, 0xffffffff
    13c7:      	movabs	rbp, -0xffffffff
    13d1:      	sub	rax, -0x1
    13d5:      	sbb	rcx, r10
    13d8:      	sbb	rdx, 0x0
    13dc:      	sbb	r8, rbp
    13df:      	sbb	r9, 0x0
    13e3:      	cmovae	r13, rax
    13e7:      	cmovae	r11, rcx
    13eb:      	cmovae	rdi, rdx
    13ef:      	cmovae	rsi, r8
    13f3:      	mov	rdx, qword ptr [rsp - 0x58]
    13f8:      	mov	r8, qword ptr [rsp - 0x70]
    13fd:      	mov	r9, qword ptr [rsp - 0x78]
    1402:      	mov	r10, qword ptr [rsp - 0x80]
    1407:      	sub	r10, r13
    140a:      	sbb	r9, r11
    140d:      	sbb	r8, rdi
    1410:      	sbb	rdx, rsi
    1413:      	sbb	r13, r13
    1416:      	mov	r11, r13
    1419:      	shr	r11, 0x20
    141d:      	mov	rsi, r13
    1420:      	shl	rsi, 0x20
    1424:      	sub	rsi, r13
    1427:      	add	r10, r13
    142a:      	adc	r9, r11
    142d:      	adc	r8, 0x0
    1431:      	adc	rdx, rsi
    1434:      	mov	rax, qword ptr [rsp + 0x80]
    143c:      	mov	rcx, qword ptr [rsp - 0x20]
    1441:      	mov	qword ptr [rax], rcx
    1444:      	mov	rcx, qword ptr [rsp - 0x18]
    1449:      	mov	qword ptr [rax + 0x8], rcx
    144d:      	mov	rcx, qword ptr [rsp - 0x10]
    1452:      	mov	qword ptr [rax + 0x10], rcx
    1456:      	mov	rcx, qword ptr [rsp - 0x50]
    145b:      	mov	qword ptr [rax + 0x18], rcx
    145f:      	mov	qword ptr [rax + 0x20], r10
    1463:      	mov	qword ptr [rax + 0x28], r9
    1467:      	mov	qword ptr [rax + 0x30], r8
    146b:      	mov	qword ptr [rax + 0x38], rdx
    146f:      	mov	rcx, qword ptr [rsp - 0x68]
    1474:      	mov	qword ptr [rax + 0x40], rcx
    1478:      	mov	rcx, qword ptr [rsp - 0x60]
    147d:      	mov	qword ptr [rax + 0x48], rcx
    1481:      	mov	rcx, qword ptr [rsp - 0x30]
    1486:      	mov	qword ptr [rax + 0x50], rcx
    148a:      	mov	rcx, qword ptr [rsp - 0x28]
    148f:      	mov	qword ptr [rax + 0x58], rcx
    1493:      	add	rsp, 0xa8
    149a:      	pop	rbx
    149b:      	pop	r12
    149d:      	pop	r13
    149f:      	pop	r14
    14a1:      	pop	r15
    14a3:      	pop	rbp
    14a4:      	ret
