#!/bin/sh
# Applies each mutation, builds and runs the scrypt/PBKDF2 tests, reverts.
cd $WORKTREE || exit 1
D=$SCRATCH/mutations
echo "base $(git rev-parse HEAD)"
for p in $D/m*.patch; do
  n=$(basename $p .patch)
  git apply $p || { echo "$n: apply failed"; exit 1; }
  cargo build -q -p toyos-crypto --tests > $D/$n.build.log 2>&1; b=$?
  cargo test --no-fail-fast -p toyos-crypto --lib --test vectors --test differential -- scrypt rfc7914 pbkdf2 parameters workspace > $D/$n.log 2>&1; t=$?
  git apply -R $p || { echo "$n: revert failed"; exit 1; }
  echo "$n: build exit $b, test exit $t; failed: $(grep -E '^    [a-z_:]+$' $D/$n.log | tr -d ' ' | tr '\n' ' ')"
done
git diff --quiet && echo "tree restored"
