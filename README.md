# Evidence for ToyOS PR #968

A null kernel object behind libc's `/dev/null` and std's `Stdio::null()`. Paths are masked
(`<home>`, `<scratch>`, `<tmp>`). Each log's first line names the revision it ran at. Each
log ends with `exit <code>`, the command's exit status.

| log | command | revision | target | exit |
|---|---|---|---|---|
| `logs/ci-host.log` | `cargo run -- --ci host` | aa2a42e50 | host (macOS, aarch64) | 0 |
| `logs/build-x86_64.log` | `cargo run -- --build-only --arch x86_64` | tree of aa2a42e50 (run before the commit, no edit between) | x86_64 | 0 |
| `logs/build-aarch64.log` | `cargo run -- --build-only --arch aarch64` | aa2a42e50 | aarch64 | 0 |
| `logs/libc_children-1.log` | `cargo test --test toyos-build -- libc_children` | tree of aa2a42e50 | QEMU x86-64 | 0 |
| `logs/libc_children-final.log` | same | bd873e9a4 (PR head, rebased on 3891c42c4) | QEMU x86-64 | 0 |
| `logs/control-whole-change-2.log` | same, with `control-whole-change.patch` reverse-applied, then restored | bd873e9a4 minus product | QEMU x86-64 | 1 (expected) |
| `logs/mutation-short-write.log` | same, with `mutation-short-write.patch` applied, then restored | aa2a42e50 + patch | QEMU x86-64 | 1 (expected) |

`control-whole-change.patch` is `git diff 3891c42c4 bd873e9a4 -- kernel sdk system`, which is every
product change and none of the tests. Reverse-applied, it leaves the new tests on the base code:
`dev_null` fails at `open` and `stdio_named`'s null-stdin child is ended by a handle fault.
`mutation-short-write.patch` makes the null's write answer n-1. `dev_null` then reads "write
answered 4095" and `stdio_named`'s null writer exits 7.

aa2a42e50 and bd873e9a4 differ only by the rebase over ToyOS #967, which touches only
`kernel/src/arch/x86_64/tlb.rs`'s test-actuator delay.

## Round 1 review fixes (head 84ca69ac9)

Logs in `round2/`. Every guest log ran at 715af5c4b, the fix commit. The commit after it,
84ca69ac9, only adds `tests/images/launchcase.toml` to `build/build.rs`'s `ALL_CONFIGS`.

| log | command | revision | exit |
|---|---|---|---|
| `r2-guest-final.log` | `cargo test --test toyos-build -- libc_children a_launch_gives_each_unsent_stdio_slot_a_null` | 715af5c4b | 0 |
| `r2-ci-host.log` | `cargo run -- --ci host` | 715af5c4b | 1: 86 of 87 steps green; the red step is `every_shipped_boot_config_is_covered`, because launchcase was not yet in `ALL_CONFIGS` |
| `r2-build-lib.log` | `cargo test --lib` (that step) | 84ca69ac9 | 0 |
| `r2-build-x86_64.log`, `r2-build-aarch64.log` | `cargo run -- --build-only --arch ...` | 715af5c4b | 0 |
| `control-fopen.log` | `libc_children` with `control-fopen.patch` reversed (fopen's own open path back) | 715af5c4b minus fix | 1: `fopen "w"` NULL, errno 13 |
| `mutation-launch-stdin-only.log` | launch row, supervisor fills only stdin | 715af5c4b + patch | 1: `[supervisor pid=6] nothing-sent-said-this` heard |
| `mutation-launch-stdout-stderr-only.log` | launch row, supervisor fills only stdout/stderr | 715af5c4b + patch | 1: guest stalls (cat reads the supervisor's console) |

`r2-launch.log` is the first green run of the launch row, with the test's final form before it was committed.
