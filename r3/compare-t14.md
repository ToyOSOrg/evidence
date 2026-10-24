## t14: ToyOS against Linux

Linux: the median of three runs' p50 at f644cefae; its run-to-run spread is (max - min) / median of the three p50s. ToyOS: one boot at f644cefae, its p50. Within-run spread is (p90 - p50) / p50 of a run (Linux: of the median run). Ratio is ToyOS / Linux; "ToyOS ahead" reads the unit: lower is better for times and energy, higher for rates.

| group | bench | unit | Linux median p50 | Linux run spread | Linux within-run | ToyOS p50 | ToyOS within-run | ToyOS / Linux | ToyOS ahead |
|---|---|---|---|---|---|---|---|---|---|
| fair | cpu.chunk | ns | 2994 | 0.0% | 0% | 3311 | 0% | 1.11 | no |
| system | syscall.null | ps | 91749 | 0.2% | 2% | 183539 | 0% | 2.00 | no |
| system | thread.spawn_join | ns | 25368 | 0.7% | 10% | 30823 | 1% | 1.22 | no |
| system | process.spawn_wait | ns | 142117 | 1.7% | 22% | 12401731 | 1% | 87.26 | no |
| system | pipe.throughput.64 | MB/s | 168 | 1.8% | - | 62 | - | 0.37 | no |
| system | pipe.throughput.256 | MB/s | 645 | 2.2% | - | 251 | - | 0.39 | no |
| system | pipe.throughput.1024 | MB/s | 1786 | 4.4% | - | 866 | - | 0.48 | no |
| system | pipe.throughput.4096 | MB/s | 4155 | 0.9% | - | 2335 | - | 0.56 | no |
| system | pipe.throughput.16384 | MB/s | 3850 | 2.3% | - | 4038 | - | 1.05 | yes |
| system | pipe.throughput.65536 | MB/s | 4158 | 2.7% | - | 6542 | - | 1.57 | yes |
| system | mem.anon.map | ns/MiB | 95 | 8.4% | 80% | 145 | 59% | 1.53 | no |
| system | mem.anon.touch | ns/MiB | 234840 | 0.7% | 0% | 224656 | 2% | 0.96 | yes |
| system | mem.anon.unmap | ns/MiB | 23466 | 2.4% | 8% | 4449 | 62% | 0.19 | yes |
| system | mem.anon.total | ns/MiB | 258774 | 0.4% | 1% | 231504 | 3% | 0.89 | yes |
| system | mem.map_unmap_4k | ns | 2163 | 0.6% | 29% | 2727 | 1% | 1.26 | no |
| system | mem.bw.read | MB/s | 18083 | 2.7% | - | 17769 | - | 0.98 | no |
| system | mem.bw.write | MB/s | 9379 | 0.5% | - | 9472 | - | 1.01 | yes |
| system | mem.bw.copy | MB/s | 6772 | 2.2% | - | 6730 | - | 0.99 | no |
| sched | wake.periodic.idle | ns | 69268 | 2.6% | 2% | 26799 | 8% | 0.39 | yes |
| sched | wake.periodic.loaded | ns | 52370 | 0.2% | 0% | 4138 | 3% | 0.08 | yes |
| sched | wake.onto_busy | ns | 2485 | 11.9% | 14% | 7552 | 8% | 3.04 | no |
| sched | wake.storm.call.w1 | ns | 4151 | 44.1% | 30% | 3853 | 48% | 0.93 | yes |
| sched | wake.storm.drain.w1 | ns | 94978 | 79.2% | 20% | 30820 | 20% | 0.32 | yes |
| sched | wake.storm.call.w4 | ns | 11623 | 21.3% | 8% | 4723 | 7% | 0.41 | yes |
| sched | wake.storm.drain.w4 | ns | 121431 | 3.0% | 22% | 50192 | 11% | 0.41 | yes |
| sched | wake.storm.call.w16 | ns | 62923 | 5.8% | 38% | 10587 | 14% | 0.17 | yes |
| sched | wake.storm.drain.w16 | ns | 989269 | 67.8% | 191% | 105341 | 15% | 0.11 | yes |
| sched | wake.storm.call.w64 | ns | 258127 | 5.2% | 8% | 28489 | 16% | 0.11 | yes |
| sched | wake.storm.drain.w64 | ns | 281581 | 18.2% | 1067% | 268147 | 12% | 0.95 | yes |
| sched | pingpong.pipe.same_cpu | ns | 4594 | 70.1% | 100% | 9829 | 276% | 2.14 | no |
| sched | pingpong.futex.same_cpu | ns | 2217 | 4.0% | 2% | 7408 | 1% | 3.34 | no |
| sched | pingpong.pipe.cross_core | ns | 3688 | 7.7% | 9% | 10015 | 1% | 2.72 | no |
| sched | pingpong.futex.cross_core | ns | 3331 | 0.9% | 2% | 7353 | 2% | 2.21 | no |
| ipc | ipc.reqrep.8 | ns | 3651 | 13.2% | 41% | 11087 | 1% | 3.04 | no |
| ipc | ipc.reqrep.4096 | ns | 7666 | 1.0% | 4% | 12958 | 2% | 1.69 | no |
| ipc | ipc.reqrep.65536 | ns | 19120 | 0.4% | 3% | 50470 | 2% | 2.64 | no |
| ipc | ipc.reqrep_handle.8 | ns | 7362 | 1.2% | 11% | 13284 | 1% | 1.80 | no |
| ipc | ipc.connect_accept | ns | 3813 | 0.3% | 10% | 3903 | 1% | 1.02 | no |
| procs | proc.spawn_wait.tiny | ns | 51996 | 3.4% | 6% | 52653 | 16% | 1.01 | no |
| procs | proc.spawn_wait.large | ns | 54985 | 1.2% | 7% | 224359 | 30% | 4.08 | no |
| procs | proc.spawn_wait_loop.100 | ns | 5421590 | 0.8% | 2% | 5459754 | 0% | 1.01 | no |
| procs | proc.posix_spawn_wait.tiny | ns | 44227 | 2.2% | 7% | 66432 | 5% | 1.50 | no |
| procs | proc.posix_spawn_wait.std | ns | 132266 | 0.7% | 24% | 12376464 | 1% | 93.57 | no |
| procs | thread.spawn_join.default | ns | 25413 | 1.0% | 9% | 29906 | 1% | 1.18 | no |
| procs | thread.spawn_join.stack64k | ns | 23453 | 1.3% | 10% | 29915 | 1% | 1.28 | no |
| mem | mem.memcpy.64 | MB/s | 6199 | 0.3% | 1% | 16166 | 6% | 2.61 | yes |
| mem | mem.memcpy.256 | MB/s | 24900 | 0.7% | 1% | 25357 | 4% | 1.02 | yes |
| mem | mem.memcpy.1024 | MB/s | 77916 | 1.1% | 1% | 74634 | 4% | 0.96 | no |
| mem | mem.memcpy.4096 | MB/s | 154920 | 3.4% | 0% | 149262 | 0% | 0.96 | no |
| mem | mem.memcpy.16384 | MB/s | 195234 | 15.9% | 0% | 164277 | 7% | 0.84 | no |
| mem | mem.memcpy.65536 | MB/s | 55003 | 0.2% | 0% | 50190 | 0% | 0.91 | no |
| mem | mem.memcpy.262144 | MB/s | 55594 | 0.1% | 0% | 50414 | 0% | 0.91 | no |
| mem | mem.memcpy.1048576 | MB/s | 25711 | 1.6% | 1% | 24183 | 1% | 0.94 | no |
| mem | mem.memcpy.4194304 | MB/s | 20941 | 21.2% | 2% | 19933 | 1% | 0.95 | no |
| mem | mem.memcpy.16777216 | MB/s | 10870 | 1.7% | 1% | 10488 | 0% | 0.96 | no |
| mem | mem.memcpy.67108864 | MB/s | 9614 | 0.3% | 1% | 9206 | 0% | 0.96 | no |
| mem | mem.first_touch.4k | ns/page | 921 | 0.7% | 0% | 883 | 0% | 0.96 | yes |
| mem | mem.map_touch_unmap.4k | ns/page | 1009 | 0.6% | 1% | 905 | 1% | 0.90 | yes |
| mem | mem.first_touch.2m | ns/page | 195991 | 0.7% | 2% | 682 | 1% | 0.00 | yes |
| mem | mem.map_touch_unmap.2m | ns/page | 199332 | 0.7% | 2% | 2854 | 0% | 0.01 | yes |
| mem | mem.mprotect.4k | ns | 1016 | 0.2% | 25% | 1180 | 3% | 1.16 | no |
| mem | mem.munmap_part.4k | ns | 1253 | 1.4% | 13% | 1810 | 1% | 1.44 | no |
| mem | mem.munmap_touched_remote.4k | ns | 2251 | 0.9% | 8% | 3326 | 2% | 1.48 | no |
| mem | mem.malloc_churn.16.t1 | kops/s | 33509 | 0.5% | - | 31143 | - | 0.93 | no |
| mem | mem.malloc_churn.16.t8 | kops/s | 3176 | 19.3% | - | 4924 | - | 1.55 | yes |
| mem | mem.malloc_churn.4096.t1 | kops/s | 19980 | 11.7% | - | 28023 | - | 1.40 | yes |
| mem | mem.malloc_churn.4096.t8 | kops/s | 857 | 1.1% | - | 3146 | - | 3.67 | yes |
| mem | mem.malloc_churn.1048576.t1 | kops/s | 172 | 5.2% | - | 29078 | - | 169.06 | yes |
| mem | mem.malloc_churn.1048576.t8 | kops/s | 92 | 1.1% | - | 4019 | - | 43.68 | yes |
| mem | mem.realloc_grow.1m_256m | ns | 194 | 3.6% | - | 116067855 | - | 598287.91 | no |
| mem | mem.realloc_grow.last_128m_256m | ns | 25 | 8.0% | - | 58662973 | - | 2346518.92 | no |
| time | time.now | ps | 14307 | 0.1% | 0% | 22021 | 1% | 1.54 | no |
| time | time.sleep_late.1us | ns | 51829 | 0.0% | 0% | 2700 | 1% | 0.05 | yes |
| time | time.sleep_late.10us | ns | 51831 | 0.0% | 0% | 4887 | 1% | 0.09 | yes |
| time | time.sleep_late.100us | ns | 51869 | 0.0% | 30% | 6866 | 1% | 0.13 | yes |
| time | time.sleep_late.1ms | ns | 71776 | 0.7% | 176% | 26556 | 18% | 0.37 | yes |
| time | time.sleep_late.10ms | ns | 213347 | 0.2% | 11% | 28305 | 12% | 0.13 | yes |
| time | time.timer_1ms.late | ns | 70465 | 0.4% | 0% | 26534 | 10% | 0.38 | yes |
| time | time.yield | ps | 190392 | 1.0% | 1% | 63553 | 0% | 0.33 | yes |
| work | work.compress_inproc | ns | 361518827 | 0.2% | - | 396032864 | - | 1.10 | no |
| work | work.build_shaped.j1 | ns | 994855997 | 5.7% | - | 3788277099 | - | 3.81 | no |
| work | work.build_shaped.j8 | ns | 97186040 | 2.1% | - | 3216452221 | - | 33.10 | no |
| tail | tail.wake.periodic.60s | ns | 67731 | 19.3% | 2% | 27035 | 7% | 0.40 | yes |
| tail | tail.stolen.10s | ns | 38491 | 24.0% | 208% | 26964 | 485% | 0.70 | yes |

