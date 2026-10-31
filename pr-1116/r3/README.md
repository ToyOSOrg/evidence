# PR #1116 r3: review r1's fixes (`3c2fd574a`)

## Checks at `3c2fd574a`, clean tree
- `ci-host.log`: `cargo run -- --ci host`, 108 steps all green, exit 0.
- `qemu.log`: `affinity_pins_hold_on_every_cpu` and `std_threads_count_the_cpus_and_give_back_ended_threads`, both PASS, exit 0. `affinity_pins` now also has another thread pin the main thread by tid 0, then asserts that the main thread reads that mask and runs on that CPU.
- `kernel-lib.log`: `cargo test -p kernel --lib`, 377 passed, exit 0. `sim.log`: `cargo test -p kernel-sim`, exit 0.
- `kernel-lib-tiebreak.log`: the kernel library again at #1117's restacked head `4cc63897e`, 377 passed, exit 0.

## Blocker 2: the mask-blind pull side
- `b2-control-unfixed.log`: the new `a_masked_queue_past_a_siblings_is_stolen` on the code before the fix, exit 101. I15: "cpu0 has been idle for 11 rounds while cpu5 holds 1 queued fair task(s) it may run", and likewise cpu1 beside cpu4.
- `b2-fixed.log`: the same test with the fix, exit 0.
- `mut-probe-ignores-takers.diff`: the fixed tree with `takes(me)` removed from `best_victim`. With it, `mut-probe-host.log` shows `a_steal_probe_passes_a_surplus_its_mask_leaves_out` red (exit 101), and `mut-probe-sim.log` shows the scenario red with I15 again (exit 101). The tree was restored in the same run.

## Blocker 6: osbench_mem under TCG
`probe-mem.py` points `osbench_capability_groups_exit_0` at `osbench_mem` on 4 CPUs. The edit is applied at run time and never committed.
- `probe-mem-base.log`: the stack's base `49559ddb2`.
- `probe-mem-head.log`: `3c2fd574a`.
- Both stall at the same point. `mem.cpu.clock` prints, and then the group's first row, `memcpy_sweep`, prints nothing until the harness's quiet ceiling ends the wait. So the stall is independent of this PR.
- The likeliest cause, unverified, is a silent row slower than the ceiling under TCG.
