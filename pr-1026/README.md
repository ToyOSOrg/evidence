# #1026: sshserver on toyos-ssh (SSH track stage 2)

Head b6e691241 (code cdd3ddff2), stacked on #1023 (aa65c1f3d), on main c8e6e0365.

- `ci-host.log`: `cargo run -- --ci host` at ef4292cd0. Exit 0, 101 steps green.
  cdd3ddff2 differs from it only in `system/sshserver/src/connection.rs`
  (+4/-3: `finish` drops a redundant drain check, called only from the two
  places it can hold, with a `debug_assert` of the invariant). For that,
  `head-tests-clippy.log` is `cargo test -p toyos-ssh -p sshserver` and
  `cargo clippy ... -D warnings` at the head: both exit 0.
- `ci-host-old-base-licence-red.log`: the run before the rebase onto
  c8e6e0365. One step RED: the licence gate refused the NIST vectors then in
  `lib/crypto/tests/data`, because `lib/crypto` entered an image through
  sshserver. #1016 moved them to `tests/acvp/` on main.
- `build-x86_64.log`, `build-aarch64.log`: `cargo run -- --build-only` (and
  `--arch aarch64`) at ef4292cd0. Both exit 0; both compile toyos-ssh and
  sshserver for ToyOS.
- `recordings/`: the shell, sftp and two-channel sessions in
  `lib/ssh/tests/fixtures/`, recorded with OpenSSH_10.3p1 (`/usr/bin/ssh` and
  `sftp` on the development Mac) against `cargo run -p toyos-ssh --example
  record`. `record2.sh` is the instrument. Each client log negotiated
  `mlkem768x25519-sha256`.
  - shell: `ssh -tt`, exit 3 (the driver's status), the input echoed.
  - sftp: put, `ls -l`, get compared equal by `cmp`, then an `rm` the
    in-memory server refuses (exit 1, as the batch ends there).
  - channels: `ssh -M`; a `cat` held open while `echo two` ran on a second
    channel; both exit 3; the server's events show the echo's EOF before the
    cat's.
- `e2e/`: the host build of sshserver on the Mac's port 22, HOME in scratch,
  OpenSSH as a black-box client (`run.sh`, its output `run.log`, the daemon's
  `server.log`, revision `run.rev` = cdd3ddff2). All 17 steps as intended:
  exec, exit 7, stderr apart, 50 MB in by hash, 50 MB out, 50 MB out to a
  reader that pauses, a missing program and the missing shell (127 with the
  reason), sftp 20 MB put/ls/get compared, two channels at once, a dropped
  connection's `sleep` ended, `yes` into a program that reads nothing
  stalling only its own channel, a stranger key and a `restrict` key refused,
  the eleventh unauthenticated connection closed at once while the tenth got
  the greeting, an idle connection closed after 120 s, the host key kept
  across a restart (minted once).
- `controls/`: negative controls at ef4292cd0 (`run.sh`, `summary.txt`) and
  cdd3ddff2 (`run-e1.sh`, `summary-e1.txt`). Each applied after
  `git apply --check`, built, run and reverted; the tree ended clean.
  - m1 lets an options entry authorize: `a_key_listed_with_options_authorizes_nothing` red.
  - m2 reports every shell as having a terminal, m3 serves any subsystem,
    m4 takes a second program on a channel: `a_channel_serves_one_program_and_nothing_else` red.
  - m5 takes eleven unauthenticated connections: `the_unauthenticated_are_capped` red.
  - e1 drops the rest of a partial send: the end-to-end step 5b reads
    `same: NO`. Before step 5b existed it passed (`set-aside/`), because on
    loopback OpenSSH's window never ran out; step 5b was added for it.
  - e2 (`set-aside/`) said the exit before output drained. It passed: an
    equivalent mutant, since a pipe's reader ends only after its last chunk
    was taken. The redundant check was removed at cdd3ddff2.
- Not run: a login to sshserver on ToyOS. No instrument reaches a guest's
  port 22 (the guest harness forwards none; `cargo run`'s console takes no
  input). Stage 5 of the track is that row on the T14.
