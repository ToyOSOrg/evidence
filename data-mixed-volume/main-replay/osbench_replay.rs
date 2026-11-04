//! osbench's `persist` and `fs.disk` file sequence against the DATA volume
//! over a model disk, with an oracle that shares no code with the format:
//! every write the disk takes is refused if it lands on a node the tree
//! committed on the medium reaches, and the volume left at the end is walked
//! for overlaps between nodes, extents and the format's own blocks, and for
//! reached blocks its bitmap calls free.

use std::cell::{Cell, RefCell};
use std::collections::{BTreeMap, BTreeSet};

use fileserver::cache::Disk;
use fileserver::data::{DataVolume, Probed};
use fileserver::ram::Ram;
use fileserver::volume::{Buf, OpenHow, Volume, Writes};
use toyos_blockdev::{block_on_ready, Block, BlockDev, Error, BLOCK};

const MIB: usize = 1 << 20;
const CREATE: OpenHow = OpenHow { create: true, create_new: false, truncate: false };
const CREATE_TRUNC: OpenHow = OpenHow { create: true, create_new: false, truncate: true };
const PLAIN: OpenHow = OpenHow { create: false, create_new: false, truncate: false };

fn clock() -> u64 {
    1_793_650_328_000_000_000
}

/// The tree a mount of the medium would find: its nodes, and every file's
/// extents by name.
#[derive(Default)]
struct Walked {
    nodes: BTreeMap<u64, u32>,
    files: BTreeMap<String, Vec<(u64, u64)>>,
    bitmap: (u64, u64),
    root: u64,
    broken: Vec<String>,
}

/// A disk that checks every write against the committed tree.
struct Model {
    ram: Ram,
    committed: RefCell<BTreeSet<u64>>,
    violations: RefCell<Vec<String>>,
    op: Cell<&'static str>,
    /// Checks writes once the volume's history is written.
    armed: Cell<bool>,
}

fn le(b: &[u8], at: usize, n: usize) -> u64 {
    let mut v = [0u8; 8];
    v[..n].copy_from_slice(&b[at..at + n]);
    u64::from_le_bytes(v)
}

impl Model {
    fn new(blocks: u64) -> Self {
        Self { ram: Ram::new(blocks), committed: RefCell::default(), violations: RefCell::default(), op: Cell::new("format"), armed: Cell::new(false) }
    }

    fn block(&self, lba: u64) -> Block {
        let mut b = [[0u8; BLOCK]];
        block_on_ready(self.ram.read(lba, &mut b)).unwrap();
        b[0]
    }

    /// The tree as a mount would find it: block 0's superblock, or the
    /// backup's where block 0 holds none.
    fn walk(&self) -> Walked {
        let mut w = Walked::default();
        let last = self.ram.blocks() - 1;
        let sb = [self.block(0), self.block(last)].into_iter().find(|b| &b[..4] == b"BCFS");
        let Some(sb) = sb else {
            w.broken.push("no BCFS superblock".into());
            return w;
        };
        w.root = le(&sb, 24, 8);
        w.bitmap = (le(&sb, 52, 8), le(&sb, 60, 8));
        let mut stack = vec![w.root];
        while let Some(at) = stack.pop() {
            *w.nodes.entry(at).or_default() += 1;
            if w.nodes[&at] > 1 {
                w.broken.push(format!("node {at} is reached twice"));
                continue;
            }
            let b = self.block(at);
            if &b[..4] != b"BTND" {
                w.broken.push(format!("node {at} begins {:?}", &b[..4]));
                continue;
            }
            let (level, count) = (le(&b, 8, 2), le(&b, 10, 2) as usize);
            let mut off = 32;
            for _ in 0..count {
                let len = le(&b, off + 18, 4) as usize;
                let v = &b[off + 24..off + 24 + len];
                if level > 0 {
                    stack.push(le(v, 0, 8));
                } else {
                    let name_len = le(v, 1, 2) as usize;
                    let name = String::from_utf8_lossy(&v[19..19 + name_len]).into_owned();
                    let ext = v[19 + name_len..].chunks(16).map(|e| (le(e, 0, 8), le(e, 8, 4))).collect();
                    w.files.insert(name, ext);
                }
                off = (off + 24 + len + 7) & !7;
            }
        }
        w
    }

