#!/bin/sh
# The `head-relaxed` control: build the loom target, run the byte model, show the tree clean.
# Usage: control.sh <worktree> <patch dir> <log dir>
W=$1; P=$2; L=$3
cd "$W" || exit 2
echo "head $(git rev-parse HEAD)"
echo "stream.rs blob $(git rev-parse HEAD:lib/blockring/transport/src/stream.rs)"
T=a_published_byte_is_read_as_written
run() { # name, features, patches...
  name=$1; feat=$2; shift 2
  for p in "$@"; do git apply --check "$P/$p" || { echo "$name: $p does not apply"; exit 3; }; done
  for p in "$@"; do git apply "$P/$p"; done
  if [ -n "$feat" ]; then F="--features $feat"; else F=""; fi
  cargo test -p toyos-transport $F --test loom --no-run > "$L/$name.build.log" 2>&1; b=$?
  cargo test -p toyos-transport $F --test loom -- --exact $T > "$L/$name.test.log" 2>&1; t=$?
  for p in "$@"; do git apply -R "$P/$p"; done
  dirty=$(git status --porcelain --ignore-submodules=none)
  failed=$(grep -c "^test $T \.\.\. FAILED$" "$L/$name.test.log")
  echo "$name: patches [$*] features [$feat] build=$b test=$t FAILED-lines=$failed tree-clean=$([ -z "$dirty" ] && echo yes || echo NO)"
  [ -z "$dirty" ] || exit 4
}
# Without the feature, the model holds.
run without ""
# With it, the byte model reds by name.
run head-relaxed "head-relaxed"
# The cells reverted (bytes in Relaxed loom atomics, as at 6c89bda59): the feature
# passes, so the control's own judge reds on a model that lost its cells.
run atomics-head-relaxed "head-relaxed" cells.patch.rev
