## amd: ToyOS against Linux

Linux: the median of three runs' p50 at f644cefae; its run-to-run spread is (max - min) / median of the three p50s. ToyOS: one boot at f644cefae, its p50. Within-run spread is (p90 - p50) / p50 of a run (Linux: of the median run). Ratio is ToyOS / Linux; "ToyOS ahead" reads the unit: lower is better for times and energy, higher for rates.

| group | bench | unit | Linux median p50 | Linux run spread | Linux within-run | ToyOS p50 | ToyOS within-run | ToyOS / Linux | ToyOS ahead |
|---|---|---|---|---|---|---|---|---|---|
| fair | cpu.chunk | ns | 8987 | 0.0% | 0% | 2925 | 0% | 0.33 | yes |
| system | syscall.null | ps | 156369 | 0.1% | 0% | 127195 | 3% | 0.81 | yes |
| system | thread.spawn_join | ns | 65404 | 39.6% | 18% | 43945 | 49% | 0.67 | yes |
| system | process.spawn_wait | ns | 273968 | 171.0% | 21% | 13065259 | 6% | 47.69 | no |
| system | pipe.throughput.64 | MB/s | 115 | 11.3% | - | 72 | - | 0.63 | no |
| system | pipe.throughput.256 | MB/s | 427 | 7.5% | - | 188 | - | 0.44 | no |
| system | pipe.throughput.1024 | MB/s | 1690 | 19.1% | - | 1203 | - | 0.71 | no |
| system | pipe.throughput.4096 | MB/s | 6469 | 12.1% | - | 1854 | - | 0.29 | no |
| system | pipe.throughput.16384 | MB/s | 3580 | 1.4% | - | 6072 | - | 1.70 | yes |
| system | pipe.throughput.65536 | MB/s | 2282 | 72.6% | - | 4649 | - | 2.04 | yes |
| system | mem.anon.map | ns/MiB | 293 | 4.1% | 4% | 338 | 5% | 1.15 | no |
| system | mem.anon.touch | ns/MiB | 452822 | 1.7% | 0% | 180583 | 1% | 0.40 | yes |
| system | mem.anon.unmap | ns/MiB | 81485 | 6.8% | 3% | 5442 | 53% | 0.07 | yes |
| system | mem.anon.total | ns/MiB | 535127 | 0.9% | 0% | 187590 | 1% | 0.35 | yes |
| system | mem.map_unmap_4k | ns | 4007 | 2.0% | 12% | 1894 | 2% | 0.47 | yes |
| system | mem.bw.read | MB/s | 19534 | 1.5% | - | 19501 | - | 1.00 | no |
| system | mem.bw.write | MB/s | 9513 | 1.2% | - | 9691 | - | 1.02 | yes |
| system | mem.bw.copy | MB/s | 8481 | 0.7% | - | 8230 | - | 0.97 | no |
| sched | wake.periodic.idle | ns | 60745 | 0.1% | 2% | 37740 | 5% | 0.62 | yes |
| sched | wake.periodic.loaded | ns | 54295 | 0.5% | 1% | 4493 | 18% | 0.08 | yes |
| sched | wake.onto_busy | ns | 5400 | 4.6% | 78% | 17504 | 62% | 3.24 | no |
| sched | wake.storm.call.w1 | ns | 7694 | 62.8% | 36% | 3556 | 0% | 0.46 | yes |
| sched | wake.storm.drain.w1 | ns | 77106 | 42.6% | 38% | 41410 | 0% | 0.54 | yes |
| sched | wake.storm.call.w4 | ns | 11852 | 36.8% | 29% | 3267 | 46% | 0.28 | yes |
| sched | wake.storm.drain.w4 | ns | 77607 | 218.8% | 37% | 316922 | 80% | 4.08 | no |
| sched | wake.storm.call.w16 | ns | 52389 | 8.9% | 40% | 11452 | 35% | 0.22 | yes |
| sched | wake.storm.drain.w16 | ns | 112844 | 84.4% | 75% | 361417 | 88% | 3.20 | no |
| sched | wake.storm.call.w64 | ns | 236347 | 5.1% | 19% | 9218 | 150% | 0.04 | yes |
| sched | wake.storm.drain.w64 | ns | 697500 | 176.2% | 319% | 607602 | 62% | 0.87 | yes |
| sched | pingpong.pipe.same_cpu | ns | 7584 | 2.9% | 3% | 8326 | 2% | 1.10 | no |
| sched | pingpong.futex.same_cpu | ns | 6102 | 3.3% | 1% | 301 | 17% | 0.05 | yes |
| sched | pingpong.pipe.cross_core | ns | 11221 | 72.9% | 9% | 11392 | 12% | 1.02 | no |
| sched | pingpong.futex.cross_core | ns | 9758 | 0.3% | 1% | 5861 | 1% | 0.60 | yes |
| ipc | ipc.reqrep.8 | ns | 17293 | 24.0% | 33% | 9298 | 3% | 0.54 | yes |
| ipc | ipc.reqrep.4096 | ns | 17092 | 32.9% | 1% | 11202 | 4% | 0.66 | yes |
| ipc | ipc.reqrep.65536 | ns | 31209 | 9.8% | 60% | 45498 | 5% | 1.46 | no |
| ipc | ipc.reqrep_handle.8 | ns | 14287 | 16.7% | 44% | 11081 | 2% | 0.78 | yes |
| ipc | ipc.connect_accept | ns | 10941 | 0.3% | 4% | 3186 | 3% | 0.29 | yes |
| procs | proc.spawn_wait.tiny | ns | 254312 | 1.7% | 21% | 83231 | 36% | 0.33 | yes |
| procs | proc.spawn_wait.large | ns | 272676 | 58.5% | 8% | 216167 | 33% | 0.79 | yes |
| procs | proc.spawn_wait_loop.100 | ns | 32029533 | 64.3% | 1% | 6973941 | 3% | 0.22 | yes |
| procs | proc.posix_spawn_wait.tiny | ns | 122052 | 100.7% | 108% | 80836 | 54% | 0.66 | yes |
| procs | proc.posix_spawn_wait.std | ns | 288506 | 167.4% | 60% | 12418020 | 15% | 43.04 | no |
| procs | thread.spawn_join.default | ns | 69291 | 18.9% | 76% | 42963 | 50% | 0.62 | yes |
| procs | thread.spawn_join.stack64k | ns | 44714 | 45.5% | 43% | 42111 | 61% | 0.94 | yes |
| mem | mem.memcpy.64 | MB/s | 6569 | 0.5% | 0% | 3987 | 0% | 0.61 | no |
| mem | mem.memcpy.256 | MB/s | 16336 | 0.1% | 0% | 14656 | 0% | 0.90 | no |
| mem | mem.memcpy.1024 | MB/s | 41421 | 0.5% | 1% | 44265 | 0% | 1.07 | yes |
| mem | mem.memcpy.4096 | MB/s | 86507 | 0.5% | 0% | 89555 | 0% | 1.04 | yes |
| mem | mem.memcpy.16384 | MB/s | 74107 | 1.7% | 0% | 116501 | 0% | 1.57 | yes |
| mem | mem.memcpy.65536 | MB/s | 66492 | 0.4% | 1% | 67114 | 0% | 1.01 | yes |
| mem | mem.memcpy.262144 | MB/s | 35185 | 3.1% | 1% | 23877 | 2% | 0.68 | no |
| mem | mem.memcpy.1048576 | MB/s | 11454 | 0.2% | 0% | 11543 | 1% | 1.01 | yes |
| mem | mem.memcpy.4194304 | MB/s | 10793 | 1.4% | 1% | 10989 | 0% | 1.02 | yes |
| mem | mem.memcpy.16777216 | MB/s | 6113 | 3.8% | 0% | 6191 | 0% | 1.01 | yes |
| mem | mem.memcpy.67108864 | MB/s | 6253 | 0.4% | 0% | 6395 | 0% | 1.02 | yes |
| mem | mem.first_touch.4k | ns/page | 1723 | 1.8% | 0% | 708 | 0% | 0.41 | yes |
| mem | mem.map_touch_unmap.4k | ns/page | 2012 | 2.0% | 0% | 737 | 0% | 0.37 | yes |
| mem | mem.first_touch.2m | ns/page | 259578 | 1.0% | 4% | 330 | 1% | 0.00 | yes |
| mem | mem.map_touch_unmap.2m | ns/page | 268750 | 0.9% | 3% | 2584 | 0% | 0.01 | yes |
| mem | mem.mprotect.4k | ns | 2124 | 1.4% | 10% | 931 | 1% | 0.44 | yes |
| mem | mem.munmap_part.4k | ns | 3036 | 3.0% | 6% | 1253 | 1% | 0.41 | yes |
| mem | mem.munmap_touched_remote.4k | ns | 4578 | 8.6% | 66% | 2795 | 6% | 0.61 | yes |
| mem | mem.malloc_churn.16.t1 | kops/s | 28472 | 4.8% | - | 44749 | - | 1.57 | yes |
| mem | mem.malloc_churn.16.t16 | kops/s | 1755 | 0.6% | - | 2896 | - | 1.65 | yes |
| mem | mem.malloc_churn.4096.t1 | kops/s | 21204 | 0.9% | - | 38871 | - | 1.83 | yes |
| mem | mem.malloc_churn.4096.t16 | kops/s | 1570 | 0.9% | - | 2402 | - | 1.53 | yes |
| mem | mem.malloc_churn.1048576.t1 | kops/s | 96 | 8.3% | - | 39678 | - | 413.31 | yes |
| mem | mem.malloc_churn.1048576.t16 | kops/s | 67 | 1.5% | - | 3293 | - | 49.15 | yes |
| mem | mem.realloc_grow.1m_256m | ns | 190 | 0.5% | - | 154349165 | - | 812364.03 | no |
| mem | mem.realloc_grow.last_128m_256m | ns | 30 | 33.3% | - | 81734289 | - | 2724476.30 | no |
| time | time.now | ps | 22476 | 0.3% | 0% | 12056 | 0% | 0.54 | yes |
| time | time.sleep_late.1us | ns | 53603 | 0.0% | 13% | 2346 | 32% | 0.04 | yes |
| time | time.sleep_late.10us | ns | 53581 | 0.0% | 13% | 4338 | 24% | 0.08 | yes |
| time | time.sleep_late.100us | ns | 60374 | 0.1% | 2% | 6856 | 1% | 0.11 | yes |
| time | time.sleep_late.1ms | ns | 70676 | 1.5% | 38% | 37613 | 5% | 0.53 | yes |
| time | time.sleep_late.10ms | ns | 341720 | 71.3% | 11% | 39629 | 0% | 0.12 | yes |
| time | time.timer_1ms.late | ns | 61635 | 57.0% | 0% | 37676 | 5% | 0.61 | yes |
| time | time.yield | ps | 544481 | 0.4% | 0% | 15894 | 0% | 0.03 | yes |
| work | work.compress_inproc | ns | 425659524 | 0.3% | - | 425684425 | - | 1.00 | no |
| work | work.build_shaped.j1 | ns | 1067804459 | 85.7% | - | 4141204309 | - | 3.88 | no |
| work | work.build_shaped.j16 | ns | 127326881 | 4.9% | - | 3159550035 | - | 24.81 | no |
| tail | tail.wake.periodic.60s | ns | 60826 | 0.0% | 2% | 6999 | 13% | 0.12 | yes |
| tail | tail.stolen.10s | ns | 33043 | 14.5% | 2396% | 28444 | 89% | 0.86 | yes |
| crunch | crunch.single.deflate | ns | 63255667 | 5.2% | 2% | 62768520 | 0% | 0.99 | yes |
| crunch | crunch.single.sha256 | ns | 495999 | 0.0% | 1% | 495797 | 1% | 1.00 | yes |
| crunch | crunch.single.matmul | ns | 897369 | 1.0% | 1% | 944974 | 0% | 1.05 | no |
| crunch | crunch.single.parse | ns | 72571503 | 0.5% | 1% | 42431475 | 0% | 0.58 | yes |
| crunch | crunch.all.deflate | ns | 138377057 | 0.2% | 1% | 130509308 | 3% | 0.94 | yes |
| crunch | crunch.all.sha256 | ns | 669569 | 0.5% | 1% | 679572 | 1% | 1.01 | no |
| crunch | crunch.all.matmul | ns | 3358995 | 3.0% | 9% | 2467022 | 1% | 0.73 | yes |
| crunch | crunch.all.parse | ns | 3086842298 | 0.7% | 1% | 4438458669 | 1% | 1.44 | no |
| persist | persist.write_4k_fsync | ns | 3501121 | 13.5% | 4% | 1976174 | 11% | 0.56 | yes |
| persist | persist.fsync_clean | ns | 55886 | 17.9% | 16% | 1766390 | 8% | 31.61 | no |
| persist | persist.append_4k_fsync | ns | 3711165 | 15.1% | 5% | 10582737 | 71% | 2.85 | no |
| persist | persist.create_fsync_unlink | ns | 3295161 | 4.7% | 5% | 6334537 | 114% | 1.92 | no |
| persist | persist.seq_write_fsync | MB/s | 525 | 4.6% | - | 25 | - | 0.05 | no |
| persist | persist.seq_read_cached | MB/s | 10792 | 12.0% | - | 896 | - | 0.08 | no |

