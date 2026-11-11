## rows (p50 per run; median of runs)

| row | unit | linux | toyos | notes |
|---|---|---|---|---|
| `probe.pipe.natural.64` | MB/s | 115 (110-120, n=2) | 123 (120-127, n=2) | linux: reads=835723 writes=861696 bytes_per_read=65 reader_at=1952 writer_at=2880 switches=11369; toyos: reads=983163 writes=986944 bytes_per_read=64 reader_at=16 writer_at=2608 |
| `probe.pipe.natural.256` | MB/s | 428 (428-428, n=2) | 486 (473-500, n=2) | linux: reads=828824 writes=854784 bytes_per_read=263 reader_at=2064 writer_at=2112 switches=11430; toyos: reads=930733 writes=932352 bytes_per_read=256 reader_at=16 writer_at=2608 |
| `probe.pipe.natural.1024` | MB/s | 1776 (1690-1862, n=2) | 1916 (1877-1955, n=2) | linux: reads=834212 writes=852544 bytes_per_read=1046 reader_at=2176 writer_at=3008 switches=8111; toyos: reads=896614 writes=906496 bytes_per_read=1035 reader_at=16 writer_at=2608 |
| `probe.pipe.natural.4096` | MB/s | 5740 (5732-5749, n=2) | 3025 (3022-3029, n=2) | linux: reads=703205 writes=714560 bytes_per_read=4161 reader_at=2288 writer_at=864 switches=10572; toyos: reads=23217 writes=371392 bytes_per_read=65517 reader_at=16 writer_at=2608 |
| `probe.pipe.natural.16384` | MB/s | 3896 (3860-3932, n=2) | 3037 (3031-3044, n=2) | linux: reads=118808 writes=118912 bytes_per_read=16395 reader_at=2416 writer_at=2432 switches=75; toyos: reads=23340 writes=93376 bytes_per_read=65533 reader_at=16 writer_at=2608 |
| `probe.pipe.natural.65536` | MB/s | 1982 (1174-2790, n=2) | 3043 (3036-3051, n=2) | linux: reads=21371 writes=21376 bytes_per_read=65536 reader_at=2640 writer_at=2656 switches=16749; toyos: reads=23419 writes=23424 bytes_per_read=65536 reader_at=16 writer_at=32 |
| `probe.pipe.4096.r0.w0` | MB/s | 5738 (5688-5789, n=2) | 6830 (6693-6968, n=2) | linux: reads=425501 writes=432128 bytes_per_read=4159 reader_at=0 writer_at=0 switches=5100; toyos: reads=506817 writes=507136 bytes_per_read=4098 reader_at=0 writer_at=0 |
| `probe.pipe.4096.r16.w0` | MB/s | 4414 (4394-4435, n=2) | 3025 (3022-3029, n=2) | linux: reads=324793 writes=330048 bytes_per_read=4161 reader_at=16 writer_at=0 switches=3727; toyos: reads=13919 writes=222656 bytes_per_read=65517 reader_at=16 writer_at=0 |
| `probe.pipe.4096.r32.w0` | MB/s | 4335 (4311-4359, n=2) | 6414 (6280-6549, n=2) | linux: reads=330808 writes=336256 bytes_per_read=4162 reader_at=32 writer_at=0 switches=3783; toyos: reads=330097 writes=458560 bytes_per_read=5689 reader_at=32 writer_at=0 |
| `probe.pipe.4096.r64.w0` | MB/s | 4915 (4606-5224, n=2) | 6934 (6907-6962, n=2) | linux: reads=329054 writes=337344 bytes_per_read=4198 reader_at=64 writer_at=0 switches=6965; toyos: reads=506532 writes=507008 bytes_per_read=4099 reader_at=64 writer_at=0 |
| `probe.pipe.4096.r2048.w0` | MB/s | 6104 (5876-6333, n=2) | 6788 (6780-6796, n=2) | linux: reads=432662 writes=438592 bytes_per_read=4151 reader_at=2048 writer_at=0 switches=5323; toyos: reads=500885 writes=501824 bytes_per_read=4103 reader_at=2048 writer_at=0 |
| `probe.pipe.4096.r0.w16` | MB/s | 6142 (5993-6292, n=2) | 6911 (6756-7066, n=2) | linux: reads=440538 writes=444416 bytes_per_read=4131 reader_at=0 writer_at=16 switches=3171; toyos: reads=501762 writes=502080 bytes_per_read=4098 reader_at=0 writer_at=16 |
| `probe.pipe.16384.r0.w0` | MB/s | 3716 (3693-3740, n=2) | 15281 (15234-15329, n=2) | linux: reads=69888 writes=69952 bytes_per_read=16396 reader_at=0 writer_at=0 switches=40; toyos: reads=280453 writes=280640 bytes_per_read=16394 reader_at=0 writer_at=0 |
| `probe.pipe.16384.r16.w0` | MB/s | 3216 (3188-3245, n=2) | 3037 (3033-3042, n=2) | linux: reads=58629 writes=58752 bytes_per_read=16415 reader_at=16 writer_at=0 switches=51; toyos: reads=14016 writes=56064 bytes_per_read=65526 reader_at=16 writer_at=0 |
| `probe.pipe.16384.r32.w0` | MB/s | 3234 (3221-3247, n=2) | 15885 (15755-16016, n=2) | linux: reads=59373 writes=59456 bytes_per_read=16403 reader_at=32 writer_at=0 switches=53; toyos: reads=117072 writes=289408 bytes_per_read=40501 reader_at=32 writer_at=0 |
| `probe.pipe.16384.r64.w0` | MB/s | 3495 (3472-3518, n=2) | 13935 (13926-13945, n=2) | linux: reads=62438 writes=62528 bytes_per_read=16404 reader_at=64 writer_at=0 switches=68; toyos: reads=218780 writes=255424 bytes_per_read=19127 reader_at=64 writer_at=0 |
| `probe.pipe.16384.r2048.w0` | MB/s | 3768 (3709-3828, n=2) | 15090 (15064-15116, n=2) | linux: reads=68436 writes=68544 bytes_per_read=16407 reader_at=2048 writer_at=0 switches=64; toyos: reads=277542 writes=277696 bytes_per_read=16392 reader_at=2048 writer_at=0 |
| `probe.pipe.16384.r0.w16` | MB/s | 3859 (3811-3908, n=2) | 15159 (14989-15329, n=2) | linux: reads=71547 writes=71616 bytes_per_read=16397 reader_at=0 writer_at=16 switches=37; toyos: reads=281450 writes=281600 bytes_per_read=16392 reader_at=0 writer_at=16 |
| `probe.pipe.65536.r0.w0` | MB/s | 2107 (1334-2881, n=2) | 19987 (19849-20126, n=2) | linux: reads=12989 writes=12992 bytes_per_read=65536 reader_at=0 writer_at=0 switches=11025; toyos: reads=92221 writes=92224 bytes_per_read=65536 reader_at=0 writer_at=0 |
| `probe.pipe.65536.r16.w0` | MB/s | 2461 (2432-2491, n=2) | 3032 (3028-3037, n=2) | linux: reads=10813 writes=10816 bytes_per_read=65536 reader_at=16 writer_at=0 switches=11178; toyos: reads=14013 writes=14016 bytes_per_read=65536 reader_at=16 writer_at=0 |
| `probe.pipe.65536.r32.w0` | MB/s | 2641 (2486-2797, n=2) | 22151 (21955-22348, n=2) | linux: reads=10877 writes=10880 bytes_per_read=65536 reader_at=32 writer_at=0 switches=12276; toyos: reads=99133 writes=99136 bytes_per_read=65536 reader_at=32 writer_at=0 |
| `probe.pipe.65536.r64.w0` | MB/s | 2573 (2350-2796, n=2) | 22383 (22330-22436, n=2) | linux: reads=9149 writes=9152 bytes_per_read=65536 reader_at=64 writer_at=0 switches=16221; toyos: reads=102845 writes=102848 bytes_per_read=65536 reader_at=64 writer_at=0 |
| `probe.pipe.65536.r2048.w0` | MB/s | 2808 (2782-2835, n=2) | 19982 (19928-20036, n=2) | linux: reads=12669 writes=12672 bytes_per_read=65536 reader_at=2048 writer_at=0 switches=13831; toyos: reads=91069 writes=91072 bytes_per_read=65536 reader_at=2048 writer_at=0 |
| `probe.pipe.65536.r0.w16` | MB/s | 2460 (2368-2553, n=2) | 19750 (19724-19776, n=2) | linux: reads=11773 writes=11776 bytes_per_read=65536 reader_at=0 writer_at=16 switches=13276; toyos: reads=91005 writes=91008 bytes_per_read=65536 reader_at=0 writer_at=16 |
| `probe.pipe.fill.64` | ns | 410 (410-411, n=2) | 249 (249-249, n=2) |  |
| `probe.pipe.drain.64` | ns | 429 (429-430, n=2) | 397 (396-398, n=2) |  |
| `probe.pipe.fill.256` | ns | 435 (435-436, n=2) | 268 (265-272, n=2) |  |
| `probe.pipe.drain.256` | ns | 452 (452-453, n=2) | 400 (400-401, n=2) |  |
| `probe.pipe.fill.1024` | ns | 513 (512-515, n=2) | 335 (333-337, n=2) |  |
| `probe.pipe.drain.1024` | ns | 531 (531-531, n=2) | 420 (418-422, n=2) |  |
| `probe.pipe.fill.4096` | ns | 801 (799-804, n=2) | 649 (647-651, n=2) |  |
| `probe.pipe.drain.4096` | ns | 833 (832-835, n=2) | 499 (499-500, n=2) |  |
| `probe.pipe.fill.16384` | ns | 2069 (2064-2074, n=2) | 806 (804-809, n=2) |  |
| `probe.pipe.drain.16384` | ns | 2218 (2216-2221, n=2) | 845 (839-851, n=2) |  |
| `probe.pipe.fill.65536` | ns | 9007 (8877-9137, n=2) | 1643 (1573-1713, n=2) |  |
| `probe.pipe.drain.65536` | ns | 7694 (7684-7704, n=2) | 1653 (1643-1663, n=2) |  |
| `probe.pipe.fill.4096.d16` | ns | 805 (805-805, n=2) | 647 (643-652, n=2) |  |
| `probe.pipe.drain.4096.d16` | ns | 1006 (1005-1007, n=2) | 510 (510-511, n=2) |  |
| `probe.pipe.fill.65536.d16` | ns | 7975 (7955-7996, n=2) | 1633 (1623-1644, n=2) |  |
| `probe.pipe.drain.65536.d16` | ns | 10199 (10190-10209, n=2) | 21270 (21230-21310, n=2) |  |
| `probe.fs.mem.pread.8.d0` | ns | 691 (691-691, n=2) | 471 (471-471, n=2) |  |
| `probe.fs.mem.pread.4096.d0` | ns | 1017 (1012-1022, n=2) | 797 (792-802, n=2) |  |
| `probe.fs.mem.pread.4096.d16` | ns | 1077 (1032-1122, n=2) | 1508 (1503-1513, n=2) |  |
| `probe.fs.mem.pread.4096.d64` | ns | 1037 (1012-1062, n=2) | 751 (691-811, n=2) |  |
| `probe.fs.mem.pread.65536.d0` | ns | 11186 (11161-11212, n=2) | 10264 (10249-10279, n=2) |  |
| `probe.fs.mem.pread.65536.d16` | ns | 10940 (10740-11141, n=2) | 24831 (24736-24926, n=2) |  |
| `probe.fs.mem.pread.65536.d64` | ns | 11201 (11121-11281, n=2) | 10059 (10039-10079, n=2) |  |
| `probe.fs.mem.pread.1048576.d0` | ns | 119626 (119608-119645, n=2) | 96751 (96581-96922, n=2) |  |
| `probe.fs.mem.pread.1048576.d16` | ns | 144995 (142289-147701, n=2) | 392451 (391524-393378, n=2) |  |
| `probe.fs.mem.pread.1048576.d64` | ns | 129956 (129707-130205, n=2) | 107381 (106900-107862, n=2) |  |
| `probe.fs.mem.fresh8m.seq_read` | MB/s | 9164 (9004-9324, n=2) | 7542 (7257-7828, n=2) |  |
| `probe.fs.disk.pread.8.d0` | ns | 741 (741-741, n=2) | 471 (471-471, n=2) |  |
| `probe.fs.disk.pread.4096.d0` | ns | 1062 (1052-1072, n=2) | 806 (801-811, n=2) |  |
| `probe.fs.disk.pread.4096.d16` | ns | 1131 (1001-1262, n=2) | 1523 (1523-1523, n=2) |  |
| `probe.fs.disk.pread.4096.d64` | ns | 1067 (992-1142, n=2) | 771 (711-831, n=2) |  |
| `probe.fs.disk.pread.65536.d0` | ns | 10134 (10059-10210, n=2) | 10272 (10234-10310, n=2) |  |
| `probe.fs.disk.pread.65536.d16` | ns | 10249 (9428-11071, n=2) | 24860 (24754-24967, n=2) |  |
| `probe.fs.disk.pread.65536.d64` | ns | 10379 (10359-10400, n=2) | 10041 (9973-10109, n=2) |  |
| `probe.fs.disk.pread.1048576.d0` | ns | 99223 (98336-100111, n=2) | 97183 (96543-97824, n=2) |  |
| `probe.fs.disk.pread.1048576.d16` | ns | 126234 (125449-127019, n=2) | 393740 (392149-395331, n=2) |  |
| `probe.fs.disk.pread.1048576.d64` | ns | 111631 (111550-111713, n=2) | 108366 (107809-108924, n=2) |  |
| `probe.fs.disk.fresh8m.seq_read` | MB/s | 10697 (10652-10743, n=2) | 7516 (6817-8215, n=2) |  |

