# PR #1120: a write refused after allocating gives back the blocks it took

- `fix/before-fix.log`: the new test on the tree without the fix (`cargo test -p fileserver --lib --release a_write_refused_after`), exit 101: "page 1 reads 0xab, not zeros".
- `fix/after-fix.log`: `cargo test -p fileserver --release` with the fix, 91 passed, exit 0.
- `fix/ci-host.log`: `cargo run -- --ci host` at 41efb19aa (`ci-host.rev`), 105 steps green.
- `fix/fix.diff`: the change to `data.rs` beyond the test, as run.

Paths under the agent's home and scratch are masked.
