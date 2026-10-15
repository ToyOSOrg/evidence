# #935 review round 1, at `de8e9883a`

`origin/main` `3b77b9b2f` (#936) merged at `48af2c242`; the round's last code commit before `de8e9883a` is the merge, and `de8e9883a` changes one test judge.

| file | command | exit | revision |
|---|---|---|---|
| `ci-host.log` | `cargo run -- --ci host` | 0, 86 steps green | the merge, `de8e9883a`^ (`de8e9883a` changes `tests/toyos.rs` alone, a guest judge no host step runs) |
| `guests.log` | `cargo test --test toyos-build -- <the 18 rows of stage-b/guests-merged.log>` | 1: 17 passed, `virt_claim_lpi` red on its judge (VirtIts has a second root at bus 8, so root 0 is `0x00..=0x07`) | `de8e9883a`^ |
| `virt_claim_lpi.log` | `cargo test --test toyos-build -- virt_claim_lpi` | 0 | `de8e9883a` |

Controls (each red as it must be):
- `old-per-root-bound`: the per-root bound of 8 restored in acpiserver's read; `a_root_with_many_windows_is_declared_and_only_an_absurd_one_refused` red (exit 101). At `0a67b018e`.
- `osc-committed`: the root `_OSC` committed after its query; `a_roots_osc_is_never_committed` red (exit 101). At `71bce126f`'s tree.
- `malformed-left-unknown`: `Held::refuse` leaves the state `Unknown`; `a_malformed_record_is_refused_by_name_and_is_the_answer` red (exit 101). At `71bce126f`'s tree.

No bench was staged: per the owner's ruling the branch is blocked on step 10 (the kernel's xHCI and HDA removed), and until then a bench whose unit is no wider than its CPU gives the kernel's xHCI no domain, by design.
