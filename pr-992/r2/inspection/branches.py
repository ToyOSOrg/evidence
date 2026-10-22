# Scratch analysis (never lands): from root symbols in an LLVM .s file, walk
# the static call graph inside the crate and report, per function, its calls
# and every conditional branch with the instructions that set its condition.
import re, sys

path, arch = sys.argv[1], sys.argv[2]
roots = sys.argv[3:]
lines = open(path).read().split('\n')
label = re.compile(r'^([_A-Za-z0-9.$]+):')
funcs, cur = {}, None
for l in lines:
    m = label.match(l)
    if m and not m.group(1).startswith(('.L', 'L', 'Ltmp', 'lCPI')) and not l.startswith('.'):
        cur = m.group(1); funcs[cur] = []
        continue
    if cur is not None:
        funcs[cur].append(l)
if arch == 'x86':
    cond = re.compile(r'^\s+(j(?!mp)[a-z]+)\s+(\S+)')
    call = re.compile(r'^\s+callq?\s+(\S+)')
else:
    cond = re.compile(r'^\s+(b\.[a-z]+|cbn?z|tbn?z)\s+(.*)')
    call = re.compile(r'^\s+bl\s+(\S+)')
seen, order = set(), []
def walk(f):
    if f in seen or f not in funcs: return
    seen.add(f); order.append(f)
    for l in funcs[f]:
        m = call.match(l)
        if m and 'toyos_crypto' in m.group(1): walk(m.group(1))
for r in roots:
    for f in funcs:
        if r in f: walk(f)
for f in order:
    body = [l for l in funcs[f] if l.strip() and not l.strip().startswith(('.', '#', '//', ';'))]
    calls = sorted({call.match(l).group(1) for l in body if call.match(l)})
    print(f'## {f}  ({len(body)} instructions)')
    for c in calls: print(f'   call {c}')
    for i, l in enumerate(body):
        if cond.match(l):
            ctx = ' | '.join(x.strip() for x in body[max(0, i - 3):i + 1])
            setter = ''
            if arch != 'x86' and l.strip().startswith('b.'):
                for j in range(i - 1, max(-1, i - 60), -1):
                    w = body[j].split()[0] if body[j].split() else ''
                    if w in ('cmp', 'cmn', 'subs', 'adds', 'tst', 'ands', 'ccmp', 'ccmn', 'negs', 'bics', 'adcs', 'sbcs'):
                        setter = f'   [flags from {i - j} back: {body[j].strip()}]'
                        break
            print(f'   branch: {ctx}{setter}')
