#!/bin/bash
# run.sh <patch> <test filter> [secs]: apply the mutation, build, run the
# matching bcachefs lib tests under a watchdog (default 300 s), restore and
# verify the files' hashes, all in one run. Writes <patch>.log.
set -u
P=$1; T=$2; W=$WORKTREE; L=$P.log
cd $W
files=$(grep '^+++ b/' $P | sed 's|^+++ b/||; s|\t.*||')
before=$(shasum -a 256 $files)
{
  echo "patch: $P"; echo "test: $T"; echo "base: $(git rev-parse HEAD) plus the working tree"
  echo "files before: $before"
  git apply $P || { echo "APPLY FAILED"; exit 2; }
  B=$(cargo test -p bcachefs --lib --no-run 2>&1 | tee /dev/stderr | grep -o 'target/debug/deps/bcachefs-[0-9a-f]*' | tail -1)
  if [ -n "$B" ]; then
    ./$B "$T" 2>&1 & PID=$!
    for i in $(seq 1 ${3:-300}); do kill -0 $PID 2>/dev/null || break; sleep 1; done
    kill -0 $PID 2>/dev/null && { kill $PID; echo "KILLED by the watchdog"; }
    wait $PID; echo "test exit: $?"
  else
    echo "BUILD FAILED"
  fi
  git apply -R $P; touch $files
  after=$(shasum -a 256 $files)
  [ "$before" = "$after" ] && echo "restored: hashes equal" || echo "RESTORE MISMATCH"
} > $L 2>&1
grep -E 'test exit|restored|RESTORE|APPLY|BUILD FAILED|KILLED|^test .*(ok|FAILED)$|panicked at' -A1 $L | grep -v '^--' | cut -c1-300
