# PR #1154 r2: the CR4 refusal names the bits; build.rs doc; guard-page record held

Revision f6bb93f53. Apple silicon host, x86-64 q35 under TCG.

| File | Command | Exit |
|---|---|---|
| clippy.log | `cargo run -- --clippy` | 0 |
| build-lib.log | `cargo test -p toyos-build --lib` | 0 (375 passed) |
| boot-x86_64.log | `cargo test --test toyos-build -- vector_state_survives_a_switch` | 0 |

The change since r1 runs only in `control_regs::declaration`'s refusal and
in a const assertion; the queued metal at 938c4a7cb judges the same
decisions.
