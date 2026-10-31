"""Reads, of an iwlwifi container, only loader-parsed declaration records:
every kind-58 (hardware type) record whole, and every kind-48 (command
versions) entry in file order with its index. No section content is read.
argv: <file> <ucode|pnvm>"""
import struct, sys
path, form = sys.argv[1], sys.argv[2]
buf = open(path, 'rb').read()
p = 88 if form == 'ucode' else 0
if form == 'ucode':
    zero, magic = struct.unpack_from('<II', buf, 0)
    assert zero == 0 and magic == 0x0a4c5749, (zero, magic)
k48 = 0
while p + 8 <= len(buf):
    kind, length = struct.unpack_from('<II', buf, p)
    data = p + 8
    assert data + length <= len(buf), ('overrun', hex(p))
    if kind == 58:
        raw = buf[data:data + length]
        words = [struct.unpack_from('<H', raw, i)[0] for i in range(0, length - length % 2, 2)]
        print(f'@{p:#08x} kind 58 length {length}: bytes {raw.hex(" ")}; u16 words {" ".join(f"{w:#06x}" for w in words)}')
    if kind == 48:
        k48 += 1
        n = length // 4
        print(f'@{p:#08x} kind 48 length {length}: {n} entries, record {k48} of this file')
        seen = {}
        for i in range(n):
            cmd, grp, cv, nv = buf[data + 4 * i:data + 4 * i + 4]
            seen.setdefault((grp, cmd), []).append((i, cv, nv))
        for (grp, cmd), es in sorted(seen.items()):
            if len(es) > 1:
                print(f'  duplicate group {grp:#04x} id {cmd:#04x}: ' + '; '.join(f'entry {i} (byte {data + 4 * i:#08x}) c{cv} n{nv}' for i, cv, nv in es))
        neighbours = [i for es in seen.values() if len(es) > 1 for i, _, _ in es]
        for i in neighbours:
            for j in range(max(0, i - 3), min(n, i + 4)):
                cmd, grp, cv, nv = buf[data + 4 * j:data + 4 * j + 4]
                print(f'    entry {j}: group {grp:#04x} id {cmd:#04x} c{cv} n{nv}')
            print('    --')
    p = data + ((length + 3) & ~3)
print(f'end at {p:#x} of {len(buf):#x}; kind-48 records: {k48}')
