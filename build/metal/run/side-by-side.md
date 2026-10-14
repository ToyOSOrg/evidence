# PR #915: base `3ba4a4a2f` against head `49f786c18`, side by side

Read off each arm's readback and judge log beside this file (`<arm>/testcases/kernel.log`, `<arm>/judge-*.log`), one session per bench, base booted first. Read, not judged against each other.

## T14

| row | base | head |
|---|---|---|
| `control_regs` | PASS | PASS |
| `wake_storm_cost` | PASS | PASS |
| `counters` | PASS | PASS |
| `syscall_cost` | PASS | PASS |
| `spawn_cost` | PASS | PASS |
| `smp_roster_and_tsc_trail` | PASS | PASS |
| `timer_calibration` | PASS | PASS |
| `wake_onto_busy` | PASS | PASS |
| judge total | 10 passed, 0 failed, 2 boot | 10 passed, 0 failed, 2 boot |

| figure | base | head |
|---|---|---|
| `syscall_cost` cycles/syscall | 422 | 427 |
| `spawn_cost` toybox min / median µs | min 917 us median 1082 us | min 917 us median 1007 us |
| `wake_storm_cost` 1 waiters, cycles | 8150 | 3926 |
| `wake_storm_cost` 2 waiters, cycles | 10411 | 10840 |
| `wake_storm_cost` 4 waiters, cycles | 10401 | 2464 |
| `wake_storm_cost` 8 waiters, cycles | 20487 | 33967 |
| `wake_storm_cost` 16 waiters, cycles | 27080 | 25568 |
| `wake_storm_cost` 32 waiters, cycles | 41316 | 36298 |
| `wake_storm_cost` 64 waiters, cycles | 67571 | 59683 |
| `wake_onto_busy` p50/p90/p99/max | p50=4us p90=5us p99=22us max=23us | p50=4us p90=5us p99=5us max=23us |
| `timer_calibration` TSC | 2419345083Hz | 2419345083Hz |
| `IA32_HWP_REQUEST` as read, every CPU | 0x80002a04 | 0x80002a01 |
| `IA32_ENERGY_PERF_BIAS` as read, every CPU | 6 | 7 |
| `IA32_HWP_REQUEST_PKG` as read | 0x8000ff01 | 0x8000ff01 |

`counters_on_metal`, per CPU. The spin's floor the row holds is 3800 MHz on both arms, Linux's turbostat busy clock over the same span of load (`tests/metal/t14-linux/turbostat-loaded.txt`, a comparison `wt/toyos-linux-sweep` owns); every CPU spun above it in both.

| cpu | idle busy base | idle busy head | spinning MHz base | spinning MHz head | kick late p50/p99/max µs base | kick late p50/p99/max µs head |
|---|---|---|---|---|---|---|
| 0 | 0.08% | 0.05% | 3830 | 3830 | 0.3/7.7/38.9 | 0.3/8.0/27.9 |
| 1 | 0.01% | 0.00% | 3829 | 3830 | 0.8/9.9/23.6 | 0.8/8.5/27.1 |
| 2 | 0.00% | 0.01% | 3830 | 3830 | 0.8/8.7/54.4 | 0.9/7.8/21.0 |
| 3 | 0.00% | 0.02% | 3830 | 3830 | 0.9/8.5/21.8 | 0.8/8.8/42.9 |
| 4 | 0.00% | 0.00% | 3829 | 3830 | 0.9/10.0/30.4 | 0.9/10.6/35.3 |
| 5 | 0.00% | 0.00% | 3830 | 3830 | 1.1/11.1/23.1 | 1.1/11.2/28.5 |
| 6 | 0.00% | 0.00% | 3830 | 3830 | 1.1/13.2/30.5 | 1.2/11.9/34.3 |
| 7 | 0.00% | 0.00% | 3830 | 3830 | 1.2/12.6/68.5 | 1.2/14.2/27.6 |

Rounds kept under `loaded`: base 3597138, head 3715898; SMI count moved by 0 on every CPU in both.

## AMD bench

| row | base | head |
|---|---|---|
| `control_regs` | PASS | PASS |
| `wake_storm_cost` | PASS | PASS |
| `syscall_cost` | PASS | PASS |
| `spawn_cost` | PASS | PASS |
| `timer_calibration` | PASS | PASS |
| `wake_onto_busy` | PASS | PASS |
| judge total | 6 passed, 0 failed, 1 boot | 6 passed, 0 failed, 1 boot |

| figure | base | head |
|---|---|---|
| `syscall_cost` cycles/syscall | 216 | 219 |
| `spawn_cost` toybox min / median µs | min 2002 us median 2143 us | min 2005 us median 2133 us |
| `wake_storm_cost` 1 waiters, cycles | 4410 | 2538 |
| `wake_storm_cost` 2 waiters, cycles | 4734 | 4806 |
| `wake_storm_cost` 4 waiters, cycles | 5490 | 5634 |
| `wake_storm_cost` 8 waiters, cycles | 6678 | 6912 |
| `wake_storm_cost` 16 waiters, cycles | 8622 | 8424 |
| `wake_storm_cost` 32 waiters, cycles | 11052 | 11268 |
| `wake_storm_cost` 64 waiters, cycles | 15480 | 15390 |
| `wake_onto_busy` p50/p90/p99/max | p50=7us p90=8us p99=11us max=30us | p50=8us p90=9us p99=10us max=32us |
| `timer_calibration` TSC | 1796515837Hz | 1796544884Hz |
| HWP | no performance request is declared: no HWP (CPUID.6:EAX[7]) | no performance request is declared: no HWP (CPUID.06H:EAX[7]) |

