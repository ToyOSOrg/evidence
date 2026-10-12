# Writes one metal arm's mutation into the worktree, as argv[1] names it:
# each (file, old, new) of its edits, every `old` there exactly once.
import sys, pathlib
W = pathlib.Path('/Users/jan/Dev/jan/toyos-microcode')
M = {
 'm1-t14-reseal': [('tests/toyos.rs',
   '''        metal::Metal { arms: METALCASE, judge: |b| microcode_on_metal(b[0].kernel().text(), b[0].cpus()?) },''',
   '''        metal::Metal {
            arms: &[metal::once("metalcase-reseal", "tests/images/metalcase.toml", &["microcode-reseal"], &[])],
            judge: |b| microcode_on_metal(b[0].kernel().text(), b[0].cpus()?),
        },''')],
 'm2-amd-trigger-removed': [
   ('kernel/src/arch/x86_64/microcode.rs', '''            unsafe { trigger(AMD_TRIGGER, bytes.start) };\n''', ''),
   ('kernel/src/arch/x86_64/microcode.rs', '''/// AMD's patch loader, which no AMD document in hand describes.\nconst AMD_TRIGGER: u32 = 0xc001_0020;\n''', '')],
 'm4-amd-no-invlpg': [('kernel/src/arch/x86_64/microcode.rs',
   '''            if patch.leaves_its_mapping_uncached() {
                cpu::invlpg(bytes.start as u64);
                cpu::invlpg(bytes.end as u64 - 1);
            }
''', '')],
}
for path, old, new in M[sys.argv[1]]:
    p = W / path
    s = p.read_text()
    assert s.count(old) == 1, (sys.argv[1], path)
    p.write_text(s.replace(old, new))
