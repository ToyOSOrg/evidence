#!/bin/sh
# #877 round 4, B9: the fourth test's negative control on every interpolator.
# The probe's exit code is its verdict: 0 when the explicit build is
# bit-identical to rubato's own dispatch at every pair, 1 when any pair differs.
# Green arm: the measured crate as it is. Red arm: a copy with the checked patch
# (the explicit build without make_interpolator's cutoff scaling), built, run,
# and removed in this script; the measured crate is never touched.
# SSE runs as x86-64 code under Rosetta 2 with no AVX advertised, AVX with
# ROSETTA_ADVERTISE_AVX=1, NEON natively.
cd "$(dirname "$0")/.." || exit 1
R=control-runs.txt
: > $R
X=target/x86_64-apple-darwin/release/rsq3
N=target/release/rsq3

cd rsq3 || exit 1
cargo build --release --offline > ../build-green-aarch64.txt 2>&1; echo "green build aarch64 EXIT=$?" >> ../$R
cargo build --release --offline --target x86_64-apple-darwin > ../build-green-x86_64.txt 2>&1; echo "green build x86_64 EXIT=$?" >> ../$R
arch -x86_64 $X probe sse > ../green-probe-sse.txt 2>&1; echo "green probe sse EXIT=$?" >> ../$R
ROSETTA_ADVERTISE_AVX=1 arch -x86_64 $X probe avx > ../green-probe-avx.txt 2>&1; echo "green probe avx EXIT=$?" >> ../$R
$N probe neon > ../green-probe-neon.txt 2>&1; echo "green probe neon EXIT=$?" >> ../$R
cd .. || exit 1

rm -rf control/work && mkdir -p control/work && cp -R rsq3/Cargo.toml rsq3/Cargo.lock rsq3/src control/work/ || exit 1
cd control/work || exit 1
patch -p1 --dry-run < ../no-cutoff-scaling.patch > ../patch-check.txt 2>&1; echo "red patch dry-run EXIT=$?" >> ../../$R
patch -p1 < ../no-cutoff-scaling.patch >> ../patch-check.txt 2>&1; echo "red patch EXIT=$?" >> ../../$R
cargo build --release --offline > ../../build-red-aarch64.txt 2>&1; echo "red build aarch64 EXIT=$?" >> ../../$R
cargo build --release --offline --target x86_64-apple-darwin > ../../build-red-x86_64.txt 2>&1; echo "red build x86_64 EXIT=$?" >> ../../$R
arch -x86_64 $X probe sse > ../../red-probe-sse.txt 2>&1; echo "red probe sse EXIT=$?" >> ../../$R
ROSETTA_ADVERTISE_AVX=1 arch -x86_64 $X probe avx > ../../red-probe-avx.txt 2>&1; echo "red probe avx EXIT=$?" >> ../../$R
$N probe neon > ../../red-probe-neon.txt 2>&1; echo "red probe neon EXIT=$?" >> ../../$R
cd ../.. || exit 1
rm -rf control/work && echo "restored: the patched copy is removed" >> $R
echo done >> $R
