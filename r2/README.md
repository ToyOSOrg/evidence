# ToyOSOrg/ToyOS#1226, round 2: rebased onto #1234's descriptor table

Head b149ff2f9, on main 45935f4b9. #1234's owner changes descriptors through `change(..)`, and `fd::hold` can take its writer lock. Each `changed(fd)` is called after `change(..)` returns, never inside its closure. An ask holds `ASKING` and may take the writer lock, so the only lock order is `ASKING` then the writer lock.

- `host/b149ff2f9/`: `cargo test -p toyos` (the table's model tests among them), `cargo clippy -p toyos --all-targets` and `cargo clippy -p toyos --lib --features fd-table`, with the adopted lints and `-D warnings`: all exit 0.
- `metal/stage-b149ff2f9.log`: `cargo test --test toyos-build -- --metal --metal-readback <dir> boot:testcases`, exit 2 (Staged); `metal/request-b149ff2f9.txt` lists the `testcases` and `testcases-watchdog` images. It replaces round 1's staging at 7561f88e1.
- Guest rows at b149ff2f9, round 1's filter: run 43074728873, dispatched; its result is appended when it lands.
