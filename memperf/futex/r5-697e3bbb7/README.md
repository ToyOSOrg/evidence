# #1223 round 5 at 697e3bbb7: the count's order is the type's

`exits.txt` and `commands.txt` record the head's checks, each exit 0:
- the kernel library's tests with `sched-check` (463 passed);
- `cargo run -- --ci host models` (83 steps green);
- every kernel shape of `build/clippy.rs`: the two host shapes, six on x86-64 and four on aarch64.

**The broken forms do not compile.** Each was a scratch patch to `kernel/src/process.rs`, checked with
`cargo check -p kernel --target x86_64-unknown-none`, and then the file was restored byte for byte:
- `broken-E0505.patch` drops the guard before the wait. The check fails with `error[E0505]`: cannot move out of
  `wait` because it is borrowed (`broken-E0505.log`).
- `broken-E0515.patch` makes the guard a temporary inside the translating closure. The check fails with
  `error[E0515]`: cannot return a value referencing a temporary (`broken-E0515.log`).
- `broken-bypass.patch` hands the wait the wake's translation. The check fails with `error[E0308]`: a `&u64` where
  `&Translation<'_>` is expected (`broken-bypass.log`).

`restored.log` is the restored tree's check, exit 0. These ran on a tree whose `kernel/src` is byte-identical to
697e3bbb7's: the rebase onto main 3b93f3770 changed no file under `kernel/src`.
