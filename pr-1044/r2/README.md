# ToyOS #1044, round 2 (review r1's blocker)

Revision: ToyOS 076395600 (the run was on its working tree before commit).

- `ci-host.log`: `cargo run -- --ci host`, exit 0 (last line). Its `FAILED`
  lines are other components' expected negative controls.
- `classify/fullk.txt`: the speccheck cases under RFC 8032 section 5.1.7's
  literal equation, with k the unreduced 512-bit integer (double-and-add
  over its bits). Case 3 fails the cofactorless equation (k = 3 mod 8) but
  holds the cofactored one; r1's `speccheck.txt` shows it holds with k mod L.
  This confirms the reviewer's probe. `classify/src/main.rs` (`fullk`) is
  the tool.
- r1's controls still apply: r2 changes only comments, docs and one test
  rationale string.
