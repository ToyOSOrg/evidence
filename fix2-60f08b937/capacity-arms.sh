#!/bin/sh
cd <path> || exit 2
D=<path>
echo "== green arm: the fix"
cargo test -p toyos-vdagent --lib -- stream::tests::a_kept_message_buffers_no_more_than_it_declares
echo "GREEN_EXIT=$?"
echo "== red arm: m24, the fix reverted to 3a60123b6's line"
git apply --check $D/m24.patch || exit 3
git apply $D/m24.patch
cargo test -p toyos-vdagent --lib -- stream::tests::a_kept_message_buffers_no_more_than_it_declares
echo "M24_EXIT=$?"
git apply -R $D/m24.patch
git diff --quiet -- lib/vdagent/src/stream.rs && echo DIRTY_CHECK=unexpected-clean || echo "RESTORED: fix in place"
git diff -U0 lib/vdagent/src/stream.rs | grep -c 'max(data.len() + take)'
