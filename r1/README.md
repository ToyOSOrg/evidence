# pr-1150 r1: review round 1's fixes, at 19c814f63 (on main a0e8f1333)

- `host-1.log.gz`, `host-1.rev`: `cargo run -- --ci host`, rc=0, 109 steps green.
- `pure-1.log`: `cargo test -p kernel --lib -- pipe::`, rc=0, 27 passed.
- `control-N4-first-look-only.log`: the old turn protocol (a copy asks to be woken on
  its first look only) as a checked mutation (`mutate.py`); rc=101, exactly
  `a_claim_made_before_a_woken_waiter_looks_again_still_wakes_it` fails. Reverted.
- `control-N5-abandon-silent.log`: an abandoned write's room returned silently; rc=101,
  exactly `an_abandoned_write_gives_its_room_back` fails. Reverted.
- `clippy-*.log`: `cargo clippy -p kernel --bin kernel --target <t> -- -D warnings`, rc=0
  on both targets (the x86_64 log is the incremental rerun after the last edit).
- `members-1.log`, `members-1-boot.log.gz`, `members-1.rev`: `members.sh` (the testcases
  boot under QEMU x86_64 via `--debug`), 230 of 238 exit 0. The 8 others need `SYS_DEBUG`,
  which the `--debug` kernel lacks; each answered `0xfffffffffffffffb`, as in r0. No gate
  panic, no kernel panic. `ccheck-1.log`: 143 C cases compared with their `.expect`, 0
  mismatched.
- `ab1-table.txt`, `judge.py`: round 1's metal A/B (base 058bea2d3, head 42e2716c3; T14
  and AMD; the orchestrator's readbacks) judged by r0's `rules.md`.
- `ab2-rules.md`: round 2's rules, set before any boot.
