#!/bin/sh
# The lent-ring window test green, then under consume-grows-nothing.patch (checked), restored.
T=$1; P=$2; cd "$T" || exit 1
echo "revision $(git rev-parse HEAD)"; git status --porcelain
cargo test -p toyos-net-tcp --test net a_lent_receive_ring; echo "GREEN_EXIT=$?"
git apply --check "$P" || { echo "the control does not apply"; exit 2; }
git apply "$P"; git diff -- system/netstack/shard/tcp/src/conn.rs
cargo test -p toyos-net-tcp --test net a_lent_receive_ring; echo "CONTROL_EXIT=$?"
git apply -R "$P"; git status --porcelain; echo RESTORED
