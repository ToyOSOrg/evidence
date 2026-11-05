# S0-a metal round 10, AMD only: the hot-row verdict. Rules set before any boot (2026-11-05)

Round 8 flagged AMD `pipe.throughput.256` (head worse in both pairs, -1.0% and -0.8%). Round 9's
two plain pairs had head better (+0.4%, +3.5%). This round decides by a rule stated now and applied
to every hot row. The bounce copy stays: it is the approved design (coordinator's ruling).

## Arms (kernel code at the PR head; later commits are comments and records)
- **base** = `s0a-r10-base-kvm` 49496f0a3: main e11b6a784 + the per-syscall probe.
- **head** = `s0a-r14-ad-kvm` ea86ed227: bdec5ab36 + the per-syscall probe.

The probe is identical in both arms. Each image is main's whole `benchcase.toml`, with no other
probe; the run is the `osbench` row. Round 8's images were deleted once run, so both are restaged
from the same branches, with hashes in `image-sha256.txt`.

## Order: twelve boots, six adjacent pairs, the order alternating so drift falls on both arms
1-base 2-head | 3-head 4-base | 5-base 6-head | 7-head 8-base | 9-base 10-head | 11-head 12-base

Pairs are (1,2), (4,3), (5,6), (8,7), (9,10), (12,11).

## The rule, for each hot row
The hot rows are `pipe.throughput.64`, `.256`, `.1024`, `.4096`, `ipc.reqrep.8`, `ipc.reqrep.4096`
and `ipc.reqrep_handle.8`.
- **The pair change:** head's p50 against its own pair's base p50, signed so that negative is worse:
  `head/base - 1` for MB/s rows and `base/head - 1` for ns rows.
- **REGRESSION** if either holds:
  - **(a) sign:** head is worse than its pair's base in at least 5 of the 6 pairs. Under no
    difference that is chance with p = 7/64 ≈ 0.11, one-sided.
  - **(b) size:** the mean of the six pair changes is below -1%.
- A REGRESSION in any hot row blocks landing. Otherwise every hot row passes, and the per-pair
  changes and their mean are reported.
- No pair is set aside after the fact. AMD's slow IPC mode can land on one boot of a pair, and it
  counts like any other value. Each boot's slow or fast mode is reported beside its IPC values.

## Also reported, not judged
Every other row whose mean pair change is worse than -5%, each with its `mhz`.

## Validity
A boot marked INVL, or whose image hash differs from `image-sha256.txt`, is not a value. It is rerun
once in the same position, and the rerun is recorded.
