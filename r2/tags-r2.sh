#!/bin/bash
# Round 2 of #1272: the starvation model run against round 1's flight.rs (a turn per Dir), which must deadlock, then
# the head's file restored; then every model and each missing-wake control at the head.
D=<scratch>; cd $D/wt-tags || exit 2
L=$D/logs/tags-11; mkdir -p $L
F=sdk/toyos/src/fs/flight.rs
cp $F $L/flight.rs.head
git show HEAD:$F > $F
diff -u $L/flight.rs.head $F > $L/turn-per-dir.patch
cargo test -q --manifest-path kernel/loom/Cargo.toml --test fs_flight -- --exact each_connection_receives_for_itself > $L/turn-per-dir.log 2>&1; echo "rc=$?" >> $L/turn-per-dir.log
cp $L/flight.rs.head $F && cmp -s $L/flight.rs.head $F && echo restored >> $L/turn-per-dir.log