## kernel stages (ToyOS), ns per call of the stage and per pass share

### `probe.pipe.natural.64` [toyos] pass 100.1 ms
round: mbps=109 reads=170547 writes=171136 bytes=10951552
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 171136 | 410 | 70.17 |
| sys_read | 170549 | 416 | 71.03 |
| w.small copy-in | 171136 | 40 | 6.77 |
| w.small proc-lock+put | 171135 | 264 | 45.12 |
| w.small wake-readers | 171135 | 89 | 15.15 |
| w.lookup | 1 | 271 | 0.00 |
| w.wake-readers | 1 | 1212 | 0.00 |
| r.small proc-lock+take | 169115 | 270 | 45.61 |
| r.small copy-out | 170548 | 57 | 9.69 |
| r.small wake-writers | 169115 | 68 | 11.45 |
| r.lookup | 1434 | 255 | 0.37 |
| r.wake-writers | 1434 | 68 | 0.10 |
| r.parked | 270 | 1041 | 0.28 |
| r.general-small-take | 1433 | 185 | 0.27 |
| w.bounced-general | 1 | 3256 | 0.00 |
| p.lock+pin | 2 | 215 | 0.00 |
| p.fault_in | 1 | 70 | 0.00 |
| p.copies | 1 | 451 | 0.00 |
| p.unpin | 1 | 80 | 0.00 |
| p.recheck | 1 | 110 | 0.00 |
| bytes written | 171135 | 64 (units/call) | total 10952640 |
| bytes read | 170548 | 64 (units/call) | total 10952704 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.natural.64` [toyos] pass 100.1 ms
round: mbps=109 reads=170547 writes=171136 bytes=10951552
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 175488 | 400 | 70.14 |
| sys_read | 171981 | 412 | 70.94 |
| w.small copy-in | 175488 | 39 | 6.88 |
| w.small proc-lock+put | 175487 | 261 | 45.88 |
| w.small wake-readers | 175487 | 81 | 14.14 |
| w.lookup | 1 | 250 | 0.00 |
| w.wake-readers | 1 | 1202 | 0.00 |
| r.small proc-lock+take | 171036 | 274 | 46.80 |
| r.small copy-out | 171980 | 57 | 9.79 |
| r.small wake-writers | 171036 | 62 | 10.55 |
| r.lookup | 945 | 205 | 0.19 |
| r.wake-writers | 945 | 62 | 0.06 |
| r.parked | 358 | 481 | 0.17 |
| r.general-small-take | 944 | 169 | 0.16 |
| w.bounced-general | 1 | 3266 | 0.00 |
| p.lock+pin | 2 | 496 | 0.00 |
| p.fault_in | 1 | 110 | 0.00 |
| p.copies | 1 | 651 | 0.00 |
| p.unpin | 1 | 271 | 0.00 |
| p.recheck | 1 | 140 | 0.00 |
| bytes written | 175487 | 64 (units/call) | total 11231168 |
| bytes read | 171980 | 65 (units/call) | total 11231232 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.natural.256` [toyos] pass 100.1 ms
round: mbps=419 reads=163744 writes=164032 bytes=41988096
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 164032 | 429 | 70.40 |
| sys_read | 163746 | 434 | 71.09 |
| w.small copy-in | 164032 | 41 | 6.67 |
| w.small proc-lock+put | 164030 | 284 | 46.56 |
| w.small wake-readers | 164030 | 86 | 14.15 |
| w.lookup | 2 | 155 | 0.00 |
| w.wake-readers | 2 | 686 | 0.00 |
| r.small proc-lock+take | 163463 | 288 | 47.04 |
| r.small copy-out | 163745 | 58 | 9.54 |
| r.small wake-writers | 163463 | 68 | 11.20 |
| r.lookup | 283 | 246 | 0.07 |
| r.wake-writers | 283 | 60 | 0.02 |
| r.parked | 57 | 2655 | 0.15 |
| r.general-small-take | 282 | 199 | 0.06 |
| w.bounced-general | 2 | 2389 | 0.00 |
| bytes written | 164030 | 256 (units/call) | total 41991680 |
| bytes read | 163745 | 256 (units/call) | total 41992192 |

### `probe.pipe.natural.256` [toyos] pass 100.1 ms
round: mbps=419 reads=163744 writes=164032 bytes=41988096
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 172544 | 412 | 71.17 |
| sys_read | 172302 | 423 | 72.93 |
| w.small copy-in | 172544 | 41 | 7.03 |
| w.small proc-lock+put | 172542 | 281 | 48.46 |
| w.small wake-readers | 172542 | 73 | 12.51 |
| w.lookup | 2 | 155 | 0.00 |
| w.wake-readers | 2 | 696 | 0.00 |
| r.small proc-lock+take | 170588 | 282 | 48.06 |
| r.small copy-out | 172301 | 58 | 9.96 |
| r.small wake-writers | 170588 | 63 | 10.67 |
| r.lookup | 1714 | 263 | 0.45 |
| r.wake-writers | 1714 | 61 | 0.10 |
| r.parked | 99 | 1304 | 0.13 |
| r.general-small-take | 1713 | 190 | 0.33 |
| w.bounced-general | 2 | 2775 | 0.01 |
| bytes written | 172542 | 256 (units/call) | total 44170752 |
| bytes read | 172301 | 256 (units/call) | total 44171264 |

### `probe.pipe.natural.1024` [toyos] pass 100.1 ms
round: mbps=1573 reads=153344 writes=153728 bytes=157405184
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 153728 | 464 | 71.33 |
| sys_read | 153346 | 464 | 71.11 |
| w.small copy-in | 153728 | 47 | 7.18 |
| w.small proc-lock+put | 153671 | 316 | 48.51 |
| w.small wake-readers | 153671 | 65 | 10.02 |
| w.lookup | 57 | 46 | 0.00 |
| w.wake-readers | 57 | 102 | 0.01 |
| r.small proc-lock+take | 152658 | 294 | 44.85 |
| r.small copy-out | 153311 | 64 | 9.79 |
| r.small wake-writers | 152658 | 85 | 13.05 |
| r.lookup | 688 | 318 | 0.22 |
| r.turn+claim | 34 | 120 | 0.00 |
| r.drain-copy | 34 | 1132 | 0.04 |
| r.consume | 34 | 267 | 0.01 |
| r.wake-writers | 688 | 65 | 0.04 |
| r.parked | 30 | 4086 | 0.12 |
| r.general-small-take | 653 | 197 | 0.13 |
| w.bounced-general | 57 | 560 | 0.03 |
| bytes written | 153671 | 1024 (units/call) | total 157359104 |
| bytes read | 153345 | 1027 (units/call) | total 157417472 |

### `probe.pipe.natural.1024` [toyos] pass 100.1 ms
round: mbps=1573 reads=153344 writes=153728 bytes=157405184
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 173440 | 432 | 74.89 |
| sys_read | 173127 | 437 | 75.70 |
| w.small copy-in | 173440 | 47 | 8.07 |
| w.small proc-lock+put | 173382 | 292 | 50.61 |
| w.small wake-readers | 173382 | 75 | 12.98 |
| w.lookup | 58 | 44 | 0.00 |
| w.wake-readers | 58 | 99 | 0.01 |
| r.small proc-lock+take | 171605 | 290 | 49.76 |
| r.small copy-out | 173087 | 64 | 11.04 |
| r.small wake-writers | 171605 | 62 | 10.69 |
| r.lookup | 1522 | 275 | 0.42 |
| r.turn+claim | 39 | 119 | 0.00 |
| r.drain-copy | 39 | 1164 | 0.05 |
| r.consume | 39 | 256 | 0.01 |
| r.wake-writers | 1522 | 62 | 0.09 |
| r.parked | 62 | 2063 | 0.13 |
| r.general-small-take | 1482 | 197 | 0.29 |
| w.bounced-general | 58 | 540 | 0.03 |
| bytes written | 173382 | 1024 (units/call) | total 177543168 |
| bytes read | 173126 | 1026 (units/call) | total 177602560 |

### `probe.pipe.natural.4096` [toyos] pass 100.8 ms
round: mbps=3004 reads=4618 writes=73856 bytes=302485504
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 73856 | 1221 | 90.17 |
| sys_read | 4620 | 21591 | 99.75 |
| w.small copy-in | 73856 | 97 | 7.18 |
| w.small proc-lock+put | 68858 | 178 | 12.28 |
| w.small wake-readers | 68858 | 71 | 4.87 |
| w.lookup | 9434 | 41 | 0.38 |
| w.wake-readers | 4998 | 71 | 0.36 |
| w.parked | 4436 | 13763 | 61.05 |
| r.lookup | 4620 | 38 | 0.17 |
| r.turn+claim | 4619 | 127 | 0.58 |
| r.drain-copy | 4619 | 21008 | 97.04 |
| r.consume | 4619 | 174 | 0.80 |
| r.wake-writers | 4620 | 134 | 0.62 |
| r.parked | 1 | 50916 | 0.05 |
| w.bounced-general | 9434 | 220 | 2.08 |
| bytes written | 68858 | 4096 (units/call) | total 282042368 |
| bytes read | 4619 | 65493 (units/call) | total 302514176 |

### `probe.pipe.natural.4096` [toyos] pass 100.8 ms
round: mbps=3004 reads=4618 writes=73856 bytes=302485504
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 74368 | 1213 | 90.24 |
| sys_read | 4651 | 21462 | 99.82 |
| w.small copy-in | 74368 | 100 | 7.40 |
| w.small proc-lock+put | 69342 | 176 | 12.18 |
| w.small wake-readers | 69342 | 71 | 4.90 |
| w.lookup | 9504 | 51 | 0.48 |
| w.wake-readers | 5026 | 81 | 0.41 |
| w.parked | 4478 | 13567 | 60.75 |
| r.lookup | 4651 | 37 | 0.17 |
| r.turn+claim | 4650 | 125 | 0.58 |
| r.drain-copy | 4650 | 20890 | 97.14 |
| r.consume | 4650 | 166 | 0.77 |
| r.wake-writers | 4651 | 132 | 0.61 |
| r.parked | 1 | 52619 | 0.05 |
| w.bounced-general | 9504 | 229 | 2.18 |
| bytes written | 69342 | 4096 (units/call) | total 284024832 |
| bytes read | 4650 | 65508 (units/call) | total 304611328 |

### `probe.pipe.natural.16384` [toyos] pass 100.8 ms
round: mbps=3028 reads=4655 writes=18624 bytes=305070080
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 18624 | 5209 | 97.01 |
| sys_read | 4657 | 21426 | 99.78 |
| w.lookup | 23224 | 34 | 0.79 |
| w.turn+claim | 18624 | 103 | 1.91 |
| w.supply-frames | 130 | 574 | 0.07 |
| w.fill-copy | 18624 | 604 | 11.25 |
| w.commit | 18624 | 16 | 0.30 |
| w.wake-readers | 18624 | 62 | 1.15 |
| w.parked | 4600 | 17370 | 79.90 |
| r.lookup | 4657 | 36 | 0.17 |
| r.turn+claim | 4656 | 125 | 0.58 |
| r.drain-copy | 4656 | 20848 | 97.07 |
| r.consume | 4656 | 183 | 0.85 |
| r.wake-writers | 4657 | 133 | 0.62 |
| r.parked | 1 | 53029 | 0.05 |
| bytes written | 18624 | 16384 (units/call) | total 305135616 |
| bytes read | 4656 | 65536 (units/call) | total 305135616 |

### `probe.pipe.natural.16384` [toyos] pass 100.9 ms
round: mbps=3028 reads=4655 writes=18624 bytes=305070080
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 18688 | 5194 | 97.06 |
| sys_read | 4673 | 21356 | 99.80 |
| w.lookup | 23301 | 37 | 0.86 |
| w.turn+claim | 18688 | 102 | 1.90 |
| w.supply-frames | 133 | 583 | 0.08 |
| w.fill-copy | 18688 | 607 | 11.34 |
| w.commit | 18688 | 16 | 0.30 |
| w.wake-readers | 18688 | 61 | 1.14 |
| w.parked | 4613 | 17300 | 79.81 |
| r.lookup | 4673 | 36 | 0.17 |
| r.turn+claim | 4672 | 124 | 0.58 |
| r.drain-copy | 4672 | 20769 | 97.03 |
| r.consume | 4672 | 174 | 0.81 |
| r.wake-writers | 4673 | 133 | 0.62 |
| r.parked | 1 | 55725 | 0.06 |
| bytes written | 18688 | 16384 (units/call) | total 306184192 |
| bytes read | 4672 | 65536 (units/call) | total 306184192 |

