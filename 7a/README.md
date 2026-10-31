# #1123: memory stage 7a

Head ae980c4c0, base 28a8aac17 (main 49559ddb2 plus the reopen_read_4k row).

- `host.log`: `cargo run -- --ci host` at ae980c4c0, exit 0, 107 steps green.
- `qemu/`: on QEMU x86-64, the testcases shared boot through the harness's `--debug` mode (`qemu-members.sh`) at ae980c4c0: `a_served_file_reads_through_its_paged_object`, `served_file_offset`, `an_export_shares_its_descriptions`, `std_fs`, `file_mtime`, `disk_backtrace`, each exit 0. The boot itself serves LOG through its pager.
- `controls/`: each mutation applied, its test run, restored (`mutate.py`).
  - `1-all.log`: on the pre-rebase tree. The three pure fixes, the range walk, the data pass-by, the cut-back and the dirty marking are red. Two were green; their tests were strengthened.
    - The withdrawal-walk mutation reds by a hang, killed by hand.
  - `2-strengthened.log`: those two, red.
  - `3-after-rebase.log`: every file server control again on ae980c4c0, red.
  - Each log's last line lists uncommitted test edits of that moment, not mutation sites.
- `ab/`: the metal A/B staged with `--metal-readback`; nothing has run.
