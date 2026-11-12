#!/bin/bash
# The control branch's testcases image, built at its own commit in a detached checkout, then the branch restored.
D=<scratch>; cd $D/wt-step1 || exit 2
L=$D/logs/ctl-build-r8b; mkdir -p $L
git checkout -q --detach fileops-step1-ctl-refuse || exit 3
{ git rev-parse HEAD; git diff --stat; git diff fileops-step1 --stat; } > $L/tree.txt
cargo run -- --build-only --boot-config tests/images/testcases.toml > $L/build.log 2>&1; echo "rc=$?" >> $L/build.log
git checkout -q fileops-step1
git status --porcelain > $L/status.txt
