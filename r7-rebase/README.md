# PR #1190 rebased onto main `3022fd718` (head `3d7e96592`)

- `range-diff.txt`: `git range-diff 4937c2bdc..<pre-rebase 17289151b's successor bc1285046> origin/main..3d7e96592`.
  The ten pre-rebase commits are folded into three: logkeeper, the row, and issues.
- `interdiff.txt`: the +/- lines of #1190's whole change before and after the rebase.
  It shows #1195's reconciliation: the opener thread kept, `adopt` reduced to taking
  the volume, `Hub::owed(&mut u64)`/`serve::Owed` dropped, and the stop waiting
  for an opener within `STOP_CATCH_UP`. It also shows #1196's stop mark written
  only over an open part.
- `ci-host.log`: `cargo run -- --ci host` at `3d7e96592`, exit 0, 109 steps. The first
  attempt refused to build until this worktree's fork checkout was moved to main's
  pin, as the build prescribes.
- `logkeeper-tests.log`: `cargo test` in `system/logkeeper`, 27 passed.
- `guest-42133377735.log`: the four rows at `3d7e96592`.
  - `acpi_press_is_one_sci`, `the_log_lands_on_the_boot_stick` and
    `a_clean_stop_proves_its_image` PASS.
  - `a_refused_log_is_written_whole_once_the_volume_takes_it` STALLED: `log_unfill`
    is refused, because #1196 made `/log` read-only to every row but the log keeper.
