#!/bin/sh
W=<path>
S=<path>
cd $W || exit 9
git rev-parse HEAD > $S/gates/HEAD
: > $S/gates/exits.txt
P=$S/mutants/initialise-first.patch
git apply --check $P || { echo "mutant does not apply" >> $S/gates/exits.txt; exit 9; }
git apply $P
git diff --stat -- system > $S/mutants/initialise-first.applied
cargo test -p acpiserver > $S/mutants/initialise-first.log 2>&1; echo "mutant initialise-first EXIT=$?" >> $S/gates/exits.txt
git apply -R $P
git diff --quiet -- system; echo "restored clean=$?" >> $S/gates/exits.txt
cargo test -p acpiserver > $S/gates/acpiserver.log 2>&1; echo "acpiserver EXIT=$?" >> $S/gates/exits.txt
cargo run -- --ci host > $S/gates/ci-host.log 2>&1; echo "ci-host EXIT=$?" >> $S/gates/exits.txt
cargo run -- --build-only > $S/gates/build-only.log 2>&1; echo "build-only EXIT=$?" >> $S/gates/exits.txt
cargo test > $S/gates/guest.log 2>&1; echo "guest EXIT=$?" >> $S/gates/exits.txt
echo DONE >> $S/gates/exits.txt
