# Round 11 judged: B b76abc3bd against H 3e491cf83 (#1133 code as 97ae8d604), AMD, five pairs

Ten boots B H B H B H B H B H, all verdict passed, copyat and mem exit 0. judge.txt is judge11.py, written
before the run. (A first attempt hung in the bench's reset to firmware after boot 1 completed; the
orchestrator recorded it as a bench sighting and reran the whole round.)

## Verdict as written: Regression, 5 of 5 pairs
Q_H / Q_B per pair: 0.795, 0.931, 0.926, 0.927, 0.927. By the rule the drop is the PR's.

## Reported
- Every boot has the same virtual buffer addresses in both arms (placement notes), and the same clock
  (4241-4291 MHz). memcpy at 0x4282d0 (rep movsb 0x4282da) in every B boot, 0x429560 (0x429593) in every H.
- The drop is uniform across k: H reads about 0.93 of B at every placement in pairs 2-5, and lower in pair 1.
- mem.memcpy.262144 (separate process, never runs the AVX loop): B 38710-41727, H 33830-35036 (0.84).
- copyat.262144.libc.s0.d0 (ns): B 8065-8405, H 8796-9428.
- Round 10's shifted base (base code, no AVX loop) reproduced the mem.memcpy.262144 drop but not the
  placement rows' drop.
