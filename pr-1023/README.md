# #1023: mlkem768x25519-sha256 in toyos-ssh (SSH track stage 3)

Head c4e95d536, on main 18a38738b. The method follows RFC 10042 §2
(https://www.rfc-editor.org/rfc/rfc10042.txt).

- `ci-host.log`: `cargo run -- --ci host` at c4e95d536. Exit 0.
- `ci-host-enospc.log`: the first run at the same revision, on the
  development Mac. RED because the disk was full ("No space left on device",
  57 lines, from the apps-for-macos step on). The space was taken outside this
  worktree and was free again minutes later, with 168 GiB available. The run
  above is the rerun at the same revision.
- `recordings/`: the seven sessions in `build/ssh/tests/fixtures/*.transcript`,
  recorded with the development Mac's `/usr/bin/ssh`
  (`OpenSSH_10.3p1, LibreSSL 3.3.6`) as a black-box client against
  `cargo run -p toyos-ssh --example record`. `record.sh` is the instrument.
  For each session, `<name>.cmd` is the exact invocation,
  `<name>.client.log` is ssh's `-v` log, `<name>.server.log` is the
  recorder's stderr, `<name>.exit` holds both exit codes and `<name>.stdout`
  is what ssh printed.
  - Six sessions negotiated the hybrid (`debug1: kex: algorithm:
    mlkem768x25519-sha256`). `curve25519` was forced onto the classical method
    with `-o KexAlgorithms=curve25519-sha256`. `rekey` re-exchanged three
    times, each time on the hybrid.
  - None of the seven client logs has OpenSSH's "connection is not using a
    post-quantum key exchange algorithm" warning. Stage 1's recording against
    the curve25519-only server had it. Its absence from the forced
    `curve25519` session is an inference: presumably OpenSSH does not warn
    when the user named the method.
  - Every session verified the host key against the pinned `known_hosts`
    entry and the server's signature over H.
  - `exec`, `stdin`, `rekey` and `curve25519`: ssh exited 3, the driver's
    status. `stdin` and `rekey` echoed `seq 1 2000` and `seq 1 3000` back
    after the driver's greeting line, with the outputs compared by `diff`.
  - `stranger` and `rsa`: "Permission denied (publickey)", exit 255.
  - `forward`: "open failed: administratively prohibited", exit 255.
- `controls/`: negative controls at c4e95d536 (`run.sh`, `summary.txt`).
  Each patch was applied after `git apply --check`, built (exit 0), tested
  with `cargo test -p toyos-ssh --no-fail-fast` (exit 101) and reverted in the
  same run. The tree ended clean.
  - m1 encodes the hybrid's K as an mpint, not a string. Every OpenSSH replay
    on the hybrid fails, as does the test client's handshake. The test that
    derives K and the keys itself, and opens what OpenSSH sealed, still
    passes: it does not use the server's code.
  - m2 swaps S_REPLY's halves. The replays and the handshakes fail.
  - m3 drops the hybrid from METHODS. The replays fail.
  - m4 weakens FIPS 203's modulus check (`>= q` to `> q`). This fails
    `a_hybrid_init_is_held_to_its_length_and_its_key_check`.
  - m5 takes a C_INIT longer than its two keys. This fails the same test.

## Rebased onto main c8e6e0365

- `toyos-ssh-tests-rebased.log`: `cargo test -p toyos-ssh` at aa65c1f3d, the
  head after the rebase. Exit 0, so every recording replays byte for byte on
  the new base.
- The rebase brought in #1016 (SHA-2 is now `toyos-crypto`'s, with SHA-NI)
  and #1004, #1013 and #1014. Of those, toyos-ssh reaches only SHA-2. The
  full `--ci host` run at the new base is stage 2's (#PR2), whose branch
  holds this one.

- (#PR2 above is #1026.)

- `ci-host-rebased.log`: `cargo run -- --ci host` at aa65c1f3d, the rebased head. Exit 0, 101 steps green.