### Files: Linux's /dev/shm against ToyOS's /tmp (the kernel's tmpfs) and /home (the DATA file server, in memory)

| group | operation | unit | Linux median p50 | Linux run spread | Linux within-run | ToyOS p50 | ToyOS within-run | ToyOS / Linux | ToyOS ahead |
|---|---|---|---|---|---|---|---|---|---|
| files | open_close: Linux shm, ToyOS tmp | ns | 3375 | 7.2% | 1% | 11562 | 17% | 3.43 | no |
| files | open_close: Linux shm, ToyOS served | ns | 3375 | 7.2% | 1% | 95482 | 0% | 28.29 | no |
| files | stat: Linux shm, ToyOS tmp | ns | 1761 | 0.9% | 1% | 3617 | 1% | 2.05 | no |
| files | stat: Linux shm, ToyOS served | ns | 1761 | 0.9% | 1% | 59682 | 0% | 33.89 | no |
| files | create_write_unlink: Linux shm, ToyOS tmp | ns | 8600 | 22.6% | 55% | 14687 | 1% | 1.71 | no |
| files | create_write_unlink: Linux shm, ToyOS served | ns | 8600 | 22.6% | 55% | 176231 | 0% | 20.49 | no |
| files | read_4k_at: Linux shm, ToyOS tmp | ns | 700 | 8.4% | 33% | 1570 | 21% | 2.24 | no |
| files | read_4k_at: Linux shm, ToyOS served | ns | 700 | 8.4% | 33% | 27836 | 2% | 39.77 | no |
| files | write_4k_at: Linux shm, ToyOS tmp | ns | 615 | 7.6% | 19% | 1638 | 22% | 2.66 | no |
| files | write_4k_at: Linux shm, ToyOS served | ns | 615 | 7.6% | 19% | 27908 | 1% | 45.38 | no |
| files | readdir.1000: Linux shm, ToyOS tmp | ns | 176941 | 0.8% | 1% | 1288924 | 1% | 7.28 | no |
| files | readdir.1000: Linux shm, ToyOS served | ns | 176941 | 0.8% | 1% | 76492007 | 0% | 432.30 | no |
| files | rename: Linux shm, ToyOS tmp | ns | 1614 | 0.9% | 3% | 8143 | 1% | 5.05 | no |
| files | rename: Linux shm, ToyOS served | ns | 1614 | 0.9% | 3% | 291557 | 4% | 180.64 | no |
| files | mkdir_rmdir: Linux shm, ToyOS tmp | ns | 2201 | 1.5% | 12% | 9979 | 1% | 4.53 | no |
| files | mkdir_rmdir: Linux shm, ToyOS served | ns | 2201 | 1.5% | 12% | 289846 | 1% | 131.69 | no |
| files | tree.100: Linux shm, ToyOS tmp | ns | 534587 | 0.5% | 7% | 1776240 | 0% | 3.32 | no |
| files | tree.100: Linux shm, ToyOS served | ns | 534587 | 0.5% | 7% | 44235218 | 0% | 82.75 | no |
| files | seq_write.4096: Linux shm, ToyOS tmp | MB/s | 3611 | 0.5% | - | 2592 | - | 0.72 | no |
| files | seq_write.4096: Linux shm, ToyOS served | MB/s | 3611 | 0.5% | - | 229 | - | 0.06 | no |
| files | seq_read.4096: Linux shm, ToyOS tmp | MB/s | 8029 | 2.8% | - | 3591 | - | 0.45 | no |
| files | seq_read.4096: Linux shm, ToyOS served | MB/s | 8029 | 2.8% | - | 260 | - | 0.03 | no |
| files | seq_write.1048576: Linux shm, ToyOS tmp | MB/s | 4557 | 0.6% | - | 3926 | - | 0.86 | no |
| files | seq_write.1048576: Linux shm, ToyOS served | MB/s | 4557 | 0.6% | - | 1087 | - | 0.24 | no |
| files | seq_read.1048576: Linux shm, ToyOS tmp | MB/s | 8810 | 5.2% | - | 6397 | - | 0.73 | no |
| files | seq_read.1048576: Linux shm, ToyOS served | MB/s | 8810 | 5.2% | - | 5959 | - | 0.68 | no |

