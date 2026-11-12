#!/bin/bash
# cargo check of a guest crate for x86_64 against this head's sysroot, every target kept going. $1: crate dir.
SR=<home>/.cache/toyos/sysroots/8f462936e86a99b5
B=<home>/.cache/toyos/sysroots/8f462936e86a99b5/lib/rustlib/aarch64-apple-darwin/bin
cd "$1" || exit 1
CC_x86_64_unknown_toyos=$B/clang AR_x86_64_unknown_toyos=$B/llvm-ar CFLAGS_x86_64_unknown_toyos=--sysroot=$SR/lib/rustlib/x86_64-unknown-toyos/c \
TOYOS_IMAGE_KEY=0000000000000000000000000000000000000000000000000000000000000000 RUSTUP_TOOLCHAIN=$SR cargo check --target x86_64-unknown-toyos --profile toyos --keep-going --bins