    fn recommit(&self) {
        if !self.armed.get() {
            return;
        }
        *self.committed.borrow_mut() = self.walk().nodes.into_keys().collect();
    }

    fn check(&self, lba: u64, data: &[Block], kind: &str) {
        let committed = self.committed.borrow();
        for (b, d) in (lba..).zip(data) {
            if committed.contains(&b) {
                self.violations.borrow_mut().push(format!(
                    "{}: a {kind} write of {:?}.. landed on node {b} of the committed tree",
                    self.op.get(),
                    &d[..4]
                ));
            }
        }
    }

    /// Every block the walked tree reaches is one thing, none is a block the
    /// format keeps for itself, and the bitmap calls each used.
    fn fsck(&self) -> Vec<String> {
        let w = self.walk();
        let mut out = w.broken.clone();
        let last = self.ram.blocks() - 1;
        let mut owner: BTreeMap<u64, String> = BTreeMap::new();
        let mut claim = |b: u64, who: String, out: &mut Vec<String>| {
            if b == 0 || b == last || (w.bitmap.0..w.bitmap.0 + w.bitmap.1).contains(&b) {
                out.push(format!("{who} holds block {b}, the format's own"));
            }
            if let Some(prev) = owner.insert(b, who.clone()) {
                out.push(format!("block {b} is both {prev} and {who}"));
            }
        };
        for &n in w.nodes.keys() {
            claim(n, format!("node {n}"), &mut out);
        }
        for (name, ext) in &w.files {
            for &(start, len) in ext {
                for b in start..start + len {
                    claim(b, format!("'{name}'"), &mut out);
                }
            }
        }
        for &b in owner.keys() {
            let bits = self.block(w.bitmap.0 + b / (BLOCK as u64 * 8));
            let byte = ((b / 8) % BLOCK as u64) as usize;
            if bits[byte] & (1 << (b % 8)) == 0 {
                out.push(format!("block {b} ({}) is reached and the bitmap calls it free", owner[&b]));
            }
        }
        out
    }
}

impl BlockDev for Model {
    fn blocks(&self) -> u64 {
        self.ram.blocks()
    }
    async fn read(&self, lba: u64, out: &mut [Block]) -> Result<(), Error> {
        self.ram.read(lba, out).await
    }
    async fn write(&self, lba: u64, data: &[Block]) -> Result<(), Error> {
        self.check(lba, data, "structure");
        self.ram.write(lba, data).await?;
        if lba == 0 {
            self.recommit();
        }
        Ok(())
    }
    async fn write_data(&self, lba: u64, data: &[Block]) -> Result<(), Error> {
        self.check(lba, data, "data");
        self.ram.write(lba, data).await
    }
    async fn flush(&self) -> Result<(), Error> {
        Ok(())
    }
}

impl Disk for &Model {}
type Vol<'a> = DataVolume<&'a Model>;

fn mount(m: &Model) -> Vol<'_> {
    match DataVolume::probe(m, 16 * 1024, &["apps", "config", "home", "state"], clock) {
        Probed::Mounted(v) => v,
        Probed::Unmountable(why) => panic!("unmountable: {why}"),
        Probed::Foreign => panic!("foreign"),
    }
}

/// `fs::write`: created or truncated, written, closed.
fn put(v: &mut Vol, path: &str, data: &[u8]) {
    let n = v.open(path, CREATE_TRUNC).unwrap();
    v.write(n, 0, data).unwrap();
    v.close(n).unwrap();
}

fn remove_all(v: &mut Vol, dir: &str) {
    let Ok(listed) = v.list(dir) else { return };
    for e in listed {
        let p = format!("{dir}/{}", e.name);
        if v.lstat(&p).unwrap().kind == fileserver::volume::Kind::Dir {
            remove_all(v, &p);
        } else {
            v.unlink(&p).unwrap();
        }
    }
    v.rmdir(dir).unwrap();
}

fn page_at(i: usize, pages: usize) -> u64 {
    let x = (i as u64).wrapping_mul(0x9e37_79b9_7f4a_7c15) >> 20;
    (x % pages as u64) * 4096
}

