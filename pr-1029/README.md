# PR #1029: scrypt (RFC 7914) and PBKDF2 in toyos-crypto

Round r1, branch head ba90ee11cb1d5f6a99d61fcf886cb8d2967e1207 (base origin/main 777c8c524).
Host: the development Mac (aarch64-apple-darwin). Paths are masked as $HOME, $WORKTREE, $SCRATCH, $TMPDIR.

- `logs/ci-host.log`: `cargo run -- --ci host` at ba90ee11c, exit 0.
- `logs/build-only.log`: `cargo run -- --build-only` at ba90ee11c, exit 0.
- `logs/metal-list.log`, `logs/metal-readback-prep.log`: `--metal --list` (exit 0) and
  `--metal --metal-readback <dir> boot:cryptoctcase` (exit 2, its "staged, machine untouched" status);
  `metal/request.txt` is the request. No machine was touched.
- `logs/pre-*.log`: crate tests in its three forms and clippy at 3afe46eab (clippy's first red was fixed,
  then all three forms passed clippy -D warnings).
- `logs/ci-host-interrupted-312d10ab8.log`: an earlier host run stopped by hand at a pause; not a result.
- `mutations/`: seven negative controls at ba90ee11c, each a checked patch applied, built, tested and
  reverted by `run.sh`; `summary.txt` and each `<name>.log` give the exit codes and red tests.
