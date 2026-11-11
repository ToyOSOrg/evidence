
# amd

## Per boot (p50 / p90)

| boot | write_4k_fsync | mode before idle | after_idle p50 (min..max) | beside_1m | append_4k_fsync | create_fsync_unlink | modes after idle |
|---|---|---|---|---|---|---|---|
| r1-M | 2.47 / 2.68 ms | fast | 4.20 ms (3.35..4.54) | 3.15 / 3.38 ms | 2.52 / 2.84 ms | 2.99 / 3.16 ms | slow, fast, mixed |
| r1-P | 2.54 / 2.76 ms | fast | 11.34 ms (11.03..11.47) | 3.00 / 3.41 ms | 2.41 / 2.69 ms | 2.53 / 3.10 ms | slow, fast, mixed |
| r2-M | 2.54 / 2.68 ms | fast | 3.72 ms (3.05..4.53) | 3.20 / 3.45 ms | 2.51 / 2.71 ms | 2.98 / 3.18 ms | slow, fast, mixed |
| r2-P | 2.45 / 2.69 ms | fast | 11.33 ms (10.68..11.78) | 3.14 / 3.35 ms | 2.50 / 2.68 ms | 3.01 / 3.18 ms | slow, fast, slow |
| r3-M | 2.54 / 2.79 ms | fast | 4.19 ms (3.73..4.65) | 3.12 / 3.46 ms | 2.46 / 2.67 ms | 2.86 / 3.23 ms | slow, fast, mixed |
| r3-P | 2.47 / 2.63 ms | fast | 11.15 ms (10.56..11.53) | 3.15 / 3.35 ms | 2.43 / 2.62 ms | 2.97 / 3.15 ms | slow, fast, mixed |
| linux L1 | 3.58 / 3.73 ms | - | 10.70 ms (10.59..11.58) | 3.51 / 3.60 ms | 3.27 / 3.34 ms | 3.27 / 3.51 ms | - |
| linux L2 | 3.59 / 3.80 ms | - | 11.47 ms (10.87..11.83) | 4.18 / 4.33 ms | 3.83 / 4.04 ms | 3.27 / 3.44 ms | - |
| linux L3 | 3.59 / 3.82 ms | - | 10.58 ms (10.53..11.73) | 4.15 / 4.38 ms | 3.37 / 3.88 ms | 3.11 / 3.31 ms | - |

## L1: every back-to-back disk row, median of three boots' p50 (min..max)

