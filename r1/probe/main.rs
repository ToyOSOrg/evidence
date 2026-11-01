// After an exclusive flock is released, how do blocked shared waiters proceed?
use std::fs::{File, OpenOptions};
use std::os::unix::io::AsRawFd;
use std::sync::{Arc, Mutex};
use std::time::{Duration, Instant};
extern "C" { fn flock(fd: i32, op: i32) -> i32; }
const SH: i32 = 1; const EX: i32 = 2;
fn open(p: &str) -> File { OpenOptions::new().read(true).write(true).create(true).truncate(false).open(p).unwrap() }
fn lock(f: &File, op: i32) { assert_eq!(unsafe { flock(f.as_raw_fd(), op) }, 0); }
fn main() {
    let path = std::env::args().nth(1).unwrap();
    if std::env::args().nth(2).as_deref() == Some("child") {
        let hold: u64 = std::env::args().nth(3).unwrap().parse().unwrap();
        let f = open(&path); lock(&f, SH);
        println!("granted"); std::thread::sleep(Duration::from_millis(hold)); return;
    }
    let procs = std::env::args().nth(2).as_deref() == Some("procs");
    let ex = open(&path); lock(&ex, EX);
    let t0 = Instant::now();
    let log = Arc::new(Mutex::new(Vec::new()));
    let mut hs = vec![];
    for i in 0..4u64 {
        let (p, log) = (path.clone(), log.clone());
        let hold = 400 * (i + 1);
        hs.push(std::thread::spawn(move || {
            if procs {
                let out = std::process::Command::new(std::env::current_exe().unwrap()).args([&p, "child", &hold.to_string()]).stdout(std::process::Stdio::piped()).spawn().unwrap();
                let mut s = String::new(); use std::io::Read; let mut o = out.stdout.unwrap(); let mut b=[0u8;8]; o.read_exact(&mut b).unwrap(); s.push_str("x");
                log.lock().unwrap().push(format!("{:>5} ms granted (holds {hold} ms)", t0.elapsed().as_millis()));
                let _ = o.read_to_end(&mut vec![]);
            } else {
                let f = open(&p); lock(&f, SH);
                log.lock().unwrap().push(format!("{:>5} ms granted (holds {hold} ms)", t0.elapsed().as_millis()));
                std::thread::sleep(Duration::from_millis(hold));
            }
        }));
        std::thread::sleep(Duration::from_millis(50));
    }
    std::thread::sleep(Duration::from_millis(500));
    println!("{:>5} ms exclusive released", t0.elapsed().as_millis());
    drop(ex);
    std::thread::sleep(Duration::from_millis(100));
    let fresh = open(&path);
    let nb = unsafe { flock(fresh.as_raw_fd(), SH | 4) } == 0;
    println!("{:>5} ms a fresh non-blocking shared try {}", t0.elapsed().as_millis(), if nb { "succeeds" } else { "fails" });
    drop(fresh);
    for h in hs { h.join().unwrap(); }
    for l in log.lock().unwrap().iter() { println!("{l}"); }
}
