# Scratch check (never lands): interprets the asm! template of
# arch/x86_64/montgomery.rs's `row` with Intel SDM semantics for the
# instructions it uses, and holds the whole multiplication against Python
# integers.
import random, re, sys

src = open(sys.argv[1]).read()
tmpl = re.findall(r'^\s*"([^"]*)",\s*$', src[src.index('asm!('):src.index('a = in(reg) a,')], re.M)
M64 = (1 << 64) - 1

def run(a, bi, m, n0, n, t):
    mem = {}
    A, MB, T = 0x1000, 0x5000, 0x9000
    for j, v in enumerate(a): mem[A + 8 * j] = v
    for j, v in enumerate(m): mem[MB + 8 * j] = v
    for j, v in enumerate(t): mem[T + 8 * j] = v
    r = {'a': A, 'm': MB, 't': T, 'n0': n0, 'quads': n // 4, 'zero': 0, 'rdx': bi,
         'rcx': 0, 'a_ptr': 0, 't_ptr': 0, 'lo': 0, 'hi': 0, 'h0': 0}
    cf = of = 0
    labels = {l[:-1]: i for i, l in enumerate(tmpl) if re.fullmatch(r'\d+:', l)}
    def reg(x): return x.strip('{}').split(':')[0]
    def val(x):
        x = x.strip()
        if x.startswith('['):
            return mem.get(addr(x), 0)
        if re.fullmatch(r'-?\d+', x): return int(x) & M64
        return r[reg(x)]
    def addr(x):
        inner = x.strip('[]')
        mm = re.fullmatch(r'\{?(\w+)\}?\s*([+-])?\s*(\d+)?', inner.strip())
        base = r[mm.group(1)]
        off = int(mm.group(3) or 0) * (-1 if mm.group(2) == '-' else 1)
        return base + off
    def setv(x, v):
        x = x.strip()
        if x.startswith('['): mem[addr(x)] = v & M64
        else: r[reg(x)] = v & M64
    pc = 0
    steps = 0
    while pc < len(tmpl):
        steps += 1
        assert steps < 100000
        line = tmpl[pc]; pc += 1
        if re.fullmatch(r'\d+:', line): continue
        op, _, rest = line.partition(' ')
        args = [s.strip() for s in re.split(r',(?![^\[]*\])', rest)] if rest else []
        if op == 'mov': setv(args[0], val(args[1]))
        elif op == 'xor':
            setv(args[0], val(args[0]) ^ val(args[1])); cf = of = 0
        elif op == 'mulx':
            p = val('rdx') * val(args[2]); setv(args[1], p); setv(args[0], p >> 64)
        elif op == 'adcx':
            s = val(args[0]) + val(args[1]) + cf; cf = s >> 64; setv(args[0], s)
        elif op == 'adox':
            s = val(args[0]) + val(args[1]) + of; of = s >> 64; setv(args[0], s)
        elif op == 'imul':
            setv(args[0], val(args[0]) * val(args[1])); cf = of = None  # undefined after imul
        elif op == 'lea':
            setv(args[0], addr(args[1]))
        elif op == 'jrcxz':
            if r['rcx'] == 0: pc = labels[args[0][:-1]]
        elif op == 'jmp':
            pc = labels[args[0][:-1]]
        else:
            raise ValueError(line)
        assert cf in (0, 1, None) and of in (0, 1, None)
    return [mem.get(T + 8 * j, 0) for j in range(n + 2)]

random.seed(1)
for n in (4, 8, 32, 36, 64):
    for case in range(40 if n <= 36 else 8):
        mm = random.getrandbits(64 * n) | 1 | (1 << (64 * n - 1))
        if case == 0: mm = (1 << (64 * n)) - 1
        mw = [(mm >> (64 * i)) & M64 for i in range(n)]
        n0 = (-pow(mw[0], -1, 1 << 64)) & M64
        x = random.randrange(mm) if case else mm - 1
        y = random.randrange(mm) if case else mm - 1
        aw = [(x >> (64 * i)) & M64 for i in range(n)]
        bw = [(y >> (64 * i)) & M64 for i in range(n)]
        t = [0] * (n + 2)
        for i in range(n):
            t = run(aw, bw[i], mw, n0, n, t)
        got = sum(v << (64 * i) for i, v in enumerate(t[:n + 1]))
        want = (x * y * pow(1 << (64 * n), -1, mm)) % mm
        assert got % mm == want and got < 2 * mm, (n, case)
print('the template computes a b / R mod m below 2m for every case')
