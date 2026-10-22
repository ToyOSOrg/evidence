__RNvNtCsl3pv5AGSK2E_12toyos_crypto6x255198multiply:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 744
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	qword ptr [rbp - 752], rsi
	mov	qword ptr [rbp - 744], rdi
	xorps	xmm0, xmm0
	movaps	xmmword ptr [rbp - 720], xmm0
	movaps	xmmword ptr [rbp - 736], xmm0
	xor	eax, eax
	xor	esi, esi
	.p2align	4
LBB111_1:
	movzx	edi, byte ptr [rdx + rsi]
	mov	ecx, eax
	and	cl, 48
	shl	rdi, cl
	mov	r8, rsi
	and	r8, -8
	or	rdi, qword ptr [rbp + r8 - 736]
	mov	qword ptr [rbp + r8 - 736], rdi
	movzx	r9d, byte ptr [rdx + rsi + 1]
	lea	ecx, [rax + 8]
	and	cl, 56
	shl	r9, cl
	or	r9, rdi
	mov	qword ptr [rbp + r8 - 736], r9
	add	rsi, 2
	add	rax, 16
	cmp	rsi, 32
	jne	LBB111_1
	movabs	rcx, 2251799813685247
	mov	r9, qword ptr [rbp - 736]
	mov	r15, qword ptr [rbp - 728]
	mov	r12, r15
	shld	r12, r9, 13
	and	r9, rcx
	and	r12, rcx
	mov	r13, qword ptr [rbp - 720]
	shrd	r15, r13, 38
	and	r15, rcx
	mov	rax, qword ptr [rbp - 712]
	shrd	r13, rax, 25
	and	r13, rcx
	shr	rax, 12
	and	rax, rcx
	mov	qword ptr [rbp - 496], 0
	mov	qword ptr [rbp - 504], 0
	mov	qword ptr [rbp - 512], 0
	mov	qword ptr [rbp - 520], 0
	mov	qword ptr [rbp - 528], 1
	mov	qword ptr [rbp - 488], 0
	mov	qword ptr [rbp - 480], 0
	mov	qword ptr [rbp - 472], 0
	mov	qword ptr [rbp - 464], 0
	mov	qword ptr [rbp - 456], 0
	lea	rdi, [rbp - 736]
	lea	rsi, [rbp - 528]
	mov	ecx, 10
	rep movsq es:[rdi], [rsi]
	mov	rcx, qword ptr [rbp - 736]
	mov	qword ptr [rbp - 112], rcx
	mov	rcx, qword ptr [rbp - 728]
	mov	qword ptr [rbp - 72], rcx
	mov	rcx, qword ptr [rbp - 720]
	mov	qword ptr [rbp - 48], rcx
	mov	rcx, qword ptr [rbp - 712]
	mov	qword ptr [rbp - 56], rcx
	mov	rcx, qword ptr [rbp - 704]
	mov	qword ptr [rbp - 64], rcx
	mov	r10, qword ptr [rbp - 696]
	mov	r14, qword ptr [rbp - 688]
	mov	rcx, qword ptr [rbp - 680]
	mov	r11, qword ptr [rbp - 672]
	mov	edx, 1
	mov	qword ptr [rbp - 80], rdx
	mov	esi, 254
	xor	edx, edx
	mov	r8, qword ptr [rbp - 664]
	mov	qword ptr [rbp - 576], r9
	mov	qword ptr [rbp - 424], r12
	mov	qword ptr [rbp - 232], r12
	mov	qword ptr [rbp - 432], r15
	mov	qword ptr [rbp - 568], r13
	mov	r12, r13
	mov	qword ptr [rbp - 560], rax
	mov	qword ptr [rbp - 248], rax
	mov	qword ptr [rbp - 192], 0
	mov	qword ptr [rbp - 96], 0
	mov	qword ptr [rbp - 144], 0
	mov	qword ptr [rbp - 88], 0
	.p2align	4
