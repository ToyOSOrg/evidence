//! PR #875's check outside the tree: the ACPI server's own modules, included
//! by path from the worktree, driven through their `Kernel` seam on one
//! bench's dump, in the order the server's start runs them.
//!
//! `aml-check <dump> <out> <intel|amd>` writes `<out>/summary.txt`, counts
//! and decoded values only, and `<out>/local.txt`, which names paths and
//! stays on this host; the server's own lines go to stdout, which the caller
//! keeps local too.
//!
//! The stand-in kernel answers memory the dump holds (the tables, the DSDT at
//! the address the FADT names and the rest at made-up ones; the ACPI NVS
//! bytes Linux read, which the run's own writes update; and each run-time
//! block Linux loaded, at the address the firmware's package names it at)
//! and answers every other read the real kernel would make with 0, counted.
//! A function's configuration space answers a PCI-to-PCI bridge's Header
//! Type at 0x0E and a secondary bus one above its own at 0x19, as M1b did,
//! and 0 elsewhere. The controller is a minimal one: 256 bytes of zeros, no
//! query waiting. A byte to SMI_CMD is counted and answered by nothing.

#[path = "<worktree>/system/acpiserver/src/aml.rs"]
mod aml;
#[path = "<worktree>/system/acpiserver/src/devices.rs"]
mod devices;
#[path = "<worktree>/system/acpiserver/src/ec.rs"]
mod ec;
#[path = "<worktree>/system/acpiserver/src/host.rs"]
mod host;
#[path = "<worktree>/system/acpiserver/src/init.rs"]
mod init;
#[path = "<worktree>/system/acpiserver/src/ledger.rs"]
mod ledger;
#[path = "<worktree>/system/acpiserver/src/osc.rs"]
mod osc;
#[path = "<worktree>/system/acpiserver/src/sci.rs"]
mod sci;
#[path = "<worktree>/system/acpiserver/src/tables.rs"]
mod tables;

use std::cell::RefCell;
use std::collections::{BTreeMap, BTreeSet};
use std::fmt::Write as _;
use std::fs;
use std::path::Path;
use std::time::Instant;

use toyos_abi::acpi::{Access, Block, Refused, Space, Width, UNLISTED};
use toyos_aml::{Kind, Value};

use host::{Answer, Kernel, Stopping, Take};
use init::{Census, Names};

/// Where the made-up root of the tables is: far above any machine's memory.
const SYN: u64 = 0x0F00_0000_0000;
const RSDP: u64 = SYN;

/// One range of Linux's `/sys/firmware/memmap`, as the UEFI type it reports.
struct Range {
    start: u64,
    end: u64,
    uefi: u8,
}

fn memmap(dir: &Path) -> Vec<Range> {
    let text = fs::read_to_string(dir.join("memmap.txt")).expect("memmap.txt");
    let hex = |s: &str| u64::from_str_radix(s.trim_start_matches("0x"), 16).expect("hex");
    text.lines()
        .filter(|l| !l.trim().is_empty())
        .map(|l| {
            let mut it = l.splitn(3, ' ');
            let (start, end) = (hex(it.next().unwrap()), hex(it.next().unwrap()));
            let uefi = match it.next().unwrap().trim() {
                "System RAM" => 7,
                "ACPI Non-volatile Storage" => 10,
                "ACPI Tables" => 9,
                "Unusable memory" => 8,
                "Persistent Memory" | "Persistent Memory (legacy)" => 14,
                _ => 0,
            };
            Range { start, end: end + 1, uefi }
        })
        .collect()
}

struct Placed {
    at: u64,
    uefi: u8,
    bytes: Vec<u8>,
    /// What it is, for the count of what was read: `table`, `nvs`, or a
    /// run-time block's OEM Table ID.
    what: String,
}

/// The controller, minimal: its space, the command and the bytes after it,
/// and the byte it answers.
#[derive(Default)]
struct EcSim {
    space: Vec<u8>,
    taken: Vec<u8>,
    output: Option<u8>,
}

impl EcSim {
    fn status(&self) -> u8 {
        u8::from(self.output.is_some())
    }

    fn command(&mut self, byte: u8) {
        self.taken = vec![byte];
        if byte == 0x84 {
            self.output = Some(0);
            self.taken.clear();
        }
    }

    fn data(&mut self, byte: u8) {
        self.taken.push(byte);
        match self.taken[..] {
            [0x80, address] => {
                self.output = Some(self.space[usize::from(address)]);
                self.taken.clear();
            }
            [0x81, address, value] => {
                self.space[usize::from(address)] = value;
                self.taken.clear();
            }
            _ => {}
        }
    }
}

struct Dump {
    map: Vec<Range>,
    placed: Vec<Placed>,
    written: RefCell<BTreeMap<u64, u8>>,
    ec: (u16, u16),
    sim: RefCell<EcSim>,
    smi_cmd: u16,
    /// What was answered that the dump does not hold, by kind.
    unrecorded: RefCell<BTreeMap<String, u64>>,
    /// The bytes of each placed range a read reached, by what it is.
    reached: RefCell<BTreeMap<String, BTreeSet<u64>>>,
    /// The kernel's port declarations, `(first, last, answer)`.
    declared: Vec<(u16, u16, toyos_userbound::Mediated)>,
    /// Each port access, by port, width, direction and the kernel's verdict.
    ports: RefCell<BTreeMap<String, u64>>,
}

