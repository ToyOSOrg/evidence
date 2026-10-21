# Evidence for ToyOS PR #967

`tlb_shootdown_waits` on metal, `shared-debug` boot. Each directory holds the boot's lines from
`===TEST_START test_rs_tlb_shootdown_waits===` to its `===TEST_END` (`tlb_shootdown_waits.log`),
the machine model and firmware (`machine.txt`), and two verdicts:

- `judge-verdict.txt` — **the test's verdict**: the `[metal] the tests` lines of the judging run
  (`cargo test --test toyos-build -- --metal --metal-readback <dir> tlb_shootdown_waits`), PASS or FAIL.
- `toyos-metal-loop-verdict.txt` — the boot loop's own verdict on the *boot* (`READBACK_VERDICT`,
  `tests/metal/src/lib.rs`): `passed` means the loop flashed, booted and read the stick back without
  a refusal (disk identity, partitions, FAT32 check, ...). It says nothing about any test, and reads
  `passed` for probe-control, whose test exited 101. Published first as `verdict.txt` at 6f6bbae1a;
  renamed here so it is not read as the test's. Main's two red boots (fec5fdd02, 36570e1b1) are on `pr-966`
at f68ff74f0.

Patches (never landed; each applies on the one before, the first on the fix commit 85e651d9c,
whose tree equals the PR's efd27b9eb):
- `diag.patch` (4a29f8831): a `tlb-diag:` line per staged turn: held CPU, the turn's wait, how
  many answers the held CPU gave from inside a shootdown of its own, shootdowns issued meanwhile.
- `probe.patch` (c1ca46276): the test starts 7 helper threads unmapping a page in a loop around
  one asserted ARM sweep, before its ordinary stages.
- `control.patch` (31478a6a4): restores main's rule — a held CPU's answers from its own
  shootdown are not held.

| dir | rev | machine | result |
|---|---|---|---|
| control | 6d314e928 (diag + control, no probe) | T14 20W0003AMZ, N34ET71W 1.71 | PASS: race did not occur (every turn ~20 ms, 0 own-shootdown answers) |
| fixdiag-t14 | 4a29f8831 (fix + diag) | T14 | PASS |
| fixdiag-amd | 4a29f8831 | Lenovo 82A2, DMCN38WW | PASS |
| probe-control | 31478a6a4 | T14 | FAIL: `held=cpu1 took=1490ns held_cpu_initiator_answers=1` |
| probe-fix | c1ca46276 | T14 | PASS: every turn >= 20 ms, own-shootdown answers held on 4 turns |

`host/ci-host.log`: `cargo run -- --ci host` on 85e651d9c, exit 0 (paths masked).
