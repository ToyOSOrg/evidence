# ipc-latency (ToyOS PR #1061)

- notes.md: per-phase kernel instruction counts, base 32046264b through the branch head b214ecb87.
- tools/: the scratch QEMU TCG plugin (insncount.c: instruction counts between cpuid markers, plus a
  frame-pointer stack sample every 997 instructions), its launcher, the osbench marker patch, and the
  aggregation scripts. Scratch tooling, not ToyOS code.
- profiles/: base vs head top-down call trees (instructions per round) for the futex cross-CPU
  ping-pong and ipc.reqrep.8, and flat per-function counts for each phase
  (0 getpid x20000, 1 futex cross, 2 futex same_cpu, 3 pipe cross, 4 ipc.reqrep.8; 2000 rounds each).
- logs/: cargo run -- --ci host (EXIT=0), clippy (EXIT=0), QEMU guest runs (EXIT=0).
- controls/: each mutation's diff and its red log.
Home paths masked.
