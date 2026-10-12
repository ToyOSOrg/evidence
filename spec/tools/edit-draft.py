# Applies the owner's direction to the readers' draft before neutralize.py keys its citations:
# the sources and citation-key sections name no reference file, reference names leave the text,
# and run citations become RunNN. Every literal replacement must match exactly once.
# argv: <draft.md> <out.md>
import re
import sys

s = open(sys.argv[1]).read()


def once(old, new):
    global s
    n = s.count(old)
    if n != 1:
        sys.exit(f'{n} matches for: {old[:90]!r}')
    s = s.replace(old, new)


a = s.index('### Sources, in #876 §7\'s order')
b = s.index('### Conventions')
s = s[:a] + '''### Sources, in #876 §7's order

1. **Intel's firmware-interface definitions decide what they state.** These are the definitions Intel publishes for these parts under BSD-3-Clause (dual-licensed with GPL-2.0), read at a pinned release, and cited here as `[Intel n]`. Another reference disagreeing does not reopen what they state; the bench checks it.
2. **Other references fill what those leave unsaid**: another operating system's driver for these parts, which this document calls **the reference driver**, with its 802.11 layer; an access-point implementation; and the demo's driver. Each is cited as `[Ref n]`.
3. **The firmware containers**, read under the licence bound below.
4. **Measurements**: S1 on the T14 (`s1/` and `s1-r2/` on this branch); the demo's runs on the AMD bench, AX200, masked whole under `spec/runs/`; the AMD bench's configuration-space dump, decoded in `spec/evidence/ax200-config-space.log`.
5. **Standards**: IEEE Std 802.11-2020.

- **Each key's document, file, lines and pinned commit are in `spec/provenance.md`**, the readers' record. This document names no reference's file, and a writer needs none: the facts are stated here.
- **Of Intel's definitions, only dual-licensed files were read**; no GPL-only file was read beyond its licence line.

A fact the references disagree on, or all leave unsaid, is listed in §14 and stays open until a reader's scout measures it.

### Citation keys

| Key | Means |
|---|---|
| `[Intel n]` | Intel's firmware-interface definitions, entry n of `spec/provenance.md` |
| `[Ref n]` | another reference, entry n of `spec/provenance.md` |
| `C77 @off`, `C89 @off`, `CPN @off` | the record at byte offset `off` of `iwlwifi-cc-a0-77.ucode`, `iwlwifi-ty-a0-gf-a0-89.ucode` or `iwlwifi-ty-a0-gf-a0.pnvm`, as `spec/evidence/container-*.log` reads it |
| `C77 v(g,i)`, `C89 v(g,i)` | that file's declared versions for group `g`, identifier `i` (Appendix A) |
| `Runnn:line` | line of `spec/runs/demo-vnn.log`, a demo run on the AX200 |
| `S1 file:line` | line of an S1 log on this branch |
| `P:line` | line of `spec/evidence/ax200-config-space.log` |
| `[I]` | this reader's inference, stated as such |

''' + s[b:]

once('- **OpenBSD\'s names**: `0x2723` is the AX200 and `0x2725` the AX210. O dev/pci/pcidevs:4917-4918.',
     '- **The reference driver\'s device list names** `0x2723` the AX200 and `0x2725` the AX210. O dev/pci/pcidevs:4917-4918.')
once('which OpenBSD turns on by default.', 'which it is by default.')
once('  - OpenBSD takes a unicast frame\'s key', '  - The reference driver\'s 802.11 layer takes a unicast frame\'s key')
once('- **OpenBSD discards a group frame', '- **The reference driver\'s 802.11 layer discards a group frame')
once('That is OpenBSD\'s receive rule (§11.3)', 'That is the reference driver\'s receive rule (§11.3)')
once('- **hostapd assigns the ANonce once per 4-way handshake**', '- **The reference access-point implementation assigns the ANonce once per 4-way handshake**')
once('- **So a hostapd AP resends message 1', '- **So an access point running it resends message 1')
once('  - iwx: firmware of API 50 or later rejects', '  - Firmware of API 50 or later rejects')
once('the demo driver at the build of R13, `userland/netstack/src/wifi.rs`:2450', 'D userland/netstack/src/wifi.rs:2450')
once('(the demo driver at the build of R13, `userland/netstack/src/wifi.rs`:1987)', '[D userland/netstack/src/wifi.rs:1987]')

s = re.sub(r'\bR(1[1-6])\b', r'Run\1', s)

verbs = {'names': 'name', 'says': 'say', 'gives': 'give', 'has': 'have', 'calls': 'call', 'places': 'place',
         'makes': 'make', 'puts': 'put', 'counts': 'count', 'decides': 'decide'}
s = re.sub(r"Intel's (paging )?headers? (names|says|gives|has|calls|places|makes|puts|counts|decides)\b",
           lambda m: f"Intel's {m.group(1) or ''}definitions {verbs[m.group(2)]}", s)
s = re.sub(r"Intel's (paging )?headers?", lambda m: f"Intel's {m.group(1) or ''}definitions", s)

s = re.sub(r'\*\*iwx\'s\b', "**The reference driver's", s)
s = re.sub(r'\*\*iwx\b', '**The reference driver', s)
s = re.sub(r'(^|\n)(\s*(?:- |\d+\. )?)iwx\'s\b', r"\1\2The reference driver's", s)
s = re.sub(r'(^|\n)(\s*(?:- |\d+\. )?)iwx\b', r'\1\2The reference driver', s)
s = re.sub(r'(\. |\| )iwx\'s\b', r"\1The reference driver's", s)
s = re.sub(r'(\. |\| )iwx\b', r'\1The reference driver', s)
s = re.sub(r'\biwx\'s\b', "the reference driver's", s)
s = re.sub(r'\biwx\b', 'the reference driver', s)
open(sys.argv[2], 'w').write(s)
left = [w for w in ('iwx', 'OpenBSD', 'hostapd', 'Linux', 'header') if re.search(rf'\b{w}', s)]
print('remaining words:', left)
