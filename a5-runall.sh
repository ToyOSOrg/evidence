#!/bin/sh
# Every run the evidence rests on, each with its own exit code.
cd "$(dirname "$0")/../rsq2" || exit 1
uptime > load.txt
target/release/rsq2 sweep > sweep-neon.txt 2>&1; echo "sweep-neon EXIT=$?" > runs.txt
ROSETTA_ADVERTISE_AVX=1 arch -x86_64 target/x86_64-apple-darwin/release/rsq2 sweep > sweep-avx.txt 2>&1; echo "sweep-avx EXIT=$?" >> runs.txt
uptime >> load.txt
target/release/rsq2 cost > cost-neon.txt 2>&1; echo "cost-neon EXIT=$?" >> runs.txt
uptime >> load.txt
ROSETTA_ADVERTISE_AVX=1 arch -x86_64 target/x86_64-apple-darwin/release/rsq2 cost > cost-avx.txt 2>&1; echo "cost-avx EXIT=$?" >> runs.txt
uptime >> load.txt
echo done >> runs.txt
