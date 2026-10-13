#!/bin/sh
# Each mutation applied as a checked patch, the tests that hold it run, the
# exit reported, and the patch reversed, leaving the tree clean.
# $1: the ToyOS worktree; $2: the directory of patches.
set -u
W=$1; P=$2
cd "$W" || exit 1
for patch in "$P"/m*.patch; do
  name=$(basename "$patch" .patch)
  echo "=== $name"
  git apply --check "$patch" || { echo "does not apply"; exit 1; }
  git apply "$patch"
  git diff --stat
  cargo test -q -p toyos-build --lib -- publish:: signing:: 2>&1; b=$?
  cargo test -q -p toyos-update 2>&1; u=$?
  cargo test -q -p toyos-root 2>&1; r=$?
  echo "$name: toyos-build publish/signing EXIT=$b; toyos-update EXIT=$u; toyos-root EXIT=$r"
  git apply -R "$patch"
done
echo "=== unmutated"
cargo test -q -p toyos-build --lib -- publish:: signing:: 2>&1; b=$?
cargo test -q -p toyos-update 2>&1; u=$?
cargo test -q -p toyos-root 2>&1; r=$?
echo "unmutated: toyos-build publish/signing EXIT=$b; toyos-update EXIT=$u; toyos-root EXIT=$r"
echo "=== tree after: git status --porcelain --ignore-submodules=none"
git status --porcelain --ignore-submodules=none
echo "(end of status)"
