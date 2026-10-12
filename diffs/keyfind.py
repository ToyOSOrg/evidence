"""Where each checkout's throwaway Ed25519 public key sits in an image, by
partition. Prints offsets and counts only, never a key.
usage: python3 -I keyfind.py <image> <checkout>..."""
import struct
import sys

from cryptography.hazmat.primitives.asymmetric.ed25519 import Ed25519PrivateKey
from cryptography.hazmat.primitives.serialization import Encoding, PublicFormat

SECTOR = 512


def parts(img):
    hdr = img[SECTOR:2 * SECTOR]
    entries_lba, n, size = struct.unpack_from("<QII", hdr, 72)
    out = []
    for i in range(n):
        at = entries_lba * SECTOR + i * size
        e = img[at:at + size]
        if e[:16] == bytes(16):
            continue
        first, last = struct.unpack_from("<QQ", e, 32)
        out.append((e[56:128].decode("utf-16-le").rstrip("\0"), first * SECTOR, (last + 1) * SECTOR))
    return out


def public(checkout):
    seed = bytes.fromhex(open(checkout + "/target/image-signing-throwaway").read().strip())
    return Ed25519PrivateKey.from_private_bytes(seed).public_key().public_bytes(Encoding.Raw, PublicFormat.Raw)


img = open(sys.argv[1], "rb").read()
print(f"image {sys.argv[1]}")
for checkout in sys.argv[2:]:
    raw = public(checkout)
    for form, key in (("raw", raw), ("hex", raw.hex().encode())):
        for name, lo, hi in parts(img):
            hits, at = [], img.find(key, lo, hi)
            while at != -1:
                hits.append(at - lo)
                at = img.find(key, at + 1, hi)
            print(f"  key of {checkout.rsplit('/', 1)[-1]} ({form}): {name}: {len(hits)} copies at {hits[:8]}")
