
## r2: Linux probe round 2 (main 02301e02b against the PR head 7dcf12a5a)
Same probe and agreement checks as r1. Outputs `r2/t14`, `r2/amd` (every run exited 0); `r2/table.md`.

## r3: guest boots at 43690c542, run by the orchestrator
`r3/{t14,amd}/judge-43690c542.log`: the `crypto_instrument` (cryptocase) parity tables, both builds, and the
`crypto_secret_timing` (cryptoctcase) lines. Verdicts: both rows PASS on both benches.
- The T14's `aes-*-gcm/reject/0` failed (1.12 against ring; main reads 57–61 ns, the head 108–109).
- Cause: the refusal's `fill(0)`, a library `memset`, which is `rep stosb` on ToyOS.
- Fixed at 5b26ab26c; that commit's boot is pending.
