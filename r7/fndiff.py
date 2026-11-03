import sys, re, hashlib
def load(p):
    fns = {}; cur = None; body = []
    for line in open(p, errors='replace'):
        m = re.match(r'^[0-9a-f]+ <(.*)>:$', line)
        if m:
            if cur: fns[cur] = '\n'.join(body)
            cur = m.group(1); body = []; continue
        m = re.match(r'^\s+[0-9a-f]+:\s*(.*)$', line)
        if m and cur:
            ins = re.sub(r'<[^>]*>', '', m.group(1)); ins = re.sub(r'0x[0-9a-f]+', 'X', ins); ins = re.sub(r'\b[0-9a-f]{5,}\b', 'A', ins)
            body.append(ins.strip())
    if cur: fns[cur] = '\n'.join(body)
    return fns
a = load(sys.argv[1]); b = load(sys.argv[2])
only_a = sorted(set(a) - set(b)); only_b = sorted(set(b) - set(a))
diff = sorted(k for k in set(a) & set(b) if a[k] != b[k])
print(f"functions: base {len(a)} head {len(b)}; only base {len(only_a)}; only head {len(only_b)}; differing {len(diff)}")
for k in diff: print("DIFF", k[:160])
for k in only_a: print("BASE-ONLY", k[:160])
for k in only_b: print("HEAD-ONLY", k[:160])
