
## r2: Linux probe round 2 (main 02301e02b against the PR head 7dcf12a5a)
Same probe and agreement checks as r1. Outputs `r2/t14`, `r2/amd` (every run exited 0); `r2/table.md`.

## r3: guest boots at 43690c542, run by the orchestrator
`r3/{t14,amd}/judge-43690c542.log`: the `crypto_instrument` (cryptocase) parity tables, both builds, and the
`crypto_secret_timing` (cryptoctcase) lines. Verdicts: both rows PASS on both benches.
- The T14's `aes-*-gcm/reject/0` failed (1.12 against ring; main reads 57–61 ns, the head 108–109).
- Cause: the refusal's `fill(0)`, a library `memset`, which is `rep stosb` on ToyOS.
- Fixed at 5b26ab26c; that commit's boot is pending.

## r4: the 16-byte refusal wipe on ToyOS
- `r4/{t14,amd}/judge-5b26ab26c.log`: `cryptocase` and `cryptoctcase` at 5b26ab26c, the wipe fix before the
  review-r1 rebase (rebased as d597a086a; code unchanged).
  - T14 reject/0: 56.7 and 61.2 ns (0.589, 0.632), back at main's 57–61.
  - AMD: 64.6 and 67.9 ns.
  - Constant time passes on both benches.
- `r4/toyos-disasm/`: `Gcm::open` and `secret::wipe` from `crypto_parity` for `x86_64-unknown-toyos`,
  `[profile.toyos]`, built from 778ac04ee (the review-r1 code commit; `erase` is `wipe` over a value's bytes).
  - `open` calls no `memset`: its calls are the tag, CTR, stitch, digest, short path and panics.
  - The wipe is inlined as 16-byte stores.

- At 16 KiB the 16-byte wipe costs more than the `memset` did.
  - T14 reject/16384: 1898 and 2094 ns (0.988, 0.982), against 1462 and 1643 ns at 43690c542.
  - AMD: 3916 and 4213 ns (1.135, 1.112), against 3556 and 3873 ns.
  - Recorded in the track and the `memset` issue.
