"""frames.py <log> <nm>: scratch. Symbolize the lldb frame walk the scout hook logs."""
import sys, re, bisect
log, nmf = sys.argv[1:]
syms = []
for l in open(nmf):
    p = l.split(' ', 2)
    try: syms.append((int(p[0], 16), p[2].strip()))
    except Exception: pass
syms.sort(); keys = [a for a, _ in syms]
text = open(log).read()
slide = int(re.search(r"SCOUT-LLDB slide 0x([0-9a-f]+)", text).group(1), 16)
def sym(a):
    if a < slide: return hex(a)
    o = a - slide; i = bisect.bisect_right(keys, o) - 1
    return f"{syms[i][1][:150]}+{o - syms[i][0]:#x}" if i >= 0 else hex(a)
first = text.split("SCOUT-LLDB\n", 1)[1].split("SCOUT-LLDB slide", 1)[0]
cpus = {}
for i, part in enumerate(first.split("thread select ")[1:]):
    pc = int(re.search(r"pc = 0x([0-9a-f]+)", part).group(1), 16)
    elr = int(re.search(r"ELR_EL1 = 0x([0-9a-f]+)", part).group(1), 16)
    cpus[i] = [f"pc {sym(pc)}", f"elr {sym(elr)}"]
for block in re.split(r"SCOUT-LLDB frames \d+\n", text)[1:]:
    reads = block.split("(lldb) memory read")[1:9]
    for i, r in enumerate(reads):
        line = r.splitlines()[1] if len(r.splitlines()) > 1 else ""
        w = line.split(": ", 1)[1].split() if ": " in line else []
        try: cpus[i].append(sym(int(w[1], 16)))
        except Exception: pass
for i, fr in cpus.items():
    print(f"== thread {i+1}")
    for f in fr: print("   ", f)
