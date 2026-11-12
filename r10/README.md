# ToyOSOrg/ToyOS#1227, round 10: rebased onto #1258, with TextBusy

Head 31855f8b4, on main ee15a2e5b. #1258 added the kernel word `SyscallError::TextBusy` (12) to the old tables, which libc answered `ETXTBSY` and std `ExecutableFileBusy`.

**Resolution**: `range-diff-c40194e84-31855f8b4.txt`. Commits 2 to 7 are patch-identical. In the first, `sdk/libc/src/errcode.rs` and `sdk/std/sys/pal/mod.rs` keep this branch's tables, and the composition is added:
- `Failure::TextBusy`;
- `SyscallError::TextBusy => Self::TextBusy`;
- libc `Failure::TextBusy => ETXTBSY` (main's `ETXTBSY` constant kept);
- std `Failure::TextBusy => ExecutableFileBusy`;
- `(TextBusy, "ETXTBSY")` in libc's POSIX-name test.
No other conflict arose.

**Checks at 31855f8b4:**
- `host/31855f8b4/`: `cargo test -p toyos`, both toyos clippy shapes, `cargo test -p toyos-libc-copies` and its clippy, and `cargo test -p netstack`: all exit 0.
- `build/build-testcases-31855f8b4.log`: `cargo run -- --build-only --boot-config tests/images/testcases.toml`, exit 0. It compiled std and libc with the new arms.
- Guest: run 43156966054 at b2946a672 stays the landing run. This head differs from it by the review commit c40194e84 (std's `TooBig` arm, docs and records) and this mapping, which the build compiles.
