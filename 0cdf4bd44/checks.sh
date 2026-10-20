#!/bin/zsh
cd /Users/jan/Dev/jan/toyos-ci-schedule
echo "rev $(git rev-parse HEAD)" > /Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/agents/ci-schedule/checks.status
GITHUB_EVENT_NAME=merge_group GITHUB_EVENT_PATH=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/agents/ci-schedule/event-docs.json cargo run -- --ci host > /Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/agents/ci-schedule/host-docs.log 2>&1; echo "host-docs exit=$?" >> /Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/agents/ci-schedule/checks.status
NOQ="/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/agents/ci-schedule/noqemu-bin:/opt/homebrew/opt/binutils/bin:/Users/jan/.cargo/bin:/opt/homebrew/opt/rustup/bin:/usr/bin:/bin:/usr/sbin:/sbin"
for q in qemu-system-x86_64 qemu-system-aarch64; do PATH=$NOQ command -v $q && echo "LEAK $q" >> /Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/agents/ci-schedule/checks.status; done
PATH=$NOQ cargo run -- --ci image > /Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/agents/ci-schedule/image.log 2>&1; echo "image exit=$?" >> /Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/agents/ci-schedule/checks.status
cargo run -- --ci host > /Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/agents/ci-schedule/host-full.log 2>&1; echo "host-full exit=$?" >> /Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/agents/ci-schedule/checks.status