### Files: Linux's /dev/shm against ToyOS's /tmp (the kernel's tmpfs) and /home (the DATA file server, in memory)

| group | operation | unit | Linux median p50 | Linux run spread | Linux within-run | ToyOS p50 | ToyOS within-run | ToyOS / Linux | ToyOS ahead |
|---|---|---|---|---|---|---|---|---|---|
| files | open_close: Linux shm, ToyOS tmp | ns | 8797 | 67.1% | 0% | 6482 | 2% | 0.74 | yes |
| files | open_close: Linux shm, ToyOS served | ns | 8797 | 67.1% | 0% | 83130 | 1% | 9.45 | no |
| files | stat: Linux shm, ToyOS tmp | ns | 1473 | 2.0% | 1% | 2826 | 3% | 1.92 | no |
| files | stat: Linux shm, ToyOS served | ns | 1473 | 2.0% | 1% | 51740 | 1% | 35.13 | no |
| files | create_write_unlink: Linux shm, ToyOS tmp | ns | 12644 | 0.6% | 6% | 11102 | 3% | 0.88 | yes |
| files | create_write_unlink: Linux shm, ToyOS served | ns | 12644 | 0.6% | 6% | 156392 | 1% | 12.37 | no |
| files | read_4k_at: Linux shm, ToyOS tmp | ns | 1082 | 20.3% | 19% | 1383 | 38% | 1.28 | no |
| files | read_4k_at: Linux shm, ToyOS served | ns | 1082 | 20.3% | 19% | 24266 | 3% | 22.43 | no |
| files | write_4k_at: Linux shm, ToyOS tmp | ns | 1442 | 6.9% | 10% | 1854 | 18% | 1.29 | no |
| files | write_4k_at: Linux shm, ToyOS served | ns | 1442 | 6.9% | 10% | 24868 | 3% | 17.25 | no |
| files | readdir.1000: Linux shm, ToyOS tmp | ns | 265533 | 0.9% | 2% | 1139440 | 0% | 4.29 | no |
| files | readdir.1000: Linux shm, ToyOS served | ns | 265533 | 0.9% | 2% | 61849656 | 0% | 232.93 | no |
| files | rename: Linux shm, ToyOS tmp | ns | 4468 | 1.1% | 2% | 6373 | 1% | 1.43 | no |
| files | rename: Linux shm, ToyOS served | ns | 4468 | 1.1% | 2% | 231427 | 1% | 51.80 | no |
| files | mkdir_rmdir: Linux shm, ToyOS tmp | ns | 6573 | 1.7% | 7% | 8016 | 1% | 1.22 | no |
| files | mkdir_rmdir: Linux shm, ToyOS served | ns | 6573 | 1.7% | 7% | 261825 | 1% | 39.83 | no |
| files | tree.100: Linux shm, ToyOS tmp | ns | 1369825 | 0.7% | 10% | 1411786 | 0% | 1.03 | no |
| files | tree.100: Linux shm, ToyOS served | ns | 1369825 | 0.7% | 10% | 37885199 | 0% | 27.66 | no |
| files | seq_write.4096: Linux shm, ToyOS tmp | MB/s | 1305 | 1.7% | - | 2369 | - | 1.82 | yes |
| files | seq_write.4096: Linux shm, ToyOS served | MB/s | 1305 | 1.7% | - | 249 | - | 0.19 | no |
| files | seq_read.4096: Linux shm, ToyOS tmp | MB/s | 5442 | 2.6% | - | 4148 | - | 0.76 | no |
| files | seq_read.4096: Linux shm, ToyOS served | MB/s | 5442 | 2.6% | - | 305 | - | 0.06 | no |
| files | seq_write.1048576: Linux shm, ToyOS tmp | MB/s | 1553 | 1.2% | - | 3077 | - | 1.98 | yes |
| files | seq_write.1048576: Linux shm, ToyOS served | MB/s | 1553 | 1.2% | - | 961 | - | 0.62 | no |
| files | seq_read.1048576: Linux shm, ToyOS tmp | MB/s | 8601 | 1.9% | - | 6765 | - | 0.79 | no |
| files | seq_read.1048576: Linux shm, ToyOS served | MB/s | 8601 | 1.9% | - | 5808 | - | 0.68 | no |

