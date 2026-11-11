import sys, struct, hashlib
# List every file of each image's "ToyOS slot A" FAT32 volume with its size and sha256 prefix.
def slot(p):
    f = open(p, 'rb'); head = f.read(1 << 20)
    n, esz = struct.unpack_from('<II', head, 512 + 80); lba, = struct.unpack_from('<Q', head, 512 + 72)
    for k in range(n):
        e = head[lba * 512 + k * esz: lba * 512 + (k + 1) * esz]
        first, last = struct.unpack_from('<QQ', e, 32)
        if e[56:128].decode('utf-16le').rstrip('\0') == 'ToyOS slot A':
            f.seek(first * 512); return f.read((last - first + 1) * 512)
def files(v):
    bps, spc, rsv, nfats = struct.unpack_from('<HBHB', v, 11)
    fatsz, = struct.unpack_from('<I', v, 36); root, = struct.unpack_from('<I', v, 44)
    fat = v[rsv * bps: (rsv + fatsz) * bps]; data0 = (rsv + nfats * fatsz) * bps; cs = spc * bps
    def chain(c):
        while 2 <= c < 0x0FFFFFF8:
            yield v[data0 + (c - 2) * cs: data0 + (c - 1) * cs]
            c = struct.unpack_from('<I', fat, c * 4)[0] & 0x0FFFFFFF
    def walk(c, path):
        d = b''.join(chain(c)); lfn = ''
        for o in range(0, len(d), 32):
            ent = d[o:o + 32]
            if ent[0] == 0: break
            if ent[0] == 0xE5: lfn = ''; continue
            if ent[11] == 0x0F:
                part = (ent[1:11] + ent[14:26] + ent[28:32]).decode('utf-16le', 'ignore').split('\0')[0]
                lfn = part + lfn; continue
            name = lfn or ent[0:8].decode('latin1').strip() + ('.' + ent[8:11].decode('latin1').strip() if ent[8:11].strip() else '')
            lfn = ''
            if name in ('.', '..') or ent[11] & 0x08: continue
            c2 = struct.unpack_from('<H', ent, 20)[0] << 16 | struct.unpack_from('<H', ent, 26)[0]
            size, = struct.unpack_from('<I', ent, 28)
            if ent[11] & 0x10: yield from walk(c2, path + name + '/')
            else: yield path + name, size, hashlib.sha256(b''.join(chain(c2))[:size]).hexdigest()[:12]
    yield from walk(root, '/')
for p in sys.argv[1:]:
    print(p.split('/stage-r2/')[-1])
    for name, size, h in files(slot(p)):
        print(f'  {name} {size} {h}')
