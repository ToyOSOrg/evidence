# Review round 1 (head 8c3bfd2b5)

- `r1-after.log`: `cargo test -p fileserver --release`, 91 passed, exit 0.
- `r1-control.diff`/`.log`: the drop-back undone (no blocks given back on the copy's refusal). Exit 101; the test fails at the room check, "the refused write kept blocks". The file was then restored byte for byte.
- `ci-host-r1.log`: `cargo run -- --ci host` at 8c3bfd2b5 (`ci-host.rev`), 105 steps green.

Paths under the agent's home and scratch are masked.
