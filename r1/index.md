# pr-1243 r1: ToyOS 3b07ea1dd9969dc641557193a9e6f34c2c80285e

| File | Command | Target | Exit |
|---|---|---|---|
| `host/checks.log` | `cargo test -p kernel --lib mitigation` | host (aarch64-apple-darwin) | 0, 17 passed |
| `host/checks.log` | `cargo test --test toyos-checks` | host | 0, 45 passed (`mitigations_verdict` among them) |
| `host/checks.log` | `cargo clippy -p kernel --lib --tests --features sched-check -- <adopted lints> -D warnings` | host | 0 |
| `host/checks.log` | `cargo clippy -p kernel --target x86_64-unknown-none -- <adopted lints> -D warnings` | x86-64 kernel | 0 |
| `host/checks.log` | `cargo clippy -p toyos-build --all-targets -- <adopted lints> -D warnings` | host | 0 |
| `host/checks.log` | `cargo test --test toyos-build -- --metal --metal-readback <scratch>/metal-a mitigations microcode` | x86-64 image, no machine | 2 = staged, nothing measured |
| `metal/request.txt` | the staging's request: one `metalcase` boot, carrying the `mitigations` and `microcode` rows | T14 and the AMD bench | not yet run |
| `control/mutations.log` | each `control/*.patch` applied with `git apply`, `cargo test -p kernel --lib mitigation`, restored with `git checkout` | host | 101 each, as expected; tree clean after each |
| `control/drop-amd-g2.{patch,log}` | AMD's G-2 rule (LFENCE dispatch serializing) removed | host | 101: 5 tests fail |
| `control/amd-family-17h-dropped.{patch,log}` | family 17h dropped from the AMD rule that names it affected | host | 101: 2 tests fail |
| `control/intel-row-dropped.{patch,log}` | Intel's row for 806C1 dropped from the table | host | 101: 3 tests fail |

Host paths, user and host names are masked (`<scratch>`, `<home>`, `<user>`, `<host>`).
