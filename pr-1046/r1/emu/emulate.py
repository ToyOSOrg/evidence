"""Scratch only: executes a kernel's asm! template on named registers with
CF and OF tracked separately, and checks it against integers mod 2^255 - 19."""
import random
import re
import sys

M = (1 << 64) - 1
P = 2**255 - 19


def template(path, fn):
    src = open(path).read()
    body = src[src.index(f"fn {fn}("):]
    body = body[body.index("asm!(") + 5:]
    lines = []
    for line in body.splitlines():
        line = line.strip()
        if line.startswith('"'):
            lines.append(line[1:line.rindex('"')])
        elif line.startswith("//") or not line:
            continue
        else:
            break
    return lines


def run(lines, regs, mem):
    flags = {"CF": None, "OF": None}

    def name(op):
        op = op.strip()
        m = re.fullmatch(r"\{(\w+)(?::e)?\}", op)
        if m:
            return m.group(1)
        return {"edx": "rdx"}.get(op, op)

    def val(op):
        op = op.strip()
        m = re.fullmatch(r"\[\{(\w+)\}(?: \+ (\d+))?\]", op)
        if m:
            return mem[regs[m.group(1)] + int(m.group(2) or 0)]
        if re.fullmatch(r"-?(0x[0-9a-f]+|\d+)", op):
            return int(op, 0) & M
        return regs[name(op)]

    def setr(op, v):
        assert not op.strip().startswith("["), op
        regs[name(op)] = v & M

    def flag(f):
        assert flags[f] in (0, 1), f"read of undefined {f}"
        return flags[f]

    for line in lines:
        op, _, rest = line.partition(" ")
        args = re.split(r",\s*", rest) if rest else []
        if op == "mov":
            setr(args[0], val(args[1]))
        elif op == "mulx":
            p = regs["rdx"] * val(args[2])
            lo, hi = p & M, p >> 64
            setr(args[1], lo)
            setr(args[0], hi)  # hi written last: SDM says dest1 wins when equal
        elif op == "imul":
            setr(args[0], val(args[1]) * val(args[2]))
            flags["CF"] = flags["OF"] = None
        elif op in ("add", "adc", "adcx", "adox"):
            c = {"add": 0, "adc": None, "adcx": None, "adox": None}[op]
            if op in ("adc", "adcx"):
                c = flag("CF")
            elif op == "adox":
                c = flag("OF")
            s = val(args[0]) + val(args[1]) + c
            setr(args[0], s)
            if op == "adox":
                flags["OF"] = s >> 64
            elif op == "adcx":
                flags["CF"] = s >> 64
            else:
                flags["CF"] = s >> 64
                flags["OF"] = None
        elif op in ("sub", "sbb"):
            b = flag("CF") if op == "sbb" else 0
            d = val(args[0]) - val(args[1]) - b
            setr(args[0], d)
            flags["CF"] = 1 if d < 0 else 0
            flags["OF"] = None
        elif op == "xor":
            setr(args[0], val(args[0]) ^ val(args[1]))
            flags["CF"] = flags["OF"] = 0
        elif op == "and":
            setr(args[0], val(args[0]) & val(args[1]))
            flags["CF"] = flags["OF"] = 0
        elif op in ("shl", "shr"):
            k = val(args[1])
            v = val(args[0])
            setr(args[0], (v << k) if op == "shl" else (v >> k))
            flags["CF"] = flags["OF"] = None
        elif op in ("cmovnc", "cmovc"):
            if flag("CF") == (0 if op == "cmovnc" else 1):
                setr(args[0], val(args[1]))
        else:
            raise SystemExit(f"unknown {line}")
    return regs


def limbs(x):
    return [(x >> (64 * i)) & M for i in range(4)]


def call(lines, outs, a, b=None):
    mem = {0x1000 + 8 * i: w for i, w in enumerate(limbs(a))}
    if b is not None:
        mem.update({0x2000 + 8 * i: w for i, w in enumerate(limbs(b))})
    regs = {r: 0xdead_beef_0000_0000 + i for i, r in enumerate("T0 T1 T2 T3 T4 T5 T6 T7 lo hi rdx".split())}
    regs.update({"a": 0x1000, "b": 0x2000})
    regs = run(lines, regs, mem)
    return sum(regs[r] << (64 * i) for i, r in enumerate(outs))


def main():
    path = sys.argv[1]
    n = int(sys.argv[2]) if len(sys.argv) > 2 else 100_000
    R = 1 << 256
    edge = [0, 1, 2, 19, 38, P - 1, P, P + 1, R - 1, R - 2, R - 38, R - 39, 2**255, 2**255 - 1, 2**64 - 1,
            2**128 - 1, 2**192, 2 * P, 2 * P + 37, (R - 1) // 38 * 38]
    rng = random.Random(25519)
    rand = [rng.randrange(R) for _ in range(n)]
    top = [R - 1 - rng.randrange(2**64) for _ in range(n // 10)]
    pairs = [(x, y) for x in edge for y in edge] + list(zip(rand, rand[1:] + rand[:1])) + list(zip(top, top[::-1]))
    outs = ["T0", "T1", "T2", "T3"]
    lines = template(path, "mul")
    print(f"mul: {len(lines)} instructions")
    for a, b in pairs:
        got = call(lines, outs, a, b)
        assert got < R and got % P == a * b % P, (hex(a), hex(b), hex(got))
    print(f"mul: {len(pairs)} products below 2^256 and congruent to a b mod p")
    lines = template(path, "square")
    print(f"square: {len(lines)} instructions")
    singles = edge + rand + top
    for a in singles:
        got = call(lines, outs, a)
        assert got < R and got % P == a * a % P, (hex(a), hex(got))
    print(f"square: {len(singles)} squares below 2^256 and congruent to a^2 mod p")


main()
