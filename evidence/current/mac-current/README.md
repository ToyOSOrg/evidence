# Current native Mac comparison

Source: `f55746d1ad0122bff4058e6833e505556cf458f3`. Apple M4 Pro, ARM64 macOS
27.0.1, Rust 1.98.1, stock ring 0.17.14. The locked offline release build
succeeded before its freshly built comparator was executed. Three runs each
have seven interleaved samples per backend/workload, after warmup. The
independent analyzer validates all 3,150 CSV rows; none are removed.

Median nanoseconds per operation, pooled over 21 samples per backend:

| Algorithm | Bytes | Seal ours | Seal ring | Open ours | Open ring |
| --- | ---: | ---: | ---: | ---: | ---: |
| AES-128-GCM | 1024 | 261.209 | 166.958 | 256.041 | 159.958 |
| AES-256-GCM | 1024 | 278.604 | 176.021 | 275.334 | 165.250 |
| ChaCha20-Poly1305 | 1024 | 2026.979 | 662.167 | 2010.062 | 717.042 |
| AES-128-GCM | 16384 | 3383.301 | 2081.624 | 3329.793 | 2115.152 |
| AES-256-GCM | 16384 | 3672.444 | 2145.142 | 3600.830 | 2152.832 |
| ChaCha20-Poly1305 | 16384 | 30031.576 | 8152.059 | 29611.653 | 8116.943 |

At 16 KiB, seal time ratios ours/ring are 1.625, 1.712 and 3.684. Key setup
medians are 345.562/83.125 ns (AES-128), 383.084/83.500 ns (AES-256), and
16.104/15.854 ns (ChaCha). Setup includes each implementation's normal
destruction, including this crate's owned-storage wiping.

CPU affinity, frequency, thermals and other shared-Mac activity were not
controlled. These are native nanosecond observations, not cycle counts or
deployment qualification. The first ChaCha 16 KiB seal run median was 36.036 µs,
then 30.032 and 29.599 µs; all samples remain in the pooled result. Ring also
varied. The repeated interleaved comparison supports the reported broad gap,
not fine-grained regression conclusions against earlier uncontrolled sessions.

The AVX2 code is x86-specific; ARM ChaCha remains scalar. This harness measures
the public primitive API, including its key setup, rather than rustls record
object allocation. It does not isolate the provider in-place construction fix.
It covers selected AEAD workloads, not all algorithms or full TLS throughput.
Complete small-record, rejection, setup and per-run results are in analysis.json.

Reproduce analysis from the repository root:

```sh
python3 tools/analyze_ring.py evidence/current/mac-current/output.txt
```
