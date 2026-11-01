# PR #1062, round 3: rebased onto main 190f3b164, and the owner-directed rework

Revisions: `f3046c768` is the branch squashed and rebased onto `origin/main`
`190f3b164`; `b9cedd8d2` adds `linkcase`'s carrier rows to it. `13af3ee77`
is the rework on top: one virtio-serial driver per function, handing its port
to the service the name is for.

- `ci/ci-host-f3046c768-rebase.log`: `cargo run -- --ci host`, exit 0, 108/108.
- `ci/ci-host-7d9f5d277-1-red.log`: exit 1, 107/108; the red is
  `every_config_renders_its_manifest` (`ServesWithoutService("vdagent")`),
  fixed by `service = true` on vdagent's rows.
- `ci/ci-host-13af3ee77-green.log`: exit 0, 108/108, final head.
- `ci/build-only-13af3ee77.log`: `cargo run -- --build-only`, exit 0.
- `guest/suite-5ff35be86-88-of-89.log`: `cargo test --test toyos-build`, the
  whole QEMU suite, exit 1, 88 of 89. The red, `osbench_capability_groups_exit_0`,
  boots `tests/images/benchcase.toml` on q35, which lacked the carrier rows;
  `13af3ee77` adds them (the only change after `5ff35be86`).
- `guest/osbench-capability-groups-13af3ee77.log`: that row at the head, exit 0.
- `guest/clipboard-*-worktree-before-7d9f5d277.log`: the first boots of the
  rework, before the fence and the restore test's marker were changed.
- `mutations/host-bytes-dropped.*`: the driver passes none of the host's bytes
  to the agent; `the_opening_exchange_with_qemus_agent_completes` stalls,
  exit 1. Restored in the same run.

Masked: home and temp paths, user name, CPU model.
