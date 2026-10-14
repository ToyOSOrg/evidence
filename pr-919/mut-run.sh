#!/bin/bash
# run.sh <patch> <package> <test filter>: apply, test, restore; prints exits
cd <worktree>
git apply --check "$1" && git apply "$1" || exit 90
echo "=== mutated: $1 at $(git rev-parse HEAD)"; git diff --stat
cargo test -p "$2" --lib -- "$3" ; echo "EXIT mutated=$?"
git apply -R "$1"; echo "restored, diff of that file: $(git diff --stat -- $(grep '^+++' "$1" | sed 's|+++ b/||') | tail -1)"
cargo test -p "$2" --lib -- "$3" ; echo "EXIT restored=$?"
