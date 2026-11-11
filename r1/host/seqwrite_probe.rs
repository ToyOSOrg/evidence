//! SCRATCH PROBE, not for landing: `persist.seq_write_fsync`'s calls as the
//! DATA volume receives them, over a device that records every request.

use std::cell::RefCell;
use std::time::Instant;

use fileserver::cache::Disk;
use fileserver::data::{DataVolume, Probed};
use fileserver::ram::Ram;
use fileserver::volume::{OpenHow, Volume};
use toyos_blockdev::{Block, BlockDev, Error, SharedBlock};

const MIB: usize = 1 << 20;
const CREATE_TRUNC: OpenHow = OpenHow { create: true, create_new: false, truncate: true };
const ROOTS: [&str; 4] = ["apps", "config", "home", "state"];
/// 16 GiB, sparse: buckets of 2 MiB as on the benches' DATA.
const BLOCKS: u64 = 1 << 22;

#[derive(Clone, Copy, Debug, PartialEq)]
enum Op {
    Read(u64, usize),
    /// Past the cache: file data.
    Data(u64, usize),
    /// A cache flush's run: the volume's structures.
    Meta(u64, usize),
    Flush,
}

struct Model {
    ram: Ram,
    ops: RefCell<Vec<Op>>,
}

impl BlockDev for Model {
    fn blocks(&self) -> u64 {
        self.ram.blocks()
    }
    async fn read(&self, lba: u64, out: &mut [Block]) -> Result<(), Error> {
        self.ops.borrow_mut().push(Op::Read(lba, out.len()));
        self.ram.read(lba, out).await
    }
    async fn write(&self, lba: u64, data: &[Block]) -> Result<(), Error> {
        self.ops.borrow_mut().push(Op::Data(lba, data.len()));
        self.ram.write(lba, data).await
    }
    async fn flush(&self) -> Result<(), Error> {
        self.ops.borrow_mut().push(Op::Flush);
        Ok(())
    }
}

impl Disk for &Model {
    fn depth(&self) -> usize {
        8
    }
    async fn write_shared(&self, lba: u64, blocks: &[SharedBlock]) -> Result<(), Error> {
        self.ops.borrow_mut().push(Op::Meta(lba, blocks.len()));
        let data: Vec<Block> = blocks.iter().map(|block| ***block).collect();
        self.ram.write(lba, &data).await
    }
}

fn clock() -> u64 {
    1_793_650_328_000_000_000
}

fn summary(ops: &[Op]) -> String {
    let (mut reads, mut data, mut data_blocks, mut meta, mut meta_blocks, mut flushes) = (0, 0, 0, 0, 0, 0);
    let mut sizes = std::collections::BTreeMap::<usize, usize>::new();
    for op in ops {
        match *op {
            Op::Read(..) => reads += 1,
            Op::Data(_, n) => {
                data += 1;
                data_blocks += n;
                *sizes.entry(n).or_default() += 1;
            }
            Op::Meta(_, n) => {
                meta += 1;
                meta_blocks += n;
            }
            Op::Flush => flushes += 1,
        }
    }
    format!("reads {reads}; data writes {data} ({data_blocks} blocks, by size {sizes:?}); structure writes {meta} ({meta_blocks} blocks); flushes {flushes}")
}

#[test]
fn seq_write_fsync_as_the_device_sees_it() {
    let m = Model { ram: Ram::new(BLOCKS), ops: RefCell::default() };
    let mut stamp = [0u8; 4096];
    stamp.copy_from_slice(&bcachefs::designation(BLOCKS));
    toyos_blockdev::block_on_ready(m.ram.write(0, &[stamp])).unwrap();
    let mut v = match DataVolume::probe(&m, 16 * 1024, &ROOTS, clock) {
        Probed::Mounted(v) => *v,
        _ => panic!("DATA would not format"),
    };
    v.mkdir("home/osbench-1").unwrap();
    v.sync().unwrap();
    let chunk = vec![0x2du8; MIB];
    for round in 0..6 {
        m.ops.borrow_mut().clear();
        let t0 = Instant::now();
        let n = v.open("home/osbench-1/seq", CREATE_TRUNC).unwrap();
        let opened = (t0.elapsed(), m.ops.borrow().len());
        let t = Instant::now();
        let mut reserved = Vec::new();
        for i in 0..8 {
            let at = (i * MIB) as u64;
            let r = v.reserve(n, at, MIB as u64).unwrap();
            v.landed(n, r, at, MIB);
            reserved.push(r);
        }
        let wrote = (t.elapsed(), m.ops.borrow().len());
        let t = Instant::now();
        // `pages::Files::write_back`: 512 pages a call.
        for i in 0..4 {
            let at = (i * 2 * MIB) as u64;
            let two = [&chunk[..], &chunk[..]].concat();
            v.write_back(n, at, &two).unwrap();
        }
        let back = (t.elapsed(), m.ops.borrow().len());
        let t = Instant::now();
        v.commit(Some(n)).unwrap();
        let committed = (t.elapsed(), m.ops.borrow().len());
        v.close(n).unwrap();
        let ops = m.ops.borrow();
        println!(
            "round {round}: open+truncate {:?} ({}), reserve {:?} ({}), write-back {:?} ({}), commit {:?} ({})",
            opened.0,
            summary(&ops[..opened.1]),
            wrote.0,
            summary(&ops[opened.1..wrote.1]),
            back.0,
            summary(&ops[wrote.1..back.1]),
            committed.0,
            summary(&ops[back.1..committed.1]),
        );
        if round == 5 {
            for op in ops[back.1..committed.1].iter() {
                println!("  commit: {op:?}");
            }
            let mut last = None;
            let mut contiguous = 0;
            for op in ops[wrote.1..back.1].iter() {
                if let Op::Data(lba, n) = *op {
                    if last == Some(lba) {
                        contiguous += 1;
                    }
                    last = Some(lba + n as u64);
                }
            }
            println!("  data writes following the one before on the device: {contiguous}");
        }
    }
}
