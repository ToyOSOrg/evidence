# Tabulates the "BIOS Access / SMM Access / OS Access" columns of Intel 631122
# (11th Gen Core Datasheet Vol 2a, rev 003), from the text pdftext extracted.
#   python3 -I os_access.py 631122.txt > intel-631122-os-access.txt
import re, sys
t = open(sys.argv[1], encoding='utf-8', errors='replace').read()
pat = re.compile(r'TypeSize Offset Default\s*(MMIO|PCI)\s*(\d+)\s*bit\s*(.{0,40}?)\+\s*([0-9A-Fa-f]+)h\s*([0-9A-Fa-f ]+?)h\s*BIOS Access SMM Access OS Access\s*(RW|R)\s*(RW|R)\s*(RW|R)')
n = 0
for m in pat.finditer(t):
    n += 1
    print(m.group(1), m.group(2), m.group(3).strip(), m.group(4), 'BIOS', m.group(6), 'SMM', m.group(7), 'OS', m.group(8))
print('count', n)
