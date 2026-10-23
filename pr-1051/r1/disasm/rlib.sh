#!/bin/bash
# Scratch: builds toyos-crypto alone in [profile.toyos] for a guest triple ($1) into $2, and disassembles its rlib to $3.
set -euo pipefail
TC=~/.cache/toyos/sysroots/51623e930b3ce108
OD=~/.rustup/toolchains/nightly-2026-07-22-aarch64-apple-darwin/lib/rustlib/aarch64-apple-darwin/bin/llvm-objdump
cd ~/Dev/jan/toyos-mlkem
RUSTUP_TOOLCHAIN=$TC CARGO_TARGET_DIR=$2 cargo build -p toyos-crypto --target $1 --profile toyos
$OD -d --no-show-raw-insn -C $2/$1/toyos/libtoyos_crypto.rlib > $3
