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
