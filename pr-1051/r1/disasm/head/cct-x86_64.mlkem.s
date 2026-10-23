0000000000030820 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#0}>::{closure#0}>>>::from_iter>:
   30820:      	pushq	%rbp
   30821:      	movq	%rsp, %rbp
   30824:      	pushq	%r15
   30826:      	pushq	%r14
   30828:      	pushq	%r13
   3082a:      	pushq	%r12
   3082c:      	pushq	%rbx
   3082d:      	subq	$0x68, %rsp
   30831:      	movq	%rsi, %r14
   30834:      	movq	%rdi, -0x50(%rbp)
   30838:      	movq	0x10(%rsi), %rsi
   3083c:      	movq	0x18(%r14), %rbx
   30840:      	xorl	%r13d, %r13d
   30843:      	movq	%rbx, %r15
   30846:      	subq	%rsi, %r15
   30849:      	cmovbq	%r13, %r15
   3084d:      	movl	$0xf22, %ecx            # imm = 0xF22
   30852:      	movq	%r15, %rax
   30855:      	mulq	%rcx
   30858:      	movq	%rax, %r12
   3085b:      	jo	0x30939 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#0}>::{closure#0}>>>::from_iter+0x119>
   30861:      	movq	%rsi, -0x30(%rbp)
   30865:      	movl	$0x2, %esi
   3086a:      	movq	%r12, %rdi
   3086d:      	callq	0xbb0f0 <<core::alloc::layout::Layout>::is_size_alignment_valid>
   30872:      	testb	%al, %al
   30874:      	je	0x30936 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#0}>::{closure#0}>>>::from_iter+0x116>
   3087a:      	testq	%r12, %r12
   3087d:      	je	0x308a5 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#0}>::{closure#0}>>>::from_iter+0x85>
   3087f:      	callq	0x495f0 <__rustc::__rust_no_alloc_shim_is_unstable_v2>
   30884:      	movl	$0x2, %r13d
   3088a:      	movl	$0x2, %esi
   3088f:      	movq	%r12, %rdi
   30892:      	callq	0x495b0 <__rustc::__rust_alloc>
   30897:      	testq	%rax, %rax
   3089a:      	movq	-0x30(%rbp), %rdx
   3089e:      	jne	0x308b3 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#0}>::{closure#0}>>>::from_iter+0x93>
   308a0:      	jmp	0x30939 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#0}>::{closure#0}>>>::from_iter+0x119>
   308a5:      	movl	$0x2, %eax
   308aa:      	movq	-0x30(%rbp), %rdx
   308ae:      	cmpq	%rdx, %rbx
   308b1:      	ja	0x3091c <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#0}>::{closure#0}>>>::from_iter+0xfc>
   308b3:      	movq	%r15, -0x48(%rbp)
   308b7:      	movq	%rax, -0x40(%rbp)
   308bb:      	leaq	-0x38(%rbp), %rcx
   308bf:      	movq	$0x0, -0x38(%rbp)
   308c7:      	movups	(%r14), %xmm0
   308cb:      	movaps	%xmm0, -0x90(%rbp)
   308d2:      	movq	%rdx, -0x80(%rbp)
   308d6:      	movq	%rbx, -0x78(%rbp)
   308da:      	movq	%rcx, -0x68(%rbp)
   308de:      	movq	$0x0, -0x60(%rbp)
   308e6:      	movq	%rax, -0x58(%rbp)
   308ea:      	leaq	-0x90(%rbp), %rdi
   308f1:      	leaq	-0x68(%rbp), %rsi
   308f5:      	callq	0x352a0 <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>>
   308fa:      	movq	-0x38(%rbp), %rcx
   308fe:      	movq	-0x50(%rbp), %rax
   30902:      	movq	%rcx, 0x10(%rax)
   30906:      	movups	-0x48(%rbp), %xmm0
   3090a:      	movups	%xmm0, (%rax)
   3090d:      	addq	$0x68, %rsp
   30911:      	popq	%rbx
   30912:      	popq	%r12
   30914:      	popq	%r13
   30916:      	popq	%r14
   30918:      	popq	%r15
   3091a:      	popq	%rbp
   3091b:      	retq
   3091c:      	leaq	-0x2174b(%rip), %rdi    # 0xf1d8 <anon.a8fe1686bdbcefb2af0339a511ab2ed0.3.llvm.8347214850907408321>
   30923:      	leaq	0x9526e(%rip), %rcx     # 0xc5b98 <anon.a8fe1686bdbcefb2af0339a511ab2ed0.2.llvm.8347214850907408321>
   3092a:      	movl	$0x1bb, %esi            # imm = 0x1BB
   3092f:      	xorl	%edx, %edx
   30931:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   30936:      	xorl	%r13d, %r13d
   30939:      	movq	%r13, %rdi
   3093c:      	movq	%r12, %rsi
   3093f:      	callq	0xba112 <alloc::raw_vec::handle_error>
   30944:      	movq	%rax, %rbx
   30947:      	leaq	-0x48(%rbp), %rdi
   3094b:      	callq	0x34900 <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>>
   30950:      	movq	%rbx, %rdi
   30953:      	callq	0xb86a0 <_Unwind_Resume>
   30958:      	callq	0xbdaba <core::panicking::panic_in_cleanup>
   3095d:      	int3
   3095e:      	int3
   3095f:      	int3

0000000000030960 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#3}>::{closure#0}>>>::from_iter>:
   30960:      	pushq	%rbp
   30961:      	movq	%rsp, %rbp
   30964:      	pushq	%r15
   30966:      	pushq	%r14
   30968:      	pushq	%r13
   3096a:      	pushq	%r12
   3096c:      	pushq	%rbx
   3096d:      	subq	$0x68, %rsp
   30971:      	movq	%rsi, %r14
   30974:      	movq	%rdi, -0x50(%rbp)
   30978:      	movq	0x10(%rsi), %rsi
   3097c:      	movq	0x18(%r14), %rbx
   30980:      	xorl	%r13d, %r13d
   30983:      	movq	%rbx, %r15
   30986:      	subq	%rsi, %r15
   30989:      	cmovbq	%r13, %r15
   3098d:      	movl	$0xf22, %ecx            # imm = 0xF22
   30992:      	movq	%r15, %rax
   30995:      	mulq	%rcx
   30998:      	movq	%rax, %r12
   3099b:      	jo	0x30a79 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#3}>::{closure#0}>>>::from_iter+0x119>
   309a1:      	movq	%rsi, -0x30(%rbp)
   309a5:      	movl	$0x2, %esi
   309aa:      	movq	%r12, %rdi
   309ad:      	callq	0xbb0f0 <<core::alloc::layout::Layout>::is_size_alignment_valid>
   309b2:      	testb	%al, %al
   309b4:      	je	0x30a76 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#3}>::{closure#0}>>>::from_iter+0x116>
   309ba:      	testq	%r12, %r12
   309bd:      	je	0x309e5 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#3}>::{closure#0}>>>::from_iter+0x85>
   309bf:      	callq	0x495f0 <__rustc::__rust_no_alloc_shim_is_unstable_v2>
   309c4:      	movl	$0x2, %r13d
   309ca:      	movl	$0x2, %esi
   309cf:      	movq	%r12, %rdi
   309d2:      	callq	0x495b0 <__rustc::__rust_alloc>
   309d7:      	testq	%rax, %rax
   309da:      	movq	-0x30(%rbp), %rdx
   309de:      	jne	0x309f3 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#3}>::{closure#0}>>>::from_iter+0x93>
   309e0:      	jmp	0x30a79 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#3}>::{closure#0}>>>::from_iter+0x119>
   309e5:      	movl	$0x2, %eax
   309ea:      	movq	-0x30(%rbp), %rdx
   309ee:      	cmpq	%rdx, %rbx
   309f1:      	ja	0x30a5c <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#3}>::{closure#0}>>>::from_iter+0xfc>
   309f3:      	movq	%r15, -0x48(%rbp)
   309f7:      	movq	%rax, -0x40(%rbp)
   309fb:      	leaq	-0x38(%rbp), %rcx
   309ff:      	movq	$0x0, -0x38(%rbp)
   30a07:      	movups	(%r14), %xmm0
   30a0b:      	movaps	%xmm0, -0x90(%rbp)
   30a12:      	movq	%rdx, -0x80(%rbp)
   30a16:      	movq	%rbx, -0x78(%rbp)
   30a1a:      	movq	%rcx, -0x68(%rbp)
   30a1e:      	movq	$0x0, -0x60(%rbp)
   30a26:      	movq	%rax, -0x58(%rbp)
   30a2a:      	leaq	-0x90(%rbp), %rdi
   30a31:      	leaq	-0x68(%rbp), %rsi
   30a35:      	callq	0x352a0 <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>>
   30a3a:      	movq	-0x38(%rbp), %rcx
   30a3e:      	movq	-0x50(%rbp), %rax
   30a42:      	movq	%rcx, 0x10(%rax)
   30a46:      	movups	-0x48(%rbp), %xmm0
   30a4a:      	movups	%xmm0, (%rax)
   30a4d:      	addq	$0x68, %rsp
   30a51:      	popq	%rbx
   30a52:      	popq	%r12
   30a54:      	popq	%r13
   30a56:      	popq	%r14
   30a58:      	popq	%r15
   30a5a:      	popq	%rbp
   30a5b:      	retq
   30a5c:      	leaq	-0x2188b(%rip), %rdi    # 0xf1d8 <anon.a8fe1686bdbcefb2af0339a511ab2ed0.3.llvm.8347214850907408321>
   30a63:      	leaq	0x9512e(%rip), %rcx     # 0xc5b98 <anon.a8fe1686bdbcefb2af0339a511ab2ed0.2.llvm.8347214850907408321>
   30a6a:      	movl	$0x1bb, %esi            # imm = 0x1BB
   30a6f:      	xorl	%edx, %edx
   30a71:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   30a76:      	xorl	%r13d, %r13d
   30a79:      	movq	%r13, %rdi
   30a7c:      	movq	%r12, %rsi
   30a7f:      	callq	0xba112 <alloc::raw_vec::handle_error>
   30a84:      	movq	%rax, %rbx
   30a87:      	leaq	-0x48(%rbp), %rdi
   30a8b:      	callq	0x34900 <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>>
   30a90:      	movq	%rbx, %rdi
   30a93:      	callq	0xb86a0 <_Unwind_Resume>
   30a98:      	callq	0xbdaba <core::panicking::panic_in_cleanup>
   30a9d:      	int3
   30a9e:      	int3
   30a9f:      	int3

0000000000030aa0 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>>::from_iter>:
   30aa0:      	pushq	%rbp
   30aa1:      	movq	%rsp, %rbp
   30aa4:      	pushq	%r15
   30aa6:      	pushq	%r14
   30aa8:      	pushq	%r13
   30aaa:      	pushq	%r12
   30aac:      	pushq	%rbx
   30aad:      	subq	$0x68, %rsp
   30ab1:      	movq	%rsi, %r14
   30ab4:      	movq	%rdi, -0x50(%rbp)
   30ab8:      	movq	0x10(%rsi), %rsi
   30abc:      	movq	0x18(%r14), %rbx
   30ac0:      	xorl	%r13d, %r13d
   30ac3:      	movq	%rbx, %r15
   30ac6:      	subq	%rsi, %r15
   30ac9:      	cmovbq	%r13, %r15
   30acd:      	movl	$0xf22, %ecx            # imm = 0xF22
   30ad2:      	movq	%r15, %rax
   30ad5:      	mulq	%rcx
   30ad8:      	movq	%rax, %r12
   30adb:      	jo	0x30bb9 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>>::from_iter+0x119>
   30ae1:      	movq	%rsi, -0x30(%rbp)
   30ae5:      	movl	$0x2, %esi
   30aea:      	movq	%r12, %rdi
   30aed:      	callq	0xbb0f0 <<core::alloc::layout::Layout>::is_size_alignment_valid>
   30af2:      	testb	%al, %al
   30af4:      	je	0x30bb6 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>>::from_iter+0x116>
   30afa:      	testq	%r12, %r12
   30afd:      	je	0x30b25 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>>::from_iter+0x85>
   30aff:      	callq	0x495f0 <__rustc::__rust_no_alloc_shim_is_unstable_v2>
   30b04:      	movl	$0x2, %r13d
   30b0a:      	movl	$0x2, %esi
   30b0f:      	movq	%r12, %rdi
   30b12:      	callq	0x495b0 <__rustc::__rust_alloc>
   30b17:      	testq	%rax, %rax
   30b1a:      	movq	-0x30(%rbp), %rdx
   30b1e:      	jne	0x30b33 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>>::from_iter+0x93>
   30b20:      	jmp	0x30bb9 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>>::from_iter+0x119>
   30b25:      	movl	$0x2, %eax
   30b2a:      	movq	-0x30(%rbp), %rdx
   30b2e:      	cmpq	%rdx, %rbx
   30b31:      	ja	0x30b9c <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>>::from_iter+0xfc>
   30b33:      	movq	%r15, -0x48(%rbp)
   30b37:      	movq	%rax, -0x40(%rbp)
   30b3b:      	leaq	-0x38(%rbp), %rcx
   30b3f:      	movq	$0x0, -0x38(%rbp)
   30b47:      	movups	(%r14), %xmm0
   30b4b:      	movaps	%xmm0, -0x90(%rbp)
   30b52:      	movq	%rdx, -0x80(%rbp)
   30b56:      	movq	%rbx, -0x78(%rbp)
   30b5a:      	movq	%rcx, -0x68(%rbp)
   30b5e:      	movq	$0x0, -0x60(%rbp)
   30b66:      	movq	%rax, -0x58(%rbp)
   30b6a:      	leaq	-0x90(%rbp), %rdi
   30b71:      	leaq	-0x68(%rbp), %rsi
   30b75:      	callq	0x352a0 <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>>
   30b7a:      	movq	-0x38(%rbp), %rcx
   30b7e:      	movq	-0x50(%rbp), %rax
   30b82:      	movq	%rcx, 0x10(%rax)
   30b86:      	movups	-0x48(%rbp), %xmm0
   30b8a:      	movups	%xmm0, (%rax)
   30b8d:      	addq	$0x68, %rsp
   30b91:      	popq	%rbx
   30b92:      	popq	%r12
   30b94:      	popq	%r13
   30b96:      	popq	%r14
   30b98:      	popq	%r15
   30b9a:      	popq	%rbp
   30b9b:      	retq
   30b9c:      	leaq	-0x219cb(%rip), %rdi    # 0xf1d8 <anon.a8fe1686bdbcefb2af0339a511ab2ed0.3.llvm.8347214850907408321>
   30ba3:      	leaq	0x94fee(%rip), %rcx     # 0xc5b98 <anon.a8fe1686bdbcefb2af0339a511ab2ed0.2.llvm.8347214850907408321>
   30baa:      	movl	$0x1bb, %esi            # imm = 0x1BB
   30baf:      	xorl	%edx, %edx
   30bb1:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   30bb6:      	xorl	%r13d, %r13d
   30bb9:      	movq	%r13, %rdi
   30bbc:      	movq	%r12, %rsi
   30bbf:      	callq	0xba112 <alloc::raw_vec::handle_error>
   30bc4:      	movq	%rax, %rbx
   30bc7:      	leaq	-0x48(%rbp), %rdi
   30bcb:      	callq	0x34900 <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>>
   30bd0:      	movq	%rbx, %rdi
   30bd3:      	callq	0xb86a0 <_Unwind_Resume>
   30bd8:      	callq	0xbdaba <core::panicking::panic_in_cleanup>
   30bdd:      	int3
   30bde:      	int3
   30bdf:      	int3

0000000000030be0 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter>:
   30be0:      	pushq	%rbp
   30be1:      	movq	%rsp, %rbp
   30be4:      	pushq	%r15
   30be6:      	pushq	%r14
   30be8:      	pushq	%r13
   30bea:      	pushq	%r12
   30bec:      	pushq	%rbx
   30bed:      	subq	$0x28, %rsp
   30bf1:      	movq	0x8(%rsi), %rbx
   30bf5:      	movq	%rsi, -0x30(%rbp)
   30bf9:      	movq	0x10(%rsi), %r15
   30bfd:      	xorl	%ecx, %ecx
   30bff:      	movq	%r15, %r13
   30c02:      	subq	%rbx, %r13
   30c05:      	cmovbq	%rcx, %r13
   30c09:      	movq	%rdi, -0x38(%rbp)
   30c0d:      	leaq	(,%r13,8), %r12
   30c15:      	movq	%r13, %rax
   30c18:      	shrq	$0x3d, %rax
   30c1c:      	jne	0x30da9 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x1c9>
   30c22:      	movl	$0x8, %esi
   30c27:      	movq	%r12, %rdi
   30c2a:      	callq	0xbb0f0 <<core::alloc::layout::Layout>::is_size_alignment_valid>
   30c2f:      	testb	%al, %al
   30c31:      	je	0x30da7 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x1c7>
   30c37:      	testq	%r12, %r12
   30c3a:      	je	0x30c61 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x81>
   30c3c:      	callq	0x495f0 <__rustc::__rust_no_alloc_shim_is_unstable_v2>
   30c41:      	movl	$0x8, %esi
   30c46:      	movq	%r12, %rdi
   30c49:      	callq	0x495b0 <__rustc::__rust_alloc>
   30c4e:      	movl	$0x8, %ecx
   30c53:      	testq	%rax, %rax
   30c56:      	je	0x30da9 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x1c9>
   30c5c:      	movq	%rax, %r14
   30c5f:      	jmp	0x30c70 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x90>
   30c61:      	movl	$0x8, %r14d
   30c67:      	cmpq	%rbx, %r15
   30c6a:      	ja	0x30d7f <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x19f>
   30c70:      	movq	%r13, -0x50(%rbp)
   30c74:      	movq	%r14, -0x48(%rbp)
   30c78:      	subq	%rbx, %r15
   30c7b:      	jbe	0x30d5a <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x17a>
   30c81:      	movq	-0x30(%rbp), %rax
   30c85:      	movq	(%rax), %r13
   30c88:      	incq	%rbx
   30c8b:      	xorl	%r12d, %r12d
   30c8e:      	nop
   30c90:      	leaq	(%rbx,%r12), %rax
   30c94:      	movq	%rax, %xmm1
   30c99:      	punpckldq	-0x220e1(%rip), %xmm1 # xmm1 = xmm1[0],mem[0],xmm1[1],mem[1]
                                                # 0xebc0 <anon.eb4e9983f1dde2da9251237d0548192c.1.llvm.16376435883611519421+0x600>
   30ca1:      	subpd	-0x22209(%rip), %xmm1   # 0xeaa0 <anon.eb4e9983f1dde2da9251237d0548192c.1.llvm.16376435883611519421+0x4e0>
   30ca9:      	movapd	%xmm1, %xmm0
   30cad:      	unpckhpd	%xmm1, %xmm0            # xmm0 = xmm0[1],xmm1[1]
   30cb1:      	addsd	%xmm1, %xmm0
   30cb5:      	mulsd	-0x21b75(%rip), %xmm0   # 0xf148 <anon.38808e0998af18ea2dab9aba4957194f.8.llvm.12287912318127236922>
   30cbd:      	divsd	-0x21be5(%rip), %xmm0   # 0xf0e0 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x4a0>
   30cc5:      	callq	0xc4260 <exp2>
   30cca:      	movsd	-0x21bb2(%rip), %xmm1   # 0xf120 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x4e0>
   30cd2:      	subsd	%xmm0, %xmm1
   30cd6:      	mulsd	-0x21bb6(%rip), %xmm1   # 0xf128 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x4e8>
   30cde:      	movapd	%xmm1, %xmm0
   30ce2:      	subsd	-0x21bba(%rip), %xmm0   # 0xf130 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x4f0>
   30cea:      	xorpd	%xmm2, %xmm2
   30cee:      	ucomisd	%xmm2, %xmm1
   30cf2:      	jb	0x30d10 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x130>
   30cf4:      	cvttsd2si	%xmm1, %rcx
   30cf9:      	movq	%rcx, %rdx
   30cfc:      	sarq	$0x3f, %rdx
   30d00:      	cvttsd2si	%xmm0, %rax
   30d05:      	andq	%rdx, %rax
   30d08:      	orq	%rcx, %rax
   30d0b:      	jmp	0x30d12 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x132>
   30d0d:      	nopl	(%rax)
   30d10:      	xorl	%eax, %eax
   30d12:      	ucomisd	-0x21c52(%rip), %xmm1   # 0xf0c8 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x488>
   30d1a:      	movq	$-0x1, %rdi
   30d21:      	ja	0x30d26 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x146>
   30d23:      	movq	%rax, %rdi
   30d26:      	cmpq	$0x270f, %rdi           # imm = 0x270F
   30d2d:      	jb	0x30d34 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x154>
   30d2f:      	movl	$0x270f, %edi           # imm = 0x270F
   30d34:      	movq	0x10(%r13), %rsi
   30d38:      	cmpq	%rsi, %rdi
   30d3b:      	jae	0x30d99 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x1b9>
   30d3d:      	movq	0x8(%r13), %rax
   30d41:      	movsd	(%rax,%rdi,8), %xmm0
   30d46:      	movsd	%xmm0, (%r14,%r12,8)
   30d4c:      	incq	%r12
   30d4f:      	cmpq	%r12, %r15
   30d52:      	jne	0x30c90 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0xb0>
   30d58:      	jmp	0x30d5d <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x17d>
   30d5a:      	xorl	%r12d, %r12d
   30d5d:      	movq	%r12, -0x40(%rbp)
   30d61:      	movq	-0x38(%rbp), %rax
   30d65:      	movq	%r12, 0x10(%rax)
   30d69:      	movups	-0x50(%rbp), %xmm0
   30d6d:      	movups	%xmm0, (%rax)
   30d70:      	addq	$0x28, %rsp
   30d74:      	popq	%rbx
   30d75:      	popq	%r12
   30d77:      	popq	%r13
   30d79:      	popq	%r14
   30d7b:      	popq	%r15
   30d7d:      	popq	%rbp
   30d7e:      	retq
   30d7f:      	leaq	-0x21bae(%rip), %rdi    # 0xf1d8 <anon.a8fe1686bdbcefb2af0339a511ab2ed0.3.llvm.8347214850907408321>
   30d86:      	leaq	0x94e0b(%rip), %rcx     # 0xc5b98 <anon.a8fe1686bdbcefb2af0339a511ab2ed0.2.llvm.8347214850907408321>
   30d8d:      	movl	$0x1bb, %esi            # imm = 0x1BB
   30d92:      	xorl	%edx, %edx
   30d94:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   30d99:      	leaq	0x94fb0(%rip), %rdx     # 0xc5d50 <anon.b0fa440d1b3fd0947bcb9be5aef6393f.1.llvm.16697874475220157172>
   30da0:      	callq	0xbdacd <core::panicking::panic_bounds_check>
   30da5:      	ud2
   30da7:      	xorl	%ecx, %ecx
   30da9:      	movq	%rcx, %rdi
   30dac:      	movq	%r12, %rsi
   30daf:      	callq	0xba112 <alloc::raw_vec::handle_error>
   30db4:      	movq	%rax, %rbx
   30db7:      	movq	%r12, -0x40(%rbp)
   30dbb:      	leaq	-0x50(%rbp), %rdi
   30dbf:      	movl	$0x8, %esi
   30dc4:      	movl	$0x8, %edx
   30dc9:      	callq	0x35c00 <<alloc::raw_vec::RawVecInner>::deallocate>
   30dce:      	movq	%rbx, %rdi
   30dd1:      	callq	0xb86a0 <_Unwind_Resume>
   30dd6:      	int3
   30dd7:      	int3
   30dd8:      	int3
   30dd9:      	int3
   30dda:      	int3
   30ddb:      	int3
   30ddc:      	int3
   30ddd:      	int3
   30dde:      	int3
   30ddf:      	int3

0000000000030de0 <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<crypto_constant_time::Given>>:
   30de0:      	pushq	%rbp
   30de1:      	movq	%rsp, %rbp
   30de4:      	pushq	%r15
   30de6:      	pushq	%r14
   30de8:      	pushq	%r12
   30dea:      	pushq	%rbx
   30deb:      	subq	$0x930, %rsp            # imm = 0x930
   30df2:      	xorps	%xmm0, %xmm0
   30df5:      	movaps	%xmm0, -0x30(%rbp)
   30df9:      	movaps	%xmm0, -0x40(%rbp)
   30dfd:      	movq	0x8(%rdx), %rax
   30e01:      	cmpq	$0x1f, %rax
   30e05:      	jbe	0x30fd2 <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<crypto_constant_time::Given>+0x1f2>
   30e0b:      	movq	%rsi, %r14
   30e0e:      	movq	%rdi, %rbx
   30e11:      	movq	(%rdx), %rcx
   30e14:      	leaq	-0x40(%rbp), %r12
   30e18:      	movq	%rcx, %rsi
   30e1b:      	subq	%r12, %rsi
   30e1e:      	movq	%r12, %rdi
   30e21:      	subq	%rcx, %rdi
   30e24:      	cmovbq	%rsi, %rdi
   30e28:      	cmpq	$0x1f, %rdi
   30e2c:      	jbe	0x30fec <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<crypto_constant_time::Given>+0x20c>
   30e32:      	addq	$-0x20, %rax
   30e36:      	movq	%rcx, %rsi
   30e39:      	addq	$0x20, %rsi
   30e3d:      	movups	(%rcx), %xmm0
   30e40:      	movups	0x10(%rcx), %xmm1
   30e44:      	movaps	%xmm1, -0x30(%rbp)
   30e48:      	movaps	%xmm0, -0x40(%rbp)
   30e4c:      	movq	%rsi, (%rdx)
   30e4f:      	movq	%rax, 0x8(%rdx)
   30e53:      	movq	%r14, -0x510(%rbp)
   30e5a:      	movq	$0x4a0, -0x508(%rbp)    # imm = 0x4A0
   30e65:      	leaq	-0xb0(%rbp), %r15
   30e6c:      	leaq	-0x510(%rbp), %rsi
   30e73:      	movl	$0x1, %edx
   30e78:      	movq	%r15, %rdi
   30e7b:      	callq	0x49dd0 <toyos_crypto::keccak::h>
   30e80:      	movq	%r12, -0x950(%rbp)
   30e87:      	movq	$0x20, -0x948(%rbp)
   30e92:      	movq	%r15, -0x940(%rbp)
   30e99:      	movq	$0x20, -0x938(%rbp)
   30ea4:      	leaq	-0x510(%rbp), %rdi
   30eab:      	leaq	-0x950(%rbp), %rsi
   30eb2:      	movl	$0x2, %edx
   30eb7:      	callq	0x49c20 <toyos_crypto::keccak::g>
   30ebc:      	movups	-0x510(%rbp), %xmm0
   30ec3:      	movups	-0x500(%rbp), %xmm1
   30eca:      	movups	-0x4f0(%rbp), %xmm2
   30ed1:      	movups	-0x4e0(%rbp), %xmm3
   30ed8:      	movaps	%xmm3, -0x60(%rbp)
   30edc:      	movaps	%xmm2, -0x70(%rbp)
   30ee0:      	movaps	%xmm1, -0x80(%rbp)
   30ee4:      	movaps	%xmm0, -0x90(%rbp)
   30eeb:      	leaq	-0x70(%rbp), %r15
   30eef:      	leaq	-0x950(%rbp), %rdi
   30ef6:      	leaq	-0x40(%rbp), %rdx
   30efa:      	movq	%r14, %rsi
   30efd:      	movq	%r15, %rcx
   30f00:      	callq	0x54bc0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>
   30f05:      	movaps	-0x90(%rbp), %xmm0
   30f0c:      	movaps	-0x80(%rbp), %xmm1
   30f10:      	movups	%xmm1, -0xc0(%rbp)
   30f17:      	movups	%xmm0, -0xd0(%rbp)
   30f1e:      	leaq	-0x510(%rbp), %r14
   30f25:      	leaq	-0x950(%rbp), %rsi
   30f2c:      	movl	$0x440, %edx            # imm = 0x440
   30f31:      	movq	%r14, %rdi
   30f34:      	callq	0xc4250 <memcpy>
   30f39:      	leaq	0x1(%rbx), %rdi
   30f3d:      	movl	$0x460, %edx            # imm = 0x460
   30f42:      	movq	%r14, %rsi
   30f45:      	callq	0xc4250 <memcpy>
   30f4a:      	movb	$0x0, (%rbx)
   30f4d:      	xorps	%xmm0, %xmm0
   30f50:      	movaps	%xmm0, -0x510(%rbp)
   30f57:      	movaps	-0x510(%rbp), %xmm1
   30f5e:      	movaps	%xmm1, -0x90(%rbp)
   30f65:      	movaps	%xmm0, -0x510(%rbp)
   30f6c:      	movaps	-0x510(%rbp), %xmm1
   30f73:      	movaps	%xmm1, -0x80(%rbp)
   30f77:      	movaps	%xmm0, -0x510(%rbp)
   30f7e:      	movaps	-0x510(%rbp), %xmm1
   30f85:      	movups	%xmm1, (%r15)
   30f89:      	movaps	%xmm0, -0x510(%rbp)
   30f90:      	movaps	-0x510(%rbp), %xmm1
   30f97:      	movaps	%xmm1, -0x60(%rbp)
   30f9b:      	movaps	%xmm0, -0x510(%rbp)
   30fa2:      	movaps	-0x510(%rbp), %xmm1
   30fa9:      	movaps	%xmm1, -0x40(%rbp)
   30fad:      	movaps	%xmm0, -0x510(%rbp)
   30fb4:      	movaps	-0x510(%rbp), %xmm0
   30fbb:      	movaps	%xmm0, -0x30(%rbp)
   30fbf:      	movq	%rbx, %rax
   30fc2:      	addq	$0x930, %rsp            # imm = 0x930
   30fc9:      	popq	%rbx
   30fca:      	popq	%r12
   30fcc:      	popq	%r14
   30fce:      	popq	%r15
   30fd0:      	popq	%rbp
   30fd1:      	retq
   30fd2:      	leaq	-0x2173c(%rip), %rdi    # 0xf89d <anon.762811cd0282735118b17318538b4fa7.28.llvm.8100539084681502838>
   30fd9:      	leaq	0x94ce0(%rip), %rdx     # 0xc5cc0 <anon.762811cd0282735118b17318538b4fa7.35.llvm.8100539084681502838>
   30fe0:      	movl	$0x13, %esi
   30fe5:      	callq	0xbdc90 <core::panicking::panic_fmt>
   30fea:      	ud2
   30fec:      	leaq	-0x2165f(%rip), %rdi    # 0xf994 <anon.0c060ffce792bb80b9805c9943ef2ace.2.llvm.16006066140378012905>
   30ff3:      	leaq	0x94cde(%rip), %rcx     # 0xc5cd8 <anon.0c060ffce792bb80b9805c9943ef2ace.1.llvm.16006066140378012905>
   30ffa:      	movl	$0x237, %esi            # imm = 0x237
   30fff:      	xorl	%edx, %edx
   31001:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   31006:      	xorps	%xmm0, %xmm0
   31009:      	movaps	%xmm0, -0x510(%rbp)
   31010:      	movaps	-0x510(%rbp), %xmm1
   31017:      	movaps	%xmm1, -0x90(%rbp)
   3101e:      	movaps	%xmm0, -0x510(%rbp)
   31025:      	movaps	-0x510(%rbp), %xmm1
   3102c:      	movaps	%xmm1, -0x80(%rbp)
   31030:      	movaps	%xmm0, -0x510(%rbp)
   31037:      	movaps	-0x510(%rbp), %xmm1
   3103e:      	movups	%xmm1, (%r15)
   31042:      	movaps	%xmm0, -0x510(%rbp)
   31049:      	movaps	-0x510(%rbp), %xmm0
   31050:      	movaps	%xmm0, -0x60(%rbp)
   31054:      	jmp	0x31056 <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<crypto_constant_time::Given>+0x276>
   31056:      	xorps	%xmm0, %xmm0
   31059:      	movaps	%xmm0, -0x50(%rbp)
   3105d:      	movaps	-0x50(%rbp), %xmm1
   31061:      	movaps	%xmm1, -0x40(%rbp)
   31065:      	movaps	%xmm0, -0x50(%rbp)
   31069:      	movaps	-0x50(%rbp), %xmm0
   3106d:      	movaps	%xmm0, -0x30(%rbp)
   31071:      	movq	%rax, %rdi
   31074:      	callq	0xb86a0 <_Unwind_Resume>
   31079:      	int3
   3107a:      	int3
   3107b:      	int3
   3107c:      	int3
   3107d:      	int3
   3107e:      	int3
   3107f:      	int3

0000000000031080 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>>:
   31080:      	pushq	%rbp
   31081:      	movq	%rsp, %rbp
   31084:      	pushq	%r15
   31086:      	pushq	%r14
   31088:      	pushq	%r13
   3108a:      	pushq	%r12
   3108c:      	pushq	%rbx
   3108d:      	subq	$0x1000, %rsp           # imm = 0x1000
   31094:      	movq	$0x0, (%rsp)
   3109c:      	subq	$0x1000, %rsp           # imm = 0x1000
   310a3:      	movq	$0x0, (%rsp)
   310ab:      	subq	$0x258, %rsp            # imm = 0x258
   310b2:      	xorps	%xmm0, %xmm0
   310b5:      	movaps	%xmm0, -0xb0(%rbp)
   310bc:      	movaps	%xmm0, -0xc0(%rbp)
   310c3:      	movaps	%xmm0, -0xd0(%rbp)
   310ca:      	movaps	%xmm0, -0xe0(%rbp)
   310d1:      	movq	0x8(%rsi), %rax
   310d5:      	cmpq	$0x3f, %rax
   310d9:      	jbe	0x3191d <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x89d>
   310df:      	movq	%rdi, %r14
   310e2:      	movq	(%rsi), %rdx
   310e5:      	leaq	-0xe0(%rbp), %rcx
   310ec:      	movq	%rdx, %rdi
   310ef:      	subq	%rcx, %rdi
   310f2:      	movq	%rcx, %r8
   310f5:      	subq	%rdx, %r8
   310f8:      	cmovbq	%rdi, %r8
   310fc:      	cmpq	$0x3f, %r8
   31100:      	jbe	0x318e9 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x869>
   31106:      	addq	$-0x40, %rax
   3110a:      	movq	%rdx, %rdi
   3110d:      	addq	$0x40, %rdi
   31111:      	movups	(%rdx), %xmm0
   31114:      	movups	0x10(%rdx), %xmm1
   31118:      	movups	0x20(%rdx), %xmm2
   3111c:      	movups	0x30(%rdx), %xmm3
   31120:      	movaps	%xmm3, -0xb0(%rbp)
   31127:      	movaps	%xmm2, -0xc0(%rbp)
   3112e:      	movaps	%xmm1, -0xd0(%rbp)
   31135:      	movaps	%xmm0, -0xe0(%rbp)
   3113c:      	movq	%rdi, (%rsi)
   3113f:      	movq	%rax, 0x8(%rsi)
   31143:      	movq	%rcx, -0x15e0(%rbp)
   3114a:      	movq	$0x20, -0x15d8(%rbp)
   31155:      	leaq	-0x21ea7(%rip), %rax    # 0xf2b5 <anon.a8fe1686bdbcefb2af0339a511ab2ed0.3.llvm.8347214850907408321+0xdd>
   3115c:      	movq	%rax, -0x15d0(%rbp)
   31163:      	movq	$0x1, -0x15c8(%rbp)
   3116e:      	leaq	-0xde0(%rbp), %rbx
   31175:      	leaq	-0x15e0(%rbp), %rsi
   3117c:      	movl	$0x2, %edx
   31181:      	movq	%rbx, %rdi
   31184:      	callq	0x49c20 <toyos_crypto::keccak::g>
   31189:      	movq	%r14, -0xe8(%rbp)
   31190:      	movups	-0xde0(%rbp), %xmm0
   31197:      	movups	-0xdd0(%rbp), %xmm1
   3119e:      	movups	-0xdc0(%rbp), %xmm2
   311a5:      	movups	-0xdb0(%rbp), %xmm3
   311ac:      	movaps	%xmm3, -0x70(%rbp)
   311b0:      	movaps	%xmm2, -0x80(%rbp)
   311b4:      	movaps	%xmm1, -0x90(%rbp)
   311bb:      	movaps	%xmm0, -0xa0(%rbp)
   311c2:      	leaq	-0x80(%rbp), %rsi
   311c6:      	movq	%rbx, -0x300(%rbp)
   311cd:      	movq	$0x3, -0x2f8(%rbp)
   311d8:      	xorl	%r14d, %r14d
   311db:      	leaq	-0x15e0(%rbp), %rdi
   311e2:      	xorl	%edx, %edx
   311e4:      	callq	0x58240 <toyos_crypto::mlkem::noise>
   311e9:      	xorl	%r14d, %r14d
   311ec:      	leaq	-0x1c80(%rbp), %rdi
   311f3:      	leaq	-0x15e0(%rbp), %rsi
   311fa:      	callq	0x576b0 <<toyos_crypto::mlkem::Poly>::ntt>
   311ff:      	leaq	-0x17e0(%rbp), %rbx
   31206:      	leaq	-0x1c80(%rbp), %rsi
   3120d:      	movl	$0x200, %edx            # imm = 0x200
   31212:      	movq	%rbx, %rdi
   31215:      	callq	0xc4250 <memcpy>
   3121a:      	leaq	-0xfe0(%rbp), %r14
   31221:      	movl	$0x200, %edx            # imm = 0x200
   31226:      	movq	%r14, %rdi
   31229:      	movq	%rbx, %rsi
   3122c:      	callq	0xc4250 <memcpy>
   31231:      	leaq	-0x2280(%rbp), %rbx
   31238:      	movl	$0x200, %edx            # imm = 0x200
   3123d:      	movq	%rbx, %rdi
   31240:      	movq	%r14, %rsi
   31243:      	callq	0xc4250 <memcpy>
   31248:      	leaq	-0xde0(%rbp), %rdi
   3124f:      	movl	$0x200, %edx            # imm = 0x200
   31254:      	movq	%rbx, %rsi
   31257:      	callq	0xc4250 <memcpy>
   3125c:      	movl	$0x1, %r14d
   31262:      	leaq	-0x15e0(%rbp), %rdi
   31269:      	leaq	-0x80(%rbp), %rsi
   3126d:      	movl	$0x1, %edx
   31272:      	callq	0x58240 <toyos_crypto::mlkem::noise>
   31277:      	leaq	-0x1c80(%rbp), %rdi
   3127e:      	leaq	-0x15e0(%rbp), %rsi
   31285:      	callq	0x576b0 <<toyos_crypto::mlkem::Poly>::ntt>
   3128a:      	leaq	-0x17e0(%rbp), %rbx
   31291:      	leaq	-0x1c80(%rbp), %rsi
   31298:      	movl	$0x200, %edx            # imm = 0x200
   3129d:      	movq	%rbx, %rdi
   312a0:      	callq	0xc4250 <memcpy>
   312a5:      	leaq	-0xfe0(%rbp), %r14
   312ac:      	movl	$0x200, %edx            # imm = 0x200
   312b1:      	movq	%r14, %rdi
   312b4:      	movq	%rbx, %rsi
   312b7:      	callq	0xc4250 <memcpy>
   312bc:      	leaq	-0x2280(%rbp), %rbx
   312c3:      	movl	$0x200, %edx            # imm = 0x200
   312c8:      	movq	%rbx, %rdi
   312cb:      	movq	%r14, %rsi
   312ce:      	callq	0xc4250 <memcpy>
   312d3:      	leaq	-0xbe0(%rbp), %rdi
   312da:      	movl	$0x200, %edx            # imm = 0x200
   312df:      	movq	%rbx, %rsi
   312e2:      	callq	0xc4250 <memcpy>
   312e7:      	movl	$0x2, %r14d
   312ed:      	leaq	-0x15e0(%rbp), %rdi
   312f4:      	leaq	-0x80(%rbp), %rsi
   312f8:      	movl	$0x2, %edx
   312fd:      	callq	0x58240 <toyos_crypto::mlkem::noise>
   31302:      	leaq	-0x1c80(%rbp), %rdi
   31309:      	leaq	-0x15e0(%rbp), %rsi
   31310:      	callq	0x576b0 <<toyos_crypto::mlkem::Poly>::ntt>
   31315:      	leaq	-0x17e0(%rbp), %r15
   3131c:      	leaq	-0x1c80(%rbp), %r14
   31323:      	movl	$0x200, %edx            # imm = 0x200
   31328:      	movq	%r15, %rdi
   3132b:      	movq	%r14, %rsi
   3132e:      	callq	0xc4250 <memcpy>
   31333:      	leaq	-0xfe0(%rbp), %r12
   3133a:      	movl	$0x200, %edx            # imm = 0x200
   3133f:      	movq	%r12, %rdi
   31342:      	movq	%r15, %rsi
   31345:      	callq	0xc4250 <memcpy>
   3134a:      	movl	$0x200, %edx            # imm = 0x200
   3134f:      	movq	%rbx, %rdi
   31352:      	movq	%r12, %rsi
   31355:      	callq	0xc4250 <memcpy>
   3135a:      	leaq	-0x9e0(%rbp), %rdi
   31361:      	movl	$0x200, %edx            # imm = 0x200
   31366:      	movq	%rbx, %rsi
   31369:      	callq	0xc4250 <memcpy>
   3136e:      	leaq	-0x2280(%rbp), %rdi
   31375:      	movl	$0x600, %edx            # imm = 0x600
   3137a:      	leaq	-0xde0(%rbp), %rbx
   31381:      	movq	%rbx, %rsi
   31384:      	callq	0xc4250 <memcpy>
   31389:      	xorl	%r13d, %r13d
   3138c:      	movl	$0x4a0, %edx            # imm = 0x4A0
   31391:      	movq	%r14, %rdi
   31394:      	xorl	%esi, %esi
   31396:      	callq	0xc49a0 <memset>
   3139b:      	movq	%rbx, %rax
   3139e:      	subq	%r14, %rax
   313a1:      	movq	%rax, -0x50(%rbp)
   313a5:      	movq	%r14, -0x58(%rbp)
   313a9:      	subq	%rbx, %r14
   313ac:      	movq	%r14, -0x48(%rbp)
   313b0:      	leaq	-0xa0(%rbp), %rsi
   313b7:      	jmp	0x313f3 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x373>
   313b9:      	nopl	(%rax)
   313c0:      	addq	$0x180, -0x58(%rbp)     # imm = 0x180
   313c8:      	addq	$-0x180, -0x50(%rbp)    # imm = 0xFE80
   313d0:      	addq	$0x180, -0x48(%rbp)     # imm = 0x180
   313d8:      	movq	%rbx, %r13
   313db:      	cmpq	$0x3, %rbx
   313df:      	leaq	-0x17e0(%rbp), %r15
   313e6:      	leaq	-0xa0(%rbp), %rsi
   313ed:      	je	0x3173e <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x6be>
   313f3:      	leaq	-0xde0(%rbp), %rax
   313fa:      	movq	%rax, -0x100(%rbp)
   31401:      	movq	$0x3, -0xf8(%rbp)
   3140c:      	xorl	%r12d, %r12d
   3140f:      	movq	%r15, %rdi
   31412:      	movq	%r13, %rdx
   31415:      	xorl	%ecx, %ecx
   31417:      	callq	0x58660 <toyos_crypto::mlkem::sample>
   3141c:      	leaq	-0x15e0(%rbp), %rbx
   31423:      	movl	$0x200, %edx            # imm = 0x200
   31428:      	leaq	-0xfe0(%rbp), %r12
   3142f:      	movq	%r12, %rdi
   31432:      	movq	%r15, %rsi
   31435:      	callq	0xc4250 <memcpy>
   3143a:      	movl	$0x200, %edx            # imm = 0x200
   3143f:      	movq	%r15, %r14
   31442:      	leaq	-0x300(%rbp), %r15
   31449:      	movq	%r15, %rdi
   3144c:      	movq	%r12, %rsi
   3144f:      	callq	0xc4250 <memcpy>
   31454:      	movl	$0x200, %edx            # imm = 0x200
   31459:      	movq	%rbx, %rdi
   3145c:      	movq	%r15, %rsi
   3145f:      	movq	%r14, %r15
   31462:      	callq	0xc4250 <memcpy>
   31467:      	movl	$0x200, %edx            # imm = 0x200
   3146c:      	leaq	-0xde0(%rbp), %rdi
   31473:      	movq	%rbx, %rsi
   31476:      	callq	0xc4250 <memcpy>
   3147b:      	movl	$0x1, %r12d
   31481:      	movl	$0x1, %ecx
   31486:      	movq	%r14, %rdi
   31489:      	leaq	-0xa0(%rbp), %rsi
   31490:      	movq	%r13, %rdx
   31493:      	callq	0x58660 <toyos_crypto::mlkem::sample>
   31498:      	movl	$0x200, %edx            # imm = 0x200
   3149d:      	leaq	-0xfe0(%rbp), %r12
   314a4:      	movq	%r12, %rdi
   314a7:      	movq	%r15, %rsi
   314aa:      	callq	0xc4250 <memcpy>
   314af:      	movl	$0x200, %edx            # imm = 0x200
   314b4:      	leaq	-0x300(%rbp), %r15
   314bb:      	movq	%r15, %rdi
   314be:      	movq	%r12, %rsi
   314c1:      	callq	0xc4250 <memcpy>
   314c6:      	movl	$0x200, %edx            # imm = 0x200
   314cb:      	movq	%rbx, %rdi
   314ce:      	movq	%r15, %rsi
   314d1:      	movq	%r14, %r15
   314d4:      	callq	0xc4250 <memcpy>
   314d9:      	movl	$0x200, %edx            # imm = 0x200
   314de:      	leaq	-0xbe0(%rbp), %rdi
   314e5:      	movq	%rbx, %rsi
   314e8:      	callq	0xc4250 <memcpy>
   314ed:      	movl	$0x2, %r12d
   314f3:      	movl	$0x2, %ecx
   314f8:      	movq	%r14, %rdi
   314fb:      	leaq	-0xa0(%rbp), %rsi
   31502:      	movq	%r13, %rdx
   31505:      	callq	0x58660 <toyos_crypto::mlkem::sample>
   3150a:      	movl	$0x200, %edx            # imm = 0x200
   3150f:      	leaq	-0xfe0(%rbp), %r12
   31516:      	movq	%r12, %rdi
   31519:      	movq	%r15, %rsi
   3151c:      	callq	0xc4250 <memcpy>
   31521:      	movl	$0x200, %edx            # imm = 0x200
   31526:      	leaq	-0x300(%rbp), %r14
   3152d:      	movq	%r14, %rdi
   31530:      	movq	%r12, %rsi
   31533:      	callq	0xc4250 <memcpy>
   31538:      	movl	$0x200, %edx            # imm = 0x200
   3153d:      	movq	%rbx, %rdi
   31540:      	movq	%r14, %rsi
   31543:      	callq	0xc4250 <memcpy>
   31548:      	movl	$0x200, %edx            # imm = 0x200
   3154d:      	leaq	-0x9e0(%rbp), %rdi
   31554:      	movq	%rbx, %rsi
   31557:      	callq	0xc4250 <memcpy>
   3155c:      	movl	$0x600, %edx            # imm = 0x600
   31561:      	movq	%rbx, %rdi
   31564:      	leaq	-0xde0(%rbp), %r14
   3156b:      	movq	%r14, %rsi
   3156e:      	callq	0xc4250 <memcpy>
   31573:      	movq	%r14, %rdi
   31576:      	movq	%rbx, %rsi
   31579:      	leaq	-0x2280(%rbp), %rdx
   31580:      	callq	0x57f30 <toyos_crypto::mlkem::dot>
   31585:      	movq	%r12, %rdi
   31588:      	movq	%r14, %rsi
   3158b:      	movl	$0x549, %edx            # imm = 0x549
   31590:      	callq	0x57a20 <<toyos_crypto::mlkem::Poly>::scale>
   31595:      	leal	0x3(%r13), %eax
   31599:      	movzbl	%al, %edx
   3159c:      	movq	%r14, %rdi
   3159f:      	leaq	-0x80(%rbp), %rsi
   315a3:      	callq	0x58240 <toyos_crypto::mlkem::noise>
   315a8:      	movq	%r15, %rdi
   315ab:      	movq	%r14, %rsi
   315ae:      	callq	0x576b0 <<toyos_crypto::mlkem::Poly>::ntt>
   315b3:      	movq	%r14, %rdi
   315b6:      	movq	%r12, %rsi
   315b9:      	movq	%r15, %rdx
   315bc:      	callq	0x57910 <<toyos_crypto::mlkem::Poly>::plus>
   315c1:      	leaq	-0x300(%rbp), %rbx
   315c8:      	movq	%rbx, %rdi
   315cb:      	movq	%r14, %rsi
   315ce:      	callq	0x57e60 <<toyos_crypto::mlkem::Poly>::canonical>
   315d3:      	leaq	-0x100(%rbp), %rdi
   315da:      	movq	%rbx, %rsi
   315dd:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   315e2:      	testb	%al, %al
   315e4:      	je	0x31903 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x883>
   315ea:      	leaq	(,%r13,2), %rax
   315f2:      	addq	%r13, %rax
   315f5:      	shlq	$0x7, %rax
   315f9:      	leaq	(%rax,%rbp), %rsi
   315fd:      	addq	$-0x1c80, %rsi          # imm = 0xE380
   31604:      	leaq	(%rax,%rbp), %rdi
   31608:      	addq	$-0x1b00, %rdi          # imm = 0xE500
   3160f:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   31614:      	testb	%al, %al
   31616:      	je	0x31903 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x883>
   3161c:      	incq	%r13
   3161f:      	movl	$0xe, %eax
   31624:      	movq	-0x48(%rbp), %rcx
   31628:      	movq	-0x50(%rbp), %rdx
   3162c:      	movq	-0x58(%rbp), %rsi
   31630:      	movzwl	-0x30e(%rbp,%rax), %edi
   31638:      	movzwl	-0x30c(%rbp,%rax), %r8d
   31641:      	shll	$0xc, %r8d
   31645:      	orq	%rdi, %r8
   31648:      	movzwl	-0x30a(%rbp,%rax), %edi
   31650:      	shlq	$0x18, %rdi
   31654:      	movzwl	-0x308(%rbp,%rax), %r9d
   3165d:      	shlq	$0x24, %r9
   31661:      	orq	%rdi, %r9
   31664:      	orq	%r8, %r9
   31667:      	movzwl	-0x306(%rbp,%rax), %edi
   3166f:      	shlq	$0x30, %rdi
   31673:      	movzwl	-0x304(%rbp,%rax), %r8d
   3167c:      	movl	%r8d, %r10d
   3167f:      	shrl	$0x4, %r10d
   31683:      	shlq	$0x3c, %r8
   31687:      	orq	%rdi, %r8
   3168a:      	orq	%r9, %r8
   3168d:      	movzwl	-0x302(%rbp,%rax), %edi
   31695:      	shll	$0x8, %edi
   31698:      	orl	%r10d, %edi
   3169b:      	movzwl	-0x300(%rbp,%rax), %r9d
   316a4:      	shlq	$0x14, %r9
   316a8:      	orq	%rdi, %r9
   316ab:      	movq	%r9, -0xdd8(%rbp)
   316b2:      	movq	%r8, -0xde0(%rbp)
   316b9:      	cmpq	%rsi, %r14
   316bc:      	movq	%rdx, %rdi
   316bf:      	cmovbq	%rcx, %rdi
   316c3:      	cmpq	$0xb, %rdi
   316c7:      	jbe	0x318e9 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x869>
   316cd:      	movl	-0xdd8(%rbp), %edi
   316d3:      	movl	%edi, 0x8(%rsi)
   316d6:      	movq	-0xde0(%rbp), %rdi
   316dd:      	movq	%rdi, (%rsi)
   316e0:      	addq	$0x10, %rax
   316e4:      	addq	$0xc, %rsi
   316e8:      	addq	$-0xc, %rdx
   316ec:      	addq	$0xc, %rcx
   316f0:      	cmpq	$0x20e, %rax            # imm = 0x20E
   316f6:      	jne	0x31630 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x5b0>
   316fc:      	movq	%rbx, %rdi
   316ff:      	callq	0x545d0 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   31704:      	movq	%r13, %rbx
   31707:      	movq	%r15, %rdi
   3170a:      	callq	0x545d0 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   3170f:      	movl	$0x4, %r12d
   31715:      	leaq	-0x15e0(%rbp), %rdi
   3171c:      	nopl	(%rax)
   31720:      	cmpq	$0x1, %r12
   31724:      	je	0x313c0 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x340>
   3172a:      	leaq	0x200(%rdi), %r13
   31731:      	decq	%r12
   31734:      	callq	0x545d0 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   31739:      	movq	%r13, %rdi
   3173c:      	jmp	0x31720 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x6a0>
   3173e:      	leaq	-0x1800(%rbp), %rax
   31745:      	movq	%rsi, %rcx
   31748:      	subq	%rax, %rcx
   3174b:      	movq	%rax, %rdx
   3174e:      	subq	%rsi, %rdx
   31751:      	cmovbq	%rcx, %rdx
   31755:      	cmpq	$0x1f, %rdx
   31759:      	jbe	0x318e9 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x869>
   3175f:      	movaps	-0xa0(%rbp), %xmm0
   31766:      	movaps	-0x90(%rbp), %xmm1
   3176d:      	movups	%xmm1, 0x10(%rax)
   31771:      	movups	%xmm0, (%rax)
   31774:      	leaq	-0x1c80(%rbp), %rax
   3177b:      	movq	%rax, -0xde0(%rbp)
   31782:      	movq	$0x4a0, -0xdd8(%rbp)    # imm = 0x4A0
   3178d:      	leaq	-0x15e0(%rbp), %rdi
   31794:      	leaq	-0xde0(%rbp), %rsi
   3179b:      	movl	$0x1, %edx
   317a0:      	callq	0x49dd0 <toyos_crypto::keccak::h>
   317a5:      	leaq	-0xde0(%rbp), %rbx
   317ac:      	leaq	-0x2280(%rbp), %rsi
   317b3:      	movl	$0x600, %edx            # imm = 0x600
   317b8:      	movq	%rbx, %rdi
   317bb:      	callq	0xc4250 <memcpy>
   317c0:      	leaq	-0x7e0(%rbp), %rdi
   317c7:      	leaq	-0x1c80(%rbp), %rsi
   317ce:      	movl	$0x4a0, %edx            # imm = 0x4A0
   317d3:      	callq	0xc4250 <memcpy>
   317d8:      	movaps	-0xc0(%rbp), %xmm0
   317df:      	movaps	-0xb0(%rbp), %xmm1
   317e6:      	movups	%xmm0, -0x320(%rbp)
   317ed:      	movups	%xmm1, -0x310(%rbp)
   317f4:      	movups	-0x15e0(%rbp), %xmm0
   317fb:      	movups	-0x15d0(%rbp), %xmm1
   31802:      	movups	%xmm0, -0x340(%rbp)
   31809:      	movups	%xmm1, -0x330(%rbp)
   31810:      	movq	-0xe8(%rbp), %r14
   31817:      	leaq	0x2(%r14), %rdi
   3181b:      	movl	$0xae0, %edx            # imm = 0xAE0
   31820:      	movq	%rbx, %rsi
   31823:      	callq	0xc4250 <memcpy>
   31828:      	movb	$0x0, (%r14)
   3182c:      	xorps	%xmm0, %xmm0
   3182f:      	movaps	%xmm0, -0xde0(%rbp)
   31836:      	movaps	-0xde0(%rbp), %xmm1
   3183d:      	movaps	%xmm1, -0xa0(%rbp)
   31844:      	movaps	%xmm0, -0xde0(%rbp)
   3184b:      	movaps	-0xde0(%rbp), %xmm1
   31852:      	movaps	%xmm1, -0x90(%rbp)
   31859:      	movaps	%xmm0, -0xde0(%rbp)
   31860:      	movaps	-0xde0(%rbp), %xmm1
   31867:      	leaq	-0x80(%rbp), %rax
   3186b:      	movups	%xmm1, (%rax)
   3186e:      	movaps	%xmm0, -0xde0(%rbp)
   31875:      	movaps	-0xde0(%rbp), %xmm1
   3187c:      	movaps	%xmm1, -0x70(%rbp)
   31880:      	movaps	%xmm0, -0xde0(%rbp)
   31887:      	movaps	-0xde0(%rbp), %xmm1
   3188e:      	movaps	%xmm1, -0xe0(%rbp)
   31895:      	movaps	%xmm0, -0xde0(%rbp)
   3189c:      	movaps	-0xde0(%rbp), %xmm1
   318a3:      	movaps	%xmm1, -0xd0(%rbp)
   318aa:      	movaps	%xmm0, -0xde0(%rbp)
   318b1:      	movaps	-0xde0(%rbp), %xmm1
   318b8:      	movaps	%xmm1, -0xc0(%rbp)
   318bf:      	movaps	%xmm0, -0xde0(%rbp)
   318c6:      	movaps	-0xde0(%rbp), %xmm0
   318cd:      	movaps	%xmm0, -0xb0(%rbp)
   318d4:      	movq	%r14, %rax
   318d7:      	addq	$0x2258, %rsp           # imm = 0x2258
   318de:      	popq	%rbx
   318df:      	popq	%r12
   318e1:      	popq	%r13
   318e3:      	popq	%r14
   318e5:      	popq	%r15
   318e7:      	popq	%rbp
   318e8:      	retq
   318e9:      	leaq	-0x21f5c(%rip), %rdi    # 0xf994 <anon.0c060ffce792bb80b9805c9943ef2ace.2.llvm.16006066140378012905>
   318f0:      	leaq	0x943e1(%rip), %rcx     # 0xc5cd8 <anon.0c060ffce792bb80b9805c9943ef2ace.1.llvm.16006066140378012905>
   318f7:      	movl	$0x237, %esi            # imm = 0x237
   318fc:      	xorl	%edx, %edx
   318fe:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   31903:      	leaq	-0x21e5b(%rip), %rdi    # 0xfaaf <anon.eb4e9983f1dde2da9251237d0548192c.0.llvm.16376435883611519421>
   3190a:      	leaq	0x943df(%rip), %rcx     # 0xc5cf0 <anon.eb4e9983f1dde2da9251237d0548192c.2.llvm.16376435883611519421>
   31911:      	movl	$0x193, %esi            # imm = 0x193
   31916:      	xorl	%edx, %edx
   31918:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   3191d:      	leaq	-0x22087(%rip), %rdi    # 0xf89d <anon.762811cd0282735118b17318538b4fa7.28.llvm.8100539084681502838>
   31924:      	leaq	0x94395(%rip), %rdx     # 0xc5cc0 <anon.762811cd0282735118b17318538b4fa7.35.llvm.8100539084681502838>
   3192b:      	movl	$0x13, %esi
   31930:      	callq	0xbdc90 <core::panicking::panic_fmt>
   31935:      	ud2
   31937:      	movq	%rax, %rbx
   3193a:      	jmp	0x319ac <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x92c>
   3193c:      	movq	%rax, %rbx
   3193f:      	movq	%r14, -0x2f0(%rbp)
   31946:      	leaq	-0x300(%rbp), %rdi
   3194d:      	callq	0x31b00 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>
   31952:      	jmp	0x319b8 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x938>
   31954:      	callq	0xbdaba <core::panicking::panic_in_cleanup>
   31959:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   3195e:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   31963:      	movq	%rax, %rbx
   31966:      	leaq	-0xfe0(%rbp), %rdi
   3196d:      	callq	0x545d0 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   31972:      	jmp	0x31988 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x908>
   31974:      	movq	%rax, %rbx
   31977:      	jmp	0x31988 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x908>
   31979:      	movq	%rax, %rbx
   3197c:      	leaq	-0x17e0(%rbp), %rdi
   31983:      	callq	0x545d0 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   31988:      	leaq	-0x15e0(%rbp), %rdi
   3198f:      	callq	0x31a80 <core::ptr::drop_glue::<[toyos_crypto::mlkem::Poly; 3]>>
   31994:      	jmp	0x319ac <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x92c>
   31996:      	movq	%rax, %rbx
   31999:      	movq	%r12, -0xf0(%rbp)
   319a0:      	leaq	-0x100(%rbp), %rdi
   319a7:      	callq	0x31b00 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>
   319ac:      	leaq	-0x2280(%rbp), %rdi
   319b3:      	callq	0x31a80 <core::ptr::drop_glue::<[toyos_crypto::mlkem::Poly; 3]>>
   319b8:      	xorps	%xmm0, %xmm0
   319bb:      	movaps	%xmm0, -0x40(%rbp)
   319bf:      	movaps	-0x40(%rbp), %xmm1
   319c3:      	movaps	%xmm1, -0xa0(%rbp)
   319ca:      	movaps	%xmm0, -0x40(%rbp)
   319ce:      	movaps	-0x40(%rbp), %xmm1
   319d2:      	movaps	%xmm1, -0x90(%rbp)
   319d9:      	movaps	%xmm0, -0x40(%rbp)
   319dd:      	movaps	-0x40(%rbp), %xmm1
   319e1:      	leaq	-0x80(%rbp), %rax
   319e5:      	movups	%xmm1, (%rax)
   319e8:      	movaps	%xmm0, -0x40(%rbp)
   319ec:      	movaps	-0x40(%rbp), %xmm0
   319f0:      	movaps	%xmm0, -0x70(%rbp)
   319f4:      	jmp	0x31a03 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x983>
   319f6:      	callq	0xbdaba <core::panicking::panic_in_cleanup>
   319fb:      	callq	0xbdaba <core::panicking::panic_in_cleanup>
   31a00:      	movq	%rax, %rbx
   31a03:      	xorps	%xmm0, %xmm0
   31a06:      	movaps	%xmm0, -0x40(%rbp)
   31a0a:      	movaps	-0x40(%rbp), %xmm1
   31a0e:      	movaps	%xmm1, -0xe0(%rbp)
   31a15:      	movaps	%xmm0, -0x40(%rbp)
   31a19:      	movaps	-0x40(%rbp), %xmm1
   31a1d:      	movaps	%xmm1, -0xd0(%rbp)
   31a24:      	movaps	%xmm0, -0x40(%rbp)
   31a28:      	movaps	-0x40(%rbp), %xmm1
   31a2c:      	movaps	%xmm1, -0xc0(%rbp)
   31a33:      	movaps	%xmm0, -0x40(%rbp)
   31a37:      	movaps	-0x40(%rbp), %xmm0
   31a3b:      	movaps	%xmm0, -0xb0(%rbp)
   31a42:      	movq	%rbx, %rdi
   31a45:      	callq	0xb86a0 <_Unwind_Resume>
   31a4a:      	movq	%rax, %rbx
   31a4d:      	nopl	(%rax)
   31a50:      	decq	%r12
   31a53:      	je	0x319ac <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x92c>
   31a59:      	leaq	0x200(%r13), %r14
   31a60:      	movq	%r13, %rdi
   31a63:      	callq	0x545d0 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   31a68:      	movq	%r14, %r13
   31a6b:      	jmp	0x31a50 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x9d0>
   31a6d:      	callq	0xbdaba <core::panicking::panic_in_cleanup>
   31a72:      	int3
   31a73:      	int3
   31a74:      	int3
   31a75:      	int3
   31a76:      	int3
   31a77:      	int3
   31a78:      	int3
   31a79:      	int3
   31a7a:      	int3
   31a7b:      	int3
   31a7c:      	int3
   31a7d:      	int3
   31a7e:      	int3
   31a7f:      	int3

0000000000031a80 <core::ptr::drop_glue::<[toyos_crypto::mlkem::Poly; 3]>>:
   31a80:      	pushq	%rbp
   31a81:      	movq	%rsp, %rbp
   31a84:      	pushq	%r15
   31a86:      	pushq	%r14
   31a88:      	pushq	%r12
   31a8a:      	pushq	%rbx
   31a8b:      	movl	$0x4, %r15d
   31a91:      	nopw	%cs:(%rax,%rax)
   31aa0:      	cmpq	$0x1, %r15
   31aa4:      	je	0x31aba <core::ptr::drop_glue::<[toyos_crypto::mlkem::Poly; 3]>+0x3a>
   31aa6:      	leaq	0x200(%rdi), %rbx
   31aad:      	decq	%r15
   31ab0:      	callq	0x545d0 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   31ab5:      	movq	%rbx, %rdi
   31ab8:      	jmp	0x31aa0 <core::ptr::drop_glue::<[toyos_crypto::mlkem::Poly; 3]>+0x20>
   31aba:      	popq	%rbx
   31abb:      	popq	%r12
   31abd:      	popq	%r14
   31abf:      	popq	%r15
   31ac1:      	popq	%rbp
   31ac2:      	retq
   31ac3:      	movq	%rax, %r14
   31ac6:      	nopw	%cs:(%rax,%rax)
   31ad0:      	decq	%r15
   31ad3:      	je	0x31ae9 <core::ptr::drop_glue::<[toyos_crypto::mlkem::Poly; 3]>+0x69>
   31ad5:      	leaq	0x200(%rbx), %r12
   31adc:      	movq	%rbx, %rdi
   31adf:      	callq	0x545d0 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   31ae4:      	movq	%r12, %rbx
   31ae7:      	jmp	0x31ad0 <core::ptr::drop_glue::<[toyos_crypto::mlkem::Poly; 3]>+0x50>
   31ae9:      	movq	%r14, %rdi
   31aec:      	callq	0xb86a0 <_Unwind_Resume>
   31af1:      	callq	0xbdaba <core::panicking::panic_in_cleanup>
   31af6:      	int3
   31af7:      	int3
   31af8:      	int3
   31af9:      	int3
   31afa:      	int3
   31afb:      	int3
   31afc:      	int3
   31afd:      	int3
   31afe:      	int3
   31aff:      	int3

0000000000031b00 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>:
   31b00:      	pushq	%rbp
   31b01:      	movq	%rsp, %rbp
   31b04:      	pushq	%r15
   31b06:      	pushq	%r14
   31b08:      	pushq	%r12
   31b0a:      	pushq	%rbx
   31b0b:      	movq	0x10(%rdi), %r15
   31b0f:      	cmpq	0x8(%rdi), %r15
   31b13:      	ja	0x31b43 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x43>
   31b15:      	testq	%r15, %r15
   31b18:      	je	0x31b3a <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x3a>
   31b1a:      	movq	(%rdi), %rdi
   31b1d:      	incq	%r15
   31b20:      	cmpq	$0x1, %r15
   31b24:      	je	0x31b3a <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x3a>
   31b26:      	leaq	0x200(%rdi), %rbx
   31b2d:      	decq	%r15
   31b30:      	callq	0x545d0 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   31b35:      	movq	%rbx, %rdi
   31b38:      	jmp	0x31b20 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x20>
   31b3a:      	popq	%rbx
   31b3b:      	popq	%r12
   31b3d:      	popq	%r14
   31b3f:      	popq	%r15
   31b41:      	popq	%rbp
   31b42:      	retq
   31b43:      	leaq	-0x22894(%rip), %rdi    # 0xf2b6 <anon.a8fe1686bdbcefb2af0339a511ab2ed0.3.llvm.8347214850907408321+0xde>
   31b4a:      	leaq	0x9405f(%rip), %rcx     # 0xc5bb0 <anon.a8fe1686bdbcefb2af0339a511ab2ed0.2.llvm.8347214850907408321+0x18>
   31b51:      	movl	$0x1b5, %esi            # imm = 0x1B5
   31b56:      	xorl	%edx, %edx
   31b58:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   31b5d:      	movq	%rax, %r14
   31b60:      	decq	%r15
   31b63:      	je	0x31b79 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x79>
   31b65:      	leaq	0x200(%rbx), %r12
   31b6c:      	movq	%rbx, %rdi
   31b6f:      	callq	0x545d0 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   31b74:      	movq	%r12, %rbx
   31b77:      	jmp	0x31b60 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x60>
   31b79:      	movq	%r14, %rdi
   31b7c:      	callq	0xb86a0 <_Unwind_Resume>
   31b81:      	callq	0xbdaba <core::panicking::panic_in_cleanup>
   31b86:      	int3
   31b87:      	int3
   31b88:      	int3
   31b89:      	int3
   31b8a:      	int3
   31b8b:      	int3
   31b8c:      	int3
   31b8d:      	int3
   31b8e:      	int3
   31b8f:      	int3

0000000000034900 <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>>:
   34900:      	pushq	%rbp
   34901:      	movq	%rsp, %rbp
   34904:      	pushq	%r15
   34906:      	pushq	%r14
   34908:      	pushq	%r13
   3490a:      	pushq	%r12
   3490c:      	pushq	%rbx
   3490d:      	subq	$0x48, %rsp
   34911:      	movq	%rdi, -0x48(%rbp)
   34915:      	movq	0x10(%rdi), %rax
   34919:      	movq	%rax, -0x58(%rbp)
   3491d:      	testq	%rax, %rax
   34920:      	je	0x349ca <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0xca>
   34926:      	movq	-0x48(%rbp), %rax
   3492a:      	movq	0x8(%rax), %rcx
   3492e:      	leaq	0xf24(%rcx), %rax
   34935:      	movq	%rcx, -0x68(%rbp)
   34939:      	leaq	0x2(%rcx), %r14
   3493d:      	xorl	%ecx, %ecx
   3493f:      	movq	-0x58(%rbp), %r12
   34943:      	jmp	0x3498f <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0x8f>
   34945:      	nopw	%cs:(%rax,%rax)
   34950:      	xorps	%xmm1, %xmm1
   34953:      	movaps	%xmm1, -0x40(%rbp)
   34957:      	movaps	-0x40(%rbp), %xmm0
   3495b:      	movups	%xmm0, 0xac2(%rbx)
   34962:      	movaps	%xmm1, -0x40(%rbp)
   34966:      	movaps	-0x40(%rbp), %xmm0
   3496a:      	movups	%xmm0, 0xad2(%rbx)
   34971:      	movq	-0x60(%rbp), %rax
   34975:      	addq	$0xf22, %rax            # imm = 0xF22
   3497b:      	decq	%r12
   3497e:      	addq	$0xf22, %r14            # imm = 0xF22
   34985:      	movq	-0x50(%rbp), %rcx
   34989:      	cmpq	-0x58(%rbp), %rcx
   3498d:      	je	0x349ca <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0xca>
   3498f:      	movq	%rax, -0x60(%rbp)
   34993:      	imulq	$0xf22, %rcx, %rbx      # imm = 0xF22
   3499a:      	addq	-0x68(%rbp), %rbx
   3499e:      	incq	%rcx
   349a1:      	movq	%rcx, -0x50(%rbp)
   349a5:      	movl	$0x4, %r13d
   349ab:      	movq	%r14, %rdi
   349ae:      	nop
   349b0:      	cmpq	$0x1, %r13
   349b4:      	je	0x34950 <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0x50>
   349b6:      	leaq	0x200(%rdi), %r15
   349bd:      	decq	%r13
   349c0:      	callq	0x545d0 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   349c5:      	movq	%r15, %rdi
   349c8:      	jmp	0x349b0 <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0xb0>
   349ca:      	movl	$0x2, %esi
   349cf:      	movl	$0xf22, %edx            # imm = 0xF22
   349d4:      	movq	-0x48(%rbp), %rdi
   349d8:      	addq	$0x48, %rsp
   349dc:      	popq	%rbx
   349dd:      	popq	%r12
   349df:      	popq	%r13
   349e1:      	popq	%r14
   349e3:      	popq	%r15
   349e5:      	popq	%rbp
   349e6:      	jmp	0x35c00 <<alloc::raw_vec::RawVecInner>::deallocate>
   349eb:      	movq	%rax, -0x50(%rbp)
   349ef:      	nop
   349f0:      	decq	%r13
   349f3:      	je	0x34a09 <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0x109>
   349f5:      	leaq	0x200(%r15), %r14
   349fc:      	movq	%r15, %rdi
   349ff:      	callq	0x545d0 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   34a04:      	movq	%r14, %r15
   34a07:      	jmp	0x349f0 <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0xf0>
   34a09:      	xorps	%xmm0, %xmm0
   34a0c:      	movaps	%xmm0, -0x40(%rbp)
   34a10:      	movaps	-0x40(%rbp), %xmm1
   34a14:      	movups	%xmm1, 0xac2(%rbx)
   34a1b:      	movaps	%xmm0, -0x40(%rbp)
   34a1f:      	movaps	-0x40(%rbp), %xmm0
   34a23:      	movups	%xmm0, 0xad2(%rbx)
   34a2a:      	movq	-0x60(%rbp), %rdi
   34a2e:      	nop
   34a30:      	decq	%r12
   34a33:      	je	0x34a46 <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0x146>
   34a35:      	leaq	0xf22(%rdi), %rbx
   34a3c:      	callq	0x351e0 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>>
   34a41:      	movq	%rbx, %rdi
   34a44:      	jmp	0x34a30 <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0x130>
   34a46:      	movl	$0x2, %esi
   34a4b:      	movl	$0xf22, %edx            # imm = 0xF22
   34a50:      	movq	-0x48(%rbp), %rdi
   34a54:      	callq	0x35c00 <<alloc::raw_vec::RawVecInner>::deallocate>
   34a59:      	movq	-0x50(%rbp), %rdi
   34a5d:      	callq	0xb86a0 <_Unwind_Resume>
   34a62:      	callq	0xbdaba <core::panicking::panic_in_cleanup>
   34a67:      	callq	0xbdaba <core::panicking::panic_in_cleanup>
   34a6c:      	int3
   34a6d:      	int3
   34a6e:      	int3
   34a6f:      	int3

0000000000034c70 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>>:
   34c70:      	pushq	%rbp
   34c71:      	movq	%rsp, %rbp
   34c74:      	pushq	%r15
   34c76:      	pushq	%r14
   34c78:      	pushq	%r13
   34c7a:      	pushq	%r12
   34c7c:      	pushq	%rbx
   34c7d:      	subq	$0x48, %rsp
   34c81:      	movq	%rdi, %rbx
   34c84:      	movq	0x8(%rdi), %rsi
   34c88:      	movq	0x18(%rdi), %r12
   34c8c:      	movq	%r12, %rdi
   34c8f:      	movq	%rsi, -0x48(%rbp)
   34c93:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   34c98:      	testb	%al, %al
   34c9a:      	je	0x34d9f <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0x12f>
   34ca0:      	movq	%rbx, -0x58(%rbp)
   34ca4:      	movq	%r12, %rax
   34ca7:      	movq	-0x48(%rbp), %rsi
   34cab:      	subq	%rsi, %rax
   34cae:      	shrq	%rax
   34cb1:      	movabsq	$-0x78aa39e3303d52dd, %rcx # imm = 0x8755C61CCFC2AD23
   34cbb:      	mulq	%rcx
   34cbe:      	cmpq	%rsi, %r12
   34cc1:      	je	0x34d6a <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0xfa>
   34cc7:      	movq	%rdx, %r13
   34cca:      	shrq	$0xa, %r13
   34cce:      	movq	-0x48(%rbp), %rcx
   34cd2:      	leaq	0xf24(%rcx), %rax
   34cd9:      	leaq	0x2(%rcx), %r15
   34cdd:      	xorl	%ecx, %ecx
   34cdf:      	movq	%r13, -0x68(%rbp)
   34ce3:      	jmp	0x34d31 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0xc1>
   34ce5:      	nopw	%cs:(%rax,%rax)
   34cf0:      	xorps	%xmm1, %xmm1
   34cf3:      	movaps	%xmm1, -0x40(%rbp)
   34cf7:      	movaps	-0x40(%rbp), %xmm0
   34cfb:      	movups	%xmm0, 0xac2(%r14)
   34d03:      	movaps	%xmm1, -0x40(%rbp)
   34d07:      	movaps	-0x40(%rbp), %xmm0
   34d0b:      	movups	%xmm0, 0xad2(%r14)
   34d13:      	movq	-0x60(%rbp), %rax
   34d17:      	addq	$0xf22, %rax            # imm = 0xF22
   34d1d:      	decq	%r13
   34d20:      	addq	$0xf22, %r15            # imm = 0xF22
   34d27:      	movq	-0x50(%rbp), %rcx
   34d2b:      	cmpq	-0x68(%rbp), %rcx
   34d2f:      	je	0x34d6a <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0xfa>
   34d31:      	movq	%rax, -0x60(%rbp)
   34d35:      	imulq	$0xf22, %rcx, %r14      # imm = 0xF22
   34d3c:      	addq	-0x48(%rbp), %r14
   34d40:      	incq	%rcx
   34d43:      	movq	%rcx, -0x50(%rbp)
   34d47:      	movl	$0x4, %ebx
   34d4c:      	movq	%r15, %rdi
   34d4f:      	nop
   34d50:      	cmpq	$0x1, %rbx
   34d54:      	je	0x34cf0 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0x80>
   34d56:      	leaq	0x200(%rdi), %r12
   34d5d:      	decq	%rbx
   34d60:      	callq	0x545d0 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   34d65:      	movq	%r12, %rdi
   34d68:      	jmp	0x34d50 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0xe0>
   34d6a:      	movq	-0x58(%rbp), %rcx
   34d6e:      	movq	(%rcx), %rax
   34d71:      	movq	0x10(%rcx), %rcx
   34d75:      	movq	%rcx, -0x40(%rbp)
   34d79:      	movq	%rax, -0x38(%rbp)
   34d7d:      	leaq	-0x40(%rbp), %rdi
   34d81:      	movl	$0x2, %esi
   34d86:      	movl	$0xf22, %edx            # imm = 0xF22
   34d8b:      	callq	0x35c00 <<alloc::raw_vec::RawVecInner>::deallocate>
   34d90:      	addq	$0x48, %rsp
   34d94:      	popq	%rbx
   34d95:      	popq	%r12
   34d97:      	popq	%r13
   34d99:      	popq	%r14
   34d9b:      	popq	%r15
   34d9d:      	popq	%rbp
   34d9e:      	retq
   34d9f:      	leaq	-0x244ea(%rip), %rdi    # 0x108bc <anon.6cc4159c997fb1fe88462a0393e0f2a1.0.llvm.2134392181110068913>
   34da6:      	leaq	0x9125b(%rip), %rcx     # 0xc6008 <anon.6cc4159c997fb1fe88462a0393e0f2a1.2.llvm.2134392181110068913>
   34dad:      	movl	$0x193, %esi            # imm = 0x193
   34db2:      	xorl	%edx, %edx
   34db4:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   34db9:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   34dbe:      	movq	%rax, -0x50(%rbp)
   34dc2:      	nopw	%cs:(%rax,%rax)
   34dd0:      	decq	%rbx
   34dd3:      	je	0x34dea <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0x17a>
   34dd5:      	leaq	0x200(%r12), %r15
   34ddd:      	movq	%r12, %rdi
   34de0:      	callq	0x545d0 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   34de5:      	movq	%r15, %r12
   34de8:      	jmp	0x34dd0 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0x160>
   34dea:      	xorps	%xmm0, %xmm0
   34ded:      	movaps	%xmm0, -0x40(%rbp)
   34df1:      	movaps	-0x40(%rbp), %xmm1
   34df5:      	movups	%xmm1, 0xac2(%r14)
   34dfd:      	movaps	%xmm0, -0x40(%rbp)
   34e01:      	movaps	-0x40(%rbp), %xmm0
   34e05:      	movups	%xmm0, 0xad2(%r14)
   34e0d:      	movq	-0x60(%rbp), %rdi
   34e11:      	nopw	%cs:(%rax,%rax)
   34e20:      	decq	%r13
   34e23:      	je	0x34e36 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0x1c6>
   34e25:      	leaq	0xf22(%rdi), %rbx
   34e2c:      	callq	0x351e0 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>>
   34e31:      	movq	%rbx, %rdi
   34e34:      	jmp	0x34e20 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0x1b0>
   34e36:      	movq	-0x58(%rbp), %rcx
   34e3a:      	movq	(%rcx), %rax
   34e3d:      	movq	0x10(%rcx), %rcx
   34e41:      	movq	%rcx, -0x40(%rbp)
   34e45:      	movq	%rax, -0x38(%rbp)
   34e49:      	leaq	-0x40(%rbp), %rdi
   34e4d:      	movl	$0x2, %esi
   34e52:      	movl	$0xf22, %edx            # imm = 0xF22
   34e57:      	callq	0x35c00 <<alloc::raw_vec::RawVecInner>::deallocate>
   34e5c:      	movq	-0x50(%rbp), %rdi
   34e60:      	callq	0xb86a0 <_Unwind_Resume>
   34e65:      	callq	0xbdaba <core::panicking::panic_in_cleanup>
   34e6a:      	callq	0xbdaba <core::panicking::panic_in_cleanup>
   34e6f:      	int3

00000000000351e0 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>>:
   351e0:      	pushq	%rbp
   351e1:      	movq	%rsp, %rbp
   351e4:      	pushq	%r15
   351e6:      	pushq	%r14
   351e8:      	pushq	%r13
   351ea:      	pushq	%r12
   351ec:      	pushq	%rbx
   351ed:      	subq	$0x18, %rsp
   351f1:      	movq	%rdi, %rbx
   351f4:      	movl	$0x4, %r12d
   351fa:      	nopw	(%rax,%rax)
   35200:      	cmpq	$0x1, %r12
   35204:      	je	0x3521a <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>+0x3a>
   35206:      	leaq	0x200(%rdi), %r15
   3520d:      	decq	%r12
   35210:      	callq	0x545d0 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   35215:      	movq	%r15, %rdi
   35218:      	jmp	0x35200 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>+0x20>
   3521a:      	xorps	%xmm0, %xmm0
   3521d:      	movaps	%xmm0, -0x40(%rbp)
   35221:      	movaps	-0x40(%rbp), %xmm1
   35225:      	movups	%xmm1, 0xac0(%rbx)
   3522c:      	movaps	%xmm0, -0x40(%rbp)
   35230:      	movaps	-0x40(%rbp), %xmm0
   35234:      	movups	%xmm0, 0xad0(%rbx)
   3523b:      	addq	$0x18, %rsp
   3523f:      	popq	%rbx
   35240:      	popq	%r12
   35242:      	popq	%r13
   35244:      	popq	%r14
   35246:      	popq	%r15
   35248:      	popq	%rbp
   35249:      	retq
   3524a:      	movq	%rax, %r14
   3524d:      	nopl	(%rax)
   35250:      	decq	%r12
   35253:      	je	0x35269 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>+0x89>
   35255:      	leaq	0x200(%r15), %r13
   3525c:      	movq	%r15, %rdi
   3525f:      	callq	0x545d0 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   35264:      	movq	%r13, %r15
   35267:      	jmp	0x35250 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>+0x70>
   35269:      	xorps	%xmm0, %xmm0
   3526c:      	movaps	%xmm0, -0x40(%rbp)
   35270:      	movaps	-0x40(%rbp), %xmm1
   35274:      	movups	%xmm1, 0xac0(%rbx)
   3527b:      	movaps	%xmm0, -0x40(%rbp)
   3527f:      	movaps	-0x40(%rbp), %xmm0
   35283:      	movups	%xmm0, 0xad0(%rbx)
   3528a:      	movq	%r14, %rdi
   3528d:      	callq	0xb86a0 <_Unwind_Resume>
   35292:      	callq	0xbdaba <core::panicking::panic_in_cleanup>
   35297:      	int3
   35298:      	int3
   35299:      	int3
   3529a:      	int3
   3529b:      	int3
   3529c:      	int3
   3529d:      	int3
   3529e:      	int3
   3529f:      	int3

00000000000352a0 <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>>:
   352a0:      	pushq	%rbp
   352a1:      	movq	%rsp, %rbp
   352a4:      	pushq	%r15
   352a6:      	pushq	%r14
   352a8:      	pushq	%r13
   352aa:      	pushq	%r12
   352ac:      	pushq	%rbx
   352ad:      	subq	$0x1000, %rsp           # imm = 0x1000
   352b4:      	movq	$0x0, (%rsp)
   352bc:      	subq	$0x1000, %rsp           # imm = 0x1000
   352c3:      	movq	$0x0, (%rsp)
   352cb:      	subq	$0x1000, %rsp           # imm = 0x1000
   352d2:      	movq	$0x0, (%rsp)
   352da:      	subq	$0xd18, %rsp            # imm = 0xD18
   352e1:      	movq	0x10(%rdi), %r15
   352e5:      	movq	0x18(%rdi), %rcx
   352e9:      	movq	(%rsi), %rax
   352ec:      	movq	%rax, -0x38(%rbp)
   352f0:      	movq	0x8(%rsi), %rax
   352f4:      	movq	%rax, -0x30(%rbp)
   352f8:      	movq	%rcx, -0x50(%rbp)
   352fc:      	cmpq	%rcx, %r15
   352ff:      	jae	0x35b06 <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>+0x866>
   35305:      	movq	(%rdi), %r13
   35308:      	movq	0x10(%rsi), %rax
   3530c:      	movq	%rax, -0x40(%rbp)
   35310:      	movq	0x8(%rdi), %rax
   35314:      	movq	%rax, -0x48(%rbp)
   35318:      	jmp	0x353a2 <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>+0x102>
   3531d:      	nopl	(%rax)
   35320:      	movl	$0xae0, %edx            # imm = 0xAE0
   35325:      	leaq	-0x2e12(%rbp), %rbx
   3532c:      	movq	%rbx, %rdi
   3532f:      	leaq	-0x1ab2(%rbp), %rsi
   35336:      	callq	0xc4250 <memcpy>
   3533b:      	movl	$0x440, %edx            # imm = 0x440
   35340:      	leaq	-0x2332(%rbp), %rdi
   35347:      	movq	%r13, %rsi
   3534a:      	callq	0xc4250 <memcpy>
   3534f:      	movl	$0xf20, %edx            # imm = 0xF20
   35354:      	leaq	-0x3d32(%rbp), %rdi
   3535b:      	movq	%rbx, %rsi
   3535e:      	callq	0xc4250 <memcpy>
   35363:      	movq	-0x30(%rbp), %rbx
   35367:      	imulq	$0xf22, %rbx, %rax      # imm = 0xF22
   3536e:      	movq	-0x40(%rbp), %rcx
   35372:      	movb	%r14b, (%rcx,%rax)
   35376:      	leaq	(%rcx,%rax), %rdi
   3537a:      	incq	%rdi
   3537d:      	movl	$0xf21, %edx            # imm = 0xF21
   35382:      	leaq	-0x3d33(%rbp), %rsi
   35389:      	callq	0xc4250 <memcpy>
   3538e:      	incq	%rbx
   35391:      	movq	%rbx, -0x30(%rbp)
   35395:      	cmpq	-0x50(%rbp), %r15
   35399:      	movq	%r12, %r13
   3539c:      	je	0x35b06 <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>+0x866>
   353a2:      	movq	(%r13), %r14
   353a6:      	movabsq	$-0x61c8864680b583eb, %rax # imm = 0x9E3779B97F4A7C15
   353b0:      	addq	%rax, %r14
   353b3:      	movq	%r14, (%r13)
   353b7:      	leaq	-0x2550a(%rip), %rax    # 0xfeb4 <anon.b0fa440d1b3fd0947bcb9be5aef6393f.2.llvm.16697874475220157172>
   353be:      	movq	%rax, -0x4f0(%rbp)
   353c5:      	movq	$0x40, -0x4e8(%rbp)
   353d0:      	leaq	-0xfd2(%rbp), %rdi
   353d7:      	leaq	-0x4f0(%rbp), %rsi
   353de:      	callq	0x31080 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>>
   353e3:      	cmpb	$0x1, -0xfd2(%rbp)
   353ea:      	je	0x35b23 <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>+0x883>
   353f0:      	incq	%r15
   353f3:      	movq	%r14, %rax
   353f6:      	shrq	$0x1e, %rax
   353fa:      	xorq	%r14, %rax
   353fd:      	movabsq	$-0x40a7b892e31b1a47, %rcx # imm = 0xBF58476D1CE4E5B9
   35407:      	imulq	%rcx, %rax
   3540b:      	movq	%rax, %rcx
   3540e:      	shrq	$0x1b, %rcx
   35412:      	xorl	%eax, %ecx
   35414:      	imull	$0x133111eb, %ecx, %eax # imm = 0x133111EB
   3541a:      	movl	%eax, %r14d
   3541d:      	shrl	$0x1f, %r14d
   35421:      	xorl	%eax, %r14d
   35424:      	andl	$0x1, %r14d
   35428:      	movl	$0xae0, %edx            # imm = 0xAE0
   3542d:      	leaq	-0x1ab2(%rbp), %rdi
   35434:      	leaq	-0xfd0(%rbp), %rsi
   3543b:      	callq	0xc4250 <memcpy>
   35440:      	movq	-0x48(%rbp), %rax
   35444:      	movq	0x8(%rax), %rsi
   35448:      	movl	$0x440, %edx            # imm = 0x440
   3544d:      	leaq	-0x4f0(%rbp), %rdi
   35454:      	callq	0xc4250 <memcpy>
   35459:      	movq	(%r13), %rax
   3545d:      	movq	%rax, %xmm0
   35462:      	movabsq	$0x6bc5545cfc8f5940, %rcx # imm = 0x6BC5545CFC8F5940
   3546c:      	addq	%rcx, %rax
   3546f:      	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
   35474:      	movdqa	%xmm0, %xmm2
   35478:      	paddq	-0x26760(%rip), %xmm2   # 0xed20 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0xe0>
   35480:      	movdqa	%xmm0, %xmm8
   35485:      	paddq	-0x2675e(%rip), %xmm8   # 0xed30 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0xf0>
   3548e:      	movdqa	%xmm0, %xmm11
   35493:      	paddq	-0x2671c(%rip), %xmm11  # 0xed80 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x140>
   3549c:      	movdqa	%xmm0, %xmm9
   354a1:      	paddq	-0x269aa(%rip), %xmm9   # 0xeb00 <anon.eb4e9983f1dde2da9251237d0548192c.1.llvm.16376435883611519421+0x540>
   354aa:      	movdqa	%xmm0, %xmm5
   354ae:      	paddq	-0x26486(%rip), %xmm5   # 0xf030 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x3f0>
   354b6:      	movdqa	%xmm0, %xmm6
   354ba:      	paddq	-0x269b2(%rip), %xmm6   # 0xeb10 <anon.eb4e9983f1dde2da9251237d0548192c.1.llvm.16376435883611519421+0x550>
   354c2:      	movdqa	%xmm0, %xmm7
   354c6:      	paddq	-0x266de(%rip), %xmm7   # 0xedf0 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x1b0>
   354ce:      	paddq	-0x26516(%rip), %xmm0   # 0xefc0 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x380>
   354d6:      	xorl	%ecx, %ecx
   354d8:      	movdqa	-0x26480(%rip), %xmm3   # 0xf060 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x420>
   354e0:      	movdqa	-0x26758(%rip), %xmm4   # 0xed90 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x150>
   354e8:      	nopl	(%rax,%rax)
   354f0:      	movdqa	%xmm0, -0x60(%rbp)
   354f5:      	movdqa	%xmm6, -0x70(%rbp)
   354fa:      	movdqa	%xmm9, -0xb0(%rbp)
   35503:      	movdqa	%xmm11, -0x80(%rbp)
   35509:      	movdqa	%xmm8, -0x90(%rbp)
   35512:      	movdqa	%xmm2, -0xa0(%rbp)
   3551a:      	movdqa	-0xa0(%rbp), %xmm10
   35523:      	movdqa	-0x2676c(%rip), %xmm11  # 0xedc0 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x180>
   3552c:      	paddq	%xmm11, %xmm10
   35531:      	movdqa	-0x90(%rbp), %xmm13
   3553a:      	paddq	%xmm11, %xmm13
   3553f:      	movdqa	-0x80(%rbp), %xmm15
   35545:      	paddq	%xmm11, %xmm15
   3554a:      	movdqa	%xmm9, %xmm1
   3554f:      	paddq	%xmm11, %xmm1
   35554:      	movdqa	%xmm5, %xmm2
   35558:      	paddq	%xmm11, %xmm2
   3555d:      	movdqa	-0x70(%rbp), %xmm14
   35563:      	paddq	%xmm11, %xmm14
   35568:      	movdqa	%xmm7, %xmm8
   3556d:      	paddq	%xmm11, %xmm8
   35572:      	movdqa	-0x60(%rbp), %xmm12
   35578:      	paddq	%xmm11, %xmm12
   3557d:      	movdqa	%xmm12, %xmm11
   35582:      	psrlq	$0x1e, %xmm11
   35588:      	movdqa	%xmm10, %xmm9
   3558d:      	psrlq	$0x1e, %xmm9
   35593:      	pxor	%xmm10, %xmm9
   35598:      	movdqa	%xmm13, %xmm10
   3559d:      	psrlq	$0x1e, %xmm10
   355a3:      	pxor	%xmm13, %xmm10
   355a8:      	movdqa	%xmm15, %xmm13
   355ad:      	psrlq	$0x1e, %xmm13
   355b3:      	pxor	%xmm15, %xmm13
   355b8:      	movdqa	%xmm1, %xmm15
   355bd:      	psrlq	$0x1e, %xmm15
   355c3:      	pxor	%xmm1, %xmm15
   355c8:      	movdqa	%xmm2, %xmm1
   355cc:      	psrlq	$0x1e, %xmm1
   355d1:      	pxor	%xmm2, %xmm1
   355d5:      	movdqa	%xmm14, %xmm2
   355da:      	psrlq	$0x1e, %xmm2
   355df:      	pxor	%xmm14, %xmm2
   355e4:      	movdqa	%xmm8, %xmm14
   355e9:      	psrlq	$0x1e, %xmm14
   355ef:      	pxor	%xmm8, %xmm14
   355f4:      	pxor	%xmm12, %xmm11
   355f9:      	movdqa	%xmm11, %xmm8
   355fe:      	movdqa	%xmm5, %xmm6
   35602:      	movdqa	-0x2671a(%rip), %xmm5   # 0xeef0 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x2b0>
   3560a:      	pmuludq	%xmm5, %xmm8
   3560f:      	movdqa	%xmm11, %xmm12
   35614:      	psrlq	$0x20, %xmm12
   3561a:      	pmuludq	%xmm3, %xmm12
   3561f:      	paddq	%xmm8, %xmm12
   35624:      	psllq	$0x20, %xmm12
   3562a:      	pmuludq	%xmm3, %xmm11
   3562f:      	paddq	%xmm12, %xmm11
   35634:      	movdqa	%xmm14, %xmm8
   35639:      	pmuludq	%xmm5, %xmm8
   3563e:      	movdqa	%xmm14, %xmm12
   35643:      	psrlq	$0x20, %xmm12
   35649:      	pmuludq	%xmm3, %xmm12
   3564e:      	paddq	%xmm8, %xmm12
   35653:      	psllq	$0x20, %xmm12
   35659:      	pmuludq	%xmm3, %xmm14
   3565e:      	paddq	%xmm12, %xmm14
   35663:      	movdqa	%xmm2, %xmm8
   35668:      	pmuludq	%xmm5, %xmm8
   3566d:      	movdqa	%xmm2, %xmm12
   35672:      	psrlq	$0x20, %xmm12
   35678:      	pmuludq	%xmm3, %xmm12
   3567d:      	paddq	%xmm8, %xmm12
   35682:      	psllq	$0x20, %xmm12
   35688:      	pmuludq	%xmm3, %xmm2
   3568c:      	paddq	%xmm12, %xmm2
   35691:      	movdqa	%xmm1, %xmm8
   35696:      	pmuludq	%xmm5, %xmm8
   3569b:      	movdqa	%xmm1, %xmm12
   356a0:      	psrlq	$0x20, %xmm12
   356a6:      	pmuludq	%xmm3, %xmm12
   356ab:      	paddq	%xmm8, %xmm12
   356b0:      	psllq	$0x20, %xmm12
   356b6:      	pmuludq	%xmm3, %xmm1
   356ba:      	paddq	%xmm12, %xmm1
   356bf:      	movdqa	%xmm15, %xmm8
   356c4:      	pmuludq	%xmm5, %xmm8
   356c9:      	movdqa	%xmm15, %xmm12
   356ce:      	psrlq	$0x20, %xmm12
   356d4:      	pmuludq	%xmm3, %xmm12
   356d9:      	paddq	%xmm8, %xmm12
   356de:      	psllq	$0x20, %xmm12
   356e4:      	pmuludq	%xmm3, %xmm15
   356e9:      	paddq	%xmm12, %xmm15
   356ee:      	movdqa	%xmm13, %xmm8
   356f3:      	pmuludq	%xmm5, %xmm8
   356f8:      	movdqa	%xmm13, %xmm12
   356fd:      	psrlq	$0x20, %xmm12
   35703:      	pmuludq	%xmm3, %xmm12
   35708:      	paddq	%xmm8, %xmm12
   3570d:      	psllq	$0x20, %xmm12
   35713:      	pmuludq	%xmm3, %xmm13
   35718:      	paddq	%xmm12, %xmm13
   3571d:      	movdqa	%xmm10, %xmm8
   35722:      	pmuludq	%xmm5, %xmm8
   35727:      	movdqa	%xmm10, %xmm12
   3572c:      	psrlq	$0x20, %xmm12
   35732:      	pmuludq	%xmm3, %xmm12
   35737:      	paddq	%xmm8, %xmm12
   3573c:      	psllq	$0x20, %xmm12
   35742:      	pmuludq	%xmm3, %xmm10
   35747:      	paddq	%xmm12, %xmm10
   3574c:      	movdqa	%xmm9, %xmm8
   35751:      	pmuludq	%xmm5, %xmm8
   35756:      	movdqa	%xmm6, %xmm5
   3575a:      	movdqa	%xmm9, %xmm12
   3575f:      	psrlq	$0x20, %xmm12
   35765:      	pmuludq	%xmm3, %xmm12
   3576a:      	paddq	%xmm8, %xmm12
   3576f:      	psllq	$0x20, %xmm12
   35775:      	pmuludq	%xmm3, %xmm9
   3577a:      	paddq	%xmm12, %xmm9
   3577f:      	movdqa	%xmm9, %xmm12
   35784:      	psrlq	$0x1b, %xmm12
   3578a:      	movdqa	%xmm11, %xmm8
   3578f:      	psrlq	$0x1b, %xmm8
   35795:      	pxor	%xmm11, %xmm8
   3579a:      	movdqa	%xmm14, %xmm11
   3579f:      	psrlq	$0x1b, %xmm11
   357a5:      	pxor	%xmm14, %xmm11
   357aa:      	movdqa	%xmm2, %xmm14
   357af:      	psrlq	$0x1b, %xmm14
   357b5:      	pxor	%xmm2, %xmm14
   357ba:      	movdqa	%xmm1, %xmm2
   357be:      	psrlq	$0x1b, %xmm2
   357c3:      	pxor	%xmm1, %xmm2
   357c7:      	movdqa	%xmm15, %xmm1
   357cc:      	psrlq	$0x1b, %xmm1
   357d1:      	pxor	%xmm15, %xmm1
   357d6:      	movdqa	%xmm13, %xmm15
   357db:      	psrlq	$0x1b, %xmm15
   357e1:      	pxor	%xmm13, %xmm15
   357e6:      	movdqa	%xmm10, %xmm13
   357eb:      	psrlq	$0x1b, %xmm13
   357f1:      	pxor	%xmm10, %xmm13
   357f6:      	pxor	%xmm9, %xmm12
   357fb:      	movdqa	%xmm12, %xmm9
   35800:      	movdqa	-0x26b38(%rip), %xmm6   # 0xecd0 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x90>
   35808:      	pmuludq	%xmm6, %xmm9
   3580d:      	movdqa	%xmm12, %xmm10
   35812:      	psrlq	$0x20, %xmm10
   35818:      	pmuludq	%xmm4, %xmm10
   3581d:      	paddq	%xmm9, %xmm10
   35822:      	psllq	$0x20, %xmm10
   35828:      	pmuludq	%xmm4, %xmm12
   3582d:      	paddq	%xmm10, %xmm12
   35832:      	movdqa	%xmm13, %xmm9
   35837:      	pmuludq	%xmm6, %xmm9
   3583c:      	movdqa	%xmm13, %xmm10
   35841:      	psrlq	$0x20, %xmm10
   35847:      	pmuludq	%xmm4, %xmm10
   3584c:      	paddq	%xmm9, %xmm10
   35851:      	psllq	$0x20, %xmm10
   35857:      	pmuludq	%xmm4, %xmm13
   3585c:      	paddq	%xmm10, %xmm13
   35861:      	movdqa	%xmm15, %xmm9
   35866:      	pmuludq	%xmm6, %xmm9
   3586b:      	movdqa	%xmm15, %xmm10
   35870:      	psrlq	$0x20, %xmm10
   35876:      	pmuludq	%xmm4, %xmm10
   3587b:      	paddq	%xmm9, %xmm10
   35880:      	psllq	$0x20, %xmm10
   35886:      	pmuludq	%xmm4, %xmm15
   3588b:      	paddq	%xmm10, %xmm15
   35890:      	movdqa	%xmm1, %xmm9
   35895:      	pmuludq	%xmm6, %xmm9
   3589a:      	movdqa	%xmm1, %xmm10
   3589f:      	psrlq	$0x20, %xmm10
   358a5:      	pmuludq	%xmm4, %xmm10
   358aa:      	paddq	%xmm9, %xmm10
   358af:      	psllq	$0x20, %xmm10
   358b5:      	pmuludq	%xmm4, %xmm1
   358b9:      	paddq	%xmm10, %xmm1
   358be:      	movdqa	%xmm2, %xmm9
   358c3:      	pmuludq	%xmm6, %xmm9
   358c8:      	movdqa	%xmm2, %xmm10
   358cd:      	psrlq	$0x20, %xmm10
   358d3:      	pmuludq	%xmm4, %xmm10
   358d8:      	paddq	%xmm9, %xmm10
   358dd:      	psllq	$0x20, %xmm10
   358e3:      	pmuludq	%xmm4, %xmm2
   358e7:      	paddq	%xmm10, %xmm2
   358ec:      	movdqa	%xmm14, %xmm9
   358f1:      	pmuludq	%xmm6, %xmm9
   358f6:      	movdqa	%xmm14, %xmm10
   358fb:      	psrlq	$0x20, %xmm10
   35901:      	pmuludq	%xmm4, %xmm10
   35906:      	paddq	%xmm9, %xmm10
   3590b:      	psllq	$0x20, %xmm10
   35911:      	pmuludq	%xmm4, %xmm14
   35916:      	paddq	%xmm10, %xmm14
   3591b:      	movdqa	%xmm11, %xmm9
   35920:      	pmuludq	%xmm6, %xmm9
   35925:      	movdqa	%xmm11, %xmm10
   3592a:      	psrlq	$0x20, %xmm10
   35930:      	pmuludq	%xmm4, %xmm10
   35935:      	paddq	%xmm9, %xmm10
   3593a:      	psllq	$0x20, %xmm10
   35940:      	pmuludq	%xmm4, %xmm11
   35945:      	paddq	%xmm10, %xmm11
   3594a:      	movdqa	%xmm8, %xmm9
   3594f:      	pmuludq	%xmm6, %xmm9
   35954:      	movdqa	%xmm8, %xmm10
   35959:      	psrlq	$0x20, %xmm10
   3595f:      	pmuludq	%xmm4, %xmm10
   35964:      	paddq	%xmm9, %xmm10
   35969:      	psllq	$0x20, %xmm10
   3596f:      	pmuludq	%xmm4, %xmm8
   35974:      	paddq	%xmm10, %xmm8
   35979:      	movdqa	%xmm12, %xmm9
   3597e:      	psrlq	$0x1f, %xmm9
   35984:      	pxor	%xmm12, %xmm9
   35989:      	movdqa	%xmm13, %xmm10
   3598e:      	psrlq	$0x1f, %xmm10
   35994:      	pxor	%xmm13, %xmm10
   35999:      	movdqa	%xmm15, %xmm13
   3599e:      	psrlq	$0x1f, %xmm13
   359a4:      	pxor	%xmm15, %xmm13
   359a9:      	movdqa	%xmm1, %xmm12
   359ae:      	psrlq	$0x1f, %xmm12
   359b4:      	pxor	%xmm1, %xmm12
   359b9:      	movdqa	%xmm2, %xmm15
   359be:      	psrlq	$0x1f, %xmm15
   359c4:      	pxor	%xmm2, %xmm15
   359c9:      	movdqa	%xmm14, %xmm2
   359ce:      	psrlq	$0x1f, %xmm2
   359d3:      	pxor	%xmm14, %xmm2
   359d8:      	movdqa	%xmm11, %xmm14
   359dd:      	psrlq	$0x1f, %xmm14
   359e3:      	pxor	%xmm11, %xmm14
   359e8:      	movdqa	%xmm8, %xmm1
   359ed:      	psrlq	$0x1f, %xmm1
   359f2:      	pxor	%xmm8, %xmm1
   359f7:      	movdqa	-0x26dff(%rip), %xmm6   # 0xec00 <anon.eb4e9983f1dde2da9251237d0548192c.1.llvm.16376435883611519421+0x640>
   359ff:      	movdqa	%xmm7, %xmm0
   35a03:      	movdqa	%xmm6, %xmm7
   35a07:      	pand	%xmm6, %xmm1
   35a0b:      	pand	%xmm6, %xmm14
   35a10:      	packuswb	%xmm14, %xmm1
   35a15:      	movdqa	-0x70(%rbp), %xmm6
   35a1a:      	pand	%xmm7, %xmm2
   35a1e:      	pand	%xmm7, %xmm15
   35a23:      	packuswb	%xmm15, %xmm2
   35a28:      	movdqa	-0x80(%rbp), %xmm11
   35a2e:      	packuswb	%xmm2, %xmm1
   35a32:      	pand	%xmm7, %xmm12
   35a37:      	pand	%xmm7, %xmm13
   35a3c:      	packuswb	%xmm13, %xmm12
   35a41:      	movdqa	-0x90(%rbp), %xmm8
   35a4a:      	pand	%xmm7, %xmm10
   35a4f:      	pand	%xmm7, %xmm9
   35a54:      	movdqa	%xmm0, %xmm7
   35a58:      	packuswb	%xmm9, %xmm10
   35a5d:      	movdqa	-0xb0(%rbp), %xmm9
   35a66:      	packuswb	%xmm10, %xmm12
   35a6b:      	movdqa	-0xa0(%rbp), %xmm2
   35a73:      	packuswb	%xmm12, %xmm1
   35a78:      	movdqa	-0x60(%rbp), %xmm0
   35a7d:      	movdqu	%xmm1, -0xfd2(%rbp,%rcx)
   35a86:      	addq	$0x10, %rcx
   35a8a:      	movdqa	-0x26a22(%rip), %xmm1   # 0xf070 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x430>
   35a92:      	paddq	%xmm1, %xmm0
   35a96:      	paddq	%xmm1, %xmm7
   35a9a:      	paddq	%xmm1, %xmm6
   35a9e:      	paddq	%xmm1, %xmm5
   35aa2:      	paddq	%xmm1, %xmm9
   35aa7:      	paddq	%xmm1, %xmm11
   35aac:      	paddq	%xmm1, %xmm8
   35ab1:      	paddq	%xmm1, %xmm2
   35ab5:      	cmpq	$0x440, %rcx            # imm = 0x440
   35abc:      	jne	0x354f0 <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>+0x250>
   35ac2:      	movq	%r13, %r12
   35ac5:      	movq	%rax, (%r13)
   35ac9:      	movl	$0x440, %edx            # imm = 0x440
   35ace:      	leaq	-0x1ef2(%rbp), %r13
   35ad5:      	movq	%r13, %rdi
   35ad8:      	leaq	-0xfd2(%rbp), %rsi
   35adf:      	callq	0xc4250 <memcpy>
   35ae4:      	testq	%r14, %r14
   35ae7:      	jne	0x35320 <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>+0x80>
   35aed:      	movl	$0x440, %edx            # imm = 0x440
   35af2:      	movq	%r13, %rdi
   35af5:      	leaq	-0x4f0(%rbp), %rsi
   35afc:      	callq	0xc4250 <memcpy>
   35b01:      	jmp	0x35320 <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>+0x80>
   35b06:      	movq	-0x38(%rbp), %rax
   35b0a:      	movq	-0x30(%rbp), %rcx
   35b0e:      	movq	%rcx, (%rax)
   35b11:      	addq	$0x3d18, %rsp           # imm = 0x3D18
   35b18:      	popq	%rbx
   35b19:      	popq	%r12
   35b1b:      	popq	%r13
   35b1d:      	popq	%r14
   35b1f:      	popq	%r15
   35b21:      	popq	%rbp
   35b22:      	retq
   35b23:      	movzbl	-0xfd1(%rbp), %eax
   35b2a:      	movb	%al, -0x1ab2(%rbp)
   35b30:      	leaq	-0x25c43(%rip), %rdi    # 0xfef4 <anon.b0fa440d1b3fd0947bcb9be5aef6393f.6.llvm.16697874475220157172>
   35b37:      	leaq	0x90242(%rip), %rcx     # 0xc5d80 <anon.b0fa440d1b3fd0947bcb9be5aef6393f.5.llvm.16697874475220157172>
   35b3e:      	leaq	0x90223(%rip), %r8      # 0xc5d68 <anon.b0fa440d1b3fd0947bcb9be5aef6393f.4.llvm.16697874475220157172>
   35b45:      	leaq	-0x1ab2(%rbp), %rdx
   35b4c:      	movl	$0x2b, %esi
   35b51:      	callq	0xbda40 <core::result::unwrap_failed>
   35b56:      	ud2
   35b58:      	jmp	0x35b5a <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>+0x8ba>
   35b5a:      	movq	-0x38(%rbp), %rcx
   35b5e:      	movq	-0x30(%rbp), %rdx
   35b62:      	movq	%rdx, (%rcx)
   35b65:      	movq	%rax, %rdi
   35b68:      	callq	0xb86a0 <_Unwind_Resume>
   35b6d:      	int3
   35b6e:      	int3
   35b6f:      	int3

0000000000045a00 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>>:
   45a00:      	pushq	%rbp
   45a01:      	movq	%rsp, %rbp
   45a04:      	pushq	%r15
   45a06:      	pushq	%r14
   45a08:      	pushq	%r13
   45a0a:      	pushq	%r12
   45a0c:      	pushq	%rbx
   45a0d:      	subq	$0x1000, %rsp           # imm = 0x1000
   45a14:      	movq	$0x0, (%rsp)
   45a1c:      	subq	$0x1000, %rsp           # imm = 0x1000
   45a23:      	movq	$0x0, (%rsp)
   45a2b:      	subq	$0xee8, %rsp            # imm = 0xEE8
   45a32:      	movq	%rdi, -0x198(%rbp)
   45a39:      	movq	%rsi, -0x190(%rbp)
   45a40:      	movq	%rcx, -0x158(%rbp)
   45a47:      	movq	%r8, -0x150(%rbp)
   45a4e:      	movq	%rdx, -0xd8(%rbp)
   45a55:      	movq	%rdx, -0x10d0(%rbp)
   45a5c:      	leaq	-0x158(%rbp), %rax
   45a63:      	movq	%rax, -0x10c8(%rbp)
   45a6a:      	movq	$0x0, -0x10c0(%rbp)
   45a75:      	movq	$0x3e8, -0x10b8(%rbp)   # imm = 0x3E8
   45a80:      	leaq	-0x110(%rbp), %rdi
   45a87:      	leaq	-0x10d0(%rbp), %rsi
   45a8e:      	callq	0x30820 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#0}>::{closure#0}>>>::from_iter>
   45a93:      	movq	-0x110(%rbp), %rax
   45a9a:      	movq	-0x108(%rbp), %rsi
   45aa1:      	movq	-0x100(%rbp), %rcx
   45aa8:      	imulq	$0xf22, %rcx, %rdx      # imm = 0xF22
   45aaf:      	addq	%rsi, %rdx
   45ab2:      	movq	%rsi, -0x90(%rbp)
   45ab9:      	movq	%rsi, -0x88(%rbp)
   45ac0:      	movq	%rax, -0x80(%rbp)
   45ac4:      	movq	%rdx, -0x78(%rbp)
   45ac8:      	testq	%rcx, %rcx
   45acb:      	je	0x45bf1 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x1f1>
   45ad1:      	leaq	-0x2f10(%rbp), %r14
   45ad8:      	leaq	-0x10d0(%rbp), %r15
   45adf:      	leaq	-0x1ff0(%rbp), %r12
   45ae6:      	leaq	-0x1510(%rbp), %r13
   45aed:      	leaq	-0x70(%rbp), %rbx
   45af1:      	nopw	%cs:(%rax,%rax)
   45b00:      	leaq	0xf22(%rsi), %rax
   45b07:      	movq	%rax, -0x88(%rbp)
   45b0e:      	cmpb	$0x2, (%rsi)
   45b11:      	je	0x45bf1 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x1f1>
   45b17:      	addq	$0x2, %rsi
   45b1b:      	movl	$0xf20, %edx            # imm = 0xF20
   45b20:      	movq	%r14, %rdi
   45b23:      	callq	0xc4250 <memcpy>
   45b28:      	movl	$0xf20, %edx            # imm = 0xF20
   45b2d:      	movq	%r15, %rdi
   45b30:      	movq	%r14, %rsi
   45b33:      	callq	0xc4250 <memcpy>
   45b38:      	xorl	%eax, %eax
   45b3a:      	xorl	%ecx, %ecx
   45b3c:      	movq	%rbx, %rsi
   45b3f:      	cpuid
   45b41:      	xchgq	%rbx, %rsi
   45b44:      	rdtsc
   45b46:      	movl	$0xae0, %edx            # imm = 0xAE0
   45b4b:      	movq	%r12, %rdi
   45b4e:      	movq	%r15, %rsi
   45b51:      	callq	0xc4250 <memcpy>
   45b56:      	movl	$0x440, %edx            # imm = 0x440
   45b5b:      	movq	%r13, %rdi
   45b5e:      	leaq	-0x5f0(%rbp), %rsi
   45b65:      	callq	0xc4250 <memcpy>
   45b6a:      	movl	$0x440, %ecx            # imm = 0x440
   45b6f:      	movq	%rbx, %rdi
   45b72:      	movq	%r12, %rsi
   45b75:      	movq	%r13, %rdx
   45b78:      	callq	0x561e0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>
   45b7d:      	cmpb	$0x1, -0x70(%rbp)
   45b81:      	je	0x46899 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xe99>
   45b87:      	leaq	-0x6f(%rbp), %rax
   45b8b:      	movups	(%rax), %xmm0
   45b8e:      	movupd	0x10(%rax), %xmm1
   45b93:      	movapd	%xmm1, -0xc0(%rbp)
   45b9b:      	movaps	%xmm0, -0xd0(%rbp)
   45ba2:      	leaq	-0xd0(%rbp), %rax
   45ba9:      	xorpd	%xmm1, %xmm1
   45bad:      	movapd	%xmm1, -0x70(%rbp)
   45bb2:      	movaps	-0x70(%rbp), %xmm0
   45bb6:      	movaps	%xmm0, -0xd0(%rbp)
   45bbd:      	movapd	%xmm1, -0x70(%rbp)
   45bc2:      	movapd	-0x70(%rbp), %xmm0
   45bc7:      	leaq	-0xc0(%rbp), %rax
   45bce:      	movupd	%xmm0, (%rax)
   45bd2:      	xorl	%ecx, %ecx
   45bd4:      	xorl	%eax, %eax
   45bd6:      	movq	%rbx, %rsi
   45bd9:      	cpuid
   45bdb:      	xchgq	%rbx, %rsi
   45bde:      	rdtsc
   45be0:      	movq	-0x88(%rbp), %rsi
   45be7:      	cmpq	-0x78(%rbp), %rsi
   45beb:      	jne	0x45b00 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x100>
   45bf1:      	leaq	-0x90(%rbp), %rdi
   45bf8:      	callq	0x34c70 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>>
   45bfd:      	movl	$0x8, %ebx
   45c02:      	movl	$0x13880, %edi          # imm = 0x13880
   45c07:      	movl	$0x8, %esi
   45c0c:      	callq	0xbb0f0 <<core::alloc::layout::Layout>::is_size_alignment_valid>
   45c11:      	testb	%al, %al
   45c13:      	je	0x4692a <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf2a>
   45c19:      	callq	0x495f0 <__rustc::__rust_no_alloc_shim_is_unstable_v2>
   45c1e:      	movl	$0x13880, %edi          # imm = 0x13880
   45c23:      	movl	$0x8, %esi
   45c28:      	callq	0x495b0 <__rustc::__rust_alloc>
   45c2d:      	testq	%rax, %rax
   45c30:      	je	0x4692c <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf2c>
   45c36:      	movq	$0x2710, -0xf0(%rbp)    # imm = 0x2710
   45c41:      	movq	%rax, -0xe8(%rbp)
   45c48:      	movq	$0x0, -0xe0(%rbp)
   45c53:      	movl	$0x2710, %eax           # imm = 0x2710
   45c58:      	leaq	-0x10d0(%rbp), %r12
   45c5f:      	nop
   45c60:      	cmpq	$0x3e8, %rax            # imm = 0x3E8
   45c66:      	movl	$0x3e8, %ecx            # imm = 0x3E8
   45c6b:      	movq	%rax, -0x38(%rbp)
   45c6f:      	cmovbq	%rax, %rcx
   45c73:      	movq	-0xd8(%rbp), %rax
   45c7a:      	movq	%rax, -0x10d0(%rbp)
   45c81:      	leaq	-0x158(%rbp), %rax
   45c88:      	movq	%rax, -0x10c8(%rbp)
   45c8f:      	movq	$0x0, -0x10c0(%rbp)
   45c9a:      	movq	%rcx, -0x120(%rbp)
   45ca1:      	movq	%rcx, -0x10b8(%rbp)
   45ca8:      	leaq	-0x110(%rbp), %rdi
   45caf:      	movq	%r12, %rsi
   45cb2:      	callq	0x30aa0 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>>::from_iter>
   45cb7:      	movq	-0x110(%rbp), %rax
   45cbe:      	movq	-0x108(%rbp), %rsi
   45cc5:      	movq	-0x100(%rbp), %rcx
   45ccc:      	imulq	$0xf22, %rcx, %rdx      # imm = 0xF22
   45cd3:      	addq	%rsi, %rdx
   45cd6:      	movq	%rsi, -0x90(%rbp)
   45cdd:      	movq	%rsi, -0x88(%rbp)
   45ce4:      	movq	%rax, -0x80(%rbp)
   45ce8:      	movq	%rdx, -0x78(%rbp)
   45cec:      	testq	%rcx, %rcx
   45cef:      	jne	0x45d58 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x358>
   45cf1:      	leaq	-0x90(%rbp), %rdi
   45cf8:      	callq	0x34c70 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>>
   45cfd:      	movq	-0x38(%rbp), %rax
   45d01:      	subq	-0x120(%rbp), %rax
   45d08:      	jne	0x45c60 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x260>
   45d0e:      	jmp	0x45ea1 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x4a1>
   45d13:      	nopw	%cs:(%rax,%rax)
   45d20:      	movapd	-0xa0(%rbp), %xmm1
   45d28:      	movapd	%xmm1, %xmm0
   45d2c:      	unpckhpd	%xmm1, %xmm0            # xmm0 = xmm0[1],xmm1[1]
   45d30:      	addsd	%xmm1, %xmm0
   45d34:      	movq	-0xe8(%rbp), %rax
   45d3b:      	movsd	%xmm0, (%rax,%r14,8)
   45d41:      	incq	%r14
   45d44:      	movq	%r14, -0xe0(%rbp)
   45d4b:      	movq	-0x88(%rbp), %rsi
   45d52:      	cmpq	-0x78(%rbp), %rsi
   45d56:      	je	0x45cf1 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x2f1>
   45d58:      	leaq	0xf22(%rsi), %rax
   45d5f:      	movq	%rax, -0x88(%rbp)
   45d66:      	cmpb	$0x2, (%rsi)
   45d69:      	je	0x45cf1 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x2f1>
   45d6b:      	addq	$0x2, %rsi
   45d6f:      	movl	$0xf20, %edx            # imm = 0xF20
   45d74:      	leaq	-0x2f10(%rbp), %r14
   45d7b:      	movq	%r14, %rdi
   45d7e:      	callq	0xc4250 <memcpy>
   45d83:      	movl	$0xf20, %edx            # imm = 0xF20
   45d88:      	movq	%r12, %rdi
   45d8b:      	movq	%r14, %rsi
   45d8e:      	callq	0xc4250 <memcpy>
   45d93:      	xorl	%eax, %eax
   45d95:      	xorl	%ecx, %ecx
   45d97:      	movq	%rbx, %rsi
   45d9a:      	cpuid
   45d9c:      	xchgq	%rbx, %rsi
   45d9f:      	rdtsc
   45da1:      	movq	%rdx, %r15
   45da4:      	movq	%rax, %r14
   45da7:      	movl	$0xae0, %edx            # imm = 0xAE0
   45dac:      	leaq	-0x1ff0(%rbp), %rbx
   45db3:      	movq	%rbx, %rdi
   45db6:      	movq	%r12, %rsi
   45db9:      	callq	0xc4250 <memcpy>
   45dbe:      	movl	$0x440, %edx            # imm = 0x440
   45dc3:      	leaq	-0x1510(%rbp), %r13
   45dca:      	movq	%r13, %rdi
   45dcd:      	leaq	-0x5f0(%rbp), %rsi
   45dd4:      	callq	0xc4250 <memcpy>
   45dd9:      	movl	$0x440, %ecx            # imm = 0x440
   45dde:      	leaq	-0x70(%rbp), %rdi
   45de2:      	movq	%rbx, %rsi
   45de5:      	movq	%r13, %rdx
   45de8:      	callq	0x561e0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>
   45ded:      	cmpb	$0x1, -0x70(%rbp)
   45df1:      	je	0x46832 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xe32>
   45df7:      	shlq	$0x20, %r15
   45dfb:      	orq	%r15, %r14
   45dfe:      	leaq	-0x6f(%rbp), %rax
   45e02:      	movups	(%rax), %xmm0
   45e05:      	movupd	0x10(%rax), %xmm1
   45e0a:      	movapd	%xmm1, -0xc0(%rbp)
   45e12:      	movaps	%xmm0, -0xd0(%rbp)
   45e19:      	leaq	-0xd0(%rbp), %rax
   45e20:      	xorpd	%xmm1, %xmm1
   45e24:      	movapd	%xmm1, -0x70(%rbp)
   45e29:      	movaps	-0x70(%rbp), %xmm0
   45e2d:      	movaps	%xmm0, -0xd0(%rbp)
   45e34:      	movapd	%xmm1, -0x70(%rbp)
   45e39:      	movaps	-0x70(%rbp), %xmm0
   45e3d:      	leaq	-0xc0(%rbp), %rax
   45e44:      	movups	%xmm0, (%rax)
   45e47:      	xorl	%eax, %eax
   45e49:      	xorl	%ecx, %ecx
   45e4b:      	movq	%rbx, %rsi
   45e4e:      	cpuid
   45e50:      	xchgq	%rbx, %rsi
   45e53:      	rdtsc
   45e55:      	shlq	$0x20, %rdx
   45e59:      	orq	%rax, %rdx
   45e5c:      	subq	%r14, %rdx
   45e5f:      	movq	%rdx, %xmm0
   45e64:      	punpckldq	-0x372ac(%rip), %xmm0 # xmm0 = xmm0[0],mem[0],xmm0[1],mem[1]
                                                # 0xebc0 <anon.eb4e9983f1dde2da9251237d0548192c.1.llvm.16376435883611519421+0x600>
   45e6c:      	subpd	-0x373d4(%rip), %xmm0   # 0xeaa0 <anon.eb4e9983f1dde2da9251237d0548192c.1.llvm.16376435883611519421+0x4e0>
   45e74:      	movapd	%xmm0, -0xa0(%rbp)
   45e7c:      	movq	-0xe0(%rbp), %r14
   45e83:      	cmpq	-0xf0(%rbp), %r14
   45e8a:      	jne	0x45d20 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x320>
   45e90:      	leaq	-0xf0(%rbp), %rdi
   45e97:      	callq	0x35cd0 <<alloc::raw_vec::RawVec<f64>>::grow_one>
   45e9c:      	jmp	0x45d20 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x320>
   45ea1:      	movq	-0xe8(%rbp), %rbx
   45ea8:      	movq	-0xe0(%rbp), %r14
   45eaf:      	leaq	-0x2a(%rbp), %rax
   45eb3:      	movq	%rax, -0x10d0(%rbp)
   45eba:      	cmpq	$0x2, %r14
   45ebe:      	jae	0x468ce <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xece>
   45ec4:      	leaq	-0xf0(%rbp), %rax
   45ecb:      	movq	%rax, -0x10d0(%rbp)
   45ed2:      	movq	$0x0, -0x10c8(%rbp)
   45edd:      	movq	$0x64, -0x10c0(%rbp)
   45ee8:      	leaq	-0x170(%rbp), %rdi
   45eef:      	leaq	-0x10d0(%rbp), %rsi
   45ef6:      	callq	0x30be0 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter>
   45efb:      	xorpd	%xmm0, %xmm0
   45eff:      	movapd	%xmm0, -0x70(%rbp)
   45f04:      	movapd	%xmm0, -0x60(%rbp)
   45f09:      	movapd	%xmm0, -0x50(%rbp)
   45f0e:      	movapd	%xmm0, -0x10d0(%rbp)
   45f16:      	movapd	%xmm0, -0x10c0(%rbp)
   45f1e:      	movapd	%xmm0, -0x10b0(%rbp)
   45f26:      	movl	$0x12c0, %edi           # imm = 0x12C0
   45f2b:      	movl	$0x8, %esi
   45f30:      	callq	0xbb0f0 <<core::alloc::layout::Layout>::is_size_alignment_valid>
   45f35:      	testb	%al, %al
   45f37:      	je	0x46939 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf39>
   45f3d:      	callq	0x495f0 <__rustc::__rust_no_alloc_shim_is_unstable_v2>
   45f42:      	movl	$0x8, %ebx
   45f47:      	movl	$0x12c0, %edi           # imm = 0x12C0
   45f4c:      	movl	$0x8, %esi
   45f51:      	callq	0x495b0 <__rustc::__rust_alloc>
   45f56:      	testq	%rax, %rax
   45f59:      	je	0x4693b <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf3b>
   45f5f:      	xorl	%ecx, %ecx
   45f61:      	nopw	%cs:(%rax,%rax)
   45f70:      	movaps	-0x10d0(%rbp), %xmm0
   45f77:      	movaps	-0x10c0(%rbp), %xmm1
   45f7e:      	movaps	-0x10b0(%rbp), %xmm2
   45f85:      	movups	%xmm2, 0x20(%rax,%rcx)
   45f8a:      	movups	%xmm1, 0x10(%rax,%rcx)
   45f8f:      	movups	%xmm0, (%rax,%rcx)
   45f93:      	movaps	-0x10d0(%rbp), %xmm0
   45f9a:      	movaps	-0x10c0(%rbp), %xmm1
   45fa1:      	movaps	-0x10b0(%rbp), %xmm2
   45fa8:      	movups	%xmm0, 0x30(%rax,%rcx)
   45fad:      	movups	%xmm1, 0x40(%rax,%rcx)
   45fb2:      	movups	%xmm2, 0x50(%rax,%rcx)
   45fb7:      	movapd	-0x10d0(%rbp), %xmm0
   45fbf:      	movapd	-0x10c0(%rbp), %xmm1
   45fc7:      	movaps	-0x10b0(%rbp), %xmm2
   45fce:      	movupd	%xmm0, 0x60(%rax,%rcx)
   45fd4:      	movupd	%xmm1, 0x70(%rax,%rcx)
   45fda:      	movups	%xmm2, 0x80(%rax,%rcx)
   45fe2:      	addq	$0x90, %rcx
   45fe9:      	cmpq	$0x1290, %rcx           # imm = 0x1290
   45ff0:      	jne	0x45f70 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x570>
   45ff6:      	movapd	-0x10d0(%rbp), %xmm0
   45ffe:      	movapd	-0x10c0(%rbp), %xmm1
   46006:      	movapd	-0x10b0(%rbp), %xmm2
   4600e:      	movupd	%xmm2, 0x20(%rax,%rcx)
   46014:      	movupd	%xmm1, 0x10(%rax,%rcx)
   4601a:      	movupd	%xmm0, (%rax,%rcx)
   4601f:      	movq	$0x64, -0x188(%rbp)
   4602a:      	movq	%rax, -0x180(%rbp)
   46031:      	movq	$0x64, -0x178(%rbp)
   4603c:      	movq	%rax, -0x38(%rbp)
   46040:      	addq	$0x12c0, %rax           # imm = 0x12C0
   46046:      	movq	%rax, -0x120(%rbp)
   4604d:      	movl	$0xf4240, %eax          # imm = 0xF4240
   46052:      	nopw	%cs:(%rax,%rax)
   46060:      	cmpq	$0x3e8, %rax            # imm = 0x3E8
   46066:      	movl	$0x3e8, %ecx            # imm = 0x3E8
   4606b:      	movq	%rax, -0x130(%rbp)
   46072:      	cmovbq	%rax, %rcx
   46076:      	movq	-0xd8(%rbp), %rax
   4607d:      	movq	%rax, -0x10d0(%rbp)
   46084:      	leaq	-0x158(%rbp), %rax
   4608b:      	movq	%rax, -0x10c8(%rbp)
   46092:      	movq	$0x0, -0x10c0(%rbp)
   4609d:      	movq	%rcx, -0x128(%rbp)
   460a4:      	movq	%rcx, -0x10b8(%rbp)
   460ab:      	leaq	-0x148(%rbp), %rdi
   460b2:      	leaq	-0x10d0(%rbp), %rsi
   460b9:      	callq	0x30960 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#3}>::{closure#0}>>>::from_iter>
   460be:      	movq	-0x148(%rbp), %rax
   460c5:      	movq	-0x140(%rbp), %rsi
   460cc:      	movq	-0x138(%rbp), %rcx
   460d3:      	imulq	$0xf22, %rcx, %rdx      # imm = 0xF22
   460da:      	addq	%rsi, %rdx
   460dd:      	movq	%rsi, -0x110(%rbp)
   460e4:      	movq	%rsi, -0x108(%rbp)
   460eb:      	movq	%rax, -0x100(%rbp)
   460f2:      	movq	%rdx, -0xf8(%rbp)
   460f9:      	testq	%rcx, %rcx
   460fc:      	jne	0x46140 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x740>
   460fe:      	leaq	-0x110(%rbp), %rdi
   46105:      	callq	0x34c70 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>>
   4610a:      	movq	-0x130(%rbp), %rax
   46111:      	subq	-0x128(%rbp), %rax
   46118:      	jne	0x46060 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x660>
   4611e:      	jmp	0x463bd <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x9bd>
   46123:      	nopw	%cs:(%rax,%rax)
   46130:      	movq	-0x108(%rbp), %rsi
   46137:      	cmpq	-0xf8(%rbp), %rsi
   4613e:      	je	0x460fe <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x6fe>
   46140:      	leaq	0xf22(%rsi), %rax
   46147:      	movq	%rax, -0x108(%rbp)
   4614e:      	movzbl	(%rsi), %r15d
   46152:      	cmpq	$0x2, %r15
   46156:      	je	0x460fe <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x6fe>
   46158:      	addq	$0x2, %rsi
   4615c:      	movl	$0xf20, %edx            # imm = 0xF20
   46161:      	leaq	-0x2f10(%rbp), %rbx
   46168:      	movq	%rbx, %rdi
   4616b:      	callq	0xc4250 <memcpy>
   46170:      	movl	$0xf20, %edx            # imm = 0xF20
   46175:      	leaq	-0x10d0(%rbp), %r12
   4617c:      	movq	%r12, %rdi
   4617f:      	movq	%rbx, %rsi
   46182:      	callq	0xc4250 <memcpy>
   46187:      	xorl	%eax, %eax
   46189:      	xorl	%ecx, %ecx
   4618b:      	movq	%rbx, %rsi
   4618e:      	cpuid
   46190:      	xchgq	%rbx, %rsi
   46193:      	rdtsc
   46195:      	movq	%rdx, %r14
   46198:      	movq	%rax, %rbx
   4619b:      	movl	$0xae0, %edx            # imm = 0xAE0
   461a0:      	leaq	-0x1ff0(%rbp), %r13
   461a7:      	movq	%r13, %rdi
   461aa:      	movq	%r12, %rsi
   461ad:      	callq	0xc4250 <memcpy>
   461b2:      	movl	$0x440, %edx            # imm = 0x440
   461b7:      	leaq	-0x1510(%rbp), %r12
   461be:      	movq	%r12, %rdi
   461c1:      	leaq	-0x5f0(%rbp), %rsi
   461c8:      	callq	0xc4250 <memcpy>
   461cd:      	movl	$0x440, %ecx            # imm = 0x440
   461d2:      	leaq	-0xd0(%rbp), %rdi
   461d9:      	movq	%r13, %rsi
   461dc:      	movq	%r12, %rdx
   461df:      	callq	0x561e0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>
   461e4:      	cmpb	$0x1, -0xd0(%rbp)
   461eb:      	je	0x46867 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xe67>
   461f1:      	shlq	$0x20, %r14
   461f5:      	orq	%r14, %rbx
   461f8:      	leaq	-0xcf(%rbp), %rax
   461ff:      	movups	(%rax), %xmm0
   46202:      	movups	0x10(%rax), %xmm1
   46206:      	movaps	%xmm1, -0x80(%rbp)
   4620a:      	movaps	%xmm0, -0x90(%rbp)
   46211:      	leaq	-0x90(%rbp), %rax
   46218:      	xorps	%xmm1, %xmm1
   4621b:      	movaps	%xmm1, -0xd0(%rbp)
   46222:      	movaps	-0xd0(%rbp), %xmm0
   46229:      	movaps	%xmm0, -0x90(%rbp)
   46230:      	movaps	%xmm1, -0xd0(%rbp)
   46237:      	movaps	-0xd0(%rbp), %xmm0
   4623e:      	leaq	-0x80(%rbp), %rax
   46242:      	movups	%xmm0, (%rax)
   46245:      	xorl	%ecx, %ecx
   46247:      	xorl	%eax, %eax
   46249:      	movq	%rbx, %rsi
   4624c:      	cpuid
   4624e:      	xchgq	%rbx, %rsi
   46251:      	rdtsc
   46253:      	shlq	$0x20, %rdx
   46257:      	orq	%rax, %rdx
   4625a:      	subq	%rbx, %rdx
   4625d:      	movq	%rdx, %xmm0
   46262:      	punpckldq	-0x376aa(%rip), %xmm0 # xmm0 = xmm0[0],mem[0],xmm0[1],mem[1]
                                                # 0xebc0 <anon.eb4e9983f1dde2da9251237d0548192c.1.llvm.16376435883611519421+0x600>
   4626a:      	subpd	-0x377d2(%rip), %xmm0   # 0xeaa0 <anon.eb4e9983f1dde2da9251237d0548192c.1.llvm.16376435883611519421+0x4e0>
   46272:      	movapd	%xmm0, %xmm4
   46276:      	unpckhpd	%xmm0, %xmm4            # xmm4 = xmm4[1],xmm0[1]
   4627a:      	addsd	%xmm0, %xmm4
   4627e:      	movl	%r15d, %eax
   46281:      	andl	$0x1, %eax
   46284:      	movsd	-0x60(%rbp,%rax,8), %xmm0
   4628a:      	movsd	-0x70(%rbp,%rax,8), %xmm1
   46290:      	addsd	-0x37178(%rip), %xmm1   # 0xf120 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x4e0>
   46298:      	movsd	%xmm1, -0x70(%rbp,%rax,8)
   4629e:      	movapd	%xmm4, %xmm2
   462a2:      	subsd	%xmm0, %xmm2
   462a6:      	movapd	%xmm2, %xmm3
   462aa:      	divsd	%xmm1, %xmm3
   462ae:      	addsd	%xmm0, %xmm3
   462b2:      	movsd	%xmm3, -0x60(%rbp,%rax,8)
   462b8:      	movapd	%xmm4, -0xa0(%rbp)
   462c0:      	movapd	%xmm4, %xmm0
   462c4:      	subsd	%xmm3, %xmm0
   462c8:      	mulsd	%xmm2, %xmm0
   462cc:      	addsd	-0x50(%rbp,%rax,8), %xmm0
   462d2:      	movsd	%xmm0, -0x50(%rbp,%rax,8)
   462d8:      	movq	-0x168(%rbp), %rcx
   462df:      	movq	-0x160(%rbp), %rax
   462e6:      	leaq	(%rcx,%rax,8), %r8
   462ea:      	leaq	-0x1ff0(%rbp), %rdi
   462f1:      	movq	-0x38(%rbp), %rsi
   462f5:      	movq	-0x120(%rbp), %rdx
   462fc:      	callq	0x33f80 <<core::iter::adapters::zip::Zip<core::slice::iter::IterMut<crypto_constant_time::constant_time::Welch>, core::slice::iter::Iter<f64>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::IterMut<crypto_constant_time::constant_time::Welch>, core::slice::iter::Iter<f64>>>::new>
   46301:      	movq	-0x1fd0(%rbp), %rax
   46308:      	movq	-0x1fc8(%rbp), %rcx
   4630f:      	cmpq	%rcx, %rax
   46312:      	movsd	-0x371fa(%rip), %xmm4   # 0xf120 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x4e0>
   4631a:      	movapd	-0xa0(%rbp), %xmm5
   46322:      	jae	0x46130 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x730>
   46328:      	movq	-0x1ff0(%rbp), %rsi
   4632f:      	movq	-0x1fe0(%rbp), %rdx
   46336:      	andl	$0x1, %r15d
   4633a:      	movq	%rax, %rdi
   4633d:      	shlq	$0x4, %rdi
   46341:      	leaq	(%rdi,%rdi,2), %rdi
   46345:      	leaq	(%rdi,%r15,8), %rdi
   46349:      	addq	%rdi, %rsi
   4634c:      	addq	$0x20, %rsi
   46350:      	jmp	0x46370 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x970>
   46352:      	nopw	%cs:(%rax,%rax)
   46360:      	incq	%rax
   46363:      	addq	$0x30, %rsi
   46367:      	cmpq	%rax, %rcx
   4636a:      	je	0x46130 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x730>
   46370:      	movsd	(%rdx,%rax,8), %xmm0
   46375:      	ucomisd	%xmm5, %xmm0
   46379:      	jb	0x46360 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x960>
   4637b:      	movsd	-0x10(%rsi), %xmm0
   46380:      	movsd	-0x20(%rsi), %xmm1
   46385:      	addsd	%xmm4, %xmm1
   46389:      	movsd	%xmm1, -0x20(%rsi)
   4638e:      	movapd	%xmm5, %xmm2
   46392:      	subsd	%xmm0, %xmm2
   46396:      	movapd	%xmm2, %xmm3
   4639a:      	divsd	%xmm1, %xmm3
   4639e:      	addsd	%xmm0, %xmm3
   463a2:      	movsd	%xmm3, -0x10(%rsi)
   463a7:      	movapd	%xmm5, %xmm0
   463ab:      	subsd	%xmm3, %xmm0
   463af:      	mulsd	%xmm2, %xmm0
   463b3:      	addsd	(%rsi), %xmm0
   463b7:      	movsd	%xmm0, (%rsi)
   463bb:      	jmp	0x46360 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x960>
   463bd:      	movsd	-0x60(%rbp), %xmm0
   463c2:      	subsd	-0x58(%rbp), %xmm0
   463c7:      	movapd	%xmm0, -0x120(%rbp)
   463cf:      	movsd	-0x50(%rbp), %xmm0
   463d4:      	movsd	%xmm0, -0xa0(%rbp)
   463dc:      	movsd	-0x70(%rbp), %xmm0
   463e1:      	movsd	%xmm0, -0x128(%rbp)
   463e9:      	movsd	-0x68(%rbp), %xmm0
   463ee:      	movsd	%xmm0, -0x130(%rbp)
   463f6:      	movsd	-0x48(%rbp), %xmm0
   463fb:      	movsd	%xmm0, -0xd8(%rbp)
   46403:      	movl	$0x3, %edi
   46408:      	movl	$0x1, %esi
   4640d:      	callq	0xbb0f0 <<core::alloc::layout::Layout>::is_size_alignment_valid>
   46412:      	testb	%al, %al
   46414:      	je	0x4694a <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf4a>
   4641a:      	callq	0x495f0 <__rustc::__rust_no_alloc_shim_is_unstable_v2>
   4641f:      	movl	$0x1, %ebx
   46424:      	movl	$0x3, %edi
   46429:      	movl	$0x1, %esi
   4642e:      	callq	0x495b0 <__rustc::__rust_alloc>
   46433:      	testq	%rax, %rax
   46436:      	je	0x4694c <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf4c>
   4643c:      	leaq	-0x361b7(%rip), %rcx    # 0x1028c <anon.c0f308983206626af30a745d03c91a10.7.llvm.12480394386067567631+0x197>
   46443:      	movq	%rax, %rdx
   46446:      	subq	%rcx, %rdx
   46449:      	subq	%rax, %rcx
   4644c:      	cmovbq	%rdx, %rcx
   46450:      	cmpq	$0x2, %rcx
   46454:      	jbe	0x468fc <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xefc>
   4645a:      	movsd	-0x3738a(%rip), %xmm5   # 0xf0d8 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x498>
   46462:      	movsd	-0x128(%rbp), %xmm2
   4646a:      	movapd	%xmm2, %xmm0
   4646e:      	addsd	%xmm5, %xmm0
   46472:      	movsd	-0xa0(%rbp), %xmm1
   4647a:      	divsd	%xmm0, %xmm1
   4647e:      	divsd	%xmm2, %xmm1
   46482:      	movsd	-0x130(%rbp), %xmm3
   4648a:      	movapd	%xmm3, %xmm0
   4648e:      	addsd	%xmm5, %xmm0
   46492:      	movsd	-0xd8(%rbp), %xmm2
   4649a:      	divsd	%xmm0, %xmm2
   4649e:      	divsd	%xmm3, %xmm2
   464a2:      	addsd	%xmm1, %xmm2
   464a6:      	xorps	%xmm0, %xmm0
   464a9:      	sqrtsd	%xmm2, %xmm0
   464ad:      	movapd	-0x120(%rbp), %xmm1
   464b5:      	divsd	%xmm0, %xmm1
   464b9:      	movapd	-0x37a01(%rip), %xmm4   # 0xeac0 <anon.eb4e9983f1dde2da9251237d0548192c.1.llvm.16376435883611519421+0x500>
   464c1:      	movapd	%xmm1, -0x120(%rbp)
   464c9:      	andpd	%xmm1, %xmm4
   464cd:      	movb	$0x77, 0x2(%rax)
   464d1:      	movw	$0x6172, (%rax)         # imm = 0x6172
   464d6:      	movsd	%xmm4, -0xd0(%rbp)
   464de:      	movq	$0x3, -0x1ff0(%rbp)
   464e9:      	movq	%rax, -0x1fe8(%rbp)
   464f0:      	movq	$0x3, -0x1fe0(%rbp)
   464fb:      	movq	-0x168(%rbp), %rbx
   46502:      	movq	-0x160(%rbp), %r12
   46509:      	movl	$0x28, %r14d
   4650f:      	xorl	%r13d, %r13d
   46512:      	movsd	-0x37362(%rip), %xmm6   # 0xf1b8 <anon.38808e0998af18ea2dab9aba4957194f.5.llvm.12287912318127236922+0x8>
   4651a:      	movapd	-0x37a62(%rip), %xmm7   # 0xeac0 <anon.eb4e9983f1dde2da9251237d0548192c.1.llvm.16376435883611519421+0x500>
   46522:      	movq	0x82e97(%rip), %r15     # 0xc93c0
   46529:      	movq	-0x38(%rbp), %rax
   4652d:      	jmp	0x46548 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xb48>
   4652f:      	nop
   46530:      	addq	$0x8, %rbx
   46534:      	addq	$0x30, %r14
   46538:      	incq	%r13
   4653b:      	cmpq	$0x12e8, %r14           # imm = 0x12E8
   46542:      	je	0x466a2 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xca2>
   46548:      	movq	%r13, -0x1510(%rbp)
   4654f:      	movsd	-0x28(%rax,%r14), %xmm1
   46556:      	ucomisd	%xmm6, %xmm1
   4655a:      	jb	0x46530 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xb30>
   4655c:      	movsd	-0x20(%rax,%r14), %xmm0
   46563:      	ucomisd	%xmm6, %xmm0
   46567:      	jb	0x46530 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xb30>
   46569:      	movsd	-0x18(%rax,%r14), %xmm8
   46570:      	subsd	-0x10(%rax,%r14), %xmm8
   46577:      	movsd	-0x8(%rax,%r14), %xmm2
   4657e:      	movapd	%xmm1, %xmm3
   46582:      	addsd	%xmm5, %xmm3
   46586:      	divsd	%xmm3, %xmm2
   4658a:      	divsd	%xmm1, %xmm2
   4658e:      	movsd	(%rax,%r14), %xmm1
   46594:      	movapd	%xmm0, %xmm3
   46598:      	addsd	%xmm5, %xmm3
   4659c:      	divsd	%xmm3, %xmm1
   465a0:      	divsd	%xmm0, %xmm1
   465a4:      	addsd	%xmm2, %xmm1
   465a8:      	xorps	%xmm0, %xmm0
   465ab:      	sqrtsd	%xmm1, %xmm0
   465af:      	divsd	%xmm0, %xmm8
   465b4:      	andpd	%xmm7, %xmm8
   465b9:      	ucomisd	%xmm4, %xmm8
   465be:      	jbe	0x46530 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xb30>
   465c4:      	movapd	%xmm8, -0xa0(%rbp)
   465cd:      	cmpq	%r12, %r13
   465d0:      	jae	0x46916 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf16>
   465d6:      	leaq	-0x1510(%rbp), %rax
   465dd:      	movq	%rax, -0x10d0(%rbp)
   465e4:      	movq	0x82ded(%rip), %rax     # 0xc93d8
   465eb:      	movq	%rax, -0x10c8(%rbp)
   465f2:      	movq	%rbx, -0x10c0(%rbp)
   465f9:      	movq	%r15, -0x10b8(%rbp)
   46600:      	leaq	-0x2f10(%rbp), %rdi
   46607:      	leaq	-0x3939d(%rip), %rsi    # 0xd271 <anon.a8d4cb48e80d1537384fa053ec1399dc.0.llvm.3836435584527032447+0xdc>
   4660e:      	leaq	-0x10d0(%rbp), %rdx
   46615:      	callq	0xba270 <alloc::fmt::format::format_inner>
   4661a:      	movups	-0x2f10(%rbp), %xmm0
   46621:      	movaps	%xmm0, -0x1b0(%rbp)
   46628:      	movq	-0x2f00(%rbp), %rax
   4662f:      	movq	%rax, -0x1a0(%rbp)
   46636:      	movaps	-0xa0(%rbp), %xmm0
   4663d:      	movsd	%xmm0, -0xd0(%rbp)
   46645:      	movl	$0x1, %esi
   4664a:      	movl	$0x1, %edx
   4664f:      	leaq	-0x1ff0(%rbp), %rdi
   46656:      	callq	0x35c00 <<alloc::raw_vec::RawVecInner>::deallocate>
   4665b:      	movq	-0x1a0(%rbp), %rax
   46662:      	movq	%rax, -0x1fe0(%rbp)
   46669:      	movapd	-0x1b0(%rbp), %xmm0
   46671:      	movapd	%xmm0, -0x1ff0(%rbp)
   46679:      	movapd	-0xa0(%rbp), %xmm4
   46681:      	movq	-0x38(%rbp), %rax
   46685:      	movsd	-0x375b5(%rip), %xmm5   # 0xf0d8 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x498>
   4668d:      	movsd	-0x374dd(%rip), %xmm6   # 0xf1b8 <anon.38808e0998af18ea2dab9aba4957194f.5.llvm.12287912318127236922+0x8>
   46695:      	movapd	-0x37bdd(%rip), %xmm7   # 0xeac0 <anon.eb4e9983f1dde2da9251237d0548192c.1.llvm.16376435883611519421+0x500>
   4669d:      	jmp	0x46530 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xb30>
   466a2:      	movsd	-0x374fa(%rip), %xmm0   # 0xf1b0 <anon.38808e0998af18ea2dab9aba4957194f.5.llvm.12287912318127236922>
   466aa:      	xorl	%eax, %eax
   466ac:      	ucomisd	%xmm4, %xmm0
   466b0:      	seta	%al
   466b3:      	leaq	-0x363de(%rip), %rcx    # 0x102dc <anon.c0f308983206626af30a745d03c91a10.7.llvm.12480394386067567631+0x1e7>
   466ba:      	leaq	-0x36432(%rip), %rdx    # 0x1028f <anon.c0f308983206626af30a745d03c91a10.7.llvm.12480394386067567631+0x19a>
   466c1:      	cmovaq	%rcx, %rdx
   466c5:      	xorq	$0x5, %rax
   466c9:      	movq	%rdx, -0x2f10(%rbp)
   466d0:      	movq	%rax, -0x2f08(%rbp)
   466d7:      	movapd	-0x120(%rbp), %xmm0
   466df:      	movsd	%xmm0, -0x1510(%rbp)
   466e7:      	leaq	-0x198(%rbp), %rax
   466ee:      	movq	%rax, -0x10d0(%rbp)
   466f5:      	leaq	-0x14b6c(%rip), %rax    # 0x31b90 <<&str as core::fmt::Display>::fmt>
   466fc:      	movq	%rax, -0x10c8(%rbp)
   46703:      	leaq	-0x2f10(%rbp), %rcx
   4670a:      	movq	%rcx, -0x10c0(%rbp)
   46711:      	movq	%rax, -0x10b8(%rbp)
   46718:      	leaq	-0xd0(%rbp), %rax
   4671f:      	movq	%rax, -0x10b0(%rbp)
   46726:      	movq	%r15, -0x10a8(%rbp)
   4672d:      	leaq	-0x1ff0(%rbp), %rax
   46734:      	movq	%rax, -0x10a0(%rbp)
   4673b:      	leaq	0x2c8e(%rip), %rax      # 0x493d0 <<alloc::string::String as core::fmt::Display>::fmt>
   46742:      	movq	%rax, -0x1098(%rbp)
   46749:      	leaq	-0x1510(%rbp), %rax
   46750:      	movq	%rax, -0x1090(%rbp)
   46757:      	movq	%r15, -0x1088(%rbp)
   4675e:      	leaq	-0x70(%rbp), %rax
   46762:      	movq	%rax, -0x1080(%rbp)
   46769:      	movq	%r15, -0x1078(%rbp)
   46770:      	leaq	-0x68(%rbp), %rax
   46774:      	movq	%rax, -0x1070(%rbp)
   4677b:      	movq	%r15, -0x1068(%rbp)
   46782:      	leaq	-0x60(%rbp), %rax
   46786:      	movq	%rax, -0x1060(%rbp)
   4678d:      	movq	%r15, -0x1058(%rbp)
   46794:      	leaq	-0x58(%rbp), %rax
   46798:      	movq	%rax, -0x1050(%rbp)
   4679f:      	movq	%r15, -0x1048(%rbp)
   467a6:      	leaq	-0x364a1(%rip), %rdi    # 0x1030c <anon.c0f308983206626af30a745d03c91a10.7.llvm.12480394386067567631+0x217>
   467ad:      	leaq	-0x10d0(%rbp), %rsi
   467b4:      	movapd	%xmm4, -0xa0(%rbp)
   467bc:      	callq	0x928f0 <std::io::stdio::_print>
   467c1:      	leaq	-0x1ff0(%rbp), %rdi
   467c8:      	movl	$0x1, %esi
   467cd:      	movl	$0x1, %edx
   467d2:      	callq	0x35c00 <<alloc::raw_vec::RawVecInner>::deallocate>
   467d7:      	leaq	-0x188(%rbp), %rdi
   467de:      	movl	$0x8, %esi
   467e3:      	movl	$0x30, %edx
   467e8:      	callq	0x35c00 <<alloc::raw_vec::RawVecInner>::deallocate>
   467ed:      	leaq	-0x170(%rbp), %rdi
   467f4:      	movl	$0x8, %esi
   467f9:      	movl	$0x8, %edx
   467fe:      	callq	0x35c00 <<alloc::raw_vec::RawVecInner>::deallocate>
   46803:      	leaq	-0xf0(%rbp), %rdi
   4680a:      	movl	$0x8, %esi
   4680f:      	movl	$0x8, %edx
   46814:      	callq	0x35c00 <<alloc::raw_vec::RawVecInner>::deallocate>
   46819:      	movaps	-0xa0(%rbp), %xmm0
   46820:      	addq	$0x2ee8, %rsp           # imm = 0x2EE8
   46827:      	popq	%rbx
   46828:      	popq	%r12
   4682a:      	popq	%r13
   4682c:      	popq	%r14
   4682e:      	popq	%r15
   46830:      	popq	%rbp
   46831:      	retq
   46832:      	movzbl	-0x6f(%rbp), %eax
   46836:      	movb	%al, -0x148(%rbp)
   4683c:      	leaq	-0x36385(%rip), %rdi    # 0x104be <anon.c0f308983206626af30a745d03c91a10.7.llvm.12480394386067567631+0x3c9>
   46843:      	leaq	0x7f74e(%rip), %rcx     # 0xc5f98 <anon.c0f308983206626af30a745d03c91a10.4.llvm.12480394386067567631+0x198>
   4684a:      	leaq	0x7f72f(%rip), %r8      # 0xc5f80 <anon.c0f308983206626af30a745d03c91a10.4.llvm.12480394386067567631+0x180>
   46851:      	leaq	-0x148(%rbp), %rdx
   46858:      	movl	$0x2b, %esi
   4685d:      	callq	0xbda40 <core::result::unwrap_failed>
   46862:      	jmp	0x46959 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf59>
   46867:      	movzbl	-0xcf(%rbp), %eax
   4686e:      	movb	%al, -0x29(%rbp)
   46871:      	leaq	-0x363ba(%rip), %rdi    # 0x104be <anon.c0f308983206626af30a745d03c91a10.7.llvm.12480394386067567631+0x3c9>
   46878:      	leaq	0x7f719(%rip), %rcx     # 0xc5f98 <anon.c0f308983206626af30a745d03c91a10.4.llvm.12480394386067567631+0x198>
   4687f:      	leaq	0x7f6fa(%rip), %r8      # 0xc5f80 <anon.c0f308983206626af30a745d03c91a10.4.llvm.12480394386067567631+0x180>
   46886:      	leaq	-0x29(%rbp), %rdx
   4688a:      	movl	$0x2b, %esi
   4688f:      	callq	0xbda40 <core::result::unwrap_failed>
   46894:      	jmp	0x46959 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf59>
   46899:      	movzbl	-0x6f(%rbp), %eax
   4689d:      	movb	%al, -0x148(%rbp)
   468a3:      	leaq	-0x363ec(%rip), %rdi    # 0x104be <anon.c0f308983206626af30a745d03c91a10.7.llvm.12480394386067567631+0x3c9>
   468aa:      	leaq	0x7f6e7(%rip), %rcx     # 0xc5f98 <anon.c0f308983206626af30a745d03c91a10.4.llvm.12480394386067567631+0x198>
   468b1:      	leaq	0x7f6c8(%rip), %r8      # 0xc5f80 <anon.c0f308983206626af30a745d03c91a10.4.llvm.12480394386067567631+0x180>
   468b8:      	leaq	-0x148(%rbp), %rdx
   468bf:      	movl	$0x2b, %esi
   468c4:      	callq	0xbda40 <core::result::unwrap_failed>
   468c9:      	jmp	0x46959 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf59>
   468ce:      	cmpq	$0x15, %r14
   468d2:      	jae	0x4695b <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf5b>
   468d8:      	shlq	$0x3, %r14
   468dc:      	movl	$0x8, %r15d
   468e2:      	leaq	(%rbx,%r15), %rsi
   468e6:      	movq	%rbx, %rdi
   468e9:      	callq	0x34040 <core::slice::sort::shared::smallsort::insert_tail::<f64, <[f64]>::sort_by<<f64>::total_cmp>::{closure#0}> (.llvm.822523245422478337)>
   468ee:      	addq	$0x8, %r15
   468f2:      	cmpq	%r15, %r14
   468f5:      	jne	0x468e2 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xee2>
   468f7:      	jmp	0x45ec4 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x4c4>
   468fc:      	leaq	-0x3641a(%rip), %rdi    # 0x104e9 <anon.c0f308983206626af30a745d03c91a10.7.llvm.12480394386067567631+0x3f4>
   46903:      	leaq	0x7f53e(%rip), %rcx     # 0xc5e48 <anon.c0f308983206626af30a745d03c91a10.4.llvm.12480394386067567631+0x48>
   4690a:      	movl	$0x237, %esi            # imm = 0x237
   4690f:      	xorl	%edx, %edx
   46911:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   46916:      	leaq	0x7f513(%rip), %rdx     # 0xc5e30 <anon.c0f308983206626af30a745d03c91a10.4.llvm.12480394386067567631+0x30>
   4691d:      	movq	%r13, %rdi
   46920:      	movq	%r12, %rsi
   46923:      	callq	0xbdacd <core::panicking::panic_bounds_check>
   46928:      	jmp	0x46959 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf59>
   4692a:      	xorl	%ebx, %ebx
   4692c:      	movl	$0x13880, %esi          # imm = 0x13880
   46931:      	movq	%rbx, %rdi
   46934:      	callq	0xba112 <alloc::raw_vec::handle_error>
   46939:      	xorl	%ebx, %ebx
   4693b:      	movl	$0x12c0, %esi           # imm = 0x12C0
   46940:      	movq	%rbx, %rdi
   46943:      	callq	0xba112 <alloc::raw_vec::handle_error>
   46948:      	jmp	0x46959 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf59>
   4694a:      	xorl	%ebx, %ebx
   4694c:      	movl	$0x3, %esi
   46951:      	movq	%rbx, %rdi
   46954:      	callq	0xba112 <alloc::raw_vec::handle_error>
   46959:      	ud2
   4695b:      	leaq	-0x10d0(%rbp), %rdx
   46962:      	movq	%rbx, %rdi
   46965:      	movq	%r14, %rsi
   46968:      	callq	0x2c5b0 <core::slice::sort::stable::driftsort_main::<f64, <[f64]>::sort_by<<f64>::total_cmp>::{closure#0}, alloc::vec::Vec<f64>>>
   4696d:      	jmp	0x45ec4 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x4c4>
   46972:      	jmp	0x469a4 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xfa4>
   46974:      	jmp	0x469a4 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xfa4>
   46976:      	movq	%rax, %rbx
   46979:      	jmp	0x469d8 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xfd8>
   4697b:      	movq	%rax, %rbx
   4697e:      	jmp	0x469ee <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xfee>
   46980:      	jmp	0x46982 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf82>
   46982:      	movq	%rax, %rbx
   46985:      	leaq	-0x1ff0(%rbp), %rdi
   4698c:      	movl	$0x1, %esi
   46991:      	movl	$0x1, %edx
   46996:      	callq	0x35c00 <<alloc::raw_vec::RawVecInner>::deallocate>
   4699b:      	jmp	0x469d8 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xfd8>
   4699d:      	jmp	0x469ad <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xfad>
   4699f:      	movq	%rax, %rbx
   469a2:      	jmp	0x469d8 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xfd8>
   469a4:      	movq	%rax, %rbx
   469a7:      	jmp	0x46a1a <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x101a>
   469a9:      	jmp	0x46a0b <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x100b>
   469ab:      	jmp	0x469c9 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xfc9>
   469ad:      	movq	%rax, %rbx
   469b0:      	leaq	-0x90(%rbp), %rdi
   469b7:      	callq	0x34c70 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>>
   469bc:      	movq	%rbx, %rdi
   469bf:      	callq	0xb86a0 <_Unwind_Resume>
   469c4:      	callq	0xbdaba <core::panicking::panic_in_cleanup>
   469c9:      	movq	%rax, %rbx
   469cc:      	leaq	-0x110(%rbp), %rdi
   469d3:      	callq	0x34c70 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>>
   469d8:      	leaq	-0x188(%rbp), %rdi
   469df:      	movl	$0x8, %esi
   469e4:      	movl	$0x30, %edx
   469e9:      	callq	0x35c00 <<alloc::raw_vec::RawVecInner>::deallocate>
   469ee:      	leaq	-0x170(%rbp), %rdi
   469f5:      	movl	$0x8, %esi
   469fa:      	movl	$0x8, %edx
   469ff:      	callq	0x35c00 <<alloc::raw_vec::RawVecInner>::deallocate>
   46a04:      	jmp	0x46a1a <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x101a>
   46a06:      	callq	0xbdaba <core::panicking::panic_in_cleanup>
   46a0b:      	movq	%rax, %rbx
   46a0e:      	leaq	-0x90(%rbp), %rdi
   46a15:      	callq	0x34c70 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>>
   46a1a:      	leaq	-0xf0(%rbp), %rdi
   46a21:      	movl	$0x8, %esi
   46a26:      	movl	$0x8, %edx
   46a2b:      	callq	0x35c00 <<alloc::raw_vec::RawVecInner>::deallocate>
   46a30:      	movq	%rbx, %rdi
   46a33:      	callq	0xb86a0 <_Unwind_Resume>
   46a38:      	callq	0xbdaba <core::panicking::panic_in_cleanup>
   46a3d:      	int3
   46a3e:      	int3
   46a3f:      	int3

00000000000496f0 <<toyos_crypto::keccak::Sponge>::new>:
   496f0:      	pushq	%rbp
   496f1:      	movq	%rsp, %rbp
   496f4:      	pushq	%r15
   496f6:      	pushq	%r14
   496f8:      	pushq	%r13
   496fa:      	pushq	%r12
   496fc:      	pushq	%rbx
   496fd:      	subq	$0x108, %rsp            # imm = 0x108
   49704:      	movq	%rcx, %r12
   49707:      	movq	%rdi, %r14
   4970a:      	cmpq	$0x48, %rsi
   4970e:      	je	0x49726 <<toyos_crypto::keccak::Sponge>::new+0x36>
   49710:      	cmpq	$0x88, %rsi
   49717:      	je	0x49726 <<toyos_crypto::keccak::Sponge>::new+0x36>
   49719:      	cmpq	$0xa8, %rsi
   49720:      	jne	0x499a0 <<toyos_crypto::keccak::Sponge>::new+0x2b0>
   49726:      	xorps	%xmm0, %xmm0
   49729:      	movaps	%xmm0, -0x80(%rbp)
   4972d:      	movaps	%xmm0, -0x90(%rbp)
   49734:      	movaps	%xmm0, -0xa0(%rbp)
   4973b:      	movaps	%xmm0, -0xb0(%rbp)
   49742:      	movaps	%xmm0, -0xc0(%rbp)
   49749:      	movaps	%xmm0, -0xd0(%rbp)
   49750:      	movaps	%xmm0, -0xe0(%rbp)
   49757:      	movaps	%xmm0, -0xf0(%rbp)
   4975e:      	movaps	%xmm0, -0x100(%rbp)
   49765:      	movaps	%xmm0, -0x110(%rbp)
   4976c:      	movaps	%xmm0, -0x120(%rbp)
   49773:      	movaps	%xmm0, -0x130(%rbp)
   4977a:      	movq	$0x0, -0x70(%rbp)
   49782:      	movq	%rsi, -0x68(%rbp)
   49786:      	movq	$0x0, -0x60(%rbp)
   4978e:      	testq	%r8, %r8
   49791:      	je	0x498e8 <<toyos_crypto::keccak::Sponge>::new+0x1f8>
   49797:      	movl	%edx, -0x2c(%rbp)
   4979a:      	movq	%rsi, -0x40(%rbp)
   4979e:      	movq	%r14, -0x48(%rbp)
   497a2:      	shlq	$0x4, %r8
   497a6:      	addq	%r12, %r8
   497a9:      	movq	%r8, -0x50(%rbp)
   497ad:      	xorl	%ecx, %ecx
   497af:      	leaq	-0x130(%rbp), %r15
   497b6:      	leaq	0x7c923(%rip), %rax     # 0xc60e0 <anon.1fd67189aac25b0b46092a5d2fc7dafa.7.llvm.13947057786405079061+0x60>
   497bd:      	movq	%rax, -0x38(%rbp)
   497c1:      	jmp	0x497de <<toyos_crypto::keccak::Sponge>::new+0xee>
   497c3:      	nopw	%cs:(%rax,%rax)
   497d0:      	addq	$0x10, %r12
   497d4:      	cmpq	-0x50(%rbp), %r12
   497d8:      	je	0x49899 <<toyos_crypto::keccak::Sponge>::new+0x1a9>
   497de:      	movq	0x8(%r12), %rdx
   497e3:      	testq	%rdx, %rdx
   497e6:      	je	0x497d0 <<toyos_crypto::keccak::Sponge>::new+0xe0>
   497e8:      	movq	(%r12), %r14
   497ec:      	jmp	0x497fb <<toyos_crypto::keccak::Sponge>::new+0x10b>
   497ee:      	nop
   497f0:      	addq	%rbx, %r14
   497f3:      	movq	%r13, %rdx
   497f6:      	testq	%r13, %r13
   497f9:      	je	0x497d0 <<toyos_crypto::keccak::Sponge>::new+0xe0>
   497fb:      	testb	$0x7, %cl
   497fe:      	jne	0x49830 <<toyos_crypto::keccak::Sponge>::new+0x140>
   49800:      	cmpq	$0x8, %rdx
   49804:      	jb	0x49830 <<toyos_crypto::keccak::Sponge>::new+0x140>
   49806:      	cmpq	$0xc7, %rcx
   4980d:      	ja	0x49970 <<toyos_crypto::keccak::Sponge>::new+0x280>
   49813:      	movq	(%r14), %rax
   49816:      	xorq	%rax, -0x130(%rbp,%rcx)
   4981e:      	movl	$0x8, %ebx
   49823:      	jmp	0x4985b <<toyos_crypto::keccak::Sponge>::new+0x16b>
   49825:      	nopw	%cs:(%rax,%rax)
   49830:      	movq	%rcx, %rdi
   49833:      	shrq	$0x3, %rdi
   49837:      	cmpq	$0xc7, %rcx
   4983e:      	ja	0x49982 <<toyos_crypto::keccak::Sponge>::new+0x292>
   49844:      	movzbl	(%r14), %eax
   49848:      	shll	$0x3, %ecx
   4984b:      	shlq	%cl, %rax
   4984e:      	xorq	%rax, -0x130(%rbp,%rdi,8)
   49856:      	movl	$0x1, %ebx
   4985b:      	movq	%rdx, %r13
   4985e:      	subq	%rbx, %r13
   49861:      	jb	0x4994e <<toyos_crypto::keccak::Sponge>::new+0x25e>
   49867:      	movq	-0x60(%rbp), %rcx
   4986b:      	addq	%rbx, %rcx
   4986e:      	jb	0x49962 <<toyos_crypto::keccak::Sponge>::new+0x272>
   49874:      	movq	%rcx, -0x60(%rbp)
   49878:      	cmpq	-0x68(%rbp), %rcx
   4987c:      	jne	0x497f0 <<toyos_crypto::keccak::Sponge>::new+0x100>
   49882:      	movq	%r15, %rdi
   49885:      	callq	0x4a0f0 <toyos_crypto::keccak::permute (.llvm.13947057786405079061)>
   4988a:      	movq	$0x0, -0x60(%rbp)
   49892:      	xorl	%ecx, %ecx
   49894:      	jmp	0x497f0 <<toyos_crypto::keccak::Sponge>::new+0x100>
   49899:      	movq	%rcx, %rdi
   4989c:      	shrq	$0x3, %rdi
   498a0:      	cmpq	$0xc7, %rcx
   498a7:      	ja	0x49982 <<toyos_crypto::keccak::Sponge>::new+0x292>
   498ad:      	shll	$0x3, %ecx
   498b0:      	movzbl	-0x2c(%rbp), %eax
   498b4:      	shlq	%cl, %rax
   498b7:      	xorq	%rax, -0x130(%rbp,%rdi,8)
   498bf:      	movq	-0x40(%rbp), %rax
   498c3:      	testq	%rax, %rax
   498c6:      	movq	-0x48(%rbp), %r14
   498ca:      	je	0x49992 <<toyos_crypto::keccak::Sponge>::new+0x2a2>
   498d0:      	leaq	-0x1(%rax), %rcx
   498d4:      	movq	%rcx, %rdi
   498d7:      	shrq	$0x3, %rdi
   498db:      	cmpq	$0xc9, %rax
   498e1:      	jb	0x498ff <<toyos_crypto::keccak::Sponge>::new+0x20f>
   498e3:      	jmp	0x49982 <<toyos_crypto::keccak::Sponge>::new+0x292>
   498e8:      	movzbl	%dl, %eax
   498eb:      	movq	%rax, -0x130(%rbp)
   498f2:      	decq	%rsi
   498f5:      	movq	%rsi, %rdi
   498f8:      	shrq	$0x3, %rdi
   498fc:      	movq	%rsi, %rcx
   498ff:      	shll	$0x3, %ecx
   49902:      	movl	$0x80, %eax
   49907:      	shlq	%cl, %rax
   4990a:      	xorq	%rax, -0x130(%rbp,%rdi,8)
   49912:      	leaq	-0x130(%rbp), %rbx
   49919:      	movq	%rbx, %rdi
   4991c:      	callq	0x4a0f0 <toyos_crypto::keccak::permute (.llvm.13947057786405079061)>
   49921:      	movq	$0x0, -0x60(%rbp)
   49929:      	movl	$0xd8, %edx
   4992e:      	movq	%r14, %rdi
   49931:      	movq	%rbx, %rsi
   49934:      	callq	0xc4250 <memcpy>
   49939:      	movq	%r14, %rax
   4993c:      	addq	$0x108, %rsp            # imm = 0x108
   49943:      	popq	%rbx
   49944:      	popq	%r12
   49946:      	popq	%r13
   49948:      	popq	%r14
   4994a:      	popq	%r15
   4994c:      	popq	%rbp
   4994d:      	retq
   4994e:      	leaq	0x7c75b(%rip), %rcx     # 0xc60b0 <anon.1fd67189aac25b0b46092a5d2fc7dafa.7.llvm.13947057786405079061+0x30>
   49955:      	movq	%rbx, %rdi
   49958:      	movq	%rdx, %rsi
   4995b:      	callq	0xbe560 <core::slice::index::slice_index_fail>
   49960:      	jmp	0x4999e <<toyos_crypto::keccak::Sponge>::new+0x2ae>
   49962:      	leaq	0x7c75f(%rip), %rdi     # 0xc60c8 <anon.1fd67189aac25b0b46092a5d2fc7dafa.7.llvm.13947057786405079061+0x48>
   49969:      	callq	0xbe870 <core::panicking::panic_const::panic_const_add_overflow>
   4996e:      	jmp	0x4999e <<toyos_crypto::keccak::Sponge>::new+0x2ae>
   49970:      	shrq	$0x3, %rcx
   49974:      	leaq	0x7c71d(%rip), %rax     # 0xc6098 <anon.1fd67189aac25b0b46092a5d2fc7dafa.7.llvm.13947057786405079061+0x18>
   4997b:      	movq	%rax, -0x38(%rbp)
   4997f:      	movq	%rcx, %rdi
   49982:      	movl	$0x19, %esi
   49987:      	movq	-0x38(%rbp), %rdx
   4998b:      	callq	0xbdacd <core::panicking::panic_bounds_check>
   49990:      	jmp	0x4999e <<toyos_crypto::keccak::Sponge>::new+0x2ae>
   49992:      	leaq	0x7c69f(%rip), %rdi     # 0xc6038 <anon.6cc4159c997fb1fe88462a0393e0f2a1.2.llvm.2134392181110068913+0x30>
   49999:      	callq	0xbe8b0 <core::panicking::panic_const::panic_const_sub_overflow>
   4999e:      	ud2
   499a0:      	leaq	-0x39019(%rip), %rdi    # 0x1098e <anon.1fd67189aac25b0b46092a5d2fc7dafa.1.llvm.13947057786405079061+0x9>
   499a7:      	leaq	0x7c672(%rip), %rdx     # 0xc6020 <anon.6cc4159c997fb1fe88462a0393e0f2a1.2.llvm.2134392181110068913+0x18>
   499ae:      	movl	$0x30, %esi
   499b3:      	callq	0xbdc70 <core::panicking::panic>
   499b8:      	movq	$0x0, -0x130(%rbp)
   499c3:      	movq	$0x0, -0x128(%rbp)
   499ce:      	movq	$0x0, -0x120(%rbp)
   499d9:      	movq	$0x0, -0x118(%rbp)
   499e4:      	movq	$0x0, -0x110(%rbp)
   499ef:      	movq	$0x0, -0x108(%rbp)
   499fa:      	movq	$0x0, -0x100(%rbp)
   49a05:      	movq	$0x0, -0xf8(%rbp)
   49a10:      	movq	$0x0, -0xf0(%rbp)
   49a1b:      	movq	$0x0, -0xe8(%rbp)
   49a26:      	movq	$0x0, -0xe0(%rbp)
   49a31:      	movq	$0x0, -0xd8(%rbp)
   49a3c:      	movq	$0x0, -0xd0(%rbp)
   49a47:      	movq	$0x0, -0xc8(%rbp)
   49a52:      	movq	$0x0, -0xc0(%rbp)
   49a5d:      	movq	$0x0, -0xb8(%rbp)
   49a68:      	movq	$0x0, -0xb0(%rbp)
   49a73:      	movq	$0x0, -0xa8(%rbp)
   49a7e:      	movq	$0x0, -0xa0(%rbp)
   49a89:      	movq	$0x0, -0x98(%rbp)
   49a94:      	movq	$0x0, -0x90(%rbp)
   49a9f:      	movq	$0x0, -0x88(%rbp)
   49aaa:      	movq	$0x0, -0x80(%rbp)
   49ab2:      	movq	$0x0, -0x78(%rbp)
   49aba:      	movq	$0x0, -0x70(%rbp)
   49ac2:      	movq	%rax, %rdi
   49ac5:      	callq	0xb86a0 <_Unwind_Resume>
   49aca:      	int3
   49acb:      	int3
   49acc:      	int3
   49acd:      	int3
   49ace:      	int3
   49acf:      	int3

0000000000049ad0 <<toyos_crypto::keccak::Sponge>::read>:
   49ad0:      	pushq	%rbp
   49ad1:      	movq	%rsp, %rbp
   49ad4:      	pushq	%r15
   49ad6:      	pushq	%r14
   49ad8:      	pushq	%r13
   49ada:      	pushq	%r12
   49adc:      	pushq	%rbx
   49add:      	subq	$0x18, %rsp
   49ae1:      	testq	%rdx, %rdx
   49ae4:      	je	0x49bb7 <<toyos_crypto::keccak::Sponge>::read+0xe7>
   49aea:      	movq	%rdx, %rbx
   49aed:      	movq	%rsi, %r15
   49af0:      	movq	%rdi, %rcx
   49af3:      	movq	0xd0(%rdi), %r13
   49afa:      	movq	%rdi, -0x30(%rbp)
   49afe:      	nop
   49b00:      	cmpq	0xc8(%rcx), %r13
   49b07:      	jne	0x49b23 <<toyos_crypto::keccak::Sponge>::read+0x53>
   49b09:      	movq	%rcx, %rdi
   49b0c:      	callq	0x4a0f0 <toyos_crypto::keccak::permute (.llvm.13947057786405079061)>
   49b11:      	movq	-0x30(%rbp), %rcx
   49b15:      	movq	$0x0, 0xd0(%rcx)
   49b20:      	xorl	%r13d, %r13d
   49b23:      	movq	%r13, %rdi
   49b26:      	andq	$0x7, %rdi
   49b2a:      	movl	$0x1, %r12d
   49b30:      	movl	$0x8, %eax
   49b35:      	cmoveq	%rax, %r12
   49b39:      	cmpq	$0x8, %rbx
   49b3d:      	movl	$0x1, %eax
   49b42:      	cmovbq	%rax, %r12
   49b46:      	movq	%r13, %rax
   49b49:      	shrq	$0x3, %rax
   49b4d:      	cmpq	$0xc7, %r13
   49b54:      	ja	0x49c09 <<toyos_crypto::keccak::Sponge>::read+0x139>
   49b5a:      	movq	(%rcx,%rax,8), %rax
   49b5e:      	movq	%rax, -0x38(%rbp)
   49b62:      	cmpq	%r12, %rbx
   49b65:      	jb	0x49bd7 <<toyos_crypto::keccak::Sponge>::read+0x107>
   49b67:      	leaq	(%r12,%rdi), %rsi
   49b6b:      	cmpq	$0x9, %rsi
   49b6f:      	jae	0x49bc6 <<toyos_crypto::keccak::Sponge>::read+0xf6>
   49b71:      	leaq	(%rdi,%rbp), %rsi
   49b75:      	addq	$-0x38, %rsi
   49b79:      	movq	%rsi, %rax
   49b7c:      	subq	%r15, %rax
   49b7f:      	movq	%r15, %rcx
   49b82:      	subq	%rsi, %rcx
   49b85:      	cmovbq	%rax, %rcx
   49b89:      	cmpq	%r12, %rcx
   49b8c:      	jb	0x49bef <<toyos_crypto::keccak::Sponge>::read+0x11f>
   49b8e:      	leaq	(%r15,%r12), %r14
   49b92:      	movq	%r15, %rdi
   49b95:      	movq	%r12, %rdx
   49b98:      	callq	0xc4250 <memcpy>
   49b9d:      	movq	-0x30(%rbp), %rcx
   49ba1:      	addq	%r12, %r13
   49ba4:      	movq	%r13, 0xd0(%rcx)
   49bab:      	movq	%r14, %r15
   49bae:      	subq	%r12, %rbx
   49bb1:      	jne	0x49b00 <<toyos_crypto::keccak::Sponge>::read+0x30>
   49bb7:      	addq	$0x18, %rsp
   49bbb:      	popq	%rbx
   49bbc:      	popq	%r12
   49bbe:      	popq	%r13
   49bc0:      	popq	%r14
   49bc2:      	popq	%r15
   49bc4:      	popq	%rbp
   49bc5:      	retq
   49bc6:      	leaq	0x7c4b3(%rip), %rcx     # 0xc6080 <anon.1fd67189aac25b0b46092a5d2fc7dafa.7.llvm.13947057786405079061>
   49bcd:      	movl	$0x8, %edx
   49bd2:      	callq	0xbe560 <core::slice::index::slice_index_fail>
   49bd7:      	leaq	-0x39259(%rip), %rdi    # 0x10985 <anon.1fd67189aac25b0b46092a5d2fc7dafa.1.llvm.13947057786405079061>
   49bde:      	leaq	0x7c483(%rip), %rdx     # 0xc6068 <anon.1fd67189aac25b0b46092a5d2fc7dafa.6.llvm.13947057786405079061>
   49be5:      	movl	$0x13, %esi
   49bea:      	callq	0xbdc90 <core::panicking::panic_fmt>
   49bef:      	leaq	-0x33053(%rip), %rdi    # 0x16ba3 <anon.a439bd52d16495f5d747355f1db65386.5.llvm.18001447223344409526>
   49bf6:      	leaq	0x7c52b(%rip), %rcx     # 0xc6128 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526>
   49bfd:      	movl	$0x237, %esi            # imm = 0x237
   49c02:      	xorl	%edx, %edx
   49c04:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   49c09:      	leaq	0x7c440(%rip), %rdx     # 0xc6050 <anon.1fd67189aac25b0b46092a5d2fc7dafa.5.llvm.13947057786405079061>
   49c10:      	movl	$0x19, %esi
   49c15:      	movq	%rax, %rdi
   49c18:      	callq	0xbdacd <core::panicking::panic_bounds_check>
   49c1d:      	int3
   49c1e:      	int3
   49c1f:      	int3

0000000000049c20 <toyos_crypto::keccak::g>:
   49c20:      	pushq	%rbp
   49c21:      	movq	%rsp, %rbp
   49c24:      	pushq	%r14
   49c26:      	pushq	%rbx
   49c27:      	subq	$0x120, %rsp            # imm = 0x120
   49c2e:      	movq	%rdx, %r8
   49c31:      	movq	%rsi, %rcx
   49c34:      	movq	%rdi, %rbx
   49c37:      	xorps	%xmm0, %xmm0
   49c3a:      	movaps	%xmm0, -0x20(%rbp)
   49c3e:      	movaps	%xmm0, -0x30(%rbp)
   49c42:      	movaps	%xmm0, -0x40(%rbp)
   49c46:      	movaps	%xmm0, -0x50(%rbp)
   49c4a:      	leaq	-0x128(%rbp), %r14
   49c51:      	movl	$0x48, %esi
   49c56:      	movq	%r14, %rdi
   49c59:      	movl	$0x6, %edx
   49c5e:      	callq	0x496f0 <<toyos_crypto::keccak::Sponge>::new>
   49c63:      	leaq	-0x50(%rbp), %rsi
   49c67:      	movl	$0x40, %edx
   49c6c:      	movq	%r14, %rdi
   49c6f:      	callq	0x49ad0 <<toyos_crypto::keccak::Sponge>::read>
   49c74:      	movq	$0x0, -0x128(%rbp)
   49c7f:      	movq	$0x0, -0x120(%rbp)
   49c8a:      	movq	$0x0, -0x118(%rbp)
   49c95:      	movq	$0x0, -0x110(%rbp)
   49ca0:      	movq	$0x0, -0x108(%rbp)
   49cab:      	movq	$0x0, -0x100(%rbp)
   49cb6:      	movq	$0x0, -0xf8(%rbp)
   49cc1:      	movq	$0x0, -0xf0(%rbp)
   49ccc:      	movq	$0x0, -0xe8(%rbp)
   49cd7:      	movq	$0x0, -0xe0(%rbp)
   49ce2:      	movq	$0x0, -0xd8(%rbp)
   49ced:      	movq	$0x0, -0xd0(%rbp)
   49cf8:      	movq	$0x0, -0xc8(%rbp)
   49d03:      	movq	$0x0, -0xc0(%rbp)
   49d0e:      	movq	$0x0, -0xb8(%rbp)
   49d19:      	movq	$0x0, -0xb0(%rbp)
   49d24:      	movq	$0x0, -0xa8(%rbp)
   49d2f:      	movq	$0x0, -0xa0(%rbp)
   49d3a:      	movq	$0x0, -0x98(%rbp)
   49d45:      	movq	$0x0, -0x90(%rbp)
   49d50:      	movq	$0x0, -0x88(%rbp)
   49d5b:      	movq	$0x0, -0x80(%rbp)
   49d63:      	movq	$0x0, -0x78(%rbp)
   49d6b:      	movq	$0x0, -0x70(%rbp)
   49d73:      	movq	$0x0, -0x68(%rbp)
   49d7b:      	movaps	-0x50(%rbp), %xmm0
   49d7f:      	movaps	-0x40(%rbp), %xmm1
   49d83:      	movaps	-0x30(%rbp), %xmm2
   49d87:      	movaps	-0x20(%rbp), %xmm3
   49d8b:      	movups	%xmm3, 0x30(%rbx)
   49d8f:      	movups	%xmm2, 0x20(%rbx)
   49d93:      	movups	%xmm1, 0x10(%rbx)
   49d97:      	movups	%xmm0, (%rbx)
   49d9a:      	movq	%rbx, %rax
   49d9d:      	addq	$0x120, %rsp            # imm = 0x120
   49da4:      	popq	%rbx
   49da5:      	popq	%r14
   49da7:      	popq	%rbp
   49da8:      	retq
   49da9:      	movq	%rax, %rbx
   49dac:      	leaq	-0x128(%rbp), %rdi
   49db3:      	callq	0x54630 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   49db8:      	movq	%rbx, %rdi
   49dbb:      	callq	0xb86a0 <_Unwind_Resume>
   49dc0:      	callq	0xbdaba <core::panicking::panic_in_cleanup>
   49dc5:      	int3
   49dc6:      	int3
   49dc7:      	int3
   49dc8:      	int3
   49dc9:      	int3
   49dca:      	int3
   49dcb:      	int3
   49dcc:      	int3
   49dcd:      	int3
   49dce:      	int3
   49dcf:      	int3

0000000000049dd0 <toyos_crypto::keccak::h>:
   49dd0:      	pushq	%rbp
   49dd1:      	movq	%rsp, %rbp
   49dd4:      	pushq	%r14
   49dd6:      	pushq	%rbx
   49dd7:      	subq	$0x100, %rsp            # imm = 0x100
   49dde:      	movq	%rdx, %r8
   49de1:      	movq	%rsi, %rcx
   49de4:      	movq	%rdi, %rbx
   49de7:      	xorps	%xmm0, %xmm0
   49dea:      	movaps	%xmm0, -0x20(%rbp)
   49dee:      	movaps	%xmm0, -0x30(%rbp)
   49df2:      	leaq	-0x108(%rbp), %r14
   49df9:      	movl	$0x88, %esi
   49dfe:      	movq	%r14, %rdi
   49e01:      	movl	$0x6, %edx
   49e06:      	callq	0x496f0 <<toyos_crypto::keccak::Sponge>::new>
   49e0b:      	leaq	-0x30(%rbp), %rsi
   49e0f:      	movl	$0x20, %edx
   49e14:      	movq	%r14, %rdi
   49e17:      	callq	0x49ad0 <<toyos_crypto::keccak::Sponge>::read>
   49e1c:      	movq	$0x0, -0x108(%rbp)
   49e27:      	movq	$0x0, -0x100(%rbp)
   49e32:      	movq	$0x0, -0xf8(%rbp)
   49e3d:      	movq	$0x0, -0xf0(%rbp)
   49e48:      	movq	$0x0, -0xe8(%rbp)
   49e53:      	movq	$0x0, -0xe0(%rbp)
   49e5e:      	movq	$0x0, -0xd8(%rbp)
   49e69:      	movq	$0x0, -0xd0(%rbp)
   49e74:      	movq	$0x0, -0xc8(%rbp)
   49e7f:      	movq	$0x0, -0xc0(%rbp)
   49e8a:      	movq	$0x0, -0xb8(%rbp)
   49e95:      	movq	$0x0, -0xb0(%rbp)
   49ea0:      	movq	$0x0, -0xa8(%rbp)
   49eab:      	movq	$0x0, -0xa0(%rbp)
   49eb6:      	movq	$0x0, -0x98(%rbp)
   49ec1:      	movq	$0x0, -0x90(%rbp)
   49ecc:      	movq	$0x0, -0x88(%rbp)
   49ed7:      	movq	$0x0, -0x80(%rbp)
   49edf:      	movq	$0x0, -0x78(%rbp)
   49ee7:      	movq	$0x0, -0x70(%rbp)
   49eef:      	movq	$0x0, -0x68(%rbp)
   49ef7:      	movq	$0x0, -0x60(%rbp)
   49eff:      	movq	$0x0, -0x58(%rbp)
   49f07:      	movq	$0x0, -0x50(%rbp)
   49f0f:      	movq	$0x0, -0x48(%rbp)
   49f17:      	movaps	-0x30(%rbp), %xmm0
   49f1b:      	movaps	-0x20(%rbp), %xmm1
   49f1f:      	movups	%xmm1, 0x10(%rbx)
   49f23:      	movups	%xmm0, (%rbx)
   49f26:      	movq	%rbx, %rax
   49f29:      	addq	$0x100, %rsp            # imm = 0x100
   49f30:      	popq	%rbx
   49f31:      	popq	%r14
   49f33:      	popq	%rbp
   49f34:      	retq
   49f35:      	movq	%rax, %rbx
   49f38:      	leaq	-0x108(%rbp), %rdi
   49f3f:      	callq	0x54630 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   49f44:      	movq	%rbx, %rdi
   49f47:      	callq	0xb86a0 <_Unwind_Resume>
   49f4c:      	callq	0xbdaba <core::panicking::panic_in_cleanup>
   49f51:      	int3
   49f52:      	int3
   49f53:      	int3
   49f54:      	int3
   49f55:      	int3
   49f56:      	int3
   49f57:      	int3
   49f58:      	int3
   49f59:      	int3
   49f5a:      	int3
   49f5b:      	int3
   49f5c:      	int3
   49f5d:      	int3
   49f5e:      	int3
   49f5f:      	int3

0000000000049f60 <toyos_crypto::keccak::j>:
   49f60:      	pushq	%rbp
   49f61:      	movq	%rsp, %rbp
   49f64:      	pushq	%r14
   49f66:      	pushq	%rbx
   49f67:      	subq	$0x100, %rsp            # imm = 0x100
   49f6e:      	movq	%rdx, %r8
   49f71:      	movq	%rsi, %rcx
   49f74:      	movq	%rdi, %rbx
   49f77:      	xorps	%xmm0, %xmm0
   49f7a:      	movaps	%xmm0, -0x20(%rbp)
   49f7e:      	movaps	%xmm0, -0x30(%rbp)
   49f82:      	leaq	-0x108(%rbp), %r14
   49f89:      	movl	$0x88, %esi
   49f8e:      	movq	%r14, %rdi
   49f91:      	movl	$0x1f, %edx
   49f96:      	callq	0x496f0 <<toyos_crypto::keccak::Sponge>::new>
   49f9b:      	leaq	-0x30(%rbp), %rsi
   49f9f:      	movl	$0x20, %edx
   49fa4:      	movq	%r14, %rdi
   49fa7:      	callq	0x49ad0 <<toyos_crypto::keccak::Sponge>::read>
   49fac:      	movq	$0x0, -0x108(%rbp)
   49fb7:      	movq	$0x0, -0x100(%rbp)
   49fc2:      	movq	$0x0, -0xf8(%rbp)
   49fcd:      	movq	$0x0, -0xf0(%rbp)
   49fd8:      	movq	$0x0, -0xe8(%rbp)
   49fe3:      	movq	$0x0, -0xe0(%rbp)
   49fee:      	movq	$0x0, -0xd8(%rbp)
   49ff9:      	movq	$0x0, -0xd0(%rbp)
   4a004:      	movq	$0x0, -0xc8(%rbp)
   4a00f:      	movq	$0x0, -0xc0(%rbp)
   4a01a:      	movq	$0x0, -0xb8(%rbp)
   4a025:      	movq	$0x0, -0xb0(%rbp)
   4a030:      	movq	$0x0, -0xa8(%rbp)
   4a03b:      	movq	$0x0, -0xa0(%rbp)
   4a046:      	movq	$0x0, -0x98(%rbp)
   4a051:      	movq	$0x0, -0x90(%rbp)
   4a05c:      	movq	$0x0, -0x88(%rbp)
   4a067:      	movq	$0x0, -0x80(%rbp)
   4a06f:      	movq	$0x0, -0x78(%rbp)
   4a077:      	movq	$0x0, -0x70(%rbp)
   4a07f:      	movq	$0x0, -0x68(%rbp)
   4a087:      	movq	$0x0, -0x60(%rbp)
   4a08f:      	movq	$0x0, -0x58(%rbp)
   4a097:      	movq	$0x0, -0x50(%rbp)
   4a09f:      	movq	$0x0, -0x48(%rbp)
   4a0a7:      	movaps	-0x30(%rbp), %xmm0
   4a0ab:      	movaps	-0x20(%rbp), %xmm1
   4a0af:      	movups	%xmm1, 0x10(%rbx)
   4a0b3:      	movups	%xmm0, (%rbx)
   4a0b6:      	movq	%rbx, %rax
   4a0b9:      	addq	$0x100, %rsp            # imm = 0x100
   4a0c0:      	popq	%rbx
   4a0c1:      	popq	%r14
   4a0c3:      	popq	%rbp
   4a0c4:      	retq
   4a0c5:      	movq	%rax, %rbx
   4a0c8:      	leaq	-0x108(%rbp), %rdi
   4a0cf:      	callq	0x54630 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   4a0d4:      	movq	%rbx, %rdi
   4a0d7:      	callq	0xb86a0 <_Unwind_Resume>
   4a0dc:      	callq	0xbdaba <core::panicking::panic_in_cleanup>
   4a0e1:      	int3
   4a0e2:      	int3
   4a0e3:      	int3
   4a0e4:      	int3
   4a0e5:      	int3
   4a0e6:      	int3
   4a0e7:      	int3
   4a0e8:      	int3
   4a0e9:      	int3
   4a0ea:      	int3
   4a0eb:      	int3
   4a0ec:      	int3
   4a0ed:      	int3
   4a0ee:      	int3
   4a0ef:      	int3

000000000004a0f0 <toyos_crypto::keccak::permute (.llvm.13947057786405079061)>:
   4a0f0:      	pushq	%rbp
   4a0f1:      	movq	%rsp, %rbp
   4a0f4:      	pushq	%r15
   4a0f6:      	pushq	%r14
   4a0f8:      	pushq	%r13
   4a0fa:      	pushq	%r12
   4a0fc:      	pushq	%rbx
   4a0fd:      	subq	$0x60, %rsp
   4a101:      	movq	(%rdi), %rax
   4a104:      	movq	%rax, -0x50(%rbp)
   4a108:      	movq	0x8(%rdi), %rax
   4a10c:      	movq	%rax, -0x98(%rbp)
   4a113:      	movq	0x28(%rdi), %rax
   4a117:      	movq	%rax, -0x48(%rbp)
   4a11b:      	movq	0x50(%rdi), %rax
   4a11f:      	movq	0x78(%rdi), %r15
   4a123:      	movq	0xa0(%rdi), %rcx
   4a12a:      	movq	%rcx, -0x70(%rbp)
   4a12e:      	movq	0x30(%rdi), %rbx
   4a132:      	movq	0x58(%rdi), %r13
   4a136:      	movq	0x80(%rdi), %rsi
   4a13d:      	movq	0xa8(%rdi), %rcx
   4a144:      	movq	%rcx, -0x78(%rbp)
   4a148:      	movq	0x10(%rdi), %rcx
   4a14c:      	movq	%rcx, -0xa0(%rbp)
   4a153:      	movq	0x38(%rdi), %r8
   4a157:      	movq	%r8, -0x60(%rbp)
   4a15b:      	movq	0x60(%rdi), %r11
   4a15f:      	movq	0x88(%rdi), %r10
   4a166:      	movq	0xb0(%rdi), %rcx
   4a16d:      	movq	%rcx, -0x90(%rbp)
   4a174:      	movq	0x18(%rdi), %rcx
   4a178:      	movq	%rcx, -0x58(%rbp)
   4a17c:      	movq	0x40(%rdi), %r9
   4a180:      	movq	0x68(%rdi), %rcx
   4a184:      	movq	0x90(%rdi), %r12
   4a18b:      	movq	0xb8(%rdi), %rdx
   4a192:      	movq	%rdx, -0x88(%rbp)
   4a199:      	movq	0x20(%rdi), %r8
   4a19d:      	movq	%r8, -0x30(%rbp)
   4a1a1:      	movq	0x48(%rdi), %r8
   4a1a5:      	movq	%r8, -0x38(%rbp)
   4a1a9:      	movq	0x70(%rdi), %rdx
   4a1ad:      	movq	%rdx, -0x80(%rbp)
   4a1b1:      	movq	0x98(%rdi), %r8
   4a1b8:      	movq	%rdi, -0xe8(%rbp)
   4a1bf:      	movq	0xc0(%rdi), %rdx
   4a1c6:      	movq	%rdx, -0x40(%rbp)
   4a1ca:      	xorl	%edx, %edx
   4a1cc:      	nopl	(%rax)
   4a1d0:      	movq	%rax, -0xc8(%rbp)
   4a1d7:      	movq	%rsi, -0x68(%rbp)
   4a1db:      	movq	%r10, -0xd8(%rbp)
   4a1e2:      	movq	%rdx, -0x108(%rbp)
   4a1e9:      	movq	%r15, %rdx
   4a1ec:      	xorq	-0x70(%rbp), %rdx
   4a1f0:      	movq	%rax, %rdi
   4a1f3:      	xorq	-0x48(%rbp), %rdi
   4a1f7:      	xorq	%rdx, %rdi
   4a1fa:      	movq	%r8, %rdx
   4a1fd:      	movq	%r8, -0xd0(%rbp)
   4a204:      	movq	%rsi, %r8
   4a207:      	xorq	-0x78(%rbp), %r8
   4a20b:      	movq	%r13, -0xe0(%rbp)
   4a212:      	movq	%r13, %rsi
   4a215:      	xorq	%rbx, %rsi
   4a218:      	xorq	%r8, %rsi
   4a21b:      	movq	%r10, %r8
   4a21e:      	xorq	-0x90(%rbp), %r8
   4a225:      	movq	%r11, %r10
   4a228:      	xorq	-0x60(%rbp), %r10
   4a22c:      	xorq	%r8, %r10
   4a22f:      	movq	%r12, %r14
   4a232:      	xorq	-0x88(%rbp), %r14
   4a239:      	movq	%rcx, %rax
   4a23c:      	xorq	%r9, %rax
   4a23f:      	xorq	%r14, %rax
   4a242:      	movq	%rdx, %r14
   4a245:      	xorq	-0x40(%rbp), %r14
   4a249:      	movq	-0x80(%rbp), %rdx
   4a24d:      	xorq	-0x38(%rbp), %rdx
   4a251:      	xorq	%r14, %rdx
   4a254:      	movq	-0x50(%rbp), %r14
   4a258:      	xorq	%r14, %rdi
   4a25b:      	movq	-0x98(%rbp), %r13
   4a262:      	xorq	%r13, %rsi
   4a265:      	xorq	-0x58(%rbp), %rax
   4a269:      	xorq	-0x30(%rbp), %rdx
   4a26d:      	movq	%rax, %r8
   4a270:      	rolq	%r8
   4a273:      	xorq	%rsi, %r8
   4a276:      	rolq	%rsi
   4a279:      	xorq	%rdx, %rsi
   4a27c:      	xorq	%rsi, %r14
   4a27f:      	movq	%r14, -0xc0(%rbp)
   4a286:      	xorq	%rsi, -0x48(%rbp)
   4a28a:      	xorq	%rsi, -0xc8(%rbp)
   4a291:      	xorq	%rsi, %r15
   4a294:      	xorq	-0x70(%rbp), %rsi
   4a298:      	movq	%rsi, -0x100(%rbp)
   4a29f:      	movq	-0xa0(%rbp), %r14
   4a2a6:      	xorq	%r14, %r10
   4a2a9:      	rolq	%rdx
   4a2ac:      	xorq	%r10, %rdx
   4a2af:      	rolq	%r10
   4a2b2:      	xorq	%rdi, %r10
   4a2b5:      	xorq	%r10, %r13
   4a2b8:      	xorq	%r10, %rbx
   4a2bb:      	xorq	%r10, -0xe0(%rbp)
   4a2c2:      	xorq	%r10, -0x68(%rbp)
   4a2c6:      	xorq	-0x78(%rbp), %r10
   4a2ca:      	movq	%r10, -0xa8(%rbp)
   4a2d1:      	xorq	%r8, %r14
   4a2d4:      	xorq	%r8, -0x60(%rbp)
   4a2d8:      	xorq	%r8, %r11
   4a2db:      	xorq	%r8, -0xd8(%rbp)
   4a2e2:      	xorq	-0x90(%rbp), %r8
   4a2e9:      	movq	%r8, -0xf0(%rbp)
   4a2f0:      	xorq	%rdx, -0x58(%rbp)
   4a2f4:      	xorq	%rdx, %r9
   4a2f7:      	xorq	%rdx, %rcx
   4a2fa:      	movq	%rcx, -0xf8(%rbp)
   4a301:      	xorq	%rdx, %r12
   4a304:      	xorq	-0x88(%rbp), %rdx
   4a30b:      	movq	%rdx, -0xb8(%rbp)
   4a312:      	rolq	%rdi
   4a315:      	xorq	%rax, %rdi
   4a318:      	movq	-0x30(%rbp), %rcx
   4a31c:      	xorq	%rdi, %rcx
   4a31f:      	movq	-0x38(%rbp), %rax
   4a323:      	xorq	%rdi, %rax
   4a326:      	movq	-0x80(%rbp), %r8
   4a32a:      	xorq	%rdi, %r8
   4a32d:      	xorq	%rdi, -0xd0(%rbp)
   4a334:      	xorq	-0x40(%rbp), %rdi
   4a338:      	movq	%r13, -0x38(%rbp)
   4a33c:      	movq	%r14, %r13
   4a33f:      	rolq	$0x3e, %r13
   4a343:      	rolq	$0x2c, %rbx
   4a347:      	rolq	$0x2b, %r11
   4a34b:      	rolq	$0x15, %r12
   4a34f:      	movq	%rcx, -0xb0(%rbp)
   4a356:      	rolq	$0xe, %rdi
   4a35a:      	movq	%rdi, -0x30(%rbp)
   4a35e:      	movq	%rbx, %rcx
   4a361:      	notq	%rcx
   4a364:      	andq	%r11, %rcx
   4a367:      	movq	%rcx, -0x50(%rbp)
   4a36b:      	movq	%r12, %rdx
   4a36e:      	notq	%rdx
   4a371:      	andq	%rdi, %rdx
   4a374:      	xorq	%r11, %rdx
   4a377:      	movq	%rdx, -0xa0(%rbp)
   4a37e:      	notq	%r11
   4a381:      	andq	%r12, %r11
   4a384:      	xorq	%rbx, %r11
   4a387:      	movq	%r11, -0x98(%rbp)
   4a38e:      	movq	-0xc0(%rbp), %r11
   4a395:      	movq	%r11, %r10
   4a398:      	notq	%r10
   4a39b:      	andq	%rbx, %r10
   4a39e:      	rolq	$0x37, %r9
   4a3a2:      	movq	%r8, %rdx
   4a3a5:      	rolq	$0x27, %rdx
   4a3a9:      	rolq	$0x29, %r15
   4a3ad:      	movq	-0xa8(%rbp), %r8
   4a3b4:      	rolq	$0x2, %r8
   4a3b8:      	movq	%r9, %rdi
   4a3bb:      	notq	%rdi
   4a3be:      	andq	%rdx, %rdi
   4a3c1:      	xorq	%r13, %rdi
   4a3c4:      	movq	%rdi, -0x70(%rbp)
   4a3c8:      	movq	%r15, %rdi
   4a3cb:      	notq	%rdi
   4a3ce:      	movq	%r8, %r14
   4a3d1:      	movq	%r8, -0xa8(%rbp)
   4a3d8:      	andq	%r8, %rdi
   4a3db:      	xorq	%rdx, %rdi
   4a3de:      	movq	%rdi, -0x90(%rbp)
   4a3e5:      	notq	%rdx
   4a3e8:      	andq	%r15, %rdx
   4a3eb:      	xorq	%r9, %rdx
   4a3ee:      	movq	%rdx, -0x78(%rbp)
   4a3f2:      	notq	%r14
   4a3f5:      	andq	%r13, %r14
   4a3f8:      	notq	%r13
   4a3fb:      	andq	%r9, %r13
   4a3fe:      	movq	%r13, -0x40(%rbp)
   4a402:      	movq	-0x58(%rbp), %rdx
   4a406:      	rolq	$0x1c, %rdx
   4a40a:      	movq	%rax, %r13
   4a40d:      	rolq	$0x14, %r13
   4a411:      	movq	-0xc8(%rbp), %rax
   4a418:      	rolq	$0x3, %rax
   4a41c:      	movq	-0x68(%rbp), %r9
   4a420:      	rolq	$0x2d, %r9
   4a424:      	movq	-0xf0(%rbp), %rcx
   4a42b:      	rolq	$0x3d, %rcx
   4a42f:      	movq	-0x48(%rbp), %rsi
   4a433:      	movq	%r13, %rdi
   4a436:      	notq	%rdi
   4a439:      	andq	%rax, %rdi
   4a43c:      	xorq	%rdx, %rdi
   4a43f:      	movq	%rdi, -0x48(%rbp)
   4a443:      	movq	%rax, %rbx
   4a446:      	notq	%rbx
   4a449:      	andq	%r9, %rbx
   4a44c:      	movq	%r9, %rdi
   4a44f:      	xorq	%r13, %rbx
   4a452:      	movq	%rcx, %r9
   4a455:      	notq	%r9
   4a458:      	andq	%rdx, %r9
   4a45b:      	notq	%rdx
   4a45e:      	andq	%rdx, %r13
   4a461:      	movq	-0x30(%rbp), %r8
   4a465:      	movq	%r8, %rdx
   4a468:      	notq	%rdx
   4a46b:      	andq	%r11, %rdx
   4a46e:      	xorq	%r12, %rdx
   4a471:      	movq	%rdx, -0x58(%rbp)
   4a475:      	xorq	%r8, %r10
   4a478:      	movq	%r10, -0x30(%rbp)
   4a47c:      	movq	-0x60(%rbp), %r8
   4a480:      	movq	%rdi, %r10
   4a483:      	notq	%r10
   4a486:      	andq	%rcx, %r10
   4a489:      	xorq	%rax, %r10
   4a48c:      	movq	%r10, -0x60(%rbp)
   4a490:      	movq	-0x38(%rbp), %rdx
   4a494:      	rolq	%rdx
   4a497:      	movq	-0xb0(%rbp), %r11
   4a49e:      	rolq	$0x1b, %r11
   4a4a2:      	movq	%r11, -0xb0(%rbp)
   4a4a9:      	rolq	$0x24, %rsi
   4a4ad:      	movq	%rsi, -0x68(%rbp)
   4a4b1:      	rolq	$0x6, %r8
   4a4b5:      	xorq	%rdi, %r9
   4a4b8:      	movq	-0xe0(%rbp), %rax
   4a4bf:      	rolq	$0xa, %rax
   4a4c3:      	xorq	%rcx, %r13
   4a4c6:      	movq	%r13, -0x38(%rbp)
   4a4ca:      	movq	-0xf8(%rbp), %r13
   4a4d1:      	rolq	$0x19, %r13
   4a4d5:      	movq	-0xd8(%rbp), %r10
   4a4dc:      	rolq	$0xf, %r10
   4a4e0:      	movq	-0xd0(%rbp), %rdi
   4a4e7:      	rolq	$0x8, %rdi
   4a4eb:      	xorq	%r15, %r14
   4a4ee:      	movq	%r14, -0x88(%rbp)
   4a4f5:      	movq	-0xb8(%rbp), %rcx
   4a4fc:      	rolq	$0x38, %rcx
   4a500:      	movq	%rcx, -0xb8(%rbp)
   4a507:      	movq	%rsi, %r15
   4a50a:      	notq	%r15
   4a50d:      	andq	%rax, %r15
   4a510:      	movq	%rax, %rsi
   4a513:      	notq	%rsi
   4a516:      	andq	%r10, %rsi
   4a519:      	movq	%rcx, %r12
   4a51c:      	notq	%r12
   4a51f:      	andq	%r11, %r12
   4a522:      	xorq	%r10, %r12
   4a525:      	notq	%r10
   4a528:      	andq	%rcx, %r10
   4a52b:      	xorq	%rax, %r10
   4a52e:      	movq	-0x100(%rbp), %r14
   4a535:      	rolq	$0x12, %r14
   4a539:      	movq	%r8, %rax
   4a53c:      	notq	%rax
   4a53f:      	andq	%r13, %rax
   4a542:      	movq	%rdi, %r11
   4a545:      	notq	%r11
   4a548:      	andq	%r14, %r11
   4a54b:      	xorq	%r13, %r11
   4a54e:      	notq	%r13
   4a551:      	andq	%rdi, %r13
   4a554:      	movq	%r14, %rcx
   4a557:      	notq	%rcx
   4a55a:      	andq	%rdx, %rcx
   4a55d:      	xorq	%rdi, %rcx
   4a560:      	xorq	%rdx, %rax
   4a563:      	xorq	%r8, %r13
   4a566:      	notq	%rdx
   4a569:      	andq	%r8, %rdx
   4a56c:      	xorq	%r14, %rdx
   4a56f:      	movq	%rdx, -0x80(%rbp)
   4a573:      	movq	-0xb0(%rbp), %r8
   4a57a:      	xorq	%r8, %r15
   4a57d:      	movq	-0x68(%rbp), %rdx
   4a581:      	xorq	%rdx, %rsi
   4a584:      	notq	%r8
   4a587:      	andq	%rdx, %r8
   4a58a:      	xorq	-0xb8(%rbp), %r8
   4a591:      	movq	-0x40(%rbp), %rdx
   4a595:      	xorq	-0xa8(%rbp), %rdx
   4a59c:      	movq	%rdx, -0x40(%rbp)
   4a5a0:      	leaq	-0x39be7(%rip), %rdx    # 0x109c0 <anon.1fd67189aac25b0b46092a5d2fc7dafa.1.llvm.13947057786405079061+0x3b>
   4a5a7:      	movq	-0x108(%rbp), %rdi
   4a5ae:      	movq	-0x50(%rbp), %r14
   4a5b2:      	xorq	(%rdi,%rdx), %r14
   4a5b6:      	xorq	-0xc0(%rbp), %r14
   4a5bd:      	movq	%r14, -0x50(%rbp)
   4a5c1:      	leaq	0x8(%rdi), %rdx
   4a5c5:      	cmpq	$0xc0, %rdx
   4a5cc:      	jne	0x4a1d0 <toyos_crypto::keccak::permute (.llvm.13947057786405079061)+0xe0>
   4a5d2:      	movq	-0xe8(%rbp), %r14
   4a5d9:      	movq	-0x98(%rbp), %rdx
   4a5e0:      	movq	%rdx, 0x8(%r14)
   4a5e4:      	movq	-0xa0(%rbp), %rdx
   4a5eb:      	movq	%rdx, 0x10(%r14)
   4a5ef:      	movq	-0x58(%rbp), %rdx
   4a5f3:      	movq	%rdx, 0x18(%r14)
   4a5f7:      	movq	-0x30(%rbp), %rdx
   4a5fb:      	movq	%rdx, 0x20(%r14)
   4a5ff:      	movq	-0x48(%rbp), %rdx
   4a603:      	movq	%rdx, 0x28(%r14)
   4a607:      	movq	%rbx, 0x30(%r14)
   4a60b:      	movq	-0x60(%rbp), %rdi
   4a60f:      	movq	%rdi, 0x38(%r14)
   4a613:      	movq	%r9, 0x40(%r14)
   4a617:      	movq	-0x38(%rbp), %rdi
   4a61b:      	movq	%rdi, 0x48(%r14)
   4a61f:      	movq	%rax, 0x50(%r14)
   4a623:      	movq	%r13, 0x58(%r14)
   4a627:      	movq	%r11, 0x60(%r14)
   4a62b:      	movq	%rcx, 0x68(%r14)
   4a62f:      	movq	-0x80(%rbp), %rax
   4a633:      	movq	%rax, 0x70(%r14)
   4a637:      	movq	%r15, 0x78(%r14)
   4a63b:      	movq	%rsi, 0x80(%r14)
   4a642:      	movq	%r10, 0x88(%r14)
   4a649:      	movq	%r12, 0x90(%r14)
   4a650:      	movq	%r8, 0x98(%r14)
   4a657:      	movq	-0x70(%rbp), %rax
   4a65b:      	movq	%rax, 0xa0(%r14)
   4a662:      	movq	-0x78(%rbp), %rax
   4a666:      	movq	%rax, 0xa8(%r14)
   4a66d:      	movq	-0x90(%rbp), %rax
   4a674:      	movq	%rax, 0xb0(%r14)
   4a67b:      	movq	-0x88(%rbp), %rax
   4a682:      	movq	%rax, 0xb8(%r14)
   4a689:      	movq	-0x40(%rbp), %rax
   4a68d:      	movq	%rax, 0xc0(%r14)
   4a694:      	movq	-0x50(%rbp), %rax
   4a698:      	movq	%rax, (%r14)
   4a69b:      	addq	$0x60, %rsp
   4a69f:      	popq	%rbx
   4a6a0:      	popq	%r12
   4a6a2:      	popq	%r13
   4a6a4:      	popq	%r14
   4a6a6:      	popq	%r15
   4a6a8:      	popq	%rbp
   4a6a9:      	retq
   4a6aa:      	int3
   4a6ab:      	int3
   4a6ac:      	int3
   4a6ad:      	int3
   4a6ae:      	int3
   4a6af:      	int3

0000000000054480 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>>:
   54480:      	xorl	%eax, %eax
   54482:      	nopw	%cs:(%rax,%rax)
   54490:      	movw	$0x0, (%rdi,%rax)
   54496:      	movw	$0x0, 0x2(%rdi,%rax)
   5449d:      	movw	$0x0, 0x4(%rdi,%rax)
   544a4:      	movw	$0x0, 0x6(%rdi,%rax)
   544ab:      	movw	$0x0, 0x8(%rdi,%rax)
   544b2:      	movw	$0x0, 0xa(%rdi,%rax)
   544b9:      	movw	$0x0, 0xc(%rdi,%rax)
   544c0:      	movw	$0x0, 0xe(%rdi,%rax)
   544c7:      	addq	$0x10, %rax
   544cb:      	cmpq	$0x200, %rax            # imm = 0x200
   544d1:      	jne	0x54490 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>+0x10>
   544d3:      	xorl	%eax, %eax
   544d5:      	nopw	%cs:(%rax,%rax)
   544e0:      	movw	$0x0, 0x200(%rdi,%rax)
   544ea:      	movw	$0x0, 0x202(%rdi,%rax)
   544f4:      	movw	$0x0, 0x204(%rdi,%rax)
   544fe:      	movw	$0x0, 0x206(%rdi,%rax)
   54508:      	movw	$0x0, 0x208(%rdi,%rax)
   54512:      	movw	$0x0, 0x20a(%rdi,%rax)
   5451c:      	movw	$0x0, 0x20c(%rdi,%rax)
   54526:      	movw	$0x0, 0x20e(%rdi,%rax)
   54530:      	addq	$0x10, %rax
   54534:      	cmpq	$0x200, %rax            # imm = 0x200
   5453a:      	jne	0x544e0 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>+0x60>
   5453c:      	xorl	%eax, %eax
   5453e:      	nop
   54540:      	movw	$0x0, 0x400(%rdi,%rax)
   5454a:      	movw	$0x0, 0x402(%rdi,%rax)
   54554:      	movw	$0x0, 0x404(%rdi,%rax)
   5455e:      	movw	$0x0, 0x406(%rdi,%rax)
   54568:      	movw	$0x0, 0x408(%rdi,%rax)
   54572:      	movw	$0x0, 0x40a(%rdi,%rax)
   5457c:      	movw	$0x0, 0x40c(%rdi,%rax)
   54586:      	movw	$0x0, 0x40e(%rdi,%rax)
   54590:      	addq	$0x10, %rax
   54594:      	cmpq	$0x200, %rax            # imm = 0x200
   5459a:      	jne	0x54540 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>+0xc0>
   5459c:      	pushq	%rbp
   5459d:      	movq	%rsp, %rbp
   545a0:      	xorps	%xmm0, %xmm0
   545a3:      	movaps	%xmm0, -0x10(%rbp)
   545a7:      	movaps	-0x10(%rbp), %xmm1
   545ab:      	movups	%xmm1, 0xac0(%rdi)
   545b2:      	movaps	%xmm0, -0x10(%rbp)
   545b6:      	movaps	-0x10(%rbp), %xmm0
   545ba:      	movups	%xmm0, 0xad0(%rdi)
   545c1:      	popq	%rbp
   545c2:      	retq
   545c3:      	int3
   545c4:      	int3
   545c5:      	int3
   545c6:      	int3
   545c7:      	int3
   545c8:      	int3
   545c9:      	int3
   545ca:      	int3
   545cb:      	int3
   545cc:      	int3
   545cd:      	int3
   545ce:      	int3
   545cf:      	int3

00000000000545d0 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>:
   545d0:      	pushq	%rbp
   545d1:      	movq	%rsp, %rbp
   545d4:      	xorl	%eax, %eax
   545d6:      	nopw	%cs:(%rax,%rax)
   545e0:      	movw	$0x0, (%rdi,%rax)
   545e6:      	movw	$0x0, 0x2(%rdi,%rax)
   545ed:      	movw	$0x0, 0x4(%rdi,%rax)
   545f4:      	movw	$0x0, 0x6(%rdi,%rax)
   545fb:      	movw	$0x0, 0x8(%rdi,%rax)
   54602:      	movw	$0x0, 0xa(%rdi,%rax)
   54609:      	movw	$0x0, 0xc(%rdi,%rax)
   54610:      	movw	$0x0, 0xe(%rdi,%rax)
   54617:      	addq	$0x10, %rax
   5461b:      	cmpq	$0x200, %rax            # imm = 0x200
   54621:      	jne	0x545e0 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop+0x10>
   54623:      	popq	%rbp
   54624:      	retq
   54625:      	int3
   54626:      	int3
   54627:      	int3
   54628:      	int3
   54629:      	int3
   5462a:      	int3
   5462b:      	int3
   5462c:      	int3
   5462d:      	int3
   5462e:      	int3
   5462f:      	int3

0000000000054630 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>:
   54630:      	pushq	%rbp
   54631:      	movq	%rsp, %rbp
   54634:      	movq	$0x0, (%rdi)
   5463b:      	movq	$0x0, 0x8(%rdi)
   54643:      	movq	$0x0, 0x10(%rdi)
   5464b:      	movq	$0x0, 0x18(%rdi)
   54653:      	movq	$0x0, 0x20(%rdi)
   5465b:      	movq	$0x0, 0x28(%rdi)
   54663:      	movq	$0x0, 0x30(%rdi)
   5466b:      	movq	$0x0, 0x38(%rdi)
   54673:      	movq	$0x0, 0x40(%rdi)
   5467b:      	movq	$0x0, 0x48(%rdi)
   54683:      	movq	$0x0, 0x50(%rdi)
   5468b:      	movq	$0x0, 0x58(%rdi)
   54693:      	movq	$0x0, 0x60(%rdi)
   5469b:      	movq	$0x0, 0x68(%rdi)
   546a3:      	movq	$0x0, 0x70(%rdi)
   546ab:      	movq	$0x0, 0x78(%rdi)
   546b3:      	movq	$0x0, 0x80(%rdi)
   546be:      	movq	$0x0, 0x88(%rdi)
   546c9:      	movq	$0x0, 0x90(%rdi)
   546d4:      	movq	$0x0, 0x98(%rdi)
   546df:      	movq	$0x0, 0xa0(%rdi)
   546ea:      	movq	$0x0, 0xa8(%rdi)
   546f5:      	movq	$0x0, 0xb0(%rdi)
   54700:      	movq	$0x0, 0xb8(%rdi)
   5470b:      	movq	$0x0, 0xc0(%rdi)
   54716:      	popq	%rbp
   54717:      	retq
   54718:      	int3
   54719:      	int3
   5471a:      	int3
   5471b:      	int3
   5471c:      	int3
   5471d:      	int3
   5471e:      	int3
   5471f:      	int3

00000000000547f0 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>:
   547f0:      	pushq	%rbp
   547f1:      	movq	%rsp, %rbp
   547f4:      	movq	0x10(%rdi), %rax
   547f8:      	cmpq	0x8(%rdi), %rax
   547fc:      	ja	0x54875 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x85>
   547fe:      	testq	%rax, %rax
   54801:      	je	0x54873 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x83>
   54803:      	movq	(%rdi), %rcx
   54806:      	addq	$0xe, %rcx
   5480a:      	xorl	%edx, %edx
   5480c:      	nopl	(%rax)
   54810:      	xorl	%esi, %esi
   54812:      	nopw	%cs:(%rax,%rax)
   54820:      	movw	$0x0, -0xe(%rcx,%rsi)
   54827:      	movw	$0x0, -0xc(%rcx,%rsi)
   5482e:      	movw	$0x0, -0xa(%rcx,%rsi)
   54835:      	movw	$0x0, -0x8(%rcx,%rsi)
   5483c:      	movw	$0x0, -0x6(%rcx,%rsi)
   54843:      	movw	$0x0, -0x4(%rcx,%rsi)
   5484a:      	movw	$0x0, -0x2(%rcx,%rsi)
   54851:      	movw	$0x0, (%rcx,%rsi)
   54857:      	addq	$0x10, %rsi
   5485b:      	cmpq	$0x200, %rsi            # imm = 0x200
   54862:      	jne	0x54820 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x30>
   54864:      	incq	%rdx
   54867:      	addq	$0x200, %rcx            # imm = 0x200
   5486e:      	cmpq	%rax, %rdx
   54871:      	jne	0x54810 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x20>
   54873:      	popq	%rbp
   54874:      	retq
   54875:      	leaq	-0x3d9b4(%rip), %rdi    # 0x16ec8 <anon.a439bd52d16495f5d747355f1db65386.5.llvm.18001447223344409526+0x325>
   5487c:      	leaq	0x71a25(%rip), %rcx     # 0xc62a8 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526+0x180>
   54883:      	movl	$0x1b5, %esi            # imm = 0x1B5
   54888:      	xorl	%edx, %edx
   5488a:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   5488f:      	int3

0000000000054890 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes>:
   54890:      	pushq	%rbp
   54891:      	movq	%rsp, %rbp
   54894:      	pushq	%r14
   54896:      	pushq	%rbx
   54897:      	subq	$0x200, %rsp            # imm = 0x200
   5489e:      	movq	%rdi, %rbx
   548a1:      	cmpq	$0x4a0, %rdx            # imm = 0x4A0
   548a8:      	jne	0x5497e <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0xee>
   548ae:      	movq	%rsi, %r14
   548b1:      	leaq	-0x210(%rbp), %rdi
   548b8:      	movl	$0x180, %edx            # imm = 0x180
   548bd:      	callq	0x58f50 <<toyos_crypto::mlkem::Poly>::decode::<12>>
   548c2:      	movl	$0x6, %eax
   548c7:      	nopw	(%rax,%rax)
   548d0:      	cmpq	$0x206, %rax            # imm = 0x206
   548d6:      	je	0x54992 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x102>
   548dc:      	cmpw	$0xd00, -0x216(%rbp,%rax) # imm = 0xD00
   548e6:      	jg	0x54910 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
   548e8:      	cmpw	$0xd00, -0x214(%rbp,%rax) # imm = 0xD00
   548f2:      	jg	0x54910 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
   548f4:      	cmpw	$0xd00, -0x212(%rbp,%rax) # imm = 0xD00
   548fe:      	jg	0x54910 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
   54900:      	cmpw	$0xd00, -0x210(%rbp,%rax) # imm = 0xD00
   5490a:      	leaq	0x8(%rax), %rax
   5490e:      	jle	0x548d0 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x40>
   54910:      	movw	$0x201, (%rbx)          # imm = 0x201
   54915:      	xorl	%eax, %eax
   54917:      	nopw	(%rax,%rax)
   54920:      	movw	$0x0, -0x210(%rbp,%rax)
   5492a:      	movw	$0x0, -0x20e(%rbp,%rax)
   54934:      	movw	$0x0, -0x20c(%rbp,%rax)
   5493e:      	movw	$0x0, -0x20a(%rbp,%rax)
   54948:      	movw	$0x0, -0x208(%rbp,%rax)
   54952:      	movw	$0x0, -0x206(%rbp,%rax)
   5495c:      	movw	$0x0, -0x204(%rbp,%rax)
   54966:      	movw	$0x0, -0x202(%rbp,%rax)
   54970:      	addq	$0x10, %rax
   54974:      	cmpq	$0x200, %rax            # imm = 0x200
   5497a:      	jne	0x54920 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x90>
   5497c:      	jmp	0x54983 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0xf3>
   5497e:      	movw	$0x1, (%rbx)
   54983:      	movq	%rbx, %rax
   54986:      	addq	$0x200, %rsp            # imm = 0x200
   5498d:      	popq	%rbx
   5498e:      	popq	%r14
   54990:      	popq	%rbp
   54991:      	retq
   54992:      	movl	$0xe, %eax
   54997:      	nopw	(%rax,%rax)
   549a0:      	movw	$0x0, -0x21e(%rbp,%rax)
   549aa:      	movw	$0x0, -0x21c(%rbp,%rax)
   549b4:      	movw	$0x0, -0x21a(%rbp,%rax)
   549be:      	movw	$0x0, -0x218(%rbp,%rax)
   549c8:      	movw	$0x0, -0x216(%rbp,%rax)
   549d2:      	movw	$0x0, -0x214(%rbp,%rax)
   549dc:      	movw	$0x0, -0x212(%rbp,%rax)
   549e6:      	movw	$0x0, -0x210(%rbp,%rax)
   549f0:      	addq	$0x10, %rax
   549f4:      	cmpq	$0x20e, %rax            # imm = 0x20E
   549fa:      	jne	0x549a0 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x110>
   549fc:      	leaq	0x180(%r14), %rsi
   54a03:      	leaq	-0x210(%rbp), %rdi
   54a0a:      	movl	$0x180, %edx            # imm = 0x180
   54a0f:      	callq	0x58f50 <<toyos_crypto::mlkem::Poly>::decode::<12>>
   54a14:      	movl	$0x6, %eax
   54a19:      	nopl	(%rax)
   54a20:      	cmpq	$0x206, %rax            # imm = 0x206
   54a26:      	je	0x54a6d <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x1dd>
   54a28:      	cmpw	$0xd00, -0x216(%rbp,%rax) # imm = 0xD00
   54a32:      	jg	0x54910 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
   54a38:      	cmpw	$0xd00, -0x214(%rbp,%rax) # imm = 0xD00
   54a42:      	jg	0x54910 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
   54a48:      	cmpw	$0xd00, -0x212(%rbp,%rax) # imm = 0xD00
   54a52:      	jg	0x54910 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
   54a58:      	cmpw	$0xd00, -0x210(%rbp,%rax) # imm = 0xD00
   54a62:      	leaq	0x8(%rax), %rax
   54a66:      	jle	0x54a20 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x190>
   54a68:      	jmp	0x54910 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
   54a6d:      	movl	$0xe, %eax
   54a72:      	nopw	%cs:(%rax,%rax)
   54a80:      	movw	$0x0, -0x21e(%rbp,%rax)
   54a8a:      	movw	$0x0, -0x21c(%rbp,%rax)
   54a94:      	movw	$0x0, -0x21a(%rbp,%rax)
   54a9e:      	movw	$0x0, -0x218(%rbp,%rax)
   54aa8:      	movw	$0x0, -0x216(%rbp,%rax)
   54ab2:      	movw	$0x0, -0x214(%rbp,%rax)
   54abc:      	movw	$0x0, -0x212(%rbp,%rax)
   54ac6:      	movw	$0x0, -0x210(%rbp,%rax)
   54ad0:      	addq	$0x10, %rax
   54ad4:      	cmpq	$0x20e, %rax            # imm = 0x20E
   54ada:      	jne	0x54a80 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x1f0>
   54adc:      	leaq	0x300(%r14), %rsi
   54ae3:      	leaq	-0x210(%rbp), %rdi
   54aea:      	movl	$0x180, %edx            # imm = 0x180
   54aef:      	callq	0x58f50 <<toyos_crypto::mlkem::Poly>::decode::<12>>
   54af4:      	xorl	%eax, %eax
   54af6:      	cmpq	$0x200, %rax            # imm = 0x200
   54afc:      	je	0x54b43 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2b3>
   54afe:      	cmpw	$0xd00, -0x210(%rbp,%rax) # imm = 0xD00
   54b08:      	jg	0x54910 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
   54b0e:      	cmpw	$0xd00, -0x20e(%rbp,%rax) # imm = 0xD00
   54b18:      	jg	0x54910 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
   54b1e:      	cmpw	$0xd00, -0x20c(%rbp,%rax) # imm = 0xD00
   54b28:      	jg	0x54910 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
   54b2e:      	cmpw	$0xd00, -0x20a(%rbp,%rax) # imm = 0xD00
   54b38:      	leaq	0x8(%rax), %rax
   54b3c:      	jle	0x54af6 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x266>
   54b3e:      	jmp	0x54910 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x80>
   54b43:      	xorl	%eax, %eax
   54b45:      	movw	$0x0, -0x210(%rbp,%rax)
   54b4f:      	movw	$0x0, -0x20e(%rbp,%rax)
   54b59:      	movw	$0x0, -0x20c(%rbp,%rax)
   54b63:      	movw	$0x0, -0x20a(%rbp,%rax)
   54b6d:      	movw	$0x0, -0x208(%rbp,%rax)
   54b77:      	movw	$0x0, -0x206(%rbp,%rax)
   54b81:      	movw	$0x0, -0x204(%rbp,%rax)
   54b8b:      	movw	$0x0, -0x202(%rbp,%rax)
   54b95:      	addq	$0x10, %rax
   54b99:      	cmpq	$0x200, %rax            # imm = 0x200
   54b9f:      	jne	0x54b45 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2b5>
   54ba1:      	leaq	0x1(%rbx), %rdi
   54ba5:      	movl	$0x4a0, %edx            # imm = 0x4A0
   54baa:      	movq	%r14, %rsi
   54bad:      	callq	0xc4250 <memcpy>
   54bb2:      	movb	$0x0, (%rbx)
   54bb5:      	jmp	0x54983 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0xf3>
   54bba:      	int3
   54bbb:      	int3
   54bbc:      	int3
   54bbd:      	int3
   54bbe:      	int3
   54bbf:      	int3

0000000000054bc0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>:
   54bc0:      	pushq	%rbp
   54bc1:      	movq	%rsp, %rbp
   54bc4:      	pushq	%r15
   54bc6:      	pushq	%r14
   54bc8:      	pushq	%r13
   54bca:      	pushq	%r12
   54bcc:      	pushq	%rbx
   54bcd:      	subq	$0x1000, %rsp           # imm = 0x1000
   54bd4:      	movq	$0x0, (%rsp)
   54bdc:      	subq	$0xc88, %rsp            # imm = 0xC88
   54be3:      	movq	%rdx, -0x60(%rbp)
   54be7:      	movq	%rsi, %r15
   54bea:      	movq	%rdi, -0x58(%rbp)
   54bee:      	leaq	-0x1270(%rbp), %rax
   54bf5:      	movq	%rax, -0xc70(%rbp)
   54bfc:      	movq	$0x3, -0xc68(%rbp)
   54c07:      	xorl	%r14d, %r14d
   54c0a:      	leaq	-0xa70(%rbp), %rdi
   54c11:      	movq	%rcx, -0x38(%rbp)
   54c15:      	movq	%rcx, %rsi
   54c18:      	xorl	%edx, %edx
   54c1a:      	callq	0x58240 <toyos_crypto::mlkem::noise>
   54c1f:      	xorl	%r14d, %r14d
   54c22:      	leaq	-0x1cb0(%rbp), %rdi
   54c29:      	leaq	-0xa70(%rbp), %rsi
   54c30:      	callq	0x576b0 <<toyos_crypto::mlkem::Poly>::ntt>
   54c35:      	leaq	-0x270(%rbp), %rbx
   54c3c:      	leaq	-0x1cb0(%rbp), %rsi
   54c43:      	movl	$0x200, %edx            # imm = 0x200
   54c48:      	movq	%rbx, %rdi
   54c4b:      	callq	0xc4250 <memcpy>
   54c50:      	leaq	-0x470(%rbp), %r14
   54c57:      	movl	$0x200, %edx            # imm = 0x200
   54c5c:      	movq	%r14, %rdi
   54c5f:      	movq	%rbx, %rsi
   54c62:      	callq	0xc4250 <memcpy>
   54c67:      	leaq	-0x1870(%rbp), %rbx
   54c6e:      	movl	$0x200, %edx            # imm = 0x200
   54c73:      	movq	%rbx, %rdi
   54c76:      	movq	%r14, %rsi
   54c79:      	callq	0xc4250 <memcpy>
   54c7e:      	leaq	-0x1270(%rbp), %rdi
   54c85:      	movl	$0x200, %edx            # imm = 0x200
   54c8a:      	movq	%rbx, %rsi
   54c8d:      	callq	0xc4250 <memcpy>
   54c92:      	movl	$0x1, %r14d
   54c98:      	leaq	-0xa70(%rbp), %rdi
   54c9f:      	movq	-0x38(%rbp), %rsi
   54ca3:      	movl	$0x1, %edx
   54ca8:      	callq	0x58240 <toyos_crypto::mlkem::noise>
   54cad:      	leaq	-0x1cb0(%rbp), %rdi
   54cb4:      	leaq	-0xa70(%rbp), %rsi
   54cbb:      	callq	0x576b0 <<toyos_crypto::mlkem::Poly>::ntt>
   54cc0:      	leaq	-0x270(%rbp), %rbx
   54cc7:      	leaq	-0x1cb0(%rbp), %rsi
   54cce:      	movl	$0x200, %edx            # imm = 0x200
   54cd3:      	movq	%rbx, %rdi
   54cd6:      	callq	0xc4250 <memcpy>
   54cdb:      	leaq	-0x470(%rbp), %r14
   54ce2:      	movl	$0x200, %edx            # imm = 0x200
   54ce7:      	movq	%r14, %rdi
   54cea:      	movq	%rbx, %rsi
   54ced:      	callq	0xc4250 <memcpy>
   54cf2:      	leaq	-0x1870(%rbp), %rbx
   54cf9:      	movl	$0x200, %edx            # imm = 0x200
   54cfe:      	movq	%rbx, %rdi
   54d01:      	movq	%r14, %rsi
   54d04:      	callq	0xc4250 <memcpy>
   54d09:      	leaq	-0x1070(%rbp), %rdi
   54d10:      	movl	$0x200, %edx            # imm = 0x200
   54d15:      	movq	%rbx, %rsi
   54d18:      	callq	0xc4250 <memcpy>
   54d1d:      	movl	$0x2, %r14d
   54d23:      	leaq	-0xa70(%rbp), %rdi
   54d2a:      	movq	-0x38(%rbp), %rsi
   54d2e:      	movl	$0x2, %edx
   54d33:      	callq	0x58240 <toyos_crypto::mlkem::noise>
   54d38:      	leaq	-0x1cb0(%rbp), %rdi
   54d3f:      	leaq	-0xa70(%rbp), %rsi
   54d46:      	callq	0x576b0 <<toyos_crypto::mlkem::Poly>::ntt>
   54d4b:      	movq	%r15, -0x68(%rbp)
   54d4f:      	leaq	0x480(%r15), %r12
   54d56:      	leaq	-0x270(%rbp), %rbx
   54d5d:      	leaq	-0x1cb0(%rbp), %rsi
   54d64:      	movl	$0x200, %edx            # imm = 0x200
   54d69:      	movq	%rbx, %rdi
   54d6c:      	callq	0xc4250 <memcpy>
   54d71:      	leaq	-0x470(%rbp), %r14
   54d78:      	movl	$0x200, %edx            # imm = 0x200
   54d7d:      	movq	%r14, %rdi
   54d80:      	movq	%rbx, %rsi
   54d83:      	callq	0xc4250 <memcpy>
   54d88:      	leaq	-0x1870(%rbp), %r15
   54d8f:      	movl	$0x200, %edx            # imm = 0x200
   54d94:      	movq	%r15, %rdi
   54d97:      	movq	%r14, %rsi
   54d9a:      	movq	%rbx, %r14
   54d9d:      	callq	0xc4250 <memcpy>
   54da2:      	leaq	-0xe70(%rbp), %rdi
   54da9:      	movl	$0x200, %edx            # imm = 0x200
   54dae:      	movq	%r15, %rsi
   54db1:      	callq	0xc4250 <memcpy>
   54db6:      	leaq	-0x1870(%rbp), %rdi
   54dbd:      	movl	$0x600, %edx            # imm = 0x600
   54dc2:      	leaq	-0x1270(%rbp), %r15
   54dc9:      	movq	%r15, %rsi
   54dcc:      	callq	0xc4250 <memcpy>
   54dd1:      	leaq	-0x1cb0(%rbp), %rdi
   54dd8:      	movq	$0x0, -0x30(%rbp)
   54de0:      	movl	$0x440, %edx            # imm = 0x440
   54de5:      	xorl	%esi, %esi
   54de7:      	callq	0xc49a0 <memset>
   54dec:      	leaq	-0xc70(%rbp), %rbx
   54df3:      	leaq	-0xa70(%rbp), %r13
   54dfa:      	movq	%r12, -0x70(%rbp)
   54dfe:      	nop
   54e00:      	movq	%r15, -0x50(%rbp)
   54e04:      	movq	$0x3, -0x48(%rbp)
   54e0c:      	xorl	%r15d, %r15d
   54e0f:      	movq	%r14, %rdi
   54e12:      	movq	%r12, %rsi
   54e15:      	xorl	%edx, %edx
   54e17:      	movq	-0x30(%rbp), %rcx
   54e1b:      	callq	0x58660 <toyos_crypto::mlkem::sample>
   54e20:      	movl	$0x200, %edx            # imm = 0x200
   54e25:      	leaq	-0x470(%rbp), %r15
   54e2c:      	movq	%r15, %rdi
   54e2f:      	leaq	-0x270(%rbp), %r14
   54e36:      	movq	%r14, %rsi
   54e39:      	callq	0xc4250 <memcpy>
   54e3e:      	movl	$0x200, %edx            # imm = 0x200
   54e43:      	movq	%rbx, %rdi
   54e46:      	movq	%r15, %rsi
   54e49:      	callq	0xc4250 <memcpy>
   54e4e:      	movl	$0x200, %edx            # imm = 0x200
   54e53:      	movq	%r13, %rdi
   54e56:      	movq	%rbx, %rsi
   54e59:      	callq	0xc4250 <memcpy>
   54e5e:      	movl	$0x200, %edx            # imm = 0x200
   54e63:      	leaq	-0x1270(%rbp), %rdi
   54e6a:      	movq	%r13, %rsi
   54e6d:      	callq	0xc4250 <memcpy>
   54e72:      	movl	$0x1, %r15d
   54e78:      	movl	$0x1, %edx
   54e7d:      	movq	%r14, %rdi
   54e80:      	movq	%r12, %rsi
   54e83:      	movq	-0x30(%rbp), %rcx
   54e87:      	callq	0x58660 <toyos_crypto::mlkem::sample>
   54e8c:      	movl	$0x200, %edx            # imm = 0x200
   54e91:      	leaq	-0x470(%rbp), %r15
   54e98:      	movq	%r15, %rdi
   54e9b:      	movq	%r14, %rsi
   54e9e:      	callq	0xc4250 <memcpy>
   54ea3:      	movl	$0x200, %edx            # imm = 0x200
   54ea8:      	movq	%rbx, %rdi
   54eab:      	movq	%r15, %rsi
   54eae:      	callq	0xc4250 <memcpy>
   54eb3:      	movl	$0x200, %edx            # imm = 0x200
   54eb8:      	movq	%r13, %rdi
   54ebb:      	movq	%rbx, %rsi
   54ebe:      	callq	0xc4250 <memcpy>
   54ec3:      	movl	$0x200, %edx            # imm = 0x200
   54ec8:      	leaq	-0x1070(%rbp), %rdi
   54ecf:      	movq	%r13, %rsi
   54ed2:      	callq	0xc4250 <memcpy>
   54ed7:      	movl	$0x2, %r15d
   54edd:      	movl	$0x2, %edx
   54ee2:      	movq	%r14, %rdi
   54ee5:      	movq	%r12, %rsi
   54ee8:      	movq	-0x30(%rbp), %rcx
   54eec:      	callq	0x58660 <toyos_crypto::mlkem::sample>
   54ef1:      	movq	-0x30(%rbp), %r14
   54ef5:      	movl	$0x200, %edx            # imm = 0x200
   54efa:      	leaq	-0x470(%rbp), %r15
   54f01:      	movq	%r15, %rdi
   54f04:      	leaq	-0x270(%rbp), %r12
   54f0b:      	movq	%r12, %rsi
   54f0e:      	callq	0xc4250 <memcpy>
   54f13:      	movl	$0x200, %edx            # imm = 0x200
   54f18:      	movq	%rbx, %rdi
   54f1b:      	movq	%r15, %rsi
   54f1e:      	callq	0xc4250 <memcpy>
   54f23:      	movl	$0x200, %edx            # imm = 0x200
   54f28:      	movq	%r13, %rdi
   54f2b:      	movq	%rbx, %rsi
   54f2e:      	callq	0xc4250 <memcpy>
   54f33:      	movl	$0x200, %edx            # imm = 0x200
   54f38:      	leaq	-0xe70(%rbp), %rdi
   54f3f:      	movq	%r13, %rsi
   54f42:      	callq	0xc4250 <memcpy>
   54f47:      	movl	$0x600, %edx            # imm = 0x600
   54f4c:      	movq	%r13, %rdi
   54f4f:      	leaq	-0x1270(%rbp), %r15
   54f56:      	movq	%r15, %rsi
   54f59:      	callq	0xc4250 <memcpy>
   54f5e:      	movq	%r15, %rdi
   54f61:      	movq	%r13, %rsi
   54f64:      	leaq	-0x1870(%rbp), %rdx
   54f6b:      	callq	0x57f30 <toyos_crypto::mlkem::dot>
   54f70:      	movq	%r12, %rdi
   54f73:      	movq	%r15, %rsi
   54f76:      	callq	0x57b60 <<toyos_crypto::mlkem::Poly>::inverse>
   54f7b:      	leal	0x3(%r14), %eax
   54f7f:      	movzbl	%al, %edx
   54f82:      	movq	%r15, %rdi
   54f85:      	movq	-0x38(%rbp), %rsi
   54f89:      	callq	0x58240 <toyos_crypto::mlkem::noise>
   54f8e:      	leaq	-0x470(%rbp), %rdi
   54f95:      	movq	%r12, %rsi
   54f98:      	movq	%r15, %rdx
   54f9b:      	callq	0x57910 <<toyos_crypto::mlkem::Poly>::plus>
   54fa0:      	leaq	0x1(%r14), %r15
   54fa4:      	xorl	%eax, %eax
   54fa6:      	leaq	-0x470(%rbp), %rsi
   54fad:      	nopl	(%rax)
   54fb0:      	movswl	-0x470(%rbp,%rax), %ecx
   54fb8:      	imull	$0x4ebf, %ecx, %edx     # imm = 0x4EBF
   54fbe:      	addl	$0x2000000, %edx        # imm = 0x2000000
   54fc4:      	sarl	$0x1a, %edx
   54fc7:      	imull	$0xfffff2ff, %edx, %edx # imm = 0xFFFFF2FF
   54fcd:      	addl	%ecx, %edx
   54fcf:      	movswl	%dx, %ecx
   54fd2:      	movl	%ecx, %edx
   54fd4:      	shrl	$0xf, %edx
   54fd7:      	andl	$0xd01, %edx            # imm = 0xD01
   54fdd:      	addw	%dx, %cx
   54fe0:      	jo	0x55911 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd51>
   54fe6:      	movswl	%cx, %ecx
   54fe9:      	shll	$0xa, %ecx
   54fec:      	cmpl	$0xfffff97f, %ecx       # imm = 0xFFFFF97F
   54ff2:      	ja	0x5591f <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd5f>
   54ff8:      	addl	$0x680, %ecx            # imm = 0x680
   54ffe:      	imulq	$0x275f6f, %rcx, %rcx   # imm = 0x275F6F
   55005:      	shrq	$0x21, %rcx
   55009:      	andl	$0x3ff, %ecx            # imm = 0x3FF
   5500f:      	movw	%cx, -0x470(%rbp,%rax)
   55017:      	addq	$0x2, %rax
   5501b:      	cmpq	$0x200, %rax            # imm = 0x200
   55021:      	jne	0x54fb0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3f0>
   55023:      	movl	$0x200, %edx            # imm = 0x200
   55028:      	movq	%r12, %rdi
   5502b:      	callq	0xc4250 <memcpy>
   55030:      	leaq	(%r14,%r14,4), %rax
   55034:      	shlq	$0x6, %rax
   55038:      	leaq	(%rax,%rbp), %rsi
   5503c:      	addq	$-0x1cb0, %rsi          # imm = 0xE350
   55043:      	movl	$0x140, %edx            # imm = 0x140
   55048:      	movq	%r12, %r14
   5504b:      	movq	%r12, %rdi
   5504e:      	callq	0x59420 <<toyos_crypto::mlkem::Poly>::encode::<10>>
   55053:      	xorl	%eax, %eax
   55055:      	movq	-0x70(%rbp), %r12
   55059:      	leaq	-0xa70(%rbp), %r13
   55060:      	movw	$0x0, -0x270(%rbp,%rax)
   5506a:      	movw	$0x0, -0x26e(%rbp,%rax)
   55074:      	movw	$0x0, -0x26c(%rbp,%rax)
   5507e:      	movw	$0x0, -0x26a(%rbp,%rax)
   55088:      	movw	$0x0, -0x268(%rbp,%rax)
   55092:      	movw	$0x0, -0x266(%rbp,%rax)
   5509c:      	movw	$0x0, -0x264(%rbp,%rax)
   550a6:      	movw	$0x0, -0x262(%rbp,%rax)
   550b0:      	addq	$0x10, %rax
   550b4:      	cmpq	$0x200, %rax            # imm = 0x200
   550ba:      	jne	0x55060 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4a0>
   550bc:      	xorl	%eax, %eax
   550be:      	nop
   550c0:      	movw	$0x0, -0x1270(%rbp,%rax)
   550ca:      	movw	$0x0, -0x126e(%rbp,%rax)
   550d4:      	movw	$0x0, -0x126c(%rbp,%rax)
   550de:      	movw	$0x0, -0x126a(%rbp,%rax)
   550e8:      	movw	$0x0, -0x1268(%rbp,%rax)
   550f2:      	movw	$0x0, -0x1266(%rbp,%rax)
   550fc:      	movw	$0x0, -0x1264(%rbp,%rax)
   55106:      	movw	$0x0, -0x1262(%rbp,%rax)
   55110:      	addq	$0x10, %rax
   55114:      	cmpq	$0x200, %rax            # imm = 0x200
   5511a:      	jne	0x550c0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x500>
   5511c:      	xorl	%eax, %eax
   5511e:      	nop
   55120:      	movw	$0x0, -0xa70(%rbp,%rax)
   5512a:      	movw	$0x0, -0xa6e(%rbp,%rax)
   55134:      	movw	$0x0, -0xa6c(%rbp,%rax)
   5513e:      	movw	$0x0, -0xa6a(%rbp,%rax)
   55148:      	movw	$0x0, -0xa68(%rbp,%rax)
   55152:      	movw	$0x0, -0xa66(%rbp,%rax)
   5515c:      	movw	$0x0, -0xa64(%rbp,%rax)
   55166:      	movw	$0x0, -0xa62(%rbp,%rax)
   55170:      	addq	$0x10, %rax
   55174:      	cmpq	$0x200, %rax            # imm = 0x200
   5517a:      	jne	0x55120 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x560>
   5517c:      	xorl	%eax, %eax
   5517e:      	nop
   55180:      	movw	$0x0, -0x870(%rbp,%rax)
   5518a:      	movw	$0x0, -0x86e(%rbp,%rax)
   55194:      	movw	$0x0, -0x86c(%rbp,%rax)
   5519e:      	movw	$0x0, -0x86a(%rbp,%rax)
   551a8:      	movw	$0x0, -0x868(%rbp,%rax)
   551b2:      	movw	$0x0, -0x866(%rbp,%rax)
   551bc:      	movw	$0x0, -0x864(%rbp,%rax)
   551c6:      	movw	$0x0, -0x862(%rbp,%rax)
   551d0:      	addq	$0x10, %rax
   551d4:      	cmpq	$0x200, %rax            # imm = 0x200
   551da:      	jne	0x55180 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5c0>
   551dc:      	xorl	%eax, %eax
   551de:      	nop
   551e0:      	movw	$0x0, -0x670(%rbp,%rax)
   551ea:      	movw	$0x0, -0x66e(%rbp,%rax)
   551f4:      	movw	$0x0, -0x66c(%rbp,%rax)
   551fe:      	movw	$0x0, -0x66a(%rbp,%rax)
   55208:      	movw	$0x0, -0x668(%rbp,%rax)
   55212:      	movw	$0x0, -0x666(%rbp,%rax)
   5521c:      	movw	$0x0, -0x664(%rbp,%rax)
   55226:      	movw	$0x0, -0x662(%rbp,%rax)
   55230:      	addq	$0x10, %rax
   55234:      	cmpq	$0x200, %rax            # imm = 0x200
   5523a:      	jne	0x551e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x620>
   5523c:      	movq	%r15, -0x30(%rbp)
   55240:      	cmpq	$0x3, %r15
   55244:      	leaq	-0x1270(%rbp), %r15
   5524b:      	jne	0x54e00 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x240>
   55251:      	movq	%r15, -0x50(%rbp)
   55255:      	movq	$0x3, -0x48(%rbp)
   5525d:      	xorl	%r14d, %r14d
   55260:      	leaq	-0x270(%rbp), %rdi
   55267:      	movl	$0x180, %edx            # imm = 0x180
   5526c:      	movq	-0x68(%rbp), %r12
   55270:      	movq	%r12, %rsi
   55273:      	callq	0x58f50 <<toyos_crypto::mlkem::Poly>::decode::<12>>
   55278:      	leaq	-0x470(%rbp), %r14
   5527f:      	leaq	-0x270(%rbp), %rbx
   55286:      	movl	$0x200, %edx            # imm = 0x200
   5528b:      	movq	%r14, %rdi
   5528e:      	movq	%rbx, %rsi
   55291:      	callq	0xc4250 <memcpy>
   55296:      	leaq	-0xc70(%rbp), %r15
   5529d:      	movl	$0x200, %edx            # imm = 0x200
   552a2:      	movq	%r15, %rdi
   552a5:      	movq	%r14, %rsi
   552a8:      	callq	0xc4250 <memcpy>
   552ad:      	leaq	-0xa70(%rbp), %r14
   552b4:      	movl	$0x200, %edx            # imm = 0x200
   552b9:      	movq	%r14, %rdi
   552bc:      	movq	%r15, %rsi
   552bf:      	callq	0xc4250 <memcpy>
   552c4:      	leaq	-0x1270(%rbp), %rdi
   552cb:      	movl	$0x200, %edx            # imm = 0x200
   552d0:      	movq	%r14, %rsi
   552d3:      	callq	0xc4250 <memcpy>
   552d8:      	leaq	0x180(%r12), %rsi
   552e0:      	movl	$0x1, %r14d
   552e6:      	movl	$0x180, %edx            # imm = 0x180
   552eb:      	movq	%rbx, %rdi
   552ee:      	callq	0x58f50 <<toyos_crypto::mlkem::Poly>::decode::<12>>
   552f3:      	leaq	-0x470(%rbp), %r14
   552fa:      	movl	$0x200, %edx            # imm = 0x200
   552ff:      	movq	%r14, %rdi
   55302:      	movq	%rbx, %rsi
   55305:      	callq	0xc4250 <memcpy>
   5530a:      	movl	$0x200, %edx            # imm = 0x200
   5530f:      	movq	%r15, %rdi
   55312:      	movq	%r14, %rsi
   55315:      	callq	0xc4250 <memcpy>
   5531a:      	leaq	-0xa70(%rbp), %r14
   55321:      	movl	$0x200, %edx            # imm = 0x200
   55326:      	movq	%r14, %rdi
   55329:      	movq	%r15, %rsi
   5532c:      	callq	0xc4250 <memcpy>
   55331:      	leaq	-0x1070(%rbp), %rdi
   55338:      	movl	$0x200, %edx            # imm = 0x200
   5533d:      	movq	%r14, %rsi
   55340:      	callq	0xc4250 <memcpy>
   55345:      	addq	$0x300, %r12            # imm = 0x300
   5534c:      	movl	$0x2, %r14d
   55352:      	movl	$0x180, %edx            # imm = 0x180
   55357:      	movq	%rbx, %rdi
   5535a:      	movq	%r12, %rsi
   5535d:      	callq	0x58f50 <<toyos_crypto::mlkem::Poly>::decode::<12>>
   55362:      	leaq	-0x470(%rbp), %rbx
   55369:      	leaq	-0x270(%rbp), %rsi
   55370:      	movl	$0x200, %edx            # imm = 0x200
   55375:      	movq	%rbx, %rdi
   55378:      	callq	0xc4250 <memcpy>
   5537d:      	leaq	-0xc70(%rbp), %r14
   55384:      	movl	$0x200, %edx            # imm = 0x200
   55389:      	movq	%r14, %rdi
   5538c:      	movq	%rbx, %rsi
   5538f:      	callq	0xc4250 <memcpy>
   55394:      	leaq	-0xa70(%rbp), %rbx
   5539b:      	movl	$0x200, %edx            # imm = 0x200
   553a0:      	movq	%rbx, %rdi
   553a3:      	movq	%r14, %rsi
   553a6:      	callq	0xc4250 <memcpy>
   553ab:      	leaq	-0xe70(%rbp), %rdi
   553b2:      	movl	$0x200, %edx            # imm = 0x200
   553b7:      	movq	%rbx, %rsi
   553ba:      	callq	0xc4250 <memcpy>
   553bf:      	leaq	-0x1270(%rbp), %rsi
   553c6:      	movl	$0x600, %edx            # imm = 0x600
   553cb:      	movq	%rbx, %rdi
   553ce:      	callq	0xc4250 <memcpy>
   553d3:      	leaq	-0x1270(%rbp), %rdi
   553da:      	leaq	-0x1870(%rbp), %rdx
   553e1:      	movq	%rbx, %rsi
   553e4:      	callq	0x57f30 <toyos_crypto::mlkem::dot>
   553e9:      	leaq	-0x270(%rbp), %rdi
   553f0:      	leaq	-0x1270(%rbp), %rsi
   553f7:      	callq	0x57b60 <<toyos_crypto::mlkem::Poly>::inverse>
   553fc:      	leaq	-0x470(%rbp), %rdi
   55403:      	movq	-0x38(%rbp), %rsi
   55407:      	movl	$0x6, %edx
   5540c:      	callq	0x58240 <toyos_crypto::mlkem::noise>
   55411:      	leaq	-0xc70(%rbp), %rdi
   55418:      	leaq	-0x270(%rbp), %rsi
   5541f:      	leaq	-0x470(%rbp), %rdx
   55426:      	callq	0x57910 <<toyos_crypto::mlkem::Poly>::plus>
   5542b:      	leaq	-0x1270(%rbp), %rdi
   55432:      	movl	$0x20, %edx
   55437:      	movq	-0x60(%rbp), %rsi
   5543b:      	callq	0x58990 <<toyos_crypto::mlkem::Poly>::decode::<1>>
   55440:      	movl	$0x2, %ecx
   55445:      	movl	$0xd01, %esi            # imm = 0xD01
   5544a:      	nopw	(%rax,%rax)
   55450:      	movswl	-0x1272(%rbp,%rcx), %eax
   55458:      	mull	%esi
   5545a:      	jo	0x5592d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd6d>
   55460:      	incl	%eax
   55462:      	shrl	%eax
   55464:      	movw	%ax, -0x1272(%rbp,%rcx)
   5546c:      	movswl	-0x1270(%rbp,%rcx), %eax
   55474:      	mull	%esi
   55476:      	jo	0x5592d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd6d>
   5547c:      	incl	%eax
   5547e:      	shrl	%eax
   55480:      	movw	%ax, -0x1270(%rbp,%rcx)
   55488:      	addq	$0x4, %rcx
   5548c:      	cmpq	$0x202, %rcx            # imm = 0x202
   55493:      	jne	0x55450 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x890>
   55495:      	leaq	-0x270(%rbp), %rbx
   5549c:      	leaq	-0x1270(%rbp), %rsi
   554a3:      	movl	$0x200, %edx            # imm = 0x200
   554a8:      	movq	%rbx, %rdi
   554ab:      	callq	0xc4250 <memcpy>
   554b0:      	leaq	-0x1270(%rbp), %rdi
   554b7:      	leaq	-0xc70(%rbp), %rsi
   554be:      	movq	%rbx, %rdx
   554c1:      	callq	0x57910 <<toyos_crypto::mlkem::Poly>::plus>
   554c6:      	xorl	%eax, %eax
   554c8:      	nopl	(%rax,%rax)
   554d0:      	movswl	-0x1270(%rbp,%rax), %ecx
   554d8:      	imull	$0x4ebf, %ecx, %edx     # imm = 0x4EBF
   554de:      	addl	$0x2000000, %edx        # imm = 0x2000000
   554e4:      	sarl	$0x1a, %edx
   554e7:      	imull	$0xfffff2ff, %edx, %edx # imm = 0xFFFFF2FF
   554ed:      	addl	%ecx, %edx
   554ef:      	movswl	%dx, %ecx
   554f2:      	movl	%ecx, %edx
   554f4:      	shrl	$0xf, %edx
   554f7:      	andl	$0xd01, %edx            # imm = 0xD01
   554fd:      	addw	%dx, %cx
   55500:      	jo	0x5593b <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd7b>
   55506:      	movswl	%cx, %ecx
   55509:      	shll	$0x4, %ecx
   5550c:      	cmpl	$0xfffff97f, %ecx       # imm = 0xFFFFF97F
   55512:      	ja	0x55949 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd89>
   55518:      	addl	$0x680, %ecx            # imm = 0x680
   5551e:      	imulq	$0x275f6f, %rcx, %rcx   # imm = 0x275F6F
   55525:      	shrq	$0x21, %rcx
   55529:      	andl	$0xf, %ecx
   5552c:      	movw	%cx, -0x1270(%rbp,%rax)
   55534:      	addq	$0x2, %rax
   55538:      	cmpq	$0x200, %rax            # imm = 0x200
   5553e:      	jne	0x554d0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x910>
   55540:      	leaq	-0xc70(%rbp), %rbx
   55547:      	leaq	-0x1270(%rbp), %rsi
   5554e:      	movl	$0x200, %edx            # imm = 0x200
   55553:      	movq	%rbx, %rdi
   55556:      	callq	0xc4250 <memcpy>
   5555b:      	leaq	-0x18f0(%rbp), %rsi
   55562:      	movl	$0x80, %edx
   55567:      	movq	%rbx, %rdi
   5556a:      	callq	0x592b0 <<toyos_crypto::mlkem::Poly>::encode::<4>>
   5556f:      	xorl	%eax, %eax
   55571:      	movq	-0x58(%rbp), %rbx
   55575:      	nopw	%cs:(%rax,%rax)
   55580:      	movw	$0x0, -0xc70(%rbp,%rax)
   5558a:      	movw	$0x0, -0xc6e(%rbp,%rax)
   55594:      	movw	$0x0, -0xc6c(%rbp,%rax)
   5559e:      	movw	$0x0, -0xc6a(%rbp,%rax)
   555a8:      	movw	$0x0, -0xc68(%rbp,%rax)
   555b2:      	movw	$0x0, -0xc66(%rbp,%rax)
   555bc:      	movw	$0x0, -0xc64(%rbp,%rax)
   555c6:      	movw	$0x0, -0xc62(%rbp,%rax)
   555d0:      	addq	$0x10, %rax
   555d4:      	cmpq	$0x200, %rax            # imm = 0x200
   555da:      	jne	0x55580 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9c0>
   555dc:      	xorl	%eax, %eax
   555de:      	nop
   555e0:      	movw	$0x0, -0x270(%rbp,%rax)
   555ea:      	movw	$0x0, -0x26e(%rbp,%rax)
   555f4:      	movw	$0x0, -0x26c(%rbp,%rax)
   555fe:      	movw	$0x0, -0x26a(%rbp,%rax)
   55608:      	movw	$0x0, -0x268(%rbp,%rax)
   55612:      	movw	$0x0, -0x266(%rbp,%rax)
   5561c:      	movw	$0x0, -0x264(%rbp,%rax)
   55626:      	movw	$0x0, -0x262(%rbp,%rax)
   55630:      	addq	$0x10, %rax
   55634:      	cmpq	$0x200, %rax            # imm = 0x200
   5563a:      	jne	0x555e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa20>
   5563c:      	xorl	%eax, %eax
   5563e:      	nop
   55640:      	movw	$0x0, -0x470(%rbp,%rax)
   5564a:      	movw	$0x0, -0x46e(%rbp,%rax)
   55654:      	movw	$0x0, -0x46c(%rbp,%rax)
   5565e:      	movw	$0x0, -0x46a(%rbp,%rax)
   55668:      	movw	$0x0, -0x468(%rbp,%rax)
   55672:      	movw	$0x0, -0x466(%rbp,%rax)
   5567c:      	movw	$0x0, -0x464(%rbp,%rax)
   55686:      	movw	$0x0, -0x462(%rbp,%rax)
   55690:      	addq	$0x10, %rax
   55694:      	cmpq	$0x200, %rax            # imm = 0x200
   5569a:      	jne	0x55640 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa80>
   5569c:      	leaq	-0x1cb0(%rbp), %rsi
   556a3:      	movl	$0x440, %edx            # imm = 0x440
   556a8:      	movq	%rbx, %rdi
   556ab:      	callq	0xc4250 <memcpy>
   556b0:      	xorl	%eax, %eax
   556b2:      	nopw	%cs:(%rax,%rax)
   556c0:      	movw	$0x0, -0xa70(%rbp,%rax)
   556ca:      	movw	$0x0, -0xa6e(%rbp,%rax)
   556d4:      	movw	$0x0, -0xa6c(%rbp,%rax)
   556de:      	movw	$0x0, -0xa6a(%rbp,%rax)
   556e8:      	movw	$0x0, -0xa68(%rbp,%rax)
   556f2:      	movw	$0x0, -0xa66(%rbp,%rax)
   556fc:      	movw	$0x0, -0xa64(%rbp,%rax)
   55706:      	movw	$0x0, -0xa62(%rbp,%rax)
   55710:      	addq	$0x10, %rax
   55714:      	cmpq	$0x200, %rax            # imm = 0x200
   5571a:      	jne	0x556c0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb00>
   5571c:      	xorl	%eax, %eax
   5571e:      	nop
   55720:      	movw	$0x0, -0x870(%rbp,%rax)
   5572a:      	movw	$0x0, -0x86e(%rbp,%rax)
   55734:      	movw	$0x0, -0x86c(%rbp,%rax)
   5573e:      	movw	$0x0, -0x86a(%rbp,%rax)
   55748:      	movw	$0x0, -0x868(%rbp,%rax)
   55752:      	movw	$0x0, -0x866(%rbp,%rax)
   5575c:      	movw	$0x0, -0x864(%rbp,%rax)
   55766:      	movw	$0x0, -0x862(%rbp,%rax)
   55770:      	addq	$0x10, %rax
   55774:      	cmpq	$0x200, %rax            # imm = 0x200
   5577a:      	jne	0x55720 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb60>
   5577c:      	xorl	%eax, %eax
   5577e:      	nop
   55780:      	movw	$0x0, -0x670(%rbp,%rax)
   5578a:      	movw	$0x0, -0x66e(%rbp,%rax)
   55794:      	movw	$0x0, -0x66c(%rbp,%rax)
   5579e:      	movw	$0x0, -0x66a(%rbp,%rax)
   557a8:      	movw	$0x0, -0x668(%rbp,%rax)
   557b2:      	movw	$0x0, -0x666(%rbp,%rax)
   557bc:      	movw	$0x0, -0x664(%rbp,%rax)
   557c6:      	movw	$0x0, -0x662(%rbp,%rax)
   557d0:      	addq	$0x10, %rax
   557d4:      	cmpq	$0x200, %rax            # imm = 0x200
   557da:      	jne	0x55780 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbc0>
   557dc:      	xorl	%eax, %eax
   557de:      	nop
   557e0:      	movw	$0x0, -0x1870(%rbp,%rax)
   557ea:      	movw	$0x0, -0x186e(%rbp,%rax)
   557f4:      	movw	$0x0, -0x186c(%rbp,%rax)
   557fe:      	movw	$0x0, -0x186a(%rbp,%rax)
   55808:      	movw	$0x0, -0x1868(%rbp,%rax)
   55812:      	movw	$0x0, -0x1866(%rbp,%rax)
   5581c:      	movw	$0x0, -0x1864(%rbp,%rax)
   55826:      	movw	$0x0, -0x1862(%rbp,%rax)
   55830:      	addq	$0x10, %rax
   55834:      	cmpq	$0x200, %rax            # imm = 0x200
   5583a:      	jne	0x557e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc20>
   5583c:      	xorl	%eax, %eax
   5583e:      	nop
   55840:      	movw	$0x0, -0x1670(%rbp,%rax)
   5584a:      	movw	$0x0, -0x166e(%rbp,%rax)
   55854:      	movw	$0x0, -0x166c(%rbp,%rax)
   5585e:      	movw	$0x0, -0x166a(%rbp,%rax)
   55868:      	movw	$0x0, -0x1668(%rbp,%rax)
   55872:      	movw	$0x0, -0x1666(%rbp,%rax)
   5587c:      	movw	$0x0, -0x1664(%rbp,%rax)
   55886:      	movw	$0x0, -0x1662(%rbp,%rax)
   55890:      	addq	$0x10, %rax
   55894:      	cmpq	$0x200, %rax            # imm = 0x200
   5589a:      	jne	0x55840 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc80>
   5589c:      	xorl	%eax, %eax
   5589e:      	nop
   558a0:      	movw	$0x0, -0x1470(%rbp,%rax)
   558aa:      	movw	$0x0, -0x146e(%rbp,%rax)
   558b4:      	movw	$0x0, -0x146c(%rbp,%rax)
   558be:      	movw	$0x0, -0x146a(%rbp,%rax)
   558c8:      	movw	$0x0, -0x1468(%rbp,%rax)
   558d2:      	movw	$0x0, -0x1466(%rbp,%rax)
   558dc:      	movw	$0x0, -0x1464(%rbp,%rax)
   558e6:      	movw	$0x0, -0x1462(%rbp,%rax)
   558f0:      	addq	$0x10, %rax
   558f4:      	cmpq	$0x200, %rax            # imm = 0x200
   558fa:      	jne	0x558a0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xce0>
   558fc:      	movq	%rbx, %rax
   558ff:      	addq	$0x1c88, %rsp           # imm = 0x1C88
   55906:      	popq	%rbx
   55907:      	popq	%r12
   55909:      	popq	%r13
   5590b:      	popq	%r14
   5590d:      	popq	%r15
   5590f:      	popq	%rbp
   55910:      	retq
   55911:      	leaq	0x70978(%rip), %rdi     # 0xc6290 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526+0x168>
   55918:      	callq	0xbe870 <core::panicking::panic_const::panic_const_add_overflow>
   5591d:      	jmp	0x55955 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd95>
   5591f:      	leaq	0x708f2(%rip), %rdi     # 0xc6218 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526+0xf0>
   55926:      	callq	0xbe870 <core::panicking::panic_const::panic_const_add_overflow>
   5592b:      	jmp	0x55955 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd95>
   5592d:      	leaq	0x70824(%rip), %rdi     # 0xc6158 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526+0x30>
   55934:      	callq	0xbe890 <core::panicking::panic_const::panic_const_mul_overflow>
   55939:      	jmp	0x55955 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd95>
   5593b:      	leaq	0x7094e(%rip), %rdi     # 0xc6290 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526+0x168>
   55942:      	callq	0xbe870 <core::panicking::panic_const::panic_const_add_overflow>
   55947:      	jmp	0x55955 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd95>
   55949:      	leaq	0x708c8(%rip), %rdi     # 0xc6218 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526+0xf0>
   55950:      	callq	0xbe870 <core::panicking::panic_const::panic_const_add_overflow>
   55955:      	ud2
   55957:      	xorl	%ecx, %ecx
   55959:      	nopl	(%rax)
   55960:      	movw	$0x0, -0xc70(%rbp,%rcx)
   5596a:      	movw	$0x0, -0xc6e(%rbp,%rcx)
   55974:      	movw	$0x0, -0xc6c(%rbp,%rcx)
   5597e:      	movw	$0x0, -0xc6a(%rbp,%rcx)
   55988:      	movw	$0x0, -0xc68(%rbp,%rcx)
   55992:      	movw	$0x0, -0xc66(%rbp,%rcx)
   5599c:      	movw	$0x0, -0xc64(%rbp,%rcx)
   559a6:      	movw	$0x0, -0xc62(%rbp,%rcx)
   559b0:      	addq	$0x10, %rcx
   559b4:      	cmpq	$0x200, %rcx            # imm = 0x200
   559bb:      	jne	0x55960 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xda0>
   559bd:      	jmp	0x55bbd <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xffd>
   559c2:      	jmp	0x55bbd <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xffd>
   559c7:      	jmp	0x55c8d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x10cd>
   559cc:      	jmp	0x55ced <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x112d>
   559d1:      	xorl	%ecx, %ecx
   559d3:      	nopw	%cs:(%rax,%rax)
   559e0:      	movw	$0x0, -0x270(%rbp,%rcx)
   559ea:      	movw	$0x0, -0x26e(%rbp,%rcx)
   559f4:      	movw	$0x0, -0x26c(%rbp,%rcx)
   559fe:      	movw	$0x0, -0x26a(%rbp,%rcx)
   55a08:      	movw	$0x0, -0x268(%rbp,%rcx)
   55a12:      	movw	$0x0, -0x266(%rbp,%rcx)
   55a1c:      	movw	$0x0, -0x264(%rbp,%rcx)
   55a26:      	movw	$0x0, -0x262(%rbp,%rcx)
   55a30:      	addq	$0x10, %rcx
   55a34:      	cmpq	$0x200, %rcx            # imm = 0x200
   55a3b:      	jne	0x559e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xe20>
   55a3d:      	jmp	0x55a3f <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xe7f>
   55a3f:      	movq	%rax, %rdi
   55a42:      	jmp	0x55d5c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x119c>
   55a47:      	movq	%rax, %rbx
   55a4a:      	movq	%r14, -0x40(%rbp)
   55a4e:      	jmp	0x55e90 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12d0>
   55a53:      	movq	%rax, %rbx
   55a56:      	movq	%r14, -0xc60(%rbp)
   55a5d:      	leaq	-0xc70(%rbp), %rdi
   55a64:      	callq	0x547f0 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>
   55a69:      	movq	%rbx, %rdi
   55a6c:      	callq	0xb86a0 <_Unwind_Resume>
   55a71:      	xorl	%ecx, %ecx
   55a73:      	nopw	%cs:(%rax,%rax)
   55a80:      	movw	$0x0, -0x270(%rbp,%rcx)
   55a8a:      	movw	$0x0, -0x26e(%rbp,%rcx)
   55a94:      	movw	$0x0, -0x26c(%rbp,%rcx)
   55a9e:      	movw	$0x0, -0x26a(%rbp,%rcx)
   55aa8:      	movw	$0x0, -0x268(%rbp,%rcx)
   55ab2:      	movw	$0x0, -0x266(%rbp,%rcx)
   55abc:      	movw	$0x0, -0x264(%rbp,%rcx)
   55ac6:      	movw	$0x0, -0x262(%rbp,%rcx)
   55ad0:      	addq	$0x10, %rcx
   55ad4:      	cmpq	$0x200, %rcx            # imm = 0x200
   55adb:      	jne	0x55a80 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xec0>
   55add:      	jmp	0x55b52 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xf92>
   55adf:      	xorl	%ecx, %ecx
   55ae1:      	nopw	%cs:(%rax,%rax)
   55af0:      	movw	$0x0, -0x270(%rbp,%rcx)
   55afa:      	movw	$0x0, -0x26e(%rbp,%rcx)
   55b04:      	movw	$0x0, -0x26c(%rbp,%rcx)
   55b0e:      	movw	$0x0, -0x26a(%rbp,%rcx)
   55b18:      	movw	$0x0, -0x268(%rbp,%rcx)
   55b22:      	movw	$0x0, -0x266(%rbp,%rcx)
   55b2c:      	movw	$0x0, -0x264(%rbp,%rcx)
   55b36:      	movw	$0x0, -0x262(%rbp,%rcx)
   55b40:      	addq	$0x10, %rcx
   55b44:      	cmpq	$0x200, %rcx            # imm = 0x200
   55b4b:      	jne	0x55af0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xf30>
   55b4d:      	jmp	0x55e81 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12c1>
   55b52:      	movq	%rax, %rdi
   55b55:      	jmp	0x55f0c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x134c>
   55b5a:      	xorl	%ecx, %ecx
   55b5c:      	nopl	(%rax)
   55b60:      	movw	$0x0, -0x1270(%rbp,%rcx)
   55b6a:      	movw	$0x0, -0x126e(%rbp,%rcx)
   55b74:      	movw	$0x0, -0x126c(%rbp,%rcx)
   55b7e:      	movw	$0x0, -0x126a(%rbp,%rcx)
   55b88:      	movw	$0x0, -0x1268(%rbp,%rcx)
   55b92:      	movw	$0x0, -0x1266(%rbp,%rcx)
   55b9c:      	movw	$0x0, -0x1264(%rbp,%rcx)
   55ba6:      	movw	$0x0, -0x1262(%rbp,%rcx)
   55bb0:      	addq	$0x10, %rcx
   55bb4:      	cmpq	$0x200, %rcx            # imm = 0x200
   55bbb:      	jne	0x55b60 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xfa0>
   55bbd:      	xorl	%ecx, %ecx
   55bbf:      	nop
   55bc0:      	movw	$0x0, -0x270(%rbp,%rcx)
   55bca:      	movw	$0x0, -0x26e(%rbp,%rcx)
   55bd4:      	movw	$0x0, -0x26c(%rbp,%rcx)
   55bde:      	movw	$0x0, -0x26a(%rbp,%rcx)
   55be8:      	movw	$0x0, -0x268(%rbp,%rcx)
   55bf2:      	movw	$0x0, -0x266(%rbp,%rcx)
   55bfc:      	movw	$0x0, -0x264(%rbp,%rcx)
   55c06:      	movw	$0x0, -0x262(%rbp,%rcx)
   55c10:      	addq	$0x10, %rcx
   55c14:      	cmpq	$0x200, %rcx            # imm = 0x200
   55c1b:      	jne	0x55bc0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1000>
   55c1d:      	jmp	0x55ced <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x112d>
   55c22:      	xorl	%ecx, %ecx
   55c24:      	nopw	%cs:(%rax,%rax)
   55c30:      	movw	$0x0, -0x1270(%rbp,%rcx)
   55c3a:      	movw	$0x0, -0x126e(%rbp,%rcx)
   55c44:      	movw	$0x0, -0x126c(%rbp,%rcx)
   55c4e:      	movw	$0x0, -0x126a(%rbp,%rcx)
   55c58:      	movw	$0x0, -0x1268(%rbp,%rcx)
   55c62:      	movw	$0x0, -0x1266(%rbp,%rcx)
   55c6c:      	movw	$0x0, -0x1264(%rbp,%rcx)
   55c76:      	movw	$0x0, -0x1262(%rbp,%rcx)
   55c80:      	addq	$0x10, %rcx
   55c84:      	cmpq	$0x200, %rcx            # imm = 0x200
   55c8b:      	jne	0x55c30 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1070>
   55c8d:      	xorl	%ecx, %ecx
   55c8f:      	nop
   55c90:      	movw	$0x0, -0xc70(%rbp,%rcx)
   55c9a:      	movw	$0x0, -0xc6e(%rbp,%rcx)
   55ca4:      	movw	$0x0, -0xc6c(%rbp,%rcx)
   55cae:      	movw	$0x0, -0xc6a(%rbp,%rcx)
   55cb8:      	movw	$0x0, -0xc68(%rbp,%rcx)
   55cc2:      	movw	$0x0, -0xc66(%rbp,%rcx)
   55ccc:      	movw	$0x0, -0xc64(%rbp,%rcx)
   55cd6:      	movw	$0x0, -0xc62(%rbp,%rcx)
   55ce0:      	addq	$0x10, %rcx
   55ce4:      	cmpq	$0x200, %rcx            # imm = 0x200
   55ceb:      	jne	0x55c90 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x10d0>
   55ced:      	movq	%rax, %rdi
   55cf0:      	xorl	%eax, %eax
   55cf2:      	nopw	%cs:(%rax,%rax)
   55d00:      	movw	$0x0, -0x470(%rbp,%rax)
   55d0a:      	movw	$0x0, -0x46e(%rbp,%rax)
   55d14:      	movw	$0x0, -0x46c(%rbp,%rax)
   55d1e:      	movw	$0x0, -0x46a(%rbp,%rax)
   55d28:      	movw	$0x0, -0x468(%rbp,%rax)
   55d32:      	movw	$0x0, -0x466(%rbp,%rax)
   55d3c:      	movw	$0x0, -0x464(%rbp,%rax)
   55d46:      	movw	$0x0, -0x462(%rbp,%rax)
   55d50:      	addq	$0x10, %rax
   55d54:      	cmpq	$0x200, %rax            # imm = 0x200
   55d5a:      	jne	0x55d00 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1140>
   55d5c:      	xorl	%eax, %eax
   55d5e:      	nop
   55d60:      	movw	$0x0, -0xa70(%rbp,%rax)
   55d6a:      	movw	$0x0, -0xa6e(%rbp,%rax)
   55d74:      	movw	$0x0, -0xa6c(%rbp,%rax)
   55d7e:      	movw	$0x0, -0xa6a(%rbp,%rax)
   55d88:      	movw	$0x0, -0xa68(%rbp,%rax)
   55d92:      	movw	$0x0, -0xa66(%rbp,%rax)
   55d9c:      	movw	$0x0, -0xa64(%rbp,%rax)
   55da6:      	movw	$0x0, -0xa62(%rbp,%rax)
   55db0:      	addq	$0x10, %rax
   55db4:      	cmpq	$0x200, %rax            # imm = 0x200
   55dba:      	jne	0x55d60 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x11a0>
   55dbc:      	xorl	%eax, %eax
   55dbe:      	nop
   55dc0:      	movw	$0x0, -0x870(%rbp,%rax)
   55dca:      	movw	$0x0, -0x86e(%rbp,%rax)
   55dd4:      	movw	$0x0, -0x86c(%rbp,%rax)
   55dde:      	movw	$0x0, -0x86a(%rbp,%rax)
   55de8:      	movw	$0x0, -0x868(%rbp,%rax)
   55df2:      	movw	$0x0, -0x866(%rbp,%rax)
   55dfc:      	movw	$0x0, -0x864(%rbp,%rax)
   55e06:      	movw	$0x0, -0x862(%rbp,%rax)
   55e10:      	addq	$0x10, %rax
   55e14:      	cmpq	$0x200, %rax            # imm = 0x200
   55e1a:      	jne	0x55dc0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1200>
   55e1c:      	xorl	%eax, %eax
   55e1e:      	nop
   55e20:      	movw	$0x0, -0x670(%rbp,%rax)
   55e2a:      	movw	$0x0, -0x66e(%rbp,%rax)
   55e34:      	movw	$0x0, -0x66c(%rbp,%rax)
   55e3e:      	movw	$0x0, -0x66a(%rbp,%rax)
   55e48:      	movw	$0x0, -0x668(%rbp,%rax)
   55e52:      	movw	$0x0, -0x666(%rbp,%rax)
   55e5c:      	movw	$0x0, -0x664(%rbp,%rax)
   55e66:      	movw	$0x0, -0x662(%rbp,%rax)
   55e70:      	addq	$0x10, %rax
   55e74:      	cmpq	$0x200, %rax            # imm = 0x200
   55e7a:      	jne	0x55e20 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1260>
   55e7c:      	jmp	0x5608c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x14cc>
   55e81:      	movq	%rax, %rdi
   55e84:      	jmp	0x55f6c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x13ac>
   55e89:      	movq	%rax, %rbx
   55e8c:      	movq	%r15, -0x40(%rbp)
   55e90:      	leaq	-0x50(%rbp), %rdi
   55e94:      	callq	0x547f0 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>
   55e99:      	movq	%rbx, %rdi
   55e9c:      	jmp	0x5608c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x14cc>
   55ea1:      	movq	%rax, %rdi
   55ea4:      	xorl	%eax, %eax
   55ea6:      	nopw	%cs:(%rax,%rax)
   55eb0:      	movw	$0x0, -0x470(%rbp,%rax)
   55eba:      	movw	$0x0, -0x46e(%rbp,%rax)
   55ec4:      	movw	$0x0, -0x46c(%rbp,%rax)
   55ece:      	movw	$0x0, -0x46a(%rbp,%rax)
   55ed8:      	movw	$0x0, -0x468(%rbp,%rax)
   55ee2:      	movw	$0x0, -0x466(%rbp,%rax)
   55eec:      	movw	$0x0, -0x464(%rbp,%rax)
   55ef6:      	movw	$0x0, -0x462(%rbp,%rax)
   55f00:      	addq	$0x10, %rax
   55f04:      	cmpq	$0x200, %rax            # imm = 0x200
   55f0a:      	jne	0x55eb0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12f0>
   55f0c:      	xorl	%eax, %eax
   55f0e:      	nop
   55f10:      	movw	$0x0, -0x1270(%rbp,%rax)
   55f1a:      	movw	$0x0, -0x126e(%rbp,%rax)
   55f24:      	movw	$0x0, -0x126c(%rbp,%rax)
   55f2e:      	movw	$0x0, -0x126a(%rbp,%rax)
   55f38:      	movw	$0x0, -0x1268(%rbp,%rax)
   55f42:      	movw	$0x0, -0x1266(%rbp,%rax)
   55f4c:      	movw	$0x0, -0x1264(%rbp,%rax)
   55f56:      	movw	$0x0, -0x1262(%rbp,%rax)
   55f60:      	addq	$0x10, %rax
   55f64:      	cmpq	$0x200, %rax            # imm = 0x200
   55f6a:      	jne	0x55f10 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1350>
   55f6c:      	xorl	%eax, %eax
   55f6e:      	nop
   55f70:      	movw	$0x0, -0xa70(%rbp,%rax)
   55f7a:      	movw	$0x0, -0xa6e(%rbp,%rax)
   55f84:      	movw	$0x0, -0xa6c(%rbp,%rax)
   55f8e:      	movw	$0x0, -0xa6a(%rbp,%rax)
   55f98:      	movw	$0x0, -0xa68(%rbp,%rax)
   55fa2:      	movw	$0x0, -0xa66(%rbp,%rax)
   55fac:      	movw	$0x0, -0xa64(%rbp,%rax)
   55fb6:      	movw	$0x0, -0xa62(%rbp,%rax)
   55fc0:      	addq	$0x10, %rax
   55fc4:      	cmpq	$0x200, %rax            # imm = 0x200
   55fca:      	jne	0x55f70 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x13b0>
   55fcc:      	xorl	%eax, %eax
   55fce:      	nop
   55fd0:      	movw	$0x0, -0x870(%rbp,%rax)
   55fda:      	movw	$0x0, -0x86e(%rbp,%rax)
   55fe4:      	movw	$0x0, -0x86c(%rbp,%rax)
   55fee:      	movw	$0x0, -0x86a(%rbp,%rax)
   55ff8:      	movw	$0x0, -0x868(%rbp,%rax)
   56002:      	movw	$0x0, -0x866(%rbp,%rax)
   5600c:      	movw	$0x0, -0x864(%rbp,%rax)
   56016:      	movw	$0x0, -0x862(%rbp,%rax)
   56020:      	addq	$0x10, %rax
   56024:      	cmpq	$0x200, %rax            # imm = 0x200
   5602a:      	jne	0x55fd0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1410>
   5602c:      	xorl	%eax, %eax
   5602e:      	nop
   56030:      	movw	$0x0, -0x670(%rbp,%rax)
   5603a:      	movw	$0x0, -0x66e(%rbp,%rax)
   56044:      	movw	$0x0, -0x66c(%rbp,%rax)
   5604e:      	movw	$0x0, -0x66a(%rbp,%rax)
   56058:      	movw	$0x0, -0x668(%rbp,%rax)
   56062:      	movw	$0x0, -0x666(%rbp,%rax)
   5606c:      	movw	$0x0, -0x664(%rbp,%rax)
   56076:      	movw	$0x0, -0x662(%rbp,%rax)
   56080:      	addq	$0x10, %rax
   56084:      	cmpq	$0x200, %rax            # imm = 0x200
   5608a:      	jne	0x56030 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1470>
   5608c:      	xorl	%eax, %eax
   5608e:      	nop
   56090:      	movw	$0x0, -0x1870(%rbp,%rax)
   5609a:      	movw	$0x0, -0x186e(%rbp,%rax)
   560a4:      	movw	$0x0, -0x186c(%rbp,%rax)
   560ae:      	movw	$0x0, -0x186a(%rbp,%rax)
   560b8:      	movw	$0x0, -0x1868(%rbp,%rax)
   560c2:      	movw	$0x0, -0x1866(%rbp,%rax)
   560cc:      	movw	$0x0, -0x1864(%rbp,%rax)
   560d6:      	movw	$0x0, -0x1862(%rbp,%rax)
   560e0:      	addq	$0x10, %rax
   560e4:      	cmpq	$0x200, %rax            # imm = 0x200
   560ea:      	jne	0x56090 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x14d0>
   560ec:      	xorl	%eax, %eax
   560ee:      	nop
   560f0:      	movw	$0x0, -0x1670(%rbp,%rax)
   560fa:      	movw	$0x0, -0x166e(%rbp,%rax)
   56104:      	movw	$0x0, -0x166c(%rbp,%rax)
   5610e:      	movw	$0x0, -0x166a(%rbp,%rax)
   56118:      	movw	$0x0, -0x1668(%rbp,%rax)
   56122:      	movw	$0x0, -0x1666(%rbp,%rax)
   5612c:      	movw	$0x0, -0x1664(%rbp,%rax)
   56136:      	movw	$0x0, -0x1662(%rbp,%rax)
   56140:      	addq	$0x10, %rax
   56144:      	cmpq	$0x200, %rax            # imm = 0x200
   5614a:      	jne	0x560f0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1530>
   5614c:      	xorl	%eax, %eax
   5614e:      	nop
   56150:      	movw	$0x0, -0x1470(%rbp,%rax)
   5615a:      	movw	$0x0, -0x146e(%rbp,%rax)
   56164:      	movw	$0x0, -0x146c(%rbp,%rax)
   5616e:      	movw	$0x0, -0x146a(%rbp,%rax)
   56178:      	movw	$0x0, -0x1468(%rbp,%rax)
   56182:      	movw	$0x0, -0x1466(%rbp,%rax)
   5618c:      	movw	$0x0, -0x1464(%rbp,%rax)
   56196:      	movw	$0x0, -0x1462(%rbp,%rax)
   561a0:      	addq	$0x10, %rax
   561a4:      	cmpq	$0x200, %rax            # imm = 0x200
   561aa:      	jne	0x56150 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1590>
   561ac:      	callq	0xb86a0 <_Unwind_Resume>
   561b1:      	int3
   561b2:      	int3
   561b3:      	int3
   561b4:      	int3
   561b5:      	int3
   561b6:      	int3
   561b7:      	int3
   561b8:      	int3
   561b9:      	int3
   561ba:      	int3
   561bb:      	int3
   561bc:      	int3
   561bd:      	int3
   561be:      	int3
   561bf:      	int3

00000000000561c0 <<toyos_crypto::mlkem::EncapsulationKey>::as_bytes>:
   561c0:      	pushq	%rbp
   561c1:      	movq	%rsp, %rbp
   561c4:      	movq	%rdi, %rax
   561c7:      	popq	%rbp
   561c8:      	retq
   561c9:      	int3
   561ca:      	int3
   561cb:      	int3
   561cc:      	int3
   561cd:      	int3
   561ce:      	int3
   561cf:      	int3

00000000000561d0 <<toyos_crypto::mlkem::DecapsulationKey>::public_key>:
   561d0:      	pushq	%rbp
   561d1:      	movq	%rsp, %rbp
   561d4:      	leaq	0x600(%rdi), %rax
   561db:      	popq	%rbp
   561dc:      	retq
   561dd:      	int3
   561de:      	int3
   561df:      	int3

00000000000561e0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>:
   561e0:      	pushq	%rbp
   561e1:      	movq	%rsp, %rbp
   561e4:      	pushq	%r15
   561e6:      	pushq	%r14
   561e8:      	pushq	%r13
   561ea:      	pushq	%r12
   561ec:      	pushq	%rbx
   561ed:      	subq	$0x1000, %rsp           # imm = 0x1000
   561f4:      	movq	$0x0, (%rsp)
   561fc:      	subq	$0x58, %rsp
   56200:      	movq	%rsi, %rbx
   56203:      	movq	%rdi, %r14
   56206:      	cmpq	$0x440, %rcx            # imm = 0x440
   5620d:      	jne	0x57007 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xe27>
   56213:      	movq	%rdx, %r15
   56216:      	leaq	-0xa80(%rbp), %rax
   5621d:      	movq	%rax, -0x60(%rbp)
   56221:      	movq	$0x3, -0x58(%rbp)
   56229:      	xorl	%r13d, %r13d
   5622c:      	leaq	-0x1080(%rbp), %rdi
   56233:      	movl	$0x140, %edx            # imm = 0x140
   56238:      	movq	%r15, %rsi
   5623b:      	callq	0x58d40 <<toyos_crypto::mlkem::Poly>::decode::<10>>
   56240:      	movl	$0x2, %esi
   56245:      	xorl	%ecx, %ecx
   56247:      	movl	$0xd01, %edi            # imm = 0xD01
   5624c:      	nopl	(%rax)
   56250:      	movswl	-0x1082(%rbp,%rsi), %eax
   56258:      	mull	%edi
   5625a:      	jo	0x57178 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf98>
   56260:      	addl	$0x200, %eax            # imm = 0x200
   56265:      	shrl	$0xa, %eax
   56268:      	movw	%ax, -0x1082(%rbp,%rsi)
   56270:      	movswl	-0x1080(%rbp,%rsi), %eax
   56278:      	mull	%edi
   5627a:      	jo	0x57178 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf98>
   56280:      	addl	$0x200, %eax            # imm = 0x200
   56285:      	shrl	$0xa, %eax
   56288:      	movw	%ax, -0x1080(%rbp,%rsi)
   56290:      	addq	$0x4, %rsi
   56294:      	cmpq	$0x202, %rsi            # imm = 0x202
   5629b:      	jne	0x56250 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x70>
   5629d:      	leaq	-0x480(%rbp), %r12
   562a4:      	leaq	-0x1080(%rbp), %rsi
   562ab:      	movl	$0x200, %edx            # imm = 0x200
   562b0:      	movq	%r12, %rdi
   562b3:      	callq	0xc4250 <memcpy>
   562b8:      	xorl	%r13d, %r13d
   562bb:      	leaq	-0x280(%rbp), %rdi
   562c2:      	movq	%r12, %rsi
   562c5:      	callq	0x576b0 <<toyos_crypto::mlkem::Poly>::ntt>
   562ca:      	leaq	-0x1080(%rbp), %r12
   562d1:      	leaq	-0x280(%rbp), %rsi
   562d8:      	movl	$0x200, %edx            # imm = 0x200
   562dd:      	movq	%r12, %rdi
   562e0:      	callq	0xc4250 <memcpy>
   562e5:      	leaq	-0xa80(%rbp), %rdi
   562ec:      	movl	$0x200, %edx            # imm = 0x200
   562f1:      	movq	%r12, %rsi
   562f4:      	callq	0xc4250 <memcpy>
   562f9:      	leaq	0x140(%r15), %rsi
   56300:      	movl	$0x1, %r13d
   56306:      	leaq	-0x1080(%rbp), %rdi
   5630d:      	movl	$0x140, %edx            # imm = 0x140
   56312:      	callq	0x58d40 <<toyos_crypto::mlkem::Poly>::decode::<10>>
   56317:      	movl	$0x2, %esi
   5631c:      	movl	$0xd01, %edi            # imm = 0xD01
   56321:      	movl	$0x1, %ecx
   56326:      	nopw	%cs:(%rax,%rax)
   56330:      	movswl	-0x1082(%rbp,%rsi), %eax
   56338:      	mull	%edi
   5633a:      	jo	0x57178 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf98>
   56340:      	addl	$0x200, %eax            # imm = 0x200
   56345:      	shrl	$0xa, %eax
   56348:      	movw	%ax, -0x1082(%rbp,%rsi)
   56350:      	movswl	-0x1080(%rbp,%rsi), %eax
   56358:      	mull	%edi
   5635a:      	jo	0x57178 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf98>
   56360:      	addl	$0x200, %eax            # imm = 0x200
   56365:      	shrl	$0xa, %eax
   56368:      	movw	%ax, -0x1080(%rbp,%rsi)
   56370:      	addq	$0x4, %rsi
   56374:      	cmpq	$0x202, %rsi            # imm = 0x202
   5637b:      	jne	0x56330 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x150>
   5637d:      	leaq	-0x480(%rbp), %r12
   56384:      	leaq	-0x1080(%rbp), %rsi
   5638b:      	movl	$0x200, %edx            # imm = 0x200
   56390:      	movq	%r12, %rdi
   56393:      	callq	0xc4250 <memcpy>
   56398:      	movl	$0x1, %r13d
   5639e:      	leaq	-0x280(%rbp), %rdi
   563a5:      	movq	%r12, %rsi
   563a8:      	callq	0x576b0 <<toyos_crypto::mlkem::Poly>::ntt>
   563ad:      	leaq	-0x1080(%rbp), %r12
   563b4:      	leaq	-0x280(%rbp), %rsi
   563bb:      	movl	$0x200, %edx            # imm = 0x200
   563c0:      	movq	%r12, %rdi
   563c3:      	callq	0xc4250 <memcpy>
   563c8:      	leaq	-0x880(%rbp), %rdi
   563cf:      	movl	$0x200, %edx            # imm = 0x200
   563d4:      	movq	%r12, %rsi
   563d7:      	callq	0xc4250 <memcpy>
   563dc:      	leaq	0x280(%r15), %rsi
   563e3:      	movl	$0x2, %r13d
   563e9:      	leaq	-0x1080(%rbp), %rdi
   563f0:      	movl	$0x140, %edx            # imm = 0x140
   563f5:      	callq	0x58d40 <<toyos_crypto::mlkem::Poly>::decode::<10>>
   563fa:      	movl	$0x2, %ecx
   563ff:      	movl	$0xd01, %esi            # imm = 0xD01
   56404:      	movl	$0x2, %edi
   56409:      	nopl	(%rax)
   56410:      	movswl	-0x1082(%rbp,%rdi), %eax
   56418:      	mull	%esi
   5641a:      	jo	0x57178 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf98>
   56420:      	addl	$0x200, %eax            # imm = 0x200
   56425:      	shrl	$0xa, %eax
   56428:      	movw	%ax, -0x1082(%rbp,%rdi)
   56430:      	movswl	-0x1080(%rbp,%rdi), %eax
   56438:      	mull	%esi
   5643a:      	jo	0x57178 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf98>
   56440:      	addl	$0x200, %eax            # imm = 0x200
   56445:      	shrl	$0xa, %eax
   56448:      	movw	%ax, -0x1080(%rbp,%rdi)
   56450:      	addq	$0x4, %rdi
   56454:      	cmpq	$0x202, %rdi            # imm = 0x202
   5645b:      	jne	0x56410 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x230>
   5645d:      	leaq	-0x480(%rbp), %r12
   56464:      	leaq	-0x1080(%rbp), %rsi
   5646b:      	movl	$0x200, %edx            # imm = 0x200
   56470:      	movq	%r12, %rdi
   56473:      	callq	0xc4250 <memcpy>
   56478:      	movl	$0x2, %r13d
   5647e:      	leaq	-0x280(%rbp), %rdi
   56485:      	movq	%r12, %rsi
   56488:      	callq	0x576b0 <<toyos_crypto::mlkem::Poly>::ntt>
   5648d:      	leaq	-0x1080(%rbp), %r12
   56494:      	leaq	-0x280(%rbp), %rsi
   5649b:      	movl	$0x200, %edx            # imm = 0x200
   564a0:      	movq	%r12, %rdi
   564a3:      	callq	0xc4250 <memcpy>
   564a8:      	leaq	-0x680(%rbp), %rdi
   564af:      	movl	$0x200, %edx            # imm = 0x200
   564b4:      	movq	%r12, %rsi
   564b7:      	callq	0xc4250 <memcpy>
   564bc:      	leaq	-0x1080(%rbp), %rdi
   564c3:      	leaq	-0xa80(%rbp), %rsi
   564ca:      	movl	$0x600, %edx            # imm = 0x600
   564cf:      	callq	0xc4250 <memcpy>
   564d4:      	pxor	%xmm0, %xmm0
   564d8:      	movdqa	%xmm0, -0x50(%rbp)
   564dd:      	movdqa	%xmm0, -0x60(%rbp)
   564e2:      	leaq	0x3c0(%r15), %rsi
   564e9:      	leaq	-0xa80(%rbp), %rdi
   564f0:      	movl	$0x80, %edx
   564f5:      	callq	0x58b70 <<toyos_crypto::mlkem::Poly>::decode::<4>>
   564fa:      	movl	$0x2, %ecx
   564ff:      	movl	$0xd01, %esi            # imm = 0xD01
   56504:      	nopw	%cs:(%rax,%rax)
   56510:      	movswl	-0xa82(%rbp,%rcx), %eax
   56518:      	mull	%esi
   5651a:      	jo	0x5718a <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfaa>
   56520:      	addl	$0x8, %eax
   56523:      	shrl	$0x4, %eax
   56526:      	movw	%ax, -0xa82(%rbp,%rcx)
   5652e:      	movswl	-0xa80(%rbp,%rcx), %eax
   56536:      	mull	%esi
   56538:      	jo	0x5718a <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfaa>
   5653e:      	addl	$0x8, %eax
   56541:      	shrl	$0x4, %eax
   56544:      	movw	%ax, -0xa80(%rbp,%rcx)
   5654c:      	addq	$0x4, %rcx
   56550:      	cmpq	$0x202, %rcx            # imm = 0x202
   56557:      	jne	0x56510 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x330>
   56559:      	leaq	-0x280(%rbp), %rdi
   56560:      	leaq	-0xa80(%rbp), %rsi
   56567:      	movl	$0x200, %edx            # imm = 0x200
   5656c:      	callq	0xc4250 <memcpy>
   56571:      	leaq	-0xa80(%rbp), %rdi
   56578:      	leaq	-0x1080(%rbp), %rdx
   5657f:      	movq	%rbx, %rsi
   56582:      	callq	0x57f30 <toyos_crypto::mlkem::dot>
   56587:      	leaq	-0x480(%rbp), %rdi
   5658e:      	leaq	-0xa80(%rbp), %rsi
   56595:      	callq	0x57b60 <<toyos_crypto::mlkem::Poly>::inverse>
   5659a:      	leaq	-0x80(%rbp), %rdi
   5659e:      	leaq	-0x280(%rbp), %rsi
   565a5:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   565aa:      	testb	%al, %al
   565ac:      	je	0x5715e <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf7e>
   565b2:      	leaq	-0x280(%rbp), %rdi
   565b9:      	leaq	-0x480(%rbp), %rsi
   565c0:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   565c5:      	testb	%al, %al
   565c7:      	je	0x5715e <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf7e>
   565cd:      	movl	$0x1, %eax
   565d2:      	nopw	%cs:(%rax,%rax)
   565e0:      	movzwl	-0x282(%rbp,%rax,2), %ecx
   565e8:      	subw	-0x482(%rbp,%rax,2), %cx
   565f0:      	jo	0x57198 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfb8>
   565f6:      	movw	%cx, -0x282(%rbp,%rax,2)
   565fe:      	movzwl	-0x280(%rbp,%rax,2), %ecx
   56606:      	subw	-0x480(%rbp,%rax,2), %cx
   5660e:      	jo	0x57198 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfb8>
   56614:      	movw	%cx, -0x280(%rbp,%rax,2)
   5661c:      	addq	$0x2, %rax
   56620:      	cmpq	$0x101, %rax            # imm = 0x101
   56626:      	jne	0x565e0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x400>
   56628:      	leaq	-0xa80(%rbp), %rdi
   5662f:      	leaq	-0x280(%rbp), %rsi
   56636:      	movl	$0x200, %edx            # imm = 0x200
   5663b:      	callq	0xc4250 <memcpy>
   56640:      	xorl	%eax, %eax
   56642:      	nopw	%cs:(%rax,%rax)
   56650:      	movswl	-0xa80(%rbp,%rax), %ecx
   56658:      	imull	$0x4ebf, %ecx, %edx     # imm = 0x4EBF
   5665e:      	addl	$0x2000000, %edx        # imm = 0x2000000
   56664:      	sarl	$0x1a, %edx
   56667:      	imull	$0xfffff2ff, %edx, %edx # imm = 0xFFFFF2FF
   5666d:      	addl	%ecx, %edx
   5666f:      	movswl	%dx, %ecx
   56672:      	movl	%ecx, %edx
   56674:      	shrl	$0xf, %edx
   56677:      	andl	$0xd01, %edx            # imm = 0xD01
   5667d:      	addw	%dx, %cx
   56680:      	jo	0x571a6 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfc6>
   56686:      	movswl	%cx, %ecx
   56689:      	addl	%ecx, %ecx
   5668b:      	cmpl	$0xfffff97f, %ecx       # imm = 0xFFFFF97F
   56691:      	ja	0x571b4 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfd4>
   56697:      	addl	$0x680, %ecx            # imm = 0x680
   5669d:      	imulq	$0x275f6f, %rcx, %rcx   # imm = 0x275F6F
   566a4:      	shrq	$0x21, %rcx
   566a8:      	andl	$0x1, %ecx
   566ab:      	movw	%cx, -0xa80(%rbp,%rax)
   566b3:      	addq	$0x2, %rax
   566b7:      	cmpq	$0x200, %rax            # imm = 0x200
   566bd:      	jne	0x56650 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x470>
   566bf:      	leaq	-0x280(%rbp), %r13
   566c6:      	leaq	-0xa80(%rbp), %rsi
   566cd:      	movl	$0x200, %edx            # imm = 0x200
   566d2:      	movq	%r13, %rdi
   566d5:      	callq	0xc4250 <memcpy>
   566da:      	leaq	-0x60(%rbp), %r12
   566de:      	movl	$0x20, %edx
   566e3:      	movq	%r13, %rdi
   566e6:      	movq	%r12, %rsi
   566e9:      	callq	0x59150 <<toyos_crypto::mlkem::Poly>::encode::<1>>
   566ee:      	xorl	%eax, %eax
   566f0:      	movw	$0x0, -0x280(%rbp,%rax)
   566fa:      	movw	$0x0, -0x27e(%rbp,%rax)
   56704:      	movw	$0x0, -0x27c(%rbp,%rax)
   5670e:      	movw	$0x0, -0x27a(%rbp,%rax)
   56718:      	movw	$0x0, -0x278(%rbp,%rax)
   56722:      	movw	$0x0, -0x276(%rbp,%rax)
   5672c:      	movw	$0x0, -0x274(%rbp,%rax)
   56736:      	movw	$0x0, -0x272(%rbp,%rax)
   56740:      	addq	$0x10, %rax
   56744:      	cmpq	$0x200, %rax            # imm = 0x200
   5674a:      	jne	0x566f0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x510>
   5674c:      	xorl	%eax, %eax
   5674e:      	nop
   56750:      	movw	$0x0, -0x480(%rbp,%rax)
   5675a:      	movw	$0x0, -0x47e(%rbp,%rax)
   56764:      	movw	$0x0, -0x47c(%rbp,%rax)
   5676e:      	movw	$0x0, -0x47a(%rbp,%rax)
   56778:      	movw	$0x0, -0x478(%rbp,%rax)
   56782:      	movw	$0x0, -0x476(%rbp,%rax)
   5678c:      	movw	$0x0, -0x474(%rbp,%rax)
   56796:      	movw	$0x0, -0x472(%rbp,%rax)
   567a0:      	addq	$0x10, %rax
   567a4:      	cmpq	$0x200, %rax            # imm = 0x200
   567aa:      	jne	0x56750 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x570>
   567ac:      	leaq	0xaa0(%rbx), %rax
   567b3:      	movq	%r12, -0x280(%rbp)
   567ba:      	movq	$0x20, -0x278(%rbp)
   567c5:      	movq	%rax, -0x270(%rbp)
   567cc:      	movq	$0x20, -0x268(%rbp)
   567d7:      	leaq	-0xa80(%rbp), %rdi
   567de:      	leaq	-0x280(%rbp), %rsi
   567e5:      	movl	$0x2, %edx
   567ea:      	callq	0x49c20 <toyos_crypto::keccak::g>
   567ef:      	movups	-0xa80(%rbp), %xmm0
   567f6:      	movups	-0xa70(%rbp), %xmm1
   567fd:      	movdqu	-0xa60(%rbp), %xmm2
   56805:      	movdqu	-0xa50(%rbp), %xmm3
   5680d:      	movdqa	%xmm3, -0x450(%rbp)
   56815:      	movdqa	%xmm2, -0x460(%rbp)
   5681d:      	movaps	%xmm1, -0x470(%rbp)
   56824:      	movaps	%xmm0, -0x480(%rbp)
   5682b:      	leaq	0xac0(%rbx), %r13
   56832:      	movq	%r13, -0xa80(%rbp)
   56839:      	movq	$0x20, -0xa78(%rbp)
   56844:      	movq	%r15, -0xa70(%rbp)
   5684b:      	movq	$0x440, -0xa68(%rbp)    # imm = 0x440
   56856:      	leaq	-0x280(%rbp), %rdi
   5685d:      	leaq	-0xa80(%rbp), %rsi
   56864:      	movl	$0x2, %edx
   56869:      	callq	0x49f60 <toyos_crypto::keccak::j>
   5686e:      	movdqa	-0x280(%rbp), %xmm0
   56876:      	movdqa	-0x270(%rbp), %xmm1
   5687e:      	movdqa	%xmm0, -0x80(%rbp)
   56883:      	movdqa	%xmm1, -0x70(%rbp)
   56888:      	leaq	0x600(%rbx), %rsi
   5688f:      	leaq	-0x460(%rbp), %r12
   56896:      	leaq	-0xa80(%rbp), %rdi
   5689d:      	leaq	-0x60(%rbp), %rdx
   568a1:      	movq	%r12, %rcx
   568a4:      	callq	0x54bc0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>
   568a9:      	leaq	0x440(%r15), %rdi
   568b0:      	movq	%r15, %rsi
   568b3:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   568b8:      	testb	%al, %al
   568ba:      	je	0x5715e <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf7e>
   568c0:      	leaq	-0x640(%rbp), %rdi
   568c7:      	leaq	-0xa80(%rbp), %rsi
   568ce:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   568d3:      	testb	%al, %al
   568d5:      	je	0x5715e <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf7e>
   568db:      	pxor	%xmm0, %xmm0
   568df:      	movl	$0x6, %eax
   568e4:      	pxor	%xmm2, %xmm2
   568e8:      	pxor	%xmm1, %xmm1
   568ec:      	nopl	(%rax)
   568f0:      	movzwl	-0xa86(%rbp,%rax), %ecx
   568f8:      	movzwl	-0xa84(%rbp,%rax), %edx
   56900:      	xorw	-0x6(%r15,%rax), %cx
   56906:      	xorw	-0x4(%r15,%rax), %dx
   5690c:      	movd	%ecx, %xmm4
   56910:      	movd	%edx, %xmm3
   56914:      	punpcklbw	%xmm0, %xmm4    # xmm4 = xmm4[0],xmm0[0],xmm4[1],xmm0[1],xmm4[2],xmm0[2],xmm4[3],xmm0[3],xmm4[4],xmm0[4],xmm4[5],xmm0[5],xmm4[6],xmm0[6],xmm4[7],xmm0[7]
   56918:      	punpcklwd	%xmm0, %xmm4    # xmm4 = xmm4[0],xmm0[0],xmm4[1],xmm0[1],xmm4[2],xmm0[2],xmm4[3],xmm0[3]
   5691c:      	punpckldq	%xmm0, %xmm4    # xmm4 = xmm4[0],xmm0[0],xmm4[1],xmm0[1]
   56920:      	por	%xmm2, %xmm4
   56924:      	punpcklbw	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3],xmm3[4],xmm0[4],xmm3[5],xmm0[5],xmm3[6],xmm0[6],xmm3[7],xmm0[7]
   56928:      	punpcklwd	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3]
   5692c:      	punpckldq	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1]
   56930:      	por	%xmm1, %xmm3
   56934:      	movzwl	-0xa82(%rbp,%rax), %ecx
   5693c:      	movzwl	-0xa80(%rbp,%rax), %edx
   56944:      	xorw	-0x2(%r15,%rax), %cx
   5694a:      	xorw	(%r15,%rax), %dx
   5694f:      	movd	%ecx, %xmm2
   56953:      	movd	%edx, %xmm1
   56957:      	punpcklbw	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1],xmm2[2],xmm0[2],xmm2[3],xmm0[3],xmm2[4],xmm0[4],xmm2[5],xmm0[5],xmm2[6],xmm0[6],xmm2[7],xmm0[7]
   5695b:      	punpcklwd	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1],xmm2[2],xmm0[2],xmm2[3],xmm0[3]
   5695f:      	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
   56963:      	por	%xmm4, %xmm2
   56967:      	punpcklbw	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3],xmm1[4],xmm0[4],xmm1[5],xmm0[5],xmm1[6],xmm0[6],xmm1[7],xmm0[7]
   5696b:      	punpcklwd	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3]
   5696f:      	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
   56973:      	por	%xmm3, %xmm1
   56977:      	addq	$0x8, %rax
   5697b:      	cmpq	$0x446, %rax            # imm = 0x446
   56981:      	jne	0x568f0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x710>
   56987:      	por	%xmm2, %xmm1
   5698b:      	pshufd	$0xee, %xmm1, %xmm0     # xmm0 = xmm1[2,3,2,3]
   56990:      	por	%xmm1, %xmm0
   56994:      	movq	%xmm0, %rax
   56999:      	movl	$0x7, %ecx
   5699e:      	nop
   569a0:      	movb	$0x0, -0xa87(%rbp,%rcx)
   569a8:      	movb	$0x0, -0xa86(%rbp,%rcx)
   569b0:      	movb	$0x0, -0xa85(%rbp,%rcx)
   569b8:      	movb	$0x0, -0xa84(%rbp,%rcx)
   569c0:      	movb	$0x0, -0xa83(%rbp,%rcx)
   569c8:      	movb	$0x0, -0xa82(%rbp,%rcx)
   569d0:      	movb	$0x0, -0xa81(%rbp,%rcx)
   569d8:      	movb	$0x0, -0xa80(%rbp,%rcx)
   569e0:      	addq	$0x8, %rcx
   569e4:      	cmpq	$0x447, %rcx            # imm = 0x447
   569eb:      	jne	0x569a0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x7c0>
   569ed:      	xorl	%ecx, %ecx
   569ef:      	testq	%rax, %rax
   569f2:      	setg	%cl
   569f5:      	leaq	0xff(%rcx), %rax
   569fc:      	movq	%rax, %xmm0
   56a01:      	pshufd	$0x44, %xmm0, %xmm1     # xmm1 = xmm0[0,1,0,1]
   56a06:      	negq	%rcx
   56a09:      	movq	%rcx, %xmm0
   56a0e:      	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
   56a13:      	movdqa	-0x480(%rbp), %xmm8
   56a1c:      	movdqa	-0x470(%rbp), %xmm3
   56a24:      	movdqa	%xmm8, %xmm2
   56a29:      	punpcklbw	%xmm2, %xmm2    # xmm2 = xmm2[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
   56a2d:      	movdqa	%xmm2, %xmm5
   56a31:      	punpcklwd	%xmm5, %xmm5    # xmm5 = xmm5[0,0,1,1,2,2,3,3]
   56a35:      	pshufd	$0xd4, %xmm5, %xmm4     # xmm4 = xmm5[0,1,1,3]
   56a3a:      	pshufd	$0xf6, %xmm5, %xmm5     # xmm5 = xmm5[2,1,3,3]
   56a3f:      	punpckhwd	%xmm2, %xmm2    # xmm2 = xmm2[4,4,5,5,6,6,7,7]
   56a43:      	pshufd	$0xd4, %xmm2, %xmm6     # xmm6 = xmm2[0,1,1,3]
   56a48:      	pshufd	$0xf6, %xmm2, %xmm7     # xmm7 = xmm2[2,1,3,3]
   56a4d:      	punpckhbw	%xmm8, %xmm8    # xmm8 = xmm8[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
   56a52:      	movdqa	%xmm8, %xmm2
   56a57:      	punpcklwd	%xmm2, %xmm2    # xmm2 = xmm2[0,0,1,1,2,2,3,3]
   56a5b:      	pshufd	$0xd4, %xmm2, %xmm9     # xmm9 = xmm2[0,1,1,3]
   56a61:      	pshufd	$0xf6, %xmm2, %xmm2     # xmm2 = xmm2[2,1,3,3]
   56a66:      	punpckhwd	%xmm8, %xmm8    # xmm8 = xmm8[4,4,5,5,6,6,7,7]
   56a6b:      	pshufd	$0xd4, %xmm8, %xmm11    # xmm11 = xmm8[0,1,1,3]
   56a71:      	pshufd	$0xf6, %xmm8, %xmm13    # xmm13 = xmm8[2,1,3,3]
   56a77:      	movdqa	-0x80(%rbp), %xmm12
   56a7d:      	movdqa	%xmm12, %xmm10
   56a82:      	punpcklbw	%xmm10, %xmm10  # xmm10 = xmm10[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
   56a87:      	punpckhbw	%xmm12, %xmm12  # xmm12 = xmm12[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
   56a8c:      	movdqa	%xmm12, %xmm15
   56a91:      	punpckhwd	%xmm12, %xmm12  # xmm12 = xmm12[4,4,5,5,6,6,7,7]
   56a96:      	pshufd	$0xf6, %xmm12, %xmm8    # xmm8 = xmm12[2,1,3,3]
   56a9c:      	pand	%xmm1, %xmm13
   56aa1:      	pand	%xmm0, %xmm8
   56aa6:      	por	%xmm13, %xmm8
   56aab:      	movdqa	%xmm10, %xmm13
   56ab0:      	punpcklwd	%xmm13, %xmm13  # xmm13 = xmm13[0,0,1,1,2,2,3,3]
   56ab5:      	punpcklwd	%xmm15, %xmm15  # xmm15 = xmm15[0,0,1,1,2,2,3,3]
   56aba:      	pshufd	$0xd4, %xmm12, %xmm12   # xmm12 = xmm12[0,1,1,3]
   56ac0:      	pand	%xmm1, %xmm11
   56ac5:      	pand	%xmm0, %xmm12
   56aca:      	por	%xmm11, %xmm12
   56acf:      	pshufd	$0xf6, %xmm15, %xmm14   # xmm14 = xmm15[2,1,3,3]
   56ad5:      	pand	%xmm1, %xmm2
   56ad9:      	pand	%xmm0, %xmm14
   56ade:      	por	%xmm2, %xmm14
   56ae3:      	pshufd	$0xd4, %xmm13, %xmm2    # xmm2 = xmm13[0,1,1,3]
   56ae9:      	pshufd	$0xf6, %xmm13, %xmm13   # xmm13 = xmm13[2,1,3,3]
   56aef:      	punpckhwd	%xmm10, %xmm10  # xmm10 = xmm10[4,4,5,5,6,6,7,7]
   56af4:      	pshufd	$0xd4, %xmm15, %xmm11   # xmm11 = xmm15[0,1,1,3]
   56afa:      	pand	%xmm1, %xmm9
   56aff:      	pand	%xmm0, %xmm11
   56b04:      	por	%xmm9, %xmm11
   56b09:      	pshufd	$0xd4, %xmm10, %xmm9    # xmm9 = xmm10[0,1,1,3]
   56b0f:      	pshufd	$0xf6, %xmm10, %xmm10   # xmm10 = xmm10[2,1,3,3]
   56b15:      	pand	%xmm1, %xmm7
   56b19:      	pand	%xmm1, %xmm6
   56b1d:      	pand	%xmm1, %xmm5
   56b21:      	pand	%xmm1, %xmm4
   56b25:      	pand	%xmm0, %xmm10
   56b2a:      	por	%xmm7, %xmm10
   56b2f:      	pand	%xmm0, %xmm9
   56b34:      	por	%xmm6, %xmm9
   56b39:      	pand	%xmm0, %xmm13
   56b3e:      	por	%xmm5, %xmm13
   56b43:      	pand	%xmm0, %xmm2
   56b47:      	por	%xmm4, %xmm2
   56b4b:      	movdqa	-0x47f53(%rip), %xmm4   # 0xec00 <anon.eb4e9983f1dde2da9251237d0548192c.1.llvm.16376435883611519421+0x640>
   56b53:      	pand	%xmm4, %xmm8
   56b58:      	pand	%xmm4, %xmm12
   56b5d:      	packuswb	%xmm8, %xmm12
   56b62:      	pand	%xmm4, %xmm14
   56b67:      	pand	%xmm4, %xmm11
   56b6c:      	packuswb	%xmm14, %xmm11
   56b71:      	packuswb	%xmm12, %xmm11
   56b76:      	pand	%xmm4, %xmm10
   56b7b:      	pand	%xmm4, %xmm9
   56b80:      	packuswb	%xmm10, %xmm9
   56b85:      	pand	%xmm4, %xmm13
   56b8a:      	pand	%xmm4, %xmm2
   56b8e:      	packuswb	%xmm13, %xmm2
   56b93:      	packuswb	%xmm9, %xmm2
   56b98:      	packuswb	%xmm11, %xmm2
   56b9d:      	movdqa	%xmm3, %xmm8
   56ba2:      	punpcklbw	%xmm8, %xmm8    # xmm8 = xmm8[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
   56ba7:      	movdqa	%xmm8, %xmm6
   56bac:      	punpcklwd	%xmm6, %xmm6    # xmm6 = xmm6[0,0,1,1,2,2,3,3]
   56bb0:      	pshufd	$0xd4, %xmm6, %xmm5     # xmm5 = xmm6[0,1,1,3]
   56bb5:      	pshufd	$0xf6, %xmm6, %xmm6     # xmm6 = xmm6[2,1,3,3]
   56bba:      	punpckhwd	%xmm8, %xmm8    # xmm8 = xmm8[4,4,5,5,6,6,7,7]
   56bbf:      	pshufd	$0xd4, %xmm8, %xmm7     # xmm7 = xmm8[0,1,1,3]
   56bc5:      	pshufd	$0xf6, %xmm8, %xmm8     # xmm8 = xmm8[2,1,3,3]
   56bcb:      	punpckhbw	%xmm3, %xmm3    # xmm3 = xmm3[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
   56bcf:      	movdqa	%xmm3, %xmm10
   56bd4:      	punpcklwd	%xmm10, %xmm10  # xmm10 = xmm10[0,0,1,1,2,2,3,3]
   56bd9:      	pshufd	$0xd4, %xmm10, %xmm9    # xmm9 = xmm10[0,1,1,3]
   56bdf:      	pshufd	$0xf6, %xmm10, %xmm10   # xmm10 = xmm10[2,1,3,3]
   56be5:      	punpckhwd	%xmm3, %xmm3    # xmm3 = xmm3[4,4,5,5,6,6,7,7]
   56be9:      	pshufd	$0xd4, %xmm3, %xmm12    # xmm12 = xmm3[0,1,1,3]
   56bef:      	pshufd	$0xf6, %xmm3, %xmm15    # xmm15 = xmm3[2,1,3,3]
   56bf5:      	movdqa	-0x70(%rbp), %xmm11
   56bfb:      	movdqa	%xmm11, %xmm3
   56c00:      	punpckhbw	%xmm11, %xmm11  # xmm11 = xmm11[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
   56c05:      	movdqa	%xmm11, %xmm14
   56c0a:      	punpckhwd	%xmm11, %xmm11  # xmm11 = xmm11[4,4,5,5,6,6,7,7]
   56c0f:      	pand	%xmm1, %xmm15
   56c14:      	pand	%xmm1, %xmm12
   56c19:      	pand	%xmm1, %xmm10
   56c1e:      	pand	%xmm1, %xmm9
   56c23:      	pand	%xmm1, %xmm8
   56c28:      	pand	%xmm1, %xmm7
   56c2c:      	pand	%xmm1, %xmm6
   56c30:      	pand	%xmm1, %xmm5
   56c34:      	pshufd	$0xf6, %xmm11, %xmm13   # xmm13 = xmm11[2,1,3,3]
   56c3a:      	pand	%xmm0, %xmm13
   56c3f:      	por	%xmm15, %xmm13
   56c44:      	punpcklbw	%xmm3, %xmm3    # xmm3 = xmm3[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
   56c48:      	punpcklwd	%xmm14, %xmm14  # xmm14 = xmm14[0,0,1,1,2,2,3,3]
   56c4d:      	pshufd	$0xd4, %xmm11, %xmm11   # xmm11 = xmm11[0,1,1,3]
   56c53:      	pand	%xmm0, %xmm11
   56c58:      	por	%xmm12, %xmm11
   56c5d:      	pshufd	$0xf6, %xmm14, %xmm12   # xmm12 = xmm14[2,1,3,3]
   56c63:      	pand	%xmm0, %xmm12
   56c68:      	por	%xmm10, %xmm12
   56c6d:      	movdqa	%xmm3, %xmm10
   56c72:      	punpckhwd	%xmm3, %xmm3    # xmm3 = xmm3[4,4,5,5,6,6,7,7]
   56c76:      	pshufd	$0xd4, %xmm14, %xmm1    # xmm1 = xmm14[0,1,1,3]
   56c7c:      	pand	%xmm0, %xmm1
   56c80:      	por	%xmm9, %xmm1
   56c85:      	pshufd	$0xf6, %xmm3, %xmm9     # xmm9 = xmm3[2,1,3,3]
   56c8b:      	pand	%xmm0, %xmm9
   56c90:      	por	%xmm8, %xmm9
   56c95:      	punpcklwd	%xmm10, %xmm10  # xmm10 = xmm10[0,0,1,1,2,2,3,3]
   56c9a:      	pshufd	$0xd4, %xmm3, %xmm3     # xmm3 = xmm3[0,1,1,3]
   56c9f:      	pand	%xmm0, %xmm3
   56ca3:      	por	%xmm7, %xmm3
   56ca7:      	pshufd	$0xf6, %xmm10, %xmm7    # xmm7 = xmm10[2,1,3,3]
   56cad:      	pand	%xmm0, %xmm7
   56cb1:      	por	%xmm6, %xmm7
   56cb5:      	pshufd	$0xd4, %xmm10, %xmm6    # xmm6 = xmm10[0,1,1,3]
   56cbb:      	pand	%xmm0, %xmm6
   56cbf:      	por	%xmm5, %xmm6
   56cc3:      	pand	%xmm4, %xmm13
   56cc8:      	pand	%xmm4, %xmm11
   56ccd:      	packuswb	%xmm13, %xmm11
   56cd2:      	pand	%xmm4, %xmm12
   56cd7:      	pand	%xmm4, %xmm1
   56cdb:      	packuswb	%xmm12, %xmm1
   56ce0:      	packuswb	%xmm11, %xmm1
   56ce5:      	pand	%xmm4, %xmm9
   56cea:      	pand	%xmm4, %xmm3
   56cee:      	packuswb	%xmm9, %xmm3
   56cf3:      	pand	%xmm4, %xmm7
   56cf7:      	pand	%xmm4, %xmm6
   56cfb:      	packuswb	%xmm7, %xmm6
   56cff:      	packuswb	%xmm3, %xmm6
   56d03:      	packuswb	%xmm1, %xmm6
   56d07:      	movdqu	%xmm2, 0x1(%r14)
   56d0d:      	movdqu	%xmm6, 0x11(%r14)
   56d13:      	movb	$0x0, (%r14)
   56d17:      	pxor	%xmm0, %xmm0
   56d1b:      	movdqa	%xmm0, -0xa80(%rbp)
   56d23:      	movaps	-0xa80(%rbp), %xmm1
   56d2a:      	movaps	%xmm1, -0x80(%rbp)
   56d2e:      	movdqa	%xmm0, -0xa80(%rbp)
   56d36:      	movaps	-0xa80(%rbp), %xmm1
   56d3d:      	movaps	%xmm1, -0x70(%rbp)
   56d41:      	movdqa	%xmm0, -0xa80(%rbp)
   56d49:      	movaps	-0xa80(%rbp), %xmm1
   56d50:      	movaps	%xmm1, -0x480(%rbp)
   56d57:      	movdqa	%xmm0, -0xa80(%rbp)
   56d5f:      	movaps	-0xa80(%rbp), %xmm1
   56d66:      	movaps	%xmm1, -0x470(%rbp)
   56d6d:      	movdqa	%xmm0, -0xa80(%rbp)
   56d75:      	movaps	-0xa80(%rbp), %xmm1
   56d7c:      	movups	%xmm1, (%r12)
   56d81:      	movdqa	%xmm0, -0xa80(%rbp)
   56d89:      	movaps	-0xa80(%rbp), %xmm1
   56d90:      	movaps	%xmm1, -0x450(%rbp)
   56d97:      	movdqa	%xmm0, -0xa80(%rbp)
   56d9f:      	movaps	-0xa80(%rbp), %xmm1
   56da6:      	movaps	%xmm1, -0x60(%rbp)
   56daa:      	movdqa	%xmm0, -0xa80(%rbp)
   56db2:      	movaps	-0xa80(%rbp), %xmm0
   56db9:      	movaps	%xmm0, -0x50(%rbp)
   56dbd:      	xorl	%eax, %eax
   56dbf:      	nop
   56dc0:      	movw	$0x0, -0x1080(%rbp,%rax)
   56dca:      	movw	$0x0, -0x107e(%rbp,%rax)
   56dd4:      	movw	$0x0, -0x107c(%rbp,%rax)
   56dde:      	movw	$0x0, -0x107a(%rbp,%rax)
   56de8:      	movw	$0x0, -0x1078(%rbp,%rax)
   56df2:      	movw	$0x0, -0x1076(%rbp,%rax)
   56dfc:      	movw	$0x0, -0x1074(%rbp,%rax)
   56e06:      	movw	$0x0, -0x1072(%rbp,%rax)
   56e10:      	addq	$0x10, %rax
   56e14:      	cmpq	$0x200, %rax            # imm = 0x200
   56e1a:      	jne	0x56dc0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xbe0>
   56e1c:      	xorl	%eax, %eax
   56e1e:      	nop
   56e20:      	movw	$0x0, -0xe80(%rbp,%rax)
   56e2a:      	movw	$0x0, -0xe7e(%rbp,%rax)
   56e34:      	movw	$0x0, -0xe7c(%rbp,%rax)
   56e3e:      	movw	$0x0, -0xe7a(%rbp,%rax)
   56e48:      	movw	$0x0, -0xe78(%rbp,%rax)
   56e52:      	movw	$0x0, -0xe76(%rbp,%rax)
   56e5c:      	movw	$0x0, -0xe74(%rbp,%rax)
   56e66:      	movw	$0x0, -0xe72(%rbp,%rax)
   56e70:      	addq	$0x10, %rax
   56e74:      	cmpq	$0x200, %rax            # imm = 0x200
   56e7a:      	jne	0x56e20 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xc40>
   56e7c:      	xorl	%eax, %eax
   56e7e:      	nop
   56e80:      	movw	$0x0, -0xc80(%rbp,%rax)
   56e8a:      	movw	$0x0, -0xc7e(%rbp,%rax)
   56e94:      	movw	$0x0, -0xc7c(%rbp,%rax)
   56e9e:      	movw	$0x0, -0xc7a(%rbp,%rax)
   56ea8:      	movw	$0x0, -0xc78(%rbp,%rax)
   56eb2:      	movw	$0x0, -0xc76(%rbp,%rax)
   56ebc:      	movw	$0x0, -0xc74(%rbp,%rax)
   56ec6:      	movw	$0x0, -0xc72(%rbp,%rax)
   56ed0:      	addq	$0x10, %rax
   56ed4:      	cmpq	$0x200, %rax            # imm = 0x200
   56eda:      	jne	0x56e80 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xca0>
   56edc:      	xorl	%eax, %eax
   56ede:      	nop
   56ee0:      	movw	$0x0, (%rbx,%rax)
   56ee6:      	movw	$0x0, 0x2(%rbx,%rax)
   56eed:      	movw	$0x0, 0x4(%rbx,%rax)
   56ef4:      	movw	$0x0, 0x6(%rbx,%rax)
   56efb:      	movw	$0x0, 0x8(%rbx,%rax)
   56f02:      	movw	$0x0, 0xa(%rbx,%rax)
   56f09:      	movw	$0x0, 0xc(%rbx,%rax)
   56f10:      	movw	$0x0, 0xe(%rbx,%rax)
   56f17:      	addq	$0x10, %rax
   56f1b:      	cmpq	$0x200, %rax            # imm = 0x200
   56f21:      	jne	0x56ee0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xd00>
   56f23:      	xorl	%eax, %eax
   56f25:      	nopw	%cs:(%rax,%rax)
   56f30:      	movw	$0x0, 0x200(%rbx,%rax)
   56f3a:      	movw	$0x0, 0x202(%rbx,%rax)
   56f44:      	movw	$0x0, 0x204(%rbx,%rax)
   56f4e:      	movw	$0x0, 0x206(%rbx,%rax)
   56f58:      	movw	$0x0, 0x208(%rbx,%rax)
   56f62:      	movw	$0x0, 0x20a(%rbx,%rax)
   56f6c:      	movw	$0x0, 0x20c(%rbx,%rax)
   56f76:      	movw	$0x0, 0x20e(%rbx,%rax)
   56f80:      	addq	$0x10, %rax
   56f84:      	cmpq	$0x200, %rax            # imm = 0x200
   56f8a:      	jne	0x56f30 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xd50>
   56f8c:      	xorl	%eax, %eax
   56f8e:      	nop
   56f90:      	movw	$0x0, 0x400(%rbx,%rax)
   56f9a:      	movw	$0x0, 0x402(%rbx,%rax)
   56fa4:      	movw	$0x0, 0x404(%rbx,%rax)
   56fae:      	movw	$0x0, 0x406(%rbx,%rax)
   56fb8:      	movw	$0x0, 0x408(%rbx,%rax)
   56fc2:      	movw	$0x0, 0x40a(%rbx,%rax)
   56fcc:      	movw	$0x0, 0x40c(%rbx,%rax)
   56fd6:      	movw	$0x0, 0x40e(%rbx,%rax)
   56fe0:      	addq	$0x10, %rax
   56fe4:      	cmpq	$0x200, %rax            # imm = 0x200
   56fea:      	jne	0x56f90 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xdb0>
   56fec:      	xorps	%xmm0, %xmm0
   56fef:      	movaps	%xmm0, -0xa80(%rbp)
   56ff6:      	movaps	-0xa80(%rbp), %xmm1
   56ffd:      	movups	%xmm1, (%r13)
   57002:      	jmp	0x57134 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xf54>
   57007:      	movw	$0x1, (%r14)
   5700d:      	xorl	%eax, %eax
   5700f:      	nop
   57010:      	movw	$0x0, (%rbx,%rax)
   57016:      	movw	$0x0, 0x2(%rbx,%rax)
   5701d:      	movw	$0x0, 0x4(%rbx,%rax)
   57024:      	movw	$0x0, 0x6(%rbx,%rax)
   5702b:      	movw	$0x0, 0x8(%rbx,%rax)
   57032:      	movw	$0x0, 0xa(%rbx,%rax)
   57039:      	movw	$0x0, 0xc(%rbx,%rax)
   57040:      	movw	$0x0, 0xe(%rbx,%rax)
   57047:      	addq	$0x10, %rax
   5704b:      	cmpq	$0x200, %rax            # imm = 0x200
   57051:      	jne	0x57010 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xe30>
   57053:      	xorl	%eax, %eax
   57055:      	nopw	%cs:(%rax,%rax)
   57060:      	movw	$0x0, 0x200(%rbx,%rax)
   5706a:      	movw	$0x0, 0x202(%rbx,%rax)
   57074:      	movw	$0x0, 0x204(%rbx,%rax)
   5707e:      	movw	$0x0, 0x206(%rbx,%rax)
   57088:      	movw	$0x0, 0x208(%rbx,%rax)
   57092:      	movw	$0x0, 0x20a(%rbx,%rax)
   5709c:      	movw	$0x0, 0x20c(%rbx,%rax)
   570a6:      	movw	$0x0, 0x20e(%rbx,%rax)
   570b0:      	addq	$0x10, %rax
   570b4:      	cmpq	$0x200, %rax            # imm = 0x200
   570ba:      	jne	0x57060 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xe80>
   570bc:      	xorl	%eax, %eax
   570be:      	nop
   570c0:      	movw	$0x0, 0x400(%rbx,%rax)
   570ca:      	movw	$0x0, 0x402(%rbx,%rax)
   570d4:      	movw	$0x0, 0x404(%rbx,%rax)
   570de:      	movw	$0x0, 0x406(%rbx,%rax)
   570e8:      	movw	$0x0, 0x408(%rbx,%rax)
   570f2:      	movw	$0x0, 0x40a(%rbx,%rax)
   570fc:      	movw	$0x0, 0x40c(%rbx,%rax)
   57106:      	movw	$0x0, 0x40e(%rbx,%rax)
   57110:      	addq	$0x10, %rax
   57114:      	cmpq	$0x200, %rax            # imm = 0x200
   5711a:      	jne	0x570c0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xee0>
   5711c:      	xorps	%xmm0, %xmm0
   5711f:      	movaps	%xmm0, -0xa80(%rbp)
   57126:      	movaps	-0xa80(%rbp), %xmm1
   5712d:      	movups	%xmm1, 0xac0(%rbx)
   57134:      	movaps	%xmm0, -0xa80(%rbp)
   5713b:      	movaps	-0xa80(%rbp), %xmm0
   57142:      	movups	%xmm0, 0xad0(%rbx)
   57149:      	movq	%r14, %rax
   5714c:      	addq	$0x1058, %rsp           # imm = 0x1058
   57153:      	popq	%rbx
   57154:      	popq	%r12
   57156:      	popq	%r13
   57158:      	popq	%r14
   5715a:      	popq	%r15
   5715c:      	popq	%rbp
   5715d:      	retq
   5715e:      	leaq	-0x401c3(%rip), %rdi    # 0x16fa2 <anon.08fe1e1e6efec708bade37899f950c1e.0.llvm.12593199014745301125>
   57165:      	leaq	0x6f184(%rip), %rcx     # 0xc62f0 <anon.08fe1e1e6efec708bade37899f950c1e.2.llvm.12593199014745301125>
   5716c:      	movl	$0x193, %esi            # imm = 0x193
   57171:      	xorl	%edx, %edx
   57173:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   57178:      	movq	%rcx, -0x50(%rbp)
   5717c:      	leaq	0x6efd5(%rip), %rdi     # 0xc6158 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526+0x30>
   57183:      	callq	0xbe890 <core::panicking::panic_const::panic_const_mul_overflow>
   57188:      	jmp	0x571c0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfe0>
   5718a:      	leaq	0x6efc7(%rip), %rdi     # 0xc6158 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526+0x30>
   57191:      	callq	0xbe890 <core::panicking::panic_const::panic_const_mul_overflow>
   57196:      	jmp	0x571c0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfe0>
   57198:      	leaq	0x6f031(%rip), %rdi     # 0xc61d0 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526+0xa8>
   5719f:      	callq	0xbe8b0 <core::panicking::panic_const::panic_const_sub_overflow>
   571a4:      	jmp	0x571c0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfe0>
   571a6:      	leaq	0x6f0e3(%rip), %rdi     # 0xc6290 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526+0x168>
   571ad:      	callq	0xbe870 <core::panicking::panic_const::panic_const_add_overflow>
   571b2:      	jmp	0x571c0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xfe0>
   571b4:      	leaq	0x6f05d(%rip), %rdi     # 0xc6218 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526+0xf0>
   571bb:      	callq	0xbe870 <core::panicking::panic_const::panic_const_add_overflow>
   571c0:      	ud2
   571c2:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   571c7:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   571cc:      	movq	%rax, %r14
   571cf:      	pxor	%xmm0, %xmm0
   571d3:      	movdqa	%xmm0, -0x280(%rbp)
   571db:      	movaps	-0x280(%rbp), %xmm1
   571e2:      	movaps	%xmm1, -0x80(%rbp)
   571e6:      	movdqa	%xmm0, -0x280(%rbp)
   571ee:      	movaps	-0x280(%rbp), %xmm0
   571f5:      	movaps	%xmm0, -0x70(%rbp)
   571f9:      	jmp	0x571fe <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x101e>
   571fb:      	movq	%rax, %r14
   571fe:      	xorps	%xmm0, %xmm0
   57201:      	movaps	%xmm0, -0x40(%rbp)
   57205:      	movaps	-0x40(%rbp), %xmm1
   57209:      	movaps	%xmm1, -0x480(%rbp)
   57210:      	movaps	%xmm0, -0x40(%rbp)
   57214:      	movaps	-0x40(%rbp), %xmm1
   57218:      	movaps	%xmm1, -0x470(%rbp)
   5721f:      	movaps	%xmm0, -0x40(%rbp)
   57223:      	movaps	-0x40(%rbp), %xmm1
   57227:      	movaps	%xmm1, -0x460(%rbp)
   5722e:      	movaps	%xmm0, -0x40(%rbp)
   57232:      	movdqa	-0x40(%rbp), %xmm0
   57237:      	movdqa	%xmm0, -0x450(%rbp)
   5723f:      	jmp	0x574ec <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x130c>
   57244:      	movq	%rax, %r14
   57247:      	xorl	%eax, %eax
   57249:      	nopl	(%rax)
   57250:      	movw	$0x0, -0x280(%rbp,%rax)
   5725a:      	movw	$0x0, -0x27e(%rbp,%rax)
   57264:      	movw	$0x0, -0x27c(%rbp,%rax)
   5726e:      	movw	$0x0, -0x27a(%rbp,%rax)
   57278:      	movw	$0x0, -0x278(%rbp,%rax)
   57282:      	movw	$0x0, -0x276(%rbp,%rax)
   5728c:      	movw	$0x0, -0x274(%rbp,%rax)
   57296:      	movw	$0x0, -0x272(%rbp,%rax)
   572a0:      	addq	$0x10, %rax
   572a4:      	cmpq	$0x200, %rax            # imm = 0x200
   572aa:      	jne	0x57250 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1070>
   572ac:      	jmp	0x5741c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x123c>
   572b1:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   572b6:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   572bb:      	movq	%rax, %r14
   572be:      	jmp	0x574ec <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x130c>
   572c3:      	movq	%rax, %r14
   572c6:      	xorl	%eax, %eax
   572c8:      	nopl	(%rax,%rax)
   572d0:      	movw	$0x0, -0x280(%rbp,%rax)
   572da:      	movw	$0x0, -0x27e(%rbp,%rax)
   572e4:      	movw	$0x0, -0x27c(%rbp,%rax)
   572ee:      	movw	$0x0, -0x27a(%rbp,%rax)
   572f8:      	movw	$0x0, -0x278(%rbp,%rax)
   57302:      	movw	$0x0, -0x276(%rbp,%rax)
   5730c:      	movw	$0x0, -0x274(%rbp,%rax)
   57316:      	movw	$0x0, -0x272(%rbp,%rax)
   57320:      	addq	$0x10, %rax
   57324:      	cmpq	$0x200, %rax            # imm = 0x200
   5732a:      	jne	0x572d0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x10f0>
   5732c:      	jmp	0x574ec <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x130c>
   57331:      	movq	%rax, %r14
   57334:      	movq	%r13, -0x50(%rbp)
   57338:      	jmp	0x5768f <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x14af>
   5733d:      	movq	%rax, %r14
   57340:      	xorl	%eax, %eax
   57342:      	nopw	%cs:(%rax,%rax)
   57350:      	movw	$0x0, -0xa80(%rbp,%rax)
   5735a:      	movw	$0x0, -0xa7e(%rbp,%rax)
   57364:      	movw	$0x0, -0xa7c(%rbp,%rax)
   5736e:      	movw	$0x0, -0xa7a(%rbp,%rax)
   57378:      	movw	$0x0, -0xa78(%rbp,%rax)
   57382:      	movw	$0x0, -0xa76(%rbp,%rax)
   5738c:      	movw	$0x0, -0xa74(%rbp,%rax)
   57396:      	movw	$0x0, -0xa72(%rbp,%rax)
   573a0:      	addq	$0x10, %rax
   573a4:      	cmpq	$0x200, %rax            # imm = 0x200
   573aa:      	jne	0x57350 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1170>
   573ac:      	jmp	0x5741c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x123c>
   573ae:      	movq	%rax, %r14
   573b1:      	xorl	%eax, %eax
   573b3:      	nopw	%cs:(%rax,%rax)
   573c0:      	movw	$0x0, -0x280(%rbp,%rax)
   573ca:      	movw	$0x0, -0x27e(%rbp,%rax)
   573d4:      	movw	$0x0, -0x27c(%rbp,%rax)
   573de:      	movw	$0x0, -0x27a(%rbp,%rax)
   573e8:      	movw	$0x0, -0x278(%rbp,%rax)
   573f2:      	movw	$0x0, -0x276(%rbp,%rax)
   573fc:      	movw	$0x0, -0x274(%rbp,%rax)
   57406:      	movw	$0x0, -0x272(%rbp,%rax)
   57410:      	addq	$0x10, %rax
   57414:      	cmpq	$0x200, %rax            # imm = 0x200
   5741a:      	jne	0x573c0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x11e0>
   5741c:      	xorl	%eax, %eax
   5741e:      	nop
   57420:      	movw	$0x0, -0x480(%rbp,%rax)
   5742a:      	movw	$0x0, -0x47e(%rbp,%rax)
   57434:      	movw	$0x0, -0x47c(%rbp,%rax)
   5743e:      	movw	$0x0, -0x47a(%rbp,%rax)
   57448:      	movw	$0x0, -0x478(%rbp,%rax)
   57452:      	movw	$0x0, -0x476(%rbp,%rax)
   5745c:      	movw	$0x0, -0x474(%rbp,%rax)
   57466:      	movw	$0x0, -0x472(%rbp,%rax)
   57470:      	addq	$0x10, %rax
   57474:      	cmpq	$0x200, %rax            # imm = 0x200
   5747a:      	jne	0x57420 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1240>
   5747c:      	jmp	0x574ec <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x130c>
   5747e:      	movq	%rax, %r14
   57481:      	xorl	%eax, %eax
   57483:      	nopw	%cs:(%rax,%rax)
   57490:      	movw	$0x0, -0xa80(%rbp,%rax)
   5749a:      	movw	$0x0, -0xa7e(%rbp,%rax)
   574a4:      	movw	$0x0, -0xa7c(%rbp,%rax)
   574ae:      	movw	$0x0, -0xa7a(%rbp,%rax)
   574b8:      	movw	$0x0, -0xa78(%rbp,%rax)
   574c2:      	movw	$0x0, -0xa76(%rbp,%rax)
   574cc:      	movw	$0x0, -0xa74(%rbp,%rax)
   574d6:      	movw	$0x0, -0xa72(%rbp,%rax)
   574e0:      	addq	$0x10, %rax
   574e4:      	cmpq	$0x200, %rax            # imm = 0x200
   574ea:      	jne	0x57490 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x12b0>
   574ec:      	pxor	%xmm0, %xmm0
   574f0:      	movdqa	%xmm0, -0x40(%rbp)
   574f5:      	movaps	-0x40(%rbp), %xmm1
   574f9:      	movaps	%xmm1, -0x60(%rbp)
   574fd:      	movdqa	%xmm0, -0x40(%rbp)
   57502:      	movaps	-0x40(%rbp), %xmm0
   57506:      	movaps	%xmm0, -0x50(%rbp)
   5750a:      	xorl	%eax, %eax
   5750c:      	nopl	(%rax)
   57510:      	movw	$0x0, -0x1080(%rbp,%rax)
   5751a:      	movw	$0x0, -0x107e(%rbp,%rax)
   57524:      	movw	$0x0, -0x107c(%rbp,%rax)
   5752e:      	movw	$0x0, -0x107a(%rbp,%rax)
   57538:      	movw	$0x0, -0x1078(%rbp,%rax)
   57542:      	movw	$0x0, -0x1076(%rbp,%rax)
   5754c:      	movw	$0x0, -0x1074(%rbp,%rax)
   57556:      	movw	$0x0, -0x1072(%rbp,%rax)
   57560:      	addq	$0x10, %rax
   57564:      	cmpq	$0x200, %rax            # imm = 0x200
   5756a:      	jne	0x57510 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1330>
   5756c:      	xorl	%eax, %eax
   5756e:      	nop
   57570:      	movw	$0x0, -0xe80(%rbp,%rax)
   5757a:      	movw	$0x0, -0xe7e(%rbp,%rax)
   57584:      	movw	$0x0, -0xe7c(%rbp,%rax)
   5758e:      	movw	$0x0, -0xe7a(%rbp,%rax)
   57598:      	movw	$0x0, -0xe78(%rbp,%rax)
   575a2:      	movw	$0x0, -0xe76(%rbp,%rax)
   575ac:      	movw	$0x0, -0xe74(%rbp,%rax)
   575b6:      	movw	$0x0, -0xe72(%rbp,%rax)
   575c0:      	addq	$0x10, %rax
   575c4:      	cmpq	$0x200, %rax            # imm = 0x200
   575ca:      	jne	0x57570 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1390>
   575cc:      	xorl	%eax, %eax
   575ce:      	nop
   575d0:      	movw	$0x0, -0xc80(%rbp,%rax)
   575da:      	movw	$0x0, -0xc7e(%rbp,%rax)
   575e4:      	movw	$0x0, -0xc7c(%rbp,%rax)
   575ee:      	movw	$0x0, -0xc7a(%rbp,%rax)
   575f8:      	movw	$0x0, -0xc78(%rbp,%rax)
   57602:      	movw	$0x0, -0xc76(%rbp,%rax)
   5760c:      	movw	$0x0, -0xc74(%rbp,%rax)
   57616:      	movw	$0x0, -0xc72(%rbp,%rax)
   57620:      	addq	$0x10, %rax
   57624:      	cmpq	$0x200, %rax            # imm = 0x200
   5762a:      	jne	0x575d0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x13f0>
   5762c:      	jmp	0x57698 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x14b8>
   5762e:      	movq	%rax, %r14
   57631:      	xorl	%eax, %eax
   57633:      	movw	$0x0, -0x1080(%rbp,%rax)
   5763d:      	movw	$0x0, -0x107e(%rbp,%rax)
   57647:      	movw	$0x0, -0x107c(%rbp,%rax)
   57651:      	movw	$0x0, -0x107a(%rbp,%rax)
   5765b:      	movw	$0x0, -0x1078(%rbp,%rax)
   57665:      	movw	$0x0, -0x1076(%rbp,%rax)
   5766f:      	movw	$0x0, -0x1074(%rbp,%rax)
   57679:      	movw	$0x0, -0x1072(%rbp,%rax)
   57683:      	addq	$0x10, %rax
   57687:      	cmpq	$0x200, %rax            # imm = 0x200
   5768d:      	jne	0x57633 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1453>
   5768f:      	leaq	-0x60(%rbp), %rdi
   57693:      	callq	0x547f0 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>
   57698:      	movq	%rbx, %rdi
   5769b:      	callq	0x54480 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>>
   576a0:      	movq	%r14, %rdi
   576a3:      	callq	0xb86a0 <_Unwind_Resume>
   576a8:      	callq	0xbdaba <core::panicking::panic_in_cleanup>
   576ad:      	int3
   576ae:      	int3
   576af:      	int3

00000000000576b0 <<toyos_crypto::mlkem::Poly>::ntt>:
   576b0:      	pushq	%rbp
   576b1:      	movq	%rsp, %rbp
   576b4:      	pushq	%r15
   576b6:      	pushq	%r14
   576b8:      	pushq	%r13
   576ba:      	pushq	%r12
   576bc:      	pushq	%rbx
   576bd:      	subq	$0x58, %rsp
   576c1:      	movq	%rsi, %rbx
   576c4:      	movq	%rdi, -0x30(%rbp)
   576c8:      	movl	$0x8, %eax
   576cd:      	leaq	-0x40a0a(%rip), %r14    # 0x16cca <anon.a439bd52d16495f5d747355f1db65386.5.llvm.18001447223344409526+0x127>
   576d4:      	jmp	0x576f6 <<toyos_crypto::mlkem::Poly>::ntt+0x46>
   576d6:      	nopw	%cs:(%rax,%rax)
   576e0:      	leaq	-0x4091f(%rip), %r14    # 0x16dc8 <anon.a439bd52d16495f5d747355f1db65386.5.llvm.18001447223344409526+0x225>
   576e7:      	cmpq	$0x2, -0x38(%rbp)
   576ec:      	movq	-0x40(%rbp), %rax
   576f0:      	jbe	0x577ee <<toyos_crypto::mlkem::Poly>::ntt+0x13e>
   576f6:      	movq	%rax, -0x38(%rbp)
   576fa:      	leaq	-0x1(%rax), %rcx
   576fe:      	movl	$0x1, %edx
   57703:      	shlq	%cl, %rdx
   57706:      	movl	$0x2, %edi
   5770b:      	movq	%rcx, -0x40(%rbp)
   5770f:      	shlq	%cl, %rdi
   57712:      	movl	%edi, %r12d
   57715:      	negl	%r12d
   57718:      	andl	$0x100, %r12d           # imm = 0x100
   5771f:      	movq	%rbx, %r13
   57722:      	cmpq	%r12, %rdi
   57725:      	movq	%rdx, -0x50(%rbp)
   57729:      	movq	%rdi, -0x48(%rbp)
   5772d:      	jbe	0x57754 <<toyos_crypto::mlkem::Poly>::ntt+0xa4>
   5772f:      	jmp	0x576e7 <<toyos_crypto::mlkem::Poly>::ntt+0x37>
   57731:      	nopw	%cs:(%rax,%rax)
   57740:      	movq	-0x48(%rbp), %rdi
   57744:      	subq	%rdi, %r12
   57747:      	addq	$0x2, %r14
   5774b:      	cmpq	%r12, %rdi
   5774e:      	movq	-0x50(%rbp), %rdx
   57752:      	ja	0x576e7 <<toyos_crypto::mlkem::Poly>::ntt+0x37>
   57754:      	leaq	-0x40993(%rip), %rax    # 0x16dc8 <anon.a439bd52d16495f5d747355f1db65386.5.llvm.18001447223344409526+0x225>
   5775b:      	cmpq	%rax, %r14
   5775e:      	je	0x576e0 <<toyos_crypto::mlkem::Poly>::ntt+0x30>
   57760:      	cmpq	%rdi, %rdx
   57763:      	ja	0x57882 <<toyos_crypto::mlkem::Poly>::ntt+0x1d2>
   57769:      	movq	%r13, %rsi
   5776c:      	leaq	(%r13,%rdi,2), %r13
   57771:      	movswl	(%r14), %r15d
   57775:      	leaq	(%rsi,%rdx,2), %rcx
   57779:      	leaq	-0x80(%rbp), %rdi
   5777d:      	movq	%rcx, %rdx
   57780:      	movq	%r13, %r8
   57783:      	callq	0x685b0 <<core::iter::adapters::zip::Zip<core::slice::iter::IterMut<i16>, core::slice::iter::Iter<i16>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::IterMut<i16>, core::slice::iter::Iter<i16>>>::new>
   57788:      	movq	-0x60(%rbp), %rax
   5778c:      	movq	-0x58(%rbp), %rcx
   57790:      	cmpq	%rcx, %rax
   57793:      	jae	0x57740 <<toyos_crypto::mlkem::Poly>::ntt+0x90>
   57795:      	movq	-0x80(%rbp), %rdx
   57799:      	movq	-0x70(%rbp), %rsi
   5779d:      	nopl	(%rax)
   577a0:      	movswl	(%rsi,%rax,2), %r8d
   577a5:      	imull	%r15d, %r8d
   577a9:      	imull	$0xf3010000, %r8d, %edi # imm = 0xF3010000
   577b0:      	sarl	$0x10, %edi
   577b3:      	imull	$0xfffff2ff, %edi, %edi # imm = 0xFFFFF2FF
   577b9:      	addl	%r8d, %edi
   577bc:      	shrl	$0x10, %edi
   577bf:      	movzwl	(%rdx,%rax,2), %r8d
   577c4:      	subw	%di, %r8w
   577c8:      	jo	0x5789c <<toyos_crypto::mlkem::Poly>::ntt+0x1ec>
   577ce:      	movw	%r8w, (%rsi,%rax,2)
   577d3:      	addw	(%rdx,%rax,2), %di
   577d7:      	jo	0x578aa <<toyos_crypto::mlkem::Poly>::ntt+0x1fa>
   577dd:      	movw	%di, (%rdx,%rax,2)
   577e1:      	incq	%rax
   577e4:      	cmpq	%rax, %rcx
   577e7:      	jne	0x577a0 <<toyos_crypto::mlkem::Poly>::ntt+0xf0>
   577e9:      	jmp	0x57740 <<toyos_crypto::mlkem::Poly>::ntt+0x90>
   577ee:      	xorl	%eax, %eax
   577f0:      	movdqa	-0x489a8(%rip), %xmm0   # 0xee50 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x210>
   577f8:      	movdqa	-0x48a30(%rip), %xmm1   # 0xedd0 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x190>
   57800:      	movdqa	-0x48768(%rip), %xmm2   # 0xf0a0 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x460>
   57808:      	nopl	(%rax,%rax)
   57810:      	movdqu	(%rbx,%rax,2), %xmm3
   57815:      	movdqa	%xmm3, %xmm4
   57819:      	punpcklwd	%xmm4, %xmm4    # xmm4 = xmm4[0,0,1,1,2,2,3,3]
   5781d:      	movdqa	%xmm3, %xmm5
   57821:      	punpckhwd	%xmm5, %xmm5    # xmm5 = xmm5[4,4,5,5,6,6,7,7]
   57825:      	pmaddwd	%xmm0, %xmm5
   57829:      	pmaddwd	%xmm0, %xmm4
   5782d:      	paddd	%xmm1, %xmm4
   57831:      	paddd	%xmm1, %xmm5
   57835:      	psrad	$0x1a, %xmm5
   5783a:      	psrad	$0x1a, %xmm4
   5783f:      	packssdw	%xmm5, %xmm4
   57843:      	pmullw	%xmm2, %xmm4
   57847:      	paddw	%xmm3, %xmm4
   5784b:      	movdqu	%xmm4, (%rbx,%rax,2)
   57850:      	addq	$0x8, %rax
   57854:      	cmpq	$0x100, %rax            # imm = 0x100
   5785a:      	jne	0x57810 <<toyos_crypto::mlkem::Poly>::ntt+0x160>
   5785c:      	movl	$0x200, %edx            # imm = 0x200
   57861:      	movq	-0x30(%rbp), %r14
   57865:      	movq	%r14, %rdi
   57868:      	movq	%rbx, %rsi
   5786b:      	callq	0xc4250 <memcpy>
   57870:      	movq	%r14, %rax
   57873:      	addq	$0x58, %rsp
   57877:      	popq	%rbx
   57878:      	popq	%r12
   5787a:      	popq	%r13
   5787c:      	popq	%r14
   5787e:      	popq	%r15
   57880:      	popq	%rbp
   57881:      	retq
   57882:      	leaq	-0x40bcb(%rip), %rdi    # 0x16cbe <anon.a439bd52d16495f5d747355f1db65386.5.llvm.18001447223344409526+0x11b>
   57889:      	leaq	0x6e8e0(%rip), %rdx     # 0xc6170 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526+0x48>
   57890:      	movl	$0x13, %esi
   57895:      	callq	0xbdc90 <core::panicking::panic_fmt>
   5789a:      	jmp	0x578b6 <<toyos_crypto::mlkem::Poly>::ntt+0x206>
   5789c:      	leaq	0x6e8e5(%rip), %rdi     # 0xc6188 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526+0x60>
   578a3:      	callq	0xbe8b0 <core::panicking::panic_const::panic_const_sub_overflow>
   578a8:      	jmp	0x578b6 <<toyos_crypto::mlkem::Poly>::ntt+0x206>
   578aa:      	leaq	0x6e8ef(%rip), %rdi     # 0xc61a0 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526+0x78>
   578b1:      	callq	0xbe870 <core::panicking::panic_const::panic_const_add_overflow>
   578b6:      	ud2
   578b8:      	jmp	0x578ba <<toyos_crypto::mlkem::Poly>::ntt+0x20a>
   578ba:      	xorl	%ecx, %ecx
   578bc:      	nopl	(%rax)
   578c0:      	movw	$0x0, (%rbx,%rcx)
   578c6:      	movw	$0x0, 0x2(%rbx,%rcx)
   578cd:      	movw	$0x0, 0x4(%rbx,%rcx)
   578d4:      	movw	$0x0, 0x6(%rbx,%rcx)
   578db:      	movw	$0x0, 0x8(%rbx,%rcx)
   578e2:      	movw	$0x0, 0xa(%rbx,%rcx)
   578e9:      	movw	$0x0, 0xc(%rbx,%rcx)
   578f0:      	movw	$0x0, 0xe(%rbx,%rcx)
   578f7:      	addq	$0x10, %rcx
   578fb:      	cmpq	$0x200, %rcx            # imm = 0x200
   57902:      	jne	0x578c0 <<toyos_crypto::mlkem::Poly>::ntt+0x210>
   57904:      	movq	%rax, %rdi
   57907:      	callq	0xb86a0 <_Unwind_Resume>
   5790c:      	int3
   5790d:      	int3
   5790e:      	int3
   5790f:      	int3

0000000000057910 <<toyos_crypto::mlkem::Poly>::plus>:
   57910:      	pushq	%rbp
   57911:      	movq	%rsp, %rbp
   57914:      	pushq	%r15
   57916:      	pushq	%r14
   57918:      	pushq	%rbx
   57919:      	pushq	%rax
   5791a:      	movq	%rdx, %r15
   5791d:      	movq	%rsi, %rbx
   57920:      	movq	%rdi, %r14
   57923:      	leaq	0x200(%rsi), %rdi
   5792a:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   5792f:      	testb	%al, %al
   57931:      	je	0x5799b <<toyos_crypto::mlkem::Poly>::plus+0x8b>
   57933:      	leaq	0x200(%r15), %rdi
   5793a:      	movq	%r15, %rsi
   5793d:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   57942:      	testb	%al, %al
   57944:      	je	0x5799b <<toyos_crypto::mlkem::Poly>::plus+0x8b>
   57946:      	movl	$0x1, %eax
   5794b:      	nopl	(%rax,%rax)
   57950:      	movzwl	-0x2(%rbx,%rax,2), %ecx
   57955:      	addw	-0x2(%r15,%rax,2), %cx
   5795b:      	jo	0x579b5 <<toyos_crypto::mlkem::Poly>::plus+0xa5>
   5795d:      	movw	%cx, -0x2(%rbx,%rax,2)
   57962:      	movzwl	(%rbx,%rax,2), %ecx
   57966:      	addw	(%r15,%rax,2), %cx
   5796b:      	jo	0x579b5 <<toyos_crypto::mlkem::Poly>::plus+0xa5>
   5796d:      	movw	%cx, (%rbx,%rax,2)
   57971:      	addq	$0x2, %rax
   57975:      	cmpq	$0x101, %rax            # imm = 0x101
   5797b:      	jne	0x57950 <<toyos_crypto::mlkem::Poly>::plus+0x40>
   5797d:      	movl	$0x200, %edx            # imm = 0x200
   57982:      	movq	%r14, %rdi
   57985:      	movq	%rbx, %rsi
   57988:      	callq	0xc4250 <memcpy>
   5798d:      	movq	%r14, %rax
   57990:      	addq	$0x8, %rsp
   57994:      	popq	%rbx
   57995:      	popq	%r14
   57997:      	popq	%r15
   57999:      	popq	%rbp
   5799a:      	retq
   5799b:      	leaq	-0x40a00(%rip), %rdi    # 0x16fa2 <anon.08fe1e1e6efec708bade37899f950c1e.0.llvm.12593199014745301125>
   579a2:      	leaq	0x6e947(%rip), %rcx     # 0xc62f0 <anon.08fe1e1e6efec708bade37899f950c1e.2.llvm.12593199014745301125>
   579a9:      	movl	$0x193, %esi            # imm = 0x193
   579ae:      	xorl	%edx, %edx
   579b0:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   579b5:      	leaq	0x6e7fc(%rip), %rdi     # 0xc61b8 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526+0x90>
   579bc:      	callq	0xbe870 <core::panicking::panic_const::panic_const_add_overflow>
   579c1:      	ud2
   579c3:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   579c8:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   579cd:      	xorl	%ecx, %ecx
   579cf:      	nop
   579d0:      	movw	$0x0, (%rbx,%rcx)
   579d6:      	movw	$0x0, 0x2(%rbx,%rcx)
   579dd:      	movw	$0x0, 0x4(%rbx,%rcx)
   579e4:      	movw	$0x0, 0x6(%rbx,%rcx)
   579eb:      	movw	$0x0, 0x8(%rbx,%rcx)
   579f2:      	movw	$0x0, 0xa(%rbx,%rcx)
   579f9:      	movw	$0x0, 0xc(%rbx,%rcx)
   57a00:      	movw	$0x0, 0xe(%rbx,%rcx)
   57a07:      	addq	$0x10, %rcx
   57a0b:      	cmpq	$0x200, %rcx            # imm = 0x200
   57a12:      	jne	0x579d0 <<toyos_crypto::mlkem::Poly>::plus+0xc0>
   57a14:      	movq	%rax, %rdi
   57a17:      	callq	0xb86a0 <_Unwind_Resume>
   57a1c:      	int3
   57a1d:      	int3
   57a1e:      	int3
   57a1f:      	int3

0000000000057a20 <<toyos_crypto::mlkem::Poly>::scale>:
   57a20:      	pushq	%rbp
   57a21:      	movq	%rsp, %rbp
   57a24:      	pushq	%rbx
   57a25:      	pushq	%rax
   57a26:      	movq	%rdi, %rbx
   57a29:      	movswl	%dx, %eax
   57a2c:      	movd	%eax, %xmm0
   57a30:      	pshufd	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
   57a35:      	movdqa	-0x48bfd(%rip), %xmm1   # 0xee40 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x200>
   57a3d:      	pmuludq	%xmm0, %xmm1
   57a41:      	pshufd	$0xa0, %xmm1, %xmm1     # xmm1 = xmm1[0,0,2,2]
   57a46:      	xorl	%eax, %eax
   57a48:      	pshufd	$0xf5, %xmm0, %xmm2     # xmm2 = xmm0[1,1,3,3]
   57a4d:      	pshufd	$0xf5, %xmm1, %xmm3     # xmm3 = xmm1[1,1,3,3]
   57a52:      	movdqa	-0x48b2a(%rip), %xmm4   # 0xef30 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x2f0>
   57a5a:      	nopw	(%rax,%rax)
   57a60:      	movdqu	(%rsi,%rax,2), %xmm5
   57a65:      	punpcklwd	%xmm5, %xmm7    # xmm7 = xmm7[0],xmm5[0],xmm7[1],xmm5[1],xmm7[2],xmm5[2],xmm7[3],xmm5[3]
   57a69:      	psrad	$0x10, %xmm7
   57a6e:      	punpckhwd	%xmm5, %xmm8    # xmm8 = xmm8[4],xmm5[4],xmm8[5],xmm5[5],xmm8[6],xmm5[6],xmm8[7],xmm5[7]
   57a73:      	psrad	$0x10, %xmm8
   57a79:      	movdqa	%xmm0, %xmm5
   57a7d:      	pmuludq	%xmm8, %xmm5
   57a82:      	pshufd	$0xe8, %xmm5, %xmm5     # xmm5 = xmm5[0,2,2,3]
   57a87:      	pshufd	$0xf5, %xmm8, %xmm9     # xmm9 = xmm8[1,1,3,3]
   57a8d:      	movdqa	%xmm2, %xmm6
   57a91:      	pmuludq	%xmm9, %xmm6
   57a96:      	pshufd	$0xe8, %xmm6, %xmm6     # xmm6 = xmm6[0,2,2,3]
   57a9b:      	punpckldq	%xmm6, %xmm5    # xmm5 = xmm5[0],xmm6[0],xmm5[1],xmm6[1]
   57a9f:      	movdqa	%xmm0, %xmm6
   57aa3:      	pmuludq	%xmm7, %xmm6
   57aa7:      	pshufd	$0xe8, %xmm6, %xmm6     # xmm6 = xmm6[0,2,2,3]
   57aac:      	pshufd	$0xf5, %xmm7, %xmm10    # xmm10 = xmm7[1,1,3,3]
   57ab2:      	movdqa	%xmm2, %xmm11
   57ab7:      	pmuludq	%xmm10, %xmm11
   57abc:      	pshufd	$0xe8, %xmm11, %xmm11   # xmm11 = xmm11[0,2,2,3]
   57ac2:      	punpckldq	%xmm11, %xmm6   # xmm6 = xmm6[0],xmm11[0],xmm6[1],xmm11[1]
   57ac7:      	pmuludq	%xmm1, %xmm8
   57acc:      	pshufd	$0xe8, %xmm8, %xmm8     # xmm8 = xmm8[0,2,2,3]
   57ad2:      	pmuludq	%xmm3, %xmm9
   57ad7:      	pshufd	$0xe8, %xmm9, %xmm9     # xmm9 = xmm9[0,2,2,3]
   57add:      	punpckldq	%xmm9, %xmm8    # xmm8 = xmm8[0],xmm9[0],xmm8[1],xmm9[1]
   57ae2:      	pmuludq	%xmm1, %xmm7
   57ae6:      	pshufd	$0xe8, %xmm7, %xmm7     # xmm7 = xmm7[0,2,2,3]
   57aeb:      	pmuludq	%xmm3, %xmm10
   57af0:      	pshufd	$0xe8, %xmm10, %xmm9    # xmm9 = xmm10[0,2,2,3]
   57af6:      	punpckldq	%xmm9, %xmm7    # xmm7 = xmm7[0],xmm9[0],xmm7[1],xmm9[1]
   57afb:      	psrld	$0x10, %xmm7
   57b00:      	psrld	$0x10, %xmm8
   57b06:      	pmaddwd	%xmm4, %xmm8
   57b0b:      	paddd	%xmm5, %xmm8
   57b10:      	pmaddwd	%xmm4, %xmm7
   57b14:      	paddd	%xmm6, %xmm7
   57b18:      	psrad	$0x10, %xmm8
   57b1e:      	psrad	$0x10, %xmm7
   57b23:      	packssdw	%xmm8, %xmm7
   57b28:      	movdqu	%xmm7, (%rsi,%rax,2)
   57b2d:      	addq	$0x8, %rax
   57b31:      	cmpq	$0x100, %rax            # imm = 0x100
   57b37:      	jne	0x57a60 <<toyos_crypto::mlkem::Poly>::scale+0x40>
   57b3d:      	movl	$0x200, %edx            # imm = 0x200
   57b42:      	movq	%rbx, %rdi
   57b45:      	callq	0xc4250 <memcpy>
   57b4a:      	movq	%rbx, %rax
   57b4d:      	addq	$0x8, %rsp
   57b51:      	popq	%rbx
   57b52:      	popq	%rbp
   57b53:      	retq
   57b54:      	int3
   57b55:      	int3
   57b56:      	int3
   57b57:      	int3
   57b58:      	int3
   57b59:      	int3
   57b5a:      	int3
   57b5b:      	int3
   57b5c:      	int3
   57b5d:      	int3
   57b5e:      	int3
   57b5f:      	int3

0000000000057b60 <<toyos_crypto::mlkem::Poly>::inverse>:
   57b60:      	pushq	%rbp
   57b61:      	movq	%rsp, %rbp
   57b64:      	pushq	%r15
   57b66:      	pushq	%r14
   57b68:      	pushq	%r13
   57b6a:      	pushq	%r12
   57b6c:      	pushq	%rbx
   57b6d:      	subq	$0x228, %rsp            # imm = 0x228
   57b74:      	movq	%rsi, %r14
   57b77:      	movq	%rdi, -0x30(%rbp)
   57b7b:      	movl	$0x1, %ecx
   57b80:      	leaq	-0x40dbf(%rip), %rbx    # 0x16dc8 <anon.a439bd52d16495f5d747355f1db65386.5.llvm.18001447223344409526+0x225>
   57b87:      	jmp	0x57ba8 <<toyos_crypto::mlkem::Poly>::inverse+0x48>
   57b89:      	nopl	(%rax)
   57b90:      	leaq	-0x40ecd(%rip), %rbx    # 0x16cca <anon.a439bd52d16495f5d747355f1db65386.5.llvm.18001447223344409526+0x127>
   57b97:      	movq	-0x38(%rbp), %rcx
   57b9b:      	incq	%rcx
   57b9e:      	cmpq	$0x8, %rcx
   57ba2:      	je	0x57cca <<toyos_crypto::mlkem::Poly>::inverse+0x16a>
   57ba8:      	movl	$0x1, %eax
   57bad:      	shlq	%cl, %rax
   57bb0:      	movq	%rax, -0x48(%rbp)
   57bb4:      	movl	$0x2, %edx
   57bb9:      	movq	%rcx, -0x38(%rbp)
   57bbd:      	shlq	%cl, %rdx
   57bc0:      	movl	%edx, %r15d
   57bc3:      	negl	%r15d
   57bc6:      	andl	$0x100, %r15d           # imm = 0x100
   57bcd:      	movq	%r14, %r13
   57bd0:      	cmpq	%r15, %rdx
   57bd3:      	movq	%rdx, -0x40(%rbp)
   57bd7:      	jbe	0x57bf0 <<toyos_crypto::mlkem::Poly>::inverse+0x90>
   57bd9:      	jmp	0x57b97 <<toyos_crypto::mlkem::Poly>::inverse+0x37>
   57bdb:      	nopl	(%rax,%rax)
   57be0:      	movq	-0x40(%rbp), %rdx
   57be4:      	subq	%rdx, %r15
   57be7:      	addq	$-0x2, %rbx
   57beb:      	cmpq	%r15, %rdx
   57bee:      	ja	0x57b97 <<toyos_crypto::mlkem::Poly>::inverse+0x37>
   57bf0:      	leaq	-0x40f2d(%rip), %rax    # 0x16cca <anon.a439bd52d16495f5d747355f1db65386.5.llvm.18001447223344409526+0x127>
   57bf7:      	cmpq	%rax, %rbx
   57bfa:      	je	0x57b90 <<toyos_crypto::mlkem::Poly>::inverse+0x30>
   57bfc:      	movq	%r13, %rsi
   57bff:      	leaq	(%r13,%rdx,2), %r13
   57c04:      	movswl	-0x2(%rbx), %r12d
   57c09:      	movq	-0x48(%rbp), %rax
   57c0d:      	leaq	(%rsi,%rax,2), %rcx
   57c11:      	leaq	-0x248(%rbp), %rdi
   57c18:      	movq	%rcx, %rdx
   57c1b:      	movq	%r13, %r8
   57c1e:      	callq	0x685b0 <<core::iter::adapters::zip::Zip<core::slice::iter::IterMut<i16>, core::slice::iter::Iter<i16>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::IterMut<i16>, core::slice::iter::Iter<i16>>>::new>
   57c23:      	movq	-0x228(%rbp), %rax
   57c2a:      	movq	-0x220(%rbp), %rcx
   57c31:      	cmpq	%rcx, %rax
   57c34:      	jae	0x57be0 <<toyos_crypto::mlkem::Poly>::inverse+0x80>
   57c36:      	movq	-0x248(%rbp), %rdx
   57c3d:      	movq	-0x238(%rbp), %rsi
   57c44:      	nopw	%cs:(%rax,%rax)
   57c50:      	movzwl	(%rdx,%rax,2), %edi
   57c54:      	movzwl	(%rsi,%rax,2), %r8d
   57c59:      	addw	%di, %r8w
   57c5d:      	jo	0x57ddd <<toyos_crypto::mlkem::Poly>::inverse+0x27d>
   57c63:      	movswl	%r8w, %r9d
   57c67:      	imull	$0x4ebf, %r9d, %r9d     # imm = 0x4EBF
   57c6e:      	addl	$0x2000000, %r9d        # imm = 0x2000000
   57c75:      	sarl	$0x1a, %r9d
   57c79:      	imull	$0xfffff2ff, %r9d, %r9d # imm = 0xFFFFF2FF
   57c80:      	addl	%r8d, %r9d
   57c83:      	movw	%r9w, (%rdx,%rax,2)
   57c88:      	movzwl	(%rsi,%rax,2), %r8d
   57c8d:      	subw	%di, %r8w
   57c91:      	jo	0x57deb <<toyos_crypto::mlkem::Poly>::inverse+0x28b>
   57c97:      	movswl	%r8w, %edi
   57c9b:      	imull	%r12d, %edi
   57c9f:      	imull	$0xf3010000, %edi, %r8d # imm = 0xF3010000
   57ca6:      	sarl	$0x10, %r8d
   57caa:      	imull	$0xfffff2ff, %r8d, %r8d # imm = 0xFFFFF2FF
   57cb1:      	addl	%edi, %r8d
   57cb4:      	shrl	$0x10, %r8d
   57cb8:      	movw	%r8w, (%rsi,%rax,2)
   57cbd:      	incq	%rax
   57cc0:      	cmpq	%rax, %rcx
   57cc3:      	jne	0x57c50 <<toyos_crypto::mlkem::Poly>::inverse+0xf0>
   57cc5:      	jmp	0x57be0 <<toyos_crypto::mlkem::Poly>::inverse+0x80>
   57cca:      	leaq	-0x248(%rbp), %rdi
   57cd1:      	movl	$0x200, %edx            # imm = 0x200
   57cd6:      	movq	%r14, %rsi
   57cd9:      	callq	0xc4250 <memcpy>
   57cde:      	xorl	%eax, %eax
   57ce0:      	movdqa	-0x48dc8(%rip), %xmm0   # 0xef20 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x2e0>
   57ce8:      	movdqa	-0x48cb0(%rip), %xmm1   # 0xf040 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x400>
   57cf0:      	movdqu	-0x248(%rbp,%rax,2), %xmm3
   57cf9:      	punpckhwd	%xmm3, %xmm2    # xmm2 = xmm2[4],xmm3[4],xmm2[5],xmm3[5],xmm2[6],xmm3[6],xmm2[7],xmm3[7]
   57cfd:      	psrad	$0x10, %xmm2
   57d02:      	punpcklwd	%xmm3, %xmm3    # xmm3 = xmm3[0,0,1,1,2,2,3,3]
   57d06:      	psrad	$0x10, %xmm3
   57d0b:      	movdqa	%xmm3, %xmm4
   57d0f:      	pmuludq	%xmm0, %xmm4
   57d13:      	pshufd	$0xe8, %xmm4, %xmm4     # xmm4 = xmm4[0,2,2,3]
   57d18:      	pshufd	$0xf5, %xmm3, %xmm5     # xmm5 = xmm3[1,1,3,3]
   57d1d:      	pmuludq	%xmm0, %xmm5
   57d21:      	pshufd	$0xe8, %xmm5, %xmm5     # xmm5 = xmm5[0,2,2,3]
   57d26:      	punpckldq	%xmm5, %xmm4    # xmm4 = xmm4[0],xmm5[0],xmm4[1],xmm5[1]
   57d2a:      	movdqa	%xmm2, %xmm5
   57d2e:      	pmuludq	%xmm0, %xmm5
   57d32:      	pshufd	$0xe8, %xmm5, %xmm5     # xmm5 = xmm5[0,2,2,3]
   57d37:      	pshufd	$0xf5, %xmm2, %xmm6     # xmm6 = xmm2[1,1,3,3]
   57d3c:      	pmuludq	%xmm0, %xmm6
   57d40:      	pshufd	$0xe8, %xmm6, %xmm6     # xmm6 = xmm6[0,2,2,3]
   57d45:      	punpckldq	%xmm6, %xmm5    # xmm5 = xmm5[0],xmm6[0],xmm5[1],xmm6[1]
   57d49:      	psrld	$0x10, %xmm5
   57d4e:      	psrld	$0x10, %xmm4
   57d53:      	pshuflw	$0xe8, %xmm4, %xmm4     # xmm4 = xmm4[0,2,2,3,4,5,6,7]
   57d58:      	pshufhw	$0xe8, %xmm4, %xmm4     # xmm4 = xmm4[0,1,2,3,4,6,6,7]
   57d5d:      	pshufd	$0xe8, %xmm4, %xmm4     # xmm4 = xmm4[0,2,2,3]
   57d62:      	packssdw	%xmm3, %xmm3
   57d66:      	punpcklwd	%xmm3, %xmm4    # xmm4 = xmm4[0],xmm3[0],xmm4[1],xmm3[1],xmm4[2],xmm3[2],xmm4[3],xmm3[3]
   57d6a:      	pmaddwd	%xmm1, %xmm4
   57d6e:      	pshuflw	$0xe8, %xmm5, %xmm3     # xmm3 = xmm5[0,2,2,3,4,5,6,7]
   57d73:      	pshufhw	$0xe8, %xmm3, %xmm3     # xmm3 = xmm3[0,1,2,3,4,6,6,7]
   57d78:      	pshufd	$0xe8, %xmm3, %xmm3     # xmm3 = xmm3[0,2,2,3]
   57d7d:      	packssdw	%xmm2, %xmm2
   57d81:      	punpcklwd	%xmm2, %xmm3    # xmm3 = xmm3[0],xmm2[0],xmm3[1],xmm2[1],xmm3[2],xmm2[2],xmm3[3],xmm2[3]
   57d85:      	pmaddwd	%xmm1, %xmm3
   57d89:      	psrad	$0x10, %xmm3
   57d8e:      	psrad	$0x10, %xmm4
   57d93:      	packssdw	%xmm3, %xmm4
   57d97:      	movdqu	%xmm4, -0x248(%rbp,%rax,2)
   57da0:      	addq	$0x8, %rax
   57da4:      	cmpq	$0x100, %rax            # imm = 0x100
   57daa:      	jne	0x57cf0 <<toyos_crypto::mlkem::Poly>::inverse+0x190>
   57db0:      	leaq	-0x248(%rbp), %rsi
   57db7:      	movl	$0x200, %edx            # imm = 0x200
   57dbc:      	movq	-0x30(%rbp), %rbx
   57dc0:      	movq	%rbx, %rdi
   57dc3:      	callq	0xc4250 <memcpy>
   57dc8:      	movq	%rbx, %rax
   57dcb:      	addq	$0x228, %rsp            # imm = 0x228
   57dd2:      	popq	%rbx
   57dd3:      	popq	%r12
   57dd5:      	popq	%r13
   57dd7:      	popq	%r14
   57dd9:      	popq	%r15
   57ddb:      	popq	%rbp
   57ddc:      	retq
   57ddd:      	leaq	0x6e404(%rip), %rdi     # 0xc61e8 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526+0xc0>
   57de4:      	callq	0xbe870 <core::panicking::panic_const::panic_const_add_overflow>
   57de9:      	jmp	0x57df7 <<toyos_crypto::mlkem::Poly>::inverse+0x297>
   57deb:      	leaq	0x6e40e(%rip), %rdi     # 0xc6200 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526+0xd8>
   57df2:      	callq	0xbe8b0 <core::panicking::panic_const::panic_const_sub_overflow>
   57df7:      	ud2
   57df9:      	jmp	0x57dfb <<toyos_crypto::mlkem::Poly>::inverse+0x29b>
   57dfb:      	xorl	%ecx, %ecx
   57dfd:      	nopl	(%rax)
   57e00:      	movw	$0x0, (%r14,%rcx)
   57e07:      	movw	$0x0, 0x2(%r14,%rcx)
   57e0f:      	movw	$0x0, 0x4(%r14,%rcx)
   57e17:      	movw	$0x0, 0x6(%r14,%rcx)
   57e1f:      	movw	$0x0, 0x8(%r14,%rcx)
   57e27:      	movw	$0x0, 0xa(%r14,%rcx)
   57e2f:      	movw	$0x0, 0xc(%r14,%rcx)
   57e37:      	movw	$0x0, 0xe(%r14,%rcx)
   57e3f:      	addq	$0x10, %rcx
   57e43:      	cmpq	$0x200, %rcx            # imm = 0x200
   57e4a:      	jne	0x57e00 <<toyos_crypto::mlkem::Poly>::inverse+0x2a0>
   57e4c:      	movq	%rax, %rdi
   57e4f:      	callq	0xb86a0 <_Unwind_Resume>
   57e54:      	int3
   57e55:      	int3
   57e56:      	int3
   57e57:      	int3
   57e58:      	int3
   57e59:      	int3
   57e5a:      	int3
   57e5b:      	int3
   57e5c:      	int3
   57e5d:      	int3
   57e5e:      	int3
   57e5f:      	int3

0000000000057e60 <<toyos_crypto::mlkem::Poly>::canonical>:
   57e60:      	pushq	%rbp
   57e61:      	movq	%rsp, %rbp
   57e64:      	pushq	%r14
   57e66:      	pushq	%rbx
   57e67:      	movq	%rsi, %rbx
   57e6a:      	movq	%rdi, %r14
   57e6d:      	xorl	%eax, %eax
   57e6f:      	nop
   57e70:      	movswl	(%rbx,%rax), %ecx
   57e74:      	imull	$0x4ebf, %ecx, %edx     # imm = 0x4EBF
   57e7a:      	addl	$0x2000000, %edx        # imm = 0x2000000
   57e80:      	sarl	$0x1a, %edx
   57e83:      	imull	$0xfffff2ff, %edx, %edx # imm = 0xFFFFF2FF
   57e89:      	addl	%ecx, %edx
   57e8b:      	movswl	%dx, %ecx
   57e8e:      	movl	%ecx, %edx
   57e90:      	shrl	$0xf, %edx
   57e93:      	andl	$0xd01, %edx            # imm = 0xD01
   57e99:      	addw	%dx, %cx
   57e9c:      	jo	0x57ec6 <<toyos_crypto::mlkem::Poly>::canonical+0x66>
   57e9e:      	movw	%cx, (%rbx,%rax)
   57ea2:      	addq	$0x2, %rax
   57ea6:      	cmpq	$0x200, %rax            # imm = 0x200
   57eac:      	jne	0x57e70 <<toyos_crypto::mlkem::Poly>::canonical+0x10>
   57eae:      	movl	$0x200, %edx            # imm = 0x200
   57eb3:      	movq	%r14, %rdi
   57eb6:      	movq	%rbx, %rsi
   57eb9:      	callq	0xc4250 <memcpy>
   57ebe:      	movq	%r14, %rax
   57ec1:      	popq	%rbx
   57ec2:      	popq	%r14
   57ec4:      	popq	%rbp
   57ec5:      	retq
   57ec6:      	leaq	0x6e3c3(%rip), %rdi     # 0xc6290 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526+0x168>
   57ecd:      	callq	0xbe870 <core::panicking::panic_const::panic_const_add_overflow>
   57ed2:      	ud2
   57ed4:      	xorl	%ecx, %ecx
   57ed6:      	nopw	%cs:(%rax,%rax)
   57ee0:      	movw	$0x0, (%rbx,%rcx)
   57ee6:      	movw	$0x0, 0x2(%rbx,%rcx)
   57eed:      	movw	$0x0, 0x4(%rbx,%rcx)
   57ef4:      	movw	$0x0, 0x6(%rbx,%rcx)
   57efb:      	movw	$0x0, 0x8(%rbx,%rcx)
   57f02:      	movw	$0x0, 0xa(%rbx,%rcx)
   57f09:      	movw	$0x0, 0xc(%rbx,%rcx)
   57f10:      	movw	$0x0, 0xe(%rbx,%rcx)
   57f17:      	addq	$0x10, %rcx
   57f1b:      	cmpq	$0x200, %rcx            # imm = 0x200
   57f22:      	jne	0x57ee0 <<toyos_crypto::mlkem::Poly>::canonical+0x80>
   57f24:      	movq	%rax, %rdi
   57f27:      	callq	0xb86a0 <_Unwind_Resume>
   57f2c:      	int3
   57f2d:      	int3
   57f2e:      	int3
   57f2f:      	int3

0000000000057f30 <toyos_crypto::mlkem::dot>:
   57f30:      	pushq	%rbp
   57f31:      	movq	%rsp, %rbp
   57f34:      	pushq	%r15
   57f36:      	pushq	%r14
   57f38:      	pushq	%r13
   57f3a:      	pushq	%r12
   57f3c:      	pushq	%rbx
   57f3d:      	subq	$0x228, %rsp            # imm = 0x228
   57f44:      	movq	%rdx, %r14
   57f47:      	movq	%rsi, %r15
   57f4a:      	movq	%rdi, -0x30(%rbp)
   57f4e:      	leaq	-0x248(%rbp), %rdi
   57f55:      	xorl	%ebx, %ebx
   57f57:      	movl	$0x200, %edx            # imm = 0x200
   57f5c:      	xorl	%esi, %esi
   57f5e:      	callq	0xc49a0 <memset>
   57f63:      	leaq	0x600(%r15), %rax
   57f6a:      	movq	%rax, -0x48(%rbp)
   57f6e:      	leaq	0x600(%r14), %rax
   57f75:      	movq	%rax, -0x38(%rbp)
   57f79:      	movq	%r14, -0x40(%rbp)
   57f7d:      	leaq	0x402(%r14), %r13
   57f84:      	movq	%r15, %r12
   57f87:      	leaq	0x402(%r15), %r14
   57f8e:      	nop
   57f90:      	leaq	-0x411cf(%rip), %rax    # 0x16dc8 <anon.a439bd52d16495f5d747355f1db65386.5.llvm.18001447223344409526+0x225>
   57f97:      	movswl	(%rbx,%rax), %r15d
   57f9c:      	movq	-0x48(%rbp), %rdi
   57fa0:      	movq	%r12, %rsi
   57fa3:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   57fa8:      	testb	%al, %al
   57faa:      	je	0x58174 <toyos_crypto::mlkem::dot+0x244>
   57fb0:      	movq	-0x38(%rbp), %rdi
   57fb4:      	movq	-0x40(%rbp), %rsi
   57fb8:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   57fbd:      	testb	%al, %al
   57fbf:      	je	0x58174 <toyos_crypto::mlkem::dot+0x244>
   57fc5:      	movswl	-0x402(%r14,%rbx,2), %ecx
   57fce:      	movswl	-0x400(%r14,%rbx,2), %edi
   57fd7:      	movswl	-0x402(%r13,%rbx,2), %edx
   57fe0:      	movswl	-0x400(%r13,%rbx,2), %esi
   57fe9:      	movl	%esi, %r8d
   57fec:      	imull	%ecx, %r8d
   57ff0:      	movl	%edx, %eax
   57ff2:      	imull	%edi, %eax
   57ff5:      	addl	%r8d, %eax
   57ff8:      	jo	0x5818e <toyos_crypto::mlkem::dot+0x25e>
   57ffe:      	imull	%edi, %esi
   58001:      	imull	$0xf3010000, %esi, %edi # imm = 0xF3010000
   58007:      	sarl	$0x10, %edi
   5800a:      	imull	$0xfffff2ff, %edi, %edi # imm = 0xFFFFF2FF
   58010:      	addl	%esi, %edi
   58012:      	sarl	$0x10, %edi
   58015:      	imull	%r15d, %edi
   58019:      	imull	%ecx, %edx
   5801c:      	addl	%edi, %edx
   5801e:      	movswl	-0x202(%r14,%rbx,2), %r9d
   58027:      	movswl	-0x200(%r14,%rbx,2), %edi
   58030:      	movswl	-0x202(%r13,%rbx,2), %esi
   58039:      	movswl	-0x200(%r13,%rbx,2), %r8d
   58042:      	movl	%esi, %r10d
   58045:      	imull	%r9d, %r10d
   58049:      	movl	%r8d, %r11d
   5804c:      	imull	%edi, %r11d
   58050:      	imull	$0xf3010000, %r11d, %ecx # imm = 0xF3010000
   58057:      	sarl	$0x10, %ecx
   5805a:      	imull	$0xfffff2ff, %ecx, %ecx # imm = 0xFFFFF2FF
   58060:      	addl	%r11d, %ecx
   58063:      	sarl	$0x10, %ecx
   58066:      	imull	%r15d, %ecx
   5806a:      	addl	%r10d, %ecx
   5806d:      	addl	%edx, %ecx
   5806f:      	jo	0x581a0 <toyos_crypto::mlkem::dot+0x270>
   58075:      	imull	%r9d, %r8d
   58079:      	imull	%edi, %esi
   5807c:      	addl	%r8d, %esi
   5807f:      	jo	0x5818e <toyos_crypto::mlkem::dot+0x25e>
   58085:      	addl	%esi, %eax
   58087:      	jo	0x58197 <toyos_crypto::mlkem::dot+0x267>
   5808d:      	movswl	-0x2(%r14,%rbx,2), %r8d
   58093:      	movswl	(%r14,%rbx,2), %esi
   58098:      	movswl	-0x2(%r13,%rbx,2), %edx
   5809e:      	movswl	(%r13,%rbx,2), %edi
   580a4:      	movl	%edx, %r9d
   580a7:      	imull	%r8d, %r9d
   580ab:      	movl	%edi, %r10d
   580ae:      	imull	%esi, %r10d
   580b2:      	imull	$0xf3010000, %r10d, %r11d # imm = 0xF3010000
   580b9:      	sarl	$0x10, %r11d
   580bd:      	imull	$0xfffff2ff, %r11d, %r11d # imm = 0xFFFFF2FF
   580c4:      	addl	%r10d, %r11d
   580c7:      	sarl	$0x10, %r11d
   580cb:      	imull	%r15d, %r11d
   580cf:      	addl	%r9d, %r11d
   580d2:      	addl	%r11d, %ecx
   580d5:      	jo	0x581a0 <toyos_crypto::mlkem::dot+0x270>
   580db:      	imull	%r8d, %edi
   580df:      	imull	%esi, %edx
   580e2:      	addl	%edi, %edx
   580e4:      	jo	0x5818e <toyos_crypto::mlkem::dot+0x25e>
   580ea:      	addl	%edx, %eax
   580ec:      	jo	0x58197 <toyos_crypto::mlkem::dot+0x267>
   580f2:      	imull	$0xf3010000, %ecx, %edx # imm = 0xF3010000
   580f8:      	sarl	$0x10, %edx
   580fb:      	imull	$0xd01, %edx, %edx      # imm = 0xD01
   58101:      	subl	%edx, %ecx
   58103:      	jo	0x581ae <toyos_crypto::mlkem::dot+0x27e>
   58109:      	shrl	$0x10, %ecx
   5810c:      	movw	%cx, -0x248(%rbp,%rbx,2)
   58114:      	imull	$0xf3010000, %eax, %ecx # imm = 0xF3010000
   5811a:      	sarl	$0x10, %ecx
   5811d:      	imull	$0xd01, %ecx, %ecx      # imm = 0xD01
   58123:      	subl	%ecx, %eax
   58125:      	jo	0x581ae <toyos_crypto::mlkem::dot+0x27e>
   5812b:      	shrl	$0x10, %eax
   5812e:      	movw	%ax, -0x246(%rbp,%rbx,2)
   58136:      	addq	$0x2, %rbx
   5813a:      	cmpq	$0x100, %rbx            # imm = 0x100
   58141:      	jne	0x57f90 <toyos_crypto::mlkem::dot+0x60>
   58147:      	movl	$0x200, %edx            # imm = 0x200
   5814c:      	movq	-0x30(%rbp), %rbx
   58150:      	movq	%rbx, %rdi
   58153:      	leaq	-0x248(%rbp), %rsi
   5815a:      	callq	0xc4250 <memcpy>
   5815f:      	movq	%rbx, %rax
   58162:      	addq	$0x228, %rsp            # imm = 0x228
   58169:      	popq	%rbx
   5816a:      	popq	%r12
   5816c:      	popq	%r13
   5816e:      	popq	%r14
   58170:      	popq	%r15
   58172:      	popq	%rbp
   58173:      	retq
   58174:      	leaq	-0x411d9(%rip), %rdi    # 0x16fa2 <anon.08fe1e1e6efec708bade37899f950c1e.0.llvm.12593199014745301125>
   5817b:      	leaq	0x6e16e(%rip), %rcx     # 0xc62f0 <anon.08fe1e1e6efec708bade37899f950c1e.2.llvm.12593199014745301125>
   58182:      	movl	$0x193, %esi            # imm = 0x193
   58187:      	xorl	%edx, %edx
   58189:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   5818e:      	leaq	0x6e0cb(%rip), %rdi     # 0xc6260 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526+0x138>
   58195:      	jmp	0x581a7 <toyos_crypto::mlkem::dot+0x277>
   58197:      	leaq	0x6e0da(%rip), %rdi     # 0xc6278 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526+0x150>
   5819e:      	jmp	0x581a7 <toyos_crypto::mlkem::dot+0x277>
   581a0:      	leaq	0x6e0a1(%rip), %rdi     # 0xc6248 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526+0x120>
   581a7:      	callq	0xbe870 <core::panicking::panic_const::panic_const_add_overflow>
   581ac:      	jmp	0x581ba <toyos_crypto::mlkem::dot+0x28a>
   581ae:      	leaq	0x6e07b(%rip), %rdi     # 0xc6230 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526+0x108>
   581b5:      	callq	0xbe8b0 <core::panicking::panic_const::panic_const_sub_overflow>
   581ba:      	ud2
   581bc:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   581c1:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   581c6:      	xorl	%ecx, %ecx
   581c8:      	nopl	(%rax,%rax)
   581d0:      	movw	$0x0, -0x248(%rbp,%rcx)
   581da:      	movw	$0x0, -0x246(%rbp,%rcx)
   581e4:      	movw	$0x0, -0x244(%rbp,%rcx)
   581ee:      	movw	$0x0, -0x242(%rbp,%rcx)
   581f8:      	movw	$0x0, -0x240(%rbp,%rcx)
   58202:      	movw	$0x0, -0x23e(%rbp,%rcx)
   5820c:      	movw	$0x0, -0x23c(%rbp,%rcx)
   58216:      	movw	$0x0, -0x23a(%rbp,%rcx)
   58220:      	addq	$0x10, %rcx
   58224:      	cmpq	$0x200, %rcx            # imm = 0x200
   5822b:      	jne	0x581d0 <toyos_crypto::mlkem::dot+0x2a0>
   5822d:      	movq	%rax, %rdi
   58230:      	callq	0xb86a0 <_Unwind_Resume>
   58235:      	int3
   58236:      	int3
   58237:      	int3
   58238:      	int3
   58239:      	int3
   5823a:      	int3
   5823b:      	int3
   5823c:      	int3
   5823d:      	int3
   5823e:      	int3
   5823f:      	int3

0000000000058240 <toyos_crypto::mlkem::noise>:
   58240:      	pushq	%rbp
   58241:      	movq	%rsp, %rbp
   58244:      	pushq	%r15
   58246:      	pushq	%r14
   58248:      	pushq	%rbx
   58249:      	subq	$0x2a8, %rsp            # imm = 0x2A8
   58250:      	movq	%rdi, %rbx
   58253:      	xorps	%xmm0, %xmm0
   58256:      	movaps	%xmm0, -0x50(%rbp)
   5825a:      	movaps	%xmm0, -0x60(%rbp)
   5825e:      	movaps	%xmm0, -0x70(%rbp)
   58262:      	movaps	%xmm0, -0x80(%rbp)
   58266:      	movaps	%xmm0, -0x90(%rbp)
   5826d:      	movaps	%xmm0, -0xa0(%rbp)
   58274:      	movaps	%xmm0, -0xb0(%rbp)
   5827b:      	movaps	%xmm0, -0xc0(%rbp)
   58282:      	movb	%dl, -0x19(%rbp)
   58285:      	movq	%rsi, -0x40(%rbp)
   58289:      	movq	$0x20, -0x38(%rbp)
   58291:      	leaq	-0x19(%rbp), %rax
   58295:      	movq	%rax, -0x30(%rbp)
   58299:      	movq	$0x1, -0x28(%rbp)
   582a1:      	leaq	-0x2c0(%rbp), %rdi
   582a8:      	leaq	-0x40(%rbp), %rcx
   582ac:      	movl	$0x88, %esi
   582b1:      	movl	$0x2, %r8d
   582b7:      	movl	$0x1f, %edx
   582bc:      	callq	0x496f0 <<toyos_crypto::keccak::Sponge>::new>
   582c1:      	leaq	-0x2c0(%rbp), %rdi
   582c8:      	leaq	-0xc0(%rbp), %r14
   582cf:      	movl	$0x80, %edx
   582d4:      	movq	%r14, %rsi
   582d7:      	callq	0x49ad0 <<toyos_crypto::keccak::Sponge>::read>
   582dc:      	movq	$0x0, -0x2c0(%rbp)
   582e7:      	movq	$0x0, -0x2b8(%rbp)
   582f2:      	movq	$0x0, -0x2b0(%rbp)
   582fd:      	movq	$0x0, -0x2a8(%rbp)
   58308:      	movq	$0x0, -0x2a0(%rbp)
   58313:      	movq	$0x0, -0x298(%rbp)
   5831e:      	movq	$0x0, -0x290(%rbp)
   58329:      	movq	$0x0, -0x288(%rbp)
   58334:      	movq	$0x0, -0x280(%rbp)
   5833f:      	movq	$0x0, -0x278(%rbp)
   5834a:      	movq	$0x0, -0x270(%rbp)
   58355:      	movq	$0x0, -0x268(%rbp)
   58360:      	movq	$0x0, -0x260(%rbp)
   5836b:      	movq	$0x0, -0x258(%rbp)
   58376:      	movq	$0x0, -0x250(%rbp)
   58381:      	movq	$0x0, -0x248(%rbp)
   5838c:      	movq	$0x0, -0x240(%rbp)
   58397:      	movq	$0x0, -0x238(%rbp)
   583a2:      	movq	$0x0, -0x230(%rbp)
   583ad:      	movq	$0x0, -0x228(%rbp)
   583b8:      	movq	$0x0, -0x220(%rbp)
   583c3:      	movq	$0x0, -0x218(%rbp)
   583ce:      	movq	$0x0, -0x210(%rbp)
   583d9:      	movq	$0x0, -0x208(%rbp)
   583e4:      	movq	$0x0, -0x200(%rbp)
   583ef:      	leaq	-0x2c0(%rbp), %rdi
   583f6:      	xorl	%r15d, %r15d
   583f9:      	movl	$0x200, %edx            # imm = 0x200
   583fe:      	xorl	%esi, %esi
   58400:      	callq	0xc49a0 <memset>
   58405:      	movd	-0x498bd(%rip), %xmm0   # 0xeb50 <anon.eb4e9983f1dde2da9251237d0548192c.1.llvm.16376435883611519421+0x590>
   5840d:      	movd	-0x4811d(%rip), %xmm1   # 0x102f8 <anon.c0f308983206626af30a745d03c91a10.7.llvm.12480394386067567631+0x203>
   58415:      	pxor	%xmm2, %xmm2
   58419:      	movdqa	-0x498e1(%rip), %xmm3   # 0xeb40 <anon.eb4e9983f1dde2da9251237d0548192c.1.llvm.16376435883611519421+0x580>
   58421:      	movdqa	-0x49379(%rip), %xmm4   # 0xf0b0 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x470>
   58429:      	movdqa	-0x49961(%rip), %xmm5   # 0xead0 <anon.eb4e9983f1dde2da9251237d0548192c.1.llvm.16376435883611519421+0x510>
   58431:      	movdqa	-0x49899(%rip), %xmm6   # 0xeba0 <anon.eb4e9983f1dde2da9251237d0548192c.1.llvm.16376435883611519421+0x5e0>
   58439:      	movdqa	-0x49471(%rip), %xmm7   # 0xefd0 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x390>
   58441:      	nopw	%cs:(%rax,%rax)
   58450:      	movzbl	(%r14), %eax
   58454:      	movd	%eax, %xmm8
   58459:      	punpcklbw	%xmm8, %xmm8    # xmm8 = xmm8[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
   5845e:      	movdqa	%xmm0, %xmm9
   58463:      	psllw	$0x7, %xmm9
   58469:      	pand	%xmm1, %xmm9
   5846e:      	pxor	%xmm10, %xmm10
   58473:      	pcmpgtb	%xmm9, %xmm10
   58478:      	movdqa	%xmm10, %xmm11
   5847d:      	pandn	%xmm8, %xmm11
   58482:      	psrlw	$0x4, %xmm8
   58488:      	pand	%xmm10, %xmm8
   5848d:      	pand	%xmm3, %xmm8
   58492:      	por	%xmm11, %xmm8
   58497:      	paddb	%xmm9, %xmm9
   5849c:      	pxor	%xmm10, %xmm10
   584a1:      	pcmpgtb	%xmm9, %xmm10
   584a6:      	movdqa	%xmm10, %xmm11
   584ab:      	pandn	%xmm8, %xmm11
   584b0:      	psrlw	$0x2, %xmm8
   584b6:      	pand	%xmm10, %xmm8
   584bb:      	pand	%xmm4, %xmm8
   584c0:      	por	%xmm11, %xmm8
   584c5:      	paddb	%xmm9, %xmm9
   584ca:      	pxor	%xmm10, %xmm10
   584cf:      	pcmpgtb	%xmm9, %xmm10
   584d4:      	movdqa	%xmm10, %xmm9
   584d9:      	pandn	%xmm8, %xmm9
   584de:      	psrlw	$0x1, %xmm8
   584e4:      	pand	%xmm10, %xmm8
   584e9:      	pand	%xmm5, %xmm8
   584ee:      	por	%xmm9, %xmm8
   584f3:      	movdqa	%xmm8, %xmm9
   584f8:      	pand	%xmm6, %xmm9
   584fd:      	movdqa	%xmm8, %xmm10
   58502:      	psrlw	$0x1, %xmm10
   58508:      	pand	%xmm6, %xmm10
   5850d:      	paddb	%xmm9, %xmm10
   58512:      	movdqa	%xmm8, %xmm9
   58517:      	psrlw	$0x2, %xmm9
   5851d:      	pand	%xmm6, %xmm9
   58522:      	psrlw	$0x3, %xmm8
   58528:      	pand	%xmm6, %xmm8
   5852d:      	paddb	%xmm9, %xmm8
   58532:      	punpcklbw	%xmm2, %xmm10   # xmm10 = xmm10[0],xmm2[0],xmm10[1],xmm2[1],xmm10[2],xmm2[2],xmm10[3],xmm2[3],xmm10[4],xmm2[4],xmm10[5],xmm2[5],xmm10[6],xmm2[6],xmm10[7],xmm2[7]
   58537:      	punpcklbw	%xmm2, %xmm8    # xmm8 = xmm8[0],xmm2[0],xmm8[1],xmm2[1],xmm8[2],xmm2[2],xmm8[3],xmm2[3],xmm8[4],xmm2[4],xmm8[5],xmm2[5],xmm8[6],xmm2[6],xmm8[7],xmm2[7]
   5853c:      	psubw	%xmm8, %xmm10
   58541:      	movd	%xmm10, -0x2c0(%rbp,%r15,2)
   5854b:      	addq	$0x2, %r15
   5854f:      	paddb	%xmm7, %xmm0
   58553:      	incq	%r14
   58556:      	cmpq	$0x100, %r15            # imm = 0x100
   5855d:      	jne	0x58450 <toyos_crypto::mlkem::noise+0x210>
   58563:      	leaq	-0x2c0(%rbp), %rsi
   5856a:      	movl	$0x200, %edx            # imm = 0x200
   5856f:      	movq	%rbx, %rdi
   58572:      	callq	0xc4250 <memcpy>
   58577:      	pxor	%xmm0, %xmm0
   5857b:      	movdqa	%xmm0, -0x2c0(%rbp)
   58583:      	movaps	-0x2c0(%rbp), %xmm1
   5858a:      	movaps	%xmm1, -0xc0(%rbp)
   58591:      	movdqa	%xmm0, -0x2c0(%rbp)
   58599:      	movaps	-0x2c0(%rbp), %xmm1
   585a0:      	movaps	%xmm1, -0xb0(%rbp)
   585a7:      	movdqa	%xmm0, -0x2c0(%rbp)
   585af:      	movaps	-0x2c0(%rbp), %xmm1
   585b6:      	movaps	%xmm1, -0xa0(%rbp)
   585bd:      	movdqa	%xmm0, -0x2c0(%rbp)
   585c5:      	movaps	-0x2c0(%rbp), %xmm1
   585cc:      	movaps	%xmm1, -0x90(%rbp)
   585d3:      	movdqa	%xmm0, -0x2c0(%rbp)
   585db:      	movaps	-0x2c0(%rbp), %xmm1
   585e2:      	movaps	%xmm1, -0x80(%rbp)
   585e6:      	movdqa	%xmm0, -0x2c0(%rbp)
   585ee:      	movaps	-0x2c0(%rbp), %xmm1
   585f5:      	movaps	%xmm1, -0x70(%rbp)
   585f9:      	movdqa	%xmm0, -0x2c0(%rbp)
   58601:      	movaps	-0x2c0(%rbp), %xmm1
   58608:      	movaps	%xmm1, -0x60(%rbp)
   5860c:      	movdqa	%xmm0, -0x2c0(%rbp)
   58614:      	movaps	-0x2c0(%rbp), %xmm0
   5861b:      	movaps	%xmm0, -0x50(%rbp)
   5861f:      	movq	%rbx, %rax
   58622:      	addq	$0x2a8, %rsp            # imm = 0x2A8
   58629:      	popq	%rbx
   5862a:      	popq	%r14
   5862c:      	popq	%r15
   5862e:      	popq	%rbp
   5862f:      	retq
   58630:      	movq	%rax, %rbx
   58633:      	leaq	-0x2c0(%rbp), %rdi
   5863a:      	callq	0x54630 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   5863f:      	jmp	0x58644 <toyos_crypto::mlkem::noise+0x404>
   58641:      	movq	%rax, %rbx
   58644:      	leaq	-0xc0(%rbp), %rdi
   5864b:      	callq	0x543a0 <core::ptr::drop_glue::<toyos_crypto::secret::Secret<8, [u8; 16]>>>
   58650:      	movq	%rbx, %rdi
   58653:      	callq	0xb86a0 <_Unwind_Resume>
   58658:      	callq	0xbdaba <core::panicking::panic_in_cleanup>
   5865d:      	int3
   5865e:      	int3
   5865f:      	int3

0000000000058660 <toyos_crypto::mlkem::sample>:
   58660:      	pushq	%rbp
   58661:      	movq	%rsp, %rbp
   58664:      	pushq	%r15
   58666:      	pushq	%r14
   58668:      	pushq	%r12
   5866a:      	pushq	%rbx
   5866b:      	subq	$0x380, %rsp            # imm = 0x380
   58672:      	movq	%rdi, %rbx
   58675:      	movb	%cl, -0x1a0(%rbp)
   5867b:      	movb	%dl, -0x19f(%rbp)
   58681:      	movq	%rsi, -0x3a0(%rbp)
   58688:      	movq	$0x20, -0x398(%rbp)
   58693:      	leaq	-0x1a0(%rbp), %r14
   5869a:      	movq	%r14, -0x390(%rbp)
   586a1:      	movq	$0x2, -0x388(%rbp)
   586ac:      	leaq	-0xf8(%rbp), %r15
   586b3:      	leaq	-0x3a0(%rbp), %rcx
   586ba:      	movl	$0xa8, %esi
   586bf:      	movl	$0x2, %r8d
   586c5:      	movq	%r15, %rdi
   586c8:      	movl	$0x1f, %edx
   586cd:      	callq	0x496f0 <<toyos_crypto::keccak::Sponge>::new>
   586d2:      	leaq	-0x3a0(%rbp), %rdi
   586d9:      	xorl	%r12d, %r12d
   586dc:      	movl	$0x200, %edx            # imm = 0x200
   586e1:      	xorl	%esi, %esi
   586e3:      	callq	0xc49a0 <memset>
   586e8:      	xorps	%xmm0, %xmm0
   586eb:      	movaps	%xmm0, -0x110(%rbp)
   586f2:      	movaps	%xmm0, -0x120(%rbp)
   586f9:      	movaps	%xmm0, -0x130(%rbp)
   58700:      	movaps	%xmm0, -0x140(%rbp)
   58707:      	movaps	%xmm0, -0x150(%rbp)
   5870e:      	movaps	%xmm0, -0x160(%rbp)
   58715:      	movaps	%xmm0, -0x170(%rbp)
   5871c:      	movaps	%xmm0, -0x180(%rbp)
   58723:      	movaps	%xmm0, -0x190(%rbp)
   5872a:      	movaps	%xmm0, -0x1a0(%rbp)
   58731:      	movq	$0x0, -0x100(%rbp)
   5873c:      	jmp	0x5874d <toyos_crypto::mlkem::sample+0xed>
   5873e:      	nop
   58740:      	cmpq	$0x100, %r12            # imm = 0x100
   58747:      	jae	0x587e5 <toyos_crypto::mlkem::sample+0x185>
   5874d:      	movl	$0xa8, %edx
   58752:      	movq	%r15, %rdi
   58755:      	movq	%r14, %rsi
   58758:      	callq	0x49ad0 <<toyos_crypto::keccak::Sponge>::read>
   5875d:      	movl	$0x2, %eax
   58762:      	jmp	0x5877c <toyos_crypto::mlkem::sample+0x11c>
   58764:      	nopw	%cs:(%rax,%rax)
   58770:      	addq	$0x3, %rax
   58774:      	cmpq	$0xaa, %rax
   5877a:      	je	0x58740 <toyos_crypto::mlkem::sample+0xe0>
   5877c:      	movzbl	-0x1a2(%rbp,%rax), %esi
   58784:      	movzbl	-0x1a1(%rbp,%rax), %ecx
   5878c:      	movl	%ecx, %edx
   5878e:      	andl	$0xf, %edx
   58791:      	shll	$0x8, %edx
   58794:      	orl	%esi, %edx
   58796:      	cmpl	$0xd00, %edx            # imm = 0xD00
   5879c:      	ja	0x587b3 <toyos_crypto::mlkem::sample+0x153>
   5879e:      	cmpq	$0x100, %r12            # imm = 0x100
   587a5:      	jae	0x587b3 <toyos_crypto::mlkem::sample+0x153>
   587a7:      	movw	%dx, -0x3a0(%rbp,%r12,2)
   587b0:      	incq	%r12
   587b3:      	movzbl	-0x1a0(%rbp,%rax), %edx
   587bb:      	shrl	$0x4, %ecx
   587be:      	shll	$0x4, %edx
   587c1:      	orl	%ecx, %edx
   587c3:      	movzwl	%dx, %ecx
   587c6:      	cmpl	$0xd00, %ecx            # imm = 0xD00
   587cc:      	ja	0x58770 <toyos_crypto::mlkem::sample+0x110>
   587ce:      	cmpq	$0xff, %r12
   587d5:      	ja	0x58770 <toyos_crypto::mlkem::sample+0x110>
   587d7:      	movw	%dx, -0x3a0(%rbp,%r12,2)
   587e0:      	incq	%r12
   587e3:      	jmp	0x58770 <toyos_crypto::mlkem::sample+0x110>
   587e5:      	leaq	-0x3a0(%rbp), %rsi
   587ec:      	movl	$0x200, %edx            # imm = 0x200
   587f1:      	movq	%rbx, %rdi
   587f4:      	callq	0xc4250 <memcpy>
   587f9:      	movq	$0x0, -0xf8(%rbp)
   58804:      	movq	$0x0, -0xf0(%rbp)
   5880f:      	movq	$0x0, -0xe8(%rbp)
   5881a:      	movq	$0x0, -0xe0(%rbp)
   58825:      	movq	$0x0, -0xd8(%rbp)
   58830:      	movq	$0x0, -0xd0(%rbp)
   5883b:      	movq	$0x0, -0xc8(%rbp)
   58846:      	movq	$0x0, -0xc0(%rbp)
   58851:      	movq	$0x0, -0xb8(%rbp)
   5885c:      	movq	$0x0, -0xb0(%rbp)
   58867:      	movq	$0x0, -0xa8(%rbp)
   58872:      	movq	$0x0, -0xa0(%rbp)
   5887d:      	movq	$0x0, -0x98(%rbp)
   58888:      	movq	$0x0, -0x90(%rbp)
   58893:      	movq	$0x0, -0x88(%rbp)
   5889e:      	movq	$0x0, -0x80(%rbp)
   588a6:      	movq	$0x0, -0x78(%rbp)
   588ae:      	movq	$0x0, -0x70(%rbp)
   588b6:      	movq	$0x0, -0x68(%rbp)
   588be:      	movq	$0x0, -0x60(%rbp)
   588c6:      	movq	$0x0, -0x58(%rbp)
   588ce:      	movq	$0x0, -0x50(%rbp)
   588d6:      	movq	$0x0, -0x48(%rbp)
   588de:      	movq	$0x0, -0x40(%rbp)
   588e6:      	movq	$0x0, -0x38(%rbp)
   588ee:      	movq	%rbx, %rax
   588f1:      	addq	$0x380, %rsp            # imm = 0x380
   588f8:      	popq	%rbx
   588f9:      	popq	%r12
   588fb:      	popq	%r14
   588fd:      	popq	%r15
   588ff:      	popq	%rbp
   58900:      	retq
   58901:      	movq	%rax, %rbx
   58904:      	xorl	%eax, %eax
   58906:      	nopw	%cs:(%rax,%rax)
   58910:      	movw	$0x0, -0x3a0(%rbp,%rax)
   5891a:      	movw	$0x0, -0x39e(%rbp,%rax)
   58924:      	movw	$0x0, -0x39c(%rbp,%rax)
   5892e:      	movw	$0x0, -0x39a(%rbp,%rax)
   58938:      	movw	$0x0, -0x398(%rbp,%rax)
   58942:      	movw	$0x0, -0x396(%rbp,%rax)
   5894c:      	movw	$0x0, -0x394(%rbp,%rax)
   58956:      	movw	$0x0, -0x392(%rbp,%rax)
   58960:      	addq	$0x10, %rax
   58964:      	cmpq	$0x200, %rax            # imm = 0x200
   5896a:      	jne	0x58910 <toyos_crypto::mlkem::sample+0x2b0>
   5896c:      	leaq	-0xf8(%rbp), %rdi
   58973:      	callq	0x54630 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   58978:      	movq	%rbx, %rdi
   5897b:      	callq	0xb86a0 <_Unwind_Resume>
   58980:      	callq	0xbdaba <core::panicking::panic_in_cleanup>
   58985:      	int3
   58986:      	int3
   58987:      	int3
   58988:      	int3
   58989:      	int3
   5898a:      	int3
   5898b:      	int3
   5898c:      	int3
   5898d:      	int3
   5898e:      	int3
   5898f:      	int3

0000000000058990 <<toyos_crypto::mlkem::Poly>::decode::<1>>:
   58990:      	pushq	%rbp
   58991:      	movq	%rsp, %rbp
   58994:      	pushq	%r15
   58996:      	pushq	%r14
   58998:      	pushq	%rbx
   58999:      	subq	$0x218, %rsp            # imm = 0x218
   589a0:      	movq	%rdx, -0x230(%rbp)
   589a7:      	cmpq	$0x20, %rdx
   589ab:      	jne	0x58b3b <<toyos_crypto::mlkem::Poly>::decode::<1>+0x1ab>
   589b1:      	movq	%rsi, %r14
   589b4:      	movq	%rdi, %rbx
   589b7:      	leaq	-0x230(%rbp), %r15
   589be:      	movl	$0x200, %edx            # imm = 0x200
   589c3:      	movq	%r15, %rdi
   589c6:      	xorl	%esi, %esi
   589c8:      	callq	0xc49a0 <memset>
   589cd:      	leaq	-0x30(%rbp), %rdi
   589d1:      	movq	%r15, %rsi
   589d4:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   589d9:      	testb	%al, %al
   589db:      	je	0x58b21 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x191>
   589e1:      	leaq	0x20(%r14), %rdi
   589e5:      	movq	%r14, %rsi
   589e8:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   589ed:      	testb	%al, %al
   589ef:      	je	0x58b21 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x191>
   589f5:      	leaq	-0x30(%rbp), %rax
   589f9:      	movq	%r14, %rcx
   589fc:      	subq	%rax, %rcx
   589ff:      	movq	%rax, %rdx
   58a02:      	subq	%r14, %rdx
   58a05:      	movl	$0xe, %esi
   58a0a:      	xorps	%xmm0, %xmm0
   58a0d:      	nopl	(%rax)
   58a10:      	movaps	%xmm0, -0x30(%rbp)
   58a14:      	cmpq	%rax, %r14
   58a17:      	movq	%rcx, %rdi
   58a1a:      	cmovbq	%rdx, %rdi
   58a1e:      	testq	%rdi, %rdi
   58a21:      	je	0x58b07 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x177>
   58a27:      	movzbl	(%r14), %edi
   58a2b:      	movb	%dil, -0x30(%rbp)
   58a2f:      	movzwl	-0x30(%rbp), %edi
   58a33:      	movl	%edi, %r8d
   58a36:      	andl	$0x1, %r8d
   58a3a:      	movw	%r8w, -0x23e(%rbp,%rsi)
   58a43:      	movl	%edi, %r8d
   58a46:      	shrl	%r8d
   58a49:      	andl	$0x1, %r8d
   58a4d:      	movw	%r8w, -0x23c(%rbp,%rsi)
   58a56:      	movl	%edi, %r8d
   58a59:      	shrl	$0x2, %r8d
   58a5d:      	andl	$0x1, %r8d
   58a61:      	movw	%r8w, -0x23a(%rbp,%rsi)
   58a6a:      	movl	%edi, %r8d
   58a6d:      	shrl	$0x3, %r8d
   58a71:      	andl	$0x1, %r8d
   58a75:      	movw	%r8w, -0x238(%rbp,%rsi)
   58a7e:      	movl	%edi, %r8d
   58a81:      	shrl	$0x4, %r8d
   58a85:      	andl	$0x1, %r8d
   58a89:      	movw	%r8w, -0x236(%rbp,%rsi)
   58a92:      	movl	%edi, %r8d
   58a95:      	shrl	$0x5, %r8d
   58a99:      	andl	$0x1, %r8d
   58a9d:      	movw	%r8w, -0x234(%rbp,%rsi)
   58aa6:      	movl	%edi, %r8d
   58aa9:      	shrl	$0x6, %r8d
   58aad:      	andl	$0x1, %r8d
   58ab1:      	movw	%r8w, -0x232(%rbp,%rsi)
   58aba:      	shrl	$0x7, %edi
   58abd:      	andl	$0x1, %edi
   58ac0:      	movw	%di, -0x230(%rbp,%rsi)
   58ac8:      	addq	$0x10, %rsi
   58acc:      	incq	%r14
   58acf:      	incq	%rcx
   58ad2:      	decq	%rdx
   58ad5:      	cmpq	$0x20e, %rsi            # imm = 0x20E
   58adc:      	jne	0x58a10 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x80>
   58ae2:      	leaq	-0x230(%rbp), %rsi
   58ae9:      	movl	$0x200, %edx            # imm = 0x200
   58aee:      	movq	%rbx, %rdi
   58af1:      	callq	0xc4250 <memcpy>
   58af6:      	movq	%rbx, %rax
   58af9:      	addq	$0x218, %rsp            # imm = 0x218
   58b00:      	popq	%rbx
   58b01:      	popq	%r14
   58b03:      	popq	%r15
   58b05:      	popq	%rbp
   58b06:      	retq
   58b07:      	leaq	-0x41f6b(%rip), %rdi    # 0x16ba3 <anon.a439bd52d16495f5d747355f1db65386.5.llvm.18001447223344409526>
   58b0e:      	leaq	0x6d613(%rip), %rcx     # 0xc6128 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526>
   58b15:      	movl	$0x237, %esi            # imm = 0x237
   58b1a:      	xorl	%edx, %edx
   58b1c:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   58b21:      	leaq	-0x41b86(%rip), %rdi    # 0x16fa2 <anon.08fe1e1e6efec708bade37899f950c1e.0.llvm.12593199014745301125>
   58b28:      	leaq	0x6d7c1(%rip), %rcx     # 0xc62f0 <anon.08fe1e1e6efec708bade37899f950c1e.2.llvm.12593199014745301125>
   58b2f:      	movl	$0x193, %esi            # imm = 0x193
   58b34:      	xorl	%edx, %edx
   58b36:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   58b3b:      	leaq	-0x49a0a(%rip), %rdx    # 0xf138 <anon.a8d4cb48e80d1537384fa053ec1399dc.1.llvm.3836435584527032447>
   58b42:      	leaq	0x6d777(%rip), %r9      # 0xc62c0 <anon.a8d4cb48e80d1537384fa053ec1399dc.2.llvm.3836435584527032447>
   58b49:      	leaq	-0x230(%rbp), %rsi
   58b50:      	xorl	%edi, %edi
   58b52:      	xorl	%ecx, %ecx
   58b54:      	callq	0xba687 <core::panicking::assert_failed::<usize, usize>>
   58b59:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   58b5e:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   58b63:      	int3
   58b64:      	int3
   58b65:      	int3
   58b66:      	int3
   58b67:      	int3
   58b68:      	int3
   58b69:      	int3
   58b6a:      	int3
   58b6b:      	int3
   58b6c:      	int3
   58b6d:      	int3
   58b6e:      	int3
   58b6f:      	int3

0000000000058b70 <<toyos_crypto::mlkem::Poly>::decode::<4>>:
   58b70:      	pushq	%rbp
   58b71:      	movq	%rsp, %rbp
   58b74:      	pushq	%r15
   58b76:      	pushq	%r14
   58b78:      	pushq	%rbx
   58b79:      	subq	$0x218, %rsp            # imm = 0x218
   58b80:      	movq	%rdx, -0x230(%rbp)
   58b87:      	cmpq	$0x80, %rdx
   58b8e:      	jne	0x58d0c <<toyos_crypto::mlkem::Poly>::decode::<4>+0x19c>
   58b94:      	movq	%rsi, %r14
   58b97:      	movq	%rdi, %rbx
   58b9a:      	leaq	-0x230(%rbp), %r15
   58ba1:      	movl	$0x200, %edx            # imm = 0x200
   58ba6:      	movq	%r15, %rdi
   58ba9:      	xorl	%esi, %esi
   58bab:      	callq	0xc49a0 <memset>
   58bb0:      	leaq	-0x30(%rbp), %rdi
   58bb4:      	movq	%r15, %rsi
   58bb7:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   58bbc:      	testb	%al, %al
   58bbe:      	je	0x58cf2 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x182>
   58bc4:      	leaq	0x80(%r14), %rdi
   58bcb:      	movq	%r14, %rsi
   58bce:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   58bd3:      	testb	%al, %al
   58bd5:      	je	0x58cf2 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x182>
   58bdb:      	leaq	-0x30(%rbp), %rax
   58bdf:      	movq	%r14, %rcx
   58be2:      	subq	%rax, %rcx
   58be5:      	movq	%rax, %rdx
   58be8:      	subq	%r14, %rdx
   58beb:      	xorl	%esi, %esi
   58bed:      	xorps	%xmm0, %xmm0
   58bf0:      	leaq	(%r14,%rsi), %rdi
   58bf4:      	movaps	%xmm0, -0x30(%rbp)
   58bf8:      	leaq	(%rcx,%rsi), %r8
   58bfc:      	cmpq	%rax, %rdi
   58bff:      	cmovbq	%rdx, %r8
   58c03:      	cmpq	$0x3, %r8
   58c07:      	jbe	0x58cd8 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x168>
   58c0d:      	movl	(%rdi), %edi
   58c0f:      	movl	%edi, -0x30(%rbp)
   58c12:      	movzwl	%di, %r8d
   58c16:      	movl	%edi, %r9d
   58c19:      	andl	$0xf, %r9d
   58c1d:      	movw	%r9w, -0x230(%rbp,%rsi,4)
   58c26:      	movl	%edi, %r9d
   58c29:      	shrl	$0x4, %r9d
   58c2d:      	andl	$0xf, %r9d
   58c31:      	movw	%r9w, -0x22e(%rbp,%rsi,4)
   58c3a:      	movl	%edi, %r9d
   58c3d:      	shrl	$0x8, %r9d
   58c41:      	andl	$0xf, %r9d
   58c45:      	movw	%r9w, -0x22c(%rbp,%rsi,4)
   58c4e:      	shrl	$0xc, %r8d
   58c52:      	movw	%r8w, -0x22a(%rbp,%rsi,4)
   58c5b:      	movzwl	-0x2e(%rbp), %r8d
   58c60:      	andl	$0xf, %r8d
   58c64:      	movw	%r8w, -0x228(%rbp,%rsi,4)
   58c6d:      	movl	%edi, %r8d
   58c70:      	shrl	$0x14, %r8d
   58c74:      	andl	$0xf, %r8d
   58c78:      	movw	%r8w, -0x226(%rbp,%rsi,4)
   58c81:      	movzwl	-0x2d(%rbp), %r8d
   58c86:      	andl	$0xf, %r8d
   58c8a:      	movw	%r8w, -0x224(%rbp,%rsi,4)
   58c93:      	shrl	$0x1c, %edi
   58c96:      	movw	%di, -0x222(%rbp,%rsi,4)
   58c9e:      	addq	$0x4, %rsi
   58ca2:      	addq	$-0x4, %rdx
   58ca6:      	cmpq	$0x80, %rsi
   58cad:      	jne	0x58bf0 <<toyos_crypto::mlkem::Poly>::decode::<4>+0x80>
   58cb3:      	leaq	-0x230(%rbp), %rsi
   58cba:      	movl	$0x200, %edx            # imm = 0x200
   58cbf:      	movq	%rbx, %rdi
   58cc2:      	callq	0xc4250 <memcpy>
   58cc7:      	movq	%rbx, %rax
   58cca:      	addq	$0x218, %rsp            # imm = 0x218
   58cd1:      	popq	%rbx
   58cd2:      	popq	%r14
   58cd4:      	popq	%r15
   58cd6:      	popq	%rbp
   58cd7:      	retq
   58cd8:      	leaq	-0x4213c(%rip), %rdi    # 0x16ba3 <anon.a439bd52d16495f5d747355f1db65386.5.llvm.18001447223344409526>
   58cdf:      	leaq	0x6d442(%rip), %rcx     # 0xc6128 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526>
   58ce6:      	movl	$0x237, %esi            # imm = 0x237
   58ceb:      	xorl	%edx, %edx
   58ced:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   58cf2:      	leaq	-0x41d57(%rip), %rdi    # 0x16fa2 <anon.08fe1e1e6efec708bade37899f950c1e.0.llvm.12593199014745301125>
   58cf9:      	leaq	0x6d5f0(%rip), %rcx     # 0xc62f0 <anon.08fe1e1e6efec708bade37899f950c1e.2.llvm.12593199014745301125>
   58d00:      	movl	$0x193, %esi            # imm = 0x193
   58d05:      	xorl	%edx, %edx
   58d07:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   58d0c:      	leaq	-0x49b6b(%rip), %rdx    # 0xf1a8 <anon.a8d4cb48e80d1537384fa053ec1399dc.4.llvm.3836435584527032447>
   58d13:      	leaq	0x6d5a6(%rip), %r9      # 0xc62c0 <anon.a8d4cb48e80d1537384fa053ec1399dc.2.llvm.3836435584527032447>
   58d1a:      	leaq	-0x230(%rbp), %rsi
   58d21:      	xorl	%edi, %edi
   58d23:      	xorl	%ecx, %ecx
   58d25:      	callq	0xba687 <core::panicking::assert_failed::<usize, usize>>
   58d2a:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   58d2f:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   58d34:      	int3
   58d35:      	int3
   58d36:      	int3
   58d37:      	int3
   58d38:      	int3
   58d39:      	int3
   58d3a:      	int3
   58d3b:      	int3
   58d3c:      	int3
   58d3d:      	int3
   58d3e:      	int3
   58d3f:      	int3

0000000000058d40 <<toyos_crypto::mlkem::Poly>::decode::<10>>:
   58d40:      	pushq	%rbp
   58d41:      	movq	%rsp, %rbp
   58d44:      	pushq	%r15
   58d46:      	pushq	%r14
   58d48:      	pushq	%rbx
   58d49:      	subq	$0x218, %rsp            # imm = 0x218
   58d50:      	movq	%rdx, -0x230(%rbp)
   58d57:      	cmpq	$0x140, %rdx            # imm = 0x140
   58d5e:      	jne	0x58f24 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1e4>
   58d64:      	movq	%rsi, %r14
   58d67:      	movq	%rdi, %rbx
   58d6a:      	leaq	-0x230(%rbp), %r15
   58d71:      	movl	$0x200, %edx            # imm = 0x200
   58d76:      	movq	%r15, %rdi
   58d79:      	xorl	%esi, %esi
   58d7b:      	callq	0xc49a0 <memset>
   58d80:      	leaq	-0x30(%rbp), %rdi
   58d84:      	movq	%r15, %rsi
   58d87:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   58d8c:      	testb	%al, %al
   58d8e:      	je	0x58f0a <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1ca>
   58d94:      	leaq	0x140(%r14), %rdi
   58d9b:      	movq	%r14, %rsi
   58d9e:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   58da3:      	testb	%al, %al
   58da5:      	je	0x58f0a <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1ca>
   58dab:      	leaq	-0x30(%rbp), %rax
   58daf:      	movq	%r14, %rcx
   58db2:      	subq	%rax, %rcx
   58db5:      	movq	%rax, %rdx
   58db8:      	subq	%r14, %rdx
   58dbb:      	movl	$0xe, %esi
   58dc0:      	xorps	%xmm0, %xmm0
   58dc3:      	nopw	%cs:(%rax,%rax)
   58dd0:      	movaps	%xmm0, -0x30(%rbp)
   58dd4:      	cmpq	%rax, %r14
   58dd7:      	movq	%rcx, %rdi
   58dda:      	cmovbq	%rdx, %rdi
   58dde:      	cmpq	$0x9, %rdi
   58de2:      	jbe	0x58ef0 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x1b0>
   58de8:      	movzwl	0x8(%r14), %edi
   58ded:      	movw	%di, -0x28(%rbp)
   58df1:      	movq	(%r14), %r8
   58df4:      	movq	%r8, -0x30(%rbp)
   58df8:      	movl	-0x28(%rbp), %edi
   58dfb:      	movl	%r8d, %r9d
   58dfe:      	andl	$0x3ff, %r9d            # imm = 0x3FF
   58e05:      	movw	%r9w, -0x23e(%rbp,%rsi)
   58e0e:      	movl	%r8d, %r9d
   58e11:      	shrl	$0xa, %r9d
   58e15:      	andl	$0x3ff, %r9d            # imm = 0x3FF
   58e1c:      	movw	%r9w, -0x23c(%rbp,%rsi)
   58e25:      	movl	%r8d, %r9d
   58e28:      	shrl	$0x14, %r9d
   58e2c:      	andl	$0x3ff, %r9d            # imm = 0x3FF
   58e33:      	movw	%r9w, -0x23a(%rbp,%rsi)
   58e3c:      	movq	%r8, %r9
   58e3f:      	shrq	$0x1e, %r9
   58e43:      	andl	$0x3ff, %r9d            # imm = 0x3FF
   58e4a:      	movw	%r9w, -0x238(%rbp,%rsi)
   58e53:      	movzwl	-0x2b(%rbp), %r9d
   58e58:      	andl	$0x3ff, %r9d            # imm = 0x3FF
   58e5f:      	movw	%r9w, -0x236(%rbp,%rsi)
   58e68:      	movq	%r8, %r9
   58e6b:      	shrq	$0x32, %r9
   58e6f:      	andl	$0x3ff, %r9d            # imm = 0x3FF
   58e76:      	movw	%r9w, -0x234(%rbp,%rsi)
   58e7f:      	shrq	$0x3c, %r8
   58e83:      	movl	%edi, %r9d
   58e86:      	shll	$0x4, %r9d
   58e8a:      	orl	%r8d, %r9d
   58e8d:      	andl	$0x3ff, %r9d            # imm = 0x3FF
   58e94:      	movw	%r9w, -0x232(%rbp,%rsi)
   58e9d:      	shrl	$0x6, %edi
   58ea0:      	andl	$0x3ff, %edi            # imm = 0x3FF
   58ea6:      	movw	%di, -0x230(%rbp,%rsi)
   58eae:      	addq	$0x10, %rsi
   58eb2:      	addq	$0xa, %r14
   58eb6:      	addq	$0xa, %rcx
   58eba:      	addq	$-0xa, %rdx
   58ebe:      	cmpq	$0x20e, %rsi            # imm = 0x20E
   58ec5:      	jne	0x58dd0 <<toyos_crypto::mlkem::Poly>::decode::<10>+0x90>
   58ecb:      	leaq	-0x230(%rbp), %rsi
   58ed2:      	movl	$0x200, %edx            # imm = 0x200
   58ed7:      	movq	%rbx, %rdi
   58eda:      	callq	0xc4250 <memcpy>
   58edf:      	movq	%rbx, %rax
   58ee2:      	addq	$0x218, %rsp            # imm = 0x218
   58ee9:      	popq	%rbx
   58eea:      	popq	%r14
   58eec:      	popq	%r15
   58eee:      	popq	%rbp
   58eef:      	retq
   58ef0:      	leaq	-0x42354(%rip), %rdi    # 0x16ba3 <anon.a439bd52d16495f5d747355f1db65386.5.llvm.18001447223344409526>
   58ef7:      	leaq	0x6d22a(%rip), %rcx     # 0xc6128 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526>
   58efe:      	movl	$0x237, %esi            # imm = 0x237
   58f03:      	xorl	%edx, %edx
   58f05:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   58f0a:      	leaq	-0x41f6f(%rip), %rdi    # 0x16fa2 <anon.08fe1e1e6efec708bade37899f950c1e.0.llvm.12593199014745301125>
   58f11:      	leaq	0x6d3d8(%rip), %rcx     # 0xc62f0 <anon.08fe1e1e6efec708bade37899f950c1e.2.llvm.12593199014745301125>
   58f18:      	movl	$0x193, %esi            # imm = 0x193
   58f1d:      	xorl	%edx, %edx
   58f1f:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   58f24:      	leaq	-0x49dd3(%rip), %rdx    # 0xf158 <anon.a8d4cb48e80d1537384fa053ec1399dc.5.llvm.3836435584527032447>
   58f2b:      	leaq	0x6d38e(%rip), %r9      # 0xc62c0 <anon.a8d4cb48e80d1537384fa053ec1399dc.2.llvm.3836435584527032447>
   58f32:      	leaq	-0x230(%rbp), %rsi
   58f39:      	xorl	%edi, %edi
   58f3b:      	xorl	%ecx, %ecx
   58f3d:      	callq	0xba687 <core::panicking::assert_failed::<usize, usize>>
   58f42:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   58f47:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   58f4c:      	int3
   58f4d:      	int3
   58f4e:      	int3
   58f4f:      	int3

0000000000058f50 <<toyos_crypto::mlkem::Poly>::decode::<12>>:
   58f50:      	pushq	%rbp
   58f51:      	movq	%rsp, %rbp
   58f54:      	pushq	%r15
   58f56:      	pushq	%r14
   58f58:      	pushq	%rbx
   58f59:      	subq	$0x218, %rsp            # imm = 0x218
   58f60:      	movq	%rdx, -0x230(%rbp)
   58f67:      	cmpq	$0x180, %rdx            # imm = 0x180
   58f6e:      	jne	0x59125 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1d5>
   58f74:      	movq	%rsi, %r14
   58f77:      	movq	%rdi, %rbx
   58f7a:      	leaq	-0x230(%rbp), %r15
   58f81:      	movl	$0x200, %edx            # imm = 0x200
   58f86:      	movq	%r15, %rdi
   58f89:      	xorl	%esi, %esi
   58f8b:      	callq	0xc49a0 <memset>
   58f90:      	leaq	-0x30(%rbp), %rdi
   58f94:      	movq	%r15, %rsi
   58f97:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   58f9c:      	testb	%al, %al
   58f9e:      	je	0x5910b <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1bb>
   58fa4:      	leaq	0x180(%r14), %rdi
   58fab:      	movq	%r14, %rsi
   58fae:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   58fb3:      	testb	%al, %al
   58fb5:      	je	0x5910b <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1bb>
   58fbb:      	leaq	-0x30(%rbp), %rax
   58fbf:      	movq	%r14, %rcx
   58fc2:      	subq	%rax, %rcx
   58fc5:      	movq	%rax, %rdx
   58fc8:      	subq	%r14, %rdx
   58fcb:      	movl	$0xe, %esi
   58fd0:      	xorps	%xmm0, %xmm0
   58fd3:      	nopw	%cs:(%rax,%rax)
   58fe0:      	movaps	%xmm0, -0x30(%rbp)
   58fe4:      	cmpq	%rax, %r14
   58fe7:      	movq	%rcx, %rdi
   58fea:      	cmovbq	%rdx, %rdi
   58fee:      	cmpq	$0xb, %rdi
   58ff2:      	jbe	0x590f1 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x1a1>
   58ff8:      	movq	(%r14), %r8
   58ffb:      	movq	%r8, -0x30(%rbp)
   58fff:      	movl	0x8(%r14), %edi
   59003:      	movl	%edi, -0x28(%rbp)
   59006:      	movl	%r8d, %r9d
   59009:      	andl	$0xfff, %r9d            # imm = 0xFFF
   59010:      	movw	%r9w, -0x23e(%rbp,%rsi)
   59019:      	movl	%r8d, %r9d
   5901c:      	shrl	$0xc, %r9d
   59020:      	andl	$0xfff, %r9d            # imm = 0xFFF
   59027:      	movw	%r9w, -0x23c(%rbp,%rsi)
   59030:      	movzwl	-0x2d(%rbp), %r9d
   59035:      	andl	$0xfff, %r9d            # imm = 0xFFF
   5903c:      	movw	%r9w, -0x23a(%rbp,%rsi)
   59045:      	movq	%r8, %r9
   59048:      	shrq	$0x24, %r9
   5904c:      	andl	$0xfff, %r9d            # imm = 0xFFF
   59053:      	movw	%r9w, -0x238(%rbp,%rsi)
   5905c:      	movzwl	-0x2a(%rbp), %r9d
   59061:      	andl	$0xfff, %r9d            # imm = 0xFFF
   59068:      	movw	%r9w, -0x236(%rbp,%rsi)
   59071:      	movl	%edi, %r9d
   59074:      	shll	$0x4, %r9d
   59078:      	shrq	$0x3c, %r8
   5907c:      	orl	%r9d, %r8d
   5907f:      	andl	$0xfff, %r8d            # imm = 0xFFF
   59086:      	movw	%r8w, -0x234(%rbp,%rsi)
   5908f:      	movzwl	-0x27(%rbp), %r8d
   59094:      	andl	$0xfff, %r8d            # imm = 0xFFF
   5909b:      	movw	%r8w, -0x232(%rbp,%rsi)
   590a4:      	shrl	$0x14, %edi
   590a7:      	movw	%di, -0x230(%rbp,%rsi)
   590af:      	addq	$0x10, %rsi
   590b3:      	addq	$0xc, %r14
   590b7:      	addq	$0xc, %rcx
   590bb:      	addq	$-0xc, %rdx
   590bf:      	cmpq	$0x20e, %rsi            # imm = 0x20E
   590c6:      	jne	0x58fe0 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x90>
   590cc:      	leaq	-0x230(%rbp), %rsi
   590d3:      	movl	$0x200, %edx            # imm = 0x200
   590d8:      	movq	%rbx, %rdi
   590db:      	callq	0xc4250 <memcpy>
   590e0:      	movq	%rbx, %rax
   590e3:      	addq	$0x218, %rsp            # imm = 0x218
   590ea:      	popq	%rbx
   590eb:      	popq	%r14
   590ed:      	popq	%r15
   590ef:      	popq	%rbp
   590f0:      	retq
   590f1:      	leaq	-0x42555(%rip), %rdi    # 0x16ba3 <anon.a439bd52d16495f5d747355f1db65386.5.llvm.18001447223344409526>
   590f8:      	leaq	0x6d029(%rip), %rcx     # 0xc6128 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526>
   590ff:      	movl	$0x237, %esi            # imm = 0x237
   59104:      	xorl	%edx, %edx
   59106:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   5910b:      	leaq	-0x42170(%rip), %rdi    # 0x16fa2 <anon.08fe1e1e6efec708bade37899f950c1e.0.llvm.12593199014745301125>
   59112:      	leaq	0x6d1d7(%rip), %rcx     # 0xc62f0 <anon.08fe1e1e6efec708bade37899f950c1e.2.llvm.12593199014745301125>
   59119:      	movl	$0x193, %esi            # imm = 0x193
   5911e:      	xorl	%edx, %edx
   59120:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   59125:      	leaq	-0x49fac(%rip), %rdx    # 0xf180 <anon.a8d4cb48e80d1537384fa053ec1399dc.6.llvm.3836435584527032447>
   5912c:      	leaq	0x6d18d(%rip), %r9      # 0xc62c0 <anon.a8d4cb48e80d1537384fa053ec1399dc.2.llvm.3836435584527032447>
   59133:      	leaq	-0x230(%rbp), %rsi
   5913a:      	xorl	%edi, %edi
   5913c:      	xorl	%ecx, %ecx
   5913e:      	callq	0xba687 <core::panicking::assert_failed::<usize, usize>>
   59143:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   59148:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   5914d:      	int3
   5914e:      	int3
   5914f:      	int3

0000000000059150 <<toyos_crypto::mlkem::Poly>::encode::<1>>:
   59150:      	pushq	%rbp
   59151:      	movq	%rsp, %rbp
   59154:      	pushq	%r14
   59156:      	pushq	%rbx
   59157:      	subq	$0x10, %rsp
   5915b:      	movq	%rdx, -0x20(%rbp)
   5915f:      	cmpq	$0x20, %rdx
   59163:      	jne	0x59282 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x132>
   59169:      	movq	%rsi, %rbx
   5916c:      	movq	%rdi, %r14
   5916f:      	addq	$0x200, %rdi            # imm = 0x200
   59176:      	movq	%r14, %rsi
   59179:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   5917e:      	testb	%al, %al
   59180:      	je	0x59268 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x118>
   59186:      	leaq	0x20(%rbx), %rdi
   5918a:      	movq	%rbx, %rsi
   5918d:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   59192:      	testb	%al, %al
   59194:      	je	0x59268 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x118>
   5919a:      	leaq	-0x20(%rbp), %rax
   5919e:      	movq	%rax, %rcx
   591a1:      	subq	%rbx, %rcx
   591a4:      	movq	%rbx, %rdx
   591a7:      	subq	%rax, %rdx
   591aa:      	xorl	%esi, %esi
   591ac:      	nopl	(%rax)
   591b0:      	movzwl	0xa(%r14,%rsi), %edi
   591b6:      	shll	$0x5, %edi
   591b9:      	movzwl	0x8(%r14,%rsi), %r8d
   591bf:      	shll	$0x4, %r8d
   591c3:      	orl	%edi, %r8d
   591c6:      	movzwl	0x6(%r14,%rsi), %r9d
   591cc:      	shll	$0x3, %r9d
   591d0:      	movzwl	0x4(%r14,%rsi), %edi
   591d6:      	shll	$0x2, %edi
   591d9:      	orl	%r9d, %edi
   591dc:      	orl	%r8d, %edi
   591df:      	movzwl	0x2(%r14,%rsi), %r8d
   591e5:      	addl	%r8d, %r8d
   591e8:      	movzwl	(%r14,%rsi), %r9d
   591ed:      	orq	%r8, %r9
   591f0:      	movzwl	0xc(%r14,%rsi), %r8d
   591f6:      	shll	$0x6, %r8d
   591fa:      	orq	%r9, %r8
   591fd:      	movzwl	0xe(%r14,%rsi), %r9d
   59203:      	shll	$0x7, %r9d
   59207:      	orq	%r8, %rdi
   5920a:      	orq	%r9, %rdi
   5920d:      	movq	%rdi, -0x20(%rbp)
   59211:      	movq	$0x0, -0x18(%rbp)
   59219:      	cmpq	%rbx, %rax
   5921c:      	movq	%rcx, %r8
   5921f:      	cmovbq	%rdx, %r8
   59223:      	testq	%r8, %r8
   59226:      	je	0x5924e <<toyos_crypto::mlkem::Poly>::encode::<1>+0xfe>
   59228:      	movb	%dil, (%rbx)
   5922b:      	addq	$0x10, %rsi
   5922f:      	incq	%rbx
   59232:      	decq	%rcx
   59235:      	incq	%rdx
   59238:      	cmpq	$0x200, %rsi            # imm = 0x200
   5923f:      	jne	0x591b0 <<toyos_crypto::mlkem::Poly>::encode::<1>+0x60>
   59245:      	addq	$0x10, %rsp
   59249:      	popq	%rbx
   5924a:      	popq	%r14
   5924c:      	popq	%rbp
   5924d:      	retq
   5924e:      	leaq	-0x426b2(%rip), %rdi    # 0x16ba3 <anon.a439bd52d16495f5d747355f1db65386.5.llvm.18001447223344409526>
   59255:      	leaq	0x6cecc(%rip), %rcx     # 0xc6128 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526>
   5925c:      	movl	$0x237, %esi            # imm = 0x237
   59261:      	xorl	%edx, %edx
   59263:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   59268:      	leaq	-0x422cd(%rip), %rdi    # 0x16fa2 <anon.08fe1e1e6efec708bade37899f950c1e.0.llvm.12593199014745301125>
   5926f:      	leaq	0x6d07a(%rip), %rcx     # 0xc62f0 <anon.08fe1e1e6efec708bade37899f950c1e.2.llvm.12593199014745301125>
   59276:      	movl	$0x193, %esi            # imm = 0x193
   5927b:      	xorl	%edx, %edx
   5927d:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   59282:      	leaq	-0x4a151(%rip), %rdx    # 0xf138 <anon.a8d4cb48e80d1537384fa053ec1399dc.1.llvm.3836435584527032447>
   59289:      	leaq	0x6d048(%rip), %r9      # 0xc62d8 <anon.a8d4cb48e80d1537384fa053ec1399dc.7.llvm.3836435584527032447>
   59290:      	leaq	-0x20(%rbp), %rsi
   59294:      	xorl	%edi, %edi
   59296:      	xorl	%ecx, %ecx
   59298:      	callq	0xba687 <core::panicking::assert_failed::<usize, usize>>
   5929d:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   592a2:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   592a7:      	int3
   592a8:      	int3
   592a9:      	int3
   592aa:      	int3
   592ab:      	int3
   592ac:      	int3
   592ad:      	int3
   592ae:      	int3
   592af:      	int3

00000000000592b0 <<toyos_crypto::mlkem::Poly>::encode::<4>>:
   592b0:      	pushq	%rbp
   592b1:      	movq	%rsp, %rbp
   592b4:      	pushq	%r14
   592b6:      	pushq	%rbx
   592b7:      	subq	$0x10, %rsp
   592bb:      	movq	%rdx, -0x20(%rbp)
   592bf:      	cmpq	$0x80, %rdx
   592c6:      	jne	0x593f6 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x146>
   592cc:      	movq	%rsi, %rbx
   592cf:      	movq	%rdi, %r14
   592d2:      	addq	$0x200, %rdi            # imm = 0x200
   592d9:      	movq	%r14, %rsi
   592dc:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   592e1:      	testb	%al, %al
   592e3:      	je	0x593dc <<toyos_crypto::mlkem::Poly>::encode::<4>+0x12c>
   592e9:      	leaq	0x80(%rbx), %rdi
   592f0:      	movq	%rbx, %rsi
   592f3:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   592f8:      	testb	%al, %al
   592fa:      	je	0x593dc <<toyos_crypto::mlkem::Poly>::encode::<4>+0x12c>
   59300:      	leaq	-0x20(%rbp), %rax
   59304:      	movq	%rax, %rcx
   59307:      	subq	%rbx, %rcx
   5930a:      	movq	%rbx, %rdx
   5930d:      	subq	%rax, %rdx
   59310:      	xorl	%esi, %esi
   59312:      	nopw	%cs:(%rax,%rax)
   59320:      	leaq	(%rbx,%rsi), %rdi
   59324:      	movzwl	(%r14,%rsi,4), %r8d
   59329:      	movzwl	0x2(%r14,%rsi,4), %r9d
   5932f:      	shll	$0x4, %r9d
   59333:      	orq	%r8, %r9
   59336:      	movzwl	0x4(%r14,%rsi,4), %r8d
   5933c:      	shll	$0x8, %r8d
   59340:      	movzwl	0x6(%r14,%rsi,4), %r10d
   59346:      	shll	$0xc, %r10d
   5934a:      	orq	%r8, %r10
   5934d:      	orq	%r9, %r10
   59350:      	movzwl	0x8(%r14,%rsi,4), %r8d
   59356:      	shll	$0x10, %r8d
   5935a:      	movzwl	0xa(%r14,%rsi,4), %r9d
   59360:      	shlq	$0x14, %r9
   59364:      	orq	%r8, %r9
   59367:      	movzwl	0xc(%r14,%rsi,4), %r11d
   5936d:      	shlq	$0x18, %r11
   59371:      	orq	%r9, %r11
   59374:      	orq	%r10, %r11
   59377:      	movzwl	0xe(%r14,%rsi,4), %r8d
   5937d:      	shlq	$0x1c, %r8
   59381:      	orq	%r11, %r8
   59384:      	movq	%r8, -0x20(%rbp)
   59388:      	movq	$0x0, -0x18(%rbp)
   59390:      	leaq	(%rdx,%rsi), %r9
   59394:      	cmpq	%rdi, %rax
   59397:      	cmovaeq	%rcx, %r9
   5939b:      	cmpq	$0x3, %r9
   5939f:      	jbe	0x593c2 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x112>
   593a1:      	movl	%r8d, (%rdi)
   593a4:      	addq	$0x4, %rsi
   593a8:      	addq	$-0x4, %rcx
   593ac:      	cmpq	$0x80, %rsi
   593b3:      	jne	0x59320 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x70>
   593b9:      	addq	$0x10, %rsp
   593bd:      	popq	%rbx
   593be:      	popq	%r14
   593c0:      	popq	%rbp
   593c1:      	retq
   593c2:      	leaq	-0x42826(%rip), %rdi    # 0x16ba3 <anon.a439bd52d16495f5d747355f1db65386.5.llvm.18001447223344409526>
   593c9:      	leaq	0x6cd58(%rip), %rcx     # 0xc6128 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526>
   593d0:      	movl	$0x237, %esi            # imm = 0x237
   593d5:      	xorl	%edx, %edx
   593d7:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   593dc:      	leaq	-0x42441(%rip), %rdi    # 0x16fa2 <anon.08fe1e1e6efec708bade37899f950c1e.0.llvm.12593199014745301125>
   593e3:      	leaq	0x6cf06(%rip), %rcx     # 0xc62f0 <anon.08fe1e1e6efec708bade37899f950c1e.2.llvm.12593199014745301125>
   593ea:      	movl	$0x193, %esi            # imm = 0x193
   593ef:      	xorl	%edx, %edx
   593f1:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   593f6:      	leaq	-0x4a255(%rip), %rdx    # 0xf1a8 <anon.a8d4cb48e80d1537384fa053ec1399dc.4.llvm.3836435584527032447>
   593fd:      	leaq	0x6ced4(%rip), %r9      # 0xc62d8 <anon.a8d4cb48e80d1537384fa053ec1399dc.7.llvm.3836435584527032447>
   59404:      	leaq	-0x20(%rbp), %rsi
   59408:      	xorl	%edi, %edi
   5940a:      	xorl	%ecx, %ecx
   5940c:      	callq	0xba687 <core::panicking::assert_failed::<usize, usize>>
   59411:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   59416:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   5941b:      	int3
   5941c:      	int3
   5941d:      	int3
   5941e:      	int3
   5941f:      	int3

0000000000059420 <<toyos_crypto::mlkem::Poly>::encode::<10>>:
   59420:      	pushq	%rbp
   59421:      	movq	%rsp, %rbp
   59424:      	pushq	%r14
   59426:      	pushq	%rbx
   59427:      	subq	$0x10, %rsp
   5942b:      	movq	%rdx, -0x20(%rbp)
   5942f:      	cmpq	$0x140, %rdx            # imm = 0x140
   59436:      	jne	0x59581 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x161>
   5943c:      	movq	%rsi, %rbx
   5943f:      	movq	%rdi, %r14
   59442:      	addq	$0x200, %rdi            # imm = 0x200
   59449:      	movq	%r14, %rsi
   5944c:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   59451:      	testb	%al, %al
   59453:      	je	0x59567 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x147>
   59459:      	leaq	0x140(%rbx), %rdi
   59460:      	movq	%rbx, %rsi
   59463:      	callq	0xc2010 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   59468:      	testb	%al, %al
   5946a:      	je	0x59567 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x147>
   59470:      	leaq	-0x20(%rbp), %rax
   59474:      	movq	%rax, %rcx
   59477:      	subq	%rbx, %rcx
   5947a:      	movq	%rbx, %rdx
   5947d:      	subq	%rax, %rdx
   59480:      	xorl	%esi, %esi
   59482:      	nopw	%cs:(%rax,%rax)
   59490:      	movzwl	(%r14,%rsi), %edi
   59495:      	movzwl	0x2(%r14,%rsi), %r8d
   5949b:      	shll	$0xa, %r8d
   5949f:      	orq	%rdi, %r8
   594a2:      	movzwl	0x4(%r14,%rsi), %r9d
   594a8:      	shlq	$0x14, %r9
   594ac:      	movzwl	0x6(%r14,%rsi), %edi
   594b2:      	shlq	$0x1e, %rdi
   594b6:      	orq	%r9, %rdi
   594b9:      	orq	%r8, %rdi
   594bc:      	movzwl	0x8(%r14,%rsi), %r8d
   594c2:      	shlq	$0x28, %r8
   594c6:      	movzwl	0xa(%r14,%rsi), %r9d
   594cc:      	movl	%r9d, %r10d
   594cf:      	shrl	$0xe, %r10d
   594d3:      	shlq	$0x32, %r9
   594d7:      	orq	%r8, %r9
   594da:      	movzwl	0xc(%r14,%rsi), %r8d
   594e0:      	movl	%r8d, %r11d
   594e3:      	shrl	$0x4, %r11d
   594e7:      	orl	%r10d, %r11d
   594ea:      	shlq	$0x3c, %r8
   594ee:      	orq	%r9, %r8
   594f1:      	orq	%rdi, %r8
   594f4:      	movzwl	0xe(%r14,%rsi), %edi
   594fa:      	shll	$0x6, %edi
   594fd:      	orl	%r11d, %edi
   59500:      	movq	%rdi, -0x18(%rbp)
   59504:      	movq	%r8, -0x20(%rbp)
   59508:      	cmpq	%rbx, %rax
   5950b:      	movq	%rcx, %rdi
   5950e:      	cmovbq	%rdx, %rdi
   59512:      	cmpq	$0x9, %rdi
   59516:      	jbe	0x5954d <<toyos_crypto::mlkem::Poly>::encode::<10>+0x12d>
   59518:      	movzwl	-0x18(%rbp), %edi
   5951c:      	movw	%di, 0x8(%rbx)
   59520:      	movq	-0x20(%rbp), %rdi
   59524:      	movq	%rdi, (%rbx)
   59527:      	addq	$0x10, %rsi
   5952b:      	addq	$0xa, %rbx
   5952f:      	addq	$-0xa, %rcx
   59533:      	addq	$0xa, %rdx
   59537:      	cmpq	$0x200, %rsi            # imm = 0x200
   5953e:      	jne	0x59490 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x70>
   59544:      	addq	$0x10, %rsp
   59548:      	popq	%rbx
   59549:      	popq	%r14
   5954b:      	popq	%rbp
   5954c:      	retq
   5954d:      	leaq	-0x429b1(%rip), %rdi    # 0x16ba3 <anon.a439bd52d16495f5d747355f1db65386.5.llvm.18001447223344409526>
   59554:      	leaq	0x6cbcd(%rip), %rcx     # 0xc6128 <anon.a439bd52d16495f5d747355f1db65386.1.llvm.18001447223344409526>
   5955b:      	movl	$0x237, %esi            # imm = 0x237
   59560:      	xorl	%edx, %edx
   59562:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   59567:      	leaq	-0x425cc(%rip), %rdi    # 0x16fa2 <anon.08fe1e1e6efec708bade37899f950c1e.0.llvm.12593199014745301125>
   5956e:      	leaq	0x6cd7b(%rip), %rcx     # 0xc62f0 <anon.08fe1e1e6efec708bade37899f950c1e.2.llvm.12593199014745301125>
   59575:      	movl	$0x193, %esi            # imm = 0x193
   5957a:      	xorl	%edx, %edx
   5957c:      	callq	0xbdb10 <core::panicking::panic_nounwind_fmt>
   59581:      	leaq	-0x4a430(%rip), %rdx    # 0xf158 <anon.a8d4cb48e80d1537384fa053ec1399dc.5.llvm.3836435584527032447>
   59588:      	leaq	0x6cd49(%rip), %r9      # 0xc62d8 <anon.a8d4cb48e80d1537384fa053ec1399dc.7.llvm.3836435584527032447>
   5958f:      	leaq	-0x20(%rbp), %rsi
   59593:      	xorl	%edi, %edi
   59595:      	xorl	%ecx, %ecx
   59597:      	callq	0xba687 <core::panicking::assert_failed::<usize, usize>>
   5959c:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   595a1:      	callq	0xbdc2f <core::panicking::panic_cannot_unwind>
   595a6:      	int3
   595a7:      	int3
   595a8:      	int3
   595a9:      	int3
   595aa:      	int3
   595ab:      	int3
   595ac:      	int3
   595ad:      	int3
   595ae:      	int3
   595af:      	int3

