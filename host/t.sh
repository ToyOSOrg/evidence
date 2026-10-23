#!/bin/bash
# t.sh <filter> [secs]: the bcachefs lib tests matching <filter>, killed after
# [secs] (default 120) by PID; output to scratch/t.out.
cd $WORKTREE
B=$(cargo test -p bcachefs --lib --no-run 2>&1 | tee $SCRATCH/build.out | grep -o 'target/debug/deps/bcachefs-[0-9a-f]*' | tail -1)
[ -z "$B" ] && { grep -E "^error" -A9 $SCRATCH/build.out | head -40; exit 2; }
./$B "$1" $3 > $SCRATCH/t.out 2>&1 & P=$!
for i in $(seq 1 ${2:-120}); do kill -0 $P 2>/dev/null || break; sleep 1; done
kill -0 $P 2>/dev/null && { kill $P; echo "KILLED after ${2:-120}s"; }
wait $P; echo "exit $?"
grep -E "^test |panicked|left:|right:|test result" -A2 $SCRATCH/t.out | grep -v "^--" | head -40
