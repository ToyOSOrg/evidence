# PR #1269, round 2: review r1 answered

- `ci-host-95eecebd2.log`: `cargo run -- --ci host` at 95eecebd2 (macOS arm64), exit 1, 113 of 115 steps green. The two reds: the build system's `cargo test --lib` (the recorded macOS-only `llvm::tests` pair, `issues/the-llvm-environment-test-breaks-git-on-macos.md`, and `sourcegate::every_hand_written_auto_trait_impl_is_declared`, step 2's undeclared `MapNode` impls), and clippy (a redundant clone in `kernel/loom/tests/paged_ranges.rs`). The models step, with `ranges-less-relaxed` red as its control row requires, is green. The many `FAILED` lines inside green steps are the controls' expected reds.
- `ci-rerun-9d821433c.log`: at 9d821433c, which fixes both: `cargo test -p toyos-build --lib` red only on the macOS `llvm::tests` pair; `cargo run -- --ci host lint`: 5 steps, all green.
- `kernel-clippy-r1.log`: the four kernel lint shapes, exit 0 each, after the revocation visit's rewrite and the copy sites (70e1beaba, cea561c0c).
