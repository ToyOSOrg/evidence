# Each mutant: one edit to one file, written as a patch by `git diff`, and
# the file put back. Argument: the worktree and the output directory.
import subprocess, sys
tree, out = sys.argv[1], sys.argv[2]
M = [
 ("s1-checksum", "system/acpiserver/aml/src/exec.rs",
  "if bytes.iter().fold(0u8, |sum, &b| sum.wrapping_add(b)) != 0 {", "if false {"),
 ("s1-method-exit-unwinds-static", "system/acpiserver/aml/src/exec.rs",
  "let made = self.ns.mark(Arena::Method);", "let made = self.ns.mark(Arena::Static);"),
 ("s1-memory-type", "system/acpiserver/src/host.rs",
  "memory_type != UNLISTED && matches!(memory_type, 0 | 5 | 6 | 8 | 10..=13 | 15..)", "memory_type == memory_type"),
 ("s1-commit-sends-the-claim", "system/acpiserver/src/osc.rs",
  "let [commit, granted] = evaluate(aml, path, &claim.uuid, 0, offered)?;", "let [commit, granted] = evaluate(aml, path, &claim.uuid, 0, claim.capabilities)?;"),
 ("s2-mmio-refused", "lib/userbound/src/firmware.rs",
  "None | Some(EFI_MMIO) if !write => {}", "None if !write => {}"),
 ("s2-mmio-cached-passes", "lib/userbound/src/firmware.rs",
  "let register = matches!(ty, None | Some(EFI_MMIO));", "let register = matches!(ty, None);"),
 ("s2-smi-cmd-denied", "system/acpiserver/src/host.rs",
  "Address::Io(port) if !FORWARDED.contains(&(port, width)) && (Some(port), width) != (self.smi_cmd, toyos_aml::Access::Byte) => {",
  "Address::Io(port) if !FORWARDED.contains(&(port, width)) => {"),
 ("s2-memory-write-denied", "system/acpiserver/src/host.rs",
  "Address::Memory(address) => return self.written_through(Space::SystemMemory, address, width, value, at),",
  "Address::Memory(_) => \"a write to SystemMemory\".into(),"),
 ("s3-functional-not-examined", "system/acpiserver/src/init.rs",
  "if status & (PRESENT | FUNCTIONAL) == 0 {", "if status & PRESENT == 0 {"),
 ("s3-reg-before-ini", "system/acpiserver/src/init.rs",
  "    announce_config(aml, names, 0, census);\n    if names.paths.contains(\"\\\\_SB_._INI\") {",
  "    announce_config(aml, names, 0, census);\n    announce(aml, names, EMBEDDED_CONTROL, 0, census);\n    if names.paths.contains(\"\\\\_SB_._INI\") {"),
 ("s3-bridge-by-hid-dropped", "system/acpiserver/aml/src/field.rs",
  "if self.ns.child(host, bbn).is_some() || self.host_bridge(host)? {", "if self.ns.child(host, bbn).is_some() || (self.host_bridge(host)? \&\& false) {"),
 ("s3-glk-ignored", "system/acpiserver/src/devices.rs",
  "            ec.glk = true;\n", "            ec.glk = false;\n"),
 ("s4-store-answers-its-source", "system/acpiserver/aml/src/exec.rs",
  "return Ok(self.write_field_answering(&x, v.clone())?.unwrap_or(v));", "self.write_field_answering(&x, v.clone())?;\n            return Ok(v);"),
 ("s4-load-table-parameter-unstored", "system/acpiserver/aml/src/exec.rs",
  "            self.store(f, Target::Node(id), data)?;\n", "            let _ = (id, data);\n"),
 ("s5-refused-gpe-still-served", "system/acpiserver/src/main.rs",
  "                self.served.gpes.remove(&n);\n", ""),
 ("s5-edge-status-uncleared", "system/acpiserver/src/main.rs",
  "        if trigger == sci::Trigger::Edge {\n            self.ports.out8(status, bit);\n        }\n", ""),
 ("s5-sleep-takes-no-press", "system/acpiserver/src/sci.rs",
  "            fixed.pm1_clear(PWRBTN);\n            latched.presses += 1;\n", ""),
 ("s6-mutexes-unbounded", "system/acpiserver/aml/src/exec.rs",
  "        if self.held.len() >= crate::MAX_HELD {", "        if false {"),
]
for name, path, old, new in M:
    p = f"{tree}/{path}"
    s = open(p).read()
    assert s.count(old) == 1, (name, s.count(old))
    open(p, 'w').write(s.replace(old, new))
    diff = subprocess.run(['git', '-C', tree, 'diff', '--', path], capture_output=True, text=True, check=True).stdout
    open(f"{out}/{name}.patch", 'w').write(diff)
    subprocess.run(['git', '-C', tree, 'checkout', '--', path], check=True)
    print(name, len(diff.splitlines()), "lines")
