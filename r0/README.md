# PR #1141 r0: host CI, QEMU members, negative controls, the staged metal A/B

Commits: 06238ef4d (osbench row, the A/B base), e431a5bf9 (atomic holder reads), b4edede36 (per-file fsync, PR head).

- `host.log`: `cargo run -- --ci host` at b4edede36 (`host.rev`), rc=0, "108 step(s), all green".
- `qemu/`: `qemu-members.sh` (the testcases boot under `--debug`, x86_64 QEMU on the macOS host) at b4edede36 with a clean tree (`q2.rev`), rc=0. Each member's result is in its `.txt` file. `a_served_files_read_never_tears_against_its_write`: 1280 reads, 215 generations met, none torn.
- `qemu/control-G1/`: the same boot, with the kernel's holder-read validation removed (`unwritten` answers true). The member is red: "read 12 is torn: generation 2 to byte 159744, then generation 3", exit 101.
- `controls/`: C1-C7 ran on the tree before the commits were reordered. Every file they touch is byte-identical at b4edede36, which `git diff` against that tree shows: only `kernel/src/object/paged.rs`'s read changed since, and only G1 depends on it. Every mutation was applied by `mutate.py`, which replaces exactly one site, runs the command, then restores and verifies the file byte for byte. Every control built and went red:

| control | site | mutation | test | result |
|---|---|---|---|---|
| C1 | `pages.rs` `Files::fsync` | drop `volume.carried(f.node)` from the files written back | `pages::tests::an_fsync` | red: the carried file reads 12288 bytes, not its own (the stale blocks) |
| C2 | `pages.rs` `Files::fsync` | also sync the whole volume (the old FSYNC) | `pages::tests::an_fsync` | red: the other file's overwrite was written back |
| C3 | `data.rs` `commit` | persist no carried entry | `pages::tests::an_fsync` | red: the carried file reads 0 bytes |
| C4 | `pages.rs` `Files::write` | never `end_write` | `a_write_of_many_calls` | red: the write was left under way |
| C5 | `kernel/pure/paged.rs` `write_end` | a short call never holds | `paged::tests` | red |
| C6 | `kernel/pure/paged.rs` `read_begin` | ignores a write under way | `paged::tests` | red |
| C7 | `kernel/pure/paged.rs` `resize` | moves no version | `paged::tests` | red |
| G1 | `kernel/src/object/paged.rs` `unwritten` | always true | guest member | red (above) |

- `metal-staged/`: the rules set before any boot (`rules.md`), the request, and the image hashes. Not run.
