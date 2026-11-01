# PR #1144 r0 (FS stage 3a, on #1141): host CI, QEMU members, negative controls, the staged A/B

Head: 70af9e75a (fs-3a).

- **`host.log`**: `cargo run -- --ci host` at 70af9e75a, rc=0, "108 step(s), all green".
- **`qemu/`**: the testcases boot via `--debug` (x86_64 QEMU), rc=0.
  - Run on the tree before #1141's review r1 was restacked under it. That restack changed only comments in `.rs` files (`git diff` filtered to non-comment lines is empty), so the run stands for this head.
  - Members, each exit 0: `a_held_files_fstat_is_its_servers_stat`, the tear member, `a_served_file_reads_through_its_paged_object`, `served_file_offset`, `a_pager_s_end_answers_its_waiting_holders_gone`, `std_fs`, `file_mtime` and `stat_identity`.
- **`qemu/control-G2/`**: the kernel's stat publishes mtime 0. The new member is red at "after the open: the held fstat, then the server's stat". That also shows a held `fstat` is the kernel's answer, not the server's.
- **`controls/`** (`mutate.py`): each mutation built and is red against its test.

| control | site | mutation | test |
|---|---|---|---|
| C8 | `pages.rs` write | hands the object mtime 0 | `an_objects_size_and_mtime_are_the_volumes_after_every_change` |
| C9 | `pages.rs` `stamped` | stamps a fixed time | same |
| C10 | `fat.rs` `node_meta` | ignores the recorded write time | `a_files_mtime_is_its_last_write_s_through_its_handle_and_after_a_reopen` |
| C11 | `fat.rs` `level` | stamps now, not the write | same |
| C12 | `kernel/pure/paged.rs` `published` | publishes during a write | `paged::tests` |

  - C10 first passed, because the test created and wrote the file at one clock reading. I fixed the test to move the clock between the two, and then C10 and C11 went red. `control-C10-*.log` is the red run.
- **`metal-staged/`**: the rules, set before any boot, and the request. Not run.
