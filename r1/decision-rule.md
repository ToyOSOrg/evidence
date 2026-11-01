# NVMe APST A/B: the decision rule, fixed before any run

## Arms

- **B (head):** `nvme-apst` at HEAD (named in the request), as pushed.
- **A (control):** the same revision with `control-no-apst.patch` applied for
  staging only and reverted in the same command. The patch makes `set_power`
  return before its Set Features, so the driver leaves Feature 0Ch as `main`'s
  driver does (it never issues it). Its log line reads "A/B control, the table
  is not set".
- **Why not literal `main`:** `main` has neither `persist.write_4k_fsync_after_idle`
  nor the `osbench_disk` row, so it cannot measure the cost. The arms differ
  in the driver's APST call alone; the bench, image and harness are the same.

## Boots per bench, interleaved A1 B1 A2 B2 ...

- `osbench_energy`: 3 A + 3 B (`energybenchcase`). Idle power is the
  whole machine's, so nothing else runs in that boot (the row's contract).
- `osbench_disk`: 2 A + 2 B (`diskbenchcase`: `files`, `nvme`, `persist`).
- Same setup on every boot: AC, panel lit, nothing else running.
- Linux on each bench, at this revision's binary: `osbench persist` and
  `osbench files`, 2 runs. Linux's default APST, with the same 100 ms latency
  ceiling, is the independent leg for the after-idle cost.

## Statistic

Per boot, each row's own p50. Across an arm's boots, the median of those.
A difference "resolves" when every B boot lies on the claimed side of every
A boot. That is an exact one-sided permutation p of 1/20 at 3+3 and 1/6 at
2+2.

## 1. The idle power gain (reported; not by itself a gate)

- G = median_A − median_B of `energy.idle.package` p50, mW, per bench, with
  each arm's package C-state residencies.
- The package counter does not include the drive's own power. On the T14 the
  display, as the GOP left it, holds PC2 (`issues/the-t14s-idle-package-stays-in-pc2.md`).
  So a null package gain there is an expected result while the display holds
  the package, and does not reject APST. Linux shows a 3.5 W APST effect only
  where the rest of the platform lets the package go deeper.
- **Blocks readiness:** B's idle package resolves *higher* than A's on either bench.

## 2. The I/O latency cost (the gate)

- R = the round trip (ENLAT + EXLAT) of the deepest state B's table reaches,
  read off B's boot log. It is at most `EXIT_BOUND_US` = 100 ms by
  construction.
- **First I/O after idle:** Δ = median_B − median_A of
  `persist.write_4k_fsync_after_idle` p50.
  - **Acceptable iff Δ ≤ R**, and B's largest after-idle sample ≤ A's
    largest + R. That means the drive keeps the latency its descriptors
    state, and the 100 ms design bound holds on metal.
  - Δ > R means the drive's descriptors understate its wake. That is not
    ready: the bound would have to come from measurement instead.
  - Reported beside it: Linux's after-idle minus back-to-back on the same bench.
- **Back-to-back disk rows** (`fs.disk.*`, `nvme.*`, `persist.*` except
  after_idle). A row regresses iff median_B is worse than median_A by more
  than 5% *and* the difference resolves (every B boot worse than every A).
  - **Acceptable iff no row regresses.**
  - Why it could regress: the clock settle between rows idles the disk for
    up to 0.5 s. With ITPT = 50 × round trip, a shallow state with a round
    trip of 10 ms or less can be entered inside that gap, so a row's first
    operations may pay a wake. The rows' warm-ups absorb most of it.
  - 5% is a noise floor for single-boot p50s, not a derived bound. The
    resolution condition carries the significance.

## Verdict

- **Ready:** §2 is acceptable on both benches and §1 does not block.
- Otherwise, report which bound failed with the numbers. No change to
  `EXIT_BOUND_US` or `IDLE_PER_LATENCY` is made to fit a bench.
