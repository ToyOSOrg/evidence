## 11th_Gen_Intel(R)_Core(TM)_i5-1135G7_@_2.40GHz

Runs: Linux 2, ToyOS 1. lan.peer_link: none. internet.link: none.

Linux setup: kernel=6.8.0-147-generic, cpufreq_driver=intel_pstate*8, governor=powersave*8, epp=balance_performance*8, min_khz=400000*8, max_khz=4200000*8, boost=absent, intel_no_turbo=0, platform_profile=balanced, smt_active=1, fs.mem.served_by=tmpfs,_through_the_VFS, persist.served_by=ext4,_NVMe_disk,_model_SK_hynix_BC501_HFM256GDJTNG-8310A.

Linux per run: clocksource=tsc,tsc.

ToyOS setup: fs.mem.served_by=the_kernel's_tmpfs,_through_syscalls, fs.served.served_by=the_DATA_file_server,_through_IPC, persist.served_by=boot_USB_stick_TOYOS-LOG_partition,_FAT32,_LOG_file_server_over_usbd_mass_storage.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.chunk@fair | ns | 2995, 2995 | 2995 | 0.0% | 2993 | 2993 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.chunk@sched | ns | 2995, 3001 | 2998 | 0.2% | 2993 | 2993 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.chunk@system | ns | 2992, 3014 | 3003 | 0.7% | 2993 | 2993 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.667) |
| cpu.clock@boot | MHz | 4195, 4148 | 4172 | 1.1% | 3790 | 3790 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@crunch | MHz | 4190, 4189 | 4190 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@energy | MHz | 4194, 4158 | 4176 | 0.9% | 3789 | 3789 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@fair | MHz | 4189, 4188 | 4188 | 0.0% | 3789 | 3789 | 0.0% | 0.90 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@files | MHz | 1396, 1396 | 1396 | 0.0% | 4188 | 4188 | 0.0% | 3.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@identity | MHz | 4194, 4153 | 4174 | 1.0% | 3789 | 3789 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@ipc | MHz | 4189, 4189 | 4189 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@mem | MHz | 4189, 4189 | 4189 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@net | MHz | 4189, 4189 | 4189 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@nvme | MHz | 1396, 1396 | 1396 | 0.0% | 4188 | 4188 | 0.0% | 3.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@persist | MHz | 4190, 4189 | 4190 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@procs | MHz | 4190, 4189 | 4190 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@sched | MHz | 4189, 4180 | 4184 | 0.2% | 4188 | 4188 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.667) |
| cpu.clock@system | MHz | 4193, 4162 | 4178 | 0.7% | 4189 | 4189 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.667) |
| cpu.clock@tail | MHz | 4191, 4190 | 4190 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@time | MHz | 4189, 4189 | 4189 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@work | MHz | 4192, 4190 | 4191 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.all.deflate | ns | 183330944, 89971405 | 136651174 | 68.3% |  | - | - | - | - | the clock did not settle in 1 of 2 Linux run(s); ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.matmul | ns | 5171892 | 5171892 | 0.0% |  | - | - | - | - | the clock did not settle in 1 of 1 Linux run(s); Linux 1 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.parse | ns | 2742923241 | 2742923241 | 0.0% |  | - | - | - | - | Linux 1 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.sha256 | ns | 1979278, 991265 | 1485272 | 66.5% |  | - | - | - | - | the clock did not settle in 1 of 2 Linux run(s); ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.single.deflate | ns | 55010613, 54830445 | 54920529 | 0.3% | 54562021 | 54562021 | 0.0% | 0.99 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.single.matmul | ns | 1196184, 1005395 | 1100790 | 17.3% | 1084913 | 1084913 | 0.0% | 0.99 | 1.000 | too few runs to resolve (least p 0.667); the clock fell in 1 of 2 Linux run(s) |
| crunch.single.parse | ns | 68244305, 58421970 | 63333138 | 15.5% | 35158538 | 35158538 | 0.0% | 0.56 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.single.sha256 | ns | 568082, 567764 | 567923 | 0.1% | 567188 | 567188 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| energy.idle_60s.package |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: energy_uj_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_energy`_reads_it; ToyOS 1 run(s) unsupported: no_counter_carries_the_package's_energy:_toyos_abi::counters::Counter_has_none |
| fair.apart.build | permille | 124, 124 | 124 | 0.0% | 126 | 126 | 0.0% | 1.02 | 0.333 | too few runs to resolve (least p 0.333) |
| fair.apart.helpers | permille | 416, 426 | 421 | 2.4% | 432 | 432 | 0.0% | 1.03 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.apart.threaded | permille | 458, 449 | 454 | 2.0% | 441 | 441 | 0.0% | 0.97 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.apart.total | chunks/s | 1644012, 2390512 | 2017262 | 37.0% | 2363005 | 2363005 | 0.0% | 1.17 | 1.000 | too few runs to resolve (least p 0.667) |
| fair.session.build | permille | 63, 57 | 60 | 10.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.helpers | permille | 445, 450 | 448 | 1.1% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.threaded | permille | 490, 492 | 491 | 0.4% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.total | chunks/s | 1675955, 2391912 | 2033934 | 35.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.shared.build | permille | 60, 63 | 62 | 4.9% | 58 | 58 | 0.0% | 0.94 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.helpers | permille | 448, 452 | 450 | 0.9% | 471 | 471 | 0.0% | 1.05 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.threaded | permille | 492, 485 | 488 | 1.4% | 471 | 471 | 0.0% | 0.96 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.total | chunks/s | 2391948, 2391273 | 2391610 | 0.0% | 2364748 | 2364748 | 0.0% | 0.99 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.create_write_unlink | ns | 4703, 4649 | 4676 | 1.2% | 12750 | 12750 | 0.0% | 2.73 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.mkdir_rmdir | ns | 2181, 2171 | 2176 | 0.5% | 9158 | 9158 | 0.0% | 4.21 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.open_close | ns | 1123, 1115 | 1119 | 0.7% | 7235 | 7235 | 0.0% | 6.47 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.read_4k_at | ns | 671, 692 | 682 | 3.1% | 1192 | 1192 | 0.0% | 1.75 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.readdir.1000 | ns | 179748, 181326 | 180537 | 0.9% | 1145866 | 1145866 | 0.0% | 6.35 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.rename | ns | 1628, 1594 | 1611 | 2.1% | 7348 | 7348 | 0.0% | 4.56 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_read.1048576 | MB/s | 9345, 9395 | 9370 | 0.5% | 7340 | 7340 | 0.0% | 0.78 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_read.4096 | MB/s | 8288, 8270 | 8279 | 0.2% | 4813 | 4813 | 0.0% | 0.58 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_write.1048576 | MB/s | 4528, 4562 | 4545 | 0.7% | 4637 | 4637 | 0.0% | 1.02 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_write.4096 | MB/s | 3609, 3590 | 3600 | 0.5% | 3301 | 3301 | 0.0% | 0.92 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.stat | ns | 582, 574 | 578 | 1.4% | 3042 | 3042 | 0.0% | 5.26 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.tree.100 | ns | 565159, 556525 | 560842 | 1.5% | 1540249 | 1540249 | 0.0% | 2.75 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.write_4k_at | ns | 589, 627 | 608 | 6.2% | 1232 | 1232 | 0.0% | 2.03 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.served.create_write_unlink | ns |  | - | - | 59579 | 59579 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.mkdir_rmdir | ns |  | - | - | 98232 | 98232 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.open_close | ns |  | - | - | 15526 | 15526 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.read_4k_at | ns |  | - | - | 18226 | 18226 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.readdir.1000 | ns |  | - | - | 910600 | 910600 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.rename | ns |  | - | - | 84785 | 84785 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_read.1048576 | MB/s |  | - | - | 7079 | 7079 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_read.4096 | MB/s |  | - | - | 392 | 392 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_write.1048576 | MB/s |  | - | - | 1134 | 1134 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_write.4096 | MB/s |  | - | - | 323 | 323 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.stat | ns |  | - | - | 11404 | 11404 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.tree.100 | ns |  | - | - | 14907190 | 14907190 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.write_4k_at | ns |  | - | - | 18496 | 18496 | 0.0% | - | - | Linux 2 run(s) absent |
| identity.cpuidle |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_kernel_names_its_idle_states_to_no_program |
| identity.nvme |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_NVMe_driver_keeps_its_controller's_identity_and_no_right_reads_it_from_another_program |
| identity.usb |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: usbd_keeps_its_devices_and_no_right_reads_them_from_another_program |
| ipc.connect_accept | ns | 3825, 3825 | 3825 | 0.0% | 3128 | 3128 | 0.0% | 0.82 | 0.333 | too few runs to resolve (least p 0.333) |
| ipc.reqrep.4096 | ns | 7137, 8602 | 7870 | 18.6% | 8701 | 8701 | 0.0% | 1.11 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.65536 | ns | 19138, 17829 | 18484 | 7.1% | 35433 | 35433 | 0.0% | 1.92 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.8 | ns | 3535, 3479 | 3507 | 1.6% | 7151 | 7151 | 0.0% | 2.04 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep_handle.8 | ns | 7297, 9350 | 8324 | 24.7% | 8912 | 8912 | 0.0% | 1.07 | 1.000 | too few runs to resolve (least p 0.667) |
| mem.anon.map | ns/MiB | 69, 92 | 80 | 28.6% | 118 | 118 | 0.0% | 1.47 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.total | ns/MiB | 258229, 259110 | 258670 | 0.3% | 127793 | 127793 | 0.0% | 0.49 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.touch | ns/MiB | 235952, 236229 | 236090 | 0.1% | 121709 | 121709 | 0.0% | 0.52 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.unmap | ns/MiB | 22279, 22453 | 22366 | 0.8% | 3807 | 3807 | 0.0% | 0.17 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.copy | MB/s | 6969, 6976 | 6972 | 0.1% | 6662 | 6662 | 0.0% | 0.96 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.read | MB/s | 17748, 17133 | 17440 | 3.5% | 16957 | 16957 | 0.0% | 0.97 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.write | MB/s | 9406, 9407 | 9406 | 0.0% | 9591 | 9591 | 0.0% | 1.02 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.first_touch.2m | ns/MiB | 99016, 99202 | 99109 | 0.2% | 123005 | 123005 | 0.0% | 1.24 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.first_touch.4k | ns/MiB | 236131, 236965 | 236548 | 0.4% | 127256 | 127256 | 0.0% | 0.54 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.1048576.t1 | kops/s | 178, 213 | 196 | 17.9% | 177 | 177 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.1048576.t8 | kops/s | 90, 154 | 122 | 52.5% | 104 | 104 | 0.0% | 0.85 | 1.000 | too few runs to resolve (least p 0.667); settled clocks apart: Linux 3690 MHz, ToyOS 4188 MHz |
| mem.malloc_churn.16.t1 | kops/s | 32855, 32819 | 32837 | 0.1% | 36477 | 36477 | 0.0% | 1.11 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.16.t8 | kops/s | 3167, 3177 | 3172 | 0.3% | 4929 | 4929 | 0.0% | 1.55 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.4096.t1 | kops/s | 21472, 21616 | 21544 | 0.7% | 31023 | 31023 | 0.0% | 1.44 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.4096.t8 | kops/s | 873, 2076 | 1474 | 81.6% | 3175 | 3175 | 0.0% | 2.15 | 0.667 | too few runs to resolve (least p 0.667); settled clocks apart: Linux 3641 MHz, ToyOS 4188 MHz |
| mem.map_touch_unmap.2m | ns/MiB | 100712, 100909 | 100810 | 0.2% | 127921 | 127921 | 0.0% | 1.27 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_touch_unmap.4k | ns/MiB | 257127, 258184 | 257656 | 0.4% | 132223 | 132223 | 0.0% | 0.51 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_unmap_4k | ns | 1602, 1609 | 1606 | 0.4% | 2554 | 2554 | 0.0% | 1.59 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.1024 | MB/s | 79356, 77668 | 78512 | 2.1% | 85791 | 85791 | 0.0% | 1.09 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.1048576 | MB/s | 28340, 25389 | 26864 | 11.0% | 25836 | 25836 | 0.0% | 0.96 | 1.000 | too few runs to resolve (least p 0.667) |
| mem.memcpy.16384 | MB/s | 200418, 179746 | 190082 | 10.9% | 186367 | 186367 | 0.0% | 0.98 | 1.000 | too few runs to resolve (least p 0.667) |
| mem.memcpy.16777216 | MB/s | 10717, 10601 | 10659 | 1.1% | 10470 | 10470 | 0.0% | 0.98 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.256 | MB/s | 24558, 24900 | 24729 | 1.4% | 27497 | 27497 | 0.0% | 1.11 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.262144 | MB/s | 55584, 55621 | 55602 | 0.1% | 55727 | 55727 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.4096 | MB/s | 157450, 151415 | 154432 | 3.9% | 164981 | 164981 | 0.0% | 1.07 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.4194304 | MB/s | 20345, 21030 | 20688 | 3.3% | 20599 | 20599 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.667) |
| mem.memcpy.64 | MB/s | 6213, 6229 | 6221 | 0.3% | 18532 | 18532 | 0.0% | 2.98 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.65536 | MB/s | 54995, 55176 | 55086 | 0.3% | 55421 | 55421 | 0.0% | 1.01 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.67108864 | MB/s | 9685, 9565 | 9625 | 1.2% | 9144 | 9144 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.mprotect.4k | ns | 1017, 1017 | 1017 | 0.0% | 948 | 948 | 0.0% | 0.93 | 0.333 | too few runs to resolve (least p 0.333) |
| mem.munmap_part.4k | ns | 1270, 1258 | 1264 | 0.9% | 1548 | 1548 | 0.0% | 1.22 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.munmap_touched_remote.4k | ns | 2468, 2293 | 2380 | 7.4% | 2969 | 2969 | 0.0% | 1.25 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 1 of 2 Linux run(s) |
| mem.realloc_grow.1m_256m | ns | 109349, 86088 | 97718 | 23.8% | 46448 | 46448 | 0.0% | 0.48 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.realloc_grow.last_128m_256m | ns | 24793, 20039 | 22416 | 21.2% | 10899 | 10899 | 0.0% | 0.49 | 0.667 | too few runs to resolve (least p 0.667) |
| net.tcp.connect_accept_close | ns | 21068, 20876 | 20972 | 0.9% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.reqrep.64 | ns | 8820, 8857 | 8838 | 0.4% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.1 | MB/s | 1, 1 | 1 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.65536 | MB/s | 6766, 6753 | 6760 | 0.2% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.udp.reqrep.64 | ns | 7992, 7245 | 7618 | 9.8% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| nvme.read.1m.seq |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| nvme.read.4k.random |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| persist.append_4k_fsync | ns | 794686, 1037703 | 916194 | 26.5% | 6734595 | 6734595 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb |
| persist.create_fsync_unlink | ns | 852614, 961110 | 906862 | 12.0% | 6192884 | 6192884 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb |
| persist.fsync_clean | ns | 22964, 23036 | 23000 | 0.3% | 14532 | 14532 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb |
| persist.seq_read_cached | MB/s | 10731, 10998 | 10864 | 2.5% | 1024 | 1024 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb |
| persist.seq_write_fsync | MB/s | 584, 501 | 542 | 15.3% | 17 | 17 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb |
| persist.write_4k_fsync | ns | 1048722, 919976 | 984349 | 13.1% | 1049525 | 1049525 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb |
| pingpong.futex.cross_core | ns | 3353, 3331 | 3342 | 0.7% | 4763 | 4763 | 0.0% | 1.43 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.futex.same_cpu | ns | 2201, 2294 | 2248 | 4.1% | 4697 | 4697 | 0.0% | 2.09 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.pipe.cross_core | ns | 3732, 3964 | 3848 | 6.0% | 6836 | 6836 | 0.0% | 1.78 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.pipe.same_cpu | ns | 3165, 4261 | 3713 | 29.5% | 6179 | 6179 | 0.0% | 1.66 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.1024 | MB/s | 1725, 1749 | 1737 | 1.4% | 1135 | 1135 | 0.0% | 0.65 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.16384 | MB/s | 3839, 3854 | 3846 | 0.4% | 4751 | 4751 | 0.0% | 1.24 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.256 | MB/s | 639, 630 | 634 | 1.4% | 326 | 326 | 0.0% | 0.51 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.4096 | MB/s | 4239, 4118 | 4178 | 2.9% | 2943 | 2943 | 0.0% | 0.70 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.64 | MB/s | 168, 163 | 166 | 3.0% | 82 | 82 | 0.0% | 0.50 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.65536 | MB/s | 4045, 4010 | 4028 | 0.9% | 7665 | 7665 | 0.0% | 1.90 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.posix_spawn_wait.std | ns | 167962, 168223 | 168092 | 0.2% | 444437 | 444437 | 0.0% | 2.64 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.posix_spawn_wait.tiny | ns | 43674, 42939 | 43306 | 1.7% | 55990 | 55990 | 0.0% | 1.29 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait.large | ns | 54729, 54457 | 54593 | 0.5% | 190562 | 190562 | 0.0% | 3.49 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait.tiny | ns | 52007, 51552 | 51780 | 0.9% | 53084 | 53084 | 0.0% | 1.03 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait_loop.100 | ns | 5372138, 5428546 | 5400342 | 1.0% | 5589219 | 5589219 | 0.0% | 1.03 | 0.667 | too few runs to resolve (least p 0.667) |
| process.spawn_wait | ns | 177350, 179221 | 178286 | 1.0% | 458392 | 458392 | 0.0% | 2.57 | 0.667 | too few runs to resolve (least p 0.667) |
| syscall.null | ps | 91869, 92411 | 92140 | 0.6% | 70078 | 70078 | 0.0% | 0.76 | 0.667 | too few runs to resolve (least p 0.667) |
| tail.diag.periodic.30s | ns |  | - | - | 17965 | 17965 | 0.0% | - | - | Linux 2 run(s) absent |
| tail.stolen.10s | ns | 32981, 46388 | 39684 | 33.8% | 25117 | 25117 | 0.0% | 0.63 | 0.667 | too few runs to resolve (least p 0.667) |
| tail.wake.periodic.60s | ns | 69284, 67484 | 68384 | 2.6% | 18088 | 18088 | 0.0% | 0.26 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join | ns | 25020, 25279 | 25150 | 1.0% | 28601 | 28601 | 0.0% | 1.14 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join.default | ns | 25112, 25233 | 25172 | 0.5% | 29388 | 29388 | 0.0% | 1.17 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join.stack64k | ns | 23514, 23681 | 23598 | 0.7% | 28729 | 28729 | 0.0% | 1.22 | 0.667 | too few runs to resolve (least p 0.667) |
| time.now | ps | 14293, 14301 | 14297 | 0.1% | 19816 | 19816 | 0.0% | 1.39 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.100us | ns | 51848, 51863 | 51856 | 0.0% | 4287 | 4287 | 0.0% | 0.08 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.100us.slack1ns | ns | 1759, 1821 | 1790 | 3.5% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10ms | ns | 217539, 225768 | 221654 | 3.7% | 28156 | 28156 | 0.0% | 0.13 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.10ms.slack1ns | ns | 163719, 163482 | 163600 | 0.1% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10us | ns | 51827, 51829 | 51828 | 0.0% | 1132 | 1132 | 0.0% | 0.02 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.10us.slack1ns | ns | 1829, 1818 | 1824 | 0.6% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1ms | ns | 73909, 74196 | 74052 | 0.4% | 23668 | 23668 | 0.0% | 0.32 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.1ms.slack1ns | ns | 19816, 20343 | 20080 | 2.6% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1us | ns | 51826, 51826 | 51826 | 0.0% | 1426 | 1426 | 0.0% | 0.03 | 0.333 | too few runs to resolve (least p 0.333) |
| time.sleep_late.1us.slack1ns | ns | 4222, 4612 | 4417 | 8.8% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.timer_1ms.late | ns | 70226, 70232 | 70229 | 0.0% | 12818 | 12818 | 0.0% | 0.18 | 0.667 | too few runs to resolve (least p 0.667) |
| time.timer_1ms.late.slack1ns | ns | 33005, 20373 | 26689 | 47.3% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.yield | ps | 190928, 191112 | 191020 | 0.1% |  | - | - | - | - | ToyOS 1 run(s) unsupported: no_yield_syscall:_std's_yield_now_is_a_spin-loop_hint |
| wake.onto_busy | ns | 2209, 2419 | 2314 | 9.1% | 3940 | 3940 | 0.0% | 1.70 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle | ns | 69610, 70121 | 69866 | 0.7% | 18322 | 18322 | 0.0% | 0.26 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle.slack1ns | ns | 17811, 18400 | 18106 | 3.3% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.periodic.loaded | ns | 52424, 52823 | 52624 | 0.8% | 3036 | 3036 | 0.0% | 0.06 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.loaded.slack1ns | ns | 2373, 2573 | 2473 | 8.1% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.storm.call.w1 | ns | 5480, 4449 | 4964 | 20.8% | 1235 | 1235 | 0.0% | 0.25 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w16 | ns | 53950, 58212 | 56081 | 7.6% | 13196 | 13196 | 0.0% | 0.24 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w4 | ns | 12018, 10056 | 11037 | 17.8% | 8782 | 8782 | 0.0% | 0.80 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w64 | ns | 204873, 257196 | 231034 | 22.6% | 21023 | 21023 | 0.0% | 0.09 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w1 | ns | 26199, 100266 | 63232 | 117.1% | 18309 | 18309 | 0.0% | 0.29 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w16 | ns | 208594, 192611 | 200602 | 8.0% | 148265 | 148265 | 0.0% | 0.74 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w4 | ns | 123998, 127506 | 125752 | 2.8% | 129607 | 129607 | 0.0% | 1.03 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w64 | ns | 580720, 294286 | 437503 | 65.5% | 287622 | 287622 | 0.0% | 0.66 | 0.667 | too few runs to resolve (least p 0.667) |
| work.build_shaped.j1 | ns | 948266403, 935608669 | 941937536 | 1.3% | 693866963 | 693866963 | 0.0% | 0.74 | 0.667 | too few runs to resolve (least p 0.667) |
| work.build_shaped.j8 | ns | 98008935, 98230880 | 98119908 | 0.2% | 164851203 | 164851203 | 0.0% | 1.68 | 0.667 | too few runs to resolve (least p 0.667) |
| work.compress_inproc | ns | 362354629, 362472747 | 362413688 | 0.0% | 359080324 | 359080324 | 0.0% | 0.99 | 0.667 | too few runs to resolve (least p 0.667) |

Each p is its row's alone, uncorrected for the table's other rows.

