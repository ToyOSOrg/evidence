#!/usr/bin/env python3
"""Decode the scout kernel's segment readings out of a boot's log.
usage: seg.py <log> [row-substring]"""
import re, sys, collections

NAMES = {
 1:"dispatch_in", 2:"epilogue(drain,post_owed,note)", 3:"exit_to_user",
 10:"futex_translate", 12:"wait:first_ready", 13:"wait:arm(register)", 14:"wait:ready_again",
 15:"wait:checks+prepare", 16:"wait:after_block_on", 17:"futex:post_n", 18:"kick:pre", 19:"kick:ipi_send",
 20:"watch:post",
 30:"pass:enter", 31:"passblock:enter", 32:"pass:pre(now,hooks)", 33:"pass:begin(with_cpu+begin)",
 34:"pass:canary+publish", 35:"passblock:commit", 36:"pass:dispose", 37:"pass:finish(leftover)",
 38:"pass:charge+publish2", 39:"pass:execute_returned",
 40:"begin:doorbell+charge", 41:"begin:drain", 42:"begin:deadlines",
 43:"block:leave_running", 44:"block:park+insert", 45:"block:trace+settle",
 46:"fin:preempt_if_due", 47:"fin:pick", 48:"fin:steal+balance", 49:"fin:publish+push", 50:"fin:apply_timer(rest)",
 51:"sleep:steal_probe", 52:"sleep:idle_plan", 53:"sleep:apply_timer(rest)", 54:"sleep:arm+confirm",
 60:"sw:fs_read+frame", 61:"sw:percpu+pio", 62:"sw:stack+cr3", 63:"sw:fs_write", 64:"sw:note+ss",
 65:"sw:fpu_save", 66:"sw:context_switch", 67:"sw:fpu_restore",
 70:"idle:final_look", 71:"idle:wait_prep", 72:"idle:HALTED(c1)+to_after_hlt", 76:"idle:HALTED(deep)+to_after",
 73:"idle:learn", 74:"idleloop:hooks", 75:"idle:wait_returned",
 80:"kick:handler_entry", 81:"kick:handler", 82:"timer:handler_entry",
 90:"timer:now+convert", 91:"timer:ARM_WRITE", 92:"timer:trace_record", 93:"timer:stop_pre", 94:"timer:STOP_WRITE",
 100:"msg_send:copyin", 101:"msg_send:table+queue", 102:"msg_send:post", 103:"msg_recv:table+take", 104:"msg_recv:copyout",
 110:"drain:mailbox_pop", 111:"drain:parked.remove", 112:"drain:task.wake", 113:"drain:trace Wake", 114:"drain:place(hold)", 115:"drain:pop(empty)",
 120:"leave:threads.leave", 121:"leave:job.leave", 122:"leave:groups.leave", 123:"leave:members.remove+drop", 124:"leave:reweigh",
 125:"block:task.park", 126:"block:insert+trace Park",
 129:"enter:job.clone", 130:"enter:job.enter+count", 131:"enter:members.get(+readmit)", 132:"enter:groups.join", 133:"enter:members.insert", 135:"enter:threads.join", 136:"enter:reweigh",
 140:"begin:doorbell", 141:"begin:task.charge", 142:"charge:group", 143:"charge:thread",
 149:"pick:to_pick_fair", 150:"pick:refresh", 151:"pick:groups.pick", 152:"pick:threads.pick", 153:"pick:take", 154:"pick:task.dispatch",
 155:"publish:load+surplus", 156:"publish:refresh", 159:"put_back:pre", 160:"yield:group end_request", 161:"yield:thread end_request",
 250:"cal_a", 251:"cal_b(one probe)",
}
SYS = {0:"write",1:"read",49:"nanosleep",58:"futex_wait",59:"futex_wake",133:"message_send",159:"message_recv",
       163:"current_cpu",168:"yield",7:"scout",41:"thread_join",40:"thread_spawn",161:"set_affinity",5:"thread_exit"}
def name(i):
    if i >= 512: return "body_end:" + SYS.get(i-512, str(i-512))
    if i >= 256: return "USER+entry->" + SYS.get(i-256, str(i-256))
    return NAMES.get(i, str(i))

OPS = {"pingpong":10000, "ipc.reqrep.8":5000, "ipc.reqrep.4096":5000, "ipc.reqrep.65536":2000,
       "ipc.reqrep_handle.8":5000, "time.yield":1500000, "wake.onto_busy":200, "calibrate":100000, "wake.periodic":5000, "time.timer_1ms":5000,
       "time.sleep_late.1ms":300, "time.sleep_late.10ms":100, "time.sleep_late":1000}
def ops(row):
    for k,v in OPS.items():
        if row.startswith(k): return v
    return 1

rows = collections.OrderedDict()
khz = None
for line in open(sys.argv[1], errors="replace"):
    m = re.search(r"scoutseg tsc_khz=(\d+)", line)
    if m: khz = int(m.group(1))
    m = re.search(r"scoutseg row=(\S+) cpu=(\d+)((?: \d+:\d+:\d+)+)", line)
    if not m: continue
    row, cpu = m.group(1), int(m.group(2))
    for rec in m.group(3).split():
        i,c,s = map(int, rec.split(":"))
        rows.setdefault(row, {}).setdefault(cpu, []).append((i,c,s))
want = sys.argv[2] if len(sys.argv) > 2 else ""
print(f"tsc_khz={khz}")
for row, cpus in rows.items():
    if want not in row: continue
    n = ops(row)
    print(f"\n== {row}  (per op over {n} ops; ticks, ns)")
    for cpu, recs in sorted(cpus.items()):
        total = sum(s for _,_,s in recs)
        if total / n < 20: continue
        print(f" cpu{cpu}: total {total/n:9.1f} ticks/op = {total/n*1e6/khz if khz else 0:8.1f} ns/op")
        for i,c,s in sorted(recs, key=lambda r: -r[2]):
            if s / n < 1 and c / n < 0.01: continue
            print(f"   {name(i):36s} n/op={c/n:6.2f}  ticks/op={s/n:9.1f}  ns/op={s/n*1e6/khz if khz else 0:8.1f}  per-hit={s/c:8.1f}")
