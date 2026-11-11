## The AMD bench

174 rows besides the clock gauges; 134 have a direction and both systems' values: behind 35, unresolved 15 (0 reading behind), at parity 8, ahead 76.

### Behind Linux, by hotness and then ratio

| hot | area | row | unit | ToyOS median (range) | Linux median (range) | ToyOS | p | verdict | against Linux's TSC runs | record |
|---|---|---|---|---|---|---|---|---|---|---|
| 0 | spawn | `proc.spawn_wait.large` | ns | 12,586,708 (1.1%) | 278,643 (17.1%) | 45.17x | 0.016 | behind | 45.64x | spawning-a-process-costs-toyos-up-to-four-times-linuxs-on-the-t14, a-large-spawn-on-the-amd-bench-is-a-seventh-slower-than-mains |
| 0 | spawn | `work.build_shaped.j16` | ns | 277,092,641 (0.7%) | 107,734,386 (24.4%) | 2.57x | 0.016 | behind | 2.45x | spawning-a-process-costs-toyos-up-to-four-times-linuxs-on-the-t14 |
| 1 | fs disk | `fs.disk.write_4k_at` | ns | 26,440 (9.5%) | 2,933 (35.5%) | 9.01x | 0.016 | behind | 13.33x | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call, a-4-kib-overwrite-on-data-costs-about-2-4-times-mains |
| 1 | fs memory | `fs.mem.fstat` | ns | 9,117 (23.0%) | 1,886 (74.5%) | 4.83x | 0.008 | behind | 18.76x | a-tmpfs-metadata-call-costs-toyos-up-to-six-times-linuxs |
| 1 | fs disk | `fs.disk.fstat` | ns | 8,936 (24.5%) | 1,885 (75.0%) | 4.74x | 0.008 | behind | 18.58x | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call, smaller-data-rows-trail-main-by-up-to-half |
| 1 | fs disk | `fs.disk.open_close` | ns | 18,670 (17.5%) | 4,331 (31.3%) | 4.31x | 0.016 | behind | 5.85x | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 1 | fs disk | `fs.disk.stat` | ns | 11,707 (18.5%) | 2,794 (50.8%) | 4.19x | 0.008 | behind | 8.03x | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call, smaller-data-rows-trail-main-by-up-to-half |
| 1 | fs memory | `fs.mem.write_4k_at` | ns | 11,361 (20.1%) | 2,863 (41.2%) | 3.97x | 0.008 | behind | 6.48x | a-tmpfs-metadata-call-costs-toyos-up-to-six-times-linuxs |
| 1 | fs memory | `fs.mem.stat` | ns | 11,246 (19.9%) | 2,863 (47.9%) | 3.93x | 0.008 | behind | 7.51x | a-tmpfs-metadata-call-costs-toyos-up-to-six-times-linuxs |
| 1 | fs memory | `fs.mem.seq_write.4096` | MB/s | 354 (24.6%) | 1,309 (1.2%) | 3.70x | 0.016 | behind | 3.71x | a-tmpfs-metadata-call-costs-toyos-up-to-six-times-linuxs |
| 1 | fs disk | `fs.disk.seq_write.4096` | MB/s | 202 (10.4%) | 721 (4.2%) | 3.57x | 0.016 | behind | 3.60x | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call, smaller-data-rows-trail-main-by-up-to-half |
| 1 | fs memory | `fs.mem.open_close` | ns | 14,612 (21.1%) | 4,330 (32.9%) | 3.37x | 0.008 | behind | 5.02x | a-tmpfs-metadata-call-costs-toyos-up-to-six-times-linuxs |
| 1 | sched/wake | `wake.onto_busy` | ns | 18,335 (1.2%) | 10,197 (29.1%) | 1.80x | 0.016 | behind | 2.16x | a-wake-onto-a-busy-cpu-costs-toyos-1-8-times-linuxs (new) |
| 1 | fs disk | `fs.disk.seq_write.1048576` | MB/s | 464 (4.5%) | 791 (5.3%) | 1.70x | 0.016 | behind | 1.74x | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 1 | ipc | `pipe.throughput.4096` | MB/s | 3,022 (0.5%) | 4,951 (28.5%) | 1.64x | 0.016 | behind | 2.00x | user-memory-hot-paths-are-slower-than-2-mib-pages |
| 1 | memory | `mem.memcpy.64` | MB/s | 3,967 (0.8%) | 6,492 (1.6%) | 1.64x | 0.016 | behind | 1.65x | a-small-memcpy-on-the-amd-bench-runs-at-as-little-as-six-tenths-of-linuxs |
| 1 | ipc | `pipe.throughput.16384` | MB/s | 3,020 (1.1%) | 3,714 (6.5%) | 1.23x | 0.016 | behind | 1.25x | user-memory-hot-paths-are-slower-than-2-mib-pages |
| 1 | fs disk | `fs.disk.seq_read.1048576` | MB/s | 9,980 (3.4%) | 11,500 (3.8%) | 1.15x | 0.016 | behind | 1.16x | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 1 | sched/wake | `time.yield` | ps | 622,208 (4.2%) | 551,970 (1.3%) | 1.13x | 0.016 | behind | 1.13x | a-yield-costs-toyos-up-to-3-4-times-linuxs (was toyos-yield-is-not-yet-measured-against-linux) |
| 1 | memory | `mem.memcpy.256` | MB/s | 14,598 (0.9%) | 16,150 (1.7%) | 1.11x | 0.016 | behind | 1.12x | a-small-memcpy-on-the-amd-bench-runs-at-as-little-as-six-tenths-of-linuxs |
| 2 | fs disk | `fs.disk.tree.100` | ns | 17,501,764 (2.4%) | 3,448,059 (1.9%) | 5.08x | 0.016 | behind | 5.13x | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call, smaller-data-rows-trail-main-by-up-to-half |
| 2 | fs disk | `fs.disk.readdir.1000` | ns | 2,029,621 (4.9%) | 441,684 (3.7%) | 4.60x | 0.016 | behind | 4.67x | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call, a-data-directory-listing-reads-every-entrys-inode-alone |
| 2 | fs disk | `fs.disk.create_write_unlink` | ns | 120,460 (4.8%) | 29,054 (7.2%) | 4.15x | 0.016 | behind | 4.42x | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 2 | fs disk | `fs.disk.rename` | ns | 40,481 (5.4%) | 10,825 (14.2%) | 3.74x | 0.016 | behind | 4.34x | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 2 | fs disk | `fs.disk.reopen_read_4k` | ns | 19,226 (17.4%) | 5,238 (27.9%) | 3.67x | 0.008 | behind | 4.90x | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 2 | fs memory | `fs.mem.reopen_read_4k` | ns | 15,308 (23.0%) | 4,889 (27.4%) | 3.13x | 0.008 | behind | 4.30x | a-tmpfs-metadata-call-costs-toyos-up-to-six-times-linuxs |
| 2 | fs memory | `fs.mem.mkdir_rmdir` | ns | 23,985 (17.5%) | 8,032 (18.0%) | 2.99x | 0.008 | behind | 3.59x | a-tmpfs-metadata-call-costs-toyos-up-to-six-times-linuxs |
| 2 | fs memory | `fs.mem.tree.100` | ns | 4,017,158 (18.7%) | 1,405,962 (1.1%) | 2.86x | 0.016 | behind | 2.87x | a-tmpfs-metadata-call-costs-toyos-up-to-six-times-linuxs |
| 2 | fs memory | `fs.mem.create_write_unlink` | ns | 36,674 (19.9%) | 14,178 (11.6%) | 2.59x | 0.016 | behind | 2.88x | a-tmpfs-metadata-call-costs-toyos-up-to-six-times-linuxs |
| 2 | fs memory | `fs.mem.rename` | ns | 13,570 (15.5%) | 5,867 (27.2%) | 2.31x | 0.016 | behind | 3.03x | a-tmpfs-metadata-call-costs-toyos-up-to-six-times-linuxs |
| 2 | durable | `persist.seq_write_fsync` | MB/s | 260 (7.3%) | 523 (1.7%) | 2.01x | 0.016 | behind | 2.01x | toyos-durable-writes-on-the-t14s-nvme-run-six-times-slower-in-some-boots (the T14); none on main for the AMD bench, whose row another assignment holds |
| 2 | fs disk | `fs.disk.mkdir_rmdir` | ns | 77,305 (5.1%) | 38,484 (4.3%) | 2.01x | 0.016 | behind | 2.09x | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 2 | durable | `persist.seq_read_cached` | MB/s | 6,004 (12.5%) | 11,141 (42.0%) | 1.86x | 0.016 | behind | 1.12x | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 2 | fs memory | `fs.mem.readdir.1000` | ns | 446,006 (2.1%) | 271,128 (3.2%) | 1.65x | 0.016 | behind | 1.66x | a-tmpfs-metadata-call-costs-toyos-up-to-six-times-linuxs |
| 3 | cpu | `crunch.single.matmul` | ns | 943,710 (1.2%) | 920,525 (2.2%) | 1.03x | 0.016 | behind | 1.04x | toyos-uses-what-modern-hardware-offers-for-speed |

