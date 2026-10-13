#!/bin/bash
# run.sh <worktree> <patch>: the test green on the tree, the patch applied and built, the test again, the patch reverted and the tree clean.
set -u
cd "$1"; P="$2"; T='roster_reading::a_granted_roster_is_its_header_and_each_whole_entry'
cargo test -p toybox-copies -- --exact "$T"; echo "GREEN EXIT=$?"
git apply --check "$P" && git apply "$P" || { echo "APPLY FAILED"; exit 3; }
cargo build -p toybox-copies --tests; echo "BUILD EXIT=$?"
cargo test -p toybox-copies -- --exact "$T"; echo "MUTATED EXIT=$?"
git apply -R "$P"; echo "REVERT EXIT=$?"
git status --porcelain -- system/toybox/src/roster.rs; echo "CLEAN (empty line above)"
