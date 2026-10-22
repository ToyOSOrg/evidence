#!/bin/zsh
cd ~/Dev/<user>/toyos-libc-honest
S=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/pkg/lh1
echo "head $(git rev-parse HEAD) on $(git merge-base HEAD origin/main) status '$(git status --porcelain --ignore-submodules=none)'"
cargo test -p toyos-libc-copies > $S/libc-copies.log 2>&1; echo "libc copies exit $?"
cargo run -- --ci host > $S/ci-host.log 2>&1; echo "ci host exit $?"
cargo run -- --build-only > $S/build-x86.log 2>&1; echo "x86 build exit $?"
cargo run -- --build-only --arch aarch64 > $S/build-aarch64.log 2>&1; echo "aarch64 build exit $?"
cargo test --test toyos-build -- libc_children console_image_boots nvme_disk_boots > $S/guest.log 2>&1; echo "guest exit $?"
rm -rf $S/readback; mkdir -p $S/readback
cargo test --test toyos-build -- --metal --metal-readback $S/readback std_fs $(cat $S/corpus.txt | tr '\n' ' ') > $S/stage.log 2>&1; echo "stage exit $?"
echo "final status '$(git status --porcelain --ignore-submodules=none)'"
