# PR #1054 evidence: AES-GCM on VAES-512 and AES-NI

## r1: Linux probe round 1 (toyos-crypto ec76bb2a7 and its ablations, base 5414a891c)
- The probe is the crypto-oracles r2 probe (ring 0.17.14, OpenSSL 3.5.5, AWS-LC 5.11.0, toyos-crypto in
  [profile.toyos]'s shipped settings), with lib/crypto swapped per binary (`build.sh`) and an extended
  agreement check (`probe-main.rs`, `aes_gcm_agrees_past_its_steps`).
- Binaries: base, full, and the five ablations `variants/a*.patch`: a1 a reduction per step, a2 Karatsuba,
  a3 scalar counters, a4 two-pass open, a5 round keys reloaded each step. Negative controls:
  `variants/m1*.patch` and `variants/m5*.patch`.
- Outputs, run by the orchestrator: `t14/`, `amd/` (`run<N>-<binary>.txt`, `control-*.txt`, `host.txt`).
  Every run exited 0; m1 and m5 exited 101 on the T14. `table.md` tabulates the AES rows.
- `inspect/`: disassembly of the GCM kernels (`dis.sh`) at ec76bb2a7 (full) and at the PR head
  7dcf12a5a (`r2-full`) beside its base 02301e02b (`r2-base`).
- `emu/`: a scratch harness, not in the tree. It runs `vaes512` with each 512-bit intrinsic as its
  128-bit instruction on four lanes, under Rosetta. `mutants/`: eleven mutants and their verdicts
  (`summary-1.txt` at ec76bb2a7, `summary-2.txt` at the PR head).
- `host/`: `cargo run -- --ci host` at 7dcf12a5a, the crate's tests under Rosetta (AES-NI) and under the
  emulation (512-bit), and natively (AArch64, portable).
- Paths are masked to `~`.
