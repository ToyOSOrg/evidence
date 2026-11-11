//! MEASUREMENT ONLY, never lands. The inventory at main 34cb4c918 (`old`) against the cut (`new`):
//! `diff` drives both through the same random changes and compares every answer and the whole
//! state after each; `bench` times map/unmap of one page, interleaved, and counts allocations.
extern crate alloc;
mod new;
mod old;

use std::alloc::{GlobalAlloc, Layout, System};
use std::hint::black_box;
use std::sync::atomic::{AtomicU64, Ordering::Relaxed};
use std::time::Instant;

struct Counting;
static ALLOCS: AtomicU64 = AtomicU64::new(0);
unsafe impl GlobalAlloc for Counting {
    unsafe fn alloc(&self, l: Layout) -> *mut u8 {
        ALLOCS.fetch_add(1, Relaxed);
        unsafe { System.alloc(l) }
    }
    unsafe fn dealloc(&self, p: *mut u8, l: Layout) {
        unsafe { System.dealloc(p, l) }
    }
}
#[global_allocator]
static A: Counting = Counting;

const PAGE: u64 = 4096;

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
struct Obj(u32);
impl old::Object for Obj {
    fn same(&self, o: &Self) -> bool {
        self == o
    }
}
impl new::Object for Obj {
    fn same(&self, o: &Self) -> bool {
        self == o
    }
}

/// What an entry is, independent of either module's types.
#[derive(Clone, Copy, Debug)]
enum K {
    Private(bool),
    Object(u32, u64),
    Copy(u32, u64, u64),
}

#[derive(Clone, Copy, Debug)]
enum Op {
    Place(u64, u64),
    Insert(u64, u64, u8, K),
    Remove(u64, u64),
    Update(u64, u64, u8, Option<K>),
    Queries(u64, u64),
}

macro_rules! driver {
    ($name:ident, $m:ident) => {
        mod $name {
            use super::*;
            use $m::{Entry, Inventory, Kind, Prot};
            pub type Inv = Inventory<Obj>;
            fn prot(p: u8) -> Prot {
                [Prot::None, Prot::Read, Prot::ReadWrite, Prot::ReadExec][p as usize % 4]
            }
            fn kind(k: K) -> Kind<Obj> {
                match k {
                    K::Private(c) => Kind::Private { committed: c },
                    K::Object(o, off) => Kind::Object { object: Obj(o), offset: off, max: Prot::ReadWrite },
                    K::Copy(o, off, len) => Kind::Copy { source: Obj(o), offset: off, len },
                }
            }
            pub fn new(floor: u64, top: u64) -> Inv {
                Inventory::new(floor, top)
            }
            /// Apply `op` where the module's contract allows it, and answer everything it said.
            pub fn apply(v: &mut Inv, op: Op) -> String {
                match op {
                    Op::Place(len, align) => format!("{:?}", v.place(len, align)),
                    Op::Insert(start, end, p, k) => {
                        if v.holds(start, end) && v.is_free(start, end) {
                            v.insert(start, Entry { end, prot: prot(p), kind: kind(k) });
                            "inserted".into()
                        } else {
                            "refused".into()
                        }
                    }
                    Op::Remove(start, end) => {
                        if !v.holds(start, end) {
                            return "refused".into();
                        }
                        let removed = v.remove(start, end);
                        format!("{:?}", removed.iter().map(|(s, e)| (*s, e.end, e.prot, format!("{:?}", e.kind))).collect::<Vec<_>>())
                    }
                    Op::Update(start, end, p, k) => {
                        if !(v.holds(start, end) && v.covered(start, end)) {
                            return "refused".into();
                        }
                        v.update(start, end, |s, e| {
                            e.prot = prot(p);
                            if let Some(k) = k {
                                e.kind = kind(k);
                                if let Kind::Object { offset, .. } | Kind::Copy { offset, .. } = &mut e.kind {
                                    *offset += s - start;
                                }
                            }
                        });
                        "updated".into()
                    }
                    Op::Queries(start, end) => {
                        if !v.holds(start, end) {
                            return "refused".into();
                        }
                        format!(
                            "{} {} {} {:?} {:?}",
                            v.is_free(start, end),
                            v.covered(start, end),
                            v.backed(start, end),
                            v.find(start).map(|(s, e)| (s, e.end)),
                            v.meeting(start, end).map(|(s, e)| (s, e.end)).collect::<Vec<_>>()
                        )
                    }
                }
            }
            /// Every entry and what each placement the state allows answers.
            pub fn state(v: &Inv) -> String {
                let entries: Vec<_> = v.entries().map(|(s, e)| format!("{s:#x}..{:#x} {:?} {:?}", e.end, e.prot, e.kind)).collect();
                let places: Vec<_> = [1u64, 2, 3, 5, 8, 16, 64, 300]
                    .iter()
                    .flat_map(|&n| [PAGE, 4 * PAGE, 16 * PAGE].map(move |a| (n, a)))
                    .map(|(n, a)| v.place(n * PAGE, a))
                    .collect();
                format!("{} {entries:?} {places:?}", v.len())
            }
            pub fn page(start: u64, end: u64, p: u8, k: K) -> Entry<Obj> {
                Entry { end, prot: prot(p), kind: kind(k) }
            }
        }
    };
}
driver!(dold, old);
driver!(dnew, new);

