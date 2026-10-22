# ToyOS PR #1021, review round 1: evidence

Head `b87201d34`, rebased onto `origin/main` `028244feb`. `revisions.txt` lists the branch's commits, newest first.
Paths are masked as in `../p0/README.md`.

| File | Command | Revision | Exit | Target |
|---|---|---|---|---|
| `r1-host.log` | `cargo run -- --ci host` | `b87201d34` | 0 (101 steps) | host |
| `r1-build-only.log` | `cargo run -- --build-only` | `b87201d34` | 0 | image |
| `r1-guest.log` | `cargo test --test toyos-build -- a_row_reaches_its_own_state_and_no_other` | `b87201d34` | 0 | QEMU x86-64, `tests/images/testcases.toml` |
| `r1-metal-prep.log` | `cargo test --test toyos-build -- --metal --metal-readback <scratch>/metal-osbench osbench` | `b87201d34` | 2: one `benchcase` image (13 jobs) staged, and no machine touched | the `osbench` metal row, for the orchestrator |
