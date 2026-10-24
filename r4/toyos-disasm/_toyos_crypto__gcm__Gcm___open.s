
toyos/crypto_parity:	file format elf64-x86-64

Disassembly of section .text:

00000000000d6b20 <<toyos_crypto::gcm::Gcm>::open>:
   d6b20:      	push	rbp
   d6b21:      	mov	rbp, rsp
   d6b24:      	push	r15
   d6b26:      	push	r14
   d6b28:      	push	r13
   d6b2a:      	push	r12
   d6b2c:      	push	rbx
   d6b2d:      	sub	rsp, 0x168
   d6b34:      	mov	r15, rdi
   d6b37:      	movabs	r12, 0xfffffffe1
   d6b41:      	cmp	r9, r12
   d6b44:      	setae	al
   d6b47:      	mov	rdi, rcx
   d6b4a:      	shr	rdi, 0x3d
   d6b4e:      	setne	dil
   d6b52:      	or	dil, al
   d6b55:      	jne	0xd6e43 <<toyos_crypto::gcm::Gcm>::open+0x323>
   d6b5b:      	mov	r14, r9
   d6b5e:      	mov	rbx, r8
   d6b61:      	mov	qword ptr [rbp - 0x98], rsi
   d6b68:      	cmp	byte ptr [r15 + 0x408], 0x0
   d6b70:      	je	0xd6e4a <<toyos_crypto::gcm::Gcm>::open+0x32a>
   d6b76:      	mov	qword ptr [rbp - 0x90], rdx
   d6b7d:      	xorps	xmm0, xmm0
   d6b80:      	movaps	xmmword ptr [rbp - 0xb0], xmm0
   d6b87:      	movaps	xmmword ptr [rbp - 0xc0], xmm0
   d6b8e:      	movaps	xmmword ptr [rbp - 0xd0], xmm0
   d6b95:      	movaps	xmmword ptr [rbp - 0xe0], xmm0
   d6b9c:      	movaps	xmmword ptr [rbp - 0xf0], xmm0
   d6ba3:      	movaps	xmmword ptr [rbp - 0x100], xmm0
   d6baa:      	movaps	xmmword ptr [rbp - 0x110], xmm0
   d6bb1:      	movaps	xmmword ptr [rbp - 0x120], xmm0
   d6bb8:      	movaps	xmmword ptr [rbp - 0x130], xmm0
   d6bbf:      	movaps	xmmword ptr [rbp - 0x140], xmm0
   d6bc6:      	movaps	xmmword ptr [rbp - 0x150], xmm0
   d6bcd:      	movaps	xmmword ptr [rbp - 0x160], xmm0
   d6bd4:      	movaps	xmmword ptr [rbp - 0x170], xmm0
   d6bdb:      	movaps	xmmword ptr [rbp - 0x180], xmm0
   d6be2:      	mov	qword ptr [rbp - 0x88], rcx
   d6be9:      	cmp	rcx, 0x11
   d6bed:      	setae	al
   d6bf0:      	cmp	r14, 0xe1
   d6bf7:      	setae	cl
   d6bfa:      	or	cl, al
   d6bfc:      	jne	0xd6fbc <<toyos_crypto::gcm::Gcm>::open+0x49c>
   d6c02:      	mov	r13, qword ptr [r15 + 0x400]
   d6c09:      	mov	rax, qword ptr [rip + 0xd6860] # 0x1ad470
   d6c10:      	mov	eax, dword ptr [rax]
   d6c12:      	test	eax, eax
   d6c14:      	jns	0xd7818 <<toyos_crypto::gcm::Gcm>::open+0xcf8>
   d6c1a:      	not	eax
   d6c1c:      	test	al, 0x7
   d6c1e:      	jne	0xd6fbc <<toyos_crypto::gcm::Gcm>::open+0x49c>
   d6c24:      	lea	rsi, [r15 + 0x310]
   d6c2b:      	add	r15, 0x10
   d6c2f:      	lea	rdi, [rbp - 0x3f]
   d6c33:      	lea	rax, [rbp - 0x180]
   d6c3a:      	mov	rdx, r13
   d6c3d:      	mov	rcx, r15
   d6c40:      	mov	r8, qword ptr [rbp - 0x98]
   d6c47:      	mov	r9, qword ptr [rbp - 0x90]
   d6c4e:      	push	rax
   d6c4f:      	push	r14
   d6c51:      	push	rbx
   d6c52:      	push	qword ptr [rbp - 0x88]
   d6c58:      	call	0xca000 <toyos_crypto::arch::x86_64::aesni::short>
   d6c5d:      	add	rsp, 0x20
   d6c61:      	mov	byte ptr [rbp - 0x40], 0x1
   d6c65:      	cmp	qword ptr [rbp + 0x18], 0x10
   d6c6a:      	jne	0xd7215 <<toyos_crypto::gcm::Gcm>::open+0x6f5>
   d6c70:      	mov	rax, qword ptr [rbp + 0x10]
   d6c74:      	movzx	r9d, byte ptr [rax]
   d6c78:      	movzx	ecx, byte ptr [rax + 0x1]
   d6c7c:      	movzx	r15d, byte ptr [rax + 0x2]
   d6c81:      	movzx	r12d, byte ptr [rax + 0x3]
   d6c86:      	movzx	edx, byte ptr [rax + 0x4]
   d6c8a:      	mov	byte ptr [rbp - 0x41], dl
   d6c8d:      	movzx	edx, byte ptr [rax + 0x5]
   d6c91:      	movzx	edi, byte ptr [rax + 0x6]
   d6c95:      	movzx	esi, byte ptr [rax + 0x7]
   d6c99:      	mov	byte ptr [rbp - 0x88], sil
   d6ca0:      	movzx	r11d, byte ptr [rax + 0x8]
   d6ca5:      	movzx	r10d, byte ptr [rax + 0x9]
   d6caa:      	movzx	esi, byte ptr [rax + 0xa]
   d6cae:      	movzx	r8d, byte ptr [rax + 0xb]
   d6cb3:      	mov	byte ptr [rbp - 0x90], r8b
   d6cba:      	movzx	r13d, byte ptr [rax + 0xc]
   d6cbf:      	movzx	r8d, byte ptr [rax + 0xd]
   d6cc4:      	mov	byte ptr [rbp - 0x98], r8b
   d6ccb:      	movzx	r8d, byte ptr [rax + 0xe]
   d6cd0:      	xor	r9b, byte ptr [rbp - 0x3f]
   d6cd4:      	xor	cl, byte ptr [rbp - 0x3e]
   d6cd7:      	movzx	eax, byte ptr [rax + 0xf]
   d6cdb:      	or	cl, r9b
   d6cde:      	xor	r15b, byte ptr [rbp - 0x3d]
   d6ce2:      	xor	r12b, byte ptr [rbp - 0x3c]
   d6ce6:      	or	r12b, r15b
   d6ce9:      	or	r12b, cl
   d6cec:      	movzx	ecx, byte ptr [rbp - 0x41]
   d6cf0:      	xor	cl, byte ptr [rbp - 0x3b]
   d6cf3:      	xor	dl, byte ptr [rbp - 0x3a]
   d6cf6:      	or	dl, cl
   d6cf8:      	xor	dil, byte ptr [rbp - 0x39]
   d6cfc:      	or	dil, dl
   d6cff:      	movzx	ecx, byte ptr [rbp - 0x88]
   d6d06:      	xor	cl, byte ptr [rbp - 0x38]
   d6d09:      	xor	r11b, byte ptr [rbp - 0x37]
   d6d0d:      	or	dil, r12b
   d6d10:      	movabs	r12, 0xfffffffe1
   d6d1a:      	or	r11b, cl
   d6d1d:      	xor	r10b, byte ptr [rbp - 0x36]
   d6d21:      	or	r10b, r11b
   d6d24:      	xor	sil, byte ptr [rbp - 0x35]
   d6d28:      	or	sil, r10b
   d6d2b:      	movzx	ecx, byte ptr [rbp - 0x90]
   d6d32:      	xor	cl, byte ptr [rbp - 0x34]
   d6d35:      	xor	r13b, byte ptr [rbp - 0x33]
   d6d39:      	or	sil, dil
   d6d3c:      	or	r13b, cl
   d6d3f:      	movzx	ecx, byte ptr [rbp - 0x98]
   d6d46:      	xor	cl, byte ptr [rbp - 0x32]
   d6d49:      	or	cl, r13b
   d6d4c:      	xor	r8b, byte ptr [rbp - 0x31]
   d6d50:      	or	r8b, cl
   d6d53:      	or	r8b, sil
   d6d56:      	xor	al, byte ptr [rbp - 0x30]
   d6d59:      	xor	ecx, ecx
   d6d5b:      	or	al, r8b
   d6d5e:      	setne	cl
   d6d61:      	mov	byte ptr [rbp - 0x80], 0x0
   d6d65:      	mov	byte ptr [rbp - 0x70], 0x0
   d6d69:      	mov	byte ptr [rbp - 0x4f], 0x0
   d6d6d:      	mov	byte ptr [rbp - 0x4e], 0x0
   d6d71:      	mov	byte ptr [rbp - 0x4d], 0x0
   d6d75:      	mov	byte ptr [rbp - 0x4c], 0x0
   d6d79:      	mov	byte ptr [rbp - 0x4b], 0x0
   d6d7d:      	mov	byte ptr [rbp - 0x4a], 0x0
   d6d81:      	mov	byte ptr [rbp - 0x49], 0x0
   d6d85:      	mov	byte ptr [rbp - 0x48], 0x0
   d6d89:      	mov	byte ptr [rbp - 0x47], 0x0
   d6d8d:      	mov	byte ptr [rbp - 0x46], 0x0
   d6d91:      	mov	byte ptr [rbp - 0x45], 0x0
   d6d95:      	mov	byte ptr [rbp - 0x44], 0x0
   d6d99:      	mov	byte ptr [rbp - 0x43], 0x0
   d6d9d:      	mov	byte ptr [rbp - 0x42], 0x0
   d6da1:      	movzx	eax, byte ptr [rbp - 0x80]
   d6da5:      	mov	byte ptr [rbp - 0x60], al
   d6da8:      	movzx	eax, byte ptr [rbp - 0x70]
   d6dac:      	mov	byte ptr [rbp - 0x5f], al
   d6daf:      	movzx	eax, byte ptr [rbp - 0x4f]
   d6db3:      	mov	byte ptr [rbp - 0x5e], al
   d6db6:      	movzx	eax, byte ptr [rbp - 0x4e]
   d6dba:      	mov	byte ptr [rbp - 0x5d], al
   d6dbd:      	movzx	eax, byte ptr [rbp - 0x4d]
   d6dc1:      	mov	byte ptr [rbp - 0x5c], al
   d6dc4:      	movzx	eax, byte ptr [rbp - 0x4c]
   d6dc8:      	mov	byte ptr [rbp - 0x5b], al
   d6dcb:      	movzx	eax, byte ptr [rbp - 0x4b]
   d6dcf:      	mov	byte ptr [rbp - 0x5a], al
   d6dd2:      	movzx	eax, byte ptr [rbp - 0x4a]
   d6dd6:      	mov	byte ptr [rbp - 0x59], al
   d6dd9:      	movzx	eax, byte ptr [rbp - 0x49]
   d6ddd:      	mov	byte ptr [rbp - 0x58], al
   d6de0:      	movzx	eax, byte ptr [rbp - 0x48]
   d6de4:      	mov	byte ptr [rbp - 0x57], al
   d6de7:      	movzx	eax, byte ptr [rbp - 0x47]
   d6deb:      	mov	byte ptr [rbp - 0x56], al
   d6dee:      	movzx	eax, byte ptr [rbp - 0x46]
   d6df2:      	mov	byte ptr [rbp - 0x55], al
   d6df5:      	movzx	eax, byte ptr [rbp - 0x45]
   d6df9:      	mov	byte ptr [rbp - 0x54], al
   d6dfc:      	movzx	eax, byte ptr [rbp - 0x44]
   d6e00:      	mov	byte ptr [rbp - 0x53], al
   d6e03:      	movzx	eax, byte ptr [rbp - 0x43]
   d6e07:      	mov	byte ptr [rbp - 0x52], al
   d6e0a:      	movzx	eax, byte ptr [rbp - 0x42]
   d6e0e:      	mov	byte ptr [rbp - 0x51], al
   d6e11:      	test	rcx, rcx
   d6e14:      	jne	0xd72c5 <<toyos_crypto::gcm::Gcm>::open+0x7a5>
   d6e1a:      	mov	eax, r14d
   d6e1d:      	and	eax, 0xf0
   d6e22:      	mov	esi, r14d
   d6e25:      	and	esi, 0xf
   d6e28:      	shr	r14, 0x4
   d6e2c:      	je	0xd752b <<toyos_crypto::gcm::Gcm>::open+0xa0b>
   d6e32:      	cmp	r14, 0x1
   d6e36:      	jne	0xd74cc <<toyos_crypto::gcm::Gcm>::open+0x9ac>
   d6e3c:      	xor	ecx, ecx
   d6e3e:      	jmp	0xd7514 <<toyos_crypto::gcm::Gcm>::open+0x9f4>
   d6e43:      	xor	eax, eax
   d6e45:      	jmp	0xd74ba <<toyos_crypto::gcm::Gcm>::open+0x99a>
   d6e4a:      	lea	r13, [rbp - 0x180]
   d6e51:      	mov	rdi, r13
   d6e54:      	mov	rsi, r15
   d6e57:      	mov	r8, rbx
   d6e5a:      	mov	r9, r14
   d6e5d:      	call	0xd7c30 <<toyos_crypto::gcm::Gcm>::digest (.llvm.3285597065436921641)>
   d6e62:      	lea	rdi, [rbp - 0x40]
   d6e66:      	mov	rsi, r15
   d6e69:      	mov	rdx, qword ptr [rbp - 0x98]
   d6e70:      	mov	rcx, r13
   d6e73:      	call	0xd66b0 <<toyos_crypto::gcm::Gcm>::tag (.llvm.3285597065436921641)>
   d6e78:      	cmp	qword ptr [rbp + 0x18], 0x10
   d6e7d:      	jne	0xd7109 <<toyos_crypto::gcm::Gcm>::open+0x5e9>
   d6e83:      	mov	qword ptr [rbp - 0x188], r15
   d6e8a:      	mov	r15, qword ptr [rbp + 0x10]
   d6e8e:      	movzx	esi, byte ptr [r15]
   d6e92:      	movzx	r12d, byte ptr [r15 + 0x1]
   d6e97:      	movzx	r8d, byte ptr [r15 + 0x2]
   d6e9c:      	movzx	r13d, byte ptr [r15 + 0x3]
   d6ea1:      	movzx	eax, byte ptr [r15 + 0x4]
   d6ea6:      	mov	byte ptr [rbp - 0x50], al
   d6ea9:      	movzx	eax, byte ptr [r15 + 0x5]
   d6eae:      	movzx	edi, byte ptr [r15 + 0x6]
   d6eb3:      	movzx	ecx, byte ptr [r15 + 0x7]
   d6eb8:      	mov	byte ptr [rbp - 0x41], cl
   d6ebb:      	movzx	r11d, byte ptr [r15 + 0x8]
   d6ec0:      	movzx	r10d, byte ptr [r15 + 0x9]
   d6ec5:      	movzx	ecx, byte ptr [r15 + 0xa]
   d6eca:      	movzx	edx, byte ptr [r15 + 0xb]
   d6ecf:      	mov	byte ptr [rbp - 0x88], dl
   d6ed5:      	movzx	r9d, byte ptr [r15 + 0xc]
   d6eda:      	movzx	edx, byte ptr [r15 + 0xd]
   d6edf:      	mov	byte ptr [rbp - 0x90], dl
   d6ee5:      	movzx	edx, byte ptr [r15 + 0xe]
   d6eea:      	xor	sil, byte ptr [rbp - 0x40]
   d6eee:      	xor	r12b, byte ptr [rbp - 0x3f]
   d6ef2:      	movzx	r15d, byte ptr [r15 + 0xf]
   d6ef7:      	or	r12b, sil
   d6efa:      	xor	r8b, byte ptr [rbp - 0x3e]
   d6efe:      	xor	r13b, byte ptr [rbp - 0x3d]
   d6f02:      	or	r13b, r8b
   d6f05:      	or	r13b, r12b
   d6f08:      	movabs	r12, 0xfffffffe1
   d6f12:      	movzx	esi, byte ptr [rbp - 0x50]
   d6f16:      	xor	sil, byte ptr [rbp - 0x3c]
   d6f1a:      	xor	al, byte ptr [rbp - 0x3b]
   d6f1d:      	or	al, sil
   d6f20:      	xor	dil, byte ptr [rbp - 0x3a]
   d6f24:      	or	dil, al
   d6f27:      	movzx	eax, byte ptr [rbp - 0x41]
   d6f2b:      	xor	al, byte ptr [rbp - 0x39]
   d6f2e:      	xor	r11b, byte ptr [rbp - 0x38]
   d6f32:      	or	dil, r13b
   d6f35:      	or	r11b, al
   d6f38:      	xor	r10b, byte ptr [rbp - 0x37]
   d6f3c:      	or	r10b, r11b
   d6f3f:      	xor	cl, byte ptr [rbp - 0x36]
   d6f42:      	or	cl, r10b
   d6f45:      	movzx	eax, byte ptr [rbp - 0x88]
   d6f4c:      	xor	al, byte ptr [rbp - 0x35]
   d6f4f:      	xor	r9b, byte ptr [rbp - 0x34]
   d6f53:      	or	cl, dil
   d6f56:      	or	r9b, al
   d6f59:      	movzx	eax, byte ptr [rbp - 0x90]
   d6f60:      	xor	al, byte ptr [rbp - 0x33]
   d6f63:      	or	al, r9b
   d6f66:      	xor	dl, byte ptr [rbp - 0x32]
   d6f69:      	or	dl, al
   d6f6b:      	or	dl, cl
   d6f6d:      	xor	r15b, byte ptr [rbp - 0x31]
   d6f71:      	xor	eax, eax
   d6f73:      	or	r15b, dl
   d6f76:      	setne	al
   d6f79:      	xorps	xmm0, xmm0
   d6f7c:      	movaps	xmmword ptr [rbp - 0x180], xmm0
   d6f83:      	movaps	xmm0, xmmword ptr [rbp - 0x180]
   d6f8a:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d6f8e:      	test	rax, rax
   d6f91:      	jne	0xd739a <<toyos_crypto::gcm::Gcm>::open+0x87a>
   d6f97:      	mov	rdi, qword ptr [rbp - 0x188]
   d6f9e:      	mov	rsi, qword ptr [rbp - 0x98]
   d6fa5:      	mov	edx, 0x2
   d6faa:      	mov	rcx, rbx
   d6fad:      	mov	r8, r14
   d6fb0:      	call	0xd67e0 <<toyos_crypto::gcm::Gcm>::xor (.llvm.3285597065436921641)>
   d6fb5:      	mov	al, -0x1
   d6fb7:      	jmp	0xd74ba <<toyos_crypto::gcm::Gcm>::open+0x99a>
   d6fbc:      	mov	byte ptr [rbp - 0x40], 0x0
   d6fc0:      	lea	rdi, [rbp - 0x80]
   d6fc4:      	mov	rsi, r15
   d6fc7:      	mov	r13, qword ptr [rbp - 0x98]
   d6fce:      	mov	rdx, r13
   d6fd1:      	mov	rcx, qword ptr [rbp - 0x90]
   d6fd8:      	mov	r8, qword ptr [rbp - 0x88]
   d6fdf:      	mov	r9, rbx
   d6fe2:      	push	0x1
   d6fe4:      	push	r14
   d6fe6:      	call	0xd7a30 <<toyos_crypto::gcm::Gcm>::crypt (.llvm.3285597065436921641)>
   d6feb:      	add	rsp, 0x10
   d6fef:      	lea	rdi, [rbp - 0x70]
   d6ff3:      	lea	rcx, [rbp - 0x80]
   d6ff7:      	mov	rsi, r15
   d6ffa:      	mov	rdx, r13
   d6ffd:      	call	0xd66b0 <<toyos_crypto::gcm::Gcm>::tag (.llvm.3285597065436921641)>
   d7002:      	cmp	qword ptr [rbp + 0x18], 0x10
   d7007:      	jne	0xd7123 <<toyos_crypto::gcm::Gcm>::open+0x603>
   d700d:      	mov	rax, qword ptr [rbp + 0x10]
   d7011:      	movzx	r15d, byte ptr [rax]
   d7015:      	movzx	ecx, byte ptr [rax + 0x1]
   d7019:      	movzx	r8d, byte ptr [rax + 0x2]
   d701e:      	movzx	r13d, byte ptr [rax + 0x3]
   d7023:      	movzx	edx, byte ptr [rax + 0x4]
   d7027:      	mov	byte ptr [rbp - 0x41], dl
   d702a:      	movzx	edx, byte ptr [rax + 0x5]
   d702e:      	movzx	r9d, byte ptr [rax + 0x6]
   d7033:      	movzx	esi, byte ptr [rax + 0x7]
   d7037:      	mov	byte ptr [rbp - 0x88], sil
   d703e:      	movzx	r11d, byte ptr [rax + 0x8]
   d7043:      	movzx	r10d, byte ptr [rax + 0x9]
   d7048:      	movzx	esi, byte ptr [rax + 0xa]
   d704c:      	movzx	edi, byte ptr [rax + 0xb]
   d7050:      	mov	byte ptr [rbp - 0x90], dil
   d7057:      	movzx	r12d, byte ptr [rax + 0xc]
   d705c:      	movzx	edi, byte ptr [rax + 0xd]
   d7060:      	mov	byte ptr [rbp - 0x98], dil
   d7067:      	movzx	edi, byte ptr [rax + 0xe]
   d706b:      	movzx	eax, byte ptr [rax + 0xf]
   d706f:      	xor	r15b, byte ptr [rbp - 0x70]
   d7073:      	xor	cl, byte ptr [rbp - 0x6f]
   d7076:      	xor	r8b, byte ptr [rbp - 0x6e]
   d707a:      	xor	r13b, byte ptr [rbp - 0x6d]
   d707e:      	or	cl, r15b
   d7081:      	or	r13b, r8b
   d7084:      	movzx	r8d, byte ptr [rbp - 0x41]
   d7089:      	xor	r8b, byte ptr [rbp - 0x6c]
   d708d:      	or	r13b, cl
   d7090:      	xor	dl, byte ptr [rbp - 0x6b]
   d7093:      	or	dl, r8b
   d7096:      	xor	r9b, byte ptr [rbp - 0x6a]
   d709a:      	or	r9b, dl
   d709d:      	or	r9b, r13b
   d70a0:      	movzx	ecx, byte ptr [rbp - 0x88]
   d70a7:      	xor	cl, byte ptr [rbp - 0x69]
   d70aa:      	xor	r11b, byte ptr [rbp - 0x68]
   d70ae:      	or	r11b, cl
   d70b1:      	xor	r10b, byte ptr [rbp - 0x67]
   d70b5:      	or	r10b, r11b
   d70b8:      	xor	sil, byte ptr [rbp - 0x66]
   d70bc:      	or	sil, r10b
   d70bf:      	or	sil, r9b
   d70c2:      	movzx	ecx, byte ptr [rbp - 0x90]
   d70c9:      	xor	cl, byte ptr [rbp - 0x65]
   d70cc:      	xor	r12b, byte ptr [rbp - 0x64]
   d70d0:      	or	r12b, cl
   d70d3:      	movzx	ecx, byte ptr [rbp - 0x98]
   d70da:      	xor	cl, byte ptr [rbp - 0x63]
   d70dd:      	or	cl, r12b
   d70e0:      	xor	dil, byte ptr [rbp - 0x62]
   d70e4:      	or	dil, cl
   d70e7:      	movabs	r12, 0xfffffffe1
   d70f1:      	or	dil, sil
   d70f4:      	mov	ecx, eax
   d70f6:      	xor	cl, byte ptr [rbp - 0x61]
   d70f9:      	xor	eax, eax
   d70fb:      	or	cl, dil
   d70fe:      	setne	al
   d7101:      	test	rax, rax
   d7104:      	sete	cl
   d7107:      	jmp	0xd7125 <<toyos_crypto::gcm::Gcm>::open+0x605>
   d7109:      	xorps	xmm0, xmm0
   d710c:      	movaps	xmmword ptr [rbp - 0x180], xmm0
   d7113:      	movaps	xmm0, xmmword ptr [rbp - 0x180]
   d711a:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d711e:      	jmp	0xd739a <<toyos_crypto::gcm::Gcm>::open+0x87a>
   d7123:      	xor	ecx, ecx
   d7125:      	xorps	xmm0, xmm0
   d7128:      	movaps	xmmword ptr [rbp - 0x80], xmm0
   d712c:      	movaps	xmm1, xmmword ptr [rbp - 0x80]
   d7130:      	movaps	xmmword ptr [rbp - 0x70], xmm1
   d7134:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d7138:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d713c:      	movaps	xmmword ptr [rbp - 0x180], xmm1
   d7143:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d7147:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d714b:      	movaps	xmmword ptr [rbp - 0x170], xmm1
   d7152:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d7156:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d715a:      	movaps	xmmword ptr [rbp - 0x160], xmm1
   d7161:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d7165:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d7169:      	movaps	xmmword ptr [rbp - 0x150], xmm1
   d7170:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d7174:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d7178:      	movaps	xmmword ptr [rbp - 0x140], xmm1
   d717f:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d7183:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d7187:      	movaps	xmmword ptr [rbp - 0x130], xmm1
   d718e:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d7192:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d7196:      	movaps	xmmword ptr [rbp - 0x120], xmm1
   d719d:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d71a1:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d71a5:      	movaps	xmmword ptr [rbp - 0x110], xmm1
   d71ac:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d71b0:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d71b4:      	movaps	xmmword ptr [rbp - 0x100], xmm1
   d71bb:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d71bf:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d71c3:      	movaps	xmmword ptr [rbp - 0xf0], xmm1
   d71ca:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d71ce:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d71d2:      	movaps	xmmword ptr [rbp - 0xe0], xmm1
   d71d9:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d71dd:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d71e1:      	movaps	xmmword ptr [rbp - 0xd0], xmm1
   d71e8:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d71ec:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d71f0:      	movaps	xmmword ptr [rbp - 0xc0], xmm1
   d71f7:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d71fb:      	movaps	xmm0, xmmword ptr [rbp - 0x40]
   d71ff:      	movaps	xmmword ptr [rbp - 0xb0], xmm0
   d7206:      	mov	al, -0x1
   d7208:      	test	cl, cl
   d720a:      	je	0xd739a <<toyos_crypto::gcm::Gcm>::open+0x87a>
   d7210:      	jmp	0xd74ba <<toyos_crypto::gcm::Gcm>::open+0x99a>
   d7215:      	mov	byte ptr [rbp - 0x80], 0x0
   d7219:      	mov	byte ptr [rbp - 0x70], 0x0
   d721d:      	mov	byte ptr [rbp - 0x4f], 0x0
   d7221:      	mov	byte ptr [rbp - 0x4e], 0x0
   d7225:      	mov	byte ptr [rbp - 0x4d], 0x0
   d7229:      	mov	byte ptr [rbp - 0x4c], 0x0
   d722d:      	mov	byte ptr [rbp - 0x4b], 0x0
   d7231:      	mov	byte ptr [rbp - 0x4a], 0x0
   d7235:      	mov	byte ptr [rbp - 0x49], 0x0
   d7239:      	mov	byte ptr [rbp - 0x48], 0x0
   d723d:      	mov	byte ptr [rbp - 0x47], 0x0
   d7241:      	mov	byte ptr [rbp - 0x46], 0x0
   d7245:      	mov	byte ptr [rbp - 0x45], 0x0
   d7249:      	mov	byte ptr [rbp - 0x44], 0x0
   d724d:      	mov	byte ptr [rbp - 0x43], 0x0
   d7251:      	mov	byte ptr [rbp - 0x42], 0x0
   d7255:      	movzx	eax, byte ptr [rbp - 0x80]
   d7259:      	mov	byte ptr [rbp - 0x60], al
   d725c:      	movzx	eax, byte ptr [rbp - 0x70]
   d7260:      	mov	byte ptr [rbp - 0x5f], al
   d7263:      	movzx	eax, byte ptr [rbp - 0x4f]
   d7267:      	mov	byte ptr [rbp - 0x5e], al
   d726a:      	movzx	eax, byte ptr [rbp - 0x4e]
   d726e:      	mov	byte ptr [rbp - 0x5d], al
   d7271:      	movzx	eax, byte ptr [rbp - 0x4d]
   d7275:      	mov	byte ptr [rbp - 0x5c], al
   d7278:      	movzx	eax, byte ptr [rbp - 0x4c]
   d727c:      	mov	byte ptr [rbp - 0x5b], al
   d727f:      	movzx	eax, byte ptr [rbp - 0x4b]
   d7283:      	mov	byte ptr [rbp - 0x5a], al
   d7286:      	movzx	eax, byte ptr [rbp - 0x4a]
   d728a:      	mov	byte ptr [rbp - 0x59], al
   d728d:      	movzx	eax, byte ptr [rbp - 0x49]
   d7291:      	mov	byte ptr [rbp - 0x58], al
   d7294:      	movzx	eax, byte ptr [rbp - 0x48]
   d7298:      	mov	byte ptr [rbp - 0x57], al
   d729b:      	movzx	eax, byte ptr [rbp - 0x47]
   d729f:      	mov	byte ptr [rbp - 0x56], al
   d72a2:      	movzx	eax, byte ptr [rbp - 0x46]
   d72a6:      	mov	byte ptr [rbp - 0x55], al
   d72a9:      	movzx	eax, byte ptr [rbp - 0x45]
   d72ad:      	mov	byte ptr [rbp - 0x54], al
   d72b0:      	movzx	eax, byte ptr [rbp - 0x44]
   d72b4:      	mov	byte ptr [rbp - 0x53], al
   d72b7:      	movzx	eax, byte ptr [rbp - 0x43]
   d72bb:      	mov	byte ptr [rbp - 0x52], al
   d72be:      	movzx	eax, byte ptr [rbp - 0x42]
   d72c2:      	mov	byte ptr [rbp - 0x51], al
   d72c5:      	xorps	xmm0, xmm0
   d72c8:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d72cc:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d72d0:      	movaps	xmmword ptr [rbp - 0x180], xmm1
   d72d7:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d72db:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d72df:      	movaps	xmmword ptr [rbp - 0x170], xmm1
   d72e6:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d72ea:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d72ee:      	movaps	xmmword ptr [rbp - 0x160], xmm1
   d72f5:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d72f9:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d72fd:      	movaps	xmmword ptr [rbp - 0x150], xmm1
   d7304:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d7308:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d730c:      	movaps	xmmword ptr [rbp - 0x140], xmm1
   d7313:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d7317:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d731b:      	movaps	xmmword ptr [rbp - 0x130], xmm1
   d7322:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d7326:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d732a:      	movaps	xmmword ptr [rbp - 0x120], xmm1
   d7331:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d7335:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d7339:      	movaps	xmmword ptr [rbp - 0x110], xmm1
   d7340:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d7344:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d7348:      	movaps	xmmword ptr [rbp - 0x100], xmm1
   d734f:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d7353:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d7357:      	movaps	xmmword ptr [rbp - 0xf0], xmm1
   d735e:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d7362:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d7366:      	movaps	xmmword ptr [rbp - 0xe0], xmm1
   d736d:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d7371:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d7375:      	movaps	xmmword ptr [rbp - 0xd0], xmm1
   d737c:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d7380:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d7384:      	movaps	xmmword ptr [rbp - 0xc0], xmm1
   d738b:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d738f:      	movaps	xmm0, xmmword ptr [rbp - 0x40]
   d7393:      	movaps	xmmword ptr [rbp - 0xb0], xmm0
   d739a:      	add	r12, 0xf
   d739e:      	and	r12, r14
   d73a1:      	lea	rax, [rbx + r12]
   d73a5:      	mov	ecx, r14d
   d73a8:      	and	ecx, 0xf
   d73ab:      	test	r12, r12
   d73ae:      	je	0xd7450 <<toyos_crypto::gcm::Gcm>::open+0x930>
   d73b4:      	lea	rdx, [r14 - 0x10]
   d73b8:      	mov	esi, edx
   d73ba:      	not	esi
   d73bc:      	test	sil, 0x30
   d73c0:      	je	0xd73ea <<toyos_crypto::gcm::Gcm>::open+0x8ca>
   d73c2:      	mov	esi, edx
   d73c4:      	shr	esi, 0x4
   d73c7:      	inc	esi
   d73c9:      	and	esi, 0x3
   d73cc:      	xorps	xmm0, xmm0
   d73cf:      	nop
   d73d0:      	movaps	xmmword ptr [rbp - 0x180], xmm0
   d73d7:      	movaps	xmm1, xmmword ptr [rbp - 0x180]
   d73de:      	movups	xmmword ptr [rbx], xmm1
   d73e1:      	add	rbx, 0x10
   d73e5:      	dec	rsi
   d73e8:      	jne	0xd73d0 <<toyos_crypto::gcm::Gcm>::open+0x8b0>
   d73ea:      	cmp	rdx, 0x30
   d73ee:      	jb	0xd7450 <<toyos_crypto::gcm::Gcm>::open+0x930>
   d73f0:      	xorps	xmm0, xmm0
   d73f3:      	nop	word ptr cs:[rax + rax]
   d7400:      	movaps	xmmword ptr [rbp - 0x180], xmm0
   d7407:      	movaps	xmm1, xmmword ptr [rbp - 0x180]
   d740e:      	movups	xmmword ptr [rbx], xmm1
   d7411:      	movaps	xmmword ptr [rbp - 0x180], xmm0
   d7418:      	movaps	xmm1, xmmword ptr [rbp - 0x180]
   d741f:      	movups	xmmword ptr [rbx + 0x10], xmm1
   d7423:      	movaps	xmmword ptr [rbp - 0x180], xmm0
   d742a:      	movaps	xmm1, xmmword ptr [rbp - 0x180]
   d7431:      	movups	xmmword ptr [rbx + 0x20], xmm1
   d7435:      	movaps	xmmword ptr [rbp - 0x180], xmm0
   d743c:      	movaps	xmm1, xmmword ptr [rbp - 0x180]
   d7443:      	movups	xmmword ptr [rbx + 0x30], xmm1
   d7447:      	add	rbx, 0x40
   d744b:      	cmp	rbx, rax
   d744e:      	jne	0xd7400 <<toyos_crypto::gcm::Gcm>::open+0x8e0>
   d7450:      	test	rcx, rcx
   d7453:      	je	0xd74b8 <<toyos_crypto::gcm::Gcm>::open+0x998>
   d7455:      	mov	rdx, rax
   d7458:      	and	r14, 0x7
   d745c:      	je	0xd747b <<toyos_crypto::gcm::Gcm>::open+0x95b>
   d745e:      	mov	rdx, rax
   d7461:      	nop	word ptr cs:[rax + rax]
   d7470:      	mov	byte ptr [rdx], 0x0
   d7473:      	inc	rdx
   d7476:      	dec	r14
   d7479:      	jne	0xd7470 <<toyos_crypto::gcm::Gcm>::open+0x950>
   d747b:      	cmp	ecx, 0x8
   d747e:      	jb	0xd74b8 <<toyos_crypto::gcm::Gcm>::open+0x998>
   d7480:      	add	rax, rcx
   d7483:      	nop	word ptr cs:[rax + rax]
   d7490:      	mov	byte ptr [rdx], 0x0
   d7493:      	mov	byte ptr [rdx + 0x1], 0x0
   d7497:      	mov	byte ptr [rdx + 0x2], 0x0
   d749b:      	mov	byte ptr [rdx + 0x3], 0x0
   d749f:      	mov	byte ptr [rdx + 0x4], 0x0
   d74a3:      	mov	byte ptr [rdx + 0x5], 0x0
   d74a7:      	mov	byte ptr [rdx + 0x6], 0x0
   d74ab:      	mov	byte ptr [rdx + 0x7], 0x0
   d74af:      	add	rdx, 0x8
   d74b3:      	cmp	rdx, rax
   d74b6:      	jne	0xd7490 <<toyos_crypto::gcm::Gcm>::open+0x970>
   d74b8:      	mov	al, 0x1
   d74ba:      	add	rsp, 0x168
   d74c1:      	pop	rbx
   d74c2:      	pop	r12
   d74c4:      	pop	r13
   d74c6:      	pop	r14
   d74c8:      	pop	r15
   d74ca:      	pop	rbp
   d74cb:      	ret
   d74cc:      	mov	edx, r14d
   d74cf:      	and	edx, 0xe
   d74d2:      	mov	edi, 0x10
   d74d7:      	xor	ecx, ecx
   d74d9:      	movups	xmm0, xmmword ptr [rbp + rdi - 0x190]
   d74e1:      	movups	xmm1, xmmword ptr [rbx + rdi - 0x10]
   d74e6:      	xorps	xmm1, xmm0
   d74e9:      	movups	xmm0, xmmword ptr [rbx + rdi]
   d74ed:      	movups	xmmword ptr [rbx + rdi - 0x10], xmm1
   d74f2:      	add	rcx, 0x2
   d74f6:      	movups	xmm1, xmmword ptr [rbp + rdi - 0x180]
   d74fe:      	xorps	xmm1, xmm0
   d7501:      	movups	xmmword ptr [rbx + rdi], xmm1
   d7505:      	add	rdi, 0x20
   d7509:      	cmp	rdx, rcx
   d750c:      	jne	0xd74d9 <<toyos_crypto::gcm::Gcm>::open+0x9b9>
   d750e:      	test	r14b, 0x1
   d7512:      	je	0xd752b <<toyos_crypto::gcm::Gcm>::open+0xa0b>
   d7514:      	shl	rcx, 0x4
   d7518:      	movups	xmm0, xmmword ptr [rbx + rcx]
   d751c:      	movups	xmm1, xmmword ptr [rbp + rcx - 0x180]
   d7524:      	xorps	xmm1, xmm0
   d7527:      	movups	xmmword ptr [rbx + rcx], xmm1
   d752b:      	mov	edx, 0xe0
   d7530:      	sub	rdx, rax
   d7533:      	cmp	esi, edx
   d7535:      	ja	0xd7822 <<toyos_crypto::gcm::Gcm>::open+0xd02>
   d753b:      	add	rbx, rax
   d753e:      	add	rax, rbp
   d7541:      	add	rax, -0x180
   d7547:      	cmp	esi, 0x7
   d754a:      	jbe	0xd75e7 <<toyos_crypto::gcm::Gcm>::open+0xac7>
   d7550:      	mov	rdx, qword ptr [rbx + rsi - 0x8]
   d7555:      	lea	edi, [8*rsi]
   d755c:      	mov	cl, -0x80
   d755e:      	sub	cl, dil
   d7561:      	xor	edi, edi
   d7563:      	shrd	rdx, rdi, cl
   d7567:      	mov	r8, qword ptr [rax + rsi - 0x8]
   d756c:      	shrd	r8, rdi, cl
   d7570:      	test	cl, 0x40
   d7573:      	cmovne	rdx, rdi
   d7577:      	mov	rax, qword ptr [rax]
   d757a:      	cmovne	r8, rdi
   d757e:      	xor	r8, rdx
   d7581:      	xor	rax, qword ptr [rbx]
   d7584:      	mov	qword ptr [rbp - 0x80], rax
   d7588:      	mov	qword ptr [rbp - 0x78], r8
   d758c:      	lea	rcx, [rbp - 0x80]
   d7590:      	mov	rdx, rcx
   d7593:      	sub	rdx, rbx
   d7596:      	mov	rdi, rbx
   d7599:      	sub	rdi, rcx
   d759c:      	cmovb	rdi, rdx
   d75a0:      	cmp	rdi, 0x7
   d75a4:      	jbe	0xd7832 <<toyos_crypto::gcm::Gcm>::open+0xd12>
   d75aa:      	mov	qword ptr [rbx], rax
   d75ad:      	mov	rax, qword ptr [rbp + rsi - 0x88]
   d75b5:      	mov	qword ptr [rbp - 0x70], rax
   d75b9:      	lea	rcx, [rbx + rsi]
   d75bd:      	add	rcx, -0x8
   d75c1:      	lea	rdx, [rbp - 0x70]
   d75c5:      	mov	rsi, rdx
   d75c8:      	sub	rsi, rcx
   d75cb:      	mov	rdi, rcx
   d75ce:      	sub	rdi, rdx
   d75d1:      	cmovb	rdi, rsi
   d75d5:      	cmp	rdi, 0x7
   d75d9:      	jbe	0xd7834 <<toyos_crypto::gcm::Gcm>::open+0xd14>
   d75df:      	mov	qword ptr [rcx], rax
   d75e2:      	jmp	0xd773e <<toyos_crypto::gcm::Gcm>::open+0xc1e>
   d75e7:      	cmp	esi, 0x3
   d75ea:      	jbe	0xd7692 <<toyos_crypto::gcm::Gcm>::open+0xb72>
   d75f0:      	mov	edi, dword ptr [rbx + rsi - 0x4]
   d75f4:      	lea	edx, [8*rsi]
   d75fb:      	mov	cl, 0x40
   d75fd:      	sub	cl, dl
   d75ff:      	xor	r8d, r8d
   d7602:      	shrd	rdi, r8, cl
   d7606:      	mov	edx, dword ptr [rax + rsi - 0x4]
   d760a:      	shrd	rdx, r8, cl
   d760e:      	mov	r9d, dword ptr [rbx]
   d7611:      	test	cl, 0x40
   d7614:      	cmovne	rdi, r8
   d7618:      	cmovne	rdx, r8
   d761c:      	mov	eax, dword ptr [rax]
   d761e:      	shl	rdi, 0x20
   d7622:      	or	rdi, r9
   d7625:      	shl	rdx, 0x20
   d7629:      	or	rdx, rax
   d762c:      	xor	rdx, rdi
   d762f:      	mov	qword ptr [rbp - 0x80], rdx
   d7633:      	mov	qword ptr [rbp - 0x78], 0x0
   d763b:      	lea	rax, [rbp - 0x80]
   d763f:      	mov	rcx, rax
   d7642:      	sub	rcx, rbx
   d7645:      	mov	rdi, rbx
   d7648:      	sub	rdi, rax
   d764b:      	cmovb	rdi, rcx
   d764f:      	cmp	rdi, 0x3
   d7653:      	jbe	0xd7836 <<toyos_crypto::gcm::Gcm>::open+0xd16>
   d7659:      	mov	dword ptr [rbx], edx
   d765b:      	mov	eax, dword ptr [rbp + rsi - 0x84]
   d7662:      	mov	dword ptr [rbp - 0x70], eax
   d7665:      	lea	rcx, [rbx + rsi]
   d7669:      	add	rcx, -0x4
   d766d:      	lea	rdx, [rbp - 0x70]
   d7671:      	mov	rsi, rdx
   d7674:      	sub	rsi, rcx
   d7677:      	mov	rdi, rcx
   d767a:      	sub	rdi, rdx
   d767d:      	cmovb	rdi, rsi
   d7681:      	cmp	rdi, 0x3
   d7685:      	jbe	0xd7838 <<toyos_crypto::gcm::Gcm>::open+0xd18>
   d768b:      	mov	dword ptr [rcx], eax
   d768d:      	jmp	0xd773e <<toyos_crypto::gcm::Gcm>::open+0xc1e>
   d7692:      	test	rsi, rsi
   d7695:      	je	0xd773e <<toyos_crypto::gcm::Gcm>::open+0xc1e>
   d769b:      	lea	rcx, [rsi - 0x1]
   d769f:      	shl	ecx, 0x3
   d76a2:      	movzx	r9d, byte ptr [rax + rsi - 0x1]
   d76a8:      	mov	r10, r9
   d76ab:      	shl	r10, cl
   d76ae:      	xor	edx, edx
   d76b0:      	test	cl, 0x40
   d76b3:      	mov	r8, r10
   d76b6:      	cmovne	r8, rdx
   d76ba:      	xor	edi, edi
   d76bc:      	shld	rdi, r9, cl
   d76c0:      	test	cl, 0x40
   d76c3:      	movzx	r9d, byte ptr [rbx + rsi - 0x1]
   d76c9:      	cmovne	rdi, r10
   d76cd:      	mov	r10, r9
   d76d0:      	shl	r10, cl
   d76d3:      	test	cl, 0x40
   d76d6:      	mov	r11, r10
   d76d9:      	cmovne	r11, rdx
   d76dd:      	shld	rdx, r9, cl
   d76e1:      	test	cl, 0x40
   d76e4:      	cmovne	rdx, r10
   d76e8:      	mov	r9d, esi
   d76eb:      	shr	r9d
   d76ee:      	movzx	r10d, byte ptr [rbx + r9]
   d76f3:      	mov	ecx, r9d
   d76f6:      	shl	ecx, 0x3
   d76f9:      	shl	r10, cl
   d76fc:      	movzx	r14d, byte ptr [rbx]
   d7700:      	or	r10, r14
   d7703:      	or	r10, r11
   d7706:      	movzx	r11d, byte ptr [rax + r9]
   d770b:      	shl	r11, cl
   d770e:      	movzx	eax, byte ptr [rax]
   d7711:      	or	r11, rax
   d7714:      	or	r11, r8
   d7717:      	xor	r11, r10
   d771a:      	xor	rdx, rdi
   d771d:      	mov	qword ptr [rbp - 0x78], rdx
   d7721:      	mov	qword ptr [rbp - 0x80], r11
   d7725:      	movzx	eax, byte ptr [rbp + r9 - 0x80]
   d772b:      	movzx	ecx, byte ptr [rbp + rsi - 0x81]
   d7733:      	mov	byte ptr [rbx], r11b
   d7736:      	mov	byte ptr [rbx + r9], al
   d773a:      	mov	byte ptr [rbx + rsi - 0x1], cl
   d773e:      	xorps	xmm0, xmm0
   d7741:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d7745:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d7749:      	movaps	xmmword ptr [rbp - 0x180], xmm1
   d7750:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d7754:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d7758:      	movaps	xmmword ptr [rbp - 0x170], xmm1
   d775f:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d7763:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d7767:      	movaps	xmmword ptr [rbp - 0x160], xmm1
   d776e:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d7772:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d7776:      	movaps	xmmword ptr [rbp - 0x150], xmm1
   d777d:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d7781:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d7785:      	movaps	xmmword ptr [rbp - 0x140], xmm1
   d778c:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d7790:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d7794:      	movaps	xmmword ptr [rbp - 0x130], xmm1
   d779b:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d779f:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d77a3:      	movaps	xmmword ptr [rbp - 0x120], xmm1
   d77aa:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d77ae:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d77b2:      	movaps	xmmword ptr [rbp - 0x110], xmm1
   d77b9:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d77bd:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d77c1:      	movaps	xmmword ptr [rbp - 0x100], xmm1
   d77c8:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d77cc:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d77d0:      	movaps	xmmword ptr [rbp - 0xf0], xmm1
   d77d7:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d77db:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d77df:      	movaps	xmmword ptr [rbp - 0xe0], xmm1
   d77e6:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d77ea:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d77ee:      	movaps	xmmword ptr [rbp - 0xd0], xmm1
   d77f5:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d77f9:      	movaps	xmm1, xmmword ptr [rbp - 0x40]
   d77fd:      	movaps	xmmword ptr [rbp - 0xc0], xmm1
   d7804:      	movaps	xmmword ptr [rbp - 0x40], xmm0
   d7808:      	movaps	xmm0, xmmword ptr [rbp - 0x40]
   d780c:      	movaps	xmmword ptr [rbp - 0xb0], xmm0
   d7813:      	jmp	0xd6fb5 <<toyos_crypto::gcm::Gcm>::open+0x495>
   d7818:      	call	0xc6c60 <toyos_crypto::arch::x86_64::first_features>
   d781d:      	jmp	0xd6c1a <<toyos_crypto::gcm::Gcm>::open+0xfa>
   d7822:      	lea	rcx, [rip + 0xd0957]    # 0x1a8180 <anon.085b81bcaf6b29d4f376f58b92fe5b78.6.llvm.3285597065436921641+0x48>
   d7829:      	xor	edi, edi
   d782b:      	call	0x19dde0 <core::slice::index::slice_index_fail>
   d7830:      	ud2
   d7832:      	jmp	0xd7838 <<toyos_crypto::gcm::Gcm>::open+0xd18>
   d7834:      	jmp	0xd7838 <<toyos_crypto::gcm::Gcm>::open+0xd18>
   d7836:      	jmp	0xd7838 <<toyos_crypto::gcm::Gcm>::open+0xd18>
   d7838:      	lea	rdi, [rip - 0xb8d06]    # 0x1eb39 <anon.4c9e2aa10fa9f6c769ea14fda4fb0a36.5.llvm.18442525249509278218>
   d783f:      	lea	rcx, [rip + 0xd02f2]    # 0x1a7b38 <anon.4c9e2aa10fa9f6c769ea14fda4fb0a36.1.llvm.18442525249509278218>
   d7846:      	mov	esi, 0x237
   d784b:      	xor	edx, edx
   d784d:      	call	0x19d390 <core::panicking::panic_nounwind_fmt>
   d7852:      	mov	rbx, rax
   d7855:      	lea	rdi, [rbp - 0x180]
   d785c:      	call	0xc63e0 <core::ptr::drop_glue::<toyos_crypto::secret::Secret<14, [u8; 16]>>>
   d7861:      	mov	rdi, rbx
   d7864:      	call	0x197cb0 <_Unwind_Resume>
   d7869:      	call	0x19d33a <core::panicking::panic_in_cleanup>
   d786e:      	int3
   d786f:      	int3
