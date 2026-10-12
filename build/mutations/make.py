# Writes each host mutation into the worktree, one at a time, as asked by argv[1].
import sys, pathlib
W = pathlib.Path('/Users/jan/Dev/jan/toyos-microcode')
M = {
 'h01-a-guest-may-load': ('kernel/microcode/src/lib.rs',
   '    if cpuid_1_ecx & 1 << 31 != 0 {\n        return Err(Unloaded::Hypervisor);\n    }\n', ''),
 'h02-revision-0xffffffff-may-load': ('kernel/microcode/src/lib.rs',
   '    if found == Revision::DISABLED {\n        return Err(Unloaded::Disabled);\n    }\n', ''),
 'h03-hygon-reads-as-amd': ('kernel/microcode/src/lib.rs',
   '            Vendor::Amd => Ok(Self::Amd),\n            Vendor::Hygon | Vendor::Centaur',
   '            Vendor::Amd | Vendor::Hygon => Ok(Self::Amd),\n            Vendor::Centaur'),
 'h04-amd-equal-revision-is-current': ('kernel/microcode/src/amd.rs',
   'Some(patch) if patch.revision >= found =>', 'Some(patch) if patch.revision > found =>'),
 'h05-amd-match-ignores-stepping': ('kernel/microcode/src/amd.rs',
   'if named(patch.revision.0) == signature.0 &&', 'if named(patch.revision.0) | 0xf == signature.0 | 0xf &&'),
 'h06-amd-chipset-patch-accepted': ('kernel/microcode/src/amd.rs',
   '    if north != 0 || south != 0 {\n        return Err(Refusal::Chipset { north, south });\n    }\n', ''),
 'h07-amd-minimum-revision-accepted': ('kernel/microcode/src/amd.rs',
   '    if minimum != 0 {\n        return Err(Refusal::MinimumRevision(minimum));\n    }\n', ''),
 'h08-amd-any-section-is-a-patch': ('kernel/microcode/src/amd.rs',
   '    if kind != PATCH {\n        return Err(Refusal::SectionType(kind));\n    }\n', ''),
 'h09-amd-magic-unread': ('kernel/microcode/src/amd.rs',
   '    if magic != MAGIC {\n        return Err(at_header(Refusal::Magic(magic)));\n    }\n', ''),
 'h10-amd-table-type-unread': ('kernel/microcode/src/amd.rs',
   '    if table != EQUIVALENCE_TABLE {\n        return Err(at_header(Refusal::TableType(table)));\n    }\n', ''),
 'h11-amd-first-match-kept': ('kernel/microcode/src/amd.rs',
   'newest.is_none_or(|n| patch.revision > n.revision)', 'newest.is_none()'),
 'h12-amd-every-family-flushes-or-none': ('kernel/microcode/src/amd.rs',
   'family(self.revision.0) == 0x17', 'family(self.revision.0) >= 0x17'),
 'h13-intel-equal-revision-reloads': ('kernel/microcode/src/intel.rs',
   'Some(update) if update.revision > cpu.revision =>', 'Some(update) if update.revision >= cpu.revision =>'),
 'h15-firmware-licence-passes-as-code': ('build/licence.rs',
   '                Scope::Code => false,\n', '                Scope::Code => FIRMWARE_ONLY.contains(&id),\n'),
 'h16-judge-takes-any-amd-bsp': ('tests/toyos.rs',
   'Linux::Loaded { firmware, .. } if line.cpu == 0 && line.found != firmware =>', 'Linux::Loaded { firmware, .. } if false && line.cpu == 0 && line.found != firmware =>'),
 'h17-judge-takes-a-t14-below-linux': ('tests/toyos.rs',
   '!= (Some(7), linux, "current", linux))', '!= (Some(7), line.found, "current", line.found))'),
}
name = sys.argv[1]
if name == 'h14-renoir-patch-byte-flipped':
    p = W / 'kernel/microcode/amd-ucode/microcode_amd_fam17h.bin'
    b = bytearray(p.read_bytes()); b[9772 + 1000] ^= 1; p.write_bytes(b)
    sys.exit(0)
path, old, new = M[name]
p = W / path
s = p.read_text()
assert s.count(old) == 1, (name, s.count(old))
p.write_text(s.replace(old, new))
