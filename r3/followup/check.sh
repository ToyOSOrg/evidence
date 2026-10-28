#!/bin/bash
# check.sh: the DATA follow-up applied, built, judged, and reverted, in one run.
cd <home>/Dev/jan/toyos-bench-fair
S=<scratch>/agents/bench-fair
P=$S/followup/data-on-the-nvme.patch
git apply --check $P && git apply $P || exit 2
echo "applied at $(git rev-parse --short HEAD)"
for t in x86_64-unknown-linux-musl aarch64-unknown-linux-musl; do
  CARGO_TARGET_DIR=$S/linux-target cargo +nightly-2026-07-22 check -q -p osbench --target $t --profile toyos > $S/followup/check-$t.log 2>&1; echo "osbench $t check EXIT=$?"
done
cargo test -q -p osbench-compare > $S/followup/compare.log 2>&1; echo "compare tests EXIT=$?"
for d in t14 t14-mounted t14-formatting; do
  cargo test --test toyos-build -- --metal --metal-readback $S/old-readback/$d osbench > $S/followup/judge-$d.log 2>&1
  echo "judge $d EXIT=$? $(grep -E 'PASS osbench|FAIL osbench' $S/followup/judge-$d.log | cut -c10-200)"
done
git apply -R $P && echo reverted
git status --porcelain --ignore-submodules=none | wc -l
