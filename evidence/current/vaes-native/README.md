# Native VAES/VPCLMUL qualification evidence

Production source is 3985c25568194d0ccf4c042bf029a7092b20ff01. t14 runs use
220f97867d9e4427dfb07d291df905dd0927e3b3, repairing only a test fixture's byte
width; the first failed attempt is retained in ../vaes-first-native. Benchmark
baseline is 82ae7f9d316795ea0ea1c18e912b4587e1ac74cf. Review follow-up tests use
4d6cec3074ed060a9879995a5e6d3c94fc60ff4f; production is unchanged.

Correctness:
- Original AMD baseline/portable r0059/r0060: 52 passing tests, 14 failing
  mutation controls and 4 feature-specific skips. Exact source restored.
- Repaired t14 baseline/portable r0070/r0071: 52 passing tests, 16 failing
  controls and 2 ARM skips. Exact source restored. VAES runs natively here.
- Review follow-up AMD r0079/r0080 and t14 r0081/r0082: 56 passing tests in
  both dispatched and portable configurations. AMD detects 14 mutations with
  6 feature-specific skips; t14 detects 18 with 2 ARM skips, including wrong
  counter base, tail counter, GHASH top power and lane order. All mutants exit
  101 with actual test failures; none is a compiler failure. Source restored.

Paired benchmarks are C,B / B,C / C,B, ring interleaved: r0061-r0066 (amd),
r0072-r0077 (t14). All 12,600 rows validate without removal. CPU2 one-second
busy clocks remain 1797/2400 MHz respectively; configured policy/turbo settings
are restored. Clock-derived cycles are interval estimates, not per-sample
cycle counts. Ring retains stock runtime dispatch.

16 KiB seal medians in microseconds (baseline / candidate / stock ring):

| Machine | Algorithm | Baseline | Candidate | ring | Speedup | Candidate/ring |
| --- | --- | --- | --- | --- | --- | --- |
| t14 | AES-128-GCM | 9.416 | 5.443 | 3.027 | 1.730x | 1.798x |
| t14 | AES-256-GCM | 10.369 | 5.703 | 3.414 | 1.818x | 1.671x |
| amd | AES-128-GCM | 13.240 | 13.186 | 7.861 | 1.004x | 1.677x |
| amd | AES-256-GCM | 15.192 | 15.197 | 8.637 | 1.000x | 1.759x |

AMD has no VAES/VPCLMUL and exercises the fallback. At 1 KiB t14 speedups are
1.463x/1.491x. ChaCha is unchanged. The full inventories include open/reject,
setup and short inputs. The standard size inventory omits 128-512 bytes; a
separate edge-size profile is needed to assess the new dispatch boundary.

Focused AES timing: r0067 (amd) and r0078 (t14), three seeds, 100,000 samples
per routine/seed, AES-128, AES-256 and the synthetic leaky control. Each host
has 900,000 validated raw samples. Maximum crypto |t| is 1.179696 (amd) and
2.098241 (t14); controls are strongly detected. No samples were removed. This
is finite observational evidence, not proof of constant time or security parity.

Reproduce: tools/analyze_ring_pairs.py <this-directory> t14 --series vaes
(and amd); tools/analyze_timing.py <this-directory>/r0078/output.txt.gz
--routines aes (and r0067). Full raw logs, compressed timing and hashes are
retained. Rust 1.89 x86 builds, isolated parent workspace and package checks
have separate evidence folders. External review, broader fuzzing, remaining
performance work and ToyOS runtime qualification remain open; no delivery pin.
