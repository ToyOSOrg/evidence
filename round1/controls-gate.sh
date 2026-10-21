#!/bin/sh
# Mutation: drop transport-head-only's CONTROLS row; every_model_control_is_run must red; restore.
set -u
cd $DEV/toyos-transport-merge
F=build/ci.rs; S=$SCRATCH
cp $F $S/ci.rs.orig
python3 - <<'PY'
import pathlib,re
p=pathlib.Path('build/ci.rs'); s=p.read_text()
n=re.subn(r'    red\(SDK, "transport-head-only".*?\]\),\n', '', s, flags=re.S)
assert n[1]==1; p.write_text(n[0])
PY
grep -c 'transport-head-only' $F
cargo test --lib -- --exact build::tests::every_model_control_is_run 2>&1
echo "MUTANT_EXIT=$?"
cp $S/ci.rs.orig $F; touch $F
cmp $F $S/ci.rs.orig && echo restored