### `probe.pipe.natural.65536` [toyos] pass 101.1 ms
round: mbps=3030 reads=4671 writes=4672 bytes=306118656
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 4672 | 21204 | 99.06 |
| sys_read | 4673 | 21406 | 100.03 |
| w.lookup | 9294 | 54 | 0.50 |
| w.turn+claim | 4672 | 140 | 0.65 |
| w.supply-frames | 33 | 1137 | 0.04 |
| w.fill-copy | 4672 | 2403 | 11.23 |
| w.commit | 4672 | 16 | 0.08 |
| w.wake-readers | 4672 | 63 | 0.29 |
| w.parked | 4622 | 18537 | 85.68 |
| r.lookup | 4673 | 36 | 0.17 |
| r.turn+claim | 4672 | 126 | 0.59 |
| r.drain-copy | 4672 | 20823 | 97.28 |
| r.consume | 4672 | 172 | 0.80 |
| r.wake-writers | 4673 | 132 | 0.62 |
| r.parked | 1 | 58169 | 0.06 |
| bytes written | 4672 | 65536 (units/call) | total 306184192 |
| bytes read | 4672 | 65536 (units/call) | total 306184192 |

### `probe.pipe.natural.65536` [toyos] pass 102.0 ms
round: mbps=3030 reads=4671 writes=4672 bytes=306118656
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 4736 | 21096 | 99.91 |
| sys_read | 4737 | 21302 | 100.91 |
| w.lookup | 9410 | 55 | 0.51 |
| w.turn+claim | 4736 | 138 | 0.65 |
| w.supply-frames | 32 | 1111 | 0.04 |
| w.fill-copy | 4736 | 2489 | 11.79 |
| w.commit | 4736 | 17 | 0.08 |
| w.wake-readers | 4736 | 64 | 0.30 |
| w.parked | 4674 | 18387 | 85.94 |
| r.lookup | 4737 | 36 | 0.17 |
| r.turn+claim | 4736 | 124 | 0.59 |
| r.drain-copy | 4736 | 20725 | 98.15 |
| r.consume | 4736 | 169 | 0.80 |
| r.wake-writers | 4737 | 128 | 0.60 |
| r.parked | 1 | 63209 | 0.06 |
| bytes written | 4736 | 65536 (units/call) | total 310378496 |
| bytes read | 4736 | 65536 (units/call) | total 310378496 |

### `probe.pipe.4096.r0.w0` [toyos] pass 100.1 ms
round: mbps=6347 reads=154840 writes=154944 bytes=634626048
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 154944 | 501 | 77.58 |
| sys_read | 154842 | 509 | 78.75 |
| w.small copy-in | 154944 | 70 | 10.77 |
| w.small proc-lock+put | 154781 | 303 | 46.91 |
| w.small wake-readers | 154781 | 109 | 16.94 |
| w.lookup | 163 | 46 | 0.01 |
| w.wake-readers | 163 | 114 | 0.02 |
| r.small proc-lock+take | 153624 | 349 | 53.59 |
| r.small copy-out | 154763 | 74 | 11.45 |
| r.small wake-writers | 153624 | 55 | 8.48 |
| r.lookup | 1218 | 377 | 0.46 |
| r.turn+claim | 78 | 126 | 0.01 |
| r.drain-copy | 78 | 265 | 0.02 |
| r.consume | 78 | 294 | 0.02 |
| r.wake-writers | 1218 | 51 | 0.06 |
| r.parked | 102 | 1707 | 0.17 |
| r.general-small-take | 1139 | 263 | 0.30 |
| w.bounced-general | 163 | 578 | 0.09 |
| bytes written | 154781 | 4096 (units/call) | total 633982976 |
| bytes read | 154841 | 4099 (units/call) | total 634650624 |

### `probe.pipe.4096.r0.w0` [toyos] pass 100.1 ms
round: mbps=6347 reads=154840 writes=154944 bytes=634626048
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 154048 | 507 | 78.03 |
| sys_read | 153945 | 519 | 79.86 |
| w.small copy-in | 154048 | 70 | 10.81 |
| w.small proc-lock+put | 153876 | 313 | 48.15 |
| w.small wake-readers | 153876 | 105 | 16.11 |
| w.lookup | 172 | 51 | 0.01 |
| w.wake-readers | 172 | 123 | 0.02 |
| r.small proc-lock+take | 151998 | 346 | 52.66 |
| r.small copy-out | 153870 | 74 | 11.33 |
| r.small wake-writers | 151998 | 57 | 8.64 |
| r.lookup | 1947 | 321 | 0.63 |
| r.turn+claim | 74 | 137 | 0.01 |
| r.drain-copy | 74 | 289 | 0.02 |
| r.consume | 74 | 301 | 0.02 |
| r.wake-writers | 1947 | 50 | 0.10 |
| r.parked | 559 | 671 | 0.38 |
| r.general-small-take | 1872 | 270 | 0.51 |
| w.bounced-general | 172 | 610 | 0.10 |
| bytes written | 153876 | 4096 (units/call) | total 630276096 |
| bytes read | 153944 | 4099 (units/call) | total 630980608 |

### `probe.pipe.4096.r16.w0` [toyos] pass 100.8 ms
round: mbps=3004 reads=4618 writes=73856 bytes=302485504
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 73856 | 1221 | 90.18 |
| sys_read | 4620 | 21590 | 99.75 |
| w.small copy-in | 73856 | 98 | 7.25 |
| w.small proc-lock+put | 68873 | 172 | 11.87 |
| w.small wake-readers | 68873 | 74 | 5.07 |
| w.lookup | 9420 | 52 | 0.49 |
| w.wake-readers | 4983 | 73 | 0.36 |
| w.parked | 4437 | 13799 | 61.23 |
| r.lookup | 4620 | 38 | 0.17 |
| r.turn+claim | 4619 | 126 | 0.58 |
| r.drain-copy | 4619 | 20983 | 96.92 |
| r.consume | 4619 | 167 | 0.77 |
| r.wake-writers | 4620 | 154 | 0.71 |
| r.parked | 1 | 50034 | 0.05 |
| w.bounced-general | 9420 | 211 | 1.98 |
| bytes written | 68873 | 4096 (units/call) | total 282103808 |
| bytes read | 4619 | 65493 (units/call) | total 302514176 |

### `probe.pipe.4096.r16.w0` [toyos] pass 100.8 ms
round: mbps=3004 reads=4618 writes=73856 bytes=302485504
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 74368 | 1214 | 90.30 |
| sys_read | 4652 | 21436 | 99.72 |
| w.small copy-in | 74368 | 96 | 7.14 |
| w.small proc-lock+put | 69321 | 171 | 11.88 |
| w.small wake-readers | 69321 | 73 | 5.03 |
| w.lookup | 9552 | 41 | 0.39 |
| w.wake-readers | 5047 | 87 | 0.44 |
| w.parked | 4505 | 13656 | 61.52 |
| r.lookup | 4652 | 37 | 0.17 |
| r.turn+claim | 4651 | 125 | 0.58 |
| r.drain-copy | 4651 | 20850 | 96.97 |
| r.consume | 4651 | 170 | 0.79 |
| r.wake-writers | 4652 | 134 | 0.63 |
| r.parked | 1 | 50875 | 0.05 |
| w.bounced-general | 9552 | 206 | 1.97 |
| bytes written | 69321 | 4096 (units/call) | total 283938816 |
| bytes read | 4651 | 65494 (units/call) | total 304611328 |

