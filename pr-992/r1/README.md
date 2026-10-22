# PR 992, round 1: host evidence at 55005b1ce; probe at fb9376439

- `ci-host.log`: `cargo run -- --ci host` at 55005b1ce, exit 0.
- `controls/`: each negative control's patch, its test log, and `results.txt`.
- `x25519-multiply-x86_64-apple-darwin.s`: `x25519::multiply` from `cargo rustc -p toyos-crypto --release --target x86_64-apple-darwin --lib -- --emit asm` (Intel syntax) at 55005b1ce: its branches, its one call and the Workspace's erasure stores before `ret`.
- `m1-mac-exploratory.log`: exploratory, uncontrolled M1 on the development Mac at the probe head. Not a bench measurement.
- `probe/`: the probe branch's QEMU run of `crypto_instrument_prints_its_table` (exit 0) and its staged `cryptocase` readback (exit 2 = Staged; no machine touched).

Paths are masked as $HOME, $SCRATCH and $WORKTREE.