### Wakes and sleeps against Linux with its timer slack at 1 ns (ToyOS has no timer slack; Linux's default pads each sleep by up to 50 us)

| group | bench | unit | Linux median p50 | Linux run spread | Linux within-run | ToyOS p50 | ToyOS within-run | ToyOS / Linux | ToyOS ahead |
|---|---|---|---|---|---|---|---|---|---|
| sched | wake.periodic.idle: Linux at 1 ns timer slack | ns | 10772 | 1.1% | 9% | 37740 | 5% | 3.50 | no |
| sched | wake.periodic.loaded: Linux at 1 ns timer slack | ns | 4291 | 7.4% | 11% | 4493 | 18% | 1.05 | no |
| time | time.sleep_late.1us: Linux at 1 ns timer slack | ns | 11984 | 60.5% | 2% | 2346 | 32% | 0.20 | yes |
| time | time.sleep_late.10us: Linux at 1 ns timer slack | ns | 7854 | 88.5% | 35% | 4338 | 24% | 0.55 | yes |
| time | time.sleep_late.100us: Linux at 1 ns timer slack | ns | 10480 | 1.5% | 11% | 6856 | 1% | 0.65 | yes |
| time | time.sleep_late.1ms: Linux at 1 ns timer slack | ns | 11665 | 0.4% | 71% | 37613 | 5% | 3.22 | no |
| time | time.sleep_late.10ms: Linux at 1 ns timer slack | ns | 294681 | 82.9% | 20% | 39629 | 0% | 0.13 | yes |
| time | time.timer_1ms.late: Linux at 1 ns timer slack | ns | 11603 | 56.4% | 1% | 37676 | 5% | 3.25 | no |

