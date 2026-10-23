//! `b4-manifest <bootable.img> <out.img> <out.manifest>`: the marked... the first
//! TOYOS-ROOT partition's bytes, and every path as the engine's reader sees it,
//! in the judge script's manifest form.
use bcachefs::engine::{DirentType, Volume};
use sha2::{Digest, Sha256};
use toyos_blockdev::{block_on_ready, ReadOnlyBytes};

fn hex(b: &[u8]) -> String { b.iter().map(|b| format!("{b:02x}")).collect() }

fn main() {
    let a: Vec<String> = std::env::args().collect();
    let disk = std::fs::read(&a[1]).unwrap();
    // GPT entries at LBA 2, 128 bytes each; TOYOS-ROOT by name "ToyOS root A".
    let mut root = None;
    for i in 0..16 {
        let e = &disk[1024 + i * 128..1024 + (i + 1) * 128];
        let name: String = e[56..].chunks(2).map(|c| u16::from_le_bytes([c[0], c[1]])).take_while(|&u| u != 0).filter_map(|u| char::from_u32(u as u32)).collect();
        if name == "ToyOS root A" {
            let first = u64::from_le_bytes(e[32..40].try_into().unwrap()) as usize;
            let last = u64::from_le_bytes(e[40..48].try_into().unwrap()) as usize;
            root = Some(disk[first * 512..(last + 1) * 512].to_vec());
        }
    }
    let root = root.expect("ROOT A");
    std::fs::write(&a[2], &root).unwrap();
    let v = block_on_ready(Volume::open(ReadOnlyBytes::new(&root).unwrap())).unwrap();
    let mut out = String::new();
    let mut inos = Vec::new();
    block_on_ready(async {
        for (path, e) in v.names().await.unwrap() {
            let p = format!("./{}", String::from_utf8(path).unwrap());
            inos.push((p.clone(), e.ino));
            match e.kind {
                DirentType::Directory => out += &format!("d {p}\n"),
                DirentType::Symlink => out += &format!("l {} {p}\n", hex(&Sha256::digest(v.readlink(e.ino).await.unwrap()))),
                _ => {
                    let size = v.inode(e.ino).await.unwrap().size as usize;
                    let mut b = vec![0u8; size];
                    v.read(e.ino, 0, &mut b).await.unwrap();
                    out += &format!("f {} {p}\n", hex(&Sha256::digest(&b)));
                }
            }
        }
    });
    std::fs::write(&a[3], out).unwrap();
    inos.sort();
    let sorted = inos.iter().enumerate().all(|(i, (_, ino))| *ino == (1u64 << 31) + i as u64);
    eprintln!("{} bytes, {} paths, inodes in sorted path order from 2^31: {sorted}", root.len(), inos.len());
}
