import struct, sys, re
def syms(path):
    b = open(path, 'rb').read()
    shoff, = struct.unpack_from('<Q', b, 0x28)
    shentsize, shnum, shstrndx = struct.unpack_from('<HHH', b, 0x3A)
    secs = [struct.unpack_from('<IIQQQQII', b, shoff + i * shentsize) for i in range(shnum)]
    out = []
    for name, typ, flags, addr, off, size, link, info in secs:
        if typ != 2: continue
        stroff = secs[link][4]
        for i in range(size // 24):
            st_name, st_info, st_other, st_shndx, st_value, st_size = struct.unpack_from('<IBBHQQ', b, off + i * 24)
            n = b[stroff + st_name:b.index(b'\0', stroff + st_name)].decode()
            out.append((n, st_info, st_other, st_shndx, st_value, st_size))
    return out
norm = lambda n: re.sub(r'\.llvm\.\d+$', '.llvm.N', n)
for name, d in [('kernel', 'x86_64-unknown-none'), ('supervisor', 'x86_64-unknown-toyos'), ('doom', 'x86_64-unknown-toyos')]:
    a, c = syms(f'bins-staged/{name}'), syms(f'wt/target/{d}/toyos/{name}')
    exact = sum(x != y for x, y in zip(a, c))
    sa = sorted((norm(x[0]),) + x[1:] for x in a); sc = sorted((norm(x[0]),) + x[1:] for x in c)
    renamed = sorted({x[0] for x, y in zip(a, c) if x != y})
    print(f'{name}: {len(a)} and {len(c)} symbols; {exact} differ in place; equal as sets once `.llvm.<hash>` is normalised: {sa == sc}; names that differ and are not .llvm ones: {[n for n in renamed if ".llvm." not in n][:5]}')
