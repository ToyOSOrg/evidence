# Round 4, ToyOS head fa9f2e5997dfc8d7bd5c0fd50840e820558248d5 on main 818809583

The branch rebased past #1260, #1246, #1253, #1244, #1241, #1256 and the rest. Conflicts:
`kernel/src/arch/x86_64/boot.rs` (#1244's `copies_go_down` arm kept beside the vendor this PR names once),
`kernel/src/invalidation.rs` (#1241 removed `Stop`; the census is pcid, mmio, unmap, retire, guard, stack, staged,
bench), `kernel/src/sched/driver.rs` (#1246's `current_handles` beside `leave_address_space`). One break without a
textual conflict: #1246's `teardown_resources` no longer holds the process data's guard where this PR's retire
called `data.space`; the retire now runs on a clone of the space's `Arc`, with no lock held across its shootdown,
folded into the first commit.

- `checks.sh`, `summary.txt` (each command and exit code), `rev.txt` (clean tree at fa9f2e599):
  12 kernel clippy shapes exit 0; `cargo test -p kernel --lib` 460 passed; `cargo check --test toyos-build` exit 0;
  loom `tlb_tags` exit 0, its controls exit 101 each failing only its own model.
- `models.log`, `models-rc.txt`: `cargo run -- --ci host models`, exit 0, "84 step(s), all green".
