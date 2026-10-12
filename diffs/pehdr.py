"""The loader's PE/COFF header fields in each image's ESP, and where in the
file each differing byte of two loaders sits.
usage: python3 -I pehdr.py <a.img> <b.img>"""
import struct
import sys

sys.path.insert(0, sys.argv[0].rsplit("/", 1)[0])
from imgdiff import Fat, gpt  # noqa: E402


def loader(path):
    img = open(path, "rb").read()
    _, parts, _, _, _ = gpt(img)
    lo, hi = next((p[2], p[3]) for p in parts if p[0] == "EFI System")
    fat = Fat(img[lo:hi])
    name = "/EFI/BOOT/BOOTx64.EFI"
    clusters = sorted(c for c, owner in fat.owner.items() if owner == name)
    ent = next(o for o, p in fat.dirents.items() if p == name)
    first = (struct.unpack_from("<H", fat.vol, ent + 20)[0] << 16) | struct.unpack_from("<H", fat.vol, ent + 26)[0]
    chain = fat.chain(first)
    data = b"".join(fat.vol[fat.data + (c - 2) * fat.csize:fat.data + (c - 1) * fat.csize] for c in chain)
    size = fat.sizes[name]
    return data[:size], lo + fat.data + (first - 2) * fat.csize, len(clusters) == len(chain)


a, a_at, a_contig = loader(sys.argv[1])
b, b_at, _ = loader(sys.argv[2])
print(f"loader sizes {len(a)} {len(b)}; file starts at image byte {a_at} (ESP-relative {a_at - 1048576}), chain contiguous {a_contig}")
pe = struct.unpack_from("<I", a, 0x3C)[0]
coff = pe + 4
opt = coff + 20
magic = struct.unpack_from("<H", a, opt)[0]
print(f"PE header at {pe}; optional header magic {magic:#x}")
for label, off, fmt in [("TimeDateStamp", coff + 4, "<I"), ("CheckSum", opt + 64, "<I")]:
    print(f"  {label} at file +{off}: {struct.unpack_from(fmt, a, off)[0]:#x} | {struct.unpack_from(fmt, b, off)[0]:#x}")
nsect = struct.unpack_from("<H", a, coff + 2)[0]
optsize = struct.unpack_from("<H", a, coff + 16)[0]
sects = []
for i in range(nsect):
    s = opt + optsize + 40 * i
    name = a[s:s + 8].rstrip(b"\0").decode()
    vsize, va, rawsize, raw = struct.unpack_from("<IIII", a, s + 8)
    sects.append((name, raw, raw + rawsize))
ndirs = struct.unpack_from("<I", a, opt + 108)[0]
for i in range(ndirs):
    rva, sz = struct.unpack_from("<II", a, opt + 112 + 8 * i)
    if i == 6 and sz:
        print(f"  debug directory: rva {rva:#x} size {sz}")
runs = []
for o in range(min(len(a), len(b))):
    if a[o] != b[o]:
        if runs and runs[-1][1] == o - 1:
            runs[-1][1] = o
        else:
            runs.append([o, o])
for r0, r1 in runs:
    where = next((n for n, lo, hi in sects if lo <= r0 < hi), "headers")
    print(f"  differs at file +{r0}..+{r1} ({r1 - r0 + 1} bytes) in {where}")
