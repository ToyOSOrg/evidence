#!/bin/sh
# Evidence only: the scratch netstack_streams QEMU job (netcheck.patch over the head), green and
# then under the server-watch control, the control applied (checked) and restored.
S=$1; cd "$S/netcheck" || exit 1
echo "head $(git rev-parse HEAD)"; date -u
echo "=== scratch diff over the head"; git diff
cargo test --test toyos-build -- netstack_streams; echo "=== green EXIT=$?"
git apply --check "$S/controls/server-watch-other-end-gone.patch" || exit 2
git apply "$S/controls/server-watch-other-end-gone.patch"; git diff -- sdk/toyos/src/net/stream.rs
cargo test --test toyos-build -- netstack_streams; echo "=== control EXIT=$?"
git apply -R "$S/controls/server-watch-other-end-gone.patch"; git diff --stat; echo "=== restored"
