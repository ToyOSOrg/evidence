#!/bin/zsh
cd ~/Dev/<user>/toyos-fd-served
S=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/pkg/fd9
echo "head $(git rev-parse HEAD) on $(git merge-base HEAD origin/main) rust $(git -C rust rev-parse HEAD) status '$(git status --porcelain --ignore-submodules=none)'"
cargo run -- --ci host > $S/ci-host.log 2>&1; echo "ci host exit $?"
cargo run -- --build-only > $S/build-x86.log 2>&1; echo "x86 build exit $?"
cargo run -- --build-only --arch aarch64 > $S/build-aarch64.log 2>&1; echo "aarch64 build exit $?"
cargo test --test toyos-build -- libc_children console_image_boots nvme_disk_boots > $S/guest.log 2>&1; echo "guest exit $?"
echo "final status '$(git status --porcelain --ignore-submodules=none)'"