| row | M' | P' | Linux | P' vs M' | resolved |
|---|---|---|---|---|---|
| fs.disk.create_write_unlink | 0.12 ms (0.12 ms..0.13 ms) | 0.12 ms (0.12 ms..0.13 ms) | 29.0 us (27.2 us..29.1 us) | -1% | no |
| fs.disk.direct.fstat | 8.7 us (8.7 us..10.4 us) | 8.6 us (8.5 us..10.7 us) | - | -1% | no |
| fs.disk.direct.pread_4k | 8.5 us (8.2 us..9.7 us) | 8.5 us (8.2 us..10.1 us) | - | +0% | no |
| fs.disk.direct.read_4k_at | 15.3 us (15.2 us..18.5 us) | 15.2 us (14.9 us..19.2 us) | - | -1% | no |
| fs.disk.direct.seek | 6.9 us (6.9 us..8.6 us) | 7.1 us (6.8 us..8.8 us) | - | +2% | no |
| fs.disk.direct.stat | 10.3 us (10.3 us..12.1 us) | 10.4 us (10.3 us..12.5 us) | - | +0% | no |
| fs.disk.fstat | 8.9 us (8.9 us..11.0 us) | 8.9 us (8.9 us..10.8 us) | 1.9 us (0.5 us..1.9 us) | -1% | no |
| fs.disk.mkdir_rmdir | 77.3 us (77.3 us..80.9 us) | 77.0 us (76.8 us..80.3 us) | 38.2 us (37.0 us..38.2 us) | -0% | no |
| fs.disk.open_close | 18.8 us (18.6 us..21.4 us) | 18.6 us (18.4 us..21.5 us) | 4.3 us (3.0 us..4.3 us) | -1% | no |
| fs.disk.pread_4k | 1.1 us (1.1 us..1.2 us) | 1.1 us (1.1 us..1.2 us) | 2.3 us (1.2 us..2.4 us) | +0% | no |
| fs.disk.pread_8 | 0.7 us (0.7 us..0.8 us) | 0.7 us (0.7 us..0.8 us) | 1.9 us (0.8 us..1.9 us) | +0% | no |
| fs.disk.read_4k | 1.0 us (1.0 us..1.0 us) | 1.0 us (1.0 us..1.1 us) | 2.3 us (1.1 us..2.3 us) | -0% | no |
| fs.disk.read_4k_at | 1.4 us (1.4 us..1.5 us) | 1.4 us (1.4 us..1.5 us) | 2.4 us (1.5 us..2.4 us) | -1% | no |
| fs.disk.readdir.1000 | 2.01 ms (2.00 ms..2.02 ms) | 2.05 ms (2.01 ms..2.11 ms) | 0.44 ms (0.43 ms..0.44 ms) | +2% | no |
| fs.disk.rename | 40.9 us (40.7 us..41.8 us) | 40.3 us (40.1 us..41.6 us) | 10.8 us (9.3 us..10.8 us) | -1% | no |
| fs.disk.reopen_read_4k | 19.3 us (19.3 us..21.9 us) | 19.0 us (19.0 us..22.2 us) | 5.2 us (3.8 us..5.2 us) | -2% | no |
| fs.disk.seek | 0.2 us (0.2 us..0.2 us) | 0.2 us (0.2 us..0.2 us) | 1.4 us (0.2 us..1.4 us) | +0% | no |
| fs.disk.seq_read.1048576 | 10106 MB/s (9946 MB/s..10478 MB/s) | 10099 MB/s (9978 MB/s..10393 MB/s) | 11434 MB/s (11303 MB/s..11664 MB/s) | +0% | no |
| fs.disk.seq_read.4096 | 7148 MB/s (7063 MB/s..7169 MB/s) | 7156 MB/s (7142 MB/s..7163 MB/s) | 5132 MB/s (5092 MB/s..5139 MB/s) | -0% | no |
| fs.disk.seq_write.1048576 | 464 MB/s (463 MB/s..465 MB/s) | 457 MB/s (450 MB/s..472 MB/s) | 792 MB/s (785 MB/s..806 MB/s) | +2% | no |
| fs.disk.seq_write.4096 | 201 MB/s (181 MB/s..205 MB/s) | 204 MB/s (182 MB/s..206 MB/s) | 730 MB/s (717 MB/s..734 MB/s) | -1% | no |
| fs.disk.stat | 11.6 us (11.5 us..13.8 us) | 11.6 us (11.5 us..13.7 us) | 2.8 us (1.4 us..2.9 us) | -0% | no |
| fs.disk.tree.100 | 17.88 ms (17.08 ms..18.08 ms) | 17.29 ms (16.93 ms..17.65 ms) | 3.44 ms (3.41 ms..3.45 ms) | -3% | no |
| fs.disk.write_4k_at | 28.3 us (26.9 us..30.0 us) | 28.0 us (27.6 us..29.8 us) | 2.9 us (2.1 us..2.9 us) | -1% | no |
| persist.append_4k_fsync | 2.51 ms (2.46 ms..2.52 ms) | 2.43 ms (2.41 ms..2.50 ms) | 3.37 ms (3.27 ms..3.83 ms) | -4% | no |
| persist.create_fsync_unlink | 2.98 ms (2.86 ms..2.99 ms) | 2.97 ms (2.53 ms..3.01 ms) | 3.27 ms (3.11 ms..3.27 ms) | -1% | no |
| persist.fsync_clean | 8.7 us (8.6 us..14.7 us) | 8.6 us (8.6 us..14.3 us) | 66.4 us (57.0 us..66.8 us) | -0% | no |
| persist.seq_read_cached | 6012 MB/s (5902 MB/s..6044 MB/s) | 6009 MB/s (5907 MB/s..6036 MB/s) | 11310 MB/s (6690 MB/s..11503 MB/s) | +0% | no |
| persist.seq_write_fsync | 263 MB/s (258 MB/s..266 MB/s) | 265 MB/s (260 MB/s..266 MB/s) | 527 MB/s (525 MB/s..531 MB/s) | -1% | no |
| persist.write_4k_fsync | 2.54 ms (2.47 ms..2.54 ms) | 2.47 ms (2.45 ms..2.54 ms) | 3.59 ms (3.58 ms..3.59 ms) | -3% | no |
| persist.write_4k_fsync_beside_1m | 3.15 ms (3.12 ms..3.20 ms) | 3.14 ms (3.00 ms..3.15 ms) | 4.15 ms (3.51 ms..4.18 ms) | -0% | no |

