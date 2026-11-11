#!/bin/bash
# PR B's targeted checks: each command's own log and exit code. A control is
# expected to exit non-zero; its log is read for the verdict the CI table names.
H=<path>
WT=$H/wt-b
L=$H/logs/b/checks${1:+-$1}
mkdir -p "$L"
cd "$WT" || exit 1
export CARGO_TARGET_DIR=$H/target-host
ADOPTED="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon"
echo "revision $(git rev-parse HEAD) plus the tree; diff sha $(git diff HEAD | shasum -a 256 | cut -c1-16); mio-wt $(git -C $H/mio-wt rev-parse --short HEAD)" > "$L/summary.txt"
run() {
  name=$1; shift
  echo "\$ $*" > "$L/$name.log"
  "$@" >> "$L/$name.log" 2>&1
  code=$?
  echo "exit $code" >> "$L/$name.log"
  echo "$name: exit $code ($*)" >> "$L/summary.txt"
}
LOOM="-p kernel-loom"
# The first four gate the rest: a compile error stops the run with the slot free.
gate() { run "$@"; tail -1 "$L/$1.log" | grep -q "^exit 0$" || { echo "stopped at $1" >> "$L/summary.txt"; cat "$L/summary.txt"; exit 1; }; }
gate pure cargo test -p kernel --lib --features sched-check
gate clippy-kernel-x86 cargo clippy -p kernel --target x86_64-unknown-none -- $ADOPTED -D warnings
gate loom-compiles cargo test $LOOM --tests --no-run
gate loom cargo test $LOOM --test loom_watch --test inbox_answer --test poll_once
# The image next: the guest side compiles nowhere else.
(unset CARGO_TARGET_DIR; run build-only cargo run -- --build-only)
run sim cargo test -p kernel-sim --no-run
# Every control whose model this change touches, as build/ci.rs runs it.
run ctl-poll-fire-poll_once cargo test $LOOM --features poll-fire-load-store --test poll_once -- --exact a_post_and_a_recheck_answer_a_poll_once a_withdrawal_and_a_post_never_both_take_a_poll
run ctl-poll-fire-loom_watch cargo test $LOOM --features poll-fire-load-store --test loom_watch -- --exact a_poll_registered_racing_a_post_completes_exactly_once a_poll_registered_racing_a_post_in_place_completes_exactly_once a_poll_on_two_watches_racing_both_posts_completes_exactly_once a_close_racing_a_post_answers_a_poll_once
run ctl-post-is-an-answer cargo test $LOOM --features post-is-an-answer --test inbox_answer -- --exact a_post_with_nothing_to_read_answers_nothing a_post_that_lands_after_its_bytes_were_read_answers_nothing a_poll_armed_again_does_not_end_the_look
run ctl-commit-ignores-notify cargo test $LOOM --features commit-ignores-notify --test loom_watch -- --exact a_post_racing_a_registration_leaves_nobody_parked a_fire_racing_a_submitters_park_is_never_lost
run ctl-register-outside-table cargo test $LOOM --features register-outside-table --test loom_watch -- --exact a_close_racing_a_registration_leaves_nothing_through_the_handle
run ctl-admit-keeps-the-replaced cargo test $LOOM --features admit-keeps-the-replaced --test loom_watch -- --exact a_replacing_watch_racing_a_post_answers_once_under_the_newest_token
run ctl-teardown-posts-nothing cargo test $LOOM --features teardown-posts-nothing --test loom_watch -- --exact a_teardown_racing_a_park_returns_the_submit
run build-system cargo test -p toyos-build --lib
run sdk cargo test -p toyos --lib poller
run clippy-kernel-lib cargo clippy -p kernel --lib --tests --features sched-check -- $ADOPTED -D warnings
run clippy-kernel-x86-actuators cargo clippy -p kernel --target x86_64-unknown-none --features boot-actuators,test-actuators -- $ADOPTED -D warnings
run clippy-host cargo clippy -p kernel-loom -p kernel-sim -p toyos-build --all-targets -- $ADOPTED -D warnings
run clippy-sdk cargo clippy -p toyos --all-targets -- $ADOPTED -D warnings
run clippy-abi cargo clippy -p toyos-abi --all-targets --keep-going --target-dir $H/target-host/clippy-abi -- -W clippy::undocumented_unsafe_blocks -D warnings
cat "$L/summary.txt"
