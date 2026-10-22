toyos_crypto-tests-79fbb43af: toyos-crypto's library unit-test binary at #1014's head 79fbb43af,
static-pie for x86_64-unknown-linux-musl.

Built in a scratch worktree with:
  CC_x86_64_unknown_linux_musl=clang cargo +nightly-2026-07-22 test -p toyos-crypto \
    --features std,sign,wpa2 --release --target x86_64-unknown-linux-musl --lib --no-run
after removing three dev-dependencies (musl-devdeps.patch): ring, rcgen and rustls's ring backend.
They need a C compiler and libc headers for Linux musl, which the development Mac lacks. Without them
the rustls-provider feature's tests cannot build, so it is off. The library source, the kernel and the
test are byte-for-byte 79fbb43af.

Run on the bench's Linux:
  ./toyos_crypto-tests-79fbb43af rsa::tests::instruction_path --nocapture
A pass that prints "cpuid leaf 7 ebx: bmi2 1 adx 1" and "instruction path: the BMI2/ADX kernel"
shows the kernel ran and matched the portable multiplication on 320 cases.
