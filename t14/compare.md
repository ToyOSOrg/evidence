## 11th_Gen_Intel(R)_Core(TM)_i5-1135G7_@_2.40GHz

Runs: Linux 5, ToyOS 4. lan.peer_link: none. internet.link: none.

Linux setup: kernel=6.8.0-147-generic, cpufreq_driver=intel_pstate*8, governor=powersave*8, epp=balance_performance*8, min_khz=400000*8, max_khz=4200000*8, boost=absent, intel_no_turbo=0, platform_profile=balanced, smt_active=1, fs.mem.served_by=tmpfs,_through_the_VFS, fs.disk.served_by=ext4,_NVMe_disk,_model_SK_hynix_BC501_HFM256GDJTNG-8310A,_write_cache_write_back, persist.served_by=ext4,_NVMe_disk,_model_SK_hynix_BC501_HFM256GDJTNG-8310A,_write_cache_write_back.

Linux per run: clocksource=tsc,tsc,tsc,tsc,tsc.

ToyOS setup: fs.mem.served_by=the_kernel's_tmpfs,_through_syscalls, fs.disk.served_by=DATA_volume,_bcachefs_crate's_format,_DATA_file_server_over_the_block_service, persist.served_by=DATA_volume,_bcachefs_crate's_format,_DATA_file_server_over_the_block_service.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.chunk@fair | ns | 2994, 2994, 2994, 2887, 2994 | 2994 | 3.6% | 2993, 2993, 2993, 2993 | 2993 | 0.0% | 1.00 | 0.175 | not resolved |
| cpu.chunk@sched | ns | 2994, 2994, 2994, 2994, 2994 | 2994 | 0.0% | 2993, 2993, 2993, 2993 | 2993 | 0.0% | 1.00 | 0.008 | ToyOS better |
| cpu.chunk@system | ns | 2994, 2994, 2994, 2994, 2994 | 2994 | 0.0% | 2993, 2993, 2993, 2993 | 2993 | 0.0% | 1.00 | 0.008 | ToyOS better |
| cpu.clock@boot | MHz | 4189, 4190, 4190, 4190, 4190 | 4190 | 0.0% | 3790, 3790, 3790, 3790 | 3790 | 0.0% | 0.90 | 0.016 | ToyOS lower |
| cpu.clock@crunch | MHz | 4189, 4190, 4189, 4190, 4190 | 4190 | 0.0% | 4189, 4188, 4188, 4189 | 4188 | 0.0% | 1.00 | 0.079 | not resolved |
| cpu.clock@energy | MHz | 4190, 4190, 4190, 4190, 4190 | 4190 | 0.0% | 3790, 3790, 3789, 3789 | 3790 | 0.0% | 0.90 | 0.008 | ToyOS lower |
| cpu.clock@fair | MHz | 4190, 4190, 4190, 4344, 4190 | 4190 | 3.7% | 3790, 3790, 3790, 4188 | 3790 | 10.5% | 0.90 | 0.008 | ToyOS lower |
| cpu.clock@files | MHz | 1396, 1379, 1380, 1396, 1314 | 1380 | 5.9% | 4188, 4188, 4189, 4188 | 4188 | 0.0% | 3.03 | 0.008 | ToyOS higher |
| cpu.clock@identity | MHz | 4190, 4190, 4190, 4190, 4190 | 4190 | 0.0% | 3790, 3790, 3790, 3790 | 3790 | 0.0% | 0.90 | 0.008 | ToyOS lower |
| cpu.clock@ipc | MHz | 4190, 4189, 4191, 4189, 4188 | 4189 | 0.1% | 4189, 4188, 4188, 4188 | 4188 | 0.0% | 1.00 | 0.135 | not resolved |
| cpu.clock@mem | MHz | 4190, 4190, 4190, 4189, 4188 | 4190 | 0.0% | 4189, 4189, 4189, 4188 | 4189 | 0.0% | 1.00 | 0.302 | not resolved |
| cpu.clock@net | MHz | 4190, 4190, 4190, 4189, 4188 | 4190 | 0.0% | 4188, 4189, 4189, 4188 | 4188 | 0.0% | 1.00 | 0.238 | not resolved |
| cpu.clock@nvme | MHz | 1475, 1397, 1477, 1396, 1396 | 1397 | 5.8% | 4189, 4188, 4189, 4189 | 4189 | 0.0% | 3.00 | 0.016 | ToyOS higher |
| cpu.clock@persist | MHz | 4190, 4190, 4190, 4190, 4190 | 4190 | 0.0% | 4188, 4188, 4188, 4189 | 4188 | 0.0% | 1.00 | 0.008 | ToyOS lower |
| cpu.clock@procs | MHz | 4190, 4190, 4190, 4189, 4188 | 4190 | 0.0% | 4188, 4189, 4188, 4188 | 4188 | 0.0% | 1.00 | 0.111 | not resolved |
| cpu.clock@sched | MHz | 4190, 4190, 4190, 4190, 4190 | 4190 | 0.0% | 4189, 4188, 4188, 4189 | 4188 | 0.0% | 1.00 | 0.008 | ToyOS lower |
| cpu.clock@system | MHz | 4190, 4190, 4190, 4190, 4190 | 4190 | 0.0% | 4188, 4188, 4188, 4189 | 4188 | 0.0% | 1.00 | 0.008 | ToyOS lower |
| cpu.clock@tail | MHz | 4190, 4190, 4189, 4190, 4189 | 4190 | 0.0% | 4188, 4189, 4189, 4189 | 4189 | 0.0% | 1.00 | 0.119 | not resolved |
| cpu.clock@time | MHz | 4190, 4190, 4190, 4189, 4189 | 4190 | 0.0% | 4188, 4188, 4189, 4188 | 4188 | 0.0% | 1.00 | 0.048 | ToyOS lower |
| cpu.clock@work | MHz | 4190, 4190, 4189, 4189, 4189 | 4189 | 0.0% | 4189, 4188, 4189, 4189 | 4189 | 0.0% | 1.00 | 0.278 | too few runs to resolve (least p 0.119) |
| crunch.all.deflate | ns | 180619493, 180585176, 184932060, 185168484, 185570198 | 184932060 | 2.7% |  | - | - | - | - | the clock did not settle in 5 of 5 Linux run(s); ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.matmul | ns | 5122660, 5143684, 5193143, 5146505, 5192330 | 5146505 | 1.4% |  | - | - | - | - | the clock did not settle in 5 of 5 Linux run(s); ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.parse | ns | 2761856675, 2728929616, 2765527787, 2755050734, 2784535586 | 2761856675 | 2.0% |  | - | - | - | - | ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.sha256 | ns | 1976384, 1972483, 1984463, 1980602, 1984527 | 1980602 | 0.6% |  | - | - | - | - | the clock did not settle in 5 of 5 Linux run(s); ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.single.deflate | ns | 54924757, 54807172, 54844548, 54928438, 54975487 | 54924757 | 0.3% | 54409094, 54503360, 54446869, 54484798 | 54465834 | 0.2% | 0.99 | 0.016 | ToyOS better |
| crunch.single.matmul | ns | 1007999, 1171817, 1008660, 1007963, 1010133 | 1008660 | 16.2% | 1070344, 1071853, 1072553, 1069793 | 1071098 | 0.3% | 1.06 | 0.190 | not resolved; the clock fell in 5 of 5 Linux run(s) |
| crunch.single.parse | ns | 69012287, 68588503, 69183925, 69261536, 69022393 | 69022393 | 1.0% | 35070596, 35063575, 35091773, 35103369 | 35081184 | 0.1% | 0.51 | 0.016 | ToyOS better; settled clocks apart: Linux 3691 MHz, ToyOS 4188 MHz |
| crunch.single.sha256 | ns | 567490, 567410, 568126, 567535, 567912 | 567535 | 0.1% | 567189, 567188, 567189, 567192 | 567189 | 0.0% | 1.00 | 0.016 | ToyOS better |
| energy.idle_60s.package |  |  | - | - |  | - | - | - | - | Linux 5 run(s) unmeasured: energy_uj_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_energy`_reads_it; ToyOS 4 run(s) unsupported: no_counter_carries_the_package's_energy:_toyos_abi::counters::Counter_has_none |
| fair.apart.build | permille | 125, 124, 125, 125, 125 | 125 | 0.8% | 125, 125, 126, 126 | 126 | 0.8% | 1.00 | 0.119 | too few runs to resolve (least p 0.119) |
| fair.apart.helpers | permille | 420, 423, 419, 419, 418 | 419 | 1.2% | 430, 430, 429, 428 | 430 | 0.5% | 1.03 | 0.016 | ToyOS higher |
| fair.apart.threaded | permille | 453, 452, 454, 456, 456 | 454 | 0.9% | 444, 443, 444, 445 | 444 | 0.5% | 0.98 | 0.016 | ToyOS lower |
| fair.apart.total | chunks/s | 1659065, 1627583, 1613551, 1608515, 1617194 | 1617194 | 3.1% | 2363821, 2364009, 2366018, 2367552 | 2365014 | 0.2% | 1.46 | 0.016 | ToyOS higher |
| fair.session.build | permille | 63, 65, 60, 62, 61 | 62 | 8.1% |  | - | - | - | - | ToyOS 4 run(s) absent |
| fair.session.helpers | permille | 443, 444, 444, 453, 444 | 444 | 2.3% |  | - | - | - | - | ToyOS 4 run(s) absent |
| fair.session.threaded | permille | 492, 489, 491, 485, 491 | 491 | 1.4% |  | - | - | - | - | ToyOS 4 run(s) absent |
| fair.session.total | chunks/s | 1687083, 1673426, 1666671, 1664006, 1660851 | 1666671 | 1.6% |  | - | - | - | - | ToyOS 4 run(s) absent |
| fair.shared.build | permille | 59, 63, 59, 57, 57 | 59 | 10.2% | 58, 57, 58, 54 | 58 | 7.0% | 0.97 | 0.310 | not resolved |
| fair.shared.helpers | permille | 456, 452, 454, 449, 447 | 452 | 2.0% | 467, 470, 464, 474 | 468 | 2.1% | 1.04 | 0.016 | ToyOS higher |
| fair.shared.threaded | permille | 483, 482, 485, 489, 493 | 485 | 2.3% | 473, 470, 477, 473 | 473 | 1.5% | 0.98 | 0.016 | ToyOS lower |
| fair.shared.total | chunks/s | 2391885, 2392280, 2394146, 2422778, 2357210 | 2392280 | 2.7% | 2370857, 2366884, 2368417, 2369561 | 2368989 | 0.2% | 0.99 | 0.190 | not resolved |
| fs.disk.create_write_unlink | ns | 11372, 11294, 11356, 11162, 11271 | 11294 | 1.9% | 158117, 123008, 130892, 158820 | 144504 | 24.8% | 12.79 | 0.016 | ToyOS worse |
| fs.disk.mkdir_rmdir | ns | 14667, 14732, 15249, 15123, 15219 | 15123 | 3.8% | 110176, 85838, 89836, 113055 | 100006 | 27.2% | 6.61 | 0.016 | ToyOS worse |
| fs.disk.open_close | ns | 1203, 1276, 1205, 1200, 1206 | 1205 | 6.3% | 26869, 25999, 25103, 21888 | 25551 | 19.5% | 21.20 | 0.016 | ToyOS worse |
| fs.disk.read_4k_at | ns | 742, 724, 704, 754, 723 | 724 | 6.9% | 18244, 18081, 21301, 18340 | 18292 | 17.6% | 25.27 | 0.016 | ToyOS worse |
| fs.disk.readdir.1000 | ns | 275372, 272289, 274565, 275604, 275659 | 275372 | 1.2% | 901016, 907622, 808604, 909592 | 904319 | 11.2% | 3.28 | 0.016 | ToyOS worse |
| fs.disk.rename | ns | 3638, 3626, 3615, 3630, 3634 | 3630 | 0.6% | 87580, 88186, 76847, 90390 | 87883 | 15.4% | 24.21 | 0.016 | ToyOS worse |
| fs.disk.seq_read.1048576 | MB/s | 9426, 9299, 9363, 9209, 9307 | 9307 | 2.3% | 6960, 6867, 6090, 7000 | 6914 | 13.2% | 0.74 | 0.016 | ToyOS worse |
| fs.disk.seq_read.4096 | MB/s | 7780, 7760, 7718, 7712, 7730 | 7730 | 0.9% | 431, 434, 343, 423 | 427 | 21.3% | 0.06 | 0.016 | ToyOS worse |
| fs.disk.seq_write.1048576 | MB/s | 347, 346, 349, 348, 346 | 347 | 0.9% | 345, 373, 396, 352 | 362 | 14.1% | 1.04 | 0.254 | not resolved |
| fs.disk.seq_write.4096 | MB/s | 614, 631, 637, 639, 596 | 631 | 6.8% | 137, 139, 130, 142 | 138 | 8.7% | 0.22 | 0.016 | ToyOS worse |
| fs.disk.stat | ns | 587, 589, 579, 578, 583 | 583 | 1.9% | 11413, 11301, 13358, 11413 | 11413 | 18.0% | 19.58 | 0.016 | ToyOS worse |
| fs.disk.tree.100 | ns | 1355477, 1347166, 1342666, 1346121, 1343553 | 1346121 | 1.0% | 14171675, 14724838, 15120265, 14988451 | 14856644 | 6.4% | 11.04 | 0.016 | ToyOS worse |
| fs.disk.write_4k_at | ns | 730, 725, 708, 728, 717 | 725 | 3.0% | 18410, 18154, 21272, 18367 | 18388 | 17.0% | 25.36 | 0.016 | ToyOS worse |
| fs.mem.create_write_unlink | ns | 4687, 4715, 4783, 4724, 4685 | 4715 | 2.1% | 12855, 12810, 12791, 13392 | 12832 | 4.7% | 2.72 | 0.016 | ToyOS worse |
| fs.mem.mkdir_rmdir | ns | 2211, 2213, 2239, 2206, 2216 | 2213 | 1.5% | 8802, 8909, 9620, 9113 | 9011 | 9.1% | 4.07 | 0.016 | ToyOS worse |
| fs.mem.open_close | ns | 1110, 1113, 1114, 1114, 1200 | 1114 | 8.1% | 7242, 7318, 7264, 7804 | 7291 | 7.7% | 6.54 | 0.016 | ToyOS worse |
| fs.mem.read_4k_at | ns | 703, 692, 724, 710, 710 | 710 | 4.5% | 1218, 1236, 1208, 1226 | 1222 | 2.3% | 1.72 | 0.016 | ToyOS worse |
| fs.mem.readdir.1000 | ns | 177389, 176866, 178608, 178625, 176851 | 177389 | 1.0% | 1142081, 1142813, 1141588, 1142017 | 1142049 | 0.1% | 6.44 | 0.016 | ToyOS worse |
| fs.mem.rename | ns | 1624, 1628, 1640, 1602, 1624 | 1624 | 2.3% | 7333, 7415, 7282, 7749 | 7374 | 6.3% | 4.54 | 0.016 | ToyOS worse |
| fs.mem.seq_read.1048576 | MB/s | 9592, 9638, 9484, 9603, 9614 | 9603 | 1.6% | 7201, 7152, 7135, 7134 | 7144 | 0.9% | 0.74 | 0.016 | ToyOS worse |
| fs.mem.seq_read.4096 | MB/s | 8254, 8224, 8149, 8230, 8270 | 8230 | 1.5% | 4692, 4706, 4715, 4702 | 4704 | 0.5% | 0.57 | 0.016 | ToyOS worse |
| fs.mem.seq_write.1048576 | MB/s | 4573, 4588, 4530, 4589, 4585 | 4585 | 1.3% | 4689, 4600, 4577, 4601 | 4600 | 2.4% | 1.00 | 0.111 | not resolved |
| fs.mem.seq_write.4096 | MB/s | 3616, 3614, 3614, 3613, 3610 | 3614 | 0.2% | 3146, 3176, 3157, 3146 | 3152 | 1.0% | 0.87 | 0.016 | ToyOS worse |
| fs.mem.stat | ns | 585, 591, 576, 578, 584 | 584 | 2.6% | 3053, 3092, 3138, 3219 | 3115 | 5.3% | 5.33 | 0.016 | ToyOS worse |
| fs.mem.tree.100 | ns | 550940, 548925, 549002, 544935, 547076 | 548925 | 1.1% | 1490133, 1551899, 1508958, 1501432 | 1505195 | 4.1% | 2.74 | 0.016 | ToyOS worse |
| fs.mem.write_4k_at | ns | 628, 597, 604, 625, 625 | 625 | 5.0% | 1258, 1229, 1245, 1208 | 1237 | 4.0% | 1.98 | 0.016 | ToyOS worse |
| identity.cpuidle |  |  | - | - |  | - | - | - | - | Linux 5 run(s) absent; ToyOS 4 run(s) unsupported: the_kernel_names_its_idle_states_to_no_program |
| identity.nvme |  |  | - | - |  | - | - | - | - | Linux 5 run(s) absent; ToyOS 4 run(s) unsupported: the_NVMe_driver_keeps_its_controller's_identity_and_no_right_reads_it_from_another_program |
| identity.usb |  |  | - | - |  | - | - | - | - | Linux 5 run(s) absent; ToyOS 4 run(s) unsupported: usbd_keeps_its_devices_and_no_right_reads_them_from_another_program |
| ipc.connect_accept | ns | 3895, 3869, 3851, 3885, 3794 | 3869 | 2.6% | 3148, 3154, 3115, 3115 | 3132 | 1.2% | 0.81 | 0.016 | ToyOS better |
| ipc.reqrep.4096 | ns | 7208, 7226, 7118, 7127, 7178 | 7178 | 1.5% | 8655, 8706, 8708, 8603 | 8680 | 1.2% | 1.21 | 0.016 | ToyOS worse |
| ipc.reqrep.65536 | ns | 19114, 18958, 18811, 18839, 18714 | 18839 | 2.1% | 35689, 35696, 35511, 35636 | 35662 | 0.5% | 1.89 | 0.016 | ToyOS worse |
| ipc.reqrep.8 | ns | 3430, 3515, 3430, 4208, 3602 | 3515 | 22.1% | 7147, 7243, 7222, 7108 | 7184 | 1.9% | 2.04 | 0.016 | ToyOS worse |
| ipc.reqrep_handle.8 | ns | 7344, 7260, 7139, 7251, 7404 | 7260 | 3.7% | 8765, 8921, 8813, 8704 | 8789 | 2.5% | 1.21 | 0.016 | ToyOS worse |
| mem.anon.map | ns/MiB | 75, 89, 111, 106, 107 | 106 | 34.0% | 123, 112, 108, 119 | 116 | 13.0% | 1.09 | 0.032 | ToyOS higher |
| mem.anon.total | ns/MiB | 258323, 258523, 259213, 262385, 259488 | 259213 | 1.6% | 127207, 125709, 125596, 126190 | 125950 | 1.3% | 0.49 | 0.016 | ToyOS lower |
| mem.anon.touch | ns/MiB | 235409, 236144, 236484, 238189, 236075 | 236144 | 1.2% | 121193, 120292, 120499, 120217 | 120396 | 0.8% | 0.51 | 0.016 | ToyOS lower |
| mem.anon.unmap | ns/MiB | 22868, 22449, 23061, 24014, 23318 | 23061 | 6.8% | 3698, 4195, 3716, 4014 | 3865 | 12.9% | 0.17 | 0.016 | ToyOS lower |
| mem.bw.copy | MB/s | 6964, 6993, 6944, 6995, 6992 | 6992 | 0.7% | 6642, 6653, 6650, 6652 | 6651 | 0.2% | 0.95 | 0.016 | ToyOS worse |
| mem.bw.read | MB/s | 18032, 17692, 17939, 17262, 17408 | 17692 | 4.4% | 16983, 17313, 17970, 17449 | 17381 | 5.7% | 0.98 | 0.556 | not resolved |
| mem.bw.write | MB/s | 9381, 9434, 9302, 9377, 9348 | 9377 | 1.4% | 9583, 9595, 9567, 9566 | 9575 | 0.3% | 1.02 | 0.016 | ToyOS better |
| mem.first_touch.2m | ns/MiB | 100239, 101579, 99141, 99249, 100434 | 100239 | 2.4% | 123506, 123894, 123761, 124259 | 123828 | 0.6% | 1.24 | 0.016 | ToyOS higher |
| mem.first_touch.4k | ns/MiB | 237047, 237264, 236050, 236372, 236734 | 236734 | 0.5% | 124178, 127939, 128139, 127952 | 127946 | 3.1% | 0.54 | 0.016 | ToyOS lower |
| mem.malloc_churn.1048576.t1 | kops/s | 190, 178, 186, 186, 178 | 186 | 6.5% | 207, 207, 207, 207 | 207 | 0.0% | 1.11 | 0.016 | ToyOS higher; settled clocks apart: Linux 3392 MHz, ToyOS 4188 MHz |
| mem.malloc_churn.1048576.t8 | kops/s | 92, 90, 89, 88, 88 | 89 | 4.5% | 103, 106, 105, 107 | 106 | 3.8% | 1.19 | 0.016 | ToyOS higher; settled clocks apart: Linux 3093 MHz, ToyOS 4188 MHz |
| mem.malloc_churn.16.t1 | kops/s | 32463, 32471, 32257, 32448, 31835 | 32448 | 2.0% | 36598, 36622, 36609, 36587 | 36604 | 0.1% | 1.13 | 0.016 | ToyOS higher |
| mem.malloc_churn.16.t8 | kops/s | 2564, 2582, 3148, 2566, 3143 | 2582 | 22.6% | 4895, 4889, 4808, 4863 | 4876 | 1.8% | 1.89 | 0.016 | ToyOS higher; the clock fell in 1 of 5 Linux run(s) |
| mem.malloc_churn.4096.t1 | kops/s | 21048, 18451, 21179, 18856, 19112 | 19112 | 14.3% | 31117, 31108, 31162, 31131 | 31124 | 0.2% | 1.63 | 0.016 | ToyOS higher; the clock fell in 1 of 5 Linux run(s) |
| mem.malloc_churn.4096.t8 | kops/s | 874, 864, 851, 882, 864 | 864 | 3.6% | 3109, 3096, 3051, 3034 | 3074 | 2.4% | 3.56 | 0.016 | ToyOS higher; settled clocks apart: Linux 2992 MHz, ToyOS 4188 MHz |
| mem.map_touch_unmap.2m | ns/MiB | 101980, 103295, 100826, 100932, 102197 | 101980 | 2.4% | 129241, 129673, 128913, 130385 | 129457 | 1.1% | 1.27 | 0.016 | ToyOS higher |
| mem.map_touch_unmap.4k | ns/MiB | 258083, 258490, 257176, 257697, 258165 | 258083 | 0.5% | 128888, 132690, 133167, 132641 | 132666 | 3.2% | 0.51 | 0.016 | ToyOS lower |
| mem.map_unmap_4k | ns | 1603, 1597, 1598, 1633, 1592 | 1598 | 2.6% | 3209, 3196, 3234, 3219 | 3214 | 1.2% | 2.01 | 0.016 | ToyOS worse |
| mem.memcpy.1024 | MB/s | 70175, 73883, 78741, 79355, 77989 | 77989 | 11.8% | 85790, 84108, 84110, 84109 | 84110 | 2.0% | 1.08 | 0.016 | ToyOS better |
| mem.memcpy.1048576 | MB/s | 28233, 25236, 26836, 26835, 25404 | 26835 | 11.2% | 25230, 27872, 25196, 25693 | 25462 | 10.5% | 0.95 | 0.413 | not resolved |
| mem.memcpy.16384 | MB/s | 222069, 213503, 201387, 200439, 186017 | 201387 | 17.9% | 185486, 185242, 185487, 184873 | 185364 | 0.3% | 0.92 | 0.016 | ToyOS worse |
| mem.memcpy.16777216 | MB/s | 10392, 10869, 10905, 10910, 10770 | 10869 | 4.8% | 10382, 10350, 10421, 10406 | 10394 | 0.7% | 0.96 | 0.063 | not resolved |
| mem.memcpy.256 | MB/s | 24623, 24719, 24970, 24994, 24932 | 24932 | 1.5% | 30581, 28221, 28858, 31528 | 29720 | 11.1% | 1.19 | 0.016 | ToyOS better |
| mem.memcpy.262144 | MB/s | 55579, 55634, 55646, 55636, 55612 | 55634 | 0.1% | 55724, 55720, 55727, 55714 | 55722 | 0.0% | 1.00 | 0.016 | ToyOS better |
| mem.memcpy.4096 | MB/s | 159643, 158900, 154636, 156009, 160346 | 158900 | 3.6% | 164979, 164982, 164981, 164970 | 164980 | 0.0% | 1.04 | 0.016 | ToyOS better |
| mem.memcpy.4194304 | MB/s | 19489, 22055, 21348, 21006, 21762 | 21348 | 12.0% | 20983, 22669, 20701, 20878 | 20930 | 9.4% | 0.98 | 0.730 | not resolved |
| mem.memcpy.64 | MB/s | 6172, 6244, 6226, 6246, 6206 | 6226 | 1.2% | 19145, 19145, 17869, 17869 | 18507 | 6.9% | 2.97 | 0.016 | ToyOS better |
| mem.memcpy.65536 | MB/s | 54981, 55184, 55183, 55152, 55232 | 55183 | 0.5% | 55471, 55456, 55464, 55466 | 55465 | 0.0% | 1.01 | 0.016 | ToyOS better |
| mem.memcpy.67108864 | MB/s | 9620, 9677, 9732, 9667, 9678 | 9677 | 1.2% | 9267, 9290, 9247, 9236 | 9257 | 0.6% | 0.96 | 0.016 | ToyOS worse |
| mem.mprotect.4k | ns | 1016, 1016, 1016, 1013, 1015 | 1016 | 0.3% | 952, 947, 952, 949 | 950 | 0.5% | 0.94 | 0.016 | ToyOS better |
| mem.munmap_part.4k | ns | 1280, 1285, 1276, 1280, 1274 | 1280 | 0.9% | 1560, 1540, 1558, 1558 | 1558 | 1.3% | 1.22 | 0.016 | ToyOS worse |
| mem.munmap_touched_remote.4k | ns | 2283, 2317, 2293, 2286, 2290 | 2290 | 1.5% | 2996, 3012, 3045, 3045 | 3028 | 1.6% | 1.32 | 0.016 | ToyOS worse; the clock did not settle in 1 of 5 Linux run(s) |
| mem.realloc_grow.1m_256m | ns | 116364, 112449, 113841, 124983, 110967 | 113841 | 12.3% | 45821, 45344, 44273, 44153 | 44808 | 3.7% | 0.39 | 0.016 | ToyOS better; settled clocks apart: Linux 3392 MHz, ToyOS 4188 MHz |
| mem.realloc_grow.last_128m_256m | ns | 25823, 25007, 25654, 26860, 25136 | 25654 | 7.2% | 11932, 11910, 11226, 11214 | 11568 | 6.2% | 0.45 | 0.016 | ToyOS better |
| net.tcp.connect_accept_close | ns | 20873, 20913, 20892, 20914, 21086 | 20913 | 1.0% |  | - | - | - | - | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.reqrep.64 | ns | 8856, 8935, 8883, 9615, 8980 | 8935 | 8.5% |  | - | - | - | - | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.1 | MB/s | 1, 1, 1, 1, 1 | 1 | 0.0% |  | - | - | - | - | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.65536 | MB/s | 6719, 6611, 6757, 6766, 6673 | 6719 | 2.3% |  | - | - | - | - | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.udp.reqrep.64 | ns | 7278, 7203, 7367, 7305, 7287 | 7287 | 2.3% |  | - | - | - | - | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| nvme.read.1m.seq |  |  | - | - |  | - | - | - | - | Linux 5 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 4 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| nvme.read.4k.random |  |  | - | - |  | - | - | - | - | Linux 5 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 4 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| persist.append_4k_fsync | ns | 1200332, 911139, 828188, 1245311, 1082345 | 1082345 | 38.5% | 1012768, 6854360, 1036787, 1090151 | 1063469 | 549.3% | 0.98 | 0.730 | not resolved |
| persist.create_fsync_unlink | ns | 966415, 953976, 982047, 941910, 968879 | 966415 | 4.2% | 1168401, 5053711, 7096399, 1232099 | 3142905 | 188.6% | 3.25 | 0.016 | ToyOS worse |
| persist.fsync_clean | ns | 22970, 23012, 23041, 23005, 23017 | 23012 | 0.3% | 464505, 3418250, 497773, 575789 | 536781 | 550.3% | 23.33 | 0.016 | ToyOS worse |
| persist.seq_read_cached | MB/s | 10573, 10093, 9348, 10021, 10088 | 10088 | 12.1% | 6422, 6672, 5865, 6763 | 6547 | 13.7% | 0.65 | 0.016 | ToyOS worse |
| persist.seq_write_fsync | MB/s | 585, 527, 486, 579, 600 | 579 | 19.7% | 347, 149, 167, 311 | 239 | 82.8% | 0.41 | 0.016 | ToyOS worse |
| persist.write_4k_fsync | ns | 1035997, 1011579, 1008859, 1018863, 989277 | 1011579 | 4.6% | 1099737, 6647945, 1081265, 1076863 | 1090501 | 510.9% | 1.08 | 0.016 | ToyOS worse |
| pingpong.futex.cross_core | ns | 3341, 3343, 3319, 3349, 3335 | 3341 | 0.9% | 4566, 4553, 4668, 4582 | 4574 | 2.5% | 1.37 | 0.016 | ToyOS worse |
| pingpong.futex.same_cpu | ns | 2292, 2210, 2279, 2300, 2199 | 2279 | 4.4% | 4690, 4228, 4589, 4571 | 4580 | 10.1% | 2.01 | 0.016 | ToyOS worse |
| pingpong.pipe.cross_core | ns | 3723, 3932, 3710, 3712, 3712 | 3712 | 6.0% | 6383, 6761, 6864, 6844 | 6802 | 7.1% | 1.83 | 0.016 | ToyOS worse |
| pingpong.pipe.same_cpu | ns | 2877, 4504, 2879, 4556, 5325 | 4504 | 54.4% | 6170, 6248, 6202, 6167 | 6186 | 1.3% | 1.37 | 0.016 | ToyOS worse |
| pipe.throughput.1024 | MB/s | 1803, 1723, 1728, 1796, 1821 | 1796 | 5.5% | 1286, 1229, 1325, 1257 | 1272 | 7.6% | 0.71 | 0.016 | ToyOS worse |
| pipe.throughput.16384 | MB/s | 3905, 3890, 3842, 3895, 3823 | 3890 | 2.1% | 4871, 4822, 4873, 4883 | 4872 | 1.3% | 1.25 | 0.016 | ToyOS better |
| pipe.throughput.256 | MB/s | 639, 638, 637, 654, 646 | 639 | 2.7% | 345, 343, 363, 335 | 344 | 8.1% | 0.54 | 0.016 | ToyOS worse |
| pipe.throughput.4096 | MB/s | 4222, 4126, 4086, 4190, 4151 | 4151 | 3.3% | 3092, 3001, 3163, 3067 | 3080 | 5.3% | 0.74 | 0.016 | ToyOS worse |
| pipe.throughput.64 | MB/s | 170, 168, 167, 167, 166 | 167 | 2.4% | 89, 88, 88, 89 | 88 | 1.1% | 0.53 | 0.016 | ToyOS worse |
| pipe.throughput.65536 | MB/s | 4248, 4210, 4167, 4305, 4302 | 4248 | 3.2% | 7849, 7972, 7834, 7936 | 7892 | 1.7% | 1.86 | 0.016 | ToyOS better |
| proc.posix_spawn_wait.std | ns | 169127, 170293, 169630, 166708, 170251 | 169630 | 2.1% | 453194, 450403, 450132, 457801 | 451798 | 1.7% | 2.66 | 0.016 | ToyOS worse |
| proc.posix_spawn_wait.tiny | ns | 43839, 42980, 42794, 43698, 43819 | 43698 | 2.4% | 60812, 55209, 55801, 55644 | 55722 | 10.1% | 1.28 | 0.016 | ToyOS worse |
| proc.spawn_wait.large | ns | 55053, 54775, 53742, 54906, 55371 | 54906 | 3.0% | 186564, 211109, 212868, 193492 | 202300 | 13.0% | 3.68 | 0.016 | ToyOS worse |
| proc.spawn_wait.tiny | ns | 52614, 52094, 51964, 52115, 51987 | 52094 | 1.2% | 51552, 61530, 51116, 53545 | 52548 | 19.8% | 1.01 | 1.000 | not resolved |
| proc.spawn_wait_loop.100 | ns | 5418215, 5415162, 5334142, 5339216, 5414470 | 5414470 | 1.6% | 5389310, 5917585, 5767325, 5740434 | 5753880 | 9.2% | 1.06 | 0.111 | not resolved |
| process.spawn_wait | ns | 186219, 178132, 175528, 179602, 179133 | 179133 | 6.0% | 448988, 452377, 453458, 470162 | 452918 | 4.7% | 2.53 | 0.016 | ToyOS worse |
| syscall.null | ps | 91852, 91950, 91918, 91952, 91932 | 91932 | 0.1% | 68358, 69993, 69012, 68797 | 68904 | 2.4% | 0.75 | 0.016 | ToyOS lower |
| tail.diag.periodic.30s | ns |  | - | - | 17843, 17806, 17920, 17721 | 17824 | 1.1% | - | - | Linux 5 run(s) absent |
| tail.stolen.10s | ns | 32439, 42722, 32638, 36788, 29011 | 32638 | 42.0% | 35040, 23865, 23536, 25240 | 24552 | 46.9% | 0.75 | 0.111 | not resolved |
| tail.wake.periodic.60s | ns | 69412, 67379, 69381, 67639, 67579 | 67639 | 3.0% | 17824, 17813, 17858, 17692 | 17818 | 0.9% | 0.26 | 0.016 | ToyOS better |
| thread.spawn_join | ns | 24954, 25040, 25062, 24420, 25071 | 25040 | 2.6% | 28114, 28171, 28387, 28116 | 28144 | 1.0% | 1.12 | 0.016 | ToyOS worse |
| thread.spawn_join.default | ns | 25292, 24770, 24905, 25126, 25174 | 25126 | 2.1% | 28388, 28296, 28327, 28282 | 28312 | 0.4% | 1.13 | 0.016 | ToyOS worse |
| thread.spawn_join.stack64k | ns | 23592, 23569, 23340, 23441, 23390 | 23441 | 1.1% | 28543, 28461, 28581, 28716 | 28562 | 0.9% | 1.22 | 0.016 | ToyOS worse |
| time.now | ps | 14299, 14291, 14291, 14295, 14303 | 14295 | 0.1% | 19816, 19816, 19816, 19816 | 19816 | 0.0% | 1.39 | 0.016 | ToyOS higher |
| time.sleep_late.100us | ns | 51853, 51851, 51842, 51827, 51859 | 51851 | 0.1% | 4531, 4500, 4264, 4274 | 4387 | 6.1% | 0.08 | 0.016 | ToyOS better |
| time.sleep_late.100us.slack1ns | ns | 1823, 1830, 1864, 1811, 1834 | 1830 | 2.9% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.sleep_late.10ms | ns | 225616, 215876, 215644, 213579, 221353 | 215876 | 5.6% | 26817, 28319, 28114, 27363 | 27738 | 5.4% | 0.13 | 0.016 | ToyOS better |
| time.sleep_late.10ms.slack1ns | ns | 166865, 164019, 168105, 168815, 167464 | 167464 | 2.9% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.sleep_late.10us | ns | 51826, 51824, 51822, 51806, 51828 | 51824 | 0.0% | 1164, 1156, 1166, 1140 | 1160 | 2.2% | 0.02 | 0.016 | ToyOS better |
| time.sleep_late.10us.slack1ns | ns | 1822, 1826, 1829, 1806, 1813 | 1822 | 1.3% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.sleep_late.1ms | ns | 71453, 71579, 73922, 71628, 72821 | 71628 | 3.4% | 20900, 22299, 22460, 12600 | 21600 | 45.6% | 0.30 | 0.016 | ToyOS better |
| time.sleep_late.1ms.slack1ns | ns | 20378, 20339, 20832, 20385, 20539 | 20385 | 2.4% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.sleep_late.1us | ns | 51825, 51828, 51818, 51803, 51827 | 51825 | 0.0% | 1389, 1381, 1396, 1376 | 1385 | 1.4% | 0.03 | 0.016 | ToyOS better |
| time.sleep_late.1us.slack1ns | ns | 5666, 4278, 3985, 4221, 4298 | 4278 | 39.3% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.timer_1ms.late | ns | 173046, 70222, 70122, 55357, 70519 | 70222 | 167.6% | 12989, 12705, 12718, 12721 | 12720 | 2.2% | 0.18 | 0.016 | ToyOS better |
| time.timer_1ms.late.slack1ns | ns | 20430, 20422, 97123, 118887, 20337 | 20430 | 482.4% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.yield | ps | 190450, 190630, 190677, 191563, 190742 | 190677 | 0.6% |  | - | - | - | - | ToyOS 4 run(s) unsupported: no_yield_syscall:_std's_yield_now_is_a_spin-loop_hint |
| wake.onto_busy | ns | 2321, 2439, 2233, 2201, 2260 | 2260 | 10.5% | 3890, 3900, 3894, 3887 | 3892 | 0.3% | 1.72 | 0.016 | ToyOS worse |
| wake.periodic.idle | ns | 69387, 69368, 59104, 67636, 62572 | 67636 | 15.2% | 17776, 17775, 17853, 17926 | 17814 | 0.8% | 0.26 | 0.016 | ToyOS better |
| wake.periodic.idle.slack1ns | ns | 17570, 21720, 17392, 17837, 17683 | 17683 | 24.5% |  | - | - | - | - | ToyOS 4 run(s) absent |
| wake.periodic.loaded | ns | 52347, 52424, 52350, 52331, 52384 | 52350 | 0.2% | 3027, 3020, 3011, 3035 | 3024 | 0.8% | 0.06 | 0.016 | ToyOS better |
| wake.periodic.loaded.slack1ns | ns | 2420, 2353, 2350, 2342, 2348 | 2350 | 3.3% |  | - | - | - | - | ToyOS 4 run(s) absent |
| wake.storm.call.w1 | ns | 4652, 3275, 3092, 3955, 3538 | 3538 | 44.1% | 881, 1094, 1115, 2182 | 1104 | 117.8% | 0.31 | 0.016 | ToyOS better |
| wake.storm.call.w16 | ns | 65324, 56648, 58756, 56742, 55299 | 56742 | 17.7% | 14020, 13668, 14053, 13477 | 13844 | 4.2% | 0.24 | 0.016 | ToyOS better |
| wake.storm.call.w4 | ns | 11694, 10146, 11358, 9649, 11371 | 11358 | 18.0% | 8904, 8760, 9485, 9652 | 9194 | 9.7% | 0.81 | 0.032 | ToyOS better |
| wake.storm.call.w64 | ns | 256297, 237921, 247721, 234501, 258385 | 247721 | 9.6% | 20989, 22744, 24387, 21675 | 22210 | 15.3% | 0.09 | 0.016 | ToyOS better |
| wake.storm.drain.w1 | ns | 25746, 24423, 19173, 100684, 28349 | 25746 | 316.6% | 17876, 18129, 18188, 21008 | 18158 | 17.2% | 0.71 | 0.032 | ToyOS better |
| wake.storm.drain.w16 | ns | 1052236, 658730, 621311, 698634, 229079 | 658730 | 125.0% | 147254, 150673, 162423, 153307 | 151990 | 10.0% | 0.23 | 0.016 | ToyOS better |
| wake.storm.drain.w4 | ns | 117278, 129058, 122472, 122165, 128075 | 122472 | 9.6% | 128712, 117172, 133071, 124856 | 126784 | 12.5% | 1.04 | 0.730 | not resolved |
| wake.storm.drain.w64 | ns | 278210, 284437, 458003, 291290, 266559 | 284437 | 67.3% | 274104, 295968, 287915, 278822 | 283368 | 7.7% | 1.00 | 1.000 | not resolved |
| work.build_shaped.j1 | ns | 962310302, 1064625353, 985237756, 916604556, 980575667 | 980575667 | 15.1% | 678704866, 747218864, 681327791, 681745005 | 681536398 | 10.1% | 0.70 | 0.016 | ToyOS better |
| work.build_shaped.j8 | ns | 99148404, 99193332, 98218913, 98150044, 99341740 | 99148404 | 1.2% | 166265575, 162748105, 166783714, 166225480 | 166245528 | 2.4% | 1.68 | 0.016 | ToyOS worse |
| work.compress_inproc | ns | 361594099, 361967543, 361779894, 361701428, 362125046 | 361779894 | 0.1% | 358347841, 358347963, 358124101, 358040791 | 358235971 | 0.1% | 0.99 | 0.016 | ToyOS better |

Each p is its row's alone, uncorrected for the table's other rows.

