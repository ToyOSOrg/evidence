## 11th_Gen_Intel(R)_Core(TM)_i5-1135G7_@_2.40GHz

Runs: Linux 2, ToyOS 1. lan.peer_link: none. internet.link: none.

Linux setup: kernel=6.8.0-147-generic, cpufreq_driver=intel_pstate*8, governor=powersave*8, epp=balance_performance*8, min_khz=400000*8, max_khz=4200000*8, boost=absent, intel_no_turbo=0, platform_profile=balanced, clocksource=tsc, smt_active=1, fs.mem.served_by=tmpfs,_through_the_VFS, persist.served_by=ext4,_NVMe_disk,_model_SK_hynix_BC501_HFM256GDJTNG-8310A.

ToyOS setup: fs.mem.served_by=the_kernel's_tmpfs,_through_syscalls, fs.served.served_by=the_DATA_file_server,_through_IPC, persist.served_by=boot_USB_stick_TOYOS-LOG_partition,_FAT32,_LOG_file_server_over_usbd_mass_storage.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.chunk@fair | ns | 2994, 2994 | 2994 | 0.0% | 2993 | 2993 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.chunk@sched | ns | 2994, 2994 | 2994 | 0.0% | 2993 | 2993 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.chunk@system | ns | 2994, 2994 | 2994 | 0.0% | 3309 | 3309 | 0.0% | 1.11 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@boot | MHz | 4186, 3862 | 4024 | 8.1% | 3787 | 3787 | 0.0% | 0.94 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@crunch | MHz | 4186, 4186 | 4186 | 0.0% | 4186 | 4186 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 1.000) |
| cpu.clock@energy | MHz | 4186, 4186 | 4186 | 0.0% | 3787 | 3787 | 0.0% | 0.90 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@fair | MHz | 4186, 3788 | 3987 | 10.0% | 3788 | 3788 | 0.0% | 0.95 | 1.000 | too few runs to resolve (least p 0.333) |
| cpu.clock@files | MHz | 1295, 1295 | 1295 | 0.0% | 3789 | 3789 | 0.0% | 2.93 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@identity | MHz | 4186, 4186 | 4186 | 0.0% | 3787 | 3787 | 0.0% | 0.90 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@ipc | MHz | 4185, 4185 | 4185 | 0.0% | 4186 | 4186 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@mem | MHz | 4186, 4184 | 4185 | 0.0% | 3788 | 3788 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@net | MHz | 4185, 4184 | 4184 | 0.0% | 3788 | 3788 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@nvme | MHz | 1296, 1295 | 1296 | 0.1% | 4022 | 4022 | 0.0% | 3.10 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@persist | MHz | 1295, 1295 | 1295 | 0.0% | 3787 | 3787 | 0.0% | 2.92 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@procs | MHz | 4186, 4184 | 4185 | 0.0% | 4184 | 4184 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.333) |
| cpu.clock@sched | MHz | 4185, 4185 | 4185 | 0.0% | 4184 | 4184 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@system | MHz | 4186, 4185 | 4186 | 0.0% | 3788 | 3788 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@tail | MHz | 4186, 4186 | 4186 | 0.0% | 3788 | 3788 | 0.0% | 0.90 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@time | MHz | 4186, 4185 | 4186 | 0.0% | 4186 | 4186 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.333) |
| cpu.clock@work | MHz | 4186, 4186 | 4186 | 0.0% | 1595 | 1595 | 0.0% | 0.38 | 0.333 | too few runs to resolve (least p 0.333) |
| crunch.all.deflate | ns | 89897250, 89945760 | 89921505 | 0.1% |  | - | - | - | - | ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.matmul | ns | 2225253 | 2225253 | 0.0% |  | - | - | - | - | Linux 1 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.parse |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.sha256 | ns | 990712, 990711 | 990712 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.single.deflate | ns | 54808638, 54961232 | 54884935 | 0.3% | 54629065 | 54629065 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.single.matmul | ns | 1012599, 1010873 | 1011736 | 0.2% | 1084998 | 1084998 | 0.0% | 1.07 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.single.parse | ns | 59074230, 59004107 | 59039168 | 0.1% | 34981182 | 34981182 | 0.0% | 0.59 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.single.sha256 | ns | 567528, 567501 | 567514 | 0.0% | 567189 | 567189 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| energy.idle_60s.package |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: energy_uj_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_energy`_reads_it; ToyOS 1 run(s) unsupported: no_counter_carries_the_package's_energy:_toyos_abi::counters::Counter_has_none |
| fair.apart.build | permille | 124, 124 | 124 | 0.0% | 126 | 126 | 0.0% | 1.02 | 0.333 | too few runs to resolve (least p 0.333) |
| fair.apart.helpers | permille | 428, 431 | 430 | 0.7% | 428 | 428 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.333) |
| fair.apart.threaded | permille | 446, 443 | 444 | 0.7% | 445 | 445 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.667) |
| fair.apart.total | chunks/s | 2391164, 2386306 | 2388735 | 0.2% | 2361739 | 2361739 | 0.0% | 0.99 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.session.build | permille | 66, 61 | 64 | 7.9% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.helpers | permille | 452, 445 | 448 | 1.6% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.threaded | permille | 479, 493 | 486 | 2.9% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.total | chunks/s | 2392460, 2391407 | 2391934 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.shared.build | permille | 67, 59 | 63 | 12.7% | 58 | 58 | 0.0% | 0.92 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.helpers | permille | 453, 447 | 450 | 1.3% | 471 | 471 | 0.0% | 1.05 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.threaded | permille | 481, 493 | 487 | 2.5% | 468 | 468 | 0.0% | 0.96 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.total | chunks/s | 2392265, 2368121 | 2380193 | 1.0% | 2366804 | 2366804 | 0.0% | 0.99 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.create_write_unlink | ns | 4663, 4724 | 4694 | 1.3% | 13089 | 13089 | 0.0% | 2.79 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.mkdir_rmdir | ns | 2149, 2163 | 2156 | 0.6% | 9412 | 9412 | 0.0% | 4.37 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.open_close | ns | 1116, 1116 | 1116 | 0.0% | 7271 | 7271 | 0.0% | 6.52 | 0.333 | too few runs to resolve (least p 0.333) |
| fs.mem.read_4k_at | ns | 652, 669 | 660 | 2.6% | 1196 | 1196 | 0.0% | 1.81 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.readdir.1000 | ns | 181230, 182884 | 182057 | 0.9% | 1145953 | 1145953 | 0.0% | 6.29 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.rename | ns | 1607, 1603 | 1605 | 0.2% | 7873 | 7873 | 0.0% | 4.91 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_read.1048576 | MB/s | 9480, 9376 | 9428 | 1.1% | 7135 | 7135 | 0.0% | 0.76 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_read.4096 | MB/s | 8347, 8284 | 8316 | 0.8% | 4685 | 4685 | 0.0% | 0.56 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_write.1048576 | MB/s | 4557, 4563 | 4560 | 0.1% | 4560 | 4560 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_write.4096 | MB/s | 3598, 3610 | 3604 | 0.3% | 3275 | 3275 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.stat | ns | 577, 581 | 579 | 0.7% | 3043 | 3043 | 0.0% | 5.26 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.tree.100 | ns | 563257, 564070 | 563664 | 0.1% | 1529249 | 1529249 | 0.0% | 2.71 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.write_4k_at | ns | 607, 624 | 616 | 2.8% | 1246 | 1246 | 0.0% | 2.02 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.served.create_write_unlink | ns |  | - | - | 59502 | 59502 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.mkdir_rmdir | ns |  | - | - | 98132 | 98132 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.open_close | ns |  | - | - | 15472 | 15472 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.read_4k_at | ns |  | - | - | 18160 | 18160 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.readdir.1000 | ns |  | - | - | 907819 | 907819 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.rename | ns |  | - | - | 84523 | 84523 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_read.1048576 | MB/s |  | - | - | 7111 | 7111 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_read.4096 | MB/s |  | - | - | 374 | 374 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_write.1048576 | MB/s |  | - | - | 1175 | 1175 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_write.4096 | MB/s |  | - | - | 321 | 321 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.stat | ns |  | - | - | 11274 | 11274 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.tree.100 | ns |  | - | - | 14876659 | 14876659 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.write_4k_at | ns |  | - | - | 18261 | 18261 | 0.0% | - | - | Linux 2 run(s) absent |
| identity.cpuidle |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_kernel_names_its_idle_states_to_no_program |
| identity.nvme |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_NVMe_driver_keeps_its_controller's_identity_and_no_right_reads_it_from_another_program |
| identity.usb |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: usbd_keeps_its_devices_and_no_right_reads_them_from_another_program |
| ipc.connect_accept | ns | 3844, 3802 | 3823 | 1.1% | 3142 | 3142 | 0.0% | 0.82 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.4096 | ns | 7228, 7210 | 7219 | 0.2% | 8728 | 8728 | 0.0% | 1.21 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.65536 | ns | 18995, 19022 | 19008 | 0.1% | 35667 | 35667 | 0.0% | 1.88 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.8 | ns | 4008, 3617 | 3812 | 10.3% | 7168 | 7168 | 0.0% | 1.88 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep_handle.8 | ns | 7385, 7343 | 7364 | 0.6% | 8915 | 8915 | 0.0% | 1.21 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.map | ns/MiB | 73, 104 | 88 | 35.0% | 106 | 106 | 0.0% | 1.20 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.total | ns/MiB | 257433, 257839 | 257636 | 0.2% | 128258 | 128258 | 0.0% | 0.50 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.touch | ns/MiB | 235483, 235429 | 235456 | 0.0% | 122802 | 122802 | 0.0% | 0.52 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.unmap | ns/MiB | 21754, 22306 | 22030 | 2.5% | 3500 | 3500 | 0.0% | 0.16 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.copy | MB/s | 6968, 6981 | 6974 | 0.2% | 6659 | 6659 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.read | MB/s | 17763, 17199 | 17481 | 3.2% | 17653 | 17653 | 0.0% | 1.01 | 1.000 | too few runs to resolve (least p 0.667) |
| mem.bw.write | MB/s | 9270, 9379 | 9324 | 1.2% | 9302 | 9302 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.667) |
| mem.first_touch.2m | ns/MiB | 99514, 99890 | 99702 | 0.4% | 125445 | 125445 | 0.0% | 1.26 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.first_touch.4k | ns/MiB | 237460, 237399 | 237430 | 0.0% | 124860 | 124860 | 0.0% | 0.53 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.1048576.t1 | kops/s | 212, 225 | 218 | 5.9% | 199 | 199 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.1048576.t8 | kops/s | 153, 152 | 152 | 0.7% | 106 | 106 | 0.0% | 0.70 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.16.t1 | kops/s | 32529, 32592 | 32560 | 0.2% | 36582 | 36582 | 0.0% | 1.12 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.16.t8 | kops/s | 2542, 3138 | 2840 | 21.0% | 4846 | 4846 | 0.0% | 1.71 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.4096.t1 | kops/s | 20966, 21105 | 21036 | 0.7% | 31013 | 31013 | 0.0% | 1.47 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.4096.t8 | kops/s | 2076, 2078 | 2077 | 0.1% | 3118 | 3118 | 0.0% | 1.50 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_touch_unmap.2m | ns/MiB | 101282, 101582 | 101432 | 0.3% | 130854 | 130854 | 0.0% | 1.29 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_touch_unmap.4k | ns/MiB | 258654, 258522 | 258588 | 0.1% | 130173 | 130173 | 0.0% | 0.50 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_unmap_4k | ns | 1613, 1617 | 1615 | 0.2% | 2557 | 2557 | 0.0% | 1.58 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.1024 | MB/s | 68720, 78193 | 73456 | 12.9% | 84108 | 84108 | 0.0% | 1.15 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.1048576 | MB/s | 25973, 28265 | 27119 | 8.5% | 24345 | 24345 | 0.0% | 0.90 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.16384 | MB/s | 222865, 194167 | 208516 | 13.8% | 189710 | 189710 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.16777216 | MB/s | 10469, 10747 | 10608 | 2.6% | 10515 | 10515 | 0.0% | 0.99 | 1.000 | too few runs to resolve (least p 0.667) |
| mem.memcpy.256 | MB/s | 24953, 24791 | 24872 | 0.7% | 30629 | 30629 | 0.0% | 1.23 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.262144 | MB/s | 55641, 55626 | 55634 | 0.0% | 55717 | 55717 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.4096 | MB/s | 156021, 152664 | 154342 | 2.2% | 164981 | 164981 | 0.0% | 1.07 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.4194304 | MB/s | 21985, 20505 | 21245 | 7.0% | 20487 | 20487 | 0.0% | 0.96 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.64 | MB/s | 6167, 6170 | 6168 | 0.0% | 17869 | 17869 | 0.0% | 2.90 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.65536 | MB/s | 55149, 55263 | 55206 | 0.2% | 55425 | 55425 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.67108864 | MB/s | 9620, 9675 | 9648 | 0.6% | 9144 | 9144 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.mprotect.4k | ns | 1019, 1028 | 1024 | 0.9% | 959 | 959 | 0.0% | 0.94 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.munmap_part.4k | ns | 1278, 1269 | 1274 | 0.7% | 1558 | 1558 | 0.0% | 1.22 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.munmap_touched_remote.4k | ns | 2311, 2298 | 2304 | 0.6% | 2983 | 2983 | 0.0% | 1.29 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.realloc_grow.1m_256m | ns | 86622, 91775 | 89198 | 5.8% | 44585 | 44585 | 0.0% | 0.50 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.realloc_grow.last_128m_256m | ns | 20304, 20864 | 20584 | 2.7% | 11544 | 11544 | 0.0% | 0.56 | 0.667 | too few runs to resolve (least p 0.667) |
| net.tcp.connect_accept_close | ns | 21345, 21063 | 21204 | 1.3% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.reqrep.64 | ns | 8915, 8871 | 8893 | 0.5% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.1 | MB/s | 1, 1 | 1 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.65536 | MB/s | 6687, 6668 | 6678 | 0.3% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.udp.reqrep.64 | ns | 7289, 7377 | 7333 | 1.2% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| nvme.read.1m.seq |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| nvme.read.4k.random |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| persist.append_4k_fsync | ns | 1206504, 1287209 | 1246856 | 6.5% | 5558636 | 5558636 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb |
| persist.create_fsync_unlink | ns | 935905, 965276 | 950590 | 3.1% | 5451143 | 5451143 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb |
| persist.fsync_clean | ns | 23014, 23042 | 23028 | 0.1% | 13027 | 13027 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb |
| persist.seq_read_cached | MB/s | 10032, 10455 | 10244 | 4.1% | 1022 | 1022 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb |
| persist.seq_write_fsync | MB/s | 586, 578 | 582 | 1.4% | 21 | 21 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb |
| persist.write_4k_fsync | ns | 999711, 1004922 | 1002316 | 0.5% | 947397 | 947397 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb |
| pingpong.futex.cross_core | ns | 3634, 3338 | 3486 | 8.5% | 4734 | 4734 | 0.0% | 1.36 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.futex.same_cpu | ns | 2301, 2212 | 2256 | 3.9% | 4645 | 4645 | 0.0% | 2.06 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.pipe.cross_core | ns | 4093, 3700 | 3896 | 10.1% | 6645 | 6645 | 0.0% | 1.71 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.pipe.same_cpu | ns | 6226, 7163 | 6694 | 14.0% | 6786 | 6786 | 0.0% | 1.01 | 1.000 | too few runs to resolve (least p 0.667) |
| pipe.throughput.1024 | MB/s | 1773, 1759 | 1766 | 0.8% | 1178 | 1178 | 0.0% | 0.67 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.16384 | MB/s | 3889, 3841 | 3865 | 1.2% | 4828 | 4828 | 0.0% | 1.25 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.256 | MB/s | 647, 637 | 642 | 1.6% | 313 | 313 | 0.0% | 0.49 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.4096 | MB/s | 4158, 4143 | 4150 | 0.4% | 2816 | 2816 | 0.0% | 0.68 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.64 | MB/s | 169, 167 | 168 | 1.2% | 80 | 80 | 0.0% | 0.48 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.65536 | MB/s | 4429, 4199 | 4314 | 5.3% | 7734 | 7734 | 0.0% | 1.79 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.posix_spawn_wait.std | ns | 169099, 167658 | 168378 | 0.9% | 437430 | 437430 | 0.0% | 2.60 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.posix_spawn_wait.tiny | ns | 43635, 44133 | 43884 | 1.1% | 55684 | 55684 | 0.0% | 1.27 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait.large | ns | 53887, 54139 | 54013 | 0.5% | 190138 | 190138 | 0.0% | 3.52 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait.tiny | ns | 52071, 51312 | 51692 | 1.5% | 61666 | 61666 | 0.0% | 1.19 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait_loop.100 | ns | 5462602, 5422006 | 5442304 | 0.7% | 5841672 | 5841672 | 0.0% | 1.07 | 0.667 | too few runs to resolve (least p 0.667) |
| process.spawn_wait | ns | 174720, 174395 | 174558 | 0.2% | 448123 | 448123 | 0.0% | 2.57 | 0.667 | too few runs to resolve (least p 0.667) |
| syscall.null | ps | 92064, 92219 | 92142 | 0.2% | 69408 | 69408 | 0.0% | 0.75 | 0.667 | too few runs to resolve (least p 0.667) |
| tail.diag.periodic.30s | ns |  | - | - | 17904 | 17904 | 0.0% | - | - | Linux 2 run(s) absent |
| tail.stolen.10s | ns | 3002454, 27946 | 1515200 | 196.3% | 21901 | 21901 | 0.0% | 0.01 | 0.667 | too few runs to resolve (least p 0.667) |
| tail.wake.periodic.60s | ns | 69321, 67536 | 68428 | 2.6% | 17923 | 17923 | 0.0% | 0.26 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join | ns | 24969, 25066 | 25018 | 0.4% | 28427 | 28427 | 0.0% | 1.14 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join.default | ns | 25077, 24633 | 24855 | 1.8% | 29406 | 29406 | 0.0% | 1.18 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join.stack64k | ns | 23324, 23412 | 23368 | 0.4% | 28858 | 28858 | 0.0% | 1.23 | 0.667 | too few runs to resolve (least p 0.667) |
| time.now | ps | 14295, 14292 | 14294 | 0.0% | 19816 | 19816 | 0.0% | 1.39 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.100us | ns | 51851, 51840 | 51846 | 0.0% | 4289 | 4289 | 0.0% | 0.08 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.100us.slack1ns | ns | 1825, 1817 | 1821 | 0.4% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10ms | ns | 215979, 216693 | 216336 | 0.3% | 27230 | 27230 | 0.0% | 0.13 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.10ms.slack1ns | ns | 164876, 163104 | 163990 | 1.1% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10us | ns | 51820, 51811 | 51816 | 0.0% | 1133 | 1133 | 0.0% | 0.02 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.10us.slack1ns | ns | 1825, 1804 | 1814 | 1.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1ms | ns | 70967, 71300 | 71134 | 0.5% | 22989 | 22989 | 0.0% | 0.32 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.1ms.slack1ns | ns | 20333, 20373 | 20353 | 0.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1us | ns | 51811, 51814 | 51812 | 0.0% | 1452 | 1452 | 0.0% | 0.03 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.1us.slack1ns | ns | 4246, 4263 | 4254 | 0.4% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.timer_1ms.late | ns | 70358, 70268 | 70313 | 0.1% | 12851 | 12851 | 0.0% | 0.18 | 0.667 | too few runs to resolve (least p 0.667) |
| time.timer_1ms.late.slack1ns | ns | 20155, 16255 | 18205 | 21.4% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.yield | ps | 191188, 191447 | 191318 | 0.1% |  | - | - | - | - | ToyOS 1 run(s) unsupported: no_yield_syscall:_std's_yield_now_is_a_spin-loop_hint |
| wake.onto_busy | ns | 2436, 2225 | 2330 | 9.1% | 4010 | 4010 | 0.0% | 1.72 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle | ns | 67853, 69427 | 68640 | 2.3% | 18571 | 18571 | 0.0% | 0.27 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle.slack1ns | ns | 19432, 17775 | 18604 | 8.9% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.periodic.loaded | ns | 52411, 52383 | 52397 | 0.1% | 3025 | 3025 | 0.0% | 0.06 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.loaded.slack1ns | ns | 2361, 2358 | 2360 | 0.1% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.storm.call.w1 | ns | 3793, 3709 | 3751 | 2.2% | 1289 | 1289 | 0.0% | 0.34 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w16 | ns | 56698, 55493 | 56096 | 2.1% | 12037 | 12037 | 0.0% | 0.21 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w4 | ns | 10577, 11512 | 11044 | 8.5% | 9248 | 9248 | 0.0% | 0.84 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w64 | ns | 236579, 232394 | 234486 | 1.8% | 23941 | 23941 | 0.0% | 0.10 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w1 | ns | 99894, 22781 | 61338 | 125.7% | 18563 | 18563 | 0.0% | 0.30 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w16 | ns | 830202, 168058 | 499130 | 132.7% | 140369 | 140369 | 0.0% | 0.28 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w4 | ns | 125543, 126775 | 126159 | 1.0% | 129728 | 129728 | 0.0% | 1.03 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w64 | ns | 312458, 284142 | 298300 | 9.5% | 291875 | 291875 | 0.0% | 0.98 | 1.000 | too few runs to resolve (least p 0.667) |
| work.build_shaped.j1 | ns | 978851904, 894458951 | 936655428 | 9.0% | 722651859 | 722651859 | 0.0% | 0.77 | 0.667 | too few runs to resolve (least p 0.667) |
| work.build_shaped.j8 | ns | 99065641, 98606350 | 98835996 | 0.5% | 163291873 | 163291873 | 0.0% | 1.65 | 0.667 | too few runs to resolve (least p 0.667) |
| work.compress_inproc | ns | 361468100, 362812981 | 362140540 | 0.4% | 357769401 | 357769401 | 0.0% | 0.99 | 0.667 | too few runs to resolve (least p 0.667) |

Each p is its row's alone, uncorrected for the table's other rows.

