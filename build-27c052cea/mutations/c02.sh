#!/bin/sh
# The row's release keeping the dead holder's record: isa_lines_reach_their_holder must go red on the T14.
W=/Users/jan/Dev/jan/toyos-ps2server
S=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/agents/899-build
P=$S/mut/c02-release-keeps-the-record.patch
D=$S/metal-control-isa-release
L=$S/mut/c02-release-keeps-the-record.log
cd $W || exit 1
git apply --check $P || exit 1
git apply $P
mkdir -p $D
echo "== c02: $P on $(git rev-parse HEAD); staged into $D" > $L
cargo test --test toyos-build -- --metal --metal-readback $D isa_lines_reach_their_holder >> $L 2>&1
echo "EXIT=$?" >> $L
git apply -R $P
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "c02: tree not clean"; exit 1; }
tail -1 $L
