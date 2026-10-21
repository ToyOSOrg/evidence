#!/bin/sh
# Mutation: a clippy finding (clone_on_copy, outside a macro) in transport's unit tests; `cargo run -- --clippy` must red at the toyos shape; restore.
set -u
cd $DEV/toyos-transport-merge
F=sdk/toyos/src/transport/inflight.rs; S=$SCRATCH
cp $F $S/inflight.rs.orig
python3 - <<'PY'
import pathlib
p=pathlib.Path('sdk/toyos/src/transport/inflight.rs'); s=p.read_text()
i=s.index('mod tests {')
j=s.index('\n', i)
s=s[:j+1]+'    #[test]\n    fn mutant() {\n        let x = 1u32;\n        let y = x.clone();\n        assert_eq!(y, 1);\n    }\n'+s[j+1:]
p.write_text(s)
PY
grep -n 'fn mutant' $F
cargo run -- --clippy 2>&1 | grep -E '=== clippy: cargo clippy -p toyos --all-targets|clone_on_copy|inflight.rs|clippy: .*(clean|red|failed)|^error' 
echo "MUTANT_EXIT=$?"
cargo run -- --clippy >/dev/null 2>&1; echo "MUTANT_CLIPPY_EXIT=$?"
cp $S/inflight.rs.orig $F; touch $F
cmp $F $S/inflight.rs.orig && echo restored
