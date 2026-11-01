# PR #1116 r4: review r2 and the rebase onto main `24a538c88`

## Commits
- `8deb17025`: takers are written only by a pass whose surplus reaches the threshold. The field doc says what a stale read costs. A busy-balance host test was added, and the probe test abandons its world before asserting.
- `0295551c9`: main's osbench power readers use this stack's names. That is `sys::allowed_cpus` on Linux and `arch::core_of_apic` on ToyOS.
- The rebase onto main moved the affinity calls past main's event calls (148–151). They are now `SYS_THREAD_SET_AFFINITY` 152, `SYS_THREAD_GET_AFFINITY` 153 and `SYS_CURRENT_CPU` 154, with 156 profile bins.

## Checks
- `ci-host-130237c67.log`: `cargo run -- --ci host` at the rebased stack before `0295551c9`. It exited 1, with 1 red of 108: clippy for osbench on both Linux targets, where `super::allowed_cpus` was not found in main's new power reader. Every other step is green. Steps that are required to red, such as `wake-fence-off`, reached their verdicts.
- `osbench-clippy-x86.log` and `osbench-clippy-arm.log`: the red step's two commands with the Linux fix applied, each exit 0. `0295551c9` changes beyond that only `sys/toyos.rs`, which no Linux build compiles.
- `qemu.log`: `affinity_pins_hold_on_every_cpu` and `std_threads_count_…` at `130237c67`, both PASS, exit 0. `0295551c9` changes only osbench, which neither builds.
- `probe-sched.log`: `probe-sched.py` points `osbench_capability_groups_exit_0` at `osbench_sched` on 4 TCG CPUs, at the stack head `a2fd3af47`. The edit is applied at run time and never committed.
  - It exited 0. `wake.onto_busy` measured with n=200, and `osbench_sched` exited 0.
  - This probe is what found the ToyOS-side rename, `arch::core_of`, which host CI does not build.
- `r2-busy-test.log`: the new `a_busy_balance_passes_a_heavier_surplus_its_mask_leaves_out`, exit 0.
- `mut-busy-ignores-takers.diff` and `mut-busy.log`: with `takes(me)` dropped from `balance_busy`, the test reds (asked `[4]`, expected `[1]`; exit 101). The tree was restored in the same run.

## Metal staged, not run
- `request-t14.txt`: the benchcase and testcases boots at `a2fd3af47`.
- `request-amd.txt`: the benchcase boot.