(+ is worse.)

L1: PASS

## L2: the tables

- r1-P: nvme 02:00.0: autonomous power state transitions on, round trips within 100000 us: 0->4 after 100 ms, 1->4 after 100 ms, 2->4 after 100 ms, 3->4 after 100 ms
- r2-P: nvme 02:00.0: autonomous power state transitions on, round trips within 100000 us: 0->4 after 100 ms, 1->4 after 100 ms, 2->4 after 100 ms, 3->4 after 100 ms
- r3-P: nvme 02:00.0: autonomous power state transitions on, round trips within 100000 us: 0->4 after 100 ms, 1->4 after 100 ms, 2->4 after 100 ms, 3->4 after 100 ms
- linux: cond nvme.apst=on
- linux: note=nvme.apst table=0->4_after_100_ms,1->4_after_100_ms,2->4_after_100_ms,3->4_after_100_ms

## R1, R2: the first durable write after idle

- p50, median of boots: P' 11.33 ms, M' 4.19 ms, Linux 10.70 ms
- P' over Linux: +0.63 ms (+6%). APST's own price, P' minus M': +7.14 ms
- worst sample: P' 11.78 ms, M' 4.65 ms, Linux 11.83 ms

# t14

## Per boot (p50 / p90)

| boot | write_4k_fsync | mode before idle | after_idle p50 (min..max) | beside_1m | append_4k_fsync | create_fsync_unlink | modes after idle |
|---|---|---|---|---|---|---|---|
| r1-M | 6.56 / 6.71 ms | slow | 6.23 ms (6.09..6.58) | 7.75 / 7.94 ms | 6.79 / 6.95 ms | 7.57 / 8.03 ms | slow, slow, slow |
| r1-P | 1.10 / 1.13 ms | fast | 14.20 ms (14.07..14.37) | 1.28 / 1.43 ms | 1.10 / 1.13 ms | 1.06 / 1.07 ms | fast, fast, fast |
| r2-M | 5.95 / 6.02 ms | slow | 5.78 ms (5.71..6.13) | 6.94 / 7.20 ms | 6.30 / 6.47 ms | 6.81 / 6.99 ms | slow, slow, slow |
| r2-P | 6.28 / 6.48 ms | slow | 14.31 ms (14.23..18.10) | 1.32 / 1.35 ms | 0.98 / 0.99 ms | 1.17 / 1.19 ms | fast, fast, fast |
| r3-M | 5.74 / 6.26 ms | slow | 5.95 ms (5.86..6.34) | 7.70 / 7.86 ms | 6.75 / 6.92 ms | 7.44 / 7.64 ms | slow, slow, slow |
| r3-P | 6.45 / 6.61 ms | slow | 14.51 ms (14.41..18.34) | 1.28 / 1.30 ms | 0.98 / 0.99 ms | 1.16 / 1.42 ms | fast, fast, fast |
| linux L1 | 0.98 / 1.15 ms | - | 13.02 ms (12.90..13.05) | 1.29 / 1.49 ms | 0.81 / 1.10 ms | 0.85 / 1.02 ms | - |
| linux L2 | 4.68 / 4.78 ms | - | 12.99 ms (4.76..13.74) | 1.31 / 1.50 ms | 0.91 / 1.30 ms | 0.97 / 1.16 ms | - |
| linux L3 | 5.22 / 5.33 ms | - | 13.04 ms (4.98..13.75) | 1.30 / 1.48 ms | 0.94 / 1.34 ms | 0.96 / 1.10 ms | - |

