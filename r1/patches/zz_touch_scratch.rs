//! SCRATCH, not for commit: first-touch and realloc timings for a local A/B.

use std::alloc::{alloc, dealloc, realloc, Layout};
use std::time::Instant;

use toyos_abi::syscall::{self, VmAt, VmProt};

const MIB: usize = 1 << 20;
const PAGE: usize = 4096;

fn median(mut v: Vec<u64>) -> u64 {
    v.sort_unstable();
    v[v.len() / 2]
}

fn touch(len: usize, stride: usize) -> (u64, u64) {
    let t = Instant::now();
    let ptr = unsafe { syscall::vm_reserve(len, VmProt::ReadWrite, VmAt::ANYWHERE) }.expect("reserve");
    let mapped = t.elapsed().as_nanos() as u64;
    let t = Instant::now();
    for page in (0..len / PAGE).step_by(stride) {
        unsafe { ptr.add(page * PAGE).write_volatile(1) };
    }
    let touched = t.elapsed().as_nanos() as u64;
    let t = Instant::now();
    unsafe { syscall::vm_release(ptr, len) }.expect("release");
    let total = mapped + touched + t.elapsed().as_nanos() as u64;
    let n = (len / PAGE / stride) as u64;
    (touched / n, total / n)
}

fn realloc_grow() -> (u64, u64) {
    let mut size = MIB;
    let mut ptr = unsafe { alloc(Layout::from_size_align(size, 16).unwrap()) };
    unsafe { std::ptr::write_bytes(ptr, 0x33, MIB) };
    let (mut total, mut last) = (0, 0);
    while size < 256 * MIB {
        let t = Instant::now();
        ptr = unsafe { realloc(ptr, Layout::from_size_align(size, 16).unwrap(), size * 2) };
        last = t.elapsed().as_nanos() as u64;
        total += last;
        assert!(!ptr.is_null());
        assert_eq!(unsafe { *ptr.add(MIB - 1) }, 0x33);
        size *= 2;
    }
    unsafe { dealloc(ptr, Layout::from_size_align(size, 16).unwrap()) };
    (total, last)
}

fn main() {
    for (name, stride) in [("seq", 1usize), ("stride16", 16), ("stride2", 2)] {
        touch(64 * MIB, stride);
        let r: Vec<(u64, u64)> = (0..10).map(|_| touch(64 * MIB, stride)).collect();
        println!(
            "zz-touch {name}: touch p50={} ns/page total p50={} ns/page",
            median(r.iter().map(|x| x.0).collect()),
            median(r.iter().map(|x| x.1).collect())
        );
    }
    realloc_grow();
    let r: Vec<(u64, u64)> = (0..5).map(|_| realloc_grow()).collect();
    println!(
        "zz-touch realloc: total p50={} ns last p50={} ns",
        median(r.iter().map(|x| x.0).collect()),
        median(r.iter().map(|x| x.1).collect())
    );
}
