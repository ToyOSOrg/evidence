# PR #1190 r4 (head `701156896`)

| log | command | exit |
|---|---|---|
| `f10-ci-host.log` | `cargo run -- --ci host` at the head | 0, 109 steps |
| `f10-lk.log` | `cargo test` in `system/logkeeper` | 0, 27 passed |

`f10-controls.log` holds two controls, each applied, run and restored:
- with `Volume::lost` not rolling back to the last sync,
  `a_stop_refused_after_an_unsynced_write_counts_from_the_last_sync` fails;
- with `ours` listing directories, `a_first_part_refused_at_open_is_made_and_given_the_boot`
  fails, because the part opens at the next number.
