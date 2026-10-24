# PR 1064 evidence

r1 (revision in r1/ci-host-2.rev):
- ci-host-2.log: `cargo run -- --ci host`, exit=0, 103 steps green.
- m*-*.patch / .log: negative controls for `located`, `Carrying` and
  `adoptable`. Each patch was applied, built and run with
  `cargo test -p toyos-metal --lib`, then reverted. Each one exited 101 at
  the test its log names.
