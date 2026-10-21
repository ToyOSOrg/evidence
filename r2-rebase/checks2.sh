#!/bin/zsh
cd ~/Dev/<user>/toyos-fd
S=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/pkg/fd5
echo "head $(git rev-parse HEAD) on $(git rev-parse HEAD~2) status '$(git status --porcelain --ignore-submodules=none)'"
cargo run -- --ci host > $S/ci-host2.log 2>&1; echo "ci host exit $?"
cargo run -- --build-only > $S/build-x86-2.log 2>&1; echo "x86 build exit $?"
cargo run -- --build-only --arch aarch64 > $S/build-aarch64-2.log 2>&1; echo "aarch64 build exit $?"
cargo test --test toyos-build -- console_image_boots libc_children desktop_without_x2apic > $S/guest2.log 2>&1; echo "guest exit $?"
echo "final status '$(git status --porcelain --ignore-submodules=none)'"
