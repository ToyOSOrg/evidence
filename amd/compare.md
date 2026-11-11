## amd-bench-cpu

Runs: Linux 5, ToyOS 4. lan.peer_link: none. internet.link: none.

Linux setup: kernel=6.8.0-147-generic, cpufreq_driver=acpi-cpufreq*16, governor=schedutil*16, epp=absent*16, min_khz=1400000*16, max_khz=1800000*16, boost=1, intel_no_turbo=absent, platform_profile=balanced, smt_active=1, fs.mem.served_by=tmpfs,_through_the_VFS, fs.disk.served_by=ext4,_NVMe_disk,_model_masked,_write_cache_write_back, persist.served_by=ext4,_NVMe_disk,_model_masked,_write_cache_write_back.

Linux per run: clocksource=hpet,hpet,hpet,tsc,tsc.

ToyOS setup: fs.mem.served_by=the_userland_memory_filesystem, fs.disk.served_by=DATA_volume,_bcachefs_crate's_format,_DATA_file_server_over_the_block_service, persist.served_by=DATA_volume,_bcachefs_crate's_format,_DATA_file_server_over_the_block_service.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.chunk@fair | ns | 4330, 4330, 4330, 2926, 2927 | 4330 | 32.4% | 2915, 2915, 2915, 2915 | 2915 | 0.0% | 0.67 | 0.016 | ToyOS better |
| cpu.chunk@sched | ns | 4261, 4330, 4261, 2926, 2928 | 4261 | 33.0% | 2915, 2915, 2915, 2915 | 2915 | 0.0% | 0.68 | 0.016 | ToyOS better |
| cpu.chunk@system | ns | 4330, 4330, 4330, 2926, 2929 | 4330 | 32.4% | 2915, 2915, 2915, 2915 | 2915 | 0.0% | 0.67 | 0.016 | ToyOS better |
| cpu.clock@boot | MHz | 1655, 1371, 1370, 4291, 1395 | 1395 | 209.4% | 4291, 4291, 4291, 4291 | 4291 | 0.0% | 3.08 | 0.048 | ToyOS higher |
| cpu.clock@crunch | MHz | 1371, 1660, 1371, 1397, 1397 | 1397 | 20.7% | 4267, 4291, 4291, 4291 | 4291 | 0.6% | 3.07 | 0.016 | ToyOS higher |
| cpu.clock@fair | MHz | 1370, 4286, 1371, 1397, 1696 | 1397 | 208.7% | 4267, 4291, 4291, 4291 | 4291 | 0.6% | 3.07 | 0.032 | ToyOS higher |
| cpu.clock@files | MHz | 4248, 1587, 1372, 1397, 1397 | 1397 | 205.9% | 4142, 4166, 4142, 4166 | 4154 | 0.6% | 2.97 | 0.167 | not resolved |
| cpu.clock@ipc | MHz | 4269, 1370, 1370, 4242, 4242 | 4242 | 68.3% | 4241, 4267, 4242, 4267 | 4254 | 0.6% | 1.00 | 0.595 | not resolved |
| cpu.clock@mem | MHz | 1371, 1372, 1370, 1397, 1397 | 1372 | 2.0% | 4267, 4241, 4242, 4291 | 4254 | 1.2% | 3.10 | 0.008 | ToyOS higher |
| cpu.clock@net | MHz | 1372, 1655, 1371, 4242, 4266 | 1655 | 174.9% | 4267, 4242, 4267, 4291 | 4267 | 1.1% | 2.58 | 0.040 | ToyOS higher |
| cpu.clock@nvme | MHz | 1370, 1371, 1655, 1397, 1397 | 1397 | 20.4% | 4291, 4291, 4291, 4291 | 4291 | 0.0% | 3.07 | 0.016 | ToyOS higher |
| cpu.clock@persist | MHz | 1371, 1371, 1370, 1397, 1397 | 1371 | 2.0% | 4291, 4291, 4291, 4291 | 4291 | 0.0% | 3.13 | 0.008 | ToyOS higher |
| cpu.clock@procs | MHz | 1371, 1371, 1370, 4266, 1397 | 1371 | 211.2% | 4267, 4241, 4267, 4267 | 4267 | 0.6% | 3.11 | 0.032 | ToyOS higher |
| cpu.clock@sched | MHz | 1372, 1371, 1370, 1397, 1396 | 1372 | 2.0% | 4291, 4291, 4291, 4291 | 4291 | 0.0% | 3.13 | 0.016 | ToyOS higher |
| cpu.clock@system | MHz | 1370, 1372, 1370, 1397, 1395 | 1372 | 2.0% | 4291, 4291, 4291, 4291 | 4291 | 0.0% | 3.13 | 0.016 | ToyOS higher |
| cpu.clock@tail | MHz | 1656, 1372, 1370, 4293, 1696 | 1656 | 176.5% | 4216, 4216, 4216, 4216 | 4216 | 0.0% | 2.55 | 0.159 | not resolved |
| cpu.clock@time | MHz | 1371, 1379, 4269, 1398, 1397 | 1397 | 207.4% | 4216, 4266, 4241, 4241 | 4241 | 1.2% | 3.04 | 0.167 | not resolved |
| cpu.clock@work | MHz | 1372, 1370, 1371, 1398, 1397 | 1372 | 2.0% | 4241, 4267, 4267, 4291 | 4267 | 1.2% | 3.11 | 0.016 | ToyOS higher |
| crunch.all.deflate | ns | 146185421, 118784533, 148166969, 147441245, 146164805 | 146185421 | 20.1% |  | - | - | - | - | ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.matmul |  |  | - | - |  | - | - | - | - | Linux 5 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.parse |  |  | - | - |  | - | - | - | - | Linux 5 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.sha256 | ns | 548751, 581856, 576159, 581388 | 578774 | 5.7% |  | - | - | - | - | Linux 1 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 4 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.single.deflate | ns | 63545194, 66894243, 65036547, 63474442, 66037863 | 65036547 | 5.3% | 63469004, 63110060, 63628643, 63284416 | 63376710 | 0.8% | 0.97 | 0.063 | not resolved |
| crunch.single.matmul | ns | 920525, 925132, 926946, 910653, 907110 | 920525 | 2.2% | 950362, 939251, 942156, 945263 | 943710 | 1.2% | 1.03 | 0.016 | ToyOS worse |
| crunch.single.parse | ns | 72082302, 72081850 | 72082076 | 0.0% | 40446703, 40694938, 40278608, 40631419 | 40539061 | 1.0% | 0.56 | 0.133 | too few runs to resolve (least p 0.133); Linux 3 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit |
| crunch.single.sha256 | ns | 509013, 506706, 509569, 499799, 496604 | 506706 | 2.6% | 498625, 495679, 501530, 498524 | 498574 | 1.2% | 0.98 | 0.190 | not resolved |
| fair.apart.build | permille | 62, 62, 62, 63, 63 | 62 | 1.6% | 63, 63, 63, 63 | 63 | 0.0% | 1.02 | 0.167 | not resolved |
| fair.apart.helpers | permille | 411, 425, 404, 422, 447 | 422 | 10.2% | 459, 459, 455, 458 | 458 | 0.9% | 1.09 | 0.016 | ToyOS higher |
| fair.apart.threaded | permille | 525, 511, 532, 514, 489 | 514 | 8.4% | 476, 476, 481, 478 | 477 | 1.0% | 0.93 | 0.016 | ToyOS lower |
| fair.apart.total | chunks/s | 3290941, 3283960, 3290218, 5019915, 5056713 | 3290941 | 53.9% | 5061306, 5006201, 5062768, 5078244 | 5062037 | 1.4% | 1.54 | 0.063 | not resolved |
| fair.session.build | permille | 33, 31, 30, 32, 33 | 32 | 9.4% |  | - | - | - | - | ToyOS 4 run(s) absent |
| fair.session.helpers | permille | 462, 464, 466, 466, 463 | 464 | 0.9% |  | - | - | - | - | ToyOS 4 run(s) absent |
| fair.session.threaded | permille | 506, 504, 502, 500, 502 | 502 | 1.2% |  | - | - | - | - | ToyOS 4 run(s) absent |
| fair.session.total | chunks/s | 3288738, 3287863, 3275945, 4867147, 4911122 | 3288738 | 49.7% |  | - | - | - | - | ToyOS 4 run(s) absent |
| fair.shared.build | permille | 32, 31, 30, 31, 33 | 31 | 9.7% | 29, 29, 30, 30 | 30 | 3.4% | 0.95 | 0.032 | ToyOS lower |
| fair.shared.helpers | permille | 465, 465, 462, 468, 466 | 465 | 1.3% | 486, 488, 485, 489 | 487 | 0.8% | 1.05 | 0.016 | ToyOS higher |
| fair.shared.threaded | permille | 503, 502, 506, 500, 499 | 502 | 1.4% | 482, 481, 484, 482 | 482 | 0.6% | 0.96 | 0.016 | ToyOS lower |
| fair.shared.total | chunks/s | 3314081, 3301534, 3306801, 5089421, 5099351 | 3314081 | 54.2% | 4052832, 4063595, 4060794, 4083592 | 4062194 | 0.8% | 1.23 | 0.730 | not resolved |
| fs.disk.create_write_unlink | ns | 29054, 29054, 29333, 27238, 27323 | 29054 | 7.2% | 120235, 125996, 120626, 120295 | 120460 | 4.8% | 4.15 | 0.016 | ToyOS worse |
| fs.disk.direct.fstat | ns |  | - | - | 8586, 10459, 8626, 8637 | 8632 | 21.7% | - | - | Linux 5 run(s) absent |
| fs.disk.direct.pread_4k | ns |  | - | - | 8426, 9908, 8375, 8506 | 8466 | 18.1% | - | - | Linux 5 run(s) absent |
| fs.disk.direct.read_4k_at | ns |  | - | - | 15259, 18765, 15158, 14978 | 15208 | 24.9% | - | - | Linux 5 run(s) absent |
| fs.disk.direct.seek | ns |  | - | - | 6863, 8636, 6883, 6823 | 6873 | 26.4% | - | - | Linux 5 run(s) absent |
| fs.disk.direct.stat | ns |  | - | - | 10399, 12283, 10430, 10410 | 10420 | 18.1% | - | - | Linux 5 run(s) absent |
| fs.disk.fstat | ns | 1885, 1885, 1885, 471, 491 | 1885 | 75.0% | 8906, 10991, 8806, 8966 | 8936 | 24.5% | 4.74 | 0.008 | ToyOS worse |
| fs.disk.mkdir_rmdir | ns | 38484, 38553, 38623, 37045, 36981 | 38484 | 4.3% | 77245, 81172, 77255, 77355 | 77305 | 5.1% | 2.01 | 0.016 | ToyOS worse |
| fs.disk.open_close | ns | 4331, 4331, 4400, 3336, 3046 | 4331 | 31.3% | 18725, 21841, 18615, 18575 | 18670 | 17.5% | 4.31 | 0.016 | ToyOS worse |
| fs.disk.pread_4k | ns | 2374, 2374, 2374, 1242, 1162 | 2374 | 51.1% | 1142, 1162, 1142, 1142 | 1142 | 1.8% | 0.48 | 0.024 | ToyOS better |
| fs.disk.pread_8 | ns | 1886, 1886, 1886, 761, 771 | 1886 | 59.7% | 682, 692, 802, 682 | 687 | 17.5% | 0.36 | 0.056 | not resolved |
| fs.disk.read_4k | ns | 2374, 2305, 2374, 1092, 1232 | 2305 | 55.6% | 1012, 1042, 1002, 1011 | 1012 | 4.0% | 0.44 | 0.016 | ToyOS better |
| fs.disk.read_4k_at | ns | 2444, 2375, 2375, 1463, 1382 | 2375 | 44.7% | 1442, 1463, 1442, 1443 | 1442 | 1.5% | 0.61 | 0.198 | not resolved |
| fs.disk.readdir.1000 | ns | 441684, 442871, 450413, 434452, 434062 | 441684 | 3.7% | 2028093, 2105478, 2031149, 2005711 | 2029621 | 4.9% | 4.60 | 0.016 | ToyOS worse |
| fs.disk.rename | ns | 10825, 10825, 10826, 9346, 9288 | 10825 | 14.2% | 40496, 42229, 40045, 40466 | 40481 | 5.4% | 3.74 | 0.016 | ToyOS worse |
| fs.disk.reopen_read_4k | ns | 5238, 5238, 5238, 4067, 3777 | 5238 | 27.9% | 19406, 22242, 18896, 19046 | 19226 | 17.4% | 3.67 | 0.008 | ToyOS worse |
| fs.disk.seek | ns | 1397, 1397, 1397, 210, 210 | 1397 | 85.0% | 200, 200, 191, 200 | 200 | 4.5% | 0.14 | 0.008 | ToyOS better |
| fs.disk.seq_read.1048576 | MB/s | 11237, 11613, 11450, 11672, 11500 | 11500 | 3.8% | 9979, 10285, 9948, 9982 | 9980 | 3.4% | 0.87 | 0.016 | ToyOS worse |
| fs.disk.seq_read.4096 | MB/s | 4963, 5022, 4991, 5100, 5052 | 5022 | 2.7% | 6865, 6970, 6934, 6889 | 6912 | 1.5% | 1.38 | 0.016 | ToyOS better |
| fs.disk.seq_write.1048576 | MB/s | 769, 791, 775, 811, 801 | 791 | 5.3% | 454, 457, 475, 470 | 464 | 4.5% | 0.59 | 0.016 | ToyOS worse |
| fs.disk.seq_write.4096 | MB/s | 706, 727, 702, 732, 721 | 721 | 4.2% | 202, 181, 201, 202 | 202 | 10.4% | 0.28 | 0.016 | ToyOS worse |
| fs.disk.stat | ns | 2863, 2794, 2863, 1443, 1473 | 2794 | 50.8% | 11602, 13766, 11702, 11712 | 11707 | 18.5% | 4.19 | 0.008 | ToyOS worse |
| fs.disk.tree.100 | ns | 3448059, 3451894, 3471510, 3420018, 3405307 | 3448059 | 1.9% | 17749222, 17582440, 17335256, 17421087 | 17501764 | 2.4% | 5.08 | 0.016 | ToyOS worse |
| fs.disk.write_4k_at | ns | 2933, 2933, 2934, 1894, 2074 | 2933 | 35.5% | 26349, 28123, 25608, 26530 | 26440 | 9.5% | 9.01 | 0.016 | ToyOS worse |
| fs.mem.create_write_unlink | ns | 14178, 14318, 14179, 12673, 12765 | 14178 | 11.6% | 30437, 36459, 36890, 37721 | 36674 | 19.9% | 2.59 | 0.016 | ToyOS worse |
| fs.mem.direct.fstat | ns |  | - | - | 7063, 8977, 8847, 8486 | 8666 | 22.1% | - | - | Linux 5 run(s) absent |
| fs.mem.direct.pread_4k | ns |  | - | - | 8576, 10109, 9978, 10099 | 10038 | 15.3% | - | - | Linux 5 run(s) absent |
| fs.mem.direct.read_4k_at | ns |  | - | - | 15479, 19106, 18816, 18395 | 18606 | 19.5% | - | - | Linux 5 run(s) absent |
| fs.mem.direct.seek | ns |  | - | - | 6943, 8887, 8837, 8316 | 8576 | 22.7% | - | - | Linux 5 run(s) absent |
| fs.mem.direct.stat | ns |  | - | - | 8115, 9988, 10119, 9588 | 9788 | 20.5% | - | - | Linux 5 run(s) absent |
| fs.mem.fstat | ns | 1886, 1886, 1886, 491, 481 | 1886 | 74.5% | 7404, 9367, 9498, 8867 | 9117 | 23.0% | 4.83 | 0.008 | ToyOS worse |
| fs.mem.mkdir_rmdir | ns | 8032, 8102, 8102, 6653, 6694 | 8032 | 18.0% | 20148, 24175, 24356, 23795 | 23985 | 17.5% | 2.99 | 0.008 | ToyOS worse |
| fs.mem.open_close | ns | 4330, 4330, 4330, 2916, 2906 | 4330 | 32.9% | 11712, 14547, 14788, 14678 | 14612 | 21.1% | 3.37 | 0.008 | ToyOS worse |
| fs.mem.pread_4k | ns | 1956, 2304, 2304, 1152, 1172 | 1956 | 58.9% | 1142, 1172, 1172, 1133 | 1157 | 3.4% | 0.59 | 0.111 | not resolved |
| fs.mem.pread_8 | ns | 1886, 1886, 1886, 821, 712 | 1886 | 62.2% | 732, 682, 721, 711 | 716 | 7.0% | 0.38 | 0.056 | not resolved |
| fs.mem.read_4k | ns | 1955, 1956, 1956, 1022, 1072 | 1955 | 47.8% | 1022, 1072, 1072, 1022 | 1047 | 4.8% | 0.54 | 0.175 | not resolved |
| fs.mem.read_4k_at | ns | 2375, 2375, 2375, 1403, 1413 | 2375 | 40.9% | 1453, 1462, 1483, 1442 | 1458 | 2.8% | 0.61 | 0.714 | not resolved |
| fs.mem.readdir.1000 | ns | 271128, 275322, 276098, 267412, 269718 | 271128 | 3.2% | 443091, 448922, 449743, 440596 | 446006 | 2.1% | 1.65 | 0.016 | ToyOS worse |
| fs.mem.rename | ns | 5867, 6077, 6007, 4489, 4479 | 5867 | 27.2% | 11622, 13726, 13706, 13435 | 13570 | 15.5% | 2.31 | 0.016 | ToyOS worse |
| fs.mem.reopen_read_4k | ns | 4889, 4889, 4889, 3577, 3547 | 4889 | 27.4% | 12223, 15248, 15369, 15740 | 15308 | 23.0% | 3.13 | 0.008 | ToyOS worse |
| fs.mem.seek | ns | 1397, 1397, 1397, 211, 211 | 1397 | 84.9% | 200, 200, 200, 200 | 200 | 0.0% | 0.14 | 0.008 | ToyOS better |
| fs.mem.seq_read.1048576 | MB/s | 8628, 8489, 8567, 8682, 8366 | 8567 | 3.7% | 10122, 10483, 10305, 10602 | 10394 | 4.6% | 1.21 | 0.016 | ToyOS better |
| fs.mem.seq_read.4096 | MB/s | 5455, 5343, 5365, 5460, 5401 | 5401 | 2.2% | 7061, 7117, 7076, 7139 | 7096 | 1.1% | 1.31 | 0.016 | ToyOS better |
| fs.mem.seq_write.1048576 | MB/s | 1564, 1558, 1556, 1563, 1562 | 1562 | 0.5% | 1987, 1871, 1874, 2012 | 1930 | 7.3% | 1.24 | 0.016 | ToyOS better |
| fs.mem.seq_write.4096 | MB/s | 1319, 1303, 1304, 1316, 1309 | 1309 | 1.2% | 426, 339, 342, 366 | 354 | 24.6% | 0.27 | 0.016 | ToyOS worse |
| fs.mem.stat | ns | 2863, 2863, 2863, 1493, 1503 | 2863 | 47.9% | 9328, 11432, 11562, 11061 | 11246 | 19.9% | 3.93 | 0.008 | ToyOS worse |
| fs.mem.tree.100 | ns | 1396915, 1412440, 1411292, 1405962, 1397097 | 1405962 | 1.1% | 3379237, 4018095, 4016222, 4128803 | 4017158 | 18.7% | 2.86 | 0.016 | ToyOS worse |
| fs.mem.write_4k_at | ns | 2863, 2863, 2863, 1823, 1683 | 2863 | 41.2% | 9458, 11682, 11742, 11040 | 11361 | 20.1% | 3.97 | 0.008 | ToyOS worse |
| ipc.connect_accept | ns | 12362, 12432, 12363, 10970, 10922 | 12362 | 12.2% | 2044, 2004, 2024, 2013 | 2018 | 2.0% | 0.16 | 0.016 | ToyOS better |
| ipc.reqrep.4096 | ns | 22349, 18369, 18508, 17203, 17645 | 18369 | 28.0% | 6713, 6633, 6692, 6622 | 6662 | 1.4% | 0.36 | 0.016 | ToyOS better |
| ipc.reqrep.65536 | ns | 42045, 49658, 49590, 47109, 30400 | 47109 | 40.9% | 21741, 21510, 44172, 21701 | 21721 | 104.3% | 0.46 | 0.063 | not resolved |
| ipc.reqrep.8 | ns | 13689, 10058, 10477, 14698, 14630 | 13689 | 33.9% | 6001, 5941, 5991, 5942 | 5966 | 1.0% | 0.44 | 0.016 | ToyOS better |
| ipc.reqrep_handle.8 | ns | 22000, 22001, 22769, 21030, 20921 | 22000 | 8.4% | 6412, 6412, 8426, 6372 | 6412 | 32.0% | 0.29 | 0.016 | ToyOS better |
| mem.anon.map | ns/MiB | 397, 347, 336, 286, 292 | 336 | 33.0% | 170, 173, 345, 167 | 172 | 103.8% | 0.51 | 0.111 | not resolved |
| mem.anon.total | ns/MiB | 509609, 529982, 513887, 505761, 515216 | 513887 | 4.7% | 128271, 128762, 130778, 128671 | 128716 | 1.9% | 0.25 | 0.016 | ToyOS lower |
| mem.anon.touch | ns/MiB | 435703, 447591, 436428, 433286, 440641 | 436428 | 3.3% | 122857, 123515, 123047, 123292 | 123170 | 0.5% | 0.28 | 0.016 | ToyOS lower |
| mem.anon.unmap | ns/MiB | 72166, 82260, 77129, 72195, 73776 | 73776 | 13.7% | 5235, 5180, 5223, 5366 | 5229 | 3.6% | 0.07 | 0.016 | ToyOS lower |
| mem.bw.copy | MB/s | 8160, 8367, 8111, 8300, 8597 | 8300 | 5.9% | 8302, 8333, 8305, 8202 | 8304 | 1.6% | 1.00 | 0.905 | not resolved |
| mem.bw.read | MB/s | 19524, 19242, 19664, 19866, 19737 | 19664 | 3.2% | 19571, 19718, 19532, 19493 | 19552 | 1.2% | 0.99 | 0.730 | not resolved |
| mem.bw.write | MB/s | 9394, 9272, 9315, 9512, 9481 | 9394 | 2.6% | 9732, 9719, 9704, 9704 | 9712 | 0.3% | 1.03 | 0.016 | ToyOS better |
| mem.first_touch.2m | ns/MiB | 132969, 133351, 133243, 132747, 132561 | 132969 | 0.6% | 125379, 126068, 125244, 125760 | 125570 | 0.7% | 0.94 | 0.016 | ToyOS lower |
| mem.first_touch.4k | ns/MiB | 434794, 435299, 430752, 435998, 442746 | 435299 | 2.8% | 125335, 125957, 125410, 125092 | 125372 | 0.7% | 0.29 | 0.016 | ToyOS lower |
| mem.malloc_churn.1048576.t1 | kops/s | 87, 92, 87, 98, 93 | 92 | 12.0% | 228, 211, 218, 230 | 223 | 8.5% | 2.42 | 0.016 | ToyOS higher |
| mem.malloc_churn.1048576.t16 | kops/s | 64, 64, 58, 64, 65 | 64 | 10.9% | 93, 96, 100, 97 | 96 | 7.3% | 1.51 | 0.016 | ToyOS higher |
| mem.malloc_churn.16.t1 | kops/s | 31940, 31397, 31222, 31229, 31651 | 31397 | 2.3% | 39518, 39313, 39302, 39585 | 39416 | 0.7% | 1.26 | 0.016 | ToyOS higher |
| mem.malloc_churn.16.t16 | kops/s | 1714, 1718, 1701, 1727, 1708 | 1714 | 1.5% | 2934, 2910, 2899, 2915 | 2912 | 1.2% | 1.70 | 0.016 | ToyOS higher |
| mem.malloc_churn.4096.t1 | kops/s | 22434, 22425, 22005, 22841, 22762 | 22434 | 3.7% | 38601, 38716, 38773, 38816 | 38744 | 0.6% | 1.73 | 0.016 | ToyOS higher |
| mem.malloc_churn.4096.t16 | kops/s | 1536, 1531, 1541, 1550, 1569 | 1541 | 2.5% | 2400, 2401, 2439, 2356 | 2400 | 3.5% | 1.56 | 0.016 | ToyOS higher |
| mem.map_touch_unmap.2m | ns/MiB | 137515, 137782, 137806, 137100, 136973 | 137515 | 0.6% | 133409, 133525, 133093, 133706 | 133467 | 0.5% | 0.97 | 0.016 | ToyOS lower |
| mem.map_touch_unmap.4k | ns/MiB | 505110, 505894, 500983, 506082, 512636 | 505894 | 2.3% | 131265, 132401, 131387, 130946 | 131326 | 1.1% | 0.26 | 0.016 | ToyOS lower |
| mem.map_unmap_4k | ns | 5378, 5378, 5378, 3957, 3961 | 5378 | 26.4% | 1543, 1532, 1533, 1543 | 1538 | 0.7% | 0.29 | 0.016 | ToyOS better |
| mem.memcpy.1024 | MB/s | 40936, 40741, 40858, 41252, 41390 | 40936 | 1.6% | 44286, 44277, 44278, 44575 | 44282 | 0.7% | 1.08 | 0.016 | ToyOS better |
| mem.memcpy.1048576 | MB/s | 11728, 11575, 11418, 11542, 11644 | 11575 | 2.7% | 11708, 11404, 11530, 11527 | 11528 | 2.6% | 1.00 | 0.413 | not resolved |
| mem.memcpy.16384 | MB/s | 73765, 73843, 72412, 74299, 74977 | 73843 | 3.5% | 88778, 88530, 88803, 89163 | 88790 | 0.7% | 1.20 | 0.016 | ToyOS better |
| mem.memcpy.16777216 | MB/s | 6092, 6162, 6044, 6386, 6205 | 6162 | 5.6% | 6161, 6163, 6165, 6140 | 6162 | 0.4% | 1.00 | 1.000 | not resolved |
| mem.memcpy.256 | MB/s | 16150, 16027, 16053, 16288, 16298 | 16150 | 1.7% | 14588, 14584, 14609, 14714 | 14598 | 0.9% | 0.90 | 0.016 | ToyOS worse |
| mem.memcpy.262144 | MB/s | 35083, 35246, 36846, 36675, 35028 | 35246 | 5.2% | 35153, 40623, 35539, 41600 | 38081 | 16.9% | 1.08 | 0.286 | not resolved |
| mem.memcpy.4096 | MB/s | 84949, 84411, 84484, 85599, 86040 | 84949 | 1.9% | 89524, 89524, 89524, 90050 | 89524 | 0.6% | 1.05 | 0.016 | ToyOS better |
| mem.memcpy.4194304 | MB/s | 10745, 10612, 10772, 10784, 10740 | 10745 | 1.6% | 11059, 10905, 10927, 10825 | 10916 | 2.1% | 1.02 | 0.016 | ToyOS better |
| mem.memcpy.64 | MB/s | 6492, 6453, 6459, 6538, 6555 | 6492 | 1.6% | 3964, 3968, 3966, 3994 | 3967 | 0.8% | 0.61 | 0.016 | ToyOS worse |
| mem.memcpy.65536 | MB/s | 65907, 65284, 65684, 66106, 66415 | 65907 | 1.7% | 67129, 67054, 67124, 67513 | 67126 | 0.7% | 1.02 | 0.016 | ToyOS better |
| mem.memcpy.67108864 | MB/s | 6145, 6060, 6126, 6216, 6184 | 6145 | 2.5% | 6246, 6210, 6213, 6169 | 6212 | 1.2% | 1.01 | 0.190 | not resolved |
| mem.mprotect.4k | ns | 3352, 3352, 3352, 2134, 2123 | 3352 | 36.7% | 701, 711, 711, 701 | 706 | 1.4% | 0.21 | 0.016 | ToyOS better |
| mem.munmap_part.4k | ns | 4680, 4680, 4680, 3086, 3105 | 4680 | 34.1% | 1002, 1002, 1012, 1002 | 1002 | 1.0% | 0.21 | 0.016 | ToyOS better |
| mem.munmap_touched_remote.4k | ns | 5657, 5657, 5657, 4539, 4568 | 5657 | 19.8% | 2845, 2836, 3016, 2836 | 2840 | 6.3% | 0.50 | 0.016 | ToyOS better |
| mem.realloc_grow.1m_256m | ns | 210084, 210435, 210159, 201110, 200600 | 210084 | 4.7% | 50404, 49372, 36559, 49633 | 49502 | 28.0% | 0.24 | 0.016 | ToyOS better |
| mem.realloc_grow.last_128m_256m | ns | 53779, 53848, 53850, 52412, 52815 | 53779 | 2.7% | 7675, 7584, 7544, 7534 | 7564 | 1.9% | 0.14 | 0.016 | ToyOS better |
| net.tcp.connect_accept_close | ns | 76338, 77176, 76690, 49082, 48767 | 76338 | 37.2% |  | - | - | - | - | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.reqrep.64 | ns | 42325, 44490, 42535, 26641, 26001 | 42325 | 43.7% |  | - | - | - | - | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.1 | MB/s | 0, 0, 0, 0, 0 | 0 | - |  | - | - | - | - | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.65536 | MB/s | 2320, 2312, 2336, 2897, 2976 | 2336 | 28.4% |  | - | - | - | - | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.udp.reqrep.64 | ns | 31918, 24236, 31989, 22592, 14058 | 24236 | 74.0% |  | - | - | - | - | ToyOS 4 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| nvme.read.1m.seq |  |  | - | - |  | - | - | - | - | Linux 5 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 4 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| nvme.read.4k.random |  |  | - | - |  | - | - | - | - | Linux 5 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 4 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| persist.append_4k_fsync | ns | 3667436, 3281898, 3762334, 3529631, 3596467 | 3596467 | 13.4% | 2306945, 2501160, 2373811, 2228759 | 2340378 | 11.6% | 0.65 | 0.016 | ToyOS better |
| persist.create_fsync_unlink | ns | 3261929, 3367525, 3319743, 3006245, 3190900 | 3261929 | 11.1% | 2831239, 3012679, 2858400, 2537378 | 2844820 | 16.7% | 0.87 | 0.032 | ToyOS better |
| persist.fsync_clean | ns | 68864, 67677, 68236, 65335, 65006 | 67677 | 5.7% | 10960, 14257, 7854, 8676 | 9818 | 65.2% | 0.15 | 0.016 | ToyOS better |
| persist.seq_read_cached | MB/s | 11269, 11377, 11141, 6702, 6727 | 11141 | 42.0% | 5953, 5878, 6631, 6056 | 6004 | 12.5% | 0.54 | 0.016 | ToyOS worse |
| persist.seq_write_fsync | MB/s | 524, 527, 518, 523, 521 | 523 | 1.7% | 268, 258, 249, 262 | 260 | 7.3% | 0.50 | 0.016 | ToyOS worse |
| persist.write_4k_fsync | ns | 3645436, 3675670, 3108890, 3570339, 3591556 | 3591556 | 15.8% | 2364914, 2507491, 2232947, 2208561 | 2298930 | 13.0% | 0.64 | 0.016 | ToyOS better |
| persist.write_4k_fsync_beside_1m | ns | 4130912, 3592418, 4035208, 3945810, 4108851 | 4035208 | 13.3% | 3007950, 3146370, 2977403, 2807655 | 2992676 | 11.3% | 0.74 | 0.016 | ToyOS better |
| pingpong.futex.cross_core | ns | 13410, 13411, 13410, 9658, 9752 | 13410 | 28.0% | 4639, 4669, 4629, 4629 | 4634 | 0.9% | 0.35 | 0.016 | ToyOS better |
| pingpong.futex.same_cpu | ns | 7543, 7474, 7543, 6152, 6144 | 7474 | 18.7% | 3777, 3777, 3767, 3747 | 3772 | 0.8% | 0.50 | 0.016 | ToyOS better |
| pingpong.pipe.cross_core | ns | 14457, 14458, 14457, 11201, 11166 | 14457 | 22.8% | 5510, 5500, 5501, 5520 | 5506 | 0.4% | 0.38 | 0.016 | ToyOS better |
| pingpong.pipe.same_cpu | ns | 9079, 9011, 9080, 7644, 7598 | 9011 | 16.4% | 4799, 4779, 4729, 4769 | 4774 | 1.5% | 0.53 | 0.016 | ToyOS better |
| pipe.throughput.1024 | MB/s | 1515, 1526, 1608, 1827, 1668 | 1608 | 19.4% | 1904, 1906, 1958, 1954 | 1930 | 2.8% | 1.20 | 0.016 | ToyOS better |
| pipe.throughput.16384 | MB/s | 3582, 3816, 3658, 3714, 3825 | 3714 | 6.5% | 3014, 3046, 3014, 3025 | 3020 | 1.1% | 0.81 | 0.016 | ToyOS worse |
| pipe.throughput.256 | MB/s | 419, 413, 417, 430, 424 | 419 | 4.1% | 491, 485, 501, 492 | 492 | 3.3% | 1.17 | 0.016 | ToyOS better |
| pipe.throughput.4096 | MB/s | 4951, 4919, 4926, 6332, 5729 | 4951 | 28.5% | 3015, 3031, 3022, 3022 | 3022 | 0.5% | 0.61 | 0.016 | ToyOS worse |
| pipe.throughput.64 | MB/s | 107, 107, 106, 119, 103 | 107 | 15.0% | 126, 125, 126, 127 | 126 | 1.6% | 1.18 | 0.016 | ToyOS better |
| pipe.throughput.65536 | MB/s | 1593, 1530, 1486, 2457, 2765 | 1593 | 80.3% | 3027, 3052, 3031, 3033 | 3032 | 0.8% | 1.90 | 0.016 | ToyOS better |
| proc.posix_spawn_wait.std | ns | 939098, 382390, 940595, 942080, 949735 | 940595 | 60.3% | 402194, 487333, 396403, 377729 | 399298 | 27.4% | 0.42 | 0.111 | not resolved |
| proc.posix_spawn_wait.tiny | ns | 99735, 100084, 234188, 224101, 223754 | 223754 | 60.1% | 91421, 82104, 79649, 79889 | 80996 | 14.5% | 0.36 | 0.016 | ToyOS better |
| proc.spawn_wait.large | ns | 286143, 284819, 238379, 272933, 278643 | 278643 | 17.1% | 12607111, 12566304, 12654169, 12514497 | 12586708 | 1.1% | 45.17 | 0.016 | ToyOS worse |
| proc.spawn_wait.tiny | ns | 281044, 279022, 270089, 254428, 256359 | 270089 | 9.9% | 102192, 102222, 81263, 87884 | 95038 | 22.1% | 0.35 | 0.016 | ToyOS better |
| proc.spawn_wait_loop.100 | ns | 29294656, 32809355, 33083074, 30219148, 26877914 | 30219148 | 20.5% | 10093127, 9240077, 10081696, 8589597 | 9660886 | 15.6% | 0.32 | 0.016 | ToyOS better |
| process.spawn_wait | ns | 961202, 989023, 374915, 978826, 962158 | 962158 | 63.8% | 393539, 381686, 389140, 398006 | 391340 | 4.2% | 0.41 | 0.190 | not resolved |
| syscall.null | ps | 158938, 159053, 159625, 157065, 157922 | 158938 | 1.6% | 48701, 48835, 49065, 49008 | 48922 | 0.7% | 0.31 | 0.016 | ToyOS lower |
| tail.diag.periodic.30s | ns |  | - | - | 6113, 6092, 6128, 6156 | 6120 | 1.0% | - | - | Linux 5 run(s) absent |
| tail.stolen.10s | ns | 39950, 39251, 43303, 32527, 34677 | 39251 | 27.5% | 21129, 20679, 20788, 21340 | 20958 | 3.2% | 0.53 | 0.016 | ToyOS better |
| tail.wake.periodic.60s | ns | 73758, 72661, 52606, 60796, 60871 | 60871 | 34.7% | 6117, 6096, 6122, 6159 | 6120 | 1.0% | 0.10 | 0.016 | ToyOS better |
| thread.spawn_join | ns | 56644, 78711, 69214, 69169, 58357 | 69169 | 31.9% | 18024, 17853, 17954, 17713 | 17904 | 1.7% | 0.26 | 0.016 | ToyOS better |
| thread.spawn_join.default | ns | 78572, 80529, 80810, 73639, 71872 | 78572 | 11.4% | 18204, 18134, 18164, 18114 | 18149 | 0.5% | 0.23 | 0.016 | ToyOS better |
| thread.spawn_join.stack64k | ns | 73753, 73335, 74664, 61275, 52494 | 73335 | 30.2% | 15539, 15489, 15589, 15489 | 15514 | 0.6% | 0.21 | 0.016 | ToyOS better |
| time.now | ps | 1213063, 1212972, 1212922, 22599, 22692 | 1212922 | 98.1% | 9399, 9321, 9396, 9380 | 9388 | 0.8% | 0.01 | 0.016 | ToyOS lower |
| time.sleep_late.100us | ns | 65595, 65666, 65667, 60327, 60369 | 65595 | 8.1% | 5688, 5708, 5688, 5688 | 5688 | 0.4% | 0.09 | 0.016 | ToyOS better |
| time.sleep_late.100us.slack1ns | ns | 11189, 19012, 19012, 10351, 10433 | 11189 | 77.4% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.sleep_late.10ms | ns | 118624, 116720, 356423, 339069, 98646 | 118624 | 217.3% | 56248, 56828, 56799, 56007 | 56524 | 1.5% | 0.48 | 0.016 | ToyOS better |
| time.sleep_late.10ms.slack1ns | ns | 96690, 66844, 314005, 289050, 297859 | 289050 | 85.5% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.sleep_late.10us | ns | 61099, 61100, 61100, 53536, 53595 | 61099 | 12.4% | 1421, 1301, 1372, 1362 | 1367 | 8.8% | 0.02 | 0.016 | ToyOS better |
| time.sleep_late.10us.slack1ns | ns | 11023, 18985, 19054, 10454, 10478 | 11023 | 78.0% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.sleep_late.1ms | ns | 81083, 103857, 106101, 70736, 88402 | 88402 | 40.0% | 6247, 6137, 6137, 6257 | 6192 | 1.9% | 0.07 | 0.016 | ToyOS better |
| time.sleep_late.1ms.slack1ns | ns | 24370, 24515, 24312, 11191, 11652 | 24312 | 54.8% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.sleep_late.1us | ns | 61020, 61230, 61090, 53567, 53688 | 61020 | 12.6% | 1385, 1395, 1404, 1435 | 1400 | 3.6% | 0.02 | 0.016 | ToyOS better |
| time.sleep_late.1us.slack1ns | ns | 13388, 19394, 19114, 13497, 12615 | 13497 | 50.2% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.timer_1ms.late | ns | 74292, 74308, 74260, 61099, 61607 | 74260 | 17.8% | 49188, 49721, 48827, 49033 | 49110 | 1.8% | 0.66 | 0.016 | ToyOS better |
| time.timer_1ms.late.slack1ns | ns | 24287, 24250, 24325, 11126, 11601 | 24250 | 54.4% |  | - | - | - | - | ToyOS 4 run(s) absent |
| time.yield | ps | 553158, 551970, 552333, 545807, 551259 | 551970 | 1.3% | 637618, 620980, 623437, 611543 | 622208 | 4.2% | 1.13 | 0.016 | ToyOS higher |
| wake.onto_busy | ns | 10546, 11315, 10197, 8596, 8349 | 10197 | 29.1% | 18305, 18365, 18214, 18425 | 18335 | 1.2% | 1.80 | 0.016 | ToyOS worse |
| wake.periodic.idle | ns | 73768, 73693, 73658, 60767, 61086 | 73658 | 17.7% | 6168, 34616, 6237, 34962 | 20426 | 141.0% | 0.28 | 0.016 | ToyOS better |
| wake.periodic.idle.slack1ns | ns | 23789, 20533, 20134, 10810, 11027 | 20134 | 64.5% |  | - | - | - | - | ToyOS 4 run(s) absent |
| wake.periodic.loaded | ns | 59212, 59264, 59242, 54378, 54438 | 59212 | 8.3% | 4381, 4378, 4425, 4479 | 4403 | 2.3% | 0.07 | 0.016 | ToyOS better |
| wake.periodic.loaded.slack1ns | ns | 9294, 9256, 9156, 4339, 4414 | 9156 | 54.1% |  | - | - | - | - | ToyOS 4 run(s) absent |
| wake.storm.call.w1 | ns | 10406, 5797, 10057, 4819, 8399 | 8399 | 66.5% | 7484, 7624, 7775, 7274 | 7554 | 6.6% | 0.90 | 0.730 | not resolved |
| wake.storm.call.w16 | ns | 46306, 54410, 61321, 42419, 52420 | 52420 | 36.1% | 15850, 14978, 15659, 15289 | 15474 | 5.6% | 0.30 | 0.016 | ToyOS better |
| wake.storm.call.w4 | ns | 15086, 14668, 14807, 12603, 12138 | 14668 | 20.1% | 9037, 8366, 9037, 8817 | 8927 | 7.5% | 0.61 | 0.016 | ToyOS better |
| wake.storm.call.w64 | ns | 262890, 232799, 252618, 236634, 232094 | 236634 | 13.0% | 25087, 23584, 24657, 23815 | 24236 | 6.2% | 0.10 | 0.016 | ToyOS better |
| wake.storm.drain.w1 | ns | 86327, 49940, 81924, 65714, 76576 | 76576 | 47.5% | 50555, 50534, 51827, 50595 | 50575 | 2.6% | 0.66 | 0.190 | not resolved |
| wake.storm.drain.w16 | ns | 115032, 123629, 161055, 103064, 681849 | 123629 | 468.2% | 80761, 80161, 90820, 80551 | 80656 | 13.2% | 0.65 | 0.016 | ToyOS better |
| wake.storm.drain.w4 | ns | 85139, 89195, 82972, 77274, 76185 | 82972 | 15.7% | 55784, 55544, 57067, 55655 | 55720 | 2.7% | 0.67 | 0.016 | ToyOS better |
| wake.storm.drain.w64 | ns | 819752, 877763, 1036311, 888426, 737647 | 877763 | 34.0% | 237205, 241022, 241804, 233418 | 239114 | 3.5% | 0.27 | 0.016 | ToyOS better |
| work.build_shaped.j1 | ns | 1639173487, 1109818268, 1509601469, 1726023179, 1748148751 | 1639173487 | 38.9% | 881879466, 877043806, 891888138, 893999138 | 886883802 | 1.9% | 0.54 | 0.016 | ToyOS better |
| work.build_shaped.j16 | ns | 91691719, 111417724, 94887930, 118030104, 107734386 | 107734386 | 24.4% | 277557191, 276628091, 278290116, 276358472 | 277092641 | 0.7% | 2.57 | 0.016 | ToyOS worse |
| work.compress_inproc | ns | 433767586, 431879177, 434152505, 430933132, 430887420 | 431879177 | 0.8% | 426389241, 426753119, 427338600, 421506335 | 426571180 | 1.4% | 0.99 | 0.016 | ToyOS better |

Each p is its row's alone, uncorrected for the table's other rows.

