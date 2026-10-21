# ToyOSOrg/ToyOS#978, rebased after #971 and #980

`checks.txt`: head `3f6f5adee` on `af1c5af25` (#971): `--ci host` 0 (87 steps), both builds 0, the 12 QEMU rows 12/12.
`checks2.txt`: head `249293c2093355400f69d840d917d85cd2c10587` on `db0cf636d` (#980; clean rebase): `--ci host` 0, both builds 0, `console_image_boots libc_children desktop_without_x2apic` 3/3 (#980 touches std's and libc's allocator).

Conflicts with #971, each resolved on #971's side with #978's intent:
- `FileType::Keyboard`, which #971 deleted, dropped from libc's `isatty` and std's stdin;
- console's keyboard watch dropped, its stdout and stderr watched by `as_raw_handle`;
- `endowment_denied` claims `Framebuffer` through its `stdout()` handle.

Masked as in r2.