impl Dump {
    fn count(&self, what: String) {
        *self.unrecorded.borrow_mut().entry(what).or_insert(0) += 1;
    }

    fn uefi(&self, at: u64) -> u8 {
        self.map.iter().find(|r| (r.start..r.end).contains(&at)).map_or(UNLISTED, |r| r.uefi)
    }

    /// What the kernel declared of `port`, as it boots on the bench: its
    /// fixed runs, the FADT's SMI_CMD, reset register and PM1a control
    /// block, and the i8042. The TCO block, whose base the dump does not
    /// hold, is not among them.
    fn standing(&self, port: u16) -> toyos_userbound::firmware::Standing {
        use toyos_userbound::firmware::Standing;
        self.declared.iter().find(|(first, last, _)| (*first..=*last).contains(&port)).map_or(Standing::Free, |&(.., m)| Standing::Declared(m))
    }
}

impl Kernel for Dump {
    fn access(&self, access: Access) -> Result<Answer, Stopping> {
        let width = Width::from_raw(access.width).expect("a width").bytes();
        let (at, write) = (access.address, access.write != 0);
        Ok(match Space::from_raw(access.space).expect("a space") {
            Space::SystemMemory => {
                let held = self.placed.iter().find(|p| at >= p.at && at + width <= p.at + p.bytes.len() as u64);
                match held {
                    Some(p) if write && matches!(p.uefi, 6 | 9) => Answer { made: Err(Refused::TableWrite), memory_type: p.uefi },
                    Some(p) if write => {
                        let mut written = self.written.borrow_mut();
                        for i in 0..width {
                            written.insert(at + i, (access.value >> (8 * i)) as u8);
                        }
                        Answer { made: Ok(0), memory_type: p.uefi }
                    }
                    Some(p) => {
                        let written = self.written.borrow();
                        let value = (0..width).rev().fold(0u64, |v, i| {
                            let a = at + i;
                            v << 8 | u64::from(written.get(&a).copied().unwrap_or(p.bytes[(a - p.at) as usize]))
                        });
                        self.reached.borrow_mut().entry(p.what.clone()).or_default().extend(at..at + width);
                        Answer { made: Ok(value), memory_type: p.uefi }
                    }
                    None => {
                        let uefi = self.uefi(at);
                        // RAM a read the dump cannot answer points at is read as 0, as M1 did.
                        let refused = match (uefi, write) {
                            (1..=4 | 7, true) => Some(Refused::UsableMemory),
                            (6 | 9, true) => Some(Refused::TableWrite),
                            (UNLISTED, true) => Some(Refused::MemoryType),
                            (0 | 1..=4 | 6 | 7 | 9 | 10 | 11 | UNLISTED, _) => None,
                            _ => Some(Refused::MemoryType),
                        };
                        let name = if uefi == UNLISTED { "unlisted".to_string() } else { format!("type {uefi}") };
                        match refused {
                            Some(refused) => {
                                self.count(format!("memory {} in {name} refused {refused:?}", if write { "write" } else { "read" }));
                                Answer { made: Err(refused), memory_type: uefi }
                            }
                            None if write => {
                                self.count(format!("memory write in {name}, kept"));
                                let mut written = self.written.borrow_mut();
                                for i in 0..width {
                                    written.insert(at + i, (access.value >> (8 * i)) as u8);
                                }
                                Answer { made: Ok(0), memory_type: uefi }
                            }
                            None => {
                                self.count(format!("memory read in {name} answered from writes or 0"));
                                let written = self.written.borrow();
                                let value = (0..width).rev().fold(0u64, |v, i| v << 8 | u64::from(written.get(&(at + i)).copied().unwrap_or(0)));
                                Answer { made: Ok(value), memory_type: uefi }
                            }
                        }
                    }
                }
            }
            Space::SystemIo => {
                let port = at as u16;
                let width_of = Width::from_raw(access.width).expect("a width");
                let verdict = toyos_userbound::firmware::port(|p| self.standing(p), port, width_of, write.then_some(access.value));
                let said = match verdict {
                    toyos_userbound::firmware::PortVerdict::Through(_) => "made".to_string(),
                    toyos_userbound::firmware::PortVerdict::FirmwareCall(_) => "a firmware call".to_string(),
                    toyos_userbound::firmware::PortVerdict::Refused(r) => format!("refused {r:?}"),
                };
                *self.ports.borrow_mut().entry(format!("{port:#06x} {width_of:?} {} {said}", if write { "write" } else { "read" })).or_insert(0) += 1;
                if let toyos_userbound::firmware::PortVerdict::Refused(refused) = verdict {
                    self.count(format!("port {} the kernel refuses {refused:?}", if write { "write" } else { "read" }));
                    return Ok(Answer { made: Err(refused), memory_type: UNLISTED });
                }
                let mut sim = self.sim.borrow_mut();
                let value = if port == self.ec.0 {
                    if write {
                        sim.command(access.value as u8);
                        0
                    } else {
                        u64::from(sim.status())
                    }
                } else if port == self.ec.1 {
                    if write {
                        sim.data(access.value as u8);
                        0
                    } else {
                        self.count("a byte of the controller's space, which the dump does not hold, answered 0".into());
                        u64::from(sim.output.take().unwrap_or(0))
                    }
                } else if write && port == self.smi_cmd {
                    self.count("a firmware call through SMI_CMD".into());
                    0
                } else {
                    self.count(format!("port {} answered 0 or kept", if write { "write" } else { "read" }));
                    0
                };
                Answer { made: Ok(value), memory_type: UNLISTED }
            }
            Space::PciConfig => {
                let (bus, offset) = ((at >> 24) & 0xFF, at & 0xFFF);
                let value = match offset {
                    0x0E => 0x01,
                    0x19 => bus + 1,
                    _ => 0,
                };
                self.count(format!(
                    "configuration read at {}",
                    if matches!(offset, 0x0E | 0x19) { "a bridge's register, answered as one" } else { "another offset, answered 0" }
                ));
                Answer { made: Ok(value), memory_type: UNLISTED }
            }
        })
    }

