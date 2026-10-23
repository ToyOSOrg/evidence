#!/bin/bash
# Scratch: cross-builds toyos-crypto's lib and differential tests for
# x86_64-unknown-linux-musl, opt-level 2 with debug assertions (the guest's
# codegen settings). $1 = revision, $2 = optional patch.
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
export CARGO_TARGET_X86_64_UNKNOWN_LINUX_MUSL_LINKER=rust-lld
REV=$(git -C $W rev-parse --short=9 "$1")
NAME=$REV
D=$S/crypto-tests/src
rm -rf $D && mkdir -p $D
git -C $W archive "$REV" lib/crypto | tar -x -m --strip-components=2 -C $D
if [ -n "${2:-}" ]; then patch -d $D -p3 --forward < "$2"; NAME=$REV+$(basename "$2" .patch); fi
printf '\n[workspace]\n\n[profile.dev]\nopt-level = 2\n' >> $D/Cargo.toml
cp $W/Cargo.lock $D/
cd $D
cargo +$TC test --target x86_64-unknown-linux-musl --lib --test differential --no-run --message-format=json-render-diagnostics > $S/logs/test-build-$NAME.json
mkdir -p $S/test-bin
for exe in $(python3 -I -c 'import json,sys
for l in sys.stdin:
    m=json.loads(l)
    if m.get("reason")=="compiler-artifact" and m.get("executable") and m["target"]["name"] in ("toyos_crypto","differential"): print(m["target"]["name"]+"="+m["executable"])' < $S/logs/test-build-$NAME.json); do
  cp "${exe#*=}" $S/test-bin/${exe%%=*}-$NAME
done
