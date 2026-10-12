#!/bin/sh
# The proposed host test's points, on each interpolator, each with its own exit code.
cd "$(dirname "$0")/../rsq3" || exit 1
X=target/x86_64-apple-darwin/release/rsq3
L=../testpoints-load.txt; R=../testpoints-runs.txt
uptime > $L; : > $R
arch -x86_64 $X testpoints sse > ../testpoints-sse.txt 2>&1; echo "testpoints-sse EXIT=$?" >> $R; uptime >> $L
ROSETTA_ADVERTISE_AVX=1 arch -x86_64 $X testpoints avx > ../testpoints-avx.txt 2>&1; echo "testpoints-avx EXIT=$?" >> $R; uptime >> $L
target/release/rsq3 testpoints neon > ../testpoints-neon.txt 2>&1; echo "testpoints-neon EXIT=$?" >> $R; uptime >> $L
echo done >> $R
