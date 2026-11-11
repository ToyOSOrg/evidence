#!/bin/bash
# Round 7, at the r1 head: toyos lint+tests; every host-buildable converted server compiled, tested where it has tests, and linted (warnings allowed, compared by line).
S=<scratch>/r7
cd <worktree> || exit 1
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon"
run() { n=$1; shift; { echo "revision $(git rev-parse HEAD) + worktree diff $(git diff | shasum | cut -c1-12)"; echo "\$ $*"; "$@"; echo "exit $?"; } > $S/$n.log 2>&1; tail -1 $S/$n.log | sed "s/^/$n: /"; }
run clippy-toyos-all cargo clippy -p toyos --all-targets -- $A -D warnings
run clippy-toyos-fd cargo clippy -p toyos --lib --features fd-table -- $A -D warnings
run clippy-desktop cargo clippy -p toyos-desktop --all-targets -- $A -D warnings
run test-toyos cargo test -p toyos
run test-desktop cargo test -p toyos-desktop
for p in diskserver fileserver logkeeper netstack; do run test-$p cargo test --manifest-path system/$p/Cargo.toml; done
run clippy-servers cargo clippy -p diskserver -p fileserver -p logkeeper -p netstack -p filepicker -p usbd --all-targets --message-format=short -- $A
