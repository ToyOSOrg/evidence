# #1026 review round 2

Head 2b38b4f06, rebased onto main 35e930136 (#1023 is on main).

- `ci-host.log`: `cargo run -- --ci host` at 2b38b4f06. Exit 0, 101 steps
  green; the rebase changed `Cargo.lock` (#1020).
- `controls/d1-one-timeout-per-write.patch`: round 1's semantics, the time
  left set once and then `write_all`. It fails
  `a_write_to_a_slow_reader_ends_at_the_deadline`: 200 bytes written over
  5.4 s against a 200 ms deadline (`d1-one-timeout-per-write.test.log`). The
  patch was applied after `git apply --check` and reverted; the tree ended clean.
- A loopback test whose client floods and reads at 4 KiB/s was tried and
  dropped: it passed under round 1's code too (closed at 2.0 s both ways),
  because the loopback buffers absorbed the answers and no write was in
  progress at the deadline. The write loop is held directly instead.
