# PR 1250: a spawn reserves its stack once, and a committed page's frame is written once

## checks/ (host, this Mac, arm64 macOS)

- `checks-pr.sh` -> `checks-pr-1.log`, at 5c61b1cd6:
  - `cargo test -p kernel --lib --features sched-check vm::`: exit 0, 16 passed.
  - `mutation-tail.patch` applied (`vm::copied_page` no longer zeros past the copied bytes), then
    `cargo test -p kernel --lib --features sched-check vm::tests::a_copied_page_keeps_nothing_its_frame_held`:
    exit 101, `zeros past 0 bytes`. Reverted in the same run (`mutation reverted`).
  - kernel library clippy: exit 0. Kernel clippy for x86_64-unknown-none and aarch64-unknown-none-softfloat:
    exit 101, `copy_in` not found (the first commit's build error, fixed at f3a8c4000).
  - The script's own last line (`script exit 0`) is the shell's, not a result; each `exit N` line is.
- `checks-pr-2.sh` -> `checks-pr-2.log`, at f3a8c4000: kernel clippy for x86_64-unknown-none, the same with
  `boot-actuators,test-actuators`, aarch64-unknown-none-softfloat, and the library's tests with `sched-check`, each with
  the adopted lints and `-D warnings`: exit 0 each. `kernel/pure` did not change between the two revisions.

## boot2/ (metal, the code this PR replaces)

Boot 2 of the spawn-stage diagnosis: branch `spawnperf-measure` at 1e8b0e711f9f85333825325c0e8fc518700fb857
(origin/main 422915e2c and MEASUREMENT ONLY commits), one boot per bench, verdict `passed` on both.
`runs2/<bench>/kernel.log` holds only the lines the table reads (the job's `stages`, image, build-shaped and osbench
lines), cut from the boot's kernel log. `python3 -I table.py runs2/t14/kernel.log runs2/amd/kernel.log` regenerates
`stages-boot2.txt` byte for byte (exit 0).

Figures the PR cites, hot (back to back), ns p50/min, tiny program:

| bench | `kernel: SYS_SPAWN whole` | `stack reserve` |
|---|---|---|
| t14 | 18896/17443 | 6978/6395 |
| amd | 22302/17303 | 7404/6432 |

## Round 3, after the rebase onto main 45935f4b9 (head daf84f482)

- `checks/checks-pr-3.sh` -> `checks/checks-pr-3.log`: `cargo test -p kernel --lib --features sched-check vm::`
  exit 0 (16 passed); kernel clippy for x86_64-unknown-none, the same with `boot-actuators,test-actuators`,
  aarch64-unknown-none-softfloat, and the library's tests with `sched-check`: exit 0 each. The rebased diff is the
  same as f3a8c4000's but for context lines.
- `checks/guest-rows-43052895137.txt`: guest-rows run 43052895137 at f3a8c4000, the result lines of its log:
  `osbench_capability_groups_exit_0`, `virt_user_mode`, `a_spawn_from_an_image_frees_it_when_the_child_ends` and
  `virt_smp` pass, 4 of 4 (https://github.com/ToyOSOrg/ToyOS/actions/runs/43052895137).

## Review round 1 (head 1d151cba1)

- `round1/checks-1.log` at 2a9e60755: kernel clippy for x86_64-unknown-none, x86_64 with `boot-actuators,test-actuators`
  and aarch64-unknown-none-softfloat, exit 0 each; the guest test binaries built while staging the `spawn_cost` row's
  image (`exit 2` there is staging's own: it touched no machine). Its host tests failed to compile (`format!` not
  imported in `vm`'s test module), fixed in 1d151cba1, which differs from 2a9e60755 only there.
- `round1/checks-2.log` at 1d151cba1 (`round1/checks.sh` as then): `vm::` exit 0 (17 passed), `frames::` exit 0 (39
  passed); `round1/mutation-read-empty.patch` applied (a page that takes no bytes reads the source anyway): exit 101,
  both `vm` tests named `a_*` fail; reverted; library clippy exit 0.

## Review round 2 (head 8245c9d03)

- `round2/checks.log` (`round2/checks.sh`): `vm::` exit 0 (16 passed), `frames::` exit 0 (39 passed);
  `round1/mutation-read-empty.patch` applied: exit 101, `a_copied_page_keeps_nothing_its_frame_held` fails at its
  first row that takes no bytes; reverted; library clippy exit 0.
