
# amd

## Per boot: p50 of the durable rows, and the mode (slow: write_4k_fsync p50 over 3 ms)

| boot | started | write_4k_fsync | append_4k_fsync | create_fsync_unlink | beside_1m | fsync_clean | seq_write_fsync | after_idle | mode |
|---|---|---|---|---|---|---|---|---|---|
| r1-M | 2026-11-10 23:28:06 | 2.46 ms | 2.51 ms | 2.66 ms | 3.10 ms | 8.7 us | 274 MB/s | - | fast |
| r1-F | 2026-11-10 23:43:05 | 4.01 ms | 4.00 ms | 4.46 ms | 4.69 ms | 11.6 us | 223 MB/s | - | slow |
| r1-P | 2026-11-10 23:56:36 | 4.00 ms | 4.00 ms | 4.31 ms | 4.55 ms | 8.6 us | 215 MB/s | 12.36 ms | slow |
| r2-M | 2026-11-11 01:38:01 | 2.24 ms | 2.37 ms | 2.54 ms | 2.95 ms | 14.8 us | 264 MB/s | - | fast |
| r2-F | 2026-11-11 01:52:44 | 4.01 ms | 4.00 ms | 4.25 ms | 4.63 ms | 14.3 us | 212 MB/s | - | slow |
| r2-P | 2026-11-11 02:07:19 | 4.01 ms | 4.01 ms | 4.63 ms | 4.76 ms | 14.4 us | 202 MB/s | 12.46 ms | slow |
| r3-M | 2026-11-11 02:21:54 | 2.43 ms | 2.45 ms | 2.93 ms | 3.17 ms | 8.6 us | 243 MB/s | - | fast |
| r3-F | 2026-11-11 02:34:37 | 4.00 ms | 4.00 ms | 4.64 ms | 4.83 ms | 13.7 us | 213 MB/s | - | slow |
| r3-P | 2026-11-11 03:24:18 | 4.00 ms | 4.00 ms | 4.67 ms | 4.84 ms | 14.9 us | 206 MB/s | 12.48 ms | slow |
| r4-M | 2026-11-11 03:39:11 | 2.30 ms | 2.32 ms | 2.58 ms | 2.96 ms | 8.7 us | 269 MB/s | - | fast |
| r4-F | 2026-11-11 05:06:31 | 4.00 ms | 4.00 ms | 4.48 ms | 4.68 ms | 8.6 us | 204 MB/s | - | slow |
| r4-P | 2026-11-11 05:19:42 | 4.00 ms | 4.00 ms | 4.29 ms | 4.59 ms | 8.6 us | 222 MB/s | 12.35 ms | slow |
| linux L1 | - | 3.01 ms | 3.84 ms | 3.32 ms | 4.08 ms | 67.2 us | 493 MB/s | 11.30 ms | - |
| linux L2 | - | 3.58 ms | 3.82 ms | 3.26 ms | 4.18 ms | 58.8 us | 502 MB/s | 10.87 ms | - |
| linux L3 | - | 3.67 ms | 3.88 ms | 3.41 ms | 4.19 ms | 67.7 us | 507 MB/s | 11.50 ms | - |

## Every disk row: median of the four boots' p50 (min..max over boots)

