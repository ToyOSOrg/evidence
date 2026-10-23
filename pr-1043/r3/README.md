# PR #1043 r3: bench results at 2e63ea523 (run by the orchestrator)

- T14 `cryptocase` (judge exit 0, verdict `passed`): `cryptocase-parity-rows.txt`, the test-runner's
  parity rows (asserted = shipped build), timestamps stripped.
- T14 `cryptoctcurvescase` (judge exit 0, DOITM off): `cryptoctcurvescase-ct-lines.txt`, the `ct` lines
  including both controls.
- Linux runs of `m1-binary/` (unit tests at 2e63ea523 and probe a8b67bb45): `t14-linux-run.txt`, `amd-linux-run.txt`.
Full kernel logs are kept out because they carry machine identifiers.
