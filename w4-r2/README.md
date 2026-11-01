# W4a (ToyOS #1140), round 2

Masking as in `w4-r1/README.md`.

| check | command | revision | exit | log |
|---|---|---|---|---|
| host CI | `cargo run -- --ci host` | 5958bdc5fea6a64e4145e3098cf4b32813f3e005 | 0, 108 steps green | `ci-host.log` |
| image | `cargo run -- --build-only` | da93691368dad95244aab6fa65a8df06416c7229 | 0; `bin/wlan` and `bin/wifi` in ROOT | `build.log` |
| `wifi status` in a guest | `cargo test --test toyos-build -- a_launch_gives_each_unsent_stdio_slot_a_null --nocapture`, with `wifi-status-oneoff.patch` applied and then reverted | 71bad9cf0c17d2a2d6daf4448556ac1a688ce022's tree plus the patch | 0; the job asserted `wifi status` said `"no radio\n"` | `wifi-status-oneoff.log` (`ONE-OFF:` line) |
| negative controls | `controls/run.sh` | 5958bdc5fea6a64e4145e3098cf4b32813f3e005 | each 101, red only its target | `controls/summary.txt` |

- **The image build's first attempt at 5958bdc5f failed.** `wifi`'s new stdin loop left `len` untyped. Host CI builds no ToyOS-only program, so its result is unaffected. da93691368 types it as `usize` and changes nothing else, and its build exits 0.
- **The one-off patch** gives `launchcase` a `wlan` row (in `[boot] start`) and a `wifi` row, and gives test-runner `starts = ["wifi"]`. Its job launches `/system/bin/wifi status` with a pipe for stdout and asserts what it reads. Since 71bad9cf0 only `wifi`'s passphrase read and that one-line type changed; `status` reaches neither.
