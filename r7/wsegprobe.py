#!/usr/bin/env python3
"""wsegprobe.py <tree> base|head: MEASUREMENT ONLY. The segment probe's machinery and a pipe write's segments, printed with a busy thread's line."""
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
    edit("kernel/src/syscall/io.rs", [
    ('''    let mut bounce = PipeBounce::new();
    let src = bounce.read(buf).bytes();
    let (word, pipe) = process::with_process_data(|data| {
        let KObjectRef::PipeWrite(w) = data.handles.get_ref(h, Rights::WRITE).ok()? else { return None };
        let word = ops::pipe_written(w.pipe().put_now(src)?)?;
        Some((word, w.pipe().clone()))
    })?;
    process::wake_pipe_readers(&pipe);''', f'''    let t0 = {P}stamp();
    let mut bounce = PipeBounce::new();
    let src = bounce.read(buf).bytes();
    {P}seg(13, t0);
    let t1 = {P}stamp();
    let (word, pipe) = process::with_process_data(|data| {{
        let KObjectRef::PipeWrite(w) = data.handles.get_ref(h, Rights::WRITE).ok()? else {{ return None }};
        let word = ops::pipe_written(w.pipe().put_now(src)?)?;
        Some((word, w.pipe().clone()))
    }})?;
    {P}seg(14, t1);
    let t2 = {P}stamp();
    process::wake_pipe_readers(&pipe);
    {P}seg(15, t2);'''),
    ])
else:
    edit("kernel/src/syscall/io.rs", [
    ('''    loop {
        let action = process::with_process_data(|data| {
            let object = match data.handles.get_ref(h, Rights::WRITE) {''', f'''    loop {{
        let t1 = {P}stamp();
        let action = process::with_process_data(|data| {{
            let object = match data.handles.get_ref(h, Rights::WRITE) {{'''),
    ('''            Ok((n, pipe)) => {
                if let Some(pipe) = pipe { process::wake_pipe_readers(&pipe); }
                return n;
            }''', f'''            Ok((n, pipe)) => {{
                {P}seg(14, t1);
                let t2 = {P}stamp();
                if let Some(pipe) = pipe {{ process::wake_pipe_readers(&pipe); }}
                {P}seg(15, t2);
                return n;
            }}'''),
    ])
# the busy thread's line carries the segments
edit("kernel/src/process.rs", [('''            log!("probe thread pid={process_pid} calls={}{line}", profile.calls());''', '''            let _ = write!(line, " segs");
            for (id, (n, cycles)) in profile.segs().iter().enumerate() {
                if *n > 0 {
                    let _ = write!(line, " {id}:{n}x{cycles}");
                }
            }
            log!("probe thread pid={process_pid} calls={}{line}", profile.calls());''')])
print("ok", arm)
