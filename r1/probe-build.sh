#!/bin/bash
# Scratch: the oracle probe with lib/crypto from $1 (rev or WORK), named $2, its P-256
# parts hook $3 (base or head; probe-hooks/$3.rs appended to nist.rs), optional patch $4.
set -euo pipefail
. <home>/.claude/jobs/2280e09e/tmp/scratchpad/agents/p256/env.sh
snapshot "$1" $P/probe/lib/crypto "${4:-}"
cat $P/probe-hooks/$3.rs >> $P/probe/lib/crypto/src/nist.rs
printf '\n#[doc(hidden)]\npub use nist::parts as p256_parts;\n' >> $P/probe/lib/crypto/src/lib.rs
cd $P/probe
export PROBE_BUILD=shipped-inc PROBE_CRYPTO="$2"
cargo +$TC build --locked --profile shipped-inc --target x86_64-unknown-linux-musl > $P/logs/probe-build-$2.log 2>&1
cp target/x86_64-unknown-linux-musl/shipped-inc/crypto-oracles $P/bin/crypto-oracles-$2
