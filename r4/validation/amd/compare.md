## AMD_Ryzen_7_4800U_with_Radeon_Graphics

Runs: Linux 2, ToyOS 1. lan.peer_link: none. internet.link: none.

Linux setup: kernel=6.8.0-147-generic, cpufreq_driver=acpi-cpufreq*16, governor=schedutil*16, epp=absent*16, min_khz=1400000*16, max_khz=1800000*16, boost=1, intel_no_turbo=absent, platform_profile=balanced, clocksource=hpet, smt_active=1, fs.mem.served_by=tmpfs,_through_the_VFS, persist.served_by=ext4,_NVMe_disk,_model_SAMSUNG_MZVLB1T0HBLR-000L2.

ToyOS setup: fs.mem.served_by=the_kernel's_tmpfs,_through_syscalls, fs.served.served_by=the_DATA_file_server,_through_IPC, persist.served_by=boot_USB_stick_TOYOS-LOG_partition,_FAT32,_LOG_file_server_over_usbd_mass_storage.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.chunk@fair | ns | 4330, 4330 | 4330 | 0.0% | 2936 | 2936 | 0.0% | 0.68 | 0.333 | too few runs to resolve (least p 0.333); the clock did not settle in 2 of 2 Linux run(s) |
| cpu.chunk@sched | ns | 4330, 4330 | 4330 | 0.0% | 2916 | 2916 | 0.0% | 0.67 | 0.333 | too few runs to resolve (least p 0.333); the clock did not settle in 2 of 2 Linux run(s) |
| cpu.chunk@system | ns | 4330, 4330 | 4330 | 0.0% | 2916 | 2916 | 0.0% | 0.67 | 0.333 | too few runs to resolve (least p 0.333); the clock did not settle in 2 of 2 Linux run(s) |
| cpu.clock@boot | MHz | 1363, 1645 | 1504 | 18.8% | 4289 | 4289 | 0.0% | 2.85 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@crunch | MHz | 4033, 1361 | 2697 | 99.1% | 4289 | 4289 | 0.0% | 1.59 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@energy | MHz | 1362, 1361 | 1362 | 0.1% | 4239 | 4239 | 0.0% | 3.11 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@fair | MHz | 1643, 1359 | 1501 | 18.9% | 4265 | 4265 | 0.0% | 2.84 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@files | MHz | 4022, 4022 | 4022 | 0.0% | 4165 | 4165 | 0.0% | 1.04 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@identity | MHz | 1362, 1359 | 1360 | 0.2% | 4265 | 4265 | 0.0% | 3.13 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@ipc | MHz | 1362, 1362 | 1362 | 0.0% | 4239 | 4239 | 0.0% | 3.11 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@mem | MHz | 4033, 1360 | 2696 | 99.1% | 4265 | 4265 | 0.0% | 1.58 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@net | MHz | 1362, 1360 | 1361 | 0.1% | 4265 | 4265 | 0.0% | 3.13 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@nvme | MHz | 1361, 1359 | 1360 | 0.1% | 4289 | 4289 | 0.0% | 3.15 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@persist | MHz | 4033, 1649 | 2841 | 83.9% | 4289 | 4289 | 0.0% | 1.51 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@procs | MHz | 1361, 1360 | 1360 | 0.1% | 4265 | 4265 | 0.0% | 3.13 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@sched | MHz | 1361, 1362 | 1362 | 0.1% | 4289 | 4289 | 0.0% | 3.15 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@system | MHz | 1359, 1361 | 1360 | 0.1% | 4265 | 4265 | 0.0% | 3.14 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@tail | MHz | 1361, 1361 | 1361 | 0.0% | 4165 | 4165 | 0.0% | 3.06 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@time | MHz | 1647, 1361 | 1504 | 19.0% | 4265 | 4265 | 0.0% | 2.84 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@work | MHz | 1362, 1361 | 1362 | 0.1% | 4289 | 4289 | 0.0% | 3.15 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.all.deflate | ns | 151529440, 151083787 | 151306614 | 0.3% |  | - | - | - | - | the clock did not settle in 2 of 2 Linux run(s); ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.matmul |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.parse |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.sha256 | ns | 570121, 571238 | 570680 | 0.2% |  | - | - | - | - | the clock did not settle in 2 of 2 Linux run(s); ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.single.deflate | ns | 70380807, 67489376 | 68935092 | 4.2% | 63348687 | 63348687 | 0.0% | 0.92 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| crunch.single.matmul | ns | 1005725, 1011382 | 1008554 | 0.6% | 954330 | 954330 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| crunch.single.parse | ns |  | - | - | 40079453 | 40079453 | 0.0% | - | - | Linux 2 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit |
| crunch.single.sha256 | ns | 509149, 509707 | 509428 | 0.1% | 498711 | 498711 | 0.0% | 0.98 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| energy.idle_60s.package |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: energy_uj_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_energy`_reads_it; ToyOS 1 run(s) unsupported: no_counter_carries_the_package's_energy:_toyos_abi::counters::Counter_has_none |
| fair.apart.build | permille | 62, 62 | 62 | 0.0% | 63 | 63 | 0.0% | 1.02 | 0.333 | too few runs to resolve (least p 0.333) |
| fair.apart.helpers | permille | 412, 434 | 423 | 5.2% | 458 | 458 | 0.0% | 1.08 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.apart.threaded | permille | 524, 502 | 513 | 4.3% | 477 | 477 | 0.0% | 0.93 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.apart.total | chunks/s | 3288971, 3281446 | 3285208 | 0.2% | 5064802 | 5064802 | 0.0% | 1.54 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.session.build | permille | 31, 31 | 31 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.helpers | permille | 463, 468 | 466 | 1.1% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.threaded | permille | 504, 499 | 502 | 1.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.total | chunks/s | 3289055, 3239042 | 3264048 | 1.5% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.shared.build | permille | 33, 31 | 32 | 6.2% | 29 | 29 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.helpers | permille | 466, 459 | 462 | 1.5% | 489 | 489 | 0.0% | 1.06 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.threaded | permille | 501, 510 | 506 | 1.8% | 481 | 481 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.total | chunks/s | 3327702, 3291322 | 3309512 | 1.1% | 4090053 | 4090053 | 0.0% | 1.24 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.create_write_unlink | ns | 14109, 14248 | 14178 | 1.0% | 10520 | 10520 | 0.0% | 0.74 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| fs.mem.mkdir_rmdir | ns | 8101, 8102 | 8102 | 0.0% | 7745 | 7745 | 0.0% | 0.96 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| fs.mem.open_close | ns | 4330, 4330 | 4330 | 0.0% | 6012 | 6012 | 0.0% | 1.39 | 0.333 | too few runs to resolve (least p 0.333); the clock did not settle in 2 of 2 Linux run(s) |
| fs.mem.read_4k_at | ns | 2375, 2375 | 2375 | 0.0% | 1402 | 1402 | 0.0% | 0.59 | 0.333 | too few runs to resolve (least p 0.333); the clock did not settle in 2 of 2 Linux run(s) |
| fs.mem.readdir.1000 | ns | 279228, 278598 | 278913 | 0.2% | 1066707 | 1066707 | 0.0% | 3.82 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| fs.mem.rename | ns | 5866, 5797 | 5832 | 1.2% | 6112 | 6112 | 0.0% | 1.05 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| fs.mem.seq_read.1048576 | MB/s | 8600, 8513 | 8556 | 1.0% | 8128 | 8128 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| fs.mem.seq_read.4096 | MB/s | 5462, 5412 | 5437 | 0.9% | 5410 | 5410 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| fs.mem.seq_write.1048576 | MB/s | 1534, 1521 | 1528 | 0.9% | 3446 | 3446 | 0.0% | 2.26 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| fs.mem.seq_write.4096 | MB/s | 1301, 1284 | 1292 | 1.3% | 2832 | 2832 | 0.0% | 2.19 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| fs.mem.stat | ns | 2863, 2863 | 2863 | 0.0% | 2615 | 2615 | 0.0% | 0.91 | 0.333 | too few runs to resolve (least p 0.333); the clock did not settle in 2 of 2 Linux run(s) |
| fs.mem.tree.100 | ns | 1444473, 1459545 | 1452009 | 1.0% | 1374540 | 1374540 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| fs.mem.write_4k_at | ns | 2863, 2863 | 2863 | 0.0% | 1563 | 1563 | 0.0% | 0.55 | 0.333 | too few runs to resolve (least p 0.333); the clock did not settle in 2 of 2 Linux run(s) |
| fs.served.create_write_unlink | ns |  | - | - | 56699 | 56699 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.mkdir_rmdir | ns |  | - | - | 81697 | 81697 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.open_close | ns |  | - | - | 14238 | 14238 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.read_4k_at | ns |  | - | - | 16772 | 16772 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.readdir.1000 | ns |  | - | - | 689931 | 689931 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.rename | ns |  | - | - | 62180 | 62180 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_read.1048576 | MB/s |  | - | - | 6444 | 6444 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_read.4096 | MB/s |  | - | - | 450 | 450 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_write.1048576 | MB/s |  | - | - | 914 | 914 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_write.4096 | MB/s |  | - | - | 329 | 329 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.stat | ns |  | - | - | 10620 | 10620 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.tree.100 | ns |  | - | - | 12025811 | 12025811 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.write_4k_at | ns |  | - | - | 17484 | 17484 | 0.0% | - | - | Linux 2 run(s) absent |
| identity.cpuidle |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_kernel_names_its_idle_states_to_no_program |
| identity.nvme |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_NVMe_driver_keeps_its_controller's_identity_and_no_right_reads_it_from_another_program |
| identity.usb |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: usbd_keeps_its_devices_and_no_right_reads_them_from_another_program |
| ipc.connect_accept | ns | 12292, 12363 | 12328 | 0.6% | 2665 | 2665 | 0.0% | 0.22 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| ipc.reqrep.4096 | ns | 18997, 19487 | 19242 | 2.5% | 7976 | 7976 | 0.0% | 0.41 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| ipc.reqrep.65536 | ns | 52102, 49730 | 50916 | 4.7% | 37141 | 37141 | 0.0% | 0.73 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| ipc.reqrep.8 | ns | 13340, 13690 | 13515 | 2.6% | 6513 | 6513 | 0.0% | 0.48 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| ipc.reqrep_handle.8 | ns | 22420, 13480 | 17950 | 49.8% | 7765 | 7765 | 0.0% | 0.43 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.anon.map | ns/MiB | 329, 355 | 342 | 7.6% | 198 | 198 | 0.0% | 0.58 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.anon.total | ns/MiB | 507887, 533991 | 520939 | 5.0% | 127868 | 127868 | 0.0% | 0.25 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.touch | ns/MiB | 432990, 452881 | 442936 | 4.5% | 122385 | 122385 | 0.0% | 0.28 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.unmap | ns/MiB | 74294, 80660 | 77477 | 8.2% | 5248 | 5248 | 0.0% | 0.07 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.copy | MB/s | 8242, 7907 | 8074 | 4.1% | 8290 | 8290 | 0.0% | 1.03 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.bw.read | MB/s | 19859, 19609 | 19734 | 1.3% | 19318 | 19318 | 0.0% | 0.98 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.bw.write | MB/s | 9392, 9393 | 9392 | 0.0% | 9709 | 9709 | 0.0% | 1.03 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.first_touch.2m | ns/MiB | 132847, 133416 | 133132 | 0.4% | 128074 | 128074 | 0.0% | 0.96 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.first_touch.4k | ns/MiB | 430400, 445947 | 438174 | 3.5% | 128120 | 128120 | 0.0% | 0.29 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.malloc_churn.1048576.t1 | kops/s | 98, 92 | 95 | 6.3% | 234 | 234 | 0.0% | 2.46 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.malloc_churn.1048576.t16 | kops/s | 63, 64 | 64 | 1.6% | 98 | 98 | 0.0% | 1.54 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.malloc_churn.16.t1 | kops/s | 28232, 27934 | 28083 | 1.1% | 39479 | 39479 | 0.0% | 1.41 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.malloc_churn.16.t16 | kops/s | 1747, 1749 | 1748 | 0.1% | 2923 | 2923 | 0.0% | 1.67 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.malloc_churn.4096.t1 | kops/s | 21875, 22809 | 22342 | 4.2% | 37665 | 37665 | 0.0% | 1.69 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.malloc_churn.4096.t16 | kops/s | 1576, 1571 | 1574 | 0.3% | 2473 | 2473 | 0.0% | 1.57 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.map_touch_unmap.2m | ns/MiB | 136992, 137560 | 137276 | 0.4% | 134761 | 134761 | 0.0% | 0.98 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_touch_unmap.4k | ns/MiB | 500110, 515219 | 507664 | 3.0% | 135394 | 135394 | 0.0% | 0.27 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_unmap_4k | ns | 5657, 5588 | 5622 | 1.2% | 1904 | 1904 | 0.0% | 0.34 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.memcpy.1024 | MB/s | 41238, 41189 | 41214 | 0.1% | 44030 | 44030 | 0.0% | 1.07 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.memcpy.1048576 | MB/s | 11822, 11431 | 11626 | 3.4% | 11658 | 11658 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.memcpy.16384 | MB/s | 74968, 74385 | 74676 | 0.8% | 88115 | 88115 | 0.0% | 1.18 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.memcpy.16777216 | MB/s | 6142, 6003 | 6072 | 2.3% | 6229 | 6229 | 0.0% | 1.03 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.memcpy.256 | MB/s | 16224, 16212 | 16218 | 0.1% | 14571 | 14571 | 0.0% | 0.90 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.memcpy.262144 | MB/s | 38978, 37522 | 38250 | 3.8% | 26011 | 26011 | 0.0% | 0.68 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.memcpy.4096 | MB/s | 85448, 85423 | 85436 | 0.0% | 88992 | 88992 | 0.0% | 1.04 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.memcpy.4194304 | MB/s | 10774, 10631 | 10702 | 1.3% | 11008 | 11008 | 0.0% | 1.03 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.memcpy.64 | MB/s | 6530, 6527 | 6528 | 0.0% | 3962 | 3962 | 0.0% | 0.61 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.memcpy.65536 | MB/s | 66262, 66269 | 66266 | 0.0% | 66727 | 66727 | 0.0% | 1.01 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.memcpy.67108864 | MB/s | 6357, 6032 | 6194 | 5.2% | 6425 | 6425 | 0.0% | 1.04 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.mprotect.4k | ns | 3352, 3352 | 3352 | 0.0% | 831 | 831 | 0.0% | 0.25 | 0.333 | too few runs to resolve (least p 0.333); the clock did not settle in 2 of 2 Linux run(s) |
| mem.munmap_part.4k | ns | 4400, 4680 | 4540 | 6.2% | 1202 | 1202 | 0.0% | 0.26 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.munmap_touched_remote.4k | ns | 5657, 5588 | 5622 | 1.2% | 3376 | 3376 | 0.0% | 0.60 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.realloc_grow.1m_256m | ns | 213648, 206037 | 209842 | 3.6% | 39795 | 39795 | 0.0% | 0.19 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| mem.realloc_grow.last_128m_256m | ns | 53430, 53849 | 53640 | 0.8% | 7274 | 7274 | 0.0% | 0.14 | 0.667 | too few runs to resolve (least p 0.667) |
| net.tcp.connect_accept_close | ns | 75919, 77179 | 76549 | 1.6% |  | - | - | - | - | the clock did not settle in 2 of 2 Linux run(s); ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.reqrep.64 | ns | 41975, 35342 | 38658 | 17.2% |  | - | - | - | - | the clock did not settle in 2 of 2 Linux run(s); ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.1 | MB/s | 0, 0 | 0 | - |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.65536 | MB/s | 2219, 2223 | 2221 | 0.2% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.udp.reqrep.64 | ns | 59994, 31920 | 45957 | 61.1% |  | - | - | - | - | the clock did not settle in 2 of 2 Linux run(s); ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| nvme.read.1m.seq |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| nvme.read.4k.random |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| persist.append_4k_fsync | ns | 3277897, 3287883 | 3282890 | 0.3% | 9888279 | 9888279 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb; the clock did not settle in 2 of 2 Linux run(s) |
| persist.create_fsync_unlink | ns | 3294869, 3302410 | 3298640 | 0.2% | 5167746 | 5167746 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb; the clock did not settle in 2 of 2 Linux run(s) |
| persist.fsync_clean | ns | 69073, 68445 | 68759 | 0.9% | 16342 | 16342 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb; the clock did not settle in 2 of 2 Linux run(s) |
| persist.seq_read_cached | MB/s | 10981, 10866 | 10924 | 1.1% | 903 | 903 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb; the clock did not settle in 2 of 2 Linux run(s) |
| persist.seq_write_fsync | MB/s | 520, 457 | 488 | 12.9% | 31 | 31 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb; the clock did not settle in 2 of 2 Linux run(s) |
| persist.write_4k_fsync | ns | 3608319, 3453827 | 3531073 | 4.4% | 948449 | 948449 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb; the clock did not settle in 2 of 2 Linux run(s) |
| pingpong.futex.cross_core | ns | 13410, 13480 | 13445 | 0.5% | 4299 | 4299 | 0.0% | 0.32 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.futex.same_cpu | ns | 7263, 7264 | 7264 | 0.0% | 4318 | 4318 | 0.0% | 0.59 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.pipe.cross_core | ns | 14388, 18648 | 16518 | 25.8% | 5611 | 5611 | 0.0% | 0.34 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.pipe.same_cpu | ns | 9010, 9080 | 9045 | 0.8% | 5631 | 5631 | 0.0% | 0.62 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.1024 | MB/s | 1712, 1541 | 1626 | 10.5% | 1947 | 1947 | 0.0% | 1.20 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| pipe.throughput.16384 | MB/s | 3626, 3565 | 3596 | 1.7% | 6454 | 6454 | 0.0% | 1.80 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| pipe.throughput.256 | MB/s | 427, 423 | 425 | 0.9% | 200 | 200 | 0.0% | 0.47 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| pipe.throughput.4096 | MB/s | 4937, 5345 | 5141 | 7.9% | 2081 | 2081 | 0.0% | 0.40 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| pipe.throughput.64 | MB/s | 108, 106 | 107 | 1.9% | 123 | 123 | 0.0% | 1.15 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| pipe.throughput.65536 | MB/s | 881, 1579 | 1230 | 56.7% | 4956 | 4956 | 0.0% | 4.03 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| proc.posix_spawn_wait.std | ns | 912487, 905886 | 909186 | 0.7% | 522057 | 522057 | 0.0% | 0.57 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| proc.posix_spawn_wait.tiny | ns | 232085, 233352 | 232718 | 0.5% | 75135 | 75135 | 0.0% | 0.32 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| proc.spawn_wait.large | ns | 282999, 285457 | 284228 | 0.9% | 188413 | 188413 | 0.0% | 0.66 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| proc.spawn_wait.tiny | ns | 262816, 265831 | 264324 | 1.1% | 76668 | 76668 | 0.0% | 0.29 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| proc.spawn_wait_loop.100 | ns | 27622319, 18775787 | 23199053 | 38.1% | 6608535 | 6608535 | 0.0% | 0.28 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| process.spawn_wait | ns | 940562, 935385 | 937974 | 0.6% | 511176 | 511176 | 0.0% | 0.54 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| syscall.null | ps | 158266, 158423 | 158344 | 0.1% | 49336 | 49336 | 0.0% | 0.31 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| tail.diag.periodic.30s | ns |  | - | - | 5388 | 5388 | 0.0% | - | - | Linux 2 run(s) absent |
| tail.stolen.10s | ns | 39670, 39042 | 39356 | 1.6% | 21762 | 21762 | 0.0% | 0.55 | 0.667 | too few runs to resolve (least p 0.667) |
| tail.wake.periodic.60s | ns | 73761, 73611 | 73686 | 0.2% | 5376 | 5376 | 0.0% | 0.07 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join | ns | 77176, 79689 | 78432 | 3.2% | 40859 | 40859 | 0.0% | 0.52 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| thread.spawn_join.default | ns | 55873, 78715 | 67294 | 33.9% | 43043 | 43043 | 0.0% | 0.64 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| thread.spawn_join.stack64k | ns | 75220, 75921 | 75570 | 0.9% | 40408 | 40408 | 0.0% | 0.53 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| time.now | ps | 1212626, 1212805 | 1212716 | 0.0% | 9436 | 9436 | 0.0% | 0.01 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| time.sleep_late.100us | ns | 65735, 65736 | 65736 | 0.0% | 5013 | 5013 | 0.0% | 0.08 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.100us.slack1ns | ns | 19221, 19081 | 19151 | 0.7% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10ms | ns | 356178, 353992 | 355085 | 0.6% | 33309 | 33309 | 0.0% | 0.09 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.10ms.slack1ns | ns | 316229, 302993 | 309611 | 4.3% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10us | ns | 61099, 61100 | 61100 | 0.0% | 1111 | 1111 | 0.0% | 0.02 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.10us.slack1ns | ns | 18706, 18845 | 18776 | 0.7% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1ms | ns | 98127, 103789 | 100958 | 5.6% | 5509 | 5509 | 0.0% | 0.05 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.1ms.slack1ns | ns | 24303, 24307 | 24305 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1us | ns | 61229, 61020 | 61124 | 0.3% | 1314 | 1314 | 0.0% | 0.02 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.1us.slack1ns | ns | 18137, 18556 | 18346 | 2.3% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.timer_1ms.late | ns | 74199, 74135 | 74167 | 0.1% | 5562 | 5562 | 0.0% | 0.07 | 0.667 | too few runs to resolve (least p 0.667) |
| time.timer_1ms.late.slack1ns | ns | 24151, 24149 | 24150 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.yield | ps | 550742, 548474 | 549608 | 0.4% |  | - | - | - | - | the clock did not settle in 2 of 2 Linux run(s); ToyOS 1 run(s) unsupported: no_yield_syscall:_std's_yield_now_is_a_spin-loop_hint |
| wake.onto_busy | ns | 10337, 10127 | 10232 | 2.1% | 8115 | 8115 | 0.0% | 0.79 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle | ns | 73560, 73725 | 73642 | 0.2% | 33050 | 33050 | 0.0% | 0.45 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle.slack1ns | ns | 23665, 23567 | 23616 | 0.4% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.periodic.loaded | ns | 62644, 59105 | 60874 | 5.8% | 3803 | 3803 | 0.0% | 0.06 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.loaded.slack1ns | ns | 9169, 9200 | 9184 | 0.3% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.storm.call.w1 | ns | 10477, 9988 | 10232 | 4.8% | 3196 | 3196 | 0.0% | 0.31 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w16 | ns | 44490, 56293 | 50392 | 23.4% | 8366 | 8366 | 0.0% | 0.17 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w4 | ns | 14876, 14807 | 14842 | 0.5% | 4248 | 4248 | 0.0% | 0.29 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w64 | ns | 233412, 248992 | 241202 | 6.5% | 15870 | 15870 | 0.0% | 0.07 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w1 | ns | 87722, 85768 | 86745 | 2.3% | 34316 | 34316 | 0.0% | 0.40 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w16 | ns | 116357, 170278 | 143318 | 37.6% | 340647 | 340647 | 0.0% | 2.38 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w4 | ns | 89328, 87793 | 88560 | 1.7% | 315409 | 315409 | 0.0% | 3.56 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w64 | ns | 1638913, 1678754 | 1658834 | 2.4% | 413377 | 413377 | 0.0% | 0.25 | 0.667 | too few runs to resolve (least p 0.667) |
| work.build_shaped.j1 | ns | 1756252809, 1657288077 | 1706770443 | 5.8% | 834078198 | 834078198 | 0.0% | 0.49 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| work.build_shaped.j16 | ns | 127684388, 126149766 | 126917077 | 1.2% | 267138790 | 267138790 | 0.0% | 2.10 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |
| work.compress_inproc | ns | 445959546, 447706461 | 446833004 | 0.4% | 423179921 | 423179921 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 2 of 2 Linux run(s) |

Each p is its row's alone, uncorrected for the table's other rows.

