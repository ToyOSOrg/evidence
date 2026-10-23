# PR #1043 round 1: divsteps inversion (landing commit 2e63ea523, probe a8b67bb45)

- `logs/ci-host-2e63ea523.log`: `cargo run -- --ci host`, exit 0, 101 steps.
- `logs/test-toyos-*.log`: crate tests, shipped profile, aarch64-apple-darwin and x86_64-apple-darwin
  (Rosetta, SHA-host test skipped). `logs/clippy-*.log`: three feature forms, two Mac targets, two UEFI targets.
- `controls/`: mutants m1-m5 as checked patches against 2e63ea523, each run with
  `cargo test -p toyos-crypto --features std,sign,wpa2 --profile toyos --no-fail-fast` and restored;
  `summary.txt` has the exit codes (m3 passing is expected, see the PR).
- `steps/`: exact-integer divstep counts until g = 0 (Python, exploratory), against Theorem 11.2's bound.
- `probe.rs`: the probe's timing module; `README.txt`/`SHA256SUMS`: the Linux binaries staged for the benches.
