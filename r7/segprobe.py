#!/usr/bin/env python3
"""segprobe.py <tree> base|head: MEASUREMENT ONLY. Per-segment TSC cycles in the
send, receive and pipe-read paths, summed per thread and printed at exit."""
import sys, pathlib, re
tree, arm = sys.argv[1:]
T = pathlib.Path(tree)
def edit(p, pairs):
    p = T / p; s = p.read_text()
    for old, new in pairs:
        assert s.count(old) == 1, (str(p), old[:80], s.count(old))
        s = s.replace(old, new)
    p.write_text(s)
# common
(T / "kernel/src/probe.rs").write_text('''//! MEASUREMENT ONLY (s0a segment probe): TSC cycles per code segment, summed
//! in the running thread's syscall profile and printed at its process's exit.

pub fn stamp() -> u64 {
    // SAFETY: RDTSC has no preconditions.
    unsafe { core::arch::x86_64::_rdtsc() }
}

/// The running thread spent `stamp() - since` cycles in segment `id`.
pub fn seg(id: usize, since: u64) {
    crate::sched::driver::note_seg(id, stamp().wrapping_sub(since));
}
''')
edit("kernel/src/main.rs", [("mod pipe;", "mod pipe;\nmod probe;")])
edit("kernel/src/sched/driver.rs", [('''/// Count the running thread's syscall `num`, which took `ticks` of the counter.''', '''/// MEASUREMENT ONLY: the running thread spent `cycles` in probe segment `id`.
pub fn note_seg(id: usize, cycles: u64) {
    try_with_cpu(|cpu| cpu.running().map(|t| t.ext().handle.syscalls().seg(id, cycles)));
}

/// Count the running thread's syscall `num`, which took `ticks` of the counter.''')])
edit("kernel/src/sched/payload.rs", [
('''    ticks_by_number: [AtomicU64; toyos_abi::syscall::SYSCALL_PROFILE_BINS],
}''', '''    ticks_by_number: [AtomicU64; toyos_abi::syscall::SYSCALL_PROFILE_BINS],
    /// MEASUREMENT ONLY: probe segments' cycles and counts.
    seg_cycles: [AtomicU64; 16],
    seg_count: [AtomicU64; 16],
}'''),
('''            ticks_by_number: [const { AtomicU64::new(0) }; toyos_abi::syscall::SYSCALL_PROFILE_BINS],
        }''', '''            ticks_by_number: [const { AtomicU64::new(0) }; toyos_abi::syscall::SYSCALL_PROFILE_BINS],
            seg_cycles: [const { AtomicU64::new(0) }; 16],
            seg_count: [const { AtomicU64::new(0) }; 16],
        }'''),
('''    /// MEASUREMENT ONLY (s0a-probe): each number's mean wall time per call, ns.''', '''    pub fn seg(&self, id: usize, cycles: u64) {
        let bump = |count: &AtomicU64, by: u64| count.store(count.load(Ordering::Relaxed) + by, Ordering::Relaxed);
        bump(&self.seg_cycles[id], cycles);
        bump(&self.seg_count[id], 1);
    }

    /// Each segment's (count, mean cycles).
    pub fn segs(&self) -> [(u64, u64); 16] {
        core::array::from_fn(|i| {
            let n = self.seg_count[i].load(Ordering::Relaxed);
            (n, if n == 0 { 0 } else { self.seg_cycles[i].load(Ordering::Relaxed) / n })
        })
    }

    /// MEASUREMENT ONLY (s0a-probe): each number's mean wall time per call, ns.''')])
