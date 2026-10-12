#!/bin/sh
# Measurement only: PR #863's amendment D model, each case with its own exit code, now with a fatal
# `end` in the send direction. The model's directory is masked as <dir> and the home directory as ~.
S=$1
cd "$S" || exit 1
echo "toyos-transport from ToyOSOrg/ToyOS $2 (lib/blockring/transport, unchanged since 7ea0ff9d6), loom 0.7.2, $(rustc --version), no preemption bound"
mask() { sed -e "s|$S|<dir>|g" -e "s|$HOME|~|g" "$1"; }
one() {
  echo "=== $1 $2"
  CARGO_TARGET_DIR="$S/target-$1" cargo test --offline --release $3 --test registered_ready -- --exact "$2" > "$S/case.out" 2>&1
  e=$?
  mask "$S/case.out"
  echo "=== $1 $2 EXIT=$e"
}
for rule in as_written armed no_arm no_ring; do
  for what in bytes end room reset; do
    for when in before racing; do
      one default "${rule}_${what}_$when" ""
    done
  done
done
for what in bytes end room reset; do
  for when in before racing; do
    one want-relaxed "armed_${what}_$when" "--features want-relaxed"
  done
done
for what in bytes end room reset; do
  for when in before racing; do
    one head-only "armed_${what}_$when" "--features head-only"
  done
done
rm -f "$S/case.out"
