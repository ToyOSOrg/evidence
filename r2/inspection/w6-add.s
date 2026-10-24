       0:      	push	rbp
       1:      	push	r15
       3:      	push	r14
       5:      	push	r13
       7:      	push	r12
       9:      	push	rbx
       a:      	sub	rsp, 0x100
      11:      	mov	qword ptr [rsp - 0x48], rdx
      16:      	mov	qword ptr [rsp + 0x78], rdi
      1b:      	mov	r9, qword ptr [rsi + 0x40]
      1f:      	mov	qword ptr [rsp + 0x40], r9
      24:      	mov	rdi, qword ptr [rsi + 0x48]
      28:      	mov	qword ptr [rsp + 0x50], rdi
      2d:      	mov	r10, qword ptr [rsi + 0x50]
      31:      	mov	qword ptr [rsp + 0x38], r10
      36:      	mov	r8, qword ptr [rsi + 0x58]
      3a:      	mov	qword ptr [rsp + 0x48], r8
      3f:      	mov	rdx, r9
      42:      	mulx	rbx, r11, rdi
      47:      	mulx	rbp, rcx, r10
      4c:      	add	rbx, rcx
      4f:      	mulx	r14, rcx, r8
      54:      	adc	rbp, rcx
      57:      	adc	r14, 0x0
      5b:      	mov	rdx, rdi
      5e:      	mulx	rax, rcx, r10
      63:      	add	rbp, rcx
      66:      	adc	r14, rax
      69:      	mulx	r15, rcx, r8
      6e:      	adc	r15, 0x0
      72:      	add	r14, rcx
      75:      	adc	r15, 0x0
      79:      	mov	rdx, r10
      7c:      	mulx	r12, rcx, r8
      81:      	add	r15, rcx
      84:      	adc	r12, 0x0
      88:      	xor	r13d, r13d
      8b:      	add	r11, r11
      8e:      	adc	rbx, rbx
      91:      	adc	rbp, rbp
      94:      	adc	r14, r14
      97:      	adc	r15, r15
      9a:      	adc	r12, r12
      9d:      	adc	r13, 0x0
      a1:      	mov	rdx, r9
      a4:      	mulx	rax, r9, rdx
      a9:      	add	r11, rax
      ac:      	mov	rdx, rdi
      af:      	mulx	rax, rcx, rdx
      b4:      	adc	rbx, rcx
      b7:      	adc	rbp, rax
      ba:      	mov	rdx, r10
      bd:      	mulx	rax, rcx, rdx
      c2:      	adc	r14, rcx
      c5:      	adc	r15, rax
      c8:      	mov	rdx, r8
      cb:      	mulx	rax, rcx, rdx
      d0:      	adc	r12, rcx
      d3:      	adc	r13, rax
      d6:      	movabs	rdi, -0xffffffff
      e0:      	mov	rdx, r9
      e3:      	mulx	rax, rcx, rdi
      e8:      	shl	rdx, 0x20
      ec:      	shr	r9, 0x20
      f0:      	add	r11, rdx
      f3:      	adc	rbx, r9
      f6:      	adc	rbp, rcx
      f9:      	adc	r14, rax
      fc:      	adc	r15, 0x0
     100:      	adc	r12, 0x0
     104:      	adc	r13, 0x0
     108:      	mov	r9d, 0x0
     10e:      	adc	r9, 0x0
     112:      	mov	rdx, r11
     115:      	mulx	rax, rcx, rdi
     11a:      	shl	rdx, 0x20
     11e:      	shr	r11, 0x20
     122:      	add	rbx, rdx
     125:      	adc	rbp, r11
     128:      	adc	r14, rcx
     12b:      	adc	r15, rax
     12e:      	adc	r12, 0x0
     132:      	adc	r13, 0x0
     136:      	adc	r9, 0x0
     13a:      	mov	rdx, rbx
     13d:      	mulx	rax, rcx, rdi
     142:      	shl	rdx, 0x20
     146:      	shr	rbx, 0x20
     14a:      	add	rbp, rdx
     14d:      	adc	r14, rbx
     150:      	adc	r15, rcx
     153:      	adc	r12, rax
     156:      	adc	r13, 0x0
     15a:      	adc	r9, 0x0
     15e:      	mov	rdx, rbp
     161:      	mulx	rax, rcx, rdi
     166:      	shl	rdx, 0x20
     16a:      	shr	rbp, 0x20
     16e:      	add	r14, rdx
     171:      	adc	r15, rbp
     174:      	adc	r12, rcx
     177:      	adc	r13, rax
     17a:      	adc	r9, 0x0
     17e:      	mov	r10, r14
     181:      	mov	r8, r15
     184:      	mov	r11, r12
     187:      	mov	rdx, r13
     18a:      	mov	ecx, 0xffffffff
     18f:      	sub	r10, -0x1
     193:      	sbb	r8, rcx
     196:      	sbb	r11, 0x0
     19a:      	sbb	rdx, rdi
     19d:      	sbb	r9, 0x0
     1a1:      	cmovae	r14, r10
     1a5:      	cmovae	r15, r8
     1a9:      	cmovae	r12, r11
     1ad:      	cmovae	r13, rdx
     1b1:      	mov	qword ptr [rsp + 0x80], r14
     1b9:      	mov	qword ptr [rsp + 0x88], r15
     1c1:      	mov	qword ptr [rsp + 0x90], r12
     1c9:      	mov	qword ptr [rsp + 0x98], r13
     1d1:      	mov	rax, qword ptr [rsp - 0x48]
     1d6:      	mov	r11, qword ptr [rax + 0x40]
     1da:      	mov	qword ptr [rsp - 0x68], r11
     1df:      	mov	rcx, qword ptr [rax + 0x48]
     1e3:      	mov	qword ptr [rsp - 0x18], rcx
     1e8:      	mov	rbx, qword ptr [rax + 0x50]
     1ec:      	mov	qword ptr [rsp - 0x70], rbx
     1f1:      	mov	r8, qword ptr [rax + 0x58]
     1f5:      	mov	qword ptr [rsp - 0x20], r8
     1fa:      	mov	rax, rcx
     1fd:      	mov	rcx, r8
     200:      	mov	rdx, r11
     203:      	mulx	r14, rbp, rax
     208:      	mulx	r15, r10, rbx
     20d:      	add	r14, r10
     210:      	mulx	r12, r10, rcx
     215:      	adc	r15, r10
     218:      	adc	r12, 0x0
     21c:      	mov	rdx, rax
     21f:      	mulx	r9, r10, rbx
     224:      	add	r15, r10
     227:      	adc	r12, r9
     22a:      	mulx	r13, r10, rcx
     22f:      	adc	r13, 0x0
     233:      	add	r12, r10
     236:      	adc	r13, 0x0
     23a:      	mov	rdx, rbx
     23d:      	mulx	rdi, r10, rcx
     242:      	add	r13, r10
     245:      	adc	rdi, 0x0
     249:      	xor	r8d, r8d
     24c:      	add	rbp, rbp
     24f:      	adc	r14, r14
     252:      	adc	r15, r15
     255:      	adc	r12, r12
     258:      	adc	r13, r13
     25b:      	adc	rdi, rdi
     25e:      	adc	r8, 0x0
     262:      	mov	rdx, r11
     265:      	mulx	r9, r11, rdx
     26a:      	add	rbp, r9
     26d:      	mov	rdx, rax
     270:      	mulx	r9, r10, rdx
     275:      	adc	r14, r10
     278:      	adc	r15, r9
     27b:      	mov	rdx, rbx
     27e:      	mulx	r9, r10, rdx
     283:      	adc	r12, r10
     286:      	adc	r13, r9
     289:      	mov	rdx, rcx
     28c:      	mulx	r9, r10, rdx
     291:      	adc	rdi, r10
     294:      	adc	r8, r9
     297:      	movabs	rax, -0xffffffff
     2a1:      	mov	rdx, r11
     2a4:      	mulx	r9, r10, rax
     2a9:      	shl	rdx, 0x20
     2ad:      	shr	r11, 0x20
     2b1:      	add	rbp, rdx
     2b4:      	adc	r14, r11
     2b7:      	adc	r15, r10
     2ba:      	adc	r12, r9
     2bd:      	adc	r13, 0x0
     2c1:      	adc	rdi, 0x0
     2c5:      	adc	r8, 0x0
     2c9:      	mov	r11d, 0x0
     2cf:      	adc	r11, 0x0
     2d3:      	mov	rdx, rbp
     2d6:      	mulx	r9, r10, rax
     2db:      	shl	rdx, 0x20
     2df:      	shr	rbp, 0x20
     2e3:      	add	r14, rdx
     2e6:      	adc	r15, rbp
     2e9:      	adc	r12, r10
     2ec:      	adc	r13, r9
     2ef:      	adc	rdi, 0x0
     2f3:      	adc	r8, 0x0
     2f7:      	adc	r11, 0x0
     2fb:      	mov	rdx, r14
     2fe:      	mulx	r9, r10, rax
     303:      	shl	rdx, 0x20
     307:      	shr	r14, 0x20
     30b:      	add	r15, rdx
     30e:      	adc	r12, r14
     311:      	adc	r13, r10
     314:      	adc	rdi, r9
     317:      	adc	r8, 0x0
     31b:      	adc	r11, 0x0
     31f:      	mov	rdx, r15
     322:      	mulx	r9, r10, rax
     327:      	shl	rdx, 0x20
     32b:      	shr	r15, 0x20
     32f:      	add	r12, rdx
     332:      	adc	r13, r15
     335:      	adc	rdi, r10
     338:      	adc	r8, r9
     33b:      	adc	r11, 0x0
     33f:      	mov	rbx, r12
     342:      	mov	rcx, r13
     345:      	mov	rbp, rdi
     348:      	mov	rdx, r8
     34b:      	mov	r10d, 0xffffffff
     351:      	sub	rbx, -0x1
     355:      	sbb	rcx, r10
     358:      	sbb	rbp, 0x0
     35c:      	sbb	rdx, rax
     35f:      	sbb	r11, 0x0
     363:      	cmovae	r12, rbx
     367:      	cmovae	r13, rcx
     36b:      	cmovae	rdi, rbp
     36f:      	cmovae	r8, rdx
     373:      	mov	qword ptr [rsp + 0xa0], r12
     37b:      	mov	qword ptr [rsp + 0xa8], r13
     383:      	mov	qword ptr [rsp + 0xb0], rdi
     38b:      	mov	qword ptr [rsp + 0xb8], r8
     393:      	mov	rdx, qword ptr [rsi]
     396:      	mov	rax, qword ptr [rsi + 0x8]
     39a:      	mov	rcx, qword ptr [rsi + 0x10]
     39e:      	mov	rdi, qword ptr [rsi + 0x18]
     3a2:      	lea	r8, [rsp + 0xa0]
     3aa:      	movabs	r12, -0xffffffff
     3b4:      	mulx	r15, r14, qword ptr [r8]
     3b9:      	mulx	r9, rbx, qword ptr [r8 + 0x8]
     3bf:      	add	r15, rbx
     3c2:      	mulx	r10, rbx, qword ptr [r8 + 0x10]
     3c8:      	adc	r9, rbx
     3cb:      	mulx	r13, rbx, qword ptr [r8 + 0x18]
     3d1:      	adc	r10, rbx
     3d4:      	adc	r13, 0x0
     3d8:      	xor	r11d, r11d
     3db:      	mov	rdx, r14
     3de:      	mulx	rbp, rbx, r12
     3e3:      	shl	rdx, 0x20
     3e7:      	shr	r14, 0x20
     3eb:      	add	r15, rdx
     3ee:      	adc	r9, r14
     3f1:      	adc	r10, rbx
     3f4:      	adc	r13, rbp
     3f7:      	adc	r11, 0x0
     3fb:      	mov	rdx, rax
     3fe:      	xor	r14d, r14d
     401:      	mulx	rbp, rbx, qword ptr [r8]
     406:      	adcx	r15, rbx
     40c:      	adox	r9, rbp
     412:      	mulx	rbp, rbx, qword ptr [r8 + 0x8]
     418:      	adcx	r9, rbx
     41e:      	adox	r10, rbp
     424:      	mulx	rbp, rbx, qword ptr [r8 + 0x10]
     42a:      	adcx	r10, rbx
     430:      	adox	r13, rbp
     436:      	mulx	rbp, rbx, qword ptr [r8 + 0x18]
     43c:      	adcx	r13, rbx
     442:      	adox	r11, rbp
     448:      	adcx	r11, r14
     44e:      	adox	r14, r14
     454:      	adc	r14, 0x0
     458:      	mov	rdx, r15
     45b:      	mulx	rbp, rbx, r12
     460:      	shl	rdx, 0x20
     464:      	shr	r15, 0x20
     468:      	add	r9, rdx
     46b:      	adc	r10, r15
     46e:      	adc	r13, rbx
     471:      	adc	r11, rbp
     474:      	adc	r14, 0x0
     478:      	mov	rdx, rcx
     47b:      	xor	r15d, r15d
     47e:      	mulx	rbp, rbx, qword ptr [r8]
     483:      	adcx	r9, rbx
     489:      	adox	r10, rbp
     48f:      	mulx	rbp, rbx, qword ptr [r8 + 0x8]
     495:      	adcx	r10, rbx
     49b:      	adox	r13, rbp
     4a1:      	mulx	rbp, rbx, qword ptr [r8 + 0x10]
     4a7:      	adcx	r13, rbx
     4ad:      	adox	r11, rbp
     4b3:      	mulx	rbp, rbx, qword ptr [r8 + 0x18]
     4b9:      	adcx	r11, rbx
     4bf:      	adox	r14, rbp
     4c5:      	adcx	r14, r15
     4cb:      	adox	r15, r15
     4d1:      	adc	r15, 0x0
     4d5:      	mov	rdx, r9
     4d8:      	mulx	rbp, rbx, r12
     4dd:      	shl	rdx, 0x20
     4e1:      	shr	r9, 0x20
     4e5:      	add	r10, rdx
     4e8:      	adc	r13, r9
     4eb:      	adc	r11, rbx
     4ee:      	adc	r14, rbp
     4f1:      	adc	r15, 0x0
     4f5:      	mov	rdx, rdi
     4f8:      	xor	r9d, r9d
     4fb:      	mulx	rbp, rbx, qword ptr [r8]
     500:      	adcx	r10, rbx
     506:      	adox	r13, rbp
     50c:      	mulx	rbp, rbx, qword ptr [r8 + 0x8]
     512:      	adcx	r13, rbx
     518:      	adox	r11, rbp
     51e:      	mulx	rbp, rbx, qword ptr [r8 + 0x10]
     524:      	adcx	r11, rbx
     52a:      	adox	r14, rbp
     530:      	mulx	rbp, rbx, qword ptr [r8 + 0x18]
     536:      	adcx	r14, rbx
     53c:      	adox	r15, rbp
     542:      	adcx	r15, r9
     548:      	adox	r9, r9
     54e:      	adc	r9, 0x0
     552:      	mov	rdx, r10
     555:      	mulx	rbp, rbx, r12
     55a:      	shl	rdx, 0x20
     55e:      	shr	r10, 0x20
     562:      	add	r13, rdx
     565:      	adc	r11, r10
     568:      	adc	r14, rbx
     56b:      	adc	r15, rbp
     56e:      	adc	r9, 0x0
     572:      	mov	r10, r13
     575:      	mov	rbx, r11
     578:      	mov	rbp, r14
     57b:      	mov	rdx, r15
     57e:      	mov	eax, 0xffffffff
     583:      	sub	r10, -0x1
     587:      	sbb	rbx, rax
     58a:      	sbb	rbp, 0x0
     58e:      	sbb	rdx, r12
     591:      	sbb	r9, 0x0
     595:      	cmovae	r13, r10
     599:      	cmovae	r11, rbx
     59d:      	cmovae	r14, rbp
     5a1:      	cmovae	r15, rdx
     5a5:      	mov	qword ptr [rsp - 0x80], r13
     5aa:      	mov	qword ptr [rsp - 0x60], r15
     5af:      	mov	qword ptr [rsp - 0x58], r14
     5b4:      	mov	qword ptr [rsp - 0x50], r11
     5b9:      	mov	rdi, qword ptr [rsp - 0x48]
     5be:      	mov	rdx, qword ptr [rdi]
     5c1:      	mov	rax, qword ptr [rdi + 0x8]
     5c5:      	mov	rcx, qword ptr [rdi + 0x10]
     5c9:      	mov	rdi, qword ptr [rdi + 0x18]
     5cd:      	lea	r9, [rsp + 0x80]
     5d5:      	mulx	r8, r15, qword ptr [r9]
     5da:      	mulx	r10, rbp, qword ptr [r9 + 0x8]
     5e0:      	add	r8, rbp
     5e3:      	mulx	rbx, rbp, qword ptr [r9 + 0x10]
     5e9:      	adc	r10, rbp
     5ec:      	mulx	r14, rbp, qword ptr [r9 + 0x18]
     5f2:      	adc	rbx, rbp
     5f5:      	adc	r14, 0x0
     5f9:      	xor	r11d, r11d
     5fc:      	mov	rdx, r15
     5ff:      	mulx	r13, rbp, r12
     604:      	shl	rdx, 0x20
     608:      	shr	r15, 0x20
     60c:      	add	r8, rdx
     60f:      	adc	r10, r15
     612:      	adc	rbx, rbp
     615:      	adc	r14, r13
     618:      	adc	r11, 0x0
     61c:      	mov	rdx, rax
     61f:      	xor	r15d, r15d
     622:      	mulx	r13, rbp, qword ptr [r9]
     627:      	adcx	r8, rbp
     62d:      	adox	r10, r13
     633:      	mulx	r13, rbp, qword ptr [r9 + 0x8]
     639:      	adcx	r10, rbp
     63f:      	adox	rbx, r13
     645:      	mulx	r13, rbp, qword ptr [r9 + 0x10]
     64b:      	adcx	rbx, rbp
     651:      	adox	r14, r13
     657:      	mulx	r13, rbp, qword ptr [r9 + 0x18]
     65d:      	adcx	r14, rbp
     663:      	adox	r11, r13
     669:      	adcx	r11, r15
     66f:      	adox	r15, r15
     675:      	adc	r15, 0x0
     679:      	mov	rdx, r8
     67c:      	mulx	r13, rbp, r12
     681:      	shl	rdx, 0x20
     685:      	shr	r8, 0x20
     689:      	add	r10, rdx
     68c:      	adc	rbx, r8
     68f:      	adc	r14, rbp
     692:      	adc	r11, r13
     695:      	adc	r15, 0x0
     699:      	mov	rdx, rcx
     69c:      	xor	r8d, r8d
     69f:      	mulx	r13, rbp, qword ptr [r9]
     6a4:      	adcx	r10, rbp
     6aa:      	adox	rbx, r13
     6b0:      	mulx	r13, rbp, qword ptr [r9 + 0x8]
     6b6:      	adcx	rbx, rbp
     6bc:      	adox	r14, r13
     6c2:      	mulx	r13, rbp, qword ptr [r9 + 0x10]
     6c8:      	adcx	r14, rbp
     6ce:      	adox	r11, r13
     6d4:      	mulx	r13, rbp, qword ptr [r9 + 0x18]
     6da:      	adcx	r11, rbp
     6e0:      	adox	r15, r13
     6e6:      	adcx	r15, r8
     6ec:      	adox	r8, r8
     6f2:      	adc	r8, 0x0
     6f6:      	mov	rdx, r10
     6f9:      	mulx	r13, rbp, r12
     6fe:      	shl	rdx, 0x20
     702:      	shr	r10, 0x20
     706:      	add	rbx, rdx
     709:      	adc	r14, r10
     70c:      	adc	r11, rbp
     70f:      	adc	r15, r13
     712:      	adc	r8, 0x0
     716:      	mov	rdx, rdi
     719:      	xor	r10d, r10d
     71c:      	mulx	r13, rbp, qword ptr [r9]
     721:      	adcx	rbx, rbp
     727:      	adox	r14, r13
     72d:      	mulx	r13, rbp, qword ptr [r9 + 0x8]
     733:      	adcx	r14, rbp
     739:      	adox	r11, r13
     73f:      	mulx	r13, rbp, qword ptr [r9 + 0x10]
     745:      	adcx	r11, rbp
     74b:      	adox	r15, r13
     751:      	mulx	r13, rbp, qword ptr [r9 + 0x18]
     757:      	adcx	r15, rbp
     75d:      	adox	r8, r13
     763:      	adcx	r8, r10
     769:      	adox	r10, r10
     76f:      	adc	r10, 0x0
     773:      	mov	rdx, rbx
     776:      	mulx	r13, rbp, r12
     77b:      	shl	rdx, 0x20
     77f:      	shr	rbx, 0x20
     783:      	add	r14, rdx
     786:      	adc	r11, rbx
     789:      	adc	r15, rbp
     78c:      	adc	r8, r13
     78f:      	adc	r10, 0x0
     793:      	mov	rbx, r14
     796:      	mov	rbp, r11
     799:      	mov	r13, r15
     79c:      	mov	rdx, r8
     79f:      	mov	eax, 0xffffffff
     7a4:      	sub	rbx, -0x1
     7a8:      	sbb	rbp, rax
     7ab:      	sbb	r13, 0x0
     7af:      	sbb	rdx, r12
     7b2:      	sbb	r10, 0x0
     7b6:      	cmovae	r14, rbx
     7ba:      	cmovae	r11, rbp
     7be:      	cmovae	r15, r13
     7c2:      	cmovae	r8, rdx
     7c6:      	mov	qword ptr [rsp], r8
     7ca:      	mov	qword ptr [rsp - 0x8], r15
     7cf:      	mov	qword ptr [rsp - 0x28], r14
     7d4:      	mov	qword ptr [rsp - 0x40], r11
     7d9:      	mov	rdx, qword ptr [rsp - 0x68]
     7de:      	mov	r8, qword ptr [rsp - 0x18]
     7e3:      	mov	r11, qword ptr [rsp - 0x20]
     7e8:      	mov	r15, qword ptr [rsp - 0x70]
     7ed:      	lea	rcx, [rsp + 0xa0]
     7f5:      	mulx	r9, rax, qword ptr [rcx]
     7fa:      	mulx	rdi, rbp, qword ptr [rcx + 0x8]
     800:      	add	r9, rbp
     803:      	mulx	r10, rbp, qword ptr [rcx + 0x10]
     809:      	adc	rdi, rbp
     80c:      	mulx	rbx, rbp, qword ptr [rcx + 0x18]
     812:      	adc	r10, rbp
     815:      	adc	rbx, 0x0
     819:      	xor	r13d, r13d
     81c:      	mov	rdx, rax
     81f:      	mulx	r14, rbp, r12
     824:      	shl	rdx, 0x20
     828:      	shr	rax, 0x20
     82c:      	add	r9, rdx
     82f:      	adc	rdi, rax
     832:      	adc	r10, rbp
     835:      	adc	rbx, r14
     838:      	adc	r13, 0x0
     83c:      	mov	rdx, r8
     83f:      	xor	eax, eax
     841:      	mulx	r14, rbp, qword ptr [rcx]
     846:      	adcx	r9, rbp
     84c:      	adox	rdi, r14
     852:      	mulx	r14, rbp, qword ptr [rcx + 0x8]
     858:      	adcx	rdi, rbp
     85e:      	adox	r10, r14
     864:      	mulx	r14, rbp, qword ptr [rcx + 0x10]
     86a:      	adcx	r10, rbp
     870:      	adox	rbx, r14
     876:      	mulx	r14, rbp, qword ptr [rcx + 0x18]
     87c:      	adcx	rbx, rbp
     882:      	adox	r13, r14
     888:      	adcx	r13, rax
     88e:      	adox	rax, rax
     894:      	adc	rax, 0x0
     898:      	mov	rdx, r9
     89b:      	mulx	r14, rbp, r12
     8a0:      	shl	rdx, 0x20
     8a4:      	shr	r9, 0x20
     8a8:      	add	rdi, rdx
     8ab:      	adc	r10, r9
     8ae:      	adc	rbx, rbp
     8b1:      	adc	r13, r14
     8b4:      	adc	rax, 0x0
     8b8:      	mov	rdx, r15
     8bb:      	xor	r9d, r9d
     8be:      	mulx	r14, rbp, qword ptr [rcx]
     8c3:      	adcx	rdi, rbp
     8c9:      	adox	r10, r14
     8cf:      	mulx	r14, rbp, qword ptr [rcx + 0x8]
     8d5:      	adcx	r10, rbp
     8db:      	adox	rbx, r14
     8e1:      	mulx	r14, rbp, qword ptr [rcx + 0x10]
     8e7:      	adcx	rbx, rbp
     8ed:      	adox	r13, r14
     8f3:      	mulx	r14, rbp, qword ptr [rcx + 0x18]
     8f9:      	adcx	r13, rbp
     8ff:      	adox	rax, r14
     905:      	adcx	rax, r9
     90b:      	adox	r9, r9
     911:      	adc	r9, 0x0
     915:      	mov	rdx, rdi
     918:      	mulx	r14, rbp, r12
     91d:      	shl	rdx, 0x20
     921:      	shr	rdi, 0x20
     925:      	add	r10, rdx
     928:      	adc	rbx, rdi
     92b:      	adc	r13, rbp
     92e:      	adc	rax, r14
     931:      	adc	r9, 0x0
     935:      	mov	rdx, r11
     938:      	xor	edi, edi
     93a:      	mulx	r14, rbp, qword ptr [rcx]
     93f:      	adcx	r10, rbp
     945:      	adox	rbx, r14
     94b:      	mulx	r14, rbp, qword ptr [rcx + 0x8]
     951:      	adcx	rbx, rbp
     957:      	adox	r13, r14
     95d:      	mulx	r14, rbp, qword ptr [rcx + 0x10]
     963:      	adcx	r13, rbp
     969:      	adox	rax, r14
     96f:      	mulx	r14, rbp, qword ptr [rcx + 0x18]
     975:      	adcx	rax, rbp
     97b:      	adox	r9, r14
     981:      	adcx	r9, rdi
     987:      	adox	rdi, rdi
     98d:      	adc	rdi, 0x0
     991:      	mov	rdx, r10
     994:      	mulx	r14, rbp, r12
     999:      	shl	rdx, 0x20
     99d:      	shr	r10, 0x20
     9a1:      	add	rbx, rdx
     9a4:      	adc	r13, r10
     9a7:      	adc	rax, rbp
     9aa:      	adc	r9, r14
     9ad:      	adc	rdi, 0x0
     9b1:      	mov	r10, rbx
     9b4:      	mov	rbp, r13
     9b7:      	mov	r14, rax
     9ba:      	mov	rdx, r9
     9bd:      	mov	r8d, 0xffffffff
     9c3:      	sub	r10, -0x1
     9c7:      	sbb	rbp, r8
     9ca:      	sbb	r14, 0x0
     9ce:      	sbb	rdx, r12
     9d1:      	sbb	rdi, 0x0
     9d5:      	cmovae	rbx, r10
     9d9:      	cmovae	r13, rbp
     9dd:      	cmovae	rax, r14
     9e1:      	cmovae	r9, rdx
     9e5:      	mov	qword ptr [rsp + 0x8], rbx
     9ea:      	mov	qword ptr [rsp + 0x10], r13
     9ef:      	mov	qword ptr [rsp + 0x18], rax
     9f4:      	mov	qword ptr [rsp + 0x20], r9
     9f9:      	mov	rdx, qword ptr [rsi + 0x20]
     9fd:      	mov	rax, qword ptr [rsi + 0x28]
     a01:      	mov	rcx, qword ptr [rsi + 0x30]
     a05:      	mov	rsi, qword ptr [rsi + 0x38]
     a09:      	lea	rdi, [rsp + 0x8]
     a0e:      	mov	r13, r12
     a11:      	mulx	r14, r11, qword ptr [rdi]
     a16:      	mulx	r8, rbx, qword ptr [rdi + 0x8]
     a1c:      	add	r14, rbx
     a1f:      	mulx	r10, rbx, qword ptr [rdi + 0x10]
     a25:      	adc	r8, rbx
     a28:      	mulx	r12, rbx, qword ptr [rdi + 0x18]
     a2e:      	adc	r10, rbx
     a31:      	adc	r12, 0x0
     a35:      	xor	r15d, r15d
     a38:      	mov	rdx, r11
     a3b:      	mulx	rbp, rbx, r13
     a40:      	shl	rdx, 0x20
     a44:      	shr	r11, 0x20
     a48:      	add	r14, rdx
     a4b:      	adc	r8, r11
     a4e:      	adc	r10, rbx
     a51:      	adc	r12, rbp
     a54:      	adc	r15, 0x0
     a58:      	mov	rdx, rax
     a5b:      	xor	r11d, r11d
     a5e:      	mulx	rbp, rbx, qword ptr [rdi]
     a63:      	adcx	r14, rbx
     a69:      	adox	r8, rbp
     a6f:      	mulx	rbp, rbx, qword ptr [rdi + 0x8]
     a75:      	adcx	r8, rbx
     a7b:      	adox	r10, rbp
     a81:      	mulx	rbp, rbx, qword ptr [rdi + 0x10]
     a87:      	adcx	r10, rbx
     a8d:      	adox	r12, rbp
     a93:      	mulx	rbp, rbx, qword ptr [rdi + 0x18]
     a99:      	adcx	r12, rbx
     a9f:      	adox	r15, rbp
     aa5:      	adcx	r15, r11
     aab:      	adox	r11, r11
     ab1:      	adc	r11, 0x0
     ab5:      	mov	rdx, r14
     ab8:      	mulx	rbp, rbx, r13
     abd:      	shl	rdx, 0x20
     ac1:      	shr	r14, 0x20
     ac5:      	add	r8, rdx
     ac8:      	adc	r10, r14
     acb:      	adc	r12, rbx
     ace:      	adc	r15, rbp
     ad1:      	adc	r11, 0x0
     ad5:      	mov	rdx, rcx
     ad8:      	xor	r14d, r14d
     adb:      	mulx	rbp, rbx, qword ptr [rdi]
     ae0:      	adcx	r8, rbx
     ae6:      	adox	r10, rbp
     aec:      	mulx	rbp, rbx, qword ptr [rdi + 0x8]
     af2:      	adcx	r10, rbx
     af8:      	adox	r12, rbp
     afe:      	mulx	rbp, rbx, qword ptr [rdi + 0x10]
     b04:      	adcx	r12, rbx
     b0a:      	adox	r15, rbp
     b10:      	mulx	rbp, rbx, qword ptr [rdi + 0x18]
     b16:      	adcx	r15, rbx
     b1c:      	adox	r11, rbp
     b22:      	adcx	r11, r14
     b28:      	adox	r14, r14
     b2e:      	adc	r14, 0x0
     b32:      	mov	rdx, r8
     b35:      	mulx	rbp, rbx, r13
     b3a:      	shl	rdx, 0x20
     b3e:      	shr	r8, 0x20
     b42:      	add	r10, rdx
     b45:      	adc	r12, r8
     b48:      	adc	r15, rbx
     b4b:      	adc	r11, rbp
     b4e:      	adc	r14, 0x0
     b52:      	mov	rdx, rsi
     b55:      	xor	r8d, r8d
     b58:      	mulx	rbp, rbx, qword ptr [rdi]
     b5d:      	adcx	r10, rbx
     b63:      	adox	r12, rbp
     b69:      	mulx	rbp, rbx, qword ptr [rdi + 0x8]
     b6f:      	adcx	r12, rbx
     b75:      	adox	r15, rbp
     b7b:      	mulx	rbp, rbx, qword ptr [rdi + 0x10]
     b81:      	adcx	r15, rbx
     b87:      	adox	r11, rbp
     b8d:      	mulx	rbp, rbx, qword ptr [rdi + 0x18]
     b93:      	adcx	r11, rbx
     b99:      	adox	r14, rbp
     b9f:      	adcx	r14, r8
     ba5:      	adox	r8, r8
     bab:      	adc	r8, 0x0
     baf:      	mov	rdx, r10
     bb2:      	mulx	rbp, rbx, r13
     bb7:      	shl	rdx, 0x20
     bbb:      	shr	r10, 0x20
     bbf:      	add	r12, rdx
     bc2:      	adc	r15, r10
     bc5:      	adc	r11, rbx
     bc8:      	adc	r14, rbp
     bcb:      	adc	r8, 0x0
     bcf:      	mov	r10, r12
     bd2:      	mov	rbx, r15
     bd5:      	mov	rbp, r11
     bd8:      	mov	rdx, r14
     bdb:      	mov	eax, 0xffffffff
     be0:      	sub	r10, -0x1
     be4:      	sbb	rbx, rax
     be7:      	sbb	rbp, 0x0
     beb:      	sbb	rdx, r13
     bee:      	sbb	r8, 0x0
     bf2:      	cmovae	r12, r10
     bf6:      	cmovae	r15, rbx
     bfa:      	cmovae	r11, rbp
     bfe:      	cmovae	r14, rdx
     c02:      	mov	qword ptr [rsp + 0x70], r12
     c07:      	mov	qword ptr [rsp + 0x28], r15
     c0c:      	mov	qword ptr [rsp + 0x30], r14
     c11:      	mov	qword ptr [rsp - 0x10], r11
     c16:      	mov	rax, qword ptr [rsp + 0x50]
     c1b:      	mov	rdx, qword ptr [rsp + 0x40]
     c20:      	mov	r11, qword ptr [rsp + 0x48]
     c25:      	mov	r15, qword ptr [rsp + 0x38]
     c2a:      	lea	r9, [rsp + 0x80]
     c32:      	mulx	rsi, rcx, qword ptr [r9]
     c37:      	mulx	rdi, rbp, qword ptr [r9 + 0x8]
     c3d:      	add	rsi, rbp
     c40:      	mulx	r8, rbp, qword ptr [r9 + 0x10]
     c46:      	adc	rdi, rbp
     c49:      	mulx	r10, rbp, qword ptr [r9 + 0x18]
     c4f:      	adc	r8, rbp
     c52:      	adc	r10, 0x0
     c56:      	xor	ebx, ebx
     c58:      	mov	rdx, rcx
     c5b:      	mulx	r14, rbp, r13
     c60:      	shl	rdx, 0x20
     c64:      	shr	rcx, 0x20
     c68:      	add	rsi, rdx
     c6b:      	adc	rdi, rcx
     c6e:      	adc	r8, rbp
     c71:      	adc	r10, r14
     c74:      	adc	rbx, 0x0
     c78:      	mov	rdx, rax
     c7b:      	xor	ecx, ecx
     c7d:      	mulx	r14, rbp, qword ptr [r9]
     c82:      	adcx	rsi, rbp
     c88:      	adox	rdi, r14
     c8e:      	mulx	r14, rbp, qword ptr [r9 + 0x8]
     c94:      	adcx	rdi, rbp
     c9a:      	adox	r8, r14
     ca0:      	mulx	r14, rbp, qword ptr [r9 + 0x10]
     ca6:      	adcx	r8, rbp
     cac:      	adox	r10, r14
     cb2:      	mulx	r14, rbp, qword ptr [r9 + 0x18]
     cb8:      	adcx	r10, rbp
     cbe:      	adox	rbx, r14
     cc4:      	adcx	rbx, rcx
     cca:      	adox	rcx, rcx
     cd0:      	adc	rcx, 0x0
     cd4:      	mov	rdx, rsi
     cd7:      	mulx	r14, rbp, r13
     cdc:      	shl	rdx, 0x20
     ce0:      	shr	rsi, 0x20
     ce4:      	add	rdi, rdx
     ce7:      	adc	r8, rsi
     cea:      	adc	r10, rbp
     ced:      	adc	rbx, r14
     cf0:      	adc	rcx, 0x0
     cf4:      	mov	rdx, r15
     cf7:      	xor	esi, esi
     cf9:      	mulx	r14, rbp, qword ptr [r9]
     cfe:      	adcx	rdi, rbp
     d04:      	adox	r8, r14
     d0a:      	mulx	r14, rbp, qword ptr [r9 + 0x8]
     d10:      	adcx	r8, rbp
     d16:      	adox	r10, r14
     d1c:      	mulx	r14, rbp, qword ptr [r9 + 0x10]
     d22:      	adcx	r10, rbp
     d28:      	adox	rbx, r14
     d2e:      	mulx	r14, rbp, qword ptr [r9 + 0x18]
     d34:      	adcx	rbx, rbp
     d3a:      	adox	rcx, r14
     d40:      	adcx	rcx, rsi
     d46:      	adox	rsi, rsi
     d4c:      	adc	rsi, 0x0
     d50:      	mov	rdx, rdi
     d53:      	mulx	r14, rbp, r13
     d58:      	shl	rdx, 0x20
     d5c:      	shr	rdi, 0x20
     d60:      	add	r8, rdx
     d63:      	adc	r10, rdi
     d66:      	adc	rbx, rbp
     d69:      	adc	rcx, r14
     d6c:      	adc	rsi, 0x0
     d70:      	mov	rdx, r11
     d73:      	xor	edi, edi
     d75:      	mulx	r14, rbp, qword ptr [r9]
     d7a:      	adcx	r8, rbp
     d80:      	adox	r10, r14
     d86:      	mulx	r14, rbp, qword ptr [r9 + 0x8]
     d8c:      	adcx	r10, rbp
     d92:      	adox	rbx, r14
     d98:      	mulx	r14, rbp, qword ptr [r9 + 0x10]
     d9e:      	adcx	rbx, rbp
     da4:      	adox	rcx, r14
     daa:      	mulx	r14, rbp, qword ptr [r9 + 0x18]
     db0:      	adcx	rcx, rbp
     db6:      	adox	rsi, r14
     dbc:      	adcx	rsi, rdi
     dc2:      	adox	rdi, rdi
     dc8:      	adc	rdi, 0x0
     dcc:      	mov	rdx, r8
     dcf:      	mulx	r14, rbp, r13
     dd4:      	shl	rdx, 0x20
     dd8:      	shr	r8, 0x20
     ddc:      	add	r10, rdx
     ddf:      	adc	rbx, r8
     de2:      	adc	rcx, rbp
     de5:      	adc	rsi, r14
     de8:      	adc	rdi, 0x0
     dec:      	mov	r8, r10
     def:      	mov	rbp, rbx
     df2:      	mov	r14, rcx
     df5:      	mov	rdx, rsi
     df8:      	mov	eax, 0xffffffff
     dfd:      	sub	r8, -0x1
     e01:      	sbb	rbp, rax
     e04:      	sbb	r14, 0x0
     e08:      	sbb	rdx, r13
     e0b:      	sbb	rdi, 0x0
     e0f:      	cmovae	r10, r8
     e13:      	cmovae	rbx, rbp
     e17:      	cmovae	rcx, r14
     e1b:      	cmovae	rsi, rdx
     e1f:      	mov	r8, r13
     e22:      	mov	qword ptr [rsp + 0x8], r10
     e27:      	mov	qword ptr [rsp + 0x10], rbx
     e2c:      	mov	qword ptr [rsp + 0x18], rcx
     e31:      	mov	qword ptr [rsp + 0x20], rsi
     e36:      	mov	rsi, qword ptr [rsp - 0x48]
     e3b:      	mov	rdx, qword ptr [rsi + 0x20]
     e3f:      	mov	rax, qword ptr [rsi + 0x28]
     e43:      	mov	rcx, qword ptr [rsi + 0x30]
     e47:      	mov	rsi, qword ptr [rsi + 0x38]
     e4b:      	lea	rdi, [rsp + 0x8]
     e50:      	mulx	r14, r15, qword ptr [rdi]
     e55:      	mulx	r9, rbx, qword ptr [rdi + 0x8]
     e5b:      	add	r14, rbx
     e5e:      	mulx	r10, rbx, qword ptr [rdi + 0x10]
     e64:      	adc	r9, rbx
     e67:      	mulx	r11, rbx, qword ptr [rdi + 0x18]
     e6d:      	adc	r10, rbx
     e70:      	adc	r11, 0x0
     e74:      	xor	r13d, r13d
     e77:      	mov	rdx, r15
     e7a:      	mulx	rbp, rbx, r8
     e7f:      	shl	rdx, 0x20
     e83:      	shr	r15, 0x20
     e87:      	add	r14, rdx
     e8a:      	adc	r9, r15
     e8d:      	adc	r10, rbx
     e90:      	adc	r11, rbp
     e93:      	adc	r13, 0x0
     e97:      	mov	rdx, rax
     e9a:      	xor	r15d, r15d
     e9d:      	mulx	rbp, rbx, qword ptr [rdi]
     ea2:      	adcx	r14, rbx
     ea8:      	adox	r9, rbp
     eae:      	mulx	rbp, rbx, qword ptr [rdi + 0x8]
     eb4:      	adcx	r9, rbx
     eba:      	adox	r10, rbp
     ec0:      	mulx	rbp, rbx, qword ptr [rdi + 0x10]
     ec6:      	adcx	r10, rbx
     ecc:      	adox	r11, rbp
     ed2:      	mulx	rbp, rbx, qword ptr [rdi + 0x18]
     ed8:      	adcx	r11, rbx
     ede:      	adox	r13, rbp
     ee4:      	adcx	r13, r15
     eea:      	adox	r15, r15
     ef0:      	adc	r15, 0x0
     ef4:      	mov	rdx, r14
     ef7:      	mulx	rbp, rbx, r8
     efc:      	shl	rdx, 0x20
     f00:      	shr	r14, 0x20
     f04:      	add	r9, rdx
     f07:      	adc	r10, r14
     f0a:      	adc	r11, rbx
     f0d:      	adc	r13, rbp
     f10:      	adc	r15, 0x0
     f14:      	mov	rdx, rcx
     f17:      	xor	r14d, r14d
     f1a:      	mulx	rbp, rbx, qword ptr [rdi]
     f1f:      	adcx	r9, rbx
     f25:      	adox	r10, rbp
     f2b:      	mulx	rbp, rbx, qword ptr [rdi + 0x8]
     f31:      	adcx	r10, rbx
     f37:      	adox	r11, rbp
     f3d:      	mulx	rbp, rbx, qword ptr [rdi + 0x10]
     f43:      	adcx	r11, rbx
     f49:      	adox	r13, rbp
     f4f:      	mulx	rbp, rbx, qword ptr [rdi + 0x18]
     f55:      	adcx	r13, rbx
     f5b:      	adox	r15, rbp
     f61:      	adcx	r15, r14
     f67:      	adox	r14, r14
     f6d:      	adc	r14, 0x0
     f71:      	mov	rdx, r9
     f74:      	mulx	rbp, rbx, r8
     f79:      	shl	rdx, 0x20
     f7d:      	shr	r9, 0x20
     f81:      	add	r10, rdx
     f84:      	adc	r11, r9
     f87:      	adc	r13, rbx
     f8a:      	adc	r15, rbp
     f8d:      	adc	r14, 0x0
     f91:      	mov	rdx, rsi
     f94:      	xor	r9d, r9d
     f97:      	mulx	rbp, rbx, qword ptr [rdi]
     f9c:      	adcx	r10, rbx
     fa2:      	adox	r11, rbp
     fa8:      	mulx	rbp, rbx, qword ptr [rdi + 0x8]
     fae:      	adcx	r11, rbx
     fb4:      	adox	r13, rbp
     fba:      	mulx	rbp, rbx, qword ptr [rdi + 0x10]
     fc0:      	adcx	r13, rbx
     fc6:      	adox	r15, rbp
     fcc:      	mulx	rbp, rbx, qword ptr [rdi + 0x18]
     fd2:      	adcx	r15, rbx
     fd8:      	adox	r14, rbp
     fde:      	adcx	r14, r9
     fe4:      	adox	r9, r9
     fea:      	adc	r9, 0x0
     fee:      	mov	rdx, r10
     ff1:      	mulx	rbp, rbx, r8
     ff6:      	shl	rdx, 0x20
     ffa:      	shr	r10, 0x20
     ffe:      	add	r11, rdx
    1001:      	adc	r13, r10
    1004:      	adc	r15, rbx
    1007:      	adc	r14, rbp
    100a:      	adc	r9, 0x0
    100e:      	mov	r10, r11
    1011:      	mov	rbx, r13
    1014:      	mov	rbp, r15
    1017:      	mov	rdx, r14
    101a:      	mov	eax, 0xffffffff
    101f:      	sub	r10, -0x1
    1023:      	sbb	rbx, rax
    1026:      	sbb	rbp, 0x0
    102a:      	sbb	rdx, r8
    102d:      	sbb	r9, 0x0
    1031:      	cmovae	r11, r10
    1035:      	cmovae	r13, rbx
    1039:      	cmovae	r15, rbp
    103d:      	cmovae	r14, rdx
    1041:      	mov	rax, qword ptr [rsp - 0x60]
    1046:      	mov	rcx, qword ptr [rsp - 0x80]
    104b:      	mov	rdx, qword ptr [rsp - 0x50]
    1050:      	mov	rdi, qword ptr [rsp]
    1054:      	mov	rsi, qword ptr [rsp - 0x8]
    1059:      	mov	r8, qword ptr [rsp - 0x28]
    105e:      	mov	r9, qword ptr [rsp - 0x40]
    1063:      	mov	r10, qword ptr [rsp - 0x58]
    1068:      	sub	r8, rcx
    106b:      	sbb	r9, rdx
    106e:      	sbb	rsi, r10
    1071:      	sbb	rdi, rax
    1074:      	sbb	rcx, rcx
    1077:      	mov	rdx, rcx
    107a:      	shr	rdx, 0x20
    107e:      	mov	rax, rcx
    1081:      	shl	rax, 0x20
    1085:      	sub	rax, rcx
    1088:      	add	r8, rcx
    108b:      	adc	r9, rdx
    108e:      	adc	rsi, 0x0
    1092:      	adc	rdi, rax
    1095:      	mov	qword ptr [rsp - 0x40], r9
    109a:      	mov	qword ptr [rsp], rdi
    109e:      	mov	qword ptr [rsp - 0x8], rsi
    10a3:      	mov	rcx, qword ptr [rsp + 0x28]
    10a8:      	mov	rdx, qword ptr [rsp + 0x30]
    10ad:      	mov	r10, qword ptr [rsp - 0x10]
    10b2:      	sub	r11, r12
    10b5:      	sbb	r13, rcx
    10b8:      	sbb	r15, r10
    10bb:      	sbb	r14, rdx
    10be:      	sbb	r12, r12
    10c1:      	mov	rcx, r12
    10c4:      	shr	rcx, 0x20
    10c8:      	mov	rdx, r12
    10cb:      	shl	rdx, 0x20
    10cf:      	sub	rdx, r12
    10d2:      	add	r11, r12
    10d5:      	adc	r13, rcx
    10d8:      	adc	r15, 0x0
    10dc:      	adc	r14, rdx
    10df:      	mov	qword ptr [rsp - 0x70], r11
    10e4:      	mov	qword ptr [rsp - 0x68], r13
    10e9:      	mov	qword ptr [rsp - 0x20], r15
    10ee:      	mov	qword ptr [rsp - 0x18], r14
    10f3:      	mov	rax, rsi
    10f6:      	mov	rcx, r9
    10f9:      	mov	rsi, rdi
    10fc:      	mov	rdi, r8
    10ff:      	mov	qword ptr [rsp - 0x28], r8
    1104:      	mov	rdx, rdi
    1107:      	mulx	r10, r9, rcx
    110c:      	mulx	rbx, r12, rax
    1111:      	add	r10, r12
    1114:      	mulx	r14, r12, rsi
    1119:      	adc	rbx, r12
    111c:      	adc	r14, 0x0
    1120:      	mov	rdx, rcx
    1123:      	mulx	r15, r12, rax
    1128:      	add	rbx, r12
    112b:      	adc	r14, r15
    112e:      	mulx	r13, r12, rsi
    1133:      	adc	r13, 0x0
    1137:      	add	r14, r12
    113a:      	adc	r13, 0x0
    113e:      	mov	rdx, rax
    1141:      	mulx	rbp, r12, rsi
    1146:      	add	r13, r12
    1149:      	adc	rbp, 0x0
    114d:      	xor	r11d, r11d
    1150:      	add	r9, r9
    1153:      	adc	r10, r10
    1156:      	adc	rbx, rbx
    1159:      	adc	r14, r14
    115c:      	adc	r13, r13
    115f:      	adc	rbp, rbp
    1162:      	adc	r11, 0x0
    1166:      	mov	rdx, rdi
    1169:      	mulx	r15, rdi, rdx
    116e:      	add	r9, r15
    1171:      	mov	rdx, rcx
    1174:      	mulx	r15, r12, rdx
    1179:      	adc	r10, r12
    117c:      	adc	rbx, r15
    117f:      	mov	rdx, rax
    1182:      	mulx	r15, r12, rdx
    1187:      	adc	r14, r12
    118a:      	adc	r13, r15
    118d:      	mov	rdx, rsi
    1190:      	mulx	r15, r12, rdx
    1195:      	adc	rbp, r12
    1198:      	adc	r11, r15
    119b:      	movabs	rcx, -0xffffffff
    11a5:      	mov	rdx, rdi
    11a8:      	mulx	r15, r12, rcx
    11ad:      	shl	rdx, 0x20
    11b1:      	shr	rdi, 0x20
    11b5:      	add	r9, rdx
    11b8:      	adc	r10, rdi
    11bb:      	adc	rbx, r12
    11be:      	adc	r14, r15
    11c1:      	adc	r13, 0x0
    11c5:      	adc	rbp, 0x0
    11c9:      	adc	r11, 0x0
    11cd:      	mov	edi, 0x0
    11d2:      	adc	rdi, 0x0
    11d6:      	mov	rdx, r9
    11d9:      	mulx	r15, r12, rcx
    11de:      	shl	rdx, 0x20
    11e2:      	shr	r9, 0x20
    11e6:      	add	r10, rdx
    11e9:      	adc	rbx, r9
    11ec:      	adc	r14, r12
    11ef:      	adc	r13, r15
    11f2:      	adc	rbp, 0x0
    11f6:      	adc	r11, 0x0
    11fa:      	adc	rdi, 0x0
    11fe:      	mov	rdx, r10
    1201:      	mulx	r15, r12, rcx
    1206:      	shl	rdx, 0x20
    120a:      	shr	r10, 0x20
    120e:      	add	rbx, rdx
    1211:      	adc	r14, r10
    1214:      	adc	r13, r12
    1217:      	adc	rbp, r15
    121a:      	adc	r11, 0x0
    121e:      	adc	rdi, 0x0
    1222:      	mov	rdx, rbx
    1225:      	mulx	r15, r12, rcx
    122a:      	shl	rdx, 0x20
    122e:      	shr	rbx, 0x20
    1232:      	add	r14, rdx
    1235:      	adc	r13, rbx
    1238:      	adc	rbp, r12
    123b:      	adc	r11, r15
    123e:      	adc	rdi, 0x0
    1242:      	mov	rax, r14
    1245:      	mov	rsi, r13
    1248:      	mov	r9, rbp
    124b:      	mov	rdx, r11
    124e:      	mov	r12d, 0xffffffff
    1254:      	sub	rax, -0x1
    1258:      	sbb	rsi, r12
    125b:      	sbb	r9, 0x0
    125f:      	sbb	rdx, rcx
    1262:      	sbb	rdi, 0x0
    1266:      	cmovae	r14, rax
    126a:      	cmovae	r13, rsi
    126e:      	cmovae	rbp, r9
    1272:      	cmovae	r11, rdx
    1276:      	mov	qword ptr [rsp - 0x38], r13
    127b:      	mov	qword ptr [rsp - 0x30], rbp
    1280:      	mov	qword ptr [rsp - 0x78], r11
    1285:      	mov	qword ptr [rsp + 0xc0], r14
    128d:      	mov	rax, qword ptr [rsp - 0x38]
    1292:      	mov	qword ptr [rsp + 0xc8], rax
    129a:      	mov	rax, qword ptr [rsp - 0x30]
    129f:      	mov	qword ptr [rsp + 0xd0], rax
    12a7:      	mov	rax, qword ptr [rsp - 0x78]
    12ac:      	mov	qword ptr [rsp + 0xd8], rax
    12b4:      	lea	rbp, [rsp + 0xc0]
    12bc:      	mov	rcx, qword ptr [rsp - 0x40]
    12c1:      	mov	rdx, r8
    12c4:      	movabs	rax, -0xffffffff
    12ce:      	mov	r11, qword ptr [rsp - 0x8]
    12d3:      	mov	r12, qword ptr [rsp]
    12d7:      	mulx	r13, r9, qword ptr [rbp]
    12dd:      	mulx	rsi, r8, qword ptr [rbp + 0x8]
    12e3:      	add	r13, r8
    12e6:      	mulx	rdi, r8, qword ptr [rbp + 0x10]
    12ec:      	adc	rsi, r8
    12ef:      	mulx	rbx, r8, qword ptr [rbp + 0x18]
    12f5:      	adc	rdi, r8
    12f8:      	adc	rbx, 0x0
    12fc:      	xor	r14d, r14d
    12ff:      	mov	rdx, r9
    1302:      	mulx	r10, r8, rax
    1307:      	shl	rdx, 0x20
    130b:      	shr	r9, 0x20
    130f:      	add	r13, rdx
    1312:      	adc	rsi, r9
    1315:      	adc	rdi, r8
    1318:      	adc	rbx, r10
    131b:      	adc	r14, 0x0
    131f:      	mov	rdx, rcx
    1322:      	xor	r9d, r9d
    1325:      	mulx	r10, r8, qword ptr [rbp]
    132b:      	adcx	r13, r8
    1331:      	adox	rsi, r10
    1337:      	mulx	r10, r8, qword ptr [rbp + 0x8]
    133d:      	adcx	rsi, r8
    1343:      	adox	rdi, r10
    1349:      	mulx	r10, r8, qword ptr [rbp + 0x10]
    134f:      	adcx	rdi, r8
    1355:      	adox	rbx, r10
    135b:      	mulx	r10, r8, qword ptr [rbp + 0x18]
    1361:      	adcx	rbx, r8
    1367:      	adox	r14, r10
    136d:      	adcx	r14, r9
    1373:      	adox	r9, r9
    1379:      	adc	r9, 0x0
    137d:      	mov	rdx, r13
    1380:      	mulx	r10, r8, rax
    1385:      	shl	rdx, 0x20
    1389:      	shr	r13, 0x20
    138d:      	add	rsi, rdx
    1390:      	adc	rdi, r13
    1393:      	adc	rbx, r8
    1396:      	adc	r14, r10
    1399:      	adc	r9, 0x0
    139d:      	mov	rdx, r11
    13a0:      	xor	r13d, r13d
    13a3:      	mulx	r10, r8, qword ptr [rbp]
    13a9:      	adcx	rsi, r8
    13af:      	adox	rdi, r10
    13b5:      	mulx	r10, r8, qword ptr [rbp + 0x8]
    13bb:      	adcx	rdi, r8
    13c1:      	adox	rbx, r10
    13c7:      	mulx	r10, r8, qword ptr [rbp + 0x10]
    13cd:      	adcx	rbx, r8
    13d3:      	adox	r14, r10
    13d9:      	mulx	r10, r8, qword ptr [rbp + 0x18]
    13df:      	adcx	r14, r8
    13e5:      	adox	r9, r10
    13eb:      	adcx	r9, r13
    13f1:      	adox	r13, r13
    13f7:      	adc	r13, 0x0
    13fb:      	mov	rdx, rsi
    13fe:      	mulx	r10, r8, rax
    1403:      	shl	rdx, 0x20
    1407:      	shr	rsi, 0x20
    140b:      	add	rdi, rdx
    140e:      	adc	rbx, rsi
    1411:      	adc	r14, r8
    1414:      	adc	r9, r10
    1417:      	adc	r13, 0x0
    141b:      	mov	rdx, r12
    141e:      	xor	esi, esi
    1420:      	mulx	r10, r8, qword ptr [rbp]
    1426:      	adcx	rdi, r8
    142c:      	adox	rbx, r10
    1432:      	mulx	r10, r8, qword ptr [rbp + 0x8]
    1438:      	adcx	rbx, r8
    143e:      	adox	r14, r10
    1444:      	mulx	r10, r8, qword ptr [rbp + 0x10]
    144a:      	adcx	r14, r8
    1450:      	adox	r9, r10
    1456:      	mulx	r10, r8, qword ptr [rbp + 0x18]
    145c:      	adcx	r9, r8
    1462:      	adox	r13, r10
    1468:      	adcx	r13, rsi
    146e:      	adox	rsi, rsi
    1474:      	adc	rsi, 0x0
    1478:      	mov	rdx, rdi
    147b:      	mulx	r10, r8, rax
    1480:      	shl	rdx, 0x20
    1484:      	shr	rdi, 0x20
    1488:      	add	rbx, rdx
    148b:      	adc	r14, rdi
    148e:      	adc	r9, r8
    1491:      	adc	r13, r10
    1494:      	adc	rsi, 0x0
    1498:      	mov	rdi, rbx
    149b:      	mov	r8, r14
    149e:      	mov	r10, r9
    14a1:      	mov	rdx, r13
    14a4:      	mov	ecx, 0xffffffff
    14a9:      	sub	rdi, -0x1
    14ad:      	sbb	r8, rcx
    14b0:      	sbb	r10, 0x0
    14b4:      	sbb	rdx, rax
    14b7:      	sbb	rsi, 0x0
    14bb:      	cmovae	rbx, rdi
    14bf:      	cmovae	r14, r8
    14c3:      	cmovae	r9, r10
    14c7:      	cmovae	r13, rdx
    14cb:      	mov	qword ptr [rsp + 0x58], r9
    14d0:      	mov	qword ptr [rsp - 0x38], r14
    14d5:      	mov	qword ptr [rsp - 0x30], rbx
    14da:      	mov	qword ptr [rsp + 0xe0], rbx
    14e2:      	mov	qword ptr [rsp + 0xe8], r14
    14ea:      	mov	qword ptr [rsp + 0xf0], r9
    14f2:      	mov	qword ptr [rsp + 0xf8], r13
    14fa:      	mov	rdx, qword ptr [rsp - 0x80]
    14ff:      	mov	rsi, qword ptr [rsp - 0x50]
    1504:      	mov	rdi, qword ptr [rsp - 0x58]
    1509:      	mov	r10, qword ptr [rsp - 0x60]
    150e:      	mulx	r12, r11, qword ptr [rbp]
    1514:      	mulx	rcx, r14, qword ptr [rbp + 0x8]
    151a:      	add	r12, r14
    151d:      	mulx	r8, r14, qword ptr [rbp + 0x10]
    1523:      	adc	rcx, r14
    1526:      	mulx	rbx, r14, qword ptr [rbp + 0x18]
    152c:      	adc	r8, r14
    152f:      	adc	rbx, 0x0
    1533:      	xor	r9d, r9d
    1536:      	mov	rdx, r11
    1539:      	mulx	r15, r14, rax
    153e:      	shl	rdx, 0x20
    1542:      	shr	r11, 0x20
    1546:      	add	r12, rdx
    1549:      	adc	rcx, r11
    154c:      	adc	r8, r14
    154f:      	adc	rbx, r15
    1552:      	adc	r9, 0x0
    1556:      	mov	rdx, rsi
    1559:      	xor	r11d, r11d
    155c:      	mulx	r15, r14, qword ptr [rbp]
    1562:      	adcx	r12, r14
    1568:      	adox	rcx, r15
    156e:      	mulx	r15, r14, qword ptr [rbp + 0x8]
    1574:      	adcx	rcx, r14
    157a:      	adox	r8, r15
    1580:      	mulx	r15, r14, qword ptr [rbp + 0x10]
    1586:      	adcx	r8, r14
    158c:      	adox	rbx, r15
    1592:      	mulx	r15, r14, qword ptr [rbp + 0x18]
    1598:      	adcx	rbx, r14
    159e:      	adox	r9, r15
    15a4:      	adcx	r9, r11
    15aa:      	adox	r11, r11
    15b0:      	adc	r11, 0x0
    15b4:      	mov	rdx, r12
    15b7:      	mulx	r15, r14, rax
    15bc:      	shl	rdx, 0x20
    15c0:      	shr	r12, 0x20
    15c4:      	add	rcx, rdx
    15c7:      	adc	r8, r12
    15ca:      	adc	rbx, r14
    15cd:      	adc	r9, r15
    15d0:      	adc	r11, 0x0
    15d4:      	mov	rdx, rdi
    15d7:      	xor	r12d, r12d
    15da:      	mulx	r15, r14, qword ptr [rbp]
    15e0:      	adcx	rcx, r14
    15e6:      	adox	r8, r15
    15ec:      	mulx	r15, r14, qword ptr [rbp + 0x8]
    15f2:      	adcx	r8, r14
    15f8:      	adox	rbx, r15
    15fe:      	mulx	r15, r14, qword ptr [rbp + 0x10]
    1604:      	adcx	rbx, r14
    160a:      	adox	r9, r15
    1610:      	mulx	r15, r14, qword ptr [rbp + 0x18]
    1616:      	adcx	r9, r14
    161c:      	adox	r11, r15
    1622:      	adcx	r11, r12
    1628:      	adox	r12, r12
    162e:      	adc	r12, 0x0
    1632:      	mov	rdx, rcx
    1635:      	mulx	r15, r14, rax
    163a:      	shl	rdx, 0x20
    163e:      	shr	rcx, 0x20
    1642:      	add	r8, rdx
    1645:      	adc	rbx, rcx
    1648:      	adc	r9, r14
    164b:      	adc	r11, r15
    164e:      	adc	r12, 0x0
    1652:      	mov	rdx, r10
    1655:      	xor	ecx, ecx
    1657:      	mulx	r15, r14, qword ptr [rbp]
    165d:      	adcx	r8, r14
    1663:      	adox	rbx, r15
    1669:      	mulx	r15, r14, qword ptr [rbp + 0x8]
    166f:      	adcx	rbx, r14
    1675:      	adox	r9, r15
    167b:      	mulx	r15, r14, qword ptr [rbp + 0x10]
    1681:      	adcx	r9, r14
    1687:      	adox	r11, r15
    168d:      	mulx	r15, r14, qword ptr [rbp + 0x18]
    1693:      	adcx	r11, r14
    1699:      	adox	r12, r15
    169f:      	adcx	r12, rcx
    16a5:      	adox	rcx, rcx
    16ab:      	adc	rcx, 0x0
    16af:      	mov	rdx, r8
    16b2:      	mulx	r15, r14, rax
    16b7:      	shl	rdx, 0x20
    16bb:      	shr	r8, 0x20
    16bf:      	add	rbx, rdx
    16c2:      	adc	r9, r8
    16c5:      	adc	r11, r14
    16c8:      	adc	r12, r15
    16cb:      	adc	rcx, 0x0
    16cf:      	mov	r8, rbx
    16d2:      	mov	r14, r9
    16d5:      	mov	r15, r11
    16d8:      	mov	rdx, r12
    16db:      	mov	esi, 0xffffffff
    16e0:      	sub	r8, -0x1
    16e4:      	sbb	r14, rsi
    16e7:      	sbb	r15, 0x0
    16eb:      	sbb	rdx, rax
    16ee:      	sbb	rcx, 0x0
    16f2:      	cmovae	rbx, r8
    16f6:      	cmovae	r9, r14
    16fa:      	cmovae	r11, r15
    16fe:      	cmovae	r12, rdx
    1702:      	mov	qword ptr [rsp + 0x60], rbx
    1707:      	mov	qword ptr [rsp + 0x68], r9
    170c:      	mov	qword ptr [rsp - 0x78], r12
    1711:      	mov	qword ptr [rsp - 0x80], r11
    1716:      	mov	rcx, qword ptr [rsp - 0x70]
    171b:      	mov	r8, qword ptr [rsp - 0x20]
    1720:      	mov	rax, qword ptr [rsp - 0x68]
    1725:      	mov	r14, qword ptr [rsp - 0x18]
    172a:      	mov	rdx, rcx
    172d:      	mulx	rbp, r15, rax
    1732:      	mulx	rsi, rdi, r8
    1737:      	add	rbp, rdi
    173a:      	mulx	r9, rdi, r14
    173f:      	adc	rsi, rdi
    1742:      	adc	r9, 0x0
    1746:      	mov	rdx, rax
    1749:      	mulx	r10, rdi, r8
    174e:      	add	rsi, rdi
    1751:      	adc	r9, r10
    1754:      	mulx	rbx, rdi, r14
    1759:      	adc	rbx, 0x0
    175d:      	add	r9, rdi
    1760:      	adc	rbx, 0x0
    1764:      	mov	rdx, r8
    1767:      	mulx	r12, rdi, r14
    176c:      	add	rbx, rdi
    176f:      	adc	r12, 0x0
    1773:      	xor	r11d, r11d
    1776:      	add	r15, r15
    1779:      	adc	rbp, rbp
    177c:      	adc	rsi, rsi
    177f:      	adc	r9, r9
    1782:      	adc	rbx, rbx
    1785:      	adc	r12, r12
    1788:      	adc	r11, 0x0
    178c:      	mov	rdx, rcx
    178f:      	mulx	r10, rcx, rdx
    1794:      	add	r15, r10
    1797:      	mov	rdx, rax
    179a:      	mulx	r10, rdi, rdx
    179f:      	adc	rbp, rdi
    17a2:      	adc	rsi, r10
    17a5:      	mov	rdx, r8
    17a8:      	mulx	r10, rdi, rdx
    17ad:      	adc	r9, rdi
    17b0:      	adc	rbx, r10
    17b3:      	mov	rdx, r14
    17b6:      	mulx	r10, rdi, rdx
    17bb:      	adc	r12, rdi
    17be:      	adc	r11, r10
    17c1:      	movabs	rax, -0xffffffff
    17cb:      	mov	rdx, rcx
    17ce:      	mulx	r10, rdi, rax
    17d3:      	shl	rdx, 0x20
    17d7:      	shr	rcx, 0x20
    17db:      	add	r15, rdx
    17de:      	adc	rbp, rcx
    17e1:      	adc	rsi, rdi
    17e4:      	adc	r9, r10
    17e7:      	adc	rbx, 0x0
    17eb:      	adc	r12, 0x0
    17ef:      	adc	r11, 0x0
    17f3:      	mov	ecx, 0x0
    17f8:      	adc	rcx, 0x0
    17fc:      	mov	rdx, r15
    17ff:      	mulx	r10, rdi, rax
    1804:      	shl	rdx, 0x20
    1808:      	shr	r15, 0x20
    180c:      	add	rbp, rdx
    180f:      	adc	rsi, r15
    1812:      	adc	r9, rdi
    1815:      	adc	rbx, r10
    1818:      	adc	r12, 0x0
    181c:      	adc	r11, 0x0
    1820:      	adc	rcx, 0x0
    1824:      	mov	rdx, rbp
    1827:      	mulx	r10, rdi, rax
    182c:      	shl	rdx, 0x20
    1830:      	shr	rbp, 0x20
    1834:      	add	rsi, rdx
    1837:      	adc	r9, rbp
    183a:      	adc	rbx, rdi
    183d:      	adc	r12, r10
    1840:      	adc	r11, 0x0
    1844:      	adc	rcx, 0x0
    1848:      	mov	rdx, rsi
    184b:      	mulx	r10, rdi, rax
    1850:      	shl	rdx, 0x20
    1854:      	shr	rsi, 0x20
    1858:      	add	r9, rdx
    185b:      	adc	rbx, rsi
    185e:      	adc	r12, rdi
    1861:      	adc	r11, r10
    1864:      	adc	rcx, 0x0
    1868:      	mov	r8, r9
    186b:      	mov	r14, rbx
    186e:      	mov	r15, r12
    1871:      	mov	rdx, r11
    1874:      	mov	edi, 0xffffffff
    1879:      	sub	r8, -0x1
    187d:      	sbb	r14, rdi
    1880:      	sbb	r15, 0x0
    1884:      	sbb	rdx, rax
    1887:      	sbb	rcx, 0x0
    188b:      	cmovae	r9, r8
    188f:      	cmovae	rbx, r14
    1893:      	cmovae	r12, r15
    1897:      	cmovae	r11, rdx
    189b:      	mov	rax, qword ptr [rsp - 0x30]
    18a0:      	mov	rcx, qword ptr [rsp - 0x38]
    18a5:      	mov	rdx, qword ptr [rsp + 0x58]
    18aa:      	sub	r9, rax
    18ad:      	sbb	rbx, rcx
    18b0:      	sbb	r12, rdx
    18b3:      	sbb	r11, r13
    18b6:      	sbb	rax, rax
    18b9:      	mov	rcx, rax
    18bc:      	shr	rcx, 0x20
    18c0:      	mov	r13, rax
    18c3:      	shl	r13, 0x20
    18c7:      	sub	r13, rax
    18ca:      	add	r9, rax
    18cd:      	adc	rbx, rcx
    18d0:      	adc	r12, 0x0
    18d4:      	adc	r11, r13
    18d7:      	mov	qword ptr [rsp - 0x50], rbx
    18dc:      	mov	qword ptr [rsp - 0x58], r9
    18e1:      	mov	rax, qword ptr [rsp - 0x78]
    18e6:      	mov	r15, qword ptr [rsp + 0x60]
    18eb:      	mov	rcx, r15
    18ee:      	mov	rdx, qword ptr [rsp - 0x80]
    18f3:      	mov	r13, qword ptr [rsp + 0x68]
    18f8:      	mov	rsi, r13
    18fb:      	xor	ebx, ebx
    18fd:      	add	rcx, rcx
    1900:      	adc	rsi, rsi
    1903:      	adc	rdx, rdx
    1906:      	adc	rax, rax
    1909:      	adc	rbx, 0x0
    190d:      	mov	rdi, rcx
    1910:      	mov	r8, rsi
    1913:      	mov	r9, rdx
    1916:      	mov	r10, rax
    1919:      	mov	ebp, 0xffffffff
    191e:      	movabs	r14, -0xffffffff
    1928:      	sub	rdi, -0x1
    192c:      	sbb	r8, rbp
    192f:      	sbb	r9, 0x0
    1933:      	sbb	r10, r14
    1936:      	sbb	rbx, 0x0
    193a:      	cmovae	rcx, rdi
    193e:      	cmovae	rsi, r8
    1942:      	cmovae	rdx, r9
    1946:      	cmovae	rax, r10
    194a:      	mov	rdi, qword ptr [rsp - 0x50]
    194f:      	mov	r8, qword ptr [rsp - 0x58]
    1954:      	sub	r8, rcx
    1957:      	sbb	rdi, rsi
    195a:      	sbb	r12, rdx
    195d:      	sbb	r11, rax
    1960:      	sbb	rcx, rcx
    1963:      	mov	rsi, rcx
    1966:      	shr	rsi, 0x20
    196a:      	mov	rax, rcx
    196d:      	shl	rax, 0x20
    1971:      	sub	rax, rcx
    1974:      	add	r8, rcx
    1977:      	adc	rdi, rsi
    197a:      	adc	r12, 0x0
    197e:      	adc	r11, rax
    1981:      	mov	qword ptr [rsp - 0x58], r8
    1986:      	mov	qword ptr [rsp - 0x38], r12
    198b:      	mov	qword ptr [rsp - 0x50], rdi
    1990:      	mov	qword ptr [rsp - 0x30], r11
    1995:      	mov	rax, rdi
    1998:      	mov	rdx, r8
    199b:      	mov	rsi, qword ptr [rsp - 0x78]
    19a0:      	mov	rdi, qword ptr [rsp - 0x80]
    19a5:      	mov	r8, r13
    19a8:      	mov	r9, r15
    19ab:      	sub	r9, rdx
    19ae:      	sbb	r8, rax
    19b1:      	sbb	rdi, r12
    19b4:      	sbb	rsi, r11
    19b7:      	sbb	rdx, rdx
    19ba:      	mov	rax, rdx
    19bd:      	shr	rax, 0x20
    19c1:      	mov	r11, rdx
    19c4:      	shl	r11, 0x20
    19c8:      	sub	r11, rdx
    19cb:      	add	r9, rdx
    19ce:      	adc	r8, rax
    19d1:      	adc	rdi, 0x0
    19d5:      	adc	rsi, r11
    19d8:      	mov	qword ptr [rsp + 0x8], r9
    19dd:      	mov	qword ptr [rsp + 0x10], r8
    19e2:      	mov	qword ptr [rsp + 0x18], rdi
    19e7:      	mov	qword ptr [rsp + 0x20], rsi
    19ec:      	lea	rax, [rsp + 0x8]
    19f1:      	mov	rcx, qword ptr [rsp - 0x68]
    19f6:      	mov	rdx, qword ptr [rsp - 0x70]
    19fb:      	movabs	r12, -0xffffffff
    1a05:      	mov	r10, qword ptr [rsp - 0x18]
    1a0a:      	mov	r14, qword ptr [rsp - 0x20]
    1a0f:      	mulx	rdi, rsi, qword ptr [rax]
    1a14:      	mulx	r8, rbx, qword ptr [rax + 0x8]
    1a1a:      	add	rdi, rbx
    1a1d:      	mulx	r9, rbx, qword ptr [rax + 0x10]
    1a23:      	adc	r8, rbx
    1a26:      	mulx	r15, rbx, qword ptr [rax + 0x18]
    1a2c:      	adc	r9, rbx
    1a2f:      	adc	r15, 0x0
    1a33:      	xor	r11d, r11d
    1a36:      	mov	rdx, rsi
    1a39:      	mulx	rbp, rbx, r12
    1a3e:      	shl	rdx, 0x20
    1a42:      	shr	rsi, 0x20
    1a46:      	add	rdi, rdx
    1a49:      	adc	r8, rsi
    1a4c:      	adc	r9, rbx
    1a4f:      	adc	r15, rbp
    1a52:      	adc	r11, 0x0
    1a56:      	mov	rdx, rcx
    1a59:      	xor	esi, esi
    1a5b:      	mulx	rbp, rbx, qword ptr [rax]
    1a60:      	adcx	rdi, rbx
    1a66:      	adox	r8, rbp
    1a6c:      	mulx	rbp, rbx, qword ptr [rax + 0x8]
    1a72:      	adcx	r8, rbx
    1a78:      	adox	r9, rbp
    1a7e:      	mulx	rbp, rbx, qword ptr [rax + 0x10]
    1a84:      	adcx	r9, rbx
    1a8a:      	adox	r15, rbp
    1a90:      	mulx	rbp, rbx, qword ptr [rax + 0x18]
    1a96:      	adcx	r15, rbx
    1a9c:      	adox	r11, rbp
    1aa2:      	adcx	r11, rsi
    1aa8:      	adox	rsi, rsi
    1aae:      	adc	rsi, 0x0
    1ab2:      	mov	rdx, rdi
    1ab5:      	mulx	rbp, rbx, r12
    1aba:      	shl	rdx, 0x20
    1abe:      	shr	rdi, 0x20
    1ac2:      	add	r8, rdx
    1ac5:      	adc	r9, rdi
    1ac8:      	adc	r15, rbx
    1acb:      	adc	r11, rbp
    1ace:      	adc	rsi, 0x0
    1ad2:      	mov	rdx, r14
    1ad5:      	xor	edi, edi
    1ad7:      	mulx	rbp, rbx, qword ptr [rax]
    1adc:      	adcx	r8, rbx
    1ae2:      	adox	r9, rbp
    1ae8:      	mulx	rbp, rbx, qword ptr [rax + 0x8]
    1aee:      	adcx	r9, rbx
    1af4:      	adox	r15, rbp
    1afa:      	mulx	rbp, rbx, qword ptr [rax + 0x10]
    1b00:      	adcx	r15, rbx
    1b06:      	adox	r11, rbp
    1b0c:      	mulx	rbp, rbx, qword ptr [rax + 0x18]
    1b12:      	adcx	r11, rbx
    1b18:      	adox	rsi, rbp
    1b1e:      	adcx	rsi, rdi
    1b24:      	adox	rdi, rdi
    1b2a:      	adc	rdi, 0x0
    1b2e:      	mov	rdx, r8
    1b31:      	mulx	rbp, rbx, r12
    1b36:      	shl	rdx, 0x20
    1b3a:      	shr	r8, 0x20
    1b3e:      	add	r9, rdx
    1b41:      	adc	r15, r8
    1b44:      	adc	r11, rbx
    1b47:      	adc	rsi, rbp
    1b4a:      	adc	rdi, 0x0
    1b4e:      	mov	rdx, r10
    1b51:      	xor	r8d, r8d
    1b54:      	mulx	rbp, rbx, qword ptr [rax]
    1b59:      	adcx	r9, rbx
    1b5f:      	adox	r15, rbp
    1b65:      	mulx	rbp, rbx, qword ptr [rax + 0x8]
    1b6b:      	adcx	r15, rbx
    1b71:      	adox	r11, rbp
    1b77:      	mulx	rbp, rbx, qword ptr [rax + 0x10]
    1b7d:      	adcx	r11, rbx
    1b83:      	adox	rsi, rbp
    1b89:      	mulx	rbp, rbx, qword ptr [rax + 0x18]
    1b8f:      	adcx	rsi, rbx
    1b95:      	adox	rdi, rbp
    1b9b:      	adcx	rdi, r8
    1ba1:      	adox	r8, r8
    1ba7:      	adc	r8, 0x0
    1bab:      	mov	rdx, r9
    1bae:      	mulx	rbp, rbx, r12
    1bb3:      	shl	rdx, 0x20
    1bb7:      	shr	r9, 0x20
    1bbb:      	add	r15, rdx
    1bbe:      	adc	r11, r9
    1bc1:      	adc	rsi, rbx
    1bc4:      	adc	rdi, rbp
    1bc7:      	adc	r8, 0x0
    1bcb:      	mov	r9, r15
    1bce:      	mov	rbx, r11
    1bd1:      	mov	rbp, rsi
    1bd4:      	mov	rdx, rdi
    1bd7:      	mov	ecx, 0xffffffff
    1bdc:      	sub	r9, -0x1
    1be0:      	sbb	rbx, rcx
    1be3:      	sbb	rbp, 0x0
    1be7:      	sbb	rdx, r12
    1bea:      	sbb	r8, 0x0
    1bee:      	cmovae	r15, r9
    1bf2:      	cmovae	r11, rbx
    1bf6:      	cmovae	rsi, rbp
    1bfa:      	cmovae	rdi, rdx
    1bfe:      	mov	qword ptr [rsp - 0x80], rdi
    1c03:      	mov	qword ptr [rsp - 0x78], r11
    1c08:      	mov	qword ptr [rsp - 0x60], r15
    1c0d:      	mov	rdx, qword ptr [rsp + 0x70]
    1c12:      	mov	r10, qword ptr [rsp - 0x10]
    1c17:      	mov	r12, qword ptr [rsp + 0x30]
    1c1c:      	mov	rax, qword ptr [rsp + 0x28]
    1c21:      	movabs	r11, -0xffffffff
    1c2b:      	lea	rdi, [rsp + 0xe0]
    1c33:      	mulx	r13, rbp, qword ptr [rdi]
    1c38:      	mulx	rcx, r9, qword ptr [rdi + 0x8]
    1c3e:      	add	r13, r9
    1c41:      	mulx	r8, r9, qword ptr [rdi + 0x10]
    1c47:      	adc	rcx, r9
    1c4a:      	mulx	r14, r9, qword ptr [rdi + 0x18]
    1c50:      	adc	r8, r9
    1c53:      	adc	r14, 0x0
    1c57:      	xor	r15d, r15d
    1c5a:      	mov	rdx, rbp
    1c5d:      	mulx	rbx, r9, r11
    1c62:      	shl	rdx, 0x20
    1c66:      	shr	rbp, 0x20
    1c6a:      	add	r13, rdx
    1c6d:      	adc	rcx, rbp
    1c70:      	adc	r8, r9
    1c73:      	adc	r14, rbx
    1c76:      	adc	r15, 0x0
    1c7a:      	mov	rdx, rax
    1c7d:      	xor	ebp, ebp
    1c7f:      	mulx	rbx, r9, qword ptr [rdi]
    1c84:      	adcx	r13, r9
    1c8a:      	adox	rcx, rbx
    1c90:      	mulx	rbx, r9, qword ptr [rdi + 0x8]
    1c96:      	adcx	rcx, r9
    1c9c:      	adox	r8, rbx
    1ca2:      	mulx	rbx, r9, qword ptr [rdi + 0x10]
    1ca8:      	adcx	r8, r9
    1cae:      	adox	r14, rbx
    1cb4:      	mulx	rbx, r9, qword ptr [rdi + 0x18]
    1cba:      	adcx	r14, r9
    1cc0:      	adox	r15, rbx
    1cc6:      	adcx	r15, rbp
    1ccc:      	adox	rbp, rbp
    1cd2:      	adc	rbp, 0x0
    1cd6:      	mov	rdx, r13
    1cd9:      	mulx	rbx, r9, r11
    1cde:      	shl	rdx, 0x20
    1ce2:      	shr	r13, 0x20
    1ce6:      	add	rcx, rdx
    1ce9:      	adc	r8, r13
    1cec:      	adc	r14, r9
    1cef:      	adc	r15, rbx
    1cf2:      	adc	rbp, 0x0
    1cf6:      	mov	rdx, r10
    1cf9:      	xor	r13d, r13d
    1cfc:      	mulx	rbx, r9, qword ptr [rdi]
    1d01:      	adcx	rcx, r9
    1d07:      	adox	r8, rbx
    1d0d:      	mulx	rbx, r9, qword ptr [rdi + 0x8]
    1d13:      	adcx	r8, r9
    1d19:      	adox	r14, rbx
    1d1f:      	mulx	rbx, r9, qword ptr [rdi + 0x10]
    1d25:      	adcx	r14, r9
    1d2b:      	adox	r15, rbx
    1d31:      	mulx	rbx, r9, qword ptr [rdi + 0x18]
    1d37:      	adcx	r15, r9
    1d3d:      	adox	rbp, rbx
    1d43:      	adcx	rbp, r13
    1d49:      	adox	r13, r13
    1d4f:      	adc	r13, 0x0
    1d53:      	mov	rdx, rcx
    1d56:      	mulx	rbx, r9, r11
    1d5b:      	shl	rdx, 0x20
    1d5f:      	shr	rcx, 0x20
    1d63:      	add	r8, rdx
    1d66:      	adc	r14, rcx
    1d69:      	adc	r15, r9
    1d6c:      	adc	rbp, rbx
    1d6f:      	adc	r13, 0x0
    1d73:      	mov	rdx, r12
    1d76:      	xor	ecx, ecx
    1d78:      	mulx	rbx, r9, qword ptr [rdi]
    1d7d:      	adcx	r8, r9
    1d83:      	adox	r14, rbx
    1d89:      	mulx	rbx, r9, qword ptr [rdi + 0x8]
    1d8f:      	adcx	r14, r9
    1d95:      	adox	r15, rbx
    1d9b:      	mulx	rbx, r9, qword ptr [rdi + 0x10]
    1da1:      	adcx	r15, r9
    1da7:      	adox	rbp, rbx
    1dad:      	mulx	rbx, r9, qword ptr [rdi + 0x18]
    1db3:      	adcx	rbp, r9
    1db9:      	adox	r13, rbx
    1dbf:      	adcx	r13, rcx
    1dc5:      	adox	rcx, rcx
    1dcb:      	adc	rcx, 0x0
    1dcf:      	mov	rdx, r8
    1dd2:      	mulx	rbx, r9, r11
    1dd7:      	shl	rdx, 0x20
    1ddb:      	shr	r8, 0x20
    1ddf:      	add	r14, rdx
    1de2:      	adc	r15, r8
    1de5:      	adc	rbp, r9
    1de8:      	adc	r13, rbx
    1deb:      	adc	rcx, 0x0
    1def:      	mov	r8, r14
    1df2:      	mov	r9, r15
    1df5:      	mov	rbx, rbp
    1df8:      	mov	rdx, r13
    1dfb:      	mov	eax, 0xffffffff
    1e00:      	sub	r8, -0x1
    1e04:      	sbb	r9, rax
    1e07:      	sbb	rbx, 0x0
    1e0b:      	sbb	rdx, r11
    1e0e:      	sbb	rcx, 0x0
    1e12:      	cmovae	r14, r8
    1e16:      	cmovae	r15, r9
    1e1a:      	cmovae	rbp, rbx
    1e1e:      	cmovae	r13, rdx
    1e22:      	mov	rax, qword ptr [rsp - 0x60]
    1e27:      	mov	rcx, qword ptr [rsp - 0x78]
    1e2c:      	mov	rdx, qword ptr [rsp - 0x80]
    1e31:      	sub	rax, r14
    1e34:      	sbb	rcx, r15
    1e37:      	sbb	rsi, rbp
    1e3a:      	sbb	rdx, r13
    1e3d:      	sbb	r14, r14
    1e40:      	mov	r15, r14
    1e43:      	shr	r15, 0x20
    1e47:      	mov	r13, r14
    1e4a:      	shl	r13, 0x20
    1e4e:      	sub	r13, r14
    1e51:      	add	rax, r14
    1e54:      	adc	rcx, r15
    1e57:      	adc	rsi, 0x0
    1e5b:      	adc	rdx, r13
    1e5e:      	mov	qword ptr [rsp - 0x80], rdx
    1e63:      	mov	qword ptr [rsp - 0x78], rcx
    1e68:      	mov	qword ptr [rsp - 0x10], rsi
    1e6d:      	mov	qword ptr [rsp - 0x60], rax
    1e72:      	mov	rdi, qword ptr [rsp - 0x70]
    1e77:      	or	rdi, qword ptr [rsp - 0x68]
    1e7c:      	mov	rax, qword ptr [rsp - 0x48]
    1e81:      	add	rax, 0x40
    1e85:      	mov	rdx, qword ptr [rsp + 0x40]
    1e8a:      	mov	r12, qword ptr [rsp + 0x50]
    1e8f:      	mov	rsi, qword ptr [rsp + 0x48]
    1e94:      	mov	r10, qword ptr [rsp + 0x38]
    1e99:      	mulx	r8, rcx, qword ptr [rax]
    1e9e:      	mulx	r9, rbp, qword ptr [rax + 0x8]
    1ea4:      	add	r8, rbp
    1ea7:      	mulx	rbx, rbp, qword ptr [rax + 0x10]
    1ead:      	adc	r9, rbp
    1eb0:      	mulx	r14, rbp, qword ptr [rax + 0x18]
    1eb6:      	adc	rbx, rbp
    1eb9:      	adc	r14, 0x0
    1ebd:      	xor	r15d, r15d
    1ec0:      	mov	rdx, rcx
    1ec3:      	mulx	r13, rbp, r11
    1ec8:      	shl	rdx, 0x20
    1ecc:      	shr	rcx, 0x20
    1ed0:      	add	r8, rdx
    1ed3:      	adc	r9, rcx
    1ed6:      	adc	rbx, rbp
    1ed9:      	adc	r14, r13
    1edc:      	adc	r15, 0x0
    1ee0:      	mov	rdx, r12
    1ee3:      	xor	ecx, ecx
    1ee5:      	mulx	r13, rbp, qword ptr [rax]
    1eea:      	adcx	r8, rbp
    1ef0:      	adox	r9, r13
    1ef6:      	mulx	r13, rbp, qword ptr [rax + 0x8]
    1efc:      	adcx	r9, rbp
    1f02:      	adox	rbx, r13
    1f08:      	mulx	r13, rbp, qword ptr [rax + 0x10]
    1f0e:      	adcx	rbx, rbp
    1f14:      	adox	r14, r13
    1f1a:      	mulx	r13, rbp, qword ptr [rax + 0x18]
    1f20:      	adcx	r14, rbp
    1f26:      	adox	r15, r13
    1f2c:      	adcx	r15, rcx
    1f32:      	adox	rcx, rcx
    1f38:      	adc	rcx, 0x0
    1f3c:      	mov	rdx, r8
    1f3f:      	mulx	r13, rbp, r11
    1f44:      	shl	rdx, 0x20
    1f48:      	shr	r8, 0x20
    1f4c:      	add	r9, rdx
    1f4f:      	adc	rbx, r8
    1f52:      	adc	r14, rbp
    1f55:      	adc	r15, r13
    1f58:      	adc	rcx, 0x0
    1f5c:      	mov	rdx, r10
    1f5f:      	xor	r8d, r8d
    1f62:      	mulx	r13, rbp, qword ptr [rax]
    1f67:      	adcx	r9, rbp
    1f6d:      	adox	rbx, r13
    1f73:      	mulx	r13, rbp, qword ptr [rax + 0x8]
    1f79:      	adcx	rbx, rbp
    1f7f:      	adox	r14, r13
    1f85:      	mulx	r13, rbp, qword ptr [rax + 0x10]
    1f8b:      	adcx	r14, rbp
    1f91:      	adox	r15, r13
    1f97:      	mulx	r13, rbp, qword ptr [rax + 0x18]
    1f9d:      	adcx	r15, rbp
    1fa3:      	adox	rcx, r13
    1fa9:      	adcx	rcx, r8
    1faf:      	adox	r8, r8
    1fb5:      	adc	r8, 0x0
    1fb9:      	mov	rdx, r9
    1fbc:      	mulx	r13, rbp, r11
    1fc1:      	shl	rdx, 0x20
    1fc5:      	shr	r9, 0x20
    1fc9:      	add	rbx, rdx
    1fcc:      	adc	r14, r9
    1fcf:      	adc	r15, rbp
    1fd2:      	adc	rcx, r13
    1fd5:      	adc	r8, 0x0
    1fd9:      	mov	rdx, rsi
    1fdc:      	xor	r9d, r9d
    1fdf:      	mulx	r13, rbp, qword ptr [rax]
    1fe4:      	adcx	rbx, rbp
    1fea:      	adox	r14, r13
    1ff0:      	mulx	r13, rbp, qword ptr [rax + 0x8]
    1ff6:      	adcx	r14, rbp
    1ffc:      	adox	r15, r13
    2002:      	mulx	r13, rbp, qword ptr [rax + 0x10]
    2008:      	adcx	r15, rbp
    200e:      	adox	rcx, r13
    2014:      	mulx	r13, rbp, qword ptr [rax + 0x18]
    201a:      	adcx	rcx, rbp
    2020:      	adox	r8, r13
    2026:      	adcx	r8, r9
    202c:      	adox	r9, r9
    2032:      	adc	r9, 0x0
    2036:      	mov	rdx, rbx
    2039:      	mulx	r13, rbp, r11
    203e:      	shl	rdx, 0x20
    2042:      	shr	rbx, 0x20
    2046:      	add	r14, rdx
    2049:      	adc	r15, rbx
    204c:      	adc	rcx, rbp
    204f:      	adc	r8, r13
    2052:      	adc	r9, 0x0
    2056:      	mov	rbx, r14
    2059:      	mov	rbp, r15
    205c:      	mov	r13, rcx
    205f:      	mov	rdx, r8
    2062:      	mov	r12d, 0xffffffff
    2068:      	sub	rbx, -0x1
    206c:      	sbb	rbp, r12
    206f:      	sbb	r13, 0x0
    2073:      	sbb	rdx, r11
    2076:      	sbb	r9, 0x0
    207a:      	cmovae	r14, rbx
    207e:      	cmovae	r15, rbp
    2082:      	cmovae	rcx, r13
    2086:      	cmovae	r8, rdx
    208a:      	mov	qword ptr [rsp + 0x8], r14
    208f:      	mov	qword ptr [rsp + 0x10], r15
    2094:      	mov	qword ptr [rsp + 0x18], rcx
    2099:      	mov	qword ptr [rsp + 0x20], r8
    209e:      	mov	rcx, qword ptr [rsp - 0x40]
    20a3:      	mov	rax, rcx
    20a6:      	mov	rdx, qword ptr [rsp - 0x28]
    20ab:      	or	rcx, rdx
    20ae:      	mov	qword ptr [rsp - 0x40], rcx
    20b3:      	mov	rsi, qword ptr [rsp - 0x8]
    20b8:      	mov	r12, qword ptr [rsp]
    20bc:      	lea	r9, [rsp + 0x8]
    20c1:      	mulx	r8, r15, qword ptr [r9]
    20c6:      	mulx	rbx, r13, qword ptr [r9 + 0x8]
    20cc:      	add	r8, r13
    20cf:      	mulx	rbp, r13, qword ptr [r9 + 0x10]
    20d5:      	adc	rbx, r13
    20d8:      	mulx	r10, r13, qword ptr [r9 + 0x18]
    20de:      	adc	rbp, r13
    20e1:      	adc	r10, 0x0
    20e5:      	xor	r14d, r14d
    20e8:      	mov	rdx, r15
    20eb:      	mulx	rcx, r13, r11
    20f0:      	shl	rdx, 0x20
    20f4:      	shr	r15, 0x20
    20f8:      	add	r8, rdx
    20fb:      	adc	rbx, r15
    20fe:      	adc	rbp, r13
    2101:      	adc	r10, rcx
    2104:      	adc	r14, 0x0
    2108:      	mov	rdx, rax
    210b:      	xor	r15d, r15d
    210e:      	mulx	rcx, r13, qword ptr [r9]
    2113:      	adcx	r8, r13
    2119:      	adox	rbx, rcx
    211f:      	mulx	rcx, r13, qword ptr [r9 + 0x8]
    2125:      	adcx	rbx, r13
    212b:      	adox	rbp, rcx
    2131:      	mulx	rcx, r13, qword ptr [r9 + 0x10]
    2137:      	adcx	rbp, r13
    213d:      	adox	r10, rcx
    2143:      	mulx	rcx, r13, qword ptr [r9 + 0x18]
    2149:      	adcx	r10, r13
    214f:      	adox	r14, rcx
    2155:      	adcx	r14, r15
    215b:      	adox	r15, r15
    2161:      	adc	r15, 0x0
    2165:      	mov	rdx, r8
    2168:      	mulx	rcx, r13, r11
    216d:      	shl	rdx, 0x20
    2171:      	shr	r8, 0x20
    2175:      	add	rbx, rdx
    2178:      	adc	rbp, r8
    217b:      	adc	r10, r13
    217e:      	adc	r14, rcx
    2181:      	adc	r15, 0x0
    2185:      	mov	rdx, rsi
    2188:      	xor	r8d, r8d
    218b:      	mulx	rcx, r13, qword ptr [r9]
    2190:      	adcx	rbx, r13
    2196:      	adox	rbp, rcx
    219c:      	mulx	rcx, r13, qword ptr [r9 + 0x8]
    21a2:      	adcx	rbp, r13
    21a8:      	adox	r10, rcx
    21ae:      	mulx	rcx, r13, qword ptr [r9 + 0x10]
    21b4:      	adcx	r10, r13
    21ba:      	adox	r14, rcx
    21c0:      	mulx	rcx, r13, qword ptr [r9 + 0x18]
    21c6:      	adcx	r14, r13
    21cc:      	adox	r15, rcx
    21d2:      	adcx	r15, r8
    21d8:      	adox	r8, r8
    21de:      	adc	r8, 0x0
    21e2:      	mov	rdx, rbx
    21e5:      	mulx	rcx, r13, r11
    21ea:      	shl	rdx, 0x20
    21ee:      	shr	rbx, 0x20
    21f2:      	add	rbp, rdx
    21f5:      	adc	r10, rbx
    21f8:      	adc	r14, r13
    21fb:      	adc	r15, rcx
    21fe:      	adc	r8, 0x0
    2202:      	mov	rdx, r12
    2205:      	xor	ebx, ebx
    2207:      	mulx	rcx, r13, qword ptr [r9]
    220c:      	adcx	rbp, r13
    2212:      	adox	r10, rcx
    2218:      	mulx	rcx, r13, qword ptr [r9 + 0x8]
    221e:      	adcx	r10, r13
    2224:      	adox	r14, rcx
    222a:      	mulx	rcx, r13, qword ptr [r9 + 0x10]
    2230:      	adcx	r14, r13
    2236:      	adox	r15, rcx
    223c:      	mulx	rcx, r13, qword ptr [r9 + 0x18]
    2242:      	adcx	r15, r13
    2248:      	adox	r8, rcx
    224e:      	adcx	r8, rbx
    2254:      	adox	rbx, rbx
    225a:      	adc	rbx, 0x0
    225e:      	mov	rdx, rbp
    2261:      	mulx	rcx, r13, r11
    2266:      	shl	rdx, 0x20
    226a:      	shr	rbp, 0x20
    226e:      	add	r10, rdx
    2271:      	adc	r14, rbp
    2274:      	adc	r15, r13
    2277:      	adc	r8, rcx
    227a:      	adc	rbx, 0x0
    227e:      	mov	rbp, r10
    2281:      	mov	r13, r14
    2284:      	mov	rcx, r15
    2287:      	mov	rdx, r8
    228a:      	mov	eax, 0xffffffff
    228f:      	sub	rbp, -0x1
    2293:      	sbb	r13, rax
    2296:      	sbb	rcx, 0x0
    229a:      	sbb	rdx, r11
    229d:      	sbb	rbx, 0x0
    22a1:      	cmovae	r10, rbp
    22a5:      	cmovae	r14, r13
    22a9:      	cmovae	r15, rcx
    22ad:      	cmovae	r8, rdx
    22b1:      	mov	qword ptr [rsp - 0x70], r10
    22b6:      	mov	qword ptr [rsp - 0x68], r14
    22bb:      	mov	qword ptr [rsp - 0x28], r15
    22c0:      	mov	qword ptr [rsp - 0x48], r8
    22c5:      	or	rsi, r12
    22c8:      	or	rsi, qword ptr [rsp - 0x40]
    22cd:      	mov	rax, rdi
    22d0:      	or	rax, qword ptr [rsp - 0x20]
    22d5:      	or	rax, rsi
    22d8:      	xor	ecx, ecx
    22da:      	or	rax, qword ptr [rsp - 0x18]
    22df:      	mov	rax, qword ptr [rsp + 0x78]
    22e4:      	mov	rdx, qword ptr [rsp - 0x58]
    22e9:      	mov	qword ptr [rax], rdx
    22ec:      	mov	rdx, qword ptr [rsp - 0x50]
    22f1:      	mov	qword ptr [rax + 0x8], rdx
    22f5:      	mov	rdx, qword ptr [rsp - 0x38]
    22fa:      	mov	qword ptr [rax + 0x10], rdx
    22fe:      	mov	rdx, qword ptr [rsp - 0x30]
    2303:      	mov	qword ptr [rax + 0x18], rdx
    2307:      	mov	rdx, qword ptr [rsp - 0x60]
    230c:      	mov	qword ptr [rax + 0x20], rdx
    2310:      	mov	rdx, qword ptr [rsp - 0x78]
    2315:      	mov	qword ptr [rax + 0x28], rdx
    2319:      	mov	rdx, qword ptr [rsp - 0x10]
    231e:      	mov	qword ptr [rax + 0x30], rdx
    2322:      	mov	rdx, qword ptr [rsp - 0x80]
    2327:      	mov	qword ptr [rax + 0x38], rdx
    232b:      	mov	rdx, qword ptr [rsp - 0x70]
    2330:      	mov	qword ptr [rax + 0x40], rdx
    2334:      	mov	rdx, qword ptr [rsp - 0x68]
    2339:      	mov	qword ptr [rax + 0x48], rdx
    233d:      	mov	rdx, qword ptr [rsp - 0x28]
    2342:      	mov	qword ptr [rax + 0x50], rdx
    2346:      	mov	rdx, qword ptr [rsp - 0x48]
    234b:      	mov	qword ptr [rax + 0x58], rdx
    234f:      	sete	cl
    2352:      	mov	qword ptr [rax + 0x60], rcx
    2356:      	add	rsp, 0x100
    235d:      	pop	rbx
    235e:      	pop	r12
    2360:      	pop	r13
    2362:      	pop	r14
    2364:      	pop	r15
    2366:      	pop	rbp
    2367:      	ret
