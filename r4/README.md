# PR #1190: the row on the guest runner

| run | head | result |
|---|---|---|
| 42036984718 | `a99667bf0` | The row reached the refusal, then `run_test` refused a job not handed over as a test binary. `the_log_lands_on_the_boot_stick` passed. |
| 42038743967 | `0939e4e24` | cpu0's records parted from the console's at the job, because `run_test` takes the job's window off the console. |
| 42040641298 | `6405def8d` | **Green:** `a_refused_log_is_written_whole_once_the_volume_takes_it` PASS ("3 file(s), 165 kernel records, the console's in order"), and `the_log_lands_on_the_boot_stick` PASS. |

The runner's paths are masked as `<runner>`.
