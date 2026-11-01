# ToyOSOrg/ToyOS#1128 at 214171259a226994b8efc2b54348a133de07d30b

These are W3's trace answering tests for the AX200 (`system/ax2xx/driver/tests/traces.rs`). Paths are masked: `<dev>` is the developer's source directory and `~` is home.

- `ax2xx-tests.log`: `cargo test -p toyos-ax2xx`, exit 0, at the revision above.
- `ci-host.log`: `cargo run -- --ci host`, exit 0, 107 steps, at the revision above, macOS aarch64 host.
- `traces.sha256`: hashes of the two trace files as committed. They equal pr-876's `spec/traces` at 9b841a5fd312a0cd6ae341dc8c0dec1e3f6fa204.
- Negative controls. Each was applied as a patch, built, run with `cargo test -p toyos-ax2xx --test traces` and restored in the same run. Both ran on the same ax2xx sources before the rebase onto main 1f74a559d. The rebase brought in only netstack changes, so their results still apply.
  - `control-band.patch` / `.log`: swaps the scan channels' band encoding. Run13 goes red.
  - `control-umac.patch` / `.log`: shifts the UMAC table's data index. Run11 goes red.
