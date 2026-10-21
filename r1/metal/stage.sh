#!/bin/zsh
cd ~/Dev/<user>/toyos-handle-wake
M=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/pkg/s1-mutations
echo "rev $(git rev-parse HEAD)"
p=$M/release-closes-nothing.patch
git apply --check $p && git apply $p || { echo "does not apply"; exit 1; }
rm -rf $M/release-closes-nothing-readback; mkdir -p $M/release-closes-nothing-readback
cargo test --test toyos-build -- --metal --metal-readback $M/release-closes-nothing-readback message_carries_its_handles ends_sent_over_each_other_both_end > $M/release-closes-nothing.log 2>&1; echo "stage exit $?"
git apply -R $p; echo "restored exit $?"
git status --porcelain --ignore-submodules=none
