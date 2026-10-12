#!/bin/bash
# The whole round's production change reverted onto the base it was built
# on (c4ee12920: the last round's head with main merged), under this
# round's tests: each crate whose tests live apart from its sources.
T=<worktree>
BASE=c4ee12920
cd "$T" || exit 1
echo "ToyOS head $(git rev-parse HEAD), base $(git rev-parse $BASE)"
PROD="sdk/abi/src/acpi.rs lib/userbound/src/firmware.rs system/acpiserver/aml/src/exec.rs system/acpiserver/aml/src/lib.rs"
git checkout $BASE -- $PROD
git diff --stat HEAD -- $PROD
echo "=== cargo test -p toyos-userbound --test firmware"
cargo test -p toyos-userbound --test firmware 2>&1 | grep -E "^error(\[|:)|cannot find|no variant|test result|FAILED"
echo "EXIT=${PIPESTATUS[0]}"
echo "=== cargo test -p toyos-aml --test heap a_method_refused"
cargo test -p toyos-aml --test heap a_method_refused 2>&1 | grep -E "^error(\[|:)|test result|FAILED"
echo "EXIT=${PIPESTATUS[0]}"
git checkout HEAD -- $PROD
echo "tree clean: $(git status --porcelain | wc -l | tr -d ' ') changed"
