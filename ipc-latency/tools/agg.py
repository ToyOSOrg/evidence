# usage: agg.py <counts> <nm> <base-hex> <rounds> [top]
import sys, bisect, re, subprocess
counts, nmf, base, rounds = sys.argv[1], sys.argv[2], int(sys.argv[3],16), int(sys.argv[4])
top = int(sys.argv[5]) if len(sys.argv) > 5 else 60
syms=[]
for l in open(nmf):
    p=l.split()
    syms.append((int(p[0],16), p[2]))
syms.sort()
addrs=[a for a,_ in syms]
names=[n for _,n in syms]
fn={}; cls={}; kt=0; ut=0
heavy=re.compile(r'^(lock|wrmsr|rdmsr|movq %\w+, %cr\d|movq %cr|xsave|xrstor|swapgs|sysret|iret|cpuid|rdtsc|lfence|mfence|sfence|pause|hlt|xchg|cmpxchg|invpcid|invlpg|rdpid|rdfsbase|wrfsbase|wrgsbase|rdgsbase|stac|clac|sti|cli|popf|pushf|verw|syscall)')
for l in open(counts):
    p=l.split(None,2)
    a=int(p[0],16); c=int(p[1]); d=p[2].strip() if len(p)>2 else ''
    if a>>48 == 0xffff:
        kt+=c
        i=bisect.bisect_right(addrs,a-base)-1
        n=names[i] if i>=0 else '?'
    else:
        ut+=c; n='<user>'
    fn[n]=fn.get(n,0)+c
    m=heavy.match(d)
    if m:
        k=d.split()[0] if not d.startswith('lock') else 'lock '+d.split()[1]
        if k.startswith('movq') : k=d
        cls[k]=cls.get(k,0)+c
print(f"per round: kernel {kt/rounds:.0f} user {ut/rounds:.0f}")
def dem(n):
    try:
        return subprocess.run(['rustfilt'],input=n,capture_output=True,text=True).stdout.strip() or n
    except Exception: return n
items=sorted(fn.items(),key=lambda x:-x[1])[:top]
dm=dem('\n'.join(n for n,_ in items)).split('\n')
for (n,c),d in zip(items,dm):
    print(f"{c/rounds:9.1f}  {d[:170]}")
print("--- heavy instructions per round")
for k,c in sorted(cls.items(),key=lambda x:-x[1]):
    if c/rounds>=0.5: print(f"{c/rounds:9.1f}  {k}")
