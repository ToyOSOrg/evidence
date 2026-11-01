# W2a, round 2: ToyOSOrg/ToyOS#1130

Head `af13f26ec`: the recorded-handshake test, its fixtures and their `NOTICE`/`COMMITTED_FILES`
rows, the clause-check issue. Paths are masked: `<worktree>`, `<scratch>`, `<home>`, and
`<bench-dir>` for the bench's temporary directory.

| check | command | revision | exit | log |
|---|---|---|---|---|
| host CI | `cargo run -- --ci host` | tree of `af13f26ec` (commit message amended after the run; tree identical) | 0, 107 steps green | `ci-host-2.log` |
| control | `controls/nonces-swapped.patch` applied (PTK nonces in the wrong order), `cargo test -p toyos-wlan-handshake --test capture`, reverted | the round's tree | build 0, test 101: both capture tests fail at "message 2, byte for byte"; restore 0 | `controls/nonces-swapped.log` |

## capture-r1: the run on the T14 bench (Ubuntu 24.04, wpa_supplicant v2.10), rc=0

- `capture.sh.as-staged` is the script as I staged it; `capture.sh` is the run's, with the
  orchestrator's two fixes (station link up for its tcpdump; `group_rekey` in the network block).
- `psk/` and `pmf/`: `air.pcap` (every frame on the medium, radiotap from `hwsim0`), both sides'
  `-dd -K -t` logs, configs, `result`. `eapol.pcap` is empty (24 bytes): the station capture
  lost its socket.
- Results: both scenarios "connected, 0 group rekeys, 1 4-way completions". The AP log shows
  `group_rekey=4` and `wpa_ptk_rekey=9` parsed and no rekey in the 64 s the AP ran after the join.
- The fixtures `system/wlan/handshake/tests/fixtures/{psk,pmf}.pcap` are records
  18, 127, 131, 133, 135, 137 (psk) and 18, 126, 131, 133, 135, 137 (pmf) of each `air.pcap`,
  copied by `tools/subset.py` (`tools/list.py` lists a capture). sha256:
  psk ae7b93c03d1e5a236fc3c4537c7550021367095a2a8a020ab66f59edba7de6bc,
  pmf c6e7ede7c923975dc260e84efdfd5825e2ab4e09dc1ad1a723a3bd3255e7152b.
- The test's oracle values come from `sta.log`: `PMK - hexdump`, `WPA: PTK - hexdump`,
  `WPA: Group Key - hexdump`, `IGTK - hexdump`. All matched on the first run.
- Nothing in them identifies the bench: the MACs are the script's locally administered
  ones, and the passphrase belongs to a throwaway network. The WPS UUID in the logs is derived
  from hwsim's default address.

## capture-r2: staged, not run

The rekey and group key paths: the station's own `wpa_ptk_rekey=6`, and `wpa_cli REKEY_GTK` on the
AP's control interface. The group path stays unrecorded if v2.10 lacks that command.
