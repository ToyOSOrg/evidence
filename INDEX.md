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
