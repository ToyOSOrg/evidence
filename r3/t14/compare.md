## 11th_Gen_Intel(R)_Core(TM)_i5-1135G7_@_2.40GHz

Runs: Linux 2, ToyOS 1. lan.peer_link: none. internet.link: none.

Linux setup: kernel=6.8.0-147-generic, cpufreq_driver=intel_pstate*8, governor=powersave*8, epp=balance_performance*8, min_khz=400000*8, max_khz=4200000*8, boost=absent, intel_no_turbo=0, platform_profile=balanced, smt_active=1, fs.mem.served_by=tmpfs,_through_the_VFS, fs.disk.served_by=ext4,_NVMe_disk,_model_SK_hynix_BC501_HFM256GDJTNG-8310A, persist.served_by=ext4,_NVMe_disk,_model_SK_hynix_BC501_HFM256GDJTNG-8310A.

Linux per run: clocksource=tsc,tsc.

ToyOS setup: fs.mem.served_by=the_kernel's_tmpfs,_through_syscalls, fs.disk.served_by=DATA_volume,_bcachefs_crate's_format,_DATA_file_server_over_the_block_service, persist.served_by=DATA_volume,_bcachefs_crate's_format,_DATA_file_server_over_the_block_service.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.chunk@fair | ns | 2995, 2994 | 2994 | 0.0% | 2993 | 2993 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.chunk@sched | ns | 2995, 2994 | 2994 | 0.0% | 2993 | 2993 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.chunk@system | ns | 2995, 2994 | 2994 | 0.0% | 2993 | 2993 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@boot | MHz | 4189, 4190 | 4190 | 0.0% | 3790 | 3790 | 0.0% | 0.90 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@crunch | MHz | 4190, 4190 | 4190 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@energy | MHz | 4189, 4190 | 4190 | 0.0% | 3790 | 3790 | 0.0% | 0.90 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@fair | MHz | 4189, 4190 | 4190 | 0.0% | 3790 | 3790 | 0.0% | 0.90 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@files | MHz | 1415, 1414 | 1414 | 0.1% | 4188 | 4188 | 0.0% | 2.96 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@identity | MHz | 4189, 4190 | 4190 | 0.0% | 3790 | 3790 | 0.0% | 0.90 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@ipc | MHz | 4190, 4190 | 4190 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@mem | MHz | 4190, 4190 | 4190 | 0.0% | 4189 | 4189 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@net | MHz | 4190, 4190 | 4190 | 0.0% | 4189 | 4189 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@nvme | MHz | 1380, 1397 | 1388 | 1.2% | 4188 | 4188 | 0.0% | 3.02 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@persist | MHz | 4190, 4190 | 4190 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@procs | MHz | 4190, 4190 | 4190 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@sched | MHz | 4189, 4190 | 4190 | 0.0% | 4189 | 4189 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.333) |
| cpu.clock@system | MHz | 4189, 4190 | 4190 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@tail | MHz | 4189, 4190 | 4190 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@time | MHz | 4190, 4189 | 4190 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@work | MHz | 4190, 4190 | 4190 | 0.0% | 4188 | 4188 | 0.0% | 1.00 | 0.333 | too few runs to resolve (least p 0.333) |
| crunch.all.deflate | ns | 184741361, 186530271 | 185635816 | 1.0% |  | - | - | - | - | the clock did not settle in 2 of 2 Linux run(s); ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.matmul | ns | 5190607, 5092755 | 5141681 | 1.9% |  | - | - | - | - | the clock did not settle in 2 of 2 Linux run(s); ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.parse | ns | 2783197821, 2761412995 | 2772305408 | 0.8% |  | - | - | - | - | ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.sha256 | ns | 1921764, 1920833 | 1921298 | 0.0% |  | - | - | - | - | the clock did not settle in 2 of 2 Linux run(s); ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.single.deflate | ns | 55258034, 55302637 | 55280336 | 0.1% | 54400223 | 54400223 | 0.0% | 0.98 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.single.matmul | ns | 1008387, 1007794 | 1008090 | 0.1% | 1065503 | 1065503 | 0.0% | 1.06 | 0.667 | too few runs to resolve (least p 0.667); the clock fell in 2 of 2 Linux run(s) |
| crunch.single.parse | ns | 68489076, 68369520 | 68429298 | 0.2% | 34902387 | 34902387 | 0.0% | 0.51 | 0.667 | too few runs to resolve (least p 0.667); settled clocks apart: Linux 3692 MHz, ToyOS 4188 MHz |
| crunch.single.sha256 | ns | 555976, 555445 | 555710 | 0.1% | 567191 | 567191 | 0.0% | 1.02 | 0.667 | too few runs to resolve (least p 0.667) |
| energy.idle_60s.package |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: energy_uj_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_energy`_reads_it; ToyOS 1 run(s) unsupported: no_counter_carries_the_package's_energy:_toyos_abi::counters::Counter_has_none |
| fair.apart.build | permille | 124, 125 | 124 | 0.8% | 125 | 125 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.333) |
| fair.apart.helpers | permille | 415, 420 | 418 | 1.2% | 431 | 431 | 0.0% | 1.03 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.apart.threaded | permille | 459, 454 | 456 | 1.1% | 442 | 442 | 0.0% | 0.97 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.apart.total | chunks/s | 1649835, 1624552 | 1637194 | 1.5% | 2365486 | 2365486 | 0.0% | 1.44 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.session.build | permille | 58, 64 | 61 | 9.8% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.helpers | permille | 444, 443 | 444 | 0.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.threaded | permille | 495, 493 | 494 | 0.4% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.total | chunks/s | 1677370, 1669700 | 1673535 | 0.5% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.shared.build | permille | 64, 59 | 62 | 8.1% | 54 | 54 | 0.0% | 0.88 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.helpers | permille | 451, 454 | 452 | 0.7% | 473 | 473 | 0.0% | 1.05 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.threaded | permille | 486, 485 | 486 | 0.2% | 469 | 469 | 0.0% | 0.97 | 0.667 | too few runs to resolve (least p 0.667) |
| fair.shared.total | chunks/s | 2391798, 2398029 | 2394914 | 0.3% | 2367081 | 2367081 | 0.0% | 0.99 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.create_write_unlink | ns | 11177, 11247 | 11212 | 0.6% | 162203 | 162203 | 0.0% | 14.47 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.mkdir_rmdir | ns | 15252, 14677 | 14964 | 3.8% | 115664 | 115664 | 0.0% | 7.73 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.open_close | ns | 1196, 1198 | 1197 | 0.2% | 26306 | 26306 | 0.0% | 21.98 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.read_4k_at | ns | 742, 760 | 751 | 2.4% | 18033 | 18033 | 0.0% | 24.01 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.readdir.1000 | ns | 276474, 273628 | 275051 | 1.0% | 907065 | 907065 | 0.0% | 3.30 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.rename | ns | 3633, 3581 | 3607 | 1.4% | 100656 | 100656 | 0.0% | 27.91 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_read.1048576 | MB/s | 9391, 9185 | 9288 | 2.2% | 7029 | 7029 | 0.0% | 0.76 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_read.4096 | MB/s | 7760, 7758 | 7759 | 0.0% | 435 | 435 | 0.0% | 0.06 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_write.1048576 | MB/s | 343, 345 | 344 | 0.6% | 349 | 349 | 0.0% | 1.01 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.seq_write.4096 | MB/s | 622, 654 | 638 | 5.0% | 145 | 145 | 0.0% | 0.23 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.stat | ns | 585, 578 | 582 | 1.2% | 11244 | 11244 | 0.0% | 19.34 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.tree.100 | ns | 1366972, 1357773 | 1362372 | 0.7% | 17119366 | 17119366 | 0.0% | 12.57 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.disk.write_4k_at | ns | 726, 695 | 710 | 4.4% | 18137 | 18137 | 0.0% | 25.53 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.create_write_unlink | ns | 4691, 4681 | 4686 | 0.2% | 13080 | 13080 | 0.0% | 2.79 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.mkdir_rmdir | ns | 2182, 2165 | 2174 | 0.8% | 8852 | 8852 | 0.0% | 4.07 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.open_close | ns | 1112, 1117 | 1114 | 0.4% | 7361 | 7361 | 0.0% | 6.60 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.read_4k_at | ns | 705, 704 | 704 | 0.1% | 1202 | 1202 | 0.0% | 1.71 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.readdir.1000 | ns | 176288, 178710 | 177499 | 1.4% | 1139472 | 1139472 | 0.0% | 6.42 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.rename | ns | 1629, 1595 | 1612 | 2.1% | 7834 | 7834 | 0.0% | 4.86 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_read.1048576 | MB/s | 9683, 9591 | 9637 | 1.0% | 7148 | 7148 | 0.0% | 0.74 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_read.4096 | MB/s | 8305, 8305 | 8305 | 0.0% | 4608 | 4608 | 0.0% | 0.55 | 0.333 | too few runs to resolve (least p 0.333) |
| fs.mem.seq_write.1048576 | MB/s | 4555, 4563 | 4559 | 0.2% | 4593 | 4593 | 0.0% | 1.01 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.seq_write.4096 | MB/s | 3621, 3615 | 3618 | 0.2% | 3143 | 3143 | 0.0% | 0.87 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.stat | ns | 584, 578 | 581 | 1.0% | 3077 | 3077 | 0.0% | 5.30 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.tree.100 | ns | 552619, 550508 | 551564 | 0.4% | 1502327 | 1502327 | 0.0% | 2.72 | 0.667 | too few runs to resolve (least p 0.667) |
| fs.mem.write_4k_at | ns | 605, 593 | 599 | 2.0% | 1273 | 1273 | 0.0% | 2.13 | 0.667 | too few runs to resolve (least p 0.667) |
| identity.cpuidle |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_kernel_names_its_idle_states_to_no_program |
| identity.nvme |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_NVMe_driver_keeps_its_controller's_identity_and_no_right_reads_it_from_another_program |
| identity.usb |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: usbd_keeps_its_devices_and_no_right_reads_them_from_another_program |
| ipc.connect_accept | ns | 3818, 3817 | 3818 | 0.0% | 3176 | 3176 | 0.0% | 0.83 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.4096 | ns | 7209, 7271 | 7240 | 0.9% | 8693 | 8693 | 0.0% | 1.20 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.65536 | ns | 18960, 18982 | 18971 | 0.1% | 36084 | 36084 | 0.0% | 1.90 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.8 | ns | 3539, 3757 | 3648 | 6.0% | 7175 | 7175 | 0.0% | 1.97 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep_handle.8 | ns | 7373, 7292 | 7332 | 1.1% | 8764 | 8764 | 0.0% | 1.20 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.map | ns/MiB | 82, 95 | 88 | 14.7% | 107 | 107 | 0.0% | 1.21 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.total | ns/MiB | 256827, 257537 | 257182 | 0.3% | 128315 | 128315 | 0.0% | 0.50 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.touch | ns/MiB | 235095, 235074 | 235084 | 0.0% | 122481 | 122481 | 0.0% | 0.52 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.unmap | ns/MiB | 21858, 22211 | 22034 | 1.6% | 3688 | 3688 | 0.0% | 0.17 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.copy | MB/s | 6950, 6890 | 6920 | 0.9% | 6667 | 6667 | 0.0% | 0.96 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.read | MB/s | 17168, 19497 | 18332 | 12.7% | 17564 | 17564 | 0.0% | 0.96 | 1.000 | too few runs to resolve (least p 0.667) |
| mem.bw.write | MB/s | 9379, 9263 | 9321 | 1.2% | 9493 | 9493 | 0.0% | 1.02 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.first_touch.2m | ns/MiB | 99976, 99114 | 99545 | 0.9% | 128372 | 128372 | 0.0% | 1.29 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.first_touch.4k | ns/MiB | 237270, 236883 | 237076 | 0.2% | 127890 | 127890 | 0.0% | 0.54 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.1048576.t1 | kops/s | 177, 186 | 182 | 5.0% | 207 | 207 | 0.0% | 1.14 | 0.667 | too few runs to resolve (least p 0.667); settled clocks apart: Linux 3392 MHz, ToyOS 4188 MHz |
| mem.malloc_churn.1048576.t8 | kops/s | 87, 89 | 88 | 2.3% | 108 | 108 | 0.0% | 1.23 | 0.667 | too few runs to resolve (least p 0.667); settled clocks apart: Linux 3142 MHz, ToyOS 4188 MHz |
| mem.malloc_churn.16.t1 | kops/s | 32232, 32241 | 32236 | 0.0% | 36578 | 36578 | 0.0% | 1.13 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.16.t8 | kops/s | 3146, 3137 | 3142 | 0.3% | 4831 | 4831 | 0.0% | 1.54 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.4096.t1 | kops/s | 21689, 21344 | 21516 | 1.6% | 31437 | 31437 | 0.0% | 1.46 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.4096.t8 | kops/s | 865, 858 | 862 | 0.8% | 3074 | 3074 | 0.0% | 3.57 | 0.667 | too few runs to resolve (least p 0.667); settled clocks apart: Linux 3092 MHz, ToyOS 4188 MHz |
| mem.map_touch_unmap.2m | ns/MiB | 101693, 100775 | 101234 | 0.9% | 134467 | 134467 | 0.0% | 1.33 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_touch_unmap.4k | ns/MiB | 258325, 258085 | 258205 | 0.1% | 132928 | 132928 | 0.0% | 0.51 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_unmap_4k | ns | 1605, 1595 | 1600 | 0.6% | 2545 | 2545 | 0.0% | 1.59 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.1024 | MB/s | 78372, 78245 | 78308 | 0.2% | 82491 | 82491 | 0.0% | 1.05 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.1048576 | MB/s | 26821, 25539 | 26180 | 4.9% | 26925 | 26925 | 0.0% | 1.03 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.16384 | MB/s | 203390, 198386 | 200888 | 2.5% | 185478 | 185478 | 0.0% | 0.92 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.16777216 | MB/s | 10700, 10654 | 10677 | 0.4% | 10374 | 10374 | 0.0% | 0.97 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.256 | MB/s | 24579, 24862 | 24720 | 1.1% | 28428 | 28428 | 0.0% | 1.15 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.262144 | MB/s | 55665, 55653 | 55659 | 0.0% | 55732 | 55732 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.4096 | MB/s | 160382, 151435 | 155908 | 5.7% | 164979 | 164979 | 0.0% | 1.06 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.4194304 | MB/s | 22007, 21653 | 21830 | 1.6% | 21292 | 21292 | 0.0% | 0.98 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.64 | MB/s | 6168, 6161 | 6164 | 0.1% | 18495 | 18495 | 0.0% | 3.00 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.65536 | MB/s | 55265, 55219 | 55242 | 0.1% | 55412 | 55412 | 0.0% | 1.00 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.67108864 | MB/s | 9658, 9614 | 9636 | 0.5% | 9235 | 9235 | 0.0% | 0.96 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.mprotect.4k | ns | 1018, 1020 | 1019 | 0.2% | 950 | 950 | 0.0% | 0.93 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.munmap_part.4k | ns | 1261, 1272 | 1266 | 0.9% | 1565 | 1565 | 0.0% | 1.24 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.munmap_touched_remote.4k | ns | 2284, 2468 | 2376 | 7.7% | 3006 | 3006 | 0.0% | 1.27 | 0.667 | too few runs to resolve (least p 0.667); the clock did not settle in 1 of 2 Linux run(s) |
| mem.realloc_grow.1m_256m | ns | 106119, 117792 | 111956 | 10.4% | 47127 | 47127 | 0.0% | 0.42 | 0.667 | too few runs to resolve (least p 0.667); settled clocks apart: Linux 3392 MHz, ToyOS 4188 MHz |
| mem.realloc_grow.last_128m_256m | ns | 24829, 25751 | 25290 | 3.6% | 12300 | 12300 | 0.0% | 0.49 | 0.667 | too few runs to resolve (least p 0.667) |
| net.tcp.connect_accept_close | ns | 20825, 21297 | 21061 | 2.2% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.reqrep.64 | ns | 8813, 8901 | 8857 | 1.0% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.1 | MB/s | 1, 1 | 1 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.65536 | MB/s | 6608, 6588 | 6598 | 0.3% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.udp.reqrep.64 | ns | 7247, 7447 | 7347 | 2.7% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| nvme.read.1m.seq |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| nvme.read.4k.random |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| persist.append_4k_fsync | ns | 796449, 1040764 | 918606 | 26.6% | 6182133 | 6182133 | 0.0% | 6.73 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.create_fsync_unlink | ns | 858059, 926696 | 892378 | 7.7% | 6868612 | 6868612 | 0.0% | 7.70 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.fsync_clean | ns | 22971, 23002 | 22986 | 0.1% | 3019602 | 3019602 | 0.0% | 131.36 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.seq_read_cached | MB/s | 10496, 10537 | 10516 | 0.4% | 6753 | 6753 | 0.0% | 0.64 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.seq_write_fsync | MB/s | 598, 587 | 592 | 1.9% | 162 | 162 | 0.0% | 0.27 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.write_4k_fsync | ns | 1009786, 811313 | 910550 | 21.8% | 6125947 | 6125947 | 0.0% | 6.73 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.futex.cross_core | ns | 3336, 3336 | 3336 | 0.0% | 4646 | 4646 | 0.0% | 1.39 | 0.333 | too few runs to resolve (least p 0.333) |
| pingpong.futex.same_cpu | ns | 2305, 2311 | 2308 | 0.3% | 4546 | 4546 | 0.0% | 1.97 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.pipe.cross_core | ns | 3706, 3751 | 3728 | 1.2% | 6890 | 6890 | 0.0% | 1.85 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.pipe.same_cpu | ns | 3138, 2848 | 2993 | 9.7% | 6219 | 6219 | 0.0% | 2.08 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.1024 | MB/s | 1913, 1753 | 1833 | 8.7% | 1223 | 1223 | 0.0% | 0.67 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.16384 | MB/s | 3875, 3876 | 3876 | 0.0% | 4703 | 4703 | 0.0% | 1.21 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.256 | MB/s | 650, 643 | 646 | 1.1% | 329 | 329 | 0.0% | 0.51 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.4096 | MB/s | 4206, 4136 | 4171 | 1.7% | 2941 | 2941 | 0.0% | 0.71 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.64 | MB/s | 166, 167 | 166 | 0.6% | 81 | 81 | 0.0% | 0.49 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.65536 | MB/s | 4247, 4205 | 4226 | 1.0% | 7642 | 7642 | 0.0% | 1.81 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.posix_spawn_wait.std | ns | 169429, 167835 | 168632 | 0.9% | 446728 | 446728 | 0.0% | 2.65 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.posix_spawn_wait.tiny | ns | 43965, 43879 | 43922 | 0.2% | 56606 | 56606 | 0.0% | 1.29 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait.large | ns | 53553, 54920 | 54236 | 2.5% | 186693 | 186693 | 0.0% | 3.44 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait.tiny | ns | 52576, 51550 | 52063 | 2.0% | 52292 | 52292 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait_loop.100 | ns | 5371903, 5385557 | 5378730 | 0.3% | 5533108 | 5533108 | 0.0% | 1.03 | 0.667 | too few runs to resolve (least p 0.667) |
| process.spawn_wait | ns | 176257, 175062 | 175660 | 0.7% | 460955 | 460955 | 0.0% | 2.62 | 0.667 | too few runs to resolve (least p 0.667) |
| syscall.null | ps | 91916, 92070 | 91993 | 0.2% | 68345 | 68345 | 0.0% | 0.74 | 0.667 | too few runs to resolve (least p 0.667) |
| tail.diag.periodic.30s | ns |  | - | - | 17776 | 17776 | 0.0% | - | - | Linux 2 run(s) absent |
| tail.stolen.10s | ns | 32831, 30979 | 31905 | 5.8% | 20907 | 20907 | 0.0% | 0.66 | 0.667 | too few runs to resolve (least p 0.667) |
| tail.wake.periodic.60s | ns | 67617, 69395 | 68506 | 2.6% | 17783 | 17783 | 0.0% | 0.26 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join | ns | 24590, 24987 | 24788 | 1.6% | 27754 | 27754 | 0.0% | 1.12 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join.default | ns | 24905, 25102 | 25004 | 0.8% | 29119 | 29119 | 0.0% | 1.16 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join.stack64k | ns | 23234, 23502 | 23368 | 1.1% | 28593 | 28593 | 0.0% | 1.22 | 0.667 | too few runs to resolve (least p 0.667) |
| time.now | ps | 14282, 14295 | 14288 | 0.1% | 19816 | 19816 | 0.0% | 1.39 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.100us | ns | 51844, 51861 | 51852 | 0.0% | 4256 | 4256 | 0.0% | 0.08 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.100us.slack1ns | ns | 1814, 1833 | 1824 | 1.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10ms | ns | 216500, 216901 | 216700 | 0.2% | 26899 | 26899 | 0.0% | 0.12 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.10ms.slack1ns | ns | 163785, 165079 | 164432 | 0.8% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10us | ns | 51817, 51825 | 51821 | 0.0% | 1153 | 1153 | 0.0% | 0.02 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.10us.slack1ns | ns | 1804, 1830 | 1817 | 1.4% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1ms | ns | 71555, 72384 | 71970 | 1.2% | 12625 | 12625 | 0.0% | 0.18 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.1ms.slack1ns | ns | 20464, 20376 | 20420 | 0.4% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1us | ns | 51820, 51826 | 51823 | 0.0% | 1385 | 1385 | 0.0% | 0.03 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.1us.slack1ns | ns | 4032, 3944 | 3988 | 2.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.timer_1ms.late | ns | 70351, 70302 | 70326 | 0.1% | 12732 | 12732 | 0.0% | 0.18 | 0.667 | too few runs to resolve (least p 0.667) |
| time.timer_1ms.late.slack1ns | ns | 20432, 76447 | 48440 | 115.6% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.yield | ps | 190753, 190521 | 190637 | 0.1% |  | - | - | - | - | ToyOS 1 run(s) unsupported: no_yield_syscall:_std's_yield_now_is_a_spin-loop_hint |
| wake.onto_busy | ns | 2194, 2190 | 2192 | 0.2% | 3883 | 3883 | 0.0% | 1.77 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle | ns | 73900, 69354 | 71627 | 6.3% | 17736 | 17736 | 0.0% | 0.25 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle.slack1ns | ns | 17653, 8841 | 13247 | 66.5% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.periodic.loaded | ns | 52377, 52343 | 52360 | 0.1% | 3019 | 3019 | 0.0% | 0.06 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.loaded.slack1ns | ns | 2373, 2345 | 2359 | 1.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.storm.call.w1 | ns | 4101, 3873 | 3987 | 5.7% | 1266 | 1266 | 0.0% | 0.32 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w16 | ns | 57312, 57791 | 57552 | 0.8% | 13627 | 13627 | 0.0% | 0.24 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w4 | ns | 11195, 11579 | 11387 | 3.4% | 9618 | 9618 | 0.0% | 0.84 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w64 | ns | 218861, 256336 | 237598 | 15.8% | 22720 | 22720 | 0.0% | 0.10 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w1 | ns | 30058, 94696 | 62377 | 103.6% | 17876 | 17876 | 0.0% | 0.29 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w16 | ns | 177480, 664848 | 421164 | 115.7% | 158443 | 158443 | 0.0% | 0.38 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w4 | ns | 114419, 119683 | 117051 | 4.5% | 125787 | 125787 | 0.0% | 1.07 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w64 | ns | 295885, 293678 | 294782 | 0.7% | 297391 | 297391 | 0.0% | 1.01 | 0.667 | too few runs to resolve (least p 0.667) |
| work.build_shaped.j1 | ns | 993789564, 1046049322 | 1019919443 | 5.1% | 678882301 | 678882301 | 0.0% | 0.67 | 0.667 | too few runs to resolve (least p 0.667) |
| work.build_shaped.j8 | ns | 98575741, 99674474 | 99125108 | 1.1% | 168449584 | 168449584 | 0.0% | 1.70 | 0.667 | too few runs to resolve (least p 0.667) |
| work.compress_inproc | ns | 366825090, 366078805 | 366451948 | 0.2% | 357202303 | 357202303 | 0.0% | 0.97 | 0.667 | too few runs to resolve (least p 0.667) |

Each p is its row's alone, uncorrected for the table's other rows.

