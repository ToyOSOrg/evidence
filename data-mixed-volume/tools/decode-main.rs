// Decode the T14 DATA evidence with lib/bcachefs. Blocks not in the evidence
// are refused, so the library names the block it needs.
use bcachefs::*;
use std::collections::BTreeMap;

struct Sparse { blocks: BTreeMap<u64, Vec<u8>>, count: u64, misses: std::cell::RefCell<Vec<u64>> }
impl BlockIO for Sparse {
    fn read_block(&self, b: BlockNum, buf: &mut BlockBuf) -> Result<(), DeviceError> {
        match self.blocks.get(&b.raw()) {
            Some(d) => { buf.0.copy_from_slice(d); Ok(()) }
            None => { self.misses.borrow_mut().push(b.raw()); Err(DeviceError::classify(&Miss)) }
        }
    }
    fn write_block(&self, _: BlockNum, _: &BlockBuf) -> Result<(), DeviceError> { panic!("read-only") }
    fn block_count(&self) -> u64 { self.count }
}
struct Miss;
impl TransferError for Miss { fn refused_before_attempt(&self) -> bool { false } }

fn main() {
    let args: Vec<String> = std::env::args().collect();
    let count: u64 = args[1].parse().unwrap();
    let mut blocks = BTreeMap::new();
    // args: count front.bin last.bin [extra files named <startblock>.bin]
    let front = std::fs::read(&args[2]).unwrap();
    for (i, c) in front.chunks(4096).enumerate() { blocks.insert(i as u64, c.to_vec()); }
    blocks.insert(count - 1, std::fs::read(&args[3]).unwrap());
    for extra in &args[4..] {
        let start: u64 = std::path::Path::new(extra).file_stem().unwrap().to_str().unwrap().parse().unwrap();
        let d = std::fs::read(extra).unwrap();
        for (i, c) in d.chunks(4096).enumerate() { blocks.insert(start + i as u64, c.to_vec()); }
    }
    let mut b0 = BlockBuf::zeroed();
    b0.0.copy_from_slice(&blocks[&0]);
    println!("primary: {:?}", Superblock::parse(&b0));
    let mut bl = BlockBuf::zeroed();
    bl.0.copy_from_slice(&blocks[&(count - 1)]);
    println!("backup : {:?}", Superblock::parse(&bl));
    println!("copies identical: {}", blocks[&0] == blocks[&(count - 1)]);
    let io = Sparse { blocks, count, misses: Default::default() };
    let fs = match Mounted::<_, ReadWrite>::open(io) {
        Ok(fs) => fs,
        Err(e) => { println!("open: {e:?}"); return; }
    };
    println!("open ok, free_bytes {}", fs.free_bytes());
    let r = fs.list(usize::MAX, &|_| true);
    match &r {
        Ok(v) => { println!("list: {} names", v.len()); for (n, rec) in v { println!("  {n} {rec:?} {:?}", fs.file_extents(n).ok().flatten().map(|(e,_)| e.iter().map(|e|(e.start_block,e.block_count)).collect::<Vec<_>>())); } }
        Err(e) => println!("list: {e:?}"),
    }
    println!("misses: {:?}", fs.io().misses.borrow());
}
