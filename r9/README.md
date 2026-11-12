# PR #1269, round 9: review r8 (the sweep gate, the slot size, text)

All on macOS arm64. The tree is ToyOS's `map7b-2` at cb82a3ee0, the reworded r8 head on main d1cefbaf9, plus the round's uncommitted change (`+wip`). That change is the commit `Review r8 of #1269: a walk sweeps the futex waits only of an object a mapper ever linked` and the kernel's doc fixes.

## `sizes/`: a pager's object slot, measured by the compiler

- **The probe.** `size-probe-kernel.patch` and `size-probe-mark.patch` add arrays whose length is a size. Each check fails on purpose with exit 101, and the error names the size ("expected an array with a size of 0, found one with a size of N"). Each patch is applied, compiled for a kernel target and reverted. The source is byte-identical afterwards (`cmp`).
- **`sizes.log`, on this change,** for `x86_64-unknown-none` and `aarch64-unknown-none-softfloat`:
  - `Entry` is 120 bytes and `Object` is 88.
  - A slot is 136 bytes (`Slots::<Entry>::PIECE_BYTES / PIECE`), and the slot table's `Mark` is 12.
- **`sizes-base.log`, on main d1cefbaf9,** for `x86_64-unknown-none` in a detached worktree:
  - `Entry` is 56 and `Object` is 40.
  - A slot is 72, and `Mark` is 12.
  - This is the 72 the `/tmp` record cited from #1273's replica.
- **The gate costs no space.** `Object` stays at 88 bytes with the "ever linked" bit, because the last sweep's epoch is now a `u64` rather than an `Option<u64>`.

## `controls/`: the sweep gate's negative controls

Each control is a checked patch to `kernel/pure/paged.rs`. The run applies it with `git apply --check` then `git apply`, runs `cargo test -p kernel --lib --features sched-check paged::`, reverts it and confirms the source byte-identical (`cmp`). Every control exits 101. The baseline, `baseline.log`, is 35 of 35 with exit 0.

- **`c1-unsticky`: the gate reads whether a mapper is linked now, not whether one ever was.** This skips the sweep for an object whose mapper has since unmapped, which is B8's case.
  - 5 tests are red.
  - The oracle names a given-back frame in four of them: "frame 101/102 given back with a futex waiter keyed on it". These are `a_waiter_an_unmap_left_…`, `a_wait_translated_before_a_removal_…`, `every_interleaving_…` and `long_runs_…`.
  - The fifth, `a_page_marked_during_the_sweep_…`, fails its expected `Sweep`.
- **`c2-never-set`: linking never sets the bit, so no walk ever sweeps.** 11 tests are red. Five of them are red on the oracle.
- **`c3-link-during-walk-uncounted`: a link during a walk is not counted.** 2 tests are red, both on the oracle:
  - the new exploration `a_walk_begun_before_any_mapping_gives_back_no_frame_a_waiter_is_keyed_on`, with frame 102;
  - `long_runs_…`, with frame 103.
- **`c4-pre-r3-rule`: the sweep repeats only after a visit.** This is the faithful pre-r3 rule, with a reset at each walk's start and at each visit, under the `u64` epoch. 2 tests are red, the same two as r4's control:
  - `a_waiter_an_unmap_left_…`, on the oracle with frame 101;
  - `a_page_marked_during_the_sweep_…`, with "a pass began since the sweep".
