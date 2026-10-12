#!/bin/sh
# Scratch: smoke the scout kernel under QEMU, then stage the T14 images, for one judge tree.
# usage: judge.sh <head|base>
S=/private/tmp/claude-502/-Users-jan-Dev-jan-toyos/80e90c3a-7449-46b8-84cc-b59e9dd31ae9/scratchpad/busywake
which=$1
cd /Users/jan/Dev/jan/toyos-busywake-judge-$which || exit 9
git rev-parse HEAD > $S/judge/$which-head.txt
cargo test --test toyos-build -- scout_smoke > $S/judge/$which-smoke.log 2>&1; echo "EXIT=$?" >> $S/judge/$which-smoke.log
mkdir -p $S/metal/t14-$which
cargo test --test toyos-build -- --metal --metal-readback $S/metal/t14-$which scout_wake wake_onto_busy > $S/judge/$which-stage.log 2>&1; echo "EXIT=$?" >> $S/judge/$which-stage.log
echo done > $S/judge/$which.done
