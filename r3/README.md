# ToyOSOrg/ToyOS#1226, round 3: review r1's fixes

Head 49bcdc369, on main 45935f4b9. It merges cleanly with main e558cc153, which touches none of this branch's files.

- One guard, `Asking`, takes `ASKING` and names its thread the asker until it drops. `answer()` and `changed()` both hold the lock only through it, so a panic raised in `changed()` (its partial line's clock stamp) writes its message to the descriptor rather than waiting on the lock its own thread holds. `dup2` onto itself no longer calls `changed`. The open record names its chosen exit and the 2 MiB per redirect.
- `host/49bcdc369/`: `cargo test -p toyos`, `cargo clippy -p toyos --all-targets` and `cargo clippy -p toyos --lib --features fd-table`, with the adopted lints and `-D warnings`: all exit 0.
- `metal/stage-49bcdc369.log`: `cargo test --test toyos-build -- --metal --metal-readback <dir> boot:testcases`, exit 2 (Staged); `metal/request-49bcdc369.txt` lists `testcases` and `testcases-watchdog`. It replaces round 2's staging.
- Guest rows at 49bcdc369, round 1's 8-row filter: run 43080395535, dispatched. Run 43074728873 at b149ff2f9 was cancelled unrun, superseded by this head.
