#!/bin/bash
# Scratch: cross-builds the oracle probe for x86_64-unknown-linux-musl on the
# development Mac. $1 = cargo profile (shipped-inc | shipped-noninc),
# $2 = ToyOS revision whose lib/crypto the probe takes, $3 = optional patch
# applied to that lib/crypto (-p2 from the repository root) and its name.
set -euo pipefail
S=$SCRATCH/poly1305-inline
O=$SCRATCH/crypto-oracles
W=$DEV/toyos-poly1305-inline
TC=nightly-2026-07-22
BIN=$(rustc +$TC --print sysroot)/lib/rustlib/aarch64-apple-darwin/bin
export PATH="$BIN:$PATH"
SYSROOT=$O/sysroot-x86_64-musl
export CC_x86_64_unknown_linux_musl=/usr/bin/clang
export CXX_x86_64_unknown_linux_musl=/usr/bin/clang++
export AR_x86_64_unknown_linux_musl=$BIN/llvm-ar
export RANLIB_x86_64_unknown_linux_musl="$BIN/llvm-ar s"
export CFLAGS_x86_64_unknown_linux_musl="--target=x86_64-unknown-linux-musl --sysroot=$SYSROOT"
export CXXFLAGS_x86_64_unknown_linux_musl="$CFLAGS_x86_64_unknown_linux_musl"
REV=$(git -C $W rev-parse --short=9 "$2")
cd $S/probe
rm -rf lib/crypto && mkdir -p lib/crypto
git -C $W archive "$REV" lib/crypto | tar -x -m --strip-components=2 -C lib/crypto
NAME=$REV
if [ -n "${3:-}" ]; then patch -d lib/crypto -p3 --forward < "$3"; NAME=$REV+$(basename "$3" .patch); fi
export PROBE_BUILD="$1" PROBE_CRYPTO="$NAME"
cargo +$TC build --locked --profile "$1" --target x86_64-unknown-linux-musl -vv
mkdir -p $S/bin
cp target/x86_64-unknown-linux-musl/$1/crypto-oracles $S/bin/crypto-oracles-$1-$NAME
