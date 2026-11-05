import re, sys, os
R = sys.argv[1]
boots = {"base": ["1-base", "4-base"], "head": ["2-head", "3-head"]}
pat = re.compile(r"bench=(\S+) unit=(\S+) .*?p50=(\d+)")
data, units, refused = {}, {}, []
for arm, bs in boots.items():
    for b in bs:
        for line in open(os.path.join(R, b, "kernel.log"), errors="replace"):
            if "refuse" in line and "osbench" in line: refused.append((b, line.strip()[-160:]))
            m = pat.search(line)
            if m:
                data.setdefault((arm, m.group(1)), []).append(int(m.group(3))); units[m.group(1)] = m.group(2)
def v(arm, k):
    x = data[(arm, k)]; assert len(x) == 2, (arm, k, x); return sum(x) / 2
def raw(arm, k): return data[(arm, k)]
out = []; ok = {}
def chk(rule, name, val, bound, cmp="<="):
    good = val <= bound if cmp == "<=" else val >= bound
    ok.setdefault(rule, True); ok[rule] &= good
    out.append(f"{rule} {'ok  ' if good else 'FAIL'} {name}: {val:.0f} {cmp} {bound:.1f}  base={raw('base',name) if ('base',name) in data else '-'} head={raw('head',name) if ('head',name) in data else '-'}")
SL = 10
bd0 = {s: v("base", f"copyat.8192.libc.s{s}.d0") for s in (0, 16)}
hd0 = v("head", "copyat.8192.libc.s0.d0")
for s in (0, 16):
    chk("D1", f"copyat.8192.libc.s{s}.d16", v("base", f"copyat.8192.libc.s{s}.d16"), 5 * v("base", "copyat.8192.libc.s0.d0"), ">=")
D = [0,16,32,64,256,384,512,640,768,1024,1536,2048,2560,3072,4032,4080]
for s in (0, 16):
    for d in D:
        k = f"copyat.8192.libc.s{s}.d{d}"
        if 16 <= d <= 384: chk("D2", k, v("head", k), 1.3 * hd0 + SL)
        else: chk("D3", k, v("head", k), 1.1 * v("base", k) + SL)
for k in sorted(x for (a, x) in data if a == "base" and x.startswith("mem.memcpy.")):
    assert units[k] == "MB/s", units[k]
    chk("D3", k, v("head", k), v("base", k) / 1.1, ">=")
chk("D4", "copyat.8192.heap", v("head", "copyat.8192.heap"), 1.5 * hd0 + SL)
for size in (65536, 262144, 1048576, 4194304, 67108864):
    for d in (16, 256):
        k = f"copyat.{size}.libc.s0.d{d}"
        chk("D5", k, v("head", k), 1.1 * v("base", k))
        if size <= 1048576: chk("D5", k + " vs base d0", v("head", k), 1.1 * v("base", f"copyat.{size}.libc.s0.d0"))
for n in (4096, 65536):
    k = f"ipc.reqrep.{n}"
    chk("D6", k, v("head", k), 1.05 * v("base", k))
    for i in range(2):
        out.append(f"   pair {i+1} {k}: head {data[('head',k)][i]} / base {data[('base',k)][i]} = {data[('head',k)][i]/data[('base',k)][i]:.3f}")
print("\n".join(out)); print()
for r in sorted(ok): print(r, "HOLDS" if ok[r] else "FAILS")
print("heap notes:"); 
print("refusals:", refused if refused else "none")
