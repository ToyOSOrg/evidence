# PR #1062, review r2 (round 5) at `d7fd28f00`

- `guest-console-rows-d7fd28f00.log`: the five console rows, exit 0, 5/5.
- `vmconsole-host-tests-d7fd28f00.log`: `cargo test --lib -p toyos-build -- vmconsole`, 6/6, the merge's UART-tail case included.
- `merge-no-drain.*`: negative control, `merge` returning at the port's end without reading the UART: the merge test fails. (The patch file is the whole working diff of that moment; the mutation is the `PortRead::Ended => return,` line.)

Masked: home and temp paths, user name, CPU model.
