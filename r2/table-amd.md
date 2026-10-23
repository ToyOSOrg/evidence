## amd

Three unprivileged `osbench all` runs at f644cefae. Each cell is a run's p50; the median is of the three p50s, and spread is (max - min) / median of them. `cpu.clock` lines are omitted.

Conditions: kernel=6.8.0-147-generic; distro=Ubuntu_24.04.5_LTS; cpu_model=AMD_Ryzen_7_4800U_with_Radeon_Graphics; cpus=16; threads_per_core=2; governor=schedutil*16; epp=absent*16; cpufreq_driver=acpi-cpufreq*16; ac_online=1; thp=madvise; smt_active=1; crunch.sensor=k10temp_Tctl; crunch.stop_c=90; crunch.limit_from=AMD's_Ryzen_7_4800U_specifications,_Max._Operating_Temperature_(Tjmax)_105_C; dmi.product_version=Yoga_Slim_7_14ARE05; dmi.bios_version=DMCN38WW

| group | bench | unit | run 1 | run 2 | run 3 | median | spread | p99 median | runs 1, 2, 3 |
|---|---|---|---|---|---|---|---|---|---|
| energy | energy.idle_60s.package | | | | | unmeasured: energy uj was refused (Permission denied (os error 13)): `sudo osbench energy` reads it | | | |
| system | cpu.chunk | ns | 2926 | 8987 | 8987 | 8987 | 67.4% | 9027 |  |
| system | syscall.null | ps | 156217 | 156369 | 156408 | 156369 | 0.1% | - |  |
| system | thread.spawn_join | ns | 71445 | 45547 | 65404 | 65404 | 39.6% | 157699 |  |
| system | process.spawn_wait | ns | 264430 | 273968 | 732789 | 273968 | 171.0% | 837466 |  |
| system | pipe.throughput.64 | MB/s | 108 | 121 | 115 | 115 | 11.3% | - |  |
| system | pipe.throughput.256 | MB/s | 427 | 457 | 425 | 427 | 7.5% | - |  |
| system | pipe.throughput.1024 | MB/s | 1565 | 1887 | 1690 | 1690 | 19.1% | - |  |
| system | pipe.throughput.4096 | MB/s | 5689 | 6471 | 6469 | 6469 | 12.1% | - |  |
| system | pipe.throughput.16384 | MB/s | 3580 | 3615 | 3565 | 3580 | 1.4% | - |  |
| system | pipe.throughput.65536 | MB/s | 2590 | 2282 | 934 | 2282 | 72.6% | - |  |
| system | mem.anon.map | ns/MiB | 291 | 303 | 293 | 293 | 4.1% | - |  |
| system | mem.anon.touch | ns/MiB | 446871 | 454594 | 452822 | 452822 | 1.7% | - |  |
| system | mem.anon.unmap | ns/MiB | 85814 | 81485 | 80304 | 81485 | 6.8% | - |  |
| system | mem.anon.total | ns/MiB | 532814 | 537492 | 535127 | 535127 | 0.9% | - |  |
| system | mem.map_unmap_4k | ns | 3998 | 4078 | 4007 | 4007 | 2.0% | 6402 |  |
| system | mem.bw.read | MB/s | 19534 | 19526 | 19815 | 19534 | 1.5% | - |  |
| system | mem.bw.write | MB/s | 9531 | 9414 | 9513 | 9513 | 1.2% | - |  |
| system | mem.bw.copy | MB/s | 8481 | 8464 | 8523 | 8481 | 0.7% | - |  |
| sched | cpu.chunk | ns | 2926 | 2926 | 2926 | 2926 | 0.0% | 2936 |  |
| sched | wake.periodic.idle | ns | 60734 | 60745 | 60806 | 60745 | 0.1% | 61868 |  |
| sched | wake.periodic.loaded | ns | 54285 | 54540 | 54295 | 54295 | 0.5% | 55652 |  |
| sched | wake.periodic.idle.slack1ns | ns | 10758 | 10772 | 10872 | 10772 | 1.1% | 12027 |  |
| sched | wake.periodic.loaded.slack1ns | ns | 4228 | 4547 | 4291 | 4291 | 7.4% | 9248 |  |
| sched | wake.onto_busy | ns | 5210 | 5400 | 5461 | 5400 | 4.6% | 18666 |  |
| sched | wake.storm.call.w1 | ns | 3437 | 7694 | 8266 | 7694 | 62.8% | - |  |
| sched | wake.storm.drain.w1 | ns | 44765 | 77627 | 77106 | 77106 | 42.6% | - |  |
| sched | wake.storm.call.w4 | ns | 7664 | 11852 | 12023 | 11852 | 36.8% | - |  |
| sched | wake.storm.drain.w4 | ns | 246707 | 76906 | 77607 | 77607 | 218.8% | - |  |
| sched | wake.storm.call.w16 | ns | 51277 | 52389 | 55916 | 52389 | 8.9% | - |  |
| sched | wake.storm.drain.w16 | ns | 105038 | 200309 | 112844 | 112844 | 84.4% | - |  |
| sched | wake.storm.call.w64 | ns | 239994 | 236347 | 227841 | 236347 | 5.1% | - |  |
| sched | wake.storm.drain.w64 | ns | 697500 | 1565765 | 337009 | 697500 | 176.2% | - |  |
| sched | pingpong.pipe.same_cpu | ns | 7584 | 7584 | 7364 | 7584 | 2.9% | 8927 |  |
| sched | pingpong.futex.same_cpu | ns | 6102 | 6121 | 5921 | 6102 | 3.3% | 6984 |  |
| sched | pingpong.pipe.cross_core | ns | 19367 | 11191 | 11221 | 11221 | 72.9% | 14107 |  |
| sched | pingpong.futex.cross_core | ns | 9768 | 9758 | 9739 | 9758 | 0.3% | 12504 |  |
| fair | cpu.chunk | ns | 8987 | 8987 | 8987 | 8987 | 0.0% | 9027 |  |
| fair | fair.flat | permille | 466 | 465 | 465 | 465 | 0.2% | - |  |
| fair | fair.flat.total | chunks/s | 5141545 | 4824940 | 4925337 | 4925337 | 6.4% | - |  |
| fair | fair.session | permille | 467 | 466 | 464 | 466 | 0.6% | - |  |
| fair | fair.session.total | chunks/s | 5097414 | 4883590 | 5004232 | 5004232 | 4.3% | - |  |
| fair | fair.scope | permille | 429 | 436 | 417 | 429 | 4.4% | - |  |
| fair | fair.scope.total | chunks/s | 5058092 | 4920521 | 4983763 | 4983763 | 2.8% | - |  |
| files | fs.shm.open_close | ns | 2905 | 8807 | 8797 | 8797 | 67.1% | 9037 |  |
| files | fs.shm.stat | ns | 1493 | 1463 | 1473 | 1473 | 2.0% | 1714 |  |
| files | fs.shm.create_write_unlink | ns | 12654 | 12574 | 12644 | 12644 | 0.6% | 19787 |  |
| files | fs.shm.read_4k_at | ns | 1072 | 1082 | 1292 | 1082 | 20.3% | 1483 |  |
| files | fs.shm.write_4k_at | ns | 1433 | 1442 | 1533 | 1442 | 6.9% | 1813 |  |
| files | fs.shm.readdir.1000 | ns | 265853 | 263409 | 265533 | 265533 | 0.9% | - |  |
| files | fs.shm.rename | ns | 4499 | 4448 | 4468 | 4468 | 1.1% | 6182 |  |
| files | fs.shm.mkdir_rmdir | ns | 6602 | 6493 | 6573 | 6573 | 1.7% | 12945 |  |
| files | fs.shm.tree.100 | ns | 1377376 | 1369825 | 1368063 | 1369825 | 0.7% | - |  |
| files | fs.shm.seq_write.4096 | MB/s | 1312 | 1305 | 1290 | 1305 | 1.7% | - |  |
| files | fs.shm.seq_read.4096 | MB/s | 5517 | 5442 | 5375 | 5442 | 2.6% | - |  |
| files | fs.shm.seq_write.1048576 | MB/s | 1556 | 1553 | 1538 | 1553 | 1.2% | - |  |
| files | fs.shm.seq_read.1048576 | MB/s | 8698 | 8601 | 8536 | 8601 | 1.9% | - |  |
| ipc | ipc.reqrep.8 | ns | 17293 | 18735 | 14588 | 17293 | 24.0% | 27291 |  |
| ipc | ipc.reqrep.4096 | ns | 11482 | 17103 | 17092 | 17092 | 32.9% | 22222 |  |
| ipc | ipc.reqrep.65536 | ns | 28734 | 31780 | 31209 | 31209 | 9.8% | 55085 |  |
| ipc | ipc.reqrep_handle.8 | ns | 16501 | 14287 | 14117 | 14287 | 16.7% | 23274 |  |
| ipc | ipc.connect_accept | ns | 10961 | 10931 | 10941 | 10941 | 0.3% | 18816 |  |
| net | net.tcp.connect_accept_close | ns | 48481 | 48652 | 48582 | 48582 | 0.4% | 84200 |  |
| net | net.tcp.reqrep.64 | ns | 16441 | 16431 | 16381 | 16431 | 0.4% | 32151 |  |
| net | net.tcp.stream.1 | MB/s | 0 | 0 | 0 | 0 | 0.0% | - |  |
| net | net.tcp.stream.65536 | MB/s | 2915 | 2808 | 3089 | 2915 | 9.6% | - |  |
| net | net.udp.reqrep.64 | ns | 14217 | 41979 | 40838 | 40838 | 68.0% | 53271 |  |
| procs | proc.spawn_wait.tiny | ns | 257617 | 253350 | 254312 | 254312 | 1.7% | 445915 |  |
| procs | proc.spawn_wait.large | ns | 169651 | 329044 | 272676 | 272676 | 58.5% | 446667 |  |
| procs | proc.spawn_wait_loop.100 | ns | 11541421 | 32149328 | 32029533 | 32029533 | 64.3% | - |  |
| procs | proc.posix_spawn_wait.tiny | ns | 213934 | 91012 | 122052 | 122052 | 100.7% | 336087 |  |
| procs | proc.posix_spawn_wait.std | ns | 288506 | 248691 | 731647 | 288506 | 167.4% | 826374 |  |
| procs | thread.spawn_join.default | ns | 69291 | 58691 | 71756 | 69291 | 18.9% | 161286 |  |
| procs | thread.spawn_join.stack64k | ns | 44714 | 64562 | 44224 | 44714 | 45.5% | 104488 |  |
| mem | mem.memcpy.64 | MB/s | 6569 | 6594 | 6564 | 6569 | 0.5% | - |  |
| mem | mem.memcpy.256 | MB/s | 16334 | 16345 | 16336 | 16336 | 0.1% | - |  |
| mem | mem.memcpy.1024 | MB/s | 41390 | 41597 | 41421 | 41421 | 0.5% | - |  |
| mem | mem.memcpy.4096 | MB/s | 86507 | 86585 | 86176 | 86507 | 0.5% | - |  |
| mem | mem.memcpy.16384 | MB/s | 74084 | 74107 | 75327 | 74107 | 1.7% | - |  |
| mem | mem.memcpy.65536 | MB/s | 66443 | 66688 | 66492 | 66492 | 0.4% | - |  |
| mem | mem.memcpy.262144 | MB/s | 36022 | 35185 | 34941 | 35185 | 3.1% | - |  |
| mem | mem.memcpy.1048576 | MB/s | 11441 | 11454 | 11463 | 11454 | 0.2% | - |  |
| mem | mem.memcpy.4194304 | MB/s | 10793 | 10868 | 10718 | 10793 | 1.4% | - |  |
| mem | mem.memcpy.16777216 | MB/s | 6113 | 6342 | 6109 | 6113 | 3.8% | - |  |
| mem | mem.memcpy.67108864 | MB/s | 6253 | 6272 | 6245 | 6253 | 0.4% | - |  |
| mem | mem.first_touch.4k | ns/page | 1711 | 1723 | 1742 | 1723 | 1.8% | - |  |
| mem | mem.map_touch_unmap.4k | ns/page | 1998 | 2012 | 2039 | 2012 | 2.0% | - |  |
| mem | mem.first_touch.2m | ns/page | 260248 | 259578 | 257645 | 259578 | 1.0% | - |  |
| mem | mem.map_touch_unmap.2m | ns/page | 269203 | 268750 | 266880 | 268750 | 0.9% | - |  |
| mem | mem.mprotect.4k | ns | 2124 | 2134 | 2104 | 2124 | 1.4% | 4058 |  |
| mem | mem.munmap_part.4k | ns | 3036 | 3126 | 3036 | 3036 | 3.0% | 4207 |  |
| mem | mem.munmap_touched_remote.4k | ns | 4930 | 4538 | 4578 | 4578 | 8.6% | 9688 | munmaps_per_s=182194, 191125, 174655; windows_refused=0/10, 0/10, 0/10 |
| mem | mem.malloc_churn.16.t1 | kops/s | 28472 | 28529 | 27167 | 28472 | 4.8% | - |  |
| mem | mem.malloc_churn.16.t16 | kops/s | 1755 | 1745 | 1756 | 1755 | 0.6% | - |  |
| mem | mem.malloc_churn.4096.t1 | kops/s | 21233 | 21204 | 21049 | 21204 | 0.9% | - |  |
| mem | mem.malloc_churn.4096.t16 | kops/s | 1578 | 1570 | 1564 | 1570 | 0.9% | - |  |
| mem | mem.malloc_churn.1048576.t1 | kops/s | 96 | 97 | 89 | 96 | 8.3% | - |  |
| mem | mem.malloc_churn.1048576.t16 | kops/s | 67 | 67 | 66 | 67 | 1.5% | - |  |
| mem | mem.realloc_grow.1m_256m | ns | 190 | 191 | 190 | 190 | 0.5% | - |  |
| mem | mem.realloc_grow.last_128m_256m | ns | 20 | 30 | 30 | 30 | 33.3% | - |  |
| time | time.now | ps | 22476 | 22512 | 22450 | 22476 | 0.3% | - |  |
| time | time.sleep_late.1us | ns | 53603 | 53623 | 53603 | 53603 | 0.0% | 61589 |  |
| time | time.sleep_late.10us | ns | 53580 | 53590 | 53581 | 53581 | 0.0% | 61936 |  |
| time | time.sleep_late.100us | ns | 60403 | 60374 | 60364 | 60374 | 0.1% | 61736 |  |
| time | time.sleep_late.1ms | ns | 70676 | 69727 | 70790 | 70676 | 1.5% | 106356 |  |
| time | time.sleep_late.10ms | ns | 100917 | 341720 | 344415 | 341720 | 71.3% | 440287 |  |
| time | time.timer_1ms.late | ns | 96706 | 61595 | 61635 | 61635 | 57.0% | 62471 |  |
| time | time.sleep_late.1us.slack1ns | ns | 4912 | 12165 | 11984 | 11984 | 60.5% | 16734 |  |
| time | time.sleep_late.10us.slack1ns | ns | 7854 | 3556 | 10508 | 7854 | 88.5% | 12342 |  |
| time | time.sleep_late.100us.slack1ns | ns | 10549 | 10389 | 10480 | 10480 | 1.5% | 16540 |  |
| time | time.sleep_late.1ms.slack1ns | ns | 11665 | 11646 | 11697 | 11665 | 0.4% | 21262 |  |
| time | time.sleep_late.10ms.slack1ns | ns | 296306 | 294681 | 51941 | 294681 | 82.9% | 424888 |  |
| time | time.timer_1ms.late.slack1ns | ns | 18119 | 11578 | 11603 | 11603 | 56.4% | 12208 |  |
| time | time.yield | ps | 543770 | 546172 | 544481 | 544481 | 0.4% | - |  |
| work | work.compress_inproc | ns | 425659524 | 426271421 | 424924027 | 425659524 | 0.3% | - |  |
| work | work.build_shaped.j1 | ns | 1067804459 | 780589135 | 1695717647 | 1067804459 | 85.7% | - |  |
| work | work.build_shaped.j16 | ns | 127326881 | 130727368 | 124468804 | 127326881 | 4.9% | - |  |
| tail | tail.wake.periodic.60s | ns | 60826 | 60838 | 60818 | 60826 | 0.0% | 62166 |  |
| tail | tail.stolen.10s | ns | 32381 | 33043 | 37160 | 33043 | 14.5% | 6004961 |  |
| nvme | nvme.read.4k.random | | | | | unmeasured: /dev/nvme0n1 opened read-only was refused (Permission denied (os error 13)): `sudo osbench nvme` reads it | | | |
| nvme | nvme.read.1m.seq | | | | | unmeasured: /dev/nvme0n1 opened read-only was refused (Permission denied (os error 13)): `sudo osbench nvme` reads it | | | |
| lan | lan | | | | | refused: no osbench-peer answered on the link within 60s | | | |
| crunch | crunch.single.deflate | ns | 63255667 | 62927077 | 66200064 | 63255667 | 5.2% | - | units_per_s=15.683, 15.804, 15.278; hottest_c=76.625, 69.375, 68.75 |
| crunch | crunch.single.sha256 | ns | 495999 | 496020 | 495780 | 495999 | 0.0% | 500419 | units_per_s=2014.971, 2011.977, 2018.111; hottest_c=76.625, 69.5, 68.75 |
| crunch | crunch.single.matmul | ns | 897369 | 906076 | 896930 | 897369 | 1.0% | 914502 | units_per_s=1112.445, 1102.324, 1114.194; hottest_c=80.5, 87.375, 78.375 |
| crunch | crunch.single.parse | ns | 72659067 | 72295170 | 72571503 | 72571503 | 0.5% | - | units_per_s=13.741, 13.769, 13.756; hottest_c=80.5, 87.5, 78.375 |
| crunch | crunch.all.deflate | ns | 138576838 | 138377057 | 138312533 | 138377057 | 0.2% | 141927524 | units_per_s=118.574, 119.316, 119.676; hottest_c=77.875, 78.75, 77.375 |
| crunch | crunch.all.sha256 | ns | 671442 | 667986 | 669569 | 669569 | 0.5% | 688154 | units_per_s=23760.919, 23921.280, 23889.546; hottest_c=82.5, 84.375, 84.25 |
| crunch | crunch.all.matmul | ns | 3275914 | 3358995 | 3375558 | 3358995 | 3.0% | 4318228 | units_per_s=5058.887, 4758.966, 4748.822; hottest_c=85.25, 84.375, 84.25 |
| crunch | crunch.all.parse | ns | 3086842298 | 3068183823 | 3091110140 | 3086842298 | 0.7% | - | units_per_s=5.103, 5.105, 5.098; hottest_c=85.25, 84.375, 84.25 |
| persist | persist.write_4k_fsync | ns | 3501121 | 3064978 | 3537035 | 3501121 | 13.5% | 3939846 |  |
| persist | persist.fsync_clean | ns | 55886 | 64913 | 54884 | 55886 | 17.9% | 81946 |  |
| persist | persist.append_4k_fsync | ns | 3763518 | 3202068 | 3711165 | 3711165 | 15.1% | 7119927 |  |
| persist | persist.create_fsync_unlink | ns | 3295161 | 3154377 | 3310425 | 3295161 | 4.7% | - |  |
| persist | persist.seq_write_fsync | MB/s | 504 | 528 | 525 | 525 | 4.6% | - |  |
| persist | persist.seq_read_cached | MB/s | 9519 | 10813 | 10792 | 10792 | 12.0% | - |  |
