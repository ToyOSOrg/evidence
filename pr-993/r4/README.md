# #993 round 4: on main with #997, #999 and #1000

Code at d79698fbe (on main 954b4587b). Head 0ce19e2e2 adds only an issue edit.

- `ci-host-4.log`: `cargo run -- --ci host` at d79698fbe, exit 0, 87 steps green. Its three fiat-crypto lines are sshserver's, removed by #1005; this branch has no fiat dependency.
- `r4-crypto-*.log`: `cargo test -p toyos-crypto` in the three forms, each exit 0.
- `controls/`: all 15 negative controls at d79698fbe, each patch against its exact test (`exact.txt`), each exit 101 with that test FAILED (`summary.txt`). m10 (now on `PublicScalar::canonical`) and m11 (`Point::decode`) were re-derived for #997's code; the other patches apply unchanged.
- `miri/miri-4.log`: `cargo +nightly-2026-09-25 miri test -p toyos-crypto --all-features --lib -- --skip rustls_provider` at d79698fbe. Exit 0, 44 passed, 1 ignored under Miri (ML-KEM's 3329² pairs), 11 provider tests filtered (ring is C). Wall time 3 h 08 min.
- `metal-request.txt`: the staged curves boots on #1000's P-256 code.
  - (a) T14 as-is at d79698fbe, and the same image on the AMD bench as the control.
  - (b) T14 with DOITM on: `doitm-probe.patch` on top of d79698fbe, never landed.
  - (c) the parity cost row with DOITM off.

## Rebased again onto main d7f269dbc: head 9217793d2

Main had added its own `Arm::adds_ms`, so this branch now keeps main's field and adds `named_only` beside `bent`. Nothing under `lib/crypto` or `tests/guest` changed since d79698fbe, so the three-form, control and Miri results above still apply.

- `ci-host-5.log`: `cargo run -- --ci host` at 9217793d2. Exit 0, 93 steps green.
- `controls/n1.log`: the named-only control at 9217793d2. It goes red as expected.
- `metal-request.txt` and `doitm-probe.patch`: restaged at 9217793d2, with the probe at 380e63bbd. These replace the staging recorded above.