edit("kernel/src/process.rs", [
('''    syscall_ns: [u64; toyos_abi::syscall::SYSCALL_PROFILE_BINS],
}''', '''    syscall_ns: [u64; toyos_abi::syscall::SYSCALL_PROFILE_BINS],
    segs: [(u64, u64); 16],
}'''),
('''        write!(f, " probe_ns_per_call")?;''', '''        write!(f, " probe_seg")?;
        for (id, &(n, cycles)) in self.segs.iter().enumerate() {
            if n > 0 {
                write!(f, " {id}:{n}x{cycles}")?;
            }
        }
        write!(f, " probe_ns_per_call")?;'''),
('''    let syscall_ns = syscalls.map_or([0; toyos_abi::syscall::SYSCALL_PROFILE_BINS], |s| s.ns_by_number());''', '''    let syscall_ns = syscalls.map_or([0; toyos_abi::syscall::SYSCALL_PROFILE_BINS], |s| s.ns_by_number());
    let segs = syscalls.map_or([(0, 0); 16], |s| s.segs());'''),
('''        syscall_ns,''', '''        syscall_ns,
        segs,'''),
])
P = "crate::probe::"
if arm == "head":
    edit("kernel/src/syscall/ipc.rs", [
    # 0: send copy-in
    ('''    let bounce = (out.bytes.len() <= BOUNCE).then(|| bounce.read(&out.bytes));''',
     f'''    let t0 = {P}stamp();
    let bounce = (out.bytes.len() <= BOUNCE).then(|| bounce.read(&out.bytes));
    {P}seg(0, t0);'''),
    # 1: send process hold
    ('''                let moved = process::with_process_data(|data| {
                    let tx = checked(data)?;''', f'''                let t1 = {P}stamp();
                let moved = process::with_process_data(|data| {{
                    let tx = checked(data)?;'''),
    ('''                    Ok::<_, crate::object::Refusal>((tx, moved, handed))
                });
                match moved {
                    Ok((tx, Ok(()), handed)) => {
                        sent(&tx, handed);''', f'''                    Ok::<_, crate::object::Refusal>((tx, moved, handed))
                }});
                {P}seg(1, t1);
                match moved {{
                    Ok((tx, Ok(()), handed)) => {{
                        let t3 = {P}stamp();
                        sent(&tx, handed);
                        {P}seg(3, t3);'''),
    # 4: recv process hold, 6: copy-out, 7: delivered
    ('''        let looked = process::with_process_data(|data| {
            let rx = data.handles.get::<ConnectionEnd>(conn_h, Rights::READ)?.rx().clone();''', f'''        let t4 = {P}stamp();
        let looked = process::with_process_data(|data| {{
            let rx = data.handles.get::<ConnectionEnd>(conn_h, Rights::READ)?.rx().clone();'''),
    ('''            Ok::<_, crate::object::HandleError>((rx, received))
        });''', f'''            Ok::<_, crate::object::HandleError>((rx, received))
        }});
        {P}seg(4, t4);'''),
    ('''                let bytes = bounce.bytes();
                let first = bytes.len().min(into.head.len());
                into.head.write_at(0, &bytes[..first]);
                into.bytes.write_at(0, &bytes[first..]);
                let (head, installed) = (received.head, received.installed);
                drop(received);
                return delivered(&rx, into, head, &installed);''', f'''                let t6 = {P}stamp();
                let bytes = bounce.bytes();
                let first = bytes.len().min(into.head.len());
                into.head.write_at(0, &bytes[..first]);
                into.bytes.write_at(0, &bytes[first..]);
                let (head, installed) = (received.head, received.installed);
                drop(received);
                {P}seg(6, t6);
                let t7 = {P}stamp();
                let word = delivered(&rx, into, head, &installed);
                {P}seg(7, t7);
                return word;'''),
    ])
    edit("kernel/src/message.rs", [
    # 2: send queue hold; 5: recv queue hold
    ('''    pub fn send_bounced(&self, src: &[u8], mut batch: Vec<HandleEntry>) -> Result<(), (Vec<HandleEntry>, Unbounced)> {
        let mut state = self.0.state.lock();''', f'''    pub fn send_bounced(&self, src: &[u8], mut batch: Vec<HandleEntry>) -> Result<(), (Vec<HandleEntry>, Unbounced)> {{
        let t2 = {P}stamp();
        let mut state = self.0.state.lock();'''),
    ('''        state.queue.push(src.len(), batch.drain(..));
        drop(state);
        // The empty batch's storage goes back with the queue's lock let go.''', f'''        state.queue.push(src.len(), batch.drain(..));
        drop(state);
        {P}seg(2, t2);
        // The empty batch's storage goes back with the queue's lock let go.'''),
    ('''    pub fn recv_bounced(&self, table: &mut HandleTable, buf: usize, cap: usize, into: &mut Bounce) -> Result<Option<Received>, Unclaimed> {
        let mut state = self.0.state.lock();''', f'''    pub fn recv_bounced(&self, table: &mut HandleTable, buf: usize, cap: usize, into: &mut Bounce) -> Result<Option<Received>, Unclaimed> {{
        let t5 = {P}stamp();
        let mut state = self.0.state.lock();'''),
    ('''        let boost = core::mem::take(&mut state.rt_boost_pending);
        Ok(Some(Received { head, installed, _spares: spares, boost }))''', f'''        let boost = core::mem::take(&mut state.rt_boost_pending);
        drop(state);
        {P}seg(5, t5);
        Ok(Some(Received {{ head, installed, _spares: spares, boost }}))'''),
    ])
    edit("kernel/src/syscall/io.rs", [
    # 8: pipe read hold, 9: copy-out, 10: wake
    ('''    let mut bounce = Bounce::new();
    let (taken, pipe) = process::with_process_data(|data| {
        let KObjectRef::PipeRead(r) = data.handles.get_ref(h, Rights::READ).ok()? else { return None };
        Some((r.pipe().take_now(buf.len(), &mut bounce)?, r.pipe().clone()))
    })?;
    let n = taken.n;
    drop(taken);
    buf.write_at(0, bounce.bytes());
    process::wake_pipe_writers(&pipe);''', f'''    let mut bounce = Bounce::new();
    let t8 = {P}stamp();
    let (taken, pipe) = process::with_process_data(|data| {{
        let KObjectRef::PipeRead(r) = data.handles.get_ref(h, Rights::READ).ok()? else {{ return None }};
        Some((r.pipe().take_now(buf.len(), &mut bounce)?, r.pipe().clone()))
    }})?;
    {P}seg(8, t8);
    let n = taken.n;
    drop(taken);
    let t9 = {P}stamp();
    buf.write_at(0, bounce.bytes());
    {P}seg(9, t9);
    let t10 = {P}stamp();
    process::wake_pipe_writers(&pipe);
    {P}seg(10, t10);'''),
    ])
