# #993 review round 2

Revisions: the code at 9022dcca381ecc6e2c26e0709a36446e5fe3bea2 (branch `wt/toyos-crypto-sec`); the issue edit after it is markdown only.

- `cargo run -- --ci host` at 9022dcca381ecc6e2c26e0709a36446e5fe3bea2, the issue edit uncommitted (`ci-host-3.status`): exit 0, 87 steps green — `ci-host-3.log`.
- Cost (B6), one session on the development Mac: `forms.sh` builds, then times `cargo test -p toyos-crypto` in each of the three forms. Main at 5e01f8b87: 8.9 + 6.2 + 4.7 s wall, 15 s user (`cost-main.log`). This branch: 9.1 + 58.4 + 6.5 s wall, 396 s user (`cost-branch.log`); the `portable` form carries the arithmetic-only tests.
- Negative controls (`controls/`) at 9022dcca381ecc6e2c26e0709a36446e5fe3bea2, each patch against its exact test (`exact.txt`; m02's is now `wycheproof aead`, since the GCMVS decrypt files are gone; m03 under Rosetta): all 15 exit 101 with that test FAILED (`summary.txt`, `m*.log`).
- Miri (`miri/miri-2.log`) at eddf2622b, whose `lib/crypto/src` is 9022dcca381ecc6e2c26e0709a36446e5fe3bea2's: `cargo +nightly-2026-09-25 miri test -p toyos-crypto --all-features --lib -- --skip rustls_provider`: exit 0, 25 passed, 1 ignored under Miri (ML-KEM's 3329² pairs), 11 filtered (the provider, whose oracle ring is C). 2,968 s.
- Constant time:
  - `bench-{t14,amd}-ec5a0cd18-confounded.txt`: the orchestrator's exploratory boots of the fast program at ec5a0cd18 (the program's lines only). Every routine read LEAKS; the harness then made each random input next to the clock (review B2), so these are no finding. Job time: T14 968 s, AMD 823 s, from which the fast bound is set.
  - `qemu-tcg-r2-20000.log`: both revised programs under TCG at 20,000 measurements (a temporary harness entry, not committed): each ends with exit 0; leaky control |t| 10.1 to 22.0, null control 1.2 to 2.1, every routine below 4.5. TCG's timings judge nothing.
  - `metal-request-{t14,amd}.txt`: the images staged at 9022dcca381ecc6e2c26e0709a36446e5fe3bea2.
