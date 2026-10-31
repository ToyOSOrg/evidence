# pr-1114: tcp: new data is paced, and HyStart++ grows by all an ACK acknowledged

r1/host/  At ToyOS dfeb1fcfa (#1114's head)
  ci-host-dfeb1fcfa.log   cargo run -- --ci host: 105 steps, all green, EXIT=0
  tcp-test-dfeb1fcfa.log  cargo test -p toyos-net-tcp --no-fail-fast: 435 passed, EXIT=0
  controls/               seven negative controls: each patch applied, [tcp]'s tests run, reverted (git apply -R on a clean,
                          committed tree); summary.txt gives each one's exit (all 101) and failing tests, <name>.log the full run
r1/staged/  The T14 session staged for the A/B (not yet run): request.txt with the decision rule set before the run,
  image hashes, and each staging's log (exit 2 is staging's normal end: no machine touched).
  C = f1a230e00 (#1112), P = dfeb1fcfa (#1114), Q = P + controls/pace-mut-n-slow-start-1.25.patch.
Paths are masked as <worktree>, <primary>, <scratch>, <tmp>, <home>.
