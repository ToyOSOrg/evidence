#!/bin/sh
# Each mutation: applied as a checked patch, built, its tests run, reverted.
W=<worktree>
M=<scratch>/mutations
cd $W
echo "tree: HEAD $(git rev-parse HEAD) plus the working tree, lib.rs sha256 $(shasum -a 256 system/compositor/virtio-gpu/src/lib.rs | cut -c1-16)"
for p in $M/m*.patch; do
  n=$(basename $p .patch)
  echo "=== $n"
  git apply --check $p || { echo "does not apply"; exit 3; }
  git apply $p
  cargo build -p toyos-virtio-gpu --tests > $M/$n.build.log 2>&1
  echo "build exit $?"
  cargo test -p toyos-virtio-gpu > $M/$n.test.log 2>&1
  echo "test exit $?"
  grep -E "^test .* FAILED|test result" $M/$n.test.log
  git apply -R $p
done
echo "=== restored, lib.rs sha256 $(shasum -a 256 system/compositor/virtio-gpu/src/lib.rs | cut -c1-16)"
cargo test -p toyos-virtio-gpu > $M/restored.test.log 2>&1
echo "test exit $?"
grep "test result" $M/restored.test.log
