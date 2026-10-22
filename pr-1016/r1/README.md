# #1016 review round 1

Code at e5414b9a5 (review r1's fixes); the benches ran the probe image below.

## The speed requirement: toyos-crypto's SHA-256 against toyos-sha2-hw's

- **Image:** the probe `bench/probe.rev`, never landed: #1019's head 269e38913 with `toyos-sha2-hw` restored. `crypto_parity` times each SHA-256 against the same ring, two instances, on the T14 and the AMD bench (`metal-adopt` readbacks).
- **Files:** `bench/{t14,amd}-parity-rows.txt` holds every parity row, `-probe-samples.txt` the probe rows' samples, and `-verdict.txt` the judge's verdict, which is passed on both.
- **Units:** "ours" is each row's mean in the instrument's unit. Lower is faster.

| bench | size | toyos-crypto | toyos-sha2-hw | crypto / sha2-hw |
|---|---|---|---|---|
| T14 | 64 B | 99.7 | 461.8 | 0.22 |
| T14 | 16 KiB | 9,660.6 | 10,620.2 | 0.91 |
| T14 | 1 MiB | 615,425.0 | 653,261.5 | 0.94 |
| AMD | 64 B | 84.8 | 235.1 | 0.36 |
| AMD | 16 KiB | 7,763.3 | 7,926.6 | 0.98 |
| AMD | 1 MiB | 493,656.2 | 493,821.5 | 1.00 |

The crate is no slower at any size, and 2.8 to 4.6 times as fast at 64 B.

## #1019's loader verify time, from the same boots

`bench/{t14,amd}-loader-verify.txt` holds the loader's lines, with the header digest masked. On each bench, slot A's signed header verified twice in the readback:
- **T14:** 253,975 and 245,905 counter ticks, at the counter's stated 2,419,200,000 Hz, so about 105 and 102 µs.
- **AMD bench:** 122,724 and 98,190 ticks. Its CPU states no counter rate.

## Miri

`miri-keygen-without-isolation.log`: `MIRIFLAGS=-Zmiri-disable-isolation cargo +nightly-2026-09-25 miri test -p toyos-crypto --all-features --lib -- mlkem::tests::nist_expanded_keygen_secret_matches`. Exit 0, 1 passed.

The extracts carry no machine identifiers. The full loader logs, which name disk GUIDs, are not published.
