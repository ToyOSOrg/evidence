# Rebase onto main 40e528614, head 814a607a1

- The only conflict was `sdk/abi/src/syscall.rs`: #1040 took syscall number 136 (`SYS_MACHINE_STOPS`). `SYS_PREAD` and `SYS_PWRITE` are now 137 and 138, and `SYSCALL_PROFILE_BINS` is 140.
- B4 (#1039) rewrote `system/fileserver/src/root.rs` behind the same `Volume` trait, and its `set_mtime` refusal merged without conflict.
- `host/ci-host.log`: `cargo run -- --ci host`, 102 steps, exit 0.
- `qemu/`: QEMU x86-64 `--debug` boot at 814a607a1. Its build compiled `tests/guest/rust-tests`.
  - `214`, `211`, `206`, `210` and `202_stat_mtime` match their `.expect`.
  - `std_fs`, `std_fs_write`, `stat_identity`, `an_export_shares_its_descriptions`, `fs_truncate_persist`, `empty_dir_stat` and `std_process` exit 0.
  - `std_fs` and `210` read `/system` through B4's `RootVolume` over protocol v2: `std_fs` lists `/system/bin` and reads its own binary.
