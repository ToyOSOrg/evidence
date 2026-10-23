# ToyOS #1038, round 2: scoped per-thread timing protection

Branch `doitm-always-on` (the name is r1's; the design is r2's), head
39e38d1282651e84e04c34b43c344a782fc53812 on origin/main a00a7ff0f. The host is an Apple
Silicon Mac. Paths are masked to `$HOME/Dev/<owner>/`. Every log ends in its command's
`exit=` line where the command was wrapped; the command is named here.

## host/
- `ci-host.log`: `cargo run -- --ci host` on the tree of the head (before its commits, which
  changed no file). Exit 0, "Host: 103 step(s), all green".
- `checks-verdict.log`: `cargo test --test toyos-checks -- control_regs_verdict` at the head. Exit 0.
- `mutation-judge.patch`, `mutation-judge.log`: the judge's T14 DOITM rule disabled, the same check
  rerun. Exit 101, "the T14 without DOITM was accepted". Applied, run and reverted in one command.
- `build-x86.log`, `build-aarch64.log`: `cargo run -- --build-only` and `--arch aarch64`. Exit 0.

## qemu/
- `qemu-x86-timing.log`: `cargo test --test toyos-build -- --nocapture timing_protection_without_the_control`
  at the head. x86-64 under TCG (`qemu64`, no IA32_ARCH_CAPABILITIES). Exit 0. The kernel says
  "no CPU enumerates DOITM"; the job says "no timing protection on this machine, none reported, and 4
  threads read none".
- `qemu-aarch64-smp.log`: `cargo test --test toyos-build -- --nocapture virt_smp virt_el1_smp`, 8 emulated
  CPUs (`-cpu max`, FEAT_DIT), entered at EL2 and EL1. Exit 0. Each says "PSTATE.DIT followed 16 threads
  across 1486 (1454) switches between states, and 8 protected threads ran on more than one CPU". Run
  after the last edit to any AArch64 or test file.
- `mutation-irq-drops-dit.patch`, `mutation-irq-drops-dit.log`: the negative control. The kernel clears
  SPSR.DIT on every return from an interrupt taken at EL0, and `virt_el1_smp` is rerun. Exit 1: "thread
  6, which asked for true, read another state in round 2", and seven more threads. Applied, run and
  reverted in one command.

## staging/
- `stage-metal.log`: `cargo test --test toyos-build -- --metal --metal-readback <metal> control_regs
  timing_protection_follows_its_thread timing_protection_cost crypto_secret_timing crypto_secret_timing_curves`
  at the head. Exit 2 (staged; no machine touched).
- `stage-metal-mutation.log` with `mutation-switch-keeps-doitm.patch`: the same staging of
  `timing_protection_follows_its_thread` from a kernel whose switch never restores a thread's DOITM, the
  T14 negative control. Exit 2. Reverted after staging.
- `stage-metal-amd.log`: the AMD bench's readback directory staged. Exit 2.
- `request.txt`: the boots asked of the orchestrator, with image hashes.