### Unresolved and reading behind by more than 1.10

| hot | area | row | unit | ToyOS median (range) | Linux median (range) | ToyOS | p | verdict | against Linux's TSC runs | record |
|---|---|---|---|---|---|---|---|---|---|---|

### Not behind by the rule, yet behind both of Linux's TSC runs (4,5) by more than 1.10

Two runs resolve nothing; these are exploratory. A cell's Linux value is the TSC runs' p50s.

| hot | area | row | unit | ToyOS median (range) | Linux TSC runs | ToyOS against the nearer | rule's verdict | record |
|---|---|---|---|---|---|---|---|---|
| 3 | sched/wake | `fair.shared.total` | chunks/s | 4,062,194 (0.8%) | 5,089,421, 5,099,351 | 1.25x | unresolved | all-cpu-throughput-in-one-group-reads-under-linuxs (new) |

### Every judged row

| hot | area | row | unit | ToyOS median (range) | Linux median (range) | ToyOS | p | verdict | against Linux's TSC runs |
|---|---|---|---|---|---|---|---|---|---|
| 3 | cpu | `crunch.single.deflate` | ns | 63,376,710 (0.8%) | 65,036,547 (5.3%) | 1.03x faster | 0.063 | at parity | 1.02x faster |
| 3 | cpu | `crunch.single.matmul` | ns | 943,710 (1.2%) | 920,525 (2.2%) | 1.03x | 0.016 | behind | 1.04x |
| 3 | cpu | `crunch.single.parse` | ns | 40,539,061 (1.0%) | 72,082,076 (0.0%) | 1.78x faster | 0.133 | unresolved | - |
| 3 | cpu | `crunch.single.sha256` | ns | 498,574 (1.2%) | 506,706 (2.6%) | 1.02x faster | 0.190 | at parity | 1.00x |
| 2 | cpu | `work.compress_inproc` | ns | 426,571,180 (1.4%) | 431,879,177 (0.8%) | 1.01x faster | 0.016 | ahead | 1.01x faster |
| 2 | durable | `persist.append_4k_fsync` | ns | 2,340,378 (11.6%) | 3,596,467 (13.4%) | 1.54x faster | 0.016 | ahead | 1.52x faster |
| 2 | durable | `persist.create_fsync_unlink` | ns | 2,844,820 (16.7%) | 3,261,929 (11.1%) | 1.15x faster | 0.032 | ahead | 1.09x faster |
| 2 | durable | `persist.fsync_clean` | ns | 9,818 (65.2%) | 67,677 (5.7%) | 6.89x faster | 0.016 | ahead | 6.64x faster |
| 2 | durable | `persist.seq_read_cached` | MB/s | 6,004 (12.5%) | 11,141 (42.0%) | 1.86x | 0.016 | behind | 1.12x |
| 2 | durable | `persist.seq_write_fsync` | MB/s | 260 (7.3%) | 523 (1.7%) | 2.01x | 0.016 | behind | 2.01x |
| 2 | durable | `persist.write_4k_fsync` | ns | 2,298,930 (13.0%) | 3,591,556 (15.8%) | 1.56x faster | 0.016 | ahead | 1.56x faster |
| 2 | durable | `persist.write_4k_fsync_beside_1m` | ns | 2,992,676 (11.3%) | 4,035,208 (13.3%) | 1.35x faster | 0.016 | ahead | 1.35x faster |
| 2 | fs disk | `fs.disk.create_write_unlink` | ns | 120,460 (4.8%) | 29,054 (7.2%) | 4.15x | 0.016 | behind | 4.42x |
| 1 | fs disk | `fs.disk.fstat` | ns | 8,936 (24.5%) | 1,885 (75.0%) | 4.74x | 0.008 | behind | 18.58x |
| 2 | fs disk | `fs.disk.mkdir_rmdir` | ns | 77,305 (5.1%) | 38,484 (4.3%) | 2.01x | 0.016 | behind | 2.09x |
| 1 | fs disk | `fs.disk.open_close` | ns | 18,670 (17.5%) | 4,331 (31.3%) | 4.31x | 0.016 | behind | 5.85x |
| 1 | fs disk | `fs.disk.pread_4k` | ns | 1,142 (1.8%) | 2,374 (51.1%) | 2.08x faster | 0.024 | ahead | 1.05x faster |
| 1 | fs disk | `fs.disk.pread_8` | ns | 687 (17.5%) | 1,886 (59.7%) | 2.75x faster | 0.056 | unresolved | 1.11x faster |
| 2 | fs disk | `fs.disk.read_4k` | ns | 1,012 (4.0%) | 2,305 (55.6%) | 2.28x faster | 0.016 | ahead | 1.15x faster |
| 1 | fs disk | `fs.disk.read_4k_at` | ns | 1,442 (1.5%) | 2,375 (44.7%) | 1.65x faster | 0.198 | unresolved | 1.01x |
| 2 | fs disk | `fs.disk.readdir.1000` | ns | 2,029,621 (4.9%) | 441,684 (3.7%) | 4.60x | 0.016 | behind | 4.67x |
| 2 | fs disk | `fs.disk.rename` | ns | 40,481 (5.4%) | 10,825 (14.2%) | 3.74x | 0.016 | behind | 4.34x |
| 2 | fs disk | `fs.disk.reopen_read_4k` | ns | 19,226 (17.4%) | 5,238 (27.9%) | 3.67x | 0.008 | behind | 4.90x |
| 1 | fs disk | `fs.disk.seek` | ns | 200 (4.5%) | 1,397 (85.0%) | 6.98x faster | 0.008 | ahead | 1.05x faster |
| 1 | fs disk | `fs.disk.seq_read.1048576` | MB/s | 9,980 (3.4%) | 11,500 (3.8%) | 1.15x | 0.016 | behind | 1.16x |
| 1 | fs disk | `fs.disk.seq_read.4096` | MB/s | 6,912 (1.5%) | 5,022 (2.7%) | 1.38x faster | 0.016 | ahead | 1.36x faster |
| 1 | fs disk | `fs.disk.seq_write.1048576` | MB/s | 464 (4.5%) | 791 (5.3%) | 1.70x | 0.016 | behind | 1.74x |
| 1 | fs disk | `fs.disk.seq_write.4096` | MB/s | 202 (10.4%) | 721 (4.2%) | 3.57x | 0.016 | behind | 3.60x |
| 1 | fs disk | `fs.disk.stat` | ns | 11,707 (18.5%) | 2,794 (50.8%) | 4.19x | 0.008 | behind | 8.03x |
| 2 | fs disk | `fs.disk.tree.100` | ns | 17,501,764 (2.4%) | 3,448,059 (1.9%) | 5.08x | 0.016 | behind | 5.13x |
| 1 | fs disk | `fs.disk.write_4k_at` | ns | 26,440 (9.5%) | 2,933 (35.5%) | 9.01x | 0.016 | behind | 13.33x |
| 2 | fs memory | `fs.mem.create_write_unlink` | ns | 36,674 (19.9%) | 14,178 (11.6%) | 2.59x | 0.016 | behind | 2.88x |
| 1 | fs memory | `fs.mem.fstat` | ns | 9,117 (23.0%) | 1,886 (74.5%) | 4.83x | 0.008 | behind | 18.76x |
| 2 | fs memory | `fs.mem.mkdir_rmdir` | ns | 23,985 (17.5%) | 8,032 (18.0%) | 2.99x | 0.008 | behind | 3.59x |
| 1 | fs memory | `fs.mem.open_close` | ns | 14,612 (21.1%) | 4,330 (32.9%) | 3.37x | 0.008 | behind | 5.02x |
| 1 | fs memory | `fs.mem.pread_4k` | ns | 1,157 (3.4%) | 1,956 (58.9%) | 1.69x faster | 0.111 | unresolved | 1.00x faster |
| 1 | fs memory | `fs.mem.pread_8` | ns | 716 (7.0%) | 1,886 (62.2%) | 2.63x faster | 0.056 | unresolved | 1.07x faster |
| 2 | fs memory | `fs.mem.read_4k` | ns | 1,047 (4.8%) | 1,955 (47.8%) | 1.87x faster | 0.175 | unresolved | 1.00x |
| 1 | fs memory | `fs.mem.read_4k_at` | ns | 1,458 (2.8%) | 2,375 (40.9%) | 1.63x faster | 0.714 | unresolved | 1.04x |
| 2 | fs memory | `fs.mem.readdir.1000` | ns | 446,006 (2.1%) | 271,128 (3.2%) | 1.65x | 0.016 | behind | 1.66x |
| 2 | fs memory | `fs.mem.rename` | ns | 13,570 (15.5%) | 5,867 (27.2%) | 2.31x | 0.016 | behind | 3.03x |
| 2 | fs memory | `fs.mem.reopen_read_4k` | ns | 15,308 (23.0%) | 4,889 (27.4%) | 3.13x | 0.008 | behind | 4.30x |
| 1 | fs memory | `fs.mem.seek` | ns | 200 (0.0%) | 1,397 (84.9%) | 6.98x faster | 0.008 | ahead | 1.05x faster |
| 1 | fs memory | `fs.mem.seq_read.1048576` | MB/s | 10,394 (4.6%) | 8,567 (3.7%) | 1.21x faster | 0.016 | ahead | 1.22x faster |
| 1 | fs memory | `fs.mem.seq_read.4096` | MB/s | 7,096 (1.1%) | 5,401 (2.2%) | 1.31x faster | 0.016 | ahead | 1.31x faster |
| 1 | fs memory | `fs.mem.seq_write.1048576` | MB/s | 1,930 (7.3%) | 1,562 (0.5%) | 1.24x faster | 0.016 | ahead | 1.24x faster |
| 1 | fs memory | `fs.mem.seq_write.4096` | MB/s | 354 (24.6%) | 1,309 (1.2%) | 3.70x | 0.016 | behind | 3.71x |
| 1 | fs memory | `fs.mem.stat` | ns | 11,246 (19.9%) | 2,863 (47.9%) | 3.93x | 0.008 | behind | 7.51x |
| 2 | fs memory | `fs.mem.tree.100` | ns | 4,017,158 (18.7%) | 1,405,962 (1.1%) | 2.86x | 0.016 | behind | 2.87x |
| 1 | fs memory | `fs.mem.write_4k_at` | ns | 11,361 (20.1%) | 2,863 (41.2%) | 3.97x | 0.008 | behind | 6.48x |
| 1 | ipc | `ipc.connect_accept` | ns | 2,018 (2.0%) | 12,362 (12.2%) | 6.13x faster | 0.016 | ahead | 5.42x faster |
| 1 | ipc | `ipc.reqrep.4096` | ns | 6,662 (1.4%) | 18,369 (28.0%) | 2.76x faster | 0.016 | ahead | 2.62x faster |
| 1 | ipc | `ipc.reqrep.65536` | ns | 21,721 (104.3%) | 47,109 (40.9%) | 2.17x faster | 0.063 | unresolved | 1.78x faster |
| 1 | ipc | `ipc.reqrep.8` | ns | 5,966 (1.0%) | 13,689 (33.9%) | 2.29x faster | 0.016 | ahead | 2.46x faster |
| 1 | ipc | `ipc.reqrep_handle.8` | ns | 6,412 (32.0%) | 22,000 (8.4%) | 3.43x faster | 0.016 | ahead | 3.27x faster |
| 1 | ipc | `pipe.throughput.1024` | MB/s | 1,930 (2.8%) | 1,608 (19.4%) | 1.20x faster | 0.016 | ahead | 1.10x faster |
| 1 | ipc | `pipe.throughput.16384` | MB/s | 3,020 (1.1%) | 3,714 (6.5%) | 1.23x | 0.016 | behind | 1.25x |
| 1 | ipc | `pipe.throughput.256` | MB/s | 492 (3.3%) | 419 (4.1%) | 1.17x faster | 0.016 | ahead | 1.15x faster |
| 1 | ipc | `pipe.throughput.4096` | MB/s | 3,022 (0.5%) | 4,951 (28.5%) | 1.64x | 0.016 | behind | 2.00x |
| 1 | ipc | `pipe.throughput.64` | MB/s | 126 (1.6%) | 107 (15.0%) | 1.18x faster | 0.016 | ahead | 1.14x faster |
| 1 | ipc | `pipe.throughput.65536` | MB/s | 3,032 (0.8%) | 1,593 (80.3%) | 1.90x faster | 0.016 | ahead | 1.16x faster |
| 1 | memory | `mem.anon.map` | ns/MiB | 172 (103.8%) | 336 (33.0%) | 1.95x faster | 0.111 | unresolved | 1.68x faster |
| 1 | memory | `mem.anon.total` | ns/MiB | 128,716 (1.9%) | 513,887 (4.7%) | 3.99x faster | 0.016 | ahead | 3.97x faster |
| 1 | memory | `mem.anon.touch` | ns/MiB | 123,170 (0.5%) | 436,428 (3.3%) | 3.54x faster | 0.016 | ahead | 3.55x faster |
| 1 | memory | `mem.anon.unmap` | ns/MiB | 5,229 (3.6%) | 73,776 (13.7%) | 14.11x faster | 0.016 | ahead | 13.96x faster |
| 1 | memory | `mem.bw.copy` | MB/s | 8,304 (1.6%) | 8,300 (5.9%) | 1.00x faster | 0.905 | at parity | 1.02x |
| 1 | memory | `mem.bw.read` | MB/s | 19,552 (1.2%) | 19,664 (3.2%) | 1.01x | 0.730 | at parity | 1.01x |
| 1 | memory | `mem.bw.write` | MB/s | 9,712 (0.3%) | 9,394 (2.6%) | 1.03x faster | 0.016 | ahead | 1.02x faster |
| 1 | memory | `mem.first_touch.2m` | ns/MiB | 125,570 (0.7%) | 132,969 (0.6%) | 1.06x faster | 0.016 | ahead | 1.06x faster |
| 1 | memory | `mem.first_touch.4k` | ns/MiB | 125,372 (0.7%) | 435,299 (2.8%) | 3.47x faster | 0.016 | ahead | 3.50x faster |
| 1 | memory | `mem.malloc_churn.1048576.t1` | kops/s | 223 (8.5%) | 92 (12.0%) | 2.42x faster | 0.016 | ahead | 2.34x faster |
| 1 | memory | `mem.malloc_churn.1048576.t16` | kops/s | 96 (7.3%) | 64 (10.9%) | 1.50x faster | 0.016 | ahead | 1.49x faster |
| 1 | memory | `mem.malloc_churn.16.t1` | kops/s | 39,416 (0.7%) | 31,397 (2.3%) | 1.26x faster | 0.016 | ahead | 1.25x faster |
| 1 | memory | `mem.malloc_churn.16.t16` | kops/s | 2,912 (1.2%) | 1,714 (1.5%) | 1.70x faster | 0.016 | ahead | 1.70x faster |
| 1 | memory | `mem.malloc_churn.4096.t1` | kops/s | 38,744 (0.6%) | 22,434 (3.7%) | 1.73x faster | 0.016 | ahead | 1.70x faster |
| 1 | memory | `mem.malloc_churn.4096.t16` | kops/s | 2,400 (3.5%) | 1,541 (2.5%) | 1.56x faster | 0.016 | ahead | 1.54x faster |
| 1 | memory | `mem.map_touch_unmap.2m` | ns/MiB | 133,467 (0.5%) | 137,515 (0.6%) | 1.03x faster | 0.016 | ahead | 1.03x faster |
| 1 | memory | `mem.map_touch_unmap.4k` | ns/MiB | 131,326 (1.1%) | 505,894 (2.3%) | 3.85x faster | 0.016 | ahead | 3.88x faster |
| 2 | memory | `mem.map_unmap_4k` | ns | 1,538 (0.7%) | 5,378 (26.4%) | 3.50x faster | 0.016 | ahead | 2.57x faster |
| 1 | memory | `mem.memcpy.1024` | MB/s | 44,282 (0.7%) | 40,936 (1.6%) | 1.08x faster | 0.016 | ahead | 1.07x faster |
| 1 | memory | `mem.memcpy.1048576` | MB/s | 11,528 (2.6%) | 11,575 (2.7%) | 1.00x | 0.413 | at parity | 1.01x |
| 1 | memory | `mem.memcpy.16384` | MB/s | 88,790 (0.7%) | 73,843 (3.5%) | 1.20x faster | 0.016 | ahead | 1.19x faster |
| 1 | memory | `mem.memcpy.16777216` | MB/s | 6,162 (0.4%) | 6,162 (5.6%) | 1.00x | 1.000 | at parity | 1.02x |
| 1 | memory | `mem.memcpy.256` | MB/s | 14,598 (0.9%) | 16,150 (1.7%) | 1.11x | 0.016 | behind | 1.12x |
| 1 | memory | `mem.memcpy.262144` | MB/s | 38,081 (16.9%) | 35,246 (5.2%) | 1.08x faster | 0.286 | at parity | 1.06x faster |
| 1 | memory | `mem.memcpy.4096` | MB/s | 89,524 (0.6%) | 84,949 (1.9%) | 1.05x faster | 0.016 | ahead | 1.04x faster |
| 1 | memory | `mem.memcpy.4194304` | MB/s | 10,916 (2.1%) | 10,745 (1.6%) | 1.02x faster | 0.016 | ahead | 1.01x faster |
| 1 | memory | `mem.memcpy.64` | MB/s | 3,967 (0.8%) | 6,492 (1.6%) | 1.64x | 0.016 | behind | 1.65x |
| 1 | memory | `mem.memcpy.65536` | MB/s | 67,126 (0.7%) | 65,907 (1.7%) | 1.02x faster | 0.016 | ahead | 1.01x faster |
| 1 | memory | `mem.memcpy.67108864` | MB/s | 6,212 (1.2%) | 6,145 (2.5%) | 1.01x faster | 0.190 | at parity | 1.00x faster |
| 2 | memory | `mem.mprotect.4k` | ns | 706 (1.4%) | 3,352 (36.7%) | 4.75x faster | 0.016 | ahead | 3.01x faster |
| 2 | memory | `mem.munmap_part.4k` | ns | 1,002 (1.0%) | 4,680 (34.1%) | 4.67x faster | 0.016 | ahead | 3.09x faster |
| 2 | memory | `mem.munmap_touched_remote.4k` | ns | 2,840 (6.3%) | 5,657 (19.8%) | 1.99x faster | 0.016 | ahead | 1.60x faster |
| 2 | memory | `mem.realloc_grow.1m_256m` | ns | 49,502 (28.0%) | 210,084 (4.7%) | 4.24x faster | 0.016 | ahead | 4.06x faster |
| 2 | memory | `mem.realloc_grow.last_128m_256m` | ns | 7,564 (1.9%) | 53,779 (2.7%) | 7.11x faster | 0.016 | ahead | 6.96x faster |
| 3 | sched/wake | `fair.apart.total` | chunks/s | 5,062,037 (1.4%) | 3,290,941 (53.9%) | 1.54x faster | 0.063 | unresolved | 1.00x faster |
| 3 | sched/wake | `fair.shared.total` | chunks/s | 4,062,194 (0.8%) | 3,314,081 (54.2%) | 1.23x faster | 0.730 | unresolved | 1.25x |
| 1 | sched/wake | `pingpong.futex.cross_core` | ns | 4,634 (0.9%) | 13,410 (28.0%) | 2.89x faster | 0.016 | ahead | 2.09x faster |
| 1 | sched/wake | `pingpong.futex.same_cpu` | ns | 3,772 (0.8%) | 7,474 (18.7%) | 1.98x faster | 0.016 | ahead | 1.63x faster |
| 1 | sched/wake | `pingpong.pipe.cross_core` | ns | 5,506 (0.4%) | 14,457 (22.8%) | 2.63x faster | 0.016 | ahead | 2.03x faster |
| 1 | sched/wake | `pingpong.pipe.same_cpu` | ns | 4,774 (1.5%) | 9,011 (16.4%) | 1.89x faster | 0.016 | ahead | 1.60x faster |
| 3 | sched/wake | `tail.stolen.10s` | ns | 20,958 (3.2%) | 39,251 (27.5%) | 1.87x faster | 0.016 | ahead | 1.60x faster |
| 3 | sched/wake | `tail.wake.periodic.60s` | ns | 6,120 (1.0%) | 60,871 (34.7%) | 9.95x faster | 0.016 | ahead | 9.94x faster |
| 3 | sched/wake | `time.sleep_late.100us` | ns | 5,688 (0.4%) | 65,595 (8.1%) | 11.53x faster | 0.016 | ahead | 10.61x faster |
| 3 | sched/wake | `time.sleep_late.10ms` | ns | 56,524 (1.5%) | 118,624 (217.3%) | 2.10x faster | 0.016 | ahead | 3.87x faster |
| 3 | sched/wake | `time.sleep_late.10us` | ns | 1,367 (8.8%) | 61,099 (12.4%) | 44.70x faster | 0.016 | ahead | 39.18x faster |
| 3 | sched/wake | `time.sleep_late.1ms` | ns | 6,192 (1.9%) | 88,402 (40.0%) | 14.28x faster | 0.016 | ahead | 12.85x faster |
| 3 | sched/wake | `time.sleep_late.1us` | ns | 1,400 (3.6%) | 61,020 (12.6%) | 43.59x faster | 0.016 | ahead | 38.31x faster |
| 3 | sched/wake | `time.timer_1ms.late` | ns | 49,110 (1.8%) | 74,260 (17.8%) | 1.51x faster | 0.016 | ahead | 1.25x faster |
| 1 | sched/wake | `time.yield` | ps | 622,208 (4.2%) | 551,970 (1.3%) | 1.13x | 0.016 | behind | 1.13x |
| 1 | sched/wake | `wake.onto_busy` | ns | 18,335 (1.2%) | 10,197 (29.1%) | 1.80x | 0.016 | behind | 2.16x |
| 1 | sched/wake | `wake.periodic.idle` | ns | 20,426 (141.0%) | 73,658 (17.7%) | 3.61x faster | 0.016 | ahead | 2.98x faster |
| 1 | sched/wake | `wake.periodic.loaded` | ns | 4,403 (2.3%) | 59,212 (8.3%) | 13.45x faster | 0.016 | ahead | 12.36x faster |
| 1 | sched/wake | `wake.storm.call.w1` | ns | 7,554 (6.6%) | 8,399 (66.5%) | 1.11x faster | 0.730 | unresolved | 1.14x |
| 1 | sched/wake | `wake.storm.call.w16` | ns | 15,474 (5.6%) | 52,420 (36.1%) | 3.39x faster | 0.016 | ahead | 3.06x faster |
| 1 | sched/wake | `wake.storm.call.w4` | ns | 8,927 (7.5%) | 14,668 (20.1%) | 1.64x faster | 0.016 | ahead | 1.39x faster |
| 1 | sched/wake | `wake.storm.call.w64` | ns | 24,236 (6.2%) | 236,634 (13.0%) | 9.76x faster | 0.016 | ahead | 9.67x faster |
| 1 | sched/wake | `wake.storm.drain.w1` | ns | 50,575 (2.6%) | 76,576 (47.5%) | 1.51x faster | 0.190 | unresolved | 1.41x faster |
| 1 | sched/wake | `wake.storm.drain.w16` | ns | 80,656 (13.2%) | 123,629 (468.2%) | 1.53x faster | 0.016 | ahead | 4.87x faster |
| 1 | sched/wake | `wake.storm.drain.w4` | ns | 55,720 (2.7%) | 82,972 (15.7%) | 1.49x faster | 0.016 | ahead | 1.38x faster |
| 1 | sched/wake | `wake.storm.drain.w64` | ns | 239,114 (3.5%) | 877,763 (34.0%) | 3.67x faster | 0.016 | ahead | 3.40x faster |
| 0 | spawn | `proc.posix_spawn_wait.std` | ns | 399,298 (27.4%) | 940,595 (60.3%) | 2.36x faster | 0.111 | unresolved | 2.37x faster |
| 0 | spawn | `proc.posix_spawn_wait.tiny` | ns | 80,996 (14.5%) | 223,754 (60.1%) | 2.76x faster | 0.016 | ahead | 2.76x faster |
| 0 | spawn | `proc.spawn_wait.large` | ns | 12,586,708 (1.1%) | 278,643 (17.1%) | 45.17x | 0.016 | behind | 45.64x |
| 0 | spawn | `proc.spawn_wait.tiny` | ns | 95,038 (22.1%) | 270,089 (9.9%) | 2.84x faster | 0.016 | ahead | 2.69x faster |
| 0 | spawn | `proc.spawn_wait_loop.100` | ns | 9,660,886 (15.6%) | 30,219,148 (20.5%) | 3.13x faster | 0.016 | ahead | 2.96x faster |
| 0 | spawn | `process.spawn_wait` | ns | 391,340 (4.2%) | 962,158 (63.8%) | 2.46x faster | 0.190 | unresolved | 2.48x faster |
| 2 | spawn | `thread.spawn_join` | ns | 17,904 (1.7%) | 69,169 (31.9%) | 3.86x faster | 0.016 | ahead | 3.56x faster |
| 2 | spawn | `thread.spawn_join.default` | ns | 18,149 (0.5%) | 78,572 (11.4%) | 4.33x faster | 0.016 | ahead | 4.01x faster |
| 2 | spawn | `thread.spawn_join.stack64k` | ns | 15,514 (0.6%) | 73,335 (30.2%) | 4.73x faster | 0.016 | ahead | 3.67x faster |
| 0 | spawn | `work.build_shaped.j1` | ns | 886,883,802 (1.9%) | 1,639,173,487 (38.9%) | 1.85x faster | 0.016 | ahead | 1.96x faster |
| 0 | spawn | `work.build_shaped.j16` | ns | 277,092,641 (0.7%) | 107,734,386 (24.4%) | 2.57x | 0.016 | behind | 2.45x |
| 1 | syscall | `syscall.null` | ps | 48,922 (0.7%) | 158,938 (1.6%) | 3.25x faster | 0.016 | ahead | 3.22x faster |
| 1 | syscall | `time.now` | ps | 9,388 (0.8%) | 1,212,922 (98.1%) | 129.20x faster | 0.016 | ahead | 2.41x faster |

