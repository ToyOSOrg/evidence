000000000005adf0 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree>:
   5adf0:	push   rbp
   5adf1:	mov    rbp,rsp
   5adf4:	push   r15
   5adf6:	push   r14
   5adf8:	push   r13
   5adfa:	push   r12
   5adfc:	push   rbx
   5adfd:	sub    rsp,0x338
   5ae04:	mov    QWORD PTR [rbp-0x238],rsi
   5ae0b:	mov    QWORD PTR [rbp-0x2b8],rdi
   5ae12:	mov    BYTE PTR [rbp-0x2a],0x0
   5ae16:	mov    BYTE PTR [rbp-0x49],0x0
   5ae1a:	mov    BYTE PTR [rbp-0x48],0x0
   5ae1e:	mov    BYTE PTR [rbp-0x47],0x0
   5ae22:	mov    BYTE PTR [rbp-0x46],0x0
   5ae26:	mov    BYTE PTR [rbp-0x45],0x0
   5ae2a:	mov    BYTE PTR [rbp-0x44],0x0
   5ae2e:	mov    BYTE PTR [rbp-0x43],0x0
   5ae32:	mov    BYTE PTR [rbp-0x42],0x0
   5ae36:	mov    BYTE PTR [rbp-0x41],0x0
   5ae3a:	mov    BYTE PTR [rbp-0x40],0x0
   5ae3e:	mov    BYTE PTR [rbp-0x3f],0x0
   5ae42:	mov    BYTE PTR [rbp-0x3e],0x0
   5ae46:	mov    BYTE PTR [rbp-0x3d],0x0
   5ae4a:	mov    BYTE PTR [rbp-0x3c],0x0
   5ae4e:	mov    BYTE PTR [rbp-0x3b],0x0
   5ae52:	mov    BYTE PTR [rbp-0x3a],0x0
   5ae56:	mov    BYTE PTR [rbp-0x39],0x0
   5ae5a:	mov    BYTE PTR [rbp-0x38],0x0
   5ae5e:	mov    BYTE PTR [rbp-0x37],0x0
   5ae62:	mov    BYTE PTR [rbp-0x36],0x0
   5ae66:	mov    BYTE PTR [rbp-0x35],0x0
   5ae6a:	mov    BYTE PTR [rbp-0x34],0x0
   5ae6e:	mov    BYTE PTR [rbp-0x33],0x0
   5ae72:	mov    BYTE PTR [rbp-0x32],0x0
   5ae76:	mov    BYTE PTR [rbp-0x31],0x0
   5ae7a:	mov    BYTE PTR [rbp-0x30],0x0
   5ae7e:	mov    BYTE PTR [rbp-0x2f],0x0
   5ae82:	mov    BYTE PTR [rbp-0x2e],0x0
   5ae86:	mov    BYTE PTR [rbp-0x2d],0x0
   5ae8a:	mov    BYTE PTR [rbp-0x2c],0x0
   5ae8e:	mov    BYTE PTR [rbp-0x2b],0x0
   5ae92:	xorps  xmm0,xmm0
   5ae95:	movaps XMMWORD PTR [rbp-0xf0],xmm0
   5ae9c:	movaps XMMWORD PTR [rbp-0x100],xmm0
   5aea3:	mov    eax,0x8
   5aea8:	xor    esi,esi
   5aeaa:	nop    WORD PTR [rax+rax*1+0x0]
   5aeb0:	movzx  edi,BYTE PTR [rdx+rsi*1]
   5aeb4:	lea    ecx,[rax-0x8]
   5aeb7:	and    cl,0x30
   5aeba:	shl    rdi,cl
   5aebd:	mov    r8,rsi
   5aec0:	and    r8,0xfffffffffffffff8
   5aec4:	or     rdi,QWORD PTR [rbp+r8*1-0x100]
   5aecc:	mov    QWORD PTR [rbp+r8*1-0x100],rdi
   5aed4:	movzx  r9d,BYTE PTR [rdx+rsi*1+0x1]
   5aeda:	mov    ecx,eax
   5aedc:	and    cl,0x38
   5aedf:	shl    r9,cl
   5aee2:	or     r9,rdi
   5aee5:	mov    QWORD PTR [rbp+r8*1-0x100],r9
   5aeed:	add    rsi,0x2
   5aef1:	add    rax,0x10
   5aef5:	cmp    rsi,0x20
   5aef9:	jne    5aeb0 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0xc0>
   5aefb:	movaps xmm0,XMMWORD PTR [rbp-0x100]
   5af02:	movabs rax,0x7fffffffffffffff
   5af0c:	and    rax,QWORD PTR [rbp-0xe8]
   5af13:	mov    rcx,QWORD PTR [rbp-0xf0]
   5af1a:	movups XMMWORD PTR [rbp-0x318],xmm0
   5af21:	mov    QWORD PTR [rbp-0x308],rcx
   5af28:	mov    QWORD PTR [rbp-0x300],rax
   5af2f:	movups xmm0,XMMWORD PTR [rip+0xfffffffffffb489a]        # f7d0 <anon.1cac2b8f1dc05e889e5e3aad65707de3.6.llvm.9359192945983224198+0x776>
   5af36:	movaps XMMWORD PTR [rbp-0xf0],xmm0
   5af3d:	movups xmm1,XMMWORD PTR [rip+0xfffffffffffb487c]        # f7c0 <anon.1cac2b8f1dc05e889e5e3aad65707de3.6.llvm.9359192945983224198+0x766>
   5af44:	movaps XMMWORD PTR [rbp-0x100],xmm1
   5af4b:	xorps  xmm2,xmm2
   5af4e:	movaps XMMWORD PTR [rbp-0xe0],xmm2
   5af55:	movaps XMMWORD PTR [rbp-0xd0],xmm2
   5af5c:	movups xmm3,XMMWORD PTR [rbp-0x318]
   5af63:	movaps XMMWORD PTR [rbp-0xc0],xmm3
   5af6a:	movups xmm4,XMMWORD PTR [rbp-0x308]
   5af71:	movaps XMMWORD PTR [rbp-0xb0],xmm4
   5af78:	movaps XMMWORD PTR [rbp-0x180],xmm1
   5af7f:	movaps XMMWORD PTR [rbp-0x170],xmm0
   5af86:	movaps XMMWORD PTR [rbp-0x160],xmm2
   5af8d:	movaps XMMWORD PTR [rbp-0x150],xmm2
   5af94:	movaps XMMWORD PTR [rbp-0x140],xmm3
   5af9b:	movaps XMMWORD PTR [rbp-0x130],xmm4
   5afa2:	movaps XMMWORD PTR [rbp-0x120],xmm1
   5afa9:	movaps XMMWORD PTR [rbp-0x110],xmm0
   5afb0:	mov    r8d,0xfe
   5afb6:	xor    edi,edi
   5afb8:	jmp    5b015 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x225>
   5afba:	nop    WORD PTR [rax+rax*1+0x0]
   5afc0:	lea    rdi,[rbp-0x80]
   5afc4:	lea    rsi,[rbp-0x290]
   5afcb:	lea    rdx,[rbp-0x100]
   5afd2:	call   626e0 <_RNvNtNtCskXK3iuL6Usm_12toyos_crypto10field255197radix6412mul_portable>
   5afd7:	mov    rdi,QWORD PTR [rbp-0x1c0]
   5afde:	mov    r8,QWORD PTR [rbp-0x1b8]
   5afe5:	mov    rax,QWORD PTR [rbp-0x80]
   5afe9:	mov    rcx,QWORD PTR [rbp-0x78]
   5afed:	mov    rdx,QWORD PTR [rbp-0x70]
   5aff1:	lea    rsi,[rbp-0x160]
   5aff8:	mov    QWORD PTR [rsi+0x10],rdx
   5affc:	mov    rdx,QWORD PTR [rbp-0x68]
   5b000:	mov    QWORD PTR [rsi+0x18],rdx
   5b004:	mov    QWORD PTR [rsi],rax
   5b007:	mov    QWORD PTR [rsi+0x8],rcx
   5b00b:	add    r8,0xffffffffffffffff
   5b00f:	jae    5c854 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x1a64>
   5b015:	mov    rcx,rdi
   5b018:	mov    rax,r8
   5b01b:	shr    rax,0x3
   5b01f:	mov    rdx,QWORD PTR [rbp-0x238]
   5b026:	movzx  eax,BYTE PTR [rdx+rax*1]
   5b02a:	mov    QWORD PTR [rbp-0x1b8],r8
   5b031:	mov    edx,r8d
   5b034:	and    edx,0x7
   5b037:	xor    esi,esi
   5b039:	bt     eax,edx
   5b03c:	setb   sil
   5b040:	mov    QWORD PTR [rbp-0x1c0],rsi
   5b047:	xor    rcx,rsi
   5b04a:	neg    rcx
   5b04d:	mov    rsi,QWORD PTR [rbp-0x140]
   5b054:	mov    rdx,QWORD PTR [rbp-0x180]
   5b05b:	mov    rax,QWORD PTR [rbp-0x178]
   5b062:	mov    rdi,rsi
   5b065:	xor    rdi,rdx
   5b068:	and    rdi,rcx
   5b06b:	xor    rdx,rdi
   5b06e:	mov    QWORD PTR [rbp-0x180],rdx
   5b075:	xor    rdi,rsi
   5b078:	mov    QWORD PTR [rbp-0x140],rdi
   5b07f:	mov    rsi,QWORD PTR [rbp-0x138]
   5b086:	mov    rdi,rsi
   5b089:	xor    rdi,rax
   5b08c:	and    rdi,rcx
   5b08f:	xor    rax,rdi
   5b092:	mov    QWORD PTR [rbp-0x178],rax
   5b099:	xor    rdi,rsi
   5b09c:	mov    QWORD PTR [rbp-0x138],rdi
   5b0a3:	mov    rsi,QWORD PTR [rbp-0x170]
   5b0aa:	mov    rdi,QWORD PTR [rbp-0x130]
   5b0b1:	mov    r8,rdi
   5b0b4:	xor    r8,rsi
   5b0b7:	and    r8,rcx
   5b0ba:	xor    rsi,r8
   5b0bd:	mov    QWORD PTR [rbp-0x170],rsi
   5b0c4:	xor    r8,rdi
   5b0c7:	mov    QWORD PTR [rbp-0x130],r8
   5b0ce:	mov    r8,QWORD PTR [rbp-0x168]
   5b0d5:	mov    rdi,QWORD PTR [rbp-0x128]
   5b0dc:	mov    r9,rdi
   5b0df:	xor    r9,r8
   5b0e2:	and    r9,rcx
   5b0e5:	xor    r8,r9
   5b0e8:	mov    QWORD PTR [rbp-0x168],r8
   5b0ef:	xor    r9,rdi
   5b0f2:	mov    QWORD PTR [rbp-0x128],r9
   5b0f9:	mov    rdi,QWORD PTR [rbp-0x160]
   5b100:	mov    r9,QWORD PTR [rbp-0x120]
   5b107:	mov    r10,r9
   5b10a:	xor    r10,rdi
   5b10d:	and    r10,rcx
   5b110:	xor    rdi,r10
   5b113:	mov    QWORD PTR [rbp-0x160],rdi
   5b11a:	xor    r10,r9
   5b11d:	mov    QWORD PTR [rbp-0x120],r10
   5b124:	mov    r9,QWORD PTR [rbp-0x158]
   5b12b:	mov    r10,QWORD PTR [rbp-0x118]
   5b132:	mov    r11,r10
   5b135:	xor    r11,r9
   5b138:	and    r11,rcx
   5b13b:	xor    r9,r11
   5b13e:	mov    QWORD PTR [rbp-0x158],r9
   5b145:	xor    r11,r10
   5b148:	mov    QWORD PTR [rbp-0x118],r11
   5b14f:	mov    r10,QWORD PTR [rbp-0x150]
   5b156:	mov    r11,QWORD PTR [rbp-0x110]
   5b15d:	mov    rbx,r11
   5b160:	xor    rbx,r10
   5b163:	and    rbx,rcx
   5b166:	xor    r10,rbx
   5b169:	mov    QWORD PTR [rbp-0x150],r10
   5b170:	xor    rbx,r11
   5b173:	mov    QWORD PTR [rbp-0x110],rbx
   5b17a:	mov    r11,QWORD PTR [rbp-0x148]
   5b181:	mov    r14,QWORD PTR [rbp-0x108]
   5b188:	mov    rbx,r14
   5b18b:	xor    rbx,r11
   5b18e:	and    rbx,rcx
   5b191:	xor    r11,rbx
   5b194:	xor    rbx,r14
   5b197:	add    rdi,rdx
   5b19a:	adc    rax,0x0
   5b19e:	setb   cl
   5b1a1:	add    rax,r9
   5b1a4:	movzx  ecx,cl
   5b1a7:	adc    rcx,rsi
   5b1aa:	setb   dl
   5b1ad:	add    rcx,r10
   5b1b0:	movzx  edx,dl
   5b1b3:	adc    rdx,r8
   5b1b6:	mov    QWORD PTR [rbp-0x148],r11
   5b1bd:	mov    QWORD PTR [rbp-0x108],rbx
   5b1c4:	setb   sil
   5b1c8:	add    rdx,r11
   5b1cb:	movzx  esi,sil
   5b1cf:	adc    rsi,0x0
   5b1d3:	imul   rsi,rsi,0x26
   5b1d7:	add    rsi,rdi
   5b1da:	adc    rax,0x0
   5b1de:	adc    rcx,0x0
   5b1e2:	adc    rdx,0x0
   5b1e6:	setb   dil
   5b1ea:	movzx  edi,dil
   5b1ee:	imul   rdi,rdi,0x26
   5b1f2:	add    rsi,rdi
   5b1f5:	mov    QWORD PTR [rbp-0x2d8],rsi
   5b1fc:	mov    QWORD PTR [rbp-0x2d0],rax
   5b203:	mov    QWORD PTR [rbp-0x2c8],rcx
   5b20a:	mov    QWORD PTR [rbp-0x2c0],rdx
   5b211:	mov    rax,QWORD PTR [rip+0x6c638]        # c7850 <_DYNAMIC+0x120>
   5b218:	mov    eax,DWORD PTR [rax]
   5b21a:	test   eax,eax
   5b21c:	jns    5c7fa <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x1a0a>
   5b222:	not    eax
   5b224:	test   eax,0x820
   5b229:	jne    5b370 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x580>
   5b22f:	lea    r15,[rbp-0x2d8]
   5b236:	mov    rdx,QWORD PTR [r15]
   5b239:	mulx   rsi,rcx,QWORD PTR [r15+0x8]
   5b23f:	mulx   rdi,rbx,QWORD PTR [r15+0x10]
   5b245:	add    rsi,rbx
   5b248:	mulx   r8,rbx,QWORD PTR [r15+0x18]
   5b24e:	adc    rdi,rbx
   5b251:	adc    r8,0x0
   5b255:	mov    rdx,QWORD PTR [r15+0x8]
   5b259:	mulx   r14,rbx,QWORD PTR [r15+0x10]
   5b25f:	add    rdi,rbx
   5b262:	adc    r8,r14
   5b265:	mulx   r9,rbx,QWORD PTR [r15+0x18]
   5b26b:	adc    r9,0x0
   5b26f:	add    r8,rbx
   5b272:	adc    r9,0x0
   5b276:	mov    rdx,QWORD PTR [r15+0x10]
   5b27a:	mulx   r10,rbx,QWORD PTR [r15+0x18]
   5b280:	add    r9,rbx
   5b283:	adc    r10,0x0
   5b287:	xor    r11d,r11d
   5b28a:	add    rcx,rcx
   5b28d:	adc    rsi,rsi
   5b290:	adc    rdi,rdi
   5b293:	adc    r8,r8
   5b296:	adc    r9,r9
   5b299:	adc    r10,r10
   5b29c:	adc    r11,0x0
   5b2a0:	mov    rdx,QWORD PTR [r15]
   5b2a3:	mulx   r14,rax,rdx
   5b2a8:	add    rcx,r14
   5b2ab:	mov    rdx,QWORD PTR [r15+0x8]
   5b2af:	mulx   r14,rbx,rdx
   5b2b4:	adc    rsi,rbx
   5b2b7:	adc    rdi,r14
   5b2ba:	mov    rdx,QWORD PTR [r15+0x10]
   5b2be:	mulx   r14,rbx,rdx
   5b2c3:	adc    r8,rbx
   5b2c6:	adc    r9,r14
   5b2c9:	mov    rdx,QWORD PTR [r15+0x18]
   5b2cd:	mulx   r14,rbx,rdx
   5b2d2:	adc    r10,rbx
   5b2d5:	adc    r11,r14
   5b2d8:	mov    edx,0x26
   5b2dd:	xor    ebx,ebx
   5b2df:	mulx   r14,rbx,r8
   5b2e4:	adcx   rax,rbx
   5b2ea:	adox   rcx,r14
   5b2f0:	mulx   r14,rbx,r9
   5b2f5:	adcx   rcx,rbx
   5b2fb:	adox   rsi,r14
   5b301:	mulx   r14,rbx,r10
   5b306:	adcx   rsi,rbx
   5b30c:	adox   rdi,r14
   5b312:	mulx   r8,rbx,r11
   5b317:	adcx   rdi,rbx
   5b31d:	mov    ebx,0x0
   5b322:	adox   r8,rbx
   5b328:	adcx   r8,rbx
   5b32e:	imul   r8,r8,0x26
   5b332:	add    rax,r8
   5b335:	adc    rcx,0x0
   5b339:	adc    rsi,0x0
   5b33d:	adc    rdi,0x0
   5b341:	sbb    rbx,rbx
   5b344:	and    rbx,0x26
   5b348:	add    rax,rbx
   5b34b:	mov    QWORD PTR [rbp-0x200],rax
   5b352:	mov    QWORD PTR [rbp-0x1f8],rcx
   5b359:	mov    QWORD PTR [rbp-0x1f0],rsi
   5b360:	mov    QWORD PTR [rbp-0x1e8],rdi
   5b367:	jmp    5b383 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x593>
   5b369:	nop    DWORD PTR [rax+0x0]
   5b370:	lea    rdi,[rbp-0x200]
   5b377:	lea    rsi,[rbp-0x2d8]
   5b37e:	call   62930 <_RNvNtNtCskXK3iuL6Usm_12toyos_crypto10field255197radix6415square_portable>
   5b383:	mov    rcx,QWORD PTR [rbp-0x180]
   5b38a:	mov    rax,QWORD PTR [rbp-0x178]
   5b391:	sub    rcx,QWORD PTR [rbp-0x160]
   5b398:	mov    edx,0x0
   5b39d:	sbb    rdx,rdx
   5b3a0:	sub    rax,QWORD PTR [rbp-0x158]
   5b3a7:	mov    esi,0x0
   5b3ac:	sbb    rsi,rsi
   5b3af:	add    rax,rdx
   5b3b2:	adc    rsi,rdx
   5b3b5:	sar    rsi,0x3f
   5b3b9:	mov    rdx,QWORD PTR [rbp-0x170]
   5b3c0:	sub    rdx,QWORD PTR [rbp-0x150]
   5b3c7:	mov    edi,0x0
   5b3cc:	sbb    rdi,rdi
   5b3cf:	add    rdx,rsi
   5b3d2:	adc    rdi,rsi
   5b3d5:	sar    rdi,0x3f
   5b3d9:	mov    rsi,QWORD PTR [rbp-0x168]
   5b3e0:	sub    rsi,QWORD PTR [rbp-0x148]
   5b3e7:	mov    r8d,0x0
   5b3ed:	sbb    r8,r8
   5b3f0:	add    rsi,rdi
   5b3f3:	adc    r8,rdi
   5b3f6:	shr    r8,0x3f
   5b3fa:	imul   rdi,r8,0x26
   5b3fe:	sub    rcx,rdi
   5b401:	mov    edi,0x0
   5b406:	sbb    rdi,rdi
   5b409:	add    rax,rdi
   5b40c:	adc    rdi,0x0
   5b410:	sar    rdi,0x3f
   5b414:	add    rdx,rdi
   5b417:	adc    rdi,0x0
   5b41b:	sar    rdi,0x3f
   5b41f:	add    rsi,rdi
   5b422:	adc    rdi,0x0
   5b426:	shr    rdi,0x3f
   5b42a:	imul   rdi,rdi,0xffffffffffffffda
   5b42e:	add    rcx,rdi
   5b431:	mov    QWORD PTR [rbp-0x2f8],rcx
   5b438:	mov    QWORD PTR [rbp-0x2f0],rax
   5b43f:	mov    QWORD PTR [rbp-0x2e8],rdx
   5b446:	mov    QWORD PTR [rbp-0x2e0],rsi
   5b44d:	mov    rax,QWORD PTR [rip+0x6c3fc]        # c7850 <_DYNAMIC+0x120>
   5b454:	mov    eax,DWORD PTR [rax]
   5b456:	test   eax,eax
   5b458:	jns    5c804 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x1a14>
   5b45e:	not    eax
   5b460:	test   eax,0x820
   5b465:	jne    5b5b0 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x7c0>
   5b46b:	lea    r15,[rbp-0x2f8]
   5b472:	mov    rdx,QWORD PTR [r15]
   5b475:	mulx   rdi,r8,QWORD PTR [r15+0x8]
   5b47b:	mulx   rsi,rbx,QWORD PTR [r15+0x10]
   5b481:	add    rdi,rbx
   5b484:	mulx   rax,rbx,QWORD PTR [r15+0x18]
   5b48a:	adc    rsi,rbx
   5b48d:	adc    rax,0x0
   5b491:	mov    rdx,QWORD PTR [r15+0x8]
   5b495:	mulx   r14,rbx,QWORD PTR [r15+0x10]
   5b49b:	add    rsi,rbx
   5b49e:	adc    rax,r14
   5b4a1:	mulx   rcx,rbx,QWORD PTR [r15+0x18]
   5b4a7:	adc    rcx,0x0
   5b4ab:	add    rax,rbx
   5b4ae:	adc    rcx,0x0
   5b4b2:	mov    rdx,QWORD PTR [r15+0x10]
   5b4b6:	mulx   r10,rbx,QWORD PTR [r15+0x18]
   5b4bc:	add    rcx,rbx
   5b4bf:	adc    r10,0x0
   5b4c3:	xor    r11d,r11d
   5b4c6:	add    r8,r8
   5b4c9:	adc    rdi,rdi
   5b4cc:	adc    rsi,rsi
   5b4cf:	adc    rax,rax
   5b4d2:	adc    rcx,rcx
   5b4d5:	adc    r10,r10
   5b4d8:	adc    r11,0x0
   5b4dc:	mov    rdx,QWORD PTR [r15]
   5b4df:	mulx   r14,r9,rdx
   5b4e4:	add    r8,r14
   5b4e7:	mov    rdx,QWORD PTR [r15+0x8]
   5b4eb:	mulx   r14,rbx,rdx
   5b4f0:	adc    rdi,rbx
   5b4f3:	adc    rsi,r14
   5b4f6:	mov    rdx,QWORD PTR [r15+0x10]
   5b4fa:	mulx   r14,rbx,rdx
   5b4ff:	adc    rax,rbx
   5b502:	adc    rcx,r14
   5b505:	mov    rdx,QWORD PTR [r15+0x18]
   5b509:	mulx   r14,rbx,rdx
   5b50e:	adc    r10,rbx
   5b511:	adc    r11,r14
   5b514:	mov    edx,0x26
   5b519:	xor    ebx,ebx
   5b51b:	mulx   r14,rbx,rax
   5b520:	adcx   r9,rbx
   5b526:	adox   r8,r14
   5b52c:	mulx   r14,rbx,rcx
   5b531:	adcx   r8,rbx
   5b537:	adox   rdi,r14
   5b53d:	mulx   r14,rbx,r10
   5b542:	adcx   rdi,rbx
   5b548:	adox   rsi,r14
   5b54e:	mulx   rax,rbx,r11
   5b553:	adcx   rsi,rbx
   5b559:	mov    ebx,0x0
   5b55e:	adox   rax,rbx
   5b564:	adcx   rax,rbx
   5b56a:	imul   rax,rax,0x26
   5b56e:	add    r9,rax
   5b571:	adc    r8,0x0
   5b575:	adc    rdi,0x0
   5b579:	adc    rsi,0x0
   5b57d:	sbb    rbx,rbx
   5b580:	and    rbx,0x26
   5b584:	add    r9,rbx
   5b587:	mov    QWORD PTR [rbp-0x270],r9
   5b58e:	mov    QWORD PTR [rbp-0x268],r8
   5b595:	mov    QWORD PTR [rbp-0x260],rdi
   5b59c:	mov    QWORD PTR [rbp-0x258],rsi
   5b5a3:	jmp    5b5df <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x7ef>
   5b5a5:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   5b5b0:	lea    rdi,[rbp-0x270]
   5b5b7:	lea    rsi,[rbp-0x2f8]
   5b5be:	call   62930 <_RNvNtNtCskXK3iuL6Usm_12toyos_crypto10field255197radix6415square_portable>
   5b5c3:	mov    r9,QWORD PTR [rbp-0x270]
   5b5ca:	mov    r8,QWORD PTR [rbp-0x268]
   5b5d1:	mov    rdi,QWORD PTR [rbp-0x260]
   5b5d8:	mov    rsi,QWORD PTR [rbp-0x258]
   5b5df:	mov    rcx,QWORD PTR [rbp-0x200]
   5b5e6:	mov    rax,QWORD PTR [rbp-0x1f8]
   5b5ed:	sub    rcx,r9
   5b5f0:	mov    edx,0x0
   5b5f5:	sbb    rdx,rdx
   5b5f8:	sub    rax,r8
   5b5fb:	mov    r8d,0x0
   5b601:	sbb    r8,r8
   5b604:	add    rax,rdx
   5b607:	adc    r8,rdx
   5b60a:	sar    r8,0x3f
   5b60e:	mov    rdx,QWORD PTR [rbp-0x1f0]
   5b615:	sub    rdx,rdi
   5b618:	mov    r9d,0x0
   5b61e:	sbb    r9,r9
   5b621:	add    rdx,r8
   5b624:	adc    r9,r8
   5b627:	sar    r9,0x3f
   5b62b:	mov    rdi,QWORD PTR [rbp-0x1e8]
   5b632:	sub    rdi,rsi
   5b635:	mov    esi,0x0
   5b63a:	sbb    rsi,rsi
   5b63d:	add    rdi,r9
   5b640:	adc    rsi,r9
   5b643:	shr    rsi,0x3f
   5b647:	imul   rsi,rsi,0x26
   5b64b:	sub    rcx,rsi
   5b64e:	mov    esi,0x0
   5b653:	sbb    rsi,rsi
   5b656:	add    rax,rsi
   5b659:	adc    rsi,0x0
   5b65d:	sar    rsi,0x3f
   5b661:	add    rdx,rsi
   5b664:	adc    rsi,0x0
   5b668:	sar    rsi,0x3f
   5b66c:	add    rdi,rsi
   5b66f:	adc    rsi,0x0
   5b673:	shr    rsi,0x3f
   5b677:	imul   rsi,rsi,0xffffffffffffffda
   5b67b:	add    rcx,rsi
   5b67e:	mov    QWORD PTR [rbp-0x290],rcx
   5b685:	mov    QWORD PTR [rbp-0x288],rax
   5b68c:	mov    QWORD PTR [rbp-0x280],rdx
   5b693:	mov    r10,QWORD PTR [rbp-0x120]
   5b69a:	mov    rcx,QWORD PTR [rbp-0x140]
   5b6a1:	mov    rax,QWORD PTR [rbp-0x138]
   5b6a8:	mov    rbx,r10
   5b6ab:	add    rbx,rcx
   5b6ae:	mov    r11,QWORD PTR [rbp-0x118]
   5b6b5:	mov    rdx,QWORD PTR [rbp-0x130]
   5b6bc:	mov    r9,QWORD PTR [rbp-0x110]
   5b6c3:	mov    r14,r11
   5b6c6:	adc    r14,rax
   5b6c9:	mov    rsi,QWORD PTR [rbp-0x128]
   5b6d0:	mov    r15,r9
   5b6d3:	adc    r15,rdx
   5b6d6:	mov    r8,QWORD PTR [rbp-0x108]
   5b6dd:	mov    r12,r8
   5b6e0:	adc    r12,rsi
   5b6e3:	setb   r13b
   5b6e7:	movzx  r13d,r13b
   5b6eb:	imul   r13,r13,0x26
   5b6ef:	add    r13,rbx
   5b6f2:	adc    r14,0x0
   5b6f6:	adc    r15,0x0
   5b6fa:	mov    QWORD PTR [rbp-0x278],rdi
   5b701:	adc    r12,0x0
   5b705:	setb   dil
   5b709:	movzx  edi,dil
   5b70d:	imul   rdi,rdi,0x26
   5b711:	add    rdi,r13
   5b714:	mov    QWORD PTR [rbp-0x338],rdi
   5b71b:	mov    QWORD PTR [rbp-0x330],r14
   5b722:	mov    QWORD PTR [rbp-0x328],r15
   5b729:	mov    QWORD PTR [rbp-0x320],r12
   5b730:	sub    rcx,r10
   5b733:	mov    edi,0x0
   5b738:	sbb    rdi,rdi
   5b73b:	sub    rax,r11
   5b73e:	mov    r10d,0x0
   5b744:	sbb    r10,r10
   5b747:	add    rax,rdi
   5b74a:	adc    r10,rdi
   5b74d:	sar    r10,0x3f
   5b751:	sub    rdx,r9
   5b754:	mov    edi,0x0
   5b759:	sbb    rdi,rdi
   5b75c:	add    rdx,r10
   5b75f:	adc    rdi,r10
   5b762:	sar    rdi,0x3f
   5b766:	sub    rsi,r8
   5b769:	mov    r8d,0x0
   5b76f:	sbb    r8,r8
   5b772:	add    rsi,rdi
   5b775:	adc    r8,rdi
   5b778:	shr    r8,0x3f
   5b77c:	imul   rdi,r8,0x26
   5b780:	sub    rcx,rdi
   5b783:	mov    edi,0x0
   5b788:	sbb    rdi,rdi
   5b78b:	add    rax,rdi
   5b78e:	adc    rdi,0x0
   5b792:	sar    rdi,0x3f
   5b796:	add    rdx,rdi
   5b799:	adc    rdi,0x0
   5b79d:	sar    rdi,0x3f
   5b7a1:	add    rsi,rdi
   5b7a4:	adc    rdi,0x0
   5b7a8:	shr    rdi,0x3f
   5b7ac:	imul   rdi,rdi,0xffffffffffffffda
   5b7b0:	add    rcx,rdi
   5b7b3:	mov    QWORD PTR [rbp-0x358],rcx
   5b7ba:	mov    QWORD PTR [rbp-0x350],rax
   5b7c1:	mov    QWORD PTR [rbp-0x348],rdx
   5b7c8:	mov    QWORD PTR [rbp-0x340],rsi
   5b7cf:	mov    rax,QWORD PTR [rip+0x6c07a]        # c7850 <_DYNAMIC+0x120>
   5b7d6:	mov    eax,DWORD PTR [rax]
   5b7d8:	test   eax,eax
   5b7da:	jns    5c80e <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x1a1e>
   5b7e0:	not    eax
   5b7e2:	test   eax,0x820
   5b7e7:	jne    5b9c0 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0xbd0>
   5b7ed:	lea    r15,[rbp-0x2d8]
   5b7f4:	lea    r12,[rbp-0x358]
   5b7fb:	mov    rdx,QWORD PTR [r12]
   5b7ff:	mulx   rcx,rax,QWORD PTR [r15]
   5b804:	mulx   rsi,rbx,QWORD PTR [r15+0x8]
   5b80a:	add    rcx,rbx
   5b80d:	mulx   rdi,rbx,QWORD PTR [r15+0x10]
   5b813:	adc    rsi,rbx
   5b816:	mulx   r8,rbx,QWORD PTR [r15+0x18]
   5b81c:	adc    rdi,rbx
   5b81f:	adc    r8,0x0
   5b823:	mov    rdx,QWORD PTR [r12+0x8]
   5b828:	xor    ebx,ebx
   5b82a:	mulx   r14,rbx,QWORD PTR [r15]
   5b82f:	adcx   rcx,rbx
   5b835:	adox   rsi,r14
   5b83b:	mulx   r14,rbx,QWORD PTR [r15+0x8]
   5b841:	adcx   rsi,rbx
   5b847:	adox   rdi,r14
   5b84d:	mulx   r14,rbx,QWORD PTR [r15+0x10]
   5b853:	adcx   rdi,rbx
   5b859:	adox   r8,r14
   5b85f:	mulx   r9,rbx,QWORD PTR [r15+0x18]
   5b865:	adcx   r8,rbx
   5b86b:	mov    ebx,0x0
   5b870:	adox   r9,rbx
   5b876:	adcx   r9,rbx
   5b87c:	mov    rdx,QWORD PTR [r12+0x10]
   5b881:	xor    ebx,ebx
   5b883:	mulx   r14,rbx,QWORD PTR [r15]
   5b888:	adcx   rsi,rbx
   5b88e:	adox   rdi,r14
   5b894:	mulx   r14,rbx,QWORD PTR [r15+0x8]
   5b89a:	adcx   rdi,rbx
   5b8a0:	adox   r8,r14
   5b8a6:	mulx   r14,rbx,QWORD PTR [r15+0x10]
   5b8ac:	adcx   r8,rbx
   5b8b2:	adox   r9,r14
   5b8b8:	mulx   r10,rbx,QWORD PTR [r15+0x18]
   5b8be:	adcx   r9,rbx
   5b8c4:	mov    ebx,0x0
   5b8c9:	adox   r10,rbx
   5b8cf:	adcx   r10,rbx
   5b8d5:	mov    rdx,QWORD PTR [r12+0x18]
   5b8da:	xor    ebx,ebx
   5b8dc:	mulx   r14,rbx,QWORD PTR [r15]
   5b8e1:	adcx   rdi,rbx
   5b8e7:	adox   r8,r14
   5b8ed:	mulx   r14,rbx,QWORD PTR [r15+0x8]
   5b8f3:	adcx   r8,rbx
   5b8f9:	adox   r9,r14
   5b8ff:	mulx   r14,rbx,QWORD PTR [r15+0x10]
   5b905:	adcx   r9,rbx
   5b90b:	adox   r10,r14
   5b911:	mulx   r11,rbx,QWORD PTR [r15+0x18]
   5b917:	adcx   r10,rbx
   5b91d:	mov    ebx,0x0
   5b922:	adox   r11,rbx
   5b928:	adcx   r11,rbx
   5b92e:	mov    edx,0x26
   5b933:	xor    ebx,ebx
   5b935:	mulx   r14,rbx,r8
   5b93a:	adcx   rax,rbx
   5b940:	adox   rcx,r14
   5b946:	mulx   r14,rbx,r9
   5b94b:	adcx   rcx,rbx
   5b951:	adox   rsi,r14
   5b957:	mulx   r14,rbx,r10
   5b95c:	adcx   rsi,rbx
   5b962:	adox   rdi,r14
   5b968:	mulx   r8,rbx,r11
   5b96d:	adcx   rdi,rbx
   5b973:	mov    ebx,0x0
   5b978:	adox   r8,rbx
   5b97e:	adcx   r8,rbx
   5b984:	imul   r8,r8,0x26
   5b988:	add    rax,r8
   5b98b:	adc    rcx,0x0
   5b98f:	adc    rsi,0x0
   5b993:	adc    rdi,0x0
   5b997:	sbb    rbx,rbx
   5b99a:	and    rbx,0x26
   5b99e:	add    rax,rbx
   5b9a1:	mov    QWORD PTR [rbp-0x2b0],rax
   5b9a8:	mov    QWORD PTR [rbp-0x2a8],rcx
   5b9af:	mov    QWORD PTR [rbp-0x2a0],rsi
   5b9b6:	mov    QWORD PTR [rbp-0x298],rdi
   5b9bd:	jmp    5b9da <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0xbea>
   5b9bf:	nop
   5b9c0:	lea    rdi,[rbp-0x2b0]
   5b9c7:	lea    rsi,[rbp-0x358]
   5b9ce:	lea    rdx,[rbp-0x2d8]
   5b9d5:	call   626e0 <_RNvNtNtCskXK3iuL6Usm_12toyos_crypto10field255197radix6412mul_portable>
   5b9da:	mov    rax,QWORD PTR [rip+0x6be6f]        # c7850 <_DYNAMIC+0x120>
   5b9e1:	mov    eax,DWORD PTR [rax]
   5b9e3:	test   eax,eax
   5b9e5:	jns    5c818 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x1a28>
   5b9eb:	not    eax
   5b9ed:	test   eax,0x820
   5b9f2:	jne    5bbe0 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0xdf0>
   5b9f8:	lea    r10,[rbp-0x2f8]
   5b9ff:	lea    r11,[rbp-0x338]
   5ba06:	mov    rdx,QWORD PTR [r11]
   5ba09:	mulx   r15,r14,QWORD PTR [r10]
   5ba0e:	mulx   r13,r8,QWORD PTR [r10+0x8]
   5ba14:	add    r15,r8
   5ba17:	mulx   rbx,r8,QWORD PTR [r10+0x10]
   5ba1d:	adc    r13,r8
   5ba20:	mulx   rax,r8,QWORD PTR [r10+0x18]
   5ba26:	adc    rbx,r8
   5ba29:	adc    rax,0x0
   5ba2d:	mov    rdx,QWORD PTR [r11+0x8]
   5ba31:	xor    r8d,r8d
   5ba34:	mulx   r9,r8,QWORD PTR [r10]
   5ba39:	adcx   r15,r8
   5ba3f:	adox   r13,r9
   5ba45:	mulx   r9,r8,QWORD PTR [r10+0x8]
   5ba4b:	adcx   r13,r8
   5ba51:	adox   rbx,r9
   5ba57:	mulx   r9,r8,QWORD PTR [r10+0x10]
   5ba5d:	adcx   rbx,r8
   5ba63:	adox   rax,r9
   5ba69:	mulx   rcx,r8,QWORD PTR [r10+0x18]
   5ba6f:	adcx   rax,r8
   5ba75:	mov    r8d,0x0
   5ba7b:	adox   rcx,r8
   5ba81:	adcx   rcx,r8
   5ba87:	mov    rdx,QWORD PTR [r11+0x10]
   5ba8b:	xor    r8d,r8d
   5ba8e:	mulx   r9,r8,QWORD PTR [r10]
   5ba93:	adcx   r13,r8
   5ba99:	adox   rbx,r9
   5ba9f:	mulx   r9,r8,QWORD PTR [r10+0x8]
   5baa5:	adcx   rbx,r8
   5baab:	adox   rax,r9
   5bab1:	mulx   r9,r8,QWORD PTR [r10+0x10]
   5bab7:	adcx   rax,r8
   5babd:	adox   rcx,r9
   5bac3:	mulx   rsi,r8,QWORD PTR [r10+0x18]
   5bac9:	adcx   rcx,r8
   5bacf:	mov    r8d,0x0
   5bad5:	adox   rsi,r8
   5badb:	adcx   rsi,r8
   5bae1:	mov    rdx,QWORD PTR [r11+0x18]
   5bae5:	xor    r8d,r8d
   5bae8:	mulx   r9,r8,QWORD PTR [r10]
   5baed:	adcx   rbx,r8
   5baf3:	adox   rax,r9
   5baf9:	mulx   r9,r8,QWORD PTR [r10+0x8]
   5baff:	adcx   rax,r8
   5bb05:	adox   rcx,r9
   5bb0b:	mulx   r9,r8,QWORD PTR [r10+0x10]
   5bb11:	adcx   rcx,r8
   5bb17:	adox   rsi,r9
   5bb1d:	mulx   rdi,r8,QWORD PTR [r10+0x18]
   5bb23:	adcx   rsi,r8
   5bb29:	mov    r8d,0x0
   5bb2f:	adox   rdi,r8
   5bb35:	adcx   rdi,r8
   5bb3b:	mov    edx,0x26
   5bb40:	xor    r8d,r8d
   5bb43:	mulx   r9,r8,rax
   5bb48:	adcx   r14,r8
   5bb4e:	adox   r15,r9
   5bb54:	mulx   r9,r8,rcx
   5bb59:	adcx   r15,r8
   5bb5f:	adox   r13,r9
   5bb65:	mulx   r9,r8,rsi
   5bb6a:	adcx   r13,r8
   5bb70:	adox   rbx,r9
   5bb76:	mulx   rax,r8,rdi
   5bb7b:	adcx   rbx,r8
   5bb81:	mov    r8d,0x0
   5bb87:	adox   rax,r8
   5bb8d:	adcx   rax,r8
   5bb93:	imul   rax,rax,0x26
   5bb97:	add    r14,rax
   5bb9a:	adc    r15,0x0
   5bb9e:	adc    r13,0x0
   5bba2:	adc    rbx,0x0
   5bba6:	sbb    r8,r8
   5bba9:	and    r8,0x26
   5bbad:	add    r14,r8
   5bbb0:	mov    rax,r14
   5bbb3:	mov    QWORD PTR [rbp-0x1e0],r14
   5bbba:	mov    QWORD PTR [rbp-0x1d8],r15
   5bbc1:	mov    QWORD PTR [rbp-0x1d0],r13
   5bbc8:	mov    QWORD PTR [rbp-0x1c8],rbx
   5bbcf:	jmp    5bc16 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0xe26>
   5bbd1:	data16 data16 data16 data16 data16 cs nop WORD PTR [rax+rax*1+0x0]
   5bbe0:	lea    rdi,[rbp-0x1e0]
   5bbe7:	lea    rsi,[rbp-0x338]
   5bbee:	lea    rdx,[rbp-0x2f8]
   5bbf5:	call   626e0 <_RNvNtNtCskXK3iuL6Usm_12toyos_crypto10field255197radix6412mul_portable>
   5bbfa:	mov    rax,QWORD PTR [rbp-0x1e0]
   5bc01:	mov    r15,QWORD PTR [rbp-0x1d8]
   5bc08:	mov    r13,QWORD PTR [rbp-0x1d0]
   5bc0f:	mov    rbx,QWORD PTR [rbp-0x1c8]
   5bc16:	mov    r12,QWORD PTR [rbp-0x2b0]
   5bc1d:	mov    r14,QWORD PTR [rbp-0x2a8]
   5bc24:	mov    QWORD PTR [rbp-0x240],rax
   5bc2b:	add    rax,r12
   5bc2e:	mov    QWORD PTR [rbp-0x248],r15
   5bc35:	mov    rcx,r15
   5bc38:	adc    rcx,r14
   5bc3b:	mov    r15,QWORD PTR [rbp-0x2a0]
   5bc42:	mov    QWORD PTR [rbp-0x250],r13
   5bc49:	mov    rdx,r13
   5bc4c:	adc    rdx,r15
   5bc4f:	mov    r13,QWORD PTR [rbp-0x298]
   5bc56:	mov    rsi,rbx
   5bc59:	adc    rsi,r13
   5bc5c:	setb   dil
   5bc60:	movzx  edi,dil
   5bc64:	imul   rdi,rdi,0x26
   5bc68:	add    rdi,rax
   5bc6b:	adc    rcx,0x0
   5bc6f:	adc    rdx,0x0
   5bc73:	adc    rsi,0x0
   5bc77:	setb   al
   5bc7a:	movzx  eax,al
   5bc7d:	imul   rax,rax,0x26
   5bc81:	add    rax,rdi
   5bc84:	mov    QWORD PTR [rbp-0x100],rax
   5bc8b:	mov    QWORD PTR [rbp-0xf8],rcx
   5bc92:	mov    QWORD PTR [rbp-0xf0],rdx
   5bc99:	mov    QWORD PTR [rbp-0xe8],rsi
   5bca0:	mov    rax,QWORD PTR [rip+0x6bba9]        # c7850 <_DYNAMIC+0x120>
   5bca7:	mov    eax,DWORD PTR [rax]
   5bca9:	test   eax,eax
   5bcab:	jns    5c822 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x1a32>
   5bcb1:	not    eax
   5bcb3:	test   eax,0x820
   5bcb8:	jne    5be40 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x1050>
   5bcbe:	lea    rsi,[rbp-0x100]
   5bcc5:	mov    QWORD PTR [rbp-0x228],rbx
   5bccc:	mov    QWORD PTR [rbp-0x218],r12
   5bcd3:	mov    QWORD PTR [rbp-0x208],r14
   5bcda:	mov    rdx,QWORD PTR [rsi]
   5bcdd:	mulx   r12,r14,QWORD PTR [rsi+0x8]
   5bce3:	mulx   rcx,rbx,QWORD PTR [rsi+0x10]
   5bce9:	add    r12,rbx
   5bcec:	mulx   r8,rbx,QWORD PTR [rsi+0x18]
   5bcf2:	adc    rcx,rbx
   5bcf5:	adc    r8,0x0
   5bcf9:	mov    rdx,QWORD PTR [rsi+0x8]
   5bcfd:	mulx   rdi,rbx,QWORD PTR [rsi+0x10]
   5bd03:	add    rcx,rbx
   5bd06:	adc    r8,rdi
   5bd09:	mulx   r9,rbx,QWORD PTR [rsi+0x18]
   5bd0f:	adc    r9,0x0
   5bd13:	add    r8,rbx
   5bd16:	adc    r9,0x0
   5bd1a:	mov    rdx,QWORD PTR [rsi+0x10]
   5bd1e:	mulx   r10,rbx,QWORD PTR [rsi+0x18]
   5bd24:	add    r9,rbx
   5bd27:	adc    r10,0x0
   5bd2b:	xor    r11d,r11d
   5bd2e:	add    r14,r14
   5bd31:	adc    r12,r12
   5bd34:	adc    rcx,rcx
   5bd37:	adc    r8,r8
   5bd3a:	adc    r9,r9
   5bd3d:	adc    r10,r10
   5bd40:	adc    r11,0x0
   5bd44:	mov    rdx,QWORD PTR [rsi]
   5bd47:	mulx   rdi,rax,rdx
   5bd4c:	add    r14,rdi
   5bd4f:	mov    rdx,QWORD PTR [rsi+0x8]
   5bd53:	mulx   rdi,rbx,rdx
   5bd58:	adc    r12,rbx
   5bd5b:	adc    rcx,rdi
   5bd5e:	mov    rdx,QWORD PTR [rsi+0x10]
   5bd62:	mulx   rdi,rbx,rdx
   5bd67:	adc    r8,rbx
   5bd6a:	adc    r9,rdi
   5bd6d:	mov    rdx,QWORD PTR [rsi+0x18]
   5bd71:	mulx   rdi,rbx,rdx
   5bd76:	adc    r10,rbx
   5bd79:	adc    r11,rdi
   5bd7c:	mov    edx,0x26
   5bd81:	xor    ebx,ebx
   5bd83:	mulx   rdi,rbx,r8
   5bd88:	adcx   rax,rbx
   5bd8e:	adox   r14,rdi
   5bd94:	mulx   rdi,rbx,r9
   5bd99:	adcx   r14,rbx
   5bd9f:	adox   r12,rdi
   5bda5:	mulx   rdi,rbx,r10
   5bdaa:	adcx   r12,rbx
   5bdb0:	adox   rcx,rdi
   5bdb6:	mulx   r8,rbx,r11
   5bdbb:	adcx   rcx,rbx
   5bdc1:	mov    ebx,0x0
   5bdc6:	adox   r8,rbx
   5bdcc:	adcx   r8,rbx
   5bdd2:	imul   r8,r8,0x26
   5bdd6:	add    rax,r8
   5bdd9:	adc    r14,0x0
   5bddd:	adc    r12,0x0
   5bde1:	adc    rcx,0x0
   5bde5:	sbb    rbx,rbx
   5bde8:	and    rbx,0x26
   5bdec:	add    rax,rbx
   5bdef:	mov    QWORD PTR [rbp-0x210],r14
   5bdf6:	mov    r14,QWORD PTR [rbp-0x208]
   5bdfd:	mov    QWORD PTR [rbp-0x220],r12
   5be04:	mov    r12,QWORD PTR [rbp-0x218]
   5be0b:	mov    QWORD PTR [rbp-0x230],rcx
   5be12:	mov    rbx,QWORD PTR [rbp-0x228]
   5be19:	mov    QWORD PTR [rbp-0x80],rax
   5be1d:	mov    rax,QWORD PTR [rbp-0x210]
   5be24:	mov    QWORD PTR [rbp-0x78],rax
   5be28:	mov    rax,QWORD PTR [rbp-0x220]
   5be2f:	mov    QWORD PTR [rbp-0x70],rax
   5be33:	mov    rax,QWORD PTR [rbp-0x230]
   5be3a:	mov    QWORD PTR [rbp-0x68],rax
   5be3e:	jmp    5be50 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x1060>
   5be40:	lea    rdi,[rbp-0x80]
   5be44:	lea    rsi,[rbp-0x100]
   5be4b:	call   62930 <_RNvNtNtCskXK3iuL6Usm_12toyos_crypto10field255197radix6415square_portable>
   5be50:	mov    rax,QWORD PTR [rbp-0x80]
   5be54:	mov    rcx,QWORD PTR [rbp-0x78]
   5be58:	mov    rdx,QWORD PTR [rbp-0x70]
   5be5c:	lea    rsi,[rbp-0x160]
   5be63:	mov    QWORD PTR [rsi+0x30],rdx
   5be67:	mov    rdx,QWORD PTR [rbp-0x68]
   5be6b:	mov    QWORD PTR [rsi+0x38],rdx
   5be6f:	mov    QWORD PTR [rsi+0x20],rax
   5be73:	mov    QWORD PTR [rsi+0x28],rcx
   5be77:	sub    r12,QWORD PTR [rbp-0x240]
   5be7e:	mov    eax,0x0
   5be83:	sbb    rax,rax
   5be86:	sub    r14,QWORD PTR [rbp-0x248]
   5be8d:	mov    ecx,0x0
   5be92:	sbb    rcx,rcx
   5be95:	add    r14,rax
   5be98:	adc    rcx,rax
   5be9b:	sar    rcx,0x3f
   5be9f:	sub    r15,QWORD PTR [rbp-0x250]
   5bea6:	mov    eax,0x0
   5beab:	sbb    rax,rax
   5beae:	add    r15,rcx
   5beb1:	adc    rax,rcx
   5beb4:	sar    rax,0x3f
   5beb8:	sub    r13,rbx
   5bebb:	mov    ecx,0x0
   5bec0:	sbb    rcx,rcx
   5bec3:	add    r13,rax
   5bec6:	adc    rcx,rax
   5bec9:	shr    rcx,0x3f
   5becd:	imul   rax,rcx,0x26
   5bed1:	sub    r12,rax
   5bed4:	mov    eax,0x0
   5bed9:	sbb    rax,rax
   5bedc:	add    r14,rax
   5bedf:	adc    rax,0x0
   5bee3:	sar    rax,0x3f
   5bee7:	add    r15,rax
   5beea:	adc    rax,0x0
   5beee:	sar    rax,0x3f
   5bef2:	add    r13,rax
   5bef5:	adc    rax,0x0
   5bef9:	shr    rax,0x3f
   5befd:	imul   rax,rax,0xffffffffffffffda
   5bf01:	add    rax,r12
   5bf04:	mov    QWORD PTR [rbp-0x100],rax
   5bf0b:	mov    QWORD PTR [rbp-0xf8],r14
   5bf12:	mov    QWORD PTR [rbp-0xf0],r15
   5bf19:	mov    QWORD PTR [rbp-0xe8],r13
   5bf20:	mov    rax,QWORD PTR [rip+0x6b929]        # c7850 <_DYNAMIC+0x120>
   5bf27:	mov    eax,DWORD PTR [rax]
   5bf29:	test   eax,eax
   5bf2b:	jns    5c82c <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x1a3c>
   5bf31:	not    eax
   5bf33:	test   eax,0x820
   5bf38:	jne    5c070 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x1280>
   5bf3e:	lea    r15,[rbp-0x100]
   5bf45:	mov    rdx,QWORD PTR [r15]
   5bf48:	mulx   rsi,rcx,QWORD PTR [r15+0x8]
   5bf4e:	mulx   rdi,rbx,QWORD PTR [r15+0x10]
   5bf54:	add    rsi,rbx
   5bf57:	mulx   r8,rbx,QWORD PTR [r15+0x18]
   5bf5d:	adc    rdi,rbx
   5bf60:	adc    r8,0x0
   5bf64:	mov    rdx,QWORD PTR [r15+0x8]
   5bf68:	mulx   r14,rbx,QWORD PTR [r15+0x10]
   5bf6e:	add    rdi,rbx
   5bf71:	adc    r8,r14
   5bf74:	mulx   r9,rbx,QWORD PTR [r15+0x18]
   5bf7a:	adc    r9,0x0
   5bf7e:	add    r8,rbx
   5bf81:	adc    r9,0x0
   5bf85:	mov    rdx,QWORD PTR [r15+0x10]
   5bf89:	mulx   r10,rbx,QWORD PTR [r15+0x18]
   5bf8f:	add    r9,rbx
   5bf92:	adc    r10,0x0
   5bf96:	xor    r11d,r11d
   5bf99:	add    rcx,rcx
   5bf9c:	adc    rsi,rsi
   5bf9f:	adc    rdi,rdi
   5bfa2:	adc    r8,r8
   5bfa5:	adc    r9,r9
   5bfa8:	adc    r10,r10
   5bfab:	adc    r11,0x0
   5bfaf:	mov    rdx,QWORD PTR [r15]
   5bfb2:	mulx   r14,rax,rdx
   5bfb7:	add    rcx,r14
   5bfba:	mov    rdx,QWORD PTR [r15+0x8]
   5bfbe:	mulx   r14,rbx,rdx
   5bfc3:	adc    rsi,rbx
   5bfc6:	adc    rdi,r14
   5bfc9:	mov    rdx,QWORD PTR [r15+0x10]
   5bfcd:	mulx   r14,rbx,rdx
   5bfd2:	adc    r8,rbx
   5bfd5:	adc    r9,r14
   5bfd8:	mov    rdx,QWORD PTR [r15+0x18]
   5bfdc:	mulx   r14,rbx,rdx
   5bfe1:	adc    r10,rbx
   5bfe4:	adc    r11,r14
   5bfe7:	mov    edx,0x26
   5bfec:	xor    ebx,ebx
   5bfee:	mulx   r14,rbx,r8
   5bff3:	adcx   rax,rbx
   5bff9:	adox   rcx,r14
   5bfff:	mulx   r14,rbx,r9
   5c004:	adcx   rcx,rbx
   5c00a:	adox   rsi,r14
   5c010:	mulx   r14,rbx,r10
   5c015:	adcx   rsi,rbx
   5c01b:	adox   rdi,r14
   5c021:	mulx   r8,rbx,r11
   5c026:	adcx   rdi,rbx
   5c02c:	mov    ebx,0x0
   5c031:	adox   r8,rbx
   5c037:	adcx   r8,rbx
   5c03d:	imul   r8,r8,0x26
   5c041:	add    rax,r8
   5c044:	adc    rcx,0x0
   5c048:	adc    rsi,0x0
   5c04c:	adc    rdi,0x0
   5c050:	sbb    rbx,rbx
   5c053:	and    rbx,0x26
   5c057:	add    rax,rbx
   5c05a:	mov    QWORD PTR [rbp-0x80],rax
   5c05e:	mov    QWORD PTR [rbp-0x78],rcx
   5c062:	mov    QWORD PTR [rbp-0x70],rsi
   5c066:	mov    QWORD PTR [rbp-0x68],rdi
   5c06a:	jmp    5c080 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x1290>
   5c06c:	nop    DWORD PTR [rax+0x0]
   5c070:	lea    rdi,[rbp-0x80]
   5c074:	lea    rsi,[rbp-0x100]
   5c07b:	call   62930 <_RNvNtNtCskXK3iuL6Usm_12toyos_crypto10field255197radix6415square_portable>
   5c080:	mov    rax,QWORD PTR [rip+0x6b7c9]        # c7850 <_DYNAMIC+0x120>
   5c087:	mov    eax,DWORD PTR [rax]
   5c089:	test   eax,eax
   5c08b:	jns    5c836 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x1a46>
   5c091:	not    eax
   5c093:	test   eax,0x820
   5c098:	jne    5c280 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x1490>
   5c09e:	lea    r15,[rbp-0x318]
   5c0a5:	lea    r12,[rbp-0x80]
   5c0a9:	mov    rdx,QWORD PTR [r15]
   5c0ac:	mulx   rcx,rax,QWORD PTR [r12]
   5c0b2:	mulx   rsi,rbx,QWORD PTR [r12+0x8]
   5c0b9:	add    rcx,rbx
   5c0bc:	mulx   rdi,rbx,QWORD PTR [r12+0x10]
   5c0c3:	adc    rsi,rbx
   5c0c6:	mulx   r8,rbx,QWORD PTR [r12+0x18]
   5c0cd:	adc    rdi,rbx
   5c0d0:	adc    r8,0x0
   5c0d4:	mov    rdx,QWORD PTR [r15+0x8]
   5c0d8:	xor    ebx,ebx
   5c0da:	mulx   r14,rbx,QWORD PTR [r12]
   5c0e0:	adcx   rcx,rbx
   5c0e6:	adox   rsi,r14
   5c0ec:	mulx   r14,rbx,QWORD PTR [r12+0x8]
   5c0f3:	adcx   rsi,rbx
   5c0f9:	adox   rdi,r14
   5c0ff:	mulx   r14,rbx,QWORD PTR [r12+0x10]
   5c106:	adcx   rdi,rbx
   5c10c:	adox   r8,r14
   5c112:	mulx   r9,rbx,QWORD PTR [r12+0x18]
   5c119:	adcx   r8,rbx
   5c11f:	mov    ebx,0x0
   5c124:	adox   r9,rbx
   5c12a:	adcx   r9,rbx
   5c130:	mov    rdx,QWORD PTR [r15+0x10]
   5c134:	xor    ebx,ebx
   5c136:	mulx   r14,rbx,QWORD PTR [r12]
   5c13c:	adcx   rsi,rbx
   5c142:	adox   rdi,r14
   5c148:	mulx   r14,rbx,QWORD PTR [r12+0x8]
   5c14f:	adcx   rdi,rbx
   5c155:	adox   r8,r14
   5c15b:	mulx   r14,rbx,QWORD PTR [r12+0x10]
   5c162:	adcx   r8,rbx
   5c168:	adox   r9,r14
   5c16e:	mulx   r10,rbx,QWORD PTR [r12+0x18]
   5c175:	adcx   r9,rbx
   5c17b:	mov    ebx,0x0
   5c180:	adox   r10,rbx
   5c186:	adcx   r10,rbx
   5c18c:	mov    rdx,QWORD PTR [r15+0x18]
   5c190:	xor    ebx,ebx
   5c192:	mulx   r14,rbx,QWORD PTR [r12]
   5c198:	adcx   rdi,rbx
   5c19e:	adox   r8,r14
   5c1a4:	mulx   r14,rbx,QWORD PTR [r12+0x8]
   5c1ab:	adcx   r8,rbx
   5c1b1:	adox   r9,r14
   5c1b7:	mulx   r14,rbx,QWORD PTR [r12+0x10]
   5c1be:	adcx   r9,rbx
   5c1c4:	adox   r10,r14
   5c1ca:	mulx   r11,rbx,QWORD PTR [r12+0x18]
   5c1d1:	adcx   r10,rbx
   5c1d7:	mov    ebx,0x0
   5c1dc:	adox   r11,rbx
   5c1e2:	adcx   r11,rbx
   5c1e8:	mov    edx,0x26
   5c1ed:	xor    ebx,ebx
   5c1ef:	mulx   r14,rbx,r8
   5c1f4:	adcx   rax,rbx
   5c1fa:	adox   rcx,r14
   5c200:	mulx   r14,rbx,r9
   5c205:	adcx   rcx,rbx
   5c20b:	adox   rsi,r14
   5c211:	mulx   r14,rbx,r10
   5c216:	adcx   rsi,rbx
   5c21c:	adox   rdi,r14
   5c222:	mulx   r8,rbx,r11
   5c227:	adcx   rdi,rbx
   5c22d:	mov    ebx,0x0
   5c232:	adox   r8,rbx
   5c238:	adcx   r8,rbx
   5c23e:	imul   r8,r8,0x26
   5c242:	add    rax,r8
   5c245:	adc    rcx,0x0
   5c249:	adc    rsi,0x0
   5c24d:	adc    rdi,0x0
   5c251:	sbb    rbx,rbx
   5c254:	and    rbx,0x26
   5c258:	add    rax,rbx
   5c25b:	mov    QWORD PTR [rbp-0x1b0],rax
   5c262:	mov    QWORD PTR [rbp-0x1a8],rcx
   5c269:	mov    QWORD PTR [rbp-0x1a0],rsi
   5c270:	mov    QWORD PTR [rbp-0x198],rdi
   5c277:	jmp    5c297 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x14a7>
   5c279:	nop    DWORD PTR [rax+0x0]
   5c280:	lea    rdi,[rbp-0x1b0]
   5c287:	lea    rsi,[rbp-0x318]
   5c28e:	lea    rdx,[rbp-0x80]
   5c292:	call   626e0 <_RNvNtNtCskXK3iuL6Usm_12toyos_crypto10field255197radix6412mul_portable>
   5c297:	mov    rax,QWORD PTR [rbp-0x1b0]
   5c29e:	mov    rcx,QWORD PTR [rbp-0x1a8]
   5c2a5:	mov    rdx,QWORD PTR [rbp-0x1a0]
   5c2ac:	lea    rsi,[rbp-0x160]
   5c2b3:	mov    QWORD PTR [rsi+0x50],rdx
   5c2b7:	mov    rdx,QWORD PTR [rbp-0x198]
   5c2be:	mov    QWORD PTR [rsi+0x58],rdx
   5c2c2:	mov    QWORD PTR [rsi+0x40],rax
   5c2c6:	mov    QWORD PTR [rsi+0x48],rcx
   5c2ca:	mov    rax,QWORD PTR [rip+0x6b57f]        # c7850 <_DYNAMIC+0x120>
   5c2d1:	mov    eax,DWORD PTR [rax]
   5c2d3:	test   eax,eax
   5c2d5:	jns    5c840 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x1a50>
   5c2db:	not    eax
   5c2dd:	test   eax,0x820
   5c2e2:	jne    5c4d0 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x16e0>
   5c2e8:	lea    r15,[rbp-0x200]
   5c2ef:	lea    r12,[rbp-0x270]
   5c2f6:	mov    rdx,QWORD PTR [r15]
   5c2f9:	mulx   rcx,rax,QWORD PTR [r12]
   5c2ff:	mulx   rsi,rbx,QWORD PTR [r12+0x8]
   5c306:	add    rcx,rbx
   5c309:	mulx   rdi,rbx,QWORD PTR [r12+0x10]
   5c310:	adc    rsi,rbx
   5c313:	mulx   r8,rbx,QWORD PTR [r12+0x18]
   5c31a:	adc    rdi,rbx
   5c31d:	adc    r8,0x0
   5c321:	mov    rdx,QWORD PTR [r15+0x8]
   5c325:	xor    ebx,ebx
   5c327:	mulx   r14,rbx,QWORD PTR [r12]
   5c32d:	adcx   rcx,rbx
   5c333:	adox   rsi,r14
   5c339:	mulx   r14,rbx,QWORD PTR [r12+0x8]
   5c340:	adcx   rsi,rbx
   5c346:	adox   rdi,r14
   5c34c:	mulx   r14,rbx,QWORD PTR [r12+0x10]
   5c353:	adcx   rdi,rbx
   5c359:	adox   r8,r14
   5c35f:	mulx   r9,rbx,QWORD PTR [r12+0x18]
   5c366:	adcx   r8,rbx
   5c36c:	mov    ebx,0x0
   5c371:	adox   r9,rbx
   5c377:	adcx   r9,rbx
   5c37d:	mov    rdx,QWORD PTR [r15+0x10]
   5c381:	xor    ebx,ebx
   5c383:	mulx   r14,rbx,QWORD PTR [r12]
   5c389:	adcx   rsi,rbx
   5c38f:	adox   rdi,r14
   5c395:	mulx   r14,rbx,QWORD PTR [r12+0x8]
   5c39c:	adcx   rdi,rbx
   5c3a2:	adox   r8,r14
   5c3a8:	mulx   r14,rbx,QWORD PTR [r12+0x10]
   5c3af:	adcx   r8,rbx
   5c3b5:	adox   r9,r14
   5c3bb:	mulx   r10,rbx,QWORD PTR [r12+0x18]
   5c3c2:	adcx   r9,rbx
   5c3c8:	mov    ebx,0x0
   5c3cd:	adox   r10,rbx
   5c3d3:	adcx   r10,rbx
   5c3d9:	mov    rdx,QWORD PTR [r15+0x18]
   5c3dd:	xor    ebx,ebx
   5c3df:	mulx   r14,rbx,QWORD PTR [r12]
   5c3e5:	adcx   rdi,rbx
   5c3eb:	adox   r8,r14
   5c3f1:	mulx   r14,rbx,QWORD PTR [r12+0x8]
   5c3f8:	adcx   r8,rbx
   5c3fe:	adox   r9,r14
   5c404:	mulx   r14,rbx,QWORD PTR [r12+0x10]
   5c40b:	adcx   r9,rbx
   5c411:	adox   r10,r14
   5c417:	mulx   r11,rbx,QWORD PTR [r12+0x18]
   5c41e:	adcx   r10,rbx
   5c424:	mov    ebx,0x0
   5c429:	adox   r11,rbx
   5c42f:	adcx   r11,rbx
   5c435:	mov    edx,0x26
   5c43a:	xor    ebx,ebx
   5c43c:	mulx   r14,rbx,r8
   5c441:	adcx   rax,rbx
   5c447:	adox   rcx,r14
   5c44d:	mulx   r14,rbx,r9
   5c452:	adcx   rcx,rbx
   5c458:	adox   rsi,r14
   5c45e:	mulx   r14,rbx,r10
   5c463:	adcx   rsi,rbx
   5c469:	adox   rdi,r14
   5c46f:	mulx   r8,rbx,r11
   5c474:	adcx   rdi,rbx
   5c47a:	mov    ebx,0x0
   5c47f:	adox   r8,rbx
   5c485:	adcx   r8,rbx
   5c48b:	imul   r8,r8,0x26
   5c48f:	add    rax,r8
   5c492:	adc    rcx,0x0
   5c496:	adc    rsi,0x0
   5c49a:	adc    rdi,0x0
   5c49e:	sbb    rbx,rbx
   5c4a1:	and    rbx,0x26
   5c4a5:	add    rax,rbx
   5c4a8:	mov    QWORD PTR [rbp-0x100],rax
   5c4af:	mov    QWORD PTR [rbp-0xf8],rcx
   5c4b6:	mov    QWORD PTR [rbp-0xf0],rsi
   5c4bd:	mov    QWORD PTR [rbp-0xe8],rdi
   5c4c4:	jmp    5c4ea <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x16fa>
   5c4c6:	cs nop WORD PTR [rax+rax*1+0x0]
   5c4d0:	lea    rdi,[rbp-0x100]
   5c4d7:	lea    rsi,[rbp-0x200]
   5c4de:	lea    rdx,[rbp-0x270]
   5c4e5:	call   626e0 <_RNvNtNtCskXK3iuL6Usm_12toyos_crypto10field255197radix6412mul_portable>
   5c4ea:	mov    eax,0x1db41
   5c4ef:	mul    QWORD PTR [rbp-0x290]
   5c4f6:	mov    rdi,rax
   5c4f9:	mov    r8,rdx
   5c4fc:	mov    r11,QWORD PTR [rbp-0x100]
   5c503:	mov    rsi,QWORD PTR [rbp-0xf0]
   5c50a:	mov    eax,0x1db41
   5c50f:	mul    QWORD PTR [rbp-0x288]
   5c516:	mov    rcx,rax
   5c519:	mov    r9,rdx
   5c51c:	mov    QWORD PTR [rbp-0x170],rsi
   5c523:	mov    rbx,QWORD PTR [rbp-0xe8]
   5c52a:	mov    eax,0x1db41
   5c52f:	mul    QWORD PTR [rbp-0x280]
   5c536:	mov    rsi,rax
   5c539:	mov    r10,rdx
   5c53c:	mov    QWORD PTR [rbp-0x168],rbx
   5c543:	mov    QWORD PTR [rbp-0x180],r11
   5c54a:	mov    eax,0x1db41
   5c54f:	mul    QWORD PTR [rbp-0x278]
   5c556:	add    rcx,r8
   5c559:	mov    r8,QWORD PTR [rbp-0xf8]
   5c560:	adc    rsi,r9
   5c563:	adc    rax,r10
   5c566:	adc    rdx,0x0
   5c56a:	imul   rdx,rdx,0x26
   5c56e:	add    rdx,rdi
   5c571:	adc    rcx,0x0
   5c575:	adc    rsi,0x0
   5c579:	mov    QWORD PTR [rbp-0x178],r8
   5c580:	adc    rax,0x0
   5c584:	setb   dil
   5c588:	movzx  edi,dil
   5c58c:	imul   r8,rdi,0x26
   5c590:	mov    r9,QWORD PTR [rbp-0x200]
   5c597:	add    rdx,r9
   5c59a:	add    r8,rdx
   5c59d:	xor    edx,edx
   5c59f:	add    rcx,QWORD PTR [rbp-0x1f8]
   5c5a6:	setb   dl
   5c5a9:	xor    edi,edi
   5c5ab:	add    rsi,QWORD PTR [rbp-0x1f0]
   5c5b2:	setb   dil
   5c5b6:	xor    r10d,r10d
   5c5b9:	add    rax,QWORD PTR [rbp-0x1e8]
   5c5c0:	setb   r10b
   5c5c4:	cmp    r8,r9
   5c5c7:	adc    rcx,0x0
   5c5cb:	adc    rdx,rsi
   5c5ce:	adc    rdi,rax
   5c5d1:	adc    r10,0x0
   5c5d5:	imul   rax,r10,0x26
   5c5d9:	add    rax,r8
   5c5dc:	adc    rcx,0x0
   5c5e0:	adc    rdx,0x0
   5c5e4:	adc    rdi,0x0
   5c5e8:	setb   sil
   5c5ec:	movzx  esi,sil
   5c5f0:	imul   rsi,rsi,0x26
   5c5f4:	add    rax,rsi
   5c5f7:	mov    QWORD PTR [rbp-0x100],rax
   5c5fe:	mov    QWORD PTR [rbp-0xf8],rcx
   5c605:	mov    QWORD PTR [rbp-0xf0],rdx
   5c60c:	mov    QWORD PTR [rbp-0xe8],rdi
   5c613:	mov    rax,QWORD PTR [rip+0x6b236]        # c7850 <_DYNAMIC+0x120>
   5c61a:	mov    eax,DWORD PTR [rax]
   5c61c:	test   eax,eax
   5c61e:	jns    5c84a <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x1a5a>
   5c624:	not    eax
   5c626:	test   eax,0x820
   5c62b:	jne    5afc0 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x1d0>
   5c631:	lea    r15,[rbp-0x100]
   5c638:	lea    r12,[rbp-0x290]
   5c63f:	mov    rdx,QWORD PTR [r12]
   5c643:	mulx   rcx,rax,QWORD PTR [r15]
   5c648:	mulx   rsi,rbx,QWORD PTR [r15+0x8]
   5c64e:	add    rcx,rbx
   5c651:	mulx   rdi,rbx,QWORD PTR [r15+0x10]
   5c657:	adc    rsi,rbx
   5c65a:	mulx   r8,rbx,QWORD PTR [r15+0x18]
   5c660:	adc    rdi,rbx
   5c663:	adc    r8,0x0
   5c667:	mov    rdx,QWORD PTR [r12+0x8]
   5c66c:	xor    ebx,ebx
   5c66e:	mulx   r14,rbx,QWORD PTR [r15]
   5c673:	adcx   rcx,rbx
   5c679:	adox   rsi,r14
   5c67f:	mulx   r14,rbx,QWORD PTR [r15+0x8]
   5c685:	adcx   rsi,rbx
   5c68b:	adox   rdi,r14
   5c691:	mulx   r14,rbx,QWORD PTR [r15+0x10]
   5c697:	adcx   rdi,rbx
   5c69d:	adox   r8,r14
   5c6a3:	mulx   r9,rbx,QWORD PTR [r15+0x18]
   5c6a9:	adcx   r8,rbx
   5c6af:	mov    ebx,0x0
   5c6b4:	adox   r9,rbx
   5c6ba:	adcx   r9,rbx
   5c6c0:	mov    rdx,QWORD PTR [r12+0x10]
   5c6c5:	xor    ebx,ebx
   5c6c7:	mulx   r14,rbx,QWORD PTR [r15]
   5c6cc:	adcx   rsi,rbx
   5c6d2:	adox   rdi,r14
   5c6d8:	mulx   r14,rbx,QWORD PTR [r15+0x8]
   5c6de:	adcx   rdi,rbx
   5c6e4:	adox   r8,r14
   5c6ea:	mulx   r14,rbx,QWORD PTR [r15+0x10]
   5c6f0:	adcx   r8,rbx
   5c6f6:	adox   r9,r14
   5c6fc:	mulx   r10,rbx,QWORD PTR [r15+0x18]
   5c702:	adcx   r9,rbx
   5c708:	mov    ebx,0x0
   5c70d:	adox   r10,rbx
   5c713:	adcx   r10,rbx
   5c719:	mov    rdx,QWORD PTR [r12+0x18]
   5c71e:	xor    ebx,ebx
   5c720:	mulx   r14,rbx,QWORD PTR [r15]
   5c725:	adcx   rdi,rbx
   5c72b:	adox   r8,r14
   5c731:	mulx   r14,rbx,QWORD PTR [r15+0x8]
   5c737:	adcx   r8,rbx
   5c73d:	adox   r9,r14
   5c743:	mulx   r14,rbx,QWORD PTR [r15+0x10]
   5c749:	adcx   r9,rbx
   5c74f:	adox   r10,r14
   5c755:	mulx   r11,rbx,QWORD PTR [r15+0x18]
   5c75b:	adcx   r10,rbx
   5c761:	mov    ebx,0x0
   5c766:	adox   r11,rbx
   5c76c:	adcx   r11,rbx
   5c772:	mov    edx,0x26
   5c777:	xor    ebx,ebx
   5c779:	mulx   r14,rbx,r8
   5c77e:	adcx   rax,rbx
   5c784:	adox   rcx,r14
   5c78a:	mulx   r14,rbx,r9
   5c78f:	adcx   rcx,rbx
   5c795:	adox   rsi,r14
   5c79b:	mulx   r14,rbx,r10
   5c7a0:	adcx   rsi,rbx
   5c7a6:	adox   rdi,r14
   5c7ac:	mulx   r8,rbx,r11
   5c7b1:	adcx   rdi,rbx
   5c7b7:	mov    ebx,0x0
   5c7bc:	adox   r8,rbx
   5c7c2:	adcx   r8,rbx
   5c7c8:	imul   r8,r8,0x26
   5c7cc:	add    rax,r8
   5c7cf:	adc    rcx,0x0
   5c7d3:	adc    rsi,0x0
   5c7d7:	adc    rdi,0x0
   5c7db:	sbb    rbx,rbx
   5c7de:	and    rbx,0x26
   5c7e2:	add    rax,rbx
   5c7e5:	mov    QWORD PTR [rbp-0x80],rax
   5c7e9:	mov    QWORD PTR [rbp-0x78],rcx
   5c7ed:	mov    QWORD PTR [rbp-0x70],rsi
   5c7f1:	mov    QWORD PTR [rbp-0x68],rdi
   5c7f5:	jmp    5afd7 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x1e7>
   5c7fa:	call   64990 <_RNvNtNtCskXK3iuL6Usm_12toyos_crypto4arch6x86_6414first_features>
   5c7ff:	jmp    5b222 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x432>
   5c804:	call   64990 <_RNvNtNtCskXK3iuL6Usm_12toyos_crypto4arch6x86_6414first_features>
   5c809:	jmp    5b45e <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x66e>
   5c80e:	call   64990 <_RNvNtNtCskXK3iuL6Usm_12toyos_crypto4arch6x86_6414first_features>
   5c813:	jmp    5b7e0 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x9f0>
   5c818:	call   64990 <_RNvNtNtCskXK3iuL6Usm_12toyos_crypto4arch6x86_6414first_features>
   5c81d:	jmp    5b9eb <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0xbfb>
   5c822:	call   64990 <_RNvNtNtCskXK3iuL6Usm_12toyos_crypto4arch6x86_6414first_features>
   5c827:	jmp    5bcb1 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0xec1>
   5c82c:	call   64990 <_RNvNtNtCskXK3iuL6Usm_12toyos_crypto4arch6x86_6414first_features>
   5c831:	jmp    5bf31 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x1141>
   5c836:	call   64990 <_RNvNtNtCskXK3iuL6Usm_12toyos_crypto4arch6x86_6414first_features>
   5c83b:	jmp    5c091 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x12a1>
   5c840:	call   64990 <_RNvNtNtCskXK3iuL6Usm_12toyos_crypto4arch6x86_6414first_features>
   5c845:	jmp    5c2db <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x14eb>
   5c84a:	call   64990 <_RNvNtNtCskXK3iuL6Usm_12toyos_crypto4arch6x86_6414first_features>
   5c84f:	jmp    5c624 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x1834>
   5c854:	neg    rdi
   5c857:	mov    rax,QWORD PTR [rbp-0x140]
   5c85e:	mov    rcx,QWORD PTR [rbp-0x180]
   5c865:	mov    rdx,QWORD PTR [rbp-0x178]
   5c86c:	mov    rsi,rax
   5c86f:	xor    rsi,rcx
   5c872:	and    rsi,rdi
   5c875:	xor    rcx,rsi
   5c878:	mov    QWORD PTR [rbp-0x180],rcx
   5c87f:	xor    rsi,rax
   5c882:	mov    QWORD PTR [rbp-0x140],rsi
   5c889:	mov    rax,QWORD PTR [rbp-0x138]
   5c890:	mov    rcx,rax
   5c893:	xor    rcx,rdx
   5c896:	and    rcx,rdi
   5c899:	xor    rdx,rcx
   5c89c:	mov    QWORD PTR [rbp-0x178],rdx
   5c8a3:	xor    rcx,rax
   5c8a6:	mov    QWORD PTR [rbp-0x138],rcx
   5c8ad:	mov    rax,QWORD PTR [rbp-0x170]
   5c8b4:	mov    rcx,QWORD PTR [rbp-0x130]
   5c8bb:	mov    rdx,rcx
   5c8be:	xor    rdx,rax
   5c8c1:	and    rdx,rdi
   5c8c4:	xor    rax,rdx
   5c8c7:	mov    QWORD PTR [rbp-0x170],rax
   5c8ce:	xor    rdx,rcx
   5c8d1:	mov    QWORD PTR [rbp-0x130],rdx
   5c8d8:	mov    rax,QWORD PTR [rbp-0x168]
   5c8df:	mov    rcx,QWORD PTR [rbp-0x128]
   5c8e6:	mov    rdx,rcx
   5c8e9:	xor    rdx,rax
   5c8ec:	and    rdx,rdi
   5c8ef:	xor    rax,rdx
   5c8f2:	mov    QWORD PTR [rbp-0x168],rax
   5c8f9:	xor    rdx,rcx
   5c8fc:	mov    QWORD PTR [rbp-0x128],rdx
   5c903:	mov    rax,QWORD PTR [rbp-0x160]
   5c90a:	mov    rcx,QWORD PTR [rbp-0x120]
   5c911:	mov    rdx,rcx
   5c914:	xor    rdx,rax
   5c917:	and    rdx,rdi
   5c91a:	xor    rax,rdx
   5c91d:	mov    QWORD PTR [rbp-0x160],rax
   5c924:	xor    rdx,rcx
   5c927:	mov    QWORD PTR [rbp-0x120],rdx
   5c92e:	mov    rax,QWORD PTR [rbp-0x158]
   5c935:	mov    rcx,QWORD PTR [rbp-0x118]
   5c93c:	mov    rdx,rcx
   5c93f:	xor    rdx,rax
   5c942:	and    rdx,rdi
   5c945:	xor    rax,rdx
   5c948:	mov    QWORD PTR [rbp-0x158],rax
   5c94f:	xor    rdx,rcx
   5c952:	mov    QWORD PTR [rbp-0x118],rdx
   5c959:	mov    rax,QWORD PTR [rbp-0x150]
   5c960:	mov    rcx,QWORD PTR [rbp-0x110]
   5c967:	mov    rdx,rcx
   5c96a:	xor    rdx,rax
   5c96d:	and    rdx,rdi
   5c970:	xor    rax,rdx
   5c973:	mov    QWORD PTR [rbp-0x150],rax
   5c97a:	xor    rdx,rcx
   5c97d:	mov    QWORD PTR [rbp-0x110],rdx
   5c984:	mov    rax,QWORD PTR [rbp-0x148]
   5c98b:	mov    rcx,QWORD PTR [rbp-0x108]
   5c992:	mov    rdx,rcx
   5c995:	xor    rdx,rax
   5c998:	and    rdx,rdi
   5c99b:	xor    rax,rdx
   5c99e:	mov    QWORD PTR [rbp-0x148],rax
   5c9a5:	xor    rdx,rcx
   5c9a8:	mov    QWORD PTR [rbp-0x108],rdx
   5c9af:	lea    rdi,[rbp-0x100]
   5c9b6:	lea    rsi,[rbp-0x160]
   5c9bd:	call   609c0 <_RNvMNtCskXK3iuL6Usm_12toyos_crypto10field25519NtNtB2_7radix645Tight11pow_2_250_1.llvm.6959825793532211534>
   5c9c2:	movups xmm0,XMMWORD PTR [rbp-0x100]
   5c9c9:	movups xmm1,XMMWORD PTR [rbp-0xf0]
   5c9d0:	movups xmm2,XMMWORD PTR [rbp-0xe0]
   5c9d7:	movups xmm3,XMMWORD PTR [rbp-0xd0]
   5c9de:	movaps XMMWORD PTR [rbp-0x1a0],xmm1
   5c9e5:	movaps XMMWORD PTR [rbp-0x1b0],xmm0
   5c9ec:	movaps XMMWORD PTR [rbp-0x70],xmm3
   5c9f0:	movaps XMMWORD PTR [rbp-0x80],xmm2
   5c9f4:	lea    rdi,[rbp-0x100]
   5c9fb:	lea    rsi,[rbp-0x1b0]
   5ca02:	mov    edx,0x5
   5ca07:	call   62240 <_RNvMNtCskXK3iuL6Usm_12toyos_crypto10field25519NtNtB2_7radix645Tight12square_times.llvm.6959825793532211534>
   5ca0c:	mov    rax,QWORD PTR [rip+0x6ae3d]        # c7850 <_DYNAMIC+0x120>
   5ca13:	mov    eax,DWORD PTR [rax]
   5ca15:	test   eax,eax
   5ca17:	jns    5d4d8 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x26e8>
   5ca1d:	not    eax
   5ca1f:	test   eax,0x820
   5ca24:	jne    5cbfd <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x1e0d>
   5ca2a:	lea    rax,[rbp-0x100]
   5ca31:	lea    rcx,[rbp-0x80]
   5ca35:	mov    rdx,QWORD PTR [rax]
   5ca38:	mulx   rdi,rsi,QWORD PTR [rcx]
   5ca3d:	mulx   r8,r15,QWORD PTR [rcx+0x8]
   5ca43:	add    rdi,r15
   5ca46:	mulx   r9,r15,QWORD PTR [rcx+0x10]
   5ca4c:	adc    r8,r15
   5ca4f:	mulx   r10,r15,QWORD PTR [rcx+0x18]
   5ca55:	adc    r9,r15
   5ca58:	adc    r10,0x0
   5ca5c:	mov    rdx,QWORD PTR [rax+0x8]
   5ca60:	xor    r15d,r15d
   5ca63:	mulx   r12,r15,QWORD PTR [rcx]
   5ca68:	adcx   rdi,r15
   5ca6e:	adox   r8,r12
   5ca74:	mulx   r12,r15,QWORD PTR [rcx+0x8]
   5ca7a:	adcx   r8,r15
   5ca80:	adox   r9,r12
   5ca86:	mulx   r12,r15,QWORD PTR [rcx+0x10]
   5ca8c:	adcx   r9,r15
   5ca92:	adox   r10,r12
   5ca98:	mulx   r11,r15,QWORD PTR [rcx+0x18]
   5ca9e:	adcx   r10,r15
   5caa4:	mov    r15d,0x0
   5caaa:	adox   r11,r15
   5cab0:	adcx   r11,r15
   5cab6:	mov    rdx,QWORD PTR [rax+0x10]
   5caba:	xor    r15d,r15d
   5cabd:	mulx   r12,r15,QWORD PTR [rcx]
   5cac2:	adcx   r8,r15
   5cac8:	adox   r9,r12
   5cace:	mulx   r12,r15,QWORD PTR [rcx+0x8]
   5cad4:	adcx   r9,r15
   5cada:	adox   r10,r12
   5cae0:	mulx   r12,r15,QWORD PTR [rcx+0x10]
   5cae6:	adcx   r10,r15
   5caec:	adox   r11,r12
   5caf2:	mulx   rbx,r15,QWORD PTR [rcx+0x18]
   5caf8:	adcx   r11,r15
   5cafe:	mov    r15d,0x0
   5cb04:	adox   rbx,r15
   5cb0a:	adcx   rbx,r15
   5cb10:	mov    rdx,QWORD PTR [rax+0x18]
   5cb14:	xor    r15d,r15d
   5cb17:	mulx   r12,r15,QWORD PTR [rcx]
   5cb1c:	adcx   r9,r15
   5cb22:	adox   r10,r12
   5cb28:	mulx   r12,r15,QWORD PTR [rcx+0x8]
   5cb2e:	adcx   r10,r15
   5cb34:	adox   r11,r12
   5cb3a:	mulx   r12,r15,QWORD PTR [rcx+0x10]
   5cb40:	adcx   r11,r15
   5cb46:	adox   rbx,r12
   5cb4c:	mulx   r14,r15,QWORD PTR [rcx+0x18]
   5cb52:	adcx   rbx,r15
   5cb58:	mov    r15d,0x0
   5cb5e:	adox   r14,r15
   5cb64:	adcx   r14,r15
   5cb6a:	mov    edx,0x26
   5cb6f:	xor    r15d,r15d
   5cb72:	mulx   r12,r15,r10
   5cb77:	adcx   rsi,r15
   5cb7d:	adox   rdi,r12
   5cb83:	mulx   r12,r15,r11
   5cb88:	adcx   rdi,r15
   5cb8e:	adox   r8,r12
   5cb94:	mulx   r12,r15,rbx
   5cb99:	adcx   r8,r15
   5cb9f:	adox   r9,r12
   5cba5:	mulx   r10,r15,r14
   5cbaa:	adcx   r9,r15
   5cbb0:	mov    r15d,0x0
   5cbb6:	adox   r10,r15
   5cbbc:	adcx   r10,r15
   5cbc2:	imul   r10,r10,0x26
   5cbc6:	add    rsi,r10
   5cbc9:	adc    rdi,0x0
   5cbcd:	adc    r8,0x0
   5cbd1:	adc    r9,0x0
   5cbd5:	sbb    r15,r15
   5cbd8:	and    r15,0x26
   5cbdc:	add    rsi,r15
   5cbdf:	mov    QWORD PTR [rbp-0x1e0],rsi
   5cbe6:	mov    QWORD PTR [rbp-0x1d8],rdi
   5cbed:	mov    QWORD PTR [rbp-0x1d0],r8
   5cbf4:	mov    QWORD PTR [rbp-0x1c8],r9
   5cbfb:	jmp    5cc14 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x1e24>
   5cbfd:	lea    rdi,[rbp-0x1e0]
   5cc04:	lea    rsi,[rbp-0x100]
   5cc0b:	lea    rdx,[rbp-0x80]
   5cc0f:	call   626e0 <_RNvNtNtCskXK3iuL6Usm_12toyos_crypto10field255197radix6412mul_portable>
   5cc14:	mov    rax,QWORD PTR [rip+0x6ac35]        # c7850 <_DYNAMIC+0x120>
   5cc1b:	mov    eax,DWORD PTR [rax]
   5cc1d:	test   eax,eax
   5cc1f:	jns    5d4e2 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x26f2>
   5cc25:	not    eax
   5cc27:	test   eax,0x820
   5cc2c:	jne    5ce08 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x2018>
   5cc32:	lea    rax,[rbp-0x180]
   5cc39:	lea    rcx,[rbp-0x1e0]
   5cc40:	mov    rdx,QWORD PTR [rax]
   5cc43:	mulx   rdi,rsi,QWORD PTR [rcx]
   5cc48:	mulx   r8,r15,QWORD PTR [rcx+0x8]
   5cc4e:	add    rdi,r15
   5cc51:	mulx   r9,r15,QWORD PTR [rcx+0x10]
   5cc57:	adc    r8,r15
   5cc5a:	mulx   r10,r15,QWORD PTR [rcx+0x18]
   5cc60:	adc    r9,r15
   5cc63:	adc    r10,0x0
   5cc67:	mov    rdx,QWORD PTR [rax+0x8]
   5cc6b:	xor    r15d,r15d
   5cc6e:	mulx   r12,r15,QWORD PTR [rcx]
   5cc73:	adcx   rdi,r15
   5cc79:	adox   r8,r12
   5cc7f:	mulx   r12,r15,QWORD PTR [rcx+0x8]
   5cc85:	adcx   r8,r15
   5cc8b:	adox   r9,r12
   5cc91:	mulx   r12,r15,QWORD PTR [rcx+0x10]
   5cc97:	adcx   r9,r15
   5cc9d:	adox   r10,r12
   5cca3:	mulx   r11,r15,QWORD PTR [rcx+0x18]
   5cca9:	adcx   r10,r15
   5ccaf:	mov    r15d,0x0
   5ccb5:	adox   r11,r15
   5ccbb:	adcx   r11,r15
   5ccc1:	mov    rdx,QWORD PTR [rax+0x10]
   5ccc5:	xor    r15d,r15d
   5ccc8:	mulx   r12,r15,QWORD PTR [rcx]
   5cccd:	adcx   r8,r15
   5ccd3:	adox   r9,r12
   5ccd9:	mulx   r12,r15,QWORD PTR [rcx+0x8]
   5ccdf:	adcx   r9,r15
   5cce5:	adox   r10,r12
   5cceb:	mulx   r12,r15,QWORD PTR [rcx+0x10]
   5ccf1:	adcx   r10,r15
   5ccf7:	adox   r11,r12
   5ccfd:	mulx   rbx,r15,QWORD PTR [rcx+0x18]
   5cd03:	adcx   r11,r15
   5cd09:	mov    r15d,0x0
   5cd0f:	adox   rbx,r15
   5cd15:	adcx   rbx,r15
   5cd1b:	mov    rdx,QWORD PTR [rax+0x18]
   5cd1f:	xor    r15d,r15d
   5cd22:	mulx   r12,r15,QWORD PTR [rcx]
   5cd27:	adcx   r9,r15
   5cd2d:	adox   r10,r12
   5cd33:	mulx   r12,r15,QWORD PTR [rcx+0x8]
   5cd39:	adcx   r10,r15
   5cd3f:	adox   r11,r12
   5cd45:	mulx   r12,r15,QWORD PTR [rcx+0x10]
   5cd4b:	adcx   r11,r15
   5cd51:	adox   rbx,r12
   5cd57:	mulx   r14,r15,QWORD PTR [rcx+0x18]
   5cd5d:	adcx   rbx,r15
   5cd63:	mov    r15d,0x0
   5cd69:	adox   r14,r15
   5cd6f:	adcx   r14,r15
   5cd75:	mov    edx,0x26
   5cd7a:	xor    r15d,r15d
   5cd7d:	mulx   r12,r15,r10
   5cd82:	adcx   rsi,r15
   5cd88:	adox   rdi,r12
   5cd8e:	mulx   r12,r15,r11
   5cd93:	adcx   rdi,r15
   5cd99:	adox   r8,r12
   5cd9f:	mulx   r12,r15,rbx
   5cda4:	adcx   r8,r15
   5cdaa:	adox   r9,r12
   5cdb0:	mulx   r10,r15,r14
   5cdb5:	adcx   r9,r15
   5cdbb:	mov    r15d,0x0
   5cdc1:	adox   r10,r15
   5cdc7:	adcx   r10,r15
   5cdcd:	imul   r10,r10,0x26
   5cdd1:	add    rsi,r10
   5cdd4:	adc    rdi,0x0
   5cdd8:	adc    r8,0x0
   5cddc:	adc    r9,0x0
   5cde0:	sbb    r15,r15
   5cde3:	and    r15,0x26
   5cde7:	add    rsi,r15
   5cdea:	mov    QWORD PTR [rbp-0x100],rsi
   5cdf1:	mov    QWORD PTR [rbp-0xf8],rdi
   5cdf8:	mov    QWORD PTR [rbp-0xf0],r8
   5cdff:	mov    QWORD PTR [rbp-0xe8],r9
   5ce06:	jmp    5ce22 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x2032>
   5ce08:	lea    rdi,[rbp-0x100]
   5ce0f:	lea    rsi,[rbp-0x180]
   5ce16:	lea    rdx,[rbp-0x1e0]
   5ce1d:	call   626e0 <_RNvNtNtCskXK3iuL6Usm_12toyos_crypto10field255197radix6412mul_portable>
   5ce22:	mov    rax,QWORD PTR [rbp-0x100]
   5ce29:	mov    rcx,QWORD PTR [rbp-0xf8]
   5ce30:	mov    rdx,QWORD PTR [rbp-0xf0]
   5ce37:	mov    QWORD PTR [rbp-0x70],rdx
   5ce3b:	mov    rdx,QWORD PTR [rbp-0xe8]
   5ce42:	mov    QWORD PTR [rbp-0x68],rdx
   5ce46:	mov    QWORD PTR [rbp-0x80],rax
   5ce4a:	mov    QWORD PTR [rbp-0x78],rcx
   5ce4e:	lea    rdi,[rbp-0x100]
   5ce55:	lea    rsi,[rbp-0x80]
   5ce59:	call   62580 <_RNvMNtNtCskXK3iuL6Usm_12toyos_crypto10field255197radix64NtB2_5Tight5bytes>
   5ce5e:	movzx  eax,BYTE PTR [rbp-0x100]
   5ce65:	movzx  ecx,BYTE PTR [rbp-0xff]
   5ce6c:	mov    BYTE PTR [rbp-0x2a],al
   5ce6f:	mov    BYTE PTR [rbp-0x49],cl
   5ce72:	movzx  eax,BYTE PTR [rbp-0xfe]
   5ce79:	mov    BYTE PTR [rbp-0x48],al
   5ce7c:	movzx  eax,BYTE PTR [rbp-0xfd]
   5ce83:	mov    BYTE PTR [rbp-0x47],al
   5ce86:	movzx  eax,BYTE PTR [rbp-0xfc]
   5ce8d:	mov    BYTE PTR [rbp-0x46],al
   5ce90:	movzx  eax,BYTE PTR [rbp-0xfb]
   5ce97:	mov    BYTE PTR [rbp-0x45],al
   5ce9a:	movzx  eax,BYTE PTR [rbp-0xfa]
   5cea1:	mov    BYTE PTR [rbp-0x44],al
   5cea4:	movzx  eax,BYTE PTR [rbp-0xf9]
   5ceab:	mov    BYTE PTR [rbp-0x43],al
   5ceae:	movzx  eax,BYTE PTR [rbp-0xf8]
   5ceb5:	mov    BYTE PTR [rbp-0x42],al
   5ceb8:	movzx  eax,BYTE PTR [rbp-0xf7]
   5cebf:	mov    BYTE PTR [rbp-0x41],al
   5cec2:	movzx  eax,BYTE PTR [rbp-0xf6]
   5cec9:	movzx  ecx,BYTE PTR [rbp-0xf5]
   5ced0:	mov    BYTE PTR [rbp-0x40],al
   5ced3:	mov    BYTE PTR [rbp-0x3f],cl
   5ced6:	movzx  eax,BYTE PTR [rbp-0xf4]
   5cedd:	mov    BYTE PTR [rbp-0x3e],al
   5cee0:	movzx  eax,BYTE PTR [rbp-0xf3]
   5cee7:	mov    BYTE PTR [rbp-0x3d],al
   5ceea:	movzx  eax,BYTE PTR [rbp-0xf2]
   5cef1:	mov    BYTE PTR [rbp-0x3c],al
   5cef4:	movzx  eax,BYTE PTR [rbp-0xf1]
   5cefb:	mov    BYTE PTR [rbp-0x3b],al
   5cefe:	movzx  eax,BYTE PTR [rbp-0xf0]
   5cf05:	mov    BYTE PTR [rbp-0x3a],al
   5cf08:	movzx  eax,BYTE PTR [rbp-0xef]
   5cf0f:	mov    BYTE PTR [rbp-0x39],al
   5cf12:	movzx  eax,BYTE PTR [rbp-0xee]
   5cf19:	mov    BYTE PTR [rbp-0x38],al
   5cf1c:	movzx  eax,BYTE PTR [rbp-0xed]
   5cf23:	movzx  ecx,BYTE PTR [rbp-0xec]
   5cf2a:	mov    BYTE PTR [rbp-0x37],al
   5cf2d:	mov    BYTE PTR [rbp-0x36],cl
   5cf30:	movzx  eax,BYTE PTR [rbp-0xeb]
   5cf37:	mov    BYTE PTR [rbp-0x35],al
   5cf3a:	movzx  eax,BYTE PTR [rbp-0xea]
   5cf41:	mov    BYTE PTR [rbp-0x34],al
   5cf44:	movzx  eax,BYTE PTR [rbp-0xe9]
   5cf4b:	mov    BYTE PTR [rbp-0x33],al
   5cf4e:	movzx  eax,BYTE PTR [rbp-0xe8]
   5cf55:	mov    BYTE PTR [rbp-0x32],al
   5cf58:	movzx  eax,BYTE PTR [rbp-0xe7]
   5cf5f:	mov    BYTE PTR [rbp-0x31],al
   5cf62:	movzx  eax,BYTE PTR [rbp-0xe6]
   5cf69:	mov    BYTE PTR [rbp-0x30],al
   5cf6c:	movzx  eax,BYTE PTR [rbp-0xe5]
   5cf73:	mov    BYTE PTR [rbp-0x2f],al
   5cf76:	movzx  eax,BYTE PTR [rbp-0xe4]
   5cf7d:	mov    BYTE PTR [rbp-0x2e],al
   5cf80:	movzx  eax,BYTE PTR [rbp-0xe3]
   5cf87:	mov    BYTE PTR [rbp-0x2d],al
   5cf8a:	movzx  eax,BYTE PTR [rbp-0xe2]
   5cf91:	mov    BYTE PTR [rbp-0x2c],al
   5cf94:	movzx  eax,BYTE PTR [rbp-0xe1]
   5cf9b:	mov    BYTE PTR [rbp-0x2b],al
   5cf9e:	xorps  xmm0,xmm0
   5cfa1:	movaps XMMWORD PTR [rbp-0x100],xmm0
   5cfa8:	movaps xmm1,XMMWORD PTR [rbp-0x100]
   5cfaf:	movaps XMMWORD PTR [rbp-0x80],xmm1
   5cfb3:	movaps XMMWORD PTR [rbp-0x100],xmm0
   5cfba:	movaps xmm1,XMMWORD PTR [rbp-0x100]
   5cfc1:	movaps XMMWORD PTR [rbp-0x70],xmm1
   5cfc5:	movaps XMMWORD PTR [rbp-0x100],xmm0
   5cfcc:	movaps xmm1,XMMWORD PTR [rbp-0x100]
   5cfd3:	movaps XMMWORD PTR [rbp-0x180],xmm1
   5cfda:	movaps XMMWORD PTR [rbp-0x100],xmm0
   5cfe1:	movaps xmm1,XMMWORD PTR [rbp-0x100]
   5cfe8:	lea    rax,[rbp-0x160]
   5cfef:	movups XMMWORD PTR [rax-0x10],xmm1
   5cff3:	movaps XMMWORD PTR [rbp-0x100],xmm0
   5cffa:	movaps xmm1,XMMWORD PTR [rbp-0x100]
   5d001:	movups XMMWORD PTR [rax],xmm1
   5d004:	movaps XMMWORD PTR [rbp-0x100],xmm0
   5d00b:	movaps xmm1,XMMWORD PTR [rbp-0x100]
   5d012:	movups XMMWORD PTR [rax+0x10],xmm1
   5d016:	movaps XMMWORD PTR [rbp-0x100],xmm0
   5d01d:	movaps xmm1,XMMWORD PTR [rbp-0x100]
   5d024:	movups XMMWORD PTR [rax+0x20],xmm1
   5d028:	movaps XMMWORD PTR [rbp-0x100],xmm0
   5d02f:	movaps xmm1,XMMWORD PTR [rbp-0x100]
   5d036:	movups XMMWORD PTR [rax+0x30],xmm1
   5d03a:	movaps XMMWORD PTR [rbp-0x100],xmm0
   5d041:	movaps xmm1,XMMWORD PTR [rbp-0x100]
   5d048:	movups XMMWORD PTR [rax+0x40],xmm1
   5d04c:	movaps XMMWORD PTR [rbp-0x100],xmm0
   5d053:	movaps xmm0,XMMWORD PTR [rbp-0x100]
   5d05a:	movups XMMWORD PTR [rax+0x50],xmm0
   5d05e:	movzx  ecx,BYTE PTR [rbp-0x49]
   5d062:	movzx  eax,BYTE PTR [rbp-0x2a]
   5d066:	mov    BYTE PTR [rbp-0x1c0],cl
   5d06c:	or     al,cl
   5d06e:	movzx  ecx,BYTE PTR [rbp-0x48]
   5d072:	movzx  edx,BYTE PTR [rbp-0x47]
   5d076:	mov    BYTE PTR [rbp-0x1b8],cl
   5d07c:	mov    BYTE PTR [rbp-0x250],dl
   5d082:	or     cl,dl
   5d084:	or     cl,al
   5d086:	movzx  eax,BYTE PTR [rbp-0x46]
   5d08a:	movzx  edx,BYTE PTR [rbp-0x45]
   5d08e:	mov    BYTE PTR [rbp-0x248],al
   5d094:	mov    BYTE PTR [rbp-0x240],dl
   5d09a:	or     al,dl
   5d09c:	movzx  edx,BYTE PTR [rbp-0x44]
   5d0a0:	mov    BYTE PTR [rbp-0x230],dl
   5d0a6:	or     al,dl
   5d0a8:	or     al,cl
   5d0aa:	movzx  edx,BYTE PTR [rbp-0x43]
   5d0ae:	movzx  ecx,BYTE PTR [rbp-0x42]
   5d0b2:	mov    BYTE PTR [rbp-0x228],dl
   5d0b8:	mov    BYTE PTR [rbp-0x220],cl
   5d0be:	or     dl,cl
   5d0c0:	movzx  ecx,BYTE PTR [rbp-0x41]
   5d0c4:	mov    BYTE PTR [rbp-0x218],cl
   5d0ca:	or     dl,cl
   5d0cc:	movzx  ecx,BYTE PTR [rbp-0x40]
   5d0d0:	mov    BYTE PTR [rbp-0x210],cl
   5d0d6:	or     dl,cl
   5d0d8:	or     dl,al
   5d0da:	movzx  ecx,BYTE PTR [rbp-0x3f]
   5d0de:	movzx  eax,BYTE PTR [rbp-0x3e]
   5d0e2:	mov    BYTE PTR [rbp-0x208],cl
   5d0e8:	mov    BYTE PTR [rbp-0x5f],al
   5d0eb:	or     cl,al
   5d0ed:	movzx  eax,BYTE PTR [rbp-0x3d]
   5d0f1:	mov    BYTE PTR [rbp-0x5e],al
   5d0f4:	or     cl,al
   5d0f6:	movzx  eax,BYTE PTR [rbp-0x3c]
   5d0fa:	mov    BYTE PTR [rbp-0x5d],al
   5d0fd:	or     cl,al
   5d0ff:	movzx  eax,BYTE PTR [rbp-0x3b]
   5d103:	mov    BYTE PTR [rbp-0x5c],al
   5d106:	or     cl,al
   5d108:	or     cl,dl
   5d10a:	movzx  eax,BYTE PTR [rbp-0x3a]
   5d10e:	movzx  edx,BYTE PTR [rbp-0x39]
   5d112:	mov    BYTE PTR [rbp-0x5b],al
   5d115:	mov    BYTE PTR [rbp-0x5a],dl
   5d118:	or     al,dl
   5d11a:	movzx  edx,BYTE PTR [rbp-0x38]
   5d11e:	mov    BYTE PTR [rbp-0x59],dl
   5d121:	or     al,dl
   5d123:	movzx  edx,BYTE PTR [rbp-0x37]
   5d127:	mov    BYTE PTR [rbp-0x58],dl
   5d12a:	or     al,dl
   5d12c:	movzx  r8d,BYTE PTR [rbp-0x36]
   5d131:	or     al,r8b
   5d134:	movzx  r10d,BYTE PTR [rbp-0x35]
   5d139:	or     al,r10b
   5d13c:	or     al,cl
   5d13e:	movzx  r9d,BYTE PTR [rbp-0x34]
   5d143:	movzx  r11d,BYTE PTR [rbp-0x33]
   5d148:	mov    edx,r9d
   5d14b:	or     dl,r11b
   5d14e:	movzx  ebx,BYTE PTR [rbp-0x32]
   5d152:	or     dl,bl
   5d154:	movzx  r15d,BYTE PTR [rbp-0x31]
   5d159:	or     dl,r15b
   5d15c:	movzx  r14d,BYTE PTR [rbp-0x30]
   5d161:	or     dl,r14b
   5d164:	movzx  r12d,BYTE PTR [rbp-0x2f]
   5d169:	or     dl,r12b
   5d16c:	movzx  r13d,BYTE PTR [rbp-0x2e]
   5d171:	or     dl,r13b
   5d174:	or     dl,al
   5d176:	movzx  edi,BYTE PTR [rbp-0x2d]
   5d17a:	movzx  ecx,BYTE PTR [rbp-0x2c]
   5d17e:	mov    eax,edi
   5d180:	or     al,cl
   5d182:	or     al,dl
   5d184:	xor    esi,esi
   5d186:	movzx  edx,BYTE PTR [rbp-0x2b]
   5d18a:	or     al,dl
   5d18c:	setne  sil
   5d190:	test   rsi,rsi
   5d193:	je     5d282 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x2492>
   5d199:	movzx  eax,BYTE PTR [rbp-0x2a]
   5d19d:	mov    rsi,QWORD PTR [rbp-0x2b8]
   5d1a4:	mov    BYTE PTR [rsi+0x1],al
   5d1a7:	movzx  eax,BYTE PTR [rbp-0x1c0]
   5d1ae:	mov    BYTE PTR [rsi+0x2],al
   5d1b1:	movzx  eax,BYTE PTR [rbp-0x1b8]
   5d1b8:	mov    BYTE PTR [rsi+0x3],al
   5d1bb:	movzx  eax,BYTE PTR [rbp-0x250]
   5d1c2:	mov    BYTE PTR [rsi+0x4],al
   5d1c5:	movzx  eax,BYTE PTR [rbp-0x248]
   5d1cc:	mov    BYTE PTR [rsi+0x5],al
   5d1cf:	movzx  eax,BYTE PTR [rbp-0x240]
   5d1d6:	mov    BYTE PTR [rsi+0x6],al
   5d1d9:	movzx  eax,BYTE PTR [rbp-0x230]
   5d1e0:	mov    BYTE PTR [rsi+0x7],al
   5d1e3:	movzx  eax,BYTE PTR [rbp-0x228]
   5d1ea:	mov    BYTE PTR [rsi+0x8],al
   5d1ed:	movzx  eax,BYTE PTR [rbp-0x220]
   5d1f4:	mov    BYTE PTR [rsi+0x9],al
   5d1f7:	movzx  eax,BYTE PTR [rbp-0x218]
   5d1fe:	mov    BYTE PTR [rsi+0xa],al
   5d201:	movzx  eax,BYTE PTR [rbp-0x210]
   5d208:	mov    BYTE PTR [rsi+0xb],al
   5d20b:	movzx  eax,BYTE PTR [rbp-0x208]
   5d212:	mov    BYTE PTR [rsi+0xc],al
   5d215:	movzx  eax,BYTE PTR [rbp-0x5f]
   5d219:	mov    BYTE PTR [rsi+0xd],al
   5d21c:	movzx  eax,BYTE PTR [rbp-0x5e]
   5d220:	mov    BYTE PTR [rsi+0xe],al
   5d223:	movzx  eax,BYTE PTR [rbp-0x5d]
   5d227:	mov    BYTE PTR [rsi+0xf],al
   5d22a:	movzx  eax,BYTE PTR [rbp-0x5c]
   5d22e:	mov    BYTE PTR [rsi+0x10],al
   5d231:	movzx  eax,BYTE PTR [rbp-0x5b]
   5d235:	mov    BYTE PTR [rsi+0x11],al
   5d238:	movzx  eax,BYTE PTR [rbp-0x5a]
   5d23c:	mov    BYTE PTR [rsi+0x12],al
   5d23f:	movzx  eax,BYTE PTR [rbp-0x59]
   5d243:	mov    BYTE PTR [rsi+0x13],al
   5d246:	movzx  eax,BYTE PTR [rbp-0x58]
   5d24a:	mov    BYTE PTR [rsi+0x14],al
   5d24d:	mov    BYTE PTR [rsi+0x15],r8b
   5d251:	mov    BYTE PTR [rsi+0x16],r10b
   5d255:	mov    BYTE PTR [rsi+0x17],r9b
   5d259:	mov    BYTE PTR [rsi+0x18],r11b
   5d25d:	mov    BYTE PTR [rsi+0x19],bl
   5d260:	mov    BYTE PTR [rsi+0x1a],r15b
   5d264:	mov    BYTE PTR [rsi+0x1b],r14b
   5d268:	mov    BYTE PTR [rsi+0x1c],r12b
   5d26c:	mov    BYTE PTR [rsi+0x1d],r13b
   5d270:	mov    BYTE PTR [rsi+0x1e],dil
   5d274:	mov    BYTE PTR [rsi+0x1f],cl
   5d277:	mov    BYTE PTR [rsi+0x20],dl
   5d27a:	mov    BYTE PTR [rsi],0x0
   5d27d:	jmp    5d496 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x26a6>
   5d282:	mov    rsi,QWORD PTR [rbp-0x2b8]
   5d289:	mov    WORD PTR [rsi],0x301
   5d28e:	mov    BYTE PTR [rbp-0x100],0x0
   5d295:	mov    BYTE PTR [rbp-0x180],0x0
   5d29c:	mov    BYTE PTR [rbp-0x80],0x0
   5d2a0:	mov    BYTE PTR [rbp-0x1b0],0x0
   5d2a7:	mov    BYTE PTR [rbp-0x1e0],0x0
   5d2ae:	mov    BYTE PTR [rbp-0x2b0],0x0
   5d2b5:	mov    BYTE PTR [rbp-0x358],0x0
   5d2bc:	mov    BYTE PTR [rbp-0x338],0x0
   5d2c3:	mov    BYTE PTR [rbp-0x290],0x0
   5d2ca:	mov    BYTE PTR [rbp-0x270],0x0
   5d2d1:	mov    BYTE PTR [rbp-0x2f8],0x0
   5d2d8:	mov    BYTE PTR [rbp-0x200],0x0
   5d2df:	mov    BYTE PTR [rbp-0x2d8],0x0
   5d2e6:	mov    BYTE PTR [rbp-0x318],0x0
   5d2ed:	mov    BYTE PTR [rbp-0x190],0x0
   5d2f4:	mov    BYTE PTR [rbp-0x29],0x0
   5d2f8:	movzx  eax,BYTE PTR [rbp-0x100]
   5d2ff:	mov    BYTE PTR [rbp-0x2a],al
   5d302:	movzx  eax,BYTE PTR [rbp-0x180]
   5d309:	mov    BYTE PTR [rbp-0x49],al
   5d30c:	movzx  eax,BYTE PTR [rbp-0x80]
   5d310:	mov    BYTE PTR [rbp-0x48],al
   5d313:	movzx  eax,BYTE PTR [rbp-0x1b0]
   5d31a:	mov    BYTE PTR [rbp-0x47],al
   5d31d:	movzx  eax,BYTE PTR [rbp-0x1e0]
   5d324:	mov    BYTE PTR [rbp-0x46],al
   5d327:	movzx  eax,BYTE PTR [rbp-0x2b0]
   5d32e:	mov    BYTE PTR [rbp-0x45],al
   5d331:	movzx  eax,BYTE PTR [rbp-0x358]
   5d338:	mov    BYTE PTR [rbp-0x44],al
   5d33b:	movzx  eax,BYTE PTR [rbp-0x338]
   5d342:	mov    BYTE PTR [rbp-0x43],al
   5d345:	movzx  eax,BYTE PTR [rbp-0x290]
   5d34c:	mov    BYTE PTR [rbp-0x42],al
   5d34f:	movzx  eax,BYTE PTR [rbp-0x270]
   5d356:	mov    BYTE PTR [rbp-0x41],al
   5d359:	movzx  eax,BYTE PTR [rbp-0x2f8]
   5d360:	mov    BYTE PTR [rbp-0x40],al
   5d363:	movzx  eax,BYTE PTR [rbp-0x200]
   5d36a:	mov    BYTE PTR [rbp-0x3f],al
   5d36d:	movzx  eax,BYTE PTR [rbp-0x2d8]
   5d374:	mov    BYTE PTR [rbp-0x3e],al
   5d377:	movzx  eax,BYTE PTR [rbp-0x318]
   5d37e:	mov    BYTE PTR [rbp-0x3d],al
   5d381:	movzx  eax,BYTE PTR [rbp-0x190]
   5d388:	mov    BYTE PTR [rbp-0x3c],al
   5d38b:	movzx  eax,BYTE PTR [rbp-0x29]
   5d38f:	mov    BYTE PTR [rbp-0x3b],al
   5d392:	mov    BYTE PTR [rbp-0x100],0x0
   5d399:	mov    BYTE PTR [rbp-0x180],0x0
   5d3a0:	mov    BYTE PTR [rbp-0x80],0x0
   5d3a4:	mov    BYTE PTR [rbp-0x1b0],0x0
   5d3ab:	mov    BYTE PTR [rbp-0x1e0],0x0
   5d3b2:	mov    BYTE PTR [rbp-0x2b0],0x0
   5d3b9:	mov    BYTE PTR [rbp-0x358],0x0
   5d3c0:	mov    BYTE PTR [rbp-0x338],0x0
   5d3c7:	mov    BYTE PTR [rbp-0x290],0x0
   5d3ce:	mov    BYTE PTR [rbp-0x270],0x0
   5d3d5:	mov    BYTE PTR [rbp-0x2f8],0x0
   5d3dc:	mov    BYTE PTR [rbp-0x200],0x0
   5d3e3:	mov    BYTE PTR [rbp-0x2d8],0x0
   5d3ea:	mov    BYTE PTR [rbp-0x318],0x0
   5d3f1:	mov    BYTE PTR [rbp-0x190],0x0
   5d3f8:	mov    BYTE PTR [rbp-0x29],0x0
   5d3fc:	movzx  eax,BYTE PTR [rbp-0x100]
   5d403:	mov    BYTE PTR [rbp-0x3a],al
   5d406:	movzx  eax,BYTE PTR [rbp-0x180]
   5d40d:	mov    BYTE PTR [rbp-0x39],al
   5d410:	movzx  eax,BYTE PTR [rbp-0x80]
   5d414:	mov    BYTE PTR [rbp-0x38],al
   5d417:	movzx  eax,BYTE PTR [rbp-0x1b0]
   5d41e:	mov    BYTE PTR [rbp-0x37],al
   5d421:	movzx  eax,BYTE PTR [rbp-0x1e0]
   5d428:	mov    BYTE PTR [rbp-0x36],al
   5d42b:	movzx  eax,BYTE PTR [rbp-0x2b0]
   5d432:	mov    BYTE PTR [rbp-0x35],al
   5d435:	movzx  eax,BYTE PTR [rbp-0x358]
   5d43c:	mov    BYTE PTR [rbp-0x34],al
   5d43f:	movzx  eax,BYTE PTR [rbp-0x338]
   5d446:	mov    BYTE PTR [rbp-0x33],al
   5d449:	movzx  eax,BYTE PTR [rbp-0x290]
   5d450:	mov    BYTE PTR [rbp-0x32],al
   5d453:	movzx  eax,BYTE PTR [rbp-0x270]
   5d45a:	mov    BYTE PTR [rbp-0x31],al
   5d45d:	movzx  eax,BYTE PTR [rbp-0x2f8]
   5d464:	mov    BYTE PTR [rbp-0x30],al
   5d467:	movzx  eax,BYTE PTR [rbp-0x200]
   5d46e:	mov    BYTE PTR [rbp-0x2f],al
   5d471:	movzx  eax,BYTE PTR [rbp-0x2d8]
   5d478:	mov    BYTE PTR [rbp-0x2e],al
   5d47b:	movzx  eax,BYTE PTR [rbp-0x318]
   5d482:	mov    BYTE PTR [rbp-0x2d],al
   5d485:	movzx  eax,BYTE PTR [rbp-0x190]
   5d48c:	mov    BYTE PTR [rbp-0x2c],al
   5d48f:	movzx  eax,BYTE PTR [rbp-0x29]
   5d493:	mov    BYTE PTR [rbp-0x2b],al
   5d496:	xorps  xmm0,xmm0
   5d499:	movaps XMMWORD PTR [rbp-0x100],xmm0
   5d4a0:	movaps xmm1,XMMWORD PTR [rbp-0x100]
   5d4a7:	mov    rax,QWORD PTR [rbp-0x238]
   5d4ae:	movups XMMWORD PTR [rax],xmm1
   5d4b1:	movaps XMMWORD PTR [rbp-0x100],xmm0
   5d4b8:	movaps xmm0,XMMWORD PTR [rbp-0x100]
   5d4bf:	movups XMMWORD PTR [rax+0x10],xmm0
   5d4c3:	mov    rax,rsi
   5d4c6:	add    rsp,0x338
   5d4cd:	pop    rbx
   5d4ce:	pop    r12
   5d4d0:	pop    r13
   5d4d2:	pop    r14
   5d4d4:	pop    r15
   5d4d6:	pop    rbp
   5d4d7:	ret
   5d4d8:	call   64990 <_RNvNtNtCskXK3iuL6Usm_12toyos_crypto4arch6x86_6414first_features>
   5d4dd:	jmp    5ca1d <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x1c2d>
   5d4e2:	call   64990 <_RNvNtNtCskXK3iuL6Usm_12toyos_crypto4arch6x86_6414first_features>
   5d4e7:	jmp    5cc25 <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x1e35>
   5d4ec:	jmp    5d51a <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x272a>
   5d4ee:	mov    rbx,rax
   5d4f1:	xorps  xmm0,xmm0
   5d4f4:	movaps XMMWORD PTR [rbp-0x1b0],xmm0
   5d4fb:	movaps xmm1,XMMWORD PTR [rbp-0x1b0]
   5d502:	movaps XMMWORD PTR [rbp-0x80],xmm1
   5d506:	movaps XMMWORD PTR [rbp-0x1b0],xmm0
   5d50d:	movaps xmm0,XMMWORD PTR [rbp-0x1b0]
   5d514:	movaps XMMWORD PTR [rbp-0x70],xmm0
   5d518:	jmp    5d51d <_RNvMs_NtCskXK3iuL6Usm_12toyos_crypto6x25519NtB4_9SecretKey5agree+0x272d>
   5d51a:	mov    rbx,rax
   5d51d:	lea    rdi,[rbp-0x180]
   5d524:	call   48a70 <_RINvNtCs9VSTO83uhuD_4core3ptr9drop_glueINtNtCskXK3iuL6Usm_12toyos_crypto6secret6SecretKj8_Ayj2_EEBG_>
   5d529:	mov    BYTE PTR [rbp-0x190],0x0
   5d530:	mov    BYTE PTR [rbp-0x29],0x0
   5d534:	mov    BYTE PTR [rbp-0x57],0x0
   5d538:	mov    BYTE PTR [rbp-0x56],0x0
   5d53c:	mov    BYTE PTR [rbp-0x55],0x0
   5d540:	mov    BYTE PTR [rbp-0x54],0x0
   5d544:	mov    BYTE PTR [rbp-0x53],0x0
   5d548:	mov    BYTE PTR [rbp-0x52],0x0
   5d54c:	mov    BYTE PTR [rbp-0x51],0x0
   5d550:	mov    BYTE PTR [rbp-0x50],0x0
   5d554:	mov    BYTE PTR [rbp-0x4f],0x0
   5d558:	mov    BYTE PTR [rbp-0x4e],0x0
   5d55c:	mov    BYTE PTR [rbp-0x4d],0x0
   5d560:	mov    BYTE PTR [rbp-0x4c],0x0
   5d564:	mov    BYTE PTR [rbp-0x4b],0x0
   5d568:	mov    BYTE PTR [rbp-0x4a],0x0
   5d56c:	movzx  eax,BYTE PTR [rbp-0x190]
   5d573:	mov    BYTE PTR [rbp-0x2a],al
   5d576:	movzx  eax,BYTE PTR [rbp-0x29]
   5d57a:	mov    BYTE PTR [rbp-0x49],al
   5d57d:	movzx  eax,BYTE PTR [rbp-0x57]
   5d581:	mov    BYTE PTR [rbp-0x48],al
   5d584:	movzx  eax,BYTE PTR [rbp-0x56]
   5d588:	mov    BYTE PTR [rbp-0x47],al
   5d58b:	movzx  eax,BYTE PTR [rbp-0x55]
   5d58f:	mov    BYTE PTR [rbp-0x46],al
   5d592:	movzx  eax,BYTE PTR [rbp-0x54]
   5d596:	mov    BYTE PTR [rbp-0x45],al
   5d599:	movzx  eax,BYTE PTR [rbp-0x53]
   5d59d:	mov    BYTE PTR [rbp-0x44],al
   5d5a0:	movzx  eax,BYTE PTR [rbp-0x52]
   5d5a4:	mov    BYTE PTR [rbp-0x43],al
   5d5a7:	movzx  eax,BYTE PTR [rbp-0x51]
   5d5ab:	mov    BYTE PTR [rbp-0x42],al
   5d5ae:	movzx  eax,BYTE PTR [rbp-0x50]
   5d5b2:	mov    BYTE PTR [rbp-0x41],al
   5d5b5:	movzx  eax,BYTE PTR [rbp-0x4f]
   5d5b9:	mov    BYTE PTR [rbp-0x40],al
   5d5bc:	movzx  eax,BYTE PTR [rbp-0x4e]
   5d5c0:	mov    BYTE PTR [rbp-0x3f],al
   5d5c3:	movzx  eax,BYTE PTR [rbp-0x4d]
   5d5c7:	mov    BYTE PTR [rbp-0x3e],al
   5d5ca:	movzx  eax,BYTE PTR [rbp-0x4c]
   5d5ce:	mov    BYTE PTR [rbp-0x3d],al
   5d5d1:	movzx  eax,BYTE PTR [rbp-0x4b]
   5d5d5:	mov    BYTE PTR [rbp-0x3c],al
   5d5d8:	movzx  eax,BYTE PTR [rbp-0x4a]
   5d5dc:	mov    BYTE PTR [rbp-0x3b],al
   5d5df:	mov    BYTE PTR [rbp-0x190],0x0
   5d5e6:	mov    BYTE PTR [rbp-0x29],0x0
   5d5ea:	mov    BYTE PTR [rbp-0x57],0x0
   5d5ee:	mov    BYTE PTR [rbp-0x56],0x0
   5d5f2:	mov    BYTE PTR [rbp-0x55],0x0
   5d5f6:	mov    BYTE PTR [rbp-0x54],0x0
   5d5fa:	mov    BYTE PTR [rbp-0x53],0x0
   5d5fe:	mov    BYTE PTR [rbp-0x52],0x0
   5d602:	mov    BYTE PTR [rbp-0x51],0x0
   5d606:	mov    BYTE PTR [rbp-0x50],0x0
   5d60a:	mov    BYTE PTR [rbp-0x4f],0x0
   5d60e:	mov    BYTE PTR [rbp-0x4e],0x0
   5d612:	mov    BYTE PTR [rbp-0x4d],0x0
   5d616:	mov    BYTE PTR [rbp-0x4c],0x0
   5d61a:	mov    BYTE PTR [rbp-0x4b],0x0
   5d61e:	mov    BYTE PTR [rbp-0x4a],0x0
   5d622:	movzx  eax,BYTE PTR [rbp-0x190]
   5d629:	mov    BYTE PTR [rbp-0x3a],al
   5d62c:	movzx  eax,BYTE PTR [rbp-0x29]
   5d630:	mov    BYTE PTR [rbp-0x39],al
   5d633:	movzx  eax,BYTE PTR [rbp-0x57]
   5d637:	mov    BYTE PTR [rbp-0x38],al
   5d63a:	movzx  eax,BYTE PTR [rbp-0x56]
   5d63e:	mov    BYTE PTR [rbp-0x37],al
   5d641:	movzx  eax,BYTE PTR [rbp-0x55]
   5d645:	mov    BYTE PTR [rbp-0x36],al
   5d648:	movzx  eax,BYTE PTR [rbp-0x54]
   5d64c:	mov    BYTE PTR [rbp-0x35],al
   5d64f:	movzx  eax,BYTE PTR [rbp-0x53]
   5d653:	mov    BYTE PTR [rbp-0x34],al
   5d656:	movzx  eax,BYTE PTR [rbp-0x52]
   5d65a:	mov    BYTE PTR [rbp-0x33],al
   5d65d:	movzx  eax,BYTE PTR [rbp-0x51]
   5d661:	mov    BYTE PTR [rbp-0x32],al
   5d664:	movzx  eax,BYTE PTR [rbp-0x50]
   5d668:	mov    BYTE PTR [rbp-0x31],al
   5d66b:	movzx  eax,BYTE PTR [rbp-0x4f]
   5d66f:	mov    BYTE PTR [rbp-0x30],al
   5d672:	movzx  eax,BYTE PTR [rbp-0x4e]
   5d676:	mov    BYTE PTR [rbp-0x2f],al
   5d679:	movzx  eax,BYTE PTR [rbp-0x4d]
   5d67d:	mov    BYTE PTR [rbp-0x2e],al
   5d680:	movzx  eax,BYTE PTR [rbp-0x4c]
   5d684:	mov    BYTE PTR [rbp-0x2d],al
   5d687:	movzx  eax,BYTE PTR [rbp-0x4b]
   5d68b:	mov    BYTE PTR [rbp-0x2c],al
   5d68e:	movzx  eax,BYTE PTR [rbp-0x4a]
   5d692:	mov    BYTE PTR [rbp-0x2b],al
   5d695:	xorps  xmm0,xmm0
   5d698:	movaps XMMWORD PTR [rbp-0x190],xmm0
   5d69f:	movaps xmm1,XMMWORD PTR [rbp-0x190]
   5d6a6:	mov    rax,QWORD PTR [rbp-0x238]
   5d6ad:	movups XMMWORD PTR [rax],xmm1
   5d6b0:	movaps XMMWORD PTR [rbp-0x190],xmm0
   5d6b7:	movaps xmm0,XMMWORD PTR [rbp-0x190]
   5d6be:	movups XMMWORD PTR [rax+0x10],xmm0
   5d6c2:	mov    rdi,rbx
   5d6c5:	call   b6be0 <_Unwind_Resume>
   5d6ca:	call   bbffa <_RNvNtCs9VSTO83uhuD_4core9panicking16panic_in_cleanup>
   5d6cf:	int3
