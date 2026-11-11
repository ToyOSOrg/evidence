# PR 1235: a block session never waits on its server's word alone

Host checks only, on a macOS arm64 host. Paths are masked; each log ends with its command's exit code.

- `host-full/`: `cargo run -- --ci host` at 500507174 (`revision.txt`), the change on 422915e2c before its rebase.
  Exit 1, 1 of 110 steps red: the build system's
  `llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key`, recorded in
  `issues/the-llvm-environment-test-breaks-git-on-macos.md`. The loom `FAILED` lines in the models part are its
  negative controls, which the step expects red.
- `host-targeted/`: after the rebase onto main b56693152, at 7c6717aa2 (`revision.txt`), by `a-targeted.sh`:
  `cargo test -p toyos-blockring -p diskserver -p toyos` (`test.log`, exit 0) and
  `cargo clippy -p toyos-blockring -p toyos --all-targets` with the gate's adopted lints and `-D warnings`
  (`clippy.log`, exit 0). The rebase changed none of this PR's files.
- `controls/`: three negative controls, each a patch against the final `lib/blockring/src/ends.rs` (17d6339c5)
  and `client.rs` (c7f3eeaba), applied, built and run with `cargo test -p toyos-blockring --lib`, then reverted.
  Each log is red at the named tests, exit 101.

## Review r1 (r2/), at 4eb8b1f52

- `host-targeted/`: by `a-r2-checks.sh` at 4eb8b1f52 (`revision.txt`): `cargo test -p toyos-blockring -p diskserver -p toyos`
  (`test.log`, exit 0); `cargo clippy -p toyos-blockring -p toyos --all-targets` with the gate's adopted lints and
  `-D warnings` (`clippy.log`, exit 0); the same over `diskserver`, which the gate does not lint (`clippy-diskserver.log`,
  exit 0).
- `controls/`: seven patches against 4eb8b1f52, each applied, built, run with `cargo test -p toyos-blockring --lib` and
  reverted by `a-controls.sh`, the worktree clean after; every log exit 101, red at:
  - m1 `send` ignoring the request ring's violation: `a_server_past_the_request_ring_ends_the_session`,
    `a_server_past_the_request_ring_before_anything_went_ends_over_what_waited`;
  - m2 the tag taken before the status is judged: `read_only_answers_a_write_alone`,
    `a_reissue_answered_a_word_no_server_says_of_it_is_kept`, `a_write_answered_lost_is_answered_by_the_sessions_end`,
    `a_server_that_ends_every_session_over_one_write_holds_nothing_for_good`;
  - m3 every look renewing patience: `a_dropped_answer_runs_out_the_servers_patience`;
  - m4 the decision taken before the last send, the review's B1 order: `an_answer_the_last_send_decides_is_never_waited_past`;
  - m5 a session's end counting nothing: `a_flush_every_session_ends_over_is_answered_device`,
    `a_reissue_every_session_ends_over_is_given_up`, `a_server_that_ends_every_session_over_one_write_holds_nothing_for_good`;
  - m6 an end with nothing on the wire taking nothing: `a_server_past_the_request_ring_before_anything_went_ends_over_what_waited`;
  - m7 `Lost` admitted of any request but a caller's: `a_reissue_answered_a_word_no_server_says_of_it_is_kept`,
    `a_server_that_ends_every_session_over_one_write_holds_nothing_for_good`.
- `ci-features/`: the CI's three blockring controls at 4eb8b1f52 (`cargo test -p toyos-blockring --lib --features <f>`),
  each exit 101 with the model test `build/ci.rs` names among the red.
- `first-try/`: the run that sent the B1 test back, kept as found. `m4-decided-before-the-last-send.log` (at dc5e0daff,
  the commit before its amendment) exits 0: the test's loop ran out instead of requiring `Answered` on its last
  exchange; the amended test requires it, and m4 is red above. `blockring-before-the-model-law.log` (the uncommitted
  tree before the model change): the model's `what_a_flush_calls_durable_is_on_the_medium` red under two resets and
  two deaths, a flush answered `Device` after five attempts, which is why its law now weighs failures by attempts.
- Guest: `nvme_disk_boots` at 4eb8b1f52, https://github.com/ToyOSOrg/ToyOS/actions/runs/43062272826 (pending when
  this was written).
