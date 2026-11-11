## t14: means of rounds 1-3, ms over 256 children unless stated
| jobs | rounds | wall | child cpu | syscall cpu | SHM_CREATE cpu | ..spin | CLOSE cpu | ..spin | other sys cpu | ..spin | RECV cpu | fault | ..spin | shoot | rest (user, exit) | machine spin | pmm.rs:93 wait | served |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| j1 | 3 | 666.4 | 582.9 | 124.0 | 96.9 | 0.0 | 11.5 | 0.0 | 11.8 | 0.0 | 3.8 | 37.2 | 0.0 | 0.0 | 421.7 | 1.9 | 0.1 | 0.0 |
| j8 | 3 | 232.7 | 1316.2 | 584.0 | 528.8 | 201.1 | 21.1 | 0.9 | 24.8 | 1.0 | 9.3 | 128.3 | 32.9 | 0.0 | 603.9 | 246.3 | 243.3 | 0.0 |

Growth of children's CPU j1 -> j8: 733.3 ms; of it SHM_CREATE 431.9 (59 %, spin 201.1), faults 91.1 (12 %, spin 32.9), CLOSE 9.5, other syscalls 13.0 (spin 1.0), MESSAGE_RECV on-CPU 5.5, rest 182.2.
At j8: children's own lock spin 236.0 ms of 246.3 ms machine-wide; the pmm lock site 243.3 ms of all contended waits; machine spin per wall 1.06 CPUs.

### t14 contended lock sites, mean us per round
| site | j1 waits | j1 us | j8 waits | j8 us |
|---|---|---|---|---|
| kernel/src/mm/pmm.rs:93 | 374 | 149 | 417852 | 243346 |
| kernel/src/process.rs:488 | 553 | 394 | 1255 | 1233 |
| kernel/src/sync.rs:234 | 112 | 1077 | 80 | 554 |
| kernel/src/mm/alloc.rs:584 | 1607 | 252 | 3017 | 552 |
| kernel/src/mm/alloc.rs:560 | 368 | 42 | 1136 | 186 |
| kernel/src/process.rs:822 | 97 | 8 | 161 | 130 |
| kernel/src/process.rs:816 | 1 | 0 | 36 | 69 |
| kernel/src/process.rs:880 | 3 | 0 | 38 | 39 |
| kernel/src/object/paged.rs:471 | 0 | 0 | 33 | 38 |
| kernel/src/process.rs:752 | 2 | 0 | 71 | 26 |
| kernel/src/process.rs:804 | 28 | 3 | 65 | 19 |
| kernel/src/process.rs:761 | 6 | 2 | 35 | 14 |
| kernel/src/scheduler.rs:342 | 4 | 0 | 14 | 14 |
| kernel/src/process.rs:863 | 8 | 0 | 39 | 13 |

### t14 per syscall at j8, mean per round (calls, on-CPU ms, spin ms) against j1
| syscall | calls | j1 cpu | j8 cpu | j8 spin | x |
|---|---|---|---|---|---|
| SHM_CREATE | 1024 | 96.9 | 528.8 | 201.1 | 5.5 |
| CLOSE | 1024 | 11.5 | 21.1 | 0.9 | 1.8 |
| MESSAGE_RECV | 1280 | 3.8 | 9.3 | 0.0 | 2.5 |
| VM_RELEASE | 768 | 2.5 | 5.2 | 0.2 | 2.1 |
| SHM_MAP | 1024 | 1.8 | 4.5 | 0.2 | 2.5 |
| MESSAGE_SEND | 1792 | 2.3 | 4.3 | 0.2 | 1.8 |
| PAGED_READ | 768 | 1.6 | 3.5 | 0.1 | 2.2 |
| VM_RESERVE | 1024 | 1.8 | 3.1 | 0.2 | 1.7 |
| NAMESPACE_OPEN | 1024 | 1.2 | 2.1 | 0.1 | 1.8 |
| FUTEX_WAKE | 1536 | 0.3 | 0.7 | 0.0 | 2.4 |
| FSTAT | 1024 | 0.3 | 0.5 | 0.0 | 2.0 |
| HANDLE_DUP | 256 | 0.0 | 0.3 | 0.0 | 7.2 |
| THREAD_GET_AFFINITY | 256 | 0.0 | 0.2 | 0.0 | 6.0 |
| ENDOWMENTS | 256 | 0.0 | 0.2 | 0.0 | 17.4 |
| RANDOM | 256 | 0.0 | 0.2 | 0.0 | 20.0 |
| SET_THREAD_POINTER | 256 | 0.0 | 0.0 | 0.0 | 7.0 |

