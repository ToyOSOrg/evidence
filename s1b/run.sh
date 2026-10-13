#!/bin/sh
# Usage: run.sh <worktree> <patch> <log> <cargo test args...>
# Applies a checked patch, runs the test, restores, and reports the exit.
wt=$1; patch=$2; log=$3; shift 3
cd "$wt" || exit 2
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "tree not clean" > "$log"; exit 2; }
{
  echo "HEAD=$(git rev-parse HEAD)"
  echo "PATCH=$(basename "$patch")"
  git apply --check "$patch" && git apply "$patch" || { echo "APPLY FAILED"; exit 3; }
  git diff --stat
  cargo test "$@"
  echo "TEST_EXIT=$?"
  git apply -R "$patch"
  echo "RESTORED_CLEAN=$([ -z "$(git status --porcelain --ignore-submodules=none)" ] && echo yes || echo no)"
} > "$log" 2>&1
grep -E '^(TEST_EXIT|RESTORED_CLEAN)=' "$log"
