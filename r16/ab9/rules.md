# S0-a metal round 9, AMD only, diagnostic: the rules, set before any boot (2026-11-05)

Round 8 judged AMD `pipe.throughput.256` a hot-row REGRESSION: head worse in both pairs (-1.0%,
-0.8%), and in five of rounds 6 and 8's six pairs. The owner's bar is no loss on hot paths. This round
finds where the time goes on that path. It decides nothing about landing.

The benchmark (`osbench` system group): one thread writes `size`-byte writes into a pipe for 100 ms,
and another reads it in 64 KiB reads. MB/s as the reader saw it.

The paths:
- **main:** a write takes the process's lock and copies user to frames within one hold; a read
  copies frames to user within one hold. Each then wakes the other side.
- **head:** a write of at most 4 KiB copies user to a stack bounce, then puts it into the frames
  within the lock's hold. A read takes up to 4 KiB of frames into a bounce within the hold, then
  copies it out. A read finding more than 4 KiB held, or a claim held, falls back to the claimed
  path, which copies frames to user directly.

## Arms (code at the PR head bdec5ab36; nothing since changes the kernel)
- **base** = `s0a-r10-base-kvm` 49496f0a3: main + the per-syscall probe.
- **head** = `s0a-r14-ad-kvm` ea86ed227: bdec5ab36 + the per-syscall probe.
- **pbase** = `s0a-r16-pbase-kvm` d635b6ba9: base + the pipe-path probe.
- **phead** = `s0a-r16-phead-kvm` 826483757: head + the pipe-path probe.

The pipe-path probe is machine-wide, printed after every exit line as one `pipeprobe:` line per size class (an exit line is cut at the record limit). It bins by write size (64, 256,
1024, 4096): a read and a wake are binned by the size of the most recent pipe write, and only this
benchmark writes those sizes. It times:
- both arms: the whole `sys_write` (`wt`) and `sys_read` (`rt`, with bytes returned), the reader
  wake after a write (`wk`) and the writer wake after a read (`rk`);
- head: the bounce copy-in (`wb`), the locked put (`wl`), the locked take (`rl`), the copy-out
  (`rc`), and reads that fell back to the claimed path (`rf`);
- base: the locked hold of a write (`wl`, its copy inside) and of a read (`rl`, its copy inside).
The timestamps cost both arms alike.

## Order: 1-base 2-head 3-head 4-base 5-pbase 6-phead 7-phead 8-pbase. Eight boots.

## What is read
1. **Hot rows, round 8's rule** (pairs 1/2 and 4/3): reported as the current state, without a new
   verdict. Pairs 5/6 and 8/7 give the probe arms' rows too, reported separately.
2. **For the 256 class, per arm, mean over the run:**
   - ns per write and per read;
   - bytes per read;
   - each piece's ns per call;
   - writes and reads per MB moved;
   - head's share of reads that fell back.
3. **Where head loses:** a piece is named as the cost when head's total per MB exceeds base's and
   that piece accounts for most of the difference, consistently in both probe pairs. Otherwise the
   difference is reported unexplained. The same decomposition is reported for 64, 1024 and 4096, for
   comparison.

## Validity
A boot marked INVL, or whose image hash differs from `image-sha256.txt`, is not a value. It is rerun
once, and the rerun is recorded.
