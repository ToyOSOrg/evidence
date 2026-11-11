#!/bin/bash
# A's targeted host checks after its rebase onto main: the unit tests of the
# three touched packages and clippy of the two the gate lints (a program has
# no clippy shape).
W=<path>
E=<path>
cd $W || exit 9
git rev-parse HEAD > $E/targeted.rev
L="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon -D warnings"
echo "+ cargo test -p toyos-blockring -p diskserver -p toyos"; date -u
cargo test -p toyos-blockring -p diskserver -p toyos > $E/test.log 2>&1; t=$?
echo "test exit $t" | tee -a $E/test.log; date -u
echo "+ cargo clippy -p toyos-blockring -p toyos --all-targets -- $L"
cargo clippy -p toyos-blockring -p toyos --all-targets -- $L > $E/clippy.log 2>&1; c=$?
echo "clippy exit $c" | tee -a $E/clippy.log; date -u
exit $(( t != 0 || c != 0 ))
