# Review r2: a write's runs are at least a request long (head 8be159d4c)

## Why placement departs from a page at a time (metal, probe2)

The `disk-path-probe2:` lines in each boot's `.txt`. Every verdict is `passed` (`verdicts.txt`).

| boot | allocator | the 8 MiB file | a round's flush | `persist.seq_write_fsync` p50 |
|---|---|---|---|---|
| X-B-t14, X-B-amd, X-B2-amd | page at a time (#1113 + probe) | 103–106 runs, ~100 of them single blocks | 163–169 requests, 100–105 of them single blocks | T14 175, AMD 524 and 527 |
| X-C2-t14, X-C2-amd | r1: first fit, one call | 106 runs, as above | 168–171 requests | T14 208, AMD 657 |
| X-C-t14, X-C-amd (stale) | round 0: whole remainder, longest run | 8 runs of 256 | 67–72 requests, 64 full | T14 236, AMD 640 |

## Host checks

- `ci-host-r2.log`: `cargo run -- --ci host` at 8be159d4c (`ci-host.rev`), 105 steps green. `ci-host-r2.try1.log` is the first run, at the commit before the amend, red on clippy `default_trait_access` in the test's `Sparse` constructor. That was fixed in the amend.
- `r2-bcachefs.log` (180 unit, 57 integration) and `r2-fileserver.log` (91), both exit 0.
- Red controls, each a diff applied, run with `cargo test -p bcachefs --release --lib fs::tests::a_write_`, and restored byte for byte:
  - `red-r5-no-min-run`: runs of any length. Exit 101; `a_write_skips_single_holes_for_a_run_a_request_long` fails. The file got `[(4, 1), (261, 63)]` where `[(66, 64)]` was wanted.
  - `red-r6-no-fallback`: a pass per run. Exit 101; `a_write_on_a_volume_of_single_holes_passes_its_bitmap_twice_at_most` fails, with 16 runs reading the bitmap 167 times. The head reads it 55 times, within the bound of 64.

Paths under the agent's home and scratch are masked.
