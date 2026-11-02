"""Apply ab9's shared diagnostic to the ToyOS tree at argv[1]. Measurement only; never lands."""
import sys, os
root = sys.argv[1]
here = os.path.dirname(os.path.abspath(__file__))

def edit(rel, old, new, count=1):
    p = os.path.join(root, rel)
    s = open(p).read()
    assert s.count(old) == count, f"{rel}: expected {count} of {old[:60]!r}, found {s.count(old)}"
    open(p, 'w').write(s.replace(old, new))

# The diary decoder carries Wake's data: the waker's CPU plus one, 0 for none named.
edit('lib/trace/src/lib.rs', "    Wake,\n    Park,", "    Wake { waker: u32 },\n    Park,")
edit('lib/trace/src/lib.rs', "Self::Pick | Self::Wake | Self::Park", "Self::Pick | Self::Wake { .. } | Self::Park")
edit('lib/trace/src/lib.rs', "            Self::Wake => \"wake\",", "            Self::Wake { .. } => \"wake\",")
edit('lib/trace/src/lib.rs', "            Kind::Wake => Event::Wake,", "            Kind::Wake => Event::Wake { waker: raw.data },")
edit('lib/trace/src/lib.rs', "            | Event::Wake\n", "            | Event::Wake { .. }\n")
edit('lib/trace/src/lib.rs', "assert_eq!(entry.event, Event::Wake);", "assert_eq!(entry.event, Event::Wake { waker: 0 });")
edit('tests/guest/rust-tests/src/bin/trace_read.rs', "            Event::Wake => {", "            Event::Wake { .. } => {")
edit('tests/guest/osbench/src/sys/toyos.rs', "            Event::Wake => \"wake\",", "            Event::Wake { .. } => \"wake\",")

# ran.rs: the per-thread reader.
seen = open(os.path.join(here, 'ran_seen.rs')).read()
edit('tests/guest/osbench/src/ran.rs', "impl Ran {\n", """impl Ran {
    /// Diagnostic, measurement branch only: the span's diary, ending it.
    #[cfg(target_os = "toyos")]
    pub fn seen(self) -> Option<Seen> {
        let mut d = self.diag?;
        let (entries, lost, failed) = d.diary();
        if failed.is_some() {
            return None;
        }
        let names = d.roster().into_iter().map(|((pid, _), (name, _))| (pid, name)).collect();
        let apics = d.counters().unwrap_or_default().into_iter().map(|c| (c.cpu, c.apic)).collect();
        Some(Seen { entries: entries.into_iter().map(|(_, e)| e).collect(), lost, names, apics })
    }

""")
p = os.path.join(root, 'tests/guest/osbench/src/ran.rs')
open(p, 'a').write(seen)
edit('tests/guest/osbench/src/ran.rs', "pub fn start() -> Ran {", """/// Diagnostic, measurement branch only: one thread of this process over a
/// span, as [`Seen::thread`] reads it, with the span's lost records.
pub fn thread_over(span: Ran, tid: crate::sys::Tid) -> String {
    #[cfg(target_os = "toyos")]
    {
        let Some(seen) = span.seen() else { return "-".to_string() };
        format!("{}_l{}", seen.thread(std::process::id(), tid as u32), seen.lost())
    }
    #[cfg(not(target_os = "toyos"))]
    {
        let _ = (span, tid);
        "-".to_string()
    }
}

/// Diagnostic, measurement branch only: one pipe round, `mbps~R_<reader>~W_<writer>~o_<others on their cores>~l<lost>`.
pub fn pipe_round(span: Ran, mbps: u64, reader: crate::sys::Tid, writer: crate::sys::Tid) -> String {
    #[cfg(target_os = "toyos")]
    {
        let Some(seen) = span.seen() else { return format!("{mbps}~-") };
        let pid = std::process::id();
        let (r, w) = (reader as u32, writer as u32);
        let homes: Vec<u32> = [seen.home(pid, r), seen.home(pid, w)].into_iter().flatten().collect();
        format!("{mbps}~R_{}~W_{}~o_{}~l{}", seen.thread(pid, r), seen.thread(pid, w), seen.others_on(pid, &homes), seen.lost())
    }
    #[cfg(not(target_os = "toyos"))]
    {
        let _ = (span, reader, writer);
        mbps.to_string()
    }
}

pub fn start() -> Ran {""")

# pipe.throughput: every round, the warmup first, in a `rounds` field.
edit('tests/guest/osbench/src/system.rs', """    let bench = format!("pipe.throughput.{size}");
    let round = || -> std::io::Result<u64> {
        let (mut reader, mut writer) = std::io::pipe()?;
        let writing = thread::spawn(move || -> std::io::Result<()> {""", """    let bench = format!("pipe.throughput.{size}");
    let rounds = std::cell::RefCell::new(Vec::new());
    let round = || -> std::io::Result<u64> {
        let span = crate::ran::start();
        let (mut reader, mut writer) = std::io::pipe()?;
        let writing = thread::spawn(move || -> std::io::Result<sys::Tid> {""")
edit('tests/guest/osbench/src/system.rs', """                for _ in 0..64 {
                    writer.write_all(&chunk)?;
                }
            }
            Ok(())
        });""", """                for _ in 0..64 {
                    writer.write_all(&chunk)?;
                }
            }
            Ok(sys::tid())
        });""")
edit('tests/guest/osbench/src/system.rs', """        let ns = ns_since(start).max(1);
        writing.join().expect("the writer panicked")?;
        Ok(bytes * 1000 / ns)""", """        let ns = ns_since(start).max(1);
        let writer_tid = writing.join().expect("the writer panicked")?;
        let mbps = bytes * 1000 / ns;
        rounds.borrow_mut().push(crate::ran::pipe_round(span, mbps, sys::tid(), writer_tid));
        Ok(mbps)""")
edit('tests/guest/osbench/src/system.rs', """        Ok(mut mbps) => result(&bench, "MB/s", &mut mbps, &[("write_bytes", size.to_string())]),""",
     """        Ok(mut mbps) => result(&bench, "MB/s", &mut mbps, &[("write_bytes", size.to_string()), ("rounds", rounds.borrow().join(","))]),""")

# thread.spawn_join: the joining thread over the row.
edit('tests/guest/osbench/src/system.rs', """pub fn thread_spawn() {
    let once = || {""", """pub fn thread_spawn() {
    let span = crate::ran::start();
    let once = || {""")
edit('tests/guest/osbench/src/system.rs', """    result("thread.spawn_join", "ns", &mut ns, &[]);""",
     """    result("thread.spawn_join", "ns", &mut ns, &[("parent", crate::ran::thread_over(span, sys::tid()))]);""")

# work.build_shaped: the parent over each row.
edit('tests/guest/osbench/src/work.rs', """        let bench = format!("work.build_shaped.j{jobs}");
        let build = ||""", """        let bench = format!("work.build_shaped.j{jobs}");
        let span = crate::ran::start();
        let build = ||""")
edit('tests/guest/osbench/src/work.rs', """            Ok(mut ns) => result(&bench, "ns", &mut ns, &[("files", FILES.to_string()), ("jobs", jobs.to_string())]),""",
     """            Ok(mut ns) => result(
                &bench,
                "ns",
                &mut ns,
                &[
                    ("files", FILES.to_string()),
                    ("jobs", jobs.to_string()),
                    ("parent", crate::ran::thread_over(span, crate::sys::tid())),
                ],
            ),""")
print("diag applied to", root)
