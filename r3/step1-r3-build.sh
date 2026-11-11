#!/bin/bash
# Round 3 of #1258: the testcases image at the head (pagerprobe compiled), then the control that refuses every
# holder write, built the same way to show it compiles; the control is restored after.
D=<scratch>; cd $D/wt-step1 || exit 2
L=$D/logs/step1-r3; mkdir -p $L
{ git rev-parse HEAD; git diff --stat; } > $L/tree.txt
cargo run -- --build-only --boot-config tests/images/testcases.toml > $L/build-head.log 2>&1; echo "rc=$?" >> $L/build-head.log