    fn lock_take(&self) -> Result<Take, Stopping> {
        Ok(Take::Taken)
    }

    fn lock_release(&self) -> Result<(), Stopping> {
        Ok(())
    }

    fn released(&self, _: Instant) -> bool {
        true
    }

    fn s5(&self, slp_typ_a: u64) -> Result<bool, Stopping> {
        Ok(slp_typ_a <= 7)
    }

    /// A Sleep's wait: no SCI latches in a dump, and no time passes.
    fn sleep(&self, _: Instant, _: Option<u16>) -> sci::Latched {
        sci::Latched::default()
    }
}

/// A table's bytes sealed again after an edit.
fn reseal(t: &mut [u8]) {
    t[9] = 0;
    let sum = t.iter().fold(0u8, |s, &b| s.wrapping_add(b));
    t[9] = 0u8.wrapping_sub(sum);
}

fn u32_at(b: &[u8], at: usize) -> u32 {
    u32::from_le_bytes(b[at..at + 4].try_into().unwrap())
}

fn u64_at(b: &[u8], at: usize) -> u64 {
    u64::from_le_bytes(b[at..at + 8].try_into().unwrap())
}

/// The bench's machine: its tables under a made-up RSDP and XSDT, the DSDT
/// where the FADT names it, the NVS Linux read, and `blocks`, each a
/// run-time block at the address its source names.
fn machine(dir: &Path, blocks: &[(u64, String, Vec<u8>)]) -> (Dump, Block, bool) {
    let map = memmap(dir);
    let mut placed = Vec::new();
    let read = |n: &str| fs::read(dir.join("tables").join(n)).unwrap_or_else(|_| panic!("tables/{n}"));
    let fadt = read("FACP");
    let dsdt_at = if fadt.len() >= 148 && fadt[8] >= 2 && u64_at(&fadt, 140) != 0 { u64_at(&fadt, 140) } else { u64::from(u32_at(&fadt, 40)) };
    let dsdt = read("DSDT");
    let uefi = map.iter().find(|r| (r.start..r.end).contains(&dsdt_at)).map_or(UNLISTED, |r| r.uefi);
    placed.push(Placed { at: dsdt_at, uefi, bytes: dsdt, what: "table".into() });
    let mut others: Vec<(u32, String)> = fs::read_dir(dir.join("tables"))
        .unwrap()
        .map(|e| e.unwrap().file_name().into_string().unwrap())
        .filter(|n| n != "DSDT")
        .map(|n| (n.strip_prefix("SSDT").and_then(|k| k.parse().ok()).unwrap_or(0), n))
        .collect();
    others.sort();
    let mut entries = Vec::new();
    for (k, (_, name)) in others.iter().enumerate() {
        let at = SYN + 0x1_0000 * (k as u64 + 2);
        placed.push(Placed { at, uefi: 9, bytes: read(name), what: "table".into() });
        entries.push(at);
    }
    let mut xsdt = vec![0u8; 36];
    xsdt[..4].copy_from_slice(b"XSDT");
    xsdt[8] = 1;
    for at in &entries {
        xsdt.extend_from_slice(&at.to_le_bytes());
    }
    let len = xsdt.len() as u32;
    xsdt[4..8].copy_from_slice(&len.to_le_bytes());
    reseal(&mut xsdt);
    let mut rsdp = vec![0u8; 36];
    rsdp[..8].copy_from_slice(b"RSD PTR ");
    rsdp[15] = 2;
    rsdp[20..24].copy_from_slice(&36u32.to_le_bytes());
    rsdp[24..32].copy_from_slice(&(SYN + 0x1_0000).to_le_bytes());
    rsdp[8] = 0u8.wrapping_sub(rsdp[..20].iter().fold(0u8, |s, &b| s.wrapping_add(b)));
    rsdp[32] = 0u8.wrapping_sub(rsdp.iter().fold(0u8, |s, &b| s.wrapping_add(b)));
    placed.push(Placed { at: RSDP, uefi: 9, bytes: rsdp, what: "table".into() });
    placed.push(Placed { at: SYN + 0x1_0000, uefi: 9, bytes: xsdt, what: "table".into() });
    for e in fs::read_dir(dir.join("nvs")).expect("nvs/") {
        let p = e.unwrap().path();
        if p.extension().and_then(|x| x.to_str()) != Some("bin") {
            continue;
        }
        let bytes = fs::read(&p).unwrap();
        if bytes.is_empty() {
            continue;
        }
        let at = u64::from_str_radix(p.file_stem().unwrap().to_str().unwrap().trim_start_matches("0x"), 16).unwrap();
        placed.push(Placed { at, uefi: 10, bytes, what: "nvs".into() });
    }
    for (at, id, bytes) in blocks {
        let uefi = map.iter().find(|r| (r.start..r.end).contains(at)).map_or(UNLISTED, |r| r.uefi);
        placed.push(Placed { at: *at, uefi, bytes: bytes.clone(), what: id.clone() });
    }
    let smi_cmd = u32_at(&fadt, 48) as u16;
    let gpe0 = Block { port: u32_at(&fadt, 80) as u16, len: u16::from(fadt[92]) };
    let control_method = u32_at(&fadt, 112) & (1 << 4) != 0;
    let ec = match fs::read(dir.join("tables/ECDT")) {
        Ok(e) => (u64_at(&e, 40) as u16, u64_at(&e, 52) as u16),
        Err(_) => (0x66, 0x62),
    };
    let mut dump = Dump {
        map,
        placed,
        written: RefCell::new(BTreeMap::new()),
        ec,
        sim: RefCell::new(EcSim { space: vec![0; 256], ..Default::default() }),
        smi_cmd,
        unrecorded: RefCell::new(BTreeMap::new()),
        reached: RefCell::new(BTreeMap::new()),
        declared: Vec::new(),
        ports: RefCell::new(BTreeMap::new()),
    };
    dump.declared = declarations(&dump);
    dump.unrecorded.borrow_mut().clear();
    dump.reached.borrow_mut().clear();
    (dump, gpe0, control_method)
}

