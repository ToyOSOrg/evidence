#!/bin/sh
# Each host mutation of PR #873's round 2: a checked patch against the head,
# applied in the mutation worktree, its model or test run, and reverted, the
# worktree's porcelain printed after each.
set -u
S=<scratchpad>/pge-r2
W=<dev>/toyos-pge-mut
cd $W || exit 90
echo "tree $(git rev-parse HEAD)"
run() { # patch log-name command...
  p=$S/mut/$1.patch; shift
  git apply --check $p; rc=$?; echo "$(basename $p .patch): git apply --check EXIT=$rc"
  [ $rc -eq 0 ] || exit 91
  git apply $p || exit 92
  "$@" > $S/mut/$(basename $p .patch).log 2>&1; rc=$?
  echo "$(basename $p .patch): $* EXIT=$rc"
  git apply -R $p || exit 93
  echo "$(basename $p .patch): reverted; porcelain:"; git status --porcelain --ignore-submodules=none; echo "(end)"
}
for m in l1-wide-counted-after-the-generation l2-wide-answer-recorded-before-its-flush l3-every-answer-wide l4-wide-count-read-relaxed; do
  run $m cargo test -p kernel-loom --test tlb_shootdown
done
for m in c0-no-cpu-misses-a-global-invlpg c1-revision-compared-unsigned c2-a-guest-is-judged-as-metal c3-the-6p0e-die-withheld; do
  run $m cargo test -p toyos-cpuvuln
done
echo ALL-DONE
