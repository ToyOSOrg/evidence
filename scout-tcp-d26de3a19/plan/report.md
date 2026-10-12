# Connection setup on the T14: where ToyOS's extra ~10 ms goes (read-only investigation, 2026-10-12)

Tags: [M] measured (log cited), [C] read from code, [I] inferred. Logs: $L = <scratchpad>/lan. Recompute scripts: .../scratchpad/tcp-setup/{setup,decomp,probes,means}.py. Code read at wt/toyos-lan-metal4 18593df54.

## Facts
- tls_ms contains tcp_ms (both from one `called`, tests/guest/rust-tests/src/netperf.rs:189-194) [C]: one gap, not two. TLS phase (tls-tcp) is equal: ToyOS 18.0 ms median (n=96) vs Ubuntu 18.2-18.8 (n=3, same session) [M].
- Same-session tcp_ms: ToyOS 22.8 (r3) / 23.4 (r4) vs Ubuntu 13.2 [M].
- ToyOS tcp_ms = lookup ~7.0 + connect ~15.7 + residual ~0.5 (set_nodelay + ureq) [M parts, I sum], from https_download's `lan idle` and `rtt_ms` probes, 16 boots.

## Suspects
- S1 (strong, ~6.5-7 ms): name lookup. netstack has no DNS cache ("No cache. Every lookup asks.", system/netstack/dns/src/lib.rs:29) [C]; the lease's resolvers are off-LAN, so every fetch pays a WAN DNS round trip ~7 ms [M]. Ubuntu's resolve never timed alone, bounded to a few ms, almost surely systemd-resolved's cache [I].
- S2 (medium, ~1.5-2 ms): netstack's own SYN->SYN-ACK bracket averages 14.7 ms [M], longer than Ubuntu's whole lookup+connect 12.7-13.2 [M]. TLS round trip not slower on ToyOS. Either a SYN-only cost (IPv4 NAT setup vs Ubuntu possibly IPv6) or a ~2 ms longer path hidden by Ubuntu's slower handshake CPU [I]. Possible per-address warm-up (fresh edge address each fetch, no cache) [weak].
- S3 (medium, ~1 ms per connect, recurs in lookup and set_nodelay): client connect minus netstack bracket 0.93-1.25 ms [M/I]. Each netstack request opens a new IPC connection with two pipes, each zeroing a 2 MiB page on first write (kernel/src/syscall/ipc.rs:233-239, mm/pmm.rs:170-176) [C]; ~0.1-0.2 ms each [estimate].
- S4 (weak, <=0.5 ms): set_nodelay is a third netstack round trip (sdk/std/sys/net/connection.rs:329-335) [C].
- Ruled out by existing data: netstack cadence/throttle (round 4 arms equal), poller (~5 µs), rustls CPU / pipe hop / data path (TLS phase equal), clock calibration (0.04%), C-states (favour ToyOS).
- Label corrections: the "LAN round trip" is a WAN DNS lookup; the "handshake RTT guard" (15.5 ms) is a TCP connect to the CDN edge; no log has measured a LAN round trip. `lan_probe`'s doc comment (https_download.rs:80) is false on this network.

## The scout (one ToyOS boot + Ubuntu in the same session)
Tree: branch head 443fb5d10 + round 4's instrument + stamps; all on nanos_since_boot (the I219 passes DeviceIrqRecord.first_nanos up from begin_pass; no kernel change).
- Job stamps per fetch: J0 called, J1/J2 resolve start/end (wrap DefaultResolver), J3 TcpConnector entry, J4 Mark(tcp), J5 Mark(tls), same/new address vs previous fetch (never the address).
- netstack per lookup / connecting stream: N1 accept-wait return, N2 request read, N3 query/SYN to card.tx, N4 claim record first_nanos of the reply frame, N5 node.receive, N6 answer written; for TcpSetOption N1,N2,N6; first data exchange: N3 ClientHello last segment, N4/N5 first acking segment + its payload length.
- LAN control: five connects to a closed TCP port on the lease's router (RST round trip, no NAT/WAN).
- Ubuntu: J1-J5 + address family, TCP_INFO tcpi_rtt after connect; three default runs, three IpFamily::Ipv4Only.
- Rows: lookup, lookup_wire, lookup_local (split), connect, syn_wire, connect_local (split), nodelay, ureq, data_rtt, wake, same_addr, lan_syn_wire/lan_connect, tls_phase; U1-U5 on Ubuntu.
- Kill conditions:
  - S1 dead if Ubuntu resolve >= ToyOS lookup - 1 ms, or ToyOS lookup < 2 ms; alive if lookup_wire >= 5 ms and U1 < 1 ms (size = lookup - U1).
  - S2 dead if syn_wire <= U4 tcpi_rtt + 0.5 ms (IPv4-only runs); alive if >= 1 ms; (a) SYN-only if syn_wire - data_rtt (pure-ACK) >= 1 ms; (b) path if U4 IPv4-only >= U4 default + 1 ms; warm-up if new-address fetches >= 1 ms over same-address in syn_wire.
  - S3 dead if lookup_local + connect_local + nodelay < 0.5 ms per fetch.
  - S4 dead if nodelay < 0.1 ms; alive if >= 0.3 ms.
  - NIC/throttle/wake dead if every wake < 50 µs and lan_syn_wire < 1 ms.
  - rustls/pipe/data path stays dead while ToyOS tls_phase within 1 ms of Ubuntu's.
  - lookup rounded to ms: dead if lookup_local < 0.5 ms in every run.
- Prediction: lookup ~7.0, lookup_wire ~6.5, connect ~15.7, syn_wire ~14.7, connect_local ~1.0, nodelay ~0.2-0.4; Ubuntu resolve < 1, connect ~12.5-13.
