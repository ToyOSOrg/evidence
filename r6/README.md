# ToyOSOrg/ToyOS#1227, round 6: rebased onto main 3c5c55584 (#1261, #1239)

Head a92cc309e. The previous head 96b79b6c4, which guest run 43122100459 tests, is kept fetchable as `hold/sdk-one-error-table-96b79b6c4`. `range-diff-96b79b6c4-a92cc309e.txt` shows the whole difference: commits 2 to 5 are patch-identical, and the first commit differs only by the lines below.

**Conflicts, each resolved by keeping both sides:**
- `sdk/libc/src/errcode.rs`: main (#1261) added `SyscallError::Busy => EBUSY` to the old kernel-word table, which this branch replaces with the one table from `Failure`. Kept: this branch's table, where `Failure::Busy` was already `EBUSY`, and `SyscallError::Busy => Self::Busy` in `From<SyscallError> for Failure` (`sdk/toyos/src/failure.rs`). libc's answer to `Busy` is `EBUSY` either way.
- `sdk/std/sys/pal/mod.rs`: main added `SyscallError::Busy => ErrorKind::ResourceBusy` to the old `to_io_error`, which this branch replaces with `failed`. Kept: `failed`, where `Failure::Busy` was already `ResourceBusy`. std's kind for `Busy` is `ResourceBusy` either way.
- `sdk/libc/src/posix_io.rs`, `open_handle`: main (#1239) made `files::export`'s answer `.into_owned().into_raw()`, and this branch made the line's refusal `crate::errcode::of`. Kept: main's `.into_owned().into_raw()` with this branch's `errcode::of`.
- Added beside the arm: `(Busy, "EBUSY")` in libc's POSIX-name test of the kernel's words.

**Checks at a92cc309e:**
- `host/a92cc309e/`: `cargo test -p toyos`, both toyos clippy shapes, `cargo test -p toyos-libc-copies` and its clippy, with the adopted lints and `-D warnings`: all exit 0.
- `build/build-only-a92cc309e.log`: `cargo run -- --build-only`, exit 0. It built the sysroot, std and libc among it, which no host check compiles, and the image.