struct Rng(u64);
impl Rng {
    fn next(&mut self) -> u64 {
        self.0 ^= self.0 << 13;
        self.0 ^= self.0 >> 7;
        self.0 ^= self.0 << 17;
        self.0
    }
    fn below(&mut self, n: u64) -> u64 {
        self.next() % n
    }
}

fn op(r: &mut Rng, floor: u64, pages: u64, last: Option<(u64, u64)>) -> Op {
    let a = r.below(pages);
    let n = 1 + match r.below(4) {
        0 => r.below(2),
        1 => r.below(8),
        2 => r.below(32),
        _ => r.below(pages / 4),
    };
    let (start, end) = (floor + a * PAGE, floor + (a + n).min(pages) * PAGE);
    let p = r.below(4) as u8;
    let obj = r.below(3) as u32;
    // Kinds whose neighbours often continue each other: few objects, offsets by address.
    let k = match r.below(6) {
        0 | 1 => K::Private(p != 0),
        2 | 3 => K::Object(obj, start - floor),
        4 => K::Copy(obj, start - floor, r.below(8) * PAGE + r.below(PAGE)),
        _ => K::Object(obj, r.below(64) * PAGE),
    };
    match r.below(10) {
        0 => Op::Place(n * PAGE, [PAGE, 2 * PAGE, 16 * PAGE][r.below(3) as usize]),
        1..=3 => match last {
            // Right after the last placement, as a placed mapping is.
            Some((s, e)) if r.below(2) == 0 => Op::Insert(s, e, p, k),
            _ => Op::Insert(start, end, p, k),
        },
        4 | 5 => Op::Remove(start, end),
        6 | 7 => Op::Update(start, end, p, if r.below(2) == 0 { None } else { Some(k) }),
        _ => Op::Queries(start, end),
    }
}

fn diff(seeds: u64, rounds: u64) {
    let mut ops = 0u64;
    let mut said = std::collections::BTreeMap::<String, u64>::new();
    for seed in 1..=seeds {
        let pages = [64u64, 512, 4096][(seed % 3) as usize];
        let floor = 16 * PAGE;
        let top = floor + pages * PAGE;
        let mut r = Rng(0x9e37_79b9_7f4a_7c15 ^ seed.wrapping_mul(0x2545_f491_4f6c_dd1d));
        let (mut a, mut b) = (dold::new(floor, top), dnew::new(floor, top));
        let mut last = None;
        for round in 0..rounds {
            let o = op(&mut r, floor, pages, last);
            if let Op::Place(len, align) = o {
                last = a.place(len, align).map(|s| (s, s + len));
            }
            let (x, y) = (dold::apply(&mut a, o), dnew::apply(&mut b, o));
            assert_eq!(x, y, "seed {seed} round {round}: {o:?} answered differently");
            let what = match o {
                Op::Place(..) => if x == "None" { "place: none" } else { "place: some" },
                Op::Insert(..) => if x == "inserted" { "insert: made" } else { "insert: refused" },
                Op::Remove(..) => if x == "refused" || x == "[]" { "remove: nothing" } else { "remove: took" },
                Op::Update(..) => if x == "updated" { "update: made" } else { "update: refused" },
                Op::Queries(..) => "queries",
            };
            *said.entry(what.to_string()).or_default() += 1;
            let (x, y) = (dold::state(&a), dnew::state(&b));
            assert_eq!(x, y, "seed {seed} round {round}: after {o:?} the states differ");
            ops += 1;
        }
    }
    println!("diff: {seeds} seeds, {ops} changes, every answer and state equal: {said:?}");
}

