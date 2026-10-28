# PR #1074, round 6: what was left of the pipe's cost, and the fix

Four T14 sessions, each interleaving base and the image under test, two boots each. Base is 544f9cc3c's clean image (in diag5 too).
Every image except base and `cand` is measurement-only and never lands: it is 0a48bf8b4 (or base, for `pmubase`) plus the patch in `patches/`.
`rows-*.txt` are each boot's osbench lines, and `pipediag-*.txt` are its counter lines. `judge-*.log` are the harness's verdicts, with paths masked.

## Hypotheses tested, pipe.throughput p50 MB/s (4096 / 16384 / 65536)

| Session | Image | Tests | Boot 1 | Boot 2 | Base boots 1, 2 |
|---|---|---|---|---|---|
| diag2 | pool | frame reuse distance (a hot pool) | 2115 / 3786 / 5999 | 2220 / 3882 / 6236 | 2211 / 4061 / 6664, 2239 / 4097 / 6704 |
| diag3 | skew | 4K aliasing between user page and frame | 1904 / 3521 / 5920 | 1883 / 3491 / 5868 | 2180 / 4039 / 6589, 2186 / 4039 / 6639 |
| diag4 | super | frames physically adjacent (placement) | 2005 / 3681 / 6172 | 1963 / 3638 / 6051 | 2305 / 4138 / 6728, 2170 / 4032 / 6675 |

None moved the gap. These images carry the pipediag counters, so they compare with each other and with diag5's pmu images, not with clean base.

## diag5: the PMU, and a candidate

- `pmubase` / `pmuhead` read the core's counters around the copy phase. Programming follows Intel SDM Vol. 3B section 20.2. The events come from Intel's Tiger Lake core table: INST_RETIRED.ANY, CPU_CLK_UNHALTED.THREAD, LD_BLOCKS_PARTIAL.ADDRESS_ALIAS (0x07/0x01), L1D.REPLACEMENT (0x51/0x01), L2_RQSTS.MISS (0x24/0x3F) and RESOURCE_STALLS.SB (0xA2/0x08). Fixed counter 2 stays the watchdog's.
- **Per KiB copied, base / head:** a KiB written is copied twice, once by the write and once by the read. Each figure is the difference between consecutive cumulative lines, as the median of 16 rounds over both boots, divided by twice the KiB written.

| Write size | Instructions | Cycles | SB stalls | L1D replacements | L2 misses | 4K-alias blocks |
|---|---|---|---|---|---|---|
| 65536 | 24.1 / 67.9 | 192 / 217 | 14.0 / 0 | 31.9 / 32.2 | 16.5 / 16.6 | 12.0 / 8.4 |
| 16384 | 31.5 / 77.9 | 286 / 323 | 16.3 / 0 | 15.9 / 15.9 | 15.9 / 15.7 | 13.3 / 15.6 |
| 4096 | 66.7 / 124.1 | 331 / 370 | 0 / 0 | 13.6 / 13.7 | 16.6 / 15.1 | 7.3 / 9.0 |

  The head retires 2 to 3 times the instructions with no more cache or alias events: about 44 more per KiB copied, so roughly 175 per 4 KiB user-page piece. Base waits on a full store buffer, and the head does not.
- **`cand`** is 0a48bf8b4 plus `patches/cand-inline.patch`, clean. It inlines the per-piece path: `Bytes::place`/`peek`, `Gather`, `frame_bytes`. Results, base boots 1, 2 against cand boots 1, 2:
  - 4096: 2661 / 2772 against 2662 / 2673;
  - 16384: 4377 / 4434 against 4262 / 4260;
  - 65536: 6953 / 6916 against 6924 / 6861.

  The landing commit is this patch, with the bounds refusal moved to a cold helper.

## Reds

diag3 base2, diag4 super2 and diag5 cand1 are each `wake.onto_busy refused=partner_N_was_not_placed`: the placement starvation the ToyOS issue on spawn placement records. One of them is on a base image. Every other judge passed.
