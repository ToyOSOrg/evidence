"""ab11, on top of apply_diag.py: wake.storm rows carry where their waiters live. Measurement only; never lands."""
import sys
root = sys.argv[1]
def edit(rel, old, new):
    p = f'{root}/{rel}'; s = open(p).read()
    assert s.count(old) == 1, (rel, old[:60]); open(p, 'w').write(s.replace(old, new))
edit('tests/guest/osbench/src/ran.rs', "pub fn start() -> Ran {", '''/// Diagnostic, measurement branch only: where `tids` of this process live
/// over a span, each its most-picked CPU, as `cpu*threads` most first with
/// `_max<most on one CPU>_l<lost>`.
pub fn homes_over(span: Ran, tids: &[crate::sys::Tid]) -> String {
    #[cfg(target_os = "toyos")]
    {
        let Some(seen) = span.seen() else { return "-".to_string() };
        let pid = std::process::id();
        let mut on: std::collections::BTreeMap<u32, u32> = Default::default();
        for &tid in tids {
            if let Some(cpu) = seen.home(pid, tid as u32) {
                *on.entry(cpu).or_default() += 1;
            }
        }
        let mut listed: Vec<(u32, u32)> = on.into_iter().collect();
        listed.sort_by(|a, b| b.1.cmp(&a.1));
        let most = listed.first().map_or(0, |&(_, n)| n);
        let cpus: Vec<String> = listed.iter().map(|(cpu, n)| format!("{cpu}*{n}")).collect();
        format!("{}_max{most}_l{}", cpus.join("+"), seen.lost())
    }
    #[cfg(not(target_os = "toyos"))]
    {
        let _ = (span, tids);
        "-".to_string()
    }
}

pub fn start() -> Ran {''')
edit('tests/guest/osbench/src/wake.rs', """    let mut waiters = Vec::new();
    for width in WIDTHS {
        while waiters.len() < width as usize {
            waiters.push(thread::spawn(|| {
                let mut seen = WORD.load(Ordering::Acquire);""", """    let mut waiters = Vec::new();
    static TIDS: std::sync::Mutex<Vec<sys::Tid>> = std::sync::Mutex::new(Vec::new());
    for width in WIDTHS {
        let span = crate::ran::start();
        while waiters.len() < width as usize {
            waiters.push(thread::spawn(|| {
                TIDS.lock().expect("the waiters' ids").push(sys::tid());
                let mut seen = WORD.load(Ordering::Acquire);""")
edit('tests/guest/osbench/src/wake.rs', """                result(&bench("call"), "ns", &mut call, &[]);
                result(&bench("drain"), "ns", &mut drain, &[]);""", """                let homes = crate::ran::homes_over(span, &TIDS.lock().expect("the waiters' ids"));
                result(&bench("call"), "ns", &mut call, &[]);
                result(&bench("drain"), "ns", &mut drain, &[("homes", homes)]);""")
print("storm diag applied to", root)
