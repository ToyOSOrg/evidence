#!/bin/sh
# Which interpolator each process's own dispatch takes, and whether the explicit build matches it.
cd "$(dirname "$0")/../rsq3" || exit 1
X=target/x86_64-apple-darwin/release/rsq3
arch -x86_64 $X probe sse > ../probe-sse.txt 2>&1; echo "probe-sse EXIT=$?" > ../probe-runs.txt
ROSETTA_ADVERTISE_AVX=1 arch -x86_64 $X probe avx > ../probe-avx.txt 2>&1; echo "probe-avx EXIT=$?" >> ../probe-runs.txt
ROSETTA_ADVERTISE_AVX=1 arch -x86_64 $X probe sse > ../probe-sse-on-avx-cpu.txt 2>&1; echo "probe-sse-on-avx-cpu EXIT=$?" >> ../probe-runs.txt
target/release/rsq3 probe neon > ../probe-neon.txt 2>&1; echo "probe-neon EXIT=$?" >> ../probe-runs.txt
echo done >> ../probe-runs.txt
