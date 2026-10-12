# Applies each checked patch, shows the tree builds, runs the tests it must turn
# red, reports each exit code, and restores the tree before the next.
import subprocess, json, os, sys
WT='<home>/Dev/jan/toyos-dnscache'
OUT=os.path.dirname(os.path.abspath(__file__))
plan=json.load(open(os.path.join(OUT,'plan.json')))
def sh(cmd, log):
    with open(log,'a') as f:
        f.write(f'$ {cmd}\n'); f.flush()
        r=subprocess.run(cmd, shell=True, cwd=WT, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
        f.write(r.stdout)
        f.write(f'EXIT={r.returncode}\n')
    sh.last=r.stdout
    return r.returncode
def clean():
    return subprocess.run(['git','-C',WT,'status','--porcelain','--ignore-submodules=none'],capture_output=True,text=True).stdout==''
head=subprocess.run(['git','-C',WT,'rev-parse','HEAD'],capture_output=True,text=True).stdout.strip()
rows=[]
log=os.path.join(OUT,'mutations.log')
open(log,'w').write(f'mutations at {head}\n')
for m in plan:
    assert clean(), 'tree not clean before '+m['id']
    patch=os.path.join(OUT,m['id']+'.patch')
    with open(log,'a') as f: f.write(f"\n=== {m['id']}: {m['what']}\n")
    assert sh(f'git apply --check {patch}', log)==0
    assert sh(f'git apply {patch}', log)==0
    try:
        crates=sorted({t[1] for t in m['tests']})
        built=all(sh(f'cargo test {"-p "+c} --no-run', log)==0 for c in crates)
        results=[]
        for _, crate, test in m['tests']:
            code=sh(f'cargo test -p {crate} -- --exact {test}', log) if built else None
            # The test ran: its own line is in the output, and it was the only one.
            ran = built and f'test {test} ... ' in sh.last and 'running 1 test' in sh.last
            results.append((test, code if ran else 'DID NOT RUN'))
    finally:
        assert sh(f'git apply -R {patch}', log)==0
    assert clean(), 'tree not clean after '+m['id']
    rows.append((m['id'], m['what'], built, results))
with open(log,'a') as f:
    f.write('\n=== summary\n')
    for mid, what, built, results in rows:
        for test, code in results:
            verdict = {0: 'GREEN', None: 'NOT BUILT', 'DID NOT RUN': 'DID NOT RUN'}.get(code, 'RED')
            f.write(f'{mid} | {what} | built={built} | {test} | EXIT={code} | {verdict}\n')
print(open(log).read().split('=== summary\n')[1])
