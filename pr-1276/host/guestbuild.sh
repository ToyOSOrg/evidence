#!/bin/bash
# guestbuild.sh <worktree> <sysroot> <fork-or-empty> <bins...>: build guest test binaries as build_toyos_bin does.
WT=$1; SR=$2; FORK=$3; shift 3; GT=<scratch>/guest-target-$(basename $SR)
H=$(rustc -vV | sed -n 's/^host: //p')
T=x86_64-unknown-toyos; U=x86_64_unknown_toyos
args=(build --target $T --profile toyos --target-dir $GT)
for b in "$@"; do args+=(--bin "$b"); done
[ -n "$FORK" ] && args+=(--config "patch.\"https://github.com/ToyOSOrg/mio\".mio.path=\"$FORK\"")
cd "$WT/tests/guest/rust-tests" && env -u RUSTFLAGS -u RUSTC RUSTUP_TOOLCHAIN=$SR \
  CC_$U=$SR/lib/rustlib/$H/bin/clang AR_$U=$SR/lib/rustlib/$H/bin/llvm-ar CFLAGS_$U=--sysroot=$SR/lib/rustlib/$T/c \
  cargo "${args[@]}"
