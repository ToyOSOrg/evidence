# pr-1112: tcp: an ACK is timed from its newest segment's departure, at the clock's resolution

r1/t14/  T14 session, osbench_lan, peer the AMD bench's Linux over its Wi-Fi. Order: Linux L1, b1 c1 d1 b2 c2 d2 b3 c3 d3, Linux L2;
  every boot rc 0, every judge exit 0.
  B = ae8e78b4e (#1102's head), C = 1480e1a67 (#1112 before its rebase), D = C + arm-d-l-infinite-unpaced.patch (diagnostic, never lands).
  Images: image-sha256.txt. Peer and T14 Linux binaries: linux-1480e1a67.SHA256SUMS.
  session/t14-linux-{1,2}.{txt,err}  the T14's Linux osbench lan (L1, L2)
  toyos/<arm>.txt                   the readback's test-runner lines; <arm>.verdict.txt the boot's verdict;
                                    <arm>.judge.log the readback judged at its arm's code
  judgement-table.txt               per arm: p50, peer received-by marks (MB), hystart css / css rounds, retransmitted bytes, loss probes
r1/host/  At ToyOS f1a230e00 (1480e1a67 rebased onto main 0c7e62ca7, plus the counter rename)
  ci-host-rtt-2.log                 cargo run -- --ci host: 105 steps, all green, EXIT=0
  tcp-test-f1a230e00.log            cargo test -p toyos-net-tcp --no-fail-fast: 427 passed, EXIT=0
  controls-1480e1a67/               four negative controls at 1480e1a67: each patch applied, [tcp] tests run, reverted; summary and logs
Paths are masked as <worktree>, <primary>, <scratch>, <checkout>, <tmp>, <home>.
