# PR 1013, round 2 (review round 1) at 0193e43e3, on main c2fa26319

- ci-host.log: exit 0, 93 green.
- readback-doitm-off.*: crypto_instrument (cryptocase) and crypto_secret_timing_curves (cryptoctcurvescase), staged (exit 2).
- readback-doitm-on.*: crypto_secret_timing_curves with DOITM set on every CPU, from wt/toyos-crypto-perf-doitm 22344f2eb (this code plus crypto-sec's probe 380e63bbd; never lands), staged (exit 2).

Paths are masked as $HOME, $SCRATCH, $WORKTREE and $PRIMARY.
