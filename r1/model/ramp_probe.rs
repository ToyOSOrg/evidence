//! Scratch model of a connection's first 300 ms, not committed: one bulk upload on [tcp]'s host
//! network, the sender's card at 78 frames a millisecond (113 MB/s), at round trips of 2, 4, 8 ms.
mod common;
use common::net::*;
use toyos_net_tcp::Counter;

#[test]
fn ramp_probe() {
    for rtt in [2u64, 4, 8] {
        let mut net = Net::buffered(rtt, 4 << 20);
        net.nodes[0].credit_per_ms = Some(78);
        net.connections(1, 80, [64 << 20, 0]);
        let reader = loop {
            net.advance(1);
            if let Some(r) = net.apps.iter().position(|a| a.node == 1 && a.received.1 > 0) {
                break r;
            }
        };
        let mut marks = Vec::new();
        for ms in 1..=300 {
            net.advance(1);
            if [20, 40, 60, 100, 300].contains(&ms) {
                marks.push((ms, net.apps[reader].received.1));
            }
        }
        let c = |k| net.count(0, k) / 1_000_000;
        println!(
            "rtt {rtt} ms: received by {:?}; held by window {} ms, congestion {} ms, pacing {} ms; css {}",
            marks,
            c(Counter::SendLimitedByWindowNanos),
            c(Counter::SendLimitedByCongestionNanos),
            c(Counter::SendLimitedByPacingNanos),
            net.count(0, Counter::HyStartCss)
        );
    }
}
