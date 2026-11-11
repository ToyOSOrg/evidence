#!/bin/bash
# PR #1216 r3 host checks on the touched crates: the engine's suite, the two crates that serve it, and clippy
# on the touched packages with the workspace's adopted lints.
S=<scratch>
cd $S/wt || exit 9
echo "rev $(git rev-parse HEAD) + working tree:"; git status --short
step() { local log=$1; shift; "$@" > "$S/logs/$log" 2>&1; local rc=$?; echo "exit $rc" >> "$S/logs/$log"; echo "$log: exit $rc; $(grep -h 'test result' "$S/logs/$log" | head -1)"; }
step r3-bcachefs.log cargo test --release --manifest-path lib/bcachefs/Cargo.toml
step r3-fileserver.log cargo test --release --manifest-path system/fileserver/Cargo.toml
step r3-diskserver.log cargo test --release --manifest-path system/diskserver/Cargo.toml
step r3-clippy.log cargo clippy -p bcachefs -p diskserver --all-targets -- -W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon -D warnings
