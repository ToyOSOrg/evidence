# ToyOS PR #1021: evidence

Branch `wt/state-view`. `revisions.txt` lists the branch's commits, newest first; the head is `2d1a26b8d`. Paths are
masked: `<scratch>` is the agent's scratch directory, and `~` is the home directory.

| File | Command | Revision | Exit | Target |
|---|---|---|---|---|
| `host-1.log` | `cargo run -- --ci host` | the first commit's tree before it was committed (same files as `abe661592`, minus the `make_home` rename) | 0 | host |
| `host-2.log` | `cargo run -- --ci host` | `2d1a26b8d` | 0 | host |
| `build-only.log` | `cargo run -- --build-only` | `2d1a26b8d` | 0 | image |
| `guest-2.log` | `cargo test --test toyos-build -- a_row_reaches_its_own_state_and_no_other` | `abe661592` plus the uncommitted registration later committed as `2d1a26b8d` (same tree) | 0 | QEMU x86-64, `tests/images/testcases.toml` |
| `guest-mut.log` | the same, with `mut-state-whole.patch` applied, then reverted | as above | 1 (red by name, as intended) | QEMU x86-64 |
| `mut-state-whole.log` | `cargo test -p toyos-manifest` with `mut-state-whole.patch` applied, then reverted | `abe661592` | 101 (red by name, as intended) | host |
| `metal-prep.log` | `cargo test --test toyos-build -- --metal --metal-readback <scratch>/metal-app-view app_view` | `2d1a26b8d` | 2 (staged; no machine touched) | `proctreecase` image, for the orchestrator's run |
