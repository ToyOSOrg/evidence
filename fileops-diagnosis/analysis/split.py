import sys, re
# usage: split.py <osbench.txt>... ; prints p50 per row per stage, one column per boot
cols = ["total","std_and_harness","sdk.client","rt.client_send_syscall","request.send_enter_to_wake","request.wake_to_pick","request.pick_to_user","rt.server_recv_syscall","rt.server_handling","srv.prev.send_syscall","reply.server_done_to_wake","reply.wake_to_pick","reply.pick_to_user","rt.round_trips_minus_handling","kernel.paged_read_syscall","close.send_syscall","client.send_ret_to_park","client.park_to_idle_enter"]
short = ["total","std","sdk","c.send","rq.s2w","rq.w2p","rq.p2u","s.recv","s.hand","s.send","rp.d2w","rp.w2p","rp.p2u","rt-hand","held","close","c.s2park","c.p2idle"]
files = sys.argv[1:]
data = []
for f in files:
    d = {}
    for line in open(f):
        m = re.search(r'bench=fileops\.(mem|disk)\.([a-z_0-9]+)\.(\S+) .* p50=(\d+)', line)
        if m: d[(m.group(1), m.group(2), m.group(3))] = int(m.group(4))
    data.append(d)
rows = []
for fs in ("mem","disk"):
    for r in ["null","fstat","stat","open_close","reopen_read_4k","write_4k_at","pwrite_4k","pwrite_8","seq_write_4k","seq_overwrite_4k","read_4k_at","pread_4k","pread_8","seek","rename","mkdir_rmdir","create_write_unlink"]:
        rows.append((fs,r))
print("row".ljust(28) + "".join(s.rjust(9) for s in short))
for fs, r in rows:
    for i, d in enumerate(data):
        vals = [d.get((fs, r, c)) for c in cols]
        if all(v is None for v in vals): continue
        print((f"{fs}.{r}#{i}").ljust(28) + "".join(("-" if v is None else str(v)).rjust(9) for v in vals))
