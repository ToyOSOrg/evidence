               	test	rsi, rsi
               	je	X <crypto_parity::looped::<crypto_parity::tls_rows::{closure#0}>::{closure#0} (.llvm.17038571579195404472)+X>
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
               	jmp	X <crypto_parity::looped::<crypto_parity::tls_rows::{closure#0}>::{closure#0} (.llvm.17038571579195404472)+X>
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
               	call	X <core::ptr::drop_glue::<toyos_crypto::aead::Key> (.llvm.24482532492253014)>
               	dec	rbx
               	je	X <crypto_parity::looped::<crypto_parity::tls_rows::{closure#0}>::{closure#0} (.llvm.17038571579195404472)+X>
               	movaps	xmm0, xmmword ptr [rip - X] # X
               	test	r13d, r13d
               	je	X <crypto_parity::looped::<crypto_parity::tls_rows::{closure#0}>::{closure#0} (.llvm.17038571579195404472)+X>
               	cmp	r13d, X
               	jne	X <crypto_parity::looped::<crypto_parity::tls_rows::{closure#0}>::{closure#0} (.llvm.17038571579195404472)+X>
               	movaps	xmmword ptr [rbp - X], xmm0
               	movaps	xmmword ptr [rbp - X], xmm0
               	movabs	rax, X
               	mov	qword ptr [rbp - X], rax
               	mov	dword ptr [rbp - X], X
               	mov	rdi, r14
               	mov	rsi, r15
               	mov	rdx, r12
               	call	X <<toyos_crypto::aead::SealingKey>::aes256_gcm>
               	jmp	X <crypto_parity::looped::<crypto_parity::tls_rows::{closure#0}>::{closure#0} (.llvm.17038571579195404472)+X>
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
               	jmp	X <crypto_parity::looped::<crypto_parity::tls_rows::{closure#0}>::{closure#0} (.llvm.17038571579195404472)+X>
               	add	rsp, X
               	pop	rbx
               	pop	r12
               	pop	r13
               	pop	r14
               	pop	r15
               	pop	rbp
               	ret
