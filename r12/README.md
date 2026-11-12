# PR #1269, round 12: main (#1258) merged in

All on macOS arm64.

## `sizes/`: a pager's object slot, measured by the compiler

**The probe.** `size-probe-kernel.patch` and `size-probe-mark.patch` add arrays whose length is a size. Each check fails on purpose with exit 101, and the error names the size. Each patch is applied, compiled and reverted, and the source is byte-identical afterwards (`cmp`).

**`sizes-merged.log`: `map7b-2` with main ee15a2e5b merged in.** The merge was not yet committed (`ecfb2248a` plus the merge's resolution). Its `kernel/src/object/paged.rs` and `kernel/pure/slots.rs` are the ones measured.
- For `x86_64-unknown-none` and `aarch64-unknown-none-softfloat`:
  - `Entry` is 248 bytes and `Object` is 152.
  - A slot is 272 bytes (`Slots::<Entry, 2>::PIECE_BYTES / PIECE`).
  - `Mark` is 12.
- So a slot is the entry and two marks: 248 + 2 × 12.

**`sizes-main.log`: main ee15a2e5b, in a detached worktree with a build directory of its own.**
- For `x86_64-unknown-none`: `Entry` is 192, `Object` is 112, a slot is 216, and `Mark` is 12.
- These are #1258's own figures.
- This PR alone, on main before #1258, gave 120/88/136 (`r9/sizes`).
