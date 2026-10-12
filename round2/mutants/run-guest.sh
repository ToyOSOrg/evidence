#!/bin/bash
# The guest mutant: the order 2defdef6a set undone, applied as a checked
# patch, the guest test run, its exit recorded, and the patch reversed.
T=<worktree>
M=<scratch>/mutants
cd "$T" || exit 1
echo "ToyOS head $(git rev-parse HEAD)"
name=${1:-s5-initialised-before-the-press}
echo "=== $name: cargo test acpi_press_across_a_lock_wait"
git apply --check "$M/$name.patch" || { echo "PATCH DOES NOT APPLY"; exit 1; }
git apply "$M/$name.patch"
cargo test acpi_press_across_a_lock_wait > "$M/$name.log" 2>&1
code=$?
git apply -R "$M/$name.patch"
grep -E "PASS|FAIL|panicked|test result: (ok|FAILED)\. [0-9]+ passed, " "$M/$name.log"
echo "EXIT=$code"
echo "tree clean: $(git status --porcelain | wc -l | tr -d ' ') changed"
