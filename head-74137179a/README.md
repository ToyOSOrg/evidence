# PR 1004, review round 1, head 74137179a

- `s1-r1-checks.log`: `cargo test -p toyos --lib && cargo test -p toyos-net-node && cargo clippy -p toyos --all-targets -- -D warnings` at 74137179a, exit 0.
- `r1-control.log`: the negative control for R1. `r1-control.patch` (rung's `|| self.shut(page)` removed) applied with sed, `cargo test -p toyos --lib a_shutdown_under` run: exit 101, the new assertion fails (`Rings { connection: false, bell: false }`); restored, and the same test passes (exit 0).
- Reused: head-cc07115b5's host CI, loom suite and controls. This round changes one host test, `rung`'s callee parameter name, and `net::stream`'s ring error match; no loom model, ordering or gate code changed.
