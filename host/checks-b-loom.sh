#!/bin/bash
# Run 3's reds, again: the pure tests and their clippy, the loom models and the
# control the rewritten close-racing-a-post model answers to, the host members'
# clippy, and the harness's checks.
H=<path>
L=$H/logs/b/checks-$1
mkdir -p "$L"
cd $H/wt-b || exit 1
export CARGO_TARGET_DIR=$H/target-host
echo "revision $(git rev-parse HEAD) plus the tree; diff sha $(git diff HEAD | shasum -a 256 | cut -c1-16)" > "$L/summary.txt"
run() { name=$1; shift; echo "\$ $*" > "$L/$name.log"; "$@" >> "$L/$name.log" 2>&1; code=$?; echo "exit $code" >> "$L/$name.log"; echo "$name: exit $code ($*)" >> "$L/summary.txt"; }
run pure cargo test -p kernel --lib --features sched-check
run clippy-kernel-lib cargo clippy -p kernel --lib --tests --features sched-check -- -W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon -D warnings
run loom cargo test -p kernel-loom --test loom_watch --test inbox_answer --test poll_once
run ctl-poll-fire-loom_watch cargo test -p kernel-loom --features poll-fire-load-store --test loom_watch -- --exact a_poll_registered_racing_a_post_completes_exactly_once a_poll_registered_racing_a_post_in_place_completes_exactly_once a_poll_on_two_watches_racing_both_posts_completes_exactly_once a_close_racing_a_post_answers_a_poll_once
run clippy-host cargo clippy -p kernel-loom -p kernel-sim -p toyos-build --all-targets -- -W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon -D warnings
run harness-checks cargo test --test toyos-checks
# The one red of run 3's build-system step, on a tree without this change's build edits.
(cd $H/wt && run llvm-env-on-pr-a-tree cargo test -p toyos-build --lib llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key)
cat "$L/summary.txt"
