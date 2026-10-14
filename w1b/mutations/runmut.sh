#!/bin/zsh
# usage: runmut.sh <worktree> <mutations dir> <log dir>
W=$1; M=$2; L=$3
cd $W || exit 2
echo "revision $(git rev-parse HEAD) + working tree diff sha $(git diff | shasum -a 256 | cut -c1-16)"
for p in $M/*.patch; do
  n=$(basename $p .patch)
  git apply --check $p || { echo "$n: patch does not apply"; exit 2; }
  git apply $p
  cargo test -p toyos-ieee80211 --no-run > $L/$n.build.log 2>&1; b=$?
  cargo test -p toyos-ieee80211 > $L/$n.test.log 2>&1; t=$?
  git apply -R $p || { echo "$n: restore failed"; exit 3; }
  failed=$(grep -E '^    [a-z_0-9]+$' $L/$n.test.log | sort -u | tr '\n' ' ')
  echo "$n: build exit $b, test exit $t, failing: $failed"
done
git diff --quiet $M 2>/dev/null
cargo test -p toyos-ieee80211 > $L/restored.test.log 2>&1; echo "restored: test exit $?"
