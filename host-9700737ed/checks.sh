#!/bin/bash
# Round 2 targeted host checks: the crates the clippy rename touches, and toyos-desktop's lint which round 1 never reached.
S=<scratch>/r2
cd <worktree> || exit 1
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon -D warnings"
run() { n=$1; shift; { echo "revision $(git rev-parse HEAD) + worktree diff $(git diff | shasum | cut -c1-12)"; echo "\$ $*"; "$@"; echo "exit $?"; } > $S/$n.log 2>&1; tail -1 $S/$n.log | sed "s/^/$n: /"; }
run clippy-toyos-all cargo clippy -p toyos --all-targets -- $A
run clippy-toyos-fd cargo clippy -p toyos --lib --features fd-table -- $A
run clippy-desktop cargo clippy -p toyos-desktop --all-targets -- $A
run test-toyos cargo test -p toyos
run test-desktop cargo test -p toyos-desktop
run test-diskserver cargo test --manifest-path system/diskserver/Cargo.toml
