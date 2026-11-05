# PR 1188, round 2: SYS_DEVICE_DMA_LIMIT deleted (orchestrator's ruling)

Head f6dc7d0ff.

- `ci-host.log`: `cargo run -- --ci host` on the round-2 tree before one fix.
  It went red on the workspace tests and on clippy, both for the same reason:
  `Gcap::wide`, which hda's base-register check still uses, had been deleted.
- `ci-host-final.log`: `--ci host` at f6dc7d0ff after `wide` was restored,
  exit 0. This includes the renamed control, `iova-past-four-gib`, which
  reds its named iova tests.
- `build-only.log` and `build-only-aarch64.log`: both exit 0 at f6dc7d0ff.
- `metal/request.txt` and `metal-readback.log`: the re-staged request at
  f6dc7d0ff, one `testcases` boot for five rows. Exit 2 is the staging run's
  "the machine was not touched".

Round 1's `claimspace` tests and controls still apply: `kernel/pure/claimspace.rs`
is unchanged since a0d5cd88e.

Paths, user, host and machine model are masked.
