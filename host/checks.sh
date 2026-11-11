#!/bin/bash
# The targeted host checks of the guest-timing code branches, run at the worktree root.
set -u
echo "rev $(git rev-parse HEAD) tree $(git rev-parse HEAD^{tree}) $(date -u)"
echo "== cargo test --test toyos-checks"
cargo test --test toyos-checks
echo "exit toyos-checks $?"
echo "== cargo clippy -p toyos-build --all-targets (ADOPTED lints, -D warnings)"
cargo clippy -p toyos-build --all-targets -- -W clippy::checked_conversions -W clippy::default_trait_access -W clippy::manual_midpoint -W clippy::redundant_clone -W clippy::unchecked_time_subtraction -W clippy::unnecessary_semicolon -D warnings
echo "exit clippy $?"
