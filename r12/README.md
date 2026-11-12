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

## The merge's resolution

`b84dd6b25`, rebuilt as `6e43e99f0` with the SDK fix below folded in, merges main `ee15a2e5b` (#1258) into `ecfb2248a`. It is followed by:
- `9a29a356f`: a holder's write stages its bytes under the pinned-copy mode, and `mapprobe` gains its `written` case;
- `ea33f5ad9`: a fault's wait and a hole's frame use the pager's own wait and draw.

`202566e95` then merges main `29c5f2dfa` (#1227, #1264, #1280), with no conflicts. libc's map answers through #1227's one refusal table.

## `checks-ea33f5ad9/`: the first run after the merge, full output

The tree is `e1c2794f8`. It differs from `ea33f5ad9` only in `sdk/toyos/src/files/owner.rs`.
- **`a-01`–`a-08`:** `b84dd6b25` and `24fdb44c4` each compile. Each runs `cargo check -p kernel` for both targets, `cargo check -p toyos -p toyos-abi`, and the kernel's tests built (`--no-run`). Each exits 0.
- **`a-09`–`a-13`:** at `e1c2794f8`, exit 0 for:
  - kernel tests, 525 passed;
  - the four kernel clippy shapes;
  - `cargo test --test toyos-checks`, 55 passed;
  - models, 93 of 93.
- **`a-12` and `a-14`–`a-18` were red:** lint, and every `--build-only`. `toyos_fs_map`'s holder closure did not answer #1258's `on_fd_held` type, and only the target build of the SDK compiles it. The fix was folded into the merge, which gives `6e43e99f0`, `9a29a356f` and `ea33f5ad9`.
- **`b-01`–`b-06`:** at `ea33f5ad9`, lint is 5 of 5 green, and `--build-only` of `testcases`, `benchcase`, AArch64's `virtjobcase` and both default images each exit 0.

## `checks-202566e95/`: the head, full output, exit 0 each

- `01`: `cargo test -p kernel --lib --features sched-check`, 525 passed.
- `02`: the four kernel clippy shapes, each `-D warnings`.
- `03`: `cargo test --test toyos-checks`, 55 passed.
- `04`: `cargo run -- --ci host lint`, 5 of 5.
- `05`: `cargo run -- --ci host models`, 93 of 93.
- `06`–`10`: `cargo run -- --build-only` of the images the rows boot and both default images:
  - `testcases` and AArch64's `virtjobcase` each add `bin/mapprobe`;
  - `benchcase` carries osbench.