## L1: every back-to-back disk row, median of three boots' p50 (min..max)

| row | M' | P' | Linux | P' vs M' | resolved |
|---|---|---|---|---|---|
| fs.disk.create_write_unlink | 0.13 ms (0.12 ms..0.13 ms) | 0.13 ms (0.12 ms..0.13 ms) | 11.2 us (11.2 us..11.3 us) | -0% | no |
| fs.disk.direct.fstat | 10.0 us (9.2 us..10.5 us) | 9.2 us (9.1 us..10.6 us) | - | -8% | no |
| fs.disk.direct.pread_4k | 8.3 us (8.2 us..9.2 us) | 8.3 us (8.2 us..9.2 us) | - | -0% | no |
| fs.disk.direct.read_4k_at | 15.6 us (15.6 us..17.5 us) | 15.6 us (15.6 us..17.6 us) | - | +0% | no |
| fs.disk.direct.seek | 7.1 us (7.0 us..8.3 us) | 7.0 us (6.9 us..8.3 us) | - | -1% | no |
| fs.disk.direct.stat | 11.1 us (11.0 us..12.6 us) | 11.2 us (11.1 us..12.7 us) | - | +1% | no |
| fs.disk.fstat | 9.6 us (9.4 us..10.9 us) | 9.5 us (9.5 us..10.9 us) | 0.2 us (0.2 us..0.2 us) | -0% | no |
| fs.disk.mkdir_rmdir | 83.9 us (77.4 us..85.7 us) | 84.1 us (77.4 us..86.0 us) | 14.5 us (14.5 us..14.6 us) | +0% | no |
| fs.disk.open_close | 21.7 us (21.7 us..24.5 us) | 21.7 us (21.6 us..24.4 us) | 1.2 us (1.2 us..1.3 us) | -0% | no |
| fs.disk.pread_4k | 0.7 us (0.7 us..0.8 us) | 0.8 us (0.7 us..0.8 us) | 0.6 us (0.6 us..0.6 us) | +10% | no |
| fs.disk.pread_8 | 0.6 us (0.6 us..0.6 us) | 0.6 us (0.5 us..0.6 us) | 0.4 us (0.4 us..0.4 us) | +1% | no |
| fs.disk.read_4k | 0.7 us (0.7 us..0.8 us) | 0.7 us (0.7 us..0.8 us) | 0.5 us (0.5 us..0.6 us) | -1% | no |
| fs.disk.read_4k_at | 1.0 us (1.0 us..1.1 us) | 1.0 us (1.0 us..1.0 us) | 0.7 us (0.7 us..0.8 us) | +1% | no |
| fs.disk.readdir.1000 | 2.88 ms (2.74 ms..2.91 ms) | 2.87 ms (2.73 ms..2.89 ms) | 0.27 ms (0.27 ms..0.27 ms) | -0% | no |
| fs.disk.rename | 46.1 us (44.4 us..47.8 us) | 45.9 us (44.3 us..48.2 us) | 3.6 us (3.6 us..3.6 us) | -0% | no |
| fs.disk.reopen_read_4k | 22.4 us (22.4 us..24.9 us) | 22.3 us (22.2 us..24.9 us) | 1.5 us (1.5 us..1.7 us) | -0% | no |
| fs.disk.seek | 0.2 us (0.2 us..0.2 us) | 0.2 us (0.2 us..0.2 us) | 0.1 us (0.1 us..0.1 us) | +1% | yes |
| fs.disk.seq_read.1048576 | 7345 MB/s (7323 MB/s..7376 MB/s) | 7274 MB/s (7087 MB/s..7336 MB/s) | 9585 MB/s (9528 MB/s..9646 MB/s) | +1% | no |
| fs.disk.seq_read.4096 | 5435 MB/s (5218 MB/s..5501 MB/s) | 5395 MB/s (5357 MB/s..5409 MB/s) | 7785 MB/s (7742 MB/s..7789 MB/s) | +1% | no |
| fs.disk.seq_write.1048576 | 475 MB/s (403 MB/s..483 MB/s) | 482 MB/s (479 MB/s..509 MB/s) | 348 MB/s (347 MB/s..348 MB/s) | -1% | no |
| fs.disk.seq_write.4096 | 177 MB/s (164 MB/s..180 MB/s) | 194 MB/s (185 MB/s..203 MB/s) | 633 MB/s (627 MB/s..647 MB/s) | -10% | yes |
| fs.disk.stat | 12.4 us (12.2 us..14.1 us) | 12.4 us (12.3 us..14.1 us) | 0.6 us (0.6 us..0.6 us) | +0% | no |
| fs.disk.tree.100 | 21.16 ms (20.51 ms..22.73 ms) | 15.67 ms (14.95 ms..16.76 ms) | 1.35 ms (1.34 ms..1.35 ms) | -26% | yes |
| fs.disk.write_4k_at | 23.1 us (22.5 us..23.4 us) | 22.5 us (21.4 us..23.4 us) | 0.7 us (0.7 us..0.8 us) | -3% | no |
| persist.append_4k_fsync | 6.75 ms (6.30 ms..6.79 ms) | 0.98 ms (0.98 ms..1.10 ms) | 0.91 ms (0.81 ms..0.94 ms) | -85% | yes |
| persist.create_fsync_unlink | 7.44 ms (6.81 ms..7.57 ms) | 1.16 ms (1.06 ms..1.17 ms) | 0.96 ms (0.85 ms..0.97 ms) | -84% | yes |
| persist.fsync_clean | 7.5 us (7.4 us..8.7 us) | 7.6 us (7.4 us..8.7 us) | 23.0 us (23.0 us..23.0 us) | +1% | no |
| persist.seq_read_cached | 7940 MB/s (7169 MB/s..9266 MB/s) | 8053 MB/s (8018 MB/s..9495 MB/s) | 11198 MB/s (11007 MB/s..11376 MB/s) | -1% | no |
| persist.seq_write_fsync | 191 MB/s (178 MB/s..192 MB/s) | 259 MB/s (249 MB/s..288 MB/s) | 585 MB/s (582 MB/s..602 MB/s) | -36% | yes |
| persist.write_4k_fsync | 5.95 ms (5.74 ms..6.56 ms) | 6.28 ms (1.10 ms..6.45 ms) | 4.68 ms (0.98 ms..5.22 ms) | +5% | no |
| persist.write_4k_fsync_beside_1m | 7.70 ms (6.94 ms..7.75 ms) | 1.28 ms (1.28 ms..1.32 ms) | 1.30 ms (1.29 ms..1.31 ms) | -83% | yes |

