#!/bin/sh
# Scratch: every simulator, loom and mutation measurement, at the head, in the detached sim worktree.
S=/private/tmp/claude-502/-Users-jan-Dev-jan-toyos/80e90c3a-7449-46b8-84cc-b59e9dd31ae9/scratchpad/busywake
T=/Users/jan/Dev/jan/toyos-busywake-sim
cd $T || exit 9
rm -rf $S/final; mkdir -p $S/final
$S/simrun.sh
$S/mutate.sh
out=$S/final/storm-arms.log
echo "tree $(git rev-parse HEAD); each arm off alone, by the patches in mutations/" > $out
for p in none no-fair-forward busy-target-unkicked threshold-two; do
  echo "== $p" >> $out
  if [ $p != none ]; then git apply --check $S/mut/$p.patch && git apply $S/mut/$p.patch; fi
  cargo test -p kernel-sim --test policy a_wakeup_storm -- --nocapture > $S/final/storm-$p.raw 2>&1; code=$?
  grep -E "^storm|test result" $S/final/storm-$p.raw >> $out; echo "cargo EXIT=$code" >> $out; rm $S/final/storm-$p.raw
  if [ $p != none ]; then git apply -R $S/mut/$p.patch; fi
done
cp $S/zz/zz_restage.rs kernel/sim/tests/
echo "tree $(git rev-parse HEAD)" > $S/final/restage-head.log
cargo test -p kernel-sim --test zz_restage -- --nocapture >> $S/final/restage-head.log 2>&1; echo "EXIT=$?" >> $S/final/restage-head.log
rm kernel/sim/tests/zz_restage.rs
git status --porcelain > $S/final/tree-after.txt
echo done > $S/final/headrun.done
