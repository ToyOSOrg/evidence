# pr-972 round 1

Tree under test: commit a6d4695c6 on wt/toyos-transport-merge (fork pin 11e31a52778).
`ci-host.log` (exit 0) ran on index tree `ci-host.tree`; it differs from the commit only by one reflowed comment in build/clippy.rs.
`ci-host-red-1.log` is the first run, red at `every_model_control_is_run` (the gate did not read `toyos`'s manifest); fixed before `ci-host.log`.
`build-x86_64-1.log` is the first image build, before the fork lockfile edit; `build-x86_64.log` and `build-aarch64.log` are after it.
`guest-filter-refused.log`: the QEMU suite refuses `stream_handles` as a filter; it runs only in the shared metal boot (`metal-request.txt`).
Paths are masked: $HOME, $DEV (the directory holding the worktrees), $SCRATCH (the agent's scratch directory), $TMP.
