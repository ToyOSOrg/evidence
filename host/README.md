# PR 1275: host evidence

Branch `window-compositor-wait-bound`, head `0f38389b6ca873dbc4f69db4d1e593279c1e4f04`, base main `3c5c55584`. Host: macOS arm64. Paths, user and host names are masked.

| file | command | revision | exit |
|---|---|---|---|
| `window-unit.log` | `cargo test -p toyos-window --lib` | the tree committed as `0f38389b6` | 0, 22 passed |
| `window-mutations.log` | each of the two patches applied with `git apply`, then `cargo test -p toyos-window --lib -- a_compositor_that_never_answers`, then `git apply -R` | `3c5c55584` plus the working tree committed as `0f38389b6` | 101 each, 1 failed each; restored |
| `window-ci-host.log` | `cargo run -- --ci host` | `0f38389b6` | 1: 1 of 123 steps red, the build system's `cargo test --lib`, whose one failure is `the_caller_s_environment_reaches_neither_the_build_nor_the_key` (`issues/the-llvm-environment-test-breaks-git-on-macos.md`) |
| `window-build-only.log` | `cargo run -- --build-only` | `0f38389b6` | 0 |

The patches:
- `window-mutation-reads.patch` reads after a wait that saw nothing, which is the old blocking read. The test panics with "read a compositor that never answered".
- `window-mutation-forever.patch` waits `u64::MAX`. The test fails its assertion that the wait was given `ANSWER_BOUND`.
