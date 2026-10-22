# #1026 review round 1

Head 81e922b27 (code 04f7df67d and 6fa3a2de5), on #1023's aa65c1f3d, on main c8e6e0365.

- `ci-host.log`: `cargo run -- --ci host` at 81e922b27. Exit 0, 101 steps green.
- `build-aarch64.log`: `cargo run -- --build-only --arch aarch64` at 81e922b27,
  exit 0, sshserver compiled. The x86_64 image was built at the same head by
  the QEMU row below.
- **B1, B2, B3 controls** (`controls/`, at 04f7df67d): each a checked patch
  applied, `cargo test -p sshserver` run, and the patch reverted; the tree ended clean.
  - c1 drops the rest of a partial send (e1 again). It fails
    `output_goes_whole_and_in_order_through_a_narrow_window`.
  - c2 gives pre-login writes an hour, not the time left. It fails
    `a_client_that_floods_offers_and_never_reads_is_closed_at_the_deadline`
    on its one-minute bound: the connection never ends.
  - c3 kills without reaping. It fails `a_program_ended_is_reaped`.
- **B4** (`guest/`): `stream_handles` on QEMU x86-64, through a temporary row
  (`temporary-qemu-row.patch`, not committed), because a discovered binary
  otherwise runs only in the T14's shared boot. Exit 0, all three of the
  check's lines printed (`stream-handles-qemu.log`).
  - `control-no-ring.log`: the same row with the peer's later bytes published
    but never rung. The reader stays in its read and the row reds STALLED,
    so the read really did wait on the peer while the write completed.
- `e2e/`: the 17 Mac steps at 04f7df67d's code (`run.rev`), all as intended.
  After step 10 the daemon has no zombie child.
