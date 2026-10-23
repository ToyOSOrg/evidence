# PR 1012, review r3, head 9173915f5 on main 35e930136

Each log's first line is the revision it ran at.

- `ci-host.log`: `cargo run -- --ci host`, exit 0, "101 step(s), all green".
- `build-only.log`: `cargo run -- --build-only`, exit 0.
- `guest.log`: `cargo test --test toyos-build -- stream_holders stream_exported_to_a_child libc_children`, exit 1.
  - `stream_holders` and `stream_exported_to_a_child` pass.
  - `libc_children`: `libc_recv_beside_close` passes, with no handler and under a kept `SIGCHLD` handler. The only failure is `spawn_children_cap` (ended 134, `Poller::new: inbox_setup failed: ResourceExhausted`).
- `libc-children-on-main-63bc8a32b.log`: `cargo test --test toyos-build -- libc_children` at `origin/main` 63bc8a32b, in this worktree. Exit 1, with the same `spawn_children_cap` failure and message, so that red is main's. (At the previous head it showed as `posix_spawn ... answered 12` / status 0xb, on main as well.)
- `recv-number-wait-control.patch` / `.log`: the negative control for the libc stream wait. It makes `read_stream` wait through `wait_fds` on the descriptor number again, as before this round. Applied with `git apply`, run, and reversed in the same run. The log starts with the base revision and the applied diff. `cargo test --test toyos-build -- libc_children` exit 1. `libc_recv_beside_close` is red on its claim: "the child-handling's recv never looked at its stream again once its descriptor's number named a pipe".
