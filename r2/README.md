# #1123 review r2

Head dd8821553 (its tree was committed first as the r2 work-in-progress commits; squashed with the same tree).

- `host.log`: `cargo run -- --ci host`, exit 0, 107 steps green.
- `qemu/`: QEMU x86-64, testcases shared boot through `--debug`: `a_pager_s_end_answers_its_waiting_holders_gone` (now also: one object past 512 MiB withdrawn whole, released, a second release refused, another left for the pager's end; a pipe end sent as a holder refused and the asker alive), `a_served_file_reads_through_its_paged_object`, `served_file_offset`, `std_fs`, `file_mtime`, each exit 0.
- `controls/host-mutations.log`: eleven host controls, each red.
- `controls/guest-*`: two guest controls on QEMU, each applied, run and restored (`guest-mutate.sh`):
  - `r3-gathered`: a removal collecting its frames in a list again panics the kernel at 2,097,152 bytes past MAX_HEAP_ALLOC;
  - `r1-typed`: a holder's read resolving by type again kills the helper at the pipe check.
- `ab-r1/`: the metal A/B at base 28a8aac17 against head 265581dda, both benches, every boot passed; `p50.txt` from `rows.log` by `controls/table.py`, columns base-1 head-2 base-3 head-4.
- `request.txt`: the runs owed at dd8821553.
