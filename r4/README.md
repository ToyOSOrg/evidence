# ToyOSOrg/ToyOS#1227, round 4: rebased onto #1226

Head f341be8d9, on main bd0758158 (#1226 merged).

- **The conflict**: `sdk/libc/src/posix_io.rs`, libc's `dup2`. #1226 made it one line, because the table's owner forgets a stream's answer itself, and that line still called `fd_errno`. This branch deletes `fd_errno` and kept the old `match` that called `stdio::forget`, which #1226 deleted. The resolution keeps #1226's line, with this branch's table: `unsafe { toyos::fd::dup2(old_fd, new_fd, true) }.unwrap_or_else(|e| refuse(crate::errcode::of(e)))`, as `dup` above it reads. No other file conflicted, and no name this branch removed is used on main.
- `guest/green-7826f4f39-run43084578853.log`: run 43084578853 at 7826f4f39, `libc_children virt_user_copy_faults`, exit 0, 2 of 2. It is superseded by the run at f341be8d9, run 43107765943, which is this head's landing run.
- `host/f341be8d9/`: `cargo test -p toyos`, both toyos clippy shapes, `cargo test -p toyos-libc-copies` and its clippy, with the adopted lints and `-D warnings`: all exit 0. libc's `posix_io.rs` is guest-built, so the guest run is what compiles the resolution.
