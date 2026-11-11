#!/bin/bash
# Round 9, review r3 (R1 owed count, S1 keyed shared line, S2): the module and logkeeper linted and tested; every host-buildable server compiled with its tests.
S=<scratch>/r9
cd <worktree> || exit 1
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon"
run() { n=$1; shift; { echo "revision $(git rev-parse HEAD) + worktree diff $(git diff | shasum | cut -c1-12)"; echo "\$ $*"; "$@"; echo "exit $?"; } > $S/$n.log 2>&1; tail -1 $S/$n.log | sed "s/^/$n: /"; }
run clippy-toyos-all cargo clippy -p toyos --all-targets -- $A -D warnings
run clippy-toyos-fd cargo clippy -p toyos --lib --features fd-table -- $A -D warnings
run test-toyos cargo test -p toyos
run test-logkeeper cargo test --manifest-path system/logkeeper/Cargo.toml
run clippy-servers cargo clippy -p diskserver -p fileserver -p logkeeper -p netstack -p filepicker -p usbd --all-targets --message-format=short -- $A
