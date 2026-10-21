#!/bin/zsh
cd ~/Dev/<user>/toyos-handle-wake
S=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/pkg
echo "rev $(git rev-parse HEAD) status '$(git status --porcelain --ignore-submodules=none)'"
cargo run -- --ci host > $S/r3-ci-host.log 2>&1; echo "ci host exit $?"
cargo run -- --build-only > $S/r3-build-x86.log 2>&1; echo "x86 build exit $?"
cargo run -- --build-only --arch aarch64 > $S/r3-build-aarch64.log 2>&1; echo "aarch64 build exit $?"
cargo test --test toyos-build -- console_image_boots > $S/r3-guest.log 2>&1; echo "guest exit $?"
echo "final status '$(git status --porcelain --ignore-submodules=none)'"
