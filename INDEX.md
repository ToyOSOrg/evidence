# ToyOS against Linux, current state, 2026-10-28

Labelled current-state comparison: ToyOS at 069cbbeb8 (#1097, code-identical to its landing head) against each bench's Ubuntu 24.04 (Linux 6.8.0-147) as installed. Per bench: 4 ToyOS benchcase boots off the internal NVMe and 5 Linux `osbench all` runs, interleaved L T L | T L | T L | T L, every ToyOS readback judged EXIT=0. A row's value is each run's p50; the exact two-sided Mann-Whitney test at 0.05 over 5 against 4 runs (least p 2/126) says whether it resolves. Each p is its row's alone: about 1.6% of rows resolve by chance with no difference anywhere. The full tables are `t14-compare.md` and `amd-compare.md`.

Caveats that bear on reading it:
- The AMD's Linux chose `clocksource=tsc` in 3 runs and `hpet` in 2, as booted. Each HPET timestamp costs 1.2 µs, so its per-operation rows have wide Linux spreads. Their medians are the TSC runs'.
- Linux runs its distribution's governor (T14 `powersave`, the same HWP request ToyOS makes; AMD `schedutil`). This is the baseline, not the matched-request experiment.
- `persist` and `fs.disk` run on each system's filesystem on the same NVMe (ext4 against ToyOS DATA).


## T14 (i5-1135G7, SK hynix BC501)

158 rows besides `cpu.clock`. 123 have a direction and both systems' values. ToyOS resolves **worse in 56** and **better in 35**. It reads worse but unresolved in 13.


### Every row where ToyOS loses, by area and size

| area | row | unit | ToyOS p50 (range) | Linux p50 (range) | ToyOS worse by | resolves | owning record | agent |
|---|---|---|---|---|---|---|---|---|
| cpu | `crunch.single.matmul` | ns | 1,071,098 (0.3%) | 1,008,660 (16.2%) | 1.06x | no | toyos-uses-what-modern-hardware-offers-for-speed | power |
| scheduler | `pingpong.futex.same_cpu` | ns | 4,580 (10.1%) | 2,279 (4.4%) | 2.01x | yes | unrecorded | sched-place |
| scheduler | `pingpong.pipe.cross_core` | ns | 6,802 (7.1%) | 3,712 (6.0%) | 1.83x | yes | unrecorded (no-published-run lists the row only) | sched-place / ipc-events |
| scheduler | `wake.onto_busy` | ns | 3,892 (0.3%) | 2,260 (10.5%) | 1.72x | yes | an-ordinary-wake-posted-on-its-own-cpu-waits-for-that-cpus-next-pass | sched-place |
| scheduler | `pingpong.pipe.same_cpu` | ns | 6,186 (1.3%) | 4,504 (54.4%) | 1.37x | yes | unrecorded (no-published-run lists the row only) | sched-place / ipc-events |
| scheduler | `pingpong.futex.cross_core` | ns | 4,574 (2.5%) | 3,341 (0.9%) | 1.37x | yes | unrecorded | sched-place |
| scheduler | `wake.storm.drain.w4` | ns | 126,784 (12.5%) | 122,472 (9.6%) | 1.04x | no | unrecorded | sched-place |
| scheduler | `fair.shared.total` | chunks/s | 2,368,989 (0.2%) | 2,392,280 (2.7%) | 1.01x | no | unrecorded | sched-place |
| process/thread | `proc.spawn_wait.large` | ns | 202,300 (13.0%) | 54,906 (3.0%) | 3.68x | yes | unrecorded: spawn and thread creation | NONE |
| process/thread | `proc.posix_spawn_wait.std` | ns | 451,798 (1.7%) | 169,630 (2.1%) | 2.66x | yes | unrecorded: spawn and thread creation | NONE |
| process/thread | `process.spawn_wait` | ns | 452,918 (4.7%) | 179,133 (6.0%) | 2.53x | yes | unrecorded: spawn and thread creation | NONE |
| process/thread | `work.build_shaped.j8` | ns | 166,245,528 (2.4%) | 99,148,404 (1.2%) | 1.68x | yes | idle-cpus-enter-the-c-states-cst-names (names j1 only); otherwise unrecorded | NONE |
| process/thread | `proc.posix_spawn_wait.tiny` | ns | 55,722 (10.1%) | 43,698 (2.4%) | 1.28x | yes | unrecorded: spawn and thread creation | NONE |
| process/thread | `thread.spawn_join.stack64k` | ns | 28,562 (0.9%) | 23,441 (1.1%) | 1.22x | yes | unrecorded: spawn and thread creation | NONE |
| process/thread | `thread.spawn_join.default` | ns | 28,312 (0.4%) | 25,126 (2.1%) | 1.13x | yes | unrecorded: spawn and thread creation | NONE |
| process/thread | `thread.spawn_join` | ns | 28,144 (1.0%) | 25,040 (2.6%) | 1.12x | yes | unrecorded: spawn and thread creation | NONE |
| process/thread | `proc.spawn_wait_loop.100` | ns | 5,753,880 (9.2%) | 5,414,470 (1.6%) | 1.06x | no | unrecorded: spawn and thread creation | NONE |
| process/thread | `proc.spawn_wait.tiny` | ns | 52,548 (19.8%) | 52,094 (1.2%) | 1.01x | no | unrecorded: spawn and thread creation | NONE |
| memory | `mem.map_unmap_4k` | ns | 3,214 (1.2%) | 1,598 (2.6%) | 2.01x | yes | user-memory-hot-paths-are-slower-than-2-mib-pages | NONE (memory) |
| memory | `mem.munmap_touched_remote.4k` | ns | 3,028 (1.6%) | 2,290 (1.5%) | 1.32x | yes | unrecorded (no-published-run lists the row only) | NONE (memory) |
| memory | `mem.map_touch_unmap.2m` | ns/MiB | 129,457 (1.1%) | 101,980 (2.4%) | 1.27x | no | user-memory-hot-paths-are-slower-than-2-mib-pages | NONE (memory) |
| memory | `mem.first_touch.2m` | ns/MiB | 123,828 (0.6%) | 100,239 (2.4%) | 1.24x | no | user-memory-hot-paths-are-slower-than-2-mib-pages | NONE (memory) |
| memory | `mem.munmap_part.4k` | ns | 1,558 (1.3%) | 1,280 (0.9%) | 1.22x | yes | unrecorded | NONE (memory) |
| memory | `mem.anon.map` | ns/MiB | 116 (13.0%) | 106 (34.0%) | 1.09x | no | user-memory-hot-paths-are-slower-than-2-mib-pages | NONE (memory) |
| memory | `mem.memcpy.16384` | MB/s | 185,364 (0.3%) | 201,387 (17.9%) | 1.09x | yes | unrecorded | NONE (memory) |
| memory | `mem.memcpy.1048576` | MB/s | 25,462 (10.5%) | 26,835 (11.2%) | 1.05x | no | unrecorded | NONE (memory) |
| memory | `mem.bw.copy` | MB/s | 6,651 (0.2%) | 6,992 (0.7%) | 1.05x | yes | unrecorded | NONE (memory) |
| memory | `mem.memcpy.16777216` | MB/s | 10,394 (0.7%) | 10,869 (4.8%) | 1.05x | no | unrecorded | NONE (memory) |
| memory | `mem.memcpy.67108864` | MB/s | 9,257 (0.6%) | 9,677 (1.2%) | 1.05x | yes | unrecorded | NONE (memory) |
| memory | `mem.memcpy.4194304` | MB/s | 20,930 (9.4%) | 21,348 (12.0%) | 1.02x | no | unrecorded | NONE (memory) |
| memory | `mem.bw.read` | MB/s | 17,381 (5.7%) | 17,692 (4.4%) | 1.02x | no | unrecorded | NONE (memory) |
| ipc | `ipc.reqrep.8` | ns | 7,184 (1.9%) | 3,515 (22.1%) | 2.04x | yes | unrecorded: small-message round trip | ipc-events |
| ipc | `pipe.throughput.64` | MB/s | 88 (1.1%) | 167 (2.4%) | 1.90x | yes | user-memory-hot-paths-are-slower-than-2-mib-pages (the copies) | ipc-events |
| ipc | `ipc.reqrep.65536` | ns | 35,662 (0.5%) | 18,839 (2.1%) | 1.89x | yes | user-memory-hot-paths-are-slower-than-2-mib-pages (the copies) | ipc-events |
| ipc | `pipe.throughput.256` | MB/s | 344 (8.1%) | 639 (2.7%) | 1.86x | yes | user-memory-hot-paths-are-slower-than-2-mib-pages (the copies) | ipc-events |
| ipc | `pipe.throughput.1024` | MB/s | 1,272 (7.6%) | 1,796 (5.5%) | 1.41x | yes | user-memory-hot-paths-are-slower-than-2-mib-pages (the copies) | ipc-events |
| ipc | `pipe.throughput.4096` | MB/s | 3,080 (5.3%) | 4,151 (3.3%) | 1.35x | yes | user-memory-hot-paths-are-slower-than-2-mib-pages (the copies) | ipc-events |
| ipc | `ipc.reqrep_handle.8` | ns | 8,789 (2.5%) | 7,260 (3.7%) | 1.21x | yes | unrecorded: small-message round trip | ipc-events |
| ipc | `ipc.reqrep.4096` | ns | 8,680 (1.2%) | 7,178 (1.5%) | 1.21x | yes | user-memory-hot-paths-are-slower-than-2-mib-pages (the copies) | ipc-events |
| clock | `time.now` | ps | 19,816 (0.0%) | 14,295 (0.1%) | 1.39x | no | unrecorded: a clock-page read costs more than the vDSO's | clock |
| disk | `persist.fsync_clean` | ns | 536,781 (550.3%) | 23,012 (0.3%) | 23.33x | yes | a-clean-fsync-on-data-writes-the-superblock-and-flushes-the-disk (#1097) | disk-path |
| disk | `persist.create_fsync_unlink` | ns | 3,142,905 (188.6%) | 966,415 (4.2%) | 3.25x | yes | a-created-fsynced-and-unlinked-file-costs-toyos-more-than-linux (#1097) | disk-path |
| disk | `persist.seq_write_fsync` | MB/s | 239 (82.8%) | 579 (19.7%) | 2.42x | yes | toyos-durable-writes-on-the-t14s-nvme-took-1-to-6-ms-across-two-boots (#1097; the T14's slow boots) | disk-path |
| disk | `persist.seq_read_cached` | MB/s | 6,547 (13.7%) | 10,088 (12.1%) | 1.54x | yes | unrecorded: the file server's read copy | disk-path / fs-rtt |
| disk | `persist.write_4k_fsync` | ns | 1,090,501 (510.9%) | 1,011,579 (4.6%) | 1.08x | yes | toyos-durable-writes-on-the-t14s-nvme-took-1-to-6-ms-across-two-boots (#1097; the T14's slow boots) | disk-path |
| fs | `fs.disk.write_4k_at` | ns | 18,388 (17.0%) | 725 (3.0%) | 25.36x | yes | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call (#1097) | fs-rtt |
| fs | `fs.disk.read_4k_at` | ns | 18,292 (17.6%) | 724 (6.9%) | 25.27x | yes | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call (#1097) | fs-rtt |
| fs | `fs.disk.rename` | ns | 87,883 (15.4%) | 3,630 (0.6%) | 24.21x | yes | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call (#1097) | fs-rtt |
| fs | `fs.disk.open_close` | ns | 25,551 (19.5%) | 1,205 (6.3%) | 21.20x | yes | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call (#1097) | fs-rtt |
| fs | `fs.disk.stat` | ns | 11,413 (18.0%) | 583 (1.9%) | 19.58x | yes | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call (#1097) | fs-rtt |
| fs | `fs.disk.seq_read.4096` | MB/s | 427 (21.3%) | 7,730 (0.9%) | 18.10x | yes | a-sequential-read-of-a-file-as-large-as-datas-clean-cache-reads-the-disk (#1097) | fs-rtt |
| fs | `fs.disk.create_write_unlink` | ns | 144,504 (24.8%) | 11,294 (1.9%) | 12.79x | yes | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call (#1097) | fs-rtt |
| fs | `fs.disk.tree.100` | ns | 14,856,644 (6.4%) | 1,346,121 (1.0%) | 11.04x | yes | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call (#1097) | fs-rtt |
| fs | `fs.disk.mkdir_rmdir` | ns | 100,006 (27.2%) | 15,123 (3.8%) | 6.61x | yes | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call (#1097) | fs-rtt |
| fs | `fs.mem.open_close` | ns | 7,291 (7.7%) | 1,114 (8.1%) | 6.54x | yes | unrecorded: kernel tmpfs per-call cost | NONE (kernel tmpfs) |
| fs | `fs.mem.readdir.1000` | ns | 1,142,049 (0.1%) | 177,389 (1.0%) | 6.44x | yes | a-listing-still-scans-the-whole-mount | NONE (kernel tmpfs) |
| fs | `fs.mem.stat` | ns | 3,115 (5.3%) | 584 (2.6%) | 5.33x | yes | unrecorded: kernel tmpfs per-call cost | NONE (kernel tmpfs) |
| fs | `fs.disk.seq_write.4096` | MB/s | 138 (8.7%) | 631 (6.8%) | 4.57x | yes | unrecorded: the file server's write copy | fs-rtt |
| fs | `fs.mem.rename` | ns | 7,374 (6.3%) | 1,624 (2.3%) | 4.54x | yes | unrecorded: kernel tmpfs per-call cost | NONE (kernel tmpfs) |
| fs | `fs.mem.mkdir_rmdir` | ns | 9,011 (9.1%) | 2,213 (1.5%) | 4.07x | yes | unrecorded: kernel tmpfs per-call cost | NONE (kernel tmpfs) |
| fs | `fs.disk.readdir.1000` | ns | 904,319 (11.2%) | 275,372 (1.2%) | 3.28x | yes | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call (#1097) | fs-rtt |
| fs | `fs.mem.tree.100` | ns | 1,505,195 (4.1%) | 548,925 (1.1%) | 2.74x | yes | unrecorded: kernel tmpfs per-call cost | NONE (kernel tmpfs) |
| fs | `fs.mem.create_write_unlink` | ns | 12,832 (4.7%) | 4,715 (2.1%) | 2.72x | yes | unrecorded: kernel tmpfs per-call cost | NONE (kernel tmpfs) |
| fs | `fs.mem.write_4k_at` | ns | 1,237 (4.0%) | 625 (5.0%) | 1.98x | yes | unrecorded: kernel tmpfs per-call cost | NONE (kernel tmpfs) |
| fs | `fs.mem.seq_read.4096` | MB/s | 4,704 (0.5%) | 8,230 (1.5%) | 1.75x | yes | user-memory-hot-paths-are-slower-than-2-mib-pages (as fs.tmp.*) | NONE (kernel user copy) |
| fs | `fs.mem.read_4k_at` | ns | 1,222 (2.3%) | 710 (4.5%) | 1.72x | yes | unrecorded: kernel tmpfs per-call cost | NONE (kernel tmpfs) |
| fs | `fs.disk.seq_read.1048576` | MB/s | 6,914 (13.2%) | 9,307 (2.3%) | 1.35x | yes | a-sequential-read-of-a-file-as-large-as-datas-clean-cache-reads-the-disk (#1097) | fs-rtt |
| fs | `fs.mem.seq_read.1048576` | MB/s | 7,144 (0.9%) | 9,603 (1.6%) | 1.34x | yes | user-memory-hot-paths-are-slower-than-2-mib-pages (as fs.tmp.*) | NONE (kernel user copy) |
| fs | `fs.mem.seq_write.4096` | MB/s | 3,152 (1.0%) | 3,614 (0.2%) | 1.15x | yes | user-memory-hot-paths-are-slower-than-2-mib-pages (as fs.tmp.*) | NONE (kernel user copy) |

### Where ToyOS resolves better

`time.sleep_late.10us` (44.68x), `time.sleep_late.1us` (37.42x), `wake.periodic.loaded` (17.31x), `time.sleep_late.100us` (11.82x), `wake.storm.call.w64` (11.15x), `time.sleep_late.10ms` (7.78x), `time.timer_1ms.late` (5.52x), `wake.storm.drain.w16` (4.33x), `wake.storm.call.w16` (4.10x), `wake.periodic.idle` (3.80x), `tail.wake.periodic.60s` (3.80x), `time.sleep_late.1ms` (3.32x), `wake.storm.call.w1` (3.20x), `mem.memcpy.64` (2.97x), `mem.realloc_grow.1m_256m` (2.54x), `mem.realloc_grow.last_128m_256m` (2.22x), `crunch.single.parse` (1.97x), `pipe.throughput.65536` (1.86x), `work.build_shaped.j1` (1.44x), `wake.storm.drain.w1` (1.42x), `pipe.throughput.16384` (1.25x), `wake.storm.call.w4` (1.24x), `ipc.connect_accept` (1.24x), `mem.memcpy.256` (1.19x), `mem.memcpy.1024` (1.08x), `mem.mprotect.4k` (1.07x), `mem.memcpy.4096` (1.04x), `mem.bw.write` (1.02x), `work.compress_inproc` (1.01x), `crunch.single.deflate` (1.01x), `mem.memcpy.65536` (1.01x), `mem.memcpy.262144` (1.00x), `crunch.single.sha256` (1.00x), `cpu.chunk@sched` (1.00x), `cpu.chunk@system` (1.00x)


## AMD bench (Ryzen 7 4800U, Samsung MZVLB1T0)

158 rows besides `cpu.clock`. 123 have a direction and both systems' values. ToyOS resolves **worse in 30** and **better in 53**. It reads worse but unresolved in 10.


### Every row where ToyOS loses, by area and size

| area | row | unit | ToyOS p50 (range) | Linux p50 (range) | ToyOS worse by | resolves | owning record | agent |
|---|---|---|---|---|---|---|---|---|
| cpu | `crunch.single.matmul` | ns | 944,960 (3.3%) | 918,648 (1.6%) | 1.03x | yes | toyos-uses-what-modern-hardware-offers-for-speed | power |
| scheduler | `wake.onto_busy` | ns | 15,354 (4.3%) | 8,042 (60.2%) | 1.91x | yes | an-ordinary-wake-posted-on-its-own-cpu-waits-for-that-cpus-next-pass | sched-place |
| scheduler | `fair.shared.total` | chunks/s | 4,034,121 (0.6%) | 5,056,352 (37.2%) | 1.25x | no | unrecorded | sched-place |
| process/thread | `work.build_shaped.j16` | ns | 270,675,582 (1.0%) | 116,739,823 (13.4%) | 2.32x | yes | idle-cpus-enter-the-c-states-cst-names (names j1 only); otherwise unrecorded | NONE |
| process/thread | `proc.posix_spawn_wait.std` | ns | 504,838 (6.8%) | 327,668 (158.1%) | 1.54x | no | unrecorded: spawn and thread creation | NONE |
| memory | `mem.memcpy.64` | MB/s | 3,942 (0.7%) | 6,492 (1.7%) | 1.65x | yes | unrecorded | NONE (memory) |
| memory | `mem.memcpy.262144` | MB/s | 25,696 (45.1%) | 36,472 (3.4%) | 1.42x | yes | unrecorded | NONE (memory) |
| memory | `mem.memcpy.256` | MB/s | 14,493 (0.7%) | 16,158 (1.7%) | 1.11x | yes | unrecorded | NONE (memory) |
| memory | `mem.memcpy.1048576` | MB/s | 11,156 (5.5%) | 11,698 (1.9%) | 1.05x | yes | unrecorded | NONE (memory) |
| memory | `mem.memcpy.67108864` | MB/s | 6,140 (0.5%) | 6,302 (4.5%) | 1.03x | no | unrecorded | NONE (memory) |
| memory | `mem.bw.copy` | MB/s | 8,352 (0.6%) | 8,550 (2.1%) | 1.02x | yes | unrecorded | NONE (memory) |
| memory | `mem.bw.read` | MB/s | 19,520 (1.8%) | 19,814 (2.8%) | 1.02x | no | unrecorded | NONE (memory) |
| memory | `mem.memcpy.16777216` | MB/s | 6,142 (1.4%) | 6,215 (2.8%) | 1.01x | yes | unrecorded | NONE (memory) |
| ipc | `pipe.throughput.4096` | MB/s | 2,073 (2.1%) | 5,705 (14.5%) | 2.75x | yes | user-memory-hot-paths-are-slower-than-2-mib-pages (the copies) | ipc-events |
| ipc | `pipe.throughput.256` | MB/s | 196 (7.2%) | 427 (11.7%) | 2.18x | yes | user-memory-hot-paths-are-slower-than-2-mib-pages (the copies) | ipc-events |
| disk | `persist.fsync_clean` | ns | 1,247,117 (3.0%) | 65,764 (7.0%) | 18.96x | yes | a-clean-fsync-on-data-writes-the-superblock-and-flushes-the-disk (#1097) | disk-path |
| disk | `persist.seq_read_cached` | MB/s | 2,916 (21.4%) | 6,652 (67.4%) | 2.28x | yes | unrecorded: the file server's read copy | disk-path / fs-rtt |
| disk | `persist.seq_write_fsync` | MB/s | 332 (11.4%) | 524 (6.9%) | 1.58x | yes | toyos-durable-writes-on-the-t14s-nvme-took-1-to-6-ms-across-two-boots (#1097; the T14's slow boots) | disk-path |
| disk | `persist.create_fsync_unlink` | ns | 3,368,200 (13.8%) | 3,257,728 (6.0%) | 1.03x | no | a-created-fsynced-and-unlinked-file-costs-toyos-more-than-linux (#1097) | disk-path |
| fs | `fs.disk.seq_read.4096` | MB/s | 157 (7.6%) | 5,084 (2.9%) | 32.38x | yes | a-sequential-read-of-a-file-as-large-as-datas-clean-cache-reads-the-disk (#1097) | fs-rtt |
| fs | `fs.disk.read_4k_at` | ns | 18,616 (18.7%) | 1,483 (66.2%) | 12.55x | yes | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call (#1097) | fs-rtt |
| fs | `fs.disk.write_4k_at` | ns | 19,372 (19.1%) | 2,114 (41.6%) | 9.16x | yes | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call (#1097) | fs-rtt |
| fs | `fs.disk.stat` | ns | 11,458 (17.4%) | 1,462 (97.1%) | 7.84x | yes | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call (#1097) | fs-rtt |
| fs | `fs.disk.rename` | ns | 66,939 (23.9%) | 9,347 (17.3%) | 7.16x | yes | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call (#1097) | fs-rtt |
| fs | `fs.disk.open_close` | ns | 20,264 (22.1%) | 3,046 (44.8%) | 6.65x | yes | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call (#1097) | fs-rtt |
| fs | `fs.disk.create_write_unlink` | ns | 125,858 (11.3%) | 27,371 (6.5%) | 4.60x | yes | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call (#1097) | fs-rtt |
| fs | `fs.mem.readdir.1000` | ns | 1,063,838 (0.8%) | 275,085 (2.7%) | 3.87x | yes | a-listing-still-scans-the-whole-mount | NONE (kernel tmpfs) |
| fs | `fs.disk.tree.100` | ns | 12,159,319 (22.8%) | 3,417,999 (1.9%) | 3.56x | yes | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call (#1097) | fs-rtt |
| fs | `fs.disk.seq_write.4096` | MB/s | 226 (13.7%) | 724 (11.9%) | 3.20x | yes | unrecorded: the file server's write copy | fs-rtt |
| fs | `fs.disk.seq_write.1048576` | MB/s | 346 (11.0%) | 798 (5.3%) | 2.31x | yes | unrecorded: the file server's write copy | fs-rtt |
| fs | `fs.disk.mkdir_rmdir` | ns | 81,432 (16.7%) | 37,047 (4.8%) | 2.20x | yes | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call (#1097) | fs-rtt |
| fs | `fs.mem.open_close` | ns | 6,157 (0.8%) | 2,946 (48.4%) | 2.09x | yes | unrecorded: kernel tmpfs per-call cost | NONE (kernel tmpfs) |
| fs | `fs.disk.seq_read.1048576` | MB/s | 6,167 (26.1%) | 11,448 (2.8%) | 1.86x | yes | a-sequential-read-of-a-file-as-large-as-datas-clean-cache-reads-the-disk (#1097) | fs-rtt |
| fs | `fs.mem.stat` | ns | 2,616 (1.1%) | 1,513 (90.7%) | 1.73x | no | unrecorded: kernel tmpfs per-call cost | NONE (kernel tmpfs) |
| fs | `fs.disk.readdir.1000` | ns | 680,286 (1.0%) | 436,573 (3.3%) | 1.56x | yes | a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call (#1097) | fs-rtt |
| fs | `fs.mem.rename` | ns | 6,282 (1.1%) | 4,538 (35.7%) | 1.38x | yes | unrecorded: kernel tmpfs per-call cost | NONE (kernel tmpfs) |
| fs | `fs.mem.mkdir_rmdir` | ns | 7,705 (3.1%) | 6,702 (23.3%) | 1.15x | no | unrecorded: kernel tmpfs per-call cost | NONE (kernel tmpfs) |
| fs | `fs.mem.seq_read.1048576` | MB/s | 8,031 (11.0%) | 8,412 (3.2%) | 1.05x | no | user-memory-hot-paths-are-slower-than-2-mib-pages (as fs.tmp.*) | NONE (kernel user copy) |
| fs | `fs.mem.seq_read.4096` | MB/s | 5,323 (2.5%) | 5,466 (4.5%) | 1.03x | no | user-memory-hot-paths-are-slower-than-2-mib-pages (as fs.tmp.*) | NONE (kernel user copy) |
| fs | `fs.mem.read_4k_at` | ns | 1,422 (3.5%) | 1,403 (70.8%) | 1.01x | no | unrecorded: kernel tmpfs per-call cost | NONE (kernel tmpfs) |

### Where ToyOS resolves better

`time.sleep_late.10us` (41.82x), `time.sleep_late.1us` (36.48x), `time.sleep_late.1ms` (15.42x), `wake.periodic.loaded` (14.71x), `time.sleep_late.100us` (12.15x), `tail.wake.periodic.60s` (11.55x), `wake.storm.call.w64` (10.05x), `mem.realloc_grow.last_128m_256m` (7.28x), `time.sleep_late.10ms` (6.49x), `proc.spawn_wait_loop.100` (4.94x), `ipc.connect_accept` (4.11x), `proc.spawn_wait.tiny` (3.82x), `mem.realloc_grow.1m_256m` (3.82x), `wake.storm.call.w16` (3.11x), `wake.storm.drain.w64` (2.82x), `mem.munmap_part.4k` (2.73x), `pingpong.pipe.cross_core` (2.61x), `mem.mprotect.4k` (2.60x), `ipc.reqrep_handle.8` (2.37x), `fs.mem.seq_write.1048576` (2.23x), `fs.mem.seq_write.4096` (2.16x), `wake.storm.drain.w16` (2.03x), `ipc.reqrep.4096` (1.93x), `pipe.throughput.65536` (1.90x), `wake.periodic.idle` (1.85x), `pipe.throughput.16384` (1.79x), `thread.spawn_join` (1.77x), `mem.map_unmap_4k` (1.76x), `pingpong.futex.cross_core` (1.74x), `work.build_shaped.j1` (1.67x), `thread.spawn_join.default` (1.64x), `thread.spawn_join.stack64k` (1.63x), `proc.spawn_wait.large` (1.61x), `mem.munmap_touched_remote.4k` (1.58x), `time.timer_1ms.late` (1.52x), `tail.stolen.10s` (1.46x), `pingpong.pipe.same_cpu` (1.37x), `persist.write_4k_fsync` (1.36x), `persist.append_4k_fsync` (1.30x), `wake.storm.drain.w1` (1.29x), `pingpong.futex.same_cpu` (1.25x), `proc.posix_spawn_wait.tiny` (1.24x), `wake.storm.drain.w4` (1.23x), `pipe.throughput.64` (1.21x), `fs.mem.create_write_unlink` (1.18x), `fs.mem.write_4k_at` (1.17x), `pipe.throughput.1024` (1.15x), `mem.memcpy.1024` (1.06x), `fs.mem.tree.100` (1.05x), `work.compress_inproc` (1.05x), `mem.memcpy.4096` (1.04x), `mem.bw.write` (1.03x), `mem.memcpy.16384` (1.02x)


## Rows ToyOS cannot measure

**t14**: 16 rows.
- unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destinatio (5): `net.tcp.connect_accept_close`, `net.tcp.reqrep.64`, `net.tcp.stream.1`, `net.tcp.stream.65536`, `net.udp.reqrep.64`
- unmeasured: no_package_temperature_to_stop_the_all-core_phase_at (4): `crunch.all.deflate`, `crunch.all.matmul`, `crunch.all.parse`, `crunch.all.sha256`
- unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_min (2): `nvme.read.1m.seq`, `nvme.read.4k.random`
- unsupported: no_counter_carries_the_package's_energy:_toyos_abi::counters::Counter_has_non (1): `energy.idle_60s.package`
- unsupported: the_kernel_names_its_idle_states_to_no_program (1): `identity.cpuidle`
- unsupported: the_NVMe_driver_keeps_its_controller's_identity_and_no_right_reads_it_from_an (1): `identity.nvme`
- unsupported: usbd_keeps_its_devices_and_no_right_reads_them_from_another_program (1): `identity.usb`
- unsupported: no_yield_syscall:_std's_yield_now_is_a_spin-loop_hint (1): `time.yield`

**amd**: 16 rows.
- unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destinatio (5): `net.tcp.connect_accept_close`, `net.tcp.reqrep.64`, `net.tcp.stream.1`, `net.tcp.stream.65536`, `net.udp.reqrep.64`
- unmeasured: no_package_temperature_to_stop_the_all-core_phase_at (4): `crunch.all.deflate`, `crunch.all.matmul`, `crunch.all.parse`, `crunch.all.sha256`
- unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_min (2): `nvme.read.1m.seq`, `nvme.read.4k.random`
- unsupported: no_counter_carries_the_package's_energy:_toyos_abi::counters::Counter_has_non (1): `energy.idle_60s.package`
- unsupported: the_kernel_names_its_idle_states_to_no_program (1): `identity.cpuidle`
- unsupported: the_NVMe_driver_keeps_its_controller's_identity_and_no_right_reads_it_from_an (1): `identity.nvme`
- unsupported: usbd_keeps_its_devices_and_no_right_reads_them_from_another_program (1): `identity.usb`
- unsupported: no_yield_syscall:_std's_yield_now_is_a_spin-loop_hint (1): `time.yield`

## The T14's durable writes: which boot was the outlier

Neither boot was a lone outlier: the slow mode recurs. ToyOS's `persist` rows across the T14's five boots of #1097's storage code:

| boot | `fsync_clean` | `write_4k_fsync` | `append_4k_fsync` | `create_fsync_unlink` | `seq_write_fsync` |
|---|---|---|---|---|---|
| c8f3fbfb0 (2026-10-28 16:08) | 3.02 ms | 6.13 ms | 6.18 ms | 6.87 ms | 162 MB/s |
| 069cbbeb8 validation (16:47) | 0.46 ms | 1.10 ms | 1.01 ms | 1.17 ms | 347 MB/s |
| scoreboard r2 (17:31) | 3.42 ms | 6.65 ms | 6.85 ms | 5.05 ms | 149 MB/s |
| scoreboard r3 (17:39) | 0.50 ms | 1.08 ms | 1.04 ms | **7.10 ms** | 167 MB/s |
| scoreboard r4 (17:48) | 0.58 ms | 1.08 ms | 1.09 ms | 1.23 ms | 311 MB/s |

Linux's are 0.81 to 1.20 ms for the durable writes in every run. Two of five boots ran slow throughout `persist`, and a third (r3) turned slow partway, between `append_4k_fsync` and `create_fsync_unlink`. The boot logs' NVMe and DATA lines do not tell the slow boots apart. The cause is unknown. `issues/toyos-durable-writes-on-the-t14s-nvme-run-six-times-slower-in-some-boots.md` (PR #1097, 61baeec07) carries this table.


## Files

- `t14/`, `amd/`: per bench, `toyos-1..4/kernel.log` and `judge.log` (the 069cbbeb8 validation's boot, then the scoreboard's r2 to r4), `linux-1..5/run.txt` (the validation's two runs, then r2 to r4's), and `compare.md`, `osbench-compare` over all nine (exit 0).
- `method/`: the scratch scripts that turned `compare.md` into this table (`analyse.py`, then `final.py`), evidence only. Ratios count `ns`, `ps`, `ns/MiB` and `ns/page` as lower-better, and `MB/s`, `kops/s` and `chunks/s` as higher-better. Owning records are assigned by hand from what each record names.
- Masking: usernames and home paths, partition GUIDs, MAC and IPv4 addresses, and the shell's trace lines are removed. Before the push the published tree was scanned for each of those and for hostnames; none remain.
