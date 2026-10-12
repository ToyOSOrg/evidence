#!/bin/sh
# Every run round 3's evidence rests on, each with its own exit code.
# SSE runs under Rosetta with no AVX advertised, so the process's own dispatch takes SSE too.
cd "$(dirname "$0")/../rsq3" || exit 1
X=target/x86_64-apple-darwin/release/rsq3
L=../load.txt; R=../runs.txt
uptime > $L; : > $R
arch -x86_64 $X sweep sse > ../sweep-sse.txt 2>&1; echo "sweep-sse EXIT=$?" >> $R; uptime >> $L
ROSETTA_ADVERTISE_AVX=1 arch -x86_64 $X sweep avx > ../sweep-avx.txt 2>&1; echo "sweep-avx EXIT=$?" >> $R; uptime >> $L
target/release/rsq3 sweep neon > ../sweep-neon.txt 2>&1; echo "sweep-neon EXIT=$?" >> $R; uptime >> $L
arch -x86_64 $X testpoints sse > ../testpoints-sse.txt 2>&1; echo "testpoints-sse EXIT=$?" >> $R; uptime >> $L
ROSETTA_ADVERTISE_AVX=1 arch -x86_64 $X testpoints avx > ../testpoints-avx.txt 2>&1; echo "testpoints-avx EXIT=$?" >> $R; uptime >> $L
target/release/rsq3 testpoints neon > ../testpoints-neon.txt 2>&1; echo "testpoints-neon EXIT=$?" >> $R; uptime >> $L
arch -x86_64 $X cost sse > ../cost-sse.txt 2>&1; echo "cost-sse EXIT=$?" >> $R; uptime >> $L
ROSETTA_ADVERTISE_AVX=1 arch -x86_64 $X cost avx > ../cost-avx.txt 2>&1; echo "cost-avx EXIT=$?" >> $R; uptime >> $L
target/release/rsq3 cost neon > ../cost-neon.txt 2>&1; echo "cost-neon EXIT=$?" >> $R; uptime >> $L
echo done >> $R
