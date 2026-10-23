# P-256 round 2: the form, chosen on the T14's judge rows

T14 `cryptocase` boots (ToyOS, shipped build), against ring; main read P-256 ECDH 1.91 and ECDSA
P-256 verify 1.81:

| form | commit | P-256 ECDH | ECDSA P-256 verify | dir |
|---|---|---|---|---|
| CIOS | 5f9bca079 | 1.573 | 1.478 | t14-cios-5f9bca079 |
| whole product | 97eb589dd | 1.609 | 1.538 | t14-separated-97eb589dd |
| CIOS, inlined | 7c860ab7b | 1.479 | 1.466 | t14-inline-cios-7c860ab7b |
| whole product, inlined | d719a6435 | 1.527 | 1.515 | t14-inline-separated-d719a6435 |

Every boot's verdict passed (agreement with ring included). Chosen: 7c860ab7b, #1036's head.

`linux/`: round 2 on both benches' Linux. Both inlined builds' unit tests pass with the kernels
admitted; the probes put ECDH whole at 79.1 µs (CIOS) and 81.5 (whole product) on the T14, and
69.9 and 69.9 on the AMD bench.