### `probe.pipe.4096.r32.w0` [toyos] pass 100.1 ms
round: mbps=6224 reads=148853 writes=151936 bytes=622305280
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 151936 | 516 | 78.42 |
| sys_read | 148855 | 532 | 79.16 |
| w.small copy-in | 151936 | 73 | 11.10 |
| w.small proc-lock+put | 148795 | 345 | 51.36 |
| w.small wake-readers | 148795 | 73 | 10.92 |
| w.lookup | 3141 | 35 | 0.11 |
| w.wake-readers | 3141 | 83 | 0.26 |
| r.small proc-lock+take | 145503 | 351 | 51.05 |
| r.small copy-out | 145834 | 74 | 10.79 |
| r.small wake-writers | 145503 | 55 | 8.02 |
| r.lookup | 3352 | 77 | 0.26 |
| r.turn+claim | 3020 | 99 | 0.30 |
| r.drain-copy | 3020 | 702 | 2.12 |
| r.consume | 3020 | 296 | 0.89 |
| r.wake-writers | 3352 | 59 | 0.20 |
| r.parked | 88 | 2300 | 0.20 |
| r.general-small-take | 331 | 288 | 0.10 |
| w.bounced-general | 3141 | 486 | 1.53 |
| p.lock+pin | 2 | 230 | 0.00 |
| p.fault_in | 1 | 220 | 0.00 |
| p.copies | 1 | 471 | 0.00 |
| p.unpin | 1 | 80 | 0.00 |
| p.recheck | 1 | 110 | 0.00 |
| bytes written | 148795 | 4096 (units/call) | total 609464320 |
| bytes read | 148854 | 4181 (units/call) | total 622329856 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.4096.r32.w0` [toyos] pass 100.1 ms
round: mbps=6224 reads=148853 writes=151936 bytes=622305280
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 154624 | 502 | 77.64 |
| sys_read | 153625 | 511 | 78.58 |
| w.small copy-in | 154624 | 69 | 10.74 |
| w.small proc-lock+put | 153550 | 325 | 49.94 |
| w.small wake-readers | 153550 | 87 | 13.32 |
| w.lookup | 1074 | 46 | 0.05 |
| w.wake-readers | 1074 | 82 | 0.09 |
| r.small proc-lock+take | 152309 | 347 | 52.86 |
| r.small copy-out | 152654 | 74 | 11.28 |
| r.small wake-writers | 152309 | 65 | 9.87 |
| r.lookup | 1316 | 126 | 0.17 |
| r.turn+claim | 970 | 102 | 0.10 |
| r.drain-copy | 970 | 684 | 0.66 |
| r.consume | 970 | 320 | 0.31 |
| r.wake-writers | 1316 | 59 | 0.08 |
| r.parked | 113 | 1645 | 0.19 |
| r.general-small-take | 345 | 275 | 0.09 |
| w.bounced-general | 1074 | 502 | 0.54 |
| p.lock+pin | 2 | 516 | 0.00 |
| p.fault_in | 1 | 110 | 0.00 |
| p.copies | 1 | 822 | 0.00 |
| p.unpin | 1 | 260 | 0.00 |
| p.recheck | 1 | 150 | 0.00 |
| bytes written | 153550 | 4096 (units/call) | total 628940800 |
| bytes read | 153624 | 4123 (units/call) | total 633339904 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.4096.r64.w0` [toyos] pass 100.1 ms
round: mbps=6361 reads=155174 writes=155328 bytes=636198912
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 155328 | 498 | 77.42 |
| sys_read | 155176 | 504 | 78.21 |
| w.small copy-in | 155328 | 70 | 10.95 |
| w.small proc-lock+put | 155113 | 323 | 50.18 |
| w.small wake-readers | 155113 | 86 | 13.28 |
| w.lookup | 215 | 39 | 0.01 |
| w.wake-readers | 215 | 104 | 0.02 |
| r.small proc-lock+take | 154947 | 354 | 54.85 |
| r.small copy-out | 155061 | 74 | 11.47 |
| r.small wake-writers | 154947 | 49 | 7.53 |
| r.lookup | 229 | 203 | 0.05 |
| r.turn+claim | 114 | 129 | 0.01 |
| r.drain-copy | 114 | 516 | 0.06 |
| r.consume | 114 | 333 | 0.04 |
| r.wake-writers | 229 | 57 | 0.01 |
| r.parked | 50 | 3016 | 0.15 |
| r.general-small-take | 114 | 278 | 0.03 |
| w.bounced-general | 215 | 591 | 0.13 |
| p.lock+pin | 2 | 306 | 0.00 |
| p.fault_in | 1 | 80 | 0.00 |
| p.copies | 1 | 521 | 0.00 |
| p.unpin | 1 | 190 | 0.00 |
| p.recheck | 1 | 110 | 0.00 |
| bytes written | 155113 | 4096 (units/call) | total 635342848 |
| bytes read | 155175 | 4100 (units/call) | total 636223488 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.4096.r64.w0` [toyos] pass 100.1 ms
round: mbps=6361 reads=155174 writes=155328 bytes=636198912
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 156032 | 500 | 78.06 |
| sys_read | 155849 | 504 | 78.48 |
| w.small copy-in | 156032 | 71 | 11.06 |
| w.small proc-lock+put | 155748 | 323 | 50.35 |
| w.small wake-readers | 155748 | 87 | 13.53 |
| w.lookup | 284 | 47 | 0.01 |
| w.wake-readers | 284 | 123 | 0.04 |
| r.small proc-lock+take | 154837 | 354 | 54.86 |
| r.small copy-out | 155707 | 74 | 11.49 |
| r.small wake-writers | 154837 | 49 | 7.53 |
| r.lookup | 1012 | 301 | 0.30 |
| r.turn+claim | 141 | 125 | 0.02 |
| r.drain-copy | 141 | 498 | 0.07 |
| r.consume | 141 | 306 | 0.04 |
| r.wake-writers | 1012 | 58 | 0.06 |
| r.parked | 265 | 1248 | 0.33 |
| r.general-small-take | 870 | 276 | 0.24 |
| w.bounced-general | 284 | 686 | 0.19 |
| p.lock+pin | 2 | 506 | 0.00 |
| p.fault_in | 1 | 110 | 0.00 |
| p.copies | 1 | 922 | 0.00 |
| p.unpin | 1 | 260 | 0.00 |
| p.recheck | 1 | 140 | 0.00 |
| bytes written | 155748 | 4096 (units/call) | total 637943808 |
| bytes read | 155848 | 4101 (units/call) | total 639107072 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.4096.r2048.w0` [toyos] pass 100.1 ms
round: mbps=6252 reads=152507 writes=152640 bytes=625197056
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 152640 | 512 | 78.23 |
| sys_read | 152509 | 514 | 78.36 |
| w.small copy-in | 152640 | 72 | 11.04 |
| w.small proc-lock+put | 152414 | 339 | 51.70 |
| w.small wake-readers | 152414 | 82 | 12.43 |
| w.lookup | 226 | 55 | 0.01 |
| w.wake-readers | 226 | 122 | 0.03 |
| r.small proc-lock+take | 151453 | 351 | 53.14 |
| r.small copy-out | 152402 | 74 | 11.33 |
| r.small wake-writers | 151453 | 51 | 7.70 |
| r.lookup | 1056 | 295 | 0.31 |
| r.turn+claim | 106 | 134 | 0.01 |
| r.drain-copy | 106 | 264 | 0.03 |
| r.consume | 106 | 289 | 0.03 |
| r.wake-writers | 1056 | 60 | 0.06 |
| r.parked | 366 | 1126 | 0.41 |
| r.general-small-take | 949 | 280 | 0.27 |
| w.bounced-general | 226 | 773 | 0.17 |
| p.lock+pin | 2 | 336 | 0.00 |
| p.fault_in | 1 | 120 | 0.00 |
| p.copies | 1 | 220 | 0.00 |
| p.unpin | 1 | 160 | 0.00 |
| p.recheck | 1 | 120 | 0.00 |
| bytes written | 152414 | 4096 (units/call) | total 624287744 |
| bytes read | 152508 | 4100 (units/call) | total 625213440 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.4096.r2048.w0` [toyos] pass 100.1 ms
round: mbps=6252 reads=152507 writes=152640 bytes=625197056
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 151744 | 518 | 78.58 |
| sys_read | 151617 | 528 | 80.03 |
| w.small copy-in | 151744 | 70 | 10.59 |
| w.small proc-lock+put | 151528 | 305 | 46.17 |
| w.small wake-readers | 151528 | 124 | 18.80 |
| w.lookup | 216 | 55 | 0.01 |
| w.wake-readers | 216 | 135 | 0.03 |
| r.small proc-lock+take | 150240 | 349 | 52.47 |
| r.small copy-out | 151512 | 74 | 11.20 |
| r.small wake-writers | 150240 | 64 | 9.63 |
| r.lookup | 1377 | 299 | 0.41 |
| r.turn+claim | 104 | 128 | 0.01 |
| r.drain-copy | 104 | 292 | 0.03 |
| r.consume | 104 | 289 | 0.03 |
| r.wake-writers | 1377 | 61 | 0.08 |
| r.parked | 438 | 901 | 0.39 |
| r.general-small-take | 1272 | 273 | 0.35 |
| w.bounced-general | 216 | 655 | 0.14 |
| bytes written | 151528 | 4096 (units/call) | total 620658688 |
| bytes read | 151616 | 4099 (units/call) | total 621543424 |

### `probe.pipe.4096.r0.w16` [toyos] pass 100.1 ms
round: mbps=6382 reads=155712 writes=155840 bytes=638296064
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 155840 | 498 | 77.62 |
| sys_read | 155714 | 504 | 78.45 |
| w.small copy-in | 155840 | 74 | 11.49 |
| w.small proc-lock+put | 155635 | 305 | 47.53 |
| w.small wake-readers | 155635 | 100 | 15.54 |
| w.lookup | 205 | 52 | 0.01 |
| w.wake-readers | 205 | 119 | 0.02 |
| r.small proc-lock+take | 154483 | 346 | 53.39 |
| r.small copy-out | 155615 | 74 | 11.54 |
| r.small wake-writers | 154483 | 57 | 8.78 |
| r.lookup | 1231 | 362 | 0.45 |
| r.turn+claim | 98 | 130 | 0.01 |
| r.drain-copy | 98 | 283 | 0.03 |
| r.consume | 98 | 288 | 0.03 |
| r.wake-writers | 1231 | 55 | 0.07 |
| r.parked | 209 | 1359 | 0.28 |
| r.general-small-take | 1132 | 268 | 0.30 |
| w.bounced-general | 205 | 655 | 0.13 |
| p.lock+pin | 2 | 306 | 0.00 |
| p.fault_in | 1 | 70 | 0.00 |
| p.copies | 1 | 571 | 0.00 |
| p.unpin | 1 | 190 | 0.00 |
| p.recheck | 1 | 100 | 0.00 |
| bytes written | 155635 | 4096 (units/call) | total 637480960 |
| bytes read | 155713 | 4099 (units/call) | total 638320640 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.4096.r0.w16` [toyos] pass 100.1 ms
round: mbps=6382 reads=155712 writes=155840 bytes=638296064
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 153472 | 508 | 77.96 |
| sys_read | 153337 | 513 | 78.68 |
| w.small copy-in | 153472 | 77 | 11.77 |
| w.small proc-lock+put | 153259 | 332 | 50.96 |
| w.small wake-readers | 153259 | 80 | 12.24 |
| w.lookup | 213 | 50 | 0.01 |
| w.wake-readers | 213 | 115 | 0.02 |
| r.small proc-lock+take | 152720 | 353 | 53.96 |
| r.small copy-out | 153230 | 74 | 11.32 |
| r.small wake-writers | 152720 | 49 | 7.47 |
| r.lookup | 617 | 276 | 0.17 |
| r.turn+claim | 106 | 135 | 0.01 |
| r.drain-copy | 106 | 296 | 0.03 |
| r.consume | 106 | 279 | 0.03 |
| r.wake-writers | 617 | 60 | 0.04 |
| r.parked | 188 | 1519 | 0.29 |
| r.general-small-take | 510 | 271 | 0.14 |
| w.bounced-general | 213 | 648 | 0.14 |
| bytes written | 153259 | 4096 (units/call) | total 627748864 |
| bytes read | 153336 | 4100 (units/call) | total 628621312 |

### `probe.pipe.16384.r0.w0` [toyos] pass 100.1 ms
round: mbps=14645 reads=89322 writes=89408 bytes=1464795136
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 89408 | 974 | 87.08 |
| sys_read | 89324 | 971 | 86.77 |
| w.lookup | 89408 | 66 | 5.92 |
| w.turn+claim | 89408 | 132 | 11.78 |
| w.supply-frames | 276 | 545 | 0.15 |
| w.fill-copy | 89408 | 553 | 49.41 |
| w.commit | 89408 | 39 | 3.50 |
| w.wake-readers | 89408 | 102 | 9.14 |
| r.lookup | 89324 | 41 | 3.64 |
| r.turn+claim | 89323 | 142 | 12.67 |
| r.drain-copy | 89323 | 361 | 32.23 |
| r.consume | 89323 | 183 | 16.36 |
| r.wake-writers | 89324 | 55 | 4.87 |
| r.parked | 26032 | 162 | 4.22 |
| p.lock+pin | 2 | 135 | 0.00 |
| p.fault_in | 1 | 40 | 0.00 |
| p.copies | 1 | 441 | 0.00 |
| p.unpin | 1 | 80 | 0.00 |
| p.recheck | 1 | 70 | 0.00 |
| bytes written | 89408 | 16384 (units/call) | total 1464860672 |
| bytes read | 89323 | 16400 (units/call) | total 1464860672 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.16384.r0.w0` [toyos] pass 100.1 ms
round: mbps=14645 reads=89322 writes=89408 bytes=1464795136
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 89536 | 974 | 87.24 |
| sys_read | 89483 | 976 | 87.37 |
| w.lookup | 89536 | 62 | 5.58 |
| w.turn+claim | 89536 | 127 | 11.39 |
| w.supply-frames | 186 | 505 | 0.09 |
| w.fill-copy | 89536 | 566 | 50.68 |
| w.commit | 89536 | 29 | 2.64 |
| w.wake-readers | 89536 | 107 | 9.54 |
| r.lookup | 89483 | 44 | 3.96 |
| r.turn+claim | 89482 | 129 | 11.57 |
| r.drain-copy | 89482 | 363 | 32.50 |
| r.consume | 89482 | 190 | 17.00 |
| r.wake-writers | 89483 | 69 | 6.14 |
| r.parked | 18248 | 173 | 3.16 |
| bytes written | 89536 | 16384 (units/call) | total 1466957824 |
| bytes read | 89482 | 16394 (units/call) | total 1466957824 |

### `probe.pipe.16384.r16.w0` [toyos] pass 100.9 ms
round: mbps=3027 reads=4656 writes=18624 bytes=305102848
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 18624 | 5209 | 97.01 |
| sys_read | 4658 | 21422 | 99.79 |
| w.lookup | 23225 | 37 | 0.86 |
| w.turn+claim | 18624 | 104 | 1.94 |
| w.supply-frames | 130 | 577 | 0.08 |
| w.fill-copy | 18624 | 601 | 11.20 |
| w.commit | 18624 | 16 | 0.29 |
| w.wake-readers | 18624 | 62 | 1.16 |
| w.parked | 4601 | 17339 | 79.78 |
| r.lookup | 4658 | 38 | 0.18 |
| r.turn+claim | 4657 | 128 | 0.59 |
| r.drain-copy | 4657 | 20845 | 97.08 |
| r.consume | 4657 | 175 | 0.82 |
| r.wake-writers | 4658 | 115 | 0.53 |
| r.parked | 1 | 44594 | 0.04 |
| p.lock+pin | 2 | 311 | 0.00 |
| p.fault_in | 1 | 160 | 0.00 |
| p.copies | 1 | 391 | 0.00 |
| p.unpin | 1 | 190 | 0.00 |
| p.recheck | 1 | 110 | 0.00 |
| bytes written | 18624 | 16384 (units/call) | total 305135616 |
| bytes read | 4657 | 65522 (units/call) | total 305135616 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.16384.r16.w0` [toyos] pass 100.8 ms
round: mbps=3027 reads=4656 writes=18624 bytes=305102848
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 18688 | 5190 | 97.00 |
| sys_read | 4673 | 21348 | 99.76 |
| w.lookup | 23300 | 38 | 0.89 |
| w.turn+claim | 18688 | 104 | 1.95 |
| w.supply-frames | 135 | 585 | 0.08 |
| w.fill-copy | 18688 | 612 | 11.44 |
| w.commit | 18688 | 16 | 0.29 |
| w.wake-readers | 18688 | 66 | 1.23 |
| w.parked | 4612 | 17223 | 79.43 |
| r.lookup | 4673 | 36 | 0.17 |
| r.turn+claim | 4672 | 125 | 0.58 |
| r.drain-copy | 4672 | 20767 | 97.02 |
| r.consume | 4672 | 174 | 0.81 |
| r.wake-writers | 4673 | 132 | 0.62 |
| r.parked | 1 | 51677 | 0.05 |
| p.lock+pin | 2 | 456 | 0.00 |
| p.fault_in | 1 | 110 | 0.00 |
| p.copies | 1 | 531 | 0.00 |
| p.unpin | 1 | 260 | 0.00 |
| p.recheck | 1 | 140 | 0.00 |
| bytes written | 18688 | 16384 (units/call) | total 306184192 |
| bytes read | 4672 | 65536 (units/call) | total 306184192 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.16384.r32.w0` [toyos] pass 100.1 ms
round: mbps=14964 reads=42944 writes=91328 bytes=1496252416
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 91328 | 955 | 87.25 |
| sys_read | 42946 | 2179 | 93.59 |
| w.lookup | 91328 | 50 | 4.53 |
| w.turn+claim | 91328 | 122 | 11.12 |
| w.supply-frames | 7899 | 394 | 3.11 |
| w.fill-copy | 91328 | 588 | 53.74 |
| w.commit | 91328 | 24 | 2.21 |
| w.wake-readers | 91328 | 63 | 5.77 |
| r.lookup | 42946 | 57 | 2.46 |
| r.turn+claim | 42945 | 125 | 5.36 |
| r.drain-copy | 42945 | 1601 | 68.74 |
| r.consume | 42945 | 208 | 8.93 |
| r.wake-writers | 42946 | 54 | 2.30 |
| r.parked | 254 | 2229 | 0.57 |
| p.lock+pin | 2 | 311 | 0.00 |
| p.fault_in | 1 | 70 | 0.00 |
| p.copies | 1 | 190 | 0.00 |
| p.unpin | 1 | 190 | 0.00 |
| p.recheck | 1 | 110 | 0.00 |
| bytes written | 91328 | 16384 (units/call) | total 1496317952 |
| bytes read | 42945 | 34843 (units/call) | total 1496317952 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.16384.r32.w0` [toyos] pass 100.1 ms
round: mbps=14964 reads=42944 writes=91328 bytes=1496252416
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 90752 | 969 | 87.91 |
| sys_read | 38991 | 2422 | 94.42 |
| w.lookup | 90752 | 50 | 4.50 |
| w.turn+claim | 90752 | 119 | 10.79 |
| w.supply-frames | 7145 | 378 | 2.70 |
| w.fill-copy | 90752 | 597 | 54.15 |
| w.commit | 90752 | 24 | 2.14 |
| w.wake-readers | 90752 | 73 | 6.65 |
| r.lookup | 38991 | 51 | 2.01 |
| r.turn+claim | 38990 | 133 | 5.17 |
| r.drain-copy | 38990 | 1831 | 71.41 |
| r.consume | 38990 | 204 | 7.96 |
| r.wake-writers | 38991 | 73 | 2.85 |
| r.parked | 192 | 2231 | 0.43 |
| p.lock+pin | 2 | 671 | 0.00 |
| p.fault_in | 1 | 1733 | 0.00 |
| p.copies | 1 | 1122 | 0.00 |
| p.unpin | 1 | 311 | 0.00 |
| p.recheck | 1 | 160 | 0.00 |
| bytes written | 90752 | 16384 (units/call) | total 1486880768 |
| bytes read | 38990 | 38135 (units/call) | total 1486880768 |
| paged pages | 1 | 2 (units/call) | total 2 |

