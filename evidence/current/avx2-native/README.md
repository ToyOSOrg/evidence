# Native AVX2 and provider construction evidence

AVX2 source: 2ca7abfc3687c1f9e35924ed5dbd3127f1c5f81f.
Provider construction source: f55746d1ad0122bff4058e6833e505556cf458f3.
Benchmark baseline: afcc50b20f7d50fe128dc211589d5f52a1233c57.

Both sources pass 50 tests on each native host, plus portable runs; each native
control run detects 14 mutations with exit 101 and actual test failures, not
compiler errors. Two ARM-specific controls are skipped. Source restoration
checks are zero. AVX2 controls/portable: r0037/r0038 (t14), r0048/r0049 (amd).
Provider controls/portable: r0039/r0040 (t14), r0050/r0051 (amd).

AVX2 paired benchmarks: r0041-r0046 (t14) and r0052-r0057 (amd), C,B,B,C,C,B.
All 12,600 rows validate, without removal. CPU2 busy clock in every one-second
sample is 2400 MHz (t14) or 1797 MHz (amd); derived cycles are interval-based
estimates, not per-operation cycle counts. Host settings are restored.
At 16 KiB ChaCha seal, baseline/candidate is 1.9985 / 2.1000, and candidate/ring
is 2.7849 / 3.3810. AES is effectively unchanged. Ring uses stock dispatch.

Focused AVX2 timing: r0047/r0058, 100,000 samples x three seeds x four routines
(chacha, ssh, wpa2_hmac, control_leaky): 1.2 million samples per host. Recomputed
maximum crypto |t| is 1.724479 / 1.779339. Deliberate controls are strongly
detected. No outliers removed. These tests do not prove constant time and do
not qualify the later provider or VAES source changes.

Reproduce with tools/analyze_ring_pairs.py <this-directory> t14 --series avx2
(and amd), and tools/analyze_timing.py <this-directory>/r0047/output.txt.gz
(and r0058). Original hashes before path masking are in ../original-sha256.json.

Review D is an automated Claude review, not an external audit. It reports no
blockers and five notes: register residue outside the wipe contract, a private
initialization invariant not enforced by types, a redundant H reset for fresh
storage, ToyOS XSAVE dependency, and assembly-only evidence for instruction
ordering before XGETBV. The H reset is retained to establish AES_K(0) locally.
The report also describes Rosetta correctness runs; their raw logs were not
supplied, so those claims are supplemental rather than archived native evidence.
