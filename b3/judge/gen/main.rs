//! Writes B3's volumes for the upstream judge: B2's four empty volumes
//! (to show the rewritten mkfs writes their bytes), and generated trees
//! with files, directories, symlinks and hard links. Each image is read
//! back and checked by ToyOS's fsck before it is written out. Seeded, so
//! reproducible.
use bcachefs::engine::{fsck, mkfs, Encryption, Meta, Options, Tree, Volume, MIN_KDF};
use toyos_blockdev::{block_on_ready, Bytes};
use toyos_crypto::Random;

struct Seeded(u64);
impl Random for Seeded {
    fn fill(&mut self, out: &mut [u8]) -> Result<(), toyos_crypto::Error> {
        for b in out {
            self.0 ^= self.0 << 13;
            self.0 ^= self.0 >> 7;
            self.0 ^= self.0 << 17;
            *b = (self.0.wrapping_mul(0x2545_f491_4f6c_dd1d) >> 56) as u8;
        }
        Ok(())
    }
}

impl Seeded {
    fn below(&mut self, n: usize) -> usize {
        let mut b = [0u8; 8];
        self.fill(&mut b).unwrap();
        (u64::from_le_bytes(b) % n as u64) as usize
    }
}

/// File sizes around every boundary the writer splits at: a block, a
/// 16 KiB bucket, a crc32 entry's 64 KiB, the 256 KiB encoded-extent
/// maximum.
const SIZES: [usize; 14] = [0, 1, 11, 4095, 4096, 4097, 16384, 16385, 65535, 65536, 65537, 262144, 262145, 1 << 20 | 3];

fn contents(seed: u64) -> Vec<Vec<u8>> {
    let mut rng = Seeded(seed);
    SIZES
        .iter()
        .enumerate()
        .map(|(i, &n)| {
            let mut v = vec![0u8; n];
            // Every third file all zeros, whose type-5 checksum is 0.
            if i % 3 != 2 {
                rng.fill(&mut v).unwrap();
            }
            v
        })
        .collect()
}

/// A chain of directories twelve deep, a directory of `wide` small files,
/// every size of [`SIZES`] somewhere, files linked into other directories,
/// and symlinks up to the longest target; and its manifest, one line per
/// path: `f <sha256> <path>` for a file (its names' count in `n`), `l
/// <target> <path>` for a symlink, `d <path>` for a directory.
fn tree(data: &[Vec<u8>], seed: u64, wide: usize) -> (Tree<'_>, Vec<String>) {
    let mut rng = Seeded(seed);
    let file = Meta { perm: 0o644, uid: 1000, gid: 1000 };
    let dir = Meta { perm: 0o755, uid: 0, gid: 0 };
    let mut t = Tree::new();
    let mut paths: Vec<(String, String)> = Vec::new(); // path, what
    let mut dirs = vec![(Tree::ROOT, ".".to_string())];
    let mut at = (Tree::ROOT, ".".to_string());
    for i in 0..12 {
        let name = format!("level-{i}");
        at = (t.dir(at.0, name.as_bytes(), dir).unwrap(), format!("{}/{name}", at.1));
        paths.push((at.1.clone(), "d".into()));
        dirs.push(at.clone());
    }
    let many = (t.dir(Tree::ROOT, b"wide", dir).unwrap(), "./wide".to_string());
    paths.push((many.1.clone(), "d".into()));
    dirs.push(many.clone());
    let sha = |b: &[u8]| sha256(b);
    for i in 0..wide {
        let name = format!("f{i:05}");
        t.file(many.0, name.as_bytes(), &data[i % 3], file).unwrap();
        paths.push((format!("{}/{name}", many.1), format!("f {} 1", sha(&data[i % 3]))));
    }
    let mut files = Vec::new();
    for bytes in data {
        let (d, p) = &dirs[rng.below(dirs.len())];
        let name = format!("size-{}", bytes.len());
        files.push((t.file(*d, name.as_bytes(), bytes, file).unwrap(), vec![format!("{p}/{name}")], sha(bytes)));
    }
    for i in (0..files.len()).step_by(3) {
        for j in 0..1 + rng.below(3) {
            let (d, p) = &dirs[rng.below(dirs.len())];
            let name = format!("link-{i}-{j}");
            t.link(*d, name.as_bytes(), files[i].0).unwrap();
            files[i].1.push(format!("{p}/{name}"));
        }
    }
    for (_, names, digest) in &files {
        for p in names {
            paths.push((p.clone(), format!("f {digest} {}", names.len())));
        }
    }
    let symlink = Meta { perm: 0o777, ..file };
    let longest = String::from_utf8(vec![b'x'; 4095]).unwrap();
    for (d, p, name, target) in [
        (Tree::ROOT, ".".to_string(), "to-deep", "level-0/level-1/level-2/size-1".to_string()),
        (at.0, at.1.clone(), "up", "../../..".to_string()),
        (many.0, many.1.clone(), "longest", longest),
    ] {
        t.symlink(d, name.as_bytes(), target.as_bytes(), symlink).unwrap();
        paths.push((format!("{p}/{name}"), format!("l {}", sha(target.as_bytes()))));
    }
    paths.sort();
    (t, paths.into_iter().map(|(p, what)| format!("{what} {p}")).collect())
}

