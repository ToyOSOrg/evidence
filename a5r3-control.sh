#!/bin/sh
# The fourth test's negative control: the explicit build without make_interpolator's
# cutoff scaling. Applied to a copy as a checked patch, built, run, reported, and the
# copy removed; the measured crate is never touched.
cd "$(dirname "$0")/.." || exit 1
rm -rf control/work && mkdir -p control/work && cp -R rsq3/Cargo.toml rsq3/Cargo.lock rsq3/src control/work/ || exit 1
cd control/work || exit 1
patch -p1 --dry-run < ../no-cutoff-scaling.patch > ../patch-check.txt 2>&1; echo "patch-check EXIT=$?" > ../control-runs.txt
patch -p1 < ../no-cutoff-scaling.patch >> ../patch-check.txt 2>&1; echo "patch EXIT=$?" >> ../control-runs.txt
cargo build --release --offline > ../control-build.txt 2>&1; echo "build EXIT=$?" >> ../control-runs.txt
target/release/rsq3 probe neon > ../control-probe-neon.txt 2>&1; echo "probe-neon EXIT=$?" >> ../control-runs.txt
cd .. && rm -rf work; echo "restored: the copy is removed" >> control-runs.txt
echo done >> control-runs.txt
