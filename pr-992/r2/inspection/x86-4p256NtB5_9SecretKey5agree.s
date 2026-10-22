_RNvMs0_NtNtCs4U4sOGKWW3b_12toyos_crypto3ecc4p256NtB5_9SecretKey5agree:
.Lfunc_begin55:
	.loc	54 64 0 is_stmt 1
	.cfi_startproc
	.cfi_personality 155, DW.ref.rust_eh_personality
	.cfi_lsda 27, .Lexception15
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$288, %rsp
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %rbx
	movq	%rdi, %r14
.Ltmp10857:
	.loc	54 65 42 prologue_end
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -80(%rbp)
	movaps	%xmm0, -96(%rbp)
.Ltmp10858:
	.loc	54 0 42 is_stmt 0
	leaq	-320(%rbp), %r12
.Ltmp10859:
	.loc	56 216 38 is_stmt 1
	movq	%r12, %rdi
	movq	%rdx, %rsi
.Ltmp10860:
	movq	%rbx, %rdx
.Ltmp10861:
	callq	_RNvMs3_NtCs4U4sOGKWW3b_12toyos_crypto4nistINtB5_5PointNtB5_4P256Kj4_E3mulB7_
.Ltmp10862:
	.loc	56 0 38 is_stmt 0
	leaq	-176(%rbp), %r15
.Ltmp10863:
	.loc	56 221 14 is_stmt 1
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	_RNvMs3_NtCs4U4sOGKWW3b_12toyos_crypto4nistINtB5_5PointNtB5_4P256Kj4_E6affineB7_
.Ltmp10864:
	.loc	19 1182 9
	cmpb	$1, -176(%rbp)
.Ltmp10865:
	je	.LBB55_1
.Ltmp10866:
	.loc	19 1183 16
	movq	-168(%rbp), %rsi
	movq	-160(%rbp), %rdx
	movq	-152(%rbp), %rcx
	movq	-144(%rbp), %rax
	movq	-136(%rbp), %rdi
	movq	-128(%rbp), %r8
	movq	-120(%rbp), %r9
	movq	-112(%rbp), %r10
.Ltmp10867:
	.loc	56 219 14
	movq	%rsi, -208(%rbp)
	movq	%rdx, -200(%rbp)
	movq	%rcx, -192(%rbp)
	movq	%rax, -184(%rbp)
	.loc	56 219 21 is_stmt 0
	movq	%rdi, -48(%rbp)
	movq	%r8, -56(%rbp)
	movq	%r9, -224(%rbp)
	movq	%r10, -216(%rbp)
.Ltmp10868:
	.loc	4 703 13 is_stmt 1
	bswapq	%rsi
.Ltmp10869:
	.loc	3 102 24
	leaq	-72(%rbp), %rdi
.Ltmp10870:
	.loc	2 192 51
	movq	%rsi, -176(%rbp)
.Ltmp10871:
	.loc	4 3141 20
	movq	%r15, %r8
	subq	%rdi, %r8
	subq	%r15, %rdi
.Ltmp10872:
	cmovbq	%r8, %rdi
.Ltmp10873:
	.loc	5 181 13
	testq	%rdi, %rdi
.Ltmp10874:
	.loc	6 556 14
	je	.LBB55_7
.Ltmp10875:
	.loc	6 566 14
	movq	%rsi, -72(%rbp)
.Ltmp10876:
	.loc	4 703 13
	bswapq	%rdx
.Ltmp10877:
	.loc	3 102 24
	leaq	-80(%rbp), %rsi
.Ltmp10878:
	.loc	2 192 51
	movq	%rdx, -176(%rbp)
.Ltmp10879:
	.loc	4 3141 20
	movq	%r15, %rdi
	subq	%rsi, %rdi
	subq	%r15, %rsi
.Ltmp10880:
	cmovbq	%rdi, %rsi
.Ltmp10881:
	.loc	5 181 13
	testq	%rsi, %rsi
.Ltmp10882:
	.loc	6 556 14
	je	.LBB55_7
.Ltmp10883:
	.loc	6 566 14
	movq	%rdx, -80(%rbp)
.Ltmp10884:
	.loc	4 703 13
	bswapq	%rcx
.Ltmp10885:
	.loc	3 102 24
	leaq	-88(%rbp), %rdx
