# #1223: an unmap walks no futex bucket while no thread is in a futex wait

## Host checks at 6b3f79637 (the PR head), exit 0

`targeted-6b3f79637.log` is one script's output, run in a build slot on an aarch64 macOS host. It holds four commands, each exit 0:

- `cargo test -p kernel --lib --features sched-check`: 454 passed. This is the kernel library as host CI runs it.
- `cargo clippy -p kernel --target x86_64-unknown-none -- <adopted lints> -D warnings`
- the same with every x86-64 instrument feature
- `cargo clippy -p kernel --target aarch64-unknown-none-softfloat -- <adopted lints> -D warnings`

The full `cargo run -- --ci host` was not run. The owner's testing policy limits a PR to the touched crate's checks, and the merge queue runs the rest.

## The negative control

`mutation.patch` is branch `memperf-futex-mut` (34cb5146a). It makes the revoke skip the bucket walk even while a thread waits. `test_rs_futex_wake_counts`'s `orphaned_by_unmap` parks a waiter on a word, unmaps the word's page and expects the wait to end. On the mutation it should not end. That test runs only in the metal `testcases` shared boot, never as a QEMU row.

## Metal (requested)

- `testcases` at the head (expected green) and at the mutation (expected red), on the T14.
- The `memab` row (`osbench_system`, `osbench_mem`) on both benches. The A/B is base `memperf-ab-base` 8248c2366 (main 34cb4c918 plus the row) against head `memperf-ab-head` b34250f1f (6b3f79637 plus the row).