### ToyOS reports unsupported

| bench | ToyOS says | Linux |
|---|---|---|
| net.tcp.connect_accept_close | ToyOS's network stack has no loopback: netstack refuses 127/8 as a destination | measured |
| net.tcp.reqrep.64 | ToyOS's network stack has no loopback: netstack refuses 127/8 as a destination | measured |
| net.tcp.stream.1 | ToyOS's network stack has no loopback: netstack refuses 127/8 as a destination | measured |
| net.tcp.stream.65536 | ToyOS's network stack has no loopback: netstack refuses 127/8 as a destination | measured |
| net.udp.reqrep.64 | ToyOS's network stack has no loopback: netstack refuses 127/8 as a destination | measured |
| energy.idle_60s.package | no counter carries the package's energy: toyos abi::counters::Counter has none | unmeasured |
| nvme.read.4k.random | the block service reaches a partition only through a grant the supervisor mints for a file server's role or the idle slot, and this bench's NVMe holds another system | unmeasured |
| nvme.read.1m.seq | the block service reaches a partition only through a grant the supervisor mints for a file server's role or the idle slot, and this bench's NVMe holds another system | unmeasured |
| identity.usb | usbd keeps its devices and no right reads them from another program | absent |
| identity.nvme | the NVMe driver keeps its controller's identity and no right reads it from another program | absent |
| identity.cpuidle | the kernel names its idle states to no program | absent |
| lan.wifi.tcp.connect | ToyOS has no Wi-Fi driver: issues/there-is-no-wifi.md | absent |
| lan.wifi.tcp.rtt.64 | ToyOS has no Wi-Fi driver: issues/there-is-no-wifi.md | absent |
| lan.wifi.tcp.upload | ToyOS has no Wi-Fi driver: issues/there-is-no-wifi.md | absent |
| lan.wifi.tcp.download | ToyOS has no Wi-Fi driver: issues/there-is-no-wifi.md | absent |
| lan.wired.tcp.connect | no network stack answers: netstack error | absent |
| lan.wired.tcp.rtt.64 | no network stack answers: netstack error | absent |
| lan.wired.tcp.upload | no network stack answers: netstack error | absent |
| lan.wired.tcp.download | no network stack answers: netstack error | absent |