/// An OEM Table ID or a package's label of one, NULs and spaces trimmed and
/// in one case.
fn label(bytes: &[u8]) -> String {
    String::from_utf8_lossy(bytes).trim_matches(|c| c == '\0' || c == ' ').to_ascii_uppercase()
}

/// Linux's run-time blocks, by OEM Table ID: their bytes.
fn dynamic(dir: &Path) -> BTreeMap<String, Vec<u8>> {
    let Ok(entries) = fs::read_dir(dir.join("dynamic")) else { return BTreeMap::new() };
    entries.map(|e| fs::read(e.unwrap().path()).unwrap()).map(|b| (label(&b[16..24]), b)).collect()
}

/// How the processors' `_OSC` are asked.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
enum Claims {
    /// ToyOS's own declarations, as the server runs.
    ToyOs,
    /// These platform and processor capabilities, queried and then committed with what the query
    /// offered: ToyOS's rule with every bit claimed.
    Queried(u32, u32),
    /// These capabilities, committed whole with no query first.
    Committed(u32, u32),
}

struct Booted<'k> {
    aml: Option<aml::Aml<'k, Dump>>,
    loaded: aml::Loaded,
    census: Census,
    negotiated: osc::Negotiated,
    names: Option<Names>,
    controller: Option<String>,
}

fn settle(aml: &mut aml::Aml<'_, Dump>, mut since: u32, mut names: Names, census: &mut Census) -> Names {
    while aml.interpreter.defined() > since {
        names = Names::read(&aml.interpreter).expect("the walk");
        let added = since;
        since = aml.interpreter.defined();
        init::loaded(aml, &names, added, census);
    }
    names
}

fn is_processor(aml: &mut aml::Aml<'_, Dump>, names: &Names, path: &str) -> bool {
    let hid = format!("{path}._HID");
    names.paths.contains(&hid) && aml.interpreter.evaluate(&mut aml.host, &hid, &[]).ok().as_ref().and_then(devices::id).as_deref() == Some("ACPI0007")
}

/// One `_OSC` evaluated with the two DWORDs, its answer.
fn commit_whole(aml: &mut aml::Aml<'_, Dump>, path: &str, uuid: &[u8; 16], capabilities: u32) -> Result<osc::Answered, String> {
    let caps = [0u32.to_le_bytes(), capabilities.to_le_bytes()].concat();
    let args = [Value::Buffer(uuid.to_vec()), Value::Integer(1), Value::Integer(2), Value::Buffer(caps)];
    match aml.interpreter.evaluate(&mut aml.host, path, &args) {
        Ok(Value::Buffer(b)) if b.len() == 8 => {
            let d = |at: usize| u32::from_le_bytes(b[at..at + 4].try_into().unwrap());
            Ok(osc::Answered { query: 0, offered: capabilities, commit: Some((d(0), d(4))) })
        }
        other => Err(format!("{other:?}")),
    }
}

