
$SCRATCH/poly1305-inline/image/sshserver-noninc-c9a3f65e1:	file format elf64-x86-64

Disassembly of section .text:

0000000000093ff0 <toyos_crypto::arch::x86_64::poly1305::blocks (.llvm.3142307217602062041)>:
   93ff0:      	pushq	%rbp
   93ff1:      	movq	%rsp, %rbp
   93ff4:      	pushq	%r15
   93ff6:      	pushq	%r14
   93ff8:      	pushq	%r13
   93ffa:      	pushq	%r12
   93ffc:      	pushq	%rbx
   93ffd:      	andq	$-0x20, %rsp
   94001:      	subq	$0x540, %rsp            # imm = 0x540
   94008:      	movq	%rdx, %r8
   9400b:      	movq	%rsi, 0x168(%rsp)
   94013:      	movq	(%rsi), %rdx
   94016:      	movq	0x8(%rsi), %rax
   9401a:      	movq	%rdx, %rsi
   9401d:      	movl	%esi, %r9d
   94020:      	movq	%rax, %rdx
   94023:      	shldq	$0xc, %rsi, %rdx
   94028:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
   9402f:      	movl	%r9d, 0x120(%rsp)
   94037:      	shrq	$0x1a, %rsi
   9403b:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
   94041:      	movq	%rsi, 0x200(%rsp)
   94049:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
   9404f:      	movq	%rdx, 0x1c0(%rsp)
   94057:      	shrq	$0xe, %rax
   9405b:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
   94060:      	movq	%rax, 0x260(%rsp)
   94068:      	movq	%rcx, 0x150(%rsp)
   94070:      	shrq	$0x3, %rcx
   94074:      	movq	%rcx, 0x240(%rsp)
   9407c:      	movq	0x10(%rdi), %r12
   94080:      	movq	(%rdi), %r10
   94083:      	movq	0x8(%rdi), %r11
   94087:      	movq	%r11, %rax
   9408a:      	mulq	%r12
   9408d:      	movq	%rdx, %rsi
   94090:      	movq	%rax, %rdi
   94093:      	movq	%r10, %rax
   94096:      	mulq	%r10
   94099:      	movq	%rdx, %r9
   9409c:      	movq	%rax, %rcx
   9409f:      	addq	%rdi, %rcx
   940a2:      	adcq	%rsi, %r9
   940a5:      	movq	%r11, %rax
   940a8:      	movq	%r11, %rbx
   940ab:      	movq	%r11, 0x58(%rsp)
   940b0:      	mulq	%r10
   940b3:      	movq	%rax, %r11
   940b6:      	shldq	$0x1, %rax, %rdx
   940bb:      	addq	%rax, %r11
   940be:      	addq	%r9, %r11
   940c1:      	adcq	$0x0, %rdx
   940c5:      	movl	%edx, %r15d
   940c8:      	andl	$0x3, %r15d
   940cc:      	shrq	$0x2, %rdx
   940d0:      	leaq	(%rdx,%rdx,4), %rax
   940d4:      	addq	%rcx, %rax
   940d7:      	movq	%rax, %rcx
   940da:      	adcq	$0x0, %r11
   940de:      	adcq	$0x0, %r15
   940e2:      	movq	%r11, %rax
   940e5:      	movq	%r11, 0x158(%rsp)
   940ed:      	mulq	%r10
   940f0:      	movq	%rax, %rsi
   940f3:      	movq	%rdx, %rdi
   940f6:      	movq	%r15, %r14
   940f9:      	imulq	%r10, %r14
   940fd:      	movq	%r10, %r13
   94100:      	movq	%rcx, %rax
   94103:      	movq	%rcx, %r10
   94106:      	movq	%rcx, 0x220(%rsp)
   9410e:      	mulq	%rbx
   94111:      	movq	%rdx, %rcx
   94114:      	movq	%rax, %r9
   94117:      	addq	%rsi, %r9
   9411a:      	adcq	%rdi, %rcx
   9411d:      	movq	%r11, %rax
   94120:      	mulq	%r12
   94123:      	movq	%rdx, %rdi
   94126:      	movq	%rax, %r11
   94129:      	movq	%r10, %rax
   9412c:      	mulq	%r13
   9412f:      	movq	%rdx, %rbx
   94132:      	movq	%rax, %rsi
   94135:      	addq	%r11, %rsi
   94138:      	adcq	%rdi, %rbx
   9413b:      	addq	%r9, %rbx
   9413e:      	adcq	$0x0, %rcx
   94142:      	movq	%r15, 0x1b8(%rsp)
   9414a:      	movq	%r15, %rax
   9414d:      	mulq	%r12
   94150:      	movq	%rax, %r9
   94153:      	addq	%rbx, %r9
   94156:      	adcq	%rcx, %rdx
   94159:      	addq	%r14, %rdx
   9415c:      	movl	%edx, %r15d
   9415f:      	andl	$0x3, %r15d
   94163:      	shrq	$0x2, %rdx
   94167:      	leaq	(%rdx,%rdx,4), %rbx
   9416b:      	addq	%rsi, %rbx
   9416e:      	adcq	$0x0, %r9
   94172:      	adcq	$0x0, %r15
   94176:      	movq	%r9, %rax
   94179:      	mulq	%r13
   9417c:      	movq	%rax, %rcx
   9417f:      	movq	%rdx, %rdi
   94182:      	movq	%r15, %r14
   94185:      	imulq	%r13, %r14
   94189:      	movq	%r13, %r10
   9418c:      	movq	%r13, 0xb8(%rsp)
   94194:      	movq	%rbx, %rax
   94197:      	movq	0x58(%rsp), %r13
   9419c:      	mulq	%r13
   9419f:      	movq	%rdx, %rsi
   941a2:      	movq	%rax, %r11
   941a5:      	addq	%rcx, %r11
   941a8:      	adcq	%rdi, %rsi
   941ab:      	movq	%r9, 0x1a8(%rsp)
   941b3:      	movq	%r9, %rax
   941b6:      	mulq	%r12
   941b9:      	movq	%rdx, %rcx
   941bc:      	movq	%rax, %rdi
   941bf:      	movq	%rbx, 0x1a0(%rsp)
   941c7:      	movq	%rbx, %rax
   941ca:      	mulq	%r10
   941cd:      	movq	%rdx, %rbx
   941d0:      	movq	%rax, %r9
   941d3:      	addq	%rdi, %r9
   941d6:      	adcq	%rcx, %rbx
   941d9:      	addq	%r11, %rbx
   941dc:      	adcq	$0x0, %rsi
   941e0:      	movq	%r15, 0x1b0(%rsp)
   941e8:      	movq	%r15, %rax
   941eb:      	mulq	%r12
   941ee:      	movq	%rax, %r10
   941f1:      	addq	%rbx, %r10
   941f4:      	adcq	%rsi, %rdx
   941f7:      	addq	%r14, %rdx
   941fa:      	movl	%edx, %eax
   941fc:      	andl	$0x3, %eax
   941ff:      	shrq	$0x2, %rdx
   94203:      	leaq	(%rdx,%rdx,4), %r11
   94207:      	addq	%r9, %r11
   9420a:      	adcq	$0x0, %r10
   9420e:      	adcq	$0x0, %rax
   94212:      	movq	%rax, %rcx
   94215:      	movq	%rax, 0xe0(%rsp)
   9421d:      	mulq	%r12
   94220:      	movq	%r12, %rsi
   94223:      	movq	%rdx, 0x80(%rsp)
   9422b:      	movq	%rax, %r9
   9422e:      	movq	%r11, %rax
   94231:      	movq	%r11, 0xc0(%rsp)
   94239:      	mulq	%r13
   9423c:      	movq	%rdx, %r14
   9423f:      	movq	%rax, %r15
   94242:      	movq	%r10, 0x100(%rsp)
   9424a:      	movq	%r10, %rax
   9424d:      	movq	0xb8(%rsp), %rdi
   94255:      	mulq	%rdi
   94258:      	movq	%rdx, %rbx
   9425b:      	movq	%rax, %r12
   9425e:      	addq	%r15, %r12
   94261:      	adcq	%r14, %rbx
   94264:      	movq	%r11, %rax
   94267:      	mulq	%rdi
   9426a:      	movq	%rdi, %r11
   9426d:      	movq	%rdx, %r14
   94270:      	movq	%rax, %r15
   94273:      	movq	%r10, %rax
   94276:      	movq	%rsi, %r10
   94279:      	mulq	%rsi
   9427c:      	movq	%rdx, %rdi
   9427f:      	addq	%r15, %rax
   94282:      	adcq	%r14, %rdi
   94285:      	addq	%r12, %rdi
   94288:      	adcq	$0x0, %rbx
   9428c:      	addq	%r9, %rdi
   9428f:      	adcq	0x80(%rsp), %rbx
   94297:      	movq	%rcx, %rsi
   9429a:      	imulq	%r11, %rsi
   9429e:      	addq	%rbx, %rsi
   942a1:      	movq	%rsi, %rdx
   942a4:      	shrq	$0x2, %rdx
   942a8:      	leaq	(%rdx,%rdx,4), %r13
   942ac:      	andl	$0x3, %esi
   942af:      	addq	%rax, %r13
   942b2:      	adcq	$0x0, %rdi
   942b6:      	adcq	$0x0, %rsi
   942ba:      	movq	%rsi, %rax
   942bd:      	mulq	%r10
   942c0:      	movq	%r10, %rcx
   942c3:      	movq	%rdx, 0x80(%rsp)
   942cb:      	movq	%rax, %r9
   942ce:      	movq	%r13, %rax
   942d1:      	movq	0x58(%rsp), %r10
   942d6:      	mulq	%r10
   942d9:      	movq	%rdx, %r14
   942dc:      	movq	%rax, %r15
   942df:      	movq	%rdi, %rax
   942e2:      	mulq	%r11
   942e5:      	movq	%rdx, %rbx
   942e8:      	movq	%rax, %r12
   942eb:      	addq	%r15, %r12
   942ee:      	adcq	%r14, %rbx
   942f1:      	movq	%r13, 0x188(%rsp)
   942f9:      	movq	%r13, %rax
   942fc:      	mulq	%r11
   942ff:      	movq	%rdx, %r15
   94302:      	movq	%rax, %r13
   94305:      	movq	%rdi, 0x198(%rsp)
   9430d:      	movq	%rdi, %rax
   94310:      	movq	%rcx, %rdi
   94313:      	mulq	%rcx
   94316:      	movq	%rdx, %rcx
   94319:      	addq	%r13, %rax
   9431c:      	adcq	%r15, %rcx
   9431f:      	addq	%r12, %rcx
   94322:      	adcq	$0x0, %rbx
   94326:      	addq	%r9, %rcx
   94329:      	adcq	0x80(%rsp), %rbx
   94331:      	movq	%rsi, 0x190(%rsp)
   94339:      	imulq	%r11, %rsi
   9433d:      	addq	%rbx, %rsi
   94340:      	movq	%rsi, %rdx
   94343:      	shrq	$0x2, %rdx
   94347:      	leaq	(%rdx,%rdx,4), %r15
   9434b:      	andl	$0x3, %esi
   9434e:      	addq	%rax, %r15
   94351:      	adcq	$0x0, %rcx
   94355:      	adcq	$0x0, %rsi
   94359:      	movq	%rsi, %rax
   9435c:      	mulq	%rdi
   9435f:      	movq	%rdi, %r9
   94362:      	movq	%rdx, 0x80(%rsp)
   9436a:      	movq	%rax, 0x60(%rsp)
   9436f:      	movq	%r15, %rax
   94372:      	mulq	%r10
   94375:      	movq	%rdx, %r14
   94378:      	movq	%rax, %r12
   9437b:      	movq	%rcx, %rax
   9437e:      	mulq	%r11
   94381:      	movq	%rdx, %rbx
   94384:      	movq	%rax, %r13
   94387:      	addq	%r12, %r13
   9438a:      	adcq	%r14, %rbx
   9438d:      	movq	%r15, %rax
   94390:      	mulq	%r11
   94393:      	movq	%rdx, %rdi
   94396:      	movq	%rax, %r14
   94399:      	movq	%rcx, %rax
   9439c:      	mulq	%r9
   9439f:      	movq	%rdx, %r12
   943a2:      	addq	%r14, %rax
   943a5:      	adcq	%rdi, %r12
   943a8:      	addq	%r13, %r12
   943ab:      	adcq	$0x0, %rbx
   943af:      	vmovd	0x120(%rsp), %xmm12
   943b8:      	addq	0x60(%rsp), %r12
   943bd:      	adcq	0x80(%rsp), %rbx
   943c5:      	movq	%rsi, 0x178(%rsp)
   943cd:      	movq	%rsi, %r14
   943d0:      	imulq	%r11, %r14
   943d4:      	addq	%rbx, %r14
   943d7:      	movq	%r14, %rdx
   943da:      	shrq	$0x2, %rdx
   943de:      	leaq	(%rdx,%rdx,4), %r13
   943e2:      	andl	$0x3, %r14d
   943e6:      	addq	%rax, %r13
   943e9:      	adcq	$0x0, %r12
   943ed:      	adcq	$0x0, %r14
   943f1:      	movq	%r14, %rax
   943f4:      	mulq	%r9
   943f7:      	movq	%r9, %rbx
   943fa:      	movq	%rdx, 0x120(%rsp)
   94402:      	movq	%rax, 0x60(%rsp)
   94407:      	movq	%r13, %rax
   9440a:      	mulq	%r10
   9440d:      	movq	%rax, %rdi
   94410:      	movq	%rdx, %r10
   94413:      	vmovss	0x200(%rsp), %xmm0
   9441c:      	vmovaps	%ymm0, 0x80(%rsp)
   94425:      	movq	%r12, %rax
   94428:      	mulq	%r11
   9442b:      	movq	%rdx, %rsi
   9442e:      	movq	%rax, %r9
   94431:      	addq	%rdi, %r9
   94434:      	adcq	%r10, %rsi
   94437:      	movq	%r13, 0x160(%rsp)
   9443f:      	movq	%r13, %rax
   94442:      	mulq	%r11
   94445:      	movq	%rdx, %rdi
   94448:      	movq	%rax, %r13
   9444b:      	movq	%r12, %rax
   9444e:      	mulq	%rbx
   94451:      	addq	%r13, %rax
   94454:      	adcq	%rdi, %rdx
   94457:      	movq	%r15, %rdi
   9445a:      	addq	%r9, %rdx
   9445d:      	adcq	$0x0, %rsi
   94461:      	addq	0x60(%rsp), %rdx
   94466:      	adcq	0x120(%rsp), %rsi
   9446e:      	movq	%r14, 0x170(%rsp)
   94476:      	imulq	%r11, %r14
   9447a:      	movq	0x158(%rsp), %r10
   94482:      	addq	%rsi, %r14
   94485:      	movq	%r14, %rsi
   94488:      	shrq	$0x2, %rsi
   9448c:      	leaq	(%rsi,%rsi,4), %rbx
   94490:      	andl	$0x3, %r14d
   94494:      	addq	%rax, %rbx
   94497:      	adcq	$0x0, %rdx
   9449b:      	adcq	$0x0, %r14
   9449f:      	movl	%ebx, %eax
   944a1:      	andl	$0x3ffffff, %eax        # imm = 0x3FFFFFF
   944a6:      	movq	%rdx, %r15
   944a9:      	shldq	$0xc, %rbx, %r15
   944ae:      	shrq	$0x1a, %rbx
   944b2:      	andl	$0x3ffffff, %ebx        # imm = 0x3FFFFFF
   944b8:      	andl	$0x3ffffff, %r15d       # imm = 0x3FFFFFF
   944bf:      	shldq	$0x18, %rdx, %r14
   944c4:      	shrq	$0xe, %rdx
   944c8:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
   944ce:      	movq	%rax, 0x18(%rsp)
   944d3:      	movq	%rbx, 0x20(%rsp)
   944d8:      	movq	%r15, 0x28(%rsp)
   944dd:      	movq	%rdx, 0x30(%rsp)
   944e2:      	movq	%r14, 0x38(%rsp)
   944e7:      	movq	%rax, 0x40(%rsp)
   944ec:      	vmovdqu	0x38(%rsp), %xmm4
   944f2:      	vmovdqu	0x30(%rsp), %xmm3
   944f8:      	vmovdqu	0x28(%rsp), %xmm2
   944fe:      	vmovdqu	0x20(%rsp), %xmm1
   94504:      	vmovdqu	0x18(%rsp), %xmm0
   9450a:      	movl	%edi, %r9d
   9450d:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
   94514:      	movq	%rcx, 0x180(%rsp)
   9451c:      	movq	%rcx, %rsi
   9451f:      	shldq	$0xc, %rdi, %rsi
   94524:      	shrq	$0x1a, %rdi
   94528:      	andl	$0x3ffffff, %edi        # imm = 0x3FFFFFF
   9452e:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
   94534:      	movq	%rax, 0x18(%rsp)
   94539:      	movq	%rbx, 0x20(%rsp)
   9453e:      	movq	%r15, 0x28(%rsp)
   94543:      	movq	%rdx, 0x30(%rsp)
   94548:      	movq	%r14, 0x38(%rsp)
   9454d:      	movq	%r9, 0x40(%rsp)
   94552:      	movq	%rdi, 0x48(%rsp)
   94557:      	movq	%rsi, 0x50(%rsp)
   9455c:      	vmovups	0x18(%rsp), %ymm5
   94562:      	vmovaps	%ymm5, 0x3c0(%rsp)
   9456b:      	vmovups	0x20(%rsp), %ymm5
   94571:      	vmovaps	%ymm5, 0x400(%rsp)
   9457a:      	vmovups	0x28(%rsp), %ymm5
   94580:      	vmovaps	%ymm5, 0x420(%rsp)
   94589:      	vmovups	0x30(%rsp), %ymm5
   9458f:      	vmovaps	%ymm5, 0x480(%rsp)
   94598:      	vmovups	0x38(%rsp), %ymm5
   9459e:      	vmovaps	%ymm5, 0x4c0(%rsp)
   945a7:      	movq	0xc0(%rsp), %r11
   945af:      	movl	%r11d, %r13d
   945b2:      	andl	$0x3ffffff, %r13d       # imm = 0x3FFFFFF
   945b9:      	movq	%r13, 0x18(%rsp)
   945be:      	movq	0x100(%rsp), %rcx
   945c6:      	movq	%rcx, %r13
   945c9:      	shldq	$0xc, %r11, %r13
   945ce:      	shrq	$0x1a, %r11
   945d2:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
   945d9:      	movq	%r11, 0x20(%rsp)
   945de:      	andl	$0x3ffffff, %r13d       # imm = 0x3FFFFFF
   945e5:      	movq	%r13, 0x28(%rsp)
   945ea:      	movq	0xe0(%rsp), %r11
   945f2:      	shldq	$0x18, %rcx, %r11
   945f7:      	shrq	$0xe, %rcx
   945fb:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
   94601:      	movq	%rcx, 0x30(%rsp)
   94606:      	vpinsrq	$0x1, %r14, %xmm4, %xmm5
   9460c:      	movq	%r11, 0x38(%rsp)
   94611:      	vmovq	%r14, %xmm6
   94616:      	movq	0x220(%rsp), %r14
   9461e:      	vpinsrq	$0x1, %rdx, %xmm3, %xmm3
   94624:      	vmovq	%rdx, %xmm4
   94629:      	vpinsrq	$0x1, %r15, %xmm2, %xmm2
   9462f:      	vmovq	%r15, %xmm7
   94634:      	movq	0x240(%rsp), %r15
   9463c:      	vpinsrq	$0x1, %rbx, %xmm1, %xmm1
   94642:      	vmovq	%rbx, %xmm8
   94647:      	movq	0x168(%rsp), %rbx
   9464f:      	vpbroadcastq	%xmm6, %ymm6
   94654:      	vpblendd	$0xf0, %ymm6, %ymm5, %ymm6 # ymm6 = ymm5[0,1,2,3],ymm6[4,5,6,7]
   9465a:      	vpinsrq	$0x1, %rax, %xmm0, %xmm0
   94660:      	vmovq	%rax, %xmm5
   94665:      	movq	%r10, %rcx
   94668:      	shldq	$0xc, %r14, %rcx
   9466d:      	movl	%r14d, %edx
   94670:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
   94676:      	shrq	$0x1a, %r14
   9467a:      	andl	$0x3ffffff, %r14d       # imm = 0x3FFFFFF
   94681:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
   94687:      	movq	%rdx, 0x40(%rsp)
   9468c:      	movq	%r14, 0x48(%rsp)
   94691:      	movq	%rcx, 0x50(%rsp)
   94696:      	vpbroadcastq	%xmm4, %ymm4
   9469b:      	vpblendd	$0xf0, %ymm4, %ymm3, %ymm4 # ymm4 = ymm3[0,1,2,3],ymm4[4,5,6,7]
   946a1:      	vpsllq	$0x2, %ymm6, %ymm3
   946a6:      	vmovdqa	%ymm6, 0x60(%rsp)
   946ac:      	vpaddq	%ymm6, %ymm3, %ymm3
   946b0:      	vmovdqa	%ymm3, 0x300(%rsp)
   946b9:      	vpbroadcastq	%xmm7, %ymm3
   946be:      	vpblendd	$0xf0, %ymm3, %ymm2, %ymm3 # ymm3 = ymm2[0,1,2,3],ymm3[4,5,6,7]
   946c4:      	vpsllq	$0x2, %ymm4, %ymm2
   946c9:      	vmovdqa	%ymm4, 0x1e0(%rsp)
   946d2:      	vpaddq	%ymm4, %ymm2, %ymm2
   946d6:      	vmovdqa	%ymm2, 0x2c0(%rsp)
   946df:      	vpbroadcastq	%xmm8, %ymm2
   946e4:      	vpblendd	$0xf0, %ymm2, %ymm1, %ymm2 # ymm2 = ymm1[0,1,2,3],ymm2[4,5,6,7]
   946ea:      	vpsllq	$0x2, %ymm3, %ymm1
   946ef:      	vmovdqa	%ymm3, 0x2e0(%rsp)
   946f8:      	vpaddq	%ymm3, %ymm1, %ymm1
   946fc:      	vmovdqa	%ymm1, 0x2a0(%rsp)
   94705:      	vpbroadcastq	%xmm5, %ymm4
   9470a:      	vpblendd	$0xf0, %ymm4, %ymm0, %ymm0 # ymm0 = ymm0[0,1,2,3],ymm4[4,5,6,7]
   94710:      	vmovdqa	%ymm0, 0x320(%rsp)
   94719:      	vpsllq	$0x2, %ymm2, %ymm0
   9471e:      	vmovdqa	%ymm2, 0x340(%rsp)
   94727:      	vpaddq	%ymm2, %ymm0, %ymm0
   9472b:      	vmovdqa	%ymm0, 0x280(%rsp)
   94734:      	leaq	-0x1(%r15), %rax
   94738:      	shlq	$0x7, %r15
   9473c:      	addq	$-0x80, %r15
   94740:      	xorl	%r11d, %r11d
   94743:      	vmovss	0x1c0(%rsp), %xmm0
   9474c:      	vmovaps	%ymm0, 0xe0(%rsp)
   94755:      	vmovss	0x260(%rsp), %xmm0
   9475e:      	vmovaps	%ymm0, 0x100(%rsp)
   94767:      	vmovsd	0xd(%rbx), %xmm0
   9476c:      	vmovaps	%ymm0, 0xc0(%rsp)
   94775:      	vmovups	0x18(%rsp), %ymm0
   9477b:      	vmovaps	%ymm0, 0x3e0(%rsp)
   94784:      	vmovups	0x20(%rsp), %ymm0
   9478a:      	vmovaps	%ymm0, 0x440(%rsp)
   94793:      	vmovups	0x28(%rsp), %ymm0
   94799:      	vmovaps	%ymm0, 0x460(%rsp)
   947a2:      	vmovups	0x30(%rsp), %ymm0
   947a8:      	vmovaps	%ymm0, 0x4a0(%rsp)
   947b1:      	vmovups	0x38(%rsp), %ymm0
   947b7:      	vmovaps	%ymm0, 0x4e0(%rsp)
   947c0:      	vxorps	%xmm0, %xmm0, %xmm0
   947c4:      	vmovaps	%ymm0, 0x120(%rsp)
   947cd:      	vbroadcastsd	-0x7c4fe(%rip), %ymm0 # 0x182d8 <anon.61c29e2b6718c1088020d883dbc089c6.10.llvm.11391827976878554171+0x114>
   947d6:      	vmovaps	%ymm0, 0x360(%rsp)
   947df:      	vpbroadcastq	-0x7c4d8(%rip), %ymm0 # 0x18310 <anon.61c29e2b6718c1088020d883dbc089c6.10.llvm.11391827976878554171+0x14c>
   947e8:      	vmovdqa	%ymm0, 0x1c0(%rsp)
   947f1:      	vpxor	%xmm0, %xmm0, %xmm0
   947f5:      	vmovdqa	%ymm0, 0x240(%rsp)
   947fe:      	vmovdqa	%ymm0, 0x220(%rsp)
   94807:      	vmovdqa	%ymm0, 0x200(%rsp)
   94810:      	vmovdqa	%ymm0, 0x260(%rsp)
   94819:      	vmovdqa	0x320(%rsp), %ymm14
   94822:      	nopw	%cs:(%rax,%rax)
   94830:      	vmovdqu	(%r8,%r11), %ymm4
   94836:      	vmovdqu	0x20(%r8,%r11), %ymm7
   9483d:      	vmovdqu	0x40(%r8,%r11), %ymm8
   94844:      	vmovdqu	0x60(%r8,%r11), %ymm11
   9484b:      	vpunpckhqdq	%ymm7, %ymm4, %ymm5 # ymm5 = ymm4[1],ymm7[1],ymm4[3],ymm7[3]
   9484f:      	vpunpcklqdq	%ymm7, %ymm4, %ymm4 # ymm4 = ymm4[0],ymm7[0],ymm4[2],ymm7[2]
   94853:      	vpsrlq	$0x34, %ymm4, %ymm7
   94858:      	vpsllq	$0xc, %ymm5, %ymm9
   9485d:      	vpor	%ymm7, %ymm9, %ymm9
   94861:      	vpunpcklqdq	%ymm11, %ymm8, %ymm13 # ymm13 = ymm8[0],ymm11[0],ymm8[2],ymm11[2]
   94866:      	vpunpckhqdq	%ymm11, %ymm8, %ymm0 # ymm0 = ymm8[1],ymm11[1],ymm8[3],ymm11[3]
   9486b:      	vmovdqa	%ymm0, 0x380(%rsp)
   94874:      	vpsrlq	$0x34, %ymm13, %ymm7
   9487a:      	vpsllq	$0xc, %ymm0, %ymm11
   9487f:      	vpor	%ymm7, %ymm11, %ymm0
   94883:      	vmovdqa	%ymm0, 0x3a0(%rsp)
   9488c:      	vpsrlq	$0x1a, %ymm12, %ymm11
   94892:      	vpaddq	0x80(%rsp), %ymm11, %ymm11
   9489b:      	vmovdqa	0x100(%rsp), %ymm3
   948a4:      	vpsrlq	$0x1a, %ymm3, %ymm15
   948a9:      	vpaddq	0xc0(%rsp), %ymm15, %ymm15
   948b2:      	vpsrlq	$0x1a, %ymm11, %ymm10
   948b8:      	vpaddq	0xe0(%rsp), %ymm10, %ymm10
   948c1:      	vpsrlq	$0x28, %ymm5, %ymm1
   948c6:      	vmovdqa	0x360(%rsp), %ymm0
   948cf:      	vpand	%ymm0, %ymm15, %ymm7
   948d3:      	vpaddq	%ymm1, %ymm7, %ymm1
   948d7:      	vpsrlq	$0x1a, %ymm15, %ymm7
   948dd:      	vpsllq	$0x2, %ymm7, %ymm15
   948e2:      	vpaddq	%ymm7, %ymm15, %ymm7
   948e6:      	vpand	%ymm0, %ymm12, %ymm15
   948ea:      	vpaddq	%ymm7, %ymm15, %ymm7
   948ee:      	vpand	%ymm0, %ymm3, %ymm15
   948f2:      	vpsrlq	$0x1a, %ymm10, %ymm3
   948f8:      	vpaddq	%ymm3, %ymm15, %ymm3
   948fc:      	vpsrlq	$0xe, %ymm5, %ymm5
   94901:      	vpand	%ymm0, %ymm5, %ymm12
   94905:      	vpand	%ymm0, %ymm9, %ymm5
   94909:      	vpand	%ymm0, %ymm11, %ymm9
   9490d:      	vpand	%ymm0, %ymm10, %ymm10
   94911:      	vpaddq	%ymm5, %ymm10, %ymm11
   94915:      	vpsrlq	$0x1a, %ymm7, %ymm5
   9491a:      	vpaddq	%ymm5, %ymm9, %ymm5
   9491e:      	vpsrlq	$0x1a, %ymm4, %ymm9
   94923:      	vpand	%ymm0, %ymm9, %ymm9
   94927:      	vpand	%ymm0, %ymm4, %ymm4
   9492b:      	vpaddq	%ymm5, %ymm9, %ymm15
   9492f:      	vpand	%ymm0, %ymm7, %ymm5
   94933:      	vpaddq	%ymm5, %ymm4, %ymm5
   94937:      	vpsrlq	$0x1a, %ymm3, %ymm4
   9493c:      	vpaddq	%ymm4, %ymm1, %ymm1
   94940:      	vpand	%ymm0, %ymm3, %ymm3
   94944:      	vpaddq	%ymm3, %ymm12, %ymm9
   94948:      	vpaddq	0x1c0(%rsp), %ymm1, %ymm4
   94951:      	vpmuludq	%ymm5, %ymm14, %ymm1
   94955:      	vmovdqa	0x300(%rsp), %ymm2
   9495e:      	vpmuludq	%ymm2, %ymm15, %ymm3
   94962:      	vmovdqa	0x2a0(%rsp), %ymm12
   9496b:      	vpmuludq	%ymm12, %ymm9, %ymm7
   94970:      	vpaddq	%ymm7, %ymm1, %ymm1
   94974:      	vmovdqa	0x2c0(%rsp), %ymm6
   9497d:      	vpmuludq	%ymm6, %ymm11, %ymm7
   94981:      	vpaddq	%ymm1, %ymm7, %ymm1
   94985:      	vpmuludq	0x280(%rsp), %ymm4, %ymm7
   9498e:      	vpaddq	%ymm3, %ymm7, %ymm3
   94992:      	vpaddq	%ymm3, %ymm1, %ymm1
   94996:      	vmovdqa	%ymm1, 0x500(%rsp)
   9499f:      	vmovdqa	0x340(%rsp), %ymm8
   949a8:      	vpmuludq	%ymm5, %ymm8, %ymm1
   949ac:      	vpmuludq	%ymm6, %ymm9, %ymm3
   949b0:      	vpaddq	%ymm3, %ymm1, %ymm1
   949b4:      	vpmuludq	%ymm2, %ymm11, %ymm3
   949b8:      	vpaddq	%ymm1, %ymm3, %ymm1
   949bc:      	vpmuludq	%ymm14, %ymm15, %ymm3
   949c1:      	vpmuludq	%ymm4, %ymm12, %ymm7
   949c5:      	vpaddq	%ymm3, %ymm7, %ymm3
   949c9:      	vpaddq	%ymm3, %ymm1, %ymm1
   949cd:      	vmovdqa	%ymm1, 0x80(%rsp)
   949d6:      	vmovdqa	0x2e0(%rsp), %ymm10
   949df:      	vpmuludq	%ymm5, %ymm10, %ymm1
   949e3:      	vpmuludq	%ymm2, %ymm9, %ymm3
   949e7:      	vpaddq	%ymm3, %ymm1, %ymm1
   949eb:      	vpmuludq	%ymm14, %ymm11, %ymm3
   949f0:      	vpaddq	%ymm1, %ymm3, %ymm1
   949f4:      	vpmuludq	%ymm8, %ymm15, %ymm3
   949f9:      	vpmuludq	%ymm6, %ymm4, %ymm7
   949fd:      	vpaddq	%ymm3, %ymm7, %ymm3
   94a01:      	vpaddq	%ymm3, %ymm1, %ymm1
   94a05:      	vmovdqa	%ymm1, 0xe0(%rsp)
   94a0e:      	vmovdqa	0x1e0(%rsp), %ymm12
   94a17:      	vpmuludq	%ymm5, %ymm12, %ymm1
   94a1b:      	vpmuludq	%ymm14, %ymm9, %ymm3
   94a20:      	vpaddq	%ymm3, %ymm1, %ymm1
   94a24:      	vpmuludq	%ymm8, %ymm11, %ymm3
   94a29:      	vpaddq	%ymm1, %ymm3, %ymm1
   94a2d:      	vpmuludq	%ymm10, %ymm15, %ymm3
   94a32:      	vpmuludq	%ymm2, %ymm4, %ymm7
   94a36:      	vpaddq	%ymm3, %ymm7, %ymm3
   94a3a:      	vpaddq	%ymm3, %ymm1, %ymm1
   94a3e:      	vmovdqa	%ymm1, 0x100(%rsp)
   94a47:      	vpmuludq	0x60(%rsp), %ymm5, %ymm1
   94a4d:      	vpmuludq	%ymm8, %ymm9, %ymm3
   94a52:      	vmovdqa	%ymm8, %ymm6
   94a56:      	vpaddq	%ymm3, %ymm1, %ymm1
   94a5a:      	vpmuludq	%ymm10, %ymm11, %ymm3
   94a5f:      	vpaddq	%ymm1, %ymm3, %ymm1
   94a63:      	vpand	%ymm0, %ymm13, %ymm5
   94a67:      	vpsrlq	$0x1a, %ymm13, %ymm3
   94a6d:      	vpand	%ymm0, %ymm3, %ymm3
   94a71:      	vpand	0x3a0(%rsp), %ymm0, %ymm7
   94a7a:      	vpmuludq	%ymm12, %ymm15, %ymm9
   94a7f:      	vpmuludq	%ymm4, %ymm14, %ymm4
   94a83:      	vpaddq	%ymm4, %ymm9, %ymm4
   94a87:      	vmovdqa	0x380(%rsp), %ymm2
   94a90:      	vpsrlq	$0xe, %ymm2, %ymm9
   94a95:      	vpand	%ymm0, %ymm9, %ymm9
   94a99:      	vpsrlq	$0x28, %ymm2, %ymm8
   94a9e:      	vpaddq	%ymm4, %ymm1, %ymm1
   94aa2:      	vmovdqa	%ymm1, 0xc0(%rsp)
   94aab:      	vmovdqa	0x260(%rsp), %ymm4
   94ab4:      	vpsrlq	$0x1a, %ymm4, %ymm1
   94ab9:      	vpaddq	0x200(%rsp), %ymm1, %ymm1
   94ac2:      	vpand	%ymm0, %ymm4, %ymm4
   94ac6:      	vmovdqa	0x240(%rsp), %ymm11
   94acf:      	vpsrlq	$0x1a, %ymm11, %ymm10
   94ad5:      	vpaddq	0x120(%rsp), %ymm10, %ymm10
   94ade:      	vpand	%ymm0, %ymm11, %ymm11
   94ae2:      	vpsrlq	$0x1a, %ymm1, %ymm12
   94ae7:      	vpaddq	0x220(%rsp), %ymm12, %ymm12
   94af0:      	vpand	%ymm0, %ymm1, %ymm1
   94af4:      	vpsrlq	$0x1a, %ymm10, %ymm13
   94afa:      	vpand	%ymm0, %ymm10, %ymm10
   94afe:      	vpaddq	%ymm8, %ymm10, %ymm10
   94b03:      	vpsllq	$0x2, %ymm13, %ymm8
   94b09:      	vpaddq	%ymm13, %ymm8, %ymm8
   94b0e:      	vpaddq	%ymm4, %ymm8, %ymm8
   94b12:      	vpsrlq	$0x1a, %ymm12, %ymm4
   94b18:      	vpaddq	%ymm4, %ymm11, %ymm11
   94b1c:      	vpand	%ymm0, %ymm12, %ymm4
   94b20:      	vmovdqa	0x500(%rsp), %ymm12
   94b29:      	vpaddq	%ymm4, %ymm7, %ymm4
   94b2d:      	vpsrlq	$0x1a, %ymm8, %ymm7
   94b33:      	vpaddq	%ymm1, %ymm7, %ymm1
   94b37:      	vpaddq	%ymm3, %ymm1, %ymm7
   94b3b:      	vpand	%ymm0, %ymm8, %ymm1
   94b3f:      	vpaddq	%ymm1, %ymm5, %ymm8
   94b43:      	vpsrlq	$0x1a, %ymm11, %ymm1
   94b49:      	vpaddq	%ymm1, %ymm10, %ymm1
   94b4d:      	vpand	%ymm0, %ymm11, %ymm3
   94b51:      	vpaddq	%ymm3, %ymm9, %ymm9
   94b55:      	vpaddq	0x1c0(%rsp), %ymm1, %ymm5
   94b5e:      	vpmuludq	%ymm14, %ymm8, %ymm1
   94b63:      	vmovdqa	0x300(%rsp), %ymm2
   94b6c:      	vpmuludq	%ymm2, %ymm7, %ymm3
   94b70:      	vmovdqa	0x2c0(%rsp), %ymm15
   94b79:      	vpmuludq	%ymm4, %ymm15, %ymm10
   94b7d:      	vmovdqa	0x2a0(%rsp), %ymm13
   94b86:      	vpmuludq	%ymm13, %ymm9, %ymm11
   94b8b:      	vpaddq	%ymm1, %ymm11, %ymm1
   94b8f:      	vpaddq	%ymm1, %ymm10, %ymm1
   94b93:      	vpmuludq	0x280(%rsp), %ymm5, %ymm10
   94b9c:      	vpaddq	%ymm3, %ymm10, %ymm3
   94ba0:      	vpaddq	%ymm3, %ymm1, %ymm0
   94ba4:      	vmovdqa	%ymm0, 0x260(%rsp)
   94bad:      	vpmuludq	%ymm6, %ymm8, %ymm1
   94bb1:      	vpmuludq	%ymm7, %ymm14, %ymm3
   94bb5:      	vpmuludq	%ymm2, %ymm4, %ymm10
   94bb9:      	vpmuludq	%ymm15, %ymm9, %ymm11
   94bbe:      	vpaddq	%ymm1, %ymm11, %ymm1
   94bc2:      	vpaddq	%ymm1, %ymm10, %ymm1
   94bc6:      	vpmuludq	%ymm5, %ymm13, %ymm10
   94bca:      	vpaddq	%ymm3, %ymm10, %ymm3
   94bce:      	vpaddq	%ymm3, %ymm1, %ymm0
   94bd2:      	vmovdqa	%ymm0, 0x200(%rsp)
   94bdb:      	vmovdqa	0x2e0(%rsp), %ymm13
   94be4:      	vpmuludq	%ymm13, %ymm8, %ymm1
   94be9:      	vpmuludq	%ymm6, %ymm7, %ymm3
   94bed:      	vpmuludq	%ymm4, %ymm14, %ymm10
   94bf1:      	vpmuludq	%ymm2, %ymm9, %ymm11
   94bf5:      	vpaddq	%ymm1, %ymm11, %ymm1
   94bf9:      	vpaddq	%ymm1, %ymm10, %ymm1
   94bfd:      	vpmuludq	%ymm5, %ymm15, %ymm10
   94c01:      	vpaddq	%ymm3, %ymm10, %ymm3
   94c05:      	vpaddq	%ymm3, %ymm1, %ymm0
   94c09:      	vmovdqa	%ymm0, 0x220(%rsp)
   94c12:      	vmovdqa	0x1e0(%rsp), %ymm11
   94c1b:      	vpmuludq	%ymm11, %ymm8, %ymm1
   94c20:      	vpmuludq	%ymm7, %ymm13, %ymm3
   94c24:      	vpmuludq	%ymm14, %ymm9, %ymm10
   94c29:      	vpaddq	%ymm1, %ymm10, %ymm1
   94c2d:      	vpmuludq	%ymm6, %ymm4, %ymm10
   94c31:      	vpaddq	%ymm1, %ymm10, %ymm1
   94c35:      	vpmuludq	%ymm2, %ymm5, %ymm10
   94c39:      	vpaddq	%ymm3, %ymm10, %ymm3
   94c3d:      	vpaddq	%ymm3, %ymm1, %ymm0
   94c41:      	vmovdqa	%ymm0, 0x240(%rsp)
   94c4a:      	vpmuludq	0x60(%rsp), %ymm8, %ymm1
   94c50:      	vpmuludq	%ymm6, %ymm9, %ymm3
   94c54:      	vpaddq	%ymm3, %ymm1, %ymm1
   94c58:      	vpmuludq	%ymm4, %ymm13, %ymm3
   94c5c:      	vpaddq	%ymm1, %ymm3, %ymm1
   94c60:      	vpmuludq	%ymm7, %ymm11, %ymm3
   94c64:      	vpmuludq	%ymm5, %ymm14, %ymm4
   94c68:      	vpaddq	%ymm3, %ymm4, %ymm3
   94c6c:      	vpaddq	%ymm3, %ymm1, %ymm0
   94c70:      	vmovdqa	%ymm0, 0x120(%rsp)
   94c79:      	subq	$-0x80, %r11
   94c7d:      	cmpq	%r11, %r15
   94c80:      	jne	0x94830 <toyos_crypto::arch::x86_64::poly1305::blocks (.llvm.3142307217602062041)+0x840>
   94c86:      	vmovdqa	0x3c0(%rsp), %ymm0
   94c8f:      	vpinsrq	$0x1, %r9, %xmm0, %xmm1
   94c95:      	movq	0x160(%rsp), %r11
   94c9d:      	movl	%r11d, %r9d
   94ca0:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
   94ca7:      	vmovq	%r9, %xmm2
   94cac:      	vpbroadcastq	%xmm2, %ymm2
   94cb1:      	vpblendd	$0x30, %ymm2, %ymm1, %ymm2 # ymm2 = ymm1[0,1,2,3],ymm2[4,5],ymm1[6,7]
   94cb7:      	vmovdqa	0x400(%rsp), %ymm0
   94cc0:      	vpinsrq	$0x1, %rdi, %xmm0, %xmm3
   94cc6:      	vmovdqa	0x420(%rsp), %ymm0
   94ccf:      	vpinsrq	$0x1, %rsi, %xmm0, %xmm1
   94cd5:      	movq	0x188(%rsp), %r15
   94cdd:      	movl	%r15d, %esi
   94ce0:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
   94ce6:      	vmovq	%rsi, %xmm4
   94ceb:      	vpbroadcastq	%xmm4, %ymm4
   94cf0:      	vpblendd	$0xc0, %ymm4, %ymm2, %ymm0 # ymm0 = ymm2[0,1,2,3,4,5],ymm4[6,7]
   94cf6:      	vmovdqa	%ymm0, 0x300(%rsp)
   94cff:      	movq	%r12, %rsi
   94d02:      	shldq	$0xc, %r11, %rsi
   94d07:      	shrq	$0x1a, %r11
   94d0b:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
   94d12:      	vmovq	%r11, %xmm2
   94d17:      	vpbroadcastq	%xmm2, %ymm2
   94d1c:      	vpblendd	$0x30, %ymm2, %ymm3, %ymm2 # ymm2 = ymm3[0,1,2,3],ymm2[4,5],ymm3[6,7]
   94d22:      	movq	0x198(%rsp), %r11
   94d2a:      	movq	%r11, %r9
   94d2d:      	shldq	$0xc, %r15, %r9
   94d32:      	shrq	$0x1a, %r15
   94d36:      	andl	$0x3ffffff, %r15d       # imm = 0x3FFFFFF
   94d3d:      	vmovq	%r15, %xmm3
   94d42:      	vpbroadcastq	%xmm3, %ymm3
   94d47:      	vpblendd	$0xc0, %ymm3, %ymm2, %ymm0 # ymm0 = ymm2[0,1,2,3,4,5],ymm3[6,7]
   94d4d:      	vmovdqa	%ymm0, 0x2e0(%rsp)
   94d56:      	movq	0x178(%rsp), %rdi
   94d5e:      	movq	0x180(%rsp), %r15
   94d66:      	shldq	$0x18, %r15, %rdi
   94d6b:      	shrq	$0xe, %r15
   94d6f:      	andl	$0x3ffffff, %r15d       # imm = 0x3FFFFFF
   94d76:      	vmovdqa	0x480(%rsp), %ymm0
   94d7f:      	vpinsrq	$0x1, %r15, %xmm0, %xmm2
   94d85:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
   94d8b:      	movq	0x170(%rsp), %r15
   94d93:      	shldq	$0x18, %r12, %r15
   94d98:      	vmovq	%rsi, %xmm3
   94d9d:      	vpbroadcastq	%xmm3, %ymm3
   94da2:      	vpblendd	$0x30, %ymm3, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm3[4,5],ymm1[6,7]
   94da8:      	andl	$0x3ffffff, %r9d        # imm = 0x3FFFFFF
   94daf:      	vmovq	%r9, %xmm3
   94db4:      	vpbroadcastq	%xmm3, %ymm3
   94db9:      	vpblendd	$0xc0, %ymm3, %ymm1, %ymm10 # ymm10 = ymm1[0,1,2,3,4,5],ymm3[6,7]
   94dbf:      	shrq	$0xe, %r12
   94dc3:      	andl	$0x3ffffff, %r12d       # imm = 0x3FFFFFF
   94dca:      	vmovq	%r12, %xmm1
   94dcf:      	vpbroadcastq	%xmm1, %ymm1
   94dd4:      	vpblendd	$0x30, %ymm1, %ymm2, %ymm1 # ymm1 = ymm2[0,1,2,3],ymm1[4,5],ymm2[6,7]
   94dda:      	movq	0x190(%rsp), %rsi
   94de2:      	shldq	$0x18, %r11, %rsi
   94de7:      	shrq	$0xe, %r11
   94deb:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
   94df2:      	vmovq	%r11, %xmm2
   94df7:      	vpbroadcastq	%xmm2, %ymm2
   94dfc:      	vpblendd	$0xc0, %ymm2, %ymm1, %ymm11 # ymm11 = ymm1[0,1,2,3,4,5],ymm2[6,7]
   94e02:      	vmovdqa	0x4c0(%rsp), %ymm0
   94e0b:      	vpinsrq	$0x1, %rdi, %xmm0, %xmm1
   94e11:      	vmovq	%r15, %xmm2
   94e16:      	vpbroadcastq	%xmm2, %ymm2
   94e1b:      	vpblendd	$0x30, %ymm2, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm2[4,5],ymm1[6,7]
   94e21:      	vmovq	%rsi, %xmm2
   94e26:      	vpbroadcastq	%xmm2, %ymm2
   94e2b:      	vpblendd	$0xc0, %ymm2, %ymm1, %ymm0 # ymm0 = ymm1[0,1,2,3,4,5],ymm2[6,7]
   94e31:      	vmovdqa	%ymm0, 0x60(%rsp)
   94e37:      	vmovdqa	0x3e0(%rsp), %ymm0
   94e40:      	vpinsrq	$0x1, %rdx, %xmm0, %xmm1
   94e46:      	movq	0x1a0(%rsp), %rsi
   94e4e:      	movl	%esi, %edx
   94e50:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
   94e56:      	vmovq	%rdx, %xmm2
   94e5b:      	vpbroadcastq	%xmm2, %ymm2
   94e60:      	vpblendd	$0x30, %ymm2, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm2[4,5],ymm1[6,7]
   94e66:      	movq	0xb8(%rsp), %rdi
   94e6e:      	movl	%edi, %edx
   94e70:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
   94e76:      	vmovq	%rdx, %xmm2
   94e7b:      	vpbroadcastq	%xmm2, %ymm2
   94e80:      	vpblendd	$0xc0, %ymm2, %ymm1, %ymm0 # ymm0 = ymm1[0,1,2,3,4,5],ymm2[6,7]
   94e86:      	vmovdqa	%ymm0, 0x2c0(%rsp)
   94e8f:      	vmovdqa	0x440(%rsp), %ymm0
   94e98:      	vpinsrq	$0x1, %r14, %xmm0, %xmm1
   94e9e:      	movq	0x1a8(%rsp), %r11
   94ea6:      	movq	%r11, %rdx
   94ea9:      	shldq	$0xc, %rsi, %rdx
   94eae:      	shrq	$0x1a, %rsi
   94eb2:      	andl	$0x3ffffff, %esi        # imm = 0x3FFFFFF
   94eb8:      	vmovq	%rsi, %xmm2
   94ebd:      	vpbroadcastq	%xmm2, %ymm2
   94ec2:      	vmovdqa	0x460(%rsp), %ymm0
   94ecb:      	vpinsrq	$0x1, %rcx, %xmm0, %xmm3
   94ed1:      	vpblendd	$0x30, %ymm2, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm2[4,5],ymm1[6,7]
   94ed7:      	movq	0x58(%rsp), %rsi
   94edc:      	movq	%rsi, %rcx
   94edf:      	shldq	$0xc, %rdi, %rcx
   94ee4:      	shrq	$0x1a, %rdi
   94ee8:      	andl	$0x3ffffff, %edi        # imm = 0x3FFFFFF
   94eee:      	vmovq	%rdi, %xmm2
   94ef3:      	vpbroadcastq	%xmm2, %ymm2
   94ef8:      	vpblendd	$0xc0, %ymm2, %ymm1, %ymm0 # ymm0 = ymm1[0,1,2,3,4,5],ymm2[6,7]
   94efe:      	vmovdqa	%ymm0, 0x2a0(%rsp)
   94f07:      	movq	0x1b8(%rsp), %rdi
   94f0f:      	shldq	$0x18, %r10, %rdi
   94f14:      	shrq	$0xe, %r10
   94f18:      	andl	$0x3ffffff, %r10d       # imm = 0x3FFFFFF
   94f1f:      	vmovdqa	0x4a0(%rsp), %ymm0
   94f28:      	vpinsrq	$0x1, %r10, %xmm0, %xmm1
   94f2e:      	andl	$0x3ffffff, %edx        # imm = 0x3FFFFFF
   94f34:      	movq	0x1b0(%rsp), %r9
   94f3c:      	shldq	$0x18, %r11, %r9
   94f41:      	vmovq	%rdx, %xmm2
   94f46:      	vpbroadcastq	%xmm2, %ymm2
   94f4b:      	vpblendd	$0x30, %ymm2, %ymm3, %ymm2 # ymm2 = ymm3[0,1,2,3],ymm2[4,5],ymm3[6,7]
   94f51:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
   94f57:      	vmovq	%rcx, %xmm3
   94f5c:      	vpbroadcastq	%xmm3, %ymm3
   94f61:      	vpblendd	$0xc0, %ymm3, %ymm2, %ymm0 # ymm0 = ymm2[0,1,2,3,4,5],ymm3[6,7]
   94f67:      	vmovdqa	%ymm0, 0x280(%rsp)
   94f70:      	shrq	$0xe, %r11
   94f74:      	andl	$0x3ffffff, %r11d       # imm = 0x3FFFFFF
   94f7b:      	vmovq	%r11, %xmm2
   94f80:      	vpbroadcastq	%xmm2, %ymm2
   94f85:      	vpblendd	$0x30, %ymm2, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm2[4,5],ymm1[6,7]
   94f8b:      	movq	%rsi, %rcx
   94f8e:      	shrq	$0xe, %rcx
   94f92:      	andl	$0x3ffffff, %ecx        # imm = 0x3FFFFFF
   94f98:      	vmovq	%rcx, %xmm2
   94f9d:      	vpbroadcastq	%xmm2, %ymm2
   94fa2:      	vpblendd	$0xc0, %ymm2, %ymm1, %ymm0 # ymm0 = ymm1[0,1,2,3,4,5],ymm2[6,7]
   94fa8:      	vmovdqa	%ymm0, 0x3a0(%rsp)
   94fb1:      	vmovdqa	0x4e0(%rsp), %ymm0
   94fba:      	vpinsrq	$0x1, %rdi, %xmm0, %xmm1
   94fc0:      	vmovq	%r9, %xmm2
   94fc5:      	vpbroadcastq	%xmm2, %ymm2
   94fca:      	vpblendd	$0x30, %ymm2, %ymm1, %ymm1 # ymm1 = ymm1[0,1,2,3],ymm2[4,5],ymm1[6,7]
   94fd0:      	shrq	$0x28, %rsi
   94fd4:      	vmovq	%rsi, %xmm2
   94fd9:      	vpbroadcastq	%xmm2, %ymm2
   94fde:      	vpblendd	$0xc0, %ymm2, %ymm1, %ymm0 # ymm0 = ymm1[0,1,2,3,4,5],ymm2[6,7]
   94fe4:      	vmovdqa	%ymm0, 0x1e0(%rsp)
   94fed:      	shlq	$0x7, %rax
   94ff1:      	vmovdqu	(%r8,%rax), %ymm2
   94ff7:      	vmovdqu	0x20(%r8,%rax), %ymm3
   94ffe:      	vpunpckhqdq	%ymm3, %ymm2, %ymm1 # ymm1 = ymm2[1],ymm3[1],ymm2[3],ymm3[3]
   95002:      	vpunpcklqdq	%ymm3, %ymm2, %ymm2 # ymm2 = ymm2[0],ymm3[0],ymm2[2],ymm3[2]
   95006:      	vpsrlq	$0x34, %ymm2, %ymm3
   9500b:      	vpsllq	$0xc, %ymm1, %ymm4
   95010:      	vpor	%ymm3, %ymm4, %ymm3
   95014:      	vmovdqu	0x40(%r8,%rax), %ymm4
   9501b:      	vmovdqu	0x60(%r8,%rax), %ymm5
   95022:      	vpunpcklqdq	%ymm5, %ymm4, %ymm6 # ymm6 = ymm4[0],ymm5[0],ymm4[2],ymm5[2]
   95026:      	vmovdqa	%ymm6, 0x320(%rsp)
   9502f:      	vpunpckhqdq	%ymm5, %ymm4, %ymm0 # ymm0 = ymm4[1],ymm5[1],ymm4[3],ymm5[3]
   95033:      	vmovdqa	%ymm0, 0x340(%rsp)
   9503c:      	vpsrlq	$0x34, %ymm6, %ymm4
   95041:      	vpsllq	$0xc, %ymm0, %ymm5
   95046:      	vpor	%ymm4, %ymm5, %ymm0
   9504a:      	vmovdqa	%ymm0, 0x380(%rsp)
   95053:      	vpsrlq	$0x1a, %ymm12, %ymm4
   95059:      	vpaddq	0x80(%rsp), %ymm4, %ymm4
   95062:      	vmovdqa	0x100(%rsp), %ymm7
   9506b:      	vpsrlq	$0x1a, %ymm7, %ymm5
   95070:      	vpaddq	0xc0(%rsp), %ymm5, %ymm5
   95079:      	vpsrlq	$0x1a, %ymm4, %ymm8
   9507e:      	vpaddq	0xe0(%rsp), %ymm8, %ymm8
   95087:      	vpsrlq	$0x1a, %ymm2, %ymm9
   9508c:      	vmovdqa	0x360(%rsp), %ymm0
   95095:      	vpand	%ymm0, %ymm9, %ymm9
   95099:      	vpand	%ymm0, %ymm4, %ymm4
   9509d:      	vpaddq	%ymm4, %ymm9, %ymm4
   950a1:      	vpsrlq	$0x28, %ymm1, %ymm9
   950a6:      	vpand	%ymm0, %ymm5, %ymm15
   950aa:      	vpaddq	%ymm9, %ymm15, %ymm9
   950af:      	vpand	%ymm0, %ymm12, %ymm15
   950b3:      	vpsrlq	$0x1a, %ymm5, %ymm5
   950b8:      	vpaddq	%ymm5, %ymm15, %ymm15
   950bc:      	vpsllq	$0x2, %ymm5, %ymm5
   950c1:      	vpaddq	%ymm5, %ymm15, %ymm5
   950c5:      	vpand	%ymm0, %ymm7, %ymm15
   950c9:      	vpsrlq	$0x1a, %ymm8, %ymm14
   950cf:      	vpaddq	%ymm15, %ymm14, %ymm14
   950d4:      	vpand	%ymm0, %ymm3, %ymm3
   950d8:      	vpand	%ymm0, %ymm8, %ymm8
   950dc:      	vpaddq	%ymm3, %ymm8, %ymm8
   950e0:      	vpsrlq	$0x1a, %ymm5, %ymm3
   950e5:      	vpaddq	%ymm4, %ymm3, %ymm7
   950e9:      	vpand	%ymm0, %ymm2, %ymm2
   950ed:      	vpand	%ymm0, %ymm5, %ymm4
   950f1:      	vpaddq	%ymm4, %ymm2, %ymm6
   950f5:      	vpsrlq	$0xe, %ymm1, %ymm1
   950fa:      	vpand	%ymm0, %ymm1, %ymm1
   950fe:      	vpand	%ymm0, %ymm14, %ymm4
   95102:      	vpaddq	%ymm4, %ymm1, %ymm4
   95106:      	vpsrlq	$0x1a, %ymm14, %ymm1
   9510c:      	vpaddq	0x1c0(%rsp), %ymm9, %ymm5
   95115:      	vpaddq	%ymm1, %ymm5, %ymm3
   95119:      	vpsllq	$0x2, %ymm11, %ymm5
   9511f:      	vpaddq	%ymm5, %ymm11, %ymm5
   95123:      	vmovdqa	0x300(%rsp), %ymm1
   9512c:      	vpmuludq	%ymm1, %ymm6, %ymm9
   95130:      	vpmuludq	%ymm5, %ymm8, %ymm14
   95134:      	vpaddq	%ymm9, %ymm14, %ymm9
   95139:      	vpsllq	$0x2, %ymm10, %ymm14
   9513f:      	vpaddq	%ymm10, %ymm14, %ymm14
   95144:      	vpmuludq	%ymm4, %ymm14, %ymm15
   95148:      	vpaddq	%ymm15, %ymm9, %ymm9
   9514d:      	vmovdqa	0x2e0(%rsp), %ymm2
   95156:      	vpsllq	$0x2, %ymm2, %ymm15
   9515b:      	vpaddq	%ymm2, %ymm15, %ymm15
   9515f:      	vmovdqa	0x60(%rsp), %ymm13
   95165:      	vpsllq	$0x2, %ymm13, %ymm12
   9516b:      	vpaddq	%ymm13, %ymm12, %ymm12
   95170:      	vpmuludq	%ymm3, %ymm15, %ymm15
   95174:      	vpmuludq	%ymm7, %ymm12, %ymm13
   95178:      	vpaddq	%ymm13, %ymm15, %ymm13
   9517d:      	vpaddq	%ymm13, %ymm9, %ymm9
   95182:      	vmovdqa	%ymm9, 0x100(%rsp)
   9518b:      	vpmuludq	%ymm2, %ymm6, %ymm9
   9518f:      	vpmuludq	%ymm12, %ymm8, %ymm13
   95194:      	vpaddq	%ymm9, %ymm13, %ymm9
   95199:      	vpmuludq	%ymm5, %ymm4, %ymm13
   9519d:      	vpaddq	%ymm13, %ymm9, %ymm9
   951a2:      	vpmuludq	%ymm3, %ymm14, %ymm13
   951a6:      	vpmuludq	%ymm1, %ymm7, %ymm14
   951aa:      	vpaddq	%ymm14, %ymm13, %ymm13
   951af:      	vpaddq	%ymm13, %ymm9, %ymm9
   951b4:      	vmovdqa	%ymm9, 0xe0(%rsp)
   951bd:      	vpmuludq	%ymm6, %ymm10, %ymm9
   951c1:      	vpmuludq	%ymm1, %ymm8, %ymm13
   951c5:      	vpaddq	%ymm9, %ymm13, %ymm9
   951ca:      	vpmuludq	%ymm4, %ymm12, %ymm13
   951ce:      	vpaddq	%ymm13, %ymm9, %ymm9
   951d3:      	vpmuludq	%ymm5, %ymm3, %ymm5
   951d7:      	vpmuludq	%ymm2, %ymm7, %ymm13
   951db:      	vpaddq	%ymm5, %ymm13, %ymm5
   951df:      	vpaddq	%ymm5, %ymm9, %ymm5
   951e3:      	vmovdqa	%ymm5, 0xc0(%rsp)
   951ec:      	vpmuludq	%ymm6, %ymm11, %ymm5
   951f0:      	vpmuludq	%ymm2, %ymm8, %ymm9
   951f4:      	vpaddq	%ymm5, %ymm9, %ymm5
   951f8:      	vpmuludq	%ymm1, %ymm4, %ymm9
   951fc:      	vpaddq	%ymm5, %ymm9, %ymm5
   95200:      	vpmuludq	%ymm3, %ymm12, %ymm9
   95204:      	vpmuludq	%ymm7, %ymm10, %ymm12
   95208:      	vpaddq	%ymm12, %ymm9, %ymm9
   9520d:      	vpaddq	%ymm5, %ymm9, %ymm5
   95211:      	vmovdqa	%ymm5, 0x80(%rsp)
   9521a:      	vpmuludq	0x60(%rsp), %ymm6, %ymm12
   95220:      	vpmuludq	%ymm7, %ymm11, %ymm6
   95224:      	vpmuludq	%ymm10, %ymm8, %ymm5
   95229:      	vpaddq	%ymm5, %ymm12, %ymm5
   9522d:      	vpmuludq	%ymm2, %ymm4, %ymm4
   95231:      	vpaddq	%ymm4, %ymm5, %ymm4
   95235:      	vpmuludq	%ymm1, %ymm3, %ymm1
   95239:      	vpaddq	%ymm6, %ymm1, %ymm1
   9523d:      	vpaddq	%ymm1, %ymm4, %ymm1
   95241:      	vmovdqa	%ymm1, 0x60(%rsp)
   95247:      	vmovdqa	0x260(%rsp), %ymm8
   95250:      	vpsrlq	$0x1a, %ymm8, %ymm1
   95256:      	vpaddq	0x200(%rsp), %ymm1, %ymm1
   9525f:      	vmovdqa	0x240(%rsp), %ymm12
   95268:      	vpsrlq	$0x1a, %ymm12, %ymm2
   9526e:      	vpaddq	0x120(%rsp), %ymm2, %ymm2
   95277:      	vpsrlq	$0x1a, %ymm1, %ymm3
   9527c:      	vpaddq	0x220(%rsp), %ymm3, %ymm3
   95285:      	vmovdqa	0x320(%rsp), %ymm7
   9528e:      	vpsrlq	$0x1a, %ymm7, %ymm4
   95293:      	vpand	%ymm0, %ymm4, %ymm4
   95297:      	vpand	%ymm0, %ymm1, %ymm1
   9529b:      	vpaddq	%ymm4, %ymm1, %ymm1
   9529f:      	vmovdqa	0x340(%rsp), %ymm6
   952a8:      	vpsrlq	$0x28, %ymm6, %ymm4
   952ad:      	vpand	%ymm0, %ymm2, %ymm5
   952b1:      	vpaddq	%ymm4, %ymm5, %ymm4
   952b5:      	vpand	%ymm0, %ymm8, %ymm5
   952b9:      	vpsrlq	$0x1a, %ymm2, %ymm2
   952be:      	vpaddq	%ymm5, %ymm2, %ymm5
   952c2:      	vpsllq	$0x2, %ymm2, %ymm2
   952c7:      	vpaddq	%ymm5, %ymm2, %ymm2
   952cb:      	vpand	%ymm0, %ymm12, %ymm5
   952cf:      	vpsrlq	$0x1a, %ymm3, %ymm12
   952d4:      	vpaddq	%ymm5, %ymm12, %ymm12
   952d8:      	vpand	0x380(%rsp), %ymm0, %ymm5
   952e1:      	vpand	%ymm0, %ymm3, %ymm3
   952e5:      	vpaddq	%ymm3, %ymm5, %ymm5
   952e9:      	vpsrlq	$0x1a, %ymm2, %ymm3
   952ee:      	vpaddq	%ymm1, %ymm3, %ymm1
   952f2:      	vpand	%ymm0, %ymm7, %ymm3
   952f6:      	vpand	%ymm0, %ymm2, %ymm2
   952fa:      	vpaddq	%ymm2, %ymm3, %ymm2
   952fe:      	vpsrlq	$0xe, %ymm6, %ymm3
   95303:      	vpand	%ymm0, %ymm3, %ymm3
   95307:      	vpand	%ymm0, %ymm12, %ymm6
   9530b:      	vpaddq	%ymm6, %ymm3, %ymm6
   9530f:      	vpaddq	0x1c0(%rsp), %ymm4, %ymm3
   95318:      	vpsrlq	$0x1a, %ymm12, %ymm4
   9531e:      	vpaddq	%ymm4, %ymm3, %ymm3
   95322:      	vmovdqa	0x3a0(%rsp), %ymm15
   9532b:      	vpsllq	$0x2, %ymm15, %ymm4
   95331:      	vpaddq	%ymm4, %ymm15, %ymm13
   95335:      	vmovdqa	0x2c0(%rsp), %ymm10
   9533e:      	vpmuludq	%ymm2, %ymm10, %ymm4
   95342:      	vpmuludq	%ymm5, %ymm13, %ymm7
   95346:      	vpaddq	%ymm4, %ymm7, %ymm4
   9534a:      	vmovdqa	0x280(%rsp), %ymm9
   95353:      	vpsllq	$0x2, %ymm9, %ymm7
   95359:      	vpaddq	%ymm7, %ymm9, %ymm7
   9535d:      	vpmuludq	%ymm7, %ymm6, %ymm12
   95361:      	vpaddq	%ymm4, %ymm12, %ymm4
   95365:      	vmovdqa	0x2a0(%rsp), %ymm11
   9536e:      	vpsllq	$0x2, %ymm11, %ymm12
   95374:      	vpaddq	%ymm11, %ymm12, %ymm12
   95379:      	vmovdqa	0x1e0(%rsp), %ymm8
   95382:      	vpsllq	$0x2, %ymm8, %ymm14
   95388:      	vpaddq	%ymm8, %ymm14, %ymm14
   9538d:      	vpmuludq	%ymm3, %ymm12, %ymm12
   95391:      	vpmuludq	%ymm1, %ymm14, %ymm8
   95395:      	vpaddq	%ymm8, %ymm12, %ymm8
   9539a:      	vpaddq	%ymm4, %ymm8, %ymm4
   9539e:      	vpmuludq	%ymm2, %ymm11, %ymm8
   953a2:      	vpmuludq	%ymm5, %ymm14, %ymm12
   953a6:      	vpaddq	%ymm8, %ymm12, %ymm8
   953ab:      	vpmuludq	%ymm6, %ymm13, %ymm12
   953af:      	vpaddq	%ymm12, %ymm8, %ymm8
   953b4:      	vpmuludq	%ymm7, %ymm3, %ymm7
   953b8:      	vpmuludq	%ymm1, %ymm10, %ymm12
   953bc:      	vpaddq	%ymm7, %ymm12, %ymm7
   953c0:      	vpaddq	%ymm7, %ymm8, %ymm7
   953c4:      	vpmuludq	%ymm2, %ymm9, %ymm8
   953c8:      	vpmuludq	%ymm5, %ymm10, %ymm12
   953cc:      	vpaddq	%ymm8, %ymm12, %ymm8
   953d1:      	vpmuludq	%ymm6, %ymm14, %ymm12
   953d5:      	vpaddq	%ymm12, %ymm8, %ymm8
   953da:      	vpmuludq	%ymm3, %ymm13, %ymm12
   953de:      	vpmuludq	%ymm1, %ymm11, %ymm13
   953e2:      	vpaddq	%ymm13, %ymm12, %ymm12
   953e7:      	vpaddq	%ymm12, %ymm8, %ymm13
   953ec:      	vpmuludq	%ymm2, %ymm15, %ymm8
   953f0:      	vpmuludq	%ymm5, %ymm11, %ymm12
   953f4:      	vpaddq	%ymm8, %ymm12, %ymm8
   953f9:      	vpmuludq	%ymm6, %ymm10, %ymm12
   953fd:      	vpaddq	%ymm12, %ymm8, %ymm8
   95402:      	vpmuludq	%ymm3, %ymm14, %ymm12
   95406:      	vpmuludq	%ymm1, %ymm9, %ymm14
   9540a:      	vpaddq	%ymm14, %ymm12, %ymm12
   9540f:      	vpaddq	%ymm12, %ymm8, %ymm14
   95414:      	vpmuludq	0x1e0(%rsp), %ymm2, %ymm2
   9541d:      	vpmuludq	%ymm1, %ymm15, %ymm1
   95421:      	vpmuludq	%ymm5, %ymm9, %ymm5
   95425:      	vpaddq	%ymm2, %ymm5, %ymm2
   95429:      	vpmuludq	%ymm6, %ymm11, %ymm5
   9542d:      	vpaddq	%ymm5, %ymm2, %ymm2
   95431:      	vpmuludq	%ymm3, %ymm10, %ymm3
   95435:      	vpaddq	%ymm1, %ymm3, %ymm1
   95439:      	vpaddq	%ymm1, %ymm2, %ymm3
   9543d:      	vmovdqa	0x100(%rsp), %ymm2
   95446:      	vpsrlq	$0x1a, %ymm2, %ymm1
   9544b:      	vpaddq	0xe0(%rsp), %ymm1, %ymm5
   95454:      	vpand	%ymm0, %ymm2, %ymm2
   95458:      	vmovdqa	0x80(%rsp), %ymm6
   95461:      	vpsrlq	$0x1a, %ymm6, %ymm1
   95466:      	vpaddq	0x60(%rsp), %ymm1, %ymm1
   9546c:      	vpand	%ymm0, %ymm6, %ymm6
   95470:      	vpsrlq	$0x1a, %ymm5, %ymm8
   95475:      	vpaddq	0xc0(%rsp), %ymm8, %ymm8
   9547e:      	vpsrlq	$0x1a, %ymm1, %ymm9
   95483:      	vpaddq	%ymm2, %ymm9, %ymm2
   95487:      	vpsllq	$0x2, %ymm9, %ymm9
   9548d:      	vpaddq	%ymm2, %ymm9, %ymm9
   95491:      	vpsrlq	$0x1a, %ymm8, %ymm2
   95497:      	vpaddq	%ymm6, %ymm2, %ymm2
   9549b:      	vpsrlq	$0x1a, %ymm4, %ymm6
   954a0:      	vpaddq	%ymm6, %ymm7, %ymm6
   954a4:      	vpsrlq	$0x1a, %ymm14, %ymm7
   954aa:      	vpaddq	%ymm7, %ymm3, %ymm3
   954ae:      	vpsrlq	$0x1a, %ymm6, %ymm7
   954b3:      	vpaddq	%ymm7, %ymm13, %ymm7
   954b7:      	vpand	%ymm0, %ymm5, %ymm5
   954bb:      	vpand	%ymm0, %ymm8, %ymm8
   954bf:      	vpand	%ymm0, %ymm6, %ymm6
   954c3:      	vpaddq	%ymm6, %ymm5, %ymm5
   954c7:      	vpsrlq	$0x1a, %ymm9, %ymm6
   954cd:      	vpand	%ymm0, %ymm9, %ymm9
   954d1:      	vpand	%ymm0, %ymm4, %ymm4
   954d5:      	vpand	%ymm0, %ymm14, %ymm10
   954d9:      	vpaddq	%ymm5, %ymm6, %ymm5
   954dd:      	vpsrlq	$0x1a, %ymm3, %ymm6
   954e2:      	vpaddq	%ymm4, %ymm6, %ymm4
   954e6:      	vpsllq	$0x2, %ymm6, %ymm6
   954eb:      	vpaddq	%ymm4, %ymm6, %ymm6
   954ef:      	vpsrlq	$0x1a, %ymm7, %ymm4
   954f4:      	vpaddq	%ymm4, %ymm10, %ymm4
   954f8:      	vpand	%ymm0, %ymm2, %ymm10
   954fc:      	vpand	%ymm0, %ymm7, %ymm7
   95500:      	vpaddq	%ymm7, %ymm8, %ymm7
   95504:      	vpsrlq	$0x1a, %ymm6, %ymm8
   95509:      	vpaddq	%ymm5, %ymm8, %ymm8
   9550d:      	vpand	%ymm0, %ymm6, %ymm5
   95511:      	vpaddq	%ymm5, %ymm9, %ymm6
   95515:      	vpand	%ymm0, %ymm4, %ymm5
   95519:      	vpaddq	%ymm5, %ymm10, %ymm5
   9551d:      	vpshufd	$0xee, %xmm6, %xmm9     # xmm9 = xmm6[2,3,2,3]
   95522:      	vextracti128	$0x1, %ymm6, %xmm10
   95528:      	vpaddq	%xmm6, %xmm9, %xmm9
   9552c:      	vpermq	$0xff, %ymm6, %ymm6     # ymm6 = ymm6[3,3,3,3]
   95532:      	vpaddq	%xmm6, %xmm10, %xmm6
   95536:      	vpaddq	%xmm6, %xmm9, %xmm6
   9553a:      	vmovq	%xmm6, %rdx
   9553f:      	vpshufd	$0xee, %xmm8, %xmm6     # xmm6 = xmm8[2,3,2,3]
   95545:      	vextracti128	$0x1, %ymm8, %xmm9
   9554b:      	vpaddq	%xmm6, %xmm8, %xmm6
   9554f:      	vpermq	$0xff, %ymm8, %ymm8     # ymm8 = ymm8[3,3,3,3]
   95555:      	vpaddq	%xmm8, %xmm9, %xmm8
   9555a:      	vpaddq	%xmm6, %xmm8, %xmm6
   9555e:      	vmovq	%xmm6, %rsi
   95563:      	vpshufd	$0xee, %xmm7, %xmm6     # xmm6 = xmm7[2,3,2,3]
   95568:      	vextracti128	$0x1, %ymm7, %xmm8
   9556e:      	vpaddq	%xmm6, %xmm7, %xmm6
   95572:      	vpermq	$0xff, %ymm7, %ymm7     # ymm7 = ymm7[3,3,3,3]
   95578:      	vpaddq	%xmm7, %xmm8, %xmm7
   9557c:      	vpaddq	%xmm7, %xmm6, %xmm6
   95580:      	vmovq	%xmm6, %rax
   95585:      	vpshufd	$0xee, %xmm5, %xmm6     # xmm6 = xmm5[2,3,2,3]
   9558a:      	vextracti128	$0x1, %ymm5, %xmm7
   95590:      	vpaddq	%xmm6, %xmm5, %xmm6
   95594:      	vpermq	$0xff, %ymm5, %ymm5     # ymm5 = ymm5[3,3,3,3]
   9559a:      	vpaddq	%xmm5, %xmm7, %xmm5
   9559e:      	vpaddq	%xmm5, %xmm6, %xmm5
   955a2:      	vmovq	%xmm5, %rcx
   955a7:      	movq	%rsi, %rdi
   955aa:      	shrq	$0x26, %rdi
   955ae:      	shlq	$0x1a, %rsi
   955b2:      	movq	%rax, %r8
   955b5:      	shrq	$0xc, %r8
   955b9:      	shlq	$0x34, %rax
   955bd:      	addq	%rdx, %rax
   955c0:      	adcq	$0x0, %r8
   955c4:      	addq	%rsi, %rax
   955c7:      	adcq	%rdi, %r8
   955ca:      	shlq	$0xe, %rcx
   955ce:      	addq	%r8, %rcx
   955d1:      	jb	0x9567c <toyos_crypto::arch::x86_64::poly1305::blocks (.llvm.3142307217602062041)+0x168c>
   955d7:      	vpsrlq	$0x1a, %ymm2, %ymm2
   955dc:      	vmovdqa	0x360(%rsp), %ymm0
   955e5:      	vpand	%ymm0, %ymm1, %ymm1
   955e9:      	vpand	%ymm0, %ymm3, %ymm0
   955ed:      	vpaddq	%ymm0, %ymm1, %ymm0
   955f1:      	vpaddq	%ymm0, %ymm2, %ymm0
   955f5:      	vpsrlq	$0x1a, %ymm4, %ymm1
   955fa:      	vpaddq	%ymm1, %ymm0, %ymm0
   955fe:      	vpshufd	$0xee, %xmm0, %xmm1     # xmm1 = xmm0[2,3,2,3]
   95603:      	vextracti128	$0x1, %ymm0, %xmm2
   95609:      	vpermq	$0xff, %ymm0, %ymm3     # ymm3 = ymm0[3,3,3,3]
   9560f:      	vpaddq	%xmm1, %xmm0, %xmm0
   95613:      	vpaddq	%xmm3, %xmm2, %xmm1
   95617:      	vpaddq	%xmm1, %xmm0, %xmm0
   9561b:      	vmovq	%xmm0, %rdx
   95620:      	movq	%rdx, %rsi
   95623:      	shrq	$0x18, %rsi
   95627:      	shlq	$0x28, %rdx
   9562b:      	addq	%rdx, %rcx
   9562e:      	adcq	$0x0, %rsi
   95632:      	movl	%esi, %edx
   95634:      	andl	$0x3, %edx
   95637:      	shrq	$0x2, %rsi
   9563b:      	leaq	(%rsi,%rsi,4), %rsi
   9563f:      	addq	%rsi, %rax
   95642:      	adcq	$0x0, %rcx
   95646:      	adcq	$0x0, %rdx
   9564a:      	movq	%rax, (%rbx)
   9564d:      	movq	%rcx, 0x8(%rbx)
   95651:      	movq	%rdx, 0x10(%rbx)
   95655:      	movabsq	$0x7fffffffffffff8, %rcx # imm = 0x7FFFFFFFFFFFFF8
   9565f:      	movq	0x150(%rsp), %rax
   95667:      	andq	%rcx, %rax
   9566a:      	leaq	-0x28(%rbp), %rsp
   9566e:      	popq	%rbx
   9566f:      	popq	%r12
   95671:      	popq	%r13
   95673:      	popq	%r14
   95675:      	popq	%r15
   95677:      	popq	%rbp
   95678:      	vzeroupper
   9567b:      	retq
   9567c:      	leaq	0x7eb4d(%rip), %rdi     # 0x1141d0 <anon.035262e224809c533440a9541ff83897.1.llvm.16451390423216165772+0x90>
   95683:      	vzeroupper
   95686:      	callq	0x10c570 <core::panicking::panic_const::panic_const_add_overflow>
