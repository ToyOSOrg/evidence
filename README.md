# Evidence for ToyOS PR #961: libc starts and waits for children; clang's driver links inside ToyOS

- `host/`: `cargo run -- --ci host` at 3efa38eb7, exit 0, 87 steps green.
- `image/`: `cargo run -- --ci image` at 439775090, exit 0. The one later commit changes a list in a build-system test.
- `guest/`: at 439775090, `libc_children hosted_clang_hello virt_claim_lpi virt_unmap_touch virt_smp virt_readonly_copyout`, all PASS; plus the pre-merge runs at 61a283a40.
- `control/`: one patch and its run log per negative control, each red on its arm. m00 did not build (an unused function under -D warnings), so it proved nothing; m00b, the same mutation keeping the function referenced, is the valid one.
- `metal/`: the T14 request as staged. Not run by the implementer.
