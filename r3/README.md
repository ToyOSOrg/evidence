# #1274 round 3 (review r2: the clear after the stack switch)

The ToyOS head is `37b8806cc48e53183f04fed08acddd127ed4591d`, on main `3c5c55584`. Every log below is masked.

`switch-clear-moved.diff` is the assembly change. On both architectures the
on-CPU word's clear moves after the stack switch: after `mov rsp, rsi` on
x86-64 (still inside `switch_save!`), and after `mov sp, x1` on AArch64.

`host/` holds `tools/checks-p2-r3.sh` at that head. `summary.txt` gives each
command and its exit code:

- 14 clippy shapes, all rc=0: the kernel on x86-64 and AArch64, each with
  default features, actuators, boot actuators and instruments; the kernel
  library with `sched-check` and with controls; `kernel-loom` and
  `kernel-sim`, each alone and with `forward-ignores-on-cpu`.
- `cargo test -p kernel --lib`: 506 passed.
- `every_model_control_is_run`: rc=0.
- `cargo test -p kernel-sim`: every suite green. The simulator now clears
  the word by key after its switch step.
- `test-sim-control`: the simulator's control still reds at this head,
  rc=101 as required, with "I11: resumed TaskKey(1) whose context was never
  saved".

Not rerun, and why:
- Loom: its sources are unchanged since round 2, so `--ci host models` at
  `0ae65b768` (round 2's `models/`) still holds for it.
- No model sees where in the switch the clear sits, because each takes the
  switch as one step. The assembly change is checked by the clippy shapes
  above, which compile both architectures, and by guest run 43154897516 at
  this head.
