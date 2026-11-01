# W4a (ToyOS #1140), round 1

Branch `wifi-w4`. Host: an arm64 macOS development machine. `<src>`, `<home>`,
`<scratch>` and `<tmp>` mask local paths.

| check | command | revision | exit | log |
|---|---|---|---|---|
| host CI | `cargo run -- --ci host` | b6749433d53dc77ac02786c8fb5548aaa1d1708a | 1: 107 of 108 steps green, clippy red on three `Duration` subtractions in station tests | `ci-host-2.log` |
| clippy, after the fix | `cargo run -- --clippy` | 55374127eca1a8291d90ab4e54da8fefa59a9190, whose tree is be527dd95cc34fc611d2bb16ec83afeeb1ac4fbc's (an amend changed only the message) | 0, 27 invocations clean | `clippy-1.log` |
| station tests, after the fix | `cargo test -p toyos-wlan-station` | as clippy | 0 | `station-tests-3.log` |
| image | `cargo run -- --build-only` | be527dd95cc34fc611d2bb16ec83afeeb1ac4fbc | 0; `bin/wlan` and `bin/wifi` in ROOT | `build-2.log` |
| shipped image boots `wlan` | `boot.sh`: QEMU q35 under TCG, the image above, no NIC or data partition | be527dd95cc34fc611d2bb16ec83afeeb1ac4fbc | QEMU stopped by PID after the line | `boot-serial.log`: `wlan: serving radio and wifi`, no death line |
| negative controls | `controls/run.sh` | b6749433d53dc77ac02786c8fb5548aaa1d1708a | each 101, red only its target | `controls/summary-2.txt`, each `.patch` and `.log` |

The fix between host CI and the head touches three lines of
`system/wlan/station/tests/{radio,join}.rs` (`.saturating_sub`), so of the host
CI's steps only clippy and the station's tests can differ, and both were rerun.

The ad hoc boot's `/state/<name> could not be made` lines are every service's:
that boot has no data partition. No guest test boots `images/system.toml`.

## Controls

| control | mutation | reds |
|---|---|---|
| wrong-credential | an unanswered message 2 refused as no message 1 | `a_wrong_passphrase_is_refused_on_message_2_going_unanswered` |
| band-ignored | the band dropped from a strong BSS's rank | `a_strong_bss_is_chosen_by_band_and_a_weak_one_by_signal` |
| seen-outside-scan | a BSS reported outside a scan accepted | `frames_out_of_the_protocol_s_order_end_the_radio` |
| verified-not-left | a refusal after a verified MIC not left on | `a_message_3_whose_rsne_is_not_the_beacons_leaves_the_network` |
| positive-signal | a signal above 0 dBm decoded | `frames_that_do_not_decode_end_the_radio` |
| no-rejoin | a lost connection not joined again | `a_connection_lost_is_joined_again_once_and_without_an_answer` |
| mic-counted-verified | `Refused::Mic` classed as verified | `eapol_frames_the_air_spoils_are_dropped_and_counted` |
