# Each mutation: (name, file, old, new, cargo test args). Applied as a checked
# replacement, built, its tests run, and the file restored from git, all in one run.
import subprocess, sys, pathlib
WT = pathlib.Path("$WORKTREE")
OUT = pathlib.Path(sys.argv[1])
P = "lib/userbound/src/firmware.rs"
H = "system/acpiserver/src/host.rs"
UB = ["-p", "toyos-userbound", "--test", "firmware"]
AS = ["-p", "acpiserver"]
MUTATIONS = [
    ("M1-kernelregister-arm-deleted", P,
     "        if write && self.host_bridge.keeps(at, last) {\n            return No(Refused::KernelRegister);\n        }\n", "", UB),
    ("M2-any-vendor-covered", P,
     "        vendor == 0x8086 && MCH_631122.contains(&device)", "        MCH_631122.contains(&device)", UB),
    ("M3-mchbaren-ignored", P,
     "(Self::covered(self.vendor, self.device) && self.at_48h & MCHBAREN != 0)", "(Self::covered(self.vendor, self.device))", UB),
    ("M4-header-fence-deleted", P,
     "if self.offset < HEADER_END || enumerated", "if enumerated", UB),
    ("M5-class-08-fence-deleted", P,
     "found.held || found.class == 0x08 && matches!(found.subclass, 0x00 | 0x06)", "found.held", UB),
    ("M6-held-fence-deleted", P,
     "found.held || found.class == 0x08", "found.class == 0x08", UB),
    ("M7-host-bridge-address-map-deleted", P,
     "HostBridge::covered(vendor, device).then_some((0x40, 0xC0))", "None::<(u16, u16)>", UB),
    ("M8-espi-decode-deleted", P,
     ".then_some((0x80, 0x84));", ".then_some((0x80, 0x80));", UB),
    ("M9-tco-placing-deleted", P,
     "host_bridge.into_iter().chain(espi).chain(tco)", "host_bridge.into_iter().chain(espi).chain(tco.take(0))", UB),
    ("M10-unlisted-write-refused-again", P,
     "            Some(EFI_RESERVED | EFI_ACPI_NVS | EFI_ACPI_RECLAIM | EFI_RUNTIME_DATA | EFI_MMIO) | None => {}\n            Some(_) => return No(Refused::MemoryType),",
     "            Some(EFI_RESERVED | EFI_ACPI_NVS | EFI_ACPI_RECLAIM | EFI_RUNTIME_DATA) => {}\n            None | Some(EFI_MMIO) if !write => {}\n            Some(_) | None => return No(Refused::MemoryType),", UB),
    ("M11-every-refusal-kept", H,
     "Ok(Answer { made: Err(Refused::KernelRegister), .. }) => {", "Ok(Answer { made: Err(_), .. }) => {", AS),
    ("M12-kept-write-denied", H,
     "                    println!(\"{OWN}that was {width:?} {value:#x} to {at:x?}\");\n                }\n                Ok(())\n            }\n            Ok(Answer { made: Err(refused), memory_type }) => {",
     "                    println!(\"{OWN}that was {width:?} {value:#x} to {at:x?}\");\n                }\n                Err(Denied(String::new()))\n            }\n            Ok(Answer { made: Err(refused), memory_type }) => {", AS),
]
results = []
for name, rel, old, new, args in MUTATIONS:
    path = WT / rel
    text = path.read_text()
    assert text.count(old) == 1, f"{name}: the mutation's anchor is not unique in {rel}"
    path.write_text(text.replace(old, new))
    try:
        log = OUT / f"{name}.log"
        with open(log, "w") as f:
            r = subprocess.run(["cargo", "test", *args], cwd=WT, stdout=f, stderr=subprocess.STDOUT)
        built = "error[" not in log.read_text() and "could not compile" not in log.read_text()
        results.append((name, r.returncode, built))
    finally:
        subprocess.run(["git", "checkout", "--", rel], cwd=WT, check=True)
    print(f"{name}: exit {r.returncode}, built {built}", flush=True)
assert subprocess.run(["git", "diff", "--quiet"], cwd=WT).returncode == 0, "a mutation was left in the tree"
