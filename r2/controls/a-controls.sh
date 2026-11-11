#!/bin/bash
# A's negative controls at the committed head: each patch applied, built and
# run with `cargo test -p toyos-blockring --lib`, then reverted.
W=<path>
M=<path>
cd $W || exit 9
[ -z "$(git status --porcelain)" ] || { echo "worktree not clean"; exit 9; }
git rev-parse HEAD > $M/revision.txt
for p in $M/m*.patch; do
  n=$(basename $p .patch)
  git apply $p || { echo "$n: does not apply"; exit 9; }
  { echo "\$ cargo test -p toyos-blockring --lib   (with $n.patch applied, at $(git rev-parse --short HEAD))"; cargo test -p toyos-blockring --lib 2>&1; echo "exit $?"; } > $M/$n.log
  git apply -R $p || { echo "$n: does not revert"; exit 9; }
  echo "$n: $(tail -1 $M/$n.log); $(grep -c 'FAILED$\|\.\.\. FAILED' $M/$n.log) failed lines"
done
[ -z "$(git status --porcelain)" ] || { echo "worktree not clean after the controls"; exit 9; }
echo clean
