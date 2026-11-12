# PR 1275, round 2: host evidence at 49c9859fd

Head `49c9859fd683a78d88781a756dc456ae5a5e7dfa`, macOS arm64 host. Paths are masked.

| file | command | exit |
|---|---|---|
| `window-r2-build-only.log` | `cargo run -- --build-only` | 0 (the new sysroot holds the ABI constant; the kernel and the compositor's assertion build) |
| `window-r2-ci-host.log` | `cargo run -- --ci host` | 1: 1 of 123 steps red, the build system's `cargo test --lib`, whose one failure is `the_caller_s_environment_reaches_neither_the_build_nor_the_key` (`issues/the-llvm-environment-test-breaks-git-on-macos.md`); clippy clean; the other FAILED lines are the models' negative controls reaching their verdicts |
| `window-r2-quick.log` | `cargo test -p toyos-window --lib`; `cargo test --manifest-path system/compositor/Cargo.toml --no-run`; `cargo test -p toyos-abi --lib` | window 21 passed, abi 50 passed. The compositor does not build for the host at all (`std::os::toyos`), as on main; `--build-only` builds it for its target |
