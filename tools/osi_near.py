# Whether each `PAGD` device's bytes hold an _OSI call on the string
# "Processor Aggregator Device": counts only.
import sys, os
hits = 0
for name in sorted(os.listdir(sys.argv[1])):
    b = open(os.path.join(sys.argv[1], name), 'rb').read()
    at = b.find(b'PAGD')
    while at >= 0:
        window = b[at:at + 200]
        if b'_OSI' in window and b'Processor Aggregator Device' in window:
            hits += 1
        at = b.find(b'PAGD', at + 4)
print(f'PAGD bodies asking _OSI ("Processor Aggregator Device"): {hits}')
