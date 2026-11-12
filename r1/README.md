# #1274 round 1

ToyOS head of the checks: `228b2aa83b9b82a5d631c68b9af8925fa352097e`, on main
`d1cefbaf9`. The PR's later commits, `b1b5acc82` (issue records) and
`15afe7813` (two comments), change no code.

## host/ — targeted host checks at 228b2aa83

`tools/checks-p2.sh`; `summary.txt` lists each command and its exit code;
`rev.txt` is the head with no uncommitted changes.

- 13 clippy shapes with the workspace's adopted lints, `-D warnings`, all
  rc=0. Eight are kernel shapes: x86-64 and AArch64, each with default
  features, the actuators, boot actuators and the instruments. The others are
  the kernel library with `sched-check`, the kernel library with controls,
  `kernel-loom`, `kernel-loom` with `parked-publish-relaxed`, and `kernel-sim`.
- `cargo test -p kernel --lib`: 503 passed, rc=0.
- `cargo test -p toyos-build --lib every_model_control_is_run`: rc=0, so the
  new control is declared and run.

## models/ — `cargo run -- --ci host models` at 228b2aa83

`ci-host-models.log`, exit code in `models-rc.txt`. It runs the kernel's
models (`kernel-loom`, `kernel-sim`) and every model's negative control.
The two comments of `15afe7813` were committed while its controls were
building.

## controls/ — the new tests' negative controls and model runs

Each mutation was applied in the worktree, built and run, and then
restored in the same command. `*.diff` is the mutation.

- `ctl-no-prune`: `Due::prune` removed from both timer-arming sites.
  `a_park_sent_on_leaves_its_home_no_timer` reds with "and armed nothing for
  a park it no longer holds" (exit 101). Run before the commit that holds the
  prune.
- `ctl-forward-any-sleeper`: the forward takes any sleeping CPU, ignoring
  the mask and the ring. `a_wake_whose_mask_admits_no_idle_cpu_goes_home`
  reds with "the claim went home as a Wake", and
  `wakes_behind_one_busy_home_take_one_sleeper_each` reds (exit 101).
- `ctl-parked-publish-relaxed.log`: `kernel-loom --features
  parked-publish-relaxed --test loom_claimed_wake`, exit 101.
  `a_record_taken_by_a_remote_claim_is_the_one_its_park_published` reds with
  "Causality violation: Concurrent write accesses to `UnsafeCell`". The
  deadline model stays green, because its park happens before the waker is
  spawned.
- `loom-claimed-wake.log`: both models green without the control.
- `kernel-sched.log`: `cargo test -p kernel --lib sched::`, 217 passed.
- `sim-full.log`: `cargo test -p kernel-sim`, all green, before the third
  commit's simulator changes. The models run above covers the head.

## sim-finding/ — the policy suite's wasted wakes

Temporary `DBG` prints in the simulator, which were not kept, logged
kicks, IPIs, timer fires and passes, and flagged a halted CPU whose first
pass ended idle.

- `run.log`: `wakeup_storm(4,16)` under Pull over the policy suite's 20
  seeds, without the prune. It holds 4 `IDLE-WAKE-FOR-NOTHING` lines, for
  seeds 1, 5, 11 and 13.
- `seed1.log`, lines 218-230: cpu1 passes to idle at t=19,000,000 ns
  (`[Retire{TaskKey(2)}, IdleEnter]`). Its timer fires at t=55,750,000 with
  `was_halted=true`, with no kick or IPI to cpu1 in between, and the pass
  ends idle with an empty trace. The prints do not show which claim ended
  the park whose deadline the timer was armed for, so that it was a
  forwarded park is inferred. Only a claimant that sends a park on leaves
  its home the deadline of an ended park. The first commit alone, with no
  forward, kept the suite green. The prune removes all four wakes.
- `run2.log`: the same 20 seeds with the prune, with zero such lines.
