# Scratch: instruction mix of a disassembled function below a cutoff address.
import sys, collections, re
path, cut = sys.argv[1], int(sys.argv[2], 16)
ops = collections.Counter(); mem = 0; n = 0
for line in open(path):
    m = re.match(r'\s+([0-9a-f]+):\s+(\S+)\s*(.*)', line)
    if not m: continue
    if int(m.group(1), 16) >= cut: continue
    n += 1; ops[m.group(2)] += 1
    if 'rsp' in m.group(3): mem += 1
print('instructions', n, 'rsp-refs', mem)
for k, v in ops.most_common(30): print(v, k)
