# ToyOSOrg/ToyOS#1008, round 2

Head `1877d8b4d`: the lifecycle commit `53ddef682`, its round-1 answer `63b23563c`, the targeted x86 shootdown `36e0bab9b`, the black box's write-back `bb58faebb` and lazy segments `1877d8b4d`.

| file | command | exit |
|---|---|---|
| lcr1-guest1.log | `mmap_stress mmap_prot abuse_readonly_copyout std_threads std_threading` in one boot, and `libc_children` | 0 |
| controls/protect-ignores-max.* | `mmap_stress` with `vm_protect` ignoring an object range's bound | red: "the clock page made writable" |
| loom-tlb-tags.log | `cargo test --manifest-path kernel/loom/Cargo.toml --test tlb_tags` | 0 |
| controls/tlb-tags-enter-relaxed.log | the same with `--features tlb-tags-enter-relaxed` (a CI control now) | 101 |
| ts-guest1.log, ts-guest2.log | `tlb_shootdown_waits` and five more on the test kernel (`SWEEP_PARAMS`); guest1's red was the fixed-mapping half over an untouched page, which owes no flush, fixed in the test | 1, 0 |
| controls/reach-no-runner.*, reach-every-cpu.* | `tlb_shootdown_waits` with a change that reaches no runner, and one that reaches every CPU | red, red (each half) |
| lz-guest1.log, lz-guest2.log | lazy segments: shared tests and QEMU rows; guest1's two x86 boots died before the targeting's tables were sized (fixed in `36e0bab9b`); guest2 those boots | 1, 0 |

The stack head (`pr-1010` r2) reruns all of it after the last changes.
