use std::alloc::{GlobalAlloc, Layout, System};
use std::sync::atomic::{AtomicU64, Ordering::Relaxed};
struct Counting;
static ALLOCS: AtomicU64 = AtomicU64::new(0);
static FREES: AtomicU64 = AtomicU64::new(0);
unsafe impl GlobalAlloc for Counting {
    unsafe fn alloc(&self, l: Layout) -> *mut u8 { ALLOCS.fetch_add(1, Relaxed); unsafe { System.alloc(l) } }
    unsafe fn dealloc(&self, p: *mut u8, l: Layout) { FREES.fetch_add(1, Relaxed); unsafe { System.dealloc(p, l) } }
    unsafe fn realloc(&self, p: *mut u8, l: Layout, n: usize) -> *mut u8 { ALLOCS.fetch_add(1, Relaxed); FREES.fetch_add(1, Relaxed); unsafe { System.realloc(p, l, n) } }
}
#[global_allocator]
static A: Counting = Counting;
fn rust_corpus() -> String {
    let mut out = String::new();
    for i in 0..400u64 {
        let (c, k) = (i * 7919 % 1000, i * 104_729 % 997 + 3);
        if i % 10 == 0 {
            out.push_str(&format!(
                "pub struct S{i} {{ pub a: u64, b: Vec<u32>, c: Option<Box<S{i}>> }}\n\
                 impl S{i} {{ pub fn get(&self) -> u64 {{ self.a + self.b.len() as u64 }} }}\n"
            ));
        }
        let tail = if i == 0 { "x".to_string() } else { format!("f{}(x, &b[1..])", i - 1) };
        out.push_str(&format!(
            "fn f{i}(a: u64, b: &[u32]) -> u64 {{\n    let mut x = a ^ {c};\n    \
             for (j, v) in b.iter().enumerate() {{\n        if *v as u64 > x {{ x = x.wrapping_mul({k}).wrapping_add(j as u64); }}\n        \
             else {{ x ^= (*v as u64) << (j % 7); }}\n    }}\n    \
             match x % 3 {{ 0 => x, 1 => x / 2 + {c}, _ => {tail} }}\n}}\n"
        ));
    }
    out
}


fn main() {
    let rust = rust_corpus();
    let (a0, f0) = (ALLOCS.load(Relaxed), FREES.load(Relaxed));
    let file = syn::parse_file(&rust).unwrap();
    let n = file.items.len();
    drop(file);
    println!("corpus_bytes={} items={n} allocs_per_unit={} frees_per_unit={}", rust.len(), ALLOCS.load(Relaxed) - a0, FREES.load(Relaxed) - f0);
}
