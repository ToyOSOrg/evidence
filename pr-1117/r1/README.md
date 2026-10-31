# PR #1117 r1: the spawn tiebreak (`28a55585c`)

- The host CI and QEMU runs at this commit, which is the top of the stack, are in `pr-1116` at [52999b7b](https://github.com/ToyOSOrg/evidence/tree/52999b7b13af6441683a64653149484d46112c53/pr-1116/r1): `checks/ci-host2.log`, exit 0 with 106 steps, and `checks/qemu2.log`, exit 0.
- Two mutations, each applied as a checked patch at `28a55585c`, run with `cargo test -p kernel --lib -- sched::cpu::tests` and reverted in the same run. In each, exactly one of the 60 tests went red, `a_spawn_wakes_the_shallowest_free_core_sleeper`, and the run exited 101:
  - `spawn-ignores-exit.patch` drops the exit from the spawn key. Its assertion message is "cpu7 wakes in 253 µs, every other sleeper in 1048".
  - `exit-before-core.patch` ranks the exit ahead of `busy_siblings`. Its assertion message is "cpu4 waits shallowest, but its sibling runs: a free core first".

Paths under the home directory read `$HOME`.
