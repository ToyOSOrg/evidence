# ToyOS #1147 r2: review r1, and the ramp issue's parity session

Head 7a601f44b (session image at 9070b6111). Paths masked as in r1.

- `session/`: the T14 run L1, t1 (image f2e0d18b…, at 9070b6111), L2, all rc 0. It holds each Linux run's upload row, t1's osbench lan lines (an excerpt), the request with the rule set before the run, and `judge-t1.log`, which exited 0 with `VERDICT: parity`.
- `checks/`: the guest tests at 7a601f44b. `guest-holders-export-libc.log` covers stream_holders, netstack_holders_exported_to_children and libc_children, all PASS. The failover test's worker in that run hung on the build harness's sysroot lock and was stopped; it was then run alone (`guest-failover.log`, PASS).
- `controls/`: each patch was applied, run and reverted in the same run:
  - the shard answering an unspecified UDP local address: the node test fails (exit 101);
  - std's `UdpSocket::local_addr` answering the bound address: the failover test fails, saying it sends from 0.0.0.0;
  - the open path dropping its local-end check: `stream_holders` fails, its connect answered from 0.0.0.0. The first version of this control did not build (dead code under `-D warnings`), and its v2 is what ran.