(+ is worse.)

L1: PASS

## L2: the tables

- r1-P: nvme 04:00.0: autonomous power state transitions on, round trips within 100000 us: 0->4 after 100 ms, 1->4 after 100 ms, 2->4 after 100 ms, 3->4 after 100 ms
- r2-P: nvme 04:00.0: autonomous power state transitions on, round trips within 100000 us: 0->4 after 100 ms, 1->4 after 100 ms, 2->4 after 100 ms, 3->4 after 100 ms
- r3-P: nvme 04:00.0: autonomous power state transitions on, round trips within 100000 us: 0->4 after 100 ms, 1->4 after 100 ms, 2->4 after 100 ms, 3->4 after 100 ms
- linux: cond nvme.apst=on
- linux: note=nvme.apst table=0->4_after_100_ms,1->4_after_100_ms,2->4_after_100_ms,3->4_after_100_ms

## R1, R2: the first durable write after idle

- p50, median of boots: P' 14.31 ms, M' 5.95 ms, Linux 13.02 ms
- P' over Linux: +1.29 ms (+10%). APST's own price, P' minus M': +8.36 ms
- worst sample: P' 18.34 ms, M' 6.58 ms, Linux 13.75 ms

## R3: the slow mode across the idle row

- M': 3 of 3 boots began slow or mixed; 0 of those had every durable row after the idle row fast
- P': 2 of 3 boots began slow or mixed; 2 of those had every durable row after the idle row fast
