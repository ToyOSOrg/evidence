
#[cfg(test)]
mod probe {
    use super::*;
    use crate::volume::{OpenHow, Volume};
    use std::cell::RefCell;
    use std::rc::Rc;
    use toyos_blockdev::{Block, BlockDev, Bytes, BLOCK};
    struct Count { image: Bytes<Vec<u8>>, log: Rc<RefCell<(u32, u32)>> }
    impl BlockDev for Count {
        fn blocks(&self) -> u64 { self.image.blocks() }
        async fn read(&self, lba: u64, out: &mut [Block]) -> Result<(), toyos_blockdev::Error> { self.image.read(lba, out).await }
        async fn write(&self, lba: u64, data: &[Block]) -> Result<(), toyos_blockdev::Error> { self.log.borrow_mut().0 += 1; self.image.write(lba, data).await }
        async fn flush(&self) -> Result<(), toyos_blockdev::Error> { self.log.borrow_mut().1 += 1; self.image.flush().await }
    }
    impl crate::cache::Disk for Count {}
    #[path = "<worktree>/lib/fat32/check/tests/common/mod.rs"]
    mod spec_volume;
    #[test]
    fn probe_counts() {
        const CREATE: OpenHow = OpenHow { create: true, create_new: false, truncate: false };
        let spec = spec_volume::fixture();
        let mut image = spec.bytes.clone();
        image.resize(spec.bytes.len().div_ceil(BLOCK) * BLOCK, 0);
        let log = Rc::new(RefCell::new((0, 0)));
        let mut v = FatVolume::mount(Count { image: Bytes::new(image), log: Rc::clone(&log) }, true, || 1_717_245_296_000_000_000).unwrap();
        let a = v.open("a.txt", CREATE).unwrap();
        let b = v.open("b.txt", CREATE).unwrap(); // a second open file, as logkeeper's is
        v.write(a, 0, &[1; 1 << 20]).unwrap();
        v.write(b, 0, &[1; 3000]).unwrap();
        v.sync().unwrap();
        let mut step = |name: &str, f: &mut dyn FnMut(&mut FatVolume<Count>)| {
            let before = *log.borrow();
            f(&mut v);
            let after = *log.borrow();
            println!("PROBE {name}: writes={} flushes={}", after.0 - before.0, after.1 - before.1);
        };
        step("clean_fsync", &mut |v| { v.sync().unwrap(); });
        step("overwrite_4k_fsync", &mut |v| { v.write(a, 0, &[2; 4096]).unwrap(); v.sync().unwrap(); });
        let mut end = (1u64 << 20) + 0;
        step("append_4k_fsync", &mut |v| { v.write(a, end, &[3; 4096]).unwrap(); end += 4096; v.sync().unwrap(); });
    }
}
