# amd

## §1 idle and §1b excursions

| run | idle p50 | mean | p25 | excursions (>= p25+4 W) | >= 10 W |
|---|---|---|---|---|---|
| A1 | 1675 | 1678 | 1258 | 0 | 0 |
| A2 | 1698 | 1707 | 1295 | 0 | 0 |
| A3 | 1682 | 1699 | 1266 | 0 | 0 |
| B1 | 1686 | 1685 | 1267 | 0 | 0 |
| B2 | 1284 | 1678 | 1271 | 0 | 0 |
| B3 | 1696 | 1718 | 1292 | 0 | 0 |
| Linux1 | void (no output) | | | | |
| Linux2 | void (no output) | | | | |
| Linux3 | 1412 | 1480 | 1329 | 0 | 0 |

median idle A 1682 B 1686 Linux 1412; B-A 4; B resolves higher: False; B resolves lower: False
median excursions A 0 B 0 Linux 0

## §2 latency (Linux parity)

Linux persist runs with output: 1 of 2
after_idle p50 A [3309380, 3267692] B [10335666, 10336481]; B b2b write [2513163, 2543133]; A b2b [2581890, 2581989]
Linux after_idle [11369341] b2b [3571404] -> cost [7797937]
cost B-A 7.05 ms vs Linux median cost 7.80 ms: PASS
worst B 10.43 ms vs Linux worst 11.61 ms: PASS

## §3 back-to-back

| fs.disk.create_write_unlink | ns | [117086, 113248] | [118368, 115383] | +1.5% |  |
| fs.disk.direct.fstat | ns | [9889, 9789] | [9769, 9809] | -0.5% |  |
| fs.disk.direct.pread_4k | ns | [10751, 10921] | [10931, 10781] | +0.2% |  |
| fs.disk.direct.read_4k_at | ns | [20439, 20459] | [20590, 20309] | +0.0% |  |
| fs.disk.direct.seek | ns | [9789, 9579] | [9589, 9669] | -0.6% |  |
| fs.disk.direct.stat | ns | [11432, 11702] | [11532, 11622] | +0.1% |  |
| fs.disk.fstat | ns | [10269, 9809] | [9648, 9959] | -2.3% |  |
| fs.disk.mkdir_rmdir | ns | [80274, 76988] | [81406, 78312] | +1.6% |  |
| fs.disk.open_close | ns | [21892, 20941] | [21452, 21772] | +0.9% |  |
| fs.disk.pread_4k | ns | [11312, 11031] | [11321, 11232] | +0.9% |  |
| fs.disk.pread_8 | ns | [10430, 10180] | [10310, 10230] | -0.3% |  |
| fs.disk.read_4k | ns | [11422, 11091] | [11292, 11301] | +0.4% |  |
| fs.disk.read_4k_at | ns | [11653, 11432] | [11643, 11633] | +0.8% |  |
| fs.disk.readdir.1000 | ns | [685529, 682026] | [684226, 683331] | +0.0% |  |
| fs.disk.rename | ns | [63201, 61589] | [63192, 62310] | +0.6% |  |
| fs.disk.seek | ns | [199, 199] | [200, 200] | +0.5% | B worse |
| fs.disk.seq_read.1048576 | MB/s | [4555, 4545] | [4608, 4539] | +0.5% |  |
| fs.disk.seq_read.4096 | MB/s | [355, 367] | [359, 364] | +0.1% |  |
| fs.disk.seq_write.1048576 | MB/s | [902, 880] | [873, 906] | -0.2% |  |
| fs.disk.seq_write.4096 | MB/s | [252, 256] | [258, 252] | +0.4% |  |
| fs.disk.stat | ns | [12915, 12514] | [12364, 12634] | -1.7% |  |
| fs.disk.tree.100 | ns | [13031775, 12633634] | [13024177, 12743381] | +0.4% |  |
| fs.disk.write_4k_at | ns | [12464, 11993] | [12293, 12183] | +0.1% |  |
| persist.append_4k_fsync | ns | [2712882, 2582129] | [2709030, 2679758] | +1.8% |  |
| persist.create_fsync_unlink | ns | [2995165, 2989966] | [2965022, 2990067] | -0.5% |  |
| persist.fsync_clean | ns | [41911, 38464] | [37772, 37192] | -6.7% |  |
| persist.seq_read_cached | MB/s | [2785, 2828] | [2835, 2432] | -6.2% |  |
| persist.seq_write_fsync | MB/s | [657, 634] | [694, 664] | +5.2% |  |
| persist.write_4k_fsync | ns | [2581890, 2581989] | [2513163, 2543133] | -2.1% |  |

regressions: none
