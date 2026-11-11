#!/bin/bash
# Negative controls at the head: each patch applied, built, run against admission's tests, and restored.
S=<scratch>
cd <worktree> || exit 1
f=sdk/toyos/src/admission.rs
git diff --quiet || { echo "worktree not clean"; exit 1; }
{ echo "revision $(git rev-parse HEAD)"; echo '$ cargo test -p toyos --lib admission'; cargo test -p toyos --lib admission 2>&1; echo "baseline exit $?"; } > $S/mut-head/baseline.log
for p in $S/mut/m*.patch; do
  n=$(basename $p .patch)
  { echo "revision $(git rev-parse HEAD)"; cp $p $S/mut-head/$n.patch
    git apply --check $p && git apply $p && echo "applied $n" && git diff
    echo '$ cargo test -p toyos --lib admission'; cargo test -p toyos --lib admission 2>&1; echo "$n exit $?"
    git checkout -- $f; git diff --quiet && echo "restored"; } > $S/mut-head/$n.log 2>&1
done
git diff --quiet && echo clean-after
