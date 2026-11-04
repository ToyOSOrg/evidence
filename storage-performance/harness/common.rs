//! Timing harness (scratch, not committed): osbench's persist and fs.disk
//! call sequence at a tenth of its repetitions, on a sparse model of the
//! T14's DATA geometry, timed per phase.
use std::cell::Cell;
use fileserver::cache::Disk;
use fileserver::data::{DataVolume, Probed};
use fileserver::ram::Ram;
use fileserver::volume::{Buf, OpenHow, Volume, Writes};
use toyos_blockdev::{block_on_ready, Block, BlockDev, Error, BLOCK};

const MIB: usize = 1 << 20;
const CREATE: OpenHow = OpenHow { create: true, create_new: false, truncate: false };
const CREATE_TRUNC: OpenHow = OpenHow { create: true, create_new: false, truncate: true };
const PLAIN: OpenHow = OpenHow { create: false, create_new: false, truncate: false };
const ROOTS: [&str; 4] = ["apps", "config", "home", "state"];
const T14_BLOCKS: u64 = 44_564_480;

fn clock() -> u64 { 1_793_650_328_000_000_000 }

struct Model { ram: Ram, writes: Cell<u64> }
impl BlockDev for Model {
    fn blocks(&self) -> u64 { self.ram.blocks() }
    async fn read(&self, lba: u64, out: &mut [Block]) -> Result<(), Error> { self.ram.read(lba, out).await }
    async fn write(&self, lba: u64, data: &[Block]) -> Result<(), Error> { self.writes.set(self.writes.get() + data.len() as u64); self.ram.write(lba, data).await }
    async fn flush(&self) -> Result<(), Error> { Ok(()) }
}
impl Disk for &Model {}
type Vol<'a> = DataVolume<&'a Model>;

fn phase(t: &mut std::time::Instant, name: &str) {
    println!("PHASE {name:45} {:10.3} s", t.elapsed().as_secs_f64());
    *t = std::time::Instant::now();
}

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

fn osbench(m: &Model, v: &mut Vol) {
    let mut t = std::time::Instant::now();
    let d = "home/osbench-1";
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

    phase(&mut t, "persist");
    v.mkdir(d).unwrap();
    let fill: Vec<u8> = (0..MIB).map(|i| (i % 251) as u8).collect();
    put(v, &format!("{d}/small"), &fill[..4096]);
    for _ in 0..1050 {
        let n = v.open(&format!("{d}/fresh"), CREATE_TRUNC).unwrap();
        v.write(n, 0, &[7u8; 100]).unwrap();
        v.close(n).unwrap();
        v.unlink(&format!("{d}/fresh")).unwrap();
    }
    phase(&mut t, "fs.disk create-write-close-unlink x1050");
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
    phase(&mut t, "fs.disk big file random read/write");
    let listed = format!("{d}/listed");
    v.mkdir(&listed).unwrap();
    for i in 0..1000 {
        let n = v.open(&format!("{listed}/entry-{i:04}"), CREATE_TRUNC).unwrap();
        v.close(n).unwrap();
    }
    remove_all(v, &listed);
    phase(&mut t, "fs.disk 1000 entries create+remove");
    let n = v.open(&format!("{d}/a"), CREATE_TRUNC).unwrap();
    v.close(n).unwrap();
    for i in 0..2100 {
        let (from, to) = if i % 2 == 0 { ("a", "b") } else { ("b", "a") };
        v.rename(&format!("{d}/{from}"), &format!("{d}/{to}")).unwrap();
    }
    phase(&mut t, "fs.disk rename x2100");
    for _ in 0..1050 {
        v.mkdir(&format!("{d}/sub")).unwrap();
        v.rmdir(&format!("{d}/sub")).unwrap();
    }
    phase(&mut t, "fs.disk mkdir/rmdir x1050");
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
    phase(&mut t, "fs.disk tree 22x100");
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
    phase(&mut t, "fs.disk");
    v.sync().unwrap();
    phase(&mut t, "shutdown sync");
}

#[test]
fn osbench_tenth_on_t14_geometry() {
    let m = Model { ram: Ram::new(T14_BLOCKS), writes: Cell::new(0) };
    let t0 = std::time::Instant::now();
    let mut v = mount(&m);
    println!("PHASE {:45} {:10.3} s", "format+mount+history", t0.elapsed().as_secs_f64());
    let t1 = std::time::Instant::now();
    osbench(&m, &mut v);
    println!("TOTAL osbench {:.3} s, blocks written {}", t1.elapsed().as_secs_f64(), m.writes.get());
}