### Not compared, and why

| bench | Linux | ToyOS |
|---|---|---|
| lan | Linux refused: no osbench-peer answered on the link within 60s |  |
| wake.periodic.idle.slack1ns | measured | Linux's timer slack set to 1 ns; ToyOS has no timer slack, so its rows are paired with these above |
| wake.periodic.loaded.slack1ns | measured | Linux's timer slack set to 1 ns; ToyOS has no timer slack, so its rows are paired with these above |
| fair.flat | measured | Linux's fair groupings; ToyOS's are fair.onejob and fair.perjob, so the groupings differ |
| fair.flat.total | measured | Linux's fair groupings; ToyOS's are fair.onejob and fair.perjob, so the groupings differ |
| fair.session | measured | Linux's fair groupings; ToyOS's are fair.onejob and fair.perjob, so the groupings differ |
| fair.session.total | measured | Linux's fair groupings; ToyOS's are fair.onejob and fair.perjob, so the groupings differ |
| fair.scope | measured | Linux's fair groupings; ToyOS's are fair.onejob and fair.perjob, so the groupings differ |
| fair.scope.total | measured | Linux's fair groupings; ToyOS's are fair.onejob and fair.perjob, so the groupings differ |
| fs.shm.open_close | measured | Linux's /dev/shm; ToyOS's in-memory directories are fs.tmp and fs.served, paired below |
| fs.shm.stat | measured | Linux's /dev/shm; ToyOS's in-memory directories are fs.tmp and fs.served, paired below |
| fs.shm.create_write_unlink | measured | Linux's /dev/shm; ToyOS's in-memory directories are fs.tmp and fs.served, paired below |
| fs.shm.read_4k_at | measured | Linux's /dev/shm; ToyOS's in-memory directories are fs.tmp and fs.served, paired below |
| fs.shm.write_4k_at | measured | Linux's /dev/shm; ToyOS's in-memory directories are fs.tmp and fs.served, paired below |
| fs.shm.readdir.1000 | measured | Linux's /dev/shm; ToyOS's in-memory directories are fs.tmp and fs.served, paired below |
| fs.shm.rename | measured | Linux's /dev/shm; ToyOS's in-memory directories are fs.tmp and fs.served, paired below |
| fs.shm.mkdir_rmdir | measured | Linux's /dev/shm; ToyOS's in-memory directories are fs.tmp and fs.served, paired below |
| fs.shm.tree.100 | measured | Linux's /dev/shm; ToyOS's in-memory directories are fs.tmp and fs.served, paired below |
| fs.shm.seq_write.4096 | measured | Linux's /dev/shm; ToyOS's in-memory directories are fs.tmp and fs.served, paired below |
| fs.shm.seq_read.4096 | measured | Linux's /dev/shm; ToyOS's in-memory directories are fs.tmp and fs.served, paired below |
| fs.shm.seq_write.1048576 | measured | Linux's /dev/shm; ToyOS's in-memory directories are fs.tmp and fs.served, paired below |
| fs.shm.seq_read.1048576 | measured | Linux's /dev/shm; ToyOS's in-memory directories are fs.tmp and fs.served, paired below |
| time.sleep_late.1us.slack1ns | measured | Linux's timer slack set to 1 ns; ToyOS has no timer slack, so its rows are paired with these above |
| time.sleep_late.10us.slack1ns | measured | Linux's timer slack set to 1 ns; ToyOS has no timer slack, so its rows are paired with these above |
| time.sleep_late.100us.slack1ns | measured | Linux's timer slack set to 1 ns; ToyOS has no timer slack, so its rows are paired with these above |
| time.sleep_late.1ms.slack1ns | measured | Linux's timer slack set to 1 ns; ToyOS has no timer slack, so its rows are paired with these above |
| time.sleep_late.10ms.slack1ns | measured | Linux's timer slack set to 1 ns; ToyOS has no timer slack, so its rows are paired with these above |
| time.timer_1ms.late.slack1ns | measured | Linux's timer slack set to 1 ns; ToyOS has no timer slack, so its rows are paired with these above |
| fair.onejob | ToyOS's job groupings; Linux's are flat, session and scope | measured |
| fair.onejob.total | ToyOS's job groupings; Linux's are flat, session and scope | measured |
| fair.perjob | ToyOS's job groupings; Linux's are flat, session and scope | measured |
| fair.perjob.total | ToyOS's job groupings; Linux's are flat, session and scope | measured |
| fs.tmp.open_close | paired with fs.shm below | measured |
| fs.tmp.stat | paired with fs.shm below | measured |
| fs.tmp.create_write_unlink | paired with fs.shm below | measured |
| fs.tmp.read_4k_at | paired with fs.shm below | measured |
| fs.tmp.write_4k_at | paired with fs.shm below | measured |
| fs.tmp.readdir.1000 | paired with fs.shm below | measured |
| fs.tmp.rename | paired with fs.shm below | measured |
| fs.tmp.mkdir_rmdir | paired with fs.shm below | measured |
| fs.tmp.tree.100 | paired with fs.shm below | measured |
| fs.tmp.seq_write.4096 | paired with fs.shm below | measured |
| fs.tmp.seq_read.4096 | paired with fs.shm below | measured |
| fs.tmp.seq_write.1048576 | paired with fs.shm below | measured |
| fs.tmp.seq_read.1048576 | paired with fs.shm below | measured |
| fs.served.open_close | paired with fs.shm below | measured |
| fs.served.stat | paired with fs.shm below | measured |
| fs.served.create_write_unlink | paired with fs.shm below | measured |
| fs.served.read_4k_at | paired with fs.shm below | measured |
| fs.served.write_4k_at | paired with fs.shm below | measured |
| fs.served.readdir.1000 | paired with fs.shm below | measured |
| fs.served.rename | paired with fs.shm below | measured |
| fs.served.mkdir_rmdir | paired with fs.shm below | measured |
| fs.served.tree.100 | paired with fs.shm below | measured |
| fs.served.seq_write.4096 | paired with fs.shm below | measured |
| fs.served.seq_read.4096 | paired with fs.shm below | measured |
| fs.served.seq_write.1048576 | paired with fs.shm below | measured |
| fs.served.seq_read.1048576 | paired with fs.shm below | measured |
| tail.diag.periodic.30s | not in the Linux output | measured |