fn boot(dump: &Dump, gpe0: Block, control_method: bool, intel: bool, claims: Claims) -> Booted<'_> {
    let (loaded, kept) = aml::load(dump, RSDP);
    let mut booted = Booted { aml: None, loaded, census: Census::default(), negotiated: osc::Negotiated::default(), names: None, controller: None };
    let Some(mut aml) = kept else { return booted };
    let names = Names::read(&aml.interpreter).expect("the walk");
    let before = aml.interpreter.defined();
    init::initialise(&mut aml, &names, &mut booted.census);
    let names = settle(&mut aml, before, names, &mut booted.census);
    let found = devices::find(&mut aml.interpreter, &mut aml.host, &names, gpe0, control_method);
    aml.host.ec.take();
    if let Some(ec) = found.ec {
        booted.controller = Some(ec.path.clone());
        let _ = devices::attach(&mut aml, ec, &names, &mut booted.census);
    }
    let before = aml.interpreter.defined();
    booted.negotiated = match claims {
        Claims::ToyOs => osc::negotiate_all(&mut aml, &names, intel),
        every => {
            let mut n = osc::Negotiated::default();
            let (Claims::Queried(pc, cc) | Claims::Committed(pc, cc)) = every else { unreachable!() };
            let platform = osc::Claim { uuid: osc::PLATFORM.uuid, capabilities: pc };
            let processor = osc::Claim { uuid: osc::PROCESSOR.uuid, capabilities: cc };
            if names.paths.contains("\\_SB_._OSC") {
                n.platform = Some(match every {
                    Claims::Queried(..) => osc::negotiate(&mut aml, "\\_SB_._OSC", &platform),
                    _ => commit_whole(&mut aml, "\\_SB_._OSC", &platform.uuid, pc),
                });
            }
            let processors: Vec<String> = names
                .objects
                .iter()
                .filter(|o| o.kind == Kind::Processor || o.kind == Kind::Device)
                .filter(|o| names.paths.contains(&format!("{}._OSC", o.path)))
                .map(|o| (o.path.clone(), o.kind))
                .collect::<Vec<_>>()
                .into_iter()
                .filter(|(p, k)| *k == Kind::Processor || is_processor(&mut aml, &names, p))
                .map(|(p, _)| p)
                .collect();
            for p in processors {
                let path = format!("{p}._OSC");
                let answered = match every {
                    Claims::Queried(..) => osc::negotiate(&mut aml, &path, &processor),
                    _ => commit_whole(&mut aml, &path, &processor.uuid, cc),
                };
                n.processors.push((p, answered));
            }
            n
        }
    };
    let names = settle(&mut aml, before, names, &mut booted.census);
    booted.names = Some(names);
    booted.aml = Some(aml);
    booted
}

/// The run-time blocks' sources: each package element labelled with one of
/// Linux's blocks' OEM Table IDs, the address and length after it, where the
/// length is that block's.
fn sources(dir: &Path, local: &mut String) -> Vec<(u64, String, Vec<u8>)> {
    let linux = dynamic(dir);
    if linux.is_empty() {
        return Vec::new();
    }
    let (dump, _, _) = machine(dir, &[]);
    let (_, kept) = aml::load(&dump, RSDP);
    let mut aml = kept.expect("the DSDT loads");
    let names = Names::read(&aml.interpreter).expect("the walk");
    let mut out = Vec::new();
    for named in names.objects.iter().filter(|o| o.kind == Kind::Package) {
        let Ok(Value::Package(elements)) = aml.interpreter.evaluate(&mut aml.host, &named.path, &[]) else { continue };
        for window in elements.windows(3) {
            if let [Value::String(l), Value::Integer(at), Value::Integer(len)] = window {
                let l = label(l);
                if let Some(bytes) = linux.get(&l).filter(|b| b.len() as u64 == *len) {
                    let _ = writeln!(local, "source {l} in {} at {at:#x}+{len:#x}", named.path);
                    out.push((*at, l, bytes.clone()));
                }
            }
        }
    }
    out
}

/// A `_CST` package's states (ACPI 6.5 §8.4.1.1): each Register's space and
/// address, by the Generic Register descriptor its buffer holds, its type
/// and its latency.
fn cst(value: &Value) -> Option<Vec<(u8, u64, u64, u64)>> {
    let Value::Package(p) = value else { return None };
    p.iter()
        .skip(1)
        .map(|state| match state {
            Value::Package(s) => match &s[..] {
                [Value::Buffer(gr), Value::Integer(ty), Value::Integer(latency), ..] if gr.len() >= 15 && gr[0] == 0x82 => {
                    Some((gr[3], u64::from_le_bytes(gr[7..15].try_into().ok()?), *ty, *latency))
                }
                _ => None,
            },
            _ => None,
        })
        .collect()
}

/// Linux's states of cpu0 past POLL: each one's register as Linux describes
/// it, and its latency.
fn linux_states(dir: &Path) -> Vec<(String, u64)> {
    let text = fs::read_to_string(dir.join("cpuidle.txt")).unwrap_or_default();
    text.lines()
        .filter(|l| l.starts_with("cpu0/") && !l.contains("name=POLL"))
        .filter_map(|l| {
            let desc = l.split("desc=").nth(1)?.split(" latency=").next()?.to_string();
            let latency = l.split("latency=").nth(1)?.split(' ').next()?.parse().ok()?;
            Some((desc, latency))
        })
        .collect()
}

