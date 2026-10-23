0000000000000000 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P256FieldKj4_EB6_>:
       0:	push   rbp
       1:	mov    rbp,rsp
       4:	push   r15
       6:	push   r14
       8:	push   r13
       a:	push   r12
       c:	push   rbx
       d:	sub    rsp,0x138
      14:	mov    QWORD PTR [rbp-0x110],rdi
      1b:	movabs rdi,0x3fffffffffffffff
      25:	movabs rax,0x3fffffc000000040
      2f:	mov    r10,QWORD PTR [rsi]
      32:	mov    r8,QWORD PTR [rsi+0x8]
      36:	mov    rcx,r8
      39:	shld   rcx,r10,0x2
      3e:	and    r10,rdi
      41:	and    rcx,rdi
      44:	mov    QWORD PTR [rbp-0xd8],rcx
      4b:	mov    rcx,QWORD PTR [rsi+0x10]
      4f:	shrd   r8,rcx,0x3c
      54:	and    r8,rdi
      57:	mov    QWORD PTR [rbp-0xe0],r8
      5e:	mov    r11,QWORD PTR [rsi+0x18]
      62:	shrd   rcx,r11,0x3a
      67:	mov    r15,QWORD PTR [rdx]
      6a:	mov    r8,QWORD PTR [rdx+0x8]
      6e:	mov    rbx,QWORD PTR [rdx+0x10]
      72:	mov    r9,rbx
      75:	shld   r9,r8,0x4
      7a:	shld   r8,r15,0x2
      7f:	and    rcx,rdi
      82:	mov    QWORD PTR [rbp-0xe8],rcx
      89:	mov    rsi,QWORD PTR [rdx+0x18]
      8d:	shrd   rbx,rsi,0x3a
      92:	shr    r11,0x38
      96:	shr    rsi,0x38
      9a:	movabs rcx,0x3ffffffff
      a4:	mov    r12,0xffffffffffffffff
      ab:	mov    QWORD PTR [rbp-0x40],0x0
      b3:	mov    QWORD PTR [rbp-0xd0],0x0
      be:	mov    QWORD PTR [rbp-0xc8],0x0
      c9:	xor    r14d,r14d
      cc:	mov    QWORD PTR [rbp-0x98],0x0
      d7:	mov    edx,0xff
      dc:	mov    QWORD PTR [rbp-0x68],rdx
      e0:	mov    QWORD PTR [rbp-0x88],rax
      e7:	mov    QWORD PTR [rbp-0xf8],0x0
      f2:	mov    QWORD PTR [rbp-0xa0],rcx
      f9:	mov    rcx,rdi
      fc:	xor    eax,eax
      fe:	xchg   ax,ax
     100:	mov    QWORD PTR [rbp-0x48],r11
     104:	mov    QWORD PTR [rbp-0x108],rsi
     10b:	mov    QWORD PTR [rbp-0xf0],rax
     112:	mov    QWORD PTR [rbp-0x158],r14
     119:	movabs rax,0x3fffffffffffffff
     123:	and    r15,rax
     126:	mov    QWORD PTR [rbp-0x30],r15
     12a:	and    r8,rax
     12d:	mov    QWORD PTR [rbp-0x70],r8
     131:	and    r9,rax
     134:	mov    QWORD PTR [rbp-0x150],r9
     13b:	and    rbx,rax
     13e:	mov    QWORD PTR [rbp-0x100],rbx
     145:	mov    edi,0x1
     14a:	mov    eax,0x3e
     14f:	mov    QWORD PTR [rbp-0x50],rcx
     153:	mov    rsi,rcx
     156:	mov    QWORD PTR [rbp-0x78],r10
     15a:	mov    rcx,r10
     15d:	xor    r15d,r15d
     160:	xor    ebx,ebx
     162:	mov    r9d,0x1
     168:	nop    DWORD PTR [rax+rax*1+0x0]
     170:	mov    rdx,rsi
     173:	mov    esi,ecx
     175:	and    esi,0x1
     178:	neg    rsi
     17b:	mov    r8,r12
     17e:	mov    r11,r12
     181:	sar    r11,0x3f
     185:	mov    r12,r11
     188:	and    r12,rsi
     18b:	mov    r14,r11
     18e:	xor    r14,rdi
     191:	and    r14,rsi
     194:	xor    r11,r15
     197:	and    r11,rsi
     19a:	mov    r10,rsi
     19d:	and    r10,rdx
     1a0:	add    r10,rcx
     1a3:	lea    rcx,[rdx+rdx*1]
     1a7:	and    rcx,r12
     1aa:	sub    r10,rcx
     1ad:	sub    r14,r12
     1b0:	add    rbx,r14
     1b3:	sub    r11,r12
     1b6:	add    r9,r11
     1b9:	mov    rsi,r10
     1bc:	and    rsi,r12
     1bf:	add    rsi,rdx
     1c2:	shr    r10,1
     1c5:	mov    rcx,rbx
     1c8:	and    rcx,r12
     1cb:	add    rdi,rcx
     1ce:	add    rdi,rdi
     1d1:	mov    rcx,r9
     1d4:	and    rcx,r12
     1d7:	add    r15,rcx
     1da:	add    r15,r15
     1dd:	xor    r8,r12
     1e0:	not    r12
     1e3:	add    r12,r8
     1e6:	mov    rcx,r10
     1e9:	dec    eax
     1eb:	jne    170 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P256FieldKj4_EB6_+0x170>
     1ed:	mov    r14,r15
     1f0:	mov    rax,r15
     1f3:	mov    r10,QWORD PTR [rbp-0x78]
     1f7:	mul    r10
     1fa:	mov    rcx,rax
     1fd:	sar    r14,0x3f
     201:	mov    rsi,r14
     204:	imul   rsi,r10
     208:	add    rsi,rdx
     20b:	mov    r8,rdi
     20e:	sar    r8,0x3f
     212:	mov    rax,rdi
     215:	mov    r11,QWORD PTR [rbp-0x50]
     219:	mul    r11
     21c:	mov    r13,rax
     21f:	mov    QWORD PTR [rbp-0x38],r8
     223:	imul   r8,r11
     227:	add    r8,rdx
     22a:	add    r13,rcx
     22d:	adc    r8,rsi
     230:	mov    QWORD PTR [rbp-0x140],r8
     237:	mov    r8,r9
     23a:	sar    r8,0x3f
     23e:	mov    rax,r9
     241:	mul    r10
     244:	mov    QWORD PTR [rbp-0x58],rax
     248:	imul   r10,r8
     24c:	add    r10,rdx
     24f:	mov    rcx,rbx
     252:	mov    rax,rbx
     255:	mul    r11
     258:	mov    rsi,rax
     25b:	sar    rcx,0x3f
     25f:	mov    QWORD PTR [rbp-0x60],rcx
     263:	imul   r11,rcx
     267:	add    r11,rdx
     26a:	add    rsi,QWORD PTR [rbp-0x58]
     26e:	adc    r11,r10
     271:	mov    QWORD PTR [rbp-0x50],r11
     275:	mov    QWORD PTR [rbp-0x148],r13
     27c:	mov    QWORD PTR [rbp-0x78],rsi
     280:	or     r13,rsi
     283:	shl    r13,0x2
     287:	test   r13,r13
     28a:	jne    b9b <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P256FieldKj4_EB6_+0xb9b>
     290:	mov    QWORD PTR [rbp-0xc0],r8
     297:	mov    QWORD PTR [rbp-0x138],r14
     29e:	mov    rax,QWORD PTR [rbp-0x98]
     2a5:	sar    rax,0x3f
     2a9:	mov    rcx,QWORD PTR [rbp-0x108]
     2b0:	sar    rcx,0x3f
     2b4:	mov    rdx,rax
     2b7:	and    rdx,rdi
     2ba:	mov    rsi,rcx
     2bd:	and    rsi,r15
     2c0:	add    rsi,rdx
     2c3:	and    rax,rbx
     2c6:	and    rcx,r9
     2c9:	add    rcx,rax
     2cc:	mov    r13,QWORD PTR [rbp-0x30]
     2d0:	mov    rax,r13
     2d3:	imul   r15
     2d6:	mov    QWORD PTR [rbp-0x80],rdx
     2da:	mov    r11,rax
     2dd:	mov    r14,QWORD PTR [rbp-0x40]
     2e1:	mov    rax,r14
     2e4:	mul    rdi
     2e7:	mov    r10,r14
     2ea:	imul   r10,QWORD PTR [rbp-0x38]
     2ef:	add    r10,rdx
     2f2:	add    rax,r11
     2f5:	mov    r8,rax
     2f8:	mov    QWORD PTR [rbp-0x58],rax
     2fc:	adc    r10,QWORD PTR [rbp-0x80]
     300:	mov    rax,r13
     303:	imul   r9
     306:	mov    r13,rdx
     309:	mov    QWORD PTR [rbp-0x30],rax
     30d:	mov    rax,r14
     310:	mul    rbx
     313:	mov    r11,rax
     316:	imul   r14,QWORD PTR [rbp-0x60]
     31b:	add    r14,rdx
     31e:	add    r11,QWORD PTR [rbp-0x30]
     322:	adc    r14,r13
     325:	mov    rax,r8
     328:	movabs r13,0x3fffffffffffffff
     332:	imul   rax,r13
     336:	add    rax,rsi
     339:	and    rax,r13
     33c:	sub    rsi,rax
     33f:	mov    rax,r11
     342:	imul   rax,r13
     346:	add    rax,rcx
     349:	and    rax,r13
     34c:	sub    rcx,rax
     34f:	mov    QWORD PTR [rbp-0x80],rsi
     353:	mov    rax,rsi
     356:	imul   r13
     359:	mov    r8,rax
     35c:	add    r8,QWORD PTR [rbp-0x58]
     360:	adc    rdx,r10
     363:	mov    QWORD PTR [rbp-0x130],rdx
     36a:	mov    QWORD PTR [rbp-0x58],rcx
     36e:	mov    rax,rcx
     371:	imul   r13
     374:	mov    rsi,rax
     377:	add    rsi,r11
     37a:	adc    rdx,r14
     37d:	mov    QWORD PTR [rbp-0x128],r8
     384:	or     r8,rsi
     387:	shl    r8,0x2
     38b:	test   r8,r8
     38e:	mov    rcx,QWORD PTR [rbp-0xf0]
     395:	jne    bb3 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P256FieldKj4_EB6_+0xbb3>
     39b:	mov    rax,QWORD PTR [rbp-0x68]
     39f:	mov    QWORD PTR [rbp-0x30],rdx
     3a3:	imul   rbx
     3a6:	mov    QWORD PTR [rbp-0x40],rdx
     3aa:	mov    QWORD PTR [rbp-0xb0],rax
     3b1:	mov    r8,QWORD PTR [rbp-0x88]
     3b8:	mov    rax,r8
     3bb:	mul    rbx
     3be:	mov    QWORD PTR [rbp-0xb8],rax
     3c5:	mov    rax,QWORD PTR [rbp-0x60]
     3c9:	imul   r8,rax
     3cd:	mov    QWORD PTR [rbp-0x90],rsi
     3d4:	mov    rsi,rax
     3d7:	add    r8,rdx
     3da:	mov    QWORD PTR [rbp-0xa8],r8
     3e1:	mov    r14,QWORD PTR [rbp-0xf8]
     3e8:	mov    rax,r14
     3eb:	mul    rbx
     3ee:	mov    r10,rax
     3f1:	imul   r14,rsi
     3f5:	add    r14,rdx
     3f8:	mov    r13,QWORD PTR [rbp-0xa0]
     3ff:	mov    rax,r13
     402:	mul    rbx
     405:	imul   r13,rsi
     409:	add    r13,rdx
     40c:	inc    rcx
     40f:	mov    QWORD PTR [rbp-0xf0],rcx
     416:	mov    rsi,QWORD PTR [rbp-0x50]
     41a:	mov    rcx,QWORD PTR [rbp-0x78]
     41e:	shrd   rcx,rsi,0x3e
     423:	sar    rsi,0x3e
     427:	add    rcx,rax
     42a:	adc    rsi,r13
     42d:	mov    r11,QWORD PTR [rbp-0xd8]
     434:	mov    rax,r11
     437:	mul    r9
     43a:	mov    r13,r11
     43d:	mov    r8,QWORD PTR [rbp-0xc0]
     444:	imul   r13,r8
     448:	add    r13,rdx
     44b:	add    rax,rcx
     44e:	mov    QWORD PTR [rbp-0x78],rax
     452:	adc    r13,rsi
     455:	mov    rsi,r13
     458:	shld   r13,rax,0x2
     45d:	sar    rsi,0x3e
     461:	add    r13,r10
     464:	adc    rsi,r14
     467:	mov    r10,QWORD PTR [rbp-0xe0]
     46e:	mov    rax,r10
     471:	mul    r9
     474:	mov    rcx,r10
     477:	imul   rcx,r8
     47b:	add    rcx,rdx
     47e:	add    rax,r13
     481:	mov    QWORD PTR [rbp-0x120],rax
     488:	adc    rcx,rsi
     48b:	mov    rsi,rcx
     48e:	shld   rcx,rax,0x2
     493:	sar    rsi,0x3e
     497:	add    rcx,QWORD PTR [rbp-0xb8]
     49e:	adc    rsi,QWORD PTR [rbp-0xa8]
     4a5:	mov    r14,QWORD PTR [rbp-0xe8]
     4ac:	mov    rax,r14
     4af:	mul    r9
     4b2:	imul   r8,r14
     4b6:	add    r8,rdx
     4b9:	add    rax,rcx
     4bc:	mov    QWORD PTR [rbp-0xb8],rax
     4c3:	adc    r8,rsi
     4c6:	mov    rcx,r8
     4c9:	shld   r8,rax,0x2
     4ce:	sar    rcx,0x3e
     4d2:	add    r8,QWORD PTR [rbp-0xb0]
     4d9:	adc    rcx,QWORD PTR [rbp-0x40]
     4dd:	mov    rax,QWORD PTR [rbp-0x48]
     4e1:	imul   r9
     4e4:	add    rax,r8
     4e7:	mov    QWORD PTR [rbp-0x40],rax
     4eb:	adc    rdx,rcx
     4ee:	mov    r8,rdx
     4f1:	mov    rax,QWORD PTR [rbp-0x68]
     4f5:	imul   rdi
     4f8:	mov    QWORD PTR [rbp-0x68],rdx
     4fc:	mov    QWORD PTR [rbp-0xb0],rax
     503:	mov    rsi,QWORD PTR [rbp-0x88]
     50a:	mov    rax,rsi
     50d:	mul    rdi
     510:	mov    QWORD PTR [rbp-0xa8],rax
     517:	mov    QWORD PTR [rbp-0x50],rdx
     51b:	mov    r13,QWORD PTR [rbp-0x38]
     51f:	imul   rsi,r13
     523:	mov    rcx,QWORD PTR [rbp-0xf8]
     52a:	mov    rax,rcx
     52d:	mul    rdi
     530:	mov    QWORD PTR [rbp-0x118],rax
     537:	add    rsi,QWORD PTR [rbp-0x50]
     53b:	mov    QWORD PTR [rbp-0x88],rsi
     542:	imul   rcx,r13
     546:	add    rcx,rdx
     549:	mov    rsi,rcx
     54c:	mov    rax,QWORD PTR [rbp-0x40]
     550:	shld   r8,rax,0x2
     555:	mov    QWORD PTR [rbp-0xc0],r8
     55c:	mov    rcx,QWORD PTR [rbp-0xa0]
     563:	mov    rax,rcx
     566:	mul    rdi
     569:	imul   rcx,r13
     56d:	add    rcx,rdx
     570:	mov    rdx,rcx
     573:	mov    r8,QWORD PTR [rbp-0x148]
     57a:	mov    rcx,QWORD PTR [rbp-0x140]
     581:	shrd   r8,rcx,0x3e
     586:	sar    rcx,0x3e
     58a:	add    r8,rax
     58d:	adc    rcx,rdx
     590:	mov    rax,r11
     593:	mul    r15
     596:	mov    r13,QWORD PTR [rbp-0x138]
     59d:	imul   r11,r13
     5a1:	add    r11,rdx
     5a4:	add    rax,r8
     5a7:	mov    QWORD PTR [rbp-0x50],rax
     5ab:	adc    r11,rcx
     5ae:	mov    r8,r11
     5b1:	shld   r11,rax,0x2
     5b6:	sar    r8,0x3e
     5ba:	add    r11,QWORD PTR [rbp-0x118]
     5c1:	adc    r8,rsi
     5c4:	mov    rax,r10
     5c7:	mul    r15
     5ca:	imul   r10,r13
     5ce:	add    r10,rdx
     5d1:	add    rax,r11
     5d4:	mov    QWORD PTR [rbp-0xa0],rax
     5db:	adc    r10,r8
     5de:	mov    rsi,r10
     5e1:	sar    rsi,0x3e
     5e5:	shld   r10,rax,0x2
     5ea:	add    r10,QWORD PTR [rbp-0xa8]
     5f1:	adc    rsi,QWORD PTR [rbp-0x88]
     5f8:	mov    rax,r14
     5fb:	imul   r14,r13
     5ff:	mul    r15
     602:	add    r14,rdx
     605:	mov    r11,rax
     608:	add    r11,r10
     60b:	adc    r14,rsi
     60e:	mov    rcx,r14
     611:	shld   r14,r11,0x2
     616:	sar    rcx,0x3e
     61a:	add    r14,QWORD PTR [rbp-0xb0]
     621:	adc    rcx,QWORD PTR [rbp-0x68]
     625:	mov    rax,QWORD PTR [rbp-0x48]
     629:	imul   r15
     62c:	mov    r8,rax
     62f:	add    r8,r14
     632:	mov    rsi,rdx
     635:	adc    rsi,rcx
     638:	mov    r13,QWORD PTR [rbp-0xd0]
     63f:	mov    rax,r13
     642:	mul    rdi
     645:	mov    r14,rax
     648:	mov    r10,r13
     64b:	imul   r10,QWORD PTR [rbp-0x38]
     650:	add    r10,rdx
     653:	shld   rsi,r8,0x2
     658:	mov    QWORD PTR [rbp-0x68],rsi
     65c:	mov    rdx,QWORD PTR [rbp-0x40]
     660:	movabs rax,0x3fffffffffffffff
     66a:	and    rdx,rax
     66d:	mov    QWORD PTR [rbp-0xe8],rdx
     674:	mov    rdx,QWORD PTR [rbp-0xb8]
     67b:	and    rdx,rax
     67e:	mov    QWORD PTR [rbp-0xe0],rdx
     685:	and    r11,rax
     688:	mov    QWORD PTR [rbp-0xf8],r11
     68f:	mov    rdx,QWORD PTR [rbp-0x120]
     696:	and    rdx,rax
     699:	mov    QWORD PTR [rbp-0xd8],rdx
     6a0:	and    QWORD PTR [rbp-0xa0],rax
     6a7:	and    QWORD PTR [rbp-0x78],rax
     6ab:	and    QWORD PTR [rbp-0x50],rax
     6af:	and    r8,rax
     6b2:	mov    QWORD PTR [rbp-0x88],r8
     6b9:	mov    rax,QWORD PTR [rbp-0x30]
     6bd:	shrd   QWORD PTR [rbp-0x90],rax,0x3e
     6c6:	sar    rax,0x3e
     6ca:	mov    QWORD PTR [rbp-0x30],rax
     6ce:	mov    rcx,QWORD PTR [rbp-0x130]
     6d5:	mov    rsi,QWORD PTR [rbp-0x128]
     6dc:	shrd   rsi,rcx,0x3e
     6e1:	mov    rax,QWORD PTR [rbp-0x70]
     6e5:	imul   r15
     6e8:	mov    QWORD PTR [rbp-0x48],rdx
     6ec:	mov    r8,rax
     6ef:	mov    rax,QWORD PTR [rbp-0x80]
     6f3:	movabs r11,0x3ffffffff
     6fd:	imul   r11
     700:	sar    rcx,0x3e
     704:	add    r14,rsi
     707:	adc    r10,rcx
     70a:	add    r14,r8
     70d:	adc    r10,QWORD PTR [rbp-0x48]
     711:	add    r14,rax
     714:	mov    QWORD PTR [rbp-0x48],r14
     718:	adc    r10,rdx
     71b:	mov    rax,r13
     71e:	mul    rbx
     721:	mov    rcx,rax
     724:	imul   r13,QWORD PTR [rbp-0x60]
     729:	add    r13,rdx
     72c:	mov    rax,QWORD PTR [rbp-0x70]
     730:	imul   r9
     733:	mov    rsi,rdx
     736:	mov    r8,rax
     739:	mov    rax,QWORD PTR [rbp-0x58]
     73d:	imul   r11
     740:	movabs r11,0x3fffffffffffffff
     74a:	and    r14,r11
     74d:	mov    QWORD PTR [rbp-0x40],r14
     751:	add    rcx,QWORD PTR [rbp-0x90]
     758:	adc    r13,QWORD PTR [rbp-0x30]
     75c:	add    rcx,r8
     75f:	adc    r13,rsi
     762:	add    rcx,rax
     765:	mov    QWORD PTR [rbp-0x30],rcx
     769:	adc    r13,rdx
     76c:	mov    rsi,r10
     76f:	mov    rax,QWORD PTR [rbp-0x48]
     773:	shld   r10,rax,0x2
     778:	mov    r11,QWORD PTR [rbp-0xc8]
     77f:	mov    rax,r11
     782:	mul    rdi
     785:	mov    rcx,rax
     788:	mov    r14,r11
     78b:	imul   r14,QWORD PTR [rbp-0x38]
     790:	add    r14,rdx
     793:	mov    rax,r13
     796:	sar    rax,0x3e
     79a:	mov    QWORD PTR [rbp-0x70],rax
     79e:	mov    r8,r13
     7a1:	mov    rax,QWORD PTR [rbp-0x30]
     7a5:	shld   r8,rax,0x2
     7aa:	sar    rsi,0x3e
     7ae:	mov    r13,QWORD PTR [rbp-0x150]
     7b5:	mov    rax,r13
     7b8:	imul   r15
     7bb:	add    rcx,r10
     7be:	adc    r14,rsi
     7c1:	add    rcx,rax
     7c4:	adc    r14,rdx
     7c7:	mov    rax,r11
     7ca:	mul    rbx
     7cd:	imul   r11,QWORD PTR [rbp-0x60]
     7d2:	add    r11,rdx
     7d5:	mov    r10,rcx
     7d8:	movabs rdx,0x3fffffffffffffff
     7e2:	and    r10,rdx
     7e5:	mov    QWORD PTR [rbp-0xd0],r10
     7ec:	mov    rsi,rax
     7ef:	mov    rax,r13
     7f2:	imul   r9
     7f5:	add    rsi,r8
     7f8:	adc    r11,QWORD PTR [rbp-0x70]
     7fc:	add    rsi,rax
     7ff:	mov    r13,rsi
     802:	mov    QWORD PTR [rbp-0x70],rsi
     806:	adc    r11,rdx
     809:	mov    rsi,r14
     80c:	shld   r14,rcx,0x2
     811:	mov    r10,QWORD PTR [rbp-0x158]
     818:	mov    rax,r10
     81b:	mul    rdi
     81e:	mov    rcx,rax
     821:	mov    r8,QWORD PTR [rbp-0x38]
     825:	imul   r8,r10
     829:	add    r8,rdx
     82c:	mov    rax,r11
     82f:	sar    rax,0x3e
     833:	mov    QWORD PTR [rbp-0x38],rax
     837:	shld   r11,r13,0x2
     83c:	mov    QWORD PTR [rbp-0x48],r11
     840:	sar    rsi,0x3e
     844:	mov    rax,QWORD PTR [rbp-0x100]
     84b:	imul   r15
     84e:	mov    QWORD PTR [rbp-0x90],rdx
     855:	mov    r11,rax
     858:	mov    rax,QWORD PTR [rbp-0x80]
     85c:	movabs r13,0x3fffffc000000040
     866:	imul   r13
     869:	add    rcx,r14
     86c:	adc    r8,rsi
     86f:	add    rcx,r11
     872:	adc    r8,QWORD PTR [rbp-0x90]
     879:	add    rcx,rax
     87c:	adc    r8,rdx
     87f:	mov    rax,r10
     882:	imul   r10,QWORD PTR [rbp-0x60]
     887:	mul    rbx
     88a:	add    r10,rdx
     88d:	mov    rsi,rcx
     890:	movabs rdx,0x3fffffffffffffff
     89a:	and    rsi,rdx
     89d:	mov    QWORD PTR [rbp-0xc8],rsi
     8a4:	mov    r11,rax
     8a7:	mov    rax,QWORD PTR [rbp-0x100]
     8ae:	imul   r9
     8b1:	mov    rsi,rdx
     8b4:	mov    r14,rax
     8b7:	mov    rax,QWORD PTR [rbp-0x58]
     8bb:	imul   r13
     8be:	add    r11,QWORD PTR [rbp-0x48]
     8c2:	adc    r10,QWORD PTR [rbp-0x38]
     8c6:	add    r11,r14
     8c9:	adc    r10,rsi
     8cc:	add    r11,rax
     8cf:	adc    r10,rdx
     8d2:	mov    r14,r8
     8d5:	shld   r8,rcx,0x2
     8da:	mov    QWORD PTR [rbp-0x38],r8
     8de:	mov    r13,r10
     8e1:	sar    r13,0x3e
     8e5:	mov    r8,r10
     8e8:	shld   r8,r11,0x2
     8ed:	mov    r10,QWORD PTR [rbp-0x98]
     8f4:	mov    rax,r10
     8f7:	imul   rdi
     8fa:	mov    rdi,rdx
     8fd:	mov    rcx,rax
     900:	mov    rsi,QWORD PTR [rbp-0x108]
     907:	mov    rax,rsi
     90a:	imul   r15
     90d:	mov    QWORD PTR [rbp-0x60],rdx
     911:	mov    r15,rax
     914:	mov    rax,QWORD PTR [rbp-0x80]
     918:	mov    edx,0xff
     91d:	imul   rdx
     920:	sar    r14,0x3e
     924:	add    rcx,QWORD PTR [rbp-0x38]
     928:	adc    rdi,r14
     92b:	add    rcx,r15
     92e:	adc    rdi,QWORD PTR [rbp-0x60]
     932:	add    rcx,rax
     935:	adc    rdi,rdx
     938:	mov    r14,rcx
     93b:	movabs rax,0x3fffffffffffffff
     945:	and    r14,rax
     948:	mov    rax,r10
     94b:	imul   rbx
     94e:	mov    rbx,rax
     951:	mov    rax,rsi
     954:	mov    rsi,rdx
     957:	imul   r9
     95a:	mov    r15,rdx
     95d:	mov    r9,rax
     960:	mov    rax,QWORD PTR [rbp-0x58]
     964:	mov    edx,0xff
     969:	imul   rdx
     96c:	mov    r10,QWORD PTR [rbp-0x78]
     970:	add    rbx,r8
     973:	adc    rsi,r13
     976:	add    rbx,r9
     979:	mov    r9,r11
     97c:	adc    rsi,r15
     97f:	mov    r15,QWORD PTR [rbp-0x30]
     983:	mov    r8,QWORD PTR [rbp-0x70]
     987:	add    rbx,rax
     98a:	adc    rsi,rdx
     98d:	mov    rdx,QWORD PTR [rbp-0xc0]
     994:	shld   rdi,rcx,0x2
     999:	mov    QWORD PTR [rbp-0x98],rdi
     9a0:	mov    rcx,QWORD PTR [rbp-0x50]
     9a4:	shld   rsi,rbx,0x2
     9a9:	mov    r11,rdx
     9ac:	mov    rax,QWORD PTR [rbp-0xf0]
     9b3:	cmp    rax,0xc
     9b7:	jne    100 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P256FieldKj4_EB6_+0x100>
     9bd:	mov    rax,QWORD PTR [rbp-0xd8]
     9c4:	or     rax,r10
     9c7:	mov    rcx,QWORD PTR [rbp-0xe0]
     9ce:	or     rcx,rax
     9d1:	mov    rax,QWORD PTR [rbp-0xe8]
     9d8:	or     rax,rcx
     9db:	or     rax,rdx
     9de:	mov    QWORD PTR [rbp-0x160],rax
     9e5:	jne    bcb <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P256FieldKj4_EB6_+0xbcb>
     9eb:	mov    rbx,QWORD PTR [rbp-0x98]
     9f2:	mov    rcx,rbx
     9f5:	sar    rcx,0x3f
     9f9:	mov    rdx,rcx
     9fc:	mov    rax,rcx
     9ff:	movabs rdi,0x3fffffffffffffff
     a09:	and    rax,rdi
     a0c:	mov    rsi,QWORD PTR [rbp-0x40]
     a10:	add    rsi,rax
     a13:	movzx  eax,cl
     a16:	movabs r11,0x3ffffffff
     a20:	and    rdx,r11
     a23:	mov    r8,QWORD PTR [rbp-0xd0]
     a2a:	add    r8,rdx
     a2d:	mov    rdx,rsi
     a30:	shr    rdx,0x3e
     a34:	and    rsi,rdi
     a37:	add    r8,rdx
     a3a:	mov    rdx,r8
     a3d:	shr    rdx,0x3e
     a41:	and    r8,rdi
     a44:	mov    r9,QWORD PTR [rbp-0xc8]
     a4b:	add    r9,rdx
     a4e:	mov    rdx,r9
     a51:	shr    rdx,0x3e
     a55:	and    r9,rdi
     a58:	movabs r10,0x3fffffc000000040
     a62:	and    rcx,r10
     a65:	add    r14,rcx
     a68:	add    r14,rdx
     a6b:	mov    rcx,r14
     a6e:	shr    rcx,0x3e
     a72:	and    r14,rdi
     a75:	add    rax,rbx
     a78:	add    rax,rcx
     a7b:	mov    rdx,QWORD PTR [rbp-0x68]
     a7f:	sar    rdx,0x3f
     a83:	xor    rsi,rdx
     a86:	sub    rsi,rdx
     a89:	mov    rcx,rsi
     a8c:	sar    rcx,0x3e
     a90:	and    rsi,rdi
     a93:	xor    r8,rdx
     a96:	sub    r8,rdx
     a99:	add    r8,rcx
     a9c:	mov    rcx,r8
     a9f:	sar    rcx,0x3e
     aa3:	and    r8,rdi
     aa6:	xor    r9,rdx
     aa9:	sub    r9,rdx
     aac:	add    r9,rcx
     aaf:	mov    rcx,r9
     ab2:	sar    rcx,0x3e
     ab6:	and    r9,rdi
     ab9:	xor    r14,rdx
     abc:	sub    r14,rdx
     abf:	add    r14,rcx
     ac2:	mov    rcx,r14
     ac5:	sar    rcx,0x3e
     ac9:	and    r14,rdi
     acc:	xor    rax,rdx
     acf:	sub    rax,rdx
     ad2:	add    rax,rcx
     ad5:	mov    rdx,rax
     ad8:	sar    rdx,0x3f
     adc:	mov    rcx,rdx
     adf:	and    rcx,rdi
     ae2:	add    rcx,rsi
     ae5:	mov    rsi,rcx
     ae8:	shr    rsi,0x3e
     aec:	and    rcx,rdi
     aef:	and    r11,rdx
     af2:	add    r11,r8
     af5:	add    r11,rsi
     af8:	mov    rsi,r11
     afb:	shr    rsi,0x3e
     aff:	add    rsi,r9
     b02:	mov    rdi,rsi
     b05:	shr    rdi,0x3e
     b09:	add    rdi,r14
     b0c:	and    r10,rdx
     b0f:	add    r10,rdi
     b12:	mov    r8,r10
     b15:	shr    r8,0x3e
     b19:	add    edx,eax
     b1b:	add    edx,r8d
     b1e:	shl    rdx,0x38
     b22:	shr    r10,0x6
     b26:	movabs r9,0xffffffffffffff
     b30:	and    r9,r10
     b33:	or     r9,rdx
     b36:	shl    rdi,0x3a
     b3a:	mov    rdx,rsi
     b3d:	shr    rdx,0x4
     b41:	movabs r8,0x3ffffffffffffff
     b4b:	and    r8,rdx
     b4e:	or     r8,rdi
     b51:	shl    rsi,0x3c
     b55:	mov    rdx,r11
     b58:	shr    rdx,0x2
     b5c:	movabs rdi,0xfffffffffffffff
     b66:	and    rdi,rdx
     b69:	or     rdi,rsi
     b6c:	shl    r11,0x3e
     b70:	or     r11,rcx
     b73:	mov    rax,QWORD PTR [rbp-0x110]
     b7a:	mov    QWORD PTR [rax],r11
     b7d:	mov    QWORD PTR [rax+0x8],rdi
     b81:	mov    QWORD PTR [rax+0x10],r8
     b85:	mov    QWORD PTR [rax+0x18],r9
     b89:	add    rsp,0x138
     b90:	pop    rbx
     b91:	pop    r12
     b93:	pop    r13
     b95:	pop    r14
     b97:	pop    r15
     b99:	pop    rbp
     b9a:	ret
     b9b:	lea    rdi,[rip+0x0]        # ba2 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P256FieldKj4_EB6_+0xba2>
     ba2:	lea    rdx,[rip+0x0]        # ba9 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P256FieldKj4_EB6_+0xba9>
     ba9:	mov    esi,0x40
     bae:	call   bb3 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P256FieldKj4_EB6_+0xbb3>
     bb3:	lea    rdi,[rip+0x0]        # bba <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P256FieldKj4_EB6_+0xbba>
     bba:	lea    rdx,[rip+0x0]        # bc1 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P256FieldKj4_EB6_+0xbc1>
     bc1:	mov    esi,0x40
     bc6:	call   bcb <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P256FieldKj4_EB6_+0xbcb>
     bcb:	lea    rdx,[rip+0x1e36]        # 2a08 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384OrderKj6_EB6_+0x8d8>
     bd2:	lea    rcx,[rip+0x0]        # bd9 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P256FieldKj4_EB6_+0xbd9>
     bd9:	lea    r9,[rip+0x0]        # be0 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P256FieldKj4_EB6_+0xbe0>
     be0:	lea    rsi,[rbp-0x160]
     be7:	mov    r8d,0x2f
     bed:	xor    edi,edi
     bef:	call   bf4 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P256FieldKj4_EB6_+0xbf4>
     bf4:	cs nop WORD PTR [rax+rax*1+0x0]
     bfe:	xchg   ax,ax
