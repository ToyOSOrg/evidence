# PR 1089, round 2 (ToyOS 31db18c19b82c3b7b7befe8be376b6dbe9aaa5bb, rebased on main)

- `ci-host-2.log`: `cargo run -- --ci host`, exit 0 (the tree as committed).
- `build-only-2.log`: `cargo run -- --build-only`, exit 0.
- `mutations/`: r1's three patches (`../r1/mutations/*.patch`) applied to this head, `cargo test -- cst::`, each exit 101; reverted.
- `metal-prepare-2.log`, `metal-request.txt`: the AMD request, 8 rows over 3 boots (testcases, usbload, benchcase); staged only.
