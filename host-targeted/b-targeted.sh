#!/bin/bash
# B's targeted host checks: the unit tests and clippy of the two touched packages.
W=<path>
E=<path>
cd $W || exit 9
git rev-parse HEAD > $E/targeted.rev
L="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon -D warnings"
echo "+ cargo test -p bcachefs -p fileserver"; date -u
cargo test -p bcachefs -p fileserver > $E/test.log 2>&1; t=$?
echo "test exit $t" | tee -a $E/test.log; date -u
echo "+ cargo clippy -p bcachefs -p fileserver --all-targets -- $L"
cargo clippy -p bcachefs -p fileserver --all-targets -- $L > $E/clippy.log 2>&1; c=$?
echo "clippy exit $c" | tee -a $E/clippy.log; date -u
exit $(( t != 0 || c != 0 ))