/// A process's space as osbench's leaves it: `n` ranges, code, data, heap and objects, with gaps.
fn space<V>(n: u64, mut insert: impl FnMut(&mut V, u64, u64, u8, K), v: &mut V) {
    let mut at = 1 << 30;
    for i in 0..n {
        let len = PAGE * (1 + (i * 7919) % 300);
        let (p, k) = match i % 4 {
            // The heap first: the one-page gap best fit picks follows it.
            0 => (2, K::Private(true)),
            1 => (1, K::Object(i as u32, 0)),
            2 => (3, K::Copy(i as u32, 0, len)),
            _ => (2, K::Object(1000 + i as u32, 0)),
        };
        insert(v, at, at + len, p, k);
        at += len + PAGE * (1 + i % 5);
    }
}

fn bench() {
    for &(n, joins) in &[(16u64, true), (16, false), (64, true), (64, false), (512, true), (512, false)] {
        let (floor, top) = (16 * PAGE, 1u64 << 47);
        let mut a = dold::new(floor, top);
        let mut b = dnew::new(floor, top);
        space(n, |v: &mut dold::Inv, s, e, p, k| v.insert(s, dold::page(s, e, p, k)), &mut a);
        space(n, |v: &mut dnew::Inv, s, e, p, k| v.insert(s, dnew::page(s, e, p, k)), &mut b);
        // The page placed best-fit lands after a range of every kind in turn; `joins` makes it
        // private read-write, which continues the heap below it, else read-only, which does not.
        let p = if joins { 2 } else { 1 };
        const BATCH: u64 = 2000;
        const REPS: usize = 300;
        let mut t = [[0f64; REPS]; 4];
        let mut allocs = [0u64; 4];
        macro_rules! run {
            ($d:ident, $v:expr, $ix:expr) => {{
                let (mut ins, mut rm) = (0u128, 0u128);
                let a0 = ALLOCS.load(Relaxed);
                for _ in 0..BATCH {
                    let s0 = Instant::now();
                    let start = $v.place(PAGE, PAGE).unwrap();
                    if $v.is_free(start, start + PAGE) {
                        $v.insert(start, $d::page(start, start + PAGE, p, K::Private(true)));
                    }
                    let s1 = Instant::now();
                    black_box($v.remove(start, start + PAGE));
                    let s2 = Instant::now();
                    ins += (s1 - s0).as_nanos();
                    rm += (s2 - s1).as_nanos();
                }
                (ins as f64 / BATCH as f64, rm as f64 / BATCH as f64, ALLOCS.load(Relaxed) - a0)
            }};
        }
        for rep in 0..REPS {
            // Alternate which goes first.
            let (oi, or, oa, ni, nr, na);
            if rep % 2 == 0 {
                (oi, or, oa) = run!(dold, a, 0);
                (ni, nr, na) = run!(dnew, b, 1);
            } else {
                (ni, nr, na) = run!(dnew, b, 1);
                (oi, or, oa) = run!(dold, a, 0);
            }
            t[0][rep] = oi;
            t[1][rep] = or;
            t[2][rep] = ni;
            t[3][rep] = nr;
            allocs[0] += oa;
            allocs[2] += na;
        }
        let stat = |xs: &mut [f64; REPS]| {
            xs.sort_by(|a, b| a.partial_cmp(b).unwrap());
            (xs[0], xs[REPS / 2])
        };
        let (oi, or, ni, nr) = (stat(&mut t[0]), stat(&mut t[1]), stat(&mut t[2]), stat(&mut t[3]));
        let per = (REPS as u64 * BATCH) as f64;
        println!(
            "entries={n:3} joins={joins:5}  place+is_free+insert old {:6.1}/{:6.1}  new {:6.1}/{:6.1}   remove old {:6.1}/{:6.1}  new {:6.1}/{:6.1}   allocs/iter old {:.2} new {:.2}",
            oi.0, oi.1, ni.0, ni.1, or.0, or.1, nr.0, nr.1, allocs[0] as f64 / per, allocs[2] as f64 / per
        );
    }
    println!("(ns per call, min/median of {} batches of 2000, each call timed with one Instant pair)", 300);
}

fn main() {
    let arg = std::env::args().nth(1).unwrap_or_default();
    match arg.as_str() {
        "diff" => diff(300, 20_000),
        "diff-short" => diff(30, 5_000),
        "bench" => bench(),
        _ => {
            diff(300, 20_000);
            bench();
        }
    }
}