| row | M | F | P | Linux (3 runs) | F vs M | resolved | P vs F | resolved |
|---|---|---|---|---|---|---|---|---|
| fs.disk.create_write_unlink | 0.12 ms (0.11 ms..0.12 ms) | 0.12 ms (0.11 ms..0.13 ms) | 0.12 ms (0.12 ms..0.12 ms) | 29.1 us (27.3 us..29.1 us) | +0% | no | -0% | no |
| fs.disk.direct.fstat | 8.7 us (8.6 us..10.5 us) | 9.5 us (8.6 us..10.4 us) | 9.6 us (8.6 us..10.6 us) | - | +10% | no | +1% | no |
| fs.disk.direct.pread_4k | 8.3 us (8.1 us..9.9 us) | 9.1 us (8.1 us..9.8 us) | 9.2 us (8.2 us..9.9 us) | - | +10% | no | +0% | no |
| fs.disk.direct.read_4k_at | 15.1 us (15.1 us..18.7 us) | 17.0 us (15.1 us..18.6 us) | 17.0 us (15.1 us..18.7 us) | - | +12% | no | -0% | no |
| fs.disk.direct.seek | 6.9 us (6.8 us..8.8 us) | 7.7 us (6.8 us..8.7 us) | 7.8 us (6.9 us..8.8 us) | - | +12% | no | +0% | no |
| fs.disk.direct.stat | 10.4 us (10.4 us..12.5 us) | 11.2 us (10.4 us..12.4 us) | 11.4 us (10.4 us..12.4 us) | - | +8% | no | +1% | no |
| fs.disk.fstat | 8.9 us (8.8 us..11.2 us) | 9.8 us (8.9 us..10.9 us) | 9.8 us (8.9 us..11.2 us) | 1.9 us (0.5 us..1.9 us) | +9% | no | +1% | no |
| fs.disk.mkdir_rmdir | 77.8 us (71.6 us..78.2 us) | 78.0 us (72.0 us..79.8 us) | 76.2 us (75.6 us..79.9 us) | 38.1 us (36.7 us..38.1 us) | +0% | no | -2% | no |
| fs.disk.open_close | 18.7 us (18.6 us..22.1 us) | 19.7 us (18.6 us..21.6 us) | 20.0 us (18.6 us..22.2 us) | 4.3 us (3.0 us..4.3 us) | +5% | no | +1% | no |
| fs.disk.pread_4k | 1.1 us (1.1 us..1.1 us) | 1.1 us (1.1 us..1.1 us) | 1.1 us (1.1 us..1.1 us) | 2.4 us (1.1 us..2.4 us) | +1% | no | -0% | no |
| fs.disk.pread_8 | 0.7 us (0.7 us..0.8 us) | 0.7 us (0.7 us..0.8 us) | 0.7 us (0.7 us..0.8 us) | 2.0 us (0.8 us..2.0 us) | -0% | no | +1% | no |
| fs.disk.read_4k | 1.0 us (0.7 us..1.0 us) | 1.0 us (1.0 us..1.0 us) | 1.0 us (1.0 us..1.0 us) | 2.3 us (1.1 us..2.3 us) | +1% | no | -0% | no |
| fs.disk.read_4k_at | 1.4 us (1.4 us..1.5 us) | 1.4 us (1.4 us..1.5 us) | 1.4 us (1.4 us..1.5 us) | 2.4 us (1.5 us..2.4 us) | +1% | no | +0% | no |
| fs.disk.readdir.1000 | 2.01 ms (2.00 ms..2.01 ms) | 2.01 ms (2.00 ms..2.02 ms) | 2.02 ms (2.01 ms..2.07 ms) | 0.44 ms (0.43 ms..0.44 ms) | +0% | no | +1% | no |
| fs.disk.rename | 40.8 us (39.0 us..41.8 us) | 40.9 us (39.4 us..42.2 us) | 40.6 us (39.4 us..41.7 us) | 10.8 us (9.3 us..10.8 us) | +0% | no | -1% | no |
| fs.disk.reopen_read_4k | 19.3 us (19.1 us..22.5 us) | 20.2 us (19.0 us..22.0 us) | 20.4 us (19.0 us..22.3 us) | 5.2 us (3.7 us..5.2 us) | +5% | no | +1% | no |
| fs.disk.seek | 0.2 us (0.2 us..0.2 us) | 0.2 us (0.2 us..0.2 us) | 0.2 us (0.2 us..0.2 us) | 1.4 us (0.2 us..1.4 us) | +0% | no | +0% | no |
| fs.disk.seq_read.1048576 | 10016 MB/s (9905 MB/s..10247 MB/s) | 10208 MB/s (9948 MB/s..10398 MB/s) | 10190 MB/s (9979 MB/s..10339 MB/s) | 11688 MB/s (11321 MB/s..11829 MB/s) | -2% | no | +0% | no |
| fs.disk.seq_read.4096 | 7204 MB/s (7189 MB/s..7227 MB/s) | 7180 MB/s (7070 MB/s..7224 MB/s) | 7184 MB/s (7062 MB/s..7214 MB/s) | 5093 MB/s (5067 MB/s..5149 MB/s) | +0% | no | -0% | no |
| fs.disk.seq_write.1048576 | 467 MB/s (458 MB/s..472 MB/s) | 405 MB/s (399 MB/s..406 MB/s) | 404 MB/s (397 MB/s..413 MB/s) | 791 MB/s (781 MB/s..816 MB/s) | +13% | yes | +0% | no |
| fs.disk.seq_write.4096 | 202 MB/s (180 MB/s..205 MB/s) | 182 MB/s (174 MB/s..190 MB/s) | 180 MB/s (171 MB/s..194 MB/s) | 714 MB/s (711 MB/s..783 MB/s) | +10% | no | +1% | no |
| fs.disk.stat | 11.7 us (11.5 us..14.1 us) | 12.5 us (11.6 us..13.7 us) | 12.6 us (11.6 us..13.9 us) | 2.8 us (1.4 us..2.9 us) | +7% | no | +1% | no |
| fs.disk.tree.100 | 16.85 ms (16.70 ms..17.67 ms) | 23.21 ms (22.92 ms..23.56 ms) | 23.09 ms (22.84 ms..23.50 ms) | 3.44 ms (3.40 ms..3.45 ms) | +38% | yes | -1% | no |
| fs.disk.write_4k_at | 27.3 us (26.2 us..29.8 us) | 29.1 us (26.7 us..30.4 us) | 28.7 us (26.1 us..29.6 us) | 2.9 us (2.1 us..2.9 us) | +7% | no | -1% | no |
| persist.append_4k_fsync | 2.41 ms (2.32 ms..2.51 ms) | 4.00 ms (4.00 ms..4.00 ms) | 4.00 ms (4.00 ms..4.01 ms) | 3.84 ms (3.82 ms..3.88 ms) | +66% | yes | -0% | no |
| persist.create_fsync_unlink | 2.62 ms (2.54 ms..2.93 ms) | 4.47 ms (4.25 ms..4.64 ms) | 4.47 ms (4.29 ms..4.67 ms) | 3.32 ms (3.26 ms..3.41 ms) | +71% | yes | +0% | no |
| persist.fsync_clean | 8.7 us (8.6 us..14.8 us) | 12.7 us (8.6 us..14.3 us) | 11.5 us (8.6 us..14.9 us) | 67.2 us (58.8 us..67.7 us) | +45% | no | -9% | no |
| persist.seq_read_cached | 6024 MB/s (5891 MB/s..6054 MB/s) | 5936 MB/s (5876 MB/s..6049 MB/s) | 5928 MB/s (5851 MB/s..6006 MB/s) | 11411 MB/s (6777 MB/s..11436 MB/s) | +1% | no | +0% | no |
| persist.seq_write_fsync | 266 MB/s (243 MB/s..274 MB/s) | 212 MB/s (204 MB/s..223 MB/s) | 210 MB/s (202 MB/s..222 MB/s) | 502 MB/s (493 MB/s..507 MB/s) | +20% | yes | +1% | no |
| persist.write_4k_fsync | 2.36 ms (2.24 ms..2.46 ms) | 4.00 ms (4.00 ms..4.01 ms) | 4.00 ms (4.00 ms..4.01 ms) | 3.58 ms (3.01 ms..3.67 ms) | +69% | yes | -0% | no |
| persist.write_4k_fsync_beside_1m | 3.03 ms (2.95 ms..3.17 ms) | 4.69 ms (4.63 ms..4.83 ms) | 4.67 ms (4.55 ms..4.84 ms) | 4.18 ms (4.08 ms..4.19 ms) | +55% | yes | -0% | no |
| persist.write_4k_fsync_after_idle | - | - | 12.41 ms (12.35 ms..12.48 ms) | 11.30 ms (10.87 ms..11.50 ms) |  |  |  |  |

