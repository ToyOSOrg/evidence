# PR #1116 r1: per-thread CPU affinity

Stack, on `origin/main` `0c7e62ca7`: `a4ae4de87` and `a966187bd` (#1111), `e71ed4d73` (affinity), `4250cc57a` (loom model of the setter/adopt fences), `41aa8765b` (I15's cost and two lints), and `28a55585c` (#1117, the spawn tiebreak).

## Checks at the stack top, `28a55585c`, with a clean tree

- `checks/ci-host2.log`: `cargo run -- --ci host`, exit 0, 106 steps all green.
- `checks/qemu2.log`: `cargo test --test toyos-build -- affinity_pins_hold_on_every_cpu std_threads_count_the_cpus_and_give_back_ended_threads`, exit 0. Both PASS on the 2-CPU TCG guest. `affinity_pins` held 1000 sleeps on each CPU, `cpu0=x2apic0 cpu1=x2apic1`; `std_threads` counted 2 CPUs.

## The red run before it

`checks/ci-host-r1-red.log` is `cargo run -- --ci host` at `e7b1b7914`, which is the stack without `41aa8765b`. It exited 1 with 2 of 106 red, both from the affinity commit:
- Clippy: `enqueue_new` took 8 arguments, and `masked_steals` cloned a `Copy` op.
- The kernel models: topology's `every_scenario_holds_at_every_shape` ran for over 14 minutes and I killed it. Its predecessor took 19 s.

`41aa8765b` fixes all three. With the same host load (about 50) and the same test profile, `cargo test -p kernel-sim --test topology` reads:
- `checks/topology-base-now.log`: 25.75 s on `origin/main`.
- `checks/topology-head-now.log`: 54.13 s after the first fix, which only looked for a victim for idle CPUs.
- `checks/topology-head-deep.log`: 13.15 s with the final fix, which gathers the deep queues once per step. At the 768-CPU shape the first fix was still O(cpus²) per step.

## The setter/adopt fence pair, model-checked

- `checks/loom-affinity.log`: `cargo test -p kernel-loom --test loom_affinity`, exit 0.
- `checks/loom-affinity-control.log`: the same with `--features affinity-fence-relaxed`, exit 101. It panicked with "neither saw the other".

`ci-host2.log` also runs that control as one of `build/ci.rs`'s required reds.

## Earlier checks, on the affinity commit before its fold

The fold changed only a clippy lint and loom test constructors. Every site the mutations replace still reads the same at `28a55585c`.
- `checks/kernel-lib2.log`: `cargo test -p kernel --lib`, 370 passed.
- `checks/libtest1.log`: the 190 tests that `controls/` runs per mutation.
- `checks/sim-masked.log`, `checks/sim-pushcost.log`: `masked_steals` over 40 seeds, and the push's cost with a partial mask against every CPU allowed (38 kicks against 43).
- `checks/libc-copies1.log`: libc's copy tests.
- `checks/qemu3.log`: the two QEMU tests before `std_threads` gained its process-inheritance check. `qemu2.log` supersedes it.

## Controls

`controls/summary2.txt` and `summary3.txt` give each mutation's red tests, out of 190. `*.patch` is each replacement and `*.per-test.log` its run.
- The unmutated control reds none.
- Each mutation reds its own route's test.
- `spawn-ignores-mask` also hangs two tests, which counts as a red.
- `probe-livelock` reds `a_probe_to_a_cpu_holding_only_pinned_tasks_is_dropped` (`probe-livelock-mutation.txt`).
- `push-ignores-mask` makes the simulator's `masked_steals` fail to terminate: "still 4 step(s) enabled after 20000 steps" (`push-ignores-mask.log`).

## diag2

`diag2/boot*-placediag.txt` are the T14 extracts that diagnosed the onto_busy stall. The spawner sat on the target CPU, so no spawn could land there.

Paths under the home directory read `$HOME`.
