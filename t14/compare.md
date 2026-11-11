## t14-bench-cpu

Runs: Linux 5, ToyOS 4. lan.peer_link: none. internet.link: none.

Linux setup: kernel=6.8.0-147-generic, cpufreq_driver=intel_pstate*8, governor=powersave*8, epp=balance_performance*8, min_khz=400000*8, max_khz=4200000*8, boost=absent, intel_no_turbo=0, platform_profile=balanced, smt_active=1, fs.mem.served_by=tmpfs,_through_the_VFS, fs.disk.served_by=ext4,_NVMe_disk,_model_masked,_write_cache_write_back, persist.served_by=ext4,_NVMe_disk,_model_masked,_write_cache_write_back.

Linux per run: clocksource=tsc,tsc,tsc,tsc,tsc.

ToyOS setup: fs.mem.served_by=the_userland_memory_filesystem, fs.disk.served_by=DATA_volume,_bcachefs_crate's_format,_DATA_file_server_over_the_block_service, persist.served_by=DATA_volume,_bcachefs_crate's_format,_DATA_file_server_over_the_block_service.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.chunk@fair | ns | 2994, 2995, 2994, 2995, 2994 | 2994 | 0.0% | 3000, 3000, 3000, 3000 | 3000 | 0.0% | 1.00 | 0.008 | ToyOS worse |
| cpu.chunk@sched | ns | 2994, 2995, 2994, 2994, 2994 | 2994 | 0.0% | 3000, 3000, 3000, 3001 | 3000 | 0.0% | 1.00 | 0.016 | ToyOS worse |
| cpu.chunk@system | ns | 2994, 2995, 2994, 2994, 2994 | 2994 | 0.0% | 3000, 3000, 3000, 3002 | 3000 | 0.1% | 1.00 | 0.016 | ToyOS worse |
| cpu.clock@boot | MHz | 4190, 4188, 4190, 4189, 4190 | 4190 | 0.0% | 4132, 4130, 4168, 3792 | 4131 | 9.1% | 0.99 | 0.016 | ToyOS lower |
| cpu.clock@crunch | MHz | 4190, 4190, 4190, 4191, 4190 | 4190 | 0.0% | 4189, 4189, 4190, 4190 | 4190 | 0.0% | 1.00 | 0.119 | too few runs to resolve (least p 0.119) |
| cpu.clock@fair | MHz | 4190, 4189, 4189, 4189, 4190 | 4189 | 0.0% | 3791, 3791, 3791, 3791 | 3791 | 0.0% | 0.90 | 0.008 | ToyOS lower |
| cpu.clock@files | MHz | 1379, 1396, 1380, 1379, 1396 | 1380 | 1.2% | 4190, 4190, 4190, 4190 | 4190 | 0.0% | 3.04 | 0.008 | ToyOS higher |
| cpu.clock@ipc | MHz | 4190, 4190, 4190, 4190, 4190 | 4190 | 0.0% | 4190, 4190, 4190, 4190 | 4190 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 1.000) |
| cpu.clock@mem | MHz | 4190, 4189, 4190, 4190, 4190 | 4190 | 0.0% | 4190, 4190, 4190, 4190 | 4190 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.444) |
| cpu.clock@net | MHz | 4190, 4189, 4190, 4189, 4190 | 4190 | 0.0% | 4190, 4190, 4190, 4190 | 4190 | 0.0% | 1.00 | 0.444 | too few runs to resolve (least p 0.167) |
| cpu.clock@nvme | MHz | 1468, 1396, 1478, 1397, 1396 | 1397 | 5.9% | 4190, 4190, 4189, 4190 | 4190 | 0.0% | 3.00 | 0.016 | ToyOS higher |
| cpu.clock@persist | MHz | 4190, 4190, 4190, 4191, 4190 | 4190 | 0.0% | 4190, 4190, 4190, 4190 | 4190 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.444) |
| cpu.clock@procs | MHz | 4190, 4189, 4190, 4190, 4190 | 4190 | 0.0% | 4190, 4190, 4190, 4190 | 4190 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.444) |
| cpu.clock@sched | MHz | 4190, 4189, 4189, 4189, 4190 | 4189 | 0.0% | 4190, 4190, 4190, 4190 | 4190 | 0.0% | 1.00 | 0.167 | not resolved |
| cpu.clock@system | MHz | 4190, 4188, 4189, 4189, 4190 | 4189 | 0.0% | 4190, 3791, 3791, 4152 | 3972 | 10.0% | 0.95 | 0.159 | not resolved |
| cpu.clock@tail | MHz | 4190, 4190, 4190, 4189, 4190 | 4190 | 0.0% | 4190, 4190, 4190, 4190 | 4190 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.444) |
| cpu.clock@time | MHz | 4190, 4190, 4190, 4190, 4190 | 4190 | 0.0% | 4190, 4190, 4190, 4190 | 4190 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 1.000) |
| cpu.clock@work | MHz | 4190, 4190, 4190, 4189, 4190 | 4190 | 0.0% | 4190, 4190, 4190, 4190 | 4190 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.444) |
| crunch.all.deflate | ns | 89636804, 183638799, 179750293, 180680964, 89575550 | 179750293 | 52.3% |  | - | - | - | - | the clock did not settle in 3 of 5 Linux run(s); ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.matmul | ns | 2224957, 5143758, 5164659, 5200738, 2232998 | 5143758 | 57.9% |  | - | - | - | - | the clock did not settle in 3 of 5 Linux run(s); ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.parse | ns | 2754561498, 2780492845, 2761384153 | 2761384153 | 0.9% |  | - | - | - | - | Linux 2 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.sha256 | ns | 991110, 1978056, 1973499, 1979778, 991174 | 1973499 | 50.1% |  | - | - | - | - | the clock did not settle in 3 of 5 Linux run(s); ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.single.deflate | ns | 54732570, 54776473, 54720412, 54700909, 54682005 | 54720412 | 0.2% | 54513535, 54507522, 54511756, 54478980 | 54509639 | 0.1% | 1.00 | 0.016 | ToyOS better |
| crunch.single.matmul | ns | 1009088, 1008273, 1089314, 1033420, 1008053 | 1009088 | 8.1% | 1056947, 1056801, 1056940, 1057148 | 1056944 | 0.0% | 1.05 | 0.190 | not resolved; the clock fell in 3 of 5 Linux run(s) |
| crunch.single.parse | ns | 58371893, 68072486, 68293646, 67478300, 58244571 | 67478300 | 14.9% | 35064465, 34677094, 35357278, 35343035 | 35203750 | 1.9% | 0.52 | 0.016 | ToyOS better; settled clocks apart: Linux 3692 MHz, ToyOS 4189 MHz |
| crunch.single.sha256 | ns | 567657, 567885, 567913, 567614, 567448 | 567657 | 0.1% | 555351, 555347, 555360, 555390 | 555356 | 0.0% | 0.98 | 0.016 | ToyOS better |
| fair.apart.build | permille | 124, 125, 124, 125, 124 | 124 | 0.8% | 125, 126, 125, 126 | 126 | 0.8% | 1.01 | 0.079 | not resolved |
| fair.apart.helpers | permille | 422, 422, 417, 415, 426 | 422 | 2.6% | 429, 427, 430, 427 | 428 | 0.7% | 1.01 | 0.016 | ToyOS higher |
| fair.apart.threaded | permille | 451, 451, 457, 458, 449 | 451 | 2.0% | 443, 446, 443, 446 | 444 | 0.7% | 0.99 | 0.016 | ToyOS lower |
| fair.apart.total | chunks/s | 2390172, 1652015, 1649482, 1653127, 2390222 | 1653127 | 44.8% | 2361025, 2358432, 2354329, 2361103 | 2359728 | 0.3% | 1.43 | 0.730 | not resolved |
| fair.session.build | permille | 56, 61, 64, 65, 61 | 61 | 14.8% |  | - | - | - | - | ToyOS 4 run(s) absent |
| fair.session.helpers | permille | 458, 443, 445, 448, 449 | 448 | 3.3% |  | - | - | - | - | ToyOS 4 run(s) absent |
| fair.session.threaded | permille | 484, 495, 488, 488, 490 | 488 | 2.3% |  | - | - | - | - | ToyOS 4 run(s) absent |
| fair.session.total | chunks/s | 2391256, 1682506, 1677706, 1683526, 2391813 | 1683526 | 42.4% |  | - | - | - | - | ToyOS 4 run(s) absent |
| fair.shared.build | permille | 62, 61, 63, 59, 57 | 61 | 9.8% | 55, 59, 59, 57 | 58 | 6.9% | 0.95 | 0.143 | not resolved |
| fair.shared.helpers | permille | 444, 445, 452, 442, 450 | 445 | 2.2% | 465, 477, 464, 465 | 465 | 2.8% | 1.04 | 0.016 | ToyOS higher |
| fair.shared.threaded | permille | 488, 489, 484, 496, 490 | 489 | 2.5% | 477, 465, 476, 480 | 476 | 3.1% | 0.97 | 0.016 | ToyOS lower |
| fair.shared.total | chunks/s | 2391626, 2391673, 2391540, 2391739, 2391780 | 2391673 | 0.0% | 2369040, 2370199, 2366881, 2370400 | 2369620 | 0.1% | 0.99 | 0.016 | ToyOS lower |
| fs.disk.create_write_unlink | ns | 11263, 11249, 11346, 11243, 11166 | 11249 | 1.6% | 120415, 120833, 120425, 120986 | 120629 | 0.5% | 10.72 | 0.016 | ToyOS worse |
| fs.disk.direct.fstat | ns |  | - | - | 9961, 9214, 9077, 9704 | 9459 | 9.3% | - | - | Linux 5 run(s) absent |
| fs.disk.direct.pread_4k | ns |  | - | - | 8355, 8425, 8354, 8497 | 8390 | 1.7% | - | - | Linux 5 run(s) absent |
| fs.disk.direct.read_4k_at | ns |  | - | - | 15575, 15652, 15758, 15582 | 15617 | 1.2% | - | - | Linux 5 run(s) absent |
| fs.disk.direct.seek | ns |  | - | - | 7037, 7150, 7049, 7127 | 7088 | 1.6% | - | - | Linux 5 run(s) absent |
| fs.disk.direct.stat | ns |  | - | - | 10921, 11147, 10976, 11087 | 11032 | 2.0% | - | - | Linux 5 run(s) absent |
| fs.disk.fstat | ns | 213, 215, 230, 230, 214 | 215 | 7.9% | 9496, 9568, 9414, 9573 | 9532 | 1.7% | 44.33 | 0.008 | ToyOS worse |
| fs.disk.mkdir_rmdir | ns | 14672, 14642, 14673, 14675, 14580 | 14672 | 0.6% | 77494, 77741, 77584, 77746 | 77662 | 0.3% | 5.29 | 0.016 | ToyOS worse |
| fs.disk.open_close | ns | 1226, 1219, 1203, 1198, 1218 | 1218 | 2.3% | 21419, 21676, 21442, 21645 | 21544 | 1.2% | 17.69 | 0.016 | ToyOS worse |
| fs.disk.pread_4k | ns | 615, 587, 568, 592, 550 | 587 | 11.1% | 766, 801, 856, 749 | 784 | 13.7% | 1.33 | 0.016 | ToyOS worse |
| fs.disk.pread_8 | ns | 376, 377, 372, 377, 374 | 376 | 1.3% | 556, 520, 636, 533 | 544 | 21.3% | 1.45 | 0.008 | ToyOS worse |
| fs.disk.read_4k | ns | 637, 601, 590, 603, 544 | 601 | 15.5% | 752, 772, 754, 750 | 753 | 2.9% | 1.25 | 0.016 | ToyOS worse |
| fs.disk.read_4k_at | ns | 750, 711, 693, 715, 730 | 715 | 8.0% | 1031, 1042, 1070, 1083 | 1056 | 4.9% | 1.48 | 0.016 | ToyOS worse |
| fs.disk.readdir.1000 | ns | 274766, 275421, 275133, 272985, 273995 | 274766 | 0.9% | 2854664, 2842084, 2854733, 2898210 | 2854698 | 2.0% | 10.39 | 0.016 | ToyOS worse |
| fs.disk.rename | ns | 3586, 3589, 3619, 3608, 3595 | 3595 | 0.9% | 43662, 44147, 43777, 43885 | 43831 | 1.1% | 12.19 | 0.016 | ToyOS worse |
| fs.disk.reopen_read_4k | ns | 1511, 1539, 1539, 1525, 1542 | 1539 | 2.0% | 21964, 22120, 21933, 22076 | 22020 | 0.8% | 14.31 | 0.016 | ToyOS worse |
| fs.disk.seek | ns | 117, 117, 117, 118, 118 | 117 | 0.9% | 246, 247, 248, 246 | 246 | 0.8% | 2.11 | 0.008 | ToyOS worse |
| fs.disk.seq_read.1048576 | MB/s | 9028, 9516, 9498, 9521, 9668 | 9516 | 6.7% | 7141, 7321, 7308, 7189 | 7248 | 2.5% | 0.76 | 0.016 | ToyOS worse |
| fs.disk.seq_read.4096 | MB/s | 7556, 7694, 7718, 7694, 7799 | 7694 | 3.2% | 5412, 5423, 5335, 5392 | 5402 | 1.6% | 0.70 | 0.016 | ToyOS worse |
| fs.disk.seq_write.1048576 | MB/s | 350, 344, 350, 346, 347 | 347 | 1.7% | 492, 507, 505, 502 | 504 | 3.0% | 1.45 | 0.008 | ToyOS better |
| fs.disk.seq_write.4096 | MB/s | 628, 634, 644, 641, 626 | 634 | 2.8% | 178, 180, 177, 180 | 179 | 1.7% | 0.28 | 0.016 | ToyOS worse |
| fs.disk.stat | ns | 577, 578, 583, 584, 576 | 578 | 1.4% | 12261, 12362, 12237, 14885 | 12312 | 21.5% | 21.30 | 0.016 | ToyOS worse |
| fs.disk.tree.100 | ns | 1349906, 1349950, 1356306, 1348883, 1337790 | 1349906 | 1.4% | 20248453, 19685583, 20283952, 19693152 | 19970802 | 3.0% | 14.79 | 0.016 | ToyOS worse |
| fs.disk.write_4k_at | ns | 725, 714, 691, 721, 724 | 721 | 4.7% | 22590, 22316, 22276, 22526 | 22421 | 1.4% | 31.10 | 0.016 | ToyOS worse |
| fs.mem.create_write_unlink | ns | 4686, 4624, 4651, 4703, 4628 | 4651 | 1.7% | 30473, 30556, 30479, 30640 | 30518 | 0.5% | 6.56 | 0.016 | ToyOS worse |
| fs.mem.direct.fstat | ns |  | - | - | 7183, 7271, 7261, 7326 | 7266 | 2.0% | - | - | Linux 5 run(s) absent |
| fs.mem.direct.pread_4k | ns |  | - | - | 8401, 8427, 7976, 8510 | 8414 | 6.3% | - | - | Linux 5 run(s) absent |
| fs.mem.direct.read_4k_at | ns |  | - | - | 15567, 15580, 15602, 15585 | 15582 | 0.2% | - | - | Linux 5 run(s) absent |
| fs.mem.direct.seek | ns |  | - | - | 7080, 7090, 7077, 7137 | 7085 | 0.8% | - | - | Linux 5 run(s) absent |
| fs.mem.direct.stat | ns |  | - | - | 8244, 8355, 8325, 8299 | 8312 | 1.3% | - | - | Linux 5 run(s) absent |
| fs.mem.fstat | ns | 213, 213, 229, 229, 213 | 213 | 7.5% | 7480, 7601, 7533, 7586 | 7560 | 1.6% | 35.49 | 0.008 | ToyOS worse |
| fs.mem.mkdir_rmdir | ns | 2193, 2180, 2206, 2190, 2172 | 2190 | 1.6% | 20097, 20150, 19926, 20200 | 20124 | 1.4% | 9.19 | 0.016 | ToyOS worse |
| fs.mem.open_close | ns | 1117, 1119, 1129, 1114, 1119 | 1119 | 1.3% | 12179, 12271, 14277, 12310 | 12290 | 17.1% | 10.98 | 0.016 | ToyOS worse |
| fs.mem.pread_4k | ns | 529, 575, 540, 574, 577 | 574 | 8.4% | 759, 730, 722, 728 | 729 | 5.1% | 1.27 | 0.016 | ToyOS worse |
| fs.mem.pread_8 | ns | 349, 343, 340, 343, 337 | 343 | 3.5% | 528, 522, 523, 518 | 522 | 1.9% | 1.52 | 0.016 | ToyOS worse |
| fs.mem.read_4k | ns | 559, 546, 531, 560, 551 | 551 | 5.3% | 797, 742, 782, 743 | 762 | 7.2% | 1.38 | 0.016 | ToyOS worse |
| fs.mem.read_4k_at | ns | 728, 716, 685, 670, 655 | 685 | 10.7% | 1062, 1045, 1031, 1063 | 1054 | 3.0% | 1.54 | 0.016 | ToyOS worse |
| fs.mem.readdir.1000 | ns | 185279, 180850, 181966, 180521, 181512 | 181512 | 2.6% | 528275, 528064, 528374, 527813 | 528170 | 0.1% | 2.91 | 0.016 | ToyOS worse |
| fs.mem.rename | ns | 1594, 1596, 1618, 1614, 1590 | 1596 | 1.8% | 11753, 11869, 11626, 11848 | 11800 | 2.1% | 7.39 | 0.016 | ToyOS worse |
| fs.mem.reopen_read_4k | ns | 1388, 1384, 1386, 1380, 1371 | 1384 | 1.2% | 12667, 12616, 12737, 12774 | 12702 | 1.2% | 9.18 | 0.016 | ToyOS worse |
| fs.mem.seek | ns | 116, 115, 117, 116, 116 | 116 | 1.7% | 248, 248, 248, 248 | 248 | 0.0% | 2.14 | 0.016 | ToyOS worse |
| fs.mem.seq_read.1048576 | MB/s | 8650, 9046, 9213, 9039, 9157 | 9046 | 6.2% | 7297, 7299, 7210, 7315 | 7298 | 1.4% | 0.81 | 0.016 | ToyOS worse |
| fs.mem.seq_read.4096 | MB/s | 7881, 8226, 8314, 8213, 8313 | 8226 | 5.3% | 5763, 5738, 5712, 5731 | 5734 | 0.9% | 0.70 | 0.016 | ToyOS worse |
| fs.mem.seq_write.1048576 | MB/s | 4569, 4576, 4577, 4561, 4598 | 4576 | 0.8% | 3948, 4045, 4051, 3972 | 4008 | 2.6% | 0.88 | 0.016 | ToyOS worse |
| fs.mem.seq_write.4096 | MB/s | 3610, 3605, 3618, 3596, 3602 | 3605 | 0.6% | 438, 435, 441, 437 | 438 | 1.4% | 0.12 | 0.016 | ToyOS worse |
| fs.mem.stat | ns | 577, 578, 588, 583, 576 | 578 | 2.1% | 9451, 9524, 9490, 9489 | 9490 | 0.8% | 16.42 | 0.016 | ToyOS worse |
| fs.mem.tree.100 | ns | 561938, 559607, 559133, 562591, 558261 | 559607 | 0.8% | 3345025, 3372971, 3320129, 3370335 | 3357680 | 1.6% | 6.00 | 0.016 | ToyOS worse |
| fs.mem.write_4k_at | ns | 628, 599, 608, 617, 625 | 617 | 4.7% | 9060, 9047, 8962, 9019 | 9033 | 1.1% | 14.64 | 0.016 | ToyOS worse |
| ipc.connect_accept | ns | 3828, 3809, 3836, 3826, 3853 | 3828 | 1.1% | 2312, 2326, 2325, 2334 | 2326 | 0.9% | 0.61 | 0.016 | ToyOS better |
| ipc.reqrep.4096 | ns | 7223, 7112, 7191, 7153, 7184 | 7184 | 1.5% | 5887, 5949, 7256, 7198 | 6574 | 20.8% | 0.92 | 0.905 | not resolved |
| ipc.reqrep.65536 | ns | 19068, 18839, 18887, 18920, 19585 | 18920 | 3.9% | 26108, 26327, 26041, 25719 | 26074 | 2.3% | 1.38 | 0.016 | ToyOS worse |
| ipc.reqrep.8 | ns | 3532, 3426, 3433, 3492, 3923 | 3492 | 14.2% | 6022, 5961, 5985, 5927 | 5973 | 1.6% | 1.71 | 0.016 | ToyOS worse |
| ipc.reqrep_handle.8 | ns | 7392, 7176, 7363, 7180, 7248 | 7248 | 3.0% | 6474, 6376, 6430, 6368 | 6403 | 1.7% | 0.88 | 0.016 | ToyOS better |
| mem.anon.map | ns/MiB | 74, 97, 93, 82, 85 | 85 | 27.1% | 95, 91, 95, 93 | 94 | 4.3% | 1.11 | 0.294 | not resolved |
| mem.anon.total | ns/MiB | 259004, 259730, 258027, 258932, 258048 | 258932 | 0.7% | 80155, 81338, 82198, 80451 | 80894 | 2.5% | 0.31 | 0.016 | ToyOS lower |
| mem.anon.touch | ns/MiB | 234392, 236594, 236051, 236436, 235863 | 236051 | 0.9% | 74443, 75482, 76217, 74824 | 75153 | 2.4% | 0.32 | 0.016 | ToyOS lower |
| mem.anon.unmap | ns/MiB | 23908, 22695, 21834, 22599, 21998 | 22599 | 9.2% | 3652, 3791, 3780, 3696 | 3738 | 3.7% | 0.17 | 0.016 | ToyOS lower |
| mem.bw.copy | MB/s | 6762, 6974, 6899, 6984, 6951 | 6951 | 3.2% | 6688, 6608, 6716, 6615 | 6652 | 1.6% | 0.96 | 0.016 | ToyOS worse |
| mem.bw.read | MB/s | 17900, 17962, 16957, 17953, 17843 | 17900 | 5.6% | 17902, 17631, 17261, 17256 | 17446 | 3.7% | 0.97 | 0.413 | not resolved |
| mem.bw.write | MB/s | 9277, 9304, 9487, 9353, 9391 | 9353 | 2.2% | 9286, 9146, 9372, 9505 | 9329 | 3.8% | 1.00 | 0.905 | not resolved |
| mem.first_touch.2m | ns/MiB | 100349, 100396, 100272, 100079, 100146 | 100272 | 0.3% | 77755, 78793, 81401, 77610 | 78274 | 4.8% | 0.78 | 0.016 | ToyOS lower |
| mem.first_touch.4k | ns/MiB | 236652, 236704, 236835, 237166, 237717 | 236835 | 0.4% | 81144, 84715, 84113, 84228 | 84170 | 4.2% | 0.36 | 0.016 | ToyOS lower |
| mem.malloc_churn.1048576.t1 | kops/s | 213, 175, 184, 184, 224 | 184 | 26.6% | 193, 193, 193, 193 | 193 | 0.0% | 1.05 | 0.667 | not resolved; settled clocks apart: Linux 3392 MHz, ToyOS 4189 MHz |
| mem.malloc_churn.1048576.t8 | kops/s | 154, 89, 89, 89, 153 | 89 | 73.0% | 103, 101, 102, 102 | 102 | 2.0% | 1.15 | 0.667 | not resolved; settled clocks apart: Linux 3192 MHz, ToyOS 4189 MHz |
| mem.malloc_churn.16.t1 | kops/s | 32884, 32877, 32949, 32868, 32790 | 32877 | 0.5% | 36287, 36631, 36625, 36301 | 36463 | 0.9% | 1.11 | 0.016 | ToyOS higher |
| mem.malloc_churn.16.t8 | kops/s | 2514, 2519, 3132, 2527, 3123 | 2527 | 24.5% | 4857, 4813, 4665, 4780 | 4796 | 4.0% | 1.90 | 0.016 | ToyOS higher |
| mem.malloc_churn.4096.t1 | kops/s | 21587, 21597, 21520, 21543, 21669 | 21587 | 0.7% | 30872, 31027, 31045, 30976 | 31002 | 0.6% | 1.44 | 0.016 | ToyOS higher |
| mem.malloc_churn.4096.t8 | kops/s | 2047, 900, 864, 881, 2043 | 900 | 131.4% | 3206, 3195, 3092, 3176 | 3186 | 3.6% | 3.54 | 0.016 | ToyOS higher; the clock fell in 1 of 5 Linux run(s) |
| mem.map_touch_unmap.2m | ns/MiB | 102246, 102180, 102038, 101923, 102021 | 102038 | 0.3% | 83576, 85109, 85633, 83523 | 84342 | 2.5% | 0.83 | 0.016 | ToyOS lower |
| mem.map_touch_unmap.4k | ns/MiB | 258226, 257956, 257759, 258265, 258775 | 258226 | 0.4% | 87822, 89196, 88794, 88884 | 88839 | 1.5% | 0.34 | 0.016 | ToyOS lower |
| mem.map_unmap_4k | ns | 1606, 1639, 1619, 1609, 1608 | 1609 | 2.1% | 2070, 2067, 2075, 2073 | 2072 | 0.4% | 1.29 | 0.016 | ToyOS worse |
| mem.memcpy.1024 | MB/s | 64555, 70434, 79336, 68115, 72466 | 70434 | 21.0% | 83274, 82514, 85815, 82515 | 82894 | 4.0% | 1.18 | 0.016 | ToyOS better |
| mem.memcpy.1048576 | MB/s | 25552, 24358, 26830, 25648, 25302 | 25552 | 9.7% | 25777, 25393, 26096, 24498 | 25585 | 6.2% | 1.00 | 0.905 | not resolved |
| mem.memcpy.16384 | MB/s | 222863, 222857, 186749, 197542, 188586 | 197542 | 18.3% | 190424, 185540, 185543, 185550 | 185546 | 2.6% | 0.94 | 0.063 | not resolved |
| mem.memcpy.16777216 | MB/s | 10708, 10760, 10776, 11006, 10659 | 10760 | 3.2% | 10095, 10424, 10422, 10432 | 10423 | 3.2% | 0.97 | 0.016 | ToyOS worse |
| mem.memcpy.256 | MB/s | 25033, 24980, 24925, 25123, 25209 | 25033 | 1.1% | 28991, 28979, 27505, 28182 | 28580 | 5.2% | 1.14 | 0.016 | ToyOS better |
| mem.memcpy.262144 | MB/s | 55589, 55624, 55634, 55594, 55593 | 55594 | 0.1% | 55737, 55745, 55726, 55749 | 55741 | 0.0% | 1.00 | 0.016 | ToyOS better |
| mem.memcpy.4096 | MB/s | 158906, 158167, 151082, 158902, 151542 | 158167 | 4.9% | 165025, 165024, 165024, 165025 | 165024 | 0.0% | 1.04 | 0.016 | ToyOS better |
| mem.memcpy.4194304 | MB/s | 21445, 22372, 21423, 23069, 21398 | 21445 | 7.8% | 20318, 20430, 20424, 20169 | 20371 | 1.3% | 0.95 | 0.016 | ToyOS worse |
| mem.memcpy.64 | MB/s | 6260, 6276, 6285, 6251, 6262 | 6262 | 0.5% | 18686, 19150, 19043, 17878 | 18864 | 6.7% | 3.01 | 0.016 | ToyOS better |
| mem.memcpy.65536 | MB/s | 54988, 55167, 55195, 54997, 55001 | 55001 | 0.4% | 55433, 55422, 55439, 55434 | 55434 | 0.0% | 1.01 | 0.016 | ToyOS better |
| mem.memcpy.67108864 | MB/s | 9630, 9674, 9663, 9608, 9647 | 9647 | 0.7% | 9257, 9337, 9387, 9279 | 9308 | 1.4% | 0.96 | 0.016 | ToyOS worse |
| mem.mprotect.4k | ns | 1017, 1025, 1024, 1019, 1018 | 1019 | 0.8% | 756, 875, 756, 967 | 816 | 25.9% | 0.80 | 0.016 | ToyOS better |
| mem.munmap_part.4k | ns | 1256, 1254, 1260, 1253, 1251 | 1254 | 0.7% | 1398, 1432, 1407, 1404 | 1406 | 2.4% | 1.12 | 0.016 | ToyOS worse |
| mem.munmap_touched_remote.4k | ns | 2275, 2277, 2285, 2279, 2294 | 2279 | 0.8% | 3344, 3340, 3342, 3340 | 3341 | 0.1% | 1.47 | 0.016 | ToyOS worse |
| mem.realloc_grow.1m_256m | ns | 87517, 112928, 113505, 112350, 90323 | 112350 | 23.1% | 46224, 44446, 46461, 47502 | 46342 | 6.6% | 0.41 | 0.016 | ToyOS better; settled clocks apart: Linux 3392 MHz, ToyOS 4189 MHz |
| mem.realloc_grow.last_128m_256m | ns | 20547, 25316, 25716, 25834, 20814 | 25316 | 20.9% | 12864, 11474, 13601, 13423 | 13144 | 16.2% | 0.52 | 0.016 | ToyOS better |
| net.tcp.connect_accept_close | ns | 20878, 20990, 20933, 20976, 21499 | 20976 | 3.0% |  | - | - | - | - | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.reqrep.64 | ns | 8909, 8718, 9058, 8911, 8950 | 8911 | 3.8% |  | - | - | - | - | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.1 | MB/s | 1, 1, 1, 1, 1 | 1 | 0.0% |  | - | - | - | - | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.65536 | MB/s | 6779, 6934, 6789, 6635, 6825 | 6789 | 4.4% |  | - | - | - | - | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.udp.reqrep.64 | ns | 7311, 7275, 7470, 7343, 7225 | 7311 | 3.4% |  | - | - | - | - | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| nvme.read.1m.seq |  |  | - | - |  | - | - | - | - | Linux 5 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 4 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| nvme.read.4k.random |  |  | - | - |  | - | - | - | - | Linux 5 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 4 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| persist.append_4k_fsync | ns | 921014, 905874, 1051933, 1011872, 1064836 | 1011872 | 15.7% | 6750871, 6519742, 6423960, 5954637 | 6471851 | 12.3% | 6.40 | 0.016 | ToyOS worse |
| persist.create_fsync_unlink | ns | 958357, 969668, 929807, 863200, 964595 | 958357 | 11.1% | 7407486, 7201749, 7361637, 6873046 | 7281693 | 7.3% | 7.60 | 0.016 | ToyOS worse |
| persist.fsync_clean | ns | 23014, 23020, 23283, 23021, 23006 | 23020 | 1.2% | 7444, 7570, 7365, 7556 | 7500 | 2.7% | 0.33 | 0.016 | ToyOS better |
| persist.seq_read_cached | MB/s | 10171, 11256, 11782, 11072, 11645 | 11256 | 14.3% | 7780, 7943, 7617, 7992 | 7862 | 4.8% | 0.70 | 0.016 | ToyOS worse |
| persist.seq_write_fsync | MB/s | 582, 590, 597, 574, 592 | 590 | 3.9% | 189, 201, 167, 175 | 182 | 18.7% | 0.31 | 0.016 | ToyOS worse |
| persist.write_4k_fsync | ns | 1026117, 1033439, 872784, 1080216, 1047602 | 1033439 | 20.1% | 6493547, 6211257, 6573735, 5718968 | 6352402 | 13.5% | 6.15 | 0.016 | ToyOS worse |
| persist.write_4k_fsync_beside_1m | ns | 1328582, 1330618, 1033893, 1258302, 1212808 | 1258302 | 23.6% | 7876660, 7435249, 7761253, 6980448 | 7598251 | 11.8% | 6.04 | 0.016 | ToyOS worse |
| pingpong.futex.cross_core | ns | 3341, 3351, 3346, 3376, 3326 | 3346 | 1.5% | 257, 250, 257, 4573 | 257 | 1682.1% | 0.08 | 0.254 | not resolved |
| pingpong.futex.same_cpu | ns | 2298, 2302, 2225, 2228, 2302 | 2298 | 3.4% | 4100, 4121, 4082, 4079 | 4091 | 1.0% | 1.78 | 0.008 | ToyOS worse |
| pingpong.pipe.cross_core | ns | 3697, 4077, 3684, 3700, 3678 | 3697 | 10.8% | 5748, 5687, 5801, 5767 | 5758 | 2.0% | 1.56 | 0.016 | ToyOS worse |
| pingpong.pipe.same_cpu | ns | 3774, 2859, 6975, 6418, 3297 | 3774 | 109.1% | 4981, 4971, 4942, 4943 | 4957 | 0.8% | 1.31 | 0.730 | not resolved |
| pipe.throughput.1024 | MB/s | 1751, 1788, 1767, 1782, 1757 | 1767 | 2.1% | 1669, 1619, 1508, 1655 | 1637 | 9.8% | 0.93 | 0.016 | ToyOS worse |
| pipe.throughput.16384 | MB/s | 3893, 3898, 3877, 3845, 3816 | 3877 | 2.1% | 13026, 12657, 12422, 12344 | 12540 | 5.4% | 3.23 | 0.016 | ToyOS better |
| pipe.throughput.256 | MB/s | 654, 651, 640, 632, 661 | 651 | 4.5% | 455, 438, 424, 442 | 440 | 7.0% | 0.68 | 0.016 | ToyOS worse |
| pipe.throughput.4096 | MB/s | 4198, 4167, 4159, 4213, 4141 | 4167 | 1.7% | 4857, 4604, 4985, 4838 | 4848 | 7.9% | 1.16 | 0.016 | ToyOS better |
| pipe.throughput.64 | MB/s | 169, 168, 168, 169, 168 | 168 | 0.6% | 116, 117, 114, 118 | 116 | 3.4% | 0.69 | 0.008 | ToyOS worse |
| pipe.throughput.65536 | MB/s | 4345, 4120, 4144, 4084, 4002 | 4120 | 8.3% | 17197, 17603, 17597, 17668 | 17600 | 2.7% | 4.27 | 0.016 | ToyOS better |
| proc.posix_spawn_wait.std | ns | 174784, 180612, 178366, 179093, 175844 | 178366 | 3.3% | 388730, 387317, 385909, 387046 | 387182 | 0.7% | 2.17 | 0.016 | ToyOS worse |
| proc.posix_spawn_wait.tiny | ns | 43045, 43471, 44359, 44146, 43904 | 43904 | 3.0% | 77532, 81087, 77181, 79418 | 78475 | 5.0% | 1.79 | 0.016 | ToyOS worse |
| proc.spawn_wait.large | ns | 54731, 54457, 54926, 54675, 55039 | 54731 | 1.1% | 8011104, 8089791, 8077285, 8067489 | 8072387 | 1.0% | 147.49 | 0.016 | ToyOS worse |
| proc.spawn_wait.tiny | ns | 52616, 51611, 52413, 52725, 52294 | 52413 | 2.1% | 76222, 72610, 70945, 71718 | 72164 | 7.3% | 1.38 | 0.016 | ToyOS worse |
| proc.spawn_wait_loop.100 | ns | 5477800, 5365785, 5512641, 5439550, 5402585 | 5439550 | 2.7% | 7673151, 8411890, 7701567, 7602173 | 7687359 | 10.5% | 1.41 | 0.016 | ToyOS worse |
| process.spawn_wait | ns | 183667, 187729, 187675, 187766, 183902 | 187675 | 2.2% | 376818, 377660, 372728, 375918 | 376368 | 1.3% | 2.01 | 0.016 | ToyOS worse |
| syscall.null | ps | 91786, 91766, 91888, 91734, 91757 | 91766 | 0.2% | 68449, 68380, 66914, 70598 | 68414 | 5.4% | 0.75 | 0.016 | ToyOS lower |
| tail.diag.periodic.30s | ns |  | - | - | 20548, 20604, 20720, 20619 | 20612 | 0.8% | - | - | Linux 5 run(s) absent |
| tail.stolen.10s | ns | 33091, 30439, 39331, 34550, 28727 | 33091 | 32.0% | 28065, 28091, 29689, 27792 | 28078 | 6.8% | 0.85 | 0.032 | ToyOS better |
| tail.wake.periodic.60s | ns | 67756, 69270, 55138, 69287, 67711 | 67756 | 20.9% | 20570, 20612, 20513, 20642 | 20591 | 0.6% | 0.30 | 0.016 | ToyOS better |
| thread.spawn_join | ns | 25258, 24444, 25183, 24992, 25249 | 25183 | 3.2% | 22947, 20735, 22842, 22757 | 22800 | 9.7% | 0.91 | 0.016 | ToyOS better |
| thread.spawn_join.default | ns | 25153, 25124, 25110, 25246, 25145 | 25145 | 0.5% | 20416, 20383, 22691, 20622 | 20519 | 11.2% | 0.82 | 0.016 | ToyOS better |
| thread.spawn_join.stack64k | ns | 23665, 23558, 23626, 23476, 23490 | 23558 | 0.8% | 21194, 21267, 19418, 21431 | 21230 | 9.5% | 0.90 | 0.016 | ToyOS better |
| time.now | ps | 14283, 14290, 14282, 14292, 14283 | 14283 | 0.1% | 21005, 21005, 21005, 21005 | 21005 | 0.0% | 1.47 | 0.016 | ToyOS higher |
| time.sleep_late.100us | ns | 51828, 51874, 51862, 51850, 51835 | 51850 | 0.1% | 5238, 5182, 4907, 5270 | 5210 | 7.0% | 0.10 | 0.016 | ToyOS better |
| time.sleep_late.100us.slack1ns | ns | 1809, 1831, 1827, 1827, 1821 | 1827 | 1.2% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.sleep_late.10ms | ns | 213769, 224436, 218198, 216690, 218664 | 218198 | 4.9% | 31493, 31893, 31115, 31144 | 31318 | 2.5% | 0.14 | 0.016 | ToyOS better |
| time.sleep_late.10ms.slack1ns | ns | 161768, 169373, 163553, 165609, 163215 | 163553 | 4.6% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.sleep_late.10us | ns | 51805, 51827, 51824, 51819, 51810 | 51819 | 0.0% | 1507, 1434, 1420, 1434 | 1434 | 6.1% | 0.03 | 0.016 | ToyOS better |
| time.sleep_late.10us.slack1ns | ns | 1804, 1818, 5430, 1820, 1825 | 1820 | 199.2% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.sleep_late.1ms | ns | 72399, 72297, 73595, 72340, 72020 | 72340 | 2.2% | 14125, 26555, 25366, 25912 | 25639 | 48.5% | 0.35 | 0.016 | ToyOS better |
| time.sleep_late.1ms.slack1ns | ns | 20400, 20517, 20362, 20419, 20307 | 20400 | 1.0% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.sleep_late.1us | ns | 51807, 51825, 51814, 51812, 52494 | 51814 | 1.3% | 1504, 1505, 1439, 1498 | 1501 | 4.4% | 0.03 | 0.016 | ToyOS better |
| time.sleep_late.1us.slack1ns | ns | 3982, 4357, 4239, 3919, 1597 | 3982 | 69.3% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.timer_1ms.late | ns | 70232, 70392, 70302, 70173, 92042 | 70302 | 31.1% | 14183, 14176, 14134, 14037 | 14155 | 1.0% | 0.20 | 0.016 | ToyOS better |
| time.timer_1ms.late.slack1ns | ns | 20281, 20368, 20087, 5519, 20077 | 20087 | 73.9% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.yield | ps | 190906, 194516, 190745, 193284, 190591 | 190906 | 2.1% | 653058, 649953, 651763, 651466 | 651614 | 0.5% | 3.41 | 0.016 | ToyOS higher |
| wake.onto_busy | ns | 2529, 2553, 2605, 2539, 2587 | 2553 | 3.0% | 4483, 4501, 4404, 4406 | 4444 | 2.2% | 1.74 | 0.016 | ToyOS worse |
| wake.periodic.idle | ns | 67862, 69639, 67596, 55228, 69495 | 67862 | 21.2% | 20910, 20769, 20844, 20703 | 20806 | 1.0% | 0.31 | 0.016 | ToyOS better |
| wake.periodic.idle.slack1ns | ns | 17684, 19433, 17667, 17559, 17600 | 17667 | 10.6% |  | - | - | - | - | ToyOS 4 run(s) absent |
| wake.periodic.loaded | ns | 52359, 52464, 52378, 52374, 52370 | 52374 | 0.2% | 3633, 3629, 3618, 3612 | 3624 | 0.6% | 0.07 | 0.016 | ToyOS better |
| wake.periodic.loaded.slack1ns | ns | 2355, 2379, 2449, 2366, 2373 | 2373 | 4.0% |  | - | - | - | - | ToyOS 4 run(s) absent |
| wake.storm.call.w1 | ns | 2572, 3794, 3984, 5012, 5276 | 3984 | 67.9% | 1265, 1571, 1198, 1337 | 1301 | 28.7% | 0.33 | 0.016 | ToyOS better |
| wake.storm.call.w16 | ns | 60662, 59848, 64059, 57653, 64002 | 60662 | 10.6% | 13434, 13704, 14360, 14466 | 14032 | 7.4% | 0.23 | 0.016 | ToyOS better |
| wake.storm.call.w4 | ns | 9979, 10411, 12083, 11803, 11131 | 11131 | 18.9% | 8852, 9096, 9489, 9797 | 9292 | 10.2% | 0.83 | 0.016 | ToyOS better |
| wake.storm.call.w64 | ns | 230202, 238827, 157490, 262788, 228162 | 230202 | 45.7% | 23788, 22729, 22243, 22473 | 22601 | 6.8% | 0.10 | 0.016 | ToyOS better |
| wake.storm.drain.w1 | ns | 22618, 24196, 26037, 30262, 42942 | 26037 | 78.1% | 22434, 22421, 22426, 21542 | 22424 | 4.0% | 0.86 | 0.016 | ToyOS better |
| wake.storm.drain.w16 | ns | 1056795, 849489, 488937, 792554, 1221990 | 849489 | 86.3% | 169371, 174149, 176641, 175049 | 174599 | 4.2% | 0.21 | 0.016 | ToyOS better |
| wake.storm.drain.w4 | ns | 128641, 129409, 124207, 126715, 122012 | 126715 | 5.8% | 130374, 152201, 138704, 137563 | 138134 | 15.8% | 1.09 | 0.016 | ToyOS worse |
| wake.storm.drain.w64 | ns | 235979, 257333, 236426, 263945, 250576 | 250576 | 11.2% | 307755, 311339, 320339, 313577 | 312458 | 4.0% | 1.25 | 0.016 | ToyOS worse |
| work.build_shaped.j1 | ns | 981996881, 1011633315, 1057885712, 1013128216, 1028300072 | 1013128216 | 7.5% | 683466278, 693113603, 692465167, 688943750 | 690704458 | 1.4% | 0.68 | 0.016 | ToyOS better |
| work.build_shaped.j8 | ns | 99084376, 100728374, 99052616, 99510091, 100015002 | 99510091 | 1.7% | 222159985, 216771515, 222218385, 219613380 | 220886682 | 2.5% | 2.22 | 0.016 | ToyOS worse |
| work.compress_inproc | ns | 361777338, 362075950, 361057828, 362140830, 361154072 | 361777338 | 0.3% | 358681767, 358534365, 358756935, 358574359 | 358628063 | 0.1% | 0.99 | 0.016 | ToyOS better |

Each p is its row's alone, uncorrected for the table's other rows.

