# Physical footprint of a tree on APFS: union of every regular file's physical
# extents (F_LOG2PHYS_EXT), and per-owner bytes no other owner shares.
# Owner = <root>/<kind>/<key> (first two path components below root). Read-only.
import fcntl, os, struct, sys, collections, json
F_LOG2PHYS_EXT = 65
root = sys.argv[1]
depth = int(sys.argv[2]) if len(sys.argv) > 2 else 2
seen_ino = set()
ranges = []          # (start, end, owner_id)
owners = []
owner_ix = {}
unresolved = collections.Counter()
apparent = collections.Counter()
def owner_of(rel):
    parts = rel.split(os.sep)
    o = os.sep.join(parts[:depth]) if len(parts) > depth else os.sep.join(parts[:-1]) or '.'
    if o not in owner_ix:
        owner_ix[o] = len(owners); owners.append(o)
    return owner_ix[o]
for dp, dns, fns in os.walk(root):
    for fn in fns:
        p = os.path.join(dp, fn)
        try:
            st = os.lstat(p)
        except OSError:
            continue
        if not os.path.stat.S_ISREG(st.st_mode):
            continue
        rel = os.path.relpath(p, root)
        oi = owner_of(rel)
        apparent[oi] += st.st_blocks * 512
        if st.st_ino in seen_ino:
            continue
        seen_ino.add(st.st_ino)
        size = st.st_size
        if size == 0:
            continue
        try:
            fd = os.open(p, os.O_RDONLY)
        except OSError:
            unresolved[oi] += st.st_blocks * 512; continue
        try:
            off = 0
            while off < size:
                buf = struct.pack('=Iqq', 0, size - off, off)
                try:
                    res = fcntl.fcntl(fd, F_LOG2PHYS_EXT, buf)
                except OSError:
                    unresolved[oi] += st.st_blocks * 512; break
                _, contig, dev = struct.unpack('=Iqq', res)
                if contig <= 0:
                    unresolved[oi] += st.st_blocks * 512; break
                # round to 4 KiB blocks
                s = dev - (dev % 4096); e = dev + contig; e += (-e) % 4096
                ranges.append((s, e, oi))
                off += contig
        finally:
            os.close(fd)
# sweep
ev = []
for s, e, o in ranges:
    ev.append((s, 1, o)); ev.append((e, -1, o))
ev.sort(key=lambda x: (x[0], x[1]))
active = collections.Counter()
excl = collections.Counter()
total = 0
prev = None
for pos, d, o in ev:
    if prev is not None and pos > prev and active:
        seg = pos - prev
        total += seg
        if len(active) == 1:
            excl[next(iter(active))] += seg
    if d == 1:
        active[o] += 1
    else:
        active[o] -= 1
        if active[o] == 0: del active[o]
    prev = pos
G = 1024**3
print(f"physical union: {total/G:.2f} GiB; apparent (st_blocks, inode-dedup per owner not applied): {sum(apparent.values())/G:.2f} GiB; unresolved: {sum(unresolved.values())/G:.2f} GiB")
rows = sorted(range(len(owners)), key=lambda i: owners[i])
out = {owners[i]: {"apparent": apparent[i], "exclusive": excl[i], "unresolved": unresolved[i]} for i in rows}
json.dump(out, open(sys.argv[3], 'w'), indent=0) if len(sys.argv) > 3 else None
for i in rows:
    print(f"{owners[i]}\tapparent {apparent[i]/G:.3f} GiB\texclusive {excl[i]/G:.3f} GiB\tunresolved {unresolved[i]/G:.3f} GiB")
