# PR #1079 evidence: osbench measures the systems, not the setup

## r1 (branch head 1a42601b0)

- `checks/ci-host-1a42601b0.log`: `cargo run -- --ci host` at 1a42601b0, exit 0, 103 steps green. The run before it, on the uncommitted tree, was red on one clippy lint in a new test (`manual_is_multiple_of`). That is fixed in the commit.
- `checks/linux-build-1a42601b0.log`, `checks/linux-osbench-SHA256SUMS`: the Linux half at 1a42601b0 (`cargo +nightly-2026-07-22 build -p osbench --target x86_64-unknown-linux-musl --profile toyos`), exit 0. Both Linux targets also passed `cargo check` with no warning before the commit.
- `controls/`: three negative controls, each a checked patch applied, built, tested and reverted in one run (`run.sh`, `run.log`):
  - m1: settle's span at 10 ms. 3 settle tests red (exit 101).
  - m2: compare accepts a system's runs on two setups. The setup test red (exit 101).
  - m3: the clock never falls. The clock-fall test red (exit 101).
- `judge/memory-data-refused.log`: the new `osbench` row judging a copy of the 2026-10-24 T14 readback, whose DATA was memory. Exit 1, `FAIL osbench: DATA was not the NVMe's partition ... are in memory`.
- `judge/mounted-data-passes.log`: the same log with the file server's two DATA lines replaced by `fileserver: mounted the DATA volume`. Exit 0, `PASS osbench`. Both judge runs were on the working tree before the commit. The commit changed the row's bound and comments after them, not `data_on_the_nvme`.
- `judge/stage-*.log`: `--metal-readback` staging of the `osbench` row for the T14 and the AMD bench at 1a42601b0. Exit 2, staged, no machine touched. Image sha256: T14 a30cb2bbb1a9089c227eda67ffd39a150dcc78a23b4781f379fb749647c55c0f, AMD 5516cccb7313540d92182b202b61a337c715a1445dc4d67101466470e43f79fd.

## r2 (branch head ba76f730a): the DATA designation, and the AMD TSC

- `checks/ci-host-ba76f730a.log`: `cargo run -- --ci host`, exit 0, 103 steps green. `checks/ci-host-8d3ea1a89-red-sourcegate.log` is the run before it: exit 1, one step red. The source gate refused a bare `temp_dir()` in `toyos-metal`, and ba76f730a takes a `TempDir` instead.
- `controls/`: m4 makes `stamp::classify` never see a ToyOS volume. It was applied, built, run and reverted in one run (`run2.sh`, `run2.log`), and the stamp test went red, exit 101.
- `judge/`: the `osbench` row at its final `data_on_the_nvme`, on copies of the 2026-10-24 T14 readback.
  - `t14.log`: DATA in memory, exit 1, refused.
  - `t14-mounted.log`: the mount line substituted, exit 0, PASS.
  - `t14-formatting.log`: the format line substituted, exit 1, refused as the format boot with its duration. The substitution's lines share one timestamp, so it reads 0.000 s.
- `tsc/amd-dmesg-clocksource.txt`: the AMD bench's Linux watchdog, UUIDs masked. Derived from it: 905,474,502 TSC cycles over 502,290,025 ns of HPET, which is 1802.69 MHz. Linux's conversion assumed 1796.62 MHz, and ToyOS's calibration against the same HPET reads 1796.52 MHz (kernel.log, 2026-10-24), about 3400 ppm apart. `tsc-drift.rs` is the requested measurement, scratch evidence code with no repository home; its binary's sha256 is in `SHA256SUMS`.
