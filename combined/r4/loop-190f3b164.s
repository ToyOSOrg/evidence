               	test	rsi, rsi
               	je	X <crypto_parity::looped::<crypto_parity::tls_rows::{closure#0}>::{closure#0} (.llvm.13470598776597117223)+X>
               	push	rbp
               	mov	rbp, rsp
               	push	r15
               	push	r14
               	push	r13
               	push	r12
               	push	rbx
               	sub	rsp, X
               	mov	rbx, rsi
               	movzx	r13d, byte ptr [rdi]
               	lea	r14, [rbp - X]
               	lea	r15, [rbp - X]
               	lea	r12, [rbp - X]
               	jmp	X <crypto_parity::looped::<crypto_parity::tls_rows::{closure#0}>::{closure#0} (.llvm.13470598776597117223)+X>
               	nop	word ptr cs:[rax + rax]
               	movaps	xmmword ptr [rbp - X], xmm0
               	movabs	rax, X
               	mov	qword ptr [rbp - X], rax
               	mov	dword ptr [rbp - X], X
               	mov	rdi, r14
               	mov	rsi, r15
               	mov	rdx, r12
               	call	X <<toyos_crypto::aead::SealingKey>::aes128_gcm>
               	mov	rdi, r14
               	call	X <core::ptr::drop_glue::<toyos_crypto::aead::Key> (.llvm.7895518881771561865)>
               	dec	rbx
               	je	X <crypto_parity::looped::<crypto_parity::tls_rows::{closure#0}>::{closure#0} (.llvm.13470598776597117223)+X>
               	movaps	xmm0, xmmword ptr [rip - X] # X <anon.d5561ba162cf1c8e42cf64a00377e663.43.llvm.7736012169461221349+X>
               	test	r13d, r13d
               	je	X <crypto_parity::looped::<crypto_parity::tls_rows::{closure#0}>::{closure#0} (.llvm.13470598776597117223)+X>
               	cmp	r13d, X
               	jne	X <crypto_parity::looped::<crypto_parity::tls_rows::{closure#0}>::{closure#0} (.llvm.13470598776597117223)+X>
               	movaps	xmmword ptr [rbp - X], xmm0
               	movaps	xmmword ptr [rbp - X], xmm0
               	movabs	rax, X
               	mov	qword ptr [rbp - X], rax
               	mov	dword ptr [rbp - X], X
               	mov	rdi, r14
               	mov	rsi, r15
               	mov	rdx, r12
               	call	X <<toyos_crypto::aead::SealingKey>::aes256_gcm>
               	jmp	X <crypto_parity::looped::<crypto_parity::tls_rows::{closure#0}>::{closure#0} (.llvm.13470598776597117223)+X>
               	nop	word ptr cs:[rax + rax]
               	movaps	xmmword ptr [rbp - X], xmm0
               	movaps	xmmword ptr [rbp - X], xmm0
               	movabs	rax, X
               	mov	qword ptr [rbp - X], rax
               	mov	dword ptr [rbp - X], X
               	mov	rdi, r14
               	mov	rsi, r15
               	mov	rdx, r12
               	call	X <<toyos_crypto::aead::SealingKey>::chacha20_poly1305>
               	jmp	X <crypto_parity::looped::<crypto_parity::tls_rows::{closure#0}>::{closure#0} (.llvm.13470598776597117223)+X>
               	add	rsp, X
               	pop	rbx
               	pop	r12
               	pop	r13
               	pop	r14
               	pop	r15
               	pop	rbp
               	ret
