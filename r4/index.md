# pr-1237 r4: rebased onto main 75bdec3cd (#1259), head 5f0467f28

Conflicts with #1259 in `sdk/toyos/src/dl/image/tests.rs` (the test module's import), `tests/images/virtjobcase.toml`
(the job list) and `tests/toyos.rs` (`DRIVEN_AND_SHARED`, the `VIRT_*` constants, `VIRT_JOBS`, `extra_root_files`):
each resolved so both hold, `vm_map_shares` before `relro_sealed` wherever both are listed.

What #1237 adds and removes, compared with `git diff -U0` before (422915e2c..61007d23a) and after (75bdec3cd..5f0467f28):
- `sdk/toyos/src/dl/mod.rs`, `sdk/toyos/src/dl/image/mod.rs`: the same 70 lines;
- `tests/guest/` (`relro_sealed`): the same 82 lines;
- `docs/`, `issues/`: the same 31 lines;
- differing only where both sides hold: the test module's import (`FilePages` beside `executable_relro`), the job case's
  `args` and `extra_root_files` (`vm_map_shares` beside `relro_sealed`). No SDK production code changes, so guest run
  43093182539 at 61007d23a stands; branch `executable-relro-read-only-run43093182539` holds 61007d23a until it ends.

Composition with #1259's mapping, by its code:
- A program's segment is ROOT's shared pages only where `program::lay_out`'s source is immutable and
  `Segment::is_file_pages` holds, which requires the segment not be writable. RELRO lies in a writable `PT_LOAD`
  (its relocations write it), so its pages stay the child's private copy, as before; `seal`'s `SYS_VM_PROTECT` changes
  only those. A library's (`dl::lay`) keeps the further test that no page in the writable window is mapped.
- `program::lay_out` refuses two `PT_LOAD`s sharing a page (`overlapping_load_pages`), so RELRO's whole pages are never
  a shared segment's page. The header page `seal` reads may now be ROOT's shared page; it only reads it.
- #1259 does not change `SYS_VM_PROTECT`.

| File | Command | Revision | Exit |
|---|---|---|---|
| `host/checks.log` | `cargo test -p toyos --lib dl`; `cargo test --test toyos-checks`; `cargo clippy -p toyos --all-targets` and `cargo clippy -p toyos-build --all-targets`, adopted lints and `-D warnings` | 5f0467f28 | 0 each: 23 passed; 52 passed |
| `host/range-diff.txt` | `git range-diff 422915e2c..61007d23a 75bdec3cd..5f0467f28` | | the resolved hunks only |

Host paths, user and host names are masked.
