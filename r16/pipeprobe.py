#!/usr/bin/env python3
"""pipeprobe.py <commit> <base|head> <branch>: a measurement-only pipe-path probe on top of <commit>."""
import sys, subprocess, os
commit, arm, branch = sys.argv[1:]
env = dict(os.environ, GIT_INDEX_FILE="/private/tmp/claude-502/-Users-jan-Dev-jan-toyos/80e90c3a-7449-46b8-84cc-b59e9dd31ae9/scratchpad/pipeprobe.idx")
def git(*a, inp=None): return subprocess.run(["git", *a], input=inp, capture_output=True, text=True, env=env, check=True).stdout
git("read-tree", commit)
def edit(path, pairs):
    s = git("show", f":{path}")
    for old, new, *count in pairs:
        n = count[0] if count else 1
        assert s.count(old) == n, (path, old[:70], s.count(old)); s = s.replace(old, new)
    h = git("hash-object", "-w", "--stdin", inp=s).strip()
    git("update-index", "--cacheinfo", f"100644,{h},{path}")
MOD = r'''//! MEASUREMENT ONLY, never to land: pipe-path timings by write-size class.
use core::sync::atomic::{AtomicU64, AtomicUsize, Ordering::Relaxed};
pub struct Bin { calls: AtomicU64, bytes: AtomicU64, ns: AtomicU64 }
impl Bin { const fn new() -> Self { Self { calls: AtomicU64::new(0), bytes: AtomicU64::new(0), ns: AtomicU64::new(0) } } }
const C: usize = 5;
pub struct Kind([Bin; C]);
impl Kind {
    const fn new() -> Self { Self([Bin::new(), Bin::new(), Bin::new(), Bin::new(), Bin::new()]) }
    pub fn add(&self, class: usize, bytes: u64, began: u64) {
        let b = &self.0[class];
        b.calls.fetch_add(1, Relaxed); b.bytes.fetch_add(bytes, Relaxed);
        b.ns.fetch_add(now().saturating_sub(began), Relaxed);
    }
}
/// Write-size class: 64, 256, 1024, 4096, other.
pub fn class(n: usize) -> usize { match n { 64 => 0, 256 => 1, 1024 => 2, 4096 => 3, _ => 4 } }
static LAST: AtomicUsize = AtomicUsize::new(4);
pub fn wrote(n: usize) -> usize { let c = class(n); if c < 4 { LAST.store(c, Relaxed) } c }
pub fn last() -> usize { LAST.load(Relaxed) }
pub fn now() -> u64 { crate::clock::nanos_since_boot() }
pub static WT: Kind = Kind::new(); pub static RT: Kind = Kind::new();
pub static WK: Kind = Kind::new(); pub static RK: Kind = Kind::new();
pub static WB: Kind = Kind::new(); pub static WL: Kind = Kind::new();
pub static RL: Kind = Kind::new(); pub static RC: Kind = Kind::new(); pub static RF: Kind = Kind::new();
/// One log line per size class, each under the record limit, after every exit line.
pub fn log_lines(name: &str, pid: impl core::fmt::Display) {
    for (i, sz) in ["64", "256", "1024", "4096"].iter().enumerate() {
        let b = |k: &Kind| { let b = &k.0[i]; (b.calls.load(Relaxed), b.bytes.load(Relaxed), b.ns.load(Relaxed)) };
        let f = |k: &Kind| { let (c, by, n) = b(k); alloc::format!("{c}/{by}/{n}") };
        crate::log!("pipeprobe: {name} pid={pid} class={sz} wt={} rt={} wk={} rk={} wb={} wl={} rl={} rc={} rf={}",
            f(&WT), f(&RT), f(&WK), f(&RK), f(&WB), f(&WL), f(&RL), f(&RC), f(&RF));
    }
}
'''
h = git("hash-object", "-w", "--stdin", inp=MOD).strip()
git("update-index", "--add", "--cacheinfo", f"100644,{h},kernel/src/pipeprobe.rs")
main_rs = git("show", ":kernel/src/main.rs")
anchor = "\nmod user_ptr;" if "\nmod user_ptr;" in main_rs else "\npub mod user_ptr;"
edit("kernel/src/main.rs", [(anchor, anchor + "\nmod pipeprobe;")])
edit("kernel/src/process.rs", [
    ('''    log!("exit: {name} pid={process_pid} {end} cpu={}ms {consumed}", cpu_ns / 1_000_000);''',
     '''    log!("exit: {name} pid={process_pid} {end} cpu={}ms {consumed}", cpu_ns / 1_000_000);
    crate::pipeprobe::log_lines(name, process_pid);'''),
    ('''pub fn wake_pipe_readers(pipe: &pipe::PipeRef) {
    scheduler::wake_pipe_readers(pipe);
}''', '''pub fn wake_pipe_readers(pipe: &pipe::PipeRef) {
    let began = crate::pipeprobe::now();
    scheduler::wake_pipe_readers(pipe);
    crate::pipeprobe::WK.add(crate::pipeprobe::last(), 0, began);
}'''),
    ('''pub fn wake_pipe_writers(pipe: &pipe::PipeRef) {
    scheduler::wake_pipe_writers(pipe);
}''', '''pub fn wake_pipe_writers(pipe: &pipe::PipeRef) {
    let began = crate::pipeprobe::now();
    scheduler::wake_pipe_writers(pipe);
    crate::pipeprobe::RK.add(crate::pipeprobe::last(), 0, began);
}'''),
])
# Whole-syscall wrappers, both arms.
wrap = [
    ('pub(super) fn sys_write(h: RawHandle, buf: &UserBytes) -> u64 {', '''pub(super) fn sys_write(h: RawHandle, buf: &UserBytes) -> u64 {
    let class = crate::pipeprobe::wrote(buf.len());
    let began = crate::pipeprobe::now();
    let answer = sys_write_probed(h, buf);
    crate::pipeprobe::WT.add(class, buf.len() as u64, began);
    answer
}

fn sys_write_probed(h: RawHandle, buf: &UserBytes) -> u64 {'''),
    ('pub(super) fn sys_read(h: RawHandle, buf: &mut UserBytesMut) -> u64 {', '''pub(super) fn sys_read(h: RawHandle, buf: &mut UserBytesMut) -> u64 {
    let class = crate::pipeprobe::last();
    let began = crate::pipeprobe::now();
    let answer = sys_read_probed(h, buf);
    crate::pipeprobe::RT.add(class, if (answer as i64) > 0 { answer } else { 0 }, began);
    answer
}

fn sys_read_probed(h: RawHandle, buf: &mut UserBytesMut) -> u64 {'''),
]
if arm == "head":
    edit("kernel/src/syscall/io.rs", wrap + [
        ('''    let mut bounce = PipeBounce::new();
    // A buffer that faults is the general path's to answer, after its handle.
    let src = bounce.read(buf).ok()?.bytes();
    let (word, pipe) = process::with_process_data(|data| {
        let KObjectRef::PipeWrite(w) = data.handles.get_ref(h, Rights::WRITE).ok()? else { return None };
        let word = ops::pipe_written(w.pipe().put_now(src)?)?;
        Some((word, w.pipe().clone()))
    })?;''', '''    let mut bounce = PipeBounce::new();
    let class = crate::pipeprobe::class(buf.len());
    let began = crate::pipeprobe::now();
    // A buffer that faults is the general path's to answer, after its handle.
    let src = bounce.read(buf).ok()?.bytes();
    crate::pipeprobe::WB.add(class, buf.len() as u64, began);
    let began = crate::pipeprobe::now();
    let (word, pipe) = process::with_process_data(|data| {
        let KObjectRef::PipeWrite(w) = data.handles.get_ref(h, Rights::WRITE).ok()? else { return None };
        let word = ops::pipe_written(w.pipe().put_now(src)?)?;
        Some((word, w.pipe().clone()))
    })?;
    crate::pipeprobe::WL.add(class, buf.len() as u64, began);'''),
        ('''    let mut bounce = PipeBounce::new();
    let (taken, pipe) = process::with_process_data(|data| {
        let KObjectRef::PipeRead(r) = data.handles.get_ref(h, Rights::READ).ok()? else { return None };
        Some((r.pipe().take_now(buf.len(), &mut bounce)?, r.pipe().clone()))
    })?;
    let n = taken.n;
    drop(taken);
    // A reader whose buffer faults loses what it took, as a claimed read does.
    let copied = buf.write_at(0, bounce.bytes());''', '''    let mut bounce = PipeBounce::new();
    let class = crate::pipeprobe::last();
    let began = crate::pipeprobe::now();
    let (taken, pipe) = process::with_process_data(|data| {
        let KObjectRef::PipeRead(r) = data.handles.get_ref(h, Rights::READ).ok()? else { return None };
        Some((r.pipe().take_now(buf.len(), &mut bounce)?, r.pipe().clone()))
    })?;
    let n = taken.n;
    drop(taken);
    crate::pipeprobe::RL.add(class, n as u64, began);
    let began = crate::pipeprobe::now();
    // A reader whose buffer faults loses what it took, as a claimed read does.
    let copied = buf.write_at(0, bounce.bytes());
    crate::pipeprobe::RC.add(class, n as u64, began);'''),
        ('''fn sys_read_probed(h: RawHandle, buf: &mut UserBytesMut) -> u64 {
    if let Some(n) = pipe_read_now(h, buf) {
        return n;
    }''', '''fn sys_read_probed(h: RawHandle, buf: &mut UserBytesMut) -> u64 {
    if let Some(n) = pipe_read_now(h, buf) {
        return n;
    }
    let fell = crate::pipeprobe::now();
    let answer = sys_read_general(h, buf);
    crate::pipeprobe::RF.add(crate::pipeprobe::last(), if (answer as i64) > 0 { answer } else { 0 }, fell);
    answer
}

fn sys_read_general(h: RawHandle, buf: &mut UserBytesMut) -> u64 {'''),
    ])
