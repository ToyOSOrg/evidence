//! Scratch probe (not committed): where a `Command` spawn of a std program goes.
#[cfg(target_os = "toyos")]
pub fn run() {
    use std::os::toyos::process::CommandExt;
    use std::process::{Command, Stdio};
    use std::time::Instant;
    let exe = std::env::current_exe().expect("exe");
    let med = |name: &str, mut f: Box<dyn FnMut() -> u64>| {
        for _ in 0..5 { f(); }
        let mut v: Vec<u64> = (0..40).map(|_| f()).collect();
        v.sort();
        println!("probe {name} p50={}us min={}us max={}us", v[20] / 1000, v[0] / 1000, v[39] / 1000);
    };
    let e = exe.clone();
    med("fs_read_exe", Box::new(move || { let t = Instant::now(); let b = std::fs::read(&e).unwrap(); assert!(b.len() > 0); t.elapsed().as_nanos() as u64 }));
    let e = exe.clone();
    med("prepare_exe", Box::new(move || {
        let mut c = Command::new(&e);
        c.arg("nop").stdin(Stdio::null()).stdout(Stdio::null()).stderr(Stdio::null());
        let t = Instant::now(); c.prepare().unwrap(); t.elapsed().as_nanos() as u64 }));
    let e = exe.clone();
    med("spawn_prepared_exe", Box::new(move || {
        let mut c = Command::new(&e);
        c.arg("nop").stdin(Stdio::null()).stdout(Stdio::null()).stderr(Stdio::null());
        c.prepare().unwrap();
        let t = Instant::now(); let mut ch = c.spawn().unwrap(); let s = t.elapsed().as_nanos() as u64;
        ch.wait().unwrap(); s }));
    let e = exe.clone();
    med("wait_prepared_exe", Box::new(move || {
        let mut c = Command::new(&e);
        c.arg("nop").stdin(Stdio::null()).stdout(Stdio::null()).stderr(Stdio::null());
        c.prepare().unwrap();
        let mut ch = c.spawn().unwrap();
        let t = Instant::now(); ch.wait().unwrap(); t.elapsed().as_nanos() as u64 }));
    let e = exe.clone();
    med("status_exe", Box::new(move || {
        let t = Instant::now();
        Command::new(&e).arg("nop").stdin(Stdio::null()).stdout(Stdio::null()).stderr(Stdio::null()).status().unwrap();
        t.elapsed().as_nanos() as u64 }));
}
#[cfg(not(target_os = "toyos"))]
pub fn run() {}
