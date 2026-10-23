0000000000031870 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#0}>::{closure#0}>>>::from_iter>:
   31870:      	pushq	%rbp
   31871:      	movq	%rsp, %rbp
   31874:      	pushq	%r15
   31876:      	pushq	%r14
   31878:      	pushq	%r13
   3187a:      	pushq	%r12
   3187c:      	pushq	%rbx
   3187d:      	subq	$0x68, %rsp
   31881:      	movq	%rsi, %r14
   31884:      	movq	%rdi, -0x50(%rbp)
   31888:      	movq	0x10(%rsi), %rsi
   3188c:      	movq	0x18(%r14), %rbx
   31890:      	xorl	%r13d, %r13d
   31893:      	movq	%rbx, %r15
   31896:      	subq	%rsi, %r15
   31899:      	cmovbq	%r13, %r15
   3189d:      	movl	$0xf22, %ecx            # imm = 0xF22
   318a2:      	movq	%r15, %rax
   318a5:      	mulq	%rcx
   318a8:      	movq	%rax, %r12
   318ab:      	jo	0x31989 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#0}>::{closure#0}>>>::from_iter+0x119>
   318b1:      	movq	%rsi, -0x30(%rbp)
   318b5:      	movl	$0x2, %esi
   318ba:      	movq	%r12, %rdi
   318bd:      	callq	0xbc970 <<core::alloc::layout::Layout>::is_size_alignment_valid>
   318c2:      	testb	%al, %al
   318c4:      	je	0x31986 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#0}>::{closure#0}>>>::from_iter+0x116>
   318ca:      	testq	%r12, %r12
   318cd:      	je	0x318f5 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#0}>::{closure#0}>>>::from_iter+0x85>
   318cf:      	callq	0x4a3b0 <__rustc::__rust_no_alloc_shim_is_unstable_v2>
   318d4:      	movl	$0x2, %r13d
   318da:      	movl	$0x2, %esi
   318df:      	movq	%r12, %rdi
   318e2:      	callq	0x4a370 <__rustc::__rust_alloc>
   318e7:      	testq	%rax, %rax
   318ea:      	movq	-0x30(%rbp), %rdx
   318ee:      	jne	0x31903 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#0}>::{closure#0}>>>::from_iter+0x93>
   318f0:      	jmp	0x31989 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#0}>::{closure#0}>>>::from_iter+0x119>
   318f5:      	movl	$0x2, %eax
   318fa:      	movq	-0x30(%rbp), %rdx
   318fe:      	cmpq	%rdx, %rbx
   31901:      	ja	0x3196c <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#0}>::{closure#0}>>>::from_iter+0xfc>
   31903:      	movq	%r15, -0x48(%rbp)
   31907:      	movq	%rax, -0x40(%rbp)
   3190b:      	leaq	-0x38(%rbp), %rcx
   3190f:      	movq	$0x0, -0x38(%rbp)
   31917:      	movups	(%r14), %xmm0
   3191b:      	movaps	%xmm0, -0x90(%rbp)
   31922:      	movq	%rdx, -0x80(%rbp)
   31926:      	movq	%rbx, -0x78(%rbp)
   3192a:      	movq	%rcx, -0x68(%rbp)
   3192e:      	movq	$0x0, -0x60(%rbp)
   31936:      	movq	%rax, -0x58(%rbp)
   3193a:      	leaq	-0x90(%rbp), %rdi
   31941:      	leaq	-0x68(%rbp), %rsi
   31945:      	callq	0x36060 <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>>
   3194a:      	movq	-0x38(%rbp), %rcx
   3194e:      	movq	-0x50(%rbp), %rax
   31952:      	movq	%rcx, 0x10(%rax)
   31956:      	movups	-0x48(%rbp), %xmm0
   3195a:      	movups	%xmm0, (%rax)
   3195d:      	addq	$0x68, %rsp
   31961:      	popq	%rbx
   31962:      	popq	%r12
   31964:      	popq	%r13
   31966:      	popq	%r14
   31968:      	popq	%r15
   3196a:      	popq	%rbp
   3196b:      	retq
   3196c:      	leaq	-0x22b1b(%rip), %rdi    # 0xee58 <anon.a8fe1686bdbcefb2af0339a511ab2ed0.3.llvm.4390621744819913044>
   31973:      	leaq	0x95abe(%rip), %rcx     # 0xc7438 <anon.a8fe1686bdbcefb2af0339a511ab2ed0.2.llvm.4390621744819913044>
   3197a:      	movl	$0x1bb, %esi            # imm = 0x1BB
   3197f:      	xorl	%edx, %edx
   31981:      	callq	0xbf390 <core::panicking::panic_nounwind_fmt>
   31986:      	xorl	%r13d, %r13d
   31989:      	movq	%r13, %rdi
   3198c:      	movq	%r12, %rsi
   3198f:      	callq	0xbb992 <alloc::raw_vec::handle_error>
   31994:      	movq	%rax, %rbx
   31997:      	leaq	-0x48(%rbp), %rdi
   3199b:      	callq	0x356c0 <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>>
   319a0:      	movq	%rbx, %rdi
   319a3:      	callq	0xb9f20 <_Unwind_Resume>
   319a8:      	callq	0xbf33a <core::panicking::panic_in_cleanup>
   319ad:      	int3
   319ae:      	int3
   319af:      	int3

00000000000319b0 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#3}>::{closure#0}>>>::from_iter>:
   319b0:      	pushq	%rbp
   319b1:      	movq	%rsp, %rbp
   319b4:      	pushq	%r15
   319b6:      	pushq	%r14
   319b8:      	pushq	%r13
   319ba:      	pushq	%r12
   319bc:      	pushq	%rbx
   319bd:      	subq	$0x68, %rsp
   319c1:      	movq	%rsi, %r14
   319c4:      	movq	%rdi, -0x50(%rbp)
   319c8:      	movq	0x10(%rsi), %rsi
   319cc:      	movq	0x18(%r14), %rbx
   319d0:      	xorl	%r13d, %r13d
   319d3:      	movq	%rbx, %r15
   319d6:      	subq	%rsi, %r15
   319d9:      	cmovbq	%r13, %r15
   319dd:      	movl	$0xf22, %ecx            # imm = 0xF22
   319e2:      	movq	%r15, %rax
   319e5:      	mulq	%rcx
   319e8:      	movq	%rax, %r12
   319eb:      	jo	0x31ac9 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#3}>::{closure#0}>>>::from_iter+0x119>
   319f1:      	movq	%rsi, -0x30(%rbp)
   319f5:      	movl	$0x2, %esi
   319fa:      	movq	%r12, %rdi
   319fd:      	callq	0xbc970 <<core::alloc::layout::Layout>::is_size_alignment_valid>
   31a02:      	testb	%al, %al
   31a04:      	je	0x31ac6 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#3}>::{closure#0}>>>::from_iter+0x116>
   31a0a:      	testq	%r12, %r12
   31a0d:      	je	0x31a35 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#3}>::{closure#0}>>>::from_iter+0x85>
   31a0f:      	callq	0x4a3b0 <__rustc::__rust_no_alloc_shim_is_unstable_v2>
   31a14:      	movl	$0x2, %r13d
   31a1a:      	movl	$0x2, %esi
   31a1f:      	movq	%r12, %rdi
   31a22:      	callq	0x4a370 <__rustc::__rust_alloc>
   31a27:      	testq	%rax, %rax
   31a2a:      	movq	-0x30(%rbp), %rdx
   31a2e:      	jne	0x31a43 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#3}>::{closure#0}>>>::from_iter+0x93>
   31a30:      	jmp	0x31ac9 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#3}>::{closure#0}>>>::from_iter+0x119>
   31a35:      	movl	$0x2, %eax
   31a3a:      	movq	-0x30(%rbp), %rdx
   31a3e:      	cmpq	%rdx, %rbx
   31a41:      	ja	0x31aac <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#3}>::{closure#0}>>>::from_iter+0xfc>
   31a43:      	movq	%r15, -0x48(%rbp)
   31a47:      	movq	%rax, -0x40(%rbp)
   31a4b:      	leaq	-0x38(%rbp), %rcx
   31a4f:      	movq	$0x0, -0x38(%rbp)
   31a57:      	movups	(%r14), %xmm0
   31a5b:      	movaps	%xmm0, -0x90(%rbp)
   31a62:      	movq	%rdx, -0x80(%rbp)
   31a66:      	movq	%rbx, -0x78(%rbp)
   31a6a:      	movq	%rcx, -0x68(%rbp)
   31a6e:      	movq	$0x0, -0x60(%rbp)
   31a76:      	movq	%rax, -0x58(%rbp)
   31a7a:      	leaq	-0x90(%rbp), %rdi
   31a81:      	leaq	-0x68(%rbp), %rsi
   31a85:      	callq	0x36060 <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>>
   31a8a:      	movq	-0x38(%rbp), %rcx
   31a8e:      	movq	-0x50(%rbp), %rax
   31a92:      	movq	%rcx, 0x10(%rax)
   31a96:      	movups	-0x48(%rbp), %xmm0
   31a9a:      	movups	%xmm0, (%rax)
   31a9d:      	addq	$0x68, %rsp
   31aa1:      	popq	%rbx
   31aa2:      	popq	%r12
   31aa4:      	popq	%r13
   31aa6:      	popq	%r14
   31aa8:      	popq	%r15
   31aaa:      	popq	%rbp
   31aab:      	retq
   31aac:      	leaq	-0x22c5b(%rip), %rdi    # 0xee58 <anon.a8fe1686bdbcefb2af0339a511ab2ed0.3.llvm.4390621744819913044>
   31ab3:      	leaq	0x9597e(%rip), %rcx     # 0xc7438 <anon.a8fe1686bdbcefb2af0339a511ab2ed0.2.llvm.4390621744819913044>
   31aba:      	movl	$0x1bb, %esi            # imm = 0x1BB
   31abf:      	xorl	%edx, %edx
   31ac1:      	callq	0xbf390 <core::panicking::panic_nounwind_fmt>
   31ac6:      	xorl	%r13d, %r13d
   31ac9:      	movq	%r13, %rdi
   31acc:      	movq	%r12, %rsi
   31acf:      	callq	0xbb992 <alloc::raw_vec::handle_error>
   31ad4:      	movq	%rax, %rbx
   31ad7:      	leaq	-0x48(%rbp), %rdi
   31adb:      	callq	0x356c0 <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>>
   31ae0:      	movq	%rbx, %rdi
   31ae3:      	callq	0xb9f20 <_Unwind_Resume>
   31ae8:      	callq	0xbf33a <core::panicking::panic_in_cleanup>
   31aed:      	int3
   31aee:      	int3
   31aef:      	int3

0000000000031af0 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>>::from_iter>:
   31af0:      	pushq	%rbp
   31af1:      	movq	%rsp, %rbp
   31af4:      	pushq	%r15
   31af6:      	pushq	%r14
   31af8:      	pushq	%r13
   31afa:      	pushq	%r12
   31afc:      	pushq	%rbx
   31afd:      	subq	$0x68, %rsp
   31b01:      	movq	%rsi, %r14
   31b04:      	movq	%rdi, -0x50(%rbp)
   31b08:      	movq	0x10(%rsi), %rsi
   31b0c:      	movq	0x18(%r14), %rbx
   31b10:      	xorl	%r13d, %r13d
   31b13:      	movq	%rbx, %r15
   31b16:      	subq	%rsi, %r15
   31b19:      	cmovbq	%r13, %r15
   31b1d:      	movl	$0xf22, %ecx            # imm = 0xF22
   31b22:      	movq	%r15, %rax
   31b25:      	mulq	%rcx
   31b28:      	movq	%rax, %r12
   31b2b:      	jo	0x31c09 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>>::from_iter+0x119>
   31b31:      	movq	%rsi, -0x30(%rbp)
   31b35:      	movl	$0x2, %esi
   31b3a:      	movq	%r12, %rdi
   31b3d:      	callq	0xbc970 <<core::alloc::layout::Layout>::is_size_alignment_valid>
   31b42:      	testb	%al, %al
   31b44:      	je	0x31c06 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>>::from_iter+0x116>
   31b4a:      	testq	%r12, %r12
   31b4d:      	je	0x31b75 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>>::from_iter+0x85>
   31b4f:      	callq	0x4a3b0 <__rustc::__rust_no_alloc_shim_is_unstable_v2>
   31b54:      	movl	$0x2, %r13d
   31b5a:      	movl	$0x2, %esi
   31b5f:      	movq	%r12, %rdi
   31b62:      	callq	0x4a370 <__rustc::__rust_alloc>
   31b67:      	testq	%rax, %rax
   31b6a:      	movq	-0x30(%rbp), %rdx
   31b6e:      	jne	0x31b83 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>>::from_iter+0x93>
   31b70:      	jmp	0x31c09 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>>::from_iter+0x119>
   31b75:      	movl	$0x2, %eax
   31b7a:      	movq	-0x30(%rbp), %rdx
   31b7e:      	cmpq	%rdx, %rbx
   31b81:      	ja	0x31bec <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>>::from_iter+0xfc>
   31b83:      	movq	%r15, -0x48(%rbp)
   31b87:      	movq	%rax, -0x40(%rbp)
   31b8b:      	leaq	-0x38(%rbp), %rcx
   31b8f:      	movq	$0x0, -0x38(%rbp)
   31b97:      	movups	(%r14), %xmm0
   31b9b:      	movaps	%xmm0, -0x90(%rbp)
   31ba2:      	movq	%rdx, -0x80(%rbp)
   31ba6:      	movq	%rbx, -0x78(%rbp)
   31baa:      	movq	%rcx, -0x68(%rbp)
   31bae:      	movq	$0x0, -0x60(%rbp)
   31bb6:      	movq	%rax, -0x58(%rbp)
   31bba:      	leaq	-0x90(%rbp), %rdi
   31bc1:      	leaq	-0x68(%rbp), %rsi
   31bc5:      	callq	0x36060 <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>>
   31bca:      	movq	-0x38(%rbp), %rcx
   31bce:      	movq	-0x50(%rbp), %rax
   31bd2:      	movq	%rcx, 0x10(%rax)
   31bd6:      	movups	-0x48(%rbp), %xmm0
   31bda:      	movups	%xmm0, (%rax)
   31bdd:      	addq	$0x68, %rsp
   31be1:      	popq	%rbx
   31be2:      	popq	%r12
   31be4:      	popq	%r13
   31be6:      	popq	%r14
   31be8:      	popq	%r15
   31bea:      	popq	%rbp
   31beb:      	retq
   31bec:      	leaq	-0x22d9b(%rip), %rdi    # 0xee58 <anon.a8fe1686bdbcefb2af0339a511ab2ed0.3.llvm.4390621744819913044>
   31bf3:      	leaq	0x9583e(%rip), %rcx     # 0xc7438 <anon.a8fe1686bdbcefb2af0339a511ab2ed0.2.llvm.4390621744819913044>
   31bfa:      	movl	$0x1bb, %esi            # imm = 0x1BB
   31bff:      	xorl	%edx, %edx
   31c01:      	callq	0xbf390 <core::panicking::panic_nounwind_fmt>
   31c06:      	xorl	%r13d, %r13d
   31c09:      	movq	%r13, %rdi
   31c0c:      	movq	%r12, %rsi
   31c0f:      	callq	0xbb992 <alloc::raw_vec::handle_error>
   31c14:      	movq	%rax, %rbx
   31c17:      	leaq	-0x48(%rbp), %rdi
   31c1b:      	callq	0x356c0 <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>>
   31c20:      	movq	%rbx, %rdi
   31c23:      	callq	0xb9f20 <_Unwind_Resume>
   31c28:      	callq	0xbf33a <core::panicking::panic_in_cleanup>
   31c2d:      	int3
   31c2e:      	int3
   31c2f:      	int3

0000000000031c30 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter>:
   31c30:      	pushq	%rbp
   31c31:      	movq	%rsp, %rbp
   31c34:      	pushq	%r15
   31c36:      	pushq	%r14
   31c38:      	pushq	%r13
   31c3a:      	pushq	%r12
   31c3c:      	pushq	%rbx
   31c3d:      	subq	$0x28, %rsp
   31c41:      	movq	0x8(%rsi), %rbx
   31c45:      	movq	%rsi, -0x30(%rbp)
   31c49:      	movq	0x10(%rsi), %r15
   31c4d:      	xorl	%ecx, %ecx
   31c4f:      	movq	%r15, %r13
   31c52:      	subq	%rbx, %r13
   31c55:      	cmovbq	%rcx, %r13
   31c59:      	movq	%rdi, -0x38(%rbp)
   31c5d:      	leaq	(,%r13,8), %r12
   31c65:      	movq	%r13, %rax
   31c68:      	shrq	$0x3d, %rax
   31c6c:      	jne	0x31df9 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x1c9>
   31c72:      	movl	$0x8, %esi
   31c77:      	movq	%r12, %rdi
   31c7a:      	callq	0xbc970 <<core::alloc::layout::Layout>::is_size_alignment_valid>
   31c7f:      	testb	%al, %al
   31c81:      	je	0x31df7 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x1c7>
   31c87:      	testq	%r12, %r12
   31c8a:      	je	0x31cb1 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x81>
   31c8c:      	callq	0x4a3b0 <__rustc::__rust_no_alloc_shim_is_unstable_v2>
   31c91:      	movl	$0x8, %esi
   31c96:      	movq	%r12, %rdi
   31c99:      	callq	0x4a370 <__rustc::__rust_alloc>
   31c9e:      	movl	$0x8, %ecx
   31ca3:      	testq	%rax, %rax
   31ca6:      	je	0x31df9 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x1c9>
   31cac:      	movq	%rax, %r14
   31caf:      	jmp	0x31cc0 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x90>
   31cb1:      	movl	$0x8, %r14d
   31cb7:      	cmpq	%rbx, %r15
   31cba:      	ja	0x31dcf <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x19f>
   31cc0:      	movq	%r13, -0x50(%rbp)
   31cc4:      	movq	%r14, -0x48(%rbp)
   31cc8:      	subq	%rbx, %r15
   31ccb:      	jbe	0x31daa <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x17a>
   31cd1:      	movq	-0x30(%rbp), %rax
   31cd5:      	movq	(%rax), %r13
   31cd8:      	incq	%rbx
   31cdb:      	xorl	%r12d, %r12d
   31cde:      	nop
   31ce0:      	leaq	(%rbx,%r12), %rax
   31ce4:      	movq	%rax, %xmm1
   31ce9:      	punpckldq	-0x23511(%rip), %xmm1 # xmm1 = xmm1[0],mem[0],xmm1[1],mem[1]
                                                # 0xe7e0 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x620>
   31cf1:      	subpd	-0x23659(%rip), %xmm1   # 0xe6a0 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x4e0>
   31cf9:      	movapd	%xmm1, %xmm0
   31cfd:      	unpckhpd	%xmm1, %xmm0            # xmm0 = xmm0[1],xmm1[1]
   31d01:      	addsd	%xmm1, %xmm0
   31d05:      	mulsd	-0x22f2d(%rip), %xmm0   # 0xede0 <anon.38808e0998af18ea2dab9aba4957194f.8.llvm.12287912318127236922>
   31d0d:      	divsd	-0x22f95(%rip), %xmm0   # 0xed80 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x500>
   31d15:      	callq	0xc5b00 <exp2>
   31d1a:      	movsd	-0x22f62(%rip), %xmm1   # 0xedc0 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x540>
   31d22:      	subsd	%xmm0, %xmm1
   31d26:      	mulsd	-0x22f66(%rip), %xmm1   # 0xedc8 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x548>
   31d2e:      	movapd	%xmm1, %xmm0
   31d32:      	subsd	-0x22f6a(%rip), %xmm0   # 0xedd0 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x550>
   31d3a:      	xorpd	%xmm2, %xmm2
   31d3e:      	ucomisd	%xmm2, %xmm1
   31d42:      	jb	0x31d60 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x130>
   31d44:      	cvttsd2si	%xmm1, %rcx
   31d49:      	movq	%rcx, %rdx
   31d4c:      	sarq	$0x3f, %rdx
   31d50:      	cvttsd2si	%xmm0, %rax
   31d55:      	andq	%rdx, %rax
   31d58:      	orq	%rcx, %rax
   31d5b:      	jmp	0x31d62 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x132>
   31d5d:      	nopl	(%rax)
   31d60:      	xorl	%eax, %eax
   31d62:      	ucomisd	-0x23002(%rip), %xmm1   # 0xed68 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x4e8>
   31d6a:      	movq	$-0x1, %rdi
   31d71:      	ja	0x31d76 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x146>
   31d73:      	movq	%rax, %rdi
   31d76:      	cmpq	$0x270f, %rdi           # imm = 0x270F
   31d7d:      	jb	0x31d84 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x154>
   31d7f:      	movl	$0x270f, %edi           # imm = 0x270F
   31d84:      	movq	0x10(%r13), %rsi
   31d88:      	cmpq	%rsi, %rdi
   31d8b:      	jae	0x31de9 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x1b9>
   31d8d:      	movq	0x8(%r13), %rax
   31d91:      	movsd	(%rax,%rdi,8), %xmm0
   31d96:      	movsd	%xmm0, (%r14,%r12,8)
   31d9c:      	incq	%r12
   31d9f:      	cmpq	%r12, %r15
   31da2:      	jne	0x31ce0 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0xb0>
   31da8:      	jmp	0x31dad <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter+0x17d>
   31daa:      	xorl	%r12d, %r12d
   31dad:      	movq	%r12, -0x40(%rbp)
   31db1:      	movq	-0x38(%rbp), %rax
   31db5:      	movq	%r12, 0x10(%rax)
   31db9:      	movups	-0x50(%rbp), %xmm0
   31dbd:      	movups	%xmm0, (%rax)
   31dc0:      	addq	$0x28, %rsp
   31dc4:      	popq	%rbx
   31dc5:      	popq	%r12
   31dc7:      	popq	%r13
   31dc9:      	popq	%r14
   31dcb:      	popq	%r15
   31dcd:      	popq	%rbp
   31dce:      	retq
   31dcf:      	leaq	-0x22f7e(%rip), %rdi    # 0xee58 <anon.a8fe1686bdbcefb2af0339a511ab2ed0.3.llvm.4390621744819913044>
   31dd6:      	leaq	0x9565b(%rip), %rcx     # 0xc7438 <anon.a8fe1686bdbcefb2af0339a511ab2ed0.2.llvm.4390621744819913044>
   31ddd:      	movl	$0x1bb, %esi            # imm = 0x1BB
   31de2:      	xorl	%edx, %edx
   31de4:      	callq	0xbf390 <core::panicking::panic_nounwind_fmt>
   31de9:      	leaq	0x95800(%rip), %rdx     # 0xc75f0 <anon.b0fa440d1b3fd0947bcb9be5aef6393f.1.llvm.11432899387189510236>
   31df0:      	callq	0xbf34d <core::panicking::panic_bounds_check>
   31df5:      	ud2
   31df7:      	xorl	%ecx, %ecx
   31df9:      	movq	%rcx, %rdi
   31dfc:      	movq	%r12, %rsi
   31dff:      	callq	0xbb992 <alloc::raw_vec::handle_error>
   31e04:      	movq	%rax, %rbx
   31e07:      	movq	%r12, -0x40(%rbp)
   31e0b:      	leaq	-0x50(%rbp), %rdi
   31e0f:      	movl	$0x8, %esi
   31e14:      	movl	$0x8, %edx
   31e19:      	callq	0x369c0 <<alloc::raw_vec::RawVecInner>::deallocate>
   31e1e:      	movq	%rbx, %rdi
   31e21:      	callq	0xb9f20 <_Unwind_Resume>
   31e26:      	int3
   31e27:      	int3
   31e28:      	int3
   31e29:      	int3
   31e2a:      	int3
   31e2b:      	int3
   31e2c:      	int3
   31e2d:      	int3
   31e2e:      	int3
   31e2f:      	int3

0000000000031e30 <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<crypto_constant_time::Given>>:
   31e30:      	pushq	%rbp
   31e31:      	movq	%rsp, %rbp
   31e34:      	pushq	%r15
   31e36:      	pushq	%r14
   31e38:      	pushq	%r12
   31e3a:      	pushq	%rbx
   31e3b:      	subq	$0x930, %rsp            # imm = 0x930
   31e42:      	xorps	%xmm0, %xmm0
   31e45:      	movaps	%xmm0, -0x30(%rbp)
   31e49:      	movaps	%xmm0, -0x40(%rbp)
   31e4d:      	movq	0x8(%rdx), %rax
   31e51:      	cmpq	$0x1f, %rax
   31e55:      	jbe	0x32022 <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<crypto_constant_time::Given>+0x1f2>
   31e5b:      	movq	%rsi, %r14
   31e5e:      	movq	%rdi, %rbx
   31e61:      	movq	(%rdx), %rcx
   31e64:      	leaq	-0x40(%rbp), %r12
   31e68:      	movq	%rcx, %rsi
   31e6b:      	subq	%r12, %rsi
   31e6e:      	movq	%r12, %rdi
   31e71:      	subq	%rcx, %rdi
   31e74:      	cmovbq	%rsi, %rdi
   31e78:      	cmpq	$0x1f, %rdi
   31e7c:      	jbe	0x3203c <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<crypto_constant_time::Given>+0x20c>
   31e82:      	addq	$-0x20, %rax
   31e86:      	movq	%rcx, %rsi
   31e89:      	addq	$0x20, %rsi
   31e8d:      	movups	(%rcx), %xmm0
   31e90:      	movups	0x10(%rcx), %xmm1
   31e94:      	movaps	%xmm1, -0x30(%rbp)
   31e98:      	movaps	%xmm0, -0x40(%rbp)
   31e9c:      	movq	%rsi, (%rdx)
   31e9f:      	movq	%rax, 0x8(%rdx)
   31ea3:      	movq	%r14, -0x510(%rbp)
   31eaa:      	movq	$0x4a0, -0x508(%rbp)    # imm = 0x4A0
   31eb5:      	leaq	-0xb0(%rbp), %r15
   31ebc:      	leaq	-0x510(%rbp), %rsi
   31ec3:      	movl	$0x1, %edx
   31ec8:      	movq	%r15, %rdi
   31ecb:      	callq	0x4b400 <toyos_crypto::keccak::h>
   31ed0:      	movq	%r12, -0x950(%rbp)
   31ed7:      	movq	$0x20, -0x948(%rbp)
   31ee2:      	movq	%r15, -0x940(%rbp)
   31ee9:      	movq	$0x20, -0x938(%rbp)
   31ef4:      	leaq	-0x510(%rbp), %rdi
   31efb:      	leaq	-0x950(%rbp), %rsi
   31f02:      	movl	$0x2, %edx
   31f07:      	callq	0x4b1e0 <toyos_crypto::keccak::g>
   31f0c:      	movups	-0x510(%rbp), %xmm0
   31f13:      	movups	-0x500(%rbp), %xmm1
   31f1a:      	movups	-0x4f0(%rbp), %xmm2
   31f21:      	movups	-0x4e0(%rbp), %xmm3
   31f28:      	movaps	%xmm3, -0x60(%rbp)
   31f2c:      	movaps	%xmm2, -0x70(%rbp)
   31f30:      	movaps	%xmm1, -0x80(%rbp)
   31f34:      	movaps	%xmm0, -0x90(%rbp)
   31f3b:      	leaq	-0x70(%rbp), %r15
   31f3f:      	leaq	-0x950(%rbp), %rdi
   31f46:      	leaq	-0x40(%rbp), %rdx
   31f4a:      	movq	%r14, %rsi
   31f4d:      	movq	%r15, %rcx
   31f50:      	callq	0x56480 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>
   31f55:      	movaps	-0x90(%rbp), %xmm0
   31f5c:      	movaps	-0x80(%rbp), %xmm1
   31f60:      	movups	%xmm1, -0xc0(%rbp)
   31f67:      	movups	%xmm0, -0xd0(%rbp)
   31f6e:      	leaq	-0x510(%rbp), %r14
   31f75:      	leaq	-0x950(%rbp), %rsi
   31f7c:      	movl	$0x440, %edx            # imm = 0x440
   31f81:      	movq	%r14, %rdi
   31f84:      	callq	0xc5af0 <memcpy>
   31f89:      	leaq	0x1(%rbx), %rdi
   31f8d:      	movl	$0x460, %edx            # imm = 0x460
   31f92:      	movq	%r14, %rsi
   31f95:      	callq	0xc5af0 <memcpy>
   31f9a:      	movb	$0x0, (%rbx)
   31f9d:      	xorps	%xmm0, %xmm0
   31fa0:      	movaps	%xmm0, -0x510(%rbp)
   31fa7:      	movaps	-0x510(%rbp), %xmm1
   31fae:      	movaps	%xmm1, -0x90(%rbp)
   31fb5:      	movaps	%xmm0, -0x510(%rbp)
   31fbc:      	movaps	-0x510(%rbp), %xmm1
   31fc3:      	movaps	%xmm1, -0x80(%rbp)
   31fc7:      	movaps	%xmm0, -0x510(%rbp)
   31fce:      	movaps	-0x510(%rbp), %xmm1
   31fd5:      	movups	%xmm1, (%r15)
   31fd9:      	movaps	%xmm0, -0x510(%rbp)
   31fe0:      	movaps	-0x510(%rbp), %xmm1
   31fe7:      	movaps	%xmm1, -0x60(%rbp)
   31feb:      	movaps	%xmm0, -0x510(%rbp)
   31ff2:      	movaps	-0x510(%rbp), %xmm1
   31ff9:      	movaps	%xmm1, -0x40(%rbp)
   31ffd:      	movaps	%xmm0, -0x510(%rbp)
   32004:      	movaps	-0x510(%rbp), %xmm0
   3200b:      	movaps	%xmm0, -0x30(%rbp)
   3200f:      	movq	%rbx, %rax
   32012:      	addq	$0x930, %rsp            # imm = 0x930
   32019:      	popq	%rbx
   3201a:      	popq	%r12
   3201c:      	popq	%r14
   3201e:      	popq	%r15
   32020:      	popq	%rbp
   32021:      	retq
   32022:      	leaq	-0x22b2c(%rip), %rdi    # 0xf4fd <anon.762811cd0282735118b17318538b4fa7.28.llvm.9879151853117520149>
   32029:      	leaq	0x95530(%rip), %rdx     # 0xc7560 <anon.762811cd0282735118b17318538b4fa7.35.llvm.9879151853117520149>
   32030:      	movl	$0x13, %esi
   32035:      	callq	0xbf510 <core::panicking::panic_fmt>
   3203a:      	ud2
   3203c:      	leaq	-0x22a4f(%rip), %rdi    # 0xf5f4 <anon.0c060ffce792bb80b9805c9943ef2ace.2.llvm.16006066140378012905>
   32043:      	leaq	0x9552e(%rip), %rcx     # 0xc7578 <anon.0c060ffce792bb80b9805c9943ef2ace.1.llvm.16006066140378012905>
   3204a:      	movl	$0x237, %esi            # imm = 0x237
   3204f:      	xorl	%edx, %edx
   32051:      	callq	0xbf390 <core::panicking::panic_nounwind_fmt>
   32056:      	xorps	%xmm0, %xmm0
   32059:      	movaps	%xmm0, -0x510(%rbp)
   32060:      	movaps	-0x510(%rbp), %xmm1
   32067:      	movaps	%xmm1, -0x90(%rbp)
   3206e:      	movaps	%xmm0, -0x510(%rbp)
   32075:      	movaps	-0x510(%rbp), %xmm1
   3207c:      	movaps	%xmm1, -0x80(%rbp)
   32080:      	movaps	%xmm0, -0x510(%rbp)
   32087:      	movaps	-0x510(%rbp), %xmm1
   3208e:      	movups	%xmm1, (%r15)
   32092:      	movaps	%xmm0, -0x510(%rbp)
   32099:      	movaps	-0x510(%rbp), %xmm0
   320a0:      	movaps	%xmm0, -0x60(%rbp)
   320a4:      	jmp	0x320a6 <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<crypto_constant_time::Given>+0x276>
   320a6:      	xorps	%xmm0, %xmm0
   320a9:      	movaps	%xmm0, -0x50(%rbp)
   320ad:      	movaps	-0x50(%rbp), %xmm1
   320b1:      	movaps	%xmm1, -0x40(%rbp)
   320b5:      	movaps	%xmm0, -0x50(%rbp)
   320b9:      	movaps	-0x50(%rbp), %xmm0
   320bd:      	movaps	%xmm0, -0x30(%rbp)
   320c1:      	movq	%rax, %rdi
   320c4:      	callq	0xb9f20 <_Unwind_Resume>
   320c9:      	int3
   320ca:      	int3
   320cb:      	int3
   320cc:      	int3
   320cd:      	int3
   320ce:      	int3
   320cf:      	int3

00000000000320d0 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>>:
   320d0:      	pushq	%rbp
   320d1:      	movq	%rsp, %rbp
   320d4:      	pushq	%r15
   320d6:      	pushq	%r14
   320d8:      	pushq	%r13
   320da:      	pushq	%r12
   320dc:      	pushq	%rbx
   320dd:      	subq	$0x1000, %rsp           # imm = 0x1000
   320e4:      	movq	$0x0, (%rsp)
   320ec:      	subq	$0xc38, %rsp            # imm = 0xC38
   320f3:      	xorps	%xmm0, %xmm0
   320f6:      	movaps	%xmm0, -0x90(%rbp)
   320fd:      	movaps	%xmm0, -0xa0(%rbp)
   32104:      	movaps	%xmm0, -0xb0(%rbp)
   3210b:      	movaps	%xmm0, -0xc0(%rbp)
   32112:      	movq	0x8(%rsi), %rax
   32116:      	cmpq	$0x3f, %rax
   3211a:      	jbe	0x32712 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x642>
   32120:      	movq	%rdi, %r14
   32123:      	movq	(%rsi), %rdx
   32126:      	leaq	-0xc0(%rbp), %rcx
   3212d:      	movq	%rdx, %rdi
   32130:      	subq	%rcx, %rdi
   32133:      	movq	%rcx, %r8
   32136:      	subq	%rdx, %r8
   32139:      	cmovbq	%rdi, %r8
   3213d:      	cmpq	$0x3f, %r8
   32141:      	jbe	0x326f8 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x628>
   32147:      	addq	$-0x40, %rax
   3214b:      	movq	%rdx, %rdi
   3214e:      	addq	$0x40, %rdi
   32152:      	movups	(%rdx), %xmm0
   32155:      	movups	0x10(%rdx), %xmm1
   32159:      	movups	0x20(%rdx), %xmm2
   3215d:      	movups	0x30(%rdx), %xmm3
   32161:      	movaps	%xmm3, -0x90(%rbp)
   32168:      	movaps	%xmm2, -0xa0(%rbp)
   3216f:      	movaps	%xmm1, -0xb0(%rbp)
   32176:      	movaps	%xmm0, -0xc0(%rbp)
   3217d:      	movq	%rdi, (%rsi)
   32180:      	movq	%rax, 0x8(%rsi)
   32184:      	movq	%rcx, -0x15c0(%rbp)
   3218b:      	movq	$0x20, -0x15b8(%rbp)
   32196:      	leaq	-0x23268(%rip), %rax    # 0xef35 <anon.a8fe1686bdbcefb2af0339a511ab2ed0.3.llvm.4390621744819913044+0xdd>
   3219d:      	movq	%rax, -0x15b0(%rbp)
   321a4:      	movq	$0x1, -0x15a8(%rbp)
   321af:      	leaq	-0xfc0(%rbp), %rbx
   321b6:      	leaq	-0x15c0(%rbp), %rsi
   321bd:      	movl	$0x2, %edx
   321c2:      	movq	%rbx, %rdi
   321c5:      	callq	0x4b1e0 <toyos_crypto::keccak::g>
   321ca:      	movq	%r14, -0xc8(%rbp)
   321d1:      	movups	-0xfc0(%rbp), %xmm0
   321d8:      	movups	-0xfb0(%rbp), %xmm1
   321df:      	movups	-0xfa0(%rbp), %xmm2
   321e6:      	movups	-0xf90(%rbp), %xmm3
   321ed:      	movaps	%xmm3, -0x50(%rbp)
   321f1:      	movaps	%xmm2, -0x60(%rbp)
   321f5:      	movaps	%xmm1, -0x70(%rbp)
   321f9:      	movaps	%xmm0, -0x80(%rbp)
   321fd:      	leaq	-0x60(%rbp), %rsi
   32201:      	movq	%rbx, -0xe0(%rbp)
   32208:      	movq	$0x3, -0xd8(%rbp)
   32213:      	xorl	%r14d, %r14d
   32216:      	leaq	-0x15c0(%rbp), %rdi
   3221d:      	xorl	%edx, %edx
   3221f:      	callq	0x5a5a0 <toyos_crypto::mlkem::noise>
   32224:      	xorl	%r14d, %r14d
   32227:      	leaq	-0x4e0(%rbp), %rdi
   3222e:      	leaq	-0x15c0(%rbp), %rsi
   32235:      	callq	0x59760 <<toyos_crypto::mlkem::Poly>::ntt>
   3223a:      	leaq	-0x2e0(%rbp), %rbx
   32241:      	leaq	-0x4e0(%rbp), %rsi
   32248:      	movl	$0x200, %edx            # imm = 0x200
   3224d:      	movq	%rbx, %rdi
   32250:      	callq	0xc5af0 <memcpy>
   32255:      	leaq	-0x17c0(%rbp), %r14
   3225c:      	movl	$0x200, %edx            # imm = 0x200
   32261:      	movq	%r14, %rdi
   32264:      	movq	%rbx, %rsi
   32267:      	callq	0xc5af0 <memcpy>
   3226c:      	leaq	-0x1c60(%rbp), %rbx
   32273:      	movl	$0x200, %edx            # imm = 0x200
   32278:      	movq	%rbx, %rdi
   3227b:      	movq	%r14, %rsi
   3227e:      	callq	0xc5af0 <memcpy>
   32283:      	leaq	-0xfc0(%rbp), %rdi
   3228a:      	movl	$0x200, %edx            # imm = 0x200
   3228f:      	movq	%rbx, %rsi
   32292:      	callq	0xc5af0 <memcpy>
   32297:      	movl	$0x1, %r14d
   3229d:      	leaq	-0x15c0(%rbp), %rdi
   322a4:      	leaq	-0x60(%rbp), %rsi
   322a8:      	movl	$0x1, %edx
   322ad:      	callq	0x5a5a0 <toyos_crypto::mlkem::noise>
   322b2:      	leaq	-0x4e0(%rbp), %rdi
   322b9:      	leaq	-0x15c0(%rbp), %rsi
   322c0:      	callq	0x59760 <<toyos_crypto::mlkem::Poly>::ntt>
   322c5:      	leaq	-0x2e0(%rbp), %rbx
   322cc:      	leaq	-0x4e0(%rbp), %rsi
   322d3:      	movl	$0x200, %edx            # imm = 0x200
   322d8:      	movq	%rbx, %rdi
   322db:      	callq	0xc5af0 <memcpy>
   322e0:      	leaq	-0x17c0(%rbp), %r14
   322e7:      	movl	$0x200, %edx            # imm = 0x200
   322ec:      	movq	%r14, %rdi
   322ef:      	movq	%rbx, %rsi
   322f2:      	callq	0xc5af0 <memcpy>
   322f7:      	leaq	-0x1c60(%rbp), %rbx
   322fe:      	movl	$0x200, %edx            # imm = 0x200
   32303:      	movq	%rbx, %rdi
   32306:      	movq	%r14, %rsi
   32309:      	callq	0xc5af0 <memcpy>
   3230e:      	leaq	-0xdc0(%rbp), %rdi
   32315:      	movl	$0x200, %edx            # imm = 0x200
   3231a:      	movq	%rbx, %rsi
   3231d:      	callq	0xc5af0 <memcpy>
   32322:      	movl	$0x2, %r14d
   32328:      	leaq	-0x15c0(%rbp), %rdi
   3232f:      	leaq	-0x60(%rbp), %rsi
   32333:      	movl	$0x2, %edx
   32338:      	callq	0x5a5a0 <toyos_crypto::mlkem::noise>
   3233d:      	leaq	-0x4e0(%rbp), %rdi
   32344:      	leaq	-0x15c0(%rbp), %rsi
   3234b:      	callq	0x59760 <<toyos_crypto::mlkem::Poly>::ntt>
   32350:      	leaq	-0x2e0(%rbp), %rbx
   32357:      	leaq	-0x4e0(%rbp), %r12
   3235e:      	movl	$0x200, %edx            # imm = 0x200
   32363:      	movq	%rbx, %rdi
   32366:      	movq	%r12, %rsi
   32369:      	callq	0xc5af0 <memcpy>
   3236e:      	leaq	-0x17c0(%rbp), %r13
   32375:      	movl	$0x200, %edx            # imm = 0x200
   3237a:      	movq	%r13, %rdi
   3237d:      	movq	%rbx, %rsi
   32380:      	callq	0xc5af0 <memcpy>
   32385:      	leaq	-0x1c60(%rbp), %r14
   3238c:      	movl	$0x200, %edx            # imm = 0x200
   32391:      	movq	%r14, %rdi
   32394:      	movq	%r13, %rsi
   32397:      	callq	0xc5af0 <memcpy>
   3239c:      	leaq	-0xbc0(%rbp), %rdi
   323a3:      	movl	$0x200, %edx            # imm = 0x200
   323a8:      	movq	%r14, %rsi
   323ab:      	callq	0xc5af0 <memcpy>
   323b0:      	leaq	-0x15c0(%rbp), %rdi
   323b7:      	leaq	-0xfc0(%rbp), %rbx
   323be:      	movl	$0x600, %edx            # imm = 0x600
   323c3:      	movq	%rbx, %rsi
   323c6:      	callq	0xc5af0 <memcpy>
   323cb:      	xorl	%r15d, %r15d
   323ce:      	movl	$0x4a0, %edx            # imm = 0x4A0
   323d3:      	movq	%r14, %rdi
   323d6:      	xorl	%esi, %esi
   323d8:      	callq	0xc6240 <memset>
   323dd:      	nopl	(%rax)
   323e0:      	leal	0x3(%r15), %edx
   323e4:      	movq	%rbx, %rdi
   323e7:      	leaq	-0x60(%rbp), %rsi
   323eb:      	callq	0x5a5a0 <toyos_crypto::mlkem::noise>
   323f0:      	movq	%r13, %rdi
   323f3:      	movq	%rbx, %rsi
   323f6:      	callq	0x59760 <<toyos_crypto::mlkem::Poly>::ntt>
   323fb:      	movq	%rbx, %rdi
   323fe:      	leaq	-0x80(%rbp), %rsi
   32402:      	movq	%r15, %rdx
   32405:      	xorl	%ecx, %ecx
   32407:      	callq	0x5ab30 <toyos_crypto::mlkem::sample>
   3240c:      	movq	%r12, %rdi
   3240f:      	movq	%rbx, %rsi
   32412:      	leaq	-0x15c0(%rbp), %rdx
   32419:      	callq	0x5a390 <<toyos_crypto::mlkem::Poly>::product>
   3241e:      	leaq	-0x2e0(%rbp), %rdi
   32425:      	movq	%r13, %rsi
   32428:      	movq	%r12, %rdx
   3242b:      	callq	0x59dd0 <<toyos_crypto::mlkem::Poly>::plus>
   32430:      	movq	%r13, %rdi
   32433:      	callq	0x55e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   32438:      	movl	$0x200, %edx            # imm = 0x200
   3243d:      	movq	%r13, %rdi
   32440:      	leaq	-0x2e0(%rbp), %rsi
   32447:      	callq	0xc5af0 <memcpy>
   3244c:      	movq	%r12, %rdi
   3244f:      	callq	0x55e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   32454:      	movq	%rbx, %rdi
   32457:      	callq	0x55e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   3245c:      	movl	$0x1, %ecx
   32461:      	movq	%rbx, %rdi
   32464:      	leaq	-0x80(%rbp), %rsi
   32468:      	movq	%r15, %rdx
   3246b:      	callq	0x5ab30 <toyos_crypto::mlkem::sample>
   32470:      	movq	%r12, %rdi
   32473:      	movq	%rbx, %rsi
   32476:      	leaq	-0x13c0(%rbp), %rdx
   3247d:      	callq	0x5a390 <<toyos_crypto::mlkem::Poly>::product>
   32482:      	leaq	-0x2e0(%rbp), %rdi
   32489:      	movq	%r13, %rsi
   3248c:      	movq	%r12, %rdx
   3248f:      	callq	0x59dd0 <<toyos_crypto::mlkem::Poly>::plus>
   32494:      	movq	%r13, %rdi
   32497:      	callq	0x55e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   3249c:      	movl	$0x200, %edx            # imm = 0x200
   324a1:      	movq	%r13, %rdi
   324a4:      	leaq	-0x2e0(%rbp), %rsi
   324ab:      	callq	0xc5af0 <memcpy>
   324b0:      	movq	%r12, %rdi
   324b3:      	callq	0x55e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   324b8:      	movq	%rbx, %rdi
   324bb:      	callq	0x55e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   324c0:      	movl	$0x2, %ecx
   324c5:      	movq	%rbx, %rdi
   324c8:      	leaq	-0x80(%rbp), %rsi
   324cc:      	movq	%r15, %rdx
   324cf:      	callq	0x5ab30 <toyos_crypto::mlkem::sample>
   324d4:      	movq	%r12, %rdi
   324d7:      	movq	%rbx, %rsi
   324da:      	leaq	-0x11c0(%rbp), %rdx
   324e1:      	callq	0x5a390 <<toyos_crypto::mlkem::Poly>::product>
   324e6:      	leaq	-0x2e0(%rbp), %rdi
   324ed:      	movq	%r13, %rsi
   324f0:      	movq	%r12, %rdx
   324f3:      	callq	0x59dd0 <<toyos_crypto::mlkem::Poly>::plus>
   324f8:      	movq	%r13, %rdi
   324fb:      	callq	0x55e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   32500:      	movl	$0x200, %edx            # imm = 0x200
   32505:      	movq	%r13, %rdi
   32508:      	leaq	-0x2e0(%rbp), %rsi
   3250f:      	callq	0xc5af0 <memcpy>
   32514:      	movq	%r12, %rdi
   32517:      	callq	0x55e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   3251c:      	movq	%rbx, %rdi
   3251f:      	callq	0x55e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   32524:      	movl	$0xc, %esi
   32529:      	movl	$0x180, %ecx            # imm = 0x180
   3252e:      	movq	%r13, %rdi
   32531:      	movq	%r14, %rdx
   32534:      	callq	0x59ec0 <<toyos_crypto::mlkem::Poly>::encode>
   32539:      	movq	%r13, %rdi
   3253c:      	callq	0x55e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   32541:      	incq	%r15
   32544:      	addq	$0x180, %r14            # imm = 0x180
   3254b:      	cmpq	$0x3, %r15
   3254f:      	jne	0x323e0 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x310>
   32555:      	leaq	-0x17e0(%rbp), %rax
   3255c:      	leaq	-0x80(%rbp), %rsi
   32560:      	movq	%rsi, %rcx
   32563:      	subq	%rax, %rcx
   32566:      	movq	%rax, %rdx
   32569:      	subq	%rsi, %rdx
   3256c:      	cmovbq	%rcx, %rdx
   32570:      	cmpq	$0x1f, %rdx
   32574:      	jbe	0x326f8 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x628>
   3257a:      	movaps	-0x80(%rbp), %xmm0
   3257e:      	movaps	-0x70(%rbp), %xmm1
   32582:      	movups	%xmm1, 0x10(%rax)
   32586:      	movups	%xmm0, (%rax)
   32589:      	leaq	-0x1c60(%rbp), %rax
   32590:      	movq	%rax, -0xfc0(%rbp)
   32597:      	movq	$0x4a0, -0xfb8(%rbp)    # imm = 0x4A0
   325a2:      	leaq	-0x4e0(%rbp), %rdi
   325a9:      	leaq	-0xfc0(%rbp), %rsi
   325b0:      	movl	$0x1, %edx
   325b5:      	callq	0x4b400 <toyos_crypto::keccak::h>
   325ba:      	leaq	-0xfc0(%rbp), %rbx
   325c1:      	leaq	-0x15c0(%rbp), %rsi
   325c8:      	movl	$0x600, %edx            # imm = 0x600
   325cd:      	movq	%rbx, %rdi
   325d0:      	callq	0xc5af0 <memcpy>
   325d5:      	leaq	-0x9c0(%rbp), %rdi
   325dc:      	leaq	-0x1c60(%rbp), %rsi
   325e3:      	movl	$0x4a0, %edx            # imm = 0x4A0
   325e8:      	callq	0xc5af0 <memcpy>
   325ed:      	movaps	-0xa0(%rbp), %xmm0
   325f4:      	movaps	-0x90(%rbp), %xmm1
   325fb:      	movups	%xmm0, -0x500(%rbp)
   32602:      	movups	%xmm1, -0x4f0(%rbp)
   32609:      	movups	-0x4e0(%rbp), %xmm0
   32610:      	movups	-0x4d0(%rbp), %xmm1
   32617:      	movups	%xmm0, -0x520(%rbp)
   3261e:      	movups	%xmm1, -0x510(%rbp)
   32625:      	movq	-0xc8(%rbp), %r14
   3262c:      	leaq	0x2(%r14), %rdi
   32630:      	movl	$0xae0, %edx            # imm = 0xAE0
   32635:      	movq	%rbx, %rsi
   32638:      	callq	0xc5af0 <memcpy>
   3263d:      	movb	$0x0, (%r14)
   32641:      	xorps	%xmm0, %xmm0
   32644:      	movaps	%xmm0, -0xfc0(%rbp)
   3264b:      	movaps	-0xfc0(%rbp), %xmm1
   32652:      	movaps	%xmm1, -0x80(%rbp)
   32656:      	movaps	%xmm0, -0xfc0(%rbp)
   3265d:      	movaps	-0xfc0(%rbp), %xmm1
   32664:      	movaps	%xmm1, -0x70(%rbp)
   32668:      	movaps	%xmm0, -0xfc0(%rbp)
   3266f:      	movaps	-0xfc0(%rbp), %xmm1
   32676:      	leaq	-0x60(%rbp), %rax
   3267a:      	movups	%xmm1, (%rax)
   3267d:      	movaps	%xmm0, -0xfc0(%rbp)
   32684:      	movaps	-0xfc0(%rbp), %xmm1
   3268b:      	movaps	%xmm1, -0x50(%rbp)
   3268f:      	movaps	%xmm0, -0xfc0(%rbp)
   32696:      	movaps	-0xfc0(%rbp), %xmm1
   3269d:      	movaps	%xmm1, -0xc0(%rbp)
   326a4:      	movaps	%xmm0, -0xfc0(%rbp)
   326ab:      	movaps	-0xfc0(%rbp), %xmm1
   326b2:      	movaps	%xmm1, -0xb0(%rbp)
   326b9:      	movaps	%xmm0, -0xfc0(%rbp)
   326c0:      	movaps	-0xfc0(%rbp), %xmm1
   326c7:      	movaps	%xmm1, -0xa0(%rbp)
   326ce:      	movaps	%xmm0, -0xfc0(%rbp)
   326d5:      	movaps	-0xfc0(%rbp), %xmm0
   326dc:      	movaps	%xmm0, -0x90(%rbp)
   326e3:      	movq	%r14, %rax
   326e6:      	addq	$0x1c38, %rsp           # imm = 0x1C38
   326ed:      	popq	%rbx
   326ee:      	popq	%r12
   326f0:      	popq	%r13
   326f2:      	popq	%r14
   326f4:      	popq	%r15
   326f6:      	popq	%rbp
   326f7:      	retq
   326f8:      	leaq	-0x2310b(%rip), %rdi    # 0xf5f4 <anon.0c060ffce792bb80b9805c9943ef2ace.2.llvm.16006066140378012905>
   326ff:      	leaq	0x94e72(%rip), %rcx     # 0xc7578 <anon.0c060ffce792bb80b9805c9943ef2ace.1.llvm.16006066140378012905>
   32706:      	movl	$0x237, %esi            # imm = 0x237
   3270b:      	xorl	%edx, %edx
   3270d:      	callq	0xbf390 <core::panicking::panic_nounwind_fmt>
   32712:      	leaq	-0x2321c(%rip), %rdi    # 0xf4fd <anon.762811cd0282735118b17318538b4fa7.28.llvm.9879151853117520149>
   32719:      	leaq	0x94e40(%rip), %rdx     # 0xc7560 <anon.762811cd0282735118b17318538b4fa7.35.llvm.9879151853117520149>
   32720:      	movl	$0x13, %esi
   32725:      	callq	0xbf510 <core::panicking::panic_fmt>
   3272a:      	ud2
   3272c:      	jmp	0x3277b <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x6ab>
   3272e:      	movq	%rax, %rbx
   32731:      	movq	%r14, -0xd0(%rbp)
   32738:      	leaq	-0xe0(%rbp), %rdi
   3273f:      	callq	0x328c0 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>
   32744:      	jmp	0x327ac <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x6dc>
   32746:      	callq	0xbf33a <core::panicking::panic_in_cleanup>
   3274b:      	jmp	0x32791 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x6c1>
   3274d:      	movq	%rax, %rbx
   32750:      	jmp	0x3276d <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x69d>
   32752:      	movq	%rax, %rbx
   32755:      	leaq	-0x17c0(%rbp), %rdi
   3275c:      	leaq	-0x2e0(%rbp), %rsi
   32763:      	movl	$0x200, %edx            # imm = 0x200
   32768:      	callq	0xc5af0 <memcpy>
   3276d:      	leaq	-0x4e0(%rbp), %rdi
   32774:      	callq	0x55e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   32779:      	jmp	0x32783 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x6b3>
   3277b:      	movq	%rax, %rbx
   3277e:      	jmp	0x327a0 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x6d0>
   32780:      	movq	%rax, %rbx
   32783:      	leaq	-0xfc0(%rbp), %rdi
   3278a:      	callq	0x55e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   3278f:      	jmp	0x32794 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x6c4>
   32791:      	movq	%rax, %rbx
   32794:      	leaq	-0x17c0(%rbp), %rdi
   3279b:      	callq	0x55e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   327a0:      	leaq	-0x15c0(%rbp), %rdi
   327a7:      	callq	0x32840 <core::ptr::drop_glue::<[toyos_crypto::mlkem::Poly; 3]>>
   327ac:      	xorps	%xmm0, %xmm0
   327af:      	movaps	%xmm0, -0x40(%rbp)
   327b3:      	movaps	-0x40(%rbp), %xmm1
   327b7:      	movaps	%xmm1, -0x80(%rbp)
   327bb:      	movaps	%xmm0, -0x40(%rbp)
   327bf:      	movaps	-0x40(%rbp), %xmm1
   327c3:      	movaps	%xmm1, -0x70(%rbp)
   327c7:      	movaps	%xmm0, -0x40(%rbp)
   327cb:      	movaps	-0x40(%rbp), %xmm1
   327cf:      	leaq	-0x60(%rbp), %rax
   327d3:      	movups	%xmm1, (%rax)
   327d6:      	movaps	%xmm0, -0x40(%rbp)
   327da:      	movaps	-0x40(%rbp), %xmm0
   327de:      	movaps	%xmm0, -0x50(%rbp)
   327e2:      	jmp	0x327e7 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>+0x717>
   327e4:      	movq	%rax, %rbx
   327e7:      	xorps	%xmm0, %xmm0
   327ea:      	movaps	%xmm0, -0x40(%rbp)
   327ee:      	movaps	-0x40(%rbp), %xmm1
   327f2:      	movaps	%xmm1, -0xc0(%rbp)
   327f9:      	movaps	%xmm0, -0x40(%rbp)
   327fd:      	movaps	-0x40(%rbp), %xmm1
   32801:      	movaps	%xmm1, -0xb0(%rbp)
   32808:      	movaps	%xmm0, -0x40(%rbp)
   3280c:      	movaps	-0x40(%rbp), %xmm1
   32810:      	movaps	%xmm1, -0xa0(%rbp)
   32817:      	movaps	%xmm0, -0x40(%rbp)
   3281b:      	movaps	-0x40(%rbp), %xmm0
   3281f:      	movaps	%xmm0, -0x90(%rbp)
   32826:      	movq	%rbx, %rdi
   32829:      	callq	0xb9f20 <_Unwind_Resume>
   3282e:      	callq	0xbf33a <core::panicking::panic_in_cleanup>
   32833:      	int3
   32834:      	int3
   32835:      	int3
   32836:      	int3
   32837:      	int3
   32838:      	int3
   32839:      	int3
   3283a:      	int3
   3283b:      	int3
   3283c:      	int3
   3283d:      	int3
   3283e:      	int3
   3283f:      	int3

0000000000032840 <core::ptr::drop_glue::<[toyos_crypto::mlkem::Poly; 3]>>:
   32840:      	pushq	%rbp
   32841:      	movq	%rsp, %rbp
   32844:      	pushq	%r15
   32846:      	pushq	%r14
   32848:      	pushq	%r12
   3284a:      	pushq	%rbx
   3284b:      	movl	$0x4, %r15d
   32851:      	nopw	%cs:(%rax,%rax)
   32860:      	cmpq	$0x1, %r15
   32864:      	je	0x3287a <core::ptr::drop_glue::<[toyos_crypto::mlkem::Poly; 3]>+0x3a>
   32866:      	leaq	0x200(%rdi), %rbx
   3286d:      	decq	%r15
   32870:      	callq	0x55e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   32875:      	movq	%rbx, %rdi
   32878:      	jmp	0x32860 <core::ptr::drop_glue::<[toyos_crypto::mlkem::Poly; 3]>+0x20>
   3287a:      	popq	%rbx
   3287b:      	popq	%r12
   3287d:      	popq	%r14
   3287f:      	popq	%r15
   32881:      	popq	%rbp
   32882:      	retq
   32883:      	movq	%rax, %r14
   32886:      	nopw	%cs:(%rax,%rax)
   32890:      	decq	%r15
   32893:      	je	0x328a9 <core::ptr::drop_glue::<[toyos_crypto::mlkem::Poly; 3]>+0x69>
   32895:      	leaq	0x200(%rbx), %r12
   3289c:      	movq	%rbx, %rdi
   3289f:      	callq	0x55e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   328a4:      	movq	%r12, %rbx
   328a7:      	jmp	0x32890 <core::ptr::drop_glue::<[toyos_crypto::mlkem::Poly; 3]>+0x50>
   328a9:      	movq	%r14, %rdi
   328ac:      	callq	0xb9f20 <_Unwind_Resume>
   328b1:      	callq	0xbf33a <core::panicking::panic_in_cleanup>
   328b6:      	int3
   328b7:      	int3
   328b8:      	int3
   328b9:      	int3
   328ba:      	int3
   328bb:      	int3
   328bc:      	int3
   328bd:      	int3
   328be:      	int3
   328bf:      	int3

00000000000328c0 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>:
   328c0:      	pushq	%rbp
   328c1:      	movq	%rsp, %rbp
   328c4:      	pushq	%r15
   328c6:      	pushq	%r14
   328c8:      	pushq	%r12
   328ca:      	pushq	%rbx
   328cb:      	movq	0x10(%rdi), %r15
   328cf:      	cmpq	0x8(%rdi), %r15
   328d3:      	ja	0x32903 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x43>
   328d5:      	testq	%r15, %r15
   328d8:      	je	0x328fa <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x3a>
   328da:      	movq	(%rdi), %rdi
   328dd:      	incq	%r15
   328e0:      	cmpq	$0x1, %r15
   328e4:      	je	0x328fa <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x3a>
   328e6:      	leaq	0x200(%rdi), %rbx
   328ed:      	decq	%r15
   328f0:      	callq	0x55e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   328f5:      	movq	%rbx, %rdi
   328f8:      	jmp	0x328e0 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x20>
   328fa:      	popq	%rbx
   328fb:      	popq	%r12
   328fd:      	popq	%r14
   328ff:      	popq	%r15
   32901:      	popq	%rbp
   32902:      	retq
   32903:      	leaq	-0x239d4(%rip), %rdi    # 0xef36 <anon.a8fe1686bdbcefb2af0339a511ab2ed0.3.llvm.4390621744819913044+0xde>
   3290a:      	leaq	0x94b3f(%rip), %rcx     # 0xc7450 <anon.a8fe1686bdbcefb2af0339a511ab2ed0.2.llvm.4390621744819913044+0x18>
   32911:      	movl	$0x1b5, %esi            # imm = 0x1B5
   32916:      	xorl	%edx, %edx
   32918:      	callq	0xbf390 <core::panicking::panic_nounwind_fmt>
   3291d:      	movq	%rax, %r14
   32920:      	decq	%r15
   32923:      	je	0x32939 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x79>
   32925:      	leaq	0x200(%rbx), %r12
   3292c:      	movq	%rbx, %rdi
   3292f:      	callq	0x55e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   32934:      	movq	%r12, %rbx
   32937:      	jmp	0x32920 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x60>
   32939:      	movq	%r14, %rdi
   3293c:      	callq	0xb9f20 <_Unwind_Resume>
   32941:      	callq	0xbf33a <core::panicking::panic_in_cleanup>
   32946:      	int3
   32947:      	int3
   32948:      	int3
   32949:      	int3
   3294a:      	int3
   3294b:      	int3
   3294c:      	int3
   3294d:      	int3
   3294e:      	int3
   3294f:      	int3

00000000000356c0 <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>>:
   356c0:      	pushq	%rbp
   356c1:      	movq	%rsp, %rbp
   356c4:      	pushq	%r15
   356c6:      	pushq	%r14
   356c8:      	pushq	%r13
   356ca:      	pushq	%r12
   356cc:      	pushq	%rbx
   356cd:      	subq	$0x48, %rsp
   356d1:      	movq	%rdi, -0x48(%rbp)
   356d5:      	movq	0x10(%rdi), %rax
   356d9:      	movq	%rax, -0x58(%rbp)
   356dd:      	testq	%rax, %rax
   356e0:      	je	0x3578a <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0xca>
   356e6:      	movq	-0x48(%rbp), %rax
   356ea:      	movq	0x8(%rax), %rcx
   356ee:      	leaq	0xf24(%rcx), %rax
   356f5:      	movq	%rcx, -0x68(%rbp)
   356f9:      	leaq	0x2(%rcx), %r14
   356fd:      	xorl	%ecx, %ecx
   356ff:      	movq	-0x58(%rbp), %r12
   35703:      	jmp	0x3574f <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0x8f>
   35705:      	nopw	%cs:(%rax,%rax)
   35710:      	xorps	%xmm1, %xmm1
   35713:      	movaps	%xmm1, -0x40(%rbp)
   35717:      	movaps	-0x40(%rbp), %xmm0
   3571b:      	movups	%xmm0, 0xac2(%rbx)
   35722:      	movaps	%xmm1, -0x40(%rbp)
   35726:      	movaps	-0x40(%rbp), %xmm0
   3572a:      	movups	%xmm0, 0xad2(%rbx)
   35731:      	movq	-0x60(%rbp), %rax
   35735:      	addq	$0xf22, %rax            # imm = 0xF22
   3573b:      	decq	%r12
   3573e:      	addq	$0xf22, %r14            # imm = 0xF22
   35745:      	movq	-0x50(%rbp), %rcx
   35749:      	cmpq	-0x58(%rbp), %rcx
   3574d:      	je	0x3578a <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0xca>
   3574f:      	movq	%rax, -0x60(%rbp)
   35753:      	imulq	$0xf22, %rcx, %rbx      # imm = 0xF22
   3575a:      	addq	-0x68(%rbp), %rbx
   3575e:      	incq	%rcx
   35761:      	movq	%rcx, -0x50(%rbp)
   35765:      	movl	$0x4, %r13d
   3576b:      	movq	%r14, %rdi
   3576e:      	nop
   35770:      	cmpq	$0x1, %r13
   35774:      	je	0x35710 <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0x50>
   35776:      	leaq	0x200(%rdi), %r15
   3577d:      	decq	%r13
   35780:      	callq	0x55e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   35785:      	movq	%r15, %rdi
   35788:      	jmp	0x35770 <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0xb0>
   3578a:      	movl	$0x2, %esi
   3578f:      	movl	$0xf22, %edx            # imm = 0xF22
   35794:      	movq	-0x48(%rbp), %rdi
   35798:      	addq	$0x48, %rsp
   3579c:      	popq	%rbx
   3579d:      	popq	%r12
   3579f:      	popq	%r13
   357a1:      	popq	%r14
   357a3:      	popq	%r15
   357a5:      	popq	%rbp
   357a6:      	jmp	0x369c0 <<alloc::raw_vec::RawVecInner>::deallocate>
   357ab:      	movq	%rax, -0x50(%rbp)
   357af:      	nop
   357b0:      	decq	%r13
   357b3:      	je	0x357c9 <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0x109>
   357b5:      	leaq	0x200(%r15), %r14
   357bc:      	movq	%r15, %rdi
   357bf:      	callq	0x55e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   357c4:      	movq	%r14, %r15
   357c7:      	jmp	0x357b0 <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0xf0>
   357c9:      	xorps	%xmm0, %xmm0
   357cc:      	movaps	%xmm0, -0x40(%rbp)
   357d0:      	movaps	-0x40(%rbp), %xmm1
   357d4:      	movups	%xmm1, 0xac2(%rbx)
   357db:      	movaps	%xmm0, -0x40(%rbp)
   357df:      	movaps	-0x40(%rbp), %xmm0
   357e3:      	movups	%xmm0, 0xad2(%rbx)
   357ea:      	movq	-0x60(%rbp), %rdi
   357ee:      	nop
   357f0:      	decq	%r12
   357f3:      	je	0x35806 <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0x146>
   357f5:      	leaq	0xf22(%rdi), %rbx
   357fc:      	callq	0x35fa0 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>>
   35801:      	movq	%rbx, %rdi
   35804:      	jmp	0x357f0 <core::ptr::drop_glue::<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0x130>
   35806:      	movl	$0x2, %esi
   3580b:      	movl	$0xf22, %edx            # imm = 0xF22
   35810:      	movq	-0x48(%rbp), %rdi
   35814:      	callq	0x369c0 <<alloc::raw_vec::RawVecInner>::deallocate>
   35819:      	movq	-0x50(%rbp), %rdi
   3581d:      	callq	0xb9f20 <_Unwind_Resume>
   35822:      	callq	0xbf33a <core::panicking::panic_in_cleanup>
   35827:      	callq	0xbf33a <core::panicking::panic_in_cleanup>
   3582c:      	int3
   3582d:      	int3
   3582e:      	int3
   3582f:      	int3

0000000000035a30 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>>:
   35a30:      	pushq	%rbp
   35a31:      	movq	%rsp, %rbp
   35a34:      	pushq	%r15
   35a36:      	pushq	%r14
   35a38:      	pushq	%r13
   35a3a:      	pushq	%r12
   35a3c:      	pushq	%rbx
   35a3d:      	subq	$0x48, %rsp
   35a41:      	movq	%rdi, %rbx
   35a44:      	movq	0x8(%rdi), %rsi
   35a48:      	movq	0x18(%rdi), %r12
   35a4c:      	movq	%r12, %rdi
   35a4f:      	movq	%rsi, -0x48(%rbp)
   35a53:      	callq	0xc38b0 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   35a58:      	testb	%al, %al
   35a5a:      	je	0x35b5f <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0x12f>
   35a60:      	movq	%rbx, -0x58(%rbp)
   35a64:      	movq	%r12, %rax
   35a67:      	movq	-0x48(%rbp), %rsi
   35a6b:      	subq	%rsi, %rax
   35a6e:      	shrq	%rax
   35a71:      	movabsq	$-0x78aa39e3303d52dd, %rcx # imm = 0x8755C61CCFC2AD23
   35a7b:      	mulq	%rcx
   35a7e:      	cmpq	%rsi, %r12
   35a81:      	je	0x35b2a <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0xfa>
   35a87:      	movq	%rdx, %r13
   35a8a:      	shrq	$0xa, %r13
   35a8e:      	movq	-0x48(%rbp), %rcx
   35a92:      	leaq	0xf24(%rcx), %rax
   35a99:      	leaq	0x2(%rcx), %r15
   35a9d:      	xorl	%ecx, %ecx
   35a9f:      	movq	%r13, -0x68(%rbp)
   35aa3:      	jmp	0x35af1 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0xc1>
   35aa5:      	nopw	%cs:(%rax,%rax)
   35ab0:      	xorps	%xmm1, %xmm1
   35ab3:      	movaps	%xmm1, -0x40(%rbp)
   35ab7:      	movaps	-0x40(%rbp), %xmm0
   35abb:      	movups	%xmm0, 0xac2(%r14)
   35ac3:      	movaps	%xmm1, -0x40(%rbp)
   35ac7:      	movaps	-0x40(%rbp), %xmm0
   35acb:      	movups	%xmm0, 0xad2(%r14)
   35ad3:      	movq	-0x60(%rbp), %rax
   35ad7:      	addq	$0xf22, %rax            # imm = 0xF22
   35add:      	decq	%r13
   35ae0:      	addq	$0xf22, %r15            # imm = 0xF22
   35ae7:      	movq	-0x50(%rbp), %rcx
   35aeb:      	cmpq	-0x68(%rbp), %rcx
   35aef:      	je	0x35b2a <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0xfa>
   35af1:      	movq	%rax, -0x60(%rbp)
   35af5:      	imulq	$0xf22, %rcx, %r14      # imm = 0xF22
   35afc:      	addq	-0x48(%rbp), %r14
   35b00:      	incq	%rcx
   35b03:      	movq	%rcx, -0x50(%rbp)
   35b07:      	movl	$0x4, %ebx
   35b0c:      	movq	%r15, %rdi
   35b0f:      	nop
   35b10:      	cmpq	$0x1, %rbx
   35b14:      	je	0x35ab0 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0x80>
   35b16:      	leaq	0x200(%rdi), %r12
   35b1d:      	decq	%rbx
   35b20:      	callq	0x55e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   35b25:      	movq	%r12, %rdi
   35b28:      	jmp	0x35b10 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0xe0>
   35b2a:      	movq	-0x58(%rbp), %rcx
   35b2e:      	movq	(%rcx), %rax
   35b31:      	movq	0x10(%rcx), %rcx
   35b35:      	movq	%rcx, -0x40(%rbp)
   35b39:      	movq	%rax, -0x38(%rbp)
   35b3d:      	leaq	-0x40(%rbp), %rdi
   35b41:      	movl	$0x2, %esi
   35b46:      	movl	$0xf22, %edx            # imm = 0xF22
   35b4b:      	callq	0x369c0 <<alloc::raw_vec::RawVecInner>::deallocate>
   35b50:      	addq	$0x48, %rsp
   35b54:      	popq	%rbx
   35b55:      	popq	%r12
   35b57:      	popq	%r13
   35b59:      	popq	%r14
   35b5b:      	popq	%r15
   35b5d:      	popq	%rbp
   35b5e:      	retq
   35b5f:      	leaq	-0x2564a(%rip), %rdi    # 0x1051c <anon.6cc4159c997fb1fe88462a0393e0f2a1.0.llvm.12053707996428374621>
   35b66:      	leaq	0x91d3b(%rip), %rcx     # 0xc78a8 <anon.6cc4159c997fb1fe88462a0393e0f2a1.2.llvm.12053707996428374621>
   35b6d:      	movl	$0x193, %esi            # imm = 0x193
   35b72:      	xorl	%edx, %edx
   35b74:      	callq	0xbf390 <core::panicking::panic_nounwind_fmt>
   35b79:      	callq	0xbf4af <core::panicking::panic_cannot_unwind>
   35b7e:      	movq	%rax, -0x50(%rbp)
   35b82:      	nopw	%cs:(%rax,%rax)
   35b90:      	decq	%rbx
   35b93:      	je	0x35baa <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0x17a>
   35b95:      	leaq	0x200(%r12), %r15
   35b9d:      	movq	%r12, %rdi
   35ba0:      	callq	0x55e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   35ba5:      	movq	%r15, %r12
   35ba8:      	jmp	0x35b90 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0x160>
   35baa:      	xorps	%xmm0, %xmm0
   35bad:      	movaps	%xmm0, -0x40(%rbp)
   35bb1:      	movaps	-0x40(%rbp), %xmm1
   35bb5:      	movups	%xmm1, 0xac2(%r14)
   35bbd:      	movaps	%xmm0, -0x40(%rbp)
   35bc1:      	movaps	-0x40(%rbp), %xmm0
   35bc5:      	movups	%xmm0, 0xad2(%r14)
   35bcd:      	movq	-0x60(%rbp), %rdi
   35bd1:      	nopw	%cs:(%rax,%rax)
   35be0:      	decq	%r13
   35be3:      	je	0x35bf6 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0x1c6>
   35be5:      	leaq	0xf22(%rdi), %rbx
   35bec:      	callq	0x35fa0 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>>
   35bf1:      	movq	%rbx, %rdi
   35bf4:      	jmp	0x35be0 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>+0x1b0>
   35bf6:      	movq	-0x58(%rbp), %rcx
   35bfa:      	movq	(%rcx), %rax
   35bfd:      	movq	0x10(%rcx), %rcx
   35c01:      	movq	%rcx, -0x40(%rbp)
   35c05:      	movq	%rax, -0x38(%rbp)
   35c09:      	leaq	-0x40(%rbp), %rdi
   35c0d:      	movl	$0x2, %esi
   35c12:      	movl	$0xf22, %edx            # imm = 0xF22
   35c17:      	callq	0x369c0 <<alloc::raw_vec::RawVecInner>::deallocate>
   35c1c:      	movq	-0x50(%rbp), %rdi
   35c20:      	callq	0xb9f20 <_Unwind_Resume>
   35c25:      	callq	0xbf33a <core::panicking::panic_in_cleanup>
   35c2a:      	callq	0xbf33a <core::panicking::panic_in_cleanup>
   35c2f:      	int3

0000000000035fa0 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>>:
   35fa0:      	pushq	%rbp
   35fa1:      	movq	%rsp, %rbp
   35fa4:      	pushq	%r15
   35fa6:      	pushq	%r14
   35fa8:      	pushq	%r13
   35faa:      	pushq	%r12
   35fac:      	pushq	%rbx
   35fad:      	subq	$0x18, %rsp
   35fb1:      	movq	%rdi, %rbx
   35fb4:      	movl	$0x4, %r12d
   35fba:      	nopw	(%rax,%rax)
   35fc0:      	cmpq	$0x1, %r12
   35fc4:      	je	0x35fda <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>+0x3a>
   35fc6:      	leaq	0x200(%rdi), %r15
   35fcd:      	decq	%r12
   35fd0:      	callq	0x55e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   35fd5:      	movq	%r15, %rdi
   35fd8:      	jmp	0x35fc0 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>+0x20>
   35fda:      	xorps	%xmm0, %xmm0
   35fdd:      	movaps	%xmm0, -0x40(%rbp)
   35fe1:      	movaps	-0x40(%rbp), %xmm1
   35fe5:      	movups	%xmm1, 0xac0(%rbx)
   35fec:      	movaps	%xmm0, -0x40(%rbp)
   35ff0:      	movaps	-0x40(%rbp), %xmm0
   35ff4:      	movups	%xmm0, 0xad0(%rbx)
   35ffb:      	addq	$0x18, %rsp
   35fff:      	popq	%rbx
   36000:      	popq	%r12
   36002:      	popq	%r13
   36004:      	popq	%r14
   36006:      	popq	%r15
   36008:      	popq	%rbp
   36009:      	retq
   3600a:      	movq	%rax, %r14
   3600d:      	nopl	(%rax)
   36010:      	decq	%r12
   36013:      	je	0x36029 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>+0x89>
   36015:      	leaq	0x200(%r15), %r13
   3601c:      	movq	%r15, %rdi
   3601f:      	callq	0x55e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>
   36024:      	movq	%r13, %r15
   36027:      	jmp	0x36010 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>+0x70>
   36029:      	xorps	%xmm0, %xmm0
   3602c:      	movaps	%xmm0, -0x40(%rbp)
   36030:      	movaps	-0x40(%rbp), %xmm1
   36034:      	movups	%xmm1, 0xac0(%rbx)
   3603b:      	movaps	%xmm0, -0x40(%rbp)
   3603f:      	movaps	-0x40(%rbp), %xmm0
   36043:      	movups	%xmm0, 0xad0(%rbx)
   3604a:      	movq	%r14, %rdi
   3604d:      	callq	0xb9f20 <_Unwind_Resume>
   36052:      	callq	0xbf33a <core::panicking::panic_in_cleanup>
   36057:      	int3
   36058:      	int3
   36059:      	int3
   3605a:      	int3
   3605b:      	int3
   3605c:      	int3
   3605d:      	int3
   3605e:      	int3
   3605f:      	int3

0000000000036060 <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>>:
   36060:      	pushq	%rbp
   36061:      	movq	%rsp, %rbp
   36064:      	pushq	%r15
   36066:      	pushq	%r14
   36068:      	pushq	%r13
   3606a:      	pushq	%r12
   3606c:      	pushq	%rbx
   3606d:      	subq	$0x1000, %rsp           # imm = 0x1000
   36074:      	movq	$0x0, (%rsp)
   3607c:      	subq	$0x1000, %rsp           # imm = 0x1000
   36083:      	movq	$0x0, (%rsp)
   3608b:      	subq	$0x1000, %rsp           # imm = 0x1000
   36092:      	movq	$0x0, (%rsp)
   3609a:      	subq	$0xd18, %rsp            # imm = 0xD18
   360a1:      	movq	0x10(%rdi), %r15
   360a5:      	movq	0x18(%rdi), %rcx
   360a9:      	movq	(%rsi), %rax
   360ac:      	movq	%rax, -0x38(%rbp)
   360b0:      	movq	0x8(%rsi), %rax
   360b4:      	movq	%rax, -0x30(%rbp)
   360b8:      	movq	%rcx, -0x50(%rbp)
   360bc:      	cmpq	%rcx, %r15
   360bf:      	jae	0x368c6 <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>+0x866>
   360c5:      	movq	(%rdi), %r13
   360c8:      	movq	0x10(%rsi), %rax
   360cc:      	movq	%rax, -0x40(%rbp)
   360d0:      	movq	0x8(%rdi), %rax
   360d4:      	movq	%rax, -0x48(%rbp)
   360d8:      	jmp	0x36162 <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>+0x102>
   360dd:      	nopl	(%rax)
   360e0:      	movl	$0xae0, %edx            # imm = 0xAE0
   360e5:      	leaq	-0x2e12(%rbp), %rbx
   360ec:      	movq	%rbx, %rdi
   360ef:      	leaq	-0x1ab2(%rbp), %rsi
   360f6:      	callq	0xc5af0 <memcpy>
   360fb:      	movl	$0x440, %edx            # imm = 0x440
   36100:      	leaq	-0x2332(%rbp), %rdi
   36107:      	movq	%r13, %rsi
   3610a:      	callq	0xc5af0 <memcpy>
   3610f:      	movl	$0xf20, %edx            # imm = 0xF20
   36114:      	leaq	-0x3d32(%rbp), %rdi
   3611b:      	movq	%rbx, %rsi
   3611e:      	callq	0xc5af0 <memcpy>
   36123:      	movq	-0x30(%rbp), %rbx
   36127:      	imulq	$0xf22, %rbx, %rax      # imm = 0xF22
   3612e:      	movq	-0x40(%rbp), %rcx
   36132:      	movb	%r14b, (%rcx,%rax)
   36136:      	leaq	(%rcx,%rax), %rdi
   3613a:      	incq	%rdi
   3613d:      	movl	$0xf21, %edx            # imm = 0xF21
   36142:      	leaq	-0x3d33(%rbp), %rsi
   36149:      	callq	0xc5af0 <memcpy>
   3614e:      	incq	%rbx
   36151:      	movq	%rbx, -0x30(%rbp)
   36155:      	cmpq	-0x50(%rbp), %r15
   36159:      	movq	%r12, %r13
   3615c:      	je	0x368c6 <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>+0x866>
   36162:      	movq	(%r13), %r14
   36166:      	movabsq	$-0x61c8864680b583eb, %rax # imm = 0x9E3779B97F4A7C15
   36170:      	addq	%rax, %r14
   36173:      	movq	%r14, (%r13)
   36177:      	leaq	-0x2666a(%rip), %rax    # 0xfb14 <anon.b0fa440d1b3fd0947bcb9be5aef6393f.2.llvm.11432899387189510236>
   3617e:      	movq	%rax, -0x4f0(%rbp)
   36185:      	movq	$0x40, -0x4e8(%rbp)
   36190:      	leaq	-0xfd2(%rbp), %rdi
   36197:      	leaq	-0x4f0(%rbp), %rsi
   3619e:      	callq	0x320d0 <<toyos_crypto::mlkem::DecapsulationKey>::generate::<crypto_constant_time::Given>>
   361a3:      	cmpb	$0x1, -0xfd2(%rbp)
   361aa:      	je	0x368e3 <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>+0x883>
   361b0:      	incq	%r15
   361b3:      	movq	%r14, %rax
   361b6:      	shrq	$0x1e, %rax
   361ba:      	xorq	%r14, %rax
   361bd:      	movabsq	$-0x40a7b892e31b1a47, %rcx # imm = 0xBF58476D1CE4E5B9
   361c7:      	imulq	%rcx, %rax
   361cb:      	movq	%rax, %rcx
   361ce:      	shrq	$0x1b, %rcx
   361d2:      	xorl	%eax, %ecx
   361d4:      	imull	$0x133111eb, %ecx, %eax # imm = 0x133111EB
   361da:      	movl	%eax, %r14d
   361dd:      	shrl	$0x1f, %r14d
   361e1:      	xorl	%eax, %r14d
   361e4:      	andl	$0x1, %r14d
   361e8:      	movl	$0xae0, %edx            # imm = 0xAE0
   361ed:      	leaq	-0x1ab2(%rbp), %rdi
   361f4:      	leaq	-0xfd0(%rbp), %rsi
   361fb:      	callq	0xc5af0 <memcpy>
   36200:      	movq	-0x48(%rbp), %rax
   36204:      	movq	0x8(%rax), %rsi
   36208:      	movl	$0x440, %edx            # imm = 0x440
   3620d:      	leaq	-0x4f0(%rbp), %rdi
   36214:      	callq	0xc5af0 <memcpy>
   36219:      	movq	(%r13), %rax
   3621d:      	movq	%rax, %xmm0
   36222:      	movabsq	$0x6bc5545cfc8f5940, %rcx # imm = 0x6BC5545CFC8F5940
   3622c:      	addq	%rcx, %rax
   3622f:      	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
   36234:      	movdqa	%xmm0, %xmm2
   36238:      	paddq	-0x278d0(%rip), %xmm2   # 0xe970 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0xf0>
   36240:      	movdqa	%xmm0, %xmm8
   36245:      	paddq	-0x278ce(%rip), %xmm8   # 0xe980 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x100>
   3624e:      	movdqa	%xmm0, %xmm11
   36253:      	paddq	-0x2788c(%rip), %xmm11  # 0xe9d0 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x150>
   3625c:      	movdqa	%xmm0, %xmm9
   36261:      	paddq	-0x27b5a(%rip), %xmm9   # 0xe710 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x550>
   3626a:      	movdqa	%xmm0, %xmm5
   3626e:      	paddq	-0x27596(%rip), %xmm5   # 0xece0 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x460>
   36276:      	movdqa	%xmm0, %xmm6
   3627a:      	paddq	-0x27b62(%rip), %xmm6   # 0xe720 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x560>
   36282:      	movdqa	%xmm0, %xmm7
   36286:      	paddq	-0x2783e(%rip), %xmm7   # 0xea50 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x1d0>
   3628e:      	paddq	-0x27646(%rip), %xmm0   # 0xec50 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x3d0>
   36296:      	xorl	%ecx, %ecx
   36298:      	movdqa	-0x27590(%rip), %xmm3   # 0xed10 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x490>
   362a0:      	movdqa	-0x278c8(%rip), %xmm4   # 0xe9e0 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x160>
   362a8:      	nopl	(%rax,%rax)
   362b0:      	movdqa	%xmm0, -0x60(%rbp)
   362b5:      	movdqa	%xmm6, -0x70(%rbp)
   362ba:      	movdqa	%xmm9, -0xb0(%rbp)
   362c3:      	movdqa	%xmm11, -0x80(%rbp)
   362c9:      	movdqa	%xmm8, -0x90(%rbp)
   362d2:      	movdqa	%xmm2, -0xa0(%rbp)
   362da:      	movdqa	-0xa0(%rbp), %xmm10
   362e3:      	movdqa	-0x278cc(%rip), %xmm11  # 0xea20 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x1a0>
   362ec:      	paddq	%xmm11, %xmm10
   362f1:      	movdqa	-0x90(%rbp), %xmm13
   362fa:      	paddq	%xmm11, %xmm13
   362ff:      	movdqa	-0x80(%rbp), %xmm15
   36305:      	paddq	%xmm11, %xmm15
   3630a:      	movdqa	%xmm9, %xmm1
   3630f:      	paddq	%xmm11, %xmm1
   36314:      	movdqa	%xmm5, %xmm2
   36318:      	paddq	%xmm11, %xmm2
   3631d:      	movdqa	-0x70(%rbp), %xmm14
   36323:      	paddq	%xmm11, %xmm14
   36328:      	movdqa	%xmm7, %xmm8
   3632d:      	paddq	%xmm11, %xmm8
   36332:      	movdqa	-0x60(%rbp), %xmm12
   36338:      	paddq	%xmm11, %xmm12
   3633d:      	movdqa	%xmm12, %xmm11
   36342:      	psrlq	$0x1e, %xmm11
   36348:      	movdqa	%xmm10, %xmm9
   3634d:      	psrlq	$0x1e, %xmm9
   36353:      	pxor	%xmm10, %xmm9
   36358:      	movdqa	%xmm13, %xmm10
   3635d:      	psrlq	$0x1e, %xmm10
   36363:      	pxor	%xmm13, %xmm10
   36368:      	movdqa	%xmm15, %xmm13
   3636d:      	psrlq	$0x1e, %xmm13
   36373:      	pxor	%xmm15, %xmm13
   36378:      	movdqa	%xmm1, %xmm15
   3637d:      	psrlq	$0x1e, %xmm15
   36383:      	pxor	%xmm1, %xmm15
   36388:      	movdqa	%xmm2, %xmm1
   3638c:      	psrlq	$0x1e, %xmm1
   36391:      	pxor	%xmm2, %xmm1
   36395:      	movdqa	%xmm14, %xmm2
   3639a:      	psrlq	$0x1e, %xmm2
   3639f:      	pxor	%xmm14, %xmm2
   363a4:      	movdqa	%xmm8, %xmm14
   363a9:      	psrlq	$0x1e, %xmm14
   363af:      	pxor	%xmm8, %xmm14
   363b4:      	pxor	%xmm12, %xmm11
   363b9:      	movdqa	%xmm11, %xmm8
   363be:      	movdqa	%xmm5, %xmm6
   363c2:      	movdqa	-0x2787a(%rip), %xmm5   # 0xeb50 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x2d0>
   363ca:      	pmuludq	%xmm5, %xmm8
   363cf:      	movdqa	%xmm11, %xmm12
   363d4:      	psrlq	$0x20, %xmm12
   363da:      	pmuludq	%xmm3, %xmm12
   363df:      	paddq	%xmm8, %xmm12
   363e4:      	psllq	$0x20, %xmm12
   363ea:      	pmuludq	%xmm3, %xmm11
   363ef:      	paddq	%xmm12, %xmm11
   363f4:      	movdqa	%xmm14, %xmm8
   363f9:      	pmuludq	%xmm5, %xmm8
   363fe:      	movdqa	%xmm14, %xmm12
   36403:      	psrlq	$0x20, %xmm12
   36409:      	pmuludq	%xmm3, %xmm12
   3640e:      	paddq	%xmm8, %xmm12
   36413:      	psllq	$0x20, %xmm12
   36419:      	pmuludq	%xmm3, %xmm14
   3641e:      	paddq	%xmm12, %xmm14
   36423:      	movdqa	%xmm2, %xmm8
   36428:      	pmuludq	%xmm5, %xmm8
   3642d:      	movdqa	%xmm2, %xmm12
   36432:      	psrlq	$0x20, %xmm12
   36438:      	pmuludq	%xmm3, %xmm12
   3643d:      	paddq	%xmm8, %xmm12
   36442:      	psllq	$0x20, %xmm12
   36448:      	pmuludq	%xmm3, %xmm2
   3644c:      	paddq	%xmm12, %xmm2
   36451:      	movdqa	%xmm1, %xmm8
   36456:      	pmuludq	%xmm5, %xmm8
   3645b:      	movdqa	%xmm1, %xmm12
   36460:      	psrlq	$0x20, %xmm12
   36466:      	pmuludq	%xmm3, %xmm12
   3646b:      	paddq	%xmm8, %xmm12
   36470:      	psllq	$0x20, %xmm12
   36476:      	pmuludq	%xmm3, %xmm1
   3647a:      	paddq	%xmm12, %xmm1
   3647f:      	movdqa	%xmm15, %xmm8
   36484:      	pmuludq	%xmm5, %xmm8
   36489:      	movdqa	%xmm15, %xmm12
   3648e:      	psrlq	$0x20, %xmm12
   36494:      	pmuludq	%xmm3, %xmm12
   36499:      	paddq	%xmm8, %xmm12
   3649e:      	psllq	$0x20, %xmm12
   364a4:      	pmuludq	%xmm3, %xmm15
   364a9:      	paddq	%xmm12, %xmm15
   364ae:      	movdqa	%xmm13, %xmm8
   364b3:      	pmuludq	%xmm5, %xmm8
   364b8:      	movdqa	%xmm13, %xmm12
   364bd:      	psrlq	$0x20, %xmm12
   364c3:      	pmuludq	%xmm3, %xmm12
   364c8:      	paddq	%xmm8, %xmm12
   364cd:      	psllq	$0x20, %xmm12
   364d3:      	pmuludq	%xmm3, %xmm13
   364d8:      	paddq	%xmm12, %xmm13
   364dd:      	movdqa	%xmm10, %xmm8
   364e2:      	pmuludq	%xmm5, %xmm8
   364e7:      	movdqa	%xmm10, %xmm12
   364ec:      	psrlq	$0x20, %xmm12
   364f2:      	pmuludq	%xmm3, %xmm12
   364f7:      	paddq	%xmm8, %xmm12
   364fc:      	psllq	$0x20, %xmm12
   36502:      	pmuludq	%xmm3, %xmm10
   36507:      	paddq	%xmm12, %xmm10
   3650c:      	movdqa	%xmm9, %xmm8
   36511:      	pmuludq	%xmm5, %xmm8
   36516:      	movdqa	%xmm6, %xmm5
   3651a:      	movdqa	%xmm9, %xmm12
   3651f:      	psrlq	$0x20, %xmm12
   36525:      	pmuludq	%xmm3, %xmm12
   3652a:      	paddq	%xmm8, %xmm12
   3652f:      	psllq	$0x20, %xmm12
   36535:      	pmuludq	%xmm3, %xmm9
   3653a:      	paddq	%xmm12, %xmm9
   3653f:      	movdqa	%xmm9, %xmm12
   36544:      	psrlq	$0x1b, %xmm12
   3654a:      	movdqa	%xmm11, %xmm8
   3654f:      	psrlq	$0x1b, %xmm8
   36555:      	pxor	%xmm11, %xmm8
   3655a:      	movdqa	%xmm14, %xmm11
   3655f:      	psrlq	$0x1b, %xmm11
   36565:      	pxor	%xmm14, %xmm11
   3656a:      	movdqa	%xmm2, %xmm14
   3656f:      	psrlq	$0x1b, %xmm14
   36575:      	pxor	%xmm2, %xmm14
   3657a:      	movdqa	%xmm1, %xmm2
   3657e:      	psrlq	$0x1b, %xmm2
   36583:      	pxor	%xmm1, %xmm2
   36587:      	movdqa	%xmm15, %xmm1
   3658c:      	psrlq	$0x1b, %xmm1
   36591:      	pxor	%xmm15, %xmm1
   36596:      	movdqa	%xmm13, %xmm15
   3659b:      	psrlq	$0x1b, %xmm15
   365a1:      	pxor	%xmm13, %xmm15
   365a6:      	movdqa	%xmm10, %xmm13
   365ab:      	psrlq	$0x1b, %xmm13
   365b1:      	pxor	%xmm10, %xmm13
   365b6:      	pxor	%xmm9, %xmm12
   365bb:      	movdqa	%xmm12, %xmm9
   365c0:      	movdqa	-0x27ca8(%rip), %xmm6   # 0xe920 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0xa0>
   365c8:      	pmuludq	%xmm6, %xmm9
   365cd:      	movdqa	%xmm12, %xmm10
   365d2:      	psrlq	$0x20, %xmm10
   365d8:      	pmuludq	%xmm4, %xmm10
   365dd:      	paddq	%xmm9, %xmm10
   365e2:      	psllq	$0x20, %xmm10
   365e8:      	pmuludq	%xmm4, %xmm12
   365ed:      	paddq	%xmm10, %xmm12
   365f2:      	movdqa	%xmm13, %xmm9
   365f7:      	pmuludq	%xmm6, %xmm9
   365fc:      	movdqa	%xmm13, %xmm10
   36601:      	psrlq	$0x20, %xmm10
   36607:      	pmuludq	%xmm4, %xmm10
   3660c:      	paddq	%xmm9, %xmm10
   36611:      	psllq	$0x20, %xmm10
   36617:      	pmuludq	%xmm4, %xmm13
   3661c:      	paddq	%xmm10, %xmm13
   36621:      	movdqa	%xmm15, %xmm9
   36626:      	pmuludq	%xmm6, %xmm9
   3662b:      	movdqa	%xmm15, %xmm10
   36630:      	psrlq	$0x20, %xmm10
   36636:      	pmuludq	%xmm4, %xmm10
   3663b:      	paddq	%xmm9, %xmm10
   36640:      	psllq	$0x20, %xmm10
   36646:      	pmuludq	%xmm4, %xmm15
   3664b:      	paddq	%xmm10, %xmm15
   36650:      	movdqa	%xmm1, %xmm9
   36655:      	pmuludq	%xmm6, %xmm9
   3665a:      	movdqa	%xmm1, %xmm10
   3665f:      	psrlq	$0x20, %xmm10
   36665:      	pmuludq	%xmm4, %xmm10
   3666a:      	paddq	%xmm9, %xmm10
   3666f:      	psllq	$0x20, %xmm10
   36675:      	pmuludq	%xmm4, %xmm1
   36679:      	paddq	%xmm10, %xmm1
   3667e:      	movdqa	%xmm2, %xmm9
   36683:      	pmuludq	%xmm6, %xmm9
   36688:      	movdqa	%xmm2, %xmm10
   3668d:      	psrlq	$0x20, %xmm10
   36693:      	pmuludq	%xmm4, %xmm10
   36698:      	paddq	%xmm9, %xmm10
   3669d:      	psllq	$0x20, %xmm10
   366a3:      	pmuludq	%xmm4, %xmm2
   366a7:      	paddq	%xmm10, %xmm2
   366ac:      	movdqa	%xmm14, %xmm9
   366b1:      	pmuludq	%xmm6, %xmm9
   366b6:      	movdqa	%xmm14, %xmm10
   366bb:      	psrlq	$0x20, %xmm10
   366c1:      	pmuludq	%xmm4, %xmm10
   366c6:      	paddq	%xmm9, %xmm10
   366cb:      	psllq	$0x20, %xmm10
   366d1:      	pmuludq	%xmm4, %xmm14
   366d6:      	paddq	%xmm10, %xmm14
   366db:      	movdqa	%xmm11, %xmm9
   366e0:      	pmuludq	%xmm6, %xmm9
   366e5:      	movdqa	%xmm11, %xmm10
   366ea:      	psrlq	$0x20, %xmm10
   366f0:      	pmuludq	%xmm4, %xmm10
   366f5:      	paddq	%xmm9, %xmm10
   366fa:      	psllq	$0x20, %xmm10
   36700:      	pmuludq	%xmm4, %xmm11
   36705:      	paddq	%xmm10, %xmm11
   3670a:      	movdqa	%xmm8, %xmm9
   3670f:      	pmuludq	%xmm6, %xmm9
   36714:      	movdqa	%xmm8, %xmm10
   36719:      	psrlq	$0x20, %xmm10
   3671f:      	pmuludq	%xmm4, %xmm10
   36724:      	paddq	%xmm9, %xmm10
   36729:      	psllq	$0x20, %xmm10
   3672f:      	pmuludq	%xmm4, %xmm8
   36734:      	paddq	%xmm10, %xmm8
   36739:      	movdqa	%xmm12, %xmm9
   3673e:      	psrlq	$0x1f, %xmm9
   36744:      	pxor	%xmm12, %xmm9
   36749:      	movdqa	%xmm13, %xmm10
   3674e:      	psrlq	$0x1f, %xmm10
   36754:      	pxor	%xmm13, %xmm10
   36759:      	movdqa	%xmm15, %xmm13
   3675e:      	psrlq	$0x1f, %xmm13
   36764:      	pxor	%xmm15, %xmm13
   36769:      	movdqa	%xmm1, %xmm12
   3676e:      	psrlq	$0x1f, %xmm12
   36774:      	pxor	%xmm1, %xmm12
   36779:      	movdqa	%xmm2, %xmm15
   3677e:      	psrlq	$0x1f, %xmm15
   36784:      	pxor	%xmm2, %xmm15
   36789:      	movdqa	%xmm14, %xmm2
   3678e:      	psrlq	$0x1f, %xmm2
   36793:      	pxor	%xmm14, %xmm2
   36798:      	movdqa	%xmm11, %xmm14
   3679d:      	psrlq	$0x1f, %xmm14
   367a3:      	pxor	%xmm11, %xmm14
   367a8:      	movdqa	%xmm8, %xmm1
   367ad:      	psrlq	$0x1f, %xmm1
   367b2:      	pxor	%xmm8, %xmm1
   367b7:      	movdqa	-0x27f9f(%rip), %xmm6   # 0xe820 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x660>
   367bf:      	movdqa	%xmm7, %xmm0
   367c3:      	movdqa	%xmm6, %xmm7
   367c7:      	pand	%xmm6, %xmm1
   367cb:      	pand	%xmm6, %xmm14
   367d0:      	packuswb	%xmm14, %xmm1
   367d5:      	movdqa	-0x70(%rbp), %xmm6
   367da:      	pand	%xmm7, %xmm2
   367de:      	pand	%xmm7, %xmm15
   367e3:      	packuswb	%xmm15, %xmm2
   367e8:      	movdqa	-0x80(%rbp), %xmm11
   367ee:      	packuswb	%xmm2, %xmm1
   367f2:      	pand	%xmm7, %xmm12
   367f7:      	pand	%xmm7, %xmm13
   367fc:      	packuswb	%xmm13, %xmm12
   36801:      	movdqa	-0x90(%rbp), %xmm8
   3680a:      	pand	%xmm7, %xmm10
   3680f:      	pand	%xmm7, %xmm9
   36814:      	movdqa	%xmm0, %xmm7
   36818:      	packuswb	%xmm9, %xmm10
   3681d:      	movdqa	-0xb0(%rbp), %xmm9
   36826:      	packuswb	%xmm10, %xmm12
   3682b:      	movdqa	-0xa0(%rbp), %xmm2
   36833:      	packuswb	%xmm12, %xmm1
   36838:      	movdqa	-0x60(%rbp), %xmm0
   3683d:      	movdqu	%xmm1, -0xfd2(%rbp,%rcx)
   36846:      	addq	$0x10, %rcx
   3684a:      	movdqa	-0x27b32(%rip), %xmm1   # 0xed20 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x4a0>
   36852:      	paddq	%xmm1, %xmm0
   36856:      	paddq	%xmm1, %xmm7
   3685a:      	paddq	%xmm1, %xmm6
   3685e:      	paddq	%xmm1, %xmm5
   36862:      	paddq	%xmm1, %xmm9
   36867:      	paddq	%xmm1, %xmm11
   3686c:      	paddq	%xmm1, %xmm8
   36871:      	paddq	%xmm1, %xmm2
   36875:      	cmpq	$0x440, %rcx            # imm = 0x440
   3687c:      	jne	0x362b0 <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>+0x250>
   36882:      	movq	%r13, %r12
   36885:      	movq	%rax, (%r13)
   36889:      	movl	$0x440, %edx            # imm = 0x440
   3688e:      	leaq	-0x1ef2(%rbp), %r13
   36895:      	movq	%r13, %rdi
   36898:      	leaq	-0xfd2(%rbp), %rsi
   3689f:      	callq	0xc5af0 <memcpy>
   368a4:      	testq	%r14, %r14
   368a7:      	jne	0x360e0 <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>+0x80>
   368ad:      	movl	$0x440, %edx            # imm = 0x440
   368b2:      	movq	%r13, %rdi
   368b5:      	leaq	-0x4f0(%rbp), %rsi
   368bc:      	callq	0xc5af0 <memcpy>
   368c1:      	jmp	0x360e0 <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>+0x80>
   368c6:      	movq	-0x38(%rbp), %rax
   368ca:      	movq	-0x30(%rbp), %rcx
   368ce:      	movq	%rcx, (%rax)
   368d1:      	addq	$0x3d18, %rsp           # imm = 0x3D18
   368d8:      	popq	%rbx
   368d9:      	popq	%r12
   368db:      	popq	%r13
   368dd:      	popq	%r14
   368df:      	popq	%r15
   368e1:      	popq	%rbp
   368e2:      	retq
   368e3:      	movzbl	-0xfd1(%rbp), %eax
   368ea:      	movb	%al, -0x1ab2(%rbp)
   368f0:      	leaq	-0x26da3(%rip), %rdi    # 0xfb54 <anon.b0fa440d1b3fd0947bcb9be5aef6393f.6.llvm.11432899387189510236>
   368f7:      	leaq	0x90d22(%rip), %rcx     # 0xc7620 <anon.b0fa440d1b3fd0947bcb9be5aef6393f.5.llvm.11432899387189510236>
   368fe:      	leaq	0x90d03(%rip), %r8      # 0xc7608 <anon.b0fa440d1b3fd0947bcb9be5aef6393f.4.llvm.11432899387189510236>
   36905:      	leaq	-0x1ab2(%rbp), %rdx
   3690c:      	movl	$0x2b, %esi
   36911:      	callq	0xbf2c0 <core::result::unwrap_failed>
   36916:      	ud2
   36918:      	jmp	0x3691a <<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}> as core::iter::traits::iterator::Iterator>::fold::<(), core::iter::traits::iterator::Iterator::for_each::call<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), <alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>::extend_trusted<core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>::{closure#0}>::{closure#0}>+0x8ba>
   3691a:      	movq	-0x38(%rbp), %rcx
   3691e:      	movq	-0x30(%rbp), %rdx
   36922:      	movq	%rdx, (%rcx)
   36925:      	movq	%rax, %rdi
   36928:      	callq	0xb9f20 <_Unwind_Resume>
   3692d:      	int3
   3692e:      	int3
   3692f:      	int3

00000000000467c0 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>>:
   467c0:      	pushq	%rbp
   467c1:      	movq	%rsp, %rbp
   467c4:      	pushq	%r15
   467c6:      	pushq	%r14
   467c8:      	pushq	%r13
   467ca:      	pushq	%r12
   467cc:      	pushq	%rbx
   467cd:      	subq	$0x1000, %rsp           # imm = 0x1000
   467d4:      	movq	$0x0, (%rsp)
   467dc:      	subq	$0x1000, %rsp           # imm = 0x1000
   467e3:      	movq	$0x0, (%rsp)
   467eb:      	subq	$0xee8, %rsp            # imm = 0xEE8
   467f2:      	movq	%rdi, -0x198(%rbp)
   467f9:      	movq	%rsi, -0x190(%rbp)
   46800:      	movq	%rcx, -0x158(%rbp)
   46807:      	movq	%r8, -0x150(%rbp)
   4680e:      	movq	%rdx, -0xd8(%rbp)
   46815:      	movq	%rdx, -0x10d0(%rbp)
   4681c:      	leaq	-0x158(%rbp), %rax
   46823:      	movq	%rax, -0x10c8(%rbp)
   4682a:      	movq	$0x0, -0x10c0(%rbp)
   46835:      	movq	$0x3e8, -0x10b8(%rbp)   # imm = 0x3E8
   46840:      	leaq	-0x110(%rbp), %rdi
   46847:      	leaq	-0x10d0(%rbp), %rsi
   4684e:      	callq	0x31870 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#0}>::{closure#0}>>>::from_iter>
   46853:      	movq	-0x110(%rbp), %rax
   4685a:      	movq	-0x108(%rbp), %rsi
   46861:      	movq	-0x100(%rbp), %rcx
   46868:      	imulq	$0xf22, %rcx, %rdx      # imm = 0xF22
   4686f:      	addq	%rsi, %rdx
   46872:      	movq	%rsi, -0x90(%rbp)
   46879:      	movq	%rsi, -0x88(%rbp)
   46880:      	movq	%rax, -0x80(%rbp)
   46884:      	movq	%rdx, -0x78(%rbp)
   46888:      	testq	%rcx, %rcx
   4688b:      	je	0x469b1 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x1f1>
   46891:      	leaq	-0x2f10(%rbp), %r14
   46898:      	leaq	-0x10d0(%rbp), %r15
   4689f:      	leaq	-0x1ff0(%rbp), %r12
   468a6:      	leaq	-0x1510(%rbp), %r13
   468ad:      	leaq	-0x70(%rbp), %rbx
   468b1:      	nopw	%cs:(%rax,%rax)
   468c0:      	leaq	0xf22(%rsi), %rax
   468c7:      	movq	%rax, -0x88(%rbp)
   468ce:      	cmpb	$0x2, (%rsi)
   468d1:      	je	0x469b1 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x1f1>
   468d7:      	addq	$0x2, %rsi
   468db:      	movl	$0xf20, %edx            # imm = 0xF20
   468e0:      	movq	%r14, %rdi
   468e3:      	callq	0xc5af0 <memcpy>
   468e8:      	movl	$0xf20, %edx            # imm = 0xF20
   468ed:      	movq	%r15, %rdi
   468f0:      	movq	%r14, %rsi
   468f3:      	callq	0xc5af0 <memcpy>
   468f8:      	xorl	%eax, %eax
   468fa:      	xorl	%ecx, %ecx
   468fc:      	movq	%rbx, %rsi
   468ff:      	cpuid
   46901:      	xchgq	%rbx, %rsi
   46904:      	rdtsc
   46906:      	movl	$0xae0, %edx            # imm = 0xAE0
   4690b:      	movq	%r12, %rdi
   4690e:      	movq	%r15, %rsi
   46911:      	callq	0xc5af0 <memcpy>
   46916:      	movl	$0x440, %edx            # imm = 0x440
   4691b:      	movq	%r13, %rdi
   4691e:      	leaq	-0x5f0(%rbp), %rsi
   46925:      	callq	0xc5af0 <memcpy>
   4692a:      	movl	$0x440, %ecx            # imm = 0x440
   4692f:      	movq	%rbx, %rdi
   46932:      	movq	%r12, %rsi
   46935:      	movq	%r13, %rdx
   46938:      	callq	0x58150 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>
   4693d:      	cmpb	$0x1, -0x70(%rbp)
   46941:      	je	0x47659 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xe99>
   46947:      	leaq	-0x6f(%rbp), %rax
   4694b:      	movups	(%rax), %xmm0
   4694e:      	movupd	0x10(%rax), %xmm1
   46953:      	movapd	%xmm1, -0xc0(%rbp)
   4695b:      	movaps	%xmm0, -0xd0(%rbp)
   46962:      	leaq	-0xd0(%rbp), %rax
   46969:      	xorpd	%xmm1, %xmm1
   4696d:      	movapd	%xmm1, -0x70(%rbp)
   46972:      	movaps	-0x70(%rbp), %xmm0
   46976:      	movaps	%xmm0, -0xd0(%rbp)
   4697d:      	movapd	%xmm1, -0x70(%rbp)
   46982:      	movapd	-0x70(%rbp), %xmm0
   46987:      	leaq	-0xc0(%rbp), %rax
   4698e:      	movupd	%xmm0, (%rax)
   46992:      	xorl	%ecx, %ecx
   46994:      	xorl	%eax, %eax
   46996:      	movq	%rbx, %rsi
   46999:      	cpuid
   4699b:      	xchgq	%rbx, %rsi
   4699e:      	rdtsc
   469a0:      	movq	-0x88(%rbp), %rsi
   469a7:      	cmpq	-0x78(%rbp), %rsi
   469ab:      	jne	0x468c0 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x100>
   469b1:      	leaq	-0x90(%rbp), %rdi
   469b8:      	callq	0x35a30 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>>
   469bd:      	movl	$0x8, %ebx
   469c2:      	movl	$0x13880, %edi          # imm = 0x13880
   469c7:      	movl	$0x8, %esi
   469cc:      	callq	0xbc970 <<core::alloc::layout::Layout>::is_size_alignment_valid>
   469d1:      	testb	%al, %al
   469d3:      	je	0x476ea <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf2a>
   469d9:      	callq	0x4a3b0 <__rustc::__rust_no_alloc_shim_is_unstable_v2>
   469de:      	movl	$0x13880, %edi          # imm = 0x13880
   469e3:      	movl	$0x8, %esi
   469e8:      	callq	0x4a370 <__rustc::__rust_alloc>
   469ed:      	testq	%rax, %rax
   469f0:      	je	0x476ec <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf2c>
   469f6:      	movq	$0x2710, -0xf0(%rbp)    # imm = 0x2710
   46a01:      	movq	%rax, -0xe8(%rbp)
   46a08:      	movq	$0x0, -0xe0(%rbp)
   46a13:      	movl	$0x2710, %eax           # imm = 0x2710
   46a18:      	leaq	-0x10d0(%rbp), %r12
   46a1f:      	nop
   46a20:      	cmpq	$0x3e8, %rax            # imm = 0x3E8
   46a26:      	movl	$0x3e8, %ecx            # imm = 0x3E8
   46a2b:      	movq	%rax, -0x38(%rbp)
   46a2f:      	cmovbq	%rax, %rcx
   46a33:      	movq	-0xd8(%rbp), %rax
   46a3a:      	movq	%rax, -0x10d0(%rbp)
   46a41:      	leaq	-0x158(%rbp), %rax
   46a48:      	movq	%rax, -0x10c8(%rbp)
   46a4f:      	movq	$0x0, -0x10c0(%rbp)
   46a5a:      	movq	%rcx, -0x120(%rbp)
   46a61:      	movq	%rcx, -0x10b8(%rbp)
   46a68:      	leaq	-0x110(%rbp), %rdi
   46a6f:      	movq	%r12, %rsi
   46a72:      	callq	0x31af0 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#1}>::{closure#0}>>>::from_iter>
   46a77:      	movq	-0x110(%rbp), %rax
   46a7e:      	movq	-0x108(%rbp), %rsi
   46a85:      	movq	-0x100(%rbp), %rcx
   46a8c:      	imulq	$0xf22, %rcx, %rdx      # imm = 0xF22
   46a93:      	addq	%rsi, %rdx
   46a96:      	movq	%rsi, -0x90(%rbp)
   46a9d:      	movq	%rsi, -0x88(%rbp)
   46aa4:      	movq	%rax, -0x80(%rbp)
   46aa8:      	movq	%rdx, -0x78(%rbp)
   46aac:      	testq	%rcx, %rcx
   46aaf:      	jne	0x46b18 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x358>
   46ab1:      	leaq	-0x90(%rbp), %rdi
   46ab8:      	callq	0x35a30 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>>
   46abd:      	movq	-0x38(%rbp), %rax
   46ac1:      	subq	-0x120(%rbp), %rax
   46ac8:      	jne	0x46a20 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x260>
   46ace:      	jmp	0x46c61 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x4a1>
   46ad3:      	nopw	%cs:(%rax,%rax)
   46ae0:      	movapd	-0xa0(%rbp), %xmm1
   46ae8:      	movapd	%xmm1, %xmm0
   46aec:      	unpckhpd	%xmm1, %xmm0            # xmm0 = xmm0[1],xmm1[1]
   46af0:      	addsd	%xmm1, %xmm0
   46af4:      	movq	-0xe8(%rbp), %rax
   46afb:      	movsd	%xmm0, (%rax,%r14,8)
   46b01:      	incq	%r14
   46b04:      	movq	%r14, -0xe0(%rbp)
   46b0b:      	movq	-0x88(%rbp), %rsi
   46b12:      	cmpq	-0x78(%rbp), %rsi
   46b16:      	je	0x46ab1 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x2f1>
   46b18:      	leaq	0xf22(%rsi), %rax
   46b1f:      	movq	%rax, -0x88(%rbp)
   46b26:      	cmpb	$0x2, (%rsi)
   46b29:      	je	0x46ab1 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x2f1>
   46b2b:      	addq	$0x2, %rsi
   46b2f:      	movl	$0xf20, %edx            # imm = 0xF20
   46b34:      	leaq	-0x2f10(%rbp), %r14
   46b3b:      	movq	%r14, %rdi
   46b3e:      	callq	0xc5af0 <memcpy>
   46b43:      	movl	$0xf20, %edx            # imm = 0xF20
   46b48:      	movq	%r12, %rdi
   46b4b:      	movq	%r14, %rsi
   46b4e:      	callq	0xc5af0 <memcpy>
   46b53:      	xorl	%eax, %eax
   46b55:      	xorl	%ecx, %ecx
   46b57:      	movq	%rbx, %rsi
   46b5a:      	cpuid
   46b5c:      	xchgq	%rbx, %rsi
   46b5f:      	rdtsc
   46b61:      	movq	%rdx, %r15
   46b64:      	movq	%rax, %r14
   46b67:      	movl	$0xae0, %edx            # imm = 0xAE0
   46b6c:      	leaq	-0x1ff0(%rbp), %rbx
   46b73:      	movq	%rbx, %rdi
   46b76:      	movq	%r12, %rsi
   46b79:      	callq	0xc5af0 <memcpy>
   46b7e:      	movl	$0x440, %edx            # imm = 0x440
   46b83:      	leaq	-0x1510(%rbp), %r13
   46b8a:      	movq	%r13, %rdi
   46b8d:      	leaq	-0x5f0(%rbp), %rsi
   46b94:      	callq	0xc5af0 <memcpy>
   46b99:      	movl	$0x440, %ecx            # imm = 0x440
   46b9e:      	leaq	-0x70(%rbp), %rdi
   46ba2:      	movq	%rbx, %rsi
   46ba5:      	movq	%r13, %rdx
   46ba8:      	callq	0x58150 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>
   46bad:      	cmpb	$0x1, -0x70(%rbp)
   46bb1:      	je	0x475f2 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xe32>
   46bb7:      	shlq	$0x20, %r15
   46bbb:      	orq	%r15, %r14
   46bbe:      	leaq	-0x6f(%rbp), %rax
   46bc2:      	movups	(%rax), %xmm0
   46bc5:      	movupd	0x10(%rax), %xmm1
   46bca:      	movapd	%xmm1, -0xc0(%rbp)
   46bd2:      	movaps	%xmm0, -0xd0(%rbp)
   46bd9:      	leaq	-0xd0(%rbp), %rax
   46be0:      	xorpd	%xmm1, %xmm1
   46be4:      	movapd	%xmm1, -0x70(%rbp)
   46be9:      	movaps	-0x70(%rbp), %xmm0
   46bed:      	movaps	%xmm0, -0xd0(%rbp)
   46bf4:      	movapd	%xmm1, -0x70(%rbp)
   46bf9:      	movaps	-0x70(%rbp), %xmm0
   46bfd:      	leaq	-0xc0(%rbp), %rax
   46c04:      	movups	%xmm0, (%rax)
   46c07:      	xorl	%eax, %eax
   46c09:      	xorl	%ecx, %ecx
   46c0b:      	movq	%rbx, %rsi
   46c0e:      	cpuid
   46c10:      	xchgq	%rbx, %rsi
   46c13:      	rdtsc
   46c15:      	shlq	$0x20, %rdx
   46c19:      	orq	%rax, %rdx
   46c1c:      	subq	%r14, %rdx
   46c1f:      	movq	%rdx, %xmm0
   46c24:      	punpckldq	-0x3844c(%rip), %xmm0 # xmm0 = xmm0[0],mem[0],xmm0[1],mem[1]
                                                # 0xe7e0 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x620>
   46c2c:      	subpd	-0x38594(%rip), %xmm0   # 0xe6a0 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x4e0>
   46c34:      	movapd	%xmm0, -0xa0(%rbp)
   46c3c:      	movq	-0xe0(%rbp), %r14
   46c43:      	cmpq	-0xf0(%rbp), %r14
   46c4a:      	jne	0x46ae0 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x320>
   46c50:      	leaq	-0xf0(%rbp), %rdi
   46c57:      	callq	0x36a90 <<alloc::raw_vec::RawVec<f64>>::grow_one>
   46c5c:      	jmp	0x46ae0 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x320>
   46c61:      	movq	-0xe8(%rbp), %rbx
   46c68:      	movq	-0xe0(%rbp), %r14
   46c6f:      	leaq	-0x2a(%rbp), %rax
   46c73:      	movq	%rax, -0x10d0(%rbp)
   46c7a:      	cmpq	$0x2, %r14
   46c7e:      	jae	0x4768e <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xece>
   46c84:      	leaq	-0xf0(%rbp), %rax
   46c8b:      	movq	%rax, -0x10d0(%rbp)
   46c92:      	movq	$0x0, -0x10c8(%rbp)
   46c9d:      	movq	$0x64, -0x10c0(%rbp)
   46ca8:      	leaq	-0x170(%rbp), %rdi
   46caf:      	leaq	-0x10d0(%rbp), %rsi
   46cb6:      	callq	0x31c30 <<alloc::vec::Vec<f64> as alloc::vec::spec_from_iter::SpecFromIter<f64, core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#2}>>>::from_iter>
   46cbb:      	xorpd	%xmm0, %xmm0
   46cbf:      	movapd	%xmm0, -0x70(%rbp)
   46cc4:      	movapd	%xmm0, -0x60(%rbp)
   46cc9:      	movapd	%xmm0, -0x50(%rbp)
   46cce:      	movapd	%xmm0, -0x10d0(%rbp)
   46cd6:      	movapd	%xmm0, -0x10c0(%rbp)
   46cde:      	movapd	%xmm0, -0x10b0(%rbp)
   46ce6:      	movl	$0x12c0, %edi           # imm = 0x12C0
   46ceb:      	movl	$0x8, %esi
   46cf0:      	callq	0xbc970 <<core::alloc::layout::Layout>::is_size_alignment_valid>
   46cf5:      	testb	%al, %al
   46cf7:      	je	0x476f9 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf39>
   46cfd:      	callq	0x4a3b0 <__rustc::__rust_no_alloc_shim_is_unstable_v2>
   46d02:      	movl	$0x8, %ebx
   46d07:      	movl	$0x12c0, %edi           # imm = 0x12C0
   46d0c:      	movl	$0x8, %esi
   46d11:      	callq	0x4a370 <__rustc::__rust_alloc>
   46d16:      	testq	%rax, %rax
   46d19:      	je	0x476fb <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf3b>
   46d1f:      	xorl	%ecx, %ecx
   46d21:      	nopw	%cs:(%rax,%rax)
   46d30:      	movaps	-0x10d0(%rbp), %xmm0
   46d37:      	movaps	-0x10c0(%rbp), %xmm1
   46d3e:      	movaps	-0x10b0(%rbp), %xmm2
   46d45:      	movups	%xmm2, 0x20(%rax,%rcx)
   46d4a:      	movups	%xmm1, 0x10(%rax,%rcx)
   46d4f:      	movups	%xmm0, (%rax,%rcx)
   46d53:      	movaps	-0x10d0(%rbp), %xmm0
   46d5a:      	movaps	-0x10c0(%rbp), %xmm1
   46d61:      	movaps	-0x10b0(%rbp), %xmm2
   46d68:      	movups	%xmm0, 0x30(%rax,%rcx)
   46d6d:      	movups	%xmm1, 0x40(%rax,%rcx)
   46d72:      	movups	%xmm2, 0x50(%rax,%rcx)
   46d77:      	movapd	-0x10d0(%rbp), %xmm0
   46d7f:      	movapd	-0x10c0(%rbp), %xmm1
   46d87:      	movaps	-0x10b0(%rbp), %xmm2
   46d8e:      	movupd	%xmm0, 0x60(%rax,%rcx)
   46d94:      	movupd	%xmm1, 0x70(%rax,%rcx)
   46d9a:      	movups	%xmm2, 0x80(%rax,%rcx)
   46da2:      	addq	$0x90, %rcx
   46da9:      	cmpq	$0x1290, %rcx           # imm = 0x1290
   46db0:      	jne	0x46d30 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x570>
   46db6:      	movapd	-0x10d0(%rbp), %xmm0
   46dbe:      	movapd	-0x10c0(%rbp), %xmm1
   46dc6:      	movapd	-0x10b0(%rbp), %xmm2
   46dce:      	movupd	%xmm2, 0x20(%rax,%rcx)
   46dd4:      	movupd	%xmm1, 0x10(%rax,%rcx)
   46dda:      	movupd	%xmm0, (%rax,%rcx)
   46ddf:      	movq	$0x64, -0x188(%rbp)
   46dea:      	movq	%rax, -0x180(%rbp)
   46df1:      	movq	$0x64, -0x178(%rbp)
   46dfc:      	movq	%rax, -0x38(%rbp)
   46e00:      	addq	$0x12c0, %rax           # imm = 0x12C0
   46e06:      	movq	%rax, -0x120(%rbp)
   46e0d:      	movl	$0xf4240, %eax          # imm = 0xF4240
   46e12:      	nopw	%cs:(%rax,%rax)
   46e20:      	cmpq	$0x3e8, %rax            # imm = 0x3E8
   46e26:      	movl	$0x3e8, %ecx            # imm = 0x3E8
   46e2b:      	movq	%rax, -0x130(%rbp)
   46e32:      	cmovbq	%rax, %rcx
   46e36:      	movq	-0xd8(%rbp), %rax
   46e3d:      	movq	%rax, -0x10d0(%rbp)
   46e44:      	leaq	-0x158(%rbp), %rax
   46e4b:      	movq	%rax, -0x10c8(%rbp)
   46e52:      	movq	$0x0, -0x10c0(%rbp)
   46e5d:      	movq	%rcx, -0x128(%rbp)
   46e64:      	movq	%rcx, -0x10b8(%rbp)
   46e6b:      	leaq	-0x148(%rbp), %rdi
   46e72:      	leaq	-0x10d0(%rbp), %rsi
   46e79:      	callq	0x319b0 <<alloc::vec::Vec<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))> as alloc::vec::spec_from_iter::SpecFromIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088])), core::iter::adapters::map::Map<core::ops::range::Range<usize>, crypto_constant_time::constant_time::measured<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}, crypto_constant_time::constant_time::measure<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>::{closure#3}>::{closure#0}>>>::from_iter>
   46e7e:      	movq	-0x148(%rbp), %rax
   46e85:      	movq	-0x140(%rbp), %rsi
   46e8c:      	movq	-0x138(%rbp), %rcx
   46e93:      	imulq	$0xf22, %rcx, %rdx      # imm = 0xF22
   46e9a:      	addq	%rsi, %rdx
   46e9d:      	movq	%rsi, -0x110(%rbp)
   46ea4:      	movq	%rsi, -0x108(%rbp)
   46eab:      	movq	%rax, -0x100(%rbp)
   46eb2:      	movq	%rdx, -0xf8(%rbp)
   46eb9:      	testq	%rcx, %rcx
   46ebc:      	jne	0x46f00 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x740>
   46ebe:      	leaq	-0x110(%rbp), %rdi
   46ec5:      	callq	0x35a30 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>>
   46eca:      	movq	-0x130(%rbp), %rax
   46ed1:      	subq	-0x128(%rbp), %rax
   46ed8:      	jne	0x46e20 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x660>
   46ede:      	jmp	0x4717d <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x9bd>
   46ee3:      	nopw	%cs:(%rax,%rax)
   46ef0:      	movq	-0x108(%rbp), %rsi
   46ef7:      	cmpq	-0xf8(%rbp), %rsi
   46efe:      	je	0x46ebe <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x6fe>
   46f00:      	leaq	0xf22(%rsi), %rax
   46f07:      	movq	%rax, -0x108(%rbp)
   46f0e:      	movzbl	(%rsi), %r15d
   46f12:      	cmpq	$0x2, %r15
   46f16:      	je	0x46ebe <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x6fe>
   46f18:      	addq	$0x2, %rsi
   46f1c:      	movl	$0xf20, %edx            # imm = 0xF20
   46f21:      	leaq	-0x2f10(%rbp), %rbx
   46f28:      	movq	%rbx, %rdi
   46f2b:      	callq	0xc5af0 <memcpy>
   46f30:      	movl	$0xf20, %edx            # imm = 0xF20
   46f35:      	leaq	-0x10d0(%rbp), %r12
   46f3c:      	movq	%r12, %rdi
   46f3f:      	movq	%rbx, %rsi
   46f42:      	callq	0xc5af0 <memcpy>
   46f47:      	xorl	%eax, %eax
   46f49:      	xorl	%ecx, %ecx
   46f4b:      	movq	%rbx, %rsi
   46f4e:      	cpuid
   46f50:      	xchgq	%rbx, %rsi
   46f53:      	rdtsc
   46f55:      	movq	%rdx, %r14
   46f58:      	movq	%rax, %rbx
   46f5b:      	movl	$0xae0, %edx            # imm = 0xAE0
   46f60:      	leaq	-0x1ff0(%rbp), %r13
   46f67:      	movq	%r13, %rdi
   46f6a:      	movq	%r12, %rsi
   46f6d:      	callq	0xc5af0 <memcpy>
   46f72:      	movl	$0x440, %edx            # imm = 0x440
   46f77:      	leaq	-0x1510(%rbp), %r12
   46f7e:      	movq	%r12, %rdi
   46f81:      	leaq	-0x5f0(%rbp), %rsi
   46f88:      	callq	0xc5af0 <memcpy>
   46f8d:      	movl	$0x440, %ecx            # imm = 0x440
   46f92:      	leaq	-0xd0(%rbp), %rdi
   46f99:      	movq	%r13, %rsi
   46f9c:      	movq	%r12, %rdx
   46f9f:      	callq	0x58150 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>
   46fa4:      	cmpb	$0x1, -0xd0(%rbp)
   46fab:      	je	0x47627 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xe67>
   46fb1:      	shlq	$0x20, %r14
   46fb5:      	orq	%r14, %rbx
   46fb8:      	leaq	-0xcf(%rbp), %rax
   46fbf:      	movups	(%rax), %xmm0
   46fc2:      	movups	0x10(%rax), %xmm1
   46fc6:      	movaps	%xmm1, -0x80(%rbp)
   46fca:      	movaps	%xmm0, -0x90(%rbp)
   46fd1:      	leaq	-0x90(%rbp), %rax
   46fd8:      	xorps	%xmm1, %xmm1
   46fdb:      	movaps	%xmm1, -0xd0(%rbp)
   46fe2:      	movaps	-0xd0(%rbp), %xmm0
   46fe9:      	movaps	%xmm0, -0x90(%rbp)
   46ff0:      	movaps	%xmm1, -0xd0(%rbp)
   46ff7:      	movaps	-0xd0(%rbp), %xmm0
   46ffe:      	leaq	-0x80(%rbp), %rax
   47002:      	movups	%xmm0, (%rax)
   47005:      	xorl	%ecx, %ecx
   47007:      	xorl	%eax, %eax
   47009:      	movq	%rbx, %rsi
   4700c:      	cpuid
   4700e:      	xchgq	%rbx, %rsi
   47011:      	rdtsc
   47013:      	shlq	$0x20, %rdx
   47017:      	orq	%rax, %rdx
   4701a:      	subq	%rbx, %rdx
   4701d:      	movq	%rdx, %xmm0
   47022:      	punpckldq	-0x3884a(%rip), %xmm0 # xmm0 = xmm0[0],mem[0],xmm0[1],mem[1]
                                                # 0xe7e0 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x620>
   4702a:      	subpd	-0x38992(%rip), %xmm0   # 0xe6a0 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x4e0>
   47032:      	movapd	%xmm0, %xmm4
   47036:      	unpckhpd	%xmm0, %xmm4            # xmm4 = xmm4[1],xmm0[1]
   4703a:      	addsd	%xmm0, %xmm4
   4703e:      	movl	%r15d, %eax
   47041:      	andl	$0x1, %eax
   47044:      	movsd	-0x60(%rbp,%rax,8), %xmm0
   4704a:      	movsd	-0x70(%rbp,%rax,8), %xmm1
   47050:      	addsd	-0x38298(%rip), %xmm1   # 0xedc0 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x540>
   47058:      	movsd	%xmm1, -0x70(%rbp,%rax,8)
   4705e:      	movapd	%xmm4, %xmm2
   47062:      	subsd	%xmm0, %xmm2
   47066:      	movapd	%xmm2, %xmm3
   4706a:      	divsd	%xmm1, %xmm3
   4706e:      	addsd	%xmm0, %xmm3
   47072:      	movsd	%xmm3, -0x60(%rbp,%rax,8)
   47078:      	movapd	%xmm4, -0xa0(%rbp)
   47080:      	movapd	%xmm4, %xmm0
   47084:      	subsd	%xmm3, %xmm0
   47088:      	mulsd	%xmm2, %xmm0
   4708c:      	addsd	-0x50(%rbp,%rax,8), %xmm0
   47092:      	movsd	%xmm0, -0x50(%rbp,%rax,8)
   47098:      	movq	-0x168(%rbp), %rcx
   4709f:      	movq	-0x160(%rbp), %rax
   470a6:      	leaq	(%rcx,%rax,8), %r8
   470aa:      	leaq	-0x1ff0(%rbp), %rdi
   470b1:      	movq	-0x38(%rbp), %rsi
   470b5:      	movq	-0x120(%rbp), %rdx
   470bc:      	callq	0x34d40 <<core::iter::adapters::zip::Zip<core::slice::iter::IterMut<crypto_constant_time::constant_time::Welch>, core::slice::iter::Iter<f64>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::IterMut<crypto_constant_time::constant_time::Welch>, core::slice::iter::Iter<f64>>>::new>
   470c1:      	movq	-0x1fd0(%rbp), %rax
   470c8:      	movq	-0x1fc8(%rbp), %rcx
   470cf:      	cmpq	%rcx, %rax
   470d2:      	movsd	-0x3831a(%rip), %xmm4   # 0xedc0 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x540>
   470da:      	movapd	-0xa0(%rbp), %xmm5
   470e2:      	jae	0x46ef0 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x730>
   470e8:      	movq	-0x1ff0(%rbp), %rsi
   470ef:      	movq	-0x1fe0(%rbp), %rdx
   470f6:      	andl	$0x1, %r15d
   470fa:      	movq	%rax, %rdi
   470fd:      	shlq	$0x4, %rdi
   47101:      	leaq	(%rdi,%rdi,2), %rdi
   47105:      	leaq	(%rdi,%r15,8), %rdi
   47109:      	addq	%rdi, %rsi
   4710c:      	addq	$0x20, %rsi
   47110:      	jmp	0x47130 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x970>
   47112:      	nopw	%cs:(%rax,%rax)
   47120:      	incq	%rax
   47123:      	addq	$0x30, %rsi
   47127:      	cmpq	%rax, %rcx
   4712a:      	je	0x46ef0 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x730>
   47130:      	movsd	(%rdx,%rax,8), %xmm0
   47135:      	ucomisd	%xmm5, %xmm0
   47139:      	jb	0x47120 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x960>
   4713b:      	movsd	-0x10(%rsi), %xmm0
   47140:      	movsd	-0x20(%rsi), %xmm1
   47145:      	addsd	%xmm4, %xmm1
   47149:      	movsd	%xmm1, -0x20(%rsi)
   4714e:      	movapd	%xmm5, %xmm2
   47152:      	subsd	%xmm0, %xmm2
   47156:      	movapd	%xmm2, %xmm3
   4715a:      	divsd	%xmm1, %xmm3
   4715e:      	addsd	%xmm0, %xmm3
   47162:      	movsd	%xmm3, -0x10(%rsi)
   47167:      	movapd	%xmm5, %xmm0
   4716b:      	subsd	%xmm3, %xmm0
   4716f:      	mulsd	%xmm2, %xmm0
   47173:      	addsd	(%rsi), %xmm0
   47177:      	movsd	%xmm0, (%rsi)
   4717b:      	jmp	0x47120 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x960>
   4717d:      	movsd	-0x60(%rbp), %xmm0
   47182:      	subsd	-0x58(%rbp), %xmm0
   47187:      	movapd	%xmm0, -0x120(%rbp)
   4718f:      	movsd	-0x50(%rbp), %xmm0
   47194:      	movsd	%xmm0, -0xa0(%rbp)
   4719c:      	movsd	-0x70(%rbp), %xmm0
   471a1:      	movsd	%xmm0, -0x128(%rbp)
   471a9:      	movsd	-0x68(%rbp), %xmm0
   471ae:      	movsd	%xmm0, -0x130(%rbp)
   471b6:      	movsd	-0x48(%rbp), %xmm0
   471bb:      	movsd	%xmm0, -0xd8(%rbp)
   471c3:      	movl	$0x3, %edi
   471c8:      	movl	$0x1, %esi
   471cd:      	callq	0xbc970 <<core::alloc::layout::Layout>::is_size_alignment_valid>
   471d2:      	testb	%al, %al
   471d4:      	je	0x4770a <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf4a>
   471da:      	callq	0x4a3b0 <__rustc::__rust_no_alloc_shim_is_unstable_v2>
   471df:      	movl	$0x1, %ebx
   471e4:      	movl	$0x3, %edi
   471e9:      	movl	$0x1, %esi
   471ee:      	callq	0x4a370 <__rustc::__rust_alloc>
   471f3:      	testq	%rax, %rax
   471f6:      	je	0x4770c <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf4c>
   471fc:      	leaq	-0x37317(%rip), %rcx    # 0xfeec <anon.c0f308983206626af30a745d03c91a10.7.llvm.12480394386067567631+0x197>
   47203:      	movq	%rax, %rdx
   47206:      	subq	%rcx, %rdx
   47209:      	subq	%rax, %rcx
   4720c:      	cmovbq	%rdx, %rcx
   47210:      	cmpq	$0x2, %rcx
   47214:      	jbe	0x476bc <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xefc>
   4721a:      	movsd	-0x384aa(%rip), %xmm5   # 0xed78 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x4f8>
   47222:      	movsd	-0x128(%rbp), %xmm2
   4722a:      	movapd	%xmm2, %xmm0
   4722e:      	addsd	%xmm5, %xmm0
   47232:      	movsd	-0xa0(%rbp), %xmm1
   4723a:      	divsd	%xmm0, %xmm1
   4723e:      	divsd	%xmm2, %xmm1
   47242:      	movsd	-0x130(%rbp), %xmm3
   4724a:      	movapd	%xmm3, %xmm0
   4724e:      	addsd	%xmm5, %xmm0
   47252:      	movsd	-0xd8(%rbp), %xmm2
   4725a:      	divsd	%xmm0, %xmm2
   4725e:      	divsd	%xmm3, %xmm2
   47262:      	addsd	%xmm1, %xmm2
   47266:      	xorps	%xmm0, %xmm0
   47269:      	sqrtsd	%xmm2, %xmm0
   4726d:      	movapd	-0x120(%rbp), %xmm1
   47275:      	divsd	%xmm0, %xmm1
   47279:      	movapd	-0x38bc1(%rip), %xmm4   # 0xe6c0 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x500>
   47281:      	movapd	%xmm1, -0x120(%rbp)
   47289:      	andpd	%xmm1, %xmm4
   4728d:      	movb	$0x77, 0x2(%rax)
   47291:      	movw	$0x6172, (%rax)         # imm = 0x6172
   47296:      	movsd	%xmm4, -0xd0(%rbp)
   4729e:      	movq	$0x3, -0x1ff0(%rbp)
   472a9:      	movq	%rax, -0x1fe8(%rbp)
   472b0:      	movq	$0x3, -0x1fe0(%rbp)
   472bb:      	movq	-0x168(%rbp), %rbx
   472c2:      	movq	-0x160(%rbp), %r12
   472c9:      	movl	$0x28, %r14d
   472cf:      	xorl	%r13d, %r13d
   472d2:      	movsd	-0x384a2(%rip), %xmm6   # 0xee38 <anon.38808e0998af18ea2dab9aba4957194f.5.llvm.12287912318127236922+0x8>
   472da:      	movapd	-0x38c22(%rip), %xmm7   # 0xe6c0 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x500>
   472e2:      	movq	0x838cf(%rip), %r15     # 0xcabb8
   472e9:      	movq	-0x38(%rbp), %rax
   472ed:      	jmp	0x47308 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xb48>
   472ef:      	nop
   472f0:      	addq	$0x8, %rbx
   472f4:      	addq	$0x30, %r14
   472f8:      	incq	%r13
   472fb:      	cmpq	$0x12e8, %r14           # imm = 0x12E8
   47302:      	je	0x47462 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xca2>
   47308:      	movq	%r13, -0x1510(%rbp)
   4730f:      	movsd	-0x28(%rax,%r14), %xmm1
   47316:      	ucomisd	%xmm6, %xmm1
   4731a:      	jb	0x472f0 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xb30>
   4731c:      	movsd	-0x20(%rax,%r14), %xmm0
   47323:      	ucomisd	%xmm6, %xmm0
   47327:      	jb	0x472f0 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xb30>
   47329:      	movsd	-0x18(%rax,%r14), %xmm8
   47330:      	subsd	-0x10(%rax,%r14), %xmm8
   47337:      	movsd	-0x8(%rax,%r14), %xmm2
   4733e:      	movapd	%xmm1, %xmm3
   47342:      	addsd	%xmm5, %xmm3
   47346:      	divsd	%xmm3, %xmm2
   4734a:      	divsd	%xmm1, %xmm2
   4734e:      	movsd	(%rax,%r14), %xmm1
   47354:      	movapd	%xmm0, %xmm3
   47358:      	addsd	%xmm5, %xmm3
   4735c:      	divsd	%xmm3, %xmm1
   47360:      	divsd	%xmm0, %xmm1
   47364:      	addsd	%xmm2, %xmm1
   47368:      	xorps	%xmm0, %xmm0
   4736b:      	sqrtsd	%xmm1, %xmm0
   4736f:      	divsd	%xmm0, %xmm8
   47374:      	andpd	%xmm7, %xmm8
   47379:      	ucomisd	%xmm4, %xmm8
   4737e:      	jbe	0x472f0 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xb30>
   47384:      	movapd	%xmm8, -0xa0(%rbp)
   4738d:      	cmpq	%r12, %r13
   47390:      	jae	0x476d6 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf16>
   47396:      	leaq	-0x1510(%rbp), %rax
   4739d:      	movq	%rax, -0x10d0(%rbp)
   473a4:      	movq	0x83825(%rip), %rax     # 0xcabd0
   473ab:      	movq	%rax, -0x10c8(%rbp)
   473b2:      	movq	%rbx, -0x10c0(%rbp)
   473b9:      	movq	%r15, -0x10b8(%rbp)
   473c0:      	leaq	-0x2f10(%rbp), %rdi
   473c7:      	leaq	-0x3a55d(%rip), %rsi    # 0xce71 <anon.c0f308983206626af30a745d03c91a10.2.llvm.12480394386067567631+0xfd>
   473ce:      	leaq	-0x10d0(%rbp), %rdx
   473d5:      	callq	0xbbaf0 <alloc::fmt::format::format_inner>
   473da:      	movups	-0x2f10(%rbp), %xmm0
   473e1:      	movaps	%xmm0, -0x1b0(%rbp)
   473e8:      	movq	-0x2f00(%rbp), %rax
   473ef:      	movq	%rax, -0x1a0(%rbp)
   473f6:      	movaps	-0xa0(%rbp), %xmm0
   473fd:      	movsd	%xmm0, -0xd0(%rbp)
   47405:      	movl	$0x1, %esi
   4740a:      	movl	$0x1, %edx
   4740f:      	leaq	-0x1ff0(%rbp), %rdi
   47416:      	callq	0x369c0 <<alloc::raw_vec::RawVecInner>::deallocate>
   4741b:      	movq	-0x1a0(%rbp), %rax
   47422:      	movq	%rax, -0x1fe0(%rbp)
   47429:      	movapd	-0x1b0(%rbp), %xmm0
   47431:      	movapd	%xmm0, -0x1ff0(%rbp)
   47439:      	movapd	-0xa0(%rbp), %xmm4
   47441:      	movq	-0x38(%rbp), %rax
   47445:      	movsd	-0x386d5(%rip), %xmm5   # 0xed78 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x4f8>
   4744d:      	movsd	-0x3861d(%rip), %xmm6   # 0xee38 <anon.38808e0998af18ea2dab9aba4957194f.5.llvm.12287912318127236922+0x8>
   47455:      	movapd	-0x38d9d(%rip), %xmm7   # 0xe6c0 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x500>
   4745d:      	jmp	0x472f0 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xb30>
   47462:      	movsd	-0x3863a(%rip), %xmm0   # 0xee30 <anon.38808e0998af18ea2dab9aba4957194f.5.llvm.12287912318127236922>
   4746a:      	xorl	%eax, %eax
   4746c:      	ucomisd	%xmm4, %xmm0
   47470:      	seta	%al
   47473:      	leaq	-0x3753e(%rip), %rcx    # 0xff3c <anon.c0f308983206626af30a745d03c91a10.7.llvm.12480394386067567631+0x1e7>
   4747a:      	leaq	-0x37592(%rip), %rdx    # 0xfeef <anon.c0f308983206626af30a745d03c91a10.7.llvm.12480394386067567631+0x19a>
   47481:      	cmovaq	%rcx, %rdx
   47485:      	xorq	$0x5, %rax
   47489:      	movq	%rdx, -0x2f10(%rbp)
   47490:      	movq	%rax, -0x2f08(%rbp)
   47497:      	movapd	-0x120(%rbp), %xmm0
   4749f:      	movsd	%xmm0, -0x1510(%rbp)
   474a7:      	leaq	-0x198(%rbp), %rax
   474ae:      	movq	%rax, -0x10d0(%rbp)
   474b5:      	leaq	-0x14b6c(%rip), %rax    # 0x32950 <<&str as core::fmt::Display>::fmt>
   474bc:      	movq	%rax, -0x10c8(%rbp)
   474c3:      	leaq	-0x2f10(%rbp), %rcx
   474ca:      	movq	%rcx, -0x10c0(%rbp)
   474d1:      	movq	%rax, -0x10b8(%rbp)
   474d8:      	leaq	-0xd0(%rbp), %rax
   474df:      	movq	%rax, -0x10b0(%rbp)
   474e6:      	movq	%r15, -0x10a8(%rbp)
   474ed:      	leaq	-0x1ff0(%rbp), %rax
   474f4:      	movq	%rax, -0x10a0(%rbp)
   474fb:      	leaq	0x2c8e(%rip), %rax      # 0x4a190 <<alloc::string::String as core::fmt::Display>::fmt>
   47502:      	movq	%rax, -0x1098(%rbp)
   47509:      	leaq	-0x1510(%rbp), %rax
   47510:      	movq	%rax, -0x1090(%rbp)
   47517:      	movq	%r15, -0x1088(%rbp)
   4751e:      	leaq	-0x70(%rbp), %rax
   47522:      	movq	%rax, -0x1080(%rbp)
   47529:      	movq	%r15, -0x1078(%rbp)
   47530:      	leaq	-0x68(%rbp), %rax
   47534:      	movq	%rax, -0x1070(%rbp)
   4753b:      	movq	%r15, -0x1068(%rbp)
   47542:      	leaq	-0x60(%rbp), %rax
   47546:      	movq	%rax, -0x1060(%rbp)
   4754d:      	movq	%r15, -0x1058(%rbp)
   47554:      	leaq	-0x58(%rbp), %rax
   47558:      	movq	%rax, -0x1050(%rbp)
   4755f:      	movq	%r15, -0x1048(%rbp)
   47566:      	leaq	-0x37605(%rip), %rdi    # 0xff68 <anon.c0f308983206626af30a745d03c91a10.7.llvm.12480394386067567631+0x213>
   4756d:      	leaq	-0x10d0(%rbp), %rsi
   47574:      	movapd	%xmm4, -0xa0(%rbp)
   4757c:      	callq	0x94170 <std::io::stdio::_print>
   47581:      	leaq	-0x1ff0(%rbp), %rdi
   47588:      	movl	$0x1, %esi
   4758d:      	movl	$0x1, %edx
   47592:      	callq	0x369c0 <<alloc::raw_vec::RawVecInner>::deallocate>
   47597:      	leaq	-0x188(%rbp), %rdi
   4759e:      	movl	$0x8, %esi
   475a3:      	movl	$0x30, %edx
   475a8:      	callq	0x369c0 <<alloc::raw_vec::RawVecInner>::deallocate>
   475ad:      	leaq	-0x170(%rbp), %rdi
   475b4:      	movl	$0x8, %esi
   475b9:      	movl	$0x8, %edx
   475be:      	callq	0x369c0 <<alloc::raw_vec::RawVecInner>::deallocate>
   475c3:      	leaq	-0xf0(%rbp), %rdi
   475ca:      	movl	$0x8, %esi
   475cf:      	movl	$0x8, %edx
   475d4:      	callq	0x369c0 <<alloc::raw_vec::RawVecInner>::deallocate>
   475d9:      	movaps	-0xa0(%rbp), %xmm0
   475e0:      	addq	$0x2ee8, %rsp           # imm = 0x2EE8
   475e7:      	popq	%rbx
   475e8:      	popq	%r12
   475ea:      	popq	%r13
   475ec:      	popq	%r14
   475ee:      	popq	%r15
   475f0:      	popq	%rbp
   475f1:      	retq
   475f2:      	movzbl	-0x6f(%rbp), %eax
   475f6:      	movb	%al, -0x148(%rbp)
   475fc:      	leaq	-0x374e9(%rip), %rdi    # 0x1011a <anon.c0f308983206626af30a745d03c91a10.7.llvm.12480394386067567631+0x3c5>
   47603:      	leaq	0x8022e(%rip), %rcx     # 0xc7838 <anon.c0f308983206626af30a745d03c91a10.4.llvm.12480394386067567631+0x198>
   4760a:      	leaq	0x8020f(%rip), %r8      # 0xc7820 <anon.c0f308983206626af30a745d03c91a10.4.llvm.12480394386067567631+0x180>
   47611:      	leaq	-0x148(%rbp), %rdx
   47618:      	movl	$0x2b, %esi
   4761d:      	callq	0xbf2c0 <core::result::unwrap_failed>
   47622:      	jmp	0x47719 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf59>
   47627:      	movzbl	-0xcf(%rbp), %eax
   4762e:      	movb	%al, -0x29(%rbp)
   47631:      	leaq	-0x3751e(%rip), %rdi    # 0x1011a <anon.c0f308983206626af30a745d03c91a10.7.llvm.12480394386067567631+0x3c5>
   47638:      	leaq	0x801f9(%rip), %rcx     # 0xc7838 <anon.c0f308983206626af30a745d03c91a10.4.llvm.12480394386067567631+0x198>
   4763f:      	leaq	0x801da(%rip), %r8      # 0xc7820 <anon.c0f308983206626af30a745d03c91a10.4.llvm.12480394386067567631+0x180>
   47646:      	leaq	-0x29(%rbp), %rdx
   4764a:      	movl	$0x2b, %esi
   4764f:      	callq	0xbf2c0 <core::result::unwrap_failed>
   47654:      	jmp	0x47719 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf59>
   47659:      	movzbl	-0x6f(%rbp), %eax
   4765d:      	movb	%al, -0x148(%rbp)
   47663:      	leaq	-0x37550(%rip), %rdi    # 0x1011a <anon.c0f308983206626af30a745d03c91a10.7.llvm.12480394386067567631+0x3c5>
   4766a:      	leaq	0x801c7(%rip), %rcx     # 0xc7838 <anon.c0f308983206626af30a745d03c91a10.4.llvm.12480394386067567631+0x198>
   47671:      	leaq	0x801a8(%rip), %r8      # 0xc7820 <anon.c0f308983206626af30a745d03c91a10.4.llvm.12480394386067567631+0x180>
   47678:      	leaq	-0x148(%rbp), %rdx
   4767f:      	movl	$0x2b, %esi
   47684:      	callq	0xbf2c0 <core::result::unwrap_failed>
   47689:      	jmp	0x47719 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf59>
   4768e:      	cmpq	$0x15, %r14
   47692:      	jae	0x4771b <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf5b>
   47698:      	shlq	$0x3, %r14
   4769c:      	movl	$0x8, %r15d
   476a2:      	leaq	(%rbx,%r15), %rsi
   476a6:      	movq	%rbx, %rdi
   476a9:      	callq	0x34e00 <core::slice::sort::shared::smallsort::insert_tail::<f64, <[f64]>::sort_by<<f64>::total_cmp>::{closure#0}> (.llvm.822523245422478337)>
   476ae:      	addq	$0x8, %r15
   476b2:      	cmpq	%r15, %r14
   476b5:      	jne	0x476a2 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xee2>
   476b7:      	jmp	0x46c84 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x4c4>
   476bc:      	leaq	-0x3757e(%rip), %rdi    # 0x10145 <anon.c0f308983206626af30a745d03c91a10.7.llvm.12480394386067567631+0x3f0>
   476c3:      	leaq	0x8001e(%rip), %rcx     # 0xc76e8 <anon.c0f308983206626af30a745d03c91a10.4.llvm.12480394386067567631+0x48>
   476ca:      	movl	$0x237, %esi            # imm = 0x237
   476cf:      	xorl	%edx, %edx
   476d1:      	callq	0xbf390 <core::panicking::panic_nounwind_fmt>
   476d6:      	leaq	0x7fff3(%rip), %rdx     # 0xc76d0 <anon.c0f308983206626af30a745d03c91a10.4.llvm.12480394386067567631+0x30>
   476dd:      	movq	%r13, %rdi
   476e0:      	movq	%r12, %rsi
   476e3:      	callq	0xbf34d <core::panicking::panic_bounds_check>
   476e8:      	jmp	0x47719 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf59>
   476ea:      	xorl	%ebx, %ebx
   476ec:      	movl	$0x13880, %esi          # imm = 0x13880
   476f1:      	movq	%rbx, %rdi
   476f4:      	callq	0xbb992 <alloc::raw_vec::handle_error>
   476f9:      	xorl	%ebx, %ebx
   476fb:      	movl	$0x12c0, %esi           # imm = 0x12C0
   47700:      	movq	%rbx, %rdi
   47703:      	callq	0xbb992 <alloc::raw_vec::handle_error>
   47708:      	jmp	0x47719 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf59>
   4770a:      	xorl	%ebx, %ebx
   4770c:      	movl	$0x3, %esi
   47711:      	movq	%rbx, %rdi
   47714:      	callq	0xbb992 <alloc::raw_vec::handle_error>
   47719:      	ud2
   4771b:      	leaq	-0x10d0(%rbp), %rdx
   47722:      	movq	%rbx, %rdi
   47725:      	movq	%r14, %rsi
   47728:      	callq	0x2d600 <core::slice::sort::stable::driftsort_main::<f64, <[f64]>::sort_by<<f64>::total_cmp>::{closure#0}, alloc::vec::Vec<f64>>>
   4772d:      	jmp	0x46c84 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x4c4>
   47732:      	jmp	0x47764 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xfa4>
   47734:      	jmp	0x47764 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xfa4>
   47736:      	movq	%rax, %rbx
   47739:      	jmp	0x47798 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xfd8>
   4773b:      	movq	%rax, %rbx
   4773e:      	jmp	0x477ae <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xfee>
   47740:      	jmp	0x47742 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xf82>
   47742:      	movq	%rax, %rbx
   47745:      	leaq	-0x1ff0(%rbp), %rdi
   4774c:      	movl	$0x1, %esi
   47751:      	movl	$0x1, %edx
   47756:      	callq	0x369c0 <<alloc::raw_vec::RawVecInner>::deallocate>
   4775b:      	jmp	0x47798 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xfd8>
   4775d:      	jmp	0x4776d <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xfad>
   4775f:      	movq	%rax, %rbx
   47762:      	jmp	0x47798 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xfd8>
   47764:      	movq	%rax, %rbx
   47767:      	jmp	0x477da <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x101a>
   47769:      	jmp	0x477cb <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x100b>
   4776b:      	jmp	0x47789 <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0xfc9>
   4776d:      	movq	%rax, %rbx
   47770:      	leaq	-0x90(%rbp), %rdi
   47777:      	callq	0x35a30 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>>
   4777c:      	movq	%rbx, %rdi
   4777f:      	callq	0xb9f20 <_Unwind_Resume>
   47784:      	callq	0xbf33a <core::panicking::panic_in_cleanup>
   47789:      	movq	%rax, %rbx
   4778c:      	leaq	-0x110(%rbp), %rdi
   47793:      	callq	0x35a30 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>>
   47798:      	leaq	-0x188(%rbp), %rdi
   4779f:      	movl	$0x8, %esi
   477a4:      	movl	$0x30, %edx
   477a9:      	callq	0x369c0 <<alloc::raw_vec::RawVecInner>::deallocate>
   477ae:      	leaq	-0x170(%rbp), %rdi
   477b5:      	movl	$0x8, %esi
   477ba:      	movl	$0x8, %edx
   477bf:      	callq	0x369c0 <<alloc::raw_vec::RawVecInner>::deallocate>
   477c4:      	jmp	0x477da <crypto_constant_time::constant_time::measure::<(toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]), crypto_constant_time::main::{closure#17}, crypto_constant_time::main::{closure#18}>+0x101a>
   477c6:      	callq	0xbf33a <core::panicking::panic_in_cleanup>
   477cb:      	movq	%rax, %rbx
   477ce:      	leaq	-0x90(%rbp), %rdi
   477d5:      	callq	0x35a30 <core::ptr::drop_glue::<alloc::vec::into_iter::IntoIter<(crypto_constant_time::constant_time::Class, (toyos_crypto::mlkem::DecapsulationKey, [u8; 1088]))>>>
   477da:      	leaq	-0xf0(%rbp), %rdi
   477e1:      	movl	$0x8, %esi
   477e6:      	movl	$0x8, %edx
   477eb:      	callq	0x369c0 <<alloc::raw_vec::RawVecInner>::deallocate>
   477f0:      	movq	%rbx, %rdi
   477f3:      	callq	0xb9f20 <_Unwind_Resume>
   477f8:      	callq	0xbf33a <core::panicking::panic_in_cleanup>
   477fd:      	int3
   477fe:      	int3
   477ff:      	int3

000000000004a4b0 <<toyos_crypto::keccak::Sponge>::new>:
   4a4b0:      	pushq	%rbp
   4a4b1:      	movq	%rsp, %rbp
   4a4b4:      	pushq	%r15
   4a4b6:      	pushq	%r14
   4a4b8:      	pushq	%r13
   4a4ba:      	pushq	%r12
   4a4bc:      	pushq	%rbx
   4a4bd:      	subq	$0xf8, %rsp
   4a4c4:      	movq	%rcx, %r13
   4a4c7:      	movq	%rsi, %r14
   4a4ca:      	movq	%rdi, %rbx
   4a4cd:      	cmpq	$0x48, %rsi
   4a4d1:      	je	0x4a4e9 <<toyos_crypto::keccak::Sponge>::new+0x39>
   4a4d3:      	cmpq	$0x88, %r14
   4a4da:      	je	0x4a4e9 <<toyos_crypto::keccak::Sponge>::new+0x39>
   4a4dc:      	cmpq	$0xa8, %r14
   4a4e3:      	jne	0x4a6ee <<toyos_crypto::keccak::Sponge>::new+0x23e>
   4a4e9:      	xorps	%xmm0, %xmm0
   4a4ec:      	movaps	%xmm0, -0x70(%rbp)
   4a4f0:      	movaps	%xmm0, -0x80(%rbp)
   4a4f4:      	movaps	%xmm0, -0x90(%rbp)
   4a4fb:      	movaps	%xmm0, -0xa0(%rbp)
   4a502:      	movaps	%xmm0, -0xb0(%rbp)
   4a509:      	movaps	%xmm0, -0xc0(%rbp)
   4a510:      	movaps	%xmm0, -0xd0(%rbp)
   4a517:      	movaps	%xmm0, -0xe0(%rbp)
   4a51e:      	movaps	%xmm0, -0xf0(%rbp)
   4a525:      	movaps	%xmm0, -0x100(%rbp)
   4a52c:      	movaps	%xmm0, -0x110(%rbp)
   4a533:      	movaps	%xmm0, -0x120(%rbp)
   4a53a:      	movq	$0x0, -0x60(%rbp)
   4a542:      	movq	%r14, -0x58(%rbp)
   4a546:      	movq	$0x0, -0x50(%rbp)
   4a54e:      	testq	%r8, %r8
   4a551:      	je	0x4a651 <<toyos_crypto::keccak::Sponge>::new+0x1a1>
   4a557:      	movl	%edx, -0x34(%rbp)
   4a55a:      	movq	%rbx, -0x40(%rbp)
   4a55e:      	shlq	$0x4, %r8
   4a562:      	addq	%r13, %r8
   4a565:      	xorl	%ecx, %ecx
   4a567:      	leaq	0x7d3b2(%rip), %rax     # 0xc7920 <anon.6cc4159c997fb1fe88462a0393e0f2a1.2.llvm.12053707996428374621+0x78>
   4a56e:      	movq	%rax, -0x30(%rbp)
   4a572:      	movq	%r8, -0x48(%rbp)
   4a576:      	jmp	0x4a58d <<toyos_crypto::keccak::Sponge>::new+0xdd>
   4a578:      	nopl	(%rax,%rax)
   4a580:      	addq	$0x10, %r13
   4a584:      	movq	-0x48(%rbp), %r8
   4a588:      	cmpq	%r8, %r13
   4a58b:      	je	0x4a601 <<toyos_crypto::keccak::Sponge>::new+0x151>
   4a58d:      	movq	0x8(%r13), %rbx
   4a591:      	testq	%rbx, %rbx
   4a594:      	je	0x4a580 <<toyos_crypto::keccak::Sponge>::new+0xd0>
   4a596:      	movq	(%r13), %r12
   4a59a:      	xorl	%r15d, %r15d
   4a59d:      	jmp	0x4a5a8 <<toyos_crypto::keccak::Sponge>::new+0xf8>
   4a59f:      	nop
   4a5a0:      	incq	%r15
   4a5a3:      	cmpq	%r15, %rbx
   4a5a6:      	je	0x4a580 <<toyos_crypto::keccak::Sponge>::new+0xd0>
   4a5a8:      	movq	%rcx, %rdi
   4a5ab:      	shrq	$0x3, %rdi
   4a5af:      	cmpq	$0xc7, %rcx
   4a5b6:      	ja	0x4a6d0 <<toyos_crypto::keccak::Sponge>::new+0x220>
   4a5bc:      	shll	$0x3, %ecx
   4a5bf:      	movzbl	(%r12,%r15), %eax
   4a5c4:      	shlq	%cl, %rax
   4a5c7:      	xorq	%rax, -0x120(%rbp,%rdi,8)
   4a5cf:      	movq	-0x50(%rbp), %rcx
   4a5d3:      	cmpq	$-0x1, %rcx
   4a5d7:      	je	0x4a6b7 <<toyos_crypto::keccak::Sponge>::new+0x207>
   4a5dd:      	incq	%rcx
   4a5e0:      	movq	%rcx, -0x50(%rbp)
   4a5e4:      	cmpq	%r14, %rcx
   4a5e7:      	jne	0x4a5a0 <<toyos_crypto::keccak::Sponge>::new+0xf0>
   4a5e9:      	leaq	-0x120(%rbp), %rdi
   4a5f0:      	callq	0x4a730 <<toyos_crypto::keccak::Sponge>::permute (.llvm.16569730505516846098)>
   4a5f5:      	movq	$0x0, -0x50(%rbp)
   4a5fd:      	xorl	%ecx, %ecx
   4a5ff:      	jmp	0x4a5a0 <<toyos_crypto::keccak::Sponge>::new+0xf0>
   4a601:      	movq	%rcx, %rdi
   4a604:      	shrq	$0x3, %rdi
   4a608:      	cmpq	$0xc8, %rcx
   4a60f:      	jae	0x4a6c5 <<toyos_crypto::keccak::Sponge>::new+0x215>
   4a615:      	shll	$0x3, %ecx
   4a618:      	movzbl	-0x34(%rbp), %eax
   4a61c:      	shlq	%cl, %rax
   4a61f:      	xorq	%rax, -0x120(%rbp,%rdi,8)
   4a627:      	testq	%r14, %r14
   4a62a:      	movq	-0x40(%rbp), %rbx
   4a62e:      	je	0x4a6e0 <<toyos_crypto::keccak::Sponge>::new+0x230>
   4a634:      	leaq	-0x1(%r14), %rcx
   4a638:      	movq	%rcx, %rdi
   4a63b:      	shrq	$0x3, %rdi
   4a63f:      	cmpq	$0xc9, %r14
   4a646:      	jb	0x4a668 <<toyos_crypto::keccak::Sponge>::new+0x1b8>
   4a648:      	leaq	0x7d2b9(%rip), %rax     # 0xc7908 <anon.6cc4159c997fb1fe88462a0393e0f2a1.2.llvm.12053707996428374621+0x60>
   4a64f:      	jmp	0x4a6cc <<toyos_crypto::keccak::Sponge>::new+0x21c>
   4a651:      	movzbl	%dl, %eax
   4a654:      	movq	%rax, -0x120(%rbp)
   4a65b:      	decq	%r14
   4a65e:      	movq	%r14, %rdi
   4a661:      	shrq	$0x3, %rdi
   4a665:      	movq	%r14, %rcx
   4a668:      	shll	$0x3, %ecx
   4a66b:      	movl	$0x80, %eax
   4a670:      	shlq	%cl, %rax
   4a673:      	xorq	%rax, -0x120(%rbp,%rdi,8)
   4a67b:      	leaq	-0x120(%rbp), %r14
   4a682:      	movq	%r14, %rdi
   4a685:      	callq	0x4a730 <<toyos_crypto::keccak::Sponge>::permute (.llvm.16569730505516846098)>
   4a68a:      	movq	$0x0, -0x50(%rbp)
   4a692:      	movl	$0xd8, %edx
   4a697:      	movq	%rbx, %rdi
   4a69a:      	movq	%r14, %rsi
   4a69d:      	callq	0xc5af0 <memcpy>
   4a6a2:      	movq	%rbx, %rax
   4a6a5:      	addq	$0xf8, %rsp
   4a6ac:      	popq	%rbx
   4a6ad:      	popq	%r12
   4a6af:      	popq	%r13
   4a6b1:      	popq	%r14
   4a6b3:      	popq	%r15
   4a6b5:      	popq	%rbp
   4a6b6:      	retq
   4a6b7:      	leaq	0x7d27a(%rip), %rdi     # 0xc7938 <anon.6cc4159c997fb1fe88462a0393e0f2a1.2.llvm.12053707996428374621+0x90>
   4a6be:      	callq	0xc00f0 <core::panicking::panic_const::panic_const_add_overflow>
   4a6c3:      	jmp	0x4a6ec <<toyos_crypto::keccak::Sponge>::new+0x23c>
   4a6c5:      	leaq	0x7d20c(%rip), %rax     # 0xc78d8 <anon.6cc4159c997fb1fe88462a0393e0f2a1.2.llvm.12053707996428374621+0x30>
   4a6cc:      	movq	%rax, -0x30(%rbp)
   4a6d0:      	movl	$0x19, %esi
   4a6d5:      	movq	-0x30(%rbp), %rdx
   4a6d9:      	callq	0xbf34d <core::panicking::panic_bounds_check>
   4a6de:      	jmp	0x4a6ec <<toyos_crypto::keccak::Sponge>::new+0x23c>
   4a6e0:      	leaq	0x7d209(%rip), %rdi     # 0xc78f0 <anon.6cc4159c997fb1fe88462a0393e0f2a1.2.llvm.12053707996428374621+0x48>
   4a6e7:      	callq	0xc0150 <core::panicking::panic_const::panic_const_sub_overflow>
   4a6ec:      	ud2
   4a6ee:      	leaq	-0x3a110(%rip), %rdi    # 0x105e5 <anon.6cc4159c997fb1fe88462a0393e0f2a1.0.llvm.12053707996428374621+0xc9>
   4a6f5:      	leaq	0x7d1c4(%rip), %rdx     # 0xc78c0 <anon.6cc4159c997fb1fe88462a0393e0f2a1.2.llvm.12053707996428374621+0x18>
   4a6fc:      	movl	$0x30, %esi
   4a701:      	callq	0xbf4f0 <core::panicking::panic>
   4a706:      	movq	%rax, %rbx
   4a709:      	leaq	-0x120(%rbp), %rdi
   4a710:      	callq	0x55ed0 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   4a715:      	movq	%rbx, %rdi
   4a718:      	callq	0xb9f20 <_Unwind_Resume>
   4a71d:      	callq	0xbf33a <core::panicking::panic_in_cleanup>
   4a722:      	int3
   4a723:      	int3
   4a724:      	int3
   4a725:      	int3
   4a726:      	int3
   4a727:      	int3
   4a728:      	int3
   4a729:      	int3
   4a72a:      	int3
   4a72b:      	int3
   4a72c:      	int3
   4a72d:      	int3
   4a72e:      	int3
   4a72f:      	int3

000000000004a730 <<toyos_crypto::keccak::Sponge>::permute (.llvm.16569730505516846098)>:
   4a730:      	pushq	%rbp
   4a731:      	movq	%rsp, %rbp
   4a734:      	pushq	%r15
   4a736:      	pushq	%r14
   4a738:      	pushq	%r13
   4a73a:      	pushq	%r12
   4a73c:      	pushq	%rbx
   4a73d:      	subq	$0x358, %rsp            # imm = 0x358
   4a744:      	movq	%rdi, %rbx
   4a747:      	movq	$0x0, -0x240(%rbp)
   4a752:      	movq	$0x0, -0x238(%rbp)
   4a75d:      	movq	$0x0, -0x230(%rbp)
   4a768:      	movq	$0x0, -0x228(%rbp)
   4a773:      	movq	$0x0, -0x220(%rbp)
   4a77e:      	movq	$0x0, -0x178(%rbp)
   4a789:      	movq	$0x0, -0x170(%rbp)
   4a794:      	movq	$0x0, -0x168(%rbp)
   4a79f:      	movq	$0x0, -0x160(%rbp)
   4a7aa:      	movq	$0x0, -0x158(%rbp)
   4a7b5:      	movq	$0x0, -0x1d0(%rbp)
   4a7c0:      	movq	$0x0, -0x1c8(%rbp)
   4a7cb:      	movq	$0x0, -0x1c0(%rbp)
   4a7d6:      	movq	$0x0, -0x1b8(%rbp)
   4a7e1:      	movq	$0x0, -0x1b0(%rbp)
   4a7ec:      	movq	$0x0, -0x1a8(%rbp)
   4a7f7:      	movq	$0x0, -0x1a0(%rbp)
   4a802:      	movq	$0x0, -0x198(%rbp)
   4a80d:      	movq	$0x0, -0x190(%rbp)
   4a818:      	movq	$0x0, -0x188(%rbp)
   4a823:      	movq	$0x0, -0x180(%rbp)
   4a82e:      	leaq	-0x370(%rbp), %rdi
   4a835:      	leaq	-0x3a224(%rip), %rsi    # 0x10618 <anon.6cc4159c997fb1fe88462a0393e0f2a1.0.llvm.12053707996428374621+0xfc>
   4a83c:      	movl	$0xc0, %edx
   4a841:      	callq	0xc5af0 <memcpy>
   4a846:      	movq	(%rbx), %rdi
   4a849:      	movq	0x8(%rbx), %rax
   4a84d:      	movq	%rax, -0x40(%rbp)
   4a851:      	movq	0x28(%rbx), %rax
   4a855:      	movq	%rax, -0xb8(%rbp)
   4a85c:      	movq	0x50(%rbx), %rax
   4a860:      	movq	%rax, -0xa0(%rbp)
   4a867:      	movq	0x78(%rbx), %rax
   4a86b:      	movq	%rax, -0x80(%rbp)
   4a86f:      	movq	0xa0(%rbx), %rax
   4a876:      	movq	%rax, -0x60(%rbp)
   4a87a:      	movq	0x30(%rbx), %rax
   4a87e:      	movq	%rax, -0xa8(%rbp)
   4a885:      	movq	0x58(%rbx), %rax
   4a889:      	movq	%rax, -0x98(%rbp)
   4a890:      	movq	0x80(%rbx), %rax
   4a897:      	movq	%rax, -0x78(%rbp)
   4a89b:      	movq	0xa8(%rbx), %rax
   4a8a2:      	movq	%rax, -0x58(%rbp)
   4a8a6:      	movq	0x10(%rbx), %rax
   4a8aa:      	movq	%rax, -0xb0(%rbp)
   4a8b1:      	movq	0x38(%rbx), %rax
   4a8b5:      	movq	%rax, -0x90(%rbp)
   4a8bc:      	movq	0x60(%rbx), %rax
   4a8c0:      	movq	%rax, -0x70(%rbp)
   4a8c4:      	movq	0x88(%rbx), %r10
   4a8cb:      	movq	0xb0(%rbx), %r13
   4a8d2:      	movq	0x18(%rbx), %rax
   4a8d6:      	movq	%rax, -0x88(%rbp)
   4a8dd:      	movq	0x40(%rbx), %rax
   4a8e1:      	movq	%rax, -0x68(%rbp)
   4a8e5:      	movq	0x68(%rbx), %rax
   4a8e9:      	movq	%rax, -0x50(%rbp)
   4a8ed:      	movq	0x90(%rbx), %r9
   4a8f4:      	movq	0xb8(%rbx), %r12
   4a8fb:      	movq	0x20(%rbx), %rax
   4a8ff:      	movq	%rax, -0xc8(%rbp)
   4a906:      	movq	0x48(%rbx), %rax
   4a90a:      	movq	%rax, -0x48(%rbp)
   4a90e:      	movq	0x70(%rbx), %rdx
   4a912:      	movq	0x98(%rbx), %r15
   4a919:      	movq	0xc0(%rbx), %r11
   4a920:      	movl	$0x2, %r14d
   4a926:      	movq	%r14, -0x218(%rbp)
   4a92d:      	movq	-0x80(%rbp), %rax
   4a931:      	xorq	-0x60(%rbp), %rax
   4a935:      	movq	-0xa0(%rbp), %rcx
   4a93c:      	xorq	-0xb8(%rbp), %rcx
   4a943:      	xorq	%rax, %rcx
   4a946:      	movq	-0x78(%rbp), %rsi
   4a94a:      	xorq	-0x58(%rbp), %rsi
   4a94e:      	movq	-0x98(%rbp), %rax
   4a955:      	xorq	-0xa8(%rbp), %rax
   4a95c:      	xorq	%rsi, %rax
   4a95f:      	movq	%r10, -0x38(%rbp)
   4a963:      	xorq	%r13, %r10
   4a966:      	movq	-0x70(%rbp), %r14
   4a96a:      	xorq	-0x90(%rbp), %r14
   4a971:      	xorq	%r10, %r14
   4a974:      	movq	%r9, %rsi
   4a977:      	xorq	%r12, %rsi
   4a97a:      	movq	%rdi, %r8
   4a97d:      	movq	%rdi, -0x30(%rbp)
   4a981:      	movq	-0x50(%rbp), %rdi
   4a985:      	xorq	-0x68(%rbp), %rdi
   4a989:      	xorq	%rsi, %rdi
   4a98c:      	movq	%r15, %r10
   4a98f:      	xorq	%r11, %r10
   4a992:      	movq	%rdx, %rsi
   4a995:      	xorq	-0x48(%rbp), %rsi
   4a999:      	xorq	%r10, %rsi
   4a99c:      	xorq	%r8, %rcx
   4a99f:      	xorq	-0x40(%rbp), %rax
   4a9a3:      	xorq	-0xb0(%rbp), %r14
   4a9aa:      	xorq	-0x88(%rbp), %rdi
   4a9b1:      	movq	-0xc8(%rbp), %r8
   4a9b8:      	xorq	%r8, %rsi
   4a9bb:      	movq	%rdi, %r10
   4a9be:      	rolq	%r10
   4a9c1:      	xorq	%rax, %r10
   4a9c4:      	movq	%r10, -0xd0(%rbp)
   4a9cb:      	rolq	%rax
   4a9ce:      	xorq	%rsi, %rax
   4a9d1:      	movq	%r14, %r10
   4a9d4:      	rolq	%r10
   4a9d7:      	xorq	%rcx, %r10
   4a9da:      	rolq	%rsi
   4a9dd:      	rolq	%rcx
   4a9e0:      	xorq	%r14, %rsi
   4a9e3:      	xorq	%rdi, %rcx
   4a9e6:      	movq	-0x30(%rbp), %rdi
   4a9ea:      	xorq	%rax, %rdi
   4a9ed:      	movq	%rdi, -0xc0(%rbp)
   4a9f4:      	movq	-0x40(%rbp), %rdi
   4a9f8:      	xorq	%r10, %rdi
   4a9fb:      	rolq	%rdi
   4a9fe:      	movq	%rdi, -0x150(%rbp)
   4aa05:      	movq	-0xd0(%rbp), %r14
   4aa0c:      	movq	-0xb0(%rbp), %rdi
   4aa13:      	xorq	%r14, %rdi
   4aa16:      	rolq	$0x3e, %rdi
   4aa1a:      	movq	%rdi, -0x148(%rbp)
   4aa21:      	movq	-0x88(%rbp), %rdi
   4aa28:      	xorq	%rsi, %rdi
   4aa2b:      	rolq	$0x1c, %rdi
   4aa2f:      	movq	%rdi, -0x140(%rbp)
   4aa36:      	xorq	%rcx, %r8
   4aa39:      	rolq	$0x1b, %r8
   4aa3d:      	movq	%r8, -0x138(%rbp)
   4aa44:      	movq	-0xb8(%rbp), %rdi
   4aa4b:      	xorq	%rax, %rdi
   4aa4e:      	rolq	$0x24, %rdi
   4aa52:      	movq	%rdi, -0x130(%rbp)
   4aa59:      	movq	-0xa8(%rbp), %rdi
   4aa60:      	xorq	%r10, %rdi
   4aa63:      	rolq	$0x2c, %rdi
   4aa67:      	movq	%rdi, -0x128(%rbp)
   4aa6e:      	movq	-0x90(%rbp), %rdi
   4aa75:      	xorq	%r14, %rdi
   4aa78:      	movq	%r14, %r8
   4aa7b:      	rolq	$0x6, %rdi
   4aa7f:      	movq	%rdi, -0x120(%rbp)
   4aa86:      	movq	-0x68(%rbp), %rdi
   4aa8a:      	xorq	%rsi, %rdi
   4aa8d:      	rolq	$0x37, %rdi
   4aa91:      	movq	%rdi, -0x30(%rbp)
   4aa95:      	movq	-0x48(%rbp), %rdi
   4aa99:      	xorq	%rcx, %rdi
   4aa9c:      	rolq	$0x14, %rdi
   4aaa0:      	movq	%rdi, -0x118(%rbp)
   4aaa7:      	movq	-0xa0(%rbp), %rdi
   4aaae:      	xorq	%rax, %rdi
   4aab1:      	rolq	$0x3, %rdi
   4aab5:      	movq	%rdi, -0x110(%rbp)
   4aabc:      	movq	-0x98(%rbp), %rdi
   4aac3:      	xorq	%r10, %rdi
   4aac6:      	rolq	$0xa, %rdi
   4aaca:      	movq	%rdi, -0x108(%rbp)
   4aad1:      	movq	-0x70(%rbp), %r14
   4aad5:      	xorq	%r8, %r14
   4aad8:      	rolq	$0x2b, %r14
   4aadc:      	movq	-0x50(%rbp), %rdi
   4aae0:      	xorq	%rsi, %rdi
   4aae3:      	rolq	$0x19, %rdi
   4aae7:      	movq	%rdi, -0x100(%rbp)
   4aaee:      	xorq	%rcx, %rdx
   4aaf1:      	rolq	$0x27, %rdx
   4aaf5:      	movq	%rdx, -0xf8(%rbp)
   4aafc:      	movq	-0x80(%rbp), %rdx
   4ab00:      	xorq	%rax, %rdx
   4ab03:      	rolq	$0x29, %rdx
   4ab07:      	movq	%rdx, -0xf0(%rbp)
   4ab0e:      	movq	-0x78(%rbp), %rdx
   4ab12:      	xorq	%r10, %rdx
   4ab15:      	rolq	$0x2d, %rdx
   4ab19:      	movq	%rdx, -0xe8(%rbp)
   4ab20:      	movq	-0x38(%rbp), %r8
   4ab24:      	movq	-0xd0(%rbp), %rdx
   4ab2b:      	xorq	%rdx, %r8
   4ab2e:      	rolq	$0xf, %r8
   4ab32:      	movq	%r8, -0x38(%rbp)
   4ab36:      	xorq	%rsi, %r9
   4ab39:      	rolq	$0x15, %r9
   4ab3d:      	xorq	%rcx, %r15
   4ab40:      	rolq	$0x8, %r15
   4ab44:      	movq	%rax, -0x210(%rbp)
   4ab4b:      	movq	-0x60(%rbp), %rdi
   4ab4f:      	xorq	%rax, %rdi
   4ab52:      	rolq	$0x12, %rdi
   4ab56:      	movq	%rdi, -0xe0(%rbp)
   4ab5d:      	movq	%r10, -0x208(%rbp)
   4ab64:      	movq	-0x58(%rbp), %rdi
   4ab68:      	xorq	%r10, %rdi
   4ab6b:      	rolq	$0x2, %rdi
   4ab6f:      	movq	%rdi, -0xd8(%rbp)
   4ab76:      	xorq	%rdx, %r13
   4ab79:      	rolq	$0x3d, %r13
   4ab7d:      	xorq	%rsi, %r12
   4ab80:      	rolq	$0x38, %r12
   4ab84:      	xorq	%rcx, %r11
   4ab87:      	rolq	$0xe, %r11
   4ab8b:      	movq	-0x128(%rbp), %r8
   4ab92:      	movq	%r8, %rdi
   4ab95:      	notq	%rdi
   4ab98:      	andq	%r14, %rdi
   4ab9b:      	movq	%r14, %rax
   4ab9e:      	notq	%rax
   4aba1:      	andq	%r9, %rax
   4aba4:      	xorq	%r8, %rax
   4aba7:      	movq	%r8, %r10
   4abaa:      	movq	%rax, -0x40(%rbp)
   4abae:      	movq	%r9, %rax
   4abb1:      	notq	%rax
   4abb4:      	andq	%r11, %rax
   4abb7:      	movq	%r14, -0x200(%rbp)
   4abbe:      	xorq	%r14, %rax
   4abc1:      	movq	%rax, -0xb0(%rbp)
   4abc8:      	movq	%r11, %rax
   4abcb:      	notq	%rax
   4abce:      	movq	-0xc0(%rbp), %r8
   4abd5:      	andq	%r8, %rax
   4abd8:      	movq	%r9, -0x1f8(%rbp)
   4abdf:      	xorq	%r9, %rax
   4abe2:      	movq	%rax, -0x88(%rbp)
   4abe9:      	movq	%r8, %rax
   4abec:      	notq	%rax
   4abef:      	andq	%r10, %rax
   4abf2:      	movq	%r11, -0x1d8(%rbp)
   4abf9:      	xorq	%r11, %rax
   4abfc:      	movq	%rax, -0xc8(%rbp)
   4ac03:      	movq	-0x118(%rbp), %r9
   4ac0a:      	movq	%r9, %rax
   4ac0d:      	notq	%rax
   4ac10:      	movq	-0x110(%rbp), %r10
   4ac17:      	andq	%r10, %rax
   4ac1a:      	movq	-0x140(%rbp), %r8
   4ac21:      	xorq	%r8, %rax
   4ac24:      	movq	%rax, -0xb8(%rbp)
   4ac2b:      	movq	%r10, %rax
   4ac2e:      	notq	%rax
   4ac31:      	movq	-0xe8(%rbp), %rdx
   4ac38:      	andq	%rdx, %rax
   4ac3b:      	xorq	%r9, %rax
   4ac3e:      	movq	%rax, -0xa8(%rbp)
   4ac45:      	movq	%rdx, %rax
   4ac48:      	notq	%rax
   4ac4b:      	andq	%r13, %rax
   4ac4e:      	xorq	%r10, %rax
   4ac51:      	movq	%rax, -0x90(%rbp)
   4ac58:      	movq	%r13, %rax
   4ac5b:      	notq	%rax
   4ac5e:      	andq	%r8, %rax
   4ac61:      	xorq	%rdx, %rax
   4ac64:      	movq	%rax, -0x68(%rbp)
   4ac68:      	movq	%r8, %rax
   4ac6b:      	notq	%rax
   4ac6e:      	andq	%r9, %rax
   4ac71:      	movq	%r13, -0x1e8(%rbp)
   4ac78:      	xorq	%r13, %rax
   4ac7b:      	movq	%rax, -0x48(%rbp)
   4ac7f:      	movq	-0x120(%rbp), %r8
   4ac86:      	movq	%r8, %rax
   4ac89:      	notq	%rax
   4ac8c:      	movq	-0x100(%rbp), %r9
   4ac93:      	andq	%r9, %rax
   4ac96:      	movq	-0x150(%rbp), %rdx
   4ac9d:      	xorq	%rdx, %rax
   4aca0:      	movq	%rax, -0xa0(%rbp)
   4aca7:      	movq	%r9, %rax
   4acaa:      	notq	%rax
   4acad:      	andq	%r15, %rax
   4acb0:      	xorq	%r8, %rax
   4acb3:      	movq	%rax, -0x98(%rbp)
   4acba:      	movq	%r15, %rax
   4acbd:      	notq	%rax
   4acc0:      	movq	-0xe0(%rbp), %r10
   4acc7:      	andq	%r10, %rax
   4acca:      	xorq	%r9, %rax
   4accd:      	movq	%rax, -0x70(%rbp)
   4acd1:      	movq	%r10, %rax
   4acd4:      	notq	%rax
   4acd7:      	andq	%rdx, %rax
   4acda:      	movq	%r15, -0x1f0(%rbp)
   4ace1:      	xorq	%r15, %rax
   4ace4:      	movq	%rax, -0x50(%rbp)
   4ace8:      	notq	%rdx
   4aceb:      	andq	%r8, %rdx
   4acee:      	xorq	%r10, %rdx
   4acf1:      	movq	-0x130(%rbp), %r8
   4acf8:      	movq	%r8, %rax
   4acfb:      	notq	%rax
   4acfe:      	movq	-0x108(%rbp), %r9
   4ad05:      	andq	%r9, %rax
   4ad08:      	movq	-0x138(%rbp), %r15
   4ad0f:      	xorq	%r15, %rax
   4ad12:      	movq	%rax, -0x80(%rbp)
   4ad16:      	movq	%r9, %rax
   4ad19:      	notq	%rax
   4ad1c:      	movq	-0x38(%rbp), %r11
   4ad20:      	andq	%r11, %rax
   4ad23:      	xorq	%r8, %rax
   4ad26:      	movq	%rax, -0x78(%rbp)
   4ad2a:      	movq	%r11, %r10
   4ad2d:      	notq	%r10
   4ad30:      	andq	%r12, %r10
   4ad33:      	xorq	%r9, %r10
   4ad36:      	movq	%r12, %r9
   4ad39:      	notq	%r9
   4ad3c:      	andq	%r15, %r9
   4ad3f:      	xorq	%r11, %r9
   4ad42:      	notq	%r15
   4ad45:      	andq	%r8, %r15
   4ad48:      	movq	%r12, -0x1e0(%rbp)
   4ad4f:      	xorq	%r12, %r15
   4ad52:      	movq	-0x30(%rbp), %r8
   4ad56:      	movq	%r8, %rax
   4ad59:      	notq	%rax
   4ad5c:      	movq	-0xf8(%rbp), %r14
   4ad63:      	andq	%r14, %rax
   4ad66:      	movq	-0x148(%rbp), %r11
   4ad6d:      	xorq	%r11, %rax
   4ad70:      	movq	%rax, -0x60(%rbp)
   4ad74:      	movq	%r14, %rax
   4ad77:      	notq	%rax
   4ad7a:      	movq	-0xf0(%rbp), %r13
   4ad81:      	andq	%r13, %rax
   4ad84:      	xorq	%r8, %rax
   4ad87:      	movq	%rax, -0x58(%rbp)
   4ad8b:      	movq	%r13, %rax
   4ad8e:      	notq	%r13
   4ad91:      	movq	-0xd8(%rbp), %r8
   4ad98:      	andq	%r8, %r13
   4ad9b:      	xorq	%r14, %r13
   4ad9e:      	movq	%r8, %r12
   4ada1:      	notq	%r12
   4ada4:      	andq	%r11, %r12
   4ada7:      	xorq	%rax, %r12
   4adaa:      	notq	%r11
   4adad:      	andq	-0x30(%rbp), %r11
   4adb1:      	movq	-0x218(%rbp), %rax
   4adb8:      	xorq	-0x380(%rbp,%rax,8), %rdi
   4adc0:      	xorq	%r8, %r11
   4adc3:      	xorq	-0xc0(%rbp), %rdi
   4adca:      	incq	%rax
   4adcd:      	movq	%rax, %r14
   4add0:      	cmpq	$0x1a, %rax
   4add4:      	jne	0x4a926 <<toyos_crypto::keccak::Sponge>::permute (.llvm.16569730505516846098)+0x1f6>
   4adda:      	movq	-0x40(%rbp), %rax
   4adde:      	movq	%rax, 0x8(%rbx)
   4ade2:      	movq	-0xb0(%rbp), %rax
   4ade9:      	movq	%rax, 0x10(%rbx)
   4aded:      	movq	-0x88(%rbp), %rax
   4adf4:      	movq	%rax, 0x18(%rbx)
   4adf8:      	movq	-0xc8(%rbp), %rax
   4adff:      	movq	%rax, 0x20(%rbx)
   4ae03:      	movq	-0xb8(%rbp), %rax
   4ae0a:      	movq	%rax, 0x28(%rbx)
   4ae0e:      	movq	-0xa8(%rbp), %rax
   4ae15:      	movq	%rax, 0x30(%rbx)
   4ae19:      	movq	-0x90(%rbp), %rax
   4ae20:      	movq	%rax, 0x38(%rbx)
   4ae24:      	movq	-0x68(%rbp), %rax
   4ae28:      	movq	%rax, 0x40(%rbx)
   4ae2c:      	movq	-0x48(%rbp), %rax
   4ae30:      	movq	%rax, 0x48(%rbx)
   4ae34:      	movq	-0xa0(%rbp), %rax
   4ae3b:      	movq	%rax, 0x50(%rbx)
   4ae3f:      	movq	-0x98(%rbp), %rax
   4ae46:      	movq	%rax, 0x58(%rbx)
   4ae4a:      	movq	-0x70(%rbp), %rax
   4ae4e:      	movq	%rax, 0x60(%rbx)
   4ae52:      	movq	-0x50(%rbp), %rax
   4ae56:      	movq	%rax, 0x68(%rbx)
   4ae5a:      	movq	%rdx, 0x70(%rbx)
   4ae5e:      	movq	-0x80(%rbp), %rax
   4ae62:      	movq	%rax, 0x78(%rbx)
   4ae66:      	movq	-0x78(%rbp), %rax
   4ae6a:      	movq	%rax, 0x80(%rbx)
   4ae71:      	movq	%r10, 0x88(%rbx)
   4ae78:      	movq	%r9, 0x90(%rbx)
   4ae7f:      	movq	%r15, 0x98(%rbx)
   4ae86:      	movq	-0x60(%rbp), %rax
   4ae8a:      	movq	%rax, 0xa0(%rbx)
   4ae91:      	movq	-0x58(%rbp), %rax
   4ae95:      	movq	%rax, 0xa8(%rbx)
   4ae9c:      	movq	%r13, 0xb0(%rbx)
   4aea3:      	movq	%r12, 0xb8(%rbx)
   4aeaa:      	movq	%r11, 0xc0(%rbx)
   4aeb1:      	movq	%rdi, (%rbx)
   4aeb4:      	movq	-0xe8(%rbp), %rax
   4aebb:      	movq	%rax, -0x190(%rbp)
   4aec2:      	movq	-0x38(%rbp), %rax
   4aec6:      	movq	%rax, -0x278(%rbp)
   4aecd:      	movq	-0x1f8(%rbp), %rax
   4aed4:      	movq	%rax, -0x1b8(%rbp)
   4aedb:      	movq	-0x1f0(%rbp), %rax
   4aee2:      	movq	%rax, -0x2a0(%rbp)
   4aee9:      	movq	-0xe0(%rbp), %rax
   4aef0:      	movq	%rax, -0x298(%rbp)
   4aef7:      	movq	-0xd8(%rbp), %rax
   4aefe:      	movq	%rax, -0x248(%rbp)
   4af05:      	movq	-0x1e8(%rbp), %rax
   4af0c:      	movq	%rax, -0x2b0(%rbp)
   4af13:      	movq	-0x1e0(%rbp), %rax
   4af1a:      	movq	%rax, -0x270(%rbp)
   4af21:      	movq	-0x1d8(%rbp), %rax
   4af28:      	movq	%rax, -0x1b0(%rbp)
   4af2f:      	movq	-0x210(%rbp), %rax
   4af36:      	movq	%rax, -0x178(%rbp)
   4af3d:      	movq	-0x208(%rbp), %rax
   4af44:      	movq	%rax, -0x170(%rbp)
   4af4b:      	movq	-0xd0(%rbp), %rax
   4af52:      	movq	%rax, -0x168(%rbp)
   4af59:      	movq	%rsi, -0x160(%rbp)
   4af60:      	movq	%rcx, -0x158(%rbp)
   4af67:      	movq	-0xc0(%rbp), %rax
   4af6e:      	movq	%rax, -0x1d0(%rbp)
   4af75:      	movq	-0x150(%rbp), %rax
   4af7c:      	movq	%rax, -0x188(%rbp)
   4af83:      	movq	-0x148(%rbp), %rax
   4af8a:      	movq	%rax, -0x268(%rbp)
   4af91:      	movq	-0x140(%rbp), %rax
   4af98:      	movq	%rax, -0x1a8(%rbp)
   4af9f:      	movq	-0x138(%rbp), %rax
   4afa6:      	movq	%rax, -0x290(%rbp)
   4afad:      	movq	-0x130(%rbp), %rax
   4afb4:      	movq	%rax, -0x288(%rbp)
   4afbb:      	movq	-0x128(%rbp), %rax
   4afc2:      	movq	%rax, -0x1c8(%rbp)
   4afc9:      	movq	-0x120(%rbp), %rax
   4afd0:      	movq	%rax, -0x180(%rbp)
   4afd7:      	movq	-0x30(%rbp), %rax
   4afdb:      	movq	%rax, -0x260(%rbp)
   4afe2:      	movq	-0x118(%rbp), %rax
   4afe9:      	movq	%rax, -0x1a0(%rbp)
   4aff0:      	movq	-0x110(%rbp), %rax
   4aff7:      	movq	%rax, -0x198(%rbp)
   4affe:      	movq	-0x108(%rbp), %rax
   4b005:      	movq	%rax, -0x280(%rbp)
   4b00c:      	movq	-0x200(%rbp), %rax
   4b013:      	movq	%rax, -0x1c0(%rbp)
   4b01a:      	movq	-0x100(%rbp), %rax
   4b021:      	movq	%rax, -0x2a8(%rbp)
   4b028:      	movq	-0xf8(%rbp), %rax
   4b02f:      	movq	%rax, -0x258(%rbp)
   4b036:      	movq	-0xf0(%rbp), %rax
   4b03d:      	movq	%rax, -0x250(%rbp)
   4b044:      	movq	$0x0, -0x240(%rbp)
   4b04f:      	movq	$0x0, -0x238(%rbp)
   4b05a:      	movq	$0x0, -0x230(%rbp)
   4b065:      	movq	$0x0, -0x228(%rbp)
   4b070:      	movq	$0x0, -0x220(%rbp)
   4b07b:      	movq	$0x0, -0x178(%rbp)
   4b086:      	movq	$0x0, -0x170(%rbp)
   4b091:      	movq	$0x0, -0x168(%rbp)
   4b09c:      	movq	$0x0, -0x160(%rbp)
   4b0a7:      	movq	$0x0, -0x158(%rbp)
   4b0b2:      	movq	$0x0, -0x1d0(%rbp)
   4b0bd:      	movq	$0x0, -0x1c8(%rbp)
   4b0c8:      	movq	$0x0, -0x1c0(%rbp)
   4b0d3:      	movq	$0x0, -0x1b8(%rbp)
   4b0de:      	movq	$0x0, -0x1b0(%rbp)
   4b0e9:      	movq	$0x0, -0x1a8(%rbp)
   4b0f4:      	movq	$0x0, -0x1a0(%rbp)
   4b0ff:      	movq	$0x0, -0x198(%rbp)
   4b10a:      	movq	$0x0, -0x190(%rbp)
   4b115:      	movq	$0x0, -0x2b0(%rbp)
   4b120:      	movq	$0x0, -0x188(%rbp)
   4b12b:      	movq	$0x0, -0x180(%rbp)
   4b136:      	movq	$0x0, -0x2a8(%rbp)
   4b141:      	movq	$0x0, -0x2a0(%rbp)
   4b14c:      	movq	$0x0, -0x298(%rbp)
   4b157:      	movq	$0x0, -0x290(%rbp)
   4b162:      	movq	$0x0, -0x288(%rbp)
   4b16d:      	movq	$0x0, -0x280(%rbp)
   4b178:      	movq	$0x0, -0x278(%rbp)
   4b183:      	movq	$0x0, -0x270(%rbp)
   4b18e:      	movq	$0x0, -0x268(%rbp)
   4b199:      	movq	$0x0, -0x260(%rbp)
   4b1a4:      	movq	$0x0, -0x258(%rbp)
   4b1af:      	movq	$0x0, -0x250(%rbp)
   4b1ba:      	movq	$0x0, -0x248(%rbp)
   4b1c5:      	addq	$0x358, %rsp            # imm = 0x358
   4b1cc:      	popq	%rbx
   4b1cd:      	popq	%r12
   4b1cf:      	popq	%r13
   4b1d1:      	popq	%r14
   4b1d3:      	popq	%r15
   4b1d5:      	popq	%rbp
   4b1d6:      	retq
   4b1d7:      	int3
   4b1d8:      	int3
   4b1d9:      	int3
   4b1da:      	int3
   4b1db:      	int3
   4b1dc:      	int3
   4b1dd:      	int3
   4b1de:      	int3
   4b1df:      	int3

000000000004b1e0 <toyos_crypto::keccak::g>:
   4b1e0:      	pushq	%rbp
   4b1e1:      	movq	%rsp, %rbp
   4b1e4:      	pushq	%r15
   4b1e6:      	pushq	%r14
   4b1e8:      	pushq	%rbx
   4b1e9:      	subq	$0x118, %rsp            # imm = 0x118
   4b1f0:      	movq	%rdx, %r8
   4b1f3:      	movq	%rsi, %rcx
   4b1f6:      	movq	%rdi, %rbx
   4b1f9:      	xorps	%xmm0, %xmm0
   4b1fc:      	movaps	%xmm0, -0x100(%rbp)
   4b203:      	movaps	%xmm0, -0x110(%rbp)
   4b20a:      	movaps	%xmm0, -0x120(%rbp)
   4b211:      	movaps	%xmm0, -0x130(%rbp)
   4b218:      	leaq	-0xf0(%rbp), %r14
   4b21f:      	movl	$0x48, %esi
   4b224:      	movq	%r14, %rdi
   4b227:      	movl	$0x6, %edx
   4b22c:      	callq	0x4a4b0 <<toyos_crypto::keccak::Sponge>::new>
   4b231:      	xorl	%r15d, %r15d
   4b234:      	movq	-0x20(%rbp), %rax
   4b238:      	jmp	0x4b280 <toyos_crypto::keccak::g+0xa0>
   4b23a:      	nopw	(%rax,%rax)
   4b240:      	movq	%r14, %rdi
   4b243:      	callq	0x4a730 <<toyos_crypto::keccak::Sponge>::permute (.llvm.16569730505516846098)>
   4b248:      	movq	$0x0, -0x20(%rbp)
   4b250:      	xorl	%edi, %edi
   4b252:      	xorl	%eax, %eax
   4b254:      	leaq	-0xf0(,%rdi,8), %rcx
   4b25c:      	addq	%rbp, %rcx
   4b25f:      	movl	%eax, %edx
   4b261:      	andl	$0x7, %edx
   4b264:      	movzbl	(%rdx,%rcx), %ecx
   4b268:      	movb	%cl, -0x130(%rbp,%r15)
   4b270:      	incq	%r15
   4b273:      	incq	%rax
   4b276:      	movq	%rax, -0x20(%rbp)
   4b27a:      	cmpq	$0x40, %r15
   4b27e:      	je	0x4b2a8 <toyos_crypto::keccak::g+0xc8>
   4b280:      	cmpq	-0x28(%rbp), %rax
   4b284:      	je	0x4b240 <toyos_crypto::keccak::g+0x60>
   4b286:      	movq	%rax, %rdi
   4b289:      	shrq	$0x3, %rdi
   4b28d:      	cmpq	$0xc8, %rax
   4b293:      	jb	0x4b254 <toyos_crypto::keccak::g+0x74>
   4b295:      	leaq	0x7c6b4(%rip), %rdx     # 0xc7950 <anon.1fd67189aac25b0b46092a5d2fc7dafa.8.llvm.16569730505516846098>
   4b29c:      	movl	$0x19, %esi
   4b2a1:      	callq	0xbf34d <core::panicking::panic_bounds_check>
   4b2a6:      	ud2
   4b2a8:      	movq	$0x0, -0xf0(%rbp)
   4b2b3:      	movq	$0x0, -0xe8(%rbp)
   4b2be:      	movq	$0x0, -0xe0(%rbp)
   4b2c9:      	movq	$0x0, -0xd8(%rbp)
   4b2d4:      	movq	$0x0, -0xd0(%rbp)
   4b2df:      	movq	$0x0, -0xc8(%rbp)
   4b2ea:      	movq	$0x0, -0xc0(%rbp)
   4b2f5:      	movq	$0x0, -0xb8(%rbp)
   4b300:      	movq	$0x0, -0xb0(%rbp)
   4b30b:      	movq	$0x0, -0xa8(%rbp)
   4b316:      	movq	$0x0, -0xa0(%rbp)
   4b321:      	movq	$0x0, -0x98(%rbp)
   4b32c:      	movq	$0x0, -0x90(%rbp)
   4b337:      	movq	$0x0, -0x88(%rbp)
   4b342:      	movq	$0x0, -0x80(%rbp)
   4b34a:      	movq	$0x0, -0x78(%rbp)
   4b352:      	movq	$0x0, -0x70(%rbp)
   4b35a:      	movq	$0x0, -0x68(%rbp)
   4b362:      	movq	$0x0, -0x60(%rbp)
   4b36a:      	movq	$0x0, -0x58(%rbp)
   4b372:      	movq	$0x0, -0x50(%rbp)
   4b37a:      	movq	$0x0, -0x48(%rbp)
   4b382:      	movq	$0x0, -0x40(%rbp)
   4b38a:      	movq	$0x0, -0x38(%rbp)
   4b392:      	movq	$0x0, -0x30(%rbp)
   4b39a:      	movaps	-0x130(%rbp), %xmm0
   4b3a1:      	movaps	-0x120(%rbp), %xmm1
   4b3a8:      	movaps	-0x110(%rbp), %xmm2
   4b3af:      	movaps	-0x100(%rbp), %xmm3
   4b3b6:      	movups	%xmm3, 0x30(%rbx)
   4b3ba:      	movups	%xmm2, 0x20(%rbx)
   4b3be:      	movups	%xmm1, 0x10(%rbx)
   4b3c2:      	movups	%xmm0, (%rbx)
   4b3c5:      	movq	%rbx, %rax
   4b3c8:      	addq	$0x118, %rsp            # imm = 0x118
   4b3cf:      	popq	%rbx
   4b3d0:      	popq	%r14
   4b3d2:      	popq	%r15
   4b3d4:      	popq	%rbp
   4b3d5:      	retq
   4b3d6:      	movq	%rax, %rbx
   4b3d9:      	leaq	-0xf0(%rbp), %rdi
   4b3e0:      	callq	0x55ed0 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   4b3e5:      	movq	%rbx, %rdi
   4b3e8:      	callq	0xb9f20 <_Unwind_Resume>
   4b3ed:      	callq	0xbf33a <core::panicking::panic_in_cleanup>
   4b3f2:      	int3
   4b3f3:      	int3
   4b3f4:      	int3
   4b3f5:      	int3
   4b3f6:      	int3
   4b3f7:      	int3
   4b3f8:      	int3
   4b3f9:      	int3
   4b3fa:      	int3
   4b3fb:      	int3
   4b3fc:      	int3
   4b3fd:      	int3
   4b3fe:      	int3
   4b3ff:      	int3

000000000004b400 <toyos_crypto::keccak::h>:
   4b400:      	pushq	%rbp
   4b401:      	movq	%rsp, %rbp
   4b404:      	pushq	%r15
   4b406:      	pushq	%r14
   4b408:      	pushq	%rbx
   4b409:      	subq	$0x108, %rsp            # imm = 0x108
   4b410:      	movq	%rdx, %r8
   4b413:      	movq	%rsi, %rcx
   4b416:      	movq	%rdi, %rbx
   4b419:      	xorps	%xmm0, %xmm0
   4b41c:      	movaps	%xmm0, -0x30(%rbp)
   4b420:      	movaps	%xmm0, -0x40(%rbp)
   4b424:      	leaq	-0x118(%rbp), %r14
   4b42b:      	movl	$0x88, %esi
   4b430:      	movq	%r14, %rdi
   4b433:      	movl	$0x6, %edx
   4b438:      	callq	0x4a4b0 <<toyos_crypto::keccak::Sponge>::new>
   4b43d:      	xorl	%r15d, %r15d
   4b440:      	movq	-0x48(%rbp), %rax
   4b444:      	jmp	0x4b48d <toyos_crypto::keccak::h+0x8d>
   4b446:      	nopw	%cs:(%rax,%rax)
   4b450:      	movq	%r14, %rdi
   4b453:      	callq	0x4a730 <<toyos_crypto::keccak::Sponge>::permute (.llvm.16569730505516846098)>
   4b458:      	movq	$0x0, -0x48(%rbp)
   4b460:      	xorl	%edi, %edi
   4b462:      	xorl	%eax, %eax
   4b464:      	leaq	-0x118(,%rdi,8), %rcx
   4b46c:      	addq	%rbp, %rcx
   4b46f:      	movl	%eax, %edx
   4b471:      	andl	$0x7, %edx
   4b474:      	movzbl	(%rdx,%rcx), %ecx
   4b478:      	movb	%cl, -0x40(%rbp,%r15)
   4b47d:      	incq	%r15
   4b480:      	incq	%rax
   4b483:      	movq	%rax, -0x48(%rbp)
   4b487:      	cmpq	$0x20, %r15
   4b48b:      	je	0x4b4b5 <toyos_crypto::keccak::h+0xb5>
   4b48d:      	cmpq	-0x50(%rbp), %rax
   4b491:      	je	0x4b450 <toyos_crypto::keccak::h+0x50>
   4b493:      	movq	%rax, %rdi
   4b496:      	shrq	$0x3, %rdi
   4b49a:      	cmpq	$0xc8, %rax
   4b4a0:      	jb	0x4b464 <toyos_crypto::keccak::h+0x64>
   4b4a2:      	leaq	0x7c4a7(%rip), %rdx     # 0xc7950 <anon.1fd67189aac25b0b46092a5d2fc7dafa.8.llvm.16569730505516846098>
   4b4a9:      	movl	$0x19, %esi
   4b4ae:      	callq	0xbf34d <core::panicking::panic_bounds_check>
   4b4b3:      	ud2
   4b4b5:      	movq	$0x0, -0x118(%rbp)
   4b4c0:      	movq	$0x0, -0x110(%rbp)
   4b4cb:      	movq	$0x0, -0x108(%rbp)
   4b4d6:      	movq	$0x0, -0x100(%rbp)
   4b4e1:      	movq	$0x0, -0xf8(%rbp)
   4b4ec:      	movq	$0x0, -0xf0(%rbp)
   4b4f7:      	movq	$0x0, -0xe8(%rbp)
   4b502:      	movq	$0x0, -0xe0(%rbp)
   4b50d:      	movq	$0x0, -0xd8(%rbp)
   4b518:      	movq	$0x0, -0xd0(%rbp)
   4b523:      	movq	$0x0, -0xc8(%rbp)
   4b52e:      	movq	$0x0, -0xc0(%rbp)
   4b539:      	movq	$0x0, -0xb8(%rbp)
   4b544:      	movq	$0x0, -0xb0(%rbp)
   4b54f:      	movq	$0x0, -0xa8(%rbp)
   4b55a:      	movq	$0x0, -0xa0(%rbp)
   4b565:      	movq	$0x0, -0x98(%rbp)
   4b570:      	movq	$0x0, -0x90(%rbp)
   4b57b:      	movq	$0x0, -0x88(%rbp)
   4b586:      	movq	$0x0, -0x80(%rbp)
   4b58e:      	movq	$0x0, -0x78(%rbp)
   4b596:      	movq	$0x0, -0x70(%rbp)
   4b59e:      	movq	$0x0, -0x68(%rbp)
   4b5a6:      	movq	$0x0, -0x60(%rbp)
   4b5ae:      	movq	$0x0, -0x58(%rbp)
   4b5b6:      	movaps	-0x40(%rbp), %xmm0
   4b5ba:      	movaps	-0x30(%rbp), %xmm1
   4b5be:      	movups	%xmm1, 0x10(%rbx)
   4b5c2:      	movups	%xmm0, (%rbx)
   4b5c5:      	movq	%rbx, %rax
   4b5c8:      	addq	$0x108, %rsp            # imm = 0x108
   4b5cf:      	popq	%rbx
   4b5d0:      	popq	%r14
   4b5d2:      	popq	%r15
   4b5d4:      	popq	%rbp
   4b5d5:      	retq
   4b5d6:      	movq	%rax, %rbx
   4b5d9:      	leaq	-0x118(%rbp), %rdi
   4b5e0:      	callq	0x55ed0 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   4b5e5:      	movq	%rbx, %rdi
   4b5e8:      	callq	0xb9f20 <_Unwind_Resume>
   4b5ed:      	callq	0xbf33a <core::panicking::panic_in_cleanup>
   4b5f2:      	int3
   4b5f3:      	int3
   4b5f4:      	int3
   4b5f5:      	int3
   4b5f6:      	int3
   4b5f7:      	int3
   4b5f8:      	int3
   4b5f9:      	int3
   4b5fa:      	int3
   4b5fb:      	int3
   4b5fc:      	int3
   4b5fd:      	int3
   4b5fe:      	int3
   4b5ff:      	int3

000000000004b600 <toyos_crypto::keccak::j>:
   4b600:      	pushq	%rbp
   4b601:      	movq	%rsp, %rbp
   4b604:      	pushq	%r15
   4b606:      	pushq	%r14
   4b608:      	pushq	%rbx
   4b609:      	subq	$0x108, %rsp            # imm = 0x108
   4b610:      	movq	%rdx, %r8
   4b613:      	movq	%rsi, %rcx
   4b616:      	movq	%rdi, %rbx
   4b619:      	xorps	%xmm0, %xmm0
   4b61c:      	movaps	%xmm0, -0x30(%rbp)
   4b620:      	movaps	%xmm0, -0x40(%rbp)
   4b624:      	leaq	-0x118(%rbp), %r14
   4b62b:      	movl	$0x88, %esi
   4b630:      	movq	%r14, %rdi
   4b633:      	movl	$0x1f, %edx
   4b638:      	callq	0x4a4b0 <<toyos_crypto::keccak::Sponge>::new>
   4b63d:      	xorl	%r15d, %r15d
   4b640:      	movq	-0x48(%rbp), %rax
   4b644:      	jmp	0x4b68d <toyos_crypto::keccak::j+0x8d>
   4b646:      	nopw	%cs:(%rax,%rax)
   4b650:      	movq	%r14, %rdi
   4b653:      	callq	0x4a730 <<toyos_crypto::keccak::Sponge>::permute (.llvm.16569730505516846098)>
   4b658:      	movq	$0x0, -0x48(%rbp)
   4b660:      	xorl	%edi, %edi
   4b662:      	xorl	%eax, %eax
   4b664:      	leaq	-0x118(,%rdi,8), %rcx
   4b66c:      	addq	%rbp, %rcx
   4b66f:      	movl	%eax, %edx
   4b671:      	andl	$0x7, %edx
   4b674:      	movzbl	(%rdx,%rcx), %ecx
   4b678:      	movb	%cl, -0x40(%rbp,%r15)
   4b67d:      	incq	%r15
   4b680:      	incq	%rax
   4b683:      	movq	%rax, -0x48(%rbp)
   4b687:      	cmpq	$0x20, %r15
   4b68b:      	je	0x4b6b5 <toyos_crypto::keccak::j+0xb5>
   4b68d:      	cmpq	-0x50(%rbp), %rax
   4b691:      	je	0x4b650 <toyos_crypto::keccak::j+0x50>
   4b693:      	movq	%rax, %rdi
   4b696:      	shrq	$0x3, %rdi
   4b69a:      	cmpq	$0xc8, %rax
   4b6a0:      	jb	0x4b664 <toyos_crypto::keccak::j+0x64>
   4b6a2:      	leaq	0x7c2a7(%rip), %rdx     # 0xc7950 <anon.1fd67189aac25b0b46092a5d2fc7dafa.8.llvm.16569730505516846098>
   4b6a9:      	movl	$0x19, %esi
   4b6ae:      	callq	0xbf34d <core::panicking::panic_bounds_check>
   4b6b3:      	ud2
   4b6b5:      	movq	$0x0, -0x118(%rbp)
   4b6c0:      	movq	$0x0, -0x110(%rbp)
   4b6cb:      	movq	$0x0, -0x108(%rbp)
   4b6d6:      	movq	$0x0, -0x100(%rbp)
   4b6e1:      	movq	$0x0, -0xf8(%rbp)
   4b6ec:      	movq	$0x0, -0xf0(%rbp)
   4b6f7:      	movq	$0x0, -0xe8(%rbp)
   4b702:      	movq	$0x0, -0xe0(%rbp)
   4b70d:      	movq	$0x0, -0xd8(%rbp)
   4b718:      	movq	$0x0, -0xd0(%rbp)
   4b723:      	movq	$0x0, -0xc8(%rbp)
   4b72e:      	movq	$0x0, -0xc0(%rbp)
   4b739:      	movq	$0x0, -0xb8(%rbp)
   4b744:      	movq	$0x0, -0xb0(%rbp)
   4b74f:      	movq	$0x0, -0xa8(%rbp)
   4b75a:      	movq	$0x0, -0xa0(%rbp)
   4b765:      	movq	$0x0, -0x98(%rbp)
   4b770:      	movq	$0x0, -0x90(%rbp)
   4b77b:      	movq	$0x0, -0x88(%rbp)
   4b786:      	movq	$0x0, -0x80(%rbp)
   4b78e:      	movq	$0x0, -0x78(%rbp)
   4b796:      	movq	$0x0, -0x70(%rbp)
   4b79e:      	movq	$0x0, -0x68(%rbp)
   4b7a6:      	movq	$0x0, -0x60(%rbp)
   4b7ae:      	movq	$0x0, -0x58(%rbp)
   4b7b6:      	movaps	-0x40(%rbp), %xmm0
   4b7ba:      	movaps	-0x30(%rbp), %xmm1
   4b7be:      	movups	%xmm1, 0x10(%rbx)
   4b7c2:      	movups	%xmm0, (%rbx)
   4b7c5:      	movq	%rbx, %rax
   4b7c8:      	addq	$0x108, %rsp            # imm = 0x108
   4b7cf:      	popq	%rbx
   4b7d0:      	popq	%r14
   4b7d2:      	popq	%r15
   4b7d4:      	popq	%rbp
   4b7d5:      	retq
   4b7d6:      	movq	%rax, %rbx
   4b7d9:      	leaq	-0x118(%rbp), %rdi
   4b7e0:      	callq	0x55ed0 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   4b7e5:      	movq	%rbx, %rdi
   4b7e8:      	callq	0xb9f20 <_Unwind_Resume>
   4b7ed:      	callq	0xbf33a <core::panicking::panic_in_cleanup>
   4b7f2:      	int3
   4b7f3:      	int3
   4b7f4:      	int3
   4b7f5:      	int3
   4b7f6:      	int3
   4b7f7:      	int3
   4b7f8:      	int3
   4b7f9:      	int3
   4b7fa:      	int3
   4b7fb:      	int3
   4b7fc:      	int3
   4b7fd:      	int3
   4b7fe:      	int3
   4b7ff:      	int3

0000000000055d20 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>>:
   55d20:      	xorl	%eax, %eax
   55d22:      	nopw	%cs:(%rax,%rax)
   55d30:      	movw	$0x0, (%rdi,%rax)
   55d36:      	movw	$0x0, 0x2(%rdi,%rax)
   55d3d:      	movw	$0x0, 0x4(%rdi,%rax)
   55d44:      	movw	$0x0, 0x6(%rdi,%rax)
   55d4b:      	movw	$0x0, 0x8(%rdi,%rax)
   55d52:      	movw	$0x0, 0xa(%rdi,%rax)
   55d59:      	movw	$0x0, 0xc(%rdi,%rax)
   55d60:      	movw	$0x0, 0xe(%rdi,%rax)
   55d67:      	addq	$0x10, %rax
   55d6b:      	cmpq	$0x200, %rax            # imm = 0x200
   55d71:      	jne	0x55d30 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>+0x10>
   55d73:      	xorl	%eax, %eax
   55d75:      	nopw	%cs:(%rax,%rax)
   55d80:      	movw	$0x0, 0x200(%rdi,%rax)
   55d8a:      	movw	$0x0, 0x202(%rdi,%rax)
   55d94:      	movw	$0x0, 0x204(%rdi,%rax)
   55d9e:      	movw	$0x0, 0x206(%rdi,%rax)
   55da8:      	movw	$0x0, 0x208(%rdi,%rax)
   55db2:      	movw	$0x0, 0x20a(%rdi,%rax)
   55dbc:      	movw	$0x0, 0x20c(%rdi,%rax)
   55dc6:      	movw	$0x0, 0x20e(%rdi,%rax)
   55dd0:      	addq	$0x10, %rax
   55dd4:      	cmpq	$0x200, %rax            # imm = 0x200
   55dda:      	jne	0x55d80 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>+0x60>
   55ddc:      	xorl	%eax, %eax
   55dde:      	nop
   55de0:      	movw	$0x0, 0x400(%rdi,%rax)
   55dea:      	movw	$0x0, 0x402(%rdi,%rax)
   55df4:      	movw	$0x0, 0x404(%rdi,%rax)
   55dfe:      	movw	$0x0, 0x406(%rdi,%rax)
   55e08:      	movw	$0x0, 0x408(%rdi,%rax)
   55e12:      	movw	$0x0, 0x40a(%rdi,%rax)
   55e1c:      	movw	$0x0, 0x40c(%rdi,%rax)
   55e26:      	movw	$0x0, 0x40e(%rdi,%rax)
   55e30:      	addq	$0x10, %rax
   55e34:      	cmpq	$0x200, %rax            # imm = 0x200
   55e3a:      	jne	0x55de0 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>+0xc0>
   55e3c:      	pushq	%rbp
   55e3d:      	movq	%rsp, %rbp
   55e40:      	xorps	%xmm0, %xmm0
   55e43:      	movaps	%xmm0, -0x10(%rbp)
   55e47:      	movaps	-0x10(%rbp), %xmm1
   55e4b:      	movups	%xmm1, 0xac0(%rdi)
   55e52:      	movaps	%xmm0, -0x10(%rbp)
   55e56:      	movaps	-0x10(%rbp), %xmm0
   55e5a:      	movups	%xmm0, 0xad0(%rdi)
   55e61:      	popq	%rbp
   55e62:      	retq
   55e63:      	int3
   55e64:      	int3
   55e65:      	int3
   55e66:      	int3
   55e67:      	int3
   55e68:      	int3
   55e69:      	int3
   55e6a:      	int3
   55e6b:      	int3
   55e6c:      	int3
   55e6d:      	int3
   55e6e:      	int3
   55e6f:      	int3

0000000000055e70 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop>:
   55e70:      	pushq	%rbp
   55e71:      	movq	%rsp, %rbp
   55e74:      	xorl	%eax, %eax
   55e76:      	nopw	%cs:(%rax,%rax)
   55e80:      	movw	$0x0, (%rdi,%rax)
   55e86:      	movw	$0x0, 0x2(%rdi,%rax)
   55e8d:      	movw	$0x0, 0x4(%rdi,%rax)
   55e94:      	movw	$0x0, 0x6(%rdi,%rax)
   55e9b:      	movw	$0x0, 0x8(%rdi,%rax)
   55ea2:      	movw	$0x0, 0xa(%rdi,%rax)
   55ea9:      	movw	$0x0, 0xc(%rdi,%rax)
   55eb0:      	movw	$0x0, 0xe(%rdi,%rax)
   55eb7:      	addq	$0x10, %rax
   55ebb:      	cmpq	$0x200, %rax            # imm = 0x200
   55ec1:      	jne	0x55e80 <<toyos_crypto::mlkem::Poly as core::ops::drop::Drop>::drop+0x10>
   55ec3:      	popq	%rbp
   55ec4:      	retq
   55ec5:      	int3
   55ec6:      	int3
   55ec7:      	int3
   55ec8:      	int3
   55ec9:      	int3
   55eca:      	int3
   55ecb:      	int3
   55ecc:      	int3
   55ecd:      	int3
   55ece:      	int3
   55ecf:      	int3

0000000000055ed0 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>:
   55ed0:      	pushq	%rbp
   55ed1:      	movq	%rsp, %rbp
   55ed4:      	movq	$0x0, (%rdi)
   55edb:      	movq	$0x0, 0x8(%rdi)
   55ee3:      	movq	$0x0, 0x10(%rdi)
   55eeb:      	movq	$0x0, 0x18(%rdi)
   55ef3:      	movq	$0x0, 0x20(%rdi)
   55efb:      	movq	$0x0, 0x28(%rdi)
   55f03:      	movq	$0x0, 0x30(%rdi)
   55f0b:      	movq	$0x0, 0x38(%rdi)
   55f13:      	movq	$0x0, 0x40(%rdi)
   55f1b:      	movq	$0x0, 0x48(%rdi)
   55f23:      	movq	$0x0, 0x50(%rdi)
   55f2b:      	movq	$0x0, 0x58(%rdi)
   55f33:      	movq	$0x0, 0x60(%rdi)
   55f3b:      	movq	$0x0, 0x68(%rdi)
   55f43:      	movq	$0x0, 0x70(%rdi)
   55f4b:      	movq	$0x0, 0x78(%rdi)
   55f53:      	movq	$0x0, 0x80(%rdi)
   55f5e:      	movq	$0x0, 0x88(%rdi)
   55f69:      	movq	$0x0, 0x90(%rdi)
   55f74:      	movq	$0x0, 0x98(%rdi)
   55f7f:      	movq	$0x0, 0xa0(%rdi)
   55f8a:      	movq	$0x0, 0xa8(%rdi)
   55f95:      	movq	$0x0, 0xb0(%rdi)
   55fa0:      	movq	$0x0, 0xb8(%rdi)
   55fab:      	movq	$0x0, 0xc0(%rdi)
   55fb6:      	popq	%rbp
   55fb7:      	retq
   55fb8:      	int3
   55fb9:      	int3
   55fba:      	int3
   55fbb:      	int3
   55fbc:      	int3
   55fbd:      	int3
   55fbe:      	int3
   55fbf:      	int3

0000000000056090 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>:
   56090:      	pushq	%rbp
   56091:      	movq	%rsp, %rbp
   56094:      	movq	0x10(%rdi), %rax
   56098:      	cmpq	0x8(%rdi), %rax
   5609c:      	ja	0x56115 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x85>
   5609e:      	testq	%rax, %rax
   560a1:      	je	0x56113 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x83>
   560a3:      	movq	(%rdi), %rcx
   560a6:      	addq	$0xe, %rcx
   560aa:      	xorl	%edx, %edx
   560ac:      	nopl	(%rax)
   560b0:      	xorl	%esi, %esi
   560b2:      	nopw	%cs:(%rax,%rax)
   560c0:      	movw	$0x0, -0xe(%rcx,%rsi)
   560c7:      	movw	$0x0, -0xc(%rcx,%rsi)
   560ce:      	movw	$0x0, -0xa(%rcx,%rsi)
   560d5:      	movw	$0x0, -0x8(%rcx,%rsi)
   560dc:      	movw	$0x0, -0x6(%rcx,%rsi)
   560e3:      	movw	$0x0, -0x4(%rcx,%rsi)
   560ea:      	movw	$0x0, -0x2(%rcx,%rsi)
   560f1:      	movw	$0x0, (%rcx,%rsi)
   560f7:      	addq	$0x10, %rsi
   560fb:      	cmpq	$0x200, %rsi            # imm = 0x200
   56102:      	jne	0x560c0 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x30>
   56104:      	incq	%rdx
   56107:      	addq	$0x200, %rcx            # imm = 0x200
   5610e:      	cmpq	%rax, %rdx
   56111:      	jne	0x560b0 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x20>
   56113:      	popq	%rbp
   56114:      	retq
   56115:      	leaq	-0x3dfb6(%rip), %rdi    # 0x18166 <anon.ffc1aded08de8b2a105054a61a13d06b.5.llvm.10786651499350334936+0x11b>
   5611c:      	leaq	0x719ad(%rip), %rcx     # 0xc7ad0 <anon.ffc1aded08de8b2a105054a61a13d06b.1.llvm.10786651499350334936+0x138>
   56123:      	movl	$0x1b5, %esi            # imm = 0x1B5
   56128:      	xorl	%edx, %edx
   5612a:      	callq	0xbf390 <core::panicking::panic_nounwind_fmt>
   5612f:      	int3

0000000000056130 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes>:
   56130:      	pushq	%rbp
   56131:      	movq	%rsp, %rbp
   56134:      	pushq	%r15
   56136:      	pushq	%r14
   56138:      	pushq	%r13
   5613a:      	pushq	%r12
   5613c:      	pushq	%rbx
   5613d:      	subq	$0x408, %rsp            # imm = 0x408
   56144:      	movq	%rdi, %rbx
   56147:      	cmpq	$0x4a0, %rdx            # imm = 0x4A0
   5614e:      	jne	0x563ef <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2bf>
   56154:      	movq	%rsi, %r14
   56157:      	xorl	%r13d, %r13d
   5615a:      	leaq	-0x428(%rbp), %r15
   56161:      	leaq	(%r14,%r13), %r12
   56165:      	movl	$0x200, %edx            # imm = 0x200
   5616a:      	movq	%r15, %rdi
   5616d:      	xorl	%esi, %esi
   5616f:      	callq	0xc6240 <memset>
   56174:      	xorl	%eax, %eax
   56176:      	movq	%r15, %rdx
   56179:      	nopl	(%rax)
   56180:      	movq	%rax, %rcx
   56183:      	shrq	$0x3, %rcx
   56187:      	movzbl	(%r12,%rcx), %r9d
   5618c:      	movl	%eax, %ecx
   5618e:      	andb	$0x4, %cl
   56191:      	movzbl	%cl, %esi
   56194:      	xorl	%r8d, %r8d
   56197:      	btl	%esi, %r9d
   5619b:      	setb	%r8b
   5619f:      	leal	0x1(%rsi), %ecx
   561a2:      	movl	%r9d, %r10d
   561a5:      	shrl	%cl, %r10d
   561a8:      	orw	(%rdx), %r8w
   561ac:      	leal	0x2(%rsi), %ecx
   561af:      	movl	%r9d, %edi
   561b2:      	shrl	%cl, %edi
   561b4:      	addl	%r10d, %r10d
   561b7:      	andl	$0x2, %r10d
   561bb:      	shll	$0x2, %edi
   561be:      	leal	0x3(%rsi), %ecx
   561c1:      	shrl	%cl, %r9d
   561c4:      	andl	$0x4, %edi
   561c7:      	orl	%r10d, %edi
   561ca:      	shll	$0x3, %r9d
   561ce:      	leaq	0x4(%rax), %rcx
   561d2:      	movq	%rcx, %r10
   561d5:      	shrq	$0x3, %r10
   561d9:      	movzbl	(%r12,%r10), %r10d
   561de:      	andb	$0x4, %cl
   561e1:      	shrl	%cl, %r10d
   561e4:      	andl	$0x8, %r9d
   561e8:      	orl	%edi, %r9d
   561eb:      	shll	$0x4, %r10d
   561ef:      	leaq	0x5(%rax), %rcx
   561f3:      	movq	%rcx, %rdi
   561f6:      	shrq	$0x3, %rdi
   561fa:      	movzbl	(%r12,%rdi), %edi
   561ff:      	andb	$0x5, %cl
   56202:      	shrl	%cl, %edi
   56204:      	andl	$0x10, %r10d
   56208:      	orl	%r9d, %r10d
   5620b:      	shll	$0x5, %edi
   5620e:      	andl	$0x20, %edi
   56211:      	orl	%r10d, %edi
   56214:      	orl	%r8d, %edi
   56217:      	leaq	0x6(%rax), %rcx
   5621b:      	movq	%rcx, %r8
   5621e:      	shrq	$0x3, %r8
   56222:      	movzbl	(%r12,%r8), %r8d
   56227:      	andb	$0x6, %cl
   5622a:      	shrl	%cl, %r8d
   5622d:      	leaq	0x7(%rax), %rcx
   56231:      	movq	%rcx, %r9
   56234:      	shrq	$0x3, %r9
   56238:      	movzbl	(%r12,%r9), %r9d
   5623d:      	andb	$0x7, %cl
   56240:      	shrb	%cl, %r9b
   56243:      	shll	$0x6, %r8d
   56247:      	andl	$0x40, %r8d
   5624b:      	shlb	$0x7, %r9b
   5624f:      	movzbl	%r9b, %ecx
   56253:      	orl	%r8d, %ecx
   56256:      	leaq	0x8(%rax), %r8
   5625a:      	shrq	$0x3, %r8
   5625e:      	movzbl	(%r12,%r8), %r8d
   56263:      	xorl	%r9d, %r9d
   56266:      	btl	%esi, %r8d
   5626a:      	setb	%r9b
   5626e:      	shll	$0x8, %r9d
   56272:      	orl	%ecx, %r9d
   56275:      	leaq	0x9(%rax), %rcx
   56279:      	movq	%rcx, %rsi
   5627c:      	shrq	$0x3, %rsi
   56280:      	movzbl	(%r12,%rsi), %esi
   56285:      	andl	$0x5, %ecx
   56288:      	xorl	%r8d, %r8d
   5628b:      	btl	%ecx, %esi
   5628e:      	setb	%r8b
   56292:      	shll	$0x9, %r8d
   56296:      	orl	%r9d, %r8d
   56299:      	leaq	0xa(%rax), %rcx
   5629d:      	movq	%rcx, %rsi
   562a0:      	shrq	$0x3, %rsi
   562a4:      	movzbl	(%r12,%rsi), %esi
   562a9:      	andl	$0x6, %ecx
   562ac:      	xorl	%r9d, %r9d
   562af:      	btl	%ecx, %esi
   562b2:      	setb	%r9b
   562b6:      	shll	$0xa, %r9d
   562ba:      	orl	%r8d, %r9d
   562bd:      	orl	%edi, %r9d
   562c0:      	leaq	0xb(%rax), %rcx
   562c4:      	movq	%rcx, %rsi
   562c7:      	shrq	$0x3, %rsi
   562cb:      	movzbl	(%r12,%rsi), %esi
   562d0:      	andl	$0x7, %ecx
   562d3:      	xorl	%edi, %edi
   562d5:      	btl	%ecx, %esi
   562d8:      	setb	%dil
   562dc:      	shll	$0xb, %edi
   562df:      	orl	%r9d, %edi
   562e2:      	movw	%di, (%rdx)
   562e5:      	addq	$0x2, %rdx
   562e9:      	addq	$0xc, %rax
   562ed:      	cmpq	$0xc00, %rax            # imm = 0xC00
   562f3:      	jne	0x56180 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x50>
   562f9:      	addq	$0x180, %r13            # imm = 0x180
   56300:      	movl	$0x200, %edx            # imm = 0x200
   56305:      	leaq	-0x228(%rbp), %rdi
   5630c:      	movq	%r15, %rsi
   5630f:      	callq	0xc5af0 <memcpy>
   56314:      	xorl	%eax, %eax
   56316:      	nopw	%cs:(%rax,%rax)
   56320:      	cmpq	$0x200, %rax            # imm = 0x200
   56326:      	je	0x5636d <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x23d>
   56328:      	cmpw	$0xd00, -0x228(%rbp,%rax) # imm = 0xD00
   56332:      	ja	0x563f6 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2c6>
   56338:      	cmpw	$0xd00, -0x226(%rbp,%rax) # imm = 0xD00
   56342:      	ja	0x563f6 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2c6>
   56348:      	cmpw	$0xd00, -0x224(%rbp,%rax) # imm = 0xD00
   56352:      	ja	0x563f6 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2c6>
   56358:      	cmpw	$0xd00, -0x222(%rbp,%rax) # imm = 0xD00
   56362:      	leaq	0x8(%rax), %rax
   56366:      	jbe	0x56320 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x1f0>
   56368:      	jmp	0x563f6 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2c6>
   5636d:      	xorl	%eax, %eax
   5636f:      	nop
   56370:      	movw	$0x0, -0x228(%rbp,%rax)
   5637a:      	movw	$0x0, -0x226(%rbp,%rax)
   56384:      	movw	$0x0, -0x224(%rbp,%rax)
   5638e:      	movw	$0x0, -0x222(%rbp,%rax)
   56398:      	movw	$0x0, -0x220(%rbp,%rax)
   563a2:      	movw	$0x0, -0x21e(%rbp,%rax)
   563ac:      	movw	$0x0, -0x21c(%rbp,%rax)
   563b6:      	movw	$0x0, -0x21a(%rbp,%rax)
   563c0:      	addq	$0x10, %rax
   563c4:      	cmpq	$0x200, %rax            # imm = 0x200
   563ca:      	jne	0x56370 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x240>
   563cc:      	cmpq	$0x480, %r13            # imm = 0x480
   563d3:      	jne	0x56161 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x31>
   563d9:      	leaq	0x1(%rbx), %rdi
   563dd:      	movl	$0x4a0, %edx            # imm = 0x4A0
   563e2:      	movq	%r14, %rsi
   563e5:      	callq	0xc5af0 <memcpy>
   563ea:      	movb	$0x0, (%rbx)
   563ed:      	jmp	0x5645c <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x32c>
   563ef:      	movw	$0x1, (%rbx)
   563f4:      	jmp	0x5645c <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x32c>
   563f6:      	movw	$0x201, (%rbx)          # imm = 0x201
   563fb:      	xorl	%eax, %eax
   563fd:      	nopl	(%rax)
   56400:      	movw	$0x0, -0x228(%rbp,%rax)
   5640a:      	movw	$0x0, -0x226(%rbp,%rax)
   56414:      	movw	$0x0, -0x224(%rbp,%rax)
   5641e:      	movw	$0x0, -0x222(%rbp,%rax)
   56428:      	movw	$0x0, -0x220(%rbp,%rax)
   56432:      	movw	$0x0, -0x21e(%rbp,%rax)
   5643c:      	movw	$0x0, -0x21c(%rbp,%rax)
   56446:      	movw	$0x0, -0x21a(%rbp,%rax)
   56450:      	addq	$0x10, %rax
   56454:      	cmpq	$0x200, %rax            # imm = 0x200
   5645a:      	jne	0x56400 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x2d0>
   5645c:      	movq	%rbx, %rax
   5645f:      	addq	$0x408, %rsp            # imm = 0x408
   56466:      	popq	%rbx
   56467:      	popq	%r12
   56469:      	popq	%r13
   5646b:      	popq	%r14
   5646d:      	popq	%r15
   5646f:      	popq	%rbp
   56470:      	retq
   56471:      	int3
   56472:      	int3
   56473:      	int3
   56474:      	int3
   56475:      	int3
   56476:      	int3
   56477:      	int3
   56478:      	int3
   56479:      	int3
   5647a:      	int3
   5647b:      	int3
   5647c:      	int3
   5647d:      	int3
   5647e:      	int3
   5647f:      	int3

0000000000056480 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>:
   56480:      	pushq	%rbp
   56481:      	movq	%rsp, %rbp
   56484:      	pushq	%r15
   56486:      	pushq	%r14
   56488:      	pushq	%r13
   5648a:      	pushq	%r12
   5648c:      	pushq	%rbx
   5648d:      	subq	$0x1000, %rsp           # imm = 0x1000
   56494:      	movq	$0x0, (%rsp)
   5649c:      	subq	$0xa38, %rsp            # imm = 0xA38
   564a3:      	movq	%rdx, -0x58(%rbp)
   564a7:      	movq	%rsi, -0x48(%rbp)
   564ab:      	movq	%rdi, %r15
   564ae:      	leaq	-0x1a60(%rbp), %rax
   564b5:      	movq	%rax, -0x860(%rbp)
   564bc:      	movq	$0x3, -0x858(%rbp)
   564c7:      	xorl	%r14d, %r14d
   564ca:      	leaq	-0x1060(%rbp), %rdi
   564d1:      	movq	%rcx, -0x38(%rbp)
   564d5:      	movq	%rcx, %rsi
   564d8:      	xorl	%edx, %edx
   564da:      	callq	0x5a5a0 <toyos_crypto::mlkem::noise>
   564df:      	xorl	%r14d, %r14d
   564e2:      	leaq	-0x660(%rbp), %rdi
   564e9:      	leaq	-0x1060(%rbp), %rsi
   564f0:      	callq	0x59760 <<toyos_crypto::mlkem::Poly>::ntt>
   564f5:      	leaq	-0x260(%rbp), %rbx
   564fc:      	leaq	-0x660(%rbp), %rsi
   56503:      	movl	$0x200, %edx            # imm = 0x200
   56508:      	movq	%rbx, %rdi
   5650b:      	callq	0xc5af0 <memcpy>
   56510:      	leaq	-0xa60(%rbp), %r14
   56517:      	movl	$0x200, %edx            # imm = 0x200
   5651c:      	movq	%r14, %rdi
   5651f:      	movq	%rbx, %rsi
   56522:      	callq	0xc5af0 <memcpy>
   56527:      	leaq	-0x460(%rbp), %rbx
   5652e:      	movl	$0x200, %edx            # imm = 0x200
   56533:      	movq	%rbx, %rdi
   56536:      	movq	%r14, %rsi
   56539:      	callq	0xc5af0 <memcpy>
   5653e:      	leaq	-0x1a60(%rbp), %rdi
   56545:      	movl	$0x200, %edx            # imm = 0x200
   5654a:      	movq	%rbx, %rsi
   5654d:      	callq	0xc5af0 <memcpy>
   56552:      	movl	$0x1, %r14d
   56558:      	leaq	-0x1060(%rbp), %rdi
   5655f:      	movq	-0x38(%rbp), %rsi
   56563:      	movl	$0x1, %edx
   56568:      	callq	0x5a5a0 <toyos_crypto::mlkem::noise>
   5656d:      	leaq	-0x660(%rbp), %rdi
   56574:      	leaq	-0x1060(%rbp), %rsi
   5657b:      	callq	0x59760 <<toyos_crypto::mlkem::Poly>::ntt>
   56580:      	leaq	-0x260(%rbp), %rbx
   56587:      	leaq	-0x660(%rbp), %rsi
   5658e:      	movl	$0x200, %edx            # imm = 0x200
   56593:      	movq	%rbx, %rdi
   56596:      	callq	0xc5af0 <memcpy>
   5659b:      	leaq	-0xa60(%rbp), %r14
   565a2:      	movl	$0x200, %edx            # imm = 0x200
   565a7:      	movq	%r14, %rdi
   565aa:      	movq	%rbx, %rsi
   565ad:      	callq	0xc5af0 <memcpy>
   565b2:      	leaq	-0x460(%rbp), %rbx
   565b9:      	movl	$0x200, %edx            # imm = 0x200
   565be:      	movq	%rbx, %rdi
   565c1:      	movq	%r14, %rsi
   565c4:      	callq	0xc5af0 <memcpy>
   565c9:      	leaq	-0x1860(%rbp), %rdi
   565d0:      	movl	$0x200, %edx            # imm = 0x200
   565d5:      	movq	%rbx, %rsi
   565d8:      	callq	0xc5af0 <memcpy>
   565dd:      	movl	$0x2, %r14d
   565e3:      	leaq	-0x1060(%rbp), %rdi
   565ea:      	movq	-0x38(%rbp), %rsi
   565ee:      	movl	$0x2, %edx
   565f3:      	callq	0x5a5a0 <toyos_crypto::mlkem::noise>
   565f8:      	leaq	-0x660(%rbp), %rdi
   565ff:      	leaq	-0x1060(%rbp), %rsi
   56606:      	callq	0x59760 <<toyos_crypto::mlkem::Poly>::ntt>
   5660b:      	movq	%r15, -0x50(%rbp)
   5660f:      	movq	-0x48(%rbp), %rax
   56613:      	addq	$0x480, %rax            # imm = 0x480
   56619:      	movq	%rax, -0x40(%rbp)
   5661d:      	leaq	-0x260(%rbp), %rbx
   56624:      	leaq	-0x660(%rbp), %rsi
   5662b:      	movl	$0x200, %edx            # imm = 0x200
   56630:      	movq	%rbx, %rdi
   56633:      	callq	0xc5af0 <memcpy>
   56638:      	leaq	-0xa60(%rbp), %r14
   5663f:      	movl	$0x200, %edx            # imm = 0x200
   56644:      	movq	%r14, %rdi
   56647:      	movq	%rbx, %rsi
   5664a:      	callq	0xc5af0 <memcpy>
   5664f:      	leaq	-0x460(%rbp), %r12
   56656:      	movl	$0x200, %edx            # imm = 0x200
   5665b:      	movq	%r12, %rdi
   5665e:      	movq	%r14, %rsi
   56661:      	callq	0xc5af0 <memcpy>
   56666:      	leaq	-0x1660(%rbp), %rdi
   5666d:      	movl	$0x200, %edx            # imm = 0x200
   56672:      	movq	%r12, %rsi
   56675:      	callq	0xc5af0 <memcpy>
   5667a:      	leaq	-0x1060(%rbp), %rdi
   56681:      	leaq	-0x1a60(%rbp), %rsi
   56688:      	movl	$0x600, %edx            # imm = 0x600
   5668d:      	callq	0xc5af0 <memcpy>
   56692:      	leaq	-0x1a60(%rbp), %rdi
   56699:      	xorl	%r14d, %r14d
   5669c:      	movl	$0x440, %edx            # imm = 0x440
   566a1:      	xorl	%esi, %esi
   566a3:      	callq	0xc6240 <memset>
   566a8:      	movl	$0x9d7dbb41, %ebx       # imm = 0x9D7DBB41
   566ad:      	nopl	(%rax)
   566b0:      	movq	%r14, -0x30(%rbp)
   566b4:      	leaq	0x1(%r14), %rax
   566b8:      	movq	%rax, -0x60(%rbp)
   566bc:      	movl	$0x200, %edx            # imm = 0x200
   566c1:      	leaq	-0x860(%rbp), %rdi
   566c8:      	xorl	%esi, %esi
   566ca:      	callq	0xc6240 <memset>
   566cf:      	xorl	%r15d, %r15d
   566d2:      	xorl	%r13d, %r13d
   566d5:      	nopw	%cs:(%rax,%rax)
   566e0:      	leaq	-0x660(%rbp), %rdi
   566e7:      	movq	-0x40(%rbp), %rsi
   566eb:      	movq	%r15, %rdx
   566ee:      	movq	-0x30(%rbp), %rcx
   566f2:      	callq	0x5ab30 <toyos_crypto::mlkem::sample>
   566f7:      	leaq	-0x1060(,%r13), %r14
   566ff:      	addq	%rbp, %r14
   56702:      	addq	$0x200, %r13            # imm = 0x200
   56709:      	incq	%r15
   5670c:      	movl	$0x200, %edx            # imm = 0x200
   56711:      	movq	%r12, %rdi
   56714:      	xorl	%esi, %esi
   56716:      	callq	0xc6240 <memset>
   5671b:      	xorl	%eax, %eax
   5671d:      	jmp	0x56848 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x3c8>
   56722:      	nopw	%cs:(%rax,%rax)
   56730:      	movzwl	-0x660(%rbp,%rax,4), %edi
   56738:      	movzwl	(%r14,%rax,4), %edx
   5673d:      	movl	%edx, %r9d
   56740:      	imull	%edi, %r9d
   56744:      	imulq	$0x3afb7681, %r9, %rsi  # imm = 0x3AFB7681
   5674b:      	shrq	$0x20, %rsi
   5674f:      	movl	%r9d, %r8d
   56752:      	subl	%esi, %r8d
   56755:      	shrl	%r8d
   56758:      	addl	%esi, %r8d
   5675b:      	shrl	$0xb, %r8d
   5675f:      	imull	$0xd01, %r8d, %esi      # imm = 0xD01
   56766:      	subl	%esi, %r9d
   56769:      	movzwl	-0x65e(%rbp,%rax,4), %r8d
   56772:      	movzwl	0x2(%r14,%rax,4), %esi
   56778:      	movl	%esi, %r10d
   5677b:      	imull	%r8d, %r10d
   5677f:      	imulq	$0x3afb7681, %r10, %r11 # imm = 0x3AFB7681
   56786:      	shrq	$0x20, %r11
   5678a:      	movl	%r10d, %r12d
   5678d:      	subl	%r11d, %r12d
   56790:      	shrl	%r12d
   56793:      	addl	%r11d, %r12d
   56796:      	shrl	$0xb, %r12d
   5679a:      	imull	$0xd01, %r12d, %r11d    # imm = 0xD01
   567a1:      	subl	%r11d, %r10d
   567a4:      	movzwl	%cx, %ecx
   567a7:      	imull	%r10d, %ecx
   567ab:      	imulq	$0x13afb769, %rcx, %r10 # imm = 0x13AFB769
   567b2:      	shrq	$0x28, %r10
   567b6:      	imull	$0xd01, %r10d, %r10d    # imm = 0xD01
   567bd:      	subl	%r10d, %ecx
   567c0:      	addl	%r9d, %ecx
   567c3:      	leal	-0xd01(%rcx), %r9d
   567ca:      	cmpl	$0xd01, %ecx            # imm = 0xD01
   567d0:      	cmovbl	%ecx, %r9d
   567d4:      	movw	%r9w, -0x460(%rbp,%rax,4)
   567dd:      	imull	%edi, %esi
   567e0:      	imulq	$0x3afb7681, %rsi, %rcx # imm = 0x3AFB7681
   567e7:      	shrq	$0x20, %rcx
   567eb:      	movl	%esi, %edi
   567ed:      	subl	%ecx, %edi
   567ef:      	shrl	%edi
   567f1:      	addl	%ecx, %edi
   567f3:      	shrl	$0xb, %edi
   567f6:      	imull	$0xd01, %edi, %ecx      # imm = 0xD01
   567fc:      	subl	%ecx, %esi
   567fe:      	imull	%r8d, %edx
   56802:      	imulq	$0x3afb7681, %rdx, %rcx # imm = 0x3AFB7681
   56809:      	shrq	$0x20, %rcx
   5680d:      	movl	%edx, %edi
   5680f:      	subl	%ecx, %edi
   56811:      	shrl	%edi
   56813:      	addl	%ecx, %edi
   56815:      	shrl	$0xb, %edi
   56818:      	imull	$0xd01, %edi, %ecx      # imm = 0xD01
   5681e:      	subl	%ecx, %edx
   56820:      	addl	%esi, %edx
   56822:      	leal	-0xd01(%rdx), %ecx
   56828:      	cmpl	$0xd01, %edx            # imm = 0xD01
   5682e:      	cmovbl	%edx, %ecx
   56831:      	movw	%cx, -0x45e(%rbp,%rax,4)
   56839:      	incq	%rax
   5683c:      	cmpq	$0x80, %rax
   56842:      	je	0x568e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x460>
   56848:      	movl	%eax, %ecx
   5684a:      	rolb	$0x4, %cl
   5684d:      	orb	$0x8, %cl
   56850:      	movl	%ecx, %edx
   56852:      	andb	$0x33, %dl
   56855:      	shlb	$0x2, %dl
   56858:      	shrb	$0x2, %cl
   5685b:      	andb	$0x33, %cl
   5685e:      	orb	%dl, %cl
   56860:      	movl	%ecx, %edx
   56862:      	andb	$0x55, %dl
   56865:      	addb	%dl, %dl
   56867:      	shrb	%cl
   56869:      	andb	$0x55, %cl
   5686c:      	orb	%dl, %cl
   5686e:      	movzbl	%cl, %edx
   56871:      	movw	$0x1, %cx
   56875:      	movw	$0x11, %si
   56879:      	jmp	0x5689e <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x41e>
   5687b:      	nopl	(%rax,%rax)
   56880:      	imull	%esi, %esi
   56883:      	movq	%rsi, %rdi
   56886:      	imulq	%rbx, %rdi
   5688a:      	shrq	$0x2b, %rdi
   5688e:      	imull	$0xd01, %edi, %edi      # imm = 0xD01
   56894:      	subl	%edi, %esi
   56896:      	shrl	%edx
   56898:      	je	0x56730 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x2b0>
   5689e:      	movzwl	%si, %esi
   568a1:      	testb	$0x1, %dl
   568a4:      	je	0x56880 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x400>
   568a6:      	movzwl	%cx, %ecx
   568a9:      	imull	%esi, %ecx
   568ac:      	imulq	$0x3afb7681, %rcx, %rdi # imm = 0x3AFB7681
   568b3:      	shrq	$0x20, %rdi
   568b7:      	movl	%ecx, %r8d
   568ba:      	subl	%edi, %r8d
   568bd:      	shrl	%r8d
   568c0:      	addl	%edi, %r8d
   568c3:      	shrl	$0xb, %r8d
   568c7:      	imull	$0xd01, %r8d, %edi      # imm = 0xD01
   568ce:      	subl	%edi, %ecx
   568d0:      	jmp	0x56880 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x400>
   568d2:      	nopw	%cs:(%rax,%rax)
   568e0:      	movl	$0x200, %edx            # imm = 0x200
   568e5:      	leaq	-0x260(%rbp), %rdi
   568ec:      	leaq	-0x460(%rbp), %r12
   568f3:      	movq	%r12, %rsi
   568f6:      	callq	0xc5af0 <memcpy>
   568fb:      	xorl	%eax, %eax
   568fd:      	movdqa	-0x47d95(%rip), %xmm4   # 0xeb70 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x2f0>
   56905:      	movdqa	-0x47cad(%rip), %xmm5   # 0xec60 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x3e0>
   5690d:      	pxor	%xmm6, %xmm6
   56911:      	nopw	%cs:(%rax,%rax)
   56920:      	movdqu	-0x860(%rbp,%rax,2), %xmm2
   56929:      	movdqu	-0x260(%rbp,%rax,2), %xmm0
   56932:      	movdqa	%xmm2, %xmm3
   56936:      	punpckhwd	%xmm6, %xmm3    # xmm3 = xmm3[4],xmm6[4],xmm3[5],xmm6[5],xmm3[6],xmm6[6],xmm3[7],xmm6[7]
   5693a:      	punpcklwd	%xmm6, %xmm2    # xmm2 = xmm2[0],xmm6[0],xmm2[1],xmm6[1],xmm2[2],xmm6[2],xmm2[3],xmm6[3]
   5693e:      	movdqa	%xmm0, %xmm1
   56942:      	punpckhwd	%xmm6, %xmm1    # xmm1 = xmm1[4],xmm6[4],xmm1[5],xmm6[5],xmm1[6],xmm6[6],xmm1[7],xmm6[7]
   56946:      	paddd	%xmm3, %xmm1
   5694a:      	punpcklwd	%xmm6, %xmm0    # xmm0 = xmm0[0],xmm6[0],xmm0[1],xmm6[1],xmm0[2],xmm6[2],xmm0[3],xmm6[3]
   5694e:      	paddd	%xmm2, %xmm0
   56952:      	movdqa	%xmm1, %xmm2
   56956:      	pmuludq	%xmm4, %xmm2
   5695a:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
   5695f:      	pshufd	$0xf5, %xmm1, %xmm3     # xmm3 = xmm1[1,1,3,3]
   56964:      	pmuludq	%xmm4, %xmm3
   56968:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   5696d:      	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
   56971:      	pmaddwd	%xmm5, %xmm2
   56975:      	psubd	%xmm2, %xmm1
   56979:      	movdqa	%xmm0, %xmm2
   5697d:      	pmuludq	%xmm4, %xmm2
   56981:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
   56986:      	pshufd	$0xf5, %xmm0, %xmm3     # xmm3 = xmm0[1,1,3,3]
   5698b:      	pmuludq	%xmm4, %xmm3
   5698f:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   56994:      	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
   56998:      	pmaddwd	%xmm5, %xmm2
   5699c:      	psubd	%xmm2, %xmm0
   569a0:      	packssdw	%xmm1, %xmm0
   569a4:      	movdqu	%xmm0, -0x460(%rbp,%rax,2)
   569ad:      	addq	$0x8, %rax
   569b1:      	cmpq	$0x100, %rax            # imm = 0x100
   569b7:      	jne	0x56920 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4a0>
   569bd:      	movl	$0x200, %edx            # imm = 0x200
   569c2:      	leaq	-0xa60(%rbp), %r14
   569c9:      	movq	%r14, %rdi
   569cc:      	movq	%r12, %rsi
   569cf:      	callq	0xc5af0 <memcpy>
   569d4:      	movl	$0xe, %eax
   569d9:      	nopl	(%rax)
   569e0:      	movw	$0x0, -0x86e(%rbp,%rax)
   569ea:      	movw	$0x0, -0x86c(%rbp,%rax)
   569f4:      	movw	$0x0, -0x86a(%rbp,%rax)
   569fe:      	movw	$0x0, -0x868(%rbp,%rax)
   56a08:      	movw	$0x0, -0x866(%rbp,%rax)
   56a12:      	movw	$0x0, -0x864(%rbp,%rax)
   56a1c:      	movw	$0x0, -0x862(%rbp,%rax)
   56a26:      	movw	$0x0, -0x860(%rbp,%rax)
   56a30:      	addq	$0x10, %rax
   56a34:      	cmpq	$0x20e, %rax            # imm = 0x20E
   56a3a:      	jne	0x569e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x560>
   56a3c:      	movl	$0x200, %edx            # imm = 0x200
   56a41:      	leaq	-0x860(%rbp), %rdi
   56a48:      	movq	%r14, %rsi
   56a4b:      	callq	0xc5af0 <memcpy>
   56a50:      	xorl	%eax, %eax
   56a52:      	nopw	%cs:(%rax,%rax)
   56a60:      	movw	$0x0, -0x260(%rbp,%rax)
   56a6a:      	movw	$0x0, -0x25e(%rbp,%rax)
   56a74:      	movw	$0x0, -0x25c(%rbp,%rax)
   56a7e:      	movw	$0x0, -0x25a(%rbp,%rax)
   56a88:      	movw	$0x0, -0x258(%rbp,%rax)
   56a92:      	movw	$0x0, -0x256(%rbp,%rax)
   56a9c:      	movw	$0x0, -0x254(%rbp,%rax)
   56aa6:      	movw	$0x0, -0x252(%rbp,%rax)
   56ab0:      	addq	$0x10, %rax
   56ab4:      	cmpq	$0x200, %rax            # imm = 0x200
   56aba:      	jne	0x56a60 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x5e0>
   56abc:      	xorl	%eax, %eax
   56abe:      	nop
   56ac0:      	movw	$0x0, -0x660(%rbp,%rax)
   56aca:      	movw	$0x0, -0x65e(%rbp,%rax)
   56ad4:      	movw	$0x0, -0x65c(%rbp,%rax)
   56ade:      	movw	$0x0, -0x65a(%rbp,%rax)
   56ae8:      	movw	$0x0, -0x658(%rbp,%rax)
   56af2:      	movw	$0x0, -0x656(%rbp,%rax)
   56afc:      	movw	$0x0, -0x654(%rbp,%rax)
   56b06:      	movw	$0x0, -0x652(%rbp,%rax)
   56b10:      	addq	$0x10, %rax
   56b14:      	cmpq	$0x200, %rax            # imm = 0x200
   56b1a:      	jne	0x56ac0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x640>
   56b1c:      	cmpq	$0x600, %r13            # imm = 0x600
   56b23:      	jne	0x566e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x260>
   56b29:      	movl	$0x200, %edx            # imm = 0x200
   56b2e:      	movq	%r12, %rdi
   56b31:      	leaq	-0x860(%rbp), %rsi
   56b38:      	callq	0xc5af0 <memcpy>
   56b3d:      	leaq	-0x260(%rbp), %rdi
   56b44:      	movq	%r12, %rsi
   56b47:      	callq	0x5a000 <<toyos_crypto::mlkem::Poly>::inverse>
   56b4c:      	movq	-0x30(%rbp), %r15
   56b50:      	leal	0x3(%r15), %eax
   56b54:      	movzbl	%al, %edx
   56b57:      	leaq	-0x660(%rbp), %rdi
   56b5e:      	movq	-0x38(%rbp), %rsi
   56b62:      	callq	0x5a5a0 <toyos_crypto::mlkem::noise>
   56b67:      	xorl	%eax, %eax
   56b69:      	movdqa	-0x48001(%rip), %xmm4   # 0xeb70 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x2f0>
   56b71:      	movdqa	-0x47f19(%rip), %xmm5   # 0xec60 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x3e0>
   56b79:      	pxor	%xmm6, %xmm6
   56b7d:      	nopl	(%rax)
   56b80:      	movdqu	-0x260(%rbp,%rax,2), %xmm2
   56b89:      	movdqu	-0x660(%rbp,%rax,2), %xmm0
   56b92:      	movdqa	%xmm2, %xmm3
   56b96:      	punpckhwd	%xmm6, %xmm3    # xmm3 = xmm3[4],xmm6[4],xmm3[5],xmm6[5],xmm3[6],xmm6[6],xmm3[7],xmm6[7]
   56b9a:      	punpcklwd	%xmm6, %xmm2    # xmm2 = xmm2[0],xmm6[0],xmm2[1],xmm6[1],xmm2[2],xmm6[2],xmm2[3],xmm6[3]
   56b9e:      	movdqa	%xmm0, %xmm1
   56ba2:      	punpckhwd	%xmm6, %xmm1    # xmm1 = xmm1[4],xmm6[4],xmm1[5],xmm6[5],xmm1[6],xmm6[6],xmm1[7],xmm6[7]
   56ba6:      	paddd	%xmm3, %xmm1
   56baa:      	punpcklwd	%xmm6, %xmm0    # xmm0 = xmm0[0],xmm6[0],xmm0[1],xmm6[1],xmm0[2],xmm6[2],xmm0[3],xmm6[3]
   56bae:      	paddd	%xmm2, %xmm0
   56bb2:      	movdqa	%xmm1, %xmm2
   56bb6:      	pmuludq	%xmm4, %xmm2
   56bba:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
   56bbf:      	pshufd	$0xf5, %xmm1, %xmm3     # xmm3 = xmm1[1,1,3,3]
   56bc4:      	pmuludq	%xmm4, %xmm3
   56bc8:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   56bcd:      	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
   56bd1:      	pmaddwd	%xmm5, %xmm2
   56bd5:      	psubd	%xmm2, %xmm1
   56bd9:      	movdqa	%xmm0, %xmm2
   56bdd:      	pmuludq	%xmm4, %xmm2
   56be1:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
   56be6:      	pshufd	$0xf5, %xmm0, %xmm3     # xmm3 = xmm0[1,1,3,3]
   56beb:      	pmuludq	%xmm4, %xmm3
   56bef:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   56bf4:      	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
   56bf8:      	pmaddwd	%xmm5, %xmm2
   56bfc:      	psubd	%xmm2, %xmm0
   56c00:      	packssdw	%xmm1, %xmm0
   56c04:      	movdqu	%xmm0, -0x460(%rbp,%rax,2)
   56c0d:      	addq	$0x8, %rax
   56c11:      	cmpq	$0x100, %rax            # imm = 0x100
   56c17:      	jne	0x56b80 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x700>
   56c1d:      	movl	$0x200, %edx            # imm = 0x200
   56c22:      	movq	%r14, %rdi
   56c25:      	movq	%r12, %rsi
   56c28:      	callq	0xc5af0 <memcpy>
   56c2d:      	pxor	%xmm4, %xmm4
   56c31:      	xorl	%eax, %eax
   56c33:      	movdqa	-0x4824b(%rip), %xmm3   # 0xe9f0 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x170>
   56c3b:      	movdqa	-0x48333(%rip), %xmm5   # 0xe910 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x90>
   56c43:      	movdqa	-0x481eb(%rip), %xmm6   # 0xea60 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x1e0>
   56c4b:      	nopl	(%rax,%rax)
   56c50:      	movdqu	-0xa60(%rbp,%rax,2), %xmm0
   56c59:      	movdqa	%xmm0, %xmm1
   56c5d:      	punpcklwd	%xmm4, %xmm1    # xmm1 = xmm1[0],xmm4[0],xmm1[1],xmm4[1],xmm1[2],xmm4[2],xmm1[3],xmm4[3]
   56c61:      	punpckhwd	%xmm4, %xmm0    # xmm0 = xmm0[4],xmm4[4],xmm0[5],xmm4[5],xmm0[6],xmm4[6],xmm0[7],xmm4[7]
   56c65:      	pslld	$0xa, %xmm0
   56c6a:      	pslld	$0xa, %xmm1
   56c6f:      	paddd	%xmm3, %xmm1
   56c73:      	paddd	%xmm3, %xmm0
   56c77:      	pshufd	$0xf5, %xmm0, %xmm2     # xmm2 = xmm0[1,1,3,3]
   56c7c:      	pmuludq	%xmm5, %xmm0
   56c80:      	pshufd	$0xed, %xmm0, %xmm0     # xmm0 = xmm0[1,3,2,3]
   56c85:      	pmuludq	%xmm5, %xmm2
   56c89:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
   56c8e:      	punpckldq	%xmm2, %xmm0    # xmm0 = xmm0[0],xmm2[0],xmm0[1],xmm2[1]
   56c92:      	psrld	$0x7, %xmm0
   56c97:      	pshufd	$0xf5, %xmm1, %xmm2     # xmm2 = xmm1[1,1,3,3]
   56c9c:      	pmuludq	%xmm5, %xmm1
   56ca0:      	pshufd	$0xed, %xmm1, %xmm1     # xmm1 = xmm1[1,3,2,3]
   56ca5:      	pmuludq	%xmm5, %xmm2
   56ca9:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
   56cae:      	punpckldq	%xmm2, %xmm1    # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
   56cb2:      	psrld	$0x7, %xmm1
   56cb7:      	packssdw	%xmm0, %xmm1
   56cbb:      	pand	%xmm6, %xmm1
   56cbf:      	movdqu	%xmm1, -0xa60(%rbp,%rax,2)
   56cc8:      	addq	$0x8, %rax
   56ccc:      	cmpq	$0x100, %rax            # imm = 0x100
   56cd2:      	jne	0x56c50 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7d0>
   56cd8:      	movl	$0x200, %edx            # imm = 0x200
   56cdd:      	movq	%r12, %rdi
   56ce0:      	movq	%r14, %rsi
   56ce3:      	callq	0xc5af0 <memcpy>
   56ce8:      	leaq	(%r15,%r15,4), %rax
   56cec:      	shlq	$0x6, %rax
   56cf0:      	leaq	(%rax,%rbp), %rdx
   56cf4:      	addq	$-0x1a60, %rdx          # imm = 0xE5A0
   56cfb:      	movl	$0xa, %esi
   56d00:      	movl	$0x140, %ecx            # imm = 0x140
   56d05:      	movq	%r12, %rdi
   56d08:      	callq	0x59ec0 <<toyos_crypto::mlkem::Poly>::encode>
   56d0d:      	xorl	%eax, %eax
   56d0f:      	nop
   56d10:      	movw	$0x0, -0x460(%rbp,%rax)
   56d1a:      	movw	$0x0, -0x45e(%rbp,%rax)
   56d24:      	movw	$0x0, -0x45c(%rbp,%rax)
   56d2e:      	movw	$0x0, -0x45a(%rbp,%rax)
   56d38:      	movw	$0x0, -0x458(%rbp,%rax)
   56d42:      	movw	$0x0, -0x456(%rbp,%rax)
   56d4c:      	movw	$0x0, -0x454(%rbp,%rax)
   56d56:      	movw	$0x0, -0x452(%rbp,%rax)
   56d60:      	addq	$0x10, %rax
   56d64:      	cmpq	$0x200, %rax            # imm = 0x200
   56d6a:      	jne	0x56d10 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x890>
   56d6c:      	xorl	%eax, %eax
   56d6e:      	nop
   56d70:      	movw	$0x0, -0x660(%rbp,%rax)
   56d7a:      	movw	$0x0, -0x65e(%rbp,%rax)
   56d84:      	movw	$0x0, -0x65c(%rbp,%rax)
   56d8e:      	movw	$0x0, -0x65a(%rbp,%rax)
   56d98:      	movw	$0x0, -0x658(%rbp,%rax)
   56da2:      	movw	$0x0, -0x656(%rbp,%rax)
   56dac:      	movw	$0x0, -0x654(%rbp,%rax)
   56db6:      	movw	$0x0, -0x652(%rbp,%rax)
   56dc0:      	addq	$0x10, %rax
   56dc4:      	cmpq	$0x200, %rax            # imm = 0x200
   56dca:      	jne	0x56d70 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x8f0>
   56dcc:      	xorl	%eax, %eax
   56dce:      	nop
   56dd0:      	movw	$0x0, -0x260(%rbp,%rax)
   56dda:      	movw	$0x0, -0x25e(%rbp,%rax)
   56de4:      	movw	$0x0, -0x25c(%rbp,%rax)
   56dee:      	movw	$0x0, -0x25a(%rbp,%rax)
   56df8:      	movw	$0x0, -0x258(%rbp,%rax)
   56e02:      	movw	$0x0, -0x256(%rbp,%rax)
   56e0c:      	movw	$0x0, -0x254(%rbp,%rax)
   56e16:      	movw	$0x0, -0x252(%rbp,%rax)
   56e20:      	addq	$0x10, %rax
   56e24:      	cmpq	$0x200, %rax            # imm = 0x200
   56e2a:      	jne	0x56dd0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x950>
   56e2c:      	movq	-0x60(%rbp), %rax
   56e30:      	movq	%rax, %r14
   56e33:      	cmpq	$0x3, %rax
   56e37:      	jne	0x566b0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x230>
   56e3d:      	leaq	-0x1460(%rbp), %rdi
   56e44:      	movq	$0x0, -0x30(%rbp)
   56e4c:      	movl	$0x200, %edx            # imm = 0x200
   56e51:      	xorl	%esi, %esi
   56e53:      	callq	0xc6240 <memset>
   56e58:      	movl	$0x9d7dbb41, %r15d      # imm = 0x9D7DBB41
   56e5e:      	leaq	-0xa60(%rbp), %rbx
   56e65:      	xorl	%eax, %eax
   56e67:      	nopw	(%rax,%rax)
   56e70:      	movq	%r12, %r14
   56e73:      	leaq	(%rax,%rbp), %r12
   56e77:      	addq	$-0x1060, %r12          # imm = 0xEFA0
   56e7e:      	addq	$0x200, %rax            # imm = 0x200
   56e84:      	movq	%rax, -0x40(%rbp)
   56e88:      	movq	-0x30(%rbp), %rax
   56e8c:      	leaq	(%rax,%rax,2), %r13
   56e90:      	incq	%rax
   56e93:      	movq	%rax, -0x30(%rbp)
   56e97:      	shlq	$0x7, %r13
   56e9b:      	addq	-0x48(%rbp), %r13
   56e9f:      	movl	$0x200, %edx            # imm = 0x200
   56ea4:      	movq	%r14, %rdi
   56ea7:      	xorl	%esi, %esi
   56ea9:      	callq	0xc6240 <memset>
   56eae:      	xorl	%eax, %eax
   56eb0:      	movq	%rax, %rcx
   56eb3:      	shrq	$0x3, %rcx
   56eb7:      	movzbl	(%r13,%rcx), %r9d
   56ebd:      	movl	%eax, %ecx
   56ebf:      	andb	$0x4, %cl
   56ec2:      	movzbl	%cl, %esi
   56ec5:      	xorl	%r8d, %r8d
   56ec8:      	btl	%esi, %r9d
   56ecc:      	setb	%r8b
   56ed0:      	leal	0x1(%rsi), %ecx
   56ed3:      	movl	%r9d, %r10d
   56ed6:      	shrl	%cl, %r10d
   56ed9:      	orw	(%r14), %r8w
   56edd:      	leal	0x2(%rsi), %ecx
   56ee0:      	movl	%r9d, %edi
   56ee3:      	shrl	%cl, %edi
   56ee5:      	addl	%r10d, %r10d
   56ee8:      	andl	$0x2, %r10d
   56eec:      	shll	$0x2, %edi
   56eef:      	leal	0x3(%rsi), %ecx
   56ef2:      	shrl	%cl, %r9d
   56ef5:      	andl	$0x4, %edi
   56ef8:      	orl	%r10d, %edi
   56efb:      	shll	$0x3, %r9d
   56eff:      	leaq	0x4(%rax), %rcx
   56f03:      	movq	%rcx, %r10
   56f06:      	shrq	$0x3, %r10
   56f0a:      	movzbl	(%r13,%r10), %r10d
   56f10:      	andb	$0x4, %cl
   56f13:      	shrl	%cl, %r10d
   56f16:      	andl	$0x8, %r9d
   56f1a:      	orl	%edi, %r9d
   56f1d:      	shll	$0x4, %r10d
   56f21:      	leaq	0x5(%rax), %rcx
   56f25:      	movq	%rcx, %rdi
   56f28:      	shrq	$0x3, %rdi
   56f2c:      	movzbl	(%r13,%rdi), %edi
   56f32:      	andb	$0x5, %cl
   56f35:      	shrl	%cl, %edi
   56f37:      	andl	$0x10, %r10d
   56f3b:      	orl	%r9d, %r10d
   56f3e:      	shll	$0x5, %edi
   56f41:      	andl	$0x20, %edi
   56f44:      	orl	%r10d, %edi
   56f47:      	orl	%r8d, %edi
   56f4a:      	leaq	0x6(%rax), %rcx
   56f4e:      	movq	%rcx, %r8
   56f51:      	shrq	$0x3, %r8
   56f55:      	movzbl	(%r13,%r8), %r8d
   56f5b:      	andb	$0x6, %cl
   56f5e:      	shrl	%cl, %r8d
   56f61:      	leaq	0x7(%rax), %rcx
   56f65:      	movq	%rcx, %r9
   56f68:      	shrq	$0x3, %r9
   56f6c:      	movzbl	(%r13,%r9), %r9d
   56f72:      	andb	$0x7, %cl
   56f75:      	shrb	%cl, %r9b
   56f78:      	shll	$0x6, %r8d
   56f7c:      	andl	$0x40, %r8d
   56f80:      	shlb	$0x7, %r9b
   56f84:      	movzbl	%r9b, %ecx
   56f88:      	orl	%r8d, %ecx
   56f8b:      	leaq	0x8(%rax), %r8
   56f8f:      	shrq	$0x3, %r8
   56f93:      	movzbl	(%r13,%r8), %r8d
   56f99:      	xorl	%r9d, %r9d
   56f9c:      	btl	%esi, %r8d
   56fa0:      	setb	%r9b
   56fa4:      	shll	$0x8, %r9d
   56fa8:      	orl	%ecx, %r9d
   56fab:      	leaq	0x9(%rax), %rcx
   56faf:      	movq	%rcx, %rsi
   56fb2:      	shrq	$0x3, %rsi
   56fb6:      	movzbl	(%r13,%rsi), %esi
   56fbc:      	andl	$0x5, %ecx
   56fbf:      	xorl	%r8d, %r8d
   56fc2:      	btl	%ecx, %esi
   56fc5:      	setb	%r8b
   56fc9:      	shll	$0x9, %r8d
   56fcd:      	orl	%r9d, %r8d
   56fd0:      	leaq	0xa(%rax), %rcx
   56fd4:      	movq	%rcx, %rsi
   56fd7:      	shrq	$0x3, %rsi
   56fdb:      	movzbl	(%r13,%rsi), %esi
   56fe1:      	andl	$0x6, %ecx
   56fe4:      	xorl	%r9d, %r9d
   56fe7:      	btl	%ecx, %esi
   56fea:      	setb	%r9b
   56fee:      	shll	$0xa, %r9d
   56ff2:      	orl	%r8d, %r9d
   56ff5:      	orl	%edi, %r9d
   56ff8:      	leaq	0xb(%rax), %rcx
   56ffc:      	movq	%rcx, %rsi
   56fff:      	shrq	$0x3, %rsi
   57003:      	movzbl	(%r13,%rsi), %esi
   57009:      	andl	$0x7, %ecx
   5700c:      	xorl	%edi, %edi
   5700e:      	btl	%ecx, %esi
   57011:      	setb	%dil
   57015:      	shll	$0xb, %edi
   57018:      	orl	%r9d, %edi
   5701b:      	movw	%di, (%r14)
   5701f:      	addq	$0x2, %r14
   57023:      	addq	$0xc, %rax
   57027:      	cmpq	$0xc00, %rax            # imm = 0xC00
   5702d:      	jne	0x56eb0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa30>
   57033:      	movl	$0x200, %edx            # imm = 0x200
   57038:      	leaq	-0x660(%rbp), %rdi
   5703f:      	leaq	-0x460(%rbp), %r14
   57046:      	movq	%r14, %rsi
   57049:      	callq	0xc5af0 <memcpy>
   5704e:      	movl	$0x200, %edx            # imm = 0x200
   57053:      	movq	%r14, %rdi
   57056:      	xorl	%esi, %esi
   57058:      	callq	0xc6240 <memset>
   5705d:      	xorl	%eax, %eax
   5705f:      	jmp	0x57188 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd08>
   57064:      	nopw	%cs:(%rax,%rax)
   57070:      	movzwl	-0x660(%rbp,%rax,4), %edi
   57078:      	movzwl	(%r12,%rax,4), %edx
   5707d:      	movl	%edx, %r9d
   57080:      	imull	%edi, %r9d
   57084:      	imulq	$0x3afb7681, %r9, %rsi  # imm = 0x3AFB7681
   5708b:      	shrq	$0x20, %rsi
   5708f:      	movl	%r9d, %r8d
   57092:      	subl	%esi, %r8d
   57095:      	shrl	%r8d
   57098:      	addl	%esi, %r8d
   5709b:      	shrl	$0xb, %r8d
   5709f:      	imull	$0xd01, %r8d, %esi      # imm = 0xD01
   570a6:      	subl	%esi, %r9d
   570a9:      	movzwl	-0x65e(%rbp,%rax,4), %r8d
   570b2:      	movzwl	0x2(%r12,%rax,4), %esi
   570b8:      	movl	%esi, %r10d
   570bb:      	imull	%r8d, %r10d
   570bf:      	imulq	$0x3afb7681, %r10, %r11 # imm = 0x3AFB7681
   570c6:      	shrq	$0x20, %r11
   570ca:      	movl	%r10d, %r13d
   570cd:      	subl	%r11d, %r13d
   570d0:      	shrl	%r13d
   570d3:      	addl	%r11d, %r13d
   570d6:      	shrl	$0xb, %r13d
   570da:      	imull	$0xd01, %r13d, %r11d    # imm = 0xD01
   570e1:      	subl	%r11d, %r10d
   570e4:      	movzwl	%cx, %ecx
   570e7:      	imull	%r10d, %ecx
   570eb:      	imulq	$0x13afb769, %rcx, %r10 # imm = 0x13AFB769
   570f2:      	shrq	$0x28, %r10
   570f6:      	imull	$0xd01, %r10d, %r10d    # imm = 0xD01
   570fd:      	subl	%r10d, %ecx
   57100:      	addl	%r9d, %ecx
   57103:      	leal	-0xd01(%rcx), %r9d
   5710a:      	cmpl	$0xd01, %ecx            # imm = 0xD01
   57110:      	cmovbl	%ecx, %r9d
   57114:      	movw	%r9w, -0x460(%rbp,%rax,4)
   5711d:      	imull	%edi, %esi
   57120:      	imulq	$0x3afb7681, %rsi, %rcx # imm = 0x3AFB7681
   57127:      	shrq	$0x20, %rcx
   5712b:      	movl	%esi, %edi
   5712d:      	subl	%ecx, %edi
   5712f:      	shrl	%edi
   57131:      	addl	%ecx, %edi
   57133:      	shrl	$0xb, %edi
   57136:      	imull	$0xd01, %edi, %ecx      # imm = 0xD01
   5713c:      	subl	%ecx, %esi
   5713e:      	imull	%r8d, %edx
   57142:      	imulq	$0x3afb7681, %rdx, %rcx # imm = 0x3AFB7681
   57149:      	shrq	$0x20, %rcx
   5714d:      	movl	%edx, %edi
   5714f:      	subl	%ecx, %edi
   57151:      	shrl	%edi
   57153:      	addl	%ecx, %edi
   57155:      	shrl	$0xb, %edi
   57158:      	imull	$0xd01, %edi, %ecx      # imm = 0xD01
   5715e:      	subl	%ecx, %edx
   57160:      	addl	%esi, %edx
   57162:      	leal	-0xd01(%rdx), %ecx
   57168:      	cmpl	$0xd01, %edx            # imm = 0xD01
   5716e:      	cmovbl	%edx, %ecx
   57171:      	movw	%cx, -0x45e(%rbp,%rax,4)
   57179:      	incq	%rax
   5717c:      	cmpq	$0x80, %rax
   57182:      	je	0x57220 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xda0>
   57188:      	movl	%eax, %ecx
   5718a:      	rolb	$0x4, %cl
   5718d:      	orb	$0x8, %cl
   57190:      	movl	%ecx, %edx
   57192:      	andb	$0x33, %dl
   57195:      	shlb	$0x2, %dl
   57198:      	shrb	$0x2, %cl
   5719b:      	andb	$0x33, %cl
   5719e:      	orb	%dl, %cl
   571a0:      	movl	%ecx, %edx
   571a2:      	andb	$0x55, %dl
   571a5:      	addb	%dl, %dl
   571a7:      	shrb	%cl
   571a9:      	andb	$0x55, %cl
   571ac:      	orb	%dl, %cl
   571ae:      	movzbl	%cl, %edx
   571b1:      	movw	$0x1, %cx
   571b5:      	movw	$0x11, %si
   571b9:      	jmp	0x571de <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd5e>
   571bb:      	nopl	(%rax,%rax)
   571c0:      	imull	%esi, %esi
   571c3:      	movq	%rsi, %rdi
   571c6:      	imulq	%r15, %rdi
   571ca:      	shrq	$0x2b, %rdi
   571ce:      	imull	$0xd01, %edi, %edi      # imm = 0xD01
   571d4:      	subl	%edi, %esi
   571d6:      	shrl	%edx
   571d8:      	je	0x57070 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbf0>
   571de:      	movzwl	%si, %esi
   571e1:      	testb	$0x1, %dl
   571e4:      	je	0x571c0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd40>
   571e6:      	movzwl	%cx, %ecx
   571e9:      	imull	%esi, %ecx
   571ec:      	imulq	$0x3afb7681, %rcx, %rdi # imm = 0x3AFB7681
   571f3:      	shrq	$0x20, %rdi
   571f7:      	movl	%ecx, %r8d
   571fa:      	subl	%edi, %r8d
   571fd:      	shrl	%r8d
   57200:      	addl	%edi, %r8d
   57203:      	shrl	$0xb, %r8d
   57207:      	imull	$0xd01, %r8d, %edi      # imm = 0xD01
   5720e:      	subl	%edi, %ecx
   57210:      	jmp	0x571c0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xd40>
   57212:      	nopw	%cs:(%rax,%rax)
   57220:      	movl	$0x200, %edx            # imm = 0x200
   57225:      	leaq	-0x260(%rbp), %rdi
   5722c:      	leaq	-0x460(%rbp), %r12
   57233:      	movq	%r12, %rsi
   57236:      	callq	0xc5af0 <memcpy>
   5723b:      	xorl	%eax, %eax
   5723d:      	movdqa	-0x486d5(%rip), %xmm4   # 0xeb70 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x2f0>
   57245:      	movdqa	-0x485ed(%rip), %xmm5   # 0xec60 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x3e0>
   5724d:      	pxor	%xmm6, %xmm6
   57251:      	nopw	%cs:(%rax,%rax)
   57260:      	movdqu	-0x1460(%rbp,%rax,2), %xmm2
   57269:      	movdqu	-0x260(%rbp,%rax,2), %xmm0
   57272:      	movdqa	%xmm2, %xmm3
   57276:      	punpckhwd	%xmm6, %xmm3    # xmm3 = xmm3[4],xmm6[4],xmm3[5],xmm6[5],xmm3[6],xmm6[6],xmm3[7],xmm6[7]
   5727a:      	punpcklwd	%xmm6, %xmm2    # xmm2 = xmm2[0],xmm6[0],xmm2[1],xmm6[1],xmm2[2],xmm6[2],xmm2[3],xmm6[3]
   5727e:      	movdqa	%xmm0, %xmm1
   57282:      	punpckhwd	%xmm6, %xmm1    # xmm1 = xmm1[4],xmm6[4],xmm1[5],xmm6[5],xmm1[6],xmm6[6],xmm1[7],xmm6[7]
   57286:      	paddd	%xmm3, %xmm1
   5728a:      	punpcklwd	%xmm6, %xmm0    # xmm0 = xmm0[0],xmm6[0],xmm0[1],xmm6[1],xmm0[2],xmm6[2],xmm0[3],xmm6[3]
   5728e:      	paddd	%xmm2, %xmm0
   57292:      	movdqa	%xmm1, %xmm2
   57296:      	pmuludq	%xmm4, %xmm2
   5729a:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
   5729f:      	pshufd	$0xf5, %xmm1, %xmm3     # xmm3 = xmm1[1,1,3,3]
   572a4:      	pmuludq	%xmm4, %xmm3
   572a8:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   572ad:      	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
   572b1:      	pmaddwd	%xmm5, %xmm2
   572b5:      	psubd	%xmm2, %xmm1
   572b9:      	movdqa	%xmm0, %xmm2
   572bd:      	pmuludq	%xmm4, %xmm2
   572c1:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
   572c6:      	pshufd	$0xf5, %xmm0, %xmm3     # xmm3 = xmm0[1,1,3,3]
   572cb:      	pmuludq	%xmm4, %xmm3
   572cf:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   572d4:      	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
   572d8:      	pmaddwd	%xmm5, %xmm2
   572dc:      	psubd	%xmm2, %xmm0
   572e0:      	packssdw	%xmm1, %xmm0
   572e4:      	movdqu	%xmm0, -0x460(%rbp,%rax,2)
   572ed:      	addq	$0x8, %rax
   572f1:      	cmpq	$0x100, %rax            # imm = 0x100
   572f7:      	jne	0x57260 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xde0>
   572fd:      	movl	$0x200, %edx            # imm = 0x200
   57302:      	movq	%rbx, %rdi
   57305:      	movq	%r12, %rsi
   57308:      	callq	0xc5af0 <memcpy>
   5730d:      	movl	$0xe, %eax
   57312:      	nopw	%cs:(%rax,%rax)
   57320:      	movw	$0x0, -0x146e(%rbp,%rax)
   5732a:      	movw	$0x0, -0x146c(%rbp,%rax)
   57334:      	movw	$0x0, -0x146a(%rbp,%rax)
   5733e:      	movw	$0x0, -0x1468(%rbp,%rax)
   57348:      	movw	$0x0, -0x1466(%rbp,%rax)
   57352:      	movw	$0x0, -0x1464(%rbp,%rax)
   5735c:      	movw	$0x0, -0x1462(%rbp,%rax)
   57366:      	movw	$0x0, -0x1460(%rbp,%rax)
   57370:      	addq	$0x10, %rax
   57374:      	cmpq	$0x20e, %rax            # imm = 0x20E
   5737a:      	jne	0x57320 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xea0>
   5737c:      	movl	$0x200, %edx            # imm = 0x200
   57381:      	leaq	-0x1460(%rbp), %rdi
   57388:      	movq	%rbx, %rsi
   5738b:      	callq	0xc5af0 <memcpy>
   57390:      	xorl	%eax, %eax
   57392:      	nopw	%cs:(%rax,%rax)
   573a0:      	movw	$0x0, -0x260(%rbp,%rax)
   573aa:      	movw	$0x0, -0x25e(%rbp,%rax)
   573b4:      	movw	$0x0, -0x25c(%rbp,%rax)
   573be:      	movw	$0x0, -0x25a(%rbp,%rax)
   573c8:      	movw	$0x0, -0x258(%rbp,%rax)
   573d2:      	movw	$0x0, -0x256(%rbp,%rax)
   573dc:      	movw	$0x0, -0x254(%rbp,%rax)
   573e6:      	movw	$0x0, -0x252(%rbp,%rax)
   573f0:      	addq	$0x10, %rax
   573f4:      	cmpq	$0x200, %rax            # imm = 0x200
   573fa:      	jne	0x573a0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xf20>
   573fc:      	xorl	%eax, %eax
   573fe:      	nop
   57400:      	movw	$0x0, -0x660(%rbp,%rax)
   5740a:      	movw	$0x0, -0x65e(%rbp,%rax)
   57414:      	movw	$0x0, -0x65c(%rbp,%rax)
   5741e:      	movw	$0x0, -0x65a(%rbp,%rax)
   57428:      	movw	$0x0, -0x658(%rbp,%rax)
   57432:      	movw	$0x0, -0x656(%rbp,%rax)
   5743c:      	movw	$0x0, -0x654(%rbp,%rax)
   57446:      	movw	$0x0, -0x652(%rbp,%rax)
   57450:      	addq	$0x10, %rax
   57454:      	cmpq	$0x200, %rax            # imm = 0x200
   5745a:      	jne	0x57400 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xf80>
   5745c:      	movq	-0x40(%rbp), %rax
   57460:      	cmpq	$0x600, %rax            # imm = 0x600
   57466:      	jne	0x56e70 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9f0>
   5746c:      	leaq	-0x460(%rbp), %rbx
   57473:      	leaq	-0x1460(%rbp), %rsi
   5747a:      	movl	$0x200, %edx            # imm = 0x200
   5747f:      	movq	%rbx, %rdi
   57482:      	callq	0xc5af0 <memcpy>
   57487:      	leaq	-0x860(%rbp), %rdi
   5748e:      	movq	%rbx, %rsi
   57491:      	callq	0x5a000 <<toyos_crypto::mlkem::Poly>::inverse>
   57496:      	leaq	-0xa60(%rbp), %rdi
   5749d:      	movq	-0x38(%rbp), %rsi
   574a1:      	movl	$0x6, %edx
   574a6:      	callq	0x5a5a0 <toyos_crypto::mlkem::noise>
   574ab:      	movq	-0x50(%rbp), %r14
   574af:      	xorl	%eax, %eax
   574b1:      	pxor	%xmm0, %xmm0
   574b5:      	movdqa	-0x4894d(%rip), %xmm5   # 0xeb70 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x2f0>
   574bd:      	movdqa	-0x48865(%rip), %xmm6   # 0xec60 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x3e0>
   574c5:      	nopw	%cs:(%rax,%rax)
   574d0:      	movdqu	-0x860(%rbp,%rax,2), %xmm3
   574d9:      	movdqu	-0xa60(%rbp,%rax,2), %xmm1
   574e2:      	movdqa	%xmm3, %xmm4
   574e6:      	punpckhwd	%xmm0, %xmm4    # xmm4 = xmm4[4],xmm0[4],xmm4[5],xmm0[5],xmm4[6],xmm0[6],xmm4[7],xmm0[7]
   574ea:      	punpcklwd	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3]
   574ee:      	movdqa	%xmm1, %xmm2
   574f2:      	punpckhwd	%xmm0, %xmm2    # xmm2 = xmm2[4],xmm0[4],xmm2[5],xmm0[5],xmm2[6],xmm0[6],xmm2[7],xmm0[7]
   574f6:      	paddd	%xmm4, %xmm2
   574fa:      	punpcklwd	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3]
   574fe:      	paddd	%xmm3, %xmm1
   57502:      	movdqa	%xmm2, %xmm3
   57506:      	pmuludq	%xmm5, %xmm3
   5750a:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   5750f:      	pshufd	$0xf5, %xmm2, %xmm4     # xmm4 = xmm2[1,1,3,3]
   57514:      	pmuludq	%xmm5, %xmm4
   57518:      	pshufd	$0xed, %xmm4, %xmm4     # xmm4 = xmm4[1,3,2,3]
   5751d:      	punpckldq	%xmm4, %xmm3    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
   57521:      	pmaddwd	%xmm6, %xmm3
   57525:      	psubd	%xmm3, %xmm2
   57529:      	movdqa	%xmm1, %xmm3
   5752d:      	pmuludq	%xmm5, %xmm3
   57531:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   57536:      	pshufd	$0xf5, %xmm1, %xmm4     # xmm4 = xmm1[1,1,3,3]
   5753b:      	pmuludq	%xmm5, %xmm4
   5753f:      	pshufd	$0xed, %xmm4, %xmm4     # xmm4 = xmm4[1,3,2,3]
   57544:      	punpckldq	%xmm4, %xmm3    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
   57548:      	pmaddwd	%xmm6, %xmm3
   5754c:      	psubd	%xmm3, %xmm1
   57550:      	packssdw	%xmm2, %xmm1
   57554:      	movdqu	%xmm1, -0x460(%rbp,%rax,2)
   5755d:      	addq	$0x8, %rax
   57561:      	cmpq	$0x100, %rax            # imm = 0x100
   57567:      	jne	0x574d0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1050>
   5756d:      	leaq	-0x1260(%rbp), %rdi
   57574:      	leaq	-0x460(%rbp), %rsi
   5757b:      	movl	$0x200, %edx            # imm = 0x200
   57580:      	callq	0xc5af0 <memcpy>
   57585:      	leaq	-0x460(%rbp), %rdi
   5758c:      	xorl	%ebx, %ebx
   5758e:      	movl	$0x200, %edx            # imm = 0x200
   57593:      	xorl	%esi, %esi
   57595:      	callq	0xc6240 <memset>
   5759a:      	movq	-0x48b62(%rip), %xmm0   # 0xea40 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x1c0>
   575a2:      	movq	-0x48d6a(%rip), %xmm1   # 0xe840 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x680>
   575aa:      	pxor	%xmm2, %xmm2
   575ae:      	movdqa	-0x48e66(%rip), %xmm3   # 0xe750 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x590>
   575b6:      	movdqa	-0x4886e(%rip), %xmm4   # 0xed50 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x4d0>
   575be:      	movdqa	-0x48e66(%rip), %xmm5   # 0xe760 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x5a0>
   575c6:      	movdqa	-0x48efe(%rip), %xmm6   # 0xe6d0 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x510>
   575ce:      	movq	-0x58(%rbp), %rcx
   575d2:      	nopw	%cs:(%rax,%rax)
   575e0:      	movzbl	(%rcx), %eax
   575e3:      	movd	%eax, %xmm7
   575e7:      	punpcklbw	%xmm7, %xmm7    # xmm7 = xmm7[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
   575eb:      	pshuflw	$0x0, %xmm7, %xmm7      # xmm7 = xmm7[0,0,0,0,4,5,6,7]
   575f0:      	movdqa	%xmm0, %xmm8
   575f5:      	psllw	$0x5, %xmm8
   575fb:      	pand	%xmm1, %xmm8
   57600:      	pxor	%xmm9, %xmm9
   57605:      	pcmpgtb	%xmm8, %xmm9
   5760a:      	movdqa	%xmm9, %xmm10
   5760f:      	pandn	%xmm7, %xmm10
   57614:      	psrlw	$0x4, %xmm7
   57619:      	pand	%xmm9, %xmm7
   5761e:      	pand	%xmm3, %xmm7
   57622:      	por	%xmm10, %xmm7
   57627:      	paddb	%xmm8, %xmm8
   5762c:      	pxor	%xmm9, %xmm9
   57631:      	pcmpgtb	%xmm8, %xmm9
   57636:      	movdqa	%xmm9, %xmm10
   5763b:      	pandn	%xmm7, %xmm10
   57640:      	psrlw	$0x2, %xmm7
   57645:      	pand	%xmm9, %xmm7
   5764a:      	pand	%xmm4, %xmm7
   5764e:      	por	%xmm10, %xmm7
   57653:      	paddb	%xmm8, %xmm8
   57658:      	pxor	%xmm9, %xmm9
   5765d:      	pcmpgtb	%xmm8, %xmm9
   57662:      	movdqa	%xmm9, %xmm8
   57667:      	pandn	%xmm7, %xmm8
   5766c:      	psrlw	$0x1, %xmm7
   57671:      	pand	%xmm9, %xmm7
   57676:      	por	%xmm8, %xmm7
   5767b:      	pand	%xmm5, %xmm7
   5767f:      	punpcklbw	%xmm2, %xmm7    # xmm7 = xmm7[0],xmm2[0],xmm7[1],xmm2[1],xmm7[2],xmm2[2],xmm7[3],xmm2[3],xmm7[4],xmm2[4],xmm7[5],xmm2[5],xmm7[6],xmm2[6],xmm7[7],xmm2[7]
   57683:      	movdqu	-0x460(%rbp,%rbx,2), %xmm8
   5768d:      	por	%xmm7, %xmm8
   57692:      	movdqu	%xmm8, -0x460(%rbp,%rbx,2)
   5769c:      	addq	$0x8, %rbx
   576a0:      	paddb	%xmm6, %xmm0
   576a4:      	incq	%rcx
   576a7:      	cmpq	$0x100, %rbx            # imm = 0x100
   576ae:      	jne	0x575e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1160>
   576b4:      	leaq	-0x660(%rbp), %rdi
   576bb:      	leaq	-0x460(%rbp), %rsi
   576c2:      	movl	$0x200, %edx            # imm = 0x200
   576c7:      	callq	0xc5af0 <memcpy>
   576cc:      	xorl	%eax, %eax
   576ce:      	movdqa	-0x48aa6(%rip), %xmm0   # 0xec30 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x3b0>
   576d6:      	pcmpeqd	%xmm1, %xmm1
   576da:      	nopw	(%rax,%rax)
   576e0:      	movdqu	-0x660(%rbp,%rax,2), %xmm2
   576e9:      	movdqa	%xmm2, %xmm3
   576ed:      	pmulhuw	%xmm0, %xmm3
   576f1:      	pmullw	%xmm0, %xmm2
   576f5:      	movdqa	%xmm2, %xmm4
   576f9:      	punpckhwd	%xmm3, %xmm4    # xmm4 = xmm4[4],xmm3[4],xmm4[5],xmm3[5],xmm4[6],xmm3[6],xmm4[7],xmm3[7]
   576fd:      	punpcklwd	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1],xmm2[2],xmm3[2],xmm2[3],xmm3[3]
   57701:      	psubd	%xmm1, %xmm2
   57705:      	psubd	%xmm1, %xmm4
   57709:      	pslld	$0xf, %xmm4
   5770e:      	psrad	$0x10, %xmm4
   57713:      	pslld	$0xf, %xmm2
   57718:      	psrad	$0x10, %xmm2
   5771d:      	packssdw	%xmm4, %xmm2
   57721:      	movdqu	%xmm2, -0x660(%rbp,%rax,2)
   5772a:      	addq	$0x8, %rax
   5772e:      	cmpq	$0x100, %rax            # imm = 0x100
   57734:      	jne	0x576e0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1260>
   57736:      	leaq	-0x260(%rbp), %rdi
   5773d:      	leaq	-0x660(%rbp), %rsi
   57744:      	movl	$0x200, %edx            # imm = 0x200
   57749:      	callq	0xc5af0 <memcpy>
   5774e:      	xorl	%eax, %eax
   57750:      	pxor	%xmm0, %xmm0
   57754:      	movdqa	-0x48bec(%rip), %xmm6   # 0xeb70 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x2f0>
   5775c:      	movdqa	-0x48b04(%rip), %xmm5   # 0xec60 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x3e0>
   57764:      	nopw	%cs:(%rax,%rax)
   57770:      	movdqu	-0x1260(%rbp,%rax,2), %xmm3
   57779:      	movdqu	-0x260(%rbp,%rax,2), %xmm1
   57782:      	movdqa	%xmm3, %xmm4
   57786:      	punpckhwd	%xmm0, %xmm4    # xmm4 = xmm4[4],xmm0[4],xmm4[5],xmm0[5],xmm4[6],xmm0[6],xmm4[7],xmm0[7]
   5778a:      	punpcklwd	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3]
   5778e:      	movdqa	%xmm1, %xmm2
   57792:      	punpckhwd	%xmm0, %xmm2    # xmm2 = xmm2[4],xmm0[4],xmm2[5],xmm0[5],xmm2[6],xmm0[6],xmm2[7],xmm0[7]
   57796:      	paddd	%xmm4, %xmm2
   5779a:      	punpcklwd	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3]
   5779e:      	paddd	%xmm3, %xmm1
   577a2:      	movdqa	%xmm2, %xmm3
   577a6:      	pmuludq	%xmm6, %xmm3
   577aa:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   577af:      	pshufd	$0xf5, %xmm2, %xmm4     # xmm4 = xmm2[1,1,3,3]
   577b4:      	pmuludq	%xmm6, %xmm4
   577b8:      	pshufd	$0xed, %xmm4, %xmm4     # xmm4 = xmm4[1,3,2,3]
   577bd:      	punpckldq	%xmm4, %xmm3    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
   577c1:      	pmaddwd	%xmm5, %xmm3
   577c5:      	psubd	%xmm3, %xmm2
   577c9:      	movdqa	%xmm1, %xmm3
   577cd:      	pmuludq	%xmm6, %xmm3
   577d1:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   577d6:      	pshufd	$0xf5, %xmm1, %xmm4     # xmm4 = xmm1[1,1,3,3]
   577db:      	pmuludq	%xmm6, %xmm4
   577df:      	pshufd	$0xed, %xmm4, %xmm4     # xmm4 = xmm4[1,3,2,3]
   577e4:      	punpckldq	%xmm4, %xmm3    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
   577e8:      	pmaddwd	%xmm5, %xmm3
   577ec:      	psubd	%xmm3, %xmm1
   577f0:      	packssdw	%xmm2, %xmm1
   577f4:      	movdqu	%xmm1, -0x460(%rbp,%rax,2)
   577fd:      	addq	$0x8, %rax
   57801:      	cmpq	$0x100, %rax            # imm = 0x100
   57807:      	jne	0x57770 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x12f0>
   5780d:      	leaq	-0x660(%rbp), %rdi
   57814:      	leaq	-0x460(%rbp), %rsi
   5781b:      	movl	$0x200, %edx            # imm = 0x200
   57820:      	callq	0xc5af0 <memcpy>
   57825:      	movdqa	-0x48cbd(%rip), %xmm6   # 0xeb70 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x2f0>
   5782d:      	xorl	%eax, %eax
   5782f:      	pxor	%xmm0, %xmm0
   57833:      	movdqa	-0x48dcb(%rip), %xmm1   # 0xea70 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x1f0>
   5783b:      	movdqa	-0x48e53(%rip), %xmm5   # 0xe9f0 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x170>
   57843:      	nopw	%cs:(%rax,%rax)
   57850:      	movdqu	-0x660(%rbp,%rax,2), %xmm2
   57859:      	movdqa	%xmm2, %xmm3
   5785d:      	punpcklwd	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3]
   57861:      	punpckhwd	%xmm0, %xmm2    # xmm2 = xmm2[4],xmm0[4],xmm2[5],xmm0[5],xmm2[6],xmm0[6],xmm2[7],xmm0[7]
   57865:      	pslld	$0x4, %xmm2
   5786a:      	pslld	$0x4, %xmm3
   5786f:      	paddd	%xmm5, %xmm3
   57873:      	paddd	%xmm5, %xmm2
   57877:      	pshufd	$0xf5, %xmm2, %xmm4     # xmm4 = xmm2[1,1,3,3]
   5787c:      	pmuludq	%xmm6, %xmm2
   57880:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
   57885:      	pmuludq	%xmm6, %xmm4
   57889:      	pshufd	$0xed, %xmm4, %xmm4     # xmm4 = xmm4[1,3,2,3]
   5788e:      	punpckldq	%xmm4, %xmm2    # xmm2 = xmm2[0],xmm4[0],xmm2[1],xmm4[1]
   57892:      	pshufd	$0xf5, %xmm3, %xmm4     # xmm4 = xmm3[1,1,3,3]
   57897:      	pmuludq	%xmm6, %xmm3
   5789b:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   578a0:      	pmuludq	%xmm6, %xmm4
   578a4:      	pshufd	$0xed, %xmm4, %xmm4     # xmm4 = xmm4[1,3,2,3]
   578a9:      	punpckldq	%xmm4, %xmm3    # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
   578ad:      	packssdw	%xmm2, %xmm3
   578b1:      	pand	%xmm1, %xmm3
   578b5:      	movdqu	%xmm3, -0x660(%rbp,%rax,2)
   578be:      	addq	$0x8, %rax
   578c2:      	cmpq	$0x100, %rax            # imm = 0x100
   578c8:      	jne	0x57850 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x13d0>
   578ca:      	leaq	-0x460(%rbp), %rbx
   578d1:      	leaq	-0x660(%rbp), %rsi
   578d8:      	movl	$0x200, %edx            # imm = 0x200
   578dd:      	movq	%rbx, %rdi
   578e0:      	callq	0xc5af0 <memcpy>
   578e5:      	leaq	-0x16a0(%rbp), %rdx
   578ec:      	movl	$0x4, %esi
   578f1:      	movl	$0x80, %ecx
   578f6:      	movq	%rbx, %rdi
   578f9:      	callq	0x59ec0 <<toyos_crypto::mlkem::Poly>::encode>
   578fe:      	xorl	%eax, %eax
   57900:      	movw	$0x0, -0x460(%rbp,%rax)
   5790a:      	movw	$0x0, -0x45e(%rbp,%rax)
   57914:      	movw	$0x0, -0x45c(%rbp,%rax)
   5791e:      	movw	$0x0, -0x45a(%rbp,%rax)
   57928:      	movw	$0x0, -0x458(%rbp,%rax)
   57932:      	movw	$0x0, -0x456(%rbp,%rax)
   5793c:      	movw	$0x0, -0x454(%rbp,%rax)
   57946:      	movw	$0x0, -0x452(%rbp,%rax)
   57950:      	addq	$0x10, %rax
   57954:      	cmpq	$0x200, %rax            # imm = 0x200
   5795a:      	jne	0x57900 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1480>
   5795c:      	xorl	%eax, %eax
   5795e:      	nop
   57960:      	movw	$0x0, -0x260(%rbp,%rax)
   5796a:      	movw	$0x0, -0x25e(%rbp,%rax)
   57974:      	movw	$0x0, -0x25c(%rbp,%rax)
   5797e:      	movw	$0x0, -0x25a(%rbp,%rax)
   57988:      	movw	$0x0, -0x258(%rbp,%rax)
   57992:      	movw	$0x0, -0x256(%rbp,%rax)
   5799c:      	movw	$0x0, -0x254(%rbp,%rax)
   579a6:      	movw	$0x0, -0x252(%rbp,%rax)
   579b0:      	addq	$0x10, %rax
   579b4:      	cmpq	$0x200, %rax            # imm = 0x200
   579ba:      	jne	0x57960 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x14e0>
   579bc:      	xorl	%eax, %eax
   579be:      	nop
   579c0:      	movw	$0x0, -0x1260(%rbp,%rax)
   579ca:      	movw	$0x0, -0x125e(%rbp,%rax)
   579d4:      	movw	$0x0, -0x125c(%rbp,%rax)
   579de:      	movw	$0x0, -0x125a(%rbp,%rax)
   579e8:      	movw	$0x0, -0x1258(%rbp,%rax)
   579f2:      	movw	$0x0, -0x1256(%rbp,%rax)
   579fc:      	movw	$0x0, -0x1254(%rbp,%rax)
   57a06:      	movw	$0x0, -0x1252(%rbp,%rax)
   57a10:      	addq	$0x10, %rax
   57a14:      	cmpq	$0x200, %rax            # imm = 0x200
   57a1a:      	jne	0x579c0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1540>
   57a1c:      	xorl	%eax, %eax
   57a1e:      	nop
   57a20:      	movw	$0x0, -0xa60(%rbp,%rax)
   57a2a:      	movw	$0x0, -0xa5e(%rbp,%rax)
   57a34:      	movw	$0x0, -0xa5c(%rbp,%rax)
   57a3e:      	movw	$0x0, -0xa5a(%rbp,%rax)
   57a48:      	movw	$0x0, -0xa58(%rbp,%rax)
   57a52:      	movw	$0x0, -0xa56(%rbp,%rax)
   57a5c:      	movw	$0x0, -0xa54(%rbp,%rax)
   57a66:      	movw	$0x0, -0xa52(%rbp,%rax)
   57a70:      	addq	$0x10, %rax
   57a74:      	cmpq	$0x200, %rax            # imm = 0x200
   57a7a:      	jne	0x57a20 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x15a0>
   57a7c:      	xorl	%eax, %eax
   57a7e:      	nop
   57a80:      	movw	$0x0, -0x860(%rbp,%rax)
   57a8a:      	movw	$0x0, -0x85e(%rbp,%rax)
   57a94:      	movw	$0x0, -0x85c(%rbp,%rax)
   57a9e:      	movw	$0x0, -0x85a(%rbp,%rax)
   57aa8:      	movw	$0x0, -0x858(%rbp,%rax)
   57ab2:      	movw	$0x0, -0x856(%rbp,%rax)
   57abc:      	movw	$0x0, -0x854(%rbp,%rax)
   57ac6:      	movw	$0x0, -0x852(%rbp,%rax)
   57ad0:      	addq	$0x10, %rax
   57ad4:      	cmpq	$0x200, %rax            # imm = 0x200
   57ada:      	jne	0x57a80 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1600>
   57adc:      	leaq	-0x1a60(%rbp), %rsi
   57ae3:      	movl	$0x440, %edx            # imm = 0x440
   57ae8:      	movq	%r14, %rdi
   57aeb:      	callq	0xc5af0 <memcpy>
   57af0:      	xorl	%eax, %eax
   57af2:      	nopw	%cs:(%rax,%rax)
   57b00:      	movw	$0x0, -0x1060(%rbp,%rax)
   57b0a:      	movw	$0x0, -0x105e(%rbp,%rax)
   57b14:      	movw	$0x0, -0x105c(%rbp,%rax)
   57b1e:      	movw	$0x0, -0x105a(%rbp,%rax)
   57b28:      	movw	$0x0, -0x1058(%rbp,%rax)
   57b32:      	movw	$0x0, -0x1056(%rbp,%rax)
   57b3c:      	movw	$0x0, -0x1054(%rbp,%rax)
   57b46:      	movw	$0x0, -0x1052(%rbp,%rax)
   57b50:      	addq	$0x10, %rax
   57b54:      	cmpq	$0x200, %rax            # imm = 0x200
   57b5a:      	jne	0x57b00 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1680>
   57b5c:      	xorl	%eax, %eax
   57b5e:      	nop
   57b60:      	movw	$0x0, -0xe60(%rbp,%rax)
   57b6a:      	movw	$0x0, -0xe5e(%rbp,%rax)
   57b74:      	movw	$0x0, -0xe5c(%rbp,%rax)
   57b7e:      	movw	$0x0, -0xe5a(%rbp,%rax)
   57b88:      	movw	$0x0, -0xe58(%rbp,%rax)
   57b92:      	movw	$0x0, -0xe56(%rbp,%rax)
   57b9c:      	movw	$0x0, -0xe54(%rbp,%rax)
   57ba6:      	movw	$0x0, -0xe52(%rbp,%rax)
   57bb0:      	addq	$0x10, %rax
   57bb4:      	cmpq	$0x200, %rax            # imm = 0x200
   57bba:      	jne	0x57b60 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x16e0>
   57bbc:      	xorl	%eax, %eax
   57bbe:      	nop
   57bc0:      	movw	$0x0, -0xc60(%rbp,%rax)
   57bca:      	movw	$0x0, -0xc5e(%rbp,%rax)
   57bd4:      	movw	$0x0, -0xc5c(%rbp,%rax)
   57bde:      	movw	$0x0, -0xc5a(%rbp,%rax)
   57be8:      	movw	$0x0, -0xc58(%rbp,%rax)
   57bf2:      	movw	$0x0, -0xc56(%rbp,%rax)
   57bfc:      	movw	$0x0, -0xc54(%rbp,%rax)
   57c06:      	movw	$0x0, -0xc52(%rbp,%rax)
   57c10:      	addq	$0x10, %rax
   57c14:      	cmpq	$0x200, %rax            # imm = 0x200
   57c1a:      	jne	0x57bc0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1740>
   57c1c:      	movq	%r14, %rax
   57c1f:      	addq	$0x1a38, %rsp           # imm = 0x1A38
   57c26:      	popq	%rbx
   57c27:      	popq	%r12
   57c29:      	popq	%r13
   57c2b:      	popq	%r14
   57c2d:      	popq	%r15
   57c2f:      	popq	%rbp
   57c30:      	retq
   57c31:      	xorl	%ecx, %ecx
   57c33:      	nopw	%cs:(%rax,%rax)
   57c40:      	movw	$0x0, -0x460(%rbp,%rcx)
   57c4a:      	movw	$0x0, -0x45e(%rbp,%rcx)
   57c54:      	movw	$0x0, -0x45c(%rbp,%rcx)
   57c5e:      	movw	$0x0, -0x45a(%rbp,%rcx)
   57c68:      	movw	$0x0, -0x458(%rbp,%rcx)
   57c72:      	movw	$0x0, -0x456(%rbp,%rcx)
   57c7c:      	movw	$0x0, -0x454(%rbp,%rcx)
   57c86:      	movw	$0x0, -0x452(%rbp,%rcx)
   57c90:      	addq	$0x10, %rcx
   57c94:      	cmpq	$0x200, %rcx            # imm = 0x200
   57c9b:      	jne	0x57c40 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x17c0>
   57c9d:      	xorl	%ecx, %ecx
   57c9f:      	nop
   57ca0:      	movw	$0x0, -0x260(%rbp,%rcx)
   57caa:      	movw	$0x0, -0x25e(%rbp,%rcx)
   57cb4:      	movw	$0x0, -0x25c(%rbp,%rcx)
   57cbe:      	movw	$0x0, -0x25a(%rbp,%rcx)
   57cc8:      	movw	$0x0, -0x258(%rbp,%rcx)
   57cd2:      	movw	$0x0, -0x256(%rbp,%rcx)
   57cdc:      	movw	$0x0, -0x254(%rbp,%rcx)
   57ce6:      	movw	$0x0, -0x252(%rbp,%rcx)
   57cf0:      	addq	$0x10, %rcx
   57cf4:      	cmpq	$0x200, %rcx            # imm = 0x200
   57cfb:      	jne	0x57ca0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1820>
   57cfd:      	xorl	%ecx, %ecx
   57cff:      	nop
   57d00:      	movw	$0x0, -0x1260(%rbp,%rcx)
   57d0a:      	movw	$0x0, -0x125e(%rbp,%rcx)
   57d14:      	movw	$0x0, -0x125c(%rbp,%rcx)
   57d1e:      	movw	$0x0, -0x125a(%rbp,%rcx)
   57d28:      	movw	$0x0, -0x1258(%rbp,%rcx)
   57d32:      	movw	$0x0, -0x1256(%rbp,%rcx)
   57d3c:      	movw	$0x0, -0x1254(%rbp,%rcx)
   57d46:      	movw	$0x0, -0x1252(%rbp,%rcx)
   57d50:      	addq	$0x10, %rcx
   57d54:      	cmpq	$0x200, %rcx            # imm = 0x200
   57d5b:      	jne	0x57d00 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1880>
   57d5d:      	xorl	%ecx, %ecx
   57d5f:      	nop
   57d60:      	movw	$0x0, -0xa60(%rbp,%rcx)
   57d6a:      	movw	$0x0, -0xa5e(%rbp,%rcx)
   57d74:      	movw	$0x0, -0xa5c(%rbp,%rcx)
   57d7e:      	movw	$0x0, -0xa5a(%rbp,%rcx)
   57d88:      	movw	$0x0, -0xa58(%rbp,%rcx)
   57d92:      	movw	$0x0, -0xa56(%rbp,%rcx)
   57d9c:      	movw	$0x0, -0xa54(%rbp,%rcx)
   57da6:      	movw	$0x0, -0xa52(%rbp,%rcx)
   57db0:      	addq	$0x10, %rcx
   57db4:      	cmpq	$0x200, %rcx            # imm = 0x200
   57dbb:      	jne	0x57d60 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x18e0>
   57dbd:      	jmp	0x57dbf <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x193f>
   57dbf:      	xorl	%ecx, %ecx
   57dc1:      	nopw	%cs:(%rax,%rax)
   57dd0:      	movw	$0x0, -0x860(%rbp,%rcx)
   57dda:      	movw	$0x0, -0x85e(%rbp,%rcx)
   57de4:      	movw	$0x0, -0x85c(%rbp,%rcx)
   57dee:      	movw	$0x0, -0x85a(%rbp,%rcx)
   57df8:      	movw	$0x0, -0x858(%rbp,%rcx)
   57e02:      	movw	$0x0, -0x856(%rbp,%rcx)
   57e0c:      	movw	$0x0, -0x854(%rbp,%rcx)
   57e16:      	movw	$0x0, -0x852(%rbp,%rcx)
   57e20:      	addq	$0x10, %rcx
   57e24:      	cmpq	$0x200, %rcx            # imm = 0x200
   57e2b:      	jne	0x57dd0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1950>
   57e2d:      	jmp	0x57f8d <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1b0d>
   57e32:      	jmp	0x57f8f <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1b0f>
   57e37:      	movq	%rax, %rbx
   57e3a:      	movq	%r14, -0x850(%rbp)
   57e41:      	leaq	-0x860(%rbp), %rdi
   57e48:      	callq	0x56090 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>
   57e4d:      	movq	%rbx, %rdi
   57e50:      	callq	0xb9f20 <_Unwind_Resume>
   57e55:      	xorl	%ecx, %ecx
   57e57:      	nopw	(%rax,%rax)
   57e60:      	movw	$0x0, -0x460(%rbp,%rcx)
   57e6a:      	movw	$0x0, -0x45e(%rbp,%rcx)
   57e74:      	movw	$0x0, -0x45c(%rbp,%rcx)
   57e7e:      	movw	$0x0, -0x45a(%rbp,%rcx)
   57e88:      	movw	$0x0, -0x458(%rbp,%rcx)
   57e92:      	movw	$0x0, -0x456(%rbp,%rcx)
   57e9c:      	movw	$0x0, -0x454(%rbp,%rcx)
   57ea6:      	movw	$0x0, -0x452(%rbp,%rcx)
   57eb0:      	addq	$0x10, %rcx
   57eb4:      	cmpq	$0x200, %rcx            # imm = 0x200
   57ebb:      	jne	0x57e60 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x19e0>
   57ebd:      	xorl	%ecx, %ecx
   57ebf:      	nop
   57ec0:      	movw	$0x0, -0x660(%rbp,%rcx)
   57eca:      	movw	$0x0, -0x65e(%rbp,%rcx)
   57ed4:      	movw	$0x0, -0x65c(%rbp,%rcx)
   57ede:      	movw	$0x0, -0x65a(%rbp,%rcx)
   57ee8:      	movw	$0x0, -0x658(%rbp,%rcx)
   57ef2:      	movw	$0x0, -0x656(%rbp,%rcx)
   57efc:      	movw	$0x0, -0x654(%rbp,%rcx)
   57f06:      	movw	$0x0, -0x652(%rbp,%rcx)
   57f10:      	addq	$0x10, %rcx
   57f14:      	cmpq	$0x200, %rcx            # imm = 0x200
   57f1b:      	jne	0x57ec0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1a40>
   57f1d:      	jmp	0x57f1f <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1a9f>
   57f1f:      	xorl	%ecx, %ecx
   57f21:      	nopw	%cs:(%rax,%rax)
   57f30:      	movw	$0x0, -0x260(%rbp,%rcx)
   57f3a:      	movw	$0x0, -0x25e(%rbp,%rcx)
   57f44:      	movw	$0x0, -0x25c(%rbp,%rcx)
   57f4e:      	movw	$0x0, -0x25a(%rbp,%rcx)
   57f58:      	movw	$0x0, -0x258(%rbp,%rcx)
   57f62:      	movw	$0x0, -0x256(%rbp,%rcx)
   57f6c:      	movw	$0x0, -0x254(%rbp,%rcx)
   57f76:      	movw	$0x0, -0x252(%rbp,%rcx)
   57f80:      	addq	$0x10, %rcx
   57f84:      	cmpq	$0x200, %rcx            # imm = 0x200
   57f8b:      	jne	0x57f30 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1ab0>
   57f8d:      	jmp	0x57f8f <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1b0f>
   57f8f:      	movq	%rax, %rdi
   57f92:      	jmp	0x57ffc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1b7c>
   57f94:      	movq	%rax, %rdi
   57f97:      	xorl	%eax, %eax
   57f99:      	nopl	(%rax)
   57fa0:      	movw	$0x0, -0x860(%rbp,%rax)
   57faa:      	movw	$0x0, -0x85e(%rbp,%rax)
   57fb4:      	movw	$0x0, -0x85c(%rbp,%rax)
   57fbe:      	movw	$0x0, -0x85a(%rbp,%rax)
   57fc8:      	movw	$0x0, -0x858(%rbp,%rax)
   57fd2:      	movw	$0x0, -0x856(%rbp,%rax)
   57fdc:      	movw	$0x0, -0x854(%rbp,%rax)
   57fe6:      	movw	$0x0, -0x852(%rbp,%rax)
   57ff0:      	addq	$0x10, %rax
   57ff4:      	cmpq	$0x200, %rax            # imm = 0x200
   57ffa:      	jne	0x57fa0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1b20>
   57ffc:      	xorl	%eax, %eax
   57ffe:      	nop
   58000:      	movw	$0x0, -0x1060(%rbp,%rax)
   5800a:      	movw	$0x0, -0x105e(%rbp,%rax)
   58014:      	movw	$0x0, -0x105c(%rbp,%rax)
   5801e:      	movw	$0x0, -0x105a(%rbp,%rax)
   58028:      	movw	$0x0, -0x1058(%rbp,%rax)
   58032:      	movw	$0x0, -0x1056(%rbp,%rax)
   5803c:      	movw	$0x0, -0x1054(%rbp,%rax)
   58046:      	movw	$0x0, -0x1052(%rbp,%rax)
   58050:      	addq	$0x10, %rax
   58054:      	cmpq	$0x200, %rax            # imm = 0x200
   5805a:      	jne	0x58000 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1b80>
   5805c:      	xorl	%eax, %eax
   5805e:      	nop
   58060:      	movw	$0x0, -0xe60(%rbp,%rax)
   5806a:      	movw	$0x0, -0xe5e(%rbp,%rax)
   58074:      	movw	$0x0, -0xe5c(%rbp,%rax)
   5807e:      	movw	$0x0, -0xe5a(%rbp,%rax)
   58088:      	movw	$0x0, -0xe58(%rbp,%rax)
   58092:      	movw	$0x0, -0xe56(%rbp,%rax)
   5809c:      	movw	$0x0, -0xe54(%rbp,%rax)
   580a6:      	movw	$0x0, -0xe52(%rbp,%rax)
   580b0:      	addq	$0x10, %rax
   580b4:      	cmpq	$0x200, %rax            # imm = 0x200
   580ba:      	jne	0x58060 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1be0>
   580bc:      	xorl	%eax, %eax
   580be:      	nop
   580c0:      	movw	$0x0, -0xc60(%rbp,%rax)
   580ca:      	movw	$0x0, -0xc5e(%rbp,%rax)
   580d4:      	movw	$0x0, -0xc5c(%rbp,%rax)
   580de:      	movw	$0x0, -0xc5a(%rbp,%rax)
   580e8:      	movw	$0x0, -0xc58(%rbp,%rax)
   580f2:      	movw	$0x0, -0xc56(%rbp,%rax)
   580fc:      	movw	$0x0, -0xc54(%rbp,%rax)
   58106:      	movw	$0x0, -0xc52(%rbp,%rax)
   58110:      	addq	$0x10, %rax
   58114:      	cmpq	$0x200, %rax            # imm = 0x200
   5811a:      	jne	0x580c0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x1c40>
   5811c:      	callq	0xb9f20 <_Unwind_Resume>
   58121:      	int3
   58122:      	int3
   58123:      	int3
   58124:      	int3
   58125:      	int3
   58126:      	int3
   58127:      	int3
   58128:      	int3
   58129:      	int3
   5812a:      	int3
   5812b:      	int3
   5812c:      	int3
   5812d:      	int3
   5812e:      	int3
   5812f:      	int3

0000000000058130 <<toyos_crypto::mlkem::EncapsulationKey>::as_bytes>:
   58130:      	pushq	%rbp
   58131:      	movq	%rsp, %rbp
   58134:      	movq	%rdi, %rax
   58137:      	popq	%rbp
   58138:      	retq
   58139:      	int3
   5813a:      	int3
   5813b:      	int3
   5813c:      	int3
   5813d:      	int3
   5813e:      	int3
   5813f:      	int3

0000000000058140 <<toyos_crypto::mlkem::DecapsulationKey>::public_key>:
   58140:      	pushq	%rbp
   58141:      	movq	%rsp, %rbp
   58144:      	leaq	0x600(%rdi), %rax
   5814b:      	popq	%rbp
   5814c:      	retq
   5814d:      	int3
   5814e:      	int3
   5814f:      	int3

0000000000058150 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate>:
   58150:      	pushq	%rbp
   58151:      	movq	%rsp, %rbp
   58154:      	pushq	%r15
   58156:      	pushq	%r14
   58158:      	pushq	%r13
   5815a:      	pushq	%r12
   5815c:      	pushq	%rbx
   5815d:      	subq	$0xca8, %rsp            # imm = 0xCA8
   58164:      	movq	%rsi, %rbx
   58167:      	cmpq	$0x440, %rcx            # imm = 0x440
   5816e:      	jne	0x59357 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1207>
   58174:      	movq	%rdx, -0x30(%rbp)
   58178:      	movq	%rdi, -0x88(%rbp)
   5817f:      	leaq	-0xad0(%rbp), %rdi
   58186:      	movq	$0x0, -0x38(%rbp)
   5818e:      	movl	$0x200, %edx            # imm = 0x200
   58193:      	xorl	%esi, %esi
   58195:      	callq	0xc6240 <memset>
   5819a:      	leaq	-0x8d0(%rbp), %r13
   581a1:      	movl	$0x9d7dbb41, %r14d      # imm = 0x9D7DBB41
   581a7:      	xorl	%eax, %eax
   581a9:      	nopl	(%rax)
   581b0:      	leaq	(%rbx,%rax), %r15
   581b4:      	addq	$0x200, %rax            # imm = 0x200
   581ba:      	movq	%rax, -0x90(%rbp)
   581c1:      	movq	-0x38(%rbp), %rax
   581c5:      	leaq	(%rax,%rax,4), %r12
   581c9:      	incq	%rax
   581cc:      	movq	%rax, -0x38(%rbp)
   581d0:      	shlq	$0x6, %r12
   581d4:      	addq	-0x30(%rbp), %r12
   581d8:      	movl	$0x200, %edx            # imm = 0x200
   581dd:      	movq	%r13, %rdi
   581e0:      	xorl	%esi, %esi
   581e2:      	callq	0xc6240 <memset>
   581e7:      	xorl	%edx, %edx
   581e9:      	nopl	(%rax)
   581f0:      	movq	%rdx, %rax
   581f3:      	shrq	$0x3, %rax
   581f7:      	movzbl	(%r12,%rax), %r8d
   581fc:      	movl	%edx, %eax
   581fe:      	andb	$0x6, %al
   58200:      	movzbl	%al, %edi
   58203:      	xorl	%eax, %eax
   58205:      	btl	%edi, %r8d
   58209:      	setb	%al
   5820c:      	orw	(%r13), %ax
   58211:      	leal	0x1(%rdi), %ecx
   58214:      	shrl	%cl, %r8d
   58217:      	leaq	0x2(%rdx), %rcx
   5821b:      	movq	%rcx, %r9
   5821e:      	shrq	$0x3, %r9
   58222:      	movzbl	(%r12,%r9), %r9d
   58227:      	andb	$0x6, %cl
   5822a:      	shrl	%cl, %r9d
   5822d:      	addl	%r8d, %r8d
   58230:      	andl	$0x2, %r8d
   58234:      	shll	$0x2, %r9d
   58238:      	leaq	0x3(%rdx), %rcx
   5823c:      	movq	%rcx, %r10
   5823f:      	shrq	$0x3, %r10
   58243:      	movzbl	(%r12,%r10), %r10d
   58248:      	andb	$0x7, %cl
   5824b:      	shrl	%cl, %r10d
   5824e:      	andl	$0x4, %r9d
   58252:      	orl	%r8d, %r9d
   58255:      	shll	$0x3, %r10d
   58259:      	leaq	0x4(%rdx), %rcx
   5825d:      	movq	%rcx, %r8
   58260:      	shrq	$0x3, %r8
   58264:      	movzbl	(%r12,%r8), %r8d
   58269:      	andb	$0x6, %cl
   5826c:      	shrl	%cl, %r8d
   5826f:      	andl	$0x8, %r10d
   58273:      	orl	%r9d, %r10d
   58276:      	shll	$0x4, %r8d
   5827a:      	andl	$0x10, %r8d
   5827e:      	orl	%r10d, %r8d
   58281:      	orl	%eax, %r8d
   58284:      	leaq	0x5(%rdx), %rcx
   58288:      	movq	%rcx, %rax
   5828b:      	shrq	$0x3, %rax
   5828f:      	movzbl	(%r12,%rax), %r9d
   58294:      	andb	$0x7, %cl
   58297:      	shrl	%cl, %r9d
   5829a:      	leaq	0x6(%rdx), %rcx
   5829e:      	leaq	0x7(%rdx), %rax
   582a2:      	movq	%rax, %r10
   582a5:      	shrq	$0x3, %r10
   582a9:      	movzbl	(%r12,%r10), %r10d
   582ae:      	movq	%rcx, %r11
   582b1:      	shrq	$0x3, %r11
   582b5:      	movzbl	(%r12,%r11), %r11d
   582ba:      	andb	$0x6, %cl
   582bd:      	shrl	%cl, %r11d
   582c0:      	shll	$0x5, %r9d
   582c4:      	andl	$0x20, %r9d
   582c8:      	shll	$0x6, %r11d
   582cc:      	andb	$0x7, %al
   582ce:      	movl	%eax, %ecx
   582d0:      	shrb	%cl, %r10b
   582d3:      	andl	$0x40, %r11d
   582d7:      	orl	%r9d, %r11d
   582da:      	shlb	$0x7, %r10b
   582de:      	movzbl	%r10b, %eax
   582e2:      	orl	%r11d, %eax
   582e5:      	leaq	0x8(%rdx), %rcx
   582e9:      	shrq	$0x3, %rcx
   582ed:      	movzbl	(%r12,%rcx), %ecx
   582f2:      	xorl	%r9d, %r9d
   582f5:      	btl	%edi, %ecx
   582f8:      	setb	%r9b
   582fc:      	shll	$0x8, %r9d
   58300:      	orl	%eax, %r9d
   58303:      	leaq	0x9(%rdx), %rax
   58307:      	movq	%rax, %rcx
   5830a:      	shrq	$0x3, %rcx
   5830e:      	movzbl	(%r12,%rcx), %ecx
   58313:      	andl	$0x7, %eax
   58316:      	xorl	%edi, %edi
   58318:      	btl	%eax, %ecx
   5831b:      	setb	%dil
   5831f:      	shll	$0x9, %edi
   58322:      	orl	%r9d, %edi
   58325:      	orl	%r8d, %edi
   58328:      	movw	%di, (%r13)
   5832d:      	addq	$0x2, %r13
   58331:      	addq	$0xa, %rdx
   58335:      	cmpq	$0xa00, %rdx            # imm = 0xA00
   5833c:      	jne	0x581f0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xa0>
   58342:      	movl	$0x200, %edx            # imm = 0x200
   58347:      	leaq	-0x290(%rbp), %r13
   5834e:      	movq	%r13, %rdi
   58351:      	leaq	-0x8d0(%rbp), %r12
   58358:      	movq	%r12, %rsi
   5835b:      	callq	0xc5af0 <memcpy>
   58360:      	xorl	%eax, %eax
   58362:      	movdqa	-0x4973a(%rip), %xmm3   # 0xec30 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x3b0>
   5836a:      	movdqa	-0x497f2(%rip), %xmm4   # 0xeb80 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x300>
   58372:      	nopw	%cs:(%rax,%rax)
   58380:      	movdqu	-0x290(%rbp,%rax,2), %xmm0
   58389:      	movdqa	%xmm0, %xmm1
   5838d:      	pmulhuw	%xmm3, %xmm1
   58391:      	pmullw	%xmm3, %xmm0
   58395:      	movdqa	%xmm0, %xmm2
   58399:      	punpckhwd	%xmm1, %xmm2    # xmm2 = xmm2[4],xmm1[4],xmm2[5],xmm1[5],xmm2[6],xmm1[6],xmm2[7],xmm1[7]
   5839d:      	punpcklwd	%xmm1, %xmm0    # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1],xmm0[2],xmm1[2],xmm0[3],xmm1[3]
   583a1:      	paddd	%xmm4, %xmm0
   583a5:      	paddd	%xmm4, %xmm2
   583a9:      	pslld	$0x6, %xmm2
   583ae:      	psrad	$0x10, %xmm2
   583b3:      	pslld	$0x6, %xmm0
   583b8:      	psrad	$0x10, %xmm0
   583bd:      	packssdw	%xmm2, %xmm0
   583c1:      	movdqu	%xmm0, -0x290(%rbp,%rax,2)
   583ca:      	addq	$0x8, %rax
   583ce:      	cmpq	$0x100, %rax            # imm = 0x100
   583d4:      	jne	0x58380 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x230>
   583d6:      	movl	$0x200, %edx            # imm = 0x200
   583db:      	movq	%r12, %rdi
   583de:      	movq	%r13, %rsi
   583e1:      	callq	0xc5af0 <memcpy>
   583e6:      	movq	%r13, %rdi
   583e9:      	movq	%r12, %rsi
   583ec:      	callq	0x59760 <<toyos_crypto::mlkem::Poly>::ntt>
   583f1:      	movl	$0x200, %edx            # imm = 0x200
   583f6:      	movq	%r12, %rdi
   583f9:      	xorl	%esi, %esi
   583fb:      	callq	0xc6240 <memset>
   58400:      	xorl	%eax, %eax
   58402:      	jmp	0x58527 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x3d7>
   58407:      	nopw	(%rax,%rax)
   58410:      	movzwl	(%r15,%rax,4), %edi
   58415:      	movzwl	-0x290(%rbp,%rax,4), %edx
   5841d:      	movl	%edx, %r9d
   58420:      	imull	%edi, %r9d
   58424:      	imulq	$0x3afb7681, %r9, %rsi  # imm = 0x3AFB7681
   5842b:      	shrq	$0x20, %rsi
   5842f:      	movl	%r9d, %r8d
   58432:      	subl	%esi, %r8d
   58435:      	shrl	%r8d
   58438:      	addl	%esi, %r8d
   5843b:      	shrl	$0xb, %r8d
   5843f:      	imull	$0xd01, %r8d, %esi      # imm = 0xD01
   58446:      	subl	%esi, %r9d
   58449:      	movzwl	0x2(%r15,%rax,4), %r8d
   5844f:      	movzwl	-0x28e(%rbp,%rax,4), %esi
   58457:      	movl	%esi, %r10d
   5845a:      	imull	%r8d, %r10d
   5845e:      	imulq	$0x3afb7681, %r10, %r11 # imm = 0x3AFB7681
   58465:      	shrq	$0x20, %r11
   58469:      	movl	%r10d, %r12d
   5846c:      	subl	%r11d, %r12d
   5846f:      	shrl	%r12d
   58472:      	addl	%r11d, %r12d
   58475:      	shrl	$0xb, %r12d
   58479:      	imull	$0xd01, %r12d, %r11d    # imm = 0xD01
   58480:      	subl	%r11d, %r10d
   58483:      	movzwl	%cx, %ecx
   58486:      	imull	%r10d, %ecx
   5848a:      	imulq	$0x13afb769, %rcx, %r10 # imm = 0x13AFB769
   58491:      	shrq	$0x28, %r10
   58495:      	imull	$0xd01, %r10d, %r10d    # imm = 0xD01
   5849c:      	subl	%r10d, %ecx
   5849f:      	addl	%r9d, %ecx
   584a2:      	leal	-0xd01(%rcx), %r9d
   584a9:      	cmpl	$0xd01, %ecx            # imm = 0xD01
   584af:      	cmovbl	%ecx, %r9d
   584b3:      	movw	%r9w, -0x8d0(%rbp,%rax,4)
   584bc:      	imull	%edi, %esi
   584bf:      	imulq	$0x3afb7681, %rsi, %rcx # imm = 0x3AFB7681
   584c6:      	shrq	$0x20, %rcx
   584ca:      	movl	%esi, %edi
   584cc:      	subl	%ecx, %edi
   584ce:      	shrl	%edi
   584d0:      	addl	%ecx, %edi
   584d2:      	shrl	$0xb, %edi
   584d5:      	imull	$0xd01, %edi, %ecx      # imm = 0xD01
   584db:      	subl	%ecx, %esi
   584dd:      	imull	%r8d, %edx
   584e1:      	imulq	$0x3afb7681, %rdx, %rcx # imm = 0x3AFB7681
   584e8:      	shrq	$0x20, %rcx
   584ec:      	movl	%edx, %edi
   584ee:      	subl	%ecx, %edi
   584f0:      	shrl	%edi
   584f2:      	addl	%ecx, %edi
   584f4:      	shrl	$0xb, %edi
   584f7:      	imull	$0xd01, %edi, %ecx      # imm = 0xD01
   584fd:      	subl	%ecx, %edx
   584ff:      	addl	%esi, %edx
   58501:      	leal	-0xd01(%rdx), %ecx
   58507:      	cmpl	$0xd01, %edx            # imm = 0xD01
   5850d:      	cmovbl	%edx, %ecx
   58510:      	movw	%cx, -0x8ce(%rbp,%rax,4)
   58518:      	incq	%rax
   5851b:      	cmpq	$0x80, %rax
   58521:      	je	0x585c0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x470>
   58527:      	movl	%eax, %ecx
   58529:      	rolb	$0x4, %cl
   5852c:      	orb	$0x8, %cl
   5852f:      	movl	%ecx, %edx
   58531:      	andb	$0x33, %dl
   58534:      	shlb	$0x2, %dl
   58537:      	shrb	$0x2, %cl
   5853a:      	andb	$0x33, %cl
   5853d:      	orb	%dl, %cl
   5853f:      	movl	%ecx, %edx
   58541:      	andb	$0x55, %dl
   58544:      	addb	%dl, %dl
   58546:      	shrb	%cl
   58548:      	andb	$0x55, %cl
   5854b:      	orb	%dl, %cl
   5854d:      	movzbl	%cl, %edx
   58550:      	movw	$0x1, %cx
   58554:      	movw	$0x11, %si
   58558:      	jmp	0x5857e <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x42e>
   5855a:      	nopw	(%rax,%rax)
   58560:      	imull	%esi, %esi
   58563:      	movq	%rsi, %rdi
   58566:      	imulq	%r14, %rdi
   5856a:      	shrq	$0x2b, %rdi
   5856e:      	imull	$0xd01, %edi, %edi      # imm = 0xD01
   58574:      	subl	%edi, %esi
   58576:      	shrl	%edx
   58578:      	je	0x58410 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x2c0>
   5857e:      	movzwl	%si, %esi
   58581:      	testb	$0x1, %dl
   58584:      	je	0x58560 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x410>
   58586:      	movzwl	%cx, %ecx
   58589:      	imull	%esi, %ecx
   5858c:      	imulq	$0x3afb7681, %rcx, %rdi # imm = 0x3AFB7681
   58593:      	shrq	$0x20, %rdi
   58597:      	movl	%ecx, %r8d
   5859a:      	subl	%edi, %r8d
   5859d:      	shrl	%r8d
   585a0:      	addl	%edi, %r8d
   585a3:      	shrl	$0xb, %r8d
   585a7:      	imull	$0xd01, %r8d, %edi      # imm = 0xD01
   585ae:      	subl	%edi, %ecx
   585b0:      	jmp	0x58560 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x410>
   585b2:      	nopw	%cs:(%rax,%rax)
   585c0:      	movl	$0x200, %edx            # imm = 0x200
   585c5:      	leaq	-0x490(%rbp), %rdi
   585cc:      	leaq	-0x8d0(%rbp), %r13
   585d3:      	movq	%r13, %rsi
   585d6:      	callq	0xc5af0 <memcpy>
   585db:      	xorl	%eax, %eax
   585dd:      	movdqa	-0x49a75(%rip), %xmm4   # 0xeb70 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x2f0>
   585e5:      	pxor	%xmm5, %xmm5
   585e9:      	movdqa	-0x49991(%rip), %xmm6   # 0xec60 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x3e0>
   585f1:      	nopw	%cs:(%rax,%rax)
   58600:      	movdqu	-0xad0(%rbp,%rax,2), %xmm2
   58609:      	movdqu	-0x490(%rbp,%rax,2), %xmm0
   58612:      	movdqa	%xmm2, %xmm3
   58616:      	punpckhwd	%xmm5, %xmm3    # xmm3 = xmm3[4],xmm5[4],xmm3[5],xmm5[5],xmm3[6],xmm5[6],xmm3[7],xmm5[7]
   5861a:      	punpcklwd	%xmm5, %xmm2    # xmm2 = xmm2[0],xmm5[0],xmm2[1],xmm5[1],xmm2[2],xmm5[2],xmm2[3],xmm5[3]
   5861e:      	movdqa	%xmm0, %xmm1
   58622:      	punpckhwd	%xmm5, %xmm1    # xmm1 = xmm1[4],xmm5[4],xmm1[5],xmm5[5],xmm1[6],xmm5[6],xmm1[7],xmm5[7]
   58626:      	paddd	%xmm3, %xmm1
   5862a:      	punpcklwd	%xmm5, %xmm0    # xmm0 = xmm0[0],xmm5[0],xmm0[1],xmm5[1],xmm0[2],xmm5[2],xmm0[3],xmm5[3]
   5862e:      	paddd	%xmm2, %xmm0
   58632:      	movdqa	%xmm1, %xmm2
   58636:      	pmuludq	%xmm4, %xmm2
   5863a:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
   5863f:      	pshufd	$0xf5, %xmm1, %xmm3     # xmm3 = xmm1[1,1,3,3]
   58644:      	pmuludq	%xmm4, %xmm3
   58648:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   5864d:      	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
   58651:      	pmaddwd	%xmm6, %xmm2
   58655:      	psubd	%xmm2, %xmm1
   58659:      	movdqa	%xmm0, %xmm2
   5865d:      	pmuludq	%xmm4, %xmm2
   58661:      	pshufd	$0xed, %xmm2, %xmm2     # xmm2 = xmm2[1,3,2,3]
   58666:      	pshufd	$0xf5, %xmm0, %xmm3     # xmm3 = xmm0[1,1,3,3]
   5866b:      	pmuludq	%xmm4, %xmm3
   5866f:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   58674:      	punpckldq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
   58678:      	pmaddwd	%xmm6, %xmm2
   5867c:      	psubd	%xmm2, %xmm0
   58680:      	packssdw	%xmm1, %xmm0
   58684:      	movdqu	%xmm0, -0x8d0(%rbp,%rax,2)
   5868d:      	addq	$0x8, %rax
   58691:      	cmpq	$0x100, %rax            # imm = 0x100
   58697:      	jne	0x58600 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x4b0>
   5869d:      	movl	$0x200, %edx            # imm = 0x200
   586a2:      	leaq	-0xcd0(%rbp), %r15
   586a9:      	movq	%r15, %rdi
   586ac:      	movq	%r13, %rsi
   586af:      	callq	0xc5af0 <memcpy>
   586b4:      	movl	$0xe, %eax
   586b9:      	nopl	(%rax)
   586c0:      	movw	$0x0, -0xade(%rbp,%rax)
   586ca:      	movw	$0x0, -0xadc(%rbp,%rax)
   586d4:      	movw	$0x0, -0xada(%rbp,%rax)
   586de:      	movw	$0x0, -0xad8(%rbp,%rax)
   586e8:      	movw	$0x0, -0xad6(%rbp,%rax)
   586f2:      	movw	$0x0, -0xad4(%rbp,%rax)
   586fc:      	movw	$0x0, -0xad2(%rbp,%rax)
   58706:      	movw	$0x0, -0xad0(%rbp,%rax)
   58710:      	addq	$0x10, %rax
   58714:      	cmpq	$0x20e, %rax            # imm = 0x20E
   5871a:      	jne	0x586c0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x570>
   5871c:      	movl	$0x200, %edx            # imm = 0x200
   58721:      	leaq	-0xad0(%rbp), %rdi
   58728:      	movq	%r15, %rsi
   5872b:      	callq	0xc5af0 <memcpy>
   58730:      	xorl	%eax, %eax
   58732:      	nopw	%cs:(%rax,%rax)
   58740:      	movw	$0x0, -0x490(%rbp,%rax)
   5874a:      	movw	$0x0, -0x48e(%rbp,%rax)
   58754:      	movw	$0x0, -0x48c(%rbp,%rax)
   5875e:      	movw	$0x0, -0x48a(%rbp,%rax)
   58768:      	movw	$0x0, -0x488(%rbp,%rax)
   58772:      	movw	$0x0, -0x486(%rbp,%rax)
   5877c:      	movw	$0x0, -0x484(%rbp,%rax)
   58786:      	movw	$0x0, -0x482(%rbp,%rax)
   58790:      	addq	$0x10, %rax
   58794:      	cmpq	$0x200, %rax            # imm = 0x200
   5879a:      	jne	0x58740 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x5f0>
   5879c:      	xorl	%eax, %eax
   5879e:      	nop
   587a0:      	movw	$0x0, -0x290(%rbp,%rax)
   587aa:      	movw	$0x0, -0x28e(%rbp,%rax)
   587b4:      	movw	$0x0, -0x28c(%rbp,%rax)
   587be:      	movw	$0x0, -0x28a(%rbp,%rax)
   587c8:      	movw	$0x0, -0x288(%rbp,%rax)
   587d2:      	movw	$0x0, -0x286(%rbp,%rax)
   587dc:      	movw	$0x0, -0x284(%rbp,%rax)
   587e6:      	movw	$0x0, -0x282(%rbp,%rax)
   587f0:      	addq	$0x10, %rax
   587f4:      	cmpq	$0x200, %rax            # imm = 0x200
   587fa:      	jne	0x587a0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x650>
   587fc:      	movq	-0x90(%rbp), %rax
   58803:      	cmpq	$0x600, %rax            # imm = 0x600
   58809:      	jne	0x581b0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x60>
   5880f:      	pxor	%xmm0, %xmm0
   58813:      	movdqa	%xmm0, -0x50(%rbp)
   58818:      	movdqa	%xmm0, -0x60(%rbp)
   5881d:      	leaq	-0x8d0(%rbp), %rdi
   58824:      	xorl	%r14d, %r14d
   58827:      	movl	$0x200, %edx            # imm = 0x200
   5882c:      	xorl	%esi, %esi
   5882e:      	callq	0xc6240 <memset>
   58833:      	xorl	%edx, %edx
   58835:      	movq	-0x30(%rbp), %r15
   58839:      	nopl	(%rax)
   58840:      	movq	%rdx, %rax
   58843:      	shrq	%rax
   58846:      	movzbl	0x3c0(%r15,%rax), %esi
   5884f:      	movl	%r14d, %eax
   58852:      	andb	$0x4, %al
   58854:      	movzbl	%al, %eax
   58857:      	xorl	%edi, %edi
   58859:      	btl	%eax, %esi
   5885c:      	setb	%dil
   58860:      	orw	-0x8d0(%rbp,%rdx,2), %di
   58868:      	leal	0x1(%rax), %ecx
   5886b:      	movl	%esi, %r8d
   5886e:      	shrl	%cl, %r8d
   58871:      	addl	%r8d, %r8d
   58874:      	andl	$0x2, %r8d
   58878:      	leal	0x2(%rax), %ecx
   5887b:      	movl	%esi, %r9d
   5887e:      	shrl	%cl, %r9d
   58881:      	shll	$0x2, %r9d
   58885:      	andl	$0x4, %r9d
   58889:      	orl	%r8d, %r9d
   5888c:      	orb	$0x3, %al
   5888e:      	movl	%eax, %ecx
   58890:      	shrl	%cl, %esi
   58892:      	shll	$0x3, %esi
   58895:      	andl	$0x8, %esi
   58898:      	orl	%r9d, %esi
   5889b:      	orl	%edi, %esi
   5889d:      	movw	%si, -0x8d0(%rbp,%rdx,2)
   588a5:      	incq	%rdx
   588a8:      	addb	$0x4, %r14b
   588ac:      	cmpq	$0x100, %rdx            # imm = 0x100
   588b3:      	jne	0x58840 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x6f0>
   588b5:      	leaq	-0x290(%rbp), %rdi
   588bc:      	leaq	-0x8d0(%rbp), %rsi
   588c3:      	movl	$0x200, %edx            # imm = 0x200
   588c8:      	callq	0xc5af0 <memcpy>
   588cd:      	xorl	%eax, %eax
   588cf:      	movdqa	-0x4a157(%rip), %xmm0   # 0xe780 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x5c0>
   588d7:      	movdqa	-0x49caf(%rip), %xmm4   # 0xec30 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x3b0>
   588df:      	nop
   588e0:      	movdqu	-0x290(%rbp,%rax,2), %xmm1
   588e9:      	movdqa	%xmm1, %xmm2
   588ed:      	pmulhuw	%xmm4, %xmm2
   588f1:      	pmullw	%xmm4, %xmm1
   588f5:      	movdqa	%xmm1, %xmm3
   588f9:      	punpckhwd	%xmm2, %xmm3    # xmm3 = xmm3[4],xmm2[4],xmm3[5],xmm2[5],xmm3[6],xmm2[6],xmm3[7],xmm2[7]
   588fd:      	punpcklwd	%xmm2, %xmm1    # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1],xmm1[2],xmm2[2],xmm1[3],xmm2[3]
   58901:      	paddd	%xmm0, %xmm1
   58905:      	paddd	%xmm0, %xmm3
   58909:      	pslld	$0xc, %xmm3
   5890e:      	psrad	$0x10, %xmm3
   58913:      	pslld	$0xc, %xmm1
   58918:      	psrad	$0x10, %xmm1
   5891d:      	packssdw	%xmm3, %xmm1
   58921:      	movdqu	%xmm1, -0x290(%rbp,%rax,2)
   5892a:      	addq	$0x8, %rax
   5892e:      	cmpq	$0x100, %rax            # imm = 0x100
   58934:      	jne	0x588e0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x790>
   58936:      	leaq	-0x490(%rbp), %rdi
   5893d:      	leaq	-0x290(%rbp), %rsi
   58944:      	movl	$0x200, %edx            # imm = 0x200
   58949:      	callq	0xc5af0 <memcpy>
   5894e:      	leaq	-0x8d0(%rbp), %r14
   58955:      	leaq	-0xad0(%rbp), %rsi
   5895c:      	movl	$0x200, %edx            # imm = 0x200
   58961:      	movq	%r14, %rdi
   58964:      	callq	0xc5af0 <memcpy>
   58969:      	leaq	-0x290(%rbp), %rdi
   58970:      	movq	%r14, %rsi
   58973:      	callq	0x5a000 <<toyos_crypto::mlkem::Poly>::inverse>
   58978:      	movl	$0x1, %eax
   5897d:      	nopl	(%rax)
   58980:      	movzwl	-0x492(%rbp,%rax,2), %ecx
   58988:      	movzwl	-0x292(%rbp,%rax,2), %edx
   58990:      	addl	$0xd01, %ecx            # imm = 0xD01
   58996:      	subl	%edx, %ecx
   58998:      	jb	0x594c8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1378>
   5899e:      	imulq	$0x13afb8, %rcx, %rdx   # imm = 0x13AFB8
   589a5:      	shrq	$0x20, %rdx
   589a9:      	imull	$0xd01, %edx, %edx      # imm = 0xD01
   589af:      	subl	%edx, %ecx
   589b1:      	movw	%cx, -0x8d2(%rbp,%rax,2)
   589b9:      	movzwl	-0x490(%rbp,%rax,2), %ecx
   589c1:      	movzwl	-0x290(%rbp,%rax,2), %edx
   589c9:      	addl	$0xd01, %ecx            # imm = 0xD01
   589cf:      	subl	%edx, %ecx
   589d1:      	jb	0x594c8 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1378>
   589d7:      	imulq	$0x13afb8, %rcx, %rdx   # imm = 0x13AFB8
   589de:      	shrq	$0x20, %rdx
   589e2:      	imull	$0xd01, %edx, %edx      # imm = 0xD01
   589e8:      	subl	%edx, %ecx
   589ea:      	movw	%cx, -0x8d0(%rbp,%rax,2)
   589f2:      	addq	$0x2, %rax
   589f6:      	cmpq	$0x101, %rax            # imm = 0x101
   589fc:      	jne	0x58980 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x830>
   589fe:      	leaq	-0xcd0(%rbp), %rdi
   58a05:      	leaq	-0x8d0(%rbp), %rsi
   58a0c:      	movl	$0x200, %edx            # imm = 0x200
   58a11:      	callq	0xc5af0 <memcpy>
   58a16:      	xorl	%eax, %eax
   58a18:      	pxor	%xmm0, %xmm0
   58a1c:      	movdqa	-0x4a034(%rip), %xmm1   # 0xe9f0 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x170>
   58a24:      	movdqa	-0x4a2bc(%rip), %xmm2   # 0xe770 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x5b0>
   58a2c:      	movdqa	-0x49ec4(%rip), %xmm6   # 0xeb70 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x2f0>
   58a34:      	nopw	%cs:(%rax,%rax)
   58a40:      	movdqu	-0xcd0(%rbp,%rax,2), %xmm3
   58a49:      	movdqa	%xmm3, %xmm4
   58a4d:      	punpcklwd	%xmm0, %xmm4    # xmm4 = xmm4[0],xmm0[0],xmm4[1],xmm0[1],xmm4[2],xmm0[2],xmm4[3],xmm0[3]
   58a51:      	punpckhwd	%xmm0, %xmm3    # xmm3 = xmm3[4],xmm0[4],xmm3[5],xmm0[5],xmm3[6],xmm0[6],xmm3[7],xmm0[7]
   58a55:      	paddd	%xmm3, %xmm3
   58a59:      	paddd	%xmm4, %xmm4
   58a5d:      	paddd	%xmm1, %xmm4
   58a61:      	paddd	%xmm1, %xmm3
   58a65:      	pshufd	$0xf5, %xmm3, %xmm5     # xmm5 = xmm3[1,1,3,3]
   58a6a:      	pmuludq	%xmm6, %xmm3
   58a6e:      	pshufd	$0xed, %xmm3, %xmm3     # xmm3 = xmm3[1,3,2,3]
   58a73:      	pmuludq	%xmm6, %xmm5
   58a77:      	pshufd	$0xed, %xmm5, %xmm5     # xmm5 = xmm5[1,3,2,3]
   58a7c:      	punpckldq	%xmm5, %xmm3    # xmm3 = xmm3[0],xmm5[0],xmm3[1],xmm5[1]
   58a80:      	pshufd	$0xf5, %xmm4, %xmm5     # xmm5 = xmm4[1,1,3,3]
   58a85:      	pmuludq	%xmm6, %xmm4
   58a89:      	pshufd	$0xed, %xmm4, %xmm4     # xmm4 = xmm4[1,3,2,3]
   58a8e:      	pmuludq	%xmm6, %xmm5
   58a92:      	pshufd	$0xed, %xmm5, %xmm5     # xmm5 = xmm5[1,3,2,3]
   58a97:      	punpckldq	%xmm5, %xmm4    # xmm4 = xmm4[0],xmm5[0],xmm4[1],xmm5[1]
   58a9b:      	packuswb	%xmm3, %xmm4
   58a9f:      	pand	%xmm2, %xmm4
   58aa3:      	movdqu	%xmm4, -0xcd0(%rbp,%rax,2)
   58aac:      	addq	$0x8, %rax
   58ab0:      	cmpq	$0x100, %rax            # imm = 0x100
   58ab6:      	jne	0x58a40 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x8f0>
   58ab8:      	leaq	-0x8d0(%rbp), %r12
   58abf:      	leaq	-0xcd0(%rbp), %rsi
   58ac6:      	movl	$0x200, %edx            # imm = 0x200
   58acb:      	movq	%r12, %rdi
   58ace:      	callq	0xc5af0 <memcpy>
   58ad3:      	leaq	-0x60(%rbp), %r14
   58ad7:      	movl	$0x1, %esi
   58adc:      	movl	$0x20, %ecx
   58ae1:      	movq	%r12, %rdi
   58ae4:      	movq	%r14, %rdx
   58ae7:      	callq	0x59ec0 <<toyos_crypto::mlkem::Poly>::encode>
   58aec:      	xorl	%eax, %eax
   58aee:      	nop
   58af0:      	movw	$0x0, -0x8d0(%rbp,%rax)
   58afa:      	movw	$0x0, -0x8ce(%rbp,%rax)
   58b04:      	movw	$0x0, -0x8cc(%rbp,%rax)
   58b0e:      	movw	$0x0, -0x8ca(%rbp,%rax)
   58b18:      	movw	$0x0, -0x8c8(%rbp,%rax)
   58b22:      	movw	$0x0, -0x8c6(%rbp,%rax)
   58b2c:      	movw	$0x0, -0x8c4(%rbp,%rax)
   58b36:      	movw	$0x0, -0x8c2(%rbp,%rax)
   58b40:      	addq	$0x10, %rax
   58b44:      	cmpq	$0x200, %rax            # imm = 0x200
   58b4a:      	jne	0x58af0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x9a0>
   58b4c:      	xorl	%eax, %eax
   58b4e:      	nop
   58b50:      	movw	$0x0, -0x290(%rbp,%rax)
   58b5a:      	movw	$0x0, -0x28e(%rbp,%rax)
   58b64:      	movw	$0x0, -0x28c(%rbp,%rax)
   58b6e:      	movw	$0x0, -0x28a(%rbp,%rax)
   58b78:      	movw	$0x0, -0x288(%rbp,%rax)
   58b82:      	movw	$0x0, -0x286(%rbp,%rax)
   58b8c:      	movw	$0x0, -0x284(%rbp,%rax)
   58b96:      	movw	$0x0, -0x282(%rbp,%rax)
   58ba0:      	addq	$0x10, %rax
   58ba4:      	cmpq	$0x200, %rax            # imm = 0x200
   58baa:      	jne	0x58b50 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xa00>
   58bac:      	xorl	%eax, %eax
   58bae:      	nop
   58bb0:      	movw	$0x0, -0x490(%rbp,%rax)
   58bba:      	movw	$0x0, -0x48e(%rbp,%rax)
   58bc4:      	movw	$0x0, -0x48c(%rbp,%rax)
   58bce:      	movw	$0x0, -0x48a(%rbp,%rax)
   58bd8:      	movw	$0x0, -0x488(%rbp,%rax)
   58be2:      	movw	$0x0, -0x486(%rbp,%rax)
   58bec:      	movw	$0x0, -0x484(%rbp,%rax)
   58bf6:      	movw	$0x0, -0x482(%rbp,%rax)
   58c00:      	addq	$0x10, %rax
   58c04:      	cmpq	$0x200, %rax            # imm = 0x200
   58c0a:      	jne	0x58bb0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xa60>
   58c0c:      	leaq	0xaa0(%rbx), %rax
   58c13:      	movq	%r14, -0x490(%rbp)
   58c1a:      	movq	$0x20, -0x488(%rbp)
   58c25:      	movq	%rax, -0x480(%rbp)
   58c2c:      	movq	$0x20, -0x478(%rbp)
   58c37:      	leaq	-0x8d0(%rbp), %rdi
   58c3e:      	leaq	-0x490(%rbp), %rsi
   58c45:      	movl	$0x2, %edx
   58c4a:      	callq	0x4b1e0 <toyos_crypto::keccak::g>
   58c4f:      	movups	-0x8d0(%rbp), %xmm0
   58c56:      	movups	-0x8c0(%rbp), %xmm1
   58c5d:      	movdqu	-0x8b0(%rbp), %xmm2
   58c65:      	movdqu	-0x8a0(%rbp), %xmm3
   58c6d:      	movdqa	%xmm3, -0x260(%rbp)
   58c75:      	movdqa	%xmm2, -0x270(%rbp)
   58c7d:      	movaps	%xmm1, -0x280(%rbp)
   58c84:      	movaps	%xmm0, -0x290(%rbp)
   58c8b:      	leaq	0xac0(%rbx), %r12
   58c92:      	movq	%r12, -0x8d0(%rbp)
   58c99:      	movq	$0x20, -0x8c8(%rbp)
   58ca4:      	movq	%r15, -0x8c0(%rbp)
   58cab:      	movq	$0x440, -0x8b8(%rbp)    # imm = 0x440
   58cb6:      	leaq	-0x490(%rbp), %rdi
   58cbd:      	leaq	-0x8d0(%rbp), %rsi
   58cc4:      	movl	$0x2, %edx
   58cc9:      	callq	0x4b600 <toyos_crypto::keccak::j>
   58cce:      	movdqa	-0x490(%rbp), %xmm0
   58cd6:      	movdqa	-0x480(%rbp), %xmm1
   58cde:      	movdqa	%xmm0, -0x80(%rbp)
   58ce3:      	movdqa	%xmm1, -0x70(%rbp)
   58ce8:      	leaq	-0x270(%rbp), %r14
   58cef:      	leaq	-0x8d0(%rbp), %rdi
   58cf6:      	leaq	-0x60(%rbp), %rdx
   58cfa:      	leaq	0x600(%rbx), %rsi
   58d01:      	movq	%r14, %rcx
   58d04:      	callq	0x56480 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>
   58d09:      	leaq	0x440(%r15), %rdi
   58d10:      	movq	%r15, %rsi
   58d13:      	callq	0xc38b0 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   58d18:      	testb	%al, %al
   58d1a:      	je	0x594ae <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x135e>
   58d20:      	leaq	-0x490(%rbp), %rdi
   58d27:      	leaq	-0x8d0(%rbp), %rsi
   58d2e:      	callq	0xc38b0 <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   58d33:      	testb	%al, %al
   58d35:      	je	0x594ae <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x135e>
   58d3b:      	pxor	%xmm0, %xmm0
   58d3f:      	movl	$0x6, %eax
   58d44:      	pxor	%xmm2, %xmm2
   58d48:      	pxor	%xmm1, %xmm1
   58d4c:      	nopl	(%rax)
   58d50:      	movzwl	-0x8d6(%rbp,%rax), %ecx
   58d58:      	movzwl	-0x8d4(%rbp,%rax), %edx
   58d60:      	xorw	-0x6(%r15,%rax), %cx
   58d66:      	xorw	-0x4(%r15,%rax), %dx
   58d6c:      	movd	%ecx, %xmm4
   58d70:      	movd	%edx, %xmm3
   58d74:      	punpcklbw	%xmm0, %xmm4    # xmm4 = xmm4[0],xmm0[0],xmm4[1],xmm0[1],xmm4[2],xmm0[2],xmm4[3],xmm0[3],xmm4[4],xmm0[4],xmm4[5],xmm0[5],xmm4[6],xmm0[6],xmm4[7],xmm0[7]
   58d78:      	punpcklwd	%xmm0, %xmm4    # xmm4 = xmm4[0],xmm0[0],xmm4[1],xmm0[1],xmm4[2],xmm0[2],xmm4[3],xmm0[3]
   58d7c:      	punpckldq	%xmm0, %xmm4    # xmm4 = xmm4[0],xmm0[0],xmm4[1],xmm0[1]
   58d80:      	por	%xmm2, %xmm4
   58d84:      	punpcklbw	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3],xmm3[4],xmm0[4],xmm3[5],xmm0[5],xmm3[6],xmm0[6],xmm3[7],xmm0[7]
   58d88:      	punpcklwd	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3]
   58d8c:      	punpckldq	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1]
   58d90:      	por	%xmm1, %xmm3
   58d94:      	movzwl	-0x8d2(%rbp,%rax), %ecx
   58d9c:      	movzwl	-0x8d0(%rbp,%rax), %edx
   58da4:      	xorw	-0x2(%r15,%rax), %cx
   58daa:      	xorw	(%r15,%rax), %dx
   58daf:      	movd	%ecx, %xmm2
   58db3:      	movd	%edx, %xmm1
   58db7:      	punpcklbw	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1],xmm2[2],xmm0[2],xmm2[3],xmm0[3],xmm2[4],xmm0[4],xmm2[5],xmm0[5],xmm2[6],xmm0[6],xmm2[7],xmm0[7]
   58dbb:      	punpcklwd	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1],xmm2[2],xmm0[2],xmm2[3],xmm0[3]
   58dbf:      	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
   58dc3:      	por	%xmm4, %xmm2
   58dc7:      	punpcklbw	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3],xmm1[4],xmm0[4],xmm1[5],xmm0[5],xmm1[6],xmm0[6],xmm1[7],xmm0[7]
   58dcb:      	punpcklwd	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3]
   58dcf:      	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
   58dd3:      	por	%xmm3, %xmm1
   58dd7:      	addq	$0x8, %rax
   58ddb:      	cmpq	$0x446, %rax            # imm = 0x446
   58de1:      	jne	0x58d50 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xc00>
   58de7:      	por	%xmm2, %xmm1
   58deb:      	pshufd	$0xee, %xmm1, %xmm0     # xmm0 = xmm1[2,3,2,3]
   58df0:      	por	%xmm1, %xmm0
   58df4:      	movq	%xmm0, %rax
   58df9:      	movl	$0x7, %ecx
   58dfe:      	nop
   58e00:      	movb	$0x0, -0x8d7(%rbp,%rcx)
   58e08:      	movb	$0x0, -0x8d6(%rbp,%rcx)
   58e10:      	movb	$0x0, -0x8d5(%rbp,%rcx)
   58e18:      	movb	$0x0, -0x8d4(%rbp,%rcx)
   58e20:      	movb	$0x0, -0x8d3(%rbp,%rcx)
   58e28:      	movb	$0x0, -0x8d2(%rbp,%rcx)
   58e30:      	movb	$0x0, -0x8d1(%rbp,%rcx)
   58e38:      	movb	$0x0, -0x8d0(%rbp,%rcx)
   58e40:      	addq	$0x8, %rcx
   58e44:      	cmpq	$0x447, %rcx            # imm = 0x447
   58e4b:      	jne	0x58e00 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0xcb0>
   58e4d:      	xorl	%ecx, %ecx
   58e4f:      	testq	%rax, %rax
   58e52:      	setg	%cl
   58e55:      	leaq	0xff(%rcx), %rax
   58e5c:      	movq	%rax, %xmm0
   58e61:      	pshufd	$0x44, %xmm0, %xmm1     # xmm1 = xmm0[0,1,0,1]
   58e66:      	negq	%rcx
   58e69:      	movq	%rcx, %xmm0
   58e6e:      	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
   58e73:      	movdqa	-0x290(%rbp), %xmm8
   58e7c:      	movdqa	-0x280(%rbp), %xmm3
   58e84:      	movdqa	%xmm8, %xmm2
   58e89:      	punpcklbw	%xmm2, %xmm2    # xmm2 = xmm2[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
   58e8d:      	movdqa	%xmm2, %xmm5
   58e91:      	punpcklwd	%xmm5, %xmm5    # xmm5 = xmm5[0,0,1,1,2,2,3,3]
   58e95:      	pshufd	$0xd4, %xmm5, %xmm4     # xmm4 = xmm5[0,1,1,3]
   58e9a:      	pshufd	$0xf6, %xmm5, %xmm5     # xmm5 = xmm5[2,1,3,3]
   58e9f:      	punpckhwd	%xmm2, %xmm2    # xmm2 = xmm2[4,4,5,5,6,6,7,7]
   58ea3:      	pshufd	$0xd4, %xmm2, %xmm6     # xmm6 = xmm2[0,1,1,3]
   58ea8:      	pshufd	$0xf6, %xmm2, %xmm7     # xmm7 = xmm2[2,1,3,3]
   58ead:      	punpckhbw	%xmm8, %xmm8    # xmm8 = xmm8[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
   58eb2:      	movdqa	%xmm8, %xmm2
   58eb7:      	punpcklwd	%xmm2, %xmm2    # xmm2 = xmm2[0,0,1,1,2,2,3,3]
   58ebb:      	pshufd	$0xd4, %xmm2, %xmm9     # xmm9 = xmm2[0,1,1,3]
   58ec1:      	pshufd	$0xf6, %xmm2, %xmm2     # xmm2 = xmm2[2,1,3,3]
   58ec6:      	punpckhwd	%xmm8, %xmm8    # xmm8 = xmm8[4,4,5,5,6,6,7,7]
   58ecb:      	pshufd	$0xd4, %xmm8, %xmm11    # xmm11 = xmm8[0,1,1,3]
   58ed1:      	pshufd	$0xf6, %xmm8, %xmm13    # xmm13 = xmm8[2,1,3,3]
   58ed7:      	movdqa	-0x80(%rbp), %xmm12
   58edd:      	movdqa	%xmm12, %xmm10
   58ee2:      	punpcklbw	%xmm10, %xmm10  # xmm10 = xmm10[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
   58ee7:      	punpckhbw	%xmm12, %xmm12  # xmm12 = xmm12[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
   58eec:      	movdqa	%xmm12, %xmm15
   58ef1:      	punpckhwd	%xmm12, %xmm12  # xmm12 = xmm12[4,4,5,5,6,6,7,7]
   58ef6:      	pshufd	$0xf6, %xmm12, %xmm8    # xmm8 = xmm12[2,1,3,3]
   58efc:      	pand	%xmm1, %xmm13
   58f01:      	pand	%xmm0, %xmm8
   58f06:      	por	%xmm13, %xmm8
   58f0b:      	movdqa	%xmm10, %xmm13
   58f10:      	punpcklwd	%xmm13, %xmm13  # xmm13 = xmm13[0,0,1,1,2,2,3,3]
   58f15:      	punpcklwd	%xmm15, %xmm15  # xmm15 = xmm15[0,0,1,1,2,2,3,3]
   58f1a:      	pshufd	$0xd4, %xmm12, %xmm12   # xmm12 = xmm12[0,1,1,3]
   58f20:      	pand	%xmm1, %xmm11
   58f25:      	pand	%xmm0, %xmm12
   58f2a:      	por	%xmm11, %xmm12
   58f2f:      	pshufd	$0xf6, %xmm15, %xmm14   # xmm14 = xmm15[2,1,3,3]
   58f35:      	pand	%xmm1, %xmm2
   58f39:      	pand	%xmm0, %xmm14
   58f3e:      	por	%xmm2, %xmm14
   58f43:      	pshufd	$0xd4, %xmm13, %xmm2    # xmm2 = xmm13[0,1,1,3]
   58f49:      	pshufd	$0xf6, %xmm13, %xmm13   # xmm13 = xmm13[2,1,3,3]
   58f4f:      	punpckhwd	%xmm10, %xmm10  # xmm10 = xmm10[4,4,5,5,6,6,7,7]
   58f54:      	pshufd	$0xd4, %xmm15, %xmm11   # xmm11 = xmm15[0,1,1,3]
   58f5a:      	pand	%xmm1, %xmm9
   58f5f:      	pand	%xmm0, %xmm11
   58f64:      	por	%xmm9, %xmm11
   58f69:      	pshufd	$0xd4, %xmm10, %xmm9    # xmm9 = xmm10[0,1,1,3]
   58f6f:      	pshufd	$0xf6, %xmm10, %xmm10   # xmm10 = xmm10[2,1,3,3]
   58f75:      	pand	%xmm1, %xmm7
   58f79:      	pand	%xmm1, %xmm6
   58f7d:      	pand	%xmm1, %xmm5
   58f81:      	pand	%xmm1, %xmm4
   58f85:      	pand	%xmm0, %xmm10
   58f8a:      	por	%xmm7, %xmm10
   58f8f:      	pand	%xmm0, %xmm9
   58f94:      	por	%xmm6, %xmm9
   58f99:      	pand	%xmm0, %xmm13
   58f9e:      	por	%xmm5, %xmm13
   58fa3:      	pand	%xmm0, %xmm2
   58fa7:      	por	%xmm4, %xmm2
   58fab:      	movdqa	-0x4a793(%rip), %xmm4   # 0xe820 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x660>
   58fb3:      	pand	%xmm4, %xmm8
   58fb8:      	pand	%xmm4, %xmm12
   58fbd:      	packuswb	%xmm8, %xmm12
   58fc2:      	pand	%xmm4, %xmm14
   58fc7:      	pand	%xmm4, %xmm11
   58fcc:      	packuswb	%xmm14, %xmm11
   58fd1:      	packuswb	%xmm12, %xmm11
   58fd6:      	pand	%xmm4, %xmm10
   58fdb:      	pand	%xmm4, %xmm9
   58fe0:      	packuswb	%xmm10, %xmm9
   58fe5:      	pand	%xmm4, %xmm13
   58fea:      	pand	%xmm4, %xmm2
   58fee:      	packuswb	%xmm13, %xmm2
   58ff3:      	packuswb	%xmm9, %xmm2
   58ff8:      	packuswb	%xmm11, %xmm2
   58ffd:      	movdqa	%xmm3, %xmm8
   59002:      	punpcklbw	%xmm8, %xmm8    # xmm8 = xmm8[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
   59007:      	movdqa	%xmm8, %xmm6
   5900c:      	punpcklwd	%xmm6, %xmm6    # xmm6 = xmm6[0,0,1,1,2,2,3,3]
   59010:      	pshufd	$0xd4, %xmm6, %xmm5     # xmm5 = xmm6[0,1,1,3]
   59015:      	pshufd	$0xf6, %xmm6, %xmm6     # xmm6 = xmm6[2,1,3,3]
   5901a:      	punpckhwd	%xmm8, %xmm8    # xmm8 = xmm8[4,4,5,5,6,6,7,7]
   5901f:      	pshufd	$0xd4, %xmm8, %xmm7     # xmm7 = xmm8[0,1,1,3]
   59025:      	pshufd	$0xf6, %xmm8, %xmm8     # xmm8 = xmm8[2,1,3,3]
   5902b:      	punpckhbw	%xmm3, %xmm3    # xmm3 = xmm3[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
   5902f:      	movdqa	%xmm3, %xmm10
   59034:      	punpcklwd	%xmm10, %xmm10  # xmm10 = xmm10[0,0,1,1,2,2,3,3]
   59039:      	pshufd	$0xd4, %xmm10, %xmm9    # xmm9 = xmm10[0,1,1,3]
   5903f:      	pshufd	$0xf6, %xmm10, %xmm10   # xmm10 = xmm10[2,1,3,3]
   59045:      	punpckhwd	%xmm3, %xmm3    # xmm3 = xmm3[4,4,5,5,6,6,7,7]
   59049:      	pshufd	$0xd4, %xmm3, %xmm12    # xmm12 = xmm3[0,1,1,3]
   5904f:      	pshufd	$0xf6, %xmm3, %xmm15    # xmm15 = xmm3[2,1,3,3]
   59055:      	movdqa	-0x70(%rbp), %xmm11
   5905b:      	movdqa	%xmm11, %xmm3
   59060:      	punpckhbw	%xmm11, %xmm11  # xmm11 = xmm11[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
   59065:      	movdqa	%xmm11, %xmm14
   5906a:      	punpckhwd	%xmm11, %xmm11  # xmm11 = xmm11[4,4,5,5,6,6,7,7]
   5906f:      	pand	%xmm1, %xmm15
   59074:      	pand	%xmm1, %xmm12
   59079:      	pand	%xmm1, %xmm10
   5907e:      	pand	%xmm1, %xmm9
   59083:      	pand	%xmm1, %xmm8
   59088:      	pand	%xmm1, %xmm7
   5908c:      	pand	%xmm1, %xmm6
   59090:      	pand	%xmm1, %xmm5
   59094:      	pshufd	$0xf6, %xmm11, %xmm13   # xmm13 = xmm11[2,1,3,3]
   5909a:      	pand	%xmm0, %xmm13
   5909f:      	por	%xmm15, %xmm13
   590a4:      	punpcklbw	%xmm3, %xmm3    # xmm3 = xmm3[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
   590a8:      	punpcklwd	%xmm14, %xmm14  # xmm14 = xmm14[0,0,1,1,2,2,3,3]
   590ad:      	pshufd	$0xd4, %xmm11, %xmm11   # xmm11 = xmm11[0,1,1,3]
   590b3:      	pand	%xmm0, %xmm11
   590b8:      	por	%xmm12, %xmm11
   590bd:      	pshufd	$0xf6, %xmm14, %xmm12   # xmm12 = xmm14[2,1,3,3]
   590c3:      	pand	%xmm0, %xmm12
   590c8:      	por	%xmm10, %xmm12
   590cd:      	movdqa	%xmm3, %xmm10
   590d2:      	punpckhwd	%xmm3, %xmm3    # xmm3 = xmm3[4,4,5,5,6,6,7,7]
   590d6:      	pshufd	$0xd4, %xmm14, %xmm1    # xmm1 = xmm14[0,1,1,3]
   590dc:      	pand	%xmm0, %xmm1
   590e0:      	por	%xmm9, %xmm1
   590e5:      	pshufd	$0xf6, %xmm3, %xmm9     # xmm9 = xmm3[2,1,3,3]
   590eb:      	pand	%xmm0, %xmm9
   590f0:      	por	%xmm8, %xmm9
   590f5:      	punpcklwd	%xmm10, %xmm10  # xmm10 = xmm10[0,0,1,1,2,2,3,3]
   590fa:      	pshufd	$0xd4, %xmm3, %xmm3     # xmm3 = xmm3[0,1,1,3]
   590ff:      	pand	%xmm0, %xmm3
   59103:      	por	%xmm7, %xmm3
   59107:      	pshufd	$0xf6, %xmm10, %xmm7    # xmm7 = xmm10[2,1,3,3]
   5910d:      	pand	%xmm0, %xmm7
   59111:      	por	%xmm6, %xmm7
   59115:      	pshufd	$0xd4, %xmm10, %xmm6    # xmm6 = xmm10[0,1,1,3]
   5911b:      	pand	%xmm0, %xmm6
   5911f:      	por	%xmm5, %xmm6
   59123:      	pand	%xmm4, %xmm13
   59128:      	pand	%xmm4, %xmm11
   5912d:      	packuswb	%xmm13, %xmm11
   59132:      	pand	%xmm4, %xmm12
   59137:      	pand	%xmm4, %xmm1
   5913b:      	packuswb	%xmm12, %xmm1
   59140:      	packuswb	%xmm11, %xmm1
   59145:      	pand	%xmm4, %xmm9
   5914a:      	pand	%xmm4, %xmm3
   5914e:      	packuswb	%xmm9, %xmm3
   59153:      	pand	%xmm4, %xmm7
   59157:      	pand	%xmm4, %xmm6
   5915b:      	packuswb	%xmm7, %xmm6
   5915f:      	packuswb	%xmm3, %xmm6
   59163:      	packuswb	%xmm1, %xmm6
   59167:      	movq	-0x88(%rbp), %rdi
   5916e:      	movdqu	%xmm2, 0x1(%rdi)
   59173:      	movdqu	%xmm6, 0x11(%rdi)
   59178:      	movb	$0x0, (%rdi)
   5917b:      	pxor	%xmm0, %xmm0
   5917f:      	movdqa	%xmm0, -0x8d0(%rbp)
   59187:      	movaps	-0x8d0(%rbp), %xmm1
   5918e:      	movaps	%xmm1, -0x80(%rbp)
   59192:      	movdqa	%xmm0, -0x8d0(%rbp)
   5919a:      	movaps	-0x8d0(%rbp), %xmm1
   591a1:      	movaps	%xmm1, -0x70(%rbp)
   591a5:      	movdqa	%xmm0, -0x8d0(%rbp)
   591ad:      	movaps	-0x8d0(%rbp), %xmm1
   591b4:      	movaps	%xmm1, -0x290(%rbp)
   591bb:      	movdqa	%xmm0, -0x8d0(%rbp)
   591c3:      	movaps	-0x8d0(%rbp), %xmm1
   591ca:      	movaps	%xmm1, -0x280(%rbp)
   591d1:      	movdqa	%xmm0, -0x8d0(%rbp)
   591d9:      	movaps	-0x8d0(%rbp), %xmm1
   591e0:      	movups	%xmm1, (%r14)
   591e4:      	movdqa	%xmm0, -0x8d0(%rbp)
   591ec:      	movaps	-0x8d0(%rbp), %xmm1
   591f3:      	movaps	%xmm1, -0x260(%rbp)
   591fa:      	movdqa	%xmm0, -0x8d0(%rbp)
   59202:      	movaps	-0x8d0(%rbp), %xmm1
   59209:      	movaps	%xmm1, -0x60(%rbp)
   5920d:      	movdqa	%xmm0, -0x8d0(%rbp)
   59215:      	movaps	-0x8d0(%rbp), %xmm0
   5921c:      	movaps	%xmm0, -0x50(%rbp)
   59220:      	xorl	%eax, %eax
   59222:      	nopw	%cs:(%rax,%rax)
   59230:      	movw	$0x0, (%rbx,%rax)
   59236:      	movw	$0x0, 0x2(%rbx,%rax)
   5923d:      	movw	$0x0, 0x4(%rbx,%rax)
   59244:      	movw	$0x0, 0x6(%rbx,%rax)
   5924b:      	movw	$0x0, 0x8(%rbx,%rax)
   59252:      	movw	$0x0, 0xa(%rbx,%rax)
   59259:      	movw	$0x0, 0xc(%rbx,%rax)
   59260:      	movw	$0x0, 0xe(%rbx,%rax)
   59267:      	addq	$0x10, %rax
   5926b:      	cmpq	$0x200, %rax            # imm = 0x200
   59271:      	jne	0x59230 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x10e0>
   59273:      	xorl	%eax, %eax
   59275:      	nopw	%cs:(%rax,%rax)
   59280:      	movw	$0x0, 0x200(%rbx,%rax)
   5928a:      	movw	$0x0, 0x202(%rbx,%rax)
   59294:      	movw	$0x0, 0x204(%rbx,%rax)
   5929e:      	movw	$0x0, 0x206(%rbx,%rax)
   592a8:      	movw	$0x0, 0x208(%rbx,%rax)
   592b2:      	movw	$0x0, 0x20a(%rbx,%rax)
   592bc:      	movw	$0x0, 0x20c(%rbx,%rax)
   592c6:      	movw	$0x0, 0x20e(%rbx,%rax)
   592d0:      	addq	$0x10, %rax
   592d4:      	cmpq	$0x200, %rax            # imm = 0x200
   592da:      	jne	0x59280 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1130>
   592dc:      	xorl	%eax, %eax
   592de:      	nop
   592e0:      	movw	$0x0, 0x400(%rbx,%rax)
   592ea:      	movw	$0x0, 0x402(%rbx,%rax)
   592f4:      	movw	$0x0, 0x404(%rbx,%rax)
   592fe:      	movw	$0x0, 0x406(%rbx,%rax)
   59308:      	movw	$0x0, 0x408(%rbx,%rax)
   59312:      	movw	$0x0, 0x40a(%rbx,%rax)
   5931c:      	movw	$0x0, 0x40c(%rbx,%rax)
   59326:      	movw	$0x0, 0x40e(%rbx,%rax)
   59330:      	addq	$0x10, %rax
   59334:      	cmpq	$0x200, %rax            # imm = 0x200
   5933a:      	jne	0x592e0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1190>
   5933c:      	xorps	%xmm0, %xmm0
   5933f:      	movaps	%xmm0, -0x8d0(%rbp)
   59346:      	movaps	-0x8d0(%rbp), %xmm1
   5934d:      	movups	%xmm1, (%r12)
   59352:      	jmp	0x59484 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1334>
   59357:      	movw	$0x1, (%rdi)
   5935c:      	xorl	%eax, %eax
   5935e:      	nop
   59360:      	movw	$0x0, (%rbx,%rax)
   59366:      	movw	$0x0, 0x2(%rbx,%rax)
   5936d:      	movw	$0x0, 0x4(%rbx,%rax)
   59374:      	movw	$0x0, 0x6(%rbx,%rax)
   5937b:      	movw	$0x0, 0x8(%rbx,%rax)
   59382:      	movw	$0x0, 0xa(%rbx,%rax)
   59389:      	movw	$0x0, 0xc(%rbx,%rax)
   59390:      	movw	$0x0, 0xe(%rbx,%rax)
   59397:      	addq	$0x10, %rax
   5939b:      	cmpq	$0x200, %rax            # imm = 0x200
   593a1:      	jne	0x59360 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1210>
   593a3:      	xorl	%eax, %eax
   593a5:      	nopw	%cs:(%rax,%rax)
   593b0:      	movw	$0x0, 0x200(%rbx,%rax)
   593ba:      	movw	$0x0, 0x202(%rbx,%rax)
   593c4:      	movw	$0x0, 0x204(%rbx,%rax)
   593ce:      	movw	$0x0, 0x206(%rbx,%rax)
   593d8:      	movw	$0x0, 0x208(%rbx,%rax)
   593e2:      	movw	$0x0, 0x20a(%rbx,%rax)
   593ec:      	movw	$0x0, 0x20c(%rbx,%rax)
   593f6:      	movw	$0x0, 0x20e(%rbx,%rax)
   59400:      	addq	$0x10, %rax
   59404:      	cmpq	$0x200, %rax            # imm = 0x200
   5940a:      	jne	0x593b0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1260>
   5940c:      	xorl	%eax, %eax
   5940e:      	nop
   59410:      	movw	$0x0, 0x400(%rbx,%rax)
   5941a:      	movw	$0x0, 0x402(%rbx,%rax)
   59424:      	movw	$0x0, 0x404(%rbx,%rax)
   5942e:      	movw	$0x0, 0x406(%rbx,%rax)
   59438:      	movw	$0x0, 0x408(%rbx,%rax)
   59442:      	movw	$0x0, 0x40a(%rbx,%rax)
   5944c:      	movw	$0x0, 0x40c(%rbx,%rax)
   59456:      	movw	$0x0, 0x40e(%rbx,%rax)
   59460:      	addq	$0x10, %rax
   59464:      	cmpq	$0x200, %rax            # imm = 0x200
   5946a:      	jne	0x59410 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x12c0>
   5946c:      	xorps	%xmm0, %xmm0
   5946f:      	movaps	%xmm0, -0x8d0(%rbp)
   59476:      	movaps	-0x8d0(%rbp), %xmm1
   5947d:      	movups	%xmm1, 0xac0(%rbx)
   59484:      	movaps	%xmm0, -0x8d0(%rbp)
   5948b:      	movaps	-0x8d0(%rbp), %xmm0
   59492:      	movups	%xmm0, 0xad0(%rbx)
   59499:      	movq	%rdi, %rax
   5949c:      	addq	$0xca8, %rsp            # imm = 0xCA8
   594a3:      	popq	%rbx
   594a4:      	popq	%r12
   594a6:      	popq	%r13
   594a8:      	popq	%r14
   594aa:      	popq	%r15
   594ac:      	popq	%rbp
   594ad:      	retq
   594ae:      	leaq	-0x41275(%rip), %rdi    # 0x18240 <anon.2ed5837e6c2a2da14e2483c5642ee989.0.llvm.18088368063157376063>
   594b5:      	leaq	0x6e62c(%rip), %rcx     # 0xc7ae8 <anon.2ed5837e6c2a2da14e2483c5642ee989.2.llvm.18088368063157376063>
   594bc:      	movl	$0x193, %esi            # imm = 0x193
   594c1:      	xorl	%edx, %edx
   594c3:      	callq	0xbf390 <core::panicking::panic_nounwind_fmt>
   594c8:      	leaq	0x6e5e9(%rip), %rdi     # 0xc7ab8 <anon.ffc1aded08de8b2a105054a61a13d06b.1.llvm.10786651499350334936+0x120>
   594cf:      	callq	0xc0150 <core::panicking::panic_const::panic_const_sub_overflow>
   594d4:      	ud2
   594d6:      	callq	0xbf4af <core::panicking::panic_cannot_unwind>
   594db:      	callq	0xbf4af <core::panicking::panic_cannot_unwind>
   594e0:      	movq	%rax, %r14
   594e3:      	pxor	%xmm0, %xmm0
   594e7:      	movdqa	%xmm0, -0x490(%rbp)
   594ef:      	movaps	-0x490(%rbp), %xmm1
   594f6:      	movaps	%xmm1, -0x80(%rbp)
   594fa:      	movdqa	%xmm0, -0x490(%rbp)
   59502:      	movaps	-0x490(%rbp), %xmm0
   59509:      	movaps	%xmm0, -0x70(%rbp)
   5950d:      	jmp	0x59512 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x13c2>
   5950f:      	movq	%rax, %r14
   59512:      	xorps	%xmm0, %xmm0
   59515:      	movaps	%xmm0, -0xcd0(%rbp)
   5951c:      	movaps	-0xcd0(%rbp), %xmm1
   59523:      	movaps	%xmm1, -0x290(%rbp)
   5952a:      	movaps	%xmm0, -0xcd0(%rbp)
   59531:      	movaps	-0xcd0(%rbp), %xmm1
   59538:      	movaps	%xmm1, -0x280(%rbp)
   5953f:      	movaps	%xmm0, -0xcd0(%rbp)
   59546:      	movdqa	-0xcd0(%rbp), %xmm1
   5954e:      	movdqa	%xmm1, -0x270(%rbp)
   59556:      	movaps	%xmm0, -0xcd0(%rbp)
   5955d:      	movdqa	-0xcd0(%rbp), %xmm0
   59565:      	movdqa	%xmm0, -0x260(%rbp)
   5956d:      	jmp	0x5971c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x15cc>
   59572:      	movq	%rax, %r14
   59575:      	jmp	0x5971c <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x15cc>
   5957a:      	movq	%rax, %r14
   5957d:      	xorl	%eax, %eax
   5957f:      	nop
   59580:      	movw	$0x0, -0x8d0(%rbp,%rax)
   5958a:      	movw	$0x0, -0x8ce(%rbp,%rax)
   59594:      	movw	$0x0, -0x8cc(%rbp,%rax)
   5959e:      	movw	$0x0, -0x8ca(%rbp,%rax)
   595a8:      	movw	$0x0, -0x8c8(%rbp,%rax)
   595b2:      	movw	$0x0, -0x8c6(%rbp,%rax)
   595bc:      	movw	$0x0, -0x8c4(%rbp,%rax)
   595c6:      	movw	$0x0, -0x8c2(%rbp,%rax)
   595d0:      	addq	$0x10, %rax
   595d4:      	cmpq	$0x200, %rax            # imm = 0x200
   595da:      	jne	0x59580 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1430>
   595dc:      	jmp	0x59654 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1504>
   595de:      	movq	%rax, %r14
   595e1:      	jmp	0x596bc <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x156c>
   595e6:      	movq	%rax, %r14
   595e9:      	xorl	%eax, %eax
   595eb:      	nopl	(%rax,%rax)
   595f0:      	movw	$0x0, -0xad0(%rbp,%rax)
   595fa:      	movw	$0x0, -0xace(%rbp,%rax)
   59604:      	movw	$0x0, -0xacc(%rbp,%rax)
   5960e:      	movw	$0x0, -0xaca(%rbp,%rax)
   59618:      	movw	$0x0, -0xac8(%rbp,%rax)
   59622:      	movw	$0x0, -0xac6(%rbp,%rax)
   5962c:      	movw	$0x0, -0xac4(%rbp,%rax)
   59636:      	movw	$0x0, -0xac2(%rbp,%rax)
   59640:      	addq	$0x10, %rax
   59644:      	cmpq	$0x200, %rax            # imm = 0x200
   5964a:      	jne	0x595f0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x14a0>
   5964c:      	jmp	0x5974a <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x15fa>
   59651:      	movq	%rax, %r14
   59654:      	xorl	%eax, %eax
   59656:      	nopw	%cs:(%rax,%rax)
   59660:      	movw	$0x0, -0x290(%rbp,%rax)
   5966a:      	movw	$0x0, -0x28e(%rbp,%rax)
   59674:      	movw	$0x0, -0x28c(%rbp,%rax)
   5967e:      	movw	$0x0, -0x28a(%rbp,%rax)
   59688:      	movw	$0x0, -0x288(%rbp,%rax)
   59692:      	movw	$0x0, -0x286(%rbp,%rax)
   5969c:      	movw	$0x0, -0x284(%rbp,%rax)
   596a6:      	movw	$0x0, -0x282(%rbp,%rax)
   596b0:      	addq	$0x10, %rax
   596b4:      	cmpq	$0x200, %rax            # imm = 0x200
   596ba:      	jne	0x59660 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1510>
   596bc:      	xorl	%eax, %eax
   596be:      	nop
   596c0:      	movw	$0x0, -0x490(%rbp,%rax)
   596ca:      	movw	$0x0, -0x48e(%rbp,%rax)
   596d4:      	movw	$0x0, -0x48c(%rbp,%rax)
   596de:      	movw	$0x0, -0x48a(%rbp,%rax)
   596e8:      	movw	$0x0, -0x488(%rbp,%rax)
   596f2:      	movw	$0x0, -0x486(%rbp,%rax)
   596fc:      	movw	$0x0, -0x484(%rbp,%rax)
   59706:      	movw	$0x0, -0x482(%rbp,%rax)
   59710:      	addq	$0x10, %rax
   59714:      	cmpq	$0x200, %rax            # imm = 0x200
   5971a:      	jne	0x596c0 <<toyos_crypto::mlkem::DecapsulationKey>::decapsulate+0x1570>
   5971c:      	pxor	%xmm0, %xmm0
   59720:      	movdqa	%xmm0, -0xcd0(%rbp)
   59728:      	movdqa	-0xcd0(%rbp), %xmm1
   59730:      	movdqa	%xmm1, -0x60(%rbp)
   59735:      	movdqa	%xmm0, -0xcd0(%rbp)
   5973d:      	movdqa	-0xcd0(%rbp), %xmm0
   59745:      	movdqa	%xmm0, -0x50(%rbp)
   5974a:      	movq	%rbx, %rdi
   5974d:      	callq	0x55d20 <core::ptr::drop_glue::<toyos_crypto::mlkem::DecapsulationKey>>
   59752:      	movq	%r14, %rdi
   59755:      	callq	0xb9f20 <_Unwind_Resume>
   5975a:      	callq	0xbf33a <core::panicking::panic_in_cleanup>
   5975f:      	int3

0000000000059760 <<toyos_crypto::mlkem::Poly>::ntt>:
   59760:      	pushq	%rbp
   59761:      	movq	%rsp, %rbp
   59764:      	pushq	%r15
   59766:      	pushq	%r14
   59768:      	pushq	%r13
   5976a:      	pushq	%r12
   5976c:      	pushq	%rbx
   5976d:      	subq	$0x58, %rsp
   59771:      	movq	%rsi, %rbx
   59774:      	movq	%rdi, -0x50(%rbp)
   59778:      	movl	$0x80, %esi
   5977d:      	movl	$0x1, %eax
   59782:      	movq	%rax, -0x30(%rbp)
   59786:      	movdqa	-0x4ab8e(%rip), %xmm0   # 0xec00 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x380>
   5978e:      	movdqa	-0x4ab36(%rip), %xmm1   # 0xec60 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x3e0>
   59796:      	pxor	%xmm2, %xmm2
   5979a:      	movdqa	-0x4ac32(%rip), %xmm3   # 0xeb70 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x2f0>
   597a2:      	jmp	0x597cb <<toyos_crypto::mlkem::Poly>::ntt+0x6b>
   597a4:      	nopw	%cs:(%rax,%rax)
   597b0:      	movq	-0x58(%rbp), %rax
   597b4:      	movq	%rax, -0x30(%rbp)
   597b8:      	movq	%rsi, %rax
   597bb:      	shrq	%rax
   597be:      	cmpq	$0x3, %rsi
   597c2:      	movq	%rax, %rsi
   597c5:      	jbe	0x59d2f <<toyos_crypto::mlkem::Poly>::ntt+0x5cf>
   597cb:      	leaq	(%rsi,%rsi), %rdx
   597cf:      	tzcntq	%rdx, %rcx
   597d4:      	movl	$0x100, %r15d           # imm = 0x100
   597da:      	shrq	%cl, %r15
   597dd:      	leal	-0x1(%rdx), %eax
   597e0:      	btl	$0x8, %eax
   597e4:      	adcq	$0x0, %r15
   597e8:      	je	0x597b8 <<toyos_crypto::mlkem::Poly>::ntt+0x58>
   597ea:      	movq	-0x30(%rbp), %rax
   597ee:      	addq	%r15, %rax
   597f1:      	movq	%rax, -0x58(%rbp)
   597f5:      	movq	%rdx, %rax
   597f8:      	negq	%rax
   597fb:      	movq	%rax, -0x68(%rbp)
   597ff:      	leaq	(%rbx,%rdx), %r13
   59803:      	leaq	(%rbx,%rdx), %rax
   59807:      	addq	$0x2, %rax
   5980b:      	movq	%rax, -0x60(%rbp)
   5980f:      	leaq	(%rbx,%rsi,2), %rcx
   59813:      	movq	%rsi, %rdi
   59816:      	negq	%rdi
   59819:      	movq	%rbx, %r14
   5981c:      	xorl	%r10d, %r10d
   5981f:      	movq	%rsi, %rax
   59822:      	movq	$0x0, -0x40(%rbp)
   5982a:      	nopw	(%rax,%rax)
   59830:      	cmpq	$0x101, %rax            # imm = 0x101
   59836:      	movl	$0x100, %r9d            # imm = 0x100
   5983c:      	cmovaeq	%rax, %r9
   59840:      	movq	%rdi, -0x78(%rbp)
   59844:      	addq	%r9, %rdi
   59847:      	leaq	-0x1(%rsi), %r8
   5984b:      	cmpq	%r8, %rdi
   5984e:      	cmovaeq	%r8, %rdi
   59852:      	movq	-0x68(%rbp), %rdx
   59856:      	movq	%r10, -0x48(%rbp)
   5985a:      	imulq	%r10, %rdx
   5985e:      	subq	%rsi, %rdx
   59861:      	addq	%r9, %rdx
   59864:      	cmpq	%r8, %rdx
   59867:      	movq	%r8, %r10
   5986a:      	cmovbq	%rdx, %r10
   5986e:      	cmovaeq	%r8, %rdx
   59872:      	movq	-0x30(%rbp), %r8
   59876:      	movl	%r8d, %r9d
   59879:      	rolb	$0x4, %r9b
   5987d:      	movl	%r9d, %r11d
   59880:      	andb	$0x33, %r11b
   59884:      	shlb	$0x2, %r11b
   59888:      	shrb	$0x2, %r9b
   5988c:      	andb	$0x33, %r9b
   59890:      	orb	%r11b, %r9b
   59893:      	movl	%r9d, %r11d
   59896:      	andb	$0x55, %r11b
   5989a:      	addb	%r11b, %r11b
   5989d:      	shrb	%r9b
   598a0:      	andb	$0x54, %r9b
   598a4:      	orb	%r11b, %r9b
   598a7:      	shrb	%r9b
   598aa:      	movq	%rdi, -0x70(%rbp)
   598ae:      	je	0x59940 <<toyos_crypto::mlkem::Poly>::ntt+0x1e0>
   598b4:      	movq	%r15, -0x38(%rbp)
   598b8:      	movzbl	%r9b, %r12d
   598bc:      	movw	$0x1, %r9w
   598c1:      	movw	$0x11, %r11w
   598c6:      	jmp	0x598f4 <<toyos_crypto::mlkem::Poly>::ntt+0x194>
   598c8:      	nopl	(%rax,%rax)
   598d0:      	imull	%r11d, %r11d
   598d4:      	movq	%r11, %r8
   598d7:      	movl	$0x9d7dbb41, %r15d      # imm = 0x9D7DBB41
   598dd:      	imulq	%r15, %r8
   598e1:      	shrq	$0x2b, %r8
   598e5:      	imull	$0xd01, %r8d, %r8d      # imm = 0xD01
   598ec:      	subl	%r8d, %r11d
   598ef:      	shrl	%r12d
   598f2:      	je	0x59930 <<toyos_crypto::mlkem::Poly>::ntt+0x1d0>
   598f4:      	movzwl	%r11w, %r11d
   598f8:      	testb	$0x1, %r12b
   598fc:      	je	0x598d0 <<toyos_crypto::mlkem::Poly>::ntt+0x170>
   598fe:      	movzwl	%r9w, %r9d
   59902:      	imull	%r11d, %r9d
   59906:      	imulq	$0x3afb7681, %r9, %r15  # imm = 0x3AFB7681
   5990d:      	shrq	$0x20, %r15
   59911:      	movl	%r9d, %r8d
   59914:      	subl	%r15d, %r8d
   59917:      	shrl	%r8d
   5991a:      	addl	%r15d, %r8d
   5991d:      	shrl	$0xb, %r8d
   59921:      	imull	$0xd01, %r8d, %r8d      # imm = 0xD01
   59928:      	subl	%r8d, %r9d
   5992b:      	jmp	0x598d0 <<toyos_crypto::mlkem::Poly>::ntt+0x170>
   5992d:      	nopl	(%rax)
   59930:      	movzwl	%r9w, %r12d
   59934:      	movq	-0x38(%rbp), %r15
   59938:      	jmp	0x59946 <<toyos_crypto::mlkem::Poly>::ntt+0x1e6>
   5993a:      	nopw	(%rax,%rax)
   59940:      	movl	$0x1, %r12d
   59946:      	incq	-0x30(%rbp)
   5994a:      	movq	-0x40(%rbp), %rdi
   5994e:      	je	0x59d68 <<toyos_crypto::mlkem::Poly>::ntt+0x608>
   59954:      	movq	%rdi, %r9
   59957:      	cmpq	$0x7, %r10
   5995b:      	jbe	0x59c53 <<toyos_crypto::mlkem::Poly>::ntt+0x4f3>
   59961:      	leaq	(,%rsi,4), %r9
   59969:      	imulq	-0x48(%rbp), %r9
   5996e:      	leaq	(%rbx,%r9), %r11
   59972:      	movq	%r10, -0x38(%rbp)
   59976:      	movq	%r15, %r10
   59979:      	leaq	(%r11,%rdx,2), %r15
   5997d:      	addq	$0x2, %r15
   59981:      	leaq	(%r9,%r13), %r8
   59985:      	cmpq	%r15, %r8
   59988:      	movq	%r10, %r15
   5998b:      	movq	-0x38(%rbp), %r10
   5998f:      	jae	0x599a5 <<toyos_crypto::mlkem::Poly>::ntt+0x245>
   59991:      	addq	-0x60(%rbp), %r9
   59995:      	leaq	(%r9,%rdx,2), %rdx
   59999:      	movq	%rdi, %r9
   5999c:      	cmpq	%rdx, %r11
   5999f:      	jb	0x59c53 <<toyos_crypto::mlkem::Poly>::ntt+0x4f3>
   599a5:      	incq	%r10
   599a8:      	movl	%r10d, %edx
   599ab:      	andl	$0x7, %edx
   599ae:      	movl	$0x8, %r8d
   599b4:      	cmoveq	%r8, %rdx
   599b8:      	subq	%rdx, %r10
   599bb:      	movq	%r10, %r9
   599be:      	addq	%rdi, %r9
   599c1:      	movd	%r12d, %xmm4
   599c6:      	pshufd	$0x0, %xmm4, %xmm4      # xmm4 = xmm4[0,0,0,0]
   599cb:      	movq	-0x70(%rbp), %rdi
   599cf:      	subq	%rdx, %rdi
   599d2:      	incq	%rdi
   599d5:      	pslld	$0x10, %xmm4
   599da:      	psrad	$0x10, %xmm4
   599df:      	packssdw	%xmm4, %xmm4
   599e3:      	xorl	%r10d, %r10d
   599e6:      	nopw	%cs:(%rax,%rax)
   599f0:      	movdqu	(%rcx,%r10,2), %xmm5
   599f6:      	movdqa	%xmm4, %xmm7
   599fa:      	pmulhuw	%xmm5, %xmm7
   599fe:      	pmullw	%xmm4, %xmm5
   59a02:      	movdqa	%xmm5, %xmm6
   59a06:      	punpcklwd	%xmm7, %xmm6    # xmm6 = xmm6[0],xmm7[0],xmm6[1],xmm7[1],xmm6[2],xmm7[2],xmm6[3],xmm7[3]
   59a0a:      	punpckhwd	%xmm7, %xmm5    # xmm5 = xmm5[4],xmm7[4],xmm5[5],xmm7[5],xmm5[6],xmm7[6],xmm5[7],xmm7[7]
   59a0e:      	movdqa	%xmm5, %xmm7
   59a12:      	pmuludq	%xmm0, %xmm7
   59a16:      	pshufd	$0xed, %xmm7, %xmm7     # xmm7 = xmm7[1,3,2,3]
   59a1b:      	pshufd	$0xf5, %xmm5, %xmm8     # xmm8 = xmm5[1,1,3,3]
   59a21:      	pmuludq	%xmm0, %xmm8
   59a26:      	pshufd	$0xed, %xmm8, %xmm8     # xmm8 = xmm8[1,3,2,3]
   59a2c:      	punpckldq	%xmm8, %xmm7    # xmm7 = xmm7[0],xmm8[0],xmm7[1],xmm8[1]
   59a31:      	movdqa	%xmm5, %xmm8
   59a36:      	psubd	%xmm7, %xmm8
   59a3b:      	psrld	$0x1, %xmm8
   59a41:      	paddd	%xmm7, %xmm8
   59a46:      	psrld	$0xb, %xmm8
   59a4c:      	pshufd	$0xf5, %xmm8, %xmm7     # xmm7 = xmm8[1,1,3,3]
   59a52:      	pmuludq	%xmm1, %xmm8
   59a57:      	pshufd	$0xe8, %xmm8, %xmm8     # xmm8 = xmm8[0,2,2,3]
   59a5d:      	pmuludq	%xmm1, %xmm7
   59a61:      	pshufd	$0xe8, %xmm7, %xmm7     # xmm7 = xmm7[0,2,2,3]
   59a66:      	punpckldq	%xmm7, %xmm8    # xmm8 = xmm8[0],xmm7[0],xmm8[1],xmm7[1]
   59a6b:      	psubd	%xmm8, %xmm5
   59a70:      	movdqa	%xmm6, %xmm7
   59a74:      	pmuludq	%xmm0, %xmm7
   59a78:      	pshufd	$0xed, %xmm7, %xmm7     # xmm7 = xmm7[1,3,2,3]
   59a7d:      	pshufd	$0xf5, %xmm6, %xmm8     # xmm8 = xmm6[1,1,3,3]
   59a83:      	pmuludq	%xmm0, %xmm8
   59a88:      	pshufd	$0xed, %xmm8, %xmm8     # xmm8 = xmm8[1,3,2,3]
   59a8e:      	punpckldq	%xmm8, %xmm7    # xmm7 = xmm7[0],xmm8[0],xmm7[1],xmm8[1]
   59a93:      	movdqa	%xmm6, %xmm8
   59a98:      	psubd	%xmm7, %xmm8
   59a9d:      	psrld	$0x1, %xmm8
   59aa3:      	paddd	%xmm7, %xmm8
   59aa8:      	psrld	$0xb, %xmm8
   59aae:      	pshufd	$0xf5, %xmm8, %xmm7     # xmm7 = xmm8[1,1,3,3]
   59ab4:      	pmuludq	%xmm1, %xmm8
   59ab9:      	pshufd	$0xe8, %xmm8, %xmm8     # xmm8 = xmm8[0,2,2,3]
   59abf:      	pmuludq	%xmm1, %xmm7
   59ac3:      	pshufd	$0xe8, %xmm7, %xmm7     # xmm7 = xmm7[0,2,2,3]
   59ac8:      	punpckldq	%xmm7, %xmm8    # xmm8 = xmm8[0],xmm7[0],xmm8[1],xmm7[1]
   59acd:      	psubd	%xmm8, %xmm6
   59ad2:      	movdqu	(%r14,%r10,2), %xmm7
   59ad8:      	movdqa	%xmm7, %xmm8
   59add:      	punpckhwd	%xmm2, %xmm8    # xmm8 = xmm8[4],xmm2[4],xmm8[5],xmm2[5],xmm8[6],xmm2[6],xmm8[7],xmm2[7]
   59ae2:      	punpcklwd	%xmm2, %xmm7    # xmm7 = xmm7[0],xmm2[0],xmm7[1],xmm2[1],xmm7[2],xmm2[2],xmm7[3],xmm2[3]
   59ae6:      	movdqa	%xmm7, %xmm9
   59aeb:      	psubd	%xmm6, %xmm9
   59af0:      	paddd	%xmm1, %xmm9
   59af5:      	movdqa	%xmm8, %xmm10
   59afa:      	psubd	%xmm5, %xmm10
   59aff:      	paddd	%xmm1, %xmm10
   59b04:      	movdqa	%xmm10, %xmm11
   59b09:      	pmuludq	%xmm0, %xmm11
   59b0e:      	pshufd	$0xed, %xmm11, %xmm11   # xmm11 = xmm11[1,3,2,3]
   59b14:      	pshufd	$0xf5, %xmm10, %xmm12   # xmm12 = xmm10[1,1,3,3]
   59b1a:      	pmuludq	%xmm0, %xmm12
   59b1f:      	pshufd	$0xed, %xmm12, %xmm12   # xmm12 = xmm12[1,3,2,3]
   59b25:      	punpckldq	%xmm12, %xmm11  # xmm11 = xmm11[0],xmm12[0],xmm11[1],xmm12[1]
   59b2a:      	movdqa	%xmm10, %xmm12
   59b2f:      	psubd	%xmm11, %xmm12
   59b34:      	psrld	$0x1, %xmm12
   59b3a:      	paddd	%xmm11, %xmm12
   59b3f:      	psrld	$0xb, %xmm12
   59b45:      	pshufd	$0xf5, %xmm12, %xmm11   # xmm11 = xmm12[1,1,3,3]
   59b4b:      	pmuludq	%xmm1, %xmm12
   59b50:      	pshufd	$0xe8, %xmm12, %xmm12   # xmm12 = xmm12[0,2,2,3]
   59b56:      	pmuludq	%xmm1, %xmm11
   59b5b:      	pshufd	$0xe8, %xmm11, %xmm11   # xmm11 = xmm11[0,2,2,3]
   59b61:      	punpckldq	%xmm11, %xmm12  # xmm12 = xmm12[0],xmm11[0],xmm12[1],xmm11[1]
   59b66:      	psubd	%xmm12, %xmm10
   59b6b:      	movdqa	%xmm9, %xmm11
   59b70:      	pmuludq	%xmm0, %xmm11
   59b75:      	pshufd	$0xed, %xmm11, %xmm11   # xmm11 = xmm11[1,3,2,3]
   59b7b:      	pshufd	$0xf5, %xmm9, %xmm12    # xmm12 = xmm9[1,1,3,3]
   59b81:      	pmuludq	%xmm0, %xmm12
   59b86:      	pshufd	$0xed, %xmm12, %xmm12   # xmm12 = xmm12[1,3,2,3]
   59b8c:      	punpckldq	%xmm12, %xmm11  # xmm11 = xmm11[0],xmm12[0],xmm11[1],xmm12[1]
   59b91:      	movdqa	%xmm9, %xmm12
   59b96:      	psubd	%xmm11, %xmm12
   59b9b:      	psrld	$0x1, %xmm12
   59ba1:      	paddd	%xmm11, %xmm12
   59ba6:      	psrld	$0xb, %xmm12
   59bac:      	pshufd	$0xf5, %xmm12, %xmm11   # xmm11 = xmm12[1,1,3,3]
   59bb2:      	pmuludq	%xmm1, %xmm12
   59bb7:      	pshufd	$0xe8, %xmm12, %xmm12   # xmm12 = xmm12[0,2,2,3]
   59bbd:      	pmuludq	%xmm1, %xmm11
   59bc2:      	pshufd	$0xe8, %xmm11, %xmm11   # xmm11 = xmm11[0,2,2,3]
   59bc8:      	punpckldq	%xmm11, %xmm12  # xmm12 = xmm12[0],xmm11[0],xmm12[1],xmm11[1]
   59bcd:      	psubd	%xmm12, %xmm9
   59bd2:      	packssdw	%xmm10, %xmm9
   59bd7:      	movdqu	%xmm9, (%rcx,%r10,2)
   59bdd:      	paddd	%xmm6, %xmm7
   59be1:      	paddd	%xmm5, %xmm8
   59be6:      	movdqa	%xmm8, %xmm5
   59beb:      	pmuludq	%xmm3, %xmm5
   59bef:      	pshufd	$0xed, %xmm5, %xmm5     # xmm5 = xmm5[1,3,2,3]
   59bf4:      	pshufd	$0xf5, %xmm8, %xmm6     # xmm6 = xmm8[1,1,3,3]
   59bfa:      	pmuludq	%xmm3, %xmm6
   59bfe:      	pshufd	$0xed, %xmm6, %xmm6     # xmm6 = xmm6[1,3,2,3]
   59c03:      	punpckldq	%xmm6, %xmm5    # xmm5 = xmm5[0],xmm6[0],xmm5[1],xmm6[1]
   59c07:      	pmaddwd	%xmm1, %xmm5
   59c0b:      	psubd	%xmm5, %xmm8
   59c10:      	movdqa	%xmm7, %xmm5
   59c14:      	pmuludq	%xmm3, %xmm5
   59c18:      	pshufd	$0xed, %xmm5, %xmm5     # xmm5 = xmm5[1,3,2,3]
   59c1d:      	pshufd	$0xf5, %xmm7, %xmm6     # xmm6 = xmm7[1,1,3,3]
   59c22:      	pmuludq	%xmm3, %xmm6
   59c26:      	pshufd	$0xed, %xmm6, %xmm6     # xmm6 = xmm6[1,3,2,3]
   59c2b:      	punpckldq	%xmm6, %xmm5    # xmm5 = xmm5[0],xmm6[0],xmm5[1],xmm6[1]
   59c2f:      	pmaddwd	%xmm1, %xmm5
   59c33:      	psubd	%xmm5, %xmm7
   59c37:      	packssdw	%xmm8, %xmm7
   59c3c:      	movdqu	%xmm7, (%r14,%r10,2)
   59c42:      	addq	$0x8, %r10
   59c46:      	cmpq	%r10, %rdi
   59c49:      	jne	0x599f0 <<toyos_crypto::mlkem::Poly>::ntt+0x290>
   59c4f:      	movq	-0x40(%rbp), %rdi
   59c53:      	leaq	(%rsi,%rsi), %r11
   59c57:      	addq	%r11, %rdi
   59c5a:      	movq	%rdi, -0x40(%rbp)
   59c5e:      	decq	%r15
   59c61:      	nopw	%cs:(%rax,%rax)
   59c70:      	leaq	(%rsi,%r9), %rdi
   59c74:      	cmpq	$0x100, %rdi            # imm = 0x100
   59c7b:      	jae	0x59d55 <<toyos_crypto::mlkem::Poly>::ntt+0x5f5>
   59c81:      	movzwl	(%r13,%r9,2), %edx
   59c87:      	imull	%r12d, %edx
   59c8b:      	imulq	$0x3afb7681, %rdx, %rdi # imm = 0x3AFB7681
   59c92:      	shrq	$0x20, %rdi
   59c96:      	movl	%edx, %r8d
   59c99:      	subl	%edi, %r8d
   59c9c:      	shrl	%r8d
   59c9f:      	addl	%edi, %r8d
   59ca2:      	shrl	$0xb, %r8d
   59ca6:      	imull	$0xd01, %r8d, %edi      # imm = 0xD01
   59cad:      	subl	%edi, %edx
   59caf:      	movzwl	(%rbx,%r9,2), %edi
   59cb4:      	movl	%edi, %r8d
   59cb7:      	subl	%edx, %r8d
   59cba:      	addl	$0xd01, %r8d            # imm = 0xD01
   59cc1:      	imulq	$0x13afb8, %r8, %r10    # imm = 0x13AFB8
   59cc8:      	shrq	$0x20, %r10
   59ccc:      	imull	$0xd01, %r10d, %r10d    # imm = 0xD01
   59cd3:      	subl	%r10d, %r8d
   59cd6:      	movw	%r8w, (%r13,%r9,2)
   59cdc:      	addl	%edi, %edx
   59cde:      	imulq	$0x13afb8, %rdx, %rdi   # imm = 0x13AFB8
   59ce5:      	shrq	$0x20, %rdi
   59ce9:      	imull	$0xd01, %edi, %edi      # imm = 0xD01
   59cef:      	subl	%edi, %edx
   59cf1:      	movw	%dx, (%rbx,%r9,2)
   59cf6:      	incq	%r9
   59cf9:      	cmpq	%r9, %rax
   59cfc:      	jne	0x59c70 <<toyos_crypto::mlkem::Poly>::ntt+0x510>
   59d02:      	addq	%r11, %rax
   59d05:      	movq	-0x48(%rbp), %r10
   59d09:      	incq	%r10
   59d0c:      	movq	-0x78(%rbp), %rdi
   59d10:      	subq	%r11, %rdi
   59d13:      	leaq	(,%rsi,4), %rdx
   59d1b:      	addq	%rdx, %rcx
   59d1e:      	addq	%rdx, %r14
   59d21:      	testq	%r15, %r15
   59d24:      	jne	0x59830 <<toyos_crypto::mlkem::Poly>::ntt+0xd0>
   59d2a:      	jmp	0x597b0 <<toyos_crypto::mlkem::Poly>::ntt+0x50>
   59d2f:      	movl	$0x200, %edx            # imm = 0x200
   59d34:      	movq	-0x50(%rbp), %r14
   59d38:      	movq	%r14, %rdi
   59d3b:      	movq	%rbx, %rsi
   59d3e:      	callq	0xc5af0 <memcpy>
   59d43:      	movq	%r14, %rax
   59d46:      	addq	$0x58, %rsp
   59d4a:      	popq	%rbx
   59d4b:      	popq	%r12
   59d4d:      	popq	%r13
   59d4f:      	popq	%r14
   59d51:      	popq	%r15
   59d53:      	popq	%rbp
   59d54:      	retq
   59d55:      	leaq	0x6dc84(%rip), %rdx     # 0xc79e0 <anon.ffc1aded08de8b2a105054a61a13d06b.1.llvm.10786651499350334936+0x48>
   59d5c:      	movl	$0x100, %esi            # imm = 0x100
   59d61:      	callq	0xbf34d <core::panicking::panic_bounds_check>
   59d66:      	jmp	0x59d74 <<toyos_crypto::mlkem::Poly>::ntt+0x614>
   59d68:      	leaq	0x6dc59(%rip), %rdi     # 0xc79c8 <anon.ffc1aded08de8b2a105054a61a13d06b.1.llvm.10786651499350334936+0x30>
   59d6f:      	callq	0xc00f0 <core::panicking::panic_const::panic_const_add_overflow>
   59d74:      	ud2
   59d76:      	xorl	%ecx, %ecx
   59d78:      	nopl	(%rax,%rax)
   59d80:      	movw	$0x0, (%rbx,%rcx)
   59d86:      	movw	$0x0, 0x2(%rbx,%rcx)
   59d8d:      	movw	$0x0, 0x4(%rbx,%rcx)
   59d94:      	movw	$0x0, 0x6(%rbx,%rcx)
   59d9b:      	movw	$0x0, 0x8(%rbx,%rcx)
   59da2:      	movw	$0x0, 0xa(%rbx,%rcx)
   59da9:      	movw	$0x0, 0xc(%rbx,%rcx)
   59db0:      	movw	$0x0, 0xe(%rbx,%rcx)
   59db7:      	addq	$0x10, %rcx
   59dbb:      	cmpq	$0x200, %rcx            # imm = 0x200
   59dc2:      	jne	0x59d80 <<toyos_crypto::mlkem::Poly>::ntt+0x620>
   59dc4:      	movq	%rax, %rdi
   59dc7:      	callq	0xb9f20 <_Unwind_Resume>
   59dcc:      	int3
   59dcd:      	int3
   59dce:      	int3
   59dcf:      	int3

0000000000059dd0 <<toyos_crypto::mlkem::Poly>::plus>:
   59dd0:      	pushq	%rbp
   59dd1:      	movq	%rsp, %rbp
   59dd4:      	pushq	%rbx
   59dd5:      	subq	$0x208, %rsp            # imm = 0x208
   59ddc:      	movq	%rdi, %rbx
   59ddf:      	xorl	%eax, %eax
   59de1:      	pxor	%xmm0, %xmm0
   59de5:      	movdqa	-0x4b27d(%rip), %xmm1   # 0xeb70 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x2f0>
   59ded:      	movdqa	-0x4b195(%rip), %xmm2   # 0xec60 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x3e0>
   59df5:      	nopw	%cs:(%rax,%rax)
   59e00:      	movdqu	(%rsi,%rax,2), %xmm5
   59e05:      	movdqu	(%rdx,%rax,2), %xmm3
   59e0a:      	movdqa	%xmm5, %xmm6
   59e0e:      	punpckhwd	%xmm0, %xmm6    # xmm6 = xmm6[4],xmm0[4],xmm6[5],xmm0[5],xmm6[6],xmm0[6],xmm6[7],xmm0[7]
   59e12:      	punpcklwd	%xmm0, %xmm5    # xmm5 = xmm5[0],xmm0[0],xmm5[1],xmm0[1],xmm5[2],xmm0[2],xmm5[3],xmm0[3]
   59e16:      	movdqa	%xmm3, %xmm4
   59e1a:      	punpckhwd	%xmm0, %xmm4    # xmm4 = xmm4[4],xmm0[4],xmm4[5],xmm0[5],xmm4[6],xmm0[6],xmm4[7],xmm0[7]
   59e1e:      	paddd	%xmm6, %xmm4
   59e22:      	punpcklwd	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3]
   59e26:      	paddd	%xmm5, %xmm3
   59e2a:      	movdqa	%xmm4, %xmm5
   59e2e:      	pmuludq	%xmm1, %xmm5
   59e32:      	pshufd	$0xed, %xmm5, %xmm5     # xmm5 = xmm5[1,3,2,3]
   59e37:      	pshufd	$0xf5, %xmm4, %xmm6     # xmm6 = xmm4[1,1,3,3]
   59e3c:      	pmuludq	%xmm1, %xmm6
   59e40:      	pshufd	$0xed, %xmm6, %xmm6     # xmm6 = xmm6[1,3,2,3]
   59e45:      	punpckldq	%xmm6, %xmm5    # xmm5 = xmm5[0],xmm6[0],xmm5[1],xmm6[1]
   59e49:      	pmaddwd	%xmm2, %xmm5
   59e4d:      	psubd	%xmm5, %xmm4
   59e51:      	movdqa	%xmm3, %xmm5
   59e55:      	pmuludq	%xmm1, %xmm5
   59e59:      	pshufd	$0xed, %xmm5, %xmm5     # xmm5 = xmm5[1,3,2,3]
   59e5e:      	pshufd	$0xf5, %xmm3, %xmm6     # xmm6 = xmm3[1,1,3,3]
   59e63:      	pmuludq	%xmm1, %xmm6
   59e67:      	pshufd	$0xed, %xmm6, %xmm6     # xmm6 = xmm6[1,3,2,3]
   59e6c:      	punpckldq	%xmm6, %xmm5    # xmm5 = xmm5[0],xmm6[0],xmm5[1],xmm6[1]
   59e70:      	pmaddwd	%xmm2, %xmm5
   59e74:      	psubd	%xmm5, %xmm3
   59e78:      	packssdw	%xmm4, %xmm3
   59e7c:      	movdqu	%xmm3, -0x208(%rbp,%rax,2)
   59e85:      	addq	$0x8, %rax
   59e89:      	cmpq	$0x100, %rax            # imm = 0x100
   59e8f:      	jne	0x59e00 <<toyos_crypto::mlkem::Poly>::plus+0x30>
   59e95:      	leaq	-0x208(%rbp), %rsi
   59e9c:      	movl	$0x200, %edx            # imm = 0x200
   59ea1:      	movq	%rbx, %rdi
   59ea4:      	callq	0xc5af0 <memcpy>
   59ea9:      	movq	%rbx, %rax
   59eac:      	addq	$0x208, %rsp            # imm = 0x208
   59eb3:      	popq	%rbx
   59eb4:      	popq	%rbp
   59eb5:      	retq
   59eb6:      	int3
   59eb7:      	int3
   59eb8:      	int3
   59eb9:      	int3
   59eba:      	int3
   59ebb:      	int3
   59ebc:      	int3
   59ebd:      	int3
   59ebe:      	int3
   59ebf:      	int3

0000000000059ec0 <<toyos_crypto::mlkem::Poly>::encode>:
   59ec0:      	pushq	%rbp
   59ec1:      	movq	%rsp, %rbp
   59ec4:      	pushq	%r15
   59ec6:      	pushq	%r14
   59ec8:      	pushq	%r13
   59eca:      	pushq	%r12
   59ecc:      	pushq	%rbx
   59ecd:      	subq	$0x18, %rsp
   59ed1:      	movq	%rcx, -0x30(%rbp)
   59ed5:      	movq	%rsi, %rax
   59ed8:      	shrq	$0x3b, %rax
   59edc:      	jne	0x59fe9 <<toyos_crypto::mlkem::Poly>::encode+0x129>
   59ee2:      	movq	%rcx, %rbx
   59ee5:      	movq	%rsi, %r15
   59ee8:      	movq	%rsi, %rax
   59eeb:      	shlq	$0x5, %rax
   59eef:      	movq	%rax, -0x38(%rbp)
   59ef3:      	cmpq	%rax, %rcx
   59ef6:      	jne	0x59fc5 <<toyos_crypto::mlkem::Poly>::encode+0x105>
   59efc:      	movq	%rdx, %r14
   59eff:      	movq	%rdi, %r12
   59f02:      	xorl	%r13d, %r13d
   59f05:      	movq	%rdx, %rdi
   59f08:      	movq	%rbx, %rsi
   59f0b:      	xorl	%edx, %edx
   59f0d:      	callq	0xc4240 <<[i8] as core::slice::specialize::SpecFill<i8>>::spec_fill>
   59f12:      	xorl	%esi, %esi
   59f14:      	jmp	0x59f2f <<toyos_crypto::mlkem::Poly>::encode+0x6f>
   59f16:      	nopw	%cs:(%rax,%rax)
   59f20:      	incq	%r13
   59f23:      	addq	%r15, %rsi
   59f26:      	cmpq	$0x100, %r13            # imm = 0x100
   59f2d:      	je	0x59f8f <<toyos_crypto::mlkem::Poly>::encode+0xcf>
   59f2f:      	testq	%r15, %r15
   59f32:      	je	0x59f20 <<toyos_crypto::mlkem::Poly>::encode+0x60>
   59f34:      	movq	%r13, %rax
   59f37:      	mulq	%r15
   59f3a:      	jo	0x59fdd <<toyos_crypto::mlkem::Poly>::encode+0x11d>
   59f40:      	xorl	%ecx, %ecx
   59f42:      	nopw	%cs:(%rax,%rax)
   59f50:      	leaq	(%rsi,%rcx), %rdi
   59f54:      	cmpq	%rax, %rdi
   59f57:      	jb	0x59faa <<toyos_crypto::mlkem::Poly>::encode+0xea>
   59f59:      	cmpq	$0x10, %rcx
   59f5d:      	je	0x59f9e <<toyos_crypto::mlkem::Poly>::encode+0xde>
   59f5f:      	shrq	$0x3, %rdi
   59f63:      	cmpq	%rbx, %rdi
   59f66:      	jae	0x59fb6 <<toyos_crypto::mlkem::Poly>::encode+0xf6>
   59f68:      	leaq	0x1(%rcx), %rdx
   59f6c:      	movzwl	(%r12,%r13,2), %r8d
   59f71:      	btl	%ecx, %r8d
   59f75:      	setb	%r8b
   59f79:      	addl	%esi, %ecx
   59f7b:      	andb	$0x7, %cl
   59f7e:      	shlb	%cl, %r8b
   59f81:      	orb	%r8b, (%r14,%rdi)
   59f85:      	movq	%rdx, %rcx
   59f88:      	cmpq	%rdx, %r15
   59f8b:      	jne	0x59f50 <<toyos_crypto::mlkem::Poly>::encode+0x90>
   59f8d:      	jmp	0x59f20 <<toyos_crypto::mlkem::Poly>::encode+0x60>
   59f8f:      	addq	$0x18, %rsp
   59f93:      	popq	%rbx
   59f94:      	popq	%r12
   59f96:      	popq	%r13
   59f98:      	popq	%r14
   59f9a:      	popq	%r15
   59f9c:      	popq	%rbp
   59f9d:      	retq
   59f9e:      	leaq	0x6da9b(%rip), %rdi     # 0xc7a40 <anon.ffc1aded08de8b2a105054a61a13d06b.1.llvm.10786651499350334936+0xa8>
   59fa5:      	callq	0xc0130 <core::panicking::panic_const::panic_const_shr_overflow>
   59faa:      	leaq	0x6da77(%rip), %rdi     # 0xc7a28 <anon.ffc1aded08de8b2a105054a61a13d06b.1.llvm.10786651499350334936+0x90>
   59fb1:      	callq	0xc00f0 <core::panicking::panic_const::panic_const_add_overflow>
   59fb6:      	leaq	0x6da9b(%rip), %rdx     # 0xc7a58 <anon.ffc1aded08de8b2a105054a61a13d06b.1.llvm.10786651499350334936+0xc0>
   59fbd:      	movq	%rbx, %rsi
   59fc0:      	callq	0xbf34d <core::panicking::panic_bounds_check>
   59fc5:      	leaq	0x6da44(%rip), %r9      # 0xc7a10 <anon.ffc1aded08de8b2a105054a61a13d06b.1.llvm.10786651499350334936+0x78>
   59fcc:      	leaq	-0x30(%rbp), %rsi
   59fd0:      	leaq	-0x38(%rbp), %rdx
   59fd4:      	xorl	%edi, %edi
   59fd6:      	xorl	%ecx, %ecx
   59fd8:      	callq	0xbbf07 <core::panicking::assert_failed::<usize, usize>>
   59fdd:      	leaq	0x6da44(%rip), %rdi     # 0xc7a28 <anon.ffc1aded08de8b2a105054a61a13d06b.1.llvm.10786651499350334936+0x90>
   59fe4:      	callq	0xc0110 <core::panicking::panic_const::panic_const_mul_overflow>
   59fe9:      	leaq	0x6da08(%rip), %rdi     # 0xc79f8 <anon.ffc1aded08de8b2a105054a61a13d06b.1.llvm.10786651499350334936+0x60>
   59ff0:      	callq	0xc0110 <core::panicking::panic_const::panic_const_mul_overflow>
   59ff5:      	int3
   59ff6:      	int3
   59ff7:      	int3
   59ff8:      	int3
   59ff9:      	int3
   59ffa:      	int3
   59ffb:      	int3
   59ffc:      	int3
   59ffd:      	int3
   59ffe:      	int3
   59fff:      	int3

000000000005a000 <<toyos_crypto::mlkem::Poly>::inverse>:
   5a000:      	pushq	%rbp
   5a001:      	movq	%rsp, %rbp
   5a004:      	pushq	%r15
   5a006:      	pushq	%r14
   5a008:      	pushq	%r13
   5a00a:      	pushq	%r12
   5a00c:      	pushq	%rbx
   5a00d:      	subq	$0x18, %rsp
   5a011:      	movq	%rsi, %rbx
   5a014:      	movq	%rdi, -0x38(%rbp)
   5a018:      	movl	$0x2, %edx
   5a01d:      	movl	$0x7f, %eax
   5a022:      	movl	$0x9d7dbb41, %esi       # imm = 0x9D7DBB41
   5a027:      	jmp	0x5a03a <<toyos_crypto::mlkem::Poly>::inverse+0x3a>
   5a029:      	nopl	(%rax)
   5a030:      	cmpq	$0x41, %r8
   5a034:      	jae	0x5a20c <<toyos_crypto::mlkem::Poly>::inverse+0x20c>
   5a03a:      	movq	%rdx, %r8
   5a03d:      	addq	%rdx, %rdx
   5a040:      	tzcntl	%edx, %ecx
   5a044:      	movl	$0x100, %edi            # imm = 0x100
   5a049:      	shrl	%cl, %edi
   5a04b:      	leal	-0x1(%rdx), %ecx
   5a04e:      	btl	$0x8, %ecx
   5a052:      	adcq	$0x0, %rdi
   5a056:      	movq	%rdi, -0x30(%rbp)
   5a05a:      	je	0x5a030 <<toyos_crypto::mlkem::Poly>::inverse+0x30>
   5a05c:      	leaq	(%rbx,%rdx), %rcx
   5a060:      	movq	%rbx, %r11
   5a063:      	movq	%r8, %r15
   5a066:      	xorl	%r12d, %r12d
   5a069:      	nopl	(%rax)
   5a070:      	movl	%eax, %edi
   5a072:      	rolb	$0x4, %dil
   5a076:      	movl	%edi, %r10d
   5a079:      	andb	$0x33, %r10b
   5a07d:      	shlb	$0x2, %r10b
   5a081:      	shrb	$0x2, %dil
   5a085:      	andb	$0x33, %dil
   5a089:      	orb	%r10b, %dil
   5a08c:      	movl	%edi, %r10d
   5a08f:      	andb	$0x55, %r10b
   5a093:      	addb	%r10b, %r10b
   5a096:      	shrb	%dil
   5a099:      	andb	$0x54, %dil
   5a09d:      	orb	%r10b, %dil
   5a0a0:      	shrb	%dil
   5a0a3:      	je	0x5a120 <<toyos_crypto::mlkem::Poly>::inverse+0x120>
   5a0a5:      	movzbl	%dil, %r14d
   5a0a9:      	movw	$0x1, %di
   5a0ad:      	movw	$0x11, %r13w
   5a0b2:      	jmp	0x5a0dd <<toyos_crypto::mlkem::Poly>::inverse+0xdd>
   5a0b4:      	nopw	%cs:(%rax,%rax)
   5a0c0:      	imull	%r13d, %r13d
   5a0c4:      	movq	%r13, %rdx
   5a0c7:      	imulq	%rsi, %rdx
   5a0cb:      	shrq	$0x2b, %rdx
   5a0cf:      	imull	$0xd01, %edx, %edx      # imm = 0xD01
   5a0d5:      	subl	%edx, %r13d
   5a0d8:      	shrl	%r14d
   5a0db:      	je	0x5a110 <<toyos_crypto::mlkem::Poly>::inverse+0x110>
   5a0dd:      	movzwl	%r13w, %r13d
   5a0e1:      	testb	$0x1, %r14b
   5a0e5:      	je	0x5a0c0 <<toyos_crypto::mlkem::Poly>::inverse+0xc0>
   5a0e7:      	movzwl	%di, %edi
   5a0ea:      	imull	%r13d, %edi
   5a0ee:      	imulq	$0x3afb7681, %rdi, %r10 # imm = 0x3AFB7681
   5a0f5:      	shrq	$0x20, %r10
   5a0f9:      	movl	%edi, %edx
   5a0fb:      	subl	%r10d, %edx
   5a0fe:      	shrl	%edx
   5a100:      	addl	%r10d, %edx
   5a103:      	shrl	$0xb, %edx
   5a106:      	imull	$0xd01, %edx, %edx      # imm = 0xD01
   5a10c:      	subl	%edx, %edi
   5a10e:      	jmp	0x5a0c0 <<toyos_crypto::mlkem::Poly>::inverse+0xc0>
   5a110:      	movzwl	%di, %r14d
   5a114:      	subq	$0x1, %rax
   5a118:      	jae	0x5a130 <<toyos_crypto::mlkem::Poly>::inverse+0x130>
   5a11a:      	jmp	0x5a32a <<toyos_crypto::mlkem::Poly>::inverse+0x32a>
   5a11f:      	nop
   5a120:      	movl	$0x1, %r14d
   5a126:      	subq	$0x1, %rax
   5a12a:      	jb	0x5a32a <<toyos_crypto::mlkem::Poly>::inverse+0x32a>
   5a130:      	leaq	(%r8,%r8), %rdx
   5a134:      	addq	%r12, %rdx
   5a137:      	movq	%rdx, -0x40(%rbp)
   5a13b:      	decq	-0x30(%rbp)
   5a13f:      	xorl	%r10d, %r10d
   5a142:      	nopw	%cs:(%rax,%rax)
   5a150:      	leaq	(%r12,%r10), %rdi
   5a154:      	cmpq	$0xff, %rdi
   5a15b:      	ja	0x5a317 <<toyos_crypto::mlkem::Poly>::inverse+0x317>
   5a161:      	leaq	(%r15,%r10), %rdi
   5a165:      	cmpq	$0x100, %rdi            # imm = 0x100
   5a16c:      	jae	0x5a30e <<toyos_crypto::mlkem::Poly>::inverse+0x30e>
   5a172:      	movzwl	(%r11,%r10,2), %edx
   5a177:      	movzwl	(%rcx,%r10,2), %edi
   5a17c:      	leal	(%rdi,%rdx), %r9d
   5a180:      	imulq	$0x13afb8, %r9, %r13    # imm = 0x13AFB8
   5a187:      	shrq	$0x20, %r13
   5a18b:      	imull	$0xd01, %r13d, %r13d    # imm = 0xD01
   5a192:      	subl	%r13d, %r9d
   5a195:      	movw	%r9w, (%r11,%r10,2)
   5a19a:      	addl	$0xd01, %edi            # imm = 0xD01
   5a1a0:      	subl	%edx, %edi
   5a1a2:      	jb	0x5a300 <<toyos_crypto::mlkem::Poly>::inverse+0x300>
   5a1a8:      	imulq	$0x13afb8, %rdi, %rdx   # imm = 0x13AFB8
   5a1af:      	shrq	$0x20, %rdx
   5a1b3:      	imull	$0xd01, %edx, %edx      # imm = 0xD01
   5a1b9:      	subl	%edx, %edi
   5a1bb:      	imull	%r14d, %edi
   5a1bf:      	imulq	$0x13afb769, %rdi, %rdx # imm = 0x13AFB769
   5a1c6:      	shrq	$0x28, %rdx
   5a1ca:      	imull	$0xd01, %edx, %edx      # imm = 0xD01
   5a1d0:      	subl	%edx, %edi
   5a1d2:      	movw	%di, (%rcx,%r10,2)
   5a1d7:      	incq	%r10
   5a1da:      	cmpq	%r10, %r8
   5a1dd:      	jne	0x5a150 <<toyos_crypto::mlkem::Poly>::inverse+0x150>
   5a1e3:      	leaq	(%r8,%r8), %rdx
   5a1e7:      	addq	%rdx, %r15
   5a1ea:      	leaq	(,%r8,4), %rdi
   5a1f2:      	addq	%rdi, %rcx
   5a1f5:      	addq	%rdi, %r11
   5a1f8:      	movq	-0x40(%rbp), %r12
   5a1fc:      	cmpq	$0x0, -0x30(%rbp)
   5a201:      	jne	0x5a070 <<toyos_crypto::mlkem::Poly>::inverse+0x70>
   5a207:      	jmp	0x5a030 <<toyos_crypto::mlkem::Poly>::inverse+0x30>
   5a20c:      	xorl	%eax, %eax
   5a20e:      	movdqa	-0x4b5a6(%rip), %xmm0   # 0xec70 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x3f0>
   5a216:      	movdqa	-0x4b60e(%rip), %xmm1   # 0xec10 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x390>
   5a21e:      	movdqa	-0x4b5c6(%rip), %xmm2   # 0xec60 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x3e0>
   5a226:      	nopw	%cs:(%rax,%rax)
   5a230:      	movdqu	(%rbx,%rax,2), %xmm3
   5a235:      	movdqa	%xmm3, %xmm5
   5a239:      	pmulhuw	%xmm0, %xmm5
   5a23d:      	pmullw	%xmm0, %xmm3
   5a241:      	movdqa	%xmm3, %xmm4
   5a245:      	punpcklwd	%xmm5, %xmm4    # xmm4 = xmm4[0],xmm5[0],xmm4[1],xmm5[1],xmm4[2],xmm5[2],xmm4[3],xmm5[3]
   5a249:      	punpckhwd	%xmm5, %xmm3    # xmm3 = xmm3[4],xmm5[4],xmm3[5],xmm5[5],xmm3[6],xmm5[6],xmm3[7],xmm5[7]
   5a24d:      	pshufd	$0xf5, %xmm3, %xmm5     # xmm5 = xmm3[1,1,3,3]
   5a252:      	pmuludq	%xmm1, %xmm5
   5a256:      	psrlq	$0x28, %xmm5
   5a25b:      	pmuludq	%xmm2, %xmm5
   5a25f:      	pshufd	$0xe8, %xmm5, %xmm5     # xmm5 = xmm5[0,2,2,3]
   5a264:      	movdqa	%xmm3, %xmm6
   5a268:      	pmuludq	%xmm1, %xmm6
   5a26c:      	pshufd	$0xf5, %xmm6, %xmm6     # xmm6 = xmm6[1,1,3,3]
   5a271:      	psrld	$0x8, %xmm6
   5a276:      	pmuludq	%xmm2, %xmm6
   5a27a:      	pshufd	$0xe8, %xmm6, %xmm6     # xmm6 = xmm6[0,2,2,3]
   5a27f:      	punpckldq	%xmm5, %xmm6    # xmm6 = xmm6[0],xmm5[0],xmm6[1],xmm5[1]
   5a283:      	psubd	%xmm6, %xmm3
   5a287:      	pshufd	$0xf5, %xmm4, %xmm5     # xmm5 = xmm4[1,1,3,3]
   5a28c:      	pmuludq	%xmm1, %xmm5
   5a290:      	psrlq	$0x28, %xmm5
   5a295:      	pmuludq	%xmm2, %xmm5
   5a299:      	pshufd	$0xe8, %xmm5, %xmm5     # xmm5 = xmm5[0,2,2,3]
   5a29e:      	movdqa	%xmm4, %xmm6
   5a2a2:      	pmuludq	%xmm1, %xmm6
   5a2a6:      	pshufd	$0xf5, %xmm6, %xmm6     # xmm6 = xmm6[1,1,3,3]
   5a2ab:      	psrld	$0x8, %xmm6
   5a2b0:      	pmuludq	%xmm2, %xmm6
   5a2b4:      	pshufd	$0xe8, %xmm6, %xmm6     # xmm6 = xmm6[0,2,2,3]
   5a2b9:      	punpckldq	%xmm5, %xmm6    # xmm6 = xmm6[0],xmm5[0],xmm6[1],xmm5[1]
   5a2bd:      	psubd	%xmm6, %xmm4
   5a2c1:      	packssdw	%xmm3, %xmm4
   5a2c5:      	movdqu	%xmm4, (%rbx,%rax,2)
   5a2ca:      	addq	$0x8, %rax
   5a2ce:      	cmpq	$0x100, %rax            # imm = 0x100
   5a2d4:      	jne	0x5a230 <<toyos_crypto::mlkem::Poly>::inverse+0x230>
   5a2da:      	movl	$0x200, %edx            # imm = 0x200
   5a2df:      	movq	-0x38(%rbp), %r14
   5a2e3:      	movq	%r14, %rdi
   5a2e6:      	movq	%rbx, %rsi
   5a2e9:      	callq	0xc5af0 <memcpy>
   5a2ee:      	movq	%r14, %rax
   5a2f1:      	addq	$0x18, %rsp
   5a2f5:      	popq	%rbx
   5a2f6:      	popq	%r12
   5a2f8:      	popq	%r13
   5a2fa:      	popq	%r14
   5a2fc:      	popq	%r15
   5a2fe:      	popq	%rbp
   5a2ff:      	retq
   5a300:      	leaq	0x6d7b1(%rip), %rdi     # 0xc7ab8 <anon.ffc1aded08de8b2a105054a61a13d06b.1.llvm.10786651499350334936+0x120>
   5a307:      	callq	0xc0150 <core::panicking::panic_const::panic_const_sub_overflow>
   5a30c:      	jmp	0x5a336 <<toyos_crypto::mlkem::Poly>::inverse+0x336>
   5a30e:      	leaq	0x6d78b(%rip), %rdx     # 0xc7aa0 <anon.ffc1aded08de8b2a105054a61a13d06b.1.llvm.10786651499350334936+0x108>
   5a315:      	jmp	0x5a31e <<toyos_crypto::mlkem::Poly>::inverse+0x31e>
   5a317:      	leaq	0x6d76a(%rip), %rdx     # 0xc7a88 <anon.ffc1aded08de8b2a105054a61a13d06b.1.llvm.10786651499350334936+0xf0>
   5a31e:      	movl	$0x100, %esi            # imm = 0x100
   5a323:      	callq	0xbf34d <core::panicking::panic_bounds_check>
   5a328:      	jmp	0x5a336 <<toyos_crypto::mlkem::Poly>::inverse+0x336>
   5a32a:      	leaq	0x6d73f(%rip), %rdi     # 0xc7a70 <anon.ffc1aded08de8b2a105054a61a13d06b.1.llvm.10786651499350334936+0xd8>
   5a331:      	callq	0xc0150 <core::panicking::panic_const::panic_const_sub_overflow>
   5a336:      	ud2
   5a338:      	xorl	%ecx, %ecx
   5a33a:      	nopw	(%rax,%rax)
   5a340:      	movw	$0x0, (%rbx,%rcx)
   5a346:      	movw	$0x0, 0x2(%rbx,%rcx)
   5a34d:      	movw	$0x0, 0x4(%rbx,%rcx)
   5a354:      	movw	$0x0, 0x6(%rbx,%rcx)
   5a35b:      	movw	$0x0, 0x8(%rbx,%rcx)
   5a362:      	movw	$0x0, 0xa(%rbx,%rcx)
   5a369:      	movw	$0x0, 0xc(%rbx,%rcx)
   5a370:      	movw	$0x0, 0xe(%rbx,%rcx)
   5a377:      	addq	$0x10, %rcx
   5a37b:      	cmpq	$0x200, %rcx            # imm = 0x200
   5a382:      	jne	0x5a340 <<toyos_crypto::mlkem::Poly>::inverse+0x340>
   5a384:      	movq	%rax, %rdi
   5a387:      	callq	0xb9f20 <_Unwind_Resume>
   5a38c:      	int3
   5a38d:      	int3
   5a38e:      	int3
   5a38f:      	int3

000000000005a390 <<toyos_crypto::mlkem::Poly>::product>:
   5a390:      	pushq	%rbp
   5a391:      	movq	%rsp, %rbp
   5a394:      	pushq	%r15
   5a396:      	pushq	%r14
   5a398:      	pushq	%r13
   5a39a:      	pushq	%r12
   5a39c:      	pushq	%rbx
   5a39d:      	subq	$0x208, %rsp            # imm = 0x208
   5a3a4:      	movq	%rdx, %r14
   5a3a7:      	movq	%rsi, %r15
   5a3aa:      	movq	%rdi, %rbx
   5a3ad:      	leaq	-0x228(%rbp), %rdi
   5a3b4:      	xorl	%r12d, %r12d
   5a3b7:      	movl	$0x200, %edx            # imm = 0x200
   5a3bc:      	xorl	%esi, %esi
   5a3be:      	callq	0xc6240 <memset>
   5a3c3:      	movl	$0x9d7dbb41, %eax       # imm = 0x9D7DBB41
   5a3c8:      	jmp	0x5a4e4 <<toyos_crypto::mlkem::Poly>::product+0x154>
   5a3cd:      	nopl	(%rax)
   5a3d0:      	movzwl	(%r15,%r12,4), %edi
   5a3d5:      	movzwl	(%r14,%r12,4), %edx
   5a3da:      	movl	%edx, %r9d
   5a3dd:      	imull	%edi, %r9d
   5a3e1:      	imulq	$0x3afb7681, %r9, %rsi  # imm = 0x3AFB7681
   5a3e8:      	shrq	$0x20, %rsi
   5a3ec:      	movl	%r9d, %r8d
   5a3ef:      	subl	%esi, %r8d
   5a3f2:      	shrl	%r8d
   5a3f5:      	addl	%esi, %r8d
   5a3f8:      	shrl	$0xb, %r8d
   5a3fc:      	imull	$0xd01, %r8d, %esi      # imm = 0xD01
   5a403:      	subl	%esi, %r9d
   5a406:      	movzwl	0x2(%r15,%r12,4), %r8d
   5a40c:      	movzwl	0x2(%r14,%r12,4), %esi
   5a412:      	movl	%esi, %r10d
   5a415:      	imull	%r8d, %r10d
   5a419:      	imulq	$0x3afb7681, %r10, %r11 # imm = 0x3AFB7681
   5a420:      	shrq	$0x20, %r11
   5a424:      	movl	%r10d, %r13d
   5a427:      	subl	%r11d, %r13d
   5a42a:      	shrl	%r13d
   5a42d:      	addl	%r11d, %r13d
   5a430:      	shrl	$0xb, %r13d
   5a434:      	imull	$0xd01, %r13d, %r11d    # imm = 0xD01
   5a43b:      	subl	%r11d, %r10d
   5a43e:      	movzwl	%cx, %ecx
   5a441:      	imull	%r10d, %ecx
   5a445:      	imulq	$0x13afb769, %rcx, %r10 # imm = 0x13AFB769
   5a44c:      	shrq	$0x28, %r10
   5a450:      	imull	$0xd01, %r10d, %r10d    # imm = 0xD01
   5a457:      	subl	%r10d, %ecx
   5a45a:      	addl	%r9d, %ecx
   5a45d:      	leal	-0xd01(%rcx), %r9d
   5a464:      	cmpl	$0xd01, %ecx            # imm = 0xD01
   5a46a:      	cmovbl	%ecx, %r9d
   5a46e:      	movw	%r9w, -0x228(%rbp,%r12,4)
   5a477:      	imull	%edi, %esi
   5a47a:      	imulq	$0x3afb7681, %rsi, %rcx # imm = 0x3AFB7681
   5a481:      	shrq	$0x20, %rcx
   5a485:      	movl	%esi, %edi
   5a487:      	subl	%ecx, %edi
   5a489:      	shrl	%edi
   5a48b:      	addl	%ecx, %edi
   5a48d:      	shrl	$0xb, %edi
   5a490:      	imull	$0xd01, %edi, %ecx      # imm = 0xD01
   5a496:      	subl	%ecx, %esi
   5a498:      	imull	%r8d, %edx
   5a49c:      	imulq	$0x3afb7681, %rdx, %rcx # imm = 0x3AFB7681
   5a4a3:      	shrq	$0x20, %rcx
   5a4a7:      	movl	%edx, %edi
   5a4a9:      	subl	%ecx, %edi
   5a4ab:      	shrl	%edi
   5a4ad:      	addl	%ecx, %edi
   5a4af:      	shrl	$0xb, %edi
   5a4b2:      	imull	$0xd01, %edi, %ecx      # imm = 0xD01
   5a4b8:      	subl	%ecx, %edx
   5a4ba:      	addl	%esi, %edx
   5a4bc:      	leal	-0xd01(%rdx), %ecx
   5a4c2:      	cmpl	$0xd01, %edx            # imm = 0xD01
   5a4c8:      	cmovbl	%edx, %ecx
   5a4cb:      	movw	%cx, -0x226(%rbp,%r12,4)
   5a4d4:      	incq	%r12
   5a4d7:      	cmpq	$0x80, %r12
   5a4de:      	je	0x5a572 <<toyos_crypto::mlkem::Poly>::product+0x1e2>
   5a4e4:      	movl	%r12d, %ecx
   5a4e7:      	rolb	$0x4, %cl
   5a4ea:      	orb	$0x8, %cl
   5a4ed:      	movl	%ecx, %edx
   5a4ef:      	andb	$0x33, %dl
   5a4f2:      	shlb	$0x2, %dl
   5a4f5:      	shrb	$0x2, %cl
   5a4f8:      	andb	$0x33, %cl
   5a4fb:      	orb	%dl, %cl
   5a4fd:      	movl	%ecx, %edx
   5a4ff:      	andb	$0x55, %dl
   5a502:      	addb	%dl, %dl
   5a504:      	shrb	%cl
   5a506:      	andb	$0x55, %cl
   5a509:      	orb	%dl, %cl
   5a50b:      	movzbl	%cl, %edx
   5a50e:      	movw	$0x1, %cx
   5a512:      	movw	$0x11, %si
   5a516:      	jmp	0x5a53e <<toyos_crypto::mlkem::Poly>::product+0x1ae>
   5a518:      	nopl	(%rax,%rax)
   5a520:      	imull	%esi, %esi
   5a523:      	movq	%rsi, %rdi
   5a526:      	imulq	%rax, %rdi
   5a52a:      	shrq	$0x2b, %rdi
   5a52e:      	imull	$0xd01, %edi, %edi      # imm = 0xD01
   5a534:      	subl	%edi, %esi
   5a536:      	shrl	%edx
   5a538:      	je	0x5a3d0 <<toyos_crypto::mlkem::Poly>::product+0x40>
   5a53e:      	movzwl	%si, %esi
   5a541:      	testb	$0x1, %dl
   5a544:      	je	0x5a520 <<toyos_crypto::mlkem::Poly>::product+0x190>
   5a546:      	movzwl	%cx, %ecx
   5a549:      	imull	%esi, %ecx
   5a54c:      	imulq	$0x3afb7681, %rcx, %rdi # imm = 0x3AFB7681
   5a553:      	shrq	$0x20, %rdi
   5a557:      	movl	%ecx, %r8d
   5a55a:      	subl	%edi, %r8d
   5a55d:      	shrl	%r8d
   5a560:      	addl	%edi, %r8d
   5a563:      	shrl	$0xb, %r8d
   5a567:      	imull	$0xd01, %r8d, %edi      # imm = 0xD01
   5a56e:      	subl	%edi, %ecx
   5a570:      	jmp	0x5a520 <<toyos_crypto::mlkem::Poly>::product+0x190>
   5a572:      	leaq	-0x228(%rbp), %rsi
   5a579:      	movl	$0x200, %edx            # imm = 0x200
   5a57e:      	movq	%rbx, %rdi
   5a581:      	callq	0xc5af0 <memcpy>
   5a586:      	movq	%rbx, %rax
   5a589:      	addq	$0x208, %rsp            # imm = 0x208
   5a590:      	popq	%rbx
   5a591:      	popq	%r12
   5a593:      	popq	%r13
   5a595:      	popq	%r14
   5a597:      	popq	%r15
   5a599:      	popq	%rbp
   5a59a:      	retq
   5a59b:      	int3
   5a59c:      	int3
   5a59d:      	int3
   5a59e:      	int3
   5a59f:      	int3

000000000005a5a0 <toyos_crypto::mlkem::noise>:
   5a5a0:      	pushq	%rbp
   5a5a1:      	movq	%rsp, %rbp
   5a5a4:      	pushq	%r15
   5a5a6:      	pushq	%r14
   5a5a8:      	pushq	%rbx
   5a5a9:      	subq	$0x2a8, %rsp            # imm = 0x2A8
   5a5b0:      	movq	%rdi, %rbx
   5a5b3:      	xorps	%xmm0, %xmm0
   5a5b6:      	movaps	%xmm0, -0x50(%rbp)
   5a5ba:      	movaps	%xmm0, -0x60(%rbp)
   5a5be:      	movaps	%xmm0, -0x70(%rbp)
   5a5c2:      	movaps	%xmm0, -0x80(%rbp)
   5a5c6:      	movaps	%xmm0, -0x90(%rbp)
   5a5cd:      	movaps	%xmm0, -0xa0(%rbp)
   5a5d4:      	movaps	%xmm0, -0xb0(%rbp)
   5a5db:      	movaps	%xmm0, -0xc0(%rbp)
   5a5e2:      	movb	%dl, -0x19(%rbp)
   5a5e5:      	movq	%rsi, -0x40(%rbp)
   5a5e9:      	movq	$0x20, -0x38(%rbp)
   5a5f1:      	leaq	-0x19(%rbp), %rax
   5a5f5:      	movq	%rax, -0x30(%rbp)
   5a5f9:      	movq	$0x1, -0x28(%rbp)
   5a601:      	leaq	-0x2c0(%rbp), %rdi
   5a608:      	leaq	-0x40(%rbp), %rcx
   5a60c:      	movl	$0x88, %esi
   5a611:      	movl	$0x2, %r8d
   5a617:      	movl	$0x1f, %edx
   5a61c:      	callq	0x4a4b0 <<toyos_crypto::keccak::Sponge>::new>
   5a621:      	movq	-0x1f0(%rbp), %rax
   5a628:      	xorl	%r15d, %r15d
   5a62b:      	leaq	-0x2c0(%rbp), %r14
   5a632:      	jmp	0x5a685 <toyos_crypto::mlkem::noise+0xe5>
   5a634:      	nopw	%cs:(%rax,%rax)
   5a640:      	movq	%rax, %rdi
   5a643:      	shrq	$0x3, %rdi
   5a647:      	cmpq	$0xc8, %rax
   5a64d:      	jae	0x5aae5 <toyos_crypto::mlkem::noise+0x545>
   5a653:      	leaq	-0x2c0(,%rdi,8), %rcx
   5a65b:      	addq	%rbp, %rcx
   5a65e:      	movl	%eax, %edx
   5a660:      	andl	$0x7, %edx
   5a663:      	movzbl	(%rdx,%rcx), %ecx
   5a667:      	movb	%cl, -0xc0(%rbp,%r15)
   5a66f:      	incq	%r15
   5a672:      	incq	%rax
   5a675:      	movq	%rax, -0x1f0(%rbp)
   5a67c:      	cmpq	$0x80, %r15
   5a683:      	je	0x5a6a7 <toyos_crypto::mlkem::noise+0x107>
   5a685:      	cmpq	-0x1f8(%rbp), %rax
   5a68c:      	jne	0x5a640 <toyos_crypto::mlkem::noise+0xa0>
   5a68e:      	movq	%r14, %rdi
   5a691:      	callq	0x4a730 <<toyos_crypto::keccak::Sponge>::permute (.llvm.16569730505516846098)>
   5a696:      	movq	$0x0, -0x1f0(%rbp)
   5a6a1:      	xorl	%edi, %edi
   5a6a3:      	xorl	%eax, %eax
   5a6a5:      	jmp	0x5a653 <toyos_crypto::mlkem::noise+0xb3>
   5a6a7:      	movq	$0x0, -0x2c0(%rbp)
   5a6b2:      	movq	$0x0, -0x2b8(%rbp)
   5a6bd:      	movq	$0x0, -0x2b0(%rbp)
   5a6c8:      	movq	$0x0, -0x2a8(%rbp)
   5a6d3:      	movq	$0x0, -0x2a0(%rbp)
   5a6de:      	movq	$0x0, -0x298(%rbp)
   5a6e9:      	movq	$0x0, -0x290(%rbp)
   5a6f4:      	movq	$0x0, -0x288(%rbp)
   5a6ff:      	movq	$0x0, -0x280(%rbp)
   5a70a:      	movq	$0x0, -0x278(%rbp)
   5a715:      	movq	$0x0, -0x270(%rbp)
   5a720:      	movq	$0x0, -0x268(%rbp)
   5a72b:      	movq	$0x0, -0x260(%rbp)
   5a736:      	movq	$0x0, -0x258(%rbp)
   5a741:      	movq	$0x0, -0x250(%rbp)
   5a74c:      	movq	$0x0, -0x248(%rbp)
   5a757:      	movq	$0x0, -0x240(%rbp)
   5a762:      	movq	$0x0, -0x238(%rbp)
   5a76d:      	movq	$0x0, -0x230(%rbp)
   5a778:      	movq	$0x0, -0x228(%rbp)
   5a783:      	movq	$0x0, -0x220(%rbp)
   5a78e:      	movq	$0x0, -0x218(%rbp)
   5a799:      	movq	$0x0, -0x210(%rbp)
   5a7a4:      	movq	$0x0, -0x208(%rbp)
   5a7af:      	movq	$0x0, -0x200(%rbp)
   5a7ba:      	leaq	-0x2c0(%rbp), %rdi
   5a7c1:      	xorl	%r14d, %r14d
   5a7c4:      	movl	$0x200, %edx            # imm = 0x200
   5a7c9:      	xorl	%esi, %esi
   5a7cb:      	callq	0xc6240 <memset>
   5a7d0:      	movq	-0x4bd98(%rip), %xmm0   # 0xea40 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x1c0>
   5a7d8:      	leaq	-0xbd(%rbp), %rax
   5a7df:      	pxor	%xmm2, %xmm2
   5a7e3:      	movdqa	-0x4c10b(%rip), %xmm5   # 0xe6e0 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x520>
   5a7eb:      	movdqa	-0x4c093(%rip), %xmm6   # 0xe760 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x5a0>
   5a7f3:      	movdqa	-0x4bb9b(%rip), %xmm7   # 0xec60 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x3e0>
   5a7fb:      	movdqa	-0x4bf94(%rip), %xmm8   # 0xe870 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x6b0>
   5a804:      	movdqa	-0x4bb7d(%rip), %xmm9   # 0xec90 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x410>
   5a80d:      	movdqa	-0x4bb25(%rip), %xmm3   # 0xecf0 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x470>
   5a815:      	movdqa	-0x4c14e(%rip), %xmm11  # 0xe6d0 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x510>
   5a81e:      	nop
   5a820:      	movzbl	-0x3(%rax), %ecx
   5a824:      	movzbl	-0x2(%rax), %edx
   5a828:      	movzbl	-0x1(%rax), %esi
   5a82c:      	movl	%esi, %edi
   5a82e:      	shll	$0x8, %edi
   5a831:      	movl	%ecx, %r8d
   5a834:      	shll	$0x8, %r8d
   5a838:      	orl	%esi, %edi
   5a83a:      	orl	%ecx, %r8d
   5a83d:      	movl	%edx, %ecx
   5a83f:      	shll	$0x10, %ecx
   5a842:      	orl	%r8d, %ecx
   5a845:      	shll	$0x18, %edx
   5a848:      	orl	%ecx, %edx
   5a84a:      	movzbl	(%rax), %ecx
   5a84d:      	movd	%edx, %xmm12
   5a852:      	movl	%ecx, %edx
   5a854:      	shll	$0x8, %edx
   5a857:      	pinsrw	$0x2, %edi, %xmm12
   5a85d:      	movdqa	%xmm0, %xmm13
   5a862:      	psllw	$0x7, %xmm13
   5a868:      	pand	-0x4bbf1(%rip), %xmm13  # 0xec80 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x400>
   5a871:      	orl	%ecx, %edx
   5a873:      	pxor	%xmm14, %xmm14
   5a878:      	pcmpgtb	%xmm13, %xmm14
   5a87d:      	pinsrw	$0x3, %edx, %xmm12
   5a883:      	movdqa	%xmm14, %xmm15
   5a888:      	pandn	%xmm12, %xmm15
   5a88d:      	psrlw	$0x4, %xmm12
   5a893:      	pand	%xmm14, %xmm12
   5a898:      	pand	-0x4c151(%rip), %xmm12  # 0xe750 <anon.742ec85e736c8c67c158100adbd6a123.1.llvm.9719407794966298434+0x590>
   5a8a1:      	paddb	%xmm13, %xmm13
   5a8a6:      	pxor	%xmm14, %xmm14
   5a8ab:      	por	%xmm15, %xmm12
   5a8b0:      	pcmpgtb	%xmm13, %xmm14
   5a8b5:      	movdqa	%xmm14, %xmm15
   5a8ba:      	pandn	%xmm12, %xmm15
   5a8bf:      	psrlw	$0x2, %xmm12
   5a8c5:      	pand	%xmm14, %xmm12
   5a8ca:      	pand	-0x4bb83(%rip), %xmm12  # 0xed50 <anon.7621b514eb2bfde73f89948a67c84ee1.2.llvm.15128334506618367914+0x4d0>
   5a8d3:      	paddb	%xmm13, %xmm13
   5a8d8:      	por	%xmm15, %xmm12
   5a8dd:      	pxor	%xmm14, %xmm14
   5a8e2:      	pcmpgtb	%xmm13, %xmm14
   5a8e7:      	movdqa	%xmm14, %xmm13
   5a8ec:      	pandn	%xmm12, %xmm13
   5a8f1:      	psrlw	$0x1, %xmm12
   5a8f7:      	pand	%xmm14, %xmm12
   5a8fc:      	pand	%xmm5, %xmm12
   5a901:      	por	%xmm13, %xmm12
   5a906:      	movdqa	%xmm12, %xmm14
   5a90b:      	pand	%xmm6, %xmm14
   5a910:      	movdqa	%xmm12, %xmm13
   5a915:      	psrlw	$0x1, %xmm13
   5a91b:      	pand	%xmm6, %xmm13
   5a920:      	paddb	%xmm14, %xmm13
   5a925:      	punpcklbw	%xmm2, %xmm13   # xmm13 = xmm13[0],xmm2[0],xmm13[1],xmm2[1],xmm13[2],xmm2[2],xmm13[3],xmm2[3],xmm13[4],xmm2[4],xmm13[5],xmm2[5],xmm13[6],xmm2[6],xmm13[7],xmm2[7]
   5a92a:      	movdqa	%xmm13, %xmm14
   5a92f:      	movdqa	%xmm12, %xmm15
   5a934:      	psrlw	$0x2, %xmm15
   5a93a:      	pand	%xmm6, %xmm15
   5a93f:      	punpcklwd	%xmm2, %xmm13   # xmm13 = xmm13[0],xmm2[0],xmm13[1],xmm2[1],xmm13[2],xmm2[2],xmm13[3],xmm2[3]
   5a944:      	psrlw	$0x3, %xmm12
   5a94a:      	pand	%xmm6, %xmm12
   5a94f:      	paddb	%xmm15, %xmm12
   5a954:      	punpckhwd	%xmm2, %xmm14   # xmm14 = xmm14[4],xmm2[4],xmm14[5],xmm2[5],xmm14[6],xmm2[6],xmm14[7],xmm2[7]
   5a959:      	punpcklbw	%xmm2, %xmm12   # xmm12 = xmm12[0],xmm2[0],xmm12[1],xmm2[1],xmm12[2],xmm2[2],xmm12[3],xmm2[3],xmm12[4],xmm2[4],xmm12[5],xmm2[5],xmm12[6],xmm2[6],xmm12[7],xmm2[7]
   5a95e:      	movdqa	%xmm12, %xmm15
   5a963:      	punpckhwd	%xmm2, %xmm15   # xmm15 = xmm15[4],xmm2[4],xmm15[5],xmm2[5],xmm15[6],xmm2[6],xmm15[7],xmm2[7]
   5a968:      	psubd	%xmm15, %xmm14
   5a96d:      	punpcklwd	%xmm2, %xmm12   # xmm12 = xmm12[0],xmm2[0],xmm12[1],xmm2[1],xmm12[2],xmm2[2],xmm12[3],xmm2[3]
   5a972:      	psubd	%xmm12, %xmm13
   5a977:      	movdqa	%xmm13, %xmm12
   5a97c:      	paddd	%xmm7, %xmm12
   5a981:      	movdqa	%xmm14, %xmm15
   5a986:      	paddd	%xmm7, %xmm15
   5a98b:      	movdqa	%xmm15, %xmm1
   5a990:      	pxor	%xmm9, %xmm1
   5a995:      	movdqa	%xmm3, %xmm10
   5a99a:      	movdqa	%xmm12, %xmm4
   5a99f:      	pxor	%xmm9, %xmm4
   5a9a4:      	pcmpgtd	%xmm1, %xmm10
   5a9a9:      	movdqa	%xmm3, %xmm1
   5a9ad:      	pcmpgtd	%xmm4, %xmm1
   5a9b1:      	paddd	%xmm8, %xmm13
   5a9b6:      	pand	%xmm1, %xmm12
   5a9bb:      	pandn	%xmm13, %xmm1
   5a9c0:      	por	%xmm12, %xmm1
   5a9c5:      	paddd	%xmm8, %xmm14
   5a9ca:      	pand	%xmm10, %xmm15
   5a9cf:      	pandn	%xmm14, %xmm10
   5a9d4:      	por	%xmm15, %xmm10
   5a9d9:      	pslld	$0x10, %xmm10
   5a9df:      	psrad	$0x10, %xmm10
   5a9e5:      	pslld	$0x10, %xmm1
   5a9ea:      	psrad	$0x10, %xmm1
   5a9ef:      	packssdw	%xmm10, %xmm1
   5a9f4:      	movdqu	%xmm1, -0x2c0(%rbp,%r14,2)
   5a9fe:      	addq	$0x8, %r14
   5aa02:      	paddb	%xmm11, %xmm0
   5aa07:      	addq	$0x4, %rax
   5aa0b:      	cmpq	$0x100, %r14            # imm = 0x100
   5aa12:      	jne	0x5a820 <toyos_crypto::mlkem::noise+0x280>
   5aa18:      	leaq	-0x2c0(%rbp), %rsi
   5aa1f:      	movl	$0x200, %edx            # imm = 0x200
   5aa24:      	movq	%rbx, %rdi
   5aa27:      	callq	0xc5af0 <memcpy>
   5aa2c:      	pxor	%xmm0, %xmm0
   5aa30:      	movdqa	%xmm0, -0x2c0(%rbp)
   5aa38:      	movaps	-0x2c0(%rbp), %xmm1
   5aa3f:      	movaps	%xmm1, -0xc0(%rbp)
   5aa46:      	movdqa	%xmm0, -0x2c0(%rbp)
   5aa4e:      	movaps	-0x2c0(%rbp), %xmm1
   5aa55:      	movaps	%xmm1, -0xb0(%rbp)
   5aa5c:      	movdqa	%xmm0, -0x2c0(%rbp)
   5aa64:      	movaps	-0x2c0(%rbp), %xmm1
   5aa6b:      	movaps	%xmm1, -0xa0(%rbp)
   5aa72:      	movdqa	%xmm0, -0x2c0(%rbp)
   5aa7a:      	movaps	-0x2c0(%rbp), %xmm1
   5aa81:      	movaps	%xmm1, -0x90(%rbp)
   5aa88:      	movdqa	%xmm0, -0x2c0(%rbp)
   5aa90:      	movaps	-0x2c0(%rbp), %xmm1
   5aa97:      	movaps	%xmm1, -0x80(%rbp)
   5aa9b:      	movdqa	%xmm0, -0x2c0(%rbp)
   5aaa3:      	movaps	-0x2c0(%rbp), %xmm1
   5aaaa:      	movaps	%xmm1, -0x70(%rbp)
   5aaae:      	movdqa	%xmm0, -0x2c0(%rbp)
   5aab6:      	movaps	-0x2c0(%rbp), %xmm1
   5aabd:      	movaps	%xmm1, -0x60(%rbp)
   5aac1:      	movdqa	%xmm0, -0x2c0(%rbp)
   5aac9:      	movaps	-0x2c0(%rbp), %xmm0
   5aad0:      	movaps	%xmm0, -0x50(%rbp)
   5aad4:      	movq	%rbx, %rax
   5aad7:      	addq	$0x2a8, %rsp            # imm = 0x2A8
   5aade:      	popq	%rbx
   5aadf:      	popq	%r14
   5aae1:      	popq	%r15
   5aae3:      	popq	%rbp
   5aae4:      	retq
   5aae5:      	leaq	0x6ce64(%rip), %rdx     # 0xc7950 <anon.1fd67189aac25b0b46092a5d2fc7dafa.8.llvm.16569730505516846098>
   5aaec:      	movl	$0x19, %esi
   5aaf1:      	callq	0xbf34d <core::panicking::panic_bounds_check>
   5aaf6:      	ud2
   5aaf8:      	movq	%rax, %rbx
   5aafb:      	jmp	0x5ab0e <toyos_crypto::mlkem::noise+0x56e>
   5aafd:      	jmp	0x5aaff <toyos_crypto::mlkem::noise+0x55f>
   5aaff:      	movq	%rax, %rbx
   5ab02:      	leaq	-0x2c0(%rbp), %rdi
   5ab09:      	callq	0x55ed0 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   5ab0e:      	leaq	-0xc0(%rbp), %rdi
   5ab15:      	callq	0x55c20 <core::ptr::drop_glue::<toyos_crypto::secret::Secret<8, [u8; 16]>>>
   5ab1a:      	movq	%rbx, %rdi
   5ab1d:      	callq	0xb9f20 <_Unwind_Resume>
   5ab22:      	callq	0xbf33a <core::panicking::panic_in_cleanup>
   5ab27:      	int3
   5ab28:      	int3
   5ab29:      	int3
   5ab2a:      	int3
   5ab2b:      	int3
   5ab2c:      	int3
   5ab2d:      	int3
   5ab2e:      	int3
   5ab2f:      	int3

000000000005ab30 <toyos_crypto::mlkem::sample>:
   5ab30:      	pushq	%rbp
   5ab31:      	movq	%rsp, %rbp
   5ab34:      	pushq	%r15
   5ab36:      	pushq	%r14
   5ab38:      	pushq	%r13
   5ab3a:      	pushq	%r12
   5ab3c:      	pushq	%rbx
   5ab3d:      	subq	$0x2e8, %rsp            # imm = 0x2E8
   5ab44:      	movq	%rdi, %rbx
   5ab47:      	movb	%cl, -0x2a(%rbp)
   5ab4a:      	movb	%dl, -0x29(%rbp)
   5ab4d:      	movq	%rsi, -0x308(%rbp)
   5ab54:      	movq	$0x20, -0x300(%rbp)
   5ab5f:      	leaq	-0x2a(%rbp), %rax
   5ab63:      	movq	%rax, -0x2f8(%rbp)
   5ab6a:      	movq	$0x2, -0x2f0(%rbp)
   5ab75:      	leaq	-0x108(%rbp), %r14
   5ab7c:      	leaq	-0x308(%rbp), %rcx
   5ab83:      	movl	$0xa8, %esi
   5ab88:      	movl	$0x2, %r8d
   5ab8e:      	movq	%r14, %rdi
   5ab91:      	movl	$0x1f, %edx
   5ab96:      	callq	0x4a4b0 <<toyos_crypto::keccak::Sponge>::new>
   5ab9b:      	leaq	-0x308(%rbp), %rdi
   5aba2:      	xorl	%r15d, %r15d
   5aba5:      	movl	$0x200, %edx            # imm = 0x200
   5abaa:      	xorl	%esi, %esi
   5abac:      	callq	0xc6240 <memset>
   5abb1:      	movq	-0x38(%rbp), %rax
   5abb5:      	jmp	0x5abcd <toyos_crypto::mlkem::sample+0x9d>
   5abb7:      	nopw	(%rax,%rax)
   5abc0:      	cmpq	$0x100, %r15            # imm = 0x100
   5abc7:      	jae	0x5ad1c <toyos_crypto::mlkem::sample+0x1ec>
   5abcd:      	movq	-0x40(%rbp), %rdx
   5abd1:      	cmpq	%rdx, %rax
   5abd4:      	jne	0x5abf0 <toyos_crypto::mlkem::sample+0xc0>
   5abd6:      	movq	%r14, %rdi
   5abd9:      	callq	0x4a730 <<toyos_crypto::keccak::Sponge>::permute (.llvm.16569730505516846098)>
   5abde:      	movq	$0x0, -0x38(%rbp)
   5abe6:      	movq	-0x40(%rbp), %rdx
   5abea:      	xorl	%edi, %edi
   5abec:      	xorl	%eax, %eax
   5abee:      	jmp	0x5ac03 <toyos_crypto::mlkem::sample+0xd3>
   5abf0:      	movq	%rax, %rdi
   5abf3:      	shrq	$0x3, %rdi
   5abf7:      	cmpq	$0xc8, %rax
   5abfd:      	jae	0x5ae40 <toyos_crypto::mlkem::sample+0x310>
   5ac03:      	movq	-0x108(%rbp,%rdi,8), %r12
   5ac0b:      	leal	(,%rax,8), %ecx
   5ac12:      	shrq	%cl, %r12
   5ac15:      	leaq	0x1(%rax), %rsi
   5ac19:      	movq	%rsi, -0x38(%rbp)
   5ac1d:      	cmpq	%rdx, %rsi
   5ac20:      	jne	0x5ac40 <toyos_crypto::mlkem::sample+0x110>
   5ac22:      	movq	%r14, %rdi
   5ac25:      	callq	0x4a730 <<toyos_crypto::keccak::Sponge>::permute (.llvm.16569730505516846098)>
   5ac2a:      	movq	$0x0, -0x38(%rbp)
   5ac32:      	movq	-0x40(%rbp), %rdx
   5ac36:      	xorl	%edi, %edi
   5ac38:      	xorl	%esi, %esi
   5ac3a:      	jmp	0x5ac53 <toyos_crypto::mlkem::sample+0x123>
   5ac3c:      	nopl	(%rax)
   5ac40:      	movq	%rsi, %rdi
   5ac43:      	shrq	$0x3, %rdi
   5ac47:      	cmpq	$0xc7, %rax
   5ac4d:      	jae	0x5ae40 <toyos_crypto::mlkem::sample+0x310>
   5ac53:      	movq	-0x108(%rbp,%rdi,8), %r13
   5ac5b:      	leal	(,%rsi,8), %ecx
   5ac62:      	shrq	%cl, %r13
   5ac65:      	leaq	0x1(%rsi), %rax
   5ac69:      	movq	%rax, -0x38(%rbp)
   5ac6d:      	cmpq	%rdx, %rax
   5ac70:      	jne	0x5ac90 <toyos_crypto::mlkem::sample+0x160>
   5ac72:      	movq	%r14, %rdi
   5ac75:      	callq	0x4a730 <<toyos_crypto::keccak::Sponge>::permute (.llvm.16569730505516846098)>
   5ac7a:      	movq	$0x0, -0x38(%rbp)
   5ac82:      	xorl	%edi, %edi
   5ac84:      	xorl	%eax, %eax
   5ac86:      	jmp	0x5aca4 <toyos_crypto::mlkem::sample+0x174>
   5ac88:      	nopl	(%rax,%rax)
   5ac90:      	movq	%rax, %rdi
   5ac93:      	shrq	$0x3, %rdi
   5ac97:      	cmpq	$0xc7, %rsi
   5ac9e:      	jae	0x5ae40 <toyos_crypto::mlkem::sample+0x310>
   5aca4:      	movq	-0x108(%rbp,%rdi,8), %rdx
   5acac:      	leal	(,%rax,8), %ecx
   5acb3:      	shrq	%cl, %rdx
   5acb6:      	incq	%rax
   5acb9:      	movq	%rax, -0x38(%rbp)
   5acbd:      	movzbl	%r12b, %esi
   5acc1:      	movl	%r13d, %ecx
   5acc4:      	andl	$0xf, %ecx
   5acc7:      	shll	$0x8, %ecx
   5acca:      	orl	%esi, %ecx
   5accc:      	cmpl	$0xd01, %ecx            # imm = 0xD01
   5acd2:      	jae	0x5ace0 <toyos_crypto::mlkem::sample+0x1b0>
   5acd4:      	movw	%cx, -0x308(%rbp,%r15,2)
   5acdd:      	incq	%r15
   5ace0:      	movzbl	%r13b, %esi
   5ace4:      	shrl	$0x4, %esi
   5ace7:      	movzbl	%dl, %ecx
   5acea:      	shll	$0x4, %ecx
   5aced:      	orl	%esi, %ecx
   5acef:      	movzwl	%cx, %edx
   5acf2:      	cmpl	$0xd00, %edx            # imm = 0xD00
   5acf8:      	ja	0x5abc0 <toyos_crypto::mlkem::sample+0x90>
   5acfe:      	cmpq	$0xff, %r15
   5ad05:      	ja	0x5abc0 <toyos_crypto::mlkem::sample+0x90>
   5ad0b:      	movw	%cx, -0x308(%rbp,%r15,2)
   5ad14:      	incq	%r15
   5ad17:      	jmp	0x5abc0 <toyos_crypto::mlkem::sample+0x90>
   5ad1c:      	leaq	-0x308(%rbp), %rsi
   5ad23:      	movl	$0x200, %edx            # imm = 0x200
   5ad28:      	movq	%rbx, %rdi
   5ad2b:      	callq	0xc5af0 <memcpy>
   5ad30:      	movq	$0x0, -0x108(%rbp)
   5ad3b:      	movq	$0x0, -0x100(%rbp)
   5ad46:      	movq	$0x0, -0xf8(%rbp)
   5ad51:      	movq	$0x0, -0xf0(%rbp)
   5ad5c:      	movq	$0x0, -0xe8(%rbp)
   5ad67:      	movq	$0x0, -0xe0(%rbp)
   5ad72:      	movq	$0x0, -0xd8(%rbp)
   5ad7d:      	movq	$0x0, -0xd0(%rbp)
   5ad88:      	movq	$0x0, -0xc8(%rbp)
   5ad93:      	movq	$0x0, -0xc0(%rbp)
   5ad9e:      	movq	$0x0, -0xb8(%rbp)
   5ada9:      	movq	$0x0, -0xb0(%rbp)
   5adb4:      	movq	$0x0, -0xa8(%rbp)
   5adbf:      	movq	$0x0, -0xa0(%rbp)
   5adca:      	movq	$0x0, -0x98(%rbp)
   5add5:      	movq	$0x0, -0x90(%rbp)
   5ade0:      	movq	$0x0, -0x88(%rbp)
   5adeb:      	movq	$0x0, -0x80(%rbp)
   5adf3:      	movq	$0x0, -0x78(%rbp)
   5adfb:      	movq	$0x0, -0x70(%rbp)
   5ae03:      	movq	$0x0, -0x68(%rbp)
   5ae0b:      	movq	$0x0, -0x60(%rbp)
   5ae13:      	movq	$0x0, -0x58(%rbp)
   5ae1b:      	movq	$0x0, -0x50(%rbp)
   5ae23:      	movq	$0x0, -0x48(%rbp)
   5ae2b:      	movq	%rbx, %rax
   5ae2e:      	addq	$0x2e8, %rsp            # imm = 0x2E8
   5ae35:      	popq	%rbx
   5ae36:      	popq	%r12
   5ae38:      	popq	%r13
   5ae3a:      	popq	%r14
   5ae3c:      	popq	%r15
   5ae3e:      	popq	%rbp
   5ae3f:      	retq
   5ae40:      	leaq	0x6cb09(%rip), %rdx     # 0xc7950 <anon.1fd67189aac25b0b46092a5d2fc7dafa.8.llvm.16569730505516846098>
   5ae47:      	movl	$0x19, %esi
   5ae4c:      	callq	0xbf34d <core::panicking::panic_bounds_check>
   5ae51:      	ud2
   5ae53:      	jmp	0x5ae55 <toyos_crypto::mlkem::sample+0x325>
   5ae55:      	movq	%rax, %rbx
   5ae58:      	xorl	%eax, %eax
   5ae5a:      	nopw	(%rax,%rax)
   5ae60:      	movw	$0x0, -0x308(%rbp,%rax)
   5ae6a:      	movw	$0x0, -0x306(%rbp,%rax)
   5ae74:      	movw	$0x0, -0x304(%rbp,%rax)
   5ae7e:      	movw	$0x0, -0x302(%rbp,%rax)
   5ae88:      	movw	$0x0, -0x300(%rbp,%rax)
   5ae92:      	movw	$0x0, -0x2fe(%rbp,%rax)
   5ae9c:      	movw	$0x0, -0x2fc(%rbp,%rax)
   5aea6:      	movw	$0x0, -0x2fa(%rbp,%rax)
   5aeb0:      	addq	$0x10, %rax
   5aeb4:      	cmpq	$0x200, %rax            # imm = 0x200
   5aeba:      	jne	0x5ae60 <toyos_crypto::mlkem::sample+0x330>
   5aebc:      	leaq	-0x108(%rbp), %rdi
   5aec3:      	callq	0x55ed0 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   5aec8:      	movq	%rbx, %rdi
   5aecb:      	callq	0xb9f20 <_Unwind_Resume>
   5aed0:      	callq	0xbf33a <core::panicking::panic_in_cleanup>
   5aed5:      	int3
   5aed6:      	int3
   5aed7:      	int3
   5aed8:      	int3
   5aed9:      	int3
   5aeda:      	int3
   5aedb:      	int3
   5aedc:      	int3
   5aedd:      	int3
   5aede:      	int3
   5aedf:      	int3

