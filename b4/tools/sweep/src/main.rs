//! `b4-sweep <outdir> <tag>`: 8 MiB volumes (16 KiB nodes), each one
//! directory of k empty files, for k across the sizes that give the
//! dirents and inodes btrees two to four leaves.
use bcachefs::engine::{self, Meta, Options, Tree};
use toyos_blockdev::{block_on_ready, Bytes};

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
    for k in (60..=900).step_by(12) {
        let mut tree = Tree::new();
        let d = tree.dir(Tree::ROOT, b"d", Meta { perm: 0o755, uid: 0, gid: 0 }).unwrap();
        for i in 0..k {
            tree.file(d, format!("f{i:05}").as_bytes(), b"", Meta { perm: 0o644, uid: 0, gid: 0 }).unwrap();
        }
        let dev = Bytes::new(vec![0u8; 8 << 20]);
        block_on_ready(engine::mkfs(&dev, &Options { label: b"", time: 0, encryption: None }, &tree, &mut Seeded(k as u64))).unwrap();
        std::fs::write(format!("{}/{}-{k:04}.img", a[1], a[2]), dev.into_inner()).unwrap();
    }
}
