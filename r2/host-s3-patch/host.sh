#!/bin/bash
# fdhold round 4, A plus the S3 patch targeted host checks at the worktree's head. Each step's exit is recorded.
S=$SCRATCH
L=$S/scratch/r4b
cd $S/wt || exit 9
git rev-parse HEAD > $L/rev
git diff > $L/tree.diff
git status --porcelain --ignore-submodules=none > $L/status-before
ADOPTED="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon"
run() { local name=$1; shift; echo "\$ $*" > $L/$name.log; "$@" >> $L/$name.log 2>&1; local e=$?; echo "exit $e" >> $L/$name.log; echo "$name exit $e" >> $L/status; }
: > $L/status
run sdk-fd cargo test -p toyos --lib fd::
M=fd::table::model
run control-fd-hold-revives cargo test -p toyos --features fd-hold-revives --lib -- --exact \
  $M::a_call_beside_a_close_holds_a_live_object_or_none $M::two_calls_beside_a_close_let_the_object_go_once $M::a_call_beside_a_dup2_holds_the_old_object_or_the_new
run control-fd-hold-unchecked cargo test -p toyos --features fd-hold-unchecked --lib -- --exact \
  $M::a_call_on_a_closed_descriptor_never_holds_the_object_that_took_its_slot
run control-fd-publish-relaxed cargo test -p toyos --features fd-publish-relaxed --lib -- --exact \
  $M::a_call_on_a_closed_descriptor_never_holds_the_object_that_took_its_slot $M::a_call_on_a_reopened_descriptor_holds_the_old_object_or_the_new
run control-fd-reuse-relaxed cargo test -p toyos --features fd-reuse-relaxed --lib -- --exact \
  $M::a_call_on_a_closed_descriptor_never_holds_the_object_that_took_its_slot $M::a_call_on_a_reopened_descriptor_holds_the_old_object_or_the_new

run clippy-toyos cargo clippy -p toyos --all-targets -- $ADOPTED -D warnings
run clippy-toyos-fd-table cargo clippy -p toyos --lib --features fd-table -- $ADOPTED -D warnings
run clippy-toyos-controls cargo clippy -p toyos --all-targets --features fd-hold-revives,fd-hold-unchecked,fd-publish-relaxed,fd-reuse-relaxed -- $ADOPTED -D warnings
git status --porcelain --ignore-submodules=none > $L/status-after
echo done >> $L/status
