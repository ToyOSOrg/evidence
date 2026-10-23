# Round 4: the AMD bench at 199b88703

- `amd-199b88703/`: `cryptocase`, `cryptoctcase` and `testcases` on the AMD bench (Ryzen 7 4800U,
  signature 0x860f01, microcode 0x860010d), rebased head 199b88703. All three verdicts passed.
  `cryptocase-rows.txt` is the parity table; `cryptoctcase-lines.txt` the fast constant-time
  program's lines (ChaCha20-Poly1305 seal and refusal at 64 B max |t| 1.08 and 1.31; OpenSSH seal
  and refusal at 64 B 0.45 and 1.12; controls held).
- `amd-base-4ffa3ab1a/`: the base, from an earlier AMD boot of probe 4ffa3ab1a, whose ChaCha,
  Poly1305, AEAD and dispatch files are 18a38738b's (main's since, but for a726d52c1's public
  `xor` and docs); the probe's own rows are left out.
- Against that base: 64 B seal and open 7 to 9% faster, OpenSSH 0 and 64 B 8 to 11% faster, 0 B
  and 1 KiB within 1%. Seal 16 KiB is 1.8% slower on the asserted pass and 0.7% on the
  unasserted, beside spreads of 0.4 to 0.8% and across two boots; a same-day base boot of main is
  staged to settle it.
- `ci-host-199b88703.log`: `cargo run -- --ci host`, exit code on its last line.
