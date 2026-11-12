# ToyOSOrg/ToyOS#1279, round 1, host evidence

Head `5a1d7c8e609c4adfcfc83a75f8c73928478a3091`, whose code is `69e9405127a79b0be02cb5a0c591aae63241b874`'s (the commit between changes a doc comment), on #1278's
`50c9da201`. Every log is masked (paths, temp paths, the throwaway signing key's fingerprint).

- `b-ci-host.log`: `cargo run -- --ci host` at `69e9405127a79b0be02cb5a0c591aae63241b874`, exit 1. 122 of 123 steps green; the red is
  `the build system`, the recorded macOS `llvm::tests` failure.
- `b-host-1.log`: the kernel library's mitigation tests, the harness's mitigation checks and
  `cargo run -- --clippy` (26 invocations clean), exit 0.
- `b-build-1.log`: the shipping image and the `testcases` image on the test kernel, exit 0.
- `b-disassembly.txt`: `llvm-objdump -d -M intel` of the test kernel: each gate opening
  `f6 44 24 xx 03 74 05 e8`, the clear as Intel's Listing 1 has it after the test kernel's count,
  and the clearing `SYSCALL` entry calling it after the stack switch.
- `b-control-inverted.diff`: the guest control on branch `mitigate-entry-control-inverted`, run
  43158150391, whose result follows with run 43158101891's in a later round.
