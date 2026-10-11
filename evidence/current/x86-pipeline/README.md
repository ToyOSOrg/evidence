# x86 batch implementation: native correctness and throughput

The hosted x86 candidate adds four independent AES CTR lanes, hardware SubWord
and four-block CLMUL GHASH. Byte reflection uses SSE2 shifts/masks, polynomial
multiplication uses three CLMUL products, and one reduction folds the aggregated
four products. All indices, counter values, shifts, loop counts and CPU guards
are public; each vector memory access stays within a fixed array or complete
batch. GCM's existing length bound implies the last counter is at most u32::MAX.
The UEFI register-preserving per-block implementation remains the fallback.

`cross.log`: Linux x86, Windows MSVC and x86 UEFI clippy, dispatched and portable,
all warnings denied, exit 0. `arm-gates.log`: ARM dispatched/portable release
suites (46 tests each), all-target all-feature clippy, Rust 1.89 host library
check and formatting, all exit 0. None executes the new x86 implementation.
`assembly.log`: baseline Linux and UEFI release library assembly scans contain
no AVX mnemonics or YMM/ZMM operands. Full assembly is retained losslessly in
the `.s.gz` files; this scan is not a complete constant-time or erasure review.
`package-list.log`: analysis tools, benchmarks, evidence and private communication
are excluded from the deliverable package.

At source `afcc50b20f7d50fe128dc211589d5f52a1233c57`, r0021/r0022 each pass
46 baseline tests. All twelve architecture-appropriate controls fail tests
with exit 101, including the x86 batch counter and H^4 anchors; no compiler
failures count. Two ARM-only controls skip on x86 (fourteen defined in total).
Each source restoration diff returns 0. `native/r0021/` and `native/r0022/`
retain complete runner logs, baseline logs, mutation patches/logs/exits and
independent validation inventories.

## Paired native Linux comparison

Candidate source above versus `af822f5cce8921bea903fd8acbba5a9fac473f6e`:
three alternating pairs C,B / B,C / C,B per machine. Every run separately builds
its exact commit. Stock ring 0.17.14 interleaves inside each run, retaining its
runtime dispatch. Candidate and baseline each have 21 samples per workload;
ring pools 42 across the six runs. All 12,600 CSV rows validate independently,
with no sample removal. r0023-r0028 are t14; r0029-r0034 are amd. Complete build,
environment, exit and output files and all CPU-2 clock rows are retained.

Median seal of a 16,384-byte record:

| Host | Algorithm | Old, µs | New, µs | ring, µs | Old/new | New/ring |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| t14 | AES-128-GCM | 52.793 | 9.400 | 3.030 | 5.62 | 3.10 |
| t14 | AES-256-GCM | 57.893 | 10.448 | 3.412 | 5.54 | 3.06 |
| t14 | ChaCha20-Poly1305 | 67.403 | 66.850 | 11.989 | 1.01 | 5.58 |
| amd | AES-128-GCM | 82.664 | 13.365 | 7.935 | 6.18 | 1.68 |
| amd | AES-256-GCM | 91.768 | 15.348 | 8.723 | 5.98 | 1.76 |
| amd | ChaCha20-Poly1305 | 100.495 | 97.942 | 13.778 | 1.03 | 7.11 |

CPU 2 affinity, turbo off, performance profile/governor and fixed frequency
limits were applied and restored by the orchestrator. Every retained one-second
CPU-2 interval reports busy clock 2400 MHz on t14 or 1797 MHz on amd. Approximate
clock-derived AES-128/256 cycles per byte are 1.377/1.531 on t14 versus ring
0.444/0.500, and 1.466/1.683 on amd versus ring 0.870/0.957. These conversions
use interval observations, not per-sample cycle counts. The harness's own
uncontrolled-clock label reflects its lack of internal policy management;
external policy and monitoring are retained separately in the same logs.

This is not a no-AVX ring comparison. Opening, rejection, setup and small-record
results remain in both full analysis JSON files, including per-run medians.
Reproduce from repository root:

```sh
python3 tools/analyze_ring_pairs.py evidence/current/x86-pipeline/native t14
python3 tools/analyze_ring_pairs.py evidence/current/x86-pipeline/native amd
```

AVX paths are now authorized but not implemented. UEFI runtime, ToyOS userland
custom targets, deployment side-channel qualification and independent external
review remain open. Physical compiler/stack key copies remain outside the
wiping guarantee. Native correctness and measured speedup do not establish
security parity with ring or deployment qualification.

## Current-source timing on t14

Run r0035 at the same `afcc50b2` source completed with exit 0. The independent
analyzer validates all 960,000 raw samples (16 families including the synthetic
control, three seeds, 20,000 samples each), retaining every observation.
The largest cryptographic absolute Welch t is 2.919702 for ChaCha seed 3;
the largest temporal-quarter absolute t is 2.927484. No full cryptographic
score crosses the 4.5 investigation threshold. The deliberately leaky controls
have t scores -2320.999145, -1464.997958 and -710.535122, confirming sensitivity
to that synthetic leak. These observations do not prove constant time.

`timing-t14/` retains complete normalized logs, compressed raw samples and
recomputed statistics. All 1,459 retained one-second CPU-2 busy-clock intervals
report 2400 MHz; prior machine settings were restored. The AMD counterpart
r0036 has also completed, as recorded below. Reproduce statistics with:

```sh
python3 tools/analyze_timing.py evidence/current/x86-pipeline/timing-t14/output.txt.gz --count 20000 --routines all
```

## Current-source timing on amd

Run r0036 completed at the same source with exit 0 and restored machine settings.
All 960,000 samples validate without removal. Maximum cryptographic |t| is
1.860513 (HKDF seed 1); maximum temporal-quarter |t| is 2.474788. Synthetic
controls are -165.588576, -652.836818 and -696.570765. None of the 45 full crypto
scores crosses the 4.5 investigation threshold. All 2,054 one-second CPU-2
busy-clock intervals report 1797 MHz. Full normalized logs, raw samples and
independent analyses are in `timing-amd/`. The same analyzer command above,
substituting `timing-amd`, reproduces the results. Both native sweeps now cover
the batch and wiping changes; they do not prove constant time or qualify
future AVX implementations.
