# pr-1273, round 2: the marked list, its controls, and a slot's size

## The slot

`../sizes/slot.rs` replicates the layouts of the pager's `Entry` (once its `no_holders` flag is gone), the slot table's `Mark`, and `Slot<Entry>`, with the same field types. Built with `rustc -O --edition 2024 slot.rs` on the host. Its output, in `../sizes/slot.txt`:

- an entry is 56 bytes and a mark 12, so a slot is 72;
- a piece of 256 slots is 18,432 bytes.

## Negative controls

Each mutation was applied as a checked patch, built, and run; then the file was put back (touched, so cargo rebuilt it) and run again, in the same session.

| control | patch | test | mutated | restored |
|---|---|---|---|---|
| `negctl-m1` | `negctl-m1.patch`: `unmark` leaves the next marked slot's back-link stale | `cargo test -p kernel --lib slots` | exit 101: `a_marked_slot_is_taken_once_unless_unmarked_or_removed_first` panics, the list naming a slot that is not marked | exit 0 |
| `negctl-m2` | `negctl-m2.patch`: `Files::opened` never applies its count | `cargo test --manifest-path system/fileserver/Cargo.toml a_disk_volume_keeps` | exit 101 | exit 0 |

m1's log also holds a first restored run that still failed. The restore had put the file back with its older mtime, so cargo ran the mutated build again. The touched rerun is the last section of that log.

m1 was run at the tree that became `47d8525a2`. m2 was run on round 2's tree before its commit; its test is new in round 2.

## Logs at 47d8525a2

| file | command | exit |
|---|---|---|
| `kernel-slots-test-3.log` | `cargo test -p kernel --lib slots` | 0 |
| `toyos-checks-2.log` | `cargo test --test toyos-checks` | 0 |
| `build-only-4.log` | `cargo run -- --build-only` | 0 |