else:
    edit("kernel/src/syscall/io.rs", wrap + [
        ('''        let action = process::with_process_data(|data| {
            let object = match data.handles.get_ref(h, Rights::WRITE) {''', '''        let held = crate::pipeprobe::now();
        let action = process::with_process_data(|data| {
            let object = match data.handles.get_ref(h, Rights::WRITE) {'''),
        ('''        match action {
            Ok((n, pipe)) => {
                if let Some(pipe) = pipe { process::wake_pipe_readers(&pipe); }''', '''        crate::pipeprobe::WL.add(crate::pipeprobe::class(buf.len()), buf.len() as u64, held);
        match action {
            Ok((n, pipe)) => {
                if let Some(pipe) = pipe { process::wake_pipe_readers(&pipe); }'''),
        ('''        let action = process::with_process_data(|data| {
            let object = match data.handles.get_ref(h, Rights::READ) {''', '''        let held = crate::pipeprobe::now();
        let action = process::with_process_data(|data| {
            let object = match data.handles.get_ref(h, Rights::READ) {'''),
        ('''        match action {
            Ok((n, pipe)) => {
                if let Some(pipe) = pipe { process::wake_pipe_writers(&pipe); }''', '''        crate::pipeprobe::RL.add(crate::pipeprobe::last(), match &action { Ok((n, _)) if (*n as i64) > 0 => *n, _ => 0 }, held);
        match action {
            Ok((n, pipe)) => {
                if let Some(pipe) = pipe { process::wake_pipe_writers(&pipe); }'''),
    ])
c = git("commit-tree", git("write-tree").strip(), "-p", commit, "-m", f"MEASUREMENT ONLY: pipe-path timings by write size in every exit line ({arm})\n\nCo-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>").strip()
git("branch", "-f", branch, c)
print(branch, c)
