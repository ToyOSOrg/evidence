#!/bin/bash
# Round 3 targeted host checks after Badge::of / diskserver / Full display edits: toyos and diskserver.
S=<scratch>/r3
cd <worktree> || exit 1
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon -D warnings"
run() { n=$1; shift; { echo "revision $(git rev-parse HEAD) + worktree diff $(git diff | shasum | cut -c1-12)"; echo "\$ $*"; "$@"; echo "exit $?"; } > $S/$n.log 2>&1; tail -1 $S/$n.log | sed "s/^/$n: /"; }
run clippy-toyos-all cargo clippy -p toyos --all-targets -- $A
run clippy-toyos-fd cargo clippy -p toyos --lib --features fd-table -- $A
run clippy-diskserver cargo clippy -p diskserver --all-targets -- $A
run test-toyos cargo test -p toyos
run test-diskserver cargo test --manifest-path system/diskserver/Cargo.toml
run fmt-check cargo fmt --check -p toyos -p diskserver
