# Round 5, ToyOS head 9b7d6d949d133dd4a909f64ffcf32a805e0d3e35 on main 36ed75b5a

The branch rebased past #1266, #1259, #1243, #1239, #1263 and #1267. Conflicts:
- `kernel/pure/sched/task.rs` (#1266): `RunningTask::outrun_request` beside this PR's `RunningTask::ctx_mut`; `cpu.rs`
  auto-merged with `CpuSched::running_ctx` beside #1266's and #1263's changes.
- `kernel/src/arch/x86_64/tlb.rs` (#1267): this PR's `idle`, `resume`, `retire`, `held` and `leave_idle_space` beside
  #1267's asks; `user_change` keeps its `tables` argument, which `Tags::changed` reads, and #1267's ask of each reached
  CPU, so a table-freeing change asks a CPU idle on the space for 0..u64::MAX, which its answer flushes whole.
  #1251 lands second, so `answer_ask` now leaves an idle CPU's space as `answer` does.
- `issues/a-tlb-shootdown-reaches-only-the-cpus-that-ran-the-space.md`: #1267's account of the asks and this PR's
  idle holder, both kept.

- `checks.sh`, `summary.txt` (each command and exit code), `rev.txt` (clean tree at 9b7d6d949): the 10 kernel clippy
  shapes and the 2 for `kernel-loom`, exit 0 each; `cargo test -p kernel --lib` 485 passed (#1266's sleeper tests
  among them); `cargo check --test toyos-build` exit 0; loom `tlb_tags` exit 0, its controls exit 101 each failing
  only its own model.
- `models.log`, `models-rc.txt`: `cargo run -- --ci host models` exit 0, "89 step(s), all green": the kernel-sim
  scenarios and seed sweep, #1266's share tests, and the loom models with every control, #1267's `shootdown-*` among
  them.
