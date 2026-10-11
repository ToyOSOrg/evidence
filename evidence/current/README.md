# Current development evidence

This is development evidence, not deployment qualification. The imported logs
at the parent directory remain the historical baseline. Commands use the
baseline compiler target configuration unless stated otherwise.

## Sources and accepted gates

- Primitive ARM changes and arithmetic checks: `2b0f372ed19fce5e81e33824d4352ef59986dde7`.
- Provider source and twelve negative controls: `530d0fedecaff13cdabbdb8957554634e967823c`.
- Timing control and revised comparator lock: primitive source unchanged from
  `2148b933941bee5a4259989cb9b758f6dc0bcd4f`; the comparator lock adjustment is
  dependency resolution only.
- Mac: native AArch64, Rust 1.98.1. Minimum-version check: Rust 1.89.0.
- Native x86 hosts: `t14` and `amd`, Rust 1.98.0, orchestrator runs `r0005` and
  `r0006`. Both passed 46 tests with all 3,056 external primitive fixtures.

| Gate | Command/configuration | Result | Full log |
| --- | --- | --- | --- |
| Default release | `cargo test --offline --locked --release --no-default-features -- --nocapture` | 34 passed, exit 0 | provider-default.log |
| Default external consumer | normal dependency tree with no features | only this crate; exit 0 | core-consumer.log |
| Provider dispatched release | `cargo test --offline --locked --release --features std,sign,wpa2,rustls-provider -- --nocapture` | 46 passed, exit 0 | provider-release-matrix.log (first run) |
| Provider portable release | same, with `--all-features` | 46 passed, exit 0 | provider-release-matrix.log (second run) |
| Debug overflow checking | dispatched feature set above, no `--release` | 46 passed, exit 0 | provider-debug.log |
| Dispatched and all-feature lint | `cargo clippy --offline --all-targets ... -- -D warnings` | exit 0 each | provider-dispatched-lint.log, provider-final-all-lint.log |
| Documentation | `RUSTDOCFLAGS=-D warnings cargo doc --offline --no-deps --all-features` | exit 0 | provider-doc.log |
| Minimum Rust version | `cargo +1.89.0 check --offline --locked --lib --features rustls-provider` | exit 0 | provider-msrv.log |
| Cross-target library | UEFI default; x86 Linux and Windows MSVC with provider | exit 0 each; compile only | provider-cross-checks.log |
| External no-std consumer | independent manifest depends on provider; check and normal dependency tree | exit 0; no ring, C or assembly dependency | provider-consumer.log |
| Negative controls | isolated `cargo run --offline --locked --release --features std,rustls-provider --example negative_controls` | runner 0; 12 mutants exit 101 with failed-test results | provider-mutations.log, provider-mutation-details/ |
| Cargo package | `cargo package --offline --locked --allow-dirty` | package verifies default library; 66 files; exit 0 | provider-package.log |
| Timing sensitivity smoke | `cargo run --offline --locked --release --features std,sign,wpa2 --example timing -- 100` | exit 0; deliberate control visible; no cryptographic timing verdict | timing-control-smoke.log |

`--all-features` enables portable execution. The dispatched command is recorded
separately. The package excludes evidence, benchmarks and private communication;
this local package check does not publish or deliver the crate.

## ARM development throughput

The same seven-sample interleaved comparator was built against the original
primitive source `7bfdf2a6fbb502b013f2de74aea64b530855adf0` and the current primitive source. Three
back-to-back pairs alternate baseline/current order. Every sample is retained
in `ab-baseline-1.log` through `ab-current-3.log`; `ab-medians.json` pools 21
samples per workload and backend. Stock ring 0.17.14 retains runtime dispatch.
Allocation and opening-buffer preparation occur outside measurement. Key setup
includes each implementation's normal destruction.

Median 16,384-byte AES-128 seal changed from 24,212.280 ns to 3,163.940 ns;
AES-256 from 26,534.668 ns to 3,392.212 ns. These are uncontrolled native Mac
measurements. Frequency, affinity and thermals were not controlled. They show
an ARM development improvement in these runs, not a cycles/byte result, an
x86 no-AVX result, a broad win over ring, or deployment acceptance.

