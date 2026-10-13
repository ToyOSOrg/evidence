#!/bin/sh
# mask_windows's base arm: the production half reverted onto the base, staged for the T14.
W=/Users/jan/Dev/jan/toyos-ps2server
S=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/agents/899-build
P=$S/mut/c01-whole-change-reverted.patch
D=$S/metal-base
L=$S/mut/c03-mask-windows-base.log
cd $W || exit 1
git apply --check $P || exit 1
git apply $P
mkdir -p $D
echo "== c03: $P on $(git rev-parse HEAD); staged into $D" > $L
cargo test --test toyos-build -- --metal --metal-readback $D mask_windows >> $L 2>&1
echo "EXIT=$?" >> $L
git apply -R $P
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "c03: tree not clean"; exit 1; }
tail -1 $L
