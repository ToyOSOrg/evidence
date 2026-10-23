#[cfg(test)]
mod speed {
    use super::*;
    use crate::volume::Buf;
    use bcachefs::engine::{Meta as Owner, Options, Tree};
    #[derive(Clone)]
    struct Fixed(u8);
    impl toyos_crypto::Random for Fixed {
        fn fill(&mut self, out: &mut [u8]) -> Result<(), toyos_crypto::Error> { for b in out { self.0 = self.0.wrapping_mul(13).wrapping_add(7); *b = self.0; } Ok(()) }
    }
    #[test]
    fn speed() {
        let data: Vec<u8> = (0..32usize << 20).map(|i| (i % 253) as u8).collect();
        let mut tree = Tree::new();
        tree.file(Tree::ROOT, b"f", &data, Owner { perm: 0o644, uid: 0, gid: 0 }).unwrap();
        let o = Options { label: b"", time: 0, encryption: None };
        let blocks = engine::fit(&o, &tree, &Fixed(1)).unwrap();
        let dev = toyos_blockdev::Bytes::new(vec![0u8; blocks as usize * BLOCK]);
        block_on_ready(engine::mkfs(&dev, &o, &tree, &mut Fixed(1))).unwrap();
        let mut v = RootVolume::mount(Box::leak(dev.into_inner().into_boxed_slice())).unwrap();
        let node = v.open("f", OpenHow { create: false, create_new: false, truncate: false }).unwrap();
        for chunk in [4096usize, 65536, 1 << 20] {
            let t = std::time::Instant::now();
            let mut buf = vec![0u8; chunk];
            let mut off = 0u64;
            while off < data.len() as u64 { off += v.read(node, off, &mut Buf(&mut buf)).unwrap() as u64; }
            let s = t.elapsed().as_secs_f64();
            eprintln!("SPEED chunk {chunk}: {:.1} MB/s", 32.0 * 1.048576 / s);
        }
    }
}
