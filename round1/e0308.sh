#!/bin/sh
# Mutation: every transport compile_fail block names E0308 instead of E0080; doc-tests run; restore.
set -u
cd $DEV/toyos-transport-merge
F=sdk/toyos/src/transport/queue.rs
cp $F $F.orig
sed -i '' 's/compile_fail,E0080/compile_fail,E0308/g' $F
grep -c 'compile_fail,E0308' $F
cargo test -p toyos --doc 2>&1
echo "EXIT=$?"
mv $F.orig $F; touch $F
git diff --exit-code -- $F && echo restored
