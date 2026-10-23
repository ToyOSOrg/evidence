000000000007dcf4 <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<sshserver::OsRandom>>:
   7dcf4:      	stp	x29, x30, [sp, #-0x30]!
   7dcf8:      	stp	x28, x21, [sp, #0x10]
   7dcfc:      	stp	x20, x19, [sp, #0x20]
   7dd00:      	mov	x29, sp
   7dd04:      	sub	sp, sp, #0x930
   7dd08:      	movi	v0.2d, #0000000000000000
   7dd0c:      	mov	x20, x0
   7dd10:      	mov	x19, x8
   7dd14:      	str	xzr, [sp]
   7dd18:      	stp	q0, q0, [sp]
   7dd1c:      	mov	x0, sp
   7dd20:      	mov	w1, #0x20               // =32
   7dd24:      	bl	0x863a0 <toyos_abi::syscall::random>
   7dd28:      	cmn	x0, #0x1
   7dd2c:      	b.eq	0x7dd3c <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<sshserver::OsRandom>+0x48>
   7dd30:      	mov	w8, #0x701              // =1793
   7dd34:      	strh	w8, [x19]
   7dd38:      	b	0x7de1c <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<sshserver::OsRandom>+0x128>
   7dd3c:      	mov	w8, #0x4a0              // =1184
   7dd40:      	str	x20, [sp, #0x4c0]
   7dd44:      	str	x8, [sp, #0x4c8]
   7dd48:      	add	x8, sp, #0x20
   7dd4c:      	add	x0, sp, #0x4c0
   7dd50:      	mov	w1, #0x1                // =1
   7dd54:      	add	x21, sp, #0x20
   7dd58:      	bl	0xa27e4 <toyos_crypto::keccak::h>
   7dd5c:      	mov	x8, sp
   7dd60:      	mov	w9, #0x20               // =32
   7dd64:      	stp	x8, x9, [sp, #0x80]
   7dd68:      	stp	x21, x9, [sp, #0x90]
   7dd6c:      	add	x8, sp, #0x4c0
   7dd70:      	add	x0, sp, #0x80
   7dd74:      	mov	w1, #0x2                // =2
   7dd78:      	bl	0xa2700 <toyos_crypto::keccak::g>
   7dd7c:      	ldr	q0, [sp, #0x4c0]
   7dd80:      	ldr	q1, [sp, #0x4d0]
   7dd84:      	add	x21, sp, #0x40
   7dd88:      	ldr	q2, [sp, #0x4f0]
   7dd8c:      	stp	q0, q1, [sp, #0x40]
   7dd90:      	ldr	q0, [sp, #0x4e0]
   7dd94:      	stp	q0, q2, [sp, #0x60]
   7dd98:      	add	x8, sp, #0x80
   7dd9c:      	mov	x1, sp
   7dda0:      	add	x2, x21, #0x20
   7dda4:      	mov	x0, x20
   7dda8:      	bl	0x9c294 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>
   7ddac:      	add	x0, sp, #0x4c0
   7ddb0:      	add	x1, sp, #0x80
   7ddb4:      	mov	w2, #0x440              // =1088
   7ddb8:      	bl	0x1086b4 <memcpy>
   7ddbc:      	ldp	q0, q1, [sp, #0x40]
   7ddc0:      	add	x0, x19, #0x1
   7ddc4:      	add	x1, sp, #0x4c0
   7ddc8:      	mov	w2, #0x460              // =1120
   7ddcc:      	str	q0, [sp, #0x900]
   7ddd0:      	str	q1, [sp, #0x910]
   7ddd4:      	bl	0x1086b4 <memcpy>
   7ddd8:      	strb	wzr, [x19]
   7dddc:      	str	xzr, [sp, #0x4c8]
   7dde0:      	str	xzr, [sp, #0x4c0]
   7dde4:      	ldr	q0, [sp, #0x4c0]
   7dde8:      	str	q0, [sp, #0x40]
   7ddec:      	str	xzr, [sp, #0x4c8]
   7ddf0:      	str	xzr, [sp, #0x4c0]
   7ddf4:      	ldr	q0, [sp, #0x4c0]
   7ddf8:      	str	q0, [sp, #0x50]
   7ddfc:      	str	xzr, [sp, #0x4c8]
   7de00:      	str	xzr, [sp, #0x4c0]
   7de04:      	ldr	q0, [sp, #0x4c0]
   7de08:      	stur	q0, [x21, #0x20]
   7de0c:      	str	xzr, [sp, #0x4c8]
   7de10:      	str	xzr, [sp, #0x4c0]
   7de14:      	ldr	q0, [sp, #0x4c0]
   7de18:      	str	q0, [sp, #0x70]
   7de1c:      	str	xzr, [sp, #0x4c8]
   7de20:      	str	xzr, [sp, #0x4c0]
   7de24:      	ldr	q0, [sp, #0x4c0]
   7de28:      	str	q0, [sp]
   7de2c:      	str	xzr, [sp, #0x4c8]
   7de30:      	str	xzr, [sp, #0x4c0]
   7de34:      	ldr	q0, [sp, #0x4c0]
   7de38:      	str	q0, [sp, #0x10]
   7de3c:      	add	sp, sp, #0x930
   7de40:      	ldp	x20, x19, [sp, #0x20]
   7de44:      	ldp	x28, x21, [sp, #0x10]
   7de48:      	ldp	x29, x30, [sp], #0x30
   7de4c:      	ret
   7de50:      	str	xzr, [sp, #0x4c8]
   7de54:      	str	xzr, [sp, #0x4c0]
   7de58:      	ldr	q0, [sp, #0x4c0]
   7de5c:      	str	q0, [sp, #0x40]
   7de60:      	str	xzr, [sp, #0x4c8]
   7de64:      	str	xzr, [sp, #0x4c0]
   7de68:      	ldr	q0, [sp, #0x4c0]
   7de6c:      	str	q0, [sp, #0x50]
   7de70:      	str	xzr, [sp, #0x4c8]
   7de74:      	str	xzr, [sp, #0x4c0]
   7de78:      	ldr	q0, [sp, #0x4c0]
   7de7c:      	stur	q0, [x21, #0x20]
   7de80:      	str	xzr, [sp, #0x4c8]
   7de84:      	str	xzr, [sp, #0x4c0]
   7de88:      	ldr	q0, [sp, #0x4c0]
   7de8c:      	str	q0, [sp, #0x70]
   7de90:      	b	0x7de94 <<toyos_crypto::mlkem::EncapsulationKey>::encapsulate::<sshserver::OsRandom>+0x1a0>
   7de94:      	stp	xzr, xzr, [x29, #-0x10]
   7de98:      	ldur	q0, [x29, #-0x10]
   7de9c:      	str	q0, [sp]
   7dea0:      	stp	xzr, xzr, [x29, #-0x10]
   7dea4:      	ldur	q0, [x29, #-0x10]
   7dea8:      	str	q0, [sp, #0x10]
   7deac:      	bl	0xfde68 <_Unwind_Resume>

000000000009c0c0 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>:
   9c0c0:      	stp	x29, x30, [sp, #-0x10]!
   9c0c4:      	mov	x29, sp
   9c0c8:      	ldp	x9, x8, [x0, #0x8]
   9c0cc:      	cmp	x8, x9
   9c0d0:      	b.hi	0x9c110 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x50>
   9c0d4:      	cbz	x8, 0x9c108 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x48>
   9c0d8:      	ldr	x9, [x0]
   9c0dc:      	mov	x10, xzr
   9c0e0:      	mov	x11, xzr
   9c0e4:      	mov	x12, x11
   9c0e8:      	add	x11, x11, #0x2
   9c0ec:      	cmp	x11, #0x200
   9c0f0:      	strh	wzr, [x9, x12]
   9c0f4:      	b.ne	0x9c0e4 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x24>
   9c0f8:      	add	x10, x10, #0x1
   9c0fc:      	add	x9, x9, #0x200
   9c100:      	cmp	x10, x8
   9c104:      	b.ne	0x9c0e0 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>+0x20>
   9c108:      	ldp	x29, x30, [sp], #0x10
   9c10c:      	ret
   9c110:      	nop
   9c114:      	adr	x0, 0x28a86 <toyos_crypto::ed25519::B_ODD+0x13ae>
   9c118:      	nop
   9c11c:      	adr	x3, 0x11b3a8 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x2e0>
   9c120:      	mov	w1, #0x1b5              // =437
   9c124:      	mov	w2, wzr
   9c128:      	bl	0x103418 <core::panicking::panic_nounwind_fmt>

000000000009c12c <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes>:
   9c12c:      	stp	x29, x30, [sp, #-0x30]!
   9c130:      	stp	x28, x21, [sp, #0x10]
   9c134:      	stp	x20, x19, [sp, #0x20]
   9c138:      	mov	x29, sp
   9c13c:      	sub	sp, sp, #0x200
   9c140:      	cmp	x1, #0x4a0
   9c144:      	mov	x19, x8
   9c148:      	b.ne	0x9c180 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x54>
   9c14c:      	mov	x8, sp
   9c150:      	mov	w1, #0x180              // =384
   9c154:      	mov	x20, x0
   9c158:      	mov	x21, sp
   9c15c:      	bl	0x9dd18 <<toyos_crypto::mlkem::Poly>::decode::<12>>
   9c160:      	mov	x8, xzr
   9c164:      	cmp	x8, #0x200
   9c168:      	b.eq	0x9c18c <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x60>
   9c16c:      	ldrsh	w9, [x21, x8]
   9c170:      	add	x8, x8, #0x2
   9c174:      	cmp	w9, #0xd00
   9c178:      	b.le	0x9c164 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x38>
   9c17c:      	b	0x9c228 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0xfc>
   9c180:      	mov	w8, #0x1                // =1
   9c184:      	strh	w8, [x19]
   9c188:      	b	0x9c24c <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x120>
   9c18c:      	mov	x8, xzr
   9c190:      	mov	x9, sp
   9c194:      	mov	x10, x8
   9c198:      	add	x8, x8, #0x2
   9c19c:      	cmp	x8, #0x200
   9c1a0:      	strh	wzr, [x9, x10]
   9c1a4:      	b.ne	0x9c194 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x68>
   9c1a8:      	mov	x8, sp
   9c1ac:      	add	x0, x20, #0x180
   9c1b0:      	mov	w1, #0x180              // =384
   9c1b4:      	mov	x21, sp
   9c1b8:      	bl	0x9dd18 <<toyos_crypto::mlkem::Poly>::decode::<12>>
   9c1bc:      	mov	x8, xzr
   9c1c0:      	cmp	x8, #0x200
   9c1c4:      	b.eq	0x9c1dc <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0xb0>
   9c1c8:      	ldrsh	w9, [x21, x8]
   9c1cc:      	add	x8, x8, #0x2
   9c1d0:      	cmp	w9, #0xd00
   9c1d4:      	b.le	0x9c1c0 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x94>
   9c1d8:      	b	0x9c228 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0xfc>
   9c1dc:      	mov	x8, xzr
   9c1e0:      	mov	x9, sp
   9c1e4:      	mov	x10, x8
   9c1e8:      	add	x8, x8, #0x2
   9c1ec:      	cmp	x8, #0x200
   9c1f0:      	strh	wzr, [x9, x10]
   9c1f4:      	b.ne	0x9c1e4 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0xb8>
   9c1f8:      	mov	x8, sp
   9c1fc:      	add	x0, x20, #0x300
   9c200:      	mov	w1, #0x180              // =384
   9c204:      	mov	x21, sp
   9c208:      	bl	0x9dd18 <<toyos_crypto::mlkem::Poly>::decode::<12>>
   9c20c:      	mov	x8, xzr
   9c210:      	cmp	x8, #0x200
   9c214:      	b.eq	0x9c260 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x134>
   9c218:      	ldrsh	w9, [x21, x8]
   9c21c:      	add	x8, x8, #0x2
   9c220:      	cmp	w9, #0xd00
   9c224:      	b.le	0x9c210 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0xe4>
   9c228:      	mov	w9, #0x201              // =513
   9c22c:      	mov	x8, xzr
   9c230:      	strh	w9, [x19]
   9c234:      	mov	x9, sp
   9c238:      	mov	x10, x8
   9c23c:      	add	x8, x8, #0x2
   9c240:      	cmp	x8, #0x200
   9c244:      	strh	wzr, [x9, x10]
   9c248:      	b.ne	0x9c238 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x10c>
   9c24c:      	add	sp, sp, #0x200
   9c250:      	ldp	x20, x19, [sp, #0x20]
   9c254:      	ldp	x28, x21, [sp, #0x10]
   9c258:      	ldp	x29, x30, [sp], #0x30
   9c25c:      	ret
   9c260:      	mov	x8, xzr
   9c264:      	mov	x9, sp
   9c268:      	mov	x10, x8
   9c26c:      	add	x8, x8, #0x2
   9c270:      	cmp	x8, #0x200
   9c274:      	strh	wzr, [x9, x10]
   9c278:      	b.ne	0x9c268 <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x13c>
   9c27c:      	add	x0, x19, #0x1
   9c280:      	mov	x1, x20
   9c284:      	mov	w2, #0x4a0              // =1184
   9c288:      	bl	0x1086b4 <memcpy>
   9c28c:      	strb	wzr, [x19]
   9c290:      	b	0x9c24c <<toyos_crypto::mlkem::EncapsulationKey>::from_bytes+0x120>

000000000009c294 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt>:
   9c294:      	stp	x29, x30, [sp, #-0x60]!
   9c298:      	stp	x28, x27, [sp, #0x10]
   9c29c:      	stp	x26, x25, [sp, #0x20]
   9c2a0:      	stp	x24, x23, [sp, #0x30]
   9c2a4:      	stp	x22, x21, [sp, #0x40]
   9c2a8:      	stp	x20, x19, [sp, #0x50]
   9c2ac:      	mov	x29, sp
   9c2b0:      	sub	sp, sp, #0x1, lsl #12   // =0x1000
   9c2b4:      	str	xzr, [sp]
   9c2b8:      	sub	sp, sp, #0xe90
   9c2bc:      	str	xzr, [sp]
   9c2c0:      	mov	w9, #0x3                // =3
   9c2c4:      	stp	x8, x1, [sp, #0x8]
   9c2c8:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9c2cc:      	add	x8, x8, #0x288
   9c2d0:      	stp	x0, x2, [sp, #0x20]
   9c2d4:      	str	x8, [sp, #0x1888]
   9c2d8:      	str	x9, [sp, #0x1890]
   9c2dc:      	add	x8, sp, #0xa70
   9c2e0:      	mov	x0, x2
   9c2e4:      	mov	w1, wzr
   9c2e8:      	mov	x20, xzr
   9c2ec:      	bl	0x9d73c <toyos_crypto::mlkem::noise>
   9c2f0:      	add	x8, sp, #0x630
   9c2f4:      	add	x0, sp, #0xa70
   9c2f8:      	mov	x20, xzr
   9c2fc:      	bl	0x9cf40 <<toyos_crypto::mlkem::Poly>::ntt>
   9c300:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c304:      	add	x1, sp, #0x630
   9c308:      	mov	w2, #0x200              // =512
   9c30c:      	add	x0, x0, #0xc88
   9c310:      	bl	0x1086b4 <memcpy>
   9c314:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c318:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c31c:      	mov	w2, #0x200              // =512
   9c320:      	add	x0, x0, #0xa88
   9c324:      	add	x1, x1, #0xc88
   9c328:      	bl	0x1086b4 <memcpy>
   9c32c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c330:      	add	x0, sp, #0x30
   9c334:      	mov	w2, #0x200              // =512
   9c338:      	add	x1, x1, #0xa88
   9c33c:      	bl	0x1086b4 <memcpy>
   9c340:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c344:      	add	x1, sp, #0x30
   9c348:      	mov	w2, #0x200              // =512
   9c34c:      	add	x0, x0, #0x288
   9c350:      	bl	0x1086b4 <memcpy>
   9c354:      	mov	w20, #0x1               // =1
   9c358:      	ldr	x0, [sp, #0x28]
   9c35c:      	add	x8, sp, #0xa70
   9c360:      	mov	w1, #0x1                // =1
   9c364:      	bl	0x9d73c <toyos_crypto::mlkem::noise>
   9c368:      	mov	w20, #0x1               // =1
   9c36c:      	add	x8, sp, #0x630
   9c370:      	add	x0, sp, #0xa70
   9c374:      	bl	0x9cf40 <<toyos_crypto::mlkem::Poly>::ntt>
   9c378:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c37c:      	add	x1, sp, #0x630
   9c380:      	mov	w2, #0x200              // =512
   9c384:      	add	x0, x0, #0xc88
   9c388:      	bl	0x1086b4 <memcpy>
   9c38c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c390:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c394:      	mov	w2, #0x200              // =512
   9c398:      	add	x0, x0, #0xa88
   9c39c:      	add	x1, x1, #0xc88
   9c3a0:      	bl	0x1086b4 <memcpy>
   9c3a4:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c3a8:      	add	x0, sp, #0x30
   9c3ac:      	mov	w2, #0x200              // =512
   9c3b0:      	add	x1, x1, #0xa88
   9c3b4:      	bl	0x1086b4 <memcpy>
   9c3b8:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9c3bc:      	add	x1, sp, #0x30
   9c3c0:      	mov	w2, #0x200              // =512
   9c3c4:      	add	x8, x8, #0x288
   9c3c8:      	add	x0, x8, #0x200
   9c3cc:      	bl	0x1086b4 <memcpy>
   9c3d0:      	mov	w20, #0x2               // =2
   9c3d4:      	ldr	x0, [sp, #0x28]
   9c3d8:      	add	x8, sp, #0xa70
   9c3dc:      	mov	w1, #0x2                // =2
   9c3e0:      	bl	0x9d73c <toyos_crypto::mlkem::noise>
   9c3e4:      	mov	w20, #0x2               // =2
   9c3e8:      	add	x8, sp, #0x630
   9c3ec:      	add	x0, sp, #0xa70
   9c3f0:      	add	x21, sp, #0xa70
   9c3f4:      	bl	0x9cf40 <<toyos_crypto::mlkem::Poly>::ntt>
   9c3f8:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c3fc:      	add	x1, sp, #0x630
   9c400:      	mov	w2, #0x200              // =512
   9c404:      	add	x0, x0, #0xc88
   9c408:      	bl	0x1086b4 <memcpy>
   9c40c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c410:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c414:      	mov	w2, #0x200              // =512
   9c418:      	add	x0, x0, #0xa88
   9c41c:      	add	x1, x1, #0xc88
   9c420:      	add	x28, sp, #0x1, lsl #12  // =0x1000
   9c424:      	add	x28, x28, #0xa88
   9c428:      	bl	0x1086b4 <memcpy>
   9c42c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c430:      	add	x0, sp, #0x30
   9c434:      	mov	w2, #0x200              // =512
   9c438:      	add	x1, x1, #0xa88
   9c43c:      	bl	0x1086b4 <memcpy>
   9c440:      	add	x19, sp, #0x1, lsl #12  // =0x1000
   9c444:      	add	x1, sp, #0x30
   9c448:      	mov	w2, #0x200              // =512
   9c44c:      	add	x19, x19, #0x288
   9c450:      	add	x0, x19, #0x400
   9c454:      	bl	0x1086b4 <memcpy>
   9c458:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c45c:      	add	x0, sp, #0x30
   9c460:      	mov	w2, #0x600              // =1536
   9c464:      	add	x1, x1, #0x288
   9c468:      	bl	0x1086b4 <memcpy>
   9c46c:      	add	x0, sp, #0x630
   9c470:      	mov	w1, wzr
   9c474:      	mov	w2, #0x440              // =1088
   9c478:      	bl	0x1086a4 <memset>
   9c47c:      	mov	x20, xzr
   9c480:      	add	x10, x21, #0x200
   9c484:      	add	x25, x21, #0x400
   9c488:      	mov	w21, #0x4ebf            // =20159
   9c48c:      	mov	w22, #0x2000000         // =33554432
   9c490:      	mov	w24, #-0xd01            // =-3329
   9c494:      	mov	w23, #0xd01             // =3329
   9c498:      	str	x10, [sp, #0x18]
   9c49c:      	mov	w8, #0x3                // =3
   9c4a0:      	str	x19, [sp, #0x1070]
   9c4a4:      	str	x8, [sp, #0x1078]
   9c4a8:      	ldr	x27, [sp, #0x20]
   9c4ac:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9c4b0:      	mov	x1, xzr
   9c4b4:      	add	x8, x8, #0xa88
   9c4b8:      	mov	x2, x20
   9c4bc:      	mov	x26, xzr
   9c4c0:      	add	x0, x27, #0x480
   9c4c4:      	bl	0x9d984 <toyos_crypto::mlkem::sample>
   9c4c8:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c4cc:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c4d0:      	mov	w2, #0x200              // =512
   9c4d4:      	add	x0, x0, #0x888
   9c4d8:      	add	x1, x1, #0xa88
   9c4dc:      	bl	0x1086b4 <memcpy>
   9c4e0:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c4e4:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c4e8:      	mov	w2, #0x200              // =512
   9c4ec:      	add	x0, x0, #0x88
   9c4f0:      	add	x1, x1, #0x888
   9c4f4:      	bl	0x1086b4 <memcpy>
   9c4f8:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c4fc:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c500:      	mov	w2, #0x200              // =512
   9c504:      	add	x0, x0, #0xc88
   9c508:      	add	x1, x1, #0x88
   9c50c:      	bl	0x1086b4 <memcpy>
   9c510:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c514:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c518:      	mov	w2, #0x200              // =512
   9c51c:      	add	x0, x0, #0x288
   9c520:      	add	x1, x1, #0xc88
   9c524:      	bl	0x1086b4 <memcpy>
   9c528:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9c52c:      	add	x0, x27, #0x480
   9c530:      	mov	w1, #0x1                // =1
   9c534:      	add	x8, x8, #0xa88
   9c538:      	mov	x2, x20
   9c53c:      	mov	w26, #0x1               // =1
   9c540:      	bl	0x9d984 <toyos_crypto::mlkem::sample>
   9c544:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c548:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c54c:      	mov	w2, #0x200              // =512
   9c550:      	add	x0, x0, #0x888
   9c554:      	add	x1, x1, #0xa88
   9c558:      	bl	0x1086b4 <memcpy>
   9c55c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c560:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c564:      	mov	w2, #0x200              // =512
   9c568:      	add	x0, x0, #0x88
   9c56c:      	add	x1, x1, #0x888
   9c570:      	bl	0x1086b4 <memcpy>
   9c574:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c578:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c57c:      	mov	w2, #0x200              // =512
   9c580:      	add	x0, x0, #0xc88
   9c584:      	add	x1, x1, #0x88
   9c588:      	bl	0x1086b4 <memcpy>
   9c58c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c590:      	add	x0, x19, #0x200
   9c594:      	mov	w2, #0x200              // =512
   9c598:      	add	x1, x1, #0xc88
   9c59c:      	bl	0x1086b4 <memcpy>
   9c5a0:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9c5a4:      	add	x0, x27, #0x480
   9c5a8:      	mov	w1, #0x2                // =2
   9c5ac:      	add	x8, x8, #0xa88
   9c5b0:      	mov	x2, x20
   9c5b4:      	mov	w26, #0x2               // =2
   9c5b8:      	bl	0x9d984 <toyos_crypto::mlkem::sample>
   9c5bc:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c5c0:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c5c4:      	mov	w2, #0x200              // =512
   9c5c8:      	add	x0, x0, #0x888
   9c5cc:      	add	x1, x1, #0xa88
   9c5d0:      	mov	x26, x20
   9c5d4:      	bl	0x1086b4 <memcpy>
   9c5d8:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c5dc:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c5e0:      	mov	w2, #0x200              // =512
   9c5e4:      	add	x0, x0, #0x88
   9c5e8:      	add	x1, x1, #0x888
   9c5ec:      	bl	0x1086b4 <memcpy>
   9c5f0:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c5f4:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c5f8:      	mov	w2, #0x200              // =512
   9c5fc:      	add	x0, x0, #0xc88
   9c600:      	add	x1, x1, #0x88
   9c604:      	bl	0x1086b4 <memcpy>
   9c608:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c60c:      	add	x0, x19, #0x400
   9c610:      	mov	w2, #0x200              // =512
   9c614:      	add	x1, x1, #0xc88
   9c618:      	bl	0x1086b4 <memcpy>
   9c61c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c620:      	add	x0, sp, #0xa70
   9c624:      	mov	w2, #0x600              // =1536
   9c628:      	add	x1, x1, #0x288
   9c62c:      	bl	0x1086b4 <memcpy>
   9c630:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9c634:      	add	x0, sp, #0xa70
   9c638:      	add	x1, sp, #0x30
   9c63c:      	add	x8, x8, #0x288
   9c640:      	bl	0x9d4b4 <toyos_crypto::mlkem::dot>
   9c644:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9c648:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c64c:      	add	x8, x8, #0xc88
   9c650:      	add	x0, x0, #0x288
   9c654:      	bl	0x9d250 <<toyos_crypto::mlkem::Poly>::inverse>
   9c658:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9c65c:      	ldr	x0, [sp, #0x28]
   9c660:      	add	w1, w26, #0x3
   9c664:      	add	x8, x8, #0x288
   9c668:      	bl	0x9d73c <toyos_crypto::mlkem::noise>
   9c66c:      	mov	w20, #0x5f6f            // =24431
   9c670:      	add	x27, sp, #0xa70
   9c674:      	movk	w20, #0x27, lsl #16
   9c678:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9c67c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c680:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c684:      	add	x8, x8, #0xa88
   9c688:      	add	x0, x0, #0xc88
   9c68c:      	add	x1, x1, #0x288
   9c690:      	bl	0x9d17c <<toyos_crypto::mlkem::Poly>::plus>
   9c694:      	mov	x8, xzr
   9c698:      	ldrsh	w9, [x28, x8]
   9c69c:      	madd	w10, w9, w21, w22
   9c6a0:      	asr	w10, w10, #26
   9c6a4:      	madd	w9, w10, w24, w9
   9c6a8:      	sxth	w9, w9
   9c6ac:      	and	w10, w23, w9, lsr #15
   9c6b0:      	add	w9, w9, w10
   9c6b4:      	sxth	w10, w9
   9c6b8:      	cmp	w10, w9
   9c6bc:      	b.ne	0x9cc04 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x970>
   9c6c0:      	sbfiz	w9, w9, #10, #16
   9c6c4:      	cmn	w9, #0x681
   9c6c8:      	b.hi	0x9cc14 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x980>
   9c6cc:      	add	w9, w9, #0x680
   9c6d0:      	add	x10, x8, #0x2
   9c6d4:      	umull	x9, w20, w9
   9c6d8:      	cmp	x10, #0x200
   9c6dc:      	ubfx	x9, x9, #33, #10
   9c6e0:      	strh	w9, [x28, x8]
   9c6e4:      	mov	x8, x10
   9c6e8:      	b.ne	0x9c698 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x404>
   9c6ec:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c6f0:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c6f4:      	mov	w2, #0x200              // =512
   9c6f8:      	add	x0, x0, #0xc88
   9c6fc:      	add	x1, x1, #0xa88
   9c700:      	add	x20, x26, #0x1
   9c704:      	bl	0x1086b4 <memcpy>
   9c708:      	mov	w9, #0x140              // =320
   9c70c:      	add	x8, sp, #0x630
   9c710:      	madd	x1, x26, x9, x8
   9c714:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c718:      	mov	w2, #0x140              // =320
   9c71c:      	add	x0, x0, #0xc88
   9c720:      	bl	0x9dff0 <<toyos_crypto::mlkem::Poly>::encode::<10>>
   9c724:      	add	x10, sp, #0x1, lsl #12  // =0x1000
   9c728:      	mov	x8, xzr
   9c72c:      	add	x10, x10, #0xc88
   9c730:      	mov	x9, x8
   9c734:      	add	x8, x8, #0x2
   9c738:      	cmp	x8, #0x200
   9c73c:      	strh	wzr, [x10, x9]
   9c740:      	b.ne	0x9c730 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x49c>
   9c744:      	mov	x8, xzr
   9c748:      	mov	x9, x8
   9c74c:      	add	x8, x8, #0x2
   9c750:      	cmp	x8, #0x200
   9c754:      	strh	wzr, [x19, x9]
   9c758:      	b.ne	0x9c748 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4b4>
   9c75c:      	ldr	x10, [sp, #0x18]
   9c760:      	mov	x8, xzr
   9c764:      	mov	x9, x8
   9c768:      	add	x8, x8, #0x2
   9c76c:      	cmp	x8, #0x200
   9c770:      	strh	wzr, [x27, x9]
   9c774:      	b.ne	0x9c764 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4d0>
   9c778:      	mov	x8, xzr
   9c77c:      	mov	x9, x8
   9c780:      	add	x8, x8, #0x2
   9c784:      	cmp	x8, #0x200
   9c788:      	strh	wzr, [x10, x9]
   9c78c:      	b.ne	0x9c77c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x4e8>
   9c790:      	mov	x8, xzr
   9c794:      	mov	x9, x8
   9c798:      	add	x8, x8, #0x2
   9c79c:      	cmp	x8, #0x200
   9c7a0:      	strh	wzr, [x25, x9]
   9c7a4:      	b.ne	0x9c794 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x500>
   9c7a8:      	cmp	x20, #0x3
   9c7ac:      	b.ne	0x9c49c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x208>
   9c7b0:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9c7b4:      	mov	w9, #0x3                // =3
   9c7b8:      	add	x8, x8, #0x288
   9c7bc:      	str	x9, [sp, #0x1090]
   9c7c0:      	str	x8, [sp, #0x1088]
   9c7c4:      	ldr	x21, [sp, #0x20]
   9c7c8:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9c7cc:      	mov	w1, #0x180              // =384
   9c7d0:      	add	x8, x8, #0xc88
   9c7d4:      	mov	x20, xzr
   9c7d8:      	mov	x0, x21
   9c7dc:      	bl	0x9dd18 <<toyos_crypto::mlkem::Poly>::decode::<12>>
   9c7e0:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c7e4:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c7e8:      	mov	w2, #0x200              // =512
   9c7ec:      	add	x0, x0, #0xa88
   9c7f0:      	add	x1, x1, #0xc88
   9c7f4:      	bl	0x1086b4 <memcpy>
   9c7f8:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c7fc:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c800:      	mov	w2, #0x200              // =512
   9c804:      	add	x0, x0, #0x888
   9c808:      	add	x1, x1, #0xa88
   9c80c:      	bl	0x1086b4 <memcpy>
   9c810:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c814:      	add	x0, sp, #0xa70
   9c818:      	mov	w2, #0x200              // =512
   9c81c:      	add	x1, x1, #0x888
   9c820:      	bl	0x1086b4 <memcpy>
   9c824:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c828:      	add	x1, sp, #0xa70
   9c82c:      	mov	w2, #0x200              // =512
   9c830:      	add	x0, x0, #0x288
   9c834:      	add	x19, sp, #0x1, lsl #12  // =0x1000
   9c838:      	add	x19, x19, #0x288
   9c83c:      	bl	0x1086b4 <memcpy>
   9c840:      	mov	w20, #0x1               // =1
   9c844:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9c848:      	add	x0, x21, #0x180
   9c84c:      	mov	w1, #0x180              // =384
   9c850:      	add	x8, x8, #0xc88
   9c854:      	bl	0x9dd18 <<toyos_crypto::mlkem::Poly>::decode::<12>>
   9c858:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c85c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c860:      	mov	w2, #0x200              // =512
   9c864:      	add	x0, x0, #0xa88
   9c868:      	add	x1, x1, #0xc88
   9c86c:      	bl	0x1086b4 <memcpy>
   9c870:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c874:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c878:      	mov	w2, #0x200              // =512
   9c87c:      	add	x0, x0, #0x888
   9c880:      	add	x1, x1, #0xa88
   9c884:      	bl	0x1086b4 <memcpy>
   9c888:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c88c:      	add	x0, sp, #0xa70
   9c890:      	mov	w2, #0x200              // =512
   9c894:      	add	x1, x1, #0x888
   9c898:      	bl	0x1086b4 <memcpy>
   9c89c:      	add	x0, x19, #0x200
   9c8a0:      	add	x1, sp, #0xa70
   9c8a4:      	mov	w2, #0x200              // =512
   9c8a8:      	bl	0x1086b4 <memcpy>
   9c8ac:      	mov	w20, #0x2               // =2
   9c8b0:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9c8b4:      	add	x0, x21, #0x300
   9c8b8:      	mov	w1, #0x180              // =384
   9c8bc:      	add	x8, x8, #0xc88
   9c8c0:      	bl	0x9dd18 <<toyos_crypto::mlkem::Poly>::decode::<12>>
   9c8c4:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c8c8:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c8cc:      	mov	w2, #0x200              // =512
   9c8d0:      	add	x0, x0, #0xa88
   9c8d4:      	add	x1, x1, #0xc88
   9c8d8:      	bl	0x1086b4 <memcpy>
   9c8dc:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c8e0:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c8e4:      	mov	w2, #0x200              // =512
   9c8e8:      	add	x0, x0, #0x888
   9c8ec:      	add	x1, x1, #0xa88
   9c8f0:      	bl	0x1086b4 <memcpy>
   9c8f4:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c8f8:      	add	x0, sp, #0xa70
   9c8fc:      	mov	w2, #0x200              // =512
   9c900:      	add	x1, x1, #0x888
   9c904:      	bl	0x1086b4 <memcpy>
   9c908:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9c90c:      	add	x1, sp, #0xa70
   9c910:      	mov	w2, #0x200              // =512
   9c914:      	add	x8, x8, #0x288
   9c918:      	add	x0, x8, #0x400
   9c91c:      	bl	0x1086b4 <memcpy>
   9c920:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c924:      	add	x0, sp, #0xa70
   9c928:      	mov	w2, #0x600              // =1536
   9c92c:      	add	x1, x1, #0x288
   9c930:      	bl	0x1086b4 <memcpy>
   9c934:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9c938:      	add	x0, sp, #0xa70
   9c93c:      	add	x1, sp, #0x30
   9c940:      	add	x8, x8, #0x288
   9c944:      	bl	0x9d4b4 <toyos_crypto::mlkem::dot>
   9c948:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9c94c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c950:      	add	x8, x8, #0xc88
   9c954:      	add	x0, x0, #0x288
   9c958:      	bl	0x9d250 <<toyos_crypto::mlkem::Poly>::inverse>
   9c95c:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9c960:      	ldr	x0, [sp, #0x28]
   9c964:      	mov	w1, #0x6                // =6
   9c968:      	add	x8, x8, #0xa88
   9c96c:      	bl	0x9d73c <toyos_crypto::mlkem::noise>
   9c970:      	mov	w20, #0x5f6f            // =24431
   9c974:      	movk	w20, #0x27, lsl #16
   9c978:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9c97c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c980:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c984:      	add	x8, x8, #0x888
   9c988:      	add	x0, x0, #0xc88
   9c98c:      	add	x1, x1, #0xa88
   9c990:      	bl	0x9d17c <<toyos_crypto::mlkem::Poly>::plus>
   9c994:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9c998:      	ldr	x0, [sp, #0x10]
   9c99c:      	mov	w1, #0x20               // =32
   9c9a0:      	add	x8, x8, #0x288
   9c9a4:      	add	x19, sp, #0x1, lsl #12  // =0x1000
   9c9a8:      	add	x19, x19, #0x288
   9c9ac:      	bl	0x9db7c <<toyos_crypto::mlkem::Poly>::decode::<1>>
   9c9b0:      	mov	x8, xzr
   9c9b4:      	mov	w9, #0xd01              // =3329
   9c9b8:      	ldrsh	w10, [x19, x8]
   9c9bc:      	umull	x10, w10, w9
   9c9c0:      	tst	x10, #0xffffffff00000000
   9c9c4:      	b.ne	0x9cc24 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x990>
   9c9c8:      	add	w10, w10, #0x1
   9c9cc:      	add	x11, x8, #0x2
   9c9d0:      	lsr	w10, w10, #1
   9c9d4:      	cmp	x11, #0x200
   9c9d8:      	strh	w10, [x19, x8]
   9c9dc:      	mov	x8, x11
   9c9e0:      	b.ne	0x9c9b8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x724>
   9c9e4:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9c9e8:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9c9ec:      	mov	w2, #0x200              // =512
   9c9f0:      	add	x0, x0, #0xc88
   9c9f4:      	add	x1, x1, #0x288
   9c9f8:      	bl	0x1086b4 <memcpy>
   9c9fc:      	add	x8, sp, #0x1, lsl #12   // =0x1000
   9ca00:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9ca04:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9ca08:      	add	x8, x8, #0x288
   9ca0c:      	add	x0, x0, #0x888
   9ca10:      	add	x1, x1, #0xc88
   9ca14:      	add	x19, sp, #0x1, lsl #12  // =0x1000
   9ca18:      	add	x19, x19, #0x288
   9ca1c:      	bl	0x9d17c <<toyos_crypto::mlkem::Poly>::plus>
   9ca20:      	mov	x8, xzr
   9ca24:      	mov	w9, #0x4ebf             // =20159
   9ca28:      	mov	w10, #0x2000000         // =33554432
   9ca2c:      	mov	w11, #-0xd01            // =-3329
   9ca30:      	mov	w12, #0xd01             // =3329
   9ca34:      	ldrsh	w13, [x19, x8]
   9ca38:      	madd	w14, w13, w9, w10
   9ca3c:      	asr	w14, w14, #26
   9ca40:      	madd	w13, w14, w11, w13
   9ca44:      	sxth	w13, w13
   9ca48:      	and	w14, w12, w13, lsr #15
   9ca4c:      	add	w13, w13, w14
   9ca50:      	sxth	w14, w13
   9ca54:      	cmp	w14, w13
   9ca58:      	b.ne	0x9cc34 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9a0>
   9ca5c:      	sbfiz	w13, w13, #4, #16
   9ca60:      	cmn	w13, #0x681
   9ca64:      	b.hi	0x9cc44 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9b0>
   9ca68:      	add	w13, w13, #0x680
   9ca6c:      	add	x14, x8, #0x2
   9ca70:      	umull	x13, w20, w13
   9ca74:      	cmp	x14, #0x200
   9ca78:      	ubfx	x13, x13, #33, #4
   9ca7c:      	strh	w13, [x19, x8]
   9ca80:      	mov	x8, x14
   9ca84:      	b.ne	0x9ca34 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x7a0>
   9ca88:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9ca8c:      	add	x1, sp, #0x1, lsl #12   // =0x1000
   9ca90:      	mov	w2, #0x200              // =512
   9ca94:      	add	x0, x0, #0x888
   9ca98:      	add	x1, x1, #0x288
   9ca9c:      	add	x19, sp, #0x1, lsl #12  // =0x1000
   9caa0:      	add	x19, x19, #0x888
   9caa4:      	bl	0x1086b4 <memcpy>
   9caa8:      	add	x8, sp, #0x630
   9caac:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9cab0:      	add	x1, x8, #0x3c0
   9cab4:      	mov	w2, #0x80               // =128
   9cab8:      	add	x0, x0, #0x888
   9cabc:      	bl	0x9dec0 <<toyos_crypto::mlkem::Poly>::encode::<4>>
   9cac0:      	mov	x8, xzr
   9cac4:      	mov	x9, x8
   9cac8:      	add	x8, x8, #0x2
   9cacc:      	cmp	x8, #0x200
   9cad0:      	strh	wzr, [x19, x9]
   9cad4:      	b.ne	0x9cac4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x830>
   9cad8:      	add	x9, sp, #0x1, lsl #12   // =0x1000
   9cadc:      	mov	x8, xzr
   9cae0:      	add	x9, x9, #0xc88
   9cae4:      	mov	x10, x8
   9cae8:      	add	x8, x8, #0x2
   9caec:      	cmp	x8, #0x200
   9caf0:      	strh	wzr, [x9, x10]
   9caf4:      	b.ne	0x9cae4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x850>
   9caf8:      	add	x9, sp, #0x1, lsl #12   // =0x1000
   9cafc:      	mov	x8, xzr
   9cb00:      	add	x9, x9, #0xa88
   9cb04:      	mov	x10, x8
   9cb08:      	add	x8, x8, #0x2
   9cb0c:      	cmp	x8, #0x200
   9cb10:      	strh	wzr, [x9, x10]
   9cb14:      	b.ne	0x9cb04 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x870>
   9cb18:      	ldr	x0, [sp, #0x8]
   9cb1c:      	add	x1, sp, #0x630
   9cb20:      	mov	w2, #0x440              // =1088
   9cb24:      	bl	0x1086b4 <memcpy>
   9cb28:      	mov	x8, xzr
   9cb2c:      	add	x9, sp, #0xa70
   9cb30:      	mov	x10, x8
   9cb34:      	add	x8, x8, #0x2
   9cb38:      	cmp	x8, #0x200
   9cb3c:      	strh	wzr, [x9, x10]
   9cb40:      	b.ne	0x9cb30 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x89c>
   9cb44:      	add	x9, sp, #0xa70
   9cb48:      	mov	x8, xzr
   9cb4c:      	add	x9, x9, #0x200
   9cb50:      	mov	x10, x8
   9cb54:      	add	x8, x8, #0x2
   9cb58:      	cmp	x8, #0x200
   9cb5c:      	strh	wzr, [x9, x10]
   9cb60:      	b.ne	0x9cb50 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x8bc>
   9cb64:      	add	x9, sp, #0xa70
   9cb68:      	mov	x8, xzr
   9cb6c:      	add	x9, x9, #0x400
   9cb70:      	mov	x10, x8
   9cb74:      	add	x8, x8, #0x2
   9cb78:      	cmp	x8, #0x200
   9cb7c:      	strh	wzr, [x9, x10]
   9cb80:      	b.ne	0x9cb70 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x8dc>
   9cb84:      	mov	x8, xzr
   9cb88:      	add	x9, sp, #0x30
   9cb8c:      	mov	x10, x8
   9cb90:      	add	x8, x8, #0x2
   9cb94:      	cmp	x8, #0x200
   9cb98:      	strh	wzr, [x9, x10]
   9cb9c:      	b.ne	0x9cb8c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x8f8>
   9cba0:      	add	x9, sp, #0x30
   9cba4:      	mov	x8, xzr
   9cba8:      	add	x9, x9, #0x200
   9cbac:      	mov	x10, x8
   9cbb0:      	add	x8, x8, #0x2
   9cbb4:      	cmp	x8, #0x200
   9cbb8:      	strh	wzr, [x9, x10]
   9cbbc:      	b.ne	0x9cbac <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x918>
   9cbc0:      	add	x9, sp, #0x30
   9cbc4:      	mov	x8, xzr
   9cbc8:      	add	x9, x9, #0x400
   9cbcc:      	mov	x10, x8
   9cbd0:      	add	x8, x8, #0x2
   9cbd4:      	cmp	x8, #0x200
   9cbd8:      	strh	wzr, [x9, x10]
   9cbdc:      	b.ne	0x9cbcc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x938>
   9cbe0:      	add	sp, sp, #0x1, lsl #12   // =0x1000
   9cbe4:      	add	sp, sp, #0xe90
   9cbe8:      	ldp	x20, x19, [sp, #0x50]
   9cbec:      	ldp	x22, x21, [sp, #0x40]
   9cbf0:      	ldp	x24, x23, [sp, #0x30]
   9cbf4:      	ldp	x26, x25, [sp, #0x20]
   9cbf8:      	ldp	x28, x27, [sp, #0x10]
   9cbfc:      	ldp	x29, x30, [sp], #0x60
   9cc00:      	ret
   9cc04:      	nop
   9cc08:      	adr	x0, 0x11b390 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x2c8>
   9cc0c:      	bl	0x1043bc <core::panicking::panic_const::panic_const_add_overflow>
   9cc10:      	b	0x9cc50 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9bc>
   9cc14:      	nop
   9cc18:      	adr	x0, 0x11b318 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x250>
   9cc1c:      	bl	0x1043bc <core::panicking::panic_const::panic_const_add_overflow>
   9cc20:      	b	0x9cc50 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9bc>
   9cc24:      	nop
   9cc28:      	adr	x0, 0x11b270 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x1a8>
   9cc2c:      	bl	0x1043d8 <core::panicking::panic_const::panic_const_mul_overflow>
   9cc30:      	b	0x9cc50 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9bc>
   9cc34:      	nop
   9cc38:      	adr	x0, 0x11b390 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x2c8>
   9cc3c:      	bl	0x1043bc <core::panicking::panic_const::panic_const_add_overflow>
   9cc40:      	b	0x9cc50 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9bc>
   9cc44:      	nop
   9cc48:      	adr	x0, 0x11b318 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x250>
   9cc4c:      	bl	0x1043bc <core::panicking::panic_const::panic_const_add_overflow>
   9cc50:      	brk	#0x1
   9cc54:      	mov	x8, xzr
   9cc58:      	mov	x9, x8
   9cc5c:      	add	x8, x8, #0x2
   9cc60:      	cmp	x8, #0x200
   9cc64:      	strh	wzr, [x19, x9]
   9cc68:      	b.ne	0x9cc58 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9c4>
   9cc6c:      	b	0x9cd84 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xaf0>
   9cc70:      	b	0x9cd84 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xaf0>
   9cc74:      	b	0x9ccf4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa60>
   9cc78:      	b	0x9cda4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb10>
   9cc7c:      	add	x9, sp, #0x1, lsl #12   // =0x1000
   9cc80:      	mov	x8, xzr
   9cc84:      	add	x9, x9, #0xc88
   9cc88:      	mov	x10, x8
   9cc8c:      	add	x8, x8, #0x2
   9cc90:      	cmp	x8, #0x200
   9cc94:      	strh	wzr, [x9, x10]
   9cc98:      	b.ne	0x9cc88 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0x9f4>
   9cc9c:      	b	0x9cdc4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb30>
   9cca0:      	b	0x9cdc4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb30>
   9cca4:      	mov	x19, x0
   9cca8:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9ccac:      	str	x20, [sp, #0x1098]
   9ccb0:      	add	x0, x0, #0x88
   9ccb4:      	b	0x9ce38 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xba4>
   9ccb8:      	mov	x19, x0
   9ccbc:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9ccc0:      	str	x20, [sp, #0x1898]
   9ccc4:      	add	x0, x0, #0x888
   9ccc8:      	bl	0x9c0c0 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>
   9cccc:      	mov	x0, x19
   9ccd0:      	bl	0xfde68 <_Unwind_Resume>
   9ccd4:      	add	x9, sp, #0x1, lsl #12   // =0x1000
   9ccd8:      	mov	x8, xzr
   9ccdc:      	add	x9, x9, #0x288
   9cce0:      	mov	x10, x8
   9cce4:      	add	x8, x8, #0x2
   9cce8:      	cmp	x8, #0x200
   9ccec:      	strh	wzr, [x9, x10]
   9ccf0:      	b.ne	0x9cce0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa4c>
   9ccf4:      	add	x9, sp, #0x1, lsl #12   // =0x1000
   9ccf8:      	mov	x8, xzr
   9ccfc:      	add	x9, x9, #0x888
   9cd00:      	mov	x10, x8
   9cd04:      	add	x8, x8, #0x2
   9cd08:      	cmp	x8, #0x200
   9cd0c:      	strh	wzr, [x9, x10]
   9cd10:      	b.ne	0x9cd00 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa6c>
   9cd14:      	b	0x9cda4 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb10>
   9cd18:      	add	x9, sp, #0x1, lsl #12   // =0x1000
   9cd1c:      	mov	x8, xzr
   9cd20:      	add	x9, x9, #0xc88
   9cd24:      	mov	x10, x8
   9cd28:      	add	x8, x8, #0x2
   9cd2c:      	cmp	x8, #0x200
   9cd30:      	strh	wzr, [x9, x10]
   9cd34:      	b.ne	0x9cd24 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xa90>
   9cd38:      	b	0x9ce64 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbd0>
   9cd3c:      	add	x9, sp, #0x1, lsl #12   // =0x1000
   9cd40:      	mov	x8, xzr
   9cd44:      	add	x9, x9, #0xc88
   9cd48:      	mov	x10, x8
   9cd4c:      	add	x8, x8, #0x2
   9cd50:      	cmp	x8, #0x200
   9cd54:      	strh	wzr, [x9, x10]
   9cd58:      	b.ne	0x9cd48 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xab4>
   9cd5c:      	b	0x9ce84 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbf0>
   9cd60:      	b	0x9ce64 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbd0>
   9cd64:      	add	x9, sp, #0x1, lsl #12   // =0x1000
   9cd68:      	mov	x8, xzr
   9cd6c:      	add	x9, x9, #0x288
   9cd70:      	mov	x10, x8
   9cd74:      	add	x8, x8, #0x2
   9cd78:      	cmp	x8, #0x200
   9cd7c:      	strh	wzr, [x9, x10]
   9cd80:      	b.ne	0x9cd70 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xadc>
   9cd84:      	add	x9, sp, #0x1, lsl #12   // =0x1000
   9cd88:      	mov	x8, xzr
   9cd8c:      	add	x9, x9, #0xc88
   9cd90:      	mov	x10, x8
   9cd94:      	add	x8, x8, #0x2
   9cd98:      	cmp	x8, #0x200
   9cd9c:      	strh	wzr, [x9, x10]
   9cda0:      	b.ne	0x9cd90 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xafc>
   9cda4:      	add	x9, sp, #0x1, lsl #12   // =0x1000
   9cda8:      	mov	x8, xzr
   9cdac:      	add	x9, x9, #0xa88
   9cdb0:      	mov	x10, x8
   9cdb4:      	add	x8, x8, #0x2
   9cdb8:      	cmp	x8, #0x200
   9cdbc:      	strh	wzr, [x9, x10]
   9cdc0:      	b.ne	0x9cdb0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb1c>
   9cdc4:      	mov	x8, xzr
   9cdc8:      	add	x9, sp, #0xa70
   9cdcc:      	mov	x10, x8
   9cdd0:      	add	x8, x8, #0x2
   9cdd4:      	cmp	x8, #0x200
   9cdd8:      	strh	wzr, [x9, x10]
   9cddc:      	b.ne	0x9cdcc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb38>
   9cde0:      	add	x9, sp, #0xa70
   9cde4:      	mov	x8, xzr
   9cde8:      	add	x9, x9, #0x200
   9cdec:      	mov	x10, x8
   9cdf0:      	add	x8, x8, #0x2
   9cdf4:      	cmp	x8, #0x200
   9cdf8:      	strh	wzr, [x9, x10]
   9cdfc:      	b.ne	0x9cdec <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb58>
   9ce00:      	add	x9, sp, #0xa70
   9ce04:      	mov	x8, xzr
   9ce08:      	add	x9, x9, #0x400
   9ce0c:      	mov	x10, x8
   9ce10:      	add	x8, x8, #0x2
   9ce14:      	cmp	x8, #0x200
   9ce18:      	strh	wzr, [x9, x10]
   9ce1c:      	b.ne	0x9ce0c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xb78>
   9ce20:      	b	0x9cee0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc4c>
   9ce24:      	b	0x9ce84 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbf0>
   9ce28:      	mov	x19, x0
   9ce2c:      	add	x0, sp, #0x1, lsl #12   // =0x1000
   9ce30:      	str	x26, [sp, #0x1080]
   9ce34:      	add	x0, x0, #0x70
   9ce38:      	bl	0x9c0c0 <core::ptr::drop_glue::<core::array::Guard<toyos_crypto::mlkem::Poly>>>
   9ce3c:      	mov	x0, x19
   9ce40:      	b	0x9cee0 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc4c>
   9ce44:      	add	x9, sp, #0x1, lsl #12   // =0x1000
   9ce48:      	mov	x8, xzr
   9ce4c:      	add	x9, x9, #0xa88
   9ce50:      	mov	x10, x8
   9ce54:      	add	x8, x8, #0x2
   9ce58:      	cmp	x8, #0x200
   9ce5c:      	strh	wzr, [x9, x10]
   9ce60:      	b.ne	0x9ce50 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbbc>
   9ce64:      	add	x9, sp, #0x1, lsl #12   // =0x1000
   9ce68:      	mov	x8, xzr
   9ce6c:      	add	x9, x9, #0x288
   9ce70:      	mov	x10, x8
   9ce74:      	add	x8, x8, #0x2
   9ce78:      	cmp	x8, #0x200
   9ce7c:      	strh	wzr, [x9, x10]
   9ce80:      	b.ne	0x9ce70 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbdc>
   9ce84:      	mov	x8, xzr
   9ce88:      	add	x9, sp, #0xa70
   9ce8c:      	mov	x10, x8
   9ce90:      	add	x8, x8, #0x2
   9ce94:      	cmp	x8, #0x200
   9ce98:      	strh	wzr, [x9, x10]
   9ce9c:      	b.ne	0x9ce8c <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xbf8>
   9cea0:      	add	x9, sp, #0xa70
   9cea4:      	mov	x8, xzr
   9cea8:      	add	x9, x9, #0x200
   9ceac:      	mov	x10, x8
   9ceb0:      	add	x8, x8, #0x2
   9ceb4:      	cmp	x8, #0x200
   9ceb8:      	strh	wzr, [x9, x10]
   9cebc:      	b.ne	0x9ceac <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc18>
   9cec0:      	add	x9, sp, #0xa70
   9cec4:      	mov	x8, xzr
   9cec8:      	add	x9, x9, #0x400
   9cecc:      	mov	x10, x8
   9ced0:      	add	x8, x8, #0x2
   9ced4:      	cmp	x8, #0x200
   9ced8:      	strh	wzr, [x9, x10]
   9cedc:      	b.ne	0x9cecc <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc38>
   9cee0:      	mov	x8, xzr
   9cee4:      	add	x9, sp, #0x30
   9cee8:      	mov	x10, x8
   9ceec:      	add	x8, x8, #0x2
   9cef0:      	cmp	x8, #0x200
   9cef4:      	strh	wzr, [x9, x10]
   9cef8:      	b.ne	0x9cee8 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc54>
   9cefc:      	add	x9, sp, #0x30
   9cf00:      	mov	x8, xzr
   9cf04:      	add	x9, x9, #0x200
   9cf08:      	mov	x10, x8
   9cf0c:      	add	x8, x8, #0x2
   9cf10:      	cmp	x8, #0x200
   9cf14:      	strh	wzr, [x9, x10]
   9cf18:      	b.ne	0x9cf08 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc74>
   9cf1c:      	add	x9, sp, #0x30
   9cf20:      	mov	x8, xzr
   9cf24:      	add	x9, x9, #0x400
   9cf28:      	mov	x10, x8
   9cf2c:      	add	x8, x8, #0x2
   9cf30:      	cmp	x8, #0x200
   9cf34:      	strh	wzr, [x9, x10]
   9cf38:      	b.ne	0x9cf28 <<toyos_crypto::mlkem::EncapsulationKey>::encrypt+0xc94>
   9cf3c:      	bl	0xfde68 <_Unwind_Resume>

000000000009cf40 <<toyos_crypto::mlkem::Poly>::ntt>:
   9cf40:      	sub	sp, sp, #0xa0
   9cf44:      	stp	x29, x30, [sp, #0x40]
   9cf48:      	stp	x28, x27, [sp, #0x50]
   9cf4c:      	stp	x26, x25, [sp, #0x60]
   9cf50:      	stp	x24, x23, [sp, #0x70]
   9cf54:      	stp	x22, x21, [sp, #0x80]
   9cf58:      	stp	x20, x19, [sp, #0x90]
   9cf5c:      	add	x29, sp, #0x40
   9cf60:      	mov	x19, x0
   9cf64:      	mov	w22, #0x8               // =8
   9cf68:      	adrp	x23, 0x28000 <toyos_crypto::ed25519::B_ODD+0x928>
   9cf6c:      	add	x23, x23, #0x888
   9cf70:      	mov	w27, #-0xcff0000        // =-218038272
   9cf74:      	mov	w28, #-0xd01            // =-3329
   9cf78:      	str	x8, [sp]
   9cf7c:      	b	0x9cf94 <<toyos_crypto::mlkem::Poly>::ntt+0x54>
   9cf80:      	sub	x8, x22, #0x1
   9cf84:      	str	x8, [sp, #0x8]
   9cf88:      	cmp	x22, #0x2
   9cf8c:      	ldr	x22, [sp, #0x8]
   9cf90:      	b.ls	0x9d08c <<toyos_crypto::mlkem::Poly>::ntt+0x14c>
   9cf94:      	sub	x9, x22, #0x1
   9cf98:      	mov	w8, #0x2                // =2
   9cf9c:      	lsl	x24, x8, x9
   9cfa0:      	neg	w8, w24
   9cfa4:      	and	x26, x8, #0x100
   9cfa8:      	cmp	x24, x26
   9cfac:      	b.hi	0x9cf80 <<toyos_crypto::mlkem::Poly>::ntt+0x40>
   9cfb0:      	sub	x9, x22, #0x1
   9cfb4:      	mov	w8, #0x1                // =1
   9cfb8:      	mov	x21, x19
   9cfbc:      	str	x9, [sp, #0x8]
   9cfc0:      	sub	x9, x22, #0x1
   9cfc4:      	lsl	x20, x8, x9
   9cfc8:      	b	0x9cfd8 <<toyos_crypto::mlkem::Poly>::ntt+0x98>
   9cfcc:      	sub	x26, x26, x24
   9cfd0:      	cmp	x24, x26
   9cfd4:      	b.hi	0x9cf88 <<toyos_crypto::mlkem::Poly>::ntt+0x48>
   9cfd8:      	adrp	x8, 0x28000 <toyos_crypto::ed25519::B_ODD+0x928>
   9cfdc:      	add	x8, x8, #0x986
   9cfe0:      	cmp	x23, x8
   9cfe4:      	b.eq	0x9d080 <<toyos_crypto::mlkem::Poly>::ntt+0x140>
   9cfe8:      	cmp	x20, x24
   9cfec:      	b.hi	0x9d120 <<toyos_crypto::mlkem::Poly>::ntt+0x1e0>
   9cff0:      	mov	x0, x21
   9cff4:      	add	x21, x21, x24, lsl #1
   9cff8:      	ldrsh	w25, [x23], #0x2
   9cffc:      	add	x1, x0, x20, lsl #1
   9d000:      	add	x8, sp, #0x10
   9d004:      	mov	x2, x1
   9d008:      	mov	x3, x21
   9d00c:      	bl	0x9e138 <<core::iter::adapters::zip::Zip<core::slice::iter::IterMut<i16>, core::slice::iter::Iter<i16>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::IterMut<i16>, core::slice::iter::Iter<i16>>>::new>
   9d010:      	ldp	x9, x8, [sp, #0x30]
   9d014:      	subs	x8, x8, x9
   9d018:      	b.ls	0x9cfcc <<toyos_crypto::mlkem::Poly>::ntt+0x8c>
   9d01c:      	ldr	x10, [sp, #0x10]
   9d020:      	ldr	x11, [sp, #0x20]
   9d024:      	lsl	x12, x9, #1
   9d028:      	add	x9, x11, x12
   9d02c:      	add	x10, x10, x12
   9d030:      	ldrsh	w11, [x9]
   9d034:      	mul	w11, w11, w25
   9d038:      	mul	w12, w11, w27
   9d03c:      	asr	w12, w12, #16
   9d040:      	madd	w11, w12, w28, w11
   9d044:      	ldrsh	w12, [x10]
   9d048:      	sub	w12, w12, w11, asr #16
   9d04c:      	sxth	w13, w12
   9d050:      	cmp	w13, w12
   9d054:      	b.ne	0x9d13c <<toyos_crypto::mlkem::Poly>::ntt+0x1fc>
   9d058:      	strh	w12, [x9], #0x2
   9d05c:      	ldrsh	w12, [x10]
   9d060:      	add	w11, w12, w11, asr #16
   9d064:      	sxth	w12, w11
   9d068:      	cmp	w12, w11
   9d06c:      	b.ne	0x9d14c <<toyos_crypto::mlkem::Poly>::ntt+0x20c>
   9d070:      	subs	x8, x8, #0x1
   9d074:      	strh	w11, [x10], #0x2
   9d078:      	b.ne	0x9d030 <<toyos_crypto::mlkem::Poly>::ntt+0xf0>
   9d07c:      	b	0x9cfcc <<toyos_crypto::mlkem::Poly>::ntt+0x8c>
   9d080:      	adrp	x23, 0x28000 <toyos_crypto::ed25519::B_ODD+0x928>
   9d084:      	add	x23, x23, #0x986
   9d088:      	b	0x9cf88 <<toyos_crypto::mlkem::Poly>::ntt+0x48>
   9d08c:      	mov	w8, #0x4ebf             // =20159
   9d090:      	mvni	v1.8h, #0xd, lsl #8
   9d094:      	dup	v0.8h, w8
   9d098:      	mov	x8, xzr
   9d09c:      	movi	v2.4s, #0x2, lsl #24
   9d0a0:      	movi	v3.4s, #0x2, lsl #24
   9d0a4:      	add	x9, x19, x8
   9d0a8:      	movi	v4.4s, #0x2, lsl #24
   9d0ac:      	movi	v5.4s, #0x2, lsl #24
   9d0b0:      	add	x8, x8, #0x20
   9d0b4:      	ldp	q6, q7, [x9]
   9d0b8:      	cmp	x8, #0x200
   9d0bc:      	smlal	v2.4s, v6.4h, v0.4h
   9d0c0:      	smlal2	v3.4s, v6.8h, v0.8h
   9d0c4:      	smlal	v4.4s, v7.4h, v0.4h
   9d0c8:      	smlal2	v5.4s, v7.8h, v0.8h
   9d0cc:      	sshr	v3.4s, v3.4s, #0x1a
   9d0d0:      	sshr	v2.4s, v2.4s, #0x1a
   9d0d4:      	sshr	v4.4s, v4.4s, #0x1a
   9d0d8:      	sshr	v5.4s, v5.4s, #0x1a
   9d0dc:      	uzp1	v2.8h, v2.8h, v3.8h
   9d0e0:      	uzp1	v3.8h, v4.8h, v5.8h
   9d0e4:      	mla	v6.8h, v2.8h, v1.8h
   9d0e8:      	mla	v7.8h, v3.8h, v1.8h
   9d0ec:      	stp	q6, q7, [x9]
   9d0f0:      	b.ne	0x9d09c <<toyos_crypto::mlkem::Poly>::ntt+0x15c>
   9d0f4:      	ldr	x0, [sp]
   9d0f8:      	mov	x1, x19
   9d0fc:      	mov	w2, #0x200              // =512
   9d100:      	ldp	x20, x19, [sp, #0x90]
   9d104:      	ldp	x22, x21, [sp, #0x80]
   9d108:      	ldp	x24, x23, [sp, #0x70]
   9d10c:      	ldp	x26, x25, [sp, #0x60]
   9d110:      	ldp	x28, x27, [sp, #0x50]
   9d114:      	ldp	x29, x30, [sp, #0x40]
   9d118:      	add	sp, sp, #0xa0
   9d11c:      	b	0x1086b4 <memcpy>
   9d120:      	nop
   9d124:      	adr	x0, 0x2887c <toyos_crypto::ed25519::B_ODD+0x11a4>
   9d128:      	nop
   9d12c:      	adr	x2, 0x11b288 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x1c0>
   9d130:      	mov	w1, #0x13               // =19
   9d134:      	bl	0x103594 <core::panicking::panic_fmt>
   9d138:      	b	0x9d158 <<toyos_crypto::mlkem::Poly>::ntt+0x218>
   9d13c:      	nop
   9d140:      	adr	x0, 0x11b2a0 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x1d8>
   9d144:      	bl	0x104410 <core::panicking::panic_const::panic_const_sub_overflow>
   9d148:      	b	0x9d158 <<toyos_crypto::mlkem::Poly>::ntt+0x218>
   9d14c:      	nop
   9d150:      	adr	x0, 0x11b2b8 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x1f0>
   9d154:      	bl	0x1043bc <core::panicking::panic_const::panic_const_add_overflow>
   9d158:      	brk	#0x1
   9d15c:      	b	0x9d160 <<toyos_crypto::mlkem::Poly>::ntt+0x220>
   9d160:      	mov	x8, xzr
   9d164:      	mov	x9, x8
   9d168:      	add	x8, x8, #0x2
   9d16c:      	cmp	x8, #0x200
   9d170:      	strh	wzr, [x19, x9]
   9d174:      	b.ne	0x9d164 <<toyos_crypto::mlkem::Poly>::ntt+0x224>
   9d178:      	bl	0xfde68 <_Unwind_Resume>

000000000009d17c <<toyos_crypto::mlkem::Poly>::plus>:
   9d17c:      	stp	x29, x30, [sp, #-0x30]!
   9d180:      	str	x21, [sp, #0x10]
   9d184:      	stp	x20, x19, [sp, #0x20]
   9d188:      	mov	x29, sp
   9d18c:      	mov	x21, x1
   9d190:      	mov	x19, x0
   9d194:      	mov	x20, x8
   9d198:      	add	x0, x0, #0x200
   9d19c:      	mov	x1, x19
   9d1a0:      	bl	0x104cec <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   9d1a4:      	tbz	w0, #0x0, 0x9d200 <<toyos_crypto::mlkem::Poly>::plus+0x84>
   9d1a8:      	add	x0, x21, #0x200
   9d1ac:      	mov	x1, x21
   9d1b0:      	bl	0x104cec <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   9d1b4:      	cbz	w0, 0x9d200 <<toyos_crypto::mlkem::Poly>::plus+0x84>
   9d1b8:      	mov	x8, xzr
   9d1bc:      	ldrsh	w9, [x21, x8]
   9d1c0:      	ldrsh	w10, [x19, x8]
   9d1c4:      	add	w9, w10, w9
   9d1c8:      	sxth	w10, w9
   9d1cc:      	cmp	w10, w9
   9d1d0:      	b.ne	0x9d21c <<toyos_crypto::mlkem::Poly>::plus+0xa0>
   9d1d4:      	strh	w9, [x19, x8]
   9d1d8:      	add	x8, x8, #0x2
   9d1dc:      	cmp	x8, #0x200
   9d1e0:      	b.ne	0x9d1bc <<toyos_crypto::mlkem::Poly>::plus+0x40>
   9d1e4:      	mov	x0, x20
   9d1e8:      	mov	x1, x19
   9d1ec:      	mov	w2, #0x200              // =512
   9d1f0:      	ldp	x20, x19, [sp, #0x20]
   9d1f4:      	ldr	x21, [sp, #0x10]
   9d1f8:      	ldp	x29, x30, [sp], #0x30
   9d1fc:      	b	0x1086b4 <memcpy>
   9d200:      	nop
   9d204:      	adr	x0, 0x28c88 <anon.a1e0cb83e907a9a8769244c47bbf6991.0.llvm.7013222594937886209>
   9d208:      	nop
   9d20c:      	adr	x3, 0x11b558 <anon.a1e0cb83e907a9a8769244c47bbf6991.2.llvm.7013222594937886209>
   9d210:      	mov	w1, #0x193              // =403
   9d214:      	mov	w2, wzr
   9d218:      	bl	0x103418 <core::panicking::panic_nounwind_fmt>
   9d21c:      	nop
   9d220:      	adr	x0, 0x11b2d0 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x208>
   9d224:      	bl	0x1043bc <core::panicking::panic_const::panic_const_add_overflow>
   9d228:      	brk	#0x1
   9d22c:      	bl	0x103508 <core::panicking::panic_cannot_unwind>
   9d230:      	bl	0x103508 <core::panicking::panic_cannot_unwind>
   9d234:      	mov	x8, xzr
   9d238:      	mov	x9, x8
   9d23c:      	add	x8, x8, #0x2
   9d240:      	cmp	x8, #0x200
   9d244:      	strh	wzr, [x19, x9]
   9d248:      	b.ne	0x9d238 <<toyos_crypto::mlkem::Poly>::plus+0xbc>
   9d24c:      	bl	0xfde68 <_Unwind_Resume>

000000000009d250 <<toyos_crypto::mlkem::Poly>::inverse>:
   9d250:      	stp	x29, x30, [sp, #-0x60]!
   9d254:      	stp	x28, x27, [sp, #0x10]
   9d258:      	stp	x26, x25, [sp, #0x20]
   9d25c:      	stp	x24, x23, [sp, #0x30]
   9d260:      	stp	x22, x21, [sp, #0x40]
   9d264:      	stp	x20, x19, [sp, #0x50]
   9d268:      	mov	x29, sp
   9d26c:      	sub	sp, sp, #0x220
   9d270:      	mov	x20, x0
   9d274:      	adrp	x23, 0x28000 <toyos_crypto::ed25519::B_ODD+0x928>
   9d278:      	add	x23, x23, #0x986
   9d27c:      	mov	w26, #0x4ebf            // =20159
   9d280:      	mov	w27, #0x2000000         // =33554432
   9d284:      	mov	w28, #-0xd01            // =-3329
   9d288:      	mov	w19, #-0xcff0000        // =-218038272
   9d28c:      	mov	w9, #0x1                // =1
   9d290:      	str	x8, [sp]
   9d294:      	b	0x9d2b0 <<toyos_crypto::mlkem::Poly>::inverse+0x60>
   9d298:      	adrp	x23, 0x28000 <toyos_crypto::ed25519::B_ODD+0x928>
   9d29c:      	add	x23, x23, #0x888
   9d2a0:      	ldr	x9, [sp, #0x8]
   9d2a4:      	add	x9, x9, #0x1
   9d2a8:      	cmp	x9, #0x8
   9d2ac:      	b.eq	0x9d3a0 <<toyos_crypto::mlkem::Poly>::inverse+0x150>
   9d2b0:      	mov	w8, #0x2                // =2
   9d2b4:      	str	x9, [sp, #0x8]
   9d2b8:      	lsl	x25, x8, x9
   9d2bc:      	neg	w8, w25
   9d2c0:      	and	x24, x8, #0x100
   9d2c4:      	cmp	x25, x24
   9d2c8:      	b.hi	0x9d2a0 <<toyos_crypto::mlkem::Poly>::inverse+0x50>
   9d2cc:      	mov	w8, #0x1                // =1
   9d2d0:      	mov	x21, x20
   9d2d4:      	lsl	x8, x8, x9
   9d2d8:      	str	x8, [sp, #0x10]
   9d2dc:      	b	0x9d2ec <<toyos_crypto::mlkem::Poly>::inverse+0x9c>
   9d2e0:      	sub	x24, x24, x25
   9d2e4:      	cmp	x25, x24
   9d2e8:      	b.hi	0x9d2a0 <<toyos_crypto::mlkem::Poly>::inverse+0x50>
   9d2ec:      	adrp	x8, 0x28000 <toyos_crypto::ed25519::B_ODD+0x928>
   9d2f0:      	add	x8, x8, #0x888
   9d2f4:      	cmp	x23, x8
   9d2f8:      	b.eq	0x9d298 <<toyos_crypto::mlkem::Poly>::inverse+0x48>
   9d2fc:      	ldr	x8, [sp, #0x10]
   9d300:      	mov	x0, x21
   9d304:      	add	x21, x21, x25, lsl #1
   9d308:      	ldrsh	w22, [x23, #-0x2]!
   9d30c:      	add	x1, x0, x8, lsl #1
   9d310:      	add	x8, sp, #0x18
   9d314:      	mov	x2, x1
   9d318:      	mov	x3, x21
   9d31c:      	bl	0x9e138 <<core::iter::adapters::zip::Zip<core::slice::iter::IterMut<i16>, core::slice::iter::Iter<i16>> as core::iter::adapters::zip::ZipImpl<core::slice::iter::IterMut<i16>, core::slice::iter::Iter<i16>>>::new>
   9d320:      	ldp	x9, x8, [sp, #0x38]
   9d324:      	subs	x8, x8, x9
   9d328:      	b.ls	0x9d2e0 <<toyos_crypto::mlkem::Poly>::inverse+0x90>
   9d32c:      	ldr	x10, [sp, #0x18]
   9d330:      	ldr	x11, [sp, #0x28]
   9d334:      	lsl	x12, x9, #1
   9d338:      	add	x9, x11, x12
   9d33c:      	add	x10, x10, x12
   9d340:      	ldrh	w11, [x10]
   9d344:      	ldrsh	w12, [x9]
   9d348:      	add	w12, w12, w11, sxth
   9d34c:      	sxth	w13, w12
   9d350:      	cmp	w13, w12
   9d354:      	b.ne	0x9d474 <<toyos_crypto::mlkem::Poly>::inverse+0x224>
   9d358:      	madd	w13, w13, w26, w27
   9d35c:      	asr	w13, w13, #26
   9d360:      	madd	w12, w13, w28, w12
   9d364:      	strh	w12, [x10], #0x2
   9d368:      	ldrsh	w12, [x9]
   9d36c:      	sub	w12, w12, w11, sxth
   9d370:      	sxth	w11, w12
   9d374:      	cmp	w11, w12
   9d378:      	b.ne	0x9d484 <<toyos_crypto::mlkem::Poly>::inverse+0x234>
   9d37c:      	mul	w11, w11, w22
   9d380:      	subs	x8, x8, #0x1
   9d384:      	mul	w12, w11, w19
   9d388:      	asr	w12, w12, #16
   9d38c:      	madd	w11, w12, w28, w11
   9d390:      	lsr	w11, w11, #16
   9d394:      	strh	w11, [x9], #0x2
   9d398:      	b.ne	0x9d340 <<toyos_crypto::mlkem::Poly>::inverse+0xf0>
   9d39c:      	b	0x9d2e0 <<toyos_crypto::mlkem::Poly>::inverse+0x90>
   9d3a0:      	add	x0, sp, #0x18
   9d3a4:      	mov	x1, x20
   9d3a8:      	mov	w2, #0x200              // =512
   9d3ac:      	add	x19, sp, #0x18
   9d3b0:      	bl	0x1086b4 <memcpy>
   9d3b4:      	mov	w8, #0x5a1              // =1441
   9d3b8:      	mov	w9, #-0x275f0000        // =-660537344
   9d3bc:      	mvni	v2.4h, #0xd, lsl #8
   9d3c0:      	dup	v0.8h, w8
   9d3c4:      	dup	v1.4s, w9
   9d3c8:      	mov	x8, xzr
   9d3cc:      	add	x9, x19, x8
   9d3d0:      	add	x8, x8, #0x20
   9d3d4:      	ldp	q3, q4, [x9]
   9d3d8:      	cmp	x8, #0x200
   9d3dc:      	ushll	v5.4s, v3.4h, #0x0
   9d3e0:      	ushll	v6.4s, v4.4h, #0x0
   9d3e4:      	ushll2	v7.4s, v3.8h, #0x0
   9d3e8:      	ushll2	v16.4s, v4.8h, #0x0
   9d3ec:      	smull	v17.4s, v3.4h, v0.4h
   9d3f0:      	smull	v18.4s, v4.4h, v0.4h
   9d3f4:      	smull2	v3.4s, v3.8h, v0.8h
   9d3f8:      	smull2	v4.4s, v4.8h, v0.8h
   9d3fc:      	mul	v5.4s, v5.4s, v1.4s
   9d400:      	mul	v6.4s, v6.4s, v1.4s
   9d404:      	mul	v7.4s, v7.4s, v1.4s
   9d408:      	mul	v16.4s, v16.4s, v1.4s
   9d40c:      	shrn	v5.4h, v5.4s, #0x10
   9d410:      	shrn	v6.4h, v6.4s, #0x10
   9d414:      	shrn	v7.4h, v7.4s, #0x10
   9d418:      	shrn	v16.4h, v16.4s, #0x10
   9d41c:      	smull	v5.4s, v5.4h, v2.4h
   9d420:      	smull	v6.4s, v6.4h, v2.4h
   9d424:      	smull	v7.4s, v7.4h, v2.4h
   9d428:      	smull	v16.4s, v16.4h, v2.4h
   9d42c:      	addhn	v5.4h, v5.4s, v17.4s
   9d430:      	addhn	v6.4h, v6.4s, v18.4s
   9d434:      	addhn2	v5.8h, v7.4s, v3.4s
   9d438:      	addhn2	v6.8h, v16.4s, v4.4s
   9d43c:      	stp	q5, q6, [x9]
   9d440:      	b.ne	0x9d3cc <<toyos_crypto::mlkem::Poly>::inverse+0x17c>
   9d444:      	ldr	x0, [sp]
   9d448:      	add	x1, sp, #0x18
   9d44c:      	mov	w2, #0x200              // =512
   9d450:      	bl	0x1086b4 <memcpy>
   9d454:      	add	sp, sp, #0x220
   9d458:      	ldp	x20, x19, [sp, #0x50]
   9d45c:      	ldp	x22, x21, [sp, #0x40]
   9d460:      	ldp	x24, x23, [sp, #0x30]
   9d464:      	ldp	x26, x25, [sp, #0x20]
   9d468:      	ldp	x28, x27, [sp, #0x10]
   9d46c:      	ldp	x29, x30, [sp], #0x60
   9d470:      	ret
   9d474:      	nop
   9d478:      	adr	x0, 0x11b2e8 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x220>
   9d47c:      	bl	0x1043bc <core::panicking::panic_const::panic_const_add_overflow>
   9d480:      	b	0x9d490 <<toyos_crypto::mlkem::Poly>::inverse+0x240>
   9d484:      	nop
   9d488:      	adr	x0, 0x11b300 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x238>
   9d48c:      	bl	0x104410 <core::panicking::panic_const::panic_const_sub_overflow>
   9d490:      	brk	#0x1
   9d494:      	b	0x9d498 <<toyos_crypto::mlkem::Poly>::inverse+0x248>
   9d498:      	mov	x8, xzr
   9d49c:      	mov	x9, x8
   9d4a0:      	add	x8, x8, #0x2
   9d4a4:      	cmp	x8, #0x200
   9d4a8:      	strh	wzr, [x20, x9]
   9d4ac:      	b.ne	0x9d49c <<toyos_crypto::mlkem::Poly>::inverse+0x24c>
   9d4b0:      	bl	0xfde68 <_Unwind_Resume>

000000000009d4b4 <toyos_crypto::mlkem::dot>:
   9d4b4:      	stp	x29, x30, [sp, #-0x60]!
   9d4b8:      	stp	x28, x27, [sp, #0x10]
   9d4bc:      	stp	x26, x25, [sp, #0x20]
   9d4c0:      	stp	x24, x23, [sp, #0x30]
   9d4c4:      	stp	x22, x21, [sp, #0x40]
   9d4c8:      	stp	x20, x19, [sp, #0x50]
   9d4cc:      	mov	x29, sp
   9d4d0:      	sub	sp, sp, #0x210
   9d4d4:      	movi	v0.2d, #0000000000000000
   9d4d8:      	mov	x20, x1
   9d4dc:      	mov	x21, x0
   9d4e0:      	mov	x19, x8
   9d4e4:      	mov	x23, xzr
   9d4e8:      	mov	w24, #-0xcff0000        // =-218038272
   9d4ec:      	nop
   9d4f0:      	adr	x25, 0x28986 <toyos_crypto::ed25519::B_ODD+0x12ae>
   9d4f4:      	mov	w28, #-0xd01            // =-3329
   9d4f8:      	mov	w26, #0xd01             // =3329
   9d4fc:      	mov	x27, sp
   9d500:      	stp	q0, q0, [sp]
   9d504:      	stp	q0, q0, [sp, #0x20]
   9d508:      	stp	q0, q0, [sp, #0x40]
   9d50c:      	stp	q0, q0, [sp, #0x60]
   9d510:      	stp	q0, q0, [sp, #0x80]
   9d514:      	stp	q0, q0, [sp, #0xa0]
   9d518:      	stp	q0, q0, [sp, #0xc0]
   9d51c:      	stp	q0, q0, [sp, #0xe0]
   9d520:      	stp	q0, q0, [sp, #0x100]
   9d524:      	stp	q0, q0, [sp, #0x120]
   9d528:      	stp	q0, q0, [sp, #0x140]
   9d52c:      	stp	q0, q0, [sp, #0x160]
   9d530:      	stp	q0, q0, [sp, #0x180]
   9d534:      	stp	q0, q0, [sp, #0x1a0]
   9d538:      	stp	q0, q0, [sp, #0x1c0]
   9d53c:      	stp	q0, q0, [sp, #0x1e0]
   9d540:      	ldrsh	w22, [x25], #0x2
   9d544:      	add	x0, x21, #0x600
   9d548:      	mov	x1, x21
   9d54c:      	bl	0x104cec <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   9d550:      	tbz	w0, #0x0, 0x9d6c0 <toyos_crypto::mlkem::dot+0x20c>
   9d554:      	add	x0, x20, #0x600
   9d558:      	mov	x1, x20
   9d55c:      	bl	0x104cec <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   9d560:      	tbz	w0, #0x0, 0x9d6c0 <toyos_crypto::mlkem::dot+0x20c>
   9d564:      	add	x9, x21, x23
   9d568:      	add	x10, x20, x23
   9d56c:      	ldrsh	w11, [x9]
   9d570:      	ldrsh	w13, [x10, #0x2]
   9d574:      	ldrsh	w14, [x9, #0x2]
   9d578:      	ldrsh	w12, [x10]
   9d57c:      	mul	w8, w13, w11
   9d580:      	mul	w15, w12, w14
   9d584:      	adds	w8, w8, w15
   9d588:      	b.vs	0x9d6dc <toyos_crypto::mlkem::dot+0x228>
   9d58c:      	mul	w15, w13, w14
   9d590:      	ldrsh	w13, [x9, #0x202]
   9d594:      	ldrsh	w14, [x10, #0x202]
   9d598:      	mul	w12, w12, w11
   9d59c:      	ldrsh	w11, [x9, #0x200]
   9d5a0:      	ldrsh	w10, [x10, #0x200]
   9d5a4:      	mul	w16, w14, w13
   9d5a8:      	mul	w17, w15, w24
   9d5ac:      	mul	w18, w16, w24
   9d5b0:      	asr	w17, w17, #16
   9d5b4:      	madd	w15, w17, w28, w15
   9d5b8:      	asr	w17, w18, #16
   9d5bc:      	madd	w16, w17, w28, w16
   9d5c0:      	asr	w15, w15, #16
   9d5c4:      	madd	w9, w15, w22, w12
   9d5c8:      	asr	w12, w16, #16
   9d5cc:      	mul	w15, w10, w11
   9d5d0:      	madd	w12, w12, w22, w15
   9d5d4:      	adds	w9, w9, w12
   9d5d8:      	b.vs	0x9d6f4 <toyos_crypto::mlkem::dot+0x240>
   9d5dc:      	mul	w11, w14, w11
   9d5e0:      	mul	w10, w10, w13
   9d5e4:      	adds	w10, w11, w10
   9d5e8:      	b.vs	0x9d6dc <toyos_crypto::mlkem::dot+0x228>
   9d5ec:      	adds	w8, w8, w10
   9d5f0:      	b.vs	0x9d6e8 <toyos_crypto::mlkem::dot+0x234>
   9d5f4:      	add	x12, x21, x23
   9d5f8:      	add	x13, x20, x23
   9d5fc:      	ldrsh	w10, [x12, #0x402]
   9d600:      	ldrsh	w11, [x13, #0x402]
   9d604:      	ldrsh	w12, [x12, #0x400]
   9d608:      	ldrsh	w13, [x13, #0x400]
   9d60c:      	mul	w14, w11, w10
   9d610:      	mul	w15, w14, w24
   9d614:      	asr	w15, w15, #16
   9d618:      	madd	w14, w15, w28, w14
   9d61c:      	mul	w15, w13, w12
   9d620:      	asr	w14, w14, #16
   9d624:      	madd	w14, w14, w22, w15
   9d628:      	adds	w9, w9, w14
   9d62c:      	b.vs	0x9d6f4 <toyos_crypto::mlkem::dot+0x240>
   9d630:      	mul	w11, w11, w12
   9d634:      	mul	w10, w13, w10
   9d638:      	adds	w10, w11, w10
   9d63c:      	b.vs	0x9d6dc <toyos_crypto::mlkem::dot+0x228>
   9d640:      	adds	w8, w8, w10
   9d644:      	b.vs	0x9d6e8 <toyos_crypto::mlkem::dot+0x234>
   9d648:      	mul	w10, w9, w24
   9d64c:      	asr	w10, w10, #16
   9d650:      	mul	w10, w10, w26
   9d654:      	subs	w9, w9, w10
   9d658:      	b.vs	0x9d704 <toyos_crypto::mlkem::dot+0x250>
   9d65c:      	mul	w10, w8, w24
   9d660:      	lsr	w9, w9, #16
   9d664:      	strh	w9, [x27, x23]
   9d668:      	asr	w10, w10, #16
   9d66c:      	mul	w10, w10, w26
   9d670:      	subs	w8, w8, w10
   9d674:      	b.vs	0x9d704 <toyos_crypto::mlkem::dot+0x250>
   9d678:      	lsr	w8, w8, #16
   9d67c:      	add	x9, x27, x23
   9d680:      	add	x23, x23, #0x4
   9d684:      	cmp	x23, #0x200
   9d688:      	strh	w8, [x9, #0x2]
   9d68c:      	b.ne	0x9d540 <toyos_crypto::mlkem::dot+0x8c>
   9d690:      	mov	x1, sp
   9d694:      	mov	x0, x19
   9d698:      	mov	w2, #0x200              // =512
   9d69c:      	bl	0x1086b4 <memcpy>
   9d6a0:      	add	sp, sp, #0x210
   9d6a4:      	ldp	x20, x19, [sp, #0x50]
   9d6a8:      	ldp	x22, x21, [sp, #0x40]
   9d6ac:      	ldp	x24, x23, [sp, #0x30]
   9d6b0:      	ldp	x26, x25, [sp, #0x20]
   9d6b4:      	ldp	x28, x27, [sp, #0x10]
   9d6b8:      	ldp	x29, x30, [sp], #0x60
   9d6bc:      	ret
   9d6c0:      	nop
   9d6c4:      	adr	x0, 0x28c88 <anon.a1e0cb83e907a9a8769244c47bbf6991.0.llvm.7013222594937886209>
   9d6c8:      	nop
   9d6cc:      	adr	x3, 0x11b558 <anon.a1e0cb83e907a9a8769244c47bbf6991.2.llvm.7013222594937886209>
   9d6d0:      	mov	w1, #0x193              // =403
   9d6d4:      	mov	w2, wzr
   9d6d8:      	bl	0x103418 <core::panicking::panic_nounwind_fmt>
   9d6dc:      	nop
   9d6e0:      	adr	x0, 0x11b360 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x298>
   9d6e4:      	b	0x9d6fc <toyos_crypto::mlkem::dot+0x248>
   9d6e8:      	nop
   9d6ec:      	adr	x0, 0x11b378 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x2b0>
   9d6f0:      	b	0x9d6fc <toyos_crypto::mlkem::dot+0x248>
   9d6f4:      	nop
   9d6f8:      	adr	x0, 0x11b348 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x280>
   9d6fc:      	bl	0x1043bc <core::panicking::panic_const::panic_const_add_overflow>
   9d700:      	b	0x9d710 <toyos_crypto::mlkem::dot+0x25c>
   9d704:      	nop
   9d708:      	adr	x0, 0x11b330 <anon.35888e03e29f2144a5c0b818b6b94dc9.4.llvm.9814466602776234718+0x268>
   9d70c:      	bl	0x104410 <core::panicking::panic_const::panic_const_sub_overflow>
   9d710:      	brk	#0x1
   9d714:      	bl	0x103508 <core::panicking::panic_cannot_unwind>
   9d718:      	bl	0x103508 <core::panicking::panic_cannot_unwind>
   9d71c:      	mov	x8, xzr
   9d720:      	mov	x9, sp
   9d724:      	mov	x10, x8
   9d728:      	add	x8, x8, #0x2
   9d72c:      	cmp	x8, #0x200
   9d730:      	strh	wzr, [x9, x10]
   9d734:      	b.ne	0x9d724 <toyos_crypto::mlkem::dot+0x270>
   9d738:      	bl	0xfde68 <_Unwind_Resume>

000000000009d73c <toyos_crypto::mlkem::noise>:
   9d73c:      	stp	x29, x30, [sp, #-0x30]!
   9d740:      	stp	x28, x21, [sp, #0x10]
   9d744:      	stp	x20, x19, [sp, #0x20]
   9d748:      	mov	x29, sp
   9d74c:      	sub	sp, sp, #0x2b0
   9d750:      	movi	v0.2d, #0000000000000000
   9d754:      	mov	x19, x8
   9d758:      	mov	w8, #0x20               // =32
   9d75c:      	stp	x0, x8, [sp, #0x88]
   9d760:      	add	x8, sp, #0xac
   9d764:      	mov	w9, #0x1                // =1
   9d768:      	strb	w1, [sp, #0xac]
   9d76c:      	stp	x8, x9, [sp, #0x98]
   9d770:      	stp	q0, q0, [sp]
   9d774:      	stp	q0, q0, [sp, #0x20]
   9d778:      	stp	q0, q0, [sp, #0x40]
   9d77c:      	stp	q0, q0, [sp, #0x60]
   9d780:      	add	x8, sp, #0xb0
   9d784:      	add	x2, sp, #0x88
   9d788:      	mov	w0, #0x88               // =136
   9d78c:      	mov	w1, #0x1f               // =31
   9d790:      	mov	w3, #0x2                // =2
   9d794:      	bl	0xa22dc <<toyos_crypto::keccak::Sponge>::new>
   9d798:      	add	x0, sp, #0xb0
   9d79c:      	mov	x1, sp
   9d7a0:      	mov	w2, #0x80               // =128
   9d7a4:      	add	x20, sp, #0xb0
   9d7a8:      	mov	x21, sp
   9d7ac:      	bl	0xa25d0 <<toyos_crypto::keccak::Sponge>::read>
   9d7b0:      	movi	v4.2d, #0000000000000000
   9d7b4:      	movi	d0, #0x0000ff000000ff
   9d7b8:      	adrp	x9, 0x16000 <anon.d879cf74b2049a5bd01c0f5195e56e5a.0.llvm.9358455428490202460+0xcc>
   9d7bc:      	movi	v1.2s, #0x2
   9d7c0:      	movi	v2.2s, #0x4
   9d7c4:      	ldr	d3, [x9, #0x6e8]
   9d7c8:      	mov	x8, xzr
   9d7cc:      	mov	w9, #0x100              // =256
   9d7d0:      	str	xzr, [sp, #0xb0]
   9d7d4:      	str	xzr, [sp, #0xb8]
   9d7d8:      	str	xzr, [sp, #0xc0]
   9d7dc:      	str	xzr, [sp, #0xc8]
   9d7e0:      	str	xzr, [sp, #0xd0]
   9d7e4:      	str	xzr, [sp, #0xd8]
   9d7e8:      	str	xzr, [sp, #0xe0]
   9d7ec:      	str	xzr, [sp, #0xe8]
   9d7f0:      	str	xzr, [sp, #0xf0]
   9d7f4:      	str	xzr, [sp, #0xf8]
   9d7f8:      	str	xzr, [sp, #0x100]
   9d7fc:      	str	xzr, [sp, #0x108]
   9d800:      	str	xzr, [sp, #0x110]
   9d804:      	str	xzr, [sp, #0x118]
   9d808:      	str	xzr, [sp, #0x120]
   9d80c:      	str	xzr, [sp, #0x128]
   9d810:      	str	xzr, [sp, #0x130]
   9d814:      	str	xzr, [sp, #0x138]
   9d818:      	str	xzr, [sp, #0x140]
   9d81c:      	str	xzr, [sp, #0x148]
   9d820:      	str	xzr, [sp, #0x150]
   9d824:      	str	xzr, [sp, #0x158]
   9d828:      	str	xzr, [sp, #0x160]
   9d82c:      	str	xzr, [sp, #0x168]
   9d830:      	str	xzr, [sp, #0x170]
   9d834:      	stp	q4, q4, [sp, #0xb0]
   9d838:      	stp	q4, q4, [sp, #0xd0]
   9d83c:      	stp	q4, q4, [sp, #0xf0]
   9d840:      	stp	q4, q4, [sp, #0x110]
   9d844:      	stp	q4, q4, [sp, #0x130]
   9d848:      	stp	q4, q4, [sp, #0x150]
   9d84c:      	stp	q4, q4, [sp, #0x170]
   9d850:      	stp	q4, q4, [sp, #0x190]
   9d854:      	stp	q4, q4, [sp, #0x1b0]
   9d858:      	stp	q4, q4, [sp, #0x1d0]
   9d85c:      	stp	q4, q4, [sp, #0x1f0]
   9d860:      	stp	q4, q4, [sp, #0x210]
   9d864:      	stp	q4, q4, [sp, #0x230]
   9d868:      	stp	q4, q4, [sp, #0x250]
   9d86c:      	stp	q4, q4, [sp, #0x270]
   9d870:      	stp	q4, q4, [sp, #0x290]
   9d874:      	ldrb	w10, [x21, x8]
   9d878:      	shl	v4.2s, v3.2s, #0x2
   9d87c:      	add	v3.2s, v3.2s, v1.2s
   9d880:      	subs	x9, x9, #0x2
   9d884:      	dup	v5.2s, w10
   9d888:      	add	x10, x20, x8, lsl #2
   9d88c:      	add	x8, x8, #0x1
   9d890:      	and	v4.8b, v4.8b, v2.8b
   9d894:      	and	v5.8b, v5.8b, v0.8b
   9d898:      	neg	v4.2s, v4.2s
   9d89c:      	ushl	v4.2s, v5.2s, v4.2s
   9d8a0:      	ushr	v5.2s, v4.2s, #0x1
   9d8a4:      	ushr	v6.2s, v4.2s, #0x2
   9d8a8:      	ushr	v7.2s, v4.2s, #0x3
   9d8ac:      	bic	v4.2s, #0xfe
   9d8b0:      	bic	v5.2s, #0x7e
   9d8b4:      	bic	v6.2s, #0x3e
   9d8b8:      	bic	v7.2s, #0x1e
   9d8bc:      	add	v4.2s, v5.2s, v4.2s
   9d8c0:      	add	v5.2s, v6.2s, v7.2s
   9d8c4:      	sub	v4.2s, v4.2s, v5.2s
   9d8c8:      	mov	s5, v4.s[1]
   9d8cc:      	str	h4, [x10]
   9d8d0:      	str	h5, [x10, #0x2]
   9d8d4:      	b.ne	0x9d874 <toyos_crypto::mlkem::noise+0x138>
   9d8d8:      	add	x1, sp, #0xb0
   9d8dc:      	mov	x0, x19
   9d8e0:      	mov	w2, #0x200              // =512
   9d8e4:      	bl	0x1086b4 <memcpy>
   9d8e8:      	stp	xzr, xzr, [sp, #0xb0]
   9d8ec:      	ldr	q0, [sp, #0xb0]
   9d8f0:      	str	q0, [sp]
   9d8f4:      	stp	xzr, xzr, [sp, #0xb0]
   9d8f8:      	ldr	q0, [sp, #0xb0]
   9d8fc:      	str	q0, [sp, #0x10]
   9d900:      	stp	xzr, xzr, [sp, #0xb0]
   9d904:      	ldr	q0, [sp, #0xb0]
   9d908:      	str	q0, [sp, #0x20]
   9d90c:      	stp	xzr, xzr, [sp, #0xb0]
   9d910:      	ldr	q0, [sp, #0xb0]
   9d914:      	str	q0, [sp, #0x30]
   9d918:      	stp	xzr, xzr, [sp, #0xb0]
   9d91c:      	ldr	q0, [sp, #0xb0]
   9d920:      	str	q0, [sp, #0x40]
   9d924:      	stp	xzr, xzr, [sp, #0xb0]
   9d928:      	ldr	q0, [sp, #0xb0]
   9d92c:      	str	q0, [sp, #0x50]
   9d930:      	stp	xzr, xzr, [sp, #0xb0]
   9d934:      	ldr	q0, [sp, #0xb0]
   9d938:      	str	q0, [sp, #0x60]
   9d93c:      	stp	xzr, xzr, [sp, #0xb0]
   9d940:      	ldr	q0, [sp, #0xb0]
   9d944:      	str	q0, [sp, #0x70]
   9d948:      	add	sp, sp, #0x2b0
   9d94c:      	ldp	x20, x19, [sp, #0x20]
   9d950:      	ldp	x28, x21, [sp, #0x10]
   9d954:      	ldp	x29, x30, [sp], #0x30
   9d958:      	ret
   9d95c:      	mov	x19, x0
   9d960:      	add	x0, sp, #0xb0
   9d964:      	bl	0xa2f04 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   9d968:      	b	0x9d970 <toyos_crypto::mlkem::noise+0x234>
   9d96c:      	mov	x19, x0
   9d970:      	mov	x0, sp
   9d974:      	bl	0xa2cf4 <core::ptr::drop_glue::<toyos_crypto::secret::Secret<8, [u8; 16]>>>
   9d978:      	mov	x0, x19
   9d97c:      	bl	0xfde68 <_Unwind_Resume>
   9d980:      	bl	0x1033c8 <core::panicking::panic_in_cleanup>

000000000009d984 <toyos_crypto::mlkem::sample>:
   9d984:      	stp	x29, x30, [sp, #-0x40]!
   9d988:      	str	x28, [sp, #0x10]
   9d98c:      	stp	x22, x21, [sp, #0x20]
   9d990:      	stp	x20, x19, [sp, #0x30]
   9d994:      	mov	x29, sp
   9d998:      	sub	sp, sp, #0x390
   9d99c:      	mov	x19, x8
   9d9a0:      	mov	w8, #0x20               // =32
   9d9a4:      	sub	x22, x29, #0xb0
   9d9a8:      	stp	x0, x8, [sp, #0xe0]
   9d9ac:      	mov	w8, #0x2                // =2
   9d9b0:      	mov	w0, #0xa8               // =168
   9d9b4:      	sturb	w2, [x29, #-0xb0]
   9d9b8:      	add	x2, sp, #0xe0
   9d9bc:      	mov	w3, #0x2                // =2
   9d9c0:      	sturb	w1, [x29, #-0xaf]
   9d9c4:      	mov	w1, #0x1f               // =31
   9d9c8:      	add	x20, sp, #0xe0
   9d9cc:      	stp	x22, x8, [sp, #0xf0]
   9d9d0:      	add	x8, sp, #0x8
   9d9d4:      	bl	0xa22dc <<toyos_crypto::keccak::Sponge>::new>
   9d9d8:      	movi	v0.2d, #0000000000000000
   9d9dc:      	mov	x21, xzr
   9d9e0:      	stur	xzr, [x29, #-0x10]
   9d9e4:      	orr	x22, x22, #0x2
   9d9e8:      	stp	q0, q0, [x20]
   9d9ec:      	stp	q0, q0, [x20, #0x20]
   9d9f0:      	stp	q0, q0, [x20, #0x40]
   9d9f4:      	stp	q0, q0, [x20, #0x60]
   9d9f8:      	stp	q0, q0, [x20, #0x80]
   9d9fc:      	stp	q0, q0, [x20, #0xa0]
   9da00:      	stp	q0, q0, [x20, #0xc0]
   9da04:      	stp	q0, q0, [x20, #0xe0]
   9da08:      	stp	q0, q0, [x20, #0x100]
   9da0c:      	stp	q0, q0, [x20, #0x120]
   9da10:      	stp	q0, q0, [x20, #0x140]
   9da14:      	stp	q0, q0, [x20, #0x160]
   9da18:      	stp	q0, q0, [x20, #0x180]
   9da1c:      	stp	q0, q0, [x20, #0x1a0]
   9da20:      	stp	q0, q0, [x20, #0x1c0]
   9da24:      	stp	q0, q0, [x20, #0x1e0]
   9da28:      	stp	q0, q0, [x20, #0x200]
   9da2c:      	stp	q0, q0, [x20, #0x220]
   9da30:      	stp	q0, q0, [x20, #0x240]
   9da34:      	stp	q0, q0, [x20, #0x260]
   9da38:      	stp	q0, q0, [x20, #0x280]
   9da3c:      	b	0x9da48 <toyos_crypto::mlkem::sample+0xc4>
   9da40:      	cmp	x21, #0x100
   9da44:      	b.hs	0x9dabc <toyos_crypto::mlkem::sample+0x138>
   9da48:      	add	x0, sp, #0x8
   9da4c:      	sub	x1, x29, #0xb0
   9da50:      	mov	w2, #0xa8               // =168
   9da54:      	bl	0xa25d0 <<toyos_crypto::keccak::Sponge>::read>
   9da58:      	mov	w8, #0xa8               // =168
   9da5c:      	mov	x9, x22
   9da60:      	b	0x9da70 <toyos_crypto::mlkem::sample+0xec>
   9da64:      	subs	x8, x8, #0x3
   9da68:      	add	x9, x9, #0x3
   9da6c:      	b.eq	0x9da40 <toyos_crypto::mlkem::sample+0xbc>
   9da70:      	ldurb	w11, [x9, #-0x2]
   9da74:      	ldurb	w10, [x9, #-0x1]
   9da78:      	bfi	w11, w10, #8, #4
   9da7c:      	cmp	w11, #0xd00
   9da80:      	b.hi	0x9da94 <toyos_crypto::mlkem::sample+0x110>
   9da84:      	cmp	x21, #0x100
   9da88:      	b.hs	0x9da94 <toyos_crypto::mlkem::sample+0x110>
   9da8c:      	strh	w11, [x20, x21, lsl #1]
   9da90:      	add	x21, x21, #0x1
   9da94:      	ldrb	w11, [x9]
   9da98:      	lsr	w10, w10, #4
   9da9c:      	orr	w10, w10, w11, lsl #4
   9daa0:      	cmp	w10, #0xd00
   9daa4:      	b.hi	0x9da64 <toyos_crypto::mlkem::sample+0xe0>
   9daa8:      	cmp	x21, #0xff
   9daac:      	b.hi	0x9da64 <toyos_crypto::mlkem::sample+0xe0>
   9dab0:      	strh	w10, [x20, x21, lsl #1]
   9dab4:      	add	x21, x21, #0x1
   9dab8:      	b	0x9da64 <toyos_crypto::mlkem::sample+0xe0>
   9dabc:      	add	x1, sp, #0xe0
   9dac0:      	mov	x0, x19
   9dac4:      	mov	w2, #0x200              // =512
   9dac8:      	bl	0x1086b4 <memcpy>
   9dacc:      	str	xzr, [sp, #0x8]
   9dad0:      	str	xzr, [sp, #0x10]
   9dad4:      	str	xzr, [sp, #0x18]
   9dad8:      	str	xzr, [sp, #0x20]
   9dadc:      	str	xzr, [sp, #0x28]
   9dae0:      	str	xzr, [sp, #0x30]
   9dae4:      	str	xzr, [sp, #0x38]
   9dae8:      	str	xzr, [sp, #0x40]
   9daec:      	str	xzr, [sp, #0x48]
   9daf0:      	str	xzr, [sp, #0x50]
   9daf4:      	str	xzr, [sp, #0x58]
   9daf8:      	str	xzr, [sp, #0x60]
   9dafc:      	str	xzr, [sp, #0x68]
   9db00:      	str	xzr, [sp, #0x70]
   9db04:      	str	xzr, [sp, #0x78]
   9db08:      	str	xzr, [sp, #0x80]
   9db0c:      	str	xzr, [sp, #0x88]
   9db10:      	str	xzr, [sp, #0x90]
   9db14:      	str	xzr, [sp, #0x98]
   9db18:      	str	xzr, [sp, #0xa0]
   9db1c:      	str	xzr, [sp, #0xa8]
   9db20:      	str	xzr, [sp, #0xb0]
   9db24:      	str	xzr, [sp, #0xb8]
   9db28:      	str	xzr, [sp, #0xc0]
   9db2c:      	str	xzr, [sp, #0xc8]
   9db30:      	add	sp, sp, #0x390
   9db34:      	ldp	x20, x19, [sp, #0x30]
   9db38:      	ldr	x28, [sp, #0x10]
   9db3c:      	ldp	x22, x21, [sp, #0x20]
   9db40:      	ldp	x29, x30, [sp], #0x40
   9db44:      	ret
   9db48:      	mov	x19, x0
   9db4c:      	mov	x8, xzr
   9db50:      	add	x9, sp, #0xe0
   9db54:      	mov	x10, x8
   9db58:      	add	x8, x8, #0x2
   9db5c:      	cmp	x8, #0x200
   9db60:      	strh	wzr, [x9, x10]
   9db64:      	b.ne	0x9db54 <toyos_crypto::mlkem::sample+0x1d0>
   9db68:      	add	x0, sp, #0x8
   9db6c:      	bl	0xa2f04 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   9db70:      	mov	x0, x19
   9db74:      	bl	0xfde68 <_Unwind_Resume>
   9db78:      	bl	0x1033c8 <core::panicking::panic_in_cleanup>

000000000009db7c <<toyos_crypto::mlkem::Poly>::decode::<1>>:
   9db7c:      	stp	x29, x30, [sp, #-0x30]!
   9db80:      	str	x28, [sp, #0x10]
   9db84:      	stp	x20, x19, [sp, #0x20]
   9db88:      	mov	x29, sp
   9db8c:      	sub	sp, sp, #0x210
   9db90:      	cmp	x1, #0x20
   9db94:      	str	x1, [sp]
   9db98:      	b.ne	0x9dcf0 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x174>
   9db9c:      	movi	v0.2d, #0000000000000000
   9dba0:      	mov	x20, x0
   9dba4:      	mov	x19, x8
   9dba8:      	mov	x8, sp
   9dbac:      	stp	q0, q0, [sp]
   9dbb0:      	stp	q0, q0, [sp, #0x20]
   9dbb4:      	stp	q0, q0, [sp, #0x40]
   9dbb8:      	stp	q0, q0, [sp, #0x60]
   9dbbc:      	stp	q0, q0, [sp, #0x80]
   9dbc0:      	stp	q0, q0, [sp, #0xa0]
   9dbc4:      	stp	q0, q0, [sp, #0xc0]
   9dbc8:      	stp	q0, q0, [sp, #0xe0]
   9dbcc:      	stp	q0, q0, [sp, #0x100]
   9dbd0:      	stp	q0, q0, [sp, #0x120]
   9dbd4:      	stp	q0, q0, [sp, #0x140]
   9dbd8:      	stp	q0, q0, [sp, #0x160]
   9dbdc:      	stp	q0, q0, [sp, #0x180]
   9dbe0:      	stp	q0, q0, [sp, #0x1a0]
   9dbe4:      	stp	q0, q0, [sp, #0x1c0]
   9dbe8:      	stp	q0, q0, [sp, #0x1e0]
   9dbec:      	add	x0, x8, #0x200
   9dbf0:      	mov	x1, sp
   9dbf4:      	bl	0x104cec <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   9dbf8:      	tbz	w0, #0x0, 0x9dcd4 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x158>
   9dbfc:      	add	x0, x20, #0x20
   9dc00:      	mov	x1, x20
   9dc04:      	bl	0x104cec <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   9dc08:      	cbz	w0, 0x9dcd4 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x158>
   9dc0c:      	sub	x9, x29, #0x10
   9dc10:      	mov	x8, xzr
   9dc14:      	mov	x12, sp
   9dc18:      	sub	x10, x9, x20
   9dc1c:      	sub	x11, x20, x9
   9dc20:      	cmp	x20, x9
   9dc24:      	stp	xzr, xzr, [x29, #-0x10]
   9dc28:      	csel	x13, x10, x11, lo
   9dc2c:      	cbz	x13, 0x9dcb8 <<toyos_crypto::mlkem::Poly>::decode::<1>+0x13c>
   9dc30:      	ldrb	w13, [x20], #0x1
   9dc34:      	add	x14, x12, x8
   9dc38:      	add	x8, x8, #0x10
   9dc3c:      	sub	x10, x10, #0x1
   9dc40:      	add	x11, x11, #0x1
   9dc44:      	sturb	w13, [x29, #-0x10]
   9dc48:      	cmp	x8, #0x200
   9dc4c:      	ldurh	w13, [x29, #-0x10]
   9dc50:      	and	w15, w13, #0x1
   9dc54:      	ubfx	w16, w13, #1, #1
   9dc58:      	strh	w15, [x14]
   9dc5c:      	ubfx	w15, w13, #2, #1
   9dc60:      	strh	w16, [x14, #0x2]
   9dc64:      	ubfx	w16, w13, #3, #1
   9dc68:      	strh	w15, [x14, #0x4]
   9dc6c:      	ubfx	w15, w13, #4, #1
   9dc70:      	strh	w16, [x14, #0x6]
   9dc74:      	ubfx	w16, w13, #5, #1
   9dc78:      	strh	w15, [x14, #0x8]
   9dc7c:      	ubfx	w15, w13, #6, #1
   9dc80:      	ubfx	w13, w13, #7, #1
   9dc84:      	strh	w16, [x14, #0xa]
   9dc88:      	strh	w15, [x14, #0xc]
   9dc8c:      	strh	w13, [x14, #0xe]
   9dc90:      	b.ne	0x9dc20 <<toyos_crypto::mlkem::Poly>::decode::<1>+0xa4>
   9dc94:      	mov	x1, sp
   9dc98:      	mov	x0, x19
   9dc9c:      	mov	w2, #0x200              // =512
   9dca0:      	bl	0x1086b4 <memcpy>
   9dca4:      	add	sp, sp, #0x210
   9dca8:      	ldp	x20, x19, [sp, #0x20]
   9dcac:      	ldr	x28, [sp, #0x10]
   9dcb0:      	ldp	x29, x30, [sp], #0x30
   9dcb4:      	ret
   9dcb8:      	nop
   9dcbc:      	adr	x0, 0x28da0 <anon.237b785418f2afa7725c859e3d4a4d81.5.llvm.12880866533103917516>
   9dcc0:      	nop
   9dcc4:      	adr	x3, 0x11b5e8 <anon.237b785418f2afa7725c859e3d4a4d81.1.llvm.12880866533103917516>
   9dcc8:      	mov	w1, #0x237              // =567
   9dccc:      	mov	w2, wzr
   9dcd0:      	bl	0x103418 <core::panicking::panic_nounwind_fmt>
   9dcd4:      	nop
   9dcd8:      	adr	x0, 0x28c88 <anon.a1e0cb83e907a9a8769244c47bbf6991.0.llvm.7013222594937886209>
   9dcdc:      	nop
   9dce0:      	adr	x3, 0x11b558 <anon.a1e0cb83e907a9a8769244c47bbf6991.2.llvm.7013222594937886209>
   9dce4:      	mov	w1, #0x193              // =403
   9dce8:      	mov	w2, wzr
   9dcec:      	bl	0x103418 <core::panicking::panic_nounwind_fmt>
   9dcf0:      	nop
   9dcf4:      	adr	x2, 0x16698 <anon.0c9210ba10ecca070cd56f35283f16db.1.llvm.11262321166103374487>
   9dcf8:      	nop
   9dcfc:      	adr	x5, 0x11b3c0 <anon.0c9210ba10ecca070cd56f35283f16db.2.llvm.11262321166103374487>
   9dd00:      	mov	x1, sp
   9dd04:      	mov	w0, wzr
   9dd08:      	mov	x3, xzr
   9dd0c:      	bl	0x10020c <core::panicking::assert_failed::<usize, usize>>
   9dd10:      	bl	0x103508 <core::panicking::panic_cannot_unwind>
   9dd14:      	bl	0x103508 <core::panicking::panic_cannot_unwind>

000000000009dd18 <<toyos_crypto::mlkem::Poly>::decode::<12>>:
   9dd18:      	stp	x29, x30, [sp, #-0x30]!
   9dd1c:      	str	x28, [sp, #0x10]
   9dd20:      	stp	x20, x19, [sp, #0x20]
   9dd24:      	mov	x29, sp
   9dd28:      	sub	sp, sp, #0x210
   9dd2c:      	cmp	x1, #0x180
   9dd30:      	str	x1, [sp]
   9dd34:      	b.ne	0x9de98 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x180>
   9dd38:      	movi	v0.2d, #0000000000000000
   9dd3c:      	mov	x20, x0
   9dd40:      	mov	x19, x8
   9dd44:      	mov	x8, sp
   9dd48:      	stp	q0, q0, [sp]
   9dd4c:      	stp	q0, q0, [sp, #0x20]
   9dd50:      	stp	q0, q0, [sp, #0x40]
   9dd54:      	stp	q0, q0, [sp, #0x60]
   9dd58:      	stp	q0, q0, [sp, #0x80]
   9dd5c:      	stp	q0, q0, [sp, #0xa0]
   9dd60:      	stp	q0, q0, [sp, #0xc0]
   9dd64:      	stp	q0, q0, [sp, #0xe0]
   9dd68:      	stp	q0, q0, [sp, #0x100]
   9dd6c:      	stp	q0, q0, [sp, #0x120]
   9dd70:      	stp	q0, q0, [sp, #0x140]
   9dd74:      	stp	q0, q0, [sp, #0x160]
   9dd78:      	stp	q0, q0, [sp, #0x180]
   9dd7c:      	stp	q0, q0, [sp, #0x1a0]
   9dd80:      	stp	q0, q0, [sp, #0x1c0]
   9dd84:      	stp	q0, q0, [sp, #0x1e0]
   9dd88:      	add	x0, x8, #0x200
   9dd8c:      	mov	x1, sp
   9dd90:      	bl	0x104cec <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   9dd94:      	tbz	w0, #0x0, 0x9de7c <<toyos_crypto::mlkem::Poly>::decode::<12>+0x164>
   9dd98:      	add	x0, x20, #0x180
   9dd9c:      	mov	x1, x20
   9dda0:      	bl	0x104cec <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   9dda4:      	cbz	w0, 0x9de7c <<toyos_crypto::mlkem::Poly>::decode::<12>+0x164>
   9dda8:      	sub	x9, x29, #0x10
   9ddac:      	mov	x8, xzr
   9ddb0:      	mov	x12, sp
   9ddb4:      	sub	x10, x9, x20
   9ddb8:      	sub	x11, x20, x9
   9ddbc:      	cmp	x20, x9
   9ddc0:      	stp	xzr, xzr, [x29, #-0x10]
   9ddc4:      	csel	x13, x10, x11, lo
   9ddc8:      	cmp	x13, #0xb
   9ddcc:      	b.ls	0x9de60 <<toyos_crypto::mlkem::Poly>::decode::<12>+0x148>
   9ddd0:      	ldr	w13, [x20, #0x8]
   9ddd4:      	ldr	x14, [x20], #0xc
   9ddd8:      	add	x15, x12, x8
   9dddc:      	add	x8, x8, #0x10
   9dde0:      	sub	x10, x10, #0xc
   9dde4:      	ubfx	w16, w14, #12, #12
   9dde8:      	stur	w13, [x29, #-0x8]
   9ddec:      	and	w13, w14, #0xfff
   9ddf0:      	ubfx	x17, x14, #24, #12
   9ddf4:      	strh	w13, [x15]
   9ddf8:      	ubfx	x13, x14, #36, #12
   9ddfc:      	strh	w16, [x15, #0x2]
   9de00:      	ldur	x16, [x29, #-0x8]
   9de04:      	cmp	x8, #0x200
   9de08:      	strh	w17, [x15, #0x4]
   9de0c:      	ubfx	x17, x14, #48, #12
   9de10:      	add	x11, x11, #0xc
   9de14:      	strh	w13, [x15, #0x6]
   9de18:      	ubfx	w13, w16, #8, #12
   9de1c:      	extr	x14, x16, x14, #0x3c
   9de20:      	lsr	w16, w16, #20
   9de24:      	strh	w17, [x15, #0x8]
   9de28:      	strh	w13, [x15, #0xc]
   9de2c:      	and	w13, w14, #0xfff
   9de30:      	strh	w16, [x15, #0xe]
   9de34:      	strh	w13, [x15, #0xa]
   9de38:      	b.ne	0x9ddbc <<toyos_crypto::mlkem::Poly>::decode::<12>+0xa4>
   9de3c:      	mov	x1, sp
   9de40:      	mov	x0, x19
   9de44:      	mov	w2, #0x200              // =512
   9de48:      	bl	0x1086b4 <memcpy>
   9de4c:      	add	sp, sp, #0x210
   9de50:      	ldp	x20, x19, [sp, #0x20]
   9de54:      	ldr	x28, [sp, #0x10]
   9de58:      	ldp	x29, x30, [sp], #0x30
   9de5c:      	ret
   9de60:      	nop
   9de64:      	adr	x0, 0x28da0 <anon.237b785418f2afa7725c859e3d4a4d81.5.llvm.12880866533103917516>
   9de68:      	nop
   9de6c:      	adr	x3, 0x11b5e8 <anon.237b785418f2afa7725c859e3d4a4d81.1.llvm.12880866533103917516>
   9de70:      	mov	w1, #0x237              // =567
   9de74:      	mov	w2, wzr
   9de78:      	bl	0x103418 <core::panicking::panic_nounwind_fmt>
   9de7c:      	nop
   9de80:      	adr	x0, 0x28c88 <anon.a1e0cb83e907a9a8769244c47bbf6991.0.llvm.7013222594937886209>
   9de84:      	nop
   9de88:      	adr	x3, 0x11b558 <anon.a1e0cb83e907a9a8769244c47bbf6991.2.llvm.7013222594937886209>
   9de8c:      	mov	w1, #0x193              // =403
   9de90:      	mov	w2, wzr
   9de94:      	bl	0x103418 <core::panicking::panic_nounwind_fmt>
   9de98:      	nop
   9de9c:      	adr	x2, 0x16720 <anon.0c9210ba10ecca070cd56f35283f16db.6.llvm.11262321166103374487>
   9dea0:      	nop
   9dea4:      	adr	x5, 0x11b3c0 <anon.0c9210ba10ecca070cd56f35283f16db.2.llvm.11262321166103374487>
   9dea8:      	mov	x1, sp
   9deac:      	mov	w0, wzr
   9deb0:      	mov	x3, xzr
   9deb4:      	bl	0x10020c <core::panicking::assert_failed::<usize, usize>>
   9deb8:      	bl	0x103508 <core::panicking::panic_cannot_unwind>
   9debc:      	bl	0x103508 <core::panicking::panic_cannot_unwind>

000000000009dec0 <<toyos_crypto::mlkem::Poly>::encode::<4>>:
   9dec0:      	sub	sp, sp, #0x30
   9dec4:      	stp	x29, x30, [sp, #0x10]
   9dec8:      	stp	x20, x19, [sp, #0x20]
   9decc:      	add	x29, sp, #0x10
   9ded0:      	cmp	x2, #0x80
   9ded4:      	str	x2, [sp]
   9ded8:      	b.ne	0x9dfc8 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x108>
   9dedc:      	mov	x20, x0
   9dee0:      	mov	x19, x1
   9dee4:      	add	x0, x0, #0x200
   9dee8:      	mov	x1, x20
   9deec:      	bl	0x104cec <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   9def0:      	tbz	w0, #0x0, 0x9dfac <<toyos_crypto::mlkem::Poly>::encode::<4>+0xec>
   9def4:      	add	x0, x19, #0x80
   9def8:      	mov	x1, x19
   9defc:      	bl	0x104cec <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   9df00:      	cbz	w0, 0x9dfac <<toyos_crypto::mlkem::Poly>::encode::<4>+0xec>
   9df04:      	mov	x8, sp
   9df08:      	add	x11, x20, #0x8
   9df0c:      	mov	w12, #0x20              // =32
   9df10:      	sub	x9, x19, x8
   9df14:      	sub	x10, x8, x19
   9df18:      	ldurh	w13, [x11, #-0x8]
   9df1c:      	ldurh	w14, [x11, #-0x6]
   9df20:      	cmp	x8, x19
   9df24:      	orr	x13, x13, x14, lsl #4
   9df28:      	ldurh	w14, [x11, #-0x4]
   9df2c:      	orr	x13, x13, x14, lsl #8
   9df30:      	ldurh	w14, [x11, #-0x2]
   9df34:      	orr	x13, x13, x14, lsl #12
   9df38:      	ldrh	w14, [x11]
   9df3c:      	orr	x13, x13, x14, lsl #16
   9df40:      	ldrh	w14, [x11, #0x2]
   9df44:      	orr	x13, x13, x14, lsl #20
   9df48:      	ldrh	w14, [x11, #0x4]
   9df4c:      	orr	x13, x13, x14, lsl #24
   9df50:      	ldrh	w14, [x11, #0x6]
   9df54:      	orr	x13, x13, x14, lsl #28
   9df58:      	csel	x14, x9, x10, lo
   9df5c:      	cmp	x14, #0x3
   9df60:      	stp	x13, xzr, [sp]
   9df64:      	b.ls	0x9df90 <<toyos_crypto::mlkem::Poly>::encode::<4>+0xd0>
   9df68:      	sub	x12, x12, #0x1
   9df6c:      	add	x11, x11, #0x10
   9df70:      	add	x9, x9, #0x4
   9df74:      	sub	x10, x10, #0x4
   9df78:      	str	w13, [x19], #0x4
   9df7c:      	cbnz	x12, 0x9df18 <<toyos_crypto::mlkem::Poly>::encode::<4>+0x58>
   9df80:      	ldp	x20, x19, [sp, #0x20]
   9df84:      	ldp	x29, x30, [sp, #0x10]
   9df88:      	add	sp, sp, #0x30
   9df8c:      	ret
   9df90:      	nop
   9df94:      	adr	x0, 0x28da0 <anon.237b785418f2afa7725c859e3d4a4d81.5.llvm.12880866533103917516>
   9df98:      	nop
   9df9c:      	adr	x3, 0x11b5e8 <anon.237b785418f2afa7725c859e3d4a4d81.1.llvm.12880866533103917516>
   9dfa0:      	mov	w1, #0x237              // =567
   9dfa4:      	mov	w2, wzr
   9dfa8:      	bl	0x103418 <core::panicking::panic_nounwind_fmt>
   9dfac:      	nop
   9dfb0:      	adr	x0, 0x28c88 <anon.a1e0cb83e907a9a8769244c47bbf6991.0.llvm.7013222594937886209>
   9dfb4:      	nop
   9dfb8:      	adr	x3, 0x11b558 <anon.a1e0cb83e907a9a8769244c47bbf6991.2.llvm.7013222594937886209>
   9dfbc:      	mov	w1, #0x193              // =403
   9dfc0:      	mov	w2, wzr
   9dfc4:      	bl	0x103418 <core::panicking::panic_nounwind_fmt>
   9dfc8:      	nop
   9dfcc:      	adr	x2, 0x16740 <anon.0c9210ba10ecca070cd56f35283f16db.4.llvm.11262321166103374487>
   9dfd0:      	nop
   9dfd4:      	adr	x5, 0x11b3d8 <anon.0c9210ba10ecca070cd56f35283f16db.7.llvm.11262321166103374487>
   9dfd8:      	mov	x1, sp
   9dfdc:      	mov	w0, wzr
   9dfe0:      	mov	x3, xzr
   9dfe4:      	bl	0x10020c <core::panicking::assert_failed::<usize, usize>>
   9dfe8:      	bl	0x103508 <core::panicking::panic_cannot_unwind>
   9dfec:      	bl	0x103508 <core::panicking::panic_cannot_unwind>

000000000009dff0 <<toyos_crypto::mlkem::Poly>::encode::<10>>:
   9dff0:      	sub	sp, sp, #0x30
   9dff4:      	stp	x29, x30, [sp, #0x10]
   9dff8:      	stp	x20, x19, [sp, #0x20]
   9dffc:      	add	x29, sp, #0x10
   9e000:      	cmp	x2, #0x140
   9e004:      	str	x2, [sp]
   9e008:      	b.ne	0x9e110 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x120>
   9e00c:      	mov	x20, x0
   9e010:      	mov	x19, x1
   9e014:      	add	x0, x0, #0x200
   9e018:      	mov	x1, x20
   9e01c:      	bl	0x104cec <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   9e020:      	tbz	w0, #0x0, 0x9e0f4 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x104>
   9e024:      	add	x0, x19, #0x140
   9e028:      	mov	x1, x19
   9e02c:      	bl	0x104cec <<*const _>::offset_from_unsigned::runtime_ptr_ge>
   9e030:      	cbz	w0, 0x9e0f4 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x104>
   9e034:      	mov	x8, sp
   9e038:      	add	x11, x20, #0x8
   9e03c:      	mov	w12, #0x20              // =32
   9e040:      	sub	x9, x19, x8
   9e044:      	sub	x10, x8, x19
   9e048:      	ldurh	w13, [x11, #-0x8]
   9e04c:      	ldurh	w14, [x11, #-0x6]
   9e050:      	cmp	x8, x19
   9e054:      	ldrh	w15, [x11, #0x2]
   9e058:      	ldrh	w17, [x11, #0x4]
   9e05c:      	orr	x13, x13, x14, lsl #10
   9e060:      	ldurh	w14, [x11, #-0x4]
   9e064:      	lsr	x16, x15, #14
   9e068:      	orr	x13, x13, x14, lsl #20
   9e06c:      	ldurh	w14, [x11, #-0x2]
   9e070:      	orr	x13, x13, x14, lsl #30
   9e074:      	ldrh	w14, [x11]
   9e078:      	orr	x13, x13, x14, lsl #40
   9e07c:      	orr	x14, x16, x17, lsr #4
   9e080:      	ldrh	w16, [x11, #0x6]
   9e084:      	orr	x13, x13, x15, lsl #50
   9e088:      	orr	x14, x14, x16, lsl #6
   9e08c:      	csel	x15, x9, x10, lo
   9e090:      	cmp	x15, #0x9
   9e094:      	orr	x13, x13, x17, lsl #60
   9e098:      	stp	x13, x14, [sp]
   9e09c:      	b.ls	0x9e0d8 <<toyos_crypto::mlkem::Poly>::encode::<10>+0xe8>
   9e0a0:      	ldr	x13, [sp]
   9e0a4:      	ldrh	w14, [sp, #0x8]
   9e0a8:      	add	x11, x11, #0x10
   9e0ac:      	sub	x12, x12, #0x1
   9e0b0:      	add	x9, x9, #0xa
   9e0b4:      	sub	x10, x10, #0xa
   9e0b8:      	str	x13, [x19]
   9e0bc:      	strh	w14, [x19, #0x8]
   9e0c0:      	add	x19, x19, #0xa
   9e0c4:      	cbnz	x12, 0x9e048 <<toyos_crypto::mlkem::Poly>::encode::<10>+0x58>
   9e0c8:      	ldp	x20, x19, [sp, #0x20]
   9e0cc:      	ldp	x29, x30, [sp, #0x10]
   9e0d0:      	add	sp, sp, #0x30
   9e0d4:      	ret
   9e0d8:      	nop
   9e0dc:      	adr	x0, 0x28da0 <anon.237b785418f2afa7725c859e3d4a4d81.5.llvm.12880866533103917516>
   9e0e0:      	nop
   9e0e4:      	adr	x3, 0x11b5e8 <anon.237b785418f2afa7725c859e3d4a4d81.1.llvm.12880866533103917516>
   9e0e8:      	mov	w1, #0x237              // =567
   9e0ec:      	mov	w2, wzr
   9e0f0:      	bl	0x103418 <core::panicking::panic_nounwind_fmt>
   9e0f4:      	nop
   9e0f8:      	adr	x0, 0x28c88 <anon.a1e0cb83e907a9a8769244c47bbf6991.0.llvm.7013222594937886209>
   9e0fc:      	nop
   9e100:      	adr	x3, 0x11b558 <anon.a1e0cb83e907a9a8769244c47bbf6991.2.llvm.7013222594937886209>
   9e104:      	mov	w1, #0x193              // =403
   9e108:      	mov	w2, wzr
   9e10c:      	bl	0x103418 <core::panicking::panic_nounwind_fmt>
   9e110:      	nop
   9e114:      	adr	x2, 0x166b8 <anon.0c9210ba10ecca070cd56f35283f16db.5.llvm.11262321166103374487>
   9e118:      	nop
   9e11c:      	adr	x5, 0x11b3d8 <anon.0c9210ba10ecca070cd56f35283f16db.7.llvm.11262321166103374487>
   9e120:      	mov	x1, sp
   9e124:      	mov	w0, wzr
   9e128:      	mov	x3, xzr
   9e12c:      	bl	0x10020c <core::panicking::assert_failed::<usize, usize>>
   9e130:      	bl	0x103508 <core::panicking::panic_cannot_unwind>
   9e134:      	bl	0x103508 <core::panicking::panic_cannot_unwind>

00000000000a22dc <<toyos_crypto::keccak::Sponge>::new>:
   a22dc:      	sub	sp, sp, #0x140
   a22e0:      	stp	x29, x30, [sp, #0xe0]
   a22e4:      	stp	x28, x27, [sp, #0xf0]
   a22e8:      	stp	x26, x25, [sp, #0x100]
   a22ec:      	stp	x24, x23, [sp, #0x110]
   a22f0:      	stp	x22, x21, [sp, #0x120]
   a22f4:      	stp	x20, x19, [sp, #0x130]
   a22f8:      	add	x29, sp, #0xe0
   a22fc:      	mov	x22, x2
   a2300:      	mov	w21, w1
   a2304:      	mov	x20, x0
   a2308:      	cmp	x0, #0x48
   a230c:      	mov	x19, x8
   a2310:      	b.eq	0xa2324 <<toyos_crypto::keccak::Sponge>::new+0x48>
   a2314:      	cmp	x20, #0x88
   a2318:      	b.eq	0xa2324 <<toyos_crypto::keccak::Sponge>::new+0x48>
   a231c:      	cmp	x20, #0xa8
   a2320:      	b.ne	0xa2550 <<toyos_crypto::keccak::Sponge>::new+0x274>
   a2324:      	movi	v0.2d, #0000000000000000
   a2328:      	stp	xzr, x20, [sp, #0xc0]
   a232c:      	str	xzr, [sp, #0xd0]
   a2330:      	stp	q0, q0, [sp]
   a2334:      	stp	q0, q0, [sp, #0x20]
   a2338:      	stp	q0, q0, [sp, #0x40]
   a233c:      	stp	q0, q0, [sp, #0x60]
   a2340:      	stp	q0, q0, [sp, #0x80]
   a2344:      	stp	q0, q0, [sp, #0xa0]
   a2348:      	cbz	x3, 0xa246c <<toyos_crypto::keccak::Sponge>::new+0x190>
   a234c:      	add	x25, x22, x3, lsl #4
   a2350:      	mov	x8, xzr
   a2354:      	mov	x26, sp
   a2358:      	nop
   a235c:      	adr	x23, 0x11b540 <anon.d126a1c03a02b7f85a0a23db829417bf.7.llvm.10957834227438840017+0x60>
   a2360:      	b	0xa2370 <<toyos_crypto::keccak::Sponge>::new+0x94>
   a2364:      	add	x22, x22, #0x10
   a2368:      	cmp	x22, x25
   a236c:      	b.eq	0xa2424 <<toyos_crypto::keccak::Sponge>::new+0x148>
   a2370:      	ldr	x1, [x22, #0x8]
   a2374:      	cbz	x1, 0xa2364 <<toyos_crypto::keccak::Sponge>::new+0x88>
   a2378:      	ldr	x27, [x22]
   a237c:      	b	0xa238c <<toyos_crypto::keccak::Sponge>::new+0xb0>
   a2380:      	add	x27, x27, x24
   a2384:      	mov	x1, x28
   a2388:      	cbz	x28, 0xa2364 <<toyos_crypto::keccak::Sponge>::new+0x88>
   a238c:      	tst	x8, #0x7
   a2390:      	b.ne	0xa23c4 <<toyos_crypto::keccak::Sponge>::new+0xe8>
   a2394:      	cmp	x1, #0x8
   a2398:      	b.lo	0xa23c4 <<toyos_crypto::keccak::Sponge>::new+0xe8>
   a239c:      	cmp	x8, #0xc7
   a23a0:      	b.hi	0xa2524 <<toyos_crypto::keccak::Sponge>::new+0x248>
   a23a4:      	ldr	x9, [x27]
   a23a8:      	ldr	x10, [x26, x8]
   a23ac:      	mov	w24, #0x8               // =8
   a23b0:      	eor	x9, x10, x9
   a23b4:      	str	x9, [x26, x8]
   a23b8:      	subs	x28, x1, x24
   a23bc:      	b.hs	0xa23f4 <<toyos_crypto::keccak::Sponge>::new+0x118>
   a23c0:      	b	0xa24fc <<toyos_crypto::keccak::Sponge>::new+0x220>
   a23c4:      	lsr	x0, x8, #3
   a23c8:      	cmp	x8, #0xc7
   a23cc:      	b.hi	0xa2530 <<toyos_crypto::keccak::Sponge>::new+0x254>
   a23d0:      	ldrb	w9, [x27]
   a23d4:      	ubfiz	x8, x8, #3, #3
   a23d8:      	mov	w24, #0x1               // =1
   a23dc:      	lsl	x8, x9, x8
   a23e0:      	ldr	x9, [x26, x0, lsl #3]
   a23e4:      	eor	x8, x8, x9
   a23e8:      	str	x8, [x26, x0, lsl #3]
   a23ec:      	subs	x28, x1, x24
   a23f0:      	b.lo	0xa24fc <<toyos_crypto::keccak::Sponge>::new+0x220>
   a23f4:      	ldr	x8, [sp, #0xd0]
   a23f8:      	adds	x8, x8, x24
   a23fc:      	b.hs	0xa2514 <<toyos_crypto::keccak::Sponge>::new+0x238>
   a2400:      	ldr	x9, [sp, #0xc8]
   a2404:      	str	x8, [sp, #0xd0]
   a2408:      	cmp	x8, x9
   a240c:      	b.ne	0xa2380 <<toyos_crypto::keccak::Sponge>::new+0xa4>
   a2410:      	mov	x0, sp
   a2414:      	bl	0xa28bc <toyos_crypto::keccak::permute (.llvm.10957834227438840017)>
   a2418:      	mov	x8, xzr
   a241c:      	str	xzr, [sp, #0xd0]
   a2420:      	b	0xa2380 <<toyos_crypto::keccak::Sponge>::new+0xa4>
   a2424:      	lsr	x0, x8, #3
   a2428:      	cmp	x8, #0xc7
   a242c:      	b.hi	0xa2460 <<toyos_crypto::keccak::Sponge>::new+0x184>
   a2430:      	ubfiz	x8, x8, #3, #3
   a2434:      	mov	x9, sp
   a2438:      	and	x10, x21, #0xff
   a243c:      	ldr	x11, [x9, x0, lsl #3]
   a2440:      	lsl	x8, x10, x8
   a2444:      	eor	x8, x8, x11
   a2448:      	str	x8, [x9, x0, lsl #3]
   a244c:      	cbz	x20, 0xa2540 <<toyos_crypto::keccak::Sponge>::new+0x264>
   a2450:      	sub	x8, x20, #0x1
   a2454:      	cmp	x20, #0xc9
   a2458:      	lsr	x0, x8, #3
   a245c:      	b.lo	0xa247c <<toyos_crypto::keccak::Sponge>::new+0x1a0>
   a2460:      	nop
   a2464:      	adr	x23, 0x11b540 <anon.d126a1c03a02b7f85a0a23db829417bf.7.llvm.10957834227438840017+0x60>
   a2468:      	b	0xa2530 <<toyos_crypto::keccak::Sponge>::new+0x254>
   a246c:      	sub	x8, x20, #0x1
   a2470:      	and	x9, x21, #0xff
   a2474:      	lsr	x0, x8, #3
   a2478:      	str	x9, [sp]
   a247c:      	ubfiz	x8, x8, #3, #3
   a2480:      	mov	w9, #0x80               // =128
   a2484:      	mov	x10, sp
   a2488:      	lsl	x8, x9, x8
   a248c:      	ldr	x9, [x10, x0, lsl #3]
   a2490:      	eor	x8, x9, x8
   a2494:      	str	x8, [x10, x0, lsl #3]
   a2498:      	mov	x0, sp
   a249c:      	bl	0xa28bc <toyos_crypto::keccak::permute (.llvm.10957834227438840017)>
   a24a0:      	ldp	q0, q1, [sp, #0xa0]
   a24a4:      	ldr	q2, [sp, #0xc0]
   a24a8:      	str	xzr, [x19, #0xd0]
   a24ac:      	str	q2, [x19, #0xc0]
   a24b0:      	stp	q0, q1, [x19, #0xa0]
   a24b4:      	ldp	q0, q1, [sp, #0x60]
   a24b8:      	stp	q0, q1, [x19, #0x60]
   a24bc:      	ldp	q2, q0, [sp, #0x80]
   a24c0:      	stp	q2, q0, [x19, #0x80]
   a24c4:      	ldp	q1, q0, [sp, #0x20]
   a24c8:      	stp	q1, q0, [x19, #0x20]
   a24cc:      	ldp	q2, q0, [sp, #0x40]
   a24d0:      	stp	q2, q0, [x19, #0x40]
   a24d4:      	ldp	q1, q0, [sp]
   a24d8:      	stp	q1, q0, [x19]
   a24dc:      	ldp	x20, x19, [sp, #0x130]
   a24e0:      	ldp	x22, x21, [sp, #0x120]
   a24e4:      	ldp	x24, x23, [sp, #0x110]
   a24e8:      	ldp	x26, x25, [sp, #0x100]
   a24ec:      	ldp	x28, x27, [sp, #0xf0]
   a24f0:      	ldp	x29, x30, [sp, #0xe0]
   a24f4:      	add	sp, sp, #0x140
   a24f8:      	ret
   a24fc:      	nop
   a2500:      	adr	x3, 0x11b510 <anon.d126a1c03a02b7f85a0a23db829417bf.7.llvm.10957834227438840017+0x30>
   a2504:      	mov	x0, x24
   a2508:      	mov	x2, x1
   a250c:      	bl	0x1040c0 <core::slice::index::slice_index_fail>
   a2510:      	b	0xa254c <<toyos_crypto::keccak::Sponge>::new+0x270>
   a2514:      	nop
   a2518:      	adr	x0, 0x11b528 <anon.d126a1c03a02b7f85a0a23db829417bf.7.llvm.10957834227438840017+0x48>
   a251c:      	bl	0x1043bc <core::panicking::panic_const::panic_const_add_overflow>
   a2520:      	b	0xa254c <<toyos_crypto::keccak::Sponge>::new+0x270>
   a2524:      	lsr	x0, x8, #3
   a2528:      	nop
   a252c:      	adr	x23, 0x11b4f8 <anon.d126a1c03a02b7f85a0a23db829417bf.7.llvm.10957834227438840017+0x18>
   a2530:      	mov	w1, #0x19               // =25
   a2534:      	mov	x2, x23
   a2538:      	bl	0x1033e0 <core::panicking::panic_bounds_check>
   a253c:      	b	0xa254c <<toyos_crypto::keccak::Sponge>::new+0x270>
   a2540:      	nop
   a2544:      	adr	x0, 0x11b498 <anon.49a2fafc0cb8ebcfa0fea1018724d114.9.llvm.15028750401266101212+0x30>
   a2548:      	bl	0x104410 <core::panicking::panic_const::panic_const_sub_overflow>
   a254c:      	brk	#0x1
   a2550:      	nop
   a2554:      	adr	x0, 0x28b91 <anon.d126a1c03a02b7f85a0a23db829417bf.1.llvm.10957834227438840017+0x9>
   a2558:      	nop
   a255c:      	adr	x2, 0x11b480 <anon.49a2fafc0cb8ebcfa0fea1018724d114.9.llvm.15028750401266101212+0x18>
   a2560:      	mov	w1, #0x30               // =48
   a2564:      	bl	0x103580 <core::panicking::panic>
   a2568:      	str	xzr, [sp]
   a256c:      	str	xzr, [sp, #0x8]
   a2570:      	str	xzr, [sp, #0x10]
   a2574:      	str	xzr, [sp, #0x18]
   a2578:      	str	xzr, [sp, #0x20]
   a257c:      	str	xzr, [sp, #0x28]
   a2580:      	str	xzr, [sp, #0x30]
   a2584:      	str	xzr, [sp, #0x38]
   a2588:      	str	xzr, [sp, #0x40]
   a258c:      	str	xzr, [sp, #0x48]
   a2590:      	str	xzr, [sp, #0x50]
   a2594:      	str	xzr, [sp, #0x58]
   a2598:      	str	xzr, [sp, #0x60]
   a259c:      	str	xzr, [sp, #0x68]
   a25a0:      	str	xzr, [sp, #0x70]
   a25a4:      	str	xzr, [sp, #0x78]
   a25a8:      	str	xzr, [sp, #0x80]
   a25ac:      	str	xzr, [sp, #0x88]
   a25b0:      	str	xzr, [sp, #0x90]
   a25b4:      	str	xzr, [sp, #0x98]
   a25b8:      	str	xzr, [sp, #0xa0]
   a25bc:      	str	xzr, [sp, #0xa8]
   a25c0:      	str	xzr, [sp, #0xb0]
   a25c4:      	str	xzr, [sp, #0xb8]
   a25c8:      	str	xzr, [sp, #0xc0]
   a25cc:      	bl	0xfde68 <_Unwind_Resume>

00000000000a25d0 <<toyos_crypto::keccak::Sponge>::read>:
   a25d0:      	sub	sp, sp, #0x60
   a25d4:      	stp	x29, x30, [sp, #0x10]
   a25d8:      	stp	x26, x25, [sp, #0x20]
   a25dc:      	stp	x24, x23, [sp, #0x30]
   a25e0:      	stp	x22, x21, [sp, #0x40]
   a25e4:      	stp	x20, x19, [sp, #0x50]
   a25e8:      	add	x29, sp, #0x10
   a25ec:      	cbz	x2, 0xa268c <<toyos_crypto::keccak::Sponge>::read+0xbc>
   a25f0:      	ldr	x25, [x0, #0xd0]
   a25f4:      	mov	x19, x2
   a25f8:      	mov	x21, x1
   a25fc:      	mov	x20, x0
   a2600:      	mov	w23, #0x8               // =8
   a2604:      	add	x24, sp, #0x8
   a2608:      	ldr	x8, [x20, #0xc8]
   a260c:      	cmp	x25, x8
   a2610:      	b.ne	0xa2624 <<toyos_crypto::keccak::Sponge>::read+0x54>
   a2614:      	mov	x0, x20
   a2618:      	bl	0xa28bc <toyos_crypto::keccak::permute (.llvm.10957834227438840017)>
   a261c:      	mov	x25, xzr
   a2620:      	str	xzr, [x20, #0xd0]
   a2624:      	ands	x0, x25, #0x7
   a2628:      	lsr	x8, x25, #3
   a262c:      	ccmp	x19, #0x7, #0x0, eq
   a2630:      	csinc	x22, x23, xzr, hi
   a2634:      	cmp	x25, #0xc7
   a2638:      	b.hi	0xa26ec <<toyos_crypto::keccak::Sponge>::read+0x11c>
   a263c:      	ldr	x8, [x20, x8, lsl #3]
   a2640:      	subs	x19, x19, x22
   a2644:      	str	x8, [sp, #0x8]
   a2648:      	b.lo	0xa26b8 <<toyos_crypto::keccak::Sponge>::read+0xe8>
   a264c:      	add	x1, x22, x0
   a2650:      	cmp	x1, #0x9
   a2654:      	b.hs	0xa26a8 <<toyos_crypto::keccak::Sponge>::read+0xd8>
   a2658:      	add	x1, x24, x0
   a265c:      	subs	x8, x1, x21
   a2660:      	cneg	x8, x8, ls
   a2664:      	cmp	x8, x22
   a2668:      	b.lo	0xa26d0 <<toyos_crypto::keccak::Sponge>::read+0x100>
   a266c:      	mov	x0, x21
   a2670:      	mov	x2, x22
   a2674:      	add	x26, x21, x22
   a2678:      	bl	0x1086b4 <memcpy>
   a267c:      	add	x25, x22, x25
   a2680:      	mov	x21, x26
   a2684:      	str	x25, [x20, #0xd0]
   a2688:      	cbnz	x19, 0xa2608 <<toyos_crypto::keccak::Sponge>::read+0x38>
   a268c:      	ldp	x20, x19, [sp, #0x50]
   a2690:      	ldp	x22, x21, [sp, #0x40]
   a2694:      	ldp	x24, x23, [sp, #0x30]
   a2698:      	ldp	x26, x25, [sp, #0x20]
   a269c:      	ldp	x29, x30, [sp, #0x10]
   a26a0:      	add	sp, sp, #0x60
   a26a4:      	ret
   a26a8:      	nop
   a26ac:      	adr	x3, 0x11b4e0 <anon.d126a1c03a02b7f85a0a23db829417bf.7.llvm.10957834227438840017>
   a26b0:      	mov	w2, #0x8                // =8
   a26b4:      	bl	0x1040c0 <core::slice::index::slice_index_fail>
   a26b8:      	nop
   a26bc:      	adr	x0, 0x28b88 <anon.d126a1c03a02b7f85a0a23db829417bf.1.llvm.10957834227438840017>
   a26c0:      	nop
   a26c4:      	adr	x2, 0x11b4c8 <anon.d126a1c03a02b7f85a0a23db829417bf.6.llvm.10957834227438840017>
   a26c8:      	mov	w1, #0x13               // =19
   a26cc:      	bl	0x103594 <core::panicking::panic_fmt>
   a26d0:      	nop
   a26d4:      	adr	x0, 0x28da0 <anon.237b785418f2afa7725c859e3d4a4d81.5.llvm.12880866533103917516>
   a26d8:      	nop
   a26dc:      	adr	x3, 0x11b5e8 <anon.237b785418f2afa7725c859e3d4a4d81.1.llvm.12880866533103917516>
   a26e0:      	mov	w1, #0x237              // =567
   a26e4:      	mov	w2, wzr
   a26e8:      	bl	0x103418 <core::panicking::panic_nounwind_fmt>
   a26ec:      	nop
   a26f0:      	adr	x2, 0x11b4b0 <anon.d126a1c03a02b7f85a0a23db829417bf.5.llvm.10957834227438840017>
   a26f4:      	mov	x0, x8
   a26f8:      	mov	w1, #0x19               // =25
   a26fc:      	bl	0x1033e0 <core::panicking::panic_bounds_check>

00000000000a2700 <toyos_crypto::keccak::g>:
   a2700:      	sub	sp, sp, #0x140
   a2704:      	stp	x29, x30, [sp, #0x120]
   a2708:      	stp	x28, x19, [sp, #0x130]
   a270c:      	add	x29, sp, #0x120
   a2710:      	movi	v0.2d, #0000000000000000
   a2714:      	mov	x3, x1
   a2718:      	mov	x2, x0
   a271c:      	mov	x19, x8
   a2720:      	add	x8, sp, #0x48
   a2724:      	mov	w0, #0x48               // =72
   a2728:      	mov	w1, #0x6                // =6
   a272c:      	stp	q0, q0, [sp]
   a2730:      	stp	q0, q0, [sp, #0x20]
   a2734:      	bl	0xa22dc <<toyos_crypto::keccak::Sponge>::new>
   a2738:      	add	x0, sp, #0x48
   a273c:      	mov	x1, sp
   a2740:      	mov	w2, #0x40               // =64
   a2744:      	bl	0xa25d0 <<toyos_crypto::keccak::Sponge>::read>
   a2748:      	str	xzr, [sp, #0x48]
   a274c:      	str	xzr, [sp, #0x50]
   a2750:      	str	xzr, [sp, #0x58]
   a2754:      	str	xzr, [sp, #0x60]
   a2758:      	str	xzr, [sp, #0x68]
   a275c:      	str	xzr, [sp, #0x70]
   a2760:      	str	xzr, [sp, #0x78]
   a2764:      	str	xzr, [sp, #0x80]
   a2768:      	str	xzr, [sp, #0x88]
   a276c:      	str	xzr, [sp, #0x90]
   a2770:      	str	xzr, [sp, #0x98]
   a2774:      	str	xzr, [sp, #0xa0]
   a2778:      	str	xzr, [sp, #0xa8]
   a277c:      	str	xzr, [sp, #0xb0]
   a2780:      	str	xzr, [sp, #0xb8]
   a2784:      	str	xzr, [sp, #0xc0]
   a2788:      	str	xzr, [sp, #0xc8]
   a278c:      	str	xzr, [sp, #0xd0]
   a2790:      	str	xzr, [sp, #0xd8]
   a2794:      	str	xzr, [sp, #0xe0]
   a2798:      	str	xzr, [sp, #0xe8]
   a279c:      	str	xzr, [sp, #0xf0]
   a27a0:      	str	xzr, [sp, #0xf8]
   a27a4:      	str	xzr, [sp, #0x100]
   a27a8:      	str	xzr, [sp, #0x108]
   a27ac:      	ldp	q0, q1, [sp]
   a27b0:      	stp	q0, q1, [x19]
   a27b4:      	ldp	q2, q0, [sp, #0x20]
   a27b8:      	stp	q2, q0, [x19, #0x20]
   a27bc:      	ldp	x28, x19, [sp, #0x130]
   a27c0:      	ldp	x29, x30, [sp, #0x120]
   a27c4:      	add	sp, sp, #0x140
   a27c8:      	ret
   a27cc:      	mov	x19, x0
   a27d0:      	add	x0, sp, #0x48
   a27d4:      	bl	0xa2f04 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   a27d8:      	mov	x0, x19
   a27dc:      	bl	0xfde68 <_Unwind_Resume>
   a27e0:      	bl	0x1033c8 <core::panicking::panic_in_cleanup>

00000000000a27e4 <toyos_crypto::keccak::h>:
   a27e4:      	sub	sp, sp, #0x120
   a27e8:      	stp	x29, x30, [sp, #0x100]
   a27ec:      	stp	x28, x19, [sp, #0x110]
   a27f0:      	add	x29, sp, #0x100
   a27f4:      	movi	v0.2d, #0000000000000000
   a27f8:      	mov	x3, x1
   a27fc:      	mov	x2, x0
   a2800:      	mov	x19, x8
   a2804:      	add	x8, sp, #0x28
   a2808:      	mov	w0, #0x88               // =136
   a280c:      	mov	w1, #0x6                // =6
   a2810:      	stp	q0, q0, [sp]
   a2814:      	bl	0xa22dc <<toyos_crypto::keccak::Sponge>::new>
   a2818:      	add	x0, sp, #0x28
   a281c:      	mov	x1, sp
   a2820:      	mov	w2, #0x20               // =32
   a2824:      	bl	0xa25d0 <<toyos_crypto::keccak::Sponge>::read>
   a2828:      	str	xzr, [sp, #0x28]
   a282c:      	str	xzr, [sp, #0x30]
   a2830:      	str	xzr, [sp, #0x38]
   a2834:      	str	xzr, [sp, #0x40]
   a2838:      	str	xzr, [sp, #0x48]
   a283c:      	str	xzr, [sp, #0x50]
   a2840:      	str	xzr, [sp, #0x58]
   a2844:      	str	xzr, [sp, #0x60]
   a2848:      	str	xzr, [sp, #0x68]
   a284c:      	str	xzr, [sp, #0x70]
   a2850:      	str	xzr, [sp, #0x78]
   a2854:      	str	xzr, [sp, #0x80]
   a2858:      	str	xzr, [sp, #0x88]
   a285c:      	str	xzr, [sp, #0x90]
   a2860:      	str	xzr, [sp, #0x98]
   a2864:      	str	xzr, [sp, #0xa0]
   a2868:      	str	xzr, [sp, #0xa8]
   a286c:      	str	xzr, [sp, #0xb0]
   a2870:      	str	xzr, [sp, #0xb8]
   a2874:      	str	xzr, [sp, #0xc0]
   a2878:      	str	xzr, [sp, #0xc8]
   a287c:      	str	xzr, [sp, #0xd0]
   a2880:      	str	xzr, [sp, #0xd8]
   a2884:      	str	xzr, [sp, #0xe0]
   a2888:      	str	xzr, [sp, #0xe8]
   a288c:      	ldp	q0, q1, [sp]
   a2890:      	stp	q0, q1, [x19]
   a2894:      	ldp	x28, x19, [sp, #0x110]
   a2898:      	ldp	x29, x30, [sp, #0x100]
   a289c:      	add	sp, sp, #0x120
   a28a0:      	ret
   a28a4:      	mov	x19, x0
   a28a8:      	add	x0, sp, #0x28
   a28ac:      	bl	0xa2f04 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>
   a28b0:      	mov	x0, x19
   a28b4:      	bl	0xfde68 <_Unwind_Resume>
   a28b8:      	bl	0x1033c8 <core::panicking::panic_in_cleanup>

00000000000a28bc <toyos_crypto::keccak::permute (.llvm.10957834227438840017)>:
   a28bc:      	sub	sp, sp, #0xd0
   a28c0:      	stp	x29, x30, [sp, #0x70]
   a28c4:      	stp	x28, x27, [sp, #0x80]
   a28c8:      	stp	x26, x25, [sp, #0x90]
   a28cc:      	stp	x24, x23, [sp, #0xa0]
   a28d0:      	stp	x22, x21, [sp, #0xb0]
   a28d4:      	stp	x20, x19, [sp, #0xc0]
   a28d8:      	add	x29, sp, #0x70
   a28dc:      	ldp	x13, x10, [x0]
   a28e0:      	mov	x8, xzr
   a28e4:      	ldp	x9, x15, [x0, #0x10]
   a28e8:      	ldr	x11, [x0, #0xc0]
   a28ec:      	ldp	x3, x2, [x0, #0x50]
   a28f0:      	str	x0, [sp, #0x8]
   a28f4:      	ldp	x16, x21, [x0, #0xa0]
   a28f8:      	stp	x9, x10, [x29, #-0x10]
   a28fc:      	ldp	x23, x17, [x0, #0x30]
   a2900:      	ldp	x6, x4, [x0, #0x80]
   a2904:      	ldp	x7, x1, [x0, #0x60]
   a2908:      	ldp	x19, x12, [x0, #0xb0]
   a290c:      	ldp	x18, x24, [x0, #0x20]
   a2910:      	ldp	x9, x28, [x0, #0x40]
   a2914:      	ldp	x5, x27, [x0, #0x70]
   a2918:      	ldp	x22, x26, [x0, #0x90]
   a291c:      	stur	x9, [x29, #-0x18]
   a2920:      	stur	x8, [x29, #-0x20]
   a2924:      	mov	x8, x28
   a2928:      	eor	x28, x27, x16
   a292c:      	eor	x30, x3, x24
   a2930:      	eor	x10, x6, x21
   a2934:      	eor	x9, x2, x23
   a2938:      	stp	x5, x11, [sp, #0x10]
   a293c:      	eor	x28, x28, x30
   a2940:      	eor	x9, x10, x9
   a2944:      	eor	x10, x26, x11
   a2948:      	eor	x30, x5, x8
   a294c:      	eor	x0, x4, x19
   a2950:      	eor	x11, x7, x17
   a2954:      	mov	x14, x24
   a2958:      	mov	x24, x4
   a295c:      	mov	x4, x17
   a2960:      	mov	x17, x15
   a2964:      	ldur	x15, [x29, #-0x8]
   a2968:      	ldur	x5, [x29, #-0x18]
   a296c:      	eor	x10, x10, x30
   a2970:      	eor	x11, x0, x11
   a2974:      	eor	x9, x9, x15
   a2978:      	eor	x10, x10, x18
   a297c:      	eor	x0, x22, x12
   a2980:      	eor	x30, x1, x5
   a2984:      	mov	x25, x22
   a2988:      	mov	x22, x12
   a298c:      	eor	x12, x10, x9, ror #63
   a2990:      	eor	x0, x0, x30
   a2994:      	mov	x20, x1
   a2998:      	ldur	x1, [x29, #-0x10]
   a299c:      	eor	x30, x0, x17
   a29a0:      	eor	x28, x28, x13
   a29a4:      	eor	x0, x12, x3
   a29a8:      	eor	x3, x12, x27
   a29ac:      	eor	x27, x9, x30, ror #63
   a29b0:      	eor	x11, x11, x1
   a29b4:      	eor	x13, x12, x13
   a29b8:      	eor	x14, x12, x14
   a29bc:      	str	x13, [sp, #0x28]
   a29c0:      	eor	x13, x28, x11, ror #63
   a29c4:      	eor	x10, x11, x10, ror #63
   a29c8:      	eor	x11, x27, x4
   a29cc:      	eor	x4, x30, x28, ror #63
   a29d0:      	eor	x12, x12, x16
   a29d4:      	stur	x3, [x29, #-0x28]
   a29d8:      	eor	x16, x13, x23
   a29dc:      	eor	x9, x13, x2
   a29e0:      	str	x12, [sp, #0x20]
   a29e4:      	eor	x12, x13, x15
   a29e8:      	eor	x23, x13, x6
   a29ec:      	eor	x21, x13, x21
   a29f0:      	eor	x13, x27, x7
   a29f4:      	eor	x7, x4, x18
   a29f8:      	ldp	x3, x18, [sp, #0x10]
   a29fc:      	str	x9, [sp, #0x30]
   a2a00:      	eor	x9, x27, x1
   a2a04:      	eor	x15, x10, x5
   a2a08:      	eor	x2, x27, x19
   a2a0c:      	stur	x9, [x29, #-0x30]
   a2a10:      	eor	x9, x27, x24
   a2a14:      	eor	x27, x10, x17
   a2a18:      	str	x15, [sp, #0x38]
   a2a1c:      	eor	x15, x10, x20
   a2a20:      	eor	x17, x10, x25
   a2a24:      	eor	x30, x4, x18
   a2a28:      	eor	x25, x4, x3
   a2a2c:      	ror	x3, x15, #0x27
   a2a30:      	ror	x15, x17, #0x2b
   a2a34:      	ror	x17, x30, #0x32
   a2a38:      	eor	x28, x4, x26
   a2a3c:      	ror	x26, x14, #0x1c
   a2a40:      	ror	x14, x16, #0x14
   a2a44:      	ror	x13, x13, #0x15
   a2a48:      	bic	x19, x17, x15
   a2a4c:      	ror	x20, x7, #0x25
   a2a50:      	eor	x1, x4, x8
   a2a54:      	bic	x30, x13, x14
   a2a58:      	bic	x7, x15, x13
   a2a5c:      	eor	x13, x19, x13
   a2a60:      	ldr	x19, [sp, #0x28]
   a2a64:      	ror	x4, x12, #0x3f
   a2a68:      	ror	x12, x27, #0x24
   a2a6c:      	ror	x2, x2, #0x3
   a2a70:      	eor	x7, x14, x7
   a2a74:      	ror	x5, x11, #0x3a
   a2a78:      	ror	x11, x1, #0x2c
   a2a7c:      	ror	x1, x23, #0x13
   a2a80:      	ldr	x18, [sp, #0x20]
   a2a84:      	stp	x13, x7, [x29, #-0x10]
   a2a88:      	bic	x13, x19, x17
   a2a8c:      	ror	x16, x0, #0x3d
   a2a90:      	eor	x15, x13, x15
   a2a94:      	bic	x13, x14, x19
   a2a98:      	bic	x14, x12, x2
   a2a9c:      	ror	x6, x18, #0x2e
   a2aa0:      	eor	x18, x13, x17
   a2aa4:      	bic	x13, x2, x1
   a2aa8:      	eor	x14, x1, x14
   a2aac:      	eor	x10, x10, x22
   a2ab0:      	eor	x17, x13, x16
   a2ab4:      	stur	x14, [x29, #-0x18]
   a2ab8:      	bic	x14, x1, x16
   a2abc:      	bic	x13, x16, x11
   a2ac0:      	ror	x7, x28, #0x38
   a2ac4:      	ror	x10, x10, #0x8
   a2ac8:      	eor	x24, x13, x12
   a2acc:      	eor	x23, x14, x11
   a2ad0:      	bic	x11, x11, x12
   a2ad4:      	bic	x12, x4, x6
   a2ad8:      	eor	x28, x11, x2
   a2adc:      	bic	x11, x6, x7
   a2ae0:      	eor	x1, x12, x7
   a2ae4:      	bic	x12, x7, x3
   a2ae8:      	ldr	x13, [sp, #0x30]
   a2aec:      	ror	x9, x9, #0x31
   a2af0:      	eor	x7, x11, x3
   a2af4:      	bic	x11, x3, x5
   a2af8:      	eor	x2, x12, x5
   a2afc:      	bic	x12, x20, x10
   a2b00:      	ror	x13, x13, #0x36
   a2b04:      	eor	x3, x4, x11
   a2b08:      	bic	x11, x5, x4
   a2b0c:      	eor	x22, x12, x9
   a2b10:      	ldur	x8, [x29, #-0x20]
   a2b14:      	ldp	x14, x12, [x29, #-0x30]
   a2b18:      	eor	x5, x11, x6
   a2b1c:      	bic	x11, x10, x9
   a2b20:      	ldr	x16, [sp, #0x38]
   a2b24:      	bic	x9, x9, x13
   a2b28:      	eor	x4, x13, x11
   a2b2c:      	bic	x11, x13, x26
   a2b30:      	ror	x13, x21, #0x3e
   a2b34:      	eor	x27, x11, x20
   a2b38:      	nop
   a2b3c:      	adr	x11, 0x28bc8 <anon.d126a1c03a02b7f85a0a23db829417bf.1.llvm.10957834227438840017+0x40>
   a2b40:      	ror	x12, x12, #0x17
   a2b44:      	eor	x6, x9, x26
   a2b48:      	bic	x9, x26, x20
   a2b4c:      	ldr	x11, [x11, x8]
   a2b50:      	ror	x0, x16, #0x9
   a2b54:      	ror	x21, x25, #0x19
   a2b58:      	ror	x14, x14, #0x2
   a2b5c:      	eor	x26, x9, x10
   a2b60:      	bic	x9, x13, x12
   a2b64:      	eor	x10, x11, x19
   a2b68:      	bic	x11, x21, x0
   a2b6c:      	eor	x19, x9, x21
   a2b70:      	bic	x9, x12, x21
   a2b74:      	add	x8, x8, #0x8
   a2b78:      	eor	x16, x11, x14
   a2b7c:      	eor	x21, x9, x0
   a2b80:      	bic	x9, x0, x14
   a2b84:      	bic	x11, x14, x13
   a2b88:      	cmp	x8, #0xc0
   a2b8c:      	eor	x12, x11, x12
   a2b90:      	eor	x11, x13, x9
   a2b94:      	eor	x13, x10, x30
   a2b98:      	b.ne	0xa2920 <toyos_crypto::keccak::permute (.llvm.10957834227438840017)+0x64>
   a2b9c:      	ldp	x9, x10, [x29, #-0x18]
   a2ba0:      	ldr	x8, [sp, #0x8]
   a2ba4:      	stp	x18, x24, [x8, #0x20]
   a2ba8:      	stp	x9, x28, [x8, #0x40]
   a2bac:      	ldur	x9, [x29, #-0x8]
   a2bb0:      	stp	x10, x15, [x8, #0x10]
   a2bb4:      	stp	x23, x17, [x8, #0x30]
   a2bb8:      	stp	x3, x2, [x8, #0x50]
   a2bbc:      	stp	x7, x1, [x8, #0x60]
   a2bc0:      	stp	x5, x27, [x8, #0x70]
   a2bc4:      	stp	x6, x4, [x8, #0x80]
   a2bc8:      	stp	x22, x26, [x8, #0x90]
   a2bcc:      	stp	x16, x21, [x8, #0xa0]
   a2bd0:      	stp	x19, x12, [x8, #0xb0]
   a2bd4:      	str	x11, [x8, #0xc0]
   a2bd8:      	stp	x13, x9, [x8]
   a2bdc:      	ldp	x20, x19, [sp, #0xc0]
   a2be0:      	ldp	x22, x21, [sp, #0xb0]
   a2be4:      	ldp	x24, x23, [sp, #0xa0]
   a2be8:      	ldp	x26, x25, [sp, #0x90]
   a2bec:      	ldp	x28, x27, [sp, #0x80]
   a2bf0:      	ldp	x29, x30, [sp, #0x70]
   a2bf4:      	add	sp, sp, #0xd0
   a2bf8:      	ret

00000000000a2f04 <<toyos_crypto::keccak::Sponge as core::ops::drop::Drop>::drop>:
   a2f04:      	stp	x29, x30, [sp, #-0x10]!
   a2f08:      	mov	x29, sp
   a2f0c:      	str	xzr, [x0]
   a2f10:      	str	xzr, [x0, #0x8]
   a2f14:      	str	xzr, [x0, #0x10]
   a2f18:      	str	xzr, [x0, #0x18]
   a2f1c:      	str	xzr, [x0, #0x20]
   a2f20:      	str	xzr, [x0, #0x28]
   a2f24:      	str	xzr, [x0, #0x30]
   a2f28:      	str	xzr, [x0, #0x38]
   a2f2c:      	str	xzr, [x0, #0x40]
   a2f30:      	str	xzr, [x0, #0x48]
   a2f34:      	str	xzr, [x0, #0x50]
   a2f38:      	str	xzr, [x0, #0x58]
   a2f3c:      	str	xzr, [x0, #0x60]
   a2f40:      	str	xzr, [x0, #0x68]
   a2f44:      	str	xzr, [x0, #0x70]
   a2f48:      	str	xzr, [x0, #0x78]
   a2f4c:      	str	xzr, [x0, #0x80]
   a2f50:      	str	xzr, [x0, #0x88]
   a2f54:      	str	xzr, [x0, #0x90]
   a2f58:      	str	xzr, [x0, #0x98]
   a2f5c:      	str	xzr, [x0, #0xa0]
   a2f60:      	str	xzr, [x0, #0xa8]
   a2f64:      	str	xzr, [x0, #0xb0]
   a2f68:      	str	xzr, [x0, #0xb8]
   a2f6c:      	str	xzr, [x0, #0xc0]
   a2f70:      	ldp	x29, x30, [sp], #0x10
   a2f74:      	ret

