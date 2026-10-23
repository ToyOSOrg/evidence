# PR 1012, rebased onto main a57ea0e8c, head c020727c6

Each log's first line is the revision it ran at.

- `ci-host.log`: `cargo run -- --ci host` at c020727c6. Exit 0, "101 step(s), all green".
- `build-only.log` and `guest.log` ran at 8bca27d3b. It differs from the head only in two claim strings that `stream_holders`' harness now requires (`tests/toyos.rs`). A build there also regenerated `Cargo.lock`; it does the same on main itself, and that drift is not committed.
  - `build-only.log`: `cargo run -- --build-only`, exit 0.
  - `guest.log`: `cargo test --test toyos-build -- stream_holders stream_exported_to_a_child libc_children`, exit 1. `stream_holders` and `stream_exported_to_a_child` pass, and so does `libc_recv_beside_close`. The only failure is `spawn_children_cap`, main's red (see head-9173915f5).
- `guest-stream-holders.log`: `cargo test --test toyos-build -- stream_holders` at fb1f47ed1, whose tree is the head's plus that regenerated `Cargo.lock`. Exit 0, with the harness requiring the two checks main's 76feab6d9 added, which are now carried onto the holders' netstack.
