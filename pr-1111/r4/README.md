# PR #1111 review r1 (`042b2b299`)

- `1111-burst-tests.log`, `1111-kernel-lib.log` (369 passed), `1111-sim.log`: the review tree before the test helper's clippy fix (`fn` parameter to `bool`), exit 0 each.
- `ci-host-1178599c4.log`: `cargo run -- --ci host` at the top of the stack (#1129 `1178599c4`, which contains this head), 108 steps all green, exit 0.
- `mutations/`: `mut-1111-burst.patch` (settle ignores what is queued ahead) applied, run and reversed by `mutate.sh`. Each log ends with `MUTATION_EXIT=101` and `restored`; the two burst tests red, nothing else. `mut-1111-burst.log` is the review tree, `mut-1111-burst-r2.log` is `1178599c4`.
- `tty/`: `cargo test --test toyos-build -- libc_children` on QEMU x86-64, 2 CPUs, on the development host. Six runs at `042b2b299` (`step1-*`) and six at its base, main `24a538c88` (`main-*`). All 12 exit 0, with no stall (`exits.txt`).
