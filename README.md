# PR 1258: an open file written and stated through its paged object, against credit

- `host-checks/`: each touched crate's host tests and clippy shapes (`step1-checks.sh`), one log a step ending with
  its exit code; `summary.txt` lists them.
- `controls/`: four negative controls (`step1-controls.py`), each a patch in `patches/` applied, built and run, then
  restored; each log ends with the test's red.
