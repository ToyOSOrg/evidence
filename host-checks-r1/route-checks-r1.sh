#!/bin/bash
# #1225 targeted checks: the SDK's files:: host tests and clippy's two toyos shapes (build/clippy.rs).
D=<scratch>; cd $D/wt || exit 2
L=$D/logs; { git rev-parse HEAD; git diff --stat; } > $L/route-checks-r1.rev
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon -D warnings"
cargo test -p toyos --lib files:: > $L/route-test-r1.log 2>&1; echo "rc=$?" >> $L/route-test-r1.log
cargo clippy -p toyos --all-targets -- $A > $L/route-clippy-all-r1.log 2>&1; echo "rc=$?" >> $L/route-clippy-all-r1.log
cargo clippy -p toyos --lib --features fd-table -- $A > $L/route-clippy-fd-r1.log 2>&1; echo "rc=$?" >> $L/route-clippy-fd-r1.log
