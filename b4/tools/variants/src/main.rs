//! `b4-variants <root.img> <outdir> <extra-buckets>...`: ROOT's tree, read back
//! by the engine, rewritten by mkfs at its fitted size plus each extra count
//! of buckets.
use bcachefs::engine::{self, DirentType, Meta, NodeRef, Options, Tree, Volume};
use std::collections::BTreeMap;
use toyos_blockdev::{block_on_ready, Bytes, ReadOnlyBytes, BLOCK};

#[derive(Clone)]
struct Seeded(u64);
impl toyos_crypto::Random for Seeded {
    fn fill(&mut self, out: &mut [u8]) -> Result<(), toyos_crypto::Error> {
        for b in out { self.0 ^= self.0 << 13; self.0 ^= self.0 >> 7; self.0 ^= self.0 << 17; *b = (self.0 >> 56) as u8; }
        Ok(())
    }
}

fn main() {
    let a: Vec<String> = std::env::args().collect();
    let root = std::fs::read(&a[1]).unwrap();
    let v = block_on_ready(Volume::open(ReadOnlyBytes::new(&root).unwrap())).unwrap();
    let mut entries: BTreeMap<Vec<u8>, (DirentType, Vec<u8>)> = BTreeMap::new();
    block_on_ready(async {
        for (p, e) in v.names().await.unwrap() {
            let data = match e.kind {
                DirentType::Directory => Vec::new(),
                DirentType::Symlink => v.readlink(e.ino).await.unwrap(),
                _ => { let n = v.inode(e.ino).await.unwrap().size as usize; let mut b = vec![0; n]; v.read(e.ino, 0, &mut b).await.unwrap(); b }
            };
            entries.insert(p, (e.kind, data));
        }
    });
    let mut tree = Tree::new();
    let mut dirs: BTreeMap<Vec<u8>, NodeRef> = BTreeMap::from([(Vec::new(), Tree::ROOT)]);
    let m = |perm| Meta { perm, uid: 0, gid: 0 };
    for (p, (kind, data)) in &entries {
        let (parent, name) = match p.iter().rposition(|&b| b == b'/') { Some(i) => (p[..i].to_vec(), &p[i + 1..]), None => (Vec::new(), &p[..]) };
        let parent = dirs[&parent];
        match kind {
            DirentType::Directory => { let d = tree.dir(parent, name, m(0o755)).unwrap(); dirs.insert(p.clone(), d); }
            DirentType::Symlink => { tree.symlink(parent, name, data, m(0o777)).unwrap(); }
            _ => { tree.file(parent, name, data, m(0o644)).unwrap(); }
        }
    }
    let o = Options { label: b"ROOT", time: 0, encryption: None };
    let fit = engine::fit(&o, &tree, &Seeded(1)).unwrap();
    // mkfs's geometry rule: 2^floor(log2(sectors / 2048)) sectors, 32..=4096.
    let sectors = fit * 8;
    let per = (1u64 << (sectors / 2048).max(1).ilog2()).clamp(32, 4096) / 8;
    for extra in &a[3..] {
        let extra: u64 = extra.parse().unwrap();
        let blocks = fit + extra * per;
        let dev = Bytes::new(vec![0u8; blocks as usize * BLOCK]);
        block_on_ready(engine::mkfs(&dev, &o, &tree, &mut Seeded(1))).unwrap();
        let path = format!("{}/v{extra}.img", a[2]);
        std::fs::write(&path, dev.into_inner()).unwrap();
        eprintln!("{path}: {blocks} blocks, fit {fit}, {per} blocks a bucket");
    }
}
