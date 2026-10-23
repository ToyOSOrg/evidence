# pr-1051 r1: ML-KEM-768 constant time and K1–K4

Branch `wt/mlkem-ct-speed`, head 76bf8b418, on main a183718ea. Measured base for part 1: main
a00a7ff0f, whose `lib/crypto` ML-KEM and Keccak sources equal 4dc75f542's (crypto-oracles r2's) and
a183718ea's. The development Mac (Apple M4 Pro). Home paths are masked as `~`.

## Part 1: integer divides in the machine code

`disasm/scan.txt` is the result of `disasm/divscan.sh` (an awk scan for DIV/IDIV and UDIV/SDIV in
every function whose name contains `mlkem` or `keccak`), run over llvm-objdump listings
(nightly-2026-07-22) of:

- `rlib-*`: toyos-crypto alone in `[profile.toyos]` for each guest triple (`disasm/rlib.sh`, with the
  sysroot the image build uses);
- `sshserver-*`: `target/<triple>/toyos/sshserver` from `cargo run -- --build-only --arch <arch>`. It is
  the only image binary linking ML-KEM (encapsulation only);
- `cct-x86_64`: the x86-64 `crypto_constant_time` test binary (with `decapsulate`), as the metal
  readback staging built it.

Base a00a7ff0f and head 76bf8b418 both have 0 integer divides. Base: LLVM had already lowered
`/ 3329` and `% 3329` to multiply-highs. `disasm/{base,head}/*.mlkem.s` are the scanned functions' listings.

Control n4 (`controls/n4-runtime-divide.patch`, a `black_box` divisor in `divide`) gives one `divl`
(x86-64) and one `udiv` (AArch64) in `compress`, so the scan sees a divide where one exists.

## Negative controls

Each patch was applied with `git apply`, built and run, then reverted with `git apply -R` in the same command:
`cd lib/crypto && cargo test --features portable -- mlkem keccak`.

| patch | expected | result |
|---|---|---|
| n1-divide-floor | division and compression tests fail | exit 101, both fail |
| n2-absorb-misaligned-lane | the split test fails | exit 101, only it fails |
| n3-inverse-unreduced | the bounds test fails | exit 101, only it fails (i16 overflow) |
| n4-runtime-divide | the scan finds a divide | 1 per triple (above) |

## Host

- `host/ci-host-76bf8b418.log`: `cargo run -- --ci host`, exit 0, 103 of 103 steps green.
- `host/ci-host-81accd2de.log`: the same before the clippy fixes, exit 1, clippy red on four lints in
  the branch's own lines (`manual_is_multiple_of`, `chunks_exact_to_as_chunks`). They are fixed in the
  commits that introduced them. The final tree equals 81accd2de's with those four lines changed.
- `host/build-only-*`: `cargo run -- --build-only --arch x86_64|aarch64` at both revisions, exit 0.

## Speed

- `bench/hostbench-results.txt`: exploratory Mac timings after each step (`bench/hostbench`, best of
  15 × 2000, in [profile.toyos]'s settings). c1 is part 1, then K1, K2, K4 and K3, and k3b is K3 at
  the head.
- `bench/keccak-split-main.rs`: one Keccak-f[1600] takes 145.1 ns on the Mac (a scratch build that
  exports the permutation).
- `linux-m1/`: the bench probe as staged. Its README has the run commands, plus SHA256SUMS and the probe
  source (crypto-oracles r2's, with a build-time revision label). The binaries are not published,
  because they embed build paths. The bench outputs land as r2.

## Metal

`metal/request.txt`: the `crypto_secret_timing` boot (`cryptoctcase`), staged at 76bf8b418 for the
T14 and the AMD bench. Its exit status of 2 is the harness's "staged, nothing judged". The verdicts land as r2.
