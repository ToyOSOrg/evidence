## AMD_Ryzen_7_4800U_with_Radeon_Graphics

Runs: Linux 2, ToyOS 1. lan.peer_link: none. internet.link: none.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.chunk@fair | ns | 10895, 10895 | 10895 | 0.0% | 2936 | 2936 | 0.0% | 0.27 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.chunk@sched | ns | 4330, 4330 | 4330 | 0.0% | 2916 | 2916 | 0.0% | 0.67 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.chunk@system | ns | 10826, 10895 | 10860 | 0.6% | 2916 | 2916 | 0.0% | 0.27 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@boot | MHz | 1362, 1362 | 1362 | 0.0% | 4289 | 4289 | 0.0% | 3.15 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@crunch | MHz | 1362, 1362 | 1362 | 0.0% | 4289 | 4289 | 0.0% | 3.15 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@energy | MHz | 1361, 1362 | 1362 | 0.1% | 4265 | 4265 | 0.0% | 3.13 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@fair | MHz | 1361, 4022 | 2692 | 98.9% | 4289 | 4289 | 0.0% | 1.59 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@files | MHz | 1837, 4010 | 2924 | 74.3% | 4090 | 4090 | 0.0% | 1.40 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@identity | MHz | 1361, 1362 | 1362 | 0.1% | 4265 | 4265 | 0.0% | 3.13 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@ipc | MHz | 4033, 4021 | 4027 | 0.3% | 4239 | 4239 | 0.0% | 1.05 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@mem | MHz | 4033, 4021 | 4027 | 0.3% | 4239 | 4239 | 0.0% | 1.05 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@net | MHz | 4021, 4021 | 4021 | 0.0% | 4239 | 4239 | 0.0% | 1.05 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@nvme | MHz | 1491, 1361 | 1426 | 9.1% | 4289 | 4289 | 0.0% | 3.01 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@persist | MHz | 1363, 1361 | 1362 | 0.1% | 4289 | 4289 | 0.0% | 3.15 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@procs | MHz | 1361, 1363 | 1362 | 0.1% | 4239 | 4239 | 0.0% | 3.11 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@sched | MHz | 4033, 4033 | 4033 | 0.0% | 4289 | 4289 | 0.0% | 1.06 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@system | MHz | 1362, 1361 | 1362 | 0.1% | 4265 | 4265 | 0.0% | 3.13 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@tail | MHz | 1361, 4037 | 2699 | 99.1% | 4190 | 4190 | 0.0% | 1.55 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@time | MHz | 4033, 1361 | 2697 | 99.1% | 4214 | 4214 | 0.0% | 1.56 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@work | MHz | 4033, 4033 | 4033 | 0.0% | 4289 | 4289 | 0.0% | 1.06 | 0.333 | too few runs to resolve (least p 0.333) |
| crunch.all.deflate | ns | 139617732, 156113276 | 147865504 | 11.2% |  | - | - | - | - | ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.matmul |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.parse |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.sha256 | ns | 719275 | 719275 | 0.0% |  | - | - | - | - | Linux 1 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.single.deflate | ns | 63914417, 67698088 | 65806252 | 5.7% | 66635914 | 66635914 | 0.0% | 1.01 | 1.000 | too few runs to resolve (least p 0.667) |
| crunch.single.matmul | ns | 920523, 926560 | 923542 | 0.7% | 939076 | 939076 | 0.0% | 1.02 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.single.parse | ns | 73939309, 83478979 | 78709144 | 12.1% | 41837748 | 41837748 | 0.0% | 0.53 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.single.sha256 | ns | 506567, 509216 | 507892 | 0.5% | 498655 | 498655 | 0.0% | 0.98 | 0.667 | too few runs to resolve (least p 0.667) |
| energy.idle_60s.package |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: energy_uj_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_energy`_reads_it; ToyOS 1 run(s) unsupported: no_counter_carries_the_package's_energy:_toyos_abi::counters::Counter_has_none |
| fair.flat#1 | permille | 30, 31 | 30 | 3.3% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.flat#2 | permille | 505, 503 | 504 | 0.4% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.flat#3 | permille | 463, 464 | 464 | 0.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.flat.total | chunks/s | 3330275, 3291876 | 3311076 | 1.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.onejob#1 | permille |  | - | - | 29 | 29 | 0.0% | - | - | Linux 2 run(s) absent |
| fair.onejob#2 | permille |  | - | - | 477 | 477 | 0.0% | - | - | Linux 2 run(s) absent |
| fair.onejob#3 | permille |  | - | - | 492 | 492 | 0.0% | - | - | Linux 2 run(s) absent |
| fair.onejob.total | chunks/s |  | - | - | 4093439 | 4093439 | 0.0% | - | - | Linux 2 run(s) absent |
| fair.perjob#1 | permille |  | - | - | 63 | 63 | 0.0% | - | - | Linux 2 run(s) absent |
| fair.perjob#2 | permille |  | - | - | 479 | 479 | 0.0% | - | - | Linux 2 run(s) absent |
| fair.perjob#3 | permille |  | - | - | 456 | 456 | 0.0% | - | - | Linux 2 run(s) absent |
| fair.perjob.total | chunks/s |  | - | - | 4648187 | 4648187 | 0.0% | - | - | Linux 2 run(s) absent |
| fair.scope#1 | permille | 62, 62 | 62 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.scope#2 | permille | 511, 525 | 518 | 2.7% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.scope#3 | permille | 425, 411 | 418 | 3.3% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.scope.total | chunks/s | 3283000, 3230572 | 3256786 | 1.6% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session#1 | permille | 32, 31 | 32 | 3.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session#2 | permille | 502, 503 | 502 | 0.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session#3 | permille | 465, 462 | 464 | 0.6% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.total | chunks/s | 3295478, 3285060 | 3290269 | 0.3% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.served.create_write_unlink | ns |  | - | - | 55958 | 55958 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.mkdir_rmdir | ns |  | - | - | 69985 | 69985 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.open_close | ns |  | - | - | 14178 | 14178 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.read_4k_at | ns |  | - | - | 16822 | 16822 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.readdir.1000 | ns |  | - | - | 701918 | 701918 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.rename | ns |  | - | - | 58002 | 58002 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_read.1048576 | MB/s |  | - | - | 6080 | 6080 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_read.4096 | MB/s |  | - | - | 465 | 465 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_write.1048576 | MB/s |  | - | - | 916 | 916 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_write.4096 | MB/s |  | - | - | 308 | 308 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.stat | ns |  | - | - | 10450 | 10450 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.tree.100 | ns |  | - | - | 11398353 | 11398353 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.write_4k_at | ns |  | - | - | 17233 | 17233 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.shm.create_write_unlink | ns | 14178, 14319 | 14248 | 1.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.mkdir_rmdir | ns | 8102, 8103 | 8102 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.open_close | ns | 4680, 4330 | 4505 | 7.8% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.read_4k_at | ns | 2375, 2375 | 2375 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.readdir.1000 | ns | 269731, 273453 | 271592 | 1.4% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.rename | ns | 6076, 6146 | 6111 | 1.1% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.seq_read.1048576 | MB/s | 8448, 8364 | 8406 | 1.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.seq_read.4096 | MB/s | 5341, 5353 | 5347 | 0.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.seq_write.1048576 | MB/s | 1543, 1542 | 1542 | 0.1% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.seq_write.4096 | MB/s | 1288, 1287 | 1288 | 0.1% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.stat | ns | 2863, 2864 | 2864 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.tree.100 | ns | 1395660, 1404773 | 1400216 | 0.7% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.write_4k_at | ns | 2863, 2864 | 2864 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.tmp.create_write_unlink | ns |  | - | - | 10630 | 10630 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.mkdir_rmdir | ns |  | - | - | 7725 | 7725 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.open_close | ns |  | - | - | 6072 | 6072 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.read_4k_at | ns |  | - | - | 1323 | 1323 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.readdir.1000 | ns |  | - | - | 1066352 | 1066352 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.rename | ns |  | - | - | 6082 | 6082 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.seq_read.1048576 | MB/s |  | - | - | 7868 | 7868 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.seq_read.4096 | MB/s |  | - | - | 5320 | 5320 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.seq_write.1048576 | MB/s |  | - | - | 3104 | 3104 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.seq_write.4096 | MB/s |  | - | - | 2648 | 2648 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.stat | ns |  | - | - | 2615 | 2615 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.tree.100 | ns |  | - | - | 1353327 | 1353327 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.write_4k_at | ns |  | - | - | 1523 | 1523 | 0.0% | - | - | Linux 2 run(s) absent |
| identity.cpuidle |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_kernel_names_its_idle_states_to_no_program |
| identity.nvme |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_NVMe_driver_keeps_its_controller's_identity_and_no_right_reads_it_from_another_program |
| identity.usb |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: usbd_keeps_its_devices_and_no_right_reads_them_from_another_program |
| ipc.connect_accept | ns | 12431, 12502 | 12466 | 0.6% | 2495 | 2495 | 0.0% | 0.20 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.4096 | ns | 33385, 27170 | 30278 | 20.5% | 7815 | 7815 | 0.0% | 0.26 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.65536 | ns | 35689, 35832 | 35760 | 0.4% | 37793 | 37793 | 0.0% | 1.06 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.8 | ns | 15155, 20465 | 17810 | 29.8% | 6443 | 6443 | 0.0% | 0.36 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep_handle.8 | ns | 20044, 19278 | 19661 | 3.9% | 7705 | 7705 | 0.0% | 0.39 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.map | ns/MiB | 351, 342 | 346 | 2.6% | 167 | 167 | 0.0% | 0.48 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.total | ns/MiB | 557730, 515491 | 536610 | 7.9% | 130191 | 130191 | 0.0% | 0.24 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.touch | ns/MiB | 466893, 440980 | 453936 | 5.7% | 124064 | 124064 | 0.0% | 0.27 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.unmap | ns/MiB | 90347, 74127 | 82237 | 19.7% | 5656 | 5656 | 0.0% | 0.07 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.copy | MB/s | 8537, 8522 | 8530 | 0.2% | 8254 | 8254 | 0.0% | 0.97 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.read | MB/s | 19763, 19626 | 19694 | 0.7% | 19738 | 19738 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 0.667) |
| mem.bw.write | MB/s | 9397, 9491 | 9444 | 1.0% | 9748 | 9748 | 0.0% | 1.03 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.first_touch.2m | ns/page | 261952, 261642 | 261797 | 0.1% | 337 | 337 | 0.0% | 0.00 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.first_touch.4k | ns/page | 1770, 1746 | 1758 | 1.4% | 504 | 504 | 0.0% | 0.29 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.1048576.t1 | kops/s | 91, 87 | 89 | 4.5% | 37769 | 37769 | 0.0% | 424.37 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.1048576.t16 | kops/s | 62, 64 | 63 | 3.2% | 2750 | 2750 | 0.0% | 43.65 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.16.t1 | kops/s | 28537, 28251 | 28394 | 1.0% | 40435 | 40435 | 0.0% | 1.42 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.16.t16 | kops/s | 1772, 1764 | 1768 | 0.5% | 2985 | 2985 | 0.0% | 1.69 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.4096.t1 | kops/s | 19942, 20012 | 19977 | 0.4% | 38726 | 38726 | 0.0% | 1.94 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.4096.t16 | kops/s | 1588, 1579 | 1584 | 0.6% | 2512 | 2512 | 0.0% | 1.59 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_touch_unmap.2m | ns/page | 271322, 270900 | 271111 | 0.2% | 2753 | 2753 | 0.0% | 0.01 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_touch_unmap.4k | ns/page | 2066, 2041 | 2054 | 1.2% | 533 | 533 | 0.0% | 0.26 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_unmap_4k | ns | 5587, 5377 | 5482 | 3.8% | 1843 | 1843 | 0.0% | 0.34 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.1024 | MB/s | 40851, 40449 | 40650 | 1.0% | 44020 | 44020 | 0.0% | 1.08 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.1048576 | MB/s | 11541, 11402 | 11472 | 1.2% | 11133 | 11133 | 0.0% | 0.97 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.16384 | MB/s | 73058, 72134 | 72596 | 1.3% | 115758 | 115758 | 0.0% | 1.59 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.16777216 | MB/s | 6131, 6168 | 6150 | 0.6% | 6236 | 6236 | 0.0% | 1.01 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.256 | MB/s | 16124, 15939 | 16032 | 1.2% | 14531 | 14531 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.262144 | MB/s | 33771, 35186 | 34478 | 4.1% | 22376 | 22376 | 0.0% | 0.65 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.4096 | MB/s | 84859, 83929 | 84394 | 1.1% | 88992 | 88992 | 0.0% | 1.05 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.4194304 | MB/s | 10786, 10603 | 10694 | 1.7% | 10948 | 10948 | 0.0% | 1.02 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.64 | MB/s | 6491, 6418 | 6454 | 1.1% | 3952 | 3952 | 0.0% | 0.61 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.65536 | MB/s | 65351, 64710 | 65030 | 1.0% | 66719 | 66719 | 0.0% | 1.03 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.67108864 | MB/s | 6205, 6115 | 6160 | 1.5% | 6373 | 6373 | 0.0% | 1.03 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.mprotect.4k | ns | 3352, 3353 | 3352 | 0.0% | 821 | 821 | 0.0% | 0.24 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.munmap_part.4k | ns | 4400, 4679 | 4540 | 6.1% | 1162 | 1162 | 0.0% | 0.26 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.munmap_touched_remote.4k | ns | 5377, 6007 | 5692 | 11.1% | 2665 | 2665 | 0.0% | 0.47 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.realloc_grow.1m_256m | ns | 9917, 8939 | 9428 | 10.4% | 122938284 | 122938284 | 0.0% | 13039.70 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.realloc_grow.last_128m_256m | ns | 1397, 978 | 1188 | 35.3% | 66037306 | 66037306 | 0.0% | 55610.36 | 0.667 | too few runs to resolve (least p 0.667) |
| net.tcp.connect_accept_close | ns | 76757, 77111 | 76934 | 0.5% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.reqrep.64 | ns | 31988, 42606 | 37297 | 28.5% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.1 | MB/s | 0, 0 | 0 | - |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.65536 | MB/s | 2210, 2163 | 2186 | 2.1% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.udp.reqrep.64 | ns | 31918, 53781 | 42850 | 51.0% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| nvme.read.1m.seq |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| nvme.read.4k.random |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| persist.append_4k_fsync | ns | 3880930, 3299461 | 3590196 | 16.2% | 10712106 | 10712106 | 0.0% | 2.98 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.create_fsync_unlink | ns | 3414453, 3388211 | 3401332 | 0.8% | 6329190 | 6329190 | 0.0% | 1.86 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.fsync_clean | ns | 67328, 68221 | 67774 | 1.3% | 1687493 | 1687493 | 0.0% | 24.90 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.seq_read_cached | MB/s | 10555, 10786 | 10670 | 2.2% | 933 | 933 | 0.0% | 0.09 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.seq_write_fsync | MB/s | 485, 527 | 506 | 8.3% | 19 | 19 | 0.0% | 0.04 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.write_4k_fsync | ns | 3543382, 3060165 | 3301774 | 14.6% | 1879004 | 1879004 | 0.0% | 0.57 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.futex.cross_core | ns | 13410, 13479 | 13444 | 0.5% | 4228 | 4228 | 0.0% | 0.31 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.futex.same_cpu | ns | 7263, 7263 | 7263 | 0.0% | 4238 | 4238 | 0.0% | 0.58 | 0.333 | too few runs to resolve (least p 0.333) |
| pingpong.pipe.cross_core | ns | 18578, 18648 | 18613 | 0.4% | 5641 | 5641 | 0.0% | 0.30 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.pipe.same_cpu | ns | 9010, 9079 | 9044 | 0.8% | 5501 | 5501 | 0.0% | 0.61 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.1024 | MB/s | 1551, 1560 | 1556 | 0.6% | 1859 | 1859 | 0.0% | 1.20 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.16384 | MB/s | 3625, 3686 | 3656 | 1.7% | 6372 | 6372 | 0.0% | 1.74 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.256 | MB/s | 423, 418 | 420 | 1.2% | 229 | 229 | 0.0% | 0.54 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.4096 | MB/s | 4943, 4869 | 4906 | 1.5% | 2122 | 2122 | 0.0% | 0.43 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.64 | MB/s | 108, 104 | 106 | 3.8% | 123 | 123 | 0.0% | 1.16 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.65536 | MB/s | 1049, 875 | 962 | 18.1% | 4845 | 4845 | 0.0% | 5.04 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.posix_spawn_wait.std | ns | 356405, 913156 | 634780 | 87.7% | 507452 | 507452 | 0.0% | 0.80 | 1.000 | too few runs to resolve (least p 0.667) |
| proc.posix_spawn_wait.tiny | ns | 100503, 273514 | 187008 | 92.5% | 78782 | 78782 | 0.0% | 0.42 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait.large | ns | 182218, 178455 | 180336 | 2.1% | 200277 | 200277 | 0.0% | 1.11 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait.tiny | ns | 311078, 272398 | 291738 | 13.3% | 70476 | 70476 | 0.0% | 0.24 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait_loop.100 | ns | 12368593, 31506277 | 21937435 | 87.2% | 6107331 | 6107331 | 0.0% | 0.28 | 0.667 | too few runs to resolve (least p 0.667) |
| process.spawn_wait | ns | 333986, 917016 | 625501 | 93.2% | 499526 | 499526 | 0.0% | 0.80 | 1.000 | too few runs to resolve (least p 0.667) |
| syscall.null | ps | 157890, 158821 | 158356 | 0.6% | 49447 | 49447 | 0.0% | 0.31 | 0.667 | too few runs to resolve (least p 0.667) |
| tail.diag.periodic.30s | ns |  | - | - | 5246 | 5246 | 0.0% | - | - | Linux 2 run(s) absent |
| tail.stolen.10s | ns | 40369, 39449 | 39909 | 2.3% | 26521 | 26521 | 0.0% | 0.66 | 0.667 | too few runs to resolve (least p 0.667) |
| tail.wake.periodic.60s | ns | 73723, 73410 | 73566 | 0.4% | 5237 | 5237 | 0.0% | 0.07 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join | ns | 78573, 63904 | 71238 | 20.6% | 40428 | 40428 | 0.0% | 0.57 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join.default | ns | 57690, 84093 | 70892 | 37.2% | 41491 | 41491 | 0.0% | 0.59 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join.stack64k | ns | 52032, 52524 | 52278 | 0.9% | 40518 | 40518 | 0.0% | 0.78 | 0.667 | too few runs to resolve (least p 0.667) |
| time.now | ps | 1212895, 1213132 | 1213014 | 0.0% | 9340 | 9340 | 0.0% | 0.01 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.100us | ns | 65596, 65804 | 65700 | 0.3% | 4793 | 4793 | 0.0% | 0.07 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.100us.slack1ns | ns | 11258, 19219 | 15238 | 52.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10ms | ns | 359089, 347967 | 353528 | 3.1% | 32301 | 32301 | 0.0% | 0.09 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.10ms.slack1ns | ns | 312434, 62987 | 187710 | 132.9% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10us | ns | 61099, 61099 | 61099 | 0.0% | 1142 | 1142 | 0.0% | 0.02 | 0.333 | too few runs to resolve (least p 0.333) |
| time.sleep_late.10us.slack1ns | ns | 11092, 19124 | 15108 | 53.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1ms | ns | 104627, 81920 | 93274 | 24.3% | 32206 | 32206 | 0.0% | 0.35 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.1ms.slack1ns | ns | 24517, 24297 | 24407 | 0.9% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1us | ns | 61020, 61019 | 61020 | 0.0% | 1304 | 1304 | 0.0% | 0.02 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.1us.slack1ns | ns | 13807, 13807 | 13807 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.timer_1ms.late | ns | 83699, 74182 | 78940 | 12.1% | 32310 | 32310 | 0.0% | 0.41 | 0.667 | too few runs to resolve (least p 0.667) |
| time.timer_1ms.late.slack1ns | ns | 25661, 24158 | 24910 | 6.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.yield | ps | 547052, 555398 | 551225 | 1.5% | 15881 | 15881 | 0.0% | 0.03 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.onto_busy | ns | 10197, 9987 | 10092 | 2.1% | 14368 | 14368 | 0.0% | 1.42 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle | ns | 70298, 61837 | 66068 | 12.8% | 32201 | 32201 | 0.0% | 0.49 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle.slack1ns | ns | 23760, 23720 | 23740 | 0.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.periodic.loaded | ns | 57708, 59185 | 58446 | 2.5% | 3785 | 3785 | 0.0% | 0.06 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.loaded.slack1ns | ns | 9243, 9233 | 9238 | 0.1% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.storm.call.w1 | ns | 6774, 9220 | 7997 | 30.6% | 3647 | 3647 | 0.0% | 0.46 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w16 | ns | 61532, 58248 | 59890 | 5.5% | 8807 | 8807 | 0.0% | 0.15 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w4 | ns | 14108, 14318 | 14213 | 1.5% | 5030 | 5030 | 0.0% | 0.35 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w64 | ns | 235997, 253314 | 244656 | 7.1% | 15911 | 15911 | 0.0% | 0.07 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w1 | ns | 50636, 85486 | 68061 | 51.2% | 34737 | 34737 | 0.0% | 0.51 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w16 | ns | 150860, 123689 | 137274 | 19.8% | 343324 | 343324 | 0.0% | 2.50 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w4 | ns | 86744, 88279 | 87512 | 1.8% | 104863 | 104863 | 0.0% | 1.20 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w64 | ns | 344393, 367644 | 356018 | 6.5% | 376989 | 376989 | 0.0% | 1.06 | 0.667 | too few runs to resolve (least p 0.667) |
| work.build_shaped.j1 | ns | 1521699099, 1696184693 | 1608941896 | 10.8% | 865779530 | 865779530 | 0.0% | 0.54 | 0.667 | too few runs to resolve (least p 0.667) |
| work.build_shaped.j16 | ns | 120198977, 128060858 | 124129918 | 6.3% | 280260062 | 280260062 | 0.0% | 2.26 | 0.667 | too few runs to resolve (least p 0.667) |
| work.compress_inproc | ns | 450013448, 452835263 | 451424356 | 0.6% | 427511394 | 427511394 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667) |

Each p is its row's alone, uncorrected for the table's other rows.

