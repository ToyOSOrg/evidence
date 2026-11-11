# pr-1243 r4: review round 2, ToyOS 8d57dcf87 (the head, on main e558cc153)

| File | Command | Revision | Exit |
|---|---|---|---|
| `guest/b1-std_threads-run43077064338-ab39884e2.log` | guest-rows dispatch, filter `std_threads_count_the_cpus_and_give_back_ended_threads --nocapture` (run 43077064338) | ab39884e2 | failure: `EARLY PANIC: … memory allocation of 480 bytes failed`, the boot CPU's `record` growing a `Vec` before `mm::init` (B1). Every x86-64 boot at ab39884e2 ends there |
| `host/a-r4.log` | `cargo test -p kernel --lib mitigation`; `cargo test --test toyos-checks`; clippy on the kernel (host lib and tests with `sched-check`, `x86_64-unknown-none` default and with `boot-actuators,test-actuators`) and on `toyos-build --all-targets`, adopted lints and `-D warnings`; then every control | 8d57dcf87 | 0 each: 19 and 47 passed; each control 101 |

Controls (`control/<name>.patch`, applied with `git apply`, tested, reversed with `git apply -R`; the tree's diff digest is the same before and after). Each builds and fails:

| Control | Pure tests | Bench test (`<name>-bench.log`) | Judge test |
|---|---|---|---|
| `drop-amd-g2` | 5 fail | the AMD bench's `spectre_v1` | |
| `amd-family-17h-dropped` | 2 fail | the AMD bench's `retbleed` | |
| `intel-row-dropped` (the record's mutation) | 3 fail | the T14's `indirect_target_selection` | |
| `stibp-with-enhanced-ibrs` (R1) | 2 fail | the T14's `spectre_v2` | |
| `policy-unmarked` (SRSO's IBPB) | 4 fail | the AMD bench's `spec_rstack_overflow` | |
| `smt-exposure-dropped` (B2) | 2 fail | the AMD bench's `retbleed` without its SMT exposure | |
| `mmio-verw-wherever-listed` (the rule before ab39884e2) | 6 fail | the T14's `mmio_stale_data` | |
| `psdp-unconditional` (B3) | 5 fail | | |
| `judge-reads-cpu0-alone` (R6) | | | "a later CPU's LFENCE bit read clear was accepted" |
| `judge-holds-no-pin` | | | "a misread the lines agree with was accepted" |
| `judge-skips-the-kernels-lfence` | | | "cpu0's LFENCE bit read clear was accepted" |

B1 is outside what host tests reach; the guest row at the head is its check. Host paths, user and host names are masked; the runner's CPU model is `<cpu-model>`.
