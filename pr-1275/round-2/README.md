# PR 1275, round 2: host evidence at 49c9859fd

Head `49c9859fd683a78d88781a756dc456ae5a5e7dfa`, macOS arm64 host. Paths are masked.

| file | command | exit |
|---|---|---|
| `window-r2-build-only.log` | `cargo run -- --build-only` | 0 (the new sysroot holds the ABI constant; the kernel and the compositor's assertion build) |
| `window-r2-ci-host.log` | `cargo run -- --ci host` | 1: 1 of 123 steps red, the build system's `cargo test --lib`, whose one failure is `the_caller_s_environment_reaches_neither_the_build_nor_the_key` (`issues/the-llvm-environment-test-breaks-git-on-macos.md`); clippy clean; the other FAILED lines are the models' negative controls reaching their verdicts |
| `window-r2-quick.log` | `cargo test -p toyos-window --lib`; `cargo test --manifest-path system/compositor/Cargo.toml --no-run`; `cargo test -p toyos-abi --lib` | window 21 passed, abi 50 passed. The compositor does not build for the host at all (`std::os::toyos`), as on main; `--build-only` builds it for its target |

Guest run 43167166939 (https://github.com/ToyOSOrg/ToyOS/actions/runs/43167166939, `guest-rows-43167166939.log`, runner paths masked): the runner checked out `49c9859fd`, x86-64 under KVM, with 0.04 CPUs of other work. `a_window_is_drawn_at_the_scale_and_relaid_at_the_next` PASS (`[scale] 400x200 under 56 rows at 2, relaid 200x100 under 28 at 1`). `testcases_members_exit_0` PASS: 241 members exited 0, `window_refusal` and `abuse_connect_flood` among them. 5 steps, all green.
