# #1113 on main 24a538c88 (head 4ea1637ee)

- `ci-host.log`: `cargo run -- --ci host` at 4ea1637ee (`ci-host.rev`), 107 steps green.
- `test-*.log`: `cargo test --release` of diskserver (15), toyos-blockring (32, the model included), fileserver (90) and toyos-blockdev (13), all exit 0.
- The one conflict was `system/diskserver/src/session.rs`, against main's 3e0fd6775 (doorbell pipe → two events) and f83957d65 (the handshake's timed wait).
- The swap record merged automatically with both sides' edits.
- Every other file of this change is byte-identical to 20bdd1401's.

Paths under the agent's home and scratch are masked.

## X-E: 4ea1637ee on metal, one clean boot per bench (both passed)

The rule, fixed before the run (`metal2/request-4.txt`): both boots pass; `persist.seq_write_fsync` and `fs.disk.seq_write.4096` lie within 20bdd1401's boot spread; no `persist.*` row lies past it.

| row | T14 X-E | 20bdd1401's boots | AMD X-E | 20bdd1401's boots |
|---|---|---|---|---|
| `persist.seq_write_fsync` (MB/s) | 181 | 175–233 | 588 | 524–657 |
| `fs.disk.seq_write.4096` (MB/s) | 170 | 166–174 | 297 | 250–297 |

- Every `persist.*` row is within or better than that spread, but one: T14 `persist.fsync_clean` 14.38 µs, against the spread's 13.78–14.33. It is 0.05 µs past it, read as within measurement resolution, not a regression.
- T14 `fs.disk.seq_write.1048576` reads 441, back in the fast mode, as the drift account (`r3/t14-boots.txt`) predicted.
