#!/bin/sh
# usage: profile.sh <label> ; builds benchcase in the worktree (profiling patch applied) and profiles it
set -e
L=$1
S=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/ipc-latency
W=~/Dev/jan/toyos-ipc-latency
B=~/.rustup/toolchains/nightly-2026-07-22-aarch64-apple-darwin/lib/rustlib/aarch64-apple-darwin/bin
mkdir -p $S/prof/$L
cd $W && cargo run -q -- --build-only --boot-config tests/images/benchcase.toml > $S/prof/$L/build.log 2>&1
K=$(ls -t $W/target/kernel-x86_64-* | head -1)
cp $K $S/prof/$L/kernel.elf
$B/llvm-nm -n --defined-only $K | awk '$2 ~ /[tT]/' > $S/prof/$L/kernel.nm
$S/tools/runprof.sh $W/target/bootable-benchcase.img $S/prof/$L/counts 4 > $S/prof/$L/qemu.log 2>&1
grep -a "osbench v=2" $S/prof/$L/qemu.log | sed 's/.*bench=//' | cut -c1-200
