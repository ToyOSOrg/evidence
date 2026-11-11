#!/bin/bash
# Negative control for pagerprobe's holder writes: the kernel refuses every holder's write, as if it sent each to
# its pager. Built into the testcases image to show it compiles; restored after.
D=<scratch>; cd $D/wt-step1 || exit 2
L=$D/logs/step1-r3-control; mkdir -p $L
F=kernel/src/object/paged.rs
cp $F $L/paged.rs.orig
python3 - <<'PY'
p='kernel/src/object/paged.rs'; s=open(p).read()
a='''    fn holder_write(&self, slot: u32, src: &UserBytes, at: Option<u64>) -> u64 {
        let len = src.len();
'''
assert s.count(a)==1
open(p,'w').write(s.replace(a, a+'''        if len < usize::MAX {
            return SyscallError::WouldBlock.to_u64();
        }
'''))
PY
diff -u $L/paged.rs.orig $F > $L/refuse-holder-writes.patch
cargo run -- --build-only --boot-config tests/images/testcases.toml > $L/build.log 2>&1; echo "rc=$?" >> $L/build.log
cp $L/paged.rs.orig $F && cmp -s $L/paged.rs.orig $F && echo restored >> $L/build.log
