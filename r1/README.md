# Review round 1 (head af6d08889)

- `ci-host-r1.log`: `cargo run -- --ci host` at af6d08889 (`ci-host.rev`), 105 steps green.
- `r1-bcachefs.log` (`cargo test -p bcachefs --release`: 178 unit, 58 integration, 2 crash and 2 doc tests) and `r1-fileserver.log` (`cargo test -p fileserver --release`, 90), both exit 0, on the same code.
- Red controls, each a one-line diff applied, run, and restored byte for byte, with the exit code at the end of each log:
  - `red-m3-longest-run`: `allocate` takes `alloc_up_to`, the longest run, again. `cargo test -p bcachefs --release` exits 101, and `a_range_is_placed_as_its_pages_one_at_a_time_would_be` fails.
  - `red-m4-no-undo`: a refused run clears nothing. `cargo test -p bcachefs --release --lib` exits 101, and `alloc_bitmap::tests::a_run_refused_halfway_leaves_nothing_marked` fails.
- Round 0's `red-m1` and `red-m2` (`alloc/`) were taken at fb5adb524. Since then the code they mutate has changed: `set_range_used` was rewritten here, and `want` now goes to `alloc_first_fit`. `red-m2`'s line, `want = 1`, still applies and makes allocation one page per run. Neither was rerun.

Paths under the agent's home and scratch are masked.
