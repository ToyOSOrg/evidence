#!/bin/bash
# Scratch: aarch64-apple-darwin build of the SHA probe. $1 profile, $2 revision.
set -euo pipefail
S=$SCRATCH/poly1305-inline
W=$DEV/toyos-poly1305-inline
REV=$(git -C $W rev-parse --short=9 "$2")
cd $S/arm
rm -rf lib/crypto && mkdir -p lib/crypto
git -C $W archive "$REV" lib/crypto | tar -x -m --strip-components=2 -C lib/crypto
cargo +nightly-2026-07-22 build --profile "$1" -vv
mkdir -p $S/arm-bin && cp target/$1/arm-sha $S/arm-bin/arm-sha-$1-$REV
