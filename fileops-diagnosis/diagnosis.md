# Why a file call costs ToyOS many times Linux's — diagnosis, PRELIMINARY

Status 2026-11-11 (round 2): section 4 is measured on metal (T14 three boots, AMD one) and supersedes the
derived figures of sections 1 to 3 where they differ. Sections 1 to 3 rest on the scoreboard's existing rows (main ad5db5a65, four boots a bench;
`score/runs/`), on the code at origin/main 422915e2c, and on round-trip counts read off one local QEMU run of the
stage timers (counts only; QEMU's times are not used). The per-stage split on metal (section 4) is staged and
requested, not run. Every figure below is the T14's p50 unless it says otherwise; "measured" means a scoreboard row,
"derived" a difference of two measured rows, "inference" is labelled.

## 1. What one call does today

A served file call is `Dir::call_with` (`sdk/toyos/src/fs.rs`): one `message_send`, one blocking `message_recv`.
The server (`system/fileserver/src/main.rs`) is one thread in one `Poller` loop: `wait` returns, `message_recv`
(non-blocking), handle, `try_send`, re-arm the watch, `wait`: four system calls a request where the client makes two.
Client and server sit on different CPUs (the rows' own `ran=` field: client cpu0, server cpu3 or cpu1), so each
direction is a wake of a thread on another, idle, CPU. Only `read` on a file opened to read (the holder's
`SYS_PAGED_READ`) and `seek` from the start or the current offset are answered without the server.

| what | measured | note |
|---|---|---|
| Linux `fstat` | 213 ns | one system call |
| ToyOS null system call | 68 ns | faster than Linux's 92 |
| `ipc.reqrep.8`, a bare 8-byte request and reply between two processes | 6,022 ns | Linux's Unix socket: 3,492 |
| `fs.mem.direct.seek`, a file request the server answers from one field | 7,080 ns | the file round trip with no work in it |
| `fs.mem.direct.fstat` | 7,183 ns | |
| `fs.mem.fstat` through std | 7,480 ns | |

So a file round trip costs about 7.1 µs with nothing in it, 1.1 µs above the bare IPC row (derived; the server's
poller loop and two extra system calls are the candidates, unsplit until section 4), and 33 times Linux's whole
`fstat`.

## 2. Each row, as round trips and the rest (derived, T14, ns)

Round trips per call are from the timers' tallies (QEMU run, counts only) and the code. "Round trip" is priced at
`direct.seek` on the same server (7,080 memory, 7,037 disk).

| row | ToyOS | Linux | round trips | of which round trip | the rest | what the rest is |
|---|---|---|---|---|---|---|
| `fs.mem.fstat` | 7,480 | 213 | 1 | 7,080 (95%) | 400 | client 300, server about 100 |
| `fs.disk.fstat` | 9,496 | 215 | 1 | 7,037 (74%) | 2,460 | unsplit until section 4; the server's `linked()` reads the inode from the btree on every call (`data.rs`) |
| `fs.mem.stat` | 9,451 | 578 | 1 | 7,080 (75%) | 2,370 | server path walk 1,160 (`direct.stat` − `direct.seek`), client path handling 1,210 (`stat` − `direct.stat`) |
| `fs.disk.stat` | 12,261 | 578 | 1 | 7,037 (57%) | 5,220 | server 3,880, client 1,340 |
| `fs.mem.open_close` | 12,179 | 1,117 | 1 + a one-way close | 7,080 (58%) | 5,100 | unsplit until section 4: the close's send, the server's open (three path lookups), a holder handle minted and moved, client path handling |
| `fs.disk.open_close` | 21,419 | 1,218 | 1 + close | 7,037 (33%) | 14,380 | the same, the lookups on the btree |
| `fs.mem.write_4k_at` | 9,060 | 628 | 1 | 7,080 (78%) | 1,980 | three 4 KiB copies (caller→window, window→server scratch, scratch→object), the volume's reserve, the pager's write call |
| `fs.disk.write_4k_at` | 22,590 | 721 | 1 | 7,037 (31%) | 15,550 | the same with bcachefs's per-call reserve and bookkeeping (min 13,707: bimodal) |
| `fs.mem.seq_write.4096` | 9,350 a call (438 MB/s) | 1,136 a call (3,605 MB/s) | 1 | 7,080 (76%) | 2,270 | as `write_4k_at`, growing the file |
| `fs.disk.seq_write.4096` | 22,900 a call (179 MB/s) | 6,460 a call (634 MB/s) | 1 | 7,037 (31%) | 15,860 | as above; Linux's figure is its write-back throttle, not its call |
| `fs.mem.read_4k_at` (cached) | 1,062 | 728 | 0 | 0 | — | one `SYS_PAGED_READ` and the client's descriptor path |
| `fs.mem.pread_8` | 522 | 343 | 0 | 0 | — | the same with no copy to speak of: about 450 ns over a null call |
| `fs.mem.seek` | 248 | 116 | 0 | 0 | — | client only: five lock pairs and three calls into the descriptor owner |
| `fs.mem.rename` | 11,753 | 1,596 | 1 | 7,080 (60%) | 4,670 | server, client path handling twice |
| `fs.mem.mkdir_rmdir` | 20,124 | 2,190 | 2 | 14,160 (70%) | 5,960 | |
| `fs.mem.create_write_unlink` | 30,518 | 4,651 | 3 + close | 21,240 (70%) | 9,280 | |

Answers to the four questions put to this diagnosis, as far as today's rows carry them:

**(ii) `fstat` is one round trip and nothing else.** 95% of the memory row is the round trip. No cheaper round trip
reaches Linux: the best published same-core round trip (0.4 µs, the prior-art report) is twice Linux's whole call.
The request has to go.

**(i) A 4 KiB write is one round trip plus about 2 µs in memory and about 15 µs on DATA.** A holder-side write
into the paged object removes the round trip and the window and scratch copies in both, and on DATA moves the
per-call reserve to a grant the server extends in bulk. What remains is one system call with one copy, the shape
of the read that costs 760 ns today (`pread_4k`) against Linux's 574 to 628. The disk row's 15 µs is server work
per call that the scoreboard filed under the storage engine; it is per-call transport work in the sense that it
exists only because the server sees every call. Inference: `fs.mem.seq_write.4096` lands near the cached read's
5,700 MB/s (Linux 3,605), and `fs.disk.seq_write.4096` near `seq_write.1048576`'s 504 MB/s, where what remains
against Linux's 634 is write-back, #1216's subject.

**(iii) The path calls: a 1 µs round trip alone does not reach Linux on the T14.** The brief's "1.5 to 4.4 µs" for
Linux are the AMD bench's figures, which carry its HPET-timed runs; the T14's Linux does `stat` in 0.58 µs, open
and close in 1.1 to 1.2, rename in 1.6, mkdir and rmdir in 2.2, create-write-unlink in 4.7. With the round trip at
1 µs and nothing else changed (derived): `stat` 3.4 µs memory and 6.2 disk (6x and 11x Linux), open and close about
6 and 15 (5x and 13x), rename 5.7 (3.6x), mkdir and rmdir 8 (3.6x). The rest of each row, which a cheaper round
trip leaves, is already 4 to 9 times Linux's whole call: the client's path handling (1.2 µs a path: about ten heap
allocations and up to four locked table lookups, section 5) and the server's resolution (a walk over path strings
with a lookup per component and, on DATA, the inode read from the btree on every call; open looks the same path
up three times). So three things are needed for the path calls, in this order of size on DATA: the server's
resolution by node with attributes in memory, the round trip, the client's path handling. Whether C plus those
two reaches Linux, or a holder-side name and attribute cache (B) is needed for `stat` and open-to-read, is
arithmetic on the split section 4 measures: with a 1 µs round trip the server and client together have 0 µs left
for `stat` on the T14 before it exceeds Linux, so parity on `stat` needs B; open, create, rename and unlink at
"within 2x" are reachable by C plus the two reductions (inference).

**(iv) Whether the single server thread bounds `work.build_shaped.j8`** is not known from today's rows. The
requested boot runs the same rounds with each lasting process's CPU time read around them (file servers,
supervisor), which says what share of one CPU the MEMORY and SYSTEM servers use at j8.

