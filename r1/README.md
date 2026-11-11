# Round 1, ToyOS head e63e985c2ef187fae88e2c77df3134d3e9199de6

## Host checks (`host/`), run on the development Mac at e63e985c2, clean tree (`host/rev.txt`)
`host/checks.sh` is the script; `host/summary.txt` lists each command with its exit code.
- clippy, kernel x86_64 (default, boot+test actuators, boot actuators, instruments) and aarch64 (the same four),
  kernel library (sched-check; kernel controls), kernel-loom (default; tlb-tags controls): exit 0 each.
- `cargo test -p kernel --lib sched::`: exit 0, 197 passed (`host/test-sched.log`).
- loom `tlb_tags`: exit 0 (`host/loom-tlb-tags.log`).
  Negative controls: `--features tlb-tags-resume-relaxed` exit 101, only
  `a_change_passing_an_idle_holder_by_is_flushed_when_its_thread_resumes` fails;
  `--features tlb-tags-enter-relaxed` exit 101, only `a_change_reaches_a_runner_or_the_entering_cpu_flushes` fails.

## Guest (`guest/`)
- `x86-43046643043-at-76f691158.log`: guest-rows run 43046643043 at 76f691158 (the PR's first commit alone):
  vector_state_survives_a_switch, std_threads_count_the_cpus_and_give_back_ended_threads,
  affinity_pins_hold_on_every_cpu: 3 passed. Superseded by the PR's later commits; kept as history.
- Runs at e63e985c2: x86 43052915315, aarch64 43052933164 (added in a later round when they finish).

## Metal
Staged from e63e985c2, not run: whole testcases, shared-debug and benchcase boots; the FPU mutant
(`fpu-skip-ignores-left.patch`) running vector_state, which must red; osbench base b56693152 against the head.

## Guest at e63e985c2
- `guest/x86-43052915315-at-e63e985c2.log`: run 43052915315: vector_state_survives_a_switch (16 trips, AVX),
  std_threads_count_the_cpus_and_give_back_ended_threads, affinity_pins_hold_on_every_cpu, libc_children: 4 passed.
- aarch64 run 43052933164: queued when this was written.

## Reused (`reused/`)
- `check-harness.log` (`cargo check --test toyos-build`) and `test-model-controls.log`
  (`cargo test --lib -- every_model_control_is_run`), exit 0, at the tree of 3785475ab (the branch before its rebase
  onto b56693152, which brought only `issues/`; neither the harness nor `build/ci.rs` changed since).

## Metal staging (`stage/`)
`stage.sh` staged, from one clean worktree: the head's boot:testcases boot:shared-debug boot:benchcase (4 images, the
fourth `testcases-watchdog` brought by a row with an arm on testcases); the mutant (`../fpu-skip-ignores-left.patch`
applied, staged, reverted, tree clean again) with only vector_state; base b56693152's boot:benchcase. Each staging
exits 2, the harness's code for "staged, nothing established". `kernel-elfs.txt`: the mutant's kernel differs from
the head's, so the mutation is compiled in. `request.txt` is the run request (verdict boots, the T14 mutant, the
4-a-side alternating A/B on both benches).
