# W2a, round 1: ToyOSOrg/ToyOS#1130

Branch `w2a-wpa2`, head `228e4f76a` (the crate at `31a5254f1`, then RFC 6070's case, the track
record and one comment). Host: macOS, arm64. Paths are masked (`<worktree>`, `<scratch>`, `<home>`).

| check | command | revision | exit | log |
|---|---|---|---|---|
| host CI | `cargo run -- --ci host` | started at `31a5254f1`; picked up the RFC 6070 test (it ran) | 0, 107 steps green | `ci-host-1.log` |
| crate tests, clippy, crypto vectors | `cargo test -p toyos-wlan-handshake`; `cargo clippy -p toyos-wlan-handshake --all-targets`; `cargo test -p toyos-crypto --features wpa2 --test vectors` | `228e4f76a` | 0, 0, 0 | `final-checks.log` |
| negative controls | each `controls/<name>.patch` applied, `cargo build -p toyos-wlan-handshake`, `cargo test -p toyos-wlan-handshake --test handshake`, reverted with `git apply -R` | `31a5254f1` | build 0, test 101 each, restore 0 | `controls/<name>.log` |

What each control reds (only these):

- `rsne-unchecked`: `message_3s_rsne_must_be_the_beacons`
- `replay-unchecked`: `a_replayed_counter_is_refused`
- `mic-unchecked`: `a_mic_mismatch_is_refused_and_changes_nothing`, `every_single_octet_change_to_message_3_is_refused`
- `snonce-redrawn`: `a_resent_message_1_keeps_its_snonce`
- `group-reinstalled`: `a_retransmitted_message_3_is_answered_and_reinstalls_nothing`, `group_rekeying_installs_a_new_gtk_once`, `a_message_1_after_the_handshake_rekeys_under_a_fresh_snonce`
- `key-id-zero`: `group_key_id_0_is_refused`

The controls ran at `31a5254f1`. `228e4f76a` changes in `src/` only a module comment, so they still apply.

Test-vector values were also recomputed with Python's `hashlib` and `hmac` before they went in
(not a repository tool): Annex J's four PRF cases and its PSK mappings, and RFC 6070's case 3.

`capture/`: the reference-capture script and request staged with the orchestrator for a Linux
bench (two wpa_supplicants over `mac80211_hwsim`, plain PSK and PMF). Not run yet.