## amd: means of rounds 1-3, ms over 256 children unless stated
| jobs | rounds | wall | child cpu | syscall cpu | SHM_CREATE cpu | ..spin | CLOSE cpu | ..spin | other sys cpu | ..spin | RECV cpu | fault | ..spin | shoot | rest (user, exit) | machine spin | pmm.rs:93 wait | served |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| j1 | 3 | 868.4 | 724.4 | 179.8 | 136.6 | 0.0 | 15.8 | 0.0 | 18.3 | 0.0 | 9.2 | 73.5 | 0.0 | 0.0 | 471.0 | 2.0 | 0.2 | 0.0 |
| j16 | 3 | 330.7 | 3977.4 | 2577.8 | 2478.1 | 1933.5 | 36.5 | 7.3 | 50.3 | 13.9 | 13.0 | 529.1 | 324.1 | 0.0 | 870.5 | 2355.9 | 2348.2 | 0.0 |

Growth of children's CPU j1 -> j16: 3253.0 ms; of it SHM_CREATE 2341.5 (72 %, spin 1933.5), faults 455.6 (14 %, spin 324.1), CLOSE 20.7, other syscalls 32.0 (spin 13.9), MESSAGE_RECV on-CPU 3.8, rest 399.5.
At j16: children's own lock spin 2278.8 ms of 2355.9 ms machine-wide; the pmm lock site 2348.2 ms of all contended waits; machine spin per wall 7.13 CPUs.

### amd contended lock sites, mean us per round
| site | j1 waits | j1 us | j16 waits | j16 us |
|---|---|---|---|---|
| kernel/src/mm/pmm.rs:93 | 393 | 213 | 604627 | 2348151 |
| kernel/src/process.rs:488 | 1001 | 1103 | 1592 | 3672 |
| kernel/src/mm/alloc.rs:584 | 1427 | 396 | 3604 | 1813 |
| kernel/src/mm/alloc.rs:560 | 696 | 168 | 1897 | 870 |
| kernel/src/process.rs:822 | 124 | 38 | 173 | 355 |
| kernel/src/process.rs:816 | 5 | 1 | 48 | 218 |
| kernel/src/process.rs:880 | 5 | 0 | 40 | 128 |
| kernel/src/process.rs:752 | 16 | 3 | 74 | 105 |
| kernel/src/process.rs:761 | 12 | 5 | 51 | 99 |
| kernel/src/object/paged.rs:471 | 0 | 0 | 38 | 85 |
| kernel/src/scheduler.rs:342 | 8 | 2 | 27 | 66 |
| kernel/src/process.rs:804 | 12 | 4 | 64 | 57 |
| kernel/src/process.rs:863 | 5 | 0 | 37 | 54 |
| kernel/src/object/paged.rs:364 | 0 | 0 | 21 | 50 |

### amd per syscall at j16, mean per round (calls, on-CPU ms, spin ms) against j1
| syscall | calls | j1 cpu | j16 cpu | j16 spin | x |
|---|---|---|---|---|---|
| SHM_CREATE | 1024 | 136.6 | 2478.1 | 1933.5 | 18.1 |
| CLOSE | 1024 | 15.8 | 36.5 | 7.3 | 2.3 |
| MESSAGE_RECV | 1280 | 9.2 | 13.0 | 0.0 | 1.4 |
| SHM_MAP | 1024 | 1.9 | 10.3 | 3.6 | 5.3 |
| VM_RELEASE | 768 | 3.5 | 10.2 | 2.8 | 2.9 |
| MESSAGE_SEND | 1792 | 4.5 | 8.9 | 1.8 | 2.0 |
| VM_RESERVE | 1024 | 2.3 | 6.0 | 2.4 | 2.6 |
| NAMESPACE_OPEN | 1024 | 1.9 | 5.5 | 2.2 | 2.9 |
| PAGED_READ | 768 | 1.9 | 4.5 | 0.2 | 2.3 |
| HANDLE_DUP | 256 | 0.2 | 1.3 | 0.6 | 6.8 |
| FUTEX_WAKE | 1536 | 0.6 | 1.0 | 0.0 | 1.7 |
| FSTAT | 1024 | 0.3 | 1.0 | 0.1 | 2.9 |
| ENDOWMENTS | 256 | 0.2 | 0.5 | 0.0 | 2.3 |
| RANDOM | 256 | 0.5 | 0.5 | 0.0 | 1.0 |
| THREAD_GET_AFFINITY | 256 | 0.3 | 0.5 | 0.0 | 1.7 |
| SET_THREAD_POINTER | 256 | 0.0 | 0.0 | 0.0 | 32.0 |

