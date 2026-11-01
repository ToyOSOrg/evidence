---
status: open
kind: defect
opened: 2026-11-01
---

# libc_children's tty_interrupt can stall at the nested shell's line

`cargo test --test toyos-build -- libc_children` on the 2-CPU QEMU x86-64 boot
sometimes ends with `tty_interrupt: stalled at the nested line held`. The
probe types `shell` into its shell and then `cat` into the nested one. The
nested prompt prints, but `cat` never becomes a held foreground line, and the
probe's own 120 s hang ceiling ends it with exit 2.

**Evidence.** These are local QEMU runs on the development host; the logs are
in the scheduler agent's scratch (`sched-place/tty/`).
- main `24a538c88`: 1 stall in 4 runs (run 6).
- `f5ae75f6b` (#1111's step 1 on that main): 0 stalls in 6 runs.
- `dd9bf974d` (#1111's head): 2 failures in 3 runs. One was this stall. The
  other was `signal_quit: stalled driving the child that reloads`.

It reproduces on main, so it is not #1111's, contrary to a first attribution
that rested on one run of each. Its cause is unknown. The kept serial log covers
only boot, so nothing yet says which side lost the line: the shell's stdin read,
the surface's foreground report or a wake.

**Exit:** find what the nested shell waits on when it stalls, and fix it.
`signal_quit`'s stall may be the same defect.
