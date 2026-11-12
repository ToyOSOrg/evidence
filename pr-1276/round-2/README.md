# PR 1276, round 2: host evidence at 924b72173 and the B1 control's build

Head `924b72173e520ca1d4465e8e1f0b8f9c1cbea448`, fork `ed29321759dfc6c981926cb0c59f7deb9936b12c`, macOS arm64 host. Paths are masked.

| file | command | exit |
|---|---|---|
| `fork-check-r2.log` | `cargo check --target x86_64-unknown-toyos --features os-poll,net` in the fork at `ed29321`'s source, against this tree's sysroot `0dd1ef87d639f652` and `sdk/abi` | 0, no warnings |
| `mio-r2-guestbuild.log` | the guest crate's `mio_registers_while_parked` and `mio_waker_coalesces`, built as `build_toyos_bin` builds them (`pr-1276/host/guestbuild.sh`) | 0, mio from the fork at `ed29321` |
| `mio-r2-host.log` | `cargo test --lib -- sourcegate`; `cargo test -p toyos-net-node` | sourcegate 9 passed; the node's host tests all pass, mio from the fork at `ed29321` |
| `mio-control-b1-guestbuild.log` | the same guest build on the control branch at `95301017f` | 0, mio from the vendored copy |

The control branch `mio-registration-wakes-selector-control-b1` at `95301017f` is the head with the fork at `ed29321` vendored under `tests/guest/rust-tests/mio-control`, the guest crate pointed at it (`control-b1-manifest.patch`) and one mutation (`control-b1-mutation.patch`): `SelectorInner::change` neither signals the change event nor marks it signalled. Compared with `git archive ed29321` over the paths the vendored copy holds, only `src/sys/toyos/selector.rs` differs.

## The B1 control's run

Run 43163987153 (https://github.com/ToyOSOrg/ToyOS/actions/runs/43163987153, `guest-rows-control-b1-43163987153.log`, runner paths masked). The runner checked out `95301017f`, x86-64 under KVM, with 0.05 CPUs of other work. Red as predicted: `1 of testcases's 242 member(s) did not exit 0: test_rs_mio_registers_while_parked`, `exited 1`. The member said `a waker registered and woken while the poll was parked was not its event within 10s`, 10 s after its start (6.206 to 16.206 on the guest's clock). Every other member exited 0. The control branch was deleted after the run; `control-b1-manifest.patch` and `control-b1-mutation.patch` are its whole difference from the head.
