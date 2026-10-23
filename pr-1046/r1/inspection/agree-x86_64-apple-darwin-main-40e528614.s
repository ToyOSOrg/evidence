0000000000000060 <__RNvMs_NtCslh91aX0c5fM_12toyos_crypto6x25519NtB4_9SecretKey5agree>:
      60:	push   rbp
      61:	mov    rbp,rsp
      64:	push   r15
      66:	push   r14
      68:	push   r13
      6a:	push   r12
      6c:	push   rbx
      6d:	sub    rsp,0x3e8
      74:	mov    QWORD PTR [rbp-0x2c8],rsi
      7b:	mov    QWORD PTR [rbp-0x2d8],rdi
      82:	mov    BYTE PTR [rbp-0x34],0x0
      86:	mov    BYTE PTR [rbp-0x53],0x0
      8a:	mov    BYTE PTR [rbp-0x52],0x0
      8e:	mov    BYTE PTR [rbp-0x51],0x0
      92:	mov    BYTE PTR [rbp-0x50],0x0
      96:	mov    BYTE PTR [rbp-0x4f],0x0
      9a:	mov    BYTE PTR [rbp-0x4e],0x0
      9e:	mov    BYTE PTR [rbp-0x4d],0x0
      a2:	mov    BYTE PTR [rbp-0x4c],0x0
      a6:	mov    BYTE PTR [rbp-0x4b],0x0
      aa:	mov    BYTE PTR [rbp-0x4a],0x0
      ae:	mov    BYTE PTR [rbp-0x49],0x0
      b2:	mov    BYTE PTR [rbp-0x48],0x0
      b6:	mov    BYTE PTR [rbp-0x47],0x0
      ba:	mov    BYTE PTR [rbp-0x46],0x0
      be:	mov    BYTE PTR [rbp-0x45],0x0
      c2:	mov    BYTE PTR [rbp-0x44],0x0
      c6:	mov    BYTE PTR [rbp-0x43],0x0
      ca:	mov    BYTE PTR [rbp-0x42],0x0
      ce:	mov    BYTE PTR [rbp-0x41],0x0
      d2:	mov    BYTE PTR [rbp-0x40],0x0
      d6:	mov    BYTE PTR [rbp-0x3f],0x0
      da:	mov    BYTE PTR [rbp-0x3e],0x0
      de:	mov    BYTE PTR [rbp-0x3d],0x0
      e2:	mov    BYTE PTR [rbp-0x3c],0x0
      e6:	mov    BYTE PTR [rbp-0x3b],0x0
      ea:	mov    BYTE PTR [rbp-0x3a],0x0
      ee:	mov    BYTE PTR [rbp-0x39],0x0
      f2:	mov    BYTE PTR [rbp-0x38],0x0
      f6:	mov    BYTE PTR [rbp-0x37],0x0
      fa:	mov    BYTE PTR [rbp-0x36],0x0
      fe:	mov    BYTE PTR [rbp-0x35],0x0
     102:	xorps  xmm0,xmm0
     105:	movaps XMMWORD PTR [rbp-0x3b0],xmm0
     10c:	movaps XMMWORD PTR [rbp-0x3c0],xmm0
     113:	mov    eax,0x8
     118:	xor    esi,esi
     11a:	nop    WORD PTR [rax+rax*1+0x0]
     120:	movzx  edi,BYTE PTR [rdx+rsi*1]
     124:	lea    ecx,[rax-0x8]
     127:	and    cl,0x30
     12a:	shl    rdi,cl
     12d:	mov    r8,rsi
     130:	and    r8,0xfffffffffffffff8
     134:	or     rdi,QWORD PTR [rbp+r8*1-0x3c0]
     13c:	mov    QWORD PTR [rbp+r8*1-0x3c0],rdi
     144:	movzx  r9d,BYTE PTR [rdx+rsi*1+0x1]
     14a:	mov    ecx,eax
     14c:	and    cl,0x38
     14f:	shl    r9,cl
     152:	or     r9,rdi
     155:	mov    QWORD PTR [rbp+r8*1-0x3c0],r9
     15d:	add    rsi,0x2
     161:	add    rax,0x10
     165:	cmp    rsi,0x20
     169:	jne    120 <__RNvMs_NtCslh91aX0c5fM_12toyos_crypto6x25519NtB4_9SecretKey5agree+0xc0>
     16b:	movabs rax,0x7ffffffffffff
     175:	mov    rdx,QWORD PTR [rbp-0x3c0]
     17c:	mov    r8,QWORD PTR [rbp-0x3b8]
     183:	mov    r14,r8
     186:	shld   r14,rdx,0xd
     18b:	and    rdx,rax
     18e:	and    r14,rax
     191:	mov    r15,QWORD PTR [rbp-0x3b0]
     198:	shrd   r8,r15,0x26
     19d:	and    r8,rax
     1a0:	mov    r12,QWORD PTR [rbp-0x3a8]
     1a7:	shrd   r15,r12,0x19
     1ac:	and    r15,rax
     1af:	shr    r12,0xc
     1b3:	and    r12,rax
     1b6:	mov    QWORD PTR [rbp-0x230],0x0
     1c1:	mov    QWORD PTR [rbp-0x238],0x0
     1cc:	mov    QWORD PTR [rbp-0x240],0x0
     1d7:	mov    QWORD PTR [rbp-0x248],0x0
     1e2:	mov    QWORD PTR [rbp-0x250],0x1
     1ed:	mov    QWORD PTR [rbp-0x228],0x0
     1f8:	mov    QWORD PTR [rbp-0x220],0x0
     203:	mov    QWORD PTR [rbp-0x218],0x0
     20e:	mov    QWORD PTR [rbp-0x210],0x0
     219:	mov    QWORD PTR [rbp-0x208],0x0
     224:	lea    rdi,[rbp-0x3c0]
     22b:	lea    rsi,[rbp-0x250]
     232:	mov    ecx,0xa
     237:	rep movs QWORD PTR [rdi],QWORD PTR [rsi]
     23a:	mov    rax,QWORD PTR [rbp-0x3c0]
     241:	mov    QWORD PTR [rbp-0xb8],rax
     248:	mov    rax,QWORD PTR [rbp-0x3b8]
     24f:	mov    QWORD PTR [rbp-0x68],rax
     253:	mov    rax,QWORD PTR [rbp-0x3b0]
     25a:	mov    QWORD PTR [rbp-0x60],rax
     25e:	mov    rax,QWORD PTR [rbp-0x3a8]
     265:	mov    QWORD PTR [rbp-0x80],rax
     269:	mov    rax,QWORD PTR [rbp-0x3a0]
     270:	mov    QWORD PTR [rbp-0x88],rax
     277:	mov    r9,QWORD PTR [rbp-0x398]
     27e:	mov    rbx,QWORD PTR [rbp-0x390]
     285:	mov    rcx,QWORD PTR [rbp-0x388]
     28c:	mov    r10,QWORD PTR [rbp-0x380]
     293:	mov    eax,0x1
     298:	mov    QWORD PTR [rbp-0xe0],rax
     29f:	mov    esi,0xfe
     2a4:	mov    QWORD PTR [rbp-0x98],0x0
     2af:	mov    r11,QWORD PTR [rbp-0x378]
     2b6:	mov    QWORD PTR [rbp-0x90],0x0
     2c1:	mov    QWORD PTR [rbp-0x78],0x0
     2c9:	mov    QWORD PTR [rbp-0xb0],0x0
     2d4:	mov    QWORD PTR [rbp-0x280],r12
     2db:	mov    QWORD PTR [rbp-0x110],r12
     2e2:	mov    QWORD PTR [rbp-0x2e0],r15
     2e9:	mov    rdi,r15
     2ec:	mov    QWORD PTR [rbp-0x2e8],r8
     2f3:	mov    QWORD PTR [rbp-0x288],r14
     2fa:	mov    QWORD PTR [rbp-0x290],rdx
     301:	mov    r15,rdx
     304:	xor    r12d,r12d
     307:	nop    WORD PTR [rax+rax*1+0x0]
     310:	mov    QWORD PTR [rbp-0x2f0],rsi
     317:	mov    rax,r12
     31a:	mov    rdx,rsi
     31d:	shr    rdx,0x3
     321:	mov    rsi,QWORD PTR [rbp-0x2c8]
     328:	movzx  edx,BYTE PTR [rsi+rdx*1]
     32c:	mov    rsi,QWORD PTR [rbp-0x2f0]
     333:	and    esi,0x7
     336:	bt     edx,esi
     339:	mov    edx,0x0
     33e:	setb   dl
     341:	mov    QWORD PTR [rbp-0x408],rdx
     348:	xor    rax,rdx
     34b:	neg    rax
     34e:	mov    rdx,r15
     351:	mov    r13,QWORD PTR [rbp-0xb8]
     358:	xor    rdx,r13
     35b:	and    rdx,rax
     35e:	xor    r13,rdx
     361:	mov    QWORD PTR [rbp-0xb8],r13
     368:	xor    rdx,r15
     36b:	mov    QWORD PTR [rbp-0x100],rdx
     372:	mov    rdx,r14
     375:	mov    rsi,QWORD PTR [rbp-0x68]
     379:	xor    rdx,rsi
     37c:	and    rdx,rax
     37f:	xor    rsi,rdx
     382:	mov    r15,rsi
     385:	mov    QWORD PTR [rbp-0x68],rsi
     389:	xor    rdx,r14
     38c:	mov    QWORD PTR [rbp-0xc8],rdx
     393:	mov    rdx,r8
     396:	mov    rsi,QWORD PTR [rbp-0x60]
     39a:	xor    rdx,rsi
     39d:	and    rdx,rax
     3a0:	xor    rsi,rdx
     3a3:	mov    QWORD PTR [rbp-0x60],rsi
     3a7:	xor    rdx,r8
     3aa:	mov    QWORD PTR [rbp-0xc0],rdx
     3b1:	mov    rdx,rdi
     3b4:	mov    rsi,QWORD PTR [rbp-0x80]
     3b8:	xor    rdx,rsi
     3bb:	and    rdx,rax
     3be:	xor    rsi,rdx
     3c1:	mov    r8,rsi
     3c4:	mov    QWORD PTR [rbp-0x80],rsi
     3c8:	xor    rdx,rdi
     3cb:	mov    QWORD PTR [rbp-0xd0],rdx
     3d2:	mov    r12,QWORD PTR [rbp-0x110]
     3d9:	mov    rdx,r12
     3dc:	mov    rsi,QWORD PTR [rbp-0x88]
     3e3:	xor    rdx,rsi
     3e6:	and    rdx,rax
     3e9:	xor    rsi,rdx
     3ec:	mov    rdi,rsi
     3ef:	mov    QWORD PTR [rbp-0x88],rsi
     3f6:	xor    rdx,r12
     3f9:	mov    QWORD PTR [rbp-0xa8],rdx
     400:	mov    rdx,QWORD PTR [rbp-0xe0]
     407:	mov    rsi,rdx
     40a:	xor    rsi,r9
     40d:	and    rsi,rax
     410:	xor    r9,rsi
     413:	xor    rsi,rdx
     416:	mov    QWORD PTR [rbp-0x138],rsi
     41d:	mov    rdx,QWORD PTR [rbp-0xb0]
     424:	mov    rsi,rdx
     427:	xor    rsi,rbx
     42a:	and    rsi,rax
     42d:	xor    rbx,rsi
     430:	mov    QWORD PTR [rbp-0xe8],rbx
     437:	xor    rsi,rdx
     43a:	mov    QWORD PTR [rbp-0x140],rsi
     441:	mov    rsi,QWORD PTR [rbp-0x78]
     445:	mov    rdx,rsi
     448:	xor    rdx,rcx
     44b:	and    rdx,rax
     44e:	xor    rcx,rdx
     451:	xor    rdx,rsi
     454:	mov    QWORD PTR [rbp-0x108],rdx
     45b:	mov    rdx,QWORD PTR [rbp-0x90]
     462:	mov    rsi,rdx
     465:	xor    rsi,r10
     468:	and    rsi,rax
     46b:	xor    r10,rsi
     46e:	mov    QWORD PTR [rbp-0x178],r10
     475:	xor    rsi,rdx
     478:	mov    QWORD PTR [rbp-0x118],rsi
     47f:	mov    rdx,QWORD PTR [rbp-0x98]
     486:	mov    rsi,rdx
     489:	xor    rsi,r11
     48c:	and    rsi,rax
     48f:	xor    r11,rsi
     492:	xor    rsi,rdx
     495:	mov    QWORD PTR [rbp-0x98],rsi
     49c:	add    r10,r8
     49f:	lea    rax,[r10+r10*8]
     4a3:	mov    rsi,r9
     4a6:	mov    QWORD PTR [rbp-0xf0],r9
     4ad:	lea    r9,[r10+rax*2]
     4b1:	lea    rdx,[r11+rdi*1]
     4b5:	mov    QWORD PTR [rbp-0xf8],rdx
     4bc:	lea    rax,[rdx+rdx*8]
     4c0:	lea    r8,[rdx+rax*2]
     4c4:	mov    QWORD PTR [rbp-0xa0],r8
     4cb:	add    r13,rsi
     4ce:	mov    rax,r13
     4d1:	mul    r13
     4d4:	mov    QWORD PTR [rbp-0x128],r13
     4db:	mov    rsi,rax
     4de:	mov    rdi,rdx
     4e1:	lea    r14,[rbx+r15*1]
     4e5:	lea    rdx,[r14+r14*1]
     4e9:	mov    QWORD PTR [rbp-0xd8],rdx
     4f0:	mov    QWORD PTR [rbp-0x90],r14
     4f7:	mov    rax,r8
     4fa:	mul    rdx
     4fd:	mov    r8,rax
     500:	mov    r15,rdx
     503:	mov    rax,QWORD PTR [rbp-0x60]
     507:	add    rax,rcx
     50a:	mov    QWORD PTR [rbp-0x78],rax
     50e:	lea    rbx,[rax+rax*1]
     512:	mov    rax,r9
     515:	mov    QWORD PTR [rbp-0x110],r9
     51c:	mul    rbx
     51f:	add    rax,rsi
     522:	adc    rdi,rdx
     525:	add    rax,r8
     528:	mov    QWORD PTR [rbp-0x188],rax
     52f:	adc    rdi,r15
     532:	add    r13,r13
     535:	mov    rax,r14
     538:	mul    r13
     53b:	mov    r15,rdx
     53e:	mov    rsi,rax
     541:	mov    rax,r9
     544:	mul    r10
     547:	mov    r8,rax
     54a:	add    r8,rsi
     54d:	adc    r15,rdx
     550:	mov    r9,QWORD PTR [rbp-0xa0]
     557:	mov    rax,r9
     55a:	mul    rbx
     55d:	add    rax,r8
     560:	mov    QWORD PTR [rbp-0x158],rax
     567:	adc    r15,rdx
     56a:	mov    r8,QWORD PTR [rbp-0x78]
     56e:	mov    rax,r8
     571:	mul    r13
     574:	mov    r14,r13
     577:	mov    rbx,rdx
     57a:	mov    rsi,rax
     57d:	mov    rax,QWORD PTR [rbp-0x90]
     584:	mul    rax
     587:	mov    r12,rax
     58a:	add    r12,rsi
     58d:	adc    rbx,rdx
     590:	mov    QWORD PTR [rbp-0x170],r10
     597:	lea    rdx,[r10+r10*1]
     59b:	mov    rax,r9
     59e:	mul    rdx
     5a1:	add    rax,r12
     5a4:	mov    QWORD PTR [rbp-0x190],rax
     5ab:	adc    rbx,rdx
     5ae:	mov    rax,r10
     5b1:	mul    r13
     5b4:	mov    rsi,rdx
     5b7:	mov    r12,rax
     5ba:	mov    rax,r8
     5bd:	mov    r8,QWORD PTR [rbp-0xd8]
     5c4:	mul    r8
     5c7:	mov    r13,rax
     5ca:	add    r13,r12
     5cd:	adc    rsi,rdx
     5d0:	mov    rax,r9
     5d3:	mov    r9,QWORD PTR [rbp-0xf8]
     5da:	mul    r9
     5dd:	mov    r12,rax
     5e0:	add    r12,r13
     5e3:	adc    rsi,rdx
     5e6:	mov    rax,r9
     5e9:	mul    r14
     5ec:	mov    r14,rdx
     5ef:	mov    QWORD PTR [rbp-0x180],rax
     5f6:	mov    rax,QWORD PTR [rbp-0x80]
     5fa:	mov    r10,QWORD PTR [rbp-0x178]
     601:	add    rax,r10
     604:	mul    r8
     607:	mov    QWORD PTR [rbp-0xd8],rdx
     60e:	mov    QWORD PTR [rbp-0x150],rax
     615:	mov    rax,QWORD PTR [rbp-0x78]
     619:	mul    rax
     61c:	mov    r13,rdi
     61f:	mov    r9,QWORD PTR [rbp-0x188]
     626:	shld   rdi,r9,0xd
     62b:	shr    r13,0x33
     62f:	add    rdi,QWORD PTR [rbp-0x158]
     636:	adc    r13,r15
     639:	mov    r15,r13
     63c:	shld   r13,rdi,0xd
     641:	shr    r15,0x33
     645:	add    r13,QWORD PTR [rbp-0x190]
     64c:	adc    r15,rbx
     64f:	mov    r8,r15
     652:	shr    r8,0x33
     656:	shld   r15,r13,0xd
     65b:	add    r15,r12
     65e:	adc    r8,rsi
     661:	mov    rsi,r8
     664:	shr    rsi,0x33
     668:	shld   r8,r15,0xd
     66d:	mov    r12,r15
     670:	add    rax,QWORD PTR [rbp-0x150]
     677:	adc    rdx,QWORD PTR [rbp-0xd8]
     67e:	add    rax,QWORD PTR [rbp-0x180]
     685:	adc    rdx,r14
     688:	add    rax,r8
     68b:	mov    r8,rax
     68e:	adc    rdx,rsi
     691:	mov    rax,rdx
     694:	shr    rdx,0x33
     698:	lea    rsi,[rdx+rdx*8]
     69c:	lea    r15,[rdx+rsi*2]
     6a0:	movabs rsi,0x7ffffffffffff
     6aa:	and    r9,rsi
     6ad:	shld   rax,r8,0xd
     6b2:	mov    edx,0x13
     6b7:	mul    rdx
     6ba:	add    rax,r9
     6bd:	adc    r15,rdx
     6c0:	and    rdi,rsi
     6c3:	shld   r15,rax,0xd
     6c8:	mov    rdx,rax
     6cb:	add    r15,rdi
     6ce:	mov    QWORD PTR [rbp-0x188],r15
     6d5:	movabs r9,0xffffffffffffe
     6df:	mov    rax,QWORD PTR [rbp-0xb8]
     6e6:	lea    r14,[rax+r9*1-0x24]
     6eb:	sub    r14,QWORD PTR [rbp-0xf0]
     6f2:	mov    rax,QWORD PTR [rbp-0x68]
     6f6:	add    rax,r9
     6f9:	sub    rax,QWORD PTR [rbp-0xe8]
     700:	mov    r15,rax
     703:	mov    rbx,QWORD PTR [rbp-0x60]
     707:	add    rbx,r9
     70a:	sub    rbx,rcx
     70d:	mov    QWORD PTR [rbp-0x60],rbx
     711:	mov    rcx,QWORD PTR [rbp-0x80]
     715:	add    rcx,r9
     718:	sub    rcx,r10
     71b:	mov    QWORD PTR [rbp-0x80],rcx
     71f:	mov    rdi,QWORD PTR [rbp-0x88]
     726:	add    rdi,r9
     729:	sub    rdi,r11
     72c:	mov    QWORD PTR [rbp-0x88],rdi
     733:	and    rdx,rsi
     736:	mov    QWORD PTR [rbp-0x180],rdx
     73d:	and    r13,rsi
     740:	mov    QWORD PTR [rbp-0xd8],r13
     747:	and    r12,rsi
     74a:	mov    QWORD PTR [rbp-0xe8],r12
     751:	and    r8,rsi
     754:	mov    QWORD PTR [rbp-0xf0],r8
     75b:	lea    rax,[rcx+rcx*8]
     75f:	lea    r12,[rcx+rax*2]
     763:	lea    rax,[rdi+rdi*8]
     767:	lea    r9,[rdi+rax*2]
     76b:	mov    rax,r14
     76e:	mul    r14
     771:	mov    QWORD PTR [rbp-0xb0],r14
     778:	mov    rsi,rax
     77b:	mov    r8,rdx
     77e:	lea    rcx,[r15+r15*1]
     782:	mov    QWORD PTR [rbp-0xb8],rcx
     789:	mov    r13,r15
     78c:	mov    rax,r9
     78f:	mov    r15,r9
     792:	mul    rcx
     795:	mov    r9,rax
     798:	mov    r10,rdx
     79b:	lea    r11,[rbx+rbx*1]
     79f:	mov    QWORD PTR [rbp-0x130],r12
     7a6:	mov    rax,r12
     7a9:	mul    r11
     7ac:	mov    rcx,rdx
     7af:	mov    rdi,rax
     7b2:	add    rdi,rsi
     7b5:	adc    rcx,r8
     7b8:	add    rdi,r9
     7bb:	adc    rcx,r10
     7be:	lea    r10,[r14+r14*1]
     7c2:	mov    rax,r13
     7c5:	mul    r10
     7c8:	mov    r9,rdx
     7cb:	mov    rsi,rax
     7ce:	mov    rax,r12
     7d1:	mov    rbx,QWORD PTR [rbp-0x80]
     7d5:	mul    rbx
     7d8:	mov    r8,rax
     7db:	add    r8,rsi
     7de:	adc    r9,rdx
     7e1:	mov    rax,r15
     7e4:	mul    r11
     7e7:	add    rax,r8
     7ea:	mov    QWORD PTR [rbp-0x158],rax
     7f1:	adc    r9,rdx
     7f4:	mov    r14,QWORD PTR [rbp-0x60]
     7f8:	mov    rax,r14
     7fb:	mov    r12,r10
     7fe:	mov    QWORD PTR [rbp-0x190],r10
     805:	mul    r10
     808:	mov    r8,rdx
     80b:	mov    rsi,rax
     80e:	mov    QWORD PTR [rbp-0x68],r13
     812:	mov    rax,r13
     815:	mul    r13
     818:	mov    r11,rax
     81b:	add    r11,rsi
     81e:	adc    r8,rdx
     821:	lea    rdx,[rbx+rbx*1]
     825:	mov    rax,r15
     828:	mov    QWORD PTR [rbp-0xe0],r15
     82f:	mul    rdx
     832:	mov    r10,rax
     835:	add    r10,r11
     838:	adc    r8,rdx
     83b:	mov    rax,rbx
     83e:	mov    r13,rbx
     841:	mul    r12
     844:	mov    r11,rdx
     847:	mov    rbx,rax
     84a:	mov    rax,r14
     84d:	mov    rsi,QWORD PTR [rbp-0xb8]
     854:	mul    rsi
     857:	mov    r14,rdx
     85a:	mov    r12,rax
     85d:	add    r12,rbx
     860:	adc    r14,r11
     863:	mov    rax,r15
     866:	mov    r11,QWORD PTR [rbp-0x88]
     86d:	mul    r11
     870:	mov    rbx,rdx
     873:	mov    r15,rax
     876:	add    r15,r12
     879:	adc    rbx,r14
     87c:	mov    rax,r11
     87f:	mul    QWORD PTR [rbp-0x190]
     886:	mov    QWORD PTR [rbp-0x190],rdx
     88d:	mov    r14,rax
     890:	mov    rax,r13
     893:	mul    rsi
     896:	mov    r12,rdx
     899:	mov    r13,rax
     89c:	mov    rax,QWORD PTR [rbp-0x60]
     8a0:	mul    rax
     8a3:	mov    r11,rax
     8a6:	mov    rax,rcx
     8a9:	shld   rcx,rdi,0xd
     8ae:	shr    rax,0x33
     8b2:	add    rcx,QWORD PTR [rbp-0x158]
     8b9:	adc    rax,r9
     8bc:	mov    r9,rax
     8bf:	shld   rax,rcx,0xd
     8c4:	shr    r9,0x33
     8c8:	add    rax,r10
     8cb:	mov    r10,rax
     8ce:	adc    r9,r8
     8d1:	mov    rax,r9
     8d4:	shr    rax,0x33
     8d8:	shld   r9,r10,0xd
     8dd:	add    r9,r15
     8e0:	adc    rax,rbx
     8e3:	mov    rsi,rax
     8e6:	shr    rsi,0x33
     8ea:	shld   rax,r9,0xd
     8ef:	add    r11,r13
     8f2:	adc    rdx,r12
     8f5:	add    r11,r14
     8f8:	adc    rdx,QWORD PTR [rbp-0x190]
     8ff:	add    r11,rax
     902:	adc    rdx,rsi
     905:	mov    rax,rdx
     908:	shld   rax,r11,0xd
     90d:	shr    rdx,0x33
     911:	lea    rsi,[rdx+rdx*8]
     915:	lea    rsi,[rdx+rsi*2]
     919:	mov    edx,0x13
     91e:	mul    rdx
     921:	movabs rbx,0x7ffffffffffff
     92b:	and    rdi,rbx
     92e:	add    rax,rdi
     931:	adc    rdx,rsi
     934:	shld   rdx,rax,0xd
     939:	and    rcx,rbx
     93c:	add    rdx,rcx
     93f:	mov    r15,rdx
     942:	mov    QWORD PTR [rbp-0xb8],rdx
     949:	mov    rcx,QWORD PTR [rbp-0xc8]
     950:	mov    rdx,QWORD PTR [rbp-0x140]
     957:	lea    rdi,[rdx+rcx*1]
     95b:	mov    QWORD PTR [rbp-0x1a0],rdi
     962:	movabs rdi,0xffffffffffffe
     96c:	add    rcx,rdi
     96f:	sub    rcx,rdx
     972:	mov    r14,rcx
     975:	mov    QWORD PTR [rbp-0xc8],rcx
     97c:	mov    rcx,QWORD PTR [rbp-0xc0]
     983:	mov    rdx,QWORD PTR [rbp-0x108]
     98a:	lea    r8,[rdx+rcx*1]
     98e:	mov    QWORD PTR [rbp-0x1c8],r8
     995:	add    rcx,rdi
     998:	sub    rcx,rdx
     99b:	mov    QWORD PTR [rbp-0xc0],rcx
     9a2:	mov    r12,QWORD PTR [rbp-0xd0]
     9a9:	mov    rdx,QWORD PTR [rbp-0x118]
     9b0:	lea    r8,[rdx+r12*1]
     9b4:	mov    QWORD PTR [rbp-0x198],r8
     9bb:	add    r12,rdi
     9be:	sub    r12,rdx
     9c1:	mov    QWORD PTR [rbp-0xd0],r12
     9c8:	mov    rsi,QWORD PTR [rbp-0xa8]
     9cf:	mov    rdx,QWORD PTR [rbp-0x98]
     9d6:	lea    r8,[rdx+rsi*1]
     9da:	mov    QWORD PTR [rbp-0x1a8],r8
     9e1:	add    rsi,rdi
     9e4:	sub    rsi,rdx
     9e7:	mov    QWORD PTR [rbp-0xa8],rsi
     9ee:	mov    rdx,rax
     9f1:	and    rdx,rbx
     9f4:	mov    QWORD PTR [rbp-0x178],rdx
     9fb:	and    r10,rbx
     9fe:	mov    QWORD PTR [rbp-0x1d0],r10
     a05:	and    r9,rbx
     a08:	mov    QWORD PTR [rbp-0x150],r9
     a0f:	and    r11,rbx
     a12:	mov    r13,r11
     a15:	mov    QWORD PTR [rbp-0x270],r11
     a1c:	mov    rax,QWORD PTR [rbp-0x180]
     a23:	lea    rax,[rax+rdi*1-0x24]
     a28:	sub    rax,rdx
     a2b:	mov    QWORD PTR [rbp-0x140],rax
     a32:	mov    rax,QWORD PTR [rbp-0x188]
     a39:	add    rax,rdi
     a3c:	sub    rax,r15
     a3f:	mov    QWORD PTR [rbp-0x158],rax
     a46:	mov    rax,QWORD PTR [rbp-0xd8]
     a4d:	add    rax,rdi
     a50:	sub    rax,r10
     a53:	mov    QWORD PTR [rbp-0x108],rax
     a5a:	mov    rax,QWORD PTR [rbp-0xe8]
     a61:	add    rax,rdi
     a64:	sub    rax,r9
     a67:	mov    QWORD PTR [rbp-0x118],rax
     a6e:	mov    rax,QWORD PTR [rbp-0x100]
     a75:	lea    rax,[rax+rdi*1-0x24]
     a7a:	sub    rax,QWORD PTR [rbp-0x138]
     a81:	mov    QWORD PTR [rbp-0x120],rax
     a88:	mov    rbx,QWORD PTR [rbp-0x128]
     a8f:	mul    rbx
     a92:	mov    r9,rax
     a95:	mov    QWORD PTR [rbp-0x160],rdx
     a9c:	mov    rcx,QWORD PTR [rbp-0x90]
     aa3:	lea    rax,[rcx+rcx*8]
     aa7:	lea    rdi,[rcx+rax*2]
     aab:	mov    rax,QWORD PTR [rbp-0xa0]
     ab2:	mul    r14
     ab5:	mov    QWORD PTR [rbp-0x148],rdx
     abc:	mov    QWORD PTR [rbp-0x168],rax
     ac3:	mov    r15,QWORD PTR [rbp-0x110]
     aca:	mov    rax,r15
     acd:	mov    r8,QWORD PTR [rbp-0xc0]
     ad4:	mul    r8
     ad7:	mov    r11,rax
     ada:	mov    r14,rdx
     add:	mov    rcx,QWORD PTR [rbp-0x78]
     ae1:	lea    rax,[rcx+rcx*8]
     ae5:	lea    rcx,[rcx+rax*2]
     ae9:	mov    QWORD PTR [rbp-0x98],rcx
     af0:	mov    rax,r12
     af3:	mul    rcx
     af6:	mov    rcx,rdx
     af9:	mov    r10,rax
     afc:	mov    rax,rsi
     aff:	mul    rdi
     b02:	mov    r12,QWORD PTR [rbp-0xf0]
     b09:	movabs rsi,0xffffffffffffe
     b13:	add    r12,rsi
     b16:	sub    r12,r13
     b19:	mov    QWORD PTR [rbp-0x190],r12
     b20:	add    r10,r9
     b23:	adc    rcx,QWORD PTR [rbp-0x160]
     b2a:	add    r10,r11
     b2d:	adc    rcx,r14
     b30:	add    r10,rax
     b33:	adc    rcx,rdx
     b36:	add    r10,QWORD PTR [rbp-0x168]
     b3d:	mov    QWORD PTR [rbp-0x3c8],r10
     b44:	adc    rcx,QWORD PTR [rbp-0x148]
     b4b:	mov    r13,QWORD PTR [rbp-0x90]
     b52:	mov    rax,r13
     b55:	mov    r10,QWORD PTR [rbp-0x120]
     b5c:	mul    r10
     b5f:	mov    r9,rdx
     b62:	mov    rdi,rax
     b65:	mov    rsi,QWORD PTR [rbp-0xc8]
     b6c:	mov    rax,rsi
     b6f:	mul    rbx
     b72:	add    rax,rdi
     b75:	mov    QWORD PTR [rbp-0x160],rax
     b7c:	adc    rdx,r9
     b7f:	mov    QWORD PTR [rbp-0x1c0],rdx
     b86:	mov    rbx,QWORD PTR [rbp-0xa0]
     b8d:	mov    rax,rbx
     b90:	mul    r8
     b93:	mov    QWORD PTR [rbp-0x148],rdx
     b9a:	mov    QWORD PTR [rbp-0x168],rax
     ba1:	mov    rax,r15
     ba4:	mov    r11,QWORD PTR [rbp-0xd0]
     bab:	mul    r11
     bae:	mov    r14,rdx
     bb1:	mov    r9,rax
     bb4:	mov    r15,QWORD PTR [rbp-0xa8]
     bbb:	mov    rax,r15
     bbe:	mul    QWORD PTR [rbp-0x98]
     bc5:	mov    QWORD PTR [rbp-0x1b8],rdx
     bcc:	mov    QWORD PTR [rbp-0x1b0],rax
     bd3:	mov    rax,QWORD PTR [rbp-0x78]
     bd7:	mul    r10
     bda:	mov    r12,rdx
     bdd:	mov    rdi,rax
     be0:	mov    rax,rsi
     be3:	mul    r13
     be6:	mov    r8,rdx
     be9:	mov    r13,rax
     bec:	add    r13,rdi
     bef:	adc    r8,r12
     bf2:	mov    rsi,QWORD PTR [rbp-0xc0]
     bf9:	mov    rax,rsi
     bfc:	mov    rdi,QWORD PTR [rbp-0x128]
     c03:	mul    rdi
     c06:	add    rax,r13
     c09:	mov    QWORD PTR [rbp-0x278],rax
     c10:	adc    rdx,r8
     c13:	mov    QWORD PTR [rbp-0x2d0],rdx
     c1a:	mov    r8,rbx
     c1d:	mov    rax,rbx
     c20:	mul    r11
     c23:	mov    QWORD PTR [rbp-0x258],rdx
     c2a:	mov    QWORD PTR [rbp-0x400],rax
     c31:	mov    rax,r15
     c34:	mul    QWORD PTR [rbp-0x110]
     c3b:	mov    r13,rdx
     c3e:	mov    QWORD PTR [rbp-0x98],rax
     c45:	mov    rbx,QWORD PTR [rbp-0x170]
     c4c:	mov    rax,rbx
     c4f:	mul    r10
     c52:	mov    QWORD PTR [rbp-0x268],rdx
     c59:	mov    QWORD PTR [rbp-0x260],rax
     c60:	mov    rax,QWORD PTR [rbp-0x78]
     c64:	mov    r10,QWORD PTR [rbp-0xc8]
     c6b:	mul    r10
     c6e:	mov    QWORD PTR [rbp-0x3f8],rdx
     c75:	mov    QWORD PTR [rbp-0x3f0],rax
     c7c:	mov    rax,rsi
     c7f:	mov    r12,QWORD PTR [rbp-0x90]
     c86:	mul    r12
     c89:	mov    rsi,rdx
     c8c:	mov    QWORD PTR [rbp-0x110],rax
     c93:	mov    rax,r11
     c96:	mul    rdi
     c99:	mov    QWORD PTR [rbp-0x3e8],rdx
     ca0:	mov    QWORD PTR [rbp-0x3d8],rax
     ca7:	mov    rax,r8
     caa:	mul    r15
     cad:	mov    QWORD PTR [rbp-0x3e0],rdx
     cb4:	mov    QWORD PTR [rbp-0x3d0],rax
     cbb:	mov    rax,QWORD PTR [rbp-0xf8]
     cc2:	mul    QWORD PTR [rbp-0x120]
     cc9:	mov    QWORD PTR [rbp-0xa0],rdx
     cd0:	mov    QWORD PTR [rbp-0xf8],rax
     cd7:	mov    rax,rbx
     cda:	mul    r10
     cdd:	mov    QWORD PTR [rbp-0xc8],rdx
     ce4:	mov    QWORD PTR [rbp-0x120],rax
     ceb:	mov    rax,QWORD PTR [rbp-0xc0]
     cf2:	mul    QWORD PTR [rbp-0x78]
     cf6:	mov    rbx,rdx
     cf9:	mov    r11,rax
     cfc:	mov    rax,QWORD PTR [rbp-0xd0]
     d03:	mul    r12
     d06:	mov    QWORD PTR [rbp-0x78],rdx
     d0a:	mov    r8,rax
     d0d:	mov    rax,r15
     d10:	mul    rdi
     d13:	mov    rdi,rcx
     d16:	mov    r10,QWORD PTR [rbp-0x3c8]
     d1d:	shld   rcx,r10,0xd
     d22:	shr    rdi,0x33
     d26:	add    r9,QWORD PTR [rbp-0x160]
     d2d:	adc    r14,QWORD PTR [rbp-0x1c0]
     d34:	add    r9,QWORD PTR [rbp-0x1b0]
     d3b:	adc    r14,QWORD PTR [rbp-0x1b8]
     d42:	add    r9,QWORD PTR [rbp-0x168]
     d49:	adc    r14,QWORD PTR [rbp-0x148]
     d50:	add    r9,rcx
     d53:	adc    r14,rdi
     d56:	mov    rcx,r14
     d59:	shld   r14,r9,0xd
     d5e:	shr    rcx,0x33
     d62:	mov    rdi,QWORD PTR [rbp-0x98]
     d69:	add    rdi,QWORD PTR [rbp-0x278]
     d70:	adc    r13,QWORD PTR [rbp-0x2d0]
     d77:	add    rdi,QWORD PTR [rbp-0x400]
     d7e:	adc    r13,QWORD PTR [rbp-0x258]
     d85:	add    rdi,r14
     d88:	adc    r13,rcx
     d8b:	mov    rcx,r13
     d8e:	shld   r13,rdi,0xd
     d93:	mov    r15,rdi
     d96:	shr    rcx,0x33
     d9a:	mov    rdi,QWORD PTR [rbp-0x110]
     da1:	add    rdi,QWORD PTR [rbp-0x3f0]
     da8:	adc    rsi,QWORD PTR [rbp-0x3f8]
     daf:	add    rdi,QWORD PTR [rbp-0x260]
     db6:	adc    rsi,QWORD PTR [rbp-0x268]
     dbd:	add    rdi,QWORD PTR [rbp-0x3d8]
     dc4:	adc    rsi,QWORD PTR [rbp-0x3e8]
     dcb:	add    rdi,QWORD PTR [rbp-0x3d0]
     dd2:	adc    rsi,QWORD PTR [rbp-0x3e0]
     dd9:	add    rdi,r13
     ddc:	adc    rsi,rcx
     ddf:	mov    rcx,rsi
     de2:	shld   rsi,rdi,0xd
     de7:	mov    r12,rdi
     dea:	shr    rcx,0x33
     dee:	mov    r14,r11
     df1:	add    r14,QWORD PTR [rbp-0x120]
     df8:	adc    rbx,QWORD PTR [rbp-0xc8]
     dff:	mov    rdi,QWORD PTR [rbp-0x100]
     e06:	mov    r11,QWORD PTR [rbp-0x138]
     e0d:	add    rdi,r11
     e10:	mov    QWORD PTR [rbp-0xc0],rdi
     e17:	add    r14,r8
     e1a:	adc    rbx,QWORD PTR [rbp-0x78]
     e1e:	add    r14,QWORD PTR [rbp-0xf8]
     e25:	adc    rbx,QWORD PTR [rbp-0xa0]
     e2c:	add    r14,rax
     e2f:	adc    rbx,rdx
     e32:	add    r14,rsi
     e35:	adc    rbx,rcx
     e38:	mov    rax,rbx
     e3b:	shld   rax,r14,0xd
     e40:	shr    rbx,0x33
     e44:	lea    rcx,[rbx+rbx*8]
     e48:	lea    rcx,[rbx+rcx*2]
     e4c:	mov    edx,0x13
     e51:	mul    rdx
     e54:	movabs rsi,0x7ffffffffffff
     e5e:	mov    r8,r10
     e61:	and    r8,rsi
     e64:	add    rax,r8
     e67:	adc    rdx,rcx
     e6a:	shld   rdx,rax,0xd
     e6f:	and    r9,rsi
     e72:	add    rdx,r9
     e75:	mov    QWORD PTR [rbp-0xa8],rdx
     e7c:	and    rax,rsi
     e7f:	mov    QWORD PTR [rbp-0xa0],rax
     e86:	and    r15,rsi
     e89:	mov    QWORD PTR [rbp-0x98],r15
     e90:	and    r12,rsi
     e93:	mov    QWORD PTR [rbp-0x110],r12
     e9a:	mov    rcx,QWORD PTR [rbp-0x68]
     e9e:	lea    rax,[rcx+rcx*8]
     ea2:	lea    r12,[rcx+rax*2]
     ea6:	mov    rax,rdi
     ea9:	mov    r13,QWORD PTR [rbp-0xb0]
     eb0:	mul    r13
     eb3:	mov    rsi,rdx
     eb6:	mov    rcx,rax
     eb9:	mov    rax,QWORD PTR [rbp-0xe0]
     ec0:	mov    r8,QWORD PTR [rbp-0x1a0]
     ec7:	mul    r8
     eca:	mov    QWORD PTR [rbp-0x90],rax
     ed1:	mov    QWORD PTR [rbp-0xd0],rdx
     ed8:	mov    rdx,QWORD PTR [rbp-0x60]
     edc:	lea    rax,[rdx+rdx*8]
     ee0:	lea    r9,[rdx+rax*2]
     ee4:	mov    QWORD PTR [rbp-0xc8],r9
     eeb:	mov    rax,QWORD PTR [rbp-0x130]
     ef2:	mov    rdi,QWORD PTR [rbp-0x1c8]
     ef9:	mul    rdi
     efc:	mov    r10,rdx
     eff:	mov    rbx,rax
     f02:	mov    r11,QWORD PTR [rbp-0x198]
     f09:	mov    rax,r11
     f0c:	mul    r9
     f0f:	mov    r15,rdx
     f12:	mov    r9,rax
     f15:	mov    rax,QWORD PTR [rbp-0x1a8]
     f1c:	mul    r12
     f1f:	movabs r12,0x7ffffffffffff
     f29:	and    r14,r12
     f2c:	mov    QWORD PTR [rbp-0x78],r14
     f30:	add    r9,rcx
     f33:	adc    r15,rsi
     f36:	add    r9,rbx
     f39:	adc    r15,r10
     f3c:	add    r9,rax
     f3f:	adc    r15,rdx
     f42:	add    r9,QWORD PTR [rbp-0x90]
     f49:	mov    QWORD PTR [rbp-0x278],r9
     f50:	adc    r15,QWORD PTR [rbp-0xd0]
     f57:	mov    rcx,QWORD PTR [rbp-0x68]
     f5b:	mov    rax,rcx
     f5e:	mov    r14,QWORD PTR [rbp-0xc0]
     f65:	mul    r14
     f68:	mov    rbx,rdx
     f6b:	mov    rsi,rax
     f6e:	mov    r10,r8
     f71:	mov    rax,r8
     f74:	mul    r13
     f77:	add    rax,rsi
     f7a:	mov    QWORD PTR [rbp-0x138],rax
     f81:	adc    rdx,rbx
     f84:	mov    QWORD PTR [rbp-0xf8],rdx
     f8b:	mov    rax,QWORD PTR [rbp-0xe0]
     f92:	mul    rdi
     f95:	mov    QWORD PTR [rbp-0xd0],rdx
     f9c:	mov    QWORD PTR [rbp-0x100],rax
     fa3:	mov    r9,QWORD PTR [rbp-0x130]
     faa:	mov    rax,r9
     fad:	mov    rbx,r11
     fb0:	mul    r11
     fb3:	mov    r12,rdx
     fb6:	mov    rsi,rax
     fb9:	mov    r11,QWORD PTR [rbp-0x1a8]
     fc0:	mov    rax,r11
     fc3:	mul    QWORD PTR [rbp-0xc8]
     fca:	mov    QWORD PTR [rbp-0x128],rdx
     fd1:	mov    QWORD PTR [rbp-0x120],rax
     fd8:	mov    r8,QWORD PTR [rbp-0x60]
     fdc:	mov    rax,r8
     fdf:	mul    r14
     fe2:	mov    r13,rdx
     fe5:	mov    rdi,rax
     fe8:	mov    rax,r10
     feb:	mul    rcx
     fee:	mov    r10,rdx
     ff1:	mov    r14,rax
     ff4:	add    r14,rdi
     ff7:	adc    r10,r13
     ffa:	mov    rcx,QWORD PTR [rbp-0x1c8]
    1001:	mov    rax,rcx
    1004:	mov    rdi,QWORD PTR [rbp-0xb0]
    100b:	mul    rdi
    100e:	add    rax,r14
    1011:	mov    QWORD PTR [rbp-0x168],rax
    1018:	adc    rdx,r10
    101b:	mov    QWORD PTR [rbp-0x160],rdx
    1022:	mov    r14,QWORD PTR [rbp-0xe0]
    1029:	mov    rax,r14
    102c:	mul    rbx
    102f:	mov    QWORD PTR [rbp-0x148],rdx
    1036:	mov    QWORD PTR [rbp-0x1c0],rax
    103d:	mov    rax,r11
    1040:	mul    r9
    1043:	mov    r13,rdx
    1046:	mov    QWORD PTR [rbp-0xc8],rax
    104d:	mov    rax,QWORD PTR [rbp-0x80]
    1051:	mov    r9,QWORD PTR [rbp-0xc0]
    1058:	mul    r9
    105b:	mov    QWORD PTR [rbp-0x130],rdx
    1062:	mov    QWORD PTR [rbp-0x170],rax
    1069:	mov    rax,r8
    106c:	mov    r10,QWORD PTR [rbp-0x1a0]
    1073:	mul    r10
    1076:	mov    QWORD PTR [rbp-0x1b8],rdx
    107d:	mov    QWORD PTR [rbp-0x1b0],rax
    1084:	mov    rax,rcx
    1087:	mov    r8,QWORD PTR [rbp-0x68]
    108b:	mul    r8
    108e:	mov    rcx,rdx
    1091:	mov    QWORD PTR [rbp-0x90],rax
    1098:	mov    rax,rbx
    109b:	mul    rdi
    109e:	mov    QWORD PTR [rbp-0x268],rdx
    10a5:	mov    QWORD PTR [rbp-0x260],rax
    10ac:	mov    rax,r14
    10af:	mul    r11
    10b2:	mov    rdi,r11
    10b5:	mov    QWORD PTR [rbp-0xe0],rdx
    10bc:	mov    QWORD PTR [rbp-0x258],rax
    10c3:	mov    rax,QWORD PTR [rbp-0x88]
    10ca:	mul    r9
    10cd:	mov    QWORD PTR [rbp-0x88],rdx
    10d4:	mov    QWORD PTR [rbp-0xc0],rax
    10db:	mov    rax,QWORD PTR [rbp-0x80]
    10df:	mul    r10
    10e2:	mov    rbx,rdx
    10e5:	mov    QWORD PTR [rbp-0x80],rax
    10e9:	mov    rax,QWORD PTR [rbp-0x1c8]
    10f0:	mul    QWORD PTR [rbp-0x60]
    10f4:	mov    r14,rdx
    10f7:	mov    r11,rax
    10fa:	mov    rax,QWORD PTR [rbp-0x198]
    1101:	mul    r8
    1104:	mov    QWORD PTR [rbp-0x60],rdx
    1108:	mov    QWORD PTR [rbp-0x68],rax
    110c:	mov    rax,rdi
    110f:	mul    QWORD PTR [rbp-0xb0]
    1116:	mov    rdi,r15
    1119:	mov    r9,QWORD PTR [rbp-0x278]
    1120:	shld   r15,r9,0xd
    1125:	shr    rdi,0x33
    1129:	add    rsi,QWORD PTR [rbp-0x138]
    1130:	adc    r12,QWORD PTR [rbp-0xf8]
    1137:	add    rsi,QWORD PTR [rbp-0x120]
    113e:	adc    r12,QWORD PTR [rbp-0x128]
    1145:	add    rsi,QWORD PTR [rbp-0x100]
    114c:	adc    r12,QWORD PTR [rbp-0xd0]
    1153:	add    rsi,r15
    1156:	adc    r12,rdi
    1159:	mov    rdi,r12
    115c:	shld   r12,rsi,0xd
    1161:	shr    rdi,0x33
    1165:	mov    r8,QWORD PTR [rbp-0xc8]
    116c:	add    r8,QWORD PTR [rbp-0x168]
    1173:	adc    r13,QWORD PTR [rbp-0x160]
    117a:	add    r8,QWORD PTR [rbp-0x1c0]
    1181:	adc    r13,QWORD PTR [rbp-0x148]
    1188:	add    r8,r12
    118b:	adc    r13,rdi
    118e:	mov    rdi,r13
    1191:	shld   r13,r8,0xd
    1196:	shr    rdi,0x33
    119a:	mov    r10,QWORD PTR [rbp-0x90]
    11a1:	add    r10,QWORD PTR [rbp-0x1b0]
    11a8:	adc    rcx,QWORD PTR [rbp-0x1b8]
    11af:	add    r10,QWORD PTR [rbp-0x170]
    11b6:	adc    rcx,QWORD PTR [rbp-0x130]
    11bd:	add    r10,QWORD PTR [rbp-0x260]
    11c4:	adc    rcx,QWORD PTR [rbp-0x268]
    11cb:	add    r10,QWORD PTR [rbp-0x258]
    11d2:	adc    rcx,QWORD PTR [rbp-0xe0]
    11d9:	add    r10,r13
    11dc:	adc    rcx,rdi
    11df:	mov    rdi,rcx
    11e2:	shld   rcx,r10,0xd
    11e7:	shr    rdi,0x33
    11eb:	add    r11,QWORD PTR [rbp-0x80]
    11ef:	adc    r14,rbx
    11f2:	add    r11,QWORD PTR [rbp-0x68]
    11f6:	adc    r14,QWORD PTR [rbp-0x60]
    11fa:	add    r11,QWORD PTR [rbp-0xc0]
    1201:	adc    r14,QWORD PTR [rbp-0x88]
    1208:	add    r11,rax
    120b:	adc    r14,rdx
    120e:	add    r11,rcx
    1211:	adc    r14,rdi
    1214:	mov    rax,r14
    1217:	shr    r14,0x33
    121b:	lea    rcx,[r14+r14*8]
    121f:	lea    rcx,[r14+rcx*2]
    1223:	movabs rdi,0x7ffffffffffff
    122d:	and    r9,rdi
    1230:	shld   rax,r11,0xd
    1235:	mov    edx,0x13
    123a:	mul    rdx
    123d:	add    rax,r9
    1240:	adc    rdx,rcx
    1243:	and    rsi,rdi
    1246:	shld   rdx,rax,0xd
    124b:	add    rdx,rsi
    124e:	mov    r9,rdx
    1251:	mov    QWORD PTR [rbp-0x80],rdx
    1255:	and    rax,rdi
    1258:	mov    rsi,rax
    125b:	mov    QWORD PTR [rbp-0x60],rax
    125f:	mov    rcx,r8
    1262:	and    rcx,rdi
    1265:	mov    QWORD PTR [rbp-0xc8],rcx
    126c:	and    r10,rdi
    126f:	mov    QWORD PTR [rbp-0x90],r10
    1276:	and    r11,rdi
    1279:	mov    rbx,r11
    127c:	mov    QWORD PTR [rbp-0x120],r11
    1283:	mov    rax,QWORD PTR [rbp-0x110]
    128a:	lea    r11,[r10+rax*1]
    128e:	lea    rax,[r11+r11*8]
    1292:	lea    r8,[r11+rax*2]
    1296:	mov    rax,QWORD PTR [rbp-0xa0]
    129d:	add    rax,rsi
    12a0:	mov    QWORD PTR [rbp-0x68],rax
    12a4:	mul    rax
    12a7:	mov    r15,rax
    12aa:	mov    r14,rdx
    12ad:	mov    rax,QWORD PTR [rbp-0x78]
    12b1:	lea    rdx,[rbx+rax*1]
    12b5:	mov    QWORD PTR [rbp-0xb0],rdx
    12bc:	lea    rax,[rdx+rdx*8]
    12c0:	lea    r13,[rdx+rax*2]
    12c4:	mov    rax,QWORD PTR [rbp-0xa8]
    12cb:	lea    rbx,[r9+rax*1]
    12cf:	lea    rax,[rbx+rbx*1]
    12d3:	mov    QWORD PTR [rbp-0x170],rax
    12da:	mul    r13
    12dd:	mov    r9,rax
    12e0:	mov    rdi,rdx
    12e3:	mov    rax,QWORD PTR [rbp-0x98]
    12ea:	lea    r10,[rcx+rax*1]
    12ee:	lea    r12,[r10+r10*1]
    12f2:	mov    rax,r8
    12f5:	mul    r12
    12f8:	mov    rcx,rdx
    12fb:	mov    rsi,rax
    12fe:	add    rsi,r15
    1301:	adc    rcx,r14
    1304:	add    rsi,r9
    1307:	adc    rcx,rdi
    130a:	mov    rax,QWORD PTR [rbp-0x68]
    130e:	lea    r15,[rax+rax*1]
    1312:	mov    rax,r15
    1315:	mul    rbx
    1318:	mov    QWORD PTR [rbp-0x68],rdx
    131c:	mov    QWORD PTR [rbp-0xe0],rax
    1323:	mov    rax,r8
    1326:	mul    r11
    1329:	mov    QWORD PTR [rbp-0xf8],rdx
    1330:	mov    QWORD PTR [rbp-0x1a0],rax
    1337:	mov    rax,r13
    133a:	mul    r12
    133d:	mov    r8,rdx
    1340:	mov    r9,rax
    1343:	mov    rax,r15
    1346:	mul    r10
    1349:	mov    QWORD PTR [rbp-0x88],rdx
    1350:	mov    QWORD PTR [rbp-0x1c8],rax
    1357:	mov    rax,rbx
    135a:	mul    rbx
    135d:	mov    QWORD PTR [rbp-0x198],rax
    1364:	mov    QWORD PTR [rbp-0x1a8],rdx
    136b:	lea    rdx,[r11+r11*1]
    136f:	mov    rax,r13
    1372:	mul    rdx
    1375:	mov    rbx,rdx
    1378:	mov    QWORD PTR [rbp-0xc0],rax
    137f:	mov    rax,r15
    1382:	mul    r11
    1385:	mov    QWORD PTR [rbp-0x100],rdx
    138c:	mov    QWORD PTR [rbp-0x130],rax
    1393:	mov    rdi,QWORD PTR [rbp-0x170]
    139a:	mov    rax,rdi
    139d:	mul    r10
    13a0:	mov    QWORD PTR [rbp-0x138],rdx
    13a7:	mov    QWORD PTR [rbp-0x128],rax
    13ae:	mov    rax,r13
    13b1:	mov    r14,QWORD PTR [rbp-0xb0]
    13b8:	mul    r14
    13bb:	mov    r13,rdx
    13be:	mov    QWORD PTR [rbp-0xd0],rax
    13c5:	mov    rax,r15
    13c8:	mul    r14
    13cb:	mov    r14,rdx
    13ce:	mov    QWORD PTR [rbp-0xb0],rax
    13d5:	mov    rax,rdi
    13d8:	mul    r11
    13db:	mov    r15,rdx
    13de:	mov    r12,rax
    13e1:	mov    rax,r10
    13e4:	mul    r10
    13e7:	mov    rdi,rcx
    13ea:	shld   rcx,rsi,0xd
    13ef:	shr    rdi,0x33
    13f3:	add    r9,QWORD PTR [rbp-0x1a0]
    13fa:	adc    r8,QWORD PTR [rbp-0xf8]
    1401:	add    r9,QWORD PTR [rbp-0xe0]
    1408:	adc    r8,QWORD PTR [rbp-0x68]
    140c:	add    r9,rcx
    140f:	adc    r8,rdi
    1412:	mov    rcx,r8
    1415:	shld   r8,r9,0xd
    141a:	shr    rcx,0x33
    141e:	mov    rdi,QWORD PTR [rbp-0xc0]
    1425:	add    rdi,QWORD PTR [rbp-0x198]
    142c:	adc    rbx,QWORD PTR [rbp-0x1a8]
    1433:	add    rdi,QWORD PTR [rbp-0x1c8]
    143a:	adc    rbx,QWORD PTR [rbp-0x88]
    1441:	add    rdi,r8
    1444:	adc    rbx,rcx
    1447:	mov    rcx,rbx
    144a:	shld   rbx,rdi,0xd
    144f:	mov    r8,rdi
    1452:	shr    rcx,0x33
    1456:	mov    rdi,QWORD PTR [rbp-0xd0]
    145d:	add    rdi,QWORD PTR [rbp-0x130]
    1464:	adc    r13,QWORD PTR [rbp-0x100]
    146b:	add    rdi,QWORD PTR [rbp-0x128]
    1472:	adc    r13,QWORD PTR [rbp-0x138]
    1479:	add    rdi,rbx
    147c:	adc    r13,rcx
    147f:	mov    rcx,r13
    1482:	shr    rcx,0x33
    1486:	shld   r13,rdi,0xd
    148b:	mov    rbx,rax
    148e:	add    rbx,QWORD PTR [rbp-0xb0]
    1495:	adc    rdx,r14
    1498:	add    rbx,r12
    149b:	adc    rdx,r15
    149e:	add    rbx,r13
    14a1:	adc    rdx,rcx
    14a4:	mov    rax,rdx
    14a7:	shld   rax,rbx,0xd
    14ac:	shr    rdx,0x33
    14b0:	lea    rcx,[rdx+rdx*8]
    14b4:	lea    rcx,[rdx+rcx*2]
    14b8:	mov    edx,0x13
    14bd:	mul    rdx
    14c0:	movabs r12,0x7ffffffffffff
    14ca:	and    rsi,r12
    14cd:	add    rax,rsi
    14d0:	adc    rdx,rcx
    14d3:	shld   rdx,rax,0xd
    14d8:	and    r9,r12
    14db:	add    rdx,r9
    14de:	mov    QWORD PTR [rbp-0x1c8],rdx
    14e5:	movabs rdx,0xffffffffffffe
    14ef:	mov    rcx,QWORD PTR [rbp-0xa0]
    14f6:	lea    rcx,[rcx+rdx*1-0x24]
    14fb:	sub    rcx,QWORD PTR [rbp-0x60]
    14ff:	mov    r15,QWORD PTR [rbp-0xa8]
    1506:	add    r15,rdx
    1509:	sub    r15,QWORD PTR [rbp-0x80]
    150d:	mov    r13,QWORD PTR [rbp-0x98]
    1514:	add    r13,rdx
    1517:	sub    r13,QWORD PTR [rbp-0xc8]
    151e:	mov    rsi,QWORD PTR [rbp-0x110]
    1525:	add    rsi,rdx
    1528:	sub    rsi,QWORD PTR [rbp-0x90]
    152f:	mov    r9,QWORD PTR [rbp-0x78]
    1533:	add    r9,rdx
    1536:	sub    r9,QWORD PTR [rbp-0x120]
    153d:	and    rax,r12
    1540:	mov    QWORD PTR [rbp-0xc8],rax
    1547:	and    r8,r12
    154a:	mov    QWORD PTR [rbp-0xc0],r8
    1551:	and    rdi,r12
    1554:	mov    QWORD PTR [rbp-0xd0],rdi
    155b:	and    rbx,r12
    155e:	mov    QWORD PTR [rbp-0x110],rbx
    1565:	mov    rax,rcx
    1568:	mul    rcx
    156b:	mov    r12,rax
    156e:	mov    r11,rdx
    1571:	mov    QWORD PTR [rbp-0x78],r9
    1575:	lea    rax,[r9+r9*8]
    1579:	lea    r9,[r9+rax*2]
    157d:	lea    rax,[r15+r15*1]
    1581:	mov    QWORD PTR [rbp-0xa8],rax
    1588:	mul    r9
    158b:	mov    r8,rax
    158e:	mov    rbx,rdx
    1591:	mov    rdi,rsi
    1594:	lea    rax,[rsi+rsi*8]
    1598:	lea    r14,[rsi+rax*2]
    159c:	lea    rdx,[r13+r13*1+0x0]
    15a1:	mov    rax,r14
    15a4:	mul    rdx
    15a7:	mov    r10,rax
    15aa:	add    r10,r12
    15ad:	adc    r11,rdx
    15b0:	add    r10,r8
    15b3:	adc    r11,rbx
    15b6:	lea    rsi,[rcx+rcx*1]
    15ba:	mov    rax,rsi
    15bd:	mul    r15
    15c0:	mov    QWORD PTR [rbp-0x80],rdx
    15c4:	mov    QWORD PTR [rbp-0x88],rax
    15cb:	mov    rax,r14
    15ce:	mul    rdi
    15d1:	mov    QWORD PTR [rbp-0xe0],rdx
    15d8:	mov    QWORD PTR [rbp-0xf8],rax
    15df:	mov    rax,r9
    15e2:	lea    rcx,[r13+r13*1+0x0]
    15e7:	mul    rcx
    15ea:	mov    r8,rdx
    15ed:	mov    r14,rax
    15f0:	mov    rax,rsi
    15f3:	mul    r13
    15f6:	mov    QWORD PTR [rbp-0x68],rdx
    15fa:	mov    QWORD PTR [rbp-0x98],rax
    1601:	mov    rax,r15
    1604:	mul    r15
    1607:	mov    QWORD PTR [rbp-0x128],rax
    160e:	mov    QWORD PTR [rbp-0x138],rdx
    1615:	lea    rcx,[rdi+rdi*1]
    1619:	mov    rax,r9
    161c:	mul    rcx
    161f:	mov    rbx,rdx
    1622:	mov    QWORD PTR [rbp-0x60],rax
    1626:	mov    rax,rsi
    1629:	mul    rdi
    162c:	mov    QWORD PTR [rbp-0x90],rdx
    1633:	mov    QWORD PTR [rbp-0xa0],rax
    163a:	mov    rcx,QWORD PTR [rbp-0xa8]
    1641:	mov    rax,rcx
    1644:	mul    r13
    1647:	mov    QWORD PTR [rbp-0xb0],rdx
    164e:	mov    QWORD PTR [rbp-0x130],rax
    1655:	mov    rax,r9
    1658:	mov    r12,QWORD PTR [rbp-0x78]
    165c:	mul    r12
    165f:	mov    r15,rdx
    1662:	mov    r9,rax
    1665:	mov    rax,rsi
    1668:	mul    r12
    166b:	mov    QWORD PTR [rbp-0x78],rdx
    166f:	mov    QWORD PTR [rbp-0x100],rax
    1676:	mov    rax,rcx
    1679:	mul    rdi
    167c:	mov    QWORD PTR [rbp-0xa8],rdx
    1683:	mov    r12,rax
    1686:	mov    rax,r13
    1689:	mul    r13
    168c:	mov    rsi,r11
    168f:	shld   r11,r10,0xd
    1694:	shr    rsi,0x33
    1698:	add    r14,QWORD PTR [rbp-0xf8]
    169f:	adc    r8,QWORD PTR [rbp-0xe0]
    16a6:	add    r14,QWORD PTR [rbp-0x88]
    16ad:	adc    r8,QWORD PTR [rbp-0x80]
    16b1:	add    r14,r11
    16b4:	adc    r8,rsi
    16b7:	mov    rsi,r8
    16ba:	shld   r8,r14,0xd
    16bf:	shr    rsi,0x33
    16c3:	mov    rdi,QWORD PTR [rbp-0x60]
    16c7:	add    rdi,QWORD PTR [rbp-0x128]
    16ce:	adc    rbx,QWORD PTR [rbp-0x138]
    16d5:	add    rdi,QWORD PTR [rbp-0x98]
    16dc:	adc    rbx,QWORD PTR [rbp-0x68]
    16e0:	add    rdi,r8
    16e3:	adc    rbx,rsi
    16e6:	mov    rsi,rbx
    16e9:	shld   rbx,rdi,0xd
    16ee:	mov    r8,rdi
    16f1:	shr    rsi,0x33
    16f5:	add    r9,QWORD PTR [rbp-0xa0]
    16fc:	adc    r15,QWORD PTR [rbp-0x90]
    1703:	add    r9,QWORD PTR [rbp-0x130]
    170a:	adc    r15,QWORD PTR [rbp-0xb0]
    1711:	add    r9,rbx
    1714:	adc    r15,rsi
    1717:	mov    rsi,r15
    171a:	shr    rsi,0x33
    171e:	shld   r15,r9,0xd
    1723:	mov    rcx,r9
    1726:	add    rax,QWORD PTR [rbp-0x100]
    172d:	adc    rdx,QWORD PTR [rbp-0x78]
    1731:	add    rax,r12
    1734:	adc    rdx,QWORD PTR [rbp-0xa8]
    173b:	add    rax,r15
    173e:	mov    r9,rax
    1741:	adc    rdx,rsi
    1744:	mov    rax,rdx
    1747:	shr    rdx,0x33
    174b:	lea    rdi,[rdx+rdx*8]
    174f:	lea    r11,[rdx+rdi*2]
    1753:	movabs rdi,0x7ffffffffffff
    175d:	and    r10,rdi
    1760:	shld   rax,r9,0xd
    1765:	mov    edx,0x13
    176a:	mul    rdx
    176d:	add    rax,r10
    1770:	adc    r11,rdx
    1773:	mov    rdx,rdi
    1776:	and    r14,rdi
    1779:	shld   r11,rax,0xd
    177e:	add    r11,r14
    1781:	and    r8,rdi
    1784:	mov    QWORD PTR [rbp-0x60],r8
    1788:	and    rcx,rdi
    178b:	and    r9,rdi
    178e:	mov    QWORD PTR [rbp-0x90],r9
    1795:	lea    rsi,[r11+r11*8]
    1799:	lea    rsi,[r11+rsi*2]
    179d:	mov    QWORD PTR [rbp-0xb0],rsi
    17a4:	lea    rsi,[r8+r8*8]
    17a8:	lea    rsi,[r8+rsi*2]
    17ac:	mov    QWORD PTR [rbp-0x78],rsi
    17b0:	lea    rdi,[r9+r9*8]
    17b4:	lea    r8,[r9+rdi*2]
    17b8:	mov    QWORD PTR [rbp-0x68],r8
    17bc:	and    rax,rdx
    17bf:	mov    rbx,rax
    17c2:	mul    QWORD PTR [rbp-0x290]
    17c9:	mov    QWORD PTR [rbp-0x88],rdx
    17d0:	mov    QWORD PTR [rbp-0x98],rax
    17d7:	mov    rax,r8
    17da:	mul    QWORD PTR [rbp-0x288]
    17e1:	mov    r15,rax
    17e4:	mov    r12,rdx
    17e7:	mov    QWORD PTR [rbp-0x80],rcx
    17eb:	lea    rax,[rcx+rcx*8]
    17ef:	lea    r9,[rcx+rax*2]
    17f3:	mov    rax,r9
    17f6:	mov    QWORD PTR [rbp-0x148],r9
    17fd:	mul    QWORD PTR [rbp-0x2e8]
    1804:	mov    r13,rdx
    1807:	mov    rdi,rax
    180a:	mov    rax,rsi
    180d:	mov    r8,QWORD PTR [rbp-0x2e0]
    1814:	mul    r8
    1817:	mov    r14,rdx
    181a:	mov    r10,rax
    181d:	mov    rax,QWORD PTR [rbp-0xb0]
    1824:	mul    QWORD PTR [rbp-0x280]
    182b:	add    r10,rdi
    182e:	adc    r14,r13
    1831:	add    r10,r15
    1834:	adc    r14,r12
    1837:	add    r10,QWORD PTR [rbp-0x98]
    183e:	adc    r14,QWORD PTR [rbp-0x88]
    1845:	add    r10,rax
    1848:	mov    QWORD PTR [rbp-0xa8],r10
    184f:	adc    r14,rdx
    1852:	mov    rax,r11
    1855:	mov    r15,QWORD PTR [rbp-0x290]
    185c:	mul    r15
    185f:	mov    QWORD PTR [rbp-0x88],rdx
    1866:	mov    QWORD PTR [rbp-0x98],rax
    186d:	mov    rax,rbx
    1870:	mov    r12,rbx
    1873:	mov    QWORD PTR [rbp-0x258],rbx
    187a:	mov    rbx,QWORD PTR [rbp-0x288]
    1881:	mul    rbx
    1884:	mov    QWORD PTR [rbp-0xe0],rdx
    188b:	mov    QWORD PTR [rbp-0x138],rax
    1892:	mov    rsi,QWORD PTR [rbp-0x68]
    1896:	mov    rax,rsi
    1899:	mov    rcx,QWORD PTR [rbp-0x2e8]
    18a0:	mul    rcx
    18a3:	mov    QWORD PTR [rbp-0x100],rdx
    18aa:	mov    QWORD PTR [rbp-0xf8],rax
    18b1:	mov    rax,r9
    18b4:	mul    r8
    18b7:	mov    QWORD PTR [rbp-0x120],rdx
    18be:	mov    QWORD PTR [rbp-0x168],rax
    18c5:	mov    rax,QWORD PTR [rbp-0x78]
    18c9:	mov    r10,QWORD PTR [rbp-0x280]
    18d0:	mul    r10
    18d3:	mov    r8,rdx
    18d6:	mov    r9,rax
    18d9:	mov    rdi,QWORD PTR [rbp-0x60]
    18dd:	mov    rax,rdi
    18e0:	mul    r15
    18e3:	mov    QWORD PTR [rbp-0x130],rdx
    18ea:	mov    QWORD PTR [rbp-0x128],rax
    18f1:	mov    rax,r11
    18f4:	mul    rbx
    18f7:	mov    QWORD PTR [rbp-0xb0],rdx
    18fe:	mov    QWORD PTR [rbp-0xa0],rax
    1905:	mov    rax,r12
    1908:	mul    rcx
    190b:	mov    QWORD PTR [rbp-0x1a8],rdx
    1912:	mov    QWORD PTR [rbp-0x198],rax
    1919:	mov    rax,rsi
    191c:	mov    rsi,QWORD PTR [rbp-0x2e0]
    1923:	mul    rsi
    1926:	mov    QWORD PTR [rbp-0x1a0],rdx
    192d:	mov    QWORD PTR [rbp-0x170],rax
    1934:	mov    rax,QWORD PTR [rbp-0x148]
    193b:	mul    r10
    193e:	mov    r12,rdx
    1941:	mov    QWORD PTR [rbp-0x78],rax
    1945:	mov    rax,QWORD PTR [rbp-0x80]
    1949:	mul    r15
    194c:	mov    r15,rdx
    194f:	mov    r13,rax
    1952:	mov    rax,rdi
    1955:	mul    rbx
    1958:	add    rax,r13
    195b:	mov    QWORD PTR [rbp-0x1c0],rax
    1962:	adc    rdx,r15
    1965:	mov    QWORD PTR [rbp-0x1b8],rdx
    196c:	mov    rax,r11
    196f:	mul    rcx
    1972:	mov    QWORD PTR [rbp-0x148],rdx
    1979:	mov    QWORD PTR [rbp-0x160],rax
    1980:	mov    r15,QWORD PTR [rbp-0x258]
    1987:	mov    rax,r15
    198a:	mov    r10,rsi
    198d:	mul    rsi
    1990:	mov    r13,rdx
    1993:	mov    rdi,rax
    1996:	mov    rax,QWORD PTR [rbp-0x68]
    199a:	mov    rbx,QWORD PTR [rbp-0x280]
    19a1:	mul    rbx
    19a4:	mov    QWORD PTR [rbp-0x268],rdx
    19ab:	mov    QWORD PTR [rbp-0x260],rax
    19b2:	mov    rax,QWORD PTR [rbp-0x90]
    19b9:	mul    QWORD PTR [rbp-0x290]
    19c0:	mov    QWORD PTR [rbp-0x68],rdx
    19c4:	mov    QWORD PTR [rbp-0x90],rax
    19cb:	mov    rax,QWORD PTR [rbp-0x80]
    19cf:	mul    QWORD PTR [rbp-0x288]
    19d6:	mov    QWORD PTR [rbp-0x80],rdx
    19da:	mov    QWORD PTR [rbp-0x1b0],rax
    19e1:	mov    rax,QWORD PTR [rbp-0x60]
    19e5:	mul    rcx
    19e8:	mov    rcx,rdx
    19eb:	mov    rsi,rax
    19ee:	mov    rax,r11
    19f1:	mul    r10
    19f4:	mov    QWORD PTR [rbp-0x60],rdx
    19f8:	mov    r11,rax
    19fb:	mov    rax,r15
    19fe:	mul    rbx
    1a01:	mov    rbx,r14
    1a04:	mov    r10,QWORD PTR [rbp-0xa8]
    1a0b:	shld   r14,r10,0xd
    1a10:	shr    rbx,0x33
    1a14:	add    r9,QWORD PTR [rbp-0x168]
    1a1b:	adc    r8,QWORD PTR [rbp-0x120]
    1a22:	add    r9,QWORD PTR [rbp-0x138]
    1a29:	adc    r8,QWORD PTR [rbp-0xe0]
    1a30:	add    r9,QWORD PTR [rbp-0xf8]
    1a37:	adc    r8,QWORD PTR [rbp-0x100]
    1a3e:	add    r9,QWORD PTR [rbp-0x98]
    1a45:	adc    r8,QWORD PTR [rbp-0x88]
    1a4c:	add    r9,r14
    1a4f:	adc    r8,rbx
    1a52:	mov    rbx,r8
    1a55:	shld   r8,r9,0xd
    1a5a:	shr    rbx,0x33
    1a5e:	mov    r14,QWORD PTR [rbp-0x78]
    1a62:	add    r14,QWORD PTR [rbp-0x128]
    1a69:	adc    r12,QWORD PTR [rbp-0x130]
    1a70:	add    r14,QWORD PTR [rbp-0x198]
    1a77:	adc    r12,QWORD PTR [rbp-0x1a8]
    1a7e:	add    r14,QWORD PTR [rbp-0x170]
    1a85:	adc    r12,QWORD PTR [rbp-0x1a0]
    1a8c:	add    r14,QWORD PTR [rbp-0xa0]
    1a93:	adc    r12,QWORD PTR [rbp-0xb0]
    1a9a:	add    r14,r8
    1a9d:	adc    r12,rbx
    1aa0:	mov    r8,r12
    1aa3:	shld   r12,r14,0xd
    1aa8:	shr    r8,0x33
    1aac:	add    rdi,QWORD PTR [rbp-0x1c0]
    1ab3:	adc    r13,QWORD PTR [rbp-0x1b8]
    1aba:	add    rdi,QWORD PTR [rbp-0x260]
    1ac1:	adc    r13,QWORD PTR [rbp-0x268]
    1ac8:	add    rdi,QWORD PTR [rbp-0x160]
    1acf:	adc    r13,QWORD PTR [rbp-0x148]
    1ad6:	add    rdi,r12
    1ad9:	adc    r13,r8
    1adc:	mov    r8,r13
    1adf:	shld   r13,rdi,0xd
    1ae4:	shr    r8,0x33
    1ae8:	add    rsi,QWORD PTR [rbp-0x1b0]
    1aef:	adc    rcx,QWORD PTR [rbp-0x80]
    1af3:	add    rsi,QWORD PTR [rbp-0x90]
    1afa:	adc    rcx,QWORD PTR [rbp-0x68]
    1afe:	add    rsi,rax
    1b01:	adc    rcx,rdx
    1b04:	add    rsi,r11
    1b07:	adc    rcx,QWORD PTR [rbp-0x60]
    1b0b:	add    rsi,r13
    1b0e:	adc    rcx,r8
    1b11:	mov    rax,rcx
    1b14:	shld   rax,rsi,0xd
    1b19:	shr    rcx,0x33
    1b1d:	lea    rdx,[rcx+rcx*8]
    1b21:	lea    rcx,[rcx+rdx*2]
    1b25:	mov    edx,0x13
    1b2a:	mul    rdx
    1b2d:	movabs r8,0x7ffffffffffff
    1b37:	and    r10,r8
    1b3a:	add    rax,r10
    1b3d:	adc    rdx,rcx
    1b40:	shld   rdx,rax,0xd
    1b45:	and    r9,r8
    1b48:	add    rdx,r9
    1b4b:	mov    QWORD PTR [rbp-0xb0],rdx
    1b52:	and    rax,r8
    1b55:	mov    QWORD PTR [rbp-0xe0],rax
    1b5c:	and    r14,r8
    1b5f:	mov    QWORD PTR [rbp-0x78],r14
    1b63:	and    rdi,r8
    1b66:	mov    QWORD PTR [rbp-0x90],rdi
    1b6d:	mov    rcx,QWORD PTR [rbp-0xb8]
    1b74:	lea    rax,[rcx+rcx*8]
    1b78:	lea    r12,[rcx+rax*2]
    1b7c:	mov    rcx,QWORD PTR [rbp-0x1d0]
    1b83:	lea    rax,[rcx+rcx*8]
    1b87:	lea    r8,[rcx+rax*2]
    1b8b:	mov    QWORD PTR [rbp-0xa0],r8
    1b92:	mov    rcx,QWORD PTR [rbp-0x270]
    1b99:	lea    rax,[rcx+rcx*8]
    1b9d:	lea    rcx,[rcx+rax*2]
    1ba1:	mov    QWORD PTR [rbp-0x80],rcx
    1ba5:	mov    r10,QWORD PTR [rbp-0x178]
    1bac:	mov    rax,r10
    1baf:	mov    r13,QWORD PTR [rbp-0x180]
    1bb6:	mul    r13
    1bb9:	mov    QWORD PTR [rbp-0x68],rdx
    1bbd:	mov    QWORD PTR [rbp-0x88],rax
    1bc4:	mov    rdi,QWORD PTR [rbp-0x188]
    1bcb:	mov    rax,rdi
    1bce:	mul    rcx
    1bd1:	mov    QWORD PTR [rbp-0x100],rax
    1bd8:	mov    QWORD PTR [rbp-0xa8],rdx
    1bdf:	mov    rcx,QWORD PTR [rbp-0x150]
    1be6:	lea    rax,[rcx+rcx*8]
    1bea:	lea    rcx,[rcx+rax*2]
    1bee:	mov    QWORD PTR [rbp-0x60],rcx
    1bf2:	mov    r14,QWORD PTR [rbp-0xd8]
    1bf9:	mov    rax,r14
    1bfc:	mul    rcx
    1bff:	mov    r11,rdx
    1c02:	mov    rbx,rax
    1c05:	mov    r9,QWORD PTR [rbp-0xe8]
    1c0c:	mov    rax,r9
    1c0f:	mul    r8
    1c12:	mov    rcx,rdx
    1c15:	mov    r15,rax
    1c18:	mov    r8,QWORD PTR [rbp-0xf0]
    1c1f:	mov    rax,r8
    1c22:	mul    r12
    1c25:	movabs r12,0x7ffffffffffff
    1c2f:	and    rsi,r12
    1c32:	mov    QWORD PTR [rbp-0x98],rsi
    1c39:	add    r15,rbx
    1c3c:	adc    rcx,r11
    1c3f:	add    r15,QWORD PTR [rbp-0x88]
    1c46:	adc    rcx,QWORD PTR [rbp-0x68]
    1c4a:	add    r15,QWORD PTR [rbp-0x100]
    1c51:	adc    rcx,QWORD PTR [rbp-0xa8]
    1c58:	add    r15,rax
    1c5b:	mov    QWORD PTR [rbp-0x100],r15
    1c62:	adc    rcx,rdx
    1c65:	mov    r12,r13
    1c68:	mov    rax,r13
    1c6b:	mov    r15,QWORD PTR [rbp-0xb8]
    1c72:	mul    r15
    1c75:	mov    QWORD PTR [rbp-0x68],rdx
    1c79:	mov    QWORD PTR [rbp-0x88],rax
    1c80:	mov    rax,r10
    1c83:	mov    r13,rdi
    1c86:	mul    rdi
    1c89:	mov    QWORD PTR [rbp-0xa8],rdx
    1c90:	mov    QWORD PTR [rbp-0x138],rax
    1c97:	mov    rsi,r14
    1c9a:	mov    rax,r14
    1c9d:	mov    rbx,QWORD PTR [rbp-0x80]
    1ca1:	mul    rbx
    1ca4:	mov    QWORD PTR [rbp-0x128],rdx
    1cab:	mov    QWORD PTR [rbp-0x170],rax
    1cb2:	mov    rax,r9
    1cb5:	mul    QWORD PTR [rbp-0x60]
    1cb9:	mov    QWORD PTR [rbp-0x268],rdx
    1cc0:	mov    QWORD PTR [rbp-0x258],rax
    1cc7:	mov    rax,r8
    1cca:	mul    QWORD PTR [rbp-0xa0]
    1cd1:	mov    r8,rdx
    1cd4:	mov    r14,rax
    1cd7:	mov    rax,r12
    1cda:	mov    r10,QWORD PTR [rbp-0x1d0]
    1ce1:	mul    r10
    1ce4:	mov    QWORD PTR [rbp-0xf8],rdx
    1ceb:	mov    QWORD PTR [rbp-0x1a8],rax
    1cf2:	mov    rax,r15
    1cf5:	mul    rdi
    1cf8:	mov    QWORD PTR [rbp-0xa0],rdx
    1cff:	mov    QWORD PTR [rbp-0x130],rax
    1d06:	mov    rdi,QWORD PTR [rbp-0x178]
    1d0d:	mov    rax,rdi
    1d10:	mul    rsi
    1d13:	mov    QWORD PTR [rbp-0x160],rdx
    1d1a:	mov    QWORD PTR [rbp-0x1b8],rax
    1d21:	mov    rax,r9
    1d24:	mov    rsi,r9
    1d27:	mul    rbx
    1d2a:	mov    QWORD PTR [rbp-0x1c0],rdx
    1d31:	mov    QWORD PTR [rbp-0x260],rax
    1d38:	mov    r9,QWORD PTR [rbp-0xf0]
    1d3f:	mov    rax,r9
    1d42:	mul    QWORD PTR [rbp-0x60]
    1d46:	mov    r11,rdx
    1d49:	mov    rbx,rax
    1d4c:	mov    rax,r12
    1d4f:	mov    r15,r12
    1d52:	mul    QWORD PTR [rbp-0x150]
    1d59:	mov    QWORD PTR [rbp-0x1a0],rdx
    1d60:	mov    QWORD PTR [rbp-0x148],rax
    1d67:	mov    rax,r10
    1d6a:	mul    r13
    1d6d:	mov    QWORD PTR [rbp-0x60],rdx
    1d71:	mov    QWORD PTR [rbp-0x120],rax
    1d78:	mov    r12,QWORD PTR [rbp-0xd8]
    1d7f:	mov    rax,r12
    1d82:	mul    QWORD PTR [rbp-0xb8]
    1d89:	mov    QWORD PTR [rbp-0x198],rdx
    1d90:	mov    QWORD PTR [rbp-0x168],rax
    1d97:	mov    rax,rdi
    1d9a:	mul    rsi
    1d9d:	mov    rsi,rdx
    1da0:	mov    r10,rax
    1da3:	mov    rax,r9
    1da6:	mul    QWORD PTR [rbp-0x80]
    1daa:	mov    QWORD PTR [rbp-0x278],rdx
    1db1:	mov    QWORD PTR [rbp-0x2d0],rax
    1db8:	mov    rax,r15
    1dbb:	mul    QWORD PTR [rbp-0x270]
    1dc2:	mov    QWORD PTR [rbp-0x270],rdx
    1dc9:	mov    QWORD PTR [rbp-0x1b0],rax
    1dd0:	mov    rax,QWORD PTR [rbp-0x150]
    1dd7:	mul    r13
    1dda:	mov    r13,rdx
    1ddd:	mov    QWORD PTR [rbp-0x80],rax
    1de1:	mov    rax,QWORD PTR [rbp-0x1d0]
    1de8:	mul    r12
    1deb:	mov    r12,rdx
    1dee:	mov    rdi,rax
    1df1:	mov    rax,QWORD PTR [rbp-0xe8]
    1df8:	mul    QWORD PTR [rbp-0xb8]
    1dff:	mov    QWORD PTR [rbp-0xb8],rdx
    1e06:	mov    QWORD PTR [rbp-0x150],rax
    1e0d:	mov    rax,QWORD PTR [rbp-0x178]
    1e14:	mul    r9
    1e17:	mov    r9,rcx
    1e1a:	mov    r15,QWORD PTR [rbp-0x100]
    1e21:	shld   rcx,r15,0xd
    1e26:	shr    r9,0x33
    1e2a:	add    r14,QWORD PTR [rbp-0x258]
    1e31:	adc    r8,QWORD PTR [rbp-0x268]
    1e38:	add    r14,QWORD PTR [rbp-0x170]
    1e3f:	adc    r8,QWORD PTR [rbp-0x128]
    1e46:	add    r14,QWORD PTR [rbp-0x138]
    1e4d:	adc    r8,QWORD PTR [rbp-0xa8]
    1e54:	add    r14,QWORD PTR [rbp-0x88]
    1e5b:	adc    r8,QWORD PTR [rbp-0x68]
    1e5f:	add    r14,rcx
    1e62:	adc    r8,r9
    1e65:	mov    rcx,r8
    1e68:	shld   r8,r14,0xd
    1e6d:	shr    rcx,0x33
    1e71:	add    rbx,QWORD PTR [rbp-0x1a8]
    1e78:	adc    r11,QWORD PTR [rbp-0xf8]
    1e7f:	add    rbx,QWORD PTR [rbp-0x1b8]
    1e86:	adc    r11,QWORD PTR [rbp-0x160]
    1e8d:	add    rbx,QWORD PTR [rbp-0x260]
    1e94:	adc    r11,QWORD PTR [rbp-0x1c0]
    1e9b:	add    rbx,QWORD PTR [rbp-0x130]
    1ea2:	adc    r11,QWORD PTR [rbp-0xa0]
    1ea9:	add    rbx,r8
    1eac:	adc    r11,rcx
    1eaf:	mov    rcx,r11
    1eb2:	shld   r11,rbx,0xd
    1eb7:	shr    rcx,0x33
    1ebb:	add    r10,QWORD PTR [rbp-0x148]
    1ec2:	adc    rsi,QWORD PTR [rbp-0x1a0]
    1ec9:	add    r10,QWORD PTR [rbp-0x2d0]
    1ed0:	adc    rsi,QWORD PTR [rbp-0x278]
    1ed7:	add    r10,QWORD PTR [rbp-0x120]
    1ede:	adc    rsi,QWORD PTR [rbp-0x60]
    1ee2:	add    r10,QWORD PTR [rbp-0x168]
    1ee9:	adc    rsi,QWORD PTR [rbp-0x198]
    1ef0:	add    r10,r11
    1ef3:	adc    rsi,rcx
    1ef6:	mov    rcx,rsi
    1ef9:	shr    rcx,0x33
    1efd:	shld   rsi,r10,0xd
    1f02:	add    rdi,QWORD PTR [rbp-0x1b0]
    1f09:	adc    r12,QWORD PTR [rbp-0x270]
    1f10:	add    rdi,rax
    1f13:	adc    r12,rdx
    1f16:	add    rdi,QWORD PTR [rbp-0x80]
    1f1a:	adc    r12,r13
    1f1d:	add    rdi,QWORD PTR [rbp-0x150]
    1f24:	adc    r12,QWORD PTR [rbp-0xb8]
    1f2b:	add    rdi,rsi
    1f2e:	adc    r12,rcx
    1f31:	mov    rax,r12
    1f34:	shr    r12,0x33
    1f38:	lea    rcx,[r12+r12*8]
    1f3c:	lea    rcx,[r12+rcx*2]
    1f40:	movabs r13,0x7ffffffffffff
    1f4a:	mov    r8,r15
    1f4d:	and    r8,r13
    1f50:	shld   rax,rdi,0xd
    1f55:	mov    edx,0x13
    1f5a:	mul    rdx
    1f5d:	add    rax,r8
    1f60:	adc    rdx,rcx
    1f63:	and    r14,r13
    1f66:	shld   rdx,rax,0xd
    1f6b:	add    rdx,r14
    1f6e:	mov    QWORD PTR [rbp-0x68],rdx
    1f72:	and    rax,r13
    1f75:	mov    QWORD PTR [rbp-0xb8],rax
    1f7c:	mov    rax,QWORD PTR [rbp-0x140]
    1f83:	mov    r12d,0x1db41
    1f89:	mul    r12
    1f8c:	mov    rcx,rax
    1f8f:	mov    r15,rdx
    1f92:	and    rbx,r13
    1f95:	mov    QWORD PTR [rbp-0x60],rbx
    1f99:	mov    rax,QWORD PTR [rbp-0x158]
    1fa0:	mul    r12
    1fa3:	mov    r11,rdx
    1fa6:	mov    r9,rax
    1fa9:	mov    rax,QWORD PTR [rbp-0x108]
    1fb0:	mul    r12
    1fb3:	mov    r14,rdx
    1fb6:	mov    r8,rax
    1fb9:	mov    rax,QWORD PTR [rbp-0x118]
    1fc0:	mul    r12
    1fc3:	mov    rbx,rax
    1fc6:	mov    rsi,rdx
    1fc9:	and    r10,r13
    1fcc:	mov    QWORD PTR [rbp-0x80],r10
    1fd0:	mov    rax,QWORD PTR [rbp-0x190]
    1fd7:	mul    r12
    1fda:	shld   r15,rcx,0xd
    1fdf:	and    rdi,r13
    1fe2:	mov    r10,r13
    1fe5:	mov    QWORD PTR [rbp-0x88],rdi
    1fec:	add    r15,r9
    1fef:	adc    r11,0x0
    1ff3:	shld   r11,r15,0xd
    1ff8:	add    r11,r8
    1ffb:	adc    r14,0x0
    1fff:	shld   r14,r11,0xd
    2004:	add    r14,rbx
    2007:	adc    rsi,0x0
    200b:	shld   rsi,r14,0xd
    2010:	and    rcx,r13
    2013:	add    rax,rsi
    2016:	adc    edx,0x0
    2019:	mov    rsi,rax
    201c:	shr    rsi,0x33
    2020:	shl    edx,0xd
    2023:	or     rdx,rsi
    2026:	lea    rsi,[rdx+rdx*8]
    202a:	lea    r13,[rdx+rsi*2]
    202e:	add    r13,rcx
    2031:	mov    rdx,r13
    2034:	and    r13,r10
    2037:	add    r13,QWORD PTR [rbp-0x180]
    203e:	and    r15,r10
    2041:	add    r15,QWORD PTR [rbp-0x188]
    2048:	shr    rdx,0x33
    204c:	add    r15,rdx
    204f:	and    r11,r10
    2052:	add    r11,QWORD PTR [rbp-0xd8]
    2059:	and    r14,r10
    205c:	add    r14,QWORD PTR [rbp-0xe8]
    2063:	mov    rdx,rax
    2066:	and    rdx,r10
    2069:	add    rdx,QWORD PTR [rbp-0xf0]
    2070:	mov    QWORD PTR [rbp-0xd8],rdx
    2077:	lea    rax,[r15+r15*8]
    207b:	lea    rbx,[r15+rax*2]
    207f:	lea    rax,[r11+r11*8]
    2083:	lea    r9,[r11+rax*2]
    2087:	mov    QWORD PTR [rbp-0x178],r9
    208e:	lea    rax,[rdx+rdx*8]
    2092:	lea    rsi,[rdx+rax*2]
    2096:	mov    QWORD PTR [rbp-0xe8],rsi
    209d:	mov    rax,r13
    20a0:	mov    rcx,QWORD PTR [rbp-0x140]
    20a7:	mul    rcx
    20aa:	mov    QWORD PTR [rbp-0x188],rdx
    20b1:	mov    QWORD PTR [rbp-0x180],rax
    20b8:	mov    rax,rsi
    20bb:	mov    r10,QWORD PTR [rbp-0x158]
    20c2:	mul    r10
    20c5:	mov    QWORD PTR [rbp-0x1d0],rax
    20cc:	mov    QWORD PTR [rbp-0x150],rdx
    20d3:	lea    rax,[r14+r14*8]
    20d7:	lea    rax,[r14+rax*2]
    20db:	mov    QWORD PTR [rbp-0xf0],rax
    20e2:	mul    QWORD PTR [rbp-0x108]
    20e9:	mov    rdi,rdx
    20ec:	mov    r8,rax
    20ef:	mov    rax,r9
    20f2:	mov    rsi,QWORD PTR [rbp-0x118]
    20f9:	mul    rsi
    20fc:	mov    r12,rdx
    20ff:	mov    r9,rax
    2102:	mov    rax,rbx
    2105:	mov    rbx,QWORD PTR [rbp-0x190]
    210c:	mul    rbx
    210f:	add    r9,r8
    2112:	adc    r12,rdi
    2115:	add    r9,QWORD PTR [rbp-0x1d0]
    211c:	adc    r12,QWORD PTR [rbp-0x150]
    2123:	add    r9,QWORD PTR [rbp-0x180]
    212a:	adc    r12,QWORD PTR [rbp-0x188]
    2131:	add    r9,rax
    2134:	mov    QWORD PTR [rbp-0x1d0],r9
    213b:	adc    r12,rdx
    213e:	mov    rax,r15
    2141:	mul    rcx
    2144:	mov    QWORD PTR [rbp-0x188],rdx
    214b:	mov    QWORD PTR [rbp-0x180],rax
    2152:	mov    rax,r13
    2155:	mul    r10
    2158:	mov    QWORD PTR [rbp-0x150],rdx
    215f:	mov    QWORD PTR [rbp-0xa8],rax
    2166:	mov    r9,QWORD PTR [rbp-0xe8]
    216d:	mov    rax,r9
    2170:	mov    r8,QWORD PTR [rbp-0x108]
    2177:	mul    r8
    217a:	mov    QWORD PTR [rbp-0x100],rdx
    2181:	mov    QWORD PTR [rbp-0x128],rax
    2188:	mov    rax,QWORD PTR [rbp-0xf0]
    218f:	mov    rdi,rsi
    2192:	mul    rsi
    2195:	mov    QWORD PTR [rbp-0x120],rdx
    219c:	mov    QWORD PTR [rbp-0x168],rax
    21a3:	mov    rax,QWORD PTR [rbp-0x178]
    21aa:	mul    rbx
    21ad:	mov    rsi,rdx
    21b0:	mov    rbx,rax
    21b3:	mov    rax,r11
    21b6:	mul    rcx
    21b9:	mov    QWORD PTR [rbp-0x270],rdx
    21c0:	mov    QWORD PTR [rbp-0x138],rax
    21c7:	mov    rax,r15
    21ca:	mul    r10
    21cd:	mov    QWORD PTR [rbp-0x178],rdx
    21d4:	mov    QWORD PTR [rbp-0xa0],rax
    21db:	mov    rax,r13
    21de:	mul    r8
    21e1:	mov    QWORD PTR [rbp-0x130],rdx
    21e8:	mov    QWORD PTR [rbp-0x1a0],rax
    21ef:	mov    rax,r9
    21f2:	mul    rdi
    21f5:	mov    QWORD PTR [rbp-0x148],rdx
    21fc:	mov    QWORD PTR [rbp-0x1c0],rax
    2203:	mov    rax,QWORD PTR [rbp-0xf0]
    220a:	mov    r9,QWORD PTR [rbp-0x190]
    2211:	mul    r9
    2214:	mov    rdi,rdx
    2217:	mov    rcx,rax
    221a:	mov    rax,r14
    221d:	mul    QWORD PTR [rbp-0x140]
    2224:	mov    QWORD PTR [rbp-0xf8],rdx
    222b:	mov    QWORD PTR [rbp-0x198],rax
    2232:	mov    rax,r11
    2235:	mul    r10
    2238:	mov    r8,rdx
    223b:	mov    r10,rax
    223e:	mov    rax,r15
    2241:	mul    QWORD PTR [rbp-0x108]
    2248:	mov    QWORD PTR [rbp-0xf0],rdx
    224f:	mov    QWORD PTR [rbp-0x1a8],rax
    2256:	mov    rax,r13
    2259:	mul    QWORD PTR [rbp-0x118]
    2260:	mov    QWORD PTR [rbp-0x170],rdx
    2267:	mov    QWORD PTR [rbp-0x160],rax
    226e:	mov    rax,QWORD PTR [rbp-0xe8]
    2275:	mul    r9
    2278:	mov    QWORD PTR [rbp-0x1b8],rdx
    227f:	mov    QWORD PTR [rbp-0x1b0],rax
    2286:	mov    rax,QWORD PTR [rbp-0xd8]
    228d:	mul    QWORD PTR [rbp-0x140]
    2294:	mov    QWORD PTR [rbp-0x140],rdx
    229b:	mov    QWORD PTR [rbp-0xe8],rax
    22a2:	mov    rax,r14
    22a5:	mul    QWORD PTR [rbp-0x158]
    22ac:	mov    QWORD PTR [rbp-0xd8],rdx
    22b3:	mov    QWORD PTR [rbp-0x158],rax
    22ba:	mov    rax,r11
    22bd:	mul    QWORD PTR [rbp-0x108]
    22c4:	mov    r14,rdx
    22c7:	mov    r11,rax
    22ca:	mov    rax,r15
    22cd:	mul    QWORD PTR [rbp-0x118]
    22d4:	mov    QWORD PTR [rbp-0x108],rdx
    22db:	mov    QWORD PTR [rbp-0x118],rax
    22e2:	mov    rax,r13
    22e5:	mul    r9
    22e8:	mov    r13,r12
    22eb:	mov    r15,QWORD PTR [rbp-0x1d0]
    22f2:	shld   r12,r15,0xd
    22f7:	shr    r13,0x33
    22fb:	add    rbx,QWORD PTR [rbp-0x168]
    2302:	adc    rsi,QWORD PTR [rbp-0x120]
    2309:	add    rbx,QWORD PTR [rbp-0x128]
    2310:	adc    rsi,QWORD PTR [rbp-0x100]
    2317:	add    rbx,QWORD PTR [rbp-0xa8]
    231e:	adc    rsi,QWORD PTR [rbp-0x150]
    2325:	add    rbx,QWORD PTR [rbp-0x180]
    232c:	adc    rsi,QWORD PTR [rbp-0x188]
    2333:	add    rbx,r12
    2336:	adc    rsi,r13
    2339:	mov    r12,rsi
    233c:	shld   rsi,rbx,0xd
    2341:	shr    r12,0x33
    2345:	add    rcx,QWORD PTR [rbp-0x138]
    234c:	adc    rdi,QWORD PTR [rbp-0x270]
    2353:	add    rcx,QWORD PTR [rbp-0x1c0]
    235a:	adc    rdi,QWORD PTR [rbp-0x148]
    2361:	add    rcx,QWORD PTR [rbp-0x1a0]
    2368:	adc    rdi,QWORD PTR [rbp-0x130]
    236f:	add    rcx,QWORD PTR [rbp-0xa0]
    2376:	adc    rdi,QWORD PTR [rbp-0x178]
    237d:	add    rcx,rsi
    2380:	adc    rdi,r12
    2383:	mov    rsi,rdi
    2386:	shld   rdi,rcx,0xd
    238b:	shr    rsi,0x33
    238f:	add    r10,QWORD PTR [rbp-0x198]
    2396:	adc    r8,QWORD PTR [rbp-0xf8]
    239d:	add    r10,QWORD PTR [rbp-0x1b0]
    23a4:	adc    r8,QWORD PTR [rbp-0x1b8]
    23ab:	add    r10,QWORD PTR [rbp-0x160]
    23b2:	adc    r8,QWORD PTR [rbp-0x170]
    23b9:	add    r10,QWORD PTR [rbp-0x1a8]
    23c0:	adc    r8,QWORD PTR [rbp-0xf0]
    23c7:	add    r10,rdi
    23ca:	mov    rdi,QWORD PTR [rbp-0xd0]
    23d1:	adc    r8,rsi
    23d4:	mov    rsi,r8
    23d7:	shld   r8,r10,0xd
    23dc:	shr    rsi,0x33
    23e0:	add    r11,QWORD PTR [rbp-0x158]
    23e7:	adc    r14,QWORD PTR [rbp-0xd8]
    23ee:	add    r11,QWORD PTR [rbp-0xe8]
    23f5:	adc    r14,QWORD PTR [rbp-0x140]
    23fc:	add    r11,rax
    23ff:	adc    r14,rdx
    2402:	add    r11,QWORD PTR [rbp-0x118]
    2409:	adc    r14,QWORD PTR [rbp-0x108]
    2410:	add    r11,r8
    2413:	mov    r8,QWORD PTR [rbp-0xc0]
    241a:	adc    r14,rsi
    241d:	mov    rax,r14
    2420:	shr    r14,0x33
    2424:	lea    rdx,[r14+r14*8]
    2428:	lea    rsi,[r14+rdx*2]
    242c:	mov    r14,QWORD PTR [rbp-0x1c8]
    2433:	movabs r13,0x7ffffffffffff
    243d:	and    r15,r13
    2440:	shld   rax,r11,0xd
    2445:	mov    edx,0x13
    244a:	mul    rdx
    244d:	mov    r9,rax
    2450:	add    r9,r15
    2453:	mov    r12,QWORD PTR [rbp-0x408]
    245a:	adc    rdx,rsi
    245d:	mov    rsi,QWORD PTR [rbp-0x2f0]
    2464:	and    rbx,r13
    2467:	shld   rdx,r9,0xd
    246c:	add    rdx,rbx
    246f:	mov    rbx,rdx
    2472:	mov    r15,QWORD PTR [rbp-0xc8]
    2479:	and    r9,r13
    247c:	and    rcx,r13
    247f:	and    r10,r13
    2482:	and    r11,r13
    2485:	add    rsi,0xffffffffffffffff
    2489:	jb     310 <__RNvMs_NtCslh91aX0c5fM_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x2b0>
    248f:	neg    r12
    2492:	mov    rax,r15
    2495:	mov    rsi,QWORD PTR [rbp-0xb8]
    249c:	xor    rax,rsi
    249f:	and    rax,r12
    24a2:	xor    rsi,rax
    24a5:	mov    QWORD PTR [rbp-0xb8],rsi
    24ac:	xor    rax,r15
    24af:	mov    QWORD PTR [rbp-0x3c0],rsi
    24b6:	mov    QWORD PTR [rbp-0x370],rax
    24bd:	mov    rax,r14
    24c0:	mov    rsi,QWORD PTR [rbp-0x68]
    24c4:	xor    rax,rsi
    24c7:	and    rax,r12
    24ca:	xor    rsi,rax
    24cd:	mov    QWORD PTR [rbp-0x68],rsi
    24d1:	xor    rax,r14
    24d4:	mov    QWORD PTR [rbp-0x3b8],rsi
    24db:	mov    QWORD PTR [rbp-0x368],rax
    24e2:	mov    rax,r8
    24e5:	mov    r13,QWORD PTR [rbp-0x60]
    24e9:	xor    rax,r13
    24ec:	and    rax,r12
    24ef:	xor    r13,rax
    24f2:	xor    rax,r8
    24f5:	mov    QWORD PTR [rbp-0x3b0],r13
    24fc:	mov    QWORD PTR [rbp-0x360],rax
    2503:	mov    rax,rdi
    2506:	mov    r15,QWORD PTR [rbp-0x80]
    250a:	xor    rax,r15
    250d:	and    rax,r12
    2510:	xor    r15,rax
    2513:	xor    rax,rdi
    2516:	mov    QWORD PTR [rbp-0x3a8],r15
    251d:	mov    QWORD PTR [rbp-0x358],rax
    2524:	mov    rdx,QWORD PTR [rbp-0x110]
    252b:	mov    rax,rdx
    252e:	mov    r14,QWORD PTR [rbp-0x88]
    2535:	xor    rax,r14
    2538:	and    rax,r12
    253b:	xor    r14,rax
    253e:	xor    rax,rdx
    2541:	mov    QWORD PTR [rbp-0x3a0],r14
    2548:	mov    QWORD PTR [rbp-0x350],rax
    254f:	mov    rsi,QWORD PTR [rbp-0xe0]
    2556:	mov    rax,rsi
    2559:	xor    rax,r9
    255c:	and    rax,r12
    255f:	xor    r9,rax
    2562:	mov    QWORD PTR [rbp-0x398],r9
    2569:	xor    rax,rsi
    256c:	mov    QWORD PTR [rbp-0x348],rax
    2573:	mov    rsi,QWORD PTR [rbp-0xb0]
    257a:	mov    rax,rsi
    257d:	xor    rax,rbx
    2580:	and    rax,r12
    2583:	xor    rbx,rax
    2586:	mov    QWORD PTR [rbp-0x390],rbx
    258d:	xor    rax,rsi
    2590:	mov    QWORD PTR [rbp-0x340],rax
    2597:	mov    rsi,QWORD PTR [rbp-0x78]
    259b:	mov    rax,rsi
    259e:	xor    rax,rcx
    25a1:	and    rax,r12
    25a4:	xor    rcx,rax
    25a7:	mov    QWORD PTR [rbp-0x388],rcx
    25ae:	xor    rax,rsi
    25b1:	mov    QWORD PTR [rbp-0x338],rax
    25b8:	mov    rcx,QWORD PTR [rbp-0x90]
    25bf:	mov    rax,rcx
    25c2:	xor    rax,r10
    25c5:	and    rax,r12
    25c8:	xor    r10,rax
    25cb:	mov    QWORD PTR [rbp-0x380],r10
    25d2:	xor    rax,rcx
    25d5:	mov    QWORD PTR [rbp-0x330],rax
    25dc:	mov    rcx,QWORD PTR [rbp-0x98]
    25e3:	mov    rax,rcx
    25e6:	xor    rax,r11
    25e9:	and    rax,r12
    25ec:	xor    r11,rax
    25ef:	mov    QWORD PTR [rbp-0x378],r11
    25f6:	xor    rax,rcx
    25f9:	mov    QWORD PTR [rbp-0x328],rax
    2600:	lea    rdi,[rbp-0x250]
    2607:	lea    rsi,[rbp-0x398]
    260e:	call   2613 <__RNvMs_NtCslh91aX0c5fM_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x25b3>
    2613:	mov    rax,QWORD PTR [rbp-0x230]
    261a:	mov    QWORD PTR [rbp-0x2a0],rax
    2621:	mov    rax,QWORD PTR [rbp-0x238]
    2628:	mov    QWORD PTR [rbp-0x2a8],rax
    262f:	mov    rax,QWORD PTR [rbp-0x240]
    2636:	mov    QWORD PTR [rbp-0x2b0],rax
    263d:	mov    rax,QWORD PTR [rbp-0x250]
    2644:	mov    rcx,QWORD PTR [rbp-0x248]
    264b:	mov    QWORD PTR [rbp-0x2b8],rcx
    2652:	mov    QWORD PTR [rbp-0x2c0],rax
    2659:	mov    rax,QWORD PTR [rbp-0x208]
    2660:	mov    QWORD PTR [rbp-0x1e0],rax
    2667:	mov    rax,QWORD PTR [rbp-0x210]
    266e:	mov    QWORD PTR [rbp-0x1e8],rax
    2675:	mov    rax,QWORD PTR [rbp-0x218]
    267c:	mov    QWORD PTR [rbp-0x1f0],rax
    2683:	mov    rax,QWORD PTR [rbp-0x220]
    268a:	mov    QWORD PTR [rbp-0x1f8],rax
    2691:	mov    rax,QWORD PTR [rbp-0x228]
    2698:	mov    QWORD PTR [rbp-0x200],rax
    269f:	lea    rbx,[rbp-0x250]
    26a6:	lea    rsi,[rbp-0x2c0]
    26ad:	mov    rdi,rbx
    26b0:	mov    edx,0x5
    26b5:	call   26ba <__RNvMs_NtCslh91aX0c5fM_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x265a>
    26ba:	lea    rdi,[rbp-0x318]
    26c1:	lea    rdx,[rbp-0x200]
    26c8:	mov    rsi,rbx
    26cb:	call   26d0 <__RNvMs_NtCslh91aX0c5fM_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x2670>
    26d0:	mov    rax,QWORD PTR [rbp-0x318]
    26d7:	mov    QWORD PTR [rbp-0x88],rax
    26de:	mov    rdx,QWORD PTR [rbp-0x310]
    26e5:	mov    QWORD PTR [rbp-0xc0],rdx
    26ec:	lea    rcx,[rdx+rdx*8]
    26f0:	lea    rcx,[rdx+rcx*2]
    26f4:	mov    rdi,QWORD PTR [rbp-0x2f8]
    26fb:	mov    QWORD PTR [rbp-0x140],rdi
    2702:	lea    rsi,[rdi+rdi*8]
    2706:	mov    r12,QWORD PTR [rbp-0xb8]
    270d:	mul    r12
    2710:	mov    QWORD PTR [rbp-0xe8],rax
    2717:	mov    QWORD PTR [rbp-0xf0],rdx
    271e:	lea    rax,[rdi+rsi*2]
    2722:	mov    QWORD PTR [rbp-0x118],rax
    2729:	mov    r11,QWORD PTR [rbp-0x68]
    272d:	mul    r11
    2730:	mov    QWORD PTR [rbp-0xd0],rax
    2737:	mov    QWORD PTR [rbp-0xd8],rdx
    273e:	mov    rdx,QWORD PTR [rbp-0x300]
    2745:	mov    QWORD PTR [rbp-0x78],rdx
    2749:	lea    rax,[rdx+rdx*8]
    274d:	lea    rax,[rdx+rax*2]
    2751:	mov    QWORD PTR [rbp-0x90],rax
    2758:	mov    rdi,r13
    275b:	mov    QWORD PTR [rbp-0x60],r13
    275f:	mul    r13
    2762:	mov    r8,rax
    2765:	mov    r9,rdx
    2768:	mov    rdx,QWORD PTR [rbp-0x308]
    276f:	mov    QWORD PTR [rbp-0x108],rdx
    2776:	lea    rax,[rdx+rdx*8]
    277a:	lea    rsi,[rdx+rax*2]
    277e:	mov    rax,rsi
    2781:	mov    r10,r15
    2784:	mul    r15
    2787:	mov    rbx,rdx
    278a:	mov    r15,rax
    278d:	mov    rax,rcx
    2790:	mul    r14
    2793:	mov    rcx,rdx
    2796:	add    rax,r15
    2799:	adc    rcx,rbx
    279c:	add    rax,r8
    279f:	adc    rcx,r9
    27a2:	add    rax,QWORD PTR [rbp-0xe8]
    27a9:	adc    rcx,QWORD PTR [rbp-0xf0]
    27b0:	add    rax,QWORD PTR [rbp-0xd0]
    27b7:	mov    QWORD PTR [rbp-0x280],rax
    27be:	adc    rcx,QWORD PTR [rbp-0xd8]
    27c5:	mov    r13,QWORD PTR [rbp-0xc0]
    27cc:	mov    rax,r13
    27cf:	mov    r9,r12
    27d2:	mul    r12
    27d5:	mov    QWORD PTR [rbp-0xe8],rdx
    27dc:	mov    QWORD PTR [rbp-0xc8],rax
    27e3:	mov    rax,QWORD PTR [rbp-0x88]
    27ea:	mul    r11
    27ed:	mov    QWORD PTR [rbp-0xf0],rdx
    27f4:	mov    QWORD PTR [rbp-0xd0],rax
    27fb:	mov    r8,QWORD PTR [rbp-0x118]
    2802:	mov    rax,r8
    2805:	mul    rdi
    2808:	mov    QWORD PTR [rbp-0xd8],rdx
    280f:	mov    QWORD PTR [rbp-0x110],rax
    2816:	mov    rdi,QWORD PTR [rbp-0x90]
    281d:	mov    rax,rdi
    2820:	mov    QWORD PTR [rbp-0x80],r10
    2824:	mul    r10
    2827:	mov    QWORD PTR [rbp-0x98],rdx
    282e:	mov    QWORD PTR [rbp-0x158],rax
    2835:	mov    rax,rsi
    2838:	mov    rbx,r14
    283b:	mul    r14
    283e:	mov    r12,rdx
    2841:	mov    rsi,rax
    2844:	mov    rax,QWORD PTR [rbp-0x108]
    284b:	mul    r9
    284e:	mov    r15,rdx
    2851:	mov    r9,rax
    2854:	mov    rax,r13
    2857:	mul    r11
    285a:	mov    r14,r11
    285d:	add    rax,r9
    2860:	mov    QWORD PTR [rbp-0x180],rax
    2867:	adc    rdx,r15
    286a:	mov    QWORD PTR [rbp-0x150],rdx
    2871:	mov    r13,QWORD PTR [rbp-0x88]
    2878:	mov    rax,r13
    287b:	mov    r9,QWORD PTR [rbp-0x60]
    287f:	mul    r9
    2882:	mov    QWORD PTR [rbp-0x190],rdx
    2889:	mov    QWORD PTR [rbp-0x1d0],rax
    2890:	mov    rax,r8
    2893:	mul    r10
    2896:	mov    QWORD PTR [rbp-0x178],rdx
    289d:	mov    QWORD PTR [rbp-0xb0],rax
    28a4:	mov    rax,rdi
    28a7:	mul    rbx
    28aa:	mov    r11,rbx
    28ad:	mov    r8,rdx
    28b0:	mov    rdi,rax
    28b3:	mov    rax,QWORD PTR [rbp-0x78]
    28b7:	mov    r10,QWORD PTR [rbp-0xb8]
    28be:	mul    r10
    28c1:	mov    QWORD PTR [rbp-0x90],rdx
    28c8:	mov    QWORD PTR [rbp-0x188],rax
    28cf:	mov    r15,QWORD PTR [rbp-0x108]
    28d6:	mov    rax,r15
    28d9:	mul    r14
    28dc:	mov    QWORD PTR [rbp-0xa8],rdx
    28e3:	mov    QWORD PTR [rbp-0xe0],rax
    28ea:	mov    r14,QWORD PTR [rbp-0xc0]
    28f1:	mov    rax,r14
    28f4:	mul    r9
    28f7:	mov    rbx,rdx
    28fa:	mov    r9,rax
    28fd:	mov    rax,r13
    2900:	mov    r13,QWORD PTR [rbp-0x80]
    2904:	mul    r13
    2907:	mov    QWORD PTR [rbp-0xa0],rdx
    290e:	mov    QWORD PTR [rbp-0x290],rax
    2915:	mov    rax,QWORD PTR [rbp-0x118]
    291c:	mul    r11
    291f:	mov    QWORD PTR [rbp-0x1c8],rdx
    2926:	mov    QWORD PTR [rbp-0x288],rax
    292d:	mov    rax,QWORD PTR [rbp-0x140]
    2934:	mul    r10
    2937:	mov    QWORD PTR [rbp-0x118],rdx
    293e:	mov    QWORD PTR [rbp-0x140],rax
    2945:	mov    rax,QWORD PTR [rbp-0x78]
    2949:	mul    QWORD PTR [rbp-0x68]
    294d:	mov    QWORD PTR [rbp-0x68],rdx
    2951:	mov    QWORD PTR [rbp-0x78],rax
    2955:	mov    rax,r15
    2958:	mul    QWORD PTR [rbp-0x60]
    295c:	mov    QWORD PTR [rbp-0x60],rdx
    2960:	mov    QWORD PTR [rbp-0x108],rax
    2967:	mov    rax,r14
    296a:	mul    r13
    296d:	mov    r15,rdx
    2970:	mov    r10,rax
    2973:	mov    rax,QWORD PTR [rbp-0x88]
    297a:	mul    r11
    297d:	mov    r11,rcx
    2980:	mov    r14,QWORD PTR [rbp-0x280]
    2987:	shld   rcx,r14,0xd
    298c:	shr    r11,0x33
    2990:	add    rsi,QWORD PTR [rbp-0xc8]
    2997:	adc    r12,QWORD PTR [rbp-0xe8]
    299e:	add    rsi,QWORD PTR [rbp-0x158]
    29a5:	adc    r12,QWORD PTR [rbp-0x98]
    29ac:	add    rsi,QWORD PTR [rbp-0xd0]
    29b3:	adc    r12,QWORD PTR [rbp-0xf0]
    29ba:	add    rsi,QWORD PTR [rbp-0x110]
    29c1:	adc    r12,QWORD PTR [rbp-0xd8]
    29c8:	add    rsi,rcx
    29cb:	adc    r12,r11
    29ce:	mov    rcx,r12
    29d1:	shld   r12,rsi,0xd
    29d6:	shr    rcx,0x33
    29da:	add    rdi,QWORD PTR [rbp-0x180]
    29e1:	adc    r8,QWORD PTR [rbp-0x150]
    29e8:	add    rdi,QWORD PTR [rbp-0x1d0]
    29ef:	adc    r8,QWORD PTR [rbp-0x190]
    29f6:	add    rdi,QWORD PTR [rbp-0xb0]
    29fd:	adc    r8,QWORD PTR [rbp-0x178]
    2a04:	add    rdi,r12
    2a07:	adc    r8,rcx
    2a0a:	mov    rcx,r8
    2a0d:	shld   r8,rdi,0xd
    2a12:	shr    rcx,0x33
    2a16:	add    r9,QWORD PTR [rbp-0xe0]
    2a1d:	adc    rbx,QWORD PTR [rbp-0xa8]
    2a24:	add    r9,QWORD PTR [rbp-0x188]
    2a2b:	adc    rbx,QWORD PTR [rbp-0x90]
    2a32:	add    r9,QWORD PTR [rbp-0x290]
    2a39:	adc    rbx,QWORD PTR [rbp-0xa0]
    2a40:	add    r9,QWORD PTR [rbp-0x288]
    2a47:	adc    rbx,QWORD PTR [rbp-0x1c8]
    2a4e:	add    r9,r8
    2a51:	adc    rbx,rcx
    2a54:	mov    rcx,rbx
    2a57:	shld   rbx,r9,0xd
    2a5c:	shr    rcx,0x33
    2a60:	add    r10,QWORD PTR [rbp-0x108]
    2a67:	adc    r15,QWORD PTR [rbp-0x60]
    2a6b:	add    r10,QWORD PTR [rbp-0x78]
    2a6f:	adc    r15,QWORD PTR [rbp-0x68]
    2a73:	add    r10,QWORD PTR [rbp-0x140]
    2a7a:	adc    r15,QWORD PTR [rbp-0x118]
    2a81:	add    r10,rax
    2a84:	adc    r15,rdx
    2a87:	add    r10,rbx
    2a8a:	adc    r15,rcx
    2a8d:	movabs r8,0x7ffffffffffff
    2a97:	mov    r11,r14
    2a9a:	and    r11,r8
    2a9d:	mov    rax,r15
    2aa0:	shld   rax,r10,0xd
    2aa5:	shr    r15,0x33
    2aa9:	lea    rcx,[r15+r15*8]
    2aad:	lea    rcx,[r15+rcx*2]
    2ab1:	mov    edx,0x13
    2ab6:	mul    rdx
    2ab9:	add    rax,r11
    2abc:	adc    rdx,rcx
    2abf:	and    rsi,r8
    2ac2:	shld   rdx,rax,0xd
    2ac7:	add    rdx,rsi
    2aca:	and    rax,r8
    2acd:	and    rdi,r8
    2ad0:	and    r9,r8
    2ad3:	and    r10,r8
    2ad6:	mov    QWORD PTR [rbp-0x250],rax
    2add:	mov    QWORD PTR [rbp-0x248],rdx
    2ae4:	mov    QWORD PTR [rbp-0x240],rdi
    2aeb:	mov    QWORD PTR [rbp-0x238],r9
    2af2:	mov    QWORD PTR [rbp-0x230],r10
    2af9:	lea    rdi,[rbp-0x200]
    2b00:	lea    rsi,[rbp-0x250]
    2b07:	call   2b0c <__RNvMs_NtCslh91aX0c5fM_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x2aac>
    2b0c:	movzx  eax,BYTE PTR [rbp-0x200]
    2b13:	movzx  ecx,BYTE PTR [rbp-0x1ff]
    2b1a:	mov    BYTE PTR [rbp-0x34],al
    2b1d:	mov    BYTE PTR [rbp-0x53],cl
    2b20:	movzx  eax,BYTE PTR [rbp-0x1fe]
    2b27:	mov    BYTE PTR [rbp-0x52],al
    2b2a:	movzx  eax,BYTE PTR [rbp-0x1fd]
    2b31:	mov    BYTE PTR [rbp-0x51],al
    2b34:	movzx  eax,BYTE PTR [rbp-0x1fc]
    2b3b:	mov    BYTE PTR [rbp-0x50],al
    2b3e:	movzx  eax,BYTE PTR [rbp-0x1fb]
    2b45:	mov    BYTE PTR [rbp-0x4f],al
    2b48:	movzx  eax,BYTE PTR [rbp-0x1fa]
    2b4f:	mov    BYTE PTR [rbp-0x4e],al
    2b52:	movzx  eax,BYTE PTR [rbp-0x1f9]
    2b59:	mov    BYTE PTR [rbp-0x4d],al
    2b5c:	movzx  eax,BYTE PTR [rbp-0x1f8]
    2b63:	mov    BYTE PTR [rbp-0x4c],al
    2b66:	movzx  eax,BYTE PTR [rbp-0x1f7]
    2b6d:	mov    BYTE PTR [rbp-0x4b],al
    2b70:	movzx  eax,BYTE PTR [rbp-0x1f6]
    2b77:	movzx  ecx,BYTE PTR [rbp-0x1f5]
    2b7e:	mov    BYTE PTR [rbp-0x4a],al
    2b81:	mov    BYTE PTR [rbp-0x49],cl
    2b84:	movzx  eax,BYTE PTR [rbp-0x1f4]
    2b8b:	mov    BYTE PTR [rbp-0x48],al
    2b8e:	movzx  eax,BYTE PTR [rbp-0x1f3]
    2b95:	mov    BYTE PTR [rbp-0x47],al
    2b98:	movzx  eax,BYTE PTR [rbp-0x1f2]
    2b9f:	mov    BYTE PTR [rbp-0x46],al
    2ba2:	movzx  eax,BYTE PTR [rbp-0x1f1]
    2ba9:	mov    BYTE PTR [rbp-0x45],al
    2bac:	movzx  eax,BYTE PTR [rbp-0x1f0]
    2bb3:	mov    BYTE PTR [rbp-0x44],al
    2bb6:	movzx  eax,BYTE PTR [rbp-0x1ef]
    2bbd:	mov    BYTE PTR [rbp-0x43],al
    2bc0:	movzx  eax,BYTE PTR [rbp-0x1ee]
    2bc7:	mov    BYTE PTR [rbp-0x42],al
    2bca:	movzx  eax,BYTE PTR [rbp-0x1ed]
    2bd1:	movzx  ecx,BYTE PTR [rbp-0x1ec]
    2bd8:	mov    BYTE PTR [rbp-0x41],al
    2bdb:	mov    BYTE PTR [rbp-0x40],cl
    2bde:	movzx  eax,BYTE PTR [rbp-0x1eb]
    2be5:	mov    BYTE PTR [rbp-0x3f],al
    2be8:	movzx  eax,BYTE PTR [rbp-0x1ea]
    2bef:	mov    BYTE PTR [rbp-0x3e],al
    2bf2:	movzx  eax,BYTE PTR [rbp-0x1e9]
    2bf9:	mov    BYTE PTR [rbp-0x3d],al
    2bfc:	movzx  eax,BYTE PTR [rbp-0x1e8]
    2c03:	mov    BYTE PTR [rbp-0x3c],al
    2c06:	movzx  eax,BYTE PTR [rbp-0x1e7]
    2c0d:	mov    BYTE PTR [rbp-0x3b],al
    2c10:	movzx  eax,BYTE PTR [rbp-0x1e6]
    2c17:	mov    BYTE PTR [rbp-0x3a],al
    2c1a:	movzx  eax,BYTE PTR [rbp-0x1e5]
    2c21:	mov    BYTE PTR [rbp-0x39],al
    2c24:	movzx  eax,BYTE PTR [rbp-0x1e4]
    2c2b:	mov    BYTE PTR [rbp-0x38],al
    2c2e:	movzx  eax,BYTE PTR [rbp-0x1e3]
    2c35:	mov    BYTE PTR [rbp-0x37],al
    2c38:	movzx  eax,BYTE PTR [rbp-0x1e2]
    2c3f:	mov    BYTE PTR [rbp-0x36],al
    2c42:	movzx  eax,BYTE PTR [rbp-0x1e1]
    2c49:	mov    BYTE PTR [rbp-0x35],al
    2c4c:	xorps  xmm0,xmm0
    2c4f:	movaps XMMWORD PTR [rbp-0x200],xmm0
    2c56:	movaps xmm1,XMMWORD PTR [rbp-0x200]
    2c5d:	movaps XMMWORD PTR [rbp-0x250],xmm1
    2c64:	movaps XMMWORD PTR [rbp-0x200],xmm0
    2c6b:	mov    rax,QWORD PTR [rbp-0x200]
    2c72:	mov    rcx,QWORD PTR [rbp-0x1f8]
    2c79:	lea    rdx,[rbp-0x250]
    2c80:	mov    QWORD PTR [rdx+0x18],rcx
    2c84:	mov    QWORD PTR [rdx+0x10],rax
    2c88:	mov    BYTE PTR [rbp-0x230],0x0
    2c8f:	mov    BYTE PTR [rbp-0x22f],0x0
    2c96:	mov    BYTE PTR [rbp-0x22e],0x0
    2c9d:	mov    BYTE PTR [rbp-0x22d],0x0
    2ca4:	mov    BYTE PTR [rbp-0x22c],0x0
    2cab:	mov    BYTE PTR [rbp-0x22b],0x0
    2cb2:	mov    BYTE PTR [rbp-0x22a],0x0
    2cb9:	mov    BYTE PTR [rbp-0x229],0x0
    2cc0:	movaps XMMWORD PTR [rbp-0x250],xmm0
    2cc7:	movaps xmm1,XMMWORD PTR [rbp-0x250]
    2cce:	movaps XMMWORD PTR [rbp-0x3c0],xmm1
    2cd5:	movaps XMMWORD PTR [rbp-0x250],xmm0
    2cdc:	mov    rax,QWORD PTR [rbp-0x250]
    2ce3:	mov    rcx,QWORD PTR [rbp-0x248]
    2cea:	lea    rdx,[rbp-0x3c0]
    2cf1:	mov    QWORD PTR [rdx+0x18],rcx
    2cf5:	mov    QWORD PTR [rdx+0x10],rax
    2cf9:	movaps XMMWORD PTR [rbp-0x250],xmm0
    2d00:	mov    rax,QWORD PTR [rbp-0x250]
    2d07:	mov    rcx,QWORD PTR [rbp-0x248]
    2d0e:	mov    QWORD PTR [rdx+0x28],rcx
    2d12:	mov    QWORD PTR [rdx+0x20],rax
    2d16:	movaps XMMWORD PTR [rbp-0x250],xmm0
    2d1d:	mov    rax,QWORD PTR [rbp-0x250]
    2d24:	mov    rcx,QWORD PTR [rbp-0x248]
    2d2b:	mov    QWORD PTR [rdx+0x38],rcx
    2d2f:	mov    QWORD PTR [rdx+0x30],rax
    2d33:	movaps XMMWORD PTR [rbp-0x250],xmm0
    2d3a:	mov    rax,QWORD PTR [rbp-0x250]
    2d41:	mov    rcx,QWORD PTR [rbp-0x248]
    2d48:	mov    QWORD PTR [rdx+0x48],rcx
    2d4c:	mov    QWORD PTR [rdx+0x40],rax
    2d50:	movaps XMMWORD PTR [rbp-0x250],xmm0
    2d57:	mov    rax,QWORD PTR [rbp-0x250]
    2d5e:	mov    rcx,QWORD PTR [rbp-0x248]
    2d65:	mov    QWORD PTR [rdx+0x58],rcx
    2d69:	mov    QWORD PTR [rdx+0x50],rax
    2d6d:	movaps XMMWORD PTR [rbp-0x250],xmm0
    2d74:	mov    rax,QWORD PTR [rbp-0x250]
    2d7b:	mov    rcx,QWORD PTR [rbp-0x248]
    2d82:	mov    QWORD PTR [rdx+0x68],rcx
    2d86:	mov    QWORD PTR [rdx+0x60],rax
    2d8a:	movaps XMMWORD PTR [rbp-0x250],xmm0
    2d91:	mov    rax,QWORD PTR [rbp-0x250]
    2d98:	mov    rcx,QWORD PTR [rbp-0x248]
    2d9f:	mov    QWORD PTR [rdx+0x78],rcx
    2da3:	mov    QWORD PTR [rdx+0x70],rax
    2da7:	movaps XMMWORD PTR [rbp-0x250],xmm0
    2dae:	mov    rax,QWORD PTR [rbp-0x250]
    2db5:	mov    rcx,QWORD PTR [rbp-0x248]
    2dbc:	mov    QWORD PTR [rdx+0x88],rcx
    2dc3:	mov    QWORD PTR [rdx+0x80],rax
    2dca:	movaps XMMWORD PTR [rbp-0x250],xmm0
    2dd1:	mov    rax,QWORD PTR [rbp-0x250]
    2dd8:	mov    rcx,QWORD PTR [rbp-0x248]
    2ddf:	mov    QWORD PTR [rdx+0x98],rcx
    2de6:	mov    QWORD PTR [rdx+0x90],rax
    2ded:	movzx  ecx,BYTE PTR [rbp-0x53]
    2df1:	movzx  eax,BYTE PTR [rbp-0x34]
    2df5:	mov    BYTE PTR [rbp-0x60],cl
    2df8:	or     al,cl
    2dfa:	movzx  ecx,BYTE PTR [rbp-0x52]
    2dfe:	movzx  edx,BYTE PTR [rbp-0x51]
    2e02:	mov    BYTE PTR [rbp-0x80],cl
    2e05:	mov    BYTE PTR [rbp-0x68],dl
    2e08:	or     cl,dl
    2e0a:	or     cl,al
    2e0c:	movzx  eax,BYTE PTR [rbp-0x50]
    2e10:	movzx  edx,BYTE PTR [rbp-0x4f]
    2e14:	mov    BYTE PTR [rbp-0x88],al
    2e1a:	mov    BYTE PTR [rbp-0x78],dl
    2e1d:	or     al,dl
    2e1f:	movzx  edx,BYTE PTR [rbp-0x4e]
    2e23:	mov    BYTE PTR [rbp-0x108],dl
    2e29:	or     al,dl
    2e2b:	or     al,cl
    2e2d:	movzx  edx,BYTE PTR [rbp-0x4d]
    2e31:	movzx  ecx,BYTE PTR [rbp-0x4c]
    2e35:	mov    BYTE PTR [rbp-0xc0],dl
    2e3b:	mov    BYTE PTR [rbp-0x118],cl
    2e41:	or     dl,cl
    2e43:	movzx  ecx,BYTE PTR [rbp-0x4b]
    2e47:	mov    BYTE PTR [rbp-0x140],cl
    2e4d:	or     dl,cl
    2e4f:	movzx  ecx,BYTE PTR [rbp-0x4a]
    2e53:	mov    BYTE PTR [rbp-0xf0],cl
    2e59:	or     dl,cl
    2e5b:	or     dl,al
    2e5d:	movzx  ecx,BYTE PTR [rbp-0x49]
    2e61:	movzx  eax,BYTE PTR [rbp-0x48]
    2e65:	mov    BYTE PTR [rbp-0xe8],cl
    2e6b:	mov    BYTE PTR [rbp-0xd8],al
    2e71:	or     cl,al
    2e73:	movzx  eax,BYTE PTR [rbp-0x47]
    2e77:	mov    BYTE PTR [rbp-0xb8],al
    2e7d:	or     cl,al
    2e7f:	movzx  eax,BYTE PTR [rbp-0x46]
    2e83:	mov    BYTE PTR [rbp-0xd0],al
    2e89:	or     cl,al
    2e8b:	movzx  eax,BYTE PTR [rbp-0x45]
    2e8f:	mov    BYTE PTR [rbp-0xc8],al
    2e95:	or     cl,al
    2e97:	or     cl,dl
    2e99:	movzx  eax,BYTE PTR [rbp-0x44]
    2e9d:	movzx  edx,BYTE PTR [rbp-0x43]
    2ea1:	mov    BYTE PTR [rbp-0x110],al
    2ea7:	mov    BYTE PTR [rbp-0x98],dl
    2ead:	or     al,dl
    2eaf:	movzx  edx,BYTE PTR [rbp-0x42]
    2eb3:	mov    BYTE PTR [rbp-0x90],dl
    2eb9:	or     al,dl
    2ebb:	movzx  edx,BYTE PTR [rbp-0x41]
    2ebf:	mov    BYTE PTR [rbp-0x158],dl
    2ec5:	or     al,dl
    2ec7:	movzx  r8d,BYTE PTR [rbp-0x40]
    2ecc:	or     al,r8b
    2ecf:	movzx  r10d,BYTE PTR [rbp-0x3f]
    2ed4:	or     al,r10b
    2ed7:	or     al,cl
    2ed9:	movzx  r9d,BYTE PTR [rbp-0x3e]
    2ede:	movzx  r11d,BYTE PTR [rbp-0x3d]
    2ee3:	mov    edx,r9d
    2ee6:	or     dl,r11b
    2ee9:	movzx  ebx,BYTE PTR [rbp-0x3c]
    2eed:	or     dl,bl
    2eef:	movzx  r15d,BYTE PTR [rbp-0x3b]
    2ef4:	or     dl,r15b
    2ef7:	movzx  r14d,BYTE PTR [rbp-0x3a]
    2efc:	or     dl,r14b
    2eff:	movzx  r12d,BYTE PTR [rbp-0x39]
    2f04:	or     dl,r12b
    2f07:	movzx  r13d,BYTE PTR [rbp-0x38]
    2f0c:	or     dl,r13b
    2f0f:	or     dl,al
    2f11:	movzx  edi,BYTE PTR [rbp-0x37]
    2f15:	movzx  ecx,BYTE PTR [rbp-0x36]
    2f19:	mov    eax,edi
    2f1b:	or     al,cl
    2f1d:	or     al,dl
    2f1f:	xor    esi,esi
    2f21:	movzx  edx,BYTE PTR [rbp-0x35]
    2f25:	or     al,dl
    2f27:	setne  sil
    2f2b:	test   rsi,rsi
    2f2e:	je     3029 <__RNvMs_NtCslh91aX0c5fM_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x2fc9>
    2f34:	movzx  eax,BYTE PTR [rbp-0x34]
    2f38:	mov    rsi,QWORD PTR [rbp-0x2d8]
    2f3f:	mov    BYTE PTR [rsi+0x1],al
    2f42:	movzx  eax,BYTE PTR [rbp-0x60]
    2f46:	mov    BYTE PTR [rsi+0x2],al
    2f49:	movzx  eax,BYTE PTR [rbp-0x80]
    2f4d:	mov    BYTE PTR [rsi+0x3],al
    2f50:	movzx  eax,BYTE PTR [rbp-0x68]
    2f54:	mov    BYTE PTR [rsi+0x4],al
    2f57:	movzx  eax,BYTE PTR [rbp-0x88]
    2f5e:	mov    BYTE PTR [rsi+0x5],al
    2f61:	movzx  eax,BYTE PTR [rbp-0x78]
    2f65:	mov    BYTE PTR [rsi+0x6],al
    2f68:	movzx  eax,BYTE PTR [rbp-0x108]
    2f6f:	mov    BYTE PTR [rsi+0x7],al
    2f72:	movzx  eax,BYTE PTR [rbp-0xc0]
    2f79:	mov    BYTE PTR [rsi+0x8],al
    2f7c:	movzx  eax,BYTE PTR [rbp-0x118]
    2f83:	mov    BYTE PTR [rsi+0x9],al
    2f86:	movzx  eax,BYTE PTR [rbp-0x140]
    2f8d:	mov    BYTE PTR [rsi+0xa],al
    2f90:	movzx  eax,BYTE PTR [rbp-0xf0]
    2f97:	mov    BYTE PTR [rsi+0xb],al
    2f9a:	movzx  eax,BYTE PTR [rbp-0xe8]
    2fa1:	mov    BYTE PTR [rsi+0xc],al
    2fa4:	movzx  eax,BYTE PTR [rbp-0xd8]
    2fab:	mov    BYTE PTR [rsi+0xd],al
    2fae:	movzx  eax,BYTE PTR [rbp-0xb8]
    2fb5:	mov    BYTE PTR [rsi+0xe],al
    2fb8:	movzx  eax,BYTE PTR [rbp-0xd0]
    2fbf:	mov    BYTE PTR [rsi+0xf],al
    2fc2:	movzx  eax,BYTE PTR [rbp-0xc8]
    2fc9:	mov    BYTE PTR [rsi+0x10],al
    2fcc:	movzx  eax,BYTE PTR [rbp-0x110]
    2fd3:	mov    BYTE PTR [rsi+0x11],al
    2fd6:	movzx  eax,BYTE PTR [rbp-0x98]
    2fdd:	mov    BYTE PTR [rsi+0x12],al
    2fe0:	movzx  eax,BYTE PTR [rbp-0x90]
    2fe7:	mov    BYTE PTR [rsi+0x13],al
    2fea:	movzx  eax,BYTE PTR [rbp-0x158]
    2ff1:	mov    BYTE PTR [rsi+0x14],al
    2ff4:	mov    BYTE PTR [rsi+0x15],r8b
    2ff8:	mov    BYTE PTR [rsi+0x16],r10b
    2ffc:	mov    BYTE PTR [rsi+0x17],r9b
    3000:	mov    BYTE PTR [rsi+0x18],r11b
    3004:	mov    BYTE PTR [rsi+0x19],bl
    3007:	mov    BYTE PTR [rsi+0x1a],r15b
    300b:	mov    BYTE PTR [rsi+0x1b],r14b
    300f:	mov    BYTE PTR [rsi+0x1c],r12b
    3013:	mov    BYTE PTR [rsi+0x1d],r13b
    3017:	mov    BYTE PTR [rsi+0x1e],dil
    301b:	mov    BYTE PTR [rsi+0x1f],cl
    301e:	mov    BYTE PTR [rsi+0x20],dl
    3021:	mov    BYTE PTR [rsi],0x0
    3024:	jmp    31d1 <__RNvMs_NtCslh91aX0c5fM_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x3171>
    3029:	mov    rsi,QWORD PTR [rbp-0x2d8]
    3030:	mov    WORD PTR [rsi],0x301
    3035:	mov    BYTE PTR [rbp-0x3c0],0x0
    303c:	mov    BYTE PTR [rbp-0x250],0x0
    3043:	mov    BYTE PTR [rbp-0x200],0x0
    304a:	mov    BYTE PTR [rbp-0x2c0],0x0
    3051:	mov    BYTE PTR [rbp-0x318],0x0
    3058:	mov    BYTE PTR [rbp-0x33],0x0
    305c:	mov    BYTE PTR [rbp-0x32],0x0
    3060:	mov    BYTE PTR [rbp-0x31],0x0
    3064:	mov    BYTE PTR [rbp-0x30],0x0
    3068:	mov    BYTE PTR [rbp-0x2f],0x0
    306c:	mov    BYTE PTR [rbp-0x2e],0x0
    3070:	mov    BYTE PTR [rbp-0x2d],0x0
    3074:	mov    BYTE PTR [rbp-0x2c],0x0
    3078:	mov    BYTE PTR [rbp-0x2b],0x0
    307c:	mov    BYTE PTR [rbp-0x2a],0x0
    3080:	mov    BYTE PTR [rbp-0x29],0x0
    3084:	movzx  eax,BYTE PTR [rbp-0x3c0]
    308b:	mov    BYTE PTR [rbp-0x34],al
    308e:	movzx  eax,BYTE PTR [rbp-0x250]
    3095:	mov    BYTE PTR [rbp-0x53],al
    3098:	movzx  eax,BYTE PTR [rbp-0x200]
    309f:	mov    BYTE PTR [rbp-0x52],al
    30a2:	movzx  eax,BYTE PTR [rbp-0x2c0]
    30a9:	mov    BYTE PTR [rbp-0x51],al
    30ac:	movzx  eax,BYTE PTR [rbp-0x318]
    30b3:	mov    BYTE PTR [rbp-0x50],al
    30b6:	movzx  eax,BYTE PTR [rbp-0x33]
    30ba:	mov    BYTE PTR [rbp-0x4f],al
    30bd:	movzx  eax,BYTE PTR [rbp-0x32]
    30c1:	mov    BYTE PTR [rbp-0x4e],al
    30c4:	movzx  eax,BYTE PTR [rbp-0x31]
    30c8:	mov    BYTE PTR [rbp-0x4d],al
    30cb:	movzx  eax,BYTE PTR [rbp-0x30]
    30cf:	mov    BYTE PTR [rbp-0x4c],al
    30d2:	movzx  eax,BYTE PTR [rbp-0x2f]
    30d6:	mov    BYTE PTR [rbp-0x4b],al
    30d9:	movzx  eax,BYTE PTR [rbp-0x2e]
    30dd:	mov    BYTE PTR [rbp-0x4a],al
    30e0:	movzx  eax,BYTE PTR [rbp-0x2d]
    30e4:	mov    BYTE PTR [rbp-0x49],al
    30e7:	movzx  eax,BYTE PTR [rbp-0x2c]
    30eb:	mov    BYTE PTR [rbp-0x48],al
    30ee:	movzx  eax,BYTE PTR [rbp-0x2b]
    30f2:	mov    BYTE PTR [rbp-0x47],al
    30f5:	movzx  eax,BYTE PTR [rbp-0x2a]
    30f9:	mov    BYTE PTR [rbp-0x46],al
    30fc:	movzx  eax,BYTE PTR [rbp-0x29]
    3100:	mov    BYTE PTR [rbp-0x45],al
    3103:	mov    BYTE PTR [rbp-0x3c0],0x0
    310a:	mov    BYTE PTR [rbp-0x250],0x0
    3111:	mov    BYTE PTR [rbp-0x200],0x0
    3118:	mov    BYTE PTR [rbp-0x2c0],0x0
    311f:	mov    BYTE PTR [rbp-0x318],0x0
    3126:	mov    BYTE PTR [rbp-0x33],0x0
    312a:	mov    BYTE PTR [rbp-0x32],0x0
    312e:	mov    BYTE PTR [rbp-0x31],0x0
    3132:	mov    BYTE PTR [rbp-0x30],0x0
    3136:	mov    BYTE PTR [rbp-0x2f],0x0
    313a:	mov    BYTE PTR [rbp-0x2e],0x0
    313e:	mov    BYTE PTR [rbp-0x2d],0x0
    3142:	mov    BYTE PTR [rbp-0x2c],0x0
    3146:	mov    BYTE PTR [rbp-0x2b],0x0
    314a:	mov    BYTE PTR [rbp-0x2a],0x0
    314e:	mov    BYTE PTR [rbp-0x29],0x0
    3152:	movzx  eax,BYTE PTR [rbp-0x3c0]
    3159:	mov    BYTE PTR [rbp-0x44],al
    315c:	movzx  eax,BYTE PTR [rbp-0x250]
    3163:	mov    BYTE PTR [rbp-0x43],al
    3166:	movzx  eax,BYTE PTR [rbp-0x200]
    316d:	mov    BYTE PTR [rbp-0x42],al
    3170:	movzx  eax,BYTE PTR [rbp-0x2c0]
    3177:	mov    BYTE PTR [rbp-0x41],al
    317a:	movzx  eax,BYTE PTR [rbp-0x318]
    3181:	mov    BYTE PTR [rbp-0x40],al
    3184:	movzx  eax,BYTE PTR [rbp-0x33]
    3188:	mov    BYTE PTR [rbp-0x3f],al
    318b:	movzx  eax,BYTE PTR [rbp-0x32]
    318f:	mov    BYTE PTR [rbp-0x3e],al
    3192:	movzx  eax,BYTE PTR [rbp-0x31]
    3196:	mov    BYTE PTR [rbp-0x3d],al
    3199:	movzx  eax,BYTE PTR [rbp-0x30]
    319d:	mov    BYTE PTR [rbp-0x3c],al
    31a0:	movzx  eax,BYTE PTR [rbp-0x2f]
    31a4:	mov    BYTE PTR [rbp-0x3b],al
    31a7:	movzx  eax,BYTE PTR [rbp-0x2e]
    31ab:	mov    BYTE PTR [rbp-0x3a],al
    31ae:	movzx  eax,BYTE PTR [rbp-0x2d]
    31b2:	mov    BYTE PTR [rbp-0x39],al
    31b5:	movzx  eax,BYTE PTR [rbp-0x2c]
    31b9:	mov    BYTE PTR [rbp-0x38],al
    31bc:	movzx  eax,BYTE PTR [rbp-0x2b]
    31c0:	mov    BYTE PTR [rbp-0x37],al
    31c3:	movzx  eax,BYTE PTR [rbp-0x2a]
    31c7:	mov    BYTE PTR [rbp-0x36],al
    31ca:	movzx  eax,BYTE PTR [rbp-0x29]
    31ce:	mov    BYTE PTR [rbp-0x35],al
    31d1:	mov    rdx,QWORD PTR [rbp-0x2c8]
    31d8:	movaps XMMWORD PTR [rbp-0x3c0],xmm0
    31df:	mov    rax,QWORD PTR [rbp-0x3c0]
    31e6:	mov    rcx,QWORD PTR [rbp-0x3b8]
    31ed:	mov    QWORD PTR [rdx+0x8],rcx
    31f1:	mov    QWORD PTR [rdx],rax
    31f4:	movaps XMMWORD PTR [rbp-0x3c0],xmm0
    31fb:	mov    rax,QWORD PTR [rbp-0x3c0]
    3202:	mov    rcx,QWORD PTR [rbp-0x3b8]
    3209:	mov    QWORD PTR [rdx+0x18],rcx
    320d:	mov    QWORD PTR [rdx+0x10],rax
    3211:	mov    rax,rsi
    3214:	add    rsp,0x3e8
    321b:	pop    rbx
    321c:	pop    r12
    321e:	pop    r13
    3220:	pop    r14
    3222:	pop    r15
    3224:	pop    rbp
    3225:	ret
    3226:	mov    rbx,rax
    3229:	xorps  xmm1,xmm1
    322c:	movaps XMMWORD PTR [rbp-0x2c0],xmm1
    3233:	movaps xmm0,XMMWORD PTR [rbp-0x2c0]
    323a:	movaps XMMWORD PTR [rbp-0x250],xmm0
    3241:	movaps XMMWORD PTR [rbp-0x2c0],xmm1
    3248:	mov    rax,QWORD PTR [rbp-0x2c0]
    324f:	mov    rcx,QWORD PTR [rbp-0x2b8]
    3256:	lea    rdx,[rbp-0x250]
    325d:	mov    QWORD PTR [rdx+0x18],rcx
    3261:	mov    QWORD PTR [rdx+0x10],rax
    3265:	mov    BYTE PTR [rbp-0x230],0x0
    326c:	mov    BYTE PTR [rbp-0x22f],0x0
    3273:	mov    BYTE PTR [rbp-0x22e],0x0
    327a:	mov    BYTE PTR [rbp-0x22d],0x0
    3281:	mov    BYTE PTR [rbp-0x22c],0x0
    3288:	mov    BYTE PTR [rbp-0x22b],0x0
    328f:	mov    BYTE PTR [rbp-0x22a],0x0
    3296:	mov    BYTE PTR [rbp-0x229],0x0
    329d:	lea    rdi,[rbp-0x3c0]
    32a4:	call   32a9 <__RNvMs_NtCslh91aX0c5fM_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x3249>
    32a9:	mov    BYTE PTR [rbp-0x2c0],0x0
    32b0:	mov    BYTE PTR [rbp-0x318],0x0
    32b7:	mov    BYTE PTR [rbp-0x33],0x0
    32bb:	mov    BYTE PTR [rbp-0x32],0x0
    32bf:	mov    BYTE PTR [rbp-0x31],0x0
    32c3:	mov    BYTE PTR [rbp-0x30],0x0
    32c7:	mov    BYTE PTR [rbp-0x2f],0x0
    32cb:	mov    BYTE PTR [rbp-0x2e],0x0
    32cf:	mov    BYTE PTR [rbp-0x2d],0x0
    32d3:	mov    BYTE PTR [rbp-0x2c],0x0
    32d7:	mov    BYTE PTR [rbp-0x2b],0x0
    32db:	mov    BYTE PTR [rbp-0x2a],0x0
    32df:	mov    BYTE PTR [rbp-0x29],0x0
    32e3:	mov    BYTE PTR [rbp-0x6b],0x0
    32e7:	mov    BYTE PTR [rbp-0x6a],0x0
    32eb:	mov    BYTE PTR [rbp-0x69],0x0
    32ef:	movzx  eax,BYTE PTR [rbp-0x2c0]
    32f6:	mov    BYTE PTR [rbp-0x34],al
    32f9:	movzx  eax,BYTE PTR [rbp-0x318]
    3300:	mov    BYTE PTR [rbp-0x53],al
    3303:	movzx  eax,BYTE PTR [rbp-0x33]
    3307:	mov    BYTE PTR [rbp-0x52],al
    330a:	movzx  eax,BYTE PTR [rbp-0x32]
    330e:	mov    BYTE PTR [rbp-0x51],al
    3311:	movzx  eax,BYTE PTR [rbp-0x31]
    3315:	mov    BYTE PTR [rbp-0x50],al
    3318:	movzx  eax,BYTE PTR [rbp-0x30]
    331c:	mov    BYTE PTR [rbp-0x4f],al
    331f:	movzx  eax,BYTE PTR [rbp-0x2f]
    3323:	mov    BYTE PTR [rbp-0x4e],al
    3326:	movzx  eax,BYTE PTR [rbp-0x2e]
    332a:	mov    BYTE PTR [rbp-0x4d],al
    332d:	movzx  eax,BYTE PTR [rbp-0x2d]
    3331:	mov    BYTE PTR [rbp-0x4c],al
    3334:	movzx  eax,BYTE PTR [rbp-0x2c]
    3338:	mov    BYTE PTR [rbp-0x4b],al
    333b:	movzx  eax,BYTE PTR [rbp-0x2b]
    333f:	mov    BYTE PTR [rbp-0x4a],al
    3342:	movzx  eax,BYTE PTR [rbp-0x2a]
    3346:	mov    BYTE PTR [rbp-0x49],al
    3349:	movzx  eax,BYTE PTR [rbp-0x29]
    334d:	mov    BYTE PTR [rbp-0x48],al
    3350:	movzx  eax,BYTE PTR [rbp-0x6b]
    3354:	mov    BYTE PTR [rbp-0x47],al
    3357:	movzx  eax,BYTE PTR [rbp-0x6a]
    335b:	mov    BYTE PTR [rbp-0x46],al
    335e:	movzx  eax,BYTE PTR [rbp-0x69]
    3362:	mov    BYTE PTR [rbp-0x45],al
    3365:	mov    BYTE PTR [rbp-0x2c0],0x0
    336c:	mov    BYTE PTR [rbp-0x318],0x0
    3373:	mov    BYTE PTR [rbp-0x33],0x0
    3377:	mov    BYTE PTR [rbp-0x32],0x0
    337b:	mov    BYTE PTR [rbp-0x31],0x0
    337f:	mov    BYTE PTR [rbp-0x30],0x0
    3383:	mov    BYTE PTR [rbp-0x2f],0x0
    3387:	mov    BYTE PTR [rbp-0x2e],0x0
    338b:	mov    BYTE PTR [rbp-0x2d],0x0
    338f:	mov    BYTE PTR [rbp-0x2c],0x0
    3393:	mov    BYTE PTR [rbp-0x2b],0x0
    3397:	mov    BYTE PTR [rbp-0x2a],0x0
    339b:	mov    BYTE PTR [rbp-0x29],0x0
    339f:	mov    BYTE PTR [rbp-0x6b],0x0
    33a3:	mov    BYTE PTR [rbp-0x6a],0x0
    33a7:	mov    BYTE PTR [rbp-0x69],0x0
    33ab:	movzx  eax,BYTE PTR [rbp-0x2c0]
    33b2:	mov    BYTE PTR [rbp-0x44],al
    33b5:	movzx  eax,BYTE PTR [rbp-0x318]
    33bc:	mov    BYTE PTR [rbp-0x43],al
    33bf:	movzx  eax,BYTE PTR [rbp-0x33]
    33c3:	mov    BYTE PTR [rbp-0x42],al
    33c6:	movzx  eax,BYTE PTR [rbp-0x32]
    33ca:	mov    BYTE PTR [rbp-0x41],al
    33cd:	movzx  eax,BYTE PTR [rbp-0x31]
    33d1:	mov    BYTE PTR [rbp-0x40],al
    33d4:	movzx  eax,BYTE PTR [rbp-0x30]
    33d8:	mov    BYTE PTR [rbp-0x3f],al
    33db:	movzx  eax,BYTE PTR [rbp-0x2f]
    33df:	mov    BYTE PTR [rbp-0x3e],al
    33e2:	movzx  eax,BYTE PTR [rbp-0x2e]
    33e6:	mov    BYTE PTR [rbp-0x3d],al
    33e9:	movzx  eax,BYTE PTR [rbp-0x2d]
    33ed:	mov    BYTE PTR [rbp-0x3c],al
    33f0:	movzx  eax,BYTE PTR [rbp-0x2c]
    33f4:	mov    BYTE PTR [rbp-0x3b],al
    33f7:	movzx  eax,BYTE PTR [rbp-0x2b]
    33fb:	mov    BYTE PTR [rbp-0x3a],al
    33fe:	movzx  eax,BYTE PTR [rbp-0x2a]
    3402:	mov    BYTE PTR [rbp-0x39],al
    3405:	movzx  eax,BYTE PTR [rbp-0x29]
    3409:	mov    BYTE PTR [rbp-0x38],al
    340c:	movzx  eax,BYTE PTR [rbp-0x6b]
    3410:	mov    BYTE PTR [rbp-0x37],al
    3413:	movzx  eax,BYTE PTR [rbp-0x6a]
    3417:	mov    BYTE PTR [rbp-0x36],al
    341a:	movzx  eax,BYTE PTR [rbp-0x69]
    341e:	mov    BYTE PTR [rbp-0x35],al
    3421:	xorps  xmm0,xmm0
    3424:	movaps XMMWORD PTR [rbp-0x2c0],xmm0
    342b:	mov    rax,QWORD PTR [rbp-0x2c0]
    3432:	mov    rcx,QWORD PTR [rbp-0x2b8]
    3439:	mov    rdx,QWORD PTR [rbp-0x2c8]
    3440:	mov    QWORD PTR [rdx+0x8],rcx
    3444:	mov    QWORD PTR [rdx],rax
    3447:	movaps XMMWORD PTR [rbp-0x2c0],xmm0
    344e:	mov    rax,QWORD PTR [rbp-0x2c0]
    3455:	mov    rcx,QWORD PTR [rbp-0x2b8]
    345c:	mov    QWORD PTR [rdx+0x18],rcx
    3460:	mov    QWORD PTR [rdx+0x10],rax
    3464:	mov    rdi,rbx
    3467:	call   346c <__RNvMs_NtCslh91aX0c5fM_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x340c>
    346c:	call   3471 <__RNvMs_NtCslh91aX0c5fM_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x3411>

Disassembly of section __TEXT.__gcc_except_tab:

0000000000003474 <GCC_except_table3>:
    3474:	call   FWORD PTR [rbx-0x66edfee7]
    347a:	push   rbp
    347b:	adc    eax,esi
    347d:	movsxd eax,DWORD PTR [rax]
    347f:	mov    ebp,0x688c0c64
    3484:	add    ecx,ecx
    3486:	fs enter 0x3,0x0
    348b:	jg     348d <GCC_except_table3+0x19>
    348d:	add    BYTE PTR [rax],al
    348f:	add    BYTE PTR [rax],al
    3491:	add    BYTE PTR [rax],al
	...

toyos_crypto-ada207717e69da99.d915y5stdy083w3ect8m04ymi.1lxn14p.rcgu.o:     file format mach-o-x86-64


Disassembly of section .text:

0000000000000000 <__RNvMs0_NtCslh91aX0c5fM_12toyos_crypto11scalar25519NtB5_12PublicScalar3naf>:
