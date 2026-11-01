# PR #1131 r2: what causes APST's T14 idle increase

- **Revision:** `18ac97aec`, plus the patches in `patches/`. Every image carries `probe.patch`.
- **Boots:** four T14 `osbench_energy` boots, in the order below. All ended with EXIT=0 and passed their judges.
- **Rule:** fixed before the run, in `request-rule.txt`.
- **Probe:** Get Features 02h on each I/O that arrives at an idle device. It shows the state found, and the gap since the last submission.

| boot | idle p50 mW | mean | seconds ≥ 10 W | p25 | state at idle arrivals (end of boot) |
|---|---|---|---|---|---|
| 1 B | 7760 | 9511 | 21 | 6286 | ps0 1734 (gap ≤ 89 ms), ps3 2, **ps4 15** (gap 12 ms-30 s) |
| 2 A | 7156 | 8266 | 12 | 6354 | ps0 1744 (gap up to 30 s) |
| 3 B, no PS4 (bound 5 ms) | 6819 | 7549 | 7 | 5960 | ps0 1752, **ps3 18** (gap 121 ms-30 s) |
| 4 B, ITPT ×10 | 6847 | 7484 | 7 | 5942 | ps0 1735, ps3 3 (1.8-4.5 s), **ps4 7** (4.8-30 s) |

The same columns for r1's T14 boots:

| boots | p50 | seconds ≥ 10 W |
|---|---|---|
| A | 6538, 6632, 6442 | 2, 9, 7 |
| B | 7494, 6855, 7040 | 15, 11, 12 |

## Under the rule

- **D:** the gap is 604 mW, at least 200, so **drift is excluded**. B ran first and is still higher. Over r1 and r2, B is higher in 4 of 4 pairs, in both orders.
- **V:**
  - no-PS4 scores f = −0.56, so it **removes** the increase.
  - ITPT ×10 scores f = −0.51, so it **removes** the increase.
  - The rule's reading is "frequent cycling into PS4".
- **P: the probe contradicts that reading.**
  - During idle, I/O reaches the drive about once every 10-30 s in every arm (the log's own writes). That is not frequent cycling.
  - The ITPT ×10 boot still sits in PS4 through long gaps, yet draws as little as no-PS4.

What the two variants share against B is that neither enters PS4 within about 400 ms of activity:

- B goes PS0 → PS3 after 100 ms, then PS3 → PS4 after 300 ms more.
- no-PS4 stops at PS3.
- ITPT ×10 reaches PS4 only after 4 s.

The baseline is the same in every arm (p25 5.9-6.4 W). The difference is in how many seconds exceed 10 W. Neither the CPU time charged during idle nor any process's share of it differs between arms.

The cause of those spikes is not established. The PC2 issue already records unexplained 12-15 W seconds.

## Limits

- Each variant is a single boot.
- The in-session A (7156) is above r1's A range. The probe's own Get Features may add cost.
- The probe gives the state at each arrival, not residency.
