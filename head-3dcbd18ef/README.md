# PR 1012, review round 1, head 3dcbd18ef

- `ci-host.log`: `cargo run -- --ci host` at 3dcbd18ef, exit 0, 95 steps green.
- `checks.log`: `cargo test -p toyos --lib && cargo test -p toyos-net-node && cargo clippy -p toyos --all-targets -- -D warnings && cargo test --test toyos-build -- stream_holders stream_exported_to_a_child libc_children` at 3dcbd18ef, exit 0. The three guest tests take every holder handle through the narrowed rights (B1): a connect, an export's adoption, and libc's connect.
- Reused: head-bf87cd135's controls and `--build-only`. This round changes three rights constants (covered by `checks.log`'s guest runs), docs and issue text, and the order of netstack's export (place first), which no control mutates.
