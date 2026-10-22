# #1020 review round 1

`ring-trees.txt` holds `cargo tree -i ring` over the normal and build edges, at #1020's head c195cf54c and at main 18a38738b:
- `-p toyos-build -e normal,build`: nothing at #1020. At main, ring → rustls → ureq → toyos-build.
- `-p doom --target all -e normal,build`, the build-dependencies of doom's guest build: nothing at #1020. At main, ring → rustls → ureq → doom's build-dependencies.
- Positive control: `-p toyos-crypto -e dev` finds ring as the crate's dev-dependency, so the query would print a path wherever one exists.

`--target all` is used because the host rustc has no `x86_64-unknown-toyos` specification for cargo to ask.

`ci-host.log`: `cargo run -- --ci host` at c195cf54c, the head of the stack (#1016, #1019 and #1020). Exit 0, 93 steps green.
