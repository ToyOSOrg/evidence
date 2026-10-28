## AMD_Ryzen_7_4800U_with_Radeon_Graphics

Runs: Linux 2, ToyOS 1. lan.peer_link: none. internet.link: none.

Linux setup: kernel=6.8.0-147-generic, cpufreq_driver=acpi-cpufreq*16, governor=schedutil*16, epp=absent*16, min_khz=1400000*16, max_khz=1800000*16, boost=1, intel_no_turbo=absent, platform_profile=balanced, smt_active=1, fs.mem.served_by=tmpfs,_through_the_VFS, fs.disk.served_by=ext4,_NVMe_disk,_model_SAMSUNG_MZVLB1T0HBLR-000L2, persist.served_by=ext4,_NVMe_disk,_model_SAMSUNG_MZVLB1T0HBLR-000L2.

Linux per run: clocksource=hpet,tsc.

ToyOS setup: fs.mem.served_by=the_kernel's_tmpfs,_through_syscalls, fs.disk.served_by=DATA_volume,_bcachefs_crate's_format,_DATA_file_server_over_the_block_service, persist.served_by=DATA_volume,_bcachefs_crate's_format,_DATA_file_server_over_the_block_service.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.chunk@fair | ns | 4330, 2945 | 3638 | 38.1% | 2916 | 2916 | 0.0% | 0.80 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.chunk@sched | ns | 4330, 2945 | 3638 | 38.1% | 2916 | 2916 | 0.0% | 0.80 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.chunk@system | ns | 4330, 2926 | 3628 | 38.7% | 2916 | 2916 | 0.0% | 0.80 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@boot | MHz | 4282, 1397 | 2840 | 101.6% | 4241 | 4241 | 0.0% | 1.49 | 1.000 | too few runs to resolve (least p 0.667) |
| cpu.clock@crunch | MHz | 4282, 4291 | 4286 | 0.2% | 4291 | 4291 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.333) |
| cpu.clock@energy | MHz | 4282, 1397 | 2840 | 101.6% | 4291 | 4291 | 0.0% | 1.51 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@fair | MHz | 1373, 1397 | 1385 | 1.7% | 4267 | 4267 | 0.0% | 3.08 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@files | MHz | 1371, 1696 | 1534 | 21.2% | 4141 | 4141 | 0.0% | 2.70 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@identity | MHz | 4282, 4291 | 4286 | 0.2% | 4267 | 4267 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@ipc | MHz | 1656, 1397 | 1526 | 17.0% | 4241 | 4241 | 0.0% | 2.78 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@mem | MHz | 1370, 4248 | 2809 | 102.5% | 4241 | 4241 | 0.0% | 1.51 | 1.000 | too few runs to resolve (least p 0.667) |
| cpu.clock@net | MHz | 1383, 1397 | 1390 | 1.0% | 4242 | 4242 | 0.0% | 3.05 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@nvme | MHz | 1370, 1397 | 1384 | 2.0% | 4291 | 4291 | 0.0% | 3.10 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@persist | MHz | 1371, 4291 | 2831 | 103.1% | 4291 | 4291 | 0.0% | 1.52 | 1.000 | too few runs to resolve (least p 0.333) |
| cpu.clock@procs | MHz | 1372, 4241 | 2806 | 102.2% | 4242 | 4242 | 0.0% | 1.51 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@sched | MHz | 4282, 1397 | 2840 | 101.6% | 4291 | 4291 | 0.0% | 1.51 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@system | MHz | 1398, 1397 | 1398 | 0.1% | 4291 | 4291 | 0.0% | 3.07 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@tail | MHz | 1371, 4291 | 2831 | 103.1% | 4166 | 4166 | 0.0% | 1.47 | 1.000 | too few runs to resolve (least p 0.667) |
| cpu.clock@time | MHz | 1371, 1397 | 1384 | 1.9% | 4217 | 4217 | 0.0% | 3.05 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@work | MHz | 1372, 1442 | 1407 | 5.0% | 4267 | 4267 | 0.0% | 3.03 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.all.deflate | ns | 149430809, 116798033 | 133114421 | 24.5% |  | - | - | - | - | ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.matmul |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.parse |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.sha256 | ns | 559227 | 559227 | 0.0% |  | - | - | - | - | Linux 1 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.single.deflate | ns | 63784414, 63424328 | 63604371 | 0.6% | 64233708 | 64233708 | 0.0% | 1.01 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.single.matmul | ns | 920870, 913613 | 917242 | 0.8% | 956947 | 956947 | 0.0% | 1.04 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.single.parse | ns |  | - | - | 41434800 | 41434800 | 0.0% | - | - | Linux 2 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit |
| crunch.single.sha256 | ns | 506566, 501824 | 504195 | 0.9% | 501629 | 501629 | 0.0% | 0.99 | 0.667 | too few runs to resolve (least p 0.667) |
| energy.idle_60s.package |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: energy_uj_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_energy`_reads_it; ToyOS 1 run(s) unsupported: no_counter_carries_the_package's_energy:_toyos_abi::counters::Counter_has_none |
| fair.apart.build | permille | 63, 63 | 63 | 0.0% | 63 | 63 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 1.000) |
| fair.apart.helpers | permille | 409, 432 | 420 | 5.5% | 457 | 457 | 0.0% | 1.09 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.apart.threaded | permille | 527, 504 | 516 | 4.5% | 478 | 478 | 0.0% | 0.93 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.apart.total | chunks/s | 3292083, 4869374 | 4080728 | 38.7% | 5062751 | 5062751 | 0.0% | 1.24 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.session.build | permille | 31, 31 | 31 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.helpers | permille | 465, 467 | 466 | 0.4% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.threaded | permille | 500, 502 | 501 | 0.4% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.total | chunks/s | 3289044, 4734415 | 4011730 | 36.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.shared.build | permille | 30, 32 | 31 | 6.5% | 29 | 29 | 0.0% | 0.94 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.helpers | permille | 465, 465 | 465 | 0.0% | 489 | 489 | 0.0% | 1.05 | 0.333 | too few runs to resolve (least p 0.333) |
| fair.shared.threaded | permille | 503, 502 | 502 | 0.2% | 481 | 481 | 0.0% | 0.96 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.total | chunks/s | 3332563, 5071113 | 4201838 | 41.4% | 4053961 | 4053961 | 0.0% | 0.96 | 1.000 | too few runs to resolve (least p 0.667) |
| fs.disk.create_write_unlink | ns | 29124, 27273 | 28198 | 6.6% | 107277 | 107277 | 0.0% | 3.80 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.mkdir_rmdir | ns | 38622, 36811 | 37716 | 4.8% | 72861 | 72861 | 0.0% | 1.93 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.open_close | ns | 4400, 3056 | 3728 | 36.1% | 18686 | 18686 | 0.0% | 5.01 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.read_4k_at | ns | 2375, 1463 | 1919 | 47.5% | 16903 | 16903 | 0.0% | 8.81 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.readdir.1000 | ns | 438121, 433324 | 435722 | 1.1% | 677047 | 677047 | 0.0% | 1.55 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.rename | ns | 10895, 9308 | 10102 | 15.7% | 59154 | 59154 | 0.0% | 5.86 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_read.1048576 | MB/s | 11295, 11403 | 11349 | 1.0% | 6401 | 6401 | 0.0% | 0.56 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_read.4096 | MB/s | 4960, 5054 | 5007 | 1.9% | 158 | 158 | 0.0% | 0.03 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_write.1048576 | MB/s | 781, 865 | 823 | 10.2% | 457 | 457 | 0.0% | 0.56 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_write.4096 | MB/s | 759, 775 | 767 | 2.1% | 234 | 234 | 0.0% | 0.31 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.stat | ns | 2794, 1453 | 2124 | 63.2% | 10530 | 10530 | 0.0% | 4.96 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.tree.100 | ns | 3450277, 3426019 | 3438148 | 0.7% | 11933465 | 11933465 | 0.0% | 3.47 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.write_4k_at | ns | 2933, 2084 | 2508 | 33.8% | 17614 | 17614 | 0.0% | 7.02 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.create_write_unlink | ns | 14248, 12784 | 13516 | 10.8% | 10800 | 10800 | 0.0% | 0.80 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.mkdir_rmdir | ns | 8101, 6673 | 7387 | 19.3% | 7525 | 7525 | 0.0% | 1.02 | 1.000 | too few runs to resolve (least p 0.667) |
| fs.mem.open_close | ns | 4330, 3217 | 3774 | 29.5% | 6091 | 6091 | 0.0% | 1.61 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.read_4k_at | ns | 2375, 1393 | 1884 | 52.1% | 1413 | 1413 | 0.0% | 0.75 | 1.000 | too few runs to resolve (least p 0.667) |
| fs.mem.readdir.1000 | ns | 278181, 273793 | 275987 | 1.6% | 1049806 | 1049806 | 0.0% | 3.80 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.rename | ns | 5797, 4509 | 5153 | 25.0% | 6242 | 6242 | 0.0% | 1.21 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_read.1048576 | MB/s | 8482, 8527 | 8504 | 0.5% | 8041 | 8041 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_read.4096 | MB/s | 5426, 5458 | 5442 | 0.6% | 5310 | 5310 | 0.0% | 0.98 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_write.1048576 | MB/s | 1532, 1537 | 1534 | 0.3% | 3437 | 3437 | 0.0% | 2.24 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_write.4096 | MB/s | 1295, 1295 | 1295 | 0.0% | 2806 | 2806 | 0.0% | 2.17 | 0.333 | too few runs to resolve (least p 0.333) |
| fs.mem.stat | ns | 2863, 1503 | 2183 | 62.3% | 2596 | 2596 | 0.0% | 1.19 | 1.000 | too few runs to resolve (least p 0.667) |
| fs.mem.tree.100 | ns | 1454253, 1450235 | 1452244 | 0.3% | 1375705 | 1375705 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.write_4k_at | ns | 2863, 1773 | 2318 | 47.0% | 1492 | 1492 | 0.0% | 0.64 | 0.667 | too few runs to resolve (least p 0.667) |
| identity.cpuidle |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_kernel_names_its_idle_states_to_no_program |
| identity.nvme |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_NVMe_driver_keeps_its_controller's_identity_and_no_right_reads_it_from_another_program |
| identity.usb |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: usbd_keeps_its_devices_and_no_right_reads_them_from_another_program |
| ipc.connect_accept | ns | 12362, 10971 | 11666 | 11.9% | 2686 | 2686 | 0.0% | 0.23 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.4096 | ns | 19416, 17894 | 18655 | 8.2% | 7895 | 7895 | 0.0% | 0.42 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.65536 | ns | 47353, 48142 | 47748 | 1.7% | 37111 | 37111 | 0.0% | 0.78 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.8 | ns | 14946, 14798 | 14872 | 1.0% | 6543 | 6543 | 0.0% | 0.44 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep_handle.8 | ns | 26680, 21140 | 23910 | 23.2% | 7856 | 7856 | 0.0% | 0.33 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.map | ns/MiB | 340, 287 | 314 | 16.9% | 185 | 185 | 0.0% | 0.59 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.total | ns/MiB | 515969, 531789 | 523879 | 3.0% | 129437 | 129437 | 0.0% | 0.25 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.touch | ns/MiB | 437824, 450300 | 444062 | 2.8% | 123570 | 123570 | 0.0% | 0.28 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.unmap | ns/MiB | 76215, 81256 | 78736 | 6.4% | 5422 | 5422 | 0.0% | 0.07 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.copy | MB/s | 8557, 8372 | 8464 | 2.2% | 8244 | 8244 | 0.0% | 0.97 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.read | MB/s | 19584, 19792 | 19688 | 1.1% | 19655 | 19655 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.667) |
| mem.bw.write | MB/s | 9448, 9534 | 9491 | 0.9% | 9715 | 9715 | 0.0% | 1.02 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.first_touch.2m | ns/MiB | 133946, 132314 | 133130 | 1.2% | 128920 | 128920 | 0.0% | 0.97 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.first_touch.4k | ns/MiB | 440586, 435449 | 438018 | 1.2% | 128766 | 128766 | 0.0% | 0.29 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.1048576.t1 | kops/s | 98, 98 | 98 | 0.0% | 202 | 202 | 0.0% | 2.06 | 0.333 | too few runs to resolve (least p 0.333) |
| mem.malloc_churn.1048576.t16 | kops/s | 64, 67 | 66 | 4.6% | 100 | 100 | 0.0% | 1.53 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.16.t1 | kops/s | 31145, 31438 | 31292 | 0.9% | 39410 | 39410 | 0.0% | 1.26 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.16.t16 | kops/s | 1721, 1731 | 1726 | 0.6% | 2979 | 2979 | 0.0% | 1.73 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.4096.t1 | kops/s | 22345, 21891 | 22118 | 2.1% | 38283 | 38283 | 0.0% | 1.73 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.4096.t16 | kops/s | 1547, 1559 | 1553 | 0.8% | 2468 | 2468 | 0.0% | 1.59 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_touch_unmap.2m | ns/MiB | 138166, 136509 | 137338 | 1.2% | 136051 | 136051 | 0.0% | 0.99 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_touch_unmap.4k | ns/MiB | 510248, 505420 | 507834 | 1.0% | 135756 | 135756 | 0.0% | 0.27 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_unmap_4k | ns | 5378, 3957 | 4668 | 30.4% | 1883 | 1883 | 0.0% | 0.40 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.1024 | MB/s | 41101, 41202 | 41152 | 0.2% | 43816 | 43816 | 0.0% | 1.06 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.1048576 | MB/s | 11258, 11345 | 11302 | 0.8% | 11178 | 11178 | 0.0% | 0.99 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.16384 | MB/s | 73567, 74231 | 73899 | 0.9% | 75219 | 75219 | 0.0% | 1.02 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.16777216 | MB/s | 5903, 6310 | 6106 | 6.7% | 6116 | 6116 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.667) |
| mem.memcpy.256 | MB/s | 16185, 16214 | 16200 | 0.2% | 14501 | 14501 | 0.0% | 0.90 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.262144 | MB/s | 34192, 34780 | 34486 | 1.7% | 32270 | 32270 | 0.0% | 0.94 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.4096 | MB/s | 84844, 85848 | 85346 | 1.2% | 89029 | 89029 | 0.0% | 1.04 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.4194304 | MB/s | 10661, 10837 | 10749 | 1.6% | 10894 | 10894 | 0.0% | 1.01 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.64 | MB/s | 6419, 6520 | 6470 | 1.6% | 3943 | 3943 | 0.0% | 0.61 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.65536 | MB/s | 65875, 66248 | 66062 | 0.6% | 66699 | 66699 | 0.0% | 1.01 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.67108864 | MB/s | 6030, 6433 | 6232 | 6.5% | 6144 | 6144 | 0.0% | 0.99 | 1.000 | too few runs to resolve (least p 0.667) |
| mem.mprotect.4k | ns | 3352, 2134 | 2743 | 44.4% | 841 | 841 | 0.0% | 0.31 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.munmap_part.4k | ns | 4400, 3216 | 3808 | 31.1% | 1222 | 1222 | 0.0% | 0.32 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.munmap_touched_remote.4k | ns | 5657, 4549 | 5103 | 21.7% | 3847 | 3847 | 0.0% | 0.75 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.realloc_grow.1m_256m | ns | 210992, 206672 | 208832 | 2.1% | 49435 | 49435 | 0.0% | 0.24 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.realloc_grow.last_128m_256m | ns | 54407, 52670 | 53538 | 3.2% | 7294 | 7294 | 0.0% | 0.14 | 0.667 | too few runs to resolve (least p 0.667) |
| net.tcp.connect_accept_close | ns | 76757, 49104 | 62930 | 43.9% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.reqrep.64 | ns | 31988, 27182 | 29585 | 16.2% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.1 | MB/s | 0, 0 | 0 | - |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.65536 | MB/s | 2389, 2894 | 2642 | 19.1% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.udp.reqrep.64 | ns | 31988, 24356 | 28172 | 27.1% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| nvme.read.1m.seq |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| nvme.read.4k.random |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| persist.append_4k_fsync | ns | 3805913, 3757552 | 3781732 | 1.3% | 2786959 | 2786959 | 0.0% | 0.74 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.create_fsync_unlink | ns | 3269176, 3279028 | 3274102 | 0.3% | 3367049 | 3367049 | 0.0% | 1.03 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.fsync_clean | ns | 69703, 56649 | 63176 | 20.7% | 1233821 | 1233821 | 0.0% | 19.53 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.seq_read_cached | MB/s | 11219, 6628 | 8924 | 51.4% | 2946 | 2946 | 0.0% | 0.33 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.seq_write_fsync | MB/s | 506, 520 | 513 | 2.7% | 337 | 337 | 0.0% | 0.66 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.write_4k_fsync | ns | 3568240, 3012576 | 3290408 | 16.9% | 2906019 | 2906019 | 0.0% | 0.88 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.futex.cross_core | ns | 13409, 9818 | 11614 | 30.9% | 5841 | 5841 | 0.0% | 0.50 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.futex.same_cpu | ns | 7543, 6222 | 6882 | 19.2% | 4318 | 4318 | 0.0% | 0.63 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.pipe.cross_core | ns | 14388, 11342 | 12865 | 23.7% | 5791 | 5791 | 0.0% | 0.45 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.pipe.same_cpu | ns | 9079, 7674 | 8376 | 16.8% | 5721 | 5721 | 0.0% | 0.68 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.1024 | MB/s | 1554, 1670 | 1612 | 7.2% | 1944 | 1944 | 0.0% | 1.21 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.16384 | MB/s | 3638, 3729 | 3684 | 2.5% | 6494 | 6494 | 0.0% | 1.76 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.256 | MB/s | 427, 449 | 438 | 5.0% | 196 | 196 | 0.0% | 0.45 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.4096 | MB/s | 4977, 5925 | 5451 | 17.4% | 2075 | 2075 | 0.0% | 0.38 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.64 | MB/s | 108, 107 | 108 | 0.9% | 124 | 124 | 0.0% | 1.15 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.65536 | MB/s | 893, 2463 | 1678 | 93.6% | 5009 | 5009 | 0.0% | 2.99 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.posix_spawn_wait.std | ns | 753457, 889956 | 821706 | 16.6% | 513271 | 513271 | 0.0% | 0.62 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.posix_spawn_wait.tiny | ns | 99735, 221893 | 160814 | 76.0% | 74855 | 74855 | 0.0% | 0.47 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait.large | ns | 284257, 274363 | 279310 | 3.5% | 214925 | 214925 | 0.0% | 0.77 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait.tiny | ns | 116288, 110531 | 113410 | 5.1% | 76267 | 76267 | 0.0% | 0.67 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait_loop.100 | ns | 27112438, 28590871 | 27851654 | 5.3% | 6180650 | 6180650 | 0.0% | 0.22 | 0.667 | too few runs to resolve (least p 0.667) |
| process.spawn_wait | ns | 932461, 924000 | 928230 | 0.9% | 528410 | 528410 | 0.0% | 0.57 | 0.667 | too few runs to resolve (least p 0.667) |
| syscall.null | ps | 159002, 157611 | 158306 | 0.9% | 49017 | 49017 | 0.0% | 0.31 | 0.667 | too few runs to resolve (least p 0.667) |
| tail.diag.periodic.30s | ns |  | - | - | 5369 | 5369 | 0.0% | - | - | Linux 2 run(s) absent |
| tail.stolen.10s | ns | 38064, 32431 | 35248 | 16.0% | 21993 | 21993 | 0.0% | 0.62 | 0.667 | too few runs to resolve (least p 0.667) |
| tail.wake.periodic.60s | ns | 75311, 60852 | 68082 | 21.2% | 5371 | 5371 | 0.0% | 0.08 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join | ns | 57760, 72683 | 65222 | 22.9% | 40758 | 40758 | 0.0% | 0.62 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join.default | ns | 81017, 72829 | 76923 | 10.6% | 43754 | 43754 | 0.0% | 0.57 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join.stack64k | ns | 73264, 65936 | 69600 | 10.5% | 40017 | 40017 | 0.0% | 0.57 | 0.667 | too few runs to resolve (least p 0.667) |
| time.now | ps | 1212691, 22607 | 617649 | 192.7% | 9418 | 9418 | 0.0% | 0.02 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.100us | ns | 65875, 60405 | 63140 | 8.7% | 4933 | 4933 | 0.0% | 0.08 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.100us.slack1ns | ns | 11189, 10349 | 10769 | 7.8% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10ms | ns | 356476, 100596 | 228536 | 112.0% | 32936 | 32936 | 0.0% | 0.14 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.10ms.slack1ns | ns | 66423, 105658 | 86040 | 45.6% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10us | ns | 61099, 53611 | 57355 | 13.1% | 1072 | 1072 | 0.0% | 0.02 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.10us.slack1ns | ns | 11023, 3556 | 7290 | 102.4% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1ms | ns | 84299, 70732 | 77516 | 17.5% | 5410 | 5410 | 0.0% | 0.07 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.1ms.slack1ns | ns | 24515, 11657 | 18086 | 71.1% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1us | ns | 61020, 53634 | 57327 | 12.9% | 1444 | 1444 | 0.0% | 0.03 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.1us.slack1ns | ns | 12270, 4902 | 8586 | 85.8% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.timer_1ms.late | ns | 74166, 61591 | 67878 | 18.5% | 5430 | 5430 | 0.0% | 0.08 | 0.667 | too few runs to resolve (least p 0.667) |
| time.timer_1ms.late.slack1ns | ns | 24169, 11613 | 17891 | 70.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.yield | ps | 546143, 550195 | 548169 | 0.7% |  | - | - | - | - | ToyOS 1 run(s) unsupported: no_yield_syscall:_std's_yield_now_is_a_spin-loop_hint |
| wake.onto_busy | ns | 9918, 8626 | 9272 | 13.9% | 15330 | 15330 | 0.0% | 1.65 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle | ns | 73762, 60784 | 67273 | 19.3% | 32788 | 32788 | 0.0% | 0.49 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle.slack1ns | ns | 20323, 10876 | 15600 | 60.6% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.periodic.loaded | ns | 59278, 54218 | 56748 | 8.9% | 3751 | 3751 | 0.0% | 0.07 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.loaded.slack1ns | ns | 9308, 4338 | 6823 | 72.8% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.storm.call.w1 | ns | 9848, 8265 | 9056 | 17.5% | 3808 | 3808 | 0.0% | 0.42 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w16 | ns | 58178, 40014 | 49096 | 37.0% | 5461 | 5461 | 0.0% | 0.11 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w4 | ns | 14946, 12673 | 13810 | 16.5% | 4809 | 4809 | 0.0% | 0.35 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w64 | ns | 237952, 233326 | 235639 | 2.0% | 11472 | 11472 | 0.0% | 0.05 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w1 | ns | 85975, 78616 | 82296 | 8.9% | 35769 | 35769 | 0.0% | 0.43 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w16 | ns | 145341, 101028 | 123184 | 36.0% | 312974 | 312974 | 0.0% | 2.54 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w4 | ns | 87302, 78938 | 83120 | 10.1% | 308084 | 308084 | 0.0% | 3.71 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w64 | ns | 947827, 575885 | 761856 | 48.8% | 344986 | 344986 | 0.0% | 0.45 | 0.667 | too few runs to resolve (least p 0.667) |
| work.build_shaped.j1 | ns | 1575882101, 1189207276 | 1382544688 | 28.0% | 846467979 | 846467979 | 0.0% | 0.61 | 0.667 | too few runs to resolve (least p 0.667) |
| work.build_shaped.j16 | ns | 128344805, 143369034 | 135856920 | 11.1% | 271242170 | 271242170 | 0.0% | 2.00 | 0.667 | too few runs to resolve (least p 0.667) |
| work.compress_inproc | ns | 449006313, 449230411 | 449118362 | 0.0% | 431082895 | 431082895 | 0.0% | 0.96 | 0.667 | too few runs to resolve (least p 0.667) |

Each p is its row's alone, uncorrected for the table's other rows.

