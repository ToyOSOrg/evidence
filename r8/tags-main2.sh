#!/bin/bash
# #1272 rebased onto main ee15a2e5b (#1258 and #1252): the SDK's tests and clippy, the flight models, the file server's
# tests, the supervisor's and pkg's tests and clippy, and the testcases image; then every rust-tests binary
# type-checked against that image's sysroot.
D=<scratch>; cd $D/wt-tags || exit 2
L=$D/logs/$1; mkdir -p $L; { git rev-parse HEAD; git status --porcelain --ignore-submodules=none; } > $L/tree.txt
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon -D warnings"
run() { local name=$1; shift; echo "== $*" > $L/$name.log; "$@" >> $L/$name.log 2>&1; echo "rc=$?" >> $L/$name.log; echo "$name $(tail -1 $L/$name.log)" >> $L/summary.txt; }
run sdk cargo test -p toyos --lib
run clippy-sdk cargo clippy -p toyos --all-targets -- $A
run clippy-sdk-fd cargo clippy -p toyos --lib --features fd-table -- $A
run loom-flight cargo test --manifest-path kernel/loom/Cargo.toml --test fs_flight
run fileserver cargo test --manifest-path system/fileserver/Cargo.toml
run supervisor cargo test -p supervisor
run clippy-supervisor-pkg cargo clippy -p supervisor -p pkg --all-targets -- $A
run build-testcases cargo run -- --build-only --boot-config tests/images/testcases.toml
S=$(sed -n 's/.*Building sysroot \([0-9a-f]*\):.*/\1/p' $L/build-testcases.log | head -1)
[ -z "$S" ] && S=$(sed -n 's/.*sysroots\/\([0-9a-f]\{16\}\).*/\1/p' $L/build-testcases.log | head -1)
echo "sysroot $S" >> $L/summary.txt
SR=$HOME/.cache/toyos/sysroots/$S; H=$SR/lib/rustlib/aarch64-apple-darwin/bin
run check-rust-tests env -u RUSTFLAGS -u RUSTC RUSTUP_TOOLCHAIN=$SR CC_x86_64_unknown_toyos=$H/clang AR_x86_64_unknown_toyos=$H/llvm-ar CFLAGS_x86_64_unknown_toyos=--sysroot=$SR/lib/rustlib/x86_64-unknown-toyos/c bash -c 'cd tests/guest/rust-tests && cargo check --target x86_64-unknown-toyos --profile release --bins'
rm -rf tests/guest/rust-tests/target
git status --porcelain --ignore-submodules=none >> $L/tree.txt
