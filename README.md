# PR #1118: a write's pages are allocated at once

## alloc/

- `ci-host.log`: `cargo run -- --ci host` at fb5adb524 (`ci-host.rev`: revision and exit code), 105 steps green.
- `bcachefs-test.log` (`cargo test -p bcachefs`) and `fileserver-test.log` (`cargo test -p fileserver`), both exit 0. They ran on the change before its rebase onto #1113's r1; the rebase touched neither crate's code under this change, and the host check above ran after it.
- Red controls, each a patch on the change, applied, run with `cargo test -p bcachefs --lib`, then reverted, with the exit code at the end of each log:
  - `red-m1-per-block-bitmap-writes`: `set_range_used` writes per block. Exit 101; `a_range_of_pages_is_allocated_with_one_write_per_bitmap_block` fails.
  - `red-m2-one-page-per-run`: `allocate` asks for one page per run. Exit 101; the same test fails.

## metal/

`request.txt` and `sha256.txt` hold the staged A/B, shared with #1113's round 1. `probe2.patch` is the measurement-only probe both of this A/B's images carry.

Paths under the agent's home and scratch are masked.
