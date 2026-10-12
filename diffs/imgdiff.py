"""Where two ToyOS disk images differ: per GPT region and partition, and in a
FAT32 volume per file and per directory-entry field. Read-only on both images.
usage: python3 -I imgdiff.py <a.img> <b.img>"""
import struct
import sys
import uuid

SECTOR = 512
CHUNK = 1 << 16


def guid(b):
    return str(uuid.UUID(bytes_le=bytes(b)))


def gpt(img):
    hdr = img[SECTOR:2 * SECTOR]
    assert hdr[:8] == b"EFI PART", "no GPT header at LBA 1"
    alt = struct.unpack_from("<Q", hdr, 32)[0]
    entries_lba, n, size = struct.unpack_from("<QII", hdr, 72)
    disk = guid(hdr[56:72])
    parts = []
    for i in range(n):
        at = entries_lba * SECTOR + i * size
        e = img[at:at + size]
        if e[:16] == bytes(16):
            continue
        first, last = struct.unpack_from("<QQ", e, 32)
        name = e[56:128].decode("utf-16-le").rstrip("\0")
        parts.append((name, guid(e[16:32]), first * SECTOR, (last + 1) * SECTOR))
    return disk, parts, entries_lba, n * size, alt


DIRENT_FIELDS = [
    (0, 11, "name"), (11, 12, "attr"), (12, 13, "nt"), (13, 14, "ctime_tenth"),
    (14, 16, "ctime"), (16, 18, "cdate"), (18, 20, "adate"), (20, 22, "cluster_hi"),
    (22, 24, "wtime"), (24, 26, "wdate"), (26, 28, "cluster_lo"), (28, 32, "size"),
]


class Fat:
    def __init__(self, vol):
        self.vol = vol
        bps, spc, res, nfats = struct.unpack_from("<HBHB", vol, 11)
        fatsz = struct.unpack_from("<I", vol, 36)[0]
        root = struct.unpack_from("<I", vol, 44)[0]
        self.fat = res * bps
        self.fatbytes = fatsz * bps * nfats
        self.data = (res + nfats * fatsz) * bps
        self.csize = bps * spc
        self.owner = {}
        self.dirents = {}
        self.sizes = {}
        self.walk(root, "")

    def chain(self, c):
        out = []
        while 2 <= c < 0x0FFFFFF8 and c not in out:
            out.append(c)
            c = struct.unpack_from("<I", self.vol, self.fat + 4 * c)[0] & 0x0FFFFFFF
        return out

    def walk(self, start, path):
        lfn = []
        for c in self.chain(start):
            self.owner[c] = (path or "/") + " (directory)"
            base = self.data + (c - 2) * self.csize
            for i in range(0, self.csize, 32):
                e = self.vol[base + i:base + i + 32]
                if e[0] == 0:
                    return
                if e[0] == 0xE5:
                    continue
                if e[11] == 0x0F:
                    lfn.insert(0, e)
                    continue
                name = "".join(
                    bytes(l[1:11] + l[14:26] + l[28:32]).decode("utf-16-le", "replace") for l in lfn
                ).split("\0")[0] or e[:11].decode("ascii", "replace").strip()
                lfn = []
                full = path + "/" + name
                self.dirents[base + i] = full
                if e[11] & 0x08 or name in (".", ".."):
                    continue
                first = (struct.unpack_from("<H", e, 20)[0] << 16) | struct.unpack_from("<H", e, 26)[0]
                if e[11] & 0x10:
                    self.walk(first, full)
                else:
                    self.sizes[full] = struct.unpack_from("<I", e, 28)[0]
                    for cc in self.chain(first):
                        self.owner[cc] = full

    def where(self, o):
        if o < self.fat:
            return "boot sector, FSInfo or reserved"
        if o < self.fat + self.fatbytes:
            return "FAT"
        ent = o - (o - self.data) % 32
        if ent in self.dirents:
            f = next(name for a, b, name in DIRENT_FIELDS if a <= o - ent < b)
            return f"dirent of {self.dirents[ent]}: {f}"
        c = (o - self.data) // self.csize + 2
        return f"contents of {self.owner.get(c, '<unowned cluster %d>' % c)}"


def differing(a, b):
    n = min(len(a), len(b))
    out = []
    for lo in range(0, n, CHUNK):
        hi = min(lo + CHUNK, n)
        if a[lo:hi] != b[lo:hi]:
            out.extend(o for o in range(lo, hi) if a[o] != b[o])
    return out


def runs_of(offs):
    runs = []
    for o in offs:
        if runs and o == runs[-1][1] + 1:
            runs[-1][1] = o
        else:
            runs.append([o, o])
    return runs


def main(a_path, b_path):
    a, b = open(a_path, "rb").read(), open(b_path, "rb").read()
    print(f"a {a_path}\nb {b_path}\nsizes {len(a)} {len(b)}")
    da, pa, elba, ebytes, alt = gpt(a)
    db, pb, _, _, _ = gpt(b)
    print(f"disk GUID: {da} | {db}")
    for x, y in zip(pa, pb):
        same = "" if x[2:] == y[2:] else f"  EXTENT DIFFERS {y[2:]}"
        print(f"  {x[0]:14} [{x[2]}, {x[3]}) unique GUID {x[1]} | {y[1]}{same}")
    regions = [("protective MBR", 0, SECTOR), ("primary GPT header", SECTOR, 2 * SECTOR),
               ("primary GPT entries", elba * SECTOR, elba * SECTOR + ebytes),
               ("backup GPT entries", alt * SECTOR - ebytes, alt * SECTOR),
               ("backup GPT header", alt * SECTOR, alt * SECTOR + SECTOR)]
    regions += [(p[0], p[2], p[3]) for p in pa]
    diffs = differing(a, b)
    print(f"{len(diffs)} byte(s) differ in all")
    rest = list(diffs)
    for name, lo, hi in regions:
        mine = [o for o in diffs if lo <= o < hi]
        rest = [o for o in rest if not lo <= o < hi]
        print(f"{name}: {len(mine)} byte(s) differ")
        if not mine:
            continue
        if name.startswith("ToyOS slot ") or name in ("EFI System", "ToyOS log") or name.startswith("ESP"):
            fa = Fat(a[lo:hi])
            seen = {}
            for o in mine:
                seen.setdefault(fa.where(o - lo), []).append(o - lo)
            for k, offs in sorted(seen.items()):
                r = runs_of(offs)
                show = ", ".join(f"+{r0}..+{r1}" for r0, r1 in r[:4])
                print(f"    {k}: {len(offs)} byte(s) in {len(r)} run(s) [{show}{', ...' if len(r) > 4 else ''}]")
        else:
            r = runs_of(mine)
            for r0, r1 in r[:16]:
                print(f"    +{r0 - lo}..+{r1 - lo}: {a[r0:r1 + 1].hex()} | {b[r0:r1 + 1].hex()}")
            if len(r) > 16:
                print(f"    ... {len(r)} runs in all")
    print(f"outside every region: {len(rest)} byte(s)")


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
