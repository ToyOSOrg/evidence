#![allow(dead_code)]
struct Object { id: u32, anonymous: bool, size: u64, gone: bool, head: u32, pages: usize, version: u64, writing: u32, held: bool }
struct Entry { object: Object, refs: u32, holders: u32, owned: bool }
#[derive(Clone, Copy)] enum Mark { Off, On { prev: u32, next: u32 } }
enum Slot<T> { Free(u32), Held(T, Mark) }
fn main() {
    println!("Entry {} Mark {} Slot<Entry> {} piece(256) {}", size_of::<Entry>(), size_of::<Mark>(), size_of::<Slot<Entry>>(), 256 * size_of::<Slot<Entry>>());
}
