# The negative control: the whole change's code reverted onto its base
# (origin/main), the node's tests kept at HEAD and adapted to the base's API
# alone, run, and the tree restored to HEAD.
import subprocess, os, re
WT='<home>/Dev/jan/toyos-dnscache'
OUT=os.path.dirname(os.path.abspath(__file__))
LOG=os.path.join(OUT,'negative.log')
TESTS='system/netstack/node/tests/resolve.rs'
def git(*a):
    return subprocess.run(['git','-C',WT,*a],check=True,capture_output=True,text=True).stdout
def log(text):
    open(LOG,'a').write(text)
assert git('status','--porcelain','--ignore-submodules=none')==''
head=git('rev-parse','HEAD').strip(); base=git('merge-base','HEAD','origin/main').strip()
open(LOG,'w').write(f'negative control: HEAD {head}, base {base}\n')
changed=[f for f in git('diff','--name-only',base,head,'--','system').split() if f!=TESTS]
log('reverted to the base: '+' '.join(changed)+'\n')
try:
    git('checkout',base,'--',*changed)
    p=os.path.join(WT,TESTS); s=open(p).read()
    reps=[
     ('use toyos_net_node::{Counter, Ended, LookupId, NotStarted, Refused, Resolved, Resolving};',
      'use toyos_net_node::{Counter, Ended, LookupId, NotStarted, Refused, Resolved};\n\n'
      '/// The negative control\'s adapter: the base names no view and keeps nothing.\n'
      '#[derive(Clone, Debug, PartialEq, Eq)]\n'
      'enum Resolving {\n    Kept(Result<Vec<[u8; 4]>, Ended>),\n    Asking(LookupId),\n}\n\n'
      'impl From<LookupId> for Resolving {\n    fn from(id: LookupId) -> Self {\n        Self::Asking(id)\n    }\n}'),
     ('fn asking(resolving: Resolving) -> LookupId {\n    match resolving {',
      'fn asking(resolving: impl Into<Resolving>) -> LookupId {\n    match resolving.into() {'),
     ('        self.lan.node.resolve(self.lan.now, view, name(text), counter(&mut self.draws))',
      '        let _ = view;\n        self.lan.node.resolve(self.lan.now, name(text), counter(&mut self.draws)).map(Resolving::Asking)'),
    ]
    for a,b in reps:
        assert s.count(a)==1, a
        s=s.replace(a,b)
    s,n=re.subn(r'node\.resolve\(((?:net\.)?lan\.now), ONE, name\(', r'node.resolve(\1, name(', s)
    log(f'adapter: {n} direct calls lose their view\n')
    open(p,'w').write(s)
    log(git('diff','--stat'))
    log(git('diff',TESTS))
    r=subprocess.run('cargo test -p toyos-net-node --test resolve',shell=True,cwd=WT,capture_output=True,text=True)
    log(r.stdout+r.stderr+f'EXIT={r.returncode}\n')
finally:
    git('checkout','HEAD','--','.')
assert git('status','--porcelain','--ignore-submodules=none')==''
log('restored to HEAD, tree clean\n')