.Ltmp10886:
	.loc	2 192 51
	movq	%rcx, -176(%rbp)
.Ltmp10887:
	.loc	4 3141 20
	movq	%r15, %rsi
	subq	%rdx, %rsi
	subq	%r15, %rdx
.Ltmp10888:
	cmovbq	%rsi, %rdx
.Ltmp10889:
	.loc	5 181 13
	testq	%rdx, %rdx
.Ltmp10890:
	.loc	6 556 14
	je	.LBB55_7
.Ltmp10891:
	.loc	6 566 14
	movq	%rcx, -88(%rbp)
.Ltmp10892:
	.loc	4 703 13
	bswapq	%rax
.Ltmp10893:
	.loc	2 192 51
	movq	%rax, -176(%rbp)
	leaq	-96(%rbp), %rcx
.Ltmp10894:
	.loc	4 3141 20
	movq	%r15, %rdx
	subq	%rcx, %rdx
	subq	%r15, %rcx
	cmovbq	%rdx, %rcx
.Ltmp10895:
	.loc	5 181 13
	testq	%rcx, %rcx
.Ltmp10896:
	.loc	6 556 14
	je	.LBB55_7
.Ltmp10897:
	.loc	6 566 14
	movq	%rax, -96(%rbp)
.Ltmp10898:
	.loc	6 2259 9
	movq	$0, -208(%rbp)
	movq	$0, -200(%rbp)
	movq	$0, -192(%rbp)
	movq	$0, -184(%rbp)
