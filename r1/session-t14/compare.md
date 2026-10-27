## 11th_Gen_Intel(R)_Core(TM)_i5-1135G7_@_2.40GHz

Runs: Linux 2, ToyOS 1. lan.peer_link: none. internet.link: none.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.chunk@fair | ns | 2994, 2994 | 2994 | 0.0% | 3308 | 3308 | 0.0% | 1.10 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.chunk@sched | ns | 2994, 2994 | 2994 | 0.0% | 3309 | 3309 | 0.0% | 1.11 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.chunk@system | ns | 3493, 2994 | 3244 | 15.4% | 3308 | 3308 | 0.0% | 1.02 | 1.000 | too few runs to resolve (least p 0.667) |
| cpu.clock@boot | MHz | 4186, 4186 | 4186 | 0.0% | 3786 | 3786 | 0.0% | 0.90 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@crunch | MHz | 1296, 1295 | 1296 | 0.1% | 3787 | 3787 | 0.0% | 2.92 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@energy | MHz | 4186, 4185 | 4186 | 0.0% | 3788 | 3788 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@fair | MHz | 4186, 4185 | 4186 | 0.0% | 3788 | 3788 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@files | MHz | 1296, 1294 | 1295 | 0.2% | 3788 | 3788 | 0.0% | 2.93 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@identity | MHz | 4186, 4186 | 4186 | 0.0% | 3787 | 3787 | 0.0% | 0.90 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@ipc | MHz | 4186, 4181 | 4184 | 0.1% | 3788 | 3788 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@mem | MHz | 4185, 4182 | 4184 | 0.1% | 3787 | 3787 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@net | MHz | 4186, 4181 | 4184 | 0.1% | 3788 | 3788 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@nvme | MHz | 1295, 1295 | 1295 | 0.0% | 3787 | 3787 | 0.0% | 2.92 | 0.333 | too few runs to resolve (least p 0.333) |
| cpu.clock@persist | MHz | 4186, 1295 | 2740 | 105.5% | 3788 | 3788 | 0.0% | 1.38 | 1.000 | too few runs to resolve (least p 0.667) |
| cpu.clock@procs | MHz | 4185, 4182 | 4184 | 0.1% | 3788 | 3788 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@sched | MHz | 4186, 4185 | 4186 | 0.0% | 3788 | 3788 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@system | MHz | 4185, 4186 | 4186 | 0.0% | 3788 | 3788 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@tail | MHz | 1196, 1294 | 1245 | 7.9% | 3788 | 3788 | 0.0% | 3.04 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@time | MHz | 1248, 1295 | 1272 | 3.7% | 3788 | 3788 | 0.0% | 2.98 | 0.667 | too few runs to resolve (least p 0.667) |
| cpu.clock@work | MHz | 4185, 4185 | 4185 | 0.0% | 3788 | 3788 | 0.0% | 0.91 | 0.333 | too few runs to resolve (least p 0.333) |
| crunch.all.deflate | ns | 180368885, 90091971 | 135230428 | 66.8% |  | - | - | - | - | ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.matmul | ns | 5093115, 2267359 | 3680237 | 76.8% |  | - | - | - | - | ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.parse | ns | 2866167730 | 2866167730 | 0.0% |  | - | - | - | - | Linux 1 run(s) unmeasured: the_phase_stopped_once_the_package_reached_its_limit; ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.all.sha256 | ns | 1929043, 1010929 | 1469986 | 62.5% |  | - | - | - | - | ToyOS 1 run(s) unmeasured: no_package_temperature_to_stop_the_all-core_phase_at |
| crunch.single.deflate | ns | 54948453, 55045252 | 54996852 | 0.2% | 60391184 | 60391184 | 0.0% | 1.10 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.single.matmul | ns | 1158478, 1021205 | 1089842 | 12.6% | 1182662 | 1182662 | 0.0% | 1.09 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.single.parse | ns | 68050088, 59226943 | 63638516 | 13.9% | 39477440 | 39477440 | 0.0% | 0.62 | 0.667 | too few runs to resolve (least p 0.667) |
| crunch.single.sha256 | ns | 599333, 555588 | 577460 | 7.6% | 629915 | 629915 | 0.0% | 1.09 | 0.667 | too few runs to resolve (least p 0.667) |
| energy.idle_60s.package |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: energy_uj_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_energy`_reads_it; ToyOS 1 run(s) unsupported: no_counter_carries_the_package's_energy:_toyos_abi::counters::Counter_has_none |
| fair.flat#1 | permille | 63, 61 | 62 | 3.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.flat#2 | permille | 485, 489 | 487 | 0.8% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.flat#3 | permille | 454, 448 | 451 | 1.3% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.flat.total | chunks/s | 2392127, 2380922 | 2386524 | 0.5% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.onejob#1 | permille |  | - | - | 52 | 52 | 0.0% | - | - | Linux 2 run(s) absent |
| fair.onejob#2 | permille |  | - | - | 474 | 474 | 0.0% | - | - | Linux 2 run(s) absent |
| fair.onejob#3 | permille |  | - | - | 472 | 472 | 0.0% | - | - | Linux 2 run(s) absent |
| fair.onejob.total | chunks/s |  | - | - | 2367906 | 2367906 | 0.0% | - | - | Linux 2 run(s) absent |
| fair.perjob#1 | permille |  | - | - | 125 | 125 | 0.0% | - | - | Linux 2 run(s) absent |
| fair.perjob#2 | permille |  | - | - | 446 | 446 | 0.0% | - | - | Linux 2 run(s) absent |
| fair.perjob#3 | permille |  | - | - | 428 | 428 | 0.0% | - | - | Linux 2 run(s) absent |
| fair.perjob.total | chunks/s |  | - | - | 2364165 | 2364165 | 0.0% | - | - | Linux 2 run(s) absent |
| fair.scope#1 | permille | 124, 125 | 124 | 0.8% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.scope#2 | permille | 453, 450 | 452 | 0.7% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.scope#3 | permille | 421, 424 | 422 | 0.7% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.scope.total | chunks/s | 1687554, 2390632 | 2039093 | 34.5% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session#1 | permille | 59, 58 | 58 | 1.7% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session#2 | permille | 490, 485 | 488 | 1.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session#3 | permille | 451, 452 | 452 | 0.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fair.session.total | chunks/s | 1657703, 2389641 | 2023672 | 36.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.served.create_write_unlink | ns |  | - | - | 64954 | 64954 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.mkdir_rmdir | ns |  | - | - | 109414 | 109414 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.open_close | ns |  | - | - | 16893 | 16893 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.read_4k_at | ns |  | - | - | 19503 | 19503 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.readdir.1000 | ns |  | - | - | 897419 | 897419 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.rename | ns |  | - | - | 91816 | 91816 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_read.1048576 | MB/s |  | - | - | 4505 | 4505 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_read.4096 | MB/s |  | - | - | 395 | 395 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_write.1048576 | MB/s |  | - | - | 973 | 973 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.seq_write.4096 | MB/s |  | - | - | 297 | 297 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.stat | ns |  | - | - | 12117 | 12117 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.tree.100 | ns |  | - | - | 16588138 | 16588138 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.served.write_4k_at | ns |  | - | - | 19630 | 19630 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.shm.create_write_unlink | ns | 12988, 10726 | 11857 | 19.1% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.mkdir_rmdir | ns | 2159, 2162 | 2160 | 0.1% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.open_close | ns | 3392, 3393 | 3392 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.read_4k_at | ns | 692, 708 | 700 | 2.3% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.readdir.1000 | ns | 176368, 176155 | 176262 | 0.1% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.rename | ns | 1596, 1593 | 1594 | 0.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.seq_read.1048576 | MB/s | 9163, 8871 | 9017 | 3.2% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.seq_read.4096 | MB/s | 8360, 8276 | 8318 | 1.0% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.seq_write.1048576 | MB/s | 4580, 4513 | 4546 | 1.5% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.seq_write.4096 | MB/s | 3607, 3590 | 3598 | 0.5% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.stat | ns | 1615, 1729 | 1672 | 6.8% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.tree.100 | ns | 538075, 542411 | 540243 | 0.8% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.shm.write_4k_at | ns | 604, 642 | 623 | 6.1% |  | - | - | - | - | ToyOS 1 run(s) absent |
| fs.tmp.create_write_unlink | ns |  | - | - | 13700 | 13700 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.mkdir_rmdir | ns |  | - | - | 9511 | 9511 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.open_close | ns |  | - | - | 7962 | 7962 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.read_4k_at | ns |  | - | - | 1315 | 1315 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.readdir.1000 | ns |  | - | - | 1243452 | 1243452 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.rename | ns |  | - | - | 7858 | 7858 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.seq_read.1048576 | MB/s |  | - | - | 6230 | 6230 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.seq_read.4096 | MB/s |  | - | - | 4328 | 4328 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.seq_write.1048576 | MB/s |  | - | - | 4042 | 4042 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.seq_write.4096 | MB/s |  | - | - | 2996 | 2996 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.stat | ns |  | - | - | 3372 | 3372 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.tree.100 | ns |  | - | - | 1672079 | 1672079 | 0.0% | - | - | Linux 2 run(s) absent |
| fs.tmp.write_4k_at | ns |  | - | - | 1290 | 1290 | 0.0% | - | - | Linux 2 run(s) absent |
| identity.cpuidle |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_kernel_names_its_idle_states_to_no_program |
| identity.nvme |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: the_NVMe_driver_keeps_its_controller's_identity_and_no_right_reads_it_from_another_program |
| identity.usb |  |  | - | - |  | - | - | - | - | Linux 2 run(s) absent; ToyOS 1 run(s) unsupported: usbd_keeps_its_devices_and_no_right_reads_them_from_another_program |
| ipc.connect_accept | ns | 3809, 3804 | 3806 | 0.1% | 3104 | 3104 | 0.0% | 0.82 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.4096 | ns | 7177, 7268 | 7222 | 1.3% | 9396 | 9396 | 0.0% | 1.30 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.65536 | ns | 18800, 19169 | 18984 | 1.9% | 39754 | 39754 | 0.0% | 2.09 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep.8 | ns | 3724, 3656 | 3690 | 1.8% | 7705 | 7705 | 0.0% | 2.09 | 0.667 | too few runs to resolve (least p 0.667) |
| ipc.reqrep_handle.8 | ns | 7192, 7440 | 7316 | 3.4% | 9426 | 9426 | 0.0% | 1.29 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.map | ns/MiB | 85, 74 | 80 | 13.8% | 100 | 100 | 0.0% | 1.26 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.total | ns/MiB | 257169, 260016 | 258592 | 1.1% | 131789 | 131789 | 0.0% | 0.51 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.touch | ns/MiB | 235177, 236592 | 235884 | 0.6% | 125194 | 125194 | 0.0% | 0.53 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.anon.unmap | ns/MiB | 22047, 23852 | 22950 | 7.9% | 4310 | 4310 | 0.0% | 0.19 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.copy | MB/s | 6899, 6918 | 6908 | 0.3% | 6678 | 6678 | 0.0% | 0.97 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.read | MB/s | 17632, 17745 | 17688 | 0.6% | 17596 | 17596 | 0.0% | 0.99 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.bw.write | MB/s | 9416, 9310 | 9363 | 1.1% | 9569 | 9569 | 0.0% | 1.02 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.first_touch.2m | ns/page | 196738, 194739 | 195738 | 1.0% | 693 | 693 | 0.0% | 0.00 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.first_touch.4k | ns/page | 920, 924 | 922 | 0.4% | 496 | 496 | 0.0% | 0.54 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.1048576.t1 | kops/s | 168, 212 | 190 | 23.2% | 29505 | 29505 | 0.0% | 155.29 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.1048576.t8 | kops/s | 87, 149 | 118 | 52.5% | 3267 | 3267 | 0.0% | 27.69 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.16.t1 | kops/s | 33574, 33491 | 33532 | 0.2% | 33007 | 33007 | 0.0% | 0.98 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.16.t8 | kops/s | 2566, 3183 | 2874 | 21.5% | 5097 | 5097 | 0.0% | 1.77 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.4096.t1 | kops/s | 21221, 21345 | 21283 | 0.6% | 27970 | 27970 | 0.0% | 1.31 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.malloc_churn.4096.t8 | kops/s | 813, 2053 | 1433 | 86.5% | 3219 | 3219 | 0.0% | 2.25 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_touch_unmap.2m | ns/page | 200203, 197889 | 199046 | 1.2% | 2973 | 2973 | 0.0% | 0.01 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_touch_unmap.4k | ns/page | 1009, 1011 | 1010 | 0.2% | 519 | 519 | 0.0% | 0.51 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.map_unmap_4k | ns | 1635, 1629 | 1632 | 0.4% | 2658 | 2658 | 0.0% | 1.63 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.1024 | MB/s | 78179, 77857 | 78018 | 0.4% | 77536 | 77536 | 0.0% | 0.99 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.1048576 | MB/s | 25999, 26809 | 26404 | 3.1% | 25218 | 25218 | 0.0% | 0.96 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.16384 | MB/s | 200426, 201618 | 201022 | 0.6% | 174767 | 174767 | 0.0% | 0.87 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.16777216 | MB/s | 10885, 10856 | 10870 | 0.3% | 10460 | 10460 | 0.0% | 0.96 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.256 | MB/s | 25186, 24657 | 24922 | 2.1% | 26591 | 26591 | 0.0% | 1.07 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.262144 | MB/s | 55607, 55544 | 55576 | 0.1% | 50420 | 50420 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.4096 | MB/s | 157444, 156490 | 156967 | 0.6% | 149263 | 149263 | 0.0% | 0.95 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.4194304 | MB/s | 21528, 20904 | 21216 | 2.9% | 20629 | 20629 | 0.0% | 0.97 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.64 | MB/s | 6177, 6216 | 6196 | 0.6% | 16283 | 16283 | 0.0% | 2.63 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.65536 | MB/s | 55004, 54930 | 54967 | 0.1% | 50188 | 50188 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.memcpy.67108864 | MB/s | 9764, 9653 | 9708 | 1.1% | 9155 | 9155 | 0.0% | 0.94 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.mprotect.4k | ns | 1015, 1017 | 1016 | 0.2% | 1077 | 1077 | 0.0% | 1.06 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.munmap_part.4k | ns | 1259, 1263 | 1261 | 0.3% | 1720 | 1720 | 0.0% | 1.36 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.munmap_touched_remote.4k | ns | 2248, 2257 | 2252 | 0.4% | 3309 | 3309 | 0.0% | 1.47 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.realloc_grow.1m_256m | ns | 203, 132 | 168 | 42.4% | 67079256 | 67079256 | 0.0% | 400473.17 | 0.667 | too few runs to resolve (least p 0.667) |
| mem.realloc_grow.last_128m_256m | ns | 25, 17 | 21 | 38.1% | 33889937 | 33889937 | 0.0% | 1613806.52 | 0.667 | too few runs to resolve (least p 0.667) |
| net.tcp.connect_accept_close | ns | 21008, 21147 | 21078 | 0.7% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.reqrep.64 | ns | 8931, 9491 | 9211 | 6.1% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.1 | MB/s | 1, 1 | 1 | 0.0% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.tcp.stream.65536 | MB/s | 6728, 6776 | 6752 | 0.7% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| net.udp.reqrep.64 | ns | 7320, 7708 | 7514 | 5.2% |  | - | - | - | - | ToyOS 1 run(s) unsupported: ToyOS's_network_stack_has_no_loopback:_netstack_refuses_127/8_as_a_destination |
| nvme.read.1m.seq |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| nvme.read.4k.random |  |  | - | - |  | - | - | - | - | Linux 2 run(s) unmeasured: /dev/nvme0n1_opened_read-only_was_refused_(Permission_denied_(os_error_13)):_`sudo_osbench_nvme`_reads_it; ToyOS 1 run(s) unsupported: the_block_service_reaches_a_partition_only_through_a_grant_the_supervisor_mints_for_a_file_server's_role_or_the_idle_slot,_and_this_bench's_NVMe_holds_another_system |
| persist.append_4k_fsync | ns | 899395, 1070348 | 984872 | 17.4% | 7367329 | 7367329 | 0.0% | 7.48 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.create_fsync_unlink | ns | 959987, 964210 | 962098 | 0.4% | 7283829 | 7283829 | 0.0% | 7.57 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.fsync_clean | ns | 29505, 30553 | 30029 | 3.5% | 2002735 | 2002735 | 0.0% | 66.69 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.seq_read_cached | MB/s | 8678, 10008 | 9343 | 14.2% | 955 | 955 | 0.0% | 0.10 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.seq_write_fsync | MB/s | 522, 538 | 530 | 3.0% | 14 | 14 | 0.0% | 0.03 | 0.667 | too few runs to resolve (least p 0.667) |
| persist.write_4k_fsync | ns | 1017633, 1053006 | 1035320 | 3.4% | 2164682 | 2164682 | 0.0% | 2.09 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.futex.cross_core | ns | 3340, 3355 | 3348 | 0.4% | 4461 | 4461 | 0.0% | 1.33 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.futex.same_cpu | ns | 2210, 2219 | 2214 | 0.4% | 4492 | 4492 | 0.0% | 2.03 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.pipe.cross_core | ns | 3730, 3696 | 3713 | 0.9% | 6575 | 6575 | 0.0% | 1.77 | 0.667 | too few runs to resolve (least p 0.667) |
| pingpong.pipe.same_cpu | ns | 6958, 5030 | 5994 | 32.2% | 6525 | 6525 | 0.0% | 1.09 | 1.000 | too few runs to resolve (least p 0.667) |
| pipe.throughput.1024 | MB/s | 1758, 1757 | 1758 | 0.1% | 1129 | 1129 | 0.0% | 0.64 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.16384 | MB/s | 3792, 3927 | 3860 | 3.5% | 4318 | 4318 | 0.0% | 1.12 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.256 | MB/s | 640, 636 | 638 | 0.6% | 311 | 311 | 0.0% | 0.49 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.4096 | MB/s | 4118, 4128 | 4123 | 0.2% | 2639 | 2639 | 0.0% | 0.64 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.64 | MB/s | 170, 169 | 170 | 0.6% | 77 | 77 | 0.0% | 0.45 | 0.667 | too few runs to resolve (least p 0.667) |
| pipe.throughput.65536 | MB/s | 4245, 4411 | 4328 | 3.8% | 6883 | 6883 | 0.0% | 1.59 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.posix_spawn_wait.std | ns | 168900, 165453 | 167176 | 2.1% | 637298 | 637298 | 0.0% | 3.81 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.posix_spawn_wait.tiny | ns | 44411, 43954 | 44182 | 1.0% | 60355 | 60355 | 0.0% | 1.37 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait.large | ns | 55293, 54472 | 54882 | 1.5% | 186605 | 186605 | 0.0% | 3.40 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait.tiny | ns | 52799, 52390 | 52594 | 0.8% | 44579 | 44579 | 0.0% | 0.85 | 0.667 | too few runs to resolve (least p 0.667) |
| proc.spawn_wait_loop.100 | ns | 5484248, 5363352 | 5423800 | 2.2% | 4906283 | 4906283 | 0.0% | 0.90 | 0.667 | too few runs to resolve (least p 0.667) |
| process.spawn_wait | ns | 174341, 172676 | 173508 | 1.0% | 446378 | 446378 | 0.0% | 2.57 | 0.667 | too few runs to resolve (least p 0.667) |
| syscall.null | ps | 91618, 91515 | 91566 | 0.1% | 75511 | 75511 | 0.0% | 0.82 | 0.667 | too few runs to resolve (least p 0.667) |
| tail.diag.periodic.30s | ns |  | - | - | 17816 | 17816 | 0.0% | - | - | Linux 2 run(s) absent |
| tail.stolen.10s | ns | 38388, 26370 | 32379 | 37.1% | 21890 | 21890 | 0.0% | 0.68 | 0.667 | too few runs to resolve (least p 0.667) |
| tail.wake.periodic.60s | ns | 67770, 69302 | 68536 | 2.2% | 17802 | 17802 | 0.0% | 0.26 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join | ns | 25419, 25525 | 25472 | 0.4% | 27489 | 27489 | 0.0% | 1.08 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join.default | ns | 25486, 25562 | 25524 | 0.3% | 28694 | 28694 | 0.0% | 1.12 | 0.667 | too few runs to resolve (least p 0.667) |
| thread.spawn_join.stack64k | ns | 23807, 23852 | 23830 | 0.2% | 27710 | 27710 | 0.0% | 1.16 | 0.667 | too few runs to resolve (least p 0.667) |
| time.now | ps | 14293, 14311 | 14302 | 0.1% | 21903 | 21903 | 0.0% | 1.53 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.100us | ns | 51840, 51914 | 51877 | 0.1% | 4403 | 4403 | 0.0% | 0.08 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.100us.slack1ns | ns | 1826, 1846 | 1836 | 1.1% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10ms | ns | 218706, 220092 | 219399 | 0.6% | 17736 | 17736 | 0.0% | 0.08 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.10ms.slack1ns | ns | 165904, 168611 | 167258 | 1.6% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.10us | ns | 51813, 51839 | 51826 | 0.1% | 1331 | 1331 | 0.0% | 0.03 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.10us.slack1ns | ns | 1826, 5873 | 3850 | 105.1% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1ms | ns | 72791, 72494 | 72642 | 0.4% | 17798 | 17798 | 0.0% | 0.25 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.1ms.slack1ns | ns | 20362, 20653 | 20508 | 1.4% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.sleep_late.1us | ns | 51813, 51839 | 51826 | 0.1% | 1208 | 1208 | 0.0% | 0.02 | 0.667 | too few runs to resolve (least p 0.667) |
| time.sleep_late.1us.slack1ns | ns | 4583, 5617 | 5100 | 20.3% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.timer_1ms.late | ns | 70233, 67742 | 68988 | 3.6% | 17717 | 17717 | 0.0% | 0.26 | 0.667 | too few runs to resolve (least p 0.667) |
| time.timer_1ms.late.slack1ns | ns | 20311, 20463 | 20387 | 0.7% |  | - | - | - | - | ToyOS 1 run(s) absent |
| time.yield | ps | 191084, 191131 | 191108 | 0.0% | 63536 | 63536 | 0.0% | 0.33 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.onto_busy | ns | 2386, 2285 | 2336 | 4.3% | 3714 | 3714 | 0.0% | 1.59 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle | ns | 69484, 69504 | 69494 | 0.0% | 17667 | 17667 | 0.0% | 0.25 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.idle.slack1ns | ns | 17536, 17798 | 17667 | 1.5% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.periodic.loaded | ns | 52362, 52334 | 52348 | 0.1% | 2972 | 2972 | 0.0% | 0.06 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.periodic.loaded.slack1ns | ns | 2337, 2335 | 2336 | 0.1% |  | - | - | - | - | ToyOS 1 run(s) absent |
| wake.storm.call.w1 | ns | 3467, 3899 | 3683 | 11.7% | 4612 | 4612 | 0.0% | 1.25 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w16 | ns | 62927, 62329 | 62628 | 1.0% | 13624 | 13624 | 0.0% | 0.22 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w4 | ns | 10355, 10019 | 10187 | 3.3% | 9408 | 9408 | 0.0% | 0.92 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.call.w64 | ns | 242689, 239252 | 240970 | 1.4% | 22739 | 22739 | 0.0% | 0.09 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w1 | ns | 22219, 100368 | 61294 | 127.5% | 23871 | 23871 | 0.0% | 0.39 | 1.000 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w16 | ns | 192731, 346906 | 269818 | 57.1% | 81586 | 81586 | 0.0% | 0.30 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w4 | ns | 126249, 124088 | 125168 | 1.7% | 36998 | 36998 | 0.0% | 0.30 | 0.667 | too few runs to resolve (least p 0.667) |
| wake.storm.drain.w64 | ns | 271392, 269629 | 270510 | 0.7% | 188252 | 188252 | 0.0% | 0.70 | 0.667 | too few runs to resolve (least p 0.667) |
| work.build_shaped.j1 | ns | 999427218, 1037422632 | 1018424925 | 3.7% | 922627319 | 922627319 | 0.0% | 0.91 | 0.667 | too few runs to resolve (least p 0.667) |
| work.build_shaped.j8 | ns | 99199929, 98881036 | 99040482 | 0.3% | 163682452 | 163682452 | 0.0% | 1.65 | 0.667 | too few runs to resolve (least p 0.667) |
| work.compress_inproc | ns | 363004210, 363181706 | 363092958 | 0.0% | 396164370 | 396164370 | 0.0% | 1.09 | 0.667 | too few runs to resolve (least p 0.667) |

Each p is its row's alone, uncorrected for the table's other rows.

