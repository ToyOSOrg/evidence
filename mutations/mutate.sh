#!/bin/sh
# Each arm: apply checked patches, build the loom target, run it, restore, show the tree clean.
# Usage: mutate.sh <worktree> <patch dir> <log dir>
W=$1; P=$2; L=$3
cd "$W" || exit 2
echo "head $(git rev-parse HEAD)"
echo "stream.rs blob $(git rev-parse HEAD:lib/blockring/transport/src/stream.rs)"
run() { # name, features, patches...
  name=$1; feat=$2; shift 2
  for p in "$@"; do git apply --check "$P/$p" || { echo "$name: $p does not apply"; exit 3; }; done
  for p in "$@"; do git apply "$P/$p"; done
  if [ -n "$feat" ]; then F="--features $feat"; else F=""; fi
  cargo test -p toyos-transport $F --test loom --no-run > "$L/$name.build.log" 2>&1; b=$?
  cargo test -p toyos-transport $F --test loom > "$L/$name.test.log" 2>&1; t=$?
  for p in "$@"; do git apply -R "$P/$p"; done
  dirty=$(git status --porcelain --ignore-submodules=none)
  echo "$name: patches [$*] features [$feat] build=$b test=$t tree-clean=$([ -z "$dirty" ] && echo yes || echo NO)"
  [ -z "$dirty" ] || exit 4
}
# The model as it stands: bytes in loom cells.
run cells-baseline ""
run cells-head-store-relaxed "" head-store-relaxed.patch
run cells-head-load-relaxed "" head-load-relaxed.patch
run cells-publish-relaxed "publish-relaxed"
# The cell change reverted: bytes in Relaxed loom atomics, as at 6c89bda59.
run atomics-head-store-relaxed "" cells.patch.rev head-store-relaxed.patch
run atomics-head-load-relaxed "" cells.patch.rev head-load-relaxed.patch
run atomics-publish-relaxed "publish-relaxed" cells.patch.rev
