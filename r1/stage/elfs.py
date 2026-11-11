import sys, struct, hashlib
def elfs(path):
    data = open(path, 'rb').read()
    out = []
    i = data.find(b'\x7fELF\x02\x01')
    while i != -1:
        try:
            e_type, e_machine = struct.unpack_from('<HH', data, i + 16)
            e_shoff, = struct.unpack_from('<Q', data, i + 40)
            e_shentsize, e_shnum = struct.unpack_from('<HH', data, i + 58)
            end = e_shoff + e_shentsize * e_shnum
            if e_machine == 62 and 0 < end < 512 * 1024 * 1024 and i + end <= len(data):
                blob = data[i:i + end]
                out.append((i, end, hashlib.sha256(blob).hexdigest()[:16]))
        except struct.error:
            pass
        i = data.find(b'\x7fELF\x02\x01', i + 1)
    return out
for p in sys.argv[1:]:
    big = sorted(elfs(p), key=lambda t: -t[1])[:3]
    print(p.split('/stage/')[-1], big)
