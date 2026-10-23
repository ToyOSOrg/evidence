"""Scratch: lists every control transfer in the secret-path Curve25519 functions of a
disassembled rlib (GNU objdump -dr), with the instructions before it."""
import re, sys

path, arch = sys.argv[1], sys.argv[2]
names = ["6x25519NtB4_9SecretKey5agree", "6x25519NtB4_9SecretKey10public_key", "13x25519_public", "8base_mul",
         "5Niels6select", "5Point9add_niels", "9Completed5point", "9Completed10projective", "10Projective6double",
         "10Projective6encode", "10SigningKey4sign", "10SigningKey9from_seed", "Tight6invert", "Tight11pow_2_250_1",
         "Tight12square_times", "Tight5bytes", "Tight6select", "Tight4swap", "Tight11is_negative", "Tight2eq",
         "Tight7is_zero", "mul_portable", "square_portable"]
funcs, cur = {}, None
for line in open(path, errors="replace"):
    m = re.match(r"^[0-9a-f]+ <(.*)>:$", line)
    if m:
        cur = m.group(1) if any(n in m.group(1) for n in names) and "drop_glue" not in m.group(1) else None
        if cur:
            funcs[cur] = []
        continue
    if cur:
        funcs[cur].append(line.rstrip())
if arch == "x86":
    br = re.compile(r"\s(j[a-z]+|call|ret|cmov[a-z]+|set[a-z]+)\s")
else:
    br = re.compile(r"\s(b\.[a-z]+|cbz|cbnz|tbz|tbnz|bl|blr|br|ret|b|csel|csinc|csinv|csneg|cset|csetm)\s")
for f, lines in sorted(funcs.items()):
    insns = [l for l in lines if re.match(r"^\s+[0-9a-f]+:\t", l)]
    print(f"== {f}: {len(insns)} instructions")
    for i, l in enumerate(lines):
        if br.search(l + " "):
            ctx = [x.split("\t", 1)[-1].strip() for x in lines[max(0, i - 2):i] if re.match(r"^\s+[0-9a-f]+:\t", x)]
            reloc = lines[i + 1].strip() if i + 1 < len(lines) and "R_" in lines[i + 1] or (i + 1 < len(lines) and "RELOC" in lines[i + 1]) or (i + 1 < len(lines) and "BRANCH" in lines[i + 1]) else ""
            print(f"   {l.split(chr(9), 1)[-1].strip():60}  after: {' ; '.join(ctx)}  {reloc}")
