
/// Diagnostic, measurement branch only: the diary between [`start`] and
/// [`Ran::seen`], read per thread.
#[cfg(target_os = "toyos")]
pub struct Seen {
    entries: Vec<toyos_trace::Entry>,
    lost: u64,
    names: std::collections::BTreeMap<u32, String>,
    apics: std::collections::BTreeMap<u32, u32>,
}

#[cfg(target_os = "toyos")]
impl Seen {
    fn llc(&self, cpu: u32) -> Option<u32> {
        self.apics.get(&cpu).and_then(|&apic| crate::arch::llc_of_apic(apic))
    }

    /// One thread: the CPUs it was picked on as `cpu*picks`, most first; its
    /// migrations, all and across an LLC; and its wakes by their waker's CPU
    /// (the record's data, the waker plus one, which only a kernel naming
    /// wakers writes): none named, in the LLC that took the wake, in another.
    /// `c10*40+2*3_m1-1_w0-5-2`.
    pub fn thread(&self, pid: u32, tid: u32) -> String {
        let mut picks: std::collections::BTreeMap<u16, u64> = Default::default();
        let (mut moved, mut crossed, mut none, mut near, mut far) = (0u64, 0u64, 0u64, 0u64, 0u64);
        for entry in &self.entries {
            if entry.thread != Some(toyos_trace::Thread { pid, tid }) {
                continue;
            }
            match entry.event {
                toyos_trace::Event::Pick => *picks.entry(entry.cpu).or_default() += 1,
                toyos_trace::Event::Migrate { to } => {
                    moved += 1;
                    crossed += u64::from(self.llc(u32::from(entry.cpu)) != self.llc(to));
                }
                toyos_trace::Event::Wake { waker: 0 } => none += 1,
                toyos_trace::Event::Wake { waker } => {
                    if self.llc(waker - 1) == self.llc(u32::from(entry.cpu)) {
                        near += 1;
                    } else {
                        far += 1;
                    }
                }
                _ => {}
            }
        }
        let mut cpus: Vec<(u16, u64)> = picks.into_iter().collect();
        cpus.sort_by(|a, b| b.1.cmp(&a.1));
        let cpus: Vec<String> = cpus.iter().map(|(cpu, n)| format!("{cpu}*{n}")).collect();
        format!("c{}_m{moved}-{crossed}_w{none}-{near}-{far}", cpus.join("+"))
    }

    /// The CPU `pid`'s `tid` was picked on most, if it was.
    pub fn home(&self, pid: u32, tid: u32) -> Option<u32> {
        let mut picks: std::collections::BTreeMap<u16, u64> = Default::default();
        for entry in &self.entries {
            if entry.thread == Some(toyos_trace::Thread { pid, tid }) && entry.event == toyos_trace::Event::Pick {
                *picks.entry(entry.cpu).or_default() += 1;
            }
        }
        picks.into_iter().max_by_key(|&(_, n)| n).map(|(cpu, _)| u32::from(cpu))
    }

    /// Every other process picked on a CPU of the cores `cpus` are on, as
    /// `name.pid@cpu*picks`, most first, at most [`LISTED`]: `-` for none.
    pub fn others_on(&self, pid: u32, cpus: &[u32]) -> String {
        let cores: Vec<u32> = cpus.iter().map(|&cpu| crate::sys::core_of(cpu)).collect();
        let mut picks: std::collections::BTreeMap<(u32, u16), u64> = Default::default();
        for entry in &self.entries {
            if let (toyos_trace::Event::Pick, Some(thread)) = (entry.event, entry.thread) {
                if thread.pid != pid && cores.contains(&crate::sys::core_of(u32::from(entry.cpu))) {
                    *picks.entry((thread.pid, entry.cpu)).or_default() += 1;
                }
            }
        }
        let mut listed: Vec<((u32, u16), u64)> = picks.into_iter().collect();
        listed.sort_by(|a, b| b.1.cmp(&a.1));
        let listed: Vec<String> = listed
            .iter()
            .take(LISTED)
            .map(|&((other, cpu), n)| {
                let name = self.names.get(&other).map_or_else(|| "?".to_string(), |n| n.replace([' ', ',', '@', ':', '.', '_', '~', '+', '*'], "-"));
                format!("{name}.{other}@{cpu}*{n}")
            })
            .collect();
        if listed.is_empty() { "-".to_string() } else { listed.join("+") }
    }

    pub fn lost(&self) -> u64 {
        self.lost
    }
}
