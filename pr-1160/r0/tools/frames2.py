"""frames2.py <log> <nm> <vectors-offset-hex>: scratch. Group the scout hook's lldb output by gdbstub
port and symbolize each vCPU's pc, elr and frame-pointer walk."""
import sys, re, bisect
log, nmf, voff = sys.argv[1], sys.argv[2], int(sys.argv[3], 16)
syms = []
for l in open(nmf):
    p = l.split(' ', 2)
    try: syms.append((int(p[0], 16), p[2].strip()))
    except Exception: pass
syms.sort(); keys = [a for a, _ in syms]
text = open(log).read()
blocks = re.split(r"\n[0-9:]+ SCOUT-LLDB", text)[1:]
by_port = {}
for b in blocks:
    m = re.search(r"gdb-remote (\d+)", b)
    if m: by_port.setdefault(m.group(1), []).append(b)
for port, bs in by_port.items():
    first = next(b for b in bs if b.startswith("\n") and "thread select" in b)
    vbar = int(re.search(r"VBAR_EL1 = 0x([0-9a-f]+)", first).group(1), 16)
    slide = vbar - voff
    def sym(a):
        o = a - slide
        if o < 0 or o > 0x1000000: return hex(a)
        i = bisect.bisect_right(keys, o) - 1
        return f"{syms[i][1][:140]}+{o - syms[i][0]:#x}"
    cpus = {}
    for i, part in enumerate(first.split("thread select ")[1:]):
        g = lambda n: int(re.search(rf"{n} = 0x([0-9a-f]+)", part).group(1), 16)
        cpus[i] = [f"pc {sym(g('pc'))}", f"elr {sym(g('ELR_EL1'))}", f"x30 {sym(g('x30'))}", f"x20 {g('x20'):#x} tpidr {g('TPIDR_EL1'):#x} sp_el0 {g('SP_EL0'):#x}"]
    for b in bs:
        if not b.startswith(" frames"): continue
        reads = b.split("(lldb) memory read")[1:9]
        for i, r in enumerate(reads):
            ls = r.splitlines()
            w = ls[1].split(": ", 1)[1].split() if len(ls) > 1 and ": " in ls[1] else []
            try: cpus[i].append(sym(int(w[1], 16)))
            except Exception: pass
    print(f"##### guest on port {port}, slide {slide:#x}")
    for i, fr in cpus.items():
        print(f"== vcpu thread {i+1}")
        for f in fr: print("   ", f)
