#!/bin/bash
# Scratch: cross-builds the probe for x86_64-unknown-linux-musl on the
# development Mac with lib/crypto from the branch's commit $2 (a git rev of
# the worktree), patched by $3 if given (a variants/*.patch), into
# stage/<name>. $1 = cargo profile (shipped | unasserted), $4 = name.
set -euo pipefail
S=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/aes-gcm
W=~/Dev/jan/toyos-aes-gcm
TC=nightly-2026-07-22
PROFILE=$1 REV=$2 PATCH=${3:-} NAME=$4
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
rm -rf lib/crypto && mkdir -p lib/crypto
git -C $W archive $REV lib/crypto | tar -x -C lib/crypto --strip-components=2
if [ -n "$PATCH" ]; then patch -p1 -d lib/crypto < "$PATCH"; fi
# git archive stamps the commit time, which can predate the last build.
find lib/crypto -type f -exec touch {} +
export TOYOS_REV="$(git -C $W rev-parse --short=9 $REV)${PATCH:+ $(basename $PATCH .patch)}"
FEATURES=(); [ "$PROFILE" = unasserted ] && FEATURES=(--features unasserted)
cargo +$TC build --locked --profile "$PROFILE" ${FEATURES[@]+"${FEATURES[@]}"} --target x86_64-unknown-linux-musl
mkdir -p $S/stage
cp target/x86_64-unknown-linux-musl/$PROFILE/crypto-oracles $S/stage/$NAME
echo "built $S/stage/$NAME ($TOYOS_REV, $PROFILE)"
