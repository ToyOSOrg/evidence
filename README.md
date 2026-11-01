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

r2/  #1114 rebased onto #1112's review fix (15fdb0e9b); supersedes r1/staged, which carried the 64-segment cap and never ran.
  host/ci-host-b3aee3b18.log    cargo run -- --ci host: 105 steps, all green, EXIT=0
  host/tcp-test-b3aee3b18.log   cargo test -p toyos-net-tcp --no-fail-fast: 437 passed, EXIT=0
  host/controls/                the seven pacing controls (patches in r1/host/controls) rerun at b3aee3b18, all exit 101
  staged/                       the T14 session: C = 15fdb0e9b, P = b3aee3b18, Q = P + the N = 1.25 patch; request.txt with the rule

r3/host/  #1114 rebased onto #1112's review r2 fix (417b74b9f): head 2b865e208
  ci-host-2b865e208.log, tcp-test-2b865e208.log (440 passed), controls/ (the seven pacing controls rerun, all exit 101).
  The staged session in r2/staged stands: its C = 15fdb0e9b and P = b3aee3b18 differ from these heads only in how sub-SMSS
  sends join a run, and the bulk upload sends full segments whose runs are single-instant bursts, timed the same by both.

r4/t14/  The A/B staged in r2/staged (T14, osbench_lan, peer the AMD bench's Linux over its Wi-Fi). Order: Linux L1,
  c1 p1 q1 c2 p2 q2 c3 p3 q3, Linux L2; every boot rc 0, every judge exit 0. C = 15fdb0e9b, P = b3aee3b18, Q = P with N = 1.25.
  session/t14-linux-{1,2}.{txt,err}, toyos/<arm>.{txt,verdict.txt,judge.log}; judgement-table.txt per arm: p50, received-by
  marks (MB), css / css entry rounds, loss counters, RTT samples by source, the pacing hold's total time.

r5/host/  #1114 rebased onto main after #1112 (dc1a8642e), with the header rule (a send joins a short run only if short too): head ce43f3f7d
  ci-host-ce43f3f7d.log (107 steps, all green, EXIT=0), tcp-test-ce43f3f7d.log (441 passed, EXIT=0),
  controls/ the header rule's control (any send joining a short run): exit 101, failing s_rt_025.
  Masked under #1119's rule, model strings included.

r6/  Review r1 of #1114 at ToyOS 3a0744d34 (on main 24a538c88; the bucket at most half the window; the ramp issue kept open)
  host/ci-host-3a0744d34.log (107 steps, all green, EXIT=0), host/tcp-test-3a0744d34.log (442 passed, EXIT=0),
  host/controls/ eight pacing controls with patches and logs, all exit 101.
  staged/ the T14 parity boot (Linux, p1, Linux): request.txt with the rule, the image hash, the staging log (exit 2: staged),
  and the Linux binaries' hashes rebuilt at 3a0744d34 (the peer's are unchanged).

r7/t14/  The parity boot (T14, osbench_lan, peer the AMD bench's Linux over its Wi-Fi): Linux L1, p1 = 3a0744d34, Linux L2;
  image and binary hashes checked before it started; every run rc 0, the judge exit 0. session/ the Linux runs,
  toyos/p1.{txt,verdict.txt,judge.log}, judgement-p1.txt. Masked under #1119's rule, model strings included.
