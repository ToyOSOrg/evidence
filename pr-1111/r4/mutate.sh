#!/bin/zsh
# mutate.sh <worktree> <patch> <log> <cargo args...>: apply a mutation patch, prove it builds and record the
# tests' exit, then reverse exactly that patch.
wt=$1; patch=$2; log=$3; shift 3
cd $wt || exit 9
git apply --check $patch || { echo "patch does not apply" > $log; exit 8; }
git apply $patch
cargo "$@" > $log 2>&1; rc=$?
echo "MUTATION_EXIT=$rc" >> $log
git apply -R $patch || { echo "RESTORE FAILED" >> $log; exit 7; }
echo "restored" >> $log
