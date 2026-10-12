#!/bin/sh
# Measurement only: PR #863's amendment D model, each case with its own exit code.
# The model's directory is masked as <dir> and the home directory as ~.
S=$1
cd "$S" || exit 1
echo "toyos-transport from ToyOSOrg/ToyOS e7e11797a (lib/blockring/transport as on main 36aff86fc), loom 0.7.2, $(rustc --version), no preemption bound"
mask() { sed -e "s|$S|<dir>|g" -e "s|$HOME|~|g" "$1"; }
for rule in as_written armed no_arm no_ring; do
  for what in bytes end room; do
    for when in before racing; do
      t="${rule}_${what}_$when"
      echo "=== $t"
      CARGO_TARGET_DIR="$S/target" cargo test --offline --release --test registered_ready -- --exact "$t" > "$S/case.out" 2>&1
      e=$?
      mask "$S/case.out"
      echo "=== $t EXIT=$e"
    done
  done
done
for what in bytes end room; do
  for when in before racing; do
    t="armed_${what}_$when"
    echo "=== want-relaxed $t"
    CARGO_TARGET_DIR="$S/target-relaxed" cargo test --offline --release --features want-relaxed --test registered_ready -- --exact "$t" > "$S/case.out" 2>&1
    e=$?
    mask "$S/case.out"
    echo "=== want-relaxed $t EXIT=$e"
  done
done
rm -f "$S/case.out"
