# For each table, each `_CST` NameSeg's next 256 bytes: the WordConst (0x0B)
# values 350 and 400 in the order they appear. Prints counts and that order
# only, never an address or a name the firmware chose.
import sys, os, collections
orders = collections.Counter()
for name in sorted(os.listdir(sys.argv[1])):
    b = open(os.path.join(sys.argv[1], name), 'rb').read()
    at = 0
    while True:
        at = b.find(b'_CST', at)
        if at < 0:
            break
        window = b[at:at + 256]
        seen = []
        for i in range(len(window) - 2):
            if window[i] == 0x0B:
                v = window[i + 1] | window[i + 2] << 8
                if v in (350, 400):
                    seen.append(v)
        orders[tuple(seen[:2])] += 1
        at += 4
for order, n in sorted(orders.items()):
    print(f'{n} _CST name(s): WordConst latencies in byte order {order}')
