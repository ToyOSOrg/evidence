#!/bin/bash
# Every measurement of round 2 at the branch head, in sequence. Each mutation: applied checked,
# built and run, its exit recorded, reversed, and the tree proven as it was.
S=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/sched-s0-r2
W=/Users/jan/Dev/jan/toyos-sched-s0
cd $W || exit 2
echo "head $(git rev-parse HEAD)"; uptime
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "tree not clean at start"; exit 1; }
M=$S/run-mutation.sh
PATCHES="" $M branch-green --no-fail-fast
PATCHES="review-case-test.patch" $M review-case-shipped --test topology review_case_flat2 -- --nocapture --exact
PATCHES="review-filter.patch review-case-test.patch" $M review-case-filter --test topology review_case_flat2 -- --nocapture --exact
PATCHES="review-filter.patch" $M review-filter-suite --no-fail-fast
PATCHES="M1-locality-rule.patch" $M branch-M1 --no-fail-fast
PATCHES="M2-group-average.patch" $M branch-M2 --no-fail-fast
PATCHES="M3-idle-pass-deferrable.patch" $M branch-M3 --no-fail-fast
PATCHES="M4-rung-cpu-holds-no-round.patch" $M branch-M4 --no-fail-fast
PATCHES="protocol-new-exemption-removed.patch" $M exemption-removed --test scenarios old_steal_port
PATCHES="wake-count-crosscheck.patch" $M wake-crosscheck --test topology --test scenarios --test policy --no-fail-fast
{ git rev-parse HEAD; uptime; /usr/bin/time -p cargo test -p kernel-sim --test topology -- --nocapture --test-threads 1; echo "EXIT=$?"; } > $S/logs/topology-tables.log 2>&1
echo "topology-tables $(tail -1 $S/logs/topology-tables.log)"
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "tree not clean at end"; exit 1; }
echo "clean: 0 changed paths"
echo DONE