### `probe.pipe.16384.r64.w0` [toyos] pass 100.1 ms
round: mbps=12244 reads=73851 writes=74752 bytes=1224671232
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 74752 | 1193 | 89.15 |
| sys_read | 73853 | 1215 | 89.76 |
| w.lookup | 74752 | 60 | 4.50 |
| w.turn+claim | 74752 | 137 | 10.25 |
| w.supply-frames | 35604 | 413 | 14.69 |
| w.fill-copy | 74752 | 611 | 45.68 |
| w.commit | 74752 | 17 | 1.29 |
| w.wake-readers | 74752 | 93 | 6.97 |
| r.lookup | 73853 | 43 | 3.20 |
| r.turn+claim | 73852 | 116 | 8.57 |
| r.drain-copy | 73852 | 663 | 48.98 |
| r.consume | 73852 | 203 | 15.02 |
| r.wake-writers | 73853 | 58 | 4.28 |
| r.parked | 417 | 2641 | 1.10 |
| p.lock+pin | 2 | 311 | 0.00 |
| p.fault_in | 1 | 70 | 0.00 |
| p.copies | 1 | 210 | 0.00 |
| p.unpin | 1 | 180 | 0.00 |
| p.recheck | 1 | 110 | 0.00 |
| bytes written | 74752 | 16384 (units/call) | total 1224736768 |
| bytes read | 73852 | 16584 (units/call) | total 1224736768 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.16384.r64.w0` [toyos] pass 100.1 ms
round: mbps=12244 reads=73851 writes=74752 bytes=1224671232
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 76864 | 1157 | 88.91 |
| sys_read | 76330 | 1179 | 89.96 |
| w.lookup | 76864 | 60 | 4.62 |
| w.turn+claim | 76864 | 139 | 10.66 |
| w.supply-frames | 31694 | 405 | 12.83 |
| w.fill-copy | 76864 | 614 | 47.17 |
| w.commit | 76864 | 16 | 1.24 |
| w.wake-readers | 76864 | 87 | 6.69 |
| r.lookup | 76330 | 47 | 3.62 |
| r.turn+claim | 76329 | 108 | 8.23 |
| r.drain-copy | 76329 | 649 | 49.57 |
| r.consume | 76329 | 194 | 14.84 |
| r.wake-writers | 76330 | 51 | 3.90 |
| r.parked | 323 | 2487 | 0.80 |
| p.lock+pin | 2 | 601 | 0.00 |
| p.fault_in | 1 | 110 | 0.00 |
| p.copies | 1 | 771 | 0.00 |
| p.unpin | 1 | 260 | 0.00 |
| p.recheck | 1 | 150 | 0.00 |
| bytes written | 76864 | 16384 (units/call) | total 1259339776 |
| bytes read | 76329 | 16499 (units/call) | total 1259339776 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.16384.r2048.w0` [toyos] pass 100.1 ms
round: mbps=14883 reads=90764 writes=90880 bytes=1488928768
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 90880 | 956 | 86.92 |
| sys_read | 90766 | 957 | 86.82 |
| w.lookup | 90880 | 66 | 5.97 |
| w.turn+claim | 90880 | 118 | 10.68 |
| w.supply-frames | 300 | 478 | 0.14 |
| w.fill-copy | 90880 | 552 | 50.12 |
| w.commit | 90880 | 37 | 3.38 |
| w.wake-readers | 90880 | 101 | 9.22 |
| r.lookup | 90766 | 42 | 3.85 |
| r.turn+claim | 90765 | 138 | 12.50 |
| r.drain-copy | 90765 | 355 | 32.21 |
| r.consume | 90765 | 184 | 16.70 |
| r.wake-writers | 90766 | 54 | 4.92 |
| r.parked | 19486 | 174 | 3.39 |
| p.lock+pin | 2 | 130 | 0.00 |
| p.fault_in | 1 | 40 | 0.00 |
| p.copies | 1 | 351 | 0.00 |
| p.unpin | 1 | 60 | 0.00 |
| p.recheck | 1 | 70 | 0.00 |
| bytes written | 90880 | 16384 (units/call) | total 1488977920 |
| bytes read | 90765 | 16405 (units/call) | total 1488977920 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.16384.r2048.w0` [toyos] pass 100.1 ms
round: mbps=14883 reads=90764 writes=90880 bytes=1488928768
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 88128 | 987 | 87.02 |
| sys_read | 88039 | 992 | 87.37 |
| w.lookup | 88128 | 64 | 5.64 |
| w.turn+claim | 88128 | 130 | 11.43 |
| w.supply-frames | 258 | 456 | 0.12 |
| w.fill-copy | 88128 | 564 | 49.71 |
| w.commit | 88128 | 33 | 2.88 |
| w.wake-readers | 88128 | 112 | 9.84 |
| r.lookup | 88039 | 43 | 3.74 |
| r.turn+claim | 88038 | 129 | 11.36 |
| r.drain-copy | 88038 | 372 | 32.75 |
| r.consume | 88038 | 186 | 16.35 |
| r.wake-writers | 88039 | 79 | 6.97 |
| r.parked | 19140 | 173 | 3.31 |
| p.lock+pin | 2 | 596 | 0.00 |
| p.fault_in | 1 | 110 | 0.00 |
| p.copies | 1 | 681 | 0.00 |
| p.unpin | 1 | 260 | 0.00 |
| p.recheck | 1 | 150 | 0.00 |
| bytes written | 88128 | 16384 (units/call) | total 1443889152 |
| bytes read | 88038 | 16401 (units/call) | total 1443889152 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.16384.r0.w16` [toyos] pass 100.1 ms
round: mbps=14607 reads=89053 writes=89152 bytes=1460600832
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 89152 | 976 | 87.03 |
| sys_read | 89055 | 977 | 87.03 |
| w.lookup | 89152 | 66 | 5.90 |
| w.turn+claim | 89152 | 130 | 11.62 |
| w.supply-frames | 314 | 516 | 0.16 |
| w.fill-copy | 89152 | 550 | 49.02 |
| w.commit | 89152 | 41 | 3.68 |
| w.wake-readers | 89152 | 107 | 9.51 |
| r.lookup | 89055 | 40 | 3.57 |
| r.turn+claim | 89054 | 139 | 12.38 |
| r.drain-copy | 89054 | 356 | 31.67 |
| r.consume | 89054 | 184 | 16.37 |
| r.wake-writers | 89055 | 54 | 4.83 |
| r.parked | 30172 | 173 | 5.23 |
| p.lock+pin | 2 | 135 | 0.00 |
| p.fault_in | 1 | 50 | 0.00 |
| p.copies | 1 | 371 | 0.00 |
| p.unpin | 1 | 70 | 0.00 |
| p.recheck | 1 | 60 | 0.00 |
| bytes written | 89152 | 16384 (units/call) | total 1460666368 |
| bytes read | 89054 | 16402 (units/call) | total 1460666368 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.16384.r0.w16` [toyos] pass 100.1 ms
round: mbps=14607 reads=89053 writes=89152 bytes=1460600832
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 92416 | 937 | 86.60 |
| sys_read | 92353 | 938 | 86.60 |
| w.lookup | 92416 | 62 | 5.73 |
| w.turn+claim | 92416 | 124 | 11.47 |
| w.supply-frames | 189 | 492 | 0.09 |
| w.fill-copy | 92416 | 563 | 52.01 |
| w.commit | 92416 | 25 | 2.33 |
| w.wake-readers | 92416 | 84 | 7.76 |
| r.lookup | 92353 | 41 | 3.82 |
| r.turn+claim | 92352 | 111 | 10.29 |
| r.drain-copy | 92352 | 363 | 33.56 |
| r.consume | 92352 | 183 | 16.90 |
| r.wake-writers | 92353 | 56 | 5.14 |
| r.parked | 26263 | 151 | 3.96 |
| p.lock+pin | 2 | 606 | 0.00 |
| p.fault_in | 1 | 110 | 0.00 |
| p.copies | 1 | 741 | 0.00 |
| p.unpin | 1 | 260 | 0.00 |
| p.recheck | 1 | 160 | 0.00 |
| bytes written | 92416 | 16384 (units/call) | total 1514143744 |
| bytes read | 92352 | 16395 (units/call) | total 1514143744 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.65536.r0.w0` [toyos] pass 100.1 ms
round: mbps=20300 reads=30975 writes=30976 bytes=2029977600
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 30976 | 3058 | 94.71 |
| sys_read | 30977 | 3026 | 93.73 |
| w.lookup | 30976 | 48 | 1.48 |
| w.turn+claim | 30976 | 131 | 4.07 |
| w.supply-frames | 7092 | 586 | 4.16 |
| w.fill-copy | 30976 | 2522 | 78.13 |
| w.commit | 30976 | 18 | 0.56 |
| w.wake-readers | 30976 | 129 | 3.98 |
| r.lookup | 30977 | 43 | 1.34 |
| r.turn+claim | 30976 | 139 | 4.30 |
| r.drain-copy | 30976 | 1357 | 42.04 |
| r.consume | 30976 | 216 | 6.70 |
| r.wake-writers | 30977 | 58 | 1.80 |
| r.parked | 17257 | 1953 | 33.69 |
| p.lock+pin | 2 | 371 | 0.00 |
| p.fault_in | 1 | 1583 | 0.00 |
| p.copies | 1 | 521 | 0.00 |
| p.unpin | 1 | 210 | 0.00 |
| p.recheck | 1 | 110 | 0.00 |
| bytes written | 30976 | 65536 (units/call) | total 2030043136 |
| bytes read | 30976 | 65536 (units/call) | total 2030043136 |
| paged pages | 1 | 2 (units/call) | total 2 |

