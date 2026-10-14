# W1b (#930): `lib/ieee80211` fixed where the text check contradicted it

Base: `main` at `2c3f61a3e`. Head: `f9a248b9d`. Host: macOS on Apple silicon, the
development machine. No guest or metal runs: the crate is pure and every claim
is a host test.

## Checks

| Check | Command | Revision | Exit | Log |
|---|---|---|---|---|
| Host suite | `cargo run -- --ci host` | `f9a248b9d` | 0 ("83 step(s), all green") | `ci-host-f9a248b9d.log` |
| Crate tests, fuzz outcomes after | `cargo test -p toyos-ieee80211 -- --nocapture` | `f9a248b9d` | 0 | `crate-tests-f9a248b9d.log` |
| Crate tests, fuzz outcomes before | same | `2c3f61a3e` | 0 | `crate-tests-base-2c3f61a3e.log` |
| Mutations, 12 | `mutations/runmut.sh` | `2c3f61a3e` + the working-tree diff later committed as `f9a248b9d` (diff sha256 prefix `7aa4d161dd3785ed` both times) | each build 0, each test 101; restored 0 | `mutations/summary.log`, `mutations/*.{patch,build.log,test.log}`, `mutations/restored.test.log` |
| Corpus has no Country element | `cargo test -p toyos-ieee80211 --test zz_scratch_country -- --nocapture`, a scratch test (`corpus-country-scan.rs`) that was never committed | the tree of `f9a248b9d` | 0 | `corpus-country-scan.log` |

`Refused::ALL` has 49 variants, up from 47. `every_refusal_has_a_hostile_input_that_produces_it`
checks that the case table reaches each of them and names exactly the set in `Refused::ALL`.

## Mutations

Each patch is applied with `git apply`. The crate's tests are built (`--no-run`) and run, then
the patch is reversed with `git apply -R`.

| Patch | Restores | Red test |
|---|---|---|
| 01 | the old Table 9-38 reading (`0b0010` 256, `0b0100` 128, `0b0110` 32) | `an_he_block_ack_bitmap_is_as_long_as_its_fragment_number_says` |
| 02 | To DS alone in a management frame as `Malformed` | `every_refusal_has_a_hostile_input_that_produces_it` |
| 03 | +HTC in non-QoS data as an `Unsupported` refusal | same |
| 04 | data 2, 3, 5–7 as unhandled, not reserved | `each_type_and_subtype_is_read_or_refused_as_table_9_1_says` |
| 05 | control 0, 1, 15 as unhandled | same |
| 06 | extension 2–15 as `ExtensionFrame` | same |
| 07 | a BlockAckReq's nonzero Fragment Number as `Unsupported` | `every_refusal_has_a_hostile_input_that_produces_it` |
| 08 | reserved BAR/BA Types as `BlockAckVariant` | that test and `a_block_ack_type_is_reserved_or_another_variant_as_its_table_says` |
| 09 | the Country last-channel bound (`first + channels > 201`) | `a_country_element_at_its_bounds_is_accepted` |
| 10 | the old pad acceptance (no length-parity check) | `a_malformed_country_element_is_refused_whichever_rule_it_breaks` |
| 11 | octets past the RSNE's last field accepted | `an_rsn_element_may_end_after_any_whole_field_and_not_inside_one` |
| 12 | a zero first channel or count refused | `a_country_element_at_its_bounds_is_accepted` |

The `Malformed`/`Unsupported` class of each variant is declared once, in the
`refusals!` table, and is checked by reading it. No mutation targets it.

## Sources outside IEEE Std 802.11-2024 and WMM v1.2.0

- **IEEE Std 802.3-2022 §3.2.6 (p. 242).** "If the value of this field is less
  than or equal to 1500 decimal (05DC hexadecimal), then the Length/Type field
  indicates the number of MAC client data octets". "If the value of this field
  is greater than or equal to 1536 decimal (0600 hexadecimal), then the
  Length/Type field indicates the EtherType".
- **RFC 1042** (rfc-editor.org text). "Frame Format and MAC Level Issues": "The
  24-bit Organization Code in the SNAP is zero, and the remaining 16 bits are the
  EtherType". A case-insensitive search of the whole text for `F8`, `80F3`,
  `8137`, `tunnel`, `AppleTalk`, `IPX` and `802.1H` finds nothing. RFC 1042 does
  not define the bridge-tunnel OUI 00-00-F8 or its two EtherTypes, so it cannot
  support that reading.
- **IEEE OUI registry** (standards-oui.ieee.org `oui.txt`). 00-00-F8 is listed
  as assigned to Digital Equipment Corporation, with no mention of bridge
  tunnelling.
- **IEEE Std 802.11-2024 §5.1.4 (p. 429)** names ISO/IEC 11802-5:1997, formerly
  IEEE Std 802.1H, and its selective translation table. We do not have that
  text, so checking the table's two entries stays owed.
