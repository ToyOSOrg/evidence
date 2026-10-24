"""Mask machine identifiers in bench logs. argv: in=out pairs. The machine's vendor,
product and BIOS strings come from MASK_VENDOR, MASK_PRODUCT and MASK_BIOS, never from here."""
import os
import re, sys
GUID = re.compile(r'\b[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{12}\b')
TYPE = re.compile(r'of type (' + GUID.pattern + ')')
BYTES = re.compile(r'guid \[(?:[0-9a-f]{2}, ){15}[0-9a-f]{2}\]')
pairs = [a.split('=', 1) for a in sys.argv[1:]]
texts = {src: open(src, encoding='utf-8', errors='surrogateescape').read() for src, _ in pairs}
types = {m.upper() for t in texts.values() for m in TYPE.findall(t)}
masked = set()
def guid(m):
    g = m.group(0)
    if g.upper() in types:
        return g
    masked.add(g.upper())
    return '<partition-guid>'
for src, dst in pairs:
    t = texts[src]
    t = GUID.sub(guid, t)
    t = BYTES.sub('guid [<partition-guid>]', t)
    for var, word in (('MASK_BIOS', '<bios>'), ('MASK_PRODUCT', '<product>'), ('MASK_VENDOR', '<vendor>')):
        for value in filter(None, os.environ[var].split('|')):
            t = t.replace(value, word)
    t = re.sub(r'/Users/[^ \n]*', '<path>', t)
    open(dst, 'w', encoding='utf-8', errors='surrogateescape').write(t)
print('type GUIDs kept:', ' '.join(sorted(types)))
print('GUIDs masked:', len(masked))
