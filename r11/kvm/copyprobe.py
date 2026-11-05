#!/usr/bin/env python3
"""copyprobe.py <commit> <arm: base|head> <branch>: commit a measurement-only copy probe on top of <commit>."""
import sys, subprocess, os
commit, arm, branch = sys.argv[1:]
env = dict(os.environ, GIT_INDEX_FILE="/private/tmp/claude-502/-Users-jan-Dev-jan-toyos/80e90c3a-7449-46b8-84cc-b59e9dd31ae9/scratchpad/copyprobe.idx")
def git(*a, inp=None): return subprocess.run(["git", *a], input=inp, capture_output=True, text=True, env=env, check=True).stdout
git("read-tree", commit)
def edit(path, pairs):
    s = git("show", f"{commit}:{path}")
    for old, new in pairs:
        assert s.count(old) == 1, (path, old[:60]); s = s.replace(old, new)
    h = git("hash-object", "-w", "--stdin", inp=s).strip()
    git("update-index", "--cacheinfo", f"100644,{h},{path}")
probe_mod = '''//! MEASUREMENT ONLY, never to land: machine-wide user-copy counters.
use core::sync::atomic::{AtomicU64, Ordering::Relaxed};
pub struct Bin { calls: AtomicU64, bytes: AtomicU64, ns: AtomicU64 }
impl Bin {
    const fn new() -> Self { Self { calls: AtomicU64::new(0), bytes: AtomicU64::new(0), ns: AtomicU64::new(0) } }
    pub fn add(&self, bytes: usize, began: u64) {
        self.calls.fetch_add(1, Relaxed);
        self.bytes.fetch_add(bytes as u64, Relaxed);
        self.ns.fetch_add(crate::clock::nanos_since_boot().saturating_sub(began), Relaxed);
    }
    fn show(&self) -> (u64, u64, u64) { (self.calls.load(Relaxed), self.bytes.load(Relaxed), self.ns.load(Relaxed)) }
}
pub static RD: Bin = Bin::new();
pub static WR: Bin = Bin::new();
pub static ZR: Bin = Bin::new();
pub static PF: Bin = Bin::new();
pub fn now() -> u64 { crate::clock::nanos_since_boot() }
pub struct Show;
impl core::fmt::Display for Show {
    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
        for (name, bin) in [("rd", &RD), ("wr", &WR), ("zr", &ZR), ("pf", &PF)] {
            let (c, b, n) = bin.show();
            write!(f, " cp_{name}={c}/{b}/{n}")?;
        }
        Ok(())
    }
}
'''
h = git("hash-object", "-w", "--stdin", inp=probe_mod).strip()
git("update-index", "--add", "--cacheinfo", f"100644,{h},kernel/src/copyprobe.rs")
main_rs = git("show", f"{commit}:kernel/src/main.rs")
anchor = "mod user_ptr;" if "\nmod user_ptr;" in main_rs else "pub mod user_ptr;"
edit("kernel/src/main.rs", [(f"\n{anchor}", f"\n{anchor}\nmod copyprobe;")])
edit("kernel/src/process.rs", [('''            self.syscall_total_ns / 1_000_000,
        )?;''', '''            self.syscall_total_ns / 1_000_000,
        )?;
        write!(f, "{}", crate::copyprobe::Show)?;''')])
if arm == "head":
    edit("kernel/src/user_ptr.rs", [
        ('''        let user = self.at("UserBytes::read", off, len);
        // SAFETY: the caller's `dst`; `at` keeps the user range in the half,
        // and `gate` holds no lock across the copy.
        whole(unsafe { uaccess::copy_from_user(dst, user, len) })''',
         '''        let user = self.at("UserBytes::read", off, len);
        let began = crate::copyprobe::now();
        // SAFETY: the caller's `dst`; `at` keeps the user range in the half,
        // and `gate` holds no lock across the copy.
        let left = unsafe { uaccess::copy_from_user(dst, user, len) };
        crate::copyprobe::RD.add(len, began);
        whole(left)'''),
        ('''        let user = self.at("UserBytesMut::write", off, len);
        // SAFETY: as `read_raw`.
        whole(unsafe { uaccess::copy_to_user(user, src, len) })''',
         '''        let user = self.at("UserBytesMut::write", off, len);
        let began = crate::copyprobe::now();
        // SAFETY: as `read_raw`.
        let left = unsafe { uaccess::copy_to_user(user, src, len) };
        crate::copyprobe::WR.add(len, began);
        whole(left)'''),
        ('''        let user = self.at("UserBytesMut::fill_zero", off, len);
        // SAFETY: as `read_raw`, with no kernel memory touched.
        whole(unsafe { uaccess::clear_user(user, len) })''',
         '''        let user = self.at("UserBytesMut::fill_zero", off, len);
        let began = crate::copyprobe::now();
        // SAFETY: as `read_raw`, with no kernel memory touched.
        let left = unsafe { uaccess::clear_user(user, len) };
        crate::copyprobe::ZR.add(len, began);
        whole(left)'''),
    ])
    edit("kernel/src/arch/x86_64/idt/exceptions.rs", [
        ('''fn user_copy_fault(frame: &mut TrapFrame, addr: u64, fixup: u64) {''',
         '''fn user_copy_fault(frame: &mut TrapFrame, addr: u64, fixup: u64) {
    let began = crate::copyprobe::now();
    user_copy_fault_inner(frame, addr, fixup);
    crate::copyprobe::PF.add(0, began);
}

fn user_copy_fault_inner(frame: &mut TrapFrame, addr: u64, fixup: u64) {'''),
    ])
else:
    edit("kernel/src/user_ptr.rs", [
        ('''    fn pieces(&self, what: &str, off: usize, len: usize, mut copy: impl FnMut(*mut u8, usize, usize)) {
''', '''    fn pieces(&self, what: &str, off: usize, len: usize, copy: impl FnMut(*mut u8, usize, usize)) {
        let began = crate::copyprobe::now();
        self.pieces_inner(what, off, len, copy);
        let bin = if what.ends_with("fill_zero") { &crate::copyprobe::ZR } else if matches!(self.access, Access::Read) { &crate::copyprobe::RD } else { &crate::copyprobe::WR };
        bin.add(len, began);
    }

    fn pieces_inner(&self, what: &str, off: usize, len: usize, mut copy: impl FnMut(*mut u8, usize, usize)) {
'''),
    ])
c = git("commit-tree", git("write-tree").strip(), "-p", commit, "-m", f"MEASUREMENT ONLY: machine-wide user-copy counters in every exit line ({arm})\n\nCo-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>").strip()
git("branch", "-f", branch, c)
print(branch, c)
