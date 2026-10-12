# PR #871's metal run, judged against the plan fixed before it (`metal/request.txt` at b47770c)

Arms: base `23cc92f22` (`050e46beb` + the scout's test side), head `229c55558` (`bbe8df088` + the same test side),
mut-slot `b0d75d331` (head + the stack-slot mutant). **M** is a figure printed by a boot; **D** is derived from M figures.
Source: **whole** is a whole flash log under `flash-logs/`; **recovered** is only in `recovered/`, the judge's output as
the analysing agent's transcript holds it, because the readbacks were lost when the session scratchpad was wiped.

## Kill: head's `scout-sys: getpid: min tsc=` at most 0.75 x base's, on each bench (scout_syscall row, scout-base boot)

| bench | base (M) | head (M) | head / base (D) | 0.75 x base (D) | source | verdict |
|---|---|---|---|---|---|---|
| T14 | 687 | 431 | 0.627 | 515.25 | whole: `t14/base-scout-base.log`, `t14/head-scout-base.log` | not dropped |
| AMD | 452 | 219 | 0.485 | 339.00 | whole: `amd/base-scout-base-flash.log`, `amd/head-scout-base-flash.log` | not dropped |

The same job in the testcases boot (`syscall_cost`), a second reading: T14 686 / 426 = 0.621 (recovered), AMD 459 / 219 = 0.477 (whole).

## Prediction: head within 5 % of the scout's `both` arm, 423 TSC on the T14 and 218 on the AMD bench

| bench | head (M) | band (D) | off the arm (D) | verdict |
|---|---|---|---|---|
| T14 | 431 | 401.85 .. 444.15 | +1.89 % | met |
| AMD | 219 | 207.10 .. 228.90 | +0.46 % | met |

## Guard: head's `scout-wake: phase=0 ... rounds=` not more than 5 % below base's

| bench | base (M) | head (M) | head vs base (D) | source | verdict |
|---|---|---|---|---|---|
| T14 | 532948 | 560571 | +5.18 % | base whole (`t14/base-scout-wake-rerun.log`, the re-run); head **recovered** only | passes |
| AMD | 599257 | 622832 | +3.93 % | whole | passes |

## Correctness: `vector_state` passes for base and head on both benches

| bench | base (M) | head (M) | source | verdict |
|---|---|---|---|---|
| T14 | exit=0, 17 threads, Width(Avx512) | exit=0, 17 threads, Width(Avx512) | **recovered** only | met |
| AMD | exit=0, 17 threads, Width(Avx) | exit=0, 17 threads, Width(Avx) | whole (`amd/*-testcases-flash.log`) | met |

## Control: the mutant turns `vector_state` red on the T14 (judge exit 1)

| image | expected | got (M) | source | verdict |
|---|---|---|---|---|
| mut-slot testcases | exit 1, `vector_state` red | judge exit 0; `vector_state: 17 threads each held Width(Avx512) through 3 rounds`, exit=0 | whole (`t14/mut-slot-testcases.log`), judge recovered | **failed: the mutant survived** |

## Lost whole logs, to re-run if the evidence must be whole

The T14's base testcases, head testcases and head scout-wake boots: their readbacks were in the wiped scratchpad, and the
orchestrator's logs under their names record another pull request's boots (`flash-logs/t14/not-871-logs.txt`). Their
images are gone too, so they are re-staged from `23cc92f22` (base) and `229c55558` (head).
