#!/bin/bash
# Scratch: toyos-crypto as an rlib for x86_64-unknown-linux-musl in [profile.toyos]'s
# settings (opt-level 2, assertions on, 256 CGUs, incremental), from $1 (rev or WORK),
# named $2; disassembly into inspect/$2.s.
set -euo pipefail
. <home>/.claude/jobs/2280e09e/tmp/scratchpad/agents/p256/env.sh
D=$P/inspect-src/$2
snapshot "$1" $D "${3:-}"
cat >> $D/Cargo.toml <<'T'

[workspace]

[profile.toyos]
inherits = "dev"
opt-level = 2
debug = true
debug-assertions = true
overflow-checks = true
T
cp $W/Cargo.lock $D/
cd $D
CARGO_TARGET_DIR=$P/inspect-target/$2 cargo +$TC build --offline --profile toyos --target x86_64-unknown-linux-musl --features "${FEATURES:-sign}" > $P/logs/inspect-build-$2.log 2>&1
RLIB=$(ls -t $P/inspect-target/$2/x86_64-unknown-linux-musl/toyos/deps/libtoyos_crypto-*.rlib | head -1)
llvm-objdump -d --no-show-raw-insn -M intel --demangle "$RLIB" > $P/inspect/$2.s
echo $P/inspect/$2.s