(+ is worse. "resolved": every boot of one arm beyond every boot of the other.)

## Verdicts

F1 gain (F median below M): write_4k_fsync: NO, append_4k_fsync: NO, create_fsync_unlink: NO, write_4k_fsync_beside_1m: NO
F2 no regression (>5% worse AND resolved fails): FAIL: fs.disk.seq_write.1048576 +13%, fs.disk.tree.100 +38%, persist.append_4k_fsync +66%, persist.create_fsync_unlink +71%, persist.seq_write_fsync +20%, persist.write_4k_fsync +69%, persist.write_4k_fsync_beside_1m +55%
G1 wake cost: P 8.41 ms against Linux 7.83 ms: FAIL
G2 worst after-idle sample: P 12.85 ms against Linux 11.61 ms: FAIL
G3 back to back, P vs F: PASS
reported: P after-idle p50 per boot [12.36, 12.46, 12.48, 12.35] ms; Linux [11.3, 10.87, 11.5] ms

# t14

## Per boot: p50 of the durable rows, and the mode (slow: write_4k_fsync p50 over 3 ms)

| boot | started | write_4k_fsync | append_4k_fsync | create_fsync_unlink | beside_1m | fsync_clean | seq_write_fsync | after_idle | mode |
|---|---|---|---|---|---|---|---|---|---|
| r1-M | 2026-11-10 23:42:11 | 5.78 ms | 6.43 ms | 7.21 ms | 7.82 ms | 7.3 us | 180 MB/s | - | slow |
| r1-F | 2026-11-10 23:54:34 | 5.88 ms | 6.27 ms | 6.68 ms | 7.39 ms | 7.2 us | 185 MB/s | - | slow |
| r1-P | 2026-11-11 01:51:38 | 6.21 ms | 1.07 ms | 1.14 ms | 1.55 ms | 7.2 us | 261 MB/s | 14.10 ms | slow |
| r2-M | 2026-11-11 02:07:18 | 0.97 ms | 0.97 ms | 1.14 ms | 1.33 ms | 7.3 us | 258 MB/s | - | fast |
| r2-F | 2026-11-11 02:18:03 | 5.87 ms | 6.24 ms | 6.78 ms | 7.19 ms | 8.0 us | 182 MB/s | - | slow |
| r2-P | 2026-11-11 02:30:52 | 5.98 ms | 0.93 ms | 1.09 ms | 1.23 ms | 7.3 us | 281 MB/s | 14.12 ms | slow |
| r3-M | 2026-11-11 03:44:31 | 2.20 ms | 1.12 ms | 1.13 ms | 1.43 ms | 7.4 us | 259 MB/s | - | fast |
| r3-F | 2026-11-11 05:20:36 | 5.66 ms | 5.65 ms | 6.23 ms | 7.05 ms | 7.4 us | 162 MB/s | - | slow |
| r3-P | 2026-11-11 05:29:44 | 6.13 ms | 1.06 ms | 1.07 ms | 1.23 ms | 7.2 us | 282 MB/s | 17.20 ms | slow |
| r4-M | 2026-11-11 05:42:30 | 5.92 ms | 6.22 ms | 6.86 ms | 6.98 ms | 8.6 us | 198 MB/s | - | slow |
| r4-F | 2026-11-11 05:52:05 | 6.24 ms | 6.57 ms | 6.98 ms | 7.69 ms | 7.2 us | 174 MB/s | - | slow |
| r4-P | 2026-11-11 06:01:49 | 5.83 ms | 1.08 ms | 1.09 ms | 1.27 ms | 7.3 us | 282 MB/s | 13.92 ms | slow |
| linux L1 | - | 1.07 ms | 0.90 ms | 0.96 ms | 1.31 ms | 23.0 us | 588 MB/s | 12.99 ms | - |
| linux L2 | - | 0.79 ms | 0.92 ms | 0.95 ms | 1.28 ms | 23.0 us | 582 MB/s | 12.97 ms | - |
| linux L3 | - | 1.09 ms | 0.79 ms | 0.89 ms | 0.86 ms | 23.0 us | 593 MB/s | 12.88 ms | - |