### `probe.pipe.65536.r0.w0` [toyos] pass 100.3 ms
round: mbps=20300 reads=30975 writes=30976 bytes=2029977600
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 31040 | 3057 | 94.89 |
| sys_read | 31041 | 3026 | 93.93 |
| w.lookup | 31040 | 57 | 1.77 |
| w.turn+claim | 31040 | 138 | 4.28 |
| w.supply-frames | 6098 | 607 | 3.70 |
| w.fill-copy | 31040 | 2492 | 77.36 |
| w.commit | 31040 | 19 | 0.59 |
| w.wake-readers | 31040 | 155 | 4.80 |
| r.lookup | 31041 | 42 | 1.31 |
| r.turn+claim | 31040 | 140 | 4.34 |
| r.drain-copy | 31040 | 1363 | 42.32 |
| r.consume | 31040 | 205 | 6.36 |
| r.wake-writers | 31041 | 74 | 2.30 |
| r.parked | 16678 | 1999 | 33.34 |
| p.lock+pin | 2 | 461 | 0.00 |
| p.fault_in | 1 | 110 | 0.00 |
| p.copies | 1 | 812 | 0.00 |
| p.unpin | 1 | 260 | 0.00 |
| p.recheck | 1 | 140 | 0.00 |
| bytes written | 31040 | 65536 (units/call) | total 2034237440 |
| bytes read | 31040 | 65536 (units/call) | total 2034237440 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.65536.r16.w0` [toyos] pass 101.3 ms
round: mbps=3024 reads=4671 writes=4672 bytes=306118656
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 4672 | 21241 | 99.24 |
| sys_read | 4673 | 21456 | 100.26 |
| w.lookup | 9273 | 46 | 0.43 |
| w.turn+claim | 4672 | 134 | 0.63 |
| w.supply-frames | 33 | 1147 | 0.04 |
| w.fill-copy | 4672 | 2749 | 12.84 |
| w.commit | 4672 | 17 | 0.08 |
| w.wake-readers | 4672 | 65 | 0.30 |
| w.parked | 4601 | 18324 | 84.31 |
| r.lookup | 4673 | 36 | 0.17 |
| r.turn+claim | 4672 | 126 | 0.59 |
| r.drain-copy | 4672 | 20840 | 97.36 |
| r.consume | 4672 | 175 | 0.82 |
| r.wake-writers | 4673 | 157 | 0.73 |
| r.parked | 1 | 63048 | 0.06 |
| p.lock+pin | 2 | 306 | 0.00 |
| p.fault_in | 1 | 160 | 0.00 |
| p.copies | 1 | 200 | 0.00 |
| p.unpin | 1 | 190 | 0.00 |
| p.recheck | 1 | 100 | 0.00 |
| bytes written | 4672 | 65536 (units/call) | total 306184192 |
| bytes read | 4672 | 65536 (units/call) | total 306184192 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.65536.r16.w0` [toyos] pass 101.0 ms
round: mbps=3024 reads=4671 writes=4672 bytes=306118656
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 4672 | 21167 | 98.89 |
| sys_read | 4673 | 21384 | 99.93 |
| w.lookup | 9296 | 55 | 0.51 |
| w.turn+claim | 4672 | 136 | 0.64 |
| w.supply-frames | 34 | 1143 | 0.04 |
| w.fill-copy | 4672 | 3652 | 17.06 |
| w.commit | 4672 | 14 | 0.07 |
| w.wake-readers | 4672 | 67 | 0.31 |
| w.parked | 4624 | 17234 | 79.69 |
| r.lookup | 4673 | 36 | 0.17 |
| r.turn+claim | 4672 | 125 | 0.58 |
| r.drain-copy | 4672 | 20793 | 97.15 |
| r.consume | 4672 | 174 | 0.81 |
| r.wake-writers | 4673 | 142 | 0.67 |
| r.parked | 1 | 59462 | 0.06 |
| p.lock+pin | 2 | 471 | 0.00 |
| p.fault_in | 1 | 110 | 0.00 |
| p.copies | 1 | 341 | 0.00 |
| p.unpin | 1 | 260 | 0.00 |
| p.recheck | 1 | 150 | 0.00 |
| bytes written | 4672 | 65536 (units/call) | total 306184192 |
| bytes read | 4672 | 65536 (units/call) | total 306184192 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.65536.r32.w0` [toyos] pass 100.3 ms
round: mbps=21275 reads=32511 writes=32512 bytes=2130640896
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 32512 | 2919 | 94.91 |
| sys_read | 32513 | 2929 | 95.23 |
| w.lookup | 32512 | 59 | 1.92 |
| w.turn+claim | 32512 | 157 | 5.10 |
| w.supply-frames | 584 | 568 | 0.33 |
| w.fill-copy | 32512 | 2524 | 82.05 |
| w.commit | 32512 | 28 | 0.92 |
| w.wake-readers | 32512 | 65 | 2.11 |
| r.lookup | 32513 | 51 | 1.66 |
| r.turn+claim | 32512 | 138 | 4.49 |
| r.drain-copy | 32512 | 2341 | 76.10 |
| r.consume | 32512 | 197 | 6.41 |
| r.wake-writers | 32513 | 56 | 1.81 |
| r.parked | 254 | 3734 | 0.95 |
| p.lock+pin | 2 | 301 | 0.00 |
| p.fault_in | 1 | 210 | 0.00 |
| p.copies | 1 | 281 | 0.00 |
| p.unpin | 1 | 190 | 0.00 |
| p.recheck | 1 | 110 | 0.00 |
| bytes written | 32512 | 65536 (units/call) | total 2130706432 |
| bytes read | 32512 | 65536 (units/call) | total 2130706432 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.65536.r32.w0` [toyos] pass 100.2 ms
round: mbps=21275 reads=32511 writes=32512 bytes=2130640896
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 32256 | 2946 | 95.02 |
| sys_read | 32257 | 2964 | 95.59 |
| w.lookup | 32256 | 62 | 2.02 |
| w.turn+claim | 32256 | 171 | 5.52 |
| w.supply-frames | 216 | 554 | 0.12 |
| w.fill-copy | 32256 | 2506 | 80.84 |
| w.commit | 32256 | 27 | 0.87 |
| w.wake-readers | 32256 | 95 | 3.07 |
| r.lookup | 32257 | 52 | 1.67 |
| r.turn+claim | 32256 | 137 | 4.43 |
| r.drain-copy | 32256 | 2355 | 75.95 |
| r.consume | 32256 | 204 | 6.58 |
| r.wake-writers | 32257 | 76 | 2.45 |
| r.parked | 173 | 3925 | 0.68 |
| p.lock+pin | 2 | 456 | 0.00 |
| p.fault_in | 1 | 110 | 0.00 |
| p.copies | 1 | 471 | 0.00 |
| p.unpin | 1 | 260 | 0.00 |
| p.recheck | 1 | 140 | 0.00 |
| bytes written | 32256 | 65536 (units/call) | total 2113929216 |
| bytes read | 32256 | 65536 (units/call) | total 2113929216 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.65536.r64.w0` [toyos] pass 100.2 ms
round: mbps=21917 reads=33471 writes=33472 bytes=2193555456
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 33472 | 2838 | 95.00 |
| sys_read | 33473 | 2844 | 95.20 |
| w.lookup | 33472 | 50 | 1.69 |
| w.turn+claim | 33472 | 158 | 5.28 |
| w.supply-frames | 3475 | 621 | 2.16 |
| w.fill-copy | 33472 | 2363 | 79.10 |
| w.commit | 33472 | 31 | 1.04 |
| w.wake-readers | 33472 | 85 | 2.83 |
| r.lookup | 33473 | 55 | 1.83 |
| r.turn+claim | 33472 | 147 | 4.91 |
| r.drain-copy | 33472 | 2229 | 74.63 |
| r.consume | 33472 | 196 | 6.55 |
| r.wake-writers | 33473 | 58 | 1.93 |
| r.parked | 376 | 3714 | 1.40 |
| p.lock+pin | 2 | 301 | 0.00 |
| p.fault_in | 1 | 70 | 0.00 |
| p.copies | 1 | 351 | 0.00 |
| p.unpin | 1 | 190 | 0.00 |
| p.recheck | 1 | 110 | 0.00 |
| bytes written | 33472 | 65536 (units/call) | total 2193620992 |
| bytes read | 33472 | 65536 (units/call) | total 2193620992 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.65536.r64.w0` [toyos] pass 100.2 ms
round: mbps=21917 reads=33471 writes=33472 bytes=2193555456
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 33856 | 2809 | 95.11 |
| sys_read | 33857 | 2817 | 95.36 |
| w.lookup | 33856 | 63 | 2.12 |
| w.turn+claim | 33856 | 149 | 5.06 |
| w.supply-frames | 4098 | 608 | 2.49 |
| w.fill-copy | 33856 | 2335 | 79.05 |
| w.commit | 33856 | 27 | 0.91 |
| w.wake-readers | 33856 | 86 | 2.91 |
| r.lookup | 33857 | 48 | 1.63 |
| r.turn+claim | 33856 | 136 | 4.61 |
| r.drain-copy | 33856 | 2214 | 74.96 |
| r.consume | 33856 | 190 | 6.43 |
| r.wake-writers | 33857 | 64 | 2.15 |
| r.parked | 369 | 4143 | 1.53 |
| p.lock+pin | 2 | 466 | 0.00 |
| p.fault_in | 1 | 110 | 0.00 |
| p.copies | 1 | 461 | 0.00 |
| p.unpin | 1 | 260 | 0.00 |
| p.recheck | 1 | 150 | 0.00 |
| bytes written | 33856 | 65536 (units/call) | total 2218786816 |
| bytes read | 33856 | 65536 (units/call) | total 2218786816 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.65536.r2048.w0` [toyos] pass 100.2 ms
round: mbps=20035 reads=30591 writes=30592 bytes=2004811776
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 30592 | 3102 | 94.89 |
| sys_read | 30593 | 3067 | 93.82 |
| w.lookup | 30592 | 54 | 1.64 |
| w.turn+claim | 30592 | 135 | 4.12 |
| w.supply-frames | 6947 | 607 | 4.22 |
| w.fill-copy | 30592 | 2522 | 77.15 |
| w.commit | 30592 | 19 | 0.58 |
| w.wake-readers | 30592 | 159 | 4.86 |
| r.lookup | 30593 | 41 | 1.27 |
| r.turn+claim | 30592 | 141 | 4.32 |
| r.drain-copy | 30592 | 1352 | 41.37 |
| r.consume | 30592 | 209 | 6.39 |
| r.wake-writers | 30593 | 59 | 1.80 |
| r.parked | 16157 | 2158 | 34.87 |
| p.lock+pin | 2 | 120 | 0.00 |
| p.fault_in | 1 | 50 | 0.00 |
| p.copies | 1 | 331 | 0.00 |
| p.unpin | 1 | 50 | 0.00 |
| p.recheck | 1 | 60 | 0.00 |
| bytes written | 30592 | 65536 (units/call) | total 2004877312 |
| bytes read | 30592 | 65536 (units/call) | total 2004877312 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.65536.r2048.w0` [toyos] pass 100.1 ms
round: mbps=20035 reads=30591 writes=30592 bytes=2004811776
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 31168 | 3042 | 94.82 |
| sys_read | 31169 | 3010 | 93.83 |
| w.lookup | 31168 | 57 | 1.79 |
| w.turn+claim | 31168 | 133 | 4.13 |
| w.supply-frames | 6335 | 626 | 3.97 |
| w.fill-copy | 31168 | 2499 | 77.88 |
| w.commit | 31168 | 18 | 0.55 |
| w.wake-readers | 31168 | 133 | 4.15 |
| r.lookup | 31169 | 43 | 1.35 |
| r.turn+claim | 31168 | 137 | 4.27 |
| r.drain-copy | 31168 | 1362 | 42.44 |
| r.consume | 31168 | 206 | 6.43 |
| r.wake-writers | 31169 | 64 | 1.99 |
| r.parked | 17414 | 1919 | 33.42 |
| p.lock+pin | 2 | 466 | 0.00 |
| p.fault_in | 1 | 110 | 0.00 |
| p.copies | 1 | 882 | 0.00 |
| p.unpin | 1 | 260 | 0.00 |
| p.recheck | 1 | 150 | 0.00 |
| bytes written | 31168 | 65536 (units/call) | total 2042626048 |
| bytes read | 31168 | 65536 (units/call) | total 2042626048 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.65536.r0.w16` [toyos] pass 100.1 ms
round: mbps=20220 reads=30847 writes=30848 bytes=2021588992
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 30848 | 3074 | 94.82 |
| sys_read | 30849 | 3040 | 93.77 |
| w.lookup | 30848 | 55 | 1.70 |
| w.turn+claim | 30848 | 135 | 4.18 |
| w.supply-frames | 6355 | 584 | 3.71 |
| w.fill-copy | 30848 | 2529 | 78.01 |
| w.commit | 30848 | 19 | 0.59 |
| w.wake-readers | 30848 | 137 | 4.23 |
| r.lookup | 30849 | 42 | 1.30 |
| r.turn+claim | 30848 | 140 | 4.33 |
| r.drain-copy | 30848 | 1367 | 42.17 |
| r.consume | 30848 | 215 | 6.62 |
| r.wake-writers | 30849 | 58 | 1.79 |
| r.parked | 16984 | 1981 | 33.64 |
| p.lock+pin | 2 | 316 | 0.00 |
| p.fault_in | 1 | 70 | 0.00 |
| p.copies | 1 | 220 | 0.00 |
| p.unpin | 1 | 210 | 0.00 |
| p.recheck | 1 | 110 | 0.00 |
| bytes written | 30848 | 65536 (units/call) | total 2021654528 |
| bytes read | 30848 | 65536 (units/call) | total 2021654528 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.65536.r0.w16` [toyos] pass 100.2 ms
round: mbps=20220 reads=30847 writes=30848 bytes=2021588992
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 31232 | 3036 | 94.82 |
| sys_read | 31233 | 3006 | 93.90 |
| w.lookup | 31232 | 56 | 1.74 |
| w.turn+claim | 31232 | 134 | 4.20 |
| w.supply-frames | 6021 | 590 | 3.56 |
| w.fill-copy | 31232 | 2509 | 78.35 |
| w.commit | 31232 | 19 | 0.58 |
| w.wake-readers | 31232 | 130 | 4.07 |
| r.lookup | 31233 | 43 | 1.34 |
| r.turn+claim | 31232 | 138 | 4.31 |
| r.drain-copy | 31232 | 1363 | 42.57 |
| r.consume | 31232 | 206 | 6.45 |
| r.wake-writers | 31233 | 64 | 2.01 |
| r.parked | 17352 | 1919 | 33.30 |
| p.lock+pin | 2 | 511 | 0.00 |
| p.fault_in | 1 | 110 | 0.00 |
| p.copies | 1 | 341 | 0.00 |
| p.unpin | 1 | 260 | 0.00 |
| p.recheck | 1 | 150 | 0.00 |
| bytes written | 31232 | 65536 (units/call) | total 2046820352 |
| bytes read | 31232 | 65536 (units/call) | total 2046820352 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.fill.64` [toyos] pass 77.9 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 102400 | 193 | 19.75 |
| sys_read | 102400 | 332 | 33.95 |
| w.small copy-in | 102400 | 39 | 4.01 |
| w.small proc-lock+put | 100899 | 75 | 7.59 |
| w.small wake-readers | 100899 | 55 | 5.59 |
| w.lookup | 1501 | 30 | 0.05 |
| w.wake-readers | 1501 | 45 | 0.07 |
| r.small proc-lock+take | 102400 | 221 | 22.62 |
| r.small copy-out | 102400 | 44 | 4.53 |
| r.small wake-writers | 102400 | 48 | 4.94 |
| w.bounced-general | 1501 | 314 | 0.47 |
| p.lock+pin | 2 | 316 | 0.00 |
| p.fault_in | 1 | 80 | 0.00 |
| p.copies | 1 | 421 | 0.00 |
| p.unpin | 1 | 180 | 0.00 |
| p.recheck | 1 | 110 | 0.00 |
| bytes written | 100899 | 64 (units/call) | total 6457536 |
| bytes read | 102400 | 64 (units/call) | total 6553600 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.fill.64` [toyos] pass 77.5 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 102400 | 189 | 19.38 |
| sys_read | 102400 | 330 | 33.79 |
| w.small copy-in | 102400 | 39 | 3.99 |
| w.small proc-lock+put | 100899 | 75 | 7.53 |
| w.small wake-readers | 100899 | 53 | 5.32 |
| w.lookup | 1501 | 28 | 0.04 |
| w.wake-readers | 1501 | 45 | 0.07 |
| r.small proc-lock+take | 102400 | 220 | 22.51 |
| r.small copy-out | 102400 | 44 | 4.50 |
| r.small wake-writers | 102400 | 48 | 4.91 |
| w.bounced-general | 1501 | 311 | 0.47 |
| p.lock+pin | 2 | 511 | 0.00 |
| p.fault_in | 1 | 100 | 0.00 |
| p.copies | 1 | 681 | 0.00 |
| p.unpin | 1 | 260 | 0.00 |
| p.recheck | 1 | 140 | 0.00 |
| bytes written | 100899 | 64 (units/call) | total 6457536 |
| bytes read | 102400 | 64 (units/call) | total 6553600 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.fill.256` [toyos] pass 20.0 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 25600 | 208 | 5.32 |
| sys_read | 25600 | 335 | 8.58 |
| w.small copy-in | 25600 | 40 | 1.04 |
| w.small proc-lock+put | 24099 | 77 | 1.86 |
| w.small wake-readers | 24099 | 52 | 1.26 |
| w.lookup | 1501 | 29 | 0.04 |
| w.wake-readers | 1501 | 45 | 0.07 |
| r.small proc-lock+take | 25600 | 223 | 5.72 |
| r.small copy-out | 25600 | 45 | 1.16 |
| r.small wake-writers | 25600 | 48 | 1.23 |
| w.bounced-general | 1501 | 314 | 0.47 |
| bytes written | 24099 | 256 (units/call) | total 6169344 |
| bytes read | 25600 | 256 (units/call) | total 6553600 |

### `probe.pipe.fill.256` [toyos] pass 19.9 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 25600 | 206 | 5.28 |
| sys_read | 25600 | 334 | 8.54 |
| w.small copy-in | 25600 | 40 | 1.03 |
| w.small proc-lock+put | 24099 | 75 | 1.82 |
| w.small wake-readers | 24099 | 53 | 1.27 |
| w.lookup | 1501 | 29 | 0.04 |
| w.wake-readers | 1501 | 45 | 0.07 |
| r.small proc-lock+take | 25600 | 223 | 5.70 |
| r.small copy-out | 25600 | 45 | 1.16 |
| r.small wake-writers | 25600 | 48 | 1.22 |
| w.bounced-general | 1501 | 310 | 0.47 |
| bytes written | 24099 | 256 (units/call) | total 6169344 |
| bytes read | 25600 | 256 (units/call) | total 6553600 |

### `probe.pipe.fill.1024` [toyos] pass 5.6 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 6400 | 281 | 1.80 |
| sys_read | 6400 | 354 | 2.26 |
| w.small copy-in | 6400 | 46 | 0.29 |
| w.small proc-lock+put | 4899 | 83 | 0.41 |
| w.small wake-readers | 4899 | 55 | 0.27 |
| w.lookup | 1501 | 30 | 0.04 |
| w.wake-readers | 1501 | 46 | 0.07 |
| r.small proc-lock+take | 6400 | 237 | 1.51 |
| r.small copy-out | 6400 | 51 | 0.33 |
| r.small wake-writers | 6400 | 48 | 0.31 |
| w.bounced-general | 1501 | 320 | 0.48 |
| bytes written | 4899 | 1024 (units/call) | total 5016576 |
| bytes read | 6400 | 1024 (units/call) | total 6553600 |

### `probe.pipe.fill.1024` [toyos] pass 5.5 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 6400 | 278 | 1.78 |
| sys_read | 6400 | 354 | 2.26 |
| w.small copy-in | 6400 | 46 | 0.29 |
| w.small proc-lock+put | 4899 | 81 | 0.40 |
| w.small wake-readers | 4899 | 53 | 0.26 |
| w.lookup | 1501 | 29 | 0.04 |
| w.wake-readers | 1501 | 45 | 0.07 |
| r.small proc-lock+take | 6400 | 237 | 1.52 |
| r.small copy-out | 6400 | 51 | 0.33 |
| r.small wake-writers | 6400 | 48 | 0.31 |
| w.bounced-general | 1501 | 319 | 0.48 |
| bytes written | 4899 | 1024 (units/call) | total 5016576 |
| bytes read | 6400 | 1024 (units/call) | total 6553600 |

### `probe.pipe.fill.4096` [toyos] pass 2.0 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 1600 | 602 | 0.96 |
| sys_read | 1600 | 431 | 0.69 |
| w.small copy-in | 1600 | 68 | 0.11 |
| w.small proc-lock+put | 99 | 126 | 0.01 |
| w.small wake-readers | 99 | 51 | 0.01 |
| w.lookup | 1501 | 35 | 0.05 |
| w.wake-readers | 1501 | 46 | 0.07 |
| r.small proc-lock+take | 1600 | 291 | 0.47 |
| r.small copy-out | 1600 | 74 | 0.12 |
| r.small wake-writers | 1600 | 48 | 0.08 |
| w.bounced-general | 1501 | 386 | 0.58 |
| bytes written | 99 | 4096 (units/call) | total 405504 |
| bytes read | 1600 | 4096 (units/call) | total 6553600 |

### `probe.pipe.fill.4096` [toyos] pass 2.0 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 1600 | 594 | 0.95 |
| sys_read | 1600 | 431 | 0.69 |
| w.small copy-in | 1600 | 68 | 0.11 |
| w.small proc-lock+put | 99 | 114 | 0.01 |
| w.small wake-readers | 99 | 51 | 0.01 |
| w.lookup | 1501 | 35 | 0.05 |
| w.wake-readers | 1501 | 46 | 0.07 |
| r.small proc-lock+take | 1600 | 291 | 0.47 |
| r.small copy-out | 1600 | 74 | 0.12 |
| r.small wake-writers | 1600 | 48 | 0.08 |
| w.bounced-general | 1501 | 381 | 0.57 |
| bytes written | 99 | 4096 (units/call) | total 405504 |
| bytes read | 1600 | 4096 (units/call) | total 6553600 |

### `probe.pipe.fill.16384` [toyos] pass 0.7 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 400 | 721 | 0.29 |
| sys_read | 400 | 774 | 0.31 |
| w.lookup | 400 | 34 | 0.01 |
| w.turn+claim | 400 | 48 | 0.02 |
| w.supply-frames | 301 | 228 | 0.07 |
| w.fill-copy | 400 | 342 | 0.14 |
| w.commit | 400 | 14 | 0.01 |
| w.wake-readers | 400 | 57 | 0.02 |
| r.lookup | 400 | 43 | 0.02 |
| r.turn+claim | 400 | 94 | 0.04 |
| r.drain-copy | 400 | 307 | 0.12 |
| r.consume | 400 | 200 | 0.08 |
| r.wake-writers | 400 | 50 | 0.02 |
| bytes written | 400 | 16384 (units/call) | total 6553600 |
| bytes read | 400 | 16384 (units/call) | total 6553600 |

### `probe.pipe.fill.16384` [toyos] pass 0.7 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 400 | 724 | 0.29 |
| sys_read | 400 | 772 | 0.31 |
| w.lookup | 400 | 33 | 0.01 |
| w.turn+claim | 400 | 47 | 0.02 |
| w.supply-frames | 301 | 225 | 0.07 |
| w.fill-copy | 400 | 349 | 0.14 |
| w.commit | 400 | 14 | 0.01 |
| w.wake-readers | 400 | 55 | 0.02 |
| r.lookup | 400 | 35 | 0.01 |
| r.turn+claim | 400 | 93 | 0.04 |
| r.drain-copy | 400 | 317 | 0.13 |
| r.consume | 400 | 195 | 0.08 |
| r.wake-writers | 400 | 48 | 0.02 |
| bytes written | 400 | 16384 (units/call) | total 6553600 |
| bytes read | 400 | 16384 (units/call) | total 6553600 |

### `probe.pipe.fill.65536` [toyos] pass 0.3 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 100 | 1477 | 0.15 |
| sys_read | 100 | 1569 | 0.16 |
| w.lookup | 100 | 35 | 0.00 |
| w.turn+claim | 100 | 129 | 0.01 |
| w.supply-frames | 1 | 621 | 0.00 |
| w.fill-copy | 100 | 1172 | 0.12 |
| w.commit | 100 | 11 | 0.00 |
| w.wake-readers | 100 | 56 | 0.01 |
| r.lookup | 100 | 42 | 0.00 |
| r.turn+claim | 100 | 127 | 0.01 |
| r.drain-copy | 100 | 1125 | 0.11 |
| r.consume | 100 | 143 | 0.01 |
| r.wake-writers | 100 | 51 | 0.01 |
| bytes written | 100 | 65536 (units/call) | total 6553600 |
| bytes read | 100 | 65536 (units/call) | total 6553600 |

### `probe.pipe.fill.65536` [toyos] pass 0.3 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 100 | 1492 | 0.15 |
| sys_read | 100 | 1572 | 0.16 |
| w.lookup | 100 | 33 | 0.00 |
| w.turn+claim | 100 | 128 | 0.01 |
| w.supply-frames | 1 | 1162 | 0.00 |
| w.fill-copy | 100 | 1180 | 0.12 |
| w.commit | 100 | 12 | 0.00 |
| w.wake-readers | 100 | 57 | 0.01 |
| r.lookup | 100 | 35 | 0.00 |
| r.turn+claim | 100 | 124 | 0.01 |
| r.drain-copy | 100 | 1139 | 0.11 |
| r.consume | 100 | 142 | 0.01 |
| r.wake-writers | 100 | 48 | 0.00 |
| bytes written | 100 | 65536 (units/call) | total 6553600 |
| bytes read | 100 | 65536 (units/call) | total 6553600 |

### `probe.pipe.fill.4096.d16` [toyos] pass 2.0 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 1600 | 597 | 0.96 |
| sys_read | 1600 | 443 | 0.71 |
| w.small copy-in | 1600 | 69 | 0.11 |
| w.small proc-lock+put | 99 | 114 | 0.01 |
| w.small wake-readers | 99 | 55 | 0.01 |
| w.lookup | 1501 | 35 | 0.05 |
| w.wake-readers | 1501 | 46 | 0.07 |
| r.small proc-lock+take | 1600 | 290 | 0.46 |
| r.small copy-out | 1600 | 87 | 0.14 |
| r.small wake-writers | 1600 | 48 | 0.08 |
| w.bounced-general | 1501 | 382 | 0.57 |
| bytes written | 99 | 4096 (units/call) | total 405504 |
| bytes read | 1600 | 4096 (units/call) | total 6553600 |

### `probe.pipe.fill.4096.d16` [toyos] pass 2.1 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 1600 | 615 | 0.98 |
| sys_read | 1600 | 449 | 0.72 |
| w.small copy-in | 1600 | 69 | 0.11 |
| w.small proc-lock+put | 99 | 123 | 0.01 |
| w.small wake-readers | 99 | 50 | 0.00 |
| w.lookup | 1501 | 36 | 0.05 |
| w.wake-readers | 1501 | 46 | 0.07 |
| r.small proc-lock+take | 1600 | 297 | 0.47 |
| r.small copy-out | 1600 | 86 | 0.14 |
| r.small wake-writers | 1600 | 47 | 0.08 |
| w.bounced-general | 1501 | 392 | 0.59 |
| p.lock+pin | 2 | 586 | 0.00 |
| p.fault_in | 1 | 110 | 0.00 |
| p.copies | 1 | 671 | 0.00 |
| p.unpin | 1 | 260 | 0.00 |
| p.recheck | 1 | 160 | 0.00 |
| bytes written | 99 | 4096 (units/call) | total 405504 |
| bytes read | 1600 | 4096 (units/call) | total 6553600 |
| paged pages | 1 | 1 (units/call) | total 1 |

### `probe.pipe.fill.65536.d16` [toyos] pass 2.3 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 100 | 1537 | 0.15 |
| sys_read | 100 | 21213 | 2.12 |
| w.lookup | 100 | 35 | 0.00 |
| w.turn+claim | 100 | 129 | 0.01 |
| w.supply-frames | 1 | 591 | 0.00 |
| w.fill-copy | 100 | 1232 | 0.12 |
| w.commit | 100 | 12 | 0.00 |
| w.wake-readers | 100 | 57 | 0.01 |
| r.lookup | 100 | 42 | 0.00 |
| r.turn+claim | 100 | 126 | 0.01 |
| r.drain-copy | 100 | 20763 | 2.08 |
| r.consume | 100 | 142 | 0.01 |
| r.wake-writers | 100 | 60 | 0.01 |
| bytes written | 100 | 65536 (units/call) | total 6553600 |
| bytes read | 100 | 65536 (units/call) | total 6553600 |

### `probe.pipe.fill.65536.d16` [toyos] pass 2.3 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_write | 100 | 1545 | 0.15 |
| sys_read | 100 | 21129 | 2.11 |
| w.lookup | 100 | 33 | 0.00 |
| w.turn+claim | 100 | 128 | 0.01 |
| w.supply-frames | 1 | 952 | 0.00 |
| w.fill-copy | 100 | 1238 | 0.12 |
| w.commit | 100 | 12 | 0.00 |
| w.wake-readers | 100 | 58 | 0.01 |
| r.lookup | 100 | 35 | 0.00 |
| r.turn+claim | 100 | 124 | 0.01 |
| r.drain-copy | 100 | 20694 | 2.07 |
| r.consume | 100 | 142 | 0.01 |
| r.wake-writers | 100 | 49 | 0.00 |
| bytes written | 100 | 65536 (units/call) | total 6553600 |
| bytes read | 100 | 65536 (units/call) | total 6553600 |

### `probe.fs.mem.pread.8.d0` [toyos] pass 1.2 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_paged_read | 2000 | 459 | 0.92 |
| p.lock+pin | 4000 | 44 | 0.17 |
| p.fault_in | 2000 | 9 | 0.02 |
| p.copies | 2000 | 229 | 0.46 |
| p.unpin | 2000 | 12 | 0.02 |
| p.recheck | 2000 | 18 | 0.04 |
| p.holder-lookup | 2000 | 33 | 0.07 |
| paged pages | 2000 | 1 (units/call) | total 2000 |

### `probe.fs.mem.pread.8.d0` [toyos] pass 1.2 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_paged_read | 2000 | 468 | 0.94 |
| p.lock+pin | 4000 | 44 | 0.17 |
| p.fault_in | 2000 | 9 | 0.02 |
| p.copies | 2000 | 237 | 0.47 |
| p.unpin | 2000 | 12 | 0.02 |
| p.recheck | 2000 | 18 | 0.04 |
| p.holder-lookup | 2000 | 33 | 0.07 |
| paged pages | 2000 | 1 (units/call) | total 2000 |

### `probe.fs.mem.pread.4096.d0` [toyos] pass 1.8 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_paged_read | 2000 | 752 | 1.50 |
| p.lock+pin | 4000 | 42 | 0.17 |
| p.fault_in | 2000 | 9 | 0.02 |
| p.copies | 2000 | 523 | 1.05 |
| p.unpin | 2000 | 11 | 0.02 |
| p.recheck | 2000 | 18 | 0.04 |
| p.holder-lookup | 2000 | 33 | 0.07 |
| paged pages | 2000 | 1 (units/call) | total 2000 |

### `probe.fs.mem.pread.4096.d0` [toyos] pass 1.8 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_paged_read | 2000 | 743 | 1.49 |
| p.lock+pin | 4000 | 42 | 0.17 |
| p.fault_in | 2000 | 9 | 0.02 |
| p.copies | 2000 | 516 | 1.03 |
| p.unpin | 2000 | 12 | 0.02 |
| p.recheck | 2000 | 18 | 0.04 |
| p.holder-lookup | 2000 | 33 | 0.07 |
| paged pages | 2000 | 1 (units/call) | total 2000 |

### `probe.fs.mem.pread.65536.d0` [toyos] pass 5.2 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_paged_read | 500 | 10172 | 5.09 |
| p.lock+pin | 1000 | 317 | 0.32 |
| p.fault_in | 500 | 671 | 0.34 |
| p.copies | 500 | 8607 | 4.30 |
| p.unpin | 500 | 134 | 0.07 |
| p.recheck | 500 | 17 | 0.01 |
| p.holder-lookup | 500 | 40 | 0.02 |
| paged pages | 500 | 16 (units/call) | total 8000 |

### `probe.fs.mem.pread.65536.d0` [toyos] pass 5.1 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_paged_read | 500 | 10107 | 5.05 |
| p.lock+pin | 1000 | 312 | 0.31 |
| p.fault_in | 500 | 671 | 0.34 |
| p.copies | 500 | 8559 | 4.28 |
| p.unpin | 500 | 133 | 0.07 |
| p.recheck | 500 | 18 | 0.01 |
| p.holder-lookup | 500 | 35 | 0.02 |
| paged pages | 500 | 16 (units/call) | total 8000 |

### `probe.fs.mem.pread.1048576.d0` [toyos] pass 12.3 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_paged_read | 100 | 122532 | 12.25 |
| p.lock+pin | 1700 | 556 | 0.95 |
| p.fault_in | 1600 | 685 | 1.10 |
| p.copies | 1600 | 6211 | 9.94 |
| p.unpin | 1600 | 134 | 0.21 |
| p.recheck | 1600 | 20 | 0.03 |
| p.holder-lookup | 100 | 72 | 0.01 |
| paged pages | 1600 | 16 (units/call) | total 25600 |

### `probe.fs.mem.pread.1048576.d0` [toyos] pass 12.1 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_paged_read | 100 | 121038 | 12.10 |
| p.lock+pin | 1700 | 541 | 0.92 |
| p.fault_in | 1600 | 689 | 1.10 |
| p.copies | 1600 | 6130 | 9.81 |
| p.unpin | 1600 | 133 | 0.21 |
| p.recheck | 1600 | 21 | 0.03 |
| p.holder-lookup | 100 | 74 | 0.01 |
| paged pages | 1600 | 16 (units/call) | total 25600 |

### `probe.fs.mem.fresh8m.seq_read` [toyos] pass 6.7 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_paged_read | 50 | 130539 | 6.53 |
| p.lock+pin | 690 | 549 | 0.38 |
| p.fault_in | 640 | 685 | 0.44 |
| p.copies | 640 | 8747 | 5.60 |
| p.unpin | 640 | 134 | 0.09 |
| p.recheck | 640 | 21 | 0.01 |
| p.holder-lookup | 50 | 62 | 0.00 |
| paged pages | 640 | 16 (units/call) | total 10240 |

### `probe.fs.mem.fresh8m.seq_read` [toyos] pass 6.9 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_paged_read | 50 | 126374 | 6.32 |
| p.lock+pin | 690 | 569 | 0.39 |
| p.fault_in | 640 | 683 | 0.44 |
| p.copies | 640 | 8401 | 5.38 |
| p.unpin | 640 | 134 | 0.09 |
| p.recheck | 640 | 21 | 0.01 |
| p.holder-lookup | 50 | 88 | 0.00 |
| paged pages | 640 | 16 (units/call) | total 10240 |

### `probe.fs.disk.pread.8.d0` [toyos] pass 1.2 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_paged_read | 2000 | 468 | 0.94 |
| p.lock+pin | 4000 | 43 | 0.17 |
| p.fault_in | 2000 | 9 | 0.02 |
| p.copies | 2000 | 236 | 0.47 |
| p.unpin | 2000 | 12 | 0.02 |
| p.recheck | 2000 | 17 | 0.03 |
| p.holder-lookup | 2000 | 33 | 0.07 |
| paged pages | 2000 | 1 (units/call) | total 2000 |

### `probe.fs.disk.pread.8.d0` [toyos] pass 1.2 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_paged_read | 2000 | 471 | 0.94 |
| p.lock+pin | 4000 | 43 | 0.17 |
| p.fault_in | 2000 | 9 | 0.02 |
| p.copies | 2000 | 240 | 0.48 |
| p.unpin | 2000 | 11 | 0.02 |
| p.recheck | 2000 | 19 | 0.04 |
| p.holder-lookup | 2000 | 33 | 0.07 |
| paged pages | 2000 | 1 (units/call) | total 2000 |

### `probe.fs.disk.pread.4096.d0` [toyos] pass 1.8 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_paged_read | 2000 | 745 | 1.49 |
| p.lock+pin | 4000 | 41 | 0.17 |
| p.fault_in | 2000 | 9 | 0.02 |
| p.copies | 2000 | 518 | 1.04 |
| p.unpin | 2000 | 11 | 0.02 |
| p.recheck | 2000 | 18 | 0.04 |
| p.holder-lookup | 2000 | 33 | 0.07 |
| paged pages | 2000 | 1 (units/call) | total 2000 |

### `probe.fs.disk.pread.4096.d0` [toyos] pass 1.8 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_paged_read | 2000 | 739 | 1.48 |
| p.lock+pin | 4000 | 42 | 0.17 |
| p.fault_in | 2000 | 9 | 0.02 |
| p.copies | 2000 | 512 | 1.02 |
| p.unpin | 2000 | 12 | 0.02 |
| p.recheck | 2000 | 18 | 0.04 |
| p.holder-lookup | 2000 | 33 | 0.07 |
| paged pages | 2000 | 1 (units/call) | total 2000 |

### `probe.fs.disk.pread.65536.d0` [toyos] pass 5.2 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_paged_read | 500 | 10134 | 5.07 |
| p.lock+pin | 1000 | 302 | 0.30 |
| p.fault_in | 500 | 668 | 0.33 |
| p.copies | 500 | 8604 | 4.30 |
| p.unpin | 500 | 134 | 0.07 |
| p.recheck | 500 | 17 | 0.01 |
| p.holder-lookup | 500 | 38 | 0.02 |
| paged pages | 500 | 16 (units/call) | total 8000 |

### `probe.fs.disk.pread.65536.d0` [toyos] pass 5.1 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_paged_read | 500 | 10075 | 5.04 |
| p.lock+pin | 1000 | 299 | 0.30 |
| p.fault_in | 500 | 666 | 0.33 |
| p.copies | 500 | 8559 | 4.28 |
| p.unpin | 500 | 133 | 0.07 |
| p.recheck | 500 | 17 | 0.01 |
| p.holder-lookup | 500 | 34 | 0.02 |
| paged pages | 500 | 16 (units/call) | total 8000 |

### `probe.fs.disk.pread.1048576.d0` [toyos] pass 12.5 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_paged_read | 100 | 125072 | 12.51 |
| p.lock+pin | 1700 | 542 | 0.92 |
| p.fault_in | 1600 | 700 | 1.12 |
| p.copies | 1600 | 6370 | 10.19 |
| p.unpin | 1600 | 133 | 0.21 |
| p.recheck | 1600 | 20 | 0.03 |
| p.holder-lookup | 100 | 66 | 0.01 |
| paged pages | 1600 | 16 (units/call) | total 25600 |

### `probe.fs.disk.pread.1048576.d0` [toyos] pass 12.8 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_paged_read | 100 | 127886 | 12.79 |
| p.lock+pin | 1700 | 536 | 0.91 |
| p.fault_in | 1600 | 696 | 1.11 |
| p.copies | 1600 | 6555 | 10.49 |
| p.unpin | 1600 | 132 | 0.21 |
| p.recheck | 1600 | 21 | 0.03 |
| p.holder-lookup | 100 | 81 | 0.01 |
| paged pages | 1600 | 16 (units/call) | total 25600 |

### `probe.fs.disk.fresh8m.seq_read` [toyos] pass 6.7 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_paged_read | 50 | 129797 | 6.49 |
| p.lock+pin | 690 | 540 | 0.37 |
| p.fault_in | 640 | 700 | 0.45 |
| p.copies | 640 | 8682 | 5.56 |
| p.unpin | 640 | 134 | 0.09 |
| p.recheck | 640 | 21 | 0.01 |
| p.holder-lookup | 50 | 74 | 0.00 |
| paged pages | 640 | 16 (units/call) | total 10240 |

### `probe.fs.disk.fresh8m.seq_read` [toyos] pass 6.9 ms
| stage | calls | ns/call | total ms |
|---|---|---|---|
| sys_paged_read | 50 | 124531 | 6.23 |
| p.lock+pin | 690 | 572 | 0.39 |
| p.fault_in | 640 | 694 | 0.44 |
| p.copies | 640 | 8242 | 5.27 |
| p.unpin | 640 | 134 | 0.09 |
| p.recheck | 640 | 21 | 0.01 |
| p.holder-lookup | 50 | 80 | 0.00 |
| paged pages | 640 | 16 (units/call) | total 10240 |

