# PR #1146 r0 (S0-a): host CI, QEMU members, the guest control, the staged boot

- **`host.log`**: `cargo run -- --ci host` at the PR head (`host.rev`), rc=0, 108 steps green.
- **`qemu/`**: the testcases boot via `--debug`, x86_64 QEMU, rc=0. `std_fs`, `served_file_offset`, `a_served_file_reads_through_its_paged_object`, `a_pager_s_end_answers_its_waiting_holders_gone` and `std_alloc` each exit 0, and the boot raised no refusal.
- **`qemu/control-G3/`**: `sys_paged_read` holds the current space's lock across the holder read's copy, applied by `mutate.py` and restored.
  - The kernel refused it at once: "a user copy under its own space's lock … its fault-in would wait on itself", with a backtrace through `PagerObject::read` and `View::pieces` (`panic-lines.txt`). Without the check, the copy would spin into the lock's `DEADLOCK` panic only if a page needed populating.
- **Reused evidence:** the QEMU runs predate one edit, which removed `#[track_caller]` from the check's panic and dropped its location from the message text. The check's logic is unchanged, so the runs stand.
- **`metal-staged/`**: one testcases boot per bench, with its rule stated in the request. Not run.
