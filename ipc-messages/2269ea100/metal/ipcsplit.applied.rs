//! Measurement only, never lands: the IPC syscalls' kernel bodies split by
//! the profile kernel's marks (`scout-ipc-marks`). Each thread's syscall is a
//! span from its entry mark to its exit mark; every mark between, on any CPU,
//! is a step of it, and each step's delta is printed as
//! `note=ipcsplit.<row>.<side>.<syscall>.<from>-<to>` with its p10, p50 and
//! p90 in nanoseconds.

use std::collections::BTreeMap;

use toyos_trace::{Entry, Event};

use crate::report::{note, refuse};
use crate::sys::ipc;

const SYS_ENTER: u32 = 1;
const SYS_EXIT: u32 = 2;

fn mark_name(code: u32) -> String {
    match code {
        1 => "enter".into(),
        2 => "exit".into(),
        3 => "kick_begin".into(),
        4 => "kick_end".into(),
        8 => "resumed".into(),
        10 => "resolved".into(),
        11 => "queued".into(),
        12 => "posted".into(),
        13 => "taken".into(),
        14 => "recv_done".into(),
        15 => "parking".into(),
        16 => "post_enter".into(),
        17 => "delivered".into(),
        n => format!("m{n}"),
    }
}

fn syscall_name(num: u32) -> String {
    use toyos_abi::syscall::*;
    match u64::from(num) {
        SYS_MESSAGE_SEND => "send".into(),
        SYS_MESSAGE_RECV => "recv".into(),
        SYS_MESSAGE_CALL => "call".into(),
        SYS_INBOX_SUBMIT => "inbox".into(),
        n => format!("sys{n}"),
    }
}

const BATCH: usize = 100;
const BATCHES: usize = 10;

/// Every span in `entries`: per thread, the marks from an enter to the exit of
/// the same syscall. `me` names the measuring process, the client side.
fn split(entries: &[Entry], me: u32, row: &str, segs: &mut BTreeMap<String, Vec<u64>>) {
    let mut open: BTreeMap<(u32, u32), (u32, Vec<(u32, u64)>)> = BTreeMap::new();
    let mut sorted: Vec<&Entry> = entries.iter().collect();
    sorted.sort_by_key(|e| e.stamp);
    for e in sorted {
        let Event::Mark { index } = e.event else { continue };
        let Some(thread) = e.thread else { continue };
        let key = (thread.pid, thread.tid);
        let (code, arg) = (index >> 24, index & 0x00FF_FFFF);
        match code {
            SYS_ENTER => {
                open.insert(key, (arg, vec![(SYS_ENTER, e.stamp)]));
            }
            SYS_EXIT => {
                let Some((num, mut marks)) = open.remove(&key) else { continue };
                if num != arg {
                    continue;
                }
                marks.push((SYS_EXIT, e.stamp));
                let side = if thread.pid == me { "client" } else { "server" };
                let base = format!("{row}.{side}.{}", syscall_name(num));
                for w in marks.windows(2) {
                    let name = format!("{base}.{}-{}", mark_name(w[0].0), mark_name(w[1].0));
                    segs.entry(name).or_default().push(w[1].1.saturating_sub(w[0].1));
                }
                segs.entry(format!("{base}.total")).or_default().push(e.stamp.saturating_sub(marks[0].1));
            }
            _ => {
                if let Some((_, marks)) = open.get_mut(&key) {
                    marks.push((code, e.stamp));
                }
            }
        }
    }
}

fn report(segs: BTreeMap<String, Vec<u64>>) {
    let page = toyos_abi::clock::page();
    let ns = |t: u64| toyos_abi::clock::ticks_to_nanos(t, page.period_fs);
    for (name, mut v) in segs {
        v.sort_unstable();
        let p = |q: usize| ns(v[(v.len() - 1) * q / 100]);
        note(
            &format!("ipcsplit.{name}"),
            &[("n", v.len().to_string()), ("p10_ns", p(10).to_string()), ("p50_ns", p(50).to_string()), ("p90_ns", p(90).to_string())],
        );
    }
}

pub fn suite() {
    let Some(mut diag) = crate::sys::diag::open().filter(|d| d.has_diary()) else { return refuse("ipcsplit", "no diary") };
    let me = std::process::id();
    let mut segs = BTreeMap::new();
    let mut lost = 0;

    // ipc.reqrep.8's exchange.
    let exe = match std::env::current_exe() {
        Ok(exe) => exe,
        Err(e) => return refuse("ipcsplit", format!("no path to this program: {e}")),
    };
    let (mut child, peer) = match ipc::start_server(&exe) {
        Ok(pair) => pair,
        Err(e) => return refuse("ipcsplit", format!("the server would not start: {e}")),
    };
    let rounds = (BATCH * BATCHES + 200) as u32;
    if let Err(e) = crate::ipc::control(&peer, 8, rounds, 0) {
        return refuse("ipcsplit", e);
    }
    let buf = [0x42u8; 8];
    let mut reply = [0u8; 8];
    for _ in 0..200 {
        if let Err(e) = peer.call(&buf, &mut reply) {
            return refuse("ipcsplit", e);
        }
    }
    for _ in 0..BATCHES {
        let _ = diag.diary();
        for _ in 0..BATCH {
            if let Err(e) = peer.call(&buf, &mut reply) {
                return refuse("ipcsplit", e);
            }
        }
        let (entries, l, _) = diag.diary();
        lost += l;
        let entries: Vec<Entry> = entries.into_iter().map(|(_, e)| e).collect();
        split(&entries, me, "reqrep8", &mut segs);
    }
    let _ = crate::ipc::control(&peer, 0, 0, 0);
    let _ = child.wait();

    // The file server's seek, straight through its client.
    if let Some(names) = toyos::endow::namespace() {
        if let Ok(mut dir) = toyos::fs::Dir::connect(names, "fs:/home") {
            if let Ok(opened) = dir.open(toyos::fs::Base::Root, "ipcsplit", toyos::fs::O_READ | toyos::fs::O_WRITE | toyos::fs::O_CREATE) {
                for _ in 0..BATCHES {
                    let _ = diag.diary();
                    for i in 0..BATCH {
                        let _ = dir.seek(opened.fid, toyos::fs::SEEK_START, (i * 4096) as i64);
                    }
                    let (entries, l, _) = diag.diary();
                    lost += l;
                    let entries: Vec<Entry> = entries.into_iter().map(|(_, e)| e).collect();
                    split(&entries, me, "fsseek", &mut segs);
                }
                dir.close(opened.fid);
            }
        }
    }
    note("ipcsplit", &[("lost", lost.to_string())]);
    report(segs);
}
