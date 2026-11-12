# Evidence for ToyOS #1282

- `r16/`: at bd5851cf0, a clean tree (`summary.txt`, the commands in `checks16.sh`): the image, the host suites of the
  crates that link the SDK, every kernel clippy shape, and clippy on `toyos` (all targets, `fd-table`), the libraries and
  the ABI. Each log ends with its exit; all exit 0.
- `r15/`: the first form, on its uncommitted tree: everything exits 0 but `test-fileserver` (exit 101), whose host
  build failed to link `toyos_endow_take` and `toyos_endow_adopted`, then declared on the host as `toyos_fd_*` is.
  bd5851cf0 gives a host build a local state instead.
- `host/`: `cargo test -p toyos --lib endow` at bd5851cf0 (10 pass), and the negative control: `mut-per-copy.patch`
  gives the second test table a state of its own, as each copy of the crate had, and both two-copy tests go red
  (`mut-per-copy.log`, exit 101). The tree was restored and is clean.
- `r1-fix/`: review r1's fixes, at b9c8c16e5's tree (the logs name bd5851cf0 plus the working tree that became it):
  `cargo test -p toyos` (230 library tests and the rest, exit 0), clippy on `toyos --all-targets` and on
  `toyos --lib --features fd-table` (exit 0), `--build-only` (exit 0), and the file server's host suite, whose host link
  the first form broke (exit 0). The host tests now hold the state's rules on a `State` and a table directly; the
  two-copy fixture and its control (`host/mut-per-copy.*`, above) are gone: they exercised the fixture, not the copies.