fn describe(state: &(u8, u64, u64, u64)) -> String {
    match state.0 {
        0x7F => format!("ACPI FFH MWAIT {:#x}", state.1),
        0x01 => format!("ACPI IOPORT {:#x}", state.1),
        space => format!("space {space:#x}"),
    }
}

/// Linux's status of each device, by its path.
fn linux_status(dir: &Path) -> BTreeMap<String, u64> {
    let text = fs::read_to_string(dir.join("acpi-devices.txt")).unwrap_or_default();
    text.lines()
        .filter_map(|l| {
            let path = l.split("path=").nth(1)?.split(' ').next()?.to_string();
            let status = l.split("status=").nth(1)?.split(' ').next()?.parse().ok()?;
            Some((path, status))
        })
        .collect()
}

fn processors_cst(sum: &mut String, local: &mut String, booted: &mut Booted<'_>, dir: &Path, mode: &str) {
    let aml = booted.aml.as_mut().expect("a namespace");
    let names = booted.names.as_ref().expect("names");
    let theirs = linux_states(dir);
    let (mut same, mut other, mut none) = (0, 0, 0);
    let mut shapes = BTreeSet::new();
    for named in names.objects.iter().filter(|o| o.kind == Kind::Processor || o.kind == Kind::Device) {
        let path = format!("{}._CST", named.path);
        if !names.paths.contains(&path) {
            continue;
        }
        match aml.interpreter.evaluate(&mut aml.host, &path, &[]).ok().as_ref().and_then(cst) {
            Some(states) => {
                let ours: Vec<(String, u64)> = states.iter().map(|s| (describe(s), s.3)).collect();
                if ours == theirs {
                    same += 1;
                } else {
                    other += 1;
                    let _ = writeln!(local, "{mode}: _CST differs: {} ours {ours:?} Linux {theirs:?}", named.path);
                }
                shapes.insert(states.iter().map(|s| (describe(s), s.2, s.3)).collect::<Vec<_>>());
            }
            None => none += 1,
        }
    }
    let described: Vec<String> = theirs.iter().map(|(d, l)| format!("{d} latency {l}")).collect();
    let _ = writeln!(sum, "processors' _CST beside Linux's cpu0 ({described:?}): {same} equal, {other} differ, {none} refused");
    let _ = writeln!(sum, "_CST states as (register, type, latency): {shapes:?}");
}

fn statuses(sum: &mut String, local: &mut String, booted: &mut Booted<'_>, dump: &Dump, dir: &Path) {
    let linux = linux_status(dir);
    let (mut equal, mut differ, mut unread) = (0, 0, 0);
    let mut differing: BTreeMap<String, usize> = BTreeMap::new();
    let mut refusals: BTreeMap<String, usize> = BTreeMap::new();
    // Interrupt links and batteries, by _HID: (equal, differ, refused).
    let mut by_hid: BTreeMap<&str, (u32, u32, u32)> = BTreeMap::new();
    {
        let aml = booted.aml.as_mut().expect("a namespace");
        let names = booted.names.as_ref().expect("names");
        for named in names.objects.iter().filter(|o| o.kind == Kind::Device || o.kind == Kind::Processor) {
            let Some(&theirs) = linux.get(&named.path) else { continue };
            let hid = format!("{}._HID", named.path);
            let id = names.paths.contains(&hid).then(|| aml.interpreter.evaluate(&mut aml.host, &hid, &[]).ok()).flatten().as_ref().and_then(devices::id);
            let tally = match id.as_deref() {
                Some("PNP0C0F") => Some("PNP0C0F"),
                Some("PNP0C0A") => Some("PNP0C0A"),
                _ => None,
            };
            let before = dump.unrecorded.borrow().clone();
            let ours = if names.paths.contains(&format!("{}._STA", named.path)) {
                match aml.interpreter.evaluate(&mut aml.host, &format!("{}._STA", named.path), &[]) {
                    Ok(Value::Integer(v)) => Ok(v),
                    Ok(_) => Err("no Integer".to_string()),
                    Err(why) => Err(aml::kind(&why)),
                }
            } else {
                Ok(0x0F)
            };
            let after = dump.unrecorded.borrow().clone();
            let unheld: Vec<String> = after.iter().filter(|(k, n)| before.get(*k) != Some(n)).map(|(k, _)| k.clone()).collect();
            let slot = tally.map(|t| by_hid.entry(t).or_default());
            match ours {
                Ok(v) if v == theirs => {
                    equal += 1;
                    if let Some(s) = slot {
                        s.0 += 1;
                    }
                }
                Ok(v) => {
                    differ += 1;
                    if let Some(s) = slot {
                        s.1 += 1;
                    }
                    let why = if unheld.is_empty() { "reading nothing the dump does not hold".to_string() } else { unheld.join(" + ") };
                    *differing.entry(format!("ours {v:#x}, Linux's {theirs:#x}, {why}")).or_insert(0) += 1;
                    let _ = writeln!(*local, "_STA differs: {} ours {v:#x} Linux {theirs:#x}", named.path);
                }
                Err(why) => {
                    unread += 1;
                    if let Some(s) = slot {
                        s.2 += 1;
                    }
                    *refusals.entry(why.clone()).or_insert(0) += 1;
                    let _ = writeln!(*local, "_STA refused: {} {why}", named.path);
                }
            }
        }
    }
    let _ = writeln!(*sum, "_STA beside Linux's: {equal} equal, {differ} differ, {unread} refused, of {} devices Linux lists", linux.len());
    for (what, n) in &differing {
        let _ = writeln!(*sum, "  {n} differ: {what}");
    }
    for (what, n) in &refusals {
        let _ = writeln!(*sum, "  {n} refused: {what}");
    }
    for (hid, (e, d, r)) in &by_hid {
        let _ = writeln!(*sum, "  {hid} devices' _STA: {e} equal Linux's, {d} differ, {r} refused");
    }
}

