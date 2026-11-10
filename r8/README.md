# PR #1131 r8: rebased onto the forced-write change (#1202); checks, and the gates staged

Head `24f5de7789377154d59ee41d880447fae37a7cda` (branch `nvme-apst`), one commit on #1202's
`8a8ff27b9`. The earlier head was `58ba18674`. Paths are masked (`<scratch>`, `<home>`, `<tmp>`,
`<host>`).

| file | command | exit |
|---|---|---|
| `host/ci-host.log` | `cargo run -- --ci host` on a macOS arm64 host | 1: 110 of 111 steps green; the one red is `llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key`, red on every macOS host (`issues/the-llvm-environment-test-breaks-git-on-macos.md`) |
| `host/build-only.log` | `cargo run -- --build-only` | 0 |
| `guest/guest-rows-42920221071.log` | `gh workflow run guest-rows.yml --ref nvme-apst -f filter='nvme_disk_boots'`, https://github.com/ToyOSOrg/ToyOS/actions/runs/42920221071 | success, 1 passed of 1 |

`nvme-apst`'s code is as it was at `58ba18674`; only two comments changed. So the nine tests and
the mutation of r5-r6 (a tier's shallowest state fails exactly the BC501 test) still apply, and the
tests ran again inside `host/ci-host.log`.

## Metal: staged, not run

- `metal/rules.txt`: the rules for one request shared with #1202, fixed before any boot. G1-G3 are
  r6's, unchanged; the base arm is now #1202's head.
- `metal/request.txt`: the three images (M, F, P), their revisions and image hashes, the boots and
  the Linux runs asked for.
- `metal/stage-P.log`, `metal/request-P.txt`: the staging of this PR's image. Exit 2 is the
  harness's "staged": no machine was touched and nothing is judged.

No figure from a bench is in r8. r6 and r7 were measured on a commit path #1152 has since replaced.