## Every disk row: median of the four boots' p50 (min..max over boots)

| row | M | F | P | Linux (3 runs) | F vs M | resolved | P vs F | resolved |
|---|---|---|---|---|---|---|---|---|
| fs.disk.create_write_unlink | 0.12 ms (0.12 ms..0.13 ms) | 0.12 ms (0.12 ms..0.13 ms) | 0.12 ms (0.12 ms..0.12 ms) | 11.3 us (11.2 us..11.3 us) | -0% | no | -0% | yes |
| fs.disk.direct.fstat | 9.5 us (9.0 us..10.3 us) | 8.9 us (8.9 us..10.3 us) | 9.0 us (8.9 us..9.0 us) | - | -6% | no | +0% | no |
| fs.disk.direct.pread_4k | 8.1 us (8.0 us..9.1 us) | 8.9 us (8.3 us..9.1 us) | 8.1 us (8.1 us..8.1 us) | - | +9% | no | -9% | yes |
| fs.disk.direct.read_4k_at | 15.6 us (15.5 us..17.2 us) | 15.6 us (15.4 us..17.2 us) | 15.2 us (14.9 us..15.6 us) | - | -0% | no | -2% | no |
| fs.disk.direct.seek | 6.9 us (6.8 us..8.1 us) | 6.9 us (6.8 us..8.1 us) | 6.8 us (6.7 us..6.9 us) | - | +0% | no | -1% | no |
| fs.disk.direct.stat | 11.1 us (10.9 us..12.3 us) | 10.8 us (10.8 us..12.3 us) | 10.9 us (10.8 us..10.9 us) | - | -3% | no | +1% | no |
| fs.disk.fstat | 9.4 us (9.3 us..10.8 us) | 9.3 us (9.2 us..10.7 us) | 9.2 us (9.2 us..9.3 us) | 0.2 us (0.2 us..0.2 us) | -2% | no | -0% | no |
| fs.disk.mkdir_rmdir | 77.5 us (77.3 us..83.4 us) | 77.3 us (76.5 us..83.2 us) | 77.1 us (76.8 us..77.3 us) | 14.7 us (14.6 us..14.7 us) | -0% | no | -0% | no |
| fs.disk.open_close | 21.4 us (21.4 us..24.2 us) | 21.3 us (21.1 us..24.0 us) | 21.3 us (21.2 us..21.3 us) | 1.2 us (1.2 us..1.2 us) | -1% | no | -0% | no |
| fs.disk.pread_4k | 0.7 us (0.7 us..0.8 us) | 0.7 us (0.7 us..0.7 us) | 0.7 us (0.7 us..0.8 us) | 0.6 us (0.6 us..0.6 us) | -1% | no | -2% | no |
| fs.disk.pread_8 | 0.5 us (0.5 us..0.6 us) | 0.5 us (0.5 us..0.6 us) | 0.5 us (0.5 us..0.6 us) | 0.4 us (0.4 us..0.4 us) | -1% | no | +2% | no |
| fs.disk.read_4k | 0.7 us (0.7 us..0.8 us) | 0.8 us (0.7 us..0.8 us) | 0.8 us (0.7 us..0.8 us) | 0.5 us (0.5 us..0.6 us) | +6% | no | -3% | no |
| fs.disk.read_4k_at | 1.0 us (1.0 us..1.1 us) | 1.0 us (1.0 us..1.1 us) | 1.0 us (1.0 us..1.1 us) | 0.7 us (0.7 us..0.8 us) | -3% | no | +3% | no |
| fs.disk.readdir.1000 | 2.86 ms (2.70 ms..2.89 ms) | 2.85 ms (2.70 ms..2.86 ms) | 2.85 ms (2.84 ms..2.87 ms) | 0.27 ms (0.27 ms..0.27 ms) | -0% | no | +0% | no |
| fs.disk.rename | 44.4 us (44.4 us..47.5 us) | 44.4 us (44.1 us..47.2 us) | 44.3 us (44.0 us..44.6 us) | 3.6 us (3.6 us..3.6 us) | -0% | no | -0% | no |
| fs.disk.reopen_read_4k | 21.9 us (21.9 us..24.9 us) | 21.8 us (21.7 us..24.7 us) | 21.7 us (21.6 us..21.8 us) | 1.5 us (1.5 us..1.6 us) | -0% | no | -1% | no |
| fs.disk.seek | 0.2 us (0.2 us..0.2 us) | 0.2 us (0.2 us..0.2 us) | 0.2 us (0.2 us..0.2 us) | 0.1 us (0.1 us..0.1 us) | +0% | no | +0% | no |
| fs.disk.seq_read.1048576 | 7318 MB/s (7240 MB/s..7405 MB/s) | 7356 MB/s (7299 MB/s..7433 MB/s) | 7238 MB/s (6992 MB/s..7330 MB/s) | 9610 MB/s (9476 MB/s..9633 MB/s) | -1% | no | +2% | no |
| fs.disk.seq_read.4096 | 5391 MB/s (5321 MB/s..5420 MB/s) | 5410 MB/s (5352 MB/s..5439 MB/s) | 5418 MB/s (5402 MB/s..5447 MB/s) | 7767 MB/s (7749 MB/s..7776 MB/s) | -0% | no | -0% | no |
| fs.disk.seq_write.1048576 | 390 MB/s (362 MB/s..394 MB/s) | 484 MB/s (460 MB/s..498 MB/s) | 502 MB/s (489 MB/s..504 MB/s) | 347 MB/s (346 MB/s..348 MB/s) | -24% | yes | -4% | no |
| fs.disk.seq_write.4096 | 192 MB/s (175 MB/s..197 MB/s) | 182 MB/s (174 MB/s..186 MB/s) | 202 MB/s (197 MB/s..205 MB/s) | 632 MB/s (630 MB/s..648 MB/s) | +5% | no | -11% | yes |
| fs.disk.stat | 12.3 us (12.1 us..14.0 us) | 12.2 us (12.0 us..13.9 us) | 12.0 us (12.0 us..12.0 us) | 0.6 us (0.6 us..0.6 us) | -1% | no | -1% | yes |
| fs.disk.tree.100 | 17.61 ms (14.94 ms..22.42 ms) | 20.13 ms (19.96 ms..22.12 ms) | 15.06 ms (15.00 ms..15.21 ms) | 1.36 ms (1.35 ms..1.36 ms) | +14% | no | -25% | yes |
| fs.disk.write_4k_at | 21.9 us (21.7 us..23.2 us) | 21.9 us (21.8 us..23.1 us) | 21.6 us (21.3 us..21.7 us) | 0.7 us (0.7 us..0.7 us) | -0% | no | -1% | yes |
| persist.append_4k_fsync | 3.67 ms (0.97 ms..6.43 ms) | 6.25 ms (5.65 ms..6.57 ms) | 1.07 ms (0.93 ms..1.08 ms) | 0.90 ms (0.79 ms..0.92 ms) | +70% | no | -83% | yes |
| persist.create_fsync_unlink | 4.00 ms (1.13 ms..7.21 ms) | 6.73 ms (6.23 ms..6.98 ms) | 1.09 ms (1.07 ms..1.14 ms) | 0.95 ms (0.89 ms..0.96 ms) | +68% | no | -84% | yes |
| persist.fsync_clean | 7.4 us (7.3 us..8.6 us) | 7.3 us (7.2 us..8.0 us) | 7.2 us (7.2 us..7.3 us) | 23.0 us (23.0 us..23.0 us) | -0% | no | -1% | no |
| persist.seq_read_cached | 8096 MB/s (7897 MB/s..9417 MB/s) | 7974 MB/s (7593 MB/s..9155 MB/s) | 8189 MB/s (7955 MB/s..8575 MB/s) | 11038 MB/s (11021 MB/s..11436 MB/s) | +2% | no | -3% | no |
| persist.seq_write_fsync | 228 MB/s (180 MB/s..259 MB/s) | 178 MB/s (162 MB/s..185 MB/s) | 282 MB/s (261 MB/s..282 MB/s) | 588 MB/s (582 MB/s..593 MB/s) | +22% | no | -58% | yes |
| persist.write_4k_fsync | 3.99 ms (0.97 ms..5.92 ms) | 5.87 ms (5.66 ms..6.24 ms) | 6.05 ms (5.83 ms..6.21 ms) | 1.07 ms (0.79 ms..1.09 ms) | +47% | no | +3% | no |
| persist.write_4k_fsync_beside_1m | 4.21 ms (1.33 ms..7.82 ms) | 7.29 ms (7.05 ms..7.69 ms) | 1.25 ms (1.23 ms..1.55 ms) | 1.28 ms (0.86 ms..1.31 ms) | +73% | no | -83% | yes |
| persist.write_4k_fsync_after_idle | - | - | 14.11 ms (13.92 ms..17.20 ms) | 12.97 ms (12.88 ms..12.99 ms) |  |  |  |  |

(+ is worse. "resolved": every boot of one arm beyond every boot of the other.)

## Verdicts

F1 gain (F median below M): write_4k_fsync: NO, append_4k_fsync: NO, create_fsync_unlink: NO, write_4k_fsync_beside_1m: NO
F2 no regression (>5% worse AND resolved fails): PASS
G1 wake cost: P 8.12 ms against Linux 11.92 ms: PASS
G2 worst after-idle sample: P 17.89 ms against Linux 13.07 ms: FAIL
G3 back to back, P vs F: PASS
reported: P after-idle p50 per boot [14.1, 14.12, 17.2, 13.92] ms; Linux [12.99, 12.97, 12.88] ms
