# Builds the specification's appendices from the two container read-outs: every declared version
# side by side, and the API and capability bits each file sets.
# argv: <container-cc-a0-77.log> <container-ty-a0-gf-a0-89.log>
import re
import sys


def load(path):
    text = open(path).read()
    versions = {}
    for m in re.finditer(r'^  group (0x..) id (0x..): command v(\d+), notification v(\d+)$', text, re.M):
        versions[(int(m[1], 16), int(m[2], 16))] = (int(m[3]), int(m[4]))
    api = [int(x) for x in re.search(r'^API bits set: \[(.*)\]$', text, re.M)[1].split(', ')]
    capa = [int(x) for x in re.search(r'^capability bits set: \[(.*)\]$', text, re.M)[1].split(', ')]
    return versions, api, capa


cc, ty = load(sys.argv[1]), load(sys.argv[2])
fmt = lambda v: '—' if v is None else f'c{v[0]} n{v[1]}'
print('## Appendix A. Declared versions\n')
print('Every entry of both files\' command-version records, from C77 @0x0000a8 and C89 @0x0000a8: '
      'group, identifier, then "c" the command version and "n" the notification version; 99 is unknown, '
      'and — means the file has no entry.\n')
print('| Group | Identifier | AX200 file | AX210 file |')
print('|---|---|---|---|')
for key in sorted(set(cc[0]) | set(ty[0])):
    print(f'| 0x{key[0]:02x} | 0x{key[1]:02x} | {fmt(cc[0].get(key))} | {fmt(ty[0].get(key))} |')
print()
print('## Appendix B. API and capability bits\n')
print('From C77 and C89, the bit numbers each file sets in its API words (kind 29) and capability words (kind 30).\n')
for name, idx in (('API', 1), ('Capability', 2)):
    a, b = set(cc[idx]), set(ty[idx])
    print(f'- **{name} bits set in both files**: {", ".join(map(str, sorted(a & b)))}.')
    print(f'- **{name} bits set only in the AX200 file**: {", ".join(map(str, sorted(a - b))) or "none"}.')
    print(f'- **{name} bits set only in the AX210 file**: {", ".join(map(str, sorted(b - a))) or "none"}.')
print()
used = [
    ('API', 9, 'country updates carry a source', 'L fw/file.h:216, 277'),
    ('API', 41, 'status bit 7 of a received frame means replay error', 'L fw/file.h:234-235, 291'),
    ('API', 48, 'the NVM-info answer has version 4', 'L fw/file.h:245-246, 297'),
    ('API', 56, 'the reduced scan configuration', 'L fw/file.h:259-260, 304'),
    ('API', 58, 'extended channel configuration in scan requests', 'L fw/file.h:263, 306'),
    ('API', 59, 'the band is reported in received-frame notifications', 'L fw/file.h:264, 307'),
    ('Capability', 1, 'location-aware regulatory (LAR)', 'L fw/file.h:331, 460'),
    ('Capability', 2, 'UMAC scan', 'L fw/file.h:332, 461'),
    ('Capability', 12, 'dynamic queue allocation', 'L fw/file.h:343-344, 468'),
    ('Capability', 29, 'LAR with several country sources', 'L fw/file.h:353-356, 476'),
    ('Capability', 32, 'a fragmented platform NVM', 'L fw/file.h:359, 481'),
    ('Capability', 68, 'multi-queue receive', 'L fw/file.h:380, 511'),
    ('Capability', 74, 'the firmware handles critical-temperature kill', 'L fw/file.h:389, 516'),
    ('Capability', 89, 'the country-update answer carries 11ax capabilities', 'L fw/file.h:403-404, 525'),
    ('Capability', 110, 'the MLD API', 'L fw/file.h:429, 540'),
]
print('| Bit | Meaning | AX200 file | AX210 file | Source |')
print('|---|---|---|---|---|')
for name, bit, meaning, src in used:
    idx = 1 if name == 'API' else 2
    print(f'| {name} {bit} | {meaning} | {"set" if bit in cc[idx] else "clear"} | {"set" if bit in ty[idx] else "clear"} | {src} |')
