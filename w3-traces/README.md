# ToyOSOrg/ToyOS#1128 at 214171259a226994b8efc2b54348a133de07d30b

These are W3's trace answering tests for the AX200 (`system/ax2xx/driver/tests/traces.rs`). Paths are masked: `<dev>` is the developer's source directory and `~` is home.

- `ax2xx-tests.log`: `cargo test -p toyos-ax2xx`, exit 0, at the revision above.
- `ci-host.log`: `cargo run -- --ci host`, exit 0, 107 steps, at the revision above, macOS aarch64 host.
- `traces.sha256`: hashes of the two trace files as committed. They equal pr-876's `spec/traces` at 9b841a5fd312a0cd6ae341dc8c0dec1e3f6fa204.
- Negative controls, in `controls-at-head/`, at the revision above. Each patch is only the mutation, applied to the committed tree. Each was built (the log shows the crate compiling), run with `cargo test -p toyos-ax2xx --test traces`, and restored with `git checkout` in the same run. The log ends with the exit code and an empty `git status`.
  - `control-band`: swaps the 2.4 and 5 GHz band encoding. Exit 101: Run13 fails and the other three tests pass.
  - `control-umac`: shifts the UMAC table's data index by one. Exit 101: Run11 fails and the other three tests pass.
- The top-level `control-*.patch` and `control-*.log` are the first round, superseded. They ran before the commit, and `control-band.patch` also carries the then-uncommitted `Command::header` hunk, so it is not a mutation on its own. Kept because this branch is append-only.
