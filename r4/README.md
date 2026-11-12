# #1274 round 4 (rebase onto main 29c5f2dfa, composed with #1264)

The ToyOS head is `e1325aab6593d4c436e8b7858dde8d861b63dd91`, on main
`29c5f2dfa`. The rebase was clean. Every log below is masked.

## The composition with #1264 (FSGSBASE)

On x86-64, #1264 stores each user thread's GS base into its record
(`(*save).user_bases.gs`) beside the FS base (`(*save).thread_pointer`), at
the top of `Hw::switch`. `context_switch` then clears the outgoing task's
on-CPU word after `mov rsp, rsi`. These writes into the outgoing record
precede that clear in program order:

- the FS base and the GS base;
- the preempt count;
- `fpu::leave`'s XSAVE and its `Left` record;
- the pushed registers and the stack pointer.

They are all ordinary write-back stores, and x86-64 does not reorder a
write with older writes (SDM Vol. 3A §11.2.2). The clear's release therefore
publishes the GS base with the rest of the context. A CPU that resumes the
task after reading the word clear compares `incoming.user_bases.gs` with its
own per-CPU cache and loads the value the home saved. Nothing writes the
outgoing record after the clear. On AArch64, #1264 adds only an empty
`UserBases`; the thread pointer, the frame and the FP state are stored
before the `STLRB`.

## host/ and models/ at the head

`tools/checks-p2-r4.sh`. `summary.txt` gives each command and its exit code:

- 14 clippy shapes on both targets, all rc=0.
- `cargo test -p kernel --lib`: 516 passed.
- `every_model_control_is_run`: rc=0.
- `cargo test -p kernel-sim`: green.
- The simulator's `forward-ignores-on-cpu` control reds, rc=101 as
  required, with "I11: resumed TaskKey(1) whose context was never saved".

`models/ci-host-models.log`: `cargo run -- --ci host models` reads "95 step(s), all green", exit 0 (`models-rc.txt`). The three `forward-ignores-on-cpu` controls reach their verdicts there.

Guest run 43173669251 is at this head, with the ten rows round 3 ran.
