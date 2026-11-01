# Measurement only, never lands: the copies of a whole message, split.
def edit(p, pairs):
    s=open(p).read()
    for old,new in pairs:
        assert s.count(old)==1, (p, old[:70]); s=s.replace(old,new)
    open(p,'w').write(s)
M='crate::trace::scout::mark(crate::trace::scout::{}, 0);'
def mk(c, ind): return f'{ind}#[cfg(feature = "scout-ipc-marks")]\n{ind}'+M.format(c)+'\n'
edit('kernel/Cargo.toml',[('heap-lockspin = ["pass-spin"]\n','heap-lockspin = ["pass-spin"]\n# Measurement only, never lands: diary marks around a message\'s copies.\nscout-ipc-marks = []\n')])
edit('kernel/src/trace.rs',[('pub fn trace(kind: Kind, data: u32) {\n    push(kind, None, data);\n}\n','''pub fn trace(kind: Kind, data: u32) {
    push(kind, None, data);
}

/// Measurement only, never lands: `osbench ipccopy` decodes these codes.
#[cfg(feature = "scout-ipc-marks")]
pub mod scout {
    pub const SYS_ENTER: u32 = 1;
    pub const SYS_EXIT: u32 = 2;
    pub const RESUMED: u32 = 8;
    pub const COPY_IN: u32 = 20;
    pub const COPIED_IN: u32 = 21;
    pub const COPY_OUT: u32 = 22;
    pub const COPIED_OUT: u32 = 23;

    #[inline]
    pub fn mark(code: u32, arg: u32) {
        super::trace(super::Kind::Mark, code << 24 | (arg & 0x00FF_FFFF));
    }

    pub fn marked(num: u64) -> bool {
        use toyos_abi::syscall::*;
        matches!(num, SYS_MESSAGE_SEND | SYS_MESSAGE_RECV)
    }
}
''')])
edit('kernel/src/syscall/dispatch.rs',[
('''    let entered = crate::arch::cpu::counter();
''','''    let entered = crate::arch::cpu::counter();
    #[cfg(feature = "scout-ipc-marks")]
    let scouted = crate::trace::scout::marked(num);
    #[cfg(feature = "scout-ipc-marks")]
    if scouted {
        crate::trace::scout::mark(crate::trace::scout::SYS_ENTER, num as u32);
    }
'''),
('''    crate::sched::driver::note_syscall(num, elapsed);
''','''    crate::sched::driver::note_syscall(num, elapsed);
    #[cfg(feature = "scout-ipc-marks")]
    if scouted {
        crate::trace::scout::mark(crate::trace::scout::SYS_EXIT, num as u32);
    }
'''),
])
s=open('kernel/src/sched/driver.rs').read()
s=s.replace('''    execute(action);
    crate::preempt::enable_no_resched();''','''    execute(action);
    #[cfg(feature = "scout-ipc-marks")]
    crate::trace::scout::mark(crate::trace::scout::RESUMED, 0);
    crate::preempt::enable_no_resched();''')
open('kernel/src/sched/driver.rs','w').write(s)
edit('kernel/src/message.rs',[
('''        if state.bytes.write(bytes, bytes.len()).is_err() {''',mk('COPY_IN','        ')+'''        let wrote = state.bytes.write(bytes, bytes.len());
'''+mk('COPIED_IN','        ')+'''        if wrote.is_err() {'''),
('''                    bytes.read(buf, head.len);''',mk('COPY_OUT','                    ')+'''                    bytes.read(buf, head.len);
'''+mk('COPIED_OUT','                    ').rstrip('\n')),
])
edit('tests/guest/osbench/src/sys/toyos.rs',[
('''        fn take(&self, buf: &mut [u8]) -> io::Result<usize> {
            let mut rx = self.1.borrow_mut();
            let frame = rx.recv(&self.0).map_err(|e| failed("receive", e))?;
            Ok(copy(rx.payload(frame.payload_len), buf))
        }''','''        fn take(&self, buf: &mut [u8]) -> io::Result<usize> {
            let mut rx = self.1.borrow_mut();
            let frame = rx.recv(&self.0).map_err(|e| failed("receive", e))?;
            let t = std::time::Instant::now();
            let n = copy(rx.payload(frame.payload_len), buf);
            USER_COPY_NS.fetch_add(t.elapsed().as_nanos() as u64, std::sync::atomic::Ordering::Relaxed);
            USER_COPIES.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
            Ok(n)
        }'''),
('''    /// As much of `from` as `to` holds, at its front.''','''    /// Measurement only: the time this process spent copying frames out of
    /// its receive buffer, and how many.
    pub static USER_COPY_NS: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    pub static USER_COPIES: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);

    /// As much of `from` as `to` holds, at its front.'''),
])
import shutil
shutil.copy('<scratch>/r4/ipccopy.rs','tests/guest/osbench/src/ipccopy.rs')
edit('tests/guest/osbench/src/main.rs',[
('mod ipc;\n','mod ipc;\nmod ipccopy;\n'),
('const BY_NAME: [(&str, fn()); 2] = [("lan", lan::suite), ("internet", internet::suite)];','const BY_NAME: [(&str, fn()); 3] = [("lan", lan::suite), ("internet", internet::suite), ("ipccopy", ipccopy::suite)];'),
])
edit('tests/guest/osbench/src/ipc.rs',[('\nfn control(peer: &Peer','\npub(crate) fn control(peer: &Peer')])
edit('tests/images/benchcase.toml',[('"bin/osbench_persist" = "/system/bin/osbench"\n','"bin/osbench_persist" = "/system/bin/osbench"\n"bin/osbench_ipccopy" = "/system/bin/osbench"\n')])
edit('tests/toyos.rs',[
('''const BENCHCASE: &[metal::Arm] = &[metal::Arm {''','''/// Measurement only, never lands.
const IPCCOPY: &[metal::Arm] = &[metal::Arm {
    features: &["scout-ipc-marks"],
    adds_ms: 120_000,
    named_only: true,
    ..metal::once("ipccopy", "tests/images/benchcase.toml", &[], &["osbench_ipccopy"])
}];

const BENCHCASE: &[metal::Arm] = &[metal::Arm {'''),
('''    // ---- one image: tests/images/benchcase.toml, `osbench`'s ToyOS half ----
    (''','''    // ---- one image: tests/images/benchcase.toml, `osbench`'s ToyOS half ----
    // Measurement only, never lands.
    (
        "ipccopy",
        metal::Metal { arms: IPCCOPY, judge: |b| osbench_ran(b[0], &["osbench_ipccopy"]) },
    ),
    ('''),
])
