# #1121 round 4, head b480a2a93 (c715ebfb5 + an issue record)

| log | what | tree | exit |
|---|---|---|---|
| ipccopy-{t14,amd}.txt, ipccopy-judgment.txt | the copy split, one boot per bench | ipc-messages-ab-copy eb58854e8 | both passed |
| ci.log | `cargo run -- --ci host` | c715ebfb5 | 0, 107/107 |
| sdk-test.log | `cargo test -p toyos --lib ipc::` | c715ebfb5's tree | 0, 10 passed |
| remote-qemu.out | 18 QEMU registrations (runner) | c715ebfb5 | 0, 18/18 |
| debug-results.txt | `--debug` shared boot (runner), the members in members.txt | c715ebfb5 | all 9 exit 0 |
| ab-request.txt | the landing A/B, base 18060b521 against head c715ebfb5, rule stated before the run | staged | - |
