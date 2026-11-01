# #1123 review r1

Head 265581dda (host CI, QEMU and controls ran on its tree, committed first as dbfe62579 and its successor, squashed with the same tree).

- `host.log`: `cargo run -- --ci host`, exit 0, 107 steps green.
- `qemu/`: QEMU x86-64.
  - testcases shared boot through `--debug`: `a_pager_s_end_answers_its_waiting_holders_gone` (pagerprobe: the pager is refused a holder's read; a helper parked on an unsupplied page answers `Gone` when the pager ends), `a_served_file_reads_through_its_paged_object`, `served_file_offset`, `std_fs`, `file_mtime`, each exit 0. `app_view` needs proctreecase's rows and is in the metal request.
  - `linkcase.log`: `a_link_ends_under_a_held_stream_and_comes_back`, PASS.
  - Two earlier attempts in this round found defects fixed in the head: a SYSTEM server panicking at a holder's mint with no pager, and an owner read deadlocking on the pager's lock; and the first linkcase run found a pager's index asking the kernel heap for one block past its largest allocation.
- `controls/mutations.log`: eleven controls, each applied, run and restored, each red.
- `ab/request.txt`: the metal A/B staged with `--metal-readback`; nothing has run.
