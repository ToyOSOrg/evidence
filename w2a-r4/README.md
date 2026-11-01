# W2a, round 4: ToyOSOrg/ToyOS#1130, the PTK rekeys

The head is `26652fe17`: review r1's fixes at `1679ef913` (round 3), plus the rekey fixtures and their test.

| check | command | revision | exit | log |
|---|---|---|---|---|
| host CI | `cargo run -- --ci host` | `26652fe17` | 0, 107 steps green; the four capture tests ran | `ci-host-6.log` |
| controls | each `controls/<name>.patch` applied, then `cargo test -p toyos-wlan-handshake --test capture`, then reverted | `1679ef913` plus the uncommitted rekey test (as committed at `26652fe17`) | build 0, test 101, restore 0 | `controls/<name>-capture.log` |

Each control reds only the two rekey tests:
- `group-reinstalled`: the GTK is handed out again at every rekey.
- `rekey-snonce-reused`: a rekey answers under the installed handshake's SNonce.

## capture-r2: the T14 bench, wpa_supplicant v2.10, rc=0

- Results: psk and pmf each "connected, 0 group rekeys, 3 4-way completions".
- `rekey-gtk.txt`: "Unknown command 'REKEY_GTK'".
- The station's `wpa_ptk_rekey=6` drove two rekeys per run. At each rekey the station logged "Not reinstalling already in-use GTK" (and "... IGTK" under PMF).
- The fixtures `rekey-{psk,pmf}.txt` were written by `tools/rekeyfixture.py`. Its inputs were `air.pcap` (Probe Response records 17 and 18, Association Request records 124 and 125) and `sta.log`.
- Masked: `<bench-dir>` is the bench's temporary directory. The MACs are the script's locally administered ones.
