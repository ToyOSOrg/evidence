#!/bin/sh
# Scratch runner: the hot-plug row at the committed head with the stand-in grant, then each mutation on top, restored after each.
S=$SCRATCH
cd $WORK/toyos-lifecycle-2 || exit 9
HEAD=$(git rev-parse HEAD)
run() { # name, extra patch or empty
  log=$S/control-$1.log
  echo "head $HEAD + stand-in-grant.patch ${2:++ $2.patch}" > $log
  git apply $S/stand-in-grant.patch || exit 9
  if [ -n "$2" ]; then git apply $S/$2.patch || exit 9; fi
  cargo test --test toyos-build -- a_function_arrives_and_leaves --nocapture >> $log 2>&1
  echo "exit $?" >> $log
  if [ -n "$2" ]; then git apply -R $S/$2.patch; fi
  git apply -R $S/stand-in-grant.patch
  test -z "$(git status --porcelain)" || { echo "tree not restored" >> $log; exit 9; }
}
run green ""
run gone-unanswered mutation-gone-unanswered
run arrival-reused mutation-arrival-reused
