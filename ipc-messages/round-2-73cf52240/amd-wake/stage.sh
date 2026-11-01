#!/bin/bash
set -u
P=<scratch>; M=$P/r2/metal
cd <worktrees>/toyos-ipc-events || exit 70
for pair in "base:18060b521" "h1:343a655b1"; do
  name=${pair%%:*}; rev=${pair##*:}
  git checkout -q --detach "$rev" || exit 70
  python3 $P/r2/apply.py || exit 70
  { echo "$(git rev-parse HEAD) + measurement-only ipcwake (r2/apply.py, never committed)"; git diff --stat; } > $M-$name-prep.log
  cargo test --test toyos-build -- --metal --metal-readback $M/$name ipcwake >> $M-$name-prep.log 2>&1
  echo "exit $?" >> $M-$name-prep.log
  git checkout -q -- . && rm -f tests/guest/osbench/src/ipcwake.rs
  echo "restored: $(git status --porcelain | wc -l) changes" >> $M-$name-prep.log
done
git checkout -q ipc-messages