### Rows with no verdict

| row | unit | ToyOS | Linux | compare says |
|---|---|---|---|---|
| `crunch.all.deflate` | ns |  | 146185421, 118784533, 148166969, 147441245, 146164805 | ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| `crunch.all.matmul` |  |  |  | Linux 5 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| `crunch.all.parse` |  |  |  | Linux 5 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| `crunch.all.sha256` | ns |  | 548751, 581856, 576159, 581388 | Linux 1 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| `fair.apart.build` | permille | 63, 63, 63, 63 | 62, 62, 62, 63, 63 | not resolved |
| `fair.apart.helpers` | permille | 459, 459, 455, 458 | 411, 425, 404, 422, 447 | ToyOS higher |
| `fair.apart.threaded` | permille | 476, 476, 481, 478 | 525, 511, 532, 514, 489 | ToyOS lower |
| `fair.session.build` | permille |  | 33, 31, 30, 32, 33 | ToyOS 4 run(s) absent |
| `fair.session.helpers` | permille |  | 462, 464, 466, 466, 463 | ToyOS 4 run(s) absent |
| `fair.session.threaded` | permille |  | 506, 504, 502, 500, 502 | ToyOS 4 run(s) absent |
| `fair.session.total` | chunks/s |  | 3288738, 3287863, 3275945, 4867147, 4911122 | ToyOS 4 run(s) absent |
| `fair.shared.build` | permille | 29, 29, 30, 30 | 32, 31, 30, 31, 33 | ToyOS lower |
| `fair.shared.helpers` | permille | 486, 488, 485, 489 | 465, 465, 462, 468, 466 | ToyOS higher |
| `fair.shared.threaded` | permille | 482, 481, 484, 482 | 503, 502, 506, 500, 499 | ToyOS lower |
| `fs.disk.direct.fstat` | ns | 8586, 10459, 8626, 8637 |  | Linux 5 run(s) absent |
| `fs.disk.direct.pread_4k` | ns | 8426, 9908, 8375, 8506 |  | Linux 5 run(s) absent |
| `fs.disk.direct.read_4k_at` | ns | 15259, 18765, 15158, 14978 |  | Linux 5 run(s) absent |
| `fs.disk.direct.seek` | ns | 6863, 8636, 6883, 6823 |  | Linux 5 run(s) absent |
| `fs.disk.direct.stat` | ns | 10399, 12283, 10430, 10410 |  | Linux 5 run(s) absent |
| `fs.mem.direct.fstat` | ns | 7063, 8977, 8847, 8486 |  | Linux 5 run(s) absent |
| `fs.mem.direct.pread_4k` | ns | 8576, 10109, 9978, 10099 |  | Linux 5 run(s) absent |
| `fs.mem.direct.read_4k_at` | ns | 15479, 19106, 18816, 18395 |  | Linux 5 run(s) absent |
| `fs.mem.direct.seek` | ns | 6943, 8887, 8837, 8316 |  | Linux 5 run(s) absent |
| `fs.mem.direct.stat` | ns | 8115, 9988, 10119, 9588 |  | Linux 5 run(s) absent |
| `net.tcp.connect_accept_close` | ns |  | 76338, 77176, 76690, 49082, 48767 | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| `net.tcp.reqrep.64` | ns |  | 42325, 44490, 42535, 26641, 26001 | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| `net.tcp.stream.1` | MB/s |  | 0, 0, 0, 0, 0 | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| `net.tcp.stream.65536` | MB/s |  | 2320, 2312, 2336, 2897, 2976 | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| `net.udp.reqrep.64` | ns |  | 31918, 24236, 31989, 22592, 14058 | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| `nvme.read.1m.seq` |  |  |  | Linux 5 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 4 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| `nvme.read.4k.random` |  |  |  | Linux 5 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 4 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| `tail.diag.periodic.30s` | ns | 6113, 6092, 6128, 6156 |  | Linux 5 run(s) absent |
| `time.sleep_late.100us.slack1ns` | ns |  | 11189, 19012, 19012, 10351, 10433 | ToyOS 4 run(s) absent |
| `time.sleep_late.10ms.slack1ns` | ns |  | 96690, 66844, 314005, 289050, 297859 | ToyOS 4 run(s) absent |
| `time.sleep_late.10us.slack1ns` | ns |  | 11023, 18985, 19054, 10454, 10478 | ToyOS 4 run(s) absent |
| `time.sleep_late.1ms.slack1ns` | ns |  | 24370, 24515, 24312, 11191, 11652 | ToyOS 4 run(s) absent |
| `time.sleep_late.1us.slack1ns` | ns |  | 13388, 19394, 19114, 13497, 12615 | ToyOS 4 run(s) absent |
| `time.timer_1ms.late.slack1ns` | ns |  | 24287, 24250, 24325, 11126, 11601 | ToyOS 4 run(s) absent |
| `wake.periodic.idle.slack1ns` | ns |  | 23789, 20533, 20134, 10810, 11027 | ToyOS 4 run(s) absent |
| `wake.periodic.loaded.slack1ns` | ns |  | 9294, 9256, 9156, 4339, 4414 | ToyOS 4 run(s) absent |
