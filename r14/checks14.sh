#!/bin/bash
# Run 14: the get_sent and adopted_services_stay fixes on main 302fb3698: the image, the touched crates' host suites, every kernel clippy shape
# of build/clippy.rs, and clippy on the other touched packages. checks14.out sums up; each log ends with its exit.
S=<scratch>
cd <worktree>2 || exit 1
L=$S/r14; mkdir -p $L
{ echo "head $(git rev-parse HEAD)"; git status --porcelain --ignore-submodules=none | sed 's/^/dirty: /'; } > $S/checks14.out
A="-W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon"
INSTR="debug-wait,sched-check,sched-tripwire,heap-tripwire,heap-sweep,pass-spin,stack-witness,switch-witness,switch-witness-mutate-frame,switch-witness-mutate-rsp,df-witness,df-witness-mutate,entry-df-unclean,mask-windows"
AINSTR="debug-wait,sched-check,sched-tripwire,heap-tripwire,heap-sweep,pass-spin,stack-witness,switch-witness,switch-witness-mutate-frame,switch-witness-mutate-rsp,mask-windows"
CONTROLS="kernel/counting-allocator,kernel/iova-past-four-gib,kernel/sched-tripwire"
run() { local name=$1; shift; { echo "\$ $*"; "$@"; echo "exit $?"; } > $L/$name.log 2>&1; tail -1 $L/$name.log | sed "s/^/$name: /" >> $S/checks14.out; }
run build-only cargo run -q -- --build-only
run test-abi cargo test -p toyos-abi
run test-sdk cargo test -p toyos
run test-kernel cargo test -p kernel --lib --features sched-check
run test-libs cargo test -p toyos-manifest -p toyos-session -p toyos-swap
run test-shell-copies cargo test -p shell-copies
run test-toybox-copies cargo test -p toybox-copies
for p in disks diskserver fileserver netstack nvme pkg session soundserver sshserver; do
  run test-$p cargo test --manifest-path system/$p/Cargo.toml
done
run clippy-kernel-host cargo clippy -p kernel --lib --tests --features sched-check -- $A -D warnings
run clippy-kernel-host-controls cargo clippy -p kernel --lib --tests --features sched-check,protocol-port --features $CONTROLS -- $A -D warnings
run clippy-kernel-x86 cargo clippy -p kernel --target x86_64-unknown-none -- $A -D warnings
run clippy-kernel-x86-boot-test cargo clippy -p kernel --target x86_64-unknown-none --features boot-actuators,test-actuators -- $A -D warnings
run clippy-kernel-x86-boot cargo clippy -p kernel --target x86_64-unknown-none --features boot-actuators -- $A -D warnings
run clippy-kernel-x86-instruments cargo clippy -p kernel --target x86_64-unknown-none --features $INSTR -- $A -D warnings
run clippy-kernel-x86-notail-lockspin cargo clippy -p kernel --target x86_64-unknown-none --features heap-band-notail,heap-lockspin -- $A -D warnings
run clippy-kernel-x86-nohead cargo clippy -p kernel --target x86_64-unknown-none --features heap-band-nohead -- $A -D warnings
run clippy-kernel-aarch64 cargo clippy -p kernel --target aarch64-unknown-none-softfloat -- $A -D warnings
run clippy-kernel-aarch64-boot-test cargo clippy -p kernel --target aarch64-unknown-none-softfloat --features boot-actuators,test-actuators -- $A -D warnings
run clippy-kernel-aarch64-boot cargo clippy -p kernel --target aarch64-unknown-none-softfloat --features boot-actuators -- $A -D warnings
run clippy-kernel-aarch64-instruments cargo clippy -p kernel --target aarch64-unknown-none-softfloat --features $AINSTR -- $A -D warnings
run clippy-sdk cargo clippy -p toyos --all-targets -- $A -D warnings
run clippy-sdk-fdtable cargo clippy -p toyos --lib --features fd-table -- $A -D warnings
run clippy-libs cargo clippy -p toyos-manifest -p toyos-session -p toyos-swap -p shell-copies -p toybox-copies --all-targets --keep-going -- $A -D warnings
run clippy-abi cargo clippy -p toyos-abi --all-targets --keep-going --target-dir target/clippy-abi -- -W clippy::undocumented_unsafe_blocks -D warnings
git status --porcelain --ignore-submodules=none | wc -l | sed 's/^/dirty files after: /' >> $S/checks14.out
echo done >> $S/checks14.out
