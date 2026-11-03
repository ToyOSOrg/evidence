import sys, struct, re
img = open(sys.argv[1], 'rb').read(); out = sys.argv[2]
n = 0
for m in re.finditer(rb'\x7fELF\x02\x01\x01', img):
    o = m.start(); h = img[o:o+64]
    if len(h) < 64: continue
    e_type, e_machine = struct.unpack_from('<HH', h, 16)
    e_shoff, = struct.unpack_from('<Q', h, 40)
    e_shentsize, e_shnum = struct.unpack_from('<HH', h, 58)
    if e_machine != 62 or e_shnum == 0 or e_shnum > 200: continue
    size = e_shoff + e_shentsize * e_shnum
    if size > 64 << 20: continue
    blob = img[o:o+size]
    name = b'kernel' if b'syscall_dispatch' in blob else b'x'
    if name == b'kernel':
        open(f"{out}-{n}.elf", 'wb').write(blob); print(o, size, e_type); n += 1
