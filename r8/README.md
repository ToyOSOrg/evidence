# r8: #1077's last session, judged under r7/request.txt (base a0e8f1333, head 2798d7fa2)

All 24 boots exited 0 (run by the orchestrator). ab.py and rows.py are in r6 and r7.

**lan (T14, AMD Linux peer): passes.**
- No boot refused the group.
- `lan.wired.tcp.connect` went from p50 3.01 ms to 2.06 ms, -31.5%, resolved (every head run below every base run).
- `upload` (-0.9%, p=0.37), `download` (-1.4%, p=0.66) and `rtt.64` (+0.7%, p=0.89) are unresolved: no regression.

**benchcase: fails rule 4.** These rows resolve worse at head by more than 2%:
- T14:
  - `fs.mem.read_4k_at` +4.4%
  - `fs.mem.seq_read.4096` -4.7%
  - `fs.mem.seq_write.4096` -4.8%
  - `ipc.connect_accept` +2.4%
  - `mem.anon.total` +2.3% (`touch` +1.8%)
  - `mem.bw.write` -2.7%
- AMD bench: `mem.anon.total` +2.5% (`touch` +2.3%).

Exceptions examined (kernels carved from these images, as in r7):
- **(a) layout, holds:** `mem.bw.write`. It is userland, and osbench differs only in net and transport functions (r7).
- **(a) layout, does not hold strictly:** `mem.anon.touch`. On its fault path only `AddressSpace::populate` differs: register allocation, with the same instruction count.
- **(a) layout, does not hold:** `fs.mem.*` and `ipc.connect_accept` go through `user_ptr::View::window`, whose `allows` closure now carries the commit check, about eight more instructions per window. The rows moved by 25 to 60 ns per call, more than those instructions would explain. In r5 the same fs.mem rows read better at head on the T14, and the AMD bench shows none of them now. That inconsistency is not one of the rule's exceptions.
- **AMD `mem.anon.map`:** no longer differs (201 to 214 against 213 to 216); r5's +84% did not recur.
