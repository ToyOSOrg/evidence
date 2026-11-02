# PR #1144 r2: rebased onto #1141 r2

Head ca6340ef3 (fs-3a), on #1141's 029ca221c (main 058bea2d3). SYS_PAGED_STAT renumbered to 164 against main, whose last number is 163 (SYS_CURRENT_CPU); SYSCALL_PROFILE_BINS is 166. No other change to 3a's code.

- `3a-host.log`: `cargo run -- --ci host` at ca6340ef3 (`3a-host.rev`), rc=0, "109 step(s), all green".
- `qemu/`: `qemu-members.sh` (x86_64 QEMU, the testcases boot under `--debug`, macOS host) at ca6340ef3, clean tree, rc=0. All eight members exit 0: a_held_files_fstat_is_its_servers_stat, a_served_files_read_never_tears_against_its_write, a_served_file_reads_through_its_paged_object, served_file_offset, a_pager_s_end_answers_its_waiting_holders_gone, std_fs, file_mtime, stat_identity.
- Round 1's metal A/B (r1) still stands for the claim (fs.disk.fstat −96% on both benches): the held fstat path is unchanged, and only its syscall number moved.
