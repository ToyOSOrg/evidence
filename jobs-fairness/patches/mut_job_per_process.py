# Negative control: every spawn makes a fresh job, as PID shares did.
import sys
p='<worktree>/kernel/src/loader/start.rs'
s=open(p).read()
a="        let job = endowed_job.unwrap_or_else(|| data.job.clone());"
b="        let _ = endowed_job; let job = crate::object::job::new_job();"
if sys.argv[1]=="apply":
    assert s.count(a)==1; s=s.replace(a,b)
else:
    assert s.count(b)==1; s=s.replace(b,a)
open(p,'w').write(s)
