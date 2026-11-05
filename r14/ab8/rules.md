# S0-a metal round 8, confirming: the rules, set before any boot (2026-11-05)

## What round 7 found
- **AMD:** the large spawn's paged read copied a page through a just-populated user leaf in
  1871-1877 ns, against main's 685 ns through the direct map, with the same frames and instruction.
  `fault_in` took 48 ns a page, and the copy took one fault per spawn.
- **T14:** malloc churn's loss is code placement. 32 inert bytes that return the allocator to its
  old alignment restore base's values, and the spin stays (issue
  `osbench-s-malloc-churn-on-the-t14-moves-a-fifth-with-the-allocator-s-code-placement`).

## The change under test
`bdec5ab36` makes x86-64 user leaves accessed, and dirty where writable, from creation. The walker's
flag update on a fresh leaf is the one difference round 7 leaves between the two copies.

Before any boot, on KVM (guest runner, r14):
- `proc.spawn_wait.large`: 6.95/6.90 ms against main's 7.63/7.61.
- `mem.anon.touch`: 69150/69408 ns/MiB against 116429/117083.
- Hot pipe rows: unchanged or better.

The change touches every x86-64 user mapping, not only this path, so both benches repeat the
hot rows.

## Arms
- **base** = `s0a-r10-base-kvm` 49496f0a3: main e11b6a784 + the probe.
- **head** = `s0a-r14-ad-kvm` ea86ed227: PR head bdec5ab36 + the probe.
- **cad** (AMD only) = `s0a-r14-cad-kvm` eb61b94f6: head + round 7's copy probe.
- **testcases** = bdec5ab36, the same 19 members as round 6.

Every benchcase image is main's whole `benchcase.toml`.

## Order of boots
- **AMD:** 1-base 2-head 3-head 4-base 5-cad 6-testcases.
- **T14:** 1-base 2-head 3-head 4-base 5-testcases.

## Rule 1, hot rows
Round 6's rule, unchanged, with fewer pairs:
- **AMD, judged by pair** (1/2 and 4/3): a hot row is a REGRESSION when head is worse than its own
  pair's base in both pairs, by any amount. It MOVED better when head is better in both. Otherwise
  it is UNCHANGED, with each pair's ratio reported.
- **T14:** a hot row moved when both head values lie outside both base values, on the same side.
  Moved worse by any amount is a REGRESSION.

## Rule 2, the large spawn
- **FIXED:** head is not worse than its pair's base on AMD in both pairs, and on the T14 it does not
  lie above both base values.
- **AMD's mechanism is CONFIRMED** when cad copies a page in at most 800 ns: round 7's base paid
  685 for reach, pin and copy, and head 1871. It is REFUTED if cad copies a page in 1500 ns or more.

## Rule 3, other rows
Any other row worse past 5% is REPORTED with its `mhz`, and is not by itself a verdict.
`mem.anon.*` and `mem.map_*` are expected better on both benches.

## Rule 4, testcases
All 19 members exit 0, judged by re-running the staging command with the readback in place.

## Rule 5, validity
A boot marked INVL, or whose image hash differs from `image-sha256.txt`, is not a value. It is
rerun once, and the rerun is recorded.
