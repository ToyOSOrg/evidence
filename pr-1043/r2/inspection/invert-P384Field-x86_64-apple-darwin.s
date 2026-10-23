0000000000001870 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_>:
    1870:	push   rbp
    1871:	mov    rbp,rsp
    1874:	push   r15
    1876:	push   r14
    1878:	push   r13
    187a:	push   r12
    187c:	push   rbx
    187d:	sub    rsp,0x148
    1884:	mov    QWORD PTR [rbp-0xd8],rdi
    188b:	movabs r8,0x3fffffffffffffff
    1895:	mov    QWORD PTR [rbp-0x108],r8
    189c:	mov    QWORD PTR [rbp-0x110],r8
    18a3:	mov    QWORD PTR [rbp-0x118],r8
    18aa:	movabs rax,0x3fffffffffffffef
    18b4:	mov    QWORD PTR [rbp-0x120],rax
    18bb:	movabs rax,0x3ffffffc00000000
    18c5:	mov    QWORD PTR [rbp-0x128],rax
    18cc:	mov    eax,0xffffffff
    18d1:	mov    QWORD PTR [rbp-0x130],rax
    18d8:	mov    QWORD PTR [rbp-0x100],0xfff
    18e3:	mov    rax,QWORD PTR [rsi]
    18e6:	mov    rcx,rax
    18e9:	and    rcx,r8
    18ec:	mov    QWORD PTR [rbp-0x98],rcx
    18f3:	mov    rcx,QWORD PTR [rsi+0x8]
    18f7:	shrd   rax,rcx,0x3e
    18fc:	and    rax,r8
    18ff:	mov    rdi,QWORD PTR [rsi+0x10]
    1903:	shrd   rcx,rdi,0x3c
    1908:	mov    QWORD PTR [rbp-0x90],rax
    190f:	and    rcx,r8
    1912:	mov    QWORD PTR [rbp-0x88],rcx
    1919:	mov    rax,QWORD PTR [rsi+0x18]
    191d:	shrd   rdi,rax,0x3a
    1922:	and    rdi,r8
    1925:	mov    QWORD PTR [rbp-0x80],rdi
    1929:	mov    rcx,QWORD PTR [rsi+0x20]
    192d:	shrd   rax,rcx,0x38
    1932:	and    rax,r8
    1935:	mov    QWORD PTR [rbp-0x78],rax
    1939:	mov    rax,QWORD PTR [rsi+0x28]
    193d:	shrd   rcx,rax,0x36
    1942:	and    rcx,r8
    1945:	mov    QWORD PTR [rbp-0x70],rcx
    1949:	shr    rax,0x34
    194d:	mov    QWORD PTR [rbp-0x68],rax
    1951:	xorps  xmm0,xmm0
    1954:	movaps XMMWORD PTR [rbp-0xb0],xmm0
    195b:	movaps XMMWORD PTR [rbp-0xc0],xmm0
    1962:	movaps XMMWORD PTR [rbp-0xd0],xmm0
    1969:	mov    QWORD PTR [rbp-0xa0],0x0
    1974:	mov    rax,QWORD PTR [rdx]
    1977:	mov    rcx,rax
    197a:	and    rcx,r8
    197d:	mov    QWORD PTR [rbp-0x168],rcx
    1984:	mov    rcx,QWORD PTR [rdx+0x8]
    1988:	shrd   rax,rcx,0x3e
    198d:	and    rax,r8
    1990:	mov    rsi,QWORD PTR [rdx+0x10]
    1994:	shrd   rcx,rsi,0x3c
    1999:	mov    QWORD PTR [rbp-0x160],rax
    19a0:	and    rcx,r8
    19a3:	mov    QWORD PTR [rbp-0x158],rcx
    19aa:	mov    rax,QWORD PTR [rdx+0x18]
    19ae:	shrd   rsi,rax,0x3a
    19b3:	and    rsi,r8
    19b6:	mov    QWORD PTR [rbp-0x150],rsi
    19bd:	mov    rcx,QWORD PTR [rdx+0x20]
    19c1:	shrd   rax,rcx,0x38
    19c6:	and    rax,r8
    19c9:	mov    QWORD PTR [rbp-0x148],rax
    19d0:	mov    r15,QWORD PTR [rdx+0x28]
    19d4:	shrd   rcx,r15,0x36
    19d9:	and    rcx,r8
    19dc:	mov    QWORD PTR [rbp-0x140],rcx
    19e3:	shr    r15,0x34
    19e7:	mov    QWORD PTR [rbp-0x138],r15
    19ee:	mov    rbx,0xffffffffffffffff
    19f5:	xor    r11d,r11d
    19f8:	mov    QWORD PTR [rbp-0x60],0x0
    1a00:	mov    QWORD PTR [rbp-0x38],r11
    1a04:	mov    QWORD PTR [rbp-0x40],r15
    1a08:	mov    r9,QWORD PTR [rbp-0x130]
    1a0f:	mov    r10d,0x1
    1a15:	mov    eax,0x3e
    1a1a:	mov    r11,QWORD PTR [rbp-0x98]
    1a21:	mov    rsi,r9
    1a24:	mov    rcx,r11
    1a27:	xor    r12d,r12d
    1a2a:	xor    r15d,r15d
    1a2d:	mov    r14d,0x1
    1a33:	cs nop WORD PTR [rax+rax*1+0x0]
    1a3d:	nop    DWORD PTR [rax]
    1a40:	mov    QWORD PTR [rbp-0x30],r14
    1a44:	mov    rdx,rsi
    1a47:	mov    esi,ecx
    1a49:	and    esi,0x1
    1a4c:	neg    rsi
    1a4f:	mov    rdi,rbx
    1a52:	mov    r14,rbx
    1a55:	sar    r14,0x3f
    1a59:	mov    rbx,r14
    1a5c:	and    rbx,rsi
    1a5f:	mov    r13,r15
    1a62:	mov    r15,r14
    1a65:	xor    r15,r10
    1a68:	and    r15,rsi
    1a6b:	xor    r14,r12
    1a6e:	and    r14,rsi
    1a71:	mov    r8,rsi
    1a74:	and    r8,rdx
    1a77:	add    r8,rcx
    1a7a:	lea    rcx,[rdx+rdx*1]
    1a7e:	and    rcx,rbx
    1a81:	sub    r8,rcx
    1a84:	sub    r15,rbx
    1a87:	add    r13,r15
    1a8a:	mov    r15,r13
    1a8d:	sub    r14,rbx
    1a90:	add    QWORD PTR [rbp-0x30],r14
    1a94:	mov    r14,QWORD PTR [rbp-0x30]
    1a98:	mov    rsi,r8
    1a9b:	and    rsi,rbx
    1a9e:	add    rsi,rdx
    1aa1:	shr    r8,1
    1aa4:	mov    rcx,r13
    1aa7:	and    rcx,rbx
    1aaa:	add    r10,rcx
    1aad:	add    r10,r10
    1ab0:	mov    rcx,r14
    1ab3:	and    rcx,rbx
    1ab6:	add    r12,rcx
    1ab9:	add    r12,r12
    1abc:	xor    rdi,rbx
    1abf:	not    rbx
    1ac2:	add    rbx,rdi
    1ac5:	mov    rcx,r8
    1ac8:	dec    eax
    1aca:	jne    1a40 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_+0x1d0>
    1ad0:	mov    rax,r12
    1ad3:	imul   r11
    1ad6:	mov    rsi,rdx
    1ad9:	mov    rdi,rax
    1adc:	mov    rax,r10
    1adf:	imul   r9
    1ae2:	mov    rcx,rdx
    1ae5:	mov    r8,rax
    1ae8:	add    r8,rdi
    1aeb:	adc    rcx,rsi
    1aee:	mov    rax,r14
    1af1:	imul   r11
    1af4:	mov    rsi,rdx
    1af7:	mov    rdi,rax
    1afa:	mov    rax,r15
    1afd:	imul   r9
    1b00:	mov    r15,rdx
    1b03:	add    rax,rdi
    1b06:	adc    r15,rsi
    1b09:	mov    rdx,r8
    1b0c:	or     rdx,rax
    1b0f:	shl    rdx,0x2
    1b13:	test   rdx,rdx
    1b16:	jne    20ce <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_+0x85e>
    1b1c:	mov    r11,r8
    1b1f:	mov    QWORD PTR [rbp-0xe8],rbx
    1b26:	inc    QWORD PTR [rbp-0x60]
    1b2a:	shrd   rax,r15,0x3e
    1b2f:	sar    r15,0x3e
    1b33:	shrd   r11,rcx,0x3e
    1b38:	sar    rcx,0x3e
    1b3c:	mov    r8d,0x1
    1b42:	mov    QWORD PTR [rbp-0x50],r12
    1b46:	mov    QWORD PTR [rbp-0x48],r13
    1b4a:	mov    QWORD PTR [rbp-0x30],r14
    1b4e:	mov    r14,rax
    1b51:	cs nop WORD PTR [rax+rax*1+0x0]
    1b5b:	nop    DWORD PTR [rax+rax*1+0x0]
    1b60:	mov    r9,QWORD PTR [rbp+r8*8-0x130]
    1b68:	mov    rax,r9
    1b6b:	imul   r10
    1b6e:	mov    rdi,rax
    1b71:	mov    rsi,rdx
    1b74:	mov    r12,QWORD PTR [rbp+r8*8-0x98]
    1b7c:	mov    rax,r12
    1b7f:	imul   QWORD PTR [rbp-0x50]
    1b83:	add    rdi,r11
    1b86:	adc    rsi,rcx
    1b89:	add    rdi,rax
    1b8c:	adc    rsi,rdx
    1b8f:	mov    r11,rdi
    1b92:	movabs rax,0x3fffffffffffffff
    1b9c:	and    r11,rax
    1b9f:	mov    rax,r9
    1ba2:	imul   QWORD PTR [rbp-0x48]
    1ba6:	mov    rbx,rdx
    1ba9:	mov    rcx,rax
    1bac:	mov    rax,r12
    1baf:	imul   QWORD PTR [rbp-0x30]
    1bb3:	add    rcx,r14
    1bb6:	adc    rbx,r15
    1bb9:	add    rcx,rax
    1bbc:	adc    rbx,rdx
    1bbf:	mov    QWORD PTR [rbp+r8*8-0x138],r11
    1bc7:	mov    r14,rbx
    1bca:	shld   r14,rcx,0x2
    1bcf:	movabs rax,0x3fffffffffffffff
    1bd9:	and    rcx,rax
    1bdc:	mov    QWORD PTR [rbp+r8*8-0xa0],rcx
    1be4:	mov    r11,rdi
    1be7:	inc    r8
    1bea:	sar    rbx,0x3e
    1bee:	shrd   r11,rsi,0x3e
    1bf3:	sar    rsi,0x3e
    1bf7:	mov    rcx,rsi
    1bfa:	mov    r15,rbx
    1bfd:	cmp    r8,0x7
    1c01:	jne    1b60 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_+0x2f0>
    1c07:	mov    rcx,QWORD PTR [rbp-0x38]
    1c0b:	sar    rcx,0x3f
    1c0f:	mov    rbx,QWORD PTR [rbp-0x40]
    1c13:	sar    rbx,0x3f
    1c17:	mov    rax,rcx
    1c1a:	and    rax,r10
    1c1d:	mov    r8,rbx
    1c20:	mov    rdx,QWORD PTR [rbp-0x50]
    1c24:	and    r8,rdx
    1c27:	add    r8,rax
    1c2a:	mov    r12,QWORD PTR [rbp-0x48]
    1c2e:	and    rcx,r12
    1c31:	mov    r9,QWORD PTR [rbp-0x30]
    1c35:	and    rbx,r9
    1c38:	add    rbx,rcx
    1c3b:	mov    rcx,QWORD PTR [rbp-0xd0]
    1c42:	mov    rdi,QWORD PTR [rbp-0x168]
    1c49:	mov    rax,rdi
    1c4c:	imul   rdx
    1c4f:	mov    QWORD PTR [rbp-0x38],rdx
    1c53:	mov    QWORD PTR [rbp-0x58],r11
    1c57:	mov    r11,rax
    1c5a:	mov    rax,rcx
    1c5d:	imul   r10
    1c60:	mov    r15,rdx
    1c63:	mov    rsi,rax
    1c66:	add    rsi,r11
    1c69:	adc    r15,QWORD PTR [rbp-0x38]
    1c6d:	mov    rax,rdi
    1c70:	imul   r9
    1c73:	mov    rdi,rdx
    1c76:	mov    r9,rax
    1c79:	mov    rax,rcx
    1c7c:	imul   r12
    1c7f:	mov    r12,rdx
    1c82:	mov    rcx,rax
    1c85:	add    rcx,r9
    1c88:	adc    r12,rdi
    1c8b:	mov    rax,rsi
    1c8e:	movabs rdx,0x3ffffffeffffffff
    1c98:	imul   rax,rdx
    1c9c:	add    rax,r8
    1c9f:	movabs rdi,0x3fffffffffffffff
    1ca9:	and    rax,rdi
    1cac:	sub    r8,rax
    1caf:	mov    rax,rcx
    1cb2:	imul   rax,rdx
    1cb6:	add    rax,rbx
    1cb9:	and    rax,rdi
    1cbc:	sub    rbx,rax
    1cbf:	mov    r9,r8
    1cc2:	mov    rax,r8
    1cc5:	mov    r8d,0xffffffff
    1ccb:	imul   r8
    1cce:	mov    rdi,rdx
    1cd1:	mov    r11,rax
    1cd4:	add    r11,rsi
    1cd7:	adc    rdi,r15
    1cda:	mov    rax,rbx
    1cdd:	imul   r8
    1ce0:	mov    r15,rax
    1ce3:	add    r15,rcx
    1ce6:	mov    rax,QWORD PTR [rbp-0x58]
    1cea:	mov    QWORD PTR [rbp-0x100],rax
    1cf1:	mov    QWORD PTR [rbp-0x68],r14
    1cf5:	adc    rdx,r12
    1cf8:	mov    rax,r11
    1cfb:	or     rax,r15
    1cfe:	shl    rax,0x2
    1d02:	test   rax,rax
    1d05:	jne    20e6 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_+0x876>
    1d0b:	mov    QWORD PTR [rbp-0xe0],r14
    1d12:	shrd   r15,rdx,0x3e
    1d17:	sar    rdx,0x3e
    1d1b:	shrd   r11,rdi,0x3e
    1d20:	sar    rdi,0x3e
    1d24:	mov    r8d,0x1
    1d2a:	mov    QWORD PTR [rbp-0x40],rbx
    1d2e:	mov    QWORD PTR [rbp-0xf0],r9
    1d35:	cs nop WORD PTR [rax+rax*1+0x0]
    1d3f:	nop
    1d40:	mov    QWORD PTR [rbp-0x38],rdx
    1d44:	mov    r12,QWORD PTR [rbp+r8*8-0xd0]
    1d4c:	mov    rax,r12
    1d4f:	imul   r10
    1d52:	mov    rsi,rax
    1d55:	mov    rcx,rdx
    1d58:	mov    rbx,QWORD PTR [rbp+r8*8-0x168]
    1d60:	mov    rax,rbx
    1d63:	imul   QWORD PTR [rbp-0x50]
    1d67:	mov    r13,r10
    1d6a:	mov    r10,rax
    1d6d:	mov    r14,rdx
    1d70:	lea    rax,[rip+0x0]        # 1d77 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_+0x507>
    1d77:	mov    r9,QWORD PTR [rax+r8*8]
    1d7b:	mov    rax,r9
    1d7e:	imul   QWORD PTR [rbp-0xf0]
    1d85:	add    rsi,r11
    1d88:	adc    rcx,rdi
    1d8b:	add    rsi,r10
    1d8e:	mov    r10,r13
    1d91:	adc    rcx,r14
    1d94:	add    rsi,rax
    1d97:	adc    rcx,rdx
    1d9a:	mov    r14,rsi
    1d9d:	mov    rax,r12
    1da0:	imul   QWORD PTR [rbp-0x48]
    1da4:	mov    r12,rdx
    1da7:	mov    rdi,rax
    1daa:	mov    rax,rbx
    1dad:	imul   QWORD PTR [rbp-0x30]
    1db1:	mov    r11,rdx
    1db4:	mov    rbx,rax
    1db7:	mov    rax,r9
    1dba:	imul   QWORD PTR [rbp-0x40]
    1dbe:	movabs r9,0x3fffffffffffffff
    1dc8:	and    r14,r9
    1dcb:	add    rdi,r15
    1dce:	adc    r12,QWORD PTR [rbp-0x38]
    1dd2:	add    rdi,rbx
    1dd5:	adc    r12,r11
    1dd8:	add    rdi,rax
    1ddb:	adc    r12,rdx
    1dde:	mov    QWORD PTR [rbp+r8*8-0xd8],r14
    1de6:	mov    r15,r12
    1de9:	shld   r15,rdi,0x2
    1dee:	and    rdi,r9
    1df1:	mov    QWORD PTR [rbp+r8*8-0x170],rdi
    1df9:	mov    r11,rsi
    1dfc:	inc    r8
    1dff:	sar    r12,0x3e
    1e03:	shrd   r11,rcx,0x3e
    1e08:	sar    rcx,0x3e
    1e0c:	mov    rdi,rcx
    1e0f:	mov    rdx,r12
    1e12:	cmp    r8,0x7
    1e16:	jne    1d40 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_+0x4d0>
    1e1c:	mov    QWORD PTR [rbp-0xa0],r11
    1e23:	mov    QWORD PTR [rbp-0x138],r15
    1e2a:	cmp    QWORD PTR [rbp-0x60],0x12
    1e2f:	movabs r12,0x3fffffffffffffff
    1e39:	mov    rbx,QWORD PTR [rbp-0xe8]
    1e40:	jne    1a00 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_+0x190>
    1e46:	mov    rax,QWORD PTR [rbp-0x90]
    1e4d:	or     rax,QWORD PTR [rbp-0x98]
    1e54:	or     rax,QWORD PTR [rbp-0x88]
    1e5b:	or     rax,QWORD PTR [rbp-0x80]
    1e5f:	or     rax,QWORD PTR [rbp-0x78]
    1e63:	or     rax,QWORD PTR [rbp-0x70]
    1e67:	or     rax,QWORD PTR [rbp-0xe0]
    1e6e:	mov    QWORD PTR [rbp-0xf8],rax
    1e75:	jne    20fe <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_+0x88e>
    1e7b:	mov    rcx,r11
    1e7e:	sar    rcx,0x3f
    1e82:	mov    r8d,ecx
    1e85:	add    r8,QWORD PTR [rbp-0xd0]
    1e8c:	mov    rax,r8
    1e8f:	sar    rax,0x3e
    1e93:	add    rax,QWORD PTR [rbp-0xc8]
    1e9a:	mov    r10,rcx
    1e9d:	movabs r15,0x3ffffffc00000000
    1ea7:	and    r10,r15
    1eaa:	add    r10,rax
    1ead:	mov    rdx,r10
    1eb0:	sar    rdx,0x3e
    1eb4:	add    rdx,QWORD PTR [rbp-0xc0]
    1ebb:	lea    rax,[r12-0x10]
    1ec0:	mov    r9,rcx
    1ec3:	and    r9,rax
    1ec6:	add    r9,rdx
    1ec9:	mov    rdx,r9
    1ecc:	sar    rdx,0x3e
    1ed0:	add    rdx,QWORD PTR [rbp-0xb8]
    1ed7:	mov    rbx,r11
    1eda:	mov    r11,rcx
    1edd:	and    r11,r12
    1ee0:	add    rdx,r11
    1ee3:	mov    rsi,rdx
    1ee6:	sar    rsi,0x3e
    1eea:	add    rsi,QWORD PTR [rbp-0xb0]
    1ef1:	add    rsi,r11
    1ef4:	mov    rdi,rsi
    1ef7:	sar    rdi,0x3e
    1efb:	add    rdi,QWORD PTR [rbp-0xa8]
    1f02:	add    rdi,r11
    1f05:	and    r8,r12
    1f08:	and    r10,r12
    1f0b:	and    r9,r12
    1f0e:	and    rdx,r12
    1f11:	and    rsi,r12
    1f14:	and    ecx,0xfff
    1f1a:	add    rcx,rbx
    1f1d:	mov    r11,rdi
    1f20:	sar    r11,0x3e
    1f24:	and    rdi,r12
    1f27:	add    rcx,r11
    1f2a:	mov    rbx,QWORD PTR [rbp-0x58]
    1f2e:	sar    rbx,0x3f
    1f32:	xor    r8,rbx
    1f35:	sub    r8,rbx
    1f38:	mov    r11,r8
    1f3b:	sar    r11,0x3e
    1f3f:	and    r8,r12
    1f42:	xor    r10,rbx
    1f45:	sub    r10,rbx
    1f48:	add    r10,r11
    1f4b:	mov    r11,r10
    1f4e:	sar    r11,0x3e
    1f52:	xor    r9,rbx
    1f55:	sub    r9,rbx
    1f58:	add    r9,r11
    1f5b:	mov    r11,r9
    1f5e:	sar    r11,0x3e
    1f62:	xor    rdx,rbx
    1f65:	sub    rdx,rbx
    1f68:	add    rdx,r11
    1f6b:	mov    r11,rdx
    1f6e:	sar    r11,0x3e
    1f72:	xor    rsi,rbx
    1f75:	sub    rsi,rbx
    1f78:	add    rsi,r11
    1f7b:	mov    r11,rsi
    1f7e:	sar    r11,0x3e
    1f82:	xor    rdi,rbx
    1f85:	sub    rdi,rbx
    1f88:	add    rdi,r11
    1f8b:	mov    r11,rdi
    1f8e:	sar    r11,0x3e
    1f92:	xor    rcx,rbx
    1f95:	sub    rcx,rbx
    1f98:	add    rcx,r11
    1f9b:	mov    rbx,rcx
    1f9e:	sar    rbx,0x3f
    1fa2:	mov    r14d,ebx
    1fa5:	mov    r11d,ebx
    1fa8:	add    r11,r8
    1fab:	and    r10,r12
    1fae:	mov    r8,r11
    1fb1:	shr    r8,0x3e
    1fb5:	add    r8,r10
    1fb8:	and    r9,r12
    1fbb:	and    r15,rbx
    1fbe:	add    r15,r8
    1fc1:	and    rax,rbx
    1fc4:	add    rax,r9
    1fc7:	mov    r9,r15
    1fca:	shr    r9,0x3e
    1fce:	add    rax,r9
    1fd1:	and    rdx,r12
    1fd4:	and    rsi,r12
    1fd7:	and    rdi,r12
    1fda:	and    r11,r12
    1fdd:	and    rbx,r12
    1fe0:	mov    r9,rax
    1fe3:	shr    r9,0x3e
    1fe7:	add    rdx,rbx
    1fea:	add    rdx,r9
    1fed:	mov    r9,rdx
    1ff0:	shr    r9,0x3e
    1ff4:	add    rsi,rbx
    1ff7:	add    rsi,r9
    1ffa:	add    rbx,rdi
    1ffd:	mov    rdi,rsi
    2000:	shr    rdi,0x3e
    2004:	add    rbx,rdi
    2007:	mov    rdi,rbx
    200a:	shr    rdi,0x3e
    200e:	add    ecx,r14d
    2011:	add    ecx,edi
    2013:	shl    rcx,0x34
    2017:	mov    r9,rbx
    201a:	shr    r9,0xa
    201e:	movabs rdi,0xfffffffffffff
    2028:	and    rdi,r9
    202b:	or     rdi,rcx
    202e:	shl    rbx,0x36
    2032:	mov    r9,rsi
    2035:	shr    r9,0x8
    2039:	movabs rcx,0x3fffffffffffff
    2043:	and    rcx,r9
    2046:	or     rcx,rbx
    2049:	shl    rsi,0x38
    204d:	mov    r10,rdx
    2050:	shr    r10,0x6
    2054:	movabs r9,0xffffffffffffff
    205e:	and    r9,r10
    2061:	or     r9,rsi
    2064:	mov    rsi,rax
    2067:	shr    rsi,0x4
    206b:	movabs r10,0x3ffffffffffffff
    2075:	and    r10,rsi
    2078:	shl    rdx,0x3a
    207c:	or     r10,rdx
    207f:	shr    r15,0x2
    2083:	movabs rdx,0xfffffffffffffff
    208d:	and    rdx,r15
    2090:	shl    rax,0x3c
    2094:	or     rdx,rax
    2097:	shl    r8,0x3e
    209b:	or     r8,r11
    209e:	mov    rax,QWORD PTR [rbp-0xd8]
    20a5:	mov    QWORD PTR [rax],r8
    20a8:	mov    QWORD PTR [rax+0x8],rdx
    20ac:	mov    QWORD PTR [rax+0x10],r10
    20b0:	mov    QWORD PTR [rax+0x18],r9
    20b4:	mov    QWORD PTR [rax+0x20],rcx
    20b8:	mov    QWORD PTR [rax+0x28],rdi
    20bc:	add    rsp,0x148
    20c3:	pop    rbx
    20c4:	pop    r12
    20c6:	pop    r13
    20c8:	pop    r14
    20ca:	pop    r15
    20cc:	pop    rbp
    20cd:	ret
    20ce:	lea    rdi,[rip+0x0]        # 20d5 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_+0x865>
    20d5:	lea    rdx,[rip+0x0]        # 20dc <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_+0x86c>
    20dc:	mov    esi,0x40
    20e1:	call   20e6 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_+0x876>
    20e6:	lea    rdi,[rip+0x0]        # 20ed <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_+0x87d>
    20ed:	lea    rdx,[rip+0x0]        # 20f4 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_+0x884>
    20f4:	mov    esi,0x40
    20f9:	call   20fe <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_+0x88e>
    20fe:	lea    rdx,[rip+0x903]        # 2a08 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384OrderKj6_EB6_+0x8d8>
    2105:	lea    rcx,[rip+0x0]        # 210c <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_+0x89c>
    210c:	lea    r9,[rip+0x0]        # 2113 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_+0x8a3>
    2113:	lea    rsi,[rbp-0xf8]
    211a:	mov    r8d,0x2f
    2120:	xor    edi,edi
    2122:	call   2127 <__RINvNtNtCsgH5pGWrFjzB_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_+0x8b7>
    2127:	nop    WORD PTR [rax+rax*1+0x0]
