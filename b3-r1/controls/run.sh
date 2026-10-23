#!/bin/sh
# usage: run.sh <name> <test filter> <file> <old> <new> [<old> <new> ...]
# Applies the edits, records the diff, proves the tree builds, runs the
# filtered tests, restores the file and touches it so cargo rebuilds it.
set -u
W=<worktree>; D=$(cd "$(dirname "$0")" && pwd); N=$1; F=$2; P=$3; shift 3
cd $W && cp "$P" "$P.orig" && python3 "$D/edit.py" "$P" "$@" || exit 2
git diff -- "$P" > "$D/$N.patch"
{ echo "rev $(git rev-parse HEAD) + $N.patch"; cargo build -p bcachefs --tests; echo "BUILD EXIT $?"; cargo test -p bcachefs --lib "$F"; echo "TEST EXIT $?"; } > "$D/$N.log" 2>&1
mv "$P.orig" "$P"; touch "$P"; git diff --quiet -- "$P" && echo "$N: restored"
grep -E 'BUILD EXIT|TEST EXIT|test result|panicked' "$D/$N.log" | head -6
