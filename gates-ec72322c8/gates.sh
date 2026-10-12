#!/bin/zsh
S=<home>/.claude/jobs/2280e09e<tmp>
cd <worktree> || exit 9
echo "head $(git rev-parse HEAD)" > $S/gates.status
cargo run -- --build-only > $S/build-only.log 2>&1; echo "build-only EXIT=$?" >> $S/gates.status
cargo test -- netstack libc_sockets https_fetch > $S/net-filter.log 2>&1; echo "net-filter EXIT=$?" >> $S/gates.status
cargo run -- --ci host > $S/ci-host.log 2>&1; echo "ci-host EXIT=$?" >> $S/gates.status
echo DONE >> $S/gates.status
