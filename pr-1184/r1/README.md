# PR 1184, round 1

- `ci-host.log`: `cargo run -- --ci host` on the tree just before
  4eebd97ce. Exit 1, and the only red step is clippy: under
  `mutate-spawn-skips-the-insert-recheck`, the new spawn test was cfg'd out,
  which left `Tid` and `World::issue_tids_below` unused. Every other step
  (Tests, Userland, Models and their controls) was green.
- The fix kept that test in both arms and gated only its insert assertions,
  a test-only change in `kernel/proclife/src/spawn.rs`. The parts it can
  change were rerun at 4eebd97ce: `ci-host-lint.log` (`--ci host lint`,
  exit 0) and `ci-host-models.log` (`--ci host models`, exit 0).
- `build-only.log`: `cargo run -- --build-only` on the same tree as
  `ci-host.log`, exit 0. The later change touched only test code.
- `controls/`: each patch is a negative control applied with `git apply`,
  built, run with `cargo test` in `kernel/proclife`, and reverted, at
  4eebd97ce. Both exit 101, each on its intended test (`controls.txt`).

Paths, user, host and machine model are masked.