The `*-stale-build-attempt.log` measurements are **invalid for comparison**:
the current comparator's locked build refused a stale lockfile, but an older
binary was still invoked. Those six attempts are retained and excluded from
`ab-medians.json`. After updating the comparator lockfile, both binaries were
built successfully and the six accepted runs were repeated.

## Attempts, normalization and limits

Other logs retain intermediate implementation probes, build failures and
superseded benchmarks. They are not additional acceptance claims. Examples:
`arithmetic-dispatched.log` has an unavailable integer-oracle method fixed in
the next attempt; `provider-tests.log` has a missing test import; the next
record test supplied ring a wrong-length AES-128 key; the first hybrid handshake
attempt did not install its reference server group. Each issue was corrected
and the final configurations passed. Compiler failures do not count as
negative controls. One initial isolated-copy setup attempt failed before any
mutation and was rerun from the correct absolute directory.

Complete raw originals were retained outside Git before replacing personal
source/cache/scratch paths with `<crate>`, `<cargo-registry>`, `<user>`,
`<baseline-copy>`, `<mutation-copy>`, `<provider-mutation-copy>` and
`<consumer-check>`. `original-sha256.json` identifies the pre-normalization
files; `SHA256SUMS` identifies the review copies. Output is not truncated.
Private communications are never part of this evidence directory.

## Initial native timing and follow-up

The initial 20,000-sample AMD runs at `2148b933941bee5a4259989cb9b758f6dc0bcd4f`
completed three repeats, exit 0 each. Complete build, environment, exit and
output logs are `native-timing-amd-*.txt`. CPU 2 affinity, performance governor
and turbo disabled were recorded; sampled frequencies still vary. The control
has Welch t values -658.033, -679.698 and -632.468. ChaCha has 0.249, -5.792
and -2.416; SSH has -0.150, -3.525 and -4.022. These are investigation signals,
not constant-time verdicts. All original scores are retained without filtering.

The original harness generates random key bytes only for class one immediately
before measurement. This class-dependent preparation can bias processor state.
The revised harness precomputes fixtures, passes keys through `black_box`,
supports focused runs across distinct seeds, and exports every measured sample
only after each routine. Summaries also expose means and standard deviations.
The synthetic positive control always remains enabled. Mac smoke checks verify
three seeds, four routines and 1,200 raw samples; they do not qualify timing.
Raw records use `sample,seed,routine,index,class,nanoseconds`. The revised example
passes dispatched clippy with warnings denied and Rust 1.89 example checking;
full commands/output are `focused-timing-lint.log`, `focused-timing-msrv.log`,
`focused-timing-smoke.log` (100 samples, seeds 1/2/3, selected routines and raw)
and `precomputed-all-smoke.log` (100 samples, all routines, default seed).

Independent review, controlled timing analysis, complete official corpora,
sustained malformed-input fuzzing, Windows runtime, UEFI execution and ToyOS
integration remain open. The initial t14 request r0007 has completed, exit 0 for all three repeats;
its complete logs are `native-timing-t14-*.txt`. The platform capped CPU 2
at 900 MHz despite the performance governor. Its absolute nanoseconds do not
represent base-clock throughput.

The focused follow-up r0009 (t14) and r0010 (amd) at
`18fa57db31c4f9c8d034d75f0c31b4f0da9ec345` each completed one command containing
three seeds and four routines, with 100,000 measured samples per routine/seed.
Both returned exit 0 and restored their prior policies. The t14 cap remained.
Complete raw outputs are retained as lossless `native-focused-*-output.txt.gz`
files; build, environment and exit logs remain plain text. For these gzip
entries, `original-sha256.json` hashes original uncompressed output bytes;
`SHA256SUMS` hashes the compressed review files.

`tools/analyze_timing.py` independently checks every sequential sample index,
class count, exported mean/standard deviation and rounded Welch statistic.
It validated 1,200,000 samples from each host with no outlier removal. The
analysis JSON files also retain minimum, maximum, median, p99 and four temporal
quarters per class/seed/routine. Reproduce with:

```sh
python3 tools/analyze_timing.py evidence/current/native-focused-t14-output.txt.gz
python3 tools/analyze_timing.py evidence/current/native-focused-amd-output.txt.gz
```

