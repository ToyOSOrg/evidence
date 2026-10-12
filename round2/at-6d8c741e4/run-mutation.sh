#!/bin/bash
# usage: run-mutation.sh <label> <cargo test args...>; patches from $PATCHES (space-separated)
S=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/sched-s0-r2
W=/Users/jan/Dev/jan/toyos-sched-s0
label=$1; shift
cd $W || exit 2
echo "== $label at $(git rev-parse HEAD) patches: $PATCHES"
for p in $PATCHES; do git apply --check $S/patches/$p || { echo "PATCH $p does not apply"; exit 3; }; done
for p in $PATCHES; do git apply $S/patches/$p; done
git diff --stat
cargo test -p kernel-sim "$@" > $S/logs/$label.log 2>&1
echo "$label EXIT=$?"
for p in $PATCHES; do git apply -R $S/patches/$p; done
st=$(git status --porcelain --ignore-submodules=none)
[ -z "$st" ] && echo "tree clean" || { echo "TREE DIRTY: $st"; exit 4; }
