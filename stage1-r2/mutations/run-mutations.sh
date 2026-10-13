#!/bin/sh
# Each mutation applied as a checked patch, the tests that hold it run, the
# exit reported, and the patch reversed, leaving the tree clean.
# $1: the ToyOS worktree; $2: the directory of patches.
set -u
W=$1; P=$2
cd "$W" || exit 1
suite() {
  cargo test -q -p toyos-build --lib -- publish:: signing:: 2>&1; b=$?
  cargo test -q -p toyos-update 2>&1; u=$?
  cargo test -q -p toyos-root 2>&1; r=$?
  cargo test -q -p toyos-ssh 2>&1; s=$?
}
for patch in "$P"/m*.patch; do
  name=$(basename "$patch" .patch)
  echo "=== $name"
  git apply --check "$patch" || { echo "does not apply"; exit 1; }
  git apply "$patch"
  git diff --stat
  suite
  echo "$name: toyos-build publish/signing EXIT=$b; toyos-update EXIT=$u; toyos-root EXIT=$r; toyos-ssh EXIT=$s"
  git apply -R "$patch"
done
echo "=== unmutated"
suite
echo "unmutated: toyos-build publish/signing EXIT=$b; toyos-update EXIT=$u; toyos-root EXIT=$r; toyos-ssh EXIT=$s"
echo "=== tree after: git status --porcelain --ignore-submodules=none"
git status --porcelain --ignore-submodules=none
echo "(end of status)"