LBB111_3:
	mov	qword ptr [rbp - 440], rsi
	mov	rax, rdx
	mov	rdx, rsi
	shr	rdx, 3
	mov	rsi, qword ptr [rbp - 752]
	movzx	edx, byte ptr [rsi + rdx]
	mov	rsi, qword ptr [rbp - 440]
	and	esi, 7
	bt	edx, esi
	mov	edx, 0
	setb	dl
	mov	qword ptr [rbp - 776], rdx
	xor	rax, rdx
	## InlineAsm Start

	## rax 

	## InlineAsm End
	neg	rax
	mov	rdx, r9
	mov	rdi, qword ptr [rbp - 112]
	xor	rdx, rdi
	and	rdx, rax
	xor	rdi, rdx
	mov	qword ptr [rbp - 112], rdi
	xor	rdx, r9
	mov	qword ptr [rbp - 136], rdx
	mov	r9, qword ptr [rbp - 232]
	mov	rdx, r9
	mov	r13, qword ptr [rbp - 72]
	xor	rdx, r13
	and	rdx, rax
	xor	r13, rdx
	mov	qword ptr [rbp - 72], r13
	xor	rdx, r9
	mov	qword ptr [rbp - 200], rdx
	mov	rdx, r15
	mov	rsi, qword ptr [rbp - 48]
	xor	rdx, rsi
	and	rdx, rax
	xor	rsi, rdx
	mov	qword ptr [rbp - 48], rsi
	xor	rdx, r15
	mov	qword ptr [rbp - 296], rdx
	mov	rdx, r12
	mov	rsi, qword ptr [rbp - 56]
	xor	rdx, rsi
	and	rdx, rax
	xor	rsi, rdx
	mov	rbx, rsi
	mov	qword ptr [rbp - 56], rsi
	xor	rdx, r12
	mov	qword ptr [rbp - 176], rdx
	mov	rsi, qword ptr [rbp - 248]
	mov	rdx, rsi
	mov	r9, qword ptr [rbp - 64]
	xor	rdx, r9
	and	rdx, rax
	xor	r9, rdx
	mov	qword ptr [rbp - 64], r9
	xor	rdx, rsi
	mov	qword ptr [rbp - 104], rdx
	mov	rdx, qword ptr [rbp - 80]
	mov	rsi, rdx
	xor	rsi, r10
	and	rsi, rax
	xor	r10, rsi
	mov	qword ptr [rbp - 216], r10
	xor	rsi, rdx
	mov	qword ptr [rbp - 128], rsi
	mov	rdx, qword ptr [rbp - 192]
	mov	rsi, rdx
	xor	rsi, r14
	and	rsi, rax
	xor	r14, rsi
	xor	rsi, rdx
	mov	qword ptr [rbp - 392], rsi
	mov	rdx, qword ptr [rbp - 96]
	mov	rsi, rdx
	xor	rsi, rcx
	and	rsi, rax
	xor	rcx, rsi
	xor	rsi, rdx
	mov	qword ptr [rbp - 264], rsi
	mov	rdx, qword ptr [rbp - 144]
	mov	rsi, rdx
	xor	rsi, r11
	and	rsi, rax
	xor	r11, rsi
	xor	rsi, rdx
	mov	qword ptr [rbp - 344], rsi
	mov	rdx, qword ptr [rbp - 88]
	mov	rsi, rdx
	xor	rsi, r8
	and	rsi, rax
	xor	r8, rsi
	xor	rsi, rdx
	mov	qword ptr [rbp - 384], rsi
	lea	rdx, [r11 + rbx]
	mov	qword ptr [rbp - 96], rdx
	lea	rax, [rdx + 8*rdx]
	lea	rbx, [rdx + 2*rax]
	lea	rdx, [r8 + r9]
	mov	qword ptr [rbp - 192], rdx
	lea	rax, [rdx + 8*rdx]
	lea	r9, [rdx + 2*rax]
	mov	qword ptr [rbp - 88], r9
	lea	r12, [r10 + rdi]
	mov	rax, r12
	mul	r12
	mov	qword ptr [rbp - 232], r12
	mov	rdi, rax
	mov	rsi, rdx
	lea	r10, [r14 + r13]
	lea	rdx, [r10 + r10]
	mov	qword ptr [rbp - 144], r10
	mov	qword ptr [rbp - 120], rdx
	mov	rax, r9
	mul	rdx
	mov	r9, rax
	mov	r15, rdx
	mov	rax, qword ptr [rbp - 48]
	add	rax, rcx
	mov	qword ptr [rbp - 248], rax
	lea	r13, [rax + rax]
	mov	rax, rbx
	mov	qword ptr [rbp - 152], rbx
	mul	r13
	add	rax, rdi
	adc	rsi, rdx
	add	rax, r9
	mov	qword ptr [rbp - 224], rax
	adc	rsi, r15
	lea	r15, [r12 + r12]
	mov	rax, r10
	mul	r15
	mov	r10, rdx
	mov	rdi, rax
	mov	rax, rbx
	mul	qword ptr [rbp - 96]
	mov	r9, rax
	add	r9, rdi
	adc	r10, rdx
	mov	r12, qword ptr [rbp - 88]
	mov	rax, r12
	mul	r13
	add	rax, r9
	mov	qword ptr [rbp - 208], rax
	adc	r10, rdx
	mov	qword ptr [rbp - 160], r10
	mov	rbx, qword ptr [rbp - 248]
	mov	rax, rbx
	mov	qword ptr [rbp - 240], r15
	mul	r15
	mov	r13, rdx
	mov	rdi, rax
	mov	rax, qword ptr [rbp - 144]
	mul	rax
	mov	r9, rax
	add	r9, rdi
	adc	r13, rdx
	mov	rdi, qword ptr [rbp - 96]
	lea	rdx, [rdi + rdi]
	mov	rax, r12
	mul	rdx
	add	rax, r9
	mov	qword ptr [rbp - 272], rax
	adc	r13, rdx
	mov	rax, rdi
	mul	r15
	mov	r9, rdx
	mov	r15, rax
	mov	r10, qword ptr [rbp - 120]
	mov	rax, r10
	mul	rbx
	mov	rdi, rax
	add	rdi, r15
	adc	r9, rdx
	mov	rax, r12
	mov	r12, qword ptr [rbp - 192]
	mul	r12
	mov	r15, rax
	add	r15, rdi
	adc	r9, rdx
	mov	rax, r12
	mul	qword ptr [rbp - 240]
	mov	qword ptr [rbp - 240], rdx
	mov	qword ptr [rbp - 168], rax
	mov	rax, qword ptr [rbp - 56]
	add	rax, r11
	mul	r10
	mov	r10, rdx
	mov	qword ptr [rbp - 80], rax
	mov	rax, rbx
	mul	rbx
	mov	qword ptr [rbp - 120], rax
	mov	rdi, rsi
	mov	rbx, qword ptr [rbp - 224]
	shld	rsi, rbx, 13
	shr	rdi, 51
	add	rsi, qword ptr [rbp - 208]
	adc	rdi, qword ptr [rbp - 160]
	mov	r12, rdi
	shld	rdi, rsi, 13
	shr	r12, 51
	add	rdi, qword ptr [rbp - 272]
	adc	r12, r13
	mov	rax, r12
	shr	rax, 51
	shld	r12, rdi, 13
	mov	r13, rdi
	add	r12, r15
	adc	rax, r9
	mov	rdi, rax
	shr	rdi, 51
	shld	rax, r12, 13
	mov	r9, qword ptr [rbp - 120]
	add	r9, qword ptr [rbp - 80]
	adc	rdx, r10
	add	r9, qword ptr [rbp - 168]
	adc	rdx, qword ptr [rbp - 240]
	add	r9, rax
	adc	rdx, rdi
	mov	rax, rdx
	shr	rdx, 51
	lea	rdi, [rdx + 8*rdx]
	lea	r15, [rdx + 2*rdi]
	movabs	rdi, 2251799813685247
	and	rbx, rdi
	shld	rax, r9, 13
	mov	edx, 19
	mul	rdx
	add	rax, rbx
	adc	r15, rdx
	and	rsi, rdi
	shld	r15, rax, 13
	mov	rdx, rax
	add	r15, rsi
	mov	qword ptr [rbp - 224], r15
	movabs	rsi, 4503599627370494
	mov	rax, qword ptr [rbp - 112]
	lea	rbx, [rax + rsi - 36]
	sub	rbx, qword ptr [rbp - 216]
	mov	r15, qword ptr [rbp - 72]
	add	r15, rsi
	sub	r15, r14
	mov	rax, qword ptr [rbp - 48]
	add	rax, rsi
	sub	rax, rcx
	mov	r14, rax
	mov	qword ptr [rbp - 48], rax
	mov	rcx, qword ptr [rbp - 56]
	add	rcx, rsi
	mov	rax, rsi
	sub	rcx, r11
	mov	rsi, qword ptr [rbp - 64]
	add	rsi, rax
	sub	rsi, r8
	mov	qword ptr [rbp - 64], rsi
	and	rdx, rdi
	mov	qword ptr [rbp - 208], rdx
	and	r13, rdi
	mov	qword ptr [rbp - 240], r13
	and	r12, rdi
	mov	qword ptr [rbp - 216], r12
	and	r9, rdi
	mov	qword ptr [rbp - 120], r9
	lea	rax, [rcx + 8*rcx]
	lea	r10, [rcx + 2*rax]
	mov	r12, rcx
	lea	rax, [rsi + 8*rsi]
	lea	r13, [rsi + 2*rax]
	mov	rax, rbx
	mul	rbx
	mov	qword ptr [rbp - 256], rbx
	mov	rsi, rax
	mov	rdi, rdx
	lea	rcx, [r15 + r15]
	mov	qword ptr [rbp - 160], rcx
	mov	rax, r13
	mul	rcx
	mov	r9, rax
	mov	r11, rdx
	lea	r8, [r14 + r14]
	mov	rax, r10
	mov	qword ptr [rbp - 184], r10
	mul	r8
	mov	rcx, rdx
	mov	r14, rax
	add	r14, rsi
	adc	rcx, rdi
	add	r14, r9
	adc	rcx, r11
	lea	r11, [rbx + rbx]
	mov	rax, r15
	mul	r11
	mov	rsi, rdx
	mov	rdi, rax
	mov	rax, r10
	mul	r12
	mov	r9, rdx
	mov	rbx, rax
	add	rbx, rdi
	adc	r9, rsi
	mov	rax, r13
	mul	r8
	add	rax, rbx
	mov	qword ptr [rbp - 112], rax
	adc	rdx, r9
	mov	qword ptr [rbp - 272], rdx
	mov	r10, qword ptr [rbp - 48]
	mov	rax, r10
	mul	r11
	mov	rbx, rdx
	mov	rsi, rax
	mov	qword ptr [rbp - 72], r15
	mov	rax, r15
	mul	r15
	mov	rdi, rax
	add	rdi, rsi
	adc	rbx, rdx
	mov	r8, r12
	lea	rdx, [r12 + r12]
	mov	rax, r13
	mov	r12, r13
	mov	qword ptr [rbp - 336], r13
	mul	rdx
	add	rax, rdi
	mov	qword ptr [rbp - 168], rax
	adc	rbx, rdx
	mov	rax, r8
	mov	qword ptr [rbp - 56], r8
	mul	r11
	mov	rdi, rdx
	mov	r9, rax
	mov	rsi, qword ptr [rbp - 160]
	mov	rax, rsi
	mul	r10
	mov	r15, rdx
	mov	r13, rax
	add	r13, r9
	adc	r15, rdi
	mov	rax, r12
	mov	rdi, qword ptr [rbp - 64]
	mul	rdi
	mov	r9, rdx
	mov	r12, rax
	add	r12, r13
	adc	r9, r15
	mov	rax, rdi
	mul	r11
	mov	qword ptr [rbp - 80], rdx
	mov	qword ptr [rbp - 360], rax
	mov	rax, r8
	mul	rsi
	mov	r15, rdx
	mov	r13, rax
	mov	rax, r10
	mul	r10
	mov	rdi, rax
	mov	rax, rcx
	shld	rcx, r14, 13
	shr	rax, 51
	add	rcx, qword ptr [rbp - 112]
	adc	rax, qword ptr [rbp - 272]
	mov	r11, rax
	shld	rax, rcx, 13
	shr	r11, 51
	add	rax, qword ptr [rbp - 168]
	mov	rsi, rax
	mov	qword ptr [rbp - 112], rax
	adc	r11, rbx
	mov	rax, r11
	shr	rax, 51
	shld	r11, rsi, 13
	add	r11, r12
	adc	rax, r9
	mov	rsi, rax
	shr	rsi, 51
	shld	rax, r11, 13
	add	rdi, r13
	adc	rdx, r15
	add	rdi, qword ptr [rbp - 360]
	adc	rdx, qword ptr [rbp - 80]
	add	rdi, rax
	adc	rdx, rsi
	mov	rax, rdx
	shld	rax, rdi, 13
	shr	rdx, 51
	lea	rsi, [rdx + 8*rdx]
	lea	rsi, [rdx + 2*rsi]
	mov	edx, 19
	mul	rdx
	movabs	r15, 2251799813685247
	and	r14, r15
	add	rax, r14
	adc	rdx, rsi
	shld	rdx, rax, 13
	and	rcx, r15
	add	rdx, rcx
	mov	rsi, rdx
	mov	qword ptr [rbp - 160], rdx
	mov	r13, qword ptr [rbp - 200]
	mov	rdx, qword ptr [rbp - 392]
	lea	r8, [rdx + r13]
	mov	qword ptr [rbp - 328], r8
	movabs	r9, 4503599627370494
	add	r13, r9
	sub	r13, rdx
	mov	qword ptr [rbp - 200], r13
	mov	r12, qword ptr [rbp - 296]
	mov	rdx, qword ptr [rbp - 264]
	lea	r8, [rdx + r12]
	mov	qword ptr [rbp - 80], r8
	add	r12, r9
	sub	r12, rdx
	mov	rbx, qword ptr [rbp - 176]
	mov	rcx, qword ptr [rbp - 344]
	lea	rdx, [rcx + rbx]
	mov	qword ptr [rbp - 280], rdx
	add	rbx, r9
	sub	rbx, rcx
	mov	qword ptr [rbp - 176], rbx
	mov	r10, qword ptr [rbp - 104]
	mov	rdx, qword ptr [rbp - 384]
	lea	r8, [rdx + r10]
	mov	qword ptr [rbp - 288], r8
	add	r10, r9
	sub	r10, rdx
	mov	qword ptr [rbp - 104], r10
	mov	rdx, rax
	and	rdx, r15
	mov	qword ptr [rbp - 360], rdx
	mov	r14, qword ptr [rbp - 112]
	and	r14, r15
	mov	qword ptr [rbp - 112], r14
	and	r11, r15
	mov	qword ptr [rbp - 168], r11
	mov	r8, rdi
	and	r8, r15
	mov	qword ptr [rbp - 352], r8
	mov	rax, qword ptr [rbp - 208]
	lea	rax, [rax + r9 - 36]
	sub	rax, rdx
	mov	qword ptr [rbp - 264], rax
	mov	rax, qword ptr [rbp - 224]
	add	rax, r9
	sub	rax, rsi
	mov	qword ptr [rbp - 272], rax
	mov	rax, qword ptr [rbp - 240]
	add	rax, r9
	sub	rax, r14
	mov	qword ptr [rbp - 344], rax
	mov	rax, qword ptr [rbp - 216]
	add	rax, r9
	sub	rax, r11
	mov	qword ptr [rbp - 392], rax
	mov	rax, qword ptr [rbp - 136]
	lea	rax, [rax + r9 - 36]
	sub	rax, qword ptr [rbp - 128]
	mov	rcx, rax
	mov	r15, qword ptr [rbp - 232]
	mul	r15
	mov	rsi, rax
	mov	rdi, rdx
	mov	rax, qword ptr [rbp - 120]
	add	rax, r9
	sub	rax, r8
	mov	qword ptr [rbp - 384], rax
	mov	rax, r13
	mov	r13, qword ptr [rbp - 88]
	mul	r13
	mov	r8, rdx
	mov	r9, rax
	add	r9, rsi
	adc	r8, rdi
	mov	rax, r12
	mov	r14, r12
	mov	r12, qword ptr [rbp - 152]
	mul	r12
	mov	rsi, rdx
	mov	rdi, rax
	add	rdi, r9
	adc	rsi, r8
	mov	rdx, qword ptr [rbp - 248]
	lea	rax, [rdx + 8*rdx]
	lea	r11, [rdx + 2*rax]
	mov	rax, rbx
	mul	r11
	mov	r8, rdx
	mov	r9, rax
	add	r9, rdi
	adc	r8, rsi
	mov	rbx, qword ptr [rbp - 144]
	lea	rax, [rbx + 8*rbx]
	lea	rdx, [rbx + 2*rax]
	mov	rax, r10
	mul	rdx
	mov	r10, rdx
	add	rax, r9
	mov	qword ptr [rbp - 320], rax
	adc	r10, r8
	mov	rax, rbx
	mul	rcx
	mov	rbx, rcx
	mov	qword ptr [rbp - 368], rcx
	mov	rsi, rdx
	mov	rdi, rax
	mov	rcx, qword ptr [rbp - 200]
	mov	rax, rcx
	mul	r15
	mov	r8, rdx
	mov	r9, rax
	add	r9, rdi
	adc	r8, rsi
	mov	qword ptr [rbp - 296], r14
	mov	rax, r14
	mov	r15, r13
	mul	r13
	mov	rsi, rdx
	mov	rdi, rax
	add	rdi, r9
	adc	rsi, r8
	mov	r13, qword ptr [rbp - 176]
	mov	rax, r13
	mul	r12
	mov	r8, rdx
	mov	r9, rax
	add	r9, rdi
	adc	r8, rsi
	mov	r12, qword ptr [rbp - 104]
	mov	rax, r12
	mul	r11
	add	rax, r9
	mov	qword ptr [rbp - 312], rax
	adc	rdx, r8
	mov	qword ptr [rbp - 304], rdx
	mov	r11, qword ptr [rbp - 248]
	mov	rax, r11
	mul	rbx
	mov	rsi, rdx
	mov	rdi, rax
	mov	rax, rcx
	mov	rbx, qword ptr [rbp - 144]
	mul	rbx
	mov	r8, rdx
	mov	r9, rax
	add	r9, rdi
	adc	r8, rsi
	mov	rax, r14
	mov	r14, qword ptr [rbp - 232]
	mul	r14
	mov	rsi, rdx
	mov	rdi, rax
	add	rdi, r9
	adc	rsi, r8
	mov	rax, r13
	mul	r15
	mov	r8, rdx
	mov	r9, rax
	add	r9, rdi
	adc	r8, rsi
	mov	r13, r12
	mov	rax, r12
	mul	qword ptr [rbp - 152]
	add	rax, r9
	mov	qword ptr [rbp - 376], rax
	adc	rdx, r8
	mov	qword ptr [rbp - 152], rdx
	mov	rax, qword ptr [rbp - 96]
	mov	r12, qword ptr [rbp - 368]
	mul	r12
	mov	rsi, rdx
	mov	rdi, rax
	mov	rax, rcx
	mul	r11
	mov	r8, rdx
	mov	r9, rax
	add	r9, rdi
	adc	r8, rsi
	mov	r15, qword ptr [rbp - 296]
	mov	rax, r15
	mul	rbx
	mov	rsi, rdx
	mov	rdi, rax
	add	rdi, r9
	adc	rsi, r8
	mov	r11, qword ptr [rbp - 176]
	mov	rax, r11
	mul	r14
	mov	r8, rdx
	mov	r9, rax
	add	r9, rdi
	adc	r8, rsi
	mov	rax, r13
	mov	r14, r13
	mul	qword ptr [rbp - 88]
	mov	r13, rdx
	mov	rsi, rax
	add	rsi, r9
	adc	r13, r8
	mov	rax, qword ptr [rbp - 192]
	mul	r12
	mov	rcx, rdx
	mov	rdi, rax
	mov	rax, qword ptr [rbp - 200]
	mul	qword ptr [rbp - 96]
	mov	r8, rdx
	mov	r9, rax
	add	r9, rdi
	adc	r8, rcx
	mov	rax, r15
	mul	qword ptr [rbp - 248]
	mov	rcx, rdx
	mov	rdi, rax
	add	rdi, r9
	adc	rcx, r8
	mov	rax, r11
	mul	rbx
	mov	r8, rdx
	mov	r9, rax
	add	r9, rdi
	adc	r8, rcx
	mov	rax, r14
	mul	qword ptr [rbp - 232]
	add	rax, r9
	adc	rdx, r8
	mov	rcx, r10
	mov	rbx, qword ptr [rbp - 320]
	shld	r10, rbx, 13
	shr	rcx, 51
	add	r10, qword ptr [rbp - 312]
	adc	rcx, qword ptr [rbp - 304]
	mov	r8, rcx
	shld	rcx, r10, 13
	shr	r8, 51
	add	rcx, qword ptr [rbp - 376]
	mov	r9, rcx
	adc	r8, qword ptr [rbp - 152]
	mov	rcx, qword ptr [rbp - 136]
	mov	rdi, qword ptr [rbp - 128]
	lea	r11, [rdi + rcx]
	mov	qword ptr [rbp - 176], r11
	mov	rdi, r8
	shld	r8, r9, 13
	shr	rdi, 51
	add	r8, rsi
	adc	rdi, r13
	mov	rcx, rdi
	shr	rcx, 51
	shld	rdi, r8, 13
	add	rdi, rax
	adc	rcx, rdx
	mov	rax, rcx
	shld	rax, rdi, 13
	shr	rcx, 51
	lea	rdx, [rcx + 8*rcx]
	lea	rcx, [rcx + 2*rdx]
	mov	edx, 19
	mul	rdx
	movabs	rsi, 2251799813685247
	and	rbx, rsi
	add	rax, rbx
	adc	rdx, rcx
	shld	rdx, rax, 13
	and	r10, rsi
	add	rdx, r10
	mov	qword ptr [rbp - 104], rdx
	and	rax, rsi
	mov	qword ptr [rbp - 144], rax
	and	r9, rsi
	mov	qword ptr [rbp - 296], r9
	and	r8, rsi
	mov	qword ptr [rbp - 248], r8
	mov	r8, rsi
	mov	rax, r11
	mov	r10, qword ptr [rbp - 256]
	mul	r10
	mov	rcx, rax
	mov	rsi, rdx
	and	rdi, r8
	mov	qword ptr [rbp - 96], rdi
	mov	r8, qword ptr [rbp - 328]
	mov	rax, r8
	mov	r14, qword ptr [rbp - 336]
	mul	r14
	mov	rdi, rdx
	mov	r9, rax
	add	r9, rcx
	adc	rdi, rsi
	mov	r11, qword ptr [rbp - 80]
	mov	rax, r11
	mov	r15, qword ptr [rbp - 184]
	mul	r15
	mov	rcx, rdx
	mov	rsi, rax
	add	rsi, r9
	adc	rcx, rdi
	mov	rdx, qword ptr [rbp - 48]
	lea	rax, [rdx + 8*rdx]
	lea	rdx, [rdx + 2*rax]
	mov	qword ptr [rbp - 88], rdx
	mov	r13, qword ptr [rbp - 280]
	mov	rax, r13
	mul	rdx
	mov	rdi, rdx
	mov	rbx, rax
	add	rbx, rsi
	adc	rdi, rcx
	mov	rsi, qword ptr [rbp - 72]
	lea	rax, [rsi + 8*rsi]
	lea	rcx, [rsi + 2*rax]
	mov	r12, qword ptr [rbp - 288]
	mov	rax, r12
	mul	rcx
	add	rax, rbx
	mov	qword ptr [rbp - 200], rax
	adc	rdx, rdi
	mov	qword ptr [rbp - 232], rdx
	mov	rax, rsi
	mov	r9, qword ptr [rbp - 176]
	mul	r9
	mov	rcx, rdx
	mov	rsi, rax
	mov	rax, r8
	mul	r10
	mov	rdi, rdx
	mov	rbx, rax
	add	rbx, rsi
	adc	rdi, rcx
	mov	rax, r11
	mov	r10, r14
	mul	r14
	mov	rcx, rdx
	mov	rsi, rax
	add	rsi, rbx
	adc	rcx, rdi
	mov	rax, r13
	mul	r15
	mov	rdi, rdx
	mov	r15, rax
	add	r15, rsi
	adc	rdi, rcx
	mov	rax, r12
	mul	qword ptr [rbp - 88]
	add	rax, r15
	mov	qword ptr [rbp - 88], rax
	adc	rdx, rdi
	mov	qword ptr [rbp - 136], rdx
	mov	r11, qword ptr [rbp - 48]
	mov	rax, r11
	mov	r14, r9
	mul	r9
	mov	rcx, rdx
	mov	rsi, rax
	mov	rbx, r8
	mov	rax, r8
	mov	r9, qword ptr [rbp - 72]
	mul	r9
	mov	rdi, rdx
	mov	r15, rax
	add	r15, rsi
	adc	rdi, rcx
	mov	r8, qword ptr [rbp - 80]
	mov	rax, r8
	mov	r12, qword ptr [rbp - 256]
	mul	r12
	mov	rcx, rdx
	mov	rsi, rax
	add	rsi, r15
	adc	rcx, rdi
	mov	rax, r13
	mul	r10
	mov	rdi, rdx
	mov	r13, rax
	add	r13, rsi
	adc	rdi, rcx
	mov	r15, qword ptr [rbp - 288]
	mov	rax, r15
	mul	qword ptr [rbp - 184]
	add	rax, r13
	mov	qword ptr [rbp - 128], rax
	adc	rdx, rdi
	mov	qword ptr [rbp - 192], rdx
	mov	rax, qword ptr [rbp - 56]
	mul	r14
	mov	rcx, rdx
	mov	rsi, rax
	mov	rax, rbx
	mov	r14, rbx
	mul	r11
	mov	rdi, rdx
	mov	r13, rax
	add	r13, rsi
	adc	rdi, rcx
	mov	rax, r8
	mul	r9
	mov	rcx, rdx
	mov	rsi, rax
	add	rsi, r13
	adc	rcx, rdi
	mov	r8, qword ptr [rbp - 280]
	mov	rax, r8
	mul	r12
	mov	rdi, rdx
	mov	r13, rax
	add	r13, rsi
	adc	rdi, rcx
	mov	rax, r15
	mul	r10
	mov	rbx, rdx
	mov	r10, rax
	add	r10, r13
	adc	rbx, rdi
	mov	rax, qword ptr [rbp - 64]
	mul	qword ptr [rbp - 176]
	mov	rdi, rdx
	mov	r11, rax
	mov	rax, r14
	mul	qword ptr [rbp - 56]
	mov	r13, rdx
	mov	rcx, rax
	add	rcx, r11
	adc	r13, rdi
	mov	rax, qword ptr [rbp - 80]
	mul	qword ptr [rbp - 48]
	mov	rdi, rdx
	mov	r11, rax
	add	r11, rcx
	adc	rdi, r13
	mov	rax, r8
	mul	r9
	mov	rcx, rdx
	mov	r13, rax
	add	r13, r11
	adc	rcx, rdi
	mov	rax, r15
	mul	r12
	add	rax, r13
	adc	rdx, rcx
	mov	rcx, qword ptr [rbp - 232]
	mov	rsi, rcx
	mov	r14, qword ptr [rbp - 200]
	shld	rcx, r14, 13
	shr	rsi, 51
	add	rcx, qword ptr [rbp - 88]
	adc	rsi, qword ptr [rbp - 136]
	mov	r8, rsi
	shld	rsi, rcx, 13
	mov	r9, rcx
	shr	r8, 51
	add	rsi, qword ptr [rbp - 128]
	adc	r8, qword ptr [rbp - 192]
	mov	r11, r8
	shld	r8, rsi, 13
	shr	r11, 51
	add	r8, r10
	adc	r11, rbx
	mov	rcx, r11
	shld	r11, r8, 13
	shr	rcx, 51
	add	r11, rax
	adc	rcx, rdx
	mov	rax, rcx
	shr	rcx, 51
	lea	rdx, [rcx + 8*rcx]
	lea	rcx, [rcx + 2*rdx]
	movabs	rdi, 2251799813685247
	and	r14, rdi
	shld	rax, r11, 13
	mov	edx, 19
	mul	rdx
	add	rax, r14
	adc	rdx, rcx
	and	r9, rdi
	shld	rdx, rax, 13
	add	rdx, r9
	mov	r9, rdx
	mov	qword ptr [rbp - 56], rdx
	and	rax, rdi
	mov	rdx, rax
	mov	qword ptr [rbp - 48], rax
	and	rsi, rdi
	mov	qword ptr [rbp - 72], rsi
	and	r8, rdi
	and	r11, rdi
	mov	rax, qword ptr [rbp - 248]
	lea	rcx, [rax + r8]
	mov	qword ptr [rbp - 320], rcx
	lea	rax, [rcx + 8*rcx]
	lea	r10, [rcx + 2*rax]
	mov	rax, qword ptr [rbp - 144]
	add	rax, rdx
	mov	qword ptr [rbp - 64], rax
	mul	rax
	mov	r14, rax
	mov	qword ptr [rbp - 200], rdx
	mov	rax, qword ptr [rbp - 96]
	lea	rcx, [rax + r11]
	mov	qword ptr [rbp - 88], rcx
	lea	rax, [rcx + 8*rcx]
	lea	r13, [rcx + 2*rax]
	mov	rax, qword ptr [rbp - 104]
	lea	rdi, [rax + r9]
	lea	rax, [rdi + rdi]
	mov	qword ptr [rbp - 152], rax
	mul	r13
	mov	r15, rax
	mov	rcx, rdx
	mov	rax, qword ptr [rbp - 296]
	lea	r12, [rax + rsi]
	lea	rdx, [r12 + r12]
	mov	qword ptr [rbp - 176], rdx
	mov	rax, r10
	mul	rdx
	mov	rbx, rdx
	mov	r9, rax
	add	r9, r14
	adc	rbx, qword ptr [rbp - 200]
	add	r9, r15
	adc	rbx, rcx
	mov	rax, qword ptr [rbp - 64]
	lea	rsi, [rax + rax]
	mov	rax, rsi
	mul	rdi
	mov	qword ptr [rbp - 64], rdx
	mov	qword ptr [rbp - 80], rax
	mov	rax, r10
	mov	r15, qword ptr [rbp - 320]
	mul	r15
	mov	qword ptr [rbp - 256], rdx
	mov	qword ptr [rbp - 336], rax
	mov	rax, r13
	mul	qword ptr [rbp - 176]
	mov	r14, rdx
	mov	r10, rax
	mov	rax, rsi
	mul	r12
	mov	qword ptr [rbp - 312], r12
	mov	qword ptr [rbp - 232], rdx
	mov	qword ptr [rbp - 136], rax
	mov	rax, rdi
	mul	rdi
	mov	qword ptr [rbp - 328], rax
	mov	qword ptr [rbp - 280], rdx
	lea	rdx, [r15 + r15]
	mov	rax, r13
	mul	rdx
	mov	rdi, rdx
	mov	qword ptr [rbp - 176], rax
	mov	rax, rsi
	mul	r15
	mov	qword ptr [rbp - 128], rdx
	mov	qword ptr [rbp - 184], rax
	mov	rcx, qword ptr [rbp - 152]
	mov	rax, rcx
	mul	r12
	mov	qword ptr [rbp - 192], rdx
	mov	qword ptr [rbp - 288], rax
	mov	rax, r13
	mov	r12, qword ptr [rbp - 88]
	mul	r12
	mov	r13, rdx
	mov	qword ptr [rbp - 200], rax
	mov	rax, rsi
	mul	r12
	mov	rsi, rdx
	mov	qword ptr [rbp - 88], rax
	mov	rax, rcx
	mul	r15
	mov	r12, rdx
	mov	qword ptr [rbp - 152], rax
	mov	rax, qword ptr [rbp - 312]
	mul	rax
	mov	rcx, rbx
	shld	rbx, r9, 13
	shr	rcx, 51
	add	r10, qword ptr [rbp - 336]
	adc	r14, qword ptr [rbp - 256]
	add	r10, qword ptr [rbp - 80]
	adc	r14, qword ptr [rbp - 64]
	add	r10, rbx
	adc	r14, rcx
	mov	rcx, r14
	shld	r14, r10, 13
	shr	rcx, 51
	mov	r15, qword ptr [rbp - 176]
	add	r15, qword ptr [rbp - 328]
	adc	rdi, qword ptr [rbp - 280]
	add	r15, qword ptr [rbp - 136]
	adc	rdi, qword ptr [rbp - 232]
	add	r15, r14
	adc	rdi, rcx
	mov	rcx, rdi
	shld	rdi, r15, 13
	shr	rcx, 51
	mov	rbx, qword ptr [rbp - 200]
	add	rbx, qword ptr [rbp - 184]
	adc	r13, qword ptr [rbp - 128]
	add	rbx, qword ptr [rbp - 288]
	adc	r13, qword ptr [rbp - 192]
	add	rbx, rdi
	adc	r13, rcx
	mov	rcx, r13
	shr	rcx, 51
	shld	r13, rbx, 13
	mov	rdi, rbx
	mov	rbx, rax
	add	rbx, qword ptr [rbp - 88]
	adc	rdx, rsi
	add	rbx, qword ptr [rbp - 152]
	adc	rdx, r12
	add	rbx, r13
	adc	rdx, rcx
	mov	rax, rdx
	shld	rax, rbx, 13
	mov	r14, rbx
	shr	rdx, 51
	lea	rcx, [rdx + 8*rdx]
	lea	rcx, [rdx + 2*rcx]
	mov	edx, 19
	mul	rdx
	movabs	r12, 2251799813685247
	and	r9, r12
	add	rax, r9
	adc	rdx, rcx
	shld	rdx, rax, 13
	and	r10, r12
	add	rdx, r10
	mov	qword ptr [rbp - 232], rdx
	movabs	rcx, 4503599627370494
	mov	rdx, qword ptr [rbp - 144]
	lea	rbx, [rdx + rcx - 36]
	sub	rbx, qword ptr [rbp - 48]
	mov	r10, qword ptr [rbp - 104]
	add	r10, rcx
	sub	r10, qword ptr [rbp - 56]
	mov	r9, qword ptr [rbp - 296]
	add	r9, rcx
	sub	r9, qword ptr [rbp - 72]
	mov	r13, qword ptr [rbp - 248]
	add	r13, rcx
	sub	r13, r8
	mov	r8, qword ptr [rbp - 96]
	add	r8, rcx
	sub	r8, r11
	and	rax, r12
	mov	qword ptr [rbp - 296], rax
	and	r15, r12
	mov	qword ptr [rbp - 176], r15
	and	rdi, r12
	mov	qword ptr [rbp - 200], rdi
	and	r14, r12
	mov	qword ptr [rbp - 248], r14
	mov	rax, rbx
	mul	rbx
	mov	r12, rax
	mov	rsi, rdx
	mov	qword ptr [rbp - 96], r8
	lea	rax, [r8 + 8*r8]
	lea	rdi, [r8 + 2*rax]
	lea	rax, [r10 + r10]
	mov	qword ptr [rbp - 184], rax
	mul	rdi
	mov	r15, rax
	mov	r11, rdx
	mov	r8, r13
	lea	rax, [r13 + 8*r13]
	lea	r14, [r13 + 2*rax]
	lea	rcx, [r9 + r9]
	mov	rax, r14
	mul	rcx
	mov	r13, rax
	add	r13, r12
	adc	rsi, rdx
	add	r13, r15
	adc	rsi, r11
	lea	rcx, [rbx + rbx]
	mov	rax, rcx
	mul	r10
	mov	qword ptr [rbp - 56], rdx
	mov	qword ptr [rbp - 64], rax
	mov	rax, r14
	mul	r8
	mov	qword ptr [rbp - 80], rdx
	mov	qword ptr [rbp - 256], rax
	mov	rax, rdi
	lea	rdx, [r9 + r9]
	mul	rdx
	mov	rbx, rdx
	mov	r11, rax
	mov	rax, rcx
	mul	r9
	mov	qword ptr [rbp - 72], rdx
	mov	qword ptr [rbp - 104], rax
	mov	rax, r10
	mul	r10
	mov	qword ptr [rbp - 152], rax
	mov	qword ptr [rbp - 128], rdx
	lea	rdx, [r8 + r8]
	mov	rax, rdi
	mul	rdx
	mov	r14, rdx
	mov	qword ptr [rbp - 48], rax
	mov	rax, rcx
	mul	r8
	mov	qword ptr [rbp - 144], rdx
	mov	qword ptr [rbp - 136], rax
	mov	r10, qword ptr [rbp - 184]
	mov	rax, r10
	mul	r9
	mov	qword ptr [rbp - 88], rdx
	mov	qword ptr [rbp - 192], rax
	mov	rax, rdi
	mov	r12, qword ptr [rbp - 96]
	mul	r12
	mov	r15, rdx
	mov	rdi, rax
	mov	rax, rcx
	mul	r12
	mov	r12, rdx
	mov	qword ptr [rbp - 96], rax
	mov	rax, r10
	mul	r8
	mov	r10, rdx
	mov	qword ptr [rbp - 184], rax
	mov	rax, r9
	mul	r9
	mov	rcx, rax
	mov	rax, rsi
	shld	rsi, r13, 13
	shr	rax, 51
	add	r11, qword ptr [rbp - 256]
	adc	rbx, qword ptr [rbp - 80]
	add	r11, qword ptr [rbp - 64]
	adc	rbx, qword ptr [rbp - 56]
	add	r11, rsi
	adc	rbx, rax
	mov	rax, rbx
	shld	rbx, r11, 13
	shr	rax, 51
	mov	r8, qword ptr [rbp - 48]
	add	r8, qword ptr [rbp - 152]
	adc	r14, qword ptr [rbp - 128]
	add	r8, qword ptr [rbp - 104]
	adc	r14, qword ptr [rbp - 72]
	add	r8, rbx
	adc	r14, rax
	mov	rax, r14
	shld	r14, r8, 13
	shr	rax, 51
	add	rdi, qword ptr [rbp - 136]
	adc	r15, qword ptr [rbp - 144]
	add	rdi, qword ptr [rbp - 192]
	adc	r15, qword ptr [rbp - 88]
	add	rdi, r14
	adc	r15, rax
	mov	rax, r15
	shr	rax, 51
	shld	r15, rdi, 13
	add	rcx, qword ptr [rbp - 96]
	adc	rdx, r12
	add	rcx, qword ptr [rbp - 184]
	adc	rdx, r10
	add	rcx, r15
	adc	rdx, rax
	mov	rax, rdx
	shr	rdx, 51
	lea	rsi, [rdx + 8*rdx]
	lea	r10, [rdx + 2*rsi]
	movabs	rsi, 2251799813685247
	and	r13, rsi
	shld	rax, rcx, 13
	mov	edx, 19
	mul	rdx
	add	rax, r13
	adc	r10, rdx
	mov	rdx, rsi
	and	r11, rsi
	shld	r10, rax, 13
	add	r10, r11
	and	r8, rsi
	mov	qword ptr [rbp - 48], r8
	and	rdi, rsi
	and	rcx, rsi
	lea	rsi, [r10 + 8*r10]
	lea	rsi, [r10 + 2*rsi]
	mov	qword ptr [rbp - 80], rsi
	lea	rsi, [r8 + 8*r8]
	lea	r9, [r8 + 2*rsi]
	mov	qword ptr [rbp - 88], r9
	mov	qword ptr [rbp - 144], rcx
	lea	rsi, [rcx + 8*rcx]
	lea	rcx, [rcx + 2*rsi]
	mov	qword ptr [rbp - 64], rcx
	and	rax, rdx
	mov	rbx, rax
	mov	r8, qword ptr [rbp - 576]
	mul	r8
	mov	qword ptr [rbp - 96], rdx
	mov	qword ptr [rbp - 104], rax
	mov	rax, rcx
	mul	qword ptr [rbp - 424]
	mov	r15, rax
	mov	rsi, rdx
	mov	qword ptr [rbp - 56], rdi
	lea	rax, [rdi + 8*rdi]
	lea	r12, [rdi + 2*rax]
	mov	rax, r12
	mov	qword ptr [rbp - 304], r12
	mul	qword ptr [rbp - 432]
	mov	r13, rdx
	mov	r11, rax
	mov	rax, r9
	mul	qword ptr [rbp - 568]
	mov	r14, rdx
	mov	rdi, rax
	mov	rax, qword ptr [rbp - 80]
	mov	rcx, qword ptr [rbp - 560]
	mul	rcx
	add	rdi, r11
	adc	r14, r13
	add	rdi, r15
	adc	r14, rsi
	add	rdi, qword ptr [rbp - 104]
	adc	r14, qword ptr [rbp - 96]
	add	rdi, rax
	mov	qword ptr [rbp - 80], rdi
	adc	r14, rdx
	mov	rax, r10
	mul	r8
	mov	qword ptr [rbp - 96], rdx
	mov	qword ptr [rbp - 104], rax
	mov	rax, rbx
	mov	qword ptr [rbp - 72], rbx
	mov	rsi, qword ptr [rbp - 424]
	mul	rsi
	mov	qword ptr [rbp - 136], rdx
	mov	qword ptr [rbp - 184], rax
	mov	r9, qword ptr [rbp - 64]
	mov	rax, r9
	mov	rdi, qword ptr [rbp - 432]
	mul	rdi
	mov	qword ptr [rbp - 192], rdx
	mov	qword ptr [rbp - 152], rax
	mov	rax, r12
	mov	r13, qword ptr [rbp - 568]
	mul	r13
	mov	qword ptr [rbp - 320], rdx
	mov	qword ptr [rbp - 376], rax
	mov	rax, qword ptr [rbp - 88]
	mul	rcx
	mov	r12, rcx
	mov	r15, rdx
	mov	r11, rax
	mov	rcx, qword ptr [rbp - 48]
	mov	rax, rcx
	mul	r8
	mov	qword ptr [rbp - 256], rdx
	mov	qword ptr [rbp - 288], rax
	mov	rax, r10
	mul	rsi
	mov	qword ptr [rbp - 88], rdx
	mov	qword ptr [rbp - 128], rax
	mov	rax, rbx
	mul	rdi
	mov	qword ptr [rbp - 280], rdx
	mov	qword ptr [rbp - 328], rax
	mov	rax, r9
	mul	r13
	mov	r9, r13
	mov	qword ptr [rbp - 336], rdx
	mov	qword ptr [rbp - 312], rax
	mov	rax, qword ptr [rbp - 304]
	mov	rsi, r12
	mul	r12
	mov	r12, rdx
	mov	rdi, rax
	mov	rax, qword ptr [rbp - 56]
	mul	r8
	mov	r8, rdx
	mov	r13, rax
	mov	rax, rcx
	mov	rbx, qword ptr [rbp - 424]
	mul	rbx
	add	rax, r13
	mov	qword ptr [rbp - 416], rax
	adc	rdx, r8
	mov	qword ptr [rbp - 536], rdx
	mov	rax, r10
	mov	rcx, qword ptr [rbp - 432]
	mul	rcx
	mov	qword ptr [rbp - 304], rdx
	mov	qword ptr [rbp - 368], rax
	mov	rax, qword ptr [rbp - 72]
	mul	r9
	mov	r13, rdx
	mov	r8, rax
	mov	rax, qword ptr [rbp - 64]
	mul	rsi
	mov	qword ptr [rbp - 552], rdx
	mov	qword ptr [rbp - 544], rax
	mov	rax, qword ptr [rbp - 144]
	mul	qword ptr [rbp - 576]
	mov	qword ptr [rbp - 64], rdx
	mov	qword ptr [rbp - 144], rax
	mov	rax, qword ptr [rbp - 56]
	mul	rbx
	mov	qword ptr [rbp - 56], rdx
	mov	qword ptr [rbp - 400], rax
	mov	rax, qword ptr [rbp - 48]
	mul	rcx
	mov	rcx, rdx
	mov	rsi, rax
	mov	rax, r10
	mul	r9
	mov	qword ptr [rbp - 48], rdx
	mov	qword ptr [rbp - 408], rax
	mov	rax, qword ptr [rbp - 72]
	mul	qword ptr [rbp - 560]
	mov	rbx, r14
	mov	r10, qword ptr [rbp - 80]
	shld	r14, r10, 13
	shr	rbx, 51
	add	r11, qword ptr [rbp - 376]
	adc	r15, qword ptr [rbp - 320]
	add	r11, qword ptr [rbp - 184]
	adc	r15, qword ptr [rbp - 136]
	add	r11, qword ptr [rbp - 152]
	adc	r15, qword ptr [rbp - 192]
	add	r11, qword ptr [rbp - 104]
	adc	r15, qword ptr [rbp - 96]
	add	r11, r14
	adc	r15, rbx
	mov	rbx, r15
	shld	r15, r11, 13
	shr	rbx, 51
	add	rdi, qword ptr [rbp - 288]
	adc	r12, qword ptr [rbp - 256]
	add	rdi, qword ptr [rbp - 328]
	adc	r12, qword ptr [rbp - 280]
	add	rdi, qword ptr [rbp - 312]
	adc	r12, qword ptr [rbp - 336]
	add	rdi, qword ptr [rbp - 128]
	adc	r12, qword ptr [rbp - 88]
	add	rdi, r15
	adc	r12, rbx
	mov	rbx, r12
	shld	r12, rdi, 13
	shr	rbx, 51
	add	r8, qword ptr [rbp - 416]
	adc	r13, qword ptr [rbp - 536]
	add	r8, qword ptr [rbp - 544]
	adc	r13, qword ptr [rbp - 552]
	add	r8, qword ptr [rbp - 368]
	adc	r13, qword ptr [rbp - 304]
	add	r8, r12
	adc	r13, rbx
	mov	r9, r13
	shld	r13, r8, 13
	shr	r9, 51
	add	rsi, qword ptr [rbp - 400]
	adc	rcx, qword ptr [rbp - 56]
	add	rsi, qword ptr [rbp - 144]
	adc	rcx, qword ptr [rbp - 64]
	add	rsi, rax
	adc	rcx, rdx
	add	rsi, qword ptr [rbp - 408]
	adc	rcx, qword ptr [rbp - 48]
	add	rsi, r13
	adc	rcx, r9
	mov	rax, rcx
	shld	rax, rsi, 13
	shr	rcx, 51
	lea	rdx, [rcx + 8*rcx]
	lea	rcx, [rcx + 2*rdx]
	mov	edx, 19
	mul	rdx
	movabs	r9, 2251799813685247
	and	r10, r9
	add	rax, r10
	adc	rdx, rcx
	shld	rdx, rax, 13
	and	r11, r9
	add	rdx, r11
	mov	qword ptr [rbp - 192], rdx
	and	rax, r9
	mov	qword ptr [rbp - 80], rax
	and	rdi, r9
	mov	qword ptr [rbp - 96], rdi
	and	r8, r9
	mov	qword ptr [rbp - 144], r8
	mov	rcx, qword ptr [rbp - 160]
	lea	rax, [rcx + 8*rcx]
	lea	r14, [rcx + 2*rax]
	mov	rcx, qword ptr [rbp - 112]
	lea	rax, [rcx + 8*rcx]
	lea	r9, [rcx + 2*rax]
	mov	qword ptr [rbp - 136], r9
	mov	rcx, qword ptr [rbp - 352]
	lea	rax, [rcx + 8*rcx]
	lea	rcx, [rcx + 2*rax]
	mov	qword ptr [rbp - 56], rcx
	mov	r10, qword ptr [rbp - 208]
	mov	rax, r10
	mov	r13, qword ptr [rbp - 360]
	mul	r13
	mov	qword ptr [rbp - 72], rdx
	mov	qword ptr [rbp - 64], rax
	mov	r11, qword ptr [rbp - 224]
	mov	rax, r11
	mul	rcx
	mov	qword ptr [rbp - 128], rax
	mov	qword ptr [rbp - 104], rdx
	mov	rcx, qword ptr [rbp - 168]
	lea	rax, [rcx + 8*rcx]
	lea	rcx, [rcx + 2*rax]
	mov	qword ptr [rbp - 48], rcx
	mov	rdi, qword ptr [rbp - 240]
	mov	rax, rdi
	mul	rcx
	mov	r8, rdx
	mov	rbx, rax
	mov	r12, qword ptr [rbp - 216]
	mov	rax, r12
	mul	r9
	mov	rcx, rdx
	mov	r15, rax
	mov	r9, qword ptr [rbp - 120]
	mov	rax, r9
	mul	r14
	movabs	r14, 2251799813685247
	and	rsi, r14
	mov	qword ptr [rbp - 88], rsi
	add	r15, rbx
	adc	rcx, r8
	add	r15, qword ptr [rbp - 64]
	adc	rcx, qword ptr [rbp - 72]
	add	r15, qword ptr [rbp - 128]
	adc	rcx, qword ptr [rbp - 104]
	add	r15, rax
	mov	qword ptr [rbp - 128], r15
	adc	rcx, rdx
	mov	rax, r10
	mov	r15, qword ptr [rbp - 160]
	mul	r15
	mov	qword ptr [rbp - 72], rdx
	mov	qword ptr [rbp - 64], rax
	mov	rax, r13
	mov	rsi, r11
	mul	r11
	mov	qword ptr [rbp - 104], rdx
	mov	qword ptr [rbp - 184], rax
	mov	rax, rdi
	mov	r11, qword ptr [rbp - 56]
	mul	r11
	mov	qword ptr [rbp - 288], rdx
	mov	qword ptr [rbp - 312], rax
	mov	r8, r12
	mov	rax, r12
	mul	qword ptr [rbp - 48]
	mov	qword ptr [rbp - 552], rdx
	mov	qword ptr [rbp - 536], rax
	mov	rbx, r9
	mov	rax, r9
	mul	qword ptr [rbp - 136]
	mov	r9, rdx
	mov	r14, rax
	mov	rax, r10
	mov	r12, qword ptr [rbp - 112]
	mul	r12
	mov	qword ptr [rbp - 152], rdx
	mov	qword ptr [rbp - 280], rax
	mov	rax, rsi
	mul	r15
	mov	qword ptr [rbp - 136], rdx
	mov	qword ptr [rbp - 256], rax
	mov	rax, r13
	mul	rdi
	mov	r15, rdi
	mov	qword ptr [rbp - 368], rdx
	mov	qword ptr [rbp - 408], rax
	mov	rax, r8
	mul	r11
	mov	qword ptr [rbp - 416], rdx
	mov	qword ptr [rbp - 544], rax
	mov	r8, rbx
	mov	rax, rbx
	mul	qword ptr [rbp - 48]
	mov	rdi, rdx
	mov	rsi, rax
	mov	r11, qword ptr [rbp - 208]
	mov	rax, r11
	mul	qword ptr [rbp - 168]
	mov	qword ptr [rbp - 336], rdx
	mov	qword ptr [rbp - 304], rax
	mov	rax, r12
	mov	r12, qword ptr [rbp - 224]
	mul	r12
	mov	qword ptr [rbp - 48], rdx
	mov	qword ptr [rbp - 320], rax
	mov	rax, r15
	mul	qword ptr [rbp - 160]
	mov	qword ptr [rbp - 328], rdx
	mov	qword ptr [rbp - 376], rax
	mov	rax, r13
	mov	r13, qword ptr [rbp - 216]
	mul	r13
	mov	r10, rdx
	mov	rbx, rax
	mov	rax, r8
	mul	qword ptr [rbp - 56]
	mov	qword ptr [rbp - 768], rdx
	mov	qword ptr [rbp - 760], rax
	mov	rax, r11
	mul	qword ptr [rbp - 352]
	mov	qword ptr [rbp - 352], rdx
	mov	qword ptr [rbp - 400], rax
	mov	rax, qword ptr [rbp - 168]
	mul	r12
	mov	qword ptr [rbp - 56], rdx
	mov	qword ptr [rbp - 168], rax
	mov	rax, r15
	mul	qword ptr [rbp - 112]
	mov	r12, rdx
	mov	r11, rax
	mov	rax, r13
	mul	qword ptr [rbp - 160]
	mov	r13, rdx
	mov	qword ptr [rbp - 112], rax
	mov	rax, qword ptr [rbp - 360]
	mul	r8
	mov	r8, rcx
	mov	r15, qword ptr [rbp - 128]
	shld	rcx, r15, 13
	shr	r8, 51
	add	r14, qword ptr [rbp - 536]
	adc	r9, qword ptr [rbp - 552]
	add	r14, qword ptr [rbp - 312]
	adc	r9, qword ptr [rbp - 288]
	add	r14, qword ptr [rbp - 184]
	adc	r9, qword ptr [rbp - 104]
	add	r14, qword ptr [rbp - 64]
	adc	r9, qword ptr [rbp - 72]
	add	r14, rcx
	adc	r9, r8
	mov	rcx, r9
	shld	r9, r14, 13
	shr	rcx, 51
	add	rsi, qword ptr [rbp - 280]
	adc	rdi, qword ptr [rbp - 152]
	add	rsi, qword ptr [rbp - 408]
	adc	rdi, qword ptr [rbp - 368]
	add	rsi, qword ptr [rbp - 544]
	adc	rdi, qword ptr [rbp - 416]
	add	rsi, qword ptr [rbp - 256]
	adc	rdi, qword ptr [rbp - 136]
	add	rsi, r9
	adc	rdi, rcx
	mov	rcx, rdi
	shld	rdi, rsi, 13
	shr	rcx, 51
	add	rbx, qword ptr [rbp - 304]
	adc	r10, qword ptr [rbp - 336]
	add	rbx, qword ptr [rbp - 760]
	adc	r10, qword ptr [rbp - 768]
	add	rbx, qword ptr [rbp - 320]
	adc	r10, qword ptr [rbp - 48]
	add	rbx, qword ptr [rbp - 376]
	adc	r10, qword ptr [rbp - 328]
	add	rbx, rdi
	adc	r10, rcx
	mov	rcx, r10
	shr	rcx, 51
	shld	r10, rbx, 13
	add	r11, qword ptr [rbp - 400]
	adc	r12, qword ptr [rbp - 352]
	add	r11, rax
	adc	r12, rdx
	add	r11, qword ptr [rbp - 168]
	adc	r12, qword ptr [rbp - 56]
	add	r11, qword ptr [rbp - 112]
	adc	r12, r13
	add	r11, r10
	adc	r12, rcx
	mov	rax, r12
	shr	r12, 51
	lea	rcx, [r12 + 8*r12]
	lea	rcx, [r12 + 2*rcx]
	movabs	r13, 2251799813685247
	mov	rdi, r15
	and	rdi, r13
	shld	rax, r11, 13
	mov	edx, 19
	mul	rdx
	add	rax, rdi
	adc	rdx, rcx
	and	r14, r13
	shld	rdx, rax, 13
	add	rdx, r14
	mov	qword ptr [rbp - 72], rdx
	and	rax, r13
	mov	qword ptr [rbp - 112], rax
	mov	rax, qword ptr [rbp - 264]
	mov	r12d, 121665
	mul	r12
	mov	rcx, rax
	mov	r10, rdx
	and	rsi, r13
	mov	qword ptr [rbp - 48], rsi
	mov	rax, qword ptr [rbp - 272]
	mul	r12
	mov	r8, rdx
	mov	rdi, rax
	mov	rax, qword ptr [rbp - 344]
	mul	r12
	mov	r14, rdx
	mov	r9, rax
	mov	rax, qword ptr [rbp - 392]
	mul	r12
	mov	r15, rax
	mov	rsi, rdx
	and	rbx, r13
	mov	qword ptr [rbp - 56], rbx
	mov	rax, qword ptr [rbp - 384]
	mul	r12
	shld	r10, rcx, 13
	and	r11, r13
	mov	qword ptr [rbp - 64], r11
	add	r10, rdi
	adc	r8, 0
	shld	r8, r10, 13
	add	r8, r9
	adc	r14, 0
	shld	r14, r8, 13
	add	r14, r15
	adc	rsi, 0
	shld	rsi, r14, 13
	and	rcx, r13
	add	rax, rsi
	adc	edx, 0
	mov	rsi, rax
	shr	rsi, 51
	shl	edx, 13
	or	rdx, rsi
	lea	rsi, [rdx + 8*rdx]
	lea	r12, [rdx + 2*rsi]
	add	r12, rcx
	mov	rdx, r12
	and	r12, r13
	add	r12, qword ptr [rbp - 208]
	and	r10, r13
	add	r10, qword ptr [rbp - 224]
	shr	rdx, 51
	add	r10, rdx
	and	r8, r13
	add	r8, qword ptr [rbp - 240]
	and	r14, r13
	add	r14, qword ptr [rbp - 216]
	mov	rdx, rax
	and	rdx, r13
	add	rdx, qword ptr [rbp - 120]
	mov	qword ptr [rbp - 216], rdx
	lea	rax, [r10 + 8*r10]
	lea	r13, [r10 + 2*rax]
	lea	rax, [r8 + 8*r8]
	lea	rbx, [r8 + 2*rax]
	mov	qword ptr [rbp - 168], rbx
	lea	rax, [rdx + 8*rdx]
	lea	rcx, [rdx + 2*rax]
	mov	qword ptr [rbp - 224], rcx
	mov	rax, r12
	mul	qword ptr [rbp - 264]
	mov	qword ptr [rbp - 208], rdx
	mov	qword ptr [rbp - 160], rax
	mov	rax, rcx
	mov	rdi, qword ptr [rbp - 272]
	mul	rdi
	mov	qword ptr [rbp - 104], rax
	mov	qword ptr [rbp - 240], rdx
	lea	rax, [r14 + 8*r14]
	lea	rax, [r14 + 2*rax]
	mov	qword ptr [rbp - 120], rax
	mov	rsi, qword ptr [rbp - 344]
	mul	rsi
	mov	r11, rdx
	mov	r9, rax
	mov	rax, rbx
	mov	rbx, qword ptr [rbp - 392]
	mul	rbx
	mov	r15, rdx
	mov	rcx, rax
	mov	rax, r13
	mov	r13, qword ptr [rbp - 384]
	mul	r13
	add	rcx, r9
	adc	r15, r11
	add	rcx, qword ptr [rbp - 104]
	adc	r15, qword ptr [rbp - 240]
	add	rcx, qword ptr [rbp - 160]
	adc	r15, qword ptr [rbp - 208]
	add	rcx, rax
	mov	qword ptr [rbp - 104], rcx
	adc	r15, rdx
	mov	rax, r10
	mov	r11, qword ptr [rbp - 264]
	mul	r11
	mov	qword ptr [rbp - 208], rdx
	mov	qword ptr [rbp - 160], rax
	mov	rax, r12
	mul	rdi
	mov	qword ptr [rbp - 240], rdx
	mov	qword ptr [rbp - 360], rax
	mov	rcx, qword ptr [rbp - 224]
	mov	rax, rcx
	mul	rsi
	mov	qword ptr [rbp - 128], rdx
	mov	qword ptr [rbp - 152], rax
	mov	rax, qword ptr [rbp - 120]
	mul	rbx
	mov	rsi, rbx
	mov	qword ptr [rbp - 280], rdx
	mov	qword ptr [rbp - 328], rax
	mov	rax, qword ptr [rbp - 168]
	mul	r13
	mov	r9, rdx
	mov	qword ptr [rbp - 400], rax
	mov	rax, r8
	mul	r11
	mov	qword ptr [rbp - 136], rdx
	mov	qword ptr [rbp - 184], rax
	mov	rax, r10
	mul	rdi
	mov	r11, rdi
	mov	qword ptr [rbp - 168], rdx
	mov	qword ptr [rbp - 352], rax
	mov	rax, r12
	mov	rbx, qword ptr [rbp - 344]
	mul	rbx
	mov	qword ptr [rbp - 256], rdx
	mov	qword ptr [rbp - 288], rax
	mov	rax, rcx
	mul	rsi
	mov	qword ptr [rbp - 336], rdx
	mov	qword ptr [rbp - 312], rax
	mov	rax, qword ptr [rbp - 120]
	mul	r13
	mov	rdi, rdx
	mov	rcx, rax
	mov	rax, r14
	mul	qword ptr [rbp - 264]
	mov	qword ptr [rbp - 120], rdx
	mov	r13, rax
	mov	rax, r8
	mul	r11
	add	rax, r13
	mov	qword ptr [rbp - 304], rax
	adc	rdx, qword ptr [rbp - 120]
	mov	qword ptr [rbp - 376], rdx
	mov	rax, r10
	mul	rbx
	mov	qword ptr [rbp - 120], rdx
	mov	qword ptr [rbp - 320], rax
	mov	rax, r12
	mul	rsi
	mov	qword ptr [rbp - 368], rdx
	mov	qword ptr [rbp - 416], rax
	mov	rax, qword ptr [rbp - 224]
	mov	rsi, qword ptr [rbp - 384]
	mul	rsi
	mov	r13, rdx
	mov	r11, rax
	mov	rax, qword ptr [rbp - 216]
	mul	qword ptr [rbp - 264]
	mov	qword ptr [rbp - 264], rdx
	mov	qword ptr [rbp - 224], rax
	mov	rax, r14
	mul	qword ptr [rbp - 272]
	mov	qword ptr [rbp - 272], rdx
	mov	qword ptr [rbp - 408], rax
	mov	rax, r8
	mul	rbx
	mov	rbx, rdx
	mov	r8, rax
	mov	rax, r10
	mul	qword ptr [rbp - 392]
	mov	qword ptr [rbp - 216], rdx
	mov	r10, rax
	mov	rax, r12
	mul	rsi
	mov	r12, r15
	mov	r14, qword ptr [rbp - 104]
	shld	r15, r14, 13
	shr	r12, 51
	mov	rsi, qword ptr [rbp - 400]
	add	rsi, qword ptr [rbp - 328]
	adc	r9, qword ptr [rbp - 280]
	add	rsi, qword ptr [rbp - 152]
	adc	r9, qword ptr [rbp - 128]
	add	rsi, qword ptr [rbp - 360]
	adc	r9, qword ptr [rbp - 240]
	add	rsi, qword ptr [rbp - 160]
	adc	r9, qword ptr [rbp - 208]
	add	rsi, r15
	adc	r9, r12
	mov	r15, r9
	shld	r9, rsi, 13
	shr	r15, 51
	add	rcx, qword ptr [rbp - 184]
	adc	rdi, qword ptr [rbp - 136]
	add	rcx, qword ptr [rbp - 312]
	adc	rdi, qword ptr [rbp - 336]
	add	rcx, qword ptr [rbp - 288]
	adc	rdi, qword ptr [rbp - 256]
	add	rcx, qword ptr [rbp - 352]
	adc	rdi, qword ptr [rbp - 168]
	add	rcx, r9
	adc	rdi, r15
	mov	r9, rdi
	shld	rdi, rcx, 13
	shr	r9, 51
	add	r11, qword ptr [rbp - 304]
	adc	r13, qword ptr [rbp - 376]
	add	r11, qword ptr [rbp - 416]
	adc	r13, qword ptr [rbp - 368]
	add	r11, qword ptr [rbp - 320]
	adc	r13, qword ptr [rbp - 120]
	add	r11, rdi
	adc	r13, r9
	mov	r9, qword ptr [rbp - 296]
	mov	rdi, r13
	shld	r13, r11, 13
	shr	rdi, 51
	add	r8, qword ptr [rbp - 408]
	adc	rbx, qword ptr [rbp - 272]
	add	r8, qword ptr [rbp - 224]
	adc	rbx, qword ptr [rbp - 264]
	add	r8, rax
	adc	rbx, rdx
	add	r8, r10
	adc	rbx, qword ptr [rbp - 216]
	add	r8, r13
	adc	rbx, rdi
	mov	rax, rbx
	shr	rbx, 51
	lea	rdx, [rbx + 8*rbx]
	lea	rdi, [rbx + 2*rdx]
	movabs	rbx, 2251799813685247
	and	r14, rbx
	shld	rax, r8, 13
	mov	edx, 19
	mul	rdx
	mov	r10, rax
	add	r10, r14
	mov	r14, rdx
	mov	rdx, qword ptr [rbp - 776]
	adc	r14, rdi
	mov	r12, qword ptr [rbp - 200]
	mov	r15, qword ptr [rbp - 176]
	and	rsi, rbx
	shld	r14, r10, 13
	add	r14, rsi
	mov	rsi, qword ptr [rbp - 440]
	and	r10, rbx
	and	rcx, rbx
	and	r11, rbx
	and	r8, rbx
	add	rsi, -1
	jb	LBB111_3
	## InlineAsm Start

	## rdx 

	## InlineAsm End
	neg	rdx
	mov	rax, r9
	mov	rsi, qword ptr [rbp - 112]
	xor	rax, rsi
	and	rax, rdx
	xor	rsi, rax
	xor	rax, r9
	mov	qword ptr [rbp - 736], rsi
	mov	r13, rsi
	mov	qword ptr [rbp - 112], rsi
	mov	qword ptr [rbp - 656], rax
	mov	rsi, qword ptr [rbp - 232]
	mov	rax, rsi
	mov	rbx, qword ptr [rbp - 72]
	xor	rax, rbx
	and	rax, rdx
	xor	rbx, rax
	xor	rax, rsi
	mov	qword ptr [rbp - 728], rbx
	mov	qword ptr [rbp - 72], rbx
	mov	qword ptr [rbp - 648], rax
	mov	rax, r15
	mov	rsi, qword ptr [rbp - 48]
	xor	rax, rsi
	and	rax, rdx
	xor	rsi, rax
	mov	qword ptr [rbp - 48], rsi
	xor	rax, r15
	mov	qword ptr [rbp - 720], rsi
	mov	qword ptr [rbp - 640], rax
	mov	rax, r12
	mov	rsi, qword ptr [rbp - 56]
	xor	rax, rsi
	and	rax, rdx
	xor	rsi, rax
	mov	qword ptr [rbp - 56], rsi
	xor	rax, r12
	mov	qword ptr [rbp - 712], rsi
	mov	qword ptr [rbp - 632], rax
	mov	rsi, qword ptr [rbp - 248]
	mov	rax, rsi
	mov	r15, qword ptr [rbp - 64]
	xor	rax, r15
	and	rax, rdx
	xor	r15, rax
	xor	rax, rsi
	mov	qword ptr [rbp - 704], r15
	mov	qword ptr [rbp - 624], rax
	mov	rsi, qword ptr [rbp - 80]
	mov	rax, rsi
	xor	rax, r10
	and	rax, rdx
	xor	r10, rax
	mov	qword ptr [rbp - 696], r10
	xor	rax, rsi
	mov	qword ptr [rbp - 616], rax
	mov	rsi, qword ptr [rbp - 192]
	mov	rax, rsi
	xor	rax, r14
	and	rax, rdx
	xor	r14, rax
	mov	qword ptr [rbp - 688], r14
	xor	rax, rsi
	mov	qword ptr [rbp - 608], rax
	mov	rsi, qword ptr [rbp - 96]
	mov	rax, rsi
	xor	rax, rcx
	and	rax, rdx
	xor	rcx, rax
	mov	qword ptr [rbp - 680], rcx
	xor	rax, rsi
	mov	qword ptr [rbp - 600], rax
	mov	rcx, qword ptr [rbp - 144]
	mov	rax, rcx
	xor	rax, r11
	and	rax, rdx
	xor	r11, rax
	mov	qword ptr [rbp - 672], r11
	xor	rax, rcx
	mov	qword ptr [rbp - 592], rax
	mov	rcx, qword ptr [rbp - 88]
	mov	rax, rcx
	xor	rax, r8
	and	rax, rdx
	xor	r8, rax
	mov	qword ptr [rbp - 664], r8
	xor	rax, rcx
	mov	qword ptr [rbp - 584], rax
	lea	rdi, [rbp - 528]
	lea	rsi, [rbp - 696]
	call	__RNvMs0_NtCsl3pv5AGSK2E_12toyos_crypto10field25519NtB5_5Tight6invert
	mov	r11, qword ptr [rbp - 528]
	mov	rdx, qword ptr [rbp - 520]
	mov	qword ptr [rbp - 264], rdx
	lea	rcx, [rdx + 8*rdx]
	lea	rcx, [rdx + 2*rcx]
	mov	rax, r11
	mov	qword ptr [rbp - 224], r11
	mul	r13
	mov	qword ptr [rbp - 160], rax
	mov	qword ptr [rbp - 208], rdx
	mov	rdx, qword ptr [rbp - 496]
	mov	qword ptr [rbp - 216], rdx
	lea	rax, [rdx + 8*rdx]
	lea	rax, [rdx + 2*rax]
	mov	qword ptr [rbp - 120], rax
	mul	rbx
	mov	rsi, rax
	mov	qword ptr [rbp - 96], rdx
	mov	rdx, qword ptr [rbp - 504]
	mov	qword ptr [rbp - 80], rdx
	lea	rax, [rdx + 8*rdx]
	lea	rax, [rdx + 2*rax]
	mov	qword ptr [rbp - 344], rax
	mov	r13, qword ptr [rbp - 48]
	mul	r13
	mov	r8, rax
	mov	r9, rdx
	mov	r12, qword ptr [rbp - 512]
	lea	rax, [r12 + 8*r12]
	lea	rdi, [r12 + 2*rax]
	mov	rax, rdi
	mov	r10, qword ptr [rbp - 56]
	mul	r10
	mov	r14, rdx
	mov	rbx, rax
	mov	rax, rcx
	mul	r15
	mov	rcx, rdx
	add	rax, rbx
	adc	rcx, r14
	add	rax, r8
	adc	rcx, r9
	add	rax, rsi
	adc	rcx, qword ptr [rbp - 96]
	add	rax, qword ptr [rbp - 160]
	mov	qword ptr [rbp - 136], rax
	adc	rcx, qword ptr [rbp - 208]
	mov	rsi, qword ptr [rbp - 264]
	mov	rax, rsi
	mov	rbx, qword ptr [rbp - 112]
	mul	rbx
	mov	qword ptr [rbp - 160], rdx
	mov	qword ptr [rbp - 200], rax
	mov	rax, r11
	mov	r14, qword ptr [rbp - 72]
	mul	r14
	mov	qword ptr [rbp - 208], rdx
	mov	qword ptr [rbp - 176], rax
	mov	r11, qword ptr [rbp - 120]
	mov	rax, r11
	mul	r13
	mov	qword ptr [rbp - 96], rdx
	mov	qword ptr [rbp - 248], rax
	mov	r13, qword ptr [rbp - 344]
	mov	rax, r13
	mul	r10
	mov	qword ptr [rbp - 392], rdx
	mov	qword ptr [rbp - 384], rax
	mov	rax, rdi
	mov	r10, r15
	mov	qword ptr [rbp - 64], r15
	mul	r15
	mov	r15, rdx
	mov	rdi, rax
	mov	qword ptr [rbp - 128], r12
	mov	rax, r12
	mul	rbx
	mov	r12, rbx
	mov	r8, rdx
	mov	r9, rax
	mov	rax, rsi
	mul	r14
	add	rax, r9
	mov	qword ptr [rbp - 168], rax
	adc	rdx, r8
	mov	qword ptr [rbp - 296], rdx
	mov	rbx, qword ptr [rbp - 224]
	mov	rax, rbx
	mov	r8, qword ptr [rbp - 48]
	mul	r8
	mov	qword ptr [rbp - 272], rdx
	mov	qword ptr [rbp - 144], rax
	mov	rax, r11
	mov	r11, qword ptr [rbp - 56]
	mul	r11
	mov	qword ptr [rbp - 104], rdx
	mov	qword ptr [rbp - 232], rax
	mov	rax, r13
	mul	r10
	mov	r9, rdx
	mov	rsi, rax
	mov	r10, qword ptr [rbp - 80]
	mov	rax, r10
	mul	r12
	mov	qword ptr [rbp - 344], rdx
	mov	qword ptr [rbp - 240], rax
	mov	r12, qword ptr [rbp - 128]
	mov	rax, r12
	mul	r14
	mov	qword ptr [rbp - 88], rdx
	mov	qword ptr [rbp - 432], rax
	mov	r14, qword ptr [rbp - 264]
	mov	rax, r14
	mul	r8
	mov	r13, rdx
	mov	r8, rax
	mov	rax, rbx
	mul	r11
	mov	qword ptr [rbp - 424], rdx
	mov	qword ptr [rbp - 360], rax
	mov	rax, qword ptr [rbp - 120]
	mov	rbx, qword ptr [rbp - 64]
	mul	rbx
	mov	qword ptr [rbp - 440], rdx
	mov	qword ptr [rbp - 352], rax
	mov	rax, qword ptr [rbp - 216]
	mul	qword ptr [rbp - 112]
	mov	qword ptr [rbp - 120], rdx
	mov	qword ptr [rbp - 112], rax
	mov	rax, r10
	mul	qword ptr [rbp - 72]
	mov	qword ptr [rbp - 72], rdx
	mov	qword ptr [rbp - 216], rax
	mov	rax, r12
	mul	qword ptr [rbp - 48]
	mov	qword ptr [rbp - 48], rdx
	mov	qword ptr [rbp - 80], rax
	mov	rax, r14
	mul	r11
	mov	r14, rdx
	mov	r10, rax
	mov	rax, qword ptr [rbp - 224]
	mul	rbx
	mov	r11, rcx
	mov	rbx, qword ptr [rbp - 136]
	shld	rcx, rbx, 13
	shr	r11, 51
	add	rdi, qword ptr [rbp - 200]
	adc	r15, qword ptr [rbp - 160]
	add	rdi, qword ptr [rbp - 384]
	adc	r15, qword ptr [rbp - 392]
	add	rdi, qword ptr [rbp - 176]
	adc	r15, qword ptr [rbp - 208]
	add	rdi, qword ptr [rbp - 248]
	adc	r15, qword ptr [rbp - 96]
	add	rdi, rcx
	adc	r15, r11
	mov	rcx, r15
	shld	r15, rdi, 13
	shr	rcx, 51
	add	rsi, qword ptr [rbp - 168]
	adc	r9, qword ptr [rbp - 296]
	add	rsi, qword ptr [rbp - 144]
	adc	r9, qword ptr [rbp - 272]
	add	rsi, qword ptr [rbp - 232]
	adc	r9, qword ptr [rbp - 104]
	add	rsi, r15
	adc	r9, rcx
	mov	rcx, r9
	shld	r9, rsi, 13
	shr	rcx, 51
	add	r8, qword ptr [rbp - 432]
	adc	r13, qword ptr [rbp - 88]
	add	r8, qword ptr [rbp - 240]
	adc	r13, qword ptr [rbp - 344]
	add	r8, qword ptr [rbp - 360]
	adc	r13, qword ptr [rbp - 424]
	add	r8, qword ptr [rbp - 352]
	adc	r13, qword ptr [rbp - 440]
	add	r8, r9
	adc	r13, rcx
	mov	rcx, r13
	shld	r13, r8, 13
	shr	rcx, 51
	add	r10, qword ptr [rbp - 80]
	adc	r14, qword ptr [rbp - 48]
	add	r10, qword ptr [rbp - 216]
	adc	r14, qword ptr [rbp - 72]
	add	r10, qword ptr [rbp - 112]
	adc	r14, qword ptr [rbp - 120]
	add	r10, rax
	adc	r14, rdx
	add	r10, r13
	adc	r14, rcx
	movabs	r11, 2251799813685247
	mov	r9, rbx
	and	r9, r11
	mov	rax, r14
	shld	rax, r10, 13
	shr	r14, 51
	lea	rcx, [r14 + 8*r14]
	lea	rcx, [r14 + 2*rcx]
	mov	edx, 19
	mul	rdx
	add	rax, r9
	adc	rdx, rcx
	and	rdi, r11
	shld	rdx, rax, 13
	add	rdx, rdi
	and	rax, r11
	and	rsi, r11
	and	r8, r11
	and	r10, r11
	lea	rcx, [rax + 19]
	shr	rcx, 51
	add	rcx, rdx
	shr	rcx, 51
	add	rcx, rsi
	shr	rcx, 51
	add	rcx, r8
	shr	rcx, 51
	add	rcx, r10
	shr	rcx, 51
	lea	rdi, [rcx + 8*rcx]
	lea	rcx, [rcx + 2*rdi]
	add	rcx, rax
	mov	rax, rcx
	shr	rax, 51
	add	rax, rdx
	mov	rdx, rax
	shr	rdx, 51
	add	rdx, rsi
	mov	rdi, rdx
	shr	rdi, 51
	add	rdi, r8
	mov	rsi, rdi
	shr	rsi, 51
	add	rsi, r10
	shl	rsi, 12
	movabs	r8, 9223372036854771712
	and	r8, rsi
	mov	rsi, rdi
	shr	rsi, 39
	and	esi, 4095
	or	rsi, r8
	shl	rdi, 25
	mov	r8, rdx
	shr	r8, 26
	and	r8d, 33554431
	or	r8, rdi
	mov	rdi, rax
	shr	rdi, 13
	movabs	r9, 274877906943
	and	r9, rdi
	shl	rdx, 38
	or	r9, rdx
	and	rcx, r11
	shl	rax, 51
	or	rcx, rax
	mov	rax, qword ptr [rbp - 744]
	mov	qword ptr [rax], rcx
	mov	qword ptr [rax + 8], r9
	mov	qword ptr [rax + 16], r8
	mov	qword ptr [rax + 24], rsi
	xorps	xmm0, xmm0
	movaps	xmmword ptr [rbp - 528], xmm0
	movaps	xmm1, xmmword ptr [rbp - 528]
	movaps	xmmword ptr [rbp - 736], xmm1
	movaps	xmmword ptr [rbp - 528], xmm0
	mov	rdx, qword ptr [rbp - 528]
	mov	rcx, qword ptr [rbp - 520]
	lea	rsi, [rbp - 736]
	mov	qword ptr [rsi + 24], rcx
	mov	qword ptr [rsi + 16], rdx
	movaps	xmmword ptr [rbp - 528], xmm0
	mov	rdx, qword ptr [rbp - 528]
	mov	rcx, qword ptr [rbp - 520]
	mov	qword ptr [rsi + 40], rcx
	mov	qword ptr [rsi + 32], rdx
	movaps	xmmword ptr [rbp - 528], xmm0
	mov	rdx, qword ptr [rbp - 528]
	mov	rcx, qword ptr [rbp - 520]
	mov	qword ptr [rsi + 56], rcx
	mov	qword ptr [rsi + 48], rdx
	movaps	xmmword ptr [rbp - 528], xmm0
	mov	rdx, qword ptr [rbp - 528]
	mov	rcx, qword ptr [rbp - 520]
	mov	qword ptr [rsi + 72], rcx
	mov	qword ptr [rsi + 64], rdx
	movaps	xmmword ptr [rbp - 528], xmm0
	mov	rdx, qword ptr [rbp - 528]
	mov	rcx, qword ptr [rbp - 520]
	mov	qword ptr [rbp - 656], rdx
	mov	qword ptr [rbp - 648], rcx
	movaps	xmmword ptr [rbp - 528], xmm0
	mov	rdx, qword ptr [rbp - 528]
	mov	rcx, qword ptr [rbp - 520]
	mov	qword ptr [rbp - 640], rdx
	mov	qword ptr [rbp - 632], rcx
	movaps	xmmword ptr [rbp - 528], xmm0
	mov	rdx, qword ptr [rbp - 528]
	mov	rcx, qword ptr [rbp - 520]
	mov	qword ptr [rbp - 624], rdx
	mov	qword ptr [rbp - 616], rcx
	movaps	xmmword ptr [rbp - 528], xmm0
	mov	rdx, qword ptr [rbp - 528]
	mov	rcx, qword ptr [rbp - 520]
	mov	qword ptr [rbp - 608], rdx
	mov	qword ptr [rbp - 600], rcx
	movaps	xmmword ptr [rbp - 528], xmm0
	mov	rdx, qword ptr [rbp - 528]
	mov	rcx, qword ptr [rbp - 520]
	mov	qword ptr [rbp - 592], rdx
	mov	qword ptr [rbp - 584], rcx
	##MEMBARRIER
	add	rsp, 744
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.cfi_endproc
