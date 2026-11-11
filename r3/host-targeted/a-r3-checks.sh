#!/bin/bash
# A round 3 (B2): targeted tests and clippy at the committed head, then the
# NVMe driver's two controls, each applied, built, run and reverted.
S=<path>
W=$S/wt-client; E=$S/client-ev/r3; M=$S/client-ev/r3-controls
mkdir -p $E; cd $W || exit 9
[ -z "$(git status --porcelain)" ] || { echo "worktree not clean"; exit 9; }
git rev-parse HEAD > $E/revision.txt
L="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon -D warnings"
run() { local log=$1; shift; { echo "\$ $*"; "$@" 2>&1; echo "exit $?"; } > $E/$log; echo "$log: $(tail -1 $E/$log)"; }
run test.log cargo test -p toyos-blockring -p diskserver -p toyos -p nvme
run clippy.log cargo clippy -p toyos-blockring -p toyos --all-targets -- $L
run clippy-programs.log cargo clippy -p nvme -p diskserver --all-targets -- $L
for p in $M/n*.patch; do
  n=$(basename $p .patch)
  git apply $p || { echo "$n: does not apply"; exit 9; }
  { echo "\$ cargo test -p nvme   (with $n.patch applied, at $(git rev-parse --short HEAD))"; cargo test -p nvme 2>&1; echo "exit $?"; } > $M/$n.log
  git apply -R $p || { echo "$n: does not revert"; exit 9; }
  echo "$n: $(tail -1 $M/$n.log); $(grep -c '\.\.\. FAILED' $M/$n.log) failed tests; $(grep -c 'evaluation of constant value failed\|error\[E0080\]' $M/$n.log) const-eval errors"
done
[ -z "$(git status --porcelain)" ] || { echo "worktree not clean after the controls"; exit 9; }
echo clean
