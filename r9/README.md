# PR #1269, round 9: review r8 (the sweep gate, the slot size, text)

All on macOS arm64.

- **`sizes/` and `controls/`** ran on ToyOS's `map7b-2` at cb82a3ee0 plus the round's uncommitted change (`+wip`). cb82a3ee0 is the reworded r8 head on main d1cefbaf9. The change was then committed unchanged as c03760fd1, `Review r8 of #1269: a walk sweeps the futex waits only of an object a mapper ever linked`. Its `kernel/pure/paged.rs` and `kernel/src/object/paged.rs` are byte-identical to the sources measured here (`cmp`).
- **`checks/`** ran at the head 25a203053. That head differs from c03760fd1 only in the `/tmp` record.

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

## `checks/`: at 25a203053, from an empty build directory, each command's full output

Each log is exit 0:
- `01`–`04.log`: `cargo check -p kernel` for `x86_64-unknown-none` and for `aarch64-unknown-none-softfloat`, each with no features and with `boot-actuators,test-actuators`.
- `05.log`: `cargo check -p toyos -p toyos-abi`.
- `06.log`: `cargo check -p kernel --lib --tests --features sched-check`.
- `07.log`: `cargo test -p kernel --lib --features sched-check`, 514 passed.
- `08.log`: `cargo run -- --ci host lint`, 5 of 5 steps green.
- `09.log`: `cargo run -- --ci host models`, 93 of 93 steps green.

**Per-commit coverage.** The round's two commits differ only in a record, so these checks cover both. The 28 commits before them have the same trees as fd13c116e's commits, which the r8 review checked commit by commit.

**A void first run.** The first run of these checks is void and is not published. Its build directory had been shared with a worktree at d1cefbaf9 for the base-size probe. That stale build gave the x86-64 kernel checks main's `toyos-abi`, which lacks `Fault::Mapping`. The run was stopped and the directory deleted, and this run built everything afresh.

## `images/`: the guest crates compile, at f3e456f22

**Why this section exists.** Run 43143902443 at fd13c116e went red at its build step, on `tests/guest/mapprobe/src/main.rs:282`. The error was `error[E0308]: mismatched types … expected Pipe, found OwnedHandle`. Main's typed handles (#1239, #1242) make `Endowments::take` answer the type asked for, so `Pipe::from(OwnedHandle)` no longer exists. None of the checks above build a guest crate.

**The fix.** `pipe_end` takes its pipe end typed. The fix is folded into the probe commit and every later commit that carries the line. Nothing else changed: `range-diff-25a203053-f3e456f22.txt` shows one `!`, the probe commit, and every later commit `=`. Every commit message and author is kept, and every commit is signed. The eleven commits before the probe keep their hashes.

**Each build at f3e456f22, exit 0, full output.** These are the images the six guest rows boot, and both default images:
- `01.log`: `cargo run -- --build-only --boot-config tests/images/testcases.toml`. This compiles `mapprobe` and adds `bin/mapprobe`.
- `02.log`: `cargo run -- --build-only --boot-config tests/images/benchcase.toml`, with osbench.
- `03.log`: `cargo run -- --build-only --arch aarch64 --boot-config tests/images/virtjobcase.toml`. This compiles `mapprobe` for AArch64.
- `04.log`: `cargo run -- --build-only --arch x86_64`.
- `05.log`: `cargo run -- --build-only --arch aarch64`.

**The head, 4a4d3fe23.** It differs from f3e456f22 only in doc comments and the `/tmp` record. `check-4a4d3fe23.log` shows `cargo check -p kernel --target x86_64-unknown-none` and `cargo check -p kernel --lib --tests --features sched-check` exit 0 there.

**The `checks/` above** ran at 25a203053. That tree differs from f3e456f22 only in `mapprobe`, which none of those checks build.
