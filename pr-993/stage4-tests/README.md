# toyos-crypto stage 4, the test side (ToyOS PR #993)

Development Mac (M4 Pro, macOS, aarch64), under load from other work; host
toolchain `stable` 1.98, Miri on `nightly-2026-09-25`. Revisions are this
branch's (`wt/toyos-crypto-sec`).

## Host checks

- `cargo run -- --ci host` at 86e864208 (issue edits uncommitted, see
  `ci-host-2.status`): exit 0, 87 steps green — `ci-host-2.log`.
  `ci-host-1.log` (at 8c785b481) is the earlier red: clippy only, fixed in
  e27737d76.
- The crate's three forms timed (`forms-1.log`, at 43ea41ba9 + nothing
  else): about 20 s of test execution per form, about 200 s of CPU each.
- `cargo test -p toyos-crypto --features std,sign,wpa2,rustls-provider
  --target x86_64-apple-darwin` under Rosetta (AES-NI, PCLMULQDQ paths):
  exit 0 — `x86-rosetta-dispatched.log`.
- Vector tallies, every file's cases judged or counted outside the
  interface by reason: `vector-tallies.log` (`tallies.rev`), exit 0.

## Negative controls

`controls/head/`: each of the 15 checked patches applied at 86e864208, its
exact test run (`exact.txt`; m03 under Rosetta, the only path that reaches
GCM's one-batch compare), and the patch reverted by `run.sh`. Every one
exits 101 with its named test FAILED.

`controls/` (top): the first pass at 063e7c7e2, every patch against the
crate's whole suite. Two survived — `m07` (SEC 1 coordinate range) and
`m13` (RSA signature length), `*.before-test.log`, exit 0 — and redden only
after the tests of 8c785b481 (`m07-*.log`, `m13-*.log`, run on 063e7c7e2's
source with those tests in the tree).

## Miri

- `miri/miri-unsafe.log`: `cargo +nightly-2026-09-25 miri test -p
  toyos-crypto --all-features --lib -- secret:: ct::` at 86e864208, exit 0:
  the volatile wipes, `erase`, a dropped `Secret`, and `ct`'s barriers.
- `miri/miri-control.log`: the same with `erase` writing one byte past its
  array (`miri-m01-erase-one-past.patch`): Miri reports the out-of-bounds
  write as Undefined Behavior, exit nonzero.
- `miri/miri-full-in-progress.log`: every `portable` unit test but the
  provider's (ring is C, which Miri cannot run), started at 43ea41ba9 with
  the ct/secret tests of 063e7c7e2 in the tree. Still running when this was
  published; its first 12 tests pass and it has spent over an hour in
  `gcm::tests::counters_continue_across_the_stitched_and_tail_paths`.

## Constant time

Not yet measured on a bench. `constant-time/metal-request.txt` is what the
orchestrator runs (`metal-request.rev`). The rest is exploratory:

- `qemu-tcg-instant-2000.log`: both programs under TCG, timed with
  `Instant`, 2,000 measurements: the leaky control reads |t| 0.01 and
  4.36, and both programs fail as designed. This is why the harness reads
  the TSC.
- `qemu-tcg-tsc-20000.log`: the TSC, 20,000 measurements: control |t| 59
  and 66, both programs end cleanly. TCG's timings judge nothing.
- `mac-exploratory-*.log`: a host build of the same source, under load, on
  Apple silicon without DIT: not evidence about any routine.
