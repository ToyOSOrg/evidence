#!/bin/sh
# m14 (the read-back refuses nothing) and m15 (the refused file is not
# removed), each checked, applied, built and run against the host test
# `a_key_file_that_reads_back_other_than_0600_is_refused_and_removed`
# (red is a non-zero exit), and restored in the same script; then the
# crate's whole suite on the restored tree, and the tree shown clean.
# $1: the ToyOS worktree; $2: this directory.
set -u
W=$1; H=$2; T=a_key_file_that_reads_back_other_than_0600_is_refused_and_removed; red=0
cd "$W" || exit 2
git rev-parse HEAD
for m in m14-no-readback m15-no-removal; do
  echo "== $m"
  git apply --check "$H/$m.patch"; echo "check EXIT=$?"
  git apply "$H/$m.patch"; echo "apply EXIT=$?"
  git diff --stat
  cargo build -q -p toyos-root --tests; echo "build EXIT=$?"
  cargo test -q -p toyos-root -- --exact "tests::$T"; e=$?
  echo "$m test EXIT=$e"; [ "$e" -ne 0 ] && red=$((red+1))
  git apply -R "$H/$m.patch"; echo "restore EXIT=$?"
done
echo "== restored"
cargo test -q -p toyos-root; r=$?; echo "restored suite EXIT=$r"
echo "git status --porcelain --ignore-submodules=none:"; git status --porcelain --ignore-submodules=none; echo "(end)"
echo "red: $red of 2"
[ "$red" -eq 2 ] && [ "$r" -eq 0 ]
