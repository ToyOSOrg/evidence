
    #[test]
    fn probe_shrink_stopped_after_any_block_write() {
        const CREATE: OpenHow = OpenHow { create: true, create_new: false, truncate: false };
        const OPEN: OpenHow = OpenHow { create: false, create_new: false, truncate: false };
        let clock = || 1_717_245_296 * NANOS_PER_SEC;
        let spec = spec_volume::fixture();
        let blocks = spec.bytes.len().div_ceil(BLOCK);
        let mut image = spec.bytes.clone();
        image.resize(blocks * BLOCK, 0);
        let disk = |trace: &[(u64, Vec<u8>)]| {
            let mut ram = Ram::new(blocks as u64);
            ram.write(0, &image).unwrap();
            for (block, data) in trace { ram.write(*block, data).unwrap(); }
            ram
        };
        let writes = Rc::new(std::cell::RefCell::new(Vec::new()));
        let mut v = FatVolume::mount(Traced { ram: disk(&[]), writes: Rc::clone(&writes) }, true, clock).unwrap();
        let whole: Vec<u8> = (0..4 * BLOCK as u32).map(|i| (i % 251 + 1) as u8).collect();
        let a = v.open("a.txt", CREATE).unwrap();
        v.write(a, 0, &whole).unwrap();
        assert_eq!(v.sync(), Ok(Vec::new()));
        let synced = writes.borrow().len();
        v.truncate(a, 100).unwrap();
        assert_eq!(v.sync(), Ok(Vec::new()));
        let trace = writes.borrow().clone();
        for stop in synced..=trace.len() {
            let mut after = FatVolume::mount(disk(&trace[..stop]), false, clock).unwrap();
            let n = after.open("a.txt", OPEN).unwrap();
            let size = after.lstat("a.txt").unwrap().size as usize;
            let mut out = vec![0u8; size];
            let read = after.read(n, 0, &mut crate::volume::Buf(&mut out));
            println!("PROBE stop {stop} of {}: size {size} read {read:?} prefix-ok {}", trace.len(), read == Ok(size) && out[..] == whole[..size]);
        }
    }
