#!/bin/sh
W=<worktree>; M=<scratch>/mutations
cd $W; echo "HEAD $(git rev-parse HEAD)"
for p in $M/g*.patch; do n=$(basename $p .patch); echo "=== $n"
  git apply --check $p || exit 3; git apply $p
  cargo test --test toyos-build -- the_compositor_drives_the_virtio_gpu > $M/$n.log 2>&1; echo "test exit $?"
  grep -E "PASS|FAIL|BUILT|error\[" $M/$n.log | head -5; grep -E "^.*(scanout is|never|wedged|budget)" $M/$n.log | head -3
  git apply -R $p; done
echo "=== restored: $(git status --porcelain | wc -l) changed file(s)"