| Routine | t14 Welch t, seeds 1 / 2 / 3 | amd Welch t, seeds 1 / 2 / 3 |
| --- | --- | --- |
| Positive control | -5815.976 / -4709.775 / -5874.955 | -1533.776 / -1686.843 / -1713.155 |
| ChaCha | -0.769 / 0.380 / 1.365 | -0.561 / -0.067 / -0.183 |
| SSH | -0.565 / 1.995 / 0.389 | 0.252 / -0.004 / 1.441 |
| WPA2 HMAC | -0.870 / 0.863 / 1.163 | -0.615 / 0.502 / 1.969 |

The initial signal was not reproduced with revised preparation, different
seeds and more samples. This does not establish its cause or prove constant
time. The quarter statistics do not expose a persistent large score in these
runs. Other families still need repeats with precomputed preparation, and
source/assembly arguments remain required. No cryptographic timing verdict
or deployment acceptance has been made.

## Full T14 sweep and current-source native correctness

The full precomputed sweep r0011 at
`2e9e5e1c575bd66d50c24df283df7f60a582ec66` completed, exit 0. It covers all
16 routine/control families, three seeds and 20,000 samples per family/seed.
`native-full-t14-output.txt.gz` retains all 960,000 raw samples losslessly.
`native-full-t14-analysis.json` independently verifies every sample index,
class count and rounded summary from the raw samples; no outlier removal.
The largest absolute cryptographic Welch t is 2.810 (P-384, seed 3); the
largest temporal-quarter magnitude is 2.743. Positive controls are visible
(-2785.467, -1369.930, -1623.619). These observations do not prove constant time
and predate the latest wiping and modulus changes.

The orchestrator traced the earlier 900 MHz point to the firmware balanced
profile's guaranteed frequency. This sweep used the performance platform profile,
performance governor and turbo disabled; reported base/maximum is 2.4 GHz.
The run-start sampled frequency is 1.043 GHz, so no fixed-frequency or cycles/byte
claim is inferred from the configuration. Prior platform/governor/turbo settings
were restored. Complete metadata/build/exit records are `native-full-t14-*.txt`.

Reproduce the independent full-inventory check with:

```sh
python3 tools/analyze_timing.py evidence/current/native-full-t14-output.txt.gz --count 20000 --routines all
```

Current source `2f2625696403b1eb0bd9048d3cd11c4da586ea2e` passed the native
T14 correctness run r0013: 46 tests, exit 0, GHASH acceleration admitted.
Complete output/environment/exit records are `native-review-t14-*.txt`. This
includes the existing primitive fixtures and TLS configurations. The matching
AMD full timing and current-source correctness runs are still pending.

The current ring comparator also passes a locked offline smoke invocation:
`cargo run --offline --locked --release --manifest-path benchmarks/ring/Cargo.toml --example compare -- 100`,
exit 0, full output `current-ring-harness-smoke.log`. This short Mac run validates
the harness after the source fixes; it is not a new accepted throughput result.
Controlled Linux head-to-head runs against stock ring are requested separately.
They will retain normal runtime dispatch and do not represent a no-AVX ring
comparison. The harness prints uncontrolled frequency/affinity because it does
not establish or measure those controls; external policy metadata must accompany
the native results, and nanoseconds must not be converted to cycles using a
nominal clock without adequate measured-frequency evidence.

## Matching AMD completion

The matching AMD full precomputed sweep r0012 at
`2e9e5e1c575bd66d50c24df283df7f60a582ec66` completed, exit 0. All 960,000 raw
samples validate against the independent inventory/count checks and exported
statistics without removing outliers. Complete output is losslessly retained
in `native-full-amd-output.txt.gz`; analysis is `native-full-amd-analysis.json`.
The largest crypto |t| is 1.840 (P-256, seed 2), and the largest temporal-quarter
magnitude is 2.596 (SHA-512, seed 3). Positive controls are -672.343, -740.379
and -596.057. Policy metadata records performance governor, turbo off, maximum
1.8 GHz and restoration afterward. These are observations at the earlier source,
not constant-time proof or current-source timing qualification. Reproduce with:

```sh
python3 tools/analyze_timing.py evidence/current/native-full-amd-output.txt.gz --count 20000 --routines all
```

