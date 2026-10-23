# Second rebase, onto main c677c1219, head 4d418cd35

- The only conflict was `sdk/abi/src/syscall.rs` again: #1027 took syscall number 137 (`SYS_BOOT_SOURCES`). `SYS_PREAD` and `SYS_PWRITE` are now 138 and 139, and `SYSCALL_PROFILE_BINS` is 141. In the areas this PR touches, #1027 changed only a dispatch arm.
- `host/ci-host.log`: `--ci host`, 102 steps, exit 0.
- `qemu/`: QEMU x86-64 `--debug` boot at 4d418cd35.
  - `214`, `211`, `206`, `210` and `202_stat_mtime` match their `.expect`.
  - `std_fs`, `std_fs_write`, `stat_identity`, `an_export_shares_its_descriptions`, `fs_truncate_persist`, `empty_dir_stat` and `std_process` exit 0.
