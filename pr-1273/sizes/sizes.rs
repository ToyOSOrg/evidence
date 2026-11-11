#![allow(dead_code)]
use std::collections::BTreeMap;
struct Object { id: u32, anonymous: bool, size: u64, gone: bool, head: u32, pages: usize, version: u64, writing: u32, held: bool }
struct Entry { object: Object, refs: u32, holders: u32, owned: bool, no_holders: bool }
#[derive(Clone, Copy)] struct State { dirty: bool, writeback: bool, write_pins: u16, pinned_since_begin: bool }
struct Slot { object: u32, page: u64, frame: Option<u64>, state: State, prev: u32, next: u32 }
#[derive(Clone, Copy)] enum Kind { File, Dir, Symlink }
#[derive(Clone, Copy)] struct Meta { kind: Kind, size: u64, mtime: u64 }
struct Inode { meta: Meta, target: Option<String>, children: BTreeMap<String, u64>, opens: usize, linked: bool }
struct File { object: u64, node: u64, opens: u32, held: bool, dirty: Option<(u64, u64)>, used: u64, anonymous: bool }
fn main() {
    println!("Object {} Entry {} Option<Entry> {} Slot {} Option<Slot> {}", size_of::<Object>(), size_of::<Entry>(), size_of::<Option<Entry>>(), size_of::<Slot>(), size_of::<Option<Slot>>());
    println!("Inode {} File {} Option<Box<Entry>> {}", size_of::<Inode>(), size_of::<File>(), size_of::<Option<Box<Entry>>>());
    let frames: u64 = 3_905_302_528 / 4096;
    let share = frames / 8;
    let small = (16u64 << 20) / 4096;
    let capacity = (share.saturating_sub(2 * small) / 2).max(small);
    let objects = (capacity / 16).clamp(1024, 64 * 1024);
    println!("frames {frames} share {share} capacity {capacity} objects {objects} bytes/object-of-RAM {}", 3_905_302_528u64 / objects);
    let slot_table = objects as usize * (size_of::<Option<Entry>>() + 4);
    println!("object table bytes {slot_table} per object {}", slot_table / objects as usize);
    let width = (capacity as usize * 2).next_power_of_two();
    let index = capacity as usize * (size_of::<Option<Slot>>() + 4) + width * 4;
    println!("page index bytes {index}");
}
