## AMD_Ryzen_7_4800U_with_Radeon_Graphics

Runs: Linux 5, ToyOS 4. lan.peer_link: none. internet.link: none.

Linux setup: kernel=6.8.0-147-generic, cpufreq_driver=acpi-cpufreq*16, governor=schedutil*16, epp=absent*16, min_khz=1400000*16, max_khz=1800000*16, boost=1, intel_no_turbo=absent, platform_profile=balanced, smt_active=1, fs.mem.served_by=tmpfs,_through_the_VFS, fs.disk.served_by=ext4,_NVMe_disk,_model_SAMSUNG_MZVLB1T0HBLR-000L2,_write_cache_write_back, persist.served_by=ext4,_NVMe_disk,_model_SAMSUNG_MZVLB1T0HBLR-000L2,_write_cache_write_back.

Linux per run: clocksource=tsc,tsc,tsc,hpet,hpet.

ToyOS setup: fs.mem.served_by=the_kernel's_tmpfs,_through_syscalls, fs.disk.served_by=DATA_volume,_bcachefs_crate's_format,_DATA_file_server_over_the_block_service, persist.served_by=DATA_volume,_bcachefs_crate's_format,_DATA_file_server_over_the_block_service.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.chunk@fair | ns | 2926, 2977, 2945, 4331, 4459 | 2977 | 51.5% | 2916, 2916, 2936, 2935 | 2926 | 0.7% | 0.98 | 0.063 | not resolved |
| cpu.chunk@sched | ns | 2926, 2926, 2940, 4319, 4330 | 2940 | 47.8% | 2916, 2935, 2935, 2935 | 2935 | 0.6% | 1.00 | 0.349 | not resolved |
| cpu.chunk@system | ns | 2926, 2926, 2910, 4229, 4261 | 2926 | 46.2% | 2916, 2916, 2916, 2916 | 2916 | 0.0% | 1.00 | 0.111 | not resolved |
| cpu.clock@boot | MHz | 1397, 4291, 1408, 1386, 1394 | 1397 | 207.9% | 4241, 4216, 4217, 4241 | 4229 | 0.6% | 3.03 | 0.167 | not resolved |
| cpu.clock@crunch | MHz | 1397, 1444, 1397, 4282, 4283 | 1444 | 199.9% | 4266, 4291, 4267, 4291 | 4279 | 0.6% | 2.96 | 0.159 | not resolved |
| cpu.clock@energy | MHz | 1397, 4291, 1406, 1382, 1371 | 1397 | 209.0% | 4291, 4291, 4267, 4266 | 4279 | 0.6% | 3.06 | 0.103 | not resolved |
| cpu.clock@fair | MHz | 1397, 4246, 1397, 1372, 1355 | 1397 | 206.9% | 4266, 4266, 4241, 4241 | 4254 | 0.6% | 3.04 | 0.063 | not resolved |
| cpu.clock@files | MHz | 1449, 1396, 4216, 1371, 1515 | 1449 | 196.3% | 4116, 4116, 4116, 4116 | 4116 | 0.0% | 2.84 | 0.159 | not resolved |
| cpu.clock@identity | MHz | 4291, 4291, 1407, 1384, 1371 | 1407 | 207.5% | 4266, 4266, 4266, 4266 | 4266 | 0.0% | 3.03 | 0.667 | not resolved |
| cpu.clock@ipc | MHz | 1397, 1696, 1397, 1371, 1370 | 1397 | 23.3% | 4217, 4217, 4216, 4192 | 4216 | 0.6% | 3.02 | 0.016 | ToyOS higher |
| cpu.clock@mem | MHz | 1397, 1397, 1397, 1370, 4247 | 1397 | 205.9% | 4241, 4241, 4241, 4217 | 4241 | 0.6% | 3.04 | 0.222 | not resolved |
| cpu.clock@net | MHz | 1397, 4240, 1397, 1371, 1371 | 1397 | 205.4% | 4241, 4241, 4217, 4241 | 4241 | 0.6% | 3.04 | 0.024 | ToyOS higher |
| cpu.clock@nvme | MHz | 4291, 4290, 1397, 1371, 1371 | 1397 | 209.0% | 4291, 4291, 4291, 4291 | 4291 | 0.0% | 3.07 | 0.048 | ToyOS higher |
| cpu.clock@persist | MHz | 1397, 1397, 1397, 1371, 1372 | 1397 | 1.9% | 4291, 4291, 4291, 4291 | 4291 | 0.0% | 3.07 | 0.008 | ToyOS higher |
| cpu.clock@procs | MHz | 1397, 4240, 1397, 1370, 1372 | 1397 | 205.4% | 4241, 4241, 4217, 4241 | 4241 | 0.6% | 3.04 | 0.024 | ToyOS higher |
| cpu.clock@sched | MHz | 1397, 1397, 1400, 1374, 1371 | 1397 | 2.1% | 4291, 4291, 4291, 4291 | 4291 | 0.0% | 3.07 | 0.016 | ToyOS higher |
| cpu.clock@system | MHz | 1397, 4291, 1405, 1380, 1371 | 1397 | 209.0% | 4291, 4267, 4266, 4266 | 4266 | 0.6% | 3.05 | 0.135 | not resolved |
| cpu.clock@tail | MHz | 4291, 1397, 1696, 1373, 1372 | 1397 | 208.9% | 4191, 4191, 4191, 4191 | 4191 | 0.0% | 3.00 | 0.159 | not resolved |
| cpu.clock@time | MHz | 1397, 1397, 4242, 1371, 1371 | 1397 | 205.5% | 4241, 4216, 4216, 4192 | 4216 | 1.2% | 3.02 | 0.143 | not resolved |
| cpu.clock@work | MHz | 1397, 1397, 4291, 1371, 1372 | 1397 | 209.0% | 4290, 4266, 4266, 4266 | 4266 | 0.6% | 3.05 | 0.167 | not resolved |
| crunch.all.deflate | ns | 151446472, 152540162, 151766190, 135554019, 154422812 | 151766190 | 12.4% |  | - | - | - | - | ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.matmul | ns | 2707775 | 2707775 | 0.0% |  | - | - | - | - | Linux 4 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.parse |  |  | - | - |  | - | - | - | - | Linux 5 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.sha256 | ns | 540530, 563971, 721147, 629542 | 596756 | 30.3% |  | - | - | - | - | Linux 1 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.single.deflate | ns | 66222586, 66663933, 67212765, 67276555, 67910879 | 67212765 | 2.5% | 63144870, 67092426, 66486727, 66524889 | 66505808 | 5.9% | 0.99 | 0.190 | not resolved |
| crunch.single.matmul | ns | 909075, 918648, 915071, 921104, 923657 | 918648 | 1.6% | 943909, 942950, 973709, 946011 | 944960 | 3.3% | 1.03 | 0.016 | ToyOS worse |
| crunch.single.parse | ns | 71933795 | 71933795 | 0.0% | 41190020, 41149470, 41914366, 41539075 | 41364548 | 1.8% | 0.58 | 0.400 | too few runs to resolve (least p 0.400); Linux 4 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit |
| crunch.single.sha256 | ns | 496397, 499288, 501844, 510910, 513047 | 501844 | 3.3% | 498781, 501718, 498733, 498856 | 498818 | 0.6% | 0.99 | 0.286 | not resolved |
| energy.idle_60s.package |  |  | - | - |  | - | - | - | - | Linux 5 run(s) unmeasured: energy_uj_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_energy`_reads_it; ToyOS 4 run(s) unsupported: no_counter_carries_the_package's_energy:_toyos_abi::counters::Counter_has_none |
| fair.apart.build | permille | 63, 63, 63, 62, 62 | 63 | 1.6% | 63, 63, 63, 63 | 63 | 0.0% | 1.00 | 0.444 | too few runs to resolve (least p 0.167) |
| fair.apart.helpers | permille | 426, 437, 415, 434, 428 | 428 | 5.1% | 458, 456, 453, 455 | 456 | 1.1% | 1.06 | 0.016 | ToyOS higher |
| fair.apart.threaded | permille | 510, 499, 521, 502, 508 | 508 | 4.3% | 478, 480, 483, 481 | 480 | 1.0% | 0.95 | 0.016 | ToyOS lower |
| fair.apart.total | chunks/s | 5076852, 4913683, 4866796, 3244981, 3238697 | 4866796 | 37.8% | 5067055, 5057100, 5050016, 5045009 | 5053558 | 0.4% | 1.04 | 0.190 | not resolved |
| fair.session.build | permille | 31, 31, 31, 33, 31 | 31 | 6.5% |  | - | - | - | - | ToyOS 4 run(s) absent |
| fair.session.helpers | permille | 465, 474, 462, 463, 468 | 465 | 2.6% |  | - | - | - | - | ToyOS 4 run(s) absent |
| fair.session.threaded | permille | 503, 496, 504, 505, 499 | 503 | 1.8% |  | - | - | - | - | ToyOS 4 run(s) absent |
| fair.session.total | chunks/s | 4997386, 4777498, 4729862, 3181572, 3182007 | 4729862 | 38.4% |  | - | - | - | - | ToyOS 4 run(s) absent |
| fair.shared.build | permille | 31, 31, 32, 32, 32 | 32 | 3.1% | 29, 30, 30, 29 | 30 | 3.4% | 0.92 | 0.008 | ToyOS lower |
| fair.shared.helpers | permille | 458, 459, 457, 464, 464 | 459 | 1.5% | 488, 489, 486, 491 | 488 | 1.0% | 1.06 | 0.008 | ToyOS higher |
| fair.shared.threaded | permille | 510, 508, 511, 505, 502 | 508 | 1.8% | 482, 480, 482, 480 | 481 | 0.4% | 0.95 | 0.016 | ToyOS lower |
| fair.shared.total | chunks/s | 5128978, 5056352, 5069283, 3286768, 3250381 | 5056352 | 37.2% | 4052665, 4037410, 4030832, 4026522 | 4034121 | 0.6% | 0.80 | 0.730 | not resolved |
| fs.disk.create_write_unlink | ns | 27371, 27357, 27371, 29124, 29049 | 27371 | 6.5% | 129469, 122246, 132896, 118689 | 125858 | 11.3% | 4.60 | 0.016 | ToyOS worse |
| fs.disk.mkdir_rmdir | ns | 36849, 37047, 37039, 38623, 38546 | 37047 | 4.8% | 85916, 83912, 72309, 78953 | 81432 | 16.7% | 2.20 | 0.016 | ToyOS worse |
| fs.disk.open_close | ns | 3046, 3037, 3036, 4400, 4330 | 3046 | 44.8% | 21070, 18586, 19457, 23074 | 20264 | 22.1% | 6.65 | 0.016 | ToyOS worse |
| fs.disk.read_4k_at | ns | 1462, 1473, 1483, 2444, 2375 | 1483 | 66.2% | 20490, 17053, 17013, 20179 | 18616 | 18.7% | 12.55 | 0.016 | ToyOS worse |
| fs.disk.readdir.1000 | ns | 431124, 445573, 434828, 440215, 436573 | 436573 | 3.3% | 681863, 678710, 677528, 684075 | 680286 | 1.0% | 1.56 | 0.016 | ToyOS worse |
| fs.disk.rename | ns | 9277, 9309, 9347, 10895, 10824 | 9347 | 17.3% | 61137, 67560, 66318, 77150 | 66939 | 23.9% | 7.16 | 0.016 | ToyOS worse |
| fs.disk.seq_read.1048576 | MB/s | 11448, 11457, 11479, 11161, 11188 | 11448 | 2.8% | 4844, 6456, 6399, 5935 | 6167 | 26.1% | 0.54 | 0.016 | ToyOS worse |
| fs.disk.seq_read.4096 | MB/s | 5084, 5089, 5108, 4962, 4999 | 5084 | 2.9% | 151, 162, 163, 152 | 157 | 7.6% | 0.03 | 0.016 | ToyOS worse |
| fs.disk.seq_write.1048576 | MB/s | 790, 798, 799, 819, 777 | 798 | 5.3% | 349, 378, 340, 342 | 346 | 11.0% | 0.43 | 0.016 | ToyOS worse |
| fs.disk.seq_write.4096 | MB/s | 724, 785, 725, 699, 706 | 724 | 11.9% | 214, 242, 239, 211 | 226 | 13.7% | 0.31 | 0.016 | ToyOS worse |
| fs.disk.stat | ns | 1443, 1453, 1462, 2863, 2863 | 1462 | 97.1% | 12294, 10570, 10621, 12565 | 11458 | 17.4% | 7.84 | 0.008 | ToyOS worse |
| fs.disk.tree.100 | ns | 3410887, 3412938, 3417999, 3476319, 3462841 | 3417999 | 1.9% | 12401093, 11917545, 11757435, 14532730 | 12159319 | 22.8% | 3.56 | 0.016 | ToyOS worse |
| fs.disk.write_4k_at | ns | 2114, 2084, 2054, 2934, 2933 | 2114 | 41.6% | 21151, 17474, 17594, 21171 | 19372 | 19.1% | 9.16 | 0.016 | ToyOS worse |
| fs.mem.create_write_unlink | ns | 12574, 12689, 12743, 14248, 14325 | 12743 | 13.7% | 10761, 10811, 10791, 10821 | 10801 | 0.6% | 0.85 | 0.016 | ToyOS better |
| fs.mem.mkdir_rmdir | ns | 6613, 6645, 6702, 8102, 8175 | 6702 | 23.3% | 7705, 7624, 7865, 7705 | 7705 | 3.1% | 1.15 | 0.683 | not resolved |
| fs.mem.open_close | ns | 2906, 2916, 2946, 4330, 4332 | 2946 | 48.4% | 6132, 6152, 6162, 6182 | 6157 | 0.8% | 2.09 | 0.016 | ToyOS worse |
| fs.mem.read_4k_at | ns | 1403, 1393, 1382, 2375, 2376 | 1403 | 70.8% | 1403, 1412, 1433, 1453 | 1422 | 3.5% | 1.01 | 0.786 | not resolved |
| fs.mem.readdir.1000 | ns | 270270, 272697, 275085, 275675, 277763 | 275085 | 2.7% | 1060423, 1061148, 1066528, 1069330 | 1063838 | 0.8% | 3.87 | 0.016 | ToyOS worse |
| fs.mem.rename | ns | 4459, 4510, 4538, 6077, 6080 | 4538 | 35.7% | 6272, 6292, 6312, 6242 | 6282 | 1.1% | 1.38 | 0.016 | ToyOS worse |
| fs.mem.seq_read.1048576 | MB/s | 8556, 8410, 8491, 8412, 8289 | 8412 | 3.2% | 8042, 7939, 8020, 8825 | 8031 | 11.0% | 0.95 | 0.286 | not resolved |
| fs.mem.seq_read.4096 | MB/s | 5528, 5466, 5475, 5283, 5411 | 5466 | 4.5% | 5322, 5324, 5361, 5230 | 5323 | 2.5% | 0.97 | 0.111 | not resolved |
| fs.mem.seq_write.1048576 | MB/s | 1538, 1529, 1530, 1502, 1505 | 1529 | 2.4% | 3443, 3408, 3404, 3400 | 3406 | 1.3% | 2.23 | 0.016 | ToyOS better |
| fs.mem.seq_write.4096 | MB/s | 1295, 1300, 1295, 1258, 1270 | 1295 | 3.2% | 2830, 2801, 2794, 2797 | 2799 | 1.3% | 2.16 | 0.016 | ToyOS better |
| fs.mem.stat | ns | 1493, 1503, 1513, 2863, 2865 | 1513 | 90.7% | 2635, 2605, 2606, 2625 | 2616 | 1.1% | 1.73 | 0.730 | not resolved |
| fs.mem.tree.100 | ns | 1431461, 1452436, 1465603, 1457995, 1469242 | 1457995 | 2.6% | 1379588, 1371868, 1388971, 1389610 | 1384280 | 1.3% | 0.95 | 0.016 | ToyOS better |
| fs.mem.write_4k_at | ns | 1753, 1754, 1823, 2863, 2865 | 1823 | 61.0% | 1523, 1513, 1603, 1633 | 1563 | 7.7% | 0.86 | 0.016 | ToyOS better |
| identity.cpuidle |  |  | - | - |  | - | - | - | - | Linux 5 run(s) absent; ToyOS 4 run(s) unsupported: the_kernel_names_its_idle_states_to_no_program |
| identity.nvme |  |  | - | - |  | - | - | - | - | Linux 5 run(s) absent; ToyOS 4 run(s) unsupported: the_NVMe_driver_keeps_its_controller's_identity_and_no_right_reads_it_from_another_program |
| identity.usb |  |  | - | - |  | - | - | - | - | Linux 5 run(s) absent; ToyOS 4 run(s) unsupported: usbd_keeps_its_devices_and_no_right_reads_them_from_another_program |
| ipc.connect_accept | ns | 10911, 10954, 10970, 12432, 12368 | 10970 | 13.9% | 2675, 2665, 2665, 2685 | 2670 | 0.7% | 0.24 | 0.016 | ToyOS better |
| ipc.reqrep.4096 | ns | 11392, 17308, 17323, 21092, 13765 | 17308 | 56.0% | 7955, 9959, 7956, 10200 | 8958 | 25.1% | 0.52 | 0.016 | ToyOS better |
| ipc.reqrep.65536 | ns | 48241, 48006, 48921, 46516, 36124 | 48006 | 26.7% | 37311, 48854, 37533, 49155 | 43194 | 27.4% | 0.90 | 0.905 | not resolved |
| ipc.reqrep.8 | ns | 7684, 14983, 15719, 13829, 10551 | 13829 | 58.1% | 6553, 8035, 6613, 8406 | 7324 | 25.3% | 0.53 | 0.063 | not resolved |
| ipc.reqrep_handle.8 | ns | 20238, 21077, 21099, 22490, 13486 | 21077 | 42.7% | 7876, 9869, 7905, 9959 | 8887 | 23.4% | 0.42 | 0.016 | ToyOS better |
| mem.anon.map | ns/MiB | 277, 287, 284, 339, 325 | 287 | 21.6% | 207, 203, 201, 202 | 202 | 3.0% | 0.71 | 0.016 | ToyOS lower |
| mem.anon.total | ns/MiB | 511195, 493506, 507018, 512771, 538295 | 511195 | 8.8% | 125944, 125704, 125433, 125256 | 125568 | 0.5% | 0.25 | 0.016 | ToyOS lower |
| mem.anon.touch | ns/MiB | 432190, 423122, 432965, 436961, 456231 | 432965 | 7.6% | 119988, 120052, 119894, 119732 | 119941 | 0.3% | 0.28 | 0.016 | ToyOS lower |
| mem.anon.unmap | ns/MiB | 78667, 70787, 73114, 74515, 82639 | 74515 | 15.9% | 5460, 5278, 5235, 5202 | 5256 | 4.9% | 0.07 | 0.016 | ToyOS lower |
| mem.bw.copy | MB/s | 8433, 8611, 8446, 8580, 8550 | 8550 | 2.1% | 8321, 8353, 8352, 8367 | 8352 | 0.6% | 0.98 | 0.016 | ToyOS worse |
| mem.bw.read | MB/s | 20059, 19826, 19686, 19814, 19496 | 19814 | 2.8% | 19388, 19594, 19445, 19746 | 19520 | 1.8% | 0.99 | 0.111 | not resolved |
| mem.bw.write | MB/s | 9525, 9401, 9442, 9380, 9323 | 9401 | 2.1% | 9669, 9699, 9709, 9729 | 9704 | 0.6% | 1.03 | 0.016 | ToyOS better |
| mem.first_touch.2m | ns/MiB | 132161, 133052, 131733, 134193, 132957 | 132957 | 1.9% | 128311, 128163, 128705, 128131 | 128237 | 0.4% | 0.96 | 0.016 | ToyOS lower |
| mem.first_touch.4k | ns/MiB | 431324, 437494, 432718, 452006, 441390 | 437494 | 4.7% | 128230, 128152, 128716, 128233 | 128232 | 0.4% | 0.29 | 0.016 | ToyOS lower |
| mem.malloc_churn.1048576.t1 | kops/s | 94, 88, 93, 97, 96 | 94 | 9.6% | 231, 194, 220, 197 | 208 | 17.7% | 2.22 | 0.016 | ToyOS higher |
| mem.malloc_churn.1048576.t16 | kops/s | 66, 67, 66, 67, 64 | 66 | 4.5% | 101, 99, 102, 100 | 100 | 3.0% | 1.52 | 0.008 | ToyOS higher |
| mem.malloc_churn.16.t1 | kops/s | 28161, 28062, 28060, 27754, 27749 | 28060 | 1.5% | 39432, 38631, 39233, 39215 | 39224 | 2.0% | 1.40 | 0.016 | ToyOS higher |
| mem.malloc_churn.16.t16 | kops/s | 1720, 1731, 1752, 1746, 1730 | 1731 | 1.8% | 2983, 2932, 2958, 2994 | 2970 | 2.1% | 1.72 | 0.016 | ToyOS higher |
| mem.malloc_churn.4096.t1 | kops/s | 22970, 22963, 22756, 22664, 22599 | 22756 | 1.6% | 37663, 36606, 37628, 37431 | 37530 | 2.8% | 1.65 | 0.016 | ToyOS higher |
| mem.malloc_churn.4096.t16 | kops/s | 1581, 1589, 1577, 1539, 1539 | 1577 | 3.2% | 2463, 2434, 2429, 2433 | 2434 | 1.4% | 1.54 | 0.016 | ToyOS higher |
| mem.map_touch_unmap.2m | ns/MiB | 136364, 137122, 136001, 138422, 137184 | 137122 | 1.8% | 135639, 135648, 136141, 135813 | 135730 | 0.4% | 0.99 | 0.032 | ToyOS lower |
| mem.map_touch_unmap.4k | ns/MiB | 500312, 507581, 502852, 522428, 511972 | 507581 | 4.4% | 134644, 134893, 135276, 134523 | 134768 | 0.6% | 0.27 | 0.016 | ToyOS lower |
| mem.map_unmap_4k | ns | 3947, 4008, 3979, 5362, 5587 | 4008 | 40.9% | 2255, 2284, 2305, 2274 | 2279 | 2.2% | 0.57 | 0.016 | ToyOS better |
| mem.memcpy.1024 | MB/s | 41394, 41130, 41212, 40718, 40563 | 41130 | 2.0% | 44070, 43800, 43791, 43791 | 43796 | 0.6% | 1.06 | 0.016 | ToyOS better |
| mem.memcpy.1048576 | MB/s | 11698, 11745, 11769, 11587, 11549 | 11698 | 1.9% | 10774, 11228, 11084, 11391 | 11156 | 5.5% | 0.95 | 0.016 | ToyOS worse |
| mem.memcpy.16384 | MB/s | 75203, 73707, 74225, 73611, 72964 | 73707 | 3.0% | 75800, 75381, 74861, 75280 | 75330 | 1.2% | 1.02 | 0.032 | ToyOS better |
| mem.memcpy.16777216 | MB/s | 6176, 6348, 6349, 6215, 6207 | 6215 | 2.8% | 6112, 6180, 6093, 6171 | 6142 | 1.4% | 0.99 | 0.032 | ToyOS worse |
| mem.memcpy.256 | MB/s | 16301, 16158, 16205, 16028, 16020 | 16158 | 1.7% | 14591, 14491, 14484, 14495 | 14493 | 0.7% | 0.90 | 0.016 | ToyOS worse |
| mem.memcpy.262144 | MB/s | 36472, 36881, 37114, 36354, 35873 | 36472 | 3.4% | 34857, 24633, 26760, 23259 | 25696 | 45.1% | 0.70 | 0.016 | ToyOS worse |
| mem.memcpy.4096 | MB/s | 86213, 85519, 85851, 84306, 84342 | 85519 | 2.2% | 89519, 88992, 88503, 88466 | 88748 | 1.2% | 1.04 | 0.016 | ToyOS better |
| mem.memcpy.4194304 | MB/s | 10851, 10865, 10948, 10770, 10773 | 10851 | 1.6% | 10872, 10996, 10828, 11001 | 10934 | 1.6% | 1.01 | 0.190 | not resolved |
| mem.memcpy.64 | MB/s | 6562, 6492, 6520, 6451, 6452 | 6492 | 1.7% | 3970, 3942, 3941, 3943 | 3942 | 0.7% | 0.61 | 0.016 | ToyOS worse |
| mem.memcpy.65536 | MB/s | 66420, 65906, 66205, 65452, 65093 | 65906 | 2.0% | 66869, 66482, 66326, 66357 | 66420 | 0.8% | 1.01 | 0.063 | not resolved |
| mem.memcpy.67108864 | MB/s | 6323, 6414, 6265, 6128, 6302 | 6302 | 4.5% | 6120, 6150, 6130, 6150 | 6140 | 0.5% | 0.97 | 0.095 | not resolved |
| mem.mprotect.4k | ns | 2124, 2134, 2134, 3352, 3353 | 2134 | 57.6% | 821, 821, 821, 821 | 821 | 0.0% | 0.38 | 0.016 | ToyOS better |
| mem.munmap_part.4k | ns | 3076, 3236, 3096, 4679, 4681 | 3236 | 49.6% | 1172, 1192, 1202, 1182 | 1187 | 2.5% | 0.37 | 0.016 | ToyOS better |
| mem.munmap_touched_remote.4k | ns | 4539, 4579, 4558, 5657, 5659 | 4579 | 24.5% | 2886, 2896, 3617, 2896 | 2896 | 25.2% | 0.63 | 0.016 | ToyOS better |
| mem.realloc_grow.1m_256m | ns | 203154, 202522, 201738, 210157, 218856 | 203154 | 8.4% | 61578, 48664, 57642, 41009 | 53153 | 38.7% | 0.26 | 0.016 | ToyOS better |
| mem.realloc_grow.last_128m_256m | ns | 52379, 52327, 52479, 53360, 54417 | 52479 | 4.0% | 7214, 7154, 7193, 7464 | 7204 | 4.3% | 0.14 | 0.016 | ToyOS better |
| net.tcp.connect_accept_close | ns | 48502, 48896, 49002, 76689, 77417 | 49002 | 59.0% |  | - | - | - | - | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.reqrep.64 | ns | 27241, 27059, 26870, 35272, 32420 | 27241 | 30.8% |  | - | - | - | - | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.1 | MB/s | 0, 0, 0, 0, 0 | 0 | - |  | - | - | - | - | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.65536 | MB/s | 2930, 2962, 2894, 2235, 2333 | 2894 | 25.1% |  | - | - | - | - | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.udp.reqrep.64 | ns | 22333, 14190, 22642, 31989, 24174 | 22642 | 78.6% |  | - | - | - | - | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| nvme.read.1m.seq |  |  | - | - |  | - | - | - | - | Linux 5 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 4 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| nvme.read.4k.random |  |  | - | - |  | - | - | - | - | Linux 5 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 4 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| persist.append_4k_fsync | ns | 3781337, 3300677, 3787935, 3797592, 3753323 | 3781337 | 13.1% | 2928332, 2937771, 2904226, 2742749 | 2916279 | 6.7% | 0.77 | 0.016 | ToyOS better |
| persist.create_fsync_unlink | ns | 3283416, 3257728, 3219666, 3095399, 3290424 | 3257728 | 6.0% | 3533628, 3571905, 3202772, 3106984 | 3368200 | 13.8% | 1.03 | 0.730 | not resolved |
| persist.fsync_clean | ns | 65764, 64053, 64982, 68654, 66337 | 65764 | 7.0% | 1263124, 1240705, 1253529, 1225111 | 1247117 | 3.0% | 18.96 | 0.016 | ToyOS worse |
| persist.seq_read_cached | MB/s | 6652, 6613, 6637, 10646, 11099 | 6652 | 67.4% | 2567, 2916, 2917, 3192 | 2916 | 21.4% | 0.44 | 0.016 | ToyOS worse |
| persist.seq_write_fsync | MB/s | 548, 544, 512, 516, 524 | 524 | 6.9% | 298, 330, 335, 336 | 332 | 11.4% | 0.63 | 0.016 | ToyOS worse |
| persist.write_4k_fsync | ns | 3578944, 2993976, 3598549, 3581081, 3618962 | 3581081 | 17.5% | 2600561, 2503022, 3128850, 2657254 | 2628908 | 23.8% | 0.73 | 0.032 | ToyOS better |
| pingpong.futex.cross_core | ns | 9648, 9838, 9864, 13611, 13937 | 9864 | 43.5% | 4328, 5742, 5581, 5841 | 5662 | 26.7% | 0.57 | 0.016 | ToyOS better |
| pingpong.futex.same_cpu | ns | 6141, 6248, 6229, 7608, 7836 | 6248 | 27.1% | 4389, 5891, 5641, 4319 | 5015 | 31.3% | 0.80 | 0.016 | ToyOS better |
| pingpong.pipe.cross_core | ns | 11121, 11440, 19809, 18777, 15021 | 15021 | 57.8% | 7474, 5722, 5721, 5771 | 5746 | 30.5% | 0.38 | 0.016 | ToyOS better |
| pingpong.pipe.same_cpu | ns | 7564, 7739, 7691, 9493, 9432 | 7739 | 24.9% | 5701, 5650, 5661, 5631 | 5656 | 1.2% | 0.73 | 0.016 | ToyOS better |
| pipe.throughput.1024 | MB/s | 1879, 1692, 1693, 1535, 1541 | 1692 | 20.3% | 2006, 1960, 1928, 1858 | 1944 | 7.6% | 1.15 | 0.032 | ToyOS better |
| pipe.throughput.16384 | MB/s | 3684, 3766, 3761, 3641, 3598 | 3684 | 4.6% | 6654, 6524, 6519, 6683 | 6589 | 2.5% | 1.79 | 0.016 | ToyOS better |
| pipe.throughput.256 | MB/s | 472, 428, 427, 422, 426 | 427 | 11.7% | 206, 193, 198, 192 | 196 | 7.2% | 0.46 | 0.016 | ToyOS worse |
| pipe.throughput.4096 | MB/s | 5734, 5724, 5705, 5454, 4908 | 5705 | 14.5% | 2061, 2104, 2071, 2075 | 2073 | 2.1% | 0.36 | 0.016 | ToyOS worse |
| pipe.throughput.64 | MB/s | 109, 115, 106, 107, 106 | 107 | 8.4% | 136, 134, 127, 125 | 130 | 8.4% | 1.22 | 0.016 | ToyOS better |
| pipe.throughput.65536 | MB/s | 2686, 2706, 2958, 2551, 1300 | 2686 | 61.7% | 5044, 5149, 5101, 5097 | 5099 | 2.1% | 1.90 | 0.016 | ToyOS better |
| proc.posix_spawn_wait.std | ns | 318761, 740403, 310181, 828345, 327668 | 327668 | 158.1% | 504181, 535934, 505496, 501411 | 504838 | 6.8% | 1.54 | 0.730 | not resolved |
| proc.posix_spawn_wait.tiny | ns | 90832, 91876, 92704, 229926, 100257 | 92704 | 150.0% | 76047, 73983, 73712, 76858 | 75015 | 4.2% | 0.81 | 0.016 | ToyOS better |
| proc.spawn_wait.large | ns | 259009, 273444, 273262, 284613, 286802 | 273444 | 10.2% | 186138, 180709, 159859, 155211 | 170284 | 18.2% | 0.62 | 0.016 | ToyOS better |
| proc.spawn_wait.tiny | ns | 268777, 254007, 109184, 266663, 281771 | 266663 | 64.7% | 66448, 74654, 69804, 69644 | 69724 | 11.8% | 0.26 | 0.016 | ToyOS better |
| proc.spawn_wait_loop.100 | ns | 11347294, 24686022, 30894773, 32556838, 32168045 | 30894773 | 68.7% | 5805235, 6268349, 6475971, 6241121 | 6254735 | 10.7% | 0.20 | 0.016 | ToyOS better |
| process.spawn_wait | ns | 911540, 927995, 798985, 931766, 346343 | 911540 | 64.2% | 538157, 541716, 521396, 531508 | 534832 | 3.8% | 0.59 | 0.190 | not resolved |
| syscall.null | ps | 156311, 156344, 156577, 158909, 160469 | 156577 | 2.7% | 48800, 48819, 49088, 49090 | 48954 | 0.6% | 0.31 | 0.016 | ToyOS lower |
| tail.diag.periodic.30s | ns |  | - | - | 5321, 5416, 5382, 5383 | 5382 | 1.8% | - | - | Linux 5 run(s) absent |
| tail.stolen.10s | ns | 32812, 32608, 33002, 38204, 39452 | 33002 | 20.7% | 21412, 21652, 23445, 24487 | 22548 | 13.6% | 0.68 | 0.016 | ToyOS better |
| tail.wake.periodic.60s | ns | 62313, 54203, 60762, 73802, 70424 | 62313 | 31.5% | 5361, 5417, 5400, 5389 | 5394 | 1.0% | 0.09 | 0.016 | ToyOS better |
| thread.spawn_join | ns | 72607, 64521, 53497, 78405, 78642 | 72607 | 34.6% | 40949, 41060, 41129, 42763 | 41094 | 4.4% | 0.57 | 0.016 | ToyOS better |
| thread.spawn_join.default | ns | 72877, 64558, 70241, 73336, 70634 | 70634 | 12.4% | 43594, 41741, 43284, 42643 | 42964 | 4.3% | 0.61 | 0.016 | ToyOS better |
| thread.spawn_join.stack64k | ns | 65844, 53083, 65943, 67679, 62878 | 65844 | 22.2% | 40618, 40027, 40799, 39487 | 40322 | 3.3% | 0.61 | 0.016 | ToyOS better |
| time.now | ps | 22479, 22612, 22674, 1212875, 1213166 | 22674 | 5251.3% | 9404, 9395, 9398, 9546 | 9401 | 1.6% | 0.41 | 0.016 | ToyOS lower |
| time.sleep_late.100us | ns | 60423, 60414, 60341, 65726, 73296 | 60423 | 21.4% | 4962, 4972, 4972, 5013 | 4972 | 1.0% | 0.08 | 0.016 | ToyOS better |
| time.sleep_late.100us.slack1ns | ns | 10439, 10411, 10402, 19076, 19161 | 10439 | 83.9% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.sleep_late.10ms | ns | 348850, 101786, 344207, 124799, 367002 | 344207 | 77.1% | 53710, 53245, 52905, 52588 | 53075 | 2.1% | 0.15 | 0.016 | ToyOS better |
| time.sleep_late.10ms.slack1ns | ns | 297454, 53159, 50797, 65942, 319473 | 65942 | 407.4% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.sleep_late.10us | ns | 53590, 53549, 53609, 61095, 69069 | 53609 | 29.0% | 1252, 1291, 1272, 1332 | 1282 | 6.2% | 0.02 | 0.016 | ToyOS better |
| time.sleep_late.10us.slack1ns | ns | 10498, 10431, 3556, 19053, 18708 | 10498 | 147.6% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.sleep_late.1ms | ns | 73817, 84895, 91525, 80331, 97890 | 84895 | 28.4% | 5437, 5481, 36891, 5527 | 5504 | 571.5% | 0.06 | 0.016 | ToyOS better |
| time.sleep_late.1ms.slack1ns | ns | 11629, 11671, 11672, 24472, 24328 | 11672 | 110.0% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.sleep_late.1us | ns | 53623, 53601, 53612, 61017, 61305 | 53623 | 14.4% | 1455, 1465, 1474, 1475 | 1470 | 1.4% | 0.03 | 0.016 | ToyOS better |
| time.sleep_late.1us.slack1ns | ns | 11945, 13299, 4922, 19672, 18139 | 13299 | 110.9% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.timer_1ms.late | ns | 69000, 70370, 61683, 74319, 79005 | 70370 | 24.6% | 46709, 46205, 46130, 45959 | 46168 | 1.6% | 0.66 | 0.016 | ToyOS better |
| time.timer_1ms.late.slack1ns | ns | 20800, 11587, 11679, 24290, 24393 | 20800 | 61.6% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.yield | ps | 544796, 550634, 553219, 555528, 552167 | 552167 | 1.9% |  | - | - | - | - | ToyOS 4 run(s) unsupported: no_yield_syscall:_std's_yield_now_is_a_spin-loop_hint |
| wake.onto_busy | ns | 5771, 7677, 8042, 10610, 10375 | 8042 | 60.2% | 15289, 15951, 15309, 15400 | 15354 | 4.3% | 1.91 | 0.016 | ToyOS worse |
| wake.periodic.idle | ns | 60806, 60728, 60488, 60481, 73753 | 60728 | 21.9% | 32857, 32779, 32889, 32764 | 32818 | 0.4% | 0.54 | 0.016 | ToyOS better |
| wake.periodic.idle.slack1ns | ns | 10814, 11488, 10548, 16386, 23803 | 11488 | 115.4% |  | - | - | - | - | ToyOS 4 run(s) absent |
| wake.periodic.loaded | ns | 54381, 54190, 54137, 58758, 59214 | 54381 | 9.3% | 3695, 3803, 3696, 3680 | 3696 | 3.3% | 0.07 | 0.016 | ToyOS better |
| wake.periodic.loaded.slack1ns | ns | 4197, 10216, 4139, 9048, 9639 | 9048 | 67.2% |  | - | - | - | - | ToyOS 4 run(s) absent |
| wake.storm.call.w1 | ns | 8566, 8358, 8873, 3699, 9505 | 8566 | 67.8% | 7574, 7244, 7134, 6804 | 7189 | 10.7% | 0.84 | 0.190 | not resolved |
| wake.storm.call.w16 | ns | 58200, 46440, 44534, 43904, 59421 | 46440 | 33.4% | 14919, 14809, 14918, 15230 | 14918 | 2.8% | 0.32 | 0.016 | ToyOS better |
| wake.storm.call.w4 | ns | 8907, 12718, 12939, 7120, 14221 | 12718 | 55.8% | 8236, 8647, 8616, 8396 | 8506 | 4.8% | 0.67 | 0.190 | not resolved |
| wake.storm.call.w64 | ns | 253538, 237406, 238646, 159703, 265109 | 238646 | 44.2% | 23455, 24217, 23705, 23766 | 23736 | 3.2% | 0.10 | 0.016 | ToyOS better |
| wake.storm.drain.w1 | ns | 76675, 79017, 78323, 376222, 88732 | 79017 | 379.1% | 47051, 60967, 61188, 61078 | 61022 | 23.2% | 0.77 | 0.016 | ToyOS better |
| wake.storm.drain.w16 | ns | 575687, 109880, 95539, 464798, 153087 | 153087 | 313.6% | 73882, 75496, 75215, 75847 | 75356 | 2.6% | 0.49 | 0.016 | ToyOS better |
| wake.storm.drain.w4 | ns | 76755, 80589, 78334, 360517, 89894 | 80589 | 352.1% | 66548, 64204, 64084, 66358 | 65281 | 3.8% | 0.81 | 0.016 | ToyOS better |
| wake.storm.drain.w64 | ns | 1214622, 683284, 696068, 453770, 587609 | 683284 | 111.4% | 239722, 246596, 244121, 234965 | 241922 | 4.8% | 0.35 | 0.016 | ToyOS better |
| work.build_shaped.j1 | ns | 1242990207, 1436881130, 1137872995, 1597830319, 1787303638 | 1436881130 | 45.2% | 854953993, 861933943, 911374947, 862131181 | 862032562 | 6.5% | 0.60 | 0.016 | ToyOS better |
| work.build_shaped.j16 | ns | 116739823, 114978423, 115071674, 130572803, 125080644 | 116739823 | 13.4% | 269373597, 271082552, 270268611, 271989025 | 270675582 | 1.0% | 2.32 | 0.016 | ToyOS worse |
| work.compress_inproc | ns | 442588799, 446432539, 445425523, 450611969, 449518362 | 446432539 | 1.8% | 424599348, 425766613, 426745774, 424082113 | 425182980 | 0.6% | 0.95 | 0.016 | ToyOS better |

Each p is its row's alone, uncorrected for the table's other rows.

