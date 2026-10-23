#!/bin/bash
# Scratch: cross-builds the oracle probe for x86_64-unknown-linux-musl on the
# development Mac. $1 = cargo profile (shipped | unasserted).
set -euo pipefail
S=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/mlkem
TC=nightly-2026-07-22
BIN=$(rustc +$TC --print sysroot)/lib/rustlib/aarch64-apple-darwin/bin
export PATH="$BIN:$PATH"
SYSROOT=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/crypto-oracles/sysroot-x86_64-musl
export CC_x86_64_unknown_linux_musl=/usr/bin/clang
export CXX_x86_64_unknown_linux_musl=/usr/bin/clang++
export AR_x86_64_unknown_linux_musl=$BIN/llvm-ar
export RANLIB_x86_64_unknown_linux_musl="$BIN/llvm-ar s"
export CFLAGS_x86_64_unknown_linux_musl="--target=x86_64-unknown-linux-musl --sysroot=$SYSROOT"
export CXXFLAGS_x86_64_unknown_linux_musl="$CFLAGS_x86_64_unknown_linux_musl"
cd $S/probe
FEATURES=(); [ "$1" = unasserted ] && FEATURES=(--features unasserted)
cargo +$TC build --locked --profile "$1" ${FEATURES[@]+"${FEATURES[@]}"} --target x86_64-unknown-linux-musl -vv
