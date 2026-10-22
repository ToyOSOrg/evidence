# PR #1004 (socket sharing S1) evidence

Revisions: `ci-host-s1.rev` is the commit host CI ran (before a clean rebase onto
main's crypto-only commits); `postrebase-s1.rev` is the pushed head.

- `ci-host-s1.log`: `cargo run -- --ci host`, exit 0, 95 steps green. It runs every
  transport control (`CONTROLS`); each new one reaches its FAILED verdict there.
- `loom-full2.log`: the whole `transport_loom` suite, release build, exit 0, 28/28,
  1450 s on a host at load average ~25-38.
- `control-*.log`: each new control run alone against its model, exit 101, red on its
  claim. These ran before L5 was shrunk; the L5 control's verdict at the final L5 is
  in `ci-host-s1.log`.
- `base-poll-timing.log`: the three poll models on the base, 147 s.
- `postrebase-s1.log`: after the rebase, `cargo test -p toyos --lib`, `-p toyos-net-node`,
  and clippy on `toyos --all-targets`, exit 0.
- `ci-host-s1-run1-stopped.log`: an earlier CI run, stopped (exit 130) when L5 proved
  too slow; kept for completeness.
Paths are masked.