## 3. What is serial

- One thread serves a role. A request that waits on the disk (a page-in, a btree node) holds every client of that
  role; nothing on the cached rows measures it.
- A process has one connection to each directory capability, behind a turnstile, one request outstanding
  (`files/owner.rs` `Capability`, `fs.rs` `Dir`): two threads of one program calling into one capability take
  turns for a whole round trip each. The wire allows 16 outstanding; the client uses one.
- The requested boot measures both: `fstat` beside a thread of the same process and beside another process, each
  asking as fast as it is answered.

## 4. The split, measured on metal

Boots (all verdict `passed`; readbacks `runs/<bench>/<boot>/`, p50 tables `analysis/split-p50.txt` by
`analysis/split.py`): T14 A-1 and A-2 (`fileops-timers-A` 1566d6bd7: main 422915e2c + scratch timers), T14 B-1
(ff2031ec5: the same + the routing fix), AMD A-1. On the T14 B-1 ran first, then A-1 and A-2. The order does not
bear on any reading below: every boot flashes its image, the client-side and build rows touch only /tmp and
/system, and the DATA rows are not used to read B. The A pair is the spread B is read against.

Judging: `cargo test --test toyos-build -- --metal --metal-readback judge/<boot> osbench_fileops` at ff2031ec5
(the judge code is the same at A and B) exits 1 for all four with one refusal: each readback's `boot.txt` names no
`back_unix_secs`, which this revision's harness requires and the runner's `toyos-metal` did not write (logs
`logs/judge-*.log`). That is a mismatch between the runner's flasher tree and this revision, not a finding about the
boots; the harness's timing judgement therefore did not run. What the kernel logs show directly: every boot ends
`===TEST_END osbench_fileops exit=0===`, the parent exits code 0 and the job prints `group=fileops done`. B's
parent made 531 fewer of each of two namespace system calls (numbers 10 and 14) and 539 fewer allocations than A's,
the routing fix's refused connects.

