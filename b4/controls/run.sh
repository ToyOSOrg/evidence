#!/bin/sh
# Applies each mutation, builds, runs the tests it should turn red, records
# their exit status, and restores the tree; then the same tests unmutated.
set -u
W=<dev>/toyos-storage-b4; C=$(dirname "$0")
cd "$W"
repro="image::tests::one_set_built_twice_is_one_image image::tests::one_ordering_of_one_set_is_one_image"
for m in clock-seed clock-time; do
  git apply "$C/$m.patch" || exit 2
  cargo build -p toyos-build --lib > "$C/$m.build.log" 2>&1; echo "build exit $?" >> "$C/$m.build.log"
  cargo test -p toyos-build --lib -- $repro > "$C/$m.log" 2>&1; echo "exit $?" >> "$C/$m.log"
  git apply -R "$C/$m.patch" || exit 3
done
git apply "$C/greedy-shape.patch" || exit 2
(cd lib/bcachefs && cargo build --lib > "$C/greedy-shape.build.log" 2>&1; echo "build exit $?" >> "$C/greedy-shape.build.log"
 cargo test --lib engine::mkfs > "$C/greedy-shape.log" 2>&1; echo "exit $?" >> "$C/greedy-shape.log")
git apply -R "$C/greedy-shape.patch" || exit 3
cargo test -p toyos-build --lib -- $repro > "$C/unmutated.log" 2>&1; echo "exit $?" >> "$C/unmutated.log"
(cd lib/bcachefs && cargo test --lib engine::mkfs >> "$C/unmutated.log" 2>&1; echo "exit $?" >> "$C/unmutated.log")
git status --porcelain | wc -l
