# Evidence for ToyOS PR #1210

Where a boot came from is the supervisor's to read, not the kernel's.

- `host/ci-host.log`: `cargo run -- --ci host` on the tree of `cccaf1e0f`, macOS arm64, exit 1 with 109 of 110 steps green.
- `host/build-only.log`: `cargo run -- --build-only` on the same tree, exit 0.
- `host/rust-tests-lock.log`: `cargo metadata --locked --offline` in `tests/guest/rust-tests`, exit 0 (empty: it said nothing).
- `controls/`: two mutations of `lib/bootnames`' parser, each patch with the test run it reds.
- `guest/run-42941582777.log`: the guest-rows run at `3b2d0a999`, and `guest/run-42941582777-console-excerpt.log`, five lines of one x86-64 boot's console from its artifact.
- `guest/run-42940981023-filter-refused.log`: an earlier dispatch the harness refused for a filter word that names no row; it ran nothing.
- `metal/`: the staged requests for both benches and the staging runs' logs. No machine was touched.

Paths, user names, the runner's names and its CPU model are masked.

`bytes/`: every binary `cargo run -- --build-only` leaves under `target/*/toyos`, hashed at `3b2d0a999` (the staged revision) and at `f7a54f7ae`, both built in one worktree. 42 of 45 are identical. `sections.txt` and `symbols.txt` compare the other three (`elfcmp.py`, `symcmp.py`): every allocated section but the build-id note is identical, and the symbols are equal once the `.llvm.<hash>` suffix of a ThinLTO-promoted name is set aside.
