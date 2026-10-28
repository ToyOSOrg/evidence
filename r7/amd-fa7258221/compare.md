## AMD_Ryzen_7_4800U_with_Radeon_Graphics

Runs: Linux 2, ToyOS 1. lan.peer_link: none. internet.link: none.

Linux setup: kernel=6.8.0-147-generic, cpufreq_driver=acpi-cpufreq*16, governor=schedutil*16, epp=absent*16, min_khz=1400000*16, max_khz=1800000*16, boost=1, intel_no_turbo=absent, platform_profile=balanced, smt_active=1, fs.mem.served_by=tmpfs,_through_the_VFS, persist.served_by=ext4,_NVMe_disk,_model_SAMSUNG_MZVLB1T0HBLR-000L2.

Linux per run: clocksource=tsc,tsc.

ToyOS setup: fs.mem.served_by=the_kernel's_tmpfs,_through_syscalls, fs.served.served_by=the_DATA_file_server,_through_IPC, persist.served_by=boot_USB_stick_TOYOS-LOG_partition,_FAT32,_LOG_file_server_over_usbd_mass_storage.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.chunk@fair | ns | 2926, 2945 | 2936 | 0.6% | 2936 | 2936 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.667) |
| cpu.chunk@sched | ns | 2926, 2926 | 2926 | 0.0% | 2916 | 2916 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.chunk@system | ns | 2926, 2936 | 2931 | 0.3% | 2936 | 2936 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.333) |
| cpu.clock@boot | MHz | 1397, 1397 | 1397 | 0.0% | 4217 | 4217 | 0.0% | 3.02 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@crunch | MHz | 1397, 1397 | 1397 | 0.0% | 4291 | 4291 | 0.0% | 3.07 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@energy | MHz | 1397, 1397 | 1397 | 0.0% | 4291 | 4291 | 0.0% | 3.07 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@fair | MHz | 1397, 1696 | 1546 | 19.3% | 4266 | 4266 | 0.0% | 2.76 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@files | MHz | 1696, 4216 | 2956 | 85.3% | 4117 | 4117 | 0.0% | 1.39 | 1.000 | too few runs to resolve (least p 0.667) |
| cpu.clock@identity | MHz | 1397, 1397 | 1397 | 0.0% | 4291 | 4291 | 0.0% | 3.07 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@ipc | MHz | 4241, 1440 | 2840 | 98.6% | 4241 | 4241 | 0.0% | 1.49 | 1.000 | too few runs to resolve (least p 0.333) |
| cpu.clock@mem | MHz | 1397, 1397 | 1397 | 0.0% | 4241 | 4241 | 0.0% | 3.04 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@net | MHz | 1397, 1397 | 1397 | 0.0% | 4217 | 4217 | 0.0% | 3.02 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@nvme | MHz | 1397, 1397 | 1397 | 0.0% | 4291 | 4291 | 0.0% | 3.07 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@persist | MHz | 1397, 1397 | 1397 | 0.0% | 4291 | 4291 | 0.0% | 3.07 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@procs | MHz | 1397, 1397 | 1397 | 0.0% | 4241 | 4241 | 0.0% | 3.04 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@sched | MHz | 4291, 1397 | 2844 | 101.8% | 4291 | 4291 | 0.0% | 1.51 | 1.000 | too few runs to resolve (least p 0.333) |
| cpu.clock@system | MHz | 1397, 1397 | 1397 | 0.0% | 4291 | 4291 | 0.0% | 3.07 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@tail | MHz | 1397, 4291 | 2844 | 101.8% | 4166 | 4166 | 0.0% | 1.46 | 1.000 | too few runs to resolve (least p 0.667) |
| cpu.clock@time | MHz | 1397, 4241 | 2819 | 100.9% | 4216 | 4216 | 0.0% | 1.50 | 1.000 | too few runs to resolve (least p 0.667) |
| cpu.clock@work | MHz | 1397, 4291 | 2844 | 101.8% | 4267 | 4267 | 0.0% | 1.50 | 1.000 | too few runs to resolve (least p 0.667) |
| crunch.all.deflate | ns | 159128614, 151833112 | 155480863 | 4.7% |  | - | - | - | - | ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.matmul | ns | 3572623 | 3572623 | 0.0% |  | - | - | - | - | Linux 1 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.parse | ns | 3236771229 | 3236771229 | 0.0% |  | - | - | - | - | Linux 1 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.sha256 | ns | 772342, 546678 | 659510 | 34.2% |  | - | - | - | - | ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.single.deflate | ns | 66298259, 66844848 | 66571554 | 0.8% | 63763410 | 63763410 | 0.0% | 0.96 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.single.matmul | ns | 919582, 913719 | 916650 | 0.6% | 955705 | 955705 | 0.0% | 1.04 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.single.parse | ns |  | - | - | 40776209 | 40776209 | 0.0% | - | - | Linux 2 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit |
| crunch.single.sha256 | ns | 498795, 501794 | 500294 | 0.6% | 498823 | 498823 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.667) |
| energy.idle_60s.package |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: energy_uj_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_energy`_reads_it; ToyOS 1 run(s) unsupported: no_counter_carries_the_package's_energy:_toyos_abi::counters::Counter_has_none |
| fair.apart.build | permille | 62, 63 | 62 | 1.6% | 63 | 63 | 0.0% | 1.01 | 1.000 | too few runs to resolve (least p 0.333) |
| fair.apart.helpers | permille | 432, 397 | 414 | 8.4% | 455 | 455 | 0.0% | 1.10 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.apart.threaded | permille | 504, 539 | 522 | 6.7% | 480 | 480 | 0.0% | 0.92 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.apart.total | chunks/s | 5063574, 4871895 | 4967734 | 3.9% | 5059459 | 5059459 | 0.0% | 1.02 | 1.000 | too few runs to resolve (least p 0.667) |
| fair.session.build | permille | 31, 31 | 31 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.helpers | permille | 461, 468 | 464 | 1.5% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.threaded | permille | 507, 501 | 504 | 1.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.total | chunks/s | 4923063, 4729287 | 4826175 | 4.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.shared.build | permille | 33, 32 | 32 | 3.1% | 30 | 30 | 0.0% | 0.92 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.helpers | permille | 463, 463 | 463 | 0.0% | 490 | 490 | 0.0% | 1.06 | 0.333 | too few runs to resolve (least p 0.333) |
| fair.shared.threaded | permille | 501, 503 | 502 | 0.4% | 480 | 480 | 0.0% | 0.96 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.total | chunks/s | 5109653, 5065754 | 5087704 | 0.9% | 4055048 | 4055048 | 0.0% | 0.80 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.create_write_unlink | ns | 12734, 12805 | 12770 | 0.6% | 10510 | 10510 | 0.0% | 0.82 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.mkdir_rmdir | ns | 6632, 6652 | 6642 | 0.3% | 7665 | 7665 | 0.0% | 1.15 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.open_close | ns | 2926, 2956 | 2941 | 1.0% | 6061 | 6061 | 0.0% | 2.06 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.read_4k_at | ns | 1413, 1393 | 1403 | 1.4% | 1443 | 1443 | 0.0% | 1.03 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.readdir.1000 | ns | 271804, 274382 | 273093 | 0.9% | 1062330 | 1062330 | 0.0% | 3.89 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.rename | ns | 4508, 4509 | 4508 | 0.0% | 6162 | 6162 | 0.0% | 1.37 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_read.1048576 | MB/s | 8545, 8642 | 8594 | 1.1% | 8069 | 8069 | 0.0% | 0.94 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_read.4096 | MB/s | 5472, 5440 | 5456 | 0.6% | 5495 | 5495 | 0.0% | 1.01 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_write.1048576 | MB/s | 1535, 1523 | 1529 | 0.8% | 3463 | 3463 | 0.0% | 2.26 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_write.4096 | MB/s | 1288, 1285 | 1286 | 0.2% | 2858 | 2858 | 0.0% | 2.22 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.stat | ns | 1513, 1533 | 1523 | 1.3% | 2605 | 2605 | 0.0% | 1.71 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.tree.100 | ns | 1444488, 1456044 | 1450266 | 0.8% | 1381256 | 1381256 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.write_4k_at | ns | 1753, 1804 | 1778 | 2.9% | 1582 | 1582 | 0.0% | 0.89 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.served.create_write_unlink | ns |  | - | - | 67691 | 67691 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.mkdir_rmdir | ns |  | - | - | 81307 | 81307 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.open_close | ns |  | - | - | 17774 | 17774 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.read_4k_at | ns |  | - | - | 19889 | 19889 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.readdir.1000 | ns |  | - | - | 685282 | 685282 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.rename | ns |  | - | - | 64825 | 64825 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_read.1048576 | MB/s |  | - | - | 6456 | 6456 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_read.4096 | MB/s |  | - | - | 159 | 159 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_write.1048576 | MB/s |  | - | - | 452 | 452 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_write.4096 | MB/s |  | - | - | 238 | 238 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.stat | ns |  | - | - | 12464 | 12464 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.tree.100 | ns |  | - | - | 13110878 | 13110878 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.write_4k_at | ns |  | - | - | 20840 | 20840 | 0.0% | - | - | Linux 2 run(s) absent |
| identity.cpuidle |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_kernel_names_its_idle_states_to_no_program |
| identity.nvme |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_NVMe_driver_keeps_its_controller's_identity_and_no_right_reads_it_from_another_program |
| identity.usb |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: usbd_keeps_its_devices_and_no_right_reads_them_from_another_program |
| ipc.connect_accept | ns | 10931, 11042 | 10986 | 1.0% | 2765 | 2765 | 0.0% | 0.25 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.4096 | ns | 17844, 17193 | 17518 | 3.7% | 7965 | 7965 | 0.0% | 0.45 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.65536 | ns | 47900, 48885 | 48392 | 2.0% | 37282 | 37282 | 0.0% | 0.77 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.8 | ns | 14788, 14759 | 14774 | 0.2% | 6622 | 6622 | 0.0% | 0.45 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep_handle.8 | ns | 20970, 21031 | 21000 | 0.3% | 7816 | 7816 | 0.0% | 0.37 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.map | ns/MiB | 286, 318 | 302 | 10.6% | 189 | 189 | 0.0% | 0.63 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.total | ns/MiB | 512636, 515789 | 514212 | 0.6% | 132989 | 132989 | 0.0% | 0.26 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.touch | ns/MiB | 433703, 437241 | 435472 | 0.8% | 126155 | 126155 | 0.0% | 0.29 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.unmap | ns/MiB | 78565, 77896 | 78230 | 0.9% | 5221 | 5221 | 0.0% | 0.07 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.copy | MB/s | 8481, 8367 | 8424 | 1.4% | 8419 | 8419 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.667) |
| mem.bw.read | MB/s | 19861, 19763 | 19812 | 0.5% | 19534 | 19534 | 0.0% | 0.99 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.write | MB/s | 9567, 9489 | 9528 | 0.8% | 9701 | 9701 | 0.0% | 1.02 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.first_touch.2m | ns/MiB | 132069, 132244 | 132156 | 0.1% | 127915 | 127915 | 0.0% | 0.97 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.first_touch.4k | ns/MiB | 422470, 438636 | 430553 | 3.8% | 128051 | 128051 | 0.0% | 0.30 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.1048576.t1 | kops/s | 99, 93 | 96 | 6.2% | 205 | 205 | 0.0% | 2.14 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.1048576.t16 | kops/s | 66, 66 | 66 | 0.0% | 93 | 93 | 0.0% | 1.41 | 0.333 | too few runs to resolve (least p 0.333) |
| mem.malloc_churn.16.t1 | kops/s | 32118, 31901 | 32010 | 0.7% | 39196 | 39196 | 0.0% | 1.22 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.16.t16 | kops/s | 1761, 1749 | 1755 | 0.7% | 2951 | 2951 | 0.0% | 1.68 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.4096.t1 | kops/s | 22780, 22535 | 22658 | 1.1% | 37597 | 37597 | 0.0% | 1.66 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.4096.t16 | kops/s | 1577, 1567 | 1572 | 0.6% | 2434 | 2434 | 0.0% | 1.55 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_touch_unmap.2m | ns/MiB | 136334, 136622 | 136478 | 0.2% | 134299 | 134299 | 0.0% | 0.98 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_touch_unmap.4k | ns/MiB | 492433, 508201 | 500317 | 3.2% | 135034 | 135034 | 0.0% | 0.27 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_unmap_4k | ns | 3957, 3987 | 3972 | 0.8% | 1894 | 1894 | 0.0% | 0.48 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.1024 | MB/s | 41152, 41366 | 41259 | 0.5% | 43791 | 43791 | 0.0% | 1.06 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.1048576 | MB/s | 11525, 11437 | 11481 | 0.8% | 11447 | 11447 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.667) |
| mem.memcpy.16384 | MB/s | 74169, 74258 | 74214 | 0.1% | 87619 | 87619 | 0.0% | 1.18 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.16777216 | MB/s | 6222, 6257 | 6240 | 0.6% | 6235 | 6235 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.667) |
| mem.memcpy.256 | MB/s | 16206, 16250 | 16228 | 0.3% | 14490 | 14490 | 0.0% | 0.89 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.262144 | MB/s | 38845, 35822 | 37334 | 8.1% | 28070 | 28070 | 0.0% | 0.75 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.4096 | MB/s | 85587, 86078 | 85832 | 0.6% | 88503 | 88503 | 0.0% | 1.03 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.4194304 | MB/s | 10717, 10811 | 10764 | 0.9% | 11016 | 11016 | 0.0% | 1.02 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.64 | MB/s | 6521, 6527 | 6524 | 0.1% | 3942 | 3942 | 0.0% | 0.60 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.65536 | MB/s | 66121, 66483 | 66302 | 0.5% | 66326 | 66326 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.667) |
| mem.memcpy.67108864 | MB/s | 6234, 6180 | 6207 | 0.9% | 6416 | 6416 | 0.0% | 1.03 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.mprotect.4k | ns | 2014, 2114 | 2064 | 4.8% | 831 | 831 | 0.0% | 0.40 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.munmap_part.4k | ns | 2895, 3106 | 3000 | 7.0% | 1202 | 1202 | 0.0% | 0.40 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.munmap_touched_remote.4k | ns | 4308, 4589 | 4448 | 6.3% | 2716 | 2716 | 0.0% | 0.61 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.realloc_grow.1m_256m | ns | 201139, 197945 | 199542 | 1.6% | 48804 | 48804 | 0.0% | 0.24 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.realloc_grow.last_128m_256m | ns | 52680, 52089 | 52384 | 1.1% | 7294 | 7294 | 0.0% | 0.14 | 0.667 | too few runs to resolve (least p 0.667) |
| net.tcp.connect_accept_close | ns | 48852, 48704 | 48778 | 0.3% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.reqrep.64 | ns | 27182, 27303 | 27242 | 0.4% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.1 | MB/s | 0, 0 | 0 | - |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.65536 | MB/s | 3021, 2989 | 3005 | 1.1% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.udp.reqrep.64 | ns | 22593, 14097 | 18345 | 46.3% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| nvme.read.1m.seq |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| nvme.read.4k.random |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| persist.append_4k_fsync | ns | 3787858, 3821532 | 3804695 | 0.9% | 9599359 | 9599359 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb |
| persist.create_fsync_unlink | ns | 3219941, 3313506 | 3266724 | 2.9% | 5251166 | 5251166 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb |
| persist.fsync_clean | ns | 65054, 65453 | 65254 | 0.6% | 14618 | 14618 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb |
| persist.seq_read_cached | MB/s | 6760, 6689 | 6724 | 1.1% | 1083 | 1083 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb |
| persist.seq_write_fsync | MB/s | 509, 515 | 512 | 1.2% | 20 | 20 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb |
| persist.write_4k_fsync | ns | 3577089, 3111346 | 3344218 | 13.9% | 967067 | 967067 | 0.0% | - | - | the media differ: Linux nvme, ToyOS usb |
| pingpong.futex.cross_core | ns | 9699, 9809 | 9754 | 1.1% | 5660 | 5660 | 0.0% | 0.58 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.futex.same_cpu | ns | 6132, 6192 | 6162 | 1.0% | 4298 | 4298 | 0.0% | 0.70 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.pipe.cross_core | ns | 11141, 11291 | 11216 | 1.3% | 5741 | 5741 | 0.0% | 0.51 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.pipe.same_cpu | ns | 7575, 7644 | 7610 | 0.9% | 5661 | 5661 | 0.0% | 0.74 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.1024 | MB/s | 1701, 1641 | 1671 | 3.6% | 1814 | 1814 | 0.0% | 1.09 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.16384 | MB/s | 3681, 3737 | 3709 | 1.5% | 6420 | 6420 | 0.0% | 1.73 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.256 | MB/s | 426, 423 | 424 | 0.7% | 218 | 218 | 0.0% | 0.51 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.4096 | MB/s | 5750, 6289 | 6020 | 9.0% | 2089 | 2089 | 0.0% | 0.35 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.64 | MB/s | 114, 107 | 110 | 6.3% | 115 | 115 | 0.0% | 1.04 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.65536 | MB/s | 2874, 2374 | 2624 | 19.1% | 4949 | 4949 | 0.0% | 1.89 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.posix_spawn_wait.std | ns | 907914, 919239 | 913576 | 1.2% | 532317 | 532317 | 0.0% | 0.58 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.posix_spawn_wait.tiny | ns | 225405, 223067 | 224236 | 1.0% | 81447 | 81447 | 0.0% | 0.36 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait.large | ns | 272565, 116022 | 194294 | 80.6% | 204785 | 204785 | 0.0% | 1.05 | 1.000 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait.tiny | ns | 252998, 108709 | 180854 | 79.8% | 78051 | 78051 | 0.0% | 0.43 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait_loop.100 | ns | 31597646, 30704244 | 31150945 | 2.9% | 6385626 | 6385626 | 0.0% | 0.20 | 0.667 | too few runs to resolve (least p 0.667) |
| process.spawn_wait | ns | 919028, 321753 | 620390 | 96.3% | 530735 | 530735 | 0.0% | 0.86 | 1.000 | too few runs to resolve (least p 0.667) |
| syscall.null | ps | 157027, 157929 | 157478 | 0.6% | 49656 | 49656 | 0.0% | 0.32 | 0.667 | too few runs to resolve (least p 0.667) |
| tail.diag.periodic.30s | ns |  | - | - | 5444 | 5444 | 0.0% | - | - | Linux 2 run(s) absent |
| tail.stolen.10s | ns | 33142, 32360 | 32751 | 2.4% | 24487 | 24487 | 0.0% | 0.75 | 0.667 | too few runs to resolve (least p 0.667) |
| tail.wake.periodic.60s | ns | 57072, 60836 | 58954 | 6.4% | 5446 | 5446 | 0.0% | 0.09 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join | ns | 68099, 71755 | 69927 | 5.2% | 41079 | 41079 | 0.0% | 0.59 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join.default | ns | 67206, 65535 | 66370 | 2.5% | 43854 | 43854 | 0.0% | 0.66 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join.stack64k | ns | 61075, 65966 | 63520 | 7.7% | 41430 | 41430 | 0.0% | 0.65 | 0.667 | too few runs to resolve (least p 0.667) |
| time.now | ps | 22685, 22742 | 22714 | 0.3% | 9398 | 9398 | 0.0% | 0.41 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.100us | ns | 60323, 60453 | 60388 | 0.2% | 5013 | 5013 | 0.0% | 0.08 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.100us.slack1ns | ns | 10399, 10679 | 10539 | 2.7% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10ms | ns | 336054, 99920 | 217987 | 108.3% | 32535 | 32535 | 0.0% | 0.15 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.10ms.slack1ns | ns | 291147, 296847 | 293997 | 1.9% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10us | ns | 53560, 53610 | 53585 | 0.1% | 1201 | 1201 | 0.0% | 0.02 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.10us.slack1ns | ns | 10439, 10699 | 10569 | 2.5% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1ms | ns | 90038, 84669 | 87354 | 6.1% | 5511 | 5511 | 0.0% | 0.06 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.1ms.slack1ns | ns | 11640, 11696 | 11668 | 0.5% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1us | ns | 53603, 53643 | 53623 | 0.1% | 1465 | 1465 | 0.0% | 0.03 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.1us.slack1ns | ns | 8648, 9018 | 8833 | 4.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.timer_1ms.late | ns | 61617, 61651 | 61634 | 0.1% | 5574 | 5574 | 0.0% | 0.09 | 0.667 | too few runs to resolve (least p 0.667) |
| time.timer_1ms.late.slack1ns | ns | 11604, 11632 | 11618 | 0.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.yield | ps | 551204, 549596 | 550400 | 0.3% |  | - | - | - | - | ToyOS 1 run(s) unsupported: no_yield_syscall:_std's_yield_now_is_a_spin-loop_hint |
| wake.onto_busy | ns | 5029, 5190 | 5110 | 3.2% | 15079 | 15079 | 0.0% | 2.95 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle | ns | 60791, 60779 | 60785 | 0.0% | 32973 | 32973 | 0.0% | 0.54 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle.slack1ns | ns | 10839, 10790 | 10814 | 0.5% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.periodic.loaded | ns | 54193, 54221 | 54207 | 0.1% | 3674 | 3674 | 0.0% | 0.07 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.loaded.slack1ns | ns | 4238, 4351 | 4294 | 2.6% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.storm.call.w1 | ns | 8476, 8295 | 8386 | 2.2% | 3668 | 3668 | 0.0% | 0.44 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w16 | ns | 43182, 45345 | 44264 | 4.9% | 5751 | 5751 | 0.0% | 0.13 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w4 | ns | 12544, 12814 | 12679 | 2.1% | 5130 | 5130 | 0.0% | 0.40 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w64 | ns | 236287, 255950 | 246118 | 8.0% | 10961 | 10961 | 0.0% | 0.04 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w1 | ns | 77116, 74710 | 75913 | 3.2% | 35278 | 35278 | 0.0% | 0.46 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w16 | ns | 122311, 102602 | 112456 | 17.5% | 308336 | 308336 | 0.0% | 2.74 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w4 | ns | 77847, 78538 | 78192 | 0.9% | 108941 | 108941 | 0.0% | 1.39 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w64 | ns | 698701, 770133 | 734417 | 9.7% | 430381 | 430381 | 0.0% | 0.59 | 0.667 | too few runs to resolve (least p 0.667) |
| work.build_shaped.j1 | ns | 1771895742, 1712229641 | 1742062692 | 3.4% | 869047403 | 869047403 | 0.0% | 0.50 | 0.667 | too few runs to resolve (least p 0.667) |
| work.build_shaped.j16 | ns | 114441617, 119274859 | 116858238 | 4.1% | 269250876 | 269250876 | 0.0% | 2.30 | 0.667 | too few runs to resolve (least p 0.667) |
| work.compress_inproc | ns | 447860305, 446675551 | 447267928 | 0.3% | 426189279 | 426189279 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667) |

Each p is its row's alone, uncorrected for the table's other rows.

