#!/bin/bash
# Round 11, after rebasing onto main 2c8d8bb68 (#1235, #1239, #1216): diskserver and the admission module tested and linted; logkeeper tested; every host-buildable server compiled.
S=<scratch>/r11
cd <worktree> || exit 1
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon"
run() { n=$1; shift; { echo "revision $(git rev-parse HEAD) + worktree diff $(git diff | shasum | cut -c1-12)"; echo "\$ $*"; "$@"; echo "exit $?"; } > $S/$n.log 2>&1; tail -1 $S/$n.log | sed "s/^/$n: /"; }
run test-admission cargo test -p toyos --lib admission
run clippy-toyos-all cargo clippy -p toyos --all-targets -- $A -D warnings
run clippy-toyos-fd cargo clippy -p toyos --lib --features fd-table -- $A -D warnings
run test-diskserver cargo test --manifest-path system/diskserver/Cargo.toml
run clippy-diskserver cargo clippy -p diskserver --all-targets --message-format=short -- $A
run test-logkeeper cargo test --manifest-path system/logkeeper/Cargo.toml
run check-servers cargo check -p diskserver -p fileserver -p logkeeper -p netstack -p filepicker -p usbd -p toyos-desktop --all-targets
