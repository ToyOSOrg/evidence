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