else:
    edit("kernel/src/syscall/ipc.rs", [
    ('''        let sent = process::with_process_data(|data| {
            let conn = data.handles.get::<ConnectionEnd>(conn_h, need)?;''', f'''        let t1 = {P}stamp();
        let sent = process::with_process_data(|data| {{
            let conn = data.handles.get::<ConnectionEnd>(conn_h, need)?;'''),
    ('''            Ok::<_, crate::object::Refusal>((tx, moved, handed))
        });''', f'''            Ok::<_, crate::object::Refusal>((tx, moved, handed))
        }});
        {P}seg(1, t1);'''),
    ('''                crate::scheduler::post_lending(tx.read_watch(), || tx.set_rt_boost_pending());
                return Ok(());''', f'''                let t3 = {P}stamp();
                crate::scheduler::post_lending(tx.read_watch(), || tx.set_rt_boost_pending());
                {P}seg(3, t3);
                return Ok(());'''),
    ('''        let taken = process::with_process_data(|data| {
            let conn = data.handles.get::<ConnectionEnd>(conn_h, Rights::READ)?;''', f'''        let t4 = {P}stamp();
        let taken = process::with_process_data(|data| {{
            let conn = data.handles.get::<ConnectionEnd>(conn_h, Rights::READ)?;'''),
    ('''            Ok::<_, crate::object::Refusal>((rx, taken))
        });''', f'''            Ok::<_, crate::object::Refusal>((rx, taken))
        }});
        {P}seg(4, t4);'''),
    ('''                // Room for the sender.
                rx.write_watch().post();''', f'''                // Room for the sender.
                let t7 = {P}stamp();
                rx.write_watch().post();
                {P}seg(7, t7);'''),
    ])
    edit("kernel/src/message.rs", [
    ('''    pub fn send(&self, bytes: &UserBytes, batch: Vec<HandleEntry>) -> Result<(), (Vec<HandleEntry>, SendRefused)> {
        let mut state = self.0.state.lock();''', f'''    pub fn send(&self, bytes: &UserBytes, batch: Vec<HandleEntry>) -> Result<(), (Vec<HandleEntry>, SendRefused)> {{
        let t2 = {P}stamp();
        let mut state = self.0.state.lock();'''),
    ('''        state.queue.push(bytes.len(), batch.into_iter());
        Ok(())''', f'''        state.queue.push(bytes.len(), batch.into_iter());
        drop(state);
        {P}seg(2, t2);
        Ok(())'''),
    ('''        let (taken, boost) = {
            let mut guard = self.0.state.lock();''', f'''        let t5 = {P}stamp();
        let (taken, boost) = {{
            let mut guard = self.0.state.lock();'''),
    ('''            taken
        };
        if boost {''', f'''            taken
        }};
        {P}seg(5, t5);
        if boost {{'''),
    ])
    edit("kernel/src/syscall/io.rs", [
    ('''    loop {
        let action = process::with_process_data(|data| {
            let object = match data.handles.get_ref(h, Rights::READ) {''', f'''    loop {{
        let t8 = {P}stamp();
        let action = process::with_process_data(|data| {{
            let object = match data.handles.get_ref(h, Rights::READ) {{'''),
    ('''            Ok((n, pipe)) => {
                if let Some(pipe) = pipe { process::wake_pipe_writers(&pipe); }
                return n;
            }
            Err(ReadBlock::Pipe(pipe)) => {''', f'''            Ok((n, pipe)) => {{
                {P}seg(8, t8);
                let t10 = {P}stamp();
                if let Some(pipe) = pipe {{ process::wake_pipe_writers(&pipe); }}
                {P}seg(10, t10);
                return n;
            }}
            Err(ReadBlock::Pipe(pipe)) => {{'''),
    ])
print("ok", arm)
