# PR 1012, rebased onto main 777c8c524, head 31da5a0cd

- `ci-host.log`: `cargo run -- --ci host`, exit 0, 101 steps green.
- `build-only.log`: `cargo run -- --build-only`, exit 0.
- `guest.log`: `cargo test --test toyos-build -- stream_holders stream_exported_to_a_child libc_children`, exit 1.
  - `stream_holders` and `stream_exported_to_a_child` pass.
  - `libc_children` passes every program but `spawn_children_cap`: `posix_spawn ... held answered 12`. Its S2-relevant programs pass: `libc_recv_beside_close`, and #1011's `libc_read_restarts` and `signal_sigchld_ignored`.
- `libc-children-on-main-777c8c524.log`: the same `cargo test -- libc_children` on main itself, in this worktree checked out at `origin/main`. Exit 1, with the same `spawn_children_cap` failure, so that red is main's, independent of this change.
- `guest-at-bd1fdc3ce-base.log`: the first rebase, onto `bd1fdc3ce`. It shows:
  - `stream_holders` red: the parent's spawn of its child answered `NotFound`. That is `stream-holders-notfound.log`, fixed in `31da5a0cd` (its children keep the test's names, so they reach a file server).
  - One `signal_sigchld_ignored` failure: `waitpid` of child 86 succeeded under `SIG_IGN`. It passed on the next two runs here and on main. It reads as a window in #1011's `wait_child`: `forget_ended()`, then a re-read of the table under a new lock, which reaps a child that ended between the two.
