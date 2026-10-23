osbench at f644cefae (branch wt/linux-compare): the Linux half of the ToyOS-vs-Linux comparison.

Files (hashes in SHA256SUMS):
  osbench-linux-x86_64       the benchmark, static-pie x86_64-unknown-linux-musl, profile toyos
  osbench-peer-linux-x86_64  the LAN peer for a Linux machine
  osbench-peer-macos-arm64   the LAN peer for the development Mac
Built with: cargo +nightly-2026-07-22 build -p osbench --target x86_64-unknown-linux-musl --profile toyos
            cargo +nightly-2026-07-22 build -p osbench-lan --bin osbench-peer --target x86_64-unknown-linux-musl --profile toyos
            cargo build -p osbench-lan --bin osbench-peer --release        (the Mac's)

Every output line starts "osbench v=2 os=linux". No line carries an address, a MAC, an SSID or a serial.

1. The LAN peer (needed by the `lan` group; start it before a bench run, on both systems' runs)
   The peer answers a UDP broadcast on port 47321 and serves TCP on 47321. It needs no address configured
   and prints none. Put it on a WIRED link to the same LAN as the T14's I219, at least gigabit, or a wired
   row measures the peer's link instead. For the AMD bench's Wi-Fi row the same peer serves.
     Mac:   ./osbench-peer-macos-arm64        (macOS's application firewall may ask to allow incoming
                                               connections; allow it, or the bench finds no peer)
   Leave it running; Ctrl-C ends it. Record whether the peer machine was wired or on Wi-Fi.
   The bench broadcasts to 255.255.255.255, so the peer must be on the same broadcast domain
   (an access point's client isolation would hide it).

2. On each bench, under Ubuntu 24.04, one session, the peer running:
   scp osbench-linux-x86_64 <bench>:/tmp/osbench
   ssh <bench> '/tmp/osbench all'          > linux-<bench>-all.txt    2> linux-<bench>-all.err
   ssh <bench> 'sudo /tmp/osbench nvme'    > linux-<bench>-nvme.txt   2> linux-<bench>-nvme.err
   ssh <bench> 'sudo /tmp/osbench energy'  > linux-<bench>-energy.txt 2> linux-<bench>-energy.err
   ssh <bench> 'rm -f /tmp/osbench'
   Unprivileged, `all` reports nvme.* and energy.* `unmeasured` (the raw namespace and powercap's
   energy_uj take root) and exits 0; the two sudo runs fill them. `nvme` only reads: the device is
   opened O_RDONLY|O_DIRECT and nothing in the program writes to it.
   `all` takes about 6-8 minutes: tail waits ~100 s, energy 0 s unprivileged (60 s under sudo), lan
   about 50 s plus up to 60 s looking for the peer, crunch about 32 s of load and up to 2 x 90 s of
   cool-down. Repeat `all` three times per bench for the spread.
   - T14: wired I219 up, Wi-Fi down (as it is): lan.wired.* are measured, lan.wifi.* say why not.
   - AMD bench: Wi-Fi up, no wired link: lan.wifi.* are measured, lan.wired.* say why not.

3. The crunch's heat stop: with coretemp (T14) it stops a phase at the sensor's critical
   temperature (TjMax) less 15 C; with k10temp (AMD), which reports no critical temperature, at AMD's
   published 105 C less 15 C. Lines `cond crunch.stop_c=` and `cond crunch.limit_from=` say which.
   A phase that stopped says `stopped_hot=1`; the later workloads of that phase say `unmeasured`.

4. ToyOS runs: the metal readback dirs beside this file's parent (see the handoff). The ToyOS
   boot's `lan` group also needs the peer running, on the T14.

Never published: these binaries (they carry build paths). Publish the outputs, the source revision
and SHA256SUMS.
