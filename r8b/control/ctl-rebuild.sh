#!/bin/bash
# The control branch remade on fileops-step1's head with plumbing: the head's tree with one change to
# kernel/src/object/paged.rs (every holder write refused WouldBlock), committed on the head. Touches no worktree.
D=<scratch>; cd $D/wt-step1 || exit 2
S=$D/r8b; F=kernel/src/object/paged.rs; H=$(git rev-parse fileops-step1)
git show $H:$F > $S/paged.rs.head
python3 - $S/paged.rs.head $S/paged-refuse.rs <<'PY'
import sys
s=open(sys.argv[1]).read()
a='''    fn holder_write(&self, slot: u32, src: &UserBytes, at: Option<u64>) -> u64 {
        let len = src.len();
'''
assert s.count(a)==1
open(sys.argv[2],'w').write(s.replace(a, a+'''        if len < usize::MAX {
            return SyscallError::WouldBlock.to_u64();
        }
'''))
PY
diff -u $S/paged.rs.head $S/paged-refuse.rs > $S/refuse-holder-writes.patch
B=$(git hash-object -w $S/paged-refuse.rs)
export GIT_INDEX_FILE=$S/ctl.index; rm -f $GIT_INDEX_FILE
git read-tree $H && git update-index --cacheinfo 100644,$B,$F && T=$(git write-tree) || exit 3
C=$(git commit-tree $T -p $H -F $S/ctl-commit.txt) || exit 4
unset GIT_INDEX_FILE; rm -f $S/ctl.index
git update-ref refs/heads/fileops-step1-ctl-refuse $C
git diff --stat $H $C; echo "control $C on $H"
