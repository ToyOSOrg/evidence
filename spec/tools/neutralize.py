# Turns the readers' draft into the writer-facing specification and its provenance record.
# Every citation of a reference's file ("L path:lines" for Intel's firmware-interface definitions,
# "O path:lines" for OpenBSD, "H path:lines" for hostapd, "D path:lines" for the demo's driver) becomes a neutral key, [Intel n] or
# [Ref n]; the provenance record maps each key to its document, file and lines. The specification
# then names no reference file.
# argv: <draft.md> <spec out> <provenance out>
import re
import sys

draft, spec_out, prov_out = sys.argv[1:4]
text = open(draft).read()
CITE = re.compile(r'\b([LOHD]) ((?:[\w.-]+/)*[\w.-]*(?:\.[ch]|\.rs|pcidevs)):(\d+(?:[-–]\d+)?(?:, \d+(?:[-–]\d+)?)*)')
keys = {}
counts = {'Intel': 0, 'Ref': 0}


def key(m):
    kind, path, lines = m.group(1), m.group(2), m.group(3)
    ident = (kind, path, lines)
    if ident not in keys:
        family = 'Intel' if kind == 'L' else 'Ref'
        counts[family] += 1
        keys[ident] = f'{family} {counts[family]}'
    return '⟦' + keys[ident] + '⟧'


text = CITE.sub(key, text)
# Inside a bracketed group the key's own marks go; outside one the key gets brackets.
out, depth = [], 0
for ch in text:
    if ch == '[':
        depth += 1
    elif ch == ']':
        depth = max(depth - 1, 0)
    if ch in '⟦⟧':
        out.append('' if depth else ('[' if ch == '⟦' else ']'))
    else:
        out.append(ch)
spec = ''.join(out)
left = re.findall(r'\b[LOHD] [\w/.-]+\.(?:[ch]|rs):\d', spec)
if left:
    sys.exit(f'unconverted citations: {left[:5]}')
open(spec_out, 'w').write(spec)

ROOT = {
    'L': ('Intel firmware-interface definitions, dual-licensed GPL-2.0 OR BSD-3-Clause, '
          'in Linux tag v7.2 (8d3ae59288f1e7d58d76558a6ee96d533bc5019f)', 'drivers/net/wireless/intel/iwlwifi/'),
    'O': ('OpenBSD src, commit 7b20c05da58a2cc94ec9155c91888280ac716cae', 'sys/'),
    'H': ('hostap, commit d1759a2fa64d9d962765aab5677b86eae95d7e3a', ''),
    'D': ('the demo\'s driver as built for Run13 (a local demo branch, never on main)', ''),
}
SHORT = {'if_iwx.c': 'dev/pci/if_iwx.c', 'if_iwxreg.h': 'dev/pci/if_iwxreg.h', 'if_iwxvar.h': 'dev/pci/if_iwxvar.h'}
with open(prov_out, 'w') as f:
    f.write('# Provenance of `spec/ax2xx.md`\n\n')
    f.write('The readers\' record of where each keyed fact of the specification was read. Each key names '
            'one file and its lines at a pinned commit. Container (`C77`, `C89`, `CPN`), run (`Run11` to '
            '`Run16`), S1 and configuration-space (`P`) citations are given in the specification itself.\n\n')
    for kind, (doc, root) in ROOT.items():
        f.write(f'- **{"Intel" if kind == "L" else "Ref"}, {kind}**: {doc}; paths under `{root or "the repository root"}`.\n')
    f.write('\n| Key | Document | File | Lines |\n|---|---|---|---|\n')
    order = sorted(keys.items(), key=lambda kv: (kv[1].split()[0], int(kv[1].split()[1])))
    for (kind, path, lines), k in order:
        doc = {'L': 'Intel definitions', 'O': 'OpenBSD', 'H': 'hostap', 'D': 'demo driver'}[kind]
        full = ROOT[kind][1] + SHORT.get(path, path)
        f.write(f'| {k} | {doc} | `{full}` | {lines} |\n')
print(f'{counts["Intel"]} Intel keys, {counts["Ref"]} Ref keys')
