# PR #1065, round 3: the first paired network session (code at d99ef5a35)

The coordinator ran the session; the files here are the coordinator's, masked (addresses, MACs and home
paths replaced; ToyOS boot logs cut to osbench's and the runner's lines).

## What ran

- Path A: the T14 is under test over its wired I219, with the AMD bench's Linux `osbench-peer` on its Wi-Fi
  (`session/amd-peer.log`). Path B: the AMD bench's Linux is under test over its Wi-Fi, with the T14's Linux
  peer (`session/t14-peer.log`). Step 0's link readout is `session-1-broken/step0.txt`: T14 e1000e up at
  1000 Mb/s with its Wi-Fi down, the AMD bench on Wi-Fi only, and ufw inactive on both.
- **ToyOS: 3 runs, not 4.** These are T2–T4 of the first attempt, 11:44–11:49 (`toyos/`, verdict `passed`).
  T1's readback was lost.
- **The first attempt** (`session-1-broken/`) lost Linux runs L2–L4, because the binaries were staged in
  `/tmp`, which the reboots wiped (rc 127). Its path B runs exist but drew 429s.
- **The rerun** (`session/`) has Linux L1–L4 on the T14 at 11:57–12:02 and path B's four runs. The T14's two
  identical sticks swapped places after a reboot, so the runner's guard refused T2–T4 and T1's readback was
  lost. The Linux runs are therefore **not interleaved** with ToyOS's: they ran about 10–15 minutes later.
- **Every Linux `internet.https.download` drew HTTP 429** from Cloudflare. Downloads that came first all
  succeeded: the first attempt's L1 at 11:39 (p50 257 ms per 25 MB) and ToyOS's T2–T4 (244 ms). The 429s
  began with path B at 11:50, after at least four runs of six 25 MB downloads, and did not lift by 12:05.
  The code now downloads four times 10 MB per run.

## Comparison

`session/compare-r3.md` is `osbench-compare` at this PR's round-3 head over the same files.
`session/compare.md` is the coordinator's, made by the d99ef5a35 tool, which gated on the count alone and
so called the upload "too few runs".

| row (T14, path A) | Linux p50s | ToyOS p50s | ToyOS/Linux | exact p | verdict |
|---|---|---|---|---|---|
| lan.wired.tcp.download, MB/s | 112, 110, 109, 112 | 112, 112, 109 | 1.01 | 1.000 | not resolved: parity |
| lan.wired.tcp.rtt.64, ns | 2.020, 2.014, 2.019, 2.010 ms | 1.984, 1.989, 1.994 ms | 0.99 | 0.057 | too few runs (least p 0.057) |
| lan.wired.tcp.upload, MB/s | 113, 113, 114, 113 | 41, 48, 31 | 0.36 | 0.029 | **ToyOS worse** |
| lan.wired.tcp.connect, ns | 1.96, 1.79, 1.10, 1.13 ms | 2.19, 2.99, 2.06 ms | 1.50 | 0.057 | too few runs |
| internet.tcp.connect, ns | 6.09 ms median | 7.01 ms median | 1.15 | 0.057 | too few runs; exploratory |
| internet.https.rtt, ns | 8.55 ms median | 7.58 ms median | 0.89 | 0.057 | too few runs; exploratory |
| internet.https.upload, ns per 10 MB | 127 ms median | 178 ms median | 1.40 | 0.057 | too few runs; exploratory |
| internet.https.download | 429 in every run | 244 ms median per 25 MB | - | - | unmeasured under Linux |

**Noise floor**, Linux's run-to-run range on path A:
- 0.5% for the 64 B round trip, 0.9% for upload and 2.7% for download;
- 58% for connect, whose runs split between about 1.1 and 1.9 ms.

Each p is per row and uncorrected. With 3 runs against 4 and no ties, the least p is 2/35 = 0.057, so
only the upload, where three Linux runs tie, resolves.

`cpu.clock` per group: ToyOS 1.5–3.2 GHz against Linux 3.8–4.2 GHz (recorded in
`issues/osbench-times-cpus-leaving-idle-and-not-their-settled-clock.md`).

Path B (the AMD bench's Linux over Wi-Fi to the T14's wired peer): download 114 MB/s, upload 110 MB/s,
round trip 2.00 ms, all Linux-only. ToyOS drives no card the AMD bench has.

## Round-3 code checks (head 548bef4bf)

- `cargo run -- --ci host` at 548bef4bf: exit 0, 103 green (`logs/ci-host-4.log`).
- Control m7 computes the least p from the counts alone: red, in the least-p case.
- Control m8 leaves a tied complete separation unresolved: red. It is broad: it also excludes p = 2/70, so
  four tests fail, the 4-against-3 tied upload case among them.
- The internet change is two constants and the bound; no QEMU rerun (round 1's smoke covers the path).
