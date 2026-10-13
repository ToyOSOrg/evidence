#!/bin/sh
# Each mutation: applied as a checked patch, its test run, the exit kept, restored.
W=<path>
M=<path>
cd $W || exit 1
for p in "$@"; do
  name=$(basename $p .patch)
  case $name in
    m18*) cmd="cargo test --manifest-path kernel/Cargo.toml --lib pointers" ;;
    m19*) cmd="cargo test --manifest-path kernel/usbhid/Cargo.toml" ;;
    *) cmd="cargo test --manifest-path system/ps2server/Cargo.toml" ;;
  esac
  git apply --check $p || { echo "$name: does not apply"; exit 1; }
  git apply $p
  echo "== $name at $(git rev-parse HEAD): $cmd" > $M/$name.log
  git diff >> $M/$name.log
  $cmd >> $M/$name.log 2>&1
  echo "EXIT=$?" >> $M/$name.log
  git apply -R $p
  [ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "$name: tree not clean"; exit 1; }
  echo "$name $(tail -1 $M/$name.log)"
done
