#!/bin/sh
# Each mutation: checked apply, build, the cicache tests, restore.
W=<worktree>; S=<scratch>
cd $W || exit 2
for p in ${PATCHES:-$S/mutations}/*.patch; do
  n=$(basename $p .patch)
  git apply --check $p || { echo "$n: does not apply"; exit 2; }
  git apply $p
  cargo test --lib --no-run > $S/mutations/$n.build.log 2>&1; b=$?
  cargo test --lib cicache > $S/mutations/$n.test.log 2>&1; t=$?
  git apply -R $p
  echo "$n: build exit $b, test exit $t; $(grep -E '^test .*FAILED$' $S/mutations/$n.test.log | tr '\n' ' ')"
done
cmp -s $W/build/cicache.rs $S/cicache.orig.rs && echo restored
