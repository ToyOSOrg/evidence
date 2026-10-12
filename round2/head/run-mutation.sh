#!/bin/bash
# usage: PATCHES="a.patch b.patch" run-mutation.sh <label> <cargo test -p kernel-sim args...>
# Applies each patch checked, runs, reverses, and proves the tree is as it was before.
S=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/sched-s0-r2
W=/Users/jan/Dev/jan/toyos-sched-s0
label=$1; shift
cd $W || exit 2
before=$(git status --porcelain --ignore-submodules=none; git diff | shasum)
echo "== $label at $(git rev-parse HEAD) (uncommitted: $(git status --porcelain --ignore-submodules=none | wc -l | tr -d ' ') paths) patches: [$PATCHES] args: $*"
for p in $PATCHES; do git apply --check $S/patches/$p || { echo "PATCH $p does not apply"; exit 3; }; done
for p in $PATCHES; do git apply $S/patches/$p; done
cargo test -p kernel-sim "$@" > $S/logs/$label.log 2>&1
echo "$label EXIT=$?"
for p in $PATCHES; do git apply -R $S/patches/$p; done
after=$(git status --porcelain --ignore-submodules=none; git diff | shasum)
[ "$before" = "$after" ] && echo "tree as before" || { echo "TREE CHANGED"; exit 4; }
