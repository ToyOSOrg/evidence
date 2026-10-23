0000000000001034 <__RINvNtNtCsb9t97VbgJUo_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_>:
    1034:	sub	sp, sp, #0x170
    1038:	stp	x28, x27, [sp, #272]
    103c:	stp	x26, x25, [sp, #288]
    1040:	stp	x24, x23, [sp, #304]
    1044:	stp	x22, x21, [sp, #320]
    1048:	stp	x20, x19, [sp, #336]
    104c:	stp	x29, x30, [sp, #352]
    1050:	add	x29, sp, #0x160
    1054:	mov	x11, x1
    1058:	str	x8, [sp, #8]
    105c:	mov	x28, #0x0                   	// #0
    1060:	stp	xzr, xzr, [x29, #-152]
    1064:	stur	xzr, [x29, #-136]
    1068:	mov	x25, #0x0                   	// #0
    106c:	mov	x19, #0x0                   	// #0
    1070:	mov	x30, #0x0                   	// #0
    1074:	mov	x6, #0x0                   	// #0
    1078:	ldp	x8, x9, [x0]
    107c:	extr	x13, x9, x8, #62
    1080:	ldp	x10, x12, [x0, #16]
    1084:	extr	x14, x10, x9, #60
    1088:	extr	x15, x12, x10, #58
    108c:	ldp	x9, x3, [x0, #32]
    1090:	extr	x4, x9, x12, #56
    1094:	extr	x5, x3, x9, #54
    1098:	ldp	x20, x12, [x1]
    109c:	extr	x9, x12, x20, #62
    10a0:	ldp	x10, x17, [x1, #16]
    10a4:	extr	x12, x10, x12, #60
    10a8:	extr	x1, x17, x10, #58
    10ac:	ldp	x10, x11, [x11, #32]
    10b0:	extr	x26, x10, x17, #56
    10b4:	extr	x7, x11, x10, #54
    10b8:	and	x2, x8, #0x3fffffffffffffff
    10bc:	and	x17, x13, #0x3fffffffffffffff
    10c0:	and	x0, x14, #0x3fffffffffffffff
    10c4:	and	x10, x15, #0x3fffffffffffffff
    10c8:	and	x8, x4, #0x3fffffffffffffff
    10cc:	stp	x10, x8, [x29, #-128]
    10d0:	and	x8, x5, #0x3fffffffffffffff
    10d4:	stur	x8, [x29, #-112]
    10d8:	mov	x14, #0xffffffffffffffff    	// #-1
    10dc:	lsr	x16, x3, #52
    10e0:	lsr	x10, x11, #52
    10e4:	mov	w8, #0xfff                 	// #4095
    10e8:	mov	x13, #0x3fffffffffffffff    	// #4611686018427387903
    10ec:	mov	x21, #0x3fffffffffffffff    	// #4611686018427387903
    10f0:	mov	x22, #0x3fffffffffffffff    	// #4611686018427387903
    10f4:	mov	x24, #0xffffffffffffffef    	// #-17
    10f8:	movk	x24, #0x3fff, lsl #48
    10fc:	mov	x15, #0x3ffffffc00000000    	// #4611686001247518720
    1100:	mov	w3, #0xffffffff            	// #-1
    1104:	str	x8, [sp, #136]
    1108:	str	x16, [sp, #160]
    110c:	mov	x8, x10
    1110:	stp	x25, x19, [x29, #-168]
    1114:	stur	x6, [x29, #-104]
    1118:	mov	x6, #0x0                   	// #0
    111c:	mov	x5, #0x0                   	// #0
    1120:	and	x11, x7, #0x3fffffffffffffff
    1124:	and	x16, x26, #0x3fffffffffffffff
    1128:	and	x10, x1, #0x3fffffffffffffff
    112c:	stp	x10, x11, [sp, #168]
    1130:	and	x10, x12, #0x3fffffffffffffff
    1134:	and	x9, x9, #0x3fffffffffffffff
    1138:	stp	x9, x10, [sp, #144]
    113c:	and	x9, x20, #0x3fffffffffffffff
    1140:	mov	w10, #0x3e                  	// #62
    1144:	mov	x11, x3
    1148:	mov	x12, x2
    114c:	mov	w20, #0x1                   	// #1
    1150:	mov	w7, #0x1                   	// #1
    1154:	sbfx	x1, x12, #0, #1
    1158:	asr	x4, x14, #63
    115c:	and	x19, x4, x1
    1160:	and	x23, x1, x11
    1164:	and	x25, x19, x11, lsl #1
    1168:	add	x12, x23, x12
    116c:	sub	x12, x12, x25
    1170:	eor	x23, x4, x20
    1174:	and	x23, x23, x1
    1178:	sub	x23, x23, x19
    117c:	add	x5, x23, x5
    1180:	eor	x4, x4, x6
    1184:	and	x1, x4, x1
    1188:	sub	x1, x1, x19
    118c:	add	x7, x1, x7
    1190:	and	x1, x12, x19
    1194:	add	x11, x1, x11
    1198:	lsr	x12, x12, #1
    119c:	and	x1, x5, x19
    11a0:	add	x1, x1, x20
    11a4:	lsl	x20, x1, #1
    11a8:	and	x1, x7, x19
    11ac:	add	x1, x1, x6
    11b0:	lsl	x6, x1, #1
    11b4:	eor	x14, x19, x14
    11b8:	mvn	x1, x19
    11bc:	add	x14, x14, x1
    11c0:	subs	w10, w10, #0x1
    11c4:	b.ne	1154 <__RINvNtNtCsb9t97VbgJUo_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_+0x120>  // b.any
    11c8:	asr	x25, x6, #63
    11cc:	umulh	x10, x6, x2
    11d0:	madd	x10, x25, x2, x10
    11d4:	mul	x11, x6, x2
    11d8:	asr	x27, x20, #63
    11dc:	umulh	x12, x20, x3
    11e0:	madd	x12, x27, x3, x12
    11e4:	mul	x1, x20, x3
    11e8:	adds	x11, x1, x11
    11ec:	adc	x19, x12, x10
    11f0:	asr	x1, x7, #63
    11f4:	umulh	x10, x7, x2
    11f8:	madd	x10, x1, x2, x10
    11fc:	mul	x12, x7, x2
    1200:	asr	x26, x5, #63
    1204:	umulh	x2, x5, x3
    1208:	madd	x2, x26, x3, x2
    120c:	mul	x3, x5, x3
    1210:	adds	x3, x3, x12
    1214:	orr	x12, x11, x3
    1218:	adc	x4, x2, x10
    121c:	tst	x12, #0x3fffffffffffffff
    1220:	b.ne	1ab0 <__RINvNtNtCsb9t97VbgJUo_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_+0xa7c>  // b.any
    1224:	stp	x8, x16, [sp, #120]
    1228:	asr	x10, x30, #63
    122c:	asr	x12, x8, #63
    1230:	and	x2, x10, x20
    1234:	and	x23, x12, x6
    1238:	add	x2, x23, x2
    123c:	and	x10, x10, x5
    1240:	and	x12, x12, x7
    1244:	add	x10, x12, x10
    1248:	smulh	x12, x9, x6
    124c:	mul	x23, x9, x6
    1250:	str	x30, [sp, #112]
    1254:	umulh	x30, x28, x20
    1258:	madd	x30, x28, x27, x30
    125c:	mul	x8, x28, x20
    1260:	adds	x8, x23, x8
    1264:	adc	x12, x12, x30
    1268:	smulh	x23, x9, x7
    126c:	mul	x9, x9, x7
    1270:	umulh	x30, x28, x5
    1274:	madd	x30, x28, x26, x30
    1278:	mul	x28, x28, x5
    127c:	adds	x9, x9, x28
    1280:	adc	x30, x23, x30
    1284:	mov	x16, #0xfffffffeffffffff    	// #-4294967297
    1288:	movk	x16, #0x3fff, lsl #48
    128c:	madd	x23, x8, x16, x2
    1290:	and	x23, x23, #0x3fffffffffffffff
    1294:	sub	x28, x2, x23
    1298:	madd	x2, x9, x16, x10
    129c:	and	x2, x2, #0x3fffffffffffffff
    12a0:	sub	x23, x10, x2
    12a4:	lsl	x10, x28, #32
    12a8:	mov	w2, #0xffffffff            	// #-1
    12ac:	smulh	x16, x28, x2
    12b0:	sub	x10, x10, x28
    12b4:	adds	x8, x10, x8
    12b8:	adc	x12, x16, x12
    12bc:	lsl	x10, x23, #32
    12c0:	smulh	x16, x23, x2
    12c4:	sub	x10, x10, x23
    12c8:	adds	x2, x10, x9
    12cc:	adc	x10, x16, x30
    12d0:	orr	x9, x8, x2
    12d4:	tst	x9, #0x3fffffffffffffff
    12d8:	ldur	x9, [x29, #-104]
    12dc:	b.ne	1ac8 <__RINvNtNtCsb9t97VbgJUo_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_+0xa94>  // b.any
    12e0:	add	x9, x9, #0x1
    12e4:	stur	x9, [x29, #-104]
    12e8:	extr	x9, x19, x11, #62
    12ec:	mul	x11, x15, x20
    12f0:	adds	x9, x11, x9
    12f4:	umulh	x11, x15, x20
    12f8:	madd	x11, x15, x27, x11
    12fc:	asr	x16, x19, #62
    1300:	adc	x11, x11, x16
    1304:	mul	x16, x17, x6
    1308:	str	x10, [sp, #24]
    130c:	adds	x10, x9, x16
    1310:	str	x10, [sp, #104]
    1314:	umulh	x9, x17, x6
    1318:	madd	x9, x17, x25, x9
    131c:	adc	x9, x11, x9
    1320:	mul	x11, x24, x20
    1324:	extr	x16, x9, x10, #62
    1328:	adds	x11, x11, x16
    132c:	umulh	x16, x24, x20
    1330:	madd	x16, x24, x27, x16
    1334:	asr	x9, x9, #62
    1338:	adc	x9, x16, x9
    133c:	mul	x16, x0, x6
    1340:	adds	x10, x11, x16
    1344:	str	x10, [sp, #96]
    1348:	umulh	x11, x0, x6
    134c:	madd	x11, x0, x25, x11
    1350:	adc	x9, x9, x11
    1354:	mul	x11, x22, x20
    1358:	extr	x16, x9, x10, #62
    135c:	adds	x11, x11, x16
    1360:	umulh	x16, x22, x20
    1364:	madd	x16, x22, x27, x16
    1368:	asr	x9, x9, #62
    136c:	adc	x9, x16, x9
    1370:	str	x2, [sp, #16]
    1374:	ldur	x2, [x29, #-128]
    1378:	mul	x16, x2, x6
    137c:	adds	x10, x11, x16
    1380:	str	x10, [sp, #88]
    1384:	umulh	x11, x2, x6
    1388:	madd	x11, x2, x25, x11
    138c:	adc	x9, x9, x11
    1390:	mul	x11, x21, x20
    1394:	extr	x16, x9, x10, #62
    1398:	adds	x11, x11, x16
    139c:	umulh	x16, x21, x20
    13a0:	madd	x16, x21, x27, x16
    13a4:	asr	x9, x9, #62
    13a8:	adc	x9, x16, x9
    13ac:	ldur	x10, [x29, #-120]
    13b0:	mul	x16, x10, x6
    13b4:	adds	x16, x11, x16
    13b8:	str	x16, [sp, #80]
    13bc:	umulh	x11, x10, x6
    13c0:	madd	x11, x10, x25, x11
    13c4:	adc	x9, x9, x11
    13c8:	extr	x11, x9, x16, #62
    13cc:	mul	x16, x13, x20
    13d0:	adds	x11, x16, x11
    13d4:	umulh	x16, x13, x20
    13d8:	madd	x16, x13, x27, x16
    13dc:	asr	x9, x9, #62
    13e0:	adc	x9, x16, x9
    13e4:	ldur	x30, [x29, #-112]
    13e8:	umulh	x16, x30, x6
    13ec:	madd	x16, x30, x25, x16
    13f0:	mul	x19, x30, x6
    13f4:	adds	x19, x11, x19
    13f8:	str	x19, [sp, #72]
    13fc:	adc	x9, x9, x16
    1400:	ldr	x25, [sp, #136]
    1404:	mul	x11, x25, x20
    1408:	extr	x16, x9, x19, #62
    140c:	adds	x11, x11, x16
    1410:	asr	x9, x9, #62
    1414:	smulh	x16, x25, x20
    1418:	adc	x9, x16, x9
    141c:	ldr	x19, [sp, #160]
    1420:	mul	x16, x19, x6
    1424:	adds	x11, x11, x16
    1428:	str	x11, [sp, #64]
    142c:	smulh	x11, x19, x6
    1430:	adc	x9, x9, x11
    1434:	str	x9, [sp, #56]
    1438:	umulh	x9, x15, x5
    143c:	madd	x9, x15, x26, x9
    1440:	mul	x11, x15, x5
    1444:	extr	x15, x4, x3, #62
    1448:	adds	x11, x11, x15
    144c:	asr	x15, x4, #62
    1450:	adc	x9, x9, x15
    1454:	umulh	x15, x17, x7
    1458:	madd	x16, x17, x1, x15
    145c:	mul	x15, x17, x7
    1460:	adds	x15, x11, x15
    1464:	str	x15, [sp, #48]
    1468:	adc	x9, x9, x16
    146c:	umulh	x11, x24, x5
    1470:	madd	x11, x24, x26, x11
    1474:	mul	x16, x24, x5
    1478:	extr	x17, x9, x15, #62
    147c:	adds	x16, x16, x17
    1480:	asr	x9, x9, #62
    1484:	adc	x9, x11, x9
    1488:	umulh	x11, x0, x7
    148c:	madd	x11, x0, x1, x11
    1490:	mul	x17, x0, x7
    1494:	adds	x15, x16, x17
    1498:	str	x15, [sp, #40]
    149c:	adc	x9, x9, x11
    14a0:	umulh	x11, x22, x5
    14a4:	madd	x11, x22, x26, x11
    14a8:	mul	x16, x22, x5
    14ac:	extr	x0, x9, x15, #62
    14b0:	adds	x16, x16, x0
    14b4:	asr	x9, x9, #62
    14b8:	adc	x9, x11, x9
    14bc:	umulh	x11, x2, x7
    14c0:	madd	x11, x2, x1, x11
    14c4:	mul	x0, x2, x7
    14c8:	adds	x15, x16, x0
    14cc:	str	x15, [sp, #32]
    14d0:	adc	x9, x9, x11
    14d4:	umulh	x11, x21, x5
    14d8:	madd	x11, x21, x26, x11
    14dc:	mul	x16, x21, x5
    14e0:	extr	x3, x9, x15, #62
    14e4:	adds	x16, x16, x3
    14e8:	asr	x9, x9, #62
    14ec:	adc	x9, x11, x9
    14f0:	umulh	x11, x10, x7
    14f4:	madd	x11, x10, x1, x11
    14f8:	mul	x3, x10, x7
    14fc:	adds	x10, x16, x3
    1500:	stur	x10, [x29, #-128]
    1504:	adc	x9, x9, x11
    1508:	umulh	x11, x13, x5
    150c:	madd	x11, x13, x26, x11
    1510:	extr	x3, x9, x10, #62
    1514:	mul	x13, x13, x5
    1518:	adds	x13, x13, x3
    151c:	asr	x9, x9, #62
    1520:	adc	x9, x11, x9
    1524:	umulh	x11, x30, x7
    1528:	madd	x11, x30, x1, x11
    152c:	mul	x1, x30, x7
    1530:	adds	x0, x13, x1
    1534:	adc	x9, x9, x11
    1538:	mul	x11, x25, x5
    153c:	extr	x13, x9, x0, #62
    1540:	adds	x11, x11, x13
    1544:	smulh	x13, x25, x5
    1548:	asr	x9, x9, #62
    154c:	adc	x9, x13, x9
    1550:	mul	x13, x19, x7
    1554:	adds	x21, x11, x13
    1558:	smulh	x11, x19, x7
    155c:	adc	x9, x9, x11
    1560:	stur	x9, [x29, #-112]
    1564:	extr	x9, x12, x8, #62
    1568:	ldur	x15, [x29, #-152]
    156c:	mul	x11, x15, x20
    1570:	adds	x9, x11, x9
    1574:	asr	x8, x12, #62
    1578:	umulh	x11, x15, x20
    157c:	madd	x11, x15, x27, x11
    1580:	adc	x8, x11, x8
    1584:	ldr	x16, [sp, #144]
    1588:	mul	x11, x16, x6
    158c:	adds	x9, x9, x11
    1590:	smulh	x11, x16, x6
    1594:	adc	x8, x8, x11
    1598:	lsl	x1, x28, #62
    159c:	sub	x11, x1, x28, lsl #34
    15a0:	adds	x11, x9, x11
    15a4:	mov	x13, #0x3ffffffc00000000    	// #4611686001247518720
    15a8:	smulh	x9, x28, x13
    15ac:	adc	x8, x8, x9
    15b0:	ldp	x9, x10, [sp, #16]
    15b4:	extr	x9, x10, x9, #62
    15b8:	umulh	x12, x15, x5
    15bc:	madd	x12, x15, x26, x12
    15c0:	mul	x2, x15, x5
    15c4:	adds	x9, x2, x9
    15c8:	asr	x10, x10, #62
    15cc:	adc	x10, x12, x10
    15d0:	mul	x12, x16, x7
    15d4:	adds	x9, x9, x12
    15d8:	smulh	x12, x16, x7
    15dc:	adc	x2, x10, x12
    15e0:	lsl	x12, x23, #62
    15e4:	sub	x10, x12, x23, lsl #34
    15e8:	adds	x30, x9, x10
    15ec:	smulh	x9, x23, x13
    15f0:	adc	x9, x2, x9
    15f4:	extr	x2, x8, x11, #62
    15f8:	ldur	x10, [x29, #-144]
    15fc:	mul	x3, x10, x20
    1600:	adds	x2, x3, x2
    1604:	asr	x8, x8, #62
    1608:	umulh	x3, x10, x20
    160c:	madd	x3, x10, x27, x3
    1610:	adc	x8, x3, x8
    1614:	ldr	x15, [sp, #152]
    1618:	mul	x3, x15, x6
    161c:	adds	x2, x2, x3
    1620:	smulh	x3, x15, x6
    1624:	adc	x8, x8, x3
    1628:	mov	x13, #0xffffffffffffffef    	// #-17
    162c:	movk	x13, #0x3fff, lsl #48
    1630:	mul	x3, x28, x13
    1634:	adds	x19, x2, x3
    1638:	smulh	x2, x28, x13
    163c:	adc	x8, x8, x2
    1640:	umulh	x2, x10, x5
    1644:	madd	x2, x10, x26, x2
    1648:	mul	x3, x10, x5
    164c:	extr	x4, x9, x30, #62
    1650:	adds	x3, x3, x4
    1654:	asr	x9, x9, #62
    1658:	adc	x9, x2, x9
    165c:	mul	x2, x15, x7
    1660:	adds	x2, x3, x2
    1664:	smulh	x3, x15, x7
    1668:	adc	x3, x9, x3
    166c:	mul	x9, x23, x13
    1670:	adds	x9, x2, x9
    1674:	smulh	x2, x23, x13
    1678:	adc	x22, x3, x2
    167c:	extr	x2, x8, x19, #62
    1680:	ldur	x13, [x29, #-136]
    1684:	mul	x3, x13, x20
    1688:	adds	x2, x3, x2
    168c:	asr	x8, x8, #62
    1690:	umulh	x3, x13, x20
    1694:	madd	x3, x13, x27, x3
    1698:	adc	x8, x3, x8
    169c:	ldr	x15, [sp, #168]
    16a0:	mul	x3, x15, x6
    16a4:	adds	x3, x2, x3
    16a8:	smulh	x2, x15, x6
    16ac:	adc	x8, x8, x2
    16b0:	sub	x2, x1, x28
    16b4:	adds	x4, x3, x2
    16b8:	mov	x10, #0x3fffffffffffffff    	// #4611686018427387903
    16bc:	smulh	x3, x28, x10
    16c0:	adc	x8, x8, x3
    16c4:	umulh	x1, x13, x5
    16c8:	madd	x1, x13, x26, x1
    16cc:	mul	x24, x13, x5
    16d0:	extr	x25, x22, x9, #62
    16d4:	adds	x24, x24, x25
    16d8:	asr	x22, x22, #62
    16dc:	adc	x1, x1, x22
    16e0:	mul	x22, x15, x7
    16e4:	adds	x24, x24, x22
    16e8:	smulh	x22, x15, x7
    16ec:	adc	x1, x1, x22
    16f0:	sub	x22, x12, x23
    16f4:	adds	x12, x24, x22
    16f8:	smulh	x24, x23, x10
    16fc:	adc	x1, x1, x24
    1700:	extr	x25, x8, x4, #62
    1704:	ldur	x10, [x29, #-168]
    1708:	mul	x13, x10, x20
    170c:	adds	x13, x13, x25
    1710:	asr	x8, x8, #62
    1714:	umulh	x25, x10, x20
    1718:	madd	x25, x10, x27, x25
    171c:	adc	x8, x25, x8
    1720:	ldr	x16, [sp, #128]
    1724:	mul	x25, x16, x6
    1728:	adds	x13, x13, x25
    172c:	smulh	x25, x16, x6
    1730:	adc	x8, x8, x25
    1734:	adds	x25, x13, x2
    1738:	adc	x8, x8, x3
    173c:	extr	x13, x1, x12, #62
    1740:	mul	x15, x10, x5
    1744:	adds	x13, x15, x13
    1748:	umulh	x15, x10, x5
    174c:	madd	x15, x10, x26, x15
    1750:	asr	x1, x1, #62
    1754:	adc	x15, x15, x1
    1758:	mul	x1, x16, x7
    175c:	adds	x13, x13, x1
    1760:	smulh	x1, x16, x7
    1764:	adc	x15, x15, x1
    1768:	adds	x1, x13, x22
    176c:	adc	x13, x15, x24
    1770:	extr	x15, x8, x25, #62
    1774:	ldur	x10, [x29, #-160]
    1778:	mul	x17, x10, x20
    177c:	adds	x15, x17, x15
    1780:	umulh	x17, x10, x20
    1784:	madd	x17, x10, x27, x17
    1788:	asr	x8, x8, #62
    178c:	adc	x8, x17, x8
    1790:	ldr	x16, [sp, #176]
    1794:	mul	x17, x16, x6
    1798:	adds	x15, x15, x17
    179c:	smulh	x17, x16, x6
    17a0:	adc	x8, x8, x17
    17a4:	adds	x27, x15, x2
    17a8:	adc	x8, x8, x3
    17ac:	umulh	x15, x10, x5
    17b0:	madd	x15, x10, x26, x15
    17b4:	mul	x17, x10, x5
    17b8:	extr	x2, x13, x1, #62
    17bc:	adds	x17, x17, x2
    17c0:	asr	x13, x13, #62
    17c4:	adc	x13, x15, x13
    17c8:	mul	x15, x16, x7
    17cc:	adds	x15, x17, x15
    17d0:	smulh	x17, x16, x7
    17d4:	adc	x13, x13, x17
    17d8:	adds	x26, x15, x22
    17dc:	adc	x13, x13, x24
    17e0:	extr	x15, x8, x27, #62
    17e4:	ldp	x2, x16, [sp, #112]
    17e8:	mul	x17, x2, x20
    17ec:	adds	x15, x17, x15
    17f0:	asr	x8, x8, #62
    17f4:	smulh	x17, x2, x20
    17f8:	adc	x8, x17, x8
    17fc:	mul	x17, x16, x6
    1800:	adds	x15, x15, x17
    1804:	smulh	x17, x16, x6
    1808:	adc	x8, x8, x17
    180c:	lsl	x17, x28, #12
    1810:	sub	x17, x17, x28
    1814:	adds	x6, x15, x17
    1818:	mov	w10, #0xfff                 	// #4095
    181c:	smulh	x15, x28, x10
    1820:	adc	x8, x8, x15
    1824:	extr	x15, x13, x26, #62
    1828:	mul	x17, x2, x5
    182c:	adds	x15, x17, x15
    1830:	smulh	x17, x2, x5
    1834:	asr	x13, x13, #62
    1838:	adc	x13, x17, x13
    183c:	mul	x17, x16, x7
    1840:	adds	x15, x15, x17
    1844:	smulh	x17, x16, x7
    1848:	adc	x20, x13, x17
    184c:	lsl	x13, x23, #12
    1850:	sub	x13, x13, x23
    1854:	adds	x7, x15, x13
    1858:	ldp	x13, x15, [sp, #56]
    185c:	extr	x5, x13, x15, #62
    1860:	ldur	x13, [x29, #-112]
    1864:	extr	x16, x13, x21, #62
    1868:	and	x13, x21, #0x3fffffffffffffff
    186c:	stur	x13, [x29, #-112]
    1870:	and	x13, x0, #0x3fffffffffffffff
    1874:	stur	x13, [x29, #-120]
    1878:	ldur	x13, [x29, #-128]
    187c:	and	x13, x13, #0x3fffffffffffffff
    1880:	stur	x13, [x29, #-128]
    1884:	ldr	x13, [sp, #32]
    1888:	and	x0, x13, #0x3fffffffffffffff
    188c:	ldr	x13, [sp, #40]
    1890:	and	x17, x13, #0x3fffffffffffffff
    1894:	ldr	x13, [sp, #48]
    1898:	and	x2, x13, #0x3fffffffffffffff
    189c:	and	x13, x15, #0x3fffffffffffffff
    18a0:	ldr	x15, [sp, #72]
    18a4:	and	x21, x15, #0x3fffffffffffffff
    18a8:	ldr	x15, [sp, #80]
    18ac:	and	x22, x15, #0x3fffffffffffffff
    18b0:	ldr	x15, [sp, #88]
    18b4:	and	x24, x15, #0x3fffffffffffffff
    18b8:	ldp	x15, x3, [sp, #96]
    18bc:	and	x15, x15, #0x3fffffffffffffff
    18c0:	and	x3, x3, #0x3fffffffffffffff
    18c4:	and	x28, x11, #0x3fffffffffffffff
    18c8:	and	x11, x19, #0x3fffffffffffffff
    18cc:	stur	x11, [x29, #-152]
    18d0:	and	x11, x4, #0x3fffffffffffffff
    18d4:	stur	x11, [x29, #-144]
    18d8:	and	x11, x25, #0x3fffffffffffffff
    18dc:	stur	x11, [x29, #-136]
    18e0:	and	x25, x27, #0x3fffffffffffffff
    18e4:	smulh	x11, x23, x10
    18e8:	adc	x11, x20, x11
    18ec:	mov	x20, x30
    18f0:	and	x19, x6, #0x3fffffffffffffff
    18f4:	extr	x10, x11, x7, #62
    18f8:	extr	x30, x8, x6, #62
    18fc:	mov	x8, x5
    1900:	ldur	x6, [x29, #-104]
    1904:	cmp	x6, #0x12
    1908:	b.ne	1104 <__RINvNtNtCsb9t97VbgJUo_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_+0xd0>  // b.any
    190c:	orr	x8, x17, x2
    1910:	orr	x8, x0, x8
    1914:	ldp	x10, x9, [x29, #-128]
    1918:	orr	x8, x10, x8
    191c:	orr	x8, x9, x8
    1920:	ldur	x9, [x29, #-112]
    1924:	orr	x8, x9, x8
    1928:	orr	x8, x8, x16
    192c:	stur	x8, [x29, #-96]
    1930:	cbnz	x8, 1ae0 <__RINvNtNtCsb9t97VbgJUo_12toyos_crypto10montgomery8divsteps6invertNtNtB6_4nist9P384FieldKj6_EB6_+0xaac>
    1934:	asr	x8, x30, #63
    1938:	add	x9, x28, w8, uxtw
    193c:	and	x10, x9, #0x3fffffffffffffff
    1940:	ldp	x11, x12, [x29, #-152]
    1944:	add	x9, x11, x9, lsr #62
    1948:	and	x11, x8, #0x3ffffffc00000000
    194c:	add	x9, x9, x11
    1950:	and	x11, x9, #0x3fffffffffffffff
    1954:	add	x9, x12, x9, lsr #62
    1958:	mov	x0, #0xffffffffffffffef    	// #-17
    195c:	movk	x0, #0x3fff, lsl #48
    1960:	and	x12, x8, x0
    1964:	add	x9, x9, x12
    1968:	and	x12, x9, #0x3fffffffffffffff
    196c:	ldur	x13, [x29, #-136]
    1970:	add	x9, x13, x9, lsr #62
    1974:	and	x13, x8, #0x3fffffffffffffff
    1978:	add	x9, x9, x13
    197c:	and	x14, x9, #0x3fffffffffffffff
    1980:	add	x9, x25, x9, lsr #62
    1984:	add	x9, x9, x13
    1988:	and	x15, x9, #0x3fffffffffffffff
    198c:	add	x9, x19, x9, lsr #62
    1990:	add	x9, x9, x13
    1994:	and	x13, x9, #0x3fffffffffffffff
    1998:	add	x9, x30, x9, lsr #62
    199c:	and	x8, x8, #0xfff
    19a0:	asr	x16, x5, #63
    19a4:	eor	x10, x10, x16
    19a8:	sub	x10, x10, x16
    19ac:	and	x17, x10, #0x3fffffffffffffff
    19b0:	eor	x11, x11, x16
    19b4:	sub	x11, x11, x16
    19b8:	add	x10, x11, x10, asr #62
    19bc:	and	x11, x10, #0x3fffffffffffffff
    19c0:	eor	x12, x12, x16
    19c4:	sub	x12, x12, x16
    19c8:	add	x10, x12, x10, asr #62
    19cc:	and	x12, x10, #0x3fffffffffffffff
    19d0:	eor	x14, x14, x16
    19d4:	sub	x14, x14, x16
    19d8:	add	x10, x14, x10, asr #62
    19dc:	and	x14, x10, #0x3fffffffffffffff
    19e0:	eor	x15, x15, x16
    19e4:	sub	x15, x15, x16
    19e8:	add	x10, x15, x10, asr #62
    19ec:	and	x15, x10, #0x3fffffffffffffff
    19f0:	eor	x13, x13, x16
    19f4:	sub	x13, x13, x16
    19f8:	add	x10, x13, x10, asr #62
    19fc:	and	x13, x10, #0x3fffffffffffffff
    1a00:	add	x8, x9, x8
    1a04:	eor	x8, x8, x16
    1a08:	sub	x8, x8, x16
    1a0c:	add	x8, x8, x10, asr #62
    1a10:	asr	x9, x8, #63
    1a14:	add	x10, x17, w9, uxtw
    1a18:	add	x11, x11, x10, lsr #62
    1a1c:	and	x16, x9, #0x3ffffffc00000000
    1a20:	add	x16, x11, x16
    1a24:	add	x12, x12, x16, lsr #62
    1a28:	and	x17, x9, x0
    1a2c:	add	x12, x12, x17
    1a30:	add	x14, x14, x12, lsr #62
    1a34:	and	x17, x9, #0x3fffffffffffffff
    1a38:	add	x14, x14, x17
    1a3c:	add	x15, x15, x14, lsr #62
    1a40:	add	x15, x15, x17
    1a44:	add	x13, x13, x15, lsr #62
    1a48:	add	x13, x13, x17
    1a4c:	add	x8, x8, x13, lsr #62
    1a50:	lsr	x17, x13, #10
    1a54:	add	w8, w8, w9
    1a58:	bfi	x17, x8, #52, #12
    1a5c:	lsr	x8, x15, #8
    1a60:	lsr	x9, x14, #6
    1a64:	bfi	x9, x15, #56, #8
    1a68:	lsr	x15, x16, #2
    1a6c:	bfi	x15, x12, #60, #4
    1a70:	bfi	x10, x11, #62, #2
    1a74:	ldr	x11, [sp, #8]
    1a78:	stp	x10, x15, [x11]
    1a7c:	lsr	x10, x12, #4
    1a80:	bfi	x10, x14, #58, #6
    1a84:	stp	x10, x9, [x11, #16]
    1a88:	bfi	x8, x13, #54, #10
    1a8c:	stp	x8, x17, [x11, #32]
    1a90:	ldp	x29, x30, [sp, #352]
    1a94:	ldp	x20, x19, [sp, #336]
    1a98:	ldp	x22, x21, [sp, #320]
    1a9c:	ldp	x24, x23, [sp, #304]
    1aa0:	ldp	x26, x25, [sp, #288]
    1aa4:	ldp	x28, x27, [sp, #272]
    1aa8:	add	sp, sp, #0x170
    1aac:	ret
    1ab0:	adrp	x0, 26df <l_anon.ad64d6a0a756f21eb8108aa1092e37cb.11>
    1ab4:	add	x0, x0, #0x0
    1ab8:	adrp	x2, 2778 <l_anon.ad64d6a0a756f21eb8108aa1092e37cb.12>
    1abc:	add	x2, x2, #0x0
    1ac0:	mov	w1, #0x40                  	// #64
    1ac4:	bl	0 <__RNvNtCs8Mbv00yxnRz_4core9panicking5panic>
    1ac8:	adrp	x0, 271f <l_anon.ad64d6a0a756f21eb8108aa1092e37cb.13>
    1acc:	add	x0, x0, #0x0
    1ad0:	adrp	x2, 2790 <l_anon.ad64d6a0a756f21eb8108aa1092e37cb.14>
    1ad4:	add	x2, x2, #0x0
    1ad8:	mov	w1, #0x40                  	// #64
    1adc:	bl	0 <__RNvNtCs8Mbv00yxnRz_4core9panicking5panic>
    1ae0:	adrp	x2, 26c0 <l_anon.ad64d6a0a756f21eb8108aa1092e37cb.3>
    1ae4:	add	x2, x2, #0x0
    1ae8:	adrp	x3, 26c8 <l_anon.ad64d6a0a756f21eb8108aa1092e37cb.4>
    1aec:	add	x3, x3, #0x0
    1af0:	adrp	x5, 2760 <l_anon.ad64d6a0a756f21eb8108aa1092e37cb.5>
    1af4:	add	x5, x5, #0x0
    1af8:	sub	x1, x29, #0x60
    1afc:	mov	w0, #0x0                   	// #0
    1b00:	mov	w4, #0x2f                  	// #47
    1b04:	bl	0 <__RINvNtCs8Mbv00yxnRz_4core9panicking13assert_failedxxECsb9t97VbgJUo_12toyos_crypto>
