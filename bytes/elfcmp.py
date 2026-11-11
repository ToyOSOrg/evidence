import struct, sys, hashlib
def sections(path):
    b = open(path, 'rb').read()
    assert b[:4] == b'\x7fELF' and b[4] == 2
    shoff, = struct.unpack_from('<Q', b, 0x28)
    shentsize, shnum, shstrndx = struct.unpack_from('<HHH', b, 0x3A)
    raw = []
    for i in range(shnum):
        name, typ, flags, addr, off, size = struct.unpack_from('<IIQQQQ', b, shoff + i * shentsize)
        raw.append((name, typ, flags, addr, off, size))
    stroff = raw[shstrndx][4]
    out = {}
    for name, typ, flags, addr, off, size in raw:
        n = b[stroff + name:b.index(b'\0', stroff + name)].decode()
        data = b'' if typ == 8 else b[off:off + size]
        out[n] = (typ, flags, addr, size, hashlib.sha256(data).hexdigest()[:16])
    # program headers: what is loaded
    phoff, = struct.unpack_from('<Q', b, 0x20)
    phentsize, phnum = struct.unpack_from('<HH', b, 0x36)
    loads = []
    for i in range(phnum):
        t, fl, off, va, pa, fsz, msz, al = struct.unpack_from('<IIQQQQQQ', b, phoff + i * phentsize)
        if t == 1:
            loads.append((va, fsz, msz, fl, hashlib.sha256(b[off:off + fsz]).hexdigest()[:16]))
    entry, = struct.unpack_from('<Q', b, 0x18)
    return out, loads, entry
for name in sys.argv[3:]:
    a, la, ea = sections(f'{sys.argv[1]}/{name}')
    path = {'kernel': 'x86_64-unknown-none', 'supervisor': 'x86_64-unknown-toyos', 'doom': 'x86_64-unknown-toyos'}[name]
    c, lc, ec = sections(f'{sys.argv[2]}/{path}/toyos/{name}')
    print(f'== {name}: entry {"same" if ea == ec else "DIFFERS"}; loadable segments {"identical" if la == lc else "DIFFER"} ({len(la)})')
    for n in sorted(set(a) | set(c)):
        if a.get(n) != c.get(n):
            x, y = a.get(n), c.get(n)
            alloc = x and (x[1] & 2)
            print(f'   differs: {n:24} alloc={bool(alloc)} size {x and x[3]} -> {y and y[3]}')
