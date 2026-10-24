# Scratch: writes each mutant as a unified diff against the worktree's lib/crypto at HEAD.
import sys, os, subprocess, difflib
W = '<home>/Dev/jan/toyos-p256'
out = sys.argv[1]
M = [
 ('m1-mul-reduction', 'src/arch/x86_64/p256.rs', '"adc {E}, rdx",', '"adc {E}, {hi}",'),
 ('m2-square-final', 'src/arch/x86_64/p256.rs', '            "cmovnc {T7}, rdx",\n', ''),
 ('m3-add-cmov', 'src/arch/x86_64/p256.rs', '"cmovnc {r3}, {b3}",', '"cmovc {r3}, {b3}",'),
 ('m4-double-cmov', 'src/arch/x86_64/p256.rs', '"cmovnc {r3}, {t3}",', '"cmovc {r3}, {t3}",'),
 ('m5-sub-mask', 'src/arch/x86_64/p256.rs', '"shr {b1}, 32",', '"shr {b1}, 31",'),
 ('m6-never-kernels', 'src/arch/x86_64.rs', '    if features().bmi2_adx() {\n        // SAFETY: CPUID admitted BMI2 and ADX.\n        return unsafe { p256_kernels', '    if false && features().bmi2_adx() {\n        // SAFETY: CPUID admitted BMI2 and ADX.\n        return unsafe { p256_kernels'),
 ('m7-odd-multiple', 'src/nist.rs', 'table[j + 1] = table[j].add_public(self);', 'table[j + 1] = table[j].add_public(&table[1]);'),
 ('m8-zeta-step', 'src/montgomery/divsteps.rs', 'true => (eta ^ swap as i64).wrapping_sub(1),', 'true => (eta ^ swap as i64).wrapping_add(!swap as i64),'),
 ('m9-nine-batches', 'src/montgomery/divsteps.rs', 'for _ in 0..10 {', 'for _ in 0..9 {'),
 ('m10-seven-bits', 'src/montgomery/divsteps.rs', '.min(left as i64).min(6)', '.min(left as i64).min(7)'),
 ('m11-public-scale', 'src/montgomery.rs', 'invert_public::<M, N>(x, &M::ONE)', 'invert_public::<M, N>(x, &M::R2)'),
 ('m12-no-r-plus-n', 'src/nist.rs', '(false, Some(r_field)) => self.x.eq(&r_field.mul(&z2)) == 1,', '(false, Some(_)) => false,'),
]
for name, path, old, new in M:
    text = subprocess.run(['git', '-C', W, 'show', 'HEAD:lib/crypto/' + path], capture_output=True, text=True, check=True).stdout
    assert text.count(old) >= 1, name
    mutated = text.replace(old, new, 1)
    diff = difflib.unified_diff(text.splitlines(True), mutated.splitlines(True), 'a/lib/crypto/' + path, 'b/lib/crypto/' + path)
    open(os.path.join(out, name + '.patch'), 'w').writelines(diff)
    print(name)
