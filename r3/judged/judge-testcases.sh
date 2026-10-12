#!/bin/sh
# Judge every metal row that rides the `testcases` boot from the second
# judgement's readbacks: offline, touching no machine. Runs from the tree that
# built each image, under a scratch HOME whose metal record is a copy, so no
# judging here writes the host's record.
S=<home>/.claude/jobs/2280e09e/tmp/scratchpad/busywake-r3
H=$S/judgehome
for run in t14-head:head t14-base:base amd-head:head amd-base:base; do
  dir=${run%%:*}; tree=${run#*:}
  cd <home>/Dev/jan/toyos-busywake-judge-$tree || exit 2
  echo "== $dir from $(git rev-parse HEAD) $(git status --porcelain --ignore-submodules=none | wc -l | tr -d ' ') dirty"
  HOME=$H CARGO_HOME=<home>/.cargo RUSTUP_HOME=<home>/.rustup \
    cargo test --test toyos-build -- --metal --metal-readback $S/judged/$dir $(cat $S/rows-$tree.txt) > $S/judged/$dir.log 2>&1
  echo "$dir EXIT=$?"
done
