# ToyOS PR #1095, round 2

The metal proof ran with the flasher at 7bfbea26d47a1b528f972f0e7b45d3fddccfe3fd,
on images staged at 7ccd44caf (r1/metal-staging); the review fixes are
78ade1ec03a3bad024718a865c6eb540747c693b. Paths, hosts, addresses, partition
GUIDs, NVMe EUIs and black-box identities are masked.

- `metal-judged/judge-amd.log` — the AMD bench's four boots judged offline:
  seven rows PASS, EXIT=0.
- `metal-judged/judge-t14.log` — the T14's five boots: six rows PASS, EXIT=0.
- `metal-judged/loader-lines.txt` — each boot's verdict, the source the
  loader came off (NVMe, partition 5) and the panic decision both loader
  passes printed (reset, on every pass).
- `metal-fall-through/` — `--fall-through missing` and `garbage` on both
  benches, each rc=0: the firmware fell through to BootOrder's first entry.
- `host/ci-host-r2.log` — `cargo run -- --ci host` at 78ade1ec0, EXIT=0, 105
  steps; `host/stage-renamed-rows.log` — `mask_windows` and
  `tone_beside_a_log_write` staged at 78ade1ec0 (EXIT=2, staged), building
  the renamed guest binaries.
