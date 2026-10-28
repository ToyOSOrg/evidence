## AMD_Ryzen_7_4800U_with_Radeon_Graphics

Runs: Linux 2, ToyOS 1. lan.peer_link: none. internet.link: none.

Linux setup: kernel=6.8.0-147-generic, cpufreq_driver=acpi-cpufreq*16, governor=schedutil*16, epp=absent*16, min_khz=1400000*16, max_khz=1800000*16, boost=1, intel_no_turbo=absent, platform_profile=balanced, smt_active=1, fs.mem.served_by=tmpfs,_through_the_VFS, fs.disk.served_by=ext4,_NVMe_disk,_model_SAMSUNG_MZVLB1T0HBLR-000L2,_write_cache_write_back, persist.served_by=ext4,_NVMe_disk,_model_SAMSUNG_MZVLB1T0HBLR-000L2,_write_cache_write_back.

Linux per run: clocksource=tsc,tsc.

ToyOS setup: fs.mem.served_by=the_kernel's_tmpfs,_through_syscalls, fs.disk.served_by=DATA_volume,_bcachefs_crate's_format,_DATA_file_server_over_the_block_service, persist.served_by=DATA_volume,_bcachefs_crate's_format,_DATA_file_server_over_the_block_service.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.chunk@fair | ns | 2926, 2977 | 2952 | 1.7% | 2916 | 2916 | 0.0% | 0.99 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.chunk@sched | ns | 2926, 2926 | 2926 | 0.0% | 2916 | 2916 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.chunk@system | ns | 2926, 2926 | 2926 | 0.0% | 2916 | 2916 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@boot | MHz | 1397, 4291 | 2844 | 101.8% | 4241 | 4241 | 0.0% | 1.49 | 1.000 | too few runs to resolve (least p 0.667) |
| cpu.clock@crunch | MHz | 1397, 1444 | 1420 | 3.3% | 4266 | 4266 | 0.0% | 3.00 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@energy | MHz | 1397, 4291 | 2844 | 101.8% | 4291 | 4291 | 0.0% | 1.51 | 1.000 | too few runs to resolve (least p 0.333) |
| cpu.clock@fair | MHz | 1397, 4246 | 2822 | 101.0% | 4266 | 4266 | 0.0% | 1.51 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@files | MHz | 1449, 1396 | 1422 | 3.7% | 4116 | 4116 | 0.0% | 2.89 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@identity | MHz | 4291, 4291 | 4291 | 0.0% | 4266 | 4266 | 0.0% | 0.99 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@ipc | MHz | 1397, 1696 | 1546 | 19.3% | 4217 | 4217 | 0.0% | 2.73 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@mem | MHz | 1397, 1397 | 1397 | 0.0% | 4241 | 4241 | 0.0% | 3.04 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@net | MHz | 1397, 4240 | 2818 | 100.9% | 4241 | 4241 | 0.0% | 1.50 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@nvme | MHz | 4291, 4290 | 4290 | 0.0% | 4291 | 4291 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.333) |
| cpu.clock@persist | MHz | 1397, 1397 | 1397 | 0.0% | 4291 | 4291 | 0.0% | 3.07 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@procs | MHz | 1397, 4240 | 2818 | 100.9% | 4241 | 4241 | 0.0% | 1.50 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@sched | MHz | 1397, 1397 | 1397 | 0.0% | 4291 | 4291 | 0.0% | 3.07 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@system | MHz | 1397, 4291 | 2844 | 101.8% | 4291 | 4291 | 0.0% | 1.51 | 1.000 | too few runs to resolve (least p 0.333) |
| cpu.clock@tail | MHz | 4291, 1397 | 2844 | 101.8% | 4191 | 4191 | 0.0% | 1.47 | 1.000 | too few runs to resolve (least p 0.667) |
| cpu.clock@time | MHz | 1397, 1397 | 1397 | 0.0% | 4241 | 4241 | 0.0% | 3.04 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@work | MHz | 1397, 1397 | 1397 | 0.0% | 4290 | 4290 | 0.0% | 3.07 | 0.333 | too few runs to resolve (least p 0.333) |
| crunch.all.deflate | ns | 151446472, 152540162 | 151993317 | 0.7% |  | - | - | - | - | ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.matmul |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.parse |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.sha256 | ns | 540530, 563971 | 552250 | 4.2% |  | - | - | - | - | ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.single.deflate | ns | 66222586, 66663933 | 66443260 | 0.7% | 63144870 | 63144870 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.single.matmul | ns | 909075, 918648 | 913862 | 1.0% | 943909 | 943909 | 0.0% | 1.03 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.single.parse | ns | 71933795 | 71933795 | 0.0% | 41190020 | 41190020 | 0.0% | 0.57 | 1.000 | too few runs to resolve (least p 1.000); Linux 1 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit |
| crunch.single.sha256 | ns | 496397, 499288 | 497842 | 0.6% | 498781 | 498781 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.667) |
| energy.idle_60s.package |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: energy_uj_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_energy`_reads_it; ToyOS 1 run(s) unsupported: no_counter_carries_the_package's_energy:_toyos_abi::counters::Counter_has_none |
| fair.apart.build | permille | 63, 63 | 63 | 0.0% | 63 | 63 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 1.000) |
| fair.apart.helpers | permille | 426, 437 | 432 | 2.5% | 458 | 458 | 0.0% | 1.06 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.apart.threaded | permille | 510, 499 | 504 | 2.2% | 478 | 478 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.apart.total | chunks/s | 5076852, 4913683 | 4995268 | 3.3% | 5067055 | 5067055 | 0.0% | 1.01 | 1.000 | too few runs to resolve (least p 0.667) |
| fair.session.build | permille | 31, 31 | 31 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.helpers | permille | 465, 474 | 470 | 1.9% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.threaded | permille | 503, 496 | 500 | 1.4% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.total | chunks/s | 4997386, 4777498 | 4887442 | 4.5% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.shared.build | permille | 31, 31 | 31 | 0.0% | 29 | 29 | 0.0% | 0.94 | 0.333 | too few runs to resolve (least p 0.333) |
| fair.shared.helpers | permille | 458, 459 | 458 | 0.2% | 488 | 488 | 0.0% | 1.06 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.threaded | permille | 510, 508 | 509 | 0.4% | 482 | 482 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.total | chunks/s | 5128978, 5056352 | 5092665 | 1.4% | 4052665 | 4052665 | 0.0% | 0.80 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.create_write_unlink | ns | 27371, 27357 | 27364 | 0.1% | 129469 | 129469 | 0.0% | 4.73 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.mkdir_rmdir | ns | 36849, 37047 | 36948 | 0.5% | 85916 | 85916 | 0.0% | 2.33 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.open_close | ns | 3046, 3037 | 3042 | 0.3% | 21070 | 21070 | 0.0% | 6.93 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.read_4k_at | ns | 1462, 1473 | 1468 | 0.7% | 20490 | 20490 | 0.0% | 13.96 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.readdir.1000 | ns | 431124, 445573 | 438348 | 3.3% | 681863 | 681863 | 0.0% | 1.56 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.rename | ns | 9277, 9309 | 9293 | 0.3% | 61137 | 61137 | 0.0% | 6.58 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_read.1048576 | MB/s | 11448, 11457 | 11452 | 0.1% | 4844 | 4844 | 0.0% | 0.42 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_read.4096 | MB/s | 5084, 5089 | 5086 | 0.1% | 151 | 151 | 0.0% | 0.03 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_write.1048576 | MB/s | 790, 798 | 794 | 1.0% | 349 | 349 | 0.0% | 0.44 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_write.4096 | MB/s | 724, 785 | 754 | 8.1% | 214 | 214 | 0.0% | 0.28 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.stat | ns | 1443, 1453 | 1448 | 0.7% | 12294 | 12294 | 0.0% | 8.49 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.tree.100 | ns | 3410887, 3412938 | 3411912 | 0.1% | 12401093 | 12401093 | 0.0% | 3.63 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.write_4k_at | ns | 2114, 2084 | 2099 | 1.4% | 21151 | 21151 | 0.0% | 10.08 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.create_write_unlink | ns | 12574, 12689 | 12632 | 0.9% | 10761 | 10761 | 0.0% | 0.85 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.mkdir_rmdir | ns | 6613, 6645 | 6629 | 0.5% | 7705 | 7705 | 0.0% | 1.16 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.open_close | ns | 2906, 2916 | 2911 | 0.3% | 6132 | 6132 | 0.0% | 2.11 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.read_4k_at | ns | 1403, 1393 | 1398 | 0.7% | 1403 | 1403 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.333) |
| fs.mem.readdir.1000 | ns | 270270, 272697 | 271484 | 0.9% | 1060423 | 1060423 | 0.0% | 3.91 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.rename | ns | 4459, 4510 | 4484 | 1.1% | 6272 | 6272 | 0.0% | 1.40 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_read.1048576 | MB/s | 8556, 8410 | 8483 | 1.7% | 8042 | 8042 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_read.4096 | MB/s | 5528, 5466 | 5497 | 1.1% | 5322 | 5322 | 0.0% | 0.97 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_write.1048576 | MB/s | 1538, 1529 | 1534 | 0.6% | 3443 | 3443 | 0.0% | 2.25 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_write.4096 | MB/s | 1295, 1300 | 1298 | 0.4% | 2830 | 2830 | 0.0% | 2.18 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.stat | ns | 1493, 1503 | 1498 | 0.7% | 2635 | 2635 | 0.0% | 1.76 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.tree.100 | ns | 1431461, 1452436 | 1441948 | 1.5% | 1379588 | 1379588 | 0.0% | 0.96 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.write_4k_at | ns | 1753, 1754 | 1754 | 0.1% | 1523 | 1523 | 0.0% | 0.87 | 0.667 | too few runs to resolve (least p 0.667) |
| identity.cpuidle |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_kernel_names_its_idle_states_to_no_program |
| identity.nvme |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_NVMe_driver_keeps_its_controller's_identity_and_no_right_reads_it_from_another_program |
| identity.usb |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: usbd_keeps_its_devices_and_no_right_reads_them_from_another_program |
| ipc.connect_accept | ns | 10911, 10954 | 10932 | 0.4% | 2675 | 2675 | 0.0% | 0.24 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.4096 | ns | 11392, 17308 | 14350 | 41.2% | 7955 | 7955 | 0.0% | 0.55 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.65536 | ns | 48241, 48006 | 48124 | 0.5% | 37311 | 37311 | 0.0% | 0.78 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.8 | ns | 7684, 14983 | 11334 | 64.4% | 6553 | 6553 | 0.0% | 0.58 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep_handle.8 | ns | 20238, 21077 | 20658 | 4.1% | 7876 | 7876 | 0.0% | 0.38 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.map | ns/MiB | 277, 287 | 282 | 3.5% | 207 | 207 | 0.0% | 0.73 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.total | ns/MiB | 511195, 493506 | 502350 | 3.5% | 125944 | 125944 | 0.0% | 0.25 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.touch | ns/MiB | 432190, 423122 | 427656 | 2.1% | 119988 | 119988 | 0.0% | 0.28 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.unmap | ns/MiB | 78667, 70787 | 74727 | 10.5% | 5460 | 5460 | 0.0% | 0.07 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.copy | MB/s | 8433, 8611 | 8522 | 2.1% | 8321 | 8321 | 0.0% | 0.98 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.read | MB/s | 20059, 19826 | 19942 | 1.2% | 19388 | 19388 | 0.0% | 0.97 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.write | MB/s | 9525, 9401 | 9463 | 1.3% | 9669 | 9669 | 0.0% | 1.02 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.first_touch.2m | ns/MiB | 132161, 133052 | 132606 | 0.7% | 128311 | 128311 | 0.0% | 0.97 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.first_touch.4k | ns/MiB | 431324, 437494 | 434409 | 1.4% | 128230 | 128230 | 0.0% | 0.30 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.1048576.t1 | kops/s | 94, 88 | 91 | 6.6% | 231 | 231 | 0.0% | 2.54 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.1048576.t16 | kops/s | 66, 67 | 66 | 1.5% | 101 | 101 | 0.0% | 1.52 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.16.t1 | kops/s | 28161, 28062 | 28112 | 0.4% | 39432 | 39432 | 0.0% | 1.40 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.16.t16 | kops/s | 1720, 1731 | 1726 | 0.6% | 2983 | 2983 | 0.0% | 1.73 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.4096.t1 | kops/s | 22970, 22963 | 22966 | 0.0% | 37663 | 37663 | 0.0% | 1.64 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.4096.t16 | kops/s | 1581, 1589 | 1585 | 0.5% | 2463 | 2463 | 0.0% | 1.55 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_touch_unmap.2m | ns/MiB | 136364, 137122 | 136743 | 0.6% | 135639 | 135639 | 0.0% | 0.99 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_touch_unmap.4k | ns/MiB | 500312, 507581 | 503946 | 1.4% | 134644 | 134644 | 0.0% | 0.27 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_unmap_4k | ns | 3947, 4008 | 3978 | 1.5% | 2255 | 2255 | 0.0% | 0.57 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.1024 | MB/s | 41394, 41130 | 41262 | 0.6% | 44070 | 44070 | 0.0% | 1.07 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.1048576 | MB/s | 11698, 11745 | 11722 | 0.4% | 10774 | 10774 | 0.0% | 0.92 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.16384 | MB/s | 75203, 73707 | 74455 | 2.0% | 75800 | 75800 | 0.0% | 1.02 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.16777216 | MB/s | 6176, 6348 | 6262 | 2.7% | 6112 | 6112 | 0.0% | 0.98 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.256 | MB/s | 16301, 16158 | 16230 | 0.9% | 14591 | 14591 | 0.0% | 0.90 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.262144 | MB/s | 36472, 36881 | 36676 | 1.1% | 34857 | 34857 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.4096 | MB/s | 86213, 85519 | 85866 | 0.8% | 89519 | 89519 | 0.0% | 1.04 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.4194304 | MB/s | 10851, 10865 | 10858 | 0.1% | 10872 | 10872 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.64 | MB/s | 6562, 6492 | 6527 | 1.1% | 3970 | 3970 | 0.0% | 0.61 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.65536 | MB/s | 66420, 65906 | 66163 | 0.8% | 66869 | 66869 | 0.0% | 1.01 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.67108864 | MB/s | 6323, 6414 | 6368 | 1.4% | 6120 | 6120 | 0.0% | 0.96 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.mprotect.4k | ns | 2124, 2134 | 2129 | 0.5% | 821 | 821 | 0.0% | 0.39 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.munmap_part.4k | ns | 3076, 3236 | 3156 | 5.1% | 1172 | 1172 | 0.0% | 0.37 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.munmap_touched_remote.4k | ns | 4539, 4579 | 4559 | 0.9% | 2886 | 2886 | 0.0% | 0.63 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.realloc_grow.1m_256m | ns | 203154, 202522 | 202838 | 0.3% | 61578 | 61578 | 0.0% | 0.30 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.realloc_grow.last_128m_256m | ns | 52379, 52327 | 52353 | 0.1% | 7214 | 7214 | 0.0% | 0.14 | 0.667 | too few runs to resolve (least p 0.667) |
| net.tcp.connect_accept_close | ns | 48502, 48896 | 48699 | 0.8% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.reqrep.64 | ns | 27241, 27059 | 27150 | 0.7% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.1 | MB/s | 0, 0 | 0 | - |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.65536 | MB/s | 2930, 2962 | 2946 | 1.1% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.udp.reqrep.64 | ns | 22333, 14190 | 18262 | 44.6% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| nvme.read.1m.seq |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| nvme.read.4k.random |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| persist.append_4k_fsync | ns | 3781337, 3300677 | 3541007 | 13.6% | 2928332 | 2928332 | 0.0% | 0.83 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.create_fsync_unlink | ns | 3283416, 3257728 | 3270572 | 0.8% | 3533628 | 3533628 | 0.0% | 1.08 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.fsync_clean | ns | 65764, 64053 | 64908 | 2.6% | 1263124 | 1263124 | 0.0% | 19.46 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.seq_read_cached | MB/s | 6652, 6613 | 6632 | 0.6% | 2567 | 2567 | 0.0% | 0.39 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.seq_write_fsync | MB/s | 548, 544 | 546 | 0.7% | 298 | 298 | 0.0% | 0.55 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.write_4k_fsync | ns | 3578944, 2993976 | 3286460 | 17.8% | 2600561 | 2600561 | 0.0% | 0.79 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.futex.cross_core | ns | 9648, 9838 | 9743 | 2.0% | 4328 | 4328 | 0.0% | 0.44 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.futex.same_cpu | ns | 6141, 6248 | 6194 | 1.7% | 4389 | 4389 | 0.0% | 0.71 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.pipe.cross_core | ns | 11121, 11440 | 11280 | 2.8% | 7474 | 7474 | 0.0% | 0.66 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.pipe.same_cpu | ns | 7564, 7739 | 7652 | 2.3% | 5701 | 5701 | 0.0% | 0.75 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.1024 | MB/s | 1879, 1692 | 1786 | 10.5% | 2006 | 2006 | 0.0% | 1.12 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.16384 | MB/s | 3684, 3766 | 3725 | 2.2% | 6654 | 6654 | 0.0% | 1.79 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.256 | MB/s | 472, 428 | 450 | 9.8% | 206 | 206 | 0.0% | 0.46 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.4096 | MB/s | 5734, 5724 | 5729 | 0.2% | 2061 | 2061 | 0.0% | 0.36 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.64 | MB/s | 109, 115 | 112 | 5.4% | 136 | 136 | 0.0% | 1.21 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.65536 | MB/s | 2686, 2706 | 2696 | 0.7% | 5044 | 5044 | 0.0% | 1.87 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.posix_spawn_wait.std | ns | 318761, 740403 | 529582 | 79.6% | 504181 | 504181 | 0.0% | 0.95 | 1.000 | too few runs to resolve (least p 0.667) |
| proc.posix_spawn_wait.tiny | ns | 90832, 91876 | 91354 | 1.1% | 76047 | 76047 | 0.0% | 0.83 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait.large | ns | 259009, 273444 | 266226 | 5.4% | 186138 | 186138 | 0.0% | 0.70 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait.tiny | ns | 268777, 254007 | 261392 | 5.7% | 66448 | 66448 | 0.0% | 0.25 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait_loop.100 | ns | 11347294, 24686022 | 18016658 | 74.0% | 5805235 | 5805235 | 0.0% | 0.32 | 0.667 | too few runs to resolve (least p 0.667) |
| process.spawn_wait | ns | 911540, 927995 | 919768 | 1.8% | 538157 | 538157 | 0.0% | 0.59 | 0.667 | too few runs to resolve (least p 0.667) |
| syscall.null | ps | 156311, 156344 | 156328 | 0.0% | 48800 | 48800 | 0.0% | 0.31 | 0.667 | too few runs to resolve (least p 0.667) |
| tail.diag.periodic.30s | ns |  | - | - | 5321 | 5321 | 0.0% | - | - | Linux 2 run(s) absent |
| tail.stolen.10s | ns | 32812, 32608 | 32710 | 0.6% | 21412 | 21412 | 0.0% | 0.65 | 0.667 | too few runs to resolve (least p 0.667) |
| tail.wake.periodic.60s | ns | 62313, 54203 | 58258 | 13.9% | 5361 | 5361 | 0.0% | 0.09 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join | ns | 72607, 64521 | 68564 | 11.8% | 40949 | 40949 | 0.0% | 0.60 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join.default | ns | 72877, 64558 | 68718 | 12.1% | 43594 | 43594 | 0.0% | 0.63 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join.stack64k | ns | 65844, 53083 | 59464 | 21.5% | 40618 | 40618 | 0.0% | 0.68 | 0.667 | too few runs to resolve (least p 0.667) |
| time.now | ps | 22479, 22612 | 22546 | 0.6% | 9404 | 9404 | 0.0% | 0.42 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.100us | ns | 60423, 60414 | 60418 | 0.0% | 4962 | 4962 | 0.0% | 0.08 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.100us.slack1ns | ns | 10439, 10411 | 10425 | 0.3% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10ms | ns | 348850, 101786 | 225318 | 109.7% | 53710 | 53710 | 0.0% | 0.24 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.10ms.slack1ns | ns | 297454, 53159 | 175306 | 139.4% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10us | ns | 53590, 53549 | 53570 | 0.1% | 1252 | 1252 | 0.0% | 0.02 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.10us.slack1ns | ns | 10498, 10431 | 10464 | 0.6% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1ms | ns | 73817, 84895 | 79356 | 14.0% | 5437 | 5437 | 0.0% | 0.07 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.1ms.slack1ns | ns | 11629, 11671 | 11650 | 0.4% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1us | ns | 53623, 53601 | 53612 | 0.0% | 1455 | 1455 | 0.0% | 0.03 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.1us.slack1ns | ns | 11945, 13299 | 12622 | 10.7% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.timer_1ms.late | ns | 69000, 70370 | 69685 | 2.0% | 46709 | 46709 | 0.0% | 0.67 | 0.667 | too few runs to resolve (least p 0.667) |
| time.timer_1ms.late.slack1ns | ns | 20800, 11587 | 16194 | 56.9% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.yield | ps | 544796, 550634 | 547715 | 1.1% |  | - | - | - | - | ToyOS 1 run(s) unsupported: no_yield_syscall:_std's_yield_now_is_a_spin-loop_hint |
| wake.onto_busy | ns | 5771, 7677 | 6724 | 28.3% | 15289 | 15289 | 0.0% | 2.27 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle | ns | 60806, 60728 | 60767 | 0.1% | 32857 | 32857 | 0.0% | 0.54 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle.slack1ns | ns | 10814, 11488 | 11151 | 6.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.periodic.loaded | ns | 54381, 54190 | 54286 | 0.4% | 3695 | 3695 | 0.0% | 0.07 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.loaded.slack1ns | ns | 4197, 10216 | 7206 | 83.5% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.storm.call.w1 | ns | 8566, 8358 | 8462 | 2.5% | 7574 | 7574 | 0.0% | 0.90 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w16 | ns | 58200, 46440 | 52320 | 22.5% | 14919 | 14919 | 0.0% | 0.29 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w4 | ns | 8907, 12718 | 10812 | 35.2% | 8236 | 8236 | 0.0% | 0.76 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w64 | ns | 253538, 237406 | 245472 | 6.6% | 23455 | 23455 | 0.0% | 0.10 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w1 | ns | 76675, 79017 | 77846 | 3.0% | 47051 | 47051 | 0.0% | 0.60 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w16 | ns | 575687, 109880 | 342784 | 135.9% | 73882 | 73882 | 0.0% | 0.22 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w4 | ns | 76755, 80589 | 78672 | 4.9% | 66548 | 66548 | 0.0% | 0.85 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w64 | ns | 1214622, 683284 | 948953 | 56.0% | 239722 | 239722 | 0.0% | 0.25 | 0.667 | too few runs to resolve (least p 0.667) |
| work.build_shaped.j1 | ns | 1242990207, 1436881130 | 1339935668 | 14.5% | 854953993 | 854953993 | 0.0% | 0.64 | 0.667 | too few runs to resolve (least p 0.667) |
| work.build_shaped.j16 | ns | 116739823, 114978423 | 115859123 | 1.5% | 269373597 | 269373597 | 0.0% | 2.33 | 0.667 | too few runs to resolve (least p 0.667) |
| work.compress_inproc | ns | 442588799, 446432539 | 444510669 | 0.9% | 424599348 | 424599348 | 0.0% | 0.96 | 0.667 | too few runs to resolve (least p 0.667) |

Each p is its row's alone, uncorrected for the table's other rows.

