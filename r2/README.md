# #1274 round 2 (review r1's blockers)

ToyOS head: `0ae65b768dc9c0908515c5f8a9e9252a0d1d6093` on main `3c5c55584`. Every log below is masked.

## host/ and models/ at 0ae65b768dc9c0908515c5f8a9e9252a0d1d6093

`tools/checks-p2-r2.sh`. `summary.txt` lists each command and its exit
code, and `rev.txt` is the head with no uncommitted changes.

- 14 clippy shapes, all rc=0. To round 1's thirteen, this round adds
  `kernel-sim` with the control.
- `cargo test -p kernel --lib`: 506 passed, rc=0.
- `every_model_control_is_run`: rc=0.
- `models/ci-host-models.log`: `cargo run -- --ci host models` reads "95
  step(s), all green", exit 0 (`models-rc.txt`). All three
  `forward-ignores-on-cpu` controls reach their verdicts there.

## controls/ — the new tests, their controls and the removed control

These ran before the rebase onto `3c5c55584`, which changes no file under
`kernel/`. Each mutation was applied, built, run and restored in one
command, and `*.diff` is the mutation.

- `forward-ignores-on-cpu` makes `on_cpu` answer `false` (a feature):
  - `r2-ctl-forward-ignores-on-cpu-kernel.log`:
    `a_claim_before_the_homes_switch_goes_home` reds, "cpu1 ran a task its
    home still stands on", exit 101.
  - `r2-ctl-forward-ignores-on-cpu-loom.log`:
    `a_claim_sends_a_task_on_only_once_its_home_has_saved_it` reds, with
    "Causality violation: Concurrent write accesses to `UnsafeCell`" on the
    context's cell, exit 101.
  - `r2-ctl-forward-ignores-on-cpu-sim.log`:
    `a_claim_never_sends_on_a_context_its_home_has_not_saved` reds, with
    "I11: resumed TaskKey(1) whose context was never saved", exit 101.
- `r2-ctl-loaded-and-boost.diff`:
  - `wake_parked` without its loaded-task rule reds
    `a_task_woken_as_it_parks_with_its_mask_moved_away_is_sent_on_by_the_pick`
    at `hand_off`'s assert, "handed TaskKey(1) to CpuId(1) while standing
    on its context" (`r2-ctl-loaded.log`).
  - The claimant without the boost reds
    `a_boosted_wake_behind_a_fair_home_goes_home` (`r2-ctl-boost.log`).
- `r2-ctl-parked-publish-relaxed.log`: round 1's control is now green (exit
  0), so it is removed. The claimant's acquire of the on-CPU word orders
  the record before the take.
- Without any control: `r2-loom-claimed-wake.log` and `r2-loom-all.log`
  (every loom model), `r2-kernel-lib.log` (506 passed), `r2-sim.log` and
  `r2-sim-scenarios.log`.

## sim/ — the simulator's reach after the switch became a step

These are counts of a scenario's runs from `kernel-sim run <scenario> <seed>`
(seeded) and `kernel-sim pct <scenario> <seed>` (PCT, depth 3), each counted
by its exit code or by `grep I11` in a shell loop.

- Under `forward-ignores-on-cpu`:
  - `r2-sim-ctl-sweep.log`: `sweep 200` over every scenario is clean.
  - Seeds 0-999 of `busy_home`, `turn_taking_pair`, `wakeup_storm`,
    `interactive_mix` and `masked_steals` show no I11, seeded or PCT.
  - `find` over 100,000 seeds finds no failure in `busy_home` or
    `turn_taking_pair`.
  - So no existing scenario reaches the window. `busy_home`'s wake comes
    from a device interrupt, which cannot land while no time passes, and the
    others have no third CPU asleep.
  - `claimed_behind_busy_home`, seeds 0-999: I11 in 22 seeded runs and 2 PCT
    runs. Seed 36 is the first, "I11: resumed TaskKey(1) whose context was
    never saved" after 14 steps.
- Without it: `find claimed_behind_busy_home 3000` finds no failing seed.
- `old_migrate_kept_the_corpse` with the step split, run by seed:
  - Seeds 0-499 with round 1's mix (seeded for even seeds, PCT for odd
    ones): no catch.
  - The same mix with the switch run inside the pass, as before the split:
    3 catches.
  - Seeds 0-2999: 22 seeded catches and 1 PCT catch.
  - Hence the gate's 2,000 seeded schedules.
- The corpus traces were found again and shrunk: `old_steal_port` seed 5
  (I8, `shrink-old-steal-5.txt`) and `old_migrate_kept_the_corpse` seed
  135 (I14, `shrink-corpse-135.txt`). Every trace in the corpus replays as
  committed.
