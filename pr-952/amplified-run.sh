#!/bin/bash
# usage: amplified-run.sh <worktree> <runs> <outdir>: apply amplify.py, build, run both files <runs> times, restore.
wt=$1; n=$2; out=$3; S=$(dirname $0); mkdir -p $out; rm -f $out/*
cd $wt; echo "rev $(git rev-parse HEAD) base-diff-lines $(git diff | wc -l)" > $out/summary.txt
git diff > $out/base.patch; git stash list >/dev/null
cp kernel/loom/tests/tlb_shootdown.rs $out/tlb.keep; cp kernel/loom/tests/smp_bringup.rs $out/smp.keep
python3 -I $S/amplify.py kernel/loom/tests || exit 9
diff -u $out/tlb.keep kernel/loom/tests/tlb_shootdown.rs > $out/amplify-tlb.diff; diff -u $out/smp.keep kernel/loom/tests/smp_bringup.rs > $out/amplify-smp.diff
cargo test -q -p kernel-loom --test tlb_shootdown --test smp_bringup --no-run > $out/build.log 2>&1; echo "amplified build exit $?" >> $out/summary.txt
for t in tlb_shootdown smp_bringup; do
  f=0
  for i in $(seq 1 $n); do
    cargo test -q -p kernel-loom --test $t -- --test-threads=4 > $out/$t-$i.log 2>&1; rc=$?
    if [ $rc -ne 0 ]; then f=$((f+1)); grep -h "panicked at\|never ran" $out/$t-$i.log >> $out/$t-failures.txt; else rm $out/$t-$i.log; fi
  done
  echo "$t amplified --test-threads=4: $n runs, $f failed" >> $out/summary.txt
  [ -f $out/$t-failures.txt ] && sort $out/$t-failures.txt | uniq -c >> $out/summary.txt
done
cp $out/tlb.keep kernel/loom/tests/tlb_shootdown.rs; cp $out/smp.keep kernel/loom/tests/smp_bringup.rs
git diff | cmp -s - $out/base.patch && echo "restored to base diff" >> $out/summary.txt || echo "RESTORE MISMATCH" >> $out/summary.txt
cat $out/summary.txt
