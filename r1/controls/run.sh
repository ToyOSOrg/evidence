#!/bin/bash
# run.sh: each mutation applied, its package tested, and reverted, in one run.
cd <home>/Dev/jan/toyos-bench-fair
M=<scratch>/agents/bench-fair/mutations
for m in m1-steady-10ms:osbench-rules m2-setup-mixed:osbench-compare m3-clock-never-falls:osbench-compare; do
  p=${m%%:*}; pkg=${m#*:}
  git apply --check $M/$p.patch && git apply $M/$p.patch || { echo "$p: does not apply"; continue; }
  cargo build -q -p $pkg --tests > $M/$p.build.log 2>&1; echo "$p build EXIT=$?"
  cargo test -q -p $pkg > $M/$p.test.log 2>&1; echo "$p test EXIT=$?"
  grep -E "^test .* FAILED|panicked at" $M/$p.test.log | head -4
  git apply -R $M/$p.patch && echo "$p restored"
done
git status --short tests/guest/osbench/rules/src tests/guest/osbench/compare/src
