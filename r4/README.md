# PR #1065, round 4: corrections to r3/README.md (append-only)

- r3 says the session's `cpu.clock` readings are recorded in
  `issues/osbench-times-cpus-leaving-idle-and-not-their-settled-clock.md`. They are not.
  - As of ec8b41de1 they are in `issues/toyos-uses-what-modern-hardware-offers-for-speed.md`.
  - That record gives `cpu.clock`'s **maximum**: 3789 MHz under ToyOS in every group that reached its top,
    against 4188–4190 MHz in every Linux group.
  - The probes' p50, ToyOS 1.5–3.2 GHz against Linux 3.8–4.2 GHz, reads idle and ramp policy, not the
    ceiling.
- r3 gives ToyOS's window as 11:44–11:49. That is when the readbacks completed. The boots' own lines run
  11:42–11:48.
- The upload p = 1/35 uses the centre-distance two-sided rule: the share of splits whose |2U − nm| is at least
  the observed one. Doubling the one-sided p would give 2/35, which is not resolved at 0.05. The finding's
  strength is that no ToyOS round reached any Linux round.