fn main() {
    let args: Vec<String> = std::env::args().collect();
    let (dir, out, intel) = (Path::new(&args[1]), Path::new(&args[2]), args[3] == "intel");
    fs::create_dir_all(out).unwrap();
    if args.get(4).map(String::as_str) == Some("names") {
        names_mode(dir, out);
        return;
    }
    let (mut sum, mut local) = (String::new(), String::new());
    let blocks = sources(dir, &mut local);
    let linux_blocks = dynamic(dir);
    let _ = writeln!(sum, "## inputs\nrun-time blocks of Linux's placed at their firmware sources: {} of {}", blocks.len(), linux_blocks.len());

    let (dump, gpe0, control_method) = machine(dir, &blocks);
    let mut booted = boot(&dump, gpe0, control_method, intel, Claims::ToyOs);
    let _ = writeln!(sum, "\n## the server's start, ToyOS's claims (processors {})", if intel { "Intel's" } else { "not Intel's" });
    let _ = writeln!(sum, "static tables loaded: {} of {}", booted.loaded.blocks.iter().filter(|b| b.is_ok()).count(), booted.loaded.blocks.len());
    for (k, block) in booted.loaded.blocks.iter().enumerate() {
        if let Err(why) = block {
            let _ = writeln!(sum, "  table {} refused: {why}", k + 1);
        }
    }
    let _ = writeln!(sum, "\\_S5: {:?}, handed {}", booted.loaded.s5, booted.loaded.handed);
    let _ = writeln!(sum, "{}", booted.census.line());
    let _ = writeln!(sum, "controller served: {}", booted.controller.is_some());
    match &booted.negotiated.platform {
        Some(Ok(a)) => {
            let _ = writeln!(sum, "\\_SB._OSC: {a:?}");
        }
        Some(Err(why)) => {
            let _ = writeln!(sum, "\\_SB._OSC refused: {why}");
        }
        None => {
            let _ = writeln!(sum, "\\_SB._OSC: absent");
        }
    }
    let answers: BTreeMap<String, usize> = booted.negotiated.processors.iter().fold(BTreeMap::new(), |mut m, (_, a)| {
        *m.entry(format!("{a:?}")).or_insert(0) += 1;
        m
    });
    let _ = writeln!(sum, "processors' _OSC: {} evaluated", booted.negotiated.processors.len());
    for (answer, n) in &answers {
        let _ = writeln!(sum, "  {n} answered {answer}");
    }
    {
        let aml = booted.aml.as_mut().expect("a namespace");
        let _ = writeln!(
            sum,
            "run-time loads: {} loaded, {} refused; namespace {} objects in {} slots",
            aml.host.loaded,
            aml.host.loads_refused,
            aml.interpreter.defined(),
            aml.interpreter.slots()
        );
    }
    let reached: BTreeMap<String, usize> = dump.reached.borrow().iter().filter(|(w, _)| *w != "table" && *w != "nvs").map(|(w, b)| (w.clone(), b.len())).collect();
    let _ = writeln!(sum, "run-time blocks read (OEM Table ID, bytes): {reached:?}");
    statuses(&mut sum, &mut local, &mut booted, &dump, dir);
    processors_cst(&mut sum, &mut local, &mut booted, dir, "toyos");
    let _ = writeln!(sum, "answered without the dump: {:#?}", dump.unrecorded.borrow());
    let mut verdicts: BTreeMap<String, u64> = BTreeMap::new();
    for (access, n) in dump.ports.borrow().iter() {
        let _ = writeln!(local, "port {access} x{n}");
        let (_, said) = access.split_once(' ').unwrap();
        let (_, said) = said.split_once(' ').unwrap();
        *verdicts.entry(said.to_string()).or_insert(0) += n;
    }
    let _ = writeln!(sum, "port accesses by direction and the kernel's verdict: {verdicts:?}");
    drop(booted);

    let toyos_platform = osc::PLATFORM.capabilities;
    // Intel 302223-007 Table 1: bit 3 and bit 4, which load the T14's _CST
    // blocks (#875's M1), and bits 8 and 9, FFH C1 and C2/C3.
    let deep = (1 << 3) | (1 << 4) | (1 << 8) | (1 << 9);
    for (mode, claims) in [
        ("every bit, queried then committed with the offer", Claims::Queried(u32::MAX, u32::MAX)),
        ("every bit, committed whole", Claims::Committed(u32::MAX, u32::MAX)),
        ("processors Intel's bits 3, 4, 8 and 9, queried then committed with the offer; the platform ToyOS's", Claims::Queried(toyos_platform, deep)),
        ("processors Intel's bits 3, 4, 8 and 9, committed whole; the platform ToyOS's", Claims::Committed(toyos_platform, deep)),
    ] {
        let (dump, gpe0, control_method) = machine(dir, &blocks);
        let mut every = boot(&dump, gpe0, control_method, intel, claims);
        let _ = writeln!(sum, "\n## {mode}, platform and processors");
        let answers: BTreeMap<String, usize> = every.negotiated.processors.iter().fold(BTreeMap::new(), |mut m, (_, a)| {
            *m.entry(format!("{a:?}")).or_insert(0) += 1;
            m
        });
        for (answer, n) in &answers {
            let _ = writeln!(sum, "  processors' _OSC: {n} answered {answer}");
        }
        {
            let aml = every.aml.as_mut().expect("a namespace");
            let _ = writeln!(sum, "run-time loads: {} loaded, {} refused", aml.host.loaded, aml.host.loads_refused);
        }
        let read: BTreeMap<String, usize> = dump.reached.borrow().iter().filter(|(w, _)| *w != "table" && *w != "nvs").map(|(w, b)| (w.clone(), b.len())).collect();
        let whole: BTreeSet<&String> = read.iter().filter(|(w, n)| linux_blocks.get(*w).is_some_and(|b| b.len() == **n)).map(|(w, _)| w).collect();
        let _ = writeln!(
            sum,
            "Linux's run-time blocks read whole, by OEM Table ID and length: {} of {} ({:?})",
            whole.len(),
            linux_blocks.len(),
            linux_blocks.keys().map(|k| (k.as_str(), whole.contains(k))).collect::<Vec<_>>()
        );
        statuses(&mut sum, &mut local, &mut every, &dump, dir);
        processors_cst(&mut sum, &mut local, &mut every, dir, mode);
    }
    fs::write(out.join("summary.txt"), &sum).unwrap();
    fs::write(out.join("local.txt"), &local).unwrap();
    print!("{sum}");
}

