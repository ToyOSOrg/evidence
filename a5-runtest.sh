#!/bin/sh
# The proposed host test's points, on both interpolators, each with its own exit code.
cd "$(dirname "$0")/../rsq2" || exit 1
uptime > testpoints-load.txt
target/release/rsq2 testpoints > testpoints-neon.txt 2>&1; echo "testpoints-neon EXIT=$?" > testpoints-runs.txt
ROSETTA_ADVERTISE_AVX=1 arch -x86_64 target/x86_64-apple-darwin/release/rsq2 testpoints > testpoints-avx.txt 2>&1; echo "testpoints-avx EXIT=$?" >> testpoints-runs.txt
uptime >> testpoints-load.txt
echo done >> testpoints-runs.txt
