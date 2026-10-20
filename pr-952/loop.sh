#!/bin/bash
# usage: loop.sh <worktree> <test> <runs> <outdir>
wt=$1; t=$2; n=$3; out=$4; mkdir -p $out
cd $wt; rev=$(git rev-parse HEAD); dirty=$(git status --porcelain | wc -l)
echo "rev $rev dirty-files $dirty test $t runs $n" > $out/summary.txt
fail=0
for i in $(seq 1 $n); do
  cargo test -q -p kernel-loom --test $t -- --test-threads=8 > $out/run-$i.log 2>&1; rc=$?
  echo "run $i exit $rc" >> $out/summary.txt
  if [ $rc -ne 0 ]; then fail=$((fail+1)); grep -h "panicked at\|never ran\|^    [a-z_]*$" $out/run-$i.log >> $out/summary.txt; else rm $out/run-$i.log; fi
done
echo "TOTAL $n runs, $fail failed" >> $out/summary.txt
