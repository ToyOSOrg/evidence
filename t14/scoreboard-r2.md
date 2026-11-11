## The T14

174 rows besides the clock gauges; 134 have a direction and both systems' values: behind 70, unresolved 5 (2 reading behind), at parity 7, ahead 52.

### Behind Linux, by hotness and then ratio

| hot | area | row | unit | ToyOS median (range) | Linux median (range) | ToyOS | p | verdict | record |
|---|---|---|---|---|---|---|---|---|---|
| 0 | spawn | `proc.spawn_wait.large` | ns | 8,072,387 (1.0%) | 54,731 (1.1%) | 147.49x | 0.016 | behind | spawning-a-process-costs-toyos-up-to-147-times-linuxs |
| 0 | spawn | `work.build_shaped.j8` | ns | 220,886,682 (2.5%) | 99,510,091 (1.7%) | 2.22x | 0.016 | behind | spawning-a-process-costs-toyos-up-to-147-times-linuxs |
| 0 | spawn | `proc.posix_spawn_wait.std` | ns | 387,182 (0.7%) | 178,366 (3.3%) | 2.17x | 0.016 | behind | spawning-a-process-costs-toyos-up-to-147-times-linuxs |
| 0 | spawn | `process.spawn_wait` | ns | 376,368 (1.3%) | 187,675 (2.2%) | 2.01x | 0.016 | behind | spawning-a-process-costs-toyos-up-to-147-times-linuxs |
| 0 | spawn | `proc.posix_spawn_wait.tiny` | ns | 78,475 (5.0%) | 43,904 (3.0%) | 1.79x | 0.016 | behind | spawning-a-process-costs-toyos-up-to-147-times-linuxs |
| 0 | spawn | `proc.spawn_wait_loop.100` | ns | 7,687,359 (10.5%) | 5,439,550 (2.7%) | 1.41x | 0.016 | behind | spawning-a-process-costs-toyos-up-to-147-times-linuxs |
| 0 | spawn | `proc.spawn_wait.tiny` | ns | 72,164 (7.3%) | 52,413 (2.1%) | 1.38x | 0.016 | behind | spawning-a-process-costs-toyos-up-to-147-times-linuxs |
| 1 | fs disk | `fs.disk.fstat` | ns | 9,532 (1.7%) | 215 (7.9%) | 44.33x | 0.008 | behind | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 1 | fs memory | `fs.mem.fstat` | ns | 7,560 (1.6%) | 213 (7.5%) | 35.49x | 0.008 | behind | a-memory-filesystem-call-costs-toyos-up-to-35-times-linuxs |
| 1 | fs disk | `fs.disk.write_4k_at` | ns | 22,421 (1.4%) | 721 (4.7%) | 31.10x | 0.016 | behind | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 1 | fs disk | `fs.disk.stat` | ns | 12,312 (21.5%) | 578 (1.4%) | 21.30x | 0.016 | behind | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 1 | fs disk | `fs.disk.open_close` | ns | 21,544 (1.2%) | 1,218 (2.3%) | 17.69x | 0.016 | behind | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 1 | fs memory | `fs.mem.stat` | ns | 9,490 (0.8%) | 578 (2.1%) | 16.42x | 0.016 | behind | a-memory-filesystem-call-costs-toyos-up-to-35-times-linuxs |
| 1 | fs memory | `fs.mem.write_4k_at` | ns | 9,033 (1.1%) | 617 (4.7%) | 14.64x | 0.016 | behind | a-memory-filesystem-call-costs-toyos-up-to-35-times-linuxs |
| 1 | fs memory | `fs.mem.open_close` | ns | 12,290 (17.1%) | 1,119 (1.3%) | 10.98x | 0.016 | behind | a-memory-filesystem-call-costs-toyos-up-to-35-times-linuxs |
| 1 | fs memory | `fs.mem.seq_write.4096` | MB/s | 438 (1.4%) | 3,605 (0.6%) | 8.23x | 0.016 | behind | a-memory-filesystem-call-costs-toyos-up-to-35-times-linuxs |
| 1 | fs disk | `fs.disk.seq_write.4096` | MB/s | 179 (1.7%) | 634 (2.8%) | 3.54x | 0.016 | behind | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 1 | sched/wake | `time.yield` | ps | 651,614 (0.5%) | 190,906 (2.1%) | 3.41x | 0.016 | behind | a-yield-costs-toyos-up-to-3-4-times-linuxs |
| 1 | fs memory | `fs.mem.seek` | ns | 248 (0.0%) | 116 (1.7%) | 2.14x | 0.016 | behind | a-memory-filesystem-call-costs-toyos-up-to-35-times-linuxs |
| 1 | fs disk | `fs.disk.seek` | ns | 246 (0.8%) | 117 (0.9%) | 2.10x | 0.008 | behind | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 1 | sched/wake | `pingpong.futex.same_cpu` | ns | 4,091 (1.0%) | 2,298 (3.4%) | 1.78x | 0.008 | behind | a-two-thread-ping-pong-costs-toyos-up-to-twice-linuxs-on-the-t14 |
| 1 | sched/wake | `wake.onto_busy` | ns | 4,444 (2.2%) | 2,553 (3.0%) | 1.74x | 0.016 | behind | a-wake-onto-a-busy-cpu-costs-toyos-1-8-times-linuxs |
| 1 | ipc | `ipc.reqrep.8` | ns | 5,973 (1.6%) | 3,492 (14.2%) | 1.71x | 0.016 | behind | a-small-message-round-trip-over-a-native-connection-costs-twice-linuxs-on-the-t14 |
| 1 | sched/wake | `pingpong.pipe.cross_core` | ns | 5,758 (2.0%) | 3,697 (10.8%) | 1.56x | 0.016 | behind | a-two-thread-ping-pong-costs-toyos-up-to-twice-linuxs-on-the-t14 |
| 1 | fs memory | `fs.mem.read_4k_at` | ns | 1,054 (3.0%) | 685 (10.7%) | 1.54x | 0.016 | behind | a-memory-filesystem-call-costs-toyos-up-to-35-times-linuxs |
| 1 | fs memory | `fs.mem.pread_8` | ns | 522 (1.9%) | 343 (3.5%) | 1.52x | 0.016 | behind | a-memory-filesystem-call-costs-toyos-up-to-35-times-linuxs |
| 1 | ipc | `pipe.throughput.256` | MB/s | 440 (7.0%) | 651 (4.5%) | 1.48x | 0.016 | behind | user-memory-hot-paths-are-slower-than-2-mib-pages |
| 1 | fs disk | `fs.disk.read_4k_at` | ns | 1,056 (4.9%) | 715 (8.0%) | 1.48x | 0.016 | behind | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 1 | syscall | `time.now` | ps | 21,005 (0.0%) | 14,283 (0.1%) | 1.47x | 0.016 | behind | a-clock-read-costs-toyos-half-again-linuxs-on-the-t14 |
| 1 | ipc | `pipe.throughput.64` | MB/s | 116 (3.4%) | 168 (0.6%) | 1.45x | 0.008 | behind | user-memory-hot-paths-are-slower-than-2-mib-pages |
| 1 | fs disk | `fs.disk.pread_8` | ns | 544 (21.3%) | 376 (1.3%) | 1.45x | 0.008 | behind | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 1 | fs memory | `fs.mem.seq_read.4096` | MB/s | 5,734 (0.9%) | 8,226 (5.3%) | 1.43x | 0.016 | behind | a-memory-filesystem-call-costs-toyos-up-to-35-times-linuxs |
| 1 | fs disk | `fs.disk.seq_read.4096` | MB/s | 5,402 (1.6%) | 7,694 (3.2%) | 1.42x | 0.016 | behind | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 1 | ipc | `ipc.reqrep.65536` | ns | 26,074 (2.3%) | 18,920 (3.9%) | 1.38x | 0.016 | behind | user-memory-hot-paths-are-slower-than-2-mib-pages |
| 1 | fs disk | `fs.disk.pread_4k` | ns | 784 (13.7%) | 587 (11.1%) | 1.34x | 0.016 | behind | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 1 | fs disk | `fs.disk.seq_read.1048576` | MB/s | 7,248 (2.5%) | 9,516 (6.7%) | 1.31x | 0.016 | behind | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 1 | fs memory | `fs.mem.pread_4k` | ns | 729 (5.1%) | 574 (8.4%) | 1.27x | 0.016 | behind | a-memory-filesystem-call-costs-toyos-up-to-35-times-linuxs |
| 1 | sched/wake | `wake.storm.drain.w64` | ns | 312,458 (4.0%) | 250,576 (11.2%) | 1.25x | 0.016 | behind | a-wake-storm-drains-up-to-a-quarter-slower-than-linuxs-on-the-t14 |
| 1 | fs memory | `fs.mem.seq_read.1048576` | MB/s | 7,298 (1.4%) | 9,046 (6.2%) | 1.24x | 0.016 | behind | a-memory-filesystem-call-costs-toyos-up-to-35-times-linuxs |
| 1 | fs memory | `fs.mem.seq_write.1048576` | MB/s | 4,008 (2.6%) | 4,576 (0.8%) | 1.14x | 0.016 | behind | a-memory-filesystem-call-costs-toyos-up-to-35-times-linuxs |
| 1 | sched/wake | `wake.storm.drain.w4` | ns | 138,134 (15.8%) | 126,715 (5.8%) | 1.09x | 0.016 | behind | a-wake-storm-drains-up-to-a-quarter-slower-than-linuxs-on-the-t14 |
| 1 | ipc | `pipe.throughput.1024` | MB/s | 1,637 (9.8%) | 1,767 (2.1%) | 1.08x | 0.016 | behind | user-memory-hot-paths-are-slower-than-2-mib-pages |
| 1 | memory | `mem.memcpy.4194304` | MB/s | 20,371 (1.3%) | 21,445 (7.8%) | 1.05x | 0.016 | behind | a-small-memcpy-on-the-amd-bench-runs-at-as-little-as-six-tenths-of-linuxs |
| 1 | memory | `mem.bw.copy` | MB/s | 6,652 (1.6%) | 6,951 (3.2%) | 1.04x | 0.016 | behind | user-memory-hot-paths-are-slower-than-2-mib-pages |
| 1 | memory | `mem.memcpy.67108864` | MB/s | 9,308 (1.4%) | 9,647 (0.7%) | 1.04x | 0.016 | behind | a-small-memcpy-on-the-amd-bench-runs-at-as-little-as-six-tenths-of-linuxs |
| 1 | memory | `mem.memcpy.16777216` | MB/s | 10,423 (3.2%) | 10,760 (3.2%) | 1.03x | 0.016 | behind | a-small-memcpy-on-the-amd-bench-runs-at-as-little-as-six-tenths-of-linuxs |
| 2 | fs disk | `fs.disk.tree.100` | ns | 19,970,802 (3.0%) | 1,349,906 (1.4%) | 14.79x | 0.016 | behind | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 2 | fs disk | `fs.disk.reopen_read_4k` | ns | 22,020 (0.8%) | 1,539 (2.0%) | 14.31x | 0.016 | behind | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 2 | fs disk | `fs.disk.rename` | ns | 43,831 (1.1%) | 3,595 (0.9%) | 12.19x | 0.016 | behind | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 2 | fs disk | `fs.disk.create_write_unlink` | ns | 120,629 (0.5%) | 11,249 (1.6%) | 10.72x | 0.016 | behind | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 2 | fs disk | `fs.disk.readdir.1000` | ns | 2,854,698 (2.0%) | 274,766 (0.9%) | 10.39x | 0.016 | behind | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 2 | fs memory | `fs.mem.mkdir_rmdir` | ns | 20,124 (1.4%) | 2,190 (1.6%) | 9.19x | 0.016 | behind | a-memory-filesystem-call-costs-toyos-up-to-35-times-linuxs |
| 2 | fs memory | `fs.mem.reopen_read_4k` | ns | 12,702 (1.2%) | 1,384 (1.2%) | 9.18x | 0.016 | behind | a-memory-filesystem-call-costs-toyos-up-to-35-times-linuxs |
| 2 | durable | `persist.create_fsync_unlink` | ns | 7,281,693 (7.3%) | 958,357 (11.1%) | 7.60x | 0.016 | behind | toyos-durable-writes-on-the-t14s-nvme-run-six-times-slower-in-some-boots |
| 2 | fs memory | `fs.mem.rename` | ns | 11,800 (2.1%) | 1,596 (1.8%) | 7.39x | 0.016 | behind | a-memory-filesystem-call-costs-toyos-up-to-35-times-linuxs |
| 2 | fs memory | `fs.mem.create_write_unlink` | ns | 30,518 (0.5%) | 4,651 (1.7%) | 6.56x | 0.016 | behind | a-memory-filesystem-call-costs-toyos-up-to-35-times-linuxs |
| 2 | durable | `persist.append_4k_fsync` | ns | 6,471,851 (12.3%) | 1,011,872 (15.7%) | 6.40x | 0.016 | behind | toyos-durable-writes-on-the-t14s-nvme-run-six-times-slower-in-some-boots |
| 2 | durable | `persist.write_4k_fsync` | ns | 6,352,402 (13.5%) | 1,033,439 (20.1%) | 6.15x | 0.016 | behind | toyos-durable-writes-on-the-t14s-nvme-run-six-times-slower-in-some-boots |
| 2 | durable | `persist.write_4k_fsync_beside_1m` | ns | 7,598,251 (11.8%) | 1,258,302 (23.6%) | 6.04x | 0.016 | behind | toyos-durable-writes-on-the-t14s-nvme-run-six-times-slower-in-some-boots |
| 2 | fs memory | `fs.mem.tree.100` | ns | 3,357,680 (1.6%) | 559,607 (0.8%) | 6.00x | 0.016 | behind | a-memory-filesystem-call-costs-toyos-up-to-35-times-linuxs |
| 2 | fs disk | `fs.disk.mkdir_rmdir` | ns | 77,662 (0.3%) | 14,672 (0.6%) | 5.29x | 0.016 | behind | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 2 | durable | `persist.seq_write_fsync` | MB/s | 182 (18.7%) | 590 (3.9%) | 3.24x | 0.016 | behind | toyos-durable-writes-on-the-t14s-nvme-run-six-times-slower-in-some-boots |
| 2 | fs memory | `fs.mem.readdir.1000` | ns | 528,170 (0.1%) | 181,512 (2.6%) | 2.91x | 0.016 | behind | a-memory-filesystem-call-costs-toyos-up-to-35-times-linuxs |
| 2 | memory | `mem.munmap_touched_remote.4k` | ns | 3,341 (0.1%) | 2,279 (0.8%) | 1.47x | 0.016 | behind | a-tlb-shootdown-reaches-only-the-cpus-that-ran-the-space |
| 2 | durable | `persist.seq_read_cached` | MB/s | 7,862 (4.8%) | 11,256 (14.3%) | 1.43x | 0.016 | behind | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 2 | fs memory | `fs.mem.read_4k` | ns | 762 (7.2%) | 551 (5.3%) | 1.38x | 0.016 | behind | a-memory-filesystem-call-costs-toyos-up-to-35-times-linuxs |
| 2 | memory | `mem.map_unmap_4k` | ns | 2,072 (0.4%) | 1,609 (2.1%) | 1.29x | 0.016 | behind | user-memory-hot-paths-are-slower-than-2-mib-pages |
| 2 | fs disk | `fs.disk.read_4k` | ns | 753 (2.9%) | 601 (15.5%) | 1.25x | 0.016 | behind | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call |
| 2 | memory | `mem.munmap_part.4k` | ns | 1,406 (2.4%) | 1,254 (0.7%) | 1.12x | 0.016 | behind | a-tlb-shootdown-reaches-only-the-cpus-that-ran-the-space |
| 3 | sched/wake | `fair.shared.total` | chunks/s | 2,369,620 (0.1%) | 2,391,673 (0.0%) | 1.01x | 0.016 | behind | all-cpu-throughput-in-one-group-reads-under-linuxs |

