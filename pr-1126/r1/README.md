# PR #1126 r1 (`6adab470b`)

- `ci-host.log`: `cargo run -- --ci host`, 107 steps all green, exit 0.
- `probe-ran.log`: `cargo test --test toyos-build -- osbench_capability_groups_exit_0`, with `probe-ran.py` applied at run time (never committed). The edit points the test at `osbench_ipc` and `osbench_files` on 4 TCG CPUs and prints every osbench line. It exited 0, and every ipc and fs row carries `ran=`.
- The metal readings of the field are in `pr-1111/r2` (`placement.txt`, `lines/`).
