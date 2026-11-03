import sys, re, os
root = sys.argv[1]; want = sys.argv[2:]
for d in sorted(os.listdir(root)):
    vals = {}
    for line in open(os.path.join(root, d, 'kernel.log'), errors='replace'):
        m = re.search(r'osbench v=2 os=toyos bench=(\S+) unit=\S+ .*?min=([0-9.]+) p50=([0-9.]+)', line)
        if m and m.group(1) in want: vals[m.group(1)] = f"{m.group(3)}(min {m.group(2)})"
    print(d, '  '.join(f"{w}={vals.get(w,'-')}" for w in want))
