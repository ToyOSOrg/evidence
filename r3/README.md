# ToyOSOrg/ToyOS#1227, round 3: review r2's fix

Head 7826f4f39, on main e558cc153. It merges cleanly with main at the time of the push.

- `startup::bytes` answers `Said`, whose field is private and which only `bytes` makes, and `startup::Block::new` takes a `Said`. A `Block` therefore again holds only a laid-out block of at most `MAX_BLOCK` bytes, which `Program::starting_with` relies on. `starting_block` answers a `Said`, and the callers read as before.
- `host/7826f4f39/`: `cargo test -p toyos` (startup's and the `MAX_ARGS` tests among them), `cargo clippy -p toyos --all-targets` and `cargo clippy -p toyos --lib --features fd-table`, with the adopted lints and `-D warnings`: all exit 0.
- `metal/stage-7826f4f39.log`: `cargo test --test toyos-build -- --metal --metal-readback <dir> boot:testcases`, exit 2 (Staged); `metal/request-7826f4f39.txt` lists `testcases` and `testcases-watchdog`. The image's corpus expects `sysconf _SC_ARG_MAX: 2088939`.
- Guest: run 43084578853 at 7826f4f39, `libc_children virt_user_copy_faults`, dispatched; its result is appended when it lands.