Native current-source AMD correctness r0014 at
`2f2625696403b1eb0bd9048d3cd11c4da586ea2e` also passed 46 tests, exit 0, with
GHASH acceleration admitted. Complete output/environment/exit logs are
`native-review-amd-*.txt`. Both native x86 correctness revalidations are now
complete. The older pending statements above describe the state when their
evidence was collected. Current compiler/hardware timing qualification, physical
key-copy concerns, external review, complete corpora and deployment remain open.

## Pre-batch Linux comparison against stock ring

Runs r0015/r0016 at `af822f5cce8921bea903fd8acbba5a9fac473f6e` compare
current primitives (unchanged since `2f262569`) to ring 0.17.14 on Linux.
Three repeats, seven interleaved samples per workload/backend, all exit 0.
The independent analyzer validates all 3,150 rows per host: full expected
inventory, unique repeat/sample identifiers, workload iteration counts and
independently rounded timing columns. The 16 KiB workload caps at 1,024
iterations; smaller workloads use 2,000. Every sample is retained; no outliers
removed. Full logs and pooled/per-repeat medians are `native-ring-*-*.txt/json`.

Median encryption times for a 16,384-byte record:

| Algorithm | t14 ring, µs | t14 ours, µs | ours/ring | amd ring, µs | amd ours, µs | ours/ring |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| AES-128-GCM | 3.029 | 52.739 | 17.41 | 7.934 | 82.639 | 10.42 |
| AES-256-GCM | 3.417 | 57.850 | 16.93 | 8.716 | 91.782 | 10.53 |
| ChaCha20-Poly1305 | 12.013 | 67.175 | 5.59 | 13.781 | 100.697 | 7.31 |

Stock ring retains runtime dispatch. This is not a no-AVX ring comparison.
This pre-batch source lacks the ARM batch CTR/GHASH optimization; closing
the measured bulk gap is an open performance gate. Setup/empty/small/open/
reject rows are also retained; the table does not claim one overall score.

The orchestrator pinned CPU 2, disabled turbo, set performance profiles/governors
and requested min=max frequency (t14 2.4 GHz, amd 1.8 GHz), restoring prior
settings afterward. However, run-start frequency snapshots range from 1.450
to 2.402 GHz on t14 and 1.283 to 1.796 GHz on amd. These snapshots do not establish
the frequency during every measured interval. The orchestrator's nominal
cycles/byte conversion is therefore not adopted as an exact measured-cycle
result pending clarification. The nanosecond observations above remain retained.
The harness metadata labels frequency/affinity uncontrolled because it does
not establish them itself; external settings are recorded in environment.txt.

Reproduce pooled/per-repeat statistics with:

```sh
python3 tools/analyze_ring.py evidence/current/native-ring-t14-output.txt
python3 tools/analyze_ring.py evidence/current/native-ring-amd-output.txt
```

The first analyzer attempt used too narrow a tolerance for two independently
rounded timing columns. The corrected tolerance includes both rounding errors;
final inventory and timing-column checks pass. A preliminary iteration-count
check also incorrectly assumed 2,000 for the capped 16 KiB workload, corrected
to the harness's explicit 16 MiB per-sample limit. Neither changed measurements.

## Native x86 batch follow-up

At `afcc50b20f7d50fe128dc211589d5f52a1233c57`, both native hosts pass 46 tests
and all twelve applicable failing mutation controls, including the new x86
counter/H-power checks. Source restoration is exact. Three alternating pairs
per host validate all 12,600 raw rows without filtering. AES-128/256 16 KiB seal
improves 5.62/5.54 times on t14 and 6.18/5.98 times on amd, still trailing stock
ring by 3.10/3.06 and 1.68/1.76 respectively. All measured CPU-2 busy-clock
intervals report 2400/1797 MHz, at one-second resolution. The complete logs,
mutation patches and reproducible medians are indexed in
`x86-pipeline/README.md`. This comparison retains ring's AVX dispatch.

AVX paths are authorized but not implemented. Current-source full timing is
queued as r0035/r0036; earlier full timing predates the batch and wiping changes.
The identified physical provider key copies and deployment/external-review
gates remain open. This evidence does not establish security parity with ring.
