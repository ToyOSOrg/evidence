import sys, struct, zlib, uuid
path, mib = sys.argv[1], int(sys.argv[2])
LBA = 512; total = mib * 2048
def guid(s): return uuid.UUID(s).bytes_le
scratch = guid("51CC09F9-7442-435B-BC03-0FD8718B0FB5")
first, last = 2048, 2048 + (mib - 2) * 2048 - 1
entry = scratch + uuid.uuid4().bytes_le + struct.pack("<QQQ", first, last, 0) + "ToyOS-scratch".encode("utf-16-le").ljust(72, b"\0")
entries = entry.ljust(128 * 128, b"\0")
ecrc = zlib.crc32(entries)
disk = uuid.uuid4().bytes_le
def header(cur, alt, ent):
    h = struct.pack("<8sIIIIQQQQ16sQIII", b"EFI PART", 0x10000, 92, 0, 0, cur, alt, 34, total - 34, disk, ent, 128, 128, ecrc)
    crc = zlib.crc32(h)
    return (h[:16] + struct.pack("<I", crc) + h[20:]).ljust(LBA, b"\0")
mbr = bytearray(LBA)
mbr[446:462] = struct.pack("<BBBBBBBBII", 0, 0, 2, 0, 0xEE, 0xFF, 0xFF, 0xFF, 1, min(total - 1, 0xFFFFFFFF))
mbr[510:512] = b"\x55\xaa"
with open(path, "wb") as f:
    f.truncate(total * LBA)
    f.seek(0); f.write(mbr); f.write(header(1, total - 1, 2)); f.write(entries)
    f.seek((total - 33) * LBA); f.write(entries); f.write(header(total - 1, 1, total - 33))
