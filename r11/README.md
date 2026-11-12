# PR #1269, round 11: rebased onto main 302fb3698 (#1252)

All on macOS arm64.

## The rebase

**The conflicts.** #1252 removed the namespace system calls and label handling from the kernel. The rebase conflicted in `kernel/src/syscall/dispatch.rs` and `kernel/src/syscall/ipc.rs`, in one commit: B5's `Review r1 of #1269: every copy a syscall makes answers its own cause`.
- B5 had changed three copies inside the namespace build so they answer their own cause. Those were the build's argument record and its two vectors, and #1252 deleted that code.
- The resolution takes main's side in both hunks. Main's removal stays, and B5's other twelve sites stay.
- No line means something different.

**#1252's own new copies.** These are the spawn's endowment list read, and the copy-out of what it lays out. Both already answer `SyscallError::from(faulted)`, so in the composition they answer the copy's own cause through this PR's `Faulted`, as B5 asks.

**No flattened copy was added.** A search of the kernel for copy failures flattened to `BadAddress` (`copy_in … else`, `read_at/write_at(…).is_err()`, `map_or(bad_addr`) finds none that #1252 added.

**`range-diff-41f0e1195-ecfb2248a.txt`** compares `3c5c55584..41f0e1195` with `302fb3698..ecfb2248a`:
- 29 commits are `=`.
- B5's commit is `!`. It no longer edits the namespace code, and its message drops those sites from its list.
- `A lost mapped page ends a program as SIGBUS and a copy as Io…` is `!` only for a hunk header's context in `user_ptr.rs`.

## Checks at ecfb2248a, exit 0 each, full output

- `01.log`: `cargo test -p kernel --lib --features sched-check`, 514 passed.
- `02.log`: the kernel's clippy shapes, each `-D warnings`:
  - `-p kernel --lib --tests --features sched-check`;
  - `x86_64-unknown-none`, with no features and with `boot-actuators,test-actuators`;
  - `aarch64-unknown-none-softfloat`.
- `03.log`: `cargo run -- --build-only --boot-config tests/images/testcases.toml`. This compiles `mapprobe` against #1252's SDK and adds `bin/mapprobe`.
- `04.log`: `cargo run -- --build-only --arch aarch64 --boot-config tests/images/virtjobcase.toml`. This compiles `mapprobe` for AArch64.
