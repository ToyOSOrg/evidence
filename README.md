# PR 1235: a block session never waits on its server's word alone

Host checks only, on a macOS arm64 host. Paths are masked; each log ends with its command's exit code.

- `host-full/`: `cargo run -- --ci host` at 500507174 (`revision.txt`), the change on 422915e2c before its rebase.
  Exit 1, 1 of 110 steps red: the build system's
  `llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key`, recorded in
  `issues/the-llvm-environment-test-breaks-git-on-macos.md`. The loom `FAILED` lines in the models part are its
  negative controls, which the step expects red.
- `host-targeted/`: after the rebase onto main b56693152, at 7c6717aa2 (`revision.txt`), by `a-targeted.sh`:
  `cargo test -p toyos-blockring -p diskserver -p toyos` (`test.log`, exit 0) and
  `cargo clippy -p toyos-blockring -p toyos --all-targets` with the gate's adopted lints and `-D warnings`
  (`clippy.log`, exit 0). The rebase changed none of this PR's files.
- `controls/`: three negative controls, each a patch against the final `lib/blockring/src/ends.rs` (17d6339c5)
  and `client.rs` (c7f3eeaba), applied, built and run with `cargo test -p toyos-blockring --lib`, then reverted.
  Each log is red at the named tests, exit 101.
