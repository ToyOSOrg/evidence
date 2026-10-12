# Reads the `reseal::RAISED` static out of a built actuator kernel's ELF and
# holds it to the committed 06-8c-01: only the revision (0xbe -> 0xbf) and the
# checksum differ, the header and data sum to 0, and the static is 16-aligned.
import struct, sys
elf, ucode = sys.argv[1], sys.argv[2]
b = open(elf, 'rb').read()
u = open(ucode, 'rb').read()
shoff, = struct.unpack_from('<Q', b, 0x28)
shentsize, shnum, shstrndx = struct.unpack_from('<HHH', b, 0x3a)
secs = [struct.unpack_from('<IIQQQQIIQQ', b, shoff + i * shentsize) for i in range(shnum)]
symtab = next(s for s in secs if s[1] == 2)
strtab = secs[symtab[6]]
found = []
for i in range(symtab[5] // 24):
    name, info, other, shndx, value, size = struct.unpack_from('<IBBHQQ', b, symtab[4] + i * 24)
    end = b.index(b'\0', strtab[4] + name)
    n = b[strtab[4] + name:end].decode()
    if 'reseal' in n and 'RAISED' in n:
        found.append((n, shndx, value, size))
assert len(found) == 1, found
n, shndx, value, size = found[0]
sec = secs[shndx]
raised = b[sec[4] + value - sec[3]: sec[4] + value - sec[3] + size]
print('symbol', n, 'address', hex(value), 'size', size, 'aligned16', value % 16 == 0)
diff = [i for i in range(len(u)) if raised[i] != u[i]]
print('bytes differing from 06-8c-01:', diff)
rev, = struct.unpack_from('<I', raised, 4)
data, = struct.unpack_from('<I', raised, 28)
total = sum(struct.unpack_from('<%dI' % ((48 + data) // 4), raised, 0)) & 0xffffffff
print('revision', hex(rev), 'header+data dword sum', hex(total))
ok = size == len(u) and value % 16 == 0 and set(diff) <= set(range(4, 8)) | set(range(16, 20)) and rev == 0xbf and total == 0
print('RESEALED-OK' if ok else 'RESEALED-WRONG')
sys.exit(0 if ok else 1)
