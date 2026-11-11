#!/bin/bash
# Negative control: a holder's span checked against the last page, not a holder's reach (B1's remainder).
D=<scratch>; cd $D/wt-step1 || exit 2
L=$D/logs/step1-reach-controls; mkdir -p $L
cp kernel/pure/paged.rs $L/paged.rs.orig
python3 - <<'PY'
p='kernel/pure/paged.rs'; s=open(p).read()
a='''    if !offset.checked_add(len).is_some_and(|end| end <= HOLDER_END) {
        return Err(Refused::OutOfReach);'''
assert s.count(a)==1; open(p,'w').write(s.replace(a,'''    if !within_reach(offset, len) {
        return Err(Refused::OutOfReach);'''))
PY
diff -u $L/paged.rs.orig kernel/pure/paged.rs > $L/reach.patch
cargo test -p kernel --lib paged::tests::a_holders_span > $L/reach.log 2>&1; echo "rc=$?" >> $L/reach.log
cp $L/paged.rs.orig kernel/pure/paged.rs && cmp -s $L/paged.rs.orig kernel/pure/paged.rs && echo restored >> $L/reach.log
