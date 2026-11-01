# PR #1131 r1: NVMe APST A/B on the T14 and the AMD bench

The revision is `18ac97aec24c30fd8b4daed20ff7d8f91ce96a42`.

- **B** is the head.
- **A** is the head with `control-no-apst.patch`, so no Set Features 0Ch is sent, as on main.

The decision rule was fixed before any run: `decision-rule.md`.

All 20 boots ended with EXIT=0, and every readback passed its row (`judge/*.log`, each exit 0).

## How the runs went

- Round 1 ran in the requested order (energy A, energy B, disk A, disk B, Linux).
- Round 3 (energy only) and Linux run 2 came next.
- Round 2 ran last. Its first attempt failed on the driving host, which ran out of disk, so it was rerun.
- Within every round A ran before B. A drift in time therefore cannot be excluded as a confounder.

## The drives' tables (B's logs)

| bench | deepest state reached | its ENLAT+EXLAT (R) | table |
|---|---|---|---|
| T14 | PS4 | 1000+5000 us = 6 ms | 0,1,2→3 after 100 ms; 3→4 after 300 ms |
| AMD | PS4 | 2000+8000 us = 10 ms | 0,1,2→3 after 71 ms; 3→4 after 500 ms |

## 1. Idle package power (`energy.idle.package` p50, mW)

| bench | A | B | median B−A | resolved | PC2 ‰ (A/B) |
|---|---|---|---|---|---|
| T14 | 6538, 6632, 6442 | 7494, 6855, 7040 | **+502** | **B higher** (every B above every A) | 994 / 994-995, no PC3+ |
| AMD | 1666, 1690, 1629 | 1628, 1708, 1700 | +34 | no | – |

The T14 idle means are A 7122/7579/7466 and B 9322/8000/8221. The rule is that the idle result **blocks if B resolves higher**, and on the T14 it does.

## 2. The first I/O after idle (`persist.write_4k_fsync_after_idle`, p50 ms)

| bench | A | B | Δ median | R | Δ ≤ R | B max | A max + R | tail ok |
|---|---|---|---|---|---|---|---|---|
| T14 | 5.90, 6.80 | 17.90, 14.21 | **9.70** | 6 | **no** | 18.43 | 12.87 | **no** |
| AMD | 3.01, 3.01 | 10.06, 10.02 | 7.03 | 10 | yes | 10.21 | 13.12 | yes |

Linux, the independent leg, uses its default APST and the same drive (p50 ms):

| bench | back-to-back | after idle |
|---|---|---|
| T14 | 4.69, 1.00 | 13.02, 13.04 |
| AMD | 3.62, 3.68 | 10.89, 11.08 |

On both benches Linux pays a wake of the same size. On the T14, the drive's real wake exceeds its stated 6 ms under both systems.

## 3. Back-to-back disk rows

See `disk-ab.md`, produced by `ab.py`. **No row regresses on either bench.** That means no row where B is more than 5% worse and the difference resolves.

- On the AMD, three rows are resolved worse but stay within 5%: `fs.disk.seq_read.1048576` −2.4%, `fs.disk.seq_write.1048576` −0.9%, and `fs.disk.direct.fstat` +0.3%.
- On the T14, the bimodal fsync is per boot (0.9 ms or 6 ms) and moves whole groups of persist rows between boots in both arms.

## Verdict under the rule: not ready

| | T14 | AMD |
|---|---|---|
| §1 idle | **blocks**: B +0.5 W, resolved | null |
| §2 after idle | **fails**: 9.7 ms against a stated 6 ms | passes: 7.0 ms against 10 ms |
| §3 back to back | passes | passes |