/// A volume with history: /apps and /config files of several sizes, some
/// replaced, as the bench's DATA carried before osbench ran.
fn history(m: &Model) {
    let mut v = DataVolume::format(m, 16 * 1024, &["apps", "config", "home", "state"], clock).unwrap();
    for i in 0..400usize {
        let len = 1 + (i * 7919) % (300 * 1024);
        put(&mut v, &format!("apps/pkg{:03}/file{i}", i % 37), &vec![(i % 200) as u8 + 1; len]);
        if i % 5 == 0 {
            v.sync().unwrap();
        }
    }
    v.sync().unwrap();
}

/// osbench's `persist` rows, then `files::suite` under the same directory.
fn osbench(m: &Model, v: &mut Vol) {
    let d = "home/osbench-1";
    m.op.set("persist");
    let _ = v.mkdir(d);
    let block = [0x6bu8; 4096];
    put(v, &format!("{d}/over"), &vec![1u8; MIB]);
    let f = v.open(&format!("{d}/over"), PLAIN).unwrap();
    for _ in 0..105 {
        v.write(f, 0, &block).unwrap();
        v.sync().unwrap();
    }
    for _ in 0..210 {
        v.sync().unwrap();
    }
    v.close(f).unwrap();
    let log = v.open(&format!("{d}/log"), CREATE).unwrap();
    for _ in 0..105 {
        let at = v.node_meta(log).unwrap().size;
        v.write(log, at, &block).unwrap();
        v.sync().unwrap();
    }
    v.close(log).unwrap();
    for _ in 0..55 {
        let n = v.open(&format!("{d}/fresh"), CREATE_TRUNC).unwrap();
        v.write(n, 0, &block).unwrap();
        v.sync().unwrap();
        v.close(n).unwrap();
        v.unlink(&format!("{d}/fresh")).unwrap();
    }
    let chunk = vec![0x2du8; MIB];
    for _ in 0..4 {
        let n = v.open(&format!("{d}/seq"), CREATE_TRUNC).unwrap();
        for i in 0..8 {
            v.write(n, (i * MIB) as u64, &chunk).unwrap();
        }
        v.sync().unwrap();
        v.close(n).unwrap();
    }
    v.unlink(&format!("{d}/seq")).unwrap();
    remove_all(v, d);

    m.op.set("fs.disk");
    v.mkdir(d).unwrap();
    let fill: Vec<u8> = (0..MIB).map(|i| (i % 251) as u8).collect();
    put(v, &format!("{d}/small"), &fill[..4096]);
    for _ in 0..1050 {
        let n = v.open(&format!("{d}/fresh"), CREATE_TRUNC).unwrap();
        v.write(n, 0, &[7u8; 100]).unwrap();
        v.close(n).unwrap();
        v.unlink(&format!("{d}/fresh")).unwrap();
    }
    let big = format!("{d}/big");
    let n = v.open(&big, CREATE_TRUNC).unwrap();
    for i in 0..16 {
        v.write(n, (i * MIB) as u64, &fill).unwrap();
    }
    v.close(n).unwrap();
    let n = v.open(&big, PLAIN).unwrap();
    let mut buf = vec![0u8; 4096];
    for i in 0..2100 {
        v.read(n, page_at(i, 4096), &mut Buf(&mut buf)).unwrap();
    }
    for i in 0..2100 {
        v.write(n, page_at(i, 4096), &buf).unwrap();
    }
    v.close(n).unwrap();
    v.unlink(&big).unwrap();
    let listed = format!("{d}/listed");
    v.mkdir(&listed).unwrap();
    for i in 0..1000 {
        let n = v.open(&format!("{listed}/entry-{i:04}"), CREATE_TRUNC).unwrap();
        v.close(n).unwrap();
    }
    remove_all(v, &listed);
    let n = v.open(&format!("{d}/a"), CREATE_TRUNC).unwrap();
    v.close(n).unwrap();
    for i in 0..2100 {
        let (from, to) = if i % 2 == 0 { ("a", "b") } else { ("b", "a") };
        v.rename(&format!("{d}/{from}"), &format!("{d}/{to}")).unwrap();
    }
    for _ in 0..1050 {
        v.mkdir(&format!("{d}/sub")).unwrap();
        v.rmdir(&format!("{d}/sub")).unwrap();
    }
    for _ in 0..22 {
        let tree = format!("{d}/tree");
        v.mkdir(&tree).unwrap();
        for i in 0..100 {
            put(v, &format!("{tree}/f{i:03}"), &[3u8; 64]);
        }
        for i in 0..100 {
            v.unlink(&format!("{tree}/f{i:03}")).unwrap();
        }
        v.rmdir(&tree).unwrap();
    }
    let seq: Vec<u8> = (0..MIB).map(|i| (i % 253) as u8).collect();
    let path = format!("{d}/seq");
    for call in [4096usize, MIB] {
        for _ in 0..6 {
            let n = v.open(&path, CREATE_TRUNC).unwrap();
            for c in 0..64 * MIB / call {
                let at = c * call % MIB;
                v.write(n, (c * call) as u64, &seq[at..at + call]).unwrap();
            }
            v.close(n).unwrap();
        }
    }
    v.unlink(&path).unwrap();
    remove_all(v, d);
    m.op.set("shutdown sync");
    v.sync().unwrap();
}

