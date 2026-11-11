#!/bin/bash
# Negative control: a restarted read that does not ask anew (the model's Look step).
D=<scratch>; cd $D/wt-step1 || exit 2
L=$D/logs/step1-merge-controls; mkdir -p $L
cp kernel/pure/paged.rs $L/paged.rs.orig
python3 - <<'PY'
p='kernel/pure/paged.rs'; s=open(p).read()
a='''                            self.since = self.o.read_begin().unwrap();
                            self.want.anew();
'''
assert s.count(a)==1; open(p,'w').write(s.replace(a,'''                            self.since = self.o.read_begin().unwrap();
'''))
PY
diff -u $L/paged.rs.orig kernel/pure/paged.rs > $L/anew.patch
cargo test -p kernel --lib paged::tests::no_interleaving > $L/anew.log 2>&1; echo "rc=$?" >> $L/anew.log
cp $L/paged.rs.orig kernel/pure/paged.rs && cmp -s $L/paged.rs.orig kernel/pure/paged.rs && echo restored >> $L/anew.log
