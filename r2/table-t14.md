## t14

Three unprivileged `osbench all` runs at f644cefae. Each cell is a run's p50; the median is of the three p50s, and spread is (max - min) / median of them. `cpu.clock` lines are omitted.

Conditions: kernel=6.8.0-147-generic; distro=Ubuntu_24.04.5_LTS; cpu_model=11th_Gen_Intel(R)_Core(TM)_i5-1135G7_@_2.40GHz; cpus=8; threads_per_core=2; governor=powersave*8; epp=balance_performance*8; cpufreq_driver=intel_pstate*8; ac_online=1; thp=madvise; smt_active=1; crunch.sensor=coretemp_Package_id_0; crunch.stop_c=85; crunch.limit_from=the_sensor's_critical_temperature; dmi.product_version=ThinkPad_T14_Gen_2i; dmi.bios_version=N34ET71W_(1.71_)

| group | bench | unit | run 1 | run 2 | run 3 | median | spread | p99 median | runs 1, 2, 3 |
|---|---|---|---|---|---|---|---|---|---|
| energy | energy.idle_60s.package | | | | | unmeasured: energy uj was refused (Permission denied (os error 13)): `sudo osbench energy` reads it | | | |
| system | cpu.chunk | ns | 2994 | 2995 | 2994 | 2994 | 0.0% | 3004 |  |
| system | syscall.null | ps | 91749 | 91833 | 91650 | 91749 | 0.2% | - |  |
| system | thread.spawn_join | ns | 25416 | 25368 | 25250 | 25368 | 0.7% | 48128 |  |
| system | process.spawn_wait | ns | 142117 | 140216 | 142703 | 142117 | 1.7% | 251222 |  |
| system | pipe.throughput.64 | MB/s | 168 | 169 | 166 | 168 | 1.8% | - |  |
| system | pipe.throughput.256 | MB/s | 656 | 645 | 642 | 645 | 2.2% | - |  |
| system | pipe.throughput.1024 | MB/s | 1815 | 1786 | 1736 | 1786 | 4.4% | - |  |
| system | pipe.throughput.4096 | MB/s | 4172 | 4155 | 4135 | 4155 | 0.9% | - |  |
| system | pipe.throughput.16384 | MB/s | 3877 | 3850 | 3787 | 3850 | 2.3% | - |  |
| system | pipe.throughput.65536 | MB/s | 4158 | 4166 | 4052 | 4158 | 2.7% | - |  |
| system | mem.anon.map | ns/MiB | 95 | 95 | 87 | 95 | 8.4% | - |  |
| system | mem.anon.touch | ns/MiB | 235784 | 234207 | 234840 | 234840 | 0.7% | - |  |
| system | mem.anon.unmap | ns/MiB | 23272 | 23466 | 23837 | 23466 | 2.4% | - |  |
| system | mem.anon.total | ns/MiB | 259114 | 258028 | 258774 | 258774 | 0.4% | - |  |
| system | mem.map_unmap_4k | ns | 2168 | 2156 | 2163 | 2163 | 0.6% | 3598 |  |
| system | mem.bw.read | MB/s | 18083 | 17691 | 18182 | 18083 | 2.7% | - |  |
| system | mem.bw.write | MB/s | 9379 | 9338 | 9387 | 9379 | 0.5% | - |  |
| system | mem.bw.copy | MB/s | 6772 | 6911 | 6760 | 6772 | 2.2% | - |  |
| sched | cpu.chunk | ns | 2995 | 2995 | 2994 | 2995 | 0.0% | 3004 |  |
| sched | wake.periodic.idle | ns | 67766 | 69268 | 69559 | 69268 | 2.6% | 70552 |  |
| sched | wake.periodic.loaded | ns | 52356 | 52443 | 52370 | 52370 | 0.2% | 52694 |  |
| sched | wake.periodic.idle.slack1ns | ns | 17530 | 19587 | 17574 | 17574 | 11.7% | 19412 |  |
| sched | wake.periodic.loaded.slack1ns | ns | 2355 | 2369 | 2370 | 2369 | 0.6% | 2696 |  |
| sched | wake.onto_busy | ns | 2485 | 2196 | 2491 | 2485 | 11.9% | 6046 |  |
| sched | wake.storm.call.w1 | ns | 4151 | 5520 | 3688 | 4151 | 44.1% | - |  |
| sched | wake.storm.drain.w1 | ns | 104872 | 29675 | 94978 | 94978 | 79.2% | - |  |
| sched | wake.storm.call.w4 | ns | 11623 | 9637 | 12116 | 11623 | 21.3% | - |  |
| sched | wake.storm.drain.w4 | ns | 119372 | 121431 | 122983 | 121431 | 3.0% | - |  |
| sched | wake.storm.call.w16 | ns | 65341 | 62923 | 61722 | 62923 | 5.8% | - |  |
| sched | wake.storm.drain.w16 | ns | 989269 | 370320 | 1040794 | 989269 | 67.8% | - |  |
| sched | wake.storm.call.w64 | ns | 270819 | 257507 | 258127 | 258127 | 5.2% | - |  |
| sched | wake.storm.drain.w64 | ns | 320980 | 269849 | 281581 | 281581 | 18.2% | - |  |
| sched | pingpong.pipe.same_cpu | ns | 4091 | 7311 | 4594 | 4594 | 70.1% | 9908 |  |
| sched | pingpong.futex.same_cpu | ns | 2217 | 2288 | 2200 | 2217 | 4.0% | 2531 |  |
| sched | pingpong.pipe.cross_core | ns | 3686 | 3970 | 3688 | 3688 | 7.7% | 4974 |  |
| sched | pingpong.futex.cross_core | ns | 3329 | 3331 | 3360 | 3331 | 0.9% | 4362 |  |
| fair | cpu.chunk | ns | 2994 | 2994 | 2994 | 2994 | 0.0% | 3003 |  |
| fair | fair.flat | permille | 454 | 450 | 446 | 450 | 1.8% | - |  |
| fair | fair.flat.total | chunks/s | 2393276 | 1682758 | 1679974 | 1682758 | 42.4% | - |  |
| fair | fair.session | permille | 445 | 442 | 456 | 445 | 3.1% | - |  |
| fair | fair.session.total | chunks/s | 1701656 | 1704232 | 1705534 | 1704232 | 0.2% | - |  |
| fair | fair.scope | permille | 420 | 422 | 420 | 420 | 0.5% | - |  |
| fair | fair.scope.total | chunks/s | 1727936 | 1719505 | 1716818 | 1719505 | 0.6% | - |  |
| files | fs.shm.open_close | ns | 3356 | 3599 | 3375 | 3375 | 7.2% | 3464 |  |
| files | fs.shm.stat | ns | 1745 | 1761 | 1761 | 1761 | 0.9% | 1828 |  |
| files | fs.shm.create_write_unlink | ns | 8600 | 8519 | 10463 | 8600 | 22.6% | 18990 |  |
| files | fs.shm.read_4k_at | ns | 684 | 700 | 743 | 700 | 8.4% | 1429 |  |
| files | fs.shm.write_4k_at | ns | 590 | 615 | 637 | 615 | 7.6% | 1212 |  |
| files | fs.shm.readdir.1000 | ns | 177505 | 176033 | 176941 | 176941 | 0.8% | - |  |
| files | fs.shm.rename | ns | 1622 | 1607 | 1614 | 1614 | 0.9% | 2069 |  |
| files | fs.shm.mkdir_rmdir | ns | 2225 | 2191 | 2201 | 2201 | 1.5% | 3555 |  |
| files | fs.shm.tree.100 | ns | 535721 | 533223 | 534587 | 534587 | 0.5% | - |  |
| files | fs.shm.seq_write.4096 | MB/s | 3617 | 3611 | 3599 | 3611 | 0.5% | - |  |
| files | fs.shm.seq_read.4096 | MB/s | 8226 | 8029 | 7998 | 8029 | 2.8% | - |  |
| files | fs.shm.seq_write.1048576 | MB/s | 4572 | 4557 | 4545 | 4557 | 0.6% | - |  |
| files | fs.shm.seq_read.1048576 | MB/s | 9216 | 8757 | 8810 | 8810 | 5.2% | - |  |
| ipc | ipc.reqrep.8 | ns | 3453 | 3935 | 3651 | 3651 | 13.2% | 6028 |  |
| ipc | ipc.reqrep.4096 | ns | 7736 | 7657 | 7666 | 7666 | 1.0% | 9067 |  |
| ipc | ipc.reqrep.65536 | ns | 19120 | 19061 | 19140 | 19120 | 0.4% | 21261 |  |
| ipc | ipc.reqrep_handle.8 | ns | 7362 | 7291 | 7382 | 7362 | 1.2% | 8946 |  |
| ipc | ipc.connect_accept | ns | 3811 | 3823 | 3813 | 3813 | 0.3% | 7443 |  |
| net | net.tcp.connect_accept_close | ns | 20915 | 21019 | 20902 | 20915 | 0.6% | 26510 |  |
| net | net.tcp.reqrep.64 | ns | 8737 | 8810 | 8893 | 8810 | 1.8% | 11531 |  |
| net | net.tcp.stream.1 | MB/s | 1 | 1 | 1 | 1 | 0.0% | - |  |
| net | net.tcp.stream.65536 | MB/s | 6704 | 6709 | 6762 | 6709 | 0.9% | - |  |
| net | net.udp.reqrep.64 | ns | 7270 | 7231 | 7305 | 7270 | 1.0% | 8916 |  |
| procs | proc.spawn_wait.tiny | ns | 51182 | 51996 | 52955 | 51996 | 3.4% | 122423 |  |
| procs | proc.spawn_wait.large | ns | 54985 | 54457 | 55105 | 54985 | 1.2% | 141894 |  |
| procs | proc.spawn_wait_loop.100 | ns | 5448050 | 5402642 | 5421590 | 5421590 | 0.8% | - |  |
| procs | proc.posix_spawn_wait.tiny | ns | 44251 | 43266 | 44227 | 44227 | 2.2% | 87928 |  |
| procs | proc.posix_spawn_wait.std | ns | 133124 | 132254 | 132266 | 132266 | 0.7% | 249334 |  |
| procs | thread.spawn_join.default | ns | 25413 | 25504 | 25258 | 25413 | 1.0% | 41157 |  |
| procs | thread.spawn_join.stack64k | ns | 23742 | 23453 | 23434 | 23453 | 1.3% | 38916 |  |
| mem | mem.memcpy.64 | MB/s | 6198 | 6199 | 6215 | 6199 | 0.3% | - |  |
| mem | mem.memcpy.256 | MB/s | 24767 | 24940 | 24900 | 24900 | 0.7% | - |  |
| mem | mem.memcpy.1024 | MB/s | 77916 | 77914 | 78798 | 77916 | 1.1% | - |  |
| mem | mem.memcpy.4096 | MB/s | 151425 | 154920 | 156727 | 154920 | 3.4% | - |  |
| mem | mem.memcpy.16384 | MB/s | 175585 | 195234 | 206649 | 195234 | 15.9% | - |  |
| mem | mem.memcpy.65536 | MB/s | 55003 | 54995 | 55103 | 55003 | 0.2% | - |  |
| mem | mem.memcpy.262144 | MB/s | 55594 | 55585 | 55615 | 55594 | 0.1% | - |  |
| mem | mem.memcpy.1048576 | MB/s | 25711 | 25469 | 25893 | 25711 | 1.6% | - |  |
| mem | mem.memcpy.4194304 | MB/s | 20787 | 25235 | 20941 | 20941 | 21.2% | - |  |
| mem | mem.memcpy.16777216 | MB/s | 10870 | 10923 | 10739 | 10870 | 1.7% | - |  |
| mem | mem.memcpy.67108864 | MB/s | 9617 | 9614 | 9588 | 9614 | 0.3% | - |  |
| mem | mem.first_touch.4k | ns/page | 921 | 917 | 923 | 921 | 0.7% | - |  |
| mem | mem.map_touch_unmap.4k | ns/page | 1007 | 1009 | 1013 | 1009 | 0.6% | - |  |
| mem | mem.first_touch.2m | ns/page | 196873 | 195991 | 195473 | 195991 | 0.7% | - |  |
| mem | mem.map_touch_unmap.2m | ns/page | 200258 | 199332 | 198946 | 199332 | 0.7% | - |  |
| mem | mem.mprotect.4k | ns | 1016 | 1018 | 1016 | 1016 | 0.2% | 2026 |  |
| mem | mem.munmap_part.4k | ns | 1253 | 1265 | 1247 | 1253 | 1.4% | 1813 |  |
| mem | mem.munmap_touched_remote.4k | ns | 2266 | 2251 | 2245 | 2251 | 0.9% | 3778 | munmaps_per_s=432812, 442464, 437141; windows_refused=0/10, 0/10, 0/10 |
| mem | mem.malloc_churn.16.t1 | kops/s | 33575 | 33509 | 33399 | 33509 | 0.5% | - |  |
| mem | mem.malloc_churn.16.t8 | kops/s | 3176 | 3186 | 2573 | 3176 | 19.3% | - |  |
| mem | mem.malloc_churn.4096.t1 | kops/s | 19980 | 19082 | 21411 | 19980 | 11.7% | - |  |
| mem | mem.malloc_churn.4096.t8 | kops/s | 857 | 851 | 860 | 857 | 1.1% | - |  |
| mem | mem.malloc_churn.1048576.t1 | kops/s | 172 | 173 | 164 | 172 | 5.2% | - |  |
| mem | mem.malloc_churn.1048576.t8 | kops/s | 91 | 92 | 92 | 92 | 1.1% | - |  |
| mem | mem.realloc_grow.1m_256m | ns | 192 | 194 | 199 | 194 | 3.6% | - |  |
| mem | mem.realloc_grow.last_128m_256m | ns | 25 | 24 | 26 | 25 | 8.0% | - |  |
| time | time.now | ps | 14300 | 14307 | 14309 | 14307 | 0.1% | - |  |
| time | time.sleep_late.1us | ns | 51814 | 51838 | 51829 | 51829 | 0.0% | 51981 |  |
| time | time.sleep_late.10us | ns | 51813 | 51835 | 51831 | 51831 | 0.0% | 51979 |  |
| time | time.sleep_late.100us | ns | 51869 | 51870 | 51862 | 51869 | 0.0% | 68854 |  |
| time | time.sleep_late.1ms | ns | 71995 | 71776 | 71476 | 71776 | 0.7% | 210896 |  |
| time | time.sleep_late.10ms | ns | 213347 | 213504 | 213054 | 213347 | 0.2% | 272052 |  |
| time | time.timer_1ms.late | ns | 70195 | 70465 | 70482 | 70465 | 0.4% | 70979 |  |
| time | time.sleep_late.1us.slack1ns | ns | 4268 | 4332 | 4366 | 4332 | 2.3% | 6787 |  |
| time | time.sleep_late.10us.slack1ns | ns | 1822 | 1827 | 1826 | 1826 | 0.3% | 2151 |  |
| time | time.sleep_late.100us.slack1ns | ns | 1817 | 1841 | 1828 | 1828 | 1.3% | 17483 |  |
| time | time.sleep_late.1ms.slack1ns | ns | 20298 | 20479 | 20487 | 20479 | 0.9% | 93072 |  |
| time | time.sleep_late.10ms.slack1ns | ns | 165902 | 172404 | 165149 | 165902 | 4.4% | 271151 |  |
| time | time.timer_1ms.late.slack1ns | ns | 20339 | 20396 | 20532 | 20396 | 0.9% | 21118 |  |
| time | time.yield | ps | 192344 | 190371 | 190392 | 190392 | 1.0% | - |  |
| work | work.compress_inproc | ns | 361518827 | 361729201 | 361018519 | 361518827 | 0.2% | - |  |
| work | work.build_shaped.j1 | ns | 994855997 | 939427649 | 995684358 | 994855997 | 5.7% | - |  |
| work | work.build_shaped.j8 | ns | 97186040 | 98111923 | 96110525 | 97186040 | 2.1% | - |  |
| tail | tail.wake.periodic.60s | ns | 67731 | 69530 | 56440 | 67731 | 19.3% | 70680 |  |
| tail | tail.stolen.10s | ns | 38491 | 41439 | 32185 | 38491 | 24.0% | - |  |
| nvme | nvme.read.4k.random | | | | | unmeasured: /dev/nvme0n1 opened read-only was refused (Permission denied (os error 13)): `sudo osbench nvme` reads it | | | |
| nvme | nvme.read.1m.seq | | | | | unmeasured: /dev/nvme0n1 opened read-only was refused (Permission denied (os error 13)): `sudo osbench nvme` reads it | | | |
| lan | lan | | | | | refused: no osbench-peer answered on the link within 60s | | | |
| crunch | crunch.single.deflate | ns | 54695312 | 54799046 | 54703090 | 54703090 | 0.2% | - | units_per_s=18.276, 18.246, 18.273; hottest_c=56, 60, 53 |
| crunch | crunch.single.sha256 | ns | 570679 | 570969 | 570614 | 570679 | 0.1% | 581301 | units_per_s=1754.060, 1752.709, 1753.758; hottest_c=67, 60, 65 |
| crunch | crunch.single.matmul | ns | 1002150 | 1009217 | 1023826 | 1009217 | 2.1% | 1029752 | units_per_s=997.707, 989.746, 975.845; hottest_c=67, 72, 71 |
| crunch | crunch.single.parse | ns | 59194018 | 59267105 | 59238239 | 59238239 | 0.1% | - | units_per_s=16.876, 16.862, 16.872; hottest_c=70, 72, 71 |
| crunch | crunch.all.deflate | ns | 89750469 | 89816767 | 89731326 | 89750469 | 0.1% | 94014912 | units_per_s=88.930, 88.634, 88.835; hottest_c=75, 75, 72 |
| crunch | crunch.all.sha256 | ns | 1951919 | 1857362 | 1942444 | 1942444 | 4.9% | 2078004 | units_per_s=4457.392, 5033.831, 4884.529; hottest_c=77, 76, 77 |
| crunch | crunch.all.matmul | ns | 5086891 | 5139742 | 5220640 | 5139742 | 2.6% | 5575363 | units_per_s=1566.574, 1546.856, 1534.966; hottest_c=77, 76, 77 |
| crunch | crunch.all.parse | ns | 2779491190 | 2811530253 | 2861562602 | 2811530253 | 2.9% | - | units_per_s=2.807, 2.794, 2.789; hottest_c=77, 76, 77 |
| persist | persist.write_4k_fsync | ns | 1001322 | 1043925 | 1068258 | 1043925 | 6.4% | 1322626 |  |
| persist | persist.fsync_clean | ns | 29327 | 29530 | 29485 | 29485 | 0.7% | 34658 |  |
| persist | persist.append_4k_fsync | ns | 917795 | 899178 | 905833 | 905833 | 2.1% | 1453229 |  |
| persist | persist.create_fsync_unlink | ns | 958160 | 961019 | 955574 | 958160 | 0.6% | - |  |
| persist | persist.seq_write_fsync | MB/s | 501 | 568 | 508 | 508 | 13.2% | - |  |
| persist | persist.seq_read_cached | MB/s | 8918 | 9206 | 7678 | 8918 | 17.1% | - |  |
