# PR #1215: the `osbench_disk` row, and the forced journal write recorded

`host/ci-host.log`: `cargo run -- --ci host` at `72ce4d25e` on a macOS arm64 host, exit 1: 109 of
110 steps green. The one red is `llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key`,
red on every macOS host (`issues/the-llvm-environment-test-breaks-git-on-macos.md`).

The measurement the records describe is on branch `pr-1202`:
https://github.com/ToyOSOrg/evidence/blob/7efbe1295aa54370b213719b4d4f460e7a103554/ab/README.md
