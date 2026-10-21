#!/bin/sh
# Negative controls for the module-level lints on toyos::transport:
#  1. an `unsafe` block under an inner `#[allow(unsafe_code)]` in transport/arena.rs must not compile (forbid holds for every item moved).
#  2. the same `unsafe` outside transport (in sdk/toyos/src/lib.rs, where unsafe is allowed) compiles: control on the control.
#  3. an unchecked `+` in transport/arena.rs reds clippy (arithmetic_side_effects forbidden in non-test builds).
set -u
cd $DEV/toyos-transport-merge
A=sdk/toyos/src/transport/arena.rs
L=sdk/toyos/src/lib.rs
cp $A $A.orig; cp $L $L.orig
restore() { mv $A.orig $A; mv $L.orig $L; touch $A $L; }
echo '#[allow(unsafe_code)] pub fn mutant() -> u8 { unsafe { core::ptr::read(&1u8) } }' >> $A
cargo check -p toyos 2>&1; echo "UNSAFE_IN_TRANSPORT_EXIT=$?"
cp $A.orig $A
echo 'pub fn mutant() -> u8 { unsafe { core::ptr::read(&1u8) } }' >> $L
cargo check -p toyos 2>&1; echo "UNSAFE_OUTSIDE_EXIT=$?"
cp $L.orig $L
echo 'pub fn mutant(a: u32, b: u32) -> u32 { a + b }' >> $A
cargo clippy -p toyos 2>&1; echo "ARITH_IN_TRANSPORT_EXIT=$?"
restore
cmp $A <(git show :$A) >/dev/null 2>&1 || true
cargo check -p toyos 2>&1 | tail -1; echo "RESTORED_EXIT=$?"
