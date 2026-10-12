#!/bin/sh
# The same mutations on the base the branch was measured on, with no S0: the whole change reverted.
S=/private/tmp/claude-502/-Users-jan-Dev-jan-toyos/80e90c3a-7449-46b8-84cc-b59e9dd31ae9/scratchpad/sched-s0
M=$S/mut
cd /Users/jan/Dev/jan/toyos-sched-s0 || exit 1
echo "head $(git rev-parse HEAD)"
run() {
  name=$1; shift
  for p in $PATCHES; do git apply --check "$M/$p" || { echo "$name: $p does not apply"; exit 1; }; done
  for p in $PATCHES; do git apply "$M/$p"; done
  cargo test -p kernel-sim "$@" > "$M/$name.log" 2>&1; code=$?
  echo "$name [$PATCHES] cargo test -p kernel-sim $*: EXIT=$code"
  for p in $PATCHES; do git apply -R "$M/$p"; done
  if [ -n "$(git status --porcelain --ignore-submodules=none)" ]; then echo "$name: tree not clean after restore"; exit 1; fi
}
PATCHES="" run base-green --no-fail-fast
PATCHES="M1-locality-rule.patch" run base-M1 --no-fail-fast
PATCHES="M2-staging-base.patch" run base-M2-staging-alone --test m2
PATCHES="M2-staging-base.patch M2-group-average.patch" run base-M2-staged --test m2
PATCHES="M2-group-average.patch" run base-M2-unstaged --no-fail-fast
echo "clean: $(git status --porcelain --ignore-submodules=none | wc -l | tr -d ' ') changed paths"
