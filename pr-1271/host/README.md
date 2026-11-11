# PR 1271: host evidence

Revision: `edb33219f68c96c441249572fd656703567e61f3`. The tree that was checked is that commit's tree. Both runs started from an uncommitted working tree. That tree was then committed unchanged, and the only later amend touched a commit message.

## `cargo run -- --ci host` (`ci-host.log`)

Exit 1: 1 of 114 steps red. The red step is the build system's `cargo test --lib`, with 386 passed and 1 failed: `llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key`. That failure is `issues/the-llvm-environment-test-breaks-git-on-macos.md`, which says the step is red on every macOS host. The test is in `build/llvm.rs`, which this PR does not change. Every other step is green, including `the harness's own checks` (`toyos-checks`) and `clippy, warnings denied: clean`.

## The judge's negative control (`negative-control-judge.log`)

`mutation-any-speaker.patch` makes `member_verdicts` take a `===TEST_START`/`===TEST_END` line from any speaker as the runner's. Steps:

1. Apply the patch.
2. Run `cargo test --test toyos-checks -- a_shared_member_is_judged_by_its_own_end`. Exit 101: "a job with no end passed". The staged job's own `[.. test-runner pid=11] ===TEST_END test_rs_stuck exit=0===` line answered for a job that never ended.
3. Revert the patch and run the same command. Exit 0.
