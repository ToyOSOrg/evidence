#!/bin/bash
# Negative control: apply the mutation, build and run the claim's test, record its exit, restore.
S=<path>
P=$S/mutation-spawn-path.patch
cd <path> || exit 2
echo "rev=$(git rev-parse HEAD)"
git apply --check "$P" && git apply "$P" || { echo "patch does not apply"; exit 2; }
git diff --stat
cargo build -p toyos-abi --tests; echo "mutated build exit=$?"
cargo test -p toyos-abi --lib a_spawn_path_is_one_bounded_line; echo "mutated test exit=$?"
git apply -R "$P"; echo "restore exit=$?"
echo "status after restore: $(git status --porcelain --ignore-submodules=none | wc -l) changed"
cargo test -p toyos-abi --lib a_spawn_path_is_one_bounded_line; echo "restored test exit=$?"
