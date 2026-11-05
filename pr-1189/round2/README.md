# pr-1189 round 2: the loader moves into `toyos::dl`

- `hostci.log` (`hostci.rev`): `cargo run -- --ci host` at 125b8929f, exit 0, 108 steps all green.
- `build2.log` (`build2.rev`): `cargo run -- --build-only` at 774465867, exit 0.
- `buildtests.log`: the build's publish/std-crate tests (`cargo test --lib -- sdkversion:: sysroot:: toolchain::tests::a_std_built toolchain::tests::dep_info`), 28 passed.
- `controls/`: negative controls, each applied as a checked patch to a copy of `lib/elf`, `sdk/abi` and `sdk/toyos` at the round's sources, built, run, restored:
  - mut3: unknown relocation types skipped again; red in toyos-elf and toyos::dl.
  - mut4: a strong undefined symbol bound to 0; red.
  - mut5: discovery without its in-set check; the cycle test never ends (killed by a 20 s alarm, rc 142).
  - mut6: no write into the main thread's TLS block; red.
  - mut7: W+X library segment allowed; red.
  - mut8: constructors in reverse order; red.
  - mut9: lazy-call trap regardless of BIND_NOW; red, and green once restored.
- `size.txt`, `hello.rs`: a hello-world's size before and after.
- `metal-request.txt`: the T14 staging at 125b8929f with each image's sha256.
