import re,sys,statistics as st
S=sys.argv[1]
def rows(path):
    out={}
    for line in open(path,errors='replace'):
        m=re.search(r'os=toyos bench=(\S+) unit=(\S+) n=\d+ min=(\d+) p50=(\d+).*? max=(\d+)',line)
        if m: out[m.group(1)]=(m.group(2),int(m.group(4)),int(m.group(5)),int(m.group(3)))
    return out
for b in ['t14','amd']:
    A=[rows(f'{S}/{b}-A-{k}/diskbenchcase/kernel.log') for k in (1,2)]
    B=[rows(f'{S}/{b}-B-{k}/diskbenchcase/kernel.log') for k in (1,2)]
    print(f'## {b}')
    print('| row | unit | A p50s | B p50s | B vs A (median) | resolved | regression |')
    print('|---|---|---|---|---|---|---|')
    for name in sorted(A[0]):
        if not re.match(r'(fs\.disk\.|nvme\.|persist\.)',name): continue
        if not all(name in r for r in A+B): print(f'| {name} | missing in a boot |'); continue
        unit=A[0][name][0]
        a=[r[name][1] for r in A]; bb=[r[name][1] for r in B]
        ma,mb=st.median(a),st.median(bb)
        worse_higher = unit!='MB/s'
        d=(mb-ma)/ma*100
        worse = d if worse_higher else -d
        if worse_higher: res_worse=min(bb)>max(a); res_better=max(bb)<min(a)
        else: res_worse=max(bb)<min(a); res_better=min(bb)>max(a)
        res='B worse' if res_worse else ('B better' if res_better else '-')
        reg='**YES**' if (res_worse and worse>5) else ''
        print(f'| {name} | {unit} | {a} | {bb} | {d:+.1f}% | {res} | {reg} |')
    n='persist.write_4k_fsync_after_idle'
    print(f'\nafter_idle A max {[r[n][2] for r in A]} B max {[r[n][2] for r in B]}; A min {[r[n][3] for r in A]} B min {[r[n][3] for r in B]}\n')
