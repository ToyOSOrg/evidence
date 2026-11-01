## AMD_Ryzen_7_4800U_with_Radeon_Graphics

Runs: Linux 2, ToyOS 1. lan.peer_link: none. internet.link: none.

Linux setup: kernel=6.8.0-147-generic, cpufreq_driver=acpi-cpufreq*16, governor=schedutil*16, epp=absent*16, min_khz=1400000*16, max_khz=1800000*16, boost=1, intel_no_turbo=absent, platform_profile=balanced, smt_active=1, fs.mem.served_by=tmpfs,_through_the_VFS, fs.disk.served_by=ext4,_NVMe_disk,_model_<machine>,_write_cache_write_back, persist.served_by=ext4,_NVMe_disk,_model_<machine>,_write_cache_write_back.

Linux per run: clocksource=hpet,tsc.

ToyOS setup: fs.mem.served_by=the_kernel's_tmpfs,_through_syscalls, fs.disk.served_by=DATA_volume,_bcachefs_crate's_format,_DATA_file_server_over_the_block_service, persist.served_by=DATA_volume,_bcachefs_crate's_format,_DATA_file_server_over_the_block_service.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.chunk@fair | ns | 4330, 2970 | 3650 | 37.3% | 2936 | 2936 | 0.0% | 0.80 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.chunk@sched | ns | 4330, 2949 | 3640 | 37.9% | 2936 | 2936 | 0.0% | 0.81 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.chunk@system | ns | 4330, 2935 | 3632 | 38.4% | 2916 | 2916 | 0.0% | 0.80 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@boot | MHz | 1375, 1391 | 1383 | 1.2% | 4217 | 4217 | 0.0% | 3.05 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@crunch | MHz | 4286, 1397 | 2842 | 101.7% | 4267 | 4267 | 0.0% | 1.50 | 1.000 | too few runs to resolve (least p 0.667) |
| cpu.clock@fair | MHz | 4286, 1395 | 2840 | 101.8% | 4242 | 4242 | 0.0% | 1.49 | 1.000 | too few runs to resolve (least p 0.667) |
| cpu.clock@files | MHz | 4207, 1396 | 2802 | 100.3% | 4141 | 4141 | 0.0% | 1.48 | 1.000 | too few runs to resolve (least p 0.667) |
| cpu.clock@identity | MHz | 1370, 4275 | 2822 | 102.9% | 4267 | 4267 | 0.0% | 1.51 | 1.000 | too few runs to resolve (least p 0.667) |
| cpu.clock@ipc | MHz | 4223, 1396 | 2810 | 100.6% | 4217 | 4217 | 0.0% | 1.50 | 1.000 | too few runs to resolve (least p 0.667) |
| cpu.clock@mem | MHz | 1371, 1396 | 1384 | 1.8% | 4241 | 4241 | 0.0% | 3.07 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@net | MHz | 1371, 4240 | 2806 | 102.3% | 4241 | 4241 | 0.0% | 1.51 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@nvme | MHz | 1371, 1397 | 1384 | 1.9% | 4291 | 4291 | 0.0% | 3.10 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@persist | MHz | 1373, 1397 | 1385 | 1.7% | 4291 | 4291 | 0.0% | 3.10 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@procs | MHz | 1372, 1397 | 1384 | 1.8% | 4217 | 4217 | 0.0% | 3.05 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@sched | MHz | 4282, 4287 | 4284 | 0.1% | 4267 | 4267 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@system | MHz | 1371, 4277 | 2824 | 102.9% | 4266 | 4266 | 0.0% | 1.51 | 1.000 | too few runs to resolve (least p 0.667) |
| cpu.clock@tail | MHz | 1371, 4291 | 2831 | 103.1% | 4192 | 4192 | 0.0% | 1.48 | 1.000 | too few runs to resolve (least p 0.667) |
| cpu.clock@time | MHz | 4248, 1397 | 2822 | 101.0% | 4192 | 4192 | 0.0% | 1.49 | 1.000 | too few runs to resolve (least p 0.667) |
| cpu.clock@work | MHz | 4282, 4291 | 4286 | 0.2% | 4267 | 4267 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.all.deflate | ns | 149387508, 147365213 | 148376360 | 1.4% |  | - | - | - | - | ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.matmul |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.parse |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.sha256 | ns | 558798, 539512 | 549155 | 3.5% |  | - | - | - | - | ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.single.deflate | ns | 67431102, 63609348 | 65520225 | 5.8% | 64445133 | 64445133 | 0.0% | 0.98 | 1.000 | too few runs to resolve (least p 0.667) |
| crunch.single.matmul | ns | 1039864, 1006687 | 1023276 | 3.2% | 953881 | 953881 | 0.0% | 0.93 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.single.parse | ns |  | - | - | 40678262 | 40678262 | 0.0% | - | - | Linux 2 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit |
| crunch.single.sha256 | ns | 509770, 502051 | 505910 | 1.5% | 501673 | 501673 | 0.0% | 0.99 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.apart.build | permille | 62, 63 | 62 | 1.6% | 63 | 63 | 0.0% | 1.01 | 1.000 | too few runs to resolve (least p 0.333) |
| fair.apart.helpers | permille | 396, 418 | 407 | 5.4% | 455 | 455 | 0.0% | 1.12 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.apart.threaded | permille | 540, 518 | 529 | 4.2% | 481 | 481 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.apart.total | chunks/s | 3266941, 4819760 | 4043350 | 38.4% | 5048973 | 5048973 | 0.0% | 1.25 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.session.build | permille | 32, 30 | 31 | 6.5% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.helpers | permille | 465, 467 | 466 | 0.4% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.threaded | permille | 500, 501 | 500 | 0.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.total | chunks/s | 3189529, 4709430 | 3949480 | 38.5% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.shared.build | permille | 30, 33 | 32 | 9.5% | 28 | 28 | 0.0% | 0.89 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.helpers | permille | 459, 464 | 462 | 1.1% | 491 | 491 | 0.0% | 1.06 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.threaded | permille | 507, 502 | 504 | 1.0% | 480 | 480 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.total | chunks/s | 3285482, 5041764 | 4163623 | 42.2% | 4030898 | 4030898 | 0.0% | 0.97 | 1.000 | too few runs to resolve (least p 0.667) |
| fs.disk.create_write_unlink | ns | 29124, 27415 | 28270 | 6.0% | 115431 | 115431 | 0.0% | 4.08 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.direct.fstat | ns |  | - | - | 9748 | 9748 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.disk.direct.pread_4k | ns |  | - | - | 10761 | 10761 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.disk.direct.read_4k_at | ns |  | - | - | 20179 | 20179 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.disk.direct.seek | ns |  | - | - | 9509 | 9509 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.disk.direct.stat | ns |  | - | - | 11542 | 11542 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.disk.fstat | ns | 1885, 491 | 1188 | 117.3% | 9919 | 9919 | 0.0% | 8.35 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.mkdir_rmdir | ns | 38622, 37185 | 37904 | 3.8% | 80384 | 80384 | 0.0% | 2.12 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.open_close | ns | 4400, 3057 | 3728 | 36.0% | 21672 | 21672 | 0.0% | 5.81 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.pread_4k | ns | 2374, 1232 | 1803 | 63.3% | 11191 | 11191 | 0.0% | 6.21 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.pread_8 | ns | 1886, 762 | 1324 | 84.9% | 10330 | 10330 | 0.0% | 7.80 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.read_4k | ns | 2374, 1252 | 1813 | 61.9% | 11142 | 11142 | 0.0% | 6.15 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.read_4k_at | ns | 2375, 1463 | 1919 | 47.5% | 11532 | 11532 | 0.0% | 6.01 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.readdir.1000 | ns | 443142, 442128 | 442635 | 0.2% | 693862 | 693862 | 0.0% | 1.57 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.rename | ns | 10895, 9339 | 10117 | 15.4% | 63282 | 63282 | 0.0% | 6.26 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seek | ns | 1397, 210 | 804 | 147.7% | 200 | 200 | 0.0% | 0.25 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_read.1048576 | MB/s | 11183, 11611 | 11397 | 3.8% | 4789 | 4789 | 0.0% | 0.42 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_read.4096 | MB/s | 4954, 5058 | 5006 | 2.1% | 364 | 364 | 0.0% | 0.07 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_write.1048576 | MB/s | 774, 800 | 787 | 3.3% | 340 | 340 | 0.0% | 0.43 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_write.4096 | MB/s | 701, 782 | 742 | 10.9% | 211 | 211 | 0.0% | 0.28 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.stat | ns | 2863, 1463 | 2163 | 64.7% | 12544 | 12544 | 0.0% | 5.80 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.tree.100 | ns | 3481436, 3428813 | 3455124 | 1.5% | 12733562 | 12733562 | 0.0% | 3.69 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.write_4k_at | ns | 2933, 1733 | 2333 | 51.4% | 12183 | 12183 | 0.0% | 5.22 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.create_write_unlink | ns | 14318, 13008 | 13663 | 9.6% | 10580 | 10580 | 0.0% | 0.77 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.fstat | ns | 1886, 491 | 1188 | 117.4% | 361 | 361 | 0.0% | 0.30 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.mkdir_rmdir | ns | 8102, 6694 | 7398 | 19.0% | 7574 | 7574 | 0.0% | 1.02 | 1.000 | too few runs to resolve (least p 0.667) |
| fs.mem.open_close | ns | 4330, 2927 | 3628 | 38.7% | 6062 | 6062 | 0.0% | 1.67 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.pread_4k | ns | 2305, 1122 | 1714 | 69.0% | 1192 | 1192 | 0.0% | 0.70 | 1.000 | too few runs to resolve (least p 0.667) |
| fs.mem.pread_8 | ns | 1886, 712 | 1299 | 90.4% | 410 | 410 | 0.0% | 0.32 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.read_4k | ns | 2305, 1033 | 1669 | 76.2% | 942 | 942 | 0.0% | 0.56 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.read_4k_at | ns | 2375, 1403 | 1889 | 51.5% | 1462 | 1462 | 0.0% | 0.77 | 1.000 | too few runs to resolve (least p 0.667) |
| fs.mem.readdir.1000 | ns | 280489, 277089 | 278789 | 1.2% | 1059484 | 1059484 | 0.0% | 3.80 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.rename | ns | 6006, 4540 | 5273 | 27.8% | 6382 | 6382 | 0.0% | 1.21 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seek | ns | 1397, 220 | 808 | 145.6% | 160 | 160 | 0.0% | 0.20 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_read.1048576 | MB/s | 8442, 8325 | 8384 | 1.4% | 8065 | 8065 | 0.0% | 0.96 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_read.4096 | MB/s | 5321, 5370 | 5346 | 0.9% | 5370 | 5370 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.333) |
| fs.mem.seq_write.1048576 | MB/s | 1493, 1491 | 1492 | 0.1% | 3377 | 3377 | 0.0% | 2.26 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_write.4096 | MB/s | 1258, 1264 | 1261 | 0.5% | 2739 | 2739 | 0.0% | 2.17 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.stat | ns | 2863, 1523 | 2193 | 61.1% | 2635 | 2635 | 0.0% | 1.20 | 1.000 | too few runs to resolve (least p 0.667) |
| fs.mem.tree.100 | ns | 1419343, 1425975 | 1422659 | 0.5% | 1369178 | 1369178 | 0.0% | 0.96 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.write_4k_at | ns | 2863, 1834 | 2348 | 43.8% | 1513 | 1513 | 0.0% | 0.64 | 0.667 | too few runs to resolve (least p 0.667) |
| identity.cpuidle |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_kernel_names_its_idle_states_to_no_program |
| identity.nvme |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_NVMe_driver_keeps_its_controller's_identity_and_no_right_reads_it_from_another_program |
| identity.usb |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: usbd_keeps_its_devices_and_no_right_reads_them_from_another_program |
| ipc.connect_accept | ns | 12501, 11024 | 11762 | 12.6% | 2795 | 2795 | 0.0% | 0.24 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.4096 | ns | 21372, 17749 | 19560 | 18.5% | 7664 | 7664 | 0.0% | 0.39 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.65536 | ns | 41277, 31028 | 36152 | 28.3% | 31671 | 31671 | 0.0% | 0.88 | 1.000 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.8 | ns | 14038, 7356 | 10697 | 62.5% | 6593 | 6593 | 0.0% | 0.62 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep_handle.8 | ns | 22838, 14903 | 18870 | 42.0% | 7916 | 7916 | 0.0% | 0.42 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.map | ns/MiB | 342, 286 | 314 | 17.8% | 381 | 381 | 0.0% | 1.21 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.total | ns/MiB | 531073, 528849 | 529961 | 0.4% | 132673 | 132673 | 0.0% | 0.25 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.touch | ns/MiB | 450041, 445998 | 448020 | 0.9% | 124958 | 124958 | 0.0% | 0.28 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.unmap | ns/MiB | 80854, 81928 | 81391 | 1.3% | 5406 | 5406 | 0.0% | 0.07 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.copy | MB/s | 8595, 8391 | 8493 | 2.4% | 8341 | 8341 | 0.0% | 0.98 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.read | MB/s | 19758, 19862 | 19810 | 0.5% | 19757 | 19757 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.write | MB/s | 9435, 9315 | 9375 | 1.3% | 9722 | 9722 | 0.0% | 1.04 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.first_touch.2m | ns/MiB | 132901, 131183 | 132042 | 1.3% | 129235 | 129235 | 0.0% | 0.98 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.first_touch.4k | ns/MiB | 441729, 444534 | 443132 | 0.6% | 129328 | 129328 | 0.0% | 0.29 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.1048576.t1 | kops/s | 96, 98 | 97 | 2.1% | 214 | 214 | 0.0% | 2.21 | 0.667 | too few runs to resolve (least p 0.667); settled clocks apart: Linux 2804 MHz, ToyOS 4216 MHz |
| mem.malloc_churn.1048576.t16 | kops/s | 65, 61 | 63 | 6.3% | 101 | 101 | 0.0% | 1.60 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.16.t1 | kops/s | 27822, 27943 | 27882 | 0.4% | 39248 | 39248 | 0.0% | 1.41 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.16.t16 | kops/s | 1749, 1772 | 1760 | 1.3% | 2977 | 2977 | 0.0% | 1.69 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.4096.t1 | kops/s | 20871, 21286 | 21078 | 2.0% | 38008 | 38008 | 0.0% | 1.80 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.4096.t16 | kops/s | 1588, 1578 | 1583 | 0.6% | 2398 | 2398 | 0.0% | 1.51 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_touch_unmap.2m | ns/MiB | 137244, 135595 | 136420 | 1.2% | 137212 | 137212 | 0.0% | 1.01 | 1.000 | too few runs to resolve (least p 0.667) |
| mem.map_touch_unmap.4k | ns/MiB | 512304, 514756 | 513530 | 0.5% | 135858 | 135858 | 0.0% | 0.26 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_unmap_4k | ns | 5378, 4002 | 4690 | 29.3% | 2284 | 2284 | 0.0% | 0.49 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.1024 | MB/s | 40738, 41135 | 40936 | 1.0% | 43791 | 43791 | 0.0% | 1.07 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.1048576 | MB/s | 11329, 11503 | 11416 | 1.5% | 10815 | 10815 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.16384 | MB/s | 72748, 74399 | 73574 | 2.2% | 87721 | 87721 | 0.0% | 1.19 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.16777216 | MB/s | 6063, 6045 | 6054 | 0.3% | 6169 | 6169 | 0.0% | 1.02 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.256 | MB/s | 16030, 16203 | 16116 | 1.1% | 14485 | 14485 | 0.0% | 0.90 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.262144 | MB/s | 35089, 34411 | 34750 | 2.0% | 37295 | 37295 | 0.0% | 1.07 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.4096 | MB/s | 84464, 85551 | 85008 | 1.3% | 88504 | 88504 | 0.0% | 1.04 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.4194304 | MB/s | 10714, 10699 | 10706 | 0.1% | 10859 | 10859 | 0.0% | 1.01 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.64 | MB/s | 6454, 6519 | 6486 | 1.0% | 3941 | 3941 | 0.0% | 0.61 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.65536 | MB/s | 65472, 66006 | 65739 | 0.8% | 66336 | 66336 | 0.0% | 1.01 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.67108864 | MB/s | 6077, 6150 | 6114 | 1.2% | 6246 | 6246 | 0.0% | 1.02 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.mprotect.4k | ns | 3352, 2144 | 2748 | 44.0% | 871 | 871 | 0.0% | 0.32 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.munmap_part.4k | ns | 4610, 3327 | 3968 | 32.3% | 1223 | 1223 | 0.0% | 0.31 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.munmap_touched_remote.4k | ns | 5657, 4590 | 5124 | 20.8% | 2925 | 2925 | 0.0% | 0.57 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.realloc_grow.1m_256m | ns | 217279, 203861 | 210570 | 6.4% | 41329 | 41329 | 0.0% | 0.20 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.realloc_grow.last_128m_256m | ns | 54058, 52391 | 53224 | 3.1% | 7664 | 7664 | 0.0% | 0.14 | 0.667 | too few runs to resolve (least p 0.667) |
| net.tcp.connect_accept_close | ns | 77316, 49307 | 63312 | 44.2% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.reqrep.64 | ns | 32407, 27339 | 29873 | 17.0% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.1 | MB/s | 0, 0 | 0 | - |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.65536 | MB/s | 2326, 2969 | 2648 | 24.3% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.udp.reqrep.64 | ns | 52940, 22278 | 37609 | 81.5% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| nvme.read.1m.seq |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| nvme.read.4k.random |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| persist.append_4k_fsync | ns | 3765339, 3751144 | 3758242 | 0.4% | 2714070 | 2714070 | 0.0% | 0.72 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.create_fsync_unlink | ns | 3087393, 3209014 | 3148204 | 3.9% | 3296207 | 3296207 | 0.0% | 1.05 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.fsync_clean | ns | 67676, 63539 | 65608 | 6.3% | 42301 | 42301 | 0.0% | 0.64 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.seq_read_cached | MB/s | 11217, 6629 | 8923 | 51.4% | 2579 | 2579 | 0.0% | 0.29 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.seq_write_fsync | MB/s | 518, 536 | 527 | 3.4% | 330 | 330 | 0.0% | 0.63 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.write_4k_fsync | ns | 3575581, 3548260 | 3561920 | 0.8% | 2449943 | 2449943 | 0.0% | 0.69 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.futex.cross_core | ns | 13479, 9785 | 11632 | 31.8% | 5781 | 5781 | 0.0% | 0.50 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.futex.same_cpu | ns | 7543, 6252 | 6898 | 18.7% | 5611 | 5611 | 0.0% | 0.81 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.pipe.cross_core | ns | 14457, 11361 | 12909 | 24.0% | 5641 | 5641 | 0.0% | 0.44 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.pipe.same_cpu | ns | 9080, 7697 | 8388 | 16.5% | 5591 | 5591 | 0.0% | 0.67 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.1024 | MB/s | 1688, 1830 | 1759 | 8.1% | 1749 | 1749 | 0.0% | 0.99 | 1.000 | too few runs to resolve (least p 0.667) |
| pipe.throughput.16384 | MB/s | 3636, 3669 | 3652 | 0.9% | 8398 | 8398 | 0.0% | 2.30 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.256 | MB/s | 413, 423 | 418 | 2.4% | 164 | 164 | 0.0% | 0.39 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.4096 | MB/s | 4883, 5627 | 5255 | 14.2% | 1781 | 1781 | 0.0% | 0.34 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.64 | MB/s | 106, 106 | 106 | 0.0% | 122 | 122 | 0.0% | 1.15 | 0.333 | too few runs to resolve (least p 0.333) |
| pipe.throughput.65536 | MB/s | 1461, 2708 | 2084 | 59.8% | 4893 | 4893 | 0.0% | 2.35 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.posix_spawn_wait.std | ns | 934627, 879492 | 907060 | 6.1% | 511132 | 511132 | 0.0% | 0.56 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.posix_spawn_wait.tiny | ns | 232016, 217197 | 224606 | 6.6% | 79513 | 79513 | 0.0% | 0.35 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait.large | ns | 283769, 118766 | 201268 | 82.0% | 181729 | 181729 | 0.0% | 0.90 | 1.000 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait.tiny | ns | 272873, 272087 | 272480 | 0.3% | 69042 | 69042 | 0.0% | 0.25 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait_loop.100 | ns | 33121364, 20939961 | 27030662 | 45.1% | 5432227 | 5432227 | 0.0% | 0.20 | 0.667 | too few runs to resolve (least p 0.667) |
| process.spawn_wait | ns | 928120, 323644 | 625882 | 96.6% | 440486 | 440486 | 0.0% | 0.70 | 1.000 | too few runs to resolve (least p 0.667) |
| syscall.null | ps | 159280, 158557 | 158918 | 0.5% | 49650 | 49650 | 0.0% | 0.31 | 0.667 | too few runs to resolve (least p 0.667) |
| tail.diag.periodic.30s | ns |  | - | - | 5357 | 5357 | 0.0% | - | - | Linux 2 run(s) absent |
| tail.stolen.10s | ns | 38971, 32516 | 35744 | 18.1% | 24457 | 24457 | 0.0% | 0.68 | 0.667 | too few runs to resolve (least p 0.667) |
| tail.wake.periodic.60s | ns | 73676, 60831 | 67254 | 19.1% | 5346 | 5346 | 0.0% | 0.08 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join | ns | 79130, 47474 | 63302 | 50.0% | 41169 | 41169 | 0.0% | 0.65 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join.default | ns | 80109, 71925 | 76017 | 10.8% | 42332 | 42332 | 0.0% | 0.56 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join.stack64k | ns | 74173, 66544 | 70358 | 10.8% | 41330 | 41330 | 0.0% | 0.59 | 0.667 | too few runs to resolve (least p 0.667) |
| time.now | ps | 1212875, 22644 | 617760 | 192.7% | 9405 | 9405 | 0.0% | 0.02 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.100us | ns | 73203, 60442 | 66822 | 19.1% | 4962 | 4962 | 0.0% | 0.07 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.100us.slack1ns | ns | 19077, 10425 | 14751 | 58.7% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10ms | ns | 148141, 342839 | 245490 | 79.3% | 53889 | 53889 | 0.0% | 0.22 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.10ms.slack1ns | ns | 313769, 290752 | 302260 | 7.6% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10us | ns | 68849, 53602 | 61226 | 24.9% | 1262 | 1262 | 0.0% | 0.02 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.10us.slack1ns | ns | 18983, 3554 | 11268 | 136.9% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1ms | ns | 97811, 78659 | 88235 | 21.7% | 5470 | 5470 | 0.0% | 0.06 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.1ms.slack1ns | ns | 24483, 11480 | 17982 | 72.3% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1us | ns | 61087, 53663 | 57375 | 12.9% | 1445 | 1445 | 0.0% | 0.03 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.1us.slack1ns | ns | 17996, 4910 | 11453 | 114.3% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.timer_1ms.late | ns | 74274, 61515 | 67894 | 18.8% | 46732 | 46732 | 0.0% | 0.69 | 0.667 | too few runs to resolve (least p 0.667) |
| time.timer_1ms.late.slack1ns | ns | 24225, 11511 | 17868 | 71.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.yield | ps | 549797, 553043 | 551420 | 0.6% |  | - | - | - | - | ToyOS 1 run(s) unsupported: no_yield_syscall:_std's_yield_now_is_a_spin-loop_hint |
| wake.onto_busy | ns | 10057, 5500 | 7778 | 58.6% | 15580 | 15580 | 0.0% | 2.00 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle | ns | 70370, 61103 | 65736 | 14.1% | 32881 | 32881 | 0.0% | 0.50 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle.slack1ns | ns | 23724, 10924 | 17324 | 73.9% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.periodic.loaded | ns | 59186, 55651 | 57418 | 6.2% | 3767 | 3767 | 0.0% | 0.07 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.loaded.slack1ns | ns | 9344, 4877 | 7110 | 62.8% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.storm.call.w1 | ns | 10476, 4697 | 7586 | 76.2% | 7735 | 7735 | 0.0% | 1.02 | 1.000 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w16 | ns | 44489, 43015 | 43752 | 3.4% | 15590 | 15590 | 0.0% | 0.36 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w4 | ns | 14387, 12224 | 13306 | 16.3% | 9658 | 9658 | 0.0% | 0.73 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w64 | ns | 251498, 243086 | 247292 | 3.4% | 25088 | 25088 | 0.0% | 0.10 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w1 | ns | 87232, 45734 | 66483 | 62.4% | 61098 | 61098 | 0.0% | 0.92 | 1.000 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w16 | ns | 123060, 103774 | 113417 | 17.0% | 75595 | 75595 | 0.0% | 0.67 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w4 | ns | 85556, 78181 | 81868 | 9.0% | 66086 | 66086 | 0.0% | 0.81 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w64 | ns | 728026, 816793 | 772410 | 11.5% | 240080 | 240080 | 0.0% | 0.31 | 0.667 | too few runs to resolve (least p 0.667) |
| work.build_shaped.j1 | ns | 1692961471, 1588168970 | 1640565220 | 6.4% | 892989761 | 892989761 | 0.0% | 0.54 | 0.667 | too few runs to resolve (least p 0.667) |
| work.build_shaped.j16 | ns | 141982973, 143600927 | 142791950 | 1.1% | 257192854 | 257192854 | 0.0% | 1.80 | 0.667 | too few runs to resolve (least p 0.667) |
| work.compress_inproc | ns | 441760261, 439784138 | 440772200 | 0.4% | 444690978 | 444690978 | 0.0% | 1.01 | 0.667 | too few runs to resolve (least p 0.667) |

Each p is its row's alone, uncorrected for the table's other rows.