/// `aml-check <dump> <out> <intel|amd> names`: each device, processor and
/// thermal zone of the static namespace, whether it names a `_STA` and an
/// `_INI`, and whether a device below it does: local only.
fn names_mode(dir: &Path, out: &Path) {
    let (dump, _, _) = machine(dir, &[]);
    let (_, kept) = aml::load(&dump, RSDP);
    let aml = kept.expect("the DSDT loads");
    let names = Names::read(&aml.interpreter).expect("the walk");
    let inis: Vec<&str> = names.objects.iter().filter(|o| o.path.ends_with("._INI") && o.kind == Kind::Method).map(|o| o.path.as_str()).collect();
    let mut text = String::new();
    for o in names.objects.iter().filter(|o| matches!(o.kind, Kind::Device | Kind::Processor | Kind::ThermalZone)) {
        let sta = names.paths.contains(&format!("{}._STA", o.path));
        let ini = names.paths.contains(&format!("{}._INI", o.path));
        let below = inis.iter().any(|i| i.starts_with(&format!("{}.", o.path)));
        let _ = writeln!(text, "{:?} {} sta={sta} ini={ini} subtree_ini={below}", o.kind, o.path);
    }
    fs::write(out.join("names.txt"), text).unwrap();
}

/// The kernel's port declarations as it boots on the bench: its fixed runs,
/// the i8042, and what the FADT names, SMI_CMD with the bytes it keeps, the
/// reset register and the PM1a control block.
fn declarations(dump: &Dump) -> Vec<(u16, u16, toyos_userbound::Mediated)> {
    use toyos_userbound::{KeptCommands, Mediated};
    let mut declared = vec![
        (0x3F8, 0x3FF, Mediated::Kept),
        (0x20, 0x21, Mediated::Kept),
        (0xA0, 0xA1, Mediated::Kept),
        (0x80, 0x80, Mediated::Open),
        (0x70, 0x71, Mediated::Kept),
        (0xCF8, 0xCF8, Mediated::Kept),
        (0xCFC, 0xCFF, Mediated::Kept),
        (0x60, 0x60, Mediated::Kept),
        (0x64, 0x64, Mediated::Kept),
    ];
    let tables = tables::Tables::new(dump);
    let fadt = toyos_acpi::find_table(&tables, RSDP, b"FACP", toyos_acpi::FADT_FOR_FIXED_HARDWARE).expect("the FADT");
    let reset = toyos_acpi::reset_register(&fadt);
    let smi = toyos_acpi::fixed_hardware(&fadt).ok().and_then(|fixed| fixed.smi_cmd);
    if let Some(named) = smi {
        declared.push((named.port, named.port, Mediated::Command(KeptCommands(named.named(false, reset)))));
    }
    if let toyos_acpi::Reset::Port { port, .. } = reset {
        if smi.map(|named| named.port) != Some(port) {
            declared.push((port, port, Mediated::Kept));
        }
    }
    if let Ok(block) = toyos_acpi::pm1a_control(&fadt) {
        declared.push((block.port, block.port + block.len - 1, Mediated::ReadOnly));
    }
    declared
}