fn sha256(b: &[u8]) -> String {
    toyos_crypto::hash::Sha256::digest(b).unwrap().iter().map(|x| format!("{x:02x}")).collect()
}

fn main() {
    let out = std::env::args().nth(1).expect("output directory");
    let secret: Vec<u8> = (0u8..32).flat_map(|b| format!("{b:02x}").into_bytes()).collect();
    std::fs::write(format!("{out}/pass"), [secret.as_slice(), b"\n"].concat()).unwrap();
    let time = 1_761_177_600_000_000_000; // 2025-10-23T00:00:00Z
    let data = contents(7);
    let empty = Tree::new();
    let (small, small_m) = tree(&data, 11, 40);
    let (wide, wide_m) = tree(&data, 12, 700);
    let (widest, widest_m) = tree(&data, 13, 3000);
    for (name, m) in [("tree-8m", &small_m), ("tree-32m", &wide_m), ("tree-1g", &widest_m)] {
        std::fs::write(format!("{out}/{name}.manifest"), m.join("\n") + "\n").unwrap();
    }
    let dirs_only = {
        let mut t = Tree::new();
        let mut at = Tree::ROOT;
        for i in 0..12 {
            at = t.dir(at, format!("d{i}").as_bytes(), Meta { perm: 0o700, uid: 1000, gid: 1000 }).unwrap();
        }
        t
    };
    for (name, size, enc, seed, tree) in [
        ("root-32m", 32u64 << 20, false, 1u64, &empty),
        ("root-1g", 1 << 30, false, 2, &empty),
        ("data-64m", 64 << 20, true, 3, &empty),
        ("data-1g", 1 << 30, true, 4, &empty),
        ("tree-8m", 8 << 20, false, 5, &small),
        ("tree-32m", 32 << 20, false, 6, &wide),
        ("tree-1g", 1 << 30, false, 7, &widest),
        ("dirs-data-64m", 64 << 20, true, 8, &dirs_only),
    ] {
        let dev = Bytes::new(vec![0u8; size as usize]);
        let encryption = enc.then(|| Encryption { passphrase: &secret, kdf: MIN_KDF });
        let options = Options { label: name.as_bytes(), time, encryption };
        block_on_ready(mkfs(&dev, &options, tree, &mut Seeded(seed))).unwrap();
        let v = match enc {
            true => block_on_ready(Volume::unlock(&dev, &secret, toyos_crypto::scrypt::Limits { memory: 1 << 20, work: 1 << 20 })).unwrap(),
            false => block_on_ready(Volume::open(&dev)).unwrap(),
        };
        let findings = block_on_ready(fsck(&v)).unwrap();
        assert!(findings.is_empty(), "{name}: {findings:?}");
        std::fs::write(format!("{out}/{name}.img"), &*dev.get()).unwrap();
        println!("{name}.img {size} bytes, seed {seed}, encrypted {enc}, ToyOS fsck clean");
    }
}
