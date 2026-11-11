#!/bin/bash
# Round 4 after removing admission API no server calls: toyos lint+tests, and every host-buildable converted server compiled with its tests.
S=<scratch>/r4
cd <worktree> || exit 1
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon -D warnings"
run() { n=$1; shift; { echo "revision $(git rev-parse HEAD) + worktree diff $(git diff | shasum | cut -c1-12)"; echo "\$ $*"; "$@"; echo "exit $?"; } > $S/$n.log 2>&1; tail -1 $S/$n.log | sed "s/^/$n: /"; }
run clippy-toyos-all cargo clippy -p toyos --all-targets -- $A
run clippy-toyos-fd cargo clippy -p toyos --lib --features fd-table -- $A
run test-toyos cargo test -p toyos
run check-servers cargo check -p diskserver -p fileserver -p logkeeper -p netstack -p filepicker -p usbd --all-targets
