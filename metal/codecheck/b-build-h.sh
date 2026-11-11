#!/bin/bash
# Build the default image at H (7d00a1f6c) in wt-readdir to get H's fileserver, then return to the branch.
S=<path> W=$S/wt-readdir; C=$S/metal/codecheck
cd $W || exit 9
[ -z "$(git status --porcelain)" ] || { echo "worktree not clean"; exit 9; }
git checkout -q --detach 7d00a1f6c73e4c562eeb496c20f2cfd4138f4cb6 || exit 9
cargo run -- --build-only > $C/build-H.log 2>&1; echo "build exit $?"
cp target/x86_64-unknown-toyos/toyos/fileserver $C/fileserver-H
git checkout -q data-listing-inodes-one-pass
git status --porcelain --ignore-submodules=none