### Unresolved and reading behind by more than 1.10

| hot | area | row | unit | ToyOS median (range) | Linux median (range) | ToyOS | p | verdict | record |
|---|---|---|---|---|---|---|---|---|---|
| 1 | sched/wake | `pingpong.pipe.same_cpu` | ns | 4,957 (0.8%) | 3,774 (109.1%) | 1.31x | 0.730 | unresolved | a-two-thread-ping-pong-costs-toyos-up-to-twice-linuxs-on-the-t14 |
| 1 | memory | `mem.anon.map` | ns/MiB | 94 (4.3%) | 85 (27.1%) | 1.11x | 0.294 | unresolved | user-memory-hot-paths-are-slower-than-2-mib-pages |

### Every judged row

| hot | area | row | unit | ToyOS median (range) | Linux median (range) | ToyOS | p | verdict |
|---|---|---|---|---|---|---|---|---|
| 3 | cpu | `crunch.single.deflate` | ns | 54,509,639 (0.1%) | 54,720,412 (0.2%) | 1.00x faster | 0.016 | ahead |
| 3 | cpu | `crunch.single.matmul` | ns | 1,056,944 (0.0%) | 1,009,088 (8.1%) | 1.05x | 0.190 | at parity |
| 3 | cpu | `crunch.single.parse` | ns | 35,203,750 (1.9%) | 67,478,300 (14.9%) | 1.92x faster | 0.016 | ahead |
| 3 | cpu | `crunch.single.sha256` | ns | 555,356 (0.0%) | 567,657 (0.1%) | 1.02x faster | 0.016 | ahead |
| 2 | cpu | `work.compress_inproc` | ns | 358,628,063 (0.1%) | 361,777,338 (0.3%) | 1.01x faster | 0.016 | ahead |
| 2 | durable | `persist.append_4k_fsync` | ns | 6,471,851 (12.3%) | 1,011,872 (15.7%) | 6.40x | 0.016 | behind |
| 2 | durable | `persist.create_fsync_unlink` | ns | 7,281,693 (7.3%) | 958,357 (11.1%) | 7.60x | 0.016 | behind |
| 2 | durable | `persist.fsync_clean` | ns | 7,500 (2.7%) | 23,020 (1.2%) | 3.07x faster | 0.016 | ahead |
| 2 | durable | `persist.seq_read_cached` | MB/s | 7,862 (4.8%) | 11,256 (14.3%) | 1.43x | 0.016 | behind |
| 2 | durable | `persist.seq_write_fsync` | MB/s | 182 (18.7%) | 590 (3.9%) | 3.24x | 0.016 | behind |
| 2 | durable | `persist.write_4k_fsync` | ns | 6,352,402 (13.5%) | 1,033,439 (20.1%) | 6.15x | 0.016 | behind |
| 2 | durable | `persist.write_4k_fsync_beside_1m` | ns | 7,598,251 (11.8%) | 1,258,302 (23.6%) | 6.04x | 0.016 | behind |
| 2 | fs disk | `fs.disk.create_write_unlink` | ns | 120,629 (0.5%) | 11,249 (1.6%) | 10.72x | 0.016 | behind |
| 1 | fs disk | `fs.disk.fstat` | ns | 9,532 (1.7%) | 215 (7.9%) | 44.33x | 0.008 | behind |
| 2 | fs disk | `fs.disk.mkdir_rmdir` | ns | 77,662 (0.3%) | 14,672 (0.6%) | 5.29x | 0.016 | behind |
| 1 | fs disk | `fs.disk.open_close` | ns | 21,544 (1.2%) | 1,218 (2.3%) | 17.69x | 0.016 | behind |
| 1 | fs disk | `fs.disk.pread_4k` | ns | 784 (13.7%) | 587 (11.1%) | 1.34x | 0.016 | behind |
| 1 | fs disk | `fs.disk.pread_8` | ns | 544 (21.3%) | 376 (1.3%) | 1.45x | 0.008 | behind |
| 2 | fs disk | `fs.disk.read_4k` | ns | 753 (2.9%) | 601 (15.5%) | 1.25x | 0.016 | behind |
| 1 | fs disk | `fs.disk.read_4k_at` | ns | 1,056 (4.9%) | 715 (8.0%) | 1.48x | 0.016 | behind |
| 2 | fs disk | `fs.disk.readdir.1000` | ns | 2,854,698 (2.0%) | 274,766 (0.9%) | 10.39x | 0.016 | behind |
| 2 | fs disk | `fs.disk.rename` | ns | 43,831 (1.1%) | 3,595 (0.9%) | 12.19x | 0.016 | behind |
| 2 | fs disk | `fs.disk.reopen_read_4k` | ns | 22,020 (0.8%) | 1,539 (2.0%) | 14.31x | 0.016 | behind |
| 1 | fs disk | `fs.disk.seek` | ns | 246 (0.8%) | 117 (0.9%) | 2.10x | 0.008 | behind |
| 1 | fs disk | `fs.disk.seq_read.1048576` | MB/s | 7,248 (2.5%) | 9,516 (6.7%) | 1.31x | 0.016 | behind |
| 1 | fs disk | `fs.disk.seq_read.4096` | MB/s | 5,402 (1.6%) | 7,694 (3.2%) | 1.42x | 0.016 | behind |
| 1 | fs disk | `fs.disk.seq_write.1048576` | MB/s | 504 (3.0%) | 347 (1.7%) | 1.45x faster | 0.008 | ahead |
| 1 | fs disk | `fs.disk.seq_write.4096` | MB/s | 179 (1.7%) | 634 (2.8%) | 3.54x | 0.016 | behind |
| 1 | fs disk | `fs.disk.stat` | ns | 12,312 (21.5%) | 578 (1.4%) | 21.30x | 0.016 | behind |
| 2 | fs disk | `fs.disk.tree.100` | ns | 19,970,802 (3.0%) | 1,349,906 (1.4%) | 14.79x | 0.016 | behind |
| 1 | fs disk | `fs.disk.write_4k_at` | ns | 22,421 (1.4%) | 721 (4.7%) | 31.10x | 0.016 | behind |
| 2 | fs memory | `fs.mem.create_write_unlink` | ns | 30,518 (0.5%) | 4,651 (1.7%) | 6.56x | 0.016 | behind |
| 1 | fs memory | `fs.mem.fstat` | ns | 7,560 (1.6%) | 213 (7.5%) | 35.49x | 0.008 | behind |
| 2 | fs memory | `fs.mem.mkdir_rmdir` | ns | 20,124 (1.4%) | 2,190 (1.6%) | 9.19x | 0.016 | behind |
| 1 | fs memory | `fs.mem.open_close` | ns | 12,290 (17.1%) | 1,119 (1.3%) | 10.98x | 0.016 | behind |
| 1 | fs memory | `fs.mem.pread_4k` | ns | 729 (5.1%) | 574 (8.4%) | 1.27x | 0.016 | behind |
| 1 | fs memory | `fs.mem.pread_8` | ns | 522 (1.9%) | 343 (3.5%) | 1.52x | 0.016 | behind |
| 2 | fs memory | `fs.mem.read_4k` | ns | 762 (7.2%) | 551 (5.3%) | 1.38x | 0.016 | behind |
| 1 | fs memory | `fs.mem.read_4k_at` | ns | 1,054 (3.0%) | 685 (10.7%) | 1.54x | 0.016 | behind |
| 2 | fs memory | `fs.mem.readdir.1000` | ns | 528,170 (0.1%) | 181,512 (2.6%) | 2.91x | 0.016 | behind |
| 2 | fs memory | `fs.mem.rename` | ns | 11,800 (2.1%) | 1,596 (1.8%) | 7.39x | 0.016 | behind |
| 2 | fs memory | `fs.mem.reopen_read_4k` | ns | 12,702 (1.2%) | 1,384 (1.2%) | 9.18x | 0.016 | behind |
| 1 | fs memory | `fs.mem.seek` | ns | 248 (0.0%) | 116 (1.7%) | 2.14x | 0.016 | behind |
| 1 | fs memory | `fs.mem.seq_read.1048576` | MB/s | 7,298 (1.4%) | 9,046 (6.2%) | 1.24x | 0.016 | behind |
| 1 | fs memory | `fs.mem.seq_read.4096` | MB/s | 5,734 (0.9%) | 8,226 (5.3%) | 1.43x | 0.016 | behind |
| 1 | fs memory | `fs.mem.seq_write.1048576` | MB/s | 4,008 (2.6%) | 4,576 (0.8%) | 1.14x | 0.016 | behind |
| 1 | fs memory | `fs.mem.seq_write.4096` | MB/s | 438 (1.4%) | 3,605 (0.6%) | 8.23x | 0.016 | behind |
| 1 | fs memory | `fs.mem.stat` | ns | 9,490 (0.8%) | 578 (2.1%) | 16.42x | 0.016 | behind |
| 2 | fs memory | `fs.mem.tree.100` | ns | 3,357,680 (1.6%) | 559,607 (0.8%) | 6.00x | 0.016 | behind |
| 1 | fs memory | `fs.mem.write_4k_at` | ns | 9,033 (1.1%) | 617 (4.7%) | 14.64x | 0.016 | behind |
| 1 | ipc | `ipc.connect_accept` | ns | 2,326 (0.9%) | 3,828 (1.1%) | 1.65x faster | 0.016 | ahead |
| 1 | ipc | `ipc.reqrep.4096` | ns | 6,574 (20.8%) | 7,184 (1.5%) | 1.09x faster | 0.905 | at parity |
| 1 | ipc | `ipc.reqrep.65536` | ns | 26,074 (2.3%) | 18,920 (3.9%) | 1.38x | 0.016 | behind |
| 1 | ipc | `ipc.reqrep.8` | ns | 5,973 (1.6%) | 3,492 (14.2%) | 1.71x | 0.016 | behind |
| 1 | ipc | `ipc.reqrep_handle.8` | ns | 6,403 (1.7%) | 7,248 (3.0%) | 1.13x faster | 0.016 | ahead |
| 1 | ipc | `pipe.throughput.1024` | MB/s | 1,637 (9.8%) | 1,767 (2.1%) | 1.08x | 0.016 | behind |
| 1 | ipc | `pipe.throughput.16384` | MB/s | 12,540 (5.4%) | 3,877 (2.1%) | 3.23x faster | 0.016 | ahead |
| 1 | ipc | `pipe.throughput.256` | MB/s | 440 (7.0%) | 651 (4.5%) | 1.48x | 0.016 | behind |
| 1 | ipc | `pipe.throughput.4096` | MB/s | 4,848 (7.9%) | 4,167 (1.7%) | 1.16x faster | 0.016 | ahead |
| 1 | ipc | `pipe.throughput.64` | MB/s | 116 (3.4%) | 168 (0.6%) | 1.45x | 0.008 | behind |
| 1 | ipc | `pipe.throughput.65536` | MB/s | 17,600 (2.7%) | 4,120 (8.3%) | 4.27x faster | 0.016 | ahead |
| 1 | memory | `mem.anon.map` | ns/MiB | 94 (4.3%) | 85 (27.1%) | 1.11x | 0.294 | unresolved |
| 1 | memory | `mem.anon.total` | ns/MiB | 80,894 (2.5%) | 258,932 (0.7%) | 3.20x faster | 0.016 | ahead |
| 1 | memory | `mem.anon.touch` | ns/MiB | 75,153 (2.4%) | 236,051 (0.9%) | 3.14x faster | 0.016 | ahead |
| 1 | memory | `mem.anon.unmap` | ns/MiB | 3,738 (3.7%) | 22,599 (9.2%) | 6.05x faster | 0.016 | ahead |
| 1 | memory | `mem.bw.copy` | MB/s | 6,652 (1.6%) | 6,951 (3.2%) | 1.04x | 0.016 | behind |
| 1 | memory | `mem.bw.read` | MB/s | 17,446 (3.7%) | 17,900 (5.6%) | 1.03x | 0.413 | at parity |
| 1 | memory | `mem.bw.write` | MB/s | 9,329 (3.8%) | 9,353 (2.2%) | 1.00x | 0.905 | at parity |
| 1 | memory | `mem.first_touch.2m` | ns/MiB | 78,274 (4.8%) | 100,272 (0.3%) | 1.28x faster | 0.016 | ahead |
| 1 | memory | `mem.first_touch.4k` | ns/MiB | 84,170 (4.2%) | 236,835 (0.4%) | 2.81x faster | 0.016 | ahead |
| 1 | memory | `mem.malloc_churn.1048576.t1` | kops/s | 193 (0.0%) | 184 (26.6%) | 1.05x faster | 0.667 | at parity |
| 1 | memory | `mem.malloc_churn.1048576.t8` | kops/s | 102 (2.0%) | 89 (73.0%) | 1.15x faster | 0.667 | unresolved |
| 1 | memory | `mem.malloc_churn.16.t1` | kops/s | 36,463 (0.9%) | 32,877 (0.5%) | 1.11x faster | 0.016 | ahead |
| 1 | memory | `mem.malloc_churn.16.t8` | kops/s | 4,796 (4.0%) | 2,527 (24.5%) | 1.90x faster | 0.016 | ahead |
| 1 | memory | `mem.malloc_churn.4096.t1` | kops/s | 31,002 (0.6%) | 21,587 (0.7%) | 1.44x faster | 0.016 | ahead |
| 1 | memory | `mem.malloc_churn.4096.t8` | kops/s | 3,186 (3.6%) | 900 (131.4%) | 3.54x faster | 0.016 | ahead |
| 1 | memory | `mem.map_touch_unmap.2m` | ns/MiB | 84,342 (2.5%) | 102,038 (0.3%) | 1.21x faster | 0.016 | ahead |
| 1 | memory | `mem.map_touch_unmap.4k` | ns/MiB | 88,839 (1.5%) | 258,226 (0.4%) | 2.91x faster | 0.016 | ahead |
| 2 | memory | `mem.map_unmap_4k` | ns | 2,072 (0.4%) | 1,609 (2.1%) | 1.29x | 0.016 | behind |
| 1 | memory | `mem.memcpy.1024` | MB/s | 82,894 (4.0%) | 70,434 (21.0%) | 1.18x faster | 0.016 | ahead |
| 1 | memory | `mem.memcpy.1048576` | MB/s | 25,585 (6.2%) | 25,552 (9.7%) | 1.00x faster | 0.905 | at parity |
| 1 | memory | `mem.memcpy.16384` | MB/s | 185,546 (2.6%) | 197,542 (18.3%) | 1.06x | 0.063 | at parity |
| 1 | memory | `mem.memcpy.16777216` | MB/s | 10,423 (3.2%) | 10,760 (3.2%) | 1.03x | 0.016 | behind |
| 1 | memory | `mem.memcpy.256` | MB/s | 28,580 (5.2%) | 25,033 (1.1%) | 1.14x faster | 0.016 | ahead |
| 1 | memory | `mem.memcpy.262144` | MB/s | 55,741 (0.0%) | 55,594 (0.1%) | 1.00x faster | 0.016 | ahead |
| 1 | memory | `mem.memcpy.4096` | MB/s | 165,024 (0.0%) | 158,167 (4.9%) | 1.04x faster | 0.016 | ahead |
| 1 | memory | `mem.memcpy.4194304` | MB/s | 20,371 (1.3%) | 21,445 (7.8%) | 1.05x | 0.016 | behind |
| 1 | memory | `mem.memcpy.64` | MB/s | 18,864 (6.7%) | 6,262 (0.5%) | 3.01x faster | 0.016 | ahead |
| 1 | memory | `mem.memcpy.65536` | MB/s | 55,434 (0.0%) | 55,001 (0.4%) | 1.01x faster | 0.016 | ahead |
| 1 | memory | `mem.memcpy.67108864` | MB/s | 9,308 (1.4%) | 9,647 (0.7%) | 1.04x | 0.016 | behind |
| 2 | memory | `mem.mprotect.4k` | ns | 816 (25.9%) | 1,019 (0.8%) | 1.25x faster | 0.016 | ahead |
| 2 | memory | `mem.munmap_part.4k` | ns | 1,406 (2.4%) | 1,254 (0.7%) | 1.12x | 0.016 | behind |
| 2 | memory | `mem.munmap_touched_remote.4k` | ns | 3,341 (0.1%) | 2,279 (0.8%) | 1.47x | 0.016 | behind |
| 2 | memory | `mem.realloc_grow.1m_256m` | ns | 46,342 (6.6%) | 112,350 (23.1%) | 2.42x faster | 0.016 | ahead |
| 2 | memory | `mem.realloc_grow.last_128m_256m` | ns | 13,144 (16.2%) | 25,316 (20.9%) | 1.93x faster | 0.016 | ahead |
| 3 | sched/wake | `fair.apart.total` | chunks/s | 2,359,728 (0.3%) | 1,653,127 (44.8%) | 1.43x faster | 0.730 | unresolved |
| 3 | sched/wake | `fair.shared.total` | chunks/s | 2,369,620 (0.1%) | 2,391,673 (0.0%) | 1.01x | 0.016 | behind |
| 1 | sched/wake | `pingpong.futex.cross_core` | ns | 257 (1682.1%) | 3,346 (1.5%) | 13.02x faster | 0.254 | unresolved |
| 1 | sched/wake | `pingpong.futex.same_cpu` | ns | 4,091 (1.0%) | 2,298 (3.4%) | 1.78x | 0.008 | behind |
| 1 | sched/wake | `pingpong.pipe.cross_core` | ns | 5,758 (2.0%) | 3,697 (10.8%) | 1.56x | 0.016 | behind |
| 1 | sched/wake | `pingpong.pipe.same_cpu` | ns | 4,957 (0.8%) | 3,774 (109.1%) | 1.31x | 0.730 | unresolved |
| 3 | sched/wake | `tail.stolen.10s` | ns | 28,078 (6.8%) | 33,091 (32.0%) | 1.18x faster | 0.032 | ahead |
| 3 | sched/wake | `tail.wake.periodic.60s` | ns | 20,591 (0.6%) | 67,756 (20.9%) | 3.29x faster | 0.016 | ahead |
| 3 | sched/wake | `time.sleep_late.100us` | ns | 5,210 (7.0%) | 51,850 (0.1%) | 9.95x faster | 0.016 | ahead |
| 3 | sched/wake | `time.sleep_late.10ms` | ns | 31,318 (2.5%) | 218,198 (4.9%) | 6.97x faster | 0.016 | ahead |
| 3 | sched/wake | `time.sleep_late.10us` | ns | 1,434 (6.1%) | 51,819 (0.0%) | 36.14x faster | 0.016 | ahead |
| 3 | sched/wake | `time.sleep_late.1ms` | ns | 25,639 (48.5%) | 72,340 (2.2%) | 2.82x faster | 0.016 | ahead |
| 3 | sched/wake | `time.sleep_late.1us` | ns | 1,501 (4.4%) | 51,814 (1.3%) | 34.52x faster | 0.016 | ahead |
| 3 | sched/wake | `time.timer_1ms.late` | ns | 14,155 (1.0%) | 70,302 (31.1%) | 4.97x faster | 0.016 | ahead |
| 1 | sched/wake | `time.yield` | ps | 651,614 (0.5%) | 190,906 (2.1%) | 3.41x | 0.016 | behind |
| 1 | sched/wake | `wake.onto_busy` | ns | 4,444 (2.2%) | 2,553 (3.0%) | 1.74x | 0.016 | behind |
| 1 | sched/wake | `wake.periodic.idle` | ns | 20,806 (1.0%) | 67,862 (21.2%) | 3.26x faster | 0.016 | ahead |
| 1 | sched/wake | `wake.periodic.loaded` | ns | 3,624 (0.6%) | 52,374 (0.2%) | 14.45x faster | 0.016 | ahead |
| 1 | sched/wake | `wake.storm.call.w1` | ns | 1,301 (28.7%) | 3,984 (67.9%) | 3.06x faster | 0.016 | ahead |
| 1 | sched/wake | `wake.storm.call.w16` | ns | 14,032 (7.4%) | 60,662 (10.6%) | 4.32x faster | 0.016 | ahead |
| 1 | sched/wake | `wake.storm.call.w4` | ns | 9,292 (10.2%) | 11,131 (18.9%) | 1.20x faster | 0.016 | ahead |
| 1 | sched/wake | `wake.storm.call.w64` | ns | 22,601 (6.8%) | 230,202 (45.7%) | 10.19x faster | 0.016 | ahead |
| 1 | sched/wake | `wake.storm.drain.w1` | ns | 22,424 (4.0%) | 26,037 (78.1%) | 1.16x faster | 0.016 | ahead |
| 1 | sched/wake | `wake.storm.drain.w16` | ns | 174,599 (4.2%) | 849,489 (86.3%) | 4.87x faster | 0.016 | ahead |
| 1 | sched/wake | `wake.storm.drain.w4` | ns | 138,134 (15.8%) | 126,715 (5.8%) | 1.09x | 0.016 | behind |
| 1 | sched/wake | `wake.storm.drain.w64` | ns | 312,458 (4.0%) | 250,576 (11.2%) | 1.25x | 0.016 | behind |
| 0 | spawn | `proc.posix_spawn_wait.std` | ns | 387,182 (0.7%) | 178,366 (3.3%) | 2.17x | 0.016 | behind |
| 0 | spawn | `proc.posix_spawn_wait.tiny` | ns | 78,475 (5.0%) | 43,904 (3.0%) | 1.79x | 0.016 | behind |
| 0 | spawn | `proc.spawn_wait.large` | ns | 8,072,387 (1.0%) | 54,731 (1.1%) | 147.49x | 0.016 | behind |
| 0 | spawn | `proc.spawn_wait.tiny` | ns | 72,164 (7.3%) | 52,413 (2.1%) | 1.38x | 0.016 | behind |
| 0 | spawn | `proc.spawn_wait_loop.100` | ns | 7,687,359 (10.5%) | 5,439,550 (2.7%) | 1.41x | 0.016 | behind |
| 0 | spawn | `process.spawn_wait` | ns | 376,368 (1.3%) | 187,675 (2.2%) | 2.01x | 0.016 | behind |
| 2 | spawn | `thread.spawn_join` | ns | 22,800 (9.7%) | 25,183 (3.2%) | 1.10x faster | 0.016 | ahead |
| 2 | spawn | `thread.spawn_join.default` | ns | 20,519 (11.2%) | 25,145 (0.5%) | 1.23x faster | 0.016 | ahead |
| 2 | spawn | `thread.spawn_join.stack64k` | ns | 21,230 (9.5%) | 23,558 (0.8%) | 1.11x faster | 0.016 | ahead |
| 0 | spawn | `work.build_shaped.j1` | ns | 690,704,458 (1.4%) | 1,013,128,216 (7.5%) | 1.47x faster | 0.016 | ahead |
| 0 | spawn | `work.build_shaped.j8` | ns | 220,886,682 (2.5%) | 99,510,091 (1.7%) | 2.22x | 0.016 | behind |
| 1 | syscall | `syscall.null` | ps | 68,414 (5.4%) | 91,766 (0.2%) | 1.34x faster | 0.016 | ahead |
| 1 | syscall | `time.now` | ps | 21,005 (0.0%) | 14,283 (0.1%) | 1.47x | 0.016 | behind |

