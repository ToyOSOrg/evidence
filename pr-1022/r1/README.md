# ChaCha20 short messages in one register set, rows from the key: round 1

Commit 7a1101024 on main 18a38738b.

- `baseline-m11/{t14,amd}-rows.txt`: the M11 probe's rows (seal at 1 to 192 B against ring, both
  builds), from the boots of probe commit d9b4e1ab8, whose ChaCha code is main's. These are the
  numbers the change answers: the step at 80 B and the per-message constant.
- `inspection/avx512-blocks-main.s`, `inspection/avx512-blocks.s`: `avx512::blocks` before and after,
  shipped profile (`[profile.toyos]`: opt-level 2, debug assertions on), x86_64-apple-darwin, one
  codegen unit. After: the quad's double round is 30 instructions, no stack access in the function.
- `inspection/avx512-xor-four-group.s`: `avx512::xor`'s four-block group: caller data read and
  written 16 bytes per access.
- `linux/`: recipe, hashes and mutant patches of the unit-test binaries for the benches' Linux
  (`README.txt`); results are added when they run.
- `ci-host.log`: `cargo run -- --ci host` at 7a1101024, exit code on its last line.
