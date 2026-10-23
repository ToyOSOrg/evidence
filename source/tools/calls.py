# Scratch: for one function's disassembly, the loops (backward branches) and
# each call, with GOT-slot targets resolved through the binary's RELATIVE
# relocations and symbol table. argv: llvm-bin-dir binary disasm.s
import re, subprocess, sys, bisect
bindir, binary, dis = sys.argv[1:4]
rel = {}
out = subprocess.run([f"{bindir}/llvm-readobj", "--relocs", binary], capture_output=True, text=True).stdout
for m in re.finditer(r"(0x[0-9A-Fa-f]+) R_X86_64_RELATIVE - (0x[0-9A-Fa-f]+)", out):
    rel[int(m.group(1), 16)] = int(m.group(2), 16)
syms = []
for line in subprocess.run([f"{bindir}/llvm-nm", "-C", binary], capture_output=True, text=True).stdout.splitlines():
    p = line.split(" ", 2)
    if len(p) == 3 and p[0] and p[1] in "tTwW":
        syms.append((int(p[0], 16), p[2]))
syms.sort()
addrs = [a for a, _ in syms]
def name(a):
    i = bisect.bisect_right(addrs, a) - 1
    return f"{syms[i][1]}+{a - syms[i][0]:#x}" if i >= 0 else hex(a)
ins = []
for line in open(dis):
    m = re.match(r"\s*([0-9a-f]+):\s+(\S+)\s*(.*)", line)
    if m:
        ins.append((int(m.group(1), 16), m.group(2), m.group(3)))
loops = []
for a, op, args in ins:
    if op.startswith("j"):
        t = re.match(r"(0x[0-9a-f]+)", args)
        if t and int(t.group(1), 16) < a:
            loops.append((int(t.group(1), 16), a))
print("loops (head..back-branch):", ", ".join(f"{h:#x}..{e:#x} ({sum(1 for x,_,_ in ins if h <= x <= e)} insns)" for h, e in loops))
for a, op, args in ins:
    if op.startswith("call"):
        g = re.search(r"# (0x[0-9a-f]+)", args)
        target = name(rel[int(g.group(1), 16)]) if g and int(g.group(1), 16) in rel else args
        inside = [f"{h:#x}" for h, e in loops if h <= a <= e]
        print(f"call at {a:#x} -> {target}; inside loop {inside or 'none'}")
spills = [(a, op, args) for a, op, args in ins if "ymm" in args and "(%rsp)" in args]
for h, e in loops:
    n = sum(1 for a, _, _ in spills if h <= a <= e)
    print(f"loop {h:#x}: {n} ymm stack accesses")
