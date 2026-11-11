#!/bin/bash
# Targeted host checks for the touched crates, each logged with its exit code. $1: run tag.
S=<scratch>
T=$1
cd <worktree> || exit 1
L=$S/host-$T
mkdir -p $L
git rev-parse HEAD > $L/rev
git status --porcelain --ignore-submodules=none > $L/status
run() { local name=$1; shift; { echo "\$ $*"; "$@"; echo "exit $?"; } > $L/$name.log 2>&1; tail -1 $L/$name.log | sed "s/^/$name: /"; }
run abi cargo test -p toyos-abi
run sdk cargo test -p toyos
run kernel cargo test -p kernel --lib --features sched-check
run libs cargo test -p toyos-manifest -p toyos-session -p toyos-swap
for p in disks diskserver fileserver netstack nvme pkg session soundserver sshserver; do
  run prog-$p cargo test --manifest-path system/$p/Cargo.toml
done
