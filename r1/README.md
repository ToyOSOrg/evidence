# PR #1063 round 1 (branch p256-speed 4a4cf1f2d, main 2a5b446b0)

Development Mac evidence; home paths masked as `<home>`. No bench has run yet.

- logs/vm-<suite>-c1.log, vm-<suite>-c1p.log: the crate's lib, differential, wycheproof, vectors, nist and fuzz
  tests for x86_64-unknown-linux-musl (opt-level 2, assertions on) as PID 1 under QEMU TCG `-cpu max`
  (BMI2/ADX: the kernels), dispatched and `portable` forms. The kernel's "exitcode=0x00000000" is the exit code.
- mutants/*.patch and logs/vm-mutant-*: twelve mutations at 4a4cf1f2d, each built and run (lib and Wycheproof);
  logs/mutants-c1.txt summarises. Every one fails.
- logs/vm-probe-*: the probe's agreement checks with ring, OpenSSL and AWS-LC at main and the branch.
- logs/host-test-c1.log, ci-host-c1.log (`cargo run -- --ci host`, 103 steps green, exit 0),
  build-only-c1.log (exit 0), metal-*-prepare.log (images staged, exit 2 = nothing established).
- inspection/: disassembly of P-256 doubling and addition, main against the kernel path.
- staged/: the bench set's README, hashes and probe source (with the scratch-only parts hooks).
- *.sh, *.py: the scratch build and VM scripts.
The SHA256SUMS line for probe-src.tgz names the unmasked archive staged for the benches.
