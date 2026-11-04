# #1152 round 7: the replay window at osbench's full repetitions

r4 BLOCKER 1. `hang.rs` (scratch harness, not committed) gains
`osbench_full`: osbench's persist and fs.disk call sequence at its full
repetitions (each loop of the tenth-scale `osbench` times ten), on a
sparse file model of the T14's DATA (44 564 480 blocks, journal 1/128 of
the device, about 1.3 GiB). `full_write` formats, runs it and drops the
volume without unmounting; `full_read` mounts it in the file server and
makes the first mkdir. Each run under `/usr/bin/time -l`, the engine at:

| engine | log | peak resident | mount | first mkdir |
|---|---|---|---|---|
| f433570e3 (no cap) | `full-*-before.log` | 3.74 GB | 12.51 s | 0.781 s |
| live entries held to 32 MiB | `full-*-live-cap.log` | 1.70 GB | 1.19 s | 0.017 s |
| and the scan keeping only the window's records (bdf062cd3) | `full-*-final.log` | 0.20 GB | 1.10 s | 0.018 s |

The writer's own peak is about 0.14 GB in each. With the cap alone the
scan still held every stale entry of the 1.3 GiB ring.

Controls (`mutations/`, applied, run, restored): the writer without the
cap (`uncapped.*`) reds a_writer_held_to_some_buckets_offers_what_a_ring_of_that_many_does
(32 against 12 entries); the scan keeping every record (`kept.*`) reds
a_scan_keeps_no_records_of_entries_behind_a_flush_entrys_last_sequence.

## Checks at 62e24c902 (main e740f01ac merged)

- `ci-host-62e24c902.log`: `cargo run -- --ci host`, exit 0, 108 steps.
- `aarch64-virt-rows-*.log`: `cargo run -- --ci rows "virt_jobs_at_el2 virt_smp
  virt_user_mode virt_readonly_copyout a_bent_supervisor_is_refused_and_the_other_slot_boots --jobs 1"`
  at aecd87eca and 62e24c902: 5 passed, 0 failed each, but HOST NOT QUIET
  (other work 2.2 CPUs on average: the desktop's own processes), so no
  verdict.