.Ltmp10899:
	#MEMBARRIER
	.loc	6 2259 9 is_stmt 0
	movq	$0, -48(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -224(%rbp)
	movq	$0, -216(%rbp)
.Ltmp10900:
	#MEMBARRIER
	.loc	14 80 81 is_stmt 1
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -176(%rbp)
.Ltmp10901:
	.loc	6 2259 9
	movaps	-176(%rbp), %xmm1
	movaps	%xmm1, -320(%rbp)
.Ltmp10902:
	.loc	14 80 81
	movaps	%xmm0, -176(%rbp)
.Ltmp10903:
	.loc	6 2259 9
	movaps	-176(%rbp), %xmm1
	movaps	%xmm1, -304(%rbp)
.Ltmp10904:
	.loc	14 80 81
	movaps	%xmm0, -176(%rbp)
.Ltmp10905:
	.loc	6 2259 9
	movaps	-176(%rbp), %xmm1
	movaps	%xmm1, -288(%rbp)
.Ltmp10906:
	.loc	14 80 81
	movaps	%xmm0, -176(%rbp)
.Ltmp10907:
	.loc	6 2259 9
	movaps	-176(%rbp), %xmm1
	movaps	%xmm1, -272(%rbp)
.Ltmp10908:
	.loc	14 80 81
	movaps	%xmm0, -176(%rbp)
.Ltmp10909:
	.loc	6 2259 9
	movaps	-176(%rbp), %xmm1
	movaps	%xmm1, -256(%rbp)
.Ltmp10910:
	.loc	14 80 81
	movaps	%xmm0, -176(%rbp)
.Ltmp10911:
	.loc	6 2259 9
	movaps	-176(%rbp), %xmm0
	movaps	%xmm0, -240(%rbp)
.Ltmp10912:
	#MEMBARRIER
	.loc	54 67 37
	movaps	-96(%rbp), %xmm0
	movaps	-80(%rbp), %xmm1
	movups	%xmm1, 17(%r14)
	movups	%xmm0, 1(%r14)
	.loc	54 67 21 is_stmt 0
	movb	$0, (%r14)
.Ltmp10913:
	.loc	6 2259 9 is_stmt 1
	movq	$0, (%rbx)
.Ltmp10914:
	movq	$0, 8(%rbx)
.Ltmp10915:
	movq	$0, 16(%rbx)
.Ltmp10916:
	movq	$0, 24(%rbx)
.Ltmp10917:
	#MEMBARRIER
	.loc	54 68 18
	movq	%r14, %rax
	.loc	54 68 18 epilogue_begin is_stmt 0
	addq	$288, %rsp
	popq	%rbx
.Ltmp10918:
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp10919:
.LBB55_7:
	.cfi_def_cfa %rbp, 16
	.loc	5 73 21 is_stmt 1
	leaq	.Lanon.7527e279b24a9219233149cb0fcb89c0.153(%rip), %rdi
.Ltmp10920:
	leaq	.Lanon.7527e279b24a9219233149cb0fcb89c0.7(%rip), %rcx
	movl	$567, %esi
	xorl	%edx, %edx
	callq	_RNvNtCs9VSTO83uhuD_4core9panicking18panic_nounwind_fmt@PLT
.Ltmp10921:
.LBB55_1:
	.loc	19 1184 17
	movzbl	-175(%rbp), %eax
	movb	%al, -56(%rbp)
.Ltmp10854:
.Ltmp10922:
	.loc	19 1184 23 is_stmt 0
	leaq	.Lanon.7527e279b24a9219233149cb0fcb89c0.69(%rip), %rdi
	leaq	.Lanon.7527e279b24a9219233149cb0fcb89c0.49(%rip), %rcx
	leaq	.Lanon.7527e279b24a9219233149cb0fcb89c0.70(%rip), %r8
	leaq	-56(%rbp), %rdx
	movl	$46, %esi
	callq	_RNvNtCs9VSTO83uhuD_4core6result13unwrap_failed@PLT
.Ltmp10855:
.Ltmp10923:
	ud2
.Ltmp10924:
.LBB55_8:
.Ltmp10856:
	.loc	14 80 81 is_stmt 1
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -48(%rbp)
.Ltmp10925:
	.loc	6 2259 9
	movaps	-48(%rbp), %xmm1
	movaps	%xmm1, -320(%rbp)
.Ltmp10926:
	.loc	14 80 81
	movaps	%xmm0, -48(%rbp)
.Ltmp10927:
	.loc	6 2259 9
	movaps	-48(%rbp), %xmm1
	movaps	%xmm1, -304(%rbp)
.Ltmp10928:
	.loc	14 80 81
	movaps	%xmm0, -48(%rbp)
.Ltmp10929:
	.loc	6 2259 9
	movaps	-48(%rbp), %xmm1
	movaps	%xmm1, -288(%rbp)
.Ltmp10930:
	.loc	14 80 81
	movaps	%xmm0, -48(%rbp)
.Ltmp10931:
	.loc	6 2259 9
	movaps	-48(%rbp), %xmm1
	movaps	%xmm1, -272(%rbp)
.Ltmp10932:
	.loc	14 80 81
	movaps	%xmm0, -48(%rbp)
.Ltmp10933:
	.loc	6 2259 9
	movaps	-48(%rbp), %xmm1
	movaps	%xmm1, -256(%rbp)
.Ltmp10934:
	.loc	14 80 81
	movaps	%xmm0, -48(%rbp)
.Ltmp10935:
	.loc	6 2259 9
	movaps	-48(%rbp), %xmm1
	movaps	%xmm1, -240(%rbp)
.Ltmp10936:
	#MEMBARRIER
	.loc	14 80 81
	movaps	%xmm0, -48(%rbp)
.Ltmp10937:
	.loc	6 2259 9
	movaps	-48(%rbp), %xmm1
	movaps	%xmm1, -96(%rbp)
.Ltmp10938:
	.loc	14 80 81
	movaps	%xmm0, -48(%rbp)
.Ltmp10939:
	.loc	6 2259 9
	movaps	-48(%rbp), %xmm0
	movaps	%xmm0, -80(%rbp)
.Ltmp10940:
	#MEMBARRIER
	.loc	6 2259 9 is_stmt 0
	movq	$0, (%rbx)
.Ltmp10941:
	movq	$0, 8(%rbx)
.Ltmp10942:
	movq	$0, 16(%rbx)
.Ltmp10943:
	movq	$0, 24(%rbx)
.Ltmp10944:
	#MEMBARRIER
	.loc	6 0 9
	movq	%rax, %rdi
	callq	_Unwind_Resume@PLT
.Ltmp10945:
.Lfunc_end55:
	.size	_RNvMs0_NtNtCs4U4sOGKWW3b_12toyos_crypto3ecc4p256NtB5_9SecretKey5agree, .Lfunc_end55-_RNvMs0_NtNtCs4U4sOGKWW3b_12toyos_crypto3ecc4p256NtB5_9SecretKey5agree
	.cfi_endproc
