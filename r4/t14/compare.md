## 11th_Gen_Intel(R)_Core(TM)_i5-1135G7_@_2.40GHz

Runs: Linux 2, ToyOS 1. lan.peer_link: none. internet.link: none.

Linux setup: kernel=6.8.0-147-generic, cpufreq_driver=intel_pstate*8, governor=powersave*8, epp=balance_performance*8, min_khz=400000*8, max_khz=4200000*8, boost=absent, intel_no_turbo=0, platform_profile=balanced, smt_active=1, fs.mem.served_by=tmpfs,_through_the_VFS, fs.disk.served_by=ext4,_NVMe_disk,_model_SK_hynix_BC501_HFM256GDJTNG-8310A,_write_cache_write_back, persist.served_by=ext4,_NVMe_disk,_model_SK_hynix_BC501_HFM256GDJTNG-8310A,_write_cache_write_back.

Linux per run: clocksource=tsc,tsc.

ToyOS setup: fs.mem.served_by=the_kernel's_tmpfs,_through_syscalls, fs.disk.served_by=DATA_volume,_bcachefs_crate's_format,_DATA_file_server_over_the_block_service, persist.served_by=DATA_volume,_bcachefs_crate's_format,_DATA_file_server_over_the_block_service.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.chunk@fair | ns | 2994, 2994 | 2994 | 0.0% | 2993 | 2993 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.chunk@sched | ns | 2994, 2994 | 2994 | 0.0% | 2993 | 2993 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.chunk@system | ns | 2994, 2994 | 2994 | 0.0% | 2993 | 2993 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@boot | MHz | 4189, 4190 | 4190 | 0.0% | 3790 | 3790 | 0.0% | 0.90 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@crunch | MHz | 4189, 4190 | 4190 | 0.0% | 4189 | 4189 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.333) |
| cpu.clock@energy | MHz | 4190, 4190 | 4190 | 0.0% | 3790 | 3790 | 0.0% | 0.90 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@fair | MHz | 4190, 4190 | 4190 | 0.0% | 3790 | 3790 | 0.0% | 0.90 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@files | MHz | 1396, 1379 | 1388 | 1.2% | 4188 | 4188 | 0.0% | 3.02 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@identity | MHz | 4190, 4190 | 4190 | 0.0% | 3790 | 3790 | 0.0% | 0.90 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@ipc | MHz | 4190, 4189 | 4190 | 0.0% | 4189 | 4189 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.333) |
| cpu.clock@mem | MHz | 4190, 4190 | 4190 | 0.0% | 4189 | 4189 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@net | MHz | 4190, 4190 | 4190 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@nvme | MHz | 1475, 1397 | 1436 | 5.4% | 4189 | 4189 | 0.0% | 2.92 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@persist | MHz | 4190, 4190 | 4190 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@procs | MHz | 4190, 4190 | 4190 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@sched | MHz | 4190, 4190 | 4190 | 0.0% | 4189 | 4189 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@system | MHz | 4190, 4190 | 4190 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@tail | MHz | 4190, 4190 | 4190 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@time | MHz | 4190, 4190 | 4190 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@work | MHz | 4190, 4190 | 4190 | 0.0% | 4189 | 4189 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| crunch.all.deflate | ns | 180619493, 180585176 | 180602334 | 0.0% |  | - | - | - | - | the clock did not settle in 2 of 2 Linux run(s); ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.matmul | ns | 5122660, 5143684 | 5133172 | 0.4% |  | - | - | - | - | the clock did not settle in 2 of 2 Linux run(s); ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.parse | ns | 2761856675, 2728929616 | 2745393146 | 1.2% |  | - | - | - | - | ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.sha256 | ns | 1976384, 1972483 | 1974434 | 0.2% |  | - | - | - | - | the clock did not settle in 2 of 2 Linux run(s); ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.single.deflate | ns | 54924757, 54807172 | 54865964 | 0.2% | 54409094 | 54409094 | 0.0% | 0.99 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.single.matmul | ns | 1007999, 1171817 | 1089908 | 15.0% | 1070344 | 1070344 | 0.0% | 0.98 | 1.000 | too few runs to resolve (least p 0.667); the clock fell in 2 of 2 Linux run(s) |
| crunch.single.parse | ns | 69012287, 68588503 | 68800395 | 0.6% | 35070596 | 35070596 | 0.0% | 0.51 | 0.667 | too few runs to resolve (least p 0.667); settled clocks apart: Linux 3692 MHz, ToyOS 4188 MHz |
| crunch.single.sha256 | ns | 567490, 567410 | 567450 | 0.0% | 567189 | 567189 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| energy.idle_60s.package |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: energy_uj_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_energy`_reads_it; ToyOS 1 run(s) unsupported: no_counter_carries_the_package's_energy:_toyos_abi::counters::Counter_has_none |
| fair.apart.build | permille | 125, 124 | 124 | 0.8% | 125 | 125 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.333) |
| fair.apart.helpers | permille | 420, 423 | 422 | 0.7% | 430 | 430 | 0.0% | 1.02 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.apart.threaded | permille | 453, 452 | 452 | 0.2% | 444 | 444 | 0.0% | 0.98 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.apart.total | chunks/s | 1659065, 1627583 | 1643324 | 1.9% | 2363821 | 2363821 | 0.0% | 1.44 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.session.build | permille | 63, 65 | 64 | 3.1% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.helpers | permille | 443, 444 | 444 | 0.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.threaded | permille | 492, 489 | 490 | 0.6% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.total | chunks/s | 1687083, 1673426 | 1680254 | 0.8% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.shared.build | permille | 59, 63 | 61 | 6.6% | 58 | 58 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.helpers | permille | 456, 452 | 454 | 0.9% | 467 | 467 | 0.0% | 1.03 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.threaded | permille | 483, 482 | 482 | 0.2% | 473 | 473 | 0.0% | 0.98 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.total | chunks/s | 2391885, 2392280 | 2392082 | 0.0% | 2370857 | 2370857 | 0.0% | 0.99 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.create_write_unlink | ns | 11372, 11294 | 11333 | 0.7% | 158117 | 158117 | 0.0% | 13.95 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.mkdir_rmdir | ns | 14667, 14732 | 14700 | 0.4% | 110176 | 110176 | 0.0% | 7.50 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.open_close | ns | 1203, 1276 | 1240 | 5.9% | 26869 | 26869 | 0.0% | 21.68 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.read_4k_at | ns | 742, 724 | 733 | 2.5% | 18244 | 18244 | 0.0% | 24.89 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.readdir.1000 | ns | 275372, 272289 | 273830 | 1.1% | 901016 | 901016 | 0.0% | 3.29 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.rename | ns | 3638, 3626 | 3632 | 0.3% | 87580 | 87580 | 0.0% | 24.11 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_read.1048576 | MB/s | 9426, 9299 | 9362 | 1.4% | 6960 | 6960 | 0.0% | 0.74 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_read.4096 | MB/s | 7780, 7760 | 7770 | 0.3% | 431 | 431 | 0.0% | 0.06 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_write.1048576 | MB/s | 347, 346 | 346 | 0.3% | 345 | 345 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_write.4096 | MB/s | 614, 631 | 622 | 2.7% | 137 | 137 | 0.0% | 0.22 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.stat | ns | 587, 589 | 588 | 0.3% | 11413 | 11413 | 0.0% | 19.41 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.tree.100 | ns | 1355477, 1347166 | 1351322 | 0.6% | 14171675 | 14171675 | 0.0% | 10.49 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.write_4k_at | ns | 730, 725 | 728 | 0.7% | 18410 | 18410 | 0.0% | 25.31 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.create_write_unlink | ns | 4687, 4715 | 4701 | 0.6% | 12855 | 12855 | 0.0% | 2.73 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.mkdir_rmdir | ns | 2211, 2213 | 2212 | 0.1% | 8802 | 8802 | 0.0% | 3.98 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.open_close | ns | 1110, 1113 | 1112 | 0.3% | 7242 | 7242 | 0.0% | 6.52 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.read_4k_at | ns | 703, 692 | 698 | 1.6% | 1218 | 1218 | 0.0% | 1.75 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.readdir.1000 | ns | 177389, 176866 | 177128 | 0.3% | 1142081 | 1142081 | 0.0% | 6.45 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.rename | ns | 1624, 1628 | 1626 | 0.2% | 7333 | 7333 | 0.0% | 4.51 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_read.1048576 | MB/s | 9592, 9638 | 9615 | 0.5% | 7201 | 7201 | 0.0% | 0.75 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_read.4096 | MB/s | 8254, 8224 | 8239 | 0.4% | 4692 | 4692 | 0.0% | 0.57 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_write.1048576 | MB/s | 4573, 4588 | 4580 | 0.3% | 4689 | 4689 | 0.0% | 1.02 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_write.4096 | MB/s | 3616, 3614 | 3615 | 0.1% | 3146 | 3146 | 0.0% | 0.87 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.stat | ns | 585, 591 | 588 | 1.0% | 3053 | 3053 | 0.0% | 5.19 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.tree.100 | ns | 550940, 548925 | 549932 | 0.4% | 1490133 | 1490133 | 0.0% | 2.71 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.write_4k_at | ns | 628, 597 | 612 | 5.1% | 1258 | 1258 | 0.0% | 2.05 | 0.667 | too few runs to resolve (least p 0.667) |
| identity.cpuidle |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_kernel_names_its_idle_states_to_no_program |
| identity.nvme |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_NVMe_driver_keeps_its_controller's_identity_and_no_right_reads_it_from_another_program |
| identity.usb |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: usbd_keeps_its_devices_and_no_right_reads_them_from_another_program |
| ipc.connect_accept | ns | 3895, 3869 | 3882 | 0.7% | 3148 | 3148 | 0.0% | 0.81 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.4096 | ns | 7208, 7226 | 7217 | 0.2% | 8655 | 8655 | 0.0% | 1.20 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.65536 | ns | 19114, 18958 | 19036 | 0.8% | 35689 | 35689 | 0.0% | 1.87 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.8 | ns | 3430, 3515 | 3472 | 2.4% | 7147 | 7147 | 0.0% | 2.06 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep_handle.8 | ns | 7344, 7260 | 7302 | 1.2% | 8765 | 8765 | 0.0% | 1.20 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.map | ns/MiB | 75, 89 | 82 | 17.1% | 123 | 123 | 0.0% | 1.50 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.total | ns/MiB | 258323, 258523 | 258423 | 0.1% | 127207 | 127207 | 0.0% | 0.49 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.touch | ns/MiB | 235409, 236144 | 235776 | 0.3% | 121193 | 121193 | 0.0% | 0.51 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.unmap | ns/MiB | 22868, 22449 | 22658 | 1.8% | 3698 | 3698 | 0.0% | 0.16 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.copy | MB/s | 6964, 6993 | 6978 | 0.4% | 6642 | 6642 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.read | MB/s | 18032, 17692 | 17862 | 1.9% | 16983 | 16983 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.write | MB/s | 9381, 9434 | 9408 | 0.6% | 9583 | 9583 | 0.0% | 1.02 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.first_touch.2m | ns/MiB | 100239, 101579 | 100909 | 1.3% | 123506 | 123506 | 0.0% | 1.22 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.first_touch.4k | ns/MiB | 237047, 237264 | 237156 | 0.1% | 124178 | 124178 | 0.0% | 0.52 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.1048576.t1 | kops/s | 190, 178 | 184 | 6.5% | 207 | 207 | 0.0% | 1.12 | 0.667 | too few runs to resolve (least p 0.667); settled clocks apart: Linux 3392 MHz, ToyOS 4188 MHz |
| mem.malloc_churn.1048576.t8 | kops/s | 92, 90 | 91 | 2.2% | 103 | 103 | 0.0% | 1.13 | 0.667 | too few runs to resolve (least p 0.667); settled clocks apart: Linux 3242 MHz, ToyOS 4188 MHz |
| mem.malloc_churn.16.t1 | kops/s | 32463, 32471 | 32467 | 0.0% | 36598 | 36598 | 0.0% | 1.13 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.16.t8 | kops/s | 2564, 2582 | 2573 | 0.7% | 4895 | 4895 | 0.0% | 1.90 | 0.667 | too few runs to resolve (least p 0.667); the clock fell in 1 of 2 Linux run(s) |
| mem.malloc_churn.4096.t1 | kops/s | 21048, 18451 | 19750 | 13.1% | 31117 | 31117 | 0.0% | 1.58 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.4096.t8 | kops/s | 874, 864 | 869 | 1.2% | 3109 | 3109 | 0.0% | 3.58 | 0.667 | too few runs to resolve (least p 0.667); settled clocks apart: Linux 2943 MHz, ToyOS 4188 MHz |
| mem.map_touch_unmap.2m | ns/MiB | 101980, 103295 | 102638 | 1.3% | 129241 | 129241 | 0.0% | 1.26 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_touch_unmap.4k | ns/MiB | 258083, 258490 | 258286 | 0.2% | 128888 | 128888 | 0.0% | 0.50 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_unmap_4k | ns | 1603, 1597 | 1600 | 0.4% | 3209 | 3209 | 0.0% | 2.01 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.1024 | MB/s | 70175, 73883 | 72029 | 5.1% | 85790 | 85790 | 0.0% | 1.19 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.1048576 | MB/s | 28233, 25236 | 26734 | 11.2% | 25230 | 25230 | 0.0% | 0.94 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.16384 | MB/s | 222069, 213503 | 217786 | 3.9% | 185486 | 185486 | 0.0% | 0.85 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.16777216 | MB/s | 10392, 10869 | 10630 | 4.5% | 10382 | 10382 | 0.0% | 0.98 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.256 | MB/s | 24623, 24719 | 24671 | 0.4% | 30581 | 30581 | 0.0% | 1.24 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.262144 | MB/s | 55579, 55634 | 55606 | 0.1% | 55724 | 55724 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.4096 | MB/s | 159643, 158900 | 159272 | 0.5% | 164979 | 164979 | 0.0% | 1.04 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.4194304 | MB/s | 19489, 22055 | 20772 | 12.4% | 20983 | 20983 | 0.0% | 1.01 | 1.000 | too few runs to resolve (least p 0.667) |
| mem.memcpy.64 | MB/s | 6172, 6244 | 6208 | 1.2% | 19145 | 19145 | 0.0% | 3.08 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.65536 | MB/s | 54981, 55184 | 55082 | 0.4% | 55471 | 55471 | 0.0% | 1.01 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.67108864 | MB/s | 9620, 9677 | 9648 | 0.6% | 9267 | 9267 | 0.0% | 0.96 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.mprotect.4k | ns | 1016, 1016 | 1016 | 0.0% | 952 | 952 | 0.0% | 0.94 | 0.333 | too few runs to resolve (least p 0.333) |
| mem.munmap_part.4k | ns | 1280, 1285 | 1282 | 0.4% | 1560 | 1560 | 0.0% | 1.22 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.munmap_touched_remote.4k | ns | 2283, 2317 | 2300 | 1.5% | 2996 | 2996 | 0.0% | 1.30 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.realloc_grow.1m_256m | ns | 116364, 112449 | 114406 | 3.4% | 45821 | 45821 | 0.0% | 0.40 | 0.667 | too few runs to resolve (least p 0.667); settled clocks apart: Linux 3392 MHz, ToyOS 4188 MHz |
| mem.realloc_grow.last_128m_256m | ns | 25823, 25007 | 25415 | 3.2% | 11932 | 11932 | 0.0% | 0.47 | 0.667 | too few runs to resolve (least p 0.667) |
| net.tcp.connect_accept_close | ns | 20873, 20913 | 20893 | 0.2% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.reqrep.64 | ns | 8856, 8935 | 8896 | 0.9% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.1 | MB/s | 1, 1 | 1 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.65536 | MB/s | 6719, 6611 | 6665 | 1.6% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.udp.reqrep.64 | ns | 7278, 7203 | 7240 | 1.0% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| nvme.read.1m.seq |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| nvme.read.4k.random |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| persist.append_4k_fsync | ns | 1200332, 911139 | 1055736 | 27.4% | 1012768 | 1012768 | 0.0% | 0.96 | 1.000 | too few runs to resolve (least p 0.667) |
| persist.create_fsync_unlink | ns | 966415, 953976 | 960196 | 1.3% | 1168401 | 1168401 | 0.0% | 1.22 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.fsync_clean | ns | 22970, 23012 | 22991 | 0.2% | 464505 | 464505 | 0.0% | 20.20 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.seq_read_cached | MB/s | 10573, 10093 | 10333 | 4.6% | 6422 | 6422 | 0.0% | 0.62 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.seq_write_fsync | MB/s | 585, 527 | 556 | 10.4% | 347 | 347 | 0.0% | 0.62 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.write_4k_fsync | ns | 1035997, 1011579 | 1023788 | 2.4% | 1099737 | 1099737 | 0.0% | 1.07 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.futex.cross_core | ns | 3341, 3343 | 3342 | 0.1% | 4566 | 4566 | 0.0% | 1.37 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.futex.same_cpu | ns | 2292, 2210 | 2251 | 3.6% | 4690 | 4690 | 0.0% | 2.08 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.pipe.cross_core | ns | 3723, 3932 | 3828 | 5.5% | 6383 | 6383 | 0.0% | 1.67 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.pipe.same_cpu | ns | 2877, 4504 | 3690 | 44.1% | 6170 | 6170 | 0.0% | 1.67 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.1024 | MB/s | 1803, 1723 | 1763 | 4.5% | 1286 | 1286 | 0.0% | 0.73 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.16384 | MB/s | 3905, 3890 | 3898 | 0.4% | 4871 | 4871 | 0.0% | 1.25 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.256 | MB/s | 639, 638 | 638 | 0.2% | 345 | 345 | 0.0% | 0.54 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.4096 | MB/s | 4222, 4126 | 4174 | 2.3% | 3092 | 3092 | 0.0% | 0.74 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.64 | MB/s | 170, 168 | 169 | 1.2% | 89 | 89 | 0.0% | 0.53 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.65536 | MB/s | 4248, 4210 | 4229 | 0.9% | 7849 | 7849 | 0.0% | 1.86 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.posix_spawn_wait.std | ns | 169127, 170293 | 169710 | 0.7% | 453194 | 453194 | 0.0% | 2.67 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.posix_spawn_wait.tiny | ns | 43839, 42980 | 43410 | 2.0% | 60812 | 60812 | 0.0% | 1.40 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait.large | ns | 55053, 54775 | 54914 | 0.5% | 186564 | 186564 | 0.0% | 3.40 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait.tiny | ns | 52614, 52094 | 52354 | 1.0% | 51552 | 51552 | 0.0% | 0.98 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait_loop.100 | ns | 5418215, 5415162 | 5416688 | 0.1% | 5389310 | 5389310 | 0.0% | 0.99 | 0.667 | too few runs to resolve (least p 0.667) |
| process.spawn_wait | ns | 186219, 178132 | 182176 | 4.4% | 448988 | 448988 | 0.0% | 2.46 | 0.667 | too few runs to resolve (least p 0.667) |
| syscall.null | ps | 91852, 91950 | 91901 | 0.1% | 68358 | 68358 | 0.0% | 0.74 | 0.667 | too few runs to resolve (least p 0.667) |
| tail.diag.periodic.30s | ns |  | - | - | 17843 | 17843 | 0.0% | - | - | Linux 2 run(s) absent |
| tail.stolen.10s | ns | 32439, 42722 | 37580 | 27.4% | 35040 | 35040 | 0.0% | 0.93 | 1.000 | too few runs to resolve (least p 0.667) |
| tail.wake.periodic.60s | ns | 69412, 67379 | 68396 | 3.0% | 17824 | 17824 | 0.0% | 0.26 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join | ns | 24954, 25040 | 24997 | 0.3% | 28114 | 28114 | 0.0% | 1.12 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join.default | ns | 25292, 24770 | 25031 | 2.1% | 28388 | 28388 | 0.0% | 1.13 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join.stack64k | ns | 23592, 23569 | 23580 | 0.1% | 28543 | 28543 | 0.0% | 1.21 | 0.667 | too few runs to resolve (least p 0.667) |
| time.now | ps | 14299, 14291 | 14295 | 0.1% | 19816 | 19816 | 0.0% | 1.39 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.100us | ns | 51853, 51851 | 51852 | 0.0% | 4531 | 4531 | 0.0% | 0.09 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.100us.slack1ns | ns | 1823, 1830 | 1826 | 0.4% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10ms | ns | 225616, 215876 | 220746 | 4.4% | 26817 | 26817 | 0.0% | 0.12 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.10ms.slack1ns | ns | 166865, 164019 | 165442 | 1.7% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10us | ns | 51826, 51824 | 51825 | 0.0% | 1164 | 1164 | 0.0% | 0.02 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.10us.slack1ns | ns | 1822, 1826 | 1824 | 0.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1ms | ns | 71453, 71579 | 71516 | 0.2% | 20900 | 20900 | 0.0% | 0.29 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.1ms.slack1ns | ns | 20378, 20339 | 20358 | 0.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1us | ns | 51825, 51828 | 51826 | 0.0% | 1389 | 1389 | 0.0% | 0.03 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.1us.slack1ns | ns | 5666, 4278 | 4972 | 27.9% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.timer_1ms.late | ns | 173046, 70222 | 121634 | 84.5% | 12989 | 12989 | 0.0% | 0.11 | 0.667 | too few runs to resolve (least p 0.667) |
| time.timer_1ms.late.slack1ns | ns | 20430, 20422 | 20426 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.yield | ps | 190450, 190630 | 190540 | 0.1% |  | - | - | - | - | ToyOS 1 run(s) unsupported: no_yield_syscall:_std's_yield_now_is_a_spin-loop_hint |
| wake.onto_busy | ns | 2321, 2439 | 2380 | 5.0% | 3890 | 3890 | 0.0% | 1.63 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle | ns | 69387, 69368 | 69378 | 0.0% | 17776 | 17776 | 0.0% | 0.26 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle.slack1ns | ns | 17570, 21720 | 19645 | 21.1% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.periodic.loaded | ns | 52347, 52424 | 52386 | 0.1% | 3027 | 3027 | 0.0% | 0.06 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.loaded.slack1ns | ns | 2420, 2353 | 2386 | 2.8% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.storm.call.w1 | ns | 4652, 3275 | 3964 | 34.7% | 881 | 881 | 0.0% | 0.22 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w16 | ns | 65324, 56648 | 60986 | 14.2% | 14020 | 14020 | 0.0% | 0.23 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w4 | ns | 11694, 10146 | 10920 | 14.2% | 8904 | 8904 | 0.0% | 0.82 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w64 | ns | 256297, 237921 | 247109 | 7.4% | 20989 | 20989 | 0.0% | 0.08 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w1 | ns | 25746, 24423 | 25084 | 5.3% | 17876 | 17876 | 0.0% | 0.71 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w16 | ns | 1052236, 658730 | 855483 | 46.0% | 147254 | 147254 | 0.0% | 0.17 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w4 | ns | 117278, 129058 | 123168 | 9.6% | 128712 | 128712 | 0.0% | 1.05 | 1.000 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w64 | ns | 278210, 284437 | 281324 | 2.2% | 274104 | 274104 | 0.0% | 0.97 | 0.667 | too few runs to resolve (least p 0.667) |
| work.build_shaped.j1 | ns | 962310302, 1064625353 | 1013467828 | 10.1% | 678704866 | 678704866 | 0.0% | 0.67 | 0.667 | too few runs to resolve (least p 0.667) |
| work.build_shaped.j8 | ns | 99148404, 99193332 | 99170868 | 0.0% | 166265575 | 166265575 | 0.0% | 1.68 | 0.667 | too few runs to resolve (least p 0.667) |
| work.compress_inproc | ns | 361594099, 361967543 | 361780821 | 0.1% | 358347841 | 358347841 | 0.0% | 0.99 | 0.667 | too few runs to resolve (least p 0.667) |

Each p is its row's alone, uncorrected for the table's other rows.