### Wakes and sleeps against Linux with its timer slack at 1 ns (ToyOS has no timer slack; Linux's default pads each sleep by up to 50 us)

| group | bench | unit | Linux median p50 | Linux run spread | Linux within-run | ToyOS p50 | ToyOS within-run | ToyOS / Linux | ToyOS ahead |
|---|---|---|---|---|---|---|---|---|---|
| sched | wake.periodic.idle: Linux at 1 ns timer slack | ns | 17574 | 11.7% | 8% | 26799 | 8% | 1.52 | no |
| sched | wake.periodic.loaded: Linux at 1 ns timer slack | ns | 2369 | 0.6% | 9% | 4138 | 3% | 1.75 | no |
| time | time.sleep_late.1us: Linux at 1 ns timer slack | ns | 4332 | 2.3% | 1% | 2700 | 1% | 0.62 | yes |
| time | time.sleep_late.10us: Linux at 1 ns timer slack | ns | 1826 | 0.3% | 1% | 4887 | 1% | 2.68 | no |
| time | time.sleep_late.100us: Linux at 1 ns timer slack | ns | 1828 | 1.3% | 6% | 6866 | 1% | 3.76 | no |
| time | time.sleep_late.1ms: Linux at 1 ns timer slack | ns | 20479 | 0.9% | 20% | 26556 | 18% | 1.30 | no |
| time | time.sleep_late.10ms: Linux at 1 ns timer slack | ns | 165902 | 4.4% | 9% | 28305 | 12% | 0.17 | yes |
| time | time.timer_1ms.late: Linux at 1 ns timer slack | ns | 20396 | 0.9% | 1% | 26534 | 10% | 1.30 | no |

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
| crunch.single.deflate | measured | the ToyOS boot never ran group crunch: it ended at lan (killed at the list bound, fixed in ada5bf21c) |
| crunch.single.sha256 | measured | the ToyOS boot never ran group crunch: it ended at lan (killed at the list bound, fixed in ada5bf21c) |
| crunch.single.matmul | measured | the ToyOS boot never ran group crunch: it ended at lan (killed at the list bound, fixed in ada5bf21c) |
| crunch.single.parse | measured | the ToyOS boot never ran group crunch: it ended at lan (killed at the list bound, fixed in ada5bf21c) |
| crunch.all.deflate | measured | the ToyOS boot never ran group crunch: it ended at lan (killed at the list bound, fixed in ada5bf21c) |
| crunch.all.sha256 | measured | the ToyOS boot never ran group crunch: it ended at lan (killed at the list bound, fixed in ada5bf21c) |
| crunch.all.matmul | measured | the ToyOS boot never ran group crunch: it ended at lan (killed at the list bound, fixed in ada5bf21c) |
| crunch.all.parse | measured | the ToyOS boot never ran group crunch: it ended at lan (killed at the list bound, fixed in ada5bf21c) |
| persist.write_4k_fsync | measured | the ToyOS boot never ran group persist: it ended at lan (killed at the list bound, fixed in ada5bf21c) |
| persist.fsync_clean | measured | the ToyOS boot never ran group persist: it ended at lan (killed at the list bound, fixed in ada5bf21c) |
| persist.append_4k_fsync | measured | the ToyOS boot never ran group persist: it ended at lan (killed at the list bound, fixed in ada5bf21c) |
| persist.create_fsync_unlink | measured | the ToyOS boot never ran group persist: it ended at lan (killed at the list bound, fixed in ada5bf21c) |
| persist.seq_write_fsync | measured | the ToyOS boot never ran group persist: it ended at lan (killed at the list bound, fixed in ada5bf21c) |
| persist.seq_read_cached | measured | the ToyOS boot never ran group persist: it ended at lan (killed at the list bound, fixed in ada5bf21c) |
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
