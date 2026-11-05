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

print("refusals:", refused if refused else "none")

# Round 9 additions: C6 and P (rule.txt), stated before the run.
import statistics
c6 = True
for size in (256, 1024, 2048):
    k = f"copyat.{size}.libc.s0.d16"; d0 = v("head", f"copyat.{size}.libc.s0.d0")
    good = v("head", k) <= 1.5 * d0; c6 &= good
    print(f"C6 {'ok  ' if good else 'FAIL'} {k}: head {v('head',k):.0f} <= 1.5 x head d0 {d0:.0f}  base {raw('base',k)} head {raw('head',k)}")
print("C6 (copyat half)", "HOLDS" if c6 else "FAILS", "; its mem.memcpy half is D3")
G = 1 - v("head", "mem.memcpy.262144") / v("base", "mem.memcpy.262144")
place = {arm: [v(arm, f"copyat.place.p{k}") for k in range(8)] for arm in ("base", "head")}
for arm in ("base", "head"):
    print(f"P  {arm} place.p0..p7: {[round(x) for x in place[arm]]}  max/min {max(place[arm])/min(place[arm]):.3f}")
p1 = all(max(place[a]) / min(place[a]) >= 1 + G for a in ("base", "head"))
mh, mb = statistics.median(place["head"]), statistics.median(place["base"])
p2 = mh >= mb / 1.1
print(f"P  G = {G:.3f}; P1 {'HOLDS' if p1 else 'FAILS'}; P2 median head {mh:.0f} vs base {mb:.0f} = {mh/mb:.3f}: {'HOLDS' if p2 else 'FAILS'}")
d3_rest = all(l.startswith("D3 ok") for l in out if l.startswith("D3") and "mem.memcpy.262144" not in l)
d3_262 = next(l for l in out if "mem.memcpy.262144" in l).startswith("D3 ok")
d3 = d3_rest and ((p2) if p1 else d3_262)
print("D3 with P:", "HOLDS" if d3 else "FAILS", f"(other rows {'ok' if d3_rest else 'FAIL'}; 262144 judged by {'P2' if p1 else 'D3 as written'})")
for n in (64, 128):
    for d in (0, 16):
        k = f"copyat.{n}.libc.s0.d{d}"; print(f"unjudged {k}: base {raw('base',k)} head {raw('head',k)}")
k = "copyat.262144.libc.s0.d0"; print(f"unjudged {k}: base {raw('base',k)} head {raw('head',k)}")
