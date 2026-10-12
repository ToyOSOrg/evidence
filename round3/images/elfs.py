# For each image: every embedded ELF64 found by its magic, sized from its own
# header (section table end), hashed. Prints, per ELF hash, which images carry it.
import hashlib, struct, sys
from collections import defaultdict
seen = defaultdict(list)
for path in sys.argv[1:]:
    data = open(path, 'rb').read()
    at = 0
    while True:
        at = data.find(b'\x7fELF\x02\x01\x01', at)
        if at < 0: break
        try:
            e_type, e_machine = struct.unpack_from('<HH', data, at + 16)
            e_shoff, = struct.unpack_from('<Q', data, at + 40)
            e_shentsize, e_shnum = struct.unpack_from('<HH', data, at + 58)
            end = at + e_shoff + e_shentsize * e_shnum
            if e_shoff and e_shnum and end <= len(data) and e_shentsize == 64:
                blob = data[at:end]
                seen[(hashlib.sha256(blob).hexdigest()[:16], len(blob), e_type, e_machine)].append(path.split('/metal/')[1])
        except struct.error:
            pass
        at += 4
for key, where in sorted(seen.items(), key=lambda kv: -kv[0][1]):
    if len(where) != len(sys.argv) - 1:
        print(key, sorted(where))
print('ELFs carried by every image:', sum(1 for w in seen.values() if len(w) == len(sys.argv) - 1))