### Rows with no verdict

| row | unit | ToyOS | Linux | compare says |
|---|---|---|---|---|
| `crunch.all.deflate` | ns |  | 89636804, 183638799, 179750293, 180680964, 89575550 | the clock did not settle in 3 of 5 Linux run(s); ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| `crunch.all.matmul` | ns |  | 2224957, 5143758, 5164659, 5200738, 2232998 | the clock did not settle in 3 of 5 Linux run(s); ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| `crunch.all.parse` | ns |  | 2754561498, 2780492845, 2761384153 | Linux 2 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| `crunch.all.sha256` | ns |  | 991110, 1978056, 1973499, 1979778, 991174 | the clock did not settle in 3 of 5 Linux run(s); ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| `fair.apart.build` | permille | 125, 126, 125, 126 | 124, 125, 124, 125, 124 | not resolved |
| `fair.apart.helpers` | permille | 429, 427, 430, 427 | 422, 422, 417, 415, 426 | ToyOS higher |
| `fair.apart.threaded` | permille | 443, 446, 443, 446 | 451, 451, 457, 458, 449 | ToyOS lower |
| `fair.session.build` | permille |  | 56, 61, 64, 65, 61 | ToyOS 4 run(s) absent |
| `fair.session.helpers` | permille |  | 458, 443, 445, 448, 449 | ToyOS 4 run(s) absent |
| `fair.session.threaded` | permille |  | 484, 495, 488, 488, 490 | ToyOS 4 run(s) absent |
| `fair.session.total` | chunks/s |  | 2391256, 1682506, 1677706, 1683526, 2391813 | ToyOS 4 run(s) absent |
| `fair.shared.build` | permille | 55, 59, 59, 57 | 62, 61, 63, 59, 57 | not resolved |
| `fair.shared.helpers` | permille | 465, 477, 464, 465 | 444, 445, 452, 442, 450 | ToyOS higher |
| `fair.shared.threaded` | permille | 477, 465, 476, 480 | 488, 489, 484, 496, 490 | ToyOS lower |
| `fs.disk.direct.fstat` | ns | 9961, 9214, 9077, 9704 |  | Linux 5 run(s) absent |
| `fs.disk.direct.pread_4k` | ns | 8355, 8425, 8354, 8497 |  | Linux 5 run(s) absent |
| `fs.disk.direct.read_4k_at` | ns | 15575, 15652, 15758, 15582 |  | Linux 5 run(s) absent |
| `fs.disk.direct.seek` | ns | 7037, 7150, 7049, 7127 |  | Linux 5 run(s) absent |
| `fs.disk.direct.stat` | ns | 10921, 11147, 10976, 11087 |  | Linux 5 run(s) absent |
| `fs.mem.direct.fstat` | ns | 7183, 7271, 7261, 7326 |  | Linux 5 run(s) absent |
| `fs.mem.direct.pread_4k` | ns | 8401, 8427, 7976, 8510 |  | Linux 5 run(s) absent |
| `fs.mem.direct.read_4k_at` | ns | 15567, 15580, 15602, 15585 |  | Linux 5 run(s) absent |
| `fs.mem.direct.seek` | ns | 7080, 7090, 7077, 7137 |  | Linux 5 run(s) absent |
| `fs.mem.direct.stat` | ns | 8244, 8355, 8325, 8299 |  | Linux 5 run(s) absent |
| `net.tcp.connect_accept_close` | ns |  | 20878, 20990, 20933, 20976, 21499 | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| `net.tcp.reqrep.64` | ns |  | 8909, 8718, 9058, 8911, 8950 | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| `net.tcp.stream.1` | MB/s |  | 1, 1, 1, 1, 1 | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| `net.tcp.stream.65536` | MB/s |  | 6779, 6934, 6789, 6635, 6825 | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| `net.udp.reqrep.64` | ns |  | 7311, 7275, 7470, 7343, 7225 | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| `nvme.read.1m.seq` |  |  |  | Linux 5 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 4 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| `nvme.read.4k.random` |  |  |  | Linux 5 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 4 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| `tail.diag.periodic.30s` | ns | 20548, 20604, 20720, 20619 |  | Linux 5 run(s) absent |
| `time.sleep_late.100us.slack1ns` | ns |  | 1809, 1831, 1827, 1827, 1821 | ToyOS 4 run(s) absent |
| `time.sleep_late.10ms.slack1ns` | ns |  | 161768, 169373, 163553, 165609, 163215 | ToyOS 4 run(s) absent |
| `time.sleep_late.10us.slack1ns` | ns |  | 1804, 1818, 5430, 1820, 1825 | ToyOS 4 run(s) absent |
| `time.sleep_late.1ms.slack1ns` | ns |  | 20400, 20517, 20362, 20419, 20307 | ToyOS 4 run(s) absent |
| `time.sleep_late.1us.slack1ns` | ns |  | 3982, 4357, 4239, 3919, 1597 | ToyOS 4 run(s) absent |
| `time.timer_1ms.late.slack1ns` | ns |  | 20281, 20368, 20087, 5519, 20077 | ToyOS 4 run(s) absent |
| `wake.periodic.idle.slack1ns` | ns |  | 17684, 19433, 17667, 17559, 17600 | ToyOS 4 run(s) absent |
| `wake.periodic.loaded.slack1ns` | ns |  | 2355, 2379, 2449, 2366, 2373 | ToyOS 4 run(s) absent |
