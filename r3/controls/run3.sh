#!/bin/bash
# run3.sh: m5 and m6 each applied, osbench-compare tested, and reverted, in one run.
cd <home>/Dev/jan/toyos-bench-fair
M=<scratch>/agents/bench-fair/mutations
for p in m5-media-never-differ m6-clocks-never-apart; do
  git apply --check $M/$p.patch && git apply $M/$p.patch || { echo "$p: does not apply"; continue; }
  cargo build -q -p osbench-compare --tests > $M/$p.build.log 2>&1; echo "$p build EXIT=$?"
  cargo test -q -p osbench-compare > $M/$p.test.log 2>&1; echo "$p test EXIT=$?"
  grep -E "panicked at" $M/$p.test.log | head -3
  git apply -R $M/$p.patch && echo "$p restored"
done
git status --porcelain --ignore-submodules=none | wc -l
