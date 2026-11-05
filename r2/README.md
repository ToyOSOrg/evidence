# PR #1190 r2 (head `8523f4394`)

| log | command | exit |
|---|---|---|
| `f4-ci-host.log` | `cargo run -- --ci host` at the head | 0, 109 steps |
| `f3-lk-c.log` | `cargo test` in `system/logkeeper` (content of `9e04cbafc`) | 0, 24 passed |
| `f3-harness-build.log` | `cargo test --test toyos-build --no-run` (the new row compiles) | 0 |

`f3-lk-controls.log` holds four mutations, each applied, run and restored:
- counting the gap's note into the replay's offset (blocker 1) fails
  `a_refused_file_is_given_back_the_boot_the_replay_holds` "across the gap";
- padding a part shorter than its sync (blocker 2) fails it "after the part was cut";
- a rewrite ignoring the part's room (blocker 4) fails it on a 229-byte part against its 64-byte bound;
- a wait that does not double fails the retry test.

Each exits 101. Restored, 24 pass.
