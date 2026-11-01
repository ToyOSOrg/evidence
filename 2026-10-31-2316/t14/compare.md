## 11th_Gen_Intel(R)_Core(TM)_i5-1135G7_@_2.40GHz

Runs: Linux 2, ToyOS 1. lan.peer_link: none. internet.link: none.

Linux setup: kernel=6.8.0-147-generic, cpufreq_driver=intel_pstate*8, governor=powersave*8, epp=balance_performance*8, min_khz=400000*8, max_khz=4200000*8, boost=absent, intel_no_turbo=0, platform_profile=balanced, smt_active=1, fs.mem.served_by=tmpfs,_through_the_VFS, fs.disk.served_by=ext4,_NVMe_disk,_model_<machine>,_write_cache_write_back, persist.served_by=ext4,_NVMe_disk,_model_<machine>,_write_cache_write_back.

Linux per run: clocksource=tsc,tsc.

ToyOS setup: fs.mem.served_by=the_kernel's_tmpfs,_through_syscalls, fs.disk.served_by=DATA_volume,_bcachefs_crate's_format,_DATA_file_server_over_the_block_service, persist.served_by=DATA_volume,_bcachefs_crate's_format,_DATA_file_server_over_the_block_service.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.chunk@fair | ns | 3000, 3032 | 3016 | 1.1% | 2993 | 2993 | 0.0% | 0.99 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.chunk@sched | ns | 3022, 2994 | 3008 | 0.9% | 2993 | 2993 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.chunk@system | ns | 2994, 2994 | 2994 | 0.0% | 3308 | 3308 | 0.0% | 1.10 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@boot | MHz | 4190, 4190 | 4190 | 0.0% | 3790 | 3790 | 0.0% | 0.90 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@crunch | MHz | 4190, 4189 | 4190 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@fair | MHz | 4182, 4137 | 4160 | 1.1% | 3789 | 3789 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@files | MHz | 1396, 1379 | 1388 | 1.2% | 4189 | 4189 | 0.0% | 3.02 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@identity | MHz | 4190, 4190 | 4190 | 0.0% | 3790 | 3790 | 0.0% | 0.90 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@ipc | MHz | 4189, 4188 | 4188 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.333) |
| cpu.clock@mem | MHz | 4189, 4188 | 4188 | 0.0% | 4189 | 4189 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.333) |
| cpu.clock@net | MHz | 4189, 4188 | 4188 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.333) |
| cpu.clock@nvme | MHz | 1396, 1396 | 1396 | 0.0% | 4188 | 4188 | 0.0% | 3.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@persist | MHz | 4190, 4189 | 4190 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@procs | MHz | 4189, 4188 | 4188 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.333) |
| cpu.clock@sched | MHz | 4152, 4190 | 4171 | 0.9% | 4188 | 4188 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.667) |
| cpu.clock@system | MHz | 4190, 4190 | 4190 | 0.0% | 3789 | 3789 | 0.0% | 0.90 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@tail | MHz | 4189, 4189 | 4189 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@time | MHz | 4189, 4189 | 4189 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@work | MHz | 4189, 4189 | 4189 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| crunch.all.deflate | ns | 90532429, 90550286 | 90541358 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.matmul | ns | 2243466 | 2243466 | 0.0% |  | - | - | - | - | Linux 1 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.parse |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.sha256 | ns | 1010917, 1010880 | 1010898 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.single.deflate | ns | 55349882, 55350518 | 55350200 | 0.0% | 54447582 | 54447582 | 0.0% | 0.98 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.single.matmul | ns | 1009610, 1009223 | 1009416 | 0.0% | 1077765 | 1077765 | 0.0% | 1.07 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.single.parse | ns | 58444084, 58588728 | 58516406 | 0.2% | 35581533 | 35581533 | 0.0% | 0.61 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.single.sha256 | ns | 555584, 555786 | 555685 | 0.0% | 570303 | 570303 | 0.0% | 1.03 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.apart.build | permille | 124, 125 | 124 | 0.8% | 125 | 125 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.333) |
| fair.apart.helpers | permille | 428, 425 | 426 | 0.7% | 428 | 428 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.333) |
| fair.apart.threaded | permille | 446, 444 | 445 | 0.4% | 445 | 445 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.667) |
| fair.apart.total | chunks/s | 2390003, 2386703 | 2388353 | 0.1% | 2367255 | 2367255 | 0.0% | 0.99 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.session.build | permille | 60, 59 | 60 | 1.7% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.helpers | permille | 449, 452 | 450 | 0.7% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.threaded | permille | 486, 486 | 486 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.total | chunks/s | 2391922, 2390582 | 2391252 | 0.1% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.shared.build | permille | 61, 62 | 62 | 1.6% | 57 | 57 | 0.0% | 0.93 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.helpers | permille | 443, 451 | 447 | 1.8% | 466 | 466 | 0.0% | 1.04 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.threaded | permille | 492, 485 | 488 | 1.4% | 474 | 474 | 0.0% | 0.97 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.total | chunks/s | 2390098, 2379209 | 2384654 | 0.5% | 2374326 | 2374326 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.create_write_unlink | ns | 11242, 11171 | 11206 | 0.6% | 161348 | 161348 | 0.0% | 14.40 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.direct.fstat | ns |  | - | - | 8450 | 8450 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.disk.direct.pread_4k | ns |  | - | - | 9430 | 9430 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.disk.direct.read_4k_at | ns |  | - | - | 17753 | 17753 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.disk.direct.seek | ns |  | - | - | 8348 | 8348 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.disk.direct.stat | ns |  | - | - | 10657 | 10657 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.disk.fstat | ns | 233, 214 | 224 | 8.5% | 8719 | 8719 | 0.0% | 39.01 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.mkdir_rmdir | ns | 15150, 15203 | 15176 | 0.3% | 84955 | 84955 | 0.0% | 5.60 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.open_close | ns | 1295, 1210 | 1252 | 6.8% | 26222 | 26222 | 0.0% | 20.94 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.pread_4k | ns | 625, 554 | 590 | 12.0% | 9584 | 9584 | 0.0% | 16.26 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.pread_8 | ns | 379, 375 | 377 | 1.1% | 8959 | 8959 | 0.0% | 23.76 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.read_4k | ns | 532, 546 | 539 | 2.6% | 9576 | 9576 | 0.0% | 17.77 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.read_4k_at | ns | 717, 740 | 728 | 3.2% | 10012 | 10012 | 0.0% | 13.74 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.readdir.1000 | ns | 272470, 275216 | 273843 | 1.0% | 908345 | 908345 | 0.0% | 3.32 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.rename | ns | 3626, 3621 | 3624 | 0.1% | 87717 | 87717 | 0.0% | 24.21 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seek | ns | 118, 121 | 120 | 2.5% | 264 | 264 | 0.0% | 2.21 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_read.1048576 | MB/s | 10016, 10017 | 10016 | 0.0% | 7016 | 7016 | 0.0% | 0.70 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_read.4096 | MB/s | 7783, 7785 | 7784 | 0.0% | 427 | 427 | 0.0% | 0.05 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_write.1048576 | MB/s | 346, 347 | 346 | 0.3% | 349 | 349 | 0.0% | 1.01 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_write.4096 | MB/s | 617, 631 | 624 | 2.2% | 133 | 133 | 0.0% | 0.21 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.stat | ns | 586, 581 | 584 | 0.9% | 11631 | 11631 | 0.0% | 19.93 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.tree.100 | ns | 1351516, 1350228 | 1350872 | 0.1% | 13957113 | 13957113 | 0.0% | 10.33 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.write_4k_at | ns | 713, 730 | 722 | 2.4% | 10195 | 10195 | 0.0% | 14.13 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.create_write_unlink | ns | 4711, 4751 | 4731 | 0.8% | 13490 | 13490 | 0.0% | 2.85 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.fstat | ns | 230, 214 | 222 | 7.2% | 427 | 427 | 0.0% | 1.92 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.mkdir_rmdir | ns | 2214, 2207 | 2210 | 0.3% | 9243 | 9243 | 0.0% | 4.18 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.open_close | ns | 1124, 1124 | 1124 | 0.0% | 7861 | 7861 | 0.0% | 6.99 | 0.333 | too few runs to resolve (least p 0.333) |
| fs.mem.pread_4k | ns | 558, 579 | 568 | 3.7% | 888 | 888 | 0.0% | 1.56 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.pread_8 | ns | 342, 341 | 342 | 0.3% | 556 | 556 | 0.0% | 1.63 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.read_4k | ns | 554, 488 | 521 | 12.7% | 823 | 823 | 0.0% | 1.58 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.read_4k_at | ns | 714, 653 | 684 | 8.9% | 1226 | 1226 | 0.0% | 1.79 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.readdir.1000 | ns | 178319, 176440 | 177380 | 1.1% | 1155650 | 1155650 | 0.0% | 6.52 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.rename | ns | 1622, 1611 | 1616 | 0.7% | 7735 | 7735 | 0.0% | 4.79 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seek | ns | 117, 116 | 116 | 0.9% | 215 | 215 | 0.0% | 1.85 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_read.1048576 | MB/s | 9074, 9128 | 9101 | 0.6% | 6985 | 6985 | 0.0% | 0.77 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_read.4096 | MB/s | 8260, 8310 | 8285 | 0.6% | 4677 | 4677 | 0.0% | 0.56 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_write.1048576 | MB/s | 4652, 4654 | 4653 | 0.0% | 4549 | 4549 | 0.0% | 0.98 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_write.4096 | MB/s | 3627, 3624 | 3626 | 0.1% | 3180 | 3180 | 0.0% | 0.88 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.stat | ns | 585, 579 | 582 | 1.0% | 3251 | 3251 | 0.0% | 5.59 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.tree.100 | ns | 582908, 587092 | 585000 | 0.7% | 1510344 | 1510344 | 0.0% | 2.58 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.write_4k_at | ns | 611, 629 | 620 | 2.9% | 1183 | 1183 | 0.0% | 1.91 | 0.667 | too few runs to resolve (least p 0.667) |
| identity.cpuidle |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_kernel_names_its_idle_states_to_no_program |
| identity.nvme |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_NVMe_driver_keeps_its_controller's_identity_and_no_right_reads_it_from_another_program |
| identity.usb |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: usbd_keeps_its_devices_and_no_right_reads_them_from_another_program |
| ipc.connect_accept | ns | 3875, 3839 | 3857 | 0.9% | 3163 | 3163 | 0.0% | 0.82 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.4096 | ns | 7452, 7126 | 7289 | 4.5% | 8721 | 8721 | 0.0% | 1.20 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.65536 | ns | 18782, 18840 | 18811 | 0.3% | 41507 | 41507 | 0.0% | 2.21 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.8 | ns | 3462, 3451 | 3456 | 0.3% | 7098 | 7098 | 0.0% | 2.05 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep_handle.8 | ns | 7168, 7326 | 7247 | 2.2% | 8898 | 8898 | 0.0% | 1.23 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.map | ns/MiB | 102, 92 | 97 | 10.3% | 154 | 154 | 0.0% | 1.59 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.total | ns/MiB | 262665, 256868 | 259766 | 2.2% | 127216 | 127216 | 0.0% | 0.49 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.touch | ns/MiB | 239279, 234790 | 237034 | 1.9% | 121310 | 121310 | 0.0% | 0.51 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.unmap | ns/MiB | 22857, 21986 | 22422 | 3.9% | 3914 | 3914 | 0.0% | 0.17 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.copy | MB/s | 6920, 6968 | 6944 | 0.7% | 6762 | 6762 | 0.0% | 0.97 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.read | MB/s | 17168, 18305 | 17736 | 6.4% | 19456 | 19456 | 0.0% | 1.10 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.write | MB/s | 9357, 9299 | 9328 | 0.6% | 9541 | 9541 | 0.0% | 1.02 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.first_touch.2m | ns/MiB | 99401, 100020 | 99710 | 0.6% | 125103 | 125103 | 0.0% | 1.25 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.first_touch.4k | ns/MiB | 237320, 237560 | 237440 | 0.1% | 128431 | 128431 | 0.0% | 0.54 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.1048576.t1 | kops/s | 214, 226 | 220 | 5.5% | 208 | 208 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.1048576.t8 | kops/s | 154, 158 | 156 | 2.6% | 105 | 105 | 0.0% | 0.67 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.16.t1 | kops/s | 33513, 33332 | 33422 | 0.5% | 36359 | 36359 | 0.0% | 1.09 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.16.t8 | kops/s | 2602, 2608 | 2605 | 0.2% | 4906 | 4906 | 0.0% | 1.88 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.4096.t1 | kops/s | 20927, 21514 | 21220 | 2.8% | 31377 | 31377 | 0.0% | 1.48 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.4096.t8 | kops/s | 2079, 2076 | 2078 | 0.1% | 3095 | 3095 | 0.0% | 1.49 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_touch_unmap.2m | ns/MiB | 101095, 101707 | 101401 | 0.6% | 131285 | 131285 | 0.0% | 1.29 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_touch_unmap.4k | ns/MiB | 258480, 258554 | 258517 | 0.0% | 134659 | 134659 | 0.0% | 0.52 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_unmap_4k | ns | 1616, 1605 | 1610 | 0.7% | 3211 | 3211 | 0.0% | 1.99 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.1024 | MB/s | 78611, 72628 | 75620 | 7.9% | 82492 | 82492 | 0.0% | 1.09 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.1048576 | MB/s | 25874, 27939 | 26906 | 7.7% | 24666 | 24666 | 0.0% | 0.92 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.16384 | MB/s | 203983, 189576 | 196780 | 7.3% | 184995 | 184995 | 0.0% | 0.94 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.16777216 | MB/s | 10894, 10718 | 10806 | 1.6% | 10273 | 10273 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.256 | MB/s | 24507, 24504 | 24506 | 0.0% | 28221 | 28221 | 0.0% | 1.15 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.262144 | MB/s | 55657, 55575 | 55616 | 0.1% | 55710 | 55710 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.4096 | MB/s | 156004, 151390 | 153697 | 3.0% | 164981 | 164981 | 0.0% | 1.07 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.4194304 | MB/s | 20935, 20247 | 20591 | 3.3% | 18703 | 18703 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.64 | MB/s | 6149, 6135 | 6142 | 0.2% | 17869 | 17869 | 0.0% | 2.91 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.65536 | MB/s | 55260, 55003 | 55132 | 0.5% | 55454 | 55454 | 0.0% | 1.01 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.67108864 | MB/s | 9683, 9673 | 9678 | 0.1% | 9253 | 9253 | 0.0% | 0.96 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.mprotect.4k | ns | 1023, 1024 | 1024 | 0.1% | 955 | 955 | 0.0% | 0.93 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.munmap_part.4k | ns | 1267, 1270 | 1268 | 0.2% | 1560 | 1560 | 0.0% | 1.23 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.munmap_touched_remote.4k | ns | 2289, 2286 | 2288 | 0.1% | 3038 | 3038 | 0.0% | 1.33 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 1 of 2 Linux run(s) |
| mem.realloc_grow.1m_256m | ns | 86712, 90795 | 88754 | 4.6% | 45238 | 45238 | 0.0% | 0.51 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.realloc_grow.last_128m_256m | ns | 20224, 20851 | 20538 | 3.1% | 11045 | 11045 | 0.0% | 0.54 | 0.667 | too few runs to resolve (least p 0.667) |
| net.tcp.connect_accept_close | ns | 21047, 20834 | 20940 | 1.0% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.reqrep.64 | ns | 8956, 8768 | 8862 | 2.1% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.1 | MB/s | 1, 1 | 1 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.65536 | MB/s | 6732, 6744 | 6738 | 0.2% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.udp.reqrep.64 | ns | 7373, 7387 | 7380 | 0.2% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| nvme.read.1m.seq |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| nvme.read.4k.random |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| persist.append_4k_fsync | ns | 796972, 1128952 | 962962 | 34.5% | 5986532 | 5986532 | 0.0% | 6.22 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.create_fsync_unlink | ns | 819078, 938524 | 878801 | 13.6% | 6534922 | 6534922 | 0.0% | 7.44 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.fsync_clean | ns | 23030, 23037 | 23034 | 0.0% | 16379 | 16379 | 0.0% | 0.71 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.seq_read_cached | MB/s | 10672, 9985 | 10328 | 6.7% | 6732 | 6732 | 0.0% | 0.65 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.seq_write_fsync | MB/s | 602, 584 | 593 | 3.0% | 142 | 142 | 0.0% | 0.24 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.write_4k_fsync | ns | 1020448, 1005373 | 1012910 | 1.5% | 6070364 | 6070364 | 0.0% | 5.99 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.futex.cross_core | ns | 3346, 3390 | 3368 | 1.3% | 4654 | 4654 | 0.0% | 1.38 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.futex.same_cpu | ns | 2291, 2338 | 2314 | 2.0% | 4230 | 4230 | 0.0% | 1.83 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.pipe.cross_core | ns | 4029, 3758 | 3894 | 7.0% | 6841 | 6841 | 0.0% | 1.76 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.pipe.same_cpu | ns | 3615, 3559 | 3587 | 1.6% | 6096 | 6096 | 0.0% | 1.70 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.1024 | MB/s | 1761, 1732 | 1746 | 1.7% | 1131 | 1131 | 0.0% | 0.65 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.16384 | MB/s | 3842, 3845 | 3844 | 0.1% | 4727 | 4727 | 0.0% | 1.23 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.256 | MB/s | 637, 639 | 638 | 0.3% | 301 | 301 | 0.0% | 0.47 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.4096 | MB/s | 4145, 4168 | 4156 | 0.6% | 2925 | 2925 | 0.0% | 0.70 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.64 | MB/s | 166, 167 | 166 | 0.6% | 76 | 76 | 0.0% | 0.46 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.65536 | MB/s | 4269, 4163 | 4216 | 2.5% | 7601 | 7601 | 0.0% | 1.80 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.posix_spawn_wait.std | ns | 167239, 168352 | 167796 | 0.7% | 456804 | 456804 | 0.0% | 2.72 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.posix_spawn_wait.tiny | ns | 44004, 43383 | 43694 | 1.4% | 57420 | 57420 | 0.0% | 1.31 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait.large | ns | 54737, 54233 | 54485 | 0.9% | 180066 | 180066 | 0.0% | 3.30 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait.tiny | ns | 52001, 51730 | 51866 | 0.5% | 52843 | 52843 | 0.0% | 1.02 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait_loop.100 | ns | 5417664, 5405134 | 5411399 | 0.2% | 5566036 | 5566036 | 0.0% | 1.03 | 0.667 | too few runs to resolve (least p 0.667) |
| process.spawn_wait | ns | 180894, 177570 | 179232 | 1.9% | 451491 | 451491 | 0.0% | 2.52 | 0.667 | too few runs to resolve (least p 0.667) |
| syscall.null | ps | 91827, 91765 | 91796 | 0.1% | 74832 | 74832 | 0.0% | 0.82 | 0.667 | too few runs to resolve (least p 0.667) |
| tail.diag.periodic.30s | ns |  | - | - | 17817 | 17817 | 0.0% | - | - | Linux 2 run(s) absent |
| tail.stolen.10s | ns | 33659, 30548 | 32104 | 9.7% | 21242 | 21242 | 0.0% | 0.66 | 0.667 | too few runs to resolve (least p 0.667) |
| tail.wake.periodic.60s | ns | 69337, 69421 | 69379 | 0.1% | 17711 | 17711 | 0.0% | 0.26 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join | ns | 25793, 25569 | 25681 | 0.9% | 28004 | 28004 | 0.0% | 1.09 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join.default | ns | 25418, 25302 | 25360 | 0.5% | 28680 | 28680 | 0.0% | 1.13 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join.stack64k | ns | 23780, 23720 | 23750 | 0.3% | 28645 | 28645 | 0.0% | 1.21 | 0.667 | too few runs to resolve (least p 0.667) |
| time.now | ps | 14297, 14311 | 14304 | 0.1% | 19816 | 19816 | 0.0% | 1.39 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.100us | ns | 51869, 51858 | 51864 | 0.0% | 4462 | 4462 | 0.0% | 0.09 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.100us.slack1ns | ns | 1851, 1830 | 1840 | 1.1% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10ms | ns | 218270, 213489 | 215880 | 2.2% | 28612 | 28612 | 0.0% | 0.13 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.10ms.slack1ns | ns | 165368, 162981 | 164174 | 1.5% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10us | ns | 51831, 51832 | 51832 | 0.0% | 1418 | 1418 | 0.0% | 0.03 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.10us.slack1ns | ns | 1827, 1808 | 1818 | 1.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1ms | ns | 71698, 71615 | 71656 | 0.1% | 23094 | 23094 | 0.0% | 0.32 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.1ms.slack1ns | ns | 20333, 20465 | 20399 | 0.6% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1us | ns | 51834, 51830 | 51832 | 0.0% | 1375 | 1375 | 0.0% | 0.03 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.1us.slack1ns | ns | 5602, 1577 | 3590 | 112.1% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.timer_1ms.late | ns | 140509, 77469 | 108989 | 57.8% | 12957 | 12957 | 0.0% | 0.12 | 0.667 | too few runs to resolve (least p 0.667) |
| time.timer_1ms.late.slack1ns | ns | 115056, 20397 | 67726 | 139.8% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.yield | ps | 190598, 193226 | 191912 | 1.4% |  | - | - | - | - | ToyOS 1 run(s) unsupported: no_yield_syscall:_std's_yield_now_is_a_spin-loop_hint |
| wake.onto_busy | ns | 2255, 2478 | 2366 | 9.4% | 3803 | 3803 | 0.0% | 1.61 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle | ns | 72821, 74733 | 73777 | 2.6% | 17961 | 17961 | 0.0% | 0.24 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle.slack1ns | ns | 19361, 27845 | 23603 | 35.9% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.periodic.loaded | ns | 54530, 68338 | 61434 | 22.5% | 3021 | 3021 | 0.0% | 0.05 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.loaded.slack1ns | ns | 3408, 10496 | 6952 | 102.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.storm.call.w1 | ns | 5270, 4844 | 5057 | 8.4% | 1501 | 1501 | 0.0% | 0.30 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w16 | ns | 61216, 59195 | 60206 | 3.4% | 13788 | 13788 | 0.0% | 0.23 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w4 | ns | 11015, 8768 | 9892 | 22.7% | 9222 | 9222 | 0.0% | 0.93 | 1.000 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w64 | ns | 232891, 246009 | 239450 | 5.5% | 22074 | 22074 | 0.0% | 0.09 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w1 | ns | 36021, 26350 | 31186 | 31.0% | 18202 | 18202 | 0.0% | 0.58 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w16 | ns | 535297, 212395 | 373846 | 86.4% | 164282 | 164282 | 0.0% | 0.44 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w4 | ns | 120673, 122611 | 121642 | 1.6% | 124304 | 124304 | 0.0% | 1.02 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w64 | ns | 286452, 286371 | 286412 | 0.0% | 282799 | 282799 | 0.0% | 0.99 | 0.667 | too few runs to resolve (least p 0.667) |
| work.build_shaped.j1 | ns | 987573122, 927955105 | 957764114 | 6.2% | 682764175 | 682764175 | 0.0% | 0.71 | 0.667 | too few runs to resolve (least p 0.667) |
| work.build_shaped.j8 | ns | 99182821, 99011592 | 99097206 | 0.2% | 158469697 | 158469697 | 0.0% | 1.60 | 0.667 | too few runs to resolve (least p 0.667) |
| work.compress_inproc | ns | 365520622, 365855041 | 365687832 | 0.1% | 358722745 | 358722745 | 0.0% | 0.98 | 0.667 | too few runs to resolve (least p 0.667) |

Each p is its row's alone, uncorrected for the table's other rows.