/// T14's DATA geometry: 170 GiB of 4 KiB blocks, sparse in memory.
const T14_BLOCKS: u64 = 44_564_480;

#[test]
fn osbench_on_an_intact_volume_writes_over_nothing_the_tree_reaches() {
    let m = Model::new(T14_BLOCKS);
    history(&m);
    m.armed.set(true);
    m.recommit();
    let mut v = mount(&m);
    osbench(&m, &mut v);
    drop(v);
    let violations = m.violations.borrow().clone();
    assert!(violations.is_empty(), "{} writes over the committed tree, first {:?}", violations.len(), violations.first());
    let found = m.fsck();
    assert!(found.is_empty(), "{} findings, first {:?}", found.len(), &found[..found.len().min(5)]);
    let mut again = mount(&m);
    assert!(again.list("home").unwrap().is_empty());
}

struct Draws(u8);

impl toyos_crypto::Random for Draws {
    fn fill(&mut self, out: &mut [u8]) -> Result<(), toyos_crypto::Error> {
        for b in out {
            self.0 = self.0.wrapping_mul(13).wrapping_add(7);
            *b = self.0;
        }
        Ok(())
    }
}

/// The benches' history: the native format's mkfs over the partition that
/// held this format's volume, then this format's mount.
#[test]
fn osbench_on_a_volume_the_native_mkfs_wrote_over() {
    let m = Model::new(T14_BLOCKS);
    history(&m);
    m.op.set("native mkfs");
    let options = bcachefs::engine::Options { label: b"ToyOS DATA", time: clock(), encryption: None };
    block_on_ready(bcachefs::engine::mkfs(&&m, &options, &bcachefs::engine::Tree::new(), &mut Draws(1))).unwrap();
    println!("block 0 after the native mkfs begins {:?}", &m.block(0)[..4]);
    println!("block 1 (this format's first bitmap block) begins {:?}", &m.block(1)[..4]);
    m.armed.set(true);
    m.recommit();
    let before = m.fsck();
    println!("before the mount: {} findings, first {:?}", before.len(), &before[..before.len().min(5)]);
    m.op.set("mount");
    let mut v = match DataVolume::probe(&m, 16 * 1024, &["apps", "config", "home", "state"], clock) {
        Probed::Mounted(v) => v,
        Probed::Unmountable(why) => {
            println!("REFUSED: {why}");
            return;
        }
        Probed::Foreign => {
            println!("REFUSED as foreign");
            return;
        }
    };
    println!("MOUNTED the volume the native mkfs wrote over");
    let ran = std::panic::catch_unwind(std::panic::AssertUnwindSafe(|| osbench(&m, &mut v)));
    println!("osbench {}", if ran.is_ok() { "ran to its end" } else { "stopped at a refusal" });
    m.op.set("shutdown sync");
    println!("shutdown sync: {:?}", v.sync().map(|u| u.len()));
    drop(v);
    let violations = m.violations.borrow().clone();
    println!("{} writes over the committed tree, first {:?}", violations.len(), &violations[..violations.len().min(5)]);
    let found = m.fsck();
    println!("after: {} findings, first {:?}", found.len(), &found[..found.len().min(8)]);
    match DataVolume::probe(&m, 16 * 1024, &["apps", "config", "home", "state"], clock) {
        Probed::Mounted(_) => println!("the next mount lists"),
        Probed::Unmountable(why) => println!("the next mount: {why}"),
        Probed::Foreign => println!("the next mount: foreign"),
    }
    assert!(violations.is_empty() && found.is_empty(), "the hybrid volume was damaged");
}
