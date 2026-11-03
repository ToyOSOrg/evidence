import sys, struct, re
img = open(sys.argv[1], 'rb').read(); out = sys.argv[2]; needle = sys.argv[3].encode()
n = 0
for m in re.finditer(rb'\x7fELF\x02\x01\x01', img):
    o = m.start(); h = img[o:o+64]
    e_machine, = struct.unpack_from('<H', h, 18)
    e_shoff, = struct.unpack_from('<Q', h, 40)
    e_shentsize, e_shnum = struct.unpack_from('<HH', h, 58)
    if e_machine != 62 or e_shnum == 0 or e_shnum > 200: continue
    size = e_shoff + e_shentsize * e_shnum
    if size > 128 << 20: continue
    blob = img[o:o+size]
    if needle in blob:
        open(f"{out}-{n}.elf", 'wb').write(blob); print(o, size); n += 1
