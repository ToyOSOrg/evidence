//! Scratch profiling harness (not committed): each osbench files row's volume
//! calls, in the order `src/main.rs` makes them, against DATA over memory.
use std::time::Instant;

use fileserver::data::DataVolume;
use fileserver::ram::Ram;
use fileserver::resolve::{self, Found, Resolved};
use fileserver::volume::{Buf, Kind, OpenHow, Volume};

fn clock() -> u64 { 1 }

const CREATE: OpenHow = OpenHow { create: true, create_new: false, truncate: true };
const PLAIN: OpenHow = OpenHow { create: false, create_new: false, truncate: false };

fn resolve(v: &mut DataVolume<Ram>, rel: &str, follow: bool) -> String {
    let mut lookup = |p: &str| match v.lstat(p) {
        Ok(meta) if meta.kind == Kind::Symlink => v.read_link(p).map(Found::Link).map_err(drop),
        Ok(_) | Err(toyos::fs::Error::NotFound) => Ok(Found::Other),
        Err(_) => Err(()),
    };
    match resolve::resolve("home", "home", rel, follow, &mut lookup).unwrap() {
        Resolved::Path(p) => p,
        Resolved::Absolute(_) => unreachable!(),
    }
}

fn time(name: &str, n: usize, mut f: impl FnMut(usize)) {
    for i in 0..n / 10 { f(i); }
    let t = Instant::now();
    for i in 0..n { f(i); }
    println!("{name:24} {:>10.0} ns", t.elapsed().as_nanos() as f64 / n as f64);
}

#[test]
#[ignore]
fn profile() {
    let mut v = DataVolume::format(Ram::new(1 << 18), &["home", "apps", "config", "state"], clock).unwrap();
    v.mkdir("home/osb").unwrap();
    let n = v.open("home/osb/small", CREATE).unwrap();
    v.write(n, 0, &[1; 4096]).unwrap();
    v.close(n).unwrap();
    // Give the tree the rest of a populated DATA: a few hundred names elsewhere.
    for i in 0..300 {
        let n = v.open(&format!("apps/pkg{}/file{i}", i % 10), CREATE).unwrap();
        v.write(n, 0, &[2; 100]).unwrap();
        v.close(n).unwrap();
    }
    v.sync().unwrap();

    time("open_close", 2000, |_| {
        let p = resolve(&mut v, "osb/small", true);
        v.lstat(&p).unwrap();
        let node = v.open(&p, PLAIN).unwrap();
        v.node_meta(node).unwrap();
        v.identity(&p).unwrap();
        v.close(node).unwrap();
    });
    time("stat", 2000, |_| {
        let p = resolve(&mut v, "osb/small", true);
        v.lstat(&p).unwrap();
        v.identity(&p).unwrap();
    });
    time("create_write_unlink", 1000, |_| {
        let p = resolve(&mut v, "osb/fresh", true);
        let _ = v.lstat(&p);
        let node = v.open(&p, CREATE).unwrap();
        v.node_meta(node).unwrap();
        v.identity(&p).unwrap();
        v.write(node, 0, &[7; 100]).unwrap();
        v.close(node).unwrap();
        let p = resolve(&mut v, "osb/fresh", false);
        v.unlink(&p).unwrap();
    });
    let big = v.open("home/osb/big", CREATE).unwrap();
    for i in 0..16 { v.write(big, i << 20, &vec![3u8; 1 << 20]).unwrap(); }
    let mut buf = vec![0u8; 4096];
    time("read_4k_at", 2000, |i| {
        v.node_meta(big).unwrap(); // seek
        v.read(big, ((i * 7919) % 4096) as u64 * 4096, &mut Buf(&mut buf)).unwrap();
    });
    time("write_4k_at", 2000, |i| {
        v.write(big, ((i * 7919) % 4096) as u64 * 4096, &buf).unwrap();
    });
    v.close(big).unwrap();
    let p = resolve(&mut v, "osb/big", false);
    v.unlink(&p).unwrap();

    for i in 0..1000 {
        let n = v.open(&format!("home/osb/listed/entry-{i:04}"), CREATE).unwrap();
        v.close(n).unwrap();
    }
    time("readdir.1000", 20, |_| {
        let p = resolve(&mut v, "osb/listed", true);
        v.lstat(&p).unwrap();
        v.identity(&p).unwrap();
        let l = v.list(&p).unwrap();
        assert_eq!(l.len(), 1000);
    });
    for i in 0..1000 {
        v.unlink(&format!("home/osb/listed/entry-{i:04}")).unwrap();
    }
    let n = v.open("home/osb/a", CREATE).unwrap();
    v.close(n).unwrap();
    time("rename", 2000, |i| {
        let (a, b) = if i % 2 == 0 { ("osb/a", "osb/b") } else { ("osb/b", "osb/a") };
        let from = resolve(&mut v, a, false);
        let to = resolve(&mut v, b, false);
        v.rename(&from, &to).unwrap();
    });
    time("mkdir_rmdir", 1000, |_| {
        let p = resolve(&mut v, "osb/sub", false);
        v.mkdir(&p).unwrap();
        let p = resolve(&mut v, "osb/sub", false);
        v.rmdir(&p).unwrap();
    });
    println!("{}", v.describe());
}

#[test]
#[ignore]
fn stat_loop() {
    let mut v = DataVolume::format(Ram::new(1 << 18), &["home", "apps", "config", "state"], clock).unwrap();
    let n = v.open("home/osb/small", CREATE).unwrap();
    v.write(n, 0, &[1; 4096]).unwrap();
    v.close(n).unwrap();
    for i in 0..300 {
        let n = v.open(&format!("apps/pkg{}/file{i}", i % 10), CREATE).unwrap();
        v.close(n).unwrap();
    }
    let t = Instant::now();
    while t.elapsed().as_secs() < 4 {
        let p = resolve(&mut v, "osb/small", true);
        v.lstat(&p).unwrap();
        v.identity(&p).unwrap();
    }
}

#[test]
#[ignore]
fn rename_loop() {
    let mut v = DataVolume::format(Ram::new(1 << 18), &["home", "apps", "config", "state"], clock).unwrap();
    for i in 0..300 {
        let n = v.open(&format!("apps/pkg{}/file{i}", i % 10), CREATE).unwrap();
        v.close(n).unwrap();
    }
    let n = v.open("home/osb/a", CREATE).unwrap();
    v.close(n).unwrap();
    let t = Instant::now();
    let mut i = 0;
    while t.elapsed().as_secs() < 4 {
        let (a, b) = if i % 2 == 0 { ("home/osb/a", "home/osb/b") } else { ("home/osb/b", "home/osb/a") };
        v.rename(a, b).unwrap();
        i += 1;
        if i % 500 == 0 { v.sync().unwrap(); }
    }
}
