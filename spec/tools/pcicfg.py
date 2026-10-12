# Decodes one PCI function's 256-byte configuration-space dump: identity, BAR 0, and the MSI,
# MSI-X and PCI Express capabilities.
# argv: <dump>
import struct
import sys

b = open(sys.argv[1], 'rb').read()
print(f'dump length {len(b)}')
v, d = struct.unpack_from('<HH', b, 0)
sv, sd = struct.unpack_from('<HH', b, 0x2c)
print(f'vendor {v:#06x} device {d:#06x} subsystem vendor {sv:#06x} subsystem {sd:#06x} '
      f'revision {b[8]:#04x} class {b[11]:02x}:{b[10]:02x}:{b[9]:02x}')
bar0, bar1 = struct.unpack_from('<II', b, 0x10)
print(f'BAR 0 low dword {bar0:#010x}: memory {not bar0 & 1}, type {(bar0 >> 1) & 3} (2 = 64-bit), '
      f'prefetchable {(bar0 >> 3) & 1}; BAR 1 dword {bar1:#010x}')
print(f'byte 0x41 {b[0x41]:#04x}')
p = b[0x34]
while p:
    cid, nxt = b[p], b[p + 1]
    if cid == 0x11:
        ctl = struct.unpack_from('<H', b, p + 2)[0]
        t, pba = struct.unpack_from('<II', b, p + 4)
        print(f'MSI-X at {p:#x}: control {ctl:#06x}, {(ctl & 0x7ff) + 1} entries, table BIR {t & 7} offset {t & ~7:#x}, '
              f'PBA BIR {pba & 7} offset {pba & ~7:#x}')
    elif cid == 0x05:
        ctl = struct.unpack_from('<H', b, p + 2)[0]
        print(f'MSI at {p:#x}: control {ctl:#06x}, {1 << ((ctl >> 1) & 7)} vector(s) capable, 64-bit {(ctl >> 7) & 1}, '
              f'per-vector mask {(ctl >> 8) & 1}')
    elif cid == 0x10:
        lctl = struct.unpack_from('<H', b, p + 0x10)[0]
        dctl2 = struct.unpack_from('<H', b, p + 0x28)[0]
        print(f'PCI Express at {p:#x}: link control {lctl:#06x}, device control 2 {dctl2:#06x} '
              f'(LTR enable {(dctl2 >> 10) & 1})')
    else:
        print(f'capability {cid:#04x} at {p:#x}')
    p = nxt
