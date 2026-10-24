"""Mask machine identifiers in bench logs: argv = out_dir, then in=out pairs."""
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
    t = t.replace('LENOVO', '<vendor>').replace('20W0003AMZ', '<product>')
    t = re.sub(r'N34ET71W \(1\.71 \)|N34ET71W', '<bios>', t)
    t = re.sub(r'/Users/[^ \n]*', '<path>', t)
    open(dst, 'w', encoding='utf-8', errors='surrogateescape').write(t)
print('type GUIDs kept:', ' '.join(sorted(types)))
print('GUIDs masked:', len(masked))
