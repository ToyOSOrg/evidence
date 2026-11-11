#!/bin/bash
# The tagged-replies change: the SDK's tests and clippy, the loom models and the crate's clippy, then the default and
# testcases images (which compile pkg, the supervisor and pagerprobe beside the SDK).
D=<scratch>; cd $D/wt-tags || exit 2
L=$D/logs/$1; mkdir -p $L
$D/scripts/tags-subset.sh $1 sdk clippy-sdk loom
cd $D/wt-tags
run() { local name=$1; shift; echo "== $*" > $L/$name.log; "$@" >> $L/$name.log 2>&1; echo "rc=$?" >> $L/$name.log; echo "$name $(tail -1 $L/$name.log)" >> $L/summary.txt; }
run clippy-loom cargo clippy --manifest-path kernel/loom/Cargo.toml --tests -- -D warnings
run build-default cargo run -- --build-only
run build-testcases cargo run -- --build-only --boot-config tests/images/testcases.toml