**fstat on MEMORY, one round trip, T14 (A-1 / A-2 p50, ns).** Total 7,715 / 7,564.

| stage | ns | what it is |
|---|---|---|
| client in std and the SDK | 540 / 543 | descriptor, request build, reply decode |
| client `message_send` | 766 / 706 | the call itself: 10x the 68 ns null call |
| send return to the server CPU's wake record | 774 / 762 | the kick to an idle CPU, its idle exit, the inbox (`kicks_per_op` 2.00, the client's CPU idles on every call) |
| wake to pick | 439 / 433 | |
| pick to the server's user code | 1,217 / 1,191 | switch, return from `wait`, the poller's dispatch |
| server `message_recv` | 586 / 603 | |
| server handling | 355 / 355 | the whole of the file work |
| server `try_send` | 744 / 717 | |
| send return to the client CPU's wake record | 740 / 733 | kick, idle exit, inbox |
| wake to pick | 392 / 394 | |
| pick to the client's user code | 1,137 / 1,108 | switch and the blocking receive's return |

So the round trip (6.8 µs) is: the three IPC system calls on the critical path 2.1 µs, two cross-CPU wakes of an
idle CPU 1.5 µs, two picks 0.8 µs, two returns to user 2.3 µs; the file work is 0.36 µs. The AMD bench has the same
shape, slower (9.4 µs: the IPC calls 0.6 to 1.15 µs, each wake 1.1). Three of these belong to the transport for
every service, not to files: an IPC system call costs ten null calls, a return to user after a pick costs 1.1 to
1.2 µs, and every request and reply wakes an idle CPU. They size C (and the scheduler's wake path), not step one.

**Where the rest of each row goes (T14 A pair, p50, µs).** "Transport" is the round trip less server handling.

| row | total | transport | server handling | client (std+SDK) | in the server |
|---|---|---|---|---|---|
| `mem.fstat` | 7.6 | 6.7 | 0.36 | 0.54 | |
| `disk.fstat` | 9.8 | 6.9 | 2.3 | 0.54 | the inode read from the btree on every call |
| `mem.stat` | 9.5 to 9.9 | 6.8 | 1.33 | 1.4 to 1.7 | walk 1.03, stat 0.13 |
| `disk.stat` | 12.4 | 7.0 | 4.1 | 1.3 | walk 1.6, inode read 2.35 |
| `mem.open_close` | 13.5 to 13.7 | 8.1 | 1.95 | 2.7 to 2.8 | lookups 1.13, holder and description 0.67 |
| `disk.open_close` | 21.9 to 22.2 | 9.4 | 9.3 | 2.7 | lookups 4.0, the open's node work 4.5 |
| `mem.write_4k_at` | 9.3 | 7.0 | 1.35 | 0.94 | reserve 0.52, the put 0.75 |
| `disk.write_4k_at` | 23.3 to 23.5 | 7.1 | 15.1 | 0.94 | **reserve 13.7 (bimodal, min 5.0)**, the put 1.07 |
| `disk.seq_write_4k` | 12.8 to 12.9 | 7.0 | 5.2 | 0.67 | reserve 3.5, put 1.3 |
| `disk.seq_overwrite_4k` | 13.1 | 7.1 | 5.4 | 0.68 | **reserve 4.3 with nothing growing** |
| `disk.rename` | 45.3 to 45.6 | 7.4 | 35.9 | 2.1 to 2.4 | |
| `disk.mkdir_rmdir` | 83.2 to 83.4 | 14.9 | 65.8 | 2.6 to 2.7 | two calls |
| `disk.create_write_unlink` | 154 to 188 | 24 | 126 to 160 | 3.6 to 3.7 | of which the open-to-create 50 to 66 |

`open_close`'s std-and-harness 1.9 µs lies outside the SDK's stamps (the close's handle drops and the
description's teardown); it is not split further. `pread`/`read_4k_at` (no round trip) are 0.55 to 1.1 µs, of
which `SYS_PAGED_READ` 0.45 to 0.67.

**(i), (ii), measured.** `fstat` is 88% transport in memory and 70% on DATA; a 4 KiB write is 75% transport in
memory, and on DATA 30% transport and 59% the per-call reserve. Step one's direction stands. One correction to the
decided growth limit follows from the DATA rows: the reserve is per page dirtied, not per byte grown
(`seq_overwrite_4k` pays 4.3 µs with nothing growing, and DATA's `reserve` holds capacity per written page because
the engine writes copy-on-write). A holder write that dirties a clean page inside the size needs capacity as
much as one that grows the file; see section 9.

**(iii), measured.** On DATA the mutating path calls are dominated by the server's own work, not the transport:
rename 36 of 45 µs, mkdir and rmdir 66 of 83, create-write-unlink 126 to 160 of 154 to 188, open 9.3 of 22. A
1 µs round trip leaves them at 3x to 30x Linux; the server's resolution and the engine's per-operation cost come
before C for those rows. In memory the round trip is still 60 to 70% of every path row.

**(iv) The file servers' CPU share at `build_shaped` j8 (T14) and j16 (AMD).** Per-process CPU time over five
rounds of 256 compiles, per mille of one CPU. Roles from the manifest's role order (pids 7 to 10 are data, log,
boot, memory) and the boot's own "serving" lines (pid 1 is SYSTEM).

| | wall | SYSTEM | LOG | MEMORY | DATA | osbench parent |
|---|---|---|---|---|---|---|
| T14 j8, A-1 / A-2 | 1,112.5 / 1,112.5 ms | 317 / 317 | 147 / 153 | 127 / 129 | 0 | 143 |
| T14 j8, B-1 (routing fix) | 827.4 ms | 409 | 149 | 160 | 0 | 161 |
| AMD j16, A-1 | 1,594.3 ms | 263 | 241 | 204 | 0 | 255 |

No file server comes near one CPU, so the single server thread does not bound `build_shaped` at j8 or j16 today.
The busiest is SYSTEM at 32 to 41% (264 to 276 µs of its CPU per compile: the spawn's image read, which map7b's
step 3 removes), then LOG (15 to 24%: two log lines a compile, spawn and exit). Server threads stay last.

**Serial, measured.** `fstat` beside a thread of the same process asking as fast as it is answered: 21.4 to
21.6 µs (2.8x alone), and the other thread was answered 7.4 to 7.9 times for each of this one's: the per-capability
turnstile serialises a process's threads for whole round trips, unfairly. Beside another process: 8.4 to 8.5 µs
(1.1x): the server interleaves two clients fine. Step one removes the turnstile from `fstat` and writes; the
rest needs more than one request outstanding per connection (the wire allows 16).

**Linux, counted** (`strace -f -c`, both benches, rc 0; `perf` unusable there, rc 255): one system call per file
operation in every row, nothing else (`osbench files`: 104,122 writes, 105,233 reads, 8,639 opens, 8,638
closes, 2,202 fstat, 2,101 stat, 2,100 renames on the T14).

## 5. One plain defect found so far (fix written, measured by boot B)

Routing an absolute path (`sdk/toyos/src/files/namespace.rs` `route`) tried each of the path's first four
prefixes as a capability name. A prefix the view does not hold cost, the first time, a 2 MiB window made and
dropped and a namespace open the kernel refused (`Dir::connect`), and an entry kept for the life of the process
in `CAPABILITIES`: a program that names many files four components deep or less (anything writing into `/tmp`)
grows that table by one entry a file, without bound. Every later path paid two allocations and a locked lookup
per prefix tried. The namespace is immutable and already listed, so the fix matches a path against the held
directories and asks for none it does not hold (commit 34cc79cf0 on the scratch branch; host tests of the module
pass, with the property asserted in the routing helper). Measured, T14 B-1 against the A pair (p50; the SDK's own
client time): `stat` 1.59 / 1.30 to 0.91 µs in memory and 1.21 / 1.24 to 0.92 on DATA; open and close 0.80 /
0.85 to 0.34 and 0.73 / 0.78 to 0.42; rename 1.92 / 1.93 to 1.48 and 2.27 / 1.98 to 1.30; mkdir and rmdir 2.72 /
2.73 to 2.00; create-write-unlink 2.23 / 2.31 to 1.55. Whole rows move less and within more noise (`mem.stat`
9.88 / 9.51 to 9.27, `disk.stat` 12.42 / 12.42 to 11.99). The larger effect is on programs that start: the
build-shaped rounds, every compile a new process naming fresh `/tmp` paths, take 3,029 ms at j1 against 3,446 /
3,433 (-12%) and 827 ms at j8 against 1,112.5 / 1,112.5 (-26%), where the A pair agree within 0.4% and 0.003%.
Smaller than section 7's 0.9 µs a path on the micro rows, larger than expected where each process pays the
first-time windows and refused opens.

Other avoidable client work, measured small and not yet fixed: every `read` and `write` holds its descriptor
twice (`on_stream`, then `on_fd`), four process-wide lock pairs (`issues/every-descriptor-call-takes-one-process-wide-lock-twice`,
the issue map's C12, owned elsewhere).

## 6. Design options, against the measurements

Named as the prior-art report names them.

**A — the paged object is the open file.** `fstat`, positioned and sequential write, append and seek-from-end
become system calls on the holder, as read is. Removes: the round trip on every data and open-file attribute
call, two of three copies of a write, the per-call reserve. Costs: a holder write in the kernel (dirty pages
against the pager's existing ceiling, growth up to a limit the pager sets, atomicity against reads by the
object's existing write version), an attribute record on the object the pager writes and holders read, a "first
dirtied" notice. Isolation: unchanged; a write holder is minted only for an open to write on a read-write
grant, and the server revokes by releasing the object, after which the client asks it as today. The server stops
seeing each write: space is promised by the limit it set (no write is accepted that the volume cannot hold, so
"no space" is still answered at the write), modification time is stamped by the kernel on the object as it
already stamps its own objects. Stays slower than Linux: nothing in kind; the cached read shows the residue
(1.27x to 1.54x), which is the client's descriptor path and the kernel's copy path, both owned elsewhere.
Storage engine: write-back sees dirty ranges in the stretches the object reports, which is the shape #1216
makes fast; the per-call `reserve` on DATA goes. **The measurements support it for `fstat` and writes and
nothing else reaches them.**

**B — the client answers from memory the server shares read-only.** For `stat` and open-to-read by path.
Removes the round trip for names already listed in a directory the client holds. Costs a shared format between
every file server and the client library, per directory and not per volume (a volume-wide table would show
names outside the view). Stays slow: the first touch of each directory, every mutation. **Supported for `stat`
on the T14 by arithmetic (0.58 µs leaves no room for any round trip); not needed for the mutating calls.** It
needs mapped paged objects (7b).

**C — a call that hands the CPU to the server and back.** Removes the two cross-CPU wakes, the idle entry and
exit on both CPUs and three of the server's four system calls. **Needed for every call that must ask (open,
create, rename, unlink, mkdir, a cache miss), and for every other service; not sufficient for any file row on
the T14 by itself**, since the non-round-trip part of each path row is already 4 to 9 times Linux's call. It
makes the single server thread matter more: a server that runs on its caller's CPU serves callers on eight CPUs
only with a stack per CPU and locking inside, or serially.

**Server-side resolution by node** (no letter in the report; it is ToyOS's own avoidable work). The manual
says resolution is by node identity; the code resolves path strings, a lookup per component per call, three
times for an open, and on DATA reads the inode from the btree each time. An in-memory node and name table in
the shared file-server layer removes 1.2 µs of `stat` in memory and 3.9 on DATA today. Independent of A, B and C.

**Batching and asynchronous submission.** Ruled out as an answer to these rows: every row is one synchronous
call. Useful only where one std call is several requests (`fs::write` is open, write, close: one compound
request), which A makes moot for the write and C cheap for the rest.

**Ruled out by the manual, not by measurement:** D (names in the kernel) and E (co-located servers).

## 7. Recommendation (written before section 4; section 4 confirms the order, with section 9's correction)

1. **Step one: `fstat` and writes on the holder (the tracker's 3a plus holder writes).** Expected (inference):
   `fstat` from 7.5 µs to about 0.2 to 0.3; `write_4k_at` and a 4 KiB sequential write from 9 to 23 µs to about
   1; `create_write_unlink` loses one of three round trips. It needs nothing from 7b: these are system calls on
   the holder handle the open already returns, as `SYS_PAGED_READ` is. What it does need decided: where the
   attribute record's fields come from (kernel-stamped size and modification time, pager-written link count and
   the rest), and the growth limit's unit.
2. **The routing fix** (section 5) and, with it or after, the server's resolution by node: each lands a
   measurable drop in every path row whatever the round trip costs.
3. **C**, sized by the wake-path split section 4 gives the scheduling work: how much of the 7.1 µs is
   send-to-wake, wake-to-pick (the kick and the idle exit) and pick-to-user, on each side.
4. **B on 7b** for `stat` and open-to-read, if parity on those rows is required and not 2x.
5. Server threads, only if the build-shaped measurement shows the server near one CPU.

## 8. Proposed order, with the figure expected after each step (T14; every "after" figure is inference until built)

Decisions received from the coordinator 2026-11-11 are folded in; the order stands unless the measured split
(section 4) contradicts it.

| step | what it removes | `fstat` mem / disk | `write_4k_at` mem / disk | `stat` mem / disk | open+close mem / disk | Linux |
|---|---|---|---|---|---|---|
| today (measured) | | 7.5 / 9.5 µs | 9.1 / 22.6 | 9.5 / 12.3 | 12.2 / 21.4 | 0.21, 0.63–0.72, 0.58, 1.1–1.2 |
| 1. `fstat` and writes on the holder (3a + holder writes) | the round trip, two copies and the per-call reserve on every data and open-file attribute call | about 0.25 / 0.25 | about 1.0 / 1.0 (a local seek and one call shaped like `pread_4k`, 0.76 today) | unchanged | unchanged | |
| 2. path routing fix (section 5; boot B measures it) | about 0.9 of the client's 1.2 µs a path | — | — | about 8.5 / 11.4 | about 11.3 / 20.5 | |
| 3. server resolves by node, attributes in memory, one lookup an open | 1.2 µs of `stat` in memory, 3.9 on DATA; two of an open's three lookups | — | — | about 7.5 / 7.7 | about 9 / 10 | |
| 4. C, a round trip at about 1 µs (decided after the wake-path split) | about 6 µs of every remaining request | — | — | about 1.5 / 1.6 (2.6x Linux) | about 3 / 3.5 (2.5 to 3x) | |
| 5. B on 7b, if parity on `stat` and open-to-read is required | the request itself for names in a directory already listed | — | — | under 0.5 | to be designed: an open still makes a description on the server unless the holder alone is the open file | |

Sequential 4 KiB writes after step 1 (inference): memory about 0.8 µs a call, some 5,000 MB/s against Linux's
3,605; DATA near the 1 MiB-call row's 504 MB/s against Linux's 634, the remainder being write-back.
`create_write_unlink` loses one of its three round trips at step 1 and the other two shrink at step 4.

### Step one as decided

- **Attributes.** The kernel keeps the size (it changes with every holder write) and the modification time
  (stamped at the write from its clock). The pager writes the rest (link count, identity, kind, times only it
  knows) into a fixed-size record on the object, which the kernel stores as bytes and never reads. One call
  answers the record and the kernel's two fields.
- **How a pager's change is atomic to a reader, and visible at once.** The record is replaced whole by one pager
  call under the object's existing lock, and the holder's `fstat` copies record, size and time out of the object
  under one hold of the same lock into the caller's kernel stack, then to user memory with the lock let go: a
  reader sees the whole old record or the whole new one, never a mix, and never a size from one moment with a
  record from another. The server makes that call before it replies to the unlink or rename that changed the
  count, so any `fstat` that starts after the change returned sees it. No holder caches the record. If 7b later
  maps the record, the same replacement advances a sequence word the reader checks; nothing in step one
  depends on that.
- **Growth limit.** Per object, a byte offset (page-rounded by the kernel) up to which a holder write may extend
  the file without asking, backed by space the server has reserved. A write that would end past it is refused by
  the kernel with nothing written; the client asks the server (the existing write request), which reserves,
  raises the limit and writes, or answers "no space". The reservation chunk is chosen by measurement on the
  sequential-write rows; the engine side is coordinated with #1216's author through the coordinator.
- **Seal.** A holder write checks the object's seal in the same hold in which it takes the write, so a sealed
  object refuses every write by construction (map7b's D2; its boundary section and review are read before the
  kernel change is written).
- **Dirty admission and revocation** are built once, in this step, for map7b's mappings to share, unless map7b's
  design says otherwise.
- **Needs from 7b:** nothing to build on; only agreement on the seal's check and on who lands dirty admission.

## 9. Returned for decision: what a holder write is admitted against on DATA

The decided growth limit (a byte offset up to which a holder write may extend the file, backed by reserved space)
does not cover DATA. DATA's engine writes copy-on-write and its `reserve` holds capacity for every page a write
touches, grown or not (`data.rs`: a ticket per written page; the measured overwrite reserve is 4.3 µs with
nothing growing). A holder write that dirties a clean page inside the size, admitted against a growth limit
only, would be accepted with no capacity behind it; its write-back could then fail for space after `write`
returned success, which is data loss by the tracker's definition.

Proposed: the unit the server grants is **pages it may admit dirty**, not bytes it may grow. Each object carries a
credit the pager sets (pages backed by capacity it reserved, in bulk); the kernel's one dirty admission, the
same function map7b's write fault will use, takes one credit for each page that becomes dirty (clean or absent to
dirty; a page already dirty and not under write-back costs nothing), and refuses with nothing written where the
credit is short. The client then sends the existing write request, which reserves more, raises the credit and
writes, or answers "no space". A size ceiling stays only as the format's maximum file size. MEMORY grants no
credit and admits against its pager's dirty ceiling as now. This is map7b's D4, answered as "the server reserves
when it grants", and it replaces the growth limit rather than adding to it.

Tradeoffs: the server learns which pages were dirtied only at write-back, so DATA's per-page tickets become a
per-object pool drawn at write-back; capacity granted and never used is returned at release or on a credit
lowered by the pager. What stays uncertain: the grant size (measured on `seq_write_4k` and `pwrite_4k`), and
whether bcachefs's reservation can be held per object as one pool (its `disk_reservation` is a sector count,
inference from the server's use of it, not checked against the engine).

Until decided, step one's `fstat` half (the attribute record, size and time on the holder) is independent of it
and is built first.
