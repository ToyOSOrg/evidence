"""Executes the asm! template of a kernel file on named registers, with CF and
OF, for the instructions it uses, and checks it against integers."""
import random
import re
import sys

M = (1 << 64) - 1


def template(path, fn):
    src = open(path).read()
    body = src[src.index(f"fn {fn}("):]
    body = body[body.index("asm!(") + 5:]
    lines = []
    for line in body.splitlines():
        line = line.strip()
        if line.startswith('"'):
            lines.append(line[1:line.rindex('"')])
        elif re.match(r"^[A-Za-z_]\w* = ", line) or line.startswith("out(") or line.startswith("options"):
            break
    return lines


def run(lines, regs, mem):
    flags = {"CF": 0, "OF": 0}

    def name(op):
        op = op.strip()
        m = re.fullmatch(r"\{(\w+)(?::e)?\}", op)
        return m.group(1) if m else op

    def val(op):
        op = op.strip()
        m = re.fullmatch(r"\[\{(\w+)\}(?: \+ (\d+))?\]", op)
        if m:
            return mem[regs[m.group(1)] + int(m.group(2) or 0)]
        if re.fullmatch(r"-?(0x[0-9a-f]+|\d+)", op):
            return int(op, 0) & M
        return regs[name(op)]

    def setr(op, v):
        n = name(op)
        assert not op.strip().startswith("["), op
        regs[n] = v & M

    for line in lines:
        op, _, rest = line.partition(" ")
        args = [a for a in re.split(r",\s*", rest)] if rest else []
        if op == "mov":
            setr(args[0], val(args[1]))
        elif op == "mulx":
            p = regs["rdx"] * val(args[2])
            setr(args[1], p)
            setr(args[0], p >> 64)
        elif op in ("add", "adc", "adcx", "adox"):
            c = {"add": 0, "adc": flags["CF"], "adcx": flags["CF"], "adox": flags["OF"]}[op]
            s = val(args[0]) + val(args[1]) + c
            setr(args[0], s)
            if op == "adox":
                flags["OF"] = s >> 64
            elif op == "adcx":
                flags["CF"] = s >> 64
            else:
                flags["CF"] = s >> 64
                flags["OF"] = None  # add/adc define OF; no carry chain may read it after
        elif op in ("sub", "sbb"):
            b = flags["CF"] if op == "sbb" else 0
            d = val(args[0]) - val(args[1]) - b
            setr(args[0], d)
            flags["CF"] = 1 if d < 0 else 0
            flags["OF"] = None
        elif op == "xor":
            setr(args[0], val(args[0]) ^ val(args[1]))
            flags["CF"] = flags["OF"] = 0
        elif op in ("shl", "shr"):
            k = val(args[1])
            v = val(args[0])
            setr(args[0], (v << k) if op == "shl" else (v >> k))
            flags["CF"] = flags["OF"] = None
        elif op in ("cmovnc", "cmovc"):
            assert flags["CF"] in (0, 1)
            if flags["CF"] == (0 if op == "cmovnc" else 1):
                setr(args[0], val(args[1]))
        else:
            raise SystemExit(f"unknown {line}")
        for f in ("CF", "OF"):
            pass
    # A chain that read an undefined flag would have raised on None arithmetic.
    return regs


P = 2**256 - 2**224 + 2**192 + 2**96 - 1
R = 1 << 256


def limbs(x):
    return [(x >> (64 * i)) & M for i in range(4)]


def p256_mul(lines, a, b):
    mem = {}
    for i, w in enumerate(limbs(a)):
        mem[0x1000 + 8 * i] = w
    for i, w in enumerate(limbs(b)):
        mem[0x2000 + 8 * i] = w
    regs = {r: 0xdead_beef_0000_0000 + i for i, r in enumerate("A B C D E F lo hi rdx".split())}
    regs.update({"a": 0x1000, "b": 0x2000, "p3": 0xffff_ffff_0000_0001})
    regs = run(lines, regs, mem)
    return regs["E"] | regs["F"] << 64 | regs["A"] << 128 | regs["B"] << 192


def p256_square(lines, a):
    mem = {0x1000 + 8 * i: w for i, w in enumerate(limbs(a))}
    regs = {r: 0xdead_beef_0000_0000 + i for i, r in enumerate("T0 T1 T2 T3 T4 T5 T6 T7 lo hi rdx".split())}
    regs.update({"a": 0x1000, "p3": 0xffff_ffff_0000_0001})
    regs = run(lines, regs, mem)
    return regs["T4"] | regs["T5"] << 64 | regs["T6"] << 128 | regs["T7"] << 192


def p256_mul_separated(lines, a, b):
    mem = {0x1000 + 8 * i: w for i, w in enumerate(limbs(a))}
    mem.update({0x2000 + 8 * i: w for i, w in enumerate(limbs(b))})
    regs = {r: 0xdead_beef_0000_0000 + i for i, r in enumerate("T0 T1 T2 T3 T4 T5 T6 T7 lo hi rdx".split())}
    regs.update({"a": 0x1000, "b": 0x2000, "p3": 0xffff_ffff_0000_0001})
    regs = run(lines, regs, mem)
    return regs["T4"] | regs["T5"] << 64 | regs["T6"] << 128 | regs["T7"] << 192


def main():
    path = sys.argv[1]
    lines = template(path, "mul")
    print(f"{len(lines)} instructions")
    rinv = pow(R, -1, P)
    edge = [0, 1, 2, P - 1, P - 2, (P - 1) // 2, R - P, 2**64 - 1, 2**128 - 1, 2**192, P - 2**64]
    rng = random.Random(7)
    cases = [(x, y) for x in edge for y in edge] + [(rng.randrange(P), rng.randrange(P)) for _ in range(int(sys.argv[2]) if len(sys.argv) > 2 else 200_000)]
    for a, b in cases:
        got = (p256_mul_separated if any("{T7}" in l for l in lines) else p256_mul)(lines, a, b)
        want = a * b * rinv % P
        assert got == want, (hex(a), hex(b), hex(got), hex(want))
    print(f"{len(cases)} products match a b / 2^256 mod p")
    lines = template(path, "square")
    print(f"{len(lines)} instructions")
    singles = edge + [x for x, _ in cases[len(edge) ** 2:]]
    for a in singles:
        got = p256_square(lines, a)
        want = a * a * rinv % P
        assert got == want, (hex(a), hex(got), hex(want))
    print(f"{len(singles)} squares match a^2 / 2^256 mod p")
    if "fn mul_separated(" in open(path).read():
        lines = template(path, "mul_separated")
        print(f"{len(lines)} instructions")
        for a, b in cases:
            got = p256_mul_separated(lines, a, b)
            want = a * b * rinv % P
            assert got == want, (hex(a), hex(b), hex(got), hex(want))
        print(f"{len(cases)} separated products match a b / 2^256 mod p")


main()
