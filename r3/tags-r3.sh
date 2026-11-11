#!/bin/bash
# Round 3 of #1272 on #1258's r6: the SDK's tests and clippy, blockring's, the file server's (which now holds the
# block bound), the loom models and their clippy, then every control model by model.
D=<scratch>; cd $D || exit 2
scripts/tags-subset.sh tags-13 sdk clippy-sdk loom blockring
cd wt-tags
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon -D warnings"
L=$D/logs/tags-13
run() { local name=$1; shift; echo "== $*" > $L/$name.log; "$@" >> $L/$name.log 2>&1; echo "rc=$?" >> $L/$name.log; echo "$name $(tail -1 $L/$name.log)" >> $L/summary.txt; }
run clippy-loom cargo clippy --manifest-path kernel/loom/Cargo.toml --tests -- -D warnings
run fileserver cargo test --manifest-path system/fileserver/Cargo.toml
run clippy-fileserver cargo clippy --manifest-path system/fileserver/Cargo.toml --all-targets --keep-going -- $A
cd $D && controls/tags-wakes.sh tags-ctl4
