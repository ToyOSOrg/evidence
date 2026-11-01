# PR 1145, round 2

Host: macOS, Darwin 27.0.0, 14 CPUs. ToyOS `buildlock-wait` at 181eb4399 on
main ece8ef4e6. The runs below were made at the same code on main 9b3711cdb,
whose difference from ece8ef4e6 in `build/` is seven lines of `build.rs` that
touch no lock.

- `controls/`: each negative control as a patch against the fixed
  `build/buildlock.rs`, with its build log (exit 0) and its test log (exit 101).
  Patches a to c are against the fixed file before the last edit of
  `a_would_be_maker_does_not_wait_out_another_use` (a 10 s receive, asserted
  before the holder's release), which they do not touch; patch d is against
  the final file.
  - a: base code (origin/main) with `waiters_on_a_build_all_get_in`. 1 of 8
    admitted after a successful make.
  - b: `keyed_try_using` blocking in the kernel (`lock_shared`). 1 of 8.
  - c: `poll`'s deadline never checked. The 500 ms wait had not ended at 20 s.
  - d: `keyed_building` waiting rather than trying. The would-be maker waited
    out another's use for 10 s.
- `logs/suite.log`: `cargo test --test toyos-build` of seven guest tests, 12
  wide, on a head whose sysroot was not yet made. `const _: () = ();` was
  appended to `sdk/libc/src/alarmreq.rs`, uncommitted, and reverted after.
  Exit 0, 7 of 7. Six workers waited on `building sysroot b68c8b152facb43c`
  from 20:50:33, and all six were admitted at 20:53:31.
  - `suite-sysroot-made.log`: the same run with a comment appended instead,
    which changes no identity, so the sysroot was already made (exit 0).
  - `suite-misnamed.log`, `suite-one-arg.log`, `suite-shm-filter.log`: three
    attempts refused at the filter (a test absent from main, one zsh argument,
    a test this path does not run). Nothing was built in them.
- `logs/clippy-build.log`: clippy with the adopted lints over `toyos-build
  --all-targets`, with its command line. Exit 0.
- `logs/head-unit.log`: the buildlock tests at the head. Exit 0.
- `logs/fixed-unit.log`: the same tests before the rebase. Exit 0.

The branch head is now 5ee9f0878, the same tree as 181eb4399 with the first commit's message reworded.
